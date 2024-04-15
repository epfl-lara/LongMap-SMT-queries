; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84648 () Bool)

(assert start!84648)

(declare-fun b_free!20077 () Bool)

(declare-fun b_next!20077 () Bool)

(assert (=> start!84648 (= b_free!20077 (not b_next!20077))))

(declare-fun tp!70026 () Bool)

(declare-fun b_and!32199 () Bool)

(assert (=> start!84648 (= tp!70026 b_and!32199)))

(declare-fun mapNonEmpty!36988 () Bool)

(declare-fun mapRes!36988 () Bool)

(declare-fun tp!70027 () Bool)

(declare-fun e!558192 () Bool)

(assert (=> mapNonEmpty!36988 (= mapRes!36988 (and tp!70027 e!558192))))

(declare-datatypes ((V!36041 0))(
  ( (V!36042 (val!11697 Int)) )
))
(declare-datatypes ((ValueCell!11165 0))(
  ( (ValueCellFull!11165 (v!14266 V!36041)) (EmptyCell!11165) )
))
(declare-datatypes ((array!62480 0))(
  ( (array!62481 (arr!30092 (Array (_ BitVec 32) ValueCell!11165)) (size!30573 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62480)

(declare-fun mapRest!36988 () (Array (_ BitVec 32) ValueCell!11165))

(declare-fun mapValue!36988 () ValueCell!11165)

(declare-fun mapKey!36988 () (_ BitVec 32))

(assert (=> mapNonEmpty!36988 (= (arr!30092 _values!1278) (store mapRest!36988 mapKey!36988 mapValue!36988))))

(declare-fun b!989961 () Bool)

(declare-fun res!662029 () Bool)

(declare-fun e!558197 () Bool)

(assert (=> b!989961 (=> (not res!662029) (not e!558197))))

(declare-datatypes ((array!62482 0))(
  ( (array!62483 (arr!30093 (Array (_ BitVec 32) (_ BitVec 64))) (size!30574 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62482)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62482 (_ BitVec 32)) Bool)

(assert (=> b!989961 (= res!662029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989962 () Bool)

(declare-fun e!558194 () Bool)

(assert (=> b!989962 (= e!558197 e!558194)))

(declare-fun res!662031 () Bool)

(assert (=> b!989962 (=> (not res!662031) (not e!558194))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!989962 (= res!662031 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30093 _keys!1544) from!1932))))))

(declare-fun lt!439035 () V!36041)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15637 (ValueCell!11165 V!36041) V!36041)

(declare-fun dynLambda!1865 (Int (_ BitVec 64)) V!36041)

(assert (=> b!989962 (= lt!439035 (get!15637 (select (arr!30092 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!36041)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!36041)

(declare-datatypes ((tuple2!14994 0))(
  ( (tuple2!14995 (_1!7508 (_ BitVec 64)) (_2!7508 V!36041)) )
))
(declare-datatypes ((List!20876 0))(
  ( (Nil!20873) (Cons!20872 (h!22034 tuple2!14994) (t!29840 List!20876)) )
))
(declare-datatypes ((ListLongMap!13681 0))(
  ( (ListLongMap!13682 (toList!6856 List!20876)) )
))
(declare-fun lt!439037 () ListLongMap!13681)

(declare-fun getCurrentListMapNoExtraKeys!3556 (array!62482 array!62480 (_ BitVec 32) (_ BitVec 32) V!36041 V!36041 (_ BitVec 32) Int) ListLongMap!13681)

(assert (=> b!989962 (= lt!439037 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!662034 () Bool)

(assert (=> start!84648 (=> (not res!662034) (not e!558197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84648 (= res!662034 (validMask!0 mask!1948))))

(assert (=> start!84648 e!558197))

(assert (=> start!84648 true))

(declare-fun tp_is_empty!23293 () Bool)

(assert (=> start!84648 tp_is_empty!23293))

(declare-fun e!558196 () Bool)

(declare-fun array_inv!23253 (array!62480) Bool)

(assert (=> start!84648 (and (array_inv!23253 _values!1278) e!558196)))

(assert (=> start!84648 tp!70026))

(declare-fun array_inv!23254 (array!62482) Bool)

(assert (=> start!84648 (array_inv!23254 _keys!1544)))

(declare-fun lt!439038 () tuple2!14994)

(declare-fun b!989963 () Bool)

(declare-fun getCurrentListMap!3825 (array!62482 array!62480 (_ BitVec 32) (_ BitVec 32) V!36041 V!36041 (_ BitVec 32) Int) ListLongMap!13681)

(declare-fun +!3118 (ListLongMap!13681 tuple2!14994) ListLongMap!13681)

(assert (=> b!989963 (= e!558194 (not (= (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3118 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439038))))))

(declare-fun lt!439039 () tuple2!14994)

(assert (=> b!989963 (= (+!3118 (+!3118 lt!439037 lt!439039) lt!439038) (+!3118 (+!3118 lt!439037 lt!439038) lt!439039))))

(assert (=> b!989963 (= lt!439038 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))))

(assert (=> b!989963 (= lt!439039 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32729 0))(
  ( (Unit!32730) )
))
(declare-fun lt!439036 () Unit!32729)

(declare-fun addCommutativeForDiffKeys!712 (ListLongMap!13681 (_ BitVec 64) V!36041 (_ BitVec 64) V!36041) Unit!32729)

(assert (=> b!989963 (= lt!439036 (addCommutativeForDiffKeys!712 lt!439037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30093 _keys!1544) from!1932) lt!439035))))

(declare-fun b!989964 () Bool)

(declare-fun res!662028 () Bool)

(assert (=> b!989964 (=> (not res!662028) (not e!558197))))

(declare-datatypes ((List!20877 0))(
  ( (Nil!20874) (Cons!20873 (h!22035 (_ BitVec 64)) (t!29841 List!20877)) )
))
(declare-fun arrayNoDuplicates!0 (array!62482 (_ BitVec 32) List!20877) Bool)

(assert (=> b!989964 (= res!662028 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20874))))

(declare-fun b!989965 () Bool)

(declare-fun res!662030 () Bool)

(assert (=> b!989965 (=> (not res!662030) (not e!558197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989965 (= res!662030 (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)))))

(declare-fun b!989966 () Bool)

(declare-fun e!558193 () Bool)

(assert (=> b!989966 (= e!558196 (and e!558193 mapRes!36988))))

(declare-fun condMapEmpty!36988 () Bool)

(declare-fun mapDefault!36988 () ValueCell!11165)

(assert (=> b!989966 (= condMapEmpty!36988 (= (arr!30092 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11165)) mapDefault!36988)))))

(declare-fun b!989967 () Bool)

(declare-fun res!662032 () Bool)

(assert (=> b!989967 (=> (not res!662032) (not e!558197))))

(assert (=> b!989967 (= res!662032 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30574 _keys!1544))))))

(declare-fun b!989968 () Bool)

(assert (=> b!989968 (= e!558192 tp_is_empty!23293)))

(declare-fun b!989969 () Bool)

(assert (=> b!989969 (= e!558193 tp_is_empty!23293)))

(declare-fun b!989970 () Bool)

(declare-fun res!662033 () Bool)

(assert (=> b!989970 (=> (not res!662033) (not e!558197))))

(assert (=> b!989970 (= res!662033 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36988 () Bool)

(assert (=> mapIsEmpty!36988 mapRes!36988))

(declare-fun b!989971 () Bool)

(declare-fun res!662035 () Bool)

(assert (=> b!989971 (=> (not res!662035) (not e!558197))))

(assert (=> b!989971 (= res!662035 (and (= (size!30573 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30574 _keys!1544) (size!30573 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84648 res!662034) b!989971))

(assert (= (and b!989971 res!662035) b!989961))

(assert (= (and b!989961 res!662029) b!989964))

(assert (= (and b!989964 res!662028) b!989967))

(assert (= (and b!989967 res!662032) b!989965))

(assert (= (and b!989965 res!662030) b!989970))

(assert (= (and b!989970 res!662033) b!989962))

(assert (= (and b!989962 res!662031) b!989963))

(assert (= (and b!989966 condMapEmpty!36988) mapIsEmpty!36988))

(assert (= (and b!989966 (not condMapEmpty!36988)) mapNonEmpty!36988))

(get-info :version)

(assert (= (and mapNonEmpty!36988 ((_ is ValueCellFull!11165) mapValue!36988)) b!989968))

(assert (= (and b!989966 ((_ is ValueCellFull!11165) mapDefault!36988)) b!989969))

(assert (= start!84648 b!989966))

(declare-fun b_lambda!15139 () Bool)

(assert (=> (not b_lambda!15139) (not b!989962)))

(declare-fun t!29839 () Bool)

(declare-fun tb!6815 () Bool)

(assert (=> (and start!84648 (= defaultEntry!1281 defaultEntry!1281) t!29839) tb!6815))

(declare-fun result!13639 () Bool)

(assert (=> tb!6815 (= result!13639 tp_is_empty!23293)))

(assert (=> b!989962 t!29839))

(declare-fun b_and!32201 () Bool)

(assert (= b_and!32199 (and (=> t!29839 result!13639) b_and!32201)))

(declare-fun m!916845 () Bool)

(assert (=> b!989964 m!916845))

(declare-fun m!916847 () Bool)

(assert (=> start!84648 m!916847))

(declare-fun m!916849 () Bool)

(assert (=> start!84648 m!916849))

(declare-fun m!916851 () Bool)

(assert (=> start!84648 m!916851))

(declare-fun m!916853 () Bool)

(assert (=> b!989961 m!916853))

(declare-fun m!916855 () Bool)

(assert (=> b!989962 m!916855))

(declare-fun m!916857 () Bool)

(assert (=> b!989962 m!916857))

(declare-fun m!916859 () Bool)

(assert (=> b!989962 m!916859))

(declare-fun m!916861 () Bool)

(assert (=> b!989962 m!916861))

(assert (=> b!989962 m!916857))

(assert (=> b!989962 m!916861))

(declare-fun m!916863 () Bool)

(assert (=> b!989962 m!916863))

(declare-fun m!916865 () Bool)

(assert (=> mapNonEmpty!36988 m!916865))

(assert (=> b!989963 m!916855))

(assert (=> b!989963 m!916855))

(declare-fun m!916867 () Bool)

(assert (=> b!989963 m!916867))

(declare-fun m!916869 () Bool)

(assert (=> b!989963 m!916869))

(declare-fun m!916871 () Bool)

(assert (=> b!989963 m!916871))

(declare-fun m!916873 () Bool)

(assert (=> b!989963 m!916873))

(assert (=> b!989963 m!916869))

(declare-fun m!916875 () Bool)

(assert (=> b!989963 m!916875))

(assert (=> b!989963 m!916873))

(declare-fun m!916877 () Bool)

(assert (=> b!989963 m!916877))

(assert (=> b!989963 m!916875))

(declare-fun m!916879 () Bool)

(assert (=> b!989963 m!916879))

(declare-fun m!916881 () Bool)

(assert (=> b!989963 m!916881))

(assert (=> b!989965 m!916855))

(assert (=> b!989965 m!916855))

(declare-fun m!916883 () Bool)

(assert (=> b!989965 m!916883))

(check-sat (not start!84648) (not b!989965) (not b!989963) tp_is_empty!23293 (not b!989962) (not b!989961) (not b_next!20077) b_and!32201 (not mapNonEmpty!36988) (not b_lambda!15139) (not b!989964))
(check-sat b_and!32201 (not b_next!20077))
(get-model)

(declare-fun b_lambda!15145 () Bool)

(assert (= b_lambda!15139 (or (and start!84648 b_free!20077) b_lambda!15145)))

(check-sat (not start!84648) (not b!989965) (not b!989963) tp_is_empty!23293 (not b!989962) (not b!989961) (not b_next!20077) b_and!32201 (not b!989964) (not mapNonEmpty!36988) (not b_lambda!15145))
(check-sat b_and!32201 (not b_next!20077))
(get-model)

(declare-fun b!990052 () Bool)

(declare-fun e!558240 () Bool)

(declare-fun e!558242 () Bool)

(assert (=> b!990052 (= e!558240 e!558242)))

(declare-fun lt!439076 () (_ BitVec 64))

(assert (=> b!990052 (= lt!439076 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!439078 () Unit!32729)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62482 (_ BitVec 64) (_ BitVec 32)) Unit!32729)

(assert (=> b!990052 (= lt!439078 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439076 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!990052 (arrayContainsKey!0 _keys!1544 lt!439076 #b00000000000000000000000000000000)))

(declare-fun lt!439077 () Unit!32729)

(assert (=> b!990052 (= lt!439077 lt!439078)))

(declare-fun res!662089 () Bool)

(declare-datatypes ((SeekEntryResult!9207 0))(
  ( (MissingZero!9207 (index!39199 (_ BitVec 32))) (Found!9207 (index!39200 (_ BitVec 32))) (Intermediate!9207 (undefined!10019 Bool) (index!39201 (_ BitVec 32)) (x!86176 (_ BitVec 32))) (Undefined!9207) (MissingVacant!9207 (index!39202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62482 (_ BitVec 32)) SeekEntryResult!9207)

(assert (=> b!990052 (= res!662089 (= (seekEntryOrOpen!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9207 #b00000000000000000000000000000000)))))

(assert (=> b!990052 (=> (not res!662089) (not e!558242))))

(declare-fun bm!41936 () Bool)

(declare-fun call!41939 () Bool)

(assert (=> bm!41936 (= call!41939 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!990053 () Bool)

(declare-fun e!558241 () Bool)

(assert (=> b!990053 (= e!558241 e!558240)))

(declare-fun c!100334 () Bool)

(assert (=> b!990053 (= c!100334 (validKeyInArray!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990054 () Bool)

(assert (=> b!990054 (= e!558240 call!41939)))

(declare-fun d!117343 () Bool)

(declare-fun res!662088 () Bool)

(assert (=> d!117343 (=> res!662088 e!558241)))

(assert (=> d!117343 (= res!662088 (bvsge #b00000000000000000000000000000000 (size!30574 _keys!1544)))))

(assert (=> d!117343 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!558241)))

(declare-fun b!990055 () Bool)

(assert (=> b!990055 (= e!558242 call!41939)))

(assert (= (and d!117343 (not res!662088)) b!990053))

(assert (= (and b!990053 c!100334) b!990052))

(assert (= (and b!990053 (not c!100334)) b!990054))

(assert (= (and b!990052 res!662089) b!990055))

(assert (= (or b!990055 b!990054) bm!41936))

(declare-fun m!916965 () Bool)

(assert (=> b!990052 m!916965))

(declare-fun m!916967 () Bool)

(assert (=> b!990052 m!916967))

(declare-fun m!916969 () Bool)

(assert (=> b!990052 m!916969))

(assert (=> b!990052 m!916965))

(declare-fun m!916971 () Bool)

(assert (=> b!990052 m!916971))

(declare-fun m!916973 () Bool)

(assert (=> bm!41936 m!916973))

(assert (=> b!990053 m!916965))

(assert (=> b!990053 m!916965))

(declare-fun m!916975 () Bool)

(assert (=> b!990053 m!916975))

(assert (=> b!989961 d!117343))

(declare-fun d!117345 () Bool)

(declare-fun c!100337 () Bool)

(assert (=> d!117345 (= c!100337 ((_ is ValueCellFull!11165) (select (arr!30092 _values!1278) from!1932)))))

(declare-fun e!558245 () V!36041)

(assert (=> d!117345 (= (get!15637 (select (arr!30092 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!558245)))

(declare-fun b!990060 () Bool)

(declare-fun get!15638 (ValueCell!11165 V!36041) V!36041)

(assert (=> b!990060 (= e!558245 (get!15638 (select (arr!30092 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990061 () Bool)

(declare-fun get!15639 (ValueCell!11165 V!36041) V!36041)

(assert (=> b!990061 (= e!558245 (get!15639 (select (arr!30092 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117345 c!100337) b!990060))

(assert (= (and d!117345 (not c!100337)) b!990061))

(assert (=> b!990060 m!916857))

(assert (=> b!990060 m!916861))

(declare-fun m!916977 () Bool)

(assert (=> b!990060 m!916977))

(assert (=> b!990061 m!916857))

(assert (=> b!990061 m!916861))

(declare-fun m!916979 () Bool)

(assert (=> b!990061 m!916979))

(assert (=> b!989962 d!117345))

(declare-fun b!990086 () Bool)

(declare-fun e!558261 () Bool)

(declare-fun e!558263 () Bool)

(assert (=> b!990086 (= e!558261 e!558263)))

(assert (=> b!990086 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)))))

(declare-fun res!662099 () Bool)

(declare-fun lt!439094 () ListLongMap!13681)

(declare-fun contains!5695 (ListLongMap!13681 (_ BitVec 64)) Bool)

(assert (=> b!990086 (= res!662099 (contains!5695 lt!439094 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990086 (=> (not res!662099) (not e!558263))))

(declare-fun b!990087 () Bool)

(declare-fun e!558260 () Bool)

(assert (=> b!990087 (= e!558260 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990087 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!990088 () Bool)

(declare-fun e!558264 () Bool)

(assert (=> b!990088 (= e!558261 e!558264)))

(declare-fun c!100348 () Bool)

(assert (=> b!990088 (= c!100348 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)))))

(declare-fun b!990089 () Bool)

(declare-fun lt!439097 () Unit!32729)

(declare-fun lt!439093 () Unit!32729)

(assert (=> b!990089 (= lt!439097 lt!439093)))

(declare-fun lt!439095 () (_ BitVec 64))

(declare-fun lt!439096 () V!36041)

(declare-fun lt!439099 () (_ BitVec 64))

(declare-fun lt!439098 () ListLongMap!13681)

(assert (=> b!990089 (not (contains!5695 (+!3118 lt!439098 (tuple2!14995 lt!439095 lt!439096)) lt!439099))))

(declare-fun addStillNotContains!237 (ListLongMap!13681 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32729)

(assert (=> b!990089 (= lt!439093 (addStillNotContains!237 lt!439098 lt!439095 lt!439096 lt!439099))))

(assert (=> b!990089 (= lt!439099 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!990089 (= lt!439096 (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!990089 (= lt!439095 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun call!41942 () ListLongMap!13681)

(assert (=> b!990089 (= lt!439098 call!41942)))

(declare-fun e!558266 () ListLongMap!13681)

(assert (=> b!990089 (= e!558266 (+!3118 call!41942 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!990090 () Bool)

(assert (=> b!990090 (= e!558266 call!41942)))

(declare-fun b!990091 () Bool)

(declare-fun res!662100 () Bool)

(declare-fun e!558262 () Bool)

(assert (=> b!990091 (=> (not res!662100) (not e!558262))))

(assert (=> b!990091 (= res!662100 (not (contains!5695 lt!439094 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990092 () Bool)

(declare-fun e!558265 () ListLongMap!13681)

(assert (=> b!990092 (= e!558265 (ListLongMap!13682 Nil!20873))))

(declare-fun d!117347 () Bool)

(assert (=> d!117347 e!558262))

(declare-fun res!662101 () Bool)

(assert (=> d!117347 (=> (not res!662101) (not e!558262))))

(assert (=> d!117347 (= res!662101 (not (contains!5695 lt!439094 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117347 (= lt!439094 e!558265)))

(declare-fun c!100347 () Bool)

(assert (=> d!117347 (= c!100347 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)))))

(assert (=> d!117347 (validMask!0 mask!1948)))

(assert (=> d!117347 (= (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439094)))

(declare-fun b!990093 () Bool)

(assert (=> b!990093 (= e!558262 e!558261)))

(declare-fun c!100346 () Bool)

(assert (=> b!990093 (= c!100346 e!558260)))

(declare-fun res!662098 () Bool)

(assert (=> b!990093 (=> (not res!662098) (not e!558260))))

(assert (=> b!990093 (= res!662098 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)))))

(declare-fun b!990094 () Bool)

(declare-fun isEmpty!731 (ListLongMap!13681) Bool)

(assert (=> b!990094 (= e!558264 (isEmpty!731 lt!439094))))

(declare-fun b!990095 () Bool)

(assert (=> b!990095 (= e!558265 e!558266)))

(declare-fun c!100349 () Bool)

(assert (=> b!990095 (= c!100349 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990096 () Bool)

(assert (=> b!990096 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)))))

(assert (=> b!990096 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30573 _values!1278)))))

(declare-fun apply!890 (ListLongMap!13681 (_ BitVec 64)) V!36041)

(assert (=> b!990096 (= e!558263 (= (apply!890 lt!439094 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!990097 () Bool)

(assert (=> b!990097 (= e!558264 (= lt!439094 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun bm!41939 () Bool)

(assert (=> bm!41939 (= call!41942 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(assert (= (and d!117347 c!100347) b!990092))

(assert (= (and d!117347 (not c!100347)) b!990095))

(assert (= (and b!990095 c!100349) b!990089))

(assert (= (and b!990095 (not c!100349)) b!990090))

(assert (= (or b!990089 b!990090) bm!41939))

(assert (= (and d!117347 res!662101) b!990091))

(assert (= (and b!990091 res!662100) b!990093))

(assert (= (and b!990093 res!662098) b!990087))

(assert (= (and b!990093 c!100346) b!990086))

(assert (= (and b!990093 (not c!100346)) b!990088))

(assert (= (and b!990086 res!662099) b!990096))

(assert (= (and b!990088 c!100348) b!990097))

(assert (= (and b!990088 (not c!100348)) b!990094))

(declare-fun b_lambda!15147 () Bool)

(assert (=> (not b_lambda!15147) (not b!990089)))

(assert (=> b!990089 t!29839))

(declare-fun b_and!32211 () Bool)

(assert (= b_and!32201 (and (=> t!29839 result!13639) b_and!32211)))

(declare-fun b_lambda!15149 () Bool)

(assert (=> (not b_lambda!15149) (not b!990096)))

(assert (=> b!990096 t!29839))

(declare-fun b_and!32213 () Bool)

(assert (= b_and!32211 (and (=> t!29839 result!13639) b_and!32213)))

(declare-fun m!916981 () Bool)

(assert (=> bm!41939 m!916981))

(declare-fun m!916983 () Bool)

(assert (=> b!990089 m!916983))

(assert (=> b!990089 m!916861))

(declare-fun m!916985 () Bool)

(assert (=> b!990089 m!916985))

(declare-fun m!916987 () Bool)

(assert (=> b!990089 m!916987))

(assert (=> b!990089 m!916861))

(declare-fun m!916989 () Bool)

(assert (=> b!990089 m!916989))

(declare-fun m!916991 () Bool)

(assert (=> b!990089 m!916991))

(assert (=> b!990089 m!916983))

(assert (=> b!990089 m!916991))

(declare-fun m!916993 () Bool)

(assert (=> b!990089 m!916993))

(declare-fun m!916995 () Bool)

(assert (=> b!990089 m!916995))

(assert (=> b!990096 m!916983))

(assert (=> b!990096 m!916861))

(assert (=> b!990096 m!916985))

(assert (=> b!990096 m!916989))

(assert (=> b!990096 m!916983))

(assert (=> b!990096 m!916989))

(declare-fun m!916997 () Bool)

(assert (=> b!990096 m!916997))

(assert (=> b!990096 m!916861))

(assert (=> b!990086 m!916989))

(assert (=> b!990086 m!916989))

(declare-fun m!916999 () Bool)

(assert (=> b!990086 m!916999))

(declare-fun m!917001 () Bool)

(assert (=> d!117347 m!917001))

(assert (=> d!117347 m!916847))

(declare-fun m!917003 () Bool)

(assert (=> b!990094 m!917003))

(assert (=> b!990095 m!916989))

(assert (=> b!990095 m!916989))

(declare-fun m!917005 () Bool)

(assert (=> b!990095 m!917005))

(assert (=> b!990097 m!916981))

(assert (=> b!990087 m!916989))

(assert (=> b!990087 m!916989))

(assert (=> b!990087 m!917005))

(declare-fun m!917007 () Bool)

(assert (=> b!990091 m!917007))

(assert (=> b!989962 d!117347))

(declare-fun d!117349 () Bool)

(assert (=> d!117349 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84648 d!117349))

(declare-fun d!117351 () Bool)

(assert (=> d!117351 (= (array_inv!23253 _values!1278) (bvsge (size!30573 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84648 d!117351))

(declare-fun d!117353 () Bool)

(assert (=> d!117353 (= (array_inv!23254 _keys!1544) (bvsge (size!30574 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84648 d!117353))

(declare-fun d!117355 () Bool)

(assert (=> d!117355 (= (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)) (and (not (= (select (arr!30093 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30093 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989965 d!117355))

(declare-fun b!990108 () Bool)

(declare-fun e!558277 () Bool)

(declare-fun call!41945 () Bool)

(assert (=> b!990108 (= e!558277 call!41945)))

(declare-fun bm!41942 () Bool)

(declare-fun c!100352 () Bool)

(assert (=> bm!41942 (= call!41945 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100352 (Cons!20873 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) Nil!20874) Nil!20874)))))

(declare-fun b!990109 () Bool)

(declare-fun e!558278 () Bool)

(assert (=> b!990109 (= e!558278 e!558277)))

(assert (=> b!990109 (= c!100352 (validKeyInArray!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117357 () Bool)

(declare-fun res!662108 () Bool)

(declare-fun e!558276 () Bool)

(assert (=> d!117357 (=> res!662108 e!558276)))

(assert (=> d!117357 (= res!662108 (bvsge #b00000000000000000000000000000000 (size!30574 _keys!1544)))))

(assert (=> d!117357 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20874) e!558276)))

(declare-fun b!990110 () Bool)

(assert (=> b!990110 (= e!558276 e!558278)))

(declare-fun res!662109 () Bool)

(assert (=> b!990110 (=> (not res!662109) (not e!558278))))

(declare-fun e!558275 () Bool)

(assert (=> b!990110 (= res!662109 (not e!558275))))

(declare-fun res!662110 () Bool)

(assert (=> b!990110 (=> (not res!662110) (not e!558275))))

(assert (=> b!990110 (= res!662110 (validKeyInArray!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990111 () Bool)

(declare-fun contains!5696 (List!20877 (_ BitVec 64)) Bool)

(assert (=> b!990111 (= e!558275 (contains!5696 Nil!20874 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990112 () Bool)

(assert (=> b!990112 (= e!558277 call!41945)))

(assert (= (and d!117357 (not res!662108)) b!990110))

(assert (= (and b!990110 res!662110) b!990111))

(assert (= (and b!990110 res!662109) b!990109))

(assert (= (and b!990109 c!100352) b!990112))

(assert (= (and b!990109 (not c!100352)) b!990108))

(assert (= (or b!990112 b!990108) bm!41942))

(assert (=> bm!41942 m!916965))

(declare-fun m!917009 () Bool)

(assert (=> bm!41942 m!917009))

(assert (=> b!990109 m!916965))

(assert (=> b!990109 m!916965))

(assert (=> b!990109 m!916975))

(assert (=> b!990110 m!916965))

(assert (=> b!990110 m!916965))

(assert (=> b!990110 m!916975))

(assert (=> b!990111 m!916965))

(assert (=> b!990111 m!916965))

(declare-fun m!917011 () Bool)

(assert (=> b!990111 m!917011))

(assert (=> b!989964 d!117357))

(declare-fun d!117359 () Bool)

(declare-fun e!558281 () Bool)

(assert (=> d!117359 e!558281))

(declare-fun res!662116 () Bool)

(assert (=> d!117359 (=> (not res!662116) (not e!558281))))

(declare-fun lt!439111 () ListLongMap!13681)

(assert (=> d!117359 (= res!662116 (contains!5695 lt!439111 (_1!7508 lt!439038)))))

(declare-fun lt!439109 () List!20876)

(assert (=> d!117359 (= lt!439111 (ListLongMap!13682 lt!439109))))

(declare-fun lt!439110 () Unit!32729)

(declare-fun lt!439108 () Unit!32729)

(assert (=> d!117359 (= lt!439110 lt!439108)))

(declare-datatypes ((Option!523 0))(
  ( (Some!522 (v!14269 V!36041)) (None!521) )
))
(declare-fun getValueByKey!517 (List!20876 (_ BitVec 64)) Option!523)

(assert (=> d!117359 (= (getValueByKey!517 lt!439109 (_1!7508 lt!439038)) (Some!522 (_2!7508 lt!439038)))))

(declare-fun lemmaContainsTupThenGetReturnValue!274 (List!20876 (_ BitVec 64) V!36041) Unit!32729)

(assert (=> d!117359 (= lt!439108 (lemmaContainsTupThenGetReturnValue!274 lt!439109 (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(declare-fun insertStrictlySorted!331 (List!20876 (_ BitVec 64) V!36041) List!20876)

(assert (=> d!117359 (= lt!439109 (insertStrictlySorted!331 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(assert (=> d!117359 (= (+!3118 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439038) lt!439111)))

(declare-fun b!990117 () Bool)

(declare-fun res!662115 () Bool)

(assert (=> b!990117 (=> (not res!662115) (not e!558281))))

(assert (=> b!990117 (= res!662115 (= (getValueByKey!517 (toList!6856 lt!439111) (_1!7508 lt!439038)) (Some!522 (_2!7508 lt!439038))))))

(declare-fun b!990118 () Bool)

(declare-fun contains!5697 (List!20876 tuple2!14994) Bool)

(assert (=> b!990118 (= e!558281 (contains!5697 (toList!6856 lt!439111) lt!439038))))

(assert (= (and d!117359 res!662116) b!990117))

(assert (= (and b!990117 res!662115) b!990118))

(declare-fun m!917013 () Bool)

(assert (=> d!117359 m!917013))

(declare-fun m!917015 () Bool)

(assert (=> d!117359 m!917015))

(declare-fun m!917017 () Bool)

(assert (=> d!117359 m!917017))

(declare-fun m!917019 () Bool)

(assert (=> d!117359 m!917019))

(declare-fun m!917021 () Bool)

(assert (=> b!990117 m!917021))

(declare-fun m!917023 () Bool)

(assert (=> b!990118 m!917023))

(assert (=> b!989963 d!117359))

(declare-fun d!117361 () Bool)

(declare-fun e!558282 () Bool)

(assert (=> d!117361 e!558282))

(declare-fun res!662118 () Bool)

(assert (=> d!117361 (=> (not res!662118) (not e!558282))))

(declare-fun lt!439115 () ListLongMap!13681)

(assert (=> d!117361 (= res!662118 (contains!5695 lt!439115 (_1!7508 lt!439039)))))

(declare-fun lt!439113 () List!20876)

(assert (=> d!117361 (= lt!439115 (ListLongMap!13682 lt!439113))))

(declare-fun lt!439114 () Unit!32729)

(declare-fun lt!439112 () Unit!32729)

(assert (=> d!117361 (= lt!439114 lt!439112)))

(assert (=> d!117361 (= (getValueByKey!517 lt!439113 (_1!7508 lt!439039)) (Some!522 (_2!7508 lt!439039)))))

(assert (=> d!117361 (= lt!439112 (lemmaContainsTupThenGetReturnValue!274 lt!439113 (_1!7508 lt!439039) (_2!7508 lt!439039)))))

(assert (=> d!117361 (= lt!439113 (insertStrictlySorted!331 (toList!6856 (+!3118 lt!439037 lt!439038)) (_1!7508 lt!439039) (_2!7508 lt!439039)))))

(assert (=> d!117361 (= (+!3118 (+!3118 lt!439037 lt!439038) lt!439039) lt!439115)))

(declare-fun b!990119 () Bool)

(declare-fun res!662117 () Bool)

(assert (=> b!990119 (=> (not res!662117) (not e!558282))))

(assert (=> b!990119 (= res!662117 (= (getValueByKey!517 (toList!6856 lt!439115) (_1!7508 lt!439039)) (Some!522 (_2!7508 lt!439039))))))

(declare-fun b!990120 () Bool)

(assert (=> b!990120 (= e!558282 (contains!5697 (toList!6856 lt!439115) lt!439039))))

(assert (= (and d!117361 res!662118) b!990119))

(assert (= (and b!990119 res!662117) b!990120))

(declare-fun m!917025 () Bool)

(assert (=> d!117361 m!917025))

(declare-fun m!917027 () Bool)

(assert (=> d!117361 m!917027))

(declare-fun m!917029 () Bool)

(assert (=> d!117361 m!917029))

(declare-fun m!917031 () Bool)

(assert (=> d!117361 m!917031))

(declare-fun m!917033 () Bool)

(assert (=> b!990119 m!917033))

(declare-fun m!917035 () Bool)

(assert (=> b!990120 m!917035))

(assert (=> b!989963 d!117361))

(declare-fun d!117363 () Bool)

(declare-fun e!558283 () Bool)

(assert (=> d!117363 e!558283))

(declare-fun res!662120 () Bool)

(assert (=> d!117363 (=> (not res!662120) (not e!558283))))

(declare-fun lt!439119 () ListLongMap!13681)

(assert (=> d!117363 (= res!662120 (contains!5695 lt!439119 (_1!7508 lt!439039)))))

(declare-fun lt!439117 () List!20876)

(assert (=> d!117363 (= lt!439119 (ListLongMap!13682 lt!439117))))

(declare-fun lt!439118 () Unit!32729)

(declare-fun lt!439116 () Unit!32729)

(assert (=> d!117363 (= lt!439118 lt!439116)))

(assert (=> d!117363 (= (getValueByKey!517 lt!439117 (_1!7508 lt!439039)) (Some!522 (_2!7508 lt!439039)))))

(assert (=> d!117363 (= lt!439116 (lemmaContainsTupThenGetReturnValue!274 lt!439117 (_1!7508 lt!439039) (_2!7508 lt!439039)))))

(assert (=> d!117363 (= lt!439117 (insertStrictlySorted!331 (toList!6856 lt!439037) (_1!7508 lt!439039) (_2!7508 lt!439039)))))

(assert (=> d!117363 (= (+!3118 lt!439037 lt!439039) lt!439119)))

(declare-fun b!990121 () Bool)

(declare-fun res!662119 () Bool)

(assert (=> b!990121 (=> (not res!662119) (not e!558283))))

(assert (=> b!990121 (= res!662119 (= (getValueByKey!517 (toList!6856 lt!439119) (_1!7508 lt!439039)) (Some!522 (_2!7508 lt!439039))))))

(declare-fun b!990122 () Bool)

(assert (=> b!990122 (= e!558283 (contains!5697 (toList!6856 lt!439119) lt!439039))))

(assert (= (and d!117363 res!662120) b!990121))

(assert (= (and b!990121 res!662119) b!990122))

(declare-fun m!917037 () Bool)

(assert (=> d!117363 m!917037))

(declare-fun m!917039 () Bool)

(assert (=> d!117363 m!917039))

(declare-fun m!917041 () Bool)

(assert (=> d!117363 m!917041))

(declare-fun m!917043 () Bool)

(assert (=> d!117363 m!917043))

(declare-fun m!917045 () Bool)

(assert (=> b!990121 m!917045))

(declare-fun m!917047 () Bool)

(assert (=> b!990122 m!917047))

(assert (=> b!989963 d!117363))

(declare-fun d!117365 () Bool)

(assert (=> d!117365 (= (+!3118 (+!3118 lt!439037 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) (+!3118 (+!3118 lt!439037 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun lt!439122 () Unit!32729)

(declare-fun choose!1624 (ListLongMap!13681 (_ BitVec 64) V!36041 (_ BitVec 64) V!36041) Unit!32729)

(assert (=> d!117365 (= lt!439122 (choose!1624 lt!439037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30093 _keys!1544) from!1932) lt!439035))))

(assert (=> d!117365 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> d!117365 (= (addCommutativeForDiffKeys!712 lt!439037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30093 _keys!1544) from!1932) lt!439035) lt!439122)))

(declare-fun bs!28086 () Bool)

(assert (= bs!28086 d!117365))

(declare-fun m!917049 () Bool)

(assert (=> bs!28086 m!917049))

(declare-fun m!917051 () Bool)

(assert (=> bs!28086 m!917051))

(assert (=> bs!28086 m!917049))

(declare-fun m!917053 () Bool)

(assert (=> bs!28086 m!917053))

(assert (=> bs!28086 m!916855))

(declare-fun m!917055 () Bool)

(assert (=> bs!28086 m!917055))

(assert (=> bs!28086 m!917051))

(declare-fun m!917057 () Bool)

(assert (=> bs!28086 m!917057))

(assert (=> b!989963 d!117365))

(declare-fun b!990165 () Bool)

(declare-fun e!558319 () Bool)

(assert (=> b!990165 (= e!558319 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990166 () Bool)

(declare-fun e!558311 () ListLongMap!13681)

(declare-fun call!41960 () ListLongMap!13681)

(assert (=> b!990166 (= e!558311 call!41960)))

(declare-fun b!990167 () Bool)

(declare-fun e!558321 () Bool)

(declare-fun call!41962 () Bool)

(assert (=> b!990167 (= e!558321 (not call!41962))))

(declare-fun bm!41957 () Bool)

(declare-fun call!41966 () ListLongMap!13681)

(assert (=> bm!41957 (= call!41966 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun d!117367 () Bool)

(declare-fun e!558313 () Bool)

(assert (=> d!117367 e!558313))

(declare-fun res!662144 () Bool)

(assert (=> d!117367 (=> (not res!662144) (not e!558313))))

(assert (=> d!117367 (= res!662144 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)))))))

(declare-fun lt!439172 () ListLongMap!13681)

(declare-fun lt!439167 () ListLongMap!13681)

(assert (=> d!117367 (= lt!439172 lt!439167)))

(declare-fun lt!439168 () Unit!32729)

(declare-fun e!558318 () Unit!32729)

(assert (=> d!117367 (= lt!439168 e!558318)))

(declare-fun c!100365 () Bool)

(declare-fun e!558310 () Bool)

(assert (=> d!117367 (= c!100365 e!558310)))

(declare-fun res!662141 () Bool)

(assert (=> d!117367 (=> (not res!662141) (not e!558310))))

(assert (=> d!117367 (= res!662141 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)))))

(declare-fun e!558316 () ListLongMap!13681)

(assert (=> d!117367 (= lt!439167 e!558316)))

(declare-fun c!100369 () Bool)

(assert (=> d!117367 (= c!100369 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117367 (validMask!0 mask!1948)))

(assert (=> d!117367 (= (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439172)))

(declare-fun b!990168 () Bool)

(declare-fun e!558315 () Bool)

(declare-fun e!558317 () Bool)

(assert (=> b!990168 (= e!558315 e!558317)))

(declare-fun res!662143 () Bool)

(assert (=> b!990168 (=> (not res!662143) (not e!558317))))

(assert (=> b!990168 (= res!662143 (contains!5695 lt!439172 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990168 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)))))

(declare-fun b!990169 () Bool)

(declare-fun res!662146 () Bool)

(assert (=> b!990169 (=> (not res!662146) (not e!558313))))

(assert (=> b!990169 (= res!662146 e!558315)))

(declare-fun res!662140 () Bool)

(assert (=> b!990169 (=> res!662140 e!558315)))

(assert (=> b!990169 (= res!662140 (not e!558319))))

(declare-fun res!662145 () Bool)

(assert (=> b!990169 (=> (not res!662145) (not e!558319))))

(assert (=> b!990169 (= res!662145 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)))))

(declare-fun b!990170 () Bool)

(declare-fun call!41963 () ListLongMap!13681)

(assert (=> b!990170 (= e!558316 (+!3118 call!41963 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!41958 () Bool)

(assert (=> bm!41958 (= call!41962 (contains!5695 lt!439172 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990171 () Bool)

(declare-fun lt!439177 () Unit!32729)

(assert (=> b!990171 (= e!558318 lt!439177)))

(declare-fun lt!439169 () ListLongMap!13681)

(assert (=> b!990171 (= lt!439169 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439173 () (_ BitVec 64))

(assert (=> b!990171 (= lt!439173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439176 () (_ BitVec 64))

(assert (=> b!990171 (= lt!439176 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439183 () Unit!32729)

(declare-fun addStillContains!609 (ListLongMap!13681 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32729)

(assert (=> b!990171 (= lt!439183 (addStillContains!609 lt!439169 lt!439173 zeroValue!1220 lt!439176))))

(assert (=> b!990171 (contains!5695 (+!3118 lt!439169 (tuple2!14995 lt!439173 zeroValue!1220)) lt!439176)))

(declare-fun lt!439171 () Unit!32729)

(assert (=> b!990171 (= lt!439171 lt!439183)))

(declare-fun lt!439179 () ListLongMap!13681)

(assert (=> b!990171 (= lt!439179 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439178 () (_ BitVec 64))

(assert (=> b!990171 (= lt!439178 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439187 () (_ BitVec 64))

(assert (=> b!990171 (= lt!439187 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439175 () Unit!32729)

(declare-fun addApplyDifferent!465 (ListLongMap!13681 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32729)

(assert (=> b!990171 (= lt!439175 (addApplyDifferent!465 lt!439179 lt!439178 minValue!1220 lt!439187))))

(assert (=> b!990171 (= (apply!890 (+!3118 lt!439179 (tuple2!14995 lt!439178 minValue!1220)) lt!439187) (apply!890 lt!439179 lt!439187))))

(declare-fun lt!439170 () Unit!32729)

(assert (=> b!990171 (= lt!439170 lt!439175)))

(declare-fun lt!439185 () ListLongMap!13681)

(assert (=> b!990171 (= lt!439185 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439186 () (_ BitVec 64))

(assert (=> b!990171 (= lt!439186 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439188 () (_ BitVec 64))

(assert (=> b!990171 (= lt!439188 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!439181 () Unit!32729)

(assert (=> b!990171 (= lt!439181 (addApplyDifferent!465 lt!439185 lt!439186 zeroValue!1220 lt!439188))))

(assert (=> b!990171 (= (apply!890 (+!3118 lt!439185 (tuple2!14995 lt!439186 zeroValue!1220)) lt!439188) (apply!890 lt!439185 lt!439188))))

(declare-fun lt!439174 () Unit!32729)

(assert (=> b!990171 (= lt!439174 lt!439181)))

(declare-fun lt!439184 () ListLongMap!13681)

(assert (=> b!990171 (= lt!439184 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439182 () (_ BitVec 64))

(assert (=> b!990171 (= lt!439182 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439180 () (_ BitVec 64))

(assert (=> b!990171 (= lt!439180 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!990171 (= lt!439177 (addApplyDifferent!465 lt!439184 lt!439182 minValue!1220 lt!439180))))

(assert (=> b!990171 (= (apply!890 (+!3118 lt!439184 (tuple2!14995 lt!439182 minValue!1220)) lt!439180) (apply!890 lt!439184 lt!439180))))

(declare-fun b!990172 () Bool)

(declare-fun call!41961 () ListLongMap!13681)

(assert (=> b!990172 (= e!558311 call!41961)))

(declare-fun b!990173 () Bool)

(declare-fun e!558314 () Bool)

(declare-fun call!41964 () Bool)

(assert (=> b!990173 (= e!558314 (not call!41964))))

(declare-fun b!990174 () Bool)

(declare-fun e!558312 () Bool)

(assert (=> b!990174 (= e!558321 e!558312)))

(declare-fun res!662142 () Bool)

(assert (=> b!990174 (= res!662142 call!41962)))

(assert (=> b!990174 (=> (not res!662142) (not e!558312))))

(declare-fun b!990175 () Bool)

(declare-fun Unit!32735 () Unit!32729)

(assert (=> b!990175 (= e!558318 Unit!32735)))

(declare-fun b!990176 () Bool)

(assert (=> b!990176 (= e!558310 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990177 () Bool)

(declare-fun res!662147 () Bool)

(assert (=> b!990177 (=> (not res!662147) (not e!558313))))

(assert (=> b!990177 (= res!662147 e!558314)))

(declare-fun c!100368 () Bool)

(assert (=> b!990177 (= c!100368 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!990178 () Bool)

(assert (=> b!990178 (= e!558313 e!558321)))

(declare-fun c!100370 () Bool)

(assert (=> b!990178 (= c!100370 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990179 () Bool)

(assert (=> b!990179 (= e!558312 (= (apply!890 lt!439172 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun bm!41959 () Bool)

(declare-fun call!41965 () ListLongMap!13681)

(assert (=> bm!41959 (= call!41960 call!41965)))

(declare-fun bm!41960 () Bool)

(assert (=> bm!41960 (= call!41965 call!41966)))

(declare-fun b!990180 () Bool)

(declare-fun c!100366 () Bool)

(assert (=> b!990180 (= c!100366 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!558322 () ListLongMap!13681)

(assert (=> b!990180 (= e!558322 e!558311)))

(declare-fun b!990181 () Bool)

(assert (=> b!990181 (= e!558322 call!41961)))

(declare-fun bm!41961 () Bool)

(assert (=> bm!41961 (= call!41961 call!41963)))

(declare-fun bm!41962 () Bool)

(assert (=> bm!41962 (= call!41964 (contains!5695 lt!439172 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990182 () Bool)

(assert (=> b!990182 (= e!558317 (= (apply!890 lt!439172 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990182 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30573 _values!1278)))))

(assert (=> b!990182 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30574 _keys!1544)))))

(declare-fun b!990183 () Bool)

(declare-fun e!558320 () Bool)

(assert (=> b!990183 (= e!558320 (= (apply!890 lt!439172 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!990184 () Bool)

(assert (=> b!990184 (= e!558316 e!558322)))

(declare-fun c!100367 () Bool)

(assert (=> b!990184 (= c!100367 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990185 () Bool)

(assert (=> b!990185 (= e!558314 e!558320)))

(declare-fun res!662139 () Bool)

(assert (=> b!990185 (= res!662139 call!41964)))

(assert (=> b!990185 (=> (not res!662139) (not e!558320))))

(declare-fun bm!41963 () Bool)

(assert (=> bm!41963 (= call!41963 (+!3118 (ite c!100369 call!41966 (ite c!100367 call!41965 call!41960)) (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117367 c!100369) b!990170))

(assert (= (and d!117367 (not c!100369)) b!990184))

(assert (= (and b!990184 c!100367) b!990181))

(assert (= (and b!990184 (not c!100367)) b!990180))

(assert (= (and b!990180 c!100366) b!990172))

(assert (= (and b!990180 (not c!100366)) b!990166))

(assert (= (or b!990172 b!990166) bm!41959))

(assert (= (or b!990181 bm!41959) bm!41960))

(assert (= (or b!990181 b!990172) bm!41961))

(assert (= (or b!990170 bm!41960) bm!41957))

(assert (= (or b!990170 bm!41961) bm!41963))

(assert (= (and d!117367 res!662141) b!990176))

(assert (= (and d!117367 c!100365) b!990171))

(assert (= (and d!117367 (not c!100365)) b!990175))

(assert (= (and d!117367 res!662144) b!990169))

(assert (= (and b!990169 res!662145) b!990165))

(assert (= (and b!990169 (not res!662140)) b!990168))

(assert (= (and b!990168 res!662143) b!990182))

(assert (= (and b!990169 res!662146) b!990177))

(assert (= (and b!990177 c!100368) b!990185))

(assert (= (and b!990177 (not c!100368)) b!990173))

(assert (= (and b!990185 res!662139) b!990183))

(assert (= (or b!990185 b!990173) bm!41962))

(assert (= (and b!990177 res!662147) b!990178))

(assert (= (and b!990178 c!100370) b!990174))

(assert (= (and b!990178 (not c!100370)) b!990167))

(assert (= (and b!990174 res!662142) b!990179))

(assert (= (or b!990174 b!990167) bm!41958))

(declare-fun b_lambda!15151 () Bool)

(assert (=> (not b_lambda!15151) (not b!990182)))

(assert (=> b!990182 t!29839))

(declare-fun b_and!32215 () Bool)

(assert (= b_and!32213 (and (=> t!29839 result!13639) b_and!32215)))

(assert (=> b!990165 m!916989))

(assert (=> b!990165 m!916989))

(assert (=> b!990165 m!917005))

(declare-fun m!917059 () Bool)

(assert (=> bm!41962 m!917059))

(assert (=> bm!41957 m!916859))

(declare-fun m!917061 () Bool)

(assert (=> b!990183 m!917061))

(declare-fun m!917063 () Bool)

(assert (=> bm!41958 m!917063))

(assert (=> d!117367 m!916847))

(declare-fun m!917065 () Bool)

(assert (=> b!990171 m!917065))

(assert (=> b!990171 m!916989))

(declare-fun m!917067 () Bool)

(assert (=> b!990171 m!917067))

(declare-fun m!917069 () Bool)

(assert (=> b!990171 m!917069))

(declare-fun m!917071 () Bool)

(assert (=> b!990171 m!917071))

(declare-fun m!917073 () Bool)

(assert (=> b!990171 m!917073))

(declare-fun m!917075 () Bool)

(assert (=> b!990171 m!917075))

(declare-fun m!917077 () Bool)

(assert (=> b!990171 m!917077))

(declare-fun m!917079 () Bool)

(assert (=> b!990171 m!917079))

(declare-fun m!917081 () Bool)

(assert (=> b!990171 m!917081))

(assert (=> b!990171 m!917067))

(declare-fun m!917083 () Bool)

(assert (=> b!990171 m!917083))

(declare-fun m!917085 () Bool)

(assert (=> b!990171 m!917085))

(assert (=> b!990171 m!917081))

(declare-fun m!917087 () Bool)

(assert (=> b!990171 m!917087))

(assert (=> b!990171 m!916859))

(assert (=> b!990171 m!917071))

(declare-fun m!917089 () Bool)

(assert (=> b!990171 m!917089))

(declare-fun m!917091 () Bool)

(assert (=> b!990171 m!917091))

(assert (=> b!990171 m!917077))

(declare-fun m!917093 () Bool)

(assert (=> b!990171 m!917093))

(declare-fun m!917095 () Bool)

(assert (=> bm!41963 m!917095))

(declare-fun m!917097 () Bool)

(assert (=> b!990179 m!917097))

(assert (=> b!990168 m!916989))

(assert (=> b!990168 m!916989))

(declare-fun m!917099 () Bool)

(assert (=> b!990168 m!917099))

(assert (=> b!990182 m!916983))

(assert (=> b!990182 m!916989))

(declare-fun m!917101 () Bool)

(assert (=> b!990182 m!917101))

(assert (=> b!990182 m!916861))

(assert (=> b!990182 m!916989))

(assert (=> b!990182 m!916983))

(assert (=> b!990182 m!916861))

(assert (=> b!990182 m!916985))

(assert (=> b!990176 m!916989))

(assert (=> b!990176 m!916989))

(assert (=> b!990176 m!917005))

(declare-fun m!917103 () Bool)

(assert (=> b!990170 m!917103))

(assert (=> b!989963 d!117367))

(declare-fun b!990186 () Bool)

(declare-fun e!558332 () Bool)

(assert (=> b!990186 (= e!558332 (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)))))

(declare-fun b!990187 () Bool)

(declare-fun e!558324 () ListLongMap!13681)

(declare-fun call!41967 () ListLongMap!13681)

(assert (=> b!990187 (= e!558324 call!41967)))

(declare-fun b!990188 () Bool)

(declare-fun e!558334 () Bool)

(declare-fun call!41969 () Bool)

(assert (=> b!990188 (= e!558334 (not call!41969))))

(declare-fun bm!41964 () Bool)

(declare-fun call!41973 () ListLongMap!13681)

(assert (=> bm!41964 (= call!41973 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun d!117369 () Bool)

(declare-fun e!558326 () Bool)

(assert (=> d!117369 e!558326))

(declare-fun res!662153 () Bool)

(assert (=> d!117369 (=> (not res!662153) (not e!558326))))

(assert (=> d!117369 (= res!662153 (or (bvsge from!1932 (size!30574 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30574 _keys!1544)))))))

(declare-fun lt!439194 () ListLongMap!13681)

(declare-fun lt!439189 () ListLongMap!13681)

(assert (=> d!117369 (= lt!439194 lt!439189)))

(declare-fun lt!439190 () Unit!32729)

(declare-fun e!558331 () Unit!32729)

(assert (=> d!117369 (= lt!439190 e!558331)))

(declare-fun c!100371 () Bool)

(declare-fun e!558323 () Bool)

(assert (=> d!117369 (= c!100371 e!558323)))

(declare-fun res!662150 () Bool)

(assert (=> d!117369 (=> (not res!662150) (not e!558323))))

(assert (=> d!117369 (= res!662150 (bvslt from!1932 (size!30574 _keys!1544)))))

(declare-fun e!558329 () ListLongMap!13681)

(assert (=> d!117369 (= lt!439189 e!558329)))

(declare-fun c!100375 () Bool)

(assert (=> d!117369 (= c!100375 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117369 (validMask!0 mask!1948)))

(assert (=> d!117369 (= (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439194)))

(declare-fun b!990189 () Bool)

(declare-fun e!558328 () Bool)

(declare-fun e!558330 () Bool)

(assert (=> b!990189 (= e!558328 e!558330)))

(declare-fun res!662152 () Bool)

(assert (=> b!990189 (=> (not res!662152) (not e!558330))))

(assert (=> b!990189 (= res!662152 (contains!5695 lt!439194 (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> b!990189 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30574 _keys!1544)))))

(declare-fun b!990190 () Bool)

(declare-fun res!662155 () Bool)

(assert (=> b!990190 (=> (not res!662155) (not e!558326))))

(assert (=> b!990190 (= res!662155 e!558328)))

(declare-fun res!662149 () Bool)

(assert (=> b!990190 (=> res!662149 e!558328)))

(assert (=> b!990190 (= res!662149 (not e!558332))))

(declare-fun res!662154 () Bool)

(assert (=> b!990190 (=> (not res!662154) (not e!558332))))

(assert (=> b!990190 (= res!662154 (bvslt from!1932 (size!30574 _keys!1544)))))

(declare-fun b!990191 () Bool)

(declare-fun call!41970 () ListLongMap!13681)

(assert (=> b!990191 (= e!558329 (+!3118 call!41970 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!41965 () Bool)

(assert (=> bm!41965 (= call!41969 (contains!5695 lt!439194 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990192 () Bool)

(declare-fun lt!439199 () Unit!32729)

(assert (=> b!990192 (= e!558331 lt!439199)))

(declare-fun lt!439191 () ListLongMap!13681)

(assert (=> b!990192 (= lt!439191 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439195 () (_ BitVec 64))

(assert (=> b!990192 (= lt!439195 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439198 () (_ BitVec 64))

(assert (=> b!990192 (= lt!439198 (select (arr!30093 _keys!1544) from!1932))))

(declare-fun lt!439205 () Unit!32729)

(assert (=> b!990192 (= lt!439205 (addStillContains!609 lt!439191 lt!439195 zeroValue!1220 lt!439198))))

(assert (=> b!990192 (contains!5695 (+!3118 lt!439191 (tuple2!14995 lt!439195 zeroValue!1220)) lt!439198)))

(declare-fun lt!439193 () Unit!32729)

(assert (=> b!990192 (= lt!439193 lt!439205)))

(declare-fun lt!439201 () ListLongMap!13681)

(assert (=> b!990192 (= lt!439201 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439200 () (_ BitVec 64))

(assert (=> b!990192 (= lt!439200 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439209 () (_ BitVec 64))

(assert (=> b!990192 (= lt!439209 (select (arr!30093 _keys!1544) from!1932))))

(declare-fun lt!439197 () Unit!32729)

(assert (=> b!990192 (= lt!439197 (addApplyDifferent!465 lt!439201 lt!439200 minValue!1220 lt!439209))))

(assert (=> b!990192 (= (apply!890 (+!3118 lt!439201 (tuple2!14995 lt!439200 minValue!1220)) lt!439209) (apply!890 lt!439201 lt!439209))))

(declare-fun lt!439192 () Unit!32729)

(assert (=> b!990192 (= lt!439192 lt!439197)))

(declare-fun lt!439207 () ListLongMap!13681)

(assert (=> b!990192 (= lt!439207 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439208 () (_ BitVec 64))

(assert (=> b!990192 (= lt!439208 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439210 () (_ BitVec 64))

(assert (=> b!990192 (= lt!439210 (select (arr!30093 _keys!1544) from!1932))))

(declare-fun lt!439203 () Unit!32729)

(assert (=> b!990192 (= lt!439203 (addApplyDifferent!465 lt!439207 lt!439208 zeroValue!1220 lt!439210))))

(assert (=> b!990192 (= (apply!890 (+!3118 lt!439207 (tuple2!14995 lt!439208 zeroValue!1220)) lt!439210) (apply!890 lt!439207 lt!439210))))

(declare-fun lt!439196 () Unit!32729)

(assert (=> b!990192 (= lt!439196 lt!439203)))

(declare-fun lt!439206 () ListLongMap!13681)

(assert (=> b!990192 (= lt!439206 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!439204 () (_ BitVec 64))

(assert (=> b!990192 (= lt!439204 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!439202 () (_ BitVec 64))

(assert (=> b!990192 (= lt!439202 (select (arr!30093 _keys!1544) from!1932))))

(assert (=> b!990192 (= lt!439199 (addApplyDifferent!465 lt!439206 lt!439204 minValue!1220 lt!439202))))

(assert (=> b!990192 (= (apply!890 (+!3118 lt!439206 (tuple2!14995 lt!439204 minValue!1220)) lt!439202) (apply!890 lt!439206 lt!439202))))

(declare-fun b!990193 () Bool)

(declare-fun call!41968 () ListLongMap!13681)

(assert (=> b!990193 (= e!558324 call!41968)))

(declare-fun b!990194 () Bool)

(declare-fun e!558327 () Bool)

(declare-fun call!41971 () Bool)

(assert (=> b!990194 (= e!558327 (not call!41971))))

(declare-fun b!990195 () Bool)

(declare-fun e!558325 () Bool)

(assert (=> b!990195 (= e!558334 e!558325)))

(declare-fun res!662151 () Bool)

(assert (=> b!990195 (= res!662151 call!41969)))

(assert (=> b!990195 (=> (not res!662151) (not e!558325))))

(declare-fun b!990196 () Bool)

(declare-fun Unit!32736 () Unit!32729)

(assert (=> b!990196 (= e!558331 Unit!32736)))

(declare-fun b!990197 () Bool)

(assert (=> b!990197 (= e!558323 (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)))))

(declare-fun b!990198 () Bool)

(declare-fun res!662156 () Bool)

(assert (=> b!990198 (=> (not res!662156) (not e!558326))))

(assert (=> b!990198 (= res!662156 e!558327)))

(declare-fun c!100374 () Bool)

(assert (=> b!990198 (= c!100374 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!990199 () Bool)

(assert (=> b!990199 (= e!558326 e!558334)))

(declare-fun c!100376 () Bool)

(assert (=> b!990199 (= c!100376 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990200 () Bool)

(assert (=> b!990200 (= e!558325 (= (apply!890 lt!439194 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun bm!41966 () Bool)

(declare-fun call!41972 () ListLongMap!13681)

(assert (=> bm!41966 (= call!41967 call!41972)))

(declare-fun bm!41967 () Bool)

(assert (=> bm!41967 (= call!41972 call!41973)))

(declare-fun b!990201 () Bool)

(declare-fun c!100372 () Bool)

(assert (=> b!990201 (= c!100372 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!558335 () ListLongMap!13681)

(assert (=> b!990201 (= e!558335 e!558324)))

(declare-fun b!990202 () Bool)

(assert (=> b!990202 (= e!558335 call!41968)))

(declare-fun bm!41968 () Bool)

(assert (=> bm!41968 (= call!41968 call!41970)))

(declare-fun bm!41969 () Bool)

(assert (=> bm!41969 (= call!41971 (contains!5695 lt!439194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990203 () Bool)

(assert (=> b!990203 (= e!558330 (= (apply!890 lt!439194 (select (arr!30093 _keys!1544) from!1932)) (get!15637 (select (arr!30092 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990203 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30573 _values!1278)))))

(assert (=> b!990203 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30574 _keys!1544)))))

(declare-fun b!990204 () Bool)

(declare-fun e!558333 () Bool)

(assert (=> b!990204 (= e!558333 (= (apply!890 lt!439194 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!990205 () Bool)

(assert (=> b!990205 (= e!558329 e!558335)))

(declare-fun c!100373 () Bool)

(assert (=> b!990205 (= c!100373 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!990206 () Bool)

(assert (=> b!990206 (= e!558327 e!558333)))

(declare-fun res!662148 () Bool)

(assert (=> b!990206 (= res!662148 call!41971)))

(assert (=> b!990206 (=> (not res!662148) (not e!558333))))

(declare-fun bm!41970 () Bool)

(assert (=> bm!41970 (= call!41970 (+!3118 (ite c!100375 call!41973 (ite c!100373 call!41972 call!41967)) (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117369 c!100375) b!990191))

(assert (= (and d!117369 (not c!100375)) b!990205))

(assert (= (and b!990205 c!100373) b!990202))

(assert (= (and b!990205 (not c!100373)) b!990201))

(assert (= (and b!990201 c!100372) b!990193))

(assert (= (and b!990201 (not c!100372)) b!990187))

(assert (= (or b!990193 b!990187) bm!41966))

(assert (= (or b!990202 bm!41966) bm!41967))

(assert (= (or b!990202 b!990193) bm!41968))

(assert (= (or b!990191 bm!41967) bm!41964))

(assert (= (or b!990191 bm!41968) bm!41970))

(assert (= (and d!117369 res!662150) b!990197))

(assert (= (and d!117369 c!100371) b!990192))

(assert (= (and d!117369 (not c!100371)) b!990196))

(assert (= (and d!117369 res!662153) b!990190))

(assert (= (and b!990190 res!662154) b!990186))

(assert (= (and b!990190 (not res!662149)) b!990189))

(assert (= (and b!990189 res!662152) b!990203))

(assert (= (and b!990190 res!662155) b!990198))

(assert (= (and b!990198 c!100374) b!990206))

(assert (= (and b!990198 (not c!100374)) b!990194))

(assert (= (and b!990206 res!662148) b!990204))

(assert (= (or b!990206 b!990194) bm!41969))

(assert (= (and b!990198 res!662156) b!990199))

(assert (= (and b!990199 c!100376) b!990195))

(assert (= (and b!990199 (not c!100376)) b!990188))

(assert (= (and b!990195 res!662151) b!990200))

(assert (= (or b!990195 b!990188) bm!41965))

(declare-fun b_lambda!15153 () Bool)

(assert (=> (not b_lambda!15153) (not b!990203)))

(assert (=> b!990203 t!29839))

(declare-fun b_and!32217 () Bool)

(assert (= b_and!32215 (and (=> t!29839 result!13639) b_and!32217)))

(assert (=> b!990186 m!916855))

(assert (=> b!990186 m!916855))

(assert (=> b!990186 m!916883))

(declare-fun m!917105 () Bool)

(assert (=> bm!41969 m!917105))

(declare-fun m!917107 () Bool)

(assert (=> bm!41964 m!917107))

(declare-fun m!917109 () Bool)

(assert (=> b!990204 m!917109))

(declare-fun m!917111 () Bool)

(assert (=> bm!41965 m!917111))

(assert (=> d!117369 m!916847))

(declare-fun m!917113 () Bool)

(assert (=> b!990192 m!917113))

(assert (=> b!990192 m!916855))

(declare-fun m!917115 () Bool)

(assert (=> b!990192 m!917115))

(declare-fun m!917117 () Bool)

(assert (=> b!990192 m!917117))

(declare-fun m!917119 () Bool)

(assert (=> b!990192 m!917119))

(declare-fun m!917121 () Bool)

(assert (=> b!990192 m!917121))

(declare-fun m!917123 () Bool)

(assert (=> b!990192 m!917123))

(declare-fun m!917125 () Bool)

(assert (=> b!990192 m!917125))

(declare-fun m!917127 () Bool)

(assert (=> b!990192 m!917127))

(declare-fun m!917129 () Bool)

(assert (=> b!990192 m!917129))

(assert (=> b!990192 m!917115))

(declare-fun m!917131 () Bool)

(assert (=> b!990192 m!917131))

(declare-fun m!917133 () Bool)

(assert (=> b!990192 m!917133))

(assert (=> b!990192 m!917129))

(declare-fun m!917135 () Bool)

(assert (=> b!990192 m!917135))

(assert (=> b!990192 m!917107))

(assert (=> b!990192 m!917119))

(declare-fun m!917137 () Bool)

(assert (=> b!990192 m!917137))

(declare-fun m!917139 () Bool)

(assert (=> b!990192 m!917139))

(assert (=> b!990192 m!917125))

(declare-fun m!917141 () Bool)

(assert (=> b!990192 m!917141))

(declare-fun m!917143 () Bool)

(assert (=> bm!41970 m!917143))

(declare-fun m!917145 () Bool)

(assert (=> b!990200 m!917145))

(assert (=> b!990189 m!916855))

(assert (=> b!990189 m!916855))

(declare-fun m!917147 () Bool)

(assert (=> b!990189 m!917147))

(assert (=> b!990203 m!916857))

(assert (=> b!990203 m!916855))

(declare-fun m!917149 () Bool)

(assert (=> b!990203 m!917149))

(assert (=> b!990203 m!916861))

(assert (=> b!990203 m!916855))

(assert (=> b!990203 m!916857))

(assert (=> b!990203 m!916861))

(assert (=> b!990203 m!916863))

(assert (=> b!990197 m!916855))

(assert (=> b!990197 m!916855))

(assert (=> b!990197 m!916883))

(declare-fun m!917151 () Bool)

(assert (=> b!990191 m!917151))

(assert (=> b!989963 d!117369))

(declare-fun d!117371 () Bool)

(declare-fun e!558336 () Bool)

(assert (=> d!117371 e!558336))

(declare-fun res!662158 () Bool)

(assert (=> d!117371 (=> (not res!662158) (not e!558336))))

(declare-fun lt!439214 () ListLongMap!13681)

(assert (=> d!117371 (= res!662158 (contains!5695 lt!439214 (_1!7508 lt!439038)))))

(declare-fun lt!439212 () List!20876)

(assert (=> d!117371 (= lt!439214 (ListLongMap!13682 lt!439212))))

(declare-fun lt!439213 () Unit!32729)

(declare-fun lt!439211 () Unit!32729)

(assert (=> d!117371 (= lt!439213 lt!439211)))

(assert (=> d!117371 (= (getValueByKey!517 lt!439212 (_1!7508 lt!439038)) (Some!522 (_2!7508 lt!439038)))))

(assert (=> d!117371 (= lt!439211 (lemmaContainsTupThenGetReturnValue!274 lt!439212 (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(assert (=> d!117371 (= lt!439212 (insertStrictlySorted!331 (toList!6856 lt!439037) (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(assert (=> d!117371 (= (+!3118 lt!439037 lt!439038) lt!439214)))

(declare-fun b!990207 () Bool)

(declare-fun res!662157 () Bool)

(assert (=> b!990207 (=> (not res!662157) (not e!558336))))

(assert (=> b!990207 (= res!662157 (= (getValueByKey!517 (toList!6856 lt!439214) (_1!7508 lt!439038)) (Some!522 (_2!7508 lt!439038))))))

(declare-fun b!990208 () Bool)

(assert (=> b!990208 (= e!558336 (contains!5697 (toList!6856 lt!439214) lt!439038))))

(assert (= (and d!117371 res!662158) b!990207))

(assert (= (and b!990207 res!662157) b!990208))

(declare-fun m!917153 () Bool)

(assert (=> d!117371 m!917153))

(declare-fun m!917155 () Bool)

(assert (=> d!117371 m!917155))

(declare-fun m!917157 () Bool)

(assert (=> d!117371 m!917157))

(declare-fun m!917159 () Bool)

(assert (=> d!117371 m!917159))

(declare-fun m!917161 () Bool)

(assert (=> b!990207 m!917161))

(declare-fun m!917163 () Bool)

(assert (=> b!990208 m!917163))

(assert (=> b!989963 d!117371))

(declare-fun d!117373 () Bool)

(declare-fun e!558337 () Bool)

(assert (=> d!117373 e!558337))

(declare-fun res!662160 () Bool)

(assert (=> d!117373 (=> (not res!662160) (not e!558337))))

(declare-fun lt!439218 () ListLongMap!13681)

(assert (=> d!117373 (= res!662160 (contains!5695 lt!439218 (_1!7508 lt!439038)))))

(declare-fun lt!439216 () List!20876)

(assert (=> d!117373 (= lt!439218 (ListLongMap!13682 lt!439216))))

(declare-fun lt!439217 () Unit!32729)

(declare-fun lt!439215 () Unit!32729)

(assert (=> d!117373 (= lt!439217 lt!439215)))

(assert (=> d!117373 (= (getValueByKey!517 lt!439216 (_1!7508 lt!439038)) (Some!522 (_2!7508 lt!439038)))))

(assert (=> d!117373 (= lt!439215 (lemmaContainsTupThenGetReturnValue!274 lt!439216 (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(assert (=> d!117373 (= lt!439216 (insertStrictlySorted!331 (toList!6856 (+!3118 lt!439037 lt!439039)) (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(assert (=> d!117373 (= (+!3118 (+!3118 lt!439037 lt!439039) lt!439038) lt!439218)))

(declare-fun b!990209 () Bool)

(declare-fun res!662159 () Bool)

(assert (=> b!990209 (=> (not res!662159) (not e!558337))))

(assert (=> b!990209 (= res!662159 (= (getValueByKey!517 (toList!6856 lt!439218) (_1!7508 lt!439038)) (Some!522 (_2!7508 lt!439038))))))

(declare-fun b!990210 () Bool)

(assert (=> b!990210 (= e!558337 (contains!5697 (toList!6856 lt!439218) lt!439038))))

(assert (= (and d!117373 res!662160) b!990209))

(assert (= (and b!990209 res!662159) b!990210))

(declare-fun m!917165 () Bool)

(assert (=> d!117373 m!917165))

(declare-fun m!917167 () Bool)

(assert (=> d!117373 m!917167))

(declare-fun m!917169 () Bool)

(assert (=> d!117373 m!917169))

(declare-fun m!917171 () Bool)

(assert (=> d!117373 m!917171))

(declare-fun m!917173 () Bool)

(assert (=> b!990209 m!917173))

(declare-fun m!917175 () Bool)

(assert (=> b!990210 m!917175))

(assert (=> b!989963 d!117373))

(declare-fun b!990218 () Bool)

(declare-fun e!558342 () Bool)

(assert (=> b!990218 (= e!558342 tp_is_empty!23293)))

(declare-fun condMapEmpty!36997 () Bool)

(declare-fun mapDefault!36997 () ValueCell!11165)

(assert (=> mapNonEmpty!36988 (= condMapEmpty!36997 (= mapRest!36988 ((as const (Array (_ BitVec 32) ValueCell!11165)) mapDefault!36997)))))

(declare-fun mapRes!36997 () Bool)

(assert (=> mapNonEmpty!36988 (= tp!70027 (and e!558342 mapRes!36997))))

(declare-fun mapIsEmpty!36997 () Bool)

(assert (=> mapIsEmpty!36997 mapRes!36997))

(declare-fun mapNonEmpty!36997 () Bool)

(declare-fun tp!70042 () Bool)

(declare-fun e!558343 () Bool)

(assert (=> mapNonEmpty!36997 (= mapRes!36997 (and tp!70042 e!558343))))

(declare-fun mapRest!36997 () (Array (_ BitVec 32) ValueCell!11165))

(declare-fun mapKey!36997 () (_ BitVec 32))

(declare-fun mapValue!36997 () ValueCell!11165)

(assert (=> mapNonEmpty!36997 (= mapRest!36988 (store mapRest!36997 mapKey!36997 mapValue!36997))))

(declare-fun b!990217 () Bool)

(assert (=> b!990217 (= e!558343 tp_is_empty!23293)))

(assert (= (and mapNonEmpty!36988 condMapEmpty!36997) mapIsEmpty!36997))

(assert (= (and mapNonEmpty!36988 (not condMapEmpty!36997)) mapNonEmpty!36997))

(assert (= (and mapNonEmpty!36997 ((_ is ValueCellFull!11165) mapValue!36997)) b!990217))

(assert (= (and mapNonEmpty!36988 ((_ is ValueCellFull!11165) mapDefault!36997)) b!990218))

(declare-fun m!917177 () Bool)

(assert (=> mapNonEmpty!36997 m!917177))

(declare-fun b_lambda!15155 () Bool)

(assert (= b_lambda!15151 (or (and start!84648 b_free!20077) b_lambda!15155)))

(declare-fun b_lambda!15157 () Bool)

(assert (= b_lambda!15147 (or (and start!84648 b_free!20077) b_lambda!15157)))

(declare-fun b_lambda!15159 () Bool)

(assert (= b_lambda!15149 (or (and start!84648 b_free!20077) b_lambda!15159)))

(declare-fun b_lambda!15161 () Bool)

(assert (= b_lambda!15153 (or (and start!84648 b_free!20077) b_lambda!15161)))

(check-sat (not bm!41962) (not d!117371) tp_is_empty!23293 (not b!990208) (not b!990209) (not b!990192) (not b!990179) (not b!990121) (not b_lambda!15159) (not d!117347) (not b!990207) (not b_lambda!15161) (not b!990095) (not b!990171) (not bm!41939) (not b!990203) (not d!117367) (not d!117365) (not b!990053) (not b_lambda!15157) (not b!990096) (not bm!41957) (not b!990052) (not bm!41942) (not bm!41958) (not b!990087) (not b!990109) (not b!990183) (not mapNonEmpty!36997) (not bm!41965) (not b_lambda!15155) (not bm!41970) (not bm!41969) (not b!990165) (not d!117369) (not b!990122) (not b!990197) (not b_next!20077) (not b!990061) (not b!990097) (not b!990086) (not b!990120) (not d!117359) (not b!990117) (not b!990204) (not b_lambda!15145) (not bm!41964) (not b!990110) (not b!990118) (not b!990060) (not d!117363) (not b!990111) (not b!990200) (not d!117361) (not b!990168) (not b!990094) (not b!990089) b_and!32217 (not b!990176) (not b!990091) (not b!990119) (not b!990210) (not b!990189) (not bm!41936) (not b!990191) (not b!990186) (not b!990182) (not b!990170) (not d!117373) (not bm!41963))
(check-sat b_and!32217 (not b_next!20077))
(get-model)

(declare-fun d!117375 () Bool)

(declare-fun e!558348 () Bool)

(assert (=> d!117375 e!558348))

(declare-fun res!662163 () Bool)

(assert (=> d!117375 (=> res!662163 e!558348)))

(declare-fun lt!439230 () Bool)

(assert (=> d!117375 (= res!662163 (not lt!439230))))

(declare-fun lt!439228 () Bool)

(assert (=> d!117375 (= lt!439230 lt!439228)))

(declare-fun lt!439229 () Unit!32729)

(declare-fun e!558349 () Unit!32729)

(assert (=> d!117375 (= lt!439229 e!558349)))

(declare-fun c!100379 () Bool)

(assert (=> d!117375 (= c!100379 lt!439228)))

(declare-fun containsKey!479 (List!20876 (_ BitVec 64)) Bool)

(assert (=> d!117375 (= lt!439228 (containsKey!479 (toList!6856 lt!439218) (_1!7508 lt!439038)))))

(assert (=> d!117375 (= (contains!5695 lt!439218 (_1!7508 lt!439038)) lt!439230)))

(declare-fun b!990225 () Bool)

(declare-fun lt!439227 () Unit!32729)

(assert (=> b!990225 (= e!558349 lt!439227)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!374 (List!20876 (_ BitVec 64)) Unit!32729)

(assert (=> b!990225 (= lt!439227 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439218) (_1!7508 lt!439038)))))

(declare-fun isDefined!387 (Option!523) Bool)

(assert (=> b!990225 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439218) (_1!7508 lt!439038)))))

(declare-fun b!990226 () Bool)

(declare-fun Unit!32737 () Unit!32729)

(assert (=> b!990226 (= e!558349 Unit!32737)))

(declare-fun b!990227 () Bool)

(assert (=> b!990227 (= e!558348 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439218) (_1!7508 lt!439038))))))

(assert (= (and d!117375 c!100379) b!990225))

(assert (= (and d!117375 (not c!100379)) b!990226))

(assert (= (and d!117375 (not res!662163)) b!990227))

(declare-fun m!917179 () Bool)

(assert (=> d!117375 m!917179))

(declare-fun m!917181 () Bool)

(assert (=> b!990225 m!917181))

(assert (=> b!990225 m!917173))

(assert (=> b!990225 m!917173))

(declare-fun m!917183 () Bool)

(assert (=> b!990225 m!917183))

(assert (=> b!990227 m!917173))

(assert (=> b!990227 m!917173))

(assert (=> b!990227 m!917183))

(assert (=> d!117373 d!117375))

(declare-fun b!990237 () Bool)

(declare-fun e!558354 () Option!523)

(declare-fun e!558355 () Option!523)

(assert (=> b!990237 (= e!558354 e!558355)))

(declare-fun c!100385 () Bool)

(assert (=> b!990237 (= c!100385 (and ((_ is Cons!20872) lt!439216) (not (= (_1!7508 (h!22034 lt!439216)) (_1!7508 lt!439038)))))))

(declare-fun b!990238 () Bool)

(assert (=> b!990238 (= e!558355 (getValueByKey!517 (t!29840 lt!439216) (_1!7508 lt!439038)))))

(declare-fun d!117377 () Bool)

(declare-fun c!100384 () Bool)

(assert (=> d!117377 (= c!100384 (and ((_ is Cons!20872) lt!439216) (= (_1!7508 (h!22034 lt!439216)) (_1!7508 lt!439038))))))

(assert (=> d!117377 (= (getValueByKey!517 lt!439216 (_1!7508 lt!439038)) e!558354)))

(declare-fun b!990236 () Bool)

(assert (=> b!990236 (= e!558354 (Some!522 (_2!7508 (h!22034 lt!439216))))))

(declare-fun b!990239 () Bool)

(assert (=> b!990239 (= e!558355 None!521)))

(assert (= (and d!117377 c!100384) b!990236))

(assert (= (and d!117377 (not c!100384)) b!990237))

(assert (= (and b!990237 c!100385) b!990238))

(assert (= (and b!990237 (not c!100385)) b!990239))

(declare-fun m!917185 () Bool)

(assert (=> b!990238 m!917185))

(assert (=> d!117373 d!117377))

(declare-fun d!117379 () Bool)

(assert (=> d!117379 (= (getValueByKey!517 lt!439216 (_1!7508 lt!439038)) (Some!522 (_2!7508 lt!439038)))))

(declare-fun lt!439233 () Unit!32729)

(declare-fun choose!1625 (List!20876 (_ BitVec 64) V!36041) Unit!32729)

(assert (=> d!117379 (= lt!439233 (choose!1625 lt!439216 (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(declare-fun e!558358 () Bool)

(assert (=> d!117379 e!558358))

(declare-fun res!662168 () Bool)

(assert (=> d!117379 (=> (not res!662168) (not e!558358))))

(declare-fun isStrictlySorted!513 (List!20876) Bool)

(assert (=> d!117379 (= res!662168 (isStrictlySorted!513 lt!439216))))

(assert (=> d!117379 (= (lemmaContainsTupThenGetReturnValue!274 lt!439216 (_1!7508 lt!439038) (_2!7508 lt!439038)) lt!439233)))

(declare-fun b!990244 () Bool)

(declare-fun res!662169 () Bool)

(assert (=> b!990244 (=> (not res!662169) (not e!558358))))

(assert (=> b!990244 (= res!662169 (containsKey!479 lt!439216 (_1!7508 lt!439038)))))

(declare-fun b!990245 () Bool)

(assert (=> b!990245 (= e!558358 (contains!5697 lt!439216 (tuple2!14995 (_1!7508 lt!439038) (_2!7508 lt!439038))))))

(assert (= (and d!117379 res!662168) b!990244))

(assert (= (and b!990244 res!662169) b!990245))

(assert (=> d!117379 m!917167))

(declare-fun m!917187 () Bool)

(assert (=> d!117379 m!917187))

(declare-fun m!917189 () Bool)

(assert (=> d!117379 m!917189))

(declare-fun m!917191 () Bool)

(assert (=> b!990244 m!917191))

(declare-fun m!917193 () Bool)

(assert (=> b!990245 m!917193))

(assert (=> d!117373 d!117379))

(declare-fun b!990266 () Bool)

(declare-fun e!558371 () List!20876)

(declare-fun call!41982 () List!20876)

(assert (=> b!990266 (= e!558371 call!41982)))

(declare-fun b!990267 () Bool)

(declare-fun e!558370 () List!20876)

(declare-fun e!558369 () List!20876)

(assert (=> b!990267 (= e!558370 e!558369)))

(declare-fun c!100396 () Bool)

(assert (=> b!990267 (= c!100396 (and ((_ is Cons!20872) (toList!6856 (+!3118 lt!439037 lt!439039))) (= (_1!7508 (h!22034 (toList!6856 (+!3118 lt!439037 lt!439039)))) (_1!7508 lt!439038))))))

(declare-fun b!990268 () Bool)

(declare-fun e!558373 () Bool)

(declare-fun lt!439236 () List!20876)

(assert (=> b!990268 (= e!558373 (contains!5697 lt!439236 (tuple2!14995 (_1!7508 lt!439038) (_2!7508 lt!439038))))))

(declare-fun b!990269 () Bool)

(declare-fun e!558372 () List!20876)

(assert (=> b!990269 (= e!558372 (insertStrictlySorted!331 (t!29840 (toList!6856 (+!3118 lt!439037 lt!439039))) (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(declare-fun bm!41977 () Bool)

(declare-fun call!41981 () List!20876)

(assert (=> bm!41977 (= call!41982 call!41981)))

(declare-fun bm!41978 () Bool)

(declare-fun call!41980 () List!20876)

(assert (=> bm!41978 (= call!41981 call!41980)))

(declare-fun d!117381 () Bool)

(assert (=> d!117381 e!558373))

(declare-fun res!662175 () Bool)

(assert (=> d!117381 (=> (not res!662175) (not e!558373))))

(assert (=> d!117381 (= res!662175 (isStrictlySorted!513 lt!439236))))

(assert (=> d!117381 (= lt!439236 e!558370)))

(declare-fun c!100394 () Bool)

(assert (=> d!117381 (= c!100394 (and ((_ is Cons!20872) (toList!6856 (+!3118 lt!439037 lt!439039))) (bvslt (_1!7508 (h!22034 (toList!6856 (+!3118 lt!439037 lt!439039)))) (_1!7508 lt!439038))))))

(assert (=> d!117381 (isStrictlySorted!513 (toList!6856 (+!3118 lt!439037 lt!439039)))))

(assert (=> d!117381 (= (insertStrictlySorted!331 (toList!6856 (+!3118 lt!439037 lt!439039)) (_1!7508 lt!439038) (_2!7508 lt!439038)) lt!439236)))

(declare-fun b!990270 () Bool)

(declare-fun c!100397 () Bool)

(assert (=> b!990270 (= e!558372 (ite c!100396 (t!29840 (toList!6856 (+!3118 lt!439037 lt!439039))) (ite c!100397 (Cons!20872 (h!22034 (toList!6856 (+!3118 lt!439037 lt!439039))) (t!29840 (toList!6856 (+!3118 lt!439037 lt!439039)))) Nil!20873)))))

(declare-fun b!990271 () Bool)

(declare-fun res!662174 () Bool)

(assert (=> b!990271 (=> (not res!662174) (not e!558373))))

(assert (=> b!990271 (= res!662174 (containsKey!479 lt!439236 (_1!7508 lt!439038)))))

(declare-fun b!990272 () Bool)

(assert (=> b!990272 (= e!558371 call!41982)))

(declare-fun b!990273 () Bool)

(assert (=> b!990273 (= e!558369 call!41981)))

(declare-fun b!990274 () Bool)

(assert (=> b!990274 (= e!558370 call!41980)))

(declare-fun bm!41979 () Bool)

(declare-fun $colon$colon!557 (List!20876 tuple2!14994) List!20876)

(assert (=> bm!41979 (= call!41980 ($colon$colon!557 e!558372 (ite c!100394 (h!22034 (toList!6856 (+!3118 lt!439037 lt!439039))) (tuple2!14995 (_1!7508 lt!439038) (_2!7508 lt!439038)))))))

(declare-fun c!100395 () Bool)

(assert (=> bm!41979 (= c!100395 c!100394)))

(declare-fun b!990275 () Bool)

(assert (=> b!990275 (= c!100397 (and ((_ is Cons!20872) (toList!6856 (+!3118 lt!439037 lt!439039))) (bvsgt (_1!7508 (h!22034 (toList!6856 (+!3118 lt!439037 lt!439039)))) (_1!7508 lt!439038))))))

(assert (=> b!990275 (= e!558369 e!558371)))

(assert (= (and d!117381 c!100394) b!990274))

(assert (= (and d!117381 (not c!100394)) b!990267))

(assert (= (and b!990267 c!100396) b!990273))

(assert (= (and b!990267 (not c!100396)) b!990275))

(assert (= (and b!990275 c!100397) b!990266))

(assert (= (and b!990275 (not c!100397)) b!990272))

(assert (= (or b!990266 b!990272) bm!41977))

(assert (= (or b!990273 bm!41977) bm!41978))

(assert (= (or b!990274 bm!41978) bm!41979))

(assert (= (and bm!41979 c!100395) b!990269))

(assert (= (and bm!41979 (not c!100395)) b!990270))

(assert (= (and d!117381 res!662175) b!990271))

(assert (= (and b!990271 res!662174) b!990268))

(declare-fun m!917195 () Bool)

(assert (=> b!990268 m!917195))

(declare-fun m!917197 () Bool)

(assert (=> bm!41979 m!917197))

(declare-fun m!917199 () Bool)

(assert (=> b!990271 m!917199))

(declare-fun m!917201 () Bool)

(assert (=> d!117381 m!917201))

(declare-fun m!917203 () Bool)

(assert (=> d!117381 m!917203))

(declare-fun m!917205 () Bool)

(assert (=> b!990269 m!917205))

(assert (=> d!117373 d!117381))

(declare-fun d!117383 () Bool)

(declare-fun e!558374 () Bool)

(assert (=> d!117383 e!558374))

(declare-fun res!662177 () Bool)

(assert (=> d!117383 (=> (not res!662177) (not e!558374))))

(declare-fun lt!439240 () ListLongMap!13681)

(assert (=> d!117383 (= res!662177 (contains!5695 lt!439240 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439238 () List!20876)

(assert (=> d!117383 (= lt!439240 (ListLongMap!13682 lt!439238))))

(declare-fun lt!439239 () Unit!32729)

(declare-fun lt!439237 () Unit!32729)

(assert (=> d!117383 (= lt!439239 lt!439237)))

(assert (=> d!117383 (= (getValueByKey!517 lt!439238 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117383 (= lt!439237 (lemmaContainsTupThenGetReturnValue!274 lt!439238 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117383 (= lt!439238 (insertStrictlySorted!331 (toList!6856 call!41963) (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117383 (= (+!3118 call!41963 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439240)))

(declare-fun b!990276 () Bool)

(declare-fun res!662176 () Bool)

(assert (=> b!990276 (=> (not res!662176) (not e!558374))))

(assert (=> b!990276 (= res!662176 (= (getValueByKey!517 (toList!6856 lt!439240) (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!990277 () Bool)

(assert (=> b!990277 (= e!558374 (contains!5697 (toList!6856 lt!439240) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117383 res!662177) b!990276))

(assert (= (and b!990276 res!662176) b!990277))

(declare-fun m!917207 () Bool)

(assert (=> d!117383 m!917207))

(declare-fun m!917209 () Bool)

(assert (=> d!117383 m!917209))

(declare-fun m!917211 () Bool)

(assert (=> d!117383 m!917211))

(declare-fun m!917213 () Bool)

(assert (=> d!117383 m!917213))

(declare-fun m!917215 () Bool)

(assert (=> b!990276 m!917215))

(declare-fun m!917217 () Bool)

(assert (=> b!990277 m!917217))

(assert (=> b!990170 d!117383))

(declare-fun d!117385 () Bool)

(declare-fun get!15640 (Option!523) V!36041)

(assert (=> d!117385 (= (apply!890 lt!439185 lt!439188) (get!15640 (getValueByKey!517 (toList!6856 lt!439185) lt!439188)))))

(declare-fun bs!28087 () Bool)

(assert (= bs!28087 d!117385))

(declare-fun m!917219 () Bool)

(assert (=> bs!28087 m!917219))

(assert (=> bs!28087 m!917219))

(declare-fun m!917221 () Bool)

(assert (=> bs!28087 m!917221))

(assert (=> b!990171 d!117385))

(declare-fun d!117387 () Bool)

(declare-fun e!558375 () Bool)

(assert (=> d!117387 e!558375))

(declare-fun res!662179 () Bool)

(assert (=> d!117387 (=> (not res!662179) (not e!558375))))

(declare-fun lt!439244 () ListLongMap!13681)

(assert (=> d!117387 (= res!662179 (contains!5695 lt!439244 (_1!7508 (tuple2!14995 lt!439186 zeroValue!1220))))))

(declare-fun lt!439242 () List!20876)

(assert (=> d!117387 (= lt!439244 (ListLongMap!13682 lt!439242))))

(declare-fun lt!439243 () Unit!32729)

(declare-fun lt!439241 () Unit!32729)

(assert (=> d!117387 (= lt!439243 lt!439241)))

(assert (=> d!117387 (= (getValueByKey!517 lt!439242 (_1!7508 (tuple2!14995 lt!439186 zeroValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439186 zeroValue!1220))))))

(assert (=> d!117387 (= lt!439241 (lemmaContainsTupThenGetReturnValue!274 lt!439242 (_1!7508 (tuple2!14995 lt!439186 zeroValue!1220)) (_2!7508 (tuple2!14995 lt!439186 zeroValue!1220))))))

(assert (=> d!117387 (= lt!439242 (insertStrictlySorted!331 (toList!6856 lt!439185) (_1!7508 (tuple2!14995 lt!439186 zeroValue!1220)) (_2!7508 (tuple2!14995 lt!439186 zeroValue!1220))))))

(assert (=> d!117387 (= (+!3118 lt!439185 (tuple2!14995 lt!439186 zeroValue!1220)) lt!439244)))

(declare-fun b!990278 () Bool)

(declare-fun res!662178 () Bool)

(assert (=> b!990278 (=> (not res!662178) (not e!558375))))

(assert (=> b!990278 (= res!662178 (= (getValueByKey!517 (toList!6856 lt!439244) (_1!7508 (tuple2!14995 lt!439186 zeroValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439186 zeroValue!1220)))))))

(declare-fun b!990279 () Bool)

(assert (=> b!990279 (= e!558375 (contains!5697 (toList!6856 lt!439244) (tuple2!14995 lt!439186 zeroValue!1220)))))

(assert (= (and d!117387 res!662179) b!990278))

(assert (= (and b!990278 res!662178) b!990279))

(declare-fun m!917223 () Bool)

(assert (=> d!117387 m!917223))

(declare-fun m!917225 () Bool)

(assert (=> d!117387 m!917225))

(declare-fun m!917227 () Bool)

(assert (=> d!117387 m!917227))

(declare-fun m!917229 () Bool)

(assert (=> d!117387 m!917229))

(declare-fun m!917231 () Bool)

(assert (=> b!990278 m!917231))

(declare-fun m!917233 () Bool)

(assert (=> b!990279 m!917233))

(assert (=> b!990171 d!117387))

(declare-fun d!117389 () Bool)

(assert (=> d!117389 (= (apply!890 (+!3118 lt!439179 (tuple2!14995 lt!439178 minValue!1220)) lt!439187) (get!15640 (getValueByKey!517 (toList!6856 (+!3118 lt!439179 (tuple2!14995 lt!439178 minValue!1220))) lt!439187)))))

(declare-fun bs!28088 () Bool)

(assert (= bs!28088 d!117389))

(declare-fun m!917235 () Bool)

(assert (=> bs!28088 m!917235))

(assert (=> bs!28088 m!917235))

(declare-fun m!917237 () Bool)

(assert (=> bs!28088 m!917237))

(assert (=> b!990171 d!117389))

(assert (=> b!990171 d!117347))

(declare-fun d!117391 () Bool)

(declare-fun e!558376 () Bool)

(assert (=> d!117391 e!558376))

(declare-fun res!662180 () Bool)

(assert (=> d!117391 (=> res!662180 e!558376)))

(declare-fun lt!439248 () Bool)

(assert (=> d!117391 (= res!662180 (not lt!439248))))

(declare-fun lt!439246 () Bool)

(assert (=> d!117391 (= lt!439248 lt!439246)))

(declare-fun lt!439247 () Unit!32729)

(declare-fun e!558377 () Unit!32729)

(assert (=> d!117391 (= lt!439247 e!558377)))

(declare-fun c!100398 () Bool)

(assert (=> d!117391 (= c!100398 lt!439246)))

(assert (=> d!117391 (= lt!439246 (containsKey!479 (toList!6856 (+!3118 lt!439169 (tuple2!14995 lt!439173 zeroValue!1220))) lt!439176))))

(assert (=> d!117391 (= (contains!5695 (+!3118 lt!439169 (tuple2!14995 lt!439173 zeroValue!1220)) lt!439176) lt!439248)))

(declare-fun b!990280 () Bool)

(declare-fun lt!439245 () Unit!32729)

(assert (=> b!990280 (= e!558377 lt!439245)))

(assert (=> b!990280 (= lt!439245 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 (+!3118 lt!439169 (tuple2!14995 lt!439173 zeroValue!1220))) lt!439176))))

(assert (=> b!990280 (isDefined!387 (getValueByKey!517 (toList!6856 (+!3118 lt!439169 (tuple2!14995 lt!439173 zeroValue!1220))) lt!439176))))

(declare-fun b!990281 () Bool)

(declare-fun Unit!32738 () Unit!32729)

(assert (=> b!990281 (= e!558377 Unit!32738)))

(declare-fun b!990282 () Bool)

(assert (=> b!990282 (= e!558376 (isDefined!387 (getValueByKey!517 (toList!6856 (+!3118 lt!439169 (tuple2!14995 lt!439173 zeroValue!1220))) lt!439176)))))

(assert (= (and d!117391 c!100398) b!990280))

(assert (= (and d!117391 (not c!100398)) b!990281))

(assert (= (and d!117391 (not res!662180)) b!990282))

(declare-fun m!917239 () Bool)

(assert (=> d!117391 m!917239))

(declare-fun m!917241 () Bool)

(assert (=> b!990280 m!917241))

(declare-fun m!917243 () Bool)

(assert (=> b!990280 m!917243))

(assert (=> b!990280 m!917243))

(declare-fun m!917245 () Bool)

(assert (=> b!990280 m!917245))

(assert (=> b!990282 m!917243))

(assert (=> b!990282 m!917243))

(assert (=> b!990282 m!917245))

(assert (=> b!990171 d!117391))

(declare-fun d!117393 () Bool)

(declare-fun e!558378 () Bool)

(assert (=> d!117393 e!558378))

(declare-fun res!662182 () Bool)

(assert (=> d!117393 (=> (not res!662182) (not e!558378))))

(declare-fun lt!439252 () ListLongMap!13681)

(assert (=> d!117393 (= res!662182 (contains!5695 lt!439252 (_1!7508 (tuple2!14995 lt!439173 zeroValue!1220))))))

(declare-fun lt!439250 () List!20876)

(assert (=> d!117393 (= lt!439252 (ListLongMap!13682 lt!439250))))

(declare-fun lt!439251 () Unit!32729)

(declare-fun lt!439249 () Unit!32729)

(assert (=> d!117393 (= lt!439251 lt!439249)))

(assert (=> d!117393 (= (getValueByKey!517 lt!439250 (_1!7508 (tuple2!14995 lt!439173 zeroValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439173 zeroValue!1220))))))

(assert (=> d!117393 (= lt!439249 (lemmaContainsTupThenGetReturnValue!274 lt!439250 (_1!7508 (tuple2!14995 lt!439173 zeroValue!1220)) (_2!7508 (tuple2!14995 lt!439173 zeroValue!1220))))))

(assert (=> d!117393 (= lt!439250 (insertStrictlySorted!331 (toList!6856 lt!439169) (_1!7508 (tuple2!14995 lt!439173 zeroValue!1220)) (_2!7508 (tuple2!14995 lt!439173 zeroValue!1220))))))

(assert (=> d!117393 (= (+!3118 lt!439169 (tuple2!14995 lt!439173 zeroValue!1220)) lt!439252)))

(declare-fun b!990283 () Bool)

(declare-fun res!662181 () Bool)

(assert (=> b!990283 (=> (not res!662181) (not e!558378))))

(assert (=> b!990283 (= res!662181 (= (getValueByKey!517 (toList!6856 lt!439252) (_1!7508 (tuple2!14995 lt!439173 zeroValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439173 zeroValue!1220)))))))

(declare-fun b!990284 () Bool)

(assert (=> b!990284 (= e!558378 (contains!5697 (toList!6856 lt!439252) (tuple2!14995 lt!439173 zeroValue!1220)))))

(assert (= (and d!117393 res!662182) b!990283))

(assert (= (and b!990283 res!662181) b!990284))

(declare-fun m!917247 () Bool)

(assert (=> d!117393 m!917247))

(declare-fun m!917249 () Bool)

(assert (=> d!117393 m!917249))

(declare-fun m!917251 () Bool)

(assert (=> d!117393 m!917251))

(declare-fun m!917253 () Bool)

(assert (=> d!117393 m!917253))

(declare-fun m!917255 () Bool)

(assert (=> b!990283 m!917255))

(declare-fun m!917257 () Bool)

(assert (=> b!990284 m!917257))

(assert (=> b!990171 d!117393))

(declare-fun d!117395 () Bool)

(assert (=> d!117395 (= (apply!890 lt!439179 lt!439187) (get!15640 (getValueByKey!517 (toList!6856 lt!439179) lt!439187)))))

(declare-fun bs!28089 () Bool)

(assert (= bs!28089 d!117395))

(declare-fun m!917259 () Bool)

(assert (=> bs!28089 m!917259))

(assert (=> bs!28089 m!917259))

(declare-fun m!917261 () Bool)

(assert (=> bs!28089 m!917261))

(assert (=> b!990171 d!117395))

(declare-fun d!117397 () Bool)

(assert (=> d!117397 (= (apply!890 lt!439184 lt!439180) (get!15640 (getValueByKey!517 (toList!6856 lt!439184) lt!439180)))))

(declare-fun bs!28090 () Bool)

(assert (= bs!28090 d!117397))

(declare-fun m!917263 () Bool)

(assert (=> bs!28090 m!917263))

(assert (=> bs!28090 m!917263))

(declare-fun m!917265 () Bool)

(assert (=> bs!28090 m!917265))

(assert (=> b!990171 d!117397))

(declare-fun d!117399 () Bool)

(declare-fun e!558379 () Bool)

(assert (=> d!117399 e!558379))

(declare-fun res!662184 () Bool)

(assert (=> d!117399 (=> (not res!662184) (not e!558379))))

(declare-fun lt!439256 () ListLongMap!13681)

(assert (=> d!117399 (= res!662184 (contains!5695 lt!439256 (_1!7508 (tuple2!14995 lt!439178 minValue!1220))))))

(declare-fun lt!439254 () List!20876)

(assert (=> d!117399 (= lt!439256 (ListLongMap!13682 lt!439254))))

(declare-fun lt!439255 () Unit!32729)

(declare-fun lt!439253 () Unit!32729)

(assert (=> d!117399 (= lt!439255 lt!439253)))

(assert (=> d!117399 (= (getValueByKey!517 lt!439254 (_1!7508 (tuple2!14995 lt!439178 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439178 minValue!1220))))))

(assert (=> d!117399 (= lt!439253 (lemmaContainsTupThenGetReturnValue!274 lt!439254 (_1!7508 (tuple2!14995 lt!439178 minValue!1220)) (_2!7508 (tuple2!14995 lt!439178 minValue!1220))))))

(assert (=> d!117399 (= lt!439254 (insertStrictlySorted!331 (toList!6856 lt!439179) (_1!7508 (tuple2!14995 lt!439178 minValue!1220)) (_2!7508 (tuple2!14995 lt!439178 minValue!1220))))))

(assert (=> d!117399 (= (+!3118 lt!439179 (tuple2!14995 lt!439178 minValue!1220)) lt!439256)))

(declare-fun b!990285 () Bool)

(declare-fun res!662183 () Bool)

(assert (=> b!990285 (=> (not res!662183) (not e!558379))))

(assert (=> b!990285 (= res!662183 (= (getValueByKey!517 (toList!6856 lt!439256) (_1!7508 (tuple2!14995 lt!439178 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439178 minValue!1220)))))))

(declare-fun b!990286 () Bool)

(assert (=> b!990286 (= e!558379 (contains!5697 (toList!6856 lt!439256) (tuple2!14995 lt!439178 minValue!1220)))))

(assert (= (and d!117399 res!662184) b!990285))

(assert (= (and b!990285 res!662183) b!990286))

(declare-fun m!917267 () Bool)

(assert (=> d!117399 m!917267))

(declare-fun m!917269 () Bool)

(assert (=> d!117399 m!917269))

(declare-fun m!917271 () Bool)

(assert (=> d!117399 m!917271))

(declare-fun m!917273 () Bool)

(assert (=> d!117399 m!917273))

(declare-fun m!917275 () Bool)

(assert (=> b!990285 m!917275))

(declare-fun m!917277 () Bool)

(assert (=> b!990286 m!917277))

(assert (=> b!990171 d!117399))

(declare-fun d!117401 () Bool)

(assert (=> d!117401 (= (apply!890 (+!3118 lt!439179 (tuple2!14995 lt!439178 minValue!1220)) lt!439187) (apply!890 lt!439179 lt!439187))))

(declare-fun lt!439259 () Unit!32729)

(declare-fun choose!1626 (ListLongMap!13681 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32729)

(assert (=> d!117401 (= lt!439259 (choose!1626 lt!439179 lt!439178 minValue!1220 lt!439187))))

(declare-fun e!558382 () Bool)

(assert (=> d!117401 e!558382))

(declare-fun res!662187 () Bool)

(assert (=> d!117401 (=> (not res!662187) (not e!558382))))

(assert (=> d!117401 (= res!662187 (contains!5695 lt!439179 lt!439187))))

(assert (=> d!117401 (= (addApplyDifferent!465 lt!439179 lt!439178 minValue!1220 lt!439187) lt!439259)))

(declare-fun b!990290 () Bool)

(assert (=> b!990290 (= e!558382 (not (= lt!439187 lt!439178)))))

(assert (= (and d!117401 res!662187) b!990290))

(assert (=> d!117401 m!917081))

(assert (=> d!117401 m!917087))

(assert (=> d!117401 m!917081))

(declare-fun m!917279 () Bool)

(assert (=> d!117401 m!917279))

(assert (=> d!117401 m!917093))

(declare-fun m!917281 () Bool)

(assert (=> d!117401 m!917281))

(assert (=> b!990171 d!117401))

(declare-fun d!117403 () Bool)

(assert (=> d!117403 (= (apply!890 (+!3118 lt!439184 (tuple2!14995 lt!439182 minValue!1220)) lt!439180) (apply!890 lt!439184 lt!439180))))

(declare-fun lt!439260 () Unit!32729)

(assert (=> d!117403 (= lt!439260 (choose!1626 lt!439184 lt!439182 minValue!1220 lt!439180))))

(declare-fun e!558383 () Bool)

(assert (=> d!117403 e!558383))

(declare-fun res!662188 () Bool)

(assert (=> d!117403 (=> (not res!662188) (not e!558383))))

(assert (=> d!117403 (= res!662188 (contains!5695 lt!439184 lt!439180))))

(assert (=> d!117403 (= (addApplyDifferent!465 lt!439184 lt!439182 minValue!1220 lt!439180) lt!439260)))

(declare-fun b!990291 () Bool)

(assert (=> b!990291 (= e!558383 (not (= lt!439180 lt!439182)))))

(assert (= (and d!117403 res!662188) b!990291))

(assert (=> d!117403 m!917067))

(assert (=> d!117403 m!917083))

(assert (=> d!117403 m!917067))

(declare-fun m!917283 () Bool)

(assert (=> d!117403 m!917283))

(assert (=> d!117403 m!917075))

(declare-fun m!917285 () Bool)

(assert (=> d!117403 m!917285))

(assert (=> b!990171 d!117403))

(declare-fun d!117405 () Bool)

(assert (=> d!117405 (= (apply!890 (+!3118 lt!439185 (tuple2!14995 lt!439186 zeroValue!1220)) lt!439188) (get!15640 (getValueByKey!517 (toList!6856 (+!3118 lt!439185 (tuple2!14995 lt!439186 zeroValue!1220))) lt!439188)))))

(declare-fun bs!28091 () Bool)

(assert (= bs!28091 d!117405))

(declare-fun m!917287 () Bool)

(assert (=> bs!28091 m!917287))

(assert (=> bs!28091 m!917287))

(declare-fun m!917289 () Bool)

(assert (=> bs!28091 m!917289))

(assert (=> b!990171 d!117405))

(declare-fun d!117407 () Bool)

(declare-fun e!558384 () Bool)

(assert (=> d!117407 e!558384))

(declare-fun res!662190 () Bool)

(assert (=> d!117407 (=> (not res!662190) (not e!558384))))

(declare-fun lt!439264 () ListLongMap!13681)

(assert (=> d!117407 (= res!662190 (contains!5695 lt!439264 (_1!7508 (tuple2!14995 lt!439182 minValue!1220))))))

(declare-fun lt!439262 () List!20876)

(assert (=> d!117407 (= lt!439264 (ListLongMap!13682 lt!439262))))

(declare-fun lt!439263 () Unit!32729)

(declare-fun lt!439261 () Unit!32729)

(assert (=> d!117407 (= lt!439263 lt!439261)))

(assert (=> d!117407 (= (getValueByKey!517 lt!439262 (_1!7508 (tuple2!14995 lt!439182 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439182 minValue!1220))))))

(assert (=> d!117407 (= lt!439261 (lemmaContainsTupThenGetReturnValue!274 lt!439262 (_1!7508 (tuple2!14995 lt!439182 minValue!1220)) (_2!7508 (tuple2!14995 lt!439182 minValue!1220))))))

(assert (=> d!117407 (= lt!439262 (insertStrictlySorted!331 (toList!6856 lt!439184) (_1!7508 (tuple2!14995 lt!439182 minValue!1220)) (_2!7508 (tuple2!14995 lt!439182 minValue!1220))))))

(assert (=> d!117407 (= (+!3118 lt!439184 (tuple2!14995 lt!439182 minValue!1220)) lt!439264)))

(declare-fun b!990292 () Bool)

(declare-fun res!662189 () Bool)

(assert (=> b!990292 (=> (not res!662189) (not e!558384))))

(assert (=> b!990292 (= res!662189 (= (getValueByKey!517 (toList!6856 lt!439264) (_1!7508 (tuple2!14995 lt!439182 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439182 minValue!1220)))))))

(declare-fun b!990293 () Bool)

(assert (=> b!990293 (= e!558384 (contains!5697 (toList!6856 lt!439264) (tuple2!14995 lt!439182 minValue!1220)))))

(assert (= (and d!117407 res!662190) b!990292))

(assert (= (and b!990292 res!662189) b!990293))

(declare-fun m!917291 () Bool)

(assert (=> d!117407 m!917291))

(declare-fun m!917293 () Bool)

(assert (=> d!117407 m!917293))

(declare-fun m!917295 () Bool)

(assert (=> d!117407 m!917295))

(declare-fun m!917297 () Bool)

(assert (=> d!117407 m!917297))

(declare-fun m!917299 () Bool)

(assert (=> b!990292 m!917299))

(declare-fun m!917301 () Bool)

(assert (=> b!990293 m!917301))

(assert (=> b!990171 d!117407))

(declare-fun d!117409 () Bool)

(assert (=> d!117409 (contains!5695 (+!3118 lt!439169 (tuple2!14995 lt!439173 zeroValue!1220)) lt!439176)))

(declare-fun lt!439267 () Unit!32729)

(declare-fun choose!1627 (ListLongMap!13681 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32729)

(assert (=> d!117409 (= lt!439267 (choose!1627 lt!439169 lt!439173 zeroValue!1220 lt!439176))))

(assert (=> d!117409 (contains!5695 lt!439169 lt!439176)))

(assert (=> d!117409 (= (addStillContains!609 lt!439169 lt!439173 zeroValue!1220 lt!439176) lt!439267)))

(declare-fun bs!28092 () Bool)

(assert (= bs!28092 d!117409))

(assert (=> bs!28092 m!917077))

(assert (=> bs!28092 m!917077))

(assert (=> bs!28092 m!917079))

(declare-fun m!917303 () Bool)

(assert (=> bs!28092 m!917303))

(declare-fun m!917305 () Bool)

(assert (=> bs!28092 m!917305))

(assert (=> b!990171 d!117409))

(declare-fun d!117411 () Bool)

(assert (=> d!117411 (= (apply!890 (+!3118 lt!439185 (tuple2!14995 lt!439186 zeroValue!1220)) lt!439188) (apply!890 lt!439185 lt!439188))))

(declare-fun lt!439268 () Unit!32729)

(assert (=> d!117411 (= lt!439268 (choose!1626 lt!439185 lt!439186 zeroValue!1220 lt!439188))))

(declare-fun e!558385 () Bool)

(assert (=> d!117411 e!558385))

(declare-fun res!662191 () Bool)

(assert (=> d!117411 (=> (not res!662191) (not e!558385))))

(assert (=> d!117411 (= res!662191 (contains!5695 lt!439185 lt!439188))))

(assert (=> d!117411 (= (addApplyDifferent!465 lt!439185 lt!439186 zeroValue!1220 lt!439188) lt!439268)))

(declare-fun b!990295 () Bool)

(assert (=> b!990295 (= e!558385 (not (= lt!439188 lt!439186)))))

(assert (= (and d!117411 res!662191) b!990295))

(assert (=> d!117411 m!917071))

(assert (=> d!117411 m!917089))

(assert (=> d!117411 m!917071))

(declare-fun m!917307 () Bool)

(assert (=> d!117411 m!917307))

(assert (=> d!117411 m!917085))

(declare-fun m!917309 () Bool)

(assert (=> d!117411 m!917309))

(assert (=> b!990171 d!117411))

(declare-fun d!117413 () Bool)

(assert (=> d!117413 (= (apply!890 (+!3118 lt!439184 (tuple2!14995 lt!439182 minValue!1220)) lt!439180) (get!15640 (getValueByKey!517 (toList!6856 (+!3118 lt!439184 (tuple2!14995 lt!439182 minValue!1220))) lt!439180)))))

(declare-fun bs!28093 () Bool)

(assert (= bs!28093 d!117413))

(declare-fun m!917311 () Bool)

(assert (=> bs!28093 m!917311))

(assert (=> bs!28093 m!917311))

(declare-fun m!917313 () Bool)

(assert (=> bs!28093 m!917313))

(assert (=> b!990171 d!117413))

(declare-fun d!117415 () Bool)

(declare-fun e!558386 () Bool)

(assert (=> d!117415 e!558386))

(declare-fun res!662192 () Bool)

(assert (=> d!117415 (=> res!662192 e!558386)))

(declare-fun lt!439272 () Bool)

(assert (=> d!117415 (= res!662192 (not lt!439272))))

(declare-fun lt!439270 () Bool)

(assert (=> d!117415 (= lt!439272 lt!439270)))

(declare-fun lt!439271 () Unit!32729)

(declare-fun e!558387 () Unit!32729)

(assert (=> d!117415 (= lt!439271 e!558387)))

(declare-fun c!100399 () Bool)

(assert (=> d!117415 (= c!100399 lt!439270)))

(assert (=> d!117415 (= lt!439270 (containsKey!479 (toList!6856 lt!439194) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117415 (= (contains!5695 lt!439194 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439272)))

(declare-fun b!990296 () Bool)

(declare-fun lt!439269 () Unit!32729)

(assert (=> b!990296 (= e!558387 lt!439269)))

(assert (=> b!990296 (= lt!439269 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439194) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990296 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439194) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990297 () Bool)

(declare-fun Unit!32739 () Unit!32729)

(assert (=> b!990297 (= e!558387 Unit!32739)))

(declare-fun b!990298 () Bool)

(assert (=> b!990298 (= e!558386 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439194) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117415 c!100399) b!990296))

(assert (= (and d!117415 (not c!100399)) b!990297))

(assert (= (and d!117415 (not res!662192)) b!990298))

(declare-fun m!917315 () Bool)

(assert (=> d!117415 m!917315))

(declare-fun m!917317 () Bool)

(assert (=> b!990296 m!917317))

(declare-fun m!917319 () Bool)

(assert (=> b!990296 m!917319))

(assert (=> b!990296 m!917319))

(declare-fun m!917321 () Bool)

(assert (=> b!990296 m!917321))

(assert (=> b!990298 m!917319))

(assert (=> b!990298 m!917319))

(assert (=> b!990298 m!917321))

(assert (=> bm!41969 d!117415))

(declare-fun b!990299 () Bool)

(declare-fun e!558389 () Bool)

(declare-fun e!558391 () Bool)

(assert (=> b!990299 (= e!558389 e!558391)))

(assert (=> b!990299 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30574 _keys!1544)))))

(declare-fun res!662194 () Bool)

(declare-fun lt!439274 () ListLongMap!13681)

(assert (=> b!990299 (= res!662194 (contains!5695 lt!439274 (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> b!990299 (=> (not res!662194) (not e!558391))))

(declare-fun b!990300 () Bool)

(declare-fun e!558388 () Bool)

(assert (=> b!990300 (= e!558388 (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> b!990300 (bvsge from!1932 #b00000000000000000000000000000000)))

(declare-fun b!990301 () Bool)

(declare-fun e!558392 () Bool)

(assert (=> b!990301 (= e!558389 e!558392)))

(declare-fun c!100402 () Bool)

(assert (=> b!990301 (= c!100402 (bvslt from!1932 (size!30574 _keys!1544)))))

(declare-fun b!990302 () Bool)

(declare-fun lt!439277 () Unit!32729)

(declare-fun lt!439273 () Unit!32729)

(assert (=> b!990302 (= lt!439277 lt!439273)))

(declare-fun lt!439276 () V!36041)

(declare-fun lt!439278 () ListLongMap!13681)

(declare-fun lt!439279 () (_ BitVec 64))

(declare-fun lt!439275 () (_ BitVec 64))

(assert (=> b!990302 (not (contains!5695 (+!3118 lt!439278 (tuple2!14995 lt!439275 lt!439276)) lt!439279))))

(assert (=> b!990302 (= lt!439273 (addStillNotContains!237 lt!439278 lt!439275 lt!439276 lt!439279))))

(assert (=> b!990302 (= lt!439279 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!990302 (= lt!439276 (get!15637 (select (arr!30092 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!990302 (= lt!439275 (select (arr!30093 _keys!1544) from!1932))))

(declare-fun call!41983 () ListLongMap!13681)

(assert (=> b!990302 (= lt!439278 call!41983)))

(declare-fun e!558394 () ListLongMap!13681)

(assert (=> b!990302 (= e!558394 (+!3118 call!41983 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) (get!15637 (select (arr!30092 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!990303 () Bool)

(assert (=> b!990303 (= e!558394 call!41983)))

(declare-fun b!990304 () Bool)

(declare-fun res!662195 () Bool)

(declare-fun e!558390 () Bool)

(assert (=> b!990304 (=> (not res!662195) (not e!558390))))

(assert (=> b!990304 (= res!662195 (not (contains!5695 lt!439274 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990305 () Bool)

(declare-fun e!558393 () ListLongMap!13681)

(assert (=> b!990305 (= e!558393 (ListLongMap!13682 Nil!20873))))

(declare-fun d!117417 () Bool)

(assert (=> d!117417 e!558390))

(declare-fun res!662196 () Bool)

(assert (=> d!117417 (=> (not res!662196) (not e!558390))))

(assert (=> d!117417 (= res!662196 (not (contains!5695 lt!439274 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117417 (= lt!439274 e!558393)))

(declare-fun c!100401 () Bool)

(assert (=> d!117417 (= c!100401 (bvsge from!1932 (size!30574 _keys!1544)))))

(assert (=> d!117417 (validMask!0 mask!1948)))

(assert (=> d!117417 (= (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!439274)))

(declare-fun b!990306 () Bool)

(assert (=> b!990306 (= e!558390 e!558389)))

(declare-fun c!100400 () Bool)

(assert (=> b!990306 (= c!100400 e!558388)))

(declare-fun res!662193 () Bool)

(assert (=> b!990306 (=> (not res!662193) (not e!558388))))

(assert (=> b!990306 (= res!662193 (bvslt from!1932 (size!30574 _keys!1544)))))

(declare-fun b!990307 () Bool)

(assert (=> b!990307 (= e!558392 (isEmpty!731 lt!439274))))

(declare-fun b!990308 () Bool)

(assert (=> b!990308 (= e!558393 e!558394)))

(declare-fun c!100403 () Bool)

(assert (=> b!990308 (= c!100403 (validKeyInArray!0 (select (arr!30093 _keys!1544) from!1932)))))

(declare-fun b!990309 () Bool)

(assert (=> b!990309 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30574 _keys!1544)))))

(assert (=> b!990309 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30573 _values!1278)))))

(assert (=> b!990309 (= e!558391 (= (apply!890 lt!439274 (select (arr!30093 _keys!1544) from!1932)) (get!15637 (select (arr!30092 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!990310 () Bool)

(assert (=> b!990310 (= e!558392 (= lt!439274 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun bm!41980 () Bool)

(assert (=> bm!41980 (= call!41983 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(assert (= (and d!117417 c!100401) b!990305))

(assert (= (and d!117417 (not c!100401)) b!990308))

(assert (= (and b!990308 c!100403) b!990302))

(assert (= (and b!990308 (not c!100403)) b!990303))

(assert (= (or b!990302 b!990303) bm!41980))

(assert (= (and d!117417 res!662196) b!990304))

(assert (= (and b!990304 res!662195) b!990306))

(assert (= (and b!990306 res!662193) b!990300))

(assert (= (and b!990306 c!100400) b!990299))

(assert (= (and b!990306 (not c!100400)) b!990301))

(assert (= (and b!990299 res!662194) b!990309))

(assert (= (and b!990301 c!100402) b!990310))

(assert (= (and b!990301 (not c!100402)) b!990307))

(declare-fun b_lambda!15163 () Bool)

(assert (=> (not b_lambda!15163) (not b!990302)))

(assert (=> b!990302 t!29839))

(declare-fun b_and!32219 () Bool)

(assert (= b_and!32217 (and (=> t!29839 result!13639) b_and!32219)))

(declare-fun b_lambda!15165 () Bool)

(assert (=> (not b_lambda!15165) (not b!990309)))

(assert (=> b!990309 t!29839))

(declare-fun b_and!32221 () Bool)

(assert (= b_and!32219 (and (=> t!29839 result!13639) b_and!32221)))

(declare-fun m!917323 () Bool)

(assert (=> bm!41980 m!917323))

(assert (=> b!990302 m!916857))

(assert (=> b!990302 m!916861))

(assert (=> b!990302 m!916863))

(declare-fun m!917325 () Bool)

(assert (=> b!990302 m!917325))

(assert (=> b!990302 m!916861))

(assert (=> b!990302 m!916855))

(declare-fun m!917327 () Bool)

(assert (=> b!990302 m!917327))

(assert (=> b!990302 m!916857))

(assert (=> b!990302 m!917327))

(declare-fun m!917329 () Bool)

(assert (=> b!990302 m!917329))

(declare-fun m!917331 () Bool)

(assert (=> b!990302 m!917331))

(assert (=> b!990309 m!916857))

(assert (=> b!990309 m!916861))

(assert (=> b!990309 m!916863))

(assert (=> b!990309 m!916855))

(assert (=> b!990309 m!916857))

(assert (=> b!990309 m!916855))

(declare-fun m!917333 () Bool)

(assert (=> b!990309 m!917333))

(assert (=> b!990309 m!916861))

(assert (=> b!990299 m!916855))

(assert (=> b!990299 m!916855))

(declare-fun m!917335 () Bool)

(assert (=> b!990299 m!917335))

(declare-fun m!917337 () Bool)

(assert (=> d!117417 m!917337))

(assert (=> d!117417 m!916847))

(declare-fun m!917339 () Bool)

(assert (=> b!990307 m!917339))

(assert (=> b!990308 m!916855))

(assert (=> b!990308 m!916855))

(assert (=> b!990308 m!916883))

(assert (=> b!990310 m!917323))

(assert (=> b!990300 m!916855))

(assert (=> b!990300 m!916855))

(assert (=> b!990300 m!916883))

(declare-fun m!917341 () Bool)

(assert (=> b!990304 m!917341))

(assert (=> bm!41964 d!117417))

(declare-fun d!117419 () Bool)

(assert (=> d!117419 (= (apply!890 lt!439194 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15640 (getValueByKey!517 (toList!6856 lt!439194) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28094 () Bool)

(assert (= bs!28094 d!117419))

(assert (=> bs!28094 m!917319))

(assert (=> bs!28094 m!917319))

(declare-fun m!917343 () Bool)

(assert (=> bs!28094 m!917343))

(assert (=> b!990204 d!117419))

(declare-fun d!117421 () Bool)

(assert (=> d!117421 (= (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990087 d!117421))

(declare-fun d!117423 () Bool)

(declare-fun e!558395 () Bool)

(assert (=> d!117423 e!558395))

(declare-fun res!662197 () Bool)

(assert (=> d!117423 (=> res!662197 e!558395)))

(declare-fun lt!439283 () Bool)

(assert (=> d!117423 (= res!662197 (not lt!439283))))

(declare-fun lt!439281 () Bool)

(assert (=> d!117423 (= lt!439283 lt!439281)))

(declare-fun lt!439282 () Unit!32729)

(declare-fun e!558396 () Unit!32729)

(assert (=> d!117423 (= lt!439282 e!558396)))

(declare-fun c!100404 () Bool)

(assert (=> d!117423 (= c!100404 lt!439281)))

(assert (=> d!117423 (= lt!439281 (containsKey!479 (toList!6856 lt!439115) (_1!7508 lt!439039)))))

(assert (=> d!117423 (= (contains!5695 lt!439115 (_1!7508 lt!439039)) lt!439283)))

(declare-fun b!990311 () Bool)

(declare-fun lt!439280 () Unit!32729)

(assert (=> b!990311 (= e!558396 lt!439280)))

(assert (=> b!990311 (= lt!439280 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439115) (_1!7508 lt!439039)))))

(assert (=> b!990311 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439115) (_1!7508 lt!439039)))))

(declare-fun b!990312 () Bool)

(declare-fun Unit!32740 () Unit!32729)

(assert (=> b!990312 (= e!558396 Unit!32740)))

(declare-fun b!990313 () Bool)

(assert (=> b!990313 (= e!558395 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439115) (_1!7508 lt!439039))))))

(assert (= (and d!117423 c!100404) b!990311))

(assert (= (and d!117423 (not c!100404)) b!990312))

(assert (= (and d!117423 (not res!662197)) b!990313))

(declare-fun m!917345 () Bool)

(assert (=> d!117423 m!917345))

(declare-fun m!917347 () Bool)

(assert (=> b!990311 m!917347))

(assert (=> b!990311 m!917033))

(assert (=> b!990311 m!917033))

(declare-fun m!917349 () Bool)

(assert (=> b!990311 m!917349))

(assert (=> b!990313 m!917033))

(assert (=> b!990313 m!917033))

(assert (=> b!990313 m!917349))

(assert (=> d!117361 d!117423))

(declare-fun b!990315 () Bool)

(declare-fun e!558397 () Option!523)

(declare-fun e!558398 () Option!523)

(assert (=> b!990315 (= e!558397 e!558398)))

(declare-fun c!100406 () Bool)

(assert (=> b!990315 (= c!100406 (and ((_ is Cons!20872) lt!439113) (not (= (_1!7508 (h!22034 lt!439113)) (_1!7508 lt!439039)))))))

(declare-fun b!990316 () Bool)

(assert (=> b!990316 (= e!558398 (getValueByKey!517 (t!29840 lt!439113) (_1!7508 lt!439039)))))

(declare-fun d!117425 () Bool)

(declare-fun c!100405 () Bool)

(assert (=> d!117425 (= c!100405 (and ((_ is Cons!20872) lt!439113) (= (_1!7508 (h!22034 lt!439113)) (_1!7508 lt!439039))))))

(assert (=> d!117425 (= (getValueByKey!517 lt!439113 (_1!7508 lt!439039)) e!558397)))

(declare-fun b!990314 () Bool)

(assert (=> b!990314 (= e!558397 (Some!522 (_2!7508 (h!22034 lt!439113))))))

(declare-fun b!990317 () Bool)

(assert (=> b!990317 (= e!558398 None!521)))

(assert (= (and d!117425 c!100405) b!990314))

(assert (= (and d!117425 (not c!100405)) b!990315))

(assert (= (and b!990315 c!100406) b!990316))

(assert (= (and b!990315 (not c!100406)) b!990317))

(declare-fun m!917351 () Bool)

(assert (=> b!990316 m!917351))

(assert (=> d!117361 d!117425))

(declare-fun d!117427 () Bool)

(assert (=> d!117427 (= (getValueByKey!517 lt!439113 (_1!7508 lt!439039)) (Some!522 (_2!7508 lt!439039)))))

(declare-fun lt!439284 () Unit!32729)

(assert (=> d!117427 (= lt!439284 (choose!1625 lt!439113 (_1!7508 lt!439039) (_2!7508 lt!439039)))))

(declare-fun e!558399 () Bool)

(assert (=> d!117427 e!558399))

(declare-fun res!662198 () Bool)

(assert (=> d!117427 (=> (not res!662198) (not e!558399))))

(assert (=> d!117427 (= res!662198 (isStrictlySorted!513 lt!439113))))

(assert (=> d!117427 (= (lemmaContainsTupThenGetReturnValue!274 lt!439113 (_1!7508 lt!439039) (_2!7508 lt!439039)) lt!439284)))

(declare-fun b!990318 () Bool)

(declare-fun res!662199 () Bool)

(assert (=> b!990318 (=> (not res!662199) (not e!558399))))

(assert (=> b!990318 (= res!662199 (containsKey!479 lt!439113 (_1!7508 lt!439039)))))

(declare-fun b!990319 () Bool)

(assert (=> b!990319 (= e!558399 (contains!5697 lt!439113 (tuple2!14995 (_1!7508 lt!439039) (_2!7508 lt!439039))))))

(assert (= (and d!117427 res!662198) b!990318))

(assert (= (and b!990318 res!662199) b!990319))

(assert (=> d!117427 m!917027))

(declare-fun m!917353 () Bool)

(assert (=> d!117427 m!917353))

(declare-fun m!917355 () Bool)

(assert (=> d!117427 m!917355))

(declare-fun m!917357 () Bool)

(assert (=> b!990318 m!917357))

(declare-fun m!917359 () Bool)

(assert (=> b!990319 m!917359))

(assert (=> d!117361 d!117427))

(declare-fun b!990320 () Bool)

(declare-fun e!558402 () List!20876)

(declare-fun call!41986 () List!20876)

(assert (=> b!990320 (= e!558402 call!41986)))

(declare-fun b!990321 () Bool)

(declare-fun e!558401 () List!20876)

(declare-fun e!558400 () List!20876)

(assert (=> b!990321 (= e!558401 e!558400)))

(declare-fun c!100409 () Bool)

(assert (=> b!990321 (= c!100409 (and ((_ is Cons!20872) (toList!6856 (+!3118 lt!439037 lt!439038))) (= (_1!7508 (h!22034 (toList!6856 (+!3118 lt!439037 lt!439038)))) (_1!7508 lt!439039))))))

(declare-fun b!990322 () Bool)

(declare-fun e!558404 () Bool)

(declare-fun lt!439285 () List!20876)

(assert (=> b!990322 (= e!558404 (contains!5697 lt!439285 (tuple2!14995 (_1!7508 lt!439039) (_2!7508 lt!439039))))))

(declare-fun e!558403 () List!20876)

(declare-fun b!990323 () Bool)

(assert (=> b!990323 (= e!558403 (insertStrictlySorted!331 (t!29840 (toList!6856 (+!3118 lt!439037 lt!439038))) (_1!7508 lt!439039) (_2!7508 lt!439039)))))

(declare-fun bm!41981 () Bool)

(declare-fun call!41985 () List!20876)

(assert (=> bm!41981 (= call!41986 call!41985)))

(declare-fun bm!41982 () Bool)

(declare-fun call!41984 () List!20876)

(assert (=> bm!41982 (= call!41985 call!41984)))

(declare-fun d!117429 () Bool)

(assert (=> d!117429 e!558404))

(declare-fun res!662201 () Bool)

(assert (=> d!117429 (=> (not res!662201) (not e!558404))))

(assert (=> d!117429 (= res!662201 (isStrictlySorted!513 lt!439285))))

(assert (=> d!117429 (= lt!439285 e!558401)))

(declare-fun c!100407 () Bool)

(assert (=> d!117429 (= c!100407 (and ((_ is Cons!20872) (toList!6856 (+!3118 lt!439037 lt!439038))) (bvslt (_1!7508 (h!22034 (toList!6856 (+!3118 lt!439037 lt!439038)))) (_1!7508 lt!439039))))))

(assert (=> d!117429 (isStrictlySorted!513 (toList!6856 (+!3118 lt!439037 lt!439038)))))

(assert (=> d!117429 (= (insertStrictlySorted!331 (toList!6856 (+!3118 lt!439037 lt!439038)) (_1!7508 lt!439039) (_2!7508 lt!439039)) lt!439285)))

(declare-fun c!100410 () Bool)

(declare-fun b!990324 () Bool)

(assert (=> b!990324 (= e!558403 (ite c!100409 (t!29840 (toList!6856 (+!3118 lt!439037 lt!439038))) (ite c!100410 (Cons!20872 (h!22034 (toList!6856 (+!3118 lt!439037 lt!439038))) (t!29840 (toList!6856 (+!3118 lt!439037 lt!439038)))) Nil!20873)))))

(declare-fun b!990325 () Bool)

(declare-fun res!662200 () Bool)

(assert (=> b!990325 (=> (not res!662200) (not e!558404))))

(assert (=> b!990325 (= res!662200 (containsKey!479 lt!439285 (_1!7508 lt!439039)))))

(declare-fun b!990326 () Bool)

(assert (=> b!990326 (= e!558402 call!41986)))

(declare-fun b!990327 () Bool)

(assert (=> b!990327 (= e!558400 call!41985)))

(declare-fun b!990328 () Bool)

(assert (=> b!990328 (= e!558401 call!41984)))

(declare-fun bm!41983 () Bool)

(assert (=> bm!41983 (= call!41984 ($colon$colon!557 e!558403 (ite c!100407 (h!22034 (toList!6856 (+!3118 lt!439037 lt!439038))) (tuple2!14995 (_1!7508 lt!439039) (_2!7508 lt!439039)))))))

(declare-fun c!100408 () Bool)

(assert (=> bm!41983 (= c!100408 c!100407)))

(declare-fun b!990329 () Bool)

(assert (=> b!990329 (= c!100410 (and ((_ is Cons!20872) (toList!6856 (+!3118 lt!439037 lt!439038))) (bvsgt (_1!7508 (h!22034 (toList!6856 (+!3118 lt!439037 lt!439038)))) (_1!7508 lt!439039))))))

(assert (=> b!990329 (= e!558400 e!558402)))

(assert (= (and d!117429 c!100407) b!990328))

(assert (= (and d!117429 (not c!100407)) b!990321))

(assert (= (and b!990321 c!100409) b!990327))

(assert (= (and b!990321 (not c!100409)) b!990329))

(assert (= (and b!990329 c!100410) b!990320))

(assert (= (and b!990329 (not c!100410)) b!990326))

(assert (= (or b!990320 b!990326) bm!41981))

(assert (= (or b!990327 bm!41981) bm!41982))

(assert (= (or b!990328 bm!41982) bm!41983))

(assert (= (and bm!41983 c!100408) b!990323))

(assert (= (and bm!41983 (not c!100408)) b!990324))

(assert (= (and d!117429 res!662201) b!990325))

(assert (= (and b!990325 res!662200) b!990322))

(declare-fun m!917361 () Bool)

(assert (=> b!990322 m!917361))

(declare-fun m!917363 () Bool)

(assert (=> bm!41983 m!917363))

(declare-fun m!917365 () Bool)

(assert (=> b!990325 m!917365))

(declare-fun m!917367 () Bool)

(assert (=> d!117429 m!917367))

(declare-fun m!917369 () Bool)

(assert (=> d!117429 m!917369))

(declare-fun m!917371 () Bool)

(assert (=> b!990323 m!917371))

(assert (=> d!117361 d!117429))

(declare-fun b!990331 () Bool)

(declare-fun e!558405 () Option!523)

(declare-fun e!558406 () Option!523)

(assert (=> b!990331 (= e!558405 e!558406)))

(declare-fun c!100412 () Bool)

(assert (=> b!990331 (= c!100412 (and ((_ is Cons!20872) (toList!6856 lt!439214)) (not (= (_1!7508 (h!22034 (toList!6856 lt!439214))) (_1!7508 lt!439038)))))))

(declare-fun b!990332 () Bool)

(assert (=> b!990332 (= e!558406 (getValueByKey!517 (t!29840 (toList!6856 lt!439214)) (_1!7508 lt!439038)))))

(declare-fun d!117431 () Bool)

(declare-fun c!100411 () Bool)

(assert (=> d!117431 (= c!100411 (and ((_ is Cons!20872) (toList!6856 lt!439214)) (= (_1!7508 (h!22034 (toList!6856 lt!439214))) (_1!7508 lt!439038))))))

(assert (=> d!117431 (= (getValueByKey!517 (toList!6856 lt!439214) (_1!7508 lt!439038)) e!558405)))

(declare-fun b!990330 () Bool)

(assert (=> b!990330 (= e!558405 (Some!522 (_2!7508 (h!22034 (toList!6856 lt!439214)))))))

(declare-fun b!990333 () Bool)

(assert (=> b!990333 (= e!558406 None!521)))

(assert (= (and d!117431 c!100411) b!990330))

(assert (= (and d!117431 (not c!100411)) b!990331))

(assert (= (and b!990331 c!100412) b!990332))

(assert (= (and b!990331 (not c!100412)) b!990333))

(declare-fun m!917373 () Bool)

(assert (=> b!990332 m!917373))

(assert (=> b!990207 d!117431))

(assert (=> d!117369 d!117349))

(declare-fun d!117433 () Bool)

(declare-fun e!558407 () Bool)

(assert (=> d!117433 e!558407))

(declare-fun res!662202 () Bool)

(assert (=> d!117433 (=> res!662202 e!558407)))

(declare-fun lt!439289 () Bool)

(assert (=> d!117433 (= res!662202 (not lt!439289))))

(declare-fun lt!439287 () Bool)

(assert (=> d!117433 (= lt!439289 lt!439287)))

(declare-fun lt!439288 () Unit!32729)

(declare-fun e!558408 () Unit!32729)

(assert (=> d!117433 (= lt!439288 e!558408)))

(declare-fun c!100413 () Bool)

(assert (=> d!117433 (= c!100413 lt!439287)))

(assert (=> d!117433 (= lt!439287 (containsKey!479 (toList!6856 lt!439119) (_1!7508 lt!439039)))))

(assert (=> d!117433 (= (contains!5695 lt!439119 (_1!7508 lt!439039)) lt!439289)))

(declare-fun b!990334 () Bool)

(declare-fun lt!439286 () Unit!32729)

(assert (=> b!990334 (= e!558408 lt!439286)))

(assert (=> b!990334 (= lt!439286 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439119) (_1!7508 lt!439039)))))

(assert (=> b!990334 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439119) (_1!7508 lt!439039)))))

(declare-fun b!990335 () Bool)

(declare-fun Unit!32741 () Unit!32729)

(assert (=> b!990335 (= e!558408 Unit!32741)))

(declare-fun b!990336 () Bool)

(assert (=> b!990336 (= e!558407 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439119) (_1!7508 lt!439039))))))

(assert (= (and d!117433 c!100413) b!990334))

(assert (= (and d!117433 (not c!100413)) b!990335))

(assert (= (and d!117433 (not res!662202)) b!990336))

(declare-fun m!917375 () Bool)

(assert (=> d!117433 m!917375))

(declare-fun m!917377 () Bool)

(assert (=> b!990334 m!917377))

(assert (=> b!990334 m!917045))

(assert (=> b!990334 m!917045))

(declare-fun m!917379 () Bool)

(assert (=> b!990334 m!917379))

(assert (=> b!990336 m!917045))

(assert (=> b!990336 m!917045))

(assert (=> b!990336 m!917379))

(assert (=> d!117363 d!117433))

(declare-fun b!990338 () Bool)

(declare-fun e!558409 () Option!523)

(declare-fun e!558410 () Option!523)

(assert (=> b!990338 (= e!558409 e!558410)))

(declare-fun c!100415 () Bool)

(assert (=> b!990338 (= c!100415 (and ((_ is Cons!20872) lt!439117) (not (= (_1!7508 (h!22034 lt!439117)) (_1!7508 lt!439039)))))))

(declare-fun b!990339 () Bool)

(assert (=> b!990339 (= e!558410 (getValueByKey!517 (t!29840 lt!439117) (_1!7508 lt!439039)))))

(declare-fun d!117435 () Bool)

(declare-fun c!100414 () Bool)

(assert (=> d!117435 (= c!100414 (and ((_ is Cons!20872) lt!439117) (= (_1!7508 (h!22034 lt!439117)) (_1!7508 lt!439039))))))

(assert (=> d!117435 (= (getValueByKey!517 lt!439117 (_1!7508 lt!439039)) e!558409)))

(declare-fun b!990337 () Bool)

(assert (=> b!990337 (= e!558409 (Some!522 (_2!7508 (h!22034 lt!439117))))))

(declare-fun b!990340 () Bool)

(assert (=> b!990340 (= e!558410 None!521)))

(assert (= (and d!117435 c!100414) b!990337))

(assert (= (and d!117435 (not c!100414)) b!990338))

(assert (= (and b!990338 c!100415) b!990339))

(assert (= (and b!990338 (not c!100415)) b!990340))

(declare-fun m!917381 () Bool)

(assert (=> b!990339 m!917381))

(assert (=> d!117363 d!117435))

(declare-fun d!117437 () Bool)

(assert (=> d!117437 (= (getValueByKey!517 lt!439117 (_1!7508 lt!439039)) (Some!522 (_2!7508 lt!439039)))))

(declare-fun lt!439290 () Unit!32729)

(assert (=> d!117437 (= lt!439290 (choose!1625 lt!439117 (_1!7508 lt!439039) (_2!7508 lt!439039)))))

(declare-fun e!558411 () Bool)

(assert (=> d!117437 e!558411))

(declare-fun res!662203 () Bool)

(assert (=> d!117437 (=> (not res!662203) (not e!558411))))

(assert (=> d!117437 (= res!662203 (isStrictlySorted!513 lt!439117))))

(assert (=> d!117437 (= (lemmaContainsTupThenGetReturnValue!274 lt!439117 (_1!7508 lt!439039) (_2!7508 lt!439039)) lt!439290)))

(declare-fun b!990341 () Bool)

(declare-fun res!662204 () Bool)

(assert (=> b!990341 (=> (not res!662204) (not e!558411))))

(assert (=> b!990341 (= res!662204 (containsKey!479 lt!439117 (_1!7508 lt!439039)))))

(declare-fun b!990342 () Bool)

(assert (=> b!990342 (= e!558411 (contains!5697 lt!439117 (tuple2!14995 (_1!7508 lt!439039) (_2!7508 lt!439039))))))

(assert (= (and d!117437 res!662203) b!990341))

(assert (= (and b!990341 res!662204) b!990342))

(assert (=> d!117437 m!917039))

(declare-fun m!917383 () Bool)

(assert (=> d!117437 m!917383))

(declare-fun m!917385 () Bool)

(assert (=> d!117437 m!917385))

(declare-fun m!917387 () Bool)

(assert (=> b!990341 m!917387))

(declare-fun m!917389 () Bool)

(assert (=> b!990342 m!917389))

(assert (=> d!117363 d!117437))

(declare-fun b!990343 () Bool)

(declare-fun e!558414 () List!20876)

(declare-fun call!41989 () List!20876)

(assert (=> b!990343 (= e!558414 call!41989)))

(declare-fun b!990344 () Bool)

(declare-fun e!558413 () List!20876)

(declare-fun e!558412 () List!20876)

(assert (=> b!990344 (= e!558413 e!558412)))

(declare-fun c!100418 () Bool)

(assert (=> b!990344 (= c!100418 (and ((_ is Cons!20872) (toList!6856 lt!439037)) (= (_1!7508 (h!22034 (toList!6856 lt!439037))) (_1!7508 lt!439039))))))

(declare-fun b!990345 () Bool)

(declare-fun e!558416 () Bool)

(declare-fun lt!439291 () List!20876)

(assert (=> b!990345 (= e!558416 (contains!5697 lt!439291 (tuple2!14995 (_1!7508 lt!439039) (_2!7508 lt!439039))))))

(declare-fun b!990346 () Bool)

(declare-fun e!558415 () List!20876)

(assert (=> b!990346 (= e!558415 (insertStrictlySorted!331 (t!29840 (toList!6856 lt!439037)) (_1!7508 lt!439039) (_2!7508 lt!439039)))))

(declare-fun bm!41984 () Bool)

(declare-fun call!41988 () List!20876)

(assert (=> bm!41984 (= call!41989 call!41988)))

(declare-fun bm!41985 () Bool)

(declare-fun call!41987 () List!20876)

(assert (=> bm!41985 (= call!41988 call!41987)))

(declare-fun d!117439 () Bool)

(assert (=> d!117439 e!558416))

(declare-fun res!662206 () Bool)

(assert (=> d!117439 (=> (not res!662206) (not e!558416))))

(assert (=> d!117439 (= res!662206 (isStrictlySorted!513 lt!439291))))

(assert (=> d!117439 (= lt!439291 e!558413)))

(declare-fun c!100416 () Bool)

(assert (=> d!117439 (= c!100416 (and ((_ is Cons!20872) (toList!6856 lt!439037)) (bvslt (_1!7508 (h!22034 (toList!6856 lt!439037))) (_1!7508 lt!439039))))))

(assert (=> d!117439 (isStrictlySorted!513 (toList!6856 lt!439037))))

(assert (=> d!117439 (= (insertStrictlySorted!331 (toList!6856 lt!439037) (_1!7508 lt!439039) (_2!7508 lt!439039)) lt!439291)))

(declare-fun c!100419 () Bool)

(declare-fun b!990347 () Bool)

(assert (=> b!990347 (= e!558415 (ite c!100418 (t!29840 (toList!6856 lt!439037)) (ite c!100419 (Cons!20872 (h!22034 (toList!6856 lt!439037)) (t!29840 (toList!6856 lt!439037))) Nil!20873)))))

(declare-fun b!990348 () Bool)

(declare-fun res!662205 () Bool)

(assert (=> b!990348 (=> (not res!662205) (not e!558416))))

(assert (=> b!990348 (= res!662205 (containsKey!479 lt!439291 (_1!7508 lt!439039)))))

(declare-fun b!990349 () Bool)

(assert (=> b!990349 (= e!558414 call!41989)))

(declare-fun b!990350 () Bool)

(assert (=> b!990350 (= e!558412 call!41988)))

(declare-fun b!990351 () Bool)

(assert (=> b!990351 (= e!558413 call!41987)))

(declare-fun bm!41986 () Bool)

(assert (=> bm!41986 (= call!41987 ($colon$colon!557 e!558415 (ite c!100416 (h!22034 (toList!6856 lt!439037)) (tuple2!14995 (_1!7508 lt!439039) (_2!7508 lt!439039)))))))

(declare-fun c!100417 () Bool)

(assert (=> bm!41986 (= c!100417 c!100416)))

(declare-fun b!990352 () Bool)

(assert (=> b!990352 (= c!100419 (and ((_ is Cons!20872) (toList!6856 lt!439037)) (bvsgt (_1!7508 (h!22034 (toList!6856 lt!439037))) (_1!7508 lt!439039))))))

(assert (=> b!990352 (= e!558412 e!558414)))

(assert (= (and d!117439 c!100416) b!990351))

(assert (= (and d!117439 (not c!100416)) b!990344))

(assert (= (and b!990344 c!100418) b!990350))

(assert (= (and b!990344 (not c!100418)) b!990352))

(assert (= (and b!990352 c!100419) b!990343))

(assert (= (and b!990352 (not c!100419)) b!990349))

(assert (= (or b!990343 b!990349) bm!41984))

(assert (= (or b!990350 bm!41984) bm!41985))

(assert (= (or b!990351 bm!41985) bm!41986))

(assert (= (and bm!41986 c!100417) b!990346))

(assert (= (and bm!41986 (not c!100417)) b!990347))

(assert (= (and d!117439 res!662206) b!990348))

(assert (= (and b!990348 res!662205) b!990345))

(declare-fun m!917391 () Bool)

(assert (=> b!990345 m!917391))

(declare-fun m!917393 () Bool)

(assert (=> bm!41986 m!917393))

(declare-fun m!917395 () Bool)

(assert (=> b!990348 m!917395))

(declare-fun m!917397 () Bool)

(assert (=> d!117439 m!917397))

(declare-fun m!917399 () Bool)

(assert (=> d!117439 m!917399))

(declare-fun m!917401 () Bool)

(assert (=> b!990346 m!917401))

(assert (=> d!117363 d!117439))

(declare-fun b!990353 () Bool)

(declare-fun e!558417 () Bool)

(declare-fun e!558419 () Bool)

(assert (=> b!990353 (= e!558417 e!558419)))

(declare-fun lt!439292 () (_ BitVec 64))

(assert (=> b!990353 (= lt!439292 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!439294 () Unit!32729)

(assert (=> b!990353 (= lt!439294 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439292 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!990353 (arrayContainsKey!0 _keys!1544 lt!439292 #b00000000000000000000000000000000)))

(declare-fun lt!439293 () Unit!32729)

(assert (=> b!990353 (= lt!439293 lt!439294)))

(declare-fun res!662208 () Bool)

(assert (=> b!990353 (= res!662208 (= (seekEntryOrOpen!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9207 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!990353 (=> (not res!662208) (not e!558419))))

(declare-fun bm!41987 () Bool)

(declare-fun call!41990 () Bool)

(assert (=> bm!41987 (= call!41990 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!990354 () Bool)

(declare-fun e!558418 () Bool)

(assert (=> b!990354 (= e!558418 e!558417)))

(declare-fun c!100420 () Bool)

(assert (=> b!990354 (= c!100420 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!990355 () Bool)

(assert (=> b!990355 (= e!558417 call!41990)))

(declare-fun d!117441 () Bool)

(declare-fun res!662207 () Bool)

(assert (=> d!117441 (=> res!662207 e!558418)))

(assert (=> d!117441 (= res!662207 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30574 _keys!1544)))))

(assert (=> d!117441 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!558418)))

(declare-fun b!990356 () Bool)

(assert (=> b!990356 (= e!558419 call!41990)))

(assert (= (and d!117441 (not res!662207)) b!990354))

(assert (= (and b!990354 c!100420) b!990353))

(assert (= (and b!990354 (not c!100420)) b!990355))

(assert (= (and b!990353 res!662208) b!990356))

(assert (= (or b!990356 b!990355) bm!41987))

(declare-fun m!917403 () Bool)

(assert (=> b!990353 m!917403))

(declare-fun m!917405 () Bool)

(assert (=> b!990353 m!917405))

(declare-fun m!917407 () Bool)

(assert (=> b!990353 m!917407))

(assert (=> b!990353 m!917403))

(declare-fun m!917409 () Bool)

(assert (=> b!990353 m!917409))

(declare-fun m!917411 () Bool)

(assert (=> bm!41987 m!917411))

(assert (=> b!990354 m!917403))

(assert (=> b!990354 m!917403))

(declare-fun m!917413 () Bool)

(assert (=> b!990354 m!917413))

(assert (=> bm!41936 d!117441))

(declare-fun b!990358 () Bool)

(declare-fun e!558420 () Option!523)

(declare-fun e!558421 () Option!523)

(assert (=> b!990358 (= e!558420 e!558421)))

(declare-fun c!100422 () Bool)

(assert (=> b!990358 (= c!100422 (and ((_ is Cons!20872) (toList!6856 lt!439218)) (not (= (_1!7508 (h!22034 (toList!6856 lt!439218))) (_1!7508 lt!439038)))))))

(declare-fun b!990359 () Bool)

(assert (=> b!990359 (= e!558421 (getValueByKey!517 (t!29840 (toList!6856 lt!439218)) (_1!7508 lt!439038)))))

(declare-fun d!117443 () Bool)

(declare-fun c!100421 () Bool)

(assert (=> d!117443 (= c!100421 (and ((_ is Cons!20872) (toList!6856 lt!439218)) (= (_1!7508 (h!22034 (toList!6856 lt!439218))) (_1!7508 lt!439038))))))

(assert (=> d!117443 (= (getValueByKey!517 (toList!6856 lt!439218) (_1!7508 lt!439038)) e!558420)))

(declare-fun b!990357 () Bool)

(assert (=> b!990357 (= e!558420 (Some!522 (_2!7508 (h!22034 (toList!6856 lt!439218)))))))

(declare-fun b!990360 () Bool)

(assert (=> b!990360 (= e!558421 None!521)))

(assert (= (and d!117443 c!100421) b!990357))

(assert (= (and d!117443 (not c!100421)) b!990358))

(assert (= (and b!990358 c!100422) b!990359))

(assert (= (and b!990358 (not c!100422)) b!990360))

(declare-fun m!917415 () Bool)

(assert (=> b!990359 m!917415))

(assert (=> b!990209 d!117443))

(declare-fun d!117445 () Bool)

(assert (=> d!117445 (= (+!3118 (+!3118 lt!439037 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) (+!3118 (+!3118 lt!439037 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (=> d!117445 true))

(declare-fun _$28!191 () Unit!32729)

(assert (=> d!117445 (= (choose!1624 lt!439037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30093 _keys!1544) from!1932) lt!439035) _$28!191)))

(declare-fun bs!28095 () Bool)

(assert (= bs!28095 d!117445))

(assert (=> bs!28095 m!917051))

(assert (=> bs!28095 m!917051))

(assert (=> bs!28095 m!917057))

(assert (=> bs!28095 m!917049))

(assert (=> bs!28095 m!917049))

(assert (=> bs!28095 m!917053))

(assert (=> d!117365 d!117445))

(declare-fun d!117447 () Bool)

(declare-fun e!558422 () Bool)

(assert (=> d!117447 e!558422))

(declare-fun res!662210 () Bool)

(assert (=> d!117447 (=> (not res!662210) (not e!558422))))

(declare-fun lt!439298 () ListLongMap!13681)

(assert (=> d!117447 (= res!662210 (contains!5695 lt!439298 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439296 () List!20876)

(assert (=> d!117447 (= lt!439298 (ListLongMap!13682 lt!439296))))

(declare-fun lt!439297 () Unit!32729)

(declare-fun lt!439295 () Unit!32729)

(assert (=> d!117447 (= lt!439297 lt!439295)))

(assert (=> d!117447 (= (getValueByKey!517 lt!439296 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117447 (= lt!439295 (lemmaContainsTupThenGetReturnValue!274 lt!439296 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117447 (= lt!439296 (insertStrictlySorted!331 (toList!6856 lt!439037) (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117447 (= (+!3118 lt!439037 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439298)))

(declare-fun b!990361 () Bool)

(declare-fun res!662209 () Bool)

(assert (=> b!990361 (=> (not res!662209) (not e!558422))))

(assert (=> b!990361 (= res!662209 (= (getValueByKey!517 (toList!6856 lt!439298) (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!990362 () Bool)

(assert (=> b!990362 (= e!558422 (contains!5697 (toList!6856 lt!439298) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117447 res!662210) b!990361))

(assert (= (and b!990361 res!662209) b!990362))

(declare-fun m!917417 () Bool)

(assert (=> d!117447 m!917417))

(declare-fun m!917419 () Bool)

(assert (=> d!117447 m!917419))

(declare-fun m!917421 () Bool)

(assert (=> d!117447 m!917421))

(declare-fun m!917423 () Bool)

(assert (=> d!117447 m!917423))

(declare-fun m!917425 () Bool)

(assert (=> b!990361 m!917425))

(declare-fun m!917427 () Bool)

(assert (=> b!990362 m!917427))

(assert (=> d!117365 d!117447))

(declare-fun d!117449 () Bool)

(declare-fun e!558423 () Bool)

(assert (=> d!117449 e!558423))

(declare-fun res!662212 () Bool)

(assert (=> d!117449 (=> (not res!662212) (not e!558423))))

(declare-fun lt!439302 () ListLongMap!13681)

(assert (=> d!117449 (= res!662212 (contains!5695 lt!439302 (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))))))

(declare-fun lt!439300 () List!20876)

(assert (=> d!117449 (= lt!439302 (ListLongMap!13682 lt!439300))))

(declare-fun lt!439301 () Unit!32729)

(declare-fun lt!439299 () Unit!32729)

(assert (=> d!117449 (= lt!439301 lt!439299)))

(assert (=> d!117449 (= (getValueByKey!517 lt!439300 (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))) (Some!522 (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))))))

(assert (=> d!117449 (= lt!439299 (lemmaContainsTupThenGetReturnValue!274 lt!439300 (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))))))

(assert (=> d!117449 (= lt!439300 (insertStrictlySorted!331 (toList!6856 lt!439037) (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))))))

(assert (=> d!117449 (= (+!3118 lt!439037 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) lt!439302)))

(declare-fun b!990363 () Bool)

(declare-fun res!662211 () Bool)

(assert (=> b!990363 (=> (not res!662211) (not e!558423))))

(assert (=> b!990363 (= res!662211 (= (getValueByKey!517 (toList!6856 lt!439302) (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))) (Some!522 (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)))))))

(declare-fun b!990364 () Bool)

(assert (=> b!990364 (= e!558423 (contains!5697 (toList!6856 lt!439302) (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)))))

(assert (= (and d!117449 res!662212) b!990363))

(assert (= (and b!990363 res!662211) b!990364))

(declare-fun m!917429 () Bool)

(assert (=> d!117449 m!917429))

(declare-fun m!917431 () Bool)

(assert (=> d!117449 m!917431))

(declare-fun m!917433 () Bool)

(assert (=> d!117449 m!917433))

(declare-fun m!917435 () Bool)

(assert (=> d!117449 m!917435))

(declare-fun m!917437 () Bool)

(assert (=> b!990363 m!917437))

(declare-fun m!917439 () Bool)

(assert (=> b!990364 m!917439))

(assert (=> d!117365 d!117449))

(declare-fun d!117451 () Bool)

(declare-fun e!558424 () Bool)

(assert (=> d!117451 e!558424))

(declare-fun res!662214 () Bool)

(assert (=> d!117451 (=> (not res!662214) (not e!558424))))

(declare-fun lt!439306 () ListLongMap!13681)

(assert (=> d!117451 (= res!662214 (contains!5695 lt!439306 (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))))))

(declare-fun lt!439304 () List!20876)

(assert (=> d!117451 (= lt!439306 (ListLongMap!13682 lt!439304))))

(declare-fun lt!439305 () Unit!32729)

(declare-fun lt!439303 () Unit!32729)

(assert (=> d!117451 (= lt!439305 lt!439303)))

(assert (=> d!117451 (= (getValueByKey!517 lt!439304 (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))) (Some!522 (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))))))

(assert (=> d!117451 (= lt!439303 (lemmaContainsTupThenGetReturnValue!274 lt!439304 (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))))))

(assert (=> d!117451 (= lt!439304 (insertStrictlySorted!331 (toList!6856 (+!3118 lt!439037 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))))))

(assert (=> d!117451 (= (+!3118 (+!3118 lt!439037 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) lt!439306)))

(declare-fun b!990365 () Bool)

(declare-fun res!662213 () Bool)

(assert (=> b!990365 (=> (not res!662213) (not e!558424))))

(assert (=> b!990365 (= res!662213 (= (getValueByKey!517 (toList!6856 lt!439306) (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))) (Some!522 (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)))))))

(declare-fun b!990366 () Bool)

(assert (=> b!990366 (= e!558424 (contains!5697 (toList!6856 lt!439306) (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)))))

(assert (= (and d!117451 res!662214) b!990365))

(assert (= (and b!990365 res!662213) b!990366))

(declare-fun m!917441 () Bool)

(assert (=> d!117451 m!917441))

(declare-fun m!917443 () Bool)

(assert (=> d!117451 m!917443))

(declare-fun m!917445 () Bool)

(assert (=> d!117451 m!917445))

(declare-fun m!917447 () Bool)

(assert (=> d!117451 m!917447))

(declare-fun m!917449 () Bool)

(assert (=> b!990365 m!917449))

(declare-fun m!917451 () Bool)

(assert (=> b!990366 m!917451))

(assert (=> d!117365 d!117451))

(declare-fun d!117453 () Bool)

(declare-fun e!558425 () Bool)

(assert (=> d!117453 e!558425))

(declare-fun res!662216 () Bool)

(assert (=> d!117453 (=> (not res!662216) (not e!558425))))

(declare-fun lt!439310 () ListLongMap!13681)

(assert (=> d!117453 (= res!662216 (contains!5695 lt!439310 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439308 () List!20876)

(assert (=> d!117453 (= lt!439310 (ListLongMap!13682 lt!439308))))

(declare-fun lt!439309 () Unit!32729)

(declare-fun lt!439307 () Unit!32729)

(assert (=> d!117453 (= lt!439309 lt!439307)))

(assert (=> d!117453 (= (getValueByKey!517 lt!439308 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117453 (= lt!439307 (lemmaContainsTupThenGetReturnValue!274 lt!439308 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117453 (= lt!439308 (insertStrictlySorted!331 (toList!6856 (+!3118 lt!439037 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035))) (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117453 (= (+!3118 (+!3118 lt!439037 (tuple2!14995 (select (arr!30093 _keys!1544) from!1932) lt!439035)) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439310)))

(declare-fun b!990367 () Bool)

(declare-fun res!662215 () Bool)

(assert (=> b!990367 (=> (not res!662215) (not e!558425))))

(assert (=> b!990367 (= res!662215 (= (getValueByKey!517 (toList!6856 lt!439310) (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!990368 () Bool)

(assert (=> b!990368 (= e!558425 (contains!5697 (toList!6856 lt!439310) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117453 res!662216) b!990367))

(assert (= (and b!990367 res!662215) b!990368))

(declare-fun m!917453 () Bool)

(assert (=> d!117453 m!917453))

(declare-fun m!917455 () Bool)

(assert (=> d!117453 m!917455))

(declare-fun m!917457 () Bool)

(assert (=> d!117453 m!917457))

(declare-fun m!917459 () Bool)

(assert (=> d!117453 m!917459))

(declare-fun m!917461 () Bool)

(assert (=> b!990367 m!917461))

(declare-fun m!917463 () Bool)

(assert (=> b!990368 m!917463))

(assert (=> d!117365 d!117453))

(declare-fun d!117455 () Bool)

(declare-fun e!558426 () Bool)

(assert (=> d!117455 e!558426))

(declare-fun res!662217 () Bool)

(assert (=> d!117455 (=> res!662217 e!558426)))

(declare-fun lt!439314 () Bool)

(assert (=> d!117455 (= res!662217 (not lt!439314))))

(declare-fun lt!439312 () Bool)

(assert (=> d!117455 (= lt!439314 lt!439312)))

(declare-fun lt!439313 () Unit!32729)

(declare-fun e!558427 () Unit!32729)

(assert (=> d!117455 (= lt!439313 e!558427)))

(declare-fun c!100423 () Bool)

(assert (=> d!117455 (= c!100423 lt!439312)))

(assert (=> d!117455 (= lt!439312 (containsKey!479 (toList!6856 lt!439194) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117455 (= (contains!5695 lt!439194 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439314)))

(declare-fun b!990369 () Bool)

(declare-fun lt!439311 () Unit!32729)

(assert (=> b!990369 (= e!558427 lt!439311)))

(assert (=> b!990369 (= lt!439311 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439194) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990369 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439194) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990370 () Bool)

(declare-fun Unit!32742 () Unit!32729)

(assert (=> b!990370 (= e!558427 Unit!32742)))

(declare-fun b!990371 () Bool)

(assert (=> b!990371 (= e!558426 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117455 c!100423) b!990369))

(assert (= (and d!117455 (not c!100423)) b!990370))

(assert (= (and d!117455 (not res!662217)) b!990371))

(declare-fun m!917465 () Bool)

(assert (=> d!117455 m!917465))

(declare-fun m!917467 () Bool)

(assert (=> b!990369 m!917467))

(declare-fun m!917469 () Bool)

(assert (=> b!990369 m!917469))

(assert (=> b!990369 m!917469))

(declare-fun m!917471 () Bool)

(assert (=> b!990369 m!917471))

(assert (=> b!990371 m!917469))

(assert (=> b!990371 m!917469))

(assert (=> b!990371 m!917471))

(assert (=> bm!41965 d!117455))

(declare-fun d!117457 () Bool)

(assert (=> d!117457 (= (apply!890 lt!439172 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15640 (getValueByKey!517 (toList!6856 lt!439172) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28096 () Bool)

(assert (= bs!28096 d!117457))

(declare-fun m!917473 () Bool)

(assert (=> bs!28096 m!917473))

(assert (=> bs!28096 m!917473))

(declare-fun m!917475 () Bool)

(assert (=> bs!28096 m!917475))

(assert (=> b!990179 d!117457))

(declare-fun d!117459 () Bool)

(declare-fun e!558428 () Bool)

(assert (=> d!117459 e!558428))

(declare-fun res!662219 () Bool)

(assert (=> d!117459 (=> (not res!662219) (not e!558428))))

(declare-fun lt!439318 () ListLongMap!13681)

(assert (=> d!117459 (= res!662219 (contains!5695 lt!439318 (_1!7508 (tuple2!14995 lt!439095 lt!439096))))))

(declare-fun lt!439316 () List!20876)

(assert (=> d!117459 (= lt!439318 (ListLongMap!13682 lt!439316))))

(declare-fun lt!439317 () Unit!32729)

(declare-fun lt!439315 () Unit!32729)

(assert (=> d!117459 (= lt!439317 lt!439315)))

(assert (=> d!117459 (= (getValueByKey!517 lt!439316 (_1!7508 (tuple2!14995 lt!439095 lt!439096))) (Some!522 (_2!7508 (tuple2!14995 lt!439095 lt!439096))))))

(assert (=> d!117459 (= lt!439315 (lemmaContainsTupThenGetReturnValue!274 lt!439316 (_1!7508 (tuple2!14995 lt!439095 lt!439096)) (_2!7508 (tuple2!14995 lt!439095 lt!439096))))))

(assert (=> d!117459 (= lt!439316 (insertStrictlySorted!331 (toList!6856 lt!439098) (_1!7508 (tuple2!14995 lt!439095 lt!439096)) (_2!7508 (tuple2!14995 lt!439095 lt!439096))))))

(assert (=> d!117459 (= (+!3118 lt!439098 (tuple2!14995 lt!439095 lt!439096)) lt!439318)))

(declare-fun b!990372 () Bool)

(declare-fun res!662218 () Bool)

(assert (=> b!990372 (=> (not res!662218) (not e!558428))))

(assert (=> b!990372 (= res!662218 (= (getValueByKey!517 (toList!6856 lt!439318) (_1!7508 (tuple2!14995 lt!439095 lt!439096))) (Some!522 (_2!7508 (tuple2!14995 lt!439095 lt!439096)))))))

(declare-fun b!990373 () Bool)

(assert (=> b!990373 (= e!558428 (contains!5697 (toList!6856 lt!439318) (tuple2!14995 lt!439095 lt!439096)))))

(assert (= (and d!117459 res!662219) b!990372))

(assert (= (and b!990372 res!662218) b!990373))

(declare-fun m!917477 () Bool)

(assert (=> d!117459 m!917477))

(declare-fun m!917479 () Bool)

(assert (=> d!117459 m!917479))

(declare-fun m!917481 () Bool)

(assert (=> d!117459 m!917481))

(declare-fun m!917483 () Bool)

(assert (=> d!117459 m!917483))

(declare-fun m!917485 () Bool)

(assert (=> b!990372 m!917485))

(declare-fun m!917487 () Bool)

(assert (=> b!990373 m!917487))

(assert (=> b!990089 d!117459))

(declare-fun d!117461 () Bool)

(declare-fun e!558429 () Bool)

(assert (=> d!117461 e!558429))

(declare-fun res!662220 () Bool)

(assert (=> d!117461 (=> res!662220 e!558429)))

(declare-fun lt!439322 () Bool)

(assert (=> d!117461 (= res!662220 (not lt!439322))))

(declare-fun lt!439320 () Bool)

(assert (=> d!117461 (= lt!439322 lt!439320)))

(declare-fun lt!439321 () Unit!32729)

(declare-fun e!558430 () Unit!32729)

(assert (=> d!117461 (= lt!439321 e!558430)))

(declare-fun c!100424 () Bool)

(assert (=> d!117461 (= c!100424 lt!439320)))

(assert (=> d!117461 (= lt!439320 (containsKey!479 (toList!6856 (+!3118 lt!439098 (tuple2!14995 lt!439095 lt!439096))) lt!439099))))

(assert (=> d!117461 (= (contains!5695 (+!3118 lt!439098 (tuple2!14995 lt!439095 lt!439096)) lt!439099) lt!439322)))

(declare-fun b!990374 () Bool)

(declare-fun lt!439319 () Unit!32729)

(assert (=> b!990374 (= e!558430 lt!439319)))

(assert (=> b!990374 (= lt!439319 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 (+!3118 lt!439098 (tuple2!14995 lt!439095 lt!439096))) lt!439099))))

(assert (=> b!990374 (isDefined!387 (getValueByKey!517 (toList!6856 (+!3118 lt!439098 (tuple2!14995 lt!439095 lt!439096))) lt!439099))))

(declare-fun b!990375 () Bool)

(declare-fun Unit!32743 () Unit!32729)

(assert (=> b!990375 (= e!558430 Unit!32743)))

(declare-fun b!990376 () Bool)

(assert (=> b!990376 (= e!558429 (isDefined!387 (getValueByKey!517 (toList!6856 (+!3118 lt!439098 (tuple2!14995 lt!439095 lt!439096))) lt!439099)))))

(assert (= (and d!117461 c!100424) b!990374))

(assert (= (and d!117461 (not c!100424)) b!990375))

(assert (= (and d!117461 (not res!662220)) b!990376))

(declare-fun m!917489 () Bool)

(assert (=> d!117461 m!917489))

(declare-fun m!917491 () Bool)

(assert (=> b!990374 m!917491))

(declare-fun m!917493 () Bool)

(assert (=> b!990374 m!917493))

(assert (=> b!990374 m!917493))

(declare-fun m!917495 () Bool)

(assert (=> b!990374 m!917495))

(assert (=> b!990376 m!917493))

(assert (=> b!990376 m!917493))

(assert (=> b!990376 m!917495))

(assert (=> b!990089 d!117461))

(declare-fun d!117463 () Bool)

(declare-fun e!558431 () Bool)

(assert (=> d!117463 e!558431))

(declare-fun res!662222 () Bool)

(assert (=> d!117463 (=> (not res!662222) (not e!558431))))

(declare-fun lt!439326 () ListLongMap!13681)

(assert (=> d!117463 (= res!662222 (contains!5695 lt!439326 (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!439324 () List!20876)

(assert (=> d!117463 (= lt!439326 (ListLongMap!13682 lt!439324))))

(declare-fun lt!439325 () Unit!32729)

(declare-fun lt!439323 () Unit!32729)

(assert (=> d!117463 (= lt!439325 lt!439323)))

(assert (=> d!117463 (= (getValueByKey!517 lt!439324 (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!522 (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117463 (= lt!439323 (lemmaContainsTupThenGetReturnValue!274 lt!439324 (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117463 (= lt!439324 (insertStrictlySorted!331 (toList!6856 call!41942) (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117463 (= (+!3118 call!41942 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!439326)))

(declare-fun b!990377 () Bool)

(declare-fun res!662221 () Bool)

(assert (=> b!990377 (=> (not res!662221) (not e!558431))))

(assert (=> b!990377 (= res!662221 (= (getValueByKey!517 (toList!6856 lt!439326) (_1!7508 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!522 (_2!7508 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!990378 () Bool)

(assert (=> b!990378 (= e!558431 (contains!5697 (toList!6856 lt!439326) (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117463 res!662222) b!990377))

(assert (= (and b!990377 res!662221) b!990378))

(declare-fun m!917497 () Bool)

(assert (=> d!117463 m!917497))

(declare-fun m!917499 () Bool)

(assert (=> d!117463 m!917499))

(declare-fun m!917501 () Bool)

(assert (=> d!117463 m!917501))

(declare-fun m!917503 () Bool)

(assert (=> d!117463 m!917503))

(declare-fun m!917505 () Bool)

(assert (=> b!990377 m!917505))

(declare-fun m!917507 () Bool)

(assert (=> b!990378 m!917507))

(assert (=> b!990089 d!117463))

(declare-fun d!117465 () Bool)

(declare-fun c!100425 () Bool)

(assert (=> d!117465 (= c!100425 ((_ is ValueCellFull!11165) (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!558432 () V!36041)

(assert (=> d!117465 (= (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!558432)))

(declare-fun b!990379 () Bool)

(assert (=> b!990379 (= e!558432 (get!15638 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990380 () Bool)

(assert (=> b!990380 (= e!558432 (get!15639 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117465 c!100425) b!990379))

(assert (= (and d!117465 (not c!100425)) b!990380))

(assert (=> b!990379 m!916983))

(assert (=> b!990379 m!916861))

(declare-fun m!917509 () Bool)

(assert (=> b!990379 m!917509))

(assert (=> b!990380 m!916983))

(assert (=> b!990380 m!916861))

(declare-fun m!917511 () Bool)

(assert (=> b!990380 m!917511))

(assert (=> b!990089 d!117465))

(declare-fun d!117467 () Bool)

(assert (=> d!117467 (not (contains!5695 (+!3118 lt!439098 (tuple2!14995 lt!439095 lt!439096)) lt!439099))))

(declare-fun lt!439329 () Unit!32729)

(declare-fun choose!1628 (ListLongMap!13681 (_ BitVec 64) V!36041 (_ BitVec 64)) Unit!32729)

(assert (=> d!117467 (= lt!439329 (choose!1628 lt!439098 lt!439095 lt!439096 lt!439099))))

(declare-fun e!558435 () Bool)

(assert (=> d!117467 e!558435))

(declare-fun res!662225 () Bool)

(assert (=> d!117467 (=> (not res!662225) (not e!558435))))

(assert (=> d!117467 (= res!662225 (not (contains!5695 lt!439098 lt!439099)))))

(assert (=> d!117467 (= (addStillNotContains!237 lt!439098 lt!439095 lt!439096 lt!439099) lt!439329)))

(declare-fun b!990384 () Bool)

(assert (=> b!990384 (= e!558435 (not (= lt!439095 lt!439099)))))

(assert (= (and d!117467 res!662225) b!990384))

(assert (=> d!117467 m!916991))

(assert (=> d!117467 m!916991))

(assert (=> d!117467 m!916993))

(declare-fun m!917513 () Bool)

(assert (=> d!117467 m!917513))

(declare-fun m!917515 () Bool)

(assert (=> d!117467 m!917515))

(assert (=> b!990089 d!117467))

(declare-fun d!117469 () Bool)

(declare-fun e!558436 () Bool)

(assert (=> d!117469 e!558436))

(declare-fun res!662226 () Bool)

(assert (=> d!117469 (=> res!662226 e!558436)))

(declare-fun lt!439333 () Bool)

(assert (=> d!117469 (= res!662226 (not lt!439333))))

(declare-fun lt!439331 () Bool)

(assert (=> d!117469 (= lt!439333 lt!439331)))

(declare-fun lt!439332 () Unit!32729)

(declare-fun e!558437 () Unit!32729)

(assert (=> d!117469 (= lt!439332 e!558437)))

(declare-fun c!100426 () Bool)

(assert (=> d!117469 (= c!100426 lt!439331)))

(assert (=> d!117469 (= lt!439331 (containsKey!479 (toList!6856 lt!439094) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117469 (= (contains!5695 lt!439094 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439333)))

(declare-fun b!990385 () Bool)

(declare-fun lt!439330 () Unit!32729)

(assert (=> b!990385 (= e!558437 lt!439330)))

(assert (=> b!990385 (= lt!439330 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439094) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990385 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439094) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990386 () Bool)

(declare-fun Unit!32744 () Unit!32729)

(assert (=> b!990386 (= e!558437 Unit!32744)))

(declare-fun b!990387 () Bool)

(assert (=> b!990387 (= e!558436 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117469 c!100426) b!990385))

(assert (= (and d!117469 (not c!100426)) b!990386))

(assert (= (and d!117469 (not res!662226)) b!990387))

(declare-fun m!917517 () Bool)

(assert (=> d!117469 m!917517))

(declare-fun m!917519 () Bool)

(assert (=> b!990385 m!917519))

(declare-fun m!917521 () Bool)

(assert (=> b!990385 m!917521))

(assert (=> b!990385 m!917521))

(declare-fun m!917523 () Bool)

(assert (=> b!990385 m!917523))

(assert (=> b!990387 m!917521))

(assert (=> b!990387 m!917521))

(assert (=> b!990387 m!917523))

(assert (=> b!990091 d!117469))

(assert (=> d!117367 d!117349))

(declare-fun b!990389 () Bool)

(declare-fun e!558438 () Option!523)

(declare-fun e!558439 () Option!523)

(assert (=> b!990389 (= e!558438 e!558439)))

(declare-fun c!100428 () Bool)

(assert (=> b!990389 (= c!100428 (and ((_ is Cons!20872) (toList!6856 lt!439111)) (not (= (_1!7508 (h!22034 (toList!6856 lt!439111))) (_1!7508 lt!439038)))))))

(declare-fun b!990390 () Bool)

(assert (=> b!990390 (= e!558439 (getValueByKey!517 (t!29840 (toList!6856 lt!439111)) (_1!7508 lt!439038)))))

(declare-fun d!117471 () Bool)

(declare-fun c!100427 () Bool)

(assert (=> d!117471 (= c!100427 (and ((_ is Cons!20872) (toList!6856 lt!439111)) (= (_1!7508 (h!22034 (toList!6856 lt!439111))) (_1!7508 lt!439038))))))

(assert (=> d!117471 (= (getValueByKey!517 (toList!6856 lt!439111) (_1!7508 lt!439038)) e!558438)))

(declare-fun b!990388 () Bool)

(assert (=> b!990388 (= e!558438 (Some!522 (_2!7508 (h!22034 (toList!6856 lt!439111)))))))

(declare-fun b!990391 () Bool)

(assert (=> b!990391 (= e!558439 None!521)))

(assert (= (and d!117471 c!100427) b!990388))

(assert (= (and d!117471 (not c!100427)) b!990389))

(assert (= (and b!990389 c!100428) b!990390))

(assert (= (and b!990389 (not c!100428)) b!990391))

(declare-fun m!917525 () Bool)

(assert (=> b!990390 m!917525))

(assert (=> b!990117 d!117471))

(assert (=> b!990095 d!117421))

(declare-fun b!990393 () Bool)

(declare-fun e!558440 () Option!523)

(declare-fun e!558441 () Option!523)

(assert (=> b!990393 (= e!558440 e!558441)))

(declare-fun c!100430 () Bool)

(assert (=> b!990393 (= c!100430 (and ((_ is Cons!20872) (toList!6856 lt!439115)) (not (= (_1!7508 (h!22034 (toList!6856 lt!439115))) (_1!7508 lt!439039)))))))

(declare-fun b!990394 () Bool)

(assert (=> b!990394 (= e!558441 (getValueByKey!517 (t!29840 (toList!6856 lt!439115)) (_1!7508 lt!439039)))))

(declare-fun d!117473 () Bool)

(declare-fun c!100429 () Bool)

(assert (=> d!117473 (= c!100429 (and ((_ is Cons!20872) (toList!6856 lt!439115)) (= (_1!7508 (h!22034 (toList!6856 lt!439115))) (_1!7508 lt!439039))))))

(assert (=> d!117473 (= (getValueByKey!517 (toList!6856 lt!439115) (_1!7508 lt!439039)) e!558440)))

(declare-fun b!990392 () Bool)

(assert (=> b!990392 (= e!558440 (Some!522 (_2!7508 (h!22034 (toList!6856 lt!439115)))))))

(declare-fun b!990395 () Bool)

(assert (=> b!990395 (= e!558441 None!521)))

(assert (= (and d!117473 c!100429) b!990392))

(assert (= (and d!117473 (not c!100429)) b!990393))

(assert (= (and b!990393 c!100430) b!990394))

(assert (= (and b!990393 (not c!100430)) b!990395))

(declare-fun m!917527 () Bool)

(assert (=> b!990394 m!917527))

(assert (=> b!990119 d!117473))

(declare-fun b!990397 () Bool)

(declare-fun e!558442 () Option!523)

(declare-fun e!558443 () Option!523)

(assert (=> b!990397 (= e!558442 e!558443)))

(declare-fun c!100432 () Bool)

(assert (=> b!990397 (= c!100432 (and ((_ is Cons!20872) (toList!6856 lt!439119)) (not (= (_1!7508 (h!22034 (toList!6856 lt!439119))) (_1!7508 lt!439039)))))))

(declare-fun b!990398 () Bool)

(assert (=> b!990398 (= e!558443 (getValueByKey!517 (t!29840 (toList!6856 lt!439119)) (_1!7508 lt!439039)))))

(declare-fun d!117475 () Bool)

(declare-fun c!100431 () Bool)

(assert (=> d!117475 (= c!100431 (and ((_ is Cons!20872) (toList!6856 lt!439119)) (= (_1!7508 (h!22034 (toList!6856 lt!439119))) (_1!7508 lt!439039))))))

(assert (=> d!117475 (= (getValueByKey!517 (toList!6856 lt!439119) (_1!7508 lt!439039)) e!558442)))

(declare-fun b!990396 () Bool)

(assert (=> b!990396 (= e!558442 (Some!522 (_2!7508 (h!22034 (toList!6856 lt!439119)))))))

(declare-fun b!990399 () Bool)

(assert (=> b!990399 (= e!558443 None!521)))

(assert (= (and d!117475 c!100431) b!990396))

(assert (= (and d!117475 (not c!100431)) b!990397))

(assert (= (and b!990397 c!100432) b!990398))

(assert (= (and b!990397 (not c!100432)) b!990399))

(declare-fun m!917529 () Bool)

(assert (=> b!990398 m!917529))

(assert (=> b!990121 d!117475))

(assert (=> b!990197 d!117355))

(declare-fun d!117477 () Bool)

(declare-fun e!558444 () Bool)

(assert (=> d!117477 e!558444))

(declare-fun res!662227 () Bool)

(assert (=> d!117477 (=> res!662227 e!558444)))

(declare-fun lt!439337 () Bool)

(assert (=> d!117477 (= res!662227 (not lt!439337))))

(declare-fun lt!439335 () Bool)

(assert (=> d!117477 (= lt!439337 lt!439335)))

(declare-fun lt!439336 () Unit!32729)

(declare-fun e!558445 () Unit!32729)

(assert (=> d!117477 (= lt!439336 e!558445)))

(declare-fun c!100433 () Bool)

(assert (=> d!117477 (= c!100433 lt!439335)))

(assert (=> d!117477 (= lt!439335 (containsKey!479 (toList!6856 lt!439172) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117477 (= (contains!5695 lt!439172 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439337)))

(declare-fun b!990400 () Bool)

(declare-fun lt!439334 () Unit!32729)

(assert (=> b!990400 (= e!558445 lt!439334)))

(assert (=> b!990400 (= lt!439334 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439172) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990400 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439172) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990401 () Bool)

(declare-fun Unit!32745 () Unit!32729)

(assert (=> b!990401 (= e!558445 Unit!32745)))

(declare-fun b!990402 () Bool)

(assert (=> b!990402 (= e!558444 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439172) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117477 c!100433) b!990400))

(assert (= (and d!117477 (not c!100433)) b!990401))

(assert (= (and d!117477 (not res!662227)) b!990402))

(declare-fun m!917531 () Bool)

(assert (=> d!117477 m!917531))

(declare-fun m!917533 () Bool)

(assert (=> b!990400 m!917533))

(declare-fun m!917535 () Bool)

(assert (=> b!990400 m!917535))

(assert (=> b!990400 m!917535))

(declare-fun m!917537 () Bool)

(assert (=> b!990400 m!917537))

(assert (=> b!990402 m!917535))

(assert (=> b!990402 m!917535))

(assert (=> b!990402 m!917537))

(assert (=> bm!41962 d!117477))

(declare-fun b!990403 () Bool)

(declare-fun e!558448 () Bool)

(declare-fun call!41991 () Bool)

(assert (=> b!990403 (= e!558448 call!41991)))

(declare-fun c!100434 () Bool)

(declare-fun bm!41988 () Bool)

(assert (=> bm!41988 (= call!41991 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100434 (Cons!20873 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100352 (Cons!20873 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) Nil!20874) Nil!20874)) (ite c!100352 (Cons!20873 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) Nil!20874) Nil!20874))))))

(declare-fun b!990404 () Bool)

(declare-fun e!558449 () Bool)

(assert (=> b!990404 (= e!558449 e!558448)))

(assert (=> b!990404 (= c!100434 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117479 () Bool)

(declare-fun res!662228 () Bool)

(declare-fun e!558447 () Bool)

(assert (=> d!117479 (=> res!662228 e!558447)))

(assert (=> d!117479 (= res!662228 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30574 _keys!1544)))))

(assert (=> d!117479 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100352 (Cons!20873 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) Nil!20874) Nil!20874)) e!558447)))

(declare-fun b!990405 () Bool)

(assert (=> b!990405 (= e!558447 e!558449)))

(declare-fun res!662229 () Bool)

(assert (=> b!990405 (=> (not res!662229) (not e!558449))))

(declare-fun e!558446 () Bool)

(assert (=> b!990405 (= res!662229 (not e!558446))))

(declare-fun res!662230 () Bool)

(assert (=> b!990405 (=> (not res!662230) (not e!558446))))

(assert (=> b!990405 (= res!662230 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!990406 () Bool)

(assert (=> b!990406 (= e!558446 (contains!5696 (ite c!100352 (Cons!20873 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) Nil!20874) Nil!20874) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!990407 () Bool)

(assert (=> b!990407 (= e!558448 call!41991)))

(assert (= (and d!117479 (not res!662228)) b!990405))

(assert (= (and b!990405 res!662230) b!990406))

(assert (= (and b!990405 res!662229) b!990404))

(assert (= (and b!990404 c!100434) b!990407))

(assert (= (and b!990404 (not c!100434)) b!990403))

(assert (= (or b!990407 b!990403) bm!41988))

(assert (=> bm!41988 m!917403))

(declare-fun m!917539 () Bool)

(assert (=> bm!41988 m!917539))

(assert (=> b!990404 m!917403))

(assert (=> b!990404 m!917403))

(assert (=> b!990404 m!917413))

(assert (=> b!990405 m!917403))

(assert (=> b!990405 m!917403))

(assert (=> b!990405 m!917413))

(assert (=> b!990406 m!917403))

(assert (=> b!990406 m!917403))

(declare-fun m!917541 () Bool)

(assert (=> b!990406 m!917541))

(assert (=> bm!41942 d!117479))

(assert (=> bm!41957 d!117347))

(declare-fun d!117481 () Bool)

(assert (=> d!117481 (= (apply!890 lt!439172 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15640 (getValueByKey!517 (toList!6856 lt!439172) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28097 () Bool)

(assert (= bs!28097 d!117481))

(assert (=> bs!28097 m!917535))

(assert (=> bs!28097 m!917535))

(declare-fun m!917543 () Bool)

(assert (=> bs!28097 m!917543))

(assert (=> b!990183 d!117481))

(declare-fun d!117483 () Bool)

(assert (=> d!117483 (= (validKeyInArray!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!990110 d!117483))

(declare-fun b!990408 () Bool)

(declare-fun e!558451 () Bool)

(declare-fun e!558453 () Bool)

(assert (=> b!990408 (= e!558451 e!558453)))

(assert (=> b!990408 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30574 _keys!1544)))))

(declare-fun res!662232 () Bool)

(declare-fun lt!439339 () ListLongMap!13681)

(assert (=> b!990408 (= res!662232 (contains!5695 lt!439339 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!990408 (=> (not res!662232) (not e!558453))))

(declare-fun b!990409 () Bool)

(declare-fun e!558450 () Bool)

(assert (=> b!990409 (= e!558450 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!990409 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!990410 () Bool)

(declare-fun e!558454 () Bool)

(assert (=> b!990410 (= e!558451 e!558454)))

(declare-fun c!100437 () Bool)

(assert (=> b!990410 (= c!100437 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30574 _keys!1544)))))

(declare-fun b!990411 () Bool)

(declare-fun lt!439342 () Unit!32729)

(declare-fun lt!439338 () Unit!32729)

(assert (=> b!990411 (= lt!439342 lt!439338)))

(declare-fun lt!439340 () (_ BitVec 64))

(declare-fun lt!439343 () ListLongMap!13681)

(declare-fun lt!439341 () V!36041)

(declare-fun lt!439344 () (_ BitVec 64))

(assert (=> b!990411 (not (contains!5695 (+!3118 lt!439343 (tuple2!14995 lt!439340 lt!439341)) lt!439344))))

(assert (=> b!990411 (= lt!439338 (addStillNotContains!237 lt!439343 lt!439340 lt!439341 lt!439344))))

(assert (=> b!990411 (= lt!439344 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!990411 (= lt!439341 (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!990411 (= lt!439340 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)))))

(declare-fun call!41992 () ListLongMap!13681)

(assert (=> b!990411 (= lt!439343 call!41992)))

(declare-fun e!558456 () ListLongMap!13681)

(assert (=> b!990411 (= e!558456 (+!3118 call!41992 (tuple2!14995 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!990412 () Bool)

(assert (=> b!990412 (= e!558456 call!41992)))

(declare-fun b!990413 () Bool)

(declare-fun res!662233 () Bool)

(declare-fun e!558452 () Bool)

(assert (=> b!990413 (=> (not res!662233) (not e!558452))))

(assert (=> b!990413 (= res!662233 (not (contains!5695 lt!439339 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!990414 () Bool)

(declare-fun e!558455 () ListLongMap!13681)

(assert (=> b!990414 (= e!558455 (ListLongMap!13682 Nil!20873))))

(declare-fun d!117485 () Bool)

(assert (=> d!117485 e!558452))

(declare-fun res!662234 () Bool)

(assert (=> d!117485 (=> (not res!662234) (not e!558452))))

(assert (=> d!117485 (= res!662234 (not (contains!5695 lt!439339 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117485 (= lt!439339 e!558455)))

(declare-fun c!100436 () Bool)

(assert (=> d!117485 (= c!100436 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30574 _keys!1544)))))

(assert (=> d!117485 (validMask!0 mask!1948)))

(assert (=> d!117485 (= (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281) lt!439339)))

(declare-fun b!990415 () Bool)

(assert (=> b!990415 (= e!558452 e!558451)))

(declare-fun c!100435 () Bool)

(assert (=> b!990415 (= c!100435 e!558450)))

(declare-fun res!662231 () Bool)

(assert (=> b!990415 (=> (not res!662231) (not e!558450))))

(assert (=> b!990415 (= res!662231 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30574 _keys!1544)))))

(declare-fun b!990416 () Bool)

(assert (=> b!990416 (= e!558454 (isEmpty!731 lt!439339))))

(declare-fun b!990417 () Bool)

(assert (=> b!990417 (= e!558455 e!558456)))

(declare-fun c!100438 () Bool)

(assert (=> b!990417 (= c!100438 (validKeyInArray!0 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(declare-fun b!990418 () Bool)

(assert (=> b!990418 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30574 _keys!1544)))))

(assert (=> b!990418 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30573 _values!1278)))))

(assert (=> b!990418 (= e!558453 (= (apply!890 lt!439339 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))) (get!15637 (select (arr!30092 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!990419 () Bool)

(assert (=> b!990419 (= e!558454 (= lt!439339 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun bm!41989 () Bool)

(assert (=> bm!41989 (= call!41992 (getCurrentListMapNoExtraKeys!3556 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281))))

(assert (= (and d!117485 c!100436) b!990414))

(assert (= (and d!117485 (not c!100436)) b!990417))

(assert (= (and b!990417 c!100438) b!990411))

(assert (= (and b!990417 (not c!100438)) b!990412))

(assert (= (or b!990411 b!990412) bm!41989))

(assert (= (and d!117485 res!662234) b!990413))

(assert (= (and b!990413 res!662233) b!990415))

(assert (= (and b!990415 res!662231) b!990409))

(assert (= (and b!990415 c!100435) b!990408))

(assert (= (and b!990415 (not c!100435)) b!990410))

(assert (= (and b!990408 res!662232) b!990418))

(assert (= (and b!990410 c!100437) b!990419))

(assert (= (and b!990410 (not c!100437)) b!990416))

(declare-fun b_lambda!15167 () Bool)

(assert (=> (not b_lambda!15167) (not b!990411)))

(assert (=> b!990411 t!29839))

(declare-fun b_and!32223 () Bool)

(assert (= b_and!32221 (and (=> t!29839 result!13639) b_and!32223)))

(declare-fun b_lambda!15169 () Bool)

(assert (=> (not b_lambda!15169) (not b!990418)))

(assert (=> b!990418 t!29839))

(declare-fun b_and!32225 () Bool)

(assert (= b_and!32223 (and (=> t!29839 result!13639) b_and!32225)))

(declare-fun m!917545 () Bool)

(assert (=> bm!41989 m!917545))

(declare-fun m!917547 () Bool)

(assert (=> b!990411 m!917547))

(assert (=> b!990411 m!916861))

(declare-fun m!917549 () Bool)

(assert (=> b!990411 m!917549))

(declare-fun m!917551 () Bool)

(assert (=> b!990411 m!917551))

(assert (=> b!990411 m!916861))

(declare-fun m!917553 () Bool)

(assert (=> b!990411 m!917553))

(declare-fun m!917555 () Bool)

(assert (=> b!990411 m!917555))

(assert (=> b!990411 m!917547))

(assert (=> b!990411 m!917555))

(declare-fun m!917557 () Bool)

(assert (=> b!990411 m!917557))

(declare-fun m!917559 () Bool)

(assert (=> b!990411 m!917559))

(assert (=> b!990418 m!917547))

(assert (=> b!990418 m!916861))

(assert (=> b!990418 m!917549))

(assert (=> b!990418 m!917553))

(assert (=> b!990418 m!917547))

(assert (=> b!990418 m!917553))

(declare-fun m!917561 () Bool)

(assert (=> b!990418 m!917561))

(assert (=> b!990418 m!916861))

(assert (=> b!990408 m!917553))

(assert (=> b!990408 m!917553))

(declare-fun m!917563 () Bool)

(assert (=> b!990408 m!917563))

(declare-fun m!917565 () Bool)

(assert (=> d!117485 m!917565))

(assert (=> d!117485 m!916847))

(declare-fun m!917567 () Bool)

(assert (=> b!990416 m!917567))

(assert (=> b!990417 m!917553))

(assert (=> b!990417 m!917553))

(declare-fun m!917569 () Bool)

(assert (=> b!990417 m!917569))

(assert (=> b!990419 m!917545))

(assert (=> b!990409 m!917553))

(assert (=> b!990409 m!917553))

(assert (=> b!990409 m!917569))

(declare-fun m!917571 () Bool)

(assert (=> b!990413 m!917571))

(assert (=> b!990097 d!117485))

(declare-fun d!117487 () Bool)

(declare-fun e!558457 () Bool)

(assert (=> d!117487 e!558457))

(declare-fun res!662235 () Bool)

(assert (=> d!117487 (=> res!662235 e!558457)))

(declare-fun lt!439348 () Bool)

(assert (=> d!117487 (= res!662235 (not lt!439348))))

(declare-fun lt!439346 () Bool)

(assert (=> d!117487 (= lt!439348 lt!439346)))

(declare-fun lt!439347 () Unit!32729)

(declare-fun e!558458 () Unit!32729)

(assert (=> d!117487 (= lt!439347 e!558458)))

(declare-fun c!100439 () Bool)

(assert (=> d!117487 (= c!100439 lt!439346)))

(assert (=> d!117487 (= lt!439346 (containsKey!479 (toList!6856 lt!439172) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117487 (= (contains!5695 lt!439172 #b1000000000000000000000000000000000000000000000000000000000000000) lt!439348)))

(declare-fun b!990420 () Bool)

(declare-fun lt!439345 () Unit!32729)

(assert (=> b!990420 (= e!558458 lt!439345)))

(assert (=> b!990420 (= lt!439345 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439172) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990420 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439172) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990421 () Bool)

(declare-fun Unit!32746 () Unit!32729)

(assert (=> b!990421 (= e!558458 Unit!32746)))

(declare-fun b!990422 () Bool)

(assert (=> b!990422 (= e!558457 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439172) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117487 c!100439) b!990420))

(assert (= (and d!117487 (not c!100439)) b!990421))

(assert (= (and d!117487 (not res!662235)) b!990422))

(declare-fun m!917573 () Bool)

(assert (=> d!117487 m!917573))

(declare-fun m!917575 () Bool)

(assert (=> b!990420 m!917575))

(assert (=> b!990420 m!917473))

(assert (=> b!990420 m!917473))

(declare-fun m!917577 () Bool)

(assert (=> b!990420 m!917577))

(assert (=> b!990422 m!917473))

(assert (=> b!990422 m!917473))

(assert (=> b!990422 m!917577))

(assert (=> bm!41958 d!117487))

(declare-fun d!117489 () Bool)

(assert (=> d!117489 (= (get!15639 (select (arr!30092 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990061 d!117489))

(assert (=> b!990186 d!117355))

(declare-fun d!117491 () Bool)

(assert (=> d!117491 (= (apply!890 lt!439194 (select (arr!30093 _keys!1544) from!1932)) (get!15640 (getValueByKey!517 (toList!6856 lt!439194) (select (arr!30093 _keys!1544) from!1932))))))

(declare-fun bs!28098 () Bool)

(assert (= bs!28098 d!117491))

(assert (=> bs!28098 m!916855))

(declare-fun m!917579 () Bool)

(assert (=> bs!28098 m!917579))

(assert (=> bs!28098 m!917579))

(declare-fun m!917581 () Bool)

(assert (=> bs!28098 m!917581))

(assert (=> b!990203 d!117491))

(assert (=> b!990203 d!117345))

(declare-fun d!117493 () Bool)

(declare-fun e!558459 () Bool)

(assert (=> d!117493 e!558459))

(declare-fun res!662236 () Bool)

(assert (=> d!117493 (=> res!662236 e!558459)))

(declare-fun lt!439352 () Bool)

(assert (=> d!117493 (= res!662236 (not lt!439352))))

(declare-fun lt!439350 () Bool)

(assert (=> d!117493 (= lt!439352 lt!439350)))

(declare-fun lt!439351 () Unit!32729)

(declare-fun e!558460 () Unit!32729)

(assert (=> d!117493 (= lt!439351 e!558460)))

(declare-fun c!100440 () Bool)

(assert (=> d!117493 (= c!100440 lt!439350)))

(assert (=> d!117493 (= lt!439350 (containsKey!479 (toList!6856 lt!439111) (_1!7508 lt!439038)))))

(assert (=> d!117493 (= (contains!5695 lt!439111 (_1!7508 lt!439038)) lt!439352)))

(declare-fun b!990423 () Bool)

(declare-fun lt!439349 () Unit!32729)

(assert (=> b!990423 (= e!558460 lt!439349)))

(assert (=> b!990423 (= lt!439349 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439111) (_1!7508 lt!439038)))))

(assert (=> b!990423 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439111) (_1!7508 lt!439038)))))

(declare-fun b!990424 () Bool)

(declare-fun Unit!32747 () Unit!32729)

(assert (=> b!990424 (= e!558460 Unit!32747)))

(declare-fun b!990425 () Bool)

(assert (=> b!990425 (= e!558459 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439111) (_1!7508 lt!439038))))))

(assert (= (and d!117493 c!100440) b!990423))

(assert (= (and d!117493 (not c!100440)) b!990424))

(assert (= (and d!117493 (not res!662236)) b!990425))

(declare-fun m!917583 () Bool)

(assert (=> d!117493 m!917583))

(declare-fun m!917585 () Bool)

(assert (=> b!990423 m!917585))

(assert (=> b!990423 m!917021))

(assert (=> b!990423 m!917021))

(declare-fun m!917587 () Bool)

(assert (=> b!990423 m!917587))

(assert (=> b!990425 m!917021))

(assert (=> b!990425 m!917021))

(assert (=> b!990425 m!917587))

(assert (=> d!117359 d!117493))

(declare-fun b!990427 () Bool)

(declare-fun e!558461 () Option!523)

(declare-fun e!558462 () Option!523)

(assert (=> b!990427 (= e!558461 e!558462)))

(declare-fun c!100442 () Bool)

(assert (=> b!990427 (= c!100442 (and ((_ is Cons!20872) lt!439109) (not (= (_1!7508 (h!22034 lt!439109)) (_1!7508 lt!439038)))))))

(declare-fun b!990428 () Bool)

(assert (=> b!990428 (= e!558462 (getValueByKey!517 (t!29840 lt!439109) (_1!7508 lt!439038)))))

(declare-fun d!117495 () Bool)

(declare-fun c!100441 () Bool)

(assert (=> d!117495 (= c!100441 (and ((_ is Cons!20872) lt!439109) (= (_1!7508 (h!22034 lt!439109)) (_1!7508 lt!439038))))))

(assert (=> d!117495 (= (getValueByKey!517 lt!439109 (_1!7508 lt!439038)) e!558461)))

(declare-fun b!990426 () Bool)

(assert (=> b!990426 (= e!558461 (Some!522 (_2!7508 (h!22034 lt!439109))))))

(declare-fun b!990429 () Bool)

(assert (=> b!990429 (= e!558462 None!521)))

(assert (= (and d!117495 c!100441) b!990426))

(assert (= (and d!117495 (not c!100441)) b!990427))

(assert (= (and b!990427 c!100442) b!990428))

(assert (= (and b!990427 (not c!100442)) b!990429))

(declare-fun m!917589 () Bool)

(assert (=> b!990428 m!917589))

(assert (=> d!117359 d!117495))

(declare-fun d!117497 () Bool)

(assert (=> d!117497 (= (getValueByKey!517 lt!439109 (_1!7508 lt!439038)) (Some!522 (_2!7508 lt!439038)))))

(declare-fun lt!439353 () Unit!32729)

(assert (=> d!117497 (= lt!439353 (choose!1625 lt!439109 (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(declare-fun e!558463 () Bool)

(assert (=> d!117497 e!558463))

(declare-fun res!662237 () Bool)

(assert (=> d!117497 (=> (not res!662237) (not e!558463))))

(assert (=> d!117497 (= res!662237 (isStrictlySorted!513 lt!439109))))

(assert (=> d!117497 (= (lemmaContainsTupThenGetReturnValue!274 lt!439109 (_1!7508 lt!439038) (_2!7508 lt!439038)) lt!439353)))

(declare-fun b!990430 () Bool)

(declare-fun res!662238 () Bool)

(assert (=> b!990430 (=> (not res!662238) (not e!558463))))

(assert (=> b!990430 (= res!662238 (containsKey!479 lt!439109 (_1!7508 lt!439038)))))

(declare-fun b!990431 () Bool)

(assert (=> b!990431 (= e!558463 (contains!5697 lt!439109 (tuple2!14995 (_1!7508 lt!439038) (_2!7508 lt!439038))))))

(assert (= (and d!117497 res!662237) b!990430))

(assert (= (and b!990430 res!662238) b!990431))

(assert (=> d!117497 m!917015))

(declare-fun m!917591 () Bool)

(assert (=> d!117497 m!917591))

(declare-fun m!917593 () Bool)

(assert (=> d!117497 m!917593))

(declare-fun m!917595 () Bool)

(assert (=> b!990430 m!917595))

(declare-fun m!917597 () Bool)

(assert (=> b!990431 m!917597))

(assert (=> d!117359 d!117497))

(declare-fun b!990432 () Bool)

(declare-fun e!558466 () List!20876)

(declare-fun call!41995 () List!20876)

(assert (=> b!990432 (= e!558466 call!41995)))

(declare-fun b!990433 () Bool)

(declare-fun e!558465 () List!20876)

(declare-fun e!558464 () List!20876)

(assert (=> b!990433 (= e!558465 e!558464)))

(declare-fun c!100445 () Bool)

(assert (=> b!990433 (= c!100445 (and ((_ is Cons!20872) (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7508 (h!22034 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7508 lt!439038))))))

(declare-fun b!990434 () Bool)

(declare-fun e!558468 () Bool)

(declare-fun lt!439354 () List!20876)

(assert (=> b!990434 (= e!558468 (contains!5697 lt!439354 (tuple2!14995 (_1!7508 lt!439038) (_2!7508 lt!439038))))))

(declare-fun e!558467 () List!20876)

(declare-fun b!990435 () Bool)

(assert (=> b!990435 (= e!558467 (insertStrictlySorted!331 (t!29840 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(declare-fun bm!41990 () Bool)

(declare-fun call!41994 () List!20876)

(assert (=> bm!41990 (= call!41995 call!41994)))

(declare-fun bm!41991 () Bool)

(declare-fun call!41993 () List!20876)

(assert (=> bm!41991 (= call!41994 call!41993)))

(declare-fun d!117499 () Bool)

(assert (=> d!117499 e!558468))

(declare-fun res!662240 () Bool)

(assert (=> d!117499 (=> (not res!662240) (not e!558468))))

(assert (=> d!117499 (= res!662240 (isStrictlySorted!513 lt!439354))))

(assert (=> d!117499 (= lt!439354 e!558465)))

(declare-fun c!100443 () Bool)

(assert (=> d!117499 (= c!100443 (and ((_ is Cons!20872) (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7508 (h!22034 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7508 lt!439038))))))

(assert (=> d!117499 (isStrictlySorted!513 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!117499 (= (insertStrictlySorted!331 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7508 lt!439038) (_2!7508 lt!439038)) lt!439354)))

(declare-fun c!100446 () Bool)

(declare-fun b!990436 () Bool)

(assert (=> b!990436 (= e!558467 (ite c!100445 (t!29840 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100446 (Cons!20872 (h!22034 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29840 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20873)))))

(declare-fun b!990437 () Bool)

(declare-fun res!662239 () Bool)

(assert (=> b!990437 (=> (not res!662239) (not e!558468))))

(assert (=> b!990437 (= res!662239 (containsKey!479 lt!439354 (_1!7508 lt!439038)))))

(declare-fun b!990438 () Bool)

(assert (=> b!990438 (= e!558466 call!41995)))

(declare-fun b!990439 () Bool)

(assert (=> b!990439 (= e!558464 call!41994)))

(declare-fun b!990440 () Bool)

(assert (=> b!990440 (= e!558465 call!41993)))

(declare-fun bm!41992 () Bool)

(assert (=> bm!41992 (= call!41993 ($colon$colon!557 e!558467 (ite c!100443 (h!22034 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14995 (_1!7508 lt!439038) (_2!7508 lt!439038)))))))

(declare-fun c!100444 () Bool)

(assert (=> bm!41992 (= c!100444 c!100443)))

(declare-fun b!990441 () Bool)

(assert (=> b!990441 (= c!100446 (and ((_ is Cons!20872) (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7508 (h!22034 (toList!6856 (getCurrentListMap!3825 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7508 lt!439038))))))

(assert (=> b!990441 (= e!558464 e!558466)))

(assert (= (and d!117499 c!100443) b!990440))

(assert (= (and d!117499 (not c!100443)) b!990433))

(assert (= (and b!990433 c!100445) b!990439))

(assert (= (and b!990433 (not c!100445)) b!990441))

(assert (= (and b!990441 c!100446) b!990432))

(assert (= (and b!990441 (not c!100446)) b!990438))

(assert (= (or b!990432 b!990438) bm!41990))

(assert (= (or b!990439 bm!41990) bm!41991))

(assert (= (or b!990440 bm!41991) bm!41992))

(assert (= (and bm!41992 c!100444) b!990435))

(assert (= (and bm!41992 (not c!100444)) b!990436))

(assert (= (and d!117499 res!662240) b!990437))

(assert (= (and b!990437 res!662239) b!990434))

(declare-fun m!917599 () Bool)

(assert (=> b!990434 m!917599))

(declare-fun m!917601 () Bool)

(assert (=> bm!41992 m!917601))

(declare-fun m!917603 () Bool)

(assert (=> b!990437 m!917603))

(declare-fun m!917605 () Bool)

(assert (=> d!117499 m!917605))

(declare-fun m!917607 () Bool)

(assert (=> d!117499 m!917607))

(declare-fun m!917609 () Bool)

(assert (=> b!990435 m!917609))

(assert (=> d!117359 d!117499))

(declare-fun d!117501 () Bool)

(declare-fun lt!439357 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!420 (List!20876) (InoxSet tuple2!14994))

(assert (=> d!117501 (= lt!439357 (select (content!420 (toList!6856 lt!439214)) lt!439038))))

(declare-fun e!558474 () Bool)

(assert (=> d!117501 (= lt!439357 e!558474)))

(declare-fun res!662245 () Bool)

(assert (=> d!117501 (=> (not res!662245) (not e!558474))))

(assert (=> d!117501 (= res!662245 ((_ is Cons!20872) (toList!6856 lt!439214)))))

(assert (=> d!117501 (= (contains!5697 (toList!6856 lt!439214) lt!439038) lt!439357)))

(declare-fun b!990446 () Bool)

(declare-fun e!558473 () Bool)

(assert (=> b!990446 (= e!558474 e!558473)))

(declare-fun res!662246 () Bool)

(assert (=> b!990446 (=> res!662246 e!558473)))

(assert (=> b!990446 (= res!662246 (= (h!22034 (toList!6856 lt!439214)) lt!439038))))

(declare-fun b!990447 () Bool)

(assert (=> b!990447 (= e!558473 (contains!5697 (t!29840 (toList!6856 lt!439214)) lt!439038))))

(assert (= (and d!117501 res!662245) b!990446))

(assert (= (and b!990446 (not res!662246)) b!990447))

(declare-fun m!917611 () Bool)

(assert (=> d!117501 m!917611))

(declare-fun m!917613 () Bool)

(assert (=> d!117501 m!917613))

(declare-fun m!917615 () Bool)

(assert (=> b!990447 m!917615))

(assert (=> b!990208 d!117501))

(declare-fun d!117503 () Bool)

(declare-fun e!558475 () Bool)

(assert (=> d!117503 e!558475))

(declare-fun res!662247 () Bool)

(assert (=> d!117503 (=> res!662247 e!558475)))

(declare-fun lt!439361 () Bool)

(assert (=> d!117503 (= res!662247 (not lt!439361))))

(declare-fun lt!439359 () Bool)

(assert (=> d!117503 (= lt!439361 lt!439359)))

(declare-fun lt!439360 () Unit!32729)

(declare-fun e!558476 () Unit!32729)

(assert (=> d!117503 (= lt!439360 e!558476)))

(declare-fun c!100447 () Bool)

(assert (=> d!117503 (= c!100447 lt!439359)))

(assert (=> d!117503 (= lt!439359 (containsKey!479 (toList!6856 lt!439194) (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> d!117503 (= (contains!5695 lt!439194 (select (arr!30093 _keys!1544) from!1932)) lt!439361)))

(declare-fun b!990448 () Bool)

(declare-fun lt!439358 () Unit!32729)

(assert (=> b!990448 (= e!558476 lt!439358)))

(assert (=> b!990448 (= lt!439358 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439194) (select (arr!30093 _keys!1544) from!1932)))))

(assert (=> b!990448 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439194) (select (arr!30093 _keys!1544) from!1932)))))

(declare-fun b!990449 () Bool)

(declare-fun Unit!32748 () Unit!32729)

(assert (=> b!990449 (= e!558476 Unit!32748)))

(declare-fun b!990450 () Bool)

(assert (=> b!990450 (= e!558475 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439194) (select (arr!30093 _keys!1544) from!1932))))))

(assert (= (and d!117503 c!100447) b!990448))

(assert (= (and d!117503 (not c!100447)) b!990449))

(assert (= (and d!117503 (not res!662247)) b!990450))

(assert (=> d!117503 m!916855))

(declare-fun m!917617 () Bool)

(assert (=> d!117503 m!917617))

(assert (=> b!990448 m!916855))

(declare-fun m!917619 () Bool)

(assert (=> b!990448 m!917619))

(assert (=> b!990448 m!916855))

(assert (=> b!990448 m!917579))

(assert (=> b!990448 m!917579))

(declare-fun m!917621 () Bool)

(assert (=> b!990448 m!917621))

(assert (=> b!990450 m!916855))

(assert (=> b!990450 m!917579))

(assert (=> b!990450 m!917579))

(assert (=> b!990450 m!917621))

(assert (=> b!990189 d!117503))

(assert (=> b!990176 d!117421))

(declare-fun d!117505 () Bool)

(declare-fun e!558477 () Bool)

(assert (=> d!117505 e!558477))

(declare-fun res!662248 () Bool)

(assert (=> d!117505 (=> res!662248 e!558477)))

(declare-fun lt!439365 () Bool)

(assert (=> d!117505 (= res!662248 (not lt!439365))))

(declare-fun lt!439363 () Bool)

(assert (=> d!117505 (= lt!439365 lt!439363)))

(declare-fun lt!439364 () Unit!32729)

(declare-fun e!558478 () Unit!32729)

(assert (=> d!117505 (= lt!439364 e!558478)))

(declare-fun c!100448 () Bool)

(assert (=> d!117505 (= c!100448 lt!439363)))

(assert (=> d!117505 (= lt!439363 (containsKey!479 (toList!6856 lt!439094) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117505 (= (contains!5695 lt!439094 #b0000000000000000000000000000000000000000000000000000000000000000) lt!439365)))

(declare-fun b!990451 () Bool)

(declare-fun lt!439362 () Unit!32729)

(assert (=> b!990451 (= e!558478 lt!439362)))

(assert (=> b!990451 (= lt!439362 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439094) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!990451 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439094) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!990452 () Bool)

(declare-fun Unit!32749 () Unit!32729)

(assert (=> b!990452 (= e!558478 Unit!32749)))

(declare-fun b!990453 () Bool)

(assert (=> b!990453 (= e!558477 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439094) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117505 c!100448) b!990451))

(assert (= (and d!117505 (not c!100448)) b!990452))

(assert (= (and d!117505 (not res!662248)) b!990453))

(declare-fun m!917623 () Bool)

(assert (=> d!117505 m!917623))

(declare-fun m!917625 () Bool)

(assert (=> b!990451 m!917625))

(declare-fun m!917627 () Bool)

(assert (=> b!990451 m!917627))

(assert (=> b!990451 m!917627))

(declare-fun m!917629 () Bool)

(assert (=> b!990451 m!917629))

(assert (=> b!990453 m!917627))

(assert (=> b!990453 m!917627))

(assert (=> b!990453 m!917629))

(assert (=> d!117347 d!117505))

(assert (=> d!117347 d!117349))

(declare-fun d!117507 () Bool)

(declare-fun e!558479 () Bool)

(assert (=> d!117507 e!558479))

(declare-fun res!662249 () Bool)

(assert (=> d!117507 (=> res!662249 e!558479)))

(declare-fun lt!439369 () Bool)

(assert (=> d!117507 (= res!662249 (not lt!439369))))

(declare-fun lt!439367 () Bool)

(assert (=> d!117507 (= lt!439369 lt!439367)))

(declare-fun lt!439368 () Unit!32729)

(declare-fun e!558480 () Unit!32729)

(assert (=> d!117507 (= lt!439368 e!558480)))

(declare-fun c!100449 () Bool)

(assert (=> d!117507 (= c!100449 lt!439367)))

(assert (=> d!117507 (= lt!439367 (containsKey!479 (toList!6856 lt!439094) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117507 (= (contains!5695 lt!439094 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439369)))

(declare-fun b!990454 () Bool)

(declare-fun lt!439366 () Unit!32729)

(assert (=> b!990454 (= e!558480 lt!439366)))

(assert (=> b!990454 (= lt!439366 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439094) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990454 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439094) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990455 () Bool)

(declare-fun Unit!32750 () Unit!32729)

(assert (=> b!990455 (= e!558480 Unit!32750)))

(declare-fun b!990456 () Bool)

(assert (=> b!990456 (= e!558479 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439094) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117507 c!100449) b!990454))

(assert (= (and d!117507 (not c!100449)) b!990455))

(assert (= (and d!117507 (not res!662249)) b!990456))

(assert (=> d!117507 m!916989))

(declare-fun m!917631 () Bool)

(assert (=> d!117507 m!917631))

(assert (=> b!990454 m!916989))

(declare-fun m!917633 () Bool)

(assert (=> b!990454 m!917633))

(assert (=> b!990454 m!916989))

(declare-fun m!917635 () Bool)

(assert (=> b!990454 m!917635))

(assert (=> b!990454 m!917635))

(declare-fun m!917637 () Bool)

(assert (=> b!990454 m!917637))

(assert (=> b!990456 m!916989))

(assert (=> b!990456 m!917635))

(assert (=> b!990456 m!917635))

(assert (=> b!990456 m!917637))

(assert (=> b!990086 d!117507))

(declare-fun d!117509 () Bool)

(declare-fun e!558481 () Bool)

(assert (=> d!117509 e!558481))

(declare-fun res!662251 () Bool)

(assert (=> d!117509 (=> (not res!662251) (not e!558481))))

(declare-fun lt!439373 () ListLongMap!13681)

(assert (=> d!117509 (= res!662251 (contains!5695 lt!439373 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!439371 () List!20876)

(assert (=> d!117509 (= lt!439373 (ListLongMap!13682 lt!439371))))

(declare-fun lt!439372 () Unit!32729)

(declare-fun lt!439370 () Unit!32729)

(assert (=> d!117509 (= lt!439372 lt!439370)))

(assert (=> d!117509 (= (getValueByKey!517 lt!439371 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117509 (= lt!439370 (lemmaContainsTupThenGetReturnValue!274 lt!439371 (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117509 (= lt!439371 (insertStrictlySorted!331 (toList!6856 call!41970) (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117509 (= (+!3118 call!41970 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!439373)))

(declare-fun b!990457 () Bool)

(declare-fun res!662250 () Bool)

(assert (=> b!990457 (=> (not res!662250) (not e!558481))))

(assert (=> b!990457 (= res!662250 (= (getValueByKey!517 (toList!6856 lt!439373) (_1!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!990458 () Bool)

(assert (=> b!990458 (= e!558481 (contains!5697 (toList!6856 lt!439373) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117509 res!662251) b!990457))

(assert (= (and b!990457 res!662250) b!990458))

(declare-fun m!917639 () Bool)

(assert (=> d!117509 m!917639))

(declare-fun m!917641 () Bool)

(assert (=> d!117509 m!917641))

(declare-fun m!917643 () Bool)

(assert (=> d!117509 m!917643))

(declare-fun m!917645 () Bool)

(assert (=> d!117509 m!917645))

(declare-fun m!917647 () Bool)

(assert (=> b!990457 m!917647))

(declare-fun m!917649 () Bool)

(assert (=> b!990458 m!917649))

(assert (=> b!990191 d!117509))

(declare-fun d!117511 () Bool)

(declare-fun e!558482 () Bool)

(assert (=> d!117511 e!558482))

(declare-fun res!662253 () Bool)

(assert (=> d!117511 (=> (not res!662253) (not e!558482))))

(declare-fun lt!439377 () ListLongMap!13681)

(assert (=> d!117511 (= res!662253 (contains!5695 lt!439377 (_1!7508 (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439375 () List!20876)

(assert (=> d!117511 (= lt!439377 (ListLongMap!13682 lt!439375))))

(declare-fun lt!439376 () Unit!32729)

(declare-fun lt!439374 () Unit!32729)

(assert (=> d!117511 (= lt!439376 lt!439374)))

(assert (=> d!117511 (= (getValueByKey!517 lt!439375 (_1!7508 (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!522 (_2!7508 (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117511 (= lt!439374 (lemmaContainsTupThenGetReturnValue!274 lt!439375 (_1!7508 (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7508 (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117511 (= lt!439375 (insertStrictlySorted!331 (toList!6856 (ite c!100375 call!41973 (ite c!100373 call!41972 call!41967))) (_1!7508 (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7508 (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117511 (= (+!3118 (ite c!100375 call!41973 (ite c!100373 call!41972 call!41967)) (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439377)))

(declare-fun b!990459 () Bool)

(declare-fun res!662252 () Bool)

(assert (=> b!990459 (=> (not res!662252) (not e!558482))))

(assert (=> b!990459 (= res!662252 (= (getValueByKey!517 (toList!6856 lt!439377) (_1!7508 (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!522 (_2!7508 (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!990460 () Bool)

(assert (=> b!990460 (= e!558482 (contains!5697 (toList!6856 lt!439377) (ite (or c!100375 c!100373) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117511 res!662253) b!990459))

(assert (= (and b!990459 res!662252) b!990460))

(declare-fun m!917651 () Bool)

(assert (=> d!117511 m!917651))

(declare-fun m!917653 () Bool)

(assert (=> d!117511 m!917653))

(declare-fun m!917655 () Bool)

(assert (=> d!117511 m!917655))

(declare-fun m!917657 () Bool)

(assert (=> d!117511 m!917657))

(declare-fun m!917659 () Bool)

(assert (=> b!990459 m!917659))

(declare-fun m!917661 () Bool)

(assert (=> b!990460 m!917661))

(assert (=> bm!41970 d!117511))

(declare-fun d!117513 () Bool)

(assert (=> d!117513 (arrayContainsKey!0 _keys!1544 lt!439076 #b00000000000000000000000000000000)))

(declare-fun lt!439380 () Unit!32729)

(declare-fun choose!13 (array!62482 (_ BitVec 64) (_ BitVec 32)) Unit!32729)

(assert (=> d!117513 (= lt!439380 (choose!13 _keys!1544 lt!439076 #b00000000000000000000000000000000))))

(assert (=> d!117513 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!117513 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!439076 #b00000000000000000000000000000000) lt!439380)))

(declare-fun bs!28099 () Bool)

(assert (= bs!28099 d!117513))

(assert (=> bs!28099 m!916969))

(declare-fun m!917663 () Bool)

(assert (=> bs!28099 m!917663))

(assert (=> b!990052 d!117513))

(declare-fun d!117515 () Bool)

(declare-fun res!662258 () Bool)

(declare-fun e!558487 () Bool)

(assert (=> d!117515 (=> res!662258 e!558487)))

(assert (=> d!117515 (= res!662258 (= (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) lt!439076))))

(assert (=> d!117515 (= (arrayContainsKey!0 _keys!1544 lt!439076 #b00000000000000000000000000000000) e!558487)))

(declare-fun b!990465 () Bool)

(declare-fun e!558488 () Bool)

(assert (=> b!990465 (= e!558487 e!558488)))

(declare-fun res!662259 () Bool)

(assert (=> b!990465 (=> (not res!662259) (not e!558488))))

(assert (=> b!990465 (= res!662259 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30574 _keys!1544)))))

(declare-fun b!990466 () Bool)

(assert (=> b!990466 (= e!558488 (arrayContainsKey!0 _keys!1544 lt!439076 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!117515 (not res!662258)) b!990465))

(assert (= (and b!990465 res!662259) b!990466))

(assert (=> d!117515 m!916965))

(declare-fun m!917665 () Bool)

(assert (=> b!990466 m!917665))

(assert (=> b!990052 d!117515))

(declare-fun d!117517 () Bool)

(declare-fun lt!439387 () SeekEntryResult!9207)

(assert (=> d!117517 (and (or ((_ is Undefined!9207) lt!439387) (not ((_ is Found!9207) lt!439387)) (and (bvsge (index!39200 lt!439387) #b00000000000000000000000000000000) (bvslt (index!39200 lt!439387) (size!30574 _keys!1544)))) (or ((_ is Undefined!9207) lt!439387) ((_ is Found!9207) lt!439387) (not ((_ is MissingZero!9207) lt!439387)) (and (bvsge (index!39199 lt!439387) #b00000000000000000000000000000000) (bvslt (index!39199 lt!439387) (size!30574 _keys!1544)))) (or ((_ is Undefined!9207) lt!439387) ((_ is Found!9207) lt!439387) ((_ is MissingZero!9207) lt!439387) (not ((_ is MissingVacant!9207) lt!439387)) (and (bvsge (index!39202 lt!439387) #b00000000000000000000000000000000) (bvslt (index!39202 lt!439387) (size!30574 _keys!1544)))) (or ((_ is Undefined!9207) lt!439387) (ite ((_ is Found!9207) lt!439387) (= (select (arr!30093 _keys!1544) (index!39200 lt!439387)) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9207) lt!439387) (= (select (arr!30093 _keys!1544) (index!39199 lt!439387)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9207) lt!439387) (= (select (arr!30093 _keys!1544) (index!39202 lt!439387)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!558497 () SeekEntryResult!9207)

(assert (=> d!117517 (= lt!439387 e!558497)))

(declare-fun c!100456 () Bool)

(declare-fun lt!439389 () SeekEntryResult!9207)

(assert (=> d!117517 (= c!100456 (and ((_ is Intermediate!9207) lt!439389) (undefined!10019 lt!439389)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62482 (_ BitVec 32)) SeekEntryResult!9207)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!117517 (= lt!439389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!117517 (validMask!0 mask!1948)))

(assert (=> d!117517 (= (seekEntryOrOpen!0 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!439387)))

(declare-fun b!990479 () Bool)

(declare-fun e!558495 () SeekEntryResult!9207)

(assert (=> b!990479 (= e!558495 (Found!9207 (index!39201 lt!439389)))))

(declare-fun b!990480 () Bool)

(declare-fun c!100457 () Bool)

(declare-fun lt!439388 () (_ BitVec 64))

(assert (=> b!990480 (= c!100457 (= lt!439388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!558496 () SeekEntryResult!9207)

(assert (=> b!990480 (= e!558495 e!558496)))

(declare-fun b!990481 () Bool)

(assert (=> b!990481 (= e!558497 e!558495)))

(assert (=> b!990481 (= lt!439388 (select (arr!30093 _keys!1544) (index!39201 lt!439389)))))

(declare-fun c!100458 () Bool)

(assert (=> b!990481 (= c!100458 (= lt!439388 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990482 () Bool)

(assert (=> b!990482 (= e!558496 (MissingZero!9207 (index!39201 lt!439389)))))

(declare-fun b!990483 () Bool)

(assert (=> b!990483 (= e!558497 Undefined!9207)))

(declare-fun b!990484 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62482 (_ BitVec 32)) SeekEntryResult!9207)

(assert (=> b!990484 (= e!558496 (seekKeyOrZeroReturnVacant!0 (x!86176 lt!439389) (index!39201 lt!439389) (index!39201 lt!439389) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (= (and d!117517 c!100456) b!990483))

(assert (= (and d!117517 (not c!100456)) b!990481))

(assert (= (and b!990481 c!100458) b!990479))

(assert (= (and b!990481 (not c!100458)) b!990480))

(assert (= (and b!990480 c!100457) b!990482))

(assert (= (and b!990480 (not c!100457)) b!990484))

(declare-fun m!917667 () Bool)

(assert (=> d!117517 m!917667))

(assert (=> d!117517 m!916965))

(declare-fun m!917669 () Bool)

(assert (=> d!117517 m!917669))

(declare-fun m!917671 () Bool)

(assert (=> d!117517 m!917671))

(declare-fun m!917673 () Bool)

(assert (=> d!117517 m!917673))

(assert (=> d!117517 m!916965))

(assert (=> d!117517 m!917667))

(assert (=> d!117517 m!916847))

(declare-fun m!917675 () Bool)

(assert (=> d!117517 m!917675))

(declare-fun m!917677 () Bool)

(assert (=> b!990481 m!917677))

(assert (=> b!990484 m!916965))

(declare-fun m!917679 () Bool)

(assert (=> b!990484 m!917679))

(assert (=> b!990052 d!117517))

(declare-fun d!117519 () Bool)

(declare-fun lt!439390 () Bool)

(assert (=> d!117519 (= lt!439390 (select (content!420 (toList!6856 lt!439218)) lt!439038))))

(declare-fun e!558499 () Bool)

(assert (=> d!117519 (= lt!439390 e!558499)))

(declare-fun res!662260 () Bool)

(assert (=> d!117519 (=> (not res!662260) (not e!558499))))

(assert (=> d!117519 (= res!662260 ((_ is Cons!20872) (toList!6856 lt!439218)))))

(assert (=> d!117519 (= (contains!5697 (toList!6856 lt!439218) lt!439038) lt!439390)))

(declare-fun b!990485 () Bool)

(declare-fun e!558498 () Bool)

(assert (=> b!990485 (= e!558499 e!558498)))

(declare-fun res!662261 () Bool)

(assert (=> b!990485 (=> res!662261 e!558498)))

(assert (=> b!990485 (= res!662261 (= (h!22034 (toList!6856 lt!439218)) lt!439038))))

(declare-fun b!990486 () Bool)

(assert (=> b!990486 (= e!558498 (contains!5697 (t!29840 (toList!6856 lt!439218)) lt!439038))))

(assert (= (and d!117519 res!662260) b!990485))

(assert (= (and b!990485 (not res!662261)) b!990486))

(declare-fun m!917681 () Bool)

(assert (=> d!117519 m!917681))

(declare-fun m!917683 () Bool)

(assert (=> d!117519 m!917683))

(declare-fun m!917685 () Bool)

(assert (=> b!990486 m!917685))

(assert (=> b!990210 d!117519))

(declare-fun d!117521 () Bool)

(declare-fun e!558500 () Bool)

(assert (=> d!117521 e!558500))

(declare-fun res!662263 () Bool)

(assert (=> d!117521 (=> (not res!662263) (not e!558500))))

(declare-fun lt!439394 () ListLongMap!13681)

(assert (=> d!117521 (= res!662263 (contains!5695 lt!439394 (_1!7508 (tuple2!14995 lt!439195 zeroValue!1220))))))

(declare-fun lt!439392 () List!20876)

(assert (=> d!117521 (= lt!439394 (ListLongMap!13682 lt!439392))))

(declare-fun lt!439393 () Unit!32729)

(declare-fun lt!439391 () Unit!32729)

(assert (=> d!117521 (= lt!439393 lt!439391)))

(assert (=> d!117521 (= (getValueByKey!517 lt!439392 (_1!7508 (tuple2!14995 lt!439195 zeroValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439195 zeroValue!1220))))))

(assert (=> d!117521 (= lt!439391 (lemmaContainsTupThenGetReturnValue!274 lt!439392 (_1!7508 (tuple2!14995 lt!439195 zeroValue!1220)) (_2!7508 (tuple2!14995 lt!439195 zeroValue!1220))))))

(assert (=> d!117521 (= lt!439392 (insertStrictlySorted!331 (toList!6856 lt!439191) (_1!7508 (tuple2!14995 lt!439195 zeroValue!1220)) (_2!7508 (tuple2!14995 lt!439195 zeroValue!1220))))))

(assert (=> d!117521 (= (+!3118 lt!439191 (tuple2!14995 lt!439195 zeroValue!1220)) lt!439394)))

(declare-fun b!990487 () Bool)

(declare-fun res!662262 () Bool)

(assert (=> b!990487 (=> (not res!662262) (not e!558500))))

(assert (=> b!990487 (= res!662262 (= (getValueByKey!517 (toList!6856 lt!439394) (_1!7508 (tuple2!14995 lt!439195 zeroValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439195 zeroValue!1220)))))))

(declare-fun b!990488 () Bool)

(assert (=> b!990488 (= e!558500 (contains!5697 (toList!6856 lt!439394) (tuple2!14995 lt!439195 zeroValue!1220)))))

(assert (= (and d!117521 res!662263) b!990487))

(assert (= (and b!990487 res!662262) b!990488))

(declare-fun m!917687 () Bool)

(assert (=> d!117521 m!917687))

(declare-fun m!917689 () Bool)

(assert (=> d!117521 m!917689))

(declare-fun m!917691 () Bool)

(assert (=> d!117521 m!917691))

(declare-fun m!917693 () Bool)

(assert (=> d!117521 m!917693))

(declare-fun m!917695 () Bool)

(assert (=> b!990487 m!917695))

(declare-fun m!917697 () Bool)

(assert (=> b!990488 m!917697))

(assert (=> b!990192 d!117521))

(declare-fun d!117523 () Bool)

(assert (=> d!117523 (= (apply!890 (+!3118 lt!439201 (tuple2!14995 lt!439200 minValue!1220)) lt!439209) (get!15640 (getValueByKey!517 (toList!6856 (+!3118 lt!439201 (tuple2!14995 lt!439200 minValue!1220))) lt!439209)))))

(declare-fun bs!28100 () Bool)

(assert (= bs!28100 d!117523))

(declare-fun m!917699 () Bool)

(assert (=> bs!28100 m!917699))

(assert (=> bs!28100 m!917699))

(declare-fun m!917701 () Bool)

(assert (=> bs!28100 m!917701))

(assert (=> b!990192 d!117523))

(assert (=> b!990192 d!117417))

(declare-fun d!117525 () Bool)

(declare-fun e!558501 () Bool)

(assert (=> d!117525 e!558501))

(declare-fun res!662264 () Bool)

(assert (=> d!117525 (=> res!662264 e!558501)))

(declare-fun lt!439398 () Bool)

(assert (=> d!117525 (= res!662264 (not lt!439398))))

(declare-fun lt!439396 () Bool)

(assert (=> d!117525 (= lt!439398 lt!439396)))

(declare-fun lt!439397 () Unit!32729)

(declare-fun e!558502 () Unit!32729)

(assert (=> d!117525 (= lt!439397 e!558502)))

(declare-fun c!100459 () Bool)

(assert (=> d!117525 (= c!100459 lt!439396)))

(assert (=> d!117525 (= lt!439396 (containsKey!479 (toList!6856 (+!3118 lt!439191 (tuple2!14995 lt!439195 zeroValue!1220))) lt!439198))))

(assert (=> d!117525 (= (contains!5695 (+!3118 lt!439191 (tuple2!14995 lt!439195 zeroValue!1220)) lt!439198) lt!439398)))

(declare-fun b!990489 () Bool)

(declare-fun lt!439395 () Unit!32729)

(assert (=> b!990489 (= e!558502 lt!439395)))

(assert (=> b!990489 (= lt!439395 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 (+!3118 lt!439191 (tuple2!14995 lt!439195 zeroValue!1220))) lt!439198))))

(assert (=> b!990489 (isDefined!387 (getValueByKey!517 (toList!6856 (+!3118 lt!439191 (tuple2!14995 lt!439195 zeroValue!1220))) lt!439198))))

(declare-fun b!990490 () Bool)

(declare-fun Unit!32751 () Unit!32729)

(assert (=> b!990490 (= e!558502 Unit!32751)))

(declare-fun b!990491 () Bool)

(assert (=> b!990491 (= e!558501 (isDefined!387 (getValueByKey!517 (toList!6856 (+!3118 lt!439191 (tuple2!14995 lt!439195 zeroValue!1220))) lt!439198)))))

(assert (= (and d!117525 c!100459) b!990489))

(assert (= (and d!117525 (not c!100459)) b!990490))

(assert (= (and d!117525 (not res!662264)) b!990491))

(declare-fun m!917703 () Bool)

(assert (=> d!117525 m!917703))

(declare-fun m!917705 () Bool)

(assert (=> b!990489 m!917705))

(declare-fun m!917707 () Bool)

(assert (=> b!990489 m!917707))

(assert (=> b!990489 m!917707))

(declare-fun m!917709 () Bool)

(assert (=> b!990489 m!917709))

(assert (=> b!990491 m!917707))

(assert (=> b!990491 m!917707))

(assert (=> b!990491 m!917709))

(assert (=> b!990192 d!117525))

(declare-fun d!117527 () Bool)

(declare-fun e!558503 () Bool)

(assert (=> d!117527 e!558503))

(declare-fun res!662266 () Bool)

(assert (=> d!117527 (=> (not res!662266) (not e!558503))))

(declare-fun lt!439402 () ListLongMap!13681)

(assert (=> d!117527 (= res!662266 (contains!5695 lt!439402 (_1!7508 (tuple2!14995 lt!439200 minValue!1220))))))

(declare-fun lt!439400 () List!20876)

(assert (=> d!117527 (= lt!439402 (ListLongMap!13682 lt!439400))))

(declare-fun lt!439401 () Unit!32729)

(declare-fun lt!439399 () Unit!32729)

(assert (=> d!117527 (= lt!439401 lt!439399)))

(assert (=> d!117527 (= (getValueByKey!517 lt!439400 (_1!7508 (tuple2!14995 lt!439200 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439200 minValue!1220))))))

(assert (=> d!117527 (= lt!439399 (lemmaContainsTupThenGetReturnValue!274 lt!439400 (_1!7508 (tuple2!14995 lt!439200 minValue!1220)) (_2!7508 (tuple2!14995 lt!439200 minValue!1220))))))

(assert (=> d!117527 (= lt!439400 (insertStrictlySorted!331 (toList!6856 lt!439201) (_1!7508 (tuple2!14995 lt!439200 minValue!1220)) (_2!7508 (tuple2!14995 lt!439200 minValue!1220))))))

(assert (=> d!117527 (= (+!3118 lt!439201 (tuple2!14995 lt!439200 minValue!1220)) lt!439402)))

(declare-fun b!990492 () Bool)

(declare-fun res!662265 () Bool)

(assert (=> b!990492 (=> (not res!662265) (not e!558503))))

(assert (=> b!990492 (= res!662265 (= (getValueByKey!517 (toList!6856 lt!439402) (_1!7508 (tuple2!14995 lt!439200 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439200 minValue!1220)))))))

(declare-fun b!990493 () Bool)

(assert (=> b!990493 (= e!558503 (contains!5697 (toList!6856 lt!439402) (tuple2!14995 lt!439200 minValue!1220)))))

(assert (= (and d!117527 res!662266) b!990492))

(assert (= (and b!990492 res!662265) b!990493))

(declare-fun m!917711 () Bool)

(assert (=> d!117527 m!917711))

(declare-fun m!917713 () Bool)

(assert (=> d!117527 m!917713))

(declare-fun m!917715 () Bool)

(assert (=> d!117527 m!917715))

(declare-fun m!917717 () Bool)

(assert (=> d!117527 m!917717))

(declare-fun m!917719 () Bool)

(assert (=> b!990492 m!917719))

(declare-fun m!917721 () Bool)

(assert (=> b!990493 m!917721))

(assert (=> b!990192 d!117527))

(declare-fun d!117529 () Bool)

(assert (=> d!117529 (= (apply!890 (+!3118 lt!439207 (tuple2!14995 lt!439208 zeroValue!1220)) lt!439210) (apply!890 lt!439207 lt!439210))))

(declare-fun lt!439403 () Unit!32729)

(assert (=> d!117529 (= lt!439403 (choose!1626 lt!439207 lt!439208 zeroValue!1220 lt!439210))))

(declare-fun e!558504 () Bool)

(assert (=> d!117529 e!558504))

(declare-fun res!662267 () Bool)

(assert (=> d!117529 (=> (not res!662267) (not e!558504))))

(assert (=> d!117529 (= res!662267 (contains!5695 lt!439207 lt!439210))))

(assert (=> d!117529 (= (addApplyDifferent!465 lt!439207 lt!439208 zeroValue!1220 lt!439210) lt!439403)))

(declare-fun b!990494 () Bool)

(assert (=> b!990494 (= e!558504 (not (= lt!439210 lt!439208)))))

(assert (= (and d!117529 res!662267) b!990494))

(assert (=> d!117529 m!917119))

(assert (=> d!117529 m!917137))

(assert (=> d!117529 m!917119))

(declare-fun m!917723 () Bool)

(assert (=> d!117529 m!917723))

(assert (=> d!117529 m!917133))

(declare-fun m!917725 () Bool)

(assert (=> d!117529 m!917725))

(assert (=> b!990192 d!117529))

(declare-fun d!117531 () Bool)

(assert (=> d!117531 (= (apply!890 (+!3118 lt!439201 (tuple2!14995 lt!439200 minValue!1220)) lt!439209) (apply!890 lt!439201 lt!439209))))

(declare-fun lt!439404 () Unit!32729)

(assert (=> d!117531 (= lt!439404 (choose!1626 lt!439201 lt!439200 minValue!1220 lt!439209))))

(declare-fun e!558505 () Bool)

(assert (=> d!117531 e!558505))

(declare-fun res!662268 () Bool)

(assert (=> d!117531 (=> (not res!662268) (not e!558505))))

(assert (=> d!117531 (= res!662268 (contains!5695 lt!439201 lt!439209))))

(assert (=> d!117531 (= (addApplyDifferent!465 lt!439201 lt!439200 minValue!1220 lt!439209) lt!439404)))

(declare-fun b!990495 () Bool)

(assert (=> b!990495 (= e!558505 (not (= lt!439209 lt!439200)))))

(assert (= (and d!117531 res!662268) b!990495))

(assert (=> d!117531 m!917129))

(assert (=> d!117531 m!917135))

(assert (=> d!117531 m!917129))

(declare-fun m!917727 () Bool)

(assert (=> d!117531 m!917727))

(assert (=> d!117531 m!917141))

(declare-fun m!917729 () Bool)

(assert (=> d!117531 m!917729))

(assert (=> b!990192 d!117531))

(declare-fun d!117533 () Bool)

(assert (=> d!117533 (= (apply!890 lt!439207 lt!439210) (get!15640 (getValueByKey!517 (toList!6856 lt!439207) lt!439210)))))

(declare-fun bs!28101 () Bool)

(assert (= bs!28101 d!117533))

(declare-fun m!917731 () Bool)

(assert (=> bs!28101 m!917731))

(assert (=> bs!28101 m!917731))

(declare-fun m!917733 () Bool)

(assert (=> bs!28101 m!917733))

(assert (=> b!990192 d!117533))

(declare-fun d!117535 () Bool)

(assert (=> d!117535 (= (apply!890 lt!439201 lt!439209) (get!15640 (getValueByKey!517 (toList!6856 lt!439201) lt!439209)))))

(declare-fun bs!28102 () Bool)

(assert (= bs!28102 d!117535))

(declare-fun m!917735 () Bool)

(assert (=> bs!28102 m!917735))

(assert (=> bs!28102 m!917735))

(declare-fun m!917737 () Bool)

(assert (=> bs!28102 m!917737))

(assert (=> b!990192 d!117535))

(declare-fun d!117537 () Bool)

(assert (=> d!117537 (= (apply!890 (+!3118 lt!439206 (tuple2!14995 lt!439204 minValue!1220)) lt!439202) (apply!890 lt!439206 lt!439202))))

(declare-fun lt!439405 () Unit!32729)

(assert (=> d!117537 (= lt!439405 (choose!1626 lt!439206 lt!439204 minValue!1220 lt!439202))))

(declare-fun e!558506 () Bool)

(assert (=> d!117537 e!558506))

(declare-fun res!662269 () Bool)

(assert (=> d!117537 (=> (not res!662269) (not e!558506))))

(assert (=> d!117537 (= res!662269 (contains!5695 lt!439206 lt!439202))))

(assert (=> d!117537 (= (addApplyDifferent!465 lt!439206 lt!439204 minValue!1220 lt!439202) lt!439405)))

(declare-fun b!990496 () Bool)

(assert (=> b!990496 (= e!558506 (not (= lt!439202 lt!439204)))))

(assert (= (and d!117537 res!662269) b!990496))

(assert (=> d!117537 m!917115))

(assert (=> d!117537 m!917131))

(assert (=> d!117537 m!917115))

(declare-fun m!917739 () Bool)

(assert (=> d!117537 m!917739))

(assert (=> d!117537 m!917123))

(declare-fun m!917741 () Bool)

(assert (=> d!117537 m!917741))

(assert (=> b!990192 d!117537))

(declare-fun d!117539 () Bool)

(declare-fun e!558507 () Bool)

(assert (=> d!117539 e!558507))

(declare-fun res!662271 () Bool)

(assert (=> d!117539 (=> (not res!662271) (not e!558507))))

(declare-fun lt!439409 () ListLongMap!13681)

(assert (=> d!117539 (= res!662271 (contains!5695 lt!439409 (_1!7508 (tuple2!14995 lt!439204 minValue!1220))))))

(declare-fun lt!439407 () List!20876)

(assert (=> d!117539 (= lt!439409 (ListLongMap!13682 lt!439407))))

(declare-fun lt!439408 () Unit!32729)

(declare-fun lt!439406 () Unit!32729)

(assert (=> d!117539 (= lt!439408 lt!439406)))

(assert (=> d!117539 (= (getValueByKey!517 lt!439407 (_1!7508 (tuple2!14995 lt!439204 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439204 minValue!1220))))))

(assert (=> d!117539 (= lt!439406 (lemmaContainsTupThenGetReturnValue!274 lt!439407 (_1!7508 (tuple2!14995 lt!439204 minValue!1220)) (_2!7508 (tuple2!14995 lt!439204 minValue!1220))))))

(assert (=> d!117539 (= lt!439407 (insertStrictlySorted!331 (toList!6856 lt!439206) (_1!7508 (tuple2!14995 lt!439204 minValue!1220)) (_2!7508 (tuple2!14995 lt!439204 minValue!1220))))))

(assert (=> d!117539 (= (+!3118 lt!439206 (tuple2!14995 lt!439204 minValue!1220)) lt!439409)))

(declare-fun b!990497 () Bool)

(declare-fun res!662270 () Bool)

(assert (=> b!990497 (=> (not res!662270) (not e!558507))))

(assert (=> b!990497 (= res!662270 (= (getValueByKey!517 (toList!6856 lt!439409) (_1!7508 (tuple2!14995 lt!439204 minValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439204 minValue!1220)))))))

(declare-fun b!990498 () Bool)

(assert (=> b!990498 (= e!558507 (contains!5697 (toList!6856 lt!439409) (tuple2!14995 lt!439204 minValue!1220)))))

(assert (= (and d!117539 res!662271) b!990497))

(assert (= (and b!990497 res!662270) b!990498))

(declare-fun m!917743 () Bool)

(assert (=> d!117539 m!917743))

(declare-fun m!917745 () Bool)

(assert (=> d!117539 m!917745))

(declare-fun m!917747 () Bool)

(assert (=> d!117539 m!917747))

(declare-fun m!917749 () Bool)

(assert (=> d!117539 m!917749))

(declare-fun m!917751 () Bool)

(assert (=> b!990497 m!917751))

(declare-fun m!917753 () Bool)

(assert (=> b!990498 m!917753))

(assert (=> b!990192 d!117539))

(declare-fun d!117541 () Bool)

(assert (=> d!117541 (contains!5695 (+!3118 lt!439191 (tuple2!14995 lt!439195 zeroValue!1220)) lt!439198)))

(declare-fun lt!439410 () Unit!32729)

(assert (=> d!117541 (= lt!439410 (choose!1627 lt!439191 lt!439195 zeroValue!1220 lt!439198))))

(assert (=> d!117541 (contains!5695 lt!439191 lt!439198)))

(assert (=> d!117541 (= (addStillContains!609 lt!439191 lt!439195 zeroValue!1220 lt!439198) lt!439410)))

(declare-fun bs!28103 () Bool)

(assert (= bs!28103 d!117541))

(assert (=> bs!28103 m!917125))

(assert (=> bs!28103 m!917125))

(assert (=> bs!28103 m!917127))

(declare-fun m!917755 () Bool)

(assert (=> bs!28103 m!917755))

(declare-fun m!917757 () Bool)

(assert (=> bs!28103 m!917757))

(assert (=> b!990192 d!117541))

(declare-fun d!117543 () Bool)

(assert (=> d!117543 (= (apply!890 (+!3118 lt!439206 (tuple2!14995 lt!439204 minValue!1220)) lt!439202) (get!15640 (getValueByKey!517 (toList!6856 (+!3118 lt!439206 (tuple2!14995 lt!439204 minValue!1220))) lt!439202)))))

(declare-fun bs!28104 () Bool)

(assert (= bs!28104 d!117543))

(declare-fun m!917759 () Bool)

(assert (=> bs!28104 m!917759))

(assert (=> bs!28104 m!917759))

(declare-fun m!917761 () Bool)

(assert (=> bs!28104 m!917761))

(assert (=> b!990192 d!117543))

(declare-fun d!117545 () Bool)

(declare-fun e!558508 () Bool)

(assert (=> d!117545 e!558508))

(declare-fun res!662273 () Bool)

(assert (=> d!117545 (=> (not res!662273) (not e!558508))))

(declare-fun lt!439414 () ListLongMap!13681)

(assert (=> d!117545 (= res!662273 (contains!5695 lt!439414 (_1!7508 (tuple2!14995 lt!439208 zeroValue!1220))))))

(declare-fun lt!439412 () List!20876)

(assert (=> d!117545 (= lt!439414 (ListLongMap!13682 lt!439412))))

(declare-fun lt!439413 () Unit!32729)

(declare-fun lt!439411 () Unit!32729)

(assert (=> d!117545 (= lt!439413 lt!439411)))

(assert (=> d!117545 (= (getValueByKey!517 lt!439412 (_1!7508 (tuple2!14995 lt!439208 zeroValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439208 zeroValue!1220))))))

(assert (=> d!117545 (= lt!439411 (lemmaContainsTupThenGetReturnValue!274 lt!439412 (_1!7508 (tuple2!14995 lt!439208 zeroValue!1220)) (_2!7508 (tuple2!14995 lt!439208 zeroValue!1220))))))

(assert (=> d!117545 (= lt!439412 (insertStrictlySorted!331 (toList!6856 lt!439207) (_1!7508 (tuple2!14995 lt!439208 zeroValue!1220)) (_2!7508 (tuple2!14995 lt!439208 zeroValue!1220))))))

(assert (=> d!117545 (= (+!3118 lt!439207 (tuple2!14995 lt!439208 zeroValue!1220)) lt!439414)))

(declare-fun b!990499 () Bool)

(declare-fun res!662272 () Bool)

(assert (=> b!990499 (=> (not res!662272) (not e!558508))))

(assert (=> b!990499 (= res!662272 (= (getValueByKey!517 (toList!6856 lt!439414) (_1!7508 (tuple2!14995 lt!439208 zeroValue!1220))) (Some!522 (_2!7508 (tuple2!14995 lt!439208 zeroValue!1220)))))))

(declare-fun b!990500 () Bool)

(assert (=> b!990500 (= e!558508 (contains!5697 (toList!6856 lt!439414) (tuple2!14995 lt!439208 zeroValue!1220)))))

(assert (= (and d!117545 res!662273) b!990499))

(assert (= (and b!990499 res!662272) b!990500))

(declare-fun m!917763 () Bool)

(assert (=> d!117545 m!917763))

(declare-fun m!917765 () Bool)

(assert (=> d!117545 m!917765))

(declare-fun m!917767 () Bool)

(assert (=> d!117545 m!917767))

(declare-fun m!917769 () Bool)

(assert (=> d!117545 m!917769))

(declare-fun m!917771 () Bool)

(assert (=> b!990499 m!917771))

(declare-fun m!917773 () Bool)

(assert (=> b!990500 m!917773))

(assert (=> b!990192 d!117545))

(declare-fun d!117547 () Bool)

(assert (=> d!117547 (= (apply!890 lt!439206 lt!439202) (get!15640 (getValueByKey!517 (toList!6856 lt!439206) lt!439202)))))

(declare-fun bs!28105 () Bool)

(assert (= bs!28105 d!117547))

(declare-fun m!917775 () Bool)

(assert (=> bs!28105 m!917775))

(assert (=> bs!28105 m!917775))

(declare-fun m!917777 () Bool)

(assert (=> bs!28105 m!917777))

(assert (=> b!990192 d!117547))

(declare-fun d!117549 () Bool)

(assert (=> d!117549 (= (apply!890 (+!3118 lt!439207 (tuple2!14995 lt!439208 zeroValue!1220)) lt!439210) (get!15640 (getValueByKey!517 (toList!6856 (+!3118 lt!439207 (tuple2!14995 lt!439208 zeroValue!1220))) lt!439210)))))

(declare-fun bs!28106 () Bool)

(assert (= bs!28106 d!117549))

(declare-fun m!917779 () Bool)

(assert (=> bs!28106 m!917779))

(assert (=> bs!28106 m!917779))

(declare-fun m!917781 () Bool)

(assert (=> bs!28106 m!917781))

(assert (=> b!990192 d!117549))

(assert (=> b!990053 d!117483))

(declare-fun d!117551 () Bool)

(declare-fun lt!439415 () Bool)

(assert (=> d!117551 (= lt!439415 (select (content!420 (toList!6856 lt!439111)) lt!439038))))

(declare-fun e!558510 () Bool)

(assert (=> d!117551 (= lt!439415 e!558510)))

(declare-fun res!662274 () Bool)

(assert (=> d!117551 (=> (not res!662274) (not e!558510))))

(assert (=> d!117551 (= res!662274 ((_ is Cons!20872) (toList!6856 lt!439111)))))

(assert (=> d!117551 (= (contains!5697 (toList!6856 lt!439111) lt!439038) lt!439415)))

(declare-fun b!990501 () Bool)

(declare-fun e!558509 () Bool)

(assert (=> b!990501 (= e!558510 e!558509)))

(declare-fun res!662275 () Bool)

(assert (=> b!990501 (=> res!662275 e!558509)))

(assert (=> b!990501 (= res!662275 (= (h!22034 (toList!6856 lt!439111)) lt!439038))))

(declare-fun b!990502 () Bool)

(assert (=> b!990502 (= e!558509 (contains!5697 (t!29840 (toList!6856 lt!439111)) lt!439038))))

(assert (= (and d!117551 res!662274) b!990501))

(assert (= (and b!990501 (not res!662275)) b!990502))

(declare-fun m!917783 () Bool)

(assert (=> d!117551 m!917783))

(declare-fun m!917785 () Bool)

(assert (=> d!117551 m!917785))

(declare-fun m!917787 () Bool)

(assert (=> b!990502 m!917787))

(assert (=> b!990118 d!117551))

(assert (=> b!990165 d!117421))

(declare-fun d!117553 () Bool)

(declare-fun isEmpty!732 (List!20876) Bool)

(assert (=> d!117553 (= (isEmpty!731 lt!439094) (isEmpty!732 (toList!6856 lt!439094)))))

(declare-fun bs!28107 () Bool)

(assert (= bs!28107 d!117553))

(declare-fun m!917789 () Bool)

(assert (=> bs!28107 m!917789))

(assert (=> b!990094 d!117553))

(declare-fun d!117555 () Bool)

(assert (=> d!117555 (= (apply!890 lt!439172 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15640 (getValueByKey!517 (toList!6856 lt!439172) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28108 () Bool)

(assert (= bs!28108 d!117555))

(assert (=> bs!28108 m!916989))

(declare-fun m!917791 () Bool)

(assert (=> bs!28108 m!917791))

(assert (=> bs!28108 m!917791))

(declare-fun m!917793 () Bool)

(assert (=> bs!28108 m!917793))

(assert (=> b!990182 d!117555))

(assert (=> b!990182 d!117465))

(assert (=> b!990109 d!117483))

(declare-fun d!117557 () Bool)

(assert (=> d!117557 (= (apply!890 lt!439094 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15640 (getValueByKey!517 (toList!6856 lt!439094) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28109 () Bool)

(assert (= bs!28109 d!117557))

(assert (=> bs!28109 m!916989))

(assert (=> bs!28109 m!917635))

(assert (=> bs!28109 m!917635))

(declare-fun m!917795 () Bool)

(assert (=> bs!28109 m!917795))

(assert (=> b!990096 d!117557))

(assert (=> b!990096 d!117465))

(declare-fun d!117559 () Bool)

(declare-fun lt!439416 () Bool)

(assert (=> d!117559 (= lt!439416 (select (content!420 (toList!6856 lt!439115)) lt!439039))))

(declare-fun e!558512 () Bool)

(assert (=> d!117559 (= lt!439416 e!558512)))

(declare-fun res!662276 () Bool)

(assert (=> d!117559 (=> (not res!662276) (not e!558512))))

(assert (=> d!117559 (= res!662276 ((_ is Cons!20872) (toList!6856 lt!439115)))))

(assert (=> d!117559 (= (contains!5697 (toList!6856 lt!439115) lt!439039) lt!439416)))

(declare-fun b!990503 () Bool)

(declare-fun e!558511 () Bool)

(assert (=> b!990503 (= e!558512 e!558511)))

(declare-fun res!662277 () Bool)

(assert (=> b!990503 (=> res!662277 e!558511)))

(assert (=> b!990503 (= res!662277 (= (h!22034 (toList!6856 lt!439115)) lt!439039))))

(declare-fun b!990504 () Bool)

(assert (=> b!990504 (= e!558511 (contains!5697 (t!29840 (toList!6856 lt!439115)) lt!439039))))

(assert (= (and d!117559 res!662276) b!990503))

(assert (= (and b!990503 (not res!662277)) b!990504))

(declare-fun m!917797 () Bool)

(assert (=> d!117559 m!917797))

(declare-fun m!917799 () Bool)

(assert (=> d!117559 m!917799))

(declare-fun m!917801 () Bool)

(assert (=> b!990504 m!917801))

(assert (=> b!990120 d!117559))

(declare-fun d!117561 () Bool)

(declare-fun lt!439417 () Bool)

(assert (=> d!117561 (= lt!439417 (select (content!420 (toList!6856 lt!439119)) lt!439039))))

(declare-fun e!558514 () Bool)

(assert (=> d!117561 (= lt!439417 e!558514)))

(declare-fun res!662278 () Bool)

(assert (=> d!117561 (=> (not res!662278) (not e!558514))))

(assert (=> d!117561 (= res!662278 ((_ is Cons!20872) (toList!6856 lt!439119)))))

(assert (=> d!117561 (= (contains!5697 (toList!6856 lt!439119) lt!439039) lt!439417)))

(declare-fun b!990505 () Bool)

(declare-fun e!558513 () Bool)

(assert (=> b!990505 (= e!558514 e!558513)))

(declare-fun res!662279 () Bool)

(assert (=> b!990505 (=> res!662279 e!558513)))

(assert (=> b!990505 (= res!662279 (= (h!22034 (toList!6856 lt!439119)) lt!439039))))

(declare-fun b!990506 () Bool)

(assert (=> b!990506 (= e!558513 (contains!5697 (t!29840 (toList!6856 lt!439119)) lt!439039))))

(assert (= (and d!117561 res!662278) b!990505))

(assert (= (and b!990505 (not res!662279)) b!990506))

(declare-fun m!917803 () Bool)

(assert (=> d!117561 m!917803))

(declare-fun m!917805 () Bool)

(assert (=> d!117561 m!917805))

(declare-fun m!917807 () Bool)

(assert (=> b!990506 m!917807))

(assert (=> b!990122 d!117561))

(declare-fun d!117563 () Bool)

(declare-fun e!558515 () Bool)

(assert (=> d!117563 e!558515))

(declare-fun res!662280 () Bool)

(assert (=> d!117563 (=> res!662280 e!558515)))

(declare-fun lt!439421 () Bool)

(assert (=> d!117563 (= res!662280 (not lt!439421))))

(declare-fun lt!439419 () Bool)

(assert (=> d!117563 (= lt!439421 lt!439419)))

(declare-fun lt!439420 () Unit!32729)

(declare-fun e!558516 () Unit!32729)

(assert (=> d!117563 (= lt!439420 e!558516)))

(declare-fun c!100460 () Bool)

(assert (=> d!117563 (= c!100460 lt!439419)))

(assert (=> d!117563 (= lt!439419 (containsKey!479 (toList!6856 lt!439172) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117563 (= (contains!5695 lt!439172 (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!439421)))

(declare-fun b!990507 () Bool)

(declare-fun lt!439418 () Unit!32729)

(assert (=> b!990507 (= e!558516 lt!439418)))

(assert (=> b!990507 (= lt!439418 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439172) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!990507 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439172) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!990508 () Bool)

(declare-fun Unit!32752 () Unit!32729)

(assert (=> b!990508 (= e!558516 Unit!32752)))

(declare-fun b!990509 () Bool)

(assert (=> b!990509 (= e!558515 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439172) (select (arr!30093 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117563 c!100460) b!990507))

(assert (= (and d!117563 (not c!100460)) b!990508))

(assert (= (and d!117563 (not res!662280)) b!990509))

(assert (=> d!117563 m!916989))

(declare-fun m!917809 () Bool)

(assert (=> d!117563 m!917809))

(assert (=> b!990507 m!916989))

(declare-fun m!917811 () Bool)

(assert (=> b!990507 m!917811))

(assert (=> b!990507 m!916989))

(assert (=> b!990507 m!917791))

(assert (=> b!990507 m!917791))

(declare-fun m!917813 () Bool)

(assert (=> b!990507 m!917813))

(assert (=> b!990509 m!916989))

(assert (=> b!990509 m!917791))

(assert (=> b!990509 m!917791))

(assert (=> b!990509 m!917813))

(assert (=> b!990168 d!117563))

(declare-fun d!117565 () Bool)

(assert (=> d!117565 (= (get!15638 (select (arr!30092 _values!1278) from!1932) (dynLambda!1865 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14266 (select (arr!30092 _values!1278) from!1932)))))

(assert (=> b!990060 d!117565))

(declare-fun d!117567 () Bool)

(assert (=> d!117567 (= (apply!890 lt!439194 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15640 (getValueByKey!517 (toList!6856 lt!439194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28110 () Bool)

(assert (= bs!28110 d!117567))

(assert (=> bs!28110 m!917469))

(assert (=> bs!28110 m!917469))

(declare-fun m!917815 () Bool)

(assert (=> bs!28110 m!917815))

(assert (=> b!990200 d!117567))

(declare-fun d!117569 () Bool)

(declare-fun lt!439424 () Bool)

(declare-fun content!421 (List!20877) (InoxSet (_ BitVec 64)))

(assert (=> d!117569 (= lt!439424 (select (content!421 Nil!20874) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!558521 () Bool)

(assert (=> d!117569 (= lt!439424 e!558521)))

(declare-fun res!662286 () Bool)

(assert (=> d!117569 (=> (not res!662286) (not e!558521))))

(assert (=> d!117569 (= res!662286 ((_ is Cons!20873) Nil!20874))))

(assert (=> d!117569 (= (contains!5696 Nil!20874 (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)) lt!439424)))

(declare-fun b!990514 () Bool)

(declare-fun e!558522 () Bool)

(assert (=> b!990514 (= e!558521 e!558522)))

(declare-fun res!662285 () Bool)

(assert (=> b!990514 (=> res!662285 e!558522)))

(assert (=> b!990514 (= res!662285 (= (h!22035 Nil!20874) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!990515 () Bool)

(assert (=> b!990515 (= e!558522 (contains!5696 (t!29841 Nil!20874) (select (arr!30093 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117569 res!662286) b!990514))

(assert (= (and b!990514 (not res!662285)) b!990515))

(declare-fun m!917817 () Bool)

(assert (=> d!117569 m!917817))

(assert (=> d!117569 m!916965))

(declare-fun m!917819 () Bool)

(assert (=> d!117569 m!917819))

(assert (=> b!990515 m!916965))

(declare-fun m!917821 () Bool)

(assert (=> b!990515 m!917821))

(assert (=> b!990111 d!117569))

(assert (=> bm!41939 d!117485))

(declare-fun d!117571 () Bool)

(declare-fun e!558523 () Bool)

(assert (=> d!117571 e!558523))

(declare-fun res!662288 () Bool)

(assert (=> d!117571 (=> (not res!662288) (not e!558523))))

(declare-fun lt!439428 () ListLongMap!13681)

(assert (=> d!117571 (= res!662288 (contains!5695 lt!439428 (_1!7508 (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!439426 () List!20876)

(assert (=> d!117571 (= lt!439428 (ListLongMap!13682 lt!439426))))

(declare-fun lt!439427 () Unit!32729)

(declare-fun lt!439425 () Unit!32729)

(assert (=> d!117571 (= lt!439427 lt!439425)))

(assert (=> d!117571 (= (getValueByKey!517 lt!439426 (_1!7508 (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!522 (_2!7508 (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117571 (= lt!439425 (lemmaContainsTupThenGetReturnValue!274 lt!439426 (_1!7508 (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7508 (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117571 (= lt!439426 (insertStrictlySorted!331 (toList!6856 (ite c!100369 call!41966 (ite c!100367 call!41965 call!41960))) (_1!7508 (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7508 (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117571 (= (+!3118 (ite c!100369 call!41966 (ite c!100367 call!41965 call!41960)) (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!439428)))

(declare-fun b!990516 () Bool)

(declare-fun res!662287 () Bool)

(assert (=> b!990516 (=> (not res!662287) (not e!558523))))

(assert (=> b!990516 (= res!662287 (= (getValueByKey!517 (toList!6856 lt!439428) (_1!7508 (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!522 (_2!7508 (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!990517 () Bool)

(assert (=> b!990517 (= e!558523 (contains!5697 (toList!6856 lt!439428) (ite (or c!100369 c!100367) (tuple2!14995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117571 res!662288) b!990516))

(assert (= (and b!990516 res!662287) b!990517))

(declare-fun m!917823 () Bool)

(assert (=> d!117571 m!917823))

(declare-fun m!917825 () Bool)

(assert (=> d!117571 m!917825))

(declare-fun m!917827 () Bool)

(assert (=> d!117571 m!917827))

(declare-fun m!917829 () Bool)

(assert (=> d!117571 m!917829))

(declare-fun m!917831 () Bool)

(assert (=> b!990516 m!917831))

(declare-fun m!917833 () Bool)

(assert (=> b!990517 m!917833))

(assert (=> bm!41963 d!117571))

(declare-fun d!117573 () Bool)

(declare-fun e!558524 () Bool)

(assert (=> d!117573 e!558524))

(declare-fun res!662289 () Bool)

(assert (=> d!117573 (=> res!662289 e!558524)))

(declare-fun lt!439432 () Bool)

(assert (=> d!117573 (= res!662289 (not lt!439432))))

(declare-fun lt!439430 () Bool)

(assert (=> d!117573 (= lt!439432 lt!439430)))

(declare-fun lt!439431 () Unit!32729)

(declare-fun e!558525 () Unit!32729)

(assert (=> d!117573 (= lt!439431 e!558525)))

(declare-fun c!100461 () Bool)

(assert (=> d!117573 (= c!100461 lt!439430)))

(assert (=> d!117573 (= lt!439430 (containsKey!479 (toList!6856 lt!439214) (_1!7508 lt!439038)))))

(assert (=> d!117573 (= (contains!5695 lt!439214 (_1!7508 lt!439038)) lt!439432)))

(declare-fun b!990518 () Bool)

(declare-fun lt!439429 () Unit!32729)

(assert (=> b!990518 (= e!558525 lt!439429)))

(assert (=> b!990518 (= lt!439429 (lemmaContainsKeyImpliesGetValueByKeyDefined!374 (toList!6856 lt!439214) (_1!7508 lt!439038)))))

(assert (=> b!990518 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439214) (_1!7508 lt!439038)))))

(declare-fun b!990519 () Bool)

(declare-fun Unit!32753 () Unit!32729)

(assert (=> b!990519 (= e!558525 Unit!32753)))

(declare-fun b!990520 () Bool)

(assert (=> b!990520 (= e!558524 (isDefined!387 (getValueByKey!517 (toList!6856 lt!439214) (_1!7508 lt!439038))))))

(assert (= (and d!117573 c!100461) b!990518))

(assert (= (and d!117573 (not c!100461)) b!990519))

(assert (= (and d!117573 (not res!662289)) b!990520))

(declare-fun m!917835 () Bool)

(assert (=> d!117573 m!917835))

(declare-fun m!917837 () Bool)

(assert (=> b!990518 m!917837))

(assert (=> b!990518 m!917161))

(assert (=> b!990518 m!917161))

(declare-fun m!917839 () Bool)

(assert (=> b!990518 m!917839))

(assert (=> b!990520 m!917161))

(assert (=> b!990520 m!917161))

(assert (=> b!990520 m!917839))

(assert (=> d!117371 d!117573))

(declare-fun b!990522 () Bool)

(declare-fun e!558526 () Option!523)

(declare-fun e!558527 () Option!523)

(assert (=> b!990522 (= e!558526 e!558527)))

(declare-fun c!100463 () Bool)

(assert (=> b!990522 (= c!100463 (and ((_ is Cons!20872) lt!439212) (not (= (_1!7508 (h!22034 lt!439212)) (_1!7508 lt!439038)))))))

(declare-fun b!990523 () Bool)

(assert (=> b!990523 (= e!558527 (getValueByKey!517 (t!29840 lt!439212) (_1!7508 lt!439038)))))

(declare-fun d!117575 () Bool)

(declare-fun c!100462 () Bool)

(assert (=> d!117575 (= c!100462 (and ((_ is Cons!20872) lt!439212) (= (_1!7508 (h!22034 lt!439212)) (_1!7508 lt!439038))))))

(assert (=> d!117575 (= (getValueByKey!517 lt!439212 (_1!7508 lt!439038)) e!558526)))

(declare-fun b!990521 () Bool)

(assert (=> b!990521 (= e!558526 (Some!522 (_2!7508 (h!22034 lt!439212))))))

(declare-fun b!990524 () Bool)

(assert (=> b!990524 (= e!558527 None!521)))

(assert (= (and d!117575 c!100462) b!990521))

(assert (= (and d!117575 (not c!100462)) b!990522))

(assert (= (and b!990522 c!100463) b!990523))

(assert (= (and b!990522 (not c!100463)) b!990524))

(declare-fun m!917841 () Bool)

(assert (=> b!990523 m!917841))

(assert (=> d!117371 d!117575))

(declare-fun d!117577 () Bool)

(assert (=> d!117577 (= (getValueByKey!517 lt!439212 (_1!7508 lt!439038)) (Some!522 (_2!7508 lt!439038)))))

(declare-fun lt!439433 () Unit!32729)

(assert (=> d!117577 (= lt!439433 (choose!1625 lt!439212 (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(declare-fun e!558528 () Bool)

(assert (=> d!117577 e!558528))

(declare-fun res!662290 () Bool)

(assert (=> d!117577 (=> (not res!662290) (not e!558528))))

(assert (=> d!117577 (= res!662290 (isStrictlySorted!513 lt!439212))))

(assert (=> d!117577 (= (lemmaContainsTupThenGetReturnValue!274 lt!439212 (_1!7508 lt!439038) (_2!7508 lt!439038)) lt!439433)))

(declare-fun b!990525 () Bool)

(declare-fun res!662291 () Bool)

(assert (=> b!990525 (=> (not res!662291) (not e!558528))))

(assert (=> b!990525 (= res!662291 (containsKey!479 lt!439212 (_1!7508 lt!439038)))))

(declare-fun b!990526 () Bool)

(assert (=> b!990526 (= e!558528 (contains!5697 lt!439212 (tuple2!14995 (_1!7508 lt!439038) (_2!7508 lt!439038))))))

(assert (= (and d!117577 res!662290) b!990525))

(assert (= (and b!990525 res!662291) b!990526))

(assert (=> d!117577 m!917155))

(declare-fun m!917843 () Bool)

(assert (=> d!117577 m!917843))

(declare-fun m!917845 () Bool)

(assert (=> d!117577 m!917845))

(declare-fun m!917847 () Bool)

(assert (=> b!990525 m!917847))

(declare-fun m!917849 () Bool)

(assert (=> b!990526 m!917849))

(assert (=> d!117371 d!117577))

(declare-fun b!990527 () Bool)

(declare-fun e!558531 () List!20876)

(declare-fun call!41998 () List!20876)

(assert (=> b!990527 (= e!558531 call!41998)))

(declare-fun b!990528 () Bool)

(declare-fun e!558530 () List!20876)

(declare-fun e!558529 () List!20876)

(assert (=> b!990528 (= e!558530 e!558529)))

(declare-fun c!100466 () Bool)

(assert (=> b!990528 (= c!100466 (and ((_ is Cons!20872) (toList!6856 lt!439037)) (= (_1!7508 (h!22034 (toList!6856 lt!439037))) (_1!7508 lt!439038))))))

(declare-fun b!990529 () Bool)

(declare-fun e!558533 () Bool)

(declare-fun lt!439434 () List!20876)

(assert (=> b!990529 (= e!558533 (contains!5697 lt!439434 (tuple2!14995 (_1!7508 lt!439038) (_2!7508 lt!439038))))))

(declare-fun b!990530 () Bool)

(declare-fun e!558532 () List!20876)

(assert (=> b!990530 (= e!558532 (insertStrictlySorted!331 (t!29840 (toList!6856 lt!439037)) (_1!7508 lt!439038) (_2!7508 lt!439038)))))

(declare-fun bm!41993 () Bool)

(declare-fun call!41997 () List!20876)

(assert (=> bm!41993 (= call!41998 call!41997)))

(declare-fun bm!41994 () Bool)

(declare-fun call!41996 () List!20876)

(assert (=> bm!41994 (= call!41997 call!41996)))

(declare-fun d!117579 () Bool)

(assert (=> d!117579 e!558533))

(declare-fun res!662293 () Bool)

(assert (=> d!117579 (=> (not res!662293) (not e!558533))))

(assert (=> d!117579 (= res!662293 (isStrictlySorted!513 lt!439434))))

(assert (=> d!117579 (= lt!439434 e!558530)))

(declare-fun c!100464 () Bool)

(assert (=> d!117579 (= c!100464 (and ((_ is Cons!20872) (toList!6856 lt!439037)) (bvslt (_1!7508 (h!22034 (toList!6856 lt!439037))) (_1!7508 lt!439038))))))

(assert (=> d!117579 (isStrictlySorted!513 (toList!6856 lt!439037))))

(assert (=> d!117579 (= (insertStrictlySorted!331 (toList!6856 lt!439037) (_1!7508 lt!439038) (_2!7508 lt!439038)) lt!439434)))

(declare-fun c!100467 () Bool)

(declare-fun b!990531 () Bool)

(assert (=> b!990531 (= e!558532 (ite c!100466 (t!29840 (toList!6856 lt!439037)) (ite c!100467 (Cons!20872 (h!22034 (toList!6856 lt!439037)) (t!29840 (toList!6856 lt!439037))) Nil!20873)))))

(declare-fun b!990532 () Bool)

(declare-fun res!662292 () Bool)

(assert (=> b!990532 (=> (not res!662292) (not e!558533))))

(assert (=> b!990532 (= res!662292 (containsKey!479 lt!439434 (_1!7508 lt!439038)))))

(declare-fun b!990533 () Bool)

(assert (=> b!990533 (= e!558531 call!41998)))

(declare-fun b!990534 () Bool)

(assert (=> b!990534 (= e!558529 call!41997)))

(declare-fun b!990535 () Bool)

(assert (=> b!990535 (= e!558530 call!41996)))

(declare-fun bm!41995 () Bool)

(assert (=> bm!41995 (= call!41996 ($colon$colon!557 e!558532 (ite c!100464 (h!22034 (toList!6856 lt!439037)) (tuple2!14995 (_1!7508 lt!439038) (_2!7508 lt!439038)))))))

(declare-fun c!100465 () Bool)

(assert (=> bm!41995 (= c!100465 c!100464)))

(declare-fun b!990536 () Bool)

(assert (=> b!990536 (= c!100467 (and ((_ is Cons!20872) (toList!6856 lt!439037)) (bvsgt (_1!7508 (h!22034 (toList!6856 lt!439037))) (_1!7508 lt!439038))))))

(assert (=> b!990536 (= e!558529 e!558531)))

(assert (= (and d!117579 c!100464) b!990535))

(assert (= (and d!117579 (not c!100464)) b!990528))

(assert (= (and b!990528 c!100466) b!990534))

(assert (= (and b!990528 (not c!100466)) b!990536))

(assert (= (and b!990536 c!100467) b!990527))

(assert (= (and b!990536 (not c!100467)) b!990533))

(assert (= (or b!990527 b!990533) bm!41993))

(assert (= (or b!990534 bm!41993) bm!41994))

(assert (= (or b!990535 bm!41994) bm!41995))

(assert (= (and bm!41995 c!100465) b!990530))

(assert (= (and bm!41995 (not c!100465)) b!990531))

(assert (= (and d!117579 res!662293) b!990532))

(assert (= (and b!990532 res!662292) b!990529))

(declare-fun m!917851 () Bool)

(assert (=> b!990529 m!917851))

(declare-fun m!917853 () Bool)

(assert (=> bm!41995 m!917853))

(declare-fun m!917855 () Bool)

(assert (=> b!990532 m!917855))

(declare-fun m!917857 () Bool)

(assert (=> d!117579 m!917857))

(assert (=> d!117579 m!917399))

(declare-fun m!917859 () Bool)

(assert (=> b!990530 m!917859))

(assert (=> d!117371 d!117579))

(declare-fun b!990538 () Bool)

(declare-fun e!558534 () Bool)

(assert (=> b!990538 (= e!558534 tp_is_empty!23293)))

(declare-fun condMapEmpty!36998 () Bool)

(declare-fun mapDefault!36998 () ValueCell!11165)

(assert (=> mapNonEmpty!36997 (= condMapEmpty!36998 (= mapRest!36997 ((as const (Array (_ BitVec 32) ValueCell!11165)) mapDefault!36998)))))

(declare-fun mapRes!36998 () Bool)

(assert (=> mapNonEmpty!36997 (= tp!70042 (and e!558534 mapRes!36998))))

(declare-fun mapIsEmpty!36998 () Bool)

(assert (=> mapIsEmpty!36998 mapRes!36998))

(declare-fun mapNonEmpty!36998 () Bool)

(declare-fun tp!70043 () Bool)

(declare-fun e!558535 () Bool)

(assert (=> mapNonEmpty!36998 (= mapRes!36998 (and tp!70043 e!558535))))

(declare-fun mapValue!36998 () ValueCell!11165)

(declare-fun mapKey!36998 () (_ BitVec 32))

(declare-fun mapRest!36998 () (Array (_ BitVec 32) ValueCell!11165))

(assert (=> mapNonEmpty!36998 (= mapRest!36997 (store mapRest!36998 mapKey!36998 mapValue!36998))))

(declare-fun b!990537 () Bool)

(assert (=> b!990537 (= e!558535 tp_is_empty!23293)))

(assert (= (and mapNonEmpty!36997 condMapEmpty!36998) mapIsEmpty!36998))

(assert (= (and mapNonEmpty!36997 (not condMapEmpty!36998)) mapNonEmpty!36998))

(assert (= (and mapNonEmpty!36998 ((_ is ValueCellFull!11165) mapValue!36998)) b!990537))

(assert (= (and mapNonEmpty!36997 ((_ is ValueCellFull!11165) mapDefault!36998)) b!990538))

(declare-fun m!917861 () Bool)

(assert (=> mapNonEmpty!36998 m!917861))

(declare-fun b_lambda!15171 () Bool)

(assert (= b_lambda!15167 (or (and start!84648 b_free!20077) b_lambda!15171)))

(declare-fun b_lambda!15173 () Bool)

(assert (= b_lambda!15169 (or (and start!84648 b_free!20077) b_lambda!15173)))

(declare-fun b_lambda!15175 () Bool)

(assert (= b_lambda!15163 (or (and start!84648 b_free!20077) b_lambda!15175)))

(declare-fun b_lambda!15177 () Bool)

(assert (= b_lambda!15165 (or (and start!84648 b_free!20077) b_lambda!15177)))

(check-sat (not d!117567) (not b!990431) (not b!990379) (not d!117569) (not b!990416) (not bm!41986) (not b_lambda!15177) (not d!117553) (not b!990491) (not b!990516) (not b!990390) (not b!990447) (not d!117383) (not b!990359) (not d!117563) (not b_lambda!15161) (not b!990525) (not b!990325) (not d!117549) (not b!990369) (not b!990286) (not b!990316) (not d!117379) (not d!117419) (not d!117457) (not b!990298) (not b!990353) b_and!32225 (not b!990238) (not d!117497) (not b_lambda!15157) (not d!117559) (not d!117447) (not d!117451) (not b!990453) (not b!990339) (not b!990271) (not b!990523) (not b!990526) (not b!990509) (not b!990493) (not b!990466) (not b!990341) (not b!990402) (not d!117503) (not b!990506) (not b!990336) (not d!117517) (not b!990520) (not d!117537) (not b!990354) (not b!990404) (not d!117403) (not d!117571) (not d!117521) (not d!117375) (not d!117429) (not d!117391) (not d!117511) (not b!990313) (not d!117481) (not b!990454) tp_is_empty!23293 (not b!990309) (not b!990530) (not d!117539) (not d!117493) (not d!117467) (not b!990244) (not b!990372) (not b!990323) (not b!990457) (not b!990269) (not b!990518) (not b!990268) (not b!990296) (not b!990456) (not b!990451) (not d!117399) (not d!117397) (not d!117411) (not d!117535) (not d!117423) (not d!117501) (not b!990400) (not d!117427) (not b!990459) (not bm!41992) (not b!990435) (not b!990406) (not d!117409) (not b!990504) (not b_lambda!15155) (not b!990282) (not b!990365) (not b!990277) (not b!990374) (not b!990276) (not b!990488) (not b!990408) (not b_lambda!15175) (not d!117533) (not b!990486) (not b_lambda!15171) (not b!990380) (not b!990308) (not b!990300) (not b!990342) (not b_next!20077) (not d!117477) (not d!117507) (not d!117395) (not b!990362) (not d!117417) (not d!117459) (not d!117547) (not d!117393) (not b!990515) (not b!990348) (not d!117453) (not d!117449) (not d!117527) (not d!117509) (not b!990387) (not b!990405) (not d!117407) (not b!990371) (not b!990434) (not b!990225) (not b!990361) (not d!117487) (not d!117485) (not b!990425) (not b!990280) (not d!117413) (not d!117491) (not d!117545) (not d!117573) (not bm!41995) (not b_lambda!15145) (not b!990376) (not d!117529) (not b!990293) (not b!990411) (not d!117579) (not bm!41989) (not b_lambda!15173) (not d!117405) (not d!117519) (not b!990322) (not b!990450) (not d!117541) (not b!990299) (not d!117523) (not b!990517) (not b!990532) (not d!117543) (not bm!41987) (not b!990285) (not d!117401) (not b!990311) (not b!990367) (not b!990346) (not b!990319) (not b!990497) (not b!990500) (not d!117433) (not d!117525) (not d!117531) (not b!990417) (not d!117461) (not b!990492) (not b!990332) (not b!990398) (not b!990227) (not b!990279) (not b!990278) (not d!117389) (not b!990418) (not b!990394) (not d!117513) (not b!990498) (not b!990413) (not b!990373) (not d!117463) (not b!990428) (not b!990529) (not d!117551) (not b!990430) (not b!990366) (not b!990507) (not d!117469) (not b!990318) (not d!117499) (not d!117455) (not d!117415) (not b!990345) (not d!117439) (not b!990499) (not bm!41983) (not d!117387) (not b!990502) (not b!990283) (not b!990419) (not b!990363) (not b!990284) (not b!990378) (not b!990377) (not b!990385) (not b!990334) (not b!990364) (not b!990310) (not bm!41988) (not b!990458) (not d!117555) (not d!117561) (not b!990304) (not d!117445) (not b!990489) (not b!990448) (not d!117381) (not bm!41979) (not d!117557) (not b!990484) (not b!990302) (not b!990487) (not b!990409) (not d!117437) (not mapNonEmpty!36998) (not b_lambda!15159) (not b!990368) (not b!990292) (not b!990437) (not b!990460) (not b!990422) (not b!990420) (not b!990423) (not d!117577) (not bm!41980) (not d!117385) (not b!990245) (not b!990307) (not d!117505))
(check-sat b_and!32225 (not b_next!20077))
