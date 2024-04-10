; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!952 () Bool)

(assert start!952)

(declare-fun b_free!325 () Bool)

(declare-fun b_next!325 () Bool)

(assert (=> start!952 (= b_free!325 (not b_next!325))))

(declare-fun tp!1207 () Bool)

(declare-fun b_and!473 () Bool)

(assert (=> start!952 (= tp!1207 b_and!473)))

(declare-fun b!8113 () Bool)

(declare-fun res!7796 () Bool)

(declare-fun e!4597 () Bool)

(assert (=> b!8113 (=> (not res!7796) (not e!4597))))

(declare-datatypes ((array!737 0))(
  ( (array!738 (arr!356 (Array (_ BitVec 32) (_ BitVec 64))) (size!418 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!737)

(declare-datatypes ((List!243 0))(
  ( (Nil!240) (Cons!239 (h!805 (_ BitVec 64)) (t!2380 List!243)) )
))
(declare-fun arrayNoDuplicates!0 (array!737 (_ BitVec 32) List!243) Bool)

(assert (=> b!8113 (= res!7796 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!240))))

(declare-fun b!8114 () Bool)

(declare-fun e!4601 () Bool)

(assert (=> b!8114 (= e!4597 (not e!4601))))

(declare-fun res!7795 () Bool)

(assert (=> b!8114 (=> res!7795 e!4601)))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8114 (= res!7795 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!4595 () Bool)

(assert (=> b!8114 e!4595))

(declare-fun c!569 () Bool)

(assert (=> b!8114 (= c!569 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!715 0))(
  ( (V!716 (val!207 Int)) )
))
(declare-datatypes ((ValueCell!185 0))(
  ( (ValueCellFull!185 (v!1299 V!715)) (EmptyCell!185) )
))
(declare-datatypes ((array!739 0))(
  ( (array!740 (arr!357 (Array (_ BitVec 32) ValueCell!185)) (size!419 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!739)

(declare-fun minValue!1434 () V!715)

(declare-datatypes ((Unit!153 0))(
  ( (Unit!154) )
))
(declare-fun lt!1638 () Unit!153)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!715)

(declare-fun lemmaKeyInListMapIsInArray!57 (array!737 array!739 (_ BitVec 32) (_ BitVec 32) V!715 V!715 (_ BitVec 64) Int) Unit!153)

(assert (=> b!8114 (= lt!1638 (lemmaKeyInListMapIsInArray!57 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!578 () Bool)

(declare-fun mapRes!578 () Bool)

(declare-fun tp!1208 () Bool)

(declare-fun e!4600 () Bool)

(assert (=> mapNonEmpty!578 (= mapRes!578 (and tp!1208 e!4600))))

(declare-fun mapKey!578 () (_ BitVec 32))

(declare-fun mapRest!578 () (Array (_ BitVec 32) ValueCell!185))

(declare-fun mapValue!578 () ValueCell!185)

(assert (=> mapNonEmpty!578 (= (arr!357 _values!1492) (store mapRest!578 mapKey!578 mapValue!578))))

(declare-fun b!8115 () Bool)

(declare-fun res!7798 () Bool)

(assert (=> b!8115 (=> (not res!7798) (not e!4597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!737 (_ BitVec 32)) Bool)

(assert (=> b!8115 (= res!7798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!7793 () Bool)

(assert (=> start!952 (=> (not res!7793) (not e!4597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!952 (= res!7793 (validMask!0 mask!2250))))

(assert (=> start!952 e!4597))

(assert (=> start!952 tp!1207))

(assert (=> start!952 true))

(declare-fun e!4599 () Bool)

(declare-fun array_inv!263 (array!739) Bool)

(assert (=> start!952 (and (array_inv!263 _values!1492) e!4599)))

(declare-fun tp_is_empty!403 () Bool)

(assert (=> start!952 tp_is_empty!403))

(declare-fun array_inv!264 (array!737) Bool)

(assert (=> start!952 (array_inv!264 _keys!1806)))

(declare-fun b!8116 () Bool)

(assert (=> b!8116 (= e!4600 tp_is_empty!403)))

(declare-fun b!8117 () Bool)

(declare-fun e!4598 () Bool)

(assert (=> b!8117 (= e!4598 tp_is_empty!403)))

(declare-fun b!8118 () Bool)

(assert (=> b!8118 (= e!4595 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!8119 () Bool)

(declare-fun res!7792 () Bool)

(assert (=> b!8119 (=> (not res!7792) (not e!4597))))

(declare-datatypes ((tuple2!232 0))(
  ( (tuple2!233 (_1!116 (_ BitVec 64)) (_2!116 V!715)) )
))
(declare-datatypes ((List!244 0))(
  ( (Nil!241) (Cons!240 (h!806 tuple2!232) (t!2381 List!244)) )
))
(declare-datatypes ((ListLongMap!237 0))(
  ( (ListLongMap!238 (toList!134 List!244)) )
))
(declare-fun contains!109 (ListLongMap!237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!93 (array!737 array!739 (_ BitVec 32) (_ BitVec 32) V!715 V!715 (_ BitVec 32) Int) ListLongMap!237)

(assert (=> b!8119 (= res!7792 (contains!109 (getCurrentListMap!93 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8120 () Bool)

(declare-fun res!7797 () Bool)

(assert (=> b!8120 (=> (not res!7797) (not e!4597))))

(assert (=> b!8120 (= res!7797 (and (= (size!419 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!418 _keys!1806) (size!419 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8121 () Bool)

(assert (=> b!8121 (= e!4599 (and e!4598 mapRes!578))))

(declare-fun condMapEmpty!578 () Bool)

(declare-fun mapDefault!578 () ValueCell!185)

