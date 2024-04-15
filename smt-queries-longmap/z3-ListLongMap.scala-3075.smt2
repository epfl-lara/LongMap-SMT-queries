; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43288 () Bool)

(assert start!43288)

(declare-fun b_free!12169 () Bool)

(declare-fun b_next!12169 () Bool)

(assert (=> start!43288 (= b_free!12169 (not b_next!12169))))

(declare-fun tp!42777 () Bool)

(declare-fun b_and!20895 () Bool)

(assert (=> start!43288 (= tp!42777 b_and!20895)))

(declare-fun mapIsEmpty!22219 () Bool)

(declare-fun mapRes!22219 () Bool)

(assert (=> mapIsEmpty!22219 mapRes!22219))

(declare-fun b!479478 () Bool)

(declare-fun res!286038 () Bool)

(declare-fun e!282110 () Bool)

(assert (=> b!479478 (=> (not res!286038) (not e!282110))))

(declare-datatypes ((array!31023 0))(
  ( (array!31024 (arr!14918 (Array (_ BitVec 32) (_ BitVec 64))) (size!15277 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31023)

(declare-datatypes ((List!9157 0))(
  ( (Nil!9154) (Cons!9153 (h!10009 (_ BitVec 64)) (t!15354 List!9157)) )
))
(declare-fun arrayNoDuplicates!0 (array!31023 (_ BitVec 32) List!9157) Bool)

(assert (=> b!479478 (= res!286038 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9154))))

(declare-fun b!479479 () Bool)

(declare-fun res!286037 () Bool)

(assert (=> b!479479 (=> (not res!286037) (not e!282110))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31023 (_ BitVec 32)) Bool)

(assert (=> b!479479 (= res!286037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479480 () Bool)

(declare-fun res!286040 () Bool)

(assert (=> b!479480 (=> (not res!286040) (not e!282110))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-datatypes ((V!19313 0))(
  ( (V!19314 (val!6888 Int)) )
))
(declare-fun minValue!1458 () V!19313)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6479 0))(
  ( (ValueCellFull!6479 (v!9171 V!19313)) (EmptyCell!6479) )
))
(declare-datatypes ((array!31025 0))(
  ( (array!31026 (arr!14919 (Array (_ BitVec 32) ValueCell!6479)) (size!15278 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31025)

(declare-fun defaultEntry!1519 () Int)

(declare-fun zeroValue!1458 () V!19313)

(declare-datatypes ((tuple2!9094 0))(
  ( (tuple2!9095 (_1!4558 (_ BitVec 64)) (_2!4558 V!19313)) )
))
(declare-datatypes ((List!9158 0))(
  ( (Nil!9155) (Cons!9154 (h!10010 tuple2!9094) (t!15355 List!9158)) )
))
(declare-datatypes ((ListLongMap!7997 0))(
  ( (ListLongMap!7998 (toList!4014 List!9158)) )
))
(declare-fun contains!2589 (ListLongMap!7997 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2267 (array!31023 array!31025 (_ BitVec 32) (_ BitVec 32) V!19313 V!19313 (_ BitVec 32) Int) ListLongMap!7997)

(assert (=> b!479480 (= res!286040 (contains!2589 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479481 () Bool)

(declare-fun e!282111 () Bool)

(declare-fun tp_is_empty!13681 () Bool)

(assert (=> b!479481 (= e!282111 tp_is_empty!13681)))

(declare-fun b!479482 () Bool)

(declare-fun res!286039 () Bool)

(assert (=> b!479482 (=> (not res!286039) (not e!282110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!479482 (= res!286039 (validKeyInArray!0 k0!1332))))

(declare-fun b!479483 () Bool)

(declare-fun e!282113 () Bool)

(assert (=> b!479483 (= e!282113 (and e!282111 mapRes!22219))))

(declare-fun condMapEmpty!22219 () Bool)

(declare-fun mapDefault!22219 () ValueCell!6479)

(assert (=> b!479483 (= condMapEmpty!22219 (= (arr!14919 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6479)) mapDefault!22219)))))

(declare-fun b!479484 () Bool)

(declare-fun res!286041 () Bool)

(assert (=> b!479484 (=> (not res!286041) (not e!282110))))

(assert (=> b!479484 (= res!286041 (and (= (size!15278 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15277 _keys!1874) (size!15278 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!286036 () Bool)

(assert (=> start!43288 (=> (not res!286036) (not e!282110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43288 (= res!286036 (validMask!0 mask!2352))))

(assert (=> start!43288 e!282110))

(assert (=> start!43288 true))

(assert (=> start!43288 tp_is_empty!13681))

(declare-fun array_inv!10858 (array!31025) Bool)

(assert (=> start!43288 (and (array_inv!10858 _values!1516) e!282113)))

(assert (=> start!43288 tp!42777))

(declare-fun array_inv!10859 (array!31023) Bool)

(assert (=> start!43288 (array_inv!10859 _keys!1874)))

(declare-fun mapNonEmpty!22219 () Bool)

(declare-fun tp!42778 () Bool)

(declare-fun e!282114 () Bool)

(assert (=> mapNonEmpty!22219 (= mapRes!22219 (and tp!42778 e!282114))))

(declare-fun mapValue!22219 () ValueCell!6479)

(declare-fun mapKey!22219 () (_ BitVec 32))

(declare-fun mapRest!22219 () (Array (_ BitVec 32) ValueCell!6479))

(assert (=> mapNonEmpty!22219 (= (arr!14919 _values!1516) (store mapRest!22219 mapKey!22219 mapValue!22219))))

(declare-fun b!479485 () Bool)

(assert (=> b!479485 (= e!282110 (not (and (bvslt #b00000000000000000000000000000000 (size!15277 _keys!1874)) (bvslt (size!15277 _keys!1874) #b01111111111111111111111111111111))))))

(declare-fun e!282112 () Bool)

(assert (=> b!479485 e!282112))

(declare-fun c!57608 () Bool)

(assert (=> b!479485 (= c!57608 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14048 0))(
  ( (Unit!14049) )
))
(declare-fun lt!217672 () Unit!14048)

(declare-fun lemmaKeyInListMapIsInArray!115 (array!31023 array!31025 (_ BitVec 32) (_ BitVec 32) V!19313 V!19313 (_ BitVec 64) Int) Unit!14048)

(assert (=> b!479485 (= lt!217672 (lemmaKeyInListMapIsInArray!115 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!479486 () Bool)

(assert (=> b!479486 (= e!282112 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!479487 () Bool)

(assert (=> b!479487 (= e!282114 tp_is_empty!13681)))

(declare-fun b!479488 () Bool)

(declare-fun arrayContainsKey!0 (array!31023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!479488 (= e!282112 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (= (and start!43288 res!286036) b!479484))

(assert (= (and b!479484 res!286041) b!479479))

(assert (= (and b!479479 res!286037) b!479478))

(assert (= (and b!479478 res!286038) b!479480))

(assert (= (and b!479480 res!286040) b!479482))

(assert (= (and b!479482 res!286039) b!479485))

(assert (= (and b!479485 c!57608) b!479488))

(assert (= (and b!479485 (not c!57608)) b!479486))

(assert (= (and b!479483 condMapEmpty!22219) mapIsEmpty!22219))

(assert (= (and b!479483 (not condMapEmpty!22219)) mapNonEmpty!22219))

(get-info :version)

(assert (= (and mapNonEmpty!22219 ((_ is ValueCellFull!6479) mapValue!22219)) b!479487))

(assert (= (and b!479483 ((_ is ValueCellFull!6479) mapDefault!22219)) b!479481))

(assert (= start!43288 b!479483))

(declare-fun m!460881 () Bool)

(assert (=> mapNonEmpty!22219 m!460881))

(declare-fun m!460883 () Bool)

(assert (=> b!479482 m!460883))

(declare-fun m!460885 () Bool)

(assert (=> b!479479 m!460885))

(declare-fun m!460887 () Bool)

(assert (=> b!479485 m!460887))

(declare-fun m!460889 () Bool)

(assert (=> b!479478 m!460889))

(declare-fun m!460891 () Bool)

(assert (=> b!479480 m!460891))

(assert (=> b!479480 m!460891))

(declare-fun m!460893 () Bool)

(assert (=> b!479480 m!460893))

(declare-fun m!460895 () Bool)

(assert (=> start!43288 m!460895))

(declare-fun m!460897 () Bool)

(assert (=> start!43288 m!460897))

(declare-fun m!460899 () Bool)

(assert (=> start!43288 m!460899))

(declare-fun m!460901 () Bool)

(assert (=> b!479488 m!460901))

(check-sat (not b!479488) (not b!479478) (not mapNonEmpty!22219) (not b!479480) (not b!479482) tp_is_empty!13681 (not b!479485) (not b_next!12169) b_and!20895 (not b!479479) (not start!43288))
(check-sat b_and!20895 (not b_next!12169))
(get-model)

(declare-fun d!76479 () Bool)

(declare-fun e!282153 () Bool)

(assert (=> d!76479 e!282153))

(declare-fun c!57617 () Bool)

(assert (=> d!76479 (= c!57617 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!217681 () Unit!14048)

(declare-fun choose!1382 (array!31023 array!31025 (_ BitVec 32) (_ BitVec 32) V!19313 V!19313 (_ BitVec 64) Int) Unit!14048)

(assert (=> d!76479 (= lt!217681 (choose!1382 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76479 (validMask!0 mask!2352)))

(assert (=> d!76479 (= (lemmaKeyInListMapIsInArray!115 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!217681)))

(declare-fun b!479559 () Bool)

(assert (=> b!479559 (= e!282153 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479560 () Bool)

(assert (=> b!479560 (= e!282153 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76479 c!57617) b!479559))

(assert (= (and d!76479 (not c!57617)) b!479560))

(declare-fun m!460947 () Bool)

(assert (=> d!76479 m!460947))

(assert (=> d!76479 m!460895))

(assert (=> b!479559 m!460901))

(assert (=> b!479485 d!76479))

(declare-fun d!76481 () Bool)

(assert (=> d!76481 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!479482 d!76481))

(declare-fun d!76483 () Bool)

(declare-fun res!286082 () Bool)

(declare-fun e!282158 () Bool)

(assert (=> d!76483 (=> res!286082 e!282158)))

(assert (=> d!76483 (= res!286082 (= (select (arr!14918 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76483 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!282158)))

(declare-fun b!479565 () Bool)

(declare-fun e!282159 () Bool)

(assert (=> b!479565 (= e!282158 e!282159)))

(declare-fun res!286083 () Bool)

(assert (=> b!479565 (=> (not res!286083) (not e!282159))))

(assert (=> b!479565 (= res!286083 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15277 _keys!1874)))))

(declare-fun b!479566 () Bool)

(assert (=> b!479566 (= e!282159 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76483 (not res!286082)) b!479565))

(assert (= (and b!479565 res!286083) b!479566))

(declare-fun m!460949 () Bool)

(assert (=> d!76483 m!460949))

(declare-fun m!460951 () Bool)

(assert (=> b!479566 m!460951))

(assert (=> b!479488 d!76483))

(declare-fun b!479577 () Bool)

(declare-fun e!282171 () Bool)

(declare-fun call!30825 () Bool)

(assert (=> b!479577 (= e!282171 call!30825)))

(declare-fun b!479578 () Bool)

(declare-fun e!282170 () Bool)

(declare-fun e!282168 () Bool)

(assert (=> b!479578 (= e!282170 e!282168)))

(declare-fun res!286092 () Bool)

(assert (=> b!479578 (=> (not res!286092) (not e!282168))))

(declare-fun e!282169 () Bool)

(assert (=> b!479578 (= res!286092 (not e!282169))))

(declare-fun res!286091 () Bool)

(assert (=> b!479578 (=> (not res!286091) (not e!282169))))

(assert (=> b!479578 (= res!286091 (validKeyInArray!0 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479579 () Bool)

(assert (=> b!479579 (= e!282171 call!30825)))

(declare-fun b!479580 () Bool)

(declare-fun contains!2590 (List!9157 (_ BitVec 64)) Bool)

(assert (=> b!479580 (= e!282169 (contains!2590 Nil!9154 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30822 () Bool)

(declare-fun c!57620 () Bool)

(assert (=> bm!30822 (= call!30825 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57620 (Cons!9153 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000) Nil!9154) Nil!9154)))))

(declare-fun d!76485 () Bool)

(declare-fun res!286090 () Bool)

(assert (=> d!76485 (=> res!286090 e!282170)))

(assert (=> d!76485 (= res!286090 (bvsge #b00000000000000000000000000000000 (size!15277 _keys!1874)))))

(assert (=> d!76485 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9154) e!282170)))

(declare-fun b!479581 () Bool)

(assert (=> b!479581 (= e!282168 e!282171)))

(assert (=> b!479581 (= c!57620 (validKeyInArray!0 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76485 (not res!286090)) b!479578))

(assert (= (and b!479578 res!286091) b!479580))

(assert (= (and b!479578 res!286092) b!479581))

(assert (= (and b!479581 c!57620) b!479577))

(assert (= (and b!479581 (not c!57620)) b!479579))

(assert (= (or b!479577 b!479579) bm!30822))

(assert (=> b!479578 m!460949))

(assert (=> b!479578 m!460949))

(declare-fun m!460953 () Bool)

(assert (=> b!479578 m!460953))

(assert (=> b!479580 m!460949))

(assert (=> b!479580 m!460949))

(declare-fun m!460955 () Bool)

(assert (=> b!479580 m!460955))

(assert (=> bm!30822 m!460949))

(declare-fun m!460957 () Bool)

(assert (=> bm!30822 m!460957))

(assert (=> b!479581 m!460949))

(assert (=> b!479581 m!460949))

(assert (=> b!479581 m!460953))

(assert (=> b!479478 d!76485))

(declare-fun d!76487 () Bool)

(assert (=> d!76487 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43288 d!76487))

(declare-fun d!76489 () Bool)

(assert (=> d!76489 (= (array_inv!10858 _values!1516) (bvsge (size!15278 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43288 d!76489))

(declare-fun d!76491 () Bool)

(assert (=> d!76491 (= (array_inv!10859 _keys!1874) (bvsge (size!15277 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43288 d!76491))

(declare-fun d!76493 () Bool)

(declare-fun e!282177 () Bool)

(assert (=> d!76493 e!282177))

(declare-fun res!286095 () Bool)

(assert (=> d!76493 (=> res!286095 e!282177)))

(declare-fun lt!217691 () Bool)

(assert (=> d!76493 (= res!286095 (not lt!217691))))

(declare-fun lt!217690 () Bool)

(assert (=> d!76493 (= lt!217691 lt!217690)))

(declare-fun lt!217693 () Unit!14048)

(declare-fun e!282176 () Unit!14048)

(assert (=> d!76493 (= lt!217693 e!282176)))

(declare-fun c!57623 () Bool)

(assert (=> d!76493 (= c!57623 lt!217690)))

(declare-fun containsKey!352 (List!9158 (_ BitVec 64)) Bool)

(assert (=> d!76493 (= lt!217690 (containsKey!352 (toList!4014 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76493 (= (contains!2589 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!217691)))

(declare-fun b!479588 () Bool)

(declare-fun lt!217692 () Unit!14048)

(assert (=> b!479588 (= e!282176 lt!217692)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!301 (List!9158 (_ BitVec 64)) Unit!14048)

(assert (=> b!479588 (= lt!217692 (lemmaContainsKeyImpliesGetValueByKeyDefined!301 (toList!4014 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!396 0))(
  ( (Some!395 (v!9174 V!19313)) (None!394) )
))
(declare-fun isDefined!302 (Option!396) Bool)

(declare-fun getValueByKey!390 (List!9158 (_ BitVec 64)) Option!396)

(assert (=> b!479588 (isDefined!302 (getValueByKey!390 (toList!4014 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!479589 () Bool)

(declare-fun Unit!14050 () Unit!14048)

(assert (=> b!479589 (= e!282176 Unit!14050)))

(declare-fun b!479590 () Bool)

(assert (=> b!479590 (= e!282177 (isDefined!302 (getValueByKey!390 (toList!4014 (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76493 c!57623) b!479588))

(assert (= (and d!76493 (not c!57623)) b!479589))

(assert (= (and d!76493 (not res!286095)) b!479590))

(declare-fun m!460959 () Bool)

(assert (=> d!76493 m!460959))

(declare-fun m!460961 () Bool)

(assert (=> b!479588 m!460961))

(declare-fun m!460963 () Bool)

(assert (=> b!479588 m!460963))

(assert (=> b!479588 m!460963))

(declare-fun m!460965 () Bool)

(assert (=> b!479588 m!460965))

(assert (=> b!479590 m!460963))

(assert (=> b!479590 m!460963))

(assert (=> b!479590 m!460965))

(assert (=> b!479480 d!76493))

(declare-fun d!76495 () Bool)

(declare-fun e!282206 () Bool)

(assert (=> d!76495 e!282206))

(declare-fun res!286114 () Bool)

(assert (=> d!76495 (=> (not res!286114) (not e!282206))))

(assert (=> d!76495 (= res!286114 (or (bvsge #b00000000000000000000000000000000 (size!15277 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15277 _keys!1874)))))))

(declare-fun lt!217738 () ListLongMap!7997)

(declare-fun lt!217755 () ListLongMap!7997)

(assert (=> d!76495 (= lt!217738 lt!217755)))

(declare-fun lt!217759 () Unit!14048)

(declare-fun e!282215 () Unit!14048)

(assert (=> d!76495 (= lt!217759 e!282215)))

(declare-fun c!57641 () Bool)

(declare-fun e!282209 () Bool)

(assert (=> d!76495 (= c!57641 e!282209)))

(declare-fun res!286117 () Bool)

(assert (=> d!76495 (=> (not res!286117) (not e!282209))))

(assert (=> d!76495 (= res!286117 (bvslt #b00000000000000000000000000000000 (size!15277 _keys!1874)))))

(declare-fun e!282210 () ListLongMap!7997)

(assert (=> d!76495 (= lt!217755 e!282210)))

(declare-fun c!57637 () Bool)

(assert (=> d!76495 (= c!57637 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76495 (validMask!0 mask!2352)))

(assert (=> d!76495 (= (getCurrentListMap!2267 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!217738)))

(declare-fun b!479633 () Bool)

(declare-fun Unit!14051 () Unit!14048)

(assert (=> b!479633 (= e!282215 Unit!14051)))

(declare-fun b!479634 () Bool)

(declare-fun e!282211 () Bool)

(declare-fun e!282207 () Bool)

(assert (=> b!479634 (= e!282211 e!282207)))

(declare-fun res!286121 () Bool)

(assert (=> b!479634 (=> (not res!286121) (not e!282207))))

(assert (=> b!479634 (= res!286121 (contains!2589 lt!217738 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!479634 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15277 _keys!1874)))))

(declare-fun b!479635 () Bool)

(declare-fun e!282205 () Bool)

(assert (=> b!479635 (= e!282206 e!282205)))

(declare-fun c!57640 () Bool)

(assert (=> b!479635 (= c!57640 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!479636 () Bool)

(declare-fun e!282204 () Bool)

(assert (=> b!479636 (= e!282205 e!282204)))

(declare-fun res!286122 () Bool)

(declare-fun call!30845 () Bool)

(assert (=> b!479636 (= res!286122 call!30845)))

(assert (=> b!479636 (=> (not res!286122) (not e!282204))))

(declare-fun b!479637 () Bool)

(declare-fun e!282208 () ListLongMap!7997)

(declare-fun call!30842 () ListLongMap!7997)

(assert (=> b!479637 (= e!282208 call!30842)))

(declare-fun b!479638 () Bool)

(declare-fun lt!217752 () Unit!14048)

(assert (=> b!479638 (= e!282215 lt!217752)))

(declare-fun lt!217745 () ListLongMap!7997)

(declare-fun getCurrentListMapNoExtraKeys!2143 (array!31023 array!31025 (_ BitVec 32) (_ BitVec 32) V!19313 V!19313 (_ BitVec 32) Int) ListLongMap!7997)

(assert (=> b!479638 (= lt!217745 (getCurrentListMapNoExtraKeys!2143 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217754 () (_ BitVec 64))

(assert (=> b!479638 (= lt!217754 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217746 () (_ BitVec 64))

(assert (=> b!479638 (= lt!217746 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217749 () Unit!14048)

(declare-fun addStillContains!297 (ListLongMap!7997 (_ BitVec 64) V!19313 (_ BitVec 64)) Unit!14048)

(assert (=> b!479638 (= lt!217749 (addStillContains!297 lt!217745 lt!217754 zeroValue!1458 lt!217746))))

(declare-fun +!1807 (ListLongMap!7997 tuple2!9094) ListLongMap!7997)

(assert (=> b!479638 (contains!2589 (+!1807 lt!217745 (tuple2!9095 lt!217754 zeroValue!1458)) lt!217746)))

(declare-fun lt!217743 () Unit!14048)

(assert (=> b!479638 (= lt!217743 lt!217749)))

(declare-fun lt!217739 () ListLongMap!7997)

(assert (=> b!479638 (= lt!217739 (getCurrentListMapNoExtraKeys!2143 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217742 () (_ BitVec 64))

(assert (=> b!479638 (= lt!217742 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217741 () (_ BitVec 64))

(assert (=> b!479638 (= lt!217741 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217744 () Unit!14048)

(declare-fun addApplyDifferent!297 (ListLongMap!7997 (_ BitVec 64) V!19313 (_ BitVec 64)) Unit!14048)

(assert (=> b!479638 (= lt!217744 (addApplyDifferent!297 lt!217739 lt!217742 minValue!1458 lt!217741))))

(declare-fun apply!339 (ListLongMap!7997 (_ BitVec 64)) V!19313)

(assert (=> b!479638 (= (apply!339 (+!1807 lt!217739 (tuple2!9095 lt!217742 minValue!1458)) lt!217741) (apply!339 lt!217739 lt!217741))))

(declare-fun lt!217757 () Unit!14048)

(assert (=> b!479638 (= lt!217757 lt!217744)))

(declare-fun lt!217758 () ListLongMap!7997)

(assert (=> b!479638 (= lt!217758 (getCurrentListMapNoExtraKeys!2143 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217753 () (_ BitVec 64))

(assert (=> b!479638 (= lt!217753 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217751 () (_ BitVec 64))

(assert (=> b!479638 (= lt!217751 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217750 () Unit!14048)

(assert (=> b!479638 (= lt!217750 (addApplyDifferent!297 lt!217758 lt!217753 zeroValue!1458 lt!217751))))

(assert (=> b!479638 (= (apply!339 (+!1807 lt!217758 (tuple2!9095 lt!217753 zeroValue!1458)) lt!217751) (apply!339 lt!217758 lt!217751))))

(declare-fun lt!217747 () Unit!14048)

(assert (=> b!479638 (= lt!217747 lt!217750)))

(declare-fun lt!217748 () ListLongMap!7997)

(assert (=> b!479638 (= lt!217748 (getCurrentListMapNoExtraKeys!2143 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217756 () (_ BitVec 64))

(assert (=> b!479638 (= lt!217756 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217740 () (_ BitVec 64))

(assert (=> b!479638 (= lt!217740 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!479638 (= lt!217752 (addApplyDifferent!297 lt!217748 lt!217756 minValue!1458 lt!217740))))

(assert (=> b!479638 (= (apply!339 (+!1807 lt!217748 (tuple2!9095 lt!217756 minValue!1458)) lt!217740) (apply!339 lt!217748 lt!217740))))

(declare-fun call!30846 () ListLongMap!7997)

(declare-fun call!30841 () ListLongMap!7997)

(declare-fun c!57638 () Bool)

(declare-fun bm!30837 () Bool)

(declare-fun call!30843 () ListLongMap!7997)

(assert (=> bm!30837 (= call!30843 (+!1807 (ite c!57637 call!30846 (ite c!57638 call!30841 call!30842)) (ite (or c!57637 c!57638) (tuple2!9095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!479639 () Bool)

(assert (=> b!479639 (= e!282210 (+!1807 call!30843 (tuple2!9095 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun bm!30838 () Bool)

(declare-fun call!30844 () ListLongMap!7997)

(assert (=> bm!30838 (= call!30844 call!30843)))

(declare-fun b!479640 () Bool)

(assert (=> b!479640 (= e!282208 call!30844)))

(declare-fun b!479641 () Bool)

(assert (=> b!479641 (= e!282205 (not call!30845))))

(declare-fun b!479642 () Bool)

(declare-fun c!57639 () Bool)

(assert (=> b!479642 (= c!57639 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!282216 () ListLongMap!7997)

(assert (=> b!479642 (= e!282216 e!282208)))

(declare-fun bm!30839 () Bool)

(assert (=> bm!30839 (= call!30846 (getCurrentListMapNoExtraKeys!2143 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!479643 () Bool)

(declare-fun e!282214 () Bool)

(assert (=> b!479643 (= e!282214 (= (apply!339 lt!217738 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun bm!30840 () Bool)

(assert (=> bm!30840 (= call!30842 call!30841)))

(declare-fun b!479644 () Bool)

(declare-fun e!282212 () Bool)

(assert (=> b!479644 (= e!282212 (validKeyInArray!0 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479645 () Bool)

(assert (=> b!479645 (= e!282204 (= (apply!339 lt!217738 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!479646 () Bool)

(declare-fun e!282213 () Bool)

(assert (=> b!479646 (= e!282213 e!282214)))

(declare-fun res!286120 () Bool)

(declare-fun call!30840 () Bool)

(assert (=> b!479646 (= res!286120 call!30840)))

(assert (=> b!479646 (=> (not res!286120) (not e!282214))))

(declare-fun b!479647 () Bool)

(declare-fun res!286116 () Bool)

(assert (=> b!479647 (=> (not res!286116) (not e!282206))))

(assert (=> b!479647 (= res!286116 e!282213)))

(declare-fun c!57636 () Bool)

(assert (=> b!479647 (= c!57636 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!479648 () Bool)

(assert (=> b!479648 (= e!282213 (not call!30840))))

(declare-fun bm!30841 () Bool)

(assert (=> bm!30841 (= call!30840 (contains!2589 lt!217738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!479649 () Bool)

(assert (=> b!479649 (= e!282210 e!282216)))

(assert (=> b!479649 (= c!57638 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!479650 () Bool)

(assert (=> b!479650 (= e!282216 call!30844)))

(declare-fun bm!30842 () Bool)

(assert (=> bm!30842 (= call!30845 (contains!2589 lt!217738 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30843 () Bool)

(assert (=> bm!30843 (= call!30841 call!30846)))

(declare-fun b!479651 () Bool)

(assert (=> b!479651 (= e!282209 (validKeyInArray!0 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479652 () Bool)

(declare-fun get!7244 (ValueCell!6479 V!19313) V!19313)

(declare-fun dynLambda!953 (Int (_ BitVec 64)) V!19313)

(assert (=> b!479652 (= e!282207 (= (apply!339 lt!217738 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000)) (get!7244 (select (arr!14919 _values!1516) #b00000000000000000000000000000000) (dynLambda!953 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!479652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15278 _values!1516)))))

(assert (=> b!479652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15277 _keys!1874)))))

(declare-fun b!479653 () Bool)

(declare-fun res!286119 () Bool)

(assert (=> b!479653 (=> (not res!286119) (not e!282206))))

(assert (=> b!479653 (= res!286119 e!282211)))

(declare-fun res!286118 () Bool)

(assert (=> b!479653 (=> res!286118 e!282211)))

(assert (=> b!479653 (= res!286118 (not e!282212))))

(declare-fun res!286115 () Bool)

(assert (=> b!479653 (=> (not res!286115) (not e!282212))))

(assert (=> b!479653 (= res!286115 (bvslt #b00000000000000000000000000000000 (size!15277 _keys!1874)))))

(assert (= (and d!76495 c!57637) b!479639))

(assert (= (and d!76495 (not c!57637)) b!479649))

(assert (= (and b!479649 c!57638) b!479650))

(assert (= (and b!479649 (not c!57638)) b!479642))

(assert (= (and b!479642 c!57639) b!479640))

(assert (= (and b!479642 (not c!57639)) b!479637))

(assert (= (or b!479640 b!479637) bm!30840))

(assert (= (or b!479650 bm!30840) bm!30843))

(assert (= (or b!479650 b!479640) bm!30838))

(assert (= (or b!479639 bm!30843) bm!30839))

(assert (= (or b!479639 bm!30838) bm!30837))

(assert (= (and d!76495 res!286117) b!479651))

(assert (= (and d!76495 c!57641) b!479638))

(assert (= (and d!76495 (not c!57641)) b!479633))

(assert (= (and d!76495 res!286114) b!479653))

(assert (= (and b!479653 res!286115) b!479644))

(assert (= (and b!479653 (not res!286118)) b!479634))

(assert (= (and b!479634 res!286121) b!479652))

(assert (= (and b!479653 res!286119) b!479647))

(assert (= (and b!479647 c!57636) b!479646))

(assert (= (and b!479647 (not c!57636)) b!479648))

(assert (= (and b!479646 res!286120) b!479643))

(assert (= (or b!479646 b!479648) bm!30841))

(assert (= (and b!479647 res!286116) b!479635))

(assert (= (and b!479635 c!57640) b!479636))

(assert (= (and b!479635 (not c!57640)) b!479641))

(assert (= (and b!479636 res!286122) b!479645))

(assert (= (or b!479636 b!479641) bm!30842))

(declare-fun b_lambda!10773 () Bool)

(assert (=> (not b_lambda!10773) (not b!479652)))

(declare-fun t!15357 () Bool)

(declare-fun tb!4151 () Bool)

(assert (=> (and start!43288 (= defaultEntry!1519 defaultEntry!1519) t!15357) tb!4151))

(declare-fun result!7737 () Bool)

(assert (=> tb!4151 (= result!7737 tp_is_empty!13681)))

(assert (=> b!479652 t!15357))

(declare-fun b_and!20901 () Bool)

(assert (= b_and!20895 (and (=> t!15357 result!7737) b_and!20901)))

(declare-fun m!460967 () Bool)

(assert (=> b!479643 m!460967))

(declare-fun m!460969 () Bool)

(assert (=> b!479638 m!460969))

(declare-fun m!460971 () Bool)

(assert (=> b!479638 m!460971))

(declare-fun m!460973 () Bool)

(assert (=> b!479638 m!460973))

(declare-fun m!460975 () Bool)

(assert (=> b!479638 m!460975))

(declare-fun m!460977 () Bool)

(assert (=> b!479638 m!460977))

(declare-fun m!460979 () Bool)

(assert (=> b!479638 m!460979))

(declare-fun m!460981 () Bool)

(assert (=> b!479638 m!460981))

(declare-fun m!460983 () Bool)

(assert (=> b!479638 m!460983))

(assert (=> b!479638 m!460969))

(declare-fun m!460985 () Bool)

(assert (=> b!479638 m!460985))

(declare-fun m!460987 () Bool)

(assert (=> b!479638 m!460987))

(declare-fun m!460989 () Bool)

(assert (=> b!479638 m!460989))

(assert (=> b!479638 m!460949))

(declare-fun m!460991 () Bool)

(assert (=> b!479638 m!460991))

(assert (=> b!479638 m!460977))

(declare-fun m!460993 () Bool)

(assert (=> b!479638 m!460993))

(assert (=> b!479638 m!460985))

(assert (=> b!479638 m!460981))

(declare-fun m!460995 () Bool)

(assert (=> b!479638 m!460995))

(declare-fun m!460997 () Bool)

(assert (=> b!479638 m!460997))

(declare-fun m!460999 () Bool)

(assert (=> b!479638 m!460999))

(assert (=> bm!30839 m!460989))

(assert (=> b!479652 m!460949))

(declare-fun m!461001 () Bool)

(assert (=> b!479652 m!461001))

(assert (=> b!479652 m!460949))

(declare-fun m!461003 () Bool)

(assert (=> b!479652 m!461003))

(declare-fun m!461005 () Bool)

(assert (=> b!479652 m!461005))

(assert (=> b!479652 m!461001))

(assert (=> b!479652 m!461005))

(declare-fun m!461007 () Bool)

(assert (=> b!479652 m!461007))

(declare-fun m!461009 () Bool)

(assert (=> bm!30841 m!461009))

(declare-fun m!461011 () Bool)

(assert (=> bm!30837 m!461011))

(declare-fun m!461013 () Bool)

(assert (=> bm!30842 m!461013))

(assert (=> d!76495 m!460895))

(assert (=> b!479651 m!460949))

(assert (=> b!479651 m!460949))

(assert (=> b!479651 m!460953))

(declare-fun m!461015 () Bool)

(assert (=> b!479639 m!461015))

(assert (=> b!479644 m!460949))

(assert (=> b!479644 m!460949))

(assert (=> b!479644 m!460953))

(assert (=> b!479634 m!460949))

(assert (=> b!479634 m!460949))

(declare-fun m!461017 () Bool)

(assert (=> b!479634 m!461017))

(declare-fun m!461019 () Bool)

(assert (=> b!479645 m!461019))

(assert (=> b!479480 d!76495))

(declare-fun b!479664 () Bool)

(declare-fun e!282223 () Bool)

(declare-fun e!282224 () Bool)

(assert (=> b!479664 (= e!282223 e!282224)))

(declare-fun c!57644 () Bool)

(assert (=> b!479664 (= c!57644 (validKeyInArray!0 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30846 () Bool)

(declare-fun call!30849 () Bool)

(assert (=> bm!30846 (= call!30849 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!479665 () Bool)

(declare-fun e!282225 () Bool)

(assert (=> b!479665 (= e!282224 e!282225)))

(declare-fun lt!217766 () (_ BitVec 64))

(assert (=> b!479665 (= lt!217766 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217767 () Unit!14048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31023 (_ BitVec 64) (_ BitVec 32)) Unit!14048)

(assert (=> b!479665 (= lt!217767 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217766 #b00000000000000000000000000000000))))

(assert (=> b!479665 (arrayContainsKey!0 _keys!1874 lt!217766 #b00000000000000000000000000000000)))

(declare-fun lt!217768 () Unit!14048)

(assert (=> b!479665 (= lt!217768 lt!217767)))

(declare-fun res!286128 () Bool)

(declare-datatypes ((SeekEntryResult!3563 0))(
  ( (MissingZero!3563 (index!16431 (_ BitVec 32))) (Found!3563 (index!16432 (_ BitVec 32))) (Intermediate!3563 (undefined!4375 Bool) (index!16433 (_ BitVec 32)) (x!45072 (_ BitVec 32))) (Undefined!3563) (MissingVacant!3563 (index!16434 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31023 (_ BitVec 32)) SeekEntryResult!3563)

(assert (=> b!479665 (= res!286128 (= (seekEntryOrOpen!0 (select (arr!14918 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3563 #b00000000000000000000000000000000)))))

(assert (=> b!479665 (=> (not res!286128) (not e!282225))))

(declare-fun d!76497 () Bool)

(declare-fun res!286127 () Bool)

(assert (=> d!76497 (=> res!286127 e!282223)))

(assert (=> d!76497 (= res!286127 (bvsge #b00000000000000000000000000000000 (size!15277 _keys!1874)))))

(assert (=> d!76497 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!282223)))

(declare-fun b!479666 () Bool)

(assert (=> b!479666 (= e!282225 call!30849)))

(declare-fun b!479667 () Bool)

(assert (=> b!479667 (= e!282224 call!30849)))

(assert (= (and d!76497 (not res!286127)) b!479664))

(assert (= (and b!479664 c!57644) b!479665))

(assert (= (and b!479664 (not c!57644)) b!479667))

(assert (= (and b!479665 res!286128) b!479666))

(assert (= (or b!479666 b!479667) bm!30846))

(assert (=> b!479664 m!460949))

(assert (=> b!479664 m!460949))

(assert (=> b!479664 m!460953))

(declare-fun m!461021 () Bool)

(assert (=> bm!30846 m!461021))

(assert (=> b!479665 m!460949))

(declare-fun m!461023 () Bool)

(assert (=> b!479665 m!461023))

(declare-fun m!461025 () Bool)

(assert (=> b!479665 m!461025))

(assert (=> b!479665 m!460949))

(declare-fun m!461027 () Bool)

(assert (=> b!479665 m!461027))

(assert (=> b!479479 d!76497))

(declare-fun mapNonEmpty!22228 () Bool)

(declare-fun mapRes!22228 () Bool)

(declare-fun tp!42793 () Bool)

(declare-fun e!282230 () Bool)

(assert (=> mapNonEmpty!22228 (= mapRes!22228 (and tp!42793 e!282230))))

(declare-fun mapRest!22228 () (Array (_ BitVec 32) ValueCell!6479))

(declare-fun mapValue!22228 () ValueCell!6479)

(declare-fun mapKey!22228 () (_ BitVec 32))

(assert (=> mapNonEmpty!22228 (= mapRest!22219 (store mapRest!22228 mapKey!22228 mapValue!22228))))

(declare-fun b!479674 () Bool)

(assert (=> b!479674 (= e!282230 tp_is_empty!13681)))

(declare-fun mapIsEmpty!22228 () Bool)

(assert (=> mapIsEmpty!22228 mapRes!22228))

(declare-fun b!479675 () Bool)

(declare-fun e!282231 () Bool)

(assert (=> b!479675 (= e!282231 tp_is_empty!13681)))

(declare-fun condMapEmpty!22228 () Bool)

(declare-fun mapDefault!22228 () ValueCell!6479)

(assert (=> mapNonEmpty!22219 (= condMapEmpty!22228 (= mapRest!22219 ((as const (Array (_ BitVec 32) ValueCell!6479)) mapDefault!22228)))))

(assert (=> mapNonEmpty!22219 (= tp!42778 (and e!282231 mapRes!22228))))

(assert (= (and mapNonEmpty!22219 condMapEmpty!22228) mapIsEmpty!22228))

(assert (= (and mapNonEmpty!22219 (not condMapEmpty!22228)) mapNonEmpty!22228))

(assert (= (and mapNonEmpty!22228 ((_ is ValueCellFull!6479) mapValue!22228)) b!479674))

(assert (= (and mapNonEmpty!22219 ((_ is ValueCellFull!6479) mapDefault!22228)) b!479675))

(declare-fun m!461029 () Bool)

(assert (=> mapNonEmpty!22228 m!461029))

(declare-fun b_lambda!10775 () Bool)

(assert (= b_lambda!10773 (or (and start!43288 b_free!12169) b_lambda!10775)))

(check-sat (not b!479634) (not b!479559) (not mapNonEmpty!22228) (not b!479578) (not bm!30822) (not b!479643) (not b!479651) b_and!20901 tp_is_empty!13681 (not b!479638) (not b!479581) (not b_lambda!10775) (not b!479590) (not d!76479) (not bm!30837) (not d!76495) (not bm!30841) (not d!76493) (not b!479639) (not b!479566) (not b!479664) (not b!479580) (not b!479645) (not b!479644) (not bm!30839) (not bm!30842) (not b!479665) (not b!479588) (not b_next!12169) (not b!479652) (not bm!30846))
(check-sat b_and!20901 (not b_next!12169))
