; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33568 () Bool)

(assert start!33568)

(declare-fun b_free!6835 () Bool)

(declare-fun b_next!6835 () Bool)

(assert (=> start!33568 (= b_free!6835 (not b_next!6835))))

(declare-fun tp!24005 () Bool)

(declare-fun b_and!13987 () Bool)

(assert (=> start!33568 (= tp!24005 b_and!13987)))

(declare-fun b!332966 () Bool)

(declare-fun e!204451 () Bool)

(declare-fun tp_is_empty!6787 () Bool)

(assert (=> b!332966 (= e!204451 tp_is_empty!6787)))

(declare-fun res!183449 () Bool)

(declare-fun e!204454 () Bool)

(assert (=> start!33568 (=> (not res!183449) (not e!204454))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33568 (= res!183449 (validMask!0 mask!2385))))

(assert (=> start!33568 e!204454))

(assert (=> start!33568 true))

(assert (=> start!33568 tp_is_empty!6787))

(assert (=> start!33568 tp!24005))

(declare-datatypes ((V!10027 0))(
  ( (V!10028 (val!3438 Int)) )
))
(declare-datatypes ((ValueCell!3050 0))(
  ( (ValueCellFull!3050 (v!5593 V!10027)) (EmptyCell!3050) )
))
(declare-datatypes ((array!17155 0))(
  ( (array!17156 (arr!8109 (Array (_ BitVec 32) ValueCell!3050)) (size!8462 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17155)

(declare-fun e!204452 () Bool)

(declare-fun array_inv!6048 (array!17155) Bool)

(assert (=> start!33568 (and (array_inv!6048 _values!1525) e!204452)))

(declare-datatypes ((array!17157 0))(
  ( (array!17158 (arr!8110 (Array (_ BitVec 32) (_ BitVec 64))) (size!8463 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17157)

(declare-fun array_inv!6049 (array!17157) Bool)

(assert (=> start!33568 (array_inv!6049 _keys!1895)))

(declare-fun b!332967 () Bool)

(declare-fun res!183448 () Bool)

(assert (=> b!332967 (=> (not res!183448) (not e!204454))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10027)

(declare-fun zeroValue!1467 () V!10027)

(declare-datatypes ((tuple2!4946 0))(
  ( (tuple2!4947 (_1!2484 (_ BitVec 64)) (_2!2484 V!10027)) )
))
(declare-datatypes ((List!4584 0))(
  ( (Nil!4581) (Cons!4580 (h!5436 tuple2!4946) (t!9661 List!4584)) )
))
(declare-datatypes ((ListLongMap!3849 0))(
  ( (ListLongMap!3850 (toList!1940 List!4584)) )
))
(declare-fun contains!1994 (ListLongMap!3849 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1449 (array!17157 array!17155 (_ BitVec 32) (_ BitVec 32) V!10027 V!10027 (_ BitVec 32) Int) ListLongMap!3849)

(assert (=> b!332967 (= res!183448 (not (contains!1994 (getCurrentListMap!1449 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!332968 () Bool)

(declare-fun e!204450 () Bool)

(declare-fun mapRes!11574 () Bool)

(assert (=> b!332968 (= e!204452 (and e!204450 mapRes!11574))))

(declare-fun condMapEmpty!11574 () Bool)

(declare-fun mapDefault!11574 () ValueCell!3050)

(assert (=> b!332968 (= condMapEmpty!11574 (= (arr!8109 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3050)) mapDefault!11574)))))

(declare-fun b!332969 () Bool)

(declare-fun res!183447 () Bool)

(assert (=> b!332969 (=> (not res!183447) (not e!204454))))

(assert (=> b!332969 (= res!183447 (and (= (size!8462 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8463 _keys!1895) (size!8462 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11574 () Bool)

(assert (=> mapIsEmpty!11574 mapRes!11574))

(declare-fun b!332970 () Bool)

(assert (=> b!332970 (= e!204450 tp_is_empty!6787)))

(declare-fun b!332971 () Bool)

(declare-fun res!183446 () Bool)

(assert (=> b!332971 (=> (not res!183446) (not e!204454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17157 (_ BitVec 32)) Bool)

(assert (=> b!332971 (= res!183446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332972 () Bool)

(declare-datatypes ((SeekEntryResult!3131 0))(
  ( (MissingZero!3131 (index!14703 (_ BitVec 32))) (Found!3131 (index!14704 (_ BitVec 32))) (Intermediate!3131 (undefined!3943 Bool) (index!14705 (_ BitVec 32)) (x!33186 (_ BitVec 32))) (Undefined!3131) (MissingVacant!3131 (index!14706 (_ BitVec 32))) )
))
(declare-fun lt!159024 () SeekEntryResult!3131)

(get-info :version)

(assert (=> b!332972 (= e!204454 (and ((_ is Found!3131) lt!159024) (= (select (arr!8110 _keys!1895) (index!14704 lt!159024)) k0!1348) (bvsge (index!14704 lt!159024) #b00000000000000000000000000000000) (bvslt (index!14704 lt!159024) (size!8463 _keys!1895)) (bvsge (size!8463 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17157 (_ BitVec 32)) SeekEntryResult!3131)

(assert (=> b!332972 (= lt!159024 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!332973 () Bool)

(declare-fun res!183444 () Bool)

(assert (=> b!332973 (=> (not res!183444) (not e!204454))))

(declare-datatypes ((List!4585 0))(
  ( (Nil!4582) (Cons!4581 (h!5437 (_ BitVec 64)) (t!9662 List!4585)) )
))
(declare-fun arrayNoDuplicates!0 (array!17157 (_ BitVec 32) List!4585) Bool)

(assert (=> b!332973 (= res!183444 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4582))))

(declare-fun b!332974 () Bool)

(declare-fun res!183445 () Bool)

(assert (=> b!332974 (=> (not res!183445) (not e!204454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332974 (= res!183445 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!11574 () Bool)

(declare-fun tp!24006 () Bool)

(assert (=> mapNonEmpty!11574 (= mapRes!11574 (and tp!24006 e!204451))))

(declare-fun mapRest!11574 () (Array (_ BitVec 32) ValueCell!3050))

(declare-fun mapKey!11574 () (_ BitVec 32))

(declare-fun mapValue!11574 () ValueCell!3050)

(assert (=> mapNonEmpty!11574 (= (arr!8109 _values!1525) (store mapRest!11574 mapKey!11574 mapValue!11574))))

(assert (= (and start!33568 res!183449) b!332969))

(assert (= (and b!332969 res!183447) b!332971))

(assert (= (and b!332971 res!183446) b!332973))

(assert (= (and b!332973 res!183444) b!332974))

(assert (= (and b!332974 res!183445) b!332967))

(assert (= (and b!332967 res!183448) b!332972))

(assert (= (and b!332968 condMapEmpty!11574) mapIsEmpty!11574))

(assert (= (and b!332968 (not condMapEmpty!11574)) mapNonEmpty!11574))

(assert (= (and mapNonEmpty!11574 ((_ is ValueCellFull!3050) mapValue!11574)) b!332966))

(assert (= (and b!332968 ((_ is ValueCellFull!3050) mapDefault!11574)) b!332970))

(assert (= start!33568 b!332968))

(declare-fun m!336811 () Bool)

(assert (=> mapNonEmpty!11574 m!336811))

(declare-fun m!336813 () Bool)

(assert (=> start!33568 m!336813))

(declare-fun m!336815 () Bool)

(assert (=> start!33568 m!336815))

(declare-fun m!336817 () Bool)

(assert (=> start!33568 m!336817))

(declare-fun m!336819 () Bool)

(assert (=> b!332973 m!336819))

(declare-fun m!336821 () Bool)

(assert (=> b!332974 m!336821))

(declare-fun m!336823 () Bool)

(assert (=> b!332971 m!336823))

(declare-fun m!336825 () Bool)

(assert (=> b!332972 m!336825))

(declare-fun m!336827 () Bool)

(assert (=> b!332972 m!336827))

(declare-fun m!336829 () Bool)

(assert (=> b!332967 m!336829))

(assert (=> b!332967 m!336829))

(declare-fun m!336831 () Bool)

(assert (=> b!332967 m!336831))

(check-sat (not b!332973) (not b!332972) (not b!332971) (not b!332967) tp_is_empty!6787 b_and!13987 (not b_next!6835) (not b!332974) (not start!33568) (not mapNonEmpty!11574))
(check-sat b_and!13987 (not b_next!6835))
(get-model)

(declare-fun b!333041 () Bool)

(declare-fun lt!159039 () SeekEntryResult!3131)

(declare-fun e!204493 () SeekEntryResult!3131)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17157 (_ BitVec 32)) SeekEntryResult!3131)

(assert (=> b!333041 (= e!204493 (seekKeyOrZeroReturnVacant!0 (x!33186 lt!159039) (index!14705 lt!159039) (index!14705 lt!159039) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333042 () Bool)

(declare-fun c!52093 () Bool)

(declare-fun lt!159038 () (_ BitVec 64))

(assert (=> b!333042 (= c!52093 (= lt!159038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!204491 () SeekEntryResult!3131)

(assert (=> b!333042 (= e!204491 e!204493)))

(declare-fun d!70377 () Bool)

(declare-fun lt!159037 () SeekEntryResult!3131)

(assert (=> d!70377 (and (or ((_ is Undefined!3131) lt!159037) (not ((_ is Found!3131) lt!159037)) (and (bvsge (index!14704 lt!159037) #b00000000000000000000000000000000) (bvslt (index!14704 lt!159037) (size!8463 _keys!1895)))) (or ((_ is Undefined!3131) lt!159037) ((_ is Found!3131) lt!159037) (not ((_ is MissingZero!3131) lt!159037)) (and (bvsge (index!14703 lt!159037) #b00000000000000000000000000000000) (bvslt (index!14703 lt!159037) (size!8463 _keys!1895)))) (or ((_ is Undefined!3131) lt!159037) ((_ is Found!3131) lt!159037) ((_ is MissingZero!3131) lt!159037) (not ((_ is MissingVacant!3131) lt!159037)) (and (bvsge (index!14706 lt!159037) #b00000000000000000000000000000000) (bvslt (index!14706 lt!159037) (size!8463 _keys!1895)))) (or ((_ is Undefined!3131) lt!159037) (ite ((_ is Found!3131) lt!159037) (= (select (arr!8110 _keys!1895) (index!14704 lt!159037)) k0!1348) (ite ((_ is MissingZero!3131) lt!159037) (= (select (arr!8110 _keys!1895) (index!14703 lt!159037)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3131) lt!159037) (= (select (arr!8110 _keys!1895) (index!14706 lt!159037)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!204492 () SeekEntryResult!3131)

(assert (=> d!70377 (= lt!159037 e!204492)))

(declare-fun c!52094 () Bool)

(assert (=> d!70377 (= c!52094 (and ((_ is Intermediate!3131) lt!159039) (undefined!3943 lt!159039)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17157 (_ BitVec 32)) SeekEntryResult!3131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70377 (= lt!159039 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70377 (validMask!0 mask!2385)))

(assert (=> d!70377 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!159037)))

(declare-fun b!333043 () Bool)

(assert (=> b!333043 (= e!204492 Undefined!3131)))

(declare-fun b!333044 () Bool)

(assert (=> b!333044 (= e!204493 (MissingZero!3131 (index!14705 lt!159039)))))

(declare-fun b!333045 () Bool)

(assert (=> b!333045 (= e!204492 e!204491)))

(assert (=> b!333045 (= lt!159038 (select (arr!8110 _keys!1895) (index!14705 lt!159039)))))

(declare-fun c!52092 () Bool)

(assert (=> b!333045 (= c!52092 (= lt!159038 k0!1348))))

(declare-fun b!333046 () Bool)

(assert (=> b!333046 (= e!204491 (Found!3131 (index!14705 lt!159039)))))

(assert (= (and d!70377 c!52094) b!333043))

(assert (= (and d!70377 (not c!52094)) b!333045))

(assert (= (and b!333045 c!52092) b!333046))

(assert (= (and b!333045 (not c!52092)) b!333042))

(assert (= (and b!333042 c!52093) b!333044))

(assert (= (and b!333042 (not c!52093)) b!333041))

(declare-fun m!336877 () Bool)

(assert (=> b!333041 m!336877))

(declare-fun m!336879 () Bool)

(assert (=> d!70377 m!336879))

(declare-fun m!336881 () Bool)

(assert (=> d!70377 m!336881))

(declare-fun m!336883 () Bool)

(assert (=> d!70377 m!336883))

(assert (=> d!70377 m!336813))

(declare-fun m!336885 () Bool)

(assert (=> d!70377 m!336885))

(assert (=> d!70377 m!336881))

(declare-fun m!336887 () Bool)

(assert (=> d!70377 m!336887))

(declare-fun m!336889 () Bool)

(assert (=> b!333045 m!336889))

(assert (=> b!332972 d!70377))

(declare-fun b!333057 () Bool)

(declare-fun e!204502 () Bool)

(declare-fun call!26246 () Bool)

(assert (=> b!333057 (= e!204502 call!26246)))

(declare-fun bm!26243 () Bool)

(declare-fun c!52097 () Bool)

(assert (=> bm!26243 (= call!26246 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52097 (Cons!4581 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000) Nil!4582) Nil!4582)))))

(declare-fun b!333058 () Bool)

(assert (=> b!333058 (= e!204502 call!26246)))

(declare-fun b!333059 () Bool)

(declare-fun e!204505 () Bool)

(declare-fun contains!1996 (List!4585 (_ BitVec 64)) Bool)

(assert (=> b!333059 (= e!204505 (contains!1996 Nil!4582 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70379 () Bool)

(declare-fun res!183494 () Bool)

(declare-fun e!204503 () Bool)

(assert (=> d!70379 (=> res!183494 e!204503)))

(assert (=> d!70379 (= res!183494 (bvsge #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(assert (=> d!70379 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4582) e!204503)))

(declare-fun b!333060 () Bool)

(declare-fun e!204504 () Bool)

(assert (=> b!333060 (= e!204503 e!204504)))

(declare-fun res!183492 () Bool)

(assert (=> b!333060 (=> (not res!183492) (not e!204504))))

(assert (=> b!333060 (= res!183492 (not e!204505))))

(declare-fun res!183493 () Bool)

(assert (=> b!333060 (=> (not res!183493) (not e!204505))))

(assert (=> b!333060 (= res!183493 (validKeyInArray!0 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333061 () Bool)

(assert (=> b!333061 (= e!204504 e!204502)))

(assert (=> b!333061 (= c!52097 (validKeyInArray!0 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70379 (not res!183494)) b!333060))

(assert (= (and b!333060 res!183493) b!333059))

(assert (= (and b!333060 res!183492) b!333061))

(assert (= (and b!333061 c!52097) b!333057))

(assert (= (and b!333061 (not c!52097)) b!333058))

(assert (= (or b!333057 b!333058) bm!26243))

(declare-fun m!336891 () Bool)

(assert (=> bm!26243 m!336891))

(declare-fun m!336893 () Bool)

(assert (=> bm!26243 m!336893))

(assert (=> b!333059 m!336891))

(assert (=> b!333059 m!336891))

(declare-fun m!336895 () Bool)

(assert (=> b!333059 m!336895))

(assert (=> b!333060 m!336891))

(assert (=> b!333060 m!336891))

(declare-fun m!336897 () Bool)

(assert (=> b!333060 m!336897))

(assert (=> b!333061 m!336891))

(assert (=> b!333061 m!336891))

(assert (=> b!333061 m!336897))

(assert (=> b!332973 d!70379))

(declare-fun d!70381 () Bool)

(assert (=> d!70381 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332974 d!70381))

(declare-fun d!70383 () Bool)

(assert (=> d!70383 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33568 d!70383))

(declare-fun d!70385 () Bool)

(assert (=> d!70385 (= (array_inv!6048 _values!1525) (bvsge (size!8462 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33568 d!70385))

(declare-fun d!70387 () Bool)

(assert (=> d!70387 (= (array_inv!6049 _keys!1895) (bvsge (size!8463 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33568 d!70387))

(declare-fun d!70389 () Bool)

(declare-fun e!204511 () Bool)

(assert (=> d!70389 e!204511))

(declare-fun res!183497 () Bool)

(assert (=> d!70389 (=> res!183497 e!204511)))

(declare-fun lt!159049 () Bool)

(assert (=> d!70389 (= res!183497 (not lt!159049))))

(declare-fun lt!159050 () Bool)

(assert (=> d!70389 (= lt!159049 lt!159050)))

(declare-datatypes ((Unit!10346 0))(
  ( (Unit!10347) )
))
(declare-fun lt!159051 () Unit!10346)

(declare-fun e!204510 () Unit!10346)

(assert (=> d!70389 (= lt!159051 e!204510)))

(declare-fun c!52100 () Bool)

(assert (=> d!70389 (= c!52100 lt!159050)))

(declare-fun containsKey!313 (List!4584 (_ BitVec 64)) Bool)

(assert (=> d!70389 (= lt!159050 (containsKey!313 (toList!1940 (getCurrentListMap!1449 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70389 (= (contains!1994 (getCurrentListMap!1449 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159049)))

(declare-fun b!333068 () Bool)

(declare-fun lt!159048 () Unit!10346)

(assert (=> b!333068 (= e!204510 lt!159048)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!262 (List!4584 (_ BitVec 64)) Unit!10346)

(assert (=> b!333068 (= lt!159048 (lemmaContainsKeyImpliesGetValueByKeyDefined!262 (toList!1940 (getCurrentListMap!1449 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!327 0))(
  ( (Some!326 (v!5596 V!10027)) (None!325) )
))
(declare-fun isDefined!263 (Option!327) Bool)

(declare-fun getValueByKey!321 (List!4584 (_ BitVec 64)) Option!327)

(assert (=> b!333068 (isDefined!263 (getValueByKey!321 (toList!1940 (getCurrentListMap!1449 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!333069 () Bool)

(declare-fun Unit!10348 () Unit!10346)

(assert (=> b!333069 (= e!204510 Unit!10348)))

(declare-fun b!333070 () Bool)

(assert (=> b!333070 (= e!204511 (isDefined!263 (getValueByKey!321 (toList!1940 (getCurrentListMap!1449 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70389 c!52100) b!333068))

(assert (= (and d!70389 (not c!52100)) b!333069))

(assert (= (and d!70389 (not res!183497)) b!333070))

(declare-fun m!336899 () Bool)

(assert (=> d!70389 m!336899))

(declare-fun m!336901 () Bool)

(assert (=> b!333068 m!336901))

(declare-fun m!336903 () Bool)

(assert (=> b!333068 m!336903))

(assert (=> b!333068 m!336903))

(declare-fun m!336905 () Bool)

(assert (=> b!333068 m!336905))

(assert (=> b!333070 m!336903))

(assert (=> b!333070 m!336903))

(assert (=> b!333070 m!336905))

(assert (=> b!332967 d!70389))

(declare-fun b!333113 () Bool)

(declare-fun e!204542 () Unit!10346)

(declare-fun Unit!10349 () Unit!10346)

(assert (=> b!333113 (= e!204542 Unit!10349)))

(declare-fun call!26262 () ListLongMap!3849)

(declare-fun bm!26258 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!581 (array!17157 array!17155 (_ BitVec 32) (_ BitVec 32) V!10027 V!10027 (_ BitVec 32) Int) ListLongMap!3849)

(assert (=> bm!26258 (= call!26262 (getCurrentListMapNoExtraKeys!581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!333115 () Bool)

(declare-fun e!204538 () ListLongMap!3849)

(declare-fun call!26267 () ListLongMap!3849)

(assert (=> b!333115 (= e!204538 call!26267)))

(declare-fun b!333116 () Bool)

(declare-fun e!204543 () Bool)

(declare-fun lt!159115 () ListLongMap!3849)

(declare-fun apply!265 (ListLongMap!3849 (_ BitVec 64)) V!10027)

(assert (=> b!333116 (= e!204543 (= (apply!265 lt!159115 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!333117 () Bool)

(declare-fun e!204544 () Bool)

(assert (=> b!333117 (= e!204544 e!204543)))

(declare-fun res!183516 () Bool)

(declare-fun call!26261 () Bool)

(assert (=> b!333117 (= res!183516 call!26261)))

(assert (=> b!333117 (=> (not res!183516) (not e!204543))))

(declare-fun bm!26259 () Bool)

(declare-fun call!26265 () Bool)

(assert (=> bm!26259 (= call!26265 (contains!1994 lt!159115 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!333118 () Bool)

(declare-fun res!183522 () Bool)

(declare-fun e!204541 () Bool)

(assert (=> b!333118 (=> (not res!183522) (not e!204541))))

(assert (=> b!333118 (= res!183522 e!204544)))

(declare-fun c!52118 () Bool)

(assert (=> b!333118 (= c!52118 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!333119 () Bool)

(assert (=> b!333119 (= e!204544 (not call!26261))))

(declare-fun b!333120 () Bool)

(declare-fun res!183523 () Bool)

(assert (=> b!333120 (=> (not res!183523) (not e!204541))))

(declare-fun e!204548 () Bool)

(assert (=> b!333120 (= res!183523 e!204548)))

(declare-fun res!183520 () Bool)

(assert (=> b!333120 (=> res!183520 e!204548)))

(declare-fun e!204550 () Bool)

(assert (=> b!333120 (= res!183520 (not e!204550))))

(declare-fun res!183518 () Bool)

(assert (=> b!333120 (=> (not res!183518) (not e!204550))))

(assert (=> b!333120 (= res!183518 (bvslt #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(declare-fun b!333114 () Bool)

(declare-fun e!204539 () Bool)

(assert (=> b!333114 (= e!204539 (= (apply!265 lt!159115 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun d!70391 () Bool)

(assert (=> d!70391 e!204541))

(declare-fun res!183517 () Bool)

(assert (=> d!70391 (=> (not res!183517) (not e!204541))))

(assert (=> d!70391 (= res!183517 (or (bvsge #b00000000000000000000000000000000 (size!8463 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8463 _keys!1895)))))))

(declare-fun lt!159112 () ListLongMap!3849)

(assert (=> d!70391 (= lt!159115 lt!159112)))

(declare-fun lt!159102 () Unit!10346)

(assert (=> d!70391 (= lt!159102 e!204542)))

(declare-fun c!52114 () Bool)

(declare-fun e!204546 () Bool)

(assert (=> d!70391 (= c!52114 e!204546)))

(declare-fun res!183521 () Bool)

(assert (=> d!70391 (=> (not res!183521) (not e!204546))))

(assert (=> d!70391 (= res!183521 (bvslt #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(declare-fun e!204545 () ListLongMap!3849)

(assert (=> d!70391 (= lt!159112 e!204545)))

(declare-fun c!52115 () Bool)

(assert (=> d!70391 (= c!52115 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70391 (validMask!0 mask!2385)))

(assert (=> d!70391 (= (getCurrentListMap!1449 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!159115)))

(declare-fun c!52117 () Bool)

(declare-fun call!26263 () ListLongMap!3849)

(declare-fun bm!26260 () Bool)

(declare-fun call!26266 () ListLongMap!3849)

(declare-fun call!26264 () ListLongMap!3849)

(declare-fun +!718 (ListLongMap!3849 tuple2!4946) ListLongMap!3849)

(assert (=> bm!26260 (= call!26264 (+!718 (ite c!52115 call!26262 (ite c!52117 call!26263 call!26266)) (ite (or c!52115 c!52117) (tuple2!4947 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!4947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun e!204549 () Bool)

(declare-fun b!333121 () Bool)

(declare-fun get!4467 (ValueCell!3050 V!10027) V!10027)

(declare-fun dynLambda!599 (Int (_ BitVec 64)) V!10027)

(assert (=> b!333121 (= e!204549 (= (apply!265 lt!159115 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000)) (get!4467 (select (arr!8109 _values!1525) #b00000000000000000000000000000000) (dynLambda!599 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!333121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8462 _values!1525)))))

(assert (=> b!333121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(declare-fun b!333122 () Bool)

(assert (=> b!333122 (= e!204538 call!26266)))

(declare-fun b!333123 () Bool)

(declare-fun e!204547 () ListLongMap!3849)

(assert (=> b!333123 (= e!204547 call!26267)))

(declare-fun b!333124 () Bool)

(declare-fun c!52113 () Bool)

(assert (=> b!333124 (= c!52113 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!333124 (= e!204547 e!204538)))

(declare-fun b!333125 () Bool)

(assert (=> b!333125 (= e!204548 e!204549)))

(declare-fun res!183519 () Bool)

(assert (=> b!333125 (=> (not res!183519) (not e!204549))))

(assert (=> b!333125 (= res!183519 (contains!1994 lt!159115 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!333125 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(declare-fun b!333126 () Bool)

(declare-fun e!204540 () Bool)

(assert (=> b!333126 (= e!204541 e!204540)))

(declare-fun c!52116 () Bool)

(assert (=> b!333126 (= c!52116 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!333127 () Bool)

(assert (=> b!333127 (= e!204545 e!204547)))

(assert (=> b!333127 (= c!52117 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!333128 () Bool)

(assert (=> b!333128 (= e!204540 (not call!26265))))

(declare-fun bm!26261 () Bool)

(assert (=> bm!26261 (= call!26266 call!26263)))

(declare-fun b!333129 () Bool)

(assert (=> b!333129 (= e!204545 (+!718 call!26264 (tuple2!4947 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26262 () Bool)

(assert (=> bm!26262 (= call!26263 call!26262)))

(declare-fun b!333130 () Bool)

(assert (=> b!333130 (= e!204550 (validKeyInArray!0 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333131 () Bool)

(declare-fun lt!159110 () Unit!10346)

(assert (=> b!333131 (= e!204542 lt!159110)))

(declare-fun lt!159113 () ListLongMap!3849)

(assert (=> b!333131 (= lt!159113 (getCurrentListMapNoExtraKeys!581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159101 () (_ BitVec 64))

(assert (=> b!333131 (= lt!159101 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159103 () (_ BitVec 64))

(assert (=> b!333131 (= lt!159103 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159098 () Unit!10346)

(declare-fun addStillContains!241 (ListLongMap!3849 (_ BitVec 64) V!10027 (_ BitVec 64)) Unit!10346)

(assert (=> b!333131 (= lt!159098 (addStillContains!241 lt!159113 lt!159101 zeroValue!1467 lt!159103))))

(assert (=> b!333131 (contains!1994 (+!718 lt!159113 (tuple2!4947 lt!159101 zeroValue!1467)) lt!159103)))

(declare-fun lt!159107 () Unit!10346)

(assert (=> b!333131 (= lt!159107 lt!159098)))

(declare-fun lt!159100 () ListLongMap!3849)

(assert (=> b!333131 (= lt!159100 (getCurrentListMapNoExtraKeys!581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159105 () (_ BitVec 64))

(assert (=> b!333131 (= lt!159105 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159104 () (_ BitVec 64))

(assert (=> b!333131 (= lt!159104 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159117 () Unit!10346)

(declare-fun addApplyDifferent!241 (ListLongMap!3849 (_ BitVec 64) V!10027 (_ BitVec 64)) Unit!10346)

(assert (=> b!333131 (= lt!159117 (addApplyDifferent!241 lt!159100 lt!159105 minValue!1467 lt!159104))))

(assert (=> b!333131 (= (apply!265 (+!718 lt!159100 (tuple2!4947 lt!159105 minValue!1467)) lt!159104) (apply!265 lt!159100 lt!159104))))

(declare-fun lt!159114 () Unit!10346)

(assert (=> b!333131 (= lt!159114 lt!159117)))

(declare-fun lt!159097 () ListLongMap!3849)

(assert (=> b!333131 (= lt!159097 (getCurrentListMapNoExtraKeys!581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159106 () (_ BitVec 64))

(assert (=> b!333131 (= lt!159106 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159116 () (_ BitVec 64))

(assert (=> b!333131 (= lt!159116 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159111 () Unit!10346)

(assert (=> b!333131 (= lt!159111 (addApplyDifferent!241 lt!159097 lt!159106 zeroValue!1467 lt!159116))))

(assert (=> b!333131 (= (apply!265 (+!718 lt!159097 (tuple2!4947 lt!159106 zeroValue!1467)) lt!159116) (apply!265 lt!159097 lt!159116))))

(declare-fun lt!159096 () Unit!10346)

(assert (=> b!333131 (= lt!159096 lt!159111)))

(declare-fun lt!159108 () ListLongMap!3849)

(assert (=> b!333131 (= lt!159108 (getCurrentListMapNoExtraKeys!581 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159099 () (_ BitVec 64))

(assert (=> b!333131 (= lt!159099 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159109 () (_ BitVec 64))

(assert (=> b!333131 (= lt!159109 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!333131 (= lt!159110 (addApplyDifferent!241 lt!159108 lt!159099 minValue!1467 lt!159109))))

(assert (=> b!333131 (= (apply!265 (+!718 lt!159108 (tuple2!4947 lt!159099 minValue!1467)) lt!159109) (apply!265 lt!159108 lt!159109))))

(declare-fun bm!26263 () Bool)

(assert (=> bm!26263 (= call!26267 call!26264)))

(declare-fun bm!26264 () Bool)

(assert (=> bm!26264 (= call!26261 (contains!1994 lt!159115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!333132 () Bool)

(assert (=> b!333132 (= e!204540 e!204539)))

(declare-fun res!183524 () Bool)

(assert (=> b!333132 (= res!183524 call!26265)))

(assert (=> b!333132 (=> (not res!183524) (not e!204539))))

(declare-fun b!333133 () Bool)

(assert (=> b!333133 (= e!204546 (validKeyInArray!0 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70391 c!52115) b!333129))

(assert (= (and d!70391 (not c!52115)) b!333127))

(assert (= (and b!333127 c!52117) b!333123))

(assert (= (and b!333127 (not c!52117)) b!333124))

(assert (= (and b!333124 c!52113) b!333115))

(assert (= (and b!333124 (not c!52113)) b!333122))

(assert (= (or b!333115 b!333122) bm!26261))

(assert (= (or b!333123 bm!26261) bm!26262))

(assert (= (or b!333123 b!333115) bm!26263))

(assert (= (or b!333129 bm!26262) bm!26258))

(assert (= (or b!333129 bm!26263) bm!26260))

(assert (= (and d!70391 res!183521) b!333133))

(assert (= (and d!70391 c!52114) b!333131))

(assert (= (and d!70391 (not c!52114)) b!333113))

(assert (= (and d!70391 res!183517) b!333120))

(assert (= (and b!333120 res!183518) b!333130))

(assert (= (and b!333120 (not res!183520)) b!333125))

(assert (= (and b!333125 res!183519) b!333121))

(assert (= (and b!333120 res!183523) b!333118))

(assert (= (and b!333118 c!52118) b!333117))

(assert (= (and b!333118 (not c!52118)) b!333119))

(assert (= (and b!333117 res!183516) b!333116))

(assert (= (or b!333117 b!333119) bm!26264))

(assert (= (and b!333118 res!183522) b!333126))

(assert (= (and b!333126 c!52116) b!333132))

(assert (= (and b!333126 (not c!52116)) b!333128))

(assert (= (and b!333132 res!183524) b!333114))

(assert (= (or b!333132 b!333128) bm!26259))

(declare-fun b_lambda!8381 () Bool)

(assert (=> (not b_lambda!8381) (not b!333121)))

(declare-fun t!9666 () Bool)

(declare-fun tb!3037 () Bool)

(assert (=> (and start!33568 (= defaultEntry!1528 defaultEntry!1528) t!9666) tb!3037))

(declare-fun result!5457 () Bool)

(assert (=> tb!3037 (= result!5457 tp_is_empty!6787)))

(assert (=> b!333121 t!9666))

(declare-fun b_and!13993 () Bool)

(assert (= b_and!13987 (and (=> t!9666 result!5457) b_and!13993)))

(declare-fun m!336907 () Bool)

(assert (=> bm!26258 m!336907))

(assert (=> b!333125 m!336891))

(assert (=> b!333125 m!336891))

(declare-fun m!336909 () Bool)

(assert (=> b!333125 m!336909))

(assert (=> b!333133 m!336891))

(assert (=> b!333133 m!336891))

(assert (=> b!333133 m!336897))

(declare-fun m!336911 () Bool)

(assert (=> bm!26264 m!336911))

(declare-fun m!336913 () Bool)

(assert (=> b!333131 m!336913))

(declare-fun m!336915 () Bool)

(assert (=> b!333131 m!336915))

(declare-fun m!336917 () Bool)

(assert (=> b!333131 m!336917))

(declare-fun m!336919 () Bool)

(assert (=> b!333131 m!336919))

(assert (=> b!333131 m!336891))

(declare-fun m!336921 () Bool)

(assert (=> b!333131 m!336921))

(declare-fun m!336923 () Bool)

(assert (=> b!333131 m!336923))

(declare-fun m!336925 () Bool)

(assert (=> b!333131 m!336925))

(assert (=> b!333131 m!336923))

(assert (=> b!333131 m!336907))

(declare-fun m!336927 () Bool)

(assert (=> b!333131 m!336927))

(declare-fun m!336929 () Bool)

(assert (=> b!333131 m!336929))

(declare-fun m!336931 () Bool)

(assert (=> b!333131 m!336931))

(declare-fun m!336933 () Bool)

(assert (=> b!333131 m!336933))

(assert (=> b!333131 m!336927))

(declare-fun m!336935 () Bool)

(assert (=> b!333131 m!336935))

(declare-fun m!336937 () Bool)

(assert (=> b!333131 m!336937))

(declare-fun m!336939 () Bool)

(assert (=> b!333131 m!336939))

(declare-fun m!336941 () Bool)

(assert (=> b!333131 m!336941))

(assert (=> b!333131 m!336929))

(assert (=> b!333131 m!336917))

(declare-fun m!336943 () Bool)

(assert (=> b!333129 m!336943))

(assert (=> d!70391 m!336813))

(declare-fun m!336945 () Bool)

(assert (=> bm!26259 m!336945))

(assert (=> b!333130 m!336891))

(assert (=> b!333130 m!336891))

(assert (=> b!333130 m!336897))

(declare-fun m!336947 () Bool)

(assert (=> b!333121 m!336947))

(assert (=> b!333121 m!336891))

(declare-fun m!336949 () Bool)

(assert (=> b!333121 m!336949))

(assert (=> b!333121 m!336947))

(assert (=> b!333121 m!336949))

(declare-fun m!336951 () Bool)

(assert (=> b!333121 m!336951))

(assert (=> b!333121 m!336891))

(declare-fun m!336953 () Bool)

(assert (=> b!333121 m!336953))

(declare-fun m!336955 () Bool)

(assert (=> b!333116 m!336955))

(declare-fun m!336957 () Bool)

(assert (=> b!333114 m!336957))

(declare-fun m!336959 () Bool)

(assert (=> bm!26260 m!336959))

(assert (=> b!332967 d!70391))

(declare-fun b!333144 () Bool)

(declare-fun e!204558 () Bool)

(declare-fun e!204559 () Bool)

(assert (=> b!333144 (= e!204558 e!204559)))

(declare-fun c!52121 () Bool)

(assert (=> b!333144 (= c!52121 (validKeyInArray!0 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333145 () Bool)

(declare-fun e!204557 () Bool)

(assert (=> b!333145 (= e!204559 e!204557)))

(declare-fun lt!159124 () (_ BitVec 64))

(assert (=> b!333145 (= lt!159124 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159125 () Unit!10346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17157 (_ BitVec 64) (_ BitVec 32)) Unit!10346)

(assert (=> b!333145 (= lt!159125 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159124 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333145 (arrayContainsKey!0 _keys!1895 lt!159124 #b00000000000000000000000000000000)))

(declare-fun lt!159126 () Unit!10346)

(assert (=> b!333145 (= lt!159126 lt!159125)))

(declare-fun res!183530 () Bool)

(assert (=> b!333145 (= res!183530 (= (seekEntryOrOpen!0 (select (arr!8110 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3131 #b00000000000000000000000000000000)))))

(assert (=> b!333145 (=> (not res!183530) (not e!204557))))

(declare-fun d!70393 () Bool)

(declare-fun res!183529 () Bool)

(assert (=> d!70393 (=> res!183529 e!204558)))

(assert (=> d!70393 (= res!183529 (bvsge #b00000000000000000000000000000000 (size!8463 _keys!1895)))))

(assert (=> d!70393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204558)))

(declare-fun bm!26267 () Bool)

(declare-fun call!26270 () Bool)

(assert (=> bm!26267 (= call!26270 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!333146 () Bool)

(assert (=> b!333146 (= e!204557 call!26270)))

(declare-fun b!333147 () Bool)

(assert (=> b!333147 (= e!204559 call!26270)))

(assert (= (and d!70393 (not res!183529)) b!333144))

(assert (= (and b!333144 c!52121) b!333145))

(assert (= (and b!333144 (not c!52121)) b!333147))

(assert (= (and b!333145 res!183530) b!333146))

(assert (= (or b!333146 b!333147) bm!26267))

(assert (=> b!333144 m!336891))

(assert (=> b!333144 m!336891))

(assert (=> b!333144 m!336897))

(assert (=> b!333145 m!336891))

(declare-fun m!336961 () Bool)

(assert (=> b!333145 m!336961))

(declare-fun m!336963 () Bool)

(assert (=> b!333145 m!336963))

(assert (=> b!333145 m!336891))

(declare-fun m!336965 () Bool)

(assert (=> b!333145 m!336965))

(declare-fun m!336967 () Bool)

(assert (=> bm!26267 m!336967))

(assert (=> b!332971 d!70393))

(declare-fun b!333155 () Bool)

(declare-fun e!204565 () Bool)

(assert (=> b!333155 (= e!204565 tp_is_empty!6787)))

(declare-fun mapIsEmpty!11583 () Bool)

(declare-fun mapRes!11583 () Bool)

(assert (=> mapIsEmpty!11583 mapRes!11583))

(declare-fun b!333154 () Bool)

(declare-fun e!204564 () Bool)

(assert (=> b!333154 (= e!204564 tp_is_empty!6787)))

(declare-fun mapNonEmpty!11583 () Bool)

(declare-fun tp!24021 () Bool)

(assert (=> mapNonEmpty!11583 (= mapRes!11583 (and tp!24021 e!204564))))

(declare-fun mapValue!11583 () ValueCell!3050)

(declare-fun mapRest!11583 () (Array (_ BitVec 32) ValueCell!3050))

(declare-fun mapKey!11583 () (_ BitVec 32))

(assert (=> mapNonEmpty!11583 (= mapRest!11574 (store mapRest!11583 mapKey!11583 mapValue!11583))))

(declare-fun condMapEmpty!11583 () Bool)

(declare-fun mapDefault!11583 () ValueCell!3050)

(assert (=> mapNonEmpty!11574 (= condMapEmpty!11583 (= mapRest!11574 ((as const (Array (_ BitVec 32) ValueCell!3050)) mapDefault!11583)))))

(assert (=> mapNonEmpty!11574 (= tp!24006 (and e!204565 mapRes!11583))))

(assert (= (and mapNonEmpty!11574 condMapEmpty!11583) mapIsEmpty!11583))

(assert (= (and mapNonEmpty!11574 (not condMapEmpty!11583)) mapNonEmpty!11583))

(assert (= (and mapNonEmpty!11583 ((_ is ValueCellFull!3050) mapValue!11583)) b!333154))

(assert (= (and mapNonEmpty!11574 ((_ is ValueCellFull!3050) mapDefault!11583)) b!333155))

(declare-fun m!336969 () Bool)

(assert (=> mapNonEmpty!11583 m!336969))

(declare-fun b_lambda!8383 () Bool)

(assert (= b_lambda!8381 (or (and start!33568 b_free!6835) b_lambda!8383)))

(check-sat (not b!333060) (not d!70389) (not bm!26258) (not b!333131) (not b!333144) (not b!333070) (not b!333133) (not b!333129) (not bm!26267) (not b!333125) (not mapNonEmpty!11583) (not b_lambda!8383) (not b!333116) (not b!333059) tp_is_empty!6787 (not bm!26260) (not b!333114) (not b!333068) (not b!333130) (not b!333061) (not d!70391) (not b!333121) (not bm!26259) b_and!13993 (not bm!26243) (not d!70377) (not b!333145) (not bm!26264) (not b!333041) (not b_next!6835))
(check-sat b_and!13993 (not b_next!6835))
