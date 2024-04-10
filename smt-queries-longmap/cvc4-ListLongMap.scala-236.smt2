; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4102 () Bool)

(assert start!4102)

(declare-fun b_free!1007 () Bool)

(declare-fun b_next!1007 () Bool)

(assert (=> start!4102 (= b_free!1007 (not b_next!1007))))

(declare-fun tp!4440 () Bool)

(declare-fun b_and!1817 () Bool)

(assert (=> start!4102 (= tp!4440 b_and!1817)))

(declare-fun res!18384 () Bool)

(declare-fun e!19563 () Bool)

(assert (=> start!4102 (=> (not res!18384) (not e!19563))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4102 (= res!18384 (validMask!0 mask!2294))))

(assert (=> start!4102 e!19563))

(assert (=> start!4102 true))

(assert (=> start!4102 tp!4440))

(declare-datatypes ((V!1639 0))(
  ( (V!1640 (val!707 Int)) )
))
(declare-datatypes ((ValueCell!481 0))(
  ( (ValueCellFull!481 (v!1796 V!1639)) (EmptyCell!481) )
))
(declare-datatypes ((array!1951 0))(
  ( (array!1952 (arr!929 (Array (_ BitVec 32) ValueCell!481)) (size!1030 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1951)

(declare-fun e!19565 () Bool)

(declare-fun array_inv!649 (array!1951) Bool)

(assert (=> start!4102 (and (array_inv!649 _values!1501) e!19565)))

(declare-datatypes ((array!1953 0))(
  ( (array!1954 (arr!930 (Array (_ BitVec 32) (_ BitVec 64))) (size!1031 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1953)

(declare-fun array_inv!650 (array!1953) Bool)

(assert (=> start!4102 (array_inv!650 _keys!1833)))

(declare-fun tp_is_empty!1361 () Bool)

(assert (=> start!4102 tp_is_empty!1361))

(declare-fun b!30495 () Bool)

(declare-fun e!19562 () Bool)

(declare-fun mapRes!1570 () Bool)

(assert (=> b!30495 (= e!19565 (and e!19562 mapRes!1570))))

(declare-fun condMapEmpty!1570 () Bool)

(declare-fun mapDefault!1570 () ValueCell!481)

