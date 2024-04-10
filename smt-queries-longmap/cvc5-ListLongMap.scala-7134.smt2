; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90534 () Bool)

(assert start!90534)

(declare-fun b!1035593 () Bool)

(declare-fun b_free!20857 () Bool)

(declare-fun b_next!20857 () Bool)

(assert (=> b!1035593 (= b_free!20857 (not b_next!20857))))

(declare-fun tp!73699 () Bool)

(declare-fun b_and!33357 () Bool)

(assert (=> b!1035593 (= tp!73699 b_and!33357)))

(declare-fun b!1035589 () Bool)

(declare-fun e!585605 () Bool)

(declare-fun tp_is_empty!24577 () Bool)

(assert (=> b!1035589 (= e!585605 tp_is_empty!24577)))

(declare-fun res!691422 () Bool)

(declare-fun e!585607 () Bool)

(assert (=> start!90534 (=> (not res!691422) (not e!585607))))

(declare-datatypes ((V!37643 0))(
  ( (V!37644 (val!12339 Int)) )
))
(declare-datatypes ((ValueCell!11585 0))(
  ( (ValueCellFull!11585 (v!14919 V!37643)) (EmptyCell!11585) )
))
(declare-datatypes ((array!65248 0))(
  ( (array!65249 (arr!31411 (Array (_ BitVec 32) (_ BitVec 64))) (size!31939 (_ BitVec 32))) )
))
(declare-datatypes ((array!65250 0))(
  ( (array!65251 (arr!31412 (Array (_ BitVec 32) ValueCell!11585)) (size!31940 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5764 0))(
  ( (LongMapFixedSize!5765 (defaultEntry!6260 Int) (mask!30151 (_ BitVec 32)) (extraKeys!5990 (_ BitVec 32)) (zeroValue!6094 V!37643) (minValue!6096 V!37643) (_size!2937 (_ BitVec 32)) (_keys!11447 array!65248) (_values!6283 array!65250) (_vacant!2937 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5764)

(declare-fun valid!2176 (LongMapFixedSize!5764) Bool)

(assert (=> start!90534 (= res!691422 (valid!2176 thiss!1427))))

(assert (=> start!90534 e!585607))

(declare-fun e!585603 () Bool)

(assert (=> start!90534 e!585603))

(assert (=> start!90534 true))

(declare-fun b!1035590 () Bool)

(assert (=> b!1035590 (= e!585607 (and (= (size!31940 (_values!6283 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30151 thiss!1427))) (= (size!31939 (_keys!11447 thiss!1427)) (size!31940 (_values!6283 thiss!1427))) (bvsge (mask!30151 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5990 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5990 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (not (= (bvand (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1035591 () Bool)

(declare-fun e!585602 () Bool)

(assert (=> b!1035591 (= e!585602 tp_is_empty!24577)))

(declare-fun mapNonEmpty!38376 () Bool)

(declare-fun mapRes!38376 () Bool)

(declare-fun tp!73698 () Bool)

(assert (=> mapNonEmpty!38376 (= mapRes!38376 (and tp!73698 e!585605))))

(declare-fun mapValue!38376 () ValueCell!11585)

(declare-fun mapKey!38376 () (_ BitVec 32))

(declare-fun mapRest!38376 () (Array (_ BitVec 32) ValueCell!11585))

(assert (=> mapNonEmpty!38376 (= (arr!31412 (_values!6283 thiss!1427)) (store mapRest!38376 mapKey!38376 mapValue!38376))))

(declare-fun b!1035592 () Bool)

(declare-fun res!691423 () Bool)

(assert (=> b!1035592 (=> (not res!691423) (not e!585607))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035592 (= res!691423 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!585604 () Bool)

(declare-fun array_inv!24299 (array!65248) Bool)

(declare-fun array_inv!24300 (array!65250) Bool)

(assert (=> b!1035593 (= e!585603 (and tp!73699 tp_is_empty!24577 (array_inv!24299 (_keys!11447 thiss!1427)) (array_inv!24300 (_values!6283 thiss!1427)) e!585604))))

(declare-fun b!1035594 () Bool)

(assert (=> b!1035594 (= e!585604 (and e!585602 mapRes!38376))))

(declare-fun condMapEmpty!38376 () Bool)

(declare-fun mapDefault!38376 () ValueCell!11585)

