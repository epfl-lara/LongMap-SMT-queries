; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22046 () Bool)

(assert start!22046)

(declare-fun b!227821 () Bool)

(declare-fun b_free!6113 () Bool)

(declare-fun b_next!6113 () Bool)

(assert (=> b!227821 (= b_free!6113 (not b_next!6113))))

(declare-fun tp!21480 () Bool)

(declare-fun b_and!13011 () Bool)

(assert (=> b!227821 (= tp!21480 b_and!13011)))

(declare-fun b!227814 () Bool)

(declare-fun e!147801 () Bool)

(declare-fun call!21174 () Bool)

(assert (=> b!227814 (= e!147801 (not call!21174))))

(declare-fun b!227815 () Bool)

(declare-datatypes ((Unit!6912 0))(
  ( (Unit!6913) )
))
(declare-fun e!147806 () Unit!6912)

(declare-fun Unit!6914 () Unit!6912)

(assert (=> b!227815 (= e!147806 Unit!6914)))

(declare-fun lt!114633 () Unit!6912)

(declare-datatypes ((V!7613 0))(
  ( (V!7614 (val!3032 Int)) )
))
(declare-datatypes ((ValueCell!2644 0))(
  ( (ValueCellFull!2644 (v!5052 V!7613)) (EmptyCell!2644) )
))
(declare-datatypes ((array!11193 0))(
  ( (array!11194 (arr!5316 (Array (_ BitVec 32) ValueCell!2644)) (size!5649 (_ BitVec 32))) )
))
(declare-datatypes ((array!11195 0))(
  ( (array!11196 (arr!5317 (Array (_ BitVec 32) (_ BitVec 64))) (size!5650 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3188 0))(
  ( (LongMapFixedSize!3189 (defaultEntry!4253 Int) (mask!10117 (_ BitVec 32)) (extraKeys!3990 (_ BitVec 32)) (zeroValue!4094 V!7613) (minValue!4094 V!7613) (_size!1643 (_ BitVec 32)) (_keys!6307 array!11195) (_values!4236 array!11193) (_vacant!1643 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3188)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!267 (array!11195 array!11193 (_ BitVec 32) (_ BitVec 32) V!7613 V!7613 (_ BitVec 64) Int) Unit!6912)

(assert (=> b!227815 (= lt!114633 (lemmaInListMapThenSeekEntryOrOpenFindsIt!267 (_keys!6307 thiss!1504) (_values!4236 thiss!1504) (mask!10117 thiss!1504) (extraKeys!3990 thiss!1504) (zeroValue!4094 thiss!1504) (minValue!4094 thiss!1504) key!932 (defaultEntry!4253 thiss!1504)))))

(assert (=> b!227815 false))

(declare-fun mapIsEmpty!10132 () Bool)

(declare-fun mapRes!10132 () Bool)

(assert (=> mapIsEmpty!10132 mapRes!10132))

(declare-fun b!227817 () Bool)

(declare-fun res!112149 () Bool)

(assert (=> b!227817 (=> (not res!112149) (not e!147801))))

(declare-fun call!21173 () Bool)

(assert (=> b!227817 (= res!112149 call!21173)))

(declare-fun e!147800 () Bool)

(assert (=> b!227817 (= e!147800 e!147801)))

(declare-fun b!227818 () Bool)

(declare-fun res!112145 () Bool)

(declare-datatypes ((SeekEntryResult!899 0))(
  ( (MissingZero!899 (index!5766 (_ BitVec 32))) (Found!899 (index!5767 (_ BitVec 32))) (Intermediate!899 (undefined!1711 Bool) (index!5768 (_ BitVec 32)) (x!23295 (_ BitVec 32))) (Undefined!899) (MissingVacant!899 (index!5769 (_ BitVec 32))) )
))
(declare-fun lt!114630 () SeekEntryResult!899)

(assert (=> b!227818 (= res!112145 (= (select (arr!5317 (_keys!6307 thiss!1504)) (index!5769 lt!114630)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147803 () Bool)

(assert (=> b!227818 (=> (not res!112145) (not e!147803))))

(declare-fun b!227819 () Bool)

(declare-fun lt!114628 () Unit!6912)

(assert (=> b!227819 (= e!147806 lt!114628)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!282 (array!11195 array!11193 (_ BitVec 32) (_ BitVec 32) V!7613 V!7613 (_ BitVec 64) Int) Unit!6912)

(assert (=> b!227819 (= lt!114628 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!282 (_keys!6307 thiss!1504) (_values!4236 thiss!1504) (mask!10117 thiss!1504) (extraKeys!3990 thiss!1504) (zeroValue!4094 thiss!1504) (minValue!4094 thiss!1504) key!932 (defaultEntry!4253 thiss!1504)))))

(declare-fun c!37775 () Bool)

(assert (=> b!227819 (= c!37775 (is-MissingZero!899 lt!114630))))

(assert (=> b!227819 e!147800))

(declare-fun b!227820 () Bool)

(assert (=> b!227820 (= e!147803 (not call!21174))))

(declare-fun e!147802 () Bool)

(declare-fun tp_is_empty!5975 () Bool)

(declare-fun e!147798 () Bool)

(declare-fun array_inv!3515 (array!11195) Bool)

(declare-fun array_inv!3516 (array!11193) Bool)

(assert (=> b!227821 (= e!147798 (and tp!21480 tp_is_empty!5975 (array_inv!3515 (_keys!6307 thiss!1504)) (array_inv!3516 (_values!4236 thiss!1504)) e!147802))))

(declare-fun b!227822 () Bool)

(declare-fun e!147807 () Bool)

(assert (=> b!227822 (= e!147807 tp_is_empty!5975)))

(declare-fun b!227823 () Bool)

(declare-fun e!147809 () Unit!6912)

(declare-fun Unit!6915 () Unit!6912)

(assert (=> b!227823 (= e!147809 Unit!6915)))

(declare-fun b!227824 () Bool)

(declare-fun e!147799 () Bool)

(assert (=> b!227824 (= e!147799 (is-Undefined!899 lt!114630))))

(declare-fun b!227825 () Bool)

(declare-fun e!147808 () Bool)

(declare-fun e!147804 () Bool)

(assert (=> b!227825 (= e!147808 (not e!147804))))

(declare-fun res!112143 () Bool)

(assert (=> b!227825 (=> res!112143 e!147804)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227825 (= res!112143 (not (validMask!0 (mask!10117 thiss!1504))))))

(declare-fun lt!114632 () array!11195)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11195 (_ BitVec 32)) Bool)

(assert (=> b!227825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114632 (mask!10117 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!114631 () Unit!6912)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11195 (_ BitVec 32) (_ BitVec 32)) Unit!6912)

(assert (=> b!227825 (= lt!114631 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6307 thiss!1504) index!297 (mask!10117 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11195 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227825 (= (arrayCountValidKeys!0 lt!114632 #b00000000000000000000000000000000 (size!5650 (_keys!6307 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6307 thiss!1504) #b00000000000000000000000000000000 (size!5650 (_keys!6307 thiss!1504)))))))

(declare-fun lt!114635 () Unit!6912)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11195 (_ BitVec 32) (_ BitVec 64)) Unit!6912)

(assert (=> b!227825 (= lt!114635 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6307 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3398 0))(
  ( (Nil!3395) (Cons!3394 (h!4042 (_ BitVec 64)) (t!8357 List!3398)) )
))
(declare-fun arrayNoDuplicates!0 (array!11195 (_ BitVec 32) List!3398) Bool)

(assert (=> b!227825 (arrayNoDuplicates!0 lt!114632 #b00000000000000000000000000000000 Nil!3395)))

(assert (=> b!227825 (= lt!114632 (array!11196 (store (arr!5317 (_keys!6307 thiss!1504)) index!297 key!932) (size!5650 (_keys!6307 thiss!1504))))))

(declare-fun lt!114629 () Unit!6912)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11195 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3398) Unit!6912)

(assert (=> b!227825 (= lt!114629 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6307 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3395))))

(declare-fun lt!114634 () Unit!6912)

(assert (=> b!227825 (= lt!114634 e!147809)))

(declare-fun c!37776 () Bool)

(declare-fun arrayContainsKey!0 (array!11195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227825 (= c!37776 (arrayContainsKey!0 (_keys!6307 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10132 () Bool)

(declare-fun tp!21481 () Bool)

(assert (=> mapNonEmpty!10132 (= mapRes!10132 (and tp!21481 e!147807))))

(declare-fun mapKey!10132 () (_ BitVec 32))

(declare-fun mapRest!10132 () (Array (_ BitVec 32) ValueCell!2644))

(declare-fun mapValue!10132 () ValueCell!2644)

(assert (=> mapNonEmpty!10132 (= (arr!5316 (_values!4236 thiss!1504)) (store mapRest!10132 mapKey!10132 mapValue!10132))))

(declare-fun b!227826 () Bool)

(declare-fun res!112148 () Bool)

(assert (=> b!227826 (=> (not res!112148) (not e!147801))))

(assert (=> b!227826 (= res!112148 (= (select (arr!5317 (_keys!6307 thiss!1504)) (index!5766 lt!114630)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227827 () Bool)

(declare-fun res!112146 () Bool)

(declare-fun e!147797 () Bool)

(assert (=> b!227827 (=> (not res!112146) (not e!147797))))

(assert (=> b!227827 (= res!112146 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227828 () Bool)

(declare-fun e!147796 () Bool)

(assert (=> b!227828 (= e!147802 (and e!147796 mapRes!10132))))

(declare-fun condMapEmpty!10132 () Bool)

(declare-fun mapDefault!10132 () ValueCell!2644)

