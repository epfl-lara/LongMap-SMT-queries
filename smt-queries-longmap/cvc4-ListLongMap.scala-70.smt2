; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!956 () Bool)

(assert start!956)

(declare-fun b_free!329 () Bool)

(declare-fun b_next!329 () Bool)

(assert (=> start!956 (= b_free!329 (not b_next!329))))

(declare-fun tp!1219 () Bool)

(declare-fun b_and!477 () Bool)

(assert (=> start!956 (= tp!1219 b_and!477)))

(declare-fun b!8185 () Bool)

(declare-fun e!4640 () Bool)

(declare-fun tp_is_empty!407 () Bool)

(assert (=> b!8185 (= e!4640 tp_is_empty!407)))

(declare-fun mapIsEmpty!584 () Bool)

(declare-fun mapRes!584 () Bool)

(assert (=> mapIsEmpty!584 mapRes!584))

(declare-fun mapNonEmpty!584 () Bool)

(declare-fun tp!1220 () Bool)

(assert (=> mapNonEmpty!584 (= mapRes!584 (and tp!1220 e!4640))))

(declare-datatypes ((V!719 0))(
  ( (V!720 (val!209 Int)) )
))
(declare-datatypes ((ValueCell!187 0))(
  ( (ValueCellFull!187 (v!1301 V!719)) (EmptyCell!187) )
))
(declare-fun mapRest!584 () (Array (_ BitVec 32) ValueCell!187))

(declare-datatypes ((array!745 0))(
  ( (array!746 (arr!360 (Array (_ BitVec 32) ValueCell!187)) (size!422 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!745)

(declare-fun mapValue!584 () ValueCell!187)

(declare-fun mapKey!584 () (_ BitVec 32))

(assert (=> mapNonEmpty!584 (= (arr!360 _values!1492) (store mapRest!584 mapKey!584 mapValue!584))))

(declare-fun b!8186 () Bool)

(declare-fun res!7839 () Bool)

(declare-fun e!4639 () Bool)

(assert (=> b!8186 (=> (not res!7839) (not e!4639))))

(declare-datatypes ((array!747 0))(
  ( (array!748 (arr!361 (Array (_ BitVec 32) (_ BitVec 64))) (size!423 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!747)

(declare-datatypes ((List!247 0))(
  ( (Nil!244) (Cons!243 (h!809 (_ BitVec 64)) (t!2384 List!247)) )
))
(declare-fun arrayNoDuplicates!0 (array!747 (_ BitVec 32) List!247) Bool)

(assert (=> b!8186 (= res!7839 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!244))))

(declare-fun b!8187 () Bool)

(declare-fun e!4642 () Bool)

(assert (=> b!8187 (= e!4642 tp_is_empty!407)))

(declare-fun b!8188 () Bool)

(declare-fun res!7835 () Bool)

(assert (=> b!8188 (=> (not res!7835) (not e!4639))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8188 (= res!7835 (and (= (size!422 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!423 _keys!1806) (size!422 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8189 () Bool)

(declare-fun res!7840 () Bool)

(assert (=> b!8189 (=> (not res!7840) (not e!4639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!747 (_ BitVec 32)) Bool)

(assert (=> b!8189 (= res!7840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8190 () Bool)

(declare-fun res!7836 () Bool)

(assert (=> b!8190 (=> (not res!7836) (not e!4639))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8190 (= res!7836 (validKeyInArray!0 k!1278))))

(declare-fun res!7838 () Bool)

(assert (=> start!956 (=> (not res!7838) (not e!4639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!956 (= res!7838 (validMask!0 mask!2250))))

(assert (=> start!956 e!4639))

(assert (=> start!956 tp!1219))

(assert (=> start!956 true))

(declare-fun e!4641 () Bool)

(declare-fun array_inv!267 (array!745) Bool)

(assert (=> start!956 (and (array_inv!267 _values!1492) e!4641)))

(assert (=> start!956 tp_is_empty!407))

(declare-fun array_inv!268 (array!747) Bool)

(assert (=> start!956 (array_inv!268 _keys!1806)))

(declare-fun b!8191 () Bool)

(declare-fun e!4638 () Bool)

(assert (=> b!8191 (= e!4639 (not e!4638))))

(declare-fun res!7834 () Bool)

(assert (=> b!8191 (=> res!7834 e!4638)))

(declare-fun arrayContainsKey!0 (array!747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8191 (= res!7834 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!4643 () Bool)

(assert (=> b!8191 e!4643))

(declare-fun c!575 () Bool)

(assert (=> b!8191 (= c!575 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((Unit!157 0))(
  ( (Unit!158) )
))
(declare-fun lt!1649 () Unit!157)

(declare-fun minValue!1434 () V!719)

(declare-fun zeroValue!1434 () V!719)

(declare-fun lemmaKeyInListMapIsInArray!59 (array!747 array!745 (_ BitVec 32) (_ BitVec 32) V!719 V!719 (_ BitVec 64) Int) Unit!157)

(assert (=> b!8191 (= lt!1649 (lemmaKeyInListMapIsInArray!59 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!8192 () Bool)

(assert (=> b!8192 (= e!4643 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!8193 () Bool)

(declare-fun res!7837 () Bool)

(assert (=> b!8193 (=> (not res!7837) (not e!4639))))

(declare-datatypes ((tuple2!236 0))(
  ( (tuple2!237 (_1!118 (_ BitVec 64)) (_2!118 V!719)) )
))
(declare-datatypes ((List!248 0))(
  ( (Nil!245) (Cons!244 (h!810 tuple2!236) (t!2385 List!248)) )
))
(declare-datatypes ((ListLongMap!241 0))(
  ( (ListLongMap!242 (toList!136 List!248)) )
))
(declare-fun contains!111 (ListLongMap!241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!95 (array!747 array!745 (_ BitVec 32) (_ BitVec 32) V!719 V!719 (_ BitVec 32) Int) ListLongMap!241)

(assert (=> b!8193 (= res!7837 (contains!111 (getCurrentListMap!95 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8194 () Bool)

(assert (=> b!8194 (= e!4641 (and e!4642 mapRes!584))))

(declare-fun condMapEmpty!584 () Bool)

(declare-fun mapDefault!584 () ValueCell!187)

