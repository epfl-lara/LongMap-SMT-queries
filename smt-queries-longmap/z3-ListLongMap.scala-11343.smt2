; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131912 () Bool)

(assert start!131912)

(declare-fun b_free!31675 () Bool)

(declare-fun b_next!31675 () Bool)

(assert (=> start!131912 (= b_free!31675 (not b_next!31675))))

(declare-fun tp!111278 () Bool)

(declare-fun b_and!51067 () Bool)

(assert (=> start!131912 (= tp!111278 b_and!51067)))

(declare-fun bm!69252 () Bool)

(declare-datatypes ((V!59045 0))(
  ( (V!59046 (val!19053 Int)) )
))
(declare-datatypes ((tuple2!24564 0))(
  ( (tuple2!24565 (_1!12293 (_ BitVec 64)) (_2!12293 V!59045)) )
))
(declare-datatypes ((List!36043 0))(
  ( (Nil!36040) (Cons!36039 (h!37485 tuple2!24564) (t!50729 List!36043)) )
))
(declare-datatypes ((ListLongMap!22173 0))(
  ( (ListLongMap!22174 (toList!11102 List!36043)) )
))
(declare-fun call!69255 () ListLongMap!22173)

(declare-fun call!69259 () ListLongMap!22173)

(assert (=> bm!69252 (= call!69255 call!69259)))

(declare-fun b!1545328 () Bool)

(declare-fun e!860139 () ListLongMap!22173)

(declare-fun call!69257 () ListLongMap!22173)

(assert (=> b!1545328 (= e!860139 call!69257)))

(declare-fun b!1545329 () Bool)

(declare-fun res!1059770 () Bool)

(declare-fun e!860140 () Bool)

(assert (=> b!1545329 (=> (not res!1059770) (not e!860140))))

(declare-datatypes ((array!103036 0))(
  ( (array!103037 (arr!49721 (Array (_ BitVec 32) (_ BitVec 64))) (size!50273 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103036)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103036 (_ BitVec 32)) Bool)

(assert (=> b!1545329 (= res!1059770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun zeroValue!436 () V!59045)

(declare-fun c!141579 () Bool)

(declare-fun call!69258 () ListLongMap!22173)

(declare-fun bm!69253 () Bool)

(declare-fun c!141577 () Bool)

(declare-fun minValue!436 () V!59045)

(declare-fun call!69256 () ListLongMap!22173)

(declare-fun +!4931 (ListLongMap!22173 tuple2!24564) ListLongMap!22173)

(assert (=> bm!69253 (= call!69256 (+!4931 (ite c!141579 call!69259 (ite c!141577 call!69255 call!69258)) (ite (or c!141579 c!141577) (tuple2!24565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24565 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545331 () Bool)

(declare-fun res!1059769 () Bool)

(assert (=> b!1545331 (=> (not res!1059769) (not e!860140))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18065 0))(
  ( (ValueCellFull!18065 (v!21850 V!59045)) (EmptyCell!18065) )
))
(declare-datatypes ((array!103038 0))(
  ( (array!103039 (arr!49722 (Array (_ BitVec 32) ValueCell!18065)) (size!50274 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103038)

(assert (=> b!1545331 (= res!1059769 (and (= (size!50274 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50273 _keys!618) (size!50274 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545332 () Bool)

(declare-fun e!860141 () Bool)

(assert (=> b!1545332 (= e!860140 e!860141)))

(declare-fun res!1059766 () Bool)

(assert (=> b!1545332 (=> (not res!1059766) (not e!860141))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1545332 (= res!1059766 (bvslt from!762 (size!50273 _keys!618)))))

(declare-fun lt!666080 () ListLongMap!22173)

(declare-fun e!860137 () ListLongMap!22173)

(assert (=> b!1545332 (= lt!666080 e!860137)))

(declare-fun lt!666082 () Bool)

(assert (=> b!1545332 (= c!141579 (and (not lt!666082) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545332 (= lt!666082 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1545333 () Bool)

(declare-fun e!860143 () Bool)

(declare-fun tp_is_empty!37951 () Bool)

(assert (=> b!1545333 (= e!860143 tp_is_empty!37951)))

(declare-fun b!1545334 () Bool)

(assert (=> b!1545334 (= e!860141 (not true))))

(declare-fun lt!666081 () ListLongMap!22173)

(declare-fun contains!9993 (ListLongMap!22173 (_ BitVec 64)) Bool)

(assert (=> b!1545334 (contains!9993 (+!4931 lt!666081 (tuple2!24565 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49721 _keys!618) from!762))))

(declare-datatypes ((Unit!51333 0))(
  ( (Unit!51334) )
))
(declare-fun lt!666079 () Unit!51333)

(declare-fun addStillContains!1216 (ListLongMap!22173 (_ BitVec 64) V!59045 (_ BitVec 64)) Unit!51333)

(assert (=> b!1545334 (= lt!666079 (addStillContains!1216 lt!666081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49721 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6559 (array!103036 array!103038 (_ BitVec 32) (_ BitVec 32) V!59045 V!59045 (_ BitVec 32) Int) ListLongMap!22173)

(assert (=> b!1545334 (= lt!666081 (getCurrentListMapNoExtraKeys!6559 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69254 () Bool)

(assert (=> bm!69254 (= call!69258 call!69255)))

(declare-fun b!1545335 () Bool)

(declare-fun e!860144 () Bool)

(declare-fun mapRes!58630 () Bool)

(assert (=> b!1545335 (= e!860144 (and e!860143 mapRes!58630))))

(declare-fun condMapEmpty!58630 () Bool)

(declare-fun mapDefault!58630 () ValueCell!18065)

(assert (=> b!1545335 (= condMapEmpty!58630 (= (arr!49722 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18065)) mapDefault!58630)))))

(declare-fun bm!69255 () Bool)

(assert (=> bm!69255 (= call!69257 call!69256)))

(declare-fun b!1545336 () Bool)

(declare-fun e!860142 () ListLongMap!22173)

(assert (=> b!1545336 (= e!860142 call!69257)))

(declare-fun b!1545337 () Bool)

(declare-fun res!1059767 () Bool)

(assert (=> b!1545337 (=> (not res!1059767) (not e!860141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545337 (= res!1059767 (validKeyInArray!0 (select (arr!49721 _keys!618) from!762)))))

(declare-fun b!1545338 () Bool)

(declare-fun res!1059771 () Bool)

(assert (=> b!1545338 (=> (not res!1059771) (not e!860140))))

(declare-datatypes ((List!36044 0))(
  ( (Nil!36041) (Cons!36040 (h!37486 (_ BitVec 64)) (t!50730 List!36044)) )
))
(declare-fun arrayNoDuplicates!0 (array!103036 (_ BitVec 32) List!36044) Bool)

(assert (=> b!1545338 (= res!1059771 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36041))))

(declare-fun bm!69256 () Bool)

(assert (=> bm!69256 (= call!69259 (getCurrentListMapNoExtraKeys!6559 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545339 () Bool)

(assert (=> b!1545339 (= e!860142 call!69258)))

(declare-fun mapIsEmpty!58630 () Bool)

(assert (=> mapIsEmpty!58630 mapRes!58630))

(declare-fun mapNonEmpty!58630 () Bool)

(declare-fun tp!111277 () Bool)

(declare-fun e!860145 () Bool)

(assert (=> mapNonEmpty!58630 (= mapRes!58630 (and tp!111277 e!860145))))

(declare-fun mapValue!58630 () ValueCell!18065)

(declare-fun mapRest!58630 () (Array (_ BitVec 32) ValueCell!18065))

(declare-fun mapKey!58630 () (_ BitVec 32))

(assert (=> mapNonEmpty!58630 (= (arr!49722 _values!470) (store mapRest!58630 mapKey!58630 mapValue!58630))))

(declare-fun b!1545340 () Bool)

(assert (=> b!1545340 (= e!860145 tp_is_empty!37951)))

(declare-fun b!1545330 () Bool)

(declare-fun res!1059765 () Bool)

(assert (=> b!1545330 (=> (not res!1059765) (not e!860140))))

(assert (=> b!1545330 (= res!1059765 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50273 _keys!618))))))

(declare-fun res!1059768 () Bool)

(assert (=> start!131912 (=> (not res!1059768) (not e!860140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131912 (= res!1059768 (validMask!0 mask!926))))

(assert (=> start!131912 e!860140))

(declare-fun array_inv!38869 (array!103036) Bool)

(assert (=> start!131912 (array_inv!38869 _keys!618)))

(assert (=> start!131912 tp_is_empty!37951))

(assert (=> start!131912 true))

(assert (=> start!131912 tp!111278))

(declare-fun array_inv!38870 (array!103038) Bool)

(assert (=> start!131912 (and (array_inv!38870 _values!470) e!860144)))

(declare-fun b!1545341 () Bool)

(assert (=> b!1545341 (= e!860137 e!860139)))

(assert (=> b!1545341 (= c!141577 (and (not lt!666082) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545342 () Bool)

(declare-fun c!141578 () Bool)

(assert (=> b!1545342 (= c!141578 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666082))))

(assert (=> b!1545342 (= e!860139 e!860142)))

(declare-fun b!1545343 () Bool)

(assert (=> b!1545343 (= e!860137 (+!4931 call!69256 (tuple2!24565 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(assert (= (and start!131912 res!1059768) b!1545331))

(assert (= (and b!1545331 res!1059769) b!1545329))

(assert (= (and b!1545329 res!1059770) b!1545338))

(assert (= (and b!1545338 res!1059771) b!1545330))

(assert (= (and b!1545330 res!1059765) b!1545332))

(assert (= (and b!1545332 c!141579) b!1545343))

(assert (= (and b!1545332 (not c!141579)) b!1545341))

(assert (= (and b!1545341 c!141577) b!1545328))

(assert (= (and b!1545341 (not c!141577)) b!1545342))

(assert (= (and b!1545342 c!141578) b!1545336))

(assert (= (and b!1545342 (not c!141578)) b!1545339))

(assert (= (or b!1545336 b!1545339) bm!69254))

(assert (= (or b!1545328 bm!69254) bm!69252))

(assert (= (or b!1545328 b!1545336) bm!69255))

(assert (= (or b!1545343 bm!69252) bm!69256))

(assert (= (or b!1545343 bm!69255) bm!69253))

(assert (= (and b!1545332 res!1059766) b!1545337))

(assert (= (and b!1545337 res!1059767) b!1545334))

(assert (= (and b!1545335 condMapEmpty!58630) mapIsEmpty!58630))

(assert (= (and b!1545335 (not condMapEmpty!58630)) mapNonEmpty!58630))

(get-info :version)

(assert (= (and mapNonEmpty!58630 ((_ is ValueCellFull!18065) mapValue!58630)) b!1545340))

(assert (= (and b!1545335 ((_ is ValueCellFull!18065) mapDefault!58630)) b!1545333))

(assert (= start!131912 b!1545335))

(declare-fun m!1424979 () Bool)

(assert (=> b!1545329 m!1424979))

(declare-fun m!1424981 () Bool)

(assert (=> bm!69253 m!1424981))

(declare-fun m!1424983 () Bool)

(assert (=> b!1545338 m!1424983))

(declare-fun m!1424985 () Bool)

(assert (=> b!1545337 m!1424985))

(assert (=> b!1545337 m!1424985))

(declare-fun m!1424987 () Bool)

(assert (=> b!1545337 m!1424987))

(declare-fun m!1424989 () Bool)

(assert (=> b!1545343 m!1424989))

(declare-fun m!1424991 () Bool)

(assert (=> b!1545334 m!1424991))

(assert (=> b!1545334 m!1424985))

(assert (=> b!1545334 m!1424985))

(declare-fun m!1424993 () Bool)

(assert (=> b!1545334 m!1424993))

(declare-fun m!1424995 () Bool)

(assert (=> b!1545334 m!1424995))

(assert (=> b!1545334 m!1424985))

(declare-fun m!1424997 () Bool)

(assert (=> b!1545334 m!1424997))

(assert (=> b!1545334 m!1424995))

(declare-fun m!1424999 () Bool)

(assert (=> start!131912 m!1424999))

(declare-fun m!1425001 () Bool)

(assert (=> start!131912 m!1425001))

(declare-fun m!1425003 () Bool)

(assert (=> start!131912 m!1425003))

(declare-fun m!1425005 () Bool)

(assert (=> mapNonEmpty!58630 m!1425005))

(assert (=> bm!69256 m!1424991))

(check-sat (not b!1545334) (not b!1545338) (not b!1545337) (not bm!69256) b_and!51067 (not b_next!31675) (not start!131912) (not b!1545329) tp_is_empty!37951 (not b!1545343) (not bm!69253) (not mapNonEmpty!58630))
(check-sat b_and!51067 (not b_next!31675))
