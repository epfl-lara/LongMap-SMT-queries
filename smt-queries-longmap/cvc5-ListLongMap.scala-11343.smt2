; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131962 () Bool)

(assert start!131962)

(declare-fun b_free!31675 () Bool)

(declare-fun b_next!31675 () Bool)

(assert (=> start!131962 (= b_free!31675 (not b_next!31675))))

(declare-fun tp!111276 () Bool)

(declare-fun b_and!51085 () Bool)

(assert (=> start!131962 (= tp!111276 b_and!51085)))

(declare-fun b!1545641 () Bool)

(declare-fun res!1059897 () Bool)

(declare-fun e!860337 () Bool)

(assert (=> b!1545641 (=> (not res!1059897) (not e!860337))))

(declare-datatypes ((array!103108 0))(
  ( (array!103109 (arr!49756 (Array (_ BitVec 32) (_ BitVec 64))) (size!50306 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103108)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103108 (_ BitVec 32)) Bool)

(assert (=> b!1545641 (= res!1059897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545642 () Bool)

(declare-datatypes ((V!59045 0))(
  ( (V!59046 (val!19053 Int)) )
))
(declare-datatypes ((tuple2!24488 0))(
  ( (tuple2!24489 (_1!12255 (_ BitVec 64)) (_2!12255 V!59045)) )
))
(declare-datatypes ((List!35997 0))(
  ( (Nil!35994) (Cons!35993 (h!37438 tuple2!24488) (t!50691 List!35997)) )
))
(declare-datatypes ((ListLongMap!22097 0))(
  ( (ListLongMap!22098 (toList!11064 List!35997)) )
))
(declare-fun e!860342 () ListLongMap!22097)

(declare-fun call!69290 () ListLongMap!22097)

(assert (=> b!1545642 (= e!860342 call!69290)))

(declare-fun b!1545643 () Bool)

(declare-fun e!860343 () ListLongMap!22097)

(declare-fun call!69291 () ListLongMap!22097)

(declare-fun minValue!436 () V!59045)

(declare-fun +!4900 (ListLongMap!22097 tuple2!24488) ListLongMap!22097)

(assert (=> b!1545643 (= e!860343 (+!4900 call!69291 (tuple2!24489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun zeroValue!436 () V!59045)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18065 0))(
  ( (ValueCellFull!18065 (v!21854 V!59045)) (EmptyCell!18065) )
))
(declare-datatypes ((array!103110 0))(
  ( (array!103111 (arr!49757 (Array (_ BitVec 32) ValueCell!18065)) (size!50307 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103110)

(declare-fun bm!69287 () Bool)

(declare-fun call!69293 () ListLongMap!22097)

(declare-fun getCurrentListMapNoExtraKeys!6532 (array!103108 array!103110 (_ BitVec 32) (_ BitVec 32) V!59045 V!59045 (_ BitVec 32) Int) ListLongMap!22097)

(assert (=> bm!69287 (= call!69293 (getCurrentListMapNoExtraKeys!6532 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545644 () Bool)

(declare-fun c!141668 () Bool)

(declare-fun lt!666365 () Bool)

(assert (=> b!1545644 (= c!141668 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666365))))

(declare-fun e!860341 () ListLongMap!22097)

(assert (=> b!1545644 (= e!860342 e!860341)))

(declare-fun bm!69288 () Bool)

(declare-fun call!69294 () ListLongMap!22097)

(declare-fun call!69292 () ListLongMap!22097)

(assert (=> bm!69288 (= call!69294 call!69292)))

(declare-fun b!1545645 () Bool)

(assert (=> b!1545645 (= e!860341 call!69290)))

(declare-fun b!1545646 () Bool)

(declare-fun res!1059894 () Bool)

(assert (=> b!1545646 (=> (not res!1059894) (not e!860337))))

(declare-datatypes ((List!35998 0))(
  ( (Nil!35995) (Cons!35994 (h!37439 (_ BitVec 64)) (t!50692 List!35998)) )
))
(declare-fun arrayNoDuplicates!0 (array!103108 (_ BitVec 32) List!35998) Bool)

(assert (=> b!1545646 (= res!1059894 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35995))))

(declare-fun b!1545647 () Bool)

(declare-fun res!1059896 () Bool)

(declare-fun e!860335 () Bool)

(assert (=> b!1545647 (=> (not res!1059896) (not e!860335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1545647 (= res!1059896 (validKeyInArray!0 (select (arr!49756 _keys!618) from!762)))))

(declare-fun bm!69289 () Bool)

(assert (=> bm!69289 (= call!69292 call!69293)))

(declare-fun b!1545648 () Bool)

(assert (=> b!1545648 (= e!860337 e!860335)))

(declare-fun res!1059900 () Bool)

(assert (=> b!1545648 (=> (not res!1059900) (not e!860335))))

(assert (=> b!1545648 (= res!1059900 (bvslt from!762 (size!50306 _keys!618)))))

(declare-fun lt!666367 () ListLongMap!22097)

(assert (=> b!1545648 (= lt!666367 e!860343)))

(declare-fun c!141666 () Bool)

(assert (=> b!1545648 (= c!141666 (and (not lt!666365) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1545648 (= lt!666365 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!58630 () Bool)

(declare-fun mapRes!58630 () Bool)

(declare-fun tp!111277 () Bool)

(declare-fun e!860336 () Bool)

(assert (=> mapNonEmpty!58630 (= mapRes!58630 (and tp!111277 e!860336))))

(declare-fun mapRest!58630 () (Array (_ BitVec 32) ValueCell!18065))

(declare-fun mapValue!58630 () ValueCell!18065)

(declare-fun mapKey!58630 () (_ BitVec 32))

(assert (=> mapNonEmpty!58630 (= (arr!49757 _values!470) (store mapRest!58630 mapKey!58630 mapValue!58630))))

(declare-fun b!1545649 () Bool)

(assert (=> b!1545649 (= e!860335 (not true))))

(declare-fun lt!666368 () ListLongMap!22097)

(declare-fun contains!10034 (ListLongMap!22097 (_ BitVec 64)) Bool)

(assert (=> b!1545649 (contains!10034 (+!4900 lt!666368 (tuple2!24489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49756 _keys!618) from!762))))

(declare-datatypes ((Unit!51504 0))(
  ( (Unit!51505) )
))
(declare-fun lt!666366 () Unit!51504)

(declare-fun addStillContains!1222 (ListLongMap!22097 (_ BitVec 64) V!59045 (_ BitVec 64)) Unit!51504)

(assert (=> b!1545649 (= lt!666366 (addStillContains!1222 lt!666368 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49756 _keys!618) from!762)))))

(assert (=> b!1545649 (= lt!666368 (getCurrentListMapNoExtraKeys!6532 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545650 () Bool)

(declare-fun tp_is_empty!37951 () Bool)

(assert (=> b!1545650 (= e!860336 tp_is_empty!37951)))

(declare-fun res!1059899 () Bool)

(assert (=> start!131962 (=> (not res!1059899) (not e!860337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131962 (= res!1059899 (validMask!0 mask!926))))

(assert (=> start!131962 e!860337))

(declare-fun array_inv!38699 (array!103108) Bool)

(assert (=> start!131962 (array_inv!38699 _keys!618)))

(assert (=> start!131962 tp_is_empty!37951))

(assert (=> start!131962 true))

(assert (=> start!131962 tp!111276))

(declare-fun e!860339 () Bool)

(declare-fun array_inv!38700 (array!103110) Bool)

(assert (=> start!131962 (and (array_inv!38700 _values!470) e!860339)))

(declare-fun mapIsEmpty!58630 () Bool)

(assert (=> mapIsEmpty!58630 mapRes!58630))

(declare-fun b!1545651 () Bool)

(assert (=> b!1545651 (= e!860341 call!69294)))

(declare-fun bm!69290 () Bool)

(declare-fun c!141667 () Bool)

(assert (=> bm!69290 (= call!69291 (+!4900 (ite c!141666 call!69293 (ite c!141667 call!69292 call!69294)) (ite (or c!141666 c!141667) (tuple2!24489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1545652 () Bool)

(declare-fun e!860338 () Bool)

(assert (=> b!1545652 (= e!860338 tp_is_empty!37951)))

(declare-fun b!1545653 () Bool)

(assert (=> b!1545653 (= e!860343 e!860342)))

(assert (=> b!1545653 (= c!141667 (and (not lt!666365) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!69291 () Bool)

(assert (=> bm!69291 (= call!69290 call!69291)))

(declare-fun b!1545654 () Bool)

(declare-fun res!1059895 () Bool)

(assert (=> b!1545654 (=> (not res!1059895) (not e!860337))))

(assert (=> b!1545654 (= res!1059895 (and (= (size!50307 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50306 _keys!618) (size!50307 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545655 () Bool)

(assert (=> b!1545655 (= e!860339 (and e!860338 mapRes!58630))))

(declare-fun condMapEmpty!58630 () Bool)

(declare-fun mapDefault!58630 () ValueCell!18065)

