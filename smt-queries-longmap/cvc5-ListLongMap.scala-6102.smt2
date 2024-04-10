; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78720 () Bool)

(assert start!78720)

(declare-fun b_free!16933 () Bool)

(declare-fun b_next!16933 () Bool)

(assert (=> start!78720 (= b_free!16933 (not b_next!16933))))

(declare-fun tp!59239 () Bool)

(declare-fun b_and!27603 () Bool)

(assert (=> start!78720 (= tp!59239 b_and!27603)))

(declare-fun res!619065 () Bool)

(declare-fun e!515457 () Bool)

(assert (=> start!78720 (=> (not res!619065) (not e!515457))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78720 (= res!619065 (validMask!0 mask!1881))))

(assert (=> start!78720 e!515457))

(assert (=> start!78720 true))

(declare-fun tp_is_empty!19441 () Bool)

(assert (=> start!78720 tp_is_empty!19441))

(declare-datatypes ((V!30887 0))(
  ( (V!30888 (val!9771 Int)) )
))
(declare-datatypes ((ValueCell!9239 0))(
  ( (ValueCellFull!9239 (v!12289 V!30887)) (EmptyCell!9239) )
))
(declare-datatypes ((array!54866 0))(
  ( (array!54867 (arr!26378 (Array (_ BitVec 32) ValueCell!9239)) (size!26837 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54866)

(declare-fun e!515461 () Bool)

(declare-fun array_inv!20568 (array!54866) Bool)

(assert (=> start!78720 (and (array_inv!20568 _values!1231) e!515461)))

(assert (=> start!78720 tp!59239))

(declare-datatypes ((array!54868 0))(
  ( (array!54869 (arr!26379 (Array (_ BitVec 32) (_ BitVec 64))) (size!26838 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54868)

(declare-fun array_inv!20569 (array!54868) Bool)

(assert (=> start!78720 (array_inv!20569 _keys!1487)))

(declare-fun mapNonEmpty!30918 () Bool)

(declare-fun mapRes!30918 () Bool)

(declare-fun tp!59240 () Bool)

(declare-fun e!515458 () Bool)

(assert (=> mapNonEmpty!30918 (= mapRes!30918 (and tp!59240 e!515458))))

(declare-fun mapValue!30918 () ValueCell!9239)

(declare-fun mapKey!30918 () (_ BitVec 32))

(declare-fun mapRest!30918 () (Array (_ BitVec 32) ValueCell!9239))

(assert (=> mapNonEmpty!30918 (= (arr!26378 _values!1231) (store mapRest!30918 mapKey!30918 mapValue!30918))))

(declare-fun b!918206 () Bool)

(declare-fun e!515456 () Bool)

(assert (=> b!918206 (= e!515461 (and e!515456 mapRes!30918))))

(declare-fun condMapEmpty!30918 () Bool)

(declare-fun mapDefault!30918 () ValueCell!9239)

