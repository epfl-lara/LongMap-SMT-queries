; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24866 () Bool)

(assert start!24866)

(declare-fun b!259628 () Bool)

(declare-fun b_free!6753 () Bool)

(declare-fun b_next!6753 () Bool)

(assert (=> b!259628 (= b_free!6753 (not b_next!6753))))

(declare-fun tp!23578 () Bool)

(declare-fun b_and!13855 () Bool)

(assert (=> b!259628 (= tp!23578 b_and!13855)))

(declare-fun b!259622 () Bool)

(declare-fun e!168259 () Bool)

(declare-fun e!168271 () Bool)

(declare-fun mapRes!11270 () Bool)

(assert (=> b!259622 (= e!168259 (and e!168271 mapRes!11270))))

(declare-fun condMapEmpty!11270 () Bool)

(declare-datatypes ((V!8467 0))(
  ( (V!8468 (val!3352 Int)) )
))
(declare-datatypes ((ValueCell!2964 0))(
  ( (ValueCellFull!2964 (v!5462 V!8467)) (EmptyCell!2964) )
))
(declare-datatypes ((array!12581 0))(
  ( (array!12582 (arr!5956 (Array (_ BitVec 32) ValueCell!2964)) (size!6305 (_ BitVec 32))) )
))
(declare-datatypes ((array!12583 0))(
  ( (array!12584 (arr!5957 (Array (_ BitVec 32) (_ BitVec 64))) (size!6306 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3828 0))(
  ( (LongMapFixedSize!3829 (defaultEntry!4787 Int) (mask!11106 (_ BitVec 32)) (extraKeys!4524 (_ BitVec 32)) (zeroValue!4628 V!8467) (minValue!4628 V!8467) (_size!1963 (_ BitVec 32)) (_keys!6965 array!12583) (_values!4770 array!12581) (_vacant!1963 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3828)

(declare-fun mapDefault!11270 () ValueCell!2964)

(assert (=> b!259622 (= condMapEmpty!11270 (= (arr!5956 (_values!4770 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2964)) mapDefault!11270)))))

(declare-fun res!126920 () Bool)

(declare-fun e!168270 () Bool)

(assert (=> start!24866 (=> (not res!126920) (not e!168270))))

(declare-fun valid!1495 (LongMapFixedSize!3828) Bool)

(assert (=> start!24866 (= res!126920 (valid!1495 thiss!1504))))

(assert (=> start!24866 e!168270))

(declare-fun e!168265 () Bool)

(assert (=> start!24866 e!168265))

(assert (=> start!24866 true))

(declare-fun tp_is_empty!6615 () Bool)

(assert (=> start!24866 tp_is_empty!6615))

(declare-fun b!259623 () Bool)

(declare-fun e!168262 () Bool)

(declare-fun call!24723 () Bool)

(assert (=> b!259623 (= e!168262 (not call!24723))))

(declare-fun b!259624 () Bool)

(declare-fun res!126916 () Bool)

(assert (=> b!259624 (=> (not res!126916) (not e!168262))))

(declare-datatypes ((SeekEntryResult!1180 0))(
  ( (MissingZero!1180 (index!6890 (_ BitVec 32))) (Found!1180 (index!6891 (_ BitVec 32))) (Intermediate!1180 (undefined!1992 Bool) (index!6892 (_ BitVec 32)) (x!25100 (_ BitVec 32))) (Undefined!1180) (MissingVacant!1180 (index!6893 (_ BitVec 32))) )
))
(declare-fun lt!130834 () SeekEntryResult!1180)

(assert (=> b!259624 (= res!126916 (= (select (arr!5957 (_keys!6965 thiss!1504)) (index!6890 lt!130834)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!11270 () Bool)

(assert (=> mapIsEmpty!11270 mapRes!11270))

(declare-fun b!259625 () Bool)

(declare-fun e!168266 () Bool)

(get-info :version)

(assert (=> b!259625 (= e!168266 ((_ is Undefined!1180) lt!130834))))

(declare-fun b!259626 () Bool)

(declare-datatypes ((Unit!8073 0))(
  ( (Unit!8074) )
))
(declare-fun e!168264 () Unit!8073)

(declare-fun lt!130832 () Unit!8073)

(assert (=> b!259626 (= e!168264 lt!130832)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!443 (array!12583 array!12581 (_ BitVec 32) (_ BitVec 32) V!8467 V!8467 (_ BitVec 64) Int) Unit!8073)

(assert (=> b!259626 (= lt!130832 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!443 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) key!932 (defaultEntry!4787 thiss!1504)))))

(declare-fun c!44077 () Bool)

(assert (=> b!259626 (= c!44077 ((_ is MissingZero!1180) lt!130834))))

(declare-fun e!168267 () Bool)

(assert (=> b!259626 e!168267))

(declare-fun bm!24719 () Bool)

(declare-fun arrayContainsKey!0 (array!12583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24719 (= call!24723 (arrayContainsKey!0 (_keys!6965 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11270 () Bool)

(declare-fun tp!23579 () Bool)

(declare-fun e!168261 () Bool)

(assert (=> mapNonEmpty!11270 (= mapRes!11270 (and tp!23579 e!168261))))

(declare-fun mapValue!11270 () ValueCell!2964)

(declare-fun mapKey!11270 () (_ BitVec 32))

(declare-fun mapRest!11270 () (Array (_ BitVec 32) ValueCell!2964))

(assert (=> mapNonEmpty!11270 (= (arr!5956 (_values!4770 thiss!1504)) (store mapRest!11270 mapKey!11270 mapValue!11270))))

(declare-fun b!259627 () Bool)

(declare-fun e!168263 () Bool)

(declare-fun e!168260 () Bool)

(assert (=> b!259627 (= e!168263 (not e!168260))))

(declare-fun res!126914 () Bool)

(assert (=> b!259627 (=> res!126914 e!168260)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!259627 (= res!126914 (not (validMask!0 (mask!11106 thiss!1504))))))

(declare-fun lt!130839 () array!12583)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12583 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!259627 (= (arrayCountValidKeys!0 lt!130839 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!130827 () Unit!8073)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12583 (_ BitVec 32)) Unit!8073)

(assert (=> b!259627 (= lt!130827 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130839 index!297))))

(assert (=> b!259627 (arrayContainsKey!0 lt!130839 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130833 () Unit!8073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12583 (_ BitVec 64) (_ BitVec 32)) Unit!8073)

(assert (=> b!259627 (= lt!130833 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130839 key!932 index!297))))

(declare-datatypes ((tuple2!4944 0))(
  ( (tuple2!4945 (_1!2483 (_ BitVec 64)) (_2!2483 V!8467)) )
))
(declare-datatypes ((List!3822 0))(
  ( (Nil!3819) (Cons!3818 (h!4482 tuple2!4944) (t!8889 List!3822)) )
))
(declare-datatypes ((ListLongMap!3857 0))(
  ( (ListLongMap!3858 (toList!1944 List!3822)) )
))
(declare-fun lt!130837 () ListLongMap!3857)

(declare-fun v!346 () V!8467)

(declare-fun +!697 (ListLongMap!3857 tuple2!4944) ListLongMap!3857)

(declare-fun getCurrentListMap!1472 (array!12583 array!12581 (_ BitVec 32) (_ BitVec 32) V!8467 V!8467 (_ BitVec 32) Int) ListLongMap!3857)

(assert (=> b!259627 (= (+!697 lt!130837 (tuple2!4945 key!932 v!346)) (getCurrentListMap!1472 lt!130839 (array!12582 (store (arr!5956 (_values!4770 thiss!1504)) index!297 (ValueCellFull!2964 v!346)) (size!6305 (_values!4770 thiss!1504))) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun lt!130840 () Unit!8073)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!107 (array!12583 array!12581 (_ BitVec 32) (_ BitVec 32) V!8467 V!8467 (_ BitVec 32) (_ BitVec 64) V!8467 Int) Unit!8073)

(assert (=> b!259627 (= lt!130840 (lemmaAddValidKeyToArrayThenAddPairToListMap!107 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) index!297 key!932 v!346 (defaultEntry!4787 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12583 (_ BitVec 32)) Bool)

(assert (=> b!259627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130839 (mask!11106 thiss!1504))))

(declare-fun lt!130838 () Unit!8073)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12583 (_ BitVec 32) (_ BitVec 32)) Unit!8073)

(assert (=> b!259627 (= lt!130838 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6965 thiss!1504) index!297 (mask!11106 thiss!1504)))))

(assert (=> b!259627 (= (arrayCountValidKeys!0 lt!130839 #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6965 thiss!1504) #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504)))))))

(declare-fun lt!130835 () Unit!8073)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12583 (_ BitVec 32) (_ BitVec 64)) Unit!8073)

(assert (=> b!259627 (= lt!130835 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6965 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3823 0))(
  ( (Nil!3820) (Cons!3819 (h!4483 (_ BitVec 64)) (t!8890 List!3823)) )
))
(declare-fun arrayNoDuplicates!0 (array!12583 (_ BitVec 32) List!3823) Bool)

(assert (=> b!259627 (arrayNoDuplicates!0 lt!130839 #b00000000000000000000000000000000 Nil!3820)))

(assert (=> b!259627 (= lt!130839 (array!12584 (store (arr!5957 (_keys!6965 thiss!1504)) index!297 key!932) (size!6306 (_keys!6965 thiss!1504))))))

(declare-fun lt!130828 () Unit!8073)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3823) Unit!8073)

(assert (=> b!259627 (= lt!130828 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6965 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3820))))

(declare-fun lt!130836 () Unit!8073)

(declare-fun e!168272 () Unit!8073)

(assert (=> b!259627 (= lt!130836 e!168272)))

(declare-fun c!44079 () Bool)

(assert (=> b!259627 (= c!44079 (arrayContainsKey!0 (_keys!6965 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3935 (array!12583) Bool)

(declare-fun array_inv!3936 (array!12581) Bool)

(assert (=> b!259628 (= e!168265 (and tp!23578 tp_is_empty!6615 (array_inv!3935 (_keys!6965 thiss!1504)) (array_inv!3936 (_values!4770 thiss!1504)) e!168259))))

(declare-fun b!259629 () Bool)

(assert (=> b!259629 (= e!168271 tp_is_empty!6615)))

(declare-fun b!259630 () Bool)

(declare-fun res!126913 () Bool)

(assert (=> b!259630 (= res!126913 (= (select (arr!5957 (_keys!6965 thiss!1504)) (index!6893 lt!130834)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168269 () Bool)

(assert (=> b!259630 (=> (not res!126913) (not e!168269))))

(declare-fun b!259631 () Bool)

(declare-fun e!168268 () Bool)

(assert (=> b!259631 (= e!168270 e!168268)))

(declare-fun res!126917 () Bool)

(assert (=> b!259631 (=> (not res!126917) (not e!168268))))

(assert (=> b!259631 (= res!126917 (or (= lt!130834 (MissingZero!1180 index!297)) (= lt!130834 (MissingVacant!1180 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12583 (_ BitVec 32)) SeekEntryResult!1180)

(assert (=> b!259631 (= lt!130834 (seekEntryOrOpen!0 key!932 (_keys!6965 thiss!1504) (mask!11106 thiss!1504)))))

(declare-fun b!259632 () Bool)

(assert (=> b!259632 (= e!168266 e!168269)))

(declare-fun res!126912 () Bool)

(declare-fun call!24722 () Bool)

(assert (=> b!259632 (= res!126912 call!24722)))

(assert (=> b!259632 (=> (not res!126912) (not e!168269))))

(declare-fun b!259633 () Bool)

(declare-fun Unit!8075 () Unit!8073)

(assert (=> b!259633 (= e!168272 Unit!8075)))

(declare-fun b!259634 () Bool)

(assert (=> b!259634 (= e!168269 (not call!24723))))

(declare-fun b!259635 () Bool)

(declare-fun Unit!8076 () Unit!8073)

(assert (=> b!259635 (= e!168264 Unit!8076)))

(declare-fun lt!130831 () Unit!8073)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!440 (array!12583 array!12581 (_ BitVec 32) (_ BitVec 32) V!8467 V!8467 (_ BitVec 64) Int) Unit!8073)

(assert (=> b!259635 (= lt!130831 (lemmaInListMapThenSeekEntryOrOpenFindsIt!440 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) key!932 (defaultEntry!4787 thiss!1504)))))

(assert (=> b!259635 false))

(declare-fun b!259636 () Bool)

(assert (=> b!259636 (= e!168261 tp_is_empty!6615)))

(declare-fun b!259637 () Bool)

(assert (=> b!259637 (= e!168268 e!168263)))

(declare-fun res!126915 () Bool)

(assert (=> b!259637 (=> (not res!126915) (not e!168263))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!259637 (= res!126915 (inRange!0 index!297 (mask!11106 thiss!1504)))))

(declare-fun lt!130830 () Unit!8073)

(assert (=> b!259637 (= lt!130830 e!168264)))

(declare-fun c!44080 () Bool)

(declare-fun contains!1887 (ListLongMap!3857 (_ BitVec 64)) Bool)

(assert (=> b!259637 (= c!44080 (contains!1887 lt!130837 key!932))))

(assert (=> b!259637 (= lt!130837 (getCurrentListMap!1472 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun bm!24720 () Bool)

(assert (=> bm!24720 (= call!24722 (inRange!0 (ite c!44077 (index!6890 lt!130834) (index!6893 lt!130834)) (mask!11106 thiss!1504)))))

(declare-fun b!259638 () Bool)

(declare-fun c!44078 () Bool)

(assert (=> b!259638 (= c!44078 ((_ is MissingVacant!1180) lt!130834))))

(assert (=> b!259638 (= e!168267 e!168266)))

(declare-fun b!259639 () Bool)

(assert (=> b!259639 (= e!168260 (or (not (= (size!6305 (_values!4770 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11106 thiss!1504)))) (not (= (size!6306 (_keys!6965 thiss!1504)) (size!6305 (_values!4770 thiss!1504)))) (bvsge (mask!11106 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!259640 () Bool)

(declare-fun res!126919 () Bool)

(assert (=> b!259640 (=> (not res!126919) (not e!168270))))

(assert (=> b!259640 (= res!126919 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!259641 () Bool)

(declare-fun res!126918 () Bool)

(assert (=> b!259641 (=> (not res!126918) (not e!168262))))

(assert (=> b!259641 (= res!126918 call!24722)))

(assert (=> b!259641 (= e!168267 e!168262)))

(declare-fun b!259642 () Bool)

(declare-fun Unit!8077 () Unit!8073)

(assert (=> b!259642 (= e!168272 Unit!8077)))

(declare-fun lt!130829 () Unit!8073)

(declare-fun lemmaArrayContainsKeyThenInListMap!249 (array!12583 array!12581 (_ BitVec 32) (_ BitVec 32) V!8467 V!8467 (_ BitVec 64) (_ BitVec 32) Int) Unit!8073)

(assert (=> b!259642 (= lt!130829 (lemmaArrayContainsKeyThenInListMap!249 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(assert (=> b!259642 false))

(assert (= (and start!24866 res!126920) b!259640))

(assert (= (and b!259640 res!126919) b!259631))

(assert (= (and b!259631 res!126917) b!259637))

(assert (= (and b!259637 c!44080) b!259635))

(assert (= (and b!259637 (not c!44080)) b!259626))

(assert (= (and b!259626 c!44077) b!259641))

(assert (= (and b!259626 (not c!44077)) b!259638))

(assert (= (and b!259641 res!126918) b!259624))

(assert (= (and b!259624 res!126916) b!259623))

(assert (= (and b!259638 c!44078) b!259632))

(assert (= (and b!259638 (not c!44078)) b!259625))

(assert (= (and b!259632 res!126912) b!259630))

(assert (= (and b!259630 res!126913) b!259634))

(assert (= (or b!259641 b!259632) bm!24720))

(assert (= (or b!259623 b!259634) bm!24719))

(assert (= (and b!259637 res!126915) b!259627))

(assert (= (and b!259627 c!44079) b!259642))

(assert (= (and b!259627 (not c!44079)) b!259633))

(assert (= (and b!259627 (not res!126914)) b!259639))

(assert (= (and b!259622 condMapEmpty!11270) mapIsEmpty!11270))

(assert (= (and b!259622 (not condMapEmpty!11270)) mapNonEmpty!11270))

(assert (= (and mapNonEmpty!11270 ((_ is ValueCellFull!2964) mapValue!11270)) b!259636))

(assert (= (and b!259622 ((_ is ValueCellFull!2964) mapDefault!11270)) b!259629))

(assert (= b!259628 b!259622))

(assert (= start!24866 b!259628))

(declare-fun m!275323 () Bool)

(assert (=> b!259642 m!275323))

(declare-fun m!275325 () Bool)

(assert (=> bm!24719 m!275325))

(declare-fun m!275327 () Bool)

(assert (=> b!259637 m!275327))

(declare-fun m!275329 () Bool)

(assert (=> b!259637 m!275329))

(declare-fun m!275331 () Bool)

(assert (=> b!259637 m!275331))

(declare-fun m!275333 () Bool)

(assert (=> b!259624 m!275333))

(declare-fun m!275335 () Bool)

(assert (=> bm!24720 m!275335))

(declare-fun m!275337 () Bool)

(assert (=> b!259635 m!275337))

(declare-fun m!275339 () Bool)

(assert (=> b!259628 m!275339))

(declare-fun m!275341 () Bool)

(assert (=> b!259628 m!275341))

(declare-fun m!275343 () Bool)

(assert (=> b!259630 m!275343))

(declare-fun m!275345 () Bool)

(assert (=> start!24866 m!275345))

(declare-fun m!275347 () Bool)

(assert (=> mapNonEmpty!11270 m!275347))

(declare-fun m!275349 () Bool)

(assert (=> b!259627 m!275349))

(declare-fun m!275351 () Bool)

(assert (=> b!259627 m!275351))

(declare-fun m!275353 () Bool)

(assert (=> b!259627 m!275353))

(declare-fun m!275355 () Bool)

(assert (=> b!259627 m!275355))

(declare-fun m!275357 () Bool)

(assert (=> b!259627 m!275357))

(declare-fun m!275359 () Bool)

(assert (=> b!259627 m!275359))

(declare-fun m!275361 () Bool)

(assert (=> b!259627 m!275361))

(declare-fun m!275363 () Bool)

(assert (=> b!259627 m!275363))

(declare-fun m!275365 () Bool)

(assert (=> b!259627 m!275365))

(declare-fun m!275367 () Bool)

(assert (=> b!259627 m!275367))

(declare-fun m!275369 () Bool)

(assert (=> b!259627 m!275369))

(declare-fun m!275371 () Bool)

(assert (=> b!259627 m!275371))

(assert (=> b!259627 m!275325))

(declare-fun m!275373 () Bool)

(assert (=> b!259627 m!275373))

(declare-fun m!275375 () Bool)

(assert (=> b!259627 m!275375))

(declare-fun m!275377 () Bool)

(assert (=> b!259627 m!275377))

(declare-fun m!275379 () Bool)

(assert (=> b!259627 m!275379))

(declare-fun m!275381 () Bool)

(assert (=> b!259627 m!275381))

(declare-fun m!275383 () Bool)

(assert (=> b!259626 m!275383))

(declare-fun m!275385 () Bool)

(assert (=> b!259631 m!275385))

(check-sat (not b!259628) (not b!259631) (not mapNonEmpty!11270) (not bm!24719) (not b!259635) b_and!13855 (not b_next!6753) (not bm!24720) (not b!259642) (not start!24866) (not b!259627) (not b!259626) (not b!259637) tp_is_empty!6615)
(check-sat b_and!13855 (not b_next!6753))
(get-model)

(declare-fun d!62391 () Bool)

(assert (=> d!62391 (= (inRange!0 (ite c!44077 (index!6890 lt!130834) (index!6893 lt!130834)) (mask!11106 thiss!1504)) (and (bvsge (ite c!44077 (index!6890 lt!130834) (index!6893 lt!130834)) #b00000000000000000000000000000000) (bvslt (ite c!44077 (index!6890 lt!130834) (index!6893 lt!130834)) (bvadd (mask!11106 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24720 d!62391))

(declare-fun d!62393 () Bool)

(assert (=> d!62393 (= (array_inv!3935 (_keys!6965 thiss!1504)) (bvsge (size!6306 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259628 d!62393))

(declare-fun d!62395 () Bool)

(assert (=> d!62395 (= (array_inv!3936 (_values!4770 thiss!1504)) (bvsge (size!6305 (_values!4770 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259628 d!62395))

(declare-fun d!62397 () Bool)

(assert (=> d!62397 (= (inRange!0 index!297 (mask!11106 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11106 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!259637 d!62397))

(declare-fun d!62399 () Bool)

(declare-fun e!168324 () Bool)

(assert (=> d!62399 e!168324))

(declare-fun res!126950 () Bool)

(assert (=> d!62399 (=> res!126950 e!168324)))

(declare-fun lt!130893 () Bool)

(assert (=> d!62399 (= res!126950 (not lt!130893))))

(declare-fun lt!130892 () Bool)

(assert (=> d!62399 (= lt!130893 lt!130892)))

(declare-fun lt!130891 () Unit!8073)

(declare-fun e!168323 () Unit!8073)

(assert (=> d!62399 (= lt!130891 e!168323)))

(declare-fun c!44095 () Bool)

(assert (=> d!62399 (= c!44095 lt!130892)))

(declare-fun containsKey!307 (List!3822 (_ BitVec 64)) Bool)

(assert (=> d!62399 (= lt!130892 (containsKey!307 (toList!1944 lt!130837) key!932))))

(assert (=> d!62399 (= (contains!1887 lt!130837 key!932) lt!130893)))

(declare-fun b!259712 () Bool)

(declare-fun lt!130894 () Unit!8073)

(assert (=> b!259712 (= e!168323 lt!130894)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!255 (List!3822 (_ BitVec 64)) Unit!8073)

(assert (=> b!259712 (= lt!130894 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1944 lt!130837) key!932))))

(declare-datatypes ((Option!321 0))(
  ( (Some!320 (v!5466 V!8467)) (None!319) )
))
(declare-fun isDefined!256 (Option!321) Bool)

(declare-fun getValueByKey!315 (List!3822 (_ BitVec 64)) Option!321)

(assert (=> b!259712 (isDefined!256 (getValueByKey!315 (toList!1944 lt!130837) key!932))))

(declare-fun b!259713 () Bool)

(declare-fun Unit!8081 () Unit!8073)

(assert (=> b!259713 (= e!168323 Unit!8081)))

(declare-fun b!259714 () Bool)

(assert (=> b!259714 (= e!168324 (isDefined!256 (getValueByKey!315 (toList!1944 lt!130837) key!932)))))

(assert (= (and d!62399 c!44095) b!259712))

(assert (= (and d!62399 (not c!44095)) b!259713))

(assert (= (and d!62399 (not res!126950)) b!259714))

(declare-fun m!275451 () Bool)

(assert (=> d!62399 m!275451))

(declare-fun m!275453 () Bool)

(assert (=> b!259712 m!275453))

(declare-fun m!275455 () Bool)

(assert (=> b!259712 m!275455))

(assert (=> b!259712 m!275455))

(declare-fun m!275457 () Bool)

(assert (=> b!259712 m!275457))

(assert (=> b!259714 m!275455))

(assert (=> b!259714 m!275455))

(assert (=> b!259714 m!275457))

(assert (=> b!259637 d!62399))

(declare-fun bm!24741 () Bool)

(declare-fun call!24745 () ListLongMap!3857)

(declare-fun call!24749 () ListLongMap!3857)

(assert (=> bm!24741 (= call!24745 call!24749)))

(declare-fun b!259757 () Bool)

(declare-fun e!168360 () Bool)

(declare-fun lt!130960 () ListLongMap!3857)

(declare-fun apply!257 (ListLongMap!3857 (_ BitVec 64)) V!8467)

(declare-fun get!3068 (ValueCell!2964 V!8467) V!8467)

(declare-fun dynLambda!600 (Int (_ BitVec 64)) V!8467)

(assert (=> b!259757 (= e!168360 (= (apply!257 lt!130960 (select (arr!5957 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000)) (get!3068 (select (arr!5956 (_values!4770 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!600 (defaultEntry!4787 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259757 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6305 (_values!4770 thiss!1504))))))

(assert (=> b!259757 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))))))

(declare-fun b!259758 () Bool)

(declare-fun e!168358 () Unit!8073)

(declare-fun Unit!8082 () Unit!8073)

(assert (=> b!259758 (= e!168358 Unit!8082)))

(declare-fun b!259759 () Bool)

(declare-fun e!168352 () ListLongMap!3857)

(declare-fun e!168356 () ListLongMap!3857)

(assert (=> b!259759 (= e!168352 e!168356)))

(declare-fun c!44109 () Bool)

(assert (=> b!259759 (= c!44109 (and (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259760 () Bool)

(declare-fun e!168361 () ListLongMap!3857)

(assert (=> b!259760 (= e!168361 call!24745)))

(declare-fun b!259761 () Bool)

(declare-fun c!44108 () Bool)

(assert (=> b!259761 (= c!44108 (and (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!259761 (= e!168356 e!168361)))

(declare-fun b!259762 () Bool)

(declare-fun res!126973 () Bool)

(declare-fun e!168357 () Bool)

(assert (=> b!259762 (=> (not res!126973) (not e!168357))))

(declare-fun e!168363 () Bool)

(assert (=> b!259762 (= res!126973 e!168363)))

(declare-fun res!126972 () Bool)

(assert (=> b!259762 (=> res!126972 e!168363)))

(declare-fun e!168353 () Bool)

(assert (=> b!259762 (= res!126972 (not e!168353))))

(declare-fun res!126971 () Bool)

(assert (=> b!259762 (=> (not res!126971) (not e!168353))))

(assert (=> b!259762 (= res!126971 (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))))))

(declare-fun b!259763 () Bool)

(declare-fun call!24744 () ListLongMap!3857)

(assert (=> b!259763 (= e!168361 call!24744)))

(declare-fun bm!24742 () Bool)

(declare-fun call!24750 () Bool)

(assert (=> bm!24742 (= call!24750 (contains!1887 lt!130960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259764 () Bool)

(declare-fun lt!130955 () Unit!8073)

(assert (=> b!259764 (= e!168358 lt!130955)))

(declare-fun lt!130946 () ListLongMap!3857)

(declare-fun getCurrentListMapNoExtraKeys!579 (array!12583 array!12581 (_ BitVec 32) (_ BitVec 32) V!8467 V!8467 (_ BitVec 32) Int) ListLongMap!3857)

(assert (=> b!259764 (= lt!130946 (getCurrentListMapNoExtraKeys!579 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun lt!130958 () (_ BitVec 64))

(assert (=> b!259764 (= lt!130958 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130952 () (_ BitVec 64))

(assert (=> b!259764 (= lt!130952 (select (arr!5957 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130940 () Unit!8073)

(declare-fun addStillContains!233 (ListLongMap!3857 (_ BitVec 64) V!8467 (_ BitVec 64)) Unit!8073)

(assert (=> b!259764 (= lt!130940 (addStillContains!233 lt!130946 lt!130958 (zeroValue!4628 thiss!1504) lt!130952))))

(assert (=> b!259764 (contains!1887 (+!697 lt!130946 (tuple2!4945 lt!130958 (zeroValue!4628 thiss!1504))) lt!130952)))

(declare-fun lt!130943 () Unit!8073)

(assert (=> b!259764 (= lt!130943 lt!130940)))

(declare-fun lt!130949 () ListLongMap!3857)

(assert (=> b!259764 (= lt!130949 (getCurrentListMapNoExtraKeys!579 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun lt!130956 () (_ BitVec 64))

(assert (=> b!259764 (= lt!130956 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130948 () (_ BitVec 64))

(assert (=> b!259764 (= lt!130948 (select (arr!5957 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130945 () Unit!8073)

(declare-fun addApplyDifferent!233 (ListLongMap!3857 (_ BitVec 64) V!8467 (_ BitVec 64)) Unit!8073)

(assert (=> b!259764 (= lt!130945 (addApplyDifferent!233 lt!130949 lt!130956 (minValue!4628 thiss!1504) lt!130948))))

(assert (=> b!259764 (= (apply!257 (+!697 lt!130949 (tuple2!4945 lt!130956 (minValue!4628 thiss!1504))) lt!130948) (apply!257 lt!130949 lt!130948))))

(declare-fun lt!130947 () Unit!8073)

(assert (=> b!259764 (= lt!130947 lt!130945)))

(declare-fun lt!130939 () ListLongMap!3857)

(assert (=> b!259764 (= lt!130939 (getCurrentListMapNoExtraKeys!579 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun lt!130959 () (_ BitVec 64))

(assert (=> b!259764 (= lt!130959 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130954 () (_ BitVec 64))

(assert (=> b!259764 (= lt!130954 (select (arr!5957 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130951 () Unit!8073)

(assert (=> b!259764 (= lt!130951 (addApplyDifferent!233 lt!130939 lt!130959 (zeroValue!4628 thiss!1504) lt!130954))))

(assert (=> b!259764 (= (apply!257 (+!697 lt!130939 (tuple2!4945 lt!130959 (zeroValue!4628 thiss!1504))) lt!130954) (apply!257 lt!130939 lt!130954))))

(declare-fun lt!130944 () Unit!8073)

(assert (=> b!259764 (= lt!130944 lt!130951)))

(declare-fun lt!130953 () ListLongMap!3857)

(assert (=> b!259764 (= lt!130953 (getCurrentListMapNoExtraKeys!579 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun lt!130950 () (_ BitVec 64))

(assert (=> b!259764 (= lt!130950 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130942 () (_ BitVec 64))

(assert (=> b!259764 (= lt!130942 (select (arr!5957 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259764 (= lt!130955 (addApplyDifferent!233 lt!130953 lt!130950 (minValue!4628 thiss!1504) lt!130942))))

(assert (=> b!259764 (= (apply!257 (+!697 lt!130953 (tuple2!4945 lt!130950 (minValue!4628 thiss!1504))) lt!130942) (apply!257 lt!130953 lt!130942))))

(declare-fun b!259765 () Bool)

(assert (=> b!259765 (= e!168363 e!168360)))

(declare-fun res!126977 () Bool)

(assert (=> b!259765 (=> (not res!126977) (not e!168360))))

(assert (=> b!259765 (= res!126977 (contains!1887 lt!130960 (select (arr!5957 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259765 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))))))

(declare-fun b!259766 () Bool)

(declare-fun res!126970 () Bool)

(assert (=> b!259766 (=> (not res!126970) (not e!168357))))

(declare-fun e!168351 () Bool)

(assert (=> b!259766 (= res!126970 e!168351)))

(declare-fun c!44111 () Bool)

(assert (=> b!259766 (= c!44111 (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!259767 () Bool)

(declare-fun e!168362 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!259767 (= e!168362 (validKeyInArray!0 (select (arr!5957 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259768 () Bool)

(assert (=> b!259768 (= e!168351 (not call!24750))))

(declare-fun b!259769 () Bool)

(declare-fun e!168359 () Bool)

(assert (=> b!259769 (= e!168359 (= (apply!257 lt!130960 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4628 thiss!1504)))))

(declare-fun d!62401 () Bool)

(assert (=> d!62401 e!168357))

(declare-fun res!126976 () Bool)

(assert (=> d!62401 (=> (not res!126976) (not e!168357))))

(assert (=> d!62401 (= res!126976 (or (bvsge #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))))))))

(declare-fun lt!130941 () ListLongMap!3857)

(assert (=> d!62401 (= lt!130960 lt!130941)))

(declare-fun lt!130957 () Unit!8073)

(assert (=> d!62401 (= lt!130957 e!168358)))

(declare-fun c!44112 () Bool)

(assert (=> d!62401 (= c!44112 e!168362)))

(declare-fun res!126975 () Bool)

(assert (=> d!62401 (=> (not res!126975) (not e!168362))))

(assert (=> d!62401 (= res!126975 (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))))))

(assert (=> d!62401 (= lt!130941 e!168352)))

(declare-fun c!44113 () Bool)

(assert (=> d!62401 (= c!44113 (and (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62401 (validMask!0 (mask!11106 thiss!1504))))

(assert (=> d!62401 (= (getCurrentListMap!1472 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)) lt!130960)))

(declare-fun b!259770 () Bool)

(declare-fun e!168354 () Bool)

(assert (=> b!259770 (= e!168354 (= (apply!257 lt!130960 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4628 thiss!1504)))))

(declare-fun bm!24743 () Bool)

(declare-fun call!24747 () ListLongMap!3857)

(declare-fun call!24746 () ListLongMap!3857)

(assert (=> bm!24743 (= call!24747 call!24746)))

(declare-fun b!259771 () Bool)

(declare-fun e!168355 () Bool)

(assert (=> b!259771 (= e!168357 e!168355)))

(declare-fun c!44110 () Bool)

(assert (=> b!259771 (= c!44110 (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259772 () Bool)

(assert (=> b!259772 (= e!168353 (validKeyInArray!0 (select (arr!5957 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259773 () Bool)

(assert (=> b!259773 (= e!168356 call!24745)))

(declare-fun b!259774 () Bool)

(declare-fun call!24748 () Bool)

(assert (=> b!259774 (= e!168355 (not call!24748))))

(declare-fun b!259775 () Bool)

(assert (=> b!259775 (= e!168355 e!168354)))

(declare-fun res!126974 () Bool)

(assert (=> b!259775 (= res!126974 call!24748)))

(assert (=> b!259775 (=> (not res!126974) (not e!168354))))

(declare-fun bm!24744 () Bool)

(assert (=> bm!24744 (= call!24744 call!24747)))

(declare-fun bm!24745 () Bool)

(assert (=> bm!24745 (= call!24748 (contains!1887 lt!130960 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24746 () Bool)

(assert (=> bm!24746 (= call!24746 (getCurrentListMapNoExtraKeys!579 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun b!259776 () Bool)

(assert (=> b!259776 (= e!168351 e!168359)))

(declare-fun res!126969 () Bool)

(assert (=> b!259776 (= res!126969 call!24750)))

(assert (=> b!259776 (=> (not res!126969) (not e!168359))))

(declare-fun bm!24747 () Bool)

(assert (=> bm!24747 (= call!24749 (+!697 (ite c!44113 call!24746 (ite c!44109 call!24747 call!24744)) (ite (or c!44113 c!44109) (tuple2!4945 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4628 thiss!1504)) (tuple2!4945 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4628 thiss!1504)))))))

(declare-fun b!259777 () Bool)

(assert (=> b!259777 (= e!168352 (+!697 call!24749 (tuple2!4945 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4628 thiss!1504))))))

(assert (= (and d!62401 c!44113) b!259777))

(assert (= (and d!62401 (not c!44113)) b!259759))

(assert (= (and b!259759 c!44109) b!259773))

(assert (= (and b!259759 (not c!44109)) b!259761))

(assert (= (and b!259761 c!44108) b!259760))

(assert (= (and b!259761 (not c!44108)) b!259763))

(assert (= (or b!259760 b!259763) bm!24744))

(assert (= (or b!259773 bm!24744) bm!24743))

(assert (= (or b!259773 b!259760) bm!24741))

(assert (= (or b!259777 bm!24743) bm!24746))

(assert (= (or b!259777 bm!24741) bm!24747))

(assert (= (and d!62401 res!126975) b!259767))

(assert (= (and d!62401 c!44112) b!259764))

(assert (= (and d!62401 (not c!44112)) b!259758))

(assert (= (and d!62401 res!126976) b!259762))

(assert (= (and b!259762 res!126971) b!259772))

(assert (= (and b!259762 (not res!126972)) b!259765))

(assert (= (and b!259765 res!126977) b!259757))

(assert (= (and b!259762 res!126973) b!259766))

(assert (= (and b!259766 c!44111) b!259776))

(assert (= (and b!259766 (not c!44111)) b!259768))

(assert (= (and b!259776 res!126969) b!259769))

(assert (= (or b!259776 b!259768) bm!24742))

(assert (= (and b!259766 res!126970) b!259771))

(assert (= (and b!259771 c!44110) b!259775))

(assert (= (and b!259771 (not c!44110)) b!259774))

(assert (= (and b!259775 res!126974) b!259770))

(assert (= (or b!259775 b!259774) bm!24745))

(declare-fun b_lambda!8251 () Bool)

(assert (=> (not b_lambda!8251) (not b!259757)))

(declare-fun t!8894 () Bool)

(declare-fun tb!3027 () Bool)

(assert (=> (and b!259628 (= (defaultEntry!4787 thiss!1504) (defaultEntry!4787 thiss!1504)) t!8894) tb!3027))

(declare-fun result!5403 () Bool)

(assert (=> tb!3027 (= result!5403 tp_is_empty!6615)))

(assert (=> b!259757 t!8894))

(declare-fun b_and!13859 () Bool)

(assert (= b_and!13855 (and (=> t!8894 result!5403) b_and!13859)))

(declare-fun m!275459 () Bool)

(assert (=> bm!24745 m!275459))

(declare-fun m!275461 () Bool)

(assert (=> bm!24742 m!275461))

(declare-fun m!275463 () Bool)

(assert (=> b!259769 m!275463))

(declare-fun m!275465 () Bool)

(assert (=> b!259767 m!275465))

(assert (=> b!259767 m!275465))

(declare-fun m!275467 () Bool)

(assert (=> b!259767 m!275467))

(declare-fun m!275469 () Bool)

(assert (=> bm!24746 m!275469))

(assert (=> b!259757 m!275465))

(declare-fun m!275471 () Bool)

(assert (=> b!259757 m!275471))

(declare-fun m!275473 () Bool)

(assert (=> b!259757 m!275473))

(declare-fun m!275475 () Bool)

(assert (=> b!259757 m!275475))

(assert (=> b!259757 m!275465))

(declare-fun m!275477 () Bool)

(assert (=> b!259757 m!275477))

(assert (=> b!259757 m!275471))

(assert (=> b!259757 m!275473))

(declare-fun m!275479 () Bool)

(assert (=> b!259770 m!275479))

(assert (=> d!62401 m!275349))

(declare-fun m!275481 () Bool)

(assert (=> bm!24747 m!275481))

(assert (=> b!259765 m!275465))

(assert (=> b!259765 m!275465))

(declare-fun m!275483 () Bool)

(assert (=> b!259765 m!275483))

(assert (=> b!259772 m!275465))

(assert (=> b!259772 m!275465))

(assert (=> b!259772 m!275467))

(declare-fun m!275485 () Bool)

(assert (=> b!259764 m!275485))

(declare-fun m!275487 () Bool)

(assert (=> b!259764 m!275487))

(declare-fun m!275489 () Bool)

(assert (=> b!259764 m!275489))

(declare-fun m!275491 () Bool)

(assert (=> b!259764 m!275491))

(declare-fun m!275493 () Bool)

(assert (=> b!259764 m!275493))

(declare-fun m!275495 () Bool)

(assert (=> b!259764 m!275495))

(declare-fun m!275497 () Bool)

(assert (=> b!259764 m!275497))

(assert (=> b!259764 m!275493))

(declare-fun m!275499 () Bool)

(assert (=> b!259764 m!275499))

(declare-fun m!275501 () Bool)

(assert (=> b!259764 m!275501))

(declare-fun m!275503 () Bool)

(assert (=> b!259764 m!275503))

(assert (=> b!259764 m!275469))

(declare-fun m!275505 () Bool)

(assert (=> b!259764 m!275505))

(assert (=> b!259764 m!275485))

(declare-fun m!275507 () Bool)

(assert (=> b!259764 m!275507))

(assert (=> b!259764 m!275497))

(declare-fun m!275509 () Bool)

(assert (=> b!259764 m!275509))

(declare-fun m!275511 () Bool)

(assert (=> b!259764 m!275511))

(assert (=> b!259764 m!275465))

(assert (=> b!259764 m!275499))

(declare-fun m!275513 () Bool)

(assert (=> b!259764 m!275513))

(declare-fun m!275515 () Bool)

(assert (=> b!259777 m!275515))

(assert (=> b!259637 d!62401))

(declare-fun d!62403 () Bool)

(assert (=> d!62403 (contains!1887 (getCurrentListMap!1472 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)) key!932)))

(declare-fun lt!130963 () Unit!8073)

(declare-fun choose!1260 (array!12583 array!12581 (_ BitVec 32) (_ BitVec 32) V!8467 V!8467 (_ BitVec 64) (_ BitVec 32) Int) Unit!8073)

(assert (=> d!62403 (= lt!130963 (choose!1260 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(assert (=> d!62403 (validMask!0 (mask!11106 thiss!1504))))

(assert (=> d!62403 (= (lemmaArrayContainsKeyThenInListMap!249 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)) lt!130963)))

(declare-fun bs!9158 () Bool)

(assert (= bs!9158 d!62403))

(assert (=> bs!9158 m!275331))

(assert (=> bs!9158 m!275331))

(declare-fun m!275517 () Bool)

(assert (=> bs!9158 m!275517))

(declare-fun m!275519 () Bool)

(assert (=> bs!9158 m!275519))

(assert (=> bs!9158 m!275349))

(assert (=> b!259642 d!62403))

(declare-fun d!62405 () Bool)

(declare-fun e!168366 () Bool)

(assert (=> d!62405 e!168366))

(declare-fun res!126982 () Bool)

(assert (=> d!62405 (=> (not res!126982) (not e!168366))))

(declare-fun lt!130974 () ListLongMap!3857)

(assert (=> d!62405 (= res!126982 (contains!1887 lt!130974 (_1!2483 (tuple2!4945 key!932 v!346))))))

(declare-fun lt!130972 () List!3822)

(assert (=> d!62405 (= lt!130974 (ListLongMap!3858 lt!130972))))

(declare-fun lt!130975 () Unit!8073)

(declare-fun lt!130973 () Unit!8073)

(assert (=> d!62405 (= lt!130975 lt!130973)))

(assert (=> d!62405 (= (getValueByKey!315 lt!130972 (_1!2483 (tuple2!4945 key!932 v!346))) (Some!320 (_2!2483 (tuple2!4945 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!171 (List!3822 (_ BitVec 64) V!8467) Unit!8073)

(assert (=> d!62405 (= lt!130973 (lemmaContainsTupThenGetReturnValue!171 lt!130972 (_1!2483 (tuple2!4945 key!932 v!346)) (_2!2483 (tuple2!4945 key!932 v!346))))))

(declare-fun insertStrictlySorted!174 (List!3822 (_ BitVec 64) V!8467) List!3822)

(assert (=> d!62405 (= lt!130972 (insertStrictlySorted!174 (toList!1944 lt!130837) (_1!2483 (tuple2!4945 key!932 v!346)) (_2!2483 (tuple2!4945 key!932 v!346))))))

(assert (=> d!62405 (= (+!697 lt!130837 (tuple2!4945 key!932 v!346)) lt!130974)))

(declare-fun b!259784 () Bool)

(declare-fun res!126983 () Bool)

(assert (=> b!259784 (=> (not res!126983) (not e!168366))))

(assert (=> b!259784 (= res!126983 (= (getValueByKey!315 (toList!1944 lt!130974) (_1!2483 (tuple2!4945 key!932 v!346))) (Some!320 (_2!2483 (tuple2!4945 key!932 v!346)))))))

(declare-fun b!259785 () Bool)

(declare-fun contains!1889 (List!3822 tuple2!4944) Bool)

(assert (=> b!259785 (= e!168366 (contains!1889 (toList!1944 lt!130974) (tuple2!4945 key!932 v!346)))))

(assert (= (and d!62405 res!126982) b!259784))

(assert (= (and b!259784 res!126983) b!259785))

(declare-fun m!275521 () Bool)

(assert (=> d!62405 m!275521))

(declare-fun m!275523 () Bool)

(assert (=> d!62405 m!275523))

(declare-fun m!275525 () Bool)

(assert (=> d!62405 m!275525))

(declare-fun m!275527 () Bool)

(assert (=> d!62405 m!275527))

(declare-fun m!275529 () Bool)

(assert (=> b!259784 m!275529))

(declare-fun m!275531 () Bool)

(assert (=> b!259785 m!275531))

(assert (=> b!259627 d!62405))

(declare-fun d!62407 () Bool)

(declare-fun e!168369 () Bool)

(assert (=> d!62407 e!168369))

(declare-fun res!126986 () Bool)

(assert (=> d!62407 (=> (not res!126986) (not e!168369))))

(assert (=> d!62407 (= res!126986 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 (_keys!6965 thiss!1504))) (bvslt index!297 (size!6305 (_values!4770 thiss!1504)))))))

(declare-fun lt!130978 () Unit!8073)

(declare-fun choose!1261 (array!12583 array!12581 (_ BitVec 32) (_ BitVec 32) V!8467 V!8467 (_ BitVec 32) (_ BitVec 64) V!8467 Int) Unit!8073)

(assert (=> d!62407 (= lt!130978 (choose!1261 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) index!297 key!932 v!346 (defaultEntry!4787 thiss!1504)))))

(assert (=> d!62407 (validMask!0 (mask!11106 thiss!1504))))

(assert (=> d!62407 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!107 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) index!297 key!932 v!346 (defaultEntry!4787 thiss!1504)) lt!130978)))

(declare-fun b!259788 () Bool)

(assert (=> b!259788 (= e!168369 (= (+!697 (getCurrentListMap!1472 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)) (tuple2!4945 key!932 v!346)) (getCurrentListMap!1472 (array!12584 (store (arr!5957 (_keys!6965 thiss!1504)) index!297 key!932) (size!6306 (_keys!6965 thiss!1504))) (array!12582 (store (arr!5956 (_values!4770 thiss!1504)) index!297 (ValueCellFull!2964 v!346)) (size!6305 (_values!4770 thiss!1504))) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504))))))

(assert (= (and d!62407 res!126986) b!259788))

(declare-fun m!275533 () Bool)

(assert (=> d!62407 m!275533))

(assert (=> d!62407 m!275349))

(assert (=> b!259788 m!275365))

(assert (=> b!259788 m!275331))

(declare-fun m!275535 () Bool)

(assert (=> b!259788 m!275535))

(assert (=> b!259788 m!275331))

(declare-fun m!275537 () Bool)

(assert (=> b!259788 m!275537))

(assert (=> b!259788 m!275357))

(assert (=> b!259627 d!62407))

(declare-fun d!62409 () Bool)

(assert (=> d!62409 (= (validMask!0 (mask!11106 thiss!1504)) (and (or (= (mask!11106 thiss!1504) #b00000000000000000000000000000111) (= (mask!11106 thiss!1504) #b00000000000000000000000000001111) (= (mask!11106 thiss!1504) #b00000000000000000000000000011111) (= (mask!11106 thiss!1504) #b00000000000000000000000000111111) (= (mask!11106 thiss!1504) #b00000000000000000000000001111111) (= (mask!11106 thiss!1504) #b00000000000000000000000011111111) (= (mask!11106 thiss!1504) #b00000000000000000000000111111111) (= (mask!11106 thiss!1504) #b00000000000000000000001111111111) (= (mask!11106 thiss!1504) #b00000000000000000000011111111111) (= (mask!11106 thiss!1504) #b00000000000000000000111111111111) (= (mask!11106 thiss!1504) #b00000000000000000001111111111111) (= (mask!11106 thiss!1504) #b00000000000000000011111111111111) (= (mask!11106 thiss!1504) #b00000000000000000111111111111111) (= (mask!11106 thiss!1504) #b00000000000000001111111111111111) (= (mask!11106 thiss!1504) #b00000000000000011111111111111111) (= (mask!11106 thiss!1504) #b00000000000000111111111111111111) (= (mask!11106 thiss!1504) #b00000000000001111111111111111111) (= (mask!11106 thiss!1504) #b00000000000011111111111111111111) (= (mask!11106 thiss!1504) #b00000000000111111111111111111111) (= (mask!11106 thiss!1504) #b00000000001111111111111111111111) (= (mask!11106 thiss!1504) #b00000000011111111111111111111111) (= (mask!11106 thiss!1504) #b00000000111111111111111111111111) (= (mask!11106 thiss!1504) #b00000001111111111111111111111111) (= (mask!11106 thiss!1504) #b00000011111111111111111111111111) (= (mask!11106 thiss!1504) #b00000111111111111111111111111111) (= (mask!11106 thiss!1504) #b00001111111111111111111111111111) (= (mask!11106 thiss!1504) #b00011111111111111111111111111111) (= (mask!11106 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11106 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!259627 d!62409))

(declare-fun d!62411 () Bool)

(assert (=> d!62411 (= (arrayCountValidKeys!0 lt!130839 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!130981 () Unit!8073)

(declare-fun choose!2 (array!12583 (_ BitVec 32)) Unit!8073)

(assert (=> d!62411 (= lt!130981 (choose!2 lt!130839 index!297))))

(declare-fun e!168372 () Bool)

(assert (=> d!62411 e!168372))

(declare-fun res!126991 () Bool)

(assert (=> d!62411 (=> (not res!126991) (not e!168372))))

(assert (=> d!62411 (= res!126991 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 lt!130839))))))

(assert (=> d!62411 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130839 index!297) lt!130981)))

(declare-fun b!259793 () Bool)

(declare-fun res!126992 () Bool)

(assert (=> b!259793 (=> (not res!126992) (not e!168372))))

(assert (=> b!259793 (= res!126992 (validKeyInArray!0 (select (arr!5957 lt!130839) index!297)))))

(declare-fun b!259794 () Bool)

(assert (=> b!259794 (= e!168372 (bvslt (size!6306 lt!130839) #b01111111111111111111111111111111))))

(assert (= (and d!62411 res!126991) b!259793))

(assert (= (and b!259793 res!126992) b!259794))

(declare-fun m!275539 () Bool)

(assert (=> d!62411 m!275539))

(declare-fun m!275541 () Bool)

(assert (=> d!62411 m!275541))

(declare-fun m!275543 () Bool)

(assert (=> b!259793 m!275543))

(assert (=> b!259793 m!275543))

(declare-fun m!275545 () Bool)

(assert (=> b!259793 m!275545))

(assert (=> b!259627 d!62411))

(declare-fun d!62413 () Bool)

(declare-fun res!126999 () Bool)

(declare-fun e!168381 () Bool)

(assert (=> d!62413 (=> res!126999 e!168381)))

(assert (=> d!62413 (= res!126999 (bvsge #b00000000000000000000000000000000 (size!6306 lt!130839)))))

(assert (=> d!62413 (= (arrayNoDuplicates!0 lt!130839 #b00000000000000000000000000000000 Nil!3820) e!168381)))

(declare-fun b!259805 () Bool)

(declare-fun e!168382 () Bool)

(declare-fun call!24753 () Bool)

(assert (=> b!259805 (= e!168382 call!24753)))

(declare-fun b!259806 () Bool)

(assert (=> b!259806 (= e!168382 call!24753)))

(declare-fun b!259807 () Bool)

(declare-fun e!168383 () Bool)

(assert (=> b!259807 (= e!168381 e!168383)))

(declare-fun res!127001 () Bool)

(assert (=> b!259807 (=> (not res!127001) (not e!168383))))

(declare-fun e!168384 () Bool)

(assert (=> b!259807 (= res!127001 (not e!168384))))

(declare-fun res!127000 () Bool)

(assert (=> b!259807 (=> (not res!127000) (not e!168384))))

(assert (=> b!259807 (= res!127000 (validKeyInArray!0 (select (arr!5957 lt!130839) #b00000000000000000000000000000000)))))

(declare-fun bm!24750 () Bool)

(declare-fun c!44116 () Bool)

(assert (=> bm!24750 (= call!24753 (arrayNoDuplicates!0 lt!130839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44116 (Cons!3819 (select (arr!5957 lt!130839) #b00000000000000000000000000000000) Nil!3820) Nil!3820)))))

(declare-fun b!259808 () Bool)

(declare-fun contains!1890 (List!3823 (_ BitVec 64)) Bool)

(assert (=> b!259808 (= e!168384 (contains!1890 Nil!3820 (select (arr!5957 lt!130839) #b00000000000000000000000000000000)))))

(declare-fun b!259809 () Bool)

(assert (=> b!259809 (= e!168383 e!168382)))

(assert (=> b!259809 (= c!44116 (validKeyInArray!0 (select (arr!5957 lt!130839) #b00000000000000000000000000000000)))))

(assert (= (and d!62413 (not res!126999)) b!259807))

(assert (= (and b!259807 res!127000) b!259808))

(assert (= (and b!259807 res!127001) b!259809))

(assert (= (and b!259809 c!44116) b!259806))

(assert (= (and b!259809 (not c!44116)) b!259805))

(assert (= (or b!259806 b!259805) bm!24750))

(declare-fun m!275547 () Bool)

(assert (=> b!259807 m!275547))

(assert (=> b!259807 m!275547))

(declare-fun m!275549 () Bool)

(assert (=> b!259807 m!275549))

(assert (=> bm!24750 m!275547))

(declare-fun m!275551 () Bool)

(assert (=> bm!24750 m!275551))

(assert (=> b!259808 m!275547))

(assert (=> b!259808 m!275547))

(declare-fun m!275553 () Bool)

(assert (=> b!259808 m!275553))

(assert (=> b!259809 m!275547))

(assert (=> b!259809 m!275547))

(assert (=> b!259809 m!275549))

(assert (=> b!259627 d!62413))

(declare-fun d!62415 () Bool)

(declare-fun e!168387 () Bool)

(assert (=> d!62415 e!168387))

(declare-fun res!127004 () Bool)

(assert (=> d!62415 (=> (not res!127004) (not e!168387))))

(assert (=> d!62415 (= res!127004 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 (_keys!6965 thiss!1504)))))))

(declare-fun lt!130984 () Unit!8073)

(declare-fun choose!41 (array!12583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3823) Unit!8073)

(assert (=> d!62415 (= lt!130984 (choose!41 (_keys!6965 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3820))))

(assert (=> d!62415 (bvslt (size!6306 (_keys!6965 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62415 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6965 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3820) lt!130984)))

(declare-fun b!259812 () Bool)

(assert (=> b!259812 (= e!168387 (arrayNoDuplicates!0 (array!12584 (store (arr!5957 (_keys!6965 thiss!1504)) index!297 key!932) (size!6306 (_keys!6965 thiss!1504))) #b00000000000000000000000000000000 Nil!3820))))

(assert (= (and d!62415 res!127004) b!259812))

(declare-fun m!275555 () Bool)

(assert (=> d!62415 m!275555))

(assert (=> b!259812 m!275365))

(declare-fun m!275557 () Bool)

(assert (=> b!259812 m!275557))

(assert (=> b!259627 d!62415))

(declare-fun b!259822 () Bool)

(declare-fun res!127013 () Bool)

(declare-fun e!168392 () Bool)

(assert (=> b!259822 (=> (not res!127013) (not e!168392))))

(assert (=> b!259822 (= res!127013 (validKeyInArray!0 key!932))))

(declare-fun b!259821 () Bool)

(declare-fun res!127015 () Bool)

(assert (=> b!259821 (=> (not res!127015) (not e!168392))))

(assert (=> b!259821 (= res!127015 (not (validKeyInArray!0 (select (arr!5957 (_keys!6965 thiss!1504)) index!297))))))

(declare-fun b!259823 () Bool)

(assert (=> b!259823 (= e!168392 (bvslt (size!6306 (_keys!6965 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!62417 () Bool)

(declare-fun e!168393 () Bool)

(assert (=> d!62417 e!168393))

(declare-fun res!127016 () Bool)

(assert (=> d!62417 (=> (not res!127016) (not e!168393))))

(assert (=> d!62417 (= res!127016 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 (_keys!6965 thiss!1504)))))))

(declare-fun lt!130987 () Unit!8073)

(declare-fun choose!1 (array!12583 (_ BitVec 32) (_ BitVec 64)) Unit!8073)

(assert (=> d!62417 (= lt!130987 (choose!1 (_keys!6965 thiss!1504) index!297 key!932))))

(assert (=> d!62417 e!168392))

(declare-fun res!127014 () Bool)

(assert (=> d!62417 (=> (not res!127014) (not e!168392))))

(assert (=> d!62417 (= res!127014 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 (_keys!6965 thiss!1504)))))))

(assert (=> d!62417 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6965 thiss!1504) index!297 key!932) lt!130987)))

(declare-fun b!259824 () Bool)

(assert (=> b!259824 (= e!168393 (= (arrayCountValidKeys!0 (array!12584 (store (arr!5957 (_keys!6965 thiss!1504)) index!297 key!932) (size!6306 (_keys!6965 thiss!1504))) #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6965 thiss!1504) #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!62417 res!127014) b!259821))

(assert (= (and b!259821 res!127015) b!259822))

(assert (= (and b!259822 res!127013) b!259823))

(assert (= (and d!62417 res!127016) b!259824))

(declare-fun m!275559 () Bool)

(assert (=> b!259822 m!275559))

(declare-fun m!275561 () Bool)

(assert (=> b!259821 m!275561))

(assert (=> b!259821 m!275561))

(declare-fun m!275563 () Bool)

(assert (=> b!259821 m!275563))

(declare-fun m!275565 () Bool)

(assert (=> d!62417 m!275565))

(assert (=> b!259824 m!275365))

(declare-fun m!275567 () Bool)

(assert (=> b!259824 m!275567))

(assert (=> b!259824 m!275379))

(assert (=> b!259627 d!62417))

(declare-fun bm!24751 () Bool)

(declare-fun call!24755 () ListLongMap!3857)

(declare-fun call!24759 () ListLongMap!3857)

(assert (=> bm!24751 (= call!24755 call!24759)))

(declare-fun b!259825 () Bool)

(declare-fun e!168403 () Bool)

(declare-fun lt!131009 () ListLongMap!3857)

(assert (=> b!259825 (= e!168403 (= (apply!257 lt!131009 (select (arr!5957 lt!130839) #b00000000000000000000000000000000)) (get!3068 (select (arr!5956 (array!12582 (store (arr!5956 (_values!4770 thiss!1504)) index!297 (ValueCellFull!2964 v!346)) (size!6305 (_values!4770 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!600 (defaultEntry!4787 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6305 (array!12582 (store (arr!5956 (_values!4770 thiss!1504)) index!297 (ValueCellFull!2964 v!346)) (size!6305 (_values!4770 thiss!1504))))))))

(assert (=> b!259825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 lt!130839)))))

(declare-fun b!259826 () Bool)

(declare-fun e!168401 () Unit!8073)

(declare-fun Unit!8083 () Unit!8073)

(assert (=> b!259826 (= e!168401 Unit!8083)))

(declare-fun b!259827 () Bool)

(declare-fun e!168395 () ListLongMap!3857)

(declare-fun e!168399 () ListLongMap!3857)

(assert (=> b!259827 (= e!168395 e!168399)))

(declare-fun c!44118 () Bool)

(assert (=> b!259827 (= c!44118 (and (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259828 () Bool)

(declare-fun e!168404 () ListLongMap!3857)

(assert (=> b!259828 (= e!168404 call!24755)))

(declare-fun b!259829 () Bool)

(declare-fun c!44117 () Bool)

(assert (=> b!259829 (= c!44117 (and (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!259829 (= e!168399 e!168404)))

(declare-fun b!259830 () Bool)

(declare-fun res!127021 () Bool)

(declare-fun e!168400 () Bool)

(assert (=> b!259830 (=> (not res!127021) (not e!168400))))

(declare-fun e!168406 () Bool)

(assert (=> b!259830 (= res!127021 e!168406)))

(declare-fun res!127020 () Bool)

(assert (=> b!259830 (=> res!127020 e!168406)))

(declare-fun e!168396 () Bool)

(assert (=> b!259830 (= res!127020 (not e!168396))))

(declare-fun res!127019 () Bool)

(assert (=> b!259830 (=> (not res!127019) (not e!168396))))

(assert (=> b!259830 (= res!127019 (bvslt #b00000000000000000000000000000000 (size!6306 lt!130839)))))

(declare-fun b!259831 () Bool)

(declare-fun call!24754 () ListLongMap!3857)

(assert (=> b!259831 (= e!168404 call!24754)))

(declare-fun bm!24752 () Bool)

(declare-fun call!24760 () Bool)

(assert (=> bm!24752 (= call!24760 (contains!1887 lt!131009 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259832 () Bool)

(declare-fun lt!131004 () Unit!8073)

(assert (=> b!259832 (= e!168401 lt!131004)))

(declare-fun lt!130995 () ListLongMap!3857)

(assert (=> b!259832 (= lt!130995 (getCurrentListMapNoExtraKeys!579 lt!130839 (array!12582 (store (arr!5956 (_values!4770 thiss!1504)) index!297 (ValueCellFull!2964 v!346)) (size!6305 (_values!4770 thiss!1504))) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun lt!131007 () (_ BitVec 64))

(assert (=> b!259832 (= lt!131007 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131001 () (_ BitVec 64))

(assert (=> b!259832 (= lt!131001 (select (arr!5957 lt!130839) #b00000000000000000000000000000000))))

(declare-fun lt!130989 () Unit!8073)

(assert (=> b!259832 (= lt!130989 (addStillContains!233 lt!130995 lt!131007 (zeroValue!4628 thiss!1504) lt!131001))))

(assert (=> b!259832 (contains!1887 (+!697 lt!130995 (tuple2!4945 lt!131007 (zeroValue!4628 thiss!1504))) lt!131001)))

(declare-fun lt!130992 () Unit!8073)

(assert (=> b!259832 (= lt!130992 lt!130989)))

(declare-fun lt!130998 () ListLongMap!3857)

(assert (=> b!259832 (= lt!130998 (getCurrentListMapNoExtraKeys!579 lt!130839 (array!12582 (store (arr!5956 (_values!4770 thiss!1504)) index!297 (ValueCellFull!2964 v!346)) (size!6305 (_values!4770 thiss!1504))) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun lt!131005 () (_ BitVec 64))

(assert (=> b!259832 (= lt!131005 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130997 () (_ BitVec 64))

(assert (=> b!259832 (= lt!130997 (select (arr!5957 lt!130839) #b00000000000000000000000000000000))))

(declare-fun lt!130994 () Unit!8073)

(assert (=> b!259832 (= lt!130994 (addApplyDifferent!233 lt!130998 lt!131005 (minValue!4628 thiss!1504) lt!130997))))

(assert (=> b!259832 (= (apply!257 (+!697 lt!130998 (tuple2!4945 lt!131005 (minValue!4628 thiss!1504))) lt!130997) (apply!257 lt!130998 lt!130997))))

(declare-fun lt!130996 () Unit!8073)

(assert (=> b!259832 (= lt!130996 lt!130994)))

(declare-fun lt!130988 () ListLongMap!3857)

(assert (=> b!259832 (= lt!130988 (getCurrentListMapNoExtraKeys!579 lt!130839 (array!12582 (store (arr!5956 (_values!4770 thiss!1504)) index!297 (ValueCellFull!2964 v!346)) (size!6305 (_values!4770 thiss!1504))) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun lt!131008 () (_ BitVec 64))

(assert (=> b!259832 (= lt!131008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131003 () (_ BitVec 64))

(assert (=> b!259832 (= lt!131003 (select (arr!5957 lt!130839) #b00000000000000000000000000000000))))

(declare-fun lt!131000 () Unit!8073)

(assert (=> b!259832 (= lt!131000 (addApplyDifferent!233 lt!130988 lt!131008 (zeroValue!4628 thiss!1504) lt!131003))))

(assert (=> b!259832 (= (apply!257 (+!697 lt!130988 (tuple2!4945 lt!131008 (zeroValue!4628 thiss!1504))) lt!131003) (apply!257 lt!130988 lt!131003))))

(declare-fun lt!130993 () Unit!8073)

(assert (=> b!259832 (= lt!130993 lt!131000)))

(declare-fun lt!131002 () ListLongMap!3857)

(assert (=> b!259832 (= lt!131002 (getCurrentListMapNoExtraKeys!579 lt!130839 (array!12582 (store (arr!5956 (_values!4770 thiss!1504)) index!297 (ValueCellFull!2964 v!346)) (size!6305 (_values!4770 thiss!1504))) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun lt!130999 () (_ BitVec 64))

(assert (=> b!259832 (= lt!130999 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130991 () (_ BitVec 64))

(assert (=> b!259832 (= lt!130991 (select (arr!5957 lt!130839) #b00000000000000000000000000000000))))

(assert (=> b!259832 (= lt!131004 (addApplyDifferent!233 lt!131002 lt!130999 (minValue!4628 thiss!1504) lt!130991))))

(assert (=> b!259832 (= (apply!257 (+!697 lt!131002 (tuple2!4945 lt!130999 (minValue!4628 thiss!1504))) lt!130991) (apply!257 lt!131002 lt!130991))))

(declare-fun b!259833 () Bool)

(assert (=> b!259833 (= e!168406 e!168403)))

(declare-fun res!127025 () Bool)

(assert (=> b!259833 (=> (not res!127025) (not e!168403))))

(assert (=> b!259833 (= res!127025 (contains!1887 lt!131009 (select (arr!5957 lt!130839) #b00000000000000000000000000000000)))))

(assert (=> b!259833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 lt!130839)))))

(declare-fun b!259834 () Bool)

(declare-fun res!127018 () Bool)

(assert (=> b!259834 (=> (not res!127018) (not e!168400))))

(declare-fun e!168394 () Bool)

(assert (=> b!259834 (= res!127018 e!168394)))

(declare-fun c!44120 () Bool)

(assert (=> b!259834 (= c!44120 (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!259835 () Bool)

(declare-fun e!168405 () Bool)

(assert (=> b!259835 (= e!168405 (validKeyInArray!0 (select (arr!5957 lt!130839) #b00000000000000000000000000000000)))))

(declare-fun b!259836 () Bool)

(assert (=> b!259836 (= e!168394 (not call!24760))))

(declare-fun b!259837 () Bool)

(declare-fun e!168402 () Bool)

(assert (=> b!259837 (= e!168402 (= (apply!257 lt!131009 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4628 thiss!1504)))))

(declare-fun d!62419 () Bool)

(assert (=> d!62419 e!168400))

(declare-fun res!127024 () Bool)

(assert (=> d!62419 (=> (not res!127024) (not e!168400))))

(assert (=> d!62419 (= res!127024 (or (bvsge #b00000000000000000000000000000000 (size!6306 lt!130839)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 lt!130839)))))))

(declare-fun lt!130990 () ListLongMap!3857)

(assert (=> d!62419 (= lt!131009 lt!130990)))

(declare-fun lt!131006 () Unit!8073)

(assert (=> d!62419 (= lt!131006 e!168401)))

(declare-fun c!44121 () Bool)

(assert (=> d!62419 (= c!44121 e!168405)))

(declare-fun res!127023 () Bool)

(assert (=> d!62419 (=> (not res!127023) (not e!168405))))

(assert (=> d!62419 (= res!127023 (bvslt #b00000000000000000000000000000000 (size!6306 lt!130839)))))

(assert (=> d!62419 (= lt!130990 e!168395)))

(declare-fun c!44122 () Bool)

(assert (=> d!62419 (= c!44122 (and (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62419 (validMask!0 (mask!11106 thiss!1504))))

(assert (=> d!62419 (= (getCurrentListMap!1472 lt!130839 (array!12582 (store (arr!5956 (_values!4770 thiss!1504)) index!297 (ValueCellFull!2964 v!346)) (size!6305 (_values!4770 thiss!1504))) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)) lt!131009)))

(declare-fun b!259838 () Bool)

(declare-fun e!168397 () Bool)

(assert (=> b!259838 (= e!168397 (= (apply!257 lt!131009 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4628 thiss!1504)))))

(declare-fun bm!24753 () Bool)

(declare-fun call!24757 () ListLongMap!3857)

(declare-fun call!24756 () ListLongMap!3857)

(assert (=> bm!24753 (= call!24757 call!24756)))

(declare-fun b!259839 () Bool)

(declare-fun e!168398 () Bool)

(assert (=> b!259839 (= e!168400 e!168398)))

(declare-fun c!44119 () Bool)

(assert (=> b!259839 (= c!44119 (not (= (bvand (extraKeys!4524 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259840 () Bool)

(assert (=> b!259840 (= e!168396 (validKeyInArray!0 (select (arr!5957 lt!130839) #b00000000000000000000000000000000)))))

(declare-fun b!259841 () Bool)

(assert (=> b!259841 (= e!168399 call!24755)))

(declare-fun b!259842 () Bool)

(declare-fun call!24758 () Bool)

(assert (=> b!259842 (= e!168398 (not call!24758))))

(declare-fun b!259843 () Bool)

(assert (=> b!259843 (= e!168398 e!168397)))

(declare-fun res!127022 () Bool)

(assert (=> b!259843 (= res!127022 call!24758)))

(assert (=> b!259843 (=> (not res!127022) (not e!168397))))

(declare-fun bm!24754 () Bool)

(assert (=> bm!24754 (= call!24754 call!24757)))

(declare-fun bm!24755 () Bool)

(assert (=> bm!24755 (= call!24758 (contains!1887 lt!131009 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24756 () Bool)

(assert (=> bm!24756 (= call!24756 (getCurrentListMapNoExtraKeys!579 lt!130839 (array!12582 (store (arr!5956 (_values!4770 thiss!1504)) index!297 (ValueCellFull!2964 v!346)) (size!6305 (_values!4770 thiss!1504))) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4787 thiss!1504)))))

(declare-fun b!259844 () Bool)

(assert (=> b!259844 (= e!168394 e!168402)))

(declare-fun res!127017 () Bool)

(assert (=> b!259844 (= res!127017 call!24760)))

(assert (=> b!259844 (=> (not res!127017) (not e!168402))))

(declare-fun bm!24757 () Bool)

(assert (=> bm!24757 (= call!24759 (+!697 (ite c!44122 call!24756 (ite c!44118 call!24757 call!24754)) (ite (or c!44122 c!44118) (tuple2!4945 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4628 thiss!1504)) (tuple2!4945 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4628 thiss!1504)))))))

(declare-fun b!259845 () Bool)

(assert (=> b!259845 (= e!168395 (+!697 call!24759 (tuple2!4945 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4628 thiss!1504))))))

(assert (= (and d!62419 c!44122) b!259845))

(assert (= (and d!62419 (not c!44122)) b!259827))

(assert (= (and b!259827 c!44118) b!259841))

(assert (= (and b!259827 (not c!44118)) b!259829))

(assert (= (and b!259829 c!44117) b!259828))

(assert (= (and b!259829 (not c!44117)) b!259831))

(assert (= (or b!259828 b!259831) bm!24754))

(assert (= (or b!259841 bm!24754) bm!24753))

(assert (= (or b!259841 b!259828) bm!24751))

(assert (= (or b!259845 bm!24753) bm!24756))

(assert (= (or b!259845 bm!24751) bm!24757))

(assert (= (and d!62419 res!127023) b!259835))

(assert (= (and d!62419 c!44121) b!259832))

(assert (= (and d!62419 (not c!44121)) b!259826))

(assert (= (and d!62419 res!127024) b!259830))

(assert (= (and b!259830 res!127019) b!259840))

(assert (= (and b!259830 (not res!127020)) b!259833))

(assert (= (and b!259833 res!127025) b!259825))

(assert (= (and b!259830 res!127021) b!259834))

(assert (= (and b!259834 c!44120) b!259844))

(assert (= (and b!259834 (not c!44120)) b!259836))

(assert (= (and b!259844 res!127017) b!259837))

(assert (= (or b!259844 b!259836) bm!24752))

(assert (= (and b!259834 res!127018) b!259839))

(assert (= (and b!259839 c!44119) b!259843))

(assert (= (and b!259839 (not c!44119)) b!259842))

(assert (= (and b!259843 res!127022) b!259838))

(assert (= (or b!259843 b!259842) bm!24755))

(declare-fun b_lambda!8253 () Bool)

(assert (=> (not b_lambda!8253) (not b!259825)))

(assert (=> b!259825 t!8894))

(declare-fun b_and!13861 () Bool)

(assert (= b_and!13859 (and (=> t!8894 result!5403) b_and!13861)))

(declare-fun m!275569 () Bool)

(assert (=> bm!24755 m!275569))

(declare-fun m!275571 () Bool)

(assert (=> bm!24752 m!275571))

(declare-fun m!275573 () Bool)

(assert (=> b!259837 m!275573))

(assert (=> b!259835 m!275547))

(assert (=> b!259835 m!275547))

(assert (=> b!259835 m!275549))

(declare-fun m!275575 () Bool)

(assert (=> bm!24756 m!275575))

(assert (=> b!259825 m!275547))

(declare-fun m!275577 () Bool)

(assert (=> b!259825 m!275577))

(assert (=> b!259825 m!275473))

(declare-fun m!275579 () Bool)

(assert (=> b!259825 m!275579))

(assert (=> b!259825 m!275547))

(declare-fun m!275581 () Bool)

(assert (=> b!259825 m!275581))

(assert (=> b!259825 m!275577))

(assert (=> b!259825 m!275473))

(declare-fun m!275583 () Bool)

(assert (=> b!259838 m!275583))

(assert (=> d!62419 m!275349))

(declare-fun m!275585 () Bool)

(assert (=> bm!24757 m!275585))

(assert (=> b!259833 m!275547))

(assert (=> b!259833 m!275547))

(declare-fun m!275587 () Bool)

(assert (=> b!259833 m!275587))

(assert (=> b!259840 m!275547))

(assert (=> b!259840 m!275547))

(assert (=> b!259840 m!275549))

(declare-fun m!275589 () Bool)

(assert (=> b!259832 m!275589))

(declare-fun m!275591 () Bool)

(assert (=> b!259832 m!275591))

(declare-fun m!275593 () Bool)

(assert (=> b!259832 m!275593))

(declare-fun m!275595 () Bool)

(assert (=> b!259832 m!275595))

(declare-fun m!275597 () Bool)

(assert (=> b!259832 m!275597))

(declare-fun m!275599 () Bool)

(assert (=> b!259832 m!275599))

(declare-fun m!275601 () Bool)

(assert (=> b!259832 m!275601))

(assert (=> b!259832 m!275597))

(declare-fun m!275603 () Bool)

(assert (=> b!259832 m!275603))

(declare-fun m!275605 () Bool)

(assert (=> b!259832 m!275605))

(declare-fun m!275607 () Bool)

(assert (=> b!259832 m!275607))

(assert (=> b!259832 m!275575))

(declare-fun m!275609 () Bool)

(assert (=> b!259832 m!275609))

(assert (=> b!259832 m!275589))

(declare-fun m!275611 () Bool)

(assert (=> b!259832 m!275611))

(assert (=> b!259832 m!275601))

(declare-fun m!275613 () Bool)

(assert (=> b!259832 m!275613))

(declare-fun m!275615 () Bool)

(assert (=> b!259832 m!275615))

(assert (=> b!259832 m!275547))

(assert (=> b!259832 m!275603))

(declare-fun m!275617 () Bool)

(assert (=> b!259832 m!275617))

(declare-fun m!275619 () Bool)

(assert (=> b!259845 m!275619))

(assert (=> b!259627 d!62419))

(declare-fun d!62421 () Bool)

(declare-fun res!127030 () Bool)

(declare-fun e!168411 () Bool)

(assert (=> d!62421 (=> res!127030 e!168411)))

(assert (=> d!62421 (= res!127030 (= (select (arr!5957 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62421 (= (arrayContainsKey!0 (_keys!6965 thiss!1504) key!932 #b00000000000000000000000000000000) e!168411)))

(declare-fun b!259850 () Bool)

(declare-fun e!168412 () Bool)

(assert (=> b!259850 (= e!168411 e!168412)))

(declare-fun res!127031 () Bool)

(assert (=> b!259850 (=> (not res!127031) (not e!168412))))

(assert (=> b!259850 (= res!127031 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6965 thiss!1504))))))

(declare-fun b!259851 () Bool)

(assert (=> b!259851 (= e!168412 (arrayContainsKey!0 (_keys!6965 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62421 (not res!127030)) b!259850))

(assert (= (and b!259850 res!127031) b!259851))

(assert (=> d!62421 m!275465))

(declare-fun m!275621 () Bool)

(assert (=> b!259851 m!275621))

(assert (=> b!259627 d!62421))

(declare-fun d!62423 () Bool)

(declare-fun e!168415 () Bool)

(assert (=> d!62423 e!168415))

(declare-fun res!127034 () Bool)

(assert (=> d!62423 (=> (not res!127034) (not e!168415))))

(assert (=> d!62423 (= res!127034 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 (_keys!6965 thiss!1504)))))))

(declare-fun lt!131012 () Unit!8073)

(declare-fun choose!102 ((_ BitVec 64) array!12583 (_ BitVec 32) (_ BitVec 32)) Unit!8073)

(assert (=> d!62423 (= lt!131012 (choose!102 key!932 (_keys!6965 thiss!1504) index!297 (mask!11106 thiss!1504)))))

(assert (=> d!62423 (validMask!0 (mask!11106 thiss!1504))))

(assert (=> d!62423 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6965 thiss!1504) index!297 (mask!11106 thiss!1504)) lt!131012)))

(declare-fun b!259854 () Bool)

(assert (=> b!259854 (= e!168415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12584 (store (arr!5957 (_keys!6965 thiss!1504)) index!297 key!932) (size!6306 (_keys!6965 thiss!1504))) (mask!11106 thiss!1504)))))

(assert (= (and d!62423 res!127034) b!259854))

(declare-fun m!275623 () Bool)

(assert (=> d!62423 m!275623))

(assert (=> d!62423 m!275349))

(assert (=> b!259854 m!275365))

(declare-fun m!275625 () Bool)

(assert (=> b!259854 m!275625))

(assert (=> b!259627 d!62423))

(declare-fun b!259863 () Bool)

(declare-fun e!168420 () (_ BitVec 32))

(assert (=> b!259863 (= e!168420 #b00000000000000000000000000000000)))

(declare-fun b!259864 () Bool)

(declare-fun e!168421 () (_ BitVec 32))

(declare-fun call!24763 () (_ BitVec 32))

(assert (=> b!259864 (= e!168421 (bvadd #b00000000000000000000000000000001 call!24763))))

(declare-fun bm!24760 () Bool)

(assert (=> bm!24760 (= call!24763 (arrayCountValidKeys!0 lt!130839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6965 thiss!1504))))))

(declare-fun d!62425 () Bool)

(declare-fun lt!131015 () (_ BitVec 32))

(assert (=> d!62425 (and (bvsge lt!131015 #b00000000000000000000000000000000) (bvsle lt!131015 (bvsub (size!6306 lt!130839) #b00000000000000000000000000000000)))))

(assert (=> d!62425 (= lt!131015 e!168420)))

(declare-fun c!44128 () Bool)

(assert (=> d!62425 (= c!44128 (bvsge #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))))))

(assert (=> d!62425 (and (bvsle #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6306 (_keys!6965 thiss!1504)) (size!6306 lt!130839)))))

(assert (=> d!62425 (= (arrayCountValidKeys!0 lt!130839 #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))) lt!131015)))

(declare-fun b!259865 () Bool)

(assert (=> b!259865 (= e!168420 e!168421)))

(declare-fun c!44127 () Bool)

(assert (=> b!259865 (= c!44127 (validKeyInArray!0 (select (arr!5957 lt!130839) #b00000000000000000000000000000000)))))

(declare-fun b!259866 () Bool)

(assert (=> b!259866 (= e!168421 call!24763)))

(assert (= (and d!62425 c!44128) b!259863))

(assert (= (and d!62425 (not c!44128)) b!259865))

(assert (= (and b!259865 c!44127) b!259864))

(assert (= (and b!259865 (not c!44127)) b!259866))

(assert (= (or b!259864 b!259866) bm!24760))

(declare-fun m!275627 () Bool)

(assert (=> bm!24760 m!275627))

(assert (=> b!259865 m!275547))

(assert (=> b!259865 m!275547))

(assert (=> b!259865 m!275549))

(assert (=> b!259627 d!62425))

(declare-fun b!259867 () Bool)

(declare-fun e!168422 () (_ BitVec 32))

(assert (=> b!259867 (= e!168422 #b00000000000000000000000000000000)))

(declare-fun b!259868 () Bool)

(declare-fun e!168423 () (_ BitVec 32))

(declare-fun call!24764 () (_ BitVec 32))

(assert (=> b!259868 (= e!168423 (bvadd #b00000000000000000000000000000001 call!24764))))

(declare-fun bm!24761 () Bool)

(assert (=> bm!24761 (= call!24764 (arrayCountValidKeys!0 (_keys!6965 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6965 thiss!1504))))))

(declare-fun d!62427 () Bool)

(declare-fun lt!131016 () (_ BitVec 32))

(assert (=> d!62427 (and (bvsge lt!131016 #b00000000000000000000000000000000) (bvsle lt!131016 (bvsub (size!6306 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62427 (= lt!131016 e!168422)))

(declare-fun c!44130 () Bool)

(assert (=> d!62427 (= c!44130 (bvsge #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))))))

(assert (=> d!62427 (and (bvsle #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6306 (_keys!6965 thiss!1504)) (size!6306 (_keys!6965 thiss!1504))))))

(assert (=> d!62427 (= (arrayCountValidKeys!0 (_keys!6965 thiss!1504) #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))) lt!131016)))

(declare-fun b!259869 () Bool)

(assert (=> b!259869 (= e!168422 e!168423)))

(declare-fun c!44129 () Bool)

(assert (=> b!259869 (= c!44129 (validKeyInArray!0 (select (arr!5957 (_keys!6965 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259870 () Bool)

(assert (=> b!259870 (= e!168423 call!24764)))

(assert (= (and d!62427 c!44130) b!259867))

(assert (= (and d!62427 (not c!44130)) b!259869))

(assert (= (and b!259869 c!44129) b!259868))

(assert (= (and b!259869 (not c!44129)) b!259870))

(assert (= (or b!259868 b!259870) bm!24761))

(declare-fun m!275629 () Bool)

(assert (=> bm!24761 m!275629))

(assert (=> b!259869 m!275465))

(assert (=> b!259869 m!275465))

(assert (=> b!259869 m!275467))

(assert (=> b!259627 d!62427))

(declare-fun d!62429 () Bool)

(declare-fun res!127039 () Bool)

(declare-fun e!168430 () Bool)

(assert (=> d!62429 (=> res!127039 e!168430)))

(assert (=> d!62429 (= res!127039 (bvsge #b00000000000000000000000000000000 (size!6306 lt!130839)))))

(assert (=> d!62429 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130839 (mask!11106 thiss!1504)) e!168430)))

(declare-fun b!259879 () Bool)

(declare-fun e!168432 () Bool)

(declare-fun call!24767 () Bool)

(assert (=> b!259879 (= e!168432 call!24767)))

(declare-fun bm!24764 () Bool)

(assert (=> bm!24764 (= call!24767 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130839 (mask!11106 thiss!1504)))))

(declare-fun b!259880 () Bool)

(declare-fun e!168431 () Bool)

(assert (=> b!259880 (= e!168431 call!24767)))

(declare-fun b!259881 () Bool)

(assert (=> b!259881 (= e!168432 e!168431)))

(declare-fun lt!131023 () (_ BitVec 64))

(assert (=> b!259881 (= lt!131023 (select (arr!5957 lt!130839) #b00000000000000000000000000000000))))

(declare-fun lt!131025 () Unit!8073)

(assert (=> b!259881 (= lt!131025 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130839 lt!131023 #b00000000000000000000000000000000))))

(assert (=> b!259881 (arrayContainsKey!0 lt!130839 lt!131023 #b00000000000000000000000000000000)))

(declare-fun lt!131024 () Unit!8073)

(assert (=> b!259881 (= lt!131024 lt!131025)))

(declare-fun res!127040 () Bool)

(assert (=> b!259881 (= res!127040 (= (seekEntryOrOpen!0 (select (arr!5957 lt!130839) #b00000000000000000000000000000000) lt!130839 (mask!11106 thiss!1504)) (Found!1180 #b00000000000000000000000000000000)))))

(assert (=> b!259881 (=> (not res!127040) (not e!168431))))

(declare-fun b!259882 () Bool)

(assert (=> b!259882 (= e!168430 e!168432)))

(declare-fun c!44133 () Bool)

(assert (=> b!259882 (= c!44133 (validKeyInArray!0 (select (arr!5957 lt!130839) #b00000000000000000000000000000000)))))

(assert (= (and d!62429 (not res!127039)) b!259882))

(assert (= (and b!259882 c!44133) b!259881))

(assert (= (and b!259882 (not c!44133)) b!259879))

(assert (= (and b!259881 res!127040) b!259880))

(assert (= (or b!259880 b!259879) bm!24764))

(declare-fun m!275631 () Bool)

(assert (=> bm!24764 m!275631))

(assert (=> b!259881 m!275547))

(declare-fun m!275633 () Bool)

(assert (=> b!259881 m!275633))

(declare-fun m!275635 () Bool)

(assert (=> b!259881 m!275635))

(assert (=> b!259881 m!275547))

(declare-fun m!275637 () Bool)

(assert (=> b!259881 m!275637))

(assert (=> b!259882 m!275547))

(assert (=> b!259882 m!275547))

(assert (=> b!259882 m!275549))

(assert (=> b!259627 d!62429))

(declare-fun d!62431 () Bool)

(assert (=> d!62431 (arrayContainsKey!0 lt!130839 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131028 () Unit!8073)

(declare-fun choose!13 (array!12583 (_ BitVec 64) (_ BitVec 32)) Unit!8073)

(assert (=> d!62431 (= lt!131028 (choose!13 lt!130839 key!932 index!297))))

(assert (=> d!62431 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62431 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130839 key!932 index!297) lt!131028)))

(declare-fun bs!9159 () Bool)

(assert (= bs!9159 d!62431))

(assert (=> bs!9159 m!275375))

(declare-fun m!275639 () Bool)

(assert (=> bs!9159 m!275639))

(assert (=> b!259627 d!62431))

(declare-fun d!62433 () Bool)

(declare-fun res!127041 () Bool)

(declare-fun e!168433 () Bool)

(assert (=> d!62433 (=> res!127041 e!168433)))

(assert (=> d!62433 (= res!127041 (= (select (arr!5957 lt!130839) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62433 (= (arrayContainsKey!0 lt!130839 key!932 #b00000000000000000000000000000000) e!168433)))

(declare-fun b!259883 () Bool)

(declare-fun e!168434 () Bool)

(assert (=> b!259883 (= e!168433 e!168434)))

(declare-fun res!127042 () Bool)

(assert (=> b!259883 (=> (not res!127042) (not e!168434))))

(assert (=> b!259883 (= res!127042 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 lt!130839)))))

(declare-fun b!259884 () Bool)

(assert (=> b!259884 (= e!168434 (arrayContainsKey!0 lt!130839 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62433 (not res!127041)) b!259883))

(assert (= (and b!259883 res!127042) b!259884))

(assert (=> d!62433 m!275547))

(declare-fun m!275641 () Bool)

(assert (=> b!259884 m!275641))

(assert (=> b!259627 d!62433))

(declare-fun b!259885 () Bool)

(declare-fun e!168435 () (_ BitVec 32))

(assert (=> b!259885 (= e!168435 #b00000000000000000000000000000000)))

(declare-fun b!259886 () Bool)

(declare-fun e!168436 () (_ BitVec 32))

(declare-fun call!24768 () (_ BitVec 32))

(assert (=> b!259886 (= e!168436 (bvadd #b00000000000000000000000000000001 call!24768))))

(declare-fun bm!24765 () Bool)

(assert (=> bm!24765 (= call!24768 (arrayCountValidKeys!0 lt!130839 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!62435 () Bool)

(declare-fun lt!131029 () (_ BitVec 32))

(assert (=> d!62435 (and (bvsge lt!131029 #b00000000000000000000000000000000) (bvsle lt!131029 (bvsub (size!6306 lt!130839) index!297)))))

(assert (=> d!62435 (= lt!131029 e!168435)))

(declare-fun c!44135 () Bool)

(assert (=> d!62435 (= c!44135 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62435 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6306 lt!130839)))))

(assert (=> d!62435 (= (arrayCountValidKeys!0 lt!130839 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!131029)))

(declare-fun b!259887 () Bool)

(assert (=> b!259887 (= e!168435 e!168436)))

(declare-fun c!44134 () Bool)

(assert (=> b!259887 (= c!44134 (validKeyInArray!0 (select (arr!5957 lt!130839) index!297)))))

(declare-fun b!259888 () Bool)

(assert (=> b!259888 (= e!168436 call!24768)))

(assert (= (and d!62435 c!44135) b!259885))

(assert (= (and d!62435 (not c!44135)) b!259887))

(assert (= (and b!259887 c!44134) b!259886))

(assert (= (and b!259887 (not c!44134)) b!259888))

(assert (= (or b!259886 b!259888) bm!24765))

(declare-fun m!275643 () Bool)

(assert (=> bm!24765 m!275643))

(assert (=> b!259887 m!275543))

(assert (=> b!259887 m!275543))

(assert (=> b!259887 m!275545))

(assert (=> b!259627 d!62435))

(assert (=> bm!24719 d!62421))

(declare-fun b!259901 () Bool)

(declare-fun c!44143 () Bool)

(declare-fun lt!131038 () (_ BitVec 64))

(assert (=> b!259901 (= c!44143 (= lt!131038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168445 () SeekEntryResult!1180)

(declare-fun e!168443 () SeekEntryResult!1180)

(assert (=> b!259901 (= e!168445 e!168443)))

(declare-fun b!259902 () Bool)

(declare-fun lt!131036 () SeekEntryResult!1180)

(assert (=> b!259902 (= e!168443 (MissingZero!1180 (index!6892 lt!131036)))))

(declare-fun b!259903 () Bool)

(declare-fun e!168444 () SeekEntryResult!1180)

(assert (=> b!259903 (= e!168444 e!168445)))

(assert (=> b!259903 (= lt!131038 (select (arr!5957 (_keys!6965 thiss!1504)) (index!6892 lt!131036)))))

(declare-fun c!44144 () Bool)

(assert (=> b!259903 (= c!44144 (= lt!131038 key!932))))

(declare-fun b!259904 () Bool)

(assert (=> b!259904 (= e!168445 (Found!1180 (index!6892 lt!131036)))))

(declare-fun b!259905 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12583 (_ BitVec 32)) SeekEntryResult!1180)

(assert (=> b!259905 (= e!168443 (seekKeyOrZeroReturnVacant!0 (x!25100 lt!131036) (index!6892 lt!131036) (index!6892 lt!131036) key!932 (_keys!6965 thiss!1504) (mask!11106 thiss!1504)))))

(declare-fun d!62437 () Bool)

(declare-fun lt!131037 () SeekEntryResult!1180)

(assert (=> d!62437 (and (or ((_ is Undefined!1180) lt!131037) (not ((_ is Found!1180) lt!131037)) (and (bvsge (index!6891 lt!131037) #b00000000000000000000000000000000) (bvslt (index!6891 lt!131037) (size!6306 (_keys!6965 thiss!1504))))) (or ((_ is Undefined!1180) lt!131037) ((_ is Found!1180) lt!131037) (not ((_ is MissingZero!1180) lt!131037)) (and (bvsge (index!6890 lt!131037) #b00000000000000000000000000000000) (bvslt (index!6890 lt!131037) (size!6306 (_keys!6965 thiss!1504))))) (or ((_ is Undefined!1180) lt!131037) ((_ is Found!1180) lt!131037) ((_ is MissingZero!1180) lt!131037) (not ((_ is MissingVacant!1180) lt!131037)) (and (bvsge (index!6893 lt!131037) #b00000000000000000000000000000000) (bvslt (index!6893 lt!131037) (size!6306 (_keys!6965 thiss!1504))))) (or ((_ is Undefined!1180) lt!131037) (ite ((_ is Found!1180) lt!131037) (= (select (arr!5957 (_keys!6965 thiss!1504)) (index!6891 lt!131037)) key!932) (ite ((_ is MissingZero!1180) lt!131037) (= (select (arr!5957 (_keys!6965 thiss!1504)) (index!6890 lt!131037)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1180) lt!131037) (= (select (arr!5957 (_keys!6965 thiss!1504)) (index!6893 lt!131037)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62437 (= lt!131037 e!168444)))

(declare-fun c!44142 () Bool)

(assert (=> d!62437 (= c!44142 (and ((_ is Intermediate!1180) lt!131036) (undefined!1992 lt!131036)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12583 (_ BitVec 32)) SeekEntryResult!1180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62437 (= lt!131036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11106 thiss!1504)) key!932 (_keys!6965 thiss!1504) (mask!11106 thiss!1504)))))

(assert (=> d!62437 (validMask!0 (mask!11106 thiss!1504))))

(assert (=> d!62437 (= (seekEntryOrOpen!0 key!932 (_keys!6965 thiss!1504) (mask!11106 thiss!1504)) lt!131037)))

(declare-fun b!259906 () Bool)

(assert (=> b!259906 (= e!168444 Undefined!1180)))

(assert (= (and d!62437 c!44142) b!259906))

(assert (= (and d!62437 (not c!44142)) b!259903))

(assert (= (and b!259903 c!44144) b!259904))

(assert (= (and b!259903 (not c!44144)) b!259901))

(assert (= (and b!259901 c!44143) b!259902))

(assert (= (and b!259901 (not c!44143)) b!259905))

(declare-fun m!275645 () Bool)

(assert (=> b!259903 m!275645))

(declare-fun m!275647 () Bool)

(assert (=> b!259905 m!275647))

(declare-fun m!275649 () Bool)

(assert (=> d!62437 m!275649))

(declare-fun m!275651 () Bool)

(assert (=> d!62437 m!275651))

(declare-fun m!275653 () Bool)

(assert (=> d!62437 m!275653))

(declare-fun m!275655 () Bool)

(assert (=> d!62437 m!275655))

(declare-fun m!275657 () Bool)

(assert (=> d!62437 m!275657))

(assert (=> d!62437 m!275349))

(assert (=> d!62437 m!275655))

(assert (=> b!259631 d!62437))

(declare-fun d!62439 () Bool)

(declare-fun res!127049 () Bool)

(declare-fun e!168448 () Bool)

(assert (=> d!62439 (=> (not res!127049) (not e!168448))))

(declare-fun simpleValid!280 (LongMapFixedSize!3828) Bool)

(assert (=> d!62439 (= res!127049 (simpleValid!280 thiss!1504))))

(assert (=> d!62439 (= (valid!1495 thiss!1504) e!168448)))

(declare-fun b!259913 () Bool)

(declare-fun res!127050 () Bool)

(assert (=> b!259913 (=> (not res!127050) (not e!168448))))

(assert (=> b!259913 (= res!127050 (= (arrayCountValidKeys!0 (_keys!6965 thiss!1504) #b00000000000000000000000000000000 (size!6306 (_keys!6965 thiss!1504))) (_size!1963 thiss!1504)))))

(declare-fun b!259914 () Bool)

(declare-fun res!127051 () Bool)

(assert (=> b!259914 (=> (not res!127051) (not e!168448))))

(assert (=> b!259914 (= res!127051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6965 thiss!1504) (mask!11106 thiss!1504)))))

(declare-fun b!259915 () Bool)

(assert (=> b!259915 (= e!168448 (arrayNoDuplicates!0 (_keys!6965 thiss!1504) #b00000000000000000000000000000000 Nil!3820))))

(assert (= (and d!62439 res!127049) b!259913))

(assert (= (and b!259913 res!127050) b!259914))

(assert (= (and b!259914 res!127051) b!259915))

(declare-fun m!275659 () Bool)

(assert (=> d!62439 m!275659))

(assert (=> b!259913 m!275379))

(declare-fun m!275661 () Bool)

(assert (=> b!259914 m!275661))

(declare-fun m!275663 () Bool)

(assert (=> b!259915 m!275663))

(assert (=> start!24866 d!62439))

(declare-fun b!259932 () Bool)

(declare-fun e!168460 () Bool)

(declare-fun call!24774 () Bool)

(assert (=> b!259932 (= e!168460 (not call!24774))))

(declare-fun c!44150 () Bool)

(declare-fun call!24773 () Bool)

(declare-fun bm!24770 () Bool)

(declare-fun lt!131044 () SeekEntryResult!1180)

(assert (=> bm!24770 (= call!24773 (inRange!0 (ite c!44150 (index!6890 lt!131044) (index!6893 lt!131044)) (mask!11106 thiss!1504)))))

(declare-fun b!259933 () Bool)

(declare-fun e!168457 () Bool)

(declare-fun e!168459 () Bool)

(assert (=> b!259933 (= e!168457 e!168459)))

(declare-fun c!44149 () Bool)

(assert (=> b!259933 (= c!44149 ((_ is MissingVacant!1180) lt!131044))))

(declare-fun d!62441 () Bool)

(assert (=> d!62441 e!168457))

(assert (=> d!62441 (= c!44150 ((_ is MissingZero!1180) lt!131044))))

(assert (=> d!62441 (= lt!131044 (seekEntryOrOpen!0 key!932 (_keys!6965 thiss!1504) (mask!11106 thiss!1504)))))

(declare-fun lt!131043 () Unit!8073)

(declare-fun choose!1262 (array!12583 array!12581 (_ BitVec 32) (_ BitVec 32) V!8467 V!8467 (_ BitVec 64) Int) Unit!8073)

(assert (=> d!62441 (= lt!131043 (choose!1262 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) key!932 (defaultEntry!4787 thiss!1504)))))

(assert (=> d!62441 (validMask!0 (mask!11106 thiss!1504))))

(assert (=> d!62441 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!443 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) key!932 (defaultEntry!4787 thiss!1504)) lt!131043)))

(declare-fun b!259934 () Bool)

(declare-fun res!127061 () Bool)

(declare-fun e!168458 () Bool)

(assert (=> b!259934 (=> (not res!127061) (not e!168458))))

(assert (=> b!259934 (= res!127061 call!24773)))

(assert (=> b!259934 (= e!168459 e!168458)))

(declare-fun b!259935 () Bool)

(declare-fun res!127060 () Bool)

(assert (=> b!259935 (=> (not res!127060) (not e!168458))))

(assert (=> b!259935 (= res!127060 (= (select (arr!5957 (_keys!6965 thiss!1504)) (index!6893 lt!131044)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259935 (and (bvsge (index!6893 lt!131044) #b00000000000000000000000000000000) (bvslt (index!6893 lt!131044) (size!6306 (_keys!6965 thiss!1504))))))

(declare-fun b!259936 () Bool)

(assert (=> b!259936 (= e!168457 e!168460)))

(declare-fun res!127062 () Bool)

(assert (=> b!259936 (= res!127062 call!24773)))

(assert (=> b!259936 (=> (not res!127062) (not e!168460))))

(declare-fun b!259937 () Bool)

(assert (=> b!259937 (and (bvsge (index!6890 lt!131044) #b00000000000000000000000000000000) (bvslt (index!6890 lt!131044) (size!6306 (_keys!6965 thiss!1504))))))

(declare-fun res!127063 () Bool)

(assert (=> b!259937 (= res!127063 (= (select (arr!5957 (_keys!6965 thiss!1504)) (index!6890 lt!131044)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259937 (=> (not res!127063) (not e!168460))))

(declare-fun bm!24771 () Bool)

(assert (=> bm!24771 (= call!24774 (arrayContainsKey!0 (_keys!6965 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!259938 () Bool)

(assert (=> b!259938 (= e!168459 ((_ is Undefined!1180) lt!131044))))

(declare-fun b!259939 () Bool)

(assert (=> b!259939 (= e!168458 (not call!24774))))

(assert (= (and d!62441 c!44150) b!259936))

(assert (= (and d!62441 (not c!44150)) b!259933))

(assert (= (and b!259936 res!127062) b!259937))

(assert (= (and b!259937 res!127063) b!259932))

(assert (= (and b!259933 c!44149) b!259934))

(assert (= (and b!259933 (not c!44149)) b!259938))

(assert (= (and b!259934 res!127061) b!259935))

(assert (= (and b!259935 res!127060) b!259939))

(assert (= (or b!259936 b!259934) bm!24770))

(assert (= (or b!259932 b!259939) bm!24771))

(assert (=> d!62441 m!275385))

(declare-fun m!275665 () Bool)

(assert (=> d!62441 m!275665))

(assert (=> d!62441 m!275349))

(declare-fun m!275667 () Bool)

(assert (=> b!259937 m!275667))

(assert (=> bm!24771 m!275325))

(declare-fun m!275669 () Bool)

(assert (=> bm!24770 m!275669))

(declare-fun m!275671 () Bool)

(assert (=> b!259935 m!275671))

(assert (=> b!259626 d!62441))

(declare-fun d!62443 () Bool)

(declare-fun e!168463 () Bool)

(assert (=> d!62443 e!168463))

(declare-fun res!127069 () Bool)

(assert (=> d!62443 (=> (not res!127069) (not e!168463))))

(declare-fun lt!131050 () SeekEntryResult!1180)

(assert (=> d!62443 (= res!127069 ((_ is Found!1180) lt!131050))))

(assert (=> d!62443 (= lt!131050 (seekEntryOrOpen!0 key!932 (_keys!6965 thiss!1504) (mask!11106 thiss!1504)))))

(declare-fun lt!131049 () Unit!8073)

(declare-fun choose!1263 (array!12583 array!12581 (_ BitVec 32) (_ BitVec 32) V!8467 V!8467 (_ BitVec 64) Int) Unit!8073)

(assert (=> d!62443 (= lt!131049 (choose!1263 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) key!932 (defaultEntry!4787 thiss!1504)))))

(assert (=> d!62443 (validMask!0 (mask!11106 thiss!1504))))

(assert (=> d!62443 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!440 (_keys!6965 thiss!1504) (_values!4770 thiss!1504) (mask!11106 thiss!1504) (extraKeys!4524 thiss!1504) (zeroValue!4628 thiss!1504) (minValue!4628 thiss!1504) key!932 (defaultEntry!4787 thiss!1504)) lt!131049)))

(declare-fun b!259944 () Bool)

(declare-fun res!127068 () Bool)

(assert (=> b!259944 (=> (not res!127068) (not e!168463))))

(assert (=> b!259944 (= res!127068 (inRange!0 (index!6891 lt!131050) (mask!11106 thiss!1504)))))

(declare-fun b!259945 () Bool)

(assert (=> b!259945 (= e!168463 (= (select (arr!5957 (_keys!6965 thiss!1504)) (index!6891 lt!131050)) key!932))))

(assert (=> b!259945 (and (bvsge (index!6891 lt!131050) #b00000000000000000000000000000000) (bvslt (index!6891 lt!131050) (size!6306 (_keys!6965 thiss!1504))))))

(assert (= (and d!62443 res!127069) b!259944))

(assert (= (and b!259944 res!127068) b!259945))

(assert (=> d!62443 m!275385))

(declare-fun m!275673 () Bool)

(assert (=> d!62443 m!275673))

(assert (=> d!62443 m!275349))

(declare-fun m!275675 () Bool)

(assert (=> b!259944 m!275675))

(declare-fun m!275677 () Bool)

(assert (=> b!259945 m!275677))

(assert (=> b!259635 d!62443))

(declare-fun mapIsEmpty!11276 () Bool)

(declare-fun mapRes!11276 () Bool)

(assert (=> mapIsEmpty!11276 mapRes!11276))

(declare-fun b!259952 () Bool)

(declare-fun e!168468 () Bool)

(assert (=> b!259952 (= e!168468 tp_is_empty!6615)))

(declare-fun condMapEmpty!11276 () Bool)

(declare-fun mapDefault!11276 () ValueCell!2964)

(assert (=> mapNonEmpty!11270 (= condMapEmpty!11276 (= mapRest!11270 ((as const (Array (_ BitVec 32) ValueCell!2964)) mapDefault!11276)))))

(declare-fun e!168469 () Bool)

(assert (=> mapNonEmpty!11270 (= tp!23579 (and e!168469 mapRes!11276))))

(declare-fun mapNonEmpty!11276 () Bool)

(declare-fun tp!23588 () Bool)

(assert (=> mapNonEmpty!11276 (= mapRes!11276 (and tp!23588 e!168468))))

(declare-fun mapValue!11276 () ValueCell!2964)

(declare-fun mapKey!11276 () (_ BitVec 32))

(declare-fun mapRest!11276 () (Array (_ BitVec 32) ValueCell!2964))

(assert (=> mapNonEmpty!11276 (= mapRest!11270 (store mapRest!11276 mapKey!11276 mapValue!11276))))

(declare-fun b!259953 () Bool)

(assert (=> b!259953 (= e!168469 tp_is_empty!6615)))

(assert (= (and mapNonEmpty!11270 condMapEmpty!11276) mapIsEmpty!11276))

(assert (= (and mapNonEmpty!11270 (not condMapEmpty!11276)) mapNonEmpty!11276))

(assert (= (and mapNonEmpty!11276 ((_ is ValueCellFull!2964) mapValue!11276)) b!259952))

(assert (= (and mapNonEmpty!11270 ((_ is ValueCellFull!2964) mapDefault!11276)) b!259953))

(declare-fun m!275679 () Bool)

(assert (=> mapNonEmpty!11276 m!275679))

(declare-fun b_lambda!8255 () Bool)

(assert (= b_lambda!8253 (or (and b!259628 b_free!6753) b_lambda!8255)))

(declare-fun b_lambda!8257 () Bool)

(assert (= b_lambda!8251 (or (and b!259628 b_free!6753) b_lambda!8257)))

(check-sat (not b!259869) (not b!259838) (not b!259913) (not d!62407) (not b!259887) (not b!259712) (not b!259757) (not d!62401) (not b!259764) (not d!62411) (not b!259944) (not b!259784) (not b!259812) (not bm!24761) (not bm!24756) (not b!259788) (not bm!24750) (not b_lambda!8255) (not b!259807) (not bm!24760) (not d!62405) (not bm!24745) (not b!259915) (not bm!24746) (not b!259835) (not b!259772) b_and!13861 (not d!62441) (not b!259785) tp_is_empty!6615 (not b!259865) (not b!259845) (not b!259840) (not d!62419) (not b!259808) (not b!259770) (not bm!24752) (not b!259905) (not b!259809) (not b!259881) (not d!62423) (not d!62431) (not b!259833) (not b!259914) (not b_lambda!8257) (not b!259837) (not bm!24771) (not bm!24755) (not bm!24770) (not bm!24747) (not mapNonEmpty!11276) (not b!259767) (not d!62417) (not b_next!6753) (not bm!24757) (not b!259854) (not d!62437) (not b!259851) (not b!259769) (not bm!24765) (not b!259882) (not d!62443) (not d!62399) (not d!62415) (not b!259821) (not b!259777) (not b!259824) (not b!259765) (not bm!24742) (not b!259714) (not b!259825) (not d!62439) (not b!259884) (not bm!24764) (not d!62403) (not b!259793) (not b!259822) (not b!259832))
(check-sat b_and!13861 (not b_next!6753))
