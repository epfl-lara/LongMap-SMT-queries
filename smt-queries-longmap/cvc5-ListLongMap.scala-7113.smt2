; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90140 () Bool)

(assert start!90140)

(declare-fun b!1032485 () Bool)

(declare-fun b_free!20731 () Bool)

(declare-fun b_next!20731 () Bool)

(assert (=> b!1032485 (= b_free!20731 (not b_next!20731))))

(declare-fun tp!73268 () Bool)

(declare-fun b_and!33199 () Bool)

(assert (=> b!1032485 (= tp!73268 b_and!33199)))

(declare-fun b!1032480 () Bool)

(declare-fun res!690060 () Bool)

(declare-fun e!583403 () Bool)

(assert (=> b!1032480 (=> (not res!690060) (not e!583403))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032480 (= res!690060 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1032481 () Bool)

(declare-fun e!583401 () Bool)

(declare-fun tp_is_empty!24451 () Bool)

(assert (=> b!1032481 (= e!583401 tp_is_empty!24451)))

(declare-fun res!690062 () Bool)

(assert (=> start!90140 (=> (not res!690062) (not e!583403))))

(declare-datatypes ((V!37475 0))(
  ( (V!37476 (val!12276 Int)) )
))
(declare-datatypes ((ValueCell!11522 0))(
  ( (ValueCellFull!11522 (v!14853 V!37475)) (EmptyCell!11522) )
))
(declare-datatypes ((array!64968 0))(
  ( (array!64969 (arr!31285 (Array (_ BitVec 32) (_ BitVec 64))) (size!31803 (_ BitVec 32))) )
))
(declare-datatypes ((array!64970 0))(
  ( (array!64971 (arr!31286 (Array (_ BitVec 32) ValueCell!11522)) (size!31804 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5638 0))(
  ( (LongMapFixedSize!5639 (defaultEntry!6193 Int) (mask!30015 (_ BitVec 32)) (extraKeys!5925 (_ BitVec 32)) (zeroValue!6029 V!37475) (minValue!6029 V!37475) (_size!2874 (_ BitVec 32)) (_keys!11367 array!64968) (_values!6216 array!64970) (_vacant!2874 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5638)

(declare-fun valid!2134 (LongMapFixedSize!5638) Bool)

(assert (=> start!90140 (= res!690062 (valid!2134 thiss!1427))))

(assert (=> start!90140 e!583403))

(declare-fun e!583405 () Bool)

(assert (=> start!90140 e!583405))

(assert (=> start!90140 true))

(declare-fun b!1032482 () Bool)

(declare-fun res!690061 () Bool)

(assert (=> b!1032482 (=> (not res!690061) (not e!583403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032482 (= res!690061 (validMask!0 (mask!30015 thiss!1427)))))

(declare-fun b!1032483 () Bool)

(declare-fun e!583404 () Bool)

(declare-fun mapRes!38134 () Bool)

(assert (=> b!1032483 (= e!583404 (and e!583401 mapRes!38134))))

(declare-fun condMapEmpty!38134 () Bool)

(declare-fun mapDefault!38134 () ValueCell!11522)

