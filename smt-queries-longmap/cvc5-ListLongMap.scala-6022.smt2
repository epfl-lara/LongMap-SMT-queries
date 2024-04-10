; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78016 () Bool)

(assert start!78016)

(declare-fun b_free!16543 () Bool)

(declare-fun b_next!16543 () Bool)

(assert (=> start!78016 (= b_free!16543 (not b_next!16543))))

(declare-fun tp!57900 () Bool)

(declare-fun b_and!27115 () Bool)

(assert (=> start!78016 (= tp!57900 b_and!27115)))

(declare-fun b!910716 () Bool)

(declare-fun e!510659 () Bool)

(declare-fun tp_is_empty!18961 () Bool)

(assert (=> b!910716 (= e!510659 tp_is_empty!18961)))

(declare-fun b!910717 () Bool)

(declare-fun e!510657 () Bool)

(declare-fun mapRes!30163 () Bool)

(assert (=> b!910717 (= e!510657 (and e!510659 mapRes!30163))))

(declare-fun condMapEmpty!30163 () Bool)

(declare-datatypes ((V!30247 0))(
  ( (V!30248 (val!9531 Int)) )
))
(declare-datatypes ((ValueCell!8999 0))(
  ( (ValueCellFull!8999 (v!12040 V!30247)) (EmptyCell!8999) )
))
(declare-datatypes ((array!53936 0))(
  ( (array!53937 (arr!25924 (Array (_ BitVec 32) ValueCell!8999)) (size!26383 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53936)

(declare-fun mapDefault!30163 () ValueCell!8999)

