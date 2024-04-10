; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78032 () Bool)

(assert start!78032)

(declare-fun b_free!16559 () Bool)

(declare-fun b_next!16559 () Bool)

(assert (=> start!78032 (= b_free!16559 (not b_next!16559))))

(declare-fun tp!57948 () Bool)

(declare-fun b_and!27131 () Bool)

(assert (=> start!78032 (= tp!57948 b_and!27131)))

(declare-fun b!910884 () Bool)

(declare-fun e!510780 () Bool)

(declare-fun e!510778 () Bool)

(declare-fun mapRes!30187 () Bool)

(assert (=> b!910884 (= e!510780 (and e!510778 mapRes!30187))))

(declare-fun condMapEmpty!30187 () Bool)

(declare-datatypes ((V!30267 0))(
  ( (V!30268 (val!9539 Int)) )
))
(declare-datatypes ((ValueCell!9007 0))(
  ( (ValueCellFull!9007 (v!12048 V!30267)) (EmptyCell!9007) )
))
(declare-datatypes ((array!53964 0))(
  ( (array!53965 (arr!25938 (Array (_ BitVec 32) ValueCell!9007)) (size!26397 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53964)

(declare-fun mapDefault!30187 () ValueCell!9007)

