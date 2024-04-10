; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77826 () Bool)

(assert start!77826)

(declare-fun b_free!16385 () Bool)

(declare-fun b_next!16385 () Bool)

(assert (=> start!77826 (= b_free!16385 (not b_next!16385))))

(declare-fun tp!57419 () Bool)

(declare-fun b_and!26927 () Bool)

(assert (=> start!77826 (= tp!57419 b_and!26927)))

(declare-fun b!908555 () Bool)

(declare-fun e!509221 () Bool)

(declare-fun tp_is_empty!18803 () Bool)

(assert (=> b!908555 (= e!509221 tp_is_empty!18803)))

(declare-fun b!908556 () Bool)

(declare-fun e!509222 () Bool)

(declare-fun mapRes!29920 () Bool)

(assert (=> b!908556 (= e!509222 (and e!509221 mapRes!29920))))

(declare-fun condMapEmpty!29920 () Bool)

(declare-datatypes ((V!30035 0))(
  ( (V!30036 (val!9452 Int)) )
))
(declare-datatypes ((ValueCell!8920 0))(
  ( (ValueCellFull!8920 (v!11959 V!30035)) (EmptyCell!8920) )
))
(declare-datatypes ((array!53640 0))(
  ( (array!53641 (arr!25778 (Array (_ BitVec 32) ValueCell!8920)) (size!26237 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53640)

(declare-fun mapDefault!29920 () ValueCell!8920)

