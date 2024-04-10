; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16158 () Bool)

(assert start!16158)

(declare-fun b!161013 () Bool)

(declare-fun b_free!3619 () Bool)

(declare-fun b_next!3619 () Bool)

(assert (=> b!161013 (= b_free!3619 (not b_next!3619))))

(declare-fun tp!13427 () Bool)

(declare-fun b_and!10033 () Bool)

(assert (=> b!161013 (= tp!13427 b_and!10033)))

(declare-fun e!105222 () Bool)

(declare-datatypes ((V!4209 0))(
  ( (V!4210 (val!1755 Int)) )
))
(declare-datatypes ((ValueCell!1367 0))(
  ( (ValueCellFull!1367 (v!3620 V!4209)) (EmptyCell!1367) )
))
(declare-datatypes ((array!5921 0))(
  ( (array!5922 (arr!2805 (Array (_ BitVec 32) (_ BitVec 64))) (size!3089 (_ BitVec 32))) )
))
(declare-datatypes ((array!5923 0))(
  ( (array!5924 (arr!2806 (Array (_ BitVec 32) ValueCell!1367)) (size!3090 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1642 0))(
  ( (LongMapFixedSize!1643 (defaultEntry!3263 Int) (mask!7845 (_ BitVec 32)) (extraKeys!3004 (_ BitVec 32)) (zeroValue!3106 V!4209) (minValue!3106 V!4209) (_size!870 (_ BitVec 32)) (_keys!5064 array!5921) (_values!3246 array!5923) (_vacant!870 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1642)

(declare-fun tp_is_empty!3421 () Bool)

(declare-fun e!105217 () Bool)

(declare-fun array_inv!1791 (array!5921) Bool)

(declare-fun array_inv!1792 (array!5923) Bool)

(assert (=> b!161013 (= e!105217 (and tp!13427 tp_is_empty!3421 (array_inv!1791 (_keys!5064 thiss!1248)) (array_inv!1792 (_values!3246 thiss!1248)) e!105222))))

(declare-fun b!161014 () Bool)

(declare-fun res!76336 () Bool)

(declare-fun e!105219 () Bool)

(assert (=> b!161014 (=> (not res!76336) (not e!105219))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!344 0))(
  ( (MissingZero!344 (index!3544 (_ BitVec 32))) (Found!344 (index!3545 (_ BitVec 32))) (Intermediate!344 (undefined!1156 Bool) (index!3546 (_ BitVec 32)) (x!17768 (_ BitVec 32))) (Undefined!344) (MissingVacant!344 (index!3547 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5921 (_ BitVec 32)) SeekEntryResult!344)

(assert (=> b!161014 (= res!76336 (is-Undefined!344 (seekEntryOrOpen!0 key!828 (_keys!5064 thiss!1248) (mask!7845 thiss!1248))))))

(declare-fun mapIsEmpty!5819 () Bool)

(declare-fun mapRes!5819 () Bool)

(assert (=> mapIsEmpty!5819 mapRes!5819))

(declare-fun b!161015 () Bool)

(declare-fun res!76337 () Bool)

(assert (=> b!161015 (=> (not res!76337) (not e!105219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!161015 (= res!76337 (validMask!0 (mask!7845 thiss!1248)))))

(declare-fun b!161016 () Bool)

(declare-fun res!76331 () Bool)

(assert (=> b!161016 (=> (not res!76331) (not e!105219))))

(assert (=> b!161016 (= res!76331 (and (= (size!3090 (_values!3246 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7845 thiss!1248))) (= (size!3089 (_keys!5064 thiss!1248)) (size!3090 (_values!3246 thiss!1248))) (bvsge (mask!7845 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3004 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3004 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!161017 () Bool)

(declare-fun e!105218 () Bool)

(assert (=> b!161017 (= e!105218 tp_is_empty!3421)))

(declare-fun mapNonEmpty!5819 () Bool)

(declare-fun tp!13426 () Bool)

(assert (=> mapNonEmpty!5819 (= mapRes!5819 (and tp!13426 e!105218))))

(declare-fun mapKey!5819 () (_ BitVec 32))

(declare-fun mapValue!5819 () ValueCell!1367)

(declare-fun mapRest!5819 () (Array (_ BitVec 32) ValueCell!1367))

(assert (=> mapNonEmpty!5819 (= (arr!2806 (_values!3246 thiss!1248)) (store mapRest!5819 mapKey!5819 mapValue!5819))))

(declare-fun b!161018 () Bool)

(declare-fun e!105220 () Bool)

(assert (=> b!161018 (= e!105222 (and e!105220 mapRes!5819))))

(declare-fun condMapEmpty!5819 () Bool)

(declare-fun mapDefault!5819 () ValueCell!1367)

