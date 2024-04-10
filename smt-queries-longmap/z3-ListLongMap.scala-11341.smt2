; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131952 () Bool)

(assert start!131952)

(declare-fun b_free!31665 () Bool)

(declare-fun b_next!31665 () Bool)

(assert (=> start!131952 (= b_free!31665 (not b_next!31665))))

(declare-fun tp!111246 () Bool)

(declare-fun b_and!51075 () Bool)

(assert (=> start!131952 (= tp!111246 b_and!51075)))

(declare-fun b!1545401 () Bool)

(declare-fun res!1059794 () Bool)

(declare-fun e!860205 () Bool)

(assert (=> b!1545401 (=> (not res!1059794) (not e!860205))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103088 0))(
  ( (array!103089 (arr!49746 (Array (_ BitVec 32) (_ BitVec 64))) (size!50296 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103088)

(assert (=> b!1545401 (= res!1059794 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50296 _keys!618))))))

(declare-fun b!1545402 () Bool)

(declare-fun e!860207 () Bool)

(assert (=> b!1545402 (= e!860205 e!860207)))

(declare-fun res!1059793 () Bool)

(assert (=> b!1545402 (=> (not res!1059793) (not e!860207))))

(assert (=> b!1545402 (= res!1059793 (bvslt from!762 (size!50296 _keys!618)))))

(declare-datatypes ((V!59031 0))(
  ( (V!59032 (val!19048 Int)) )
))
(declare-datatypes ((tuple2!24478 0))(
  ( (tuple2!24479 (_1!12250 (_ BitVec 64)) (_2!12250 V!59031)) )
))
(declare-datatypes ((List!35989 0))(
  ( (Nil!35986) (Cons!35985 (h!37430 tuple2!24478) (t!50683 List!35989)) )
))
(declare-datatypes ((ListLongMap!22087 0))(
  ( (ListLongMap!22088 (toList!11059 List!35989)) )
))
(declare-fun lt!666308 () ListLongMap!22087)

(declare-fun e!860201 () ListLongMap!22087)

(assert (=> b!1545402 (= lt!666308 e!860201)))

(declare-fun c!141622 () Bool)

(declare-fun lt!666306 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545402 (= c!141622 (and (not lt!666306) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545402 (= lt!666306 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!58615 () Bool)

(declare-fun mapRes!58615 () Bool)

(declare-fun tp!111247 () Bool)

(declare-fun e!860200 () Bool)

(assert (=> mapNonEmpty!58615 (= mapRes!58615 (and tp!111247 e!860200))))

(declare-datatypes ((ValueCell!18060 0))(
  ( (ValueCellFull!18060 (v!21849 V!59031)) (EmptyCell!18060) )
))
(declare-fun mapValue!58615 () ValueCell!18060)

(declare-fun mapRest!58615 () (Array (_ BitVec 32) ValueCell!18060))

(declare-datatypes ((array!103090 0))(
  ( (array!103091 (arr!49747 (Array (_ BitVec 32) ValueCell!18060)) (size!50297 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103090)

(declare-fun mapKey!58615 () (_ BitVec 32))

(assert (=> mapNonEmpty!58615 (= (arr!49747 _values!470) (store mapRest!58615 mapKey!58615 mapValue!58615))))

(declare-fun zeroValue!436 () V!59031)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59031)

(declare-fun call!69217 () ListLongMap!22087)

(declare-fun bm!69212 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6528 (array!103088 array!103090 (_ BitVec 32) (_ BitVec 32) V!59031 V!59031 (_ BitVec 32) Int) ListLongMap!22087)

(assert (=> bm!69212 (= call!69217 (getCurrentListMapNoExtraKeys!6528 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545403 () Bool)

(declare-fun tp_is_empty!37941 () Bool)

(assert (=> b!1545403 (= e!860200 tp_is_empty!37941)))

(declare-fun b!1545404 () Bool)

(declare-fun e!860204 () Bool)

(declare-fun e!860208 () Bool)

(assert (=> b!1545404 (= e!860204 (and e!860208 mapRes!58615))))

(declare-fun condMapEmpty!58615 () Bool)

(declare-fun mapDefault!58615 () ValueCell!18060)

(assert (=> b!1545404 (= condMapEmpty!58615 (= (arr!49747 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18060)) mapDefault!58615)))))

(declare-fun b!1545405 () Bool)

(declare-fun res!1059790 () Bool)

(assert (=> b!1545405 (=> (not res!1059790) (not e!860205))))

(assert (=> b!1545405 (= res!1059790 (and (= (size!50297 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50296 _keys!618) (size!50297 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58615 () Bool)

(assert (=> mapIsEmpty!58615 mapRes!58615))

(declare-fun bm!69213 () Bool)

(declare-fun call!69216 () ListLongMap!22087)

(declare-fun call!69218 () ListLongMap!22087)

(assert (=> bm!69213 (= call!69216 call!69218)))

(declare-fun b!1545406 () Bool)

(declare-fun +!4895 (ListLongMap!22087 tuple2!24478) ListLongMap!22087)

(assert (=> b!1545406 (= e!860201 (+!4895 call!69218 (tuple2!24479 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1545407 () Bool)

(declare-fun res!1059791 () Bool)

(assert (=> b!1545407 (=> (not res!1059791) (not e!860205))))

(declare-datatypes ((List!35990 0))(
  ( (Nil!35987) (Cons!35986 (h!37431 (_ BitVec 64)) (t!50684 List!35990)) )
))
(declare-fun arrayNoDuplicates!0 (array!103088 (_ BitVec 32) List!35990) Bool)

(assert (=> b!1545407 (= res!1059791 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35987))))

(declare-fun b!1545408 () Bool)

(declare-fun e!860206 () ListLongMap!22087)

(assert (=> b!1545408 (= e!860201 e!860206)))

(declare-fun c!141621 () Bool)

(assert (=> b!1545408 (= c!141621 (and (not lt!666306) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545410 () Bool)

(declare-fun res!1059789 () Bool)

(assert (=> b!1545410 (=> (not res!1059789) (not e!860207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545410 (= res!1059789 (validKeyInArray!0 (select (arr!49746 _keys!618) from!762)))))

(declare-fun b!1545411 () Bool)

(assert (=> b!1545411 (= e!860208 tp_is_empty!37941)))

(declare-fun bm!69214 () Bool)

(declare-fun call!69215 () ListLongMap!22087)

(assert (=> bm!69214 (= call!69215 call!69217)))

(declare-fun b!1545412 () Bool)

(assert (=> b!1545412 (= e!860206 call!69216)))

(declare-fun b!1545413 () Bool)

(declare-fun e!860203 () ListLongMap!22087)

(declare-fun call!69219 () ListLongMap!22087)

(assert (=> b!1545413 (= e!860203 call!69219)))

(declare-fun b!1545414 () Bool)

(declare-fun res!1059795 () Bool)

(assert (=> b!1545414 (=> (not res!1059795) (not e!860205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103088 (_ BitVec 32)) Bool)

(assert (=> b!1545414 (= res!1059795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69215 () Bool)

(assert (=> bm!69215 (= call!69218 (+!4895 (ite c!141622 call!69217 (ite c!141621 call!69215 call!69219)) (ite (or c!141622 c!141621) (tuple2!24479 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24479 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545415 () Bool)

(assert (=> b!1545415 (= e!860207 (not true))))

(declare-fun lt!666305 () ListLongMap!22087)

(declare-fun contains!10030 (ListLongMap!22087 (_ BitVec 64)) Bool)

(assert (=> b!1545415 (contains!10030 (+!4895 lt!666305 (tuple2!24479 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49746 _keys!618) from!762))))

(declare-datatypes ((Unit!51496 0))(
  ( (Unit!51497) )
))
(declare-fun lt!666307 () Unit!51496)

(declare-fun addStillContains!1218 (ListLongMap!22087 (_ BitVec 64) V!59031 (_ BitVec 64)) Unit!51496)

(assert (=> b!1545415 (= lt!666307 (addStillContains!1218 lt!666305 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49746 _keys!618) from!762)))))

(assert (=> b!1545415 (= lt!666305 (getCurrentListMapNoExtraKeys!6528 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545409 () Bool)

(assert (=> b!1545409 (= e!860203 call!69216)))

(declare-fun res!1059792 () Bool)

(assert (=> start!131952 (=> (not res!1059792) (not e!860205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131952 (= res!1059792 (validMask!0 mask!926))))

(assert (=> start!131952 e!860205))

(declare-fun array_inv!38693 (array!103088) Bool)

(assert (=> start!131952 (array_inv!38693 _keys!618)))

(assert (=> start!131952 tp_is_empty!37941))

(assert (=> start!131952 true))

(assert (=> start!131952 tp!111246))

(declare-fun array_inv!38694 (array!103090) Bool)

(assert (=> start!131952 (and (array_inv!38694 _values!470) e!860204)))

(declare-fun b!1545416 () Bool)

(declare-fun c!141623 () Bool)

(assert (=> b!1545416 (= c!141623 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666306))))

(assert (=> b!1545416 (= e!860206 e!860203)))

(declare-fun bm!69216 () Bool)

(assert (=> bm!69216 (= call!69219 call!69215)))

(assert (= (and start!131952 res!1059792) b!1545405))

(assert (= (and b!1545405 res!1059790) b!1545414))

(assert (= (and b!1545414 res!1059795) b!1545407))

(assert (= (and b!1545407 res!1059791) b!1545401))

(assert (= (and b!1545401 res!1059794) b!1545402))

(assert (= (and b!1545402 c!141622) b!1545406))

(assert (= (and b!1545402 (not c!141622)) b!1545408))

(assert (= (and b!1545408 c!141621) b!1545412))

(assert (= (and b!1545408 (not c!141621)) b!1545416))

(assert (= (and b!1545416 c!141623) b!1545409))

(assert (= (and b!1545416 (not c!141623)) b!1545413))

(assert (= (or b!1545409 b!1545413) bm!69216))

(assert (= (or b!1545412 bm!69216) bm!69214))

(assert (= (or b!1545412 b!1545409) bm!69213))

(assert (= (or b!1545406 bm!69214) bm!69212))

(assert (= (or b!1545406 bm!69213) bm!69215))

(assert (= (and b!1545402 res!1059793) b!1545410))

(assert (= (and b!1545410 res!1059789) b!1545415))

(assert (= (and b!1545404 condMapEmpty!58615) mapIsEmpty!58615))

(assert (= (and b!1545404 (not condMapEmpty!58615)) mapNonEmpty!58615))

(get-info :version)

(assert (= (and mapNonEmpty!58615 ((_ is ValueCellFull!18060) mapValue!58615)) b!1545403))

(assert (= (and b!1545404 ((_ is ValueCellFull!18060) mapDefault!58615)) b!1545411))

(assert (= start!131952 b!1545404))

(declare-fun m!1425731 () Bool)

(assert (=> b!1545410 m!1425731))

(assert (=> b!1545410 m!1425731))

(declare-fun m!1425733 () Bool)

(assert (=> b!1545410 m!1425733))

(declare-fun m!1425735 () Bool)

(assert (=> mapNonEmpty!58615 m!1425735))

(declare-fun m!1425737 () Bool)

(assert (=> bm!69215 m!1425737))

(declare-fun m!1425739 () Bool)

(assert (=> b!1545406 m!1425739))

(declare-fun m!1425741 () Bool)

(assert (=> b!1545414 m!1425741))

(assert (=> b!1545415 m!1425731))

(declare-fun m!1425743 () Bool)

(assert (=> b!1545415 m!1425743))

(declare-fun m!1425745 () Bool)

(assert (=> b!1545415 m!1425745))

(declare-fun m!1425747 () Bool)

(assert (=> b!1545415 m!1425747))

(assert (=> b!1545415 m!1425731))

(declare-fun m!1425749 () Bool)

(assert (=> b!1545415 m!1425749))

(assert (=> b!1545415 m!1425731))

(assert (=> b!1545415 m!1425747))

(assert (=> bm!69212 m!1425745))

(declare-fun m!1425751 () Bool)

(assert (=> start!131952 m!1425751))

(declare-fun m!1425753 () Bool)

(assert (=> start!131952 m!1425753))

(declare-fun m!1425755 () Bool)

(assert (=> start!131952 m!1425755))

(declare-fun m!1425757 () Bool)

(assert (=> b!1545407 m!1425757))

(check-sat (not b!1545410) (not b_next!31665) (not start!131952) (not b!1545407) b_and!51075 tp_is_empty!37941 (not mapNonEmpty!58615) (not bm!69215) (not b!1545415) (not b!1545406) (not b!1545414) (not bm!69212))
(check-sat b_and!51075 (not b_next!31665))
