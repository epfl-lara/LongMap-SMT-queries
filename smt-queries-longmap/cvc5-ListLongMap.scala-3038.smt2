; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42602 () Bool)

(assert start!42602)

(declare-fun b_free!12037 () Bool)

(declare-fun b_next!12037 () Bool)

(assert (=> start!42602 (= b_free!12037 (not b_next!12037))))

(declare-fun tp!42150 () Bool)

(declare-fun b_and!20517 () Bool)

(assert (=> start!42602 (= tp!42150 b_and!20517)))

(declare-fun b!475277 () Bool)

(declare-fun e!279062 () Bool)

(declare-fun e!279063 () Bool)

(declare-fun mapRes!21916 () Bool)

(assert (=> b!475277 (= e!279062 (and e!279063 mapRes!21916))))

(declare-fun condMapEmpty!21916 () Bool)

(declare-datatypes ((V!19059 0))(
  ( (V!19060 (val!6777 Int)) )
))
(declare-datatypes ((ValueCell!6389 0))(
  ( (ValueCellFull!6389 (v!9070 V!19059)) (EmptyCell!6389) )
))
(declare-datatypes ((array!30667 0))(
  ( (array!30668 (arr!14751 (Array (_ BitVec 32) ValueCell!6389)) (size!15103 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30667)

(declare-fun mapDefault!21916 () ValueCell!6389)

