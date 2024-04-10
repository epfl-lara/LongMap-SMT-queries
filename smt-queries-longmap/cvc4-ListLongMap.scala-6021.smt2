; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78014 () Bool)

(assert start!78014)

(declare-fun b_free!16541 () Bool)

(declare-fun b_next!16541 () Bool)

(assert (=> start!78014 (= b_free!16541 (not b_next!16541))))

(declare-fun tp!57894 () Bool)

(declare-fun b_and!27113 () Bool)

(assert (=> start!78014 (= tp!57894 b_and!27113)))

(declare-fun mapIsEmpty!30160 () Bool)

(declare-fun mapRes!30160 () Bool)

(assert (=> mapIsEmpty!30160 mapRes!30160))

(declare-fun b!910695 () Bool)

(declare-fun e!510644 () Bool)

(declare-fun e!510643 () Bool)

(assert (=> b!910695 (= e!510644 (and e!510643 mapRes!30160))))

(declare-fun condMapEmpty!30160 () Bool)

(declare-datatypes ((V!30243 0))(
  ( (V!30244 (val!9530 Int)) )
))
(declare-datatypes ((ValueCell!8998 0))(
  ( (ValueCellFull!8998 (v!12039 V!30243)) (EmptyCell!8998) )
))
(declare-datatypes ((array!53934 0))(
  ( (array!53935 (arr!25923 (Array (_ BitVec 32) ValueCell!8998)) (size!26382 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53934)

(declare-fun mapDefault!30160 () ValueCell!8998)

