; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131918 () Bool)

(assert start!131918)

(declare-fun b_free!31681 () Bool)

(declare-fun b_next!31681 () Bool)

(assert (=> start!131918 (= b_free!31681 (not b_next!31681))))

(declare-fun tp!111295 () Bool)

(declare-fun b_and!51073 () Bool)

(assert (=> start!131918 (= tp!111295 b_and!51073)))

(declare-fun bm!69297 () Bool)

(declare-datatypes ((V!59053 0))(
  ( (V!59054 (val!19056 Int)) )
))
(declare-datatypes ((tuple2!24570 0))(
  ( (tuple2!24571 (_1!12296 (_ BitVec 64)) (_2!12296 V!59053)) )
))
(declare-datatypes ((List!36047 0))(
  ( (Nil!36044) (Cons!36043 (h!37489 tuple2!24570) (t!50733 List!36047)) )
))
(declare-datatypes ((ListLongMap!22179 0))(
  ( (ListLongMap!22180 (toList!11105 List!36047)) )
))
(declare-fun call!69300 () ListLongMap!22179)

(declare-fun call!69304 () ListLongMap!22179)

(assert (=> bm!69297 (= call!69300 call!69304)))

(declare-fun bm!69298 () Bool)

(declare-fun call!69303 () ListLongMap!22179)

(declare-fun call!69302 () ListLongMap!22179)

(assert (=> bm!69298 (= call!69303 call!69302)))

(declare-fun b!1545472 () Bool)

(declare-fun e!860223 () ListLongMap!22179)

(assert (=> b!1545472 (= e!860223 call!69303)))

(declare-fun b!1545473 () Bool)

(declare-fun e!860220 () Bool)

(assert (=> b!1545473 (= e!860220 (not true))))

(declare-datatypes ((array!103048 0))(
  ( (array!103049 (arr!49727 (Array (_ BitVec 32) (_ BitVec 64))) (size!50279 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103048)

(declare-fun zeroValue!436 () V!59053)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666116 () ListLongMap!22179)

(declare-fun contains!9996 (ListLongMap!22179 (_ BitVec 64)) Bool)

(declare-fun +!4934 (ListLongMap!22179 tuple2!24570) ListLongMap!22179)

(assert (=> b!1545473 (contains!9996 (+!4934 lt!666116 (tuple2!24571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49727 _keys!618) from!762))))

(declare-datatypes ((Unit!51339 0))(
  ( (Unit!51340) )
))
(declare-fun lt!666118 () Unit!51339)

(declare-fun addStillContains!1219 (ListLongMap!22179 (_ BitVec 64) V!59053 (_ BitVec 64)) Unit!51339)

(assert (=> b!1545473 (= lt!666118 (addStillContains!1219 lt!666116 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49727 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18068 0))(
  ( (ValueCellFull!18068 (v!21853 V!59053)) (EmptyCell!18068) )
))
(declare-datatypes ((array!103050 0))(
  ( (array!103051 (arr!49728 (Array (_ BitVec 32) ValueCell!18068)) (size!50280 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103050)

(declare-fun minValue!436 () V!59053)

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6562 (array!103048 array!103050 (_ BitVec 32) (_ BitVec 32) V!59053 V!59053 (_ BitVec 32) Int) ListLongMap!22179)

(assert (=> b!1545473 (= lt!666116 (getCurrentListMapNoExtraKeys!6562 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545474 () Bool)

(declare-fun res!1059829 () Bool)

(declare-fun e!860221 () Bool)

(assert (=> b!1545474 (=> (not res!1059829) (not e!860221))))

(assert (=> b!1545474 (= res!1059829 (and (= (size!50280 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50279 _keys!618) (size!50280 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545475 () Bool)

(declare-fun res!1059833 () Bool)

(assert (=> b!1545475 (=> (not res!1059833) (not e!860220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545475 (= res!1059833 (validKeyInArray!0 (select (arr!49727 _keys!618) from!762)))))

(declare-fun b!1545477 () Bool)

(assert (=> b!1545477 (= e!860221 e!860220)))

(declare-fun res!1059834 () Bool)

(assert (=> b!1545477 (=> (not res!1059834) (not e!860220))))

(assert (=> b!1545477 (= res!1059834 (bvslt from!762 (size!50279 _keys!618)))))

(declare-fun lt!666117 () ListLongMap!22179)

(declare-fun e!860224 () ListLongMap!22179)

(assert (=> b!1545477 (= lt!666117 e!860224)))

(declare-fun c!141606 () Bool)

(declare-fun lt!666115 () Bool)

(assert (=> b!1545477 (= c!141606 (and (not lt!666115) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545477 (= lt!666115 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545478 () Bool)

(declare-fun e!860222 () ListLongMap!22179)

(assert (=> b!1545478 (= e!860222 call!69300)))

(declare-fun res!1059830 () Bool)

(assert (=> start!131918 (=> (not res!1059830) (not e!860221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131918 (= res!1059830 (validMask!0 mask!926))))

(assert (=> start!131918 e!860221))

(declare-fun array_inv!38871 (array!103048) Bool)

(assert (=> start!131918 (array_inv!38871 _keys!618)))

(declare-fun tp_is_empty!37957 () Bool)

(assert (=> start!131918 tp_is_empty!37957))

(assert (=> start!131918 true))

(assert (=> start!131918 tp!111295))

(declare-fun e!860219 () Bool)

(declare-fun array_inv!38872 (array!103050) Bool)

(assert (=> start!131918 (and (array_inv!38872 _values!470) e!860219)))

(declare-fun b!1545476 () Bool)

(declare-fun c!141605 () Bool)

(assert (=> b!1545476 (= c!141605 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666115))))

(assert (=> b!1545476 (= e!860223 e!860222)))

(declare-fun b!1545479 () Bool)

(declare-fun e!860218 () Bool)

(assert (=> b!1545479 (= e!860218 tp_is_empty!37957)))

(declare-fun b!1545480 () Bool)

(assert (=> b!1545480 (= e!860222 call!69303)))

(declare-fun call!69301 () ListLongMap!22179)

(declare-fun bm!69299 () Bool)

(assert (=> bm!69299 (= call!69301 (getCurrentListMapNoExtraKeys!6562 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545481 () Bool)

(declare-fun res!1059828 () Bool)

(assert (=> b!1545481 (=> (not res!1059828) (not e!860221))))

(assert (=> b!1545481 (= res!1059828 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50279 _keys!618))))))

(declare-fun mapIsEmpty!58639 () Bool)

(declare-fun mapRes!58639 () Bool)

(assert (=> mapIsEmpty!58639 mapRes!58639))

(declare-fun c!141604 () Bool)

(declare-fun bm!69300 () Bool)

(assert (=> bm!69300 (= call!69302 (+!4934 (ite c!141606 call!69301 (ite c!141604 call!69304 call!69300)) (ite (or c!141606 c!141604) (tuple2!24571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69301 () Bool)

(assert (=> bm!69301 (= call!69304 call!69301)))

(declare-fun mapNonEmpty!58639 () Bool)

(declare-fun tp!111296 () Bool)

(declare-fun e!860225 () Bool)

(assert (=> mapNonEmpty!58639 (= mapRes!58639 (and tp!111296 e!860225))))

(declare-fun mapValue!58639 () ValueCell!18068)

(declare-fun mapKey!58639 () (_ BitVec 32))

(declare-fun mapRest!58639 () (Array (_ BitVec 32) ValueCell!18068))

(assert (=> mapNonEmpty!58639 (= (arr!49728 _values!470) (store mapRest!58639 mapKey!58639 mapValue!58639))))

(declare-fun b!1545482 () Bool)

(declare-fun res!1059832 () Bool)

(assert (=> b!1545482 (=> (not res!1059832) (not e!860221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103048 (_ BitVec 32)) Bool)

(assert (=> b!1545482 (= res!1059832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545483 () Bool)

(declare-fun res!1059831 () Bool)

(assert (=> b!1545483 (=> (not res!1059831) (not e!860221))))

(declare-datatypes ((List!36048 0))(
  ( (Nil!36045) (Cons!36044 (h!37490 (_ BitVec 64)) (t!50734 List!36048)) )
))
(declare-fun arrayNoDuplicates!0 (array!103048 (_ BitVec 32) List!36048) Bool)

(assert (=> b!1545483 (= res!1059831 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36045))))

(declare-fun b!1545484 () Bool)

(assert (=> b!1545484 (= e!860224 e!860223)))

(assert (=> b!1545484 (= c!141604 (and (not lt!666115) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545485 () Bool)

(assert (=> b!1545485 (= e!860225 tp_is_empty!37957)))

(declare-fun b!1545486 () Bool)

(assert (=> b!1545486 (= e!860219 (and e!860218 mapRes!58639))))

(declare-fun condMapEmpty!58639 () Bool)

(declare-fun mapDefault!58639 () ValueCell!18068)

(assert (=> b!1545486 (= condMapEmpty!58639 (= (arr!49728 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18068)) mapDefault!58639)))))

(declare-fun b!1545487 () Bool)

(assert (=> b!1545487 (= e!860224 (+!4934 call!69302 (tuple2!24571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!131918 res!1059830) b!1545474))

(assert (= (and b!1545474 res!1059829) b!1545482))

(assert (= (and b!1545482 res!1059832) b!1545483))

(assert (= (and b!1545483 res!1059831) b!1545481))

(assert (= (and b!1545481 res!1059828) b!1545477))

(assert (= (and b!1545477 c!141606) b!1545487))

(assert (= (and b!1545477 (not c!141606)) b!1545484))

(assert (= (and b!1545484 c!141604) b!1545472))

(assert (= (and b!1545484 (not c!141604)) b!1545476))

(assert (= (and b!1545476 c!141605) b!1545480))

(assert (= (and b!1545476 (not c!141605)) b!1545478))

(assert (= (or b!1545480 b!1545478) bm!69297))

(assert (= (or b!1545472 bm!69297) bm!69301))

(assert (= (or b!1545472 b!1545480) bm!69298))

(assert (= (or b!1545487 bm!69301) bm!69299))

(assert (= (or b!1545487 bm!69298) bm!69300))

(assert (= (and b!1545477 res!1059834) b!1545475))

(assert (= (and b!1545475 res!1059833) b!1545473))

(assert (= (and b!1545486 condMapEmpty!58639) mapIsEmpty!58639))

(assert (= (and b!1545486 (not condMapEmpty!58639)) mapNonEmpty!58639))

(get-info :version)

(assert (= (and mapNonEmpty!58639 ((_ is ValueCellFull!18068) mapValue!58639)) b!1545485))

(assert (= (and b!1545486 ((_ is ValueCellFull!18068) mapDefault!58639)) b!1545479))

(assert (= start!131918 b!1545486))

(declare-fun m!1425063 () Bool)

(assert (=> bm!69300 m!1425063))

(declare-fun m!1425065 () Bool)

(assert (=> b!1545482 m!1425065))

(declare-fun m!1425067 () Bool)

(assert (=> mapNonEmpty!58639 m!1425067))

(declare-fun m!1425069 () Bool)

(assert (=> bm!69299 m!1425069))

(declare-fun m!1425071 () Bool)

(assert (=> b!1545487 m!1425071))

(declare-fun m!1425073 () Bool)

(assert (=> b!1545475 m!1425073))

(assert (=> b!1545475 m!1425073))

(declare-fun m!1425075 () Bool)

(assert (=> b!1545475 m!1425075))

(assert (=> b!1545473 m!1425069))

(declare-fun m!1425077 () Bool)

(assert (=> b!1545473 m!1425077))

(assert (=> b!1545473 m!1425073))

(declare-fun m!1425079 () Bool)

(assert (=> b!1545473 m!1425079))

(assert (=> b!1545473 m!1425073))

(declare-fun m!1425081 () Bool)

(assert (=> b!1545473 m!1425081))

(assert (=> b!1545473 m!1425073))

(assert (=> b!1545473 m!1425077))

(declare-fun m!1425083 () Bool)

(assert (=> b!1545483 m!1425083))

(declare-fun m!1425085 () Bool)

(assert (=> start!131918 m!1425085))

(declare-fun m!1425087 () Bool)

(assert (=> start!131918 m!1425087))

(declare-fun m!1425089 () Bool)

(assert (=> start!131918 m!1425089))

(check-sat (not b!1545473) (not b!1545483) (not b_next!31681) (not b!1545482) (not start!131918) (not mapNonEmpty!58639) (not b!1545487) b_and!51073 tp_is_empty!37957 (not bm!69299) (not bm!69300) (not b!1545475))
(check-sat b_and!51073 (not b_next!31681))
