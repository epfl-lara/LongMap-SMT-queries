; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17404 () Bool)

(assert start!17404)

(declare-fun b!174690 () Bool)

(declare-fun b_free!4321 () Bool)

(declare-fun b_next!4321 () Bool)

(assert (=> b!174690 (= b_free!4321 (not b_next!4321))))

(declare-fun tp!15634 () Bool)

(declare-fun b_and!10803 () Bool)

(assert (=> b!174690 (= tp!15634 b_and!10803)))

(declare-fun b!174686 () Bool)

(declare-fun res!82845 () Bool)

(declare-fun e!115343 () Bool)

(assert (=> b!174686 (=> (not res!82845) (not e!115343))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5105 0))(
  ( (V!5106 (val!2091 Int)) )
))
(declare-datatypes ((ValueCell!1703 0))(
  ( (ValueCellFull!1703 (v!3964 V!5105)) (EmptyCell!1703) )
))
(declare-datatypes ((array!7307 0))(
  ( (array!7308 (arr!3470 (Array (_ BitVec 32) (_ BitVec 64))) (size!3770 (_ BitVec 32))) )
))
(declare-datatypes ((array!7309 0))(
  ( (array!7310 (arr!3471 (Array (_ BitVec 32) ValueCell!1703)) (size!3771 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2314 0))(
  ( (LongMapFixedSize!2315 (defaultEntry!3608 Int) (mask!8489 (_ BitVec 32)) (extraKeys!3345 (_ BitVec 32)) (zeroValue!3449 V!5105) (minValue!3449 V!5105) (_size!1206 (_ BitVec 32)) (_keys!5452 array!7307) (_values!3591 array!7309) (_vacant!1206 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2314)

(get-info :version)

(declare-datatypes ((SeekEntryResult!538 0))(
  ( (MissingZero!538 (index!4320 (_ BitVec 32))) (Found!538 (index!4321 (_ BitVec 32))) (Intermediate!538 (undefined!1350 Bool) (index!4322 (_ BitVec 32)) (x!19226 (_ BitVec 32))) (Undefined!538) (MissingVacant!538 (index!4323 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7307 (_ BitVec 32)) SeekEntryResult!538)

(assert (=> b!174686 (= res!82845 ((_ is Undefined!538) (seekEntryOrOpen!0 key!828 (_keys!5452 thiss!1248) (mask!8489 thiss!1248))))))

(declare-fun b!174687 () Bool)

(declare-fun res!82844 () Bool)

(assert (=> b!174687 (=> (not res!82844) (not e!115343))))

(declare-datatypes ((tuple2!3210 0))(
  ( (tuple2!3211 (_1!1616 (_ BitVec 64)) (_2!1616 V!5105)) )
))
(declare-datatypes ((List!2194 0))(
  ( (Nil!2191) (Cons!2190 (h!2807 tuple2!3210) (t!7000 List!2194)) )
))
(declare-datatypes ((ListLongMap!2143 0))(
  ( (ListLongMap!2144 (toList!1087 List!2194)) )
))
(declare-fun contains!1154 (ListLongMap!2143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!742 (array!7307 array!7309 (_ BitVec 32) (_ BitVec 32) V!5105 V!5105 (_ BitVec 32) Int) ListLongMap!2143)

(assert (=> b!174687 (= res!82844 (contains!1154 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)) key!828))))

(declare-fun b!174688 () Bool)

(declare-fun res!82848 () Bool)

(assert (=> b!174688 (=> (not res!82848) (not e!115343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!174688 (= res!82848 (validMask!0 (mask!8489 thiss!1248)))))

(declare-fun b!174689 () Bool)

(declare-fun e!115346 () Bool)

(declare-fun tp_is_empty!4093 () Bool)

(assert (=> b!174689 (= e!115346 tp_is_empty!4093)))

(declare-fun res!82846 () Bool)

(assert (=> start!17404 (=> (not res!82846) (not e!115343))))

(declare-fun valid!992 (LongMapFixedSize!2314) Bool)

(assert (=> start!17404 (= res!82846 (valid!992 thiss!1248))))

(assert (=> start!17404 e!115343))

(declare-fun e!115347 () Bool)

(assert (=> start!17404 e!115347))

(assert (=> start!17404 true))

(declare-fun e!115342 () Bool)

(declare-fun array_inv!2235 (array!7307) Bool)

(declare-fun array_inv!2236 (array!7309) Bool)

(assert (=> b!174690 (= e!115347 (and tp!15634 tp_is_empty!4093 (array_inv!2235 (_keys!5452 thiss!1248)) (array_inv!2236 (_values!3591 thiss!1248)) e!115342))))

(declare-fun b!174691 () Bool)

(assert (=> b!174691 (= e!115343 (not (= (size!3771 (_values!3591 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8489 thiss!1248)))))))

(declare-fun mapIsEmpty!6974 () Bool)

(declare-fun mapRes!6974 () Bool)

(assert (=> mapIsEmpty!6974 mapRes!6974))

(declare-fun b!174692 () Bool)

(declare-fun e!115344 () Bool)

(assert (=> b!174692 (= e!115342 (and e!115344 mapRes!6974))))

(declare-fun condMapEmpty!6974 () Bool)

(declare-fun mapDefault!6974 () ValueCell!1703)

(assert (=> b!174692 (= condMapEmpty!6974 (= (arr!3471 (_values!3591 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1703)) mapDefault!6974)))))

(declare-fun b!174693 () Bool)

(assert (=> b!174693 (= e!115344 tp_is_empty!4093)))

(declare-fun mapNonEmpty!6974 () Bool)

(declare-fun tp!15635 () Bool)

(assert (=> mapNonEmpty!6974 (= mapRes!6974 (and tp!15635 e!115346))))

(declare-fun mapValue!6974 () ValueCell!1703)

(declare-fun mapKey!6974 () (_ BitVec 32))

(declare-fun mapRest!6974 () (Array (_ BitVec 32) ValueCell!1703))

(assert (=> mapNonEmpty!6974 (= (arr!3471 (_values!3591 thiss!1248)) (store mapRest!6974 mapKey!6974 mapValue!6974))))

(declare-fun b!174694 () Bool)

(declare-fun res!82847 () Bool)

(assert (=> b!174694 (=> (not res!82847) (not e!115343))))

(assert (=> b!174694 (= res!82847 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!17404 res!82846) b!174694))

(assert (= (and b!174694 res!82847) b!174686))

(assert (= (and b!174686 res!82845) b!174687))

(assert (= (and b!174687 res!82844) b!174688))

(assert (= (and b!174688 res!82848) b!174691))

(assert (= (and b!174692 condMapEmpty!6974) mapIsEmpty!6974))

(assert (= (and b!174692 (not condMapEmpty!6974)) mapNonEmpty!6974))

(assert (= (and mapNonEmpty!6974 ((_ is ValueCellFull!1703) mapValue!6974)) b!174689))

(assert (= (and b!174692 ((_ is ValueCellFull!1703) mapDefault!6974)) b!174693))

(assert (= b!174690 b!174692))

(assert (= start!17404 b!174690))

(declare-fun m!203833 () Bool)

(assert (=> b!174688 m!203833))

(declare-fun m!203835 () Bool)

(assert (=> b!174690 m!203835))

(declare-fun m!203837 () Bool)

(assert (=> b!174690 m!203837))

(declare-fun m!203839 () Bool)

(assert (=> b!174687 m!203839))

(assert (=> b!174687 m!203839))

(declare-fun m!203841 () Bool)

(assert (=> b!174687 m!203841))

(declare-fun m!203843 () Bool)

(assert (=> b!174686 m!203843))

(declare-fun m!203845 () Bool)

(assert (=> start!17404 m!203845))

(declare-fun m!203847 () Bool)

(assert (=> mapNonEmpty!6974 m!203847))

(check-sat (not mapNonEmpty!6974) (not b!174687) tp_is_empty!4093 (not b!174690) (not b_next!4321) (not b!174686) (not start!17404) (not b!174688) b_and!10803)
(check-sat b_and!10803 (not b_next!4321))
(get-model)

(declare-fun d!53367 () Bool)

(declare-fun lt!86472 () SeekEntryResult!538)

(assert (=> d!53367 (and (or ((_ is Undefined!538) lt!86472) (not ((_ is Found!538) lt!86472)) (and (bvsge (index!4321 lt!86472) #b00000000000000000000000000000000) (bvslt (index!4321 lt!86472) (size!3770 (_keys!5452 thiss!1248))))) (or ((_ is Undefined!538) lt!86472) ((_ is Found!538) lt!86472) (not ((_ is MissingZero!538) lt!86472)) (and (bvsge (index!4320 lt!86472) #b00000000000000000000000000000000) (bvslt (index!4320 lt!86472) (size!3770 (_keys!5452 thiss!1248))))) (or ((_ is Undefined!538) lt!86472) ((_ is Found!538) lt!86472) ((_ is MissingZero!538) lt!86472) (not ((_ is MissingVacant!538) lt!86472)) (and (bvsge (index!4323 lt!86472) #b00000000000000000000000000000000) (bvslt (index!4323 lt!86472) (size!3770 (_keys!5452 thiss!1248))))) (or ((_ is Undefined!538) lt!86472) (ite ((_ is Found!538) lt!86472) (= (select (arr!3470 (_keys!5452 thiss!1248)) (index!4321 lt!86472)) key!828) (ite ((_ is MissingZero!538) lt!86472) (= (select (arr!3470 (_keys!5452 thiss!1248)) (index!4320 lt!86472)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!538) lt!86472) (= (select (arr!3470 (_keys!5452 thiss!1248)) (index!4323 lt!86472)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!115392 () SeekEntryResult!538)

(assert (=> d!53367 (= lt!86472 e!115392)))

(declare-fun c!31277 () Bool)

(declare-fun lt!86471 () SeekEntryResult!538)

(assert (=> d!53367 (= c!31277 (and ((_ is Intermediate!538) lt!86471) (undefined!1350 lt!86471)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7307 (_ BitVec 32)) SeekEntryResult!538)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53367 (= lt!86471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8489 thiss!1248)) key!828 (_keys!5452 thiss!1248) (mask!8489 thiss!1248)))))

(assert (=> d!53367 (validMask!0 (mask!8489 thiss!1248))))

(assert (=> d!53367 (= (seekEntryOrOpen!0 key!828 (_keys!5452 thiss!1248) (mask!8489 thiss!1248)) lt!86472)))

(declare-fun b!174761 () Bool)

(declare-fun c!31279 () Bool)

(declare-fun lt!86470 () (_ BitVec 64))

(assert (=> b!174761 (= c!31279 (= lt!86470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115390 () SeekEntryResult!538)

(declare-fun e!115391 () SeekEntryResult!538)

(assert (=> b!174761 (= e!115390 e!115391)))

(declare-fun b!174762 () Bool)

(assert (=> b!174762 (= e!115392 e!115390)))

(assert (=> b!174762 (= lt!86470 (select (arr!3470 (_keys!5452 thiss!1248)) (index!4322 lt!86471)))))

(declare-fun c!31278 () Bool)

(assert (=> b!174762 (= c!31278 (= lt!86470 key!828))))

(declare-fun b!174763 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7307 (_ BitVec 32)) SeekEntryResult!538)

(assert (=> b!174763 (= e!115391 (seekKeyOrZeroReturnVacant!0 (x!19226 lt!86471) (index!4322 lt!86471) (index!4322 lt!86471) key!828 (_keys!5452 thiss!1248) (mask!8489 thiss!1248)))))

(declare-fun b!174764 () Bool)

(assert (=> b!174764 (= e!115391 (MissingZero!538 (index!4322 lt!86471)))))

(declare-fun b!174765 () Bool)

(assert (=> b!174765 (= e!115390 (Found!538 (index!4322 lt!86471)))))

(declare-fun b!174766 () Bool)

(assert (=> b!174766 (= e!115392 Undefined!538)))

(assert (= (and d!53367 c!31277) b!174766))

(assert (= (and d!53367 (not c!31277)) b!174762))

(assert (= (and b!174762 c!31278) b!174765))

(assert (= (and b!174762 (not c!31278)) b!174761))

(assert (= (and b!174761 c!31279) b!174764))

(assert (= (and b!174761 (not c!31279)) b!174763))

(declare-fun m!203881 () Bool)

(assert (=> d!53367 m!203881))

(declare-fun m!203883 () Bool)

(assert (=> d!53367 m!203883))

(assert (=> d!53367 m!203883))

(declare-fun m!203885 () Bool)

(assert (=> d!53367 m!203885))

(declare-fun m!203887 () Bool)

(assert (=> d!53367 m!203887))

(declare-fun m!203889 () Bool)

(assert (=> d!53367 m!203889))

(assert (=> d!53367 m!203833))

(declare-fun m!203891 () Bool)

(assert (=> b!174762 m!203891))

(declare-fun m!203893 () Bool)

(assert (=> b!174763 m!203893))

(assert (=> b!174686 d!53367))

(declare-fun d!53369 () Bool)

(declare-fun e!115397 () Bool)

(assert (=> d!53369 e!115397))

(declare-fun res!82881 () Bool)

(assert (=> d!53369 (=> res!82881 e!115397)))

(declare-fun lt!86484 () Bool)

(assert (=> d!53369 (= res!82881 (not lt!86484))))

(declare-fun lt!86481 () Bool)

(assert (=> d!53369 (= lt!86484 lt!86481)))

(declare-datatypes ((Unit!5369 0))(
  ( (Unit!5370) )
))
(declare-fun lt!86483 () Unit!5369)

(declare-fun e!115398 () Unit!5369)

(assert (=> d!53369 (= lt!86483 e!115398)))

(declare-fun c!31282 () Bool)

(assert (=> d!53369 (= c!31282 lt!86481)))

(declare-fun containsKey!191 (List!2194 (_ BitVec 64)) Bool)

(assert (=> d!53369 (= lt!86481 (containsKey!191 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(assert (=> d!53369 (= (contains!1154 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)) key!828) lt!86484)))

(declare-fun b!174773 () Bool)

(declare-fun lt!86482 () Unit!5369)

(assert (=> b!174773 (= e!115398 lt!86482)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!139 (List!2194 (_ BitVec 64)) Unit!5369)

(assert (=> b!174773 (= lt!86482 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(declare-datatypes ((Option!194 0))(
  ( (Some!193 (v!3967 V!5105)) (None!192) )
))
(declare-fun isDefined!140 (Option!194) Bool)

(declare-fun getValueByKey!188 (List!2194 (_ BitVec 64)) Option!194)

(assert (=> b!174773 (isDefined!140 (getValueByKey!188 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(declare-fun b!174774 () Bool)

(declare-fun Unit!5371 () Unit!5369)

(assert (=> b!174774 (= e!115398 Unit!5371)))

(declare-fun b!174775 () Bool)

(assert (=> b!174775 (= e!115397 (isDefined!140 (getValueByKey!188 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828)))))

(assert (= (and d!53369 c!31282) b!174773))

(assert (= (and d!53369 (not c!31282)) b!174774))

(assert (= (and d!53369 (not res!82881)) b!174775))

(declare-fun m!203895 () Bool)

(assert (=> d!53369 m!203895))

(declare-fun m!203897 () Bool)

(assert (=> b!174773 m!203897))

(declare-fun m!203899 () Bool)

(assert (=> b!174773 m!203899))

(assert (=> b!174773 m!203899))

(declare-fun m!203901 () Bool)

(assert (=> b!174773 m!203901))

(assert (=> b!174775 m!203899))

(assert (=> b!174775 m!203899))

(assert (=> b!174775 m!203901))

(assert (=> b!174687 d!53369))

(declare-fun b!174818 () Bool)

(declare-fun e!115436 () Bool)

(declare-fun call!17696 () Bool)

(assert (=> b!174818 (= e!115436 (not call!17696))))

(declare-fun b!174819 () Bool)

(declare-fun e!115427 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!174819 (= e!115427 (validKeyInArray!0 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174820 () Bool)

(declare-fun e!115431 () Bool)

(declare-fun lt!86530 () ListLongMap!2143)

(declare-fun apply!132 (ListLongMap!2143 (_ BitVec 64)) V!5105)

(assert (=> b!174820 (= e!115431 (= (apply!132 lt!86530 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3449 thiss!1248)))))

(declare-fun bm!17692 () Bool)

(declare-fun call!17700 () ListLongMap!2143)

(declare-fun call!17699 () ListLongMap!2143)

(assert (=> bm!17692 (= call!17700 call!17699)))

(declare-fun b!174821 () Bool)

(declare-fun c!31297 () Bool)

(assert (=> b!174821 (= c!31297 (and (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!115430 () ListLongMap!2143)

(declare-fun e!115428 () ListLongMap!2143)

(assert (=> b!174821 (= e!115430 e!115428)))

(declare-fun b!174822 () Bool)

(declare-fun e!115433 () Bool)

(assert (=> b!174822 (= e!115433 e!115436)))

(declare-fun c!31299 () Bool)

(assert (=> b!174822 (= c!31299 (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!31298 () Bool)

(declare-fun bm!17693 () Bool)

(declare-fun c!31296 () Bool)

(declare-fun call!17697 () ListLongMap!2143)

(declare-fun call!17695 () ListLongMap!2143)

(declare-fun +!249 (ListLongMap!2143 tuple2!3210) ListLongMap!2143)

(assert (=> bm!17693 (= call!17695 (+!249 (ite c!31298 call!17697 (ite c!31296 call!17699 call!17700)) (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(declare-fun b!174823 () Bool)

(declare-fun call!17701 () ListLongMap!2143)

(assert (=> b!174823 (= e!115430 call!17701)))

(declare-fun b!174824 () Bool)

(declare-fun e!115434 () ListLongMap!2143)

(assert (=> b!174824 (= e!115434 (+!249 call!17695 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))

(declare-fun b!174825 () Bool)

(assert (=> b!174825 (= e!115434 e!115430)))

(assert (=> b!174825 (= c!31296 (and (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!174826 () Bool)

(declare-fun e!115432 () Unit!5369)

(declare-fun lt!86550 () Unit!5369)

(assert (=> b!174826 (= e!115432 lt!86550)))

(declare-fun lt!86531 () ListLongMap!2143)

(declare-fun getCurrentListMapNoExtraKeys!163 (array!7307 array!7309 (_ BitVec 32) (_ BitVec 32) V!5105 V!5105 (_ BitVec 32) Int) ListLongMap!2143)

(assert (=> b!174826 (= lt!86531 (getCurrentListMapNoExtraKeys!163 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))

(declare-fun lt!86529 () (_ BitVec 64))

(assert (=> b!174826 (= lt!86529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86536 () (_ BitVec 64))

(assert (=> b!174826 (= lt!86536 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86534 () Unit!5369)

(declare-fun addStillContains!108 (ListLongMap!2143 (_ BitVec 64) V!5105 (_ BitVec 64)) Unit!5369)

(assert (=> b!174826 (= lt!86534 (addStillContains!108 lt!86531 lt!86529 (zeroValue!3449 thiss!1248) lt!86536))))

(assert (=> b!174826 (contains!1154 (+!249 lt!86531 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248))) lt!86536)))

(declare-fun lt!86546 () Unit!5369)

(assert (=> b!174826 (= lt!86546 lt!86534)))

(declare-fun lt!86544 () ListLongMap!2143)

(assert (=> b!174826 (= lt!86544 (getCurrentListMapNoExtraKeys!163 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))

(declare-fun lt!86542 () (_ BitVec 64))

(assert (=> b!174826 (= lt!86542 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86549 () (_ BitVec 64))

(assert (=> b!174826 (= lt!86549 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86547 () Unit!5369)

(declare-fun addApplyDifferent!108 (ListLongMap!2143 (_ BitVec 64) V!5105 (_ BitVec 64)) Unit!5369)

(assert (=> b!174826 (= lt!86547 (addApplyDifferent!108 lt!86544 lt!86542 (minValue!3449 thiss!1248) lt!86549))))

(assert (=> b!174826 (= (apply!132 (+!249 lt!86544 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248))) lt!86549) (apply!132 lt!86544 lt!86549))))

(declare-fun lt!86535 () Unit!5369)

(assert (=> b!174826 (= lt!86535 lt!86547)))

(declare-fun lt!86540 () ListLongMap!2143)

(assert (=> b!174826 (= lt!86540 (getCurrentListMapNoExtraKeys!163 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))

(declare-fun lt!86538 () (_ BitVec 64))

(assert (=> b!174826 (= lt!86538 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86543 () (_ BitVec 64))

(assert (=> b!174826 (= lt!86543 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86539 () Unit!5369)

(assert (=> b!174826 (= lt!86539 (addApplyDifferent!108 lt!86540 lt!86538 (zeroValue!3449 thiss!1248) lt!86543))))

(assert (=> b!174826 (= (apply!132 (+!249 lt!86540 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248))) lt!86543) (apply!132 lt!86540 lt!86543))))

(declare-fun lt!86532 () Unit!5369)

(assert (=> b!174826 (= lt!86532 lt!86539)))

(declare-fun lt!86548 () ListLongMap!2143)

(assert (=> b!174826 (= lt!86548 (getCurrentListMapNoExtraKeys!163 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))

(declare-fun lt!86533 () (_ BitVec 64))

(assert (=> b!174826 (= lt!86533 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86545 () (_ BitVec 64))

(assert (=> b!174826 (= lt!86545 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174826 (= lt!86550 (addApplyDifferent!108 lt!86548 lt!86533 (minValue!3449 thiss!1248) lt!86545))))

(assert (=> b!174826 (= (apply!132 (+!249 lt!86548 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248))) lt!86545) (apply!132 lt!86548 lt!86545))))

(declare-fun b!174827 () Bool)

(declare-fun e!115426 () Bool)

(declare-fun call!17698 () Bool)

(assert (=> b!174827 (= e!115426 (not call!17698))))

(declare-fun b!174828 () Bool)

(declare-fun Unit!5372 () Unit!5369)

(assert (=> b!174828 (= e!115432 Unit!5372)))

(declare-fun b!174829 () Bool)

(declare-fun e!115429 () Bool)

(assert (=> b!174829 (= e!115429 (= (apply!132 lt!86530 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3449 thiss!1248)))))

(declare-fun bm!17694 () Bool)

(assert (=> bm!17694 (= call!17697 (getCurrentListMapNoExtraKeys!163 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))

(declare-fun d!53371 () Bool)

(assert (=> d!53371 e!115433))

(declare-fun res!82905 () Bool)

(assert (=> d!53371 (=> (not res!82905) (not e!115433))))

(assert (=> d!53371 (= res!82905 (or (bvsge #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))))

(declare-fun lt!86537 () ListLongMap!2143)

(assert (=> d!53371 (= lt!86530 lt!86537)))

(declare-fun lt!86541 () Unit!5369)

(assert (=> d!53371 (= lt!86541 e!115432)))

(declare-fun c!31300 () Bool)

(declare-fun e!115425 () Bool)

(assert (=> d!53371 (= c!31300 e!115425)))

(declare-fun res!82904 () Bool)

(assert (=> d!53371 (=> (not res!82904) (not e!115425))))

(assert (=> d!53371 (= res!82904 (bvslt #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(assert (=> d!53371 (= lt!86537 e!115434)))

(assert (=> d!53371 (= c!31298 (and (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53371 (validMask!0 (mask!8489 thiss!1248))))

(assert (=> d!53371 (= (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)) lt!86530)))

(declare-fun b!174830 () Bool)

(declare-fun res!82906 () Bool)

(assert (=> b!174830 (=> (not res!82906) (not e!115433))))

(declare-fun e!115437 () Bool)

(assert (=> b!174830 (= res!82906 e!115437)))

(declare-fun res!82907 () Bool)

(assert (=> b!174830 (=> res!82907 e!115437)))

(assert (=> b!174830 (= res!82907 (not e!115427))))

(declare-fun res!82902 () Bool)

(assert (=> b!174830 (=> (not res!82902) (not e!115427))))

(assert (=> b!174830 (= res!82902 (bvslt #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(declare-fun b!174831 () Bool)

(assert (=> b!174831 (= e!115425 (validKeyInArray!0 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174832 () Bool)

(assert (=> b!174832 (= e!115428 call!17700)))

(declare-fun b!174833 () Bool)

(assert (=> b!174833 (= e!115426 e!115429)))

(declare-fun res!82903 () Bool)

(assert (=> b!174833 (= res!82903 call!17698)))

(assert (=> b!174833 (=> (not res!82903) (not e!115429))))

(declare-fun bm!17695 () Bool)

(assert (=> bm!17695 (= call!17701 call!17695)))

(declare-fun b!174834 () Bool)

(assert (=> b!174834 (= e!115428 call!17701)))

(declare-fun b!174835 () Bool)

(declare-fun e!115435 () Bool)

(declare-fun get!1983 (ValueCell!1703 V!5105) V!5105)

(declare-fun dynLambda!475 (Int (_ BitVec 64)) V!5105)

(assert (=> b!174835 (= e!115435 (= (apply!132 lt!86530 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)) (get!1983 (select (arr!3471 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!174835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3771 (_values!3591 thiss!1248))))))

(assert (=> b!174835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(declare-fun bm!17696 () Bool)

(assert (=> bm!17696 (= call!17698 (contains!1154 lt!86530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17697 () Bool)

(assert (=> bm!17697 (= call!17699 call!17697)))

(declare-fun b!174836 () Bool)

(assert (=> b!174836 (= e!115437 e!115435)))

(declare-fun res!82900 () Bool)

(assert (=> b!174836 (=> (not res!82900) (not e!115435))))

(assert (=> b!174836 (= res!82900 (contains!1154 lt!86530 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174836 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(declare-fun b!174837 () Bool)

(assert (=> b!174837 (= e!115436 e!115431)))

(declare-fun res!82908 () Bool)

(assert (=> b!174837 (= res!82908 call!17696)))

(assert (=> b!174837 (=> (not res!82908) (not e!115431))))

(declare-fun bm!17698 () Bool)

(assert (=> bm!17698 (= call!17696 (contains!1154 lt!86530 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174838 () Bool)

(declare-fun res!82901 () Bool)

(assert (=> b!174838 (=> (not res!82901) (not e!115433))))

(assert (=> b!174838 (= res!82901 e!115426)))

(declare-fun c!31295 () Bool)

(assert (=> b!174838 (= c!31295 (not (= (bvand (extraKeys!3345 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!53371 c!31298) b!174824))

(assert (= (and d!53371 (not c!31298)) b!174825))

(assert (= (and b!174825 c!31296) b!174823))

(assert (= (and b!174825 (not c!31296)) b!174821))

(assert (= (and b!174821 c!31297) b!174834))

(assert (= (and b!174821 (not c!31297)) b!174832))

(assert (= (or b!174834 b!174832) bm!17692))

(assert (= (or b!174823 bm!17692) bm!17697))

(assert (= (or b!174823 b!174834) bm!17695))

(assert (= (or b!174824 bm!17697) bm!17694))

(assert (= (or b!174824 bm!17695) bm!17693))

(assert (= (and d!53371 res!82904) b!174831))

(assert (= (and d!53371 c!31300) b!174826))

(assert (= (and d!53371 (not c!31300)) b!174828))

(assert (= (and d!53371 res!82905) b!174830))

(assert (= (and b!174830 res!82902) b!174819))

(assert (= (and b!174830 (not res!82907)) b!174836))

(assert (= (and b!174836 res!82900) b!174835))

(assert (= (and b!174830 res!82906) b!174838))

(assert (= (and b!174838 c!31295) b!174833))

(assert (= (and b!174838 (not c!31295)) b!174827))

(assert (= (and b!174833 res!82903) b!174829))

(assert (= (or b!174833 b!174827) bm!17696))

(assert (= (and b!174838 res!82901) b!174822))

(assert (= (and b!174822 c!31299) b!174837))

(assert (= (and b!174822 (not c!31299)) b!174818))

(assert (= (and b!174837 res!82908) b!174820))

(assert (= (or b!174837 b!174818) bm!17698))

(declare-fun b_lambda!7009 () Bool)

(assert (=> (not b_lambda!7009) (not b!174835)))

(declare-fun t!7003 () Bool)

(declare-fun tb!2767 () Bool)

(assert (=> (and b!174690 (= (defaultEntry!3608 thiss!1248) (defaultEntry!3608 thiss!1248)) t!7003) tb!2767))

(declare-fun result!4591 () Bool)

(assert (=> tb!2767 (= result!4591 tp_is_empty!4093)))

(assert (=> b!174835 t!7003))

(declare-fun b_and!10809 () Bool)

(assert (= b_and!10803 (and (=> t!7003 result!4591) b_and!10809)))

(declare-fun m!203903 () Bool)

(assert (=> bm!17693 m!203903))

(declare-fun m!203905 () Bool)

(assert (=> b!174824 m!203905))

(declare-fun m!203907 () Bool)

(assert (=> b!174826 m!203907))

(declare-fun m!203909 () Bool)

(assert (=> b!174826 m!203909))

(declare-fun m!203911 () Bool)

(assert (=> b!174826 m!203911))

(declare-fun m!203913 () Bool)

(assert (=> b!174826 m!203913))

(declare-fun m!203915 () Bool)

(assert (=> b!174826 m!203915))

(declare-fun m!203917 () Bool)

(assert (=> b!174826 m!203917))

(declare-fun m!203919 () Bool)

(assert (=> b!174826 m!203919))

(declare-fun m!203921 () Bool)

(assert (=> b!174826 m!203921))

(declare-fun m!203923 () Bool)

(assert (=> b!174826 m!203923))

(assert (=> b!174826 m!203921))

(declare-fun m!203925 () Bool)

(assert (=> b!174826 m!203925))

(declare-fun m!203927 () Bool)

(assert (=> b!174826 m!203927))

(declare-fun m!203929 () Bool)

(assert (=> b!174826 m!203929))

(assert (=> b!174826 m!203915))

(assert (=> b!174826 m!203927))

(declare-fun m!203931 () Bool)

(assert (=> b!174826 m!203931))

(declare-fun m!203933 () Bool)

(assert (=> b!174826 m!203933))

(assert (=> b!174826 m!203931))

(declare-fun m!203935 () Bool)

(assert (=> b!174826 m!203935))

(declare-fun m!203937 () Bool)

(assert (=> b!174826 m!203937))

(declare-fun m!203939 () Bool)

(assert (=> b!174826 m!203939))

(assert (=> b!174836 m!203925))

(assert (=> b!174836 m!203925))

(declare-fun m!203941 () Bool)

(assert (=> b!174836 m!203941))

(declare-fun m!203943 () Bool)

(assert (=> bm!17696 m!203943))

(assert (=> b!174831 m!203925))

(assert (=> b!174831 m!203925))

(declare-fun m!203945 () Bool)

(assert (=> b!174831 m!203945))

(declare-fun m!203947 () Bool)

(assert (=> b!174835 m!203947))

(assert (=> b!174835 m!203947))

(declare-fun m!203949 () Bool)

(assert (=> b!174835 m!203949))

(declare-fun m!203951 () Bool)

(assert (=> b!174835 m!203951))

(assert (=> b!174835 m!203949))

(assert (=> b!174835 m!203925))

(assert (=> b!174835 m!203925))

(declare-fun m!203953 () Bool)

(assert (=> b!174835 m!203953))

(declare-fun m!203955 () Bool)

(assert (=> b!174820 m!203955))

(declare-fun m!203957 () Bool)

(assert (=> b!174829 m!203957))

(declare-fun m!203959 () Bool)

(assert (=> bm!17698 m!203959))

(assert (=> bm!17694 m!203939))

(assert (=> d!53371 m!203833))

(assert (=> b!174819 m!203925))

(assert (=> b!174819 m!203925))

(assert (=> b!174819 m!203945))

(assert (=> b!174687 d!53371))

(declare-fun d!53373 () Bool)

(assert (=> d!53373 (= (validMask!0 (mask!8489 thiss!1248)) (and (or (= (mask!8489 thiss!1248) #b00000000000000000000000000000111) (= (mask!8489 thiss!1248) #b00000000000000000000000000001111) (= (mask!8489 thiss!1248) #b00000000000000000000000000011111) (= (mask!8489 thiss!1248) #b00000000000000000000000000111111) (= (mask!8489 thiss!1248) #b00000000000000000000000001111111) (= (mask!8489 thiss!1248) #b00000000000000000000000011111111) (= (mask!8489 thiss!1248) #b00000000000000000000000111111111) (= (mask!8489 thiss!1248) #b00000000000000000000001111111111) (= (mask!8489 thiss!1248) #b00000000000000000000011111111111) (= (mask!8489 thiss!1248) #b00000000000000000000111111111111) (= (mask!8489 thiss!1248) #b00000000000000000001111111111111) (= (mask!8489 thiss!1248) #b00000000000000000011111111111111) (= (mask!8489 thiss!1248) #b00000000000000000111111111111111) (= (mask!8489 thiss!1248) #b00000000000000001111111111111111) (= (mask!8489 thiss!1248) #b00000000000000011111111111111111) (= (mask!8489 thiss!1248) #b00000000000000111111111111111111) (= (mask!8489 thiss!1248) #b00000000000001111111111111111111) (= (mask!8489 thiss!1248) #b00000000000011111111111111111111) (= (mask!8489 thiss!1248) #b00000000000111111111111111111111) (= (mask!8489 thiss!1248) #b00000000001111111111111111111111) (= (mask!8489 thiss!1248) #b00000000011111111111111111111111) (= (mask!8489 thiss!1248) #b00000000111111111111111111111111) (= (mask!8489 thiss!1248) #b00000001111111111111111111111111) (= (mask!8489 thiss!1248) #b00000011111111111111111111111111) (= (mask!8489 thiss!1248) #b00000111111111111111111111111111) (= (mask!8489 thiss!1248) #b00001111111111111111111111111111) (= (mask!8489 thiss!1248) #b00011111111111111111111111111111) (= (mask!8489 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8489 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!174688 d!53373))

(declare-fun d!53375 () Bool)

(declare-fun res!82915 () Bool)

(declare-fun e!115440 () Bool)

(assert (=> d!53375 (=> (not res!82915) (not e!115440))))

(declare-fun simpleValid!146 (LongMapFixedSize!2314) Bool)

(assert (=> d!53375 (= res!82915 (simpleValid!146 thiss!1248))))

(assert (=> d!53375 (= (valid!992 thiss!1248) e!115440)))

(declare-fun b!174847 () Bool)

(declare-fun res!82916 () Bool)

(assert (=> b!174847 (=> (not res!82916) (not e!115440))))

(declare-fun arrayCountValidKeys!0 (array!7307 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!174847 (= res!82916 (= (arrayCountValidKeys!0 (_keys!5452 thiss!1248) #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))) (_size!1206 thiss!1248)))))

(declare-fun b!174848 () Bool)

(declare-fun res!82917 () Bool)

(assert (=> b!174848 (=> (not res!82917) (not e!115440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7307 (_ BitVec 32)) Bool)

(assert (=> b!174848 (= res!82917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5452 thiss!1248) (mask!8489 thiss!1248)))))

(declare-fun b!174849 () Bool)

(declare-datatypes ((List!2196 0))(
  ( (Nil!2193) (Cons!2192 (h!2809 (_ BitVec 64)) (t!7004 List!2196)) )
))
(declare-fun arrayNoDuplicates!0 (array!7307 (_ BitVec 32) List!2196) Bool)

(assert (=> b!174849 (= e!115440 (arrayNoDuplicates!0 (_keys!5452 thiss!1248) #b00000000000000000000000000000000 Nil!2193))))

(assert (= (and d!53375 res!82915) b!174847))

(assert (= (and b!174847 res!82916) b!174848))

(assert (= (and b!174848 res!82917) b!174849))

(declare-fun m!203961 () Bool)

(assert (=> d!53375 m!203961))

(declare-fun m!203963 () Bool)

(assert (=> b!174847 m!203963))

(declare-fun m!203965 () Bool)

(assert (=> b!174848 m!203965))

(declare-fun m!203967 () Bool)

(assert (=> b!174849 m!203967))

(assert (=> start!17404 d!53375))

(declare-fun d!53377 () Bool)

(assert (=> d!53377 (= (array_inv!2235 (_keys!5452 thiss!1248)) (bvsge (size!3770 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174690 d!53377))

(declare-fun d!53379 () Bool)

(assert (=> d!53379 (= (array_inv!2236 (_values!3591 thiss!1248)) (bvsge (size!3771 (_values!3591 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174690 d!53379))

(declare-fun condMapEmpty!6983 () Bool)

(declare-fun mapDefault!6983 () ValueCell!1703)

(assert (=> mapNonEmpty!6974 (= condMapEmpty!6983 (= mapRest!6974 ((as const (Array (_ BitVec 32) ValueCell!1703)) mapDefault!6983)))))

(declare-fun e!115446 () Bool)

(declare-fun mapRes!6983 () Bool)

(assert (=> mapNonEmpty!6974 (= tp!15635 (and e!115446 mapRes!6983))))

(declare-fun b!174857 () Bool)

(assert (=> b!174857 (= e!115446 tp_is_empty!4093)))

(declare-fun mapIsEmpty!6983 () Bool)

(assert (=> mapIsEmpty!6983 mapRes!6983))

(declare-fun b!174856 () Bool)

(declare-fun e!115445 () Bool)

(assert (=> b!174856 (= e!115445 tp_is_empty!4093)))

(declare-fun mapNonEmpty!6983 () Bool)

(declare-fun tp!15650 () Bool)

(assert (=> mapNonEmpty!6983 (= mapRes!6983 (and tp!15650 e!115445))))

(declare-fun mapValue!6983 () ValueCell!1703)

(declare-fun mapRest!6983 () (Array (_ BitVec 32) ValueCell!1703))

(declare-fun mapKey!6983 () (_ BitVec 32))

(assert (=> mapNonEmpty!6983 (= mapRest!6974 (store mapRest!6983 mapKey!6983 mapValue!6983))))

(assert (= (and mapNonEmpty!6974 condMapEmpty!6983) mapIsEmpty!6983))

(assert (= (and mapNonEmpty!6974 (not condMapEmpty!6983)) mapNonEmpty!6983))

(assert (= (and mapNonEmpty!6983 ((_ is ValueCellFull!1703) mapValue!6983)) b!174856))

(assert (= (and mapNonEmpty!6974 ((_ is ValueCellFull!1703) mapDefault!6983)) b!174857))

(declare-fun m!203969 () Bool)

(assert (=> mapNonEmpty!6983 m!203969))

(declare-fun b_lambda!7011 () Bool)

(assert (= b_lambda!7009 (or (and b!174690 b_free!4321) b_lambda!7011)))

(check-sat (not b!174826) (not b!174820) (not b!174848) (not b!174831) (not d!53371) (not mapNonEmpty!6983) (not b!174819) (not d!53375) (not d!53369) (not b!174836) (not bm!17696) (not bm!17698) (not b_lambda!7011) b_and!10809 (not b!174775) (not b!174847) tp_is_empty!4093 (not bm!17694) (not d!53367) (not b!174835) (not bm!17693) (not b!174849) (not b!174824) (not b!174763) (not b!174829) (not b_next!4321) (not b!174773))
(check-sat b_and!10809 (not b_next!4321))
(get-model)

(declare-fun d!53381 () Bool)

(assert (=> d!53381 (= (validKeyInArray!0 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!174819 d!53381))

(declare-fun d!53383 () Bool)

(declare-fun res!82929 () Bool)

(declare-fun e!115449 () Bool)

(assert (=> d!53383 (=> (not res!82929) (not e!115449))))

(assert (=> d!53383 (= res!82929 (validMask!0 (mask!8489 thiss!1248)))))

(assert (=> d!53383 (= (simpleValid!146 thiss!1248) e!115449)))

(declare-fun b!174867 () Bool)

(declare-fun res!82928 () Bool)

(assert (=> b!174867 (=> (not res!82928) (not e!115449))))

(declare-fun size!3776 (LongMapFixedSize!2314) (_ BitVec 32))

(assert (=> b!174867 (= res!82928 (bvsge (size!3776 thiss!1248) (_size!1206 thiss!1248)))))

(declare-fun b!174868 () Bool)

(declare-fun res!82926 () Bool)

(assert (=> b!174868 (=> (not res!82926) (not e!115449))))

(assert (=> b!174868 (= res!82926 (= (size!3776 thiss!1248) (bvadd (_size!1206 thiss!1248) (bvsdiv (bvadd (extraKeys!3345 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!174869 () Bool)

(assert (=> b!174869 (= e!115449 (and (bvsge (extraKeys!3345 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3345 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1206 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!174866 () Bool)

(declare-fun res!82927 () Bool)

(assert (=> b!174866 (=> (not res!82927) (not e!115449))))

(assert (=> b!174866 (= res!82927 (and (= (size!3771 (_values!3591 thiss!1248)) (bvadd (mask!8489 thiss!1248) #b00000000000000000000000000000001)) (= (size!3770 (_keys!5452 thiss!1248)) (size!3771 (_values!3591 thiss!1248))) (bvsge (_size!1206 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1206 thiss!1248) (bvadd (mask!8489 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!53383 res!82929) b!174866))

(assert (= (and b!174866 res!82927) b!174867))

(assert (= (and b!174867 res!82928) b!174868))

(assert (= (and b!174868 res!82926) b!174869))

(assert (=> d!53383 m!203833))

(declare-fun m!203971 () Bool)

(assert (=> b!174867 m!203971))

(assert (=> b!174868 m!203971))

(assert (=> d!53375 d!53383))

(declare-fun d!53385 () Bool)

(declare-fun lt!86553 () (_ BitVec 32))

(assert (=> d!53385 (and (bvsge lt!86553 #b00000000000000000000000000000000) (bvsle lt!86553 (bvsub (size!3770 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115454 () (_ BitVec 32))

(assert (=> d!53385 (= lt!86553 e!115454)))

(declare-fun c!31306 () Bool)

(assert (=> d!53385 (= c!31306 (bvsge #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(assert (=> d!53385 (and (bvsle #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3770 (_keys!5452 thiss!1248)) (size!3770 (_keys!5452 thiss!1248))))))

(assert (=> d!53385 (= (arrayCountValidKeys!0 (_keys!5452 thiss!1248) #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))) lt!86553)))

(declare-fun b!174878 () Bool)

(declare-fun e!115455 () (_ BitVec 32))

(assert (=> b!174878 (= e!115454 e!115455)))

(declare-fun c!31305 () Bool)

(assert (=> b!174878 (= c!31305 (validKeyInArray!0 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174879 () Bool)

(assert (=> b!174879 (= e!115454 #b00000000000000000000000000000000)))

(declare-fun b!174880 () Bool)

(declare-fun call!17704 () (_ BitVec 32))

(assert (=> b!174880 (= e!115455 (bvadd #b00000000000000000000000000000001 call!17704))))

(declare-fun bm!17701 () Bool)

(assert (=> bm!17701 (= call!17704 (arrayCountValidKeys!0 (_keys!5452 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3770 (_keys!5452 thiss!1248))))))

(declare-fun b!174881 () Bool)

(assert (=> b!174881 (= e!115455 call!17704)))

(assert (= (and d!53385 c!31306) b!174879))

(assert (= (and d!53385 (not c!31306)) b!174878))

(assert (= (and b!174878 c!31305) b!174880))

(assert (= (and b!174878 (not c!31305)) b!174881))

(assert (= (or b!174880 b!174881) bm!17701))

(assert (=> b!174878 m!203925))

(assert (=> b!174878 m!203925))

(assert (=> b!174878 m!203945))

(declare-fun m!203973 () Bool)

(assert (=> bm!17701 m!203973))

(assert (=> b!174847 d!53385))

(declare-fun d!53387 () Bool)

(declare-fun get!1984 (Option!194) V!5105)

(assert (=> d!53387 (= (apply!132 lt!86530 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1984 (getValueByKey!188 (toList!1087 lt!86530) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7235 () Bool)

(assert (= bs!7235 d!53387))

(declare-fun m!203975 () Bool)

(assert (=> bs!7235 m!203975))

(assert (=> bs!7235 m!203975))

(declare-fun m!203977 () Bool)

(assert (=> bs!7235 m!203977))

(assert (=> b!174820 d!53387))

(declare-fun d!53389 () Bool)

(assert (=> d!53389 (= (apply!132 lt!86530 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1984 (getValueByKey!188 (toList!1087 lt!86530) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7236 () Bool)

(assert (= bs!7236 d!53389))

(declare-fun m!203979 () Bool)

(assert (=> bs!7236 m!203979))

(assert (=> bs!7236 m!203979))

(declare-fun m!203981 () Bool)

(assert (=> bs!7236 m!203981))

(assert (=> b!174829 d!53389))

(declare-fun d!53391 () Bool)

(declare-fun e!115456 () Bool)

(assert (=> d!53391 e!115456))

(declare-fun res!82930 () Bool)

(assert (=> d!53391 (=> res!82930 e!115456)))

(declare-fun lt!86557 () Bool)

(assert (=> d!53391 (= res!82930 (not lt!86557))))

(declare-fun lt!86554 () Bool)

(assert (=> d!53391 (= lt!86557 lt!86554)))

(declare-fun lt!86556 () Unit!5369)

(declare-fun e!115457 () Unit!5369)

(assert (=> d!53391 (= lt!86556 e!115457)))

(declare-fun c!31307 () Bool)

(assert (=> d!53391 (= c!31307 lt!86554)))

(assert (=> d!53391 (= lt!86554 (containsKey!191 (toList!1087 lt!86530) (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53391 (= (contains!1154 lt!86530 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)) lt!86557)))

(declare-fun b!174882 () Bool)

(declare-fun lt!86555 () Unit!5369)

(assert (=> b!174882 (= e!115457 lt!86555)))

(assert (=> b!174882 (= lt!86555 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1087 lt!86530) (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174882 (isDefined!140 (getValueByKey!188 (toList!1087 lt!86530) (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174883 () Bool)

(declare-fun Unit!5373 () Unit!5369)

(assert (=> b!174883 (= e!115457 Unit!5373)))

(declare-fun b!174884 () Bool)

(assert (=> b!174884 (= e!115456 (isDefined!140 (getValueByKey!188 (toList!1087 lt!86530) (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53391 c!31307) b!174882))

(assert (= (and d!53391 (not c!31307)) b!174883))

(assert (= (and d!53391 (not res!82930)) b!174884))

(assert (=> d!53391 m!203925))

(declare-fun m!203983 () Bool)

(assert (=> d!53391 m!203983))

(assert (=> b!174882 m!203925))

(declare-fun m!203985 () Bool)

(assert (=> b!174882 m!203985))

(assert (=> b!174882 m!203925))

(declare-fun m!203987 () Bool)

(assert (=> b!174882 m!203987))

(assert (=> b!174882 m!203987))

(declare-fun m!203989 () Bool)

(assert (=> b!174882 m!203989))

(assert (=> b!174884 m!203925))

(assert (=> b!174884 m!203987))

(assert (=> b!174884 m!203987))

(assert (=> b!174884 m!203989))

(assert (=> b!174836 d!53391))

(declare-fun b!174893 () Bool)

(declare-fun e!115466 () Bool)

(declare-fun e!115465 () Bool)

(assert (=> b!174893 (= e!115466 e!115465)))

(declare-fun c!31310 () Bool)

(assert (=> b!174893 (= c!31310 (validKeyInArray!0 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174894 () Bool)

(declare-fun e!115464 () Bool)

(assert (=> b!174894 (= e!115465 e!115464)))

(declare-fun lt!86566 () (_ BitVec 64))

(assert (=> b!174894 (= lt!86566 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86565 () Unit!5369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7307 (_ BitVec 64) (_ BitVec 32)) Unit!5369)

(assert (=> b!174894 (= lt!86565 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5452 thiss!1248) lt!86566 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!174894 (arrayContainsKey!0 (_keys!5452 thiss!1248) lt!86566 #b00000000000000000000000000000000)))

(declare-fun lt!86564 () Unit!5369)

(assert (=> b!174894 (= lt!86564 lt!86565)))

(declare-fun res!82936 () Bool)

(assert (=> b!174894 (= res!82936 (= (seekEntryOrOpen!0 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000) (_keys!5452 thiss!1248) (mask!8489 thiss!1248)) (Found!538 #b00000000000000000000000000000000)))))

(assert (=> b!174894 (=> (not res!82936) (not e!115464))))

(declare-fun bm!17704 () Bool)

(declare-fun call!17707 () Bool)

(assert (=> bm!17704 (= call!17707 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5452 thiss!1248) (mask!8489 thiss!1248)))))

(declare-fun b!174895 () Bool)

(assert (=> b!174895 (= e!115465 call!17707)))

(declare-fun d!53393 () Bool)

(declare-fun res!82935 () Bool)

(assert (=> d!53393 (=> res!82935 e!115466)))

(assert (=> d!53393 (= res!82935 (bvsge #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(assert (=> d!53393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5452 thiss!1248) (mask!8489 thiss!1248)) e!115466)))

(declare-fun b!174896 () Bool)

(assert (=> b!174896 (= e!115464 call!17707)))

(assert (= (and d!53393 (not res!82935)) b!174893))

(assert (= (and b!174893 c!31310) b!174894))

(assert (= (and b!174893 (not c!31310)) b!174895))

(assert (= (and b!174894 res!82936) b!174896))

(assert (= (or b!174896 b!174895) bm!17704))

(assert (=> b!174893 m!203925))

(assert (=> b!174893 m!203925))

(assert (=> b!174893 m!203945))

(assert (=> b!174894 m!203925))

(declare-fun m!203991 () Bool)

(assert (=> b!174894 m!203991))

(declare-fun m!203993 () Bool)

(assert (=> b!174894 m!203993))

(assert (=> b!174894 m!203925))

(declare-fun m!203995 () Bool)

(assert (=> b!174894 m!203995))

(declare-fun m!203997 () Bool)

(assert (=> bm!17704 m!203997))

(assert (=> b!174848 d!53393))

(declare-fun d!53395 () Bool)

(declare-fun res!82941 () Bool)

(declare-fun e!115471 () Bool)

(assert (=> d!53395 (=> res!82941 e!115471)))

(assert (=> d!53395 (= res!82941 (and ((_ is Cons!2190) (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) (= (_1!1616 (h!2807 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) key!828)))))

(assert (=> d!53395 (= (containsKey!191 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828) e!115471)))

(declare-fun b!174901 () Bool)

(declare-fun e!115472 () Bool)

(assert (=> b!174901 (= e!115471 e!115472)))

(declare-fun res!82942 () Bool)

(assert (=> b!174901 (=> (not res!82942) (not e!115472))))

(assert (=> b!174901 (= res!82942 (and (or (not ((_ is Cons!2190) (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) (bvsle (_1!1616 (h!2807 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) key!828)) ((_ is Cons!2190) (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) (bvslt (_1!1616 (h!2807 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) key!828)))))

(declare-fun b!174902 () Bool)

(assert (=> b!174902 (= e!115472 (containsKey!191 (t!7000 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) key!828))))

(assert (= (and d!53395 (not res!82941)) b!174901))

(assert (= (and b!174901 res!82942) b!174902))

(declare-fun m!203999 () Bool)

(assert (=> b!174902 m!203999))

(assert (=> d!53369 d!53395))

(declare-fun b!174927 () Bool)

(declare-fun e!115491 () ListLongMap!2143)

(declare-fun e!115492 () ListLongMap!2143)

(assert (=> b!174927 (= e!115491 e!115492)))

(declare-fun c!31322 () Bool)

(assert (=> b!174927 (= c!31322 (validKeyInArray!0 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17707 () Bool)

(declare-fun call!17710 () ListLongMap!2143)

(assert (=> bm!17707 (= call!17710 (getCurrentListMapNoExtraKeys!163 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3608 thiss!1248)))))

(declare-fun d!53397 () Bool)

(declare-fun e!115489 () Bool)

(assert (=> d!53397 e!115489))

(declare-fun res!82954 () Bool)

(assert (=> d!53397 (=> (not res!82954) (not e!115489))))

(declare-fun lt!86582 () ListLongMap!2143)

(assert (=> d!53397 (= res!82954 (not (contains!1154 lt!86582 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53397 (= lt!86582 e!115491)))

(declare-fun c!31319 () Bool)

(assert (=> d!53397 (= c!31319 (bvsge #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(assert (=> d!53397 (validMask!0 (mask!8489 thiss!1248))))

(assert (=> d!53397 (= (getCurrentListMapNoExtraKeys!163 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)) lt!86582)))

(declare-fun b!174928 () Bool)

(assert (=> b!174928 (= e!115492 call!17710)))

(declare-fun b!174929 () Bool)

(declare-fun e!115487 () Bool)

(declare-fun isEmpty!445 (ListLongMap!2143) Bool)

(assert (=> b!174929 (= e!115487 (isEmpty!445 lt!86582))))

(declare-fun b!174930 () Bool)

(declare-fun res!82953 () Bool)

(assert (=> b!174930 (=> (not res!82953) (not e!115489))))

(assert (=> b!174930 (= res!82953 (not (contains!1154 lt!86582 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174931 () Bool)

(assert (=> b!174931 (= e!115487 (= lt!86582 (getCurrentListMapNoExtraKeys!163 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3608 thiss!1248))))))

(declare-fun b!174932 () Bool)

(assert (=> b!174932 (= e!115491 (ListLongMap!2144 Nil!2191))))

(declare-fun b!174933 () Bool)

(declare-fun e!115493 () Bool)

(assert (=> b!174933 (= e!115489 e!115493)))

(declare-fun c!31321 () Bool)

(declare-fun e!115490 () Bool)

(assert (=> b!174933 (= c!31321 e!115490)))

(declare-fun res!82952 () Bool)

(assert (=> b!174933 (=> (not res!82952) (not e!115490))))

(assert (=> b!174933 (= res!82952 (bvslt #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(declare-fun b!174934 () Bool)

(declare-fun e!115488 () Bool)

(assert (=> b!174934 (= e!115493 e!115488)))

(assert (=> b!174934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(declare-fun res!82951 () Bool)

(assert (=> b!174934 (= res!82951 (contains!1154 lt!86582 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174934 (=> (not res!82951) (not e!115488))))

(declare-fun b!174935 () Bool)

(assert (=> b!174935 (= e!115490 (validKeyInArray!0 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174935 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!174936 () Bool)

(declare-fun lt!86585 () Unit!5369)

(declare-fun lt!86581 () Unit!5369)

(assert (=> b!174936 (= lt!86585 lt!86581)))

(declare-fun lt!86587 () (_ BitVec 64))

(declare-fun lt!86583 () (_ BitVec 64))

(declare-fun lt!86584 () V!5105)

(declare-fun lt!86586 () ListLongMap!2143)

(assert (=> b!174936 (not (contains!1154 (+!249 lt!86586 (tuple2!3211 lt!86587 lt!86584)) lt!86583))))

(declare-fun addStillNotContains!75 (ListLongMap!2143 (_ BitVec 64) V!5105 (_ BitVec 64)) Unit!5369)

(assert (=> b!174936 (= lt!86581 (addStillNotContains!75 lt!86586 lt!86587 lt!86584 lt!86583))))

(assert (=> b!174936 (= lt!86583 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!174936 (= lt!86584 (get!1983 (select (arr!3471 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174936 (= lt!86587 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174936 (= lt!86586 call!17710)))

(assert (=> b!174936 (= e!115492 (+!249 call!17710 (tuple2!3211 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000) (get!1983 (select (arr!3471 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!174937 () Bool)

(assert (=> b!174937 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(assert (=> b!174937 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3771 (_values!3591 thiss!1248))))))

(assert (=> b!174937 (= e!115488 (= (apply!132 lt!86582 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)) (get!1983 (select (arr!3471 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!174938 () Bool)

(assert (=> b!174938 (= e!115493 e!115487)))

(declare-fun c!31320 () Bool)

(assert (=> b!174938 (= c!31320 (bvslt #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(assert (= (and d!53397 c!31319) b!174932))

(assert (= (and d!53397 (not c!31319)) b!174927))

(assert (= (and b!174927 c!31322) b!174936))

(assert (= (and b!174927 (not c!31322)) b!174928))

(assert (= (or b!174936 b!174928) bm!17707))

(assert (= (and d!53397 res!82954) b!174930))

(assert (= (and b!174930 res!82953) b!174933))

(assert (= (and b!174933 res!82952) b!174935))

(assert (= (and b!174933 c!31321) b!174934))

(assert (= (and b!174933 (not c!31321)) b!174938))

(assert (= (and b!174934 res!82951) b!174937))

(assert (= (and b!174938 c!31320) b!174931))

(assert (= (and b!174938 (not c!31320)) b!174929))

(declare-fun b_lambda!7013 () Bool)

(assert (=> (not b_lambda!7013) (not b!174936)))

(assert (=> b!174936 t!7003))

(declare-fun b_and!10811 () Bool)

(assert (= b_and!10809 (and (=> t!7003 result!4591) b_and!10811)))

(declare-fun b_lambda!7015 () Bool)

(assert (=> (not b_lambda!7015) (not b!174937)))

(assert (=> b!174937 t!7003))

(declare-fun b_and!10813 () Bool)

(assert (= b_and!10811 (and (=> t!7003 result!4591) b_and!10813)))

(assert (=> b!174934 m!203925))

(assert (=> b!174934 m!203925))

(declare-fun m!204001 () Bool)

(assert (=> b!174934 m!204001))

(declare-fun m!204003 () Bool)

(assert (=> bm!17707 m!204003))

(declare-fun m!204005 () Bool)

(assert (=> b!174936 m!204005))

(assert (=> b!174936 m!203947))

(assert (=> b!174936 m!203925))

(declare-fun m!204007 () Bool)

(assert (=> b!174936 m!204007))

(assert (=> b!174936 m!203949))

(declare-fun m!204009 () Bool)

(assert (=> b!174936 m!204009))

(assert (=> b!174936 m!204007))

(declare-fun m!204011 () Bool)

(assert (=> b!174936 m!204011))

(assert (=> b!174936 m!203947))

(assert (=> b!174936 m!203949))

(assert (=> b!174936 m!203951))

(declare-fun m!204013 () Bool)

(assert (=> d!53397 m!204013))

(assert (=> d!53397 m!203833))

(declare-fun m!204015 () Bool)

(assert (=> b!174930 m!204015))

(assert (=> b!174935 m!203925))

(assert (=> b!174935 m!203925))

(assert (=> b!174935 m!203945))

(declare-fun m!204017 () Bool)

(assert (=> b!174929 m!204017))

(assert (=> b!174931 m!204003))

(assert (=> b!174927 m!203925))

(assert (=> b!174927 m!203925))

(assert (=> b!174927 m!203945))

(assert (=> b!174937 m!203947))

(assert (=> b!174937 m!203925))

(assert (=> b!174937 m!203925))

(declare-fun m!204019 () Bool)

(assert (=> b!174937 m!204019))

(assert (=> b!174937 m!203949))

(assert (=> b!174937 m!203947))

(assert (=> b!174937 m!203949))

(assert (=> b!174937 m!203951))

(assert (=> bm!17694 d!53397))

(declare-fun b!174949 () Bool)

(declare-fun e!115504 () Bool)

(declare-fun call!17713 () Bool)

(assert (=> b!174949 (= e!115504 call!17713)))

(declare-fun bm!17710 () Bool)

(declare-fun c!31325 () Bool)

(assert (=> bm!17710 (= call!17713 (arrayNoDuplicates!0 (_keys!5452 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31325 (Cons!2192 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000) Nil!2193) Nil!2193)))))

(declare-fun d!53399 () Bool)

(declare-fun res!82963 () Bool)

(declare-fun e!115505 () Bool)

(assert (=> d!53399 (=> res!82963 e!115505)))

(assert (=> d!53399 (= res!82963 (bvsge #b00000000000000000000000000000000 (size!3770 (_keys!5452 thiss!1248))))))

(assert (=> d!53399 (= (arrayNoDuplicates!0 (_keys!5452 thiss!1248) #b00000000000000000000000000000000 Nil!2193) e!115505)))

(declare-fun b!174950 () Bool)

(assert (=> b!174950 (= e!115504 call!17713)))

(declare-fun b!174951 () Bool)

(declare-fun e!115502 () Bool)

(declare-fun contains!1156 (List!2196 (_ BitVec 64)) Bool)

(assert (=> b!174951 (= e!115502 (contains!1156 Nil!2193 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174952 () Bool)

(declare-fun e!115503 () Bool)

(assert (=> b!174952 (= e!115503 e!115504)))

(assert (=> b!174952 (= c!31325 (validKeyInArray!0 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174953 () Bool)

(assert (=> b!174953 (= e!115505 e!115503)))

(declare-fun res!82961 () Bool)

(assert (=> b!174953 (=> (not res!82961) (not e!115503))))

(assert (=> b!174953 (= res!82961 (not e!115502))))

(declare-fun res!82962 () Bool)

(assert (=> b!174953 (=> (not res!82962) (not e!115502))))

(assert (=> b!174953 (= res!82962 (validKeyInArray!0 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53399 (not res!82963)) b!174953))

(assert (= (and b!174953 res!82962) b!174951))

(assert (= (and b!174953 res!82961) b!174952))

(assert (= (and b!174952 c!31325) b!174950))

(assert (= (and b!174952 (not c!31325)) b!174949))

(assert (= (or b!174950 b!174949) bm!17710))

(assert (=> bm!17710 m!203925))

(declare-fun m!204021 () Bool)

(assert (=> bm!17710 m!204021))

(assert (=> b!174951 m!203925))

(assert (=> b!174951 m!203925))

(declare-fun m!204023 () Bool)

(assert (=> b!174951 m!204023))

(assert (=> b!174952 m!203925))

(assert (=> b!174952 m!203925))

(assert (=> b!174952 m!203945))

(assert (=> b!174953 m!203925))

(assert (=> b!174953 m!203925))

(assert (=> b!174953 m!203945))

(assert (=> b!174849 d!53399))

(declare-fun d!53401 () Bool)

(declare-fun e!115506 () Bool)

(assert (=> d!53401 e!115506))

(declare-fun res!82964 () Bool)

(assert (=> d!53401 (=> res!82964 e!115506)))

(declare-fun lt!86591 () Bool)

(assert (=> d!53401 (= res!82964 (not lt!86591))))

(declare-fun lt!86588 () Bool)

(assert (=> d!53401 (= lt!86591 lt!86588)))

(declare-fun lt!86590 () Unit!5369)

(declare-fun e!115507 () Unit!5369)

(assert (=> d!53401 (= lt!86590 e!115507)))

(declare-fun c!31326 () Bool)

(assert (=> d!53401 (= c!31326 lt!86588)))

(assert (=> d!53401 (= lt!86588 (containsKey!191 (toList!1087 lt!86530) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53401 (= (contains!1154 lt!86530 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86591)))

(declare-fun b!174954 () Bool)

(declare-fun lt!86589 () Unit!5369)

(assert (=> b!174954 (= e!115507 lt!86589)))

(assert (=> b!174954 (= lt!86589 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1087 lt!86530) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174954 (isDefined!140 (getValueByKey!188 (toList!1087 lt!86530) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174955 () Bool)

(declare-fun Unit!5374 () Unit!5369)

(assert (=> b!174955 (= e!115507 Unit!5374)))

(declare-fun b!174956 () Bool)

(assert (=> b!174956 (= e!115506 (isDefined!140 (getValueByKey!188 (toList!1087 lt!86530) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53401 c!31326) b!174954))

(assert (= (and d!53401 (not c!31326)) b!174955))

(assert (= (and d!53401 (not res!82964)) b!174956))

(declare-fun m!204025 () Bool)

(assert (=> d!53401 m!204025))

(declare-fun m!204027 () Bool)

(assert (=> b!174954 m!204027))

(assert (=> b!174954 m!203975))

(assert (=> b!174954 m!203975))

(declare-fun m!204029 () Bool)

(assert (=> b!174954 m!204029))

(assert (=> b!174956 m!203975))

(assert (=> b!174956 m!203975))

(assert (=> b!174956 m!204029))

(assert (=> bm!17698 d!53401))

(declare-fun b!174969 () Bool)

(declare-fun c!31334 () Bool)

(declare-fun lt!86597 () (_ BitVec 64))

(assert (=> b!174969 (= c!31334 (= lt!86597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115515 () SeekEntryResult!538)

(declare-fun e!115514 () SeekEntryResult!538)

(assert (=> b!174969 (= e!115515 e!115514)))

(declare-fun b!174970 () Bool)

(assert (=> b!174970 (= e!115514 (MissingVacant!538 (index!4322 lt!86471)))))

(declare-fun b!174971 () Bool)

(assert (=> b!174971 (= e!115515 (Found!538 (index!4322 lt!86471)))))

(declare-fun b!174972 () Bool)

(declare-fun e!115516 () SeekEntryResult!538)

(assert (=> b!174972 (= e!115516 Undefined!538)))

(declare-fun b!174973 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!174973 (= e!115514 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19226 lt!86471) #b00000000000000000000000000000001) (nextIndex!0 (index!4322 lt!86471) (bvadd (x!19226 lt!86471) #b00000000000000000000000000000001) (mask!8489 thiss!1248)) (index!4322 lt!86471) key!828 (_keys!5452 thiss!1248) (mask!8489 thiss!1248)))))

(declare-fun lt!86596 () SeekEntryResult!538)

(declare-fun d!53403 () Bool)

(assert (=> d!53403 (and (or ((_ is Undefined!538) lt!86596) (not ((_ is Found!538) lt!86596)) (and (bvsge (index!4321 lt!86596) #b00000000000000000000000000000000) (bvslt (index!4321 lt!86596) (size!3770 (_keys!5452 thiss!1248))))) (or ((_ is Undefined!538) lt!86596) ((_ is Found!538) lt!86596) (not ((_ is MissingVacant!538) lt!86596)) (not (= (index!4323 lt!86596) (index!4322 lt!86471))) (and (bvsge (index!4323 lt!86596) #b00000000000000000000000000000000) (bvslt (index!4323 lt!86596) (size!3770 (_keys!5452 thiss!1248))))) (or ((_ is Undefined!538) lt!86596) (ite ((_ is Found!538) lt!86596) (= (select (arr!3470 (_keys!5452 thiss!1248)) (index!4321 lt!86596)) key!828) (and ((_ is MissingVacant!538) lt!86596) (= (index!4323 lt!86596) (index!4322 lt!86471)) (= (select (arr!3470 (_keys!5452 thiss!1248)) (index!4323 lt!86596)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53403 (= lt!86596 e!115516)))

(declare-fun c!31333 () Bool)

(assert (=> d!53403 (= c!31333 (bvsge (x!19226 lt!86471) #b01111111111111111111111111111110))))

(assert (=> d!53403 (= lt!86597 (select (arr!3470 (_keys!5452 thiss!1248)) (index!4322 lt!86471)))))

(assert (=> d!53403 (validMask!0 (mask!8489 thiss!1248))))

(assert (=> d!53403 (= (seekKeyOrZeroReturnVacant!0 (x!19226 lt!86471) (index!4322 lt!86471) (index!4322 lt!86471) key!828 (_keys!5452 thiss!1248) (mask!8489 thiss!1248)) lt!86596)))

(declare-fun b!174974 () Bool)

(assert (=> b!174974 (= e!115516 e!115515)))

(declare-fun c!31335 () Bool)

(assert (=> b!174974 (= c!31335 (= lt!86597 key!828))))

(assert (= (and d!53403 c!31333) b!174972))

(assert (= (and d!53403 (not c!31333)) b!174974))

(assert (= (and b!174974 c!31335) b!174971))

(assert (= (and b!174974 (not c!31335)) b!174969))

(assert (= (and b!174969 c!31334) b!174970))

(assert (= (and b!174969 (not c!31334)) b!174973))

(declare-fun m!204031 () Bool)

(assert (=> b!174973 m!204031))

(assert (=> b!174973 m!204031))

(declare-fun m!204033 () Bool)

(assert (=> b!174973 m!204033))

(declare-fun m!204035 () Bool)

(assert (=> d!53403 m!204035))

(declare-fun m!204037 () Bool)

(assert (=> d!53403 m!204037))

(assert (=> d!53403 m!203891))

(assert (=> d!53403 m!203833))

(assert (=> b!174763 d!53403))

(assert (=> b!174831 d!53381))

(declare-fun d!53405 () Bool)

(assert (=> d!53405 (isDefined!140 (getValueByKey!188 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(declare-fun lt!86600 () Unit!5369)

(declare-fun choose!941 (List!2194 (_ BitVec 64)) Unit!5369)

(assert (=> d!53405 (= lt!86600 (choose!941 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(declare-fun e!115519 () Bool)

(assert (=> d!53405 e!115519))

(declare-fun res!82967 () Bool)

(assert (=> d!53405 (=> (not res!82967) (not e!115519))))

(declare-fun isStrictlySorted!320 (List!2194) Bool)

(assert (=> d!53405 (= res!82967 (isStrictlySorted!320 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))))

(assert (=> d!53405 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828) lt!86600)))

(declare-fun b!174977 () Bool)

(assert (=> b!174977 (= e!115519 (containsKey!191 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))

(assert (= (and d!53405 res!82967) b!174977))

(assert (=> d!53405 m!203899))

(assert (=> d!53405 m!203899))

(assert (=> d!53405 m!203901))

(declare-fun m!204039 () Bool)

(assert (=> d!53405 m!204039))

(declare-fun m!204041 () Bool)

(assert (=> d!53405 m!204041))

(assert (=> b!174977 m!203895))

(assert (=> b!174773 d!53405))

(declare-fun d!53407 () Bool)

(declare-fun isEmpty!446 (Option!194) Bool)

(assert (=> d!53407 (= (isDefined!140 (getValueByKey!188 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828)) (not (isEmpty!446 (getValueByKey!188 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828))))))

(declare-fun bs!7237 () Bool)

(assert (= bs!7237 d!53407))

(assert (=> bs!7237 m!203899))

(declare-fun m!204043 () Bool)

(assert (=> bs!7237 m!204043))

(assert (=> b!174773 d!53407))

(declare-fun b!174988 () Bool)

(declare-fun e!115525 () Option!194)

(assert (=> b!174988 (= e!115525 (getValueByKey!188 (t!7000 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) key!828))))

(declare-fun b!174986 () Bool)

(declare-fun e!115524 () Option!194)

(assert (=> b!174986 (= e!115524 (Some!193 (_2!1616 (h!2807 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))))))))

(declare-fun d!53409 () Bool)

(declare-fun c!31340 () Bool)

(assert (=> d!53409 (= c!31340 (and ((_ is Cons!2190) (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) (= (_1!1616 (h!2807 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) key!828)))))

(assert (=> d!53409 (= (getValueByKey!188 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))) key!828) e!115524)))

(declare-fun b!174989 () Bool)

(assert (=> b!174989 (= e!115525 None!192)))

(declare-fun b!174987 () Bool)

(assert (=> b!174987 (= e!115524 e!115525)))

(declare-fun c!31341 () Bool)

(assert (=> b!174987 (= c!31341 (and ((_ is Cons!2190) (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248)))) (not (= (_1!1616 (h!2807 (toList!1087 (getCurrentListMap!742 (_keys!5452 thiss!1248) (_values!3591 thiss!1248) (mask!8489 thiss!1248) (extraKeys!3345 thiss!1248) (zeroValue!3449 thiss!1248) (minValue!3449 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3608 thiss!1248))))) key!828))))))

(assert (= (and d!53409 c!31340) b!174986))

(assert (= (and d!53409 (not c!31340)) b!174987))

(assert (= (and b!174987 c!31341) b!174988))

(assert (= (and b!174987 (not c!31341)) b!174989))

(declare-fun m!204045 () Bool)

(assert (=> b!174988 m!204045))

(assert (=> b!174773 d!53409))

(declare-fun d!53411 () Bool)

(declare-fun e!115528 () Bool)

(assert (=> d!53411 e!115528))

(declare-fun res!82973 () Bool)

(assert (=> d!53411 (=> (not res!82973) (not e!115528))))

(declare-fun lt!86610 () ListLongMap!2143)

(assert (=> d!53411 (= res!82973 (contains!1154 lt!86610 (_1!1616 (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))))

(declare-fun lt!86612 () List!2194)

(assert (=> d!53411 (= lt!86610 (ListLongMap!2144 lt!86612))))

(declare-fun lt!86611 () Unit!5369)

(declare-fun lt!86609 () Unit!5369)

(assert (=> d!53411 (= lt!86611 lt!86609)))

(assert (=> d!53411 (= (getValueByKey!188 lt!86612 (_1!1616 (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))) (Some!193 (_2!1616 (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!100 (List!2194 (_ BitVec 64) V!5105) Unit!5369)

(assert (=> d!53411 (= lt!86609 (lemmaContainsTupThenGetReturnValue!100 lt!86612 (_1!1616 (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))) (_2!1616 (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))))

(declare-fun insertStrictlySorted!103 (List!2194 (_ BitVec 64) V!5105) List!2194)

(assert (=> d!53411 (= lt!86612 (insertStrictlySorted!103 (toList!1087 (ite c!31298 call!17697 (ite c!31296 call!17699 call!17700))) (_1!1616 (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))) (_2!1616 (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))))

(assert (=> d!53411 (= (+!249 (ite c!31298 call!17697 (ite c!31296 call!17699 call!17700)) (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))) lt!86610)))

(declare-fun b!174994 () Bool)

(declare-fun res!82972 () Bool)

(assert (=> b!174994 (=> (not res!82972) (not e!115528))))

(assert (=> b!174994 (= res!82972 (= (getValueByKey!188 (toList!1087 lt!86610) (_1!1616 (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))) (Some!193 (_2!1616 (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))))

(declare-fun b!174995 () Bool)

(declare-fun contains!1157 (List!2194 tuple2!3210) Bool)

(assert (=> b!174995 (= e!115528 (contains!1157 (toList!1087 lt!86610) (ite (or c!31298 c!31296) (tuple2!3211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3449 thiss!1248)) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(assert (= (and d!53411 res!82973) b!174994))

(assert (= (and b!174994 res!82972) b!174995))

(declare-fun m!204047 () Bool)

(assert (=> d!53411 m!204047))

(declare-fun m!204049 () Bool)

(assert (=> d!53411 m!204049))

(declare-fun m!204051 () Bool)

(assert (=> d!53411 m!204051))

(declare-fun m!204053 () Bool)

(assert (=> d!53411 m!204053))

(declare-fun m!204055 () Bool)

(assert (=> b!174994 m!204055))

(declare-fun m!204057 () Bool)

(assert (=> b!174995 m!204057))

(assert (=> bm!17693 d!53411))

(assert (=> d!53371 d!53373))

(assert (=> b!174775 d!53407))

(assert (=> b!174775 d!53409))

(declare-fun d!53413 () Bool)

(declare-fun e!115529 () Bool)

(assert (=> d!53413 e!115529))

(declare-fun res!82975 () Bool)

(assert (=> d!53413 (=> (not res!82975) (not e!115529))))

(declare-fun lt!86614 () ListLongMap!2143)

(assert (=> d!53413 (= res!82975 (contains!1154 lt!86614 (_1!1616 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(declare-fun lt!86616 () List!2194)

(assert (=> d!53413 (= lt!86614 (ListLongMap!2144 lt!86616))))

(declare-fun lt!86615 () Unit!5369)

(declare-fun lt!86613 () Unit!5369)

(assert (=> d!53413 (= lt!86615 lt!86613)))

(assert (=> d!53413 (= (getValueByKey!188 lt!86616 (_1!1616 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))) (Some!193 (_2!1616 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(assert (=> d!53413 (= lt!86613 (lemmaContainsTupThenGetReturnValue!100 lt!86616 (_1!1616 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))) (_2!1616 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(assert (=> d!53413 (= lt!86616 (insertStrictlySorted!103 (toList!1087 call!17695) (_1!1616 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))) (_2!1616 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))))))

(assert (=> d!53413 (= (+!249 call!17695 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))) lt!86614)))

(declare-fun b!174996 () Bool)

(declare-fun res!82974 () Bool)

(assert (=> b!174996 (=> (not res!82974) (not e!115529))))

(assert (=> b!174996 (= res!82974 (= (getValueByKey!188 (toList!1087 lt!86614) (_1!1616 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248)))) (Some!193 (_2!1616 (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))))

(declare-fun b!174997 () Bool)

(assert (=> b!174997 (= e!115529 (contains!1157 (toList!1087 lt!86614) (tuple2!3211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3449 thiss!1248))))))

(assert (= (and d!53413 res!82975) b!174996))

(assert (= (and b!174996 res!82974) b!174997))

(declare-fun m!204059 () Bool)

(assert (=> d!53413 m!204059))

(declare-fun m!204061 () Bool)

(assert (=> d!53413 m!204061))

(declare-fun m!204063 () Bool)

(assert (=> d!53413 m!204063))

(declare-fun m!204065 () Bool)

(assert (=> d!53413 m!204065))

(declare-fun m!204067 () Bool)

(assert (=> b!174996 m!204067))

(declare-fun m!204069 () Bool)

(assert (=> b!174997 m!204069))

(assert (=> b!174824 d!53413))

(declare-fun b!175016 () Bool)

(declare-fun e!115544 () SeekEntryResult!538)

(assert (=> b!175016 (= e!115544 (Intermediate!538 false (toIndex!0 key!828 (mask!8489 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!53415 () Bool)

(declare-fun e!115543 () Bool)

(assert (=> d!53415 e!115543))

(declare-fun c!31350 () Bool)

(declare-fun lt!86621 () SeekEntryResult!538)

(assert (=> d!53415 (= c!31350 (and ((_ is Intermediate!538) lt!86621) (undefined!1350 lt!86621)))))

(declare-fun e!115541 () SeekEntryResult!538)

(assert (=> d!53415 (= lt!86621 e!115541)))

(declare-fun c!31348 () Bool)

(assert (=> d!53415 (= c!31348 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!86622 () (_ BitVec 64))

(assert (=> d!53415 (= lt!86622 (select (arr!3470 (_keys!5452 thiss!1248)) (toIndex!0 key!828 (mask!8489 thiss!1248))))))

(assert (=> d!53415 (validMask!0 (mask!8489 thiss!1248))))

(assert (=> d!53415 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8489 thiss!1248)) key!828 (_keys!5452 thiss!1248) (mask!8489 thiss!1248)) lt!86621)))

(declare-fun b!175017 () Bool)

(assert (=> b!175017 (= e!115541 (Intermediate!538 true (toIndex!0 key!828 (mask!8489 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!175018 () Bool)

(declare-fun e!115540 () Bool)

(assert (=> b!175018 (= e!115543 e!115540)))

(declare-fun res!82983 () Bool)

(assert (=> b!175018 (= res!82983 (and ((_ is Intermediate!538) lt!86621) (not (undefined!1350 lt!86621)) (bvslt (x!19226 lt!86621) #b01111111111111111111111111111110) (bvsge (x!19226 lt!86621) #b00000000000000000000000000000000) (bvsge (x!19226 lt!86621) #b00000000000000000000000000000000)))))

(assert (=> b!175018 (=> (not res!82983) (not e!115540))))

(declare-fun b!175019 () Bool)

(assert (=> b!175019 (= e!115541 e!115544)))

(declare-fun c!31349 () Bool)

(assert (=> b!175019 (= c!31349 (or (= lt!86622 key!828) (= (bvadd lt!86622 lt!86622) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175020 () Bool)

(assert (=> b!175020 (and (bvsge (index!4322 lt!86621) #b00000000000000000000000000000000) (bvslt (index!4322 lt!86621) (size!3770 (_keys!5452 thiss!1248))))))

(declare-fun e!115542 () Bool)

(assert (=> b!175020 (= e!115542 (= (select (arr!3470 (_keys!5452 thiss!1248)) (index!4322 lt!86621)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175021 () Bool)

(assert (=> b!175021 (and (bvsge (index!4322 lt!86621) #b00000000000000000000000000000000) (bvslt (index!4322 lt!86621) (size!3770 (_keys!5452 thiss!1248))))))

(declare-fun res!82984 () Bool)

(assert (=> b!175021 (= res!82984 (= (select (arr!3470 (_keys!5452 thiss!1248)) (index!4322 lt!86621)) key!828))))

(assert (=> b!175021 (=> res!82984 e!115542)))

(assert (=> b!175021 (= e!115540 e!115542)))

(declare-fun b!175022 () Bool)

(assert (=> b!175022 (and (bvsge (index!4322 lt!86621) #b00000000000000000000000000000000) (bvslt (index!4322 lt!86621) (size!3770 (_keys!5452 thiss!1248))))))

(declare-fun res!82982 () Bool)

(assert (=> b!175022 (= res!82982 (= (select (arr!3470 (_keys!5452 thiss!1248)) (index!4322 lt!86621)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175022 (=> res!82982 e!115542)))

(declare-fun b!175023 () Bool)

(assert (=> b!175023 (= e!115544 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8489 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8489 thiss!1248)) key!828 (_keys!5452 thiss!1248) (mask!8489 thiss!1248)))))

(declare-fun b!175024 () Bool)

(assert (=> b!175024 (= e!115543 (bvsge (x!19226 lt!86621) #b01111111111111111111111111111110))))

(assert (= (and d!53415 c!31348) b!175017))

(assert (= (and d!53415 (not c!31348)) b!175019))

(assert (= (and b!175019 c!31349) b!175016))

(assert (= (and b!175019 (not c!31349)) b!175023))

(assert (= (and d!53415 c!31350) b!175024))

(assert (= (and d!53415 (not c!31350)) b!175018))

(assert (= (and b!175018 res!82983) b!175021))

(assert (= (and b!175021 (not res!82984)) b!175022))

(assert (= (and b!175022 (not res!82982)) b!175020))

(declare-fun m!204071 () Bool)

(assert (=> b!175021 m!204071))

(assert (=> b!175022 m!204071))

(assert (=> b!175023 m!203883))

(declare-fun m!204073 () Bool)

(assert (=> b!175023 m!204073))

(assert (=> b!175023 m!204073))

(declare-fun m!204075 () Bool)

(assert (=> b!175023 m!204075))

(assert (=> d!53415 m!203883))

(declare-fun m!204077 () Bool)

(assert (=> d!53415 m!204077))

(assert (=> d!53415 m!203833))

(assert (=> b!175020 m!204071))

(assert (=> d!53367 d!53415))

(declare-fun d!53417 () Bool)

(declare-fun lt!86628 () (_ BitVec 32))

(declare-fun lt!86627 () (_ BitVec 32))

(assert (=> d!53417 (= lt!86628 (bvmul (bvxor lt!86627 (bvlshr lt!86627 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53417 (= lt!86627 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53417 (and (bvsge (mask!8489 thiss!1248) #b00000000000000000000000000000000) (let ((res!82985 (let ((h!2810 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19245 (bvmul (bvxor h!2810 (bvlshr h!2810 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19245 (bvlshr x!19245 #b00000000000000000000000000001101)) (mask!8489 thiss!1248)))))) (and (bvslt res!82985 (bvadd (mask!8489 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!82985 #b00000000000000000000000000000000))))))

(assert (=> d!53417 (= (toIndex!0 key!828 (mask!8489 thiss!1248)) (bvand (bvxor lt!86628 (bvlshr lt!86628 #b00000000000000000000000000001101)) (mask!8489 thiss!1248)))))

(assert (=> d!53367 d!53417))

(assert (=> d!53367 d!53373))

(declare-fun d!53419 () Bool)

(assert (=> d!53419 (= (apply!132 lt!86548 lt!86545) (get!1984 (getValueByKey!188 (toList!1087 lt!86548) lt!86545)))))

(declare-fun bs!7238 () Bool)

(assert (= bs!7238 d!53419))

(declare-fun m!204079 () Bool)

(assert (=> bs!7238 m!204079))

(assert (=> bs!7238 m!204079))

(declare-fun m!204081 () Bool)

(assert (=> bs!7238 m!204081))

(assert (=> b!174826 d!53419))

(declare-fun d!53421 () Bool)

(declare-fun e!115545 () Bool)

(assert (=> d!53421 e!115545))

(declare-fun res!82986 () Bool)

(assert (=> d!53421 (=> res!82986 e!115545)))

(declare-fun lt!86632 () Bool)

(assert (=> d!53421 (= res!82986 (not lt!86632))))

(declare-fun lt!86629 () Bool)

(assert (=> d!53421 (= lt!86632 lt!86629)))

(declare-fun lt!86631 () Unit!5369)

(declare-fun e!115546 () Unit!5369)

(assert (=> d!53421 (= lt!86631 e!115546)))

(declare-fun c!31351 () Bool)

(assert (=> d!53421 (= c!31351 lt!86629)))

(assert (=> d!53421 (= lt!86629 (containsKey!191 (toList!1087 (+!249 lt!86531 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248)))) lt!86536))))

(assert (=> d!53421 (= (contains!1154 (+!249 lt!86531 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248))) lt!86536) lt!86632)))

(declare-fun b!175025 () Bool)

(declare-fun lt!86630 () Unit!5369)

(assert (=> b!175025 (= e!115546 lt!86630)))

(assert (=> b!175025 (= lt!86630 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1087 (+!249 lt!86531 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248)))) lt!86536))))

(assert (=> b!175025 (isDefined!140 (getValueByKey!188 (toList!1087 (+!249 lt!86531 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248)))) lt!86536))))

(declare-fun b!175026 () Bool)

(declare-fun Unit!5375 () Unit!5369)

(assert (=> b!175026 (= e!115546 Unit!5375)))

(declare-fun b!175027 () Bool)

(assert (=> b!175027 (= e!115545 (isDefined!140 (getValueByKey!188 (toList!1087 (+!249 lt!86531 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248)))) lt!86536)))))

(assert (= (and d!53421 c!31351) b!175025))

(assert (= (and d!53421 (not c!31351)) b!175026))

(assert (= (and d!53421 (not res!82986)) b!175027))

(declare-fun m!204083 () Bool)

(assert (=> d!53421 m!204083))

(declare-fun m!204085 () Bool)

(assert (=> b!175025 m!204085))

(declare-fun m!204087 () Bool)

(assert (=> b!175025 m!204087))

(assert (=> b!175025 m!204087))

(declare-fun m!204089 () Bool)

(assert (=> b!175025 m!204089))

(assert (=> b!175027 m!204087))

(assert (=> b!175027 m!204087))

(assert (=> b!175027 m!204089))

(assert (=> b!174826 d!53421))

(declare-fun d!53423 () Bool)

(declare-fun e!115547 () Bool)

(assert (=> d!53423 e!115547))

(declare-fun res!82988 () Bool)

(assert (=> d!53423 (=> (not res!82988) (not e!115547))))

(declare-fun lt!86634 () ListLongMap!2143)

(assert (=> d!53423 (= res!82988 (contains!1154 lt!86634 (_1!1616 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248)))))))

(declare-fun lt!86636 () List!2194)

(assert (=> d!53423 (= lt!86634 (ListLongMap!2144 lt!86636))))

(declare-fun lt!86635 () Unit!5369)

(declare-fun lt!86633 () Unit!5369)

(assert (=> d!53423 (= lt!86635 lt!86633)))

(assert (=> d!53423 (= (getValueByKey!188 lt!86636 (_1!1616 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248)))) (Some!193 (_2!1616 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53423 (= lt!86633 (lemmaContainsTupThenGetReturnValue!100 lt!86636 (_1!1616 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248))) (_2!1616 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53423 (= lt!86636 (insertStrictlySorted!103 (toList!1087 lt!86531) (_1!1616 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248))) (_2!1616 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53423 (= (+!249 lt!86531 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248))) lt!86634)))

(declare-fun b!175028 () Bool)

(declare-fun res!82987 () Bool)

(assert (=> b!175028 (=> (not res!82987) (not e!115547))))

(assert (=> b!175028 (= res!82987 (= (getValueByKey!188 (toList!1087 lt!86634) (_1!1616 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248)))) (Some!193 (_2!1616 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248))))))))

(declare-fun b!175029 () Bool)

(assert (=> b!175029 (= e!115547 (contains!1157 (toList!1087 lt!86634) (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248))))))

(assert (= (and d!53423 res!82988) b!175028))

(assert (= (and b!175028 res!82987) b!175029))

(declare-fun m!204091 () Bool)

(assert (=> d!53423 m!204091))

(declare-fun m!204093 () Bool)

(assert (=> d!53423 m!204093))

(declare-fun m!204095 () Bool)

(assert (=> d!53423 m!204095))

(declare-fun m!204097 () Bool)

(assert (=> d!53423 m!204097))

(declare-fun m!204099 () Bool)

(assert (=> b!175028 m!204099))

(declare-fun m!204101 () Bool)

(assert (=> b!175029 m!204101))

(assert (=> b!174826 d!53423))

(declare-fun d!53425 () Bool)

(assert (=> d!53425 (= (apply!132 (+!249 lt!86540 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248))) lt!86543) (apply!132 lt!86540 lt!86543))))

(declare-fun lt!86639 () Unit!5369)

(declare-fun choose!942 (ListLongMap!2143 (_ BitVec 64) V!5105 (_ BitVec 64)) Unit!5369)

(assert (=> d!53425 (= lt!86639 (choose!942 lt!86540 lt!86538 (zeroValue!3449 thiss!1248) lt!86543))))

(declare-fun e!115550 () Bool)

(assert (=> d!53425 e!115550))

(declare-fun res!82991 () Bool)

(assert (=> d!53425 (=> (not res!82991) (not e!115550))))

(assert (=> d!53425 (= res!82991 (contains!1154 lt!86540 lt!86543))))

(assert (=> d!53425 (= (addApplyDifferent!108 lt!86540 lt!86538 (zeroValue!3449 thiss!1248) lt!86543) lt!86639)))

(declare-fun b!175033 () Bool)

(assert (=> b!175033 (= e!115550 (not (= lt!86543 lt!86538)))))

(assert (= (and d!53425 res!82991) b!175033))

(declare-fun m!204103 () Bool)

(assert (=> d!53425 m!204103))

(assert (=> d!53425 m!203915))

(assert (=> d!53425 m!203917))

(assert (=> d!53425 m!203911))

(assert (=> d!53425 m!203915))

(declare-fun m!204105 () Bool)

(assert (=> d!53425 m!204105))

(assert (=> b!174826 d!53425))

(declare-fun d!53427 () Bool)

(assert (=> d!53427 (= (apply!132 lt!86544 lt!86549) (get!1984 (getValueByKey!188 (toList!1087 lt!86544) lt!86549)))))

(declare-fun bs!7239 () Bool)

(assert (= bs!7239 d!53427))

(declare-fun m!204107 () Bool)

(assert (=> bs!7239 m!204107))

(assert (=> bs!7239 m!204107))

(declare-fun m!204109 () Bool)

(assert (=> bs!7239 m!204109))

(assert (=> b!174826 d!53427))

(declare-fun d!53429 () Bool)

(declare-fun e!115551 () Bool)

(assert (=> d!53429 e!115551))

(declare-fun res!82993 () Bool)

(assert (=> d!53429 (=> (not res!82993) (not e!115551))))

(declare-fun lt!86641 () ListLongMap!2143)

(assert (=> d!53429 (= res!82993 (contains!1154 lt!86641 (_1!1616 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248)))))))

(declare-fun lt!86643 () List!2194)

(assert (=> d!53429 (= lt!86641 (ListLongMap!2144 lt!86643))))

(declare-fun lt!86642 () Unit!5369)

(declare-fun lt!86640 () Unit!5369)

(assert (=> d!53429 (= lt!86642 lt!86640)))

(assert (=> d!53429 (= (getValueByKey!188 lt!86643 (_1!1616 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248)))) (Some!193 (_2!1616 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53429 (= lt!86640 (lemmaContainsTupThenGetReturnValue!100 lt!86643 (_1!1616 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248))) (_2!1616 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53429 (= lt!86643 (insertStrictlySorted!103 (toList!1087 lt!86540) (_1!1616 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248))) (_2!1616 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248)))))))

(assert (=> d!53429 (= (+!249 lt!86540 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248))) lt!86641)))

(declare-fun b!175034 () Bool)

(declare-fun res!82992 () Bool)

(assert (=> b!175034 (=> (not res!82992) (not e!115551))))

(assert (=> b!175034 (= res!82992 (= (getValueByKey!188 (toList!1087 lt!86641) (_1!1616 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248)))) (Some!193 (_2!1616 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248))))))))

(declare-fun b!175035 () Bool)

(assert (=> b!175035 (= e!115551 (contains!1157 (toList!1087 lt!86641) (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248))))))

(assert (= (and d!53429 res!82993) b!175034))

(assert (= (and b!175034 res!82992) b!175035))

(declare-fun m!204111 () Bool)

(assert (=> d!53429 m!204111))

(declare-fun m!204113 () Bool)

(assert (=> d!53429 m!204113))

(declare-fun m!204115 () Bool)

(assert (=> d!53429 m!204115))

(declare-fun m!204117 () Bool)

(assert (=> d!53429 m!204117))

(declare-fun m!204119 () Bool)

(assert (=> b!175034 m!204119))

(declare-fun m!204121 () Bool)

(assert (=> b!175035 m!204121))

(assert (=> b!174826 d!53429))

(declare-fun d!53431 () Bool)

(assert (=> d!53431 (contains!1154 (+!249 lt!86531 (tuple2!3211 lt!86529 (zeroValue!3449 thiss!1248))) lt!86536)))

(declare-fun lt!86646 () Unit!5369)

(declare-fun choose!943 (ListLongMap!2143 (_ BitVec 64) V!5105 (_ BitVec 64)) Unit!5369)

(assert (=> d!53431 (= lt!86646 (choose!943 lt!86531 lt!86529 (zeroValue!3449 thiss!1248) lt!86536))))

(assert (=> d!53431 (contains!1154 lt!86531 lt!86536)))

(assert (=> d!53431 (= (addStillContains!108 lt!86531 lt!86529 (zeroValue!3449 thiss!1248) lt!86536) lt!86646)))

(declare-fun bs!7240 () Bool)

(assert (= bs!7240 d!53431))

(assert (=> bs!7240 m!203927))

(assert (=> bs!7240 m!203927))

(assert (=> bs!7240 m!203929))

(declare-fun m!204123 () Bool)

(assert (=> bs!7240 m!204123))

(declare-fun m!204125 () Bool)

(assert (=> bs!7240 m!204125))

(assert (=> b!174826 d!53431))

(declare-fun d!53433 () Bool)

(declare-fun e!115552 () Bool)

(assert (=> d!53433 e!115552))

(declare-fun res!82995 () Bool)

(assert (=> d!53433 (=> (not res!82995) (not e!115552))))

(declare-fun lt!86648 () ListLongMap!2143)

(assert (=> d!53433 (= res!82995 (contains!1154 lt!86648 (_1!1616 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248)))))))

(declare-fun lt!86650 () List!2194)

(assert (=> d!53433 (= lt!86648 (ListLongMap!2144 lt!86650))))

(declare-fun lt!86649 () Unit!5369)

(declare-fun lt!86647 () Unit!5369)

(assert (=> d!53433 (= lt!86649 lt!86647)))

(assert (=> d!53433 (= (getValueByKey!188 lt!86650 (_1!1616 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248)))) (Some!193 (_2!1616 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248)))))))

(assert (=> d!53433 (= lt!86647 (lemmaContainsTupThenGetReturnValue!100 lt!86650 (_1!1616 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248))) (_2!1616 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248)))))))

(assert (=> d!53433 (= lt!86650 (insertStrictlySorted!103 (toList!1087 lt!86548) (_1!1616 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248))) (_2!1616 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248)))))))

(assert (=> d!53433 (= (+!249 lt!86548 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248))) lt!86648)))

(declare-fun b!175037 () Bool)

(declare-fun res!82994 () Bool)

(assert (=> b!175037 (=> (not res!82994) (not e!115552))))

(assert (=> b!175037 (= res!82994 (= (getValueByKey!188 (toList!1087 lt!86648) (_1!1616 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248)))) (Some!193 (_2!1616 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248))))))))

(declare-fun b!175038 () Bool)

(assert (=> b!175038 (= e!115552 (contains!1157 (toList!1087 lt!86648) (tuple2!3211 lt!86533 (minValue!3449 thiss!1248))))))

(assert (= (and d!53433 res!82995) b!175037))

(assert (= (and b!175037 res!82994) b!175038))

(declare-fun m!204127 () Bool)

(assert (=> d!53433 m!204127))

(declare-fun m!204129 () Bool)

(assert (=> d!53433 m!204129))

(declare-fun m!204131 () Bool)

(assert (=> d!53433 m!204131))

(declare-fun m!204133 () Bool)

(assert (=> d!53433 m!204133))

(declare-fun m!204135 () Bool)

(assert (=> b!175037 m!204135))

(declare-fun m!204137 () Bool)

(assert (=> b!175038 m!204137))

(assert (=> b!174826 d!53433))

(declare-fun d!53435 () Bool)

(assert (=> d!53435 (= (apply!132 (+!249 lt!86548 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248))) lt!86545) (get!1984 (getValueByKey!188 (toList!1087 (+!249 lt!86548 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248)))) lt!86545)))))

(declare-fun bs!7241 () Bool)

(assert (= bs!7241 d!53435))

(declare-fun m!204139 () Bool)

(assert (=> bs!7241 m!204139))

(assert (=> bs!7241 m!204139))

(declare-fun m!204141 () Bool)

(assert (=> bs!7241 m!204141))

(assert (=> b!174826 d!53435))

(declare-fun d!53437 () Bool)

(assert (=> d!53437 (= (apply!132 (+!249 lt!86544 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248))) lt!86549) (get!1984 (getValueByKey!188 (toList!1087 (+!249 lt!86544 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248)))) lt!86549)))))

(declare-fun bs!7242 () Bool)

(assert (= bs!7242 d!53437))

(declare-fun m!204143 () Bool)

(assert (=> bs!7242 m!204143))

(assert (=> bs!7242 m!204143))

(declare-fun m!204145 () Bool)

(assert (=> bs!7242 m!204145))

(assert (=> b!174826 d!53437))

(assert (=> b!174826 d!53397))

(declare-fun d!53439 () Bool)

(declare-fun e!115553 () Bool)

(assert (=> d!53439 e!115553))

(declare-fun res!82997 () Bool)

(assert (=> d!53439 (=> (not res!82997) (not e!115553))))

(declare-fun lt!86652 () ListLongMap!2143)

(assert (=> d!53439 (= res!82997 (contains!1154 lt!86652 (_1!1616 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248)))))))

(declare-fun lt!86654 () List!2194)

(assert (=> d!53439 (= lt!86652 (ListLongMap!2144 lt!86654))))

(declare-fun lt!86653 () Unit!5369)

(declare-fun lt!86651 () Unit!5369)

(assert (=> d!53439 (= lt!86653 lt!86651)))

(assert (=> d!53439 (= (getValueByKey!188 lt!86654 (_1!1616 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248)))) (Some!193 (_2!1616 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248)))))))

(assert (=> d!53439 (= lt!86651 (lemmaContainsTupThenGetReturnValue!100 lt!86654 (_1!1616 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248))) (_2!1616 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248)))))))

(assert (=> d!53439 (= lt!86654 (insertStrictlySorted!103 (toList!1087 lt!86544) (_1!1616 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248))) (_2!1616 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248)))))))

(assert (=> d!53439 (= (+!249 lt!86544 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248))) lt!86652)))

(declare-fun b!175039 () Bool)

(declare-fun res!82996 () Bool)

(assert (=> b!175039 (=> (not res!82996) (not e!115553))))

(assert (=> b!175039 (= res!82996 (= (getValueByKey!188 (toList!1087 lt!86652) (_1!1616 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248)))) (Some!193 (_2!1616 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248))))))))

(declare-fun b!175040 () Bool)

(assert (=> b!175040 (= e!115553 (contains!1157 (toList!1087 lt!86652) (tuple2!3211 lt!86542 (minValue!3449 thiss!1248))))))

(assert (= (and d!53439 res!82997) b!175039))

(assert (= (and b!175039 res!82996) b!175040))

(declare-fun m!204147 () Bool)

(assert (=> d!53439 m!204147))

(declare-fun m!204149 () Bool)

(assert (=> d!53439 m!204149))

(declare-fun m!204151 () Bool)

(assert (=> d!53439 m!204151))

(declare-fun m!204153 () Bool)

(assert (=> d!53439 m!204153))

(declare-fun m!204155 () Bool)

(assert (=> b!175039 m!204155))

(declare-fun m!204157 () Bool)

(assert (=> b!175040 m!204157))

(assert (=> b!174826 d!53439))

(declare-fun d!53441 () Bool)

(assert (=> d!53441 (= (apply!132 (+!249 lt!86548 (tuple2!3211 lt!86533 (minValue!3449 thiss!1248))) lt!86545) (apply!132 lt!86548 lt!86545))))

(declare-fun lt!86655 () Unit!5369)

(assert (=> d!53441 (= lt!86655 (choose!942 lt!86548 lt!86533 (minValue!3449 thiss!1248) lt!86545))))

(declare-fun e!115554 () Bool)

(assert (=> d!53441 e!115554))

(declare-fun res!82998 () Bool)

(assert (=> d!53441 (=> (not res!82998) (not e!115554))))

(assert (=> d!53441 (= res!82998 (contains!1154 lt!86548 lt!86545))))

(assert (=> d!53441 (= (addApplyDifferent!108 lt!86548 lt!86533 (minValue!3449 thiss!1248) lt!86545) lt!86655)))

(declare-fun b!175041 () Bool)

(assert (=> b!175041 (= e!115554 (not (= lt!86545 lt!86533)))))

(assert (= (and d!53441 res!82998) b!175041))

(declare-fun m!204159 () Bool)

(assert (=> d!53441 m!204159))

(assert (=> d!53441 m!203921))

(assert (=> d!53441 m!203923))

(assert (=> d!53441 m!203909))

(assert (=> d!53441 m!203921))

(declare-fun m!204161 () Bool)

(assert (=> d!53441 m!204161))

(assert (=> b!174826 d!53441))

(declare-fun d!53443 () Bool)

(assert (=> d!53443 (= (apply!132 (+!249 lt!86540 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248))) lt!86543) (get!1984 (getValueByKey!188 (toList!1087 (+!249 lt!86540 (tuple2!3211 lt!86538 (zeroValue!3449 thiss!1248)))) lt!86543)))))

(declare-fun bs!7243 () Bool)

(assert (= bs!7243 d!53443))

(declare-fun m!204163 () Bool)

(assert (=> bs!7243 m!204163))

(assert (=> bs!7243 m!204163))

(declare-fun m!204165 () Bool)

(assert (=> bs!7243 m!204165))

(assert (=> b!174826 d!53443))

(declare-fun d!53445 () Bool)

(assert (=> d!53445 (= (apply!132 lt!86540 lt!86543) (get!1984 (getValueByKey!188 (toList!1087 lt!86540) lt!86543)))))

(declare-fun bs!7244 () Bool)

(assert (= bs!7244 d!53445))

(declare-fun m!204167 () Bool)

(assert (=> bs!7244 m!204167))

(assert (=> bs!7244 m!204167))

(declare-fun m!204169 () Bool)

(assert (=> bs!7244 m!204169))

(assert (=> b!174826 d!53445))

(declare-fun d!53447 () Bool)

(assert (=> d!53447 (= (apply!132 (+!249 lt!86544 (tuple2!3211 lt!86542 (minValue!3449 thiss!1248))) lt!86549) (apply!132 lt!86544 lt!86549))))

(declare-fun lt!86656 () Unit!5369)

(assert (=> d!53447 (= lt!86656 (choose!942 lt!86544 lt!86542 (minValue!3449 thiss!1248) lt!86549))))

(declare-fun e!115555 () Bool)

(assert (=> d!53447 e!115555))

(declare-fun res!82999 () Bool)

(assert (=> d!53447 (=> (not res!82999) (not e!115555))))

(assert (=> d!53447 (= res!82999 (contains!1154 lt!86544 lt!86549))))

(assert (=> d!53447 (= (addApplyDifferent!108 lt!86544 lt!86542 (minValue!3449 thiss!1248) lt!86549) lt!86656)))

(declare-fun b!175042 () Bool)

(assert (=> b!175042 (= e!115555 (not (= lt!86549 lt!86542)))))

(assert (= (and d!53447 res!82999) b!175042))

(declare-fun m!204171 () Bool)

(assert (=> d!53447 m!204171))

(assert (=> d!53447 m!203931))

(assert (=> d!53447 m!203935))

(assert (=> d!53447 m!203913))

(assert (=> d!53447 m!203931))

(declare-fun m!204173 () Bool)

(assert (=> d!53447 m!204173))

(assert (=> b!174826 d!53447))

(declare-fun d!53449 () Bool)

(assert (=> d!53449 (= (apply!132 lt!86530 (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000)) (get!1984 (getValueByKey!188 (toList!1087 lt!86530) (select (arr!3470 (_keys!5452 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7245 () Bool)

(assert (= bs!7245 d!53449))

(assert (=> bs!7245 m!203925))

(assert (=> bs!7245 m!203987))

(assert (=> bs!7245 m!203987))

(declare-fun m!204175 () Bool)

(assert (=> bs!7245 m!204175))

(assert (=> b!174835 d!53449))

(declare-fun d!53451 () Bool)

(declare-fun c!31354 () Bool)

(assert (=> d!53451 (= c!31354 ((_ is ValueCellFull!1703) (select (arr!3471 (_values!3591 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115558 () V!5105)

(assert (=> d!53451 (= (get!1983 (select (arr!3471 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!115558)))

(declare-fun b!175047 () Bool)

(declare-fun get!1985 (ValueCell!1703 V!5105) V!5105)

(assert (=> b!175047 (= e!115558 (get!1985 (select (arr!3471 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175048 () Bool)

(declare-fun get!1986 (ValueCell!1703 V!5105) V!5105)

(assert (=> b!175048 (= e!115558 (get!1986 (select (arr!3471 (_values!3591 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3608 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53451 c!31354) b!175047))

(assert (= (and d!53451 (not c!31354)) b!175048))

(assert (=> b!175047 m!203947))

(assert (=> b!175047 m!203949))

(declare-fun m!204177 () Bool)

(assert (=> b!175047 m!204177))

(assert (=> b!175048 m!203947))

(assert (=> b!175048 m!203949))

(declare-fun m!204179 () Bool)

(assert (=> b!175048 m!204179))

(assert (=> b!174835 d!53451))

(declare-fun d!53453 () Bool)

(declare-fun e!115559 () Bool)

(assert (=> d!53453 e!115559))

(declare-fun res!83000 () Bool)

(assert (=> d!53453 (=> res!83000 e!115559)))

(declare-fun lt!86660 () Bool)

(assert (=> d!53453 (= res!83000 (not lt!86660))))

(declare-fun lt!86657 () Bool)

(assert (=> d!53453 (= lt!86660 lt!86657)))

(declare-fun lt!86659 () Unit!5369)

(declare-fun e!115560 () Unit!5369)

(assert (=> d!53453 (= lt!86659 e!115560)))

(declare-fun c!31355 () Bool)

(assert (=> d!53453 (= c!31355 lt!86657)))

(assert (=> d!53453 (= lt!86657 (containsKey!191 (toList!1087 lt!86530) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53453 (= (contains!1154 lt!86530 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86660)))

(declare-fun b!175049 () Bool)

(declare-fun lt!86658 () Unit!5369)

(assert (=> b!175049 (= e!115560 lt!86658)))

(assert (=> b!175049 (= lt!86658 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1087 lt!86530) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175049 (isDefined!140 (getValueByKey!188 (toList!1087 lt!86530) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175050 () Bool)

(declare-fun Unit!5376 () Unit!5369)

(assert (=> b!175050 (= e!115560 Unit!5376)))

(declare-fun b!175051 () Bool)

(assert (=> b!175051 (= e!115559 (isDefined!140 (getValueByKey!188 (toList!1087 lt!86530) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53453 c!31355) b!175049))

(assert (= (and d!53453 (not c!31355)) b!175050))

(assert (= (and d!53453 (not res!83000)) b!175051))

(declare-fun m!204181 () Bool)

(assert (=> d!53453 m!204181))

(declare-fun m!204183 () Bool)

(assert (=> b!175049 m!204183))

(assert (=> b!175049 m!203979))

(assert (=> b!175049 m!203979))

(declare-fun m!204185 () Bool)

(assert (=> b!175049 m!204185))

(assert (=> b!175051 m!203979))

(assert (=> b!175051 m!203979))

(assert (=> b!175051 m!204185))

(assert (=> bm!17696 d!53453))

(declare-fun condMapEmpty!6984 () Bool)

(declare-fun mapDefault!6984 () ValueCell!1703)

(assert (=> mapNonEmpty!6983 (= condMapEmpty!6984 (= mapRest!6983 ((as const (Array (_ BitVec 32) ValueCell!1703)) mapDefault!6984)))))

(declare-fun e!115562 () Bool)

(declare-fun mapRes!6984 () Bool)

(assert (=> mapNonEmpty!6983 (= tp!15650 (and e!115562 mapRes!6984))))

(declare-fun b!175053 () Bool)

(assert (=> b!175053 (= e!115562 tp_is_empty!4093)))

(declare-fun mapIsEmpty!6984 () Bool)

(assert (=> mapIsEmpty!6984 mapRes!6984))

(declare-fun b!175052 () Bool)

(declare-fun e!115561 () Bool)

(assert (=> b!175052 (= e!115561 tp_is_empty!4093)))

(declare-fun mapNonEmpty!6984 () Bool)

(declare-fun tp!15651 () Bool)

(assert (=> mapNonEmpty!6984 (= mapRes!6984 (and tp!15651 e!115561))))

(declare-fun mapValue!6984 () ValueCell!1703)

(declare-fun mapKey!6984 () (_ BitVec 32))

(declare-fun mapRest!6984 () (Array (_ BitVec 32) ValueCell!1703))

(assert (=> mapNonEmpty!6984 (= mapRest!6983 (store mapRest!6984 mapKey!6984 mapValue!6984))))

(assert (= (and mapNonEmpty!6983 condMapEmpty!6984) mapIsEmpty!6984))

(assert (= (and mapNonEmpty!6983 (not condMapEmpty!6984)) mapNonEmpty!6984))

(assert (= (and mapNonEmpty!6984 ((_ is ValueCellFull!1703) mapValue!6984)) b!175052))

(assert (= (and mapNonEmpty!6983 ((_ is ValueCellFull!1703) mapDefault!6984)) b!175053))

(declare-fun m!204187 () Bool)

(assert (=> mapNonEmpty!6984 m!204187))

(declare-fun b_lambda!7017 () Bool)

(assert (= b_lambda!7015 (or (and b!174690 b_free!4321) b_lambda!7017)))

(declare-fun b_lambda!7019 () Bool)

(assert (= b_lambda!7013 (or (and b!174690 b_free!4321) b_lambda!7019)))

(check-sat (not b_lambda!7011) (not b!174902) (not d!53403) (not d!53443) (not b!174996) (not d!53431) (not d!53437) (not d!53383) (not bm!17704) (not d!53421) (not d!53441) (not b!174927) (not b!175037) (not d!53415) (not b!174997) (not d!53445) (not b!174934) (not b!174977) (not b!174878) (not bm!17701) (not b!175049) (not d!53411) (not d!53391) (not b!174953) (not b!174931) (not b!175048) (not b!174973) (not b!174951) tp_is_empty!4093 (not b!175027) (not d!53407) (not b!174954) (not b!174867) (not b!175038) (not d!53413) (not d!53425) (not b!175034) (not b!174935) (not b!174995) (not b!174956) (not b!174868) (not b!174936) (not d!53429) (not d!53389) (not b!174937) (not b!174930) (not b!174952) (not d!53427) (not bm!17710) (not b_lambda!7017) (not b!174893) (not b_lambda!7019) (not b!175040) (not d!53405) (not b!174894) (not d!53397) (not b!175047) (not b!174884) (not d!53401) (not b!175039) (not d!53423) (not b!175028) (not b!175029) (not d!53387) (not b!174882) (not d!53449) (not d!53419) b_and!10813 (not d!53439) (not b!175025) (not d!53433) (not b!174929) (not d!53447) (not d!53435) (not b!174988) (not b!175051) (not b!175023) (not d!53453) (not mapNonEmpty!6984) (not b!174994) (not b!175035) (not b_next!4321) (not bm!17707))
(check-sat b_and!10813 (not b_next!4321))
