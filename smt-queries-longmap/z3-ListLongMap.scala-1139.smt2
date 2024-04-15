; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23568 () Bool)

(assert start!23568)

(declare-fun b!247279 () Bool)

(declare-fun b_free!6583 () Bool)

(declare-fun b_next!6583 () Bool)

(assert (=> b!247279 (= b_free!6583 (not b_next!6583))))

(declare-fun tp!22996 () Bool)

(declare-fun b_and!13559 () Bool)

(assert (=> b!247279 (= tp!22996 b_and!13559)))

(declare-fun b!247272 () Bool)

(declare-fun res!121183 () Bool)

(declare-datatypes ((V!8241 0))(
  ( (V!8242 (val!3267 Int)) )
))
(declare-datatypes ((ValueCell!2879 0))(
  ( (ValueCellFull!2879 (v!5319 V!8241)) (EmptyCell!2879) )
))
(declare-datatypes ((array!12189 0))(
  ( (array!12190 (arr!5781 (Array (_ BitVec 32) ValueCell!2879)) (size!6125 (_ BitVec 32))) )
))
(declare-datatypes ((array!12191 0))(
  ( (array!12192 (arr!5782 (Array (_ BitVec 32) (_ BitVec 64))) (size!6126 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3658 0))(
  ( (LongMapFixedSize!3659 (defaultEntry!4578 Int) (mask!10715 (_ BitVec 32)) (extraKeys!4315 (_ BitVec 32)) (zeroValue!4419 V!8241) (minValue!4419 V!8241) (_size!1878 (_ BitVec 32)) (_keys!6699 array!12191) (_values!4561 array!12189) (_vacant!1878 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3658)

(declare-datatypes ((SeekEntryResult!1099 0))(
  ( (MissingZero!1099 (index!6566 (_ BitVec 32))) (Found!1099 (index!6567 (_ BitVec 32))) (Intermediate!1099 (undefined!1911 Bool) (index!6568 (_ BitVec 32)) (x!24526 (_ BitVec 32))) (Undefined!1099) (MissingVacant!1099 (index!6569 (_ BitVec 32))) )
))
(declare-fun lt!123745 () SeekEntryResult!1099)

(assert (=> b!247272 (= res!121183 (= (select (arr!5782 (_keys!6699 thiss!1504)) (index!6569 lt!123745)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160406 () Bool)

(assert (=> b!247272 (=> (not res!121183) (not e!160406))))

(declare-fun mapIsEmpty!10943 () Bool)

(declare-fun mapRes!10943 () Bool)

(assert (=> mapIsEmpty!10943 mapRes!10943))

(declare-fun b!247273 () Bool)

(declare-fun c!41399 () Bool)

(get-info :version)

(assert (=> b!247273 (= c!41399 ((_ is MissingVacant!1099) lt!123745))))

(declare-fun e!160404 () Bool)

(declare-fun e!160409 () Bool)

(assert (=> b!247273 (= e!160404 e!160409)))

(declare-fun b!247274 () Bool)

(declare-datatypes ((Unit!7635 0))(
  ( (Unit!7636) )
))
(declare-fun e!160398 () Unit!7635)

(declare-fun Unit!7637 () Unit!7635)

(assert (=> b!247274 (= e!160398 Unit!7637)))

(declare-fun b!247275 () Bool)

(assert (=> b!247275 (= e!160409 e!160406)))

(declare-fun res!121181 () Bool)

(declare-fun call!23147 () Bool)

(assert (=> b!247275 (= res!121181 call!23147)))

(assert (=> b!247275 (=> (not res!121181) (not e!160406))))

(declare-fun b!247276 () Bool)

(declare-fun e!160411 () Unit!7635)

(declare-fun lt!123748 () Unit!7635)

(assert (=> b!247276 (= e!160411 lt!123748)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!382 (array!12191 array!12189 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 64) Int) Unit!7635)

(assert (=> b!247276 (= lt!123748 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!382 (_keys!6699 thiss!1504) (_values!4561 thiss!1504) (mask!10715 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) key!932 (defaultEntry!4578 thiss!1504)))))

(declare-fun c!41398 () Bool)

(assert (=> b!247276 (= c!41398 ((_ is MissingZero!1099) lt!123745))))

(assert (=> b!247276 e!160404))

(declare-fun b!247277 () Bool)

(declare-fun res!121185 () Bool)

(declare-fun e!160410 () Bool)

(assert (=> b!247277 (=> (not res!121185) (not e!160410))))

(assert (=> b!247277 (= res!121185 (= (select (arr!5782 (_keys!6699 thiss!1504)) (index!6566 lt!123745)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247278 () Bool)

(declare-fun e!160399 () Bool)

(declare-fun e!160402 () Bool)

(assert (=> b!247278 (= e!160399 (not e!160402))))

(declare-fun res!121184 () Bool)

(assert (=> b!247278 (=> res!121184 e!160402)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247278 (= res!121184 (not (validMask!0 (mask!10715 thiss!1504))))))

(declare-fun lt!123746 () array!12191)

(declare-fun arrayCountValidKeys!0 (array!12191 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247278 (= (arrayCountValidKeys!0 lt!123746 #b00000000000000000000000000000000 (size!6126 (_keys!6699 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6699 thiss!1504) #b00000000000000000000000000000000 (size!6126 (_keys!6699 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!123743 () Unit!7635)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12191 (_ BitVec 32) (_ BitVec 64)) Unit!7635)

(assert (=> b!247278 (= lt!123743 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6699 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3679 0))(
  ( (Nil!3676) (Cons!3675 (h!4333 (_ BitVec 64)) (t!8693 List!3679)) )
))
(declare-fun arrayNoDuplicates!0 (array!12191 (_ BitVec 32) List!3679) Bool)

(assert (=> b!247278 (arrayNoDuplicates!0 lt!123746 #b00000000000000000000000000000000 Nil!3676)))

(assert (=> b!247278 (= lt!123746 (array!12192 (store (arr!5782 (_keys!6699 thiss!1504)) index!297 key!932) (size!6126 (_keys!6699 thiss!1504))))))

(declare-fun lt!123741 () Unit!7635)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12191 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3679) Unit!7635)

(assert (=> b!247278 (= lt!123741 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6699 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3676))))

(declare-fun lt!123749 () Unit!7635)

(assert (=> b!247278 (= lt!123749 e!160398)))

(declare-fun c!41400 () Bool)

(declare-fun lt!123747 () Bool)

(assert (=> b!247278 (= c!41400 lt!123747)))

(declare-fun arrayContainsKey!0 (array!12191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247278 (= lt!123747 (arrayContainsKey!0 (_keys!6699 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun tp_is_empty!6445 () Bool)

(declare-fun e!160397 () Bool)

(declare-fun e!160408 () Bool)

(declare-fun array_inv!3815 (array!12191) Bool)

(declare-fun array_inv!3816 (array!12189) Bool)

(assert (=> b!247279 (= e!160397 (and tp!22996 tp_is_empty!6445 (array_inv!3815 (_keys!6699 thiss!1504)) (array_inv!3816 (_values!4561 thiss!1504)) e!160408))))

(declare-fun b!247280 () Bool)

(assert (=> b!247280 (= e!160409 ((_ is Undefined!1099) lt!123745))))

(declare-fun b!247281 () Bool)

(declare-fun res!121189 () Bool)

(assert (=> b!247281 (=> res!121189 e!160402)))

(assert (=> b!247281 (= res!121189 (or (not (= (size!6126 (_keys!6699 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10715 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6126 (_keys!6699 thiss!1504)))))))

(declare-fun b!247282 () Bool)

(declare-fun res!121182 () Bool)

(declare-fun e!160403 () Bool)

(assert (=> b!247282 (=> (not res!121182) (not e!160403))))

(assert (=> b!247282 (= res!121182 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!23143 () Bool)

(declare-fun call!23146 () Bool)

(assert (=> bm!23143 (= call!23146 (arrayContainsKey!0 (_keys!6699 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247283 () Bool)

(declare-fun res!121190 () Bool)

(assert (=> b!247283 (=> (not res!121190) (not e!160410))))

(assert (=> b!247283 (= res!121190 call!23147)))

(assert (=> b!247283 (= e!160404 e!160410)))

(declare-fun b!247284 () Bool)

(declare-fun e!160401 () Bool)

(assert (=> b!247284 (= e!160408 (and e!160401 mapRes!10943))))

(declare-fun condMapEmpty!10943 () Bool)

(declare-fun mapDefault!10943 () ValueCell!2879)

(assert (=> b!247284 (= condMapEmpty!10943 (= (arr!5781 (_values!4561 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2879)) mapDefault!10943)))))

(declare-fun bm!23144 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23144 (= call!23147 (inRange!0 (ite c!41398 (index!6566 lt!123745) (index!6569 lt!123745)) (mask!10715 thiss!1504)))))

(declare-fun b!247285 () Bool)

(declare-fun e!160405 () Bool)

(assert (=> b!247285 (= e!160405 tp_is_empty!6445)))

(declare-fun b!247286 () Bool)

(declare-fun Unit!7638 () Unit!7635)

(assert (=> b!247286 (= e!160411 Unit!7638)))

(declare-fun lt!123742 () Unit!7635)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!385 (array!12191 array!12189 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 64) Int) Unit!7635)

(assert (=> b!247286 (= lt!123742 (lemmaInListMapThenSeekEntryOrOpenFindsIt!385 (_keys!6699 thiss!1504) (_values!4561 thiss!1504) (mask!10715 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) key!932 (defaultEntry!4578 thiss!1504)))))

(assert (=> b!247286 false))

(declare-fun b!247287 () Bool)

(declare-fun Unit!7639 () Unit!7635)

(assert (=> b!247287 (= e!160398 Unit!7639)))

(declare-fun lt!123740 () Unit!7635)

(declare-fun lemmaArrayContainsKeyThenInListMap!195 (array!12191 array!12189 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 64) (_ BitVec 32) Int) Unit!7635)

(assert (=> b!247287 (= lt!123740 (lemmaArrayContainsKeyThenInListMap!195 (_keys!6699 thiss!1504) (_values!4561 thiss!1504) (mask!10715 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4578 thiss!1504)))))

(assert (=> b!247287 false))

(declare-fun b!247288 () Bool)

(assert (=> b!247288 (= e!160406 (not call!23146))))

(declare-fun b!247289 () Bool)

(assert (=> b!247289 (= e!160410 (not call!23146))))

(declare-fun b!247290 () Bool)

(assert (=> b!247290 (= e!160401 tp_is_empty!6445)))

(declare-fun b!247291 () Bool)

(declare-fun e!160400 () Bool)

(assert (=> b!247291 (= e!160403 e!160400)))

(declare-fun res!121180 () Bool)

(assert (=> b!247291 (=> (not res!121180) (not e!160400))))

(assert (=> b!247291 (= res!121180 (or (= lt!123745 (MissingZero!1099 index!297)) (= lt!123745 (MissingVacant!1099 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12191 (_ BitVec 32)) SeekEntryResult!1099)

(assert (=> b!247291 (= lt!123745 (seekEntryOrOpen!0 key!932 (_keys!6699 thiss!1504) (mask!10715 thiss!1504)))))

(declare-fun b!247292 () Bool)

(declare-fun res!121187 () Bool)

(assert (=> b!247292 (=> res!121187 e!160402)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247292 (= res!121187 (not (validKeyInArray!0 key!932)))))

(declare-fun b!247293 () Bool)

(assert (=> b!247293 (= e!160402 (not lt!123747))))

(declare-fun b!247294 () Bool)

(assert (=> b!247294 (= e!160400 e!160399)))

(declare-fun res!121188 () Bool)

(assert (=> b!247294 (=> (not res!121188) (not e!160399))))

(assert (=> b!247294 (= res!121188 (inRange!0 index!297 (mask!10715 thiss!1504)))))

(declare-fun lt!123744 () Unit!7635)

(assert (=> b!247294 (= lt!123744 e!160411)))

(declare-fun c!41397 () Bool)

(declare-datatypes ((tuple2!4778 0))(
  ( (tuple2!4779 (_1!2400 (_ BitVec 64)) (_2!2400 V!8241)) )
))
(declare-datatypes ((List!3680 0))(
  ( (Nil!3677) (Cons!3676 (h!4334 tuple2!4778) (t!8694 List!3680)) )
))
(declare-datatypes ((ListLongMap!3681 0))(
  ( (ListLongMap!3682 (toList!1856 List!3680)) )
))
(declare-fun contains!1775 (ListLongMap!3681 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1365 (array!12191 array!12189 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 32) Int) ListLongMap!3681)

(assert (=> b!247294 (= c!41397 (contains!1775 (getCurrentListMap!1365 (_keys!6699 thiss!1504) (_values!4561 thiss!1504) (mask!10715 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4578 thiss!1504)) key!932))))

(declare-fun res!121186 () Bool)

(assert (=> start!23568 (=> (not res!121186) (not e!160403))))

(declare-fun valid!1439 (LongMapFixedSize!3658) Bool)

(assert (=> start!23568 (= res!121186 (valid!1439 thiss!1504))))

(assert (=> start!23568 e!160403))

(assert (=> start!23568 e!160397))

(assert (=> start!23568 true))

(declare-fun mapNonEmpty!10943 () Bool)

(declare-fun tp!22997 () Bool)

(assert (=> mapNonEmpty!10943 (= mapRes!10943 (and tp!22997 e!160405))))

(declare-fun mapRest!10943 () (Array (_ BitVec 32) ValueCell!2879))

(declare-fun mapValue!10943 () ValueCell!2879)

(declare-fun mapKey!10943 () (_ BitVec 32))

(assert (=> mapNonEmpty!10943 (= (arr!5781 (_values!4561 thiss!1504)) (store mapRest!10943 mapKey!10943 mapValue!10943))))

(assert (= (and start!23568 res!121186) b!247282))

(assert (= (and b!247282 res!121182) b!247291))

(assert (= (and b!247291 res!121180) b!247294))

(assert (= (and b!247294 c!41397) b!247286))

(assert (= (and b!247294 (not c!41397)) b!247276))

(assert (= (and b!247276 c!41398) b!247283))

(assert (= (and b!247276 (not c!41398)) b!247273))

(assert (= (and b!247283 res!121190) b!247277))

(assert (= (and b!247277 res!121185) b!247289))

(assert (= (and b!247273 c!41399) b!247275))

(assert (= (and b!247273 (not c!41399)) b!247280))

(assert (= (and b!247275 res!121181) b!247272))

(assert (= (and b!247272 res!121183) b!247288))

(assert (= (or b!247283 b!247275) bm!23144))

(assert (= (or b!247289 b!247288) bm!23143))

(assert (= (and b!247294 res!121188) b!247278))

(assert (= (and b!247278 c!41400) b!247287))

(assert (= (and b!247278 (not c!41400)) b!247274))

(assert (= (and b!247278 (not res!121184)) b!247281))

(assert (= (and b!247281 (not res!121189)) b!247292))

(assert (= (and b!247292 (not res!121187)) b!247293))

(assert (= (and b!247284 condMapEmpty!10943) mapIsEmpty!10943))

(assert (= (and b!247284 (not condMapEmpty!10943)) mapNonEmpty!10943))

(assert (= (and mapNonEmpty!10943 ((_ is ValueCellFull!2879) mapValue!10943)) b!247285))

(assert (= (and b!247284 ((_ is ValueCellFull!2879) mapDefault!10943)) b!247290))

(assert (= b!247279 b!247284))

(assert (= start!23568 b!247279))

(declare-fun m!263877 () Bool)

(assert (=> start!23568 m!263877))

(declare-fun m!263879 () Bool)

(assert (=> bm!23143 m!263879))

(declare-fun m!263881 () Bool)

(assert (=> b!247287 m!263881))

(declare-fun m!263883 () Bool)

(assert (=> bm!23144 m!263883))

(declare-fun m!263885 () Bool)

(assert (=> mapNonEmpty!10943 m!263885))

(declare-fun m!263887 () Bool)

(assert (=> b!247291 m!263887))

(declare-fun m!263889 () Bool)

(assert (=> b!247292 m!263889))

(declare-fun m!263891 () Bool)

(assert (=> b!247294 m!263891))

(declare-fun m!263893 () Bool)

(assert (=> b!247294 m!263893))

(assert (=> b!247294 m!263893))

(declare-fun m!263895 () Bool)

(assert (=> b!247294 m!263895))

(declare-fun m!263897 () Bool)

(assert (=> b!247272 m!263897))

(declare-fun m!263899 () Bool)

(assert (=> b!247277 m!263899))

(declare-fun m!263901 () Bool)

(assert (=> b!247279 m!263901))

(declare-fun m!263903 () Bool)

(assert (=> b!247279 m!263903))

(declare-fun m!263905 () Bool)

(assert (=> b!247276 m!263905))

(declare-fun m!263907 () Bool)

(assert (=> b!247286 m!263907))

(declare-fun m!263909 () Bool)

(assert (=> b!247278 m!263909))

(assert (=> b!247278 m!263879))

(declare-fun m!263911 () Bool)

(assert (=> b!247278 m!263911))

(declare-fun m!263913 () Bool)

(assert (=> b!247278 m!263913))

(declare-fun m!263915 () Bool)

(assert (=> b!247278 m!263915))

(declare-fun m!263917 () Bool)

(assert (=> b!247278 m!263917))

(declare-fun m!263919 () Bool)

(assert (=> b!247278 m!263919))

(declare-fun m!263921 () Bool)

(assert (=> b!247278 m!263921))

(check-sat (not b!247292) (not b!247294) (not b!247278) (not b!247286) (not b!247287) (not bm!23143) (not bm!23144) tp_is_empty!6445 (not mapNonEmpty!10943) (not b_next!6583) (not b!247291) (not b!247276) b_and!13559 (not start!23568) (not b!247279))
(check-sat b_and!13559 (not b_next!6583))
