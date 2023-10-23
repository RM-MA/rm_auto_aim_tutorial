/*
@brief: �������� ����¾���rm_vision
@author: CodeAlan  ����ʦ��Vanguardս��
*/
// ����ֻ����ˮƽ����Ŀ�������



//TODO ��������ģ��
//TODO ����Ӣ�ۻ����˵�������

#include <math.h>
#include <stdio.h>

#include "algorithm_SolveTrajectory.h"

struct SolveTrajectoryParams st;
struct tar_pos tar_position[4]; //���ֻ���Ŀ�װ�װ�
float t = 0.5f; // ����ʱ��



/*
@brief �����������������ģ��
@param s:m ����
@param v:m/s �ٶ�
@param angle:rad �Ƕ�
@return z:m
*/
float monoDirectionalAirResistanceModel(float s, float v, float angle)
{
    float  z;
    //tΪ����v��angleʱ�ķ���ʱ��
    t = (float)((exp(st.k * s) - 1) / (st.k * v * cos(angle)));
    //zΪ����v��angleʱ�ĸ߶�
    z = (float)(v * sin(angle) * t - GRAVITY * t * t / 2);
    //printf("model %f %f\n", t, z);
    return z;
}


/*
@brief ��������ģ��
@param s:m ����
@param v:m/s �ٶ�
@param angle:rad �Ƕ�
@return z:m
*/
//TODO ��������ģ��
float completeAirResistanceModel(float s, float v, float angle)
{
    


}



/*
@brief pitch�����
@param s:m ����
@param z:m �߶�
@param v:m/s
@return angle_pitch:rad
*/
float pitchTrajectoryCompensation(float s, float z, float v)
{
    float z_temp, z_actual, dz;
    float angle_pitch;
    int i = 0;
    z_temp = z;
    // iteration
    for (i = 0; i < 20; i++)
    {
        angle_pitch = atan2(z_temp, s); // rad
        z_actual = monoDirectionalAirResistanceModel(s, v, angle_pitch);
        dz = 0.3*(z - z_actual);
        z_temp = z_temp + dz;
       // printf("iteration num %d: angle_pitch %f, temp target z:%f, err of z:%f, s:%f\n",
        //    i + 1, angle_pitch * 180 / PI, z_temp, dz,s);
        if (fabsf(dz) < 0.00001)
        {
            break;
        }
    }
    return angle_pitch;
}

/*
@brief �������ž��ߵó�������װ�װ� �Զ����㵯��
@param pitch:rad  ����pitch
@param yaw:rad    ����yaw
@param aim_x:����aim_x  ���Ŀ���x
@param aim_y:����aim_y  ���Ŀ���y
@param aim_z:����aim_z  ���Ŀ���z
*/
void autoSolveTrajectory(Visual_New_Receive_Data_t *New_Visusal,Visual_Caculate_Data*AIM_data)
{
    float a,b,c;
	  //New_Visusal->New_Visual_Yaw += 1;
    // ����Ԥ��
    float timeDelay = st.bias_time/1000.0 + t;
	
	  AIM_data->Visual_Caculate_yaw=New_Visusal->yaw;
	
	
    AIM_data->Visual_Caculate_yaw= New_Visusal->v_yaw * timeDelay;

    //�����Ŀ�װ�װ��λ��
    //װ�װ�id˳�����Ŀ�װ�װ�Ϊ������ʱ����
    //      2
    //   3     1
    //      0
	int use_1 = 1;
	int i = 0;
    int idx = 0; // ѡ���װ�װ�
    //armor_num = ARMOR_NUM_BALANCE Ϊƽ�ⲽ��
    if (st.armor_num == ARMOR_NUM_BALANCE) {
        for (i = 0; i<2; i++) {
            float tmp_yaw = st.tar_yaw + i * PI;
            float r = st.r1;
            tar_position[i].x = st.xw - r*cos(tmp_yaw);
            tar_position[i].y = st.yw - r*sin(tmp_yaw);
            tar_position[i].z = st.zw;
            tar_position[i].yaw = tmp_yaw;
        }

        float yaw_diff_min = fabsf(New_Visusal->New_Visual_Yaw - tar_position[0].yaw);

        //��Ϊ��ƽ�ⲽ�� ֻ���ж�����װ�װ弴��
        float temp_yaw_diff = fabsf(New_Visusal->New_Visual_Yaw - tar_position[1].yaw);
        if (temp_yaw_diff < yaw_diff_min)
        {
            yaw_diff_min = temp_yaw_diff;
            idx = 1;
        }


    } else if (st.armor_num == ARMOR_NUM_OUTPOST) {  //ǰ��վ
        for (i = 0; i<3; i++) {
            float tmp_yaw = st.tar_yaw + i * 2.0 * PI/3.0;  // 2/3PI
            float r =  (st.r1 + st.r2)/2;   //������r1=r2 ����ȡ��ƽ��ֵ
            tar_position[i].x = st.xw - r*cos(tmp_yaw);
            tar_position[i].y = st.yw - r*sin(tmp_yaw);
            tar_position[i].z = st.zw;
            tar_position[i].yaw = tmp_yaw;
        }

        //TODO ѡ������װ�װ� ѡ���߼������Լ�д�����һ���Ӣ����


    } else {

        for (i = 0; i<4; i++) {
            float tmp_yaw = New_Visusal->yaw + i * PI/2.0;
            float r = use_1 ? st.r1 : st.r2;
            tar_position[i].x = New_Visusal->Aim_x - r*cos(tmp_yaw);
            tar_position[i].y = New_Visusal->Aim_y - r*sin(tmp_yaw);
            tar_position[i].z = use_1 ? New_Visusal->Aim_z : New_Visusal->Aim_z + New_Visusal->dz;
            tar_position[i].yaw = tmp_yaw;
            use_1 = !use_1;
        }

            //2�ֳ������߷�����
            //1.����ǹ�ܵ�Ŀ��װ�װ�yaw��С���Ǹ�װ�װ�
            //2.������������װ�װ�

            //������������װ�װ�
        //	float dis_diff_min = sqrt(tar_position[0].x * tar_position[0].x + tar_position[0].y * tar_position[0].y);
        //	int idx = 0;
        //	for (i = 1; i<4; i++)
        //	{
        //		float temp_dis_diff = sqrt(tar_position[i].x * tar_position[0].x + tar_position[i].y * tar_position[0].y);
        //		if (temp_dis_diff < dis_diff_min)
        //		{
        //			dis_diff_min = temp_dis_diff;
        //			idx = i;
        //		}
        //	}
        //

            //����ǹ�ܵ�Ŀ��װ�װ�yaw��С���Ǹ�װ�װ�
        float yaw_diff_min = fabsf(New_Visusal->New_Visual_Yaw - AIM_data->Visual_Caculate_yaw);
        for (i = 1; i<4; i++) {
            float temp_yaw_diff = fabsf(New_Visusal->New_Visual_Yaw - tar_position[i].yaw);
            if (temp_yaw_diff < yaw_diff_min)
            {
                yaw_diff_min = temp_yaw_diff;
                idx = i;
            }
        }

    }

	

    AIM_data->Visual_Caculate_Aim_z = tar_position[idx].z + New_Visusal->vz;
    AIM_data->Visual_Caculate_Aim_x = tar_position[idx].x + New_Visusal->vx;
    AIM_data->Visual_Caculate_Aim_y= tar_position[idx].y +New_Visusal->vy ;
		a=AIM_data->Visual_Caculate_Aim_z;
		b=AIM_data->Visual_Caculate_Aim_x;
		c=AIM_data->Visual_Caculate_Aim_y;
		
		
		
		
    //������Ÿ�����
   New_Visusal->New_Visual_Pitch= -pitchTrajectoryCompensation(sqrt(b * b + c * c) - st.s_bias,
            a + st.z_bias, New_Visusal->v_yaw);
    New_Visusal->New_Visual_Yaw = (float)(atan2(c, b));

}

// ��������������ԭ�㣬��ʱ�뷽��Ϊ��

//int main()
//{
//    float aim_x = 0, aim_y = 0, aim_z = 0; // aim point ��㣬������λ�����ڿ��ӻ�
//    float pitch = 0; //��������� pitch���ԽǶ� ����
//    float yaw = 0;   //��������� yaw���ԽǶ� ����

//    //�������
//    st.k = 0.092;
//    st.bullet_type =  BULLET_17;
//    st.current_v = 18;
//    st.current_pitch = 0;
//    st.current_yaw = 0;
//    st.xw = 3.0;
//    // st.yw = 0.0159;
//    st.yw = 0;
//    // st.zw = -0.2898;
//    st.zw = 1.5;

//    st.vxw = 0;
//    st.vyw = 0;
//    st.vzw = 0;
//    st.v_yaw = 0;
//    st.tar_yaw = 0.09131;


//    st.r1 = 0.5;
//    st.r2 = 0.5;
//    st.dz = 0.1;
//    st.bias_time = 100; 
//    st.s_bias = 0.19133;
//    st.z_bias = 0.21265;


//    st.armor_id = ARMOR_INFANTRY3;//
//    st.armor_num = ARMOR_NUM_NORMAL;//


//    autoSolveTrajectory(&pitch, &yaw, &aim_x, &aim_y, &aim_z);


//    printf("main pitch:%f�� yaw:%f�� ", pitch * 180 / PI, yaw * 180 / PI);
//    printf("\npitch:%frad yaw:%frad aim_x:%f aim_y:%f aim_z:%f", pitch, yaw, aim_x, aim_y, aim_z);

//    return 0;
//}
