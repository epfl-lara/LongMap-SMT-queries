; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78156 () Bool)

(assert start!78156)

(declare-fun b_free!16667 () Bool)

(declare-fun b_next!16667 () Bool)

(assert (=> start!78156 (= b_free!16667 (not b_next!16667))))

(declare-fun tp!58275 () Bool)

(declare-fun b_and!27241 () Bool)

(assert (=> start!78156 (= tp!58275 b_and!27241)))

(declare-fun b!912145 () Bool)

(declare-fun e!511658 () Bool)

(declare-fun tp_is_empty!19085 () Bool)

(assert (=> b!912145 (= e!511658 tp_is_empty!19085)))

(declare-fun mapNonEmpty!30352 () Bool)

(declare-fun mapRes!30352 () Bool)

(declare-fun tp!58274 () Bool)

(declare-fun e!511661 () Bool)

(assert (=> mapNonEmpty!30352 (= mapRes!30352 (and tp!58274 e!511661))))

(declare-datatypes ((V!30411 0))(
  ( (V!30412 (val!9593 Int)) )
))
(declare-datatypes ((ValueCell!9061 0))(
  ( (ValueCellFull!9061 (v!12103 V!30411)) (EmptyCell!9061) )
))
(declare-datatypes ((array!54166 0))(
  ( (array!54167 (arr!26038 (Array (_ BitVec 32) ValueCell!9061)) (size!26497 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54166)

(declare-fun mapValue!30352 () ValueCell!9061)

(declare-fun mapRest!30352 () (Array (_ BitVec 32) ValueCell!9061))

(declare-fun mapKey!30352 () (_ BitVec 32))

(assert (=> mapNonEmpty!30352 (= (arr!26038 _values!1152) (store mapRest!30352 mapKey!30352 mapValue!30352))))

(declare-fun b!912146 () Bool)

(declare-fun e!511660 () Bool)

(assert (=> b!912146 (= e!511660 (and e!511658 mapRes!30352))))

(declare-fun condMapEmpty!30352 () Bool)

(declare-fun mapDefault!30352 () ValueCell!9061)

