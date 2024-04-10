; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95824 () Bool)

(assert start!95824)

(declare-fun b_free!22477 () Bool)

(declare-fun b_next!22477 () Bool)

(assert (=> start!95824 (= b_free!22477 (not b_next!22477))))

(declare-fun tp!79279 () Bool)

(declare-fun b_and!35629 () Bool)

(assert (=> start!95824 (= tp!79279 b_and!35629)))

(declare-fun b!1084275 () Bool)

(declare-fun e!619473 () Bool)

(declare-fun e!619471 () Bool)

(declare-fun mapRes!41473 () Bool)

(assert (=> b!1084275 (= e!619473 (and e!619471 mapRes!41473))))

(declare-fun condMapEmpty!41473 () Bool)

(declare-datatypes ((V!40433 0))(
  ( (V!40434 (val!13296 Int)) )
))
(declare-datatypes ((ValueCell!12530 0))(
  ( (ValueCellFull!12530 (v!15917 V!40433)) (EmptyCell!12530) )
))
(declare-datatypes ((array!69899 0))(
  ( (array!69900 (arr!33623 (Array (_ BitVec 32) ValueCell!12530)) (size!34159 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69899)

(declare-fun mapDefault!41473 () ValueCell!12530)

