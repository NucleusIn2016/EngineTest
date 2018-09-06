/**
* IFaaService.thrift
* Created on: May 8, 2015
*     Author: yangboz
*/
/**
* modify by zhongbin on: 2015-09-09
*/
namespace   cpp  intellif
namespace   java intellif.ifaas

const i32 MAX_FEA_LEN                 = 181
const i32 DEFAULT_THRESHOLD           = 0
const i32 IMAGE_CATAINS_FORBIDEN_FACE = -1

enum EEnginIoctrlType
{
    ENGIN_IOCTRL_TRACE             = 0x74726163,
    ENGIN_IOCTRL_DUMP              = 0x64d56470,
    ENGIN_IOCTRL_IOCTRL            = 0x6374726c,
    ENGIN_IOCTRL_SURVEIL           = 0x73757276
}

//iface_engin_ioctrl(ENGIN_IOCTRL_TRACE, TRACE_IOCTRL_LEVEL, i32 level);             //set the trace level
//iface_engin_ioctrl(ENGIN_IOCTRL_TRACE, TRACE_IOCTRL_SWITCH, i32 module, i32 OnOff) //set the module's trace on or off
enum ETraceIoctrlType
{
    TRACE_IOCTRL_LEVEL             = 0,
    TRACE_IOCTRL_SWITCH            = 1,
}

//iface_engin_ioctrl(ENGIN_IOCTRL_DUMP, dumplevle0, dumplevel1, dumplevel2, dumplevel3)


//the sub ioctrl of ENGIN_IOCTRL_IOCTRL PARAM
enum EParamIoctrlType
{
    PARAM_IOCTRL_BLACKLIST      = 0,
    PARAM_IOCTRL_VERIFYRULE     = 1,
    PARAM_IOCTRL_TASKINFO       = 2,
    PARAM_IOCTRL_SNAPER_FLAG    = 3,
    PARAM_IOCTRL_SNAPER_DECTYPE = 4,
    PARAM_IOCTRL_PERSON         = 5,
    PARAM_IOCTRL_CAMERA         = 6,
    PARAM_IOCTRL_REDLIST        = 7,
    PARAM_IOCTRL_SNAPERCTRL     = 8,
    PARAM_IOCTRL_LONGTERM_FILT  = 9,
    PARAM_IOCTRL_CID_IMPORT     = 10,
    PARAM_IOCTRL_PERSON_CLASS   = 11,
    PARAM_IOCTRL_FEATURE_UPDATE = 12,
    PARAM_IOCTRL_FACE_RECALC    = 13,
    PARAM_IOCTRL_JUZHU_IMPORT   = 14,
    PARAM_IOCTRL_BLACK_DETAIL   = 15,
    PARAM_IOCTRL_OTHER_IMPORT   = 16,
    PARAM_IOCTRL_RED_IMPORT     = 17,
    PARAM_IOCTRL_FILTER_UPDATE  = 18,   
    PARAM_IOCTRL_FAKE_IMPORT    = 19,
    PARAM_IOCTRL_RESIDENT_IMPORT= 20,
    PARAM_IOCTRL_DOOR_IMPORT    = 21,
}

enum EFakeFilterUpdateType
{
    FILTER_UPDATE_ALL  = 0,
    FILTER_UPDATE_FACE = 1,
    FILTER_UPDATE_SRC  = 2,
}

//iface_engin_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                   PARAM_IOCTRL_FILTER_UPDATE,
//                   FILTER_UPDATE_ALL, FILTER_UPDATE_FACE, FILTER_UPDATE_SRC
//                   i64   0/faceId/srcId)   
 


//iface_engin_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                   PARAM_IOCTRL_CID_IMPORT,PARAM_IOCTRL_FACE_RECALC,PARAM_IOCTRL_JUZHU_IMPORT,PARAM_IOCTRL_BLACK_DETAIL
//                   i64   ProgressId,
//                   i64   BeginIdx In table,
//                   i64   EndupIdx In table)   // notify an feature updating task


//iface_engin_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                   PARAM_IOCTRL_CID_IMPORT,PARAM_IOCTRL_FACE_RECALC,PARAM_IOCTRL_JUZHU_IMPORT,PARAM_IOCTRL_BLACK_DETAIL
//                   i64   ProgressId,
//                   i64   BeginIdx In table,
//                   i64   EndupIdx In table)   // notify an feature updating task
//iface_engin_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                   PARAM_IOCTRL_CID_IMPORT,PARAM_IOCTRL_FEATURE_UPDATE,PARAM_IOCTRL_FACE_RECALC,PARAM_IOCTRL_JUZHU_IMPORT,PARAM_IOCTRL_BLACK_DETAIL
//                   i64   0,                   // 0 means to clear / stop a update progress
//                   i64   ProgressId,
//                   i64   Reserved)            // delete an feature updating task
//enum EDataBaseImportAction
//{
//    DB_IMPORT_ACTION_STARTUP    = 0,
//    DB_IMPORT_ACTION_STOP       = 1,
//}


enum EPersonClassfierAction
{
    PERSON_CLASS_ACTION_STARTUP = 0,
    PERSON_CLASS_ACTION_STOP    = 1,
}


enum EFaceAttrUpdateAction
{
    ATTR_UPDATE_ACTION_STARTUP = 0,
    ATTR_UPDATE_ACTION_STOP    = 1,
}


//the sub ioctrl of ENGIN_IOCTRL_SURVEIL
//iface_engin_ioctrl(ENGIN_IOCTRL_SURVEIL,
//                   SURVEIL_IOCTRL_ADD_PERSON,
//                   i32   sourceType,
//                   i64   blistId,
//                   i64   personId)            // notify add new person to surveil
//iface_engin_ioctrl(ENGIN_IOCTRL_SURVEIL,
//                   SURVEIL_IOCTRL_DEL_PERSON,
//                   i32   sourceType,
//                   i64   blistId,
//                   i64   personId)            // notify del person out of  surveilling
//iface_engin_ioctrl(ENGIN_IOCTRL_SURVEIL,
//                   SURVEIL_IOCTRL_UPDATE_PERSON,
//                   i64   personId)            // notify person surveilling update
enum ESurveilIoctrlType
{
	SURVEIL_IOCTRL_ADD_PERSON    = 0,
	SURVEIL_IOCTRL_DEL_PERSON    = 1,
	SURVEIL_IOCTRL_UPDATE_PERSON = 2,
}

//iface_engin_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                   PARAM_IOCTRL_BLACKLIST,
//                   BLIST_IOCTRL_CAMERA_UPDATE,
//                   i32   sourceType,
//                   i64   sourceId)            // notify the black bank were changed

//iface_engin_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                   PARAM_IOCTRL_BLACKLIST,
//                   BLIST_IOCTRL_AREA_UPDATE,
//                   i32   sourceType,
//                   i64   sourceId)            // notify the black bank were changed

enum EBListIoctrlType
{
    BLIST_IOCTRL_CAMERA_UPDATE      = 0,
    BLIST_IOCTRL_AREA_UPDATE        = 1,
    BLIST_PERSON_UPDATE             = 2,
    BLIST_BANK_SURVEILLANCE_UPDATE  = 3,
}

//iface_engin_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                   PARAM_IOCTRL_VERIFYRULE,
//                   RULE_IOCTRL_UPDATE,
//                   i64   rule_id)           // notiry the verify fule were changed
enum ERuleIoctrlType
{
	RULE_IOCTRL_UPDATE       = 0,
}


//iface_engin_ioctrl(ENGIN_IOCTRL_PARAM,
//                   PARAM_IOCTRL_TASKINFO,
//                   TASK_IOCTRL_BANKID,
//                   i64   task_id,
//                   i64   bank_id);         //update the bank if of task
//iface_engin_ioctrl(ENGIN_IOCTRL_PARAM,
//                   PARAM_IOCTRL_TASKINFO,
//                   TASK_IOCTRL_SOURCEID,
//                   i64   task_id,
//                   i64   source_id)        //update the source id of task, but can not change the source type
//iface_engin_ioctrl(ENGIN_IOCTRL_PARAM,
//                   PARAM_IOCTRL_TASKINFO,
//                   TASK_IOCTRL_TYPE,
//                   i64   task_id,
//                   i64   task_type)        //update the source id of task, but can not change the source type
enum ETaskIoctrlType
{
	TASK_IOCTRL_BANKID       = 0,
	TASK_IOCTRL_SOURCEID     = 1,
	TASK_IOCTRL_TYPE         = 2
}


//iface_engin_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                   PARAM_IOCTRL_SNAPER_SET,
//                   i32   sourceType,
//                   i64   sourceId,
//                   i32   sourceFlag)       //change the snaper of the source


//iface_engin_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                   PARAM_IOCTRL_CAMERA,
//                   CAMERA_IOCTRL_CAPTURE,
//                   i64   cameraId)        //trigger an capture action of camera
enum ECameraIoctrlType
{
	CAMERA_IOCTRL_CAPTURE  = 0,
}



//iface_engin_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                   PARAM_IOCTRL_PERSON,
//                   PERSON_IOCTRL_RULEIID,
//                   i64   personid,
//                   i64   ruleid)         //change the rule id  of the one person
enum EPersonIoctrlType
{
	PERSON_IOCTRL_RULEIID   = 0,
}

//iface_egine-iioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_REDLIST,
//                    REDLIST_IOCTRL_QUERY,
//                    i64   faceId,       //query that if one face id can match the redlist
//                    i64   tabType)      //  tabType used  E_FACE_EXTRACT_TYPE
//iface_egine-iioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_REDLIST,
//                    REDLIST_IOCTRL_ADD,
//                    i64   detailId)     //add one detail to rednamelist
//iface_egine-iioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_REDLIST,
//                    REDLIST_IOCTRL_DEL,
//                    i64   detailId)       //del one detail to rednamelist
//iface_egine-iioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_REDLIST,
//                    REDLIST_IOCTRL_REFRESH)      //refresh all detail to rednamelist
//iface_egine-iioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_REDLIST,
//                    REDLIST_IOCTRL_SWITCHON)     //switch on rednamelist
//iface_egine-iioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_REDLIST,
//                    REDLIST_IOCTRL_SWITCHOFF)    //switch off rednamelist
enum ERedListIoctrlType
{
  REDLIST_IOCTRL_QUERY    = 0,
  REDLIST_IOCTRL_ADD      = 1,
  REDLIST_IOCTRL_DEL      = 2,
  REDLIST_IOCTRL_REFRESH  = 3,
  REDLIST_IOCTRL_SWITCHON = 4,
  REDLIST_IOCTRL_SWITCHOFF= 5
}


//iface_engine_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_SNAPERCTRL,
//                    SNAPER_CTRL_IPC_CAP,
//                    i64 camera_id)
enum ESnaperCtrlType
{
	SNAPER_CTRL_IPC_CAP     = 0,
	SNAPER_CTRL_IPC_RST     = 1,
}


//iface_engine_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_LONGTERM_FILT,
//                    LONG_FILT_CTRL_INIT)
//iface_engine_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_LONGTERM_FILT,
//                    LONG_FILT_CTRL_UPDATE)
//iface_engine_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_LONGTERM_FILT,
//                    LONG_FILT_CTRL_ADD_PERSON,
//                    i64 dwPersonId)
//iface_engine_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_LONGTERM_FILT,
//                    LONG_FILT_CTRL_DEL_PERSON,
//                    i64 dwPersonId)
//iface_engine_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_LONGTERM_FILT,
//                    LONG_FILT_CTRL_ADD_CAMERA,
//                    i64 dwCameraId)
//iface_engine_ioctrl(ENGIN_IOCTRL_IOCTRL,
//                    PARAM_IOCTRL_LONGTERM_FILT,
//                    LONG_FILT_CTRL_DEL_CAMERA,
//                    i64 dwCameraId)
enum ELongTermFiltCtrl
{
	LONG_FILT_CTRL_INIT        = 0,
	LONG_FILT_CTRL_UPDATE      = 1,
	LONG_FILT_CTRL_ADD_PERSON  = 2,
	LONG_FILT_CTRL_DEL_PERSON  = 3,
	LONG_FILT_CTRL_ADD_CAMERA  = 4,
	LONG_FILT_CTRL_DEL_CAMERA  = 5,
	LONG_FILT_CTRL_CLR_ZONE    = 6
}


enum EFeatureAlgVersion
{
    FEATURE_ALG_VERSION_ORG      = 0,
    FEATURE_ALG_VERSION_TUNA     = 1,
    FEATURE_ALG_VERSION_RABBIT   = 2,
    FEATURE_ALG_VERSION_TORTOISE = 3,
}


struct t_if_rect_t
{
	1: i32 left,             // the left  border  of face rect
	2: i32 top,              // the top   border  of face rect
	3: i32 right,            // the right  border of face rect
	4: i32 bottom            // the bottom border of face rect
}

enum T_IF_FacePose
{
	IF_StrictFrontal        = 0, 		
	IF_Frontal              = 1,					
	IF_HalfLeft             = 2,				
	IF_HalfRight            = 3,				
	IF_FullLeft             = 4,				
	IF_FullRight            = 5,				
	IF_FrontalCW30          = 6,				
	IF_LeftHalfProfileCW30  = 7,		
	IF_RightHalfProfileCW30 = 8,	
	IF_LeftProfileCW30      = 9,			
	IF_RightProfileCW30     = 10,		
	IF_FrontalCCW30         = 11,			
	IF_LeftHalfProfileCCW30 = 12,	
	IF_RightHalfProfileCCW30= 13,	
	IF_LeftProfileCCW30     = 14,		
	IF_RightProfileCCW30    = 15
}

enum E_FACE_EXTRACT_TYPE
{
	FACE_EXT_TYPE_BLACKDETAIL   = 0,
	FACE_EXT_TYPE_SUSPECTDETAIL = 1,
	FACE_EXT_TYPE_REDDETAIL     = 2,
	FACE_EXT_TYPE_CIDDETAIL     = 3,
	FACE_EXT_TYPE_JUNZHUDETAIL  = 4,
	FACE_EXT_TYPE_FACEINFO      = 5,
	FACE_EXT_TYPE_OTHERDETAIL   = 6,
	FACE_EXT_TYPE_FAKEDETAIL    = 7,
	FACE_EXT_TYPE_COMMUNITY_RESIDENT_DETAIL    = 8,
	FACE_EXT_TYPE_COMMUNITY_DOOR_DETAIL    = 9,
}

enum E_FACE_FORBIDEN_VALUE
{
	FACE_FORBIDEN_VALUE_FALSE   = 0,
	FACE_FORBIDEN_VALUE_TRUE    = 1,
}

enum E_FLUSH_PROGRESS_TYPE
{
	FLUSH_PROGRESS_TYPE_CIDDETAIL   = 0,
	FLUSH_PROGRESS_TYPE_BLACKDETAIL = 1,
	FLUSH_PROGRESS_TYPE_FACEFEATURE = 2,
	FLUSH_PROGRESS_TYPE_JUZHUDETAIL = 3,
	FLUSH_PROGRESS_TYPE_OHTERDETAIL = 4,
	FLUSH_PROGRESS_TYPE_RESIDENTDETAIL = 5,
	FLUSH_PROGRESS_TYPE_DOORDETAIL = 6
}

enum E_FACE_ATTRIBUTE_LIST
{
    FACE_ATTR_NULL           = -1,
    FACE_ATTR_POSE           = 0,
    FACE_ATTR_GENDER         = 1,
    FACE_ATTR_AGE            = 2,
    FACE_ATTR_LANDMARK       = 3,
    FACE_ATTR_DRESS          = 4,
    FACE_ATTR_RACE           = 5,    
    FACE_ATTR_QUALITY        = 6,
}

enum E_FACE_FEATURE_VALUE_TYPE
{
	FEATURE_VALUE_TYPE_UNENCYPTED	= 0,
	FEATURE_VALUE_TYPE_ENCYPTED	= 1,
}

struct T_IF_FACERECT
{
	1: t_if_rect_t   Rect,        //the rect info of face
	2: T_IF_FacePose Pose,        //the pos of face
	3: i32           forbiden,    //is this face forbiden by redname list logic
}

struct T_IF_IMGATTR
{
    1: t_if_rect_t   Rect,        //the rect info of face
    2: i32           Age,
    3: i32           Gender,
    4: i32           Accessory,
    5: i64           ImgTime,
}

//MessageStruct
struct T_IF_TASK_INFO
{
	1: i64     Id,              //task id, it equal the primary id of t_task_info table
	2: i64     SourceId,        //sourceid: the primary id of t_camera_info/t_video_info/t_image_info table
	3: i32     SourceType,      //sourcetype: 0: camera, 1: video, 2: image
	//4: i64   BankId,          //bankid: it is the primary id of t_bank_info table
	//5: i64   RuleId,          //ruleid: it is the primary id of Rule
}
struct T_IF_ALARM_INFO
{
	1: i64    Id,               //alarm id: the primary id of t_alarm_info table
	2: i64    TaskId,           //taskid: it equal the primary id of t_task_info table
	3: i64    BlackId,          //bankid: it is the primary id of t_bank_info table
	4: i64    FaceId,           //faceid: is is the primary id of t_face_info table
	5: double Confidence
}


struct T_CapRstOndemand
{
  1: i64        ImageId,          //ImageId Store in database
  2: list<i64>  FaceIds,          //Face Id in the Image, each id were store in database
}

struct T_ProgressQueryRst
{
  1: i64        TotalReqCnt,      //total feature flush request cnt 
  2: i64        FinishReqCnt,     //fineshed feature flush request cnt
  3: i64        TotalItemCnt,     //total feature flush image cnt
  4: i64        FinishItemCnt,    //total feature flush image cnt
}

struct T_MulAlgFeatureExtReq
{
   1: i64       FaceId,
   2: i32       FaceTab,          //E_FLUSH_PROGRESS_TYPE
   3: list<i32> AlgVersions,
}

struct T_OneAlgFeatureExtRsp
{
   1: i32         AlgVersion,
   2: i32         ErrorCode,
   3: binary      FeatureVal,
}


struct T_MulAlgFeatureExtRsp
{
   1: i32                          FeatureCnt,
   2: i32                          forbiden,    //is this face forbiden by redname list logic
   3: list<T_OneAlgFeatureExtRsp>  FeatureList,
}

struct T_FaceVerifyRstRsp
{
    1: i32              mErrno,
    2: string           mErrMsg,
    3: double           Confidence,
    4: list<double>     Thresholds,
    5: t_if_rect_t      FaceRectA,
    6: t_if_rect_t      FaceRectB
}

struct T_AttrDetectRstItem
{
    1: i32           FeatureLen,
    2: i32           FeatureVersion,
    3: string        FaceAttrInfo,   
    4: binary        Feature
}


struct T_MulAttrDetectRstRsp
{
    1: i32                  mErrno,    
    2: i32                  FaceNum,
    3: string               ErrMsg,
    4: list<T_AttrDetectRstItem>    FaceAttrList,
}

struct T_AttrDetectRstItem_v2
{
    1: i32           FeatureSize,
    2: i32           FeatureVersion,
    3: string        FaceAttrInfo,   
    4: binary        Feature,
	5: i32			 FeatureValueType
}


struct T_MulAttrDetectRstRsp_v2
{
    1: i32                  mErrno,    
    2: i32                  FaceNum,
    3: string               ErrMsg,
    4: list<T_AttrDetectRstItem_v2>    FaceAttrList,
}


struct T_LiveMotionInfo
{
	1:i32		MotionID,
	2:double   	MotionConfidence
}


struct T_MotionLiveDetectRst
{
	1: i32						mErrno,
	2: string   				ErrMsg,
	3: binary 					FaceImg,
	4: bool						isLive,
	5: list<T_LiveMotionInfo> 	MotionList
}

service IFaaService{

	list<T_IF_FACERECT>   face_detect_extract(1: string inputImgName, //Image Path of black detail which need to extract feature
	                                          2: i64    tId,          //BankDetail id for face feature field updating
	                                          3: i32    extType);     //extType, 0: for black detile, 1: for suspect detail

											
	list<T_IF_FACERECT>   image_detect_extract(1: string inputImgName,//Image Path for face searcher
	                                           2: i64    fromImgId);  //Image id from img_info_table
                                                                    //ret the face cnt of this image
                                                                         
        T_MulAlgFeatureExtRsp multip_feature_query(1: T_MulAlgFeatureExtReq tMulFeatureExtPara);    
	
	double face_feature_verify(1: string inputFace0,                 //the on of the first face image to verify
	                           2: string inputFace1);                //the on of the second face image to verify
	
	double mulalg_feature_verify(1: string inputFace0,              //the on of the first face image to verify
	                             2: string inputFace1,
	                             3: i32    type);                  // use rabbit compare or not, 1: rabbit, 0:disable rabbit
	
	double face_feature_compare(1: i32 faceType0,                    //face type0: see enum E_FACE_EXTRACT_TYPE
	                            2: i64 faceId0,
	                            3: i32 faceType1,                    //face type1: see enum E_FACE_EXTRACT_TYPE
	                            4: i64 faceId1);                  
	                           
	i32    task_surveillance_create(1: T_IF_TASK_INFO info);         //create a task with TASK INFO
	
	i32    task_surveillance_terminate(1: i64 taskId);               //terminate a task with task id
	
	i32    task_snaper_create(1: i32 sourceType,
	                          2: i64 sourceId);                      //create a pure snaper task
							  
	i32    task_snaper_terminate(1: i32 sourceType,
	                             2: i64 sourceId);                   //destroy a pure snaper task
							  
	i32    iface_engin_ioctrl(1: i32 type,                           //ioctrl type, see the enum EEnginIoctrlType
	                          2: i64 para0 = 0,                      //ioctrl parameter 0
	                          3: i64 para1 = 0,                      //ioctrl parameter 1  
	                          4: i64 para2 = 0,                      //ioctrl parameter 2  
	                          5: i64 para3 = 0);                     //ioctrl parameter 3
	                          
    i32   multi_face_verify_url(1: list<string> listPaths);

    i32   multi_face_verify_bin(1: list<binary> listImgDat);

    double  multi_face_compare_bin(1: binary imgdata1,
                                   2: binary imgdata2);



    i32   multi_image_import(1: list<binary> listImgInfo, 
                          2: i32 type,
                          3: i32 srcType,
                          4: i64 srcId);

    i32   multi_image_import2(1: binary ImgData, 
                              2: i32 type,
                              3: i32 srcType,
                              4: i64 srcId,
                              5: list<T_IF_IMGATTR> attr);
                              
    //i32   blist_add_person(1: i32 sourceType,                     //source type the person will be    surveiled on
    //                       2: i64 blistId,                        //the blacklist id will the person added to
    //                       3: i64 personId);                      //the personId of this adding person
                        
    //i32   blist_del_person(1: i32 sourceType,                     //source type the person belongs to
    //                       2: i64 blistId,                        //the blacklist id will the person move out from
    //                       3: i64 personId);                      //the personId of this deleting person

    /************************************************************************************	 
    inputImgName  ImgPath
    feceId         
    return string json { 'Rect':{ 'bottom':403,'left':680,'right':774,'top':309}}
    **************************************************************************************/
    string face_detect_rect(1: string inputImgName, //Image Path 
                            2: i64    feceId);         //fece Id

    T_CapRstOndemand capture_on_demand(1: i64 srcId); //source id whitch want to capture           
               
    i32    iface_merge_ctrl(1: string inputJsonParam);

    i32    iface_add_camera(1: i64    dwCameraId,
                            2: string strIpcAdr,
                            3: i32    dwIpcPort,
                            4: string strIpcUsr,
                            5: string strIpcPwd,
                            6: i32    dwEngineId);
                         
    T_ProgressQueryRst query_prgress_rate(1: i32 QueryType, 2: i32 ProgressId);

    i32    engine_update_status(1: string status);
    
    i32    server_info(1: string info);
    
    T_MulAttrDetectRstRsp  if_image_detect_extract_url(1: string inputImg,            //Image for face searcher                                                                                                    
                                                       2: i32    beDetAttr    = 0,    // 0: not detect face attr, 1: enable to detect
                                                       3: i32    beFeaExtra   = 0,    // 0: not extra feature, 1: enable extra feature
                                                       4: i32    algType      = -1);  // alg type, -1,default system, 0: Ant, 1:tuna, 4: deepeyes200, 5: gluon

    T_MulAttrDetectRstRsp  if_image_detect_extract_bin(1: binary inputImg,            //Image for face searcher                                                                                                   
                                                       2: i32    beDetAttr    = 0,    // 0: not detect face attr, 1: enable to detect
                                                       3: i32    beFeaExtra   = 0,    // 0: not extra feature, 1: enable extra feature
                                                       4: i32    algType      = -1);  // alg type, -1,default system, 0: Ant, 1:tuna, 4: deepeyes200, 5: gluon
													   
    T_MulAttrDetectRstRsp_v2  if_image_detect_extract_url_v2(1: string inputImg,      // Image for face searcher                                                                                                    
                                                       2: list<i32> AttrEnList,    	  // need to detect face attribute
                                                       3: i32    beFeaExtra   = 0,    // 0: not extra feature, 1: enable extra feature
                                                       4: i32    algType      = -1);  // alg type, -1,default system, 0: Ant, 1:tuna, 4: deepeyes200, 5: gluon

    T_MulAttrDetectRstRsp_v2  if_image_detect_extract_bin_v2(1: binary inputImg,      // Image for face searcher                                                                                                   
                                                       2: list<i32> AttrEnList,       // need to detect face attribute
                                                       3: i32    beFeaExtra   = 0,    // 0: not extra feature, 1: enable extra feature
                                                       4: i32    algType      = -1);  // alg type, -1,default system, 0: Ant, 1:tuna, 4: deepeyes200, 5: gluon
                                                       
    T_FaceVerifyRstRsp if_mulalg_face_verify_url(1: string inputFace0,   //the on of the first face image to verify
                                                 2: string inputFace1,                                             
                                                 3: i32    algType = -1);// alg type, -1,default system, 0: Ant, 1:tuna, 4: deepeyes200, 5: gluon
                                                 
    T_FaceVerifyRstRsp if_mulalg_face_verify_bin(1: binary inputFace0,   //the on of the first face image to verify
                                                 2: binary inputFace1,                                            
                                                 3: i32    algType = -1);// alg type, -1,default system, 0: Ant, 1:tuna, 4: deepeyes200, 5: gluon
    
    T_MotionLiveDetectRst motion_live_detect_url(1: string 	inputVideoFileName,
						                         2: list<i32> inputMotionList);
									                                              
    double if_feature_compare(1: binary feature0,    // the on of the first feature
                              2: i32    featureLen0, // the on of the first feature lens bytes
                              3: binary feature1,    // the on of the second feature
                              4: i32    featureLen1, // the on of the second feature lens bytes
                              5: i32    version);    // alg version eg: 5004 5014 5020

}
