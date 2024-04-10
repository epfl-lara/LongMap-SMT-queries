; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131942 () Bool)

(assert start!131942)

(declare-fun b_free!31655 () Bool)

(declare-fun b_next!31655 () Bool)

(assert (=> start!131942 (= b_free!31655 (not b_next!31655))))

(declare-fun tp!111217 () Bool)

(declare-fun b_and!51065 () Bool)

(assert (=> start!131942 (= tp!111217 b_and!51065)))

(declare-fun bm!69137 () Bool)

(declare-datatypes ((V!59017 0))(
  ( (V!59018 (val!19043 Int)) )
))
(declare-datatypes ((tuple2!24470 0))(
  ( (tuple2!24471 (_1!12246 (_ BitVec 64)) (_2!12246 V!59017)) )
))
(declare-datatypes ((List!35981 0))(
  ( (Nil!35978) (Cons!35977 (h!37422 tuple2!24470) (t!50675 List!35981)) )
))
(declare-datatypes ((ListLongMap!22079 0))(
  ( (ListLongMap!22080 (toList!11055 List!35981)) )
))
(declare-fun call!69143 () ListLongMap!22079)

(declare-fun call!69141 () ListLongMap!22079)

(assert (=> bm!69137 (= call!69143 call!69141)))

(declare-fun bm!69138 () Bool)

(declare-fun call!69142 () ListLongMap!22079)

(assert (=> bm!69138 (= call!69142 call!69143)))

(declare-fun b!1545161 () Bool)

(declare-fun e!860067 () Bool)

(assert (=> b!1545161 (= e!860067 false)))

(declare-datatypes ((array!103070 0))(
  ( (array!103071 (arr!49737 (Array (_ BitVec 32) (_ BitVec 64))) (size!50287 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103070)

(declare-fun zeroValue!436 () V!59017)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18055 0))(
  ( (ValueCellFull!18055 (v!21844 V!59017)) (EmptyCell!18055) )
))
(declare-datatypes ((array!103072 0))(
  ( (array!103073 (arr!49738 (Array (_ BitVec 32) ValueCell!18055)) (size!50288 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103072)

(declare-fun minValue!436 () V!59017)

(declare-fun lt!666248 () Bool)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun contains!10028 (ListLongMap!22079 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6524 (array!103070 array!103072 (_ BitVec 32) (_ BitVec 32) V!59017 V!59017 (_ BitVec 32) Int) ListLongMap!22079)

(assert (=> b!1545161 (= lt!666248 (contains!10028 (getCurrentListMapNoExtraKeys!6524 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478) (select (arr!49737 _keys!618) from!762)))))

(declare-fun b!1545162 () Bool)

(declare-fun e!860070 () ListLongMap!22079)

(declare-fun call!69140 () ListLongMap!22079)

(assert (=> b!1545162 (= e!860070 call!69140)))

(declare-fun b!1545163 () Bool)

(declare-fun e!860072 () ListLongMap!22079)

(declare-fun e!860073 () ListLongMap!22079)

(assert (=> b!1545163 (= e!860072 e!860073)))

(declare-fun c!141577 () Bool)

(declare-fun lt!666247 () Bool)

(assert (=> b!1545163 (= c!141577 (and (not lt!666247) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1545164 () Bool)

(declare-fun c!141578 () Bool)

(assert (=> b!1545164 (= c!141578 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666247))))

(assert (=> b!1545164 (= e!860073 e!860070)))

(declare-fun b!1545165 () Bool)

(declare-fun res!1059686 () Bool)

(declare-fun e!860065 () Bool)

(assert (=> b!1545165 (=> (not res!1059686) (not e!860065))))

(declare-datatypes ((List!35982 0))(
  ( (Nil!35979) (Cons!35978 (h!37423 (_ BitVec 64)) (t!50676 List!35982)) )
))
(declare-fun arrayNoDuplicates!0 (array!103070 (_ BitVec 32) List!35982) Bool)

(assert (=> b!1545165 (= res!1059686 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35979))))

(declare-fun b!1545166 () Bool)

(declare-fun res!1059684 () Bool)

(assert (=> b!1545166 (=> (not res!1059684) (not e!860065))))

(assert (=> b!1545166 (= res!1059684 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50287 _keys!618))))))

(declare-fun b!1545167 () Bool)

(declare-fun e!860071 () Bool)

(declare-fun tp_is_empty!37931 () Bool)

(assert (=> b!1545167 (= e!860071 tp_is_empty!37931)))

(declare-fun bm!69139 () Bool)

(declare-fun call!69144 () ListLongMap!22079)

(assert (=> bm!69139 (= call!69140 call!69144)))

(declare-fun res!1059685 () Bool)

(assert (=> start!131942 (=> (not res!1059685) (not e!860065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131942 (= res!1059685 (validMask!0 mask!926))))

(assert (=> start!131942 e!860065))

(declare-fun array_inv!38687 (array!103070) Bool)

(assert (=> start!131942 (array_inv!38687 _keys!618)))

(assert (=> start!131942 tp_is_empty!37931))

(assert (=> start!131942 true))

(assert (=> start!131942 tp!111217))

(declare-fun e!860069 () Bool)

(declare-fun array_inv!38688 (array!103072) Bool)

(assert (=> start!131942 (and (array_inv!38688 _values!470) e!860069)))

(declare-fun mapNonEmpty!58600 () Bool)

(declare-fun mapRes!58600 () Bool)

(declare-fun tp!111216 () Bool)

(declare-fun e!860066 () Bool)

(assert (=> mapNonEmpty!58600 (= mapRes!58600 (and tp!111216 e!860066))))

(declare-fun mapKey!58600 () (_ BitVec 32))

(declare-fun mapValue!58600 () ValueCell!18055)

(declare-fun mapRest!58600 () (Array (_ BitVec 32) ValueCell!18055))

(assert (=> mapNonEmpty!58600 (= (arr!49738 _values!470) (store mapRest!58600 mapKey!58600 mapValue!58600))))

(declare-fun b!1545168 () Bool)

(declare-fun res!1059687 () Bool)

(assert (=> b!1545168 (=> (not res!1059687) (not e!860065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103070 (_ BitVec 32)) Bool)

(assert (=> b!1545168 (= res!1059687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun bm!69140 () Bool)

(assert (=> bm!69140 (= call!69141 (getCurrentListMapNoExtraKeys!6524 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1545169 () Bool)

(assert (=> b!1545169 (= e!860066 tp_is_empty!37931)))

(declare-fun b!1545170 () Bool)

(declare-fun +!4891 (ListLongMap!22079 tuple2!24470) ListLongMap!22079)

(assert (=> b!1545170 (= e!860072 (+!4891 call!69144 (tuple2!24471 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1545171 () Bool)

(assert (=> b!1545171 (= e!860069 (and e!860071 mapRes!58600))))

(declare-fun condMapEmpty!58600 () Bool)

(declare-fun mapDefault!58600 () ValueCell!18055)

