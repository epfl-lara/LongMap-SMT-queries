; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77928 () Bool)

(assert start!77928)

(declare-fun b_free!16471 () Bool)

(declare-fun b_next!16471 () Bool)

(assert (=> start!77928 (= b_free!16471 (not b_next!16471))))

(declare-fun tp!57681 () Bool)

(declare-fun b_and!27041 () Bool)

(assert (=> start!77928 (= tp!57681 b_and!27041)))

(declare-fun b!909833 () Bool)

(declare-fun e!510045 () Bool)

(declare-fun tp_is_empty!18889 () Bool)

(assert (=> b!909833 (= e!510045 tp_is_empty!18889)))

(declare-fun b!909834 () Bool)

(declare-fun e!510048 () Bool)

(declare-fun mapRes!30052 () Bool)

(assert (=> b!909834 (= e!510048 (and e!510045 mapRes!30052))))

(declare-fun condMapEmpty!30052 () Bool)

(declare-datatypes ((V!30151 0))(
  ( (V!30152 (val!9495 Int)) )
))
(declare-datatypes ((ValueCell!8963 0))(
  ( (ValueCellFull!8963 (v!12003 V!30151)) (EmptyCell!8963) )
))
(declare-datatypes ((array!53802 0))(
  ( (array!53803 (arr!25858 (Array (_ BitVec 32) ValueCell!8963)) (size!26317 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53802)

(declare-fun mapDefault!30052 () ValueCell!8963)

