; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!624 () Bool)

(assert start!624)

(declare-fun b_free!97 () Bool)

(declare-fun b_next!97 () Bool)

(assert (=> start!624 (= b_free!97 (not b_next!97))))

(declare-fun tp!509 () Bool)

(declare-fun b_and!235 () Bool)

(assert (=> start!624 (= tp!509 b_and!235)))

(declare-fun b!3952 () Bool)

(declare-fun e!2030 () Bool)

(assert (=> b!3952 (= e!2030 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun lt!546 () Bool)

(declare-datatypes ((V!411 0))(
  ( (V!412 (val!93 Int)) )
))
(declare-datatypes ((ValueCell!71 0))(
  ( (ValueCellFull!71 (v!1180 V!411)) (EmptyCell!71) )
))
(declare-datatypes ((array!285 0))(
  ( (array!286 (arr!135 (Array (_ BitVec 32) ValueCell!71)) (size!197 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!285)

(declare-fun minValue!1434 () V!411)

(declare-datatypes ((array!287 0))(
  ( (array!288 (arr!136 (Array (_ BitVec 32) (_ BitVec 64))) (size!198 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!287)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!411)

(declare-datatypes ((tuple2!70 0))(
  ( (tuple2!71 (_1!35 (_ BitVec 64)) (_2!35 V!411)) )
))
(declare-datatypes ((List!81 0))(
  ( (Nil!78) (Cons!77 (h!643 tuple2!70) (t!2208 List!81)) )
))
(declare-datatypes ((ListLongMap!75 0))(
  ( (ListLongMap!76 (toList!53 List!81)) )
))
(declare-fun contains!23 (ListLongMap!75 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!12 (array!287 array!285 (_ BitVec 32) (_ BitVec 32) V!411 V!411 (_ BitVec 32) Int) ListLongMap!75)

(assert (=> b!3952 (= lt!546 (contains!23 (getCurrentListMap!12 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun res!5462 () Bool)

(assert (=> start!624 (=> (not res!5462) (not e!2030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!624 (= res!5462 (validMask!0 mask!2250))))

(assert (=> start!624 e!2030))

(assert (=> start!624 tp!509))

(assert (=> start!624 true))

(declare-fun e!2026 () Bool)

(declare-fun array_inv!97 (array!285) Bool)

(assert (=> start!624 (and (array_inv!97 _values!1492) e!2026)))

(declare-fun tp_is_empty!175 () Bool)

(assert (=> start!624 tp_is_empty!175))

(declare-fun array_inv!98 (array!287) Bool)

(assert (=> start!624 (array_inv!98 _keys!1806)))

(declare-fun b!3953 () Bool)

(declare-fun e!2027 () Bool)

(declare-fun mapRes!221 () Bool)

(assert (=> b!3953 (= e!2026 (and e!2027 mapRes!221))))

(declare-fun condMapEmpty!221 () Bool)

(declare-fun mapDefault!221 () ValueCell!71)

