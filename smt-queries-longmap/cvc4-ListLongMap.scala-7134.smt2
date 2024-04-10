; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90538 () Bool)

(assert start!90538)

(declare-fun b!1035633 () Bool)

(declare-fun b_free!20861 () Bool)

(declare-fun b_next!20861 () Bool)

(assert (=> b!1035633 (= b_free!20861 (not b_next!20861))))

(declare-fun tp!73710 () Bool)

(declare-fun b_and!33361 () Bool)

(assert (=> b!1035633 (= tp!73710 b_and!33361)))

(declare-fun mapNonEmpty!38382 () Bool)

(declare-fun mapRes!38382 () Bool)

(declare-fun tp!73711 () Bool)

(declare-fun e!585642 () Bool)

(assert (=> mapNonEmpty!38382 (= mapRes!38382 (and tp!73711 e!585642))))

(declare-datatypes ((V!37647 0))(
  ( (V!37648 (val!12341 Int)) )
))
(declare-datatypes ((ValueCell!11587 0))(
  ( (ValueCellFull!11587 (v!14921 V!37647)) (EmptyCell!11587) )
))
(declare-fun mapValue!38382 () ValueCell!11587)

(declare-fun mapKey!38382 () (_ BitVec 32))

(declare-fun mapRest!38382 () (Array (_ BitVec 32) ValueCell!11587))

(declare-datatypes ((array!65256 0))(
  ( (array!65257 (arr!31415 (Array (_ BitVec 32) (_ BitVec 64))) (size!31943 (_ BitVec 32))) )
))
(declare-datatypes ((array!65258 0))(
  ( (array!65259 (arr!31416 (Array (_ BitVec 32) ValueCell!11587)) (size!31944 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5768 0))(
  ( (LongMapFixedSize!5769 (defaultEntry!6262 Int) (mask!30153 (_ BitVec 32)) (extraKeys!5992 (_ BitVec 32)) (zeroValue!6096 V!37647) (minValue!6098 V!37647) (_size!2939 (_ BitVec 32)) (_keys!11449 array!65256) (_values!6285 array!65258) (_vacant!2939 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5768)

(assert (=> mapNonEmpty!38382 (= (arr!31416 (_values!6285 thiss!1427)) (store mapRest!38382 mapKey!38382 mapValue!38382))))

(declare-fun mapIsEmpty!38382 () Bool)

(assert (=> mapIsEmpty!38382 mapRes!38382))

(declare-fun b!1035631 () Bool)

(declare-fun res!691441 () Bool)

(declare-fun e!585643 () Bool)

(assert (=> b!1035631 (=> (not res!691441) (not e!585643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035631 (= res!691441 (validMask!0 (mask!30153 thiss!1427)))))

(declare-fun b!1035632 () Bool)

(declare-fun res!691440 () Bool)

(assert (=> b!1035632 (=> (not res!691440) (not e!585643))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035632 (= res!691440 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!24581 () Bool)

(declare-fun e!585640 () Bool)

(declare-fun e!585639 () Bool)

(declare-fun array_inv!24303 (array!65256) Bool)

(declare-fun array_inv!24304 (array!65258) Bool)

(assert (=> b!1035633 (= e!585640 (and tp!73710 tp_is_empty!24581 (array_inv!24303 (_keys!11449 thiss!1427)) (array_inv!24304 (_values!6285 thiss!1427)) e!585639))))

(declare-fun b!1035635 () Bool)

(assert (=> b!1035635 (= e!585643 (and (= (size!31944 (_values!6285 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30153 thiss!1427))) (= (size!31943 (_keys!11449 thiss!1427)) (size!31944 (_values!6285 thiss!1427))) (bvsge (mask!30153 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5992 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5992 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5992 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5992 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5992 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5992 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (not (= (bvand (bvand (extraKeys!5992 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1035636 () Bool)

(assert (=> b!1035636 (= e!585642 tp_is_empty!24581)))

(declare-fun b!1035637 () Bool)

(declare-fun e!585641 () Bool)

(assert (=> b!1035637 (= e!585639 (and e!585641 mapRes!38382))))

(declare-fun condMapEmpty!38382 () Bool)

(declare-fun mapDefault!38382 () ValueCell!11587)

