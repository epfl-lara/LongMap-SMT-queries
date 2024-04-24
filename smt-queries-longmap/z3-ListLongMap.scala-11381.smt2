; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132664 () Bool)

(assert start!132664)

(declare-fun b_free!31903 () Bool)

(declare-fun b_next!31903 () Bool)

(assert (=> start!132664 (= b_free!31903 (not b_next!31903))))

(declare-fun tp!111970 () Bool)

(declare-fun b_and!51339 () Bool)

(assert (=> start!132664 (= tp!111970 b_and!51339)))

(declare-fun b!1553995 () Bool)

(declare-fun res!1063349 () Bool)

(declare-fun e!865229 () Bool)

(assert (=> b!1553995 (=> (not res!1063349) (not e!865229))))

(declare-datatypes ((array!103684 0))(
  ( (array!103685 (arr!50034 (Array (_ BitVec 32) (_ BitVec 64))) (size!50585 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103684)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103684 (_ BitVec 32)) Bool)

(assert (=> b!1553995 (= res!1063349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1553996 () Bool)

(declare-fun res!1063352 () Bool)

(declare-fun e!865226 () Bool)

(assert (=> b!1553996 (=> (not res!1063352) (not e!865226))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1553996 (= res!1063352 (validKeyInArray!0 (select (arr!50034 _keys!618) from!762)))))

(declare-datatypes ((V!59349 0))(
  ( (V!59350 (val!19167 Int)) )
))
(declare-fun zeroValue!436 () V!59349)

(declare-datatypes ((tuple2!24764 0))(
  ( (tuple2!24765 (_1!12393 (_ BitVec 64)) (_2!12393 V!59349)) )
))
(declare-datatypes ((List!36216 0))(
  ( (Nil!36213) (Cons!36212 (h!37675 tuple2!24764) (t!50920 List!36216)) )
))
(declare-datatypes ((ListLongMap!22381 0))(
  ( (ListLongMap!22382 (toList!11206 List!36216)) )
))
(declare-fun call!71186 () ListLongMap!22381)

(declare-fun minValue!436 () V!59349)

(declare-fun c!143594 () Bool)

(declare-fun c!143595 () Bool)

(declare-fun call!71189 () ListLongMap!22381)

(declare-fun call!71187 () ListLongMap!22381)

(declare-fun call!71190 () ListLongMap!22381)

(declare-fun bm!71183 () Bool)

(declare-fun +!5036 (ListLongMap!22381 tuple2!24764) ListLongMap!22381)

(assert (=> bm!71183 (= call!71186 (+!5036 (ite c!143594 call!71187 (ite c!143595 call!71190 call!71189)) (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1553997 () Bool)

(declare-fun e!865230 () Bool)

(assert (=> b!1553997 (= e!865226 (not e!865230))))

(declare-fun res!1063347 () Bool)

(assert (=> b!1553997 (=> (not res!1063347) (not e!865230))))

(declare-fun lt!669662 () ListLongMap!22381)

(declare-fun contains!10162 (ListLongMap!22381 (_ BitVec 64)) Bool)

(assert (=> b!1553997 (= res!1063347 (contains!10162 lt!669662 (select (arr!50034 _keys!618) from!762)))))

(declare-fun lt!669658 () V!59349)

(declare-fun lt!669655 () ListLongMap!22381)

(declare-fun apply!1103 (ListLongMap!22381 (_ BitVec 64)) V!59349)

(assert (=> b!1553997 (= (apply!1103 lt!669655 (select (arr!50034 _keys!618) from!762)) lt!669658)))

(declare-datatypes ((Unit!51587 0))(
  ( (Unit!51588) )
))
(declare-fun lt!669659 () Unit!51587)

(declare-fun addApplyDifferent!630 (ListLongMap!22381 (_ BitVec 64) V!59349 (_ BitVec 64)) Unit!51587)

(assert (=> b!1553997 (= lt!669659 (addApplyDifferent!630 lt!669662 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50034 _keys!618) from!762)))))

(declare-fun lt!669663 () V!59349)

(assert (=> b!1553997 (= lt!669663 lt!669658)))

(assert (=> b!1553997 (= lt!669658 (apply!1103 lt!669662 (select (arr!50034 _keys!618) from!762)))))

(assert (=> b!1553997 (= lt!669663 (apply!1103 (+!5036 lt!669662 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50034 _keys!618) from!762)))))

(declare-fun lt!669657 () Unit!51587)

(assert (=> b!1553997 (= lt!669657 (addApplyDifferent!630 lt!669662 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50034 _keys!618) from!762)))))

(assert (=> b!1553997 (contains!10162 lt!669655 (select (arr!50034 _keys!618) from!762))))

(assert (=> b!1553997 (= lt!669655 (+!5036 lt!669662 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!669660 () Unit!51587)

(declare-fun addStillContains!1295 (ListLongMap!22381 (_ BitVec 64) V!59349 (_ BitVec 64)) Unit!51587)

(assert (=> b!1553997 (= lt!669660 (addStillContains!1295 lt!669662 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50034 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-datatypes ((ValueCell!18179 0))(
  ( (ValueCellFull!18179 (v!21963 V!59349)) (EmptyCell!18179) )
))
(declare-datatypes ((array!103686 0))(
  ( (array!103687 (arr!50035 (Array (_ BitVec 32) ValueCell!18179)) (size!50586 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103686)

(declare-fun getCurrentListMapNoExtraKeys!6669 (array!103684 array!103686 (_ BitVec 32) (_ BitVec 32) V!59349 V!59349 (_ BitVec 32) Int) ListLongMap!22381)

(assert (=> b!1553997 (= lt!669662 (getCurrentListMapNoExtraKeys!6669 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1553998 () Bool)

(declare-fun e!865233 () ListLongMap!22381)

(declare-fun e!865234 () ListLongMap!22381)

(assert (=> b!1553998 (= e!865233 e!865234)))

(declare-fun lt!669656 () Bool)

(assert (=> b!1553998 (= c!143595 (and (not lt!669656) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1553999 () Bool)

(declare-fun call!71188 () ListLongMap!22381)

(assert (=> b!1553999 (= e!865234 call!71188)))

(declare-fun bm!71184 () Bool)

(assert (=> bm!71184 (= call!71188 call!71186)))

(declare-fun b!1554000 () Bool)

(declare-fun e!865227 () Bool)

(declare-fun tp_is_empty!38179 () Bool)

(assert (=> b!1554000 (= e!865227 tp_is_empty!38179)))

(declare-fun b!1554001 () Bool)

(assert (=> b!1554001 (= e!865229 e!865226)))

(declare-fun res!1063348 () Bool)

(assert (=> b!1554001 (=> (not res!1063348) (not e!865226))))

(assert (=> b!1554001 (= res!1063348 (bvslt from!762 (size!50585 _keys!618)))))

(declare-fun lt!669661 () ListLongMap!22381)

(assert (=> b!1554001 (= lt!669661 e!865233)))

(assert (=> b!1554001 (= c!143594 (and (not lt!669656) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1554001 (= lt!669656 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1554002 () Bool)

(declare-fun res!1063351 () Bool)

(assert (=> b!1554002 (=> (not res!1063351) (not e!865229))))

(assert (=> b!1554002 (= res!1063351 (and (= (size!50586 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50585 _keys!618) (size!50586 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!71185 () Bool)

(assert (=> bm!71185 (= call!71190 call!71187)))

(declare-fun b!1554003 () Bool)

(declare-fun c!143593 () Bool)

(assert (=> b!1554003 (= c!143593 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669656))))

(declare-fun e!865232 () ListLongMap!22381)

(assert (=> b!1554003 (= e!865234 e!865232)))

(declare-fun res!1063350 () Bool)

(assert (=> start!132664 (=> (not res!1063350) (not e!865229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132664 (= res!1063350 (validMask!0 mask!926))))

(assert (=> start!132664 e!865229))

(declare-fun array_inv!39159 (array!103684) Bool)

(assert (=> start!132664 (array_inv!39159 _keys!618)))

(assert (=> start!132664 tp_is_empty!38179))

(assert (=> start!132664 true))

(assert (=> start!132664 tp!111970))

(declare-fun e!865225 () Bool)

(declare-fun array_inv!39160 (array!103686) Bool)

(assert (=> start!132664 (and (array_inv!39160 _values!470) e!865225)))

(declare-fun bm!71186 () Bool)

(assert (=> bm!71186 (= call!71189 call!71190)))

(declare-fun mapNonEmpty!58981 () Bool)

(declare-fun mapRes!58981 () Bool)

(declare-fun tp!111969 () Bool)

(assert (=> mapNonEmpty!58981 (= mapRes!58981 (and tp!111969 e!865227))))

(declare-fun mapRest!58981 () (Array (_ BitVec 32) ValueCell!18179))

(declare-fun mapValue!58981 () ValueCell!18179)

(declare-fun mapKey!58981 () (_ BitVec 32))

(assert (=> mapNonEmpty!58981 (= (arr!50035 _values!470) (store mapRest!58981 mapKey!58981 mapValue!58981))))

(declare-fun b!1554004 () Bool)

(assert (=> b!1554004 (= e!865230 (not (= (select (arr!50034 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1554005 () Bool)

(declare-fun e!865231 () Bool)

(assert (=> b!1554005 (= e!865225 (and e!865231 mapRes!58981))))

(declare-fun condMapEmpty!58981 () Bool)

(declare-fun mapDefault!58981 () ValueCell!18179)

(assert (=> b!1554005 (= condMapEmpty!58981 (= (arr!50035 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18179)) mapDefault!58981)))))

(declare-fun bm!71187 () Bool)

(assert (=> bm!71187 (= call!71187 (getCurrentListMapNoExtraKeys!6669 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1554006 () Bool)

(assert (=> b!1554006 (= e!865232 call!71189)))

(declare-fun b!1554007 () Bool)

(assert (=> b!1554007 (= e!865232 call!71188)))

(declare-fun b!1554008 () Bool)

(assert (=> b!1554008 (= e!865233 (+!5036 call!71186 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1554009 () Bool)

(declare-fun res!1063354 () Bool)

(assert (=> b!1554009 (=> (not res!1063354) (not e!865229))))

(declare-datatypes ((List!36217 0))(
  ( (Nil!36214) (Cons!36213 (h!37676 (_ BitVec 64)) (t!50921 List!36217)) )
))
(declare-fun arrayNoDuplicates!0 (array!103684 (_ BitVec 32) List!36217) Bool)

(assert (=> b!1554009 (= res!1063354 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36214))))

(declare-fun b!1554010 () Bool)

(assert (=> b!1554010 (= e!865231 tp_is_empty!38179)))

(declare-fun mapIsEmpty!58981 () Bool)

(assert (=> mapIsEmpty!58981 mapRes!58981))

(declare-fun b!1554011 () Bool)

(declare-fun res!1063353 () Bool)

(assert (=> b!1554011 (=> (not res!1063353) (not e!865229))))

(assert (=> b!1554011 (= res!1063353 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50585 _keys!618))))))

(assert (= (and start!132664 res!1063350) b!1554002))

(assert (= (and b!1554002 res!1063351) b!1553995))

(assert (= (and b!1553995 res!1063349) b!1554009))

(assert (= (and b!1554009 res!1063354) b!1554011))

(assert (= (and b!1554011 res!1063353) b!1554001))

(assert (= (and b!1554001 c!143594) b!1554008))

(assert (= (and b!1554001 (not c!143594)) b!1553998))

(assert (= (and b!1553998 c!143595) b!1553999))

(assert (= (and b!1553998 (not c!143595)) b!1554003))

(assert (= (and b!1554003 c!143593) b!1554007))

(assert (= (and b!1554003 (not c!143593)) b!1554006))

(assert (= (or b!1554007 b!1554006) bm!71186))

(assert (= (or b!1553999 bm!71186) bm!71185))

(assert (= (or b!1553999 b!1554007) bm!71184))

(assert (= (or b!1554008 bm!71185) bm!71187))

(assert (= (or b!1554008 bm!71184) bm!71183))

(assert (= (and b!1554001 res!1063348) b!1553996))

(assert (= (and b!1553996 res!1063352) b!1553997))

(assert (= (and b!1553997 res!1063347) b!1554004))

(assert (= (and b!1554005 condMapEmpty!58981) mapIsEmpty!58981))

(assert (= (and b!1554005 (not condMapEmpty!58981)) mapNonEmpty!58981))

(get-info :version)

(assert (= (and mapNonEmpty!58981 ((_ is ValueCellFull!18179) mapValue!58981)) b!1554000))

(assert (= (and b!1554005 ((_ is ValueCellFull!18179) mapDefault!58981)) b!1554010))

(assert (= start!132664 b!1554005))

(declare-fun m!1432465 () Bool)

(assert (=> b!1554009 m!1432465))

(declare-fun m!1432467 () Bool)

(assert (=> bm!71187 m!1432467))

(declare-fun m!1432469 () Bool)

(assert (=> b!1554004 m!1432469))

(declare-fun m!1432471 () Bool)

(assert (=> b!1553995 m!1432471))

(assert (=> b!1553997 m!1432467))

(assert (=> b!1553997 m!1432469))

(declare-fun m!1432473 () Bool)

(assert (=> b!1553997 m!1432473))

(declare-fun m!1432475 () Bool)

(assert (=> b!1553997 m!1432475))

(assert (=> b!1553997 m!1432469))

(declare-fun m!1432477 () Bool)

(assert (=> b!1553997 m!1432477))

(assert (=> b!1553997 m!1432469))

(declare-fun m!1432479 () Bool)

(assert (=> b!1553997 m!1432479))

(declare-fun m!1432481 () Bool)

(assert (=> b!1553997 m!1432481))

(assert (=> b!1553997 m!1432469))

(declare-fun m!1432483 () Bool)

(assert (=> b!1553997 m!1432483))

(assert (=> b!1553997 m!1432481))

(assert (=> b!1553997 m!1432469))

(declare-fun m!1432485 () Bool)

(assert (=> b!1553997 m!1432485))

(assert (=> b!1553997 m!1432469))

(assert (=> b!1553997 m!1432469))

(declare-fun m!1432487 () Bool)

(assert (=> b!1553997 m!1432487))

(assert (=> b!1553997 m!1432469))

(declare-fun m!1432489 () Bool)

(assert (=> b!1553997 m!1432489))

(assert (=> b!1553997 m!1432469))

(declare-fun m!1432491 () Bool)

(assert (=> b!1553997 m!1432491))

(declare-fun m!1432493 () Bool)

(assert (=> bm!71183 m!1432493))

(declare-fun m!1432495 () Bool)

(assert (=> b!1554008 m!1432495))

(declare-fun m!1432497 () Bool)

(assert (=> mapNonEmpty!58981 m!1432497))

(declare-fun m!1432499 () Bool)

(assert (=> start!132664 m!1432499))

(declare-fun m!1432501 () Bool)

(assert (=> start!132664 m!1432501))

(declare-fun m!1432503 () Bool)

(assert (=> start!132664 m!1432503))

(assert (=> b!1553996 m!1432469))

(assert (=> b!1553996 m!1432469))

(declare-fun m!1432505 () Bool)

(assert (=> b!1553996 m!1432505))

(check-sat (not b!1553995) (not b!1554008) (not b_next!31903) (not b!1554009) (not b!1553997) b_and!51339 (not start!132664) (not b!1553996) (not mapNonEmpty!58981) tp_is_empty!38179 (not bm!71183) (not bm!71187))
(check-sat b_and!51339 (not b_next!31903))
(get-model)

(declare-fun d!161697 () Bool)

(assert (=> d!161697 (= (validKeyInArray!0 (select (arr!50034 _keys!618) from!762)) (and (not (= (select (arr!50034 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50034 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1553996 d!161697))

(declare-fun d!161699 () Bool)

(declare-fun e!865297 () Bool)

(assert (=> d!161699 e!865297))

(declare-fun res!1063408 () Bool)

(assert (=> d!161699 (=> (not res!1063408) (not e!865297))))

(declare-fun lt!669726 () ListLongMap!22381)

(assert (=> d!161699 (= res!1063408 (contains!10162 lt!669726 (_1!12393 (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lt!669729 () List!36216)

(assert (=> d!161699 (= lt!669726 (ListLongMap!22382 lt!669729))))

(declare-fun lt!669728 () Unit!51587)

(declare-fun lt!669727 () Unit!51587)

(assert (=> d!161699 (= lt!669728 lt!669727)))

(declare-datatypes ((Option!802 0))(
  ( (Some!801 (v!21966 V!59349)) (None!800) )
))
(declare-fun getValueByKey!727 (List!36216 (_ BitVec 64)) Option!802)

(assert (=> d!161699 (= (getValueByKey!727 lt!669729 (_1!12393 (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!801 (_2!12393 (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!374 (List!36216 (_ BitVec 64) V!59349) Unit!51587)

(assert (=> d!161699 (= lt!669727 (lemmaContainsTupThenGetReturnValue!374 lt!669729 (_1!12393 (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12393 (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun insertStrictlySorted!503 (List!36216 (_ BitVec 64) V!59349) List!36216)

(assert (=> d!161699 (= lt!669729 (insertStrictlySorted!503 (toList!11206 (ite c!143594 call!71187 (ite c!143595 call!71190 call!71189))) (_1!12393 (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (_2!12393 (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(assert (=> d!161699 (= (+!5036 (ite c!143594 call!71187 (ite c!143595 call!71190 call!71189)) (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) lt!669726)))

(declare-fun b!1554118 () Bool)

(declare-fun res!1063407 () Bool)

(assert (=> b!1554118 (=> (not res!1063407) (not e!865297))))

(assert (=> b!1554118 (= res!1063407 (= (getValueByKey!727 (toList!11206 lt!669726) (_1!12393 (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))) (Some!801 (_2!12393 (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))))

(declare-fun b!1554119 () Bool)

(declare-fun contains!10163 (List!36216 tuple2!24764) Bool)

(assert (=> b!1554119 (= e!865297 (contains!10163 (toList!11206 lt!669726) (ite (or c!143594 c!143595) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (= (and d!161699 res!1063408) b!1554118))

(assert (= (and b!1554118 res!1063407) b!1554119))

(declare-fun m!1432591 () Bool)

(assert (=> d!161699 m!1432591))

(declare-fun m!1432593 () Bool)

(assert (=> d!161699 m!1432593))

(declare-fun m!1432595 () Bool)

(assert (=> d!161699 m!1432595))

(declare-fun m!1432597 () Bool)

(assert (=> d!161699 m!1432597))

(declare-fun m!1432599 () Bool)

(assert (=> b!1554118 m!1432599))

(declare-fun m!1432601 () Bool)

(assert (=> b!1554119 m!1432601))

(assert (=> bm!71183 d!161699))

(declare-fun d!161701 () Bool)

(assert (=> d!161701 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132664 d!161701))

(declare-fun d!161703 () Bool)

(assert (=> d!161703 (= (array_inv!39159 _keys!618) (bvsge (size!50585 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132664 d!161703))

(declare-fun d!161705 () Bool)

(assert (=> d!161705 (= (array_inv!39160 _values!470) (bvsge (size!50586 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132664 d!161705))

(declare-fun d!161707 () Bool)

(declare-fun e!865298 () Bool)

(assert (=> d!161707 e!865298))

(declare-fun res!1063410 () Bool)

(assert (=> d!161707 (=> (not res!1063410) (not e!865298))))

(declare-fun lt!669730 () ListLongMap!22381)

(assert (=> d!161707 (= res!1063410 (contains!10162 lt!669730 (_1!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669733 () List!36216)

(assert (=> d!161707 (= lt!669730 (ListLongMap!22382 lt!669733))))

(declare-fun lt!669732 () Unit!51587)

(declare-fun lt!669731 () Unit!51587)

(assert (=> d!161707 (= lt!669732 lt!669731)))

(assert (=> d!161707 (= (getValueByKey!727 lt!669733 (_1!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!801 (_2!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161707 (= lt!669731 (lemmaContainsTupThenGetReturnValue!374 lt!669733 (_1!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161707 (= lt!669733 (insertStrictlySorted!503 (toList!11206 call!71186) (_1!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161707 (= (+!5036 call!71186 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669730)))

(declare-fun b!1554120 () Bool)

(declare-fun res!1063409 () Bool)

(assert (=> b!1554120 (=> (not res!1063409) (not e!865298))))

(assert (=> b!1554120 (= res!1063409 (= (getValueByKey!727 (toList!11206 lt!669730) (_1!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!801 (_2!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1554121 () Bool)

(assert (=> b!1554121 (= e!865298 (contains!10163 (toList!11206 lt!669730) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161707 res!1063410) b!1554120))

(assert (= (and b!1554120 res!1063409) b!1554121))

(declare-fun m!1432603 () Bool)

(assert (=> d!161707 m!1432603))

(declare-fun m!1432605 () Bool)

(assert (=> d!161707 m!1432605))

(declare-fun m!1432607 () Bool)

(assert (=> d!161707 m!1432607))

(declare-fun m!1432609 () Bool)

(assert (=> d!161707 m!1432609))

(declare-fun m!1432611 () Bool)

(assert (=> b!1554120 m!1432611))

(declare-fun m!1432613 () Bool)

(assert (=> b!1554121 m!1432613))

(assert (=> b!1554008 d!161707))

(declare-fun d!161709 () Bool)

(declare-fun e!865304 () Bool)

(assert (=> d!161709 e!865304))

(declare-fun res!1063413 () Bool)

(assert (=> d!161709 (=> res!1063413 e!865304)))

(declare-fun lt!669743 () Bool)

(assert (=> d!161709 (= res!1063413 (not lt!669743))))

(declare-fun lt!669745 () Bool)

(assert (=> d!161709 (= lt!669743 lt!669745)))

(declare-fun lt!669744 () Unit!51587)

(declare-fun e!865303 () Unit!51587)

(assert (=> d!161709 (= lt!669744 e!865303)))

(declare-fun c!143616 () Bool)

(assert (=> d!161709 (= c!143616 lt!669745)))

(declare-fun containsKey!753 (List!36216 (_ BitVec 64)) Bool)

(assert (=> d!161709 (= lt!669745 (containsKey!753 (toList!11206 lt!669662) (select (arr!50034 _keys!618) from!762)))))

(assert (=> d!161709 (= (contains!10162 lt!669662 (select (arr!50034 _keys!618) from!762)) lt!669743)))

(declare-fun b!1554128 () Bool)

(declare-fun lt!669742 () Unit!51587)

(assert (=> b!1554128 (= e!865303 lt!669742)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!499 (List!36216 (_ BitVec 64)) Unit!51587)

(assert (=> b!1554128 (= lt!669742 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11206 lt!669662) (select (arr!50034 _keys!618) from!762)))))

(declare-fun isDefined!545 (Option!802) Bool)

(assert (=> b!1554128 (isDefined!545 (getValueByKey!727 (toList!11206 lt!669662) (select (arr!50034 _keys!618) from!762)))))

(declare-fun b!1554129 () Bool)

(declare-fun Unit!51589 () Unit!51587)

(assert (=> b!1554129 (= e!865303 Unit!51589)))

(declare-fun b!1554130 () Bool)

(assert (=> b!1554130 (= e!865304 (isDefined!545 (getValueByKey!727 (toList!11206 lt!669662) (select (arr!50034 _keys!618) from!762))))))

(assert (= (and d!161709 c!143616) b!1554128))

(assert (= (and d!161709 (not c!143616)) b!1554129))

(assert (= (and d!161709 (not res!1063413)) b!1554130))

(assert (=> d!161709 m!1432469))

(declare-fun m!1432615 () Bool)

(assert (=> d!161709 m!1432615))

(assert (=> b!1554128 m!1432469))

(declare-fun m!1432617 () Bool)

(assert (=> b!1554128 m!1432617))

(assert (=> b!1554128 m!1432469))

(declare-fun m!1432619 () Bool)

(assert (=> b!1554128 m!1432619))

(assert (=> b!1554128 m!1432619))

(declare-fun m!1432621 () Bool)

(assert (=> b!1554128 m!1432621))

(assert (=> b!1554130 m!1432469))

(assert (=> b!1554130 m!1432619))

(assert (=> b!1554130 m!1432619))

(assert (=> b!1554130 m!1432621))

(assert (=> b!1553997 d!161709))

(declare-fun d!161711 () Bool)

(declare-fun e!865305 () Bool)

(assert (=> d!161711 e!865305))

(declare-fun res!1063415 () Bool)

(assert (=> d!161711 (=> (not res!1063415) (not e!865305))))

(declare-fun lt!669746 () ListLongMap!22381)

(assert (=> d!161711 (= res!1063415 (contains!10162 lt!669746 (_1!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun lt!669749 () List!36216)

(assert (=> d!161711 (= lt!669746 (ListLongMap!22382 lt!669749))))

(declare-fun lt!669748 () Unit!51587)

(declare-fun lt!669747 () Unit!51587)

(assert (=> d!161711 (= lt!669748 lt!669747)))

(assert (=> d!161711 (= (getValueByKey!727 lt!669749 (_1!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!801 (_2!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161711 (= lt!669747 (lemmaContainsTupThenGetReturnValue!374 lt!669749 (_1!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161711 (= lt!669749 (insertStrictlySorted!503 (toList!11206 lt!669662) (_1!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (_2!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(assert (=> d!161711 (= (+!5036 lt!669662 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) lt!669746)))

(declare-fun b!1554131 () Bool)

(declare-fun res!1063414 () Bool)

(assert (=> b!1554131 (=> (not res!1063414) (not e!865305))))

(assert (=> b!1554131 (= res!1063414 (= (getValueByKey!727 (toList!11206 lt!669746) (_1!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (Some!801 (_2!12393 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))))

(declare-fun b!1554132 () Bool)

(assert (=> b!1554132 (= e!865305 (contains!10163 (toList!11206 lt!669746) (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and d!161711 res!1063415) b!1554131))

(assert (= (and b!1554131 res!1063414) b!1554132))

(declare-fun m!1432623 () Bool)

(assert (=> d!161711 m!1432623))

(declare-fun m!1432625 () Bool)

(assert (=> d!161711 m!1432625))

(declare-fun m!1432627 () Bool)

(assert (=> d!161711 m!1432627))

(declare-fun m!1432629 () Bool)

(assert (=> d!161711 m!1432629))

(declare-fun m!1432631 () Bool)

(assert (=> b!1554131 m!1432631))

(declare-fun m!1432633 () Bool)

(assert (=> b!1554132 m!1432633))

(assert (=> b!1553997 d!161711))

(declare-fun d!161713 () Bool)

(assert (=> d!161713 (= (apply!1103 (+!5036 lt!669662 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50034 _keys!618) from!762)) (apply!1103 lt!669662 (select (arr!50034 _keys!618) from!762)))))

(declare-fun lt!669752 () Unit!51587)

(declare-fun choose!2028 (ListLongMap!22381 (_ BitVec 64) V!59349 (_ BitVec 64)) Unit!51587)

(assert (=> d!161713 (= lt!669752 (choose!2028 lt!669662 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50034 _keys!618) from!762)))))

(declare-fun e!865308 () Bool)

(assert (=> d!161713 e!865308))

(declare-fun res!1063418 () Bool)

(assert (=> d!161713 (=> (not res!1063418) (not e!865308))))

(assert (=> d!161713 (= res!1063418 (contains!10162 lt!669662 (select (arr!50034 _keys!618) from!762)))))

(assert (=> d!161713 (= (addApplyDifferent!630 lt!669662 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!50034 _keys!618) from!762)) lt!669752)))

(declare-fun b!1554136 () Bool)

(assert (=> b!1554136 (= e!865308 (not (= (select (arr!50034 _keys!618) from!762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161713 res!1063418) b!1554136))

(assert (=> d!161713 m!1432469))

(assert (=> d!161713 m!1432477))

(assert (=> d!161713 m!1432481))

(assert (=> d!161713 m!1432469))

(declare-fun m!1432635 () Bool)

(assert (=> d!161713 m!1432635))

(assert (=> d!161713 m!1432481))

(assert (=> d!161713 m!1432469))

(assert (=> d!161713 m!1432485))

(assert (=> d!161713 m!1432469))

(assert (=> d!161713 m!1432487))

(assert (=> b!1553997 d!161713))

(declare-fun lt!669770 () ListLongMap!22381)

(declare-fun b!1554161 () Bool)

(declare-fun e!865327 () Bool)

(assert (=> b!1554161 (= e!865327 (= lt!669770 (getCurrentListMapNoExtraKeys!6669 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478)))))

(declare-fun b!1554162 () Bool)

(declare-fun e!865325 () ListLongMap!22381)

(declare-fun call!71223 () ListLongMap!22381)

(assert (=> b!1554162 (= e!865325 call!71223)))

(declare-fun b!1554163 () Bool)

(declare-fun isEmpty!1134 (ListLongMap!22381) Bool)

(assert (=> b!1554163 (= e!865327 (isEmpty!1134 lt!669770))))

(declare-fun b!1554164 () Bool)

(declare-fun e!865323 () Bool)

(assert (=> b!1554164 (= e!865323 (validKeyInArray!0 (select (arr!50034 _keys!618) from!762)))))

(assert (=> b!1554164 (bvsge from!762 #b00000000000000000000000000000000)))

(declare-fun b!1554165 () Bool)

(declare-fun e!865329 () Bool)

(assert (=> b!1554165 (= e!865329 e!865327)))

(declare-fun c!143627 () Bool)

(assert (=> b!1554165 (= c!143627 (bvslt from!762 (size!50585 _keys!618)))))

(declare-fun b!1554166 () Bool)

(declare-fun e!865324 () Bool)

(assert (=> b!1554166 (= e!865324 e!865329)))

(declare-fun c!143628 () Bool)

(assert (=> b!1554166 (= c!143628 e!865323)))

(declare-fun res!1063430 () Bool)

(assert (=> b!1554166 (=> (not res!1063430) (not e!865323))))

(assert (=> b!1554166 (= res!1063430 (bvslt from!762 (size!50585 _keys!618)))))

(declare-fun d!161715 () Bool)

(assert (=> d!161715 e!865324))

(declare-fun res!1063429 () Bool)

(assert (=> d!161715 (=> (not res!1063429) (not e!865324))))

(assert (=> d!161715 (= res!1063429 (not (contains!10162 lt!669770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!865328 () ListLongMap!22381)

(assert (=> d!161715 (= lt!669770 e!865328)))

(declare-fun c!143626 () Bool)

(assert (=> d!161715 (= c!143626 (bvsge from!762 (size!50585 _keys!618)))))

(assert (=> d!161715 (validMask!0 mask!926)))

(assert (=> d!161715 (= (getCurrentListMapNoExtraKeys!6669 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) lt!669770)))

(declare-fun b!1554167 () Bool)

(assert (=> b!1554167 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50585 _keys!618)))))

(assert (=> b!1554167 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50586 _values!470)))))

(declare-fun e!865326 () Bool)

(declare-fun get!26066 (ValueCell!18179 V!59349) V!59349)

(declare-fun dynLambda!3858 (Int (_ BitVec 64)) V!59349)

(assert (=> b!1554167 (= e!865326 (= (apply!1103 lt!669770 (select (arr!50034 _keys!618) from!762)) (get!26066 (select (arr!50035 _values!470) from!762) (dynLambda!3858 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1554168 () Bool)

(assert (=> b!1554168 (= e!865328 (ListLongMap!22382 Nil!36213))))

(declare-fun b!1554169 () Bool)

(declare-fun lt!669772 () Unit!51587)

(declare-fun lt!669769 () Unit!51587)

(assert (=> b!1554169 (= lt!669772 lt!669769)))

(declare-fun lt!669773 () (_ BitVec 64))

(declare-fun lt!669768 () V!59349)

(declare-fun lt!669771 () (_ BitVec 64))

(declare-fun lt!669767 () ListLongMap!22381)

(assert (=> b!1554169 (not (contains!10162 (+!5036 lt!669767 (tuple2!24765 lt!669771 lt!669768)) lt!669773))))

(declare-fun addStillNotContains!513 (ListLongMap!22381 (_ BitVec 64) V!59349 (_ BitVec 64)) Unit!51587)

(assert (=> b!1554169 (= lt!669769 (addStillNotContains!513 lt!669767 lt!669771 lt!669768 lt!669773))))

(assert (=> b!1554169 (= lt!669773 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1554169 (= lt!669768 (get!26066 (select (arr!50035 _values!470) from!762) (dynLambda!3858 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1554169 (= lt!669771 (select (arr!50034 _keys!618) from!762))))

(assert (=> b!1554169 (= lt!669767 call!71223)))

(assert (=> b!1554169 (= e!865325 (+!5036 call!71223 (tuple2!24765 (select (arr!50034 _keys!618) from!762) (get!26066 (select (arr!50035 _values!470) from!762) (dynLambda!3858 defaultEntry!478 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1554170 () Bool)

(assert (=> b!1554170 (= e!865328 e!865325)))

(declare-fun c!143625 () Bool)

(assert (=> b!1554170 (= c!143625 (validKeyInArray!0 (select (arr!50034 _keys!618) from!762)))))

(declare-fun bm!71220 () Bool)

(assert (=> bm!71220 (= call!71223 (getCurrentListMapNoExtraKeys!6669 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 (bvadd from!762 #b00000000000000000000000000000001) defaultEntry!478))))

(declare-fun b!1554171 () Bool)

(declare-fun res!1063427 () Bool)

(assert (=> b!1554171 (=> (not res!1063427) (not e!865324))))

(assert (=> b!1554171 (= res!1063427 (not (contains!10162 lt!669770 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1554172 () Bool)

(assert (=> b!1554172 (= e!865329 e!865326)))

(assert (=> b!1554172 (and (bvsge from!762 #b00000000000000000000000000000000) (bvslt from!762 (size!50585 _keys!618)))))

(declare-fun res!1063428 () Bool)

(assert (=> b!1554172 (= res!1063428 (contains!10162 lt!669770 (select (arr!50034 _keys!618) from!762)))))

(assert (=> b!1554172 (=> (not res!1063428) (not e!865326))))

(assert (= (and d!161715 c!143626) b!1554168))

(assert (= (and d!161715 (not c!143626)) b!1554170))

(assert (= (and b!1554170 c!143625) b!1554169))

(assert (= (and b!1554170 (not c!143625)) b!1554162))

(assert (= (or b!1554169 b!1554162) bm!71220))

(assert (= (and d!161715 res!1063429) b!1554171))

(assert (= (and b!1554171 res!1063427) b!1554166))

(assert (= (and b!1554166 res!1063430) b!1554164))

(assert (= (and b!1554166 c!143628) b!1554172))

(assert (= (and b!1554166 (not c!143628)) b!1554165))

(assert (= (and b!1554172 res!1063428) b!1554167))

(assert (= (and b!1554165 c!143627) b!1554161))

(assert (= (and b!1554165 (not c!143627)) b!1554163))

(declare-fun b_lambda!24773 () Bool)

(assert (=> (not b_lambda!24773) (not b!1554167)))

(declare-fun t!50926 () Bool)

(declare-fun tb!12473 () Bool)

(assert (=> (and start!132664 (= defaultEntry!478 defaultEntry!478) t!50926) tb!12473))

(declare-fun result!26071 () Bool)

(assert (=> tb!12473 (= result!26071 tp_is_empty!38179)))

(assert (=> b!1554167 t!50926))

(declare-fun b_and!51345 () Bool)

(assert (= b_and!51339 (and (=> t!50926 result!26071) b_and!51345)))

(declare-fun b_lambda!24775 () Bool)

(assert (=> (not b_lambda!24775) (not b!1554169)))

(assert (=> b!1554169 t!50926))

(declare-fun b_and!51347 () Bool)

(assert (= b_and!51345 (and (=> t!50926 result!26071) b_and!51347)))

(assert (=> b!1554172 m!1432469))

(assert (=> b!1554172 m!1432469))

(declare-fun m!1432637 () Bool)

(assert (=> b!1554172 m!1432637))

(assert (=> b!1554164 m!1432469))

(assert (=> b!1554164 m!1432469))

(assert (=> b!1554164 m!1432505))

(declare-fun m!1432639 () Bool)

(assert (=> b!1554161 m!1432639))

(declare-fun m!1432641 () Bool)

(assert (=> d!161715 m!1432641))

(assert (=> d!161715 m!1432499))

(declare-fun m!1432643 () Bool)

(assert (=> b!1554169 m!1432643))

(declare-fun m!1432645 () Bool)

(assert (=> b!1554169 m!1432645))

(declare-fun m!1432647 () Bool)

(assert (=> b!1554169 m!1432647))

(declare-fun m!1432649 () Bool)

(assert (=> b!1554169 m!1432649))

(declare-fun m!1432651 () Bool)

(assert (=> b!1554169 m!1432651))

(assert (=> b!1554169 m!1432645))

(declare-fun m!1432653 () Bool)

(assert (=> b!1554169 m!1432653))

(declare-fun m!1432655 () Bool)

(assert (=> b!1554169 m!1432655))

(assert (=> b!1554169 m!1432469))

(assert (=> b!1554169 m!1432653))

(assert (=> b!1554169 m!1432647))

(declare-fun m!1432657 () Bool)

(assert (=> b!1554163 m!1432657))

(assert (=> b!1554167 m!1432469))

(declare-fun m!1432659 () Bool)

(assert (=> b!1554167 m!1432659))

(assert (=> b!1554167 m!1432645))

(assert (=> b!1554167 m!1432645))

(assert (=> b!1554167 m!1432653))

(assert (=> b!1554167 m!1432655))

(assert (=> b!1554167 m!1432469))

(assert (=> b!1554167 m!1432653))

(declare-fun m!1432661 () Bool)

(assert (=> b!1554171 m!1432661))

(assert (=> bm!71220 m!1432639))

(assert (=> b!1554170 m!1432469))

(assert (=> b!1554170 m!1432469))

(assert (=> b!1554170 m!1432505))

(assert (=> b!1553997 d!161715))

(declare-fun d!161717 () Bool)

(declare-fun get!26067 (Option!802) V!59349)

(assert (=> d!161717 (= (apply!1103 (+!5036 lt!669662 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!50034 _keys!618) from!762)) (get!26067 (getValueByKey!727 (toList!11206 (+!5036 lt!669662 (tuple2!24765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))) (select (arr!50034 _keys!618) from!762))))))

(declare-fun bs!44600 () Bool)

(assert (= bs!44600 d!161717))

(assert (=> bs!44600 m!1432469))

(declare-fun m!1432663 () Bool)

(assert (=> bs!44600 m!1432663))

(assert (=> bs!44600 m!1432663))

(declare-fun m!1432665 () Bool)

(assert (=> bs!44600 m!1432665))

(assert (=> b!1553997 d!161717))

(declare-fun d!161719 () Bool)

(assert (=> d!161719 (contains!10162 (+!5036 lt!669662 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50034 _keys!618) from!762))))

(declare-fun lt!669776 () Unit!51587)

(declare-fun choose!2029 (ListLongMap!22381 (_ BitVec 64) V!59349 (_ BitVec 64)) Unit!51587)

(assert (=> d!161719 (= lt!669776 (choose!2029 lt!669662 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50034 _keys!618) from!762)))))

(assert (=> d!161719 (contains!10162 lt!669662 (select (arr!50034 _keys!618) from!762))))

(assert (=> d!161719 (= (addStillContains!1295 lt!669662 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50034 _keys!618) from!762)) lt!669776)))

(declare-fun bs!44601 () Bool)

(assert (= bs!44601 d!161719))

(assert (=> bs!44601 m!1432475))

(assert (=> bs!44601 m!1432475))

(assert (=> bs!44601 m!1432469))

(declare-fun m!1432667 () Bool)

(assert (=> bs!44601 m!1432667))

(assert (=> bs!44601 m!1432469))

(declare-fun m!1432669 () Bool)

(assert (=> bs!44601 m!1432669))

(assert (=> bs!44601 m!1432469))

(assert (=> bs!44601 m!1432487))

(assert (=> b!1553997 d!161719))

(declare-fun d!161721 () Bool)

(declare-fun e!865330 () Bool)

(assert (=> d!161721 e!865330))

(declare-fun res!1063432 () Bool)

(assert (=> d!161721 (=> (not res!1063432) (not e!865330))))

(declare-fun lt!669777 () ListLongMap!22381)

(assert (=> d!161721 (= res!1063432 (contains!10162 lt!669777 (_1!12393 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(declare-fun lt!669780 () List!36216)

(assert (=> d!161721 (= lt!669777 (ListLongMap!22382 lt!669780))))

(declare-fun lt!669779 () Unit!51587)

(declare-fun lt!669778 () Unit!51587)

(assert (=> d!161721 (= lt!669779 lt!669778)))

(assert (=> d!161721 (= (getValueByKey!727 lt!669780 (_1!12393 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!801 (_2!12393 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161721 (= lt!669778 (lemmaContainsTupThenGetReturnValue!374 lt!669780 (_1!12393 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12393 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161721 (= lt!669780 (insertStrictlySorted!503 (toList!11206 lt!669662) (_1!12393 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (_2!12393 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))))))

(assert (=> d!161721 (= (+!5036 lt!669662 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) lt!669777)))

(declare-fun b!1554176 () Bool)

(declare-fun res!1063431 () Bool)

(assert (=> b!1554176 (=> (not res!1063431) (not e!865330))))

(assert (=> b!1554176 (= res!1063431 (= (getValueByKey!727 (toList!11206 lt!669777) (_1!12393 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436))) (Some!801 (_2!12393 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))))

(declare-fun b!1554177 () Bool)

(assert (=> b!1554177 (= e!865330 (contains!10163 (toList!11206 lt!669777) (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(assert (= (and d!161721 res!1063432) b!1554176))

(assert (= (and b!1554176 res!1063431) b!1554177))

(declare-fun m!1432671 () Bool)

(assert (=> d!161721 m!1432671))

(declare-fun m!1432673 () Bool)

(assert (=> d!161721 m!1432673))

(declare-fun m!1432675 () Bool)

(assert (=> d!161721 m!1432675))

(declare-fun m!1432677 () Bool)

(assert (=> d!161721 m!1432677))

(declare-fun m!1432679 () Bool)

(assert (=> b!1554176 m!1432679))

(declare-fun m!1432681 () Bool)

(assert (=> b!1554177 m!1432681))

(assert (=> b!1553997 d!161721))

(declare-fun d!161723 () Bool)

(assert (=> d!161723 (= (apply!1103 lt!669662 (select (arr!50034 _keys!618) from!762)) (get!26067 (getValueByKey!727 (toList!11206 lt!669662) (select (arr!50034 _keys!618) from!762))))))

(declare-fun bs!44602 () Bool)

(assert (= bs!44602 d!161723))

(assert (=> bs!44602 m!1432469))

(assert (=> bs!44602 m!1432619))

(assert (=> bs!44602 m!1432619))

(declare-fun m!1432683 () Bool)

(assert (=> bs!44602 m!1432683))

(assert (=> b!1553997 d!161723))

(declare-fun d!161725 () Bool)

(assert (=> d!161725 (= (apply!1103 (+!5036 lt!669662 (tuple2!24765 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!50034 _keys!618) from!762)) (apply!1103 lt!669662 (select (arr!50034 _keys!618) from!762)))))

(declare-fun lt!669781 () Unit!51587)

(assert (=> d!161725 (= lt!669781 (choose!2028 lt!669662 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50034 _keys!618) from!762)))))

(declare-fun e!865331 () Bool)

(assert (=> d!161725 e!865331))

(declare-fun res!1063433 () Bool)

(assert (=> d!161725 (=> (not res!1063433) (not e!865331))))

(assert (=> d!161725 (= res!1063433 (contains!10162 lt!669662 (select (arr!50034 _keys!618) from!762)))))

(assert (=> d!161725 (= (addApplyDifferent!630 lt!669662 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!50034 _keys!618) from!762)) lt!669781)))

(declare-fun b!1554178 () Bool)

(assert (=> b!1554178 (= e!865331 (not (= (select (arr!50034 _keys!618) from!762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!161725 res!1063433) b!1554178))

(assert (=> d!161725 m!1432469))

(assert (=> d!161725 m!1432477))

(assert (=> d!161725 m!1432475))

(assert (=> d!161725 m!1432469))

(declare-fun m!1432685 () Bool)

(assert (=> d!161725 m!1432685))

(assert (=> d!161725 m!1432475))

(assert (=> d!161725 m!1432469))

(declare-fun m!1432687 () Bool)

(assert (=> d!161725 m!1432687))

(assert (=> d!161725 m!1432469))

(assert (=> d!161725 m!1432487))

(assert (=> b!1553997 d!161725))

(declare-fun d!161727 () Bool)

(declare-fun e!865333 () Bool)

(assert (=> d!161727 e!865333))

(declare-fun res!1063434 () Bool)

(assert (=> d!161727 (=> res!1063434 e!865333)))

(declare-fun lt!669783 () Bool)

(assert (=> d!161727 (= res!1063434 (not lt!669783))))

(declare-fun lt!669785 () Bool)

(assert (=> d!161727 (= lt!669783 lt!669785)))

(declare-fun lt!669784 () Unit!51587)

(declare-fun e!865332 () Unit!51587)

(assert (=> d!161727 (= lt!669784 e!865332)))

(declare-fun c!143629 () Bool)

(assert (=> d!161727 (= c!143629 lt!669785)))

(assert (=> d!161727 (= lt!669785 (containsKey!753 (toList!11206 lt!669655) (select (arr!50034 _keys!618) from!762)))))

(assert (=> d!161727 (= (contains!10162 lt!669655 (select (arr!50034 _keys!618) from!762)) lt!669783)))

(declare-fun b!1554179 () Bool)

(declare-fun lt!669782 () Unit!51587)

(assert (=> b!1554179 (= e!865332 lt!669782)))

(assert (=> b!1554179 (= lt!669782 (lemmaContainsKeyImpliesGetValueByKeyDefined!499 (toList!11206 lt!669655) (select (arr!50034 _keys!618) from!762)))))

(assert (=> b!1554179 (isDefined!545 (getValueByKey!727 (toList!11206 lt!669655) (select (arr!50034 _keys!618) from!762)))))

(declare-fun b!1554180 () Bool)

(declare-fun Unit!51590 () Unit!51587)

(assert (=> b!1554180 (= e!865332 Unit!51590)))

(declare-fun b!1554181 () Bool)

(assert (=> b!1554181 (= e!865333 (isDefined!545 (getValueByKey!727 (toList!11206 lt!669655) (select (arr!50034 _keys!618) from!762))))))

(assert (= (and d!161727 c!143629) b!1554179))

(assert (= (and d!161727 (not c!143629)) b!1554180))

(assert (= (and d!161727 (not res!1063434)) b!1554181))

(assert (=> d!161727 m!1432469))

(declare-fun m!1432689 () Bool)

(assert (=> d!161727 m!1432689))

(assert (=> b!1554179 m!1432469))

(declare-fun m!1432691 () Bool)

(assert (=> b!1554179 m!1432691))

(assert (=> b!1554179 m!1432469))

(declare-fun m!1432693 () Bool)

(assert (=> b!1554179 m!1432693))

(assert (=> b!1554179 m!1432693))

(declare-fun m!1432695 () Bool)

(assert (=> b!1554179 m!1432695))

(assert (=> b!1554181 m!1432469))

(assert (=> b!1554181 m!1432693))

(assert (=> b!1554181 m!1432693))

(assert (=> b!1554181 m!1432695))

(assert (=> b!1553997 d!161727))

(declare-fun d!161729 () Bool)

(assert (=> d!161729 (= (apply!1103 lt!669655 (select (arr!50034 _keys!618) from!762)) (get!26067 (getValueByKey!727 (toList!11206 lt!669655) (select (arr!50034 _keys!618) from!762))))))

(declare-fun bs!44603 () Bool)

(assert (= bs!44603 d!161729))

(assert (=> bs!44603 m!1432469))

(assert (=> bs!44603 m!1432693))

(assert (=> bs!44603 m!1432693))

(declare-fun m!1432697 () Bool)

(assert (=> bs!44603 m!1432697))

(assert (=> b!1553997 d!161729))

(declare-fun bm!71223 () Bool)

(declare-fun call!71226 () Bool)

(declare-fun c!143632 () Bool)

(assert (=> bm!71223 (= call!71226 (arrayNoDuplicates!0 _keys!618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!143632 (Cons!36213 (select (arr!50034 _keys!618) #b00000000000000000000000000000000) Nil!36214) Nil!36214)))))

(declare-fun b!1554192 () Bool)

(declare-fun e!865344 () Bool)

(assert (=> b!1554192 (= e!865344 call!71226)))

(declare-fun b!1554193 () Bool)

(declare-fun e!865342 () Bool)

(assert (=> b!1554193 (= e!865342 e!865344)))

(assert (=> b!1554193 (= c!143632 (validKeyInArray!0 (select (arr!50034 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1554194 () Bool)

(declare-fun e!865345 () Bool)

(declare-fun contains!10164 (List!36217 (_ BitVec 64)) Bool)

(assert (=> b!1554194 (= e!865345 (contains!10164 Nil!36214 (select (arr!50034 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1554195 () Bool)

(declare-fun e!865343 () Bool)

(assert (=> b!1554195 (= e!865343 e!865342)))

(declare-fun res!1063443 () Bool)

(assert (=> b!1554195 (=> (not res!1063443) (not e!865342))))

(assert (=> b!1554195 (= res!1063443 (not e!865345))))

(declare-fun res!1063442 () Bool)

(assert (=> b!1554195 (=> (not res!1063442) (not e!865345))))

(assert (=> b!1554195 (= res!1063442 (validKeyInArray!0 (select (arr!50034 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun d!161731 () Bool)

(declare-fun res!1063441 () Bool)

(assert (=> d!161731 (=> res!1063441 e!865343)))

(assert (=> d!161731 (= res!1063441 (bvsge #b00000000000000000000000000000000 (size!50585 _keys!618)))))

(assert (=> d!161731 (= (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36214) e!865343)))

(declare-fun b!1554196 () Bool)

(assert (=> b!1554196 (= e!865344 call!71226)))

(assert (= (and d!161731 (not res!1063441)) b!1554195))

(assert (= (and b!1554195 res!1063442) b!1554194))

(assert (= (and b!1554195 res!1063443) b!1554193))

(assert (= (and b!1554193 c!143632) b!1554196))

(assert (= (and b!1554193 (not c!143632)) b!1554192))

(assert (= (or b!1554196 b!1554192) bm!71223))

(declare-fun m!1432699 () Bool)

(assert (=> bm!71223 m!1432699))

(declare-fun m!1432701 () Bool)

(assert (=> bm!71223 m!1432701))

(assert (=> b!1554193 m!1432699))

(assert (=> b!1554193 m!1432699))

(declare-fun m!1432703 () Bool)

(assert (=> b!1554193 m!1432703))

(assert (=> b!1554194 m!1432699))

(assert (=> b!1554194 m!1432699))

(declare-fun m!1432705 () Bool)

(assert (=> b!1554194 m!1432705))

(assert (=> b!1554195 m!1432699))

(assert (=> b!1554195 m!1432699))

(assert (=> b!1554195 m!1432703))

(assert (=> b!1554009 d!161731))

(assert (=> bm!71187 d!161715))

(declare-fun bm!71226 () Bool)

(declare-fun call!71229 () Bool)

(assert (=> bm!71226 (= call!71229 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1554205 () Bool)

(declare-fun e!865354 () Bool)

(declare-fun e!865353 () Bool)

(assert (=> b!1554205 (= e!865354 e!865353)))

(declare-fun c!143635 () Bool)

(assert (=> b!1554205 (= c!143635 (validKeyInArray!0 (select (arr!50034 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1554206 () Bool)

(assert (=> b!1554206 (= e!865353 call!71229)))

(declare-fun d!161733 () Bool)

(declare-fun res!1063449 () Bool)

(assert (=> d!161733 (=> res!1063449 e!865354)))

(assert (=> d!161733 (= res!1063449 (bvsge #b00000000000000000000000000000000 (size!50585 _keys!618)))))

(assert (=> d!161733 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!865354)))

(declare-fun b!1554207 () Bool)

(declare-fun e!865352 () Bool)

(assert (=> b!1554207 (= e!865352 call!71229)))

(declare-fun b!1554208 () Bool)

(assert (=> b!1554208 (= e!865353 e!865352)))

(declare-fun lt!669793 () (_ BitVec 64))

(assert (=> b!1554208 (= lt!669793 (select (arr!50034 _keys!618) #b00000000000000000000000000000000))))

(declare-fun lt!669794 () Unit!51587)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103684 (_ BitVec 64) (_ BitVec 32)) Unit!51587)

(assert (=> b!1554208 (= lt!669794 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!669793 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1554208 (arrayContainsKey!0 _keys!618 lt!669793 #b00000000000000000000000000000000)))

(declare-fun lt!669792 () Unit!51587)

(assert (=> b!1554208 (= lt!669792 lt!669794)))

(declare-fun res!1063448 () Bool)

(declare-datatypes ((SeekEntryResult!13463 0))(
  ( (MissingZero!13463 (index!56250 (_ BitVec 32))) (Found!13463 (index!56251 (_ BitVec 32))) (Intermediate!13463 (undefined!14275 Bool) (index!56252 (_ BitVec 32)) (x!139154 (_ BitVec 32))) (Undefined!13463) (MissingVacant!13463 (index!56253 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103684 (_ BitVec 32)) SeekEntryResult!13463)

(assert (=> b!1554208 (= res!1063448 (= (seekEntryOrOpen!0 (select (arr!50034 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13463 #b00000000000000000000000000000000)))))

(assert (=> b!1554208 (=> (not res!1063448) (not e!865352))))

(assert (= (and d!161733 (not res!1063449)) b!1554205))

(assert (= (and b!1554205 c!143635) b!1554208))

(assert (= (and b!1554205 (not c!143635)) b!1554206))

(assert (= (and b!1554208 res!1063448) b!1554207))

(assert (= (or b!1554207 b!1554206) bm!71226))

(declare-fun m!1432707 () Bool)

(assert (=> bm!71226 m!1432707))

(assert (=> b!1554205 m!1432699))

(assert (=> b!1554205 m!1432699))

(assert (=> b!1554205 m!1432703))

(assert (=> b!1554208 m!1432699))

(declare-fun m!1432709 () Bool)

(assert (=> b!1554208 m!1432709))

(declare-fun m!1432711 () Bool)

(assert (=> b!1554208 m!1432711))

(assert (=> b!1554208 m!1432699))

(declare-fun m!1432713 () Bool)

(assert (=> b!1554208 m!1432713))

(assert (=> b!1553995 d!161733))

(declare-fun mapIsEmpty!58990 () Bool)

(declare-fun mapRes!58990 () Bool)

(assert (=> mapIsEmpty!58990 mapRes!58990))

(declare-fun condMapEmpty!58990 () Bool)

(declare-fun mapDefault!58990 () ValueCell!18179)

(assert (=> mapNonEmpty!58981 (= condMapEmpty!58990 (= mapRest!58981 ((as const (Array (_ BitVec 32) ValueCell!18179)) mapDefault!58990)))))

(declare-fun e!865360 () Bool)

(assert (=> mapNonEmpty!58981 (= tp!111969 (and e!865360 mapRes!58990))))

(declare-fun b!1554216 () Bool)

(assert (=> b!1554216 (= e!865360 tp_is_empty!38179)))

(declare-fun mapNonEmpty!58990 () Bool)

(declare-fun tp!111985 () Bool)

(declare-fun e!865359 () Bool)

(assert (=> mapNonEmpty!58990 (= mapRes!58990 (and tp!111985 e!865359))))

(declare-fun mapValue!58990 () ValueCell!18179)

(declare-fun mapRest!58990 () (Array (_ BitVec 32) ValueCell!18179))

(declare-fun mapKey!58990 () (_ BitVec 32))

(assert (=> mapNonEmpty!58990 (= mapRest!58981 (store mapRest!58990 mapKey!58990 mapValue!58990))))

(declare-fun b!1554215 () Bool)

(assert (=> b!1554215 (= e!865359 tp_is_empty!38179)))

(assert (= (and mapNonEmpty!58981 condMapEmpty!58990) mapIsEmpty!58990))

(assert (= (and mapNonEmpty!58981 (not condMapEmpty!58990)) mapNonEmpty!58990))

(assert (= (and mapNonEmpty!58990 ((_ is ValueCellFull!18179) mapValue!58990)) b!1554215))

(assert (= (and mapNonEmpty!58981 ((_ is ValueCellFull!18179) mapDefault!58990)) b!1554216))

(declare-fun m!1432715 () Bool)

(assert (=> mapNonEmpty!58990 m!1432715))

(declare-fun b_lambda!24777 () Bool)

(assert (= b_lambda!24773 (or (and start!132664 b_free!31903) b_lambda!24777)))

(declare-fun b_lambda!24779 () Bool)

(assert (= b_lambda!24775 (or (and start!132664 b_free!31903) b_lambda!24779)))

(check-sat (not b!1554163) (not d!161707) (not b!1554119) (not d!161727) (not b!1554179) (not b!1554193) (not b!1554205) (not d!161729) (not b!1554161) (not b!1554176) (not d!161723) (not b!1554195) (not b_next!31903) (not d!161725) (not b!1554194) (not b!1554170) (not b!1554130) (not b!1554177) (not b_lambda!24779) (not d!161717) (not b!1554171) (not b!1554181) (not b!1554118) (not d!161721) (not b!1554131) (not b!1554128) (not b!1554121) (not d!161715) (not b!1554169) (not d!161719) (not bm!71220) (not bm!71226) b_and!51347 (not bm!71223) (not b!1554167) (not b!1554208) (not d!161699) (not b!1554164) (not mapNonEmpty!58990) (not d!161711) (not b_lambda!24777) (not d!161713) (not b!1554120) (not d!161709) (not b!1554132) tp_is_empty!38179 (not b!1554172))
(check-sat b_and!51347 (not b_next!31903))
