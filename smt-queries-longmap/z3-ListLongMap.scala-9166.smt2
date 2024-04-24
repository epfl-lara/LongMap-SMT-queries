; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110294 () Bool)

(assert start!110294)

(declare-fun b_free!29269 () Bool)

(declare-fun b_next!29269 () Bool)

(assert (=> start!110294 (= b_free!29269 (not b_next!29269))))

(declare-fun tp!102957 () Bool)

(declare-fun b_and!47435 () Bool)

(assert (=> start!110294 (= tp!102957 b_and!47435)))

(declare-fun res!866352 () Bool)

(declare-fun e!744394 () Bool)

(assert (=> start!110294 (=> (not res!866352) (not e!744394))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110294 (= res!866352 (validMask!0 mask!2175))))

(assert (=> start!110294 e!744394))

(declare-fun tp_is_empty!34909 () Bool)

(assert (=> start!110294 tp_is_empty!34909))

(assert (=> start!110294 true))

(declare-datatypes ((V!51649 0))(
  ( (V!51650 (val!17529 Int)) )
))
(declare-datatypes ((ValueCell!16556 0))(
  ( (ValueCellFull!16556 (v!20140 V!51649)) (EmptyCell!16556) )
))
(declare-datatypes ((array!86871 0))(
  ( (array!86872 (arr!41922 (Array (_ BitVec 32) ValueCell!16556)) (size!42473 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86871)

(declare-fun e!744393 () Bool)

(declare-fun array_inv!31957 (array!86871) Bool)

(assert (=> start!110294 (and (array_inv!31957 _values!1445) e!744393)))

(declare-datatypes ((array!86873 0))(
  ( (array!86874 (arr!41923 (Array (_ BitVec 32) (_ BitVec 64))) (size!42474 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86873)

(declare-fun array_inv!31958 (array!86873) Bool)

(assert (=> start!110294 (array_inv!31958 _keys!1741)))

(assert (=> start!110294 tp!102957))

(declare-fun b!1304887 () Bool)

(declare-fun res!866356 () Bool)

(assert (=> b!1304887 (=> (not res!866356) (not e!744394))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1304887 (= res!866356 (and (= (size!42473 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42474 _keys!1741) (size!42473 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304888 () Bool)

(declare-fun res!866351 () Bool)

(assert (=> b!1304888 (=> (not res!866351) (not e!744394))))

(declare-fun minValue!1387 () V!51649)

(declare-fun zeroValue!1387 () V!51649)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22644 0))(
  ( (tuple2!22645 (_1!11333 (_ BitVec 64)) (_2!11333 V!51649)) )
))
(declare-datatypes ((List!29791 0))(
  ( (Nil!29788) (Cons!29787 (h!31005 tuple2!22644) (t!43377 List!29791)) )
))
(declare-datatypes ((ListLongMap!20309 0))(
  ( (ListLongMap!20310 (toList!10170 List!29791)) )
))
(declare-fun contains!8318 (ListLongMap!20309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5180 (array!86873 array!86871 (_ BitVec 32) (_ BitVec 32) V!51649 V!51649 (_ BitVec 32) Int) ListLongMap!20309)

(assert (=> b!1304888 (= res!866351 (contains!8318 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1304889 () Bool)

(declare-fun e!744392 () Bool)

(assert (=> b!1304889 (= e!744392 tp_is_empty!34909)))

(declare-fun mapNonEmpty!53956 () Bool)

(declare-fun mapRes!53956 () Bool)

(declare-fun tp!102958 () Bool)

(declare-fun e!744389 () Bool)

(assert (=> mapNonEmpty!53956 (= mapRes!53956 (and tp!102958 e!744389))))

(declare-fun mapKey!53956 () (_ BitVec 32))

(declare-fun mapRest!53956 () (Array (_ BitVec 32) ValueCell!16556))

(declare-fun mapValue!53956 () ValueCell!16556)

(assert (=> mapNonEmpty!53956 (= (arr!41922 _values!1445) (store mapRest!53956 mapKey!53956 mapValue!53956))))

(declare-fun b!1304890 () Bool)

(declare-fun e!744388 () Bool)

(assert (=> b!1304890 (= e!744388 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1304891 () Bool)

(declare-fun res!866350 () Bool)

(assert (=> b!1304891 (=> (not res!866350) (not e!744394))))

(assert (=> b!1304891 (= res!866350 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42474 _keys!1741))))))

(declare-fun b!1304892 () Bool)

(declare-fun res!866349 () Bool)

(assert (=> b!1304892 (=> (not res!866349) (not e!744394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304892 (= res!866349 (not (validKeyInArray!0 (select (arr!41923 _keys!1741) from!2144))))))

(declare-fun b!1304893 () Bool)

(assert (=> b!1304893 (= e!744393 (and e!744392 mapRes!53956))))

(declare-fun condMapEmpty!53956 () Bool)

(declare-fun mapDefault!53956 () ValueCell!16556)

(assert (=> b!1304893 (= condMapEmpty!53956 (= (arr!41922 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16556)) mapDefault!53956)))))

(declare-fun b!1304894 () Bool)

(assert (=> b!1304894 (= e!744389 tp_is_empty!34909)))

(declare-fun mapIsEmpty!53956 () Bool)

(assert (=> mapIsEmpty!53956 mapRes!53956))

(declare-fun b!1304895 () Bool)

(declare-fun res!866354 () Bool)

(assert (=> b!1304895 (=> (not res!866354) (not e!744394))))

(declare-datatypes ((List!29792 0))(
  ( (Nil!29789) (Cons!29788 (h!31006 (_ BitVec 64)) (t!43378 List!29792)) )
))
(declare-fun arrayNoDuplicates!0 (array!86873 (_ BitVec 32) List!29792) Bool)

(assert (=> b!1304895 (= res!866354 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29789))))

(declare-fun b!1304896 () Bool)

(declare-fun e!744390 () Bool)

(assert (=> b!1304896 (= e!744390 e!744388)))

(declare-fun res!866355 () Bool)

(assert (=> b!1304896 (=> (not res!866355) (not e!744388))))

(declare-fun getCurrentListMapNoExtraKeys!6168 (array!86873 array!86871 (_ BitVec 32) (_ BitVec 32) V!51649 V!51649 (_ BitVec 32) Int) ListLongMap!20309)

(assert (=> b!1304896 (= res!866355 (not (contains!8318 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205)))))

(declare-fun b!1304897 () Bool)

(declare-fun res!866348 () Bool)

(assert (=> b!1304897 (=> (not res!866348) (not e!744394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86873 (_ BitVec 32)) Bool)

(assert (=> b!1304897 (= res!866348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304898 () Bool)

(declare-fun res!866357 () Bool)

(assert (=> b!1304898 (=> (not res!866357) (not e!744394))))

(assert (=> b!1304898 (= res!866357 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42474 _keys!1741))))))

(declare-fun b!1304899 () Bool)

(assert (=> b!1304899 (= e!744394 (not e!744390))))

(declare-fun res!866353 () Bool)

(assert (=> b!1304899 (=> res!866353 e!744390)))

(assert (=> b!1304899 (= res!866353 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1304899 (not (contains!8318 (ListLongMap!20310 Nil!29788) k0!1205))))

(declare-datatypes ((Unit!43134 0))(
  ( (Unit!43135) )
))
(declare-fun lt!583826 () Unit!43134)

(declare-fun emptyContainsNothing!222 ((_ BitVec 64)) Unit!43134)

(assert (=> b!1304899 (= lt!583826 (emptyContainsNothing!222 k0!1205))))

(assert (= (and start!110294 res!866352) b!1304887))

(assert (= (and b!1304887 res!866356) b!1304897))

(assert (= (and b!1304897 res!866348) b!1304895))

(assert (= (and b!1304895 res!866354) b!1304891))

(assert (= (and b!1304891 res!866350) b!1304888))

(assert (= (and b!1304888 res!866351) b!1304898))

(assert (= (and b!1304898 res!866357) b!1304892))

(assert (= (and b!1304892 res!866349) b!1304899))

(assert (= (and b!1304899 (not res!866353)) b!1304896))

(assert (= (and b!1304896 res!866355) b!1304890))

(assert (= (and b!1304893 condMapEmpty!53956) mapIsEmpty!53956))

(assert (= (and b!1304893 (not condMapEmpty!53956)) mapNonEmpty!53956))

(get-info :version)

(assert (= (and mapNonEmpty!53956 ((_ is ValueCellFull!16556) mapValue!53956)) b!1304894))

(assert (= (and b!1304893 ((_ is ValueCellFull!16556) mapDefault!53956)) b!1304889))

(assert (= start!110294 b!1304893))

(declare-fun m!1196109 () Bool)

(assert (=> b!1304892 m!1196109))

(assert (=> b!1304892 m!1196109))

(declare-fun m!1196111 () Bool)

(assert (=> b!1304892 m!1196111))

(declare-fun m!1196113 () Bool)

(assert (=> b!1304896 m!1196113))

(assert (=> b!1304896 m!1196113))

(declare-fun m!1196115 () Bool)

(assert (=> b!1304896 m!1196115))

(declare-fun m!1196117 () Bool)

(assert (=> b!1304899 m!1196117))

(declare-fun m!1196119 () Bool)

(assert (=> b!1304899 m!1196119))

(declare-fun m!1196121 () Bool)

(assert (=> b!1304895 m!1196121))

(declare-fun m!1196123 () Bool)

(assert (=> mapNonEmpty!53956 m!1196123))

(declare-fun m!1196125 () Bool)

(assert (=> b!1304888 m!1196125))

(assert (=> b!1304888 m!1196125))

(declare-fun m!1196127 () Bool)

(assert (=> b!1304888 m!1196127))

(declare-fun m!1196129 () Bool)

(assert (=> b!1304897 m!1196129))

(declare-fun m!1196131 () Bool)

(assert (=> start!110294 m!1196131))

(declare-fun m!1196133 () Bool)

(assert (=> start!110294 m!1196133))

(declare-fun m!1196135 () Bool)

(assert (=> start!110294 m!1196135))

(check-sat (not b!1304899) (not b!1304896) (not b!1304892) (not b_next!29269) tp_is_empty!34909 (not start!110294) b_and!47435 (not mapNonEmpty!53956) (not b!1304897) (not b!1304895) (not b!1304888))
(check-sat b_and!47435 (not b_next!29269))
(get-model)

(declare-fun d!142093 () Bool)

(declare-fun e!744441 () Bool)

(assert (=> d!142093 e!744441))

(declare-fun res!866420 () Bool)

(assert (=> d!142093 (=> res!866420 e!744441)))

(declare-fun lt!583842 () Bool)

(assert (=> d!142093 (= res!866420 (not lt!583842))))

(declare-fun lt!583843 () Bool)

(assert (=> d!142093 (= lt!583842 lt!583843)))

(declare-fun lt!583841 () Unit!43134)

(declare-fun e!744442 () Unit!43134)

(assert (=> d!142093 (= lt!583841 e!744442)))

(declare-fun c!125505 () Bool)

(assert (=> d!142093 (= c!125505 lt!583843)))

(declare-fun containsKey!727 (List!29791 (_ BitVec 64)) Bool)

(assert (=> d!142093 (= lt!583843 (containsKey!727 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205))))

(assert (=> d!142093 (= (contains!8318 (ListLongMap!20310 Nil!29788) k0!1205) lt!583842)))

(declare-fun b!1304984 () Bool)

(declare-fun lt!583844 () Unit!43134)

(assert (=> b!1304984 (= e!744442 lt!583844)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!473 (List!29791 (_ BitVec 64)) Unit!43134)

(assert (=> b!1304984 (= lt!583844 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205))))

(declare-datatypes ((Option!752 0))(
  ( (Some!751 (v!20143 V!51649)) (None!750) )
))
(declare-fun isDefined!510 (Option!752) Bool)

(declare-fun getValueByKey!701 (List!29791 (_ BitVec 64)) Option!752)

(assert (=> b!1304984 (isDefined!510 (getValueByKey!701 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205))))

(declare-fun b!1304985 () Bool)

(declare-fun Unit!43138 () Unit!43134)

(assert (=> b!1304985 (= e!744442 Unit!43138)))

(declare-fun b!1304986 () Bool)

(assert (=> b!1304986 (= e!744441 (isDefined!510 (getValueByKey!701 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205)))))

(assert (= (and d!142093 c!125505) b!1304984))

(assert (= (and d!142093 (not c!125505)) b!1304985))

(assert (= (and d!142093 (not res!866420)) b!1304986))

(declare-fun m!1196193 () Bool)

(assert (=> d!142093 m!1196193))

(declare-fun m!1196195 () Bool)

(assert (=> b!1304984 m!1196195))

(declare-fun m!1196197 () Bool)

(assert (=> b!1304984 m!1196197))

(assert (=> b!1304984 m!1196197))

(declare-fun m!1196199 () Bool)

(assert (=> b!1304984 m!1196199))

(assert (=> b!1304986 m!1196197))

(assert (=> b!1304986 m!1196197))

(assert (=> b!1304986 m!1196199))

(assert (=> b!1304899 d!142093))

(declare-fun d!142095 () Bool)

(assert (=> d!142095 (not (contains!8318 (ListLongMap!20310 Nil!29788) k0!1205))))

(declare-fun lt!583847 () Unit!43134)

(declare-fun choose!1924 ((_ BitVec 64)) Unit!43134)

(assert (=> d!142095 (= lt!583847 (choose!1924 k0!1205))))

(assert (=> d!142095 (= (emptyContainsNothing!222 k0!1205) lt!583847)))

(declare-fun bs!37140 () Bool)

(assert (= bs!37140 d!142095))

(assert (=> bs!37140 m!1196117))

(declare-fun m!1196201 () Bool)

(assert (=> bs!37140 m!1196201))

(assert (=> b!1304899 d!142095))

(declare-fun bm!64271 () Bool)

(declare-fun call!64274 () Bool)

(declare-fun c!125508 () Bool)

(assert (=> bm!64271 (= call!64274 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125508 (Cons!29788 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) Nil!29789) Nil!29789)))))

(declare-fun b!1304997 () Bool)

(declare-fun e!744451 () Bool)

(declare-fun e!744453 () Bool)

(assert (=> b!1304997 (= e!744451 e!744453)))

(assert (=> b!1304997 (= c!125508 (validKeyInArray!0 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304998 () Bool)

(assert (=> b!1304998 (= e!744453 call!64274)))

(declare-fun b!1304999 () Bool)

(assert (=> b!1304999 (= e!744453 call!64274)))

(declare-fun b!1305000 () Bool)

(declare-fun e!744452 () Bool)

(assert (=> b!1305000 (= e!744452 e!744451)))

(declare-fun res!866427 () Bool)

(assert (=> b!1305000 (=> (not res!866427) (not e!744451))))

(declare-fun e!744454 () Bool)

(assert (=> b!1305000 (= res!866427 (not e!744454))))

(declare-fun res!866428 () Bool)

(assert (=> b!1305000 (=> (not res!866428) (not e!744454))))

(assert (=> b!1305000 (= res!866428 (validKeyInArray!0 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142097 () Bool)

(declare-fun res!866429 () Bool)

(assert (=> d!142097 (=> res!866429 e!744452)))

(assert (=> d!142097 (= res!866429 (bvsge #b00000000000000000000000000000000 (size!42474 _keys!1741)))))

(assert (=> d!142097 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29789) e!744452)))

(declare-fun b!1305001 () Bool)

(declare-fun contains!8321 (List!29792 (_ BitVec 64)) Bool)

(assert (=> b!1305001 (= e!744454 (contains!8321 Nil!29789 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142097 (not res!866429)) b!1305000))

(assert (= (and b!1305000 res!866428) b!1305001))

(assert (= (and b!1305000 res!866427) b!1304997))

(assert (= (and b!1304997 c!125508) b!1304999))

(assert (= (and b!1304997 (not c!125508)) b!1304998))

(assert (= (or b!1304999 b!1304998) bm!64271))

(declare-fun m!1196203 () Bool)

(assert (=> bm!64271 m!1196203))

(declare-fun m!1196205 () Bool)

(assert (=> bm!64271 m!1196205))

(assert (=> b!1304997 m!1196203))

(assert (=> b!1304997 m!1196203))

(declare-fun m!1196207 () Bool)

(assert (=> b!1304997 m!1196207))

(assert (=> b!1305000 m!1196203))

(assert (=> b!1305000 m!1196203))

(assert (=> b!1305000 m!1196207))

(assert (=> b!1305001 m!1196203))

(assert (=> b!1305001 m!1196203))

(declare-fun m!1196209 () Bool)

(assert (=> b!1305001 m!1196209))

(assert (=> b!1304895 d!142097))

(declare-fun d!142099 () Bool)

(declare-fun e!744455 () Bool)

(assert (=> d!142099 e!744455))

(declare-fun res!866430 () Bool)

(assert (=> d!142099 (=> res!866430 e!744455)))

(declare-fun lt!583849 () Bool)

(assert (=> d!142099 (= res!866430 (not lt!583849))))

(declare-fun lt!583850 () Bool)

(assert (=> d!142099 (= lt!583849 lt!583850)))

(declare-fun lt!583848 () Unit!43134)

(declare-fun e!744456 () Unit!43134)

(assert (=> d!142099 (= lt!583848 e!744456)))

(declare-fun c!125509 () Bool)

(assert (=> d!142099 (= c!125509 lt!583850)))

(assert (=> d!142099 (= lt!583850 (containsKey!727 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142099 (= (contains!8318 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583849)))

(declare-fun b!1305002 () Bool)

(declare-fun lt!583851 () Unit!43134)

(assert (=> b!1305002 (= e!744456 lt!583851)))

(assert (=> b!1305002 (= lt!583851 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1305002 (isDefined!510 (getValueByKey!701 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1305003 () Bool)

(declare-fun Unit!43139 () Unit!43134)

(assert (=> b!1305003 (= e!744456 Unit!43139)))

(declare-fun b!1305004 () Bool)

(assert (=> b!1305004 (= e!744455 (isDefined!510 (getValueByKey!701 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142099 c!125509) b!1305002))

(assert (= (and d!142099 (not c!125509)) b!1305003))

(assert (= (and d!142099 (not res!866430)) b!1305004))

(declare-fun m!1196211 () Bool)

(assert (=> d!142099 m!1196211))

(declare-fun m!1196213 () Bool)

(assert (=> b!1305002 m!1196213))

(declare-fun m!1196215 () Bool)

(assert (=> b!1305002 m!1196215))

(assert (=> b!1305002 m!1196215))

(declare-fun m!1196217 () Bool)

(assert (=> b!1305002 m!1196217))

(assert (=> b!1305004 m!1196215))

(assert (=> b!1305004 m!1196215))

(assert (=> b!1305004 m!1196217))

(assert (=> b!1304896 d!142099))

(declare-fun b!1305029 () Bool)

(declare-fun res!866440 () Bool)

(declare-fun e!744476 () Bool)

(assert (=> b!1305029 (=> (not res!866440) (not e!744476))))

(declare-fun lt!583872 () ListLongMap!20309)

(assert (=> b!1305029 (= res!866440 (not (contains!8318 lt!583872 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1305030 () Bool)

(declare-fun e!744471 () ListLongMap!20309)

(declare-fun call!64277 () ListLongMap!20309)

(assert (=> b!1305030 (= e!744471 call!64277)))

(declare-fun b!1305031 () Bool)

(declare-fun e!744473 () Bool)

(declare-fun e!744477 () Bool)

(assert (=> b!1305031 (= e!744473 e!744477)))

(declare-fun c!125520 () Bool)

(assert (=> b!1305031 (= c!125520 (bvslt from!2144 (size!42474 _keys!1741)))))

(declare-fun d!142101 () Bool)

(assert (=> d!142101 e!744476))

(declare-fun res!866442 () Bool)

(assert (=> d!142101 (=> (not res!866442) (not e!744476))))

(assert (=> d!142101 (= res!866442 (not (contains!8318 lt!583872 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!744474 () ListLongMap!20309)

(assert (=> d!142101 (= lt!583872 e!744474)))

(declare-fun c!125519 () Bool)

(assert (=> d!142101 (= c!125519 (bvsge from!2144 (size!42474 _keys!1741)))))

(assert (=> d!142101 (validMask!0 mask!2175)))

(assert (=> d!142101 (= (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583872)))

(declare-fun b!1305032 () Bool)

(assert (=> b!1305032 (= e!744474 e!744471)))

(declare-fun c!125521 () Bool)

(assert (=> b!1305032 (= c!125521 (validKeyInArray!0 (select (arr!41923 _keys!1741) from!2144)))))

(declare-fun b!1305033 () Bool)

(declare-fun lt!583866 () Unit!43134)

(declare-fun lt!583870 () Unit!43134)

(assert (=> b!1305033 (= lt!583866 lt!583870)))

(declare-fun lt!583871 () (_ BitVec 64))

(declare-fun lt!583868 () (_ BitVec 64))

(declare-fun lt!583869 () V!51649)

(declare-fun lt!583867 () ListLongMap!20309)

(declare-fun +!4530 (ListLongMap!20309 tuple2!22644) ListLongMap!20309)

(assert (=> b!1305033 (not (contains!8318 (+!4530 lt!583867 (tuple2!22645 lt!583868 lt!583869)) lt!583871))))

(declare-fun addStillNotContains!481 (ListLongMap!20309 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43134)

(assert (=> b!1305033 (= lt!583870 (addStillNotContains!481 lt!583867 lt!583868 lt!583869 lt!583871))))

(assert (=> b!1305033 (= lt!583871 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21217 (ValueCell!16556 V!51649) V!51649)

(declare-fun dynLambda!3492 (Int (_ BitVec 64)) V!51649)

(assert (=> b!1305033 (= lt!583869 (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1305033 (= lt!583868 (select (arr!41923 _keys!1741) from!2144))))

(assert (=> b!1305033 (= lt!583867 call!64277)))

(assert (=> b!1305033 (= e!744471 (+!4530 call!64277 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1305034 () Bool)

(assert (=> b!1305034 (= e!744476 e!744473)))

(declare-fun c!125518 () Bool)

(declare-fun e!744475 () Bool)

(assert (=> b!1305034 (= c!125518 e!744475)))

(declare-fun res!866441 () Bool)

(assert (=> b!1305034 (=> (not res!866441) (not e!744475))))

(assert (=> b!1305034 (= res!866441 (bvslt from!2144 (size!42474 _keys!1741)))))

(declare-fun b!1305035 () Bool)

(declare-fun isEmpty!1066 (ListLongMap!20309) Bool)

(assert (=> b!1305035 (= e!744477 (isEmpty!1066 lt!583872))))

(declare-fun b!1305036 () Bool)

(assert (=> b!1305036 (= e!744474 (ListLongMap!20310 Nil!29788))))

(declare-fun b!1305037 () Bool)

(assert (=> b!1305037 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42474 _keys!1741)))))

(assert (=> b!1305037 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42473 _values!1445)))))

(declare-fun e!744472 () Bool)

(declare-fun apply!1031 (ListLongMap!20309 (_ BitVec 64)) V!51649)

(assert (=> b!1305037 (= e!744472 (= (apply!1031 lt!583872 (select (arr!41923 _keys!1741) from!2144)) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!64274 () Bool)

(assert (=> bm!64274 (= call!64277 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1305038 () Bool)

(assert (=> b!1305038 (= e!744475 (validKeyInArray!0 (select (arr!41923 _keys!1741) from!2144)))))

(assert (=> b!1305038 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1305039 () Bool)

(assert (=> b!1305039 (= e!744477 (= lt!583872 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1305040 () Bool)

(assert (=> b!1305040 (= e!744473 e!744472)))

(assert (=> b!1305040 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42474 _keys!1741)))))

(declare-fun res!866439 () Bool)

(assert (=> b!1305040 (= res!866439 (contains!8318 lt!583872 (select (arr!41923 _keys!1741) from!2144)))))

(assert (=> b!1305040 (=> (not res!866439) (not e!744472))))

(assert (= (and d!142101 c!125519) b!1305036))

(assert (= (and d!142101 (not c!125519)) b!1305032))

(assert (= (and b!1305032 c!125521) b!1305033))

(assert (= (and b!1305032 (not c!125521)) b!1305030))

(assert (= (or b!1305033 b!1305030) bm!64274))

(assert (= (and d!142101 res!866442) b!1305029))

(assert (= (and b!1305029 res!866440) b!1305034))

(assert (= (and b!1305034 res!866441) b!1305038))

(assert (= (and b!1305034 c!125518) b!1305040))

(assert (= (and b!1305034 (not c!125518)) b!1305031))

(assert (= (and b!1305040 res!866439) b!1305037))

(assert (= (and b!1305031 c!125520) b!1305039))

(assert (= (and b!1305031 (not c!125520)) b!1305035))

(declare-fun b_lambda!23269 () Bool)

(assert (=> (not b_lambda!23269) (not b!1305033)))

(declare-fun t!43384 () Bool)

(declare-fun tb!11391 () Bool)

(assert (=> (and start!110294 (= defaultEntry!1448 defaultEntry!1448) t!43384) tb!11391))

(declare-fun result!23811 () Bool)

(assert (=> tb!11391 (= result!23811 tp_is_empty!34909)))

(assert (=> b!1305033 t!43384))

(declare-fun b_and!47441 () Bool)

(assert (= b_and!47435 (and (=> t!43384 result!23811) b_and!47441)))

(declare-fun b_lambda!23271 () Bool)

(assert (=> (not b_lambda!23271) (not b!1305037)))

(assert (=> b!1305037 t!43384))

(declare-fun b_and!47443 () Bool)

(assert (= b_and!47441 (and (=> t!43384 result!23811) b_and!47443)))

(assert (=> b!1305032 m!1196109))

(assert (=> b!1305032 m!1196109))

(assert (=> b!1305032 m!1196111))

(assert (=> b!1305037 m!1196109))

(declare-fun m!1196219 () Bool)

(assert (=> b!1305037 m!1196219))

(declare-fun m!1196221 () Bool)

(assert (=> b!1305037 m!1196221))

(declare-fun m!1196223 () Bool)

(assert (=> b!1305037 m!1196223))

(assert (=> b!1305037 m!1196221))

(declare-fun m!1196225 () Bool)

(assert (=> b!1305037 m!1196225))

(assert (=> b!1305037 m!1196223))

(assert (=> b!1305037 m!1196109))

(assert (=> b!1305038 m!1196109))

(assert (=> b!1305038 m!1196109))

(assert (=> b!1305038 m!1196111))

(declare-fun m!1196227 () Bool)

(assert (=> b!1305039 m!1196227))

(declare-fun m!1196229 () Bool)

(assert (=> b!1305029 m!1196229))

(assert (=> bm!64274 m!1196227))

(assert (=> b!1305040 m!1196109))

(assert (=> b!1305040 m!1196109))

(declare-fun m!1196231 () Bool)

(assert (=> b!1305040 m!1196231))

(declare-fun m!1196233 () Bool)

(assert (=> b!1305035 m!1196233))

(declare-fun m!1196235 () Bool)

(assert (=> d!142101 m!1196235))

(assert (=> d!142101 m!1196131))

(assert (=> b!1305033 m!1196221))

(declare-fun m!1196237 () Bool)

(assert (=> b!1305033 m!1196237))

(declare-fun m!1196239 () Bool)

(assert (=> b!1305033 m!1196239))

(assert (=> b!1305033 m!1196223))

(assert (=> b!1305033 m!1196221))

(assert (=> b!1305033 m!1196225))

(assert (=> b!1305033 m!1196223))

(declare-fun m!1196241 () Bool)

(assert (=> b!1305033 m!1196241))

(declare-fun m!1196243 () Bool)

(assert (=> b!1305033 m!1196243))

(assert (=> b!1305033 m!1196109))

(assert (=> b!1305033 m!1196241))

(assert (=> b!1304896 d!142101))

(declare-fun d!142103 () Bool)

(assert (=> d!142103 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110294 d!142103))

(declare-fun d!142105 () Bool)

(assert (=> d!142105 (= (array_inv!31957 _values!1445) (bvsge (size!42473 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110294 d!142105))

(declare-fun d!142107 () Bool)

(assert (=> d!142107 (= (array_inv!31958 _keys!1741) (bvsge (size!42474 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110294 d!142107))

(declare-fun d!142109 () Bool)

(declare-fun e!744478 () Bool)

(assert (=> d!142109 e!744478))

(declare-fun res!866443 () Bool)

(assert (=> d!142109 (=> res!866443 e!744478)))

(declare-fun lt!583874 () Bool)

(assert (=> d!142109 (= res!866443 (not lt!583874))))

(declare-fun lt!583875 () Bool)

(assert (=> d!142109 (= lt!583874 lt!583875)))

(declare-fun lt!583873 () Unit!43134)

(declare-fun e!744479 () Unit!43134)

(assert (=> d!142109 (= lt!583873 e!744479)))

(declare-fun c!125522 () Bool)

(assert (=> d!142109 (= c!125522 lt!583875)))

(assert (=> d!142109 (= lt!583875 (containsKey!727 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142109 (= (contains!8318 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583874)))

(declare-fun b!1305043 () Bool)

(declare-fun lt!583876 () Unit!43134)

(assert (=> b!1305043 (= e!744479 lt!583876)))

(assert (=> b!1305043 (= lt!583876 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1305043 (isDefined!510 (getValueByKey!701 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1305044 () Bool)

(declare-fun Unit!43140 () Unit!43134)

(assert (=> b!1305044 (= e!744479 Unit!43140)))

(declare-fun b!1305045 () Bool)

(assert (=> b!1305045 (= e!744478 (isDefined!510 (getValueByKey!701 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142109 c!125522) b!1305043))

(assert (= (and d!142109 (not c!125522)) b!1305044))

(assert (= (and d!142109 (not res!866443)) b!1305045))

(declare-fun m!1196245 () Bool)

(assert (=> d!142109 m!1196245))

(declare-fun m!1196247 () Bool)

(assert (=> b!1305043 m!1196247))

(declare-fun m!1196249 () Bool)

(assert (=> b!1305043 m!1196249))

(assert (=> b!1305043 m!1196249))

(declare-fun m!1196251 () Bool)

(assert (=> b!1305043 m!1196251))

(assert (=> b!1305045 m!1196249))

(assert (=> b!1305045 m!1196249))

(assert (=> b!1305045 m!1196251))

(assert (=> b!1304888 d!142109))

(declare-fun b!1305089 () Bool)

(declare-fun res!866464 () Bool)

(declare-fun e!744509 () Bool)

(assert (=> b!1305089 (=> (not res!866464) (not e!744509))))

(declare-fun e!744511 () Bool)

(assert (=> b!1305089 (= res!866464 e!744511)))

(declare-fun c!125536 () Bool)

(assert (=> b!1305089 (= c!125536 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!125537 () Bool)

(declare-fun call!64295 () ListLongMap!20309)

(declare-fun call!64298 () ListLongMap!20309)

(declare-fun bm!64289 () Bool)

(declare-fun call!64296 () ListLongMap!20309)

(declare-fun c!125535 () Bool)

(declare-fun call!64297 () ListLongMap!20309)

(assert (=> bm!64289 (= call!64295 (+!4530 (ite c!125535 call!64298 (ite c!125537 call!64296 call!64297)) (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305090 () Bool)

(declare-fun call!64294 () Bool)

(assert (=> b!1305090 (= e!744511 (not call!64294))))

(declare-fun b!1305091 () Bool)

(declare-fun e!744507 () ListLongMap!20309)

(declare-fun e!744516 () ListLongMap!20309)

(assert (=> b!1305091 (= e!744507 e!744516)))

(assert (=> b!1305091 (= c!125537 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64290 () Bool)

(declare-fun lt!583922 () ListLongMap!20309)

(assert (=> bm!64290 (= call!64294 (contains!8318 lt!583922 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305092 () Bool)

(declare-fun e!744512 () Bool)

(assert (=> b!1305092 (= e!744512 (validKeyInArray!0 (select (arr!41923 _keys!1741) from!2144)))))

(declare-fun b!1305093 () Bool)

(declare-fun c!125540 () Bool)

(assert (=> b!1305093 (= c!125540 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!744510 () ListLongMap!20309)

(assert (=> b!1305093 (= e!744516 e!744510)))

(declare-fun b!1305094 () Bool)

(declare-fun e!744508 () Unit!43134)

(declare-fun lt!583928 () Unit!43134)

(assert (=> b!1305094 (= e!744508 lt!583928)))

(declare-fun lt!583925 () ListLongMap!20309)

(assert (=> b!1305094 (= lt!583925 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583929 () (_ BitVec 64))

(assert (=> b!1305094 (= lt!583929 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583938 () (_ BitVec 64))

(assert (=> b!1305094 (= lt!583938 (select (arr!41923 _keys!1741) from!2144))))

(declare-fun lt!583942 () Unit!43134)

(declare-fun addStillContains!1118 (ListLongMap!20309 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43134)

(assert (=> b!1305094 (= lt!583942 (addStillContains!1118 lt!583925 lt!583929 zeroValue!1387 lt!583938))))

(assert (=> b!1305094 (contains!8318 (+!4530 lt!583925 (tuple2!22645 lt!583929 zeroValue!1387)) lt!583938)))

(declare-fun lt!583939 () Unit!43134)

(assert (=> b!1305094 (= lt!583939 lt!583942)))

(declare-fun lt!583926 () ListLongMap!20309)

(assert (=> b!1305094 (= lt!583926 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583933 () (_ BitVec 64))

(assert (=> b!1305094 (= lt!583933 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583936 () (_ BitVec 64))

(assert (=> b!1305094 (= lt!583936 (select (arr!41923 _keys!1741) from!2144))))

(declare-fun lt!583935 () Unit!43134)

(declare-fun addApplyDifferent!560 (ListLongMap!20309 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43134)

(assert (=> b!1305094 (= lt!583935 (addApplyDifferent!560 lt!583926 lt!583933 minValue!1387 lt!583936))))

(assert (=> b!1305094 (= (apply!1031 (+!4530 lt!583926 (tuple2!22645 lt!583933 minValue!1387)) lt!583936) (apply!1031 lt!583926 lt!583936))))

(declare-fun lt!583934 () Unit!43134)

(assert (=> b!1305094 (= lt!583934 lt!583935)))

(declare-fun lt!583941 () ListLongMap!20309)

(assert (=> b!1305094 (= lt!583941 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583921 () (_ BitVec 64))

(assert (=> b!1305094 (= lt!583921 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583932 () (_ BitVec 64))

(assert (=> b!1305094 (= lt!583932 (select (arr!41923 _keys!1741) from!2144))))

(declare-fun lt!583924 () Unit!43134)

(assert (=> b!1305094 (= lt!583924 (addApplyDifferent!560 lt!583941 lt!583921 zeroValue!1387 lt!583932))))

(assert (=> b!1305094 (= (apply!1031 (+!4530 lt!583941 (tuple2!22645 lt!583921 zeroValue!1387)) lt!583932) (apply!1031 lt!583941 lt!583932))))

(declare-fun lt!583940 () Unit!43134)

(assert (=> b!1305094 (= lt!583940 lt!583924)))

(declare-fun lt!583937 () ListLongMap!20309)

(assert (=> b!1305094 (= lt!583937 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583927 () (_ BitVec 64))

(assert (=> b!1305094 (= lt!583927 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583923 () (_ BitVec 64))

(assert (=> b!1305094 (= lt!583923 (select (arr!41923 _keys!1741) from!2144))))

(assert (=> b!1305094 (= lt!583928 (addApplyDifferent!560 lt!583937 lt!583927 minValue!1387 lt!583923))))

(assert (=> b!1305094 (= (apply!1031 (+!4530 lt!583937 (tuple2!22645 lt!583927 minValue!1387)) lt!583923) (apply!1031 lt!583937 lt!583923))))

(declare-fun b!1305095 () Bool)

(assert (=> b!1305095 (= e!744507 (+!4530 call!64295 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1305096 () Bool)

(declare-fun e!744514 () Bool)

(declare-fun e!744517 () Bool)

(assert (=> b!1305096 (= e!744514 e!744517)))

(declare-fun res!866462 () Bool)

(declare-fun call!64293 () Bool)

(assert (=> b!1305096 (= res!866462 call!64293)))

(assert (=> b!1305096 (=> (not res!866462) (not e!744517))))

(declare-fun b!1305097 () Bool)

(assert (=> b!1305097 (= e!744509 e!744514)))

(declare-fun c!125538 () Bool)

(assert (=> b!1305097 (= c!125538 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64291 () Bool)

(assert (=> bm!64291 (= call!64296 call!64298)))

(declare-fun b!1305098 () Bool)

(assert (=> b!1305098 (= e!744514 (not call!64293))))

(declare-fun bm!64292 () Bool)

(assert (=> bm!64292 (= call!64297 call!64296)))

(declare-fun b!1305099 () Bool)

(declare-fun call!64292 () ListLongMap!20309)

(assert (=> b!1305099 (= e!744516 call!64292)))

(declare-fun b!1305100 () Bool)

(declare-fun e!744515 () Bool)

(declare-fun e!744513 () Bool)

(assert (=> b!1305100 (= e!744515 e!744513)))

(declare-fun res!866465 () Bool)

(assert (=> b!1305100 (=> (not res!866465) (not e!744513))))

(assert (=> b!1305100 (= res!866465 (contains!8318 lt!583922 (select (arr!41923 _keys!1741) from!2144)))))

(assert (=> b!1305100 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42474 _keys!1741)))))

(declare-fun b!1305101 () Bool)

(declare-fun res!866470 () Bool)

(assert (=> b!1305101 (=> (not res!866470) (not e!744509))))

(assert (=> b!1305101 (= res!866470 e!744515)))

(declare-fun res!866463 () Bool)

(assert (=> b!1305101 (=> res!866463 e!744515)))

(assert (=> b!1305101 (= res!866463 (not e!744512))))

(declare-fun res!866469 () Bool)

(assert (=> b!1305101 (=> (not res!866469) (not e!744512))))

(assert (=> b!1305101 (= res!866469 (bvslt from!2144 (size!42474 _keys!1741)))))

(declare-fun b!1305102 () Bool)

(declare-fun e!744518 () Bool)

(assert (=> b!1305102 (= e!744518 (validKeyInArray!0 (select (arr!41923 _keys!1741) from!2144)))))

(declare-fun d!142111 () Bool)

(assert (=> d!142111 e!744509))

(declare-fun res!866466 () Bool)

(assert (=> d!142111 (=> (not res!866466) (not e!744509))))

(assert (=> d!142111 (= res!866466 (or (bvsge from!2144 (size!42474 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42474 _keys!1741)))))))

(declare-fun lt!583930 () ListLongMap!20309)

(assert (=> d!142111 (= lt!583922 lt!583930)))

(declare-fun lt!583931 () Unit!43134)

(assert (=> d!142111 (= lt!583931 e!744508)))

(declare-fun c!125539 () Bool)

(assert (=> d!142111 (= c!125539 e!744518)))

(declare-fun res!866468 () Bool)

(assert (=> d!142111 (=> (not res!866468) (not e!744518))))

(assert (=> d!142111 (= res!866468 (bvslt from!2144 (size!42474 _keys!1741)))))

(assert (=> d!142111 (= lt!583930 e!744507)))

(assert (=> d!142111 (= c!125535 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142111 (validMask!0 mask!2175)))

(assert (=> d!142111 (= (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583922)))

(declare-fun b!1305088 () Bool)

(declare-fun e!744506 () Bool)

(assert (=> b!1305088 (= e!744511 e!744506)))

(declare-fun res!866467 () Bool)

(assert (=> b!1305088 (= res!866467 call!64294)))

(assert (=> b!1305088 (=> (not res!866467) (not e!744506))))

(declare-fun b!1305103 () Bool)

(assert (=> b!1305103 (= e!744513 (= (apply!1031 lt!583922 (select (arr!41923 _keys!1741) from!2144)) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305103 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42473 _values!1445)))))

(assert (=> b!1305103 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42474 _keys!1741)))))

(declare-fun bm!64293 () Bool)

(assert (=> bm!64293 (= call!64293 (contains!8318 lt!583922 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305104 () Bool)

(assert (=> b!1305104 (= e!744510 call!64292)))

(declare-fun b!1305105 () Bool)

(declare-fun Unit!43141 () Unit!43134)

(assert (=> b!1305105 (= e!744508 Unit!43141)))

(declare-fun b!1305106 () Bool)

(assert (=> b!1305106 (= e!744510 call!64297)))

(declare-fun bm!64294 () Bool)

(assert (=> bm!64294 (= call!64298 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305107 () Bool)

(assert (=> b!1305107 (= e!744506 (= (apply!1031 lt!583922 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64295 () Bool)

(assert (=> bm!64295 (= call!64292 call!64295)))

(declare-fun b!1305108 () Bool)

(assert (=> b!1305108 (= e!744517 (= (apply!1031 lt!583922 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(assert (= (and d!142111 c!125535) b!1305095))

(assert (= (and d!142111 (not c!125535)) b!1305091))

(assert (= (and b!1305091 c!125537) b!1305099))

(assert (= (and b!1305091 (not c!125537)) b!1305093))

(assert (= (and b!1305093 c!125540) b!1305104))

(assert (= (and b!1305093 (not c!125540)) b!1305106))

(assert (= (or b!1305104 b!1305106) bm!64292))

(assert (= (or b!1305099 bm!64292) bm!64291))

(assert (= (or b!1305099 b!1305104) bm!64295))

(assert (= (or b!1305095 bm!64291) bm!64294))

(assert (= (or b!1305095 bm!64295) bm!64289))

(assert (= (and d!142111 res!866468) b!1305102))

(assert (= (and d!142111 c!125539) b!1305094))

(assert (= (and d!142111 (not c!125539)) b!1305105))

(assert (= (and d!142111 res!866466) b!1305101))

(assert (= (and b!1305101 res!866469) b!1305092))

(assert (= (and b!1305101 (not res!866463)) b!1305100))

(assert (= (and b!1305100 res!866465) b!1305103))

(assert (= (and b!1305101 res!866470) b!1305089))

(assert (= (and b!1305089 c!125536) b!1305088))

(assert (= (and b!1305089 (not c!125536)) b!1305090))

(assert (= (and b!1305088 res!866467) b!1305107))

(assert (= (or b!1305088 b!1305090) bm!64290))

(assert (= (and b!1305089 res!866464) b!1305097))

(assert (= (and b!1305097 c!125538) b!1305096))

(assert (= (and b!1305097 (not c!125538)) b!1305098))

(assert (= (and b!1305096 res!866462) b!1305108))

(assert (= (or b!1305096 b!1305098) bm!64293))

(declare-fun b_lambda!23273 () Bool)

(assert (=> (not b_lambda!23273) (not b!1305103)))

(assert (=> b!1305103 t!43384))

(declare-fun b_and!47445 () Bool)

(assert (= b_and!47443 (and (=> t!43384 result!23811) b_and!47445)))

(declare-fun m!1196253 () Bool)

(assert (=> bm!64290 m!1196253))

(declare-fun m!1196255 () Bool)

(assert (=> b!1305107 m!1196255))

(assert (=> d!142111 m!1196131))

(declare-fun m!1196257 () Bool)

(assert (=> b!1305108 m!1196257))

(declare-fun m!1196259 () Bool)

(assert (=> b!1305095 m!1196259))

(declare-fun m!1196261 () Bool)

(assert (=> b!1305094 m!1196261))

(declare-fun m!1196263 () Bool)

(assert (=> b!1305094 m!1196263))

(assert (=> b!1305094 m!1196113))

(declare-fun m!1196265 () Bool)

(assert (=> b!1305094 m!1196265))

(declare-fun m!1196267 () Bool)

(assert (=> b!1305094 m!1196267))

(declare-fun m!1196269 () Bool)

(assert (=> b!1305094 m!1196269))

(declare-fun m!1196271 () Bool)

(assert (=> b!1305094 m!1196271))

(declare-fun m!1196273 () Bool)

(assert (=> b!1305094 m!1196273))

(assert (=> b!1305094 m!1196109))

(declare-fun m!1196275 () Bool)

(assert (=> b!1305094 m!1196275))

(assert (=> b!1305094 m!1196265))

(declare-fun m!1196277 () Bool)

(assert (=> b!1305094 m!1196277))

(declare-fun m!1196279 () Bool)

(assert (=> b!1305094 m!1196279))

(assert (=> b!1305094 m!1196273))

(declare-fun m!1196281 () Bool)

(assert (=> b!1305094 m!1196281))

(declare-fun m!1196283 () Bool)

(assert (=> b!1305094 m!1196283))

(declare-fun m!1196285 () Bool)

(assert (=> b!1305094 m!1196285))

(assert (=> b!1305094 m!1196285))

(declare-fun m!1196287 () Bool)

(assert (=> b!1305094 m!1196287))

(assert (=> b!1305094 m!1196277))

(declare-fun m!1196289 () Bool)

(assert (=> b!1305094 m!1196289))

(assert (=> bm!64294 m!1196113))

(declare-fun m!1196291 () Bool)

(assert (=> bm!64293 m!1196291))

(assert (=> b!1305103 m!1196221))

(assert (=> b!1305103 m!1196223))

(assert (=> b!1305103 m!1196221))

(assert (=> b!1305103 m!1196225))

(assert (=> b!1305103 m!1196109))

(declare-fun m!1196293 () Bool)

(assert (=> b!1305103 m!1196293))

(assert (=> b!1305103 m!1196109))

(assert (=> b!1305103 m!1196223))

(assert (=> b!1305102 m!1196109))

(assert (=> b!1305102 m!1196109))

(assert (=> b!1305102 m!1196111))

(assert (=> b!1305100 m!1196109))

(assert (=> b!1305100 m!1196109))

(declare-fun m!1196295 () Bool)

(assert (=> b!1305100 m!1196295))

(declare-fun m!1196297 () Bool)

(assert (=> bm!64289 m!1196297))

(assert (=> b!1305092 m!1196109))

(assert (=> b!1305092 m!1196109))

(assert (=> b!1305092 m!1196111))

(assert (=> b!1304888 d!142111))

(declare-fun d!142113 () Bool)

(assert (=> d!142113 (= (validKeyInArray!0 (select (arr!41923 _keys!1741) from!2144)) (and (not (= (select (arr!41923 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41923 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304892 d!142113))

(declare-fun b!1305117 () Bool)

(declare-fun e!744525 () Bool)

(declare-fun call!64301 () Bool)

(assert (=> b!1305117 (= e!744525 call!64301)))

(declare-fun d!142115 () Bool)

(declare-fun res!866476 () Bool)

(declare-fun e!744526 () Bool)

(assert (=> d!142115 (=> res!866476 e!744526)))

(assert (=> d!142115 (= res!866476 (bvsge #b00000000000000000000000000000000 (size!42474 _keys!1741)))))

(assert (=> d!142115 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744526)))

(declare-fun bm!64298 () Bool)

(assert (=> bm!64298 (= call!64301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1305118 () Bool)

(declare-fun e!744527 () Bool)

(assert (=> b!1305118 (= e!744527 call!64301)))

(declare-fun b!1305119 () Bool)

(assert (=> b!1305119 (= e!744526 e!744525)))

(declare-fun c!125543 () Bool)

(assert (=> b!1305119 (= c!125543 (validKeyInArray!0 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305120 () Bool)

(assert (=> b!1305120 (= e!744525 e!744527)))

(declare-fun lt!583951 () (_ BitVec 64))

(assert (=> b!1305120 (= lt!583951 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583950 () Unit!43134)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86873 (_ BitVec 64) (_ BitVec 32)) Unit!43134)

(assert (=> b!1305120 (= lt!583950 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583951 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1305120 (arrayContainsKey!0 _keys!1741 lt!583951 #b00000000000000000000000000000000)))

(declare-fun lt!583949 () Unit!43134)

(assert (=> b!1305120 (= lt!583949 lt!583950)))

(declare-fun res!866475 () Bool)

(declare-datatypes ((SeekEntryResult!9981 0))(
  ( (MissingZero!9981 (index!42295 (_ BitVec 32))) (Found!9981 (index!42296 (_ BitVec 32))) (Intermediate!9981 (undefined!10793 Bool) (index!42297 (_ BitVec 32)) (x!115770 (_ BitVec 32))) (Undefined!9981) (MissingVacant!9981 (index!42298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86873 (_ BitVec 32)) SeekEntryResult!9981)

(assert (=> b!1305120 (= res!866475 (= (seekEntryOrOpen!0 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9981 #b00000000000000000000000000000000)))))

(assert (=> b!1305120 (=> (not res!866475) (not e!744527))))

(assert (= (and d!142115 (not res!866476)) b!1305119))

(assert (= (and b!1305119 c!125543) b!1305120))

(assert (= (and b!1305119 (not c!125543)) b!1305117))

(assert (= (and b!1305120 res!866475) b!1305118))

(assert (= (or b!1305118 b!1305117) bm!64298))

(declare-fun m!1196299 () Bool)

(assert (=> bm!64298 m!1196299))

(assert (=> b!1305119 m!1196203))

(assert (=> b!1305119 m!1196203))

(assert (=> b!1305119 m!1196207))

(assert (=> b!1305120 m!1196203))

(declare-fun m!1196301 () Bool)

(assert (=> b!1305120 m!1196301))

(declare-fun m!1196303 () Bool)

(assert (=> b!1305120 m!1196303))

(assert (=> b!1305120 m!1196203))

(declare-fun m!1196305 () Bool)

(assert (=> b!1305120 m!1196305))

(assert (=> b!1304897 d!142115))

(declare-fun b!1305128 () Bool)

(declare-fun e!744533 () Bool)

(assert (=> b!1305128 (= e!744533 tp_is_empty!34909)))

(declare-fun mapNonEmpty!53965 () Bool)

(declare-fun mapRes!53965 () Bool)

(declare-fun tp!102973 () Bool)

(declare-fun e!744532 () Bool)

(assert (=> mapNonEmpty!53965 (= mapRes!53965 (and tp!102973 e!744532))))

(declare-fun mapRest!53965 () (Array (_ BitVec 32) ValueCell!16556))

(declare-fun mapKey!53965 () (_ BitVec 32))

(declare-fun mapValue!53965 () ValueCell!16556)

(assert (=> mapNonEmpty!53965 (= mapRest!53956 (store mapRest!53965 mapKey!53965 mapValue!53965))))

(declare-fun mapIsEmpty!53965 () Bool)

(assert (=> mapIsEmpty!53965 mapRes!53965))

(declare-fun condMapEmpty!53965 () Bool)

(declare-fun mapDefault!53965 () ValueCell!16556)

(assert (=> mapNonEmpty!53956 (= condMapEmpty!53965 (= mapRest!53956 ((as const (Array (_ BitVec 32) ValueCell!16556)) mapDefault!53965)))))

(assert (=> mapNonEmpty!53956 (= tp!102958 (and e!744533 mapRes!53965))))

(declare-fun b!1305127 () Bool)

(assert (=> b!1305127 (= e!744532 tp_is_empty!34909)))

(assert (= (and mapNonEmpty!53956 condMapEmpty!53965) mapIsEmpty!53965))

(assert (= (and mapNonEmpty!53956 (not condMapEmpty!53965)) mapNonEmpty!53965))

(assert (= (and mapNonEmpty!53965 ((_ is ValueCellFull!16556) mapValue!53965)) b!1305127))

(assert (= (and mapNonEmpty!53956 ((_ is ValueCellFull!16556) mapDefault!53965)) b!1305128))

(declare-fun m!1196307 () Bool)

(assert (=> mapNonEmpty!53965 m!1196307))

(declare-fun b_lambda!23275 () Bool)

(assert (= b_lambda!23273 (or (and start!110294 b_free!29269) b_lambda!23275)))

(declare-fun b_lambda!23277 () Bool)

(assert (= b_lambda!23271 (or (and start!110294 b_free!29269) b_lambda!23277)))

(declare-fun b_lambda!23279 () Bool)

(assert (= b_lambda!23269 (or (and start!110294 b_free!29269) b_lambda!23279)))

(check-sat (not b!1305038) (not b!1304984) (not d!142101) (not b!1305103) (not b!1305035) (not bm!64293) tp_is_empty!34909 (not b_lambda!23275) (not d!142095) (not b!1304986) (not b!1305119) (not bm!64289) (not b!1305032) (not b_lambda!23279) (not bm!64298) (not b!1305039) (not b!1305102) (not b!1305004) (not b!1305092) (not d!142111) (not b!1305045) (not bm!64274) (not b!1305108) (not d!142109) (not b!1304997) (not b!1305033) (not bm!64290) (not d!142093) (not d!142099) (not b_next!29269) (not bm!64271) (not mapNonEmpty!53965) (not bm!64294) (not b!1305043) (not b!1305095) (not b!1305000) (not b!1305029) (not b_lambda!23277) (not b!1305002) (not b!1305001) (not b!1305040) (not b!1305100) (not b!1305120) (not b!1305037) (not b!1305107) b_and!47445 (not b!1305094))
(check-sat b_and!47445 (not b_next!29269))
(get-model)

(declare-fun d!142117 () Bool)

(declare-fun isEmpty!1067 (Option!752) Bool)

(assert (=> d!142117 (= (isDefined!510 (getValueByKey!701 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1067 (getValueByKey!701 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37141 () Bool)

(assert (= bs!37141 d!142117))

(assert (=> bs!37141 m!1196249))

(declare-fun m!1196309 () Bool)

(assert (=> bs!37141 m!1196309))

(assert (=> b!1305045 d!142117))

(declare-fun b!1305139 () Bool)

(declare-fun e!744539 () Option!752)

(assert (=> b!1305139 (= e!744539 (getValueByKey!701 (t!43377 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun b!1305140 () Bool)

(assert (=> b!1305140 (= e!744539 None!750)))

(declare-fun b!1305138 () Bool)

(declare-fun e!744538 () Option!752)

(assert (=> b!1305138 (= e!744538 e!744539)))

(declare-fun c!125549 () Bool)

(assert (=> b!1305138 (= c!125549 (and ((_ is Cons!29787) (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11333 (h!31005 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun d!142119 () Bool)

(declare-fun c!125548 () Bool)

(assert (=> d!142119 (= c!125548 (and ((_ is Cons!29787) (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11333 (h!31005 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!142119 (= (getValueByKey!701 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744538)))

(declare-fun b!1305137 () Bool)

(assert (=> b!1305137 (= e!744538 (Some!751 (_2!11333 (h!31005 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(assert (= (and d!142119 c!125548) b!1305137))

(assert (= (and d!142119 (not c!125548)) b!1305138))

(assert (= (and b!1305138 c!125549) b!1305139))

(assert (= (and b!1305138 (not c!125549)) b!1305140))

(declare-fun m!1196311 () Bool)

(assert (=> b!1305139 m!1196311))

(assert (=> b!1305045 d!142119))

(declare-fun d!142121 () Bool)

(declare-fun e!744542 () Bool)

(assert (=> d!142121 e!744542))

(declare-fun res!866482 () Bool)

(assert (=> d!142121 (=> (not res!866482) (not e!744542))))

(declare-fun lt!583963 () ListLongMap!20309)

(assert (=> d!142121 (= res!866482 (contains!8318 lt!583963 (_1!11333 (tuple2!22645 lt!583933 minValue!1387))))))

(declare-fun lt!583961 () List!29791)

(assert (=> d!142121 (= lt!583963 (ListLongMap!20310 lt!583961))))

(declare-fun lt!583962 () Unit!43134)

(declare-fun lt!583960 () Unit!43134)

(assert (=> d!142121 (= lt!583962 lt!583960)))

(assert (=> d!142121 (= (getValueByKey!701 lt!583961 (_1!11333 (tuple2!22645 lt!583933 minValue!1387))) (Some!751 (_2!11333 (tuple2!22645 lt!583933 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!352 (List!29791 (_ BitVec 64) V!51649) Unit!43134)

(assert (=> d!142121 (= lt!583960 (lemmaContainsTupThenGetReturnValue!352 lt!583961 (_1!11333 (tuple2!22645 lt!583933 minValue!1387)) (_2!11333 (tuple2!22645 lt!583933 minValue!1387))))))

(declare-fun insertStrictlySorted!481 (List!29791 (_ BitVec 64) V!51649) List!29791)

(assert (=> d!142121 (= lt!583961 (insertStrictlySorted!481 (toList!10170 lt!583926) (_1!11333 (tuple2!22645 lt!583933 minValue!1387)) (_2!11333 (tuple2!22645 lt!583933 minValue!1387))))))

(assert (=> d!142121 (= (+!4530 lt!583926 (tuple2!22645 lt!583933 minValue!1387)) lt!583963)))

(declare-fun b!1305145 () Bool)

(declare-fun res!866481 () Bool)

(assert (=> b!1305145 (=> (not res!866481) (not e!744542))))

(assert (=> b!1305145 (= res!866481 (= (getValueByKey!701 (toList!10170 lt!583963) (_1!11333 (tuple2!22645 lt!583933 minValue!1387))) (Some!751 (_2!11333 (tuple2!22645 lt!583933 minValue!1387)))))))

(declare-fun b!1305146 () Bool)

(declare-fun contains!8322 (List!29791 tuple2!22644) Bool)

(assert (=> b!1305146 (= e!744542 (contains!8322 (toList!10170 lt!583963) (tuple2!22645 lt!583933 minValue!1387)))))

(assert (= (and d!142121 res!866482) b!1305145))

(assert (= (and b!1305145 res!866481) b!1305146))

(declare-fun m!1196313 () Bool)

(assert (=> d!142121 m!1196313))

(declare-fun m!1196315 () Bool)

(assert (=> d!142121 m!1196315))

(declare-fun m!1196317 () Bool)

(assert (=> d!142121 m!1196317))

(declare-fun m!1196319 () Bool)

(assert (=> d!142121 m!1196319))

(declare-fun m!1196321 () Bool)

(assert (=> b!1305145 m!1196321))

(declare-fun m!1196323 () Bool)

(assert (=> b!1305146 m!1196323))

(assert (=> b!1305094 d!142121))

(declare-fun d!142123 () Bool)

(declare-fun get!21218 (Option!752) V!51649)

(assert (=> d!142123 (= (apply!1031 (+!4530 lt!583941 (tuple2!22645 lt!583921 zeroValue!1387)) lt!583932) (get!21218 (getValueByKey!701 (toList!10170 (+!4530 lt!583941 (tuple2!22645 lt!583921 zeroValue!1387))) lt!583932)))))

(declare-fun bs!37142 () Bool)

(assert (= bs!37142 d!142123))

(declare-fun m!1196325 () Bool)

(assert (=> bs!37142 m!1196325))

(assert (=> bs!37142 m!1196325))

(declare-fun m!1196327 () Bool)

(assert (=> bs!37142 m!1196327))

(assert (=> b!1305094 d!142123))

(declare-fun d!142125 () Bool)

(declare-fun e!744543 () Bool)

(assert (=> d!142125 e!744543))

(declare-fun res!866484 () Bool)

(assert (=> d!142125 (=> (not res!866484) (not e!744543))))

(declare-fun lt!583967 () ListLongMap!20309)

(assert (=> d!142125 (= res!866484 (contains!8318 lt!583967 (_1!11333 (tuple2!22645 lt!583921 zeroValue!1387))))))

(declare-fun lt!583965 () List!29791)

(assert (=> d!142125 (= lt!583967 (ListLongMap!20310 lt!583965))))

(declare-fun lt!583966 () Unit!43134)

(declare-fun lt!583964 () Unit!43134)

(assert (=> d!142125 (= lt!583966 lt!583964)))

(assert (=> d!142125 (= (getValueByKey!701 lt!583965 (_1!11333 (tuple2!22645 lt!583921 zeroValue!1387))) (Some!751 (_2!11333 (tuple2!22645 lt!583921 zeroValue!1387))))))

(assert (=> d!142125 (= lt!583964 (lemmaContainsTupThenGetReturnValue!352 lt!583965 (_1!11333 (tuple2!22645 lt!583921 zeroValue!1387)) (_2!11333 (tuple2!22645 lt!583921 zeroValue!1387))))))

(assert (=> d!142125 (= lt!583965 (insertStrictlySorted!481 (toList!10170 lt!583941) (_1!11333 (tuple2!22645 lt!583921 zeroValue!1387)) (_2!11333 (tuple2!22645 lt!583921 zeroValue!1387))))))

(assert (=> d!142125 (= (+!4530 lt!583941 (tuple2!22645 lt!583921 zeroValue!1387)) lt!583967)))

(declare-fun b!1305147 () Bool)

(declare-fun res!866483 () Bool)

(assert (=> b!1305147 (=> (not res!866483) (not e!744543))))

(assert (=> b!1305147 (= res!866483 (= (getValueByKey!701 (toList!10170 lt!583967) (_1!11333 (tuple2!22645 lt!583921 zeroValue!1387))) (Some!751 (_2!11333 (tuple2!22645 lt!583921 zeroValue!1387)))))))

(declare-fun b!1305148 () Bool)

(assert (=> b!1305148 (= e!744543 (contains!8322 (toList!10170 lt!583967) (tuple2!22645 lt!583921 zeroValue!1387)))))

(assert (= (and d!142125 res!866484) b!1305147))

(assert (= (and b!1305147 res!866483) b!1305148))

(declare-fun m!1196329 () Bool)

(assert (=> d!142125 m!1196329))

(declare-fun m!1196331 () Bool)

(assert (=> d!142125 m!1196331))

(declare-fun m!1196333 () Bool)

(assert (=> d!142125 m!1196333))

(declare-fun m!1196335 () Bool)

(assert (=> d!142125 m!1196335))

(declare-fun m!1196337 () Bool)

(assert (=> b!1305147 m!1196337))

(declare-fun m!1196339 () Bool)

(assert (=> b!1305148 m!1196339))

(assert (=> b!1305094 d!142125))

(declare-fun d!142127 () Bool)

(assert (=> d!142127 (= (apply!1031 (+!4530 lt!583926 (tuple2!22645 lt!583933 minValue!1387)) lt!583936) (apply!1031 lt!583926 lt!583936))))

(declare-fun lt!583970 () Unit!43134)

(declare-fun choose!1925 (ListLongMap!20309 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43134)

(assert (=> d!142127 (= lt!583970 (choose!1925 lt!583926 lt!583933 minValue!1387 lt!583936))))

(declare-fun e!744546 () Bool)

(assert (=> d!142127 e!744546))

(declare-fun res!866487 () Bool)

(assert (=> d!142127 (=> (not res!866487) (not e!744546))))

(assert (=> d!142127 (= res!866487 (contains!8318 lt!583926 lt!583936))))

(assert (=> d!142127 (= (addApplyDifferent!560 lt!583926 lt!583933 minValue!1387 lt!583936) lt!583970)))

(declare-fun b!1305152 () Bool)

(assert (=> b!1305152 (= e!744546 (not (= lt!583936 lt!583933)))))

(assert (= (and d!142127 res!866487) b!1305152))

(declare-fun m!1196341 () Bool)

(assert (=> d!142127 m!1196341))

(assert (=> d!142127 m!1196273))

(assert (=> d!142127 m!1196281))

(assert (=> d!142127 m!1196261))

(assert (=> d!142127 m!1196273))

(declare-fun m!1196343 () Bool)

(assert (=> d!142127 m!1196343))

(assert (=> b!1305094 d!142127))

(assert (=> b!1305094 d!142101))

(declare-fun d!142129 () Bool)

(assert (=> d!142129 (= (apply!1031 (+!4530 lt!583926 (tuple2!22645 lt!583933 minValue!1387)) lt!583936) (get!21218 (getValueByKey!701 (toList!10170 (+!4530 lt!583926 (tuple2!22645 lt!583933 minValue!1387))) lt!583936)))))

(declare-fun bs!37143 () Bool)

(assert (= bs!37143 d!142129))

(declare-fun m!1196345 () Bool)

(assert (=> bs!37143 m!1196345))

(assert (=> bs!37143 m!1196345))

(declare-fun m!1196347 () Bool)

(assert (=> bs!37143 m!1196347))

(assert (=> b!1305094 d!142129))

(declare-fun d!142131 () Bool)

(assert (=> d!142131 (= (apply!1031 (+!4530 lt!583941 (tuple2!22645 lt!583921 zeroValue!1387)) lt!583932) (apply!1031 lt!583941 lt!583932))))

(declare-fun lt!583971 () Unit!43134)

(assert (=> d!142131 (= lt!583971 (choose!1925 lt!583941 lt!583921 zeroValue!1387 lt!583932))))

(declare-fun e!744547 () Bool)

(assert (=> d!142131 e!744547))

(declare-fun res!866488 () Bool)

(assert (=> d!142131 (=> (not res!866488) (not e!744547))))

(assert (=> d!142131 (= res!866488 (contains!8318 lt!583941 lt!583932))))

(assert (=> d!142131 (= (addApplyDifferent!560 lt!583941 lt!583921 zeroValue!1387 lt!583932) lt!583971)))

(declare-fun b!1305153 () Bool)

(assert (=> b!1305153 (= e!744547 (not (= lt!583932 lt!583921)))))

(assert (= (and d!142131 res!866488) b!1305153))

(declare-fun m!1196349 () Bool)

(assert (=> d!142131 m!1196349))

(assert (=> d!142131 m!1196277))

(assert (=> d!142131 m!1196279))

(assert (=> d!142131 m!1196289))

(assert (=> d!142131 m!1196277))

(declare-fun m!1196351 () Bool)

(assert (=> d!142131 m!1196351))

(assert (=> b!1305094 d!142131))

(declare-fun d!142133 () Bool)

(declare-fun e!744548 () Bool)

(assert (=> d!142133 e!744548))

(declare-fun res!866489 () Bool)

(assert (=> d!142133 (=> res!866489 e!744548)))

(declare-fun lt!583973 () Bool)

(assert (=> d!142133 (= res!866489 (not lt!583973))))

(declare-fun lt!583974 () Bool)

(assert (=> d!142133 (= lt!583973 lt!583974)))

(declare-fun lt!583972 () Unit!43134)

(declare-fun e!744549 () Unit!43134)

(assert (=> d!142133 (= lt!583972 e!744549)))

(declare-fun c!125550 () Bool)

(assert (=> d!142133 (= c!125550 lt!583974)))

(assert (=> d!142133 (= lt!583974 (containsKey!727 (toList!10170 (+!4530 lt!583925 (tuple2!22645 lt!583929 zeroValue!1387))) lt!583938))))

(assert (=> d!142133 (= (contains!8318 (+!4530 lt!583925 (tuple2!22645 lt!583929 zeroValue!1387)) lt!583938) lt!583973)))

(declare-fun b!1305154 () Bool)

(declare-fun lt!583975 () Unit!43134)

(assert (=> b!1305154 (= e!744549 lt!583975)))

(assert (=> b!1305154 (= lt!583975 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 (+!4530 lt!583925 (tuple2!22645 lt!583929 zeroValue!1387))) lt!583938))))

(assert (=> b!1305154 (isDefined!510 (getValueByKey!701 (toList!10170 (+!4530 lt!583925 (tuple2!22645 lt!583929 zeroValue!1387))) lt!583938))))

(declare-fun b!1305155 () Bool)

(declare-fun Unit!43142 () Unit!43134)

(assert (=> b!1305155 (= e!744549 Unit!43142)))

(declare-fun b!1305156 () Bool)

(assert (=> b!1305156 (= e!744548 (isDefined!510 (getValueByKey!701 (toList!10170 (+!4530 lt!583925 (tuple2!22645 lt!583929 zeroValue!1387))) lt!583938)))))

(assert (= (and d!142133 c!125550) b!1305154))

(assert (= (and d!142133 (not c!125550)) b!1305155))

(assert (= (and d!142133 (not res!866489)) b!1305156))

(declare-fun m!1196353 () Bool)

(assert (=> d!142133 m!1196353))

(declare-fun m!1196355 () Bool)

(assert (=> b!1305154 m!1196355))

(declare-fun m!1196357 () Bool)

(assert (=> b!1305154 m!1196357))

(assert (=> b!1305154 m!1196357))

(declare-fun m!1196359 () Bool)

(assert (=> b!1305154 m!1196359))

(assert (=> b!1305156 m!1196357))

(assert (=> b!1305156 m!1196357))

(assert (=> b!1305156 m!1196359))

(assert (=> b!1305094 d!142133))

(declare-fun d!142135 () Bool)

(assert (=> d!142135 (= (apply!1031 (+!4530 lt!583937 (tuple2!22645 lt!583927 minValue!1387)) lt!583923) (get!21218 (getValueByKey!701 (toList!10170 (+!4530 lt!583937 (tuple2!22645 lt!583927 minValue!1387))) lt!583923)))))

(declare-fun bs!37144 () Bool)

(assert (= bs!37144 d!142135))

(declare-fun m!1196361 () Bool)

(assert (=> bs!37144 m!1196361))

(assert (=> bs!37144 m!1196361))

(declare-fun m!1196363 () Bool)

(assert (=> bs!37144 m!1196363))

(assert (=> b!1305094 d!142135))

(declare-fun d!142137 () Bool)

(declare-fun e!744550 () Bool)

(assert (=> d!142137 e!744550))

(declare-fun res!866491 () Bool)

(assert (=> d!142137 (=> (not res!866491) (not e!744550))))

(declare-fun lt!583979 () ListLongMap!20309)

(assert (=> d!142137 (= res!866491 (contains!8318 lt!583979 (_1!11333 (tuple2!22645 lt!583929 zeroValue!1387))))))

(declare-fun lt!583977 () List!29791)

(assert (=> d!142137 (= lt!583979 (ListLongMap!20310 lt!583977))))

(declare-fun lt!583978 () Unit!43134)

(declare-fun lt!583976 () Unit!43134)

(assert (=> d!142137 (= lt!583978 lt!583976)))

(assert (=> d!142137 (= (getValueByKey!701 lt!583977 (_1!11333 (tuple2!22645 lt!583929 zeroValue!1387))) (Some!751 (_2!11333 (tuple2!22645 lt!583929 zeroValue!1387))))))

(assert (=> d!142137 (= lt!583976 (lemmaContainsTupThenGetReturnValue!352 lt!583977 (_1!11333 (tuple2!22645 lt!583929 zeroValue!1387)) (_2!11333 (tuple2!22645 lt!583929 zeroValue!1387))))))

(assert (=> d!142137 (= lt!583977 (insertStrictlySorted!481 (toList!10170 lt!583925) (_1!11333 (tuple2!22645 lt!583929 zeroValue!1387)) (_2!11333 (tuple2!22645 lt!583929 zeroValue!1387))))))

(assert (=> d!142137 (= (+!4530 lt!583925 (tuple2!22645 lt!583929 zeroValue!1387)) lt!583979)))

(declare-fun b!1305157 () Bool)

(declare-fun res!866490 () Bool)

(assert (=> b!1305157 (=> (not res!866490) (not e!744550))))

(assert (=> b!1305157 (= res!866490 (= (getValueByKey!701 (toList!10170 lt!583979) (_1!11333 (tuple2!22645 lt!583929 zeroValue!1387))) (Some!751 (_2!11333 (tuple2!22645 lt!583929 zeroValue!1387)))))))

(declare-fun b!1305158 () Bool)

(assert (=> b!1305158 (= e!744550 (contains!8322 (toList!10170 lt!583979) (tuple2!22645 lt!583929 zeroValue!1387)))))

(assert (= (and d!142137 res!866491) b!1305157))

(assert (= (and b!1305157 res!866490) b!1305158))

(declare-fun m!1196365 () Bool)

(assert (=> d!142137 m!1196365))

(declare-fun m!1196367 () Bool)

(assert (=> d!142137 m!1196367))

(declare-fun m!1196369 () Bool)

(assert (=> d!142137 m!1196369))

(declare-fun m!1196371 () Bool)

(assert (=> d!142137 m!1196371))

(declare-fun m!1196373 () Bool)

(assert (=> b!1305157 m!1196373))

(declare-fun m!1196375 () Bool)

(assert (=> b!1305158 m!1196375))

(assert (=> b!1305094 d!142137))

(declare-fun d!142139 () Bool)

(assert (=> d!142139 (= (apply!1031 lt!583926 lt!583936) (get!21218 (getValueByKey!701 (toList!10170 lt!583926) lt!583936)))))

(declare-fun bs!37145 () Bool)

(assert (= bs!37145 d!142139))

(declare-fun m!1196377 () Bool)

(assert (=> bs!37145 m!1196377))

(assert (=> bs!37145 m!1196377))

(declare-fun m!1196379 () Bool)

(assert (=> bs!37145 m!1196379))

(assert (=> b!1305094 d!142139))

(declare-fun d!142141 () Bool)

(assert (=> d!142141 (= (apply!1031 (+!4530 lt!583937 (tuple2!22645 lt!583927 minValue!1387)) lt!583923) (apply!1031 lt!583937 lt!583923))))

(declare-fun lt!583980 () Unit!43134)

(assert (=> d!142141 (= lt!583980 (choose!1925 lt!583937 lt!583927 minValue!1387 lt!583923))))

(declare-fun e!744551 () Bool)

(assert (=> d!142141 e!744551))

(declare-fun res!866492 () Bool)

(assert (=> d!142141 (=> (not res!866492) (not e!744551))))

(assert (=> d!142141 (= res!866492 (contains!8318 lt!583937 lt!583923))))

(assert (=> d!142141 (= (addApplyDifferent!560 lt!583937 lt!583927 minValue!1387 lt!583923) lt!583980)))

(declare-fun b!1305159 () Bool)

(assert (=> b!1305159 (= e!744551 (not (= lt!583923 lt!583927)))))

(assert (= (and d!142141 res!866492) b!1305159))

(declare-fun m!1196381 () Bool)

(assert (=> d!142141 m!1196381))

(assert (=> d!142141 m!1196265))

(assert (=> d!142141 m!1196267))

(assert (=> d!142141 m!1196275))

(assert (=> d!142141 m!1196265))

(declare-fun m!1196383 () Bool)

(assert (=> d!142141 m!1196383))

(assert (=> b!1305094 d!142141))

(declare-fun d!142143 () Bool)

(declare-fun e!744552 () Bool)

(assert (=> d!142143 e!744552))

(declare-fun res!866494 () Bool)

(assert (=> d!142143 (=> (not res!866494) (not e!744552))))

(declare-fun lt!583984 () ListLongMap!20309)

(assert (=> d!142143 (= res!866494 (contains!8318 lt!583984 (_1!11333 (tuple2!22645 lt!583927 minValue!1387))))))

(declare-fun lt!583982 () List!29791)

(assert (=> d!142143 (= lt!583984 (ListLongMap!20310 lt!583982))))

(declare-fun lt!583983 () Unit!43134)

(declare-fun lt!583981 () Unit!43134)

(assert (=> d!142143 (= lt!583983 lt!583981)))

(assert (=> d!142143 (= (getValueByKey!701 lt!583982 (_1!11333 (tuple2!22645 lt!583927 minValue!1387))) (Some!751 (_2!11333 (tuple2!22645 lt!583927 minValue!1387))))))

(assert (=> d!142143 (= lt!583981 (lemmaContainsTupThenGetReturnValue!352 lt!583982 (_1!11333 (tuple2!22645 lt!583927 minValue!1387)) (_2!11333 (tuple2!22645 lt!583927 minValue!1387))))))

(assert (=> d!142143 (= lt!583982 (insertStrictlySorted!481 (toList!10170 lt!583937) (_1!11333 (tuple2!22645 lt!583927 minValue!1387)) (_2!11333 (tuple2!22645 lt!583927 minValue!1387))))))

(assert (=> d!142143 (= (+!4530 lt!583937 (tuple2!22645 lt!583927 minValue!1387)) lt!583984)))

(declare-fun b!1305160 () Bool)

(declare-fun res!866493 () Bool)

(assert (=> b!1305160 (=> (not res!866493) (not e!744552))))

(assert (=> b!1305160 (= res!866493 (= (getValueByKey!701 (toList!10170 lt!583984) (_1!11333 (tuple2!22645 lt!583927 minValue!1387))) (Some!751 (_2!11333 (tuple2!22645 lt!583927 minValue!1387)))))))

(declare-fun b!1305161 () Bool)

(assert (=> b!1305161 (= e!744552 (contains!8322 (toList!10170 lt!583984) (tuple2!22645 lt!583927 minValue!1387)))))

(assert (= (and d!142143 res!866494) b!1305160))

(assert (= (and b!1305160 res!866493) b!1305161))

(declare-fun m!1196385 () Bool)

(assert (=> d!142143 m!1196385))

(declare-fun m!1196387 () Bool)

(assert (=> d!142143 m!1196387))

(declare-fun m!1196389 () Bool)

(assert (=> d!142143 m!1196389))

(declare-fun m!1196391 () Bool)

(assert (=> d!142143 m!1196391))

(declare-fun m!1196393 () Bool)

(assert (=> b!1305160 m!1196393))

(declare-fun m!1196395 () Bool)

(assert (=> b!1305161 m!1196395))

(assert (=> b!1305094 d!142143))

(declare-fun d!142145 () Bool)

(assert (=> d!142145 (contains!8318 (+!4530 lt!583925 (tuple2!22645 lt!583929 zeroValue!1387)) lt!583938)))

(declare-fun lt!583987 () Unit!43134)

(declare-fun choose!1926 (ListLongMap!20309 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43134)

(assert (=> d!142145 (= lt!583987 (choose!1926 lt!583925 lt!583929 zeroValue!1387 lt!583938))))

(assert (=> d!142145 (contains!8318 lt!583925 lt!583938)))

(assert (=> d!142145 (= (addStillContains!1118 lt!583925 lt!583929 zeroValue!1387 lt!583938) lt!583987)))

(declare-fun bs!37146 () Bool)

(assert (= bs!37146 d!142145))

(assert (=> bs!37146 m!1196285))

(assert (=> bs!37146 m!1196285))

(assert (=> bs!37146 m!1196287))

(declare-fun m!1196397 () Bool)

(assert (=> bs!37146 m!1196397))

(declare-fun m!1196399 () Bool)

(assert (=> bs!37146 m!1196399))

(assert (=> b!1305094 d!142145))

(declare-fun d!142147 () Bool)

(assert (=> d!142147 (= (apply!1031 lt!583941 lt!583932) (get!21218 (getValueByKey!701 (toList!10170 lt!583941) lt!583932)))))

(declare-fun bs!37147 () Bool)

(assert (= bs!37147 d!142147))

(declare-fun m!1196401 () Bool)

(assert (=> bs!37147 m!1196401))

(assert (=> bs!37147 m!1196401))

(declare-fun m!1196403 () Bool)

(assert (=> bs!37147 m!1196403))

(assert (=> b!1305094 d!142147))

(declare-fun d!142149 () Bool)

(assert (=> d!142149 (= (apply!1031 lt!583937 lt!583923) (get!21218 (getValueByKey!701 (toList!10170 lt!583937) lt!583923)))))

(declare-fun bs!37148 () Bool)

(assert (= bs!37148 d!142149))

(declare-fun m!1196405 () Bool)

(assert (=> bs!37148 m!1196405))

(assert (=> bs!37148 m!1196405))

(declare-fun m!1196407 () Bool)

(assert (=> bs!37148 m!1196407))

(assert (=> b!1305094 d!142149))

(declare-fun d!142151 () Bool)

(assert (=> d!142151 (isDefined!510 (getValueByKey!701 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205))))

(declare-fun lt!583990 () Unit!43134)

(declare-fun choose!1927 (List!29791 (_ BitVec 64)) Unit!43134)

(assert (=> d!142151 (= lt!583990 (choose!1927 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205))))

(declare-fun e!744555 () Bool)

(assert (=> d!142151 e!744555))

(declare-fun res!866497 () Bool)

(assert (=> d!142151 (=> (not res!866497) (not e!744555))))

(declare-fun isStrictlySorted!861 (List!29791) Bool)

(assert (=> d!142151 (= res!866497 (isStrictlySorted!861 (toList!10170 (ListLongMap!20310 Nil!29788))))))

(assert (=> d!142151 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205) lt!583990)))

(declare-fun b!1305165 () Bool)

(assert (=> b!1305165 (= e!744555 (containsKey!727 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205))))

(assert (= (and d!142151 res!866497) b!1305165))

(assert (=> d!142151 m!1196197))

(assert (=> d!142151 m!1196197))

(assert (=> d!142151 m!1196199))

(declare-fun m!1196409 () Bool)

(assert (=> d!142151 m!1196409))

(declare-fun m!1196411 () Bool)

(assert (=> d!142151 m!1196411))

(assert (=> b!1305165 m!1196193))

(assert (=> b!1304984 d!142151))

(declare-fun d!142153 () Bool)

(assert (=> d!142153 (= (isDefined!510 (getValueByKey!701 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205)) (not (isEmpty!1067 (getValueByKey!701 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205))))))

(declare-fun bs!37149 () Bool)

(assert (= bs!37149 d!142153))

(assert (=> bs!37149 m!1196197))

(declare-fun m!1196413 () Bool)

(assert (=> bs!37149 m!1196413))

(assert (=> b!1304984 d!142153))

(declare-fun b!1305168 () Bool)

(declare-fun e!744557 () Option!752)

(assert (=> b!1305168 (= e!744557 (getValueByKey!701 (t!43377 (toList!10170 (ListLongMap!20310 Nil!29788))) k0!1205))))

(declare-fun b!1305169 () Bool)

(assert (=> b!1305169 (= e!744557 None!750)))

(declare-fun b!1305167 () Bool)

(declare-fun e!744556 () Option!752)

(assert (=> b!1305167 (= e!744556 e!744557)))

(declare-fun c!125552 () Bool)

(assert (=> b!1305167 (= c!125552 (and ((_ is Cons!29787) (toList!10170 (ListLongMap!20310 Nil!29788))) (not (= (_1!11333 (h!31005 (toList!10170 (ListLongMap!20310 Nil!29788)))) k0!1205))))))

(declare-fun d!142155 () Bool)

(declare-fun c!125551 () Bool)

(assert (=> d!142155 (= c!125551 (and ((_ is Cons!29787) (toList!10170 (ListLongMap!20310 Nil!29788))) (= (_1!11333 (h!31005 (toList!10170 (ListLongMap!20310 Nil!29788)))) k0!1205)))))

(assert (=> d!142155 (= (getValueByKey!701 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205) e!744556)))

(declare-fun b!1305166 () Bool)

(assert (=> b!1305166 (= e!744556 (Some!751 (_2!11333 (h!31005 (toList!10170 (ListLongMap!20310 Nil!29788))))))))

(assert (= (and d!142155 c!125551) b!1305166))

(assert (= (and d!142155 (not c!125551)) b!1305167))

(assert (= (and b!1305167 c!125552) b!1305168))

(assert (= (and b!1305167 (not c!125552)) b!1305169))

(declare-fun m!1196415 () Bool)

(assert (=> b!1305168 m!1196415))

(assert (=> b!1304984 d!142155))

(declare-fun d!142157 () Bool)

(declare-fun e!744558 () Bool)

(assert (=> d!142157 e!744558))

(declare-fun res!866499 () Bool)

(assert (=> d!142157 (=> (not res!866499) (not e!744558))))

(declare-fun lt!583994 () ListLongMap!20309)

(assert (=> d!142157 (= res!866499 (contains!8318 lt!583994 (_1!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!583992 () List!29791)

(assert (=> d!142157 (= lt!583994 (ListLongMap!20310 lt!583992))))

(declare-fun lt!583993 () Unit!43134)

(declare-fun lt!583991 () Unit!43134)

(assert (=> d!142157 (= lt!583993 lt!583991)))

(assert (=> d!142157 (= (getValueByKey!701 lt!583992 (_1!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!751 (_2!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142157 (= lt!583991 (lemmaContainsTupThenGetReturnValue!352 lt!583992 (_1!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142157 (= lt!583992 (insertStrictlySorted!481 (toList!10170 call!64295) (_1!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!142157 (= (+!4530 call!64295 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!583994)))

(declare-fun b!1305170 () Bool)

(declare-fun res!866498 () Bool)

(assert (=> b!1305170 (=> (not res!866498) (not e!744558))))

(assert (=> b!1305170 (= res!866498 (= (getValueByKey!701 (toList!10170 lt!583994) (_1!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!751 (_2!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305171 () Bool)

(assert (=> b!1305171 (= e!744558 (contains!8322 (toList!10170 lt!583994) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!142157 res!866499) b!1305170))

(assert (= (and b!1305170 res!866498) b!1305171))

(declare-fun m!1196417 () Bool)

(assert (=> d!142157 m!1196417))

(declare-fun m!1196419 () Bool)

(assert (=> d!142157 m!1196419))

(declare-fun m!1196421 () Bool)

(assert (=> d!142157 m!1196421))

(declare-fun m!1196423 () Bool)

(assert (=> d!142157 m!1196423))

(declare-fun m!1196425 () Bool)

(assert (=> b!1305170 m!1196425))

(declare-fun m!1196427 () Bool)

(assert (=> b!1305171 m!1196427))

(assert (=> b!1305095 d!142157))

(declare-fun d!142159 () Bool)

(declare-fun e!744559 () Bool)

(assert (=> d!142159 e!744559))

(declare-fun res!866500 () Bool)

(assert (=> d!142159 (=> res!866500 e!744559)))

(declare-fun lt!583996 () Bool)

(assert (=> d!142159 (= res!866500 (not lt!583996))))

(declare-fun lt!583997 () Bool)

(assert (=> d!142159 (= lt!583996 lt!583997)))

(declare-fun lt!583995 () Unit!43134)

(declare-fun e!744560 () Unit!43134)

(assert (=> d!142159 (= lt!583995 e!744560)))

(declare-fun c!125553 () Bool)

(assert (=> d!142159 (= c!125553 lt!583997)))

(assert (=> d!142159 (= lt!583997 (containsKey!727 (toList!10170 lt!583922) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142159 (= (contains!8318 lt!583922 #b0000000000000000000000000000000000000000000000000000000000000000) lt!583996)))

(declare-fun b!1305172 () Bool)

(declare-fun lt!583998 () Unit!43134)

(assert (=> b!1305172 (= e!744560 lt!583998)))

(assert (=> b!1305172 (= lt!583998 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 lt!583922) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305172 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583922) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305173 () Bool)

(declare-fun Unit!43143 () Unit!43134)

(assert (=> b!1305173 (= e!744560 Unit!43143)))

(declare-fun b!1305174 () Bool)

(assert (=> b!1305174 (= e!744559 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583922) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142159 c!125553) b!1305172))

(assert (= (and d!142159 (not c!125553)) b!1305173))

(assert (= (and d!142159 (not res!866500)) b!1305174))

(declare-fun m!1196429 () Bool)

(assert (=> d!142159 m!1196429))

(declare-fun m!1196431 () Bool)

(assert (=> b!1305172 m!1196431))

(declare-fun m!1196433 () Bool)

(assert (=> b!1305172 m!1196433))

(assert (=> b!1305172 m!1196433))

(declare-fun m!1196435 () Bool)

(assert (=> b!1305172 m!1196435))

(assert (=> b!1305174 m!1196433))

(assert (=> b!1305174 m!1196433))

(assert (=> b!1305174 m!1196435))

(assert (=> bm!64290 d!142159))

(declare-fun d!142161 () Bool)

(assert (=> d!142161 (= (validKeyInArray!0 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305119 d!142161))

(declare-fun d!142163 () Bool)

(assert (=> d!142163 (= (apply!1031 lt!583922 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21218 (getValueByKey!701 (toList!10170 lt!583922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37150 () Bool)

(assert (= bs!37150 d!142163))

(declare-fun m!1196437 () Bool)

(assert (=> bs!37150 m!1196437))

(assert (=> bs!37150 m!1196437))

(declare-fun m!1196439 () Bool)

(assert (=> bs!37150 m!1196439))

(assert (=> b!1305108 d!142163))

(declare-fun d!142165 () Bool)

(assert (=> d!142165 (isDefined!510 (getValueByKey!701 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!583999 () Unit!43134)

(assert (=> d!142165 (= lt!583999 (choose!1927 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!744561 () Bool)

(assert (=> d!142165 e!744561))

(declare-fun res!866501 () Bool)

(assert (=> d!142165 (=> (not res!866501) (not e!744561))))

(assert (=> d!142165 (= res!866501 (isStrictlySorted!861 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!142165 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!583999)))

(declare-fun b!1305175 () Bool)

(assert (=> b!1305175 (= e!744561 (containsKey!727 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!142165 res!866501) b!1305175))

(assert (=> d!142165 m!1196249))

(assert (=> d!142165 m!1196249))

(assert (=> d!142165 m!1196251))

(declare-fun m!1196441 () Bool)

(assert (=> d!142165 m!1196441))

(declare-fun m!1196443 () Bool)

(assert (=> d!142165 m!1196443))

(assert (=> b!1305175 m!1196245))

(assert (=> b!1305043 d!142165))

(assert (=> b!1305043 d!142117))

(assert (=> b!1305043 d!142119))

(assert (=> b!1305092 d!142113))

(declare-fun d!142167 () Bool)

(assert (=> d!142167 (arrayContainsKey!0 _keys!1741 lt!583951 #b00000000000000000000000000000000)))

(declare-fun lt!584002 () Unit!43134)

(declare-fun choose!13 (array!86873 (_ BitVec 64) (_ BitVec 32)) Unit!43134)

(assert (=> d!142167 (= lt!584002 (choose!13 _keys!1741 lt!583951 #b00000000000000000000000000000000))))

(assert (=> d!142167 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!142167 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583951 #b00000000000000000000000000000000) lt!584002)))

(declare-fun bs!37151 () Bool)

(assert (= bs!37151 d!142167))

(assert (=> bs!37151 m!1196303))

(declare-fun m!1196445 () Bool)

(assert (=> bs!37151 m!1196445))

(assert (=> b!1305120 d!142167))

(declare-fun d!142169 () Bool)

(declare-fun res!866506 () Bool)

(declare-fun e!744566 () Bool)

(assert (=> d!142169 (=> res!866506 e!744566)))

(assert (=> d!142169 (= res!866506 (= (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) lt!583951))))

(assert (=> d!142169 (= (arrayContainsKey!0 _keys!1741 lt!583951 #b00000000000000000000000000000000) e!744566)))

(declare-fun b!1305180 () Bool)

(declare-fun e!744567 () Bool)

(assert (=> b!1305180 (= e!744566 e!744567)))

(declare-fun res!866507 () Bool)

(assert (=> b!1305180 (=> (not res!866507) (not e!744567))))

(assert (=> b!1305180 (= res!866507 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42474 _keys!1741)))))

(declare-fun b!1305181 () Bool)

(assert (=> b!1305181 (= e!744567 (arrayContainsKey!0 _keys!1741 lt!583951 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!142169 (not res!866506)) b!1305180))

(assert (= (and b!1305180 res!866507) b!1305181))

(assert (=> d!142169 m!1196203))

(declare-fun m!1196447 () Bool)

(assert (=> b!1305181 m!1196447))

(assert (=> b!1305120 d!142169))

(declare-fun d!142171 () Bool)

(declare-fun lt!584011 () SeekEntryResult!9981)

(assert (=> d!142171 (and (or ((_ is Undefined!9981) lt!584011) (not ((_ is Found!9981) lt!584011)) (and (bvsge (index!42296 lt!584011) #b00000000000000000000000000000000) (bvslt (index!42296 lt!584011) (size!42474 _keys!1741)))) (or ((_ is Undefined!9981) lt!584011) ((_ is Found!9981) lt!584011) (not ((_ is MissingZero!9981) lt!584011)) (and (bvsge (index!42295 lt!584011) #b00000000000000000000000000000000) (bvslt (index!42295 lt!584011) (size!42474 _keys!1741)))) (or ((_ is Undefined!9981) lt!584011) ((_ is Found!9981) lt!584011) ((_ is MissingZero!9981) lt!584011) (not ((_ is MissingVacant!9981) lt!584011)) (and (bvsge (index!42298 lt!584011) #b00000000000000000000000000000000) (bvslt (index!42298 lt!584011) (size!42474 _keys!1741)))) (or ((_ is Undefined!9981) lt!584011) (ite ((_ is Found!9981) lt!584011) (= (select (arr!41923 _keys!1741) (index!42296 lt!584011)) (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9981) lt!584011) (= (select (arr!41923 _keys!1741) (index!42295 lt!584011)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9981) lt!584011) (= (select (arr!41923 _keys!1741) (index!42298 lt!584011)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!744576 () SeekEntryResult!9981)

(assert (=> d!142171 (= lt!584011 e!744576)))

(declare-fun c!125561 () Bool)

(declare-fun lt!584009 () SeekEntryResult!9981)

(assert (=> d!142171 (= c!125561 (and ((_ is Intermediate!9981) lt!584009) (undefined!10793 lt!584009)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86873 (_ BitVec 32)) SeekEntryResult!9981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!142171 (= lt!584009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!142171 (validMask!0 mask!2175)))

(assert (=> d!142171 (= (seekEntryOrOpen!0 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!584011)))

(declare-fun b!1305194 () Bool)

(declare-fun c!125560 () Bool)

(declare-fun lt!584010 () (_ BitVec 64))

(assert (=> b!1305194 (= c!125560 (= lt!584010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!744575 () SeekEntryResult!9981)

(declare-fun e!744574 () SeekEntryResult!9981)

(assert (=> b!1305194 (= e!744575 e!744574)))

(declare-fun b!1305195 () Bool)

(assert (=> b!1305195 (= e!744576 e!744575)))

(assert (=> b!1305195 (= lt!584010 (select (arr!41923 _keys!1741) (index!42297 lt!584009)))))

(declare-fun c!125562 () Bool)

(assert (=> b!1305195 (= c!125562 (= lt!584010 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305196 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86873 (_ BitVec 32)) SeekEntryResult!9981)

(assert (=> b!1305196 (= e!744574 (seekKeyOrZeroReturnVacant!0 (x!115770 lt!584009) (index!42297 lt!584009) (index!42297 lt!584009) (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun b!1305197 () Bool)

(assert (=> b!1305197 (= e!744576 Undefined!9981)))

(declare-fun b!1305198 () Bool)

(assert (=> b!1305198 (= e!744574 (MissingZero!9981 (index!42297 lt!584009)))))

(declare-fun b!1305199 () Bool)

(assert (=> b!1305199 (= e!744575 (Found!9981 (index!42297 lt!584009)))))

(assert (= (and d!142171 c!125561) b!1305197))

(assert (= (and d!142171 (not c!125561)) b!1305195))

(assert (= (and b!1305195 c!125562) b!1305199))

(assert (= (and b!1305195 (not c!125562)) b!1305194))

(assert (= (and b!1305194 c!125560) b!1305198))

(assert (= (and b!1305194 (not c!125560)) b!1305196))

(declare-fun m!1196449 () Bool)

(assert (=> d!142171 m!1196449))

(declare-fun m!1196451 () Bool)

(assert (=> d!142171 m!1196451))

(assert (=> d!142171 m!1196203))

(declare-fun m!1196453 () Bool)

(assert (=> d!142171 m!1196453))

(declare-fun m!1196455 () Bool)

(assert (=> d!142171 m!1196455))

(declare-fun m!1196457 () Bool)

(assert (=> d!142171 m!1196457))

(assert (=> d!142171 m!1196131))

(assert (=> d!142171 m!1196203))

(assert (=> d!142171 m!1196451))

(declare-fun m!1196459 () Bool)

(assert (=> b!1305195 m!1196459))

(assert (=> b!1305196 m!1196203))

(declare-fun m!1196461 () Bool)

(assert (=> b!1305196 m!1196461))

(assert (=> b!1305120 d!142171))

(declare-fun d!142173 () Bool)

(declare-fun res!866512 () Bool)

(declare-fun e!744581 () Bool)

(assert (=> d!142173 (=> res!866512 e!744581)))

(assert (=> d!142173 (= res!866512 (and ((_ is Cons!29787) (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11333 (h!31005 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!142173 (= (containsKey!727 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744581)))

(declare-fun b!1305204 () Bool)

(declare-fun e!744582 () Bool)

(assert (=> b!1305204 (= e!744581 e!744582)))

(declare-fun res!866513 () Bool)

(assert (=> b!1305204 (=> (not res!866513) (not e!744582))))

(assert (=> b!1305204 (= res!866513 (and (or (not ((_ is Cons!29787) (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11333 (h!31005 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29787) (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11333 (h!31005 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1305205 () Bool)

(assert (=> b!1305205 (= e!744582 (containsKey!727 (t!43377 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!142173 (not res!866512)) b!1305204))

(assert (= (and b!1305204 res!866513) b!1305205))

(declare-fun m!1196463 () Bool)

(assert (=> b!1305205 m!1196463))

(assert (=> d!142099 d!142173))

(declare-fun d!142175 () Bool)

(declare-fun e!744583 () Bool)

(assert (=> d!142175 e!744583))

(declare-fun res!866514 () Bool)

(assert (=> d!142175 (=> res!866514 e!744583)))

(declare-fun lt!584013 () Bool)

(assert (=> d!142175 (= res!866514 (not lt!584013))))

(declare-fun lt!584014 () Bool)

(assert (=> d!142175 (= lt!584013 lt!584014)))

(declare-fun lt!584012 () Unit!43134)

(declare-fun e!744584 () Unit!43134)

(assert (=> d!142175 (= lt!584012 e!744584)))

(declare-fun c!125563 () Bool)

(assert (=> d!142175 (= c!125563 lt!584014)))

(assert (=> d!142175 (= lt!584014 (containsKey!727 (toList!10170 lt!583872) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142175 (= (contains!8318 lt!583872 #b0000000000000000000000000000000000000000000000000000000000000000) lt!584013)))

(declare-fun b!1305206 () Bool)

(declare-fun lt!584015 () Unit!43134)

(assert (=> b!1305206 (= e!744584 lt!584015)))

(assert (=> b!1305206 (= lt!584015 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 lt!583872) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305206 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583872) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305207 () Bool)

(declare-fun Unit!43144 () Unit!43134)

(assert (=> b!1305207 (= e!744584 Unit!43144)))

(declare-fun b!1305208 () Bool)

(assert (=> b!1305208 (= e!744583 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583872) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142175 c!125563) b!1305206))

(assert (= (and d!142175 (not c!125563)) b!1305207))

(assert (= (and d!142175 (not res!866514)) b!1305208))

(declare-fun m!1196465 () Bool)

(assert (=> d!142175 m!1196465))

(declare-fun m!1196467 () Bool)

(assert (=> b!1305206 m!1196467))

(declare-fun m!1196469 () Bool)

(assert (=> b!1305206 m!1196469))

(assert (=> b!1305206 m!1196469))

(declare-fun m!1196471 () Bool)

(assert (=> b!1305206 m!1196471))

(assert (=> b!1305208 m!1196469))

(assert (=> b!1305208 m!1196469))

(assert (=> b!1305208 m!1196471))

(assert (=> d!142101 d!142175))

(assert (=> d!142101 d!142103))

(declare-fun d!142177 () Bool)

(declare-fun e!744585 () Bool)

(assert (=> d!142177 e!744585))

(declare-fun res!866515 () Bool)

(assert (=> d!142177 (=> res!866515 e!744585)))

(declare-fun lt!584017 () Bool)

(assert (=> d!142177 (= res!866515 (not lt!584017))))

(declare-fun lt!584018 () Bool)

(assert (=> d!142177 (= lt!584017 lt!584018)))

(declare-fun lt!584016 () Unit!43134)

(declare-fun e!744586 () Unit!43134)

(assert (=> d!142177 (= lt!584016 e!744586)))

(declare-fun c!125564 () Bool)

(assert (=> d!142177 (= c!125564 lt!584018)))

(assert (=> d!142177 (= lt!584018 (containsKey!727 (toList!10170 lt!583872) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142177 (= (contains!8318 lt!583872 #b1000000000000000000000000000000000000000000000000000000000000000) lt!584017)))

(declare-fun b!1305209 () Bool)

(declare-fun lt!584019 () Unit!43134)

(assert (=> b!1305209 (= e!744586 lt!584019)))

(assert (=> b!1305209 (= lt!584019 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 lt!583872) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305209 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583872) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305210 () Bool)

(declare-fun Unit!43145 () Unit!43134)

(assert (=> b!1305210 (= e!744586 Unit!43145)))

(declare-fun b!1305211 () Bool)

(assert (=> b!1305211 (= e!744585 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142177 c!125564) b!1305209))

(assert (= (and d!142177 (not c!125564)) b!1305210))

(assert (= (and d!142177 (not res!866515)) b!1305211))

(declare-fun m!1196473 () Bool)

(assert (=> d!142177 m!1196473))

(declare-fun m!1196475 () Bool)

(assert (=> b!1305209 m!1196475))

(declare-fun m!1196477 () Bool)

(assert (=> b!1305209 m!1196477))

(assert (=> b!1305209 m!1196477))

(declare-fun m!1196479 () Bool)

(assert (=> b!1305209 m!1196479))

(assert (=> b!1305211 m!1196477))

(assert (=> b!1305211 m!1196477))

(assert (=> b!1305211 m!1196479))

(assert (=> b!1305029 d!142177))

(assert (=> bm!64294 d!142101))

(declare-fun b!1305212 () Bool)

(declare-fun e!744587 () Bool)

(declare-fun call!64302 () Bool)

(assert (=> b!1305212 (= e!744587 call!64302)))

(declare-fun d!142179 () Bool)

(declare-fun res!866517 () Bool)

(declare-fun e!744588 () Bool)

(assert (=> d!142179 (=> res!866517 e!744588)))

(assert (=> d!142179 (= res!866517 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42474 _keys!1741)))))

(assert (=> d!142179 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!744588)))

(declare-fun bm!64299 () Bool)

(assert (=> bm!64299 (= call!64302 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1305213 () Bool)

(declare-fun e!744589 () Bool)

(assert (=> b!1305213 (= e!744589 call!64302)))

(declare-fun b!1305214 () Bool)

(assert (=> b!1305214 (= e!744588 e!744587)))

(declare-fun c!125565 () Bool)

(assert (=> b!1305214 (= c!125565 (validKeyInArray!0 (select (arr!41923 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1305215 () Bool)

(assert (=> b!1305215 (= e!744587 e!744589)))

(declare-fun lt!584022 () (_ BitVec 64))

(assert (=> b!1305215 (= lt!584022 (select (arr!41923 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!584021 () Unit!43134)

(assert (=> b!1305215 (= lt!584021 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584022 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1305215 (arrayContainsKey!0 _keys!1741 lt!584022 #b00000000000000000000000000000000)))

(declare-fun lt!584020 () Unit!43134)

(assert (=> b!1305215 (= lt!584020 lt!584021)))

(declare-fun res!866516 () Bool)

(assert (=> b!1305215 (= res!866516 (= (seekEntryOrOpen!0 (select (arr!41923 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!9981 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1305215 (=> (not res!866516) (not e!744589))))

(assert (= (and d!142179 (not res!866517)) b!1305214))

(assert (= (and b!1305214 c!125565) b!1305215))

(assert (= (and b!1305214 (not c!125565)) b!1305212))

(assert (= (and b!1305215 res!866516) b!1305213))

(assert (= (or b!1305213 b!1305212) bm!64299))

(declare-fun m!1196481 () Bool)

(assert (=> bm!64299 m!1196481))

(declare-fun m!1196483 () Bool)

(assert (=> b!1305214 m!1196483))

(assert (=> b!1305214 m!1196483))

(declare-fun m!1196485 () Bool)

(assert (=> b!1305214 m!1196485))

(assert (=> b!1305215 m!1196483))

(declare-fun m!1196487 () Bool)

(assert (=> b!1305215 m!1196487))

(declare-fun m!1196489 () Bool)

(assert (=> b!1305215 m!1196489))

(assert (=> b!1305215 m!1196483))

(declare-fun m!1196491 () Bool)

(assert (=> b!1305215 m!1196491))

(assert (=> bm!64298 d!142179))

(declare-fun d!142181 () Bool)

(assert (=> d!142181 (= (apply!1031 lt!583922 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21218 (getValueByKey!701 (toList!10170 lt!583922) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37152 () Bool)

(assert (= bs!37152 d!142181))

(assert (=> bs!37152 m!1196433))

(assert (=> bs!37152 m!1196433))

(declare-fun m!1196493 () Bool)

(assert (=> bs!37152 m!1196493))

(assert (=> b!1305107 d!142181))

(declare-fun d!142183 () Bool)

(declare-fun e!744590 () Bool)

(assert (=> d!142183 e!744590))

(declare-fun res!866519 () Bool)

(assert (=> d!142183 (=> (not res!866519) (not e!744590))))

(declare-fun lt!584026 () ListLongMap!20309)

(assert (=> d!142183 (= res!866519 (contains!8318 lt!584026 (_1!11333 (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!584024 () List!29791)

(assert (=> d!142183 (= lt!584026 (ListLongMap!20310 lt!584024))))

(declare-fun lt!584025 () Unit!43134)

(declare-fun lt!584023 () Unit!43134)

(assert (=> d!142183 (= lt!584025 lt!584023)))

(assert (=> d!142183 (= (getValueByKey!701 lt!584024 (_1!11333 (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!751 (_2!11333 (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142183 (= lt!584023 (lemmaContainsTupThenGetReturnValue!352 lt!584024 (_1!11333 (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11333 (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142183 (= lt!584024 (insertStrictlySorted!481 (toList!10170 (ite c!125535 call!64298 (ite c!125537 call!64296 call!64297))) (_1!11333 (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11333 (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!142183 (= (+!4530 (ite c!125535 call!64298 (ite c!125537 call!64296 call!64297)) (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!584026)))

(declare-fun b!1305216 () Bool)

(declare-fun res!866518 () Bool)

(assert (=> b!1305216 (=> (not res!866518) (not e!744590))))

(assert (=> b!1305216 (= res!866518 (= (getValueByKey!701 (toList!10170 lt!584026) (_1!11333 (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!751 (_2!11333 (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1305217 () Bool)

(assert (=> b!1305217 (= e!744590 (contains!8322 (toList!10170 lt!584026) (ite (or c!125535 c!125537) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!142183 res!866519) b!1305216))

(assert (= (and b!1305216 res!866518) b!1305217))

(declare-fun m!1196495 () Bool)

(assert (=> d!142183 m!1196495))

(declare-fun m!1196497 () Bool)

(assert (=> d!142183 m!1196497))

(declare-fun m!1196499 () Bool)

(assert (=> d!142183 m!1196499))

(declare-fun m!1196501 () Bool)

(assert (=> d!142183 m!1196501))

(declare-fun m!1196503 () Bool)

(assert (=> b!1305216 m!1196503))

(declare-fun m!1196505 () Bool)

(assert (=> b!1305217 m!1196505))

(assert (=> bm!64289 d!142183))

(declare-fun d!142185 () Bool)

(declare-fun lt!584029 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!645 (List!29792) (InoxSet (_ BitVec 64)))

(assert (=> d!142185 (= lt!584029 (select (content!645 Nil!29789) (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!744595 () Bool)

(assert (=> d!142185 (= lt!584029 e!744595)))

(declare-fun res!866524 () Bool)

(assert (=> d!142185 (=> (not res!866524) (not e!744595))))

(assert (=> d!142185 (= res!866524 ((_ is Cons!29788) Nil!29789))))

(assert (=> d!142185 (= (contains!8321 Nil!29789 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)) lt!584029)))

(declare-fun b!1305222 () Bool)

(declare-fun e!744596 () Bool)

(assert (=> b!1305222 (= e!744595 e!744596)))

(declare-fun res!866525 () Bool)

(assert (=> b!1305222 (=> res!866525 e!744596)))

(assert (=> b!1305222 (= res!866525 (= (h!31006 Nil!29789) (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305223 () Bool)

(assert (=> b!1305223 (= e!744596 (contains!8321 (t!43378 Nil!29789) (select (arr!41923 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142185 res!866524) b!1305222))

(assert (= (and b!1305222 (not res!866525)) b!1305223))

(declare-fun m!1196507 () Bool)

(assert (=> d!142185 m!1196507))

(assert (=> d!142185 m!1196203))

(declare-fun m!1196509 () Bool)

(assert (=> d!142185 m!1196509))

(assert (=> b!1305223 m!1196203))

(declare-fun m!1196511 () Bool)

(assert (=> b!1305223 m!1196511))

(assert (=> b!1305001 d!142185))

(declare-fun b!1305224 () Bool)

(declare-fun res!866527 () Bool)

(declare-fun e!744602 () Bool)

(assert (=> b!1305224 (=> (not res!866527) (not e!744602))))

(declare-fun lt!584036 () ListLongMap!20309)

(assert (=> b!1305224 (= res!866527 (not (contains!8318 lt!584036 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1305225 () Bool)

(declare-fun e!744597 () ListLongMap!20309)

(declare-fun call!64303 () ListLongMap!20309)

(assert (=> b!1305225 (= e!744597 call!64303)))

(declare-fun b!1305226 () Bool)

(declare-fun e!744599 () Bool)

(declare-fun e!744603 () Bool)

(assert (=> b!1305226 (= e!744599 e!744603)))

(declare-fun c!125568 () Bool)

(assert (=> b!1305226 (= c!125568 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42474 _keys!1741)))))

(declare-fun d!142187 () Bool)

(assert (=> d!142187 e!744602))

(declare-fun res!866529 () Bool)

(assert (=> d!142187 (=> (not res!866529) (not e!744602))))

(assert (=> d!142187 (= res!866529 (not (contains!8318 lt!584036 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!744600 () ListLongMap!20309)

(assert (=> d!142187 (= lt!584036 e!744600)))

(declare-fun c!125567 () Bool)

(assert (=> d!142187 (= c!125567 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42474 _keys!1741)))))

(assert (=> d!142187 (validMask!0 mask!2175)))

(assert (=> d!142187 (= (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!584036)))

(declare-fun b!1305227 () Bool)

(assert (=> b!1305227 (= e!744600 e!744597)))

(declare-fun c!125569 () Bool)

(assert (=> b!1305227 (= c!125569 (validKeyInArray!0 (select (arr!41923 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun b!1305228 () Bool)

(declare-fun lt!584030 () Unit!43134)

(declare-fun lt!584034 () Unit!43134)

(assert (=> b!1305228 (= lt!584030 lt!584034)))

(declare-fun lt!584035 () (_ BitVec 64))

(declare-fun lt!584033 () V!51649)

(declare-fun lt!584031 () ListLongMap!20309)

(declare-fun lt!584032 () (_ BitVec 64))

(assert (=> b!1305228 (not (contains!8318 (+!4530 lt!584031 (tuple2!22645 lt!584032 lt!584033)) lt!584035))))

(assert (=> b!1305228 (= lt!584034 (addStillNotContains!481 lt!584031 lt!584032 lt!584033 lt!584035))))

(assert (=> b!1305228 (= lt!584035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1305228 (= lt!584033 (get!21217 (select (arr!41922 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1305228 (= lt!584032 (select (arr!41923 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (=> b!1305228 (= lt!584031 call!64303)))

(assert (=> b!1305228 (= e!744597 (+!4530 call!64303 (tuple2!22645 (select (arr!41923 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21217 (select (arr!41922 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1305229 () Bool)

(assert (=> b!1305229 (= e!744602 e!744599)))

(declare-fun c!125566 () Bool)

(declare-fun e!744601 () Bool)

(assert (=> b!1305229 (= c!125566 e!744601)))

(declare-fun res!866528 () Bool)

(assert (=> b!1305229 (=> (not res!866528) (not e!744601))))

(assert (=> b!1305229 (= res!866528 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42474 _keys!1741)))))

(declare-fun b!1305230 () Bool)

(assert (=> b!1305230 (= e!744603 (isEmpty!1066 lt!584036))))

(declare-fun b!1305231 () Bool)

(assert (=> b!1305231 (= e!744600 (ListLongMap!20310 Nil!29788))))

(declare-fun b!1305232 () Bool)

(assert (=> b!1305232 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42474 _keys!1741)))))

(assert (=> b!1305232 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42473 _values!1445)))))

(declare-fun e!744598 () Bool)

(assert (=> b!1305232 (= e!744598 (= (apply!1031 lt!584036 (select (arr!41923 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21217 (select (arr!41922 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!64300 () Bool)

(assert (=> bm!64300 (= call!64303 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1305233 () Bool)

(assert (=> b!1305233 (= e!744601 (validKeyInArray!0 (select (arr!41923 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1305233 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1305234 () Bool)

(assert (=> b!1305234 (= e!744603 (= lt!584036 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1305235 () Bool)

(assert (=> b!1305235 (= e!744599 e!744598)))

(assert (=> b!1305235 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42474 _keys!1741)))))

(declare-fun res!866526 () Bool)

(assert (=> b!1305235 (= res!866526 (contains!8318 lt!584036 (select (arr!41923 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1305235 (=> (not res!866526) (not e!744598))))

(assert (= (and d!142187 c!125567) b!1305231))

(assert (= (and d!142187 (not c!125567)) b!1305227))

(assert (= (and b!1305227 c!125569) b!1305228))

(assert (= (and b!1305227 (not c!125569)) b!1305225))

(assert (= (or b!1305228 b!1305225) bm!64300))

(assert (= (and d!142187 res!866529) b!1305224))

(assert (= (and b!1305224 res!866527) b!1305229))

(assert (= (and b!1305229 res!866528) b!1305233))

(assert (= (and b!1305229 c!125566) b!1305235))

(assert (= (and b!1305229 (not c!125566)) b!1305226))

(assert (= (and b!1305235 res!866526) b!1305232))

(assert (= (and b!1305226 c!125568) b!1305234))

(assert (= (and b!1305226 (not c!125568)) b!1305230))

(declare-fun b_lambda!23281 () Bool)

(assert (=> (not b_lambda!23281) (not b!1305228)))

(assert (=> b!1305228 t!43384))

(declare-fun b_and!47447 () Bool)

(assert (= b_and!47445 (and (=> t!43384 result!23811) b_and!47447)))

(declare-fun b_lambda!23283 () Bool)

(assert (=> (not b_lambda!23283) (not b!1305232)))

(assert (=> b!1305232 t!43384))

(declare-fun b_and!47449 () Bool)

(assert (= b_and!47447 (and (=> t!43384 result!23811) b_and!47449)))

(declare-fun m!1196513 () Bool)

(assert (=> b!1305227 m!1196513))

(assert (=> b!1305227 m!1196513))

(declare-fun m!1196515 () Bool)

(assert (=> b!1305227 m!1196515))

(assert (=> b!1305232 m!1196513))

(declare-fun m!1196517 () Bool)

(assert (=> b!1305232 m!1196517))

(assert (=> b!1305232 m!1196221))

(declare-fun m!1196519 () Bool)

(assert (=> b!1305232 m!1196519))

(assert (=> b!1305232 m!1196221))

(declare-fun m!1196521 () Bool)

(assert (=> b!1305232 m!1196521))

(assert (=> b!1305232 m!1196519))

(assert (=> b!1305232 m!1196513))

(assert (=> b!1305233 m!1196513))

(assert (=> b!1305233 m!1196513))

(assert (=> b!1305233 m!1196515))

(declare-fun m!1196523 () Bool)

(assert (=> b!1305234 m!1196523))

(declare-fun m!1196525 () Bool)

(assert (=> b!1305224 m!1196525))

(assert (=> bm!64300 m!1196523))

(assert (=> b!1305235 m!1196513))

(assert (=> b!1305235 m!1196513))

(declare-fun m!1196527 () Bool)

(assert (=> b!1305235 m!1196527))

(declare-fun m!1196529 () Bool)

(assert (=> b!1305230 m!1196529))

(declare-fun m!1196531 () Bool)

(assert (=> d!142187 m!1196531))

(assert (=> d!142187 m!1196131))

(assert (=> b!1305228 m!1196221))

(declare-fun m!1196533 () Bool)

(assert (=> b!1305228 m!1196533))

(declare-fun m!1196535 () Bool)

(assert (=> b!1305228 m!1196535))

(assert (=> b!1305228 m!1196519))

(assert (=> b!1305228 m!1196221))

(assert (=> b!1305228 m!1196521))

(assert (=> b!1305228 m!1196519))

(declare-fun m!1196537 () Bool)

(assert (=> b!1305228 m!1196537))

(declare-fun m!1196539 () Bool)

(assert (=> b!1305228 m!1196539))

(assert (=> b!1305228 m!1196513))

(assert (=> b!1305228 m!1196537))

(assert (=> b!1305039 d!142187))

(declare-fun d!142189 () Bool)

(declare-fun res!866530 () Bool)

(declare-fun e!744604 () Bool)

(assert (=> d!142189 (=> res!866530 e!744604)))

(assert (=> d!142189 (= res!866530 (and ((_ is Cons!29787) (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11333 (h!31005 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!142189 (= (containsKey!727 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744604)))

(declare-fun b!1305236 () Bool)

(declare-fun e!744605 () Bool)

(assert (=> b!1305236 (= e!744604 e!744605)))

(declare-fun res!866531 () Bool)

(assert (=> b!1305236 (=> (not res!866531) (not e!744605))))

(assert (=> b!1305236 (= res!866531 (and (or (not ((_ is Cons!29787) (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11333 (h!31005 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29787) (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11333 (h!31005 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1305237 () Bool)

(assert (=> b!1305237 (= e!744605 (containsKey!727 (t!43377 (toList!10170 (getCurrentListMap!5180 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!142189 (not res!866530)) b!1305236))

(assert (= (and b!1305236 res!866531) b!1305237))

(declare-fun m!1196541 () Bool)

(assert (=> b!1305237 m!1196541))

(assert (=> d!142109 d!142189))

(declare-fun d!142191 () Bool)

(assert (=> d!142191 (= (isDefined!510 (getValueByKey!701 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1067 (getValueByKey!701 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37153 () Bool)

(assert (= bs!37153 d!142191))

(assert (=> bs!37153 m!1196215))

(declare-fun m!1196543 () Bool)

(assert (=> bs!37153 m!1196543))

(assert (=> b!1305004 d!142191))

(declare-fun b!1305240 () Bool)

(declare-fun e!744607 () Option!752)

(assert (=> b!1305240 (= e!744607 (getValueByKey!701 (t!43377 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun b!1305241 () Bool)

(assert (=> b!1305241 (= e!744607 None!750)))

(declare-fun b!1305239 () Bool)

(declare-fun e!744606 () Option!752)

(assert (=> b!1305239 (= e!744606 e!744607)))

(declare-fun c!125571 () Bool)

(assert (=> b!1305239 (= c!125571 (and ((_ is Cons!29787) (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11333 (h!31005 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun c!125570 () Bool)

(declare-fun d!142193 () Bool)

(assert (=> d!142193 (= c!125570 (and ((_ is Cons!29787) (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11333 (h!31005 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!142193 (= (getValueByKey!701 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744606)))

(declare-fun b!1305238 () Bool)

(assert (=> b!1305238 (= e!744606 (Some!751 (_2!11333 (h!31005 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(assert (= (and d!142193 c!125570) b!1305238))

(assert (= (and d!142193 (not c!125570)) b!1305239))

(assert (= (and b!1305239 c!125571) b!1305240))

(assert (= (and b!1305239 (not c!125571)) b!1305241))

(declare-fun m!1196545 () Bool)

(assert (=> b!1305240 m!1196545))

(assert (=> b!1305004 d!142193))

(declare-fun d!142195 () Bool)

(assert (=> d!142195 (= (apply!1031 lt!583922 (select (arr!41923 _keys!1741) from!2144)) (get!21218 (getValueByKey!701 (toList!10170 lt!583922) (select (arr!41923 _keys!1741) from!2144))))))

(declare-fun bs!37154 () Bool)

(assert (= bs!37154 d!142195))

(assert (=> bs!37154 m!1196109))

(declare-fun m!1196547 () Bool)

(assert (=> bs!37154 m!1196547))

(assert (=> bs!37154 m!1196547))

(declare-fun m!1196549 () Bool)

(assert (=> bs!37154 m!1196549))

(assert (=> b!1305103 d!142195))

(declare-fun d!142197 () Bool)

(declare-fun c!125574 () Bool)

(assert (=> d!142197 (= c!125574 ((_ is ValueCellFull!16556) (select (arr!41922 _values!1445) from!2144)))))

(declare-fun e!744610 () V!51649)

(assert (=> d!142197 (= (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!744610)))

(declare-fun b!1305246 () Bool)

(declare-fun get!21219 (ValueCell!16556 V!51649) V!51649)

(assert (=> b!1305246 (= e!744610 (get!21219 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1305247 () Bool)

(declare-fun get!21220 (ValueCell!16556 V!51649) V!51649)

(assert (=> b!1305247 (= e!744610 (get!21220 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142197 c!125574) b!1305246))

(assert (= (and d!142197 (not c!125574)) b!1305247))

(assert (=> b!1305246 m!1196223))

(assert (=> b!1305246 m!1196221))

(declare-fun m!1196551 () Bool)

(assert (=> b!1305246 m!1196551))

(assert (=> b!1305247 m!1196223))

(assert (=> b!1305247 m!1196221))

(declare-fun m!1196553 () Bool)

(assert (=> b!1305247 m!1196553))

(assert (=> b!1305103 d!142197))

(declare-fun d!142199 () Bool)

(declare-fun e!744611 () Bool)

(assert (=> d!142199 e!744611))

(declare-fun res!866532 () Bool)

(assert (=> d!142199 (=> res!866532 e!744611)))

(declare-fun lt!584038 () Bool)

(assert (=> d!142199 (= res!866532 (not lt!584038))))

(declare-fun lt!584039 () Bool)

(assert (=> d!142199 (= lt!584038 lt!584039)))

(declare-fun lt!584037 () Unit!43134)

(declare-fun e!744612 () Unit!43134)

(assert (=> d!142199 (= lt!584037 e!744612)))

(declare-fun c!125575 () Bool)

(assert (=> d!142199 (= c!125575 lt!584039)))

(assert (=> d!142199 (= lt!584039 (containsKey!727 (toList!10170 lt!583872) (select (arr!41923 _keys!1741) from!2144)))))

(assert (=> d!142199 (= (contains!8318 lt!583872 (select (arr!41923 _keys!1741) from!2144)) lt!584038)))

(declare-fun b!1305248 () Bool)

(declare-fun lt!584040 () Unit!43134)

(assert (=> b!1305248 (= e!744612 lt!584040)))

(assert (=> b!1305248 (= lt!584040 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 lt!583872) (select (arr!41923 _keys!1741) from!2144)))))

(assert (=> b!1305248 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583872) (select (arr!41923 _keys!1741) from!2144)))))

(declare-fun b!1305249 () Bool)

(declare-fun Unit!43146 () Unit!43134)

(assert (=> b!1305249 (= e!744612 Unit!43146)))

(declare-fun b!1305250 () Bool)

(assert (=> b!1305250 (= e!744611 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583872) (select (arr!41923 _keys!1741) from!2144))))))

(assert (= (and d!142199 c!125575) b!1305248))

(assert (= (and d!142199 (not c!125575)) b!1305249))

(assert (= (and d!142199 (not res!866532)) b!1305250))

(assert (=> d!142199 m!1196109))

(declare-fun m!1196555 () Bool)

(assert (=> d!142199 m!1196555))

(assert (=> b!1305248 m!1196109))

(declare-fun m!1196557 () Bool)

(assert (=> b!1305248 m!1196557))

(assert (=> b!1305248 m!1196109))

(declare-fun m!1196559 () Bool)

(assert (=> b!1305248 m!1196559))

(assert (=> b!1305248 m!1196559))

(declare-fun m!1196561 () Bool)

(assert (=> b!1305248 m!1196561))

(assert (=> b!1305250 m!1196109))

(assert (=> b!1305250 m!1196559))

(assert (=> b!1305250 m!1196559))

(assert (=> b!1305250 m!1196561))

(assert (=> b!1305040 d!142199))

(declare-fun d!142201 () Bool)

(declare-fun e!744613 () Bool)

(assert (=> d!142201 e!744613))

(declare-fun res!866533 () Bool)

(assert (=> d!142201 (=> res!866533 e!744613)))

(declare-fun lt!584042 () Bool)

(assert (=> d!142201 (= res!866533 (not lt!584042))))

(declare-fun lt!584043 () Bool)

(assert (=> d!142201 (= lt!584042 lt!584043)))

(declare-fun lt!584041 () Unit!43134)

(declare-fun e!744614 () Unit!43134)

(assert (=> d!142201 (= lt!584041 e!744614)))

(declare-fun c!125576 () Bool)

(assert (=> d!142201 (= c!125576 lt!584043)))

(assert (=> d!142201 (= lt!584043 (containsKey!727 (toList!10170 lt!583922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142201 (= (contains!8318 lt!583922 #b1000000000000000000000000000000000000000000000000000000000000000) lt!584042)))

(declare-fun b!1305251 () Bool)

(declare-fun lt!584044 () Unit!43134)

(assert (=> b!1305251 (= e!744614 lt!584044)))

(assert (=> b!1305251 (= lt!584044 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 lt!583922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1305251 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1305252 () Bool)

(declare-fun Unit!43147 () Unit!43134)

(assert (=> b!1305252 (= e!744614 Unit!43147)))

(declare-fun b!1305253 () Bool)

(assert (=> b!1305253 (= e!744613 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142201 c!125576) b!1305251))

(assert (= (and d!142201 (not c!125576)) b!1305252))

(assert (= (and d!142201 (not res!866533)) b!1305253))

(declare-fun m!1196563 () Bool)

(assert (=> d!142201 m!1196563))

(declare-fun m!1196565 () Bool)

(assert (=> b!1305251 m!1196565))

(assert (=> b!1305251 m!1196437))

(assert (=> b!1305251 m!1196437))

(declare-fun m!1196567 () Bool)

(assert (=> b!1305251 m!1196567))

(assert (=> b!1305253 m!1196437))

(assert (=> b!1305253 m!1196437))

(assert (=> b!1305253 m!1196567))

(assert (=> bm!64293 d!142201))

(assert (=> d!142095 d!142093))

(declare-fun d!142203 () Bool)

(assert (=> d!142203 (not (contains!8318 (ListLongMap!20310 Nil!29788) k0!1205))))

(assert (=> d!142203 true))

(declare-fun _$29!198 () Unit!43134)

(assert (=> d!142203 (= (choose!1924 k0!1205) _$29!198)))

(declare-fun bs!37155 () Bool)

(assert (= bs!37155 d!142203))

(assert (=> bs!37155 m!1196117))

(assert (=> d!142095 d!142203))

(declare-fun d!142205 () Bool)

(declare-fun e!744615 () Bool)

(assert (=> d!142205 e!744615))

(declare-fun res!866534 () Bool)

(assert (=> d!142205 (=> res!866534 e!744615)))

(declare-fun lt!584046 () Bool)

(assert (=> d!142205 (= res!866534 (not lt!584046))))

(declare-fun lt!584047 () Bool)

(assert (=> d!142205 (= lt!584046 lt!584047)))

(declare-fun lt!584045 () Unit!43134)

(declare-fun e!744616 () Unit!43134)

(assert (=> d!142205 (= lt!584045 e!744616)))

(declare-fun c!125577 () Bool)

(assert (=> d!142205 (= c!125577 lt!584047)))

(assert (=> d!142205 (= lt!584047 (containsKey!727 (toList!10170 lt!583922) (select (arr!41923 _keys!1741) from!2144)))))

(assert (=> d!142205 (= (contains!8318 lt!583922 (select (arr!41923 _keys!1741) from!2144)) lt!584046)))

(declare-fun b!1305254 () Bool)

(declare-fun lt!584048 () Unit!43134)

(assert (=> b!1305254 (= e!744616 lt!584048)))

(assert (=> b!1305254 (= lt!584048 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 lt!583922) (select (arr!41923 _keys!1741) from!2144)))))

(assert (=> b!1305254 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583922) (select (arr!41923 _keys!1741) from!2144)))))

(declare-fun b!1305255 () Bool)

(declare-fun Unit!43148 () Unit!43134)

(assert (=> b!1305255 (= e!744616 Unit!43148)))

(declare-fun b!1305256 () Bool)

(assert (=> b!1305256 (= e!744615 (isDefined!510 (getValueByKey!701 (toList!10170 lt!583922) (select (arr!41923 _keys!1741) from!2144))))))

(assert (= (and d!142205 c!125577) b!1305254))

(assert (= (and d!142205 (not c!125577)) b!1305255))

(assert (= (and d!142205 (not res!866534)) b!1305256))

(assert (=> d!142205 m!1196109))

(declare-fun m!1196569 () Bool)

(assert (=> d!142205 m!1196569))

(assert (=> b!1305254 m!1196109))

(declare-fun m!1196571 () Bool)

(assert (=> b!1305254 m!1196571))

(assert (=> b!1305254 m!1196109))

(assert (=> b!1305254 m!1196547))

(assert (=> b!1305254 m!1196547))

(declare-fun m!1196573 () Bool)

(assert (=> b!1305254 m!1196573))

(assert (=> b!1305256 m!1196109))

(assert (=> b!1305256 m!1196547))

(assert (=> b!1305256 m!1196547))

(assert (=> b!1305256 m!1196573))

(assert (=> b!1305100 d!142205))

(assert (=> bm!64274 d!142187))

(declare-fun d!142207 () Bool)

(assert (=> d!142207 (isDefined!510 (getValueByKey!701 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!584049 () Unit!43134)

(assert (=> d!142207 (= lt!584049 (choose!1927 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!744617 () Bool)

(assert (=> d!142207 e!744617))

(declare-fun res!866535 () Bool)

(assert (=> d!142207 (=> (not res!866535) (not e!744617))))

(assert (=> d!142207 (= res!866535 (isStrictlySorted!861 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!142207 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!584049)))

(declare-fun b!1305257 () Bool)

(assert (=> b!1305257 (= e!744617 (containsKey!727 (toList!10170 (getCurrentListMapNoExtraKeys!6168 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!142207 res!866535) b!1305257))

(assert (=> d!142207 m!1196215))

(assert (=> d!142207 m!1196215))

(assert (=> d!142207 m!1196217))

(declare-fun m!1196575 () Bool)

(assert (=> d!142207 m!1196575))

(declare-fun m!1196577 () Bool)

(assert (=> d!142207 m!1196577))

(assert (=> b!1305257 m!1196211))

(assert (=> b!1305002 d!142207))

(assert (=> b!1305002 d!142191))

(assert (=> b!1305002 d!142193))

(assert (=> b!1305038 d!142113))

(assert (=> b!1305000 d!142161))

(assert (=> d!142111 d!142103))

(assert (=> b!1305102 d!142113))

(declare-fun d!142209 () Bool)

(declare-fun isEmpty!1068 (List!29791) Bool)

(assert (=> d!142209 (= (isEmpty!1066 lt!583872) (isEmpty!1068 (toList!10170 lt!583872)))))

(declare-fun bs!37156 () Bool)

(assert (= bs!37156 d!142209))

(declare-fun m!1196579 () Bool)

(assert (=> bs!37156 m!1196579))

(assert (=> b!1305035 d!142209))

(declare-fun call!64304 () Bool)

(declare-fun bm!64301 () Bool)

(declare-fun c!125578 () Bool)

(assert (=> bm!64301 (= call!64304 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125578 (Cons!29788 (select (arr!41923 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125508 (Cons!29788 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) Nil!29789) Nil!29789)) (ite c!125508 (Cons!29788 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) Nil!29789) Nil!29789))))))

(declare-fun b!1305258 () Bool)

(declare-fun e!744618 () Bool)

(declare-fun e!744620 () Bool)

(assert (=> b!1305258 (= e!744618 e!744620)))

(assert (=> b!1305258 (= c!125578 (validKeyInArray!0 (select (arr!41923 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1305259 () Bool)

(assert (=> b!1305259 (= e!744620 call!64304)))

(declare-fun b!1305260 () Bool)

(assert (=> b!1305260 (= e!744620 call!64304)))

(declare-fun b!1305261 () Bool)

(declare-fun e!744619 () Bool)

(assert (=> b!1305261 (= e!744619 e!744618)))

(declare-fun res!866536 () Bool)

(assert (=> b!1305261 (=> (not res!866536) (not e!744618))))

(declare-fun e!744621 () Bool)

(assert (=> b!1305261 (= res!866536 (not e!744621))))

(declare-fun res!866537 () Bool)

(assert (=> b!1305261 (=> (not res!866537) (not e!744621))))

(assert (=> b!1305261 (= res!866537 (validKeyInArray!0 (select (arr!41923 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!142211 () Bool)

(declare-fun res!866538 () Bool)

(assert (=> d!142211 (=> res!866538 e!744619)))

(assert (=> d!142211 (= res!866538 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42474 _keys!1741)))))

(assert (=> d!142211 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125508 (Cons!29788 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) Nil!29789) Nil!29789)) e!744619)))

(declare-fun b!1305262 () Bool)

(assert (=> b!1305262 (= e!744621 (contains!8321 (ite c!125508 (Cons!29788 (select (arr!41923 _keys!1741) #b00000000000000000000000000000000) Nil!29789) Nil!29789) (select (arr!41923 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!142211 (not res!866538)) b!1305261))

(assert (= (and b!1305261 res!866537) b!1305262))

(assert (= (and b!1305261 res!866536) b!1305258))

(assert (= (and b!1305258 c!125578) b!1305260))

(assert (= (and b!1305258 (not c!125578)) b!1305259))

(assert (= (or b!1305260 b!1305259) bm!64301))

(assert (=> bm!64301 m!1196483))

(declare-fun m!1196581 () Bool)

(assert (=> bm!64301 m!1196581))

(assert (=> b!1305258 m!1196483))

(assert (=> b!1305258 m!1196483))

(assert (=> b!1305258 m!1196485))

(assert (=> b!1305261 m!1196483))

(assert (=> b!1305261 m!1196483))

(assert (=> b!1305261 m!1196485))

(assert (=> b!1305262 m!1196483))

(assert (=> b!1305262 m!1196483))

(declare-fun m!1196583 () Bool)

(assert (=> b!1305262 m!1196583))

(assert (=> bm!64271 d!142211))

(assert (=> b!1304997 d!142161))

(declare-fun d!142213 () Bool)

(declare-fun res!866539 () Bool)

(declare-fun e!744622 () Bool)

(assert (=> d!142213 (=> res!866539 e!744622)))

(assert (=> d!142213 (= res!866539 (and ((_ is Cons!29787) (toList!10170 (ListLongMap!20310 Nil!29788))) (= (_1!11333 (h!31005 (toList!10170 (ListLongMap!20310 Nil!29788)))) k0!1205)))))

(assert (=> d!142213 (= (containsKey!727 (toList!10170 (ListLongMap!20310 Nil!29788)) k0!1205) e!744622)))

(declare-fun b!1305263 () Bool)

(declare-fun e!744623 () Bool)

(assert (=> b!1305263 (= e!744622 e!744623)))

(declare-fun res!866540 () Bool)

(assert (=> b!1305263 (=> (not res!866540) (not e!744623))))

(assert (=> b!1305263 (= res!866540 (and (or (not ((_ is Cons!29787) (toList!10170 (ListLongMap!20310 Nil!29788)))) (bvsle (_1!11333 (h!31005 (toList!10170 (ListLongMap!20310 Nil!29788)))) k0!1205)) ((_ is Cons!29787) (toList!10170 (ListLongMap!20310 Nil!29788))) (bvslt (_1!11333 (h!31005 (toList!10170 (ListLongMap!20310 Nil!29788)))) k0!1205)))))

(declare-fun b!1305264 () Bool)

(assert (=> b!1305264 (= e!744623 (containsKey!727 (t!43377 (toList!10170 (ListLongMap!20310 Nil!29788))) k0!1205))))

(assert (= (and d!142213 (not res!866539)) b!1305263))

(assert (= (and b!1305263 res!866540) b!1305264))

(declare-fun m!1196585 () Bool)

(assert (=> b!1305264 m!1196585))

(assert (=> d!142093 d!142213))

(declare-fun d!142215 () Bool)

(assert (=> d!142215 (= (apply!1031 lt!583872 (select (arr!41923 _keys!1741) from!2144)) (get!21218 (getValueByKey!701 (toList!10170 lt!583872) (select (arr!41923 _keys!1741) from!2144))))))

(declare-fun bs!37157 () Bool)

(assert (= bs!37157 d!142215))

(assert (=> bs!37157 m!1196109))

(assert (=> bs!37157 m!1196559))

(assert (=> bs!37157 m!1196559))

(declare-fun m!1196587 () Bool)

(assert (=> bs!37157 m!1196587))

(assert (=> b!1305037 d!142215))

(assert (=> b!1305037 d!142197))

(assert (=> b!1304986 d!142153))

(assert (=> b!1304986 d!142155))

(assert (=> b!1305032 d!142113))

(declare-fun d!142217 () Bool)

(declare-fun e!744624 () Bool)

(assert (=> d!142217 e!744624))

(declare-fun res!866542 () Bool)

(assert (=> d!142217 (=> (not res!866542) (not e!744624))))

(declare-fun lt!584053 () ListLongMap!20309)

(assert (=> d!142217 (= res!866542 (contains!8318 lt!584053 (_1!11333 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!584051 () List!29791)

(assert (=> d!142217 (= lt!584053 (ListLongMap!20310 lt!584051))))

(declare-fun lt!584052 () Unit!43134)

(declare-fun lt!584050 () Unit!43134)

(assert (=> d!142217 (= lt!584052 lt!584050)))

(assert (=> d!142217 (= (getValueByKey!701 lt!584051 (_1!11333 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!751 (_2!11333 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142217 (= lt!584050 (lemmaContainsTupThenGetReturnValue!352 lt!584051 (_1!11333 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11333 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142217 (= lt!584051 (insertStrictlySorted!481 (toList!10170 call!64277) (_1!11333 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11333 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142217 (= (+!4530 call!64277 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!584053)))

(declare-fun b!1305265 () Bool)

(declare-fun res!866541 () Bool)

(assert (=> b!1305265 (=> (not res!866541) (not e!744624))))

(assert (=> b!1305265 (= res!866541 (= (getValueByKey!701 (toList!10170 lt!584053) (_1!11333 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!751 (_2!11333 (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1305266 () Bool)

(assert (=> b!1305266 (= e!744624 (contains!8322 (toList!10170 lt!584053) (tuple2!22645 (select (arr!41923 _keys!1741) from!2144) (get!21217 (select (arr!41922 _values!1445) from!2144) (dynLambda!3492 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142217 res!866542) b!1305265))

(assert (= (and b!1305265 res!866541) b!1305266))

(declare-fun m!1196589 () Bool)

(assert (=> d!142217 m!1196589))

(declare-fun m!1196591 () Bool)

(assert (=> d!142217 m!1196591))

(declare-fun m!1196593 () Bool)

(assert (=> d!142217 m!1196593))

(declare-fun m!1196595 () Bool)

(assert (=> d!142217 m!1196595))

(declare-fun m!1196597 () Bool)

(assert (=> b!1305265 m!1196597))

(declare-fun m!1196599 () Bool)

(assert (=> b!1305266 m!1196599))

(assert (=> b!1305033 d!142217))

(declare-fun d!142219 () Bool)

(declare-fun e!744625 () Bool)

(assert (=> d!142219 e!744625))

(declare-fun res!866543 () Bool)

(assert (=> d!142219 (=> res!866543 e!744625)))

(declare-fun lt!584055 () Bool)

(assert (=> d!142219 (= res!866543 (not lt!584055))))

(declare-fun lt!584056 () Bool)

(assert (=> d!142219 (= lt!584055 lt!584056)))

(declare-fun lt!584054 () Unit!43134)

(declare-fun e!744626 () Unit!43134)

(assert (=> d!142219 (= lt!584054 e!744626)))

(declare-fun c!125579 () Bool)

(assert (=> d!142219 (= c!125579 lt!584056)))

(assert (=> d!142219 (= lt!584056 (containsKey!727 (toList!10170 (+!4530 lt!583867 (tuple2!22645 lt!583868 lt!583869))) lt!583871))))

(assert (=> d!142219 (= (contains!8318 (+!4530 lt!583867 (tuple2!22645 lt!583868 lt!583869)) lt!583871) lt!584055)))

(declare-fun b!1305267 () Bool)

(declare-fun lt!584057 () Unit!43134)

(assert (=> b!1305267 (= e!744626 lt!584057)))

(assert (=> b!1305267 (= lt!584057 (lemmaContainsKeyImpliesGetValueByKeyDefined!473 (toList!10170 (+!4530 lt!583867 (tuple2!22645 lt!583868 lt!583869))) lt!583871))))

(assert (=> b!1305267 (isDefined!510 (getValueByKey!701 (toList!10170 (+!4530 lt!583867 (tuple2!22645 lt!583868 lt!583869))) lt!583871))))

(declare-fun b!1305268 () Bool)

(declare-fun Unit!43149 () Unit!43134)

(assert (=> b!1305268 (= e!744626 Unit!43149)))

(declare-fun b!1305269 () Bool)

(assert (=> b!1305269 (= e!744625 (isDefined!510 (getValueByKey!701 (toList!10170 (+!4530 lt!583867 (tuple2!22645 lt!583868 lt!583869))) lt!583871)))))

(assert (= (and d!142219 c!125579) b!1305267))

(assert (= (and d!142219 (not c!125579)) b!1305268))

(assert (= (and d!142219 (not res!866543)) b!1305269))

(declare-fun m!1196601 () Bool)

(assert (=> d!142219 m!1196601))

(declare-fun m!1196603 () Bool)

(assert (=> b!1305267 m!1196603))

(declare-fun m!1196605 () Bool)

(assert (=> b!1305267 m!1196605))

(assert (=> b!1305267 m!1196605))

(declare-fun m!1196607 () Bool)

(assert (=> b!1305267 m!1196607))

(assert (=> b!1305269 m!1196605))

(assert (=> b!1305269 m!1196605))

(assert (=> b!1305269 m!1196607))

(assert (=> b!1305033 d!142219))

(declare-fun d!142221 () Bool)

(declare-fun e!744627 () Bool)

(assert (=> d!142221 e!744627))

(declare-fun res!866545 () Bool)

(assert (=> d!142221 (=> (not res!866545) (not e!744627))))

(declare-fun lt!584061 () ListLongMap!20309)

(assert (=> d!142221 (= res!866545 (contains!8318 lt!584061 (_1!11333 (tuple2!22645 lt!583868 lt!583869))))))

(declare-fun lt!584059 () List!29791)

(assert (=> d!142221 (= lt!584061 (ListLongMap!20310 lt!584059))))

(declare-fun lt!584060 () Unit!43134)

(declare-fun lt!584058 () Unit!43134)

(assert (=> d!142221 (= lt!584060 lt!584058)))

(assert (=> d!142221 (= (getValueByKey!701 lt!584059 (_1!11333 (tuple2!22645 lt!583868 lt!583869))) (Some!751 (_2!11333 (tuple2!22645 lt!583868 lt!583869))))))

(assert (=> d!142221 (= lt!584058 (lemmaContainsTupThenGetReturnValue!352 lt!584059 (_1!11333 (tuple2!22645 lt!583868 lt!583869)) (_2!11333 (tuple2!22645 lt!583868 lt!583869))))))

(assert (=> d!142221 (= lt!584059 (insertStrictlySorted!481 (toList!10170 lt!583867) (_1!11333 (tuple2!22645 lt!583868 lt!583869)) (_2!11333 (tuple2!22645 lt!583868 lt!583869))))))

(assert (=> d!142221 (= (+!4530 lt!583867 (tuple2!22645 lt!583868 lt!583869)) lt!584061)))

(declare-fun b!1305270 () Bool)

(declare-fun res!866544 () Bool)

(assert (=> b!1305270 (=> (not res!866544) (not e!744627))))

(assert (=> b!1305270 (= res!866544 (= (getValueByKey!701 (toList!10170 lt!584061) (_1!11333 (tuple2!22645 lt!583868 lt!583869))) (Some!751 (_2!11333 (tuple2!22645 lt!583868 lt!583869)))))))

(declare-fun b!1305271 () Bool)

(assert (=> b!1305271 (= e!744627 (contains!8322 (toList!10170 lt!584061) (tuple2!22645 lt!583868 lt!583869)))))

(assert (= (and d!142221 res!866545) b!1305270))

(assert (= (and b!1305270 res!866544) b!1305271))

(declare-fun m!1196609 () Bool)

(assert (=> d!142221 m!1196609))

(declare-fun m!1196611 () Bool)

(assert (=> d!142221 m!1196611))

(declare-fun m!1196613 () Bool)

(assert (=> d!142221 m!1196613))

(declare-fun m!1196615 () Bool)

(assert (=> d!142221 m!1196615))

(declare-fun m!1196617 () Bool)

(assert (=> b!1305270 m!1196617))

(declare-fun m!1196619 () Bool)

(assert (=> b!1305271 m!1196619))

(assert (=> b!1305033 d!142221))

(declare-fun d!142223 () Bool)

(assert (=> d!142223 (not (contains!8318 (+!4530 lt!583867 (tuple2!22645 lt!583868 lt!583869)) lt!583871))))

(declare-fun lt!584064 () Unit!43134)

(declare-fun choose!1928 (ListLongMap!20309 (_ BitVec 64) V!51649 (_ BitVec 64)) Unit!43134)

(assert (=> d!142223 (= lt!584064 (choose!1928 lt!583867 lt!583868 lt!583869 lt!583871))))

(declare-fun e!744630 () Bool)

(assert (=> d!142223 e!744630))

(declare-fun res!866548 () Bool)

(assert (=> d!142223 (=> (not res!866548) (not e!744630))))

(assert (=> d!142223 (= res!866548 (not (contains!8318 lt!583867 lt!583871)))))

(assert (=> d!142223 (= (addStillNotContains!481 lt!583867 lt!583868 lt!583869 lt!583871) lt!584064)))

(declare-fun b!1305275 () Bool)

(assert (=> b!1305275 (= e!744630 (not (= lt!583868 lt!583871)))))

(assert (= (and d!142223 res!866548) b!1305275))

(assert (=> d!142223 m!1196241))

(assert (=> d!142223 m!1196241))

(assert (=> d!142223 m!1196243))

(declare-fun m!1196621 () Bool)

(assert (=> d!142223 m!1196621))

(declare-fun m!1196623 () Bool)

(assert (=> d!142223 m!1196623))

(assert (=> b!1305033 d!142223))

(assert (=> b!1305033 d!142197))

(declare-fun b!1305277 () Bool)

(declare-fun e!744632 () Bool)

(assert (=> b!1305277 (= e!744632 tp_is_empty!34909)))

(declare-fun mapNonEmpty!53966 () Bool)

(declare-fun mapRes!53966 () Bool)

(declare-fun tp!102974 () Bool)

(declare-fun e!744631 () Bool)

(assert (=> mapNonEmpty!53966 (= mapRes!53966 (and tp!102974 e!744631))))

(declare-fun mapKey!53966 () (_ BitVec 32))

(declare-fun mapValue!53966 () ValueCell!16556)

(declare-fun mapRest!53966 () (Array (_ BitVec 32) ValueCell!16556))

(assert (=> mapNonEmpty!53966 (= mapRest!53965 (store mapRest!53966 mapKey!53966 mapValue!53966))))

(declare-fun mapIsEmpty!53966 () Bool)

(assert (=> mapIsEmpty!53966 mapRes!53966))

(declare-fun condMapEmpty!53966 () Bool)

(declare-fun mapDefault!53966 () ValueCell!16556)

(assert (=> mapNonEmpty!53965 (= condMapEmpty!53966 (= mapRest!53965 ((as const (Array (_ BitVec 32) ValueCell!16556)) mapDefault!53966)))))

(assert (=> mapNonEmpty!53965 (= tp!102973 (and e!744632 mapRes!53966))))

(declare-fun b!1305276 () Bool)

(assert (=> b!1305276 (= e!744631 tp_is_empty!34909)))

(assert (= (and mapNonEmpty!53965 condMapEmpty!53966) mapIsEmpty!53966))

(assert (= (and mapNonEmpty!53965 (not condMapEmpty!53966)) mapNonEmpty!53966))

(assert (= (and mapNonEmpty!53966 ((_ is ValueCellFull!16556) mapValue!53966)) b!1305276))

(assert (= (and mapNonEmpty!53965 ((_ is ValueCellFull!16556) mapDefault!53966)) b!1305277))

(declare-fun m!1196625 () Bool)

(assert (=> mapNonEmpty!53966 m!1196625))

(declare-fun b_lambda!23285 () Bool)

(assert (= b_lambda!23283 (or (and start!110294 b_free!29269) b_lambda!23285)))

(declare-fun b_lambda!23287 () Bool)

(assert (= b_lambda!23281 (or (and start!110294 b_free!29269) b_lambda!23287)))

(check-sat (not d!142117) (not d!142205) (not b!1305232) (not d!142149) (not b!1305240) (not bm!64299) (not b!1305266) (not b_lambda!23279) (not b!1305228) (not b!1305181) (not b!1305161) (not b!1305235) (not b!1305205) (not d!142129) (not b!1305168) (not b!1305216) (not d!142127) (not d!142157) (not d!142199) (not d!142219) (not b!1305256) (not d!142203) (not b!1305154) (not b!1305148) (not d!142165) (not b!1305270) (not d!142207) (not d!142141) (not bm!64301) (not b!1305257) (not d!142135) (not b!1305215) (not d!142195) (not b!1305237) (not d!142223) (not b!1305269) (not d!142123) b_and!47449 (not d!142131) (not b!1305208) (not b!1305165) (not b!1305230) (not d!142217) (not b!1305174) (not d!142151) (not d!142209) (not b!1305196) (not b!1305172) (not b!1305224) (not d!142183) (not b!1305227) (not d!142221) (not d!142139) (not b!1305145) (not b!1305209) (not d!142201) (not d!142175) (not b!1305262) (not b!1305247) (not b!1305157) (not b!1305258) (not b!1305254) (not b!1305234) (not b_next!29269) (not d!142167) tp_is_empty!34909 (not d!142177) (not d!142181) (not d!142163) (not b!1305214) (not b!1305250) (not b_lambda!23275) (not b!1305264) (not b!1305251) (not d!142171) (not b!1305175) (not d!142121) (not d!142153) (not d!142147) (not b!1305261) (not d!142187) (not b!1305158) (not b!1305160) (not b!1305206) (not b!1305139) (not b!1305248) (not d!142191) (not d!142159) (not b!1305246) (not b!1305267) (not mapNonEmpty!53966) (not b_lambda!23277) (not b!1305171) (not d!142137) (not b!1305265) (not bm!64300) (not d!142145) (not b!1305217) (not d!142133) (not b!1305156) (not b_lambda!23287) (not b_lambda!23285) (not b!1305271) (not d!142125) (not b!1305170) (not d!142215) (not b!1305233) (not b!1305211) (not b!1305146) (not b!1305223) (not b!1305147) (not d!142185) (not b!1305253) (not d!142143))
(check-sat b_and!47449 (not b_next!29269))
