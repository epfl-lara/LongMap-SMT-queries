; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90498 () Bool)

(assert start!90498)

(declare-fun b!1035315 () Bool)

(declare-fun b_free!20837 () Bool)

(declare-fun b_next!20837 () Bool)

(assert (=> b!1035315 (= b_free!20837 (not b_next!20837))))

(declare-fun tp!73634 () Bool)

(declare-fun b_and!33337 () Bool)

(assert (=> b!1035315 (= tp!73634 b_and!33337)))

(declare-fun mapNonEmpty!38342 () Bool)

(declare-fun mapRes!38342 () Bool)

(declare-fun tp!73635 () Bool)

(declare-fun e!585381 () Bool)

(assert (=> mapNonEmpty!38342 (= mapRes!38342 (and tp!73635 e!585381))))

(declare-datatypes ((V!37615 0))(
  ( (V!37616 (val!12329 Int)) )
))
(declare-datatypes ((ValueCell!11575 0))(
  ( (ValueCellFull!11575 (v!14909 V!37615)) (EmptyCell!11575) )
))
(declare-datatypes ((array!65206 0))(
  ( (array!65207 (arr!31391 (Array (_ BitVec 32) (_ BitVec 64))) (size!31918 (_ BitVec 32))) )
))
(declare-datatypes ((array!65208 0))(
  ( (array!65209 (arr!31392 (Array (_ BitVec 32) ValueCell!11575)) (size!31919 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5744 0))(
  ( (LongMapFixedSize!5745 (defaultEntry!6250 Int) (mask!30131 (_ BitVec 32)) (extraKeys!5980 (_ BitVec 32)) (zeroValue!6084 V!37615) (minValue!6086 V!37615) (_size!2927 (_ BitVec 32)) (_keys!11436 array!65206) (_values!6273 array!65208) (_vacant!2927 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5744)

(declare-fun mapValue!38342 () ValueCell!11575)

(declare-fun mapKey!38342 () (_ BitVec 32))

(declare-fun mapRest!38342 () (Array (_ BitVec 32) ValueCell!11575))

(assert (=> mapNonEmpty!38342 (= (arr!31392 (_values!6273 thiss!1427)) (store mapRest!38342 mapKey!38342 mapValue!38342))))

(declare-fun b!1035309 () Bool)

(declare-fun e!585382 () Bool)

(assert (=> b!1035309 (= e!585382 (and (= (size!31919 (_values!6273 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30131 thiss!1427))) (= (size!31918 (_keys!11436 thiss!1427)) (size!31919 (_values!6273 thiss!1427))) (bvsge (mask!30131 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5980 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5980 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1035310 () Bool)

(declare-fun e!585385 () Bool)

(declare-fun e!585383 () Bool)

(assert (=> b!1035310 (= e!585385 (and e!585383 mapRes!38342))))

(declare-fun condMapEmpty!38342 () Bool)

(declare-fun mapDefault!38342 () ValueCell!11575)

