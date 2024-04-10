; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24012 () Bool)

(assert start!24012)

(declare-fun b!251488 () Bool)

(declare-fun b_free!6641 () Bool)

(declare-fun b_next!6641 () Bool)

(assert (=> b!251488 (= b_free!6641 (not b_next!6641))))

(declare-fun tp!23194 () Bool)

(declare-fun b_and!13669 () Bool)

(assert (=> b!251488 (= tp!23194 b_and!13669)))

(declare-fun b!251472 () Bool)

(declare-fun c!42314 () Bool)

(declare-datatypes ((SeekEntryResult!1128 0))(
  ( (MissingZero!1128 (index!6682 (_ BitVec 32))) (Found!1128 (index!6683 (_ BitVec 32))) (Intermediate!1128 (undefined!1940 Bool) (index!6684 (_ BitVec 32)) (x!24722 (_ BitVec 32))) (Undefined!1128) (MissingVacant!1128 (index!6685 (_ BitVec 32))) )
))
(declare-fun lt!126023 () SeekEntryResult!1128)

(assert (=> b!251472 (= c!42314 (is-MissingVacant!1128 lt!126023))))

(declare-fun e!163103 () Bool)

(declare-fun e!163102 () Bool)

(assert (=> b!251472 (= e!163103 e!163102)))

(declare-fun b!251474 () Bool)

(declare-datatypes ((Unit!7786 0))(
  ( (Unit!7787) )
))
(declare-fun e!163096 () Unit!7786)

(declare-fun Unit!7788 () Unit!7786)

(assert (=> b!251474 (= e!163096 Unit!7788)))

(declare-fun lt!126021 () Unit!7786)

(declare-datatypes ((V!8317 0))(
  ( (V!8318 (val!3296 Int)) )
))
(declare-datatypes ((ValueCell!2908 0))(
  ( (ValueCellFull!2908 (v!5364 V!8317)) (EmptyCell!2908) )
))
(declare-datatypes ((array!12327 0))(
  ( (array!12328 (arr!5844 (Array (_ BitVec 32) ValueCell!2908)) (size!6190 (_ BitVec 32))) )
))
(declare-datatypes ((array!12329 0))(
  ( (array!12330 (arr!5845 (Array (_ BitVec 32) (_ BitVec 64))) (size!6191 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3716 0))(
  ( (LongMapFixedSize!3717 (defaultEntry!4647 Int) (mask!10848 (_ BitVec 32)) (extraKeys!4384 (_ BitVec 32)) (zeroValue!4488 V!8317) (minValue!4488 V!8317) (_size!1907 (_ BitVec 32)) (_keys!6789 array!12329) (_values!4630 array!12327) (_vacant!1907 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3716)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!206 (array!12329 array!12327 (_ BitVec 32) (_ BitVec 32) V!8317 V!8317 (_ BitVec 64) (_ BitVec 32) Int) Unit!7786)

(assert (=> b!251474 (= lt!126021 (lemmaArrayContainsKeyThenInListMap!206 (_keys!6789 thiss!1504) (_values!4630 thiss!1504) (mask!10848 thiss!1504) (extraKeys!4384 thiss!1504) (zeroValue!4488 thiss!1504) (minValue!4488 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4647 thiss!1504)))))

(assert (=> b!251474 false))

(declare-fun b!251475 () Bool)

(assert (=> b!251475 (= e!163102 (is-Undefined!1128 lt!126023))))

(declare-fun b!251476 () Bool)

(declare-fun Unit!7789 () Unit!7786)

(assert (=> b!251476 (= e!163096 Unit!7789)))

(declare-fun mapNonEmpty!11054 () Bool)

(declare-fun mapRes!11054 () Bool)

(declare-fun tp!23195 () Bool)

(declare-fun e!163093 () Bool)

(assert (=> mapNonEmpty!11054 (= mapRes!11054 (and tp!23195 e!163093))))

(declare-fun mapValue!11054 () ValueCell!2908)

(declare-fun mapRest!11054 () (Array (_ BitVec 32) ValueCell!2908))

(declare-fun mapKey!11054 () (_ BitVec 32))

(assert (=> mapNonEmpty!11054 (= (arr!5844 (_values!4630 thiss!1504)) (store mapRest!11054 mapKey!11054 mapValue!11054))))

(declare-fun call!23659 () Bool)

(declare-fun c!42317 () Bool)

(declare-fun bm!23655 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23655 (= call!23659 (inRange!0 (ite c!42317 (index!6682 lt!126023) (index!6685 lt!126023)) (mask!10848 thiss!1504)))))

(declare-fun b!251477 () Bool)

(declare-fun e!163098 () Bool)

(assert (=> b!251477 (= e!163098 (or (not (= (size!6190 (_values!4630 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10848 thiss!1504)))) (not (= (size!6191 (_keys!6789 thiss!1504)) (size!6190 (_values!4630 thiss!1504)))) (bvslt (mask!10848 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4384 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4384 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!251478 () Bool)

(declare-fun e!163091 () Bool)

(assert (=> b!251478 (= e!163102 e!163091)))

(declare-fun res!123121 () Bool)

(assert (=> b!251478 (= res!123121 call!23659)))

(assert (=> b!251478 (=> (not res!123121) (not e!163091))))

(declare-fun b!251479 () Bool)

(declare-fun e!163100 () Bool)

(declare-fun call!23658 () Bool)

(assert (=> b!251479 (= e!163100 (not call!23658))))

(declare-fun b!251480 () Bool)

(declare-fun e!163090 () Unit!7786)

(declare-fun lt!126019 () Unit!7786)

(assert (=> b!251480 (= e!163090 lt!126019)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!406 (array!12329 array!12327 (_ BitVec 32) (_ BitVec 32) V!8317 V!8317 (_ BitVec 64) Int) Unit!7786)

(assert (=> b!251480 (= lt!126019 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!406 (_keys!6789 thiss!1504) (_values!4630 thiss!1504) (mask!10848 thiss!1504) (extraKeys!4384 thiss!1504) (zeroValue!4488 thiss!1504) (minValue!4488 thiss!1504) key!932 (defaultEntry!4647 thiss!1504)))))

(assert (=> b!251480 (= c!42317 (is-MissingZero!1128 lt!126023))))

(assert (=> b!251480 e!163103))

(declare-fun b!251481 () Bool)

(declare-fun e!163095 () Bool)

(declare-fun tp_is_empty!6503 () Bool)

(assert (=> b!251481 (= e!163095 tp_is_empty!6503)))

(declare-fun b!251482 () Bool)

(declare-fun e!163099 () Bool)

(declare-fun e!163104 () Bool)

(assert (=> b!251482 (= e!163099 e!163104)))

(declare-fun res!123122 () Bool)

(assert (=> b!251482 (=> (not res!123122) (not e!163104))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!251482 (= res!123122 (or (= lt!126023 (MissingZero!1128 index!297)) (= lt!126023 (MissingVacant!1128 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12329 (_ BitVec 32)) SeekEntryResult!1128)

(assert (=> b!251482 (= lt!126023 (seekEntryOrOpen!0 key!932 (_keys!6789 thiss!1504) (mask!10848 thiss!1504)))))

(declare-fun b!251483 () Bool)

(assert (=> b!251483 (= e!163091 (not call!23658))))

(declare-fun b!251473 () Bool)

(declare-fun res!123124 () Bool)

(assert (=> b!251473 (=> (not res!123124) (not e!163099))))

(assert (=> b!251473 (= res!123124 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!123120 () Bool)

(assert (=> start!24012 (=> (not res!123120) (not e!163099))))

(declare-fun valid!1453 (LongMapFixedSize!3716) Bool)

(assert (=> start!24012 (= res!123120 (valid!1453 thiss!1504))))

(assert (=> start!24012 e!163099))

(declare-fun e!163092 () Bool)

(assert (=> start!24012 e!163092))

(assert (=> start!24012 true))

(declare-fun b!251484 () Bool)

(declare-fun e!163097 () Bool)

(assert (=> b!251484 (= e!163097 (not e!163098))))

(declare-fun res!123125 () Bool)

(assert (=> b!251484 (=> res!123125 e!163098)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!251484 (= res!123125 (not (validMask!0 (mask!10848 thiss!1504))))))

(declare-fun lt!126027 () array!12329)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12329 (_ BitVec 32)) Bool)

(assert (=> b!251484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126027 (mask!10848 thiss!1504))))

(declare-fun lt!126022 () Unit!7786)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12329 (_ BitVec 32) (_ BitVec 32)) Unit!7786)

(assert (=> b!251484 (= lt!126022 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6789 thiss!1504) index!297 (mask!10848 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12329 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251484 (= (arrayCountValidKeys!0 lt!126027 #b00000000000000000000000000000000 (size!6191 (_keys!6789 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6789 thiss!1504) #b00000000000000000000000000000000 (size!6191 (_keys!6789 thiss!1504)))))))

(declare-fun lt!126026 () Unit!7786)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12329 (_ BitVec 32) (_ BitVec 64)) Unit!7786)

(assert (=> b!251484 (= lt!126026 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6789 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3734 0))(
  ( (Nil!3731) (Cons!3730 (h!4391 (_ BitVec 64)) (t!8771 List!3734)) )
))
(declare-fun arrayNoDuplicates!0 (array!12329 (_ BitVec 32) List!3734) Bool)

(assert (=> b!251484 (arrayNoDuplicates!0 lt!126027 #b00000000000000000000000000000000 Nil!3731)))

(assert (=> b!251484 (= lt!126027 (array!12330 (store (arr!5845 (_keys!6789 thiss!1504)) index!297 key!932) (size!6191 (_keys!6789 thiss!1504))))))

(declare-fun lt!126024 () Unit!7786)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12329 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3734) Unit!7786)

(assert (=> b!251484 (= lt!126024 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6789 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3731))))

(declare-fun lt!126025 () Unit!7786)

(assert (=> b!251484 (= lt!126025 e!163096)))

(declare-fun c!42316 () Bool)

(declare-fun arrayContainsKey!0 (array!12329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!251484 (= c!42316 (arrayContainsKey!0 (_keys!6789 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11054 () Bool)

(assert (=> mapIsEmpty!11054 mapRes!11054))

(declare-fun b!251485 () Bool)

(declare-fun res!123119 () Bool)

(assert (=> b!251485 (=> (not res!123119) (not e!163100))))

(assert (=> b!251485 (= res!123119 call!23659)))

(assert (=> b!251485 (= e!163103 e!163100)))

(declare-fun b!251486 () Bool)

(assert (=> b!251486 (= e!163104 e!163097)))

(declare-fun res!123127 () Bool)

(assert (=> b!251486 (=> (not res!123127) (not e!163097))))

(assert (=> b!251486 (= res!123127 (inRange!0 index!297 (mask!10848 thiss!1504)))))

(declare-fun lt!126028 () Unit!7786)

(assert (=> b!251486 (= lt!126028 e!163090)))

(declare-fun c!42315 () Bool)

(declare-datatypes ((tuple2!4854 0))(
  ( (tuple2!4855 (_1!2438 (_ BitVec 64)) (_2!2438 V!8317)) )
))
(declare-datatypes ((List!3735 0))(
  ( (Nil!3732) (Cons!3731 (h!4392 tuple2!4854) (t!8772 List!3735)) )
))
(declare-datatypes ((ListLongMap!3767 0))(
  ( (ListLongMap!3768 (toList!1899 List!3735)) )
))
(declare-fun contains!1823 (ListLongMap!3767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1427 (array!12329 array!12327 (_ BitVec 32) (_ BitVec 32) V!8317 V!8317 (_ BitVec 32) Int) ListLongMap!3767)

(assert (=> b!251486 (= c!42315 (contains!1823 (getCurrentListMap!1427 (_keys!6789 thiss!1504) (_values!4630 thiss!1504) (mask!10848 thiss!1504) (extraKeys!4384 thiss!1504) (zeroValue!4488 thiss!1504) (minValue!4488 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4647 thiss!1504)) key!932))))

(declare-fun b!251487 () Bool)

(declare-fun res!123123 () Bool)

(assert (=> b!251487 (= res!123123 (= (select (arr!5845 (_keys!6789 thiss!1504)) (index!6685 lt!126023)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251487 (=> (not res!123123) (not e!163091))))

(declare-fun e!163101 () Bool)

(declare-fun array_inv!3861 (array!12329) Bool)

(declare-fun array_inv!3862 (array!12327) Bool)

(assert (=> b!251488 (= e!163092 (and tp!23194 tp_is_empty!6503 (array_inv!3861 (_keys!6789 thiss!1504)) (array_inv!3862 (_values!4630 thiss!1504)) e!163101))))

(declare-fun b!251489 () Bool)

(assert (=> b!251489 (= e!163101 (and e!163095 mapRes!11054))))

(declare-fun condMapEmpty!11054 () Bool)

(declare-fun mapDefault!11054 () ValueCell!2908)

