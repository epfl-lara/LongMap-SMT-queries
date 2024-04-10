; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90528 () Bool)

(assert start!90528)

(declare-fun b!1035531 () Bool)

(declare-fun b_free!20851 () Bool)

(declare-fun b_next!20851 () Bool)

(assert (=> b!1035531 (= b_free!20851 (not b_next!20851))))

(declare-fun tp!73681 () Bool)

(declare-fun b_and!33351 () Bool)

(assert (=> b!1035531 (= tp!73681 b_and!33351)))

(declare-fun mapNonEmpty!38367 () Bool)

(declare-fun mapRes!38367 () Bool)

(declare-fun tp!73680 () Bool)

(declare-fun e!585550 () Bool)

(assert (=> mapNonEmpty!38367 (= mapRes!38367 (and tp!73680 e!585550))))

(declare-datatypes ((V!37635 0))(
  ( (V!37636 (val!12336 Int)) )
))
(declare-datatypes ((ValueCell!11582 0))(
  ( (ValueCellFull!11582 (v!14916 V!37635)) (EmptyCell!11582) )
))
(declare-fun mapValue!38367 () ValueCell!11582)

(declare-fun mapKey!38367 () (_ BitVec 32))

(declare-datatypes ((array!65236 0))(
  ( (array!65237 (arr!31405 (Array (_ BitVec 32) (_ BitVec 64))) (size!31933 (_ BitVec 32))) )
))
(declare-datatypes ((array!65238 0))(
  ( (array!65239 (arr!31406 (Array (_ BitVec 32) ValueCell!11582)) (size!31934 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5758 0))(
  ( (LongMapFixedSize!5759 (defaultEntry!6257 Int) (mask!30146 (_ BitVec 32)) (extraKeys!5987 (_ BitVec 32)) (zeroValue!6091 V!37635) (minValue!6093 V!37635) (_size!2934 (_ BitVec 32)) (_keys!11444 array!65236) (_values!6280 array!65238) (_vacant!2934 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5758)

(declare-fun mapRest!38367 () (Array (_ BitVec 32) ValueCell!11582))

(assert (=> mapNonEmpty!38367 (= (arr!31406 (_values!6280 thiss!1427)) (store mapRest!38367 mapKey!38367 mapValue!38367))))

(declare-fun b!1035526 () Bool)

(declare-fun e!585551 () Bool)

(declare-fun tp_is_empty!24571 () Bool)

(assert (=> b!1035526 (= e!585551 tp_is_empty!24571)))

(declare-fun b!1035527 () Bool)

(declare-fun res!691396 () Bool)

(declare-fun e!585553 () Bool)

(assert (=> b!1035527 (=> (not res!691396) (not e!585553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035527 (= res!691396 (validMask!0 (mask!30146 thiss!1427)))))

(declare-fun b!1035529 () Bool)

(declare-fun res!691397 () Bool)

(assert (=> b!1035529 (=> (not res!691397) (not e!585553))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035529 (= res!691397 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035530 () Bool)

(assert (=> b!1035530 (= e!585553 (and (= (size!31934 (_values!6280 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30146 thiss!1427))) (= (size!31933 (_keys!11444 thiss!1427)) (size!31934 (_values!6280 thiss!1427))) (bvsge (mask!30146 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5987 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5987 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))))

(declare-fun e!585548 () Bool)

(declare-fun e!585552 () Bool)

(declare-fun array_inv!24293 (array!65236) Bool)

(declare-fun array_inv!24294 (array!65238) Bool)

(assert (=> b!1035531 (= e!585552 (and tp!73681 tp_is_empty!24571 (array_inv!24293 (_keys!11444 thiss!1427)) (array_inv!24294 (_values!6280 thiss!1427)) e!585548))))

(declare-fun mapIsEmpty!38367 () Bool)

(assert (=> mapIsEmpty!38367 mapRes!38367))

(declare-fun b!1035532 () Bool)

(assert (=> b!1035532 (= e!585548 (and e!585551 mapRes!38367))))

(declare-fun condMapEmpty!38367 () Bool)

(declare-fun mapDefault!38367 () ValueCell!11582)

