; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131994 () Bool)

(assert start!131994)

(declare-fun b_free!31707 () Bool)

(declare-fun b_next!31707 () Bool)

(assert (=> start!131994 (= b_free!31707 (not b_next!31707))))

(declare-fun tp!111372 () Bool)

(declare-fun b_and!51117 () Bool)

(assert (=> start!131994 (= tp!111372 b_and!51117)))

(declare-fun b!1546409 () Bool)

(declare-fun c!141811 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666559 () Bool)

(assert (=> b!1546409 (= c!141811 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666559))))

(declare-datatypes ((V!59087 0))(
  ( (V!59088 (val!19069 Int)) )
))
(declare-datatypes ((tuple2!24520 0))(
  ( (tuple2!24521 (_1!12271 (_ BitVec 64)) (_2!12271 V!59087)) )
))
(declare-datatypes ((List!36027 0))(
  ( (Nil!36024) (Cons!36023 (h!37468 tuple2!24520) (t!50721 List!36027)) )
))
(declare-datatypes ((ListLongMap!22129 0))(
  ( (ListLongMap!22130 (toList!11080 List!36027)) )
))
(declare-fun e!860774 () ListLongMap!22129)

(declare-fun e!860769 () ListLongMap!22129)

(assert (=> b!1546409 (= e!860774 e!860769)))

(declare-fun mapNonEmpty!58678 () Bool)

(declare-fun mapRes!58678 () Bool)

(declare-fun tp!111373 () Bool)

(declare-fun e!860768 () Bool)

(assert (=> mapNonEmpty!58678 (= mapRes!58678 (and tp!111373 e!860768))))

(declare-datatypes ((ValueCell!18081 0))(
  ( (ValueCellFull!18081 (v!21870 V!59087)) (EmptyCell!18081) )
))
(declare-fun mapRest!58678 () (Array (_ BitVec 32) ValueCell!18081))

(declare-fun mapKey!58678 () (_ BitVec 32))

(declare-fun mapValue!58678 () ValueCell!18081)

(declare-datatypes ((array!103172 0))(
  ( (array!103173 (arr!49788 (Array (_ BitVec 32) ValueCell!18081)) (size!50338 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103172)

(assert (=> mapNonEmpty!58678 (= (arr!49788 _values!470) (store mapRest!58678 mapKey!58678 mapValue!58678))))

(declare-fun b!1546410 () Bool)

(declare-fun res!1060233 () Bool)

(declare-fun e!860773 () Bool)

(assert (=> b!1546410 (=> (not res!1060233) (not e!860773))))

(declare-datatypes ((array!103174 0))(
  ( (array!103175 (arr!49789 (Array (_ BitVec 32) (_ BitVec 64))) (size!50339 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103174)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546410 (= res!1060233 (validKeyInArray!0 (select (arr!49789 _keys!618) from!762)))))

(declare-fun b!1546411 () Bool)

(declare-fun e!860772 () ListLongMap!22129)

(assert (=> b!1546411 (= e!860772 e!860774)))

(declare-fun c!141812 () Bool)

(assert (=> b!1546411 (= c!141812 (and (not lt!666559) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546412 () Bool)

(declare-fun call!69530 () ListLongMap!22129)

(assert (=> b!1546412 (= e!860769 call!69530)))

(declare-fun bm!69527 () Bool)

(declare-fun call!69531 () ListLongMap!22129)

(assert (=> bm!69527 (= call!69530 call!69531)))

(declare-fun b!1546413 () Bool)

(declare-fun res!1060234 () Bool)

(declare-fun e!860767 () Bool)

(assert (=> b!1546413 (=> (not res!1060234) (not e!860767))))

(assert (=> b!1546413 (= res!1060234 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50339 _keys!618))))))

(declare-fun b!1546414 () Bool)

(declare-fun call!69533 () ListLongMap!22129)

(assert (=> b!1546414 (= e!860774 call!69533)))

(declare-fun b!1546416 () Bool)

(declare-fun e!860770 () Bool)

(declare-fun tp_is_empty!37983 () Bool)

(assert (=> b!1546416 (= e!860770 tp_is_empty!37983)))

(declare-fun b!1546417 () Bool)

(declare-fun res!1060235 () Bool)

(assert (=> b!1546417 (=> (not res!1060235) (not e!860767))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103174 (_ BitVec 32)) Bool)

(assert (=> b!1546417 (= res!1060235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546418 () Bool)

(declare-fun res!1060231 () Bool)

(assert (=> b!1546418 (=> (not res!1060231) (not e!860767))))

(assert (=> b!1546418 (= res!1060231 (and (= (size!50338 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50339 _keys!618) (size!50338 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!436 () V!59087)

(declare-fun c!141810 () Bool)

(declare-fun call!69532 () ListLongMap!22129)

(declare-fun minValue!436 () V!59087)

(declare-fun bm!69528 () Bool)

(declare-fun call!69534 () ListLongMap!22129)

(declare-fun +!4915 (ListLongMap!22129 tuple2!24520) ListLongMap!22129)

(assert (=> bm!69528 (= call!69532 (+!4915 (ite c!141810 call!69534 (ite c!141812 call!69531 call!69530)) (ite (or c!141810 c!141812) (tuple2!24521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546419 () Bool)

(assert (=> b!1546419 (= e!860773 (not true))))

(declare-fun lt!666560 () ListLongMap!22129)

(declare-fun contains!10047 (ListLongMap!22129 (_ BitVec 64)) Bool)

(assert (=> b!1546419 (contains!10047 (+!4915 lt!666560 (tuple2!24521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49789 _keys!618) from!762))))

(declare-datatypes ((Unit!51530 0))(
  ( (Unit!51531) )
))
(declare-fun lt!666558 () Unit!51530)

(declare-fun addStillContains!1235 (ListLongMap!22129 (_ BitVec 64) V!59087 (_ BitVec 64)) Unit!51530)

(assert (=> b!1546419 (= lt!666558 (addStillContains!1235 lt!666560 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49789 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6546 (array!103174 array!103172 (_ BitVec 32) (_ BitVec 32) V!59087 V!59087 (_ BitVec 32) Int) ListLongMap!22129)

(assert (=> b!1546419 (= lt!666560 (getCurrentListMapNoExtraKeys!6546 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546420 () Bool)

(assert (=> b!1546420 (= e!860767 e!860773)))

(declare-fun res!1060230 () Bool)

(assert (=> b!1546420 (=> (not res!1060230) (not e!860773))))

(assert (=> b!1546420 (= res!1060230 (bvslt from!762 (size!50339 _keys!618)))))

(declare-fun lt!666557 () ListLongMap!22129)

(assert (=> b!1546420 (= lt!666557 e!860772)))

(assert (=> b!1546420 (= c!141810 (and (not lt!666559) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546420 (= lt!666559 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!69529 () Bool)

(assert (=> bm!69529 (= call!69531 call!69534)))

(declare-fun b!1546421 () Bool)

(assert (=> b!1546421 (= e!860768 tp_is_empty!37983)))

(declare-fun b!1546422 () Bool)

(declare-fun e!860775 () Bool)

(assert (=> b!1546422 (= e!860775 (and e!860770 mapRes!58678))))

(declare-fun condMapEmpty!58678 () Bool)

(declare-fun mapDefault!58678 () ValueCell!18081)

(assert (=> b!1546422 (= condMapEmpty!58678 (= (arr!49788 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18081)) mapDefault!58678)))))

(declare-fun b!1546423 () Bool)

(assert (=> b!1546423 (= e!860769 call!69533)))

(declare-fun bm!69530 () Bool)

(assert (=> bm!69530 (= call!69533 call!69532)))

(declare-fun b!1546424 () Bool)

(assert (=> b!1546424 (= e!860772 (+!4915 call!69532 (tuple2!24521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546415 () Bool)

(declare-fun res!1060236 () Bool)

(assert (=> b!1546415 (=> (not res!1060236) (not e!860767))))

(declare-datatypes ((List!36028 0))(
  ( (Nil!36025) (Cons!36024 (h!37469 (_ BitVec 64)) (t!50722 List!36028)) )
))
(declare-fun arrayNoDuplicates!0 (array!103174 (_ BitVec 32) List!36028) Bool)

(assert (=> b!1546415 (= res!1060236 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36025))))

(declare-fun res!1060232 () Bool)

(assert (=> start!131994 (=> (not res!1060232) (not e!860767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131994 (= res!1060232 (validMask!0 mask!926))))

(assert (=> start!131994 e!860767))

(declare-fun array_inv!38725 (array!103174) Bool)

(assert (=> start!131994 (array_inv!38725 _keys!618)))

(assert (=> start!131994 tp_is_empty!37983))

(assert (=> start!131994 true))

(assert (=> start!131994 tp!111372))

(declare-fun array_inv!38726 (array!103172) Bool)

(assert (=> start!131994 (and (array_inv!38726 _values!470) e!860775)))

(declare-fun mapIsEmpty!58678 () Bool)

(assert (=> mapIsEmpty!58678 mapRes!58678))

(declare-fun bm!69531 () Bool)

(assert (=> bm!69531 (= call!69534 (getCurrentListMapNoExtraKeys!6546 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(assert (= (and start!131994 res!1060232) b!1546418))

(assert (= (and b!1546418 res!1060231) b!1546417))

(assert (= (and b!1546417 res!1060235) b!1546415))

(assert (= (and b!1546415 res!1060236) b!1546413))

(assert (= (and b!1546413 res!1060234) b!1546420))

(assert (= (and b!1546420 c!141810) b!1546424))

(assert (= (and b!1546420 (not c!141810)) b!1546411))

(assert (= (and b!1546411 c!141812) b!1546414))

(assert (= (and b!1546411 (not c!141812)) b!1546409))

(assert (= (and b!1546409 c!141811) b!1546423))

(assert (= (and b!1546409 (not c!141811)) b!1546412))

(assert (= (or b!1546423 b!1546412) bm!69527))

(assert (= (or b!1546414 bm!69527) bm!69529))

(assert (= (or b!1546414 b!1546423) bm!69530))

(assert (= (or b!1546424 bm!69529) bm!69531))

(assert (= (or b!1546424 bm!69530) bm!69528))

(assert (= (and b!1546420 res!1060230) b!1546410))

(assert (= (and b!1546410 res!1060233) b!1546419))

(assert (= (and b!1546422 condMapEmpty!58678) mapIsEmpty!58678))

(assert (= (and b!1546422 (not condMapEmpty!58678)) mapNonEmpty!58678))

(get-info :version)

(assert (= (and mapNonEmpty!58678 ((_ is ValueCellFull!18081) mapValue!58678)) b!1546421))

(assert (= (and b!1546422 ((_ is ValueCellFull!18081) mapDefault!58678)) b!1546416))

(assert (= start!131994 b!1546422))

(declare-fun m!1426319 () Bool)

(assert (=> b!1546424 m!1426319))

(declare-fun m!1426321 () Bool)

(assert (=> bm!69531 m!1426321))

(assert (=> b!1546419 m!1426321))

(declare-fun m!1426323 () Bool)

(assert (=> b!1546419 m!1426323))

(declare-fun m!1426325 () Bool)

(assert (=> b!1546419 m!1426325))

(assert (=> b!1546419 m!1426323))

(declare-fun m!1426327 () Bool)

(assert (=> b!1546419 m!1426327))

(assert (=> b!1546419 m!1426325))

(assert (=> b!1546419 m!1426323))

(declare-fun m!1426329 () Bool)

(assert (=> b!1546419 m!1426329))

(assert (=> b!1546410 m!1426323))

(assert (=> b!1546410 m!1426323))

(declare-fun m!1426331 () Bool)

(assert (=> b!1546410 m!1426331))

(declare-fun m!1426333 () Bool)

(assert (=> start!131994 m!1426333))

(declare-fun m!1426335 () Bool)

(assert (=> start!131994 m!1426335))

(declare-fun m!1426337 () Bool)

(assert (=> start!131994 m!1426337))

(declare-fun m!1426339 () Bool)

(assert (=> b!1546415 m!1426339))

(declare-fun m!1426341 () Bool)

(assert (=> mapNonEmpty!58678 m!1426341))

(declare-fun m!1426343 () Bool)

(assert (=> bm!69528 m!1426343))

(declare-fun m!1426345 () Bool)

(assert (=> b!1546417 m!1426345))

(check-sat (not b!1546417) (not b_next!31707) (not mapNonEmpty!58678) tp_is_empty!37983 (not bm!69531) (not start!131994) (not b!1546419) (not bm!69528) b_and!51117 (not b!1546415) (not b!1546410) (not b!1546424))
(check-sat b_and!51117 (not b_next!31707))
