; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109692 () Bool)

(assert start!109692)

(declare-fun b_free!29145 () Bool)

(declare-fun b_next!29145 () Bool)

(assert (=> start!109692 (= b_free!29145 (not b_next!29145))))

(declare-fun tp!102559 () Bool)

(declare-fun b_and!47241 () Bool)

(assert (=> start!109692 (= tp!102559 b_and!47241)))

(declare-fun b!1299300 () Bool)

(declare-fun res!863455 () Bool)

(declare-fun e!741243 () Bool)

(assert (=> b!1299300 (=> (not res!863455) (not e!741243))))

(declare-datatypes ((array!86576 0))(
  ( (array!86577 (arr!41787 (Array (_ BitVec 32) (_ BitVec 64))) (size!42337 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86576)

(declare-datatypes ((List!29658 0))(
  ( (Nil!29655) (Cons!29654 (h!30863 (_ BitVec 64)) (t!43226 List!29658)) )
))
(declare-fun arrayNoDuplicates!0 (array!86576 (_ BitVec 32) List!29658) Bool)

(assert (=> b!1299300 (= res!863455 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29655))))

(declare-datatypes ((V!51483 0))(
  ( (V!51484 (val!17467 Int)) )
))
(declare-fun minValue!1387 () V!51483)

(declare-fun zeroValue!1387 () V!51483)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16494 0))(
  ( (ValueCellFull!16494 (v!20072 V!51483)) (EmptyCell!16494) )
))
(declare-datatypes ((array!86578 0))(
  ( (array!86579 (arr!41788 (Array (_ BitVec 32) ValueCell!16494)) (size!42338 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86578)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun b!1299301 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22528 0))(
  ( (tuple2!22529 (_1!11275 (_ BitVec 64)) (_2!11275 V!51483)) )
))
(declare-datatypes ((List!29659 0))(
  ( (Nil!29656) (Cons!29655 (h!30864 tuple2!22528) (t!43227 List!29659)) )
))
(declare-datatypes ((ListLongMap!20185 0))(
  ( (ListLongMap!20186 (toList!10108 List!29659)) )
))
(declare-fun contains!8228 (ListLongMap!20185 (_ BitVec 64)) Bool)

(declare-fun +!4441 (ListLongMap!20185 tuple2!22528) ListLongMap!20185)

(declare-fun getCurrentListMapNoExtraKeys!6072 (array!86576 array!86578 (_ BitVec 32) (_ BitVec 32) V!51483 V!51483 (_ BitVec 32) Int) ListLongMap!20185)

(assert (=> b!1299301 (= e!741243 (not (contains!8228 (+!4441 (+!4441 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205)))))

(declare-fun b!1299302 () Bool)

(declare-fun e!741245 () Bool)

(declare-fun tp_is_empty!34785 () Bool)

(assert (=> b!1299302 (= e!741245 tp_is_empty!34785)))

(declare-fun b!1299303 () Bool)

(declare-fun res!863460 () Bool)

(assert (=> b!1299303 (=> (not res!863460) (not e!741243))))

(assert (=> b!1299303 (= res!863460 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1299304 () Bool)

(declare-fun res!863456 () Bool)

(assert (=> b!1299304 (=> (not res!863456) (not e!741243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86576 (_ BitVec 32)) Bool)

(assert (=> b!1299304 (= res!863456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299305 () Bool)

(declare-fun res!863458 () Bool)

(assert (=> b!1299305 (=> (not res!863458) (not e!741243))))

(assert (=> b!1299305 (= res!863458 (and (= (size!42338 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42337 _keys!1741) (size!42338 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299306 () Bool)

(declare-fun res!863462 () Bool)

(assert (=> b!1299306 (=> (not res!863462) (not e!741243))))

(assert (=> b!1299306 (= res!863462 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42337 _keys!1741))))))

(declare-fun b!1299307 () Bool)

(declare-fun res!863459 () Bool)

(assert (=> b!1299307 (=> (not res!863459) (not e!741243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299307 (= res!863459 (validKeyInArray!0 (select (arr!41787 _keys!1741) from!2144)))))

(declare-fun mapNonEmpty!53744 () Bool)

(declare-fun mapRes!53744 () Bool)

(declare-fun tp!102560 () Bool)

(assert (=> mapNonEmpty!53744 (= mapRes!53744 (and tp!102560 e!741245))))

(declare-fun mapRest!53744 () (Array (_ BitVec 32) ValueCell!16494))

(declare-fun mapKey!53744 () (_ BitVec 32))

(declare-fun mapValue!53744 () ValueCell!16494)

(assert (=> mapNonEmpty!53744 (= (arr!41788 _values!1445) (store mapRest!53744 mapKey!53744 mapValue!53744))))

(declare-fun b!1299308 () Bool)

(declare-fun res!863461 () Bool)

(assert (=> b!1299308 (=> (not res!863461) (not e!741243))))

(declare-fun getCurrentListMap!5137 (array!86576 array!86578 (_ BitVec 32) (_ BitVec 32) V!51483 V!51483 (_ BitVec 32) Int) ListLongMap!20185)

(assert (=> b!1299308 (= res!863461 (contains!8228 (getCurrentListMap!5137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299309 () Bool)

(declare-fun res!863457 () Bool)

(assert (=> b!1299309 (=> (not res!863457) (not e!741243))))

(assert (=> b!1299309 (= res!863457 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42337 _keys!1741))))))

(declare-fun res!863463 () Bool)

(assert (=> start!109692 (=> (not res!863463) (not e!741243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109692 (= res!863463 (validMask!0 mask!2175))))

(assert (=> start!109692 e!741243))

(assert (=> start!109692 tp_is_empty!34785))

(assert (=> start!109692 true))

(declare-fun e!741247 () Bool)

(declare-fun array_inv!31625 (array!86578) Bool)

(assert (=> start!109692 (and (array_inv!31625 _values!1445) e!741247)))

(declare-fun array_inv!31626 (array!86576) Bool)

(assert (=> start!109692 (array_inv!31626 _keys!1741)))

(assert (=> start!109692 tp!102559))

(declare-fun mapIsEmpty!53744 () Bool)

(assert (=> mapIsEmpty!53744 mapRes!53744))

(declare-fun b!1299310 () Bool)

(declare-fun e!741246 () Bool)

(assert (=> b!1299310 (= e!741246 tp_is_empty!34785)))

(declare-fun b!1299311 () Bool)

(assert (=> b!1299311 (= e!741247 (and e!741246 mapRes!53744))))

(declare-fun condMapEmpty!53744 () Bool)

(declare-fun mapDefault!53744 () ValueCell!16494)

(assert (=> b!1299311 (= condMapEmpty!53744 (= (arr!41788 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16494)) mapDefault!53744)))))

(assert (= (and start!109692 res!863463) b!1299305))

(assert (= (and b!1299305 res!863458) b!1299304))

(assert (= (and b!1299304 res!863456) b!1299300))

(assert (= (and b!1299300 res!863455) b!1299309))

(assert (= (and b!1299309 res!863457) b!1299308))

(assert (= (and b!1299308 res!863461) b!1299306))

(assert (= (and b!1299306 res!863462) b!1299307))

(assert (= (and b!1299307 res!863459) b!1299303))

(assert (= (and b!1299303 res!863460) b!1299301))

(assert (= (and b!1299311 condMapEmpty!53744) mapIsEmpty!53744))

(assert (= (and b!1299311 (not condMapEmpty!53744)) mapNonEmpty!53744))

(get-info :version)

(assert (= (and mapNonEmpty!53744 ((_ is ValueCellFull!16494) mapValue!53744)) b!1299302))

(assert (= (and b!1299311 ((_ is ValueCellFull!16494) mapDefault!53744)) b!1299310))

(assert (= start!109692 b!1299311))

(declare-fun m!1190495 () Bool)

(assert (=> b!1299308 m!1190495))

(assert (=> b!1299308 m!1190495))

(declare-fun m!1190497 () Bool)

(assert (=> b!1299308 m!1190497))

(declare-fun m!1190499 () Bool)

(assert (=> mapNonEmpty!53744 m!1190499))

(declare-fun m!1190501 () Bool)

(assert (=> b!1299300 m!1190501))

(declare-fun m!1190503 () Bool)

(assert (=> start!109692 m!1190503))

(declare-fun m!1190505 () Bool)

(assert (=> start!109692 m!1190505))

(declare-fun m!1190507 () Bool)

(assert (=> start!109692 m!1190507))

(declare-fun m!1190509 () Bool)

(assert (=> b!1299304 m!1190509))

(declare-fun m!1190511 () Bool)

(assert (=> b!1299307 m!1190511))

(assert (=> b!1299307 m!1190511))

(declare-fun m!1190513 () Bool)

(assert (=> b!1299307 m!1190513))

(declare-fun m!1190515 () Bool)

(assert (=> b!1299301 m!1190515))

(assert (=> b!1299301 m!1190515))

(declare-fun m!1190517 () Bool)

(assert (=> b!1299301 m!1190517))

(assert (=> b!1299301 m!1190517))

(declare-fun m!1190519 () Bool)

(assert (=> b!1299301 m!1190519))

(assert (=> b!1299301 m!1190519))

(declare-fun m!1190521 () Bool)

(assert (=> b!1299301 m!1190521))

(check-sat (not b!1299304) (not b!1299307) tp_is_empty!34785 (not b!1299300) (not b!1299308) (not b!1299301) (not b_next!29145) (not mapNonEmpty!53744) b_and!47241 (not start!109692))
(check-sat b_and!47241 (not b_next!29145))
(get-model)

(declare-fun d!141099 () Bool)

(assert (=> d!141099 (= (validKeyInArray!0 (select (arr!41787 _keys!1741) from!2144)) (and (not (= (select (arr!41787 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41787 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1299307 d!141099))

(declare-fun bm!63570 () Bool)

(declare-fun call!63573 () Bool)

(assert (=> bm!63570 (= call!63573 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1299356 () Bool)

(declare-fun e!741269 () Bool)

(assert (=> b!1299356 (= e!741269 call!63573)))

(declare-fun b!1299357 () Bool)

(declare-fun e!741271 () Bool)

(assert (=> b!1299357 (= e!741271 e!741269)))

(declare-fun lt!580970 () (_ BitVec 64))

(assert (=> b!1299357 (= lt!580970 (select (arr!41787 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43021 0))(
  ( (Unit!43022) )
))
(declare-fun lt!580972 () Unit!43021)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86576 (_ BitVec 64) (_ BitVec 32)) Unit!43021)

(assert (=> b!1299357 (= lt!580972 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!580970 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1299357 (arrayContainsKey!0 _keys!1741 lt!580970 #b00000000000000000000000000000000)))

(declare-fun lt!580971 () Unit!43021)

(assert (=> b!1299357 (= lt!580971 lt!580972)))

(declare-fun res!863495 () Bool)

(declare-datatypes ((SeekEntryResult!10017 0))(
  ( (MissingZero!10017 (index!42439 (_ BitVec 32))) (Found!10017 (index!42440 (_ BitVec 32))) (Intermediate!10017 (undefined!10829 Bool) (index!42441 (_ BitVec 32)) (x!115430 (_ BitVec 32))) (Undefined!10017) (MissingVacant!10017 (index!42442 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86576 (_ BitVec 32)) SeekEntryResult!10017)

(assert (=> b!1299357 (= res!863495 (= (seekEntryOrOpen!0 (select (arr!41787 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10017 #b00000000000000000000000000000000)))))

(assert (=> b!1299357 (=> (not res!863495) (not e!741269))))

(declare-fun b!1299358 () Bool)

(assert (=> b!1299358 (= e!741271 call!63573)))

(declare-fun d!141101 () Bool)

(declare-fun res!863496 () Bool)

(declare-fun e!741270 () Bool)

(assert (=> d!141101 (=> res!863496 e!741270)))

(assert (=> d!141101 (= res!863496 (bvsge #b00000000000000000000000000000000 (size!42337 _keys!1741)))))

(assert (=> d!141101 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!741270)))

(declare-fun b!1299359 () Bool)

(assert (=> b!1299359 (= e!741270 e!741271)))

(declare-fun c!124481 () Bool)

(assert (=> b!1299359 (= c!124481 (validKeyInArray!0 (select (arr!41787 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141101 (not res!863496)) b!1299359))

(assert (= (and b!1299359 c!124481) b!1299357))

(assert (= (and b!1299359 (not c!124481)) b!1299358))

(assert (= (and b!1299357 res!863495) b!1299356))

(assert (= (or b!1299356 b!1299358) bm!63570))

(declare-fun m!1190551 () Bool)

(assert (=> bm!63570 m!1190551))

(declare-fun m!1190553 () Bool)

(assert (=> b!1299357 m!1190553))

(declare-fun m!1190555 () Bool)

(assert (=> b!1299357 m!1190555))

(declare-fun m!1190557 () Bool)

(assert (=> b!1299357 m!1190557))

(assert (=> b!1299357 m!1190553))

(declare-fun m!1190559 () Bool)

(assert (=> b!1299357 m!1190559))

(assert (=> b!1299359 m!1190553))

(assert (=> b!1299359 m!1190553))

(declare-fun m!1190561 () Bool)

(assert (=> b!1299359 m!1190561))

(assert (=> b!1299304 d!141101))

(declare-fun d!141103 () Bool)

(assert (=> d!141103 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109692 d!141103))

(declare-fun d!141105 () Bool)

(assert (=> d!141105 (= (array_inv!31625 _values!1445) (bvsge (size!42338 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109692 d!141105))

(declare-fun d!141107 () Bool)

(assert (=> d!141107 (= (array_inv!31626 _keys!1741) (bvsge (size!42337 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109692 d!141107))

(declare-fun d!141109 () Bool)

(declare-fun e!741277 () Bool)

(assert (=> d!141109 e!741277))

(declare-fun res!863499 () Bool)

(assert (=> d!141109 (=> res!863499 e!741277)))

(declare-fun lt!580982 () Bool)

(assert (=> d!141109 (= res!863499 (not lt!580982))))

(declare-fun lt!580984 () Bool)

(assert (=> d!141109 (= lt!580982 lt!580984)))

(declare-fun lt!580981 () Unit!43021)

(declare-fun e!741276 () Unit!43021)

(assert (=> d!141109 (= lt!580981 e!741276)))

(declare-fun c!124484 () Bool)

(assert (=> d!141109 (= c!124484 lt!580984)))

(declare-fun containsKey!719 (List!29659 (_ BitVec 64)) Bool)

(assert (=> d!141109 (= lt!580984 (containsKey!719 (toList!10108 (getCurrentListMap!5137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141109 (= (contains!8228 (getCurrentListMap!5137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!580982)))

(declare-fun b!1299366 () Bool)

(declare-fun lt!580983 () Unit!43021)

(assert (=> b!1299366 (= e!741276 lt!580983)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!465 (List!29659 (_ BitVec 64)) Unit!43021)

(assert (=> b!1299366 (= lt!580983 (lemmaContainsKeyImpliesGetValueByKeyDefined!465 (toList!10108 (getCurrentListMap!5137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!749 0))(
  ( (Some!748 (v!20074 V!51483)) (None!747) )
))
(declare-fun isDefined!504 (Option!749) Bool)

(declare-fun getValueByKey!697 (List!29659 (_ BitVec 64)) Option!749)

(assert (=> b!1299366 (isDefined!504 (getValueByKey!697 (toList!10108 (getCurrentListMap!5137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1299367 () Bool)

(declare-fun Unit!43023 () Unit!43021)

(assert (=> b!1299367 (= e!741276 Unit!43023)))

(declare-fun b!1299368 () Bool)

(assert (=> b!1299368 (= e!741277 (isDefined!504 (getValueByKey!697 (toList!10108 (getCurrentListMap!5137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141109 c!124484) b!1299366))

(assert (= (and d!141109 (not c!124484)) b!1299367))

(assert (= (and d!141109 (not res!863499)) b!1299368))

(declare-fun m!1190563 () Bool)

(assert (=> d!141109 m!1190563))

(declare-fun m!1190565 () Bool)

(assert (=> b!1299366 m!1190565))

(declare-fun m!1190567 () Bool)

(assert (=> b!1299366 m!1190567))

(assert (=> b!1299366 m!1190567))

(declare-fun m!1190569 () Bool)

(assert (=> b!1299366 m!1190569))

(assert (=> b!1299368 m!1190567))

(assert (=> b!1299368 m!1190567))

(assert (=> b!1299368 m!1190569))

(assert (=> b!1299308 d!141109))

(declare-fun e!741316 () Bool)

(declare-fun lt!581032 () ListLongMap!20185)

(declare-fun b!1299411 () Bool)

(declare-fun apply!1014 (ListLongMap!20185 (_ BitVec 64)) V!51483)

(declare-fun get!21107 (ValueCell!16494 V!51483) V!51483)

(declare-fun dynLambda!3418 (Int (_ BitVec 64)) V!51483)

(assert (=> b!1299411 (= e!741316 (= (apply!1014 lt!581032 (select (arr!41787 _keys!1741) from!2144)) (get!21107 (select (arr!41788 _values!1445) from!2144) (dynLambda!3418 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1299411 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42338 _values!1445)))))

(assert (=> b!1299411 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42337 _keys!1741)))))

(declare-fun b!1299412 () Bool)

(declare-fun e!741315 () Bool)

(assert (=> b!1299412 (= e!741315 (= (apply!1014 lt!581032 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1299413 () Bool)

(declare-fun e!741307 () Bool)

(declare-fun call!63589 () Bool)

(assert (=> b!1299413 (= e!741307 (not call!63589))))

(declare-fun b!1299415 () Bool)

(declare-fun res!863523 () Bool)

(declare-fun e!741314 () Bool)

(assert (=> b!1299415 (=> (not res!863523) (not e!741314))))

(declare-fun e!741308 () Bool)

(assert (=> b!1299415 (= res!863523 e!741308)))

(declare-fun res!863518 () Bool)

(assert (=> b!1299415 (=> res!863518 e!741308)))

(declare-fun e!741309 () Bool)

(assert (=> b!1299415 (= res!863518 (not e!741309))))

(declare-fun res!863525 () Bool)

(assert (=> b!1299415 (=> (not res!863525) (not e!741309))))

(assert (=> b!1299415 (= res!863525 (bvslt from!2144 (size!42337 _keys!1741)))))

(declare-fun b!1299416 () Bool)

(assert (=> b!1299416 (= e!741307 e!741315)))

(declare-fun res!863521 () Bool)

(assert (=> b!1299416 (= res!863521 call!63589)))

(assert (=> b!1299416 (=> (not res!863521) (not e!741315))))

(declare-fun bm!63585 () Bool)

(declare-fun call!63588 () ListLongMap!20185)

(declare-fun call!63593 () ListLongMap!20185)

(assert (=> bm!63585 (= call!63588 call!63593)))

(declare-fun bm!63586 () Bool)

(assert (=> bm!63586 (= call!63589 (contains!8228 lt!581032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!63587 () Bool)

(declare-fun call!63592 () ListLongMap!20185)

(assert (=> bm!63587 (= call!63592 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1299417 () Bool)

(assert (=> b!1299417 (= e!741309 (validKeyInArray!0 (select (arr!41787 _keys!1741) from!2144)))))

(declare-fun b!1299418 () Bool)

(declare-fun e!741311 () ListLongMap!20185)

(declare-fun call!63591 () ListLongMap!20185)

(assert (=> b!1299418 (= e!741311 (+!4441 call!63591 (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1299419 () Bool)

(declare-fun e!741305 () ListLongMap!20185)

(declare-fun call!63594 () ListLongMap!20185)

(assert (=> b!1299419 (= e!741305 call!63594)))

(declare-fun bm!63588 () Bool)

(assert (=> bm!63588 (= call!63593 call!63592)))

(declare-fun b!1299420 () Bool)

(declare-fun res!863519 () Bool)

(assert (=> b!1299420 (=> (not res!863519) (not e!741314))))

(assert (=> b!1299420 (= res!863519 e!741307)))

(declare-fun c!124497 () Bool)

(assert (=> b!1299420 (= c!124497 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1299421 () Bool)

(declare-fun e!741304 () Unit!43021)

(declare-fun Unit!43024 () Unit!43021)

(assert (=> b!1299421 (= e!741304 Unit!43024)))

(declare-fun d!141111 () Bool)

(assert (=> d!141111 e!741314))

(declare-fun res!863524 () Bool)

(assert (=> d!141111 (=> (not res!863524) (not e!741314))))

(assert (=> d!141111 (= res!863524 (or (bvsge from!2144 (size!42337 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42337 _keys!1741)))))))

(declare-fun lt!581050 () ListLongMap!20185)

(assert (=> d!141111 (= lt!581032 lt!581050)))

(declare-fun lt!581042 () Unit!43021)

(assert (=> d!141111 (= lt!581042 e!741304)))

(declare-fun c!124501 () Bool)

(declare-fun e!741312 () Bool)

(assert (=> d!141111 (= c!124501 e!741312)))

(declare-fun res!863526 () Bool)

(assert (=> d!141111 (=> (not res!863526) (not e!741312))))

(assert (=> d!141111 (= res!863526 (bvslt from!2144 (size!42337 _keys!1741)))))

(assert (=> d!141111 (= lt!581050 e!741311)))

(declare-fun c!124500 () Bool)

(assert (=> d!141111 (= c!124500 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141111 (validMask!0 mask!2175)))

(assert (=> d!141111 (= (getCurrentListMap!5137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581032)))

(declare-fun b!1299414 () Bool)

(declare-fun e!741310 () ListLongMap!20185)

(assert (=> b!1299414 (= e!741310 call!63594)))

(declare-fun bm!63589 () Bool)

(declare-fun call!63590 () Bool)

(assert (=> bm!63589 (= call!63590 (contains!8228 lt!581032 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1299422 () Bool)

(declare-fun lt!581044 () Unit!43021)

(assert (=> b!1299422 (= e!741304 lt!581044)))

(declare-fun lt!581035 () ListLongMap!20185)

(assert (=> b!1299422 (= lt!581035 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581034 () (_ BitVec 64))

(assert (=> b!1299422 (= lt!581034 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581029 () (_ BitVec 64))

(assert (=> b!1299422 (= lt!581029 (select (arr!41787 _keys!1741) from!2144))))

(declare-fun lt!581036 () Unit!43021)

(declare-fun addStillContains!1102 (ListLongMap!20185 (_ BitVec 64) V!51483 (_ BitVec 64)) Unit!43021)

(assert (=> b!1299422 (= lt!581036 (addStillContains!1102 lt!581035 lt!581034 zeroValue!1387 lt!581029))))

(assert (=> b!1299422 (contains!8228 (+!4441 lt!581035 (tuple2!22529 lt!581034 zeroValue!1387)) lt!581029)))

(declare-fun lt!581041 () Unit!43021)

(assert (=> b!1299422 (= lt!581041 lt!581036)))

(declare-fun lt!581031 () ListLongMap!20185)

(assert (=> b!1299422 (= lt!581031 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581033 () (_ BitVec 64))

(assert (=> b!1299422 (= lt!581033 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581045 () (_ BitVec 64))

(assert (=> b!1299422 (= lt!581045 (select (arr!41787 _keys!1741) from!2144))))

(declare-fun lt!581030 () Unit!43021)

(declare-fun addApplyDifferent!556 (ListLongMap!20185 (_ BitVec 64) V!51483 (_ BitVec 64)) Unit!43021)

(assert (=> b!1299422 (= lt!581030 (addApplyDifferent!556 lt!581031 lt!581033 minValue!1387 lt!581045))))

(assert (=> b!1299422 (= (apply!1014 (+!4441 lt!581031 (tuple2!22529 lt!581033 minValue!1387)) lt!581045) (apply!1014 lt!581031 lt!581045))))

(declare-fun lt!581049 () Unit!43021)

(assert (=> b!1299422 (= lt!581049 lt!581030)))

(declare-fun lt!581037 () ListLongMap!20185)

(assert (=> b!1299422 (= lt!581037 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581046 () (_ BitVec 64))

(assert (=> b!1299422 (= lt!581046 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581038 () (_ BitVec 64))

(assert (=> b!1299422 (= lt!581038 (select (arr!41787 _keys!1741) from!2144))))

(declare-fun lt!581039 () Unit!43021)

(assert (=> b!1299422 (= lt!581039 (addApplyDifferent!556 lt!581037 lt!581046 zeroValue!1387 lt!581038))))

(assert (=> b!1299422 (= (apply!1014 (+!4441 lt!581037 (tuple2!22529 lt!581046 zeroValue!1387)) lt!581038) (apply!1014 lt!581037 lt!581038))))

(declare-fun lt!581048 () Unit!43021)

(assert (=> b!1299422 (= lt!581048 lt!581039)))

(declare-fun lt!581040 () ListLongMap!20185)

(assert (=> b!1299422 (= lt!581040 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581047 () (_ BitVec 64))

(assert (=> b!1299422 (= lt!581047 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581043 () (_ BitVec 64))

(assert (=> b!1299422 (= lt!581043 (select (arr!41787 _keys!1741) from!2144))))

(assert (=> b!1299422 (= lt!581044 (addApplyDifferent!556 lt!581040 lt!581047 minValue!1387 lt!581043))))

(assert (=> b!1299422 (= (apply!1014 (+!4441 lt!581040 (tuple2!22529 lt!581047 minValue!1387)) lt!581043) (apply!1014 lt!581040 lt!581043))))

(declare-fun b!1299423 () Bool)

(declare-fun e!741306 () Bool)

(assert (=> b!1299423 (= e!741306 (not call!63590))))

(declare-fun b!1299424 () Bool)

(assert (=> b!1299424 (= e!741308 e!741316)))

(declare-fun res!863522 () Bool)

(assert (=> b!1299424 (=> (not res!863522) (not e!741316))))

(assert (=> b!1299424 (= res!863522 (contains!8228 lt!581032 (select (arr!41787 _keys!1741) from!2144)))))

(assert (=> b!1299424 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42337 _keys!1741)))))

(declare-fun b!1299425 () Bool)

(assert (=> b!1299425 (= e!741311 e!741310)))

(declare-fun c!124498 () Bool)

(assert (=> b!1299425 (= c!124498 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1299426 () Bool)

(declare-fun e!741313 () Bool)

(assert (=> b!1299426 (= e!741313 (= (apply!1014 lt!581032 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1299427 () Bool)

(assert (=> b!1299427 (= e!741306 e!741313)))

(declare-fun res!863520 () Bool)

(assert (=> b!1299427 (= res!863520 call!63590)))

(assert (=> b!1299427 (=> (not res!863520) (not e!741313))))

(declare-fun bm!63590 () Bool)

(assert (=> bm!63590 (= call!63594 call!63591)))

(declare-fun b!1299428 () Bool)

(assert (=> b!1299428 (= e!741305 call!63588)))

(declare-fun b!1299429 () Bool)

(declare-fun c!124502 () Bool)

(assert (=> b!1299429 (= c!124502 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1299429 (= e!741310 e!741305)))

(declare-fun bm!63591 () Bool)

(assert (=> bm!63591 (= call!63591 (+!4441 (ite c!124500 call!63592 (ite c!124498 call!63593 call!63588)) (ite (or c!124500 c!124498) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1299430 () Bool)

(assert (=> b!1299430 (= e!741314 e!741306)))

(declare-fun c!124499 () Bool)

(assert (=> b!1299430 (= c!124499 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1299431 () Bool)

(assert (=> b!1299431 (= e!741312 (validKeyInArray!0 (select (arr!41787 _keys!1741) from!2144)))))

(assert (= (and d!141111 c!124500) b!1299418))

(assert (= (and d!141111 (not c!124500)) b!1299425))

(assert (= (and b!1299425 c!124498) b!1299414))

(assert (= (and b!1299425 (not c!124498)) b!1299429))

(assert (= (and b!1299429 c!124502) b!1299419))

(assert (= (and b!1299429 (not c!124502)) b!1299428))

(assert (= (or b!1299419 b!1299428) bm!63585))

(assert (= (or b!1299414 bm!63585) bm!63588))

(assert (= (or b!1299414 b!1299419) bm!63590))

(assert (= (or b!1299418 bm!63588) bm!63587))

(assert (= (or b!1299418 bm!63590) bm!63591))

(assert (= (and d!141111 res!863526) b!1299431))

(assert (= (and d!141111 c!124501) b!1299422))

(assert (= (and d!141111 (not c!124501)) b!1299421))

(assert (= (and d!141111 res!863524) b!1299415))

(assert (= (and b!1299415 res!863525) b!1299417))

(assert (= (and b!1299415 (not res!863518)) b!1299424))

(assert (= (and b!1299424 res!863522) b!1299411))

(assert (= (and b!1299415 res!863523) b!1299420))

(assert (= (and b!1299420 c!124497) b!1299416))

(assert (= (and b!1299420 (not c!124497)) b!1299413))

(assert (= (and b!1299416 res!863521) b!1299412))

(assert (= (or b!1299416 b!1299413) bm!63586))

(assert (= (and b!1299420 res!863519) b!1299430))

(assert (= (and b!1299430 c!124499) b!1299427))

(assert (= (and b!1299430 (not c!124499)) b!1299423))

(assert (= (and b!1299427 res!863520) b!1299426))

(assert (= (or b!1299427 b!1299423) bm!63589))

(declare-fun b_lambda!23149 () Bool)

(assert (=> (not b_lambda!23149) (not b!1299411)))

(declare-fun t!43230 () Bool)

(declare-fun tb!11373 () Bool)

(assert (=> (and start!109692 (= defaultEntry!1448 defaultEntry!1448) t!43230) tb!11373))

(declare-fun result!23751 () Bool)

(assert (=> tb!11373 (= result!23751 tp_is_empty!34785)))

(assert (=> b!1299411 t!43230))

(declare-fun b_and!47245 () Bool)

(assert (= b_and!47241 (and (=> t!43230 result!23751) b_and!47245)))

(declare-fun m!1190571 () Bool)

(assert (=> bm!63586 m!1190571))

(declare-fun m!1190573 () Bool)

(assert (=> b!1299418 m!1190573))

(declare-fun m!1190575 () Bool)

(assert (=> bm!63589 m!1190575))

(declare-fun m!1190577 () Bool)

(assert (=> bm!63591 m!1190577))

(declare-fun m!1190579 () Bool)

(assert (=> b!1299426 m!1190579))

(assert (=> b!1299431 m!1190511))

(assert (=> b!1299431 m!1190511))

(assert (=> b!1299431 m!1190513))

(declare-fun m!1190581 () Bool)

(assert (=> b!1299411 m!1190581))

(assert (=> b!1299411 m!1190511))

(declare-fun m!1190583 () Bool)

(assert (=> b!1299411 m!1190583))

(assert (=> b!1299411 m!1190583))

(assert (=> b!1299411 m!1190581))

(declare-fun m!1190585 () Bool)

(assert (=> b!1299411 m!1190585))

(assert (=> b!1299411 m!1190511))

(declare-fun m!1190587 () Bool)

(assert (=> b!1299411 m!1190587))

(assert (=> b!1299424 m!1190511))

(assert (=> b!1299424 m!1190511))

(declare-fun m!1190589 () Bool)

(assert (=> b!1299424 m!1190589))

(assert (=> d!141111 m!1190503))

(assert (=> bm!63587 m!1190515))

(declare-fun m!1190591 () Bool)

(assert (=> b!1299422 m!1190591))

(declare-fun m!1190593 () Bool)

(assert (=> b!1299422 m!1190593))

(declare-fun m!1190595 () Bool)

(assert (=> b!1299422 m!1190595))

(assert (=> b!1299422 m!1190511))

(assert (=> b!1299422 m!1190591))

(declare-fun m!1190597 () Bool)

(assert (=> b!1299422 m!1190597))

(declare-fun m!1190599 () Bool)

(assert (=> b!1299422 m!1190599))

(declare-fun m!1190601 () Bool)

(assert (=> b!1299422 m!1190601))

(declare-fun m!1190603 () Bool)

(assert (=> b!1299422 m!1190603))

(declare-fun m!1190605 () Bool)

(assert (=> b!1299422 m!1190605))

(declare-fun m!1190607 () Bool)

(assert (=> b!1299422 m!1190607))

(assert (=> b!1299422 m!1190605))

(declare-fun m!1190609 () Bool)

(assert (=> b!1299422 m!1190609))

(assert (=> b!1299422 m!1190515))

(declare-fun m!1190611 () Bool)

(assert (=> b!1299422 m!1190611))

(declare-fun m!1190613 () Bool)

(assert (=> b!1299422 m!1190613))

(declare-fun m!1190615 () Bool)

(assert (=> b!1299422 m!1190615))

(assert (=> b!1299422 m!1190597))

(declare-fun m!1190617 () Bool)

(assert (=> b!1299422 m!1190617))

(assert (=> b!1299422 m!1190601))

(declare-fun m!1190619 () Bool)

(assert (=> b!1299422 m!1190619))

(declare-fun m!1190621 () Bool)

(assert (=> b!1299412 m!1190621))

(assert (=> b!1299417 m!1190511))

(assert (=> b!1299417 m!1190511))

(assert (=> b!1299417 m!1190513))

(assert (=> b!1299308 d!141111))

(declare-fun b!1299444 () Bool)

(declare-fun e!741325 () Bool)

(declare-fun call!63597 () Bool)

(assert (=> b!1299444 (= e!741325 call!63597)))

(declare-fun b!1299445 () Bool)

(declare-fun e!741326 () Bool)

(assert (=> b!1299445 (= e!741326 e!741325)))

(declare-fun c!124505 () Bool)

(assert (=> b!1299445 (= c!124505 (validKeyInArray!0 (select (arr!41787 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1299446 () Bool)

(declare-fun e!741327 () Bool)

(declare-fun contains!8229 (List!29658 (_ BitVec 64)) Bool)

(assert (=> b!1299446 (= e!741327 (contains!8229 Nil!29655 (select (arr!41787 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141113 () Bool)

(declare-fun res!863533 () Bool)

(declare-fun e!741328 () Bool)

(assert (=> d!141113 (=> res!863533 e!741328)))

(assert (=> d!141113 (= res!863533 (bvsge #b00000000000000000000000000000000 (size!42337 _keys!1741)))))

(assert (=> d!141113 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29655) e!741328)))

(declare-fun b!1299447 () Bool)

(assert (=> b!1299447 (= e!741328 e!741326)))

(declare-fun res!863535 () Bool)

(assert (=> b!1299447 (=> (not res!863535) (not e!741326))))

(assert (=> b!1299447 (= res!863535 (not e!741327))))

(declare-fun res!863534 () Bool)

(assert (=> b!1299447 (=> (not res!863534) (not e!741327))))

(assert (=> b!1299447 (= res!863534 (validKeyInArray!0 (select (arr!41787 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63594 () Bool)

(assert (=> bm!63594 (= call!63597 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124505 (Cons!29654 (select (arr!41787 _keys!1741) #b00000000000000000000000000000000) Nil!29655) Nil!29655)))))

(declare-fun b!1299448 () Bool)

(assert (=> b!1299448 (= e!741325 call!63597)))

(assert (= (and d!141113 (not res!863533)) b!1299447))

(assert (= (and b!1299447 res!863534) b!1299446))

(assert (= (and b!1299447 res!863535) b!1299445))

(assert (= (and b!1299445 c!124505) b!1299444))

(assert (= (and b!1299445 (not c!124505)) b!1299448))

(assert (= (or b!1299444 b!1299448) bm!63594))

(assert (=> b!1299445 m!1190553))

(assert (=> b!1299445 m!1190553))

(assert (=> b!1299445 m!1190561))

(assert (=> b!1299446 m!1190553))

(assert (=> b!1299446 m!1190553))

(declare-fun m!1190623 () Bool)

(assert (=> b!1299446 m!1190623))

(assert (=> b!1299447 m!1190553))

(assert (=> b!1299447 m!1190553))

(assert (=> b!1299447 m!1190561))

(assert (=> bm!63594 m!1190553))

(declare-fun m!1190625 () Bool)

(assert (=> bm!63594 m!1190625))

(assert (=> b!1299300 d!141113))

(declare-fun d!141115 () Bool)

(declare-fun e!741330 () Bool)

(assert (=> d!141115 e!741330))

(declare-fun res!863536 () Bool)

(assert (=> d!141115 (=> res!863536 e!741330)))

(declare-fun lt!581052 () Bool)

(assert (=> d!141115 (= res!863536 (not lt!581052))))

(declare-fun lt!581054 () Bool)

(assert (=> d!141115 (= lt!581052 lt!581054)))

(declare-fun lt!581051 () Unit!43021)

(declare-fun e!741329 () Unit!43021)

(assert (=> d!141115 (= lt!581051 e!741329)))

(declare-fun c!124506 () Bool)

(assert (=> d!141115 (= c!124506 lt!581054)))

(assert (=> d!141115 (= lt!581054 (containsKey!719 (toList!10108 (+!4441 (+!4441 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!141115 (= (contains!8228 (+!4441 (+!4441 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!581052)))

(declare-fun b!1299449 () Bool)

(declare-fun lt!581053 () Unit!43021)

(assert (=> b!1299449 (= e!741329 lt!581053)))

(assert (=> b!1299449 (= lt!581053 (lemmaContainsKeyImpliesGetValueByKeyDefined!465 (toList!10108 (+!4441 (+!4441 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> b!1299449 (isDefined!504 (getValueByKey!697 (toList!10108 (+!4441 (+!4441 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1299450 () Bool)

(declare-fun Unit!43025 () Unit!43021)

(assert (=> b!1299450 (= e!741329 Unit!43025)))

(declare-fun b!1299451 () Bool)

(assert (=> b!1299451 (= e!741330 (isDefined!504 (getValueByKey!697 (toList!10108 (+!4441 (+!4441 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!141115 c!124506) b!1299449))

(assert (= (and d!141115 (not c!124506)) b!1299450))

(assert (= (and d!141115 (not res!863536)) b!1299451))

(declare-fun m!1190627 () Bool)

(assert (=> d!141115 m!1190627))

(declare-fun m!1190629 () Bool)

(assert (=> b!1299449 m!1190629))

(declare-fun m!1190631 () Bool)

(assert (=> b!1299449 m!1190631))

(assert (=> b!1299449 m!1190631))

(declare-fun m!1190633 () Bool)

(assert (=> b!1299449 m!1190633))

(assert (=> b!1299451 m!1190631))

(assert (=> b!1299451 m!1190631))

(assert (=> b!1299451 m!1190633))

(assert (=> b!1299301 d!141115))

(declare-fun d!141117 () Bool)

(declare-fun e!741333 () Bool)

(assert (=> d!141117 e!741333))

(declare-fun res!863541 () Bool)

(assert (=> d!141117 (=> (not res!863541) (not e!741333))))

(declare-fun lt!581066 () ListLongMap!20185)

(assert (=> d!141117 (= res!863541 (contains!8228 lt!581066 (_1!11275 (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!581065 () List!29659)

(assert (=> d!141117 (= lt!581066 (ListLongMap!20186 lt!581065))))

(declare-fun lt!581063 () Unit!43021)

(declare-fun lt!581064 () Unit!43021)

(assert (=> d!141117 (= lt!581063 lt!581064)))

(assert (=> d!141117 (= (getValueByKey!697 lt!581065 (_1!11275 (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!748 (_2!11275 (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!343 (List!29659 (_ BitVec 64) V!51483) Unit!43021)

(assert (=> d!141117 (= lt!581064 (lemmaContainsTupThenGetReturnValue!343 lt!581065 (_1!11275 (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11275 (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!472 (List!29659 (_ BitVec 64) V!51483) List!29659)

(assert (=> d!141117 (= lt!581065 (insertStrictlySorted!472 (toList!10108 (+!4441 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (_1!11275 (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11275 (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141117 (= (+!4441 (+!4441 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!581066)))

(declare-fun b!1299456 () Bool)

(declare-fun res!863542 () Bool)

(assert (=> b!1299456 (=> (not res!863542) (not e!741333))))

(assert (=> b!1299456 (= res!863542 (= (getValueByKey!697 (toList!10108 lt!581066) (_1!11275 (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!748 (_2!11275 (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1299457 () Bool)

(declare-fun contains!8230 (List!29659 tuple2!22528) Bool)

(assert (=> b!1299457 (= e!741333 (contains!8230 (toList!10108 lt!581066) (tuple2!22529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141117 res!863541) b!1299456))

(assert (= (and b!1299456 res!863542) b!1299457))

(declare-fun m!1190635 () Bool)

(assert (=> d!141117 m!1190635))

(declare-fun m!1190637 () Bool)

(assert (=> d!141117 m!1190637))

(declare-fun m!1190639 () Bool)

(assert (=> d!141117 m!1190639))

(declare-fun m!1190641 () Bool)

(assert (=> d!141117 m!1190641))

(declare-fun m!1190643 () Bool)

(assert (=> b!1299456 m!1190643))

(declare-fun m!1190645 () Bool)

(assert (=> b!1299457 m!1190645))

(assert (=> b!1299301 d!141117))

(declare-fun d!141119 () Bool)

(declare-fun e!741334 () Bool)

(assert (=> d!141119 e!741334))

(declare-fun res!863543 () Bool)

(assert (=> d!141119 (=> (not res!863543) (not e!741334))))

(declare-fun lt!581070 () ListLongMap!20185)

(assert (=> d!141119 (= res!863543 (contains!8228 lt!581070 (_1!11275 (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!581069 () List!29659)

(assert (=> d!141119 (= lt!581070 (ListLongMap!20186 lt!581069))))

(declare-fun lt!581067 () Unit!43021)

(declare-fun lt!581068 () Unit!43021)

(assert (=> d!141119 (= lt!581067 lt!581068)))

(assert (=> d!141119 (= (getValueByKey!697 lt!581069 (_1!11275 (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!748 (_2!11275 (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141119 (= lt!581068 (lemmaContainsTupThenGetReturnValue!343 lt!581069 (_1!11275 (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11275 (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141119 (= lt!581069 (insertStrictlySorted!472 (toList!10108 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) (_1!11275 (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11275 (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141119 (= (+!4441 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!581070)))

(declare-fun b!1299458 () Bool)

(declare-fun res!863544 () Bool)

(assert (=> b!1299458 (=> (not res!863544) (not e!741334))))

(assert (=> b!1299458 (= res!863544 (= (getValueByKey!697 (toList!10108 lt!581070) (_1!11275 (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!748 (_2!11275 (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1299459 () Bool)

(assert (=> b!1299459 (= e!741334 (contains!8230 (toList!10108 lt!581070) (tuple2!22529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141119 res!863543) b!1299458))

(assert (= (and b!1299458 res!863544) b!1299459))

(declare-fun m!1190647 () Bool)

(assert (=> d!141119 m!1190647))

(declare-fun m!1190649 () Bool)

(assert (=> d!141119 m!1190649))

(declare-fun m!1190651 () Bool)

(assert (=> d!141119 m!1190651))

(declare-fun m!1190653 () Bool)

(assert (=> d!141119 m!1190653))

(declare-fun m!1190655 () Bool)

(assert (=> b!1299458 m!1190655))

(declare-fun m!1190657 () Bool)

(assert (=> b!1299459 m!1190657))

(assert (=> b!1299301 d!141119))

(declare-fun b!1299484 () Bool)

(declare-fun e!741355 () Bool)

(declare-fun e!741349 () Bool)

(assert (=> b!1299484 (= e!741355 e!741349)))

(declare-fun c!124517 () Bool)

(assert (=> b!1299484 (= c!124517 (bvslt from!2144 (size!42337 _keys!1741)))))

(declare-fun b!1299485 () Bool)

(declare-fun res!863555 () Bool)

(declare-fun e!741352 () Bool)

(assert (=> b!1299485 (=> (not res!863555) (not e!741352))))

(declare-fun lt!581087 () ListLongMap!20185)

(assert (=> b!1299485 (= res!863555 (not (contains!8228 lt!581087 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1299486 () Bool)

(assert (=> b!1299486 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42337 _keys!1741)))))

(assert (=> b!1299486 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42338 _values!1445)))))

(declare-fun e!741353 () Bool)

(assert (=> b!1299486 (= e!741353 (= (apply!1014 lt!581087 (select (arr!41787 _keys!1741) from!2144)) (get!21107 (select (arr!41788 _values!1445) from!2144) (dynLambda!3418 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1299487 () Bool)

(declare-fun e!741351 () ListLongMap!20185)

(declare-fun e!741354 () ListLongMap!20185)

(assert (=> b!1299487 (= e!741351 e!741354)))

(declare-fun c!124518 () Bool)

(assert (=> b!1299487 (= c!124518 (validKeyInArray!0 (select (arr!41787 _keys!1741) from!2144)))))

(declare-fun d!141121 () Bool)

(assert (=> d!141121 e!741352))

(declare-fun res!863553 () Bool)

(assert (=> d!141121 (=> (not res!863553) (not e!741352))))

(assert (=> d!141121 (= res!863553 (not (contains!8228 lt!581087 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141121 (= lt!581087 e!741351)))

(declare-fun c!124516 () Bool)

(assert (=> d!141121 (= c!124516 (bvsge from!2144 (size!42337 _keys!1741)))))

(assert (=> d!141121 (validMask!0 mask!2175)))

(assert (=> d!141121 (= (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581087)))

(declare-fun b!1299488 () Bool)

(declare-fun isEmpty!1050 (ListLongMap!20185) Bool)

(assert (=> b!1299488 (= e!741349 (isEmpty!1050 lt!581087))))

(declare-fun b!1299489 () Bool)

(declare-fun e!741350 () Bool)

(assert (=> b!1299489 (= e!741350 (validKeyInArray!0 (select (arr!41787 _keys!1741) from!2144)))))

(assert (=> b!1299489 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1299490 () Bool)

(assert (=> b!1299490 (= e!741355 e!741353)))

(assert (=> b!1299490 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42337 _keys!1741)))))

(declare-fun res!863556 () Bool)

(assert (=> b!1299490 (= res!863556 (contains!8228 lt!581087 (select (arr!41787 _keys!1741) from!2144)))))

(assert (=> b!1299490 (=> (not res!863556) (not e!741353))))

(declare-fun b!1299491 () Bool)

(declare-fun lt!581088 () Unit!43021)

(declare-fun lt!581085 () Unit!43021)

(assert (=> b!1299491 (= lt!581088 lt!581085)))

(declare-fun lt!581089 () ListLongMap!20185)

(declare-fun lt!581091 () (_ BitVec 64))

(declare-fun lt!581086 () V!51483)

(declare-fun lt!581090 () (_ BitVec 64))

(assert (=> b!1299491 (not (contains!8228 (+!4441 lt!581089 (tuple2!22529 lt!581090 lt!581086)) lt!581091))))

(declare-fun addStillNotContains!456 (ListLongMap!20185 (_ BitVec 64) V!51483 (_ BitVec 64)) Unit!43021)

(assert (=> b!1299491 (= lt!581085 (addStillNotContains!456 lt!581089 lt!581090 lt!581086 lt!581091))))

(assert (=> b!1299491 (= lt!581091 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1299491 (= lt!581086 (get!21107 (select (arr!41788 _values!1445) from!2144) (dynLambda!3418 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1299491 (= lt!581090 (select (arr!41787 _keys!1741) from!2144))))

(declare-fun call!63600 () ListLongMap!20185)

(assert (=> b!1299491 (= lt!581089 call!63600)))

(assert (=> b!1299491 (= e!741354 (+!4441 call!63600 (tuple2!22529 (select (arr!41787 _keys!1741) from!2144) (get!21107 (select (arr!41788 _values!1445) from!2144) (dynLambda!3418 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!63597 () Bool)

(assert (=> bm!63597 (= call!63600 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1299492 () Bool)

(assert (=> b!1299492 (= e!741354 call!63600)))

(declare-fun b!1299493 () Bool)

(assert (=> b!1299493 (= e!741352 e!741355)))

(declare-fun c!124515 () Bool)

(assert (=> b!1299493 (= c!124515 e!741350)))

(declare-fun res!863554 () Bool)

(assert (=> b!1299493 (=> (not res!863554) (not e!741350))))

(assert (=> b!1299493 (= res!863554 (bvslt from!2144 (size!42337 _keys!1741)))))

(declare-fun b!1299494 () Bool)

(assert (=> b!1299494 (= e!741349 (= lt!581087 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1299495 () Bool)

(assert (=> b!1299495 (= e!741351 (ListLongMap!20186 Nil!29656))))

(assert (= (and d!141121 c!124516) b!1299495))

(assert (= (and d!141121 (not c!124516)) b!1299487))

(assert (= (and b!1299487 c!124518) b!1299491))

(assert (= (and b!1299487 (not c!124518)) b!1299492))

(assert (= (or b!1299491 b!1299492) bm!63597))

(assert (= (and d!141121 res!863553) b!1299485))

(assert (= (and b!1299485 res!863555) b!1299493))

(assert (= (and b!1299493 res!863554) b!1299489))

(assert (= (and b!1299493 c!124515) b!1299490))

(assert (= (and b!1299493 (not c!124515)) b!1299484))

(assert (= (and b!1299490 res!863556) b!1299486))

(assert (= (and b!1299484 c!124517) b!1299494))

(assert (= (and b!1299484 (not c!124517)) b!1299488))

(declare-fun b_lambda!23151 () Bool)

(assert (=> (not b_lambda!23151) (not b!1299486)))

(assert (=> b!1299486 t!43230))

(declare-fun b_and!47247 () Bool)

(assert (= b_and!47245 (and (=> t!43230 result!23751) b_and!47247)))

(declare-fun b_lambda!23153 () Bool)

(assert (=> (not b_lambda!23153) (not b!1299491)))

(assert (=> b!1299491 t!43230))

(declare-fun b_and!47249 () Bool)

(assert (= b_and!47247 (and (=> t!43230 result!23751) b_and!47249)))

(assert (=> b!1299491 m!1190583))

(assert (=> b!1299491 m!1190581))

(assert (=> b!1299491 m!1190585))

(declare-fun m!1190659 () Bool)

(assert (=> b!1299491 m!1190659))

(assert (=> b!1299491 m!1190581))

(declare-fun m!1190661 () Bool)

(assert (=> b!1299491 m!1190661))

(assert (=> b!1299491 m!1190511))

(declare-fun m!1190663 () Bool)

(assert (=> b!1299491 m!1190663))

(assert (=> b!1299491 m!1190583))

(assert (=> b!1299491 m!1190661))

(declare-fun m!1190665 () Bool)

(assert (=> b!1299491 m!1190665))

(assert (=> b!1299489 m!1190511))

(assert (=> b!1299489 m!1190511))

(assert (=> b!1299489 m!1190513))

(assert (=> b!1299486 m!1190583))

(assert (=> b!1299486 m!1190581))

(assert (=> b!1299486 m!1190585))

(assert (=> b!1299486 m!1190581))

(assert (=> b!1299486 m!1190583))

(assert (=> b!1299486 m!1190511))

(assert (=> b!1299486 m!1190511))

(declare-fun m!1190667 () Bool)

(assert (=> b!1299486 m!1190667))

(declare-fun m!1190669 () Bool)

(assert (=> bm!63597 m!1190669))

(assert (=> b!1299494 m!1190669))

(declare-fun m!1190671 () Bool)

(assert (=> b!1299485 m!1190671))

(assert (=> b!1299490 m!1190511))

(assert (=> b!1299490 m!1190511))

(declare-fun m!1190673 () Bool)

(assert (=> b!1299490 m!1190673))

(assert (=> b!1299487 m!1190511))

(assert (=> b!1299487 m!1190511))

(assert (=> b!1299487 m!1190513))

(declare-fun m!1190675 () Bool)

(assert (=> b!1299488 m!1190675))

(declare-fun m!1190677 () Bool)

(assert (=> d!141121 m!1190677))

(assert (=> d!141121 m!1190503))

(assert (=> b!1299301 d!141121))

(declare-fun b!1299503 () Bool)

(declare-fun e!741361 () Bool)

(assert (=> b!1299503 (= e!741361 tp_is_empty!34785)))

(declare-fun b!1299502 () Bool)

(declare-fun e!741360 () Bool)

(assert (=> b!1299502 (= e!741360 tp_is_empty!34785)))

(declare-fun mapIsEmpty!53750 () Bool)

(declare-fun mapRes!53750 () Bool)

(assert (=> mapIsEmpty!53750 mapRes!53750))

(declare-fun condMapEmpty!53750 () Bool)

(declare-fun mapDefault!53750 () ValueCell!16494)

(assert (=> mapNonEmpty!53744 (= condMapEmpty!53750 (= mapRest!53744 ((as const (Array (_ BitVec 32) ValueCell!16494)) mapDefault!53750)))))

(assert (=> mapNonEmpty!53744 (= tp!102560 (and e!741361 mapRes!53750))))

(declare-fun mapNonEmpty!53750 () Bool)

(declare-fun tp!102569 () Bool)

(assert (=> mapNonEmpty!53750 (= mapRes!53750 (and tp!102569 e!741360))))

(declare-fun mapValue!53750 () ValueCell!16494)

(declare-fun mapRest!53750 () (Array (_ BitVec 32) ValueCell!16494))

(declare-fun mapKey!53750 () (_ BitVec 32))

(assert (=> mapNonEmpty!53750 (= mapRest!53744 (store mapRest!53750 mapKey!53750 mapValue!53750))))

(assert (= (and mapNonEmpty!53744 condMapEmpty!53750) mapIsEmpty!53750))

(assert (= (and mapNonEmpty!53744 (not condMapEmpty!53750)) mapNonEmpty!53750))

(assert (= (and mapNonEmpty!53750 ((_ is ValueCellFull!16494) mapValue!53750)) b!1299502))

(assert (= (and mapNonEmpty!53744 ((_ is ValueCellFull!16494) mapDefault!53750)) b!1299503))

(declare-fun m!1190679 () Bool)

(assert (=> mapNonEmpty!53750 m!1190679))

(declare-fun b_lambda!23155 () Bool)

(assert (= b_lambda!23151 (or (and start!109692 b_free!29145) b_lambda!23155)))

(declare-fun b_lambda!23157 () Bool)

(assert (= b_lambda!23153 (or (and start!109692 b_free!29145) b_lambda!23157)))

(declare-fun b_lambda!23159 () Bool)

(assert (= b_lambda!23149 (or (and start!109692 b_free!29145) b_lambda!23159)))

(check-sat (not b!1299485) (not b!1299447) (not b!1299446) tp_is_empty!34785 (not b!1299426) (not b!1299486) (not d!141119) (not b!1299431) (not b!1299357) (not b_lambda!23159) (not b_next!29145) (not b!1299494) (not b!1299422) (not b!1299457) (not bm!63587) (not b!1299424) (not b!1299490) (not bm!63570) (not d!141121) (not bm!63594) (not d!141111) (not b_lambda!23157) (not bm!63589) (not bm!63586) (not b!1299449) (not d!141109) (not b!1299491) (not b!1299459) b_and!47249 (not b!1299417) (not b!1299368) (not b!1299487) (not b!1299489) (not b!1299488) (not b!1299411) (not b!1299359) (not bm!63597) (not b!1299445) (not b!1299456) (not b!1299458) (not d!141117) (not b_lambda!23155) (not b!1299412) (not d!141115) (not bm!63591) (not b!1299418) (not b!1299366) (not b!1299451) (not mapNonEmpty!53750))
(check-sat b_and!47249 (not b_next!29145))
