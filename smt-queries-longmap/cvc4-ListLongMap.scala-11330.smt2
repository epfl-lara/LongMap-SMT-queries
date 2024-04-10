; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131888 () Bool)

(assert start!131888)

(declare-fun b_free!31601 () Bool)

(declare-fun b_next!31601 () Bool)

(assert (=> start!131888 (= b_free!31601 (not b_next!31601))))

(declare-fun tp!111055 () Bool)

(declare-fun b_and!51011 () Bool)

(assert (=> start!131888 (= tp!111055 b_and!51011)))

(declare-fun b!1544011 () Bool)

(declare-datatypes ((V!58945 0))(
  ( (V!58946 (val!19016 Int)) )
))
(declare-datatypes ((tuple2!24422 0))(
  ( (tuple2!24423 (_1!12222 (_ BitVec 64)) (_2!12222 V!58945)) )
))
(declare-datatypes ((List!35939 0))(
  ( (Nil!35936) (Cons!35935 (h!37380 tuple2!24422) (t!50633 List!35939)) )
))
(declare-datatypes ((ListLongMap!22031 0))(
  ( (ListLongMap!22032 (toList!11031 List!35939)) )
))
(declare-fun e!859416 () ListLongMap!22031)

(declare-fun call!68738 () ListLongMap!22031)

(assert (=> b!1544011 (= e!859416 call!68738)))

(declare-fun b!1544012 () Bool)

(declare-fun res!1059265 () Bool)

(declare-fun e!859411 () Bool)

(assert (=> b!1544012 (=> (not res!1059265) (not e!859411))))

(declare-datatypes ((array!102968 0))(
  ( (array!102969 (arr!49686 (Array (_ BitVec 32) (_ BitVec 64))) (size!50236 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102968)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18028 0))(
  ( (ValueCellFull!18028 (v!21817 V!58945)) (EmptyCell!18028) )
))
(declare-datatypes ((array!102970 0))(
  ( (array!102971 (arr!49687 (Array (_ BitVec 32) ValueCell!18028)) (size!50237 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102970)

(assert (=> b!1544012 (= res!1059265 (and (= (size!50237 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50236 _keys!618) (size!50237 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544014 () Bool)

(assert (=> b!1544014 (= e!859411 false)))

(declare-fun lt!666076 () ListLongMap!22031)

(declare-fun e!859412 () ListLongMap!22031)

(assert (=> b!1544014 (= lt!666076 e!859412)))

(declare-fun c!141333 () Bool)

(declare-fun lt!666077 () Bool)

(assert (=> b!1544014 (= c!141333 (and (not lt!666077) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544014 (= lt!666077 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!58519 () Bool)

(declare-fun mapRes!58519 () Bool)

(declare-fun tp!111054 () Bool)

(declare-fun e!859415 () Bool)

(assert (=> mapNonEmpty!58519 (= mapRes!58519 (and tp!111054 e!859415))))

(declare-fun mapKey!58519 () (_ BitVec 32))

(declare-fun mapRest!58519 () (Array (_ BitVec 32) ValueCell!18028))

(declare-fun mapValue!58519 () ValueCell!18028)

(assert (=> mapNonEmpty!58519 (= (arr!49687 _values!470) (store mapRest!58519 mapKey!58519 mapValue!58519))))

(declare-fun b!1544015 () Bool)

(declare-fun c!141335 () Bool)

(assert (=> b!1544015 (= c!141335 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666077))))

(declare-fun e!859414 () ListLongMap!22031)

(assert (=> b!1544015 (= e!859416 e!859414)))

(declare-fun b!1544016 () Bool)

(declare-fun res!1059263 () Bool)

(assert (=> b!1544016 (=> (not res!1059263) (not e!859411))))

(declare-fun from!762 () (_ BitVec 32))

(assert (=> b!1544016 (= res!1059263 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50236 _keys!618))))))

(declare-fun zeroValue!436 () V!58945)

(declare-fun defaultEntry!478 () Int)

(declare-fun minValue!436 () V!58945)

(declare-fun bm!68732 () Bool)

(declare-fun call!68739 () ListLongMap!22031)

(declare-fun getCurrentListMapNoExtraKeys!6503 (array!102968 array!102970 (_ BitVec 32) (_ BitVec 32) V!58945 V!58945 (_ BitVec 32) Int) ListLongMap!22031)

(assert (=> bm!68732 (= call!68739 (getCurrentListMapNoExtraKeys!6503 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!68733 () Bool)

(declare-fun call!68735 () ListLongMap!22031)

(declare-fun c!141334 () Bool)

(declare-fun call!68736 () ListLongMap!22031)

(declare-fun call!68737 () ListLongMap!22031)

(declare-fun +!4870 (ListLongMap!22031 tuple2!24422) ListLongMap!22031)

(assert (=> bm!68733 (= call!68736 (+!4870 (ite c!141333 call!68739 (ite c!141334 call!68737 call!68735)) (ite (or c!141333 c!141334) (tuple2!24423 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24423 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!68734 () Bool)

(assert (=> bm!68734 (= call!68738 call!68736)))

(declare-fun b!1544017 () Bool)

(assert (=> b!1544017 (= e!859414 call!68735)))

(declare-fun b!1544018 () Bool)

(declare-fun tp_is_empty!37877 () Bool)

(assert (=> b!1544018 (= e!859415 tp_is_empty!37877)))

(declare-fun b!1544013 () Bool)

(declare-fun res!1059264 () Bool)

(assert (=> b!1544013 (=> (not res!1059264) (not e!859411))))

(declare-datatypes ((List!35940 0))(
  ( (Nil!35937) (Cons!35936 (h!37381 (_ BitVec 64)) (t!50634 List!35940)) )
))
(declare-fun arrayNoDuplicates!0 (array!102968 (_ BitVec 32) List!35940) Bool)

(assert (=> b!1544013 (= res!1059264 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35937))))

(declare-fun res!1059266 () Bool)

(assert (=> start!131888 (=> (not res!1059266) (not e!859411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131888 (= res!1059266 (validMask!0 mask!926))))

(assert (=> start!131888 e!859411))

(declare-fun array_inv!38651 (array!102968) Bool)

(assert (=> start!131888 (array_inv!38651 _keys!618)))

(assert (=> start!131888 tp_is_empty!37877))

(assert (=> start!131888 true))

(assert (=> start!131888 tp!111055))

(declare-fun e!859409 () Bool)

(declare-fun array_inv!38652 (array!102970) Bool)

(assert (=> start!131888 (and (array_inv!38652 _values!470) e!859409)))

(declare-fun bm!68735 () Bool)

(assert (=> bm!68735 (= call!68737 call!68739)))

(declare-fun b!1544019 () Bool)

(declare-fun res!1059267 () Bool)

(assert (=> b!1544019 (=> (not res!1059267) (not e!859411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102968 (_ BitVec 32)) Bool)

(assert (=> b!1544019 (= res!1059267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!68736 () Bool)

(assert (=> bm!68736 (= call!68735 call!68737)))

(declare-fun b!1544020 () Bool)

(declare-fun e!859410 () Bool)

(assert (=> b!1544020 (= e!859409 (and e!859410 mapRes!58519))))

(declare-fun condMapEmpty!58519 () Bool)

(declare-fun mapDefault!58519 () ValueCell!18028)

