; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22148 () Bool)

(assert start!22148)

(declare-fun b!230867 () Bool)

(declare-fun b_free!6211 () Bool)

(declare-fun b_next!6211 () Bool)

(assert (=> b!230867 (= b_free!6211 (not b_next!6211))))

(declare-fun tp!21774 () Bool)

(declare-fun b_and!13083 () Bool)

(assert (=> b!230867 (= tp!21774 b_and!13083)))

(declare-fun b!230853 () Bool)

(declare-fun e!149842 () Bool)

(declare-fun e!149845 () Bool)

(assert (=> b!230853 (= e!149842 e!149845)))

(declare-fun res!113468 () Bool)

(assert (=> b!230853 (=> (not res!113468) (not e!149845))))

(declare-datatypes ((SeekEntryResult!944 0))(
  ( (MissingZero!944 (index!5946 (_ BitVec 32))) (Found!944 (index!5947 (_ BitVec 32))) (Intermediate!944 (undefined!1756 Bool) (index!5948 (_ BitVec 32)) (x!23475 (_ BitVec 32))) (Undefined!944) (MissingVacant!944 (index!5949 (_ BitVec 32))) )
))
(declare-fun lt!116188 () SeekEntryResult!944)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230853 (= res!113468 (or (= lt!116188 (MissingZero!944 index!297)) (= lt!116188 (MissingVacant!944 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7745 0))(
  ( (V!7746 (val!3081 Int)) )
))
(declare-datatypes ((ValueCell!2693 0))(
  ( (ValueCellFull!2693 (v!5095 V!7745)) (EmptyCell!2693) )
))
(declare-datatypes ((array!11381 0))(
  ( (array!11382 (arr!5409 (Array (_ BitVec 32) ValueCell!2693)) (size!5743 (_ BitVec 32))) )
))
(declare-datatypes ((array!11383 0))(
  ( (array!11384 (arr!5410 (Array (_ BitVec 32) (_ BitVec 64))) (size!5744 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3286 0))(
  ( (LongMapFixedSize!3287 (defaultEntry!4302 Int) (mask!10199 (_ BitVec 32)) (extraKeys!4039 (_ BitVec 32)) (zeroValue!4143 V!7745) (minValue!4143 V!7745) (_size!1692 (_ BitVec 32)) (_keys!6355 array!11383) (_values!4285 array!11381) (_vacant!1692 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3286)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11383 (_ BitVec 32)) SeekEntryResult!944)

(assert (=> b!230853 (= lt!116188 (seekEntryOrOpen!0 key!932 (_keys!6355 thiss!1504) (mask!10199 thiss!1504)))))

(declare-fun b!230854 () Bool)

(declare-datatypes ((Unit!7063 0))(
  ( (Unit!7064) )
))
(declare-fun e!149843 () Unit!7063)

(declare-fun Unit!7065 () Unit!7063)

(assert (=> b!230854 (= e!149843 Unit!7065)))

(declare-fun lt!116184 () Unit!7063)

(declare-fun lemmaArrayContainsKeyThenInListMap!138 (array!11383 array!11381 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 64) (_ BitVec 32) Int) Unit!7063)

(assert (=> b!230854 (= lt!116184 (lemmaArrayContainsKeyThenInListMap!138 (_keys!6355 thiss!1504) (_values!4285 thiss!1504) (mask!10199 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4302 thiss!1504)))))

(assert (=> b!230854 false))

(declare-fun b!230855 () Bool)

(declare-fun e!149838 () Bool)

(assert (=> b!230855 (= e!149845 e!149838)))

(declare-fun res!113469 () Bool)

(assert (=> b!230855 (=> (not res!113469) (not e!149838))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230855 (= res!113469 (inRange!0 index!297 (mask!10199 thiss!1504)))))

(declare-fun lt!116183 () Unit!7063)

(declare-fun e!149846 () Unit!7063)

(assert (=> b!230855 (= lt!116183 e!149846)))

(declare-fun c!38337 () Bool)

(declare-datatypes ((tuple2!4516 0))(
  ( (tuple2!4517 (_1!2269 (_ BitVec 64)) (_2!2269 V!7745)) )
))
(declare-datatypes ((List!3454 0))(
  ( (Nil!3451) (Cons!3450 (h!4098 tuple2!4516) (t!8404 List!3454)) )
))
(declare-datatypes ((ListLongMap!3419 0))(
  ( (ListLongMap!3420 (toList!1725 List!3454)) )
))
(declare-fun lt!116182 () ListLongMap!3419)

(declare-fun contains!1599 (ListLongMap!3419 (_ BitVec 64)) Bool)

(assert (=> b!230855 (= c!38337 (contains!1599 lt!116182 key!932))))

(declare-fun getCurrentListMap!1234 (array!11383 array!11381 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 32) Int) ListLongMap!3419)

(assert (=> b!230855 (= lt!116182 (getCurrentListMap!1234 (_keys!6355 thiss!1504) (_values!4285 thiss!1504) (mask!10199 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4302 thiss!1504)))))

(declare-fun b!230856 () Bool)

(declare-fun e!149836 () Bool)

(get-info :version)

(assert (=> b!230856 (= e!149836 ((_ is Undefined!944) lt!116188))))

(declare-fun bm!21440 () Bool)

(declare-fun call!21443 () Bool)

(declare-fun arrayContainsKey!0 (array!11383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21440 (= call!21443 (arrayContainsKey!0 (_keys!6355 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230857 () Bool)

(declare-fun res!113471 () Bool)

(declare-fun e!149837 () Bool)

(assert (=> b!230857 (=> (not res!113471) (not e!149837))))

(assert (=> b!230857 (= res!113471 (= (select (arr!5410 (_keys!6355 thiss!1504)) (index!5946 lt!116188)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230858 () Bool)

(declare-fun Unit!7066 () Unit!7063)

(assert (=> b!230858 (= e!149843 Unit!7066)))

(declare-fun mapIsEmpty!10279 () Bool)

(declare-fun mapRes!10279 () Bool)

(assert (=> mapIsEmpty!10279 mapRes!10279))

(declare-fun b!230859 () Bool)

(declare-fun res!113472 () Bool)

(assert (=> b!230859 (=> (not res!113472) (not e!149837))))

(declare-fun call!21444 () Bool)

(assert (=> b!230859 (= res!113472 call!21444)))

(declare-fun e!149847 () Bool)

(assert (=> b!230859 (= e!149847 e!149837)))

(declare-fun b!230860 () Bool)

(declare-fun lt!116180 () Unit!7063)

(assert (=> b!230860 (= e!149846 lt!116180)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!294 (array!11383 array!11381 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 64) Int) Unit!7063)

(assert (=> b!230860 (= lt!116180 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!294 (_keys!6355 thiss!1504) (_values!4285 thiss!1504) (mask!10199 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) key!932 (defaultEntry!4302 thiss!1504)))))

(declare-fun c!38336 () Bool)

(assert (=> b!230860 (= c!38336 ((_ is MissingZero!944) lt!116188))))

(assert (=> b!230860 e!149847))

(declare-fun b!230861 () Bool)

(declare-fun e!149839 () Bool)

(assert (=> b!230861 (= e!149839 (not call!21443))))

(declare-fun b!230862 () Bool)

(declare-fun res!113474 () Bool)

(assert (=> b!230862 (= res!113474 (= (select (arr!5410 (_keys!6355 thiss!1504)) (index!5949 lt!116188)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230862 (=> (not res!113474) (not e!149839))))

(declare-fun mapNonEmpty!10279 () Bool)

(declare-fun tp!21775 () Bool)

(declare-fun e!149841 () Bool)

(assert (=> mapNonEmpty!10279 (= mapRes!10279 (and tp!21775 e!149841))))

(declare-fun mapKey!10279 () (_ BitVec 32))

(declare-fun mapValue!10279 () ValueCell!2693)

(declare-fun mapRest!10279 () (Array (_ BitVec 32) ValueCell!2693))

(assert (=> mapNonEmpty!10279 (= (arr!5409 (_values!4285 thiss!1504)) (store mapRest!10279 mapKey!10279 mapValue!10279))))

(declare-fun res!113467 () Bool)

(assert (=> start!22148 (=> (not res!113467) (not e!149842))))

(declare-fun valid!1321 (LongMapFixedSize!3286) Bool)

(assert (=> start!22148 (= res!113467 (valid!1321 thiss!1504))))

(assert (=> start!22148 e!149842))

(declare-fun e!149844 () Bool)

(assert (=> start!22148 e!149844))

(assert (=> start!22148 true))

(declare-fun tp_is_empty!6073 () Bool)

(assert (=> start!22148 tp_is_empty!6073))

(declare-fun b!230863 () Bool)

(declare-fun c!38338 () Bool)

(assert (=> b!230863 (= c!38338 ((_ is MissingVacant!944) lt!116188))))

(assert (=> b!230863 (= e!149847 e!149836)))

(declare-fun b!230864 () Bool)

(assert (=> b!230864 (= e!149841 tp_is_empty!6073)))

(declare-fun b!230865 () Bool)

(assert (=> b!230865 (= e!149836 e!149839)))

(declare-fun res!113470 () Bool)

(assert (=> b!230865 (= res!113470 call!21444)))

(assert (=> b!230865 (=> (not res!113470) (not e!149839))))

(declare-fun b!230866 () Bool)

(assert (=> b!230866 (= e!149838 (not true))))

(declare-fun lt!116186 () array!11383)

(declare-fun arrayCountValidKeys!0 (array!11383 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230866 (= (arrayCountValidKeys!0 lt!116186 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116179 () Unit!7063)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11383 (_ BitVec 32)) Unit!7063)

(assert (=> b!230866 (= lt!116179 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116186 index!297))))

(assert (=> b!230866 (arrayContainsKey!0 lt!116186 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116178 () Unit!7063)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11383 (_ BitVec 64) (_ BitVec 32)) Unit!7063)

(assert (=> b!230866 (= lt!116178 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116186 key!932 index!297))))

(declare-fun v!346 () V!7745)

(declare-fun +!611 (ListLongMap!3419 tuple2!4516) ListLongMap!3419)

(assert (=> b!230866 (= (+!611 lt!116182 (tuple2!4517 key!932 v!346)) (getCurrentListMap!1234 lt!116186 (array!11382 (store (arr!5409 (_values!4285 thiss!1504)) index!297 (ValueCellFull!2693 v!346)) (size!5743 (_values!4285 thiss!1504))) (mask!10199 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4302 thiss!1504)))))

(declare-fun lt!116185 () Unit!7063)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!66 (array!11383 array!11381 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 32) (_ BitVec 64) V!7745 Int) Unit!7063)

(assert (=> b!230866 (= lt!116185 (lemmaAddValidKeyToArrayThenAddPairToListMap!66 (_keys!6355 thiss!1504) (_values!4285 thiss!1504) (mask!10199 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) index!297 key!932 v!346 (defaultEntry!4302 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11383 (_ BitVec 32)) Bool)

(assert (=> b!230866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116186 (mask!10199 thiss!1504))))

(declare-fun lt!116189 () Unit!7063)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11383 (_ BitVec 32) (_ BitVec 32)) Unit!7063)

(assert (=> b!230866 (= lt!116189 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6355 thiss!1504) index!297 (mask!10199 thiss!1504)))))

(assert (=> b!230866 (= (arrayCountValidKeys!0 lt!116186 #b00000000000000000000000000000000 (size!5744 (_keys!6355 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6355 thiss!1504) #b00000000000000000000000000000000 (size!5744 (_keys!6355 thiss!1504)))))))

(declare-fun lt!116191 () Unit!7063)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11383 (_ BitVec 32) (_ BitVec 64)) Unit!7063)

(assert (=> b!230866 (= lt!116191 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6355 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3455 0))(
  ( (Nil!3452) (Cons!3451 (h!4099 (_ BitVec 64)) (t!8405 List!3455)) )
))
(declare-fun arrayNoDuplicates!0 (array!11383 (_ BitVec 32) List!3455) Bool)

(assert (=> b!230866 (arrayNoDuplicates!0 lt!116186 #b00000000000000000000000000000000 Nil!3452)))

(assert (=> b!230866 (= lt!116186 (array!11384 (store (arr!5410 (_keys!6355 thiss!1504)) index!297 key!932) (size!5744 (_keys!6355 thiss!1504))))))

(declare-fun lt!116181 () Unit!7063)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11383 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3455) Unit!7063)

(assert (=> b!230866 (= lt!116181 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6355 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3452))))

(declare-fun lt!116190 () Unit!7063)

(assert (=> b!230866 (= lt!116190 e!149843)))

(declare-fun c!38335 () Bool)

(assert (=> b!230866 (= c!38335 (arrayContainsKey!0 (_keys!6355 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!149835 () Bool)

(declare-fun array_inv!3571 (array!11383) Bool)

(declare-fun array_inv!3572 (array!11381) Bool)

(assert (=> b!230867 (= e!149844 (and tp!21774 tp_is_empty!6073 (array_inv!3571 (_keys!6355 thiss!1504)) (array_inv!3572 (_values!4285 thiss!1504)) e!149835))))

(declare-fun b!230868 () Bool)

(declare-fun res!113473 () Bool)

(assert (=> b!230868 (=> (not res!113473) (not e!149842))))

(assert (=> b!230868 (= res!113473 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230869 () Bool)

(declare-fun e!149834 () Bool)

(assert (=> b!230869 (= e!149835 (and e!149834 mapRes!10279))))

(declare-fun condMapEmpty!10279 () Bool)

(declare-fun mapDefault!10279 () ValueCell!2693)

(assert (=> b!230869 (= condMapEmpty!10279 (= (arr!5409 (_values!4285 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2693)) mapDefault!10279)))))

(declare-fun b!230870 () Bool)

(assert (=> b!230870 (= e!149834 tp_is_empty!6073)))

(declare-fun b!230871 () Bool)

(assert (=> b!230871 (= e!149837 (not call!21443))))

(declare-fun b!230872 () Bool)

(declare-fun Unit!7067 () Unit!7063)

(assert (=> b!230872 (= e!149846 Unit!7067)))

(declare-fun lt!116187 () Unit!7063)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!298 (array!11383 array!11381 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 64) Int) Unit!7063)

(assert (=> b!230872 (= lt!116187 (lemmaInListMapThenSeekEntryOrOpenFindsIt!298 (_keys!6355 thiss!1504) (_values!4285 thiss!1504) (mask!10199 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) key!932 (defaultEntry!4302 thiss!1504)))))

(assert (=> b!230872 false))

(declare-fun bm!21441 () Bool)

(assert (=> bm!21441 (= call!21444 (inRange!0 (ite c!38336 (index!5946 lt!116188) (index!5949 lt!116188)) (mask!10199 thiss!1504)))))

(assert (= (and start!22148 res!113467) b!230868))

(assert (= (and b!230868 res!113473) b!230853))

(assert (= (and b!230853 res!113468) b!230855))

(assert (= (and b!230855 c!38337) b!230872))

(assert (= (and b!230855 (not c!38337)) b!230860))

(assert (= (and b!230860 c!38336) b!230859))

(assert (= (and b!230860 (not c!38336)) b!230863))

(assert (= (and b!230859 res!113472) b!230857))

(assert (= (and b!230857 res!113471) b!230871))

(assert (= (and b!230863 c!38338) b!230865))

(assert (= (and b!230863 (not c!38338)) b!230856))

(assert (= (and b!230865 res!113470) b!230862))

(assert (= (and b!230862 res!113474) b!230861))

(assert (= (or b!230859 b!230865) bm!21441))

(assert (= (or b!230871 b!230861) bm!21440))

(assert (= (and b!230855 res!113469) b!230866))

(assert (= (and b!230866 c!38335) b!230854))

(assert (= (and b!230866 (not c!38335)) b!230858))

(assert (= (and b!230869 condMapEmpty!10279) mapIsEmpty!10279))

(assert (= (and b!230869 (not condMapEmpty!10279)) mapNonEmpty!10279))

(assert (= (and mapNonEmpty!10279 ((_ is ValueCellFull!2693) mapValue!10279)) b!230864))

(assert (= (and b!230869 ((_ is ValueCellFull!2693) mapDefault!10279)) b!230870))

(assert (= b!230867 b!230869))

(assert (= start!22148 b!230867))

(declare-fun m!251761 () Bool)

(assert (=> bm!21440 m!251761))

(declare-fun m!251763 () Bool)

(assert (=> b!230854 m!251763))

(declare-fun m!251765 () Bool)

(assert (=> start!22148 m!251765))

(declare-fun m!251767 () Bool)

(assert (=> b!230862 m!251767))

(declare-fun m!251769 () Bool)

(assert (=> b!230867 m!251769))

(declare-fun m!251771 () Bool)

(assert (=> b!230867 m!251771))

(declare-fun m!251773 () Bool)

(assert (=> mapNonEmpty!10279 m!251773))

(declare-fun m!251775 () Bool)

(assert (=> b!230853 m!251775))

(declare-fun m!251777 () Bool)

(assert (=> b!230857 m!251777))

(declare-fun m!251779 () Bool)

(assert (=> b!230860 m!251779))

(declare-fun m!251781 () Bool)

(assert (=> bm!21441 m!251781))

(declare-fun m!251783 () Bool)

(assert (=> b!230872 m!251783))

(declare-fun m!251785 () Bool)

(assert (=> b!230855 m!251785))

(declare-fun m!251787 () Bool)

(assert (=> b!230855 m!251787))

(declare-fun m!251789 () Bool)

(assert (=> b!230855 m!251789))

(assert (=> b!230866 m!251761))

(declare-fun m!251791 () Bool)

(assert (=> b!230866 m!251791))

(declare-fun m!251793 () Bool)

(assert (=> b!230866 m!251793))

(declare-fun m!251795 () Bool)

(assert (=> b!230866 m!251795))

(declare-fun m!251797 () Bool)

(assert (=> b!230866 m!251797))

(declare-fun m!251799 () Bool)

(assert (=> b!230866 m!251799))

(declare-fun m!251801 () Bool)

(assert (=> b!230866 m!251801))

(declare-fun m!251803 () Bool)

(assert (=> b!230866 m!251803))

(declare-fun m!251805 () Bool)

(assert (=> b!230866 m!251805))

(declare-fun m!251807 () Bool)

(assert (=> b!230866 m!251807))

(declare-fun m!251809 () Bool)

(assert (=> b!230866 m!251809))

(declare-fun m!251811 () Bool)

(assert (=> b!230866 m!251811))

(declare-fun m!251813 () Bool)

(assert (=> b!230866 m!251813))

(declare-fun m!251815 () Bool)

(assert (=> b!230866 m!251815))

(declare-fun m!251817 () Bool)

(assert (=> b!230866 m!251817))

(declare-fun m!251819 () Bool)

(assert (=> b!230866 m!251819))

(declare-fun m!251821 () Bool)

(assert (=> b!230866 m!251821))

(check-sat (not b!230872) (not mapNonEmpty!10279) (not b_next!6211) (not bm!21441) (not b!230866) (not start!22148) (not bm!21440) (not b!230867) (not b!230855) (not b!230860) (not b!230854) b_and!13083 tp_is_empty!6073 (not b!230853))
(check-sat b_and!13083 (not b_next!6211))
