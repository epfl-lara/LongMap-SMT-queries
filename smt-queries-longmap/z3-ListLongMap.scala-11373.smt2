; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132554 () Bool)

(assert start!132554)

(declare-fun b_free!31855 () Bool)

(declare-fun b_next!31855 () Bool)

(assert (=> start!132554 (= b_free!31855 (not b_next!31855))))

(declare-fun tp!111817 () Bool)

(declare-fun b_and!51279 () Bool)

(assert (=> start!132554 (= tp!111817 b_and!51279)))

(declare-fun b!1552549 () Bool)

(declare-fun e!864383 () Bool)

(assert (=> b!1552549 (= e!864383 false)))

(declare-datatypes ((V!59285 0))(
  ( (V!59286 (val!19143 Int)) )
))
(declare-datatypes ((tuple2!24720 0))(
  ( (tuple2!24721 (_1!12371 (_ BitVec 64)) (_2!12371 V!59285)) )
))
(declare-datatypes ((List!36181 0))(
  ( (Nil!36178) (Cons!36177 (h!37640 tuple2!24720) (t!50879 List!36181)) )
))
(declare-datatypes ((ListLongMap!22337 0))(
  ( (ListLongMap!22338 (toList!11184 List!36181)) )
))
(declare-fun lt!669132 () ListLongMap!22337)

(declare-fun e!864382 () ListLongMap!22337)

(assert (=> b!1552549 (= lt!669132 e!864382)))

(declare-fun c!143313 () Bool)

(declare-fun lt!669133 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1552549 (= c!143313 (and (not lt!669133) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552549 (= lt!669133 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70796 () Bool)

(declare-fun call!70800 () ListLongMap!22337)

(declare-fun call!70803 () ListLongMap!22337)

(assert (=> bm!70796 (= call!70800 call!70803)))

(declare-fun b!1552550 () Bool)

(declare-fun call!70799 () ListLongMap!22337)

(declare-fun minValue!436 () V!59285)

(declare-fun +!5018 (ListLongMap!22337 tuple2!24720) ListLongMap!22337)

(assert (=> b!1552550 (= e!864382 (+!5018 call!70799 (tuple2!24721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapNonEmpty!58900 () Bool)

(declare-fun mapRes!58900 () Bool)

(declare-fun tp!111816 () Bool)

(declare-fun e!864384 () Bool)

(assert (=> mapNonEmpty!58900 (= mapRes!58900 (and tp!111816 e!864384))))

(declare-datatypes ((ValueCell!18155 0))(
  ( (ValueCellFull!18155 (v!21936 V!59285)) (EmptyCell!18155) )
))
(declare-fun mapRest!58900 () (Array (_ BitVec 32) ValueCell!18155))

(declare-fun mapValue!58900 () ValueCell!18155)

(declare-fun mapKey!58900 () (_ BitVec 32))

(declare-datatypes ((array!103584 0))(
  ( (array!103585 (arr!49987 (Array (_ BitVec 32) ValueCell!18155)) (size!50538 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103584)

(assert (=> mapNonEmpty!58900 (= (arr!49987 _values!470) (store mapRest!58900 mapKey!58900 mapValue!58900))))

(declare-datatypes ((array!103586 0))(
  ( (array!103587 (arr!49988 (Array (_ BitVec 32) (_ BitVec 64))) (size!50539 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103586)

(declare-fun zeroValue!436 () V!59285)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun bm!70797 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6651 (array!103586 array!103584 (_ BitVec 32) (_ BitVec 32) V!59285 V!59285 (_ BitVec 32) Int) ListLongMap!22337)

(assert (=> bm!70797 (= call!70803 (getCurrentListMapNoExtraKeys!6651 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1552551 () Bool)

(declare-fun res!1062712 () Bool)

(assert (=> b!1552551 (=> (not res!1062712) (not e!864383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103586 (_ BitVec 32)) Bool)

(assert (=> b!1552551 (= res!1062712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1552552 () Bool)

(declare-fun res!1062713 () Bool)

(assert (=> b!1552552 (=> (not res!1062713) (not e!864383))))

(assert (=> b!1552552 (= res!1062713 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50539 _keys!618))))))

(declare-fun call!70801 () ListLongMap!22337)

(declare-fun c!143312 () Bool)

(declare-fun bm!70798 () Bool)

(assert (=> bm!70798 (= call!70799 (+!5018 (ite c!143313 call!70803 (ite c!143312 call!70800 call!70801)) (ite (or c!143313 c!143312) (tuple2!24721 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24721 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552553 () Bool)

(declare-fun tp_is_empty!38131 () Bool)

(assert (=> b!1552553 (= e!864384 tp_is_empty!38131)))

(declare-fun b!1552554 () Bool)

(declare-fun res!1062714 () Bool)

(assert (=> b!1552554 (=> (not res!1062714) (not e!864383))))

(declare-datatypes ((List!36182 0))(
  ( (Nil!36179) (Cons!36178 (h!37641 (_ BitVec 64)) (t!50880 List!36182)) )
))
(declare-fun arrayNoDuplicates!0 (array!103586 (_ BitVec 32) List!36182) Bool)

(assert (=> b!1552554 (= res!1062714 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36179))))

(declare-fun b!1552555 () Bool)

(declare-fun e!864380 () ListLongMap!22337)

(assert (=> b!1552555 (= e!864382 e!864380)))

(assert (=> b!1552555 (= c!143312 (and (not lt!669133) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!1062716 () Bool)

(assert (=> start!132554 (=> (not res!1062716) (not e!864383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132554 (= res!1062716 (validMask!0 mask!926))))

(assert (=> start!132554 e!864383))

(declare-fun array_inv!39127 (array!103586) Bool)

(assert (=> start!132554 (array_inv!39127 _keys!618)))

(assert (=> start!132554 tp_is_empty!38131))

(assert (=> start!132554 true))

(assert (=> start!132554 tp!111817))

(declare-fun e!864386 () Bool)

(declare-fun array_inv!39128 (array!103584) Bool)

(assert (=> start!132554 (and (array_inv!39128 _values!470) e!864386)))

(declare-fun b!1552556 () Bool)

(declare-fun call!70802 () ListLongMap!22337)

(assert (=> b!1552556 (= e!864380 call!70802)))

(declare-fun b!1552557 () Bool)

(declare-fun res!1062715 () Bool)

(assert (=> b!1552557 (=> (not res!1062715) (not e!864383))))

(assert (=> b!1552557 (= res!1062715 (and (= (size!50538 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50539 _keys!618) (size!50538 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1552558 () Bool)

(declare-fun e!864387 () Bool)

(assert (=> b!1552558 (= e!864387 tp_is_empty!38131)))

(declare-fun b!1552559 () Bool)

(assert (=> b!1552559 (= e!864386 (and e!864387 mapRes!58900))))

(declare-fun condMapEmpty!58900 () Bool)

(declare-fun mapDefault!58900 () ValueCell!18155)

(assert (=> b!1552559 (= condMapEmpty!58900 (= (arr!49987 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18155)) mapDefault!58900)))))

(declare-fun b!1552560 () Bool)

(declare-fun c!143314 () Bool)

(assert (=> b!1552560 (= c!143314 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669133))))

(declare-fun e!864381 () ListLongMap!22337)

(assert (=> b!1552560 (= e!864380 e!864381)))

(declare-fun mapIsEmpty!58900 () Bool)

(assert (=> mapIsEmpty!58900 mapRes!58900))

(declare-fun bm!70799 () Bool)

(assert (=> bm!70799 (= call!70802 call!70799)))

(declare-fun bm!70800 () Bool)

(assert (=> bm!70800 (= call!70801 call!70800)))

(declare-fun b!1552561 () Bool)

(assert (=> b!1552561 (= e!864381 call!70802)))

(declare-fun b!1552562 () Bool)

(assert (=> b!1552562 (= e!864381 call!70801)))

(assert (= (and start!132554 res!1062716) b!1552557))

(assert (= (and b!1552557 res!1062715) b!1552551))

(assert (= (and b!1552551 res!1062712) b!1552554))

(assert (= (and b!1552554 res!1062714) b!1552552))

(assert (= (and b!1552552 res!1062713) b!1552549))

(assert (= (and b!1552549 c!143313) b!1552550))

(assert (= (and b!1552549 (not c!143313)) b!1552555))

(assert (= (and b!1552555 c!143312) b!1552556))

(assert (= (and b!1552555 (not c!143312)) b!1552560))

(assert (= (and b!1552560 c!143314) b!1552561))

(assert (= (and b!1552560 (not c!143314)) b!1552562))

(assert (= (or b!1552561 b!1552562) bm!70800))

(assert (= (or b!1552556 bm!70800) bm!70796))

(assert (= (or b!1552556 b!1552561) bm!70799))

(assert (= (or b!1552550 bm!70796) bm!70797))

(assert (= (or b!1552550 bm!70799) bm!70798))

(assert (= (and b!1552559 condMapEmpty!58900) mapIsEmpty!58900))

(assert (= (and b!1552559 (not condMapEmpty!58900)) mapNonEmpty!58900))

(get-info :version)

(assert (= (and mapNonEmpty!58900 ((_ is ValueCellFull!18155) mapValue!58900)) b!1552553))

(assert (= (and b!1552559 ((_ is ValueCellFull!18155) mapDefault!58900)) b!1552558))

(assert (= start!132554 b!1552559))

(declare-fun m!1431465 () Bool)

(assert (=> b!1552551 m!1431465))

(declare-fun m!1431467 () Bool)

(assert (=> bm!70798 m!1431467))

(declare-fun m!1431469 () Bool)

(assert (=> bm!70797 m!1431469))

(declare-fun m!1431471 () Bool)

(assert (=> b!1552554 m!1431471))

(declare-fun m!1431473 () Bool)

(assert (=> b!1552550 m!1431473))

(declare-fun m!1431475 () Bool)

(assert (=> mapNonEmpty!58900 m!1431475))

(declare-fun m!1431477 () Bool)

(assert (=> start!132554 m!1431477))

(declare-fun m!1431479 () Bool)

(assert (=> start!132554 m!1431479))

(declare-fun m!1431481 () Bool)

(assert (=> start!132554 m!1431481))

(check-sat (not mapNonEmpty!58900) tp_is_empty!38131 (not b!1552550) (not b!1552551) (not start!132554) (not b!1552554) (not bm!70798) b_and!51279 (not b_next!31855) (not bm!70797))
(check-sat b_and!51279 (not b_next!31855))
