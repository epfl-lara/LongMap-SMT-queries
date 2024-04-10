; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22012 () Bool)

(assert start!22012)

(declare-fun b!226640 () Bool)

(declare-fun b_free!6079 () Bool)

(declare-fun b_next!6079 () Bool)

(assert (=> b!226640 (= b_free!6079 (not b_next!6079))))

(declare-fun tp!21379 () Bool)

(declare-fun b_and!12977 () Bool)

(assert (=> b!226640 (= tp!21379 b_and!12977)))

(declare-fun mapNonEmpty!10081 () Bool)

(declare-fun mapRes!10081 () Bool)

(declare-fun tp!21378 () Bool)

(declare-fun e!147037 () Bool)

(assert (=> mapNonEmpty!10081 (= mapRes!10081 (and tp!21378 e!147037))))

(declare-datatypes ((V!7569 0))(
  ( (V!7570 (val!3015 Int)) )
))
(declare-datatypes ((ValueCell!2627 0))(
  ( (ValueCellFull!2627 (v!5035 V!7569)) (EmptyCell!2627) )
))
(declare-fun mapValue!10081 () ValueCell!2627)

(declare-fun mapKey!10081 () (_ BitVec 32))

(declare-datatypes ((array!11125 0))(
  ( (array!11126 (arr!5282 (Array (_ BitVec 32) ValueCell!2627)) (size!5615 (_ BitVec 32))) )
))
(declare-datatypes ((array!11127 0))(
  ( (array!11128 (arr!5283 (Array (_ BitVec 32) (_ BitVec 64))) (size!5616 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3154 0))(
  ( (LongMapFixedSize!3155 (defaultEntry!4236 Int) (mask!10090 (_ BitVec 32)) (extraKeys!3973 (_ BitVec 32)) (zeroValue!4077 V!7569) (minValue!4077 V!7569) (_size!1626 (_ BitVec 32)) (_keys!6290 array!11127) (_values!4219 array!11125) (_vacant!1626 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3154)

(declare-fun mapRest!10081 () (Array (_ BitVec 32) ValueCell!2627))

(assert (=> mapNonEmpty!10081 (= (arr!5282 (_values!4219 thiss!1504)) (store mapRest!10081 mapKey!10081 mapValue!10081))))

(declare-fun b!226627 () Bool)

(declare-fun res!111575 () Bool)

(declare-fun e!147034 () Bool)

(assert (=> b!226627 (=> res!111575 e!147034)))

(declare-fun lt!114077 () Bool)

(assert (=> b!226627 (= res!111575 lt!114077)))

(declare-fun b!226628 () Bool)

(declare-fun c!37569 () Bool)

(declare-datatypes ((SeekEntryResult!885 0))(
  ( (MissingZero!885 (index!5710 (_ BitVec 32))) (Found!885 (index!5711 (_ BitVec 32))) (Intermediate!885 (undefined!1697 Bool) (index!5712 (_ BitVec 32)) (x!23241 (_ BitVec 32))) (Undefined!885) (MissingVacant!885 (index!5713 (_ BitVec 32))) )
))
(declare-fun lt!114070 () SeekEntryResult!885)

(assert (=> b!226628 (= c!37569 (is-MissingVacant!885 lt!114070))))

(declare-fun e!147044 () Bool)

(declare-fun e!147031 () Bool)

(assert (=> b!226628 (= e!147044 e!147031)))

(declare-fun b!226629 () Bool)

(declare-fun res!111572 () Bool)

(declare-fun e!147032 () Bool)

(assert (=> b!226629 (=> (not res!111572) (not e!147032))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!226629 (= res!111572 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21068 () Bool)

(declare-fun call!21072 () Bool)

(declare-fun arrayContainsKey!0 (array!11127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21068 (= call!21072 (arrayContainsKey!0 (_keys!6290 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226631 () Bool)

(declare-fun res!111569 () Bool)

(assert (=> b!226631 (= res!111569 (= (select (arr!5283 (_keys!6290 thiss!1504)) (index!5713 lt!114070)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147030 () Bool)

(assert (=> b!226631 (=> (not res!111569) (not e!147030))))

(declare-fun b!226632 () Bool)

(declare-datatypes ((Unit!6858 0))(
  ( (Unit!6859) )
))
(declare-fun e!147035 () Unit!6858)

(declare-fun lt!114074 () Unit!6858)

(assert (=> b!226632 (= e!147035 lt!114074)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!271 (array!11127 array!11125 (_ BitVec 32) (_ BitVec 32) V!7569 V!7569 (_ BitVec 64) Int) Unit!6858)

(assert (=> b!226632 (= lt!114074 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!271 (_keys!6290 thiss!1504) (_values!4219 thiss!1504) (mask!10090 thiss!1504) (extraKeys!3973 thiss!1504) (zeroValue!4077 thiss!1504) (minValue!4077 thiss!1504) key!932 (defaultEntry!4236 thiss!1504)))))

(declare-fun c!37570 () Bool)

(assert (=> b!226632 (= c!37570 (is-MissingZero!885 lt!114070))))

(assert (=> b!226632 e!147044))

(declare-fun b!226633 () Bool)

(declare-fun e!147041 () Bool)

(declare-fun tp_is_empty!5941 () Bool)

(assert (=> b!226633 (= e!147041 tp_is_empty!5941)))

(declare-fun b!226634 () Bool)

(declare-fun e!147036 () Unit!6858)

(declare-fun Unit!6860 () Unit!6858)

(assert (=> b!226634 (= e!147036 Unit!6860)))

(declare-fun b!226635 () Bool)

(declare-fun e!147039 () Bool)

(assert (=> b!226635 (= e!147039 (not e!147034))))

(declare-fun res!111577 () Bool)

(assert (=> b!226635 (=> res!111577 e!147034)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226635 (= res!111577 (not (validMask!0 (mask!10090 thiss!1504))))))

(declare-fun lt!114076 () array!11127)

(declare-fun arrayCountValidKeys!0 (array!11127 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226635 (= (arrayCountValidKeys!0 lt!114076 #b00000000000000000000000000000000 (size!5616 (_keys!6290 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6290 thiss!1504) #b00000000000000000000000000000000 (size!5616 (_keys!6290 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!114071 () Unit!6858)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11127 (_ BitVec 32) (_ BitVec 64)) Unit!6858)

(assert (=> b!226635 (= lt!114071 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6290 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3377 0))(
  ( (Nil!3374) (Cons!3373 (h!4021 (_ BitVec 64)) (t!8336 List!3377)) )
))
(declare-fun arrayNoDuplicates!0 (array!11127 (_ BitVec 32) List!3377) Bool)

(assert (=> b!226635 (arrayNoDuplicates!0 lt!114076 #b00000000000000000000000000000000 Nil!3374)))

(assert (=> b!226635 (= lt!114076 (array!11128 (store (arr!5283 (_keys!6290 thiss!1504)) index!297 key!932) (size!5616 (_keys!6290 thiss!1504))))))

(declare-fun lt!114067 () Unit!6858)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11127 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3377) Unit!6858)

(assert (=> b!226635 (= lt!114067 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6290 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3374))))

(declare-fun lt!114072 () Unit!6858)

(assert (=> b!226635 (= lt!114072 e!147036)))

(declare-fun c!37572 () Bool)

(assert (=> b!226635 (= c!37572 lt!114077)))

(assert (=> b!226635 (= lt!114077 (arrayContainsKey!0 (_keys!6290 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226636 () Bool)

(declare-fun e!147033 () Bool)

(assert (=> b!226636 (= e!147033 (and e!147041 mapRes!10081))))

(declare-fun condMapEmpty!10081 () Bool)

(declare-fun mapDefault!10081 () ValueCell!2627)

