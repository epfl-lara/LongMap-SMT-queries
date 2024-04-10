; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4072 () Bool)

(assert start!4072)

(declare-fun b_free!977 () Bool)

(declare-fun b_next!977 () Bool)

(assert (=> start!4072 (= b_free!977 (not b_next!977))))

(declare-fun tp!4350 () Bool)

(declare-fun b_and!1787 () Bool)

(assert (=> start!4072 (= tp!4350 b_and!1787)))

(declare-fun res!18071 () Bool)

(declare-fun e!19340 () Bool)

(assert (=> start!4072 (=> (not res!18071) (not e!19340))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4072 (= res!18071 (validMask!0 mask!2294))))

(assert (=> start!4072 e!19340))

(assert (=> start!4072 true))

(assert (=> start!4072 tp!4350))

(declare-datatypes ((V!1599 0))(
  ( (V!1600 (val!692 Int)) )
))
(declare-datatypes ((ValueCell!466 0))(
  ( (ValueCellFull!466 (v!1781 V!1599)) (EmptyCell!466) )
))
(declare-datatypes ((array!1891 0))(
  ( (array!1892 (arr!899 (Array (_ BitVec 32) ValueCell!466)) (size!1000 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1891)

(declare-fun e!19338 () Bool)

(declare-fun array_inv!627 (array!1891) Bool)

(assert (=> start!4072 (and (array_inv!627 _values!1501) e!19338)))

(declare-datatypes ((array!1893 0))(
  ( (array!1894 (arr!900 (Array (_ BitVec 32) (_ BitVec 64))) (size!1001 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1893)

(declare-fun array_inv!628 (array!1893) Bool)

(assert (=> start!4072 (array_inv!628 _keys!1833)))

(declare-fun tp_is_empty!1331 () Bool)

(assert (=> start!4072 tp_is_empty!1331))

(declare-fun mapNonEmpty!1525 () Bool)

(declare-fun mapRes!1525 () Bool)

(declare-fun tp!4351 () Bool)

(declare-fun e!19339 () Bool)

(assert (=> mapNonEmpty!1525 (= mapRes!1525 (and tp!4351 e!19339))))

(declare-fun mapValue!1525 () ValueCell!466)

(declare-fun mapRest!1525 () (Array (_ BitVec 32) ValueCell!466))

(declare-fun mapKey!1525 () (_ BitVec 32))

(assert (=> mapNonEmpty!1525 (= (arr!899 _values!1501) (store mapRest!1525 mapKey!1525 mapValue!1525))))

(declare-fun b!30045 () Bool)

(assert (=> b!30045 (= e!19339 tp_is_empty!1331)))

(declare-fun mapIsEmpty!1525 () Bool)

(assert (=> mapIsEmpty!1525 mapRes!1525))

(declare-fun b!30046 () Bool)

(declare-fun res!18067 () Bool)

(assert (=> b!30046 (=> (not res!18067) (not e!19340))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30046 (= res!18067 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30047 () Bool)

(declare-fun e!19336 () Bool)

(assert (=> b!30047 (= e!19338 (and e!19336 mapRes!1525))))

(declare-fun condMapEmpty!1525 () Bool)

(declare-fun mapDefault!1525 () ValueCell!466)

