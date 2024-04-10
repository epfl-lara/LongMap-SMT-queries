; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95990 () Bool)

(assert start!95990)

(declare-fun b_free!22643 () Bool)

(declare-fun b_next!22643 () Bool)

(assert (=> start!95990 (= b_free!22643 (not b_next!22643))))

(declare-fun tp!79777 () Bool)

(declare-fun b_and!35961 () Bool)

(assert (=> start!95990 (= tp!79777 b_and!35961)))

(declare-fun b!1087886 () Bool)

(declare-fun e!621405 () Bool)

(declare-fun tp_is_empty!26645 () Bool)

(assert (=> b!1087886 (= e!621405 tp_is_empty!26645)))

(declare-fun b!1087887 () Bool)

(declare-fun res!725538 () Bool)

(declare-fun e!621408 () Bool)

(assert (=> b!1087887 (=> (not res!725538) (not e!621408))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70215 0))(
  ( (array!70216 (arr!33781 (Array (_ BitVec 32) (_ BitVec 64))) (size!34317 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70215)

(assert (=> b!1087887 (= res!725538 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34317 _keys!1070))))))

(declare-fun mapIsEmpty!41722 () Bool)

(declare-fun mapRes!41722 () Bool)

(assert (=> mapIsEmpty!41722 mapRes!41722))

(declare-fun b!1087888 () Bool)

(declare-fun e!621406 () Bool)

(assert (=> b!1087888 (= e!621406 (and e!621405 mapRes!41722))))

(declare-fun condMapEmpty!41722 () Bool)

(declare-datatypes ((V!40653 0))(
  ( (V!40654 (val!13379 Int)) )
))
(declare-datatypes ((ValueCell!12613 0))(
  ( (ValueCellFull!12613 (v!16000 V!40653)) (EmptyCell!12613) )
))
(declare-datatypes ((array!70217 0))(
  ( (array!70218 (arr!33782 (Array (_ BitVec 32) ValueCell!12613)) (size!34318 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70217)

(declare-fun mapDefault!41722 () ValueCell!12613)

