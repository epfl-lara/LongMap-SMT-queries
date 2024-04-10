; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90252 () Bool)

(assert start!90252)

(declare-fun b!1033202 () Bool)

(declare-fun b_free!20771 () Bool)

(declare-fun b_next!20771 () Bool)

(assert (=> b!1033202 (= b_free!20771 (not b_next!20771))))

(declare-fun tp!73406 () Bool)

(declare-fun b_and!33239 () Bool)

(assert (=> b!1033202 (= tp!73406 b_and!33239)))

(declare-fun b!1033197 () Bool)

(declare-fun e!583937 () Bool)

(declare-datatypes ((V!37527 0))(
  ( (V!37528 (val!12296 Int)) )
))
(declare-datatypes ((ValueCell!11542 0))(
  ( (ValueCellFull!11542 (v!14873 V!37527)) (EmptyCell!11542) )
))
(declare-datatypes ((array!65058 0))(
  ( (array!65059 (arr!31325 (Array (_ BitVec 32) (_ BitVec 64))) (size!31847 (_ BitVec 32))) )
))
(declare-datatypes ((array!65060 0))(
  ( (array!65061 (arr!31326 (Array (_ BitVec 32) ValueCell!11542)) (size!31848 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5678 0))(
  ( (LongMapFixedSize!5679 (defaultEntry!6213 Int) (mask!30056 (_ BitVec 32)) (extraKeys!5945 (_ BitVec 32)) (zeroValue!6049 V!37527) (minValue!6049 V!37527) (_size!2894 (_ BitVec 32)) (_keys!11391 array!65058) (_values!6236 array!65060) (_vacant!2894 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5678)

(assert (=> b!1033197 (= e!583937 (and (= (size!31848 (_values!6236 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30056 thiss!1427))) (= (size!31847 (_keys!11391 thiss!1427)) (size!31848 (_values!6236 thiss!1427))) (bvsge (mask!30056 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5945 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5945 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5945 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt (bvand (extraKeys!5945 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011)))))

(declare-fun b!1033198 () Bool)

(declare-fun e!583934 () Bool)

(declare-fun e!583938 () Bool)

(declare-fun mapRes!38213 () Bool)

(assert (=> b!1033198 (= e!583934 (and e!583938 mapRes!38213))))

(declare-fun condMapEmpty!38213 () Bool)

(declare-fun mapDefault!38213 () ValueCell!11542)

