; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4092 () Bool)

(assert start!4092)

(declare-fun b_free!997 () Bool)

(declare-fun b_next!997 () Bool)

(assert (=> start!4092 (= b_free!997 (not b_next!997))))

(declare-fun tp!4411 () Bool)

(declare-fun b_and!1807 () Bool)

(assert (=> start!4092 (= tp!4411 b_and!1807)))

(declare-fun res!18278 () Bool)

(declare-fun e!19487 () Bool)

(assert (=> start!4092 (=> (not res!18278) (not e!19487))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4092 (= res!18278 (validMask!0 mask!2294))))

(assert (=> start!4092 e!19487))

(assert (=> start!4092 true))

(assert (=> start!4092 tp!4411))

(declare-datatypes ((V!1627 0))(
  ( (V!1628 (val!702 Int)) )
))
(declare-datatypes ((ValueCell!476 0))(
  ( (ValueCellFull!476 (v!1791 V!1627)) (EmptyCell!476) )
))
(declare-datatypes ((array!1931 0))(
  ( (array!1932 (arr!919 (Array (_ BitVec 32) ValueCell!476)) (size!1020 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1931)

(declare-fun e!19488 () Bool)

(declare-fun array_inv!641 (array!1931) Bool)

(assert (=> start!4092 (and (array_inv!641 _values!1501) e!19488)))

(declare-datatypes ((array!1933 0))(
  ( (array!1934 (arr!920 (Array (_ BitVec 32) (_ BitVec 64))) (size!1021 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1933)

(declare-fun array_inv!642 (array!1933) Bool)

(assert (=> start!4092 (array_inv!642 _keys!1833)))

(declare-fun tp_is_empty!1351 () Bool)

(assert (=> start!4092 tp_is_empty!1351))

(declare-fun b!30345 () Bool)

(declare-fun e!19489 () Bool)

(assert (=> b!30345 (= e!19489 tp_is_empty!1351)))

(declare-fun b!30346 () Bool)

(declare-fun mapRes!1555 () Bool)

(assert (=> b!30346 (= e!19488 (and e!19489 mapRes!1555))))

(declare-fun condMapEmpty!1555 () Bool)

(declare-fun mapDefault!1555 () ValueCell!476)

