; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110246 () Bool)

(assert start!110246)

(declare-fun b_free!29245 () Bool)

(declare-fun b_next!29245 () Bool)

(assert (=> start!110246 (= b_free!29245 (not b_next!29245))))

(declare-fun tp!102882 () Bool)

(declare-fun b_and!47405 () Bool)

(assert (=> start!110246 (= tp!102882 b_and!47405)))

(declare-fun b!1304281 () Bool)

(declare-fun res!865952 () Bool)

(declare-fun e!744062 () Bool)

(assert (=> b!1304281 (=> (not res!865952) (not e!744062))))

(declare-datatypes ((array!86823 0))(
  ( (array!86824 (arr!41899 (Array (_ BitVec 32) (_ BitVec 64))) (size!42450 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86823)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304281 (= res!865952 (not (validKeyInArray!0 (select (arr!41899 _keys!1741) from!2144))))))

(declare-fun b!1304282 () Bool)

(declare-fun res!865948 () Bool)

(assert (=> b!1304282 (=> (not res!865948) (not e!744062))))

(declare-datatypes ((V!51617 0))(
  ( (V!51618 (val!17517 Int)) )
))
(declare-fun minValue!1387 () V!51617)

(declare-fun zeroValue!1387 () V!51617)

(declare-datatypes ((ValueCell!16544 0))(
  ( (ValueCellFull!16544 (v!20127 V!51617)) (EmptyCell!16544) )
))
(declare-datatypes ((array!86825 0))(
  ( (array!86826 (arr!41900 (Array (_ BitVec 32) ValueCell!16544)) (size!42451 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86825)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22622 0))(
  ( (tuple2!22623 (_1!11322 (_ BitVec 64)) (_2!11322 V!51617)) )
))
(declare-datatypes ((List!29771 0))(
  ( (Nil!29768) (Cons!29767 (h!30985 tuple2!22622) (t!43355 List!29771)) )
))
(declare-datatypes ((ListLongMap!20287 0))(
  ( (ListLongMap!20288 (toList!10159 List!29771)) )
))
(declare-fun contains!8305 (ListLongMap!20287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5171 (array!86823 array!86825 (_ BitVec 32) (_ BitVec 32) V!51617 V!51617 (_ BitVec 32) Int) ListLongMap!20287)

(assert (=> b!1304282 (= res!865948 (contains!8305 (getCurrentListMap!5171 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun lt!583461 () tuple2!22622)

(declare-fun lt!583465 () ListLongMap!20287)

(declare-fun b!1304283 () Bool)

(declare-fun e!744060 () Bool)

(declare-fun +!4522 (ListLongMap!20287 tuple2!22622) ListLongMap!20287)

(assert (=> b!1304283 (= e!744060 (contains!8305 (+!4522 lt!583465 lt!583461) k0!1205))))

(declare-fun lt!583462 () ListLongMap!20287)

(assert (=> b!1304283 (not (contains!8305 (+!4522 lt!583462 lt!583461) k0!1205))))

(assert (=> b!1304283 (= lt!583461 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-datatypes ((Unit!43106 0))(
  ( (Unit!43107) )
))
(declare-fun lt!583464 () Unit!43106)

(declare-fun addStillNotContains!473 (ListLongMap!20287 (_ BitVec 64) V!51617 (_ BitVec 64)) Unit!43106)

(assert (=> b!1304283 (= lt!583464 (addStillNotContains!473 lt!583462 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1304283 (not (contains!8305 lt!583465 k0!1205))))

(assert (=> b!1304283 (= lt!583465 (+!4522 lt!583462 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583460 () Unit!43106)

(assert (=> b!1304283 (= lt!583460 (addStillNotContains!473 lt!583462 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6160 (array!86823 array!86825 (_ BitVec 32) (_ BitVec 32) V!51617 V!51617 (_ BitVec 32) Int) ListLongMap!20287)

(assert (=> b!1304283 (= lt!583462 (getCurrentListMapNoExtraKeys!6160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53917 () Bool)

(declare-fun mapRes!53917 () Bool)

(declare-fun tp!102883 () Bool)

(declare-fun e!744065 () Bool)

(assert (=> mapNonEmpty!53917 (= mapRes!53917 (and tp!102883 e!744065))))

(declare-fun mapValue!53917 () ValueCell!16544)

(declare-fun mapRest!53917 () (Array (_ BitVec 32) ValueCell!16544))

(declare-fun mapKey!53917 () (_ BitVec 32))

(assert (=> mapNonEmpty!53917 (= (arr!41900 _values!1445) (store mapRest!53917 mapKey!53917 mapValue!53917))))

(declare-fun b!1304284 () Bool)

(assert (=> b!1304284 (= e!744062 (not e!744060))))

(declare-fun res!865950 () Bool)

(assert (=> b!1304284 (=> res!865950 e!744060)))

(assert (=> b!1304284 (= res!865950 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1304284 (not (contains!8305 (ListLongMap!20288 Nil!29768) k0!1205))))

(declare-fun lt!583463 () Unit!43106)

(declare-fun emptyContainsNothing!214 ((_ BitVec 64)) Unit!43106)

(assert (=> b!1304284 (= lt!583463 (emptyContainsNothing!214 k0!1205))))

(declare-fun b!1304285 () Bool)

(declare-fun res!865949 () Bool)

(assert (=> b!1304285 (=> (not res!865949) (not e!744062))))

(assert (=> b!1304285 (= res!865949 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42450 _keys!1741))))))

(declare-fun b!1304286 () Bool)

(declare-fun e!744064 () Bool)

(declare-fun tp_is_empty!34885 () Bool)

(assert (=> b!1304286 (= e!744064 tp_is_empty!34885)))

(declare-fun b!1304287 () Bool)

(assert (=> b!1304287 (= e!744065 tp_is_empty!34885)))

(declare-fun b!1304288 () Bool)

(declare-fun res!865953 () Bool)

(assert (=> b!1304288 (=> (not res!865953) (not e!744062))))

(declare-datatypes ((List!29772 0))(
  ( (Nil!29769) (Cons!29768 (h!30986 (_ BitVec 64)) (t!43356 List!29772)) )
))
(declare-fun arrayNoDuplicates!0 (array!86823 (_ BitVec 32) List!29772) Bool)

(assert (=> b!1304288 (= res!865953 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29769))))

(declare-fun b!1304289 () Bool)

(declare-fun res!865955 () Bool)

(assert (=> b!1304289 (=> (not res!865955) (not e!744062))))

(assert (=> b!1304289 (= res!865955 (and (= (size!42451 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42450 _keys!1741) (size!42451 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!865947 () Bool)

(assert (=> start!110246 (=> (not res!865947) (not e!744062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110246 (= res!865947 (validMask!0 mask!2175))))

(assert (=> start!110246 e!744062))

(assert (=> start!110246 tp_is_empty!34885))

(assert (=> start!110246 true))

(declare-fun e!744063 () Bool)

(declare-fun array_inv!31939 (array!86825) Bool)

(assert (=> start!110246 (and (array_inv!31939 _values!1445) e!744063)))

(declare-fun array_inv!31940 (array!86823) Bool)

(assert (=> start!110246 (array_inv!31940 _keys!1741)))

(assert (=> start!110246 tp!102882))

(declare-fun b!1304290 () Bool)

(assert (=> b!1304290 (= e!744063 (and e!744064 mapRes!53917))))

(declare-fun condMapEmpty!53917 () Bool)

(declare-fun mapDefault!53917 () ValueCell!16544)

(assert (=> b!1304290 (= condMapEmpty!53917 (= (arr!41900 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16544)) mapDefault!53917)))))

(declare-fun b!1304291 () Bool)

(declare-fun res!865954 () Bool)

(assert (=> b!1304291 (=> (not res!865954) (not e!744062))))

(assert (=> b!1304291 (= res!865954 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42450 _keys!1741))))))

(declare-fun b!1304292 () Bool)

(declare-fun res!865951 () Bool)

(assert (=> b!1304292 (=> (not res!865951) (not e!744062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86823 (_ BitVec 32)) Bool)

(assert (=> b!1304292 (= res!865951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53917 () Bool)

(assert (=> mapIsEmpty!53917 mapRes!53917))

(assert (= (and start!110246 res!865947) b!1304289))

(assert (= (and b!1304289 res!865955) b!1304292))

(assert (= (and b!1304292 res!865951) b!1304288))

(assert (= (and b!1304288 res!865953) b!1304291))

(assert (= (and b!1304291 res!865954) b!1304282))

(assert (= (and b!1304282 res!865948) b!1304285))

(assert (= (and b!1304285 res!865949) b!1304281))

(assert (= (and b!1304281 res!865952) b!1304284))

(assert (= (and b!1304284 (not res!865950)) b!1304283))

(assert (= (and b!1304290 condMapEmpty!53917) mapIsEmpty!53917))

(assert (= (and b!1304290 (not condMapEmpty!53917)) mapNonEmpty!53917))

(get-info :version)

(assert (= (and mapNonEmpty!53917 ((_ is ValueCellFull!16544) mapValue!53917)) b!1304287))

(assert (= (and b!1304290 ((_ is ValueCellFull!16544) mapDefault!53917)) b!1304286))

(assert (= start!110246 b!1304290))

(declare-fun m!1195437 () Bool)

(assert (=> start!110246 m!1195437))

(declare-fun m!1195439 () Bool)

(assert (=> start!110246 m!1195439))

(declare-fun m!1195441 () Bool)

(assert (=> start!110246 m!1195441))

(declare-fun m!1195443 () Bool)

(assert (=> b!1304282 m!1195443))

(assert (=> b!1304282 m!1195443))

(declare-fun m!1195445 () Bool)

(assert (=> b!1304282 m!1195445))

(declare-fun m!1195447 () Bool)

(assert (=> b!1304292 m!1195447))

(declare-fun m!1195449 () Bool)

(assert (=> b!1304288 m!1195449))

(declare-fun m!1195451 () Bool)

(assert (=> b!1304284 m!1195451))

(declare-fun m!1195453 () Bool)

(assert (=> b!1304284 m!1195453))

(declare-fun m!1195455 () Bool)

(assert (=> b!1304283 m!1195455))

(declare-fun m!1195457 () Bool)

(assert (=> b!1304283 m!1195457))

(declare-fun m!1195459 () Bool)

(assert (=> b!1304283 m!1195459))

(assert (=> b!1304283 m!1195457))

(declare-fun m!1195461 () Bool)

(assert (=> b!1304283 m!1195461))

(declare-fun m!1195463 () Bool)

(assert (=> b!1304283 m!1195463))

(declare-fun m!1195465 () Bool)

(assert (=> b!1304283 m!1195465))

(declare-fun m!1195467 () Bool)

(assert (=> b!1304283 m!1195467))

(declare-fun m!1195469 () Bool)

(assert (=> b!1304283 m!1195469))

(assert (=> b!1304283 m!1195463))

(declare-fun m!1195471 () Bool)

(assert (=> b!1304283 m!1195471))

(declare-fun m!1195473 () Bool)

(assert (=> b!1304281 m!1195473))

(assert (=> b!1304281 m!1195473))

(declare-fun m!1195475 () Bool)

(assert (=> b!1304281 m!1195475))

(declare-fun m!1195477 () Bool)

(assert (=> mapNonEmpty!53917 m!1195477))

(check-sat b_and!47405 (not b!1304284) (not b_next!29245) (not b!1304288) tp_is_empty!34885 (not b!1304281) (not b!1304282) (not start!110246) (not b!1304283) (not mapNonEmpty!53917) (not b!1304292))
(check-sat b_and!47405 (not b_next!29245))
(get-model)

(declare-fun d!142047 () Bool)

(assert (=> d!142047 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110246 d!142047))

(declare-fun d!142049 () Bool)

(assert (=> d!142049 (= (array_inv!31939 _values!1445) (bvsge (size!42451 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110246 d!142049))

(declare-fun d!142051 () Bool)

(assert (=> d!142051 (= (array_inv!31940 _keys!1741) (bvsge (size!42450 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110246 d!142051))

(declare-fun d!142053 () Bool)

(declare-fun e!744106 () Bool)

(assert (=> d!142053 e!744106))

(declare-fun res!866012 () Bool)

(assert (=> d!142053 (=> res!866012 e!744106)))

(declare-fun lt!583511 () Bool)

(assert (=> d!142053 (= res!866012 (not lt!583511))))

(declare-fun lt!583512 () Bool)

(assert (=> d!142053 (= lt!583511 lt!583512)))

(declare-fun lt!583513 () Unit!43106)

(declare-fun e!744107 () Unit!43106)

(assert (=> d!142053 (= lt!583513 e!744107)))

(declare-fun c!125462 () Bool)

(assert (=> d!142053 (= c!125462 lt!583512)))

(declare-fun containsKey!726 (List!29771 (_ BitVec 64)) Bool)

(assert (=> d!142053 (= lt!583512 (containsKey!726 (toList!10159 (ListLongMap!20288 Nil!29768)) k0!1205))))

(assert (=> d!142053 (= (contains!8305 (ListLongMap!20288 Nil!29768) k0!1205) lt!583511)))

(declare-fun b!1304371 () Bool)

(declare-fun lt!583510 () Unit!43106)

(assert (=> b!1304371 (= e!744107 lt!583510)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!472 (List!29771 (_ BitVec 64)) Unit!43106)

(assert (=> b!1304371 (= lt!583510 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10159 (ListLongMap!20288 Nil!29768)) k0!1205))))

(declare-datatypes ((Option!751 0))(
  ( (Some!750 (v!20130 V!51617)) (None!749) )
))
(declare-fun isDefined!509 (Option!751) Bool)

(declare-fun getValueByKey!700 (List!29771 (_ BitVec 64)) Option!751)

(assert (=> b!1304371 (isDefined!509 (getValueByKey!700 (toList!10159 (ListLongMap!20288 Nil!29768)) k0!1205))))

(declare-fun b!1304372 () Bool)

(declare-fun Unit!43112 () Unit!43106)

(assert (=> b!1304372 (= e!744107 Unit!43112)))

(declare-fun b!1304373 () Bool)

(assert (=> b!1304373 (= e!744106 (isDefined!509 (getValueByKey!700 (toList!10159 (ListLongMap!20288 Nil!29768)) k0!1205)))))

(assert (= (and d!142053 c!125462) b!1304371))

(assert (= (and d!142053 (not c!125462)) b!1304372))

(assert (= (and d!142053 (not res!866012)) b!1304373))

(declare-fun m!1195563 () Bool)

(assert (=> d!142053 m!1195563))

(declare-fun m!1195565 () Bool)

(assert (=> b!1304371 m!1195565))

(declare-fun m!1195567 () Bool)

(assert (=> b!1304371 m!1195567))

(assert (=> b!1304371 m!1195567))

(declare-fun m!1195569 () Bool)

(assert (=> b!1304371 m!1195569))

(assert (=> b!1304373 m!1195567))

(assert (=> b!1304373 m!1195567))

(assert (=> b!1304373 m!1195569))

(assert (=> b!1304284 d!142053))

(declare-fun d!142055 () Bool)

(assert (=> d!142055 (not (contains!8305 (ListLongMap!20288 Nil!29768) k0!1205))))

(declare-fun lt!583516 () Unit!43106)

(declare-fun choose!1922 ((_ BitVec 64)) Unit!43106)

(assert (=> d!142055 (= lt!583516 (choose!1922 k0!1205))))

(assert (=> d!142055 (= (emptyContainsNothing!214 k0!1205) lt!583516)))

(declare-fun bs!37127 () Bool)

(assert (= bs!37127 d!142055))

(assert (=> bs!37127 m!1195451))

(declare-fun m!1195571 () Bool)

(assert (=> bs!37127 m!1195571))

(assert (=> b!1304284 d!142055))

(declare-fun d!142057 () Bool)

(declare-fun e!744110 () Bool)

(assert (=> d!142057 e!744110))

(declare-fun res!866017 () Bool)

(assert (=> d!142057 (=> (not res!866017) (not e!744110))))

(declare-fun lt!583526 () ListLongMap!20287)

(assert (=> d!142057 (= res!866017 (contains!8305 lt!583526 (_1!11322 lt!583461)))))

(declare-fun lt!583528 () List!29771)

(assert (=> d!142057 (= lt!583526 (ListLongMap!20288 lt!583528))))

(declare-fun lt!583525 () Unit!43106)

(declare-fun lt!583527 () Unit!43106)

(assert (=> d!142057 (= lt!583525 lt!583527)))

(assert (=> d!142057 (= (getValueByKey!700 lt!583528 (_1!11322 lt!583461)) (Some!750 (_2!11322 lt!583461)))))

(declare-fun lemmaContainsTupThenGetReturnValue!351 (List!29771 (_ BitVec 64) V!51617) Unit!43106)

(assert (=> d!142057 (= lt!583527 (lemmaContainsTupThenGetReturnValue!351 lt!583528 (_1!11322 lt!583461) (_2!11322 lt!583461)))))

(declare-fun insertStrictlySorted!480 (List!29771 (_ BitVec 64) V!51617) List!29771)

(assert (=> d!142057 (= lt!583528 (insertStrictlySorted!480 (toList!10159 lt!583465) (_1!11322 lt!583461) (_2!11322 lt!583461)))))

(assert (=> d!142057 (= (+!4522 lt!583465 lt!583461) lt!583526)))

(declare-fun b!1304378 () Bool)

(declare-fun res!866018 () Bool)

(assert (=> b!1304378 (=> (not res!866018) (not e!744110))))

(assert (=> b!1304378 (= res!866018 (= (getValueByKey!700 (toList!10159 lt!583526) (_1!11322 lt!583461)) (Some!750 (_2!11322 lt!583461))))))

(declare-fun b!1304379 () Bool)

(declare-fun contains!8308 (List!29771 tuple2!22622) Bool)

(assert (=> b!1304379 (= e!744110 (contains!8308 (toList!10159 lt!583526) lt!583461))))

(assert (= (and d!142057 res!866017) b!1304378))

(assert (= (and b!1304378 res!866018) b!1304379))

(declare-fun m!1195573 () Bool)

(assert (=> d!142057 m!1195573))

(declare-fun m!1195575 () Bool)

(assert (=> d!142057 m!1195575))

(declare-fun m!1195577 () Bool)

(assert (=> d!142057 m!1195577))

(declare-fun m!1195579 () Bool)

(assert (=> d!142057 m!1195579))

(declare-fun m!1195581 () Bool)

(assert (=> b!1304378 m!1195581))

(declare-fun m!1195583 () Bool)

(assert (=> b!1304379 m!1195583))

(assert (=> b!1304283 d!142057))

(declare-fun d!142059 () Bool)

(declare-fun e!744111 () Bool)

(assert (=> d!142059 e!744111))

(declare-fun res!866019 () Bool)

(assert (=> d!142059 (=> res!866019 e!744111)))

(declare-fun lt!583530 () Bool)

(assert (=> d!142059 (= res!866019 (not lt!583530))))

(declare-fun lt!583531 () Bool)

(assert (=> d!142059 (= lt!583530 lt!583531)))

(declare-fun lt!583532 () Unit!43106)

(declare-fun e!744112 () Unit!43106)

(assert (=> d!142059 (= lt!583532 e!744112)))

(declare-fun c!125463 () Bool)

(assert (=> d!142059 (= c!125463 lt!583531)))

(assert (=> d!142059 (= lt!583531 (containsKey!726 (toList!10159 (+!4522 lt!583462 lt!583461)) k0!1205))))

(assert (=> d!142059 (= (contains!8305 (+!4522 lt!583462 lt!583461) k0!1205) lt!583530)))

(declare-fun b!1304380 () Bool)

(declare-fun lt!583529 () Unit!43106)

(assert (=> b!1304380 (= e!744112 lt!583529)))

(assert (=> b!1304380 (= lt!583529 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10159 (+!4522 lt!583462 lt!583461)) k0!1205))))

(assert (=> b!1304380 (isDefined!509 (getValueByKey!700 (toList!10159 (+!4522 lt!583462 lt!583461)) k0!1205))))

(declare-fun b!1304381 () Bool)

(declare-fun Unit!43113 () Unit!43106)

(assert (=> b!1304381 (= e!744112 Unit!43113)))

(declare-fun b!1304382 () Bool)

(assert (=> b!1304382 (= e!744111 (isDefined!509 (getValueByKey!700 (toList!10159 (+!4522 lt!583462 lt!583461)) k0!1205)))))

(assert (= (and d!142059 c!125463) b!1304380))

(assert (= (and d!142059 (not c!125463)) b!1304381))

(assert (= (and d!142059 (not res!866019)) b!1304382))

(declare-fun m!1195585 () Bool)

(assert (=> d!142059 m!1195585))

(declare-fun m!1195587 () Bool)

(assert (=> b!1304380 m!1195587))

(declare-fun m!1195589 () Bool)

(assert (=> b!1304380 m!1195589))

(assert (=> b!1304380 m!1195589))

(declare-fun m!1195591 () Bool)

(assert (=> b!1304380 m!1195591))

(assert (=> b!1304382 m!1195589))

(assert (=> b!1304382 m!1195589))

(assert (=> b!1304382 m!1195591))

(assert (=> b!1304283 d!142059))

(declare-fun d!142061 () Bool)

(assert (=> d!142061 (not (contains!8305 (+!4522 lt!583462 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!583535 () Unit!43106)

(declare-fun choose!1923 (ListLongMap!20287 (_ BitVec 64) V!51617 (_ BitVec 64)) Unit!43106)

(assert (=> d!142061 (= lt!583535 (choose!1923 lt!583462 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun e!744115 () Bool)

(assert (=> d!142061 e!744115))

(declare-fun res!866022 () Bool)

(assert (=> d!142061 (=> (not res!866022) (not e!744115))))

(assert (=> d!142061 (= res!866022 (not (contains!8305 lt!583462 k0!1205)))))

(assert (=> d!142061 (= (addStillNotContains!473 lt!583462 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) lt!583535)))

(declare-fun b!1304386 () Bool)

(assert (=> b!1304386 (= e!744115 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!142061 res!866022) b!1304386))

(assert (=> d!142061 m!1195469))

(assert (=> d!142061 m!1195469))

(declare-fun m!1195593 () Bool)

(assert (=> d!142061 m!1195593))

(declare-fun m!1195595 () Bool)

(assert (=> d!142061 m!1195595))

(declare-fun m!1195597 () Bool)

(assert (=> d!142061 m!1195597))

(assert (=> b!1304283 d!142061))

(declare-fun d!142063 () Bool)

(declare-fun e!744116 () Bool)

(assert (=> d!142063 e!744116))

(declare-fun res!866023 () Bool)

(assert (=> d!142063 (=> (not res!866023) (not e!744116))))

(declare-fun lt!583537 () ListLongMap!20287)

(assert (=> d!142063 (= res!866023 (contains!8305 lt!583537 (_1!11322 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!583539 () List!29771)

(assert (=> d!142063 (= lt!583537 (ListLongMap!20288 lt!583539))))

(declare-fun lt!583536 () Unit!43106)

(declare-fun lt!583538 () Unit!43106)

(assert (=> d!142063 (= lt!583536 lt!583538)))

(assert (=> d!142063 (= (getValueByKey!700 lt!583539 (_1!11322 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!750 (_2!11322 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142063 (= lt!583538 (lemmaContainsTupThenGetReturnValue!351 lt!583539 (_1!11322 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11322 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142063 (= lt!583539 (insertStrictlySorted!480 (toList!10159 lt!583462) (_1!11322 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11322 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142063 (= (+!4522 lt!583462 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!583537)))

(declare-fun b!1304387 () Bool)

(declare-fun res!866024 () Bool)

(assert (=> b!1304387 (=> (not res!866024) (not e!744116))))

(assert (=> b!1304387 (= res!866024 (= (getValueByKey!700 (toList!10159 lt!583537) (_1!11322 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!750 (_2!11322 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1304388 () Bool)

(assert (=> b!1304388 (= e!744116 (contains!8308 (toList!10159 lt!583537) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!142063 res!866023) b!1304387))

(assert (= (and b!1304387 res!866024) b!1304388))

(declare-fun m!1195599 () Bool)

(assert (=> d!142063 m!1195599))

(declare-fun m!1195601 () Bool)

(assert (=> d!142063 m!1195601))

(declare-fun m!1195603 () Bool)

(assert (=> d!142063 m!1195603))

(declare-fun m!1195605 () Bool)

(assert (=> d!142063 m!1195605))

(declare-fun m!1195607 () Bool)

(assert (=> b!1304387 m!1195607))

(declare-fun m!1195609 () Bool)

(assert (=> b!1304388 m!1195609))

(assert (=> b!1304283 d!142063))

(declare-fun b!1304413 () Bool)

(declare-fun lt!583557 () Unit!43106)

(declare-fun lt!583554 () Unit!43106)

(assert (=> b!1304413 (= lt!583557 lt!583554)))

(declare-fun lt!583558 () V!51617)

(declare-fun lt!583556 () (_ BitVec 64))

(declare-fun lt!583559 () (_ BitVec 64))

(declare-fun lt!583560 () ListLongMap!20287)

(assert (=> b!1304413 (not (contains!8305 (+!4522 lt!583560 (tuple2!22623 lt!583559 lt!583558)) lt!583556))))

(assert (=> b!1304413 (= lt!583554 (addStillNotContains!473 lt!583560 lt!583559 lt!583558 lt!583556))))

(assert (=> b!1304413 (= lt!583556 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21208 (ValueCell!16544 V!51617) V!51617)

(declare-fun dynLambda!3491 (Int (_ BitVec 64)) V!51617)

(assert (=> b!1304413 (= lt!583558 (get!21208 (select (arr!41900 _values!1445) from!2144) (dynLambda!3491 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1304413 (= lt!583559 (select (arr!41899 _keys!1741) from!2144))))

(declare-fun call!64244 () ListLongMap!20287)

(assert (=> b!1304413 (= lt!583560 call!64244)))

(declare-fun e!744136 () ListLongMap!20287)

(assert (=> b!1304413 (= e!744136 (+!4522 call!64244 (tuple2!22623 (select (arr!41899 _keys!1741) from!2144) (get!21208 (select (arr!41900 _values!1445) from!2144) (dynLambda!3491 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1304414 () Bool)

(declare-fun e!744133 () Bool)

(declare-fun e!744137 () Bool)

(assert (=> b!1304414 (= e!744133 e!744137)))

(assert (=> b!1304414 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42450 _keys!1741)))))

(declare-fun res!866035 () Bool)

(declare-fun lt!583555 () ListLongMap!20287)

(assert (=> b!1304414 (= res!866035 (contains!8305 lt!583555 (select (arr!41899 _keys!1741) from!2144)))))

(assert (=> b!1304414 (=> (not res!866035) (not e!744137))))

(declare-fun b!1304415 () Bool)

(declare-fun e!744132 () ListLongMap!20287)

(assert (=> b!1304415 (= e!744132 (ListLongMap!20288 Nil!29768))))

(declare-fun b!1304416 () Bool)

(declare-fun e!744134 () Bool)

(assert (=> b!1304416 (= e!744133 e!744134)))

(declare-fun c!125474 () Bool)

(assert (=> b!1304416 (= c!125474 (bvslt from!2144 (size!42450 _keys!1741)))))

(declare-fun b!1304417 () Bool)

(assert (=> b!1304417 (= e!744136 call!64244)))

(declare-fun b!1304418 () Bool)

(assert (=> b!1304418 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42450 _keys!1741)))))

(assert (=> b!1304418 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42451 _values!1445)))))

(declare-fun apply!1030 (ListLongMap!20287 (_ BitVec 64)) V!51617)

(assert (=> b!1304418 (= e!744137 (= (apply!1030 lt!583555 (select (arr!41899 _keys!1741) from!2144)) (get!21208 (select (arr!41900 _values!1445) from!2144) (dynLambda!3491 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!142065 () Bool)

(declare-fun e!744135 () Bool)

(assert (=> d!142065 e!744135))

(declare-fun res!866033 () Bool)

(assert (=> d!142065 (=> (not res!866033) (not e!744135))))

(assert (=> d!142065 (= res!866033 (not (contains!8305 lt!583555 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142065 (= lt!583555 e!744132)))

(declare-fun c!125472 () Bool)

(assert (=> d!142065 (= c!125472 (bvsge from!2144 (size!42450 _keys!1741)))))

(assert (=> d!142065 (validMask!0 mask!2175)))

(assert (=> d!142065 (= (getCurrentListMapNoExtraKeys!6160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583555)))

(declare-fun b!1304419 () Bool)

(assert (=> b!1304419 (= e!744134 (= lt!583555 (getCurrentListMapNoExtraKeys!6160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun bm!64241 () Bool)

(assert (=> bm!64241 (= call!64244 (getCurrentListMapNoExtraKeys!6160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1304420 () Bool)

(assert (=> b!1304420 (= e!744135 e!744133)))

(declare-fun c!125473 () Bool)

(declare-fun e!744131 () Bool)

(assert (=> b!1304420 (= c!125473 e!744131)))

(declare-fun res!866034 () Bool)

(assert (=> b!1304420 (=> (not res!866034) (not e!744131))))

(assert (=> b!1304420 (= res!866034 (bvslt from!2144 (size!42450 _keys!1741)))))

(declare-fun b!1304421 () Bool)

(declare-fun isEmpty!1065 (ListLongMap!20287) Bool)

(assert (=> b!1304421 (= e!744134 (isEmpty!1065 lt!583555))))

(declare-fun b!1304422 () Bool)

(assert (=> b!1304422 (= e!744132 e!744136)))

(declare-fun c!125475 () Bool)

(assert (=> b!1304422 (= c!125475 (validKeyInArray!0 (select (arr!41899 _keys!1741) from!2144)))))

(declare-fun b!1304423 () Bool)

(assert (=> b!1304423 (= e!744131 (validKeyInArray!0 (select (arr!41899 _keys!1741) from!2144)))))

(assert (=> b!1304423 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1304424 () Bool)

(declare-fun res!866036 () Bool)

(assert (=> b!1304424 (=> (not res!866036) (not e!744135))))

(assert (=> b!1304424 (= res!866036 (not (contains!8305 lt!583555 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142065 c!125472) b!1304415))

(assert (= (and d!142065 (not c!125472)) b!1304422))

(assert (= (and b!1304422 c!125475) b!1304413))

(assert (= (and b!1304422 (not c!125475)) b!1304417))

(assert (= (or b!1304413 b!1304417) bm!64241))

(assert (= (and d!142065 res!866033) b!1304424))

(assert (= (and b!1304424 res!866036) b!1304420))

(assert (= (and b!1304420 res!866034) b!1304423))

(assert (= (and b!1304420 c!125473) b!1304414))

(assert (= (and b!1304420 (not c!125473)) b!1304416))

(assert (= (and b!1304414 res!866035) b!1304418))

(assert (= (and b!1304416 c!125474) b!1304419))

(assert (= (and b!1304416 (not c!125474)) b!1304421))

(declare-fun b_lambda!23257 () Bool)

(assert (=> (not b_lambda!23257) (not b!1304413)))

(declare-fun t!43361 () Bool)

(declare-fun tb!11389 () Bool)

(assert (=> (and start!110246 (= defaultEntry!1448 defaultEntry!1448) t!43361) tb!11389))

(declare-fun result!23805 () Bool)

(assert (=> tb!11389 (= result!23805 tp_is_empty!34885)))

(assert (=> b!1304413 t!43361))

(declare-fun b_and!47411 () Bool)

(assert (= b_and!47405 (and (=> t!43361 result!23805) b_and!47411)))

(declare-fun b_lambda!23259 () Bool)

(assert (=> (not b_lambda!23259) (not b!1304418)))

(assert (=> b!1304418 t!43361))

(declare-fun b_and!47413 () Bool)

(assert (= b_and!47411 (and (=> t!43361 result!23805) b_and!47413)))

(declare-fun m!1195611 () Bool)

(assert (=> b!1304419 m!1195611))

(assert (=> bm!64241 m!1195611))

(assert (=> b!1304414 m!1195473))

(assert (=> b!1304414 m!1195473))

(declare-fun m!1195613 () Bool)

(assert (=> b!1304414 m!1195613))

(declare-fun m!1195615 () Bool)

(assert (=> b!1304424 m!1195615))

(assert (=> b!1304422 m!1195473))

(assert (=> b!1304422 m!1195473))

(assert (=> b!1304422 m!1195475))

(declare-fun m!1195617 () Bool)

(assert (=> b!1304418 m!1195617))

(assert (=> b!1304418 m!1195473))

(declare-fun m!1195619 () Bool)

(assert (=> b!1304418 m!1195619))

(assert (=> b!1304418 m!1195473))

(declare-fun m!1195621 () Bool)

(assert (=> b!1304418 m!1195621))

(assert (=> b!1304418 m!1195621))

(assert (=> b!1304418 m!1195617))

(declare-fun m!1195623 () Bool)

(assert (=> b!1304418 m!1195623))

(declare-fun m!1195625 () Bool)

(assert (=> d!142065 m!1195625))

(assert (=> d!142065 m!1195437))

(declare-fun m!1195627 () Bool)

(assert (=> b!1304421 m!1195627))

(assert (=> b!1304413 m!1195617))

(declare-fun m!1195629 () Bool)

(assert (=> b!1304413 m!1195629))

(declare-fun m!1195631 () Bool)

(assert (=> b!1304413 m!1195631))

(assert (=> b!1304413 m!1195473))

(declare-fun m!1195633 () Bool)

(assert (=> b!1304413 m!1195633))

(declare-fun m!1195635 () Bool)

(assert (=> b!1304413 m!1195635))

(assert (=> b!1304413 m!1195629))

(assert (=> b!1304413 m!1195621))

(assert (=> b!1304413 m!1195621))

(assert (=> b!1304413 m!1195617))

(assert (=> b!1304413 m!1195623))

(assert (=> b!1304423 m!1195473))

(assert (=> b!1304423 m!1195473))

(assert (=> b!1304423 m!1195475))

(assert (=> b!1304283 d!142065))

(declare-fun d!142067 () Bool)

(assert (=> d!142067 (not (contains!8305 (+!4522 lt!583462 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!583561 () Unit!43106)

(assert (=> d!142067 (= lt!583561 (choose!1923 lt!583462 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun e!744138 () Bool)

(assert (=> d!142067 e!744138))

(declare-fun res!866037 () Bool)

(assert (=> d!142067 (=> (not res!866037) (not e!744138))))

(assert (=> d!142067 (= res!866037 (not (contains!8305 lt!583462 k0!1205)))))

(assert (=> d!142067 (= (addStillNotContains!473 lt!583462 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205) lt!583561)))

(declare-fun b!1304427 () Bool)

(assert (=> b!1304427 (= e!744138 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!142067 res!866037) b!1304427))

(declare-fun m!1195637 () Bool)

(assert (=> d!142067 m!1195637))

(assert (=> d!142067 m!1195637))

(declare-fun m!1195639 () Bool)

(assert (=> d!142067 m!1195639))

(declare-fun m!1195641 () Bool)

(assert (=> d!142067 m!1195641))

(assert (=> d!142067 m!1195597))

(assert (=> b!1304283 d!142067))

(declare-fun d!142069 () Bool)

(declare-fun e!744139 () Bool)

(assert (=> d!142069 e!744139))

(declare-fun res!866038 () Bool)

(assert (=> d!142069 (=> res!866038 e!744139)))

(declare-fun lt!583563 () Bool)

(assert (=> d!142069 (= res!866038 (not lt!583563))))

(declare-fun lt!583564 () Bool)

(assert (=> d!142069 (= lt!583563 lt!583564)))

(declare-fun lt!583565 () Unit!43106)

(declare-fun e!744140 () Unit!43106)

(assert (=> d!142069 (= lt!583565 e!744140)))

(declare-fun c!125476 () Bool)

(assert (=> d!142069 (= c!125476 lt!583564)))

(assert (=> d!142069 (= lt!583564 (containsKey!726 (toList!10159 lt!583465) k0!1205))))

(assert (=> d!142069 (= (contains!8305 lt!583465 k0!1205) lt!583563)))

(declare-fun b!1304428 () Bool)

(declare-fun lt!583562 () Unit!43106)

(assert (=> b!1304428 (= e!744140 lt!583562)))

(assert (=> b!1304428 (= lt!583562 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10159 lt!583465) k0!1205))))

(assert (=> b!1304428 (isDefined!509 (getValueByKey!700 (toList!10159 lt!583465) k0!1205))))

(declare-fun b!1304429 () Bool)

(declare-fun Unit!43114 () Unit!43106)

(assert (=> b!1304429 (= e!744140 Unit!43114)))

(declare-fun b!1304430 () Bool)

(assert (=> b!1304430 (= e!744139 (isDefined!509 (getValueByKey!700 (toList!10159 lt!583465) k0!1205)))))

(assert (= (and d!142069 c!125476) b!1304428))

(assert (= (and d!142069 (not c!125476)) b!1304429))

(assert (= (and d!142069 (not res!866038)) b!1304430))

(declare-fun m!1195643 () Bool)

(assert (=> d!142069 m!1195643))

(declare-fun m!1195645 () Bool)

(assert (=> b!1304428 m!1195645))

(declare-fun m!1195647 () Bool)

(assert (=> b!1304428 m!1195647))

(assert (=> b!1304428 m!1195647))

(declare-fun m!1195649 () Bool)

(assert (=> b!1304428 m!1195649))

(assert (=> b!1304430 m!1195647))

(assert (=> b!1304430 m!1195647))

(assert (=> b!1304430 m!1195649))

(assert (=> b!1304283 d!142069))

(declare-fun d!142071 () Bool)

(declare-fun e!744141 () Bool)

(assert (=> d!142071 e!744141))

(declare-fun res!866039 () Bool)

(assert (=> d!142071 (=> res!866039 e!744141)))

(declare-fun lt!583567 () Bool)

(assert (=> d!142071 (= res!866039 (not lt!583567))))

(declare-fun lt!583568 () Bool)

(assert (=> d!142071 (= lt!583567 lt!583568)))

(declare-fun lt!583569 () Unit!43106)

(declare-fun e!744142 () Unit!43106)

(assert (=> d!142071 (= lt!583569 e!744142)))

(declare-fun c!125477 () Bool)

(assert (=> d!142071 (= c!125477 lt!583568)))

(assert (=> d!142071 (= lt!583568 (containsKey!726 (toList!10159 (+!4522 lt!583465 lt!583461)) k0!1205))))

(assert (=> d!142071 (= (contains!8305 (+!4522 lt!583465 lt!583461) k0!1205) lt!583567)))

(declare-fun b!1304431 () Bool)

(declare-fun lt!583566 () Unit!43106)

(assert (=> b!1304431 (= e!744142 lt!583566)))

(assert (=> b!1304431 (= lt!583566 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10159 (+!4522 lt!583465 lt!583461)) k0!1205))))

(assert (=> b!1304431 (isDefined!509 (getValueByKey!700 (toList!10159 (+!4522 lt!583465 lt!583461)) k0!1205))))

(declare-fun b!1304432 () Bool)

(declare-fun Unit!43115 () Unit!43106)

(assert (=> b!1304432 (= e!744142 Unit!43115)))

(declare-fun b!1304433 () Bool)

(assert (=> b!1304433 (= e!744141 (isDefined!509 (getValueByKey!700 (toList!10159 (+!4522 lt!583465 lt!583461)) k0!1205)))))

(assert (= (and d!142071 c!125477) b!1304431))

(assert (= (and d!142071 (not c!125477)) b!1304432))

(assert (= (and d!142071 (not res!866039)) b!1304433))

(declare-fun m!1195651 () Bool)

(assert (=> d!142071 m!1195651))

(declare-fun m!1195653 () Bool)

(assert (=> b!1304431 m!1195653))

(declare-fun m!1195655 () Bool)

(assert (=> b!1304431 m!1195655))

(assert (=> b!1304431 m!1195655))

(declare-fun m!1195657 () Bool)

(assert (=> b!1304431 m!1195657))

(assert (=> b!1304433 m!1195655))

(assert (=> b!1304433 m!1195655))

(assert (=> b!1304433 m!1195657))

(assert (=> b!1304283 d!142071))

(declare-fun d!142073 () Bool)

(declare-fun e!744143 () Bool)

(assert (=> d!142073 e!744143))

(declare-fun res!866040 () Bool)

(assert (=> d!142073 (=> (not res!866040) (not e!744143))))

(declare-fun lt!583571 () ListLongMap!20287)

(assert (=> d!142073 (= res!866040 (contains!8305 lt!583571 (_1!11322 lt!583461)))))

(declare-fun lt!583573 () List!29771)

(assert (=> d!142073 (= lt!583571 (ListLongMap!20288 lt!583573))))

(declare-fun lt!583570 () Unit!43106)

(declare-fun lt!583572 () Unit!43106)

(assert (=> d!142073 (= lt!583570 lt!583572)))

(assert (=> d!142073 (= (getValueByKey!700 lt!583573 (_1!11322 lt!583461)) (Some!750 (_2!11322 lt!583461)))))

(assert (=> d!142073 (= lt!583572 (lemmaContainsTupThenGetReturnValue!351 lt!583573 (_1!11322 lt!583461) (_2!11322 lt!583461)))))

(assert (=> d!142073 (= lt!583573 (insertStrictlySorted!480 (toList!10159 lt!583462) (_1!11322 lt!583461) (_2!11322 lt!583461)))))

(assert (=> d!142073 (= (+!4522 lt!583462 lt!583461) lt!583571)))

(declare-fun b!1304434 () Bool)

(declare-fun res!866041 () Bool)

(assert (=> b!1304434 (=> (not res!866041) (not e!744143))))

(assert (=> b!1304434 (= res!866041 (= (getValueByKey!700 (toList!10159 lt!583571) (_1!11322 lt!583461)) (Some!750 (_2!11322 lt!583461))))))

(declare-fun b!1304435 () Bool)

(assert (=> b!1304435 (= e!744143 (contains!8308 (toList!10159 lt!583571) lt!583461))))

(assert (= (and d!142073 res!866040) b!1304434))

(assert (= (and b!1304434 res!866041) b!1304435))

(declare-fun m!1195659 () Bool)

(assert (=> d!142073 m!1195659))

(declare-fun m!1195661 () Bool)

(assert (=> d!142073 m!1195661))

(declare-fun m!1195663 () Bool)

(assert (=> d!142073 m!1195663))

(declare-fun m!1195665 () Bool)

(assert (=> d!142073 m!1195665))

(declare-fun m!1195667 () Bool)

(assert (=> b!1304434 m!1195667))

(declare-fun m!1195669 () Bool)

(assert (=> b!1304435 m!1195669))

(assert (=> b!1304283 d!142073))

(declare-fun b!1304446 () Bool)

(declare-fun e!744154 () Bool)

(declare-fun e!744153 () Bool)

(assert (=> b!1304446 (= e!744154 e!744153)))

(declare-fun c!125480 () Bool)

(assert (=> b!1304446 (= c!125480 (validKeyInArray!0 (select (arr!41899 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304447 () Bool)

(declare-fun call!64247 () Bool)

(assert (=> b!1304447 (= e!744153 call!64247)))

(declare-fun b!1304448 () Bool)

(declare-fun e!744155 () Bool)

(declare-fun contains!8309 (List!29772 (_ BitVec 64)) Bool)

(assert (=> b!1304448 (= e!744155 (contains!8309 Nil!29769 (select (arr!41899 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142075 () Bool)

(declare-fun res!866049 () Bool)

(declare-fun e!744152 () Bool)

(assert (=> d!142075 (=> res!866049 e!744152)))

(assert (=> d!142075 (= res!866049 (bvsge #b00000000000000000000000000000000 (size!42450 _keys!1741)))))

(assert (=> d!142075 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29769) e!744152)))

(declare-fun b!1304449 () Bool)

(assert (=> b!1304449 (= e!744152 e!744154)))

(declare-fun res!866048 () Bool)

(assert (=> b!1304449 (=> (not res!866048) (not e!744154))))

(assert (=> b!1304449 (= res!866048 (not e!744155))))

(declare-fun res!866050 () Bool)

(assert (=> b!1304449 (=> (not res!866050) (not e!744155))))

(assert (=> b!1304449 (= res!866050 (validKeyInArray!0 (select (arr!41899 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64244 () Bool)

(assert (=> bm!64244 (= call!64247 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125480 (Cons!29768 (select (arr!41899 _keys!1741) #b00000000000000000000000000000000) Nil!29769) Nil!29769)))))

(declare-fun b!1304450 () Bool)

(assert (=> b!1304450 (= e!744153 call!64247)))

(assert (= (and d!142075 (not res!866049)) b!1304449))

(assert (= (and b!1304449 res!866050) b!1304448))

(assert (= (and b!1304449 res!866048) b!1304446))

(assert (= (and b!1304446 c!125480) b!1304447))

(assert (= (and b!1304446 (not c!125480)) b!1304450))

(assert (= (or b!1304447 b!1304450) bm!64244))

(declare-fun m!1195671 () Bool)

(assert (=> b!1304446 m!1195671))

(assert (=> b!1304446 m!1195671))

(declare-fun m!1195673 () Bool)

(assert (=> b!1304446 m!1195673))

(assert (=> b!1304448 m!1195671))

(assert (=> b!1304448 m!1195671))

(declare-fun m!1195675 () Bool)

(assert (=> b!1304448 m!1195675))

(assert (=> b!1304449 m!1195671))

(assert (=> b!1304449 m!1195671))

(assert (=> b!1304449 m!1195673))

(assert (=> bm!64244 m!1195671))

(declare-fun m!1195677 () Bool)

(assert (=> bm!64244 m!1195677))

(assert (=> b!1304288 d!142075))

(declare-fun d!142077 () Bool)

(declare-fun e!744156 () Bool)

(assert (=> d!142077 e!744156))

(declare-fun res!866051 () Bool)

(assert (=> d!142077 (=> res!866051 e!744156)))

(declare-fun lt!583575 () Bool)

(assert (=> d!142077 (= res!866051 (not lt!583575))))

(declare-fun lt!583576 () Bool)

(assert (=> d!142077 (= lt!583575 lt!583576)))

(declare-fun lt!583577 () Unit!43106)

(declare-fun e!744157 () Unit!43106)

(assert (=> d!142077 (= lt!583577 e!744157)))

(declare-fun c!125481 () Bool)

(assert (=> d!142077 (= c!125481 lt!583576)))

(assert (=> d!142077 (= lt!583576 (containsKey!726 (toList!10159 (getCurrentListMap!5171 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142077 (= (contains!8305 (getCurrentListMap!5171 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583575)))

(declare-fun b!1304451 () Bool)

(declare-fun lt!583574 () Unit!43106)

(assert (=> b!1304451 (= e!744157 lt!583574)))

(assert (=> b!1304451 (= lt!583574 (lemmaContainsKeyImpliesGetValueByKeyDefined!472 (toList!10159 (getCurrentListMap!5171 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1304451 (isDefined!509 (getValueByKey!700 (toList!10159 (getCurrentListMap!5171 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1304452 () Bool)

(declare-fun Unit!43116 () Unit!43106)

(assert (=> b!1304452 (= e!744157 Unit!43116)))

(declare-fun b!1304453 () Bool)

(assert (=> b!1304453 (= e!744156 (isDefined!509 (getValueByKey!700 (toList!10159 (getCurrentListMap!5171 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142077 c!125481) b!1304451))

(assert (= (and d!142077 (not c!125481)) b!1304452))

(assert (= (and d!142077 (not res!866051)) b!1304453))

(declare-fun m!1195679 () Bool)

(assert (=> d!142077 m!1195679))

(declare-fun m!1195681 () Bool)

(assert (=> b!1304451 m!1195681))

(declare-fun m!1195683 () Bool)

(assert (=> b!1304451 m!1195683))

(assert (=> b!1304451 m!1195683))

(declare-fun m!1195685 () Bool)

(assert (=> b!1304451 m!1195685))

(assert (=> b!1304453 m!1195683))

(assert (=> b!1304453 m!1195683))

(assert (=> b!1304453 m!1195685))

(assert (=> b!1304282 d!142077))

(declare-fun b!1304496 () Bool)

(declare-fun e!744190 () Bool)

(assert (=> b!1304496 (= e!744190 (validKeyInArray!0 (select (arr!41899 _keys!1741) from!2144)))))

(declare-fun b!1304497 () Bool)

(declare-fun e!744195 () ListLongMap!20287)

(declare-fun call!64266 () ListLongMap!20287)

(assert (=> b!1304497 (= e!744195 (+!4522 call!64266 (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1304498 () Bool)

(declare-fun res!866074 () Bool)

(declare-fun e!744189 () Bool)

(assert (=> b!1304498 (=> (not res!866074) (not e!744189))))

(declare-fun e!744191 () Bool)

(assert (=> b!1304498 (= res!866074 e!744191)))

(declare-fun res!866071 () Bool)

(assert (=> b!1304498 (=> res!866071 e!744191)))

(assert (=> b!1304498 (= res!866071 (not e!744190))))

(declare-fun res!866075 () Bool)

(assert (=> b!1304498 (=> (not res!866075) (not e!744190))))

(assert (=> b!1304498 (= res!866075 (bvslt from!2144 (size!42450 _keys!1741)))))

(declare-fun lt!583633 () ListLongMap!20287)

(declare-fun b!1304499 () Bool)

(declare-fun e!744184 () Bool)

(assert (=> b!1304499 (= e!744184 (= (apply!1030 lt!583633 (select (arr!41899 _keys!1741) from!2144)) (get!21208 (select (arr!41900 _values!1445) from!2144) (dynLambda!3491 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304499 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42451 _values!1445)))))

(assert (=> b!1304499 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42450 _keys!1741)))))

(declare-fun b!1304500 () Bool)

(declare-fun e!744186 () ListLongMap!20287)

(declare-fun call!64267 () ListLongMap!20287)

(assert (=> b!1304500 (= e!744186 call!64267)))

(declare-fun b!1304501 () Bool)

(assert (=> b!1304501 (= e!744195 e!744186)))

(declare-fun c!125498 () Bool)

(assert (=> b!1304501 (= c!125498 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64259 () Bool)

(declare-fun call!64262 () ListLongMap!20287)

(declare-fun c!125495 () Bool)

(declare-fun call!64263 () ListLongMap!20287)

(declare-fun call!64264 () ListLongMap!20287)

(assert (=> bm!64259 (= call!64266 (+!4522 (ite c!125495 call!64264 (ite c!125498 call!64262 call!64263)) (ite (or c!125495 c!125498) (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22623 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1304502 () Bool)

(declare-fun e!744193 () Bool)

(declare-fun call!64265 () Bool)

(assert (=> b!1304502 (= e!744193 (not call!64265))))

(declare-fun b!1304503 () Bool)

(declare-fun res!866073 () Bool)

(assert (=> b!1304503 (=> (not res!866073) (not e!744189))))

(declare-fun e!744187 () Bool)

(assert (=> b!1304503 (= res!866073 e!744187)))

(declare-fun c!125499 () Bool)

(assert (=> b!1304503 (= c!125499 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1304504 () Bool)

(declare-fun e!744188 () Unit!43106)

(declare-fun lt!583640 () Unit!43106)

(assert (=> b!1304504 (= e!744188 lt!583640)))

(declare-fun lt!583641 () ListLongMap!20287)

(assert (=> b!1304504 (= lt!583641 (getCurrentListMapNoExtraKeys!6160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583629 () (_ BitVec 64))

(assert (=> b!1304504 (= lt!583629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583627 () (_ BitVec 64))

(assert (=> b!1304504 (= lt!583627 (select (arr!41899 _keys!1741) from!2144))))

(declare-fun lt!583625 () Unit!43106)

(declare-fun addStillContains!1117 (ListLongMap!20287 (_ BitVec 64) V!51617 (_ BitVec 64)) Unit!43106)

(assert (=> b!1304504 (= lt!583625 (addStillContains!1117 lt!583641 lt!583629 zeroValue!1387 lt!583627))))

(assert (=> b!1304504 (contains!8305 (+!4522 lt!583641 (tuple2!22623 lt!583629 zeroValue!1387)) lt!583627)))

(declare-fun lt!583642 () Unit!43106)

(assert (=> b!1304504 (= lt!583642 lt!583625)))

(declare-fun lt!583632 () ListLongMap!20287)

(assert (=> b!1304504 (= lt!583632 (getCurrentListMapNoExtraKeys!6160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583643 () (_ BitVec 64))

(assert (=> b!1304504 (= lt!583643 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583626 () (_ BitVec 64))

(assert (=> b!1304504 (= lt!583626 (select (arr!41899 _keys!1741) from!2144))))

(declare-fun lt!583623 () Unit!43106)

(declare-fun addApplyDifferent!559 (ListLongMap!20287 (_ BitVec 64) V!51617 (_ BitVec 64)) Unit!43106)

(assert (=> b!1304504 (= lt!583623 (addApplyDifferent!559 lt!583632 lt!583643 minValue!1387 lt!583626))))

(assert (=> b!1304504 (= (apply!1030 (+!4522 lt!583632 (tuple2!22623 lt!583643 minValue!1387)) lt!583626) (apply!1030 lt!583632 lt!583626))))

(declare-fun lt!583637 () Unit!43106)

(assert (=> b!1304504 (= lt!583637 lt!583623)))

(declare-fun lt!583628 () ListLongMap!20287)

(assert (=> b!1304504 (= lt!583628 (getCurrentListMapNoExtraKeys!6160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583631 () (_ BitVec 64))

(assert (=> b!1304504 (= lt!583631 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583622 () (_ BitVec 64))

(assert (=> b!1304504 (= lt!583622 (select (arr!41899 _keys!1741) from!2144))))

(declare-fun lt!583630 () Unit!43106)

(assert (=> b!1304504 (= lt!583630 (addApplyDifferent!559 lt!583628 lt!583631 zeroValue!1387 lt!583622))))

(assert (=> b!1304504 (= (apply!1030 (+!4522 lt!583628 (tuple2!22623 lt!583631 zeroValue!1387)) lt!583622) (apply!1030 lt!583628 lt!583622))))

(declare-fun lt!583639 () Unit!43106)

(assert (=> b!1304504 (= lt!583639 lt!583630)))

(declare-fun lt!583636 () ListLongMap!20287)

(assert (=> b!1304504 (= lt!583636 (getCurrentListMapNoExtraKeys!6160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583638 () (_ BitVec 64))

(assert (=> b!1304504 (= lt!583638 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583635 () (_ BitVec 64))

(assert (=> b!1304504 (= lt!583635 (select (arr!41899 _keys!1741) from!2144))))

(assert (=> b!1304504 (= lt!583640 (addApplyDifferent!559 lt!583636 lt!583638 minValue!1387 lt!583635))))

(assert (=> b!1304504 (= (apply!1030 (+!4522 lt!583636 (tuple2!22623 lt!583638 minValue!1387)) lt!583635) (apply!1030 lt!583636 lt!583635))))

(declare-fun b!1304505 () Bool)

(declare-fun e!744192 () Bool)

(assert (=> b!1304505 (= e!744192 (= (apply!1030 lt!583633 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64260 () Bool)

(assert (=> bm!64260 (= call!64267 call!64266)))

(declare-fun b!1304506 () Bool)

(declare-fun c!125496 () Bool)

(assert (=> b!1304506 (= c!125496 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!744194 () ListLongMap!20287)

(assert (=> b!1304506 (= e!744186 e!744194)))

(declare-fun b!1304507 () Bool)

(assert (=> b!1304507 (= e!744191 e!744184)))

(declare-fun res!866072 () Bool)

(assert (=> b!1304507 (=> (not res!866072) (not e!744184))))

(assert (=> b!1304507 (= res!866072 (contains!8305 lt!583633 (select (arr!41899 _keys!1741) from!2144)))))

(assert (=> b!1304507 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42450 _keys!1741)))))

(declare-fun b!1304508 () Bool)

(declare-fun e!744185 () Bool)

(assert (=> b!1304508 (= e!744185 (= (apply!1030 lt!583633 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!64261 () Bool)

(assert (=> bm!64261 (= call!64264 (getCurrentListMapNoExtraKeys!6160 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304509 () Bool)

(assert (=> b!1304509 (= e!744194 call!64267)))

(declare-fun bm!64262 () Bool)

(assert (=> bm!64262 (= call!64263 call!64262)))

(declare-fun bm!64263 () Bool)

(declare-fun call!64268 () Bool)

(assert (=> bm!64263 (= call!64268 (contains!8305 lt!583633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304510 () Bool)

(assert (=> b!1304510 (= e!744194 call!64263)))

(declare-fun bm!64264 () Bool)

(assert (=> bm!64264 (= call!64262 call!64264)))

(declare-fun bm!64265 () Bool)

(assert (=> bm!64265 (= call!64265 (contains!8305 lt!583633 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304511 () Bool)

(assert (=> b!1304511 (= e!744187 e!744192)))

(declare-fun res!866076 () Bool)

(assert (=> b!1304511 (= res!866076 call!64268)))

(assert (=> b!1304511 (=> (not res!866076) (not e!744192))))

(declare-fun d!142079 () Bool)

(assert (=> d!142079 e!744189))

(declare-fun res!866070 () Bool)

(assert (=> d!142079 (=> (not res!866070) (not e!744189))))

(assert (=> d!142079 (= res!866070 (or (bvsge from!2144 (size!42450 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42450 _keys!1741)))))))

(declare-fun lt!583634 () ListLongMap!20287)

(assert (=> d!142079 (= lt!583633 lt!583634)))

(declare-fun lt!583624 () Unit!43106)

(assert (=> d!142079 (= lt!583624 e!744188)))

(declare-fun c!125497 () Bool)

(declare-fun e!744196 () Bool)

(assert (=> d!142079 (= c!125497 e!744196)))

(declare-fun res!866078 () Bool)

(assert (=> d!142079 (=> (not res!866078) (not e!744196))))

(assert (=> d!142079 (= res!866078 (bvslt from!2144 (size!42450 _keys!1741)))))

(assert (=> d!142079 (= lt!583634 e!744195)))

(assert (=> d!142079 (= c!125495 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142079 (validMask!0 mask!2175)))

(assert (=> d!142079 (= (getCurrentListMap!5171 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583633)))

(declare-fun b!1304512 () Bool)

(declare-fun Unit!43117 () Unit!43106)

(assert (=> b!1304512 (= e!744188 Unit!43117)))

(declare-fun b!1304513 () Bool)

(assert (=> b!1304513 (= e!744187 (not call!64268))))

(declare-fun b!1304514 () Bool)

(assert (=> b!1304514 (= e!744189 e!744193)))

(declare-fun c!125494 () Bool)

(assert (=> b!1304514 (= c!125494 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1304515 () Bool)

(assert (=> b!1304515 (= e!744193 e!744185)))

(declare-fun res!866077 () Bool)

(assert (=> b!1304515 (= res!866077 call!64265)))

(assert (=> b!1304515 (=> (not res!866077) (not e!744185))))

(declare-fun b!1304516 () Bool)

(assert (=> b!1304516 (= e!744196 (validKeyInArray!0 (select (arr!41899 _keys!1741) from!2144)))))

(assert (= (and d!142079 c!125495) b!1304497))

(assert (= (and d!142079 (not c!125495)) b!1304501))

(assert (= (and b!1304501 c!125498) b!1304500))

(assert (= (and b!1304501 (not c!125498)) b!1304506))

(assert (= (and b!1304506 c!125496) b!1304509))

(assert (= (and b!1304506 (not c!125496)) b!1304510))

(assert (= (or b!1304509 b!1304510) bm!64262))

(assert (= (or b!1304500 bm!64262) bm!64264))

(assert (= (or b!1304500 b!1304509) bm!64260))

(assert (= (or b!1304497 bm!64264) bm!64261))

(assert (= (or b!1304497 bm!64260) bm!64259))

(assert (= (and d!142079 res!866078) b!1304516))

(assert (= (and d!142079 c!125497) b!1304504))

(assert (= (and d!142079 (not c!125497)) b!1304512))

(assert (= (and d!142079 res!866070) b!1304498))

(assert (= (and b!1304498 res!866075) b!1304496))

(assert (= (and b!1304498 (not res!866071)) b!1304507))

(assert (= (and b!1304507 res!866072) b!1304499))

(assert (= (and b!1304498 res!866074) b!1304503))

(assert (= (and b!1304503 c!125499) b!1304511))

(assert (= (and b!1304503 (not c!125499)) b!1304513))

(assert (= (and b!1304511 res!866076) b!1304505))

(assert (= (or b!1304511 b!1304513) bm!64263))

(assert (= (and b!1304503 res!866073) b!1304514))

(assert (= (and b!1304514 c!125494) b!1304515))

(assert (= (and b!1304514 (not c!125494)) b!1304502))

(assert (= (and b!1304515 res!866077) b!1304508))

(assert (= (or b!1304515 b!1304502) bm!64265))

(declare-fun b_lambda!23261 () Bool)

(assert (=> (not b_lambda!23261) (not b!1304499)))

(assert (=> b!1304499 t!43361))

(declare-fun b_and!47415 () Bool)

(assert (= b_and!47413 (and (=> t!43361 result!23805) b_and!47415)))

(declare-fun m!1195687 () Bool)

(assert (=> bm!64265 m!1195687))

(assert (=> b!1304499 m!1195473))

(assert (=> b!1304499 m!1195473))

(declare-fun m!1195689 () Bool)

(assert (=> b!1304499 m!1195689))

(assert (=> b!1304499 m!1195621))

(assert (=> b!1304499 m!1195617))

(assert (=> b!1304499 m!1195623))

(assert (=> b!1304499 m!1195617))

(assert (=> b!1304499 m!1195621))

(declare-fun m!1195691 () Bool)

(assert (=> bm!64263 m!1195691))

(assert (=> b!1304504 m!1195467))

(assert (=> b!1304504 m!1195473))

(declare-fun m!1195693 () Bool)

(assert (=> b!1304504 m!1195693))

(declare-fun m!1195695 () Bool)

(assert (=> b!1304504 m!1195695))

(declare-fun m!1195697 () Bool)

(assert (=> b!1304504 m!1195697))

(declare-fun m!1195699 () Bool)

(assert (=> b!1304504 m!1195699))

(declare-fun m!1195701 () Bool)

(assert (=> b!1304504 m!1195701))

(declare-fun m!1195703 () Bool)

(assert (=> b!1304504 m!1195703))

(assert (=> b!1304504 m!1195697))

(declare-fun m!1195705 () Bool)

(assert (=> b!1304504 m!1195705))

(declare-fun m!1195707 () Bool)

(assert (=> b!1304504 m!1195707))

(declare-fun m!1195709 () Bool)

(assert (=> b!1304504 m!1195709))

(declare-fun m!1195711 () Bool)

(assert (=> b!1304504 m!1195711))

(assert (=> b!1304504 m!1195699))

(declare-fun m!1195713 () Bool)

(assert (=> b!1304504 m!1195713))

(declare-fun m!1195715 () Bool)

(assert (=> b!1304504 m!1195715))

(declare-fun m!1195717 () Bool)

(assert (=> b!1304504 m!1195717))

(declare-fun m!1195719 () Bool)

(assert (=> b!1304504 m!1195719))

(assert (=> b!1304504 m!1195701))

(declare-fun m!1195721 () Bool)

(assert (=> b!1304504 m!1195721))

(assert (=> b!1304504 m!1195709))

(assert (=> b!1304507 m!1195473))

(assert (=> b!1304507 m!1195473))

(declare-fun m!1195723 () Bool)

(assert (=> b!1304507 m!1195723))

(declare-fun m!1195725 () Bool)

(assert (=> b!1304497 m!1195725))

(assert (=> bm!64261 m!1195467))

(assert (=> d!142079 m!1195437))

(declare-fun m!1195727 () Bool)

(assert (=> bm!64259 m!1195727))

(declare-fun m!1195729 () Bool)

(assert (=> b!1304505 m!1195729))

(assert (=> b!1304496 m!1195473))

(assert (=> b!1304496 m!1195473))

(assert (=> b!1304496 m!1195475))

(assert (=> b!1304516 m!1195473))

(assert (=> b!1304516 m!1195473))

(assert (=> b!1304516 m!1195475))

(declare-fun m!1195731 () Bool)

(assert (=> b!1304508 m!1195731))

(assert (=> b!1304282 d!142079))

(declare-fun b!1304525 () Bool)

(declare-fun e!744203 () Bool)

(declare-fun e!744205 () Bool)

(assert (=> b!1304525 (= e!744203 e!744205)))

(declare-fun c!125502 () Bool)

(assert (=> b!1304525 (= c!125502 (validKeyInArray!0 (select (arr!41899 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142081 () Bool)

(declare-fun res!866084 () Bool)

(assert (=> d!142081 (=> res!866084 e!744203)))

(assert (=> d!142081 (= res!866084 (bvsge #b00000000000000000000000000000000 (size!42450 _keys!1741)))))

(assert (=> d!142081 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744203)))

(declare-fun b!1304526 () Bool)

(declare-fun e!744204 () Bool)

(declare-fun call!64271 () Bool)

(assert (=> b!1304526 (= e!744204 call!64271)))

(declare-fun b!1304527 () Bool)

(assert (=> b!1304527 (= e!744205 e!744204)))

(declare-fun lt!583652 () (_ BitVec 64))

(assert (=> b!1304527 (= lt!583652 (select (arr!41899 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583651 () Unit!43106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86823 (_ BitVec 64) (_ BitVec 32)) Unit!43106)

(assert (=> b!1304527 (= lt!583651 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583652 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1304527 (arrayContainsKey!0 _keys!1741 lt!583652 #b00000000000000000000000000000000)))

(declare-fun lt!583650 () Unit!43106)

(assert (=> b!1304527 (= lt!583650 lt!583651)))

(declare-fun res!866083 () Bool)

(declare-datatypes ((SeekEntryResult!9980 0))(
  ( (MissingZero!9980 (index!42291 (_ BitVec 32))) (Found!9980 (index!42292 (_ BitVec 32))) (Intermediate!9980 (undefined!10792 Bool) (index!42293 (_ BitVec 32)) (x!115712 (_ BitVec 32))) (Undefined!9980) (MissingVacant!9980 (index!42294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86823 (_ BitVec 32)) SeekEntryResult!9980)

(assert (=> b!1304527 (= res!866083 (= (seekEntryOrOpen!0 (select (arr!41899 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9980 #b00000000000000000000000000000000)))))

(assert (=> b!1304527 (=> (not res!866083) (not e!744204))))

(declare-fun b!1304528 () Bool)

(assert (=> b!1304528 (= e!744205 call!64271)))

(declare-fun bm!64268 () Bool)

(assert (=> bm!64268 (= call!64271 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!142081 (not res!866084)) b!1304525))

(assert (= (and b!1304525 c!125502) b!1304527))

(assert (= (and b!1304525 (not c!125502)) b!1304528))

(assert (= (and b!1304527 res!866083) b!1304526))

(assert (= (or b!1304526 b!1304528) bm!64268))

(assert (=> b!1304525 m!1195671))

(assert (=> b!1304525 m!1195671))

(assert (=> b!1304525 m!1195673))

(assert (=> b!1304527 m!1195671))

(declare-fun m!1195733 () Bool)

(assert (=> b!1304527 m!1195733))

(declare-fun m!1195735 () Bool)

(assert (=> b!1304527 m!1195735))

(assert (=> b!1304527 m!1195671))

(declare-fun m!1195737 () Bool)

(assert (=> b!1304527 m!1195737))

(declare-fun m!1195739 () Bool)

(assert (=> bm!64268 m!1195739))

(assert (=> b!1304292 d!142081))

(declare-fun d!142083 () Bool)

(assert (=> d!142083 (= (validKeyInArray!0 (select (arr!41899 _keys!1741) from!2144)) (and (not (= (select (arr!41899 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41899 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304281 d!142083))

(declare-fun mapNonEmpty!53926 () Bool)

(declare-fun mapRes!53926 () Bool)

(declare-fun tp!102898 () Bool)

(declare-fun e!744210 () Bool)

(assert (=> mapNonEmpty!53926 (= mapRes!53926 (and tp!102898 e!744210))))

(declare-fun mapRest!53926 () (Array (_ BitVec 32) ValueCell!16544))

(declare-fun mapKey!53926 () (_ BitVec 32))

(declare-fun mapValue!53926 () ValueCell!16544)

(assert (=> mapNonEmpty!53926 (= mapRest!53917 (store mapRest!53926 mapKey!53926 mapValue!53926))))

(declare-fun condMapEmpty!53926 () Bool)

(declare-fun mapDefault!53926 () ValueCell!16544)

(assert (=> mapNonEmpty!53917 (= condMapEmpty!53926 (= mapRest!53917 ((as const (Array (_ BitVec 32) ValueCell!16544)) mapDefault!53926)))))

(declare-fun e!744211 () Bool)

(assert (=> mapNonEmpty!53917 (= tp!102883 (and e!744211 mapRes!53926))))

(declare-fun mapIsEmpty!53926 () Bool)

(assert (=> mapIsEmpty!53926 mapRes!53926))

(declare-fun b!1304535 () Bool)

(assert (=> b!1304535 (= e!744210 tp_is_empty!34885)))

(declare-fun b!1304536 () Bool)

(assert (=> b!1304536 (= e!744211 tp_is_empty!34885)))

(assert (= (and mapNonEmpty!53917 condMapEmpty!53926) mapIsEmpty!53926))

(assert (= (and mapNonEmpty!53917 (not condMapEmpty!53926)) mapNonEmpty!53926))

(assert (= (and mapNonEmpty!53926 ((_ is ValueCellFull!16544) mapValue!53926)) b!1304535))

(assert (= (and mapNonEmpty!53917 ((_ is ValueCellFull!16544) mapDefault!53926)) b!1304536))

(declare-fun m!1195741 () Bool)

(assert (=> mapNonEmpty!53926 m!1195741))

(declare-fun b_lambda!23263 () Bool)

(assert (= b_lambda!23261 (or (and start!110246 b_free!29245) b_lambda!23263)))

(declare-fun b_lambda!23265 () Bool)

(assert (= b_lambda!23259 (or (and start!110246 b_free!29245) b_lambda!23265)))

(declare-fun b_lambda!23267 () Bool)

(assert (= b_lambda!23257 (or (and start!110246 b_free!29245) b_lambda!23267)))

(check-sat (not b!1304448) b_and!47415 (not bm!64263) (not d!142071) (not d!142069) (not b!1304497) (not b!1304373) (not b!1304421) (not d!142061) (not b!1304434) (not d!142065) (not d!142077) (not b!1304382) (not b!1304430) (not bm!64268) (not b_lambda!23265) (not b!1304379) (not mapNonEmpty!53926) (not b!1304504) (not b!1304433) (not b!1304496) (not b!1304388) (not d!142073) (not b!1304380) (not b!1304431) (not b_next!29245) (not b!1304414) (not d!142057) (not b!1304499) (not bm!64261) (not b!1304505) (not bm!64244) (not bm!64259) (not b!1304508) (not bm!64265) (not b!1304449) (not b_lambda!23263) (not b!1304453) (not b!1304387) (not b!1304419) (not bm!64241) (not d!142055) (not b!1304525) (not d!142059) tp_is_empty!34885 (not d!142063) (not b_lambda!23267) (not b!1304451) (not b!1304422) (not b!1304527) (not d!142053) (not b!1304446) (not d!142067) (not b!1304516) (not b!1304435) (not b!1304428) (not b!1304413) (not b!1304418) (not b!1304507) (not b!1304378) (not d!142079) (not b!1304424) (not b!1304423) (not b!1304371))
(check-sat b_and!47415 (not b_next!29245))
