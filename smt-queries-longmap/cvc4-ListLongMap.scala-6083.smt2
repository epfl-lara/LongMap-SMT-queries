; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78610 () Bool)

(assert start!78610)

(declare-fun b_free!16823 () Bool)

(declare-fun b_next!16823 () Bool)

(assert (=> start!78610 (= b_free!16823 (not b_next!16823))))

(declare-fun tp!58909 () Bool)

(declare-fun b_and!27445 () Bool)

(assert (=> start!78610 (= tp!58909 b_and!27445)))

(declare-fun mapIsEmpty!30753 () Bool)

(declare-fun mapRes!30753 () Bool)

(assert (=> mapIsEmpty!30753 mapRes!30753))

(declare-fun mapNonEmpty!30753 () Bool)

(declare-fun tp!58910 () Bool)

(declare-fun e!514395 () Bool)

(assert (=> mapNonEmpty!30753 (= mapRes!30753 (and tp!58910 e!514395))))

(declare-datatypes ((V!30739 0))(
  ( (V!30740 (val!9716 Int)) )
))
(declare-datatypes ((ValueCell!9184 0))(
  ( (ValueCellFull!9184 (v!12234 V!30739)) (EmptyCell!9184) )
))
(declare-fun mapValue!30753 () ValueCell!9184)

(declare-fun mapRest!30753 () (Array (_ BitVec 32) ValueCell!9184))

(declare-fun mapKey!30753 () (_ BitVec 32))

(declare-datatypes ((array!54652 0))(
  ( (array!54653 (arr!26271 (Array (_ BitVec 32) ValueCell!9184)) (size!26730 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54652)

(assert (=> mapNonEmpty!30753 (= (arr!26271 _values!1231) (store mapRest!30753 mapKey!30753 mapValue!30753))))

(declare-fun b!916378 () Bool)

(declare-fun e!514392 () Bool)

(declare-fun e!514394 () Bool)

(assert (=> b!916378 (= e!514392 (and e!514394 mapRes!30753))))

(declare-fun condMapEmpty!30753 () Bool)

(declare-fun mapDefault!30753 () ValueCell!9184)

