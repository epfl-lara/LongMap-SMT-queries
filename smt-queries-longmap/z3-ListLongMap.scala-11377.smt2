; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132134 () Bool)

(assert start!132134)

(declare-fun b_free!31879 () Bool)

(declare-fun b_next!31879 () Bool)

(assert (=> start!132134 (= b_free!31879 (not b_next!31879))))

(declare-fun tp!111892 () Bool)

(declare-fun b_and!51287 () Bool)

(assert (=> start!132134 (= tp!111892 b_and!51287)))

(declare-fun b!1550454 () Bool)

(declare-fun res!1062007 () Bool)

(declare-fun e!863059 () Bool)

(assert (=> b!1550454 (=> (not res!1062007) (not e!863059))))

(declare-datatypes ((array!103432 0))(
  ( (array!103433 (arr!49918 (Array (_ BitVec 32) (_ BitVec 64))) (size!50470 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103432)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!59317 0))(
  ( (V!59318 (val!19155 Int)) )
))
(declare-datatypes ((ValueCell!18167 0))(
  ( (ValueCellFull!18167 (v!21953 V!59317)) (EmptyCell!18167) )
))
(declare-datatypes ((array!103434 0))(
  ( (array!103435 (arr!49919 (Array (_ BitVec 32) ValueCell!18167)) (size!50471 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103434)

(assert (=> b!1550454 (= res!1062007 (and (= (size!50471 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50470 _keys!618) (size!50471 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!70800 () Bool)

(declare-datatypes ((tuple2!24762 0))(
  ( (tuple2!24763 (_1!12392 (_ BitVec 64)) (_2!12392 V!59317)) )
))
(declare-datatypes ((List!36214 0))(
  ( (Nil!36211) (Cons!36210 (h!37656 tuple2!24762) (t!50914 List!36214)) )
))
(declare-datatypes ((ListLongMap!22371 0))(
  ( (ListLongMap!22372 (toList!11201 List!36214)) )
))
(declare-fun call!70807 () ListLongMap!22371)

(declare-fun call!70805 () ListLongMap!22371)

(assert (=> bm!70800 (= call!70807 call!70805)))

(declare-fun zeroValue!436 () V!59317)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun minValue!436 () V!59317)

(declare-fun bm!70801 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6641 (array!103432 array!103434 (_ BitVec 32) (_ BitVec 32) V!59317 V!59317 (_ BitVec 32) Int) ListLongMap!22371)

(assert (=> bm!70801 (= call!70805 (getCurrentListMapNoExtraKeys!6641 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58939 () Bool)

(declare-fun mapRes!58939 () Bool)

(declare-fun tp!111893 () Bool)

(declare-fun e!863055 () Bool)

(assert (=> mapNonEmpty!58939 (= mapRes!58939 (and tp!111893 e!863055))))

(declare-fun mapValue!58939 () ValueCell!18167)

(declare-fun mapRest!58939 () (Array (_ BitVec 32) ValueCell!18167))

(declare-fun mapKey!58939 () (_ BitVec 32))

(assert (=> mapNonEmpty!58939 (= (arr!49919 _values!470) (store mapRest!58939 mapKey!58939 mapValue!58939))))

(declare-fun b!1550455 () Bool)

(declare-fun e!863057 () Bool)

(assert (=> b!1550455 (= e!863057 (not (= (select (arr!49918 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1550456 () Bool)

(declare-fun e!863052 () Bool)

(assert (=> b!1550456 (= e!863059 e!863052)))

(declare-fun res!1062008 () Bool)

(assert (=> b!1550456 (=> (not res!1062008) (not e!863052))))

(assert (=> b!1550456 (= res!1062008 (bvslt from!762 (size!50470 _keys!618)))))

(declare-fun lt!668101 () ListLongMap!22371)

(declare-fun e!863053 () ListLongMap!22371)

(assert (=> b!1550456 (= lt!668101 e!863053)))

(declare-fun c!142552 () Bool)

(declare-fun lt!668100 () Bool)

(assert (=> b!1550456 (= c!142552 (and (not lt!668100) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550456 (= lt!668100 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1550457 () Bool)

(declare-fun e!863058 () ListLongMap!22371)

(assert (=> b!1550457 (= e!863053 e!863058)))

(declare-fun c!142554 () Bool)

(assert (=> b!1550457 (= c!142554 (and (not lt!668100) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550458 () Bool)

(assert (=> b!1550458 (= e!863052 (not e!863057))))

(declare-fun res!1062005 () Bool)

(assert (=> b!1550458 (=> (not res!1062005) (not e!863057))))

(declare-fun lt!668102 () ListLongMap!22371)

(declare-fun contains!10064 (ListLongMap!22371 (_ BitVec 64)) Bool)

(assert (=> b!1550458 (= res!1062005 (contains!10064 lt!668102 (select (arr!49918 _keys!618) from!762)))))

(declare-fun +!5017 (ListLongMap!22371 tuple2!24762) ListLongMap!22371)

(assert (=> b!1550458 (contains!10064 (+!5017 lt!668102 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49918 _keys!618) from!762))))

(declare-datatypes ((Unit!51472 0))(
  ( (Unit!51473) )
))
(declare-fun lt!668099 () Unit!51472)

(declare-fun addStillContains!1281 (ListLongMap!22371 (_ BitVec 64) V!59317 (_ BitVec 64)) Unit!51472)

(assert (=> b!1550458 (= lt!668099 (addStillContains!1281 lt!668102 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49918 _keys!618) from!762)))))

(assert (=> b!1550458 (= lt!668102 (getCurrentListMapNoExtraKeys!6641 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550459 () Bool)

(declare-fun e!863054 () ListLongMap!22371)

(declare-fun call!70806 () ListLongMap!22371)

(assert (=> b!1550459 (= e!863054 call!70806)))

(declare-fun b!1550460 () Bool)

(declare-fun e!863050 () Bool)

(declare-fun tp_is_empty!38155 () Bool)

(assert (=> b!1550460 (= e!863050 tp_is_empty!38155)))

(declare-fun b!1550461 () Bool)

(declare-fun res!1062002 () Bool)

(assert (=> b!1550461 (=> (not res!1062002) (not e!863059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103432 (_ BitVec 32)) Bool)

(assert (=> b!1550461 (= res!1062002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550462 () Bool)

(assert (=> b!1550462 (= e!863058 call!70806)))

(declare-fun b!1550463 () Bool)

(declare-fun res!1062006 () Bool)

(assert (=> b!1550463 (=> (not res!1062006) (not e!863059))))

(declare-datatypes ((List!36215 0))(
  ( (Nil!36212) (Cons!36211 (h!37657 (_ BitVec 64)) (t!50915 List!36215)) )
))
(declare-fun arrayNoDuplicates!0 (array!103432 (_ BitVec 32) List!36215) Bool)

(assert (=> b!1550463 (= res!1062006 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36212))))

(declare-fun b!1550464 () Bool)

(declare-fun res!1062001 () Bool)

(assert (=> b!1550464 (=> (not res!1062001) (not e!863052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550464 (= res!1062001 (validKeyInArray!0 (select (arr!49918 _keys!618) from!762)))))

(declare-fun res!1062003 () Bool)

(assert (=> start!132134 (=> (not res!1062003) (not e!863059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132134 (= res!1062003 (validMask!0 mask!926))))

(assert (=> start!132134 e!863059))

(declare-fun array_inv!39011 (array!103432) Bool)

(assert (=> start!132134 (array_inv!39011 _keys!618)))

(assert (=> start!132134 tp_is_empty!38155))

(assert (=> start!132134 true))

(assert (=> start!132134 tp!111892))

(declare-fun e!863056 () Bool)

(declare-fun array_inv!39012 (array!103434) Bool)

(assert (=> start!132134 (and (array_inv!39012 _values!470) e!863056)))

(declare-fun bm!70802 () Bool)

(declare-fun call!70803 () ListLongMap!22371)

(assert (=> bm!70802 (= call!70806 call!70803)))

(declare-fun b!1550465 () Bool)

(declare-fun call!70804 () ListLongMap!22371)

(assert (=> b!1550465 (= e!863054 call!70804)))

(declare-fun b!1550466 () Bool)

(assert (=> b!1550466 (= e!863053 (+!5017 call!70803 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1550467 () Bool)

(assert (=> b!1550467 (= e!863055 tp_is_empty!38155)))

(declare-fun b!1550468 () Bool)

(declare-fun res!1062004 () Bool)

(assert (=> b!1550468 (=> (not res!1062004) (not e!863059))))

(assert (=> b!1550468 (= res!1062004 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50470 _keys!618))))))

(declare-fun bm!70803 () Bool)

(assert (=> bm!70803 (= call!70804 call!70807)))

(declare-fun b!1550469 () Bool)

(assert (=> b!1550469 (= e!863056 (and e!863050 mapRes!58939))))

(declare-fun condMapEmpty!58939 () Bool)

(declare-fun mapDefault!58939 () ValueCell!18167)

(assert (=> b!1550469 (= condMapEmpty!58939 (= (arr!49919 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18167)) mapDefault!58939)))))

(declare-fun b!1550470 () Bool)

(declare-fun c!142553 () Bool)

(assert (=> b!1550470 (= c!142553 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668100))))

(assert (=> b!1550470 (= e!863058 e!863054)))

(declare-fun bm!70804 () Bool)

(assert (=> bm!70804 (= call!70803 (+!5017 (ite c!142552 call!70805 (ite c!142554 call!70807 call!70804)) (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapIsEmpty!58939 () Bool)

(assert (=> mapIsEmpty!58939 mapRes!58939))

(assert (= (and start!132134 res!1062003) b!1550454))

(assert (= (and b!1550454 res!1062007) b!1550461))

(assert (= (and b!1550461 res!1062002) b!1550463))

(assert (= (and b!1550463 res!1062006) b!1550468))

(assert (= (and b!1550468 res!1062004) b!1550456))

(assert (= (and b!1550456 c!142552) b!1550466))

(assert (= (and b!1550456 (not c!142552)) b!1550457))

(assert (= (and b!1550457 c!142554) b!1550462))

(assert (= (and b!1550457 (not c!142554)) b!1550470))

(assert (= (and b!1550470 c!142553) b!1550459))

(assert (= (and b!1550470 (not c!142553)) b!1550465))

(assert (= (or b!1550459 b!1550465) bm!70803))

(assert (= (or b!1550462 bm!70803) bm!70800))

(assert (= (or b!1550462 b!1550459) bm!70802))

(assert (= (or b!1550466 bm!70800) bm!70801))

(assert (= (or b!1550466 bm!70802) bm!70804))

(assert (= (and b!1550456 res!1062008) b!1550464))

(assert (= (and b!1550464 res!1062001) b!1550458))

(assert (= (and b!1550458 res!1062005) b!1550455))

(assert (= (and b!1550469 condMapEmpty!58939) mapIsEmpty!58939))

(assert (= (and b!1550469 (not condMapEmpty!58939)) mapNonEmpty!58939))

(get-info :version)

(assert (= (and mapNonEmpty!58939 ((_ is ValueCellFull!18167) mapValue!58939)) b!1550467))

(assert (= (and b!1550469 ((_ is ValueCellFull!18167) mapDefault!58939)) b!1550460))

(assert (= start!132134 b!1550469))

(declare-fun m!1428667 () Bool)

(assert (=> b!1550463 m!1428667))

(declare-fun m!1428669 () Bool)

(assert (=> b!1550461 m!1428669))

(declare-fun m!1428671 () Bool)

(assert (=> b!1550464 m!1428671))

(assert (=> b!1550464 m!1428671))

(declare-fun m!1428673 () Bool)

(assert (=> b!1550464 m!1428673))

(declare-fun m!1428675 () Bool)

(assert (=> mapNonEmpty!58939 m!1428675))

(declare-fun m!1428677 () Bool)

(assert (=> start!132134 m!1428677))

(declare-fun m!1428679 () Bool)

(assert (=> start!132134 m!1428679))

(declare-fun m!1428681 () Bool)

(assert (=> start!132134 m!1428681))

(declare-fun m!1428683 () Bool)

(assert (=> bm!70804 m!1428683))

(declare-fun m!1428685 () Bool)

(assert (=> b!1550466 m!1428685))

(declare-fun m!1428687 () Bool)

(assert (=> b!1550458 m!1428687))

(assert (=> b!1550458 m!1428687))

(assert (=> b!1550458 m!1428671))

(declare-fun m!1428689 () Bool)

(assert (=> b!1550458 m!1428689))

(declare-fun m!1428691 () Bool)

(assert (=> b!1550458 m!1428691))

(assert (=> b!1550458 m!1428671))

(assert (=> b!1550458 m!1428671))

(declare-fun m!1428693 () Bool)

(assert (=> b!1550458 m!1428693))

(assert (=> b!1550458 m!1428671))

(declare-fun m!1428695 () Bool)

(assert (=> b!1550458 m!1428695))

(assert (=> b!1550455 m!1428671))

(assert (=> bm!70801 m!1428691))

(check-sat (not mapNonEmpty!58939) (not b!1550458) (not start!132134) (not b!1550463) b_and!51287 (not b_next!31879) (not b!1550466) (not b!1550461) (not bm!70804) (not b!1550464) tp_is_empty!38155 (not bm!70801))
(check-sat b_and!51287 (not b_next!31879))
(get-model)

(declare-fun d!160675 () Bool)

(assert (=> d!160675 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132134 d!160675))

(declare-fun d!160677 () Bool)

(assert (=> d!160677 (= (array_inv!39011 _keys!618) (bvsge (size!50470 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132134 d!160677))

(declare-fun d!160679 () Bool)

(assert (=> d!160679 (= (array_inv!39012 _values!470) (bvsge (size!50471 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132134 d!160679))

(declare-fun d!160681 () Bool)

(declare-fun e!863122 () Bool)

(assert (=> d!160681 e!863122))

(declare-fun res!1062062 () Bool)

(assert (=> d!160681 (=> (not res!1062062) (not e!863122))))

(declare-fun lt!668137 () ListLongMap!22371)

(assert (=> d!160681 (= res!1062062 (contains!10064 lt!668137 (_1!12392 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!668135 () List!36214)

(assert (=> d!160681 (= lt!668137 (ListLongMap!22372 lt!668135))))

(declare-fun lt!668138 () Unit!51472)

(declare-fun lt!668136 () Unit!51472)

(assert (=> d!160681 (= lt!668138 lt!668136)))

(declare-datatypes ((Option!807 0))(
  ( (Some!806 (v!21956 V!59317)) (None!805) )
))
(declare-fun getValueByKey!732 (List!36214 (_ BitVec 64)) Option!807)

(assert (=> d!160681 (= (getValueByKey!732 lt!668135 (_1!12392 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!806 (_2!12392 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lemmaContainsTupThenGetReturnValue!372 (List!36214 (_ BitVec 64) V!59317) Unit!51472)

(assert (=> d!160681 (= lt!668136 (lemmaContainsTupThenGetReturnValue!372 lt!668135 (_1!12392 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12392 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun insertStrictlySorted!501 (List!36214 (_ BitVec 64) V!59317) List!36214)

(assert (=> d!160681 (= lt!668135 (insertStrictlySorted!501 (toList!11201 call!70803) (_1!12392 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12392 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!160681 (= (+!5017 call!70803 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!668137)))

(declare-fun b!1550577 () Bool)

(declare-fun res!1062061 () Bool)

(assert (=> b!1550577 (=> (not res!1062061) (not e!863122))))

(assert (=> b!1550577 (= res!1062061 (= (getValueByKey!732 (toList!11201 lt!668137) (_1!12392 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!806 (_2!12392 (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1550578 () Bool)

(declare-fun contains!10067 (List!36214 tuple2!24762) Bool)

(assert (=> b!1550578 (= e!863122 (contains!10067 (toList!11201 lt!668137) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!160681 res!1062062) b!1550577))

(assert (= (and b!1550577 res!1062061) b!1550578))

(declare-fun m!1428757 () Bool)

(assert (=> d!160681 m!1428757))

(declare-fun m!1428759 () Bool)

(assert (=> d!160681 m!1428759))

(declare-fun m!1428761 () Bool)

(assert (=> d!160681 m!1428761))

(declare-fun m!1428763 () Bool)

(assert (=> d!160681 m!1428763))

(declare-fun m!1428765 () Bool)

(assert (=> b!1550577 m!1428765))

(declare-fun m!1428767 () Bool)

(assert (=> b!1550578 m!1428767))

(assert (=> b!1550466 d!160681))

(declare-fun b!1550587 () Bool)

(declare-fun e!863130 () Bool)

(declare-fun call!70840 () Bool)

(assert (=> b!1550587 (= e!863130 call!70840)))

(declare-fun bm!70837 () Bool)

(assert (=> bm!70837 (= call!70840 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1550589 () Bool)

(declare-fun e!863129 () Bool)

(assert (=> b!1550589 (= e!863129 e!863130)))

(declare-fun c!142575 () Bool)

(assert (=> b!1550589 (= c!142575 (validKeyInArray!0 (select (arr!49918 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1550590 () Bool)

(declare-fun e!863131 () Bool)

(assert (=> b!1550590 (= e!863131 call!70840)))

(declare-fun d!160683 () Bool)

(declare-fun res!1062068 () Bool)

(assert (=> d!160683 (=> res!1062068 e!863129)))

(assert (=> d!160683 (= res!1062068 (bvsge #b00000000000000000000000000000000 (size!50470 _keys!618)))))

(assert (=> d!160683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!863129)))

(declare-fun b!1550588 () Bool)

(assert (=> b!1550588 (= e!863130 e!863131)))

(declare-fun lt!668147 () (_ BitVec 64))

(assert (=> b!1550588 (= lt!668147 (select (arr!49918 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!668146 () Unit!51472)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103432 (_ BitVec 64) (_ BitVec 32)) Unit!51472)

(assert (=> b!1550588 (= lt!668146 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!668147 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1550588 (arrayContainsKey!0 _keys!618 lt!668147 #b00000000000000000000000000000000)))

(declare-fun lt!668145 () Unit!51472)

(assert (=> b!1550588 (= lt!668145 lt!668146)))

(declare-fun res!1062067 () Bool)

(declare-datatypes ((SeekEntryResult!13513 0))(
  ( (MissingZero!13513 (index!56450 (_ BitVec 32))) (Found!13513 (index!56451 (_ BitVec 32))) (Intermediate!13513 (undefined!14325 Bool) (index!56452 (_ BitVec 32)) (x!139096 (_ BitVec 32))) (Undefined!13513) (MissingVacant!13513 (index!56453 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103432 (_ BitVec 32)) SeekEntryResult!13513)

(assert (=> b!1550588 (= res!1062067 (= (seekEntryOrOpen!0 (select (arr!49918 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13513 #b00000000000000000000000000000000)))))

(assert (=> b!1550588 (=> (not res!1062067) (not e!863131))))

(assert (= (and d!160683 (not res!1062068)) b!1550589))

(assert (= (and b!1550589 c!142575) b!1550588))

(assert (= (and b!1550589 (not c!142575)) b!1550587))

(assert (= (and b!1550588 res!1062067) b!1550590))

(assert (= (or b!1550590 b!1550587) bm!70837))

(declare-fun m!1428769 () Bool)

(assert (=> bm!70837 m!1428769))

(declare-fun m!1428771 () Bool)

(assert (=> b!1550589 m!1428771))

(assert (=> b!1550589 m!1428771))

(declare-fun m!1428773 () Bool)

(assert (=> b!1550589 m!1428773))

(assert (=> b!1550588 m!1428771))

(declare-fun m!1428775 () Bool)

(assert (=> b!1550588 m!1428775))

(declare-fun m!1428777 () Bool)

(assert (=> b!1550588 m!1428777))

(assert (=> b!1550588 m!1428771))

(declare-fun m!1428779 () Bool)

(assert (=> b!1550588 m!1428779))

(assert (=> b!1550461 d!160683))

(declare-fun d!160685 () Bool)

(assert (=> d!160685 (contains!10064 (+!5017 lt!668102 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49918 _keys!618) from!762))))

(declare-fun lt!668150 () Unit!51472)

(declare-fun choose!2039 (ListLongMap!22371 (_ BitVec 64) V!59317 (_ BitVec 64)) Unit!51472)

(assert (=> d!160685 (= lt!668150 (choose!2039 lt!668102 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49918 _keys!618) from!762)))))

(assert (=> d!160685 (contains!10064 lt!668102 (select (arr!49918 _keys!618) from!762))))

(assert (=> d!160685 (= (addStillContains!1281 lt!668102 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49918 _keys!618) from!762)) lt!668150)))

(declare-fun bs!44520 () Bool)

(assert (= bs!44520 d!160685))

(assert (=> bs!44520 m!1428687))

(assert (=> bs!44520 m!1428687))

(assert (=> bs!44520 m!1428671))

(assert (=> bs!44520 m!1428689))

(assert (=> bs!44520 m!1428671))

(declare-fun m!1428781 () Bool)

(assert (=> bs!44520 m!1428781))

(assert (=> bs!44520 m!1428671))

(assert (=> bs!44520 m!1428693))

(assert (=> b!1550458 d!160685))

(declare-fun d!160687 () Bool)

(declare-fun e!863137 () Bool)

(assert (=> d!160687 e!863137))

(declare-fun res!1062071 () Bool)

(assert (=> d!160687 (=> res!1062071 e!863137)))

(declare-fun lt!668162 () Bool)

(assert (=> d!160687 (= res!1062071 (not lt!668162))))

(declare-fun lt!668161 () Bool)

(assert (=> d!160687 (= lt!668162 lt!668161)))

(declare-fun lt!668159 () Unit!51472)

(declare-fun e!863136 () Unit!51472)

(assert (=> d!160687 (= lt!668159 e!863136)))

(declare-fun c!142578 () Bool)

(assert (=> d!160687 (= c!142578 lt!668161)))

(declare-fun containsKey!749 (List!36214 (_ BitVec 64)) Bool)

(assert (=> d!160687 (= lt!668161 (containsKey!749 (toList!11201 lt!668102) (select (arr!49918 _keys!618) from!762)))))

(assert (=> d!160687 (= (contains!10064 lt!668102 (select (arr!49918 _keys!618) from!762)) lt!668162)))

(declare-fun b!1550598 () Bool)

(declare-fun lt!668160 () Unit!51472)

(assert (=> b!1550598 (= e!863136 lt!668160)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!496 (List!36214 (_ BitVec 64)) Unit!51472)

(assert (=> b!1550598 (= lt!668160 (lemmaContainsKeyImpliesGetValueByKeyDefined!496 (toList!11201 lt!668102) (select (arr!49918 _keys!618) from!762)))))

(declare-fun isDefined!548 (Option!807) Bool)

(assert (=> b!1550598 (isDefined!548 (getValueByKey!732 (toList!11201 lt!668102) (select (arr!49918 _keys!618) from!762)))))

(declare-fun b!1550599 () Bool)

(declare-fun Unit!51478 () Unit!51472)

(assert (=> b!1550599 (= e!863136 Unit!51478)))

(declare-fun b!1550600 () Bool)

(assert (=> b!1550600 (= e!863137 (isDefined!548 (getValueByKey!732 (toList!11201 lt!668102) (select (arr!49918 _keys!618) from!762))))))

(assert (= (and d!160687 c!142578) b!1550598))

(assert (= (and d!160687 (not c!142578)) b!1550599))

(assert (= (and d!160687 (not res!1062071)) b!1550600))

(assert (=> d!160687 m!1428671))

(declare-fun m!1428783 () Bool)

(assert (=> d!160687 m!1428783))

(assert (=> b!1550598 m!1428671))

(declare-fun m!1428785 () Bool)

(assert (=> b!1550598 m!1428785))

(assert (=> b!1550598 m!1428671))

(declare-fun m!1428787 () Bool)

(assert (=> b!1550598 m!1428787))

(assert (=> b!1550598 m!1428787))

(declare-fun m!1428789 () Bool)

(assert (=> b!1550598 m!1428789))

(assert (=> b!1550600 m!1428671))

(assert (=> b!1550600 m!1428787))

(assert (=> b!1550600 m!1428787))

(assert (=> b!1550600 m!1428789))

(assert (=> b!1550458 d!160687))

(declare-fun d!160689 () Bool)

(declare-fun e!863139 () Bool)

(assert (=> d!160689 e!863139))

(declare-fun res!1062072 () Bool)

(assert (=> d!160689 (=> res!1062072 e!863139)))

(declare-fun lt!668166 () Bool)

(assert (=> d!160689 (= res!1062072 (not lt!668166))))

(declare-fun lt!668165 () Bool)

(assert (=> d!160689 (= lt!668166 lt!668165)))

(declare-fun lt!668163 () Unit!51472)

(declare-fun e!863138 () Unit!51472)

(assert (=> d!160689 (= lt!668163 e!863138)))

(declare-fun c!142579 () Bool)

(assert (=> d!160689 (= c!142579 lt!668165)))

(assert (=> d!160689 (= lt!668165 (containsKey!749 (toList!11201 (+!5017 lt!668102 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49918 _keys!618) from!762)))))

(assert (=> d!160689 (= (contains!10064 (+!5017 lt!668102 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49918 _keys!618) from!762)) lt!668166)))

(declare-fun b!1550601 () Bool)

(declare-fun lt!668164 () Unit!51472)

(assert (=> b!1550601 (= e!863138 lt!668164)))

(assert (=> b!1550601 (= lt!668164 (lemmaContainsKeyImpliesGetValueByKeyDefined!496 (toList!11201 (+!5017 lt!668102 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49918 _keys!618) from!762)))))

(assert (=> b!1550601 (isDefined!548 (getValueByKey!732 (toList!11201 (+!5017 lt!668102 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49918 _keys!618) from!762)))))

(declare-fun b!1550602 () Bool)

(declare-fun Unit!51479 () Unit!51472)

(assert (=> b!1550602 (= e!863138 Unit!51479)))

(declare-fun b!1550603 () Bool)

(assert (=> b!1550603 (= e!863139 (isDefined!548 (getValueByKey!732 (toList!11201 (+!5017 lt!668102 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (select (arr!49918 _keys!618) from!762))))))

(assert (= (and d!160689 c!142579) b!1550601))

(assert (= (and d!160689 (not c!142579)) b!1550602))

(assert (= (and d!160689 (not res!1062072)) b!1550603))

(assert (=> d!160689 m!1428671))

(declare-fun m!1428791 () Bool)

(assert (=> d!160689 m!1428791))

(assert (=> b!1550601 m!1428671))

(declare-fun m!1428793 () Bool)

(assert (=> b!1550601 m!1428793))

(assert (=> b!1550601 m!1428671))

(declare-fun m!1428795 () Bool)

(assert (=> b!1550601 m!1428795))

(assert (=> b!1550601 m!1428795))

(declare-fun m!1428797 () Bool)

(assert (=> b!1550601 m!1428797))

(assert (=> b!1550603 m!1428671))

(assert (=> b!1550603 m!1428795))

(assert (=> b!1550603 m!1428795))

(assert (=> b!1550603 m!1428797))

(assert (=> b!1550458 d!160689))

(declare-fun b!1550628 () Bool)

(assert (=> b!1550628 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50470 _keys!618)))))

(assert (=> b!1550628 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50471 _values!470)))))

(declare-fun lt!668184 () ListLongMap!22371)

(declare-fun e!863159 () Bool)

(declare-fun apply!1082 (ListLongMap!22371 (_ BitVec 64)) V!59317)

(declare-fun get!26012 (ValueCell!18167 V!59317) V!59317)

(declare-fun dynLambda!3825 (Int (_ BitVec 64)) V!59317)

(assert (=> b!1550628 (= e!863159 (= (apply!1082 lt!668184 (select (arr!49918 _keys!618) from!762)) (get!26012 (select (arr!49919 _values!470) from!762) (dynLambda!3825 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!863160 () Bool)

(declare-fun b!1550629 () Bool)

(assert (=> b!1550629 (= e!863160 (= lt!668184 (getCurrentListMapNoExtraKeys!6641 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1550630 () Bool)

(declare-fun e!863154 () Bool)

(assert (=> b!1550630 (= e!863154 e!863160)))

(declare-fun c!142590 () Bool)

(assert (=> b!1550630 (= c!142590 (bvslt from!762 (size!50470 _keys!618)))))

(declare-fun b!1550631 () Bool)

(declare-fun res!1062082 () Bool)

(declare-fun e!863157 () Bool)

(assert (=> b!1550631 (=> (not res!1062082) (not e!863157))))

(assert (=> b!1550631 (= res!1062082 (not (contains!10064 lt!668184 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1550632 () Bool)

(declare-fun e!863155 () ListLongMap!22371)

(declare-fun e!863156 () ListLongMap!22371)

(assert (=> b!1550632 (= e!863155 e!863156)))

(declare-fun c!142588 () Bool)

(assert (=> b!1550632 (= c!142588 (validKeyInArray!0 (select (arr!49918 _keys!618) from!762)))))

(declare-fun d!160691 () Bool)

(assert (=> d!160691 e!863157))

(declare-fun res!1062083 () Bool)

(assert (=> d!160691 (=> (not res!1062083) (not e!863157))))

(assert (=> d!160691 (= res!1062083 (not (contains!10064 lt!668184 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!160691 (= lt!668184 e!863155)))

(declare-fun c!142591 () Bool)

(assert (=> d!160691 (= c!142591 (bvsge from!762 (size!50470 _keys!618)))))

(assert (=> d!160691 (validMask!0 mask!926)))

(assert (=> d!160691 (= (getCurrentListMapNoExtraKeys!6641 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!668184)))

(declare-fun b!1550633 () Bool)

(assert (=> b!1550633 (= e!863155 (ListLongMap!22372 Nil!36211))))

(declare-fun b!1550634 () Bool)

(declare-fun call!70843 () ListLongMap!22371)

(assert (=> b!1550634 (= e!863156 call!70843)))

(declare-fun b!1550635 () Bool)

(declare-fun lt!668186 () Unit!51472)

(declare-fun lt!668181 () Unit!51472)

(assert (=> b!1550635 (= lt!668186 lt!668181)))

(declare-fun lt!668185 () (_ BitVec 64))

(declare-fun lt!668183 () ListLongMap!22371)

(declare-fun lt!668182 () (_ BitVec 64))

(declare-fun lt!668187 () V!59317)

(assert (=> b!1550635 (not (contains!10064 (+!5017 lt!668183 (tuple2!24763 lt!668185 lt!668187)) lt!668182))))

(declare-fun addStillNotContains!498 (ListLongMap!22371 (_ BitVec 64) V!59317 (_ BitVec 64)) Unit!51472)

(assert (=> b!1550635 (= lt!668181 (addStillNotContains!498 lt!668183 lt!668185 lt!668187 lt!668182))))

(assert (=> b!1550635 (= lt!668182 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1550635 (= lt!668187 (get!26012 (select (arr!49919 _values!470) from!762) (dynLambda!3825 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1550635 (= lt!668185 (select (arr!49918 _keys!618) from!762))))

(assert (=> b!1550635 (= lt!668183 call!70843)))

(assert (=> b!1550635 (= e!863156 (+!5017 call!70843 (tuple2!24763 (select (arr!49918 _keys!618) from!762) (get!26012 (select (arr!49919 _values!470) from!762) (dynLambda!3825 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1550636 () Bool)

(declare-fun isEmpty!1134 (ListLongMap!22371) Bool)

(assert (=> b!1550636 (= e!863160 (isEmpty!1134 lt!668184))))

(declare-fun b!1550637 () Bool)

(assert (=> b!1550637 (= e!863154 e!863159)))

(assert (=> b!1550637 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50470 _keys!618)))))

(declare-fun res!1062081 () Bool)

(assert (=> b!1550637 (= res!1062081 (contains!10064 lt!668184 (select (arr!49918 _keys!618) from!762)))))

(assert (=> b!1550637 (=> (not res!1062081) (not e!863159))))

(declare-fun b!1550638 () Bool)

(assert (=> b!1550638 (= e!863157 e!863154)))

(declare-fun c!142589 () Bool)

(declare-fun e!863158 () Bool)

(assert (=> b!1550638 (= c!142589 e!863158)))

(declare-fun res!1062084 () Bool)

(assert (=> b!1550638 (=> (not res!1062084) (not e!863158))))

(assert (=> b!1550638 (= res!1062084 (bvslt from!762 (size!50470 _keys!618)))))

(declare-fun bm!70840 () Bool)

(assert (=> bm!70840 (= call!70843 (getCurrentListMapNoExtraKeys!6641 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1550639 () Bool)

(assert (=> b!1550639 (= e!863158 (validKeyInArray!0 (select (arr!49918 _keys!618) from!762)))))

(assert (=> b!1550639 (bvsge from!762 #b00000000000000000000000000000000)))

(assert (= (and d!160691 c!142591) b!1550633))

(assert (= (and d!160691 (not c!142591)) b!1550632))

(assert (= (and b!1550632 c!142588) b!1550635))

(assert (= (and b!1550632 (not c!142588)) b!1550634))

(assert (= (or b!1550635 b!1550634) bm!70840))

(assert (= (and d!160691 res!1062083) b!1550631))

(assert (= (and b!1550631 res!1062082) b!1550638))

(assert (= (and b!1550638 res!1062084) b!1550639))

(assert (= (and b!1550638 c!142589) b!1550637))

(assert (= (and b!1550638 (not c!142589)) b!1550630))

(assert (= (and b!1550637 res!1062081) b!1550628))

(assert (= (and b!1550630 c!142590) b!1550629))

(assert (= (and b!1550630 (not c!142590)) b!1550636))

(declare-fun b_lambda!24753 () Bool)

(assert (=> (not b_lambda!24753) (not b!1550628)))

(declare-fun t!50920 () Bool)

(declare-fun tb!12469 () Bool)

(assert (=> (and start!132134 (= defaultEntry!478 defaultEntry!478) t!50920) tb!12469))

(declare-fun result!26059 () Bool)

(assert (=> tb!12469 (= result!26059 tp_is_empty!38155)))

(assert (=> b!1550628 t!50920))

(declare-fun b_and!51293 () Bool)

(assert (= b_and!51287 (and (=> t!50920 result!26059) b_and!51293)))

(declare-fun b_lambda!24755 () Bool)

(assert (=> (not b_lambda!24755) (not b!1550635)))

(assert (=> b!1550635 t!50920))

(declare-fun b_and!51295 () Bool)

(assert (= b_and!51293 (and (=> t!50920 result!26059) b_and!51295)))

(declare-fun m!1428799 () Bool)

(assert (=> b!1550631 m!1428799))

(declare-fun m!1428801 () Bool)

(assert (=> d!160691 m!1428801))

(assert (=> d!160691 m!1428677))

(declare-fun m!1428803 () Bool)

(assert (=> bm!70840 m!1428803))

(declare-fun m!1428805 () Bool)

(assert (=> b!1550636 m!1428805))

(assert (=> b!1550639 m!1428671))

(assert (=> b!1550639 m!1428671))

(assert (=> b!1550639 m!1428673))

(declare-fun m!1428807 () Bool)

(assert (=> b!1550628 m!1428807))

(declare-fun m!1428809 () Bool)

(assert (=> b!1550628 m!1428809))

(assert (=> b!1550628 m!1428807))

(declare-fun m!1428811 () Bool)

(assert (=> b!1550628 m!1428811))

(assert (=> b!1550628 m!1428809))

(assert (=> b!1550628 m!1428671))

(assert (=> b!1550628 m!1428671))

(declare-fun m!1428813 () Bool)

(assert (=> b!1550628 m!1428813))

(assert (=> b!1550635 m!1428807))

(assert (=> b!1550635 m!1428671))

(declare-fun m!1428815 () Bool)

(assert (=> b!1550635 m!1428815))

(declare-fun m!1428817 () Bool)

(assert (=> b!1550635 m!1428817))

(assert (=> b!1550635 m!1428809))

(assert (=> b!1550635 m!1428815))

(declare-fun m!1428819 () Bool)

(assert (=> b!1550635 m!1428819))

(declare-fun m!1428821 () Bool)

(assert (=> b!1550635 m!1428821))

(assert (=> b!1550635 m!1428809))

(assert (=> b!1550635 m!1428807))

(assert (=> b!1550635 m!1428811))

(assert (=> b!1550632 m!1428671))

(assert (=> b!1550632 m!1428671))

(assert (=> b!1550632 m!1428673))

(assert (=> b!1550629 m!1428803))

(assert (=> b!1550637 m!1428671))

(assert (=> b!1550637 m!1428671))

(declare-fun m!1428823 () Bool)

(assert (=> b!1550637 m!1428823))

(assert (=> b!1550458 d!160691))

(declare-fun d!160693 () Bool)

(declare-fun e!863161 () Bool)

(assert (=> d!160693 e!863161))

(declare-fun res!1062086 () Bool)

(assert (=> d!160693 (=> (not res!1062086) (not e!863161))))

(declare-fun lt!668190 () ListLongMap!22371)

(assert (=> d!160693 (= res!1062086 (contains!10064 lt!668190 (_1!12392 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!668188 () List!36214)

(assert (=> d!160693 (= lt!668190 (ListLongMap!22372 lt!668188))))

(declare-fun lt!668191 () Unit!51472)

(declare-fun lt!668189 () Unit!51472)

(assert (=> d!160693 (= lt!668191 lt!668189)))

(assert (=> d!160693 (= (getValueByKey!732 lt!668188 (_1!12392 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!806 (_2!12392 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160693 (= lt!668189 (lemmaContainsTupThenGetReturnValue!372 lt!668188 (_1!12392 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12392 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160693 (= lt!668188 (insertStrictlySorted!501 (toList!11201 lt!668102) (_1!12392 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12392 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!160693 (= (+!5017 lt!668102 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!668190)))

(declare-fun b!1550642 () Bool)

(declare-fun res!1062085 () Bool)

(assert (=> b!1550642 (=> (not res!1062085) (not e!863161))))

(assert (=> b!1550642 (= res!1062085 (= (getValueByKey!732 (toList!11201 lt!668190) (_1!12392 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!806 (_2!12392 (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1550643 () Bool)

(assert (=> b!1550643 (= e!863161 (contains!10067 (toList!11201 lt!668190) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!160693 res!1062086) b!1550642))

(assert (= (and b!1550642 res!1062085) b!1550643))

(declare-fun m!1428825 () Bool)

(assert (=> d!160693 m!1428825))

(declare-fun m!1428827 () Bool)

(assert (=> d!160693 m!1428827))

(declare-fun m!1428829 () Bool)

(assert (=> d!160693 m!1428829))

(declare-fun m!1428831 () Bool)

(assert (=> d!160693 m!1428831))

(declare-fun m!1428833 () Bool)

(assert (=> b!1550642 m!1428833))

(declare-fun m!1428835 () Bool)

(assert (=> b!1550643 m!1428835))

(assert (=> b!1550458 d!160693))

(declare-fun b!1550654 () Bool)

(declare-fun e!863171 () Bool)

(declare-fun e!863170 () Bool)

(assert (=> b!1550654 (= e!863171 e!863170)))

(declare-fun res!1062093 () Bool)

(assert (=> b!1550654 (=> (not res!1062093) (not e!863170))))

(declare-fun e!863173 () Bool)

(assert (=> b!1550654 (= res!1062093 (not e!863173))))

(declare-fun res!1062095 () Bool)

(assert (=> b!1550654 (=> (not res!1062095) (not e!863173))))

(assert (=> b!1550654 (= res!1062095 (validKeyInArray!0 (select (arr!49918 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!160695 () Bool)

(declare-fun res!1062094 () Bool)

(assert (=> d!160695 (=> res!1062094 e!863171)))

(assert (=> d!160695 (= res!1062094 (bvsge #b00000000000000000000000000000000 (size!50470 _keys!618)))))

(assert (=> d!160695 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36212) e!863171)))

(declare-fun b!1550655 () Bool)

(declare-fun e!863172 () Bool)

(declare-fun call!70846 () Bool)

(assert (=> b!1550655 (= e!863172 call!70846)))

(declare-fun bm!70843 () Bool)

(declare-fun c!142594 () Bool)

(assert (=> bm!70843 (= call!70846 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!142594 (Cons!36211 (select (arr!49918 _keys!618) #b00000000000000000000000000000000) Nil!36212) Nil!36212)))))

(declare-fun b!1550656 () Bool)

(assert (=> b!1550656 (= e!863170 e!863172)))

(assert (=> b!1550656 (= c!142594 (validKeyInArray!0 (select (arr!49918 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1550657 () Bool)

(declare-fun contains!10068 (List!36215 (_ BitVec 64)) Bool)

(assert (=> b!1550657 (= e!863173 (contains!10068 Nil!36212 (select (arr!49918 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1550658 () Bool)

(assert (=> b!1550658 (= e!863172 call!70846)))

(assert (= (and d!160695 (not res!1062094)) b!1550654))

(assert (= (and b!1550654 res!1062095) b!1550657))

(assert (= (and b!1550654 res!1062093) b!1550656))

(assert (= (and b!1550656 c!142594) b!1550658))

(assert (= (and b!1550656 (not c!142594)) b!1550655))

(assert (= (or b!1550658 b!1550655) bm!70843))

(assert (=> b!1550654 m!1428771))

(assert (=> b!1550654 m!1428771))

(assert (=> b!1550654 m!1428773))

(assert (=> bm!70843 m!1428771))

(declare-fun m!1428837 () Bool)

(assert (=> bm!70843 m!1428837))

(assert (=> b!1550656 m!1428771))

(assert (=> b!1550656 m!1428771))

(assert (=> b!1550656 m!1428773))

(assert (=> b!1550657 m!1428771))

(assert (=> b!1550657 m!1428771))

(declare-fun m!1428839 () Bool)

(assert (=> b!1550657 m!1428839))

(assert (=> b!1550463 d!160695))

(declare-fun d!160697 () Bool)

(declare-fun e!863174 () Bool)

(assert (=> d!160697 e!863174))

(declare-fun res!1062097 () Bool)

(assert (=> d!160697 (=> (not res!1062097) (not e!863174))))

(declare-fun lt!668194 () ListLongMap!22371)

(assert (=> d!160697 (= res!1062097 (contains!10064 lt!668194 (_1!12392 (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!668192 () List!36214)

(assert (=> d!160697 (= lt!668194 (ListLongMap!22372 lt!668192))))

(declare-fun lt!668195 () Unit!51472)

(declare-fun lt!668193 () Unit!51472)

(assert (=> d!160697 (= lt!668195 lt!668193)))

(assert (=> d!160697 (= (getValueByKey!732 lt!668192 (_1!12392 (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!806 (_2!12392 (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160697 (= lt!668193 (lemmaContainsTupThenGetReturnValue!372 lt!668192 (_1!12392 (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12392 (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160697 (= lt!668192 (insertStrictlySorted!501 (toList!11201 (ite c!142552 call!70805 (ite c!142554 call!70807 call!70804))) (_1!12392 (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12392 (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!160697 (= (+!5017 (ite c!142552 call!70805 (ite c!142554 call!70807 call!70804)) (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!668194)))

(declare-fun b!1550659 () Bool)

(declare-fun res!1062096 () Bool)

(assert (=> b!1550659 (=> (not res!1062096) (not e!863174))))

(assert (=> b!1550659 (= res!1062096 (= (getValueByKey!732 (toList!11201 lt!668194) (_1!12392 (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!806 (_2!12392 (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1550660 () Bool)

(assert (=> b!1550660 (= e!863174 (contains!10067 (toList!11201 lt!668194) (ite (or c!142552 c!142554) (tuple2!24763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!160697 res!1062097) b!1550659))

(assert (= (and b!1550659 res!1062096) b!1550660))

(declare-fun m!1428841 () Bool)

(assert (=> d!160697 m!1428841))

(declare-fun m!1428843 () Bool)

(assert (=> d!160697 m!1428843))

(declare-fun m!1428845 () Bool)

(assert (=> d!160697 m!1428845))

(declare-fun m!1428847 () Bool)

(assert (=> d!160697 m!1428847))

(declare-fun m!1428849 () Bool)

(assert (=> b!1550659 m!1428849))

(declare-fun m!1428851 () Bool)

(assert (=> b!1550660 m!1428851))

(assert (=> bm!70804 d!160697))

(declare-fun d!160699 () Bool)

(assert (=> d!160699 (= (validKeyInArray!0 (select (arr!49918 _keys!618) from!762)) (and (not (= (select (arr!49918 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49918 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1550464 d!160699))

(assert (=> bm!70801 d!160691))

(declare-fun b!1550668 () Bool)

(declare-fun e!863179 () Bool)

(assert (=> b!1550668 (= e!863179 tp_is_empty!38155)))

(declare-fun mapNonEmpty!58948 () Bool)

(declare-fun mapRes!58948 () Bool)

(declare-fun tp!111908 () Bool)

(declare-fun e!863180 () Bool)

(assert (=> mapNonEmpty!58948 (= mapRes!58948 (and tp!111908 e!863180))))

(declare-fun mapValue!58948 () ValueCell!18167)

(declare-fun mapRest!58948 () (Array (_ BitVec 32) ValueCell!18167))

(declare-fun mapKey!58948 () (_ BitVec 32))

(assert (=> mapNonEmpty!58948 (= mapRest!58939 (store mapRest!58948 mapKey!58948 mapValue!58948))))

(declare-fun condMapEmpty!58948 () Bool)

(declare-fun mapDefault!58948 () ValueCell!18167)

(assert (=> mapNonEmpty!58939 (= condMapEmpty!58948 (= mapRest!58939 ((as const (Array (_ BitVec 32) ValueCell!18167)) mapDefault!58948)))))

(assert (=> mapNonEmpty!58939 (= tp!111893 (and e!863179 mapRes!58948))))

(declare-fun b!1550667 () Bool)

(assert (=> b!1550667 (= e!863180 tp_is_empty!38155)))

(declare-fun mapIsEmpty!58948 () Bool)

(assert (=> mapIsEmpty!58948 mapRes!58948))

(assert (= (and mapNonEmpty!58939 condMapEmpty!58948) mapIsEmpty!58948))

(assert (= (and mapNonEmpty!58939 (not condMapEmpty!58948)) mapNonEmpty!58948))

(assert (= (and mapNonEmpty!58948 ((_ is ValueCellFull!18167) mapValue!58948)) b!1550667))

(assert (= (and mapNonEmpty!58939 ((_ is ValueCellFull!18167) mapDefault!58948)) b!1550668))

(declare-fun m!1428853 () Bool)

(assert (=> mapNonEmpty!58948 m!1428853))

(declare-fun b_lambda!24757 () Bool)

(assert (= b_lambda!24755 (or (and start!132134 b_free!31879) b_lambda!24757)))

(declare-fun b_lambda!24759 () Bool)

(assert (= b_lambda!24753 (or (and start!132134 b_free!31879) b_lambda!24759)))

(check-sat (not b!1550578) (not b!1550636) (not b!1550660) (not b!1550643) (not b!1550629) (not b!1550589) (not b!1550635) b_and!51295 (not b_lambda!24757) (not bm!70843) (not b!1550631) (not b_lambda!24759) (not b!1550598) (not b!1550639) (not b!1550600) (not b!1550657) (not d!160689) (not b!1550642) (not b!1550656) (not mapNonEmpty!58948) (not d!160685) tp_is_empty!38155 (not d!160691) (not d!160687) (not b!1550632) (not bm!70840) (not b!1550628) (not b!1550603) (not b!1550637) (not b!1550588) (not b!1550659) (not d!160681) (not b!1550654) (not d!160697) (not b_next!31879) (not b!1550577) (not d!160693) (not b!1550601) (not bm!70837))
(check-sat b_and!51295 (not b_next!31879))
