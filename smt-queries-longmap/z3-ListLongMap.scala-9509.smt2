; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112806 () Bool)

(assert start!112806)

(declare-fun b_free!31059 () Bool)

(declare-fun b_next!31059 () Bool)

(assert (=> start!112806 (= b_free!31059 (not b_next!31059))))

(declare-fun tp!108824 () Bool)

(declare-fun b_and!50065 () Bool)

(assert (=> start!112806 (= tp!108824 b_and!50065)))

(declare-fun mapNonEmpty!57138 () Bool)

(declare-fun mapRes!57138 () Bool)

(declare-fun tp!108825 () Bool)

(declare-fun e!761822 () Bool)

(assert (=> mapNonEmpty!57138 (= mapRes!57138 (and tp!108825 e!761822))))

(declare-datatypes ((V!54395 0))(
  ( (V!54396 (val!18559 Int)) )
))
(declare-datatypes ((ValueCell!17586 0))(
  ( (ValueCellFull!17586 (v!21203 V!54395)) (EmptyCell!17586) )
))
(declare-datatypes ((array!90796 0))(
  ( (array!90797 (arr!43861 (Array (_ BitVec 32) ValueCell!17586)) (size!44411 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90796)

(declare-fun mapKey!57138 () (_ BitVec 32))

(declare-fun mapValue!57138 () ValueCell!17586)

(declare-fun mapRest!57138 () (Array (_ BitVec 32) ValueCell!17586))

(assert (=> mapNonEmpty!57138 (= (arr!43861 _values!1320) (store mapRest!57138 mapKey!57138 mapValue!57138))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun b!1337941 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90798 0))(
  ( (array!90799 (arr!43862 (Array (_ BitVec 32) (_ BitVec 64))) (size!44412 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90798)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun e!761824 () Bool)

(declare-fun minValue!1262 () V!54395)

(declare-fun zeroValue!1262 () V!54395)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23942 0))(
  ( (tuple2!23943 (_1!11982 (_ BitVec 64)) (_2!11982 V!54395)) )
))
(declare-datatypes ((List!31083 0))(
  ( (Nil!31080) (Cons!31079 (h!32288 tuple2!23942) (t!45411 List!31083)) )
))
(declare-datatypes ((ListLongMap!21599 0))(
  ( (ListLongMap!21600 (toList!10815 List!31083)) )
))
(declare-fun contains!8984 (ListLongMap!21599 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5784 (array!90798 array!90796 (_ BitVec 32) (_ BitVec 32) V!54395 V!54395 (_ BitVec 32) Int) ListLongMap!21599)

(assert (=> b!1337941 (= e!761824 (not (contains!8984 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153)))))

(declare-fun lt!593354 () ListLongMap!21599)

(assert (=> b!1337941 (contains!8984 lt!593354 k0!1153)))

(declare-fun lt!593352 () V!54395)

(declare-datatypes ((Unit!43961 0))(
  ( (Unit!43962) )
))
(declare-fun lt!593353 () Unit!43961)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!325 ((_ BitVec 64) (_ BitVec 64) V!54395 ListLongMap!21599) Unit!43961)

(assert (=> b!1337941 (= lt!593353 (lemmaInListMapAfterAddingDiffThenInBefore!325 k0!1153 (select (arr!43862 _keys!1590) from!1980) lt!593352 lt!593354))))

(declare-fun b!1337942 () Bool)

(declare-fun res!887821 () Bool)

(assert (=> b!1337942 (=> (not res!887821) (not e!761824))))

(assert (=> b!1337942 (= res!887821 (not (= k0!1153 (select (arr!43862 _keys!1590) from!1980))))))

(declare-fun b!1337943 () Bool)

(declare-fun res!887818 () Bool)

(declare-fun e!761821 () Bool)

(assert (=> b!1337943 (=> (not res!887818) (not e!761821))))

(declare-datatypes ((List!31084 0))(
  ( (Nil!31081) (Cons!31080 (h!32289 (_ BitVec 64)) (t!45412 List!31084)) )
))
(declare-fun arrayNoDuplicates!0 (array!90798 (_ BitVec 32) List!31084) Bool)

(assert (=> b!1337943 (= res!887818 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31081))))

(declare-fun res!887820 () Bool)

(assert (=> start!112806 (=> (not res!887820) (not e!761821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112806 (= res!887820 (validMask!0 mask!1998))))

(assert (=> start!112806 e!761821))

(declare-fun e!761820 () Bool)

(declare-fun array_inv!33077 (array!90796) Bool)

(assert (=> start!112806 (and (array_inv!33077 _values!1320) e!761820)))

(assert (=> start!112806 true))

(declare-fun array_inv!33078 (array!90798) Bool)

(assert (=> start!112806 (array_inv!33078 _keys!1590)))

(assert (=> start!112806 tp!108824))

(declare-fun tp_is_empty!36969 () Bool)

(assert (=> start!112806 tp_is_empty!36969))

(declare-fun b!1337944 () Bool)

(declare-fun res!887823 () Bool)

(assert (=> b!1337944 (=> (not res!887823) (not e!761821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90798 (_ BitVec 32)) Bool)

(assert (=> b!1337944 (= res!887823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337945 () Bool)

(declare-fun res!887822 () Bool)

(assert (=> b!1337945 (=> (not res!887822) (not e!761821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337945 (= res!887822 (validKeyInArray!0 (select (arr!43862 _keys!1590) from!1980)))))

(declare-fun b!1337946 () Bool)

(declare-fun res!887819 () Bool)

(assert (=> b!1337946 (=> (not res!887819) (not e!761821))))

(assert (=> b!1337946 (= res!887819 (and (= (size!44411 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44412 _keys!1590) (size!44411 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337947 () Bool)

(declare-fun res!887824 () Bool)

(assert (=> b!1337947 (=> (not res!887824) (not e!761821))))

(assert (=> b!1337947 (= res!887824 (not (= (select (arr!43862 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1337948 () Bool)

(declare-fun res!887816 () Bool)

(assert (=> b!1337948 (=> (not res!887816) (not e!761821))))

(assert (=> b!1337948 (= res!887816 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1337949 () Bool)

(assert (=> b!1337949 (= e!761822 tp_is_empty!36969)))

(declare-fun b!1337950 () Bool)

(declare-fun res!887814 () Bool)

(assert (=> b!1337950 (=> (not res!887814) (not e!761821))))

(assert (=> b!1337950 (= res!887814 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44412 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1337951 () Bool)

(declare-fun e!761823 () Bool)

(assert (=> b!1337951 (= e!761820 (and e!761823 mapRes!57138))))

(declare-fun condMapEmpty!57138 () Bool)

(declare-fun mapDefault!57138 () ValueCell!17586)

(assert (=> b!1337951 (= condMapEmpty!57138 (= (arr!43861 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17586)) mapDefault!57138)))))

(declare-fun b!1337952 () Bool)

(declare-fun res!887815 () Bool)

(assert (=> b!1337952 (=> (not res!887815) (not e!761821))))

(assert (=> b!1337952 (= res!887815 (contains!8984 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1337953 () Bool)

(assert (=> b!1337953 (= e!761821 e!761824)))

(declare-fun res!887817 () Bool)

(assert (=> b!1337953 (=> (not res!887817) (not e!761824))))

(declare-fun +!4751 (ListLongMap!21599 tuple2!23942) ListLongMap!21599)

(assert (=> b!1337953 (= res!887817 (contains!8984 (+!4751 lt!593354 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6393 (array!90798 array!90796 (_ BitVec 32) (_ BitVec 32) V!54395 V!54395 (_ BitVec 32) Int) ListLongMap!21599)

(assert (=> b!1337953 (= lt!593354 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22141 (ValueCell!17586 V!54395) V!54395)

(declare-fun dynLambda!3690 (Int (_ BitVec 64)) V!54395)

(assert (=> b!1337953 (= lt!593352 (get!22141 (select (arr!43861 _values!1320) from!1980) (dynLambda!3690 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57138 () Bool)

(assert (=> mapIsEmpty!57138 mapRes!57138))

(declare-fun b!1337954 () Bool)

(assert (=> b!1337954 (= e!761823 tp_is_empty!36969)))

(assert (= (and start!112806 res!887820) b!1337946))

(assert (= (and b!1337946 res!887819) b!1337944))

(assert (= (and b!1337944 res!887823) b!1337943))

(assert (= (and b!1337943 res!887818) b!1337950))

(assert (= (and b!1337950 res!887814) b!1337952))

(assert (= (and b!1337952 res!887815) b!1337947))

(assert (= (and b!1337947 res!887824) b!1337945))

(assert (= (and b!1337945 res!887822) b!1337948))

(assert (= (and b!1337948 res!887816) b!1337953))

(assert (= (and b!1337953 res!887817) b!1337942))

(assert (= (and b!1337942 res!887821) b!1337941))

(assert (= (and b!1337951 condMapEmpty!57138) mapIsEmpty!57138))

(assert (= (and b!1337951 (not condMapEmpty!57138)) mapNonEmpty!57138))

(get-info :version)

(assert (= (and mapNonEmpty!57138 ((_ is ValueCellFull!17586) mapValue!57138)) b!1337949))

(assert (= (and b!1337951 ((_ is ValueCellFull!17586) mapDefault!57138)) b!1337954))

(assert (= start!112806 b!1337951))

(declare-fun b_lambda!24253 () Bool)

(assert (=> (not b_lambda!24253) (not b!1337953)))

(declare-fun t!45410 () Bool)

(declare-fun tb!12131 () Bool)

(assert (=> (and start!112806 (= defaultEntry!1323 defaultEntry!1323) t!45410) tb!12131))

(declare-fun result!25339 () Bool)

(assert (=> tb!12131 (= result!25339 tp_is_empty!36969)))

(assert (=> b!1337953 t!45410))

(declare-fun b_and!50067 () Bool)

(assert (= b_and!50065 (and (=> t!45410 result!25339) b_and!50067)))

(declare-fun m!1226077 () Bool)

(assert (=> b!1337953 m!1226077))

(declare-fun m!1226079 () Bool)

(assert (=> b!1337953 m!1226079))

(declare-fun m!1226081 () Bool)

(assert (=> b!1337953 m!1226081))

(declare-fun m!1226083 () Bool)

(assert (=> b!1337953 m!1226083))

(declare-fun m!1226085 () Bool)

(assert (=> b!1337953 m!1226085))

(assert (=> b!1337953 m!1226077))

(declare-fun m!1226087 () Bool)

(assert (=> b!1337953 m!1226087))

(assert (=> b!1337953 m!1226079))

(assert (=> b!1337953 m!1226083))

(declare-fun m!1226089 () Bool)

(assert (=> b!1337953 m!1226089))

(declare-fun m!1226091 () Bool)

(assert (=> b!1337944 m!1226091))

(assert (=> b!1337945 m!1226087))

(assert (=> b!1337945 m!1226087))

(declare-fun m!1226093 () Bool)

(assert (=> b!1337945 m!1226093))

(assert (=> b!1337942 m!1226087))

(declare-fun m!1226095 () Bool)

(assert (=> b!1337941 m!1226095))

(assert (=> b!1337941 m!1226087))

(declare-fun m!1226097 () Bool)

(assert (=> b!1337941 m!1226097))

(declare-fun m!1226099 () Bool)

(assert (=> b!1337941 m!1226099))

(assert (=> b!1337941 m!1226095))

(declare-fun m!1226101 () Bool)

(assert (=> b!1337941 m!1226101))

(assert (=> b!1337941 m!1226087))

(declare-fun m!1226103 () Bool)

(assert (=> start!112806 m!1226103))

(declare-fun m!1226105 () Bool)

(assert (=> start!112806 m!1226105))

(declare-fun m!1226107 () Bool)

(assert (=> start!112806 m!1226107))

(declare-fun m!1226109 () Bool)

(assert (=> b!1337943 m!1226109))

(assert (=> b!1337947 m!1226087))

(declare-fun m!1226111 () Bool)

(assert (=> mapNonEmpty!57138 m!1226111))

(declare-fun m!1226113 () Bool)

(assert (=> b!1337952 m!1226113))

(assert (=> b!1337952 m!1226113))

(declare-fun m!1226115 () Bool)

(assert (=> b!1337952 m!1226115))

(check-sat (not b_next!31059) (not b!1337941) (not b!1337953) (not start!112806) b_and!50067 (not b!1337945) (not b!1337944) (not b!1337943) (not b!1337952) tp_is_empty!36969 (not mapNonEmpty!57138) (not b_lambda!24253))
(check-sat b_and!50067 (not b_next!31059))
(get-model)

(declare-fun b_lambda!24257 () Bool)

(assert (= b_lambda!24253 (or (and start!112806 b_free!31059) b_lambda!24257)))

(check-sat (not b_next!31059) (not b!1337953) (not start!112806) b_and!50067 (not mapNonEmpty!57138) (not b!1337945) (not b_lambda!24257) (not b!1337941) (not b!1337944) (not b!1337943) (not b!1337952) tp_is_empty!36969)
(check-sat b_and!50067 (not b_next!31059))
(get-model)

(declare-fun d!143883 () Bool)

(declare-fun e!761849 () Bool)

(assert (=> d!143883 e!761849))

(declare-fun res!887860 () Bool)

(assert (=> d!143883 (=> res!887860 e!761849)))

(declare-fun lt!593373 () Bool)

(assert (=> d!143883 (= res!887860 (not lt!593373))))

(declare-fun lt!593374 () Bool)

(assert (=> d!143883 (= lt!593373 lt!593374)))

(declare-fun lt!593372 () Unit!43961)

(declare-fun e!761848 () Unit!43961)

(assert (=> d!143883 (= lt!593372 e!761848)))

(declare-fun c!126157 () Bool)

(assert (=> d!143883 (= c!126157 lt!593374)))

(declare-fun containsKey!740 (List!31083 (_ BitVec 64)) Bool)

(assert (=> d!143883 (= lt!593374 (containsKey!740 (toList!10815 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> d!143883 (= (contains!8984 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153) lt!593373)))

(declare-fun b!1338007 () Bool)

(declare-fun lt!593375 () Unit!43961)

(assert (=> b!1338007 (= e!761848 lt!593375)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!486 (List!31083 (_ BitVec 64)) Unit!43961)

(assert (=> b!1338007 (= lt!593375 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10815 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-datatypes ((Option!770 0))(
  ( (Some!769 (v!21205 V!54395)) (None!768) )
))
(declare-fun isDefined!525 (Option!770) Bool)

(declare-fun getValueByKey!718 (List!31083 (_ BitVec 64)) Option!770)

(assert (=> b!1338007 (isDefined!525 (getValueByKey!718 (toList!10815 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun b!1338008 () Bool)

(declare-fun Unit!43963 () Unit!43961)

(assert (=> b!1338008 (= e!761848 Unit!43963)))

(declare-fun b!1338009 () Bool)

(assert (=> b!1338009 (= e!761849 (isDefined!525 (getValueByKey!718 (toList!10815 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143883 c!126157) b!1338007))

(assert (= (and d!143883 (not c!126157)) b!1338008))

(assert (= (and d!143883 (not res!887860)) b!1338009))

(declare-fun m!1226157 () Bool)

(assert (=> d!143883 m!1226157))

(declare-fun m!1226159 () Bool)

(assert (=> b!1338007 m!1226159))

(declare-fun m!1226161 () Bool)

(assert (=> b!1338007 m!1226161))

(assert (=> b!1338007 m!1226161))

(declare-fun m!1226163 () Bool)

(assert (=> b!1338007 m!1226163))

(assert (=> b!1338009 m!1226161))

(assert (=> b!1338009 m!1226161))

(assert (=> b!1338009 m!1226163))

(assert (=> b!1337941 d!143883))

(declare-fun b!1338052 () Bool)

(declare-fun e!761876 () ListLongMap!21599)

(declare-fun call!64967 () ListLongMap!21599)

(assert (=> b!1338052 (= e!761876 call!64967)))

(declare-fun b!1338053 () Bool)

(declare-fun e!761887 () Bool)

(declare-fun lt!593434 () ListLongMap!21599)

(declare-fun apply!1035 (ListLongMap!21599 (_ BitVec 64)) V!54395)

(assert (=> b!1338053 (= e!761887 (= (apply!1035 lt!593434 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1338054 () Bool)

(declare-fun e!761881 () Bool)

(declare-fun e!761879 () Bool)

(assert (=> b!1338054 (= e!761881 e!761879)))

(declare-fun res!887886 () Bool)

(assert (=> b!1338054 (=> (not res!887886) (not e!761879))))

(assert (=> b!1338054 (= res!887886 (contains!8984 lt!593434 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338054 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)))))

(declare-fun b!1338055 () Bool)

(declare-fun res!887883 () Bool)

(declare-fun e!761886 () Bool)

(assert (=> b!1338055 (=> (not res!887883) (not e!761886))))

(assert (=> b!1338055 (= res!887883 e!761881)))

(declare-fun res!887880 () Bool)

(assert (=> b!1338055 (=> res!887880 e!761881)))

(declare-fun e!761880 () Bool)

(assert (=> b!1338055 (= res!887880 (not e!761880))))

(declare-fun res!887887 () Bool)

(assert (=> b!1338055 (=> (not res!887887) (not e!761880))))

(assert (=> b!1338055 (= res!887887 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)))))

(declare-fun b!1338056 () Bool)

(declare-fun e!761883 () Bool)

(declare-fun call!64966 () Bool)

(assert (=> b!1338056 (= e!761883 (not call!64966))))

(declare-fun bm!64960 () Bool)

(declare-fun call!64965 () Bool)

(assert (=> bm!64960 (= call!64965 (contains!8984 lt!593434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!64963 () ListLongMap!21599)

(declare-fun bm!64961 () Bool)

(assert (=> bm!64961 (= call!64963 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1338058 () Bool)

(declare-fun c!126173 () Bool)

(assert (=> b!1338058 (= c!126173 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!761878 () ListLongMap!21599)

(assert (=> b!1338058 (= e!761878 e!761876)))

(declare-fun b!1338059 () Bool)

(declare-fun e!761884 () Bool)

(assert (=> b!1338059 (= e!761884 e!761887)))

(declare-fun res!887884 () Bool)

(assert (=> b!1338059 (= res!887884 call!64965)))

(assert (=> b!1338059 (=> (not res!887884) (not e!761887))))

(declare-fun b!1338060 () Bool)

(assert (=> b!1338060 (= e!761884 (not call!64965))))

(declare-fun b!1338061 () Bool)

(assert (=> b!1338061 (= e!761879 (= (apply!1035 lt!593434 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22141 (select (arr!43861 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3690 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338061 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44411 _values!1320)))))

(assert (=> b!1338061 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)))))

(declare-fun b!1338062 () Bool)

(declare-fun call!64964 () ListLongMap!21599)

(assert (=> b!1338062 (= e!761878 call!64964)))

(declare-fun bm!64962 () Bool)

(declare-fun call!64968 () ListLongMap!21599)

(assert (=> bm!64962 (= call!64964 call!64968)))

(declare-fun b!1338063 () Bool)

(declare-fun e!761885 () ListLongMap!21599)

(assert (=> b!1338063 (= e!761885 e!761878)))

(declare-fun c!126170 () Bool)

(assert (=> b!1338063 (= c!126170 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!64969 () ListLongMap!21599)

(declare-fun c!126172 () Bool)

(declare-fun bm!64963 () Bool)

(assert (=> bm!64963 (= call!64968 (+!4751 (ite c!126172 call!64963 (ite c!126170 call!64969 call!64967)) (ite (or c!126172 c!126170) (tuple2!23943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1338064 () Bool)

(declare-fun e!761877 () Unit!43961)

(declare-fun lt!593422 () Unit!43961)

(assert (=> b!1338064 (= e!761877 lt!593422)))

(declare-fun lt!593427 () ListLongMap!21599)

(assert (=> b!1338064 (= lt!593427 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593440 () (_ BitVec 64))

(assert (=> b!1338064 (= lt!593440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593439 () (_ BitVec 64))

(assert (=> b!1338064 (= lt!593439 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593425 () Unit!43961)

(declare-fun addStillContains!1191 (ListLongMap!21599 (_ BitVec 64) V!54395 (_ BitVec 64)) Unit!43961)

(assert (=> b!1338064 (= lt!593425 (addStillContains!1191 lt!593427 lt!593440 zeroValue!1262 lt!593439))))

(assert (=> b!1338064 (contains!8984 (+!4751 lt!593427 (tuple2!23943 lt!593440 zeroValue!1262)) lt!593439)))

(declare-fun lt!593421 () Unit!43961)

(assert (=> b!1338064 (= lt!593421 lt!593425)))

(declare-fun lt!593436 () ListLongMap!21599)

(assert (=> b!1338064 (= lt!593436 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593428 () (_ BitVec 64))

(assert (=> b!1338064 (= lt!593428 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593435 () (_ BitVec 64))

(assert (=> b!1338064 (= lt!593435 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593437 () Unit!43961)

(declare-fun addApplyDifferent!577 (ListLongMap!21599 (_ BitVec 64) V!54395 (_ BitVec 64)) Unit!43961)

(assert (=> b!1338064 (= lt!593437 (addApplyDifferent!577 lt!593436 lt!593428 minValue!1262 lt!593435))))

(assert (=> b!1338064 (= (apply!1035 (+!4751 lt!593436 (tuple2!23943 lt!593428 minValue!1262)) lt!593435) (apply!1035 lt!593436 lt!593435))))

(declare-fun lt!593438 () Unit!43961)

(assert (=> b!1338064 (= lt!593438 lt!593437)))

(declare-fun lt!593420 () ListLongMap!21599)

(assert (=> b!1338064 (= lt!593420 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593430 () (_ BitVec 64))

(assert (=> b!1338064 (= lt!593430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593433 () (_ BitVec 64))

(assert (=> b!1338064 (= lt!593433 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593429 () Unit!43961)

(assert (=> b!1338064 (= lt!593429 (addApplyDifferent!577 lt!593420 lt!593430 zeroValue!1262 lt!593433))))

(assert (=> b!1338064 (= (apply!1035 (+!4751 lt!593420 (tuple2!23943 lt!593430 zeroValue!1262)) lt!593433) (apply!1035 lt!593420 lt!593433))))

(declare-fun lt!593423 () Unit!43961)

(assert (=> b!1338064 (= lt!593423 lt!593429)))

(declare-fun lt!593426 () ListLongMap!21599)

(assert (=> b!1338064 (= lt!593426 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593432 () (_ BitVec 64))

(assert (=> b!1338064 (= lt!593432 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593431 () (_ BitVec 64))

(assert (=> b!1338064 (= lt!593431 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338064 (= lt!593422 (addApplyDifferent!577 lt!593426 lt!593432 minValue!1262 lt!593431))))

(assert (=> b!1338064 (= (apply!1035 (+!4751 lt!593426 (tuple2!23943 lt!593432 minValue!1262)) lt!593431) (apply!1035 lt!593426 lt!593431))))

(declare-fun b!1338065 () Bool)

(declare-fun res!887879 () Bool)

(assert (=> b!1338065 (=> (not res!887879) (not e!761886))))

(assert (=> b!1338065 (= res!887879 e!761884)))

(declare-fun c!126174 () Bool)

(assert (=> b!1338065 (= c!126174 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1338057 () Bool)

(declare-fun e!761888 () Bool)

(assert (=> b!1338057 (= e!761888 (validKeyInArray!0 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun d!143885 () Bool)

(assert (=> d!143885 e!761886))

(declare-fun res!887885 () Bool)

(assert (=> d!143885 (=> (not res!887885) (not e!761886))))

(assert (=> d!143885 (= res!887885 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)))))))

(declare-fun lt!593424 () ListLongMap!21599)

(assert (=> d!143885 (= lt!593434 lt!593424)))

(declare-fun lt!593441 () Unit!43961)

(assert (=> d!143885 (= lt!593441 e!761877)))

(declare-fun c!126171 () Bool)

(assert (=> d!143885 (= c!126171 e!761888)))

(declare-fun res!887881 () Bool)

(assert (=> d!143885 (=> (not res!887881) (not e!761888))))

(assert (=> d!143885 (= res!887881 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)))))

(assert (=> d!143885 (= lt!593424 e!761885)))

(assert (=> d!143885 (= c!126172 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143885 (validMask!0 mask!1998)))

(assert (=> d!143885 (= (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593434)))

(declare-fun bm!64964 () Bool)

(assert (=> bm!64964 (= call!64967 call!64969)))

(declare-fun b!1338066 () Bool)

(assert (=> b!1338066 (= e!761885 (+!4751 call!64968 (tuple2!23943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun bm!64965 () Bool)

(assert (=> bm!64965 (= call!64966 (contains!8984 lt!593434 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338067 () Bool)

(assert (=> b!1338067 (= e!761876 call!64964)))

(declare-fun bm!64966 () Bool)

(assert (=> bm!64966 (= call!64969 call!64963)))

(declare-fun b!1338068 () Bool)

(declare-fun Unit!43964 () Unit!43961)

(assert (=> b!1338068 (= e!761877 Unit!43964)))

(declare-fun b!1338069 () Bool)

(declare-fun e!761882 () Bool)

(assert (=> b!1338069 (= e!761882 (= (apply!1035 lt!593434 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1338070 () Bool)

(assert (=> b!1338070 (= e!761880 (validKeyInArray!0 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338071 () Bool)

(assert (=> b!1338071 (= e!761886 e!761883)))

(declare-fun c!126175 () Bool)

(assert (=> b!1338071 (= c!126175 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338072 () Bool)

(assert (=> b!1338072 (= e!761883 e!761882)))

(declare-fun res!887882 () Bool)

(assert (=> b!1338072 (= res!887882 call!64966)))

(assert (=> b!1338072 (=> (not res!887882) (not e!761882))))

(assert (= (and d!143885 c!126172) b!1338066))

(assert (= (and d!143885 (not c!126172)) b!1338063))

(assert (= (and b!1338063 c!126170) b!1338062))

(assert (= (and b!1338063 (not c!126170)) b!1338058))

(assert (= (and b!1338058 c!126173) b!1338067))

(assert (= (and b!1338058 (not c!126173)) b!1338052))

(assert (= (or b!1338067 b!1338052) bm!64964))

(assert (= (or b!1338062 bm!64964) bm!64966))

(assert (= (or b!1338062 b!1338067) bm!64962))

(assert (= (or b!1338066 bm!64966) bm!64961))

(assert (= (or b!1338066 bm!64962) bm!64963))

(assert (= (and d!143885 res!887881) b!1338057))

(assert (= (and d!143885 c!126171) b!1338064))

(assert (= (and d!143885 (not c!126171)) b!1338068))

(assert (= (and d!143885 res!887885) b!1338055))

(assert (= (and b!1338055 res!887887) b!1338070))

(assert (= (and b!1338055 (not res!887880)) b!1338054))

(assert (= (and b!1338054 res!887886) b!1338061))

(assert (= (and b!1338055 res!887883) b!1338065))

(assert (= (and b!1338065 c!126174) b!1338059))

(assert (= (and b!1338065 (not c!126174)) b!1338060))

(assert (= (and b!1338059 res!887884) b!1338053))

(assert (= (or b!1338059 b!1338060) bm!64960))

(assert (= (and b!1338065 res!887879) b!1338071))

(assert (= (and b!1338071 c!126175) b!1338072))

(assert (= (and b!1338071 (not c!126175)) b!1338056))

(assert (= (and b!1338072 res!887882) b!1338069))

(assert (= (or b!1338072 b!1338056) bm!64965))

(declare-fun b_lambda!24259 () Bool)

(assert (=> (not b_lambda!24259) (not b!1338061)))

(assert (=> b!1338061 t!45410))

(declare-fun b_and!50073 () Bool)

(assert (= b_and!50067 (and (=> t!45410 result!25339) b_and!50073)))

(declare-fun m!1226165 () Bool)

(assert (=> b!1338057 m!1226165))

(assert (=> b!1338057 m!1226165))

(declare-fun m!1226167 () Bool)

(assert (=> b!1338057 m!1226167))

(declare-fun m!1226169 () Bool)

(assert (=> b!1338053 m!1226169))

(assert (=> d!143885 m!1226103))

(declare-fun m!1226171 () Bool)

(assert (=> b!1338069 m!1226171))

(assert (=> b!1338061 m!1226165))

(declare-fun m!1226173 () Bool)

(assert (=> b!1338061 m!1226173))

(assert (=> b!1338061 m!1226079))

(assert (=> b!1338061 m!1226165))

(declare-fun m!1226175 () Bool)

(assert (=> b!1338061 m!1226175))

(assert (=> b!1338061 m!1226173))

(assert (=> b!1338061 m!1226079))

(declare-fun m!1226177 () Bool)

(assert (=> b!1338061 m!1226177))

(assert (=> bm!64961 m!1226085))

(declare-fun m!1226179 () Bool)

(assert (=> bm!64960 m!1226179))

(declare-fun m!1226181 () Bool)

(assert (=> bm!64963 m!1226181))

(assert (=> b!1338054 m!1226165))

(assert (=> b!1338054 m!1226165))

(declare-fun m!1226183 () Bool)

(assert (=> b!1338054 m!1226183))

(declare-fun m!1226185 () Bool)

(assert (=> b!1338064 m!1226185))

(declare-fun m!1226187 () Bool)

(assert (=> b!1338064 m!1226187))

(declare-fun m!1226189 () Bool)

(assert (=> b!1338064 m!1226189))

(assert (=> b!1338064 m!1226165))

(declare-fun m!1226191 () Bool)

(assert (=> b!1338064 m!1226191))

(declare-fun m!1226193 () Bool)

(assert (=> b!1338064 m!1226193))

(declare-fun m!1226195 () Bool)

(assert (=> b!1338064 m!1226195))

(declare-fun m!1226197 () Bool)

(assert (=> b!1338064 m!1226197))

(declare-fun m!1226199 () Bool)

(assert (=> b!1338064 m!1226199))

(assert (=> b!1338064 m!1226199))

(declare-fun m!1226201 () Bool)

(assert (=> b!1338064 m!1226201))

(declare-fun m!1226203 () Bool)

(assert (=> b!1338064 m!1226203))

(assert (=> b!1338064 m!1226187))

(declare-fun m!1226205 () Bool)

(assert (=> b!1338064 m!1226205))

(declare-fun m!1226207 () Bool)

(assert (=> b!1338064 m!1226207))

(assert (=> b!1338064 m!1226193))

(declare-fun m!1226209 () Bool)

(assert (=> b!1338064 m!1226209))

(assert (=> b!1338064 m!1226085))

(declare-fun m!1226211 () Bool)

(assert (=> b!1338064 m!1226211))

(assert (=> b!1338064 m!1226195))

(declare-fun m!1226213 () Bool)

(assert (=> b!1338064 m!1226213))

(assert (=> b!1338070 m!1226165))

(assert (=> b!1338070 m!1226165))

(assert (=> b!1338070 m!1226167))

(declare-fun m!1226215 () Bool)

(assert (=> b!1338066 m!1226215))

(declare-fun m!1226217 () Bool)

(assert (=> bm!64965 m!1226217))

(assert (=> b!1337941 d!143885))

(declare-fun d!143887 () Bool)

(declare-fun e!761890 () Bool)

(assert (=> d!143887 e!761890))

(declare-fun res!887888 () Bool)

(assert (=> d!143887 (=> res!887888 e!761890)))

(declare-fun lt!593443 () Bool)

(assert (=> d!143887 (= res!887888 (not lt!593443))))

(declare-fun lt!593444 () Bool)

(assert (=> d!143887 (= lt!593443 lt!593444)))

(declare-fun lt!593442 () Unit!43961)

(declare-fun e!761889 () Unit!43961)

(assert (=> d!143887 (= lt!593442 e!761889)))

(declare-fun c!126176 () Bool)

(assert (=> d!143887 (= c!126176 lt!593444)))

(assert (=> d!143887 (= lt!593444 (containsKey!740 (toList!10815 lt!593354) k0!1153))))

(assert (=> d!143887 (= (contains!8984 lt!593354 k0!1153) lt!593443)))

(declare-fun b!1338073 () Bool)

(declare-fun lt!593445 () Unit!43961)

(assert (=> b!1338073 (= e!761889 lt!593445)))

(assert (=> b!1338073 (= lt!593445 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10815 lt!593354) k0!1153))))

(assert (=> b!1338073 (isDefined!525 (getValueByKey!718 (toList!10815 lt!593354) k0!1153))))

(declare-fun b!1338074 () Bool)

(declare-fun Unit!43965 () Unit!43961)

(assert (=> b!1338074 (= e!761889 Unit!43965)))

(declare-fun b!1338075 () Bool)

(assert (=> b!1338075 (= e!761890 (isDefined!525 (getValueByKey!718 (toList!10815 lt!593354) k0!1153)))))

(assert (= (and d!143887 c!126176) b!1338073))

(assert (= (and d!143887 (not c!126176)) b!1338074))

(assert (= (and d!143887 (not res!887888)) b!1338075))

(declare-fun m!1226219 () Bool)

(assert (=> d!143887 m!1226219))

(declare-fun m!1226221 () Bool)

(assert (=> b!1338073 m!1226221))

(declare-fun m!1226223 () Bool)

(assert (=> b!1338073 m!1226223))

(assert (=> b!1338073 m!1226223))

(declare-fun m!1226225 () Bool)

(assert (=> b!1338073 m!1226225))

(assert (=> b!1338075 m!1226223))

(assert (=> b!1338075 m!1226223))

(assert (=> b!1338075 m!1226225))

(assert (=> b!1337941 d!143887))

(declare-fun d!143889 () Bool)

(assert (=> d!143889 (contains!8984 lt!593354 k0!1153)))

(declare-fun lt!593448 () Unit!43961)

(declare-fun choose!1967 ((_ BitVec 64) (_ BitVec 64) V!54395 ListLongMap!21599) Unit!43961)

(assert (=> d!143889 (= lt!593448 (choose!1967 k0!1153 (select (arr!43862 _keys!1590) from!1980) lt!593352 lt!593354))))

(assert (=> d!143889 (contains!8984 (+!4751 lt!593354 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352)) k0!1153)))

(assert (=> d!143889 (= (lemmaInListMapAfterAddingDiffThenInBefore!325 k0!1153 (select (arr!43862 _keys!1590) from!1980) lt!593352 lt!593354) lt!593448)))

(declare-fun bs!38316 () Bool)

(assert (= bs!38316 d!143889))

(assert (=> bs!38316 m!1226099))

(assert (=> bs!38316 m!1226087))

(declare-fun m!1226227 () Bool)

(assert (=> bs!38316 m!1226227))

(assert (=> bs!38316 m!1226083))

(assert (=> bs!38316 m!1226083))

(assert (=> bs!38316 m!1226089))

(assert (=> b!1337941 d!143889))

(declare-fun d!143891 () Bool)

(declare-fun e!761892 () Bool)

(assert (=> d!143891 e!761892))

(declare-fun res!887889 () Bool)

(assert (=> d!143891 (=> res!887889 e!761892)))

(declare-fun lt!593450 () Bool)

(assert (=> d!143891 (= res!887889 (not lt!593450))))

(declare-fun lt!593451 () Bool)

(assert (=> d!143891 (= lt!593450 lt!593451)))

(declare-fun lt!593449 () Unit!43961)

(declare-fun e!761891 () Unit!43961)

(assert (=> d!143891 (= lt!593449 e!761891)))

(declare-fun c!126177 () Bool)

(assert (=> d!143891 (= c!126177 lt!593451)))

(assert (=> d!143891 (= lt!593451 (containsKey!740 (toList!10815 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143891 (= (contains!8984 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!593450)))

(declare-fun b!1338076 () Bool)

(declare-fun lt!593452 () Unit!43961)

(assert (=> b!1338076 (= e!761891 lt!593452)))

(assert (=> b!1338076 (= lt!593452 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10815 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1338076 (isDefined!525 (getValueByKey!718 (toList!10815 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1338077 () Bool)

(declare-fun Unit!43966 () Unit!43961)

(assert (=> b!1338077 (= e!761891 Unit!43966)))

(declare-fun b!1338078 () Bool)

(assert (=> b!1338078 (= e!761892 (isDefined!525 (getValueByKey!718 (toList!10815 (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143891 c!126177) b!1338076))

(assert (= (and d!143891 (not c!126177)) b!1338077))

(assert (= (and d!143891 (not res!887889)) b!1338078))

(declare-fun m!1226229 () Bool)

(assert (=> d!143891 m!1226229))

(declare-fun m!1226231 () Bool)

(assert (=> b!1338076 m!1226231))

(declare-fun m!1226233 () Bool)

(assert (=> b!1338076 m!1226233))

(assert (=> b!1338076 m!1226233))

(declare-fun m!1226235 () Bool)

(assert (=> b!1338076 m!1226235))

(assert (=> b!1338078 m!1226233))

(assert (=> b!1338078 m!1226233))

(assert (=> b!1338078 m!1226235))

(assert (=> b!1337952 d!143891))

(declare-fun b!1338079 () Bool)

(declare-fun e!761893 () ListLongMap!21599)

(declare-fun call!64974 () ListLongMap!21599)

(assert (=> b!1338079 (= e!761893 call!64974)))

(declare-fun b!1338080 () Bool)

(declare-fun e!761904 () Bool)

(declare-fun lt!593467 () ListLongMap!21599)

(assert (=> b!1338080 (= e!761904 (= (apply!1035 lt!593467 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1338081 () Bool)

(declare-fun e!761898 () Bool)

(declare-fun e!761896 () Bool)

(assert (=> b!1338081 (= e!761898 e!761896)))

(declare-fun res!887897 () Bool)

(assert (=> b!1338081 (=> (not res!887897) (not e!761896))))

(assert (=> b!1338081 (= res!887897 (contains!8984 lt!593467 (select (arr!43862 _keys!1590) from!1980)))))

(assert (=> b!1338081 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44412 _keys!1590)))))

(declare-fun b!1338082 () Bool)

(declare-fun res!887894 () Bool)

(declare-fun e!761903 () Bool)

(assert (=> b!1338082 (=> (not res!887894) (not e!761903))))

(assert (=> b!1338082 (= res!887894 e!761898)))

(declare-fun res!887891 () Bool)

(assert (=> b!1338082 (=> res!887891 e!761898)))

(declare-fun e!761897 () Bool)

(assert (=> b!1338082 (= res!887891 (not e!761897))))

(declare-fun res!887898 () Bool)

(assert (=> b!1338082 (=> (not res!887898) (not e!761897))))

(assert (=> b!1338082 (= res!887898 (bvslt from!1980 (size!44412 _keys!1590)))))

(declare-fun b!1338083 () Bool)

(declare-fun e!761900 () Bool)

(declare-fun call!64973 () Bool)

(assert (=> b!1338083 (= e!761900 (not call!64973))))

(declare-fun bm!64967 () Bool)

(declare-fun call!64972 () Bool)

(assert (=> bm!64967 (= call!64972 (contains!8984 lt!593467 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!64970 () ListLongMap!21599)

(declare-fun bm!64968 () Bool)

(assert (=> bm!64968 (= call!64970 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1338085 () Bool)

(declare-fun c!126181 () Bool)

(assert (=> b!1338085 (= c!126181 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!761895 () ListLongMap!21599)

(assert (=> b!1338085 (= e!761895 e!761893)))

(declare-fun b!1338086 () Bool)

(declare-fun e!761901 () Bool)

(assert (=> b!1338086 (= e!761901 e!761904)))

(declare-fun res!887895 () Bool)

(assert (=> b!1338086 (= res!887895 call!64972)))

(assert (=> b!1338086 (=> (not res!887895) (not e!761904))))

(declare-fun b!1338087 () Bool)

(assert (=> b!1338087 (= e!761901 (not call!64972))))

(declare-fun b!1338088 () Bool)

(assert (=> b!1338088 (= e!761896 (= (apply!1035 lt!593467 (select (arr!43862 _keys!1590) from!1980)) (get!22141 (select (arr!43861 _values!1320) from!1980) (dynLambda!3690 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1338088 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44411 _values!1320)))))

(assert (=> b!1338088 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44412 _keys!1590)))))

(declare-fun b!1338089 () Bool)

(declare-fun call!64971 () ListLongMap!21599)

(assert (=> b!1338089 (= e!761895 call!64971)))

(declare-fun bm!64969 () Bool)

(declare-fun call!64975 () ListLongMap!21599)

(assert (=> bm!64969 (= call!64971 call!64975)))

(declare-fun b!1338090 () Bool)

(declare-fun e!761902 () ListLongMap!21599)

(assert (=> b!1338090 (= e!761902 e!761895)))

(declare-fun c!126178 () Bool)

(assert (=> b!1338090 (= c!126178 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64970 () Bool)

(declare-fun c!126180 () Bool)

(declare-fun call!64976 () ListLongMap!21599)

(assert (=> bm!64970 (= call!64975 (+!4751 (ite c!126180 call!64970 (ite c!126178 call!64976 call!64974)) (ite (or c!126180 c!126178) (tuple2!23943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1338091 () Bool)

(declare-fun e!761894 () Unit!43961)

(declare-fun lt!593455 () Unit!43961)

(assert (=> b!1338091 (= e!761894 lt!593455)))

(declare-fun lt!593460 () ListLongMap!21599)

(assert (=> b!1338091 (= lt!593460 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593473 () (_ BitVec 64))

(assert (=> b!1338091 (= lt!593473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593472 () (_ BitVec 64))

(assert (=> b!1338091 (= lt!593472 (select (arr!43862 _keys!1590) from!1980))))

(declare-fun lt!593458 () Unit!43961)

(assert (=> b!1338091 (= lt!593458 (addStillContains!1191 lt!593460 lt!593473 zeroValue!1262 lt!593472))))

(assert (=> b!1338091 (contains!8984 (+!4751 lt!593460 (tuple2!23943 lt!593473 zeroValue!1262)) lt!593472)))

(declare-fun lt!593454 () Unit!43961)

(assert (=> b!1338091 (= lt!593454 lt!593458)))

(declare-fun lt!593469 () ListLongMap!21599)

(assert (=> b!1338091 (= lt!593469 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593461 () (_ BitVec 64))

(assert (=> b!1338091 (= lt!593461 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593468 () (_ BitVec 64))

(assert (=> b!1338091 (= lt!593468 (select (arr!43862 _keys!1590) from!1980))))

(declare-fun lt!593470 () Unit!43961)

(assert (=> b!1338091 (= lt!593470 (addApplyDifferent!577 lt!593469 lt!593461 minValue!1262 lt!593468))))

(assert (=> b!1338091 (= (apply!1035 (+!4751 lt!593469 (tuple2!23943 lt!593461 minValue!1262)) lt!593468) (apply!1035 lt!593469 lt!593468))))

(declare-fun lt!593471 () Unit!43961)

(assert (=> b!1338091 (= lt!593471 lt!593470)))

(declare-fun lt!593453 () ListLongMap!21599)

(assert (=> b!1338091 (= lt!593453 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593463 () (_ BitVec 64))

(assert (=> b!1338091 (= lt!593463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593466 () (_ BitVec 64))

(assert (=> b!1338091 (= lt!593466 (select (arr!43862 _keys!1590) from!1980))))

(declare-fun lt!593462 () Unit!43961)

(assert (=> b!1338091 (= lt!593462 (addApplyDifferent!577 lt!593453 lt!593463 zeroValue!1262 lt!593466))))

(assert (=> b!1338091 (= (apply!1035 (+!4751 lt!593453 (tuple2!23943 lt!593463 zeroValue!1262)) lt!593466) (apply!1035 lt!593453 lt!593466))))

(declare-fun lt!593456 () Unit!43961)

(assert (=> b!1338091 (= lt!593456 lt!593462)))

(declare-fun lt!593459 () ListLongMap!21599)

(assert (=> b!1338091 (= lt!593459 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593465 () (_ BitVec 64))

(assert (=> b!1338091 (= lt!593465 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593464 () (_ BitVec 64))

(assert (=> b!1338091 (= lt!593464 (select (arr!43862 _keys!1590) from!1980))))

(assert (=> b!1338091 (= lt!593455 (addApplyDifferent!577 lt!593459 lt!593465 minValue!1262 lt!593464))))

(assert (=> b!1338091 (= (apply!1035 (+!4751 lt!593459 (tuple2!23943 lt!593465 minValue!1262)) lt!593464) (apply!1035 lt!593459 lt!593464))))

(declare-fun b!1338092 () Bool)

(declare-fun res!887890 () Bool)

(assert (=> b!1338092 (=> (not res!887890) (not e!761903))))

(assert (=> b!1338092 (= res!887890 e!761901)))

(declare-fun c!126182 () Bool)

(assert (=> b!1338092 (= c!126182 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1338084 () Bool)

(declare-fun e!761905 () Bool)

(assert (=> b!1338084 (= e!761905 (validKeyInArray!0 (select (arr!43862 _keys!1590) from!1980)))))

(declare-fun d!143893 () Bool)

(assert (=> d!143893 e!761903))

(declare-fun res!887896 () Bool)

(assert (=> d!143893 (=> (not res!887896) (not e!761903))))

(assert (=> d!143893 (= res!887896 (or (bvsge from!1980 (size!44412 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44412 _keys!1590)))))))

(declare-fun lt!593457 () ListLongMap!21599)

(assert (=> d!143893 (= lt!593467 lt!593457)))

(declare-fun lt!593474 () Unit!43961)

(assert (=> d!143893 (= lt!593474 e!761894)))

(declare-fun c!126179 () Bool)

(assert (=> d!143893 (= c!126179 e!761905)))

(declare-fun res!887892 () Bool)

(assert (=> d!143893 (=> (not res!887892) (not e!761905))))

(assert (=> d!143893 (= res!887892 (bvslt from!1980 (size!44412 _keys!1590)))))

(assert (=> d!143893 (= lt!593457 e!761902)))

(assert (=> d!143893 (= c!126180 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143893 (validMask!0 mask!1998)))

(assert (=> d!143893 (= (getCurrentListMap!5784 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593467)))

(declare-fun bm!64971 () Bool)

(assert (=> bm!64971 (= call!64974 call!64976)))

(declare-fun b!1338093 () Bool)

(assert (=> b!1338093 (= e!761902 (+!4751 call!64975 (tuple2!23943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun bm!64972 () Bool)

(assert (=> bm!64972 (= call!64973 (contains!8984 lt!593467 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338094 () Bool)

(assert (=> b!1338094 (= e!761893 call!64971)))

(declare-fun bm!64973 () Bool)

(assert (=> bm!64973 (= call!64976 call!64970)))

(declare-fun b!1338095 () Bool)

(declare-fun Unit!43967 () Unit!43961)

(assert (=> b!1338095 (= e!761894 Unit!43967)))

(declare-fun b!1338096 () Bool)

(declare-fun e!761899 () Bool)

(assert (=> b!1338096 (= e!761899 (= (apply!1035 lt!593467 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1338097 () Bool)

(assert (=> b!1338097 (= e!761897 (validKeyInArray!0 (select (arr!43862 _keys!1590) from!1980)))))

(declare-fun b!1338098 () Bool)

(assert (=> b!1338098 (= e!761903 e!761900)))

(declare-fun c!126183 () Bool)

(assert (=> b!1338098 (= c!126183 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1338099 () Bool)

(assert (=> b!1338099 (= e!761900 e!761899)))

(declare-fun res!887893 () Bool)

(assert (=> b!1338099 (= res!887893 call!64973)))

(assert (=> b!1338099 (=> (not res!887893) (not e!761899))))

(assert (= (and d!143893 c!126180) b!1338093))

(assert (= (and d!143893 (not c!126180)) b!1338090))

(assert (= (and b!1338090 c!126178) b!1338089))

(assert (= (and b!1338090 (not c!126178)) b!1338085))

(assert (= (and b!1338085 c!126181) b!1338094))

(assert (= (and b!1338085 (not c!126181)) b!1338079))

(assert (= (or b!1338094 b!1338079) bm!64971))

(assert (= (or b!1338089 bm!64971) bm!64973))

(assert (= (or b!1338089 b!1338094) bm!64969))

(assert (= (or b!1338093 bm!64973) bm!64968))

(assert (= (or b!1338093 bm!64969) bm!64970))

(assert (= (and d!143893 res!887892) b!1338084))

(assert (= (and d!143893 c!126179) b!1338091))

(assert (= (and d!143893 (not c!126179)) b!1338095))

(assert (= (and d!143893 res!887896) b!1338082))

(assert (= (and b!1338082 res!887898) b!1338097))

(assert (= (and b!1338082 (not res!887891)) b!1338081))

(assert (= (and b!1338081 res!887897) b!1338088))

(assert (= (and b!1338082 res!887894) b!1338092))

(assert (= (and b!1338092 c!126182) b!1338086))

(assert (= (and b!1338092 (not c!126182)) b!1338087))

(assert (= (and b!1338086 res!887895) b!1338080))

(assert (= (or b!1338086 b!1338087) bm!64967))

(assert (= (and b!1338092 res!887890) b!1338098))

(assert (= (and b!1338098 c!126183) b!1338099))

(assert (= (and b!1338098 (not c!126183)) b!1338083))

(assert (= (and b!1338099 res!887893) b!1338096))

(assert (= (or b!1338099 b!1338083) bm!64972))

(declare-fun b_lambda!24261 () Bool)

(assert (=> (not b_lambda!24261) (not b!1338088)))

(assert (=> b!1338088 t!45410))

(declare-fun b_and!50075 () Bool)

(assert (= b_and!50073 (and (=> t!45410 result!25339) b_and!50075)))

(assert (=> b!1338084 m!1226087))

(assert (=> b!1338084 m!1226087))

(assert (=> b!1338084 m!1226093))

(declare-fun m!1226237 () Bool)

(assert (=> b!1338080 m!1226237))

(assert (=> d!143893 m!1226103))

(declare-fun m!1226239 () Bool)

(assert (=> b!1338096 m!1226239))

(assert (=> b!1338088 m!1226087))

(assert (=> b!1338088 m!1226077))

(assert (=> b!1338088 m!1226079))

(assert (=> b!1338088 m!1226087))

(declare-fun m!1226241 () Bool)

(assert (=> b!1338088 m!1226241))

(assert (=> b!1338088 m!1226077))

(assert (=> b!1338088 m!1226079))

(assert (=> b!1338088 m!1226081))

(declare-fun m!1226243 () Bool)

(assert (=> bm!64968 m!1226243))

(declare-fun m!1226245 () Bool)

(assert (=> bm!64967 m!1226245))

(declare-fun m!1226247 () Bool)

(assert (=> bm!64970 m!1226247))

(assert (=> b!1338081 m!1226087))

(assert (=> b!1338081 m!1226087))

(declare-fun m!1226249 () Bool)

(assert (=> b!1338081 m!1226249))

(declare-fun m!1226251 () Bool)

(assert (=> b!1338091 m!1226251))

(declare-fun m!1226253 () Bool)

(assert (=> b!1338091 m!1226253))

(declare-fun m!1226255 () Bool)

(assert (=> b!1338091 m!1226255))

(assert (=> b!1338091 m!1226087))

(declare-fun m!1226257 () Bool)

(assert (=> b!1338091 m!1226257))

(declare-fun m!1226259 () Bool)

(assert (=> b!1338091 m!1226259))

(declare-fun m!1226261 () Bool)

(assert (=> b!1338091 m!1226261))

(declare-fun m!1226263 () Bool)

(assert (=> b!1338091 m!1226263))

(declare-fun m!1226265 () Bool)

(assert (=> b!1338091 m!1226265))

(assert (=> b!1338091 m!1226265))

(declare-fun m!1226267 () Bool)

(assert (=> b!1338091 m!1226267))

(declare-fun m!1226269 () Bool)

(assert (=> b!1338091 m!1226269))

(assert (=> b!1338091 m!1226253))

(declare-fun m!1226271 () Bool)

(assert (=> b!1338091 m!1226271))

(declare-fun m!1226273 () Bool)

(assert (=> b!1338091 m!1226273))

(assert (=> b!1338091 m!1226259))

(declare-fun m!1226275 () Bool)

(assert (=> b!1338091 m!1226275))

(assert (=> b!1338091 m!1226243))

(declare-fun m!1226277 () Bool)

(assert (=> b!1338091 m!1226277))

(assert (=> b!1338091 m!1226261))

(declare-fun m!1226279 () Bool)

(assert (=> b!1338091 m!1226279))

(assert (=> b!1338097 m!1226087))

(assert (=> b!1338097 m!1226087))

(assert (=> b!1338097 m!1226093))

(declare-fun m!1226281 () Bool)

(assert (=> b!1338093 m!1226281))

(declare-fun m!1226283 () Bool)

(assert (=> bm!64972 m!1226283))

(assert (=> b!1337952 d!143893))

(declare-fun d!143895 () Bool)

(declare-fun e!761907 () Bool)

(assert (=> d!143895 e!761907))

(declare-fun res!887899 () Bool)

(assert (=> d!143895 (=> res!887899 e!761907)))

(declare-fun lt!593476 () Bool)

(assert (=> d!143895 (= res!887899 (not lt!593476))))

(declare-fun lt!593477 () Bool)

(assert (=> d!143895 (= lt!593476 lt!593477)))

(declare-fun lt!593475 () Unit!43961)

(declare-fun e!761906 () Unit!43961)

(assert (=> d!143895 (= lt!593475 e!761906)))

(declare-fun c!126184 () Bool)

(assert (=> d!143895 (= c!126184 lt!593477)))

(assert (=> d!143895 (= lt!593477 (containsKey!740 (toList!10815 (+!4751 lt!593354 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352))) k0!1153))))

(assert (=> d!143895 (= (contains!8984 (+!4751 lt!593354 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352)) k0!1153) lt!593476)))

(declare-fun b!1338100 () Bool)

(declare-fun lt!593478 () Unit!43961)

(assert (=> b!1338100 (= e!761906 lt!593478)))

(assert (=> b!1338100 (= lt!593478 (lemmaContainsKeyImpliesGetValueByKeyDefined!486 (toList!10815 (+!4751 lt!593354 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352))) k0!1153))))

(assert (=> b!1338100 (isDefined!525 (getValueByKey!718 (toList!10815 (+!4751 lt!593354 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352))) k0!1153))))

(declare-fun b!1338101 () Bool)

(declare-fun Unit!43968 () Unit!43961)

(assert (=> b!1338101 (= e!761906 Unit!43968)))

(declare-fun b!1338102 () Bool)

(assert (=> b!1338102 (= e!761907 (isDefined!525 (getValueByKey!718 (toList!10815 (+!4751 lt!593354 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352))) k0!1153)))))

(assert (= (and d!143895 c!126184) b!1338100))

(assert (= (and d!143895 (not c!126184)) b!1338101))

(assert (= (and d!143895 (not res!887899)) b!1338102))

(declare-fun m!1226285 () Bool)

(assert (=> d!143895 m!1226285))

(declare-fun m!1226287 () Bool)

(assert (=> b!1338100 m!1226287))

(declare-fun m!1226289 () Bool)

(assert (=> b!1338100 m!1226289))

(assert (=> b!1338100 m!1226289))

(declare-fun m!1226291 () Bool)

(assert (=> b!1338100 m!1226291))

(assert (=> b!1338102 m!1226289))

(assert (=> b!1338102 m!1226289))

(assert (=> b!1338102 m!1226291))

(assert (=> b!1337953 d!143895))

(declare-fun d!143897 () Bool)

(declare-fun e!761910 () Bool)

(assert (=> d!143897 e!761910))

(declare-fun res!887904 () Bool)

(assert (=> d!143897 (=> (not res!887904) (not e!761910))))

(declare-fun lt!593490 () ListLongMap!21599)

(assert (=> d!143897 (= res!887904 (contains!8984 lt!593490 (_1!11982 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352))))))

(declare-fun lt!593489 () List!31083)

(assert (=> d!143897 (= lt!593490 (ListLongMap!21600 lt!593489))))

(declare-fun lt!593487 () Unit!43961)

(declare-fun lt!593488 () Unit!43961)

(assert (=> d!143897 (= lt!593487 lt!593488)))

(assert (=> d!143897 (= (getValueByKey!718 lt!593489 (_1!11982 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352))) (Some!769 (_2!11982 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352))))))

(declare-fun lemmaContainsTupThenGetReturnValue!363 (List!31083 (_ BitVec 64) V!54395) Unit!43961)

(assert (=> d!143897 (= lt!593488 (lemmaContainsTupThenGetReturnValue!363 lt!593489 (_1!11982 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352)) (_2!11982 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352))))))

(declare-fun insertStrictlySorted!492 (List!31083 (_ BitVec 64) V!54395) List!31083)

(assert (=> d!143897 (= lt!593489 (insertStrictlySorted!492 (toList!10815 lt!593354) (_1!11982 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352)) (_2!11982 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352))))))

(assert (=> d!143897 (= (+!4751 lt!593354 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352)) lt!593490)))

(declare-fun b!1338107 () Bool)

(declare-fun res!887905 () Bool)

(assert (=> b!1338107 (=> (not res!887905) (not e!761910))))

(assert (=> b!1338107 (= res!887905 (= (getValueByKey!718 (toList!10815 lt!593490) (_1!11982 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352))) (Some!769 (_2!11982 (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352)))))))

(declare-fun b!1338108 () Bool)

(declare-fun contains!8986 (List!31083 tuple2!23942) Bool)

(assert (=> b!1338108 (= e!761910 (contains!8986 (toList!10815 lt!593490) (tuple2!23943 (select (arr!43862 _keys!1590) from!1980) lt!593352)))))

(assert (= (and d!143897 res!887904) b!1338107))

(assert (= (and b!1338107 res!887905) b!1338108))

(declare-fun m!1226293 () Bool)

(assert (=> d!143897 m!1226293))

(declare-fun m!1226295 () Bool)

(assert (=> d!143897 m!1226295))

(declare-fun m!1226297 () Bool)

(assert (=> d!143897 m!1226297))

(declare-fun m!1226299 () Bool)

(assert (=> d!143897 m!1226299))

(declare-fun m!1226301 () Bool)

(assert (=> b!1338107 m!1226301))

(declare-fun m!1226303 () Bool)

(assert (=> b!1338108 m!1226303))

(assert (=> b!1337953 d!143897))

(declare-fun b!1338133 () Bool)

(declare-fun e!761927 () Bool)

(declare-fun e!761928 () Bool)

(assert (=> b!1338133 (= e!761927 e!761928)))

(declare-fun c!126194 () Bool)

(assert (=> b!1338133 (= c!126194 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)))))

(declare-fun d!143899 () Bool)

(declare-fun e!761930 () Bool)

(assert (=> d!143899 e!761930))

(declare-fun res!887916 () Bool)

(assert (=> d!143899 (=> (not res!887916) (not e!761930))))

(declare-fun lt!593506 () ListLongMap!21599)

(assert (=> d!143899 (= res!887916 (not (contains!8984 lt!593506 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!761929 () ListLongMap!21599)

(assert (=> d!143899 (= lt!593506 e!761929)))

(declare-fun c!126193 () Bool)

(assert (=> d!143899 (= c!126193 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)))))

(assert (=> d!143899 (validMask!0 mask!1998)))

(assert (=> d!143899 (= (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593506)))

(declare-fun b!1338134 () Bool)

(declare-fun e!761931 () ListLongMap!21599)

(declare-fun call!64979 () ListLongMap!21599)

(assert (=> b!1338134 (= e!761931 call!64979)))

(declare-fun b!1338135 () Bool)

(declare-fun e!761925 () Bool)

(assert (=> b!1338135 (= e!761927 e!761925)))

(assert (=> b!1338135 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)))))

(declare-fun res!887917 () Bool)

(assert (=> b!1338135 (= res!887917 (contains!8984 lt!593506 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338135 (=> (not res!887917) (not e!761925))))

(declare-fun b!1338136 () Bool)

(declare-fun lt!593505 () Unit!43961)

(declare-fun lt!593509 () Unit!43961)

(assert (=> b!1338136 (= lt!593505 lt!593509)))

(declare-fun lt!593508 () (_ BitVec 64))

(declare-fun lt!593510 () (_ BitVec 64))

(declare-fun lt!593511 () V!54395)

(declare-fun lt!593507 () ListLongMap!21599)

(assert (=> b!1338136 (not (contains!8984 (+!4751 lt!593507 (tuple2!23943 lt!593510 lt!593511)) lt!593508))))

(declare-fun addStillNotContains!499 (ListLongMap!21599 (_ BitVec 64) V!54395 (_ BitVec 64)) Unit!43961)

(assert (=> b!1338136 (= lt!593509 (addStillNotContains!499 lt!593507 lt!593510 lt!593511 lt!593508))))

(assert (=> b!1338136 (= lt!593508 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1338136 (= lt!593511 (get!22141 (select (arr!43861 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3690 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1338136 (= lt!593510 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1338136 (= lt!593507 call!64979)))

(assert (=> b!1338136 (= e!761931 (+!4751 call!64979 (tuple2!23943 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22141 (select (arr!43861 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3690 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1338137 () Bool)

(assert (=> b!1338137 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)))))

(assert (=> b!1338137 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44411 _values!1320)))))

(assert (=> b!1338137 (= e!761925 (= (apply!1035 lt!593506 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22141 (select (arr!43861 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3690 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1338138 () Bool)

(assert (=> b!1338138 (= e!761929 (ListLongMap!21600 Nil!31080))))

(declare-fun b!1338139 () Bool)

(declare-fun isEmpty!1088 (ListLongMap!21599) Bool)

(assert (=> b!1338139 (= e!761928 (isEmpty!1088 lt!593506))))

(declare-fun b!1338140 () Bool)

(assert (=> b!1338140 (= e!761930 e!761927)))

(declare-fun c!126195 () Bool)

(declare-fun e!761926 () Bool)

(assert (=> b!1338140 (= c!126195 e!761926)))

(declare-fun res!887914 () Bool)

(assert (=> b!1338140 (=> (not res!887914) (not e!761926))))

(assert (=> b!1338140 (= res!887914 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44412 _keys!1590)))))

(declare-fun b!1338141 () Bool)

(assert (=> b!1338141 (= e!761928 (= lt!593506 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun bm!64976 () Bool)

(assert (=> bm!64976 (= call!64979 (getCurrentListMapNoExtraKeys!6393 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1338142 () Bool)

(assert (=> b!1338142 (= e!761926 (validKeyInArray!0 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1338142 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1338143 () Bool)

(assert (=> b!1338143 (= e!761929 e!761931)))

(declare-fun c!126196 () Bool)

(assert (=> b!1338143 (= c!126196 (validKeyInArray!0 (select (arr!43862 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1338144 () Bool)

(declare-fun res!887915 () Bool)

(assert (=> b!1338144 (=> (not res!887915) (not e!761930))))

(assert (=> b!1338144 (= res!887915 (not (contains!8984 lt!593506 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143899 c!126193) b!1338138))

(assert (= (and d!143899 (not c!126193)) b!1338143))

(assert (= (and b!1338143 c!126196) b!1338136))

(assert (= (and b!1338143 (not c!126196)) b!1338134))

(assert (= (or b!1338136 b!1338134) bm!64976))

(assert (= (and d!143899 res!887916) b!1338144))

(assert (= (and b!1338144 res!887915) b!1338140))

(assert (= (and b!1338140 res!887914) b!1338142))

(assert (= (and b!1338140 c!126195) b!1338135))

(assert (= (and b!1338140 (not c!126195)) b!1338133))

(assert (= (and b!1338135 res!887917) b!1338137))

(assert (= (and b!1338133 c!126194) b!1338141))

(assert (= (and b!1338133 (not c!126194)) b!1338139))

(declare-fun b_lambda!24263 () Bool)

(assert (=> (not b_lambda!24263) (not b!1338136)))

(assert (=> b!1338136 t!45410))

(declare-fun b_and!50077 () Bool)

(assert (= b_and!50075 (and (=> t!45410 result!25339) b_and!50077)))

(declare-fun b_lambda!24265 () Bool)

(assert (=> (not b_lambda!24265) (not b!1338137)))

(assert (=> b!1338137 t!45410))

(declare-fun b_and!50079 () Bool)

(assert (= b_and!50077 (and (=> t!45410 result!25339) b_and!50079)))

(assert (=> b!1338142 m!1226165))

(assert (=> b!1338142 m!1226165))

(assert (=> b!1338142 m!1226167))

(declare-fun m!1226305 () Bool)

(assert (=> bm!64976 m!1226305))

(assert (=> b!1338136 m!1226079))

(assert (=> b!1338136 m!1226173))

(assert (=> b!1338136 m!1226079))

(assert (=> b!1338136 m!1226177))

(assert (=> b!1338136 m!1226173))

(declare-fun m!1226307 () Bool)

(assert (=> b!1338136 m!1226307))

(assert (=> b!1338136 m!1226165))

(declare-fun m!1226309 () Bool)

(assert (=> b!1338136 m!1226309))

(assert (=> b!1338136 m!1226307))

(declare-fun m!1226311 () Bool)

(assert (=> b!1338136 m!1226311))

(declare-fun m!1226313 () Bool)

(assert (=> b!1338136 m!1226313))

(assert (=> b!1338141 m!1226305))

(assert (=> b!1338135 m!1226165))

(assert (=> b!1338135 m!1226165))

(declare-fun m!1226315 () Bool)

(assert (=> b!1338135 m!1226315))

(assert (=> b!1338143 m!1226165))

(assert (=> b!1338143 m!1226165))

(assert (=> b!1338143 m!1226167))

(declare-fun m!1226317 () Bool)

(assert (=> d!143899 m!1226317))

(assert (=> d!143899 m!1226103))

(assert (=> b!1338137 m!1226165))

(declare-fun m!1226319 () Bool)

(assert (=> b!1338137 m!1226319))

(assert (=> b!1338137 m!1226079))

(assert (=> b!1338137 m!1226173))

(assert (=> b!1338137 m!1226079))

(assert (=> b!1338137 m!1226177))

(assert (=> b!1338137 m!1226173))

(assert (=> b!1338137 m!1226165))

(declare-fun m!1226321 () Bool)

(assert (=> b!1338144 m!1226321))

(declare-fun m!1226323 () Bool)

(assert (=> b!1338139 m!1226323))

(assert (=> b!1337953 d!143899))

(declare-fun d!143901 () Bool)

(declare-fun c!126199 () Bool)

(assert (=> d!143901 (= c!126199 ((_ is ValueCellFull!17586) (select (arr!43861 _values!1320) from!1980)))))

(declare-fun e!761934 () V!54395)

(assert (=> d!143901 (= (get!22141 (select (arr!43861 _values!1320) from!1980) (dynLambda!3690 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!761934)))

(declare-fun b!1338149 () Bool)

(declare-fun get!22143 (ValueCell!17586 V!54395) V!54395)

(assert (=> b!1338149 (= e!761934 (get!22143 (select (arr!43861 _values!1320) from!1980) (dynLambda!3690 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1338150 () Bool)

(declare-fun get!22144 (ValueCell!17586 V!54395) V!54395)

(assert (=> b!1338150 (= e!761934 (get!22144 (select (arr!43861 _values!1320) from!1980) (dynLambda!3690 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143901 c!126199) b!1338149))

(assert (= (and d!143901 (not c!126199)) b!1338150))

(assert (=> b!1338149 m!1226077))

(assert (=> b!1338149 m!1226079))

(declare-fun m!1226325 () Bool)

(assert (=> b!1338149 m!1226325))

(assert (=> b!1338150 m!1226077))

(assert (=> b!1338150 m!1226079))

(declare-fun m!1226327 () Bool)

(assert (=> b!1338150 m!1226327))

(assert (=> b!1337953 d!143901))

(declare-fun bm!64979 () Bool)

(declare-fun call!64982 () Bool)

(declare-fun c!126202 () Bool)

(assert (=> bm!64979 (= call!64982 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126202 (Cons!31080 (select (arr!43862 _keys!1590) #b00000000000000000000000000000000) Nil!31081) Nil!31081)))))

(declare-fun b!1338161 () Bool)

(declare-fun e!761943 () Bool)

(assert (=> b!1338161 (= e!761943 call!64982)))

(declare-fun d!143903 () Bool)

(declare-fun res!887926 () Bool)

(declare-fun e!761946 () Bool)

(assert (=> d!143903 (=> res!887926 e!761946)))

(assert (=> d!143903 (= res!887926 (bvsge #b00000000000000000000000000000000 (size!44412 _keys!1590)))))

(assert (=> d!143903 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31081) e!761946)))

(declare-fun b!1338162 () Bool)

(declare-fun e!761944 () Bool)

(assert (=> b!1338162 (= e!761944 e!761943)))

(assert (=> b!1338162 (= c!126202 (validKeyInArray!0 (select (arr!43862 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338163 () Bool)

(assert (=> b!1338163 (= e!761943 call!64982)))

(declare-fun b!1338164 () Bool)

(assert (=> b!1338164 (= e!761946 e!761944)))

(declare-fun res!887925 () Bool)

(assert (=> b!1338164 (=> (not res!887925) (not e!761944))))

(declare-fun e!761945 () Bool)

(assert (=> b!1338164 (= res!887925 (not e!761945))))

(declare-fun res!887924 () Bool)

(assert (=> b!1338164 (=> (not res!887924) (not e!761945))))

(assert (=> b!1338164 (= res!887924 (validKeyInArray!0 (select (arr!43862 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338165 () Bool)

(declare-fun contains!8987 (List!31084 (_ BitVec 64)) Bool)

(assert (=> b!1338165 (= e!761945 (contains!8987 Nil!31081 (select (arr!43862 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143903 (not res!887926)) b!1338164))

(assert (= (and b!1338164 res!887924) b!1338165))

(assert (= (and b!1338164 res!887925) b!1338162))

(assert (= (and b!1338162 c!126202) b!1338163))

(assert (= (and b!1338162 (not c!126202)) b!1338161))

(assert (= (or b!1338163 b!1338161) bm!64979))

(declare-fun m!1226329 () Bool)

(assert (=> bm!64979 m!1226329))

(declare-fun m!1226331 () Bool)

(assert (=> bm!64979 m!1226331))

(assert (=> b!1338162 m!1226329))

(assert (=> b!1338162 m!1226329))

(declare-fun m!1226333 () Bool)

(assert (=> b!1338162 m!1226333))

(assert (=> b!1338164 m!1226329))

(assert (=> b!1338164 m!1226329))

(assert (=> b!1338164 m!1226333))

(assert (=> b!1338165 m!1226329))

(assert (=> b!1338165 m!1226329))

(declare-fun m!1226335 () Bool)

(assert (=> b!1338165 m!1226335))

(assert (=> b!1337943 d!143903))

(declare-fun d!143905 () Bool)

(assert (=> d!143905 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112806 d!143905))

(declare-fun d!143907 () Bool)

(assert (=> d!143907 (= (array_inv!33077 _values!1320) (bvsge (size!44411 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112806 d!143907))

(declare-fun d!143909 () Bool)

(assert (=> d!143909 (= (array_inv!33078 _keys!1590) (bvsge (size!44412 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112806 d!143909))

(declare-fun bm!64982 () Bool)

(declare-fun call!64985 () Bool)

(assert (=> bm!64982 (= call!64985 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1338174 () Bool)

(declare-fun e!761954 () Bool)

(declare-fun e!761955 () Bool)

(assert (=> b!1338174 (= e!761954 e!761955)))

(declare-fun lt!593520 () (_ BitVec 64))

(assert (=> b!1338174 (= lt!593520 (select (arr!43862 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!593519 () Unit!43961)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90798 (_ BitVec 64) (_ BitVec 32)) Unit!43961)

(assert (=> b!1338174 (= lt!593519 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!593520 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338174 (arrayContainsKey!0 _keys!1590 lt!593520 #b00000000000000000000000000000000)))

(declare-fun lt!593518 () Unit!43961)

(assert (=> b!1338174 (= lt!593518 lt!593519)))

(declare-fun res!887932 () Bool)

(declare-datatypes ((SeekEntryResult!10050 0))(
  ( (MissingZero!10050 (index!42571 (_ BitVec 32))) (Found!10050 (index!42572 (_ BitVec 32))) (Intermediate!10050 (undefined!10862 Bool) (index!42573 (_ BitVec 32)) (x!119526 (_ BitVec 32))) (Undefined!10050) (MissingVacant!10050 (index!42574 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90798 (_ BitVec 32)) SeekEntryResult!10050)

(assert (=> b!1338174 (= res!887932 (= (seekEntryOrOpen!0 (select (arr!43862 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10050 #b00000000000000000000000000000000)))))

(assert (=> b!1338174 (=> (not res!887932) (not e!761955))))

(declare-fun b!1338175 () Bool)

(assert (=> b!1338175 (= e!761954 call!64985)))

(declare-fun b!1338176 () Bool)

(declare-fun e!761953 () Bool)

(assert (=> b!1338176 (= e!761953 e!761954)))

(declare-fun c!126205 () Bool)

(assert (=> b!1338176 (= c!126205 (validKeyInArray!0 (select (arr!43862 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1338177 () Bool)

(assert (=> b!1338177 (= e!761955 call!64985)))

(declare-fun d!143911 () Bool)

(declare-fun res!887931 () Bool)

(assert (=> d!143911 (=> res!887931 e!761953)))

(assert (=> d!143911 (= res!887931 (bvsge #b00000000000000000000000000000000 (size!44412 _keys!1590)))))

(assert (=> d!143911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!761953)))

(assert (= (and d!143911 (not res!887931)) b!1338176))

(assert (= (and b!1338176 c!126205) b!1338174))

(assert (= (and b!1338176 (not c!126205)) b!1338175))

(assert (= (and b!1338174 res!887932) b!1338177))

(assert (= (or b!1338177 b!1338175) bm!64982))

(declare-fun m!1226337 () Bool)

(assert (=> bm!64982 m!1226337))

(assert (=> b!1338174 m!1226329))

(declare-fun m!1226339 () Bool)

(assert (=> b!1338174 m!1226339))

(declare-fun m!1226341 () Bool)

(assert (=> b!1338174 m!1226341))

(assert (=> b!1338174 m!1226329))

(declare-fun m!1226343 () Bool)

(assert (=> b!1338174 m!1226343))

(assert (=> b!1338176 m!1226329))

(assert (=> b!1338176 m!1226329))

(assert (=> b!1338176 m!1226333))

(assert (=> b!1337944 d!143911))

(declare-fun d!143913 () Bool)

(assert (=> d!143913 (= (validKeyInArray!0 (select (arr!43862 _keys!1590) from!1980)) (and (not (= (select (arr!43862 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43862 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337945 d!143913))

(declare-fun b!1338185 () Bool)

(declare-fun e!761960 () Bool)

(assert (=> b!1338185 (= e!761960 tp_is_empty!36969)))

(declare-fun b!1338184 () Bool)

(declare-fun e!761961 () Bool)

(assert (=> b!1338184 (= e!761961 tp_is_empty!36969)))

(declare-fun mapIsEmpty!57144 () Bool)

(declare-fun mapRes!57144 () Bool)

(assert (=> mapIsEmpty!57144 mapRes!57144))

(declare-fun mapNonEmpty!57144 () Bool)

(declare-fun tp!108834 () Bool)

(assert (=> mapNonEmpty!57144 (= mapRes!57144 (and tp!108834 e!761961))))

(declare-fun mapRest!57144 () (Array (_ BitVec 32) ValueCell!17586))

(declare-fun mapKey!57144 () (_ BitVec 32))

(declare-fun mapValue!57144 () ValueCell!17586)

(assert (=> mapNonEmpty!57144 (= mapRest!57138 (store mapRest!57144 mapKey!57144 mapValue!57144))))

(declare-fun condMapEmpty!57144 () Bool)

(declare-fun mapDefault!57144 () ValueCell!17586)

(assert (=> mapNonEmpty!57138 (= condMapEmpty!57144 (= mapRest!57138 ((as const (Array (_ BitVec 32) ValueCell!17586)) mapDefault!57144)))))

(assert (=> mapNonEmpty!57138 (= tp!108825 (and e!761960 mapRes!57144))))

(assert (= (and mapNonEmpty!57138 condMapEmpty!57144) mapIsEmpty!57144))

(assert (= (and mapNonEmpty!57138 (not condMapEmpty!57144)) mapNonEmpty!57144))

(assert (= (and mapNonEmpty!57144 ((_ is ValueCellFull!17586) mapValue!57144)) b!1338184))

(assert (= (and mapNonEmpty!57138 ((_ is ValueCellFull!17586) mapDefault!57144)) b!1338185))

(declare-fun m!1226345 () Bool)

(assert (=> mapNonEmpty!57144 m!1226345))

(declare-fun b_lambda!24267 () Bool)

(assert (= b_lambda!24265 (or (and start!112806 b_free!31059) b_lambda!24267)))

(declare-fun b_lambda!24269 () Bool)

(assert (= b_lambda!24261 (or (and start!112806 b_free!31059) b_lambda!24269)))

(declare-fun b_lambda!24271 () Bool)

(assert (= b_lambda!24263 (or (and start!112806 b_free!31059) b_lambda!24271)))

(declare-fun b_lambda!24273 () Bool)

(assert (= b_lambda!24259 (or (and start!112806 b_free!31059) b_lambda!24273)))

(check-sat (not d!143889) (not b!1338097) (not b!1338144) (not b_lambda!24267) tp_is_empty!36969 (not b!1338137) (not b!1338066) (not bm!64965) (not bm!64976) b_and!50079 (not b_next!31059) (not b!1338061) (not b!1338108) (not b!1338165) (not b!1338150) (not b_lambda!24269) (not b!1338073) (not d!143893) (not bm!64960) (not b!1338142) (not bm!64970) (not b!1338096) (not mapNonEmpty!57144) (not bm!64972) (not b!1338100) (not b!1338084) (not b!1338162) (not b_lambda!24257) (not b!1338149) (not b!1338164) (not d!143883) (not b_lambda!24273) (not b!1338081) (not b!1338093) (not b!1338080) (not d!143895) (not b_lambda!24271) (not b!1338057) (not b!1338176) (not b!1338053) (not b!1338143) (not b!1338139) (not bm!64961) (not b!1338070) (not b!1338069) (not b!1338009) (not bm!64967) (not d!143891) (not bm!64963) (not b!1338091) (not b!1338136) (not b!1338078) (not b!1338107) (not b!1338064) (not b!1338007) (not d!143897) (not b!1338102) (not b!1338088) (not b!1338075) (not bm!64982) (not b!1338174) (not bm!64979) (not b!1338135) (not d!143899) (not b!1338141) (not b!1338076) (not bm!64968) (not d!143885) (not d!143887) (not b!1338054))
(check-sat b_and!50079 (not b_next!31059))
