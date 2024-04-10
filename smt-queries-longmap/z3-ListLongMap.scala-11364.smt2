; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132090 () Bool)

(assert start!132090)

(declare-fun b_free!31803 () Bool)

(declare-fun b_next!31803 () Bool)

(assert (=> start!132090 (= b_free!31803 (not b_next!31803))))

(declare-fun tp!111660 () Bool)

(declare-fun b_and!51213 () Bool)

(assert (=> start!132090 (= tp!111660 b_and!51213)))

(declare-fun mapNonEmpty!58822 () Bool)

(declare-fun mapRes!58822 () Bool)

(declare-fun tp!111661 () Bool)

(declare-fun e!862066 () Bool)

(assert (=> mapNonEmpty!58822 (= mapRes!58822 (and tp!111661 e!862066))))

(declare-datatypes ((V!59215 0))(
  ( (V!59216 (val!19117 Int)) )
))
(declare-datatypes ((ValueCell!18129 0))(
  ( (ValueCellFull!18129 (v!21918 V!59215)) (EmptyCell!18129) )
))
(declare-fun mapValue!58822 () ValueCell!18129)

(declare-fun mapRest!58822 () (Array (_ BitVec 32) ValueCell!18129))

(declare-fun mapKey!58822 () (_ BitVec 32))

(declare-datatypes ((array!103356 0))(
  ( (array!103357 (arr!49880 (Array (_ BitVec 32) ValueCell!18129)) (size!50430 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103356)

(assert (=> mapNonEmpty!58822 (= (arr!49880 _values!470) (store mapRest!58822 mapKey!58822 mapValue!58822))))

(declare-fun res!1061243 () Bool)

(declare-fun e!862064 () Bool)

(assert (=> start!132090 (=> (not res!1061243) (not e!862064))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132090 (= res!1061243 (validMask!0 mask!926))))

(assert (=> start!132090 e!862064))

(declare-datatypes ((array!103358 0))(
  ( (array!103359 (arr!49881 (Array (_ BitVec 32) (_ BitVec 64))) (size!50431 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103358)

(declare-fun array_inv!38781 (array!103358) Bool)

(assert (=> start!132090 (array_inv!38781 _keys!618)))

(declare-fun tp_is_empty!38079 () Bool)

(assert (=> start!132090 tp_is_empty!38079))

(assert (=> start!132090 true))

(assert (=> start!132090 tp!111660))

(declare-fun e!862069 () Bool)

(declare-fun array_inv!38782 (array!103356) Bool)

(assert (=> start!132090 (and (array_inv!38782 _values!470) e!862069)))

(declare-fun b!1548713 () Bool)

(declare-fun res!1061239 () Bool)

(assert (=> b!1548713 (=> (not res!1061239) (not e!862064))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1548713 (= res!1061239 (and (= (size!50430 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50431 _keys!618) (size!50430 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1548714 () Bool)

(declare-fun c!142243 () Bool)

(declare-fun lt!667448 () Bool)

(assert (=> b!1548714 (= c!142243 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667448))))

(declare-datatypes ((tuple2!24612 0))(
  ( (tuple2!24613 (_1!12317 (_ BitVec 64)) (_2!12317 V!59215)) )
))
(declare-datatypes ((List!36102 0))(
  ( (Nil!36099) (Cons!36098 (h!37543 tuple2!24612) (t!50796 List!36102)) )
))
(declare-datatypes ((ListLongMap!22221 0))(
  ( (ListLongMap!22222 (toList!11126 List!36102)) )
))
(declare-fun e!862068 () ListLongMap!22221)

(declare-fun e!862071 () ListLongMap!22221)

(assert (=> b!1548714 (= e!862068 e!862071)))

(declare-fun bm!70247 () Bool)

(declare-fun call!70252 () ListLongMap!22221)

(declare-fun call!70251 () ListLongMap!22221)

(assert (=> bm!70247 (= call!70252 call!70251)))

(declare-fun b!1548715 () Bool)

(declare-fun e!862067 () ListLongMap!22221)

(assert (=> b!1548715 (= e!862067 e!862068)))

(declare-fun c!142242 () Bool)

(assert (=> b!1548715 (= c!142242 (and (not lt!667448) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1548716 () Bool)

(declare-fun e!862065 () Bool)

(assert (=> b!1548716 (= e!862069 (and e!862065 mapRes!58822))))

(declare-fun condMapEmpty!58822 () Bool)

(declare-fun mapDefault!58822 () ValueCell!18129)

(assert (=> b!1548716 (= condMapEmpty!58822 (= (arr!49880 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18129)) mapDefault!58822)))))

(declare-fun b!1548717 () Bool)

(assert (=> b!1548717 (= e!862071 call!70252)))

(declare-fun b!1548718 () Bool)

(declare-fun e!862070 () Bool)

(assert (=> b!1548718 (= e!862070 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!667450 () ListLongMap!22221)

(declare-fun lt!667446 () V!59215)

(declare-fun apply!1072 (ListLongMap!22221 (_ BitVec 64)) V!59215)

(assert (=> b!1548718 (= (apply!1072 lt!667450 (select (arr!49881 _keys!618) from!762)) lt!667446)))

(declare-fun zeroValue!436 () V!59215)

(declare-datatypes ((Unit!51594 0))(
  ( (Unit!51595) )
))
(declare-fun lt!667451 () Unit!51594)

(declare-fun lt!667452 () ListLongMap!22221)

(declare-fun addApplyDifferent!614 (ListLongMap!22221 (_ BitVec 64) V!59215 (_ BitVec 64)) Unit!51594)

(assert (=> b!1548718 (= lt!667451 (addApplyDifferent!614 lt!667452 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49881 _keys!618) from!762)))))

(declare-fun lt!667449 () V!59215)

(assert (=> b!1548718 (= lt!667449 lt!667446)))

(assert (=> b!1548718 (= lt!667446 (apply!1072 lt!667452 (select (arr!49881 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59215)

(declare-fun +!4955 (ListLongMap!22221 tuple2!24612) ListLongMap!22221)

(assert (=> b!1548718 (= lt!667449 (apply!1072 (+!4955 lt!667452 (tuple2!24613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49881 _keys!618) from!762)))))

(declare-fun lt!667453 () Unit!51594)

(assert (=> b!1548718 (= lt!667453 (addApplyDifferent!614 lt!667452 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49881 _keys!618) from!762)))))

(declare-fun contains!10079 (ListLongMap!22221 (_ BitVec 64)) Bool)

(assert (=> b!1548718 (contains!10079 lt!667450 (select (arr!49881 _keys!618) from!762))))

(assert (=> b!1548718 (= lt!667450 (+!4955 lt!667452 (tuple2!24613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!667454 () Unit!51594)

(declare-fun addStillContains!1267 (ListLongMap!22221 (_ BitVec 64) V!59215 (_ BitVec 64)) Unit!51594)

(assert (=> b!1548718 (= lt!667454 (addStillContains!1267 lt!667452 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49881 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6581 (array!103358 array!103356 (_ BitVec 32) (_ BitVec 32) V!59215 V!59215 (_ BitVec 32) Int) ListLongMap!22221)

(assert (=> b!1548718 (= lt!667452 (getCurrentListMapNoExtraKeys!6581 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58822 () Bool)

(assert (=> mapIsEmpty!58822 mapRes!58822))

(declare-fun b!1548719 () Bool)

(declare-fun res!1061244 () Bool)

(assert (=> b!1548719 (=> (not res!1061244) (not e!862070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548719 (= res!1061244 (validKeyInArray!0 (select (arr!49881 _keys!618) from!762)))))

(declare-fun b!1548720 () Bool)

(assert (=> b!1548720 (= e!862064 e!862070)))

(declare-fun res!1061241 () Bool)

(assert (=> b!1548720 (=> (not res!1061241) (not e!862070))))

(assert (=> b!1548720 (= res!1061241 (bvslt from!762 (size!50431 _keys!618)))))

(declare-fun lt!667447 () ListLongMap!22221)

(assert (=> b!1548720 (= lt!667447 e!862067)))

(declare-fun c!142244 () Bool)

(assert (=> b!1548720 (= c!142244 (and (not lt!667448) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1548720 (= lt!667448 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1548721 () Bool)

(assert (=> b!1548721 (= e!862067 (+!4955 call!70251 (tuple2!24613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1548722 () Bool)

(assert (=> b!1548722 (= e!862065 tp_is_empty!38079)))

(declare-fun call!70253 () ListLongMap!22221)

(declare-fun call!70250 () ListLongMap!22221)

(declare-fun call!70254 () ListLongMap!22221)

(declare-fun bm!70248 () Bool)

(assert (=> bm!70248 (= call!70251 (+!4955 (ite c!142244 call!70250 (ite c!142242 call!70254 call!70253)) (ite (or c!142244 c!142242) (tuple2!24613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1548723 () Bool)

(declare-fun res!1061240 () Bool)

(assert (=> b!1548723 (=> (not res!1061240) (not e!862064))))

(declare-datatypes ((List!36103 0))(
  ( (Nil!36100) (Cons!36099 (h!37544 (_ BitVec 64)) (t!50797 List!36103)) )
))
(declare-fun arrayNoDuplicates!0 (array!103358 (_ BitVec 32) List!36103) Bool)

(assert (=> b!1548723 (= res!1061240 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36100))))

(declare-fun b!1548724 () Bool)

(assert (=> b!1548724 (= e!862066 tp_is_empty!38079)))

(declare-fun bm!70249 () Bool)

(assert (=> bm!70249 (= call!70253 call!70254)))

(declare-fun b!1548725 () Bool)

(declare-fun res!1061238 () Bool)

(assert (=> b!1548725 (=> (not res!1061238) (not e!862064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103358 (_ BitVec 32)) Bool)

(assert (=> b!1548725 (= res!1061238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!70250 () Bool)

(assert (=> bm!70250 (= call!70254 call!70250)))

(declare-fun b!1548726 () Bool)

(declare-fun res!1061242 () Bool)

(assert (=> b!1548726 (=> (not res!1061242) (not e!862064))))

(assert (=> b!1548726 (= res!1061242 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50431 _keys!618))))))

(declare-fun b!1548727 () Bool)

(assert (=> b!1548727 (= e!862071 call!70253)))

(declare-fun bm!70251 () Bool)

(assert (=> bm!70251 (= call!70250 (getCurrentListMapNoExtraKeys!6581 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1548728 () Bool)

(assert (=> b!1548728 (= e!862068 call!70252)))

(assert (= (and start!132090 res!1061243) b!1548713))

(assert (= (and b!1548713 res!1061239) b!1548725))

(assert (= (and b!1548725 res!1061238) b!1548723))

(assert (= (and b!1548723 res!1061240) b!1548726))

(assert (= (and b!1548726 res!1061242) b!1548720))

(assert (= (and b!1548720 c!142244) b!1548721))

(assert (= (and b!1548720 (not c!142244)) b!1548715))

(assert (= (and b!1548715 c!142242) b!1548728))

(assert (= (and b!1548715 (not c!142242)) b!1548714))

(assert (= (and b!1548714 c!142243) b!1548717))

(assert (= (and b!1548714 (not c!142243)) b!1548727))

(assert (= (or b!1548717 b!1548727) bm!70249))

(assert (= (or b!1548728 bm!70249) bm!70250))

(assert (= (or b!1548728 b!1548717) bm!70247))

(assert (= (or b!1548721 bm!70250) bm!70251))

(assert (= (or b!1548721 bm!70247) bm!70248))

(assert (= (and b!1548720 res!1061241) b!1548719))

(assert (= (and b!1548719 res!1061244) b!1548718))

(assert (= (and b!1548716 condMapEmpty!58822) mapIsEmpty!58822))

(assert (= (and b!1548716 (not condMapEmpty!58822)) mapNonEmpty!58822))

(get-info :version)

(assert (= (and mapNonEmpty!58822 ((_ is ValueCellFull!18129) mapValue!58822)) b!1548724))

(assert (= (and b!1548716 ((_ is ValueCellFull!18129) mapDefault!58822)) b!1548722))

(assert (= start!132090 b!1548716))

(declare-fun m!1428071 () Bool)

(assert (=> bm!70248 m!1428071))

(declare-fun m!1428073 () Bool)

(assert (=> b!1548718 m!1428073))

(declare-fun m!1428075 () Bool)

(assert (=> b!1548718 m!1428075))

(assert (=> b!1548718 m!1428075))

(declare-fun m!1428077 () Bool)

(assert (=> b!1548718 m!1428077))

(assert (=> b!1548718 m!1428075))

(declare-fun m!1428079 () Bool)

(assert (=> b!1548718 m!1428079))

(assert (=> b!1548718 m!1428075))

(declare-fun m!1428081 () Bool)

(assert (=> b!1548718 m!1428081))

(declare-fun m!1428083 () Bool)

(assert (=> b!1548718 m!1428083))

(assert (=> b!1548718 m!1428075))

(declare-fun m!1428085 () Bool)

(assert (=> b!1548718 m!1428085))

(declare-fun m!1428087 () Bool)

(assert (=> b!1548718 m!1428087))

(assert (=> b!1548718 m!1428075))

(declare-fun m!1428089 () Bool)

(assert (=> b!1548718 m!1428089))

(assert (=> b!1548718 m!1428073))

(assert (=> b!1548718 m!1428075))

(declare-fun m!1428091 () Bool)

(assert (=> b!1548718 m!1428091))

(assert (=> b!1548718 m!1428075))

(declare-fun m!1428093 () Bool)

(assert (=> b!1548718 m!1428093))

(declare-fun m!1428095 () Bool)

(assert (=> mapNonEmpty!58822 m!1428095))

(assert (=> b!1548719 m!1428075))

(assert (=> b!1548719 m!1428075))

(declare-fun m!1428097 () Bool)

(assert (=> b!1548719 m!1428097))

(declare-fun m!1428099 () Bool)

(assert (=> b!1548721 m!1428099))

(declare-fun m!1428101 () Bool)

(assert (=> b!1548725 m!1428101))

(declare-fun m!1428103 () Bool)

(assert (=> b!1548723 m!1428103))

(assert (=> bm!70251 m!1428087))

(declare-fun m!1428105 () Bool)

(assert (=> start!132090 m!1428105))

(declare-fun m!1428107 () Bool)

(assert (=> start!132090 m!1428107))

(declare-fun m!1428109 () Bool)

(assert (=> start!132090 m!1428109))

(check-sat (not mapNonEmpty!58822) (not b!1548719) tp_is_empty!38079 (not b!1548723) (not bm!70248) (not start!132090) (not b!1548718) (not b!1548721) (not b_next!31803) b_and!51213 (not b!1548725) (not bm!70251))
(check-sat b_and!51213 (not b_next!31803))
