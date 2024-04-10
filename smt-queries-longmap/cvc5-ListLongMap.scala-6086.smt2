; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78624 () Bool)

(assert start!78624)

(declare-fun b_free!16837 () Bool)

(declare-fun b_next!16837 () Bool)

(assert (=> start!78624 (= b_free!16837 (not b_next!16837))))

(declare-fun tp!58952 () Bool)

(declare-fun b_and!27459 () Bool)

(assert (=> start!78624 (= tp!58952 b_and!27459)))

(declare-fun mapNonEmpty!30774 () Bool)

(declare-fun mapRes!30774 () Bool)

(declare-fun tp!58951 () Bool)

(declare-fun e!514517 () Bool)

(assert (=> mapNonEmpty!30774 (= mapRes!30774 (and tp!58951 e!514517))))

(declare-datatypes ((V!30759 0))(
  ( (V!30760 (val!9723 Int)) )
))
(declare-datatypes ((ValueCell!9191 0))(
  ( (ValueCellFull!9191 (v!12241 V!30759)) (EmptyCell!9191) )
))
(declare-fun mapValue!30774 () ValueCell!9191)

(declare-fun mapRest!30774 () (Array (_ BitVec 32) ValueCell!9191))

(declare-fun mapKey!30774 () (_ BitVec 32))

(declare-datatypes ((array!54678 0))(
  ( (array!54679 (arr!26284 (Array (_ BitVec 32) ValueCell!9191)) (size!26743 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54678)

(assert (=> mapNonEmpty!30774 (= (arr!26284 _values!1231) (store mapRest!30774 mapKey!30774 mapValue!30774))))

(declare-fun b!916566 () Bool)

(declare-fun e!514519 () Bool)

(declare-fun e!514518 () Bool)

(assert (=> b!916566 (= e!514519 (and e!514518 mapRes!30774))))

(declare-fun condMapEmpty!30774 () Bool)

(declare-fun mapDefault!30774 () ValueCell!9191)

