; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110046 () Bool)

(assert start!110046)

(declare-fun b_free!29215 () Bool)

(declare-fun b_next!29215 () Bool)

(assert (=> start!110046 (= b_free!29215 (not b_next!29215))))

(declare-fun tp!102778 () Bool)

(declare-fun b_and!47331 () Bool)

(assert (=> start!110046 (= tp!102778 b_and!47331)))

(declare-fun b!1302521 () Bool)

(declare-fun e!743027 () Bool)

(declare-fun e!743030 () Bool)

(declare-fun mapRes!53858 () Bool)

(assert (=> b!1302521 (= e!743027 (and e!743030 mapRes!53858))))

(declare-fun condMapEmpty!53858 () Bool)

(declare-datatypes ((V!51577 0))(
  ( (V!51578 (val!17502 Int)) )
))
(declare-datatypes ((ValueCell!16529 0))(
  ( (ValueCellFull!16529 (v!20105 V!51577)) (EmptyCell!16529) )
))
(declare-datatypes ((array!86757 0))(
  ( (array!86758 (arr!41870 (Array (_ BitVec 32) ValueCell!16529)) (size!42421 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86757)

(declare-fun mapDefault!53858 () ValueCell!16529)

(assert (=> b!1302521 (= condMapEmpty!53858 (= (arr!41870 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16529)) mapDefault!53858)))))

(declare-fun b!1302522 () Bool)

(declare-fun res!865083 () Bool)

(declare-fun e!743029 () Bool)

(assert (=> b!1302522 (=> (not res!865083) (not e!743029))))

(declare-datatypes ((array!86759 0))(
  ( (array!86760 (arr!41871 (Array (_ BitVec 32) (_ BitVec 64))) (size!42422 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86759)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302522 (= res!865083 (validKeyInArray!0 (select (arr!41871 _keys!1741) from!2144)))))

(declare-fun b!1302523 () Bool)

(declare-fun res!865082 () Bool)

(assert (=> b!1302523 (=> (not res!865082) (not e!743029))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1302523 (= res!865082 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42422 _keys!1741))))))

(declare-fun bm!63951 () Bool)

(declare-datatypes ((tuple2!22596 0))(
  ( (tuple2!22597 (_1!11309 (_ BitVec 64)) (_2!11309 V!51577)) )
))
(declare-datatypes ((List!29749 0))(
  ( (Nil!29746) (Cons!29745 (h!30963 tuple2!22596) (t!43317 List!29749)) )
))
(declare-datatypes ((ListLongMap!20261 0))(
  ( (ListLongMap!20262 (toList!10146 List!29749)) )
))
(declare-fun call!63958 () ListLongMap!20261)

(declare-fun call!63954 () ListLongMap!20261)

(assert (=> bm!63951 (= call!63958 call!63954)))

(declare-fun zeroValue!1387 () V!51577)

(declare-fun lt!582313 () ListLongMap!20261)

(declare-fun lt!582314 () ListLongMap!20261)

(declare-fun c!125115 () Bool)

(declare-fun c!125113 () Bool)

(declare-datatypes ((Unit!43036 0))(
  ( (Unit!43037) )
))
(declare-fun call!63959 () Unit!43036)

(declare-fun lt!582315 () ListLongMap!20261)

(declare-fun minValue!1387 () V!51577)

(declare-fun bm!63952 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!87 ((_ BitVec 64) (_ BitVec 64) V!51577 ListLongMap!20261) Unit!43036)

(assert (=> bm!63952 (= call!63959 (lemmaInListMapAfterAddingDiffThenInBefore!87 k0!1205 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)) (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))))))

(declare-fun mapIsEmpty!53858 () Bool)

(assert (=> mapIsEmpty!53858 mapRes!53858))

(declare-fun b!1302524 () Bool)

(declare-fun e!743028 () Bool)

(assert (=> b!1302524 (= e!743029 (not e!743028))))

(declare-fun res!865084 () Bool)

(assert (=> b!1302524 (=> res!865084 e!743028)))

(assert (=> b!1302524 (= res!865084 (= k0!1205 (select (arr!41871 _keys!1741) from!2144)))))

(declare-fun contains!8284 (ListLongMap!20261 (_ BitVec 64)) Bool)

(assert (=> b!1302524 (not (contains!8284 (ListLongMap!20262 Nil!29746) k0!1205))))

(declare-fun lt!582310 () Unit!43036)

(declare-fun emptyContainsNothing!205 ((_ BitVec 64)) Unit!43036)

(assert (=> b!1302524 (= lt!582310 (emptyContainsNothing!205 k0!1205))))

(declare-fun lt!582320 () Unit!43036)

(declare-fun e!743031 () Unit!43036)

(assert (=> b!1302524 (= lt!582320 e!743031)))

(declare-fun lt!582311 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1302524 (= c!125113 (and (not lt!582311) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1302524 (= lt!582311 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!865079 () Bool)

(assert (=> start!110046 (=> (not res!865079) (not e!743029))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110046 (= res!865079 (validMask!0 mask!2175))))

(assert (=> start!110046 e!743029))

(declare-fun tp_is_empty!34855 () Bool)

(assert (=> start!110046 tp_is_empty!34855))

(assert (=> start!110046 true))

(declare-fun array_inv!31919 (array!86757) Bool)

(assert (=> start!110046 (and (array_inv!31919 _values!1445) e!743027)))

(declare-fun array_inv!31920 (array!86759) Bool)

(assert (=> start!110046 (array_inv!31920 _keys!1741)))

(assert (=> start!110046 tp!102778))

(declare-fun b!1302525 () Bool)

(declare-fun res!865078 () Bool)

(assert (=> b!1302525 (=> (not res!865078) (not e!743029))))

(declare-datatypes ((List!29750 0))(
  ( (Nil!29747) (Cons!29746 (h!30964 (_ BitVec 64)) (t!43318 List!29750)) )
))
(declare-fun arrayNoDuplicates!0 (array!86759 (_ BitVec 32) List!29750) Bool)

(assert (=> b!1302525 (= res!865078 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29747))))

(declare-fun b!1302526 () Bool)

(declare-fun call!63956 () Bool)

(assert (=> b!1302526 call!63956))

(declare-fun lt!582318 () Unit!43036)

(declare-fun call!63957 () Unit!43036)

(assert (=> b!1302526 (= lt!582318 call!63957)))

(assert (=> b!1302526 (= lt!582315 call!63958)))

(declare-fun e!743026 () Unit!43036)

(assert (=> b!1302526 (= e!743026 lt!582318)))

(declare-fun b!1302527 () Bool)

(declare-fun e!743034 () Unit!43036)

(declare-fun lt!582319 () Unit!43036)

(assert (=> b!1302527 (= e!743034 lt!582319)))

(assert (=> b!1302527 (= lt!582313 call!63958)))

(assert (=> b!1302527 (= lt!582319 call!63957)))

(assert (=> b!1302527 call!63956))

(declare-fun b!1302528 () Bool)

(declare-fun res!865081 () Bool)

(assert (=> b!1302528 (=> (not res!865081) (not e!743029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86759 (_ BitVec 32)) Bool)

(assert (=> b!1302528 (= res!865081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun call!63955 () Bool)

(declare-fun bm!63953 () Bool)

(assert (=> bm!63953 (= call!63955 (contains!8284 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) k0!1205))))

(declare-fun b!1302529 () Bool)

(assert (=> b!1302529 (= e!743031 e!743026)))

(assert (=> b!1302529 (= c!125115 (and (not lt!582311) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!53858 () Bool)

(declare-fun tp!102779 () Bool)

(declare-fun e!743033 () Bool)

(assert (=> mapNonEmpty!53858 (= mapRes!53858 (and tp!102779 e!743033))))

(declare-fun mapRest!53858 () (Array (_ BitVec 32) ValueCell!16529))

(declare-fun mapValue!53858 () ValueCell!16529)

(declare-fun mapKey!53858 () (_ BitVec 32))

(assert (=> mapNonEmpty!53858 (= (arr!41870 _values!1445) (store mapRest!53858 mapKey!53858 mapValue!53858))))

(declare-fun b!1302530 () Bool)

(assert (=> b!1302530 (= e!743030 tp_is_empty!34855)))

(declare-fun b!1302531 () Bool)

(declare-fun c!125114 () Bool)

(assert (=> b!1302531 (= c!125114 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582311))))

(assert (=> b!1302531 (= e!743026 e!743034)))

(declare-fun b!1302532 () Bool)

(declare-fun res!865086 () Bool)

(assert (=> b!1302532 (=> (not res!865086) (not e!743029))))

(assert (=> b!1302532 (= res!865086 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42422 _keys!1741))))))

(declare-fun bm!63954 () Bool)

(assert (=> bm!63954 (= call!63956 call!63955)))

(declare-fun b!1302533 () Bool)

(declare-fun res!865085 () Bool)

(assert (=> b!1302533 (=> (not res!865085) (not e!743029))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5159 (array!86759 array!86757 (_ BitVec 32) (_ BitVec 32) V!51577 V!51577 (_ BitVec 32) Int) ListLongMap!20261)

(assert (=> b!1302533 (= res!865085 (contains!8284 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1302534 () Bool)

(assert (=> b!1302534 (= e!743028 false)))

(declare-fun lt!582316 () V!51577)

(declare-fun +!4512 (ListLongMap!20261 tuple2!22596) ListLongMap!20261)

(assert (=> b!1302534 (not (contains!8284 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) k0!1205))))

(declare-fun lt!582309 () Unit!43036)

(declare-fun addStillNotContains!465 (ListLongMap!20261 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!43036)

(assert (=> b!1302534 (= lt!582309 (addStillNotContains!465 (ListLongMap!20262 Nil!29746) (select (arr!41871 _keys!1741) from!2144) lt!582316 k0!1205))))

(declare-fun get!21184 (ValueCell!16529 V!51577) V!51577)

(declare-fun dynLambda!3483 (Int (_ BitVec 64)) V!51577)

(assert (=> b!1302534 (= lt!582316 (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302535 () Bool)

(declare-fun lt!582317 () Unit!43036)

(assert (=> b!1302535 (= e!743031 lt!582317)))

(declare-fun lt!582321 () ListLongMap!20261)

(assert (=> b!1302535 (= lt!582321 call!63954)))

(assert (=> b!1302535 (= lt!582314 (+!4512 lt!582321 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!582312 () Unit!43036)

(assert (=> b!1302535 (= lt!582312 call!63959)))

(assert (=> b!1302535 call!63955))

(assert (=> b!1302535 (= lt!582317 (lemmaInListMapAfterAddingDiffThenInBefore!87 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!582321))))

(assert (=> b!1302535 (contains!8284 lt!582321 k0!1205)))

(declare-fun b!1302536 () Bool)

(assert (=> b!1302536 (= e!743033 tp_is_empty!34855)))

(declare-fun b!1302537 () Bool)

(declare-fun Unit!43038 () Unit!43036)

(assert (=> b!1302537 (= e!743034 Unit!43038)))

(declare-fun bm!63955 () Bool)

(assert (=> bm!63955 (= call!63957 call!63959)))

(declare-fun bm!63956 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6151 (array!86759 array!86757 (_ BitVec 32) (_ BitVec 32) V!51577 V!51577 (_ BitVec 32) Int) ListLongMap!20261)

(assert (=> bm!63956 (= call!63954 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302538 () Bool)

(declare-fun res!865080 () Bool)

(assert (=> b!1302538 (=> (not res!865080) (not e!743029))))

(assert (=> b!1302538 (= res!865080 (and (= (size!42421 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42422 _keys!1741) (size!42421 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!110046 res!865079) b!1302538))

(assert (= (and b!1302538 res!865080) b!1302528))

(assert (= (and b!1302528 res!865081) b!1302525))

(assert (= (and b!1302525 res!865078) b!1302532))

(assert (= (and b!1302532 res!865086) b!1302533))

(assert (= (and b!1302533 res!865085) b!1302523))

(assert (= (and b!1302523 res!865082) b!1302522))

(assert (= (and b!1302522 res!865083) b!1302524))

(assert (= (and b!1302524 c!125113) b!1302535))

(assert (= (and b!1302524 (not c!125113)) b!1302529))

(assert (= (and b!1302529 c!125115) b!1302526))

(assert (= (and b!1302529 (not c!125115)) b!1302531))

(assert (= (and b!1302531 c!125114) b!1302527))

(assert (= (and b!1302531 (not c!125114)) b!1302537))

(assert (= (or b!1302526 b!1302527) bm!63951))

(assert (= (or b!1302526 b!1302527) bm!63955))

(assert (= (or b!1302526 b!1302527) bm!63954))

(assert (= (or b!1302535 bm!63951) bm!63956))

(assert (= (or b!1302535 bm!63955) bm!63952))

(assert (= (or b!1302535 bm!63954) bm!63953))

(assert (= (and b!1302524 (not res!865084)) b!1302534))

(assert (= (and b!1302521 condMapEmpty!53858) mapIsEmpty!53858))

(assert (= (and b!1302521 (not condMapEmpty!53858)) mapNonEmpty!53858))

(get-info :version)

(assert (= (and mapNonEmpty!53858 ((_ is ValueCellFull!16529) mapValue!53858)) b!1302536))

(assert (= (and b!1302521 ((_ is ValueCellFull!16529) mapDefault!53858)) b!1302530))

(assert (= start!110046 b!1302521))

(declare-fun b_lambda!23179 () Bool)

(assert (=> (not b_lambda!23179) (not b!1302534)))

(declare-fun t!43316 () Bool)

(declare-fun tb!11371 () Bool)

(assert (=> (and start!110046 (= defaultEntry!1448 defaultEntry!1448) t!43316) tb!11371))

(declare-fun result!23761 () Bool)

(assert (=> tb!11371 (= result!23761 tp_is_empty!34855)))

(assert (=> b!1302534 t!43316))

(declare-fun b_and!47333 () Bool)

(assert (= b_and!47331 (and (=> t!43316 result!23761) b_and!47333)))

(declare-fun m!1193531 () Bool)

(assert (=> b!1302524 m!1193531))

(declare-fun m!1193533 () Bool)

(assert (=> b!1302524 m!1193533))

(declare-fun m!1193535 () Bool)

(assert (=> b!1302524 m!1193535))

(declare-fun m!1193537 () Bool)

(assert (=> bm!63953 m!1193537))

(declare-fun m!1193539 () Bool)

(assert (=> b!1302528 m!1193539))

(declare-fun m!1193541 () Bool)

(assert (=> b!1302525 m!1193541))

(declare-fun m!1193543 () Bool)

(assert (=> b!1302535 m!1193543))

(declare-fun m!1193545 () Bool)

(assert (=> b!1302535 m!1193545))

(declare-fun m!1193547 () Bool)

(assert (=> b!1302535 m!1193547))

(declare-fun m!1193549 () Bool)

(assert (=> b!1302534 m!1193549))

(declare-fun m!1193551 () Bool)

(assert (=> b!1302534 m!1193551))

(assert (=> b!1302534 m!1193531))

(declare-fun m!1193553 () Bool)

(assert (=> b!1302534 m!1193553))

(declare-fun m!1193555 () Bool)

(assert (=> b!1302534 m!1193555))

(declare-fun m!1193557 () Bool)

(assert (=> b!1302534 m!1193557))

(assert (=> b!1302534 m!1193551))

(assert (=> b!1302534 m!1193549))

(declare-fun m!1193559 () Bool)

(assert (=> b!1302534 m!1193559))

(assert (=> b!1302534 m!1193555))

(assert (=> b!1302534 m!1193531))

(declare-fun m!1193561 () Bool)

(assert (=> start!110046 m!1193561))

(declare-fun m!1193563 () Bool)

(assert (=> start!110046 m!1193563))

(declare-fun m!1193565 () Bool)

(assert (=> start!110046 m!1193565))

(assert (=> b!1302522 m!1193531))

(assert (=> b!1302522 m!1193531))

(declare-fun m!1193567 () Bool)

(assert (=> b!1302522 m!1193567))

(declare-fun m!1193569 () Bool)

(assert (=> b!1302533 m!1193569))

(assert (=> b!1302533 m!1193569))

(declare-fun m!1193571 () Bool)

(assert (=> b!1302533 m!1193571))

(declare-fun m!1193573 () Bool)

(assert (=> bm!63956 m!1193573))

(declare-fun m!1193575 () Bool)

(assert (=> bm!63952 m!1193575))

(declare-fun m!1193577 () Bool)

(assert (=> mapNonEmpty!53858 m!1193577))

(check-sat (not b!1302533) (not b_next!29215) (not b!1302525) (not b!1302528) (not b!1302534) (not b!1302522) (not bm!63953) (not start!110046) (not mapNonEmpty!53858) (not b_lambda!23179) (not b!1302524) tp_is_empty!34855 b_and!47333 (not bm!63952) (not bm!63956) (not b!1302535))
(check-sat b_and!47333 (not b_next!29215))
(get-model)

(declare-fun b_lambda!23185 () Bool)

(assert (= b_lambda!23179 (or (and start!110046 b_free!29215) b_lambda!23185)))

(check-sat (not b!1302533) (not b_next!29215) (not b!1302525) (not b!1302534) (not b!1302522) (not bm!63953) (not start!110046) (not mapNonEmpty!53858) (not b!1302524) tp_is_empty!34855 (not b!1302528) (not b_lambda!23185) b_and!47333 (not bm!63952) (not bm!63956) (not b!1302535))
(check-sat b_and!47333 (not b_next!29215))
(get-model)

(declare-fun d!141639 () Bool)

(declare-fun res!865148 () Bool)

(declare-fun e!743097 () Bool)

(assert (=> d!141639 (=> res!865148 e!743097)))

(assert (=> d!141639 (= res!865148 (bvsge #b00000000000000000000000000000000 (size!42422 _keys!1741)))))

(assert (=> d!141639 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29747) e!743097)))

(declare-fun b!1302663 () Bool)

(declare-fun e!743098 () Bool)

(declare-fun e!743100 () Bool)

(assert (=> b!1302663 (= e!743098 e!743100)))

(declare-fun c!125136 () Bool)

(assert (=> b!1302663 (= c!125136 (validKeyInArray!0 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63995 () Bool)

(declare-fun call!63998 () Bool)

(assert (=> bm!63995 (= call!63998 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125136 (Cons!29746 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) Nil!29747) Nil!29747)))))

(declare-fun b!1302664 () Bool)

(assert (=> b!1302664 (= e!743097 e!743098)))

(declare-fun res!865149 () Bool)

(assert (=> b!1302664 (=> (not res!865149) (not e!743098))))

(declare-fun e!743099 () Bool)

(assert (=> b!1302664 (= res!865149 (not e!743099))))

(declare-fun res!865147 () Bool)

(assert (=> b!1302664 (=> (not res!865147) (not e!743099))))

(assert (=> b!1302664 (= res!865147 (validKeyInArray!0 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302665 () Bool)

(assert (=> b!1302665 (= e!743100 call!63998)))

(declare-fun b!1302666 () Bool)

(assert (=> b!1302666 (= e!743100 call!63998)))

(declare-fun b!1302667 () Bool)

(declare-fun contains!8287 (List!29750 (_ BitVec 64)) Bool)

(assert (=> b!1302667 (= e!743099 (contains!8287 Nil!29747 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141639 (not res!865148)) b!1302664))

(assert (= (and b!1302664 res!865147) b!1302667))

(assert (= (and b!1302664 res!865149) b!1302663))

(assert (= (and b!1302663 c!125136) b!1302666))

(assert (= (and b!1302663 (not c!125136)) b!1302665))

(assert (= (or b!1302666 b!1302665) bm!63995))

(declare-fun m!1193675 () Bool)

(assert (=> b!1302663 m!1193675))

(assert (=> b!1302663 m!1193675))

(declare-fun m!1193677 () Bool)

(assert (=> b!1302663 m!1193677))

(assert (=> bm!63995 m!1193675))

(declare-fun m!1193679 () Bool)

(assert (=> bm!63995 m!1193679))

(assert (=> b!1302664 m!1193675))

(assert (=> b!1302664 m!1193675))

(assert (=> b!1302664 m!1193677))

(assert (=> b!1302667 m!1193675))

(assert (=> b!1302667 m!1193675))

(declare-fun m!1193681 () Bool)

(assert (=> b!1302667 m!1193681))

(assert (=> b!1302525 d!141639))

(declare-fun d!141641 () Bool)

(assert (=> d!141641 (= (validKeyInArray!0 (select (arr!41871 _keys!1741) from!2144)) (and (not (= (select (arr!41871 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41871 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302522 d!141641))

(declare-fun d!141643 () Bool)

(assert (=> d!141643 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110046 d!141643))

(declare-fun d!141645 () Bool)

(assert (=> d!141645 (= (array_inv!31919 _values!1445) (bvsge (size!42421 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110046 d!141645))

(declare-fun d!141647 () Bool)

(assert (=> d!141647 (= (array_inv!31920 _keys!1741) (bvsge (size!42422 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110046 d!141647))

(declare-fun d!141649 () Bool)

(declare-fun e!743106 () Bool)

(assert (=> d!141649 e!743106))

(declare-fun res!865152 () Bool)

(assert (=> d!141649 (=> res!865152 e!743106)))

(declare-fun lt!582408 () Bool)

(assert (=> d!141649 (= res!865152 (not lt!582408))))

(declare-fun lt!582409 () Bool)

(assert (=> d!141649 (= lt!582408 lt!582409)))

(declare-fun lt!582411 () Unit!43036)

(declare-fun e!743105 () Unit!43036)

(assert (=> d!141649 (= lt!582411 e!743105)))

(declare-fun c!125139 () Bool)

(assert (=> d!141649 (= c!125139 lt!582409)))

(declare-fun containsKey!722 (List!29749 (_ BitVec 64)) Bool)

(assert (=> d!141649 (= lt!582409 (containsKey!722 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205))))

(assert (=> d!141649 (= (contains!8284 (ListLongMap!20262 Nil!29746) k0!1205) lt!582408)))

(declare-fun b!1302674 () Bool)

(declare-fun lt!582410 () Unit!43036)

(assert (=> b!1302674 (= e!743105 lt!582410)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!468 (List!29749 (_ BitVec 64)) Unit!43036)

(assert (=> b!1302674 (= lt!582410 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205))))

(declare-datatypes ((Option!747 0))(
  ( (Some!746 (v!20108 V!51577)) (None!745) )
))
(declare-fun isDefined!505 (Option!747) Bool)

(declare-fun getValueByKey!696 (List!29749 (_ BitVec 64)) Option!747)

(assert (=> b!1302674 (isDefined!505 (getValueByKey!696 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205))))

(declare-fun b!1302675 () Bool)

(declare-fun Unit!43044 () Unit!43036)

(assert (=> b!1302675 (= e!743105 Unit!43044)))

(declare-fun b!1302676 () Bool)

(assert (=> b!1302676 (= e!743106 (isDefined!505 (getValueByKey!696 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205)))))

(assert (= (and d!141649 c!125139) b!1302674))

(assert (= (and d!141649 (not c!125139)) b!1302675))

(assert (= (and d!141649 (not res!865152)) b!1302676))

(declare-fun m!1193683 () Bool)

(assert (=> d!141649 m!1193683))

(declare-fun m!1193685 () Bool)

(assert (=> b!1302674 m!1193685))

(declare-fun m!1193687 () Bool)

(assert (=> b!1302674 m!1193687))

(assert (=> b!1302674 m!1193687))

(declare-fun m!1193689 () Bool)

(assert (=> b!1302674 m!1193689))

(assert (=> b!1302676 m!1193687))

(assert (=> b!1302676 m!1193687))

(assert (=> b!1302676 m!1193689))

(assert (=> b!1302524 d!141649))

(declare-fun d!141651 () Bool)

(assert (=> d!141651 (not (contains!8284 (ListLongMap!20262 Nil!29746) k0!1205))))

(declare-fun lt!582414 () Unit!43036)

(declare-fun choose!1906 ((_ BitVec 64)) Unit!43036)

(assert (=> d!141651 (= lt!582414 (choose!1906 k0!1205))))

(assert (=> d!141651 (= (emptyContainsNothing!205 k0!1205) lt!582414)))

(declare-fun bs!37065 () Bool)

(assert (= bs!37065 d!141651))

(assert (=> bs!37065 m!1193533))

(declare-fun m!1193691 () Bool)

(assert (=> bs!37065 m!1193691))

(assert (=> b!1302524 d!141651))

(declare-fun d!141653 () Bool)

(declare-fun e!743108 () Bool)

(assert (=> d!141653 e!743108))

(declare-fun res!865153 () Bool)

(assert (=> d!141653 (=> res!865153 e!743108)))

(declare-fun lt!582415 () Bool)

(assert (=> d!141653 (= res!865153 (not lt!582415))))

(declare-fun lt!582416 () Bool)

(assert (=> d!141653 (= lt!582415 lt!582416)))

(declare-fun lt!582418 () Unit!43036)

(declare-fun e!743107 () Unit!43036)

(assert (=> d!141653 (= lt!582418 e!743107)))

(declare-fun c!125140 () Bool)

(assert (=> d!141653 (= c!125140 lt!582416)))

(assert (=> d!141653 (= lt!582416 (containsKey!722 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205))))

(assert (=> d!141653 (= (contains!8284 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) k0!1205) lt!582415)))

(declare-fun b!1302677 () Bool)

(declare-fun lt!582417 () Unit!43036)

(assert (=> b!1302677 (= e!743107 lt!582417)))

(assert (=> b!1302677 (= lt!582417 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205))))

(assert (=> b!1302677 (isDefined!505 (getValueByKey!696 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205))))

(declare-fun b!1302678 () Bool)

(declare-fun Unit!43045 () Unit!43036)

(assert (=> b!1302678 (= e!743107 Unit!43045)))

(declare-fun b!1302679 () Bool)

(assert (=> b!1302679 (= e!743108 (isDefined!505 (getValueByKey!696 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205)))))

(assert (= (and d!141653 c!125140) b!1302677))

(assert (= (and d!141653 (not c!125140)) b!1302678))

(assert (= (and d!141653 (not res!865153)) b!1302679))

(declare-fun m!1193693 () Bool)

(assert (=> d!141653 m!1193693))

(declare-fun m!1193695 () Bool)

(assert (=> b!1302677 m!1193695))

(declare-fun m!1193697 () Bool)

(assert (=> b!1302677 m!1193697))

(assert (=> b!1302677 m!1193697))

(declare-fun m!1193699 () Bool)

(assert (=> b!1302677 m!1193699))

(assert (=> b!1302679 m!1193697))

(assert (=> b!1302679 m!1193697))

(assert (=> b!1302679 m!1193699))

(assert (=> bm!63953 d!141653))

(declare-fun d!141655 () Bool)

(declare-fun res!865158 () Bool)

(declare-fun e!743115 () Bool)

(assert (=> d!141655 (=> res!865158 e!743115)))

(assert (=> d!141655 (= res!865158 (bvsge #b00000000000000000000000000000000 (size!42422 _keys!1741)))))

(assert (=> d!141655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743115)))

(declare-fun b!1302688 () Bool)

(declare-fun e!743116 () Bool)

(declare-fun call!64001 () Bool)

(assert (=> b!1302688 (= e!743116 call!64001)))

(declare-fun b!1302689 () Bool)

(declare-fun e!743117 () Bool)

(assert (=> b!1302689 (= e!743116 e!743117)))

(declare-fun lt!582427 () (_ BitVec 64))

(assert (=> b!1302689 (= lt!582427 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!582426 () Unit!43036)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86759 (_ BitVec 64) (_ BitVec 32)) Unit!43036)

(assert (=> b!1302689 (= lt!582426 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582427 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1302689 (arrayContainsKey!0 _keys!1741 lt!582427 #b00000000000000000000000000000000)))

(declare-fun lt!582425 () Unit!43036)

(assert (=> b!1302689 (= lt!582425 lt!582426)))

(declare-fun res!865159 () Bool)

(declare-datatypes ((SeekEntryResult!9976 0))(
  ( (MissingZero!9976 (index!42275 (_ BitVec 32))) (Found!9976 (index!42276 (_ BitVec 32))) (Intermediate!9976 (undefined!10788 Bool) (index!42277 (_ BitVec 32)) (x!115571 (_ BitVec 32))) (Undefined!9976) (MissingVacant!9976 (index!42278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86759 (_ BitVec 32)) SeekEntryResult!9976)

(assert (=> b!1302689 (= res!865159 (= (seekEntryOrOpen!0 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9976 #b00000000000000000000000000000000)))))

(assert (=> b!1302689 (=> (not res!865159) (not e!743117))))

(declare-fun b!1302690 () Bool)

(assert (=> b!1302690 (= e!743115 e!743116)))

(declare-fun c!125143 () Bool)

(assert (=> b!1302690 (= c!125143 (validKeyInArray!0 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302691 () Bool)

(assert (=> b!1302691 (= e!743117 call!64001)))

(declare-fun bm!63998 () Bool)

(assert (=> bm!63998 (= call!64001 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!141655 (not res!865158)) b!1302690))

(assert (= (and b!1302690 c!125143) b!1302689))

(assert (= (and b!1302690 (not c!125143)) b!1302688))

(assert (= (and b!1302689 res!865159) b!1302691))

(assert (= (or b!1302691 b!1302688) bm!63998))

(assert (=> b!1302689 m!1193675))

(declare-fun m!1193701 () Bool)

(assert (=> b!1302689 m!1193701))

(declare-fun m!1193703 () Bool)

(assert (=> b!1302689 m!1193703))

(assert (=> b!1302689 m!1193675))

(declare-fun m!1193705 () Bool)

(assert (=> b!1302689 m!1193705))

(assert (=> b!1302690 m!1193675))

(assert (=> b!1302690 m!1193675))

(assert (=> b!1302690 m!1193677))

(declare-fun m!1193707 () Bool)

(assert (=> bm!63998 m!1193707))

(assert (=> b!1302528 d!141655))

(declare-fun d!141657 () Bool)

(assert (=> d!141657 (contains!8284 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) k0!1205)))

(declare-fun lt!582430 () Unit!43036)

(declare-fun choose!1907 ((_ BitVec 64) (_ BitVec 64) V!51577 ListLongMap!20261) Unit!43036)

(assert (=> d!141657 (= lt!582430 (choose!1907 k0!1205 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)) (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))))))

(assert (=> d!141657 (contains!8284 (+!4512 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)))) k0!1205)))

(assert (=> d!141657 (= (lemmaInListMapAfterAddingDiffThenInBefore!87 k0!1205 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)) (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) lt!582430)))

(declare-fun bs!37066 () Bool)

(assert (= bs!37066 d!141657))

(assert (=> bs!37066 m!1193537))

(declare-fun m!1193709 () Bool)

(assert (=> bs!37066 m!1193709))

(declare-fun m!1193711 () Bool)

(assert (=> bs!37066 m!1193711))

(assert (=> bs!37066 m!1193711))

(declare-fun m!1193713 () Bool)

(assert (=> bs!37066 m!1193713))

(assert (=> bm!63952 d!141657))

(declare-fun d!141659 () Bool)

(declare-fun e!743120 () Bool)

(assert (=> d!141659 e!743120))

(declare-fun res!865165 () Bool)

(assert (=> d!141659 (=> (not res!865165) (not e!743120))))

(declare-fun lt!582441 () ListLongMap!20261)

(assert (=> d!141659 (= res!865165 (contains!8284 lt!582441 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!582439 () List!29749)

(assert (=> d!141659 (= lt!582441 (ListLongMap!20262 lt!582439))))

(declare-fun lt!582442 () Unit!43036)

(declare-fun lt!582440 () Unit!43036)

(assert (=> d!141659 (= lt!582442 lt!582440)))

(assert (=> d!141659 (= (getValueByKey!696 lt!582439 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!746 (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!347 (List!29749 (_ BitVec 64) V!51577) Unit!43036)

(assert (=> d!141659 (= lt!582440 (lemmaContainsTupThenGetReturnValue!347 lt!582439 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!476 (List!29749 (_ BitVec 64) V!51577) List!29749)

(assert (=> d!141659 (= lt!582439 (insertStrictlySorted!476 (toList!10146 lt!582321) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141659 (= (+!4512 lt!582321 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!582441)))

(declare-fun b!1302696 () Bool)

(declare-fun res!865164 () Bool)

(assert (=> b!1302696 (=> (not res!865164) (not e!743120))))

(assert (=> b!1302696 (= res!865164 (= (getValueByKey!696 (toList!10146 lt!582441) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!746 (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1302697 () Bool)

(declare-fun contains!8288 (List!29749 tuple2!22596) Bool)

(assert (=> b!1302697 (= e!743120 (contains!8288 (toList!10146 lt!582441) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141659 res!865165) b!1302696))

(assert (= (and b!1302696 res!865164) b!1302697))

(declare-fun m!1193715 () Bool)

(assert (=> d!141659 m!1193715))

(declare-fun m!1193717 () Bool)

(assert (=> d!141659 m!1193717))

(declare-fun m!1193719 () Bool)

(assert (=> d!141659 m!1193719))

(declare-fun m!1193721 () Bool)

(assert (=> d!141659 m!1193721))

(declare-fun m!1193723 () Bool)

(assert (=> b!1302696 m!1193723))

(declare-fun m!1193725 () Bool)

(assert (=> b!1302697 m!1193725))

(assert (=> b!1302535 d!141659))

(declare-fun d!141661 () Bool)

(assert (=> d!141661 (contains!8284 lt!582321 k0!1205)))

(declare-fun lt!582443 () Unit!43036)

(assert (=> d!141661 (= lt!582443 (choose!1907 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!582321))))

(assert (=> d!141661 (contains!8284 (+!4512 lt!582321 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))

(assert (=> d!141661 (= (lemmaInListMapAfterAddingDiffThenInBefore!87 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!582321) lt!582443)))

(declare-fun bs!37067 () Bool)

(assert (= bs!37067 d!141661))

(assert (=> bs!37067 m!1193547))

(declare-fun m!1193727 () Bool)

(assert (=> bs!37067 m!1193727))

(assert (=> bs!37067 m!1193543))

(assert (=> bs!37067 m!1193543))

(declare-fun m!1193729 () Bool)

(assert (=> bs!37067 m!1193729))

(assert (=> b!1302535 d!141661))

(declare-fun d!141663 () Bool)

(declare-fun e!743122 () Bool)

(assert (=> d!141663 e!743122))

(declare-fun res!865166 () Bool)

(assert (=> d!141663 (=> res!865166 e!743122)))

(declare-fun lt!582444 () Bool)

(assert (=> d!141663 (= res!865166 (not lt!582444))))

(declare-fun lt!582445 () Bool)

(assert (=> d!141663 (= lt!582444 lt!582445)))

(declare-fun lt!582447 () Unit!43036)

(declare-fun e!743121 () Unit!43036)

(assert (=> d!141663 (= lt!582447 e!743121)))

(declare-fun c!125144 () Bool)

(assert (=> d!141663 (= c!125144 lt!582445)))

(assert (=> d!141663 (= lt!582445 (containsKey!722 (toList!10146 lt!582321) k0!1205))))

(assert (=> d!141663 (= (contains!8284 lt!582321 k0!1205) lt!582444)))

(declare-fun b!1302698 () Bool)

(declare-fun lt!582446 () Unit!43036)

(assert (=> b!1302698 (= e!743121 lt!582446)))

(assert (=> b!1302698 (= lt!582446 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 lt!582321) k0!1205))))

(assert (=> b!1302698 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582321) k0!1205))))

(declare-fun b!1302699 () Bool)

(declare-fun Unit!43046 () Unit!43036)

(assert (=> b!1302699 (= e!743121 Unit!43046)))

(declare-fun b!1302700 () Bool)

(assert (=> b!1302700 (= e!743122 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582321) k0!1205)))))

(assert (= (and d!141663 c!125144) b!1302698))

(assert (= (and d!141663 (not c!125144)) b!1302699))

(assert (= (and d!141663 (not res!865166)) b!1302700))

(declare-fun m!1193731 () Bool)

(assert (=> d!141663 m!1193731))

(declare-fun m!1193733 () Bool)

(assert (=> b!1302698 m!1193733))

(declare-fun m!1193735 () Bool)

(assert (=> b!1302698 m!1193735))

(assert (=> b!1302698 m!1193735))

(declare-fun m!1193737 () Bool)

(assert (=> b!1302698 m!1193737))

(assert (=> b!1302700 m!1193735))

(assert (=> b!1302700 m!1193735))

(assert (=> b!1302700 m!1193737))

(assert (=> b!1302535 d!141663))

(declare-fun d!141665 () Bool)

(declare-fun e!743124 () Bool)

(assert (=> d!141665 e!743124))

(declare-fun res!865167 () Bool)

(assert (=> d!141665 (=> res!865167 e!743124)))

(declare-fun lt!582448 () Bool)

(assert (=> d!141665 (= res!865167 (not lt!582448))))

(declare-fun lt!582449 () Bool)

(assert (=> d!141665 (= lt!582448 lt!582449)))

(declare-fun lt!582451 () Unit!43036)

(declare-fun e!743123 () Unit!43036)

(assert (=> d!141665 (= lt!582451 e!743123)))

(declare-fun c!125145 () Bool)

(assert (=> d!141665 (= c!125145 lt!582449)))

(assert (=> d!141665 (= lt!582449 (containsKey!722 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205))))

(assert (=> d!141665 (= (contains!8284 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) k0!1205) lt!582448)))

(declare-fun b!1302701 () Bool)

(declare-fun lt!582450 () Unit!43036)

(assert (=> b!1302701 (= e!743123 lt!582450)))

(assert (=> b!1302701 (= lt!582450 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205))))

(assert (=> b!1302701 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205))))

(declare-fun b!1302702 () Bool)

(declare-fun Unit!43047 () Unit!43036)

(assert (=> b!1302702 (= e!743123 Unit!43047)))

(declare-fun b!1302703 () Bool)

(assert (=> b!1302703 (= e!743124 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205)))))

(assert (= (and d!141665 c!125145) b!1302701))

(assert (= (and d!141665 (not c!125145)) b!1302702))

(assert (= (and d!141665 (not res!865167)) b!1302703))

(declare-fun m!1193739 () Bool)

(assert (=> d!141665 m!1193739))

(declare-fun m!1193741 () Bool)

(assert (=> b!1302701 m!1193741))

(declare-fun m!1193743 () Bool)

(assert (=> b!1302701 m!1193743))

(assert (=> b!1302701 m!1193743))

(declare-fun m!1193745 () Bool)

(assert (=> b!1302701 m!1193745))

(assert (=> b!1302703 m!1193743))

(assert (=> b!1302703 m!1193743))

(assert (=> b!1302703 m!1193745))

(assert (=> b!1302534 d!141665))

(declare-fun d!141667 () Bool)

(declare-fun e!743125 () Bool)

(assert (=> d!141667 e!743125))

(declare-fun res!865169 () Bool)

(assert (=> d!141667 (=> (not res!865169) (not e!743125))))

(declare-fun lt!582454 () ListLongMap!20261)

(assert (=> d!141667 (= res!865169 (contains!8284 lt!582454 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(declare-fun lt!582452 () List!29749)

(assert (=> d!141667 (= lt!582454 (ListLongMap!20262 lt!582452))))

(declare-fun lt!582455 () Unit!43036)

(declare-fun lt!582453 () Unit!43036)

(assert (=> d!141667 (= lt!582455 lt!582453)))

(assert (=> d!141667 (= (getValueByKey!696 lt!582452 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) (Some!746 (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(assert (=> d!141667 (= lt!582453 (lemmaContainsTupThenGetReturnValue!347 lt!582452 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(assert (=> d!141667 (= lt!582452 (insertStrictlySorted!476 (toList!10146 (ListLongMap!20262 Nil!29746)) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(assert (=> d!141667 (= (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) lt!582454)))

(declare-fun b!1302704 () Bool)

(declare-fun res!865168 () Bool)

(assert (=> b!1302704 (=> (not res!865168) (not e!743125))))

(assert (=> b!1302704 (= res!865168 (= (getValueByKey!696 (toList!10146 lt!582454) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) (Some!746 (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))

(declare-fun b!1302705 () Bool)

(assert (=> b!1302705 (= e!743125 (contains!8288 (toList!10146 lt!582454) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))

(assert (= (and d!141667 res!865169) b!1302704))

(assert (= (and b!1302704 res!865168) b!1302705))

(declare-fun m!1193747 () Bool)

(assert (=> d!141667 m!1193747))

(declare-fun m!1193749 () Bool)

(assert (=> d!141667 m!1193749))

(declare-fun m!1193751 () Bool)

(assert (=> d!141667 m!1193751))

(declare-fun m!1193753 () Bool)

(assert (=> d!141667 m!1193753))

(declare-fun m!1193755 () Bool)

(assert (=> b!1302704 m!1193755))

(declare-fun m!1193757 () Bool)

(assert (=> b!1302705 m!1193757))

(assert (=> b!1302534 d!141667))

(declare-fun d!141669 () Bool)

(assert (=> d!141669 (not (contains!8284 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) k0!1205))))

(declare-fun lt!582458 () Unit!43036)

(declare-fun choose!1908 (ListLongMap!20261 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!43036)

(assert (=> d!141669 (= lt!582458 (choose!1908 (ListLongMap!20262 Nil!29746) (select (arr!41871 _keys!1741) from!2144) lt!582316 k0!1205))))

(declare-fun e!743128 () Bool)

(assert (=> d!141669 e!743128))

(declare-fun res!865172 () Bool)

(assert (=> d!141669 (=> (not res!865172) (not e!743128))))

(assert (=> d!141669 (= res!865172 (not (contains!8284 (ListLongMap!20262 Nil!29746) k0!1205)))))

(assert (=> d!141669 (= (addStillNotContains!465 (ListLongMap!20262 Nil!29746) (select (arr!41871 _keys!1741) from!2144) lt!582316 k0!1205) lt!582458)))

(declare-fun b!1302709 () Bool)

(assert (=> b!1302709 (= e!743128 (not (= (select (arr!41871 _keys!1741) from!2144) k0!1205)))))

(assert (= (and d!141669 res!865172) b!1302709))

(assert (=> d!141669 m!1193555))

(assert (=> d!141669 m!1193555))

(assert (=> d!141669 m!1193557))

(assert (=> d!141669 m!1193531))

(declare-fun m!1193759 () Bool)

(assert (=> d!141669 m!1193759))

(assert (=> d!141669 m!1193533))

(assert (=> b!1302534 d!141669))

(declare-fun d!141671 () Bool)

(declare-fun c!125148 () Bool)

(assert (=> d!141671 (= c!125148 ((_ is ValueCellFull!16529) (select (arr!41870 _values!1445) from!2144)))))

(declare-fun e!743131 () V!51577)

(assert (=> d!141671 (= (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!743131)))

(declare-fun b!1302714 () Bool)

(declare-fun get!21186 (ValueCell!16529 V!51577) V!51577)

(assert (=> b!1302714 (= e!743131 (get!21186 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302715 () Bool)

(declare-fun get!21187 (ValueCell!16529 V!51577) V!51577)

(assert (=> b!1302715 (= e!743131 (get!21187 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141671 c!125148) b!1302714))

(assert (= (and d!141671 (not c!125148)) b!1302715))

(assert (=> b!1302714 m!1193551))

(assert (=> b!1302714 m!1193549))

(declare-fun m!1193761 () Bool)

(assert (=> b!1302714 m!1193761))

(assert (=> b!1302715 m!1193551))

(assert (=> b!1302715 m!1193549))

(declare-fun m!1193763 () Bool)

(assert (=> b!1302715 m!1193763))

(assert (=> b!1302534 d!141671))

(declare-fun b!1302740 () Bool)

(declare-fun e!743152 () Bool)

(declare-fun e!743150 () Bool)

(assert (=> b!1302740 (= e!743152 e!743150)))

(declare-fun c!125160 () Bool)

(declare-fun e!743148 () Bool)

(assert (=> b!1302740 (= c!125160 e!743148)))

(declare-fun res!865181 () Bool)

(assert (=> b!1302740 (=> (not res!865181) (not e!743148))))

(assert (=> b!1302740 (= res!865181 (bvslt from!2144 (size!42422 _keys!1741)))))

(declare-fun call!64004 () ListLongMap!20261)

(declare-fun bm!64001 () Bool)

(assert (=> bm!64001 (= call!64004 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1302741 () Bool)

(declare-fun res!865184 () Bool)

(assert (=> b!1302741 (=> (not res!865184) (not e!743152))))

(declare-fun lt!582475 () ListLongMap!20261)

(assert (=> b!1302741 (= res!865184 (not (contains!8284 lt!582475 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302742 () Bool)

(declare-fun e!743147 () Bool)

(assert (=> b!1302742 (= e!743150 e!743147)))

(declare-fun c!125159 () Bool)

(assert (=> b!1302742 (= c!125159 (bvslt from!2144 (size!42422 _keys!1741)))))

(declare-fun b!1302743 () Bool)

(declare-fun lt!582473 () Unit!43036)

(declare-fun lt!582476 () Unit!43036)

(assert (=> b!1302743 (= lt!582473 lt!582476)))

(declare-fun lt!582479 () (_ BitVec 64))

(declare-fun lt!582477 () V!51577)

(declare-fun lt!582474 () (_ BitVec 64))

(declare-fun lt!582478 () ListLongMap!20261)

(assert (=> b!1302743 (not (contains!8284 (+!4512 lt!582478 (tuple2!22597 lt!582479 lt!582477)) lt!582474))))

(assert (=> b!1302743 (= lt!582476 (addStillNotContains!465 lt!582478 lt!582479 lt!582477 lt!582474))))

(assert (=> b!1302743 (= lt!582474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1302743 (= lt!582477 (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1302743 (= lt!582479 (select (arr!41871 _keys!1741) from!2144))))

(assert (=> b!1302743 (= lt!582478 call!64004)))

(declare-fun e!743146 () ListLongMap!20261)

(assert (=> b!1302743 (= e!743146 (+!4512 call!64004 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1302744 () Bool)

(assert (=> b!1302744 (= e!743146 call!64004)))

(declare-fun b!1302745 () Bool)

(declare-fun e!743151 () ListLongMap!20261)

(assert (=> b!1302745 (= e!743151 e!743146)))

(declare-fun c!125157 () Bool)

(assert (=> b!1302745 (= c!125157 (validKeyInArray!0 (select (arr!41871 _keys!1741) from!2144)))))

(declare-fun b!1302746 () Bool)

(assert (=> b!1302746 (= e!743148 (validKeyInArray!0 (select (arr!41871 _keys!1741) from!2144)))))

(assert (=> b!1302746 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1302747 () Bool)

(assert (=> b!1302747 (= e!743147 (= lt!582475 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1302748 () Bool)

(assert (=> b!1302748 (= e!743151 (ListLongMap!20262 Nil!29746))))

(declare-fun d!141673 () Bool)

(assert (=> d!141673 e!743152))

(declare-fun res!865182 () Bool)

(assert (=> d!141673 (=> (not res!865182) (not e!743152))))

(assert (=> d!141673 (= res!865182 (not (contains!8284 lt!582475 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141673 (= lt!582475 e!743151)))

(declare-fun c!125158 () Bool)

(assert (=> d!141673 (= c!125158 (bvsge from!2144 (size!42422 _keys!1741)))))

(assert (=> d!141673 (validMask!0 mask!2175)))

(assert (=> d!141673 (= (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582475)))

(declare-fun b!1302749 () Bool)

(assert (=> b!1302749 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42422 _keys!1741)))))

(assert (=> b!1302749 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42421 _values!1445)))))

(declare-fun e!743149 () Bool)

(declare-fun apply!1026 (ListLongMap!20261 (_ BitVec 64)) V!51577)

(assert (=> b!1302749 (= e!743149 (= (apply!1026 lt!582475 (select (arr!41871 _keys!1741) from!2144)) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1302750 () Bool)

(assert (=> b!1302750 (= e!743150 e!743149)))

(assert (=> b!1302750 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42422 _keys!1741)))))

(declare-fun res!865183 () Bool)

(assert (=> b!1302750 (= res!865183 (contains!8284 lt!582475 (select (arr!41871 _keys!1741) from!2144)))))

(assert (=> b!1302750 (=> (not res!865183) (not e!743149))))

(declare-fun b!1302751 () Bool)

(declare-fun isEmpty!1057 (ListLongMap!20261) Bool)

(assert (=> b!1302751 (= e!743147 (isEmpty!1057 lt!582475))))

(assert (= (and d!141673 c!125158) b!1302748))

(assert (= (and d!141673 (not c!125158)) b!1302745))

(assert (= (and b!1302745 c!125157) b!1302743))

(assert (= (and b!1302745 (not c!125157)) b!1302744))

(assert (= (or b!1302743 b!1302744) bm!64001))

(assert (= (and d!141673 res!865182) b!1302741))

(assert (= (and b!1302741 res!865184) b!1302740))

(assert (= (and b!1302740 res!865181) b!1302746))

(assert (= (and b!1302740 c!125160) b!1302750))

(assert (= (and b!1302740 (not c!125160)) b!1302742))

(assert (= (and b!1302750 res!865183) b!1302749))

(assert (= (and b!1302742 c!125159) b!1302747))

(assert (= (and b!1302742 (not c!125159)) b!1302751))

(declare-fun b_lambda!23187 () Bool)

(assert (=> (not b_lambda!23187) (not b!1302743)))

(assert (=> b!1302743 t!43316))

(declare-fun b_and!47343 () Bool)

(assert (= b_and!47333 (and (=> t!43316 result!23761) b_and!47343)))

(declare-fun b_lambda!23189 () Bool)

(assert (=> (not b_lambda!23189) (not b!1302749)))

(assert (=> b!1302749 t!43316))

(declare-fun b_and!47345 () Bool)

(assert (= b_and!47343 (and (=> t!43316 result!23761) b_and!47345)))

(assert (=> b!1302749 m!1193551))

(assert (=> b!1302749 m!1193549))

(assert (=> b!1302749 m!1193559))

(assert (=> b!1302749 m!1193551))

(assert (=> b!1302749 m!1193531))

(declare-fun m!1193765 () Bool)

(assert (=> b!1302749 m!1193765))

(assert (=> b!1302749 m!1193531))

(assert (=> b!1302749 m!1193549))

(declare-fun m!1193767 () Bool)

(assert (=> b!1302741 m!1193767))

(declare-fun m!1193769 () Bool)

(assert (=> bm!64001 m!1193769))

(assert (=> b!1302743 m!1193551))

(assert (=> b!1302743 m!1193549))

(assert (=> b!1302743 m!1193559))

(assert (=> b!1302743 m!1193551))

(declare-fun m!1193771 () Bool)

(assert (=> b!1302743 m!1193771))

(assert (=> b!1302743 m!1193531))

(declare-fun m!1193773 () Bool)

(assert (=> b!1302743 m!1193773))

(declare-fun m!1193775 () Bool)

(assert (=> b!1302743 m!1193775))

(declare-fun m!1193777 () Bool)

(assert (=> b!1302743 m!1193777))

(assert (=> b!1302743 m!1193549))

(assert (=> b!1302743 m!1193773))

(assert (=> b!1302750 m!1193531))

(assert (=> b!1302750 m!1193531))

(declare-fun m!1193779 () Bool)

(assert (=> b!1302750 m!1193779))

(assert (=> b!1302746 m!1193531))

(assert (=> b!1302746 m!1193531))

(assert (=> b!1302746 m!1193567))

(assert (=> b!1302745 m!1193531))

(assert (=> b!1302745 m!1193531))

(assert (=> b!1302745 m!1193567))

(declare-fun m!1193781 () Bool)

(assert (=> b!1302751 m!1193781))

(assert (=> b!1302747 m!1193769))

(declare-fun m!1193783 () Bool)

(assert (=> d!141673 m!1193783))

(assert (=> d!141673 m!1193561))

(assert (=> bm!63956 d!141673))

(declare-fun d!141675 () Bool)

(declare-fun e!743154 () Bool)

(assert (=> d!141675 e!743154))

(declare-fun res!865185 () Bool)

(assert (=> d!141675 (=> res!865185 e!743154)))

(declare-fun lt!582480 () Bool)

(assert (=> d!141675 (= res!865185 (not lt!582480))))

(declare-fun lt!582481 () Bool)

(assert (=> d!141675 (= lt!582480 lt!582481)))

(declare-fun lt!582483 () Unit!43036)

(declare-fun e!743153 () Unit!43036)

(assert (=> d!141675 (= lt!582483 e!743153)))

(declare-fun c!125161 () Bool)

(assert (=> d!141675 (= c!125161 lt!582481)))

(assert (=> d!141675 (= lt!582481 (containsKey!722 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141675 (= (contains!8284 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582480)))

(declare-fun b!1302752 () Bool)

(declare-fun lt!582482 () Unit!43036)

(assert (=> b!1302752 (= e!743153 lt!582482)))

(assert (=> b!1302752 (= lt!582482 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1302752 (isDefined!505 (getValueByKey!696 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1302753 () Bool)

(declare-fun Unit!43048 () Unit!43036)

(assert (=> b!1302753 (= e!743153 Unit!43048)))

(declare-fun b!1302754 () Bool)

(assert (=> b!1302754 (= e!743154 (isDefined!505 (getValueByKey!696 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141675 c!125161) b!1302752))

(assert (= (and d!141675 (not c!125161)) b!1302753))

(assert (= (and d!141675 (not res!865185)) b!1302754))

(declare-fun m!1193785 () Bool)

(assert (=> d!141675 m!1193785))

(declare-fun m!1193787 () Bool)

(assert (=> b!1302752 m!1193787))

(declare-fun m!1193789 () Bool)

(assert (=> b!1302752 m!1193789))

(assert (=> b!1302752 m!1193789))

(declare-fun m!1193791 () Bool)

(assert (=> b!1302752 m!1193791))

(assert (=> b!1302754 m!1193789))

(assert (=> b!1302754 m!1193789))

(assert (=> b!1302754 m!1193791))

(assert (=> b!1302533 d!141675))

(declare-fun bm!64016 () Bool)

(declare-fun call!64025 () ListLongMap!20261)

(declare-fun call!64024 () ListLongMap!20261)

(assert (=> bm!64016 (= call!64025 call!64024)))

(declare-fun b!1302797 () Bool)

(declare-fun e!743181 () ListLongMap!20261)

(assert (=> b!1302797 (= e!743181 call!64025)))

(declare-fun bm!64017 () Bool)

(declare-fun call!64023 () ListLongMap!20261)

(assert (=> bm!64017 (= call!64023 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302798 () Bool)

(declare-fun e!743190 () Bool)

(declare-fun e!743185 () Bool)

(assert (=> b!1302798 (= e!743190 e!743185)))

(declare-fun c!125178 () Bool)

(assert (=> b!1302798 (= c!125178 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1302799 () Bool)

(declare-fun e!743193 () Bool)

(declare-fun lt!582537 () ListLongMap!20261)

(assert (=> b!1302799 (= e!743193 (= (apply!1026 lt!582537 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1302800 () Bool)

(declare-fun e!743189 () Bool)

(assert (=> b!1302800 (= e!743189 e!743193)))

(declare-fun res!865212 () Bool)

(declare-fun call!64022 () Bool)

(assert (=> b!1302800 (= res!865212 call!64022)))

(assert (=> b!1302800 (=> (not res!865212) (not e!743193))))

(declare-fun b!1302801 () Bool)

(declare-fun e!743187 () Unit!43036)

(declare-fun lt!582547 () Unit!43036)

(assert (=> b!1302801 (= e!743187 lt!582547)))

(declare-fun lt!582542 () ListLongMap!20261)

(assert (=> b!1302801 (= lt!582542 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582530 () (_ BitVec 64))

(assert (=> b!1302801 (= lt!582530 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582531 () (_ BitVec 64))

(assert (=> b!1302801 (= lt!582531 (select (arr!41871 _keys!1741) from!2144))))

(declare-fun lt!582549 () Unit!43036)

(declare-fun addStillContains!1113 (ListLongMap!20261 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!43036)

(assert (=> b!1302801 (= lt!582549 (addStillContains!1113 lt!582542 lt!582530 zeroValue!1387 lt!582531))))

(assert (=> b!1302801 (contains!8284 (+!4512 lt!582542 (tuple2!22597 lt!582530 zeroValue!1387)) lt!582531)))

(declare-fun lt!582538 () Unit!43036)

(assert (=> b!1302801 (= lt!582538 lt!582549)))

(declare-fun lt!582529 () ListLongMap!20261)

(assert (=> b!1302801 (= lt!582529 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582545 () (_ BitVec 64))

(assert (=> b!1302801 (= lt!582545 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582539 () (_ BitVec 64))

(assert (=> b!1302801 (= lt!582539 (select (arr!41871 _keys!1741) from!2144))))

(declare-fun lt!582544 () Unit!43036)

(declare-fun addApplyDifferent!555 (ListLongMap!20261 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!43036)

(assert (=> b!1302801 (= lt!582544 (addApplyDifferent!555 lt!582529 lt!582545 minValue!1387 lt!582539))))

(assert (=> b!1302801 (= (apply!1026 (+!4512 lt!582529 (tuple2!22597 lt!582545 minValue!1387)) lt!582539) (apply!1026 lt!582529 lt!582539))))

(declare-fun lt!582536 () Unit!43036)

(assert (=> b!1302801 (= lt!582536 lt!582544)))

(declare-fun lt!582534 () ListLongMap!20261)

(assert (=> b!1302801 (= lt!582534 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582528 () (_ BitVec 64))

(assert (=> b!1302801 (= lt!582528 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582540 () (_ BitVec 64))

(assert (=> b!1302801 (= lt!582540 (select (arr!41871 _keys!1741) from!2144))))

(declare-fun lt!582543 () Unit!43036)

(assert (=> b!1302801 (= lt!582543 (addApplyDifferent!555 lt!582534 lt!582528 zeroValue!1387 lt!582540))))

(assert (=> b!1302801 (= (apply!1026 (+!4512 lt!582534 (tuple2!22597 lt!582528 zeroValue!1387)) lt!582540) (apply!1026 lt!582534 lt!582540))))

(declare-fun lt!582532 () Unit!43036)

(assert (=> b!1302801 (= lt!582532 lt!582543)))

(declare-fun lt!582535 () ListLongMap!20261)

(assert (=> b!1302801 (= lt!582535 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582533 () (_ BitVec 64))

(assert (=> b!1302801 (= lt!582533 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582548 () (_ BitVec 64))

(assert (=> b!1302801 (= lt!582548 (select (arr!41871 _keys!1741) from!2144))))

(assert (=> b!1302801 (= lt!582547 (addApplyDifferent!555 lt!582535 lt!582533 minValue!1387 lt!582548))))

(assert (=> b!1302801 (= (apply!1026 (+!4512 lt!582535 (tuple2!22597 lt!582533 minValue!1387)) lt!582548) (apply!1026 lt!582535 lt!582548))))

(declare-fun b!1302802 () Bool)

(declare-fun c!125177 () Bool)

(assert (=> b!1302802 (= c!125177 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!743183 () ListLongMap!20261)

(assert (=> b!1302802 (= e!743181 e!743183)))

(declare-fun b!1302804 () Bool)

(declare-fun e!743182 () Bool)

(assert (=> b!1302804 (= e!743182 (validKeyInArray!0 (select (arr!41871 _keys!1741) from!2144)))))

(declare-fun b!1302805 () Bool)

(declare-fun e!743184 () Bool)

(assert (=> b!1302805 (= e!743185 e!743184)))

(declare-fun res!865206 () Bool)

(declare-fun call!64020 () Bool)

(assert (=> b!1302805 (= res!865206 call!64020)))

(assert (=> b!1302805 (=> (not res!865206) (not e!743184))))

(declare-fun bm!64018 () Bool)

(declare-fun call!64021 () ListLongMap!20261)

(declare-fun call!64019 () ListLongMap!20261)

(assert (=> bm!64018 (= call!64021 call!64019)))

(declare-fun b!1302806 () Bool)

(assert (=> b!1302806 (= e!743189 (not call!64022))))

(declare-fun b!1302807 () Bool)

(declare-fun res!865210 () Bool)

(assert (=> b!1302807 (=> (not res!865210) (not e!743190))))

(assert (=> b!1302807 (= res!865210 e!743189)))

(declare-fun c!125175 () Bool)

(assert (=> b!1302807 (= c!125175 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64019 () Bool)

(assert (=> bm!64019 (= call!64020 (contains!8284 lt!582537 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302808 () Bool)

(declare-fun e!743188 () Bool)

(assert (=> b!1302808 (= e!743188 (= (apply!1026 lt!582537 (select (arr!41871 _keys!1741) from!2144)) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302808 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42421 _values!1445)))))

(assert (=> b!1302808 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42422 _keys!1741)))))

(declare-fun b!1302809 () Bool)

(declare-fun e!743191 () ListLongMap!20261)

(assert (=> b!1302809 (= e!743191 (+!4512 call!64024 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1302810 () Bool)

(assert (=> b!1302810 (= e!743185 (not call!64020))))

(declare-fun b!1302811 () Bool)

(declare-fun Unit!43049 () Unit!43036)

(assert (=> b!1302811 (= e!743187 Unit!43049)))

(declare-fun b!1302812 () Bool)

(declare-fun res!865204 () Bool)

(assert (=> b!1302812 (=> (not res!865204) (not e!743190))))

(declare-fun e!743192 () Bool)

(assert (=> b!1302812 (= res!865204 e!743192)))

(declare-fun res!865207 () Bool)

(assert (=> b!1302812 (=> res!865207 e!743192)))

(declare-fun e!743186 () Bool)

(assert (=> b!1302812 (= res!865207 (not e!743186))))

(declare-fun res!865209 () Bool)

(assert (=> b!1302812 (=> (not res!865209) (not e!743186))))

(assert (=> b!1302812 (= res!865209 (bvslt from!2144 (size!42422 _keys!1741)))))

(declare-fun b!1302803 () Bool)

(assert (=> b!1302803 (= e!743192 e!743188)))

(declare-fun res!865205 () Bool)

(assert (=> b!1302803 (=> (not res!865205) (not e!743188))))

(assert (=> b!1302803 (= res!865205 (contains!8284 lt!582537 (select (arr!41871 _keys!1741) from!2144)))))

(assert (=> b!1302803 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42422 _keys!1741)))))

(declare-fun d!141677 () Bool)

(assert (=> d!141677 e!743190))

(declare-fun res!865211 () Bool)

(assert (=> d!141677 (=> (not res!865211) (not e!743190))))

(assert (=> d!141677 (= res!865211 (or (bvsge from!2144 (size!42422 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42422 _keys!1741)))))))

(declare-fun lt!582541 () ListLongMap!20261)

(assert (=> d!141677 (= lt!582537 lt!582541)))

(declare-fun lt!582546 () Unit!43036)

(assert (=> d!141677 (= lt!582546 e!743187)))

(declare-fun c!125174 () Bool)

(assert (=> d!141677 (= c!125174 e!743182)))

(declare-fun res!865208 () Bool)

(assert (=> d!141677 (=> (not res!865208) (not e!743182))))

(assert (=> d!141677 (= res!865208 (bvslt from!2144 (size!42422 _keys!1741)))))

(assert (=> d!141677 (= lt!582541 e!743191)))

(declare-fun c!125179 () Bool)

(assert (=> d!141677 (= c!125179 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141677 (validMask!0 mask!2175)))

(assert (=> d!141677 (= (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582537)))

(declare-fun b!1302813 () Bool)

(assert (=> b!1302813 (= e!743184 (= (apply!1026 lt!582537 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1302814 () Bool)

(assert (=> b!1302814 (= e!743191 e!743181)))

(declare-fun c!125176 () Bool)

(assert (=> b!1302814 (= c!125176 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64020 () Bool)

(assert (=> bm!64020 (= call!64022 (contains!8284 lt!582537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302815 () Bool)

(assert (=> b!1302815 (= e!743183 call!64021)))

(declare-fun bm!64021 () Bool)

(assert (=> bm!64021 (= call!64024 (+!4512 (ite c!125179 call!64023 (ite c!125176 call!64019 call!64021)) (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1302816 () Bool)

(assert (=> b!1302816 (= e!743186 (validKeyInArray!0 (select (arr!41871 _keys!1741) from!2144)))))

(declare-fun bm!64022 () Bool)

(assert (=> bm!64022 (= call!64019 call!64023)))

(declare-fun b!1302817 () Bool)

(assert (=> b!1302817 (= e!743183 call!64025)))

(assert (= (and d!141677 c!125179) b!1302809))

(assert (= (and d!141677 (not c!125179)) b!1302814))

(assert (= (and b!1302814 c!125176) b!1302797))

(assert (= (and b!1302814 (not c!125176)) b!1302802))

(assert (= (and b!1302802 c!125177) b!1302817))

(assert (= (and b!1302802 (not c!125177)) b!1302815))

(assert (= (or b!1302817 b!1302815) bm!64018))

(assert (= (or b!1302797 bm!64018) bm!64022))

(assert (= (or b!1302797 b!1302817) bm!64016))

(assert (= (or b!1302809 bm!64022) bm!64017))

(assert (= (or b!1302809 bm!64016) bm!64021))

(assert (= (and d!141677 res!865208) b!1302804))

(assert (= (and d!141677 c!125174) b!1302801))

(assert (= (and d!141677 (not c!125174)) b!1302811))

(assert (= (and d!141677 res!865211) b!1302812))

(assert (= (and b!1302812 res!865209) b!1302816))

(assert (= (and b!1302812 (not res!865207)) b!1302803))

(assert (= (and b!1302803 res!865205) b!1302808))

(assert (= (and b!1302812 res!865204) b!1302807))

(assert (= (and b!1302807 c!125175) b!1302800))

(assert (= (and b!1302807 (not c!125175)) b!1302806))

(assert (= (and b!1302800 res!865212) b!1302799))

(assert (= (or b!1302800 b!1302806) bm!64020))

(assert (= (and b!1302807 res!865210) b!1302798))

(assert (= (and b!1302798 c!125178) b!1302805))

(assert (= (and b!1302798 (not c!125178)) b!1302810))

(assert (= (and b!1302805 res!865206) b!1302813))

(assert (= (or b!1302805 b!1302810) bm!64019))

(declare-fun b_lambda!23191 () Bool)

(assert (=> (not b_lambda!23191) (not b!1302808)))

(assert (=> b!1302808 t!43316))

(declare-fun b_and!47347 () Bool)

(assert (= b_and!47345 (and (=> t!43316 result!23761) b_and!47347)))

(declare-fun m!1193793 () Bool)

(assert (=> b!1302813 m!1193793))

(declare-fun m!1193795 () Bool)

(assert (=> b!1302801 m!1193795))

(declare-fun m!1193797 () Bool)

(assert (=> b!1302801 m!1193797))

(declare-fun m!1193799 () Bool)

(assert (=> b!1302801 m!1193799))

(declare-fun m!1193801 () Bool)

(assert (=> b!1302801 m!1193801))

(declare-fun m!1193803 () Bool)

(assert (=> b!1302801 m!1193803))

(declare-fun m!1193805 () Bool)

(assert (=> b!1302801 m!1193805))

(declare-fun m!1193807 () Bool)

(assert (=> b!1302801 m!1193807))

(assert (=> b!1302801 m!1193573))

(declare-fun m!1193809 () Bool)

(assert (=> b!1302801 m!1193809))

(declare-fun m!1193811 () Bool)

(assert (=> b!1302801 m!1193811))

(assert (=> b!1302801 m!1193797))

(declare-fun m!1193813 () Bool)

(assert (=> b!1302801 m!1193813))

(assert (=> b!1302801 m!1193809))

(declare-fun m!1193815 () Bool)

(assert (=> b!1302801 m!1193815))

(declare-fun m!1193817 () Bool)

(assert (=> b!1302801 m!1193817))

(declare-fun m!1193819 () Bool)

(assert (=> b!1302801 m!1193819))

(declare-fun m!1193821 () Bool)

(assert (=> b!1302801 m!1193821))

(assert (=> b!1302801 m!1193801))

(declare-fun m!1193823 () Bool)

(assert (=> b!1302801 m!1193823))

(assert (=> b!1302801 m!1193531))

(assert (=> b!1302801 m!1193815))

(assert (=> b!1302804 m!1193531))

(assert (=> b!1302804 m!1193531))

(assert (=> b!1302804 m!1193567))

(declare-fun m!1193825 () Bool)

(assert (=> bm!64020 m!1193825))

(assert (=> d!141677 m!1193561))

(declare-fun m!1193827 () Bool)

(assert (=> b!1302799 m!1193827))

(assert (=> b!1302816 m!1193531))

(assert (=> b!1302816 m!1193531))

(assert (=> b!1302816 m!1193567))

(assert (=> bm!64017 m!1193573))

(declare-fun m!1193829 () Bool)

(assert (=> bm!64019 m!1193829))

(declare-fun m!1193831 () Bool)

(assert (=> bm!64021 m!1193831))

(assert (=> b!1302808 m!1193551))

(assert (=> b!1302808 m!1193551))

(assert (=> b!1302808 m!1193549))

(assert (=> b!1302808 m!1193559))

(assert (=> b!1302808 m!1193549))

(assert (=> b!1302808 m!1193531))

(assert (=> b!1302808 m!1193531))

(declare-fun m!1193833 () Bool)

(assert (=> b!1302808 m!1193833))

(declare-fun m!1193835 () Bool)

(assert (=> b!1302809 m!1193835))

(assert (=> b!1302803 m!1193531))

(assert (=> b!1302803 m!1193531))

(declare-fun m!1193837 () Bool)

(assert (=> b!1302803 m!1193837))

(assert (=> b!1302533 d!141677))

(declare-fun b!1302825 () Bool)

(declare-fun e!743199 () Bool)

(assert (=> b!1302825 (= e!743199 tp_is_empty!34855)))

(declare-fun mapIsEmpty!53867 () Bool)

(declare-fun mapRes!53867 () Bool)

(assert (=> mapIsEmpty!53867 mapRes!53867))

(declare-fun condMapEmpty!53867 () Bool)

(declare-fun mapDefault!53867 () ValueCell!16529)

(assert (=> mapNonEmpty!53858 (= condMapEmpty!53867 (= mapRest!53858 ((as const (Array (_ BitVec 32) ValueCell!16529)) mapDefault!53867)))))

(assert (=> mapNonEmpty!53858 (= tp!102779 (and e!743199 mapRes!53867))))

(declare-fun mapNonEmpty!53867 () Bool)

(declare-fun tp!102794 () Bool)

(declare-fun e!743198 () Bool)

(assert (=> mapNonEmpty!53867 (= mapRes!53867 (and tp!102794 e!743198))))

(declare-fun mapKey!53867 () (_ BitVec 32))

(declare-fun mapRest!53867 () (Array (_ BitVec 32) ValueCell!16529))

(declare-fun mapValue!53867 () ValueCell!16529)

(assert (=> mapNonEmpty!53867 (= mapRest!53858 (store mapRest!53867 mapKey!53867 mapValue!53867))))

(declare-fun b!1302824 () Bool)

(assert (=> b!1302824 (= e!743198 tp_is_empty!34855)))

(assert (= (and mapNonEmpty!53858 condMapEmpty!53867) mapIsEmpty!53867))

(assert (= (and mapNonEmpty!53858 (not condMapEmpty!53867)) mapNonEmpty!53867))

(assert (= (and mapNonEmpty!53867 ((_ is ValueCellFull!16529) mapValue!53867)) b!1302824))

(assert (= (and mapNonEmpty!53858 ((_ is ValueCellFull!16529) mapDefault!53867)) b!1302825))

(declare-fun m!1193839 () Bool)

(assert (=> mapNonEmpty!53867 m!1193839))

(declare-fun b_lambda!23193 () Bool)

(assert (= b_lambda!23191 (or (and start!110046 b_free!29215) b_lambda!23193)))

(declare-fun b_lambda!23195 () Bool)

(assert (= b_lambda!23187 (or (and start!110046 b_free!29215) b_lambda!23195)))

(declare-fun b_lambda!23197 () Bool)

(assert (= b_lambda!23189 (or (and start!110046 b_free!29215) b_lambda!23197)))

(check-sat (not d!141673) (not d!141677) (not b!1302703) (not b!1302801) (not b!1302816) (not d!141669) (not b!1302689) tp_is_empty!34855 (not bm!63995) (not b!1302674) (not b!1302705) (not b!1302813) (not b!1302741) (not b!1302679) (not b!1302714) (not b!1302677) (not bm!64020) (not mapNonEmpty!53867) (not b!1302664) (not b!1302754) (not d!141657) (not d!141675) (not b_next!29215) (not b!1302701) (not b!1302752) (not b!1302704) (not b_lambda!23185) (not d!141653) (not b!1302698) (not d!141665) (not bm!64019) (not b!1302676) (not d!141659) (not b!1302696) (not b_lambda!23195) (not bm!63998) (not b!1302803) (not d!141663) (not b!1302750) (not b!1302663) b_and!47347 (not b!1302746) (not b!1302751) (not bm!64001) (not b!1302697) (not b!1302808) (not b!1302799) (not d!141651) (not b!1302749) (not b!1302690) (not b!1302715) (not b!1302745) (not b!1302747) (not b_lambda!23197) (not b!1302804) (not b!1302700) (not b!1302809) (not d!141649) (not d!141667) (not bm!64017) (not b_lambda!23193) (not b!1302743) (not d!141661) (not b!1302667) (not bm!64021))
(check-sat b_and!47347 (not b_next!29215))
(get-model)

(declare-fun b!1302826 () Bool)

(declare-fun e!743206 () Bool)

(declare-fun e!743204 () Bool)

(assert (=> b!1302826 (= e!743206 e!743204)))

(declare-fun c!125183 () Bool)

(declare-fun e!743202 () Bool)

(assert (=> b!1302826 (= c!125183 e!743202)))

(declare-fun res!865213 () Bool)

(assert (=> b!1302826 (=> (not res!865213) (not e!743202))))

(assert (=> b!1302826 (= res!865213 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42422 _keys!1741)))))

(declare-fun call!64026 () ListLongMap!20261)

(declare-fun bm!64023 () Bool)

(assert (=> bm!64023 (= call!64026 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1302827 () Bool)

(declare-fun res!865216 () Bool)

(assert (=> b!1302827 (=> (not res!865216) (not e!743206))))

(declare-fun lt!582552 () ListLongMap!20261)

(assert (=> b!1302827 (= res!865216 (not (contains!8284 lt!582552 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302828 () Bool)

(declare-fun e!743201 () Bool)

(assert (=> b!1302828 (= e!743204 e!743201)))

(declare-fun c!125182 () Bool)

(assert (=> b!1302828 (= c!125182 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42422 _keys!1741)))))

(declare-fun b!1302829 () Bool)

(declare-fun lt!582550 () Unit!43036)

(declare-fun lt!582553 () Unit!43036)

(assert (=> b!1302829 (= lt!582550 lt!582553)))

(declare-fun lt!582556 () (_ BitVec 64))

(declare-fun lt!582554 () V!51577)

(declare-fun lt!582555 () ListLongMap!20261)

(declare-fun lt!582551 () (_ BitVec 64))

(assert (=> b!1302829 (not (contains!8284 (+!4512 lt!582555 (tuple2!22597 lt!582556 lt!582554)) lt!582551))))

(assert (=> b!1302829 (= lt!582553 (addStillNotContains!465 lt!582555 lt!582556 lt!582554 lt!582551))))

(assert (=> b!1302829 (= lt!582551 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1302829 (= lt!582554 (get!21184 (select (arr!41870 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1302829 (= lt!582556 (select (arr!41871 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (=> b!1302829 (= lt!582555 call!64026)))

(declare-fun e!743200 () ListLongMap!20261)

(assert (=> b!1302829 (= e!743200 (+!4512 call!64026 (tuple2!22597 (select (arr!41871 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21184 (select (arr!41870 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1302830 () Bool)

(assert (=> b!1302830 (= e!743200 call!64026)))

(declare-fun b!1302831 () Bool)

(declare-fun e!743205 () ListLongMap!20261)

(assert (=> b!1302831 (= e!743205 e!743200)))

(declare-fun c!125180 () Bool)

(assert (=> b!1302831 (= c!125180 (validKeyInArray!0 (select (arr!41871 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun b!1302832 () Bool)

(assert (=> b!1302832 (= e!743202 (validKeyInArray!0 (select (arr!41871 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1302832 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1302833 () Bool)

(assert (=> b!1302833 (= e!743201 (= lt!582552 (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1302834 () Bool)

(assert (=> b!1302834 (= e!743205 (ListLongMap!20262 Nil!29746))))

(declare-fun d!141679 () Bool)

(assert (=> d!141679 e!743206))

(declare-fun res!865214 () Bool)

(assert (=> d!141679 (=> (not res!865214) (not e!743206))))

(assert (=> d!141679 (= res!865214 (not (contains!8284 lt!582552 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141679 (= lt!582552 e!743205)))

(declare-fun c!125181 () Bool)

(assert (=> d!141679 (= c!125181 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42422 _keys!1741)))))

(assert (=> d!141679 (validMask!0 mask!2175)))

(assert (=> d!141679 (= (getCurrentListMapNoExtraKeys!6151 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!582552)))

(declare-fun b!1302835 () Bool)

(assert (=> b!1302835 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42422 _keys!1741)))))

(assert (=> b!1302835 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42421 _values!1445)))))

(declare-fun e!743203 () Bool)

(assert (=> b!1302835 (= e!743203 (= (apply!1026 lt!582552 (select (arr!41871 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21184 (select (arr!41870 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1302836 () Bool)

(assert (=> b!1302836 (= e!743204 e!743203)))

(assert (=> b!1302836 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42422 _keys!1741)))))

(declare-fun res!865215 () Bool)

(assert (=> b!1302836 (= res!865215 (contains!8284 lt!582552 (select (arr!41871 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1302836 (=> (not res!865215) (not e!743203))))

(declare-fun b!1302837 () Bool)

(assert (=> b!1302837 (= e!743201 (isEmpty!1057 lt!582552))))

(assert (= (and d!141679 c!125181) b!1302834))

(assert (= (and d!141679 (not c!125181)) b!1302831))

(assert (= (and b!1302831 c!125180) b!1302829))

(assert (= (and b!1302831 (not c!125180)) b!1302830))

(assert (= (or b!1302829 b!1302830) bm!64023))

(assert (= (and d!141679 res!865214) b!1302827))

(assert (= (and b!1302827 res!865216) b!1302826))

(assert (= (and b!1302826 res!865213) b!1302832))

(assert (= (and b!1302826 c!125183) b!1302836))

(assert (= (and b!1302826 (not c!125183)) b!1302828))

(assert (= (and b!1302836 res!865215) b!1302835))

(assert (= (and b!1302828 c!125182) b!1302833))

(assert (= (and b!1302828 (not c!125182)) b!1302837))

(declare-fun b_lambda!23199 () Bool)

(assert (=> (not b_lambda!23199) (not b!1302829)))

(assert (=> b!1302829 t!43316))

(declare-fun b_and!47349 () Bool)

(assert (= b_and!47347 (and (=> t!43316 result!23761) b_and!47349)))

(declare-fun b_lambda!23201 () Bool)

(assert (=> (not b_lambda!23201) (not b!1302835)))

(assert (=> b!1302835 t!43316))

(declare-fun b_and!47351 () Bool)

(assert (= b_and!47349 (and (=> t!43316 result!23761) b_and!47351)))

(declare-fun m!1193841 () Bool)

(assert (=> b!1302835 m!1193841))

(assert (=> b!1302835 m!1193549))

(declare-fun m!1193843 () Bool)

(assert (=> b!1302835 m!1193843))

(assert (=> b!1302835 m!1193841))

(declare-fun m!1193845 () Bool)

(assert (=> b!1302835 m!1193845))

(declare-fun m!1193847 () Bool)

(assert (=> b!1302835 m!1193847))

(assert (=> b!1302835 m!1193845))

(assert (=> b!1302835 m!1193549))

(declare-fun m!1193849 () Bool)

(assert (=> b!1302827 m!1193849))

(declare-fun m!1193851 () Bool)

(assert (=> bm!64023 m!1193851))

(assert (=> b!1302829 m!1193841))

(assert (=> b!1302829 m!1193549))

(assert (=> b!1302829 m!1193843))

(assert (=> b!1302829 m!1193841))

(declare-fun m!1193853 () Bool)

(assert (=> b!1302829 m!1193853))

(assert (=> b!1302829 m!1193845))

(declare-fun m!1193855 () Bool)

(assert (=> b!1302829 m!1193855))

(declare-fun m!1193857 () Bool)

(assert (=> b!1302829 m!1193857))

(declare-fun m!1193859 () Bool)

(assert (=> b!1302829 m!1193859))

(assert (=> b!1302829 m!1193549))

(assert (=> b!1302829 m!1193855))

(assert (=> b!1302836 m!1193845))

(assert (=> b!1302836 m!1193845))

(declare-fun m!1193861 () Bool)

(assert (=> b!1302836 m!1193861))

(assert (=> b!1302832 m!1193845))

(assert (=> b!1302832 m!1193845))

(declare-fun m!1193863 () Bool)

(assert (=> b!1302832 m!1193863))

(assert (=> b!1302831 m!1193845))

(assert (=> b!1302831 m!1193845))

(assert (=> b!1302831 m!1193863))

(declare-fun m!1193865 () Bool)

(assert (=> b!1302837 m!1193865))

(assert (=> b!1302833 m!1193851))

(declare-fun m!1193867 () Bool)

(assert (=> d!141679 m!1193867))

(assert (=> d!141679 m!1193561))

(assert (=> b!1302747 d!141679))

(assert (=> b!1302745 d!141641))

(declare-fun d!141681 () Bool)

(declare-fun e!743208 () Bool)

(assert (=> d!141681 e!743208))

(declare-fun res!865217 () Bool)

(assert (=> d!141681 (=> res!865217 e!743208)))

(declare-fun lt!582557 () Bool)

(assert (=> d!141681 (= res!865217 (not lt!582557))))

(declare-fun lt!582558 () Bool)

(assert (=> d!141681 (= lt!582557 lt!582558)))

(declare-fun lt!582560 () Unit!43036)

(declare-fun e!743207 () Unit!43036)

(assert (=> d!141681 (= lt!582560 e!743207)))

(declare-fun c!125184 () Bool)

(assert (=> d!141681 (= c!125184 lt!582558)))

(assert (=> d!141681 (= lt!582558 (containsKey!722 (toList!10146 lt!582441) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141681 (= (contains!8284 lt!582441 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) lt!582557)))

(declare-fun b!1302838 () Bool)

(declare-fun lt!582559 () Unit!43036)

(assert (=> b!1302838 (= e!743207 lt!582559)))

(assert (=> b!1302838 (= lt!582559 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 lt!582441) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> b!1302838 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582441) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1302839 () Bool)

(declare-fun Unit!43050 () Unit!43036)

(assert (=> b!1302839 (= e!743207 Unit!43050)))

(declare-fun b!1302840 () Bool)

(assert (=> b!1302840 (= e!743208 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582441) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (= (and d!141681 c!125184) b!1302838))

(assert (= (and d!141681 (not c!125184)) b!1302839))

(assert (= (and d!141681 (not res!865217)) b!1302840))

(declare-fun m!1193869 () Bool)

(assert (=> d!141681 m!1193869))

(declare-fun m!1193871 () Bool)

(assert (=> b!1302838 m!1193871))

(assert (=> b!1302838 m!1193723))

(assert (=> b!1302838 m!1193723))

(declare-fun m!1193873 () Bool)

(assert (=> b!1302838 m!1193873))

(assert (=> b!1302840 m!1193723))

(assert (=> b!1302840 m!1193723))

(assert (=> b!1302840 m!1193873))

(assert (=> d!141659 d!141681))

(declare-fun b!1302849 () Bool)

(declare-fun e!743213 () Option!747)

(assert (=> b!1302849 (= e!743213 (Some!746 (_2!11309 (h!30963 lt!582439))))))

(declare-fun b!1302850 () Bool)

(declare-fun e!743214 () Option!747)

(assert (=> b!1302850 (= e!743213 e!743214)))

(declare-fun c!125190 () Bool)

(assert (=> b!1302850 (= c!125190 (and ((_ is Cons!29745) lt!582439) (not (= (_1!11309 (h!30963 lt!582439)) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))))

(declare-fun d!141683 () Bool)

(declare-fun c!125189 () Bool)

(assert (=> d!141683 (= c!125189 (and ((_ is Cons!29745) lt!582439) (= (_1!11309 (h!30963 lt!582439)) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (=> d!141683 (= (getValueByKey!696 lt!582439 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) e!743213)))

(declare-fun b!1302852 () Bool)

(assert (=> b!1302852 (= e!743214 None!745)))

(declare-fun b!1302851 () Bool)

(assert (=> b!1302851 (= e!743214 (getValueByKey!696 (t!43317 lt!582439) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (= (and d!141683 c!125189) b!1302849))

(assert (= (and d!141683 (not c!125189)) b!1302850))

(assert (= (and b!1302850 c!125190) b!1302851))

(assert (= (and b!1302850 (not c!125190)) b!1302852))

(declare-fun m!1193875 () Bool)

(assert (=> b!1302851 m!1193875))

(assert (=> d!141659 d!141683))

(declare-fun d!141685 () Bool)

(assert (=> d!141685 (= (getValueByKey!696 lt!582439 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!746 (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!582563 () Unit!43036)

(declare-fun choose!1909 (List!29749 (_ BitVec 64) V!51577) Unit!43036)

(assert (=> d!141685 (= lt!582563 (choose!1909 lt!582439 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun e!743217 () Bool)

(assert (=> d!141685 e!743217))

(declare-fun res!865222 () Bool)

(assert (=> d!141685 (=> (not res!865222) (not e!743217))))

(declare-fun isStrictlySorted!859 (List!29749) Bool)

(assert (=> d!141685 (= res!865222 (isStrictlySorted!859 lt!582439))))

(assert (=> d!141685 (= (lemmaContainsTupThenGetReturnValue!347 lt!582439 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) lt!582563)))

(declare-fun b!1302857 () Bool)

(declare-fun res!865223 () Bool)

(assert (=> b!1302857 (=> (not res!865223) (not e!743217))))

(assert (=> b!1302857 (= res!865223 (containsKey!722 lt!582439 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1302858 () Bool)

(assert (=> b!1302858 (= e!743217 (contains!8288 lt!582439 (tuple2!22597 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (= (and d!141685 res!865222) b!1302857))

(assert (= (and b!1302857 res!865223) b!1302858))

(assert (=> d!141685 m!1193717))

(declare-fun m!1193877 () Bool)

(assert (=> d!141685 m!1193877))

(declare-fun m!1193879 () Bool)

(assert (=> d!141685 m!1193879))

(declare-fun m!1193881 () Bool)

(assert (=> b!1302857 m!1193881))

(declare-fun m!1193883 () Bool)

(assert (=> b!1302858 m!1193883))

(assert (=> d!141659 d!141685))

(declare-fun b!1302879 () Bool)

(declare-fun e!743229 () List!29749)

(declare-fun call!64033 () List!29749)

(assert (=> b!1302879 (= e!743229 call!64033)))

(declare-fun bm!64030 () Bool)

(declare-fun call!64034 () List!29749)

(declare-fun e!743232 () List!29749)

(declare-fun c!125201 () Bool)

(declare-fun $colon$colon!666 (List!29749 tuple2!22596) List!29749)

(assert (=> bm!64030 (= call!64034 ($colon$colon!666 e!743232 (ite c!125201 (h!30963 (toList!10146 lt!582321)) (tuple2!22597 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))))

(declare-fun c!125202 () Bool)

(assert (=> bm!64030 (= c!125202 c!125201)))

(declare-fun b!1302880 () Bool)

(assert (=> b!1302880 (= e!743229 call!64033)))

(declare-fun c!125200 () Bool)

(declare-fun c!125199 () Bool)

(declare-fun b!1302881 () Bool)

(assert (=> b!1302881 (= e!743232 (ite c!125199 (t!43317 (toList!10146 lt!582321)) (ite c!125200 (Cons!29745 (h!30963 (toList!10146 lt!582321)) (t!43317 (toList!10146 lt!582321))) Nil!29746)))))

(declare-fun b!1302882 () Bool)

(declare-fun e!743230 () Bool)

(declare-fun lt!582566 () List!29749)

(assert (=> b!1302882 (= e!743230 (contains!8288 lt!582566 (tuple2!22597 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun d!141687 () Bool)

(assert (=> d!141687 e!743230))

(declare-fun res!865229 () Bool)

(assert (=> d!141687 (=> (not res!865229) (not e!743230))))

(assert (=> d!141687 (= res!865229 (isStrictlySorted!859 lt!582566))))

(declare-fun e!743228 () List!29749)

(assert (=> d!141687 (= lt!582566 e!743228)))

(assert (=> d!141687 (= c!125201 (and ((_ is Cons!29745) (toList!10146 lt!582321)) (bvslt (_1!11309 (h!30963 (toList!10146 lt!582321))) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (=> d!141687 (isStrictlySorted!859 (toList!10146 lt!582321))))

(assert (=> d!141687 (= (insertStrictlySorted!476 (toList!10146 lt!582321) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) lt!582566)))

(declare-fun b!1302883 () Bool)

(declare-fun e!743231 () List!29749)

(assert (=> b!1302883 (= e!743228 e!743231)))

(assert (=> b!1302883 (= c!125199 (and ((_ is Cons!29745) (toList!10146 lt!582321)) (= (_1!11309 (h!30963 (toList!10146 lt!582321))) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1302884 () Bool)

(declare-fun res!865228 () Bool)

(assert (=> b!1302884 (=> (not res!865228) (not e!743230))))

(assert (=> b!1302884 (= res!865228 (containsKey!722 lt!582566 (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1302885 () Bool)

(assert (=> b!1302885 (= e!743228 call!64034)))

(declare-fun bm!64031 () Bool)

(declare-fun call!64035 () List!29749)

(assert (=> bm!64031 (= call!64033 call!64035)))

(declare-fun b!1302886 () Bool)

(assert (=> b!1302886 (= e!743232 (insertStrictlySorted!476 (t!43317 (toList!10146 lt!582321)) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1302887 () Bool)

(assert (=> b!1302887 (= e!743231 call!64035)))

(declare-fun bm!64032 () Bool)

(assert (=> bm!64032 (= call!64035 call!64034)))

(declare-fun b!1302888 () Bool)

(assert (=> b!1302888 (= c!125200 (and ((_ is Cons!29745) (toList!10146 lt!582321)) (bvsgt (_1!11309 (h!30963 (toList!10146 lt!582321))) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (=> b!1302888 (= e!743231 e!743229)))

(assert (= (and d!141687 c!125201) b!1302885))

(assert (= (and d!141687 (not c!125201)) b!1302883))

(assert (= (and b!1302883 c!125199) b!1302887))

(assert (= (and b!1302883 (not c!125199)) b!1302888))

(assert (= (and b!1302888 c!125200) b!1302879))

(assert (= (and b!1302888 (not c!125200)) b!1302880))

(assert (= (or b!1302879 b!1302880) bm!64031))

(assert (= (or b!1302887 bm!64031) bm!64032))

(assert (= (or b!1302885 bm!64032) bm!64030))

(assert (= (and bm!64030 c!125202) b!1302886))

(assert (= (and bm!64030 (not c!125202)) b!1302881))

(assert (= (and d!141687 res!865229) b!1302884))

(assert (= (and b!1302884 res!865228) b!1302882))

(declare-fun m!1193885 () Bool)

(assert (=> bm!64030 m!1193885))

(declare-fun m!1193887 () Bool)

(assert (=> d!141687 m!1193887))

(declare-fun m!1193889 () Bool)

(assert (=> d!141687 m!1193889))

(declare-fun m!1193891 () Bool)

(assert (=> b!1302886 m!1193891))

(declare-fun m!1193893 () Bool)

(assert (=> b!1302882 m!1193893))

(declare-fun m!1193895 () Bool)

(assert (=> b!1302884 m!1193895))

(assert (=> d!141659 d!141687))

(declare-fun d!141689 () Bool)

(declare-fun get!21188 (Option!747) V!51577)

(assert (=> d!141689 (= (apply!1026 lt!582475 (select (arr!41871 _keys!1741) from!2144)) (get!21188 (getValueByKey!696 (toList!10146 lt!582475) (select (arr!41871 _keys!1741) from!2144))))))

(declare-fun bs!37068 () Bool)

(assert (= bs!37068 d!141689))

(assert (=> bs!37068 m!1193531))

(declare-fun m!1193897 () Bool)

(assert (=> bs!37068 m!1193897))

(assert (=> bs!37068 m!1193897))

(declare-fun m!1193899 () Bool)

(assert (=> bs!37068 m!1193899))

(assert (=> b!1302749 d!141689))

(assert (=> b!1302749 d!141671))

(declare-fun d!141691 () Bool)

(declare-fun lt!582569 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!642 (List!29750) (InoxSet (_ BitVec 64)))

(assert (=> d!141691 (= lt!582569 (select (content!642 Nil!29747) (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!743237 () Bool)

(assert (=> d!141691 (= lt!582569 e!743237)))

(declare-fun res!865234 () Bool)

(assert (=> d!141691 (=> (not res!865234) (not e!743237))))

(assert (=> d!141691 (= res!865234 ((_ is Cons!29746) Nil!29747))))

(assert (=> d!141691 (= (contains!8287 Nil!29747 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)) lt!582569)))

(declare-fun b!1302893 () Bool)

(declare-fun e!743238 () Bool)

(assert (=> b!1302893 (= e!743237 e!743238)))

(declare-fun res!865235 () Bool)

(assert (=> b!1302893 (=> res!865235 e!743238)))

(assert (=> b!1302893 (= res!865235 (= (h!30964 Nil!29747) (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302894 () Bool)

(assert (=> b!1302894 (= e!743238 (contains!8287 (t!43318 Nil!29747) (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141691 res!865234) b!1302893))

(assert (= (and b!1302893 (not res!865235)) b!1302894))

(declare-fun m!1193901 () Bool)

(assert (=> d!141691 m!1193901))

(assert (=> d!141691 m!1193675))

(declare-fun m!1193903 () Bool)

(assert (=> d!141691 m!1193903))

(assert (=> b!1302894 m!1193675))

(declare-fun m!1193905 () Bool)

(assert (=> b!1302894 m!1193905))

(assert (=> b!1302667 d!141691))

(declare-fun d!141693 () Bool)

(declare-fun isEmpty!1058 (List!29749) Bool)

(assert (=> d!141693 (= (isEmpty!1057 lt!582475) (isEmpty!1058 (toList!10146 lt!582475)))))

(declare-fun bs!37069 () Bool)

(assert (= bs!37069 d!141693))

(declare-fun m!1193907 () Bool)

(assert (=> bs!37069 m!1193907))

(assert (=> b!1302751 d!141693))

(assert (=> b!1302804 d!141641))

(declare-fun d!141695 () Bool)

(declare-fun lt!582572 () Bool)

(declare-fun content!643 (List!29749) (InoxSet tuple2!22596))

(assert (=> d!141695 (= lt!582572 (select (content!643 (toList!10146 lt!582441)) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun e!743243 () Bool)

(assert (=> d!141695 (= lt!582572 e!743243)))

(declare-fun res!865240 () Bool)

(assert (=> d!141695 (=> (not res!865240) (not e!743243))))

(assert (=> d!141695 (= res!865240 ((_ is Cons!29745) (toList!10146 lt!582441)))))

(assert (=> d!141695 (= (contains!8288 (toList!10146 lt!582441) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!582572)))

(declare-fun b!1302899 () Bool)

(declare-fun e!743244 () Bool)

(assert (=> b!1302899 (= e!743243 e!743244)))

(declare-fun res!865241 () Bool)

(assert (=> b!1302899 (=> res!865241 e!743244)))

(assert (=> b!1302899 (= res!865241 (= (h!30963 (toList!10146 lt!582441)) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1302900 () Bool)

(assert (=> b!1302900 (= e!743244 (contains!8288 (t!43317 (toList!10146 lt!582441)) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141695 res!865240) b!1302899))

(assert (= (and b!1302899 (not res!865241)) b!1302900))

(declare-fun m!1193909 () Bool)

(assert (=> d!141695 m!1193909))

(declare-fun m!1193911 () Bool)

(assert (=> d!141695 m!1193911))

(declare-fun m!1193913 () Bool)

(assert (=> b!1302900 m!1193913))

(assert (=> b!1302697 d!141695))

(declare-fun d!141697 () Bool)

(declare-fun res!865246 () Bool)

(declare-fun e!743249 () Bool)

(assert (=> d!141697 (=> res!865246 e!743249)))

(assert (=> d!141697 (= res!865246 (and ((_ is Cons!29745) (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)))) (= (_1!11309 (h!30963 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))))) k0!1205)))))

(assert (=> d!141697 (= (containsKey!722 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205) e!743249)))

(declare-fun b!1302905 () Bool)

(declare-fun e!743250 () Bool)

(assert (=> b!1302905 (= e!743249 e!743250)))

(declare-fun res!865247 () Bool)

(assert (=> b!1302905 (=> (not res!865247) (not e!743250))))

(assert (=> b!1302905 (= res!865247 (and (or (not ((_ is Cons!29745) (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))))) (bvsle (_1!11309 (h!30963 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))))) k0!1205)) ((_ is Cons!29745) (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)))) (bvslt (_1!11309 (h!30963 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))))) k0!1205)))))

(declare-fun b!1302906 () Bool)

(assert (=> b!1302906 (= e!743250 (containsKey!722 (t!43317 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)))) k0!1205))))

(assert (= (and d!141697 (not res!865246)) b!1302905))

(assert (= (and b!1302905 res!865247) b!1302906))

(declare-fun m!1193915 () Bool)

(assert (=> b!1302906 m!1193915))

(assert (=> d!141653 d!141697))

(declare-fun d!141699 () Bool)

(assert (=> d!141699 (= (get!21186 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!20105 (select (arr!41870 _values!1445) from!2144)))))

(assert (=> b!1302714 d!141699))

(assert (=> d!141669 d!141665))

(assert (=> d!141669 d!141667))

(declare-fun d!141701 () Bool)

(assert (=> d!141701 (not (contains!8284 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) k0!1205))))

(assert (=> d!141701 true))

(declare-fun _$36!378 () Unit!43036)

(assert (=> d!141701 (= (choose!1908 (ListLongMap!20262 Nil!29746) (select (arr!41871 _keys!1741) from!2144) lt!582316 k0!1205) _$36!378)))

(declare-fun bs!37070 () Bool)

(assert (= bs!37070 d!141701))

(assert (=> bs!37070 m!1193555))

(assert (=> bs!37070 m!1193555))

(assert (=> bs!37070 m!1193557))

(assert (=> d!141669 d!141701))

(assert (=> d!141669 d!141649))

(declare-fun d!141703 () Bool)

(assert (=> d!141703 (= (validKeyInArray!0 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302690 d!141703))

(declare-fun d!141705 () Bool)

(assert (=> d!141705 (= (apply!1026 lt!582537 (select (arr!41871 _keys!1741) from!2144)) (get!21188 (getValueByKey!696 (toList!10146 lt!582537) (select (arr!41871 _keys!1741) from!2144))))))

(declare-fun bs!37071 () Bool)

(assert (= bs!37071 d!141705))

(assert (=> bs!37071 m!1193531))

(declare-fun m!1193917 () Bool)

(assert (=> bs!37071 m!1193917))

(assert (=> bs!37071 m!1193917))

(declare-fun m!1193919 () Bool)

(assert (=> bs!37071 m!1193919))

(assert (=> b!1302808 d!141705))

(assert (=> b!1302808 d!141671))

(declare-fun d!141707 () Bool)

(declare-fun res!865248 () Bool)

(declare-fun e!743251 () Bool)

(assert (=> d!141707 (=> res!865248 e!743251)))

(assert (=> d!141707 (= res!865248 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42422 _keys!1741)))))

(assert (=> d!141707 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!743251)))

(declare-fun b!1302908 () Bool)

(declare-fun e!743252 () Bool)

(declare-fun call!64036 () Bool)

(assert (=> b!1302908 (= e!743252 call!64036)))

(declare-fun b!1302909 () Bool)

(declare-fun e!743253 () Bool)

(assert (=> b!1302909 (= e!743252 e!743253)))

(declare-fun lt!582575 () (_ BitVec 64))

(assert (=> b!1302909 (= lt!582575 (select (arr!41871 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!582574 () Unit!43036)

(assert (=> b!1302909 (= lt!582574 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1302909 (arrayContainsKey!0 _keys!1741 lt!582575 #b00000000000000000000000000000000)))

(declare-fun lt!582573 () Unit!43036)

(assert (=> b!1302909 (= lt!582573 lt!582574)))

(declare-fun res!865249 () Bool)

(assert (=> b!1302909 (= res!865249 (= (seekEntryOrOpen!0 (select (arr!41871 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!9976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1302909 (=> (not res!865249) (not e!743253))))

(declare-fun b!1302910 () Bool)

(assert (=> b!1302910 (= e!743251 e!743252)))

(declare-fun c!125203 () Bool)

(assert (=> b!1302910 (= c!125203 (validKeyInArray!0 (select (arr!41871 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1302911 () Bool)

(assert (=> b!1302911 (= e!743253 call!64036)))

(declare-fun bm!64033 () Bool)

(assert (=> bm!64033 (= call!64036 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!141707 (not res!865248)) b!1302910))

(assert (= (and b!1302910 c!125203) b!1302909))

(assert (= (and b!1302910 (not c!125203)) b!1302908))

(assert (= (and b!1302909 res!865249) b!1302911))

(assert (= (or b!1302911 b!1302908) bm!64033))

(declare-fun m!1193921 () Bool)

(assert (=> b!1302909 m!1193921))

(declare-fun m!1193923 () Bool)

(assert (=> b!1302909 m!1193923))

(declare-fun m!1193925 () Bool)

(assert (=> b!1302909 m!1193925))

(assert (=> b!1302909 m!1193921))

(declare-fun m!1193927 () Bool)

(assert (=> b!1302909 m!1193927))

(assert (=> b!1302910 m!1193921))

(assert (=> b!1302910 m!1193921))

(declare-fun m!1193929 () Bool)

(assert (=> b!1302910 m!1193929))

(declare-fun m!1193931 () Bool)

(assert (=> bm!64033 m!1193931))

(assert (=> bm!63998 d!141707))

(assert (=> bm!64001 d!141679))

(declare-fun d!141709 () Bool)

(assert (=> d!141709 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205))))

(declare-fun lt!582578 () Unit!43036)

(declare-fun choose!1910 (List!29749 (_ BitVec 64)) Unit!43036)

(assert (=> d!141709 (= lt!582578 (choose!1910 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205))))

(declare-fun e!743256 () Bool)

(assert (=> d!141709 e!743256))

(declare-fun res!865252 () Bool)

(assert (=> d!141709 (=> (not res!865252) (not e!743256))))

(assert (=> d!141709 (= res!865252 (isStrictlySorted!859 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))

(assert (=> d!141709 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205) lt!582578)))

(declare-fun b!1302914 () Bool)

(assert (=> b!1302914 (= e!743256 (containsKey!722 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205))))

(assert (= (and d!141709 res!865252) b!1302914))

(assert (=> d!141709 m!1193743))

(assert (=> d!141709 m!1193743))

(assert (=> d!141709 m!1193745))

(declare-fun m!1193933 () Bool)

(assert (=> d!141709 m!1193933))

(declare-fun m!1193935 () Bool)

(assert (=> d!141709 m!1193935))

(assert (=> b!1302914 m!1193739))

(assert (=> b!1302701 d!141709))

(declare-fun d!141711 () Bool)

(declare-fun isEmpty!1059 (Option!747) Bool)

(assert (=> d!141711 (= (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205)) (not (isEmpty!1059 (getValueByKey!696 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205))))))

(declare-fun bs!37072 () Bool)

(assert (= bs!37072 d!141711))

(assert (=> bs!37072 m!1193743))

(declare-fun m!1193937 () Bool)

(assert (=> bs!37072 m!1193937))

(assert (=> b!1302701 d!141711))

(declare-fun e!743257 () Option!747)

(declare-fun b!1302915 () Bool)

(assert (=> b!1302915 (= e!743257 (Some!746 (_2!11309 (h!30963 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))))

(declare-fun b!1302916 () Bool)

(declare-fun e!743258 () Option!747)

(assert (=> b!1302916 (= e!743257 e!743258)))

(declare-fun c!125205 () Bool)

(assert (=> b!1302916 (= c!125205 (and ((_ is Cons!29745) (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))) (not (= (_1!11309 (h!30963 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))) k0!1205))))))

(declare-fun d!141713 () Bool)

(declare-fun c!125204 () Bool)

(assert (=> d!141713 (= c!125204 (and ((_ is Cons!29745) (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))) (= (_1!11309 (h!30963 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))) k0!1205)))))

(assert (=> d!141713 (= (getValueByKey!696 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205) e!743257)))

(declare-fun b!1302918 () Bool)

(assert (=> b!1302918 (= e!743258 None!745)))

(declare-fun b!1302917 () Bool)

(assert (=> b!1302917 (= e!743258 (getValueByKey!696 (t!43317 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))) k0!1205))))

(assert (= (and d!141713 c!125204) b!1302915))

(assert (= (and d!141713 (not c!125204)) b!1302916))

(assert (= (and b!1302916 c!125205) b!1302917))

(assert (= (and b!1302916 (not c!125205)) b!1302918))

(declare-fun m!1193939 () Bool)

(assert (=> b!1302917 m!1193939))

(assert (=> b!1302701 d!141713))

(assert (=> b!1302663 d!141703))

(declare-fun d!141715 () Bool)

(assert (=> d!141715 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582321) k0!1205))))

(declare-fun lt!582579 () Unit!43036)

(assert (=> d!141715 (= lt!582579 (choose!1910 (toList!10146 lt!582321) k0!1205))))

(declare-fun e!743259 () Bool)

(assert (=> d!141715 e!743259))

(declare-fun res!865253 () Bool)

(assert (=> d!141715 (=> (not res!865253) (not e!743259))))

(assert (=> d!141715 (= res!865253 (isStrictlySorted!859 (toList!10146 lt!582321)))))

(assert (=> d!141715 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 lt!582321) k0!1205) lt!582579)))

(declare-fun b!1302919 () Bool)

(assert (=> b!1302919 (= e!743259 (containsKey!722 (toList!10146 lt!582321) k0!1205))))

(assert (= (and d!141715 res!865253) b!1302919))

(assert (=> d!141715 m!1193735))

(assert (=> d!141715 m!1193735))

(assert (=> d!141715 m!1193737))

(declare-fun m!1193941 () Bool)

(assert (=> d!141715 m!1193941))

(assert (=> d!141715 m!1193889))

(assert (=> b!1302919 m!1193731))

(assert (=> b!1302698 d!141715))

(declare-fun d!141717 () Bool)

(assert (=> d!141717 (= (isDefined!505 (getValueByKey!696 (toList!10146 lt!582321) k0!1205)) (not (isEmpty!1059 (getValueByKey!696 (toList!10146 lt!582321) k0!1205))))))

(declare-fun bs!37073 () Bool)

(assert (= bs!37073 d!141717))

(assert (=> bs!37073 m!1193735))

(declare-fun m!1193943 () Bool)

(assert (=> bs!37073 m!1193943))

(assert (=> b!1302698 d!141717))

(declare-fun b!1302920 () Bool)

(declare-fun e!743260 () Option!747)

(assert (=> b!1302920 (= e!743260 (Some!746 (_2!11309 (h!30963 (toList!10146 lt!582321)))))))

(declare-fun b!1302921 () Bool)

(declare-fun e!743261 () Option!747)

(assert (=> b!1302921 (= e!743260 e!743261)))

(declare-fun c!125207 () Bool)

(assert (=> b!1302921 (= c!125207 (and ((_ is Cons!29745) (toList!10146 lt!582321)) (not (= (_1!11309 (h!30963 (toList!10146 lt!582321))) k0!1205))))))

(declare-fun d!141719 () Bool)

(declare-fun c!125206 () Bool)

(assert (=> d!141719 (= c!125206 (and ((_ is Cons!29745) (toList!10146 lt!582321)) (= (_1!11309 (h!30963 (toList!10146 lt!582321))) k0!1205)))))

(assert (=> d!141719 (= (getValueByKey!696 (toList!10146 lt!582321) k0!1205) e!743260)))

(declare-fun b!1302923 () Bool)

(assert (=> b!1302923 (= e!743261 None!745)))

(declare-fun b!1302922 () Bool)

(assert (=> b!1302922 (= e!743261 (getValueByKey!696 (t!43317 (toList!10146 lt!582321)) k0!1205))))

(assert (= (and d!141719 c!125206) b!1302920))

(assert (= (and d!141719 (not c!125206)) b!1302921))

(assert (= (and b!1302921 c!125207) b!1302922))

(assert (= (and b!1302921 (not c!125207)) b!1302923))

(declare-fun m!1193945 () Bool)

(assert (=> b!1302922 m!1193945))

(assert (=> b!1302698 d!141719))

(assert (=> bm!64017 d!141673))

(declare-fun b!1302924 () Bool)

(declare-fun e!743262 () Option!747)

(assert (=> b!1302924 (= e!743262 (Some!746 (_2!11309 (h!30963 (toList!10146 lt!582454)))))))

(declare-fun b!1302925 () Bool)

(declare-fun e!743263 () Option!747)

(assert (=> b!1302925 (= e!743262 e!743263)))

(declare-fun c!125209 () Bool)

(assert (=> b!1302925 (= c!125209 (and ((_ is Cons!29745) (toList!10146 lt!582454)) (not (= (_1!11309 (h!30963 (toList!10146 lt!582454))) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))))

(declare-fun d!141721 () Bool)

(declare-fun c!125208 () Bool)

(assert (=> d!141721 (= c!125208 (and ((_ is Cons!29745) (toList!10146 lt!582454)) (= (_1!11309 (h!30963 (toList!10146 lt!582454))) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))

(assert (=> d!141721 (= (getValueByKey!696 (toList!10146 lt!582454) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) e!743262)))

(declare-fun b!1302927 () Bool)

(assert (=> b!1302927 (= e!743263 None!745)))

(declare-fun b!1302926 () Bool)

(assert (=> b!1302926 (= e!743263 (getValueByKey!696 (t!43317 (toList!10146 lt!582454)) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(assert (= (and d!141721 c!125208) b!1302924))

(assert (= (and d!141721 (not c!125208)) b!1302925))

(assert (= (and b!1302925 c!125209) b!1302926))

(assert (= (and b!1302925 (not c!125209)) b!1302927))

(declare-fun m!1193947 () Bool)

(assert (=> b!1302926 m!1193947))

(assert (=> b!1302704 d!141721))

(declare-fun d!141723 () Bool)

(assert (=> d!141723 (isDefined!505 (getValueByKey!696 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!582580 () Unit!43036)

(assert (=> d!141723 (= lt!582580 (choose!1910 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!743264 () Bool)

(assert (=> d!141723 e!743264))

(declare-fun res!865254 () Bool)

(assert (=> d!141723 (=> (not res!865254) (not e!743264))))

(assert (=> d!141723 (= res!865254 (isStrictlySorted!859 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141723 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!582580)))

(declare-fun b!1302928 () Bool)

(assert (=> b!1302928 (= e!743264 (containsKey!722 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141723 res!865254) b!1302928))

(assert (=> d!141723 m!1193789))

(assert (=> d!141723 m!1193789))

(assert (=> d!141723 m!1193791))

(declare-fun m!1193949 () Bool)

(assert (=> d!141723 m!1193949))

(declare-fun m!1193951 () Bool)

(assert (=> d!141723 m!1193951))

(assert (=> b!1302928 m!1193785))

(assert (=> b!1302752 d!141723))

(declare-fun d!141725 () Bool)

(assert (=> d!141725 (= (isDefined!505 (getValueByKey!696 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1059 (getValueByKey!696 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37074 () Bool)

(assert (= bs!37074 d!141725))

(assert (=> bs!37074 m!1193789))

(declare-fun m!1193953 () Bool)

(assert (=> bs!37074 m!1193953))

(assert (=> b!1302752 d!141725))

(declare-fun b!1302929 () Bool)

(declare-fun e!743265 () Option!747)

(assert (=> b!1302929 (= e!743265 (Some!746 (_2!11309 (h!30963 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun b!1302930 () Bool)

(declare-fun e!743266 () Option!747)

(assert (=> b!1302930 (= e!743265 e!743266)))

(declare-fun c!125211 () Bool)

(assert (=> b!1302930 (= c!125211 (and ((_ is Cons!29745) (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11309 (h!30963 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun d!141727 () Bool)

(declare-fun c!125210 () Bool)

(assert (=> d!141727 (= c!125210 (and ((_ is Cons!29745) (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11309 (h!30963 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141727 (= (getValueByKey!696 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743265)))

(declare-fun b!1302932 () Bool)

(assert (=> b!1302932 (= e!743266 None!745)))

(declare-fun b!1302931 () Bool)

(assert (=> b!1302931 (= e!743266 (getValueByKey!696 (t!43317 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141727 c!125210) b!1302929))

(assert (= (and d!141727 (not c!125210)) b!1302930))

(assert (= (and b!1302930 c!125211) b!1302931))

(assert (= (and b!1302930 (not c!125211)) b!1302932))

(declare-fun m!1193955 () Bool)

(assert (=> b!1302931 m!1193955))

(assert (=> b!1302752 d!141727))

(declare-fun d!141729 () Bool)

(declare-fun e!743267 () Bool)

(assert (=> d!141729 e!743267))

(declare-fun res!865256 () Bool)

(assert (=> d!141729 (=> (not res!865256) (not e!743267))))

(declare-fun lt!582583 () ListLongMap!20261)

(assert (=> d!141729 (= res!865256 (contains!8284 lt!582583 (_1!11309 (tuple2!22597 lt!582533 minValue!1387))))))

(declare-fun lt!582581 () List!29749)

(assert (=> d!141729 (= lt!582583 (ListLongMap!20262 lt!582581))))

(declare-fun lt!582584 () Unit!43036)

(declare-fun lt!582582 () Unit!43036)

(assert (=> d!141729 (= lt!582584 lt!582582)))

(assert (=> d!141729 (= (getValueByKey!696 lt!582581 (_1!11309 (tuple2!22597 lt!582533 minValue!1387))) (Some!746 (_2!11309 (tuple2!22597 lt!582533 minValue!1387))))))

(assert (=> d!141729 (= lt!582582 (lemmaContainsTupThenGetReturnValue!347 lt!582581 (_1!11309 (tuple2!22597 lt!582533 minValue!1387)) (_2!11309 (tuple2!22597 lt!582533 minValue!1387))))))

(assert (=> d!141729 (= lt!582581 (insertStrictlySorted!476 (toList!10146 lt!582535) (_1!11309 (tuple2!22597 lt!582533 minValue!1387)) (_2!11309 (tuple2!22597 lt!582533 minValue!1387))))))

(assert (=> d!141729 (= (+!4512 lt!582535 (tuple2!22597 lt!582533 minValue!1387)) lt!582583)))

(declare-fun b!1302933 () Bool)

(declare-fun res!865255 () Bool)

(assert (=> b!1302933 (=> (not res!865255) (not e!743267))))

(assert (=> b!1302933 (= res!865255 (= (getValueByKey!696 (toList!10146 lt!582583) (_1!11309 (tuple2!22597 lt!582533 minValue!1387))) (Some!746 (_2!11309 (tuple2!22597 lt!582533 minValue!1387)))))))

(declare-fun b!1302934 () Bool)

(assert (=> b!1302934 (= e!743267 (contains!8288 (toList!10146 lt!582583) (tuple2!22597 lt!582533 minValue!1387)))))

(assert (= (and d!141729 res!865256) b!1302933))

(assert (= (and b!1302933 res!865255) b!1302934))

(declare-fun m!1193957 () Bool)

(assert (=> d!141729 m!1193957))

(declare-fun m!1193959 () Bool)

(assert (=> d!141729 m!1193959))

(declare-fun m!1193961 () Bool)

(assert (=> d!141729 m!1193961))

(declare-fun m!1193963 () Bool)

(assert (=> d!141729 m!1193963))

(declare-fun m!1193965 () Bool)

(assert (=> b!1302933 m!1193965))

(declare-fun m!1193967 () Bool)

(assert (=> b!1302934 m!1193967))

(assert (=> b!1302801 d!141729))

(declare-fun d!141731 () Bool)

(assert (=> d!141731 (= (apply!1026 (+!4512 lt!582529 (tuple2!22597 lt!582545 minValue!1387)) lt!582539) (apply!1026 lt!582529 lt!582539))))

(declare-fun lt!582587 () Unit!43036)

(declare-fun choose!1911 (ListLongMap!20261 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!43036)

(assert (=> d!141731 (= lt!582587 (choose!1911 lt!582529 lt!582545 minValue!1387 lt!582539))))

(declare-fun e!743270 () Bool)

(assert (=> d!141731 e!743270))

(declare-fun res!865259 () Bool)

(assert (=> d!141731 (=> (not res!865259) (not e!743270))))

(assert (=> d!141731 (= res!865259 (contains!8284 lt!582529 lt!582539))))

(assert (=> d!141731 (= (addApplyDifferent!555 lt!582529 lt!582545 minValue!1387 lt!582539) lt!582587)))

(declare-fun b!1302938 () Bool)

(assert (=> b!1302938 (= e!743270 (not (= lt!582539 lt!582545)))))

(assert (= (and d!141731 res!865259) b!1302938))

(declare-fun m!1193969 () Bool)

(assert (=> d!141731 m!1193969))

(assert (=> d!141731 m!1193809))

(declare-fun m!1193971 () Bool)

(assert (=> d!141731 m!1193971))

(assert (=> d!141731 m!1193821))

(assert (=> d!141731 m!1193809))

(assert (=> d!141731 m!1193811))

(assert (=> b!1302801 d!141731))

(declare-fun d!141733 () Bool)

(assert (=> d!141733 (= (apply!1026 (+!4512 lt!582535 (tuple2!22597 lt!582533 minValue!1387)) lt!582548) (apply!1026 lt!582535 lt!582548))))

(declare-fun lt!582588 () Unit!43036)

(assert (=> d!141733 (= lt!582588 (choose!1911 lt!582535 lt!582533 minValue!1387 lt!582548))))

(declare-fun e!743271 () Bool)

(assert (=> d!141733 e!743271))

(declare-fun res!865260 () Bool)

(assert (=> d!141733 (=> (not res!865260) (not e!743271))))

(assert (=> d!141733 (= res!865260 (contains!8284 lt!582535 lt!582548))))

(assert (=> d!141733 (= (addApplyDifferent!555 lt!582535 lt!582533 minValue!1387 lt!582548) lt!582588)))

(declare-fun b!1302939 () Bool)

(assert (=> b!1302939 (= e!743271 (not (= lt!582548 lt!582533)))))

(assert (= (and d!141733 res!865260) b!1302939))

(declare-fun m!1193973 () Bool)

(assert (=> d!141733 m!1193973))

(assert (=> d!141733 m!1193801))

(declare-fun m!1193975 () Bool)

(assert (=> d!141733 m!1193975))

(assert (=> d!141733 m!1193813))

(assert (=> d!141733 m!1193801))

(assert (=> d!141733 m!1193823))

(assert (=> b!1302801 d!141733))

(declare-fun d!141735 () Bool)

(declare-fun e!743272 () Bool)

(assert (=> d!141735 e!743272))

(declare-fun res!865262 () Bool)

(assert (=> d!141735 (=> (not res!865262) (not e!743272))))

(declare-fun lt!582591 () ListLongMap!20261)

(assert (=> d!141735 (= res!865262 (contains!8284 lt!582591 (_1!11309 (tuple2!22597 lt!582545 minValue!1387))))))

(declare-fun lt!582589 () List!29749)

(assert (=> d!141735 (= lt!582591 (ListLongMap!20262 lt!582589))))

(declare-fun lt!582592 () Unit!43036)

(declare-fun lt!582590 () Unit!43036)

(assert (=> d!141735 (= lt!582592 lt!582590)))

(assert (=> d!141735 (= (getValueByKey!696 lt!582589 (_1!11309 (tuple2!22597 lt!582545 minValue!1387))) (Some!746 (_2!11309 (tuple2!22597 lt!582545 minValue!1387))))))

(assert (=> d!141735 (= lt!582590 (lemmaContainsTupThenGetReturnValue!347 lt!582589 (_1!11309 (tuple2!22597 lt!582545 minValue!1387)) (_2!11309 (tuple2!22597 lt!582545 minValue!1387))))))

(assert (=> d!141735 (= lt!582589 (insertStrictlySorted!476 (toList!10146 lt!582529) (_1!11309 (tuple2!22597 lt!582545 minValue!1387)) (_2!11309 (tuple2!22597 lt!582545 minValue!1387))))))

(assert (=> d!141735 (= (+!4512 lt!582529 (tuple2!22597 lt!582545 minValue!1387)) lt!582591)))

(declare-fun b!1302940 () Bool)

(declare-fun res!865261 () Bool)

(assert (=> b!1302940 (=> (not res!865261) (not e!743272))))

(assert (=> b!1302940 (= res!865261 (= (getValueByKey!696 (toList!10146 lt!582591) (_1!11309 (tuple2!22597 lt!582545 minValue!1387))) (Some!746 (_2!11309 (tuple2!22597 lt!582545 minValue!1387)))))))

(declare-fun b!1302941 () Bool)

(assert (=> b!1302941 (= e!743272 (contains!8288 (toList!10146 lt!582591) (tuple2!22597 lt!582545 minValue!1387)))))

(assert (= (and d!141735 res!865262) b!1302940))

(assert (= (and b!1302940 res!865261) b!1302941))

(declare-fun m!1193977 () Bool)

(assert (=> d!141735 m!1193977))

(declare-fun m!1193979 () Bool)

(assert (=> d!141735 m!1193979))

(declare-fun m!1193981 () Bool)

(assert (=> d!141735 m!1193981))

(declare-fun m!1193983 () Bool)

(assert (=> d!141735 m!1193983))

(declare-fun m!1193985 () Bool)

(assert (=> b!1302940 m!1193985))

(declare-fun m!1193987 () Bool)

(assert (=> b!1302941 m!1193987))

(assert (=> b!1302801 d!141735))

(declare-fun d!141737 () Bool)

(declare-fun e!743274 () Bool)

(assert (=> d!141737 e!743274))

(declare-fun res!865263 () Bool)

(assert (=> d!141737 (=> res!865263 e!743274)))

(declare-fun lt!582593 () Bool)

(assert (=> d!141737 (= res!865263 (not lt!582593))))

(declare-fun lt!582594 () Bool)

(assert (=> d!141737 (= lt!582593 lt!582594)))

(declare-fun lt!582596 () Unit!43036)

(declare-fun e!743273 () Unit!43036)

(assert (=> d!141737 (= lt!582596 e!743273)))

(declare-fun c!125212 () Bool)

(assert (=> d!141737 (= c!125212 lt!582594)))

(assert (=> d!141737 (= lt!582594 (containsKey!722 (toList!10146 (+!4512 lt!582542 (tuple2!22597 lt!582530 zeroValue!1387))) lt!582531))))

(assert (=> d!141737 (= (contains!8284 (+!4512 lt!582542 (tuple2!22597 lt!582530 zeroValue!1387)) lt!582531) lt!582593)))

(declare-fun b!1302942 () Bool)

(declare-fun lt!582595 () Unit!43036)

(assert (=> b!1302942 (= e!743273 lt!582595)))

(assert (=> b!1302942 (= lt!582595 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (+!4512 lt!582542 (tuple2!22597 lt!582530 zeroValue!1387))) lt!582531))))

(assert (=> b!1302942 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 lt!582542 (tuple2!22597 lt!582530 zeroValue!1387))) lt!582531))))

(declare-fun b!1302943 () Bool)

(declare-fun Unit!43051 () Unit!43036)

(assert (=> b!1302943 (= e!743273 Unit!43051)))

(declare-fun b!1302944 () Bool)

(assert (=> b!1302944 (= e!743274 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 lt!582542 (tuple2!22597 lt!582530 zeroValue!1387))) lt!582531)))))

(assert (= (and d!141737 c!125212) b!1302942))

(assert (= (and d!141737 (not c!125212)) b!1302943))

(assert (= (and d!141737 (not res!865263)) b!1302944))

(declare-fun m!1193989 () Bool)

(assert (=> d!141737 m!1193989))

(declare-fun m!1193991 () Bool)

(assert (=> b!1302942 m!1193991))

(declare-fun m!1193993 () Bool)

(assert (=> b!1302942 m!1193993))

(assert (=> b!1302942 m!1193993))

(declare-fun m!1193995 () Bool)

(assert (=> b!1302942 m!1193995))

(assert (=> b!1302944 m!1193993))

(assert (=> b!1302944 m!1193993))

(assert (=> b!1302944 m!1193995))

(assert (=> b!1302801 d!141737))

(declare-fun d!141739 () Bool)

(assert (=> d!141739 (= (apply!1026 (+!4512 lt!582535 (tuple2!22597 lt!582533 minValue!1387)) lt!582548) (get!21188 (getValueByKey!696 (toList!10146 (+!4512 lt!582535 (tuple2!22597 lt!582533 minValue!1387))) lt!582548)))))

(declare-fun bs!37075 () Bool)

(assert (= bs!37075 d!141739))

(declare-fun m!1193997 () Bool)

(assert (=> bs!37075 m!1193997))

(assert (=> bs!37075 m!1193997))

(declare-fun m!1193999 () Bool)

(assert (=> bs!37075 m!1193999))

(assert (=> b!1302801 d!141739))

(declare-fun d!141741 () Bool)

(assert (=> d!141741 (= (apply!1026 lt!582535 lt!582548) (get!21188 (getValueByKey!696 (toList!10146 lt!582535) lt!582548)))))

(declare-fun bs!37076 () Bool)

(assert (= bs!37076 d!141741))

(declare-fun m!1194001 () Bool)

(assert (=> bs!37076 m!1194001))

(assert (=> bs!37076 m!1194001))

(declare-fun m!1194003 () Bool)

(assert (=> bs!37076 m!1194003))

(assert (=> b!1302801 d!141741))

(declare-fun d!141743 () Bool)

(declare-fun e!743275 () Bool)

(assert (=> d!141743 e!743275))

(declare-fun res!865265 () Bool)

(assert (=> d!141743 (=> (not res!865265) (not e!743275))))

(declare-fun lt!582599 () ListLongMap!20261)

(assert (=> d!141743 (= res!865265 (contains!8284 lt!582599 (_1!11309 (tuple2!22597 lt!582530 zeroValue!1387))))))

(declare-fun lt!582597 () List!29749)

(assert (=> d!141743 (= lt!582599 (ListLongMap!20262 lt!582597))))

(declare-fun lt!582600 () Unit!43036)

(declare-fun lt!582598 () Unit!43036)

(assert (=> d!141743 (= lt!582600 lt!582598)))

(assert (=> d!141743 (= (getValueByKey!696 lt!582597 (_1!11309 (tuple2!22597 lt!582530 zeroValue!1387))) (Some!746 (_2!11309 (tuple2!22597 lt!582530 zeroValue!1387))))))

(assert (=> d!141743 (= lt!582598 (lemmaContainsTupThenGetReturnValue!347 lt!582597 (_1!11309 (tuple2!22597 lt!582530 zeroValue!1387)) (_2!11309 (tuple2!22597 lt!582530 zeroValue!1387))))))

(assert (=> d!141743 (= lt!582597 (insertStrictlySorted!476 (toList!10146 lt!582542) (_1!11309 (tuple2!22597 lt!582530 zeroValue!1387)) (_2!11309 (tuple2!22597 lt!582530 zeroValue!1387))))))

(assert (=> d!141743 (= (+!4512 lt!582542 (tuple2!22597 lt!582530 zeroValue!1387)) lt!582599)))

(declare-fun b!1302945 () Bool)

(declare-fun res!865264 () Bool)

(assert (=> b!1302945 (=> (not res!865264) (not e!743275))))

(assert (=> b!1302945 (= res!865264 (= (getValueByKey!696 (toList!10146 lt!582599) (_1!11309 (tuple2!22597 lt!582530 zeroValue!1387))) (Some!746 (_2!11309 (tuple2!22597 lt!582530 zeroValue!1387)))))))

(declare-fun b!1302946 () Bool)

(assert (=> b!1302946 (= e!743275 (contains!8288 (toList!10146 lt!582599) (tuple2!22597 lt!582530 zeroValue!1387)))))

(assert (= (and d!141743 res!865265) b!1302945))

(assert (= (and b!1302945 res!865264) b!1302946))

(declare-fun m!1194005 () Bool)

(assert (=> d!141743 m!1194005))

(declare-fun m!1194007 () Bool)

(assert (=> d!141743 m!1194007))

(declare-fun m!1194009 () Bool)

(assert (=> d!141743 m!1194009))

(declare-fun m!1194011 () Bool)

(assert (=> d!141743 m!1194011))

(declare-fun m!1194013 () Bool)

(assert (=> b!1302945 m!1194013))

(declare-fun m!1194015 () Bool)

(assert (=> b!1302946 m!1194015))

(assert (=> b!1302801 d!141743))

(declare-fun d!141745 () Bool)

(assert (=> d!141745 (= (apply!1026 (+!4512 lt!582529 (tuple2!22597 lt!582545 minValue!1387)) lt!582539) (get!21188 (getValueByKey!696 (toList!10146 (+!4512 lt!582529 (tuple2!22597 lt!582545 minValue!1387))) lt!582539)))))

(declare-fun bs!37077 () Bool)

(assert (= bs!37077 d!141745))

(declare-fun m!1194017 () Bool)

(assert (=> bs!37077 m!1194017))

(assert (=> bs!37077 m!1194017))

(declare-fun m!1194019 () Bool)

(assert (=> bs!37077 m!1194019))

(assert (=> b!1302801 d!141745))

(declare-fun d!141747 () Bool)

(assert (=> d!141747 (contains!8284 (+!4512 lt!582542 (tuple2!22597 lt!582530 zeroValue!1387)) lt!582531)))

(declare-fun lt!582603 () Unit!43036)

(declare-fun choose!1912 (ListLongMap!20261 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!43036)

(assert (=> d!141747 (= lt!582603 (choose!1912 lt!582542 lt!582530 zeroValue!1387 lt!582531))))

(assert (=> d!141747 (contains!8284 lt!582542 lt!582531)))

(assert (=> d!141747 (= (addStillContains!1113 lt!582542 lt!582530 zeroValue!1387 lt!582531) lt!582603)))

(declare-fun bs!37078 () Bool)

(assert (= bs!37078 d!141747))

(assert (=> bs!37078 m!1193815))

(assert (=> bs!37078 m!1193815))

(assert (=> bs!37078 m!1193817))

(declare-fun m!1194021 () Bool)

(assert (=> bs!37078 m!1194021))

(declare-fun m!1194023 () Bool)

(assert (=> bs!37078 m!1194023))

(assert (=> b!1302801 d!141747))

(declare-fun d!141749 () Bool)

(assert (=> d!141749 (= (apply!1026 lt!582534 lt!582540) (get!21188 (getValueByKey!696 (toList!10146 lt!582534) lt!582540)))))

(declare-fun bs!37079 () Bool)

(assert (= bs!37079 d!141749))

(declare-fun m!1194025 () Bool)

(assert (=> bs!37079 m!1194025))

(assert (=> bs!37079 m!1194025))

(declare-fun m!1194027 () Bool)

(assert (=> bs!37079 m!1194027))

(assert (=> b!1302801 d!141749))

(assert (=> b!1302801 d!141673))

(declare-fun d!141751 () Bool)

(assert (=> d!141751 (= (apply!1026 (+!4512 lt!582534 (tuple2!22597 lt!582528 zeroValue!1387)) lt!582540) (get!21188 (getValueByKey!696 (toList!10146 (+!4512 lt!582534 (tuple2!22597 lt!582528 zeroValue!1387))) lt!582540)))))

(declare-fun bs!37080 () Bool)

(assert (= bs!37080 d!141751))

(declare-fun m!1194029 () Bool)

(assert (=> bs!37080 m!1194029))

(assert (=> bs!37080 m!1194029))

(declare-fun m!1194031 () Bool)

(assert (=> bs!37080 m!1194031))

(assert (=> b!1302801 d!141751))

(declare-fun d!141753 () Bool)

(assert (=> d!141753 (= (apply!1026 (+!4512 lt!582534 (tuple2!22597 lt!582528 zeroValue!1387)) lt!582540) (apply!1026 lt!582534 lt!582540))))

(declare-fun lt!582604 () Unit!43036)

(assert (=> d!141753 (= lt!582604 (choose!1911 lt!582534 lt!582528 zeroValue!1387 lt!582540))))

(declare-fun e!743276 () Bool)

(assert (=> d!141753 e!743276))

(declare-fun res!865266 () Bool)

(assert (=> d!141753 (=> (not res!865266) (not e!743276))))

(assert (=> d!141753 (= res!865266 (contains!8284 lt!582534 lt!582540))))

(assert (=> d!141753 (= (addApplyDifferent!555 lt!582534 lt!582528 zeroValue!1387 lt!582540) lt!582604)))

(declare-fun b!1302948 () Bool)

(assert (=> b!1302948 (= e!743276 (not (= lt!582540 lt!582528)))))

(assert (= (and d!141753 res!865266) b!1302948))

(declare-fun m!1194033 () Bool)

(assert (=> d!141753 m!1194033))

(assert (=> d!141753 m!1193797))

(declare-fun m!1194035 () Bool)

(assert (=> d!141753 m!1194035))

(assert (=> d!141753 m!1193807))

(assert (=> d!141753 m!1193797))

(assert (=> d!141753 m!1193799))

(assert (=> b!1302801 d!141753))

(declare-fun d!141755 () Bool)

(assert (=> d!141755 (= (apply!1026 lt!582529 lt!582539) (get!21188 (getValueByKey!696 (toList!10146 lt!582529) lt!582539)))))

(declare-fun bs!37081 () Bool)

(assert (= bs!37081 d!141755))

(declare-fun m!1194037 () Bool)

(assert (=> bs!37081 m!1194037))

(assert (=> bs!37081 m!1194037))

(declare-fun m!1194039 () Bool)

(assert (=> bs!37081 m!1194039))

(assert (=> b!1302801 d!141755))

(declare-fun d!141757 () Bool)

(declare-fun e!743277 () Bool)

(assert (=> d!141757 e!743277))

(declare-fun res!865268 () Bool)

(assert (=> d!141757 (=> (not res!865268) (not e!743277))))

(declare-fun lt!582607 () ListLongMap!20261)

(assert (=> d!141757 (= res!865268 (contains!8284 lt!582607 (_1!11309 (tuple2!22597 lt!582528 zeroValue!1387))))))

(declare-fun lt!582605 () List!29749)

(assert (=> d!141757 (= lt!582607 (ListLongMap!20262 lt!582605))))

(declare-fun lt!582608 () Unit!43036)

(declare-fun lt!582606 () Unit!43036)

(assert (=> d!141757 (= lt!582608 lt!582606)))

(assert (=> d!141757 (= (getValueByKey!696 lt!582605 (_1!11309 (tuple2!22597 lt!582528 zeroValue!1387))) (Some!746 (_2!11309 (tuple2!22597 lt!582528 zeroValue!1387))))))

(assert (=> d!141757 (= lt!582606 (lemmaContainsTupThenGetReturnValue!347 lt!582605 (_1!11309 (tuple2!22597 lt!582528 zeroValue!1387)) (_2!11309 (tuple2!22597 lt!582528 zeroValue!1387))))))

(assert (=> d!141757 (= lt!582605 (insertStrictlySorted!476 (toList!10146 lt!582534) (_1!11309 (tuple2!22597 lt!582528 zeroValue!1387)) (_2!11309 (tuple2!22597 lt!582528 zeroValue!1387))))))

(assert (=> d!141757 (= (+!4512 lt!582534 (tuple2!22597 lt!582528 zeroValue!1387)) lt!582607)))

(declare-fun b!1302949 () Bool)

(declare-fun res!865267 () Bool)

(assert (=> b!1302949 (=> (not res!865267) (not e!743277))))

(assert (=> b!1302949 (= res!865267 (= (getValueByKey!696 (toList!10146 lt!582607) (_1!11309 (tuple2!22597 lt!582528 zeroValue!1387))) (Some!746 (_2!11309 (tuple2!22597 lt!582528 zeroValue!1387)))))))

(declare-fun b!1302950 () Bool)

(assert (=> b!1302950 (= e!743277 (contains!8288 (toList!10146 lt!582607) (tuple2!22597 lt!582528 zeroValue!1387)))))

(assert (= (and d!141757 res!865268) b!1302949))

(assert (= (and b!1302949 res!865267) b!1302950))

(declare-fun m!1194041 () Bool)

(assert (=> d!141757 m!1194041))

(declare-fun m!1194043 () Bool)

(assert (=> d!141757 m!1194043))

(declare-fun m!1194045 () Bool)

(assert (=> d!141757 m!1194045))

(declare-fun m!1194047 () Bool)

(assert (=> d!141757 m!1194047))

(declare-fun m!1194049 () Bool)

(assert (=> b!1302949 m!1194049))

(declare-fun m!1194051 () Bool)

(assert (=> b!1302950 m!1194051))

(assert (=> b!1302801 d!141757))

(assert (=> b!1302746 d!141641))

(assert (=> b!1302703 d!141711))

(assert (=> b!1302703 d!141713))

(assert (=> b!1302816 d!141641))

(assert (=> b!1302664 d!141703))

(assert (=> b!1302700 d!141717))

(assert (=> b!1302700 d!141719))

(declare-fun d!141759 () Bool)

(assert (=> d!141759 (= (apply!1026 lt!582537 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21188 (getValueByKey!696 (toList!10146 lt!582537) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37082 () Bool)

(assert (= bs!37082 d!141759))

(declare-fun m!1194053 () Bool)

(assert (=> bs!37082 m!1194053))

(assert (=> bs!37082 m!1194053))

(declare-fun m!1194055 () Bool)

(assert (=> bs!37082 m!1194055))

(assert (=> b!1302799 d!141759))

(declare-fun d!141761 () Bool)

(declare-fun e!743279 () Bool)

(assert (=> d!141761 e!743279))

(declare-fun res!865269 () Bool)

(assert (=> d!141761 (=> res!865269 e!743279)))

(declare-fun lt!582609 () Bool)

(assert (=> d!141761 (= res!865269 (not lt!582609))))

(declare-fun lt!582610 () Bool)

(assert (=> d!141761 (= lt!582609 lt!582610)))

(declare-fun lt!582612 () Unit!43036)

(declare-fun e!743278 () Unit!43036)

(assert (=> d!141761 (= lt!582612 e!743278)))

(declare-fun c!125213 () Bool)

(assert (=> d!141761 (= c!125213 lt!582610)))

(assert (=> d!141761 (= lt!582610 (containsKey!722 (toList!10146 lt!582475) (select (arr!41871 _keys!1741) from!2144)))))

(assert (=> d!141761 (= (contains!8284 lt!582475 (select (arr!41871 _keys!1741) from!2144)) lt!582609)))

(declare-fun b!1302951 () Bool)

(declare-fun lt!582611 () Unit!43036)

(assert (=> b!1302951 (= e!743278 lt!582611)))

(assert (=> b!1302951 (= lt!582611 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 lt!582475) (select (arr!41871 _keys!1741) from!2144)))))

(assert (=> b!1302951 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582475) (select (arr!41871 _keys!1741) from!2144)))))

(declare-fun b!1302952 () Bool)

(declare-fun Unit!43052 () Unit!43036)

(assert (=> b!1302952 (= e!743278 Unit!43052)))

(declare-fun b!1302953 () Bool)

(assert (=> b!1302953 (= e!743279 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582475) (select (arr!41871 _keys!1741) from!2144))))))

(assert (= (and d!141761 c!125213) b!1302951))

(assert (= (and d!141761 (not c!125213)) b!1302952))

(assert (= (and d!141761 (not res!865269)) b!1302953))

(assert (=> d!141761 m!1193531))

(declare-fun m!1194057 () Bool)

(assert (=> d!141761 m!1194057))

(assert (=> b!1302951 m!1193531))

(declare-fun m!1194059 () Bool)

(assert (=> b!1302951 m!1194059))

(assert (=> b!1302951 m!1193531))

(assert (=> b!1302951 m!1193897))

(assert (=> b!1302951 m!1193897))

(declare-fun m!1194061 () Bool)

(assert (=> b!1302951 m!1194061))

(assert (=> b!1302953 m!1193531))

(assert (=> b!1302953 m!1193897))

(assert (=> b!1302953 m!1193897))

(assert (=> b!1302953 m!1194061))

(assert (=> b!1302750 d!141761))

(assert (=> b!1302754 d!141725))

(assert (=> b!1302754 d!141727))

(declare-fun d!141763 () Bool)

(declare-fun e!743281 () Bool)

(assert (=> d!141763 e!743281))

(declare-fun res!865270 () Bool)

(assert (=> d!141763 (=> res!865270 e!743281)))

(declare-fun lt!582613 () Bool)

(assert (=> d!141763 (= res!865270 (not lt!582613))))

(declare-fun lt!582614 () Bool)

(assert (=> d!141763 (= lt!582613 lt!582614)))

(declare-fun lt!582616 () Unit!43036)

(declare-fun e!743280 () Unit!43036)

(assert (=> d!141763 (= lt!582616 e!743280)))

(declare-fun c!125214 () Bool)

(assert (=> d!141763 (= c!125214 lt!582614)))

(assert (=> d!141763 (= lt!582614 (containsKey!722 (toList!10146 lt!582537) (select (arr!41871 _keys!1741) from!2144)))))

(assert (=> d!141763 (= (contains!8284 lt!582537 (select (arr!41871 _keys!1741) from!2144)) lt!582613)))

(declare-fun b!1302954 () Bool)

(declare-fun lt!582615 () Unit!43036)

(assert (=> b!1302954 (= e!743280 lt!582615)))

(assert (=> b!1302954 (= lt!582615 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 lt!582537) (select (arr!41871 _keys!1741) from!2144)))))

(assert (=> b!1302954 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582537) (select (arr!41871 _keys!1741) from!2144)))))

(declare-fun b!1302955 () Bool)

(declare-fun Unit!43053 () Unit!43036)

(assert (=> b!1302955 (= e!743280 Unit!43053)))

(declare-fun b!1302956 () Bool)

(assert (=> b!1302956 (= e!743281 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582537) (select (arr!41871 _keys!1741) from!2144))))))

(assert (= (and d!141763 c!125214) b!1302954))

(assert (= (and d!141763 (not c!125214)) b!1302955))

(assert (= (and d!141763 (not res!865270)) b!1302956))

(assert (=> d!141763 m!1193531))

(declare-fun m!1194063 () Bool)

(assert (=> d!141763 m!1194063))

(assert (=> b!1302954 m!1193531))

(declare-fun m!1194065 () Bool)

(assert (=> b!1302954 m!1194065))

(assert (=> b!1302954 m!1193531))

(assert (=> b!1302954 m!1193917))

(assert (=> b!1302954 m!1193917))

(declare-fun m!1194067 () Bool)

(assert (=> b!1302954 m!1194067))

(assert (=> b!1302956 m!1193531))

(assert (=> b!1302956 m!1193917))

(assert (=> b!1302956 m!1193917))

(assert (=> b!1302956 m!1194067))

(assert (=> b!1302803 d!141763))

(assert (=> d!141657 d!141653))

(declare-fun d!141765 () Bool)

(assert (=> d!141765 (contains!8284 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) k0!1205)))

(assert (=> d!141765 true))

(declare-fun _$21!120 () Unit!43036)

(assert (=> d!141765 (= (choose!1907 k0!1205 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)) (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) _$21!120)))

(declare-fun bs!37083 () Bool)

(assert (= bs!37083 d!141765))

(assert (=> bs!37083 m!1193537))

(assert (=> d!141657 d!141765))

(declare-fun d!141767 () Bool)

(declare-fun e!743283 () Bool)

(assert (=> d!141767 e!743283))

(declare-fun res!865271 () Bool)

(assert (=> d!141767 (=> res!865271 e!743283)))

(declare-fun lt!582617 () Bool)

(assert (=> d!141767 (= res!865271 (not lt!582617))))

(declare-fun lt!582618 () Bool)

(assert (=> d!141767 (= lt!582617 lt!582618)))

(declare-fun lt!582620 () Unit!43036)

(declare-fun e!743282 () Unit!43036)

(assert (=> d!141767 (= lt!582620 e!743282)))

(declare-fun c!125215 () Bool)

(assert (=> d!141767 (= c!125215 lt!582618)))

(assert (=> d!141767 (= lt!582618 (containsKey!722 (toList!10146 (+!4512 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> d!141767 (= (contains!8284 (+!4512 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)))) k0!1205) lt!582617)))

(declare-fun b!1302957 () Bool)

(declare-fun lt!582619 () Unit!43036)

(assert (=> b!1302957 (= e!743282 lt!582619)))

(assert (=> b!1302957 (= lt!582619 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (+!4512 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> b!1302957 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387))))) k0!1205))))

(declare-fun b!1302958 () Bool)

(declare-fun Unit!43054 () Unit!43036)

(assert (=> b!1302958 (= e!743282 Unit!43054)))

(declare-fun b!1302959 () Bool)

(assert (=> b!1302959 (= e!743283 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387))))) k0!1205)))))

(assert (= (and d!141767 c!125215) b!1302957))

(assert (= (and d!141767 (not c!125215)) b!1302958))

(assert (= (and d!141767 (not res!865271)) b!1302959))

(declare-fun m!1194069 () Bool)

(assert (=> d!141767 m!1194069))

(declare-fun m!1194071 () Bool)

(assert (=> b!1302957 m!1194071))

(declare-fun m!1194073 () Bool)

(assert (=> b!1302957 m!1194073))

(assert (=> b!1302957 m!1194073))

(declare-fun m!1194075 () Bool)

(assert (=> b!1302957 m!1194075))

(assert (=> b!1302959 m!1194073))

(assert (=> b!1302959 m!1194073))

(assert (=> b!1302959 m!1194075))

(assert (=> d!141657 d!141767))

(declare-fun d!141769 () Bool)

(declare-fun e!743284 () Bool)

(assert (=> d!141769 e!743284))

(declare-fun res!865273 () Bool)

(assert (=> d!141769 (=> (not res!865273) (not e!743284))))

(declare-fun lt!582623 () ListLongMap!20261)

(assert (=> d!141769 (= res!865273 (contains!8284 lt!582623 (_1!11309 (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387))))))))

(declare-fun lt!582621 () List!29749)

(assert (=> d!141769 (= lt!582623 (ListLongMap!20262 lt!582621))))

(declare-fun lt!582624 () Unit!43036)

(declare-fun lt!582622 () Unit!43036)

(assert (=> d!141769 (= lt!582624 lt!582622)))

(assert (=> d!141769 (= (getValueByKey!696 lt!582621 (_1!11309 (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387))))) (Some!746 (_2!11309 (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141769 (= lt!582622 (lemmaContainsTupThenGetReturnValue!347 lt!582621 (_1!11309 (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)))) (_2!11309 (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141769 (= lt!582621 (insertStrictlySorted!476 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) (_1!11309 (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)))) (_2!11309 (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141769 (= (+!4512 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)) (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)))) lt!582623)))

(declare-fun b!1302960 () Bool)

(declare-fun res!865272 () Bool)

(assert (=> b!1302960 (=> (not res!865272) (not e!743284))))

(assert (=> b!1302960 (= res!865272 (= (getValueByKey!696 (toList!10146 lt!582623) (_1!11309 (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387))))) (Some!746 (_2!11309 (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)))))))))

(declare-fun b!1302961 () Bool)

(assert (=> b!1302961 (= e!743284 (contains!8288 (toList!10146 lt!582623) (tuple2!22597 (ite c!125113 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125115 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125113 minValue!1387 (ite c!125115 zeroValue!1387 minValue!1387)))))))

(assert (= (and d!141769 res!865273) b!1302960))

(assert (= (and b!1302960 res!865272) b!1302961))

(declare-fun m!1194077 () Bool)

(assert (=> d!141769 m!1194077))

(declare-fun m!1194079 () Bool)

(assert (=> d!141769 m!1194079))

(declare-fun m!1194081 () Bool)

(assert (=> d!141769 m!1194081))

(declare-fun m!1194083 () Bool)

(assert (=> d!141769 m!1194083))

(declare-fun m!1194085 () Bool)

(assert (=> b!1302960 m!1194085))

(declare-fun m!1194087 () Bool)

(assert (=> b!1302961 m!1194087))

(assert (=> d!141657 d!141769))

(assert (=> d!141661 d!141663))

(declare-fun d!141771 () Bool)

(assert (=> d!141771 (contains!8284 lt!582321 k0!1205)))

(assert (=> d!141771 true))

(declare-fun _$21!121 () Unit!43036)

(assert (=> d!141771 (= (choose!1907 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!582321) _$21!121)))

(declare-fun bs!37084 () Bool)

(assert (= bs!37084 d!141771))

(assert (=> bs!37084 m!1193547))

(assert (=> d!141661 d!141771))

(declare-fun d!141773 () Bool)

(declare-fun e!743286 () Bool)

(assert (=> d!141773 e!743286))

(declare-fun res!865274 () Bool)

(assert (=> d!141773 (=> res!865274 e!743286)))

(declare-fun lt!582625 () Bool)

(assert (=> d!141773 (= res!865274 (not lt!582625))))

(declare-fun lt!582626 () Bool)

(assert (=> d!141773 (= lt!582625 lt!582626)))

(declare-fun lt!582628 () Unit!43036)

(declare-fun e!743285 () Unit!43036)

(assert (=> d!141773 (= lt!582628 e!743285)))

(declare-fun c!125216 () Bool)

(assert (=> d!141773 (= c!125216 lt!582626)))

(assert (=> d!141773 (= lt!582626 (containsKey!722 (toList!10146 (+!4512 lt!582321 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141773 (= (contains!8284 (+!4512 lt!582321 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!582625)))

(declare-fun b!1302962 () Bool)

(declare-fun lt!582627 () Unit!43036)

(assert (=> b!1302962 (= e!743285 lt!582627)))

(assert (=> b!1302962 (= lt!582627 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (+!4512 lt!582321 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1302962 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 lt!582321 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1302963 () Bool)

(declare-fun Unit!43055 () Unit!43036)

(assert (=> b!1302963 (= e!743285 Unit!43055)))

(declare-fun b!1302964 () Bool)

(assert (=> b!1302964 (= e!743286 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 lt!582321 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141773 c!125216) b!1302962))

(assert (= (and d!141773 (not c!125216)) b!1302963))

(assert (= (and d!141773 (not res!865274)) b!1302964))

(declare-fun m!1194089 () Bool)

(assert (=> d!141773 m!1194089))

(declare-fun m!1194091 () Bool)

(assert (=> b!1302962 m!1194091))

(declare-fun m!1194093 () Bool)

(assert (=> b!1302962 m!1194093))

(assert (=> b!1302962 m!1194093))

(declare-fun m!1194095 () Bool)

(assert (=> b!1302962 m!1194095))

(assert (=> b!1302964 m!1194093))

(assert (=> b!1302964 m!1194093))

(assert (=> b!1302964 m!1194095))

(assert (=> d!141661 d!141773))

(assert (=> d!141661 d!141659))

(declare-fun d!141775 () Bool)

(assert (=> d!141775 (= (isDefined!505 (getValueByKey!696 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205)) (not (isEmpty!1059 (getValueByKey!696 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205))))))

(declare-fun bs!37085 () Bool)

(assert (= bs!37085 d!141775))

(assert (=> bs!37085 m!1193687))

(declare-fun m!1194097 () Bool)

(assert (=> bs!37085 m!1194097))

(assert (=> b!1302676 d!141775))

(declare-fun b!1302965 () Bool)

(declare-fun e!743287 () Option!747)

(assert (=> b!1302965 (= e!743287 (Some!746 (_2!11309 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746))))))))

(declare-fun b!1302966 () Bool)

(declare-fun e!743288 () Option!747)

(assert (=> b!1302966 (= e!743287 e!743288)))

(declare-fun c!125218 () Bool)

(assert (=> b!1302966 (= c!125218 (and ((_ is Cons!29745) (toList!10146 (ListLongMap!20262 Nil!29746))) (not (= (_1!11309 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746)))) k0!1205))))))

(declare-fun d!141777 () Bool)

(declare-fun c!125217 () Bool)

(assert (=> d!141777 (= c!125217 (and ((_ is Cons!29745) (toList!10146 (ListLongMap!20262 Nil!29746))) (= (_1!11309 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746)))) k0!1205)))))

(assert (=> d!141777 (= (getValueByKey!696 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205) e!743287)))

(declare-fun b!1302968 () Bool)

(assert (=> b!1302968 (= e!743288 None!745)))

(declare-fun b!1302967 () Bool)

(assert (=> b!1302967 (= e!743288 (getValueByKey!696 (t!43317 (toList!10146 (ListLongMap!20262 Nil!29746))) k0!1205))))

(assert (= (and d!141777 c!125217) b!1302965))

(assert (= (and d!141777 (not c!125217)) b!1302966))

(assert (= (and b!1302966 c!125218) b!1302967))

(assert (= (and b!1302966 (not c!125218)) b!1302968))

(declare-fun m!1194099 () Bool)

(assert (=> b!1302967 m!1194099))

(assert (=> b!1302676 d!141777))

(declare-fun d!141779 () Bool)

(assert (=> d!141779 (isDefined!505 (getValueByKey!696 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205))))

(declare-fun lt!582629 () Unit!43036)

(assert (=> d!141779 (= lt!582629 (choose!1910 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205))))

(declare-fun e!743289 () Bool)

(assert (=> d!141779 e!743289))

(declare-fun res!865275 () Bool)

(assert (=> d!141779 (=> (not res!865275) (not e!743289))))

(assert (=> d!141779 (= res!865275 (isStrictlySorted!859 (toList!10146 (ListLongMap!20262 Nil!29746))))))

(assert (=> d!141779 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205) lt!582629)))

(declare-fun b!1302969 () Bool)

(assert (=> b!1302969 (= e!743289 (containsKey!722 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205))))

(assert (= (and d!141779 res!865275) b!1302969))

(assert (=> d!141779 m!1193687))

(assert (=> d!141779 m!1193687))

(assert (=> d!141779 m!1193689))

(declare-fun m!1194101 () Bool)

(assert (=> d!141779 m!1194101))

(declare-fun m!1194103 () Bool)

(assert (=> d!141779 m!1194103))

(assert (=> b!1302969 m!1193683))

(assert (=> b!1302674 d!141779))

(assert (=> b!1302674 d!141775))

(assert (=> b!1302674 d!141777))

(declare-fun d!141781 () Bool)

(declare-fun e!743291 () Bool)

(assert (=> d!141781 e!743291))

(declare-fun res!865276 () Bool)

(assert (=> d!141781 (=> res!865276 e!743291)))

(declare-fun lt!582630 () Bool)

(assert (=> d!141781 (= res!865276 (not lt!582630))))

(declare-fun lt!582631 () Bool)

(assert (=> d!141781 (= lt!582630 lt!582631)))

(declare-fun lt!582633 () Unit!43036)

(declare-fun e!743290 () Unit!43036)

(assert (=> d!141781 (= lt!582633 e!743290)))

(declare-fun c!125219 () Bool)

(assert (=> d!141781 (= c!125219 lt!582631)))

(assert (=> d!141781 (= lt!582631 (containsKey!722 (toList!10146 lt!582454) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(assert (=> d!141781 (= (contains!8284 lt!582454 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) lt!582630)))

(declare-fun b!1302970 () Bool)

(declare-fun lt!582632 () Unit!43036)

(assert (=> b!1302970 (= e!743290 lt!582632)))

(assert (=> b!1302970 (= lt!582632 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 lt!582454) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(assert (=> b!1302970 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582454) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(declare-fun b!1302971 () Bool)

(declare-fun Unit!43056 () Unit!43036)

(assert (=> b!1302971 (= e!743290 Unit!43056)))

(declare-fun b!1302972 () Bool)

(assert (=> b!1302972 (= e!743291 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582454) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))

(assert (= (and d!141781 c!125219) b!1302970))

(assert (= (and d!141781 (not c!125219)) b!1302971))

(assert (= (and d!141781 (not res!865276)) b!1302972))

(declare-fun m!1194105 () Bool)

(assert (=> d!141781 m!1194105))

(declare-fun m!1194107 () Bool)

(assert (=> b!1302970 m!1194107))

(assert (=> b!1302970 m!1193755))

(assert (=> b!1302970 m!1193755))

(declare-fun m!1194109 () Bool)

(assert (=> b!1302970 m!1194109))

(assert (=> b!1302972 m!1193755))

(assert (=> b!1302972 m!1193755))

(assert (=> b!1302972 m!1194109))

(assert (=> d!141667 d!141781))

(declare-fun b!1302973 () Bool)

(declare-fun e!743292 () Option!747)

(assert (=> b!1302973 (= e!743292 (Some!746 (_2!11309 (h!30963 lt!582452))))))

(declare-fun b!1302974 () Bool)

(declare-fun e!743293 () Option!747)

(assert (=> b!1302974 (= e!743292 e!743293)))

(declare-fun c!125221 () Bool)

(assert (=> b!1302974 (= c!125221 (and ((_ is Cons!29745) lt!582452) (not (= (_1!11309 (h!30963 lt!582452)) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))))

(declare-fun c!125220 () Bool)

(declare-fun d!141783 () Bool)

(assert (=> d!141783 (= c!125220 (and ((_ is Cons!29745) lt!582452) (= (_1!11309 (h!30963 lt!582452)) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))

(assert (=> d!141783 (= (getValueByKey!696 lt!582452 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) e!743292)))

(declare-fun b!1302976 () Bool)

(assert (=> b!1302976 (= e!743293 None!745)))

(declare-fun b!1302975 () Bool)

(assert (=> b!1302975 (= e!743293 (getValueByKey!696 (t!43317 lt!582452) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(assert (= (and d!141783 c!125220) b!1302973))

(assert (= (and d!141783 (not c!125220)) b!1302974))

(assert (= (and b!1302974 c!125221) b!1302975))

(assert (= (and b!1302974 (not c!125221)) b!1302976))

(declare-fun m!1194111 () Bool)

(assert (=> b!1302975 m!1194111))

(assert (=> d!141667 d!141783))

(declare-fun d!141785 () Bool)

(assert (=> d!141785 (= (getValueByKey!696 lt!582452 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) (Some!746 (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(declare-fun lt!582634 () Unit!43036)

(assert (=> d!141785 (= lt!582634 (choose!1909 lt!582452 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(declare-fun e!743294 () Bool)

(assert (=> d!141785 e!743294))

(declare-fun res!865277 () Bool)

(assert (=> d!141785 (=> (not res!865277) (not e!743294))))

(assert (=> d!141785 (= res!865277 (isStrictlySorted!859 lt!582452))))

(assert (=> d!141785 (= (lemmaContainsTupThenGetReturnValue!347 lt!582452 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) lt!582634)))

(declare-fun b!1302977 () Bool)

(declare-fun res!865278 () Bool)

(assert (=> b!1302977 (=> (not res!865278) (not e!743294))))

(assert (=> b!1302977 (= res!865278 (containsKey!722 lt!582452 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(declare-fun b!1302978 () Bool)

(assert (=> b!1302978 (= e!743294 (contains!8288 lt!582452 (tuple2!22597 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))

(assert (= (and d!141785 res!865277) b!1302977))

(assert (= (and b!1302977 res!865278) b!1302978))

(assert (=> d!141785 m!1193749))

(declare-fun m!1194113 () Bool)

(assert (=> d!141785 m!1194113))

(declare-fun m!1194115 () Bool)

(assert (=> d!141785 m!1194115))

(declare-fun m!1194117 () Bool)

(assert (=> b!1302977 m!1194117))

(declare-fun m!1194119 () Bool)

(assert (=> b!1302978 m!1194119))

(assert (=> d!141667 d!141785))

(declare-fun b!1302979 () Bool)

(declare-fun e!743296 () List!29749)

(declare-fun call!64037 () List!29749)

(assert (=> b!1302979 (= e!743296 call!64037)))

(declare-fun e!743299 () List!29749)

(declare-fun c!125224 () Bool)

(declare-fun bm!64034 () Bool)

(declare-fun call!64038 () List!29749)

(assert (=> bm!64034 (= call!64038 ($colon$colon!666 e!743299 (ite c!125224 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746))) (tuple2!22597 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))))

(declare-fun c!125225 () Bool)

(assert (=> bm!64034 (= c!125225 c!125224)))

(declare-fun b!1302980 () Bool)

(assert (=> b!1302980 (= e!743296 call!64037)))

(declare-fun b!1302981 () Bool)

(declare-fun c!125222 () Bool)

(declare-fun c!125223 () Bool)

(assert (=> b!1302981 (= e!743299 (ite c!125222 (t!43317 (toList!10146 (ListLongMap!20262 Nil!29746))) (ite c!125223 (Cons!29745 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746))) (t!43317 (toList!10146 (ListLongMap!20262 Nil!29746)))) Nil!29746)))))

(declare-fun e!743297 () Bool)

(declare-fun lt!582635 () List!29749)

(declare-fun b!1302982 () Bool)

(assert (=> b!1302982 (= e!743297 (contains!8288 lt!582635 (tuple2!22597 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))

(declare-fun d!141787 () Bool)

(assert (=> d!141787 e!743297))

(declare-fun res!865280 () Bool)

(assert (=> d!141787 (=> (not res!865280) (not e!743297))))

(assert (=> d!141787 (= res!865280 (isStrictlySorted!859 lt!582635))))

(declare-fun e!743295 () List!29749)

(assert (=> d!141787 (= lt!582635 e!743295)))

(assert (=> d!141787 (= c!125224 (and ((_ is Cons!29745) (toList!10146 (ListLongMap!20262 Nil!29746))) (bvslt (_1!11309 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746)))) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))

(assert (=> d!141787 (isStrictlySorted!859 (toList!10146 (ListLongMap!20262 Nil!29746)))))

(assert (=> d!141787 (= (insertStrictlySorted!476 (toList!10146 (ListLongMap!20262 Nil!29746)) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) lt!582635)))

(declare-fun b!1302983 () Bool)

(declare-fun e!743298 () List!29749)

(assert (=> b!1302983 (= e!743295 e!743298)))

(assert (=> b!1302983 (= c!125222 (and ((_ is Cons!29745) (toList!10146 (ListLongMap!20262 Nil!29746))) (= (_1!11309 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746)))) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))

(declare-fun b!1302984 () Bool)

(declare-fun res!865279 () Bool)

(assert (=> b!1302984 (=> (not res!865279) (not e!743297))))

(assert (=> b!1302984 (= res!865279 (containsKey!722 lt!582635 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(declare-fun b!1302985 () Bool)

(assert (=> b!1302985 (= e!743295 call!64038)))

(declare-fun bm!64035 () Bool)

(declare-fun call!64039 () List!29749)

(assert (=> bm!64035 (= call!64037 call!64039)))

(declare-fun b!1302986 () Bool)

(assert (=> b!1302986 (= e!743299 (insertStrictlySorted!476 (t!43317 (toList!10146 (ListLongMap!20262 Nil!29746))) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))))

(declare-fun b!1302987 () Bool)

(assert (=> b!1302987 (= e!743298 call!64039)))

(declare-fun bm!64036 () Bool)

(assert (=> bm!64036 (= call!64039 call!64038)))

(declare-fun b!1302988 () Bool)

(assert (=> b!1302988 (= c!125223 (and ((_ is Cons!29745) (toList!10146 (ListLongMap!20262 Nil!29746))) (bvsgt (_1!11309 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746)))) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))))

(assert (=> b!1302988 (= e!743298 e!743296)))

(assert (= (and d!141787 c!125224) b!1302985))

(assert (= (and d!141787 (not c!125224)) b!1302983))

(assert (= (and b!1302983 c!125222) b!1302987))

(assert (= (and b!1302983 (not c!125222)) b!1302988))

(assert (= (and b!1302988 c!125223) b!1302979))

(assert (= (and b!1302988 (not c!125223)) b!1302980))

(assert (= (or b!1302979 b!1302980) bm!64035))

(assert (= (or b!1302987 bm!64035) bm!64036))

(assert (= (or b!1302985 bm!64036) bm!64034))

(assert (= (and bm!64034 c!125225) b!1302986))

(assert (= (and bm!64034 (not c!125225)) b!1302981))

(assert (= (and d!141787 res!865280) b!1302984))

(assert (= (and b!1302984 res!865279) b!1302982))

(declare-fun m!1194121 () Bool)

(assert (=> bm!64034 m!1194121))

(declare-fun m!1194123 () Bool)

(assert (=> d!141787 m!1194123))

(assert (=> d!141787 m!1194103))

(declare-fun m!1194125 () Bool)

(assert (=> b!1302986 m!1194125))

(declare-fun m!1194127 () Bool)

(assert (=> b!1302982 m!1194127))

(declare-fun m!1194129 () Bool)

(assert (=> b!1302984 m!1194129))

(assert (=> d!141667 d!141787))

(declare-fun d!141789 () Bool)

(declare-fun res!865281 () Bool)

(declare-fun e!743300 () Bool)

(assert (=> d!141789 (=> res!865281 e!743300)))

(assert (=> d!141789 (= res!865281 (and ((_ is Cons!29745) (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))) (= (_1!11309 (h!30963 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))) k0!1205)))))

(assert (=> d!141789 (= (containsKey!722 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))) k0!1205) e!743300)))

(declare-fun b!1302989 () Bool)

(declare-fun e!743301 () Bool)

(assert (=> b!1302989 (= e!743300 e!743301)))

(declare-fun res!865282 () Bool)

(assert (=> b!1302989 (=> (not res!865282) (not e!743301))))

(assert (=> b!1302989 (= res!865282 (and (or (not ((_ is Cons!29745) (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))) (bvsle (_1!11309 (h!30963 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))) k0!1205)) ((_ is Cons!29745) (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))) (bvslt (_1!11309 (h!30963 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316))))) k0!1205)))))

(declare-fun b!1302990 () Bool)

(assert (=> b!1302990 (= e!743301 (containsKey!722 (t!43317 (toList!10146 (+!4512 (ListLongMap!20262 Nil!29746) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))) k0!1205))))

(assert (= (and d!141789 (not res!865281)) b!1302989))

(assert (= (and b!1302989 res!865282) b!1302990))

(declare-fun m!1194131 () Bool)

(assert (=> b!1302990 m!1194131))

(assert (=> d!141665 d!141789))

(declare-fun d!141791 () Bool)

(declare-fun e!743303 () Bool)

(assert (=> d!141791 e!743303))

(declare-fun res!865283 () Bool)

(assert (=> d!141791 (=> res!865283 e!743303)))

(declare-fun lt!582636 () Bool)

(assert (=> d!141791 (= res!865283 (not lt!582636))))

(declare-fun lt!582637 () Bool)

(assert (=> d!141791 (= lt!582636 lt!582637)))

(declare-fun lt!582639 () Unit!43036)

(declare-fun e!743302 () Unit!43036)

(assert (=> d!141791 (= lt!582639 e!743302)))

(declare-fun c!125226 () Bool)

(assert (=> d!141791 (= c!125226 lt!582637)))

(assert (=> d!141791 (= lt!582637 (containsKey!722 (toList!10146 lt!582537) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141791 (= (contains!8284 lt!582537 #b1000000000000000000000000000000000000000000000000000000000000000) lt!582636)))

(declare-fun b!1302991 () Bool)

(declare-fun lt!582638 () Unit!43036)

(assert (=> b!1302991 (= e!743302 lt!582638)))

(assert (=> b!1302991 (= lt!582638 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 lt!582537) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302991 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582537) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302992 () Bool)

(declare-fun Unit!43057 () Unit!43036)

(assert (=> b!1302992 (= e!743302 Unit!43057)))

(declare-fun b!1302993 () Bool)

(assert (=> b!1302993 (= e!743303 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141791 c!125226) b!1302991))

(assert (= (and d!141791 (not c!125226)) b!1302992))

(assert (= (and d!141791 (not res!865283)) b!1302993))

(declare-fun m!1194133 () Bool)

(assert (=> d!141791 m!1194133))

(declare-fun m!1194135 () Bool)

(assert (=> b!1302991 m!1194135))

(declare-fun m!1194137 () Bool)

(assert (=> b!1302991 m!1194137))

(assert (=> b!1302991 m!1194137))

(declare-fun m!1194139 () Bool)

(assert (=> b!1302991 m!1194139))

(assert (=> b!1302993 m!1194137))

(assert (=> b!1302993 m!1194137))

(assert (=> b!1302993 m!1194139))

(assert (=> bm!64019 d!141791))

(declare-fun b!1302994 () Bool)

(declare-fun e!743304 () Option!747)

(assert (=> b!1302994 (= e!743304 (Some!746 (_2!11309 (h!30963 (toList!10146 lt!582441)))))))

(declare-fun b!1302995 () Bool)

(declare-fun e!743305 () Option!747)

(assert (=> b!1302995 (= e!743304 e!743305)))

(declare-fun c!125228 () Bool)

(assert (=> b!1302995 (= c!125228 (and ((_ is Cons!29745) (toList!10146 lt!582441)) (not (= (_1!11309 (h!30963 (toList!10146 lt!582441))) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))))

(declare-fun d!141793 () Bool)

(declare-fun c!125227 () Bool)

(assert (=> d!141793 (= c!125227 (and ((_ is Cons!29745) (toList!10146 lt!582441)) (= (_1!11309 (h!30963 (toList!10146 lt!582441))) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (=> d!141793 (= (getValueByKey!696 (toList!10146 lt!582441) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) e!743304)))

(declare-fun b!1302997 () Bool)

(assert (=> b!1302997 (= e!743305 None!745)))

(declare-fun b!1302996 () Bool)

(assert (=> b!1302996 (= e!743305 (getValueByKey!696 (t!43317 (toList!10146 lt!582441)) (_1!11309 (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (= (and d!141793 c!125227) b!1302994))

(assert (= (and d!141793 (not c!125227)) b!1302995))

(assert (= (and b!1302995 c!125228) b!1302996))

(assert (= (and b!1302995 (not c!125228)) b!1302997))

(declare-fun m!1194141 () Bool)

(assert (=> b!1302996 m!1194141))

(assert (=> b!1302696 d!141793))

(declare-fun d!141795 () Bool)

(assert (=> d!141795 (= (get!21187 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302715 d!141795))

(declare-fun d!141797 () Bool)

(declare-fun res!865284 () Bool)

(declare-fun e!743306 () Bool)

(assert (=> d!141797 (=> res!865284 e!743306)))

(assert (=> d!141797 (= res!865284 (and ((_ is Cons!29745) (toList!10146 (ListLongMap!20262 Nil!29746))) (= (_1!11309 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746)))) k0!1205)))))

(assert (=> d!141797 (= (containsKey!722 (toList!10146 (ListLongMap!20262 Nil!29746)) k0!1205) e!743306)))

(declare-fun b!1302998 () Bool)

(declare-fun e!743307 () Bool)

(assert (=> b!1302998 (= e!743306 e!743307)))

(declare-fun res!865285 () Bool)

(assert (=> b!1302998 (=> (not res!865285) (not e!743307))))

(assert (=> b!1302998 (= res!865285 (and (or (not ((_ is Cons!29745) (toList!10146 (ListLongMap!20262 Nil!29746)))) (bvsle (_1!11309 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746)))) k0!1205)) ((_ is Cons!29745) (toList!10146 (ListLongMap!20262 Nil!29746))) (bvslt (_1!11309 (h!30963 (toList!10146 (ListLongMap!20262 Nil!29746)))) k0!1205)))))

(declare-fun b!1302999 () Bool)

(assert (=> b!1302999 (= e!743307 (containsKey!722 (t!43317 (toList!10146 (ListLongMap!20262 Nil!29746))) k0!1205))))

(assert (= (and d!141797 (not res!865284)) b!1302998))

(assert (= (and b!1302998 res!865285) b!1302999))

(declare-fun m!1194143 () Bool)

(assert (=> b!1302999 m!1194143))

(assert (=> d!141649 d!141797))

(declare-fun d!141799 () Bool)

(assert (=> d!141799 (arrayContainsKey!0 _keys!1741 lt!582427 #b00000000000000000000000000000000)))

(declare-fun lt!582642 () Unit!43036)

(declare-fun choose!13 (array!86759 (_ BitVec 64) (_ BitVec 32)) Unit!43036)

(assert (=> d!141799 (= lt!582642 (choose!13 _keys!1741 lt!582427 #b00000000000000000000000000000000))))

(assert (=> d!141799 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141799 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582427 #b00000000000000000000000000000000) lt!582642)))

(declare-fun bs!37086 () Bool)

(assert (= bs!37086 d!141799))

(assert (=> bs!37086 m!1193703))

(declare-fun m!1194145 () Bool)

(assert (=> bs!37086 m!1194145))

(assert (=> b!1302689 d!141799))

(declare-fun d!141801 () Bool)

(declare-fun res!865290 () Bool)

(declare-fun e!743312 () Bool)

(assert (=> d!141801 (=> res!865290 e!743312)))

(assert (=> d!141801 (= res!865290 (= (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) lt!582427))))

(assert (=> d!141801 (= (arrayContainsKey!0 _keys!1741 lt!582427 #b00000000000000000000000000000000) e!743312)))

(declare-fun b!1303004 () Bool)

(declare-fun e!743313 () Bool)

(assert (=> b!1303004 (= e!743312 e!743313)))

(declare-fun res!865291 () Bool)

(assert (=> b!1303004 (=> (not res!865291) (not e!743313))))

(assert (=> b!1303004 (= res!865291 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42422 _keys!1741)))))

(declare-fun b!1303005 () Bool)

(assert (=> b!1303005 (= e!743313 (arrayContainsKey!0 _keys!1741 lt!582427 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141801 (not res!865290)) b!1303004))

(assert (= (and b!1303004 res!865291) b!1303005))

(assert (=> d!141801 m!1193675))

(declare-fun m!1194147 () Bool)

(assert (=> b!1303005 m!1194147))

(assert (=> b!1302689 d!141801))

(declare-fun b!1303018 () Bool)

(declare-fun lt!582651 () SeekEntryResult!9976)

(declare-fun e!743321 () SeekEntryResult!9976)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86759 (_ BitVec 32)) SeekEntryResult!9976)

(assert (=> b!1303018 (= e!743321 (seekKeyOrZeroReturnVacant!0 (x!115571 lt!582651) (index!42277 lt!582651) (index!42277 lt!582651) (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun b!1303019 () Bool)

(assert (=> b!1303019 (= e!743321 (MissingZero!9976 (index!42277 lt!582651)))))

(declare-fun b!1303020 () Bool)

(declare-fun e!743320 () SeekEntryResult!9976)

(assert (=> b!1303020 (= e!743320 (Found!9976 (index!42277 lt!582651)))))

(declare-fun b!1303021 () Bool)

(declare-fun c!125235 () Bool)

(declare-fun lt!582649 () (_ BitVec 64))

(assert (=> b!1303021 (= c!125235 (= lt!582649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303021 (= e!743320 e!743321)))

(declare-fun b!1303022 () Bool)

(declare-fun e!743322 () SeekEntryResult!9976)

(assert (=> b!1303022 (= e!743322 Undefined!9976)))

(declare-fun d!141803 () Bool)

(declare-fun lt!582650 () SeekEntryResult!9976)

(assert (=> d!141803 (and (or ((_ is Undefined!9976) lt!582650) (not ((_ is Found!9976) lt!582650)) (and (bvsge (index!42276 lt!582650) #b00000000000000000000000000000000) (bvslt (index!42276 lt!582650) (size!42422 _keys!1741)))) (or ((_ is Undefined!9976) lt!582650) ((_ is Found!9976) lt!582650) (not ((_ is MissingZero!9976) lt!582650)) (and (bvsge (index!42275 lt!582650) #b00000000000000000000000000000000) (bvslt (index!42275 lt!582650) (size!42422 _keys!1741)))) (or ((_ is Undefined!9976) lt!582650) ((_ is Found!9976) lt!582650) ((_ is MissingZero!9976) lt!582650) (not ((_ is MissingVacant!9976) lt!582650)) (and (bvsge (index!42278 lt!582650) #b00000000000000000000000000000000) (bvslt (index!42278 lt!582650) (size!42422 _keys!1741)))) (or ((_ is Undefined!9976) lt!582650) (ite ((_ is Found!9976) lt!582650) (= (select (arr!41871 _keys!1741) (index!42276 lt!582650)) (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9976) lt!582650) (= (select (arr!41871 _keys!1741) (index!42275 lt!582650)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9976) lt!582650) (= (select (arr!41871 _keys!1741) (index!42278 lt!582650)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141803 (= lt!582650 e!743322)))

(declare-fun c!125237 () Bool)

(assert (=> d!141803 (= c!125237 (and ((_ is Intermediate!9976) lt!582651) (undefined!10788 lt!582651)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86759 (_ BitVec 32)) SeekEntryResult!9976)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141803 (= lt!582651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141803 (validMask!0 mask!2175)))

(assert (=> d!141803 (= (seekEntryOrOpen!0 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!582650)))

(declare-fun b!1303023 () Bool)

(assert (=> b!1303023 (= e!743322 e!743320)))

(assert (=> b!1303023 (= lt!582649 (select (arr!41871 _keys!1741) (index!42277 lt!582651)))))

(declare-fun c!125236 () Bool)

(assert (=> b!1303023 (= c!125236 (= lt!582649 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141803 c!125237) b!1303022))

(assert (= (and d!141803 (not c!125237)) b!1303023))

(assert (= (and b!1303023 c!125236) b!1303020))

(assert (= (and b!1303023 (not c!125236)) b!1303021))

(assert (= (and b!1303021 c!125235) b!1303019))

(assert (= (and b!1303021 (not c!125235)) b!1303018))

(assert (=> b!1303018 m!1193675))

(declare-fun m!1194149 () Bool)

(assert (=> b!1303018 m!1194149))

(declare-fun m!1194151 () Bool)

(assert (=> d!141803 m!1194151))

(declare-fun m!1194153 () Bool)

(assert (=> d!141803 m!1194153))

(assert (=> d!141803 m!1193675))

(declare-fun m!1194155 () Bool)

(assert (=> d!141803 m!1194155))

(assert (=> d!141803 m!1194155))

(assert (=> d!141803 m!1193675))

(declare-fun m!1194157 () Bool)

(assert (=> d!141803 m!1194157))

(declare-fun m!1194159 () Bool)

(assert (=> d!141803 m!1194159))

(assert (=> d!141803 m!1193561))

(declare-fun m!1194161 () Bool)

(assert (=> b!1303023 m!1194161))

(assert (=> b!1302689 d!141803))

(declare-fun d!141805 () Bool)

(declare-fun e!743323 () Bool)

(assert (=> d!141805 e!743323))

(declare-fun res!865293 () Bool)

(assert (=> d!141805 (=> (not res!865293) (not e!743323))))

(declare-fun lt!582654 () ListLongMap!20261)

(assert (=> d!141805 (= res!865293 (contains!8284 lt!582654 (_1!11309 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!582652 () List!29749)

(assert (=> d!141805 (= lt!582654 (ListLongMap!20262 lt!582652))))

(declare-fun lt!582655 () Unit!43036)

(declare-fun lt!582653 () Unit!43036)

(assert (=> d!141805 (= lt!582655 lt!582653)))

(assert (=> d!141805 (= (getValueByKey!696 lt!582652 (_1!11309 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!746 (_2!11309 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141805 (= lt!582653 (lemmaContainsTupThenGetReturnValue!347 lt!582652 (_1!11309 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11309 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141805 (= lt!582652 (insertStrictlySorted!476 (toList!10146 call!64024) (_1!11309 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11309 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141805 (= (+!4512 call!64024 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!582654)))

(declare-fun b!1303024 () Bool)

(declare-fun res!865292 () Bool)

(assert (=> b!1303024 (=> (not res!865292) (not e!743323))))

(assert (=> b!1303024 (= res!865292 (= (getValueByKey!696 (toList!10146 lt!582654) (_1!11309 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!746 (_2!11309 (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1303025 () Bool)

(assert (=> b!1303025 (= e!743323 (contains!8288 (toList!10146 lt!582654) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141805 res!865293) b!1303024))

(assert (= (and b!1303024 res!865292) b!1303025))

(declare-fun m!1194163 () Bool)

(assert (=> d!141805 m!1194163))

(declare-fun m!1194165 () Bool)

(assert (=> d!141805 m!1194165))

(declare-fun m!1194167 () Bool)

(assert (=> d!141805 m!1194167))

(declare-fun m!1194169 () Bool)

(assert (=> d!141805 m!1194169))

(declare-fun m!1194171 () Bool)

(assert (=> b!1303024 m!1194171))

(declare-fun m!1194173 () Bool)

(assert (=> b!1303025 m!1194173))

(assert (=> b!1302809 d!141805))

(declare-fun d!141807 () Bool)

(declare-fun res!865294 () Bool)

(declare-fun e!743324 () Bool)

(assert (=> d!141807 (=> res!865294 e!743324)))

(assert (=> d!141807 (= res!865294 (and ((_ is Cons!29745) (toList!10146 lt!582321)) (= (_1!11309 (h!30963 (toList!10146 lt!582321))) k0!1205)))))

(assert (=> d!141807 (= (containsKey!722 (toList!10146 lt!582321) k0!1205) e!743324)))

(declare-fun b!1303026 () Bool)

(declare-fun e!743325 () Bool)

(assert (=> b!1303026 (= e!743324 e!743325)))

(declare-fun res!865295 () Bool)

(assert (=> b!1303026 (=> (not res!865295) (not e!743325))))

(assert (=> b!1303026 (= res!865295 (and (or (not ((_ is Cons!29745) (toList!10146 lt!582321))) (bvsle (_1!11309 (h!30963 (toList!10146 lt!582321))) k0!1205)) ((_ is Cons!29745) (toList!10146 lt!582321)) (bvslt (_1!11309 (h!30963 (toList!10146 lt!582321))) k0!1205)))))

(declare-fun b!1303027 () Bool)

(assert (=> b!1303027 (= e!743325 (containsKey!722 (t!43317 (toList!10146 lt!582321)) k0!1205))))

(assert (= (and d!141807 (not res!865294)) b!1303026))

(assert (= (and b!1303026 res!865295) b!1303027))

(declare-fun m!1194175 () Bool)

(assert (=> b!1303027 m!1194175))

(assert (=> d!141663 d!141807))

(declare-fun d!141809 () Bool)

(declare-fun res!865296 () Bool)

(declare-fun e!743326 () Bool)

(assert (=> d!141809 (=> res!865296 e!743326)))

(assert (=> d!141809 (= res!865296 (and ((_ is Cons!29745) (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11309 (h!30963 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141809 (= (containsKey!722 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743326)))

(declare-fun b!1303028 () Bool)

(declare-fun e!743327 () Bool)

(assert (=> b!1303028 (= e!743326 e!743327)))

(declare-fun res!865297 () Bool)

(assert (=> b!1303028 (=> (not res!865297) (not e!743327))))

(assert (=> b!1303028 (= res!865297 (and (or (not ((_ is Cons!29745) (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11309 (h!30963 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29745) (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11309 (h!30963 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1303029 () Bool)

(assert (=> b!1303029 (= e!743327 (containsKey!722 (t!43317 (toList!10146 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141809 (not res!865296)) b!1303028))

(assert (= (and b!1303028 res!865297) b!1303029))

(declare-fun m!1194177 () Bool)

(assert (=> b!1303029 m!1194177))

(assert (=> d!141675 d!141809))

(declare-fun d!141811 () Bool)

(declare-fun e!743329 () Bool)

(assert (=> d!141811 e!743329))

(declare-fun res!865298 () Bool)

(assert (=> d!141811 (=> res!865298 e!743329)))

(declare-fun lt!582656 () Bool)

(assert (=> d!141811 (= res!865298 (not lt!582656))))

(declare-fun lt!582657 () Bool)

(assert (=> d!141811 (= lt!582656 lt!582657)))

(declare-fun lt!582659 () Unit!43036)

(declare-fun e!743328 () Unit!43036)

(assert (=> d!141811 (= lt!582659 e!743328)))

(declare-fun c!125238 () Bool)

(assert (=> d!141811 (= c!125238 lt!582657)))

(assert (=> d!141811 (= lt!582657 (containsKey!722 (toList!10146 lt!582475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141811 (= (contains!8284 lt!582475 #b0000000000000000000000000000000000000000000000000000000000000000) lt!582656)))

(declare-fun b!1303030 () Bool)

(declare-fun lt!582658 () Unit!43036)

(assert (=> b!1303030 (= e!743328 lt!582658)))

(assert (=> b!1303030 (= lt!582658 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 lt!582475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303030 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303031 () Bool)

(declare-fun Unit!43058 () Unit!43036)

(assert (=> b!1303031 (= e!743328 Unit!43058)))

(declare-fun b!1303032 () Bool)

(assert (=> b!1303032 (= e!743329 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582475) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141811 c!125238) b!1303030))

(assert (= (and d!141811 (not c!125238)) b!1303031))

(assert (= (and d!141811 (not res!865298)) b!1303032))

(declare-fun m!1194179 () Bool)

(assert (=> d!141811 m!1194179))

(declare-fun m!1194181 () Bool)

(assert (=> b!1303030 m!1194181))

(declare-fun m!1194183 () Bool)

(assert (=> b!1303030 m!1194183))

(assert (=> b!1303030 m!1194183))

(declare-fun m!1194185 () Bool)

(assert (=> b!1303030 m!1194185))

(assert (=> b!1303032 m!1194183))

(assert (=> b!1303032 m!1194183))

(assert (=> b!1303032 m!1194185))

(assert (=> d!141673 d!141811))

(assert (=> d!141673 d!141643))

(assert (=> d!141677 d!141643))

(declare-fun d!141813 () Bool)

(declare-fun e!743331 () Bool)

(assert (=> d!141813 e!743331))

(declare-fun res!865299 () Bool)

(assert (=> d!141813 (=> res!865299 e!743331)))

(declare-fun lt!582660 () Bool)

(assert (=> d!141813 (= res!865299 (not lt!582660))))

(declare-fun lt!582661 () Bool)

(assert (=> d!141813 (= lt!582660 lt!582661)))

(declare-fun lt!582663 () Unit!43036)

(declare-fun e!743330 () Unit!43036)

(assert (=> d!141813 (= lt!582663 e!743330)))

(declare-fun c!125239 () Bool)

(assert (=> d!141813 (= c!125239 lt!582661)))

(assert (=> d!141813 (= lt!582661 (containsKey!722 (toList!10146 lt!582537) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141813 (= (contains!8284 lt!582537 #b0000000000000000000000000000000000000000000000000000000000000000) lt!582660)))

(declare-fun b!1303033 () Bool)

(declare-fun lt!582662 () Unit!43036)

(assert (=> b!1303033 (= e!743330 lt!582662)))

(assert (=> b!1303033 (= lt!582662 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 lt!582537) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303033 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582537) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303034 () Bool)

(declare-fun Unit!43059 () Unit!43036)

(assert (=> b!1303034 (= e!743330 Unit!43059)))

(declare-fun b!1303035 () Bool)

(assert (=> b!1303035 (= e!743331 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582537) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141813 c!125239) b!1303033))

(assert (= (and d!141813 (not c!125239)) b!1303034))

(assert (= (and d!141813 (not res!865299)) b!1303035))

(declare-fun m!1194187 () Bool)

(assert (=> d!141813 m!1194187))

(declare-fun m!1194189 () Bool)

(assert (=> b!1303033 m!1194189))

(assert (=> b!1303033 m!1194053))

(assert (=> b!1303033 m!1194053))

(declare-fun m!1194191 () Bool)

(assert (=> b!1303033 m!1194191))

(assert (=> b!1303035 m!1194053))

(assert (=> b!1303035 m!1194053))

(assert (=> b!1303035 m!1194191))

(assert (=> bm!64020 d!141813))

(assert (=> d!141651 d!141649))

(declare-fun d!141815 () Bool)

(assert (=> d!141815 (not (contains!8284 (ListLongMap!20262 Nil!29746) k0!1205))))

(assert (=> d!141815 true))

(declare-fun _$29!192 () Unit!43036)

(assert (=> d!141815 (= (choose!1906 k0!1205) _$29!192)))

(declare-fun bs!37087 () Bool)

(assert (= bs!37087 d!141815))

(assert (=> bs!37087 m!1193533))

(assert (=> d!141651 d!141815))

(declare-fun d!141817 () Bool)

(declare-fun e!743333 () Bool)

(assert (=> d!141817 e!743333))

(declare-fun res!865300 () Bool)

(assert (=> d!141817 (=> res!865300 e!743333)))

(declare-fun lt!582664 () Bool)

(assert (=> d!141817 (= res!865300 (not lt!582664))))

(declare-fun lt!582665 () Bool)

(assert (=> d!141817 (= lt!582664 lt!582665)))

(declare-fun lt!582667 () Unit!43036)

(declare-fun e!743332 () Unit!43036)

(assert (=> d!141817 (= lt!582667 e!743332)))

(declare-fun c!125240 () Bool)

(assert (=> d!141817 (= c!125240 lt!582665)))

(assert (=> d!141817 (= lt!582665 (containsKey!722 (toList!10146 lt!582475) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141817 (= (contains!8284 lt!582475 #b1000000000000000000000000000000000000000000000000000000000000000) lt!582664)))

(declare-fun b!1303036 () Bool)

(declare-fun lt!582666 () Unit!43036)

(assert (=> b!1303036 (= e!743332 lt!582666)))

(assert (=> b!1303036 (= lt!582666 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 lt!582475) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1303036 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582475) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1303037 () Bool)

(declare-fun Unit!43060 () Unit!43036)

(assert (=> b!1303037 (= e!743332 Unit!43060)))

(declare-fun b!1303038 () Bool)

(assert (=> b!1303038 (= e!743333 (isDefined!505 (getValueByKey!696 (toList!10146 lt!582475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141817 c!125240) b!1303036))

(assert (= (and d!141817 (not c!125240)) b!1303037))

(assert (= (and d!141817 (not res!865300)) b!1303038))

(declare-fun m!1194193 () Bool)

(assert (=> d!141817 m!1194193))

(declare-fun m!1194195 () Bool)

(assert (=> b!1303036 m!1194195))

(declare-fun m!1194197 () Bool)

(assert (=> b!1303036 m!1194197))

(assert (=> b!1303036 m!1194197))

(declare-fun m!1194199 () Bool)

(assert (=> b!1303036 m!1194199))

(assert (=> b!1303038 m!1194197))

(assert (=> b!1303038 m!1194197))

(assert (=> b!1303038 m!1194199))

(assert (=> b!1302741 d!141817))

(declare-fun d!141819 () Bool)

(assert (=> d!141819 (isDefined!505 (getValueByKey!696 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205))))

(declare-fun lt!582668 () Unit!43036)

(assert (=> d!141819 (= lt!582668 (choose!1910 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205))))

(declare-fun e!743334 () Bool)

(assert (=> d!141819 e!743334))

(declare-fun res!865301 () Bool)

(assert (=> d!141819 (=> (not res!865301) (not e!743334))))

(assert (=> d!141819 (= res!865301 (isStrictlySorted!859 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)))))))

(assert (=> d!141819 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205) lt!582668)))

(declare-fun b!1303039 () Bool)

(assert (=> b!1303039 (= e!743334 (containsKey!722 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205))))

(assert (= (and d!141819 res!865301) b!1303039))

(assert (=> d!141819 m!1193697))

(assert (=> d!141819 m!1193697))

(assert (=> d!141819 m!1193699))

(declare-fun m!1194201 () Bool)

(assert (=> d!141819 m!1194201))

(declare-fun m!1194203 () Bool)

(assert (=> d!141819 m!1194203))

(assert (=> b!1303039 m!1193693))

(assert (=> b!1302677 d!141819))

(declare-fun d!141821 () Bool)

(assert (=> d!141821 (= (isDefined!505 (getValueByKey!696 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205)) (not (isEmpty!1059 (getValueByKey!696 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205))))))

(declare-fun bs!37088 () Bool)

(assert (= bs!37088 d!141821))

(assert (=> bs!37088 m!1193697))

(declare-fun m!1194205 () Bool)

(assert (=> bs!37088 m!1194205))

(assert (=> b!1302677 d!141821))

(declare-fun b!1303040 () Bool)

(declare-fun e!743335 () Option!747)

(assert (=> b!1303040 (= e!743335 (Some!746 (_2!11309 (h!30963 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)))))))))

(declare-fun b!1303041 () Bool)

(declare-fun e!743336 () Option!747)

(assert (=> b!1303041 (= e!743335 e!743336)))

(declare-fun c!125242 () Bool)

(assert (=> b!1303041 (= c!125242 (and ((_ is Cons!29745) (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)))) (not (= (_1!11309 (h!30963 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))))) k0!1205))))))

(declare-fun d!141823 () Bool)

(declare-fun c!125241 () Bool)

(assert (=> d!141823 (= c!125241 (and ((_ is Cons!29745) (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)))) (= (_1!11309 (h!30963 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))))) k0!1205)))))

(assert (=> d!141823 (= (getValueByKey!696 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313))) k0!1205) e!743335)))

(declare-fun b!1303043 () Bool)

(assert (=> b!1303043 (= e!743336 None!745)))

(declare-fun b!1303042 () Bool)

(assert (=> b!1303042 (= e!743336 (getValueByKey!696 (t!43317 (toList!10146 (ite c!125113 lt!582314 (ite c!125115 lt!582315 lt!582313)))) k0!1205))))

(assert (= (and d!141823 c!125241) b!1303040))

(assert (= (and d!141823 (not c!125241)) b!1303041))

(assert (= (and b!1303041 c!125242) b!1303042))

(assert (= (and b!1303041 (not c!125242)) b!1303043))

(declare-fun m!1194207 () Bool)

(assert (=> b!1303042 m!1194207))

(assert (=> b!1302677 d!141823))

(declare-fun d!141825 () Bool)

(assert (=> d!141825 (= (apply!1026 lt!582537 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21188 (getValueByKey!696 (toList!10146 lt!582537) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37089 () Bool)

(assert (= bs!37089 d!141825))

(assert (=> bs!37089 m!1194137))

(assert (=> bs!37089 m!1194137))

(declare-fun m!1194209 () Bool)

(assert (=> bs!37089 m!1194209))

(assert (=> b!1302813 d!141825))

(declare-fun d!141827 () Bool)

(declare-fun res!865303 () Bool)

(declare-fun e!743337 () Bool)

(assert (=> d!141827 (=> res!865303 e!743337)))

(assert (=> d!141827 (= res!865303 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42422 _keys!1741)))))

(assert (=> d!141827 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125136 (Cons!29746 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) Nil!29747) Nil!29747)) e!743337)))

(declare-fun b!1303044 () Bool)

(declare-fun e!743338 () Bool)

(declare-fun e!743340 () Bool)

(assert (=> b!1303044 (= e!743338 e!743340)))

(declare-fun c!125243 () Bool)

(assert (=> b!1303044 (= c!125243 (validKeyInArray!0 (select (arr!41871 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!64040 () Bool)

(declare-fun bm!64037 () Bool)

(assert (=> bm!64037 (= call!64040 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125243 (Cons!29746 (select (arr!41871 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125136 (Cons!29746 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) Nil!29747) Nil!29747)) (ite c!125136 (Cons!29746 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) Nil!29747) Nil!29747))))))

(declare-fun b!1303045 () Bool)

(assert (=> b!1303045 (= e!743337 e!743338)))

(declare-fun res!865304 () Bool)

(assert (=> b!1303045 (=> (not res!865304) (not e!743338))))

(declare-fun e!743339 () Bool)

(assert (=> b!1303045 (= res!865304 (not e!743339))))

(declare-fun res!865302 () Bool)

(assert (=> b!1303045 (=> (not res!865302) (not e!743339))))

(assert (=> b!1303045 (= res!865302 (validKeyInArray!0 (select (arr!41871 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1303046 () Bool)

(assert (=> b!1303046 (= e!743340 call!64040)))

(declare-fun b!1303047 () Bool)

(assert (=> b!1303047 (= e!743340 call!64040)))

(declare-fun b!1303048 () Bool)

(assert (=> b!1303048 (= e!743339 (contains!8287 (ite c!125136 (Cons!29746 (select (arr!41871 _keys!1741) #b00000000000000000000000000000000) Nil!29747) Nil!29747) (select (arr!41871 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!141827 (not res!865303)) b!1303045))

(assert (= (and b!1303045 res!865302) b!1303048))

(assert (= (and b!1303045 res!865304) b!1303044))

(assert (= (and b!1303044 c!125243) b!1303047))

(assert (= (and b!1303044 (not c!125243)) b!1303046))

(assert (= (or b!1303047 b!1303046) bm!64037))

(assert (=> b!1303044 m!1193921))

(assert (=> b!1303044 m!1193921))

(assert (=> b!1303044 m!1193929))

(assert (=> bm!64037 m!1193921))

(declare-fun m!1194211 () Bool)

(assert (=> bm!64037 m!1194211))

(assert (=> b!1303045 m!1193921))

(assert (=> b!1303045 m!1193921))

(assert (=> b!1303045 m!1193929))

(assert (=> b!1303048 m!1193921))

(assert (=> b!1303048 m!1193921))

(declare-fun m!1194213 () Bool)

(assert (=> b!1303048 m!1194213))

(assert (=> bm!63995 d!141827))

(declare-fun lt!582669 () Bool)

(declare-fun d!141829 () Bool)

(assert (=> d!141829 (= lt!582669 (select (content!643 (toList!10146 lt!582454)) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))

(declare-fun e!743341 () Bool)

(assert (=> d!141829 (= lt!582669 e!743341)))

(declare-fun res!865305 () Bool)

(assert (=> d!141829 (=> (not res!865305) (not e!743341))))

(assert (=> d!141829 (= res!865305 ((_ is Cons!29745) (toList!10146 lt!582454)))))

(assert (=> d!141829 (= (contains!8288 (toList!10146 lt!582454) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)) lt!582669)))

(declare-fun b!1303049 () Bool)

(declare-fun e!743342 () Bool)

(assert (=> b!1303049 (= e!743341 e!743342)))

(declare-fun res!865306 () Bool)

(assert (=> b!1303049 (=> res!865306 e!743342)))

(assert (=> b!1303049 (= res!865306 (= (h!30963 (toList!10146 lt!582454)) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))

(declare-fun b!1303050 () Bool)

(assert (=> b!1303050 (= e!743342 (contains!8288 (t!43317 (toList!10146 lt!582454)) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) lt!582316)))))

(assert (= (and d!141829 res!865305) b!1303049))

(assert (= (and b!1303049 (not res!865306)) b!1303050))

(declare-fun m!1194215 () Bool)

(assert (=> d!141829 m!1194215))

(declare-fun m!1194217 () Bool)

(assert (=> d!141829 m!1194217))

(declare-fun m!1194219 () Bool)

(assert (=> b!1303050 m!1194219))

(assert (=> b!1302705 d!141829))

(declare-fun d!141831 () Bool)

(declare-fun e!743343 () Bool)

(assert (=> d!141831 e!743343))

(declare-fun res!865308 () Bool)

(assert (=> d!141831 (=> (not res!865308) (not e!743343))))

(declare-fun lt!582672 () ListLongMap!20261)

(assert (=> d!141831 (= res!865308 (contains!8284 lt!582672 (_1!11309 (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!582670 () List!29749)

(assert (=> d!141831 (= lt!582672 (ListLongMap!20262 lt!582670))))

(declare-fun lt!582673 () Unit!43036)

(declare-fun lt!582671 () Unit!43036)

(assert (=> d!141831 (= lt!582673 lt!582671)))

(assert (=> d!141831 (= (getValueByKey!696 lt!582670 (_1!11309 (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!746 (_2!11309 (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141831 (= lt!582671 (lemmaContainsTupThenGetReturnValue!347 lt!582670 (_1!11309 (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11309 (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141831 (= lt!582670 (insertStrictlySorted!476 (toList!10146 (ite c!125179 call!64023 (ite c!125176 call!64019 call!64021))) (_1!11309 (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11309 (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141831 (= (+!4512 (ite c!125179 call!64023 (ite c!125176 call!64019 call!64021)) (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!582672)))

(declare-fun b!1303051 () Bool)

(declare-fun res!865307 () Bool)

(assert (=> b!1303051 (=> (not res!865307) (not e!743343))))

(assert (=> b!1303051 (= res!865307 (= (getValueByKey!696 (toList!10146 lt!582672) (_1!11309 (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!746 (_2!11309 (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1303052 () Bool)

(assert (=> b!1303052 (= e!743343 (contains!8288 (toList!10146 lt!582672) (ite (or c!125179 c!125176) (tuple2!22597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141831 res!865308) b!1303051))

(assert (= (and b!1303051 res!865307) b!1303052))

(declare-fun m!1194221 () Bool)

(assert (=> d!141831 m!1194221))

(declare-fun m!1194223 () Bool)

(assert (=> d!141831 m!1194223))

(declare-fun m!1194225 () Bool)

(assert (=> d!141831 m!1194225))

(declare-fun m!1194227 () Bool)

(assert (=> d!141831 m!1194227))

(declare-fun m!1194229 () Bool)

(assert (=> b!1303051 m!1194229))

(declare-fun m!1194231 () Bool)

(assert (=> b!1303052 m!1194231))

(assert (=> bm!64021 d!141831))

(declare-fun d!141833 () Bool)

(declare-fun e!743344 () Bool)

(assert (=> d!141833 e!743344))

(declare-fun res!865310 () Bool)

(assert (=> d!141833 (=> (not res!865310) (not e!743344))))

(declare-fun lt!582676 () ListLongMap!20261)

(assert (=> d!141833 (= res!865310 (contains!8284 lt!582676 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!582674 () List!29749)

(assert (=> d!141833 (= lt!582676 (ListLongMap!20262 lt!582674))))

(declare-fun lt!582677 () Unit!43036)

(declare-fun lt!582675 () Unit!43036)

(assert (=> d!141833 (= lt!582677 lt!582675)))

(assert (=> d!141833 (= (getValueByKey!696 lt!582674 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!746 (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141833 (= lt!582675 (lemmaContainsTupThenGetReturnValue!347 lt!582674 (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141833 (= lt!582674 (insertStrictlySorted!476 (toList!10146 call!64004) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141833 (= (+!4512 call!64004 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!582676)))

(declare-fun b!1303053 () Bool)

(declare-fun res!865309 () Bool)

(assert (=> b!1303053 (=> (not res!865309) (not e!743344))))

(assert (=> b!1303053 (= res!865309 (= (getValueByKey!696 (toList!10146 lt!582676) (_1!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!746 (_2!11309 (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1303054 () Bool)

(assert (=> b!1303054 (= e!743344 (contains!8288 (toList!10146 lt!582676) (tuple2!22597 (select (arr!41871 _keys!1741) from!2144) (get!21184 (select (arr!41870 _values!1445) from!2144) (dynLambda!3483 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141833 res!865310) b!1303053))

(assert (= (and b!1303053 res!865309) b!1303054))

(declare-fun m!1194233 () Bool)

(assert (=> d!141833 m!1194233))

(declare-fun m!1194235 () Bool)

(assert (=> d!141833 m!1194235))

(declare-fun m!1194237 () Bool)

(assert (=> d!141833 m!1194237))

(declare-fun m!1194239 () Bool)

(assert (=> d!141833 m!1194239))

(declare-fun m!1194241 () Bool)

(assert (=> b!1303053 m!1194241))

(declare-fun m!1194243 () Bool)

(assert (=> b!1303054 m!1194243))

(assert (=> b!1302743 d!141833))

(declare-fun d!141835 () Bool)

(assert (=> d!141835 (not (contains!8284 (+!4512 lt!582478 (tuple2!22597 lt!582479 lt!582477)) lt!582474))))

(declare-fun lt!582678 () Unit!43036)

(assert (=> d!141835 (= lt!582678 (choose!1908 lt!582478 lt!582479 lt!582477 lt!582474))))

(declare-fun e!743345 () Bool)

(assert (=> d!141835 e!743345))

(declare-fun res!865311 () Bool)

(assert (=> d!141835 (=> (not res!865311) (not e!743345))))

(assert (=> d!141835 (= res!865311 (not (contains!8284 lt!582478 lt!582474)))))

(assert (=> d!141835 (= (addStillNotContains!465 lt!582478 lt!582479 lt!582477 lt!582474) lt!582678)))

(declare-fun b!1303055 () Bool)

(assert (=> b!1303055 (= e!743345 (not (= lt!582479 lt!582474)))))

(assert (= (and d!141835 res!865311) b!1303055))

(assert (=> d!141835 m!1193773))

(assert (=> d!141835 m!1193773))

(assert (=> d!141835 m!1193775))

(declare-fun m!1194245 () Bool)

(assert (=> d!141835 m!1194245))

(declare-fun m!1194247 () Bool)

(assert (=> d!141835 m!1194247))

(assert (=> b!1302743 d!141835))

(declare-fun d!141837 () Bool)

(declare-fun e!743346 () Bool)

(assert (=> d!141837 e!743346))

(declare-fun res!865313 () Bool)

(assert (=> d!141837 (=> (not res!865313) (not e!743346))))

(declare-fun lt!582681 () ListLongMap!20261)

(assert (=> d!141837 (= res!865313 (contains!8284 lt!582681 (_1!11309 (tuple2!22597 lt!582479 lt!582477))))))

(declare-fun lt!582679 () List!29749)

(assert (=> d!141837 (= lt!582681 (ListLongMap!20262 lt!582679))))

(declare-fun lt!582682 () Unit!43036)

(declare-fun lt!582680 () Unit!43036)

(assert (=> d!141837 (= lt!582682 lt!582680)))

(assert (=> d!141837 (= (getValueByKey!696 lt!582679 (_1!11309 (tuple2!22597 lt!582479 lt!582477))) (Some!746 (_2!11309 (tuple2!22597 lt!582479 lt!582477))))))

(assert (=> d!141837 (= lt!582680 (lemmaContainsTupThenGetReturnValue!347 lt!582679 (_1!11309 (tuple2!22597 lt!582479 lt!582477)) (_2!11309 (tuple2!22597 lt!582479 lt!582477))))))

(assert (=> d!141837 (= lt!582679 (insertStrictlySorted!476 (toList!10146 lt!582478) (_1!11309 (tuple2!22597 lt!582479 lt!582477)) (_2!11309 (tuple2!22597 lt!582479 lt!582477))))))

(assert (=> d!141837 (= (+!4512 lt!582478 (tuple2!22597 lt!582479 lt!582477)) lt!582681)))

(declare-fun b!1303056 () Bool)

(declare-fun res!865312 () Bool)

(assert (=> b!1303056 (=> (not res!865312) (not e!743346))))

(assert (=> b!1303056 (= res!865312 (= (getValueByKey!696 (toList!10146 lt!582681) (_1!11309 (tuple2!22597 lt!582479 lt!582477))) (Some!746 (_2!11309 (tuple2!22597 lt!582479 lt!582477)))))))

(declare-fun b!1303057 () Bool)

(assert (=> b!1303057 (= e!743346 (contains!8288 (toList!10146 lt!582681) (tuple2!22597 lt!582479 lt!582477)))))

(assert (= (and d!141837 res!865313) b!1303056))

(assert (= (and b!1303056 res!865312) b!1303057))

(declare-fun m!1194249 () Bool)

(assert (=> d!141837 m!1194249))

(declare-fun m!1194251 () Bool)

(assert (=> d!141837 m!1194251))

(declare-fun m!1194253 () Bool)

(assert (=> d!141837 m!1194253))

(declare-fun m!1194255 () Bool)

(assert (=> d!141837 m!1194255))

(declare-fun m!1194257 () Bool)

(assert (=> b!1303056 m!1194257))

(declare-fun m!1194259 () Bool)

(assert (=> b!1303057 m!1194259))

(assert (=> b!1302743 d!141837))

(declare-fun d!141839 () Bool)

(declare-fun e!743348 () Bool)

(assert (=> d!141839 e!743348))

(declare-fun res!865314 () Bool)

(assert (=> d!141839 (=> res!865314 e!743348)))

(declare-fun lt!582683 () Bool)

(assert (=> d!141839 (= res!865314 (not lt!582683))))

(declare-fun lt!582684 () Bool)

(assert (=> d!141839 (= lt!582683 lt!582684)))

(declare-fun lt!582686 () Unit!43036)

(declare-fun e!743347 () Unit!43036)

(assert (=> d!141839 (= lt!582686 e!743347)))

(declare-fun c!125244 () Bool)

(assert (=> d!141839 (= c!125244 lt!582684)))

(assert (=> d!141839 (= lt!582684 (containsKey!722 (toList!10146 (+!4512 lt!582478 (tuple2!22597 lt!582479 lt!582477))) lt!582474))))

(assert (=> d!141839 (= (contains!8284 (+!4512 lt!582478 (tuple2!22597 lt!582479 lt!582477)) lt!582474) lt!582683)))

(declare-fun b!1303058 () Bool)

(declare-fun lt!582685 () Unit!43036)

(assert (=> b!1303058 (= e!743347 lt!582685)))

(assert (=> b!1303058 (= lt!582685 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10146 (+!4512 lt!582478 (tuple2!22597 lt!582479 lt!582477))) lt!582474))))

(assert (=> b!1303058 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 lt!582478 (tuple2!22597 lt!582479 lt!582477))) lt!582474))))

(declare-fun b!1303059 () Bool)

(declare-fun Unit!43061 () Unit!43036)

(assert (=> b!1303059 (= e!743347 Unit!43061)))

(declare-fun b!1303060 () Bool)

(assert (=> b!1303060 (= e!743348 (isDefined!505 (getValueByKey!696 (toList!10146 (+!4512 lt!582478 (tuple2!22597 lt!582479 lt!582477))) lt!582474)))))

(assert (= (and d!141839 c!125244) b!1303058))

(assert (= (and d!141839 (not c!125244)) b!1303059))

(assert (= (and d!141839 (not res!865314)) b!1303060))

(declare-fun m!1194261 () Bool)

(assert (=> d!141839 m!1194261))

(declare-fun m!1194263 () Bool)

(assert (=> b!1303058 m!1194263))

(declare-fun m!1194265 () Bool)

(assert (=> b!1303058 m!1194265))

(assert (=> b!1303058 m!1194265))

(declare-fun m!1194267 () Bool)

(assert (=> b!1303058 m!1194267))

(assert (=> b!1303060 m!1194265))

(assert (=> b!1303060 m!1194265))

(assert (=> b!1303060 m!1194267))

(assert (=> b!1302743 d!141839))

(assert (=> b!1302743 d!141671))

(assert (=> b!1302679 d!141821))

(assert (=> b!1302679 d!141823))

(declare-fun b!1303062 () Bool)

(declare-fun e!743350 () Bool)

(assert (=> b!1303062 (= e!743350 tp_is_empty!34855)))

(declare-fun mapIsEmpty!53868 () Bool)

(declare-fun mapRes!53868 () Bool)

(assert (=> mapIsEmpty!53868 mapRes!53868))

(declare-fun condMapEmpty!53868 () Bool)

(declare-fun mapDefault!53868 () ValueCell!16529)

(assert (=> mapNonEmpty!53867 (= condMapEmpty!53868 (= mapRest!53867 ((as const (Array (_ BitVec 32) ValueCell!16529)) mapDefault!53868)))))

(assert (=> mapNonEmpty!53867 (= tp!102794 (and e!743350 mapRes!53868))))

(declare-fun mapNonEmpty!53868 () Bool)

(declare-fun tp!102795 () Bool)

(declare-fun e!743349 () Bool)

(assert (=> mapNonEmpty!53868 (= mapRes!53868 (and tp!102795 e!743349))))

(declare-fun mapValue!53868 () ValueCell!16529)

(declare-fun mapRest!53868 () (Array (_ BitVec 32) ValueCell!16529))

(declare-fun mapKey!53868 () (_ BitVec 32))

(assert (=> mapNonEmpty!53868 (= mapRest!53867 (store mapRest!53868 mapKey!53868 mapValue!53868))))

(declare-fun b!1303061 () Bool)

(assert (=> b!1303061 (= e!743349 tp_is_empty!34855)))

(assert (= (and mapNonEmpty!53867 condMapEmpty!53868) mapIsEmpty!53868))

(assert (= (and mapNonEmpty!53867 (not condMapEmpty!53868)) mapNonEmpty!53868))

(assert (= (and mapNonEmpty!53868 ((_ is ValueCellFull!16529) mapValue!53868)) b!1303061))

(assert (= (and mapNonEmpty!53867 ((_ is ValueCellFull!16529) mapDefault!53868)) b!1303062))

(declare-fun m!1194269 () Bool)

(assert (=> mapNonEmpty!53868 m!1194269))

(declare-fun b_lambda!23203 () Bool)

(assert (= b_lambda!23201 (or (and start!110046 b_free!29215) b_lambda!23203)))

(declare-fun b_lambda!23205 () Bool)

(assert (= b_lambda!23199 (or (and start!110046 b_free!29215) b_lambda!23205)))

(check-sat (not d!141709) (not d!141835) (not b!1302914) (not b!1302831) (not b!1302933) (not d!141717) (not d!141771) (not b!1302827) (not d!141689) (not d!141735) (not b!1302990) (not d!141755) (not d!141751) (not b!1303052) (not b!1303005) (not b!1302972) (not b!1302984) (not b!1302962) (not b!1302945) (not d!141723) (not b_next!29215) (not b!1303032) (not b_lambda!23203) (not d!141741) (not b!1302951) (not d!141799) (not d!141831) (not b!1302982) (not b!1302941) (not b!1302909) (not b!1303035) (not d!141705) (not b_lambda!23185) (not b!1303033) (not b!1302991) (not b!1303050) (not b!1302837) (not d!141685) (not b!1302884) (not d!141769) (not bm!64030) (not b!1303054) (not b!1302931) (not b!1302961) (not b_lambda!23195) (not d!141759) (not d!141815) (not d!141747) (not d!141725) (not d!141681) (not d!141757) (not b!1302838) (not d!141737) (not b!1302833) (not b!1303051) (not b!1302928) (not b!1302964) (not b!1303027) (not b!1302969) (not b!1302910) (not d!141733) (not b!1302926) (not b!1302957) (not b!1302954) (not b!1303048) (not d!141829) (not b!1302886) (not b!1302917) (not b!1303044) (not b!1302857) (not b!1302949) (not d!141691) (not d!141817) (not d!141785) (not b!1302959) (not d!141745) (not d!141837) (not b!1303039) (not b!1302900) (not d!141767) (not b!1303029) (not b!1302960) (not d!141791) (not d!141805) (not b!1302946) (not bm!64034) (not b!1303056) (not b!1302993) (not b!1302999) (not d!141739) (not d!141773) (not d!141753) (not b!1302919) (not mapNonEmpty!53868) (not d!141729) (not d!141821) (not b!1302978) (not b!1302836) (not d!141731) (not b!1303036) (not d!141687) (not d!141781) (not b!1303025) (not b!1302940) (not b!1302944) (not d!141695) (not b_lambda!23197) (not bm!64023) (not d!141811) (not b!1303018) (not b!1302970) (not b!1303024) (not b!1303053) (not b!1302950) (not b!1302832) (not d!141761) (not b!1302996) (not b!1303060) (not b!1302835) (not b!1303030) (not b!1302882) (not b!1302975) (not b!1302956) (not bm!64037) (not b!1303038) (not d!141765) (not d!141749) (not b!1302894) (not d!141779) (not b!1302953) (not bm!64033) (not b!1302851) (not d!141839) (not b!1302922) (not d!141775) (not d!141825) (not b!1302942) (not b!1302906) (not b!1303045) (not b_lambda!23205) b_and!47351 (not b_lambda!23193) (not b!1302967) (not b!1303042) (not b!1303058) (not b!1302934) (not d!141833) (not b!1302858) (not d!141679) (not b!1302977) (not d!141803) (not b!1302829) (not d!141711) (not b!1302986) (not d!141693) (not d!141763) (not d!141813) (not d!141787) (not d!141715) (not d!141701) (not b!1302840) (not b!1303057) (not d!141743) (not d!141819) tp_is_empty!34855)
(check-sat b_and!47351 (not b_next!29215))
