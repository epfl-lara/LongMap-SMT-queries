; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24762 () Bool)

(assert start!24762)

(declare-fun b!258835 () Bool)

(declare-fun b_free!6747 () Bool)

(declare-fun b_next!6747 () Bool)

(assert (=> b!258835 (= b_free!6747 (not b_next!6747))))

(declare-fun tp!23556 () Bool)

(declare-fun b_and!13835 () Bool)

(assert (=> b!258835 (= tp!23556 b_and!13835)))

(declare-fun b!258817 () Bool)

(declare-datatypes ((Unit!8045 0))(
  ( (Unit!8046) )
))
(declare-fun e!167767 () Unit!8045)

(declare-fun Unit!8047 () Unit!8045)

(assert (=> b!258817 (= e!167767 Unit!8047)))

(declare-fun lt!130327 () Unit!8045)

(declare-datatypes ((V!8459 0))(
  ( (V!8460 (val!3349 Int)) )
))
(declare-datatypes ((ValueCell!2961 0))(
  ( (ValueCellFull!2961 (v!5453 V!8459)) (EmptyCell!2961) )
))
(declare-datatypes ((array!12567 0))(
  ( (array!12568 (arr!5950 (Array (_ BitVec 32) ValueCell!2961)) (size!6298 (_ BitVec 32))) )
))
(declare-datatypes ((array!12569 0))(
  ( (array!12570 (arr!5951 (Array (_ BitVec 32) (_ BitVec 64))) (size!6299 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3822 0))(
  ( (LongMapFixedSize!3823 (defaultEntry!4774 Int) (mask!11082 (_ BitVec 32)) (extraKeys!4511 (_ BitVec 32)) (zeroValue!4615 V!8459) (minValue!4615 V!8459) (_size!1960 (_ BitVec 32)) (_keys!6948 array!12569) (_values!4757 array!12567) (_vacant!1960 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3822)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!438 (array!12569 array!12567 (_ BitVec 32) (_ BitVec 32) V!8459 V!8459 (_ BitVec 64) Int) Unit!8045)

(assert (=> b!258817 (= lt!130327 (lemmaInListMapThenSeekEntryOrOpenFindsIt!438 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 (defaultEntry!4774 thiss!1504)))))

(assert (=> b!258817 false))

(declare-fun b!258818 () Bool)

(declare-fun e!167754 () Unit!8045)

(declare-fun Unit!8048 () Unit!8045)

(assert (=> b!258818 (= e!167754 Unit!8048)))

(declare-fun lt!130330 () Unit!8045)

(declare-fun lemmaArrayContainsKeyThenInListMap!246 (array!12569 array!12567 (_ BitVec 32) (_ BitVec 32) V!8459 V!8459 (_ BitVec 64) (_ BitVec 32) Int) Unit!8045)

(assert (=> b!258818 (= lt!130330 (lemmaArrayContainsKeyThenInListMap!246 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(assert (=> b!258818 false))

(declare-fun b!258819 () Bool)

(declare-fun lt!130332 () Unit!8045)

(assert (=> b!258819 (= e!167767 lt!130332)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!440 (array!12569 array!12567 (_ BitVec 32) (_ BitVec 32) V!8459 V!8459 (_ BitVec 64) Int) Unit!8045)

(assert (=> b!258819 (= lt!130332 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!440 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 (defaultEntry!4774 thiss!1504)))))

(declare-fun c!43882 () Bool)

(declare-datatypes ((SeekEntryResult!1177 0))(
  ( (MissingZero!1177 (index!6878 (_ BitVec 32))) (Found!1177 (index!6879 (_ BitVec 32))) (Intermediate!1177 (undefined!1989 Bool) (index!6880 (_ BitVec 32)) (x!25071 (_ BitVec 32))) (Undefined!1177) (MissingVacant!1177 (index!6881 (_ BitVec 32))) )
))
(declare-fun lt!130329 () SeekEntryResult!1177)

(get-info :version)

(assert (=> b!258819 (= c!43882 ((_ is MissingZero!1177) lt!130329))))

(declare-fun e!167768 () Bool)

(assert (=> b!258819 e!167768))

(declare-fun b!258820 () Bool)

(declare-fun e!167759 () Bool)

(declare-fun e!167761 () Bool)

(assert (=> b!258820 (= e!167759 e!167761)))

(declare-fun res!126551 () Bool)

(declare-fun call!24623 () Bool)

(assert (=> b!258820 (= res!126551 call!24623)))

(assert (=> b!258820 (=> (not res!126551) (not e!167761))))

(declare-fun b!258821 () Bool)

(declare-fun e!167756 () Bool)

(declare-fun tp_is_empty!6609 () Bool)

(assert (=> b!258821 (= e!167756 tp_is_empty!6609)))

(declare-fun b!258822 () Bool)

(declare-fun res!126548 () Bool)

(declare-fun e!167760 () Bool)

(assert (=> b!258822 (=> (not res!126548) (not e!167760))))

(assert (=> b!258822 (= res!126548 call!24623)))

(assert (=> b!258822 (= e!167768 e!167760)))

(declare-fun b!258824 () Bool)

(declare-fun res!126549 () Bool)

(declare-fun e!167758 () Bool)

(assert (=> b!258824 (=> (not res!126549) (not e!167758))))

(assert (=> b!258824 (= res!126549 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!258825 () Bool)

(declare-fun res!126554 () Bool)

(assert (=> b!258825 (=> (not res!126554) (not e!167760))))

(assert (=> b!258825 (= res!126554 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6878 lt!130329)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!258826 () Bool)

(declare-fun e!167755 () Bool)

(declare-fun e!167765 () Bool)

(assert (=> b!258826 (= e!167755 (not e!167765))))

(declare-fun res!126552 () Bool)

(assert (=> b!258826 (=> res!126552 e!167765)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!258826 (= res!126552 (not (validMask!0 (mask!11082 thiss!1504))))))

(declare-fun lt!130324 () array!12569)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12569 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!258826 (= (arrayCountValidKeys!0 lt!130324 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!130335 () Unit!8045)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12569 (_ BitVec 32)) Unit!8045)

(assert (=> b!258826 (= lt!130335 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130324 index!297))))

(declare-fun arrayContainsKey!0 (array!12569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!258826 (arrayContainsKey!0 lt!130324 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130325 () Unit!8045)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12569 (_ BitVec 64) (_ BitVec 32)) Unit!8045)

(assert (=> b!258826 (= lt!130325 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130324 key!932 index!297))))

(declare-fun v!346 () V!8459)

(declare-datatypes ((tuple2!4938 0))(
  ( (tuple2!4939 (_1!2480 (_ BitVec 64)) (_2!2480 V!8459)) )
))
(declare-datatypes ((List!3817 0))(
  ( (Nil!3814) (Cons!3813 (h!4476 tuple2!4938) (t!8882 List!3817)) )
))
(declare-datatypes ((ListLongMap!3851 0))(
  ( (ListLongMap!3852 (toList!1941 List!3817)) )
))
(declare-fun lt!130333 () ListLongMap!3851)

(declare-fun +!695 (ListLongMap!3851 tuple2!4938) ListLongMap!3851)

(declare-fun getCurrentListMap!1469 (array!12569 array!12567 (_ BitVec 32) (_ BitVec 32) V!8459 V!8459 (_ BitVec 32) Int) ListLongMap!3851)

(assert (=> b!258826 (= (+!695 lt!130333 (tuple2!4939 key!932 v!346)) (getCurrentListMap!1469 lt!130324 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130334 () Unit!8045)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!105 (array!12569 array!12567 (_ BitVec 32) (_ BitVec 32) V!8459 V!8459 (_ BitVec 32) (_ BitVec 64) V!8459 Int) Unit!8045)

(assert (=> b!258826 (= lt!130334 (lemmaAddValidKeyToArrayThenAddPairToListMap!105 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) index!297 key!932 v!346 (defaultEntry!4774 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12569 (_ BitVec 32)) Bool)

(assert (=> b!258826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130324 (mask!11082 thiss!1504))))

(declare-fun lt!130331 () Unit!8045)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12569 (_ BitVec 32) (_ BitVec 32)) Unit!8045)

(assert (=> b!258826 (= lt!130331 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6948 thiss!1504) index!297 (mask!11082 thiss!1504)))))

(assert (=> b!258826 (= (arrayCountValidKeys!0 lt!130324 #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6948 thiss!1504) #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504)))))))

(declare-fun lt!130326 () Unit!8045)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12569 (_ BitVec 32) (_ BitVec 64)) Unit!8045)

(assert (=> b!258826 (= lt!130326 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6948 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3818 0))(
  ( (Nil!3815) (Cons!3814 (h!4477 (_ BitVec 64)) (t!8883 List!3818)) )
))
(declare-fun arrayNoDuplicates!0 (array!12569 (_ BitVec 32) List!3818) Bool)

(assert (=> b!258826 (arrayNoDuplicates!0 lt!130324 #b00000000000000000000000000000000 Nil!3815)))

(assert (=> b!258826 (= lt!130324 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun lt!130328 () Unit!8045)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3818) Unit!8045)

(assert (=> b!258826 (= lt!130328 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6948 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3815))))

(declare-fun lt!130322 () Unit!8045)

(assert (=> b!258826 (= lt!130322 e!167754)))

(declare-fun c!43885 () Bool)

(assert (=> b!258826 (= c!43885 (arrayContainsKey!0 (_keys!6948 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258827 () Bool)

(declare-fun e!167763 () Bool)

(assert (=> b!258827 (= e!167763 e!167755)))

(declare-fun res!126547 () Bool)

(assert (=> b!258827 (=> (not res!126547) (not e!167755))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!258827 (= res!126547 (inRange!0 index!297 (mask!11082 thiss!1504)))))

(declare-fun lt!130323 () Unit!8045)

(assert (=> b!258827 (= lt!130323 e!167767)))

(declare-fun c!43883 () Bool)

(declare-fun contains!1882 (ListLongMap!3851 (_ BitVec 64)) Bool)

(assert (=> b!258827 (= c!43883 (contains!1882 lt!130333 key!932))))

(assert (=> b!258827 (= lt!130333 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun b!258828 () Bool)

(declare-fun res!126553 () Bool)

(assert (=> b!258828 (= res!126553 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6881 lt!130329)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!258828 (=> (not res!126553) (not e!167761))))

(declare-fun b!258829 () Bool)

(assert (=> b!258829 (= e!167765 (or (not (= (size!6298 (_values!4757 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11082 thiss!1504)))) (= (size!6299 (_keys!6948 thiss!1504)) (size!6298 (_values!4757 thiss!1504)))))))

(declare-fun b!258830 () Bool)

(declare-fun c!43884 () Bool)

(assert (=> b!258830 (= c!43884 ((_ is MissingVacant!1177) lt!130329))))

(assert (=> b!258830 (= e!167768 e!167759)))

(declare-fun b!258831 () Bool)

(assert (=> b!258831 (= e!167758 e!167763)))

(declare-fun res!126546 () Bool)

(assert (=> b!258831 (=> (not res!126546) (not e!167763))))

(assert (=> b!258831 (= res!126546 (or (= lt!130329 (MissingZero!1177 index!297)) (= lt!130329 (MissingVacant!1177 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12569 (_ BitVec 32)) SeekEntryResult!1177)

(assert (=> b!258831 (= lt!130329 (seekEntryOrOpen!0 key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(declare-fun b!258832 () Bool)

(declare-fun call!24622 () Bool)

(assert (=> b!258832 (= e!167760 (not call!24622))))

(declare-fun b!258833 () Bool)

(declare-fun Unit!8049 () Unit!8045)

(assert (=> b!258833 (= e!167754 Unit!8049)))

(declare-fun bm!24619 () Bool)

(assert (=> bm!24619 (= call!24622 (arrayContainsKey!0 (_keys!6948 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258834 () Bool)

(declare-fun e!167757 () Bool)

(declare-fun e!167766 () Bool)

(declare-fun mapRes!11257 () Bool)

(assert (=> b!258834 (= e!167757 (and e!167766 mapRes!11257))))

(declare-fun condMapEmpty!11257 () Bool)

(declare-fun mapDefault!11257 () ValueCell!2961)

(assert (=> b!258834 (= condMapEmpty!11257 (= (arr!5950 (_values!4757 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2961)) mapDefault!11257)))))

(declare-fun e!167764 () Bool)

(declare-fun array_inv!3931 (array!12569) Bool)

(declare-fun array_inv!3932 (array!12567) Bool)

(assert (=> b!258835 (= e!167764 (and tp!23556 tp_is_empty!6609 (array_inv!3931 (_keys!6948 thiss!1504)) (array_inv!3932 (_values!4757 thiss!1504)) e!167757))))

(declare-fun b!258836 () Bool)

(assert (=> b!258836 (= e!167759 ((_ is Undefined!1177) lt!130329))))

(declare-fun res!126550 () Bool)

(assert (=> start!24762 (=> (not res!126550) (not e!167758))))

(declare-fun valid!1492 (LongMapFixedSize!3822) Bool)

(assert (=> start!24762 (= res!126550 (valid!1492 thiss!1504))))

(assert (=> start!24762 e!167758))

(assert (=> start!24762 e!167764))

(assert (=> start!24762 true))

(assert (=> start!24762 tp_is_empty!6609))

(declare-fun b!258823 () Bool)

(assert (=> b!258823 (= e!167761 (not call!24622))))

(declare-fun bm!24620 () Bool)

(assert (=> bm!24620 (= call!24623 (inRange!0 (ite c!43882 (index!6878 lt!130329) (index!6881 lt!130329)) (mask!11082 thiss!1504)))))

(declare-fun mapIsEmpty!11257 () Bool)

(assert (=> mapIsEmpty!11257 mapRes!11257))

(declare-fun mapNonEmpty!11257 () Bool)

(declare-fun tp!23557 () Bool)

(assert (=> mapNonEmpty!11257 (= mapRes!11257 (and tp!23557 e!167756))))

(declare-fun mapValue!11257 () ValueCell!2961)

(declare-fun mapKey!11257 () (_ BitVec 32))

(declare-fun mapRest!11257 () (Array (_ BitVec 32) ValueCell!2961))

(assert (=> mapNonEmpty!11257 (= (arr!5950 (_values!4757 thiss!1504)) (store mapRest!11257 mapKey!11257 mapValue!11257))))

(declare-fun b!258837 () Bool)

(assert (=> b!258837 (= e!167766 tp_is_empty!6609)))

(assert (= (and start!24762 res!126550) b!258824))

(assert (= (and b!258824 res!126549) b!258831))

(assert (= (and b!258831 res!126546) b!258827))

(assert (= (and b!258827 c!43883) b!258817))

(assert (= (and b!258827 (not c!43883)) b!258819))

(assert (= (and b!258819 c!43882) b!258822))

(assert (= (and b!258819 (not c!43882)) b!258830))

(assert (= (and b!258822 res!126548) b!258825))

(assert (= (and b!258825 res!126554) b!258832))

(assert (= (and b!258830 c!43884) b!258820))

(assert (= (and b!258830 (not c!43884)) b!258836))

(assert (= (and b!258820 res!126551) b!258828))

(assert (= (and b!258828 res!126553) b!258823))

(assert (= (or b!258822 b!258820) bm!24620))

(assert (= (or b!258832 b!258823) bm!24619))

(assert (= (and b!258827 res!126547) b!258826))

(assert (= (and b!258826 c!43885) b!258818))

(assert (= (and b!258826 (not c!43885)) b!258833))

(assert (= (and b!258826 (not res!126552)) b!258829))

(assert (= (and b!258834 condMapEmpty!11257) mapIsEmpty!11257))

(assert (= (and b!258834 (not condMapEmpty!11257)) mapNonEmpty!11257))

(assert (= (and mapNonEmpty!11257 ((_ is ValueCellFull!2961) mapValue!11257)) b!258821))

(assert (= (and b!258834 ((_ is ValueCellFull!2961) mapDefault!11257)) b!258837))

(assert (= b!258835 b!258834))

(assert (= start!24762 b!258835))

(declare-fun m!274321 () Bool)

(assert (=> b!258819 m!274321))

(declare-fun m!274323 () Bool)

(assert (=> b!258826 m!274323))

(declare-fun m!274325 () Bool)

(assert (=> b!258826 m!274325))

(declare-fun m!274327 () Bool)

(assert (=> b!258826 m!274327))

(declare-fun m!274329 () Bool)

(assert (=> b!258826 m!274329))

(declare-fun m!274331 () Bool)

(assert (=> b!258826 m!274331))

(declare-fun m!274333 () Bool)

(assert (=> b!258826 m!274333))

(declare-fun m!274335 () Bool)

(assert (=> b!258826 m!274335))

(declare-fun m!274337 () Bool)

(assert (=> b!258826 m!274337))

(declare-fun m!274339 () Bool)

(assert (=> b!258826 m!274339))

(declare-fun m!274341 () Bool)

(assert (=> b!258826 m!274341))

(declare-fun m!274343 () Bool)

(assert (=> b!258826 m!274343))

(declare-fun m!274345 () Bool)

(assert (=> b!258826 m!274345))

(declare-fun m!274347 () Bool)

(assert (=> b!258826 m!274347))

(declare-fun m!274349 () Bool)

(assert (=> b!258826 m!274349))

(declare-fun m!274351 () Bool)

(assert (=> b!258826 m!274351))

(declare-fun m!274353 () Bool)

(assert (=> b!258826 m!274353))

(declare-fun m!274355 () Bool)

(assert (=> b!258826 m!274355))

(declare-fun m!274357 () Bool)

(assert (=> b!258826 m!274357))

(declare-fun m!274359 () Bool)

(assert (=> b!258828 m!274359))

(declare-fun m!274361 () Bool)

(assert (=> b!258825 m!274361))

(declare-fun m!274363 () Bool)

(assert (=> b!258817 m!274363))

(declare-fun m!274365 () Bool)

(assert (=> b!258818 m!274365))

(declare-fun m!274367 () Bool)

(assert (=> b!258827 m!274367))

(declare-fun m!274369 () Bool)

(assert (=> b!258827 m!274369))

(declare-fun m!274371 () Bool)

(assert (=> b!258827 m!274371))

(assert (=> bm!24619 m!274325))

(declare-fun m!274373 () Bool)

(assert (=> b!258835 m!274373))

(declare-fun m!274375 () Bool)

(assert (=> b!258835 m!274375))

(declare-fun m!274377 () Bool)

(assert (=> start!24762 m!274377))

(declare-fun m!274379 () Bool)

(assert (=> b!258831 m!274379))

(declare-fun m!274381 () Bool)

(assert (=> mapNonEmpty!11257 m!274381))

(declare-fun m!274383 () Bool)

(assert (=> bm!24620 m!274383))

(check-sat tp_is_empty!6609 b_and!13835 (not b!258819) (not bm!24620) (not b!258827) (not b!258817) (not mapNonEmpty!11257) (not b!258818) (not b!258835) (not start!24762) (not bm!24619) (not b!258826) (not b_next!6747) (not b!258831))
(check-sat b_and!13835 (not b_next!6747))
(get-model)

(declare-fun b!258912 () Bool)

(declare-fun e!167818 () Bool)

(assert (=> b!258912 (= e!167818 (= (arrayCountValidKeys!0 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6948 thiss!1504) #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!258910 () Bool)

(declare-fun res!126592 () Bool)

(declare-fun e!167819 () Bool)

(assert (=> b!258910 (=> (not res!126592) (not e!167819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!258910 (= res!126592 (validKeyInArray!0 key!932))))

(declare-fun b!258909 () Bool)

(declare-fun res!126593 () Bool)

(assert (=> b!258909 (=> (not res!126593) (not e!167819))))

(assert (=> b!258909 (= res!126593 (not (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) index!297))))))

(declare-fun d!62135 () Bool)

(assert (=> d!62135 e!167818))

(declare-fun res!126590 () Bool)

(assert (=> d!62135 (=> (not res!126590) (not e!167818))))

(assert (=> d!62135 (= res!126590 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6299 (_keys!6948 thiss!1504)))))))

(declare-fun lt!130380 () Unit!8045)

(declare-fun choose!1 (array!12569 (_ BitVec 32) (_ BitVec 64)) Unit!8045)

(assert (=> d!62135 (= lt!130380 (choose!1 (_keys!6948 thiss!1504) index!297 key!932))))

(assert (=> d!62135 e!167819))

(declare-fun res!126591 () Bool)

(assert (=> d!62135 (=> (not res!126591) (not e!167819))))

(assert (=> d!62135 (= res!126591 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6299 (_keys!6948 thiss!1504)))))))

(assert (=> d!62135 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6948 thiss!1504) index!297 key!932) lt!130380)))

(declare-fun b!258911 () Bool)

(assert (=> b!258911 (= e!167819 (bvslt (size!6299 (_keys!6948 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!62135 res!126591) b!258909))

(assert (= (and b!258909 res!126593) b!258910))

(assert (= (and b!258910 res!126592) b!258911))

(assert (= (and d!62135 res!126590) b!258912))

(assert (=> b!258912 m!274353))

(declare-fun m!274449 () Bool)

(assert (=> b!258912 m!274449))

(assert (=> b!258912 m!274341))

(declare-fun m!274451 () Bool)

(assert (=> b!258910 m!274451))

(declare-fun m!274453 () Bool)

(assert (=> b!258909 m!274453))

(assert (=> b!258909 m!274453))

(declare-fun m!274455 () Bool)

(assert (=> b!258909 m!274455))

(declare-fun m!274457 () Bool)

(assert (=> d!62135 m!274457))

(assert (=> b!258826 d!62135))

(declare-fun d!62137 () Bool)

(declare-fun e!167822 () Bool)

(assert (=> d!62137 e!167822))

(declare-fun res!126599 () Bool)

(assert (=> d!62137 (=> (not res!126599) (not e!167822))))

(declare-fun lt!130390 () ListLongMap!3851)

(assert (=> d!62137 (= res!126599 (contains!1882 lt!130390 (_1!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun lt!130389 () List!3817)

(assert (=> d!62137 (= lt!130390 (ListLongMap!3852 lt!130389))))

(declare-fun lt!130391 () Unit!8045)

(declare-fun lt!130392 () Unit!8045)

(assert (=> d!62137 (= lt!130391 lt!130392)))

(declare-datatypes ((Option!320 0))(
  ( (Some!319 (v!5457 V!8459)) (None!318) )
))
(declare-fun getValueByKey!314 (List!3817 (_ BitVec 64)) Option!320)

(assert (=> d!62137 (= (getValueByKey!314 lt!130389 (_1!2480 (tuple2!4939 key!932 v!346))) (Some!319 (_2!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!170 (List!3817 (_ BitVec 64) V!8459) Unit!8045)

(assert (=> d!62137 (= lt!130392 (lemmaContainsTupThenGetReturnValue!170 lt!130389 (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun insertStrictlySorted!173 (List!3817 (_ BitVec 64) V!8459) List!3817)

(assert (=> d!62137 (= lt!130389 (insertStrictlySorted!173 (toList!1941 lt!130333) (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346))))))

(assert (=> d!62137 (= (+!695 lt!130333 (tuple2!4939 key!932 v!346)) lt!130390)))

(declare-fun b!258917 () Bool)

(declare-fun res!126598 () Bool)

(assert (=> b!258917 (=> (not res!126598) (not e!167822))))

(assert (=> b!258917 (= res!126598 (= (getValueByKey!314 (toList!1941 lt!130390) (_1!2480 (tuple2!4939 key!932 v!346))) (Some!319 (_2!2480 (tuple2!4939 key!932 v!346)))))))

(declare-fun b!258918 () Bool)

(declare-fun contains!1884 (List!3817 tuple2!4938) Bool)

(assert (=> b!258918 (= e!167822 (contains!1884 (toList!1941 lt!130390) (tuple2!4939 key!932 v!346)))))

(assert (= (and d!62137 res!126599) b!258917))

(assert (= (and b!258917 res!126598) b!258918))

(declare-fun m!274459 () Bool)

(assert (=> d!62137 m!274459))

(declare-fun m!274461 () Bool)

(assert (=> d!62137 m!274461))

(declare-fun m!274463 () Bool)

(assert (=> d!62137 m!274463))

(declare-fun m!274465 () Bool)

(assert (=> d!62137 m!274465))

(declare-fun m!274467 () Bool)

(assert (=> b!258917 m!274467))

(declare-fun m!274469 () Bool)

(assert (=> b!258918 m!274469))

(assert (=> b!258826 d!62137))

(declare-fun b!258927 () Bool)

(declare-fun e!167827 () (_ BitVec 32))

(declare-fun call!24632 () (_ BitVec 32))

(assert (=> b!258927 (= e!167827 (bvadd #b00000000000000000000000000000001 call!24632))))

(declare-fun d!62139 () Bool)

(declare-fun lt!130395 () (_ BitVec 32))

(assert (=> d!62139 (and (bvsge lt!130395 #b00000000000000000000000000000000) (bvsle lt!130395 (bvsub (size!6299 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!167828 () (_ BitVec 32))

(assert (=> d!62139 (= lt!130395 e!167828)))

(declare-fun c!43903 () Bool)

(assert (=> d!62139 (= c!43903 (bvsge #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> d!62139 (and (bvsle #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6299 (_keys!6948 thiss!1504)) (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> d!62139 (= (arrayCountValidKeys!0 (_keys!6948 thiss!1504) #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) lt!130395)))

(declare-fun b!258928 () Bool)

(assert (=> b!258928 (= e!167827 call!24632)))

(declare-fun b!258929 () Bool)

(assert (=> b!258929 (= e!167828 e!167827)))

(declare-fun c!43902 () Bool)

(assert (=> b!258929 (= c!43902 (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24629 () Bool)

(assert (=> bm!24629 (= call!24632 (arrayCountValidKeys!0 (_keys!6948 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!258930 () Bool)

(assert (=> b!258930 (= e!167828 #b00000000000000000000000000000000)))

(assert (= (and d!62139 c!43903) b!258930))

(assert (= (and d!62139 (not c!43903)) b!258929))

(assert (= (and b!258929 c!43902) b!258927))

(assert (= (and b!258929 (not c!43902)) b!258928))

(assert (= (or b!258927 b!258928) bm!24629))

(declare-fun m!274471 () Bool)

(assert (=> b!258929 m!274471))

(assert (=> b!258929 m!274471))

(declare-fun m!274473 () Bool)

(assert (=> b!258929 m!274473))

(declare-fun m!274475 () Bool)

(assert (=> bm!24629 m!274475))

(assert (=> b!258826 d!62139))

(declare-fun d!62141 () Bool)

(declare-fun e!167831 () Bool)

(assert (=> d!62141 e!167831))

(declare-fun res!126602 () Bool)

(assert (=> d!62141 (=> (not res!126602) (not e!167831))))

(assert (=> d!62141 (= res!126602 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6299 (_keys!6948 thiss!1504))) (bvslt index!297 (size!6298 (_values!4757 thiss!1504)))))))

(declare-fun lt!130398 () Unit!8045)

(declare-fun choose!1252 (array!12569 array!12567 (_ BitVec 32) (_ BitVec 32) V!8459 V!8459 (_ BitVec 32) (_ BitVec 64) V!8459 Int) Unit!8045)

(assert (=> d!62141 (= lt!130398 (choose!1252 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) index!297 key!932 v!346 (defaultEntry!4774 thiss!1504)))))

(assert (=> d!62141 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62141 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!105 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) index!297 key!932 v!346 (defaultEntry!4774 thiss!1504)) lt!130398)))

(declare-fun b!258933 () Bool)

(assert (=> b!258933 (= e!167831 (= (+!695 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) (tuple2!4939 key!932 v!346)) (getCurrentListMap!1469 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504))))))

(assert (= (and d!62141 res!126602) b!258933))

(declare-fun m!274477 () Bool)

(assert (=> d!62141 m!274477))

(assert (=> d!62141 m!274323))

(assert (=> b!258933 m!274333))

(assert (=> b!258933 m!274371))

(assert (=> b!258933 m!274371))

(declare-fun m!274479 () Bool)

(assert (=> b!258933 m!274479))

(assert (=> b!258933 m!274353))

(declare-fun m!274481 () Bool)

(assert (=> b!258933 m!274481))

(assert (=> b!258826 d!62141))

(declare-fun d!62143 () Bool)

(declare-fun res!126607 () Bool)

(declare-fun e!167836 () Bool)

(assert (=> d!62143 (=> res!126607 e!167836)))

(assert (=> d!62143 (= res!126607 (= (select (arr!5951 lt!130324) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62143 (= (arrayContainsKey!0 lt!130324 key!932 #b00000000000000000000000000000000) e!167836)))

(declare-fun b!258938 () Bool)

(declare-fun e!167837 () Bool)

(assert (=> b!258938 (= e!167836 e!167837)))

(declare-fun res!126608 () Bool)

(assert (=> b!258938 (=> (not res!126608) (not e!167837))))

(assert (=> b!258938 (= res!126608 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 lt!130324)))))

(declare-fun b!258939 () Bool)

(assert (=> b!258939 (= e!167837 (arrayContainsKey!0 lt!130324 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62143 (not res!126607)) b!258938))

(assert (= (and b!258938 res!126608) b!258939))

(declare-fun m!274483 () Bool)

(assert (=> d!62143 m!274483))

(declare-fun m!274485 () Bool)

(assert (=> b!258939 m!274485))

(assert (=> b!258826 d!62143))

(declare-fun b!258940 () Bool)

(declare-fun e!167838 () (_ BitVec 32))

(declare-fun call!24633 () (_ BitVec 32))

(assert (=> b!258940 (= e!167838 (bvadd #b00000000000000000000000000000001 call!24633))))

(declare-fun d!62145 () Bool)

(declare-fun lt!130399 () (_ BitVec 32))

(assert (=> d!62145 (and (bvsge lt!130399 #b00000000000000000000000000000000) (bvsle lt!130399 (bvsub (size!6299 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun e!167839 () (_ BitVec 32))

(assert (=> d!62145 (= lt!130399 e!167839)))

(declare-fun c!43905 () Bool)

(assert (=> d!62145 (= c!43905 (bvsge #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> d!62145 (and (bvsle #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6299 (_keys!6948 thiss!1504)) (size!6299 lt!130324)))))

(assert (=> d!62145 (= (arrayCountValidKeys!0 lt!130324 #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) lt!130399)))

(declare-fun b!258941 () Bool)

(assert (=> b!258941 (= e!167838 call!24633)))

(declare-fun b!258942 () Bool)

(assert (=> b!258942 (= e!167839 e!167838)))

(declare-fun c!43904 () Bool)

(assert (=> b!258942 (= c!43904 (validKeyInArray!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun bm!24630 () Bool)

(assert (=> bm!24630 (= call!24633 (arrayCountValidKeys!0 lt!130324 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!258943 () Bool)

(assert (=> b!258943 (= e!167839 #b00000000000000000000000000000000)))

(assert (= (and d!62145 c!43905) b!258943))

(assert (= (and d!62145 (not c!43905)) b!258942))

(assert (= (and b!258942 c!43904) b!258940))

(assert (= (and b!258942 (not c!43904)) b!258941))

(assert (= (or b!258940 b!258941) bm!24630))

(assert (=> b!258942 m!274483))

(assert (=> b!258942 m!274483))

(declare-fun m!274487 () Bool)

(assert (=> b!258942 m!274487))

(declare-fun m!274489 () Bool)

(assert (=> bm!24630 m!274489))

(assert (=> b!258826 d!62145))

(declare-fun d!62147 () Bool)

(declare-fun res!126617 () Bool)

(declare-fun e!167851 () Bool)

(assert (=> d!62147 (=> res!126617 e!167851)))

(assert (=> d!62147 (= res!126617 (bvsge #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(assert (=> d!62147 (= (arrayNoDuplicates!0 lt!130324 #b00000000000000000000000000000000 Nil!3815) e!167851)))

(declare-fun b!258954 () Bool)

(declare-fun e!167848 () Bool)

(assert (=> b!258954 (= e!167851 e!167848)))

(declare-fun res!126615 () Bool)

(assert (=> b!258954 (=> (not res!126615) (not e!167848))))

(declare-fun e!167849 () Bool)

(assert (=> b!258954 (= res!126615 (not e!167849))))

(declare-fun res!126616 () Bool)

(assert (=> b!258954 (=> (not res!126616) (not e!167849))))

(assert (=> b!258954 (= res!126616 (validKeyInArray!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun b!258955 () Bool)

(declare-fun e!167850 () Bool)

(declare-fun call!24636 () Bool)

(assert (=> b!258955 (= e!167850 call!24636)))

(declare-fun b!258956 () Bool)

(declare-fun contains!1885 (List!3818 (_ BitVec 64)) Bool)

(assert (=> b!258956 (= e!167849 (contains!1885 Nil!3815 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun b!258957 () Bool)

(assert (=> b!258957 (= e!167850 call!24636)))

(declare-fun b!258958 () Bool)

(assert (=> b!258958 (= e!167848 e!167850)))

(declare-fun c!43908 () Bool)

(assert (=> b!258958 (= c!43908 (validKeyInArray!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun bm!24633 () Bool)

(assert (=> bm!24633 (= call!24636 (arrayNoDuplicates!0 lt!130324 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43908 (Cons!3814 (select (arr!5951 lt!130324) #b00000000000000000000000000000000) Nil!3815) Nil!3815)))))

(assert (= (and d!62147 (not res!126617)) b!258954))

(assert (= (and b!258954 res!126616) b!258956))

(assert (= (and b!258954 res!126615) b!258958))

(assert (= (and b!258958 c!43908) b!258955))

(assert (= (and b!258958 (not c!43908)) b!258957))

(assert (= (or b!258955 b!258957) bm!24633))

(assert (=> b!258954 m!274483))

(assert (=> b!258954 m!274483))

(assert (=> b!258954 m!274487))

(assert (=> b!258956 m!274483))

(assert (=> b!258956 m!274483))

(declare-fun m!274491 () Bool)

(assert (=> b!258956 m!274491))

(assert (=> b!258958 m!274483))

(assert (=> b!258958 m!274483))

(assert (=> b!258958 m!274487))

(assert (=> bm!24633 m!274483))

(declare-fun m!274493 () Bool)

(assert (=> bm!24633 m!274493))

(assert (=> b!258826 d!62147))

(declare-fun bm!24636 () Bool)

(declare-fun call!24639 () Bool)

(assert (=> bm!24636 (= call!24639 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130324 (mask!11082 thiss!1504)))))

(declare-fun d!62149 () Bool)

(declare-fun res!126622 () Bool)

(declare-fun e!167859 () Bool)

(assert (=> d!62149 (=> res!126622 e!167859)))

(assert (=> d!62149 (= res!126622 (bvsge #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(assert (=> d!62149 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130324 (mask!11082 thiss!1504)) e!167859)))

(declare-fun b!258967 () Bool)

(declare-fun e!167860 () Bool)

(declare-fun e!167858 () Bool)

(assert (=> b!258967 (= e!167860 e!167858)))

(declare-fun lt!130406 () (_ BitVec 64))

(assert (=> b!258967 (= lt!130406 (select (arr!5951 lt!130324) #b00000000000000000000000000000000))))

(declare-fun lt!130407 () Unit!8045)

(assert (=> b!258967 (= lt!130407 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130324 lt!130406 #b00000000000000000000000000000000))))

(assert (=> b!258967 (arrayContainsKey!0 lt!130324 lt!130406 #b00000000000000000000000000000000)))

(declare-fun lt!130408 () Unit!8045)

(assert (=> b!258967 (= lt!130408 lt!130407)))

(declare-fun res!126623 () Bool)

(assert (=> b!258967 (= res!126623 (= (seekEntryOrOpen!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000) lt!130324 (mask!11082 thiss!1504)) (Found!1177 #b00000000000000000000000000000000)))))

(assert (=> b!258967 (=> (not res!126623) (not e!167858))))

(declare-fun b!258968 () Bool)

(assert (=> b!258968 (= e!167859 e!167860)))

(declare-fun c!43911 () Bool)

(assert (=> b!258968 (= c!43911 (validKeyInArray!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun b!258969 () Bool)

(assert (=> b!258969 (= e!167858 call!24639)))

(declare-fun b!258970 () Bool)

(assert (=> b!258970 (= e!167860 call!24639)))

(assert (= (and d!62149 (not res!126622)) b!258968))

(assert (= (and b!258968 c!43911) b!258967))

(assert (= (and b!258968 (not c!43911)) b!258970))

(assert (= (and b!258967 res!126623) b!258969))

(assert (= (or b!258969 b!258970) bm!24636))

(declare-fun m!274495 () Bool)

(assert (=> bm!24636 m!274495))

(assert (=> b!258967 m!274483))

(declare-fun m!274497 () Bool)

(assert (=> b!258967 m!274497))

(declare-fun m!274499 () Bool)

(assert (=> b!258967 m!274499))

(assert (=> b!258967 m!274483))

(declare-fun m!274501 () Bool)

(assert (=> b!258967 m!274501))

(assert (=> b!258968 m!274483))

(assert (=> b!258968 m!274483))

(assert (=> b!258968 m!274487))

(assert (=> b!258826 d!62149))

(declare-fun call!24656 () ListLongMap!3851)

(declare-fun bm!24651 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!578 (array!12569 array!12567 (_ BitVec 32) (_ BitVec 32) V!8459 V!8459 (_ BitVec 32) Int) ListLongMap!3851)

(assert (=> bm!24651 (= call!24656 (getCurrentListMapNoExtraKeys!578 lt!130324 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun b!259014 () Bool)

(declare-fun c!43929 () Bool)

(assert (=> b!259014 (= c!43929 (and (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167895 () ListLongMap!3851)

(declare-fun e!167897 () ListLongMap!3851)

(assert (=> b!259014 (= e!167895 e!167897)))

(declare-fun b!259015 () Bool)

(declare-fun e!167894 () Bool)

(assert (=> b!259015 (= e!167894 (validKeyInArray!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun b!259016 () Bool)

(declare-fun e!167899 () Bool)

(declare-fun e!167888 () Bool)

(assert (=> b!259016 (= e!167899 e!167888)))

(declare-fun res!126645 () Bool)

(declare-fun call!24659 () Bool)

(assert (=> b!259016 (= res!126645 call!24659)))

(assert (=> b!259016 (=> (not res!126645) (not e!167888))))

(declare-fun b!259017 () Bool)

(declare-fun call!24657 () ListLongMap!3851)

(assert (=> b!259017 (= e!167897 call!24657)))

(declare-fun b!259018 () Bool)

(declare-fun call!24658 () ListLongMap!3851)

(assert (=> b!259018 (= e!167895 call!24658)))

(declare-fun bm!24652 () Bool)

(declare-fun call!24655 () ListLongMap!3851)

(assert (=> bm!24652 (= call!24657 call!24655)))

(declare-fun bm!24653 () Bool)

(declare-fun lt!130474 () ListLongMap!3851)

(assert (=> bm!24653 (= call!24659 (contains!1882 lt!130474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259019 () Bool)

(declare-fun e!167890 () Bool)

(declare-fun apply!256 (ListLongMap!3851 (_ BitVec 64)) V!8459)

(declare-fun get!3062 (ValueCell!2961 V!8459) V!8459)

(declare-fun dynLambda!599 (Int (_ BitVec 64)) V!8459)

(assert (=> b!259019 (= e!167890 (= (apply!256 lt!130474 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)) (get!3062 (select (arr!5950 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259019 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6298 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))))))))

(assert (=> b!259019 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(declare-fun call!24654 () ListLongMap!3851)

(declare-fun c!43927 () Bool)

(declare-fun bm!24654 () Bool)

(declare-fun c!43926 () Bool)

(assert (=> bm!24654 (= call!24654 (+!695 (ite c!43927 call!24656 (ite c!43926 call!24655 call!24657)) (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(declare-fun b!259020 () Bool)

(assert (=> b!259020 (= e!167897 call!24658)))

(declare-fun b!259021 () Bool)

(declare-fun res!126649 () Bool)

(declare-fun e!167893 () Bool)

(assert (=> b!259021 (=> (not res!126649) (not e!167893))))

(declare-fun e!167892 () Bool)

(assert (=> b!259021 (= res!126649 e!167892)))

(declare-fun res!126646 () Bool)

(assert (=> b!259021 (=> res!126646 e!167892)))

(assert (=> b!259021 (= res!126646 (not e!167894))))

(declare-fun res!126642 () Bool)

(assert (=> b!259021 (=> (not res!126642) (not e!167894))))

(assert (=> b!259021 (= res!126642 (bvslt #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(declare-fun b!259022 () Bool)

(declare-fun e!167898 () Unit!8045)

(declare-fun lt!130464 () Unit!8045)

(assert (=> b!259022 (= e!167898 lt!130464)))

(declare-fun lt!130467 () ListLongMap!3851)

(assert (=> b!259022 (= lt!130467 (getCurrentListMapNoExtraKeys!578 lt!130324 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130457 () (_ BitVec 64))

(assert (=> b!259022 (= lt!130457 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130453 () (_ BitVec 64))

(assert (=> b!259022 (= lt!130453 (select (arr!5951 lt!130324) #b00000000000000000000000000000000))))

(declare-fun lt!130472 () Unit!8045)

(declare-fun addStillContains!232 (ListLongMap!3851 (_ BitVec 64) V!8459 (_ BitVec 64)) Unit!8045)

(assert (=> b!259022 (= lt!130472 (addStillContains!232 lt!130467 lt!130457 (zeroValue!4615 thiss!1504) lt!130453))))

(assert (=> b!259022 (contains!1882 (+!695 lt!130467 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504))) lt!130453)))

(declare-fun lt!130469 () Unit!8045)

(assert (=> b!259022 (= lt!130469 lt!130472)))

(declare-fun lt!130459 () ListLongMap!3851)

(assert (=> b!259022 (= lt!130459 (getCurrentListMapNoExtraKeys!578 lt!130324 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130463 () (_ BitVec 64))

(assert (=> b!259022 (= lt!130463 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130466 () (_ BitVec 64))

(assert (=> b!259022 (= lt!130466 (select (arr!5951 lt!130324) #b00000000000000000000000000000000))))

(declare-fun lt!130465 () Unit!8045)

(declare-fun addApplyDifferent!232 (ListLongMap!3851 (_ BitVec 64) V!8459 (_ BitVec 64)) Unit!8045)

(assert (=> b!259022 (= lt!130465 (addApplyDifferent!232 lt!130459 lt!130463 (minValue!4615 thiss!1504) lt!130466))))

(assert (=> b!259022 (= (apply!256 (+!695 lt!130459 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504))) lt!130466) (apply!256 lt!130459 lt!130466))))

(declare-fun lt!130470 () Unit!8045)

(assert (=> b!259022 (= lt!130470 lt!130465)))

(declare-fun lt!130458 () ListLongMap!3851)

(assert (=> b!259022 (= lt!130458 (getCurrentListMapNoExtraKeys!578 lt!130324 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130461 () (_ BitVec 64))

(assert (=> b!259022 (= lt!130461 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130468 () (_ BitVec 64))

(assert (=> b!259022 (= lt!130468 (select (arr!5951 lt!130324) #b00000000000000000000000000000000))))

(declare-fun lt!130473 () Unit!8045)

(assert (=> b!259022 (= lt!130473 (addApplyDifferent!232 lt!130458 lt!130461 (zeroValue!4615 thiss!1504) lt!130468))))

(assert (=> b!259022 (= (apply!256 (+!695 lt!130458 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504))) lt!130468) (apply!256 lt!130458 lt!130468))))

(declare-fun lt!130462 () Unit!8045)

(assert (=> b!259022 (= lt!130462 lt!130473)))

(declare-fun lt!130455 () ListLongMap!3851)

(assert (=> b!259022 (= lt!130455 (getCurrentListMapNoExtraKeys!578 lt!130324 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130471 () (_ BitVec 64))

(assert (=> b!259022 (= lt!130471 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130460 () (_ BitVec 64))

(assert (=> b!259022 (= lt!130460 (select (arr!5951 lt!130324) #b00000000000000000000000000000000))))

(assert (=> b!259022 (= lt!130464 (addApplyDifferent!232 lt!130455 lt!130471 (minValue!4615 thiss!1504) lt!130460))))

(assert (=> b!259022 (= (apply!256 (+!695 lt!130455 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504))) lt!130460) (apply!256 lt!130455 lt!130460))))

(declare-fun d!62151 () Bool)

(assert (=> d!62151 e!167893))

(declare-fun res!126643 () Bool)

(assert (=> d!62151 (=> (not res!126643) (not e!167893))))

(assert (=> d!62151 (= res!126643 (or (bvsge #b00000000000000000000000000000000 (size!6299 lt!130324)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 lt!130324)))))))

(declare-fun lt!130454 () ListLongMap!3851)

(assert (=> d!62151 (= lt!130474 lt!130454)))

(declare-fun lt!130456 () Unit!8045)

(assert (=> d!62151 (= lt!130456 e!167898)))

(declare-fun c!43925 () Bool)

(declare-fun e!167889 () Bool)

(assert (=> d!62151 (= c!43925 e!167889)))

(declare-fun res!126650 () Bool)

(assert (=> d!62151 (=> (not res!126650) (not e!167889))))

(assert (=> d!62151 (= res!126650 (bvslt #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(declare-fun e!167891 () ListLongMap!3851)

(assert (=> d!62151 (= lt!130454 e!167891)))

(assert (=> d!62151 (= c!43927 (and (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62151 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62151 (= (getCurrentListMap!1469 lt!130324 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) lt!130474)))

(declare-fun b!259013 () Bool)

(assert (=> b!259013 (= e!167891 (+!695 call!24654 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))

(declare-fun b!259023 () Bool)

(declare-fun Unit!8055 () Unit!8045)

(assert (=> b!259023 (= e!167898 Unit!8055)))

(declare-fun b!259024 () Bool)

(assert (=> b!259024 (= e!167888 (= (apply!256 lt!130474 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4615 thiss!1504)))))

(declare-fun b!259025 () Bool)

(declare-fun res!126644 () Bool)

(assert (=> b!259025 (=> (not res!126644) (not e!167893))))

(assert (=> b!259025 (= res!126644 e!167899)))

(declare-fun c!43924 () Bool)

(assert (=> b!259025 (= c!43924 (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24655 () Bool)

(assert (=> bm!24655 (= call!24658 call!24654)))

(declare-fun b!259026 () Bool)

(assert (=> b!259026 (= e!167899 (not call!24659))))

(declare-fun b!259027 () Bool)

(assert (=> b!259027 (= e!167891 e!167895)))

(assert (=> b!259027 (= c!43926 (and (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259028 () Bool)

(declare-fun e!167887 () Bool)

(declare-fun call!24660 () Bool)

(assert (=> b!259028 (= e!167887 (not call!24660))))

(declare-fun bm!24656 () Bool)

(assert (=> bm!24656 (= call!24655 call!24656)))

(declare-fun bm!24657 () Bool)

(assert (=> bm!24657 (= call!24660 (contains!1882 lt!130474 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259029 () Bool)

(declare-fun e!167896 () Bool)

(assert (=> b!259029 (= e!167896 (= (apply!256 lt!130474 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4615 thiss!1504)))))

(declare-fun b!259030 () Bool)

(assert (=> b!259030 (= e!167892 e!167890)))

(declare-fun res!126647 () Bool)

(assert (=> b!259030 (=> (not res!126647) (not e!167890))))

(assert (=> b!259030 (= res!126647 (contains!1882 lt!130474 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(assert (=> b!259030 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(declare-fun b!259031 () Bool)

(assert (=> b!259031 (= e!167893 e!167887)))

(declare-fun c!43928 () Bool)

(assert (=> b!259031 (= c!43928 (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259032 () Bool)

(assert (=> b!259032 (= e!167889 (validKeyInArray!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun b!259033 () Bool)

(assert (=> b!259033 (= e!167887 e!167896)))

(declare-fun res!126648 () Bool)

(assert (=> b!259033 (= res!126648 call!24660)))

(assert (=> b!259033 (=> (not res!126648) (not e!167896))))

(assert (= (and d!62151 c!43927) b!259013))

(assert (= (and d!62151 (not c!43927)) b!259027))

(assert (= (and b!259027 c!43926) b!259018))

(assert (= (and b!259027 (not c!43926)) b!259014))

(assert (= (and b!259014 c!43929) b!259020))

(assert (= (and b!259014 (not c!43929)) b!259017))

(assert (= (or b!259020 b!259017) bm!24652))

(assert (= (or b!259018 bm!24652) bm!24656))

(assert (= (or b!259018 b!259020) bm!24655))

(assert (= (or b!259013 bm!24656) bm!24651))

(assert (= (or b!259013 bm!24655) bm!24654))

(assert (= (and d!62151 res!126650) b!259032))

(assert (= (and d!62151 c!43925) b!259022))

(assert (= (and d!62151 (not c!43925)) b!259023))

(assert (= (and d!62151 res!126643) b!259021))

(assert (= (and b!259021 res!126642) b!259015))

(assert (= (and b!259021 (not res!126646)) b!259030))

(assert (= (and b!259030 res!126647) b!259019))

(assert (= (and b!259021 res!126649) b!259025))

(assert (= (and b!259025 c!43924) b!259016))

(assert (= (and b!259025 (not c!43924)) b!259026))

(assert (= (and b!259016 res!126645) b!259024))

(assert (= (or b!259016 b!259026) bm!24653))

(assert (= (and b!259025 res!126644) b!259031))

(assert (= (and b!259031 c!43928) b!259033))

(assert (= (and b!259031 (not c!43928)) b!259028))

(assert (= (and b!259033 res!126648) b!259029))

(assert (= (or b!259033 b!259028) bm!24657))

(declare-fun b_lambda!8223 () Bool)

(assert (=> (not b_lambda!8223) (not b!259019)))

(declare-fun t!8886 () Bool)

(declare-fun tb!3025 () Bool)

(assert (=> (and b!258835 (= (defaultEntry!4774 thiss!1504) (defaultEntry!4774 thiss!1504)) t!8886) tb!3025))

(declare-fun result!5397 () Bool)

(assert (=> tb!3025 (= result!5397 tp_is_empty!6609)))

(assert (=> b!259019 t!8886))

(declare-fun b_and!13839 () Bool)

(assert (= b_and!13835 (and (=> t!8886 result!5397) b_and!13839)))

(assert (=> b!259032 m!274483))

(assert (=> b!259032 m!274483))

(assert (=> b!259032 m!274487))

(assert (=> b!259019 m!274483))

(declare-fun m!274503 () Bool)

(assert (=> b!259019 m!274503))

(declare-fun m!274505 () Bool)

(assert (=> b!259019 m!274505))

(assert (=> b!259019 m!274483))

(declare-fun m!274507 () Bool)

(assert (=> b!259019 m!274507))

(assert (=> b!259019 m!274505))

(declare-fun m!274509 () Bool)

(assert (=> b!259019 m!274509))

(assert (=> b!259019 m!274507))

(declare-fun m!274511 () Bool)

(assert (=> bm!24654 m!274511))

(declare-fun m!274513 () Bool)

(assert (=> bm!24653 m!274513))

(declare-fun m!274515 () Bool)

(assert (=> bm!24657 m!274515))

(declare-fun m!274517 () Bool)

(assert (=> b!259029 m!274517))

(assert (=> b!259015 m!274483))

(assert (=> b!259015 m!274483))

(assert (=> b!259015 m!274487))

(declare-fun m!274519 () Bool)

(assert (=> b!259013 m!274519))

(declare-fun m!274521 () Bool)

(assert (=> b!259022 m!274521))

(declare-fun m!274523 () Bool)

(assert (=> b!259022 m!274523))

(assert (=> b!259022 m!274523))

(declare-fun m!274525 () Bool)

(assert (=> b!259022 m!274525))

(declare-fun m!274527 () Bool)

(assert (=> b!259022 m!274527))

(declare-fun m!274529 () Bool)

(assert (=> b!259022 m!274529))

(declare-fun m!274531 () Bool)

(assert (=> b!259022 m!274531))

(assert (=> b!259022 m!274483))

(declare-fun m!274533 () Bool)

(assert (=> b!259022 m!274533))

(declare-fun m!274535 () Bool)

(assert (=> b!259022 m!274535))

(declare-fun m!274537 () Bool)

(assert (=> b!259022 m!274537))

(declare-fun m!274539 () Bool)

(assert (=> b!259022 m!274539))

(declare-fun m!274541 () Bool)

(assert (=> b!259022 m!274541))

(assert (=> b!259022 m!274529))

(declare-fun m!274543 () Bool)

(assert (=> b!259022 m!274543))

(declare-fun m!274545 () Bool)

(assert (=> b!259022 m!274545))

(declare-fun m!274547 () Bool)

(assert (=> b!259022 m!274547))

(declare-fun m!274549 () Bool)

(assert (=> b!259022 m!274549))

(assert (=> b!259022 m!274533))

(assert (=> b!259022 m!274521))

(declare-fun m!274551 () Bool)

(assert (=> b!259022 m!274551))

(assert (=> b!259030 m!274483))

(assert (=> b!259030 m!274483))

(declare-fun m!274553 () Bool)

(assert (=> b!259030 m!274553))

(assert (=> bm!24651 m!274549))

(assert (=> d!62151 m!274323))

(declare-fun m!274555 () Bool)

(assert (=> b!259024 m!274555))

(assert (=> b!258826 d!62151))

(declare-fun d!62153 () Bool)

(assert (=> d!62153 (arrayContainsKey!0 lt!130324 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130477 () Unit!8045)

(declare-fun choose!13 (array!12569 (_ BitVec 64) (_ BitVec 32)) Unit!8045)

(assert (=> d!62153 (= lt!130477 (choose!13 lt!130324 key!932 index!297))))

(assert (=> d!62153 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62153 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130324 key!932 index!297) lt!130477)))

(declare-fun bs!9124 () Bool)

(assert (= bs!9124 d!62153))

(assert (=> bs!9124 m!274343))

(declare-fun m!274557 () Bool)

(assert (=> bs!9124 m!274557))

(assert (=> b!258826 d!62153))

(declare-fun d!62155 () Bool)

(assert (=> d!62155 (= (arrayCountValidKeys!0 lt!130324 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!130480 () Unit!8045)

(declare-fun choose!2 (array!12569 (_ BitVec 32)) Unit!8045)

(assert (=> d!62155 (= lt!130480 (choose!2 lt!130324 index!297))))

(declare-fun e!167902 () Bool)

(assert (=> d!62155 e!167902))

(declare-fun res!126655 () Bool)

(assert (=> d!62155 (=> (not res!126655) (not e!167902))))

(assert (=> d!62155 (= res!126655 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6299 lt!130324))))))

(assert (=> d!62155 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130324 index!297) lt!130480)))

(declare-fun b!259040 () Bool)

(declare-fun res!126656 () Bool)

(assert (=> b!259040 (=> (not res!126656) (not e!167902))))

(assert (=> b!259040 (= res!126656 (validKeyInArray!0 (select (arr!5951 lt!130324) index!297)))))

(declare-fun b!259041 () Bool)

(assert (=> b!259041 (= e!167902 (bvslt (size!6299 lt!130324) #b01111111111111111111111111111111))))

(assert (= (and d!62155 res!126655) b!259040))

(assert (= (and b!259040 res!126656) b!259041))

(declare-fun m!274559 () Bool)

(assert (=> d!62155 m!274559))

(declare-fun m!274561 () Bool)

(assert (=> d!62155 m!274561))

(declare-fun m!274563 () Bool)

(assert (=> b!259040 m!274563))

(assert (=> b!259040 m!274563))

(declare-fun m!274565 () Bool)

(assert (=> b!259040 m!274565))

(assert (=> b!258826 d!62155))

(declare-fun d!62157 () Bool)

(declare-fun e!167905 () Bool)

(assert (=> d!62157 e!167905))

(declare-fun res!126659 () Bool)

(assert (=> d!62157 (=> (not res!126659) (not e!167905))))

(assert (=> d!62157 (= res!126659 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6299 (_keys!6948 thiss!1504)))))))

(declare-fun lt!130483 () Unit!8045)

(declare-fun choose!41 (array!12569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3818) Unit!8045)

(assert (=> d!62157 (= lt!130483 (choose!41 (_keys!6948 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3815))))

(assert (=> d!62157 (bvslt (size!6299 (_keys!6948 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62157 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6948 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3815) lt!130483)))

(declare-fun b!259044 () Bool)

(assert (=> b!259044 (= e!167905 (arrayNoDuplicates!0 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) #b00000000000000000000000000000000 Nil!3815))))

(assert (= (and d!62157 res!126659) b!259044))

(declare-fun m!274567 () Bool)

(assert (=> d!62157 m!274567))

(assert (=> b!259044 m!274353))

(declare-fun m!274569 () Bool)

(assert (=> b!259044 m!274569))

(assert (=> b!258826 d!62157))

(declare-fun d!62159 () Bool)

(declare-fun res!126660 () Bool)

(declare-fun e!167906 () Bool)

(assert (=> d!62159 (=> res!126660 e!167906)))

(assert (=> d!62159 (= res!126660 (= (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62159 (= (arrayContainsKey!0 (_keys!6948 thiss!1504) key!932 #b00000000000000000000000000000000) e!167906)))

(declare-fun b!259045 () Bool)

(declare-fun e!167907 () Bool)

(assert (=> b!259045 (= e!167906 e!167907)))

(declare-fun res!126661 () Bool)

(assert (=> b!259045 (=> (not res!126661) (not e!167907))))

(assert (=> b!259045 (= res!126661 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!259046 () Bool)

(assert (=> b!259046 (= e!167907 (arrayContainsKey!0 (_keys!6948 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62159 (not res!126660)) b!259045))

(assert (= (and b!259045 res!126661) b!259046))

(assert (=> d!62159 m!274471))

(declare-fun m!274571 () Bool)

(assert (=> b!259046 m!274571))

(assert (=> b!258826 d!62159))

(declare-fun d!62161 () Bool)

(declare-fun e!167910 () Bool)

(assert (=> d!62161 e!167910))

(declare-fun res!126664 () Bool)

(assert (=> d!62161 (=> (not res!126664) (not e!167910))))

(assert (=> d!62161 (= res!126664 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6299 (_keys!6948 thiss!1504)))))))

(declare-fun lt!130486 () Unit!8045)

(declare-fun choose!102 ((_ BitVec 64) array!12569 (_ BitVec 32) (_ BitVec 32)) Unit!8045)

(assert (=> d!62161 (= lt!130486 (choose!102 key!932 (_keys!6948 thiss!1504) index!297 (mask!11082 thiss!1504)))))

(assert (=> d!62161 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62161 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6948 thiss!1504) index!297 (mask!11082 thiss!1504)) lt!130486)))

(declare-fun b!259049 () Bool)

(assert (=> b!259049 (= e!167910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (mask!11082 thiss!1504)))))

(assert (= (and d!62161 res!126664) b!259049))

(declare-fun m!274573 () Bool)

(assert (=> d!62161 m!274573))

(assert (=> d!62161 m!274323))

(assert (=> b!259049 m!274353))

(declare-fun m!274575 () Bool)

(assert (=> b!259049 m!274575))

(assert (=> b!258826 d!62161))

(declare-fun d!62163 () Bool)

(assert (=> d!62163 (= (validMask!0 (mask!11082 thiss!1504)) (and (or (= (mask!11082 thiss!1504) #b00000000000000000000000000000111) (= (mask!11082 thiss!1504) #b00000000000000000000000000001111) (= (mask!11082 thiss!1504) #b00000000000000000000000000011111) (= (mask!11082 thiss!1504) #b00000000000000000000000000111111) (= (mask!11082 thiss!1504) #b00000000000000000000000001111111) (= (mask!11082 thiss!1504) #b00000000000000000000000011111111) (= (mask!11082 thiss!1504) #b00000000000000000000000111111111) (= (mask!11082 thiss!1504) #b00000000000000000000001111111111) (= (mask!11082 thiss!1504) #b00000000000000000000011111111111) (= (mask!11082 thiss!1504) #b00000000000000000000111111111111) (= (mask!11082 thiss!1504) #b00000000000000000001111111111111) (= (mask!11082 thiss!1504) #b00000000000000000011111111111111) (= (mask!11082 thiss!1504) #b00000000000000000111111111111111) (= (mask!11082 thiss!1504) #b00000000000000001111111111111111) (= (mask!11082 thiss!1504) #b00000000000000011111111111111111) (= (mask!11082 thiss!1504) #b00000000000000111111111111111111) (= (mask!11082 thiss!1504) #b00000000000001111111111111111111) (= (mask!11082 thiss!1504) #b00000000000011111111111111111111) (= (mask!11082 thiss!1504) #b00000000000111111111111111111111) (= (mask!11082 thiss!1504) #b00000000001111111111111111111111) (= (mask!11082 thiss!1504) #b00000000011111111111111111111111) (= (mask!11082 thiss!1504) #b00000000111111111111111111111111) (= (mask!11082 thiss!1504) #b00000001111111111111111111111111) (= (mask!11082 thiss!1504) #b00000011111111111111111111111111) (= (mask!11082 thiss!1504) #b00000111111111111111111111111111) (= (mask!11082 thiss!1504) #b00001111111111111111111111111111) (= (mask!11082 thiss!1504) #b00011111111111111111111111111111) (= (mask!11082 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11082 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!258826 d!62163))

(declare-fun b!259050 () Bool)

(declare-fun e!167911 () (_ BitVec 32))

(declare-fun call!24661 () (_ BitVec 32))

(assert (=> b!259050 (= e!167911 (bvadd #b00000000000000000000000000000001 call!24661))))

(declare-fun d!62165 () Bool)

(declare-fun lt!130487 () (_ BitVec 32))

(assert (=> d!62165 (and (bvsge lt!130487 #b00000000000000000000000000000000) (bvsle lt!130487 (bvsub (size!6299 lt!130324) index!297)))))

(declare-fun e!167912 () (_ BitVec 32))

(assert (=> d!62165 (= lt!130487 e!167912)))

(declare-fun c!43931 () Bool)

(assert (=> d!62165 (= c!43931 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62165 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6299 lt!130324)))))

(assert (=> d!62165 (= (arrayCountValidKeys!0 lt!130324 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!130487)))

(declare-fun b!259051 () Bool)

(assert (=> b!259051 (= e!167911 call!24661)))

(declare-fun b!259052 () Bool)

(assert (=> b!259052 (= e!167912 e!167911)))

(declare-fun c!43930 () Bool)

(assert (=> b!259052 (= c!43930 (validKeyInArray!0 (select (arr!5951 lt!130324) index!297)))))

(declare-fun bm!24658 () Bool)

(assert (=> bm!24658 (= call!24661 (arrayCountValidKeys!0 lt!130324 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!259053 () Bool)

(assert (=> b!259053 (= e!167912 #b00000000000000000000000000000000)))

(assert (= (and d!62165 c!43931) b!259053))

(assert (= (and d!62165 (not c!43931)) b!259052))

(assert (= (and b!259052 c!43930) b!259050))

(assert (= (and b!259052 (not c!43930)) b!259051))

(assert (= (or b!259050 b!259051) bm!24658))

(assert (=> b!259052 m!274563))

(assert (=> b!259052 m!274563))

(assert (=> b!259052 m!274565))

(declare-fun m!274577 () Bool)

(assert (=> bm!24658 m!274577))

(assert (=> b!258826 d!62165))

(declare-fun d!62167 () Bool)

(assert (=> d!62167 (= (inRange!0 index!297 (mask!11082 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11082 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!258827 d!62167))

(declare-fun d!62169 () Bool)

(declare-fun e!167918 () Bool)

(assert (=> d!62169 e!167918))

(declare-fun res!126667 () Bool)

(assert (=> d!62169 (=> res!126667 e!167918)))

(declare-fun lt!130497 () Bool)

(assert (=> d!62169 (= res!126667 (not lt!130497))))

(declare-fun lt!130498 () Bool)

(assert (=> d!62169 (= lt!130497 lt!130498)))

(declare-fun lt!130499 () Unit!8045)

(declare-fun e!167917 () Unit!8045)

(assert (=> d!62169 (= lt!130499 e!167917)))

(declare-fun c!43934 () Bool)

(assert (=> d!62169 (= c!43934 lt!130498)))

(declare-fun containsKey!306 (List!3817 (_ BitVec 64)) Bool)

(assert (=> d!62169 (= lt!130498 (containsKey!306 (toList!1941 lt!130333) key!932))))

(assert (=> d!62169 (= (contains!1882 lt!130333 key!932) lt!130497)))

(declare-fun b!259060 () Bool)

(declare-fun lt!130496 () Unit!8045)

(assert (=> b!259060 (= e!167917 lt!130496)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!254 (List!3817 (_ BitVec 64)) Unit!8045)

(assert (=> b!259060 (= lt!130496 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 lt!130333) key!932))))

(declare-fun isDefined!255 (Option!320) Bool)

(assert (=> b!259060 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130333) key!932))))

(declare-fun b!259061 () Bool)

(declare-fun Unit!8056 () Unit!8045)

(assert (=> b!259061 (= e!167917 Unit!8056)))

(declare-fun b!259062 () Bool)

(assert (=> b!259062 (= e!167918 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130333) key!932)))))

(assert (= (and d!62169 c!43934) b!259060))

(assert (= (and d!62169 (not c!43934)) b!259061))

(assert (= (and d!62169 (not res!126667)) b!259062))

(declare-fun m!274579 () Bool)

(assert (=> d!62169 m!274579))

(declare-fun m!274581 () Bool)

(assert (=> b!259060 m!274581))

(declare-fun m!274583 () Bool)

(assert (=> b!259060 m!274583))

(assert (=> b!259060 m!274583))

(declare-fun m!274585 () Bool)

(assert (=> b!259060 m!274585))

(assert (=> b!259062 m!274583))

(assert (=> b!259062 m!274583))

(assert (=> b!259062 m!274585))

(assert (=> b!258827 d!62169))

(declare-fun bm!24659 () Bool)

(declare-fun call!24664 () ListLongMap!3851)

(assert (=> bm!24659 (= call!24664 (getCurrentListMapNoExtraKeys!578 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun b!259064 () Bool)

(declare-fun c!43940 () Bool)

(assert (=> b!259064 (= c!43940 (and (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167927 () ListLongMap!3851)

(declare-fun e!167929 () ListLongMap!3851)

(assert (=> b!259064 (= e!167927 e!167929)))

(declare-fun b!259065 () Bool)

(declare-fun e!167926 () Bool)

(assert (=> b!259065 (= e!167926 (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259066 () Bool)

(declare-fun e!167931 () Bool)

(declare-fun e!167920 () Bool)

(assert (=> b!259066 (= e!167931 e!167920)))

(declare-fun res!126671 () Bool)

(declare-fun call!24667 () Bool)

(assert (=> b!259066 (= res!126671 call!24667)))

(assert (=> b!259066 (=> (not res!126671) (not e!167920))))

(declare-fun b!259067 () Bool)

(declare-fun call!24665 () ListLongMap!3851)

(assert (=> b!259067 (= e!167929 call!24665)))

(declare-fun b!259068 () Bool)

(declare-fun call!24666 () ListLongMap!3851)

(assert (=> b!259068 (= e!167927 call!24666)))

(declare-fun bm!24660 () Bool)

(declare-fun call!24663 () ListLongMap!3851)

(assert (=> bm!24660 (= call!24665 call!24663)))

(declare-fun bm!24661 () Bool)

(declare-fun lt!130521 () ListLongMap!3851)

(assert (=> bm!24661 (= call!24667 (contains!1882 lt!130521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259069 () Bool)

(declare-fun e!167922 () Bool)

(assert (=> b!259069 (= e!167922 (= (apply!256 lt!130521 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)) (get!3062 (select (arr!5950 (_values!4757 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6298 (_values!4757 thiss!1504))))))

(assert (=> b!259069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun c!43938 () Bool)

(declare-fun c!43937 () Bool)

(declare-fun call!24662 () ListLongMap!3851)

(declare-fun bm!24662 () Bool)

(assert (=> bm!24662 (= call!24662 (+!695 (ite c!43938 call!24664 (ite c!43937 call!24663 call!24665)) (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(declare-fun b!259070 () Bool)

(assert (=> b!259070 (= e!167929 call!24666)))

(declare-fun b!259071 () Bool)

(declare-fun res!126675 () Bool)

(declare-fun e!167925 () Bool)

(assert (=> b!259071 (=> (not res!126675) (not e!167925))))

(declare-fun e!167924 () Bool)

(assert (=> b!259071 (= res!126675 e!167924)))

(declare-fun res!126672 () Bool)

(assert (=> b!259071 (=> res!126672 e!167924)))

(assert (=> b!259071 (= res!126672 (not e!167926))))

(declare-fun res!126668 () Bool)

(assert (=> b!259071 (=> (not res!126668) (not e!167926))))

(assert (=> b!259071 (= res!126668 (bvslt #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!259072 () Bool)

(declare-fun e!167930 () Unit!8045)

(declare-fun lt!130511 () Unit!8045)

(assert (=> b!259072 (= e!167930 lt!130511)))

(declare-fun lt!130514 () ListLongMap!3851)

(assert (=> b!259072 (= lt!130514 (getCurrentListMapNoExtraKeys!578 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130504 () (_ BitVec 64))

(assert (=> b!259072 (= lt!130504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130500 () (_ BitVec 64))

(assert (=> b!259072 (= lt!130500 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130519 () Unit!8045)

(assert (=> b!259072 (= lt!130519 (addStillContains!232 lt!130514 lt!130504 (zeroValue!4615 thiss!1504) lt!130500))))

(assert (=> b!259072 (contains!1882 (+!695 lt!130514 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504))) lt!130500)))

(declare-fun lt!130516 () Unit!8045)

(assert (=> b!259072 (= lt!130516 lt!130519)))

(declare-fun lt!130506 () ListLongMap!3851)

(assert (=> b!259072 (= lt!130506 (getCurrentListMapNoExtraKeys!578 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130510 () (_ BitVec 64))

(assert (=> b!259072 (= lt!130510 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130513 () (_ BitVec 64))

(assert (=> b!259072 (= lt!130513 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130512 () Unit!8045)

(assert (=> b!259072 (= lt!130512 (addApplyDifferent!232 lt!130506 lt!130510 (minValue!4615 thiss!1504) lt!130513))))

(assert (=> b!259072 (= (apply!256 (+!695 lt!130506 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504))) lt!130513) (apply!256 lt!130506 lt!130513))))

(declare-fun lt!130517 () Unit!8045)

(assert (=> b!259072 (= lt!130517 lt!130512)))

(declare-fun lt!130505 () ListLongMap!3851)

(assert (=> b!259072 (= lt!130505 (getCurrentListMapNoExtraKeys!578 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130508 () (_ BitVec 64))

(assert (=> b!259072 (= lt!130508 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130515 () (_ BitVec 64))

(assert (=> b!259072 (= lt!130515 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130520 () Unit!8045)

(assert (=> b!259072 (= lt!130520 (addApplyDifferent!232 lt!130505 lt!130508 (zeroValue!4615 thiss!1504) lt!130515))))

(assert (=> b!259072 (= (apply!256 (+!695 lt!130505 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504))) lt!130515) (apply!256 lt!130505 lt!130515))))

(declare-fun lt!130509 () Unit!8045)

(assert (=> b!259072 (= lt!130509 lt!130520)))

(declare-fun lt!130502 () ListLongMap!3851)

(assert (=> b!259072 (= lt!130502 (getCurrentListMapNoExtraKeys!578 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130518 () (_ BitVec 64))

(assert (=> b!259072 (= lt!130518 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130507 () (_ BitVec 64))

(assert (=> b!259072 (= lt!130507 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259072 (= lt!130511 (addApplyDifferent!232 lt!130502 lt!130518 (minValue!4615 thiss!1504) lt!130507))))

(assert (=> b!259072 (= (apply!256 (+!695 lt!130502 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504))) lt!130507) (apply!256 lt!130502 lt!130507))))

(declare-fun d!62171 () Bool)

(assert (=> d!62171 e!167925))

(declare-fun res!126669 () Bool)

(assert (=> d!62171 (=> (not res!126669) (not e!167925))))

(assert (=> d!62171 (= res!126669 (or (bvsge #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))))

(declare-fun lt!130501 () ListLongMap!3851)

(assert (=> d!62171 (= lt!130521 lt!130501)))

(declare-fun lt!130503 () Unit!8045)

(assert (=> d!62171 (= lt!130503 e!167930)))

(declare-fun c!43936 () Bool)

(declare-fun e!167921 () Bool)

(assert (=> d!62171 (= c!43936 e!167921)))

(declare-fun res!126676 () Bool)

(assert (=> d!62171 (=> (not res!126676) (not e!167921))))

(assert (=> d!62171 (= res!126676 (bvslt #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun e!167923 () ListLongMap!3851)

(assert (=> d!62171 (= lt!130501 e!167923)))

(assert (=> d!62171 (= c!43938 (and (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62171 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62171 (= (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) lt!130521)))

(declare-fun b!259063 () Bool)

(assert (=> b!259063 (= e!167923 (+!695 call!24662 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))

(declare-fun b!259073 () Bool)

(declare-fun Unit!8057 () Unit!8045)

(assert (=> b!259073 (= e!167930 Unit!8057)))

(declare-fun b!259074 () Bool)

(assert (=> b!259074 (= e!167920 (= (apply!256 lt!130521 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4615 thiss!1504)))))

(declare-fun b!259075 () Bool)

(declare-fun res!126670 () Bool)

(assert (=> b!259075 (=> (not res!126670) (not e!167925))))

(assert (=> b!259075 (= res!126670 e!167931)))

(declare-fun c!43935 () Bool)

(assert (=> b!259075 (= c!43935 (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24663 () Bool)

(assert (=> bm!24663 (= call!24666 call!24662)))

(declare-fun b!259076 () Bool)

(assert (=> b!259076 (= e!167931 (not call!24667))))

(declare-fun b!259077 () Bool)

(assert (=> b!259077 (= e!167923 e!167927)))

(assert (=> b!259077 (= c!43937 (and (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259078 () Bool)

(declare-fun e!167919 () Bool)

(declare-fun call!24668 () Bool)

(assert (=> b!259078 (= e!167919 (not call!24668))))

(declare-fun bm!24664 () Bool)

(assert (=> bm!24664 (= call!24663 call!24664)))

(declare-fun bm!24665 () Bool)

(assert (=> bm!24665 (= call!24668 (contains!1882 lt!130521 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259079 () Bool)

(declare-fun e!167928 () Bool)

(assert (=> b!259079 (= e!167928 (= (apply!256 lt!130521 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4615 thiss!1504)))))

(declare-fun b!259080 () Bool)

(assert (=> b!259080 (= e!167924 e!167922)))

(declare-fun res!126673 () Bool)

(assert (=> b!259080 (=> (not res!126673) (not e!167922))))

(assert (=> b!259080 (= res!126673 (contains!1882 lt!130521 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!259081 () Bool)

(assert (=> b!259081 (= e!167925 e!167919)))

(declare-fun c!43939 () Bool)

(assert (=> b!259081 (= c!43939 (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259082 () Bool)

(assert (=> b!259082 (= e!167921 (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259083 () Bool)

(assert (=> b!259083 (= e!167919 e!167928)))

(declare-fun res!126674 () Bool)

(assert (=> b!259083 (= res!126674 call!24668)))

(assert (=> b!259083 (=> (not res!126674) (not e!167928))))

(assert (= (and d!62171 c!43938) b!259063))

(assert (= (and d!62171 (not c!43938)) b!259077))

(assert (= (and b!259077 c!43937) b!259068))

(assert (= (and b!259077 (not c!43937)) b!259064))

(assert (= (and b!259064 c!43940) b!259070))

(assert (= (and b!259064 (not c!43940)) b!259067))

(assert (= (or b!259070 b!259067) bm!24660))

(assert (= (or b!259068 bm!24660) bm!24664))

(assert (= (or b!259068 b!259070) bm!24663))

(assert (= (or b!259063 bm!24664) bm!24659))

(assert (= (or b!259063 bm!24663) bm!24662))

(assert (= (and d!62171 res!126676) b!259082))

(assert (= (and d!62171 c!43936) b!259072))

(assert (= (and d!62171 (not c!43936)) b!259073))

(assert (= (and d!62171 res!126669) b!259071))

(assert (= (and b!259071 res!126668) b!259065))

(assert (= (and b!259071 (not res!126672)) b!259080))

(assert (= (and b!259080 res!126673) b!259069))

(assert (= (and b!259071 res!126675) b!259075))

(assert (= (and b!259075 c!43935) b!259066))

(assert (= (and b!259075 (not c!43935)) b!259076))

(assert (= (and b!259066 res!126671) b!259074))

(assert (= (or b!259066 b!259076) bm!24661))

(assert (= (and b!259075 res!126670) b!259081))

(assert (= (and b!259081 c!43939) b!259083))

(assert (= (and b!259081 (not c!43939)) b!259078))

(assert (= (and b!259083 res!126674) b!259079))

(assert (= (or b!259083 b!259078) bm!24665))

(declare-fun b_lambda!8225 () Bool)

(assert (=> (not b_lambda!8225) (not b!259069)))

(assert (=> b!259069 t!8886))

(declare-fun b_and!13841 () Bool)

(assert (= b_and!13839 (and (=> t!8886 result!5397) b_and!13841)))

(assert (=> b!259082 m!274471))

(assert (=> b!259082 m!274471))

(assert (=> b!259082 m!274473))

(assert (=> b!259069 m!274471))

(declare-fun m!274587 () Bool)

(assert (=> b!259069 m!274587))

(assert (=> b!259069 m!274505))

(assert (=> b!259069 m!274471))

(declare-fun m!274589 () Bool)

(assert (=> b!259069 m!274589))

(assert (=> b!259069 m!274505))

(declare-fun m!274591 () Bool)

(assert (=> b!259069 m!274591))

(assert (=> b!259069 m!274589))

(declare-fun m!274593 () Bool)

(assert (=> bm!24662 m!274593))

(declare-fun m!274595 () Bool)

(assert (=> bm!24661 m!274595))

(declare-fun m!274597 () Bool)

(assert (=> bm!24665 m!274597))

(declare-fun m!274599 () Bool)

(assert (=> b!259079 m!274599))

(assert (=> b!259065 m!274471))

(assert (=> b!259065 m!274471))

(assert (=> b!259065 m!274473))

(declare-fun m!274601 () Bool)

(assert (=> b!259063 m!274601))

(declare-fun m!274603 () Bool)

(assert (=> b!259072 m!274603))

(declare-fun m!274605 () Bool)

(assert (=> b!259072 m!274605))

(assert (=> b!259072 m!274605))

(declare-fun m!274607 () Bool)

(assert (=> b!259072 m!274607))

(declare-fun m!274609 () Bool)

(assert (=> b!259072 m!274609))

(declare-fun m!274611 () Bool)

(assert (=> b!259072 m!274611))

(declare-fun m!274613 () Bool)

(assert (=> b!259072 m!274613))

(assert (=> b!259072 m!274471))

(declare-fun m!274615 () Bool)

(assert (=> b!259072 m!274615))

(declare-fun m!274617 () Bool)

(assert (=> b!259072 m!274617))

(declare-fun m!274619 () Bool)

(assert (=> b!259072 m!274619))

(declare-fun m!274621 () Bool)

(assert (=> b!259072 m!274621))

(declare-fun m!274623 () Bool)

(assert (=> b!259072 m!274623))

(assert (=> b!259072 m!274611))

(declare-fun m!274625 () Bool)

(assert (=> b!259072 m!274625))

(declare-fun m!274627 () Bool)

(assert (=> b!259072 m!274627))

(declare-fun m!274629 () Bool)

(assert (=> b!259072 m!274629))

(declare-fun m!274631 () Bool)

(assert (=> b!259072 m!274631))

(assert (=> b!259072 m!274615))

(assert (=> b!259072 m!274603))

(declare-fun m!274633 () Bool)

(assert (=> b!259072 m!274633))

(assert (=> b!259080 m!274471))

(assert (=> b!259080 m!274471))

(declare-fun m!274635 () Bool)

(assert (=> b!259080 m!274635))

(assert (=> bm!24659 m!274631))

(assert (=> d!62171 m!274323))

(declare-fun m!274637 () Bool)

(assert (=> b!259074 m!274637))

(assert (=> b!258827 d!62171))

(declare-fun d!62173 () Bool)

(declare-fun res!126683 () Bool)

(declare-fun e!167934 () Bool)

(assert (=> d!62173 (=> (not res!126683) (not e!167934))))

(declare-fun simpleValid!279 (LongMapFixedSize!3822) Bool)

(assert (=> d!62173 (= res!126683 (simpleValid!279 thiss!1504))))

(assert (=> d!62173 (= (valid!1492 thiss!1504) e!167934)))

(declare-fun b!259090 () Bool)

(declare-fun res!126684 () Bool)

(assert (=> b!259090 (=> (not res!126684) (not e!167934))))

(assert (=> b!259090 (= res!126684 (= (arrayCountValidKeys!0 (_keys!6948 thiss!1504) #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) (_size!1960 thiss!1504)))))

(declare-fun b!259091 () Bool)

(declare-fun res!126685 () Bool)

(assert (=> b!259091 (=> (not res!126685) (not e!167934))))

(assert (=> b!259091 (= res!126685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(declare-fun b!259092 () Bool)

(assert (=> b!259092 (= e!167934 (arrayNoDuplicates!0 (_keys!6948 thiss!1504) #b00000000000000000000000000000000 Nil!3815))))

(assert (= (and d!62173 res!126683) b!259090))

(assert (= (and b!259090 res!126684) b!259091))

(assert (= (and b!259091 res!126685) b!259092))

(declare-fun m!274639 () Bool)

(assert (=> d!62173 m!274639))

(assert (=> b!259090 m!274341))

(declare-fun m!274641 () Bool)

(assert (=> b!259091 m!274641))

(declare-fun m!274643 () Bool)

(assert (=> b!259092 m!274643))

(assert (=> start!24762 d!62173))

(declare-fun d!62175 () Bool)

(declare-fun e!167937 () Bool)

(assert (=> d!62175 e!167937))

(declare-fun res!126691 () Bool)

(assert (=> d!62175 (=> (not res!126691) (not e!167937))))

(declare-fun lt!130526 () SeekEntryResult!1177)

(assert (=> d!62175 (= res!126691 ((_ is Found!1177) lt!130526))))

(assert (=> d!62175 (= lt!130526 (seekEntryOrOpen!0 key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(declare-fun lt!130527 () Unit!8045)

(declare-fun choose!1253 (array!12569 array!12567 (_ BitVec 32) (_ BitVec 32) V!8459 V!8459 (_ BitVec 64) Int) Unit!8045)

(assert (=> d!62175 (= lt!130527 (choose!1253 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 (defaultEntry!4774 thiss!1504)))))

(assert (=> d!62175 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62175 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!438 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 (defaultEntry!4774 thiss!1504)) lt!130527)))

(declare-fun b!259097 () Bool)

(declare-fun res!126690 () Bool)

(assert (=> b!259097 (=> (not res!126690) (not e!167937))))

(assert (=> b!259097 (= res!126690 (inRange!0 (index!6879 lt!130526) (mask!11082 thiss!1504)))))

(declare-fun b!259098 () Bool)

(assert (=> b!259098 (= e!167937 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6879 lt!130526)) key!932))))

(assert (=> b!259098 (and (bvsge (index!6879 lt!130526) #b00000000000000000000000000000000) (bvslt (index!6879 lt!130526) (size!6299 (_keys!6948 thiss!1504))))))

(assert (= (and d!62175 res!126691) b!259097))

(assert (= (and b!259097 res!126690) b!259098))

(assert (=> d!62175 m!274379))

(declare-fun m!274645 () Bool)

(assert (=> d!62175 m!274645))

(assert (=> d!62175 m!274323))

(declare-fun m!274647 () Bool)

(assert (=> b!259097 m!274647))

(declare-fun m!274649 () Bool)

(assert (=> b!259098 m!274649))

(assert (=> b!258817 d!62175))

(declare-fun d!62177 () Bool)

(assert (=> d!62177 (= (inRange!0 (ite c!43882 (index!6878 lt!130329) (index!6881 lt!130329)) (mask!11082 thiss!1504)) (and (bvsge (ite c!43882 (index!6878 lt!130329) (index!6881 lt!130329)) #b00000000000000000000000000000000) (bvslt (ite c!43882 (index!6878 lt!130329) (index!6881 lt!130329)) (bvadd (mask!11082 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24620 d!62177))

(assert (=> bm!24619 d!62159))

(declare-fun d!62179 () Bool)

(assert (=> d!62179 (contains!1882 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) key!932)))

(declare-fun lt!130530 () Unit!8045)

(declare-fun choose!1254 (array!12569 array!12567 (_ BitVec 32) (_ BitVec 32) V!8459 V!8459 (_ BitVec 64) (_ BitVec 32) Int) Unit!8045)

(assert (=> d!62179 (= lt!130530 (choose!1254 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(assert (=> d!62179 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62179 (= (lemmaArrayContainsKeyThenInListMap!246 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) lt!130530)))

(declare-fun bs!9125 () Bool)

(assert (= bs!9125 d!62179))

(assert (=> bs!9125 m!274371))

(assert (=> bs!9125 m!274371))

(declare-fun m!274651 () Bool)

(assert (=> bs!9125 m!274651))

(declare-fun m!274653 () Bool)

(assert (=> bs!9125 m!274653))

(assert (=> bs!9125 m!274323))

(assert (=> b!258818 d!62179))

(declare-fun b!259115 () Bool)

(declare-fun e!167949 () Bool)

(declare-fun e!167948 () Bool)

(assert (=> b!259115 (= e!167949 e!167948)))

(declare-fun res!126703 () Bool)

(declare-fun call!24674 () Bool)

(assert (=> b!259115 (= res!126703 call!24674)))

(assert (=> b!259115 (=> (not res!126703) (not e!167948))))

(declare-fun b!259116 () Bool)

(declare-fun call!24673 () Bool)

(assert (=> b!259116 (= e!167948 (not call!24673))))

(declare-fun d!62181 () Bool)

(assert (=> d!62181 e!167949))

(declare-fun c!43945 () Bool)

(declare-fun lt!130535 () SeekEntryResult!1177)

(assert (=> d!62181 (= c!43945 ((_ is MissingZero!1177) lt!130535))))

(assert (=> d!62181 (= lt!130535 (seekEntryOrOpen!0 key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(declare-fun lt!130536 () Unit!8045)

(declare-fun choose!1255 (array!12569 array!12567 (_ BitVec 32) (_ BitVec 32) V!8459 V!8459 (_ BitVec 64) Int) Unit!8045)

(assert (=> d!62181 (= lt!130536 (choose!1255 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 (defaultEntry!4774 thiss!1504)))))

(assert (=> d!62181 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62181 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!440 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 (defaultEntry!4774 thiss!1504)) lt!130536)))

(declare-fun b!259117 () Bool)

(assert (=> b!259117 (and (bvsge (index!6878 lt!130535) #b00000000000000000000000000000000) (bvslt (index!6878 lt!130535) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun res!126701 () Bool)

(assert (=> b!259117 (= res!126701 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6878 lt!130535)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259117 (=> (not res!126701) (not e!167948))))

(declare-fun b!259118 () Bool)

(declare-fun res!126702 () Bool)

(declare-fun e!167947 () Bool)

(assert (=> b!259118 (=> (not res!126702) (not e!167947))))

(assert (=> b!259118 (= res!126702 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6881 lt!130535)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259118 (and (bvsge (index!6881 lt!130535) #b00000000000000000000000000000000) (bvslt (index!6881 lt!130535) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!259119 () Bool)

(declare-fun e!167946 () Bool)

(assert (=> b!259119 (= e!167949 e!167946)))

(declare-fun c!43946 () Bool)

(assert (=> b!259119 (= c!43946 ((_ is MissingVacant!1177) lt!130535))))

(declare-fun bm!24670 () Bool)

(assert (=> bm!24670 (= call!24674 (inRange!0 (ite c!43945 (index!6878 lt!130535) (index!6881 lt!130535)) (mask!11082 thiss!1504)))))

(declare-fun b!259120 () Bool)

(assert (=> b!259120 (= e!167946 ((_ is Undefined!1177) lt!130535))))

(declare-fun b!259121 () Bool)

(declare-fun res!126700 () Bool)

(assert (=> b!259121 (=> (not res!126700) (not e!167947))))

(assert (=> b!259121 (= res!126700 call!24674)))

(assert (=> b!259121 (= e!167946 e!167947)))

(declare-fun b!259122 () Bool)

(assert (=> b!259122 (= e!167947 (not call!24673))))

(declare-fun bm!24671 () Bool)

(assert (=> bm!24671 (= call!24673 (arrayContainsKey!0 (_keys!6948 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!62181 c!43945) b!259115))

(assert (= (and d!62181 (not c!43945)) b!259119))

(assert (= (and b!259115 res!126703) b!259117))

(assert (= (and b!259117 res!126701) b!259116))

(assert (= (and b!259119 c!43946) b!259121))

(assert (= (and b!259119 (not c!43946)) b!259120))

(assert (= (and b!259121 res!126700) b!259118))

(assert (= (and b!259118 res!126702) b!259122))

(assert (= (or b!259115 b!259121) bm!24670))

(assert (= (or b!259116 b!259122) bm!24671))

(assert (=> bm!24671 m!274325))

(declare-fun m!274655 () Bool)

(assert (=> bm!24670 m!274655))

(assert (=> d!62181 m!274379))

(declare-fun m!274657 () Bool)

(assert (=> d!62181 m!274657))

(assert (=> d!62181 m!274323))

(declare-fun m!274659 () Bool)

(assert (=> b!259117 m!274659))

(declare-fun m!274661 () Bool)

(assert (=> b!259118 m!274661))

(assert (=> b!258819 d!62181))

(declare-fun b!259135 () Bool)

(declare-fun e!167958 () SeekEntryResult!1177)

(declare-fun lt!130544 () SeekEntryResult!1177)

(assert (=> b!259135 (= e!167958 (Found!1177 (index!6880 lt!130544)))))

(declare-fun b!259136 () Bool)

(declare-fun e!167957 () SeekEntryResult!1177)

(assert (=> b!259136 (= e!167957 Undefined!1177)))

(declare-fun d!62183 () Bool)

(declare-fun lt!130545 () SeekEntryResult!1177)

(assert (=> d!62183 (and (or ((_ is Undefined!1177) lt!130545) (not ((_ is Found!1177) lt!130545)) (and (bvsge (index!6879 lt!130545) #b00000000000000000000000000000000) (bvslt (index!6879 lt!130545) (size!6299 (_keys!6948 thiss!1504))))) (or ((_ is Undefined!1177) lt!130545) ((_ is Found!1177) lt!130545) (not ((_ is MissingZero!1177) lt!130545)) (and (bvsge (index!6878 lt!130545) #b00000000000000000000000000000000) (bvslt (index!6878 lt!130545) (size!6299 (_keys!6948 thiss!1504))))) (or ((_ is Undefined!1177) lt!130545) ((_ is Found!1177) lt!130545) ((_ is MissingZero!1177) lt!130545) (not ((_ is MissingVacant!1177) lt!130545)) (and (bvsge (index!6881 lt!130545) #b00000000000000000000000000000000) (bvslt (index!6881 lt!130545) (size!6299 (_keys!6948 thiss!1504))))) (or ((_ is Undefined!1177) lt!130545) (ite ((_ is Found!1177) lt!130545) (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6879 lt!130545)) key!932) (ite ((_ is MissingZero!1177) lt!130545) (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6878 lt!130545)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1177) lt!130545) (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6881 lt!130545)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62183 (= lt!130545 e!167957)))

(declare-fun c!43953 () Bool)

(assert (=> d!62183 (= c!43953 (and ((_ is Intermediate!1177) lt!130544) (undefined!1989 lt!130544)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12569 (_ BitVec 32)) SeekEntryResult!1177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62183 (= lt!130544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11082 thiss!1504)) key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(assert (=> d!62183 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62183 (= (seekEntryOrOpen!0 key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)) lt!130545)))

(declare-fun b!259137 () Bool)

(assert (=> b!259137 (= e!167957 e!167958)))

(declare-fun lt!130543 () (_ BitVec 64))

(assert (=> b!259137 (= lt!130543 (select (arr!5951 (_keys!6948 thiss!1504)) (index!6880 lt!130544)))))

(declare-fun c!43955 () Bool)

(assert (=> b!259137 (= c!43955 (= lt!130543 key!932))))

(declare-fun b!259138 () Bool)

(declare-fun e!167956 () SeekEntryResult!1177)

(assert (=> b!259138 (= e!167956 (MissingZero!1177 (index!6880 lt!130544)))))

(declare-fun b!259139 () Bool)

(declare-fun c!43954 () Bool)

(assert (=> b!259139 (= c!43954 (= lt!130543 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259139 (= e!167958 e!167956)))

(declare-fun b!259140 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12569 (_ BitVec 32)) SeekEntryResult!1177)

(assert (=> b!259140 (= e!167956 (seekKeyOrZeroReturnVacant!0 (x!25071 lt!130544) (index!6880 lt!130544) (index!6880 lt!130544) key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(assert (= (and d!62183 c!43953) b!259136))

(assert (= (and d!62183 (not c!43953)) b!259137))

(assert (= (and b!259137 c!43955) b!259135))

(assert (= (and b!259137 (not c!43955)) b!259139))

(assert (= (and b!259139 c!43954) b!259138))

(assert (= (and b!259139 (not c!43954)) b!259140))

(declare-fun m!274663 () Bool)

(assert (=> d!62183 m!274663))

(declare-fun m!274665 () Bool)

(assert (=> d!62183 m!274665))

(declare-fun m!274667 () Bool)

(assert (=> d!62183 m!274667))

(assert (=> d!62183 m!274663))

(assert (=> d!62183 m!274323))

(declare-fun m!274669 () Bool)

(assert (=> d!62183 m!274669))

(declare-fun m!274671 () Bool)

(assert (=> d!62183 m!274671))

(declare-fun m!274673 () Bool)

(assert (=> b!259137 m!274673))

(declare-fun m!274675 () Bool)

(assert (=> b!259140 m!274675))

(assert (=> b!258831 d!62183))

(declare-fun d!62185 () Bool)

(assert (=> d!62185 (= (array_inv!3931 (_keys!6948 thiss!1504)) (bvsge (size!6299 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258835 d!62185))

(declare-fun d!62187 () Bool)

(assert (=> d!62187 (= (array_inv!3932 (_values!4757 thiss!1504)) (bvsge (size!6298 (_values!4757 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!258835 d!62187))

(declare-fun mapIsEmpty!11263 () Bool)

(declare-fun mapRes!11263 () Bool)

(assert (=> mapIsEmpty!11263 mapRes!11263))

(declare-fun b!259147 () Bool)

(declare-fun e!167964 () Bool)

(assert (=> b!259147 (= e!167964 tp_is_empty!6609)))

(declare-fun b!259148 () Bool)

(declare-fun e!167963 () Bool)

(assert (=> b!259148 (= e!167963 tp_is_empty!6609)))

(declare-fun condMapEmpty!11263 () Bool)

(declare-fun mapDefault!11263 () ValueCell!2961)

(assert (=> mapNonEmpty!11257 (= condMapEmpty!11263 (= mapRest!11257 ((as const (Array (_ BitVec 32) ValueCell!2961)) mapDefault!11263)))))

(assert (=> mapNonEmpty!11257 (= tp!23557 (and e!167963 mapRes!11263))))

(declare-fun mapNonEmpty!11263 () Bool)

(declare-fun tp!23566 () Bool)

(assert (=> mapNonEmpty!11263 (= mapRes!11263 (and tp!23566 e!167964))))

(declare-fun mapRest!11263 () (Array (_ BitVec 32) ValueCell!2961))

(declare-fun mapKey!11263 () (_ BitVec 32))

(declare-fun mapValue!11263 () ValueCell!2961)

(assert (=> mapNonEmpty!11263 (= mapRest!11257 (store mapRest!11263 mapKey!11263 mapValue!11263))))

(assert (= (and mapNonEmpty!11257 condMapEmpty!11263) mapIsEmpty!11263))

(assert (= (and mapNonEmpty!11257 (not condMapEmpty!11263)) mapNonEmpty!11263))

(assert (= (and mapNonEmpty!11263 ((_ is ValueCellFull!2961) mapValue!11263)) b!259147))

(assert (= (and mapNonEmpty!11257 ((_ is ValueCellFull!2961) mapDefault!11263)) b!259148))

(declare-fun m!274677 () Bool)

(assert (=> mapNonEmpty!11263 m!274677))

(declare-fun b_lambda!8227 () Bool)

(assert (= b_lambda!8225 (or (and b!258835 b_free!6747) b_lambda!8227)))

(declare-fun b_lambda!8229 () Bool)

(assert (= b_lambda!8223 (or (and b!258835 b_free!6747) b_lambda!8229)))

(check-sat (not bm!24671) (not d!62171) (not b!258967) (not b!258968) (not bm!24665) (not bm!24658) (not b!259040) (not b!259080) tp_is_empty!6609 (not b!259044) (not b!259062) (not b!258918) (not b!259029) (not b!258917) (not d!62181) (not b!259015) (not b!258933) (not b!259072) (not mapNonEmpty!11263) (not b!259063) (not b!258956) (not b!259065) (not d!62155) (not bm!24657) (not bm!24630) (not d!62175) (not bm!24629) (not b!258954) (not d!62161) (not b!259030) (not b!258942) (not d!62157) (not bm!24659) (not b!259092) (not b!259079) (not bm!24670) (not b!258929) (not d!62137) (not d!62183) (not b!258939) (not d!62169) (not bm!24654) (not b!258958) (not b_next!6747) (not b!259090) (not bm!24662) (not b!259032) (not bm!24653) (not d!62141) (not b!259140) (not b!258912) (not b!259074) (not b!259069) (not b!259082) (not b!259019) (not b!259024) (not d!62173) (not d!62151) (not b!259052) (not b!258910) (not b!259013) (not b!259049) (not d!62153) b_and!13841 (not bm!24661) (not d!62135) (not bm!24651) (not bm!24636) (not b!259091) (not b!258909) (not b!259022) (not b!259046) (not b_lambda!8227) (not bm!24633) (not b_lambda!8229) (not b!259060) (not b!259097) (not d!62179))
(check-sat b_and!13841 (not b_next!6747))
(get-model)

(declare-fun d!62189 () Bool)

(declare-fun e!167966 () Bool)

(assert (=> d!62189 e!167966))

(declare-fun res!126704 () Bool)

(assert (=> d!62189 (=> res!126704 e!167966)))

(declare-fun lt!130547 () Bool)

(assert (=> d!62189 (= res!126704 (not lt!130547))))

(declare-fun lt!130548 () Bool)

(assert (=> d!62189 (= lt!130547 lt!130548)))

(declare-fun lt!130549 () Unit!8045)

(declare-fun e!167965 () Unit!8045)

(assert (=> d!62189 (= lt!130549 e!167965)))

(declare-fun c!43956 () Bool)

(assert (=> d!62189 (= c!43956 lt!130548)))

(assert (=> d!62189 (= lt!130548 (containsKey!306 (toList!1941 lt!130474) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62189 (= (contains!1882 lt!130474 #b0000000000000000000000000000000000000000000000000000000000000000) lt!130547)))

(declare-fun b!259149 () Bool)

(declare-fun lt!130546 () Unit!8045)

(assert (=> b!259149 (= e!167965 lt!130546)))

(assert (=> b!259149 (= lt!130546 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 lt!130474) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259149 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130474) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259150 () Bool)

(declare-fun Unit!8058 () Unit!8045)

(assert (=> b!259150 (= e!167965 Unit!8058)))

(declare-fun b!259151 () Bool)

(assert (=> b!259151 (= e!167966 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130474) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62189 c!43956) b!259149))

(assert (= (and d!62189 (not c!43956)) b!259150))

(assert (= (and d!62189 (not res!126704)) b!259151))

(declare-fun m!274679 () Bool)

(assert (=> d!62189 m!274679))

(declare-fun m!274681 () Bool)

(assert (=> b!259149 m!274681))

(declare-fun m!274683 () Bool)

(assert (=> b!259149 m!274683))

(assert (=> b!259149 m!274683))

(declare-fun m!274685 () Bool)

(assert (=> b!259149 m!274685))

(assert (=> b!259151 m!274683))

(assert (=> b!259151 m!274683))

(assert (=> b!259151 m!274685))

(assert (=> bm!24653 d!62189))

(declare-fun d!62191 () Bool)

(declare-fun e!167967 () Bool)

(assert (=> d!62191 e!167967))

(declare-fun res!126706 () Bool)

(assert (=> d!62191 (=> (not res!126706) (not e!167967))))

(declare-fun lt!130551 () ListLongMap!3851)

(assert (=> d!62191 (= res!126706 (contains!1882 lt!130551 (_1!2480 (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))))

(declare-fun lt!130550 () List!3817)

(assert (=> d!62191 (= lt!130551 (ListLongMap!3852 lt!130550))))

(declare-fun lt!130552 () Unit!8045)

(declare-fun lt!130553 () Unit!8045)

(assert (=> d!62191 (= lt!130552 lt!130553)))

(assert (=> d!62191 (= (getValueByKey!314 lt!130550 (_1!2480 (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))) (Some!319 (_2!2480 (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))))

(assert (=> d!62191 (= lt!130553 (lemmaContainsTupThenGetReturnValue!170 lt!130550 (_1!2480 (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))) (_2!2480 (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))))

(assert (=> d!62191 (= lt!130550 (insertStrictlySorted!173 (toList!1941 (ite c!43927 call!24656 (ite c!43926 call!24655 call!24657))) (_1!2480 (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))) (_2!2480 (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))))

(assert (=> d!62191 (= (+!695 (ite c!43927 call!24656 (ite c!43926 call!24655 call!24657)) (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))) lt!130551)))

(declare-fun b!259152 () Bool)

(declare-fun res!126705 () Bool)

(assert (=> b!259152 (=> (not res!126705) (not e!167967))))

(assert (=> b!259152 (= res!126705 (= (getValueByKey!314 (toList!1941 lt!130551) (_1!2480 (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))) (Some!319 (_2!2480 (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))))

(declare-fun b!259153 () Bool)

(assert (=> b!259153 (= e!167967 (contains!1884 (toList!1941 lt!130551) (ite (or c!43927 c!43926) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(assert (= (and d!62191 res!126706) b!259152))

(assert (= (and b!259152 res!126705) b!259153))

(declare-fun m!274687 () Bool)

(assert (=> d!62191 m!274687))

(declare-fun m!274689 () Bool)

(assert (=> d!62191 m!274689))

(declare-fun m!274691 () Bool)

(assert (=> d!62191 m!274691))

(declare-fun m!274693 () Bool)

(assert (=> d!62191 m!274693))

(declare-fun m!274695 () Bool)

(assert (=> b!259152 m!274695))

(declare-fun m!274697 () Bool)

(assert (=> b!259153 m!274697))

(assert (=> bm!24654 d!62191))

(declare-fun bm!24672 () Bool)

(declare-fun call!24675 () Bool)

(assert (=> bm!24672 (= call!24675 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (mask!11082 thiss!1504)))))

(declare-fun d!62193 () Bool)

(declare-fun res!126707 () Bool)

(declare-fun e!167969 () Bool)

(assert (=> d!62193 (=> res!126707 e!167969)))

(assert (=> d!62193 (= res!126707 (bvsge #b00000000000000000000000000000000 (size!6299 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))))))))

(assert (=> d!62193 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (mask!11082 thiss!1504)) e!167969)))

(declare-fun b!259154 () Bool)

(declare-fun e!167970 () Bool)

(declare-fun e!167968 () Bool)

(assert (=> b!259154 (= e!167970 e!167968)))

(declare-fun lt!130554 () (_ BitVec 64))

(assert (=> b!259154 (= lt!130554 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130555 () Unit!8045)

(assert (=> b!259154 (= lt!130555 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) lt!130554 #b00000000000000000000000000000000))))

(assert (=> b!259154 (arrayContainsKey!0 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) lt!130554 #b00000000000000000000000000000000)))

(declare-fun lt!130556 () Unit!8045)

(assert (=> b!259154 (= lt!130556 lt!130555)))

(declare-fun res!126708 () Bool)

(assert (=> b!259154 (= res!126708 (= (seekEntryOrOpen!0 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000) (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (mask!11082 thiss!1504)) (Found!1177 #b00000000000000000000000000000000)))))

(assert (=> b!259154 (=> (not res!126708) (not e!167968))))

(declare-fun b!259155 () Bool)

(assert (=> b!259155 (= e!167969 e!167970)))

(declare-fun c!43957 () Bool)

(assert (=> b!259155 (= c!43957 (validKeyInArray!0 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259156 () Bool)

(assert (=> b!259156 (= e!167968 call!24675)))

(declare-fun b!259157 () Bool)

(assert (=> b!259157 (= e!167970 call!24675)))

(assert (= (and d!62193 (not res!126707)) b!259155))

(assert (= (and b!259155 c!43957) b!259154))

(assert (= (and b!259155 (not c!43957)) b!259157))

(assert (= (and b!259154 res!126708) b!259156))

(assert (= (or b!259156 b!259157) bm!24672))

(declare-fun m!274699 () Bool)

(assert (=> bm!24672 m!274699))

(declare-fun m!274701 () Bool)

(assert (=> b!259154 m!274701))

(declare-fun m!274703 () Bool)

(assert (=> b!259154 m!274703))

(declare-fun m!274705 () Bool)

(assert (=> b!259154 m!274705))

(assert (=> b!259154 m!274701))

(declare-fun m!274707 () Bool)

(assert (=> b!259154 m!274707))

(assert (=> b!259155 m!274701))

(assert (=> b!259155 m!274701))

(declare-fun m!274709 () Bool)

(assert (=> b!259155 m!274709))

(assert (=> b!259049 d!62193))

(declare-fun d!62195 () Bool)

(assert (=> d!62195 (= (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258929 d!62195))

(declare-fun d!62197 () Bool)

(declare-fun isEmpty!534 (Option!320) Bool)

(assert (=> d!62197 (= (isDefined!255 (getValueByKey!314 (toList!1941 lt!130333) key!932)) (not (isEmpty!534 (getValueByKey!314 (toList!1941 lt!130333) key!932))))))

(declare-fun bs!9126 () Bool)

(assert (= bs!9126 d!62197))

(assert (=> bs!9126 m!274583))

(declare-fun m!274711 () Bool)

(assert (=> bs!9126 m!274711))

(assert (=> b!259062 d!62197))

(declare-fun d!62199 () Bool)

(declare-fun c!43962 () Bool)

(assert (=> d!62199 (= c!43962 (and ((_ is Cons!3813) (toList!1941 lt!130333)) (= (_1!2480 (h!4476 (toList!1941 lt!130333))) key!932)))))

(declare-fun e!167975 () Option!320)

(assert (=> d!62199 (= (getValueByKey!314 (toList!1941 lt!130333) key!932) e!167975)))

(declare-fun b!259168 () Bool)

(declare-fun e!167976 () Option!320)

(assert (=> b!259168 (= e!167976 (getValueByKey!314 (t!8882 (toList!1941 lt!130333)) key!932))))

(declare-fun b!259166 () Bool)

(assert (=> b!259166 (= e!167975 (Some!319 (_2!2480 (h!4476 (toList!1941 lt!130333)))))))

(declare-fun b!259169 () Bool)

(assert (=> b!259169 (= e!167976 None!318)))

(declare-fun b!259167 () Bool)

(assert (=> b!259167 (= e!167975 e!167976)))

(declare-fun c!43963 () Bool)

(assert (=> b!259167 (= c!43963 (and ((_ is Cons!3813) (toList!1941 lt!130333)) (not (= (_1!2480 (h!4476 (toList!1941 lt!130333))) key!932))))))

(assert (= (and d!62199 c!43962) b!259166))

(assert (= (and d!62199 (not c!43962)) b!259167))

(assert (= (and b!259167 c!43963) b!259168))

(assert (= (and b!259167 (not c!43963)) b!259169))

(declare-fun m!274713 () Bool)

(assert (=> b!259168 m!274713))

(assert (=> b!259062 d!62199))

(declare-fun d!62201 () Bool)

(assert (=> d!62201 (= (validKeyInArray!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)) (and (not (= (select (arr!5951 lt!130324) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5951 lt!130324) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258968 d!62201))

(declare-fun d!62203 () Bool)

(assert (=> d!62203 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130333) key!932))))

(declare-fun lt!130559 () Unit!8045)

(declare-fun choose!1256 (List!3817 (_ BitVec 64)) Unit!8045)

(assert (=> d!62203 (= lt!130559 (choose!1256 (toList!1941 lt!130333) key!932))))

(declare-fun e!167979 () Bool)

(assert (=> d!62203 e!167979))

(declare-fun res!126711 () Bool)

(assert (=> d!62203 (=> (not res!126711) (not e!167979))))

(declare-fun isStrictlySorted!374 (List!3817) Bool)

(assert (=> d!62203 (= res!126711 (isStrictlySorted!374 (toList!1941 lt!130333)))))

(assert (=> d!62203 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 lt!130333) key!932) lt!130559)))

(declare-fun b!259172 () Bool)

(assert (=> b!259172 (= e!167979 (containsKey!306 (toList!1941 lt!130333) key!932))))

(assert (= (and d!62203 res!126711) b!259172))

(assert (=> d!62203 m!274583))

(assert (=> d!62203 m!274583))

(assert (=> d!62203 m!274585))

(declare-fun m!274715 () Bool)

(assert (=> d!62203 m!274715))

(declare-fun m!274717 () Bool)

(assert (=> d!62203 m!274717))

(assert (=> b!259172 m!274579))

(assert (=> b!259060 d!62203))

(assert (=> b!259060 d!62197))

(assert (=> b!259060 d!62199))

(declare-fun d!62205 () Bool)

(declare-fun lt!130562 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!170 (List!3818) (InoxSet (_ BitVec 64)))

(assert (=> d!62205 (= lt!130562 (select (content!170 Nil!3815) (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun e!167985 () Bool)

(assert (=> d!62205 (= lt!130562 e!167985)))

(declare-fun res!126716 () Bool)

(assert (=> d!62205 (=> (not res!126716) (not e!167985))))

(assert (=> d!62205 (= res!126716 ((_ is Cons!3814) Nil!3815))))

(assert (=> d!62205 (= (contains!1885 Nil!3815 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)) lt!130562)))

(declare-fun b!259177 () Bool)

(declare-fun e!167984 () Bool)

(assert (=> b!259177 (= e!167985 e!167984)))

(declare-fun res!126717 () Bool)

(assert (=> b!259177 (=> res!126717 e!167984)))

(assert (=> b!259177 (= res!126717 (= (h!4477 Nil!3815) (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun b!259178 () Bool)

(assert (=> b!259178 (= e!167984 (contains!1885 (t!8883 Nil!3815) (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(assert (= (and d!62205 res!126716) b!259177))

(assert (= (and b!259177 (not res!126717)) b!259178))

(declare-fun m!274719 () Bool)

(assert (=> d!62205 m!274719))

(assert (=> d!62205 m!274483))

(declare-fun m!274721 () Bool)

(assert (=> d!62205 m!274721))

(assert (=> b!259178 m!274483))

(declare-fun m!274723 () Bool)

(assert (=> b!259178 m!274723))

(assert (=> b!258956 d!62205))

(declare-fun d!62207 () Bool)

(declare-fun res!126720 () Bool)

(declare-fun e!167989 () Bool)

(assert (=> d!62207 (=> res!126720 e!167989)))

(assert (=> d!62207 (= res!126720 (bvsge #b00000000000000000000000000000000 (size!6299 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))))))))

(assert (=> d!62207 (= (arrayNoDuplicates!0 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) #b00000000000000000000000000000000 Nil!3815) e!167989)))

(declare-fun b!259179 () Bool)

(declare-fun e!167986 () Bool)

(assert (=> b!259179 (= e!167989 e!167986)))

(declare-fun res!126718 () Bool)

(assert (=> b!259179 (=> (not res!126718) (not e!167986))))

(declare-fun e!167987 () Bool)

(assert (=> b!259179 (= res!126718 (not e!167987))))

(declare-fun res!126719 () Bool)

(assert (=> b!259179 (=> (not res!126719) (not e!167987))))

(assert (=> b!259179 (= res!126719 (validKeyInArray!0 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259180 () Bool)

(declare-fun e!167988 () Bool)

(declare-fun call!24676 () Bool)

(assert (=> b!259180 (= e!167988 call!24676)))

(declare-fun b!259181 () Bool)

(assert (=> b!259181 (= e!167987 (contains!1885 Nil!3815 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259182 () Bool)

(assert (=> b!259182 (= e!167988 call!24676)))

(declare-fun b!259183 () Bool)

(assert (=> b!259183 (= e!167986 e!167988)))

(declare-fun c!43964 () Bool)

(assert (=> b!259183 (= c!43964 (validKeyInArray!0 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!24673 () Bool)

(assert (=> bm!24673 (= call!24676 (arrayNoDuplicates!0 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43964 (Cons!3814 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000) Nil!3815) Nil!3815)))))

(assert (= (and d!62207 (not res!126720)) b!259179))

(assert (= (and b!259179 res!126719) b!259181))

(assert (= (and b!259179 res!126718) b!259183))

(assert (= (and b!259183 c!43964) b!259180))

(assert (= (and b!259183 (not c!43964)) b!259182))

(assert (= (or b!259180 b!259182) bm!24673))

(assert (=> b!259179 m!274701))

(assert (=> b!259179 m!274701))

(assert (=> b!259179 m!274709))

(assert (=> b!259181 m!274701))

(assert (=> b!259181 m!274701))

(declare-fun m!274725 () Bool)

(assert (=> b!259181 m!274725))

(assert (=> b!259183 m!274701))

(assert (=> b!259183 m!274701))

(assert (=> b!259183 m!274709))

(assert (=> bm!24673 m!274701))

(declare-fun m!274727 () Bool)

(assert (=> bm!24673 m!274727))

(assert (=> b!259044 d!62207))

(assert (=> b!258958 d!62201))

(declare-fun d!62209 () Bool)

(assert (=> d!62209 (= (+!695 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) (tuple2!4939 key!932 v!346)) (getCurrentListMap!1469 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(assert (=> d!62209 true))

(declare-fun _$3!58 () Unit!8045)

(assert (=> d!62209 (= (choose!1252 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) index!297 key!932 v!346 (defaultEntry!4774 thiss!1504)) _$3!58)))

(declare-fun bs!9127 () Bool)

(assert (= bs!9127 d!62209))

(assert (=> bs!9127 m!274481))

(assert (=> bs!9127 m!274371))

(assert (=> bs!9127 m!274479))

(assert (=> bs!9127 m!274353))

(assert (=> bs!9127 m!274371))

(assert (=> bs!9127 m!274333))

(assert (=> d!62141 d!62209))

(assert (=> d!62141 d!62163))

(declare-fun bm!24674 () Bool)

(declare-fun call!24677 () Bool)

(assert (=> bm!24674 (= call!24677 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(declare-fun d!62211 () Bool)

(declare-fun res!126721 () Bool)

(declare-fun e!167991 () Bool)

(assert (=> d!62211 (=> res!126721 e!167991)))

(assert (=> d!62211 (= res!126721 (bvsge #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> d!62211 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)) e!167991)))

(declare-fun b!259184 () Bool)

(declare-fun e!167992 () Bool)

(declare-fun e!167990 () Bool)

(assert (=> b!259184 (= e!167992 e!167990)))

(declare-fun lt!130563 () (_ BitVec 64))

(assert (=> b!259184 (= lt!130563 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130564 () Unit!8045)

(assert (=> b!259184 (= lt!130564 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6948 thiss!1504) lt!130563 #b00000000000000000000000000000000))))

(assert (=> b!259184 (arrayContainsKey!0 (_keys!6948 thiss!1504) lt!130563 #b00000000000000000000000000000000)))

(declare-fun lt!130565 () Unit!8045)

(assert (=> b!259184 (= lt!130565 lt!130564)))

(declare-fun res!126722 () Bool)

(assert (=> b!259184 (= res!126722 (= (seekEntryOrOpen!0 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000) (_keys!6948 thiss!1504) (mask!11082 thiss!1504)) (Found!1177 #b00000000000000000000000000000000)))))

(assert (=> b!259184 (=> (not res!126722) (not e!167990))))

(declare-fun b!259185 () Bool)

(assert (=> b!259185 (= e!167991 e!167992)))

(declare-fun c!43965 () Bool)

(assert (=> b!259185 (= c!43965 (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259186 () Bool)

(assert (=> b!259186 (= e!167990 call!24677)))

(declare-fun b!259187 () Bool)

(assert (=> b!259187 (= e!167992 call!24677)))

(assert (= (and d!62211 (not res!126721)) b!259185))

(assert (= (and b!259185 c!43965) b!259184))

(assert (= (and b!259185 (not c!43965)) b!259187))

(assert (= (and b!259184 res!126722) b!259186))

(assert (= (or b!259186 b!259187) bm!24674))

(declare-fun m!274729 () Bool)

(assert (=> bm!24674 m!274729))

(assert (=> b!259184 m!274471))

(declare-fun m!274731 () Bool)

(assert (=> b!259184 m!274731))

(declare-fun m!274733 () Bool)

(assert (=> b!259184 m!274733))

(assert (=> b!259184 m!274471))

(declare-fun m!274735 () Bool)

(assert (=> b!259184 m!274735))

(assert (=> b!259185 m!274471))

(assert (=> b!259185 m!274471))

(assert (=> b!259185 m!274473))

(assert (=> b!259091 d!62211))

(declare-fun d!62213 () Bool)

(assert (=> d!62213 (= (inRange!0 (ite c!43945 (index!6878 lt!130535) (index!6881 lt!130535)) (mask!11082 thiss!1504)) (and (bvsge (ite c!43945 (index!6878 lt!130535) (index!6881 lt!130535)) #b00000000000000000000000000000000) (bvslt (ite c!43945 (index!6878 lt!130535) (index!6881 lt!130535)) (bvadd (mask!11082 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24670 d!62213))

(declare-fun b!259212 () Bool)

(declare-fun e!168009 () Bool)

(declare-fun lt!130581 () ListLongMap!3851)

(declare-fun isEmpty!535 (ListLongMap!3851) Bool)

(assert (=> b!259212 (= e!168009 (isEmpty!535 lt!130581))))

(declare-fun bm!24677 () Bool)

(declare-fun call!24680 () ListLongMap!3851)

(assert (=> bm!24677 (= call!24680 (getCurrentListMapNoExtraKeys!578 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4774 thiss!1504)))))

(declare-fun b!259213 () Bool)

(declare-fun e!168007 () Bool)

(declare-fun e!168013 () Bool)

(assert (=> b!259213 (= e!168007 e!168013)))

(assert (=> b!259213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun res!126731 () Bool)

(assert (=> b!259213 (= res!126731 (contains!1882 lt!130581 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259213 (=> (not res!126731) (not e!168013))))

(declare-fun b!259214 () Bool)

(declare-fun e!168011 () ListLongMap!3851)

(declare-fun e!168010 () ListLongMap!3851)

(assert (=> b!259214 (= e!168011 e!168010)))

(declare-fun c!43976 () Bool)

(assert (=> b!259214 (= c!43976 (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259215 () Bool)

(declare-fun lt!130583 () Unit!8045)

(declare-fun lt!130582 () Unit!8045)

(assert (=> b!259215 (= lt!130583 lt!130582)))

(declare-fun lt!130584 () V!8459)

(declare-fun lt!130585 () (_ BitVec 64))

(declare-fun lt!130580 () (_ BitVec 64))

(declare-fun lt!130586 () ListLongMap!3851)

(assert (=> b!259215 (not (contains!1882 (+!695 lt!130586 (tuple2!4939 lt!130585 lt!130584)) lt!130580))))

(declare-fun addStillNotContains!126 (ListLongMap!3851 (_ BitVec 64) V!8459 (_ BitVec 64)) Unit!8045)

(assert (=> b!259215 (= lt!130582 (addStillNotContains!126 lt!130586 lt!130585 lt!130584 lt!130580))))

(assert (=> b!259215 (= lt!130580 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!259215 (= lt!130584 (get!3062 (select (arr!5950 (_values!4757 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259215 (= lt!130585 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259215 (= lt!130586 call!24680)))

(assert (=> b!259215 (= e!168010 (+!695 call!24680 (tuple2!4939 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000) (get!3062 (select (arr!5950 (_values!4757 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!259216 () Bool)

(assert (=> b!259216 (= e!168010 call!24680)))

(declare-fun b!259217 () Bool)

(declare-fun e!168012 () Bool)

(assert (=> b!259217 (= e!168012 (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259217 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!259218 () Bool)

(assert (=> b!259218 (= e!168011 (ListLongMap!3852 Nil!3814))))

(declare-fun d!62215 () Bool)

(declare-fun e!168008 () Bool)

(assert (=> d!62215 e!168008))

(declare-fun res!126733 () Bool)

(assert (=> d!62215 (=> (not res!126733) (not e!168008))))

(assert (=> d!62215 (= res!126733 (not (contains!1882 lt!130581 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62215 (= lt!130581 e!168011)))

(declare-fun c!43977 () Bool)

(assert (=> d!62215 (= c!43977 (bvsge #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> d!62215 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62215 (= (getCurrentListMapNoExtraKeys!578 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) lt!130581)))

(declare-fun b!259219 () Bool)

(assert (=> b!259219 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> b!259219 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6298 (_values!4757 thiss!1504))))))

(assert (=> b!259219 (= e!168013 (= (apply!256 lt!130581 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)) (get!3062 (select (arr!5950 (_values!4757 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!259220 () Bool)

(assert (=> b!259220 (= e!168009 (= lt!130581 (getCurrentListMapNoExtraKeys!578 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4774 thiss!1504))))))

(declare-fun b!259221 () Bool)

(assert (=> b!259221 (= e!168007 e!168009)))

(declare-fun c!43975 () Bool)

(assert (=> b!259221 (= c!43975 (bvslt #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!259222 () Bool)

(assert (=> b!259222 (= e!168008 e!168007)))

(declare-fun c!43974 () Bool)

(assert (=> b!259222 (= c!43974 e!168012)))

(declare-fun res!126732 () Bool)

(assert (=> b!259222 (=> (not res!126732) (not e!168012))))

(assert (=> b!259222 (= res!126732 (bvslt #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!259223 () Bool)

(declare-fun res!126734 () Bool)

(assert (=> b!259223 (=> (not res!126734) (not e!168008))))

(assert (=> b!259223 (= res!126734 (not (contains!1882 lt!130581 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62215 c!43977) b!259218))

(assert (= (and d!62215 (not c!43977)) b!259214))

(assert (= (and b!259214 c!43976) b!259215))

(assert (= (and b!259214 (not c!43976)) b!259216))

(assert (= (or b!259215 b!259216) bm!24677))

(assert (= (and d!62215 res!126733) b!259223))

(assert (= (and b!259223 res!126734) b!259222))

(assert (= (and b!259222 res!126732) b!259217))

(assert (= (and b!259222 c!43974) b!259213))

(assert (= (and b!259222 (not c!43974)) b!259221))

(assert (= (and b!259213 res!126731) b!259219))

(assert (= (and b!259221 c!43975) b!259220))

(assert (= (and b!259221 (not c!43975)) b!259212))

(declare-fun b_lambda!8231 () Bool)

(assert (=> (not b_lambda!8231) (not b!259215)))

(assert (=> b!259215 t!8886))

(declare-fun b_and!13843 () Bool)

(assert (= b_and!13841 (and (=> t!8886 result!5397) b_and!13843)))

(declare-fun b_lambda!8233 () Bool)

(assert (=> (not b_lambda!8233) (not b!259219)))

(assert (=> b!259219 t!8886))

(declare-fun b_and!13845 () Bool)

(assert (= b_and!13843 (and (=> t!8886 result!5397) b_and!13845)))

(declare-fun m!274737 () Bool)

(assert (=> d!62215 m!274737))

(assert (=> d!62215 m!274323))

(assert (=> b!259213 m!274471))

(assert (=> b!259213 m!274471))

(declare-fun m!274739 () Bool)

(assert (=> b!259213 m!274739))

(declare-fun m!274741 () Bool)

(assert (=> b!259220 m!274741))

(declare-fun m!274743 () Bool)

(assert (=> b!259212 m!274743))

(assert (=> b!259217 m!274471))

(assert (=> b!259217 m!274471))

(assert (=> b!259217 m!274473))

(assert (=> b!259214 m!274471))

(assert (=> b!259214 m!274471))

(assert (=> b!259214 m!274473))

(declare-fun m!274745 () Bool)

(assert (=> b!259223 m!274745))

(declare-fun m!274747 () Bool)

(assert (=> b!259215 m!274747))

(declare-fun m!274749 () Bool)

(assert (=> b!259215 m!274749))

(declare-fun m!274751 () Bool)

(assert (=> b!259215 m!274751))

(assert (=> b!259215 m!274505))

(declare-fun m!274753 () Bool)

(assert (=> b!259215 m!274753))

(assert (=> b!259215 m!274471))

(assert (=> b!259215 m!274589))

(assert (=> b!259215 m!274505))

(assert (=> b!259215 m!274591))

(assert (=> b!259215 m!274589))

(assert (=> b!259215 m!274747))

(assert (=> bm!24677 m!274741))

(assert (=> b!259219 m!274471))

(declare-fun m!274755 () Bool)

(assert (=> b!259219 m!274755))

(assert (=> b!259219 m!274505))

(assert (=> b!259219 m!274589))

(assert (=> b!259219 m!274471))

(assert (=> b!259219 m!274589))

(assert (=> b!259219 m!274505))

(assert (=> b!259219 m!274591))

(assert (=> bm!24659 d!62215))

(assert (=> b!258954 d!62201))

(declare-fun d!62217 () Bool)

(declare-fun e!168015 () Bool)

(assert (=> d!62217 e!168015))

(declare-fun res!126735 () Bool)

(assert (=> d!62217 (=> res!126735 e!168015)))

(declare-fun lt!130588 () Bool)

(assert (=> d!62217 (= res!126735 (not lt!130588))))

(declare-fun lt!130589 () Bool)

(assert (=> d!62217 (= lt!130588 lt!130589)))

(declare-fun lt!130590 () Unit!8045)

(declare-fun e!168014 () Unit!8045)

(assert (=> d!62217 (= lt!130590 e!168014)))

(declare-fun c!43978 () Bool)

(assert (=> d!62217 (= c!43978 lt!130589)))

(assert (=> d!62217 (= lt!130589 (containsKey!306 (toList!1941 lt!130521) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62217 (= (contains!1882 lt!130521 #b1000000000000000000000000000000000000000000000000000000000000000) lt!130588)))

(declare-fun b!259224 () Bool)

(declare-fun lt!130587 () Unit!8045)

(assert (=> b!259224 (= e!168014 lt!130587)))

(assert (=> b!259224 (= lt!130587 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 lt!130521) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259224 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130521) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259225 () Bool)

(declare-fun Unit!8059 () Unit!8045)

(assert (=> b!259225 (= e!168014 Unit!8059)))

(declare-fun b!259226 () Bool)

(assert (=> b!259226 (= e!168015 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62217 c!43978) b!259224))

(assert (= (and d!62217 (not c!43978)) b!259225))

(assert (= (and d!62217 (not res!126735)) b!259226))

(declare-fun m!274757 () Bool)

(assert (=> d!62217 m!274757))

(declare-fun m!274759 () Bool)

(assert (=> b!259224 m!274759))

(declare-fun m!274761 () Bool)

(assert (=> b!259224 m!274761))

(assert (=> b!259224 m!274761))

(declare-fun m!274763 () Bool)

(assert (=> b!259224 m!274763))

(assert (=> b!259226 m!274761))

(assert (=> b!259226 m!274761))

(assert (=> b!259226 m!274763))

(assert (=> bm!24665 d!62217))

(declare-fun b!259238 () Bool)

(declare-fun e!168018 () Bool)

(assert (=> b!259238 (= e!168018 (and (bvsge (extraKeys!4511 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4511 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1960 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!259237 () Bool)

(declare-fun res!126745 () Bool)

(assert (=> b!259237 (=> (not res!126745) (not e!168018))))

(declare-fun size!6302 (LongMapFixedSize!3822) (_ BitVec 32))

(assert (=> b!259237 (= res!126745 (= (size!6302 thiss!1504) (bvadd (_size!1960 thiss!1504) (bvsdiv (bvadd (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!62219 () Bool)

(declare-fun res!126747 () Bool)

(assert (=> d!62219 (=> (not res!126747) (not e!168018))))

(assert (=> d!62219 (= res!126747 (validMask!0 (mask!11082 thiss!1504)))))

(assert (=> d!62219 (= (simpleValid!279 thiss!1504) e!168018)))

(declare-fun b!259236 () Bool)

(declare-fun res!126744 () Bool)

(assert (=> b!259236 (=> (not res!126744) (not e!168018))))

(assert (=> b!259236 (= res!126744 (bvsge (size!6302 thiss!1504) (_size!1960 thiss!1504)))))

(declare-fun b!259235 () Bool)

(declare-fun res!126746 () Bool)

(assert (=> b!259235 (=> (not res!126746) (not e!168018))))

(assert (=> b!259235 (= res!126746 (and (= (size!6298 (_values!4757 thiss!1504)) (bvadd (mask!11082 thiss!1504) #b00000000000000000000000000000001)) (= (size!6299 (_keys!6948 thiss!1504)) (size!6298 (_values!4757 thiss!1504))) (bvsge (_size!1960 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1960 thiss!1504) (bvadd (mask!11082 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!62219 res!126747) b!259235))

(assert (= (and b!259235 res!126746) b!259236))

(assert (= (and b!259236 res!126744) b!259237))

(assert (= (and b!259237 res!126745) b!259238))

(declare-fun m!274765 () Bool)

(assert (=> b!259237 m!274765))

(assert (=> d!62219 m!274323))

(assert (=> b!259236 m!274765))

(assert (=> d!62173 d!62219))

(declare-fun d!62221 () Bool)

(declare-fun lt!130593 () Bool)

(declare-fun content!171 (List!3817) (InoxSet tuple2!4938))

(assert (=> d!62221 (= lt!130593 (select (content!171 (toList!1941 lt!130390)) (tuple2!4939 key!932 v!346)))))

(declare-fun e!168024 () Bool)

(assert (=> d!62221 (= lt!130593 e!168024)))

(declare-fun res!126753 () Bool)

(assert (=> d!62221 (=> (not res!126753) (not e!168024))))

(assert (=> d!62221 (= res!126753 ((_ is Cons!3813) (toList!1941 lt!130390)))))

(assert (=> d!62221 (= (contains!1884 (toList!1941 lt!130390) (tuple2!4939 key!932 v!346)) lt!130593)))

(declare-fun b!259243 () Bool)

(declare-fun e!168023 () Bool)

(assert (=> b!259243 (= e!168024 e!168023)))

(declare-fun res!126752 () Bool)

(assert (=> b!259243 (=> res!126752 e!168023)))

(assert (=> b!259243 (= res!126752 (= (h!4476 (toList!1941 lt!130390)) (tuple2!4939 key!932 v!346)))))

(declare-fun b!259244 () Bool)

(assert (=> b!259244 (= e!168023 (contains!1884 (t!8882 (toList!1941 lt!130390)) (tuple2!4939 key!932 v!346)))))

(assert (= (and d!62221 res!126753) b!259243))

(assert (= (and b!259243 (not res!126752)) b!259244))

(declare-fun m!274767 () Bool)

(assert (=> d!62221 m!274767))

(declare-fun m!274769 () Bool)

(assert (=> d!62221 m!274769))

(declare-fun m!274771 () Bool)

(assert (=> b!259244 m!274771))

(assert (=> b!258918 d!62221))

(declare-fun d!62223 () Bool)

(declare-fun res!126756 () Bool)

(declare-fun e!168028 () Bool)

(assert (=> d!62223 (=> res!126756 e!168028)))

(assert (=> d!62223 (= res!126756 (bvsge #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> d!62223 (= (arrayNoDuplicates!0 (_keys!6948 thiss!1504) #b00000000000000000000000000000000 Nil!3815) e!168028)))

(declare-fun b!259245 () Bool)

(declare-fun e!168025 () Bool)

(assert (=> b!259245 (= e!168028 e!168025)))

(declare-fun res!126754 () Bool)

(assert (=> b!259245 (=> (not res!126754) (not e!168025))))

(declare-fun e!168026 () Bool)

(assert (=> b!259245 (= res!126754 (not e!168026))))

(declare-fun res!126755 () Bool)

(assert (=> b!259245 (=> (not res!126755) (not e!168026))))

(assert (=> b!259245 (= res!126755 (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259246 () Bool)

(declare-fun e!168027 () Bool)

(declare-fun call!24681 () Bool)

(assert (=> b!259246 (= e!168027 call!24681)))

(declare-fun b!259247 () Bool)

(assert (=> b!259247 (= e!168026 (contains!1885 Nil!3815 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259248 () Bool)

(assert (=> b!259248 (= e!168027 call!24681)))

(declare-fun b!259249 () Bool)

(assert (=> b!259249 (= e!168025 e!168027)))

(declare-fun c!43979 () Bool)

(assert (=> b!259249 (= c!43979 (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24678 () Bool)

(assert (=> bm!24678 (= call!24681 (arrayNoDuplicates!0 (_keys!6948 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43979 (Cons!3814 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000) Nil!3815) Nil!3815)))))

(assert (= (and d!62223 (not res!126756)) b!259245))

(assert (= (and b!259245 res!126755) b!259247))

(assert (= (and b!259245 res!126754) b!259249))

(assert (= (and b!259249 c!43979) b!259246))

(assert (= (and b!259249 (not c!43979)) b!259248))

(assert (= (or b!259246 b!259248) bm!24678))

(assert (=> b!259245 m!274471))

(assert (=> b!259245 m!274471))

(assert (=> b!259245 m!274473))

(assert (=> b!259247 m!274471))

(assert (=> b!259247 m!274471))

(declare-fun m!274773 () Bool)

(assert (=> b!259247 m!274773))

(assert (=> b!259249 m!274471))

(assert (=> b!259249 m!274471))

(assert (=> b!259249 m!274473))

(assert (=> bm!24678 m!274471))

(declare-fun m!274775 () Bool)

(assert (=> bm!24678 m!274775))

(assert (=> b!259092 d!62223))

(declare-fun d!62225 () Bool)

(declare-fun get!3063 (Option!320) V!8459)

(assert (=> d!62225 (= (apply!256 lt!130521 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3063 (getValueByKey!314 (toList!1941 lt!130521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9128 () Bool)

(assert (= bs!9128 d!62225))

(assert (=> bs!9128 m!274761))

(assert (=> bs!9128 m!274761))

(declare-fun m!274777 () Bool)

(assert (=> bs!9128 m!274777))

(assert (=> b!259079 d!62225))

(declare-fun d!62227 () Bool)

(declare-fun res!126761 () Bool)

(declare-fun e!168033 () Bool)

(assert (=> d!62227 (=> res!126761 e!168033)))

(assert (=> d!62227 (= res!126761 (and ((_ is Cons!3813) (toList!1941 lt!130333)) (= (_1!2480 (h!4476 (toList!1941 lt!130333))) key!932)))))

(assert (=> d!62227 (= (containsKey!306 (toList!1941 lt!130333) key!932) e!168033)))

(declare-fun b!259254 () Bool)

(declare-fun e!168034 () Bool)

(assert (=> b!259254 (= e!168033 e!168034)))

(declare-fun res!126762 () Bool)

(assert (=> b!259254 (=> (not res!126762) (not e!168034))))

(assert (=> b!259254 (= res!126762 (and (or (not ((_ is Cons!3813) (toList!1941 lt!130333))) (bvsle (_1!2480 (h!4476 (toList!1941 lt!130333))) key!932)) ((_ is Cons!3813) (toList!1941 lt!130333)) (bvslt (_1!2480 (h!4476 (toList!1941 lt!130333))) key!932)))))

(declare-fun b!259255 () Bool)

(assert (=> b!259255 (= e!168034 (containsKey!306 (t!8882 (toList!1941 lt!130333)) key!932))))

(assert (= (and d!62227 (not res!126761)) b!259254))

(assert (= (and b!259254 res!126762) b!259255))

(declare-fun m!274779 () Bool)

(assert (=> b!259255 m!274779))

(assert (=> d!62169 d!62227))

(declare-fun d!62229 () Bool)

(assert (=> d!62229 (= (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) index!297)) (and (not (= (select (arr!5951 (_keys!6948 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5951 (_keys!6948 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258909 d!62229))

(declare-fun d!62231 () Bool)

(declare-fun res!126765 () Bool)

(declare-fun e!168038 () Bool)

(assert (=> d!62231 (=> res!126765 e!168038)))

(assert (=> d!62231 (= res!126765 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 lt!130324)))))

(assert (=> d!62231 (= (arrayNoDuplicates!0 lt!130324 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43908 (Cons!3814 (select (arr!5951 lt!130324) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) e!168038)))

(declare-fun b!259256 () Bool)

(declare-fun e!168035 () Bool)

(assert (=> b!259256 (= e!168038 e!168035)))

(declare-fun res!126763 () Bool)

(assert (=> b!259256 (=> (not res!126763) (not e!168035))))

(declare-fun e!168036 () Bool)

(assert (=> b!259256 (= res!126763 (not e!168036))))

(declare-fun res!126764 () Bool)

(assert (=> b!259256 (=> (not res!126764) (not e!168036))))

(assert (=> b!259256 (= res!126764 (validKeyInArray!0 (select (arr!5951 lt!130324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!259257 () Bool)

(declare-fun e!168037 () Bool)

(declare-fun call!24682 () Bool)

(assert (=> b!259257 (= e!168037 call!24682)))

(declare-fun b!259258 () Bool)

(assert (=> b!259258 (= e!168036 (contains!1885 (ite c!43908 (Cons!3814 (select (arr!5951 lt!130324) #b00000000000000000000000000000000) Nil!3815) Nil!3815) (select (arr!5951 lt!130324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!259259 () Bool)

(assert (=> b!259259 (= e!168037 call!24682)))

(declare-fun b!259260 () Bool)

(assert (=> b!259260 (= e!168035 e!168037)))

(declare-fun c!43980 () Bool)

(assert (=> b!259260 (= c!43980 (validKeyInArray!0 (select (arr!5951 lt!130324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24679 () Bool)

(assert (=> bm!24679 (= call!24682 (arrayNoDuplicates!0 lt!130324 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!43980 (Cons!3814 (select (arr!5951 lt!130324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!43908 (Cons!3814 (select (arr!5951 lt!130324) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (ite c!43908 (Cons!3814 (select (arr!5951 lt!130324) #b00000000000000000000000000000000) Nil!3815) Nil!3815))))))

(assert (= (and d!62231 (not res!126765)) b!259256))

(assert (= (and b!259256 res!126764) b!259258))

(assert (= (and b!259256 res!126763) b!259260))

(assert (= (and b!259260 c!43980) b!259257))

(assert (= (and b!259260 (not c!43980)) b!259259))

(assert (= (or b!259257 b!259259) bm!24679))

(declare-fun m!274781 () Bool)

(assert (=> b!259256 m!274781))

(assert (=> b!259256 m!274781))

(declare-fun m!274783 () Bool)

(assert (=> b!259256 m!274783))

(assert (=> b!259258 m!274781))

(assert (=> b!259258 m!274781))

(declare-fun m!274785 () Bool)

(assert (=> b!259258 m!274785))

(assert (=> b!259260 m!274781))

(assert (=> b!259260 m!274781))

(assert (=> b!259260 m!274783))

(assert (=> bm!24679 m!274781))

(declare-fun m!274787 () Bool)

(assert (=> bm!24679 m!274787))

(assert (=> bm!24633 d!62231))

(declare-fun d!62233 () Bool)

(declare-fun e!168040 () Bool)

(assert (=> d!62233 e!168040))

(declare-fun res!126766 () Bool)

(assert (=> d!62233 (=> res!126766 e!168040)))

(declare-fun lt!130595 () Bool)

(assert (=> d!62233 (= res!126766 (not lt!130595))))

(declare-fun lt!130596 () Bool)

(assert (=> d!62233 (= lt!130595 lt!130596)))

(declare-fun lt!130597 () Unit!8045)

(declare-fun e!168039 () Unit!8045)

(assert (=> d!62233 (= lt!130597 e!168039)))

(declare-fun c!43981 () Bool)

(assert (=> d!62233 (= c!43981 lt!130596)))

(assert (=> d!62233 (= lt!130596 (containsKey!306 (toList!1941 lt!130521) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62233 (= (contains!1882 lt!130521 #b0000000000000000000000000000000000000000000000000000000000000000) lt!130595)))

(declare-fun b!259261 () Bool)

(declare-fun lt!130594 () Unit!8045)

(assert (=> b!259261 (= e!168039 lt!130594)))

(assert (=> b!259261 (= lt!130594 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 lt!130521) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259261 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130521) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259262 () Bool)

(declare-fun Unit!8060 () Unit!8045)

(assert (=> b!259262 (= e!168039 Unit!8060)))

(declare-fun b!259263 () Bool)

(assert (=> b!259263 (= e!168040 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130521) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62233 c!43981) b!259261))

(assert (= (and d!62233 (not c!43981)) b!259262))

(assert (= (and d!62233 (not res!126766)) b!259263))

(declare-fun m!274789 () Bool)

(assert (=> d!62233 m!274789))

(declare-fun m!274791 () Bool)

(assert (=> b!259261 m!274791))

(declare-fun m!274793 () Bool)

(assert (=> b!259261 m!274793))

(assert (=> b!259261 m!274793))

(declare-fun m!274795 () Bool)

(assert (=> b!259261 m!274795))

(assert (=> b!259263 m!274793))

(assert (=> b!259263 m!274793))

(assert (=> b!259263 m!274795))

(assert (=> bm!24661 d!62233))

(declare-fun bm!24680 () Bool)

(declare-fun call!24683 () Bool)

(assert (=> bm!24680 (= call!24683 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!130324 (mask!11082 thiss!1504)))))

(declare-fun d!62235 () Bool)

(declare-fun res!126767 () Bool)

(declare-fun e!168042 () Bool)

(assert (=> d!62235 (=> res!126767 e!168042)))

(assert (=> d!62235 (= res!126767 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 lt!130324)))))

(assert (=> d!62235 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130324 (mask!11082 thiss!1504)) e!168042)))

(declare-fun b!259264 () Bool)

(declare-fun e!168043 () Bool)

(declare-fun e!168041 () Bool)

(assert (=> b!259264 (= e!168043 e!168041)))

(declare-fun lt!130598 () (_ BitVec 64))

(assert (=> b!259264 (= lt!130598 (select (arr!5951 lt!130324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!130599 () Unit!8045)

(assert (=> b!259264 (= lt!130599 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130324 lt!130598 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!259264 (arrayContainsKey!0 lt!130324 lt!130598 #b00000000000000000000000000000000)))

(declare-fun lt!130600 () Unit!8045)

(assert (=> b!259264 (= lt!130600 lt!130599)))

(declare-fun res!126768 () Bool)

(assert (=> b!259264 (= res!126768 (= (seekEntryOrOpen!0 (select (arr!5951 lt!130324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!130324 (mask!11082 thiss!1504)) (Found!1177 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!259264 (=> (not res!126768) (not e!168041))))

(declare-fun b!259265 () Bool)

(assert (=> b!259265 (= e!168042 e!168043)))

(declare-fun c!43982 () Bool)

(assert (=> b!259265 (= c!43982 (validKeyInArray!0 (select (arr!5951 lt!130324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!259266 () Bool)

(assert (=> b!259266 (= e!168041 call!24683)))

(declare-fun b!259267 () Bool)

(assert (=> b!259267 (= e!168043 call!24683)))

(assert (= (and d!62235 (not res!126767)) b!259265))

(assert (= (and b!259265 c!43982) b!259264))

(assert (= (and b!259265 (not c!43982)) b!259267))

(assert (= (and b!259264 res!126768) b!259266))

(assert (= (or b!259266 b!259267) bm!24680))

(declare-fun m!274797 () Bool)

(assert (=> bm!24680 m!274797))

(assert (=> b!259264 m!274781))

(declare-fun m!274799 () Bool)

(assert (=> b!259264 m!274799))

(declare-fun m!274801 () Bool)

(assert (=> b!259264 m!274801))

(assert (=> b!259264 m!274781))

(declare-fun m!274803 () Bool)

(assert (=> b!259264 m!274803))

(assert (=> b!259265 m!274781))

(assert (=> b!259265 m!274781))

(assert (=> b!259265 m!274783))

(assert (=> bm!24636 d!62235))

(declare-fun b!259268 () Bool)

(declare-fun e!168044 () (_ BitVec 32))

(declare-fun call!24684 () (_ BitVec 32))

(assert (=> b!259268 (= e!168044 (bvadd #b00000000000000000000000000000001 call!24684))))

(declare-fun d!62237 () Bool)

(declare-fun lt!130601 () (_ BitVec 32))

(assert (=> d!62237 (and (bvsge lt!130601 #b00000000000000000000000000000000) (bvsle lt!130601 (bvsub (size!6299 lt!130324) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun e!168045 () (_ BitVec 32))

(assert (=> d!62237 (= lt!130601 e!168045)))

(declare-fun c!43984 () Bool)

(assert (=> d!62237 (= c!43984 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62237 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6299 lt!130324)))))

(assert (=> d!62237 (= (arrayCountValidKeys!0 lt!130324 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!130601)))

(declare-fun b!259269 () Bool)

(assert (=> b!259269 (= e!168044 call!24684)))

(declare-fun b!259270 () Bool)

(assert (=> b!259270 (= e!168045 e!168044)))

(declare-fun c!43983 () Bool)

(assert (=> b!259270 (= c!43983 (validKeyInArray!0 (select (arr!5951 lt!130324) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun bm!24681 () Bool)

(assert (=> bm!24681 (= call!24684 (arrayCountValidKeys!0 lt!130324 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!259271 () Bool)

(assert (=> b!259271 (= e!168045 #b00000000000000000000000000000000)))

(assert (= (and d!62237 c!43984) b!259271))

(assert (= (and d!62237 (not c!43984)) b!259270))

(assert (= (and b!259270 c!43983) b!259268))

(assert (= (and b!259270 (not c!43983)) b!259269))

(assert (= (or b!259268 b!259269) bm!24681))

(declare-fun m!274805 () Bool)

(assert (=> b!259270 m!274805))

(assert (=> b!259270 m!274805))

(declare-fun m!274807 () Bool)

(assert (=> b!259270 m!274807))

(declare-fun m!274809 () Bool)

(assert (=> bm!24681 m!274809))

(assert (=> bm!24658 d!62237))

(declare-fun d!62239 () Bool)

(declare-fun e!168046 () Bool)

(assert (=> d!62239 e!168046))

(declare-fun res!126770 () Bool)

(assert (=> d!62239 (=> (not res!126770) (not e!168046))))

(declare-fun lt!130603 () ListLongMap!3851)

(assert (=> d!62239 (= res!126770 (contains!1882 lt!130603 (_1!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(declare-fun lt!130602 () List!3817)

(assert (=> d!62239 (= lt!130603 (ListLongMap!3852 lt!130602))))

(declare-fun lt!130604 () Unit!8045)

(declare-fun lt!130605 () Unit!8045)

(assert (=> d!62239 (= lt!130604 lt!130605)))

(assert (=> d!62239 (= (getValueByKey!314 lt!130602 (_1!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(assert (=> d!62239 (= lt!130605 (lemmaContainsTupThenGetReturnValue!170 lt!130602 (_1!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(assert (=> d!62239 (= lt!130602 (insertStrictlySorted!173 (toList!1941 call!24654) (_1!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(assert (=> d!62239 (= (+!695 call!24654 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))) lt!130603)))

(declare-fun b!259272 () Bool)

(declare-fun res!126769 () Bool)

(assert (=> b!259272 (=> (not res!126769) (not e!168046))))

(assert (=> b!259272 (= res!126769 (= (getValueByKey!314 (toList!1941 lt!130603) (_1!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))))

(declare-fun b!259273 () Bool)

(assert (=> b!259273 (= e!168046 (contains!1884 (toList!1941 lt!130603) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))

(assert (= (and d!62239 res!126770) b!259272))

(assert (= (and b!259272 res!126769) b!259273))

(declare-fun m!274811 () Bool)

(assert (=> d!62239 m!274811))

(declare-fun m!274813 () Bool)

(assert (=> d!62239 m!274813))

(declare-fun m!274815 () Bool)

(assert (=> d!62239 m!274815))

(declare-fun m!274817 () Bool)

(assert (=> d!62239 m!274817))

(declare-fun m!274819 () Bool)

(assert (=> b!259272 m!274819))

(declare-fun m!274821 () Bool)

(assert (=> b!259273 m!274821))

(assert (=> b!259013 d!62239))

(assert (=> d!62175 d!62183))

(declare-fun d!62241 () Bool)

(declare-fun e!168049 () Bool)

(assert (=> d!62241 e!168049))

(declare-fun res!126775 () Bool)

(assert (=> d!62241 (=> (not res!126775) (not e!168049))))

(declare-fun lt!130608 () SeekEntryResult!1177)

(assert (=> d!62241 (= res!126775 ((_ is Found!1177) lt!130608))))

(assert (=> d!62241 (= lt!130608 (seekEntryOrOpen!0 key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(assert (=> d!62241 true))

(declare-fun _$33!177 () Unit!8045)

(assert (=> d!62241 (= (choose!1253 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 (defaultEntry!4774 thiss!1504)) _$33!177)))

(declare-fun b!259278 () Bool)

(declare-fun res!126776 () Bool)

(assert (=> b!259278 (=> (not res!126776) (not e!168049))))

(assert (=> b!259278 (= res!126776 (inRange!0 (index!6879 lt!130608) (mask!11082 thiss!1504)))))

(declare-fun b!259279 () Bool)

(assert (=> b!259279 (= e!168049 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6879 lt!130608)) key!932))))

(assert (= (and d!62241 res!126775) b!259278))

(assert (= (and b!259278 res!126776) b!259279))

(assert (=> d!62241 m!274379))

(declare-fun m!274823 () Bool)

(assert (=> b!259278 m!274823))

(declare-fun m!274825 () Bool)

(assert (=> b!259279 m!274825))

(assert (=> d!62175 d!62241))

(assert (=> d!62175 d!62163))

(declare-fun d!62243 () Bool)

(assert (=> d!62243 (= (apply!256 lt!130474 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3063 (getValueByKey!314 (toList!1941 lt!130474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9129 () Bool)

(assert (= bs!9129 d!62243))

(declare-fun m!274827 () Bool)

(assert (=> bs!9129 m!274827))

(assert (=> bs!9129 m!274827))

(declare-fun m!274829 () Bool)

(assert (=> bs!9129 m!274829))

(assert (=> b!259029 d!62243))

(declare-fun b!259280 () Bool)

(declare-fun e!168050 () (_ BitVec 32))

(declare-fun call!24685 () (_ BitVec 32))

(assert (=> b!259280 (= e!168050 (bvadd #b00000000000000000000000000000001 call!24685))))

(declare-fun d!62245 () Bool)

(declare-fun lt!130609 () (_ BitVec 32))

(assert (=> d!62245 (and (bvsge lt!130609 #b00000000000000000000000000000000) (bvsle lt!130609 (bvsub (size!6299 lt!130324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!168051 () (_ BitVec 32))

(assert (=> d!62245 (= lt!130609 e!168051)))

(declare-fun c!43986 () Bool)

(assert (=> d!62245 (= c!43986 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> d!62245 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6299 (_keys!6948 thiss!1504)) (size!6299 lt!130324)))))

(assert (=> d!62245 (= (arrayCountValidKeys!0 lt!130324 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))) lt!130609)))

(declare-fun b!259281 () Bool)

(assert (=> b!259281 (= e!168050 call!24685)))

(declare-fun b!259282 () Bool)

(assert (=> b!259282 (= e!168051 e!168050)))

(declare-fun c!43985 () Bool)

(assert (=> b!259282 (= c!43985 (validKeyInArray!0 (select (arr!5951 lt!130324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24682 () Bool)

(assert (=> bm!24682 (= call!24685 (arrayCountValidKeys!0 lt!130324 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!259283 () Bool)

(assert (=> b!259283 (= e!168051 #b00000000000000000000000000000000)))

(assert (= (and d!62245 c!43986) b!259283))

(assert (= (and d!62245 (not c!43986)) b!259282))

(assert (= (and b!259282 c!43985) b!259280))

(assert (= (and b!259282 (not c!43985)) b!259281))

(assert (= (or b!259280 b!259281) bm!24682))

(assert (=> b!259282 m!274781))

(assert (=> b!259282 m!274781))

(assert (=> b!259282 m!274783))

(declare-fun m!274831 () Bool)

(assert (=> bm!24682 m!274831))

(assert (=> bm!24630 d!62245))

(declare-fun d!62247 () Bool)

(declare-fun e!168052 () Bool)

(assert (=> d!62247 e!168052))

(declare-fun res!126778 () Bool)

(assert (=> d!62247 (=> (not res!126778) (not e!168052))))

(declare-fun lt!130611 () ListLongMap!3851)

(assert (=> d!62247 (= res!126778 (contains!1882 lt!130611 (_1!2480 (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))))

(declare-fun lt!130610 () List!3817)

(assert (=> d!62247 (= lt!130611 (ListLongMap!3852 lt!130610))))

(declare-fun lt!130612 () Unit!8045)

(declare-fun lt!130613 () Unit!8045)

(assert (=> d!62247 (= lt!130612 lt!130613)))

(assert (=> d!62247 (= (getValueByKey!314 lt!130610 (_1!2480 (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))) (Some!319 (_2!2480 (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))))

(assert (=> d!62247 (= lt!130613 (lemmaContainsTupThenGetReturnValue!170 lt!130610 (_1!2480 (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))) (_2!2480 (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))))

(assert (=> d!62247 (= lt!130610 (insertStrictlySorted!173 (toList!1941 (ite c!43938 call!24664 (ite c!43937 call!24663 call!24665))) (_1!2480 (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))) (_2!2480 (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))))

(assert (=> d!62247 (= (+!695 (ite c!43938 call!24664 (ite c!43937 call!24663 call!24665)) (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))) lt!130611)))

(declare-fun b!259284 () Bool)

(declare-fun res!126777 () Bool)

(assert (=> b!259284 (=> (not res!126777) (not e!168052))))

(assert (=> b!259284 (= res!126777 (= (getValueByKey!314 (toList!1941 lt!130611) (_1!2480 (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))) (Some!319 (_2!2480 (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))))

(declare-fun b!259285 () Bool)

(assert (=> b!259285 (= e!168052 (contains!1884 (toList!1941 lt!130611) (ite (or c!43938 c!43937) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(assert (= (and d!62247 res!126778) b!259284))

(assert (= (and b!259284 res!126777) b!259285))

(declare-fun m!274833 () Bool)

(assert (=> d!62247 m!274833))

(declare-fun m!274835 () Bool)

(assert (=> d!62247 m!274835))

(declare-fun m!274837 () Bool)

(assert (=> d!62247 m!274837))

(declare-fun m!274839 () Bool)

(assert (=> d!62247 m!274839))

(declare-fun m!274841 () Bool)

(assert (=> b!259284 m!274841))

(declare-fun m!274843 () Bool)

(assert (=> b!259285 m!274843))

(assert (=> bm!24662 d!62247))

(declare-fun d!62249 () Bool)

(assert (=> d!62249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (mask!11082 thiss!1504))))

(assert (=> d!62249 true))

(declare-fun _$56!36 () Unit!8045)

(assert (=> d!62249 (= (choose!102 key!932 (_keys!6948 thiss!1504) index!297 (mask!11082 thiss!1504)) _$56!36)))

(declare-fun bs!9130 () Bool)

(assert (= bs!9130 d!62249))

(assert (=> bs!9130 m!274353))

(assert (=> bs!9130 m!274575))

(assert (=> d!62161 d!62249))

(assert (=> d!62161 d!62163))

(declare-fun d!62251 () Bool)

(assert (=> d!62251 (= (apply!256 lt!130474 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)) (get!3063 (getValueByKey!314 (toList!1941 lt!130474) (select (arr!5951 lt!130324) #b00000000000000000000000000000000))))))

(declare-fun bs!9131 () Bool)

(assert (= bs!9131 d!62251))

(assert (=> bs!9131 m!274483))

(declare-fun m!274845 () Bool)

(assert (=> bs!9131 m!274845))

(assert (=> bs!9131 m!274845))

(declare-fun m!274847 () Bool)

(assert (=> bs!9131 m!274847))

(assert (=> b!259019 d!62251))

(declare-fun c!43989 () Bool)

(declare-fun d!62253 () Bool)

(assert (=> d!62253 (= c!43989 ((_ is ValueCellFull!2961) (select (arr!5950 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!168055 () V!8459)

(assert (=> d!62253 (= (get!3062 (select (arr!5950 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168055)))

(declare-fun b!259290 () Bool)

(declare-fun get!3064 (ValueCell!2961 V!8459) V!8459)

(assert (=> b!259290 (= e!168055 (get!3064 (select (arr!5950 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259291 () Bool)

(declare-fun get!3065 (ValueCell!2961 V!8459) V!8459)

(assert (=> b!259291 (= e!168055 (get!3065 (select (arr!5950 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62253 c!43989) b!259290))

(assert (= (and d!62253 (not c!43989)) b!259291))

(assert (=> b!259290 m!274507))

(assert (=> b!259290 m!274505))

(declare-fun m!274849 () Bool)

(assert (=> b!259290 m!274849))

(assert (=> b!259291 m!274507))

(assert (=> b!259291 m!274505))

(declare-fun m!274851 () Bool)

(assert (=> b!259291 m!274851))

(assert (=> b!259019 d!62253))

(declare-fun d!62255 () Bool)

(declare-fun e!168057 () Bool)

(assert (=> d!62255 e!168057))

(declare-fun res!126779 () Bool)

(assert (=> d!62255 (=> res!126779 e!168057)))

(declare-fun lt!130615 () Bool)

(assert (=> d!62255 (= res!126779 (not lt!130615))))

(declare-fun lt!130616 () Bool)

(assert (=> d!62255 (= lt!130615 lt!130616)))

(declare-fun lt!130617 () Unit!8045)

(declare-fun e!168056 () Unit!8045)

(assert (=> d!62255 (= lt!130617 e!168056)))

(declare-fun c!43990 () Bool)

(assert (=> d!62255 (= c!43990 lt!130616)))

(assert (=> d!62255 (= lt!130616 (containsKey!306 (toList!1941 lt!130390) (_1!2480 (tuple2!4939 key!932 v!346))))))

(assert (=> d!62255 (= (contains!1882 lt!130390 (_1!2480 (tuple2!4939 key!932 v!346))) lt!130615)))

(declare-fun b!259292 () Bool)

(declare-fun lt!130614 () Unit!8045)

(assert (=> b!259292 (= e!168056 lt!130614)))

(assert (=> b!259292 (= lt!130614 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 lt!130390) (_1!2480 (tuple2!4939 key!932 v!346))))))

(assert (=> b!259292 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130390) (_1!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun b!259293 () Bool)

(declare-fun Unit!8061 () Unit!8045)

(assert (=> b!259293 (= e!168056 Unit!8061)))

(declare-fun b!259294 () Bool)

(assert (=> b!259294 (= e!168057 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130390) (_1!2480 (tuple2!4939 key!932 v!346)))))))

(assert (= (and d!62255 c!43990) b!259292))

(assert (= (and d!62255 (not c!43990)) b!259293))

(assert (= (and d!62255 (not res!126779)) b!259294))

(declare-fun m!274853 () Bool)

(assert (=> d!62255 m!274853))

(declare-fun m!274855 () Bool)

(assert (=> b!259292 m!274855))

(assert (=> b!259292 m!274467))

(assert (=> b!259292 m!274467))

(declare-fun m!274857 () Bool)

(assert (=> b!259292 m!274857))

(assert (=> b!259294 m!274467))

(assert (=> b!259294 m!274467))

(assert (=> b!259294 m!274857))

(assert (=> d!62137 d!62255))

(declare-fun d!62257 () Bool)

(declare-fun c!43991 () Bool)

(assert (=> d!62257 (= c!43991 (and ((_ is Cons!3813) lt!130389) (= (_1!2480 (h!4476 lt!130389)) (_1!2480 (tuple2!4939 key!932 v!346)))))))

(declare-fun e!168058 () Option!320)

(assert (=> d!62257 (= (getValueByKey!314 lt!130389 (_1!2480 (tuple2!4939 key!932 v!346))) e!168058)))

(declare-fun b!259297 () Bool)

(declare-fun e!168059 () Option!320)

(assert (=> b!259297 (= e!168059 (getValueByKey!314 (t!8882 lt!130389) (_1!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun b!259295 () Bool)

(assert (=> b!259295 (= e!168058 (Some!319 (_2!2480 (h!4476 lt!130389))))))

(declare-fun b!259298 () Bool)

(assert (=> b!259298 (= e!168059 None!318)))

(declare-fun b!259296 () Bool)

(assert (=> b!259296 (= e!168058 e!168059)))

(declare-fun c!43992 () Bool)

(assert (=> b!259296 (= c!43992 (and ((_ is Cons!3813) lt!130389) (not (= (_1!2480 (h!4476 lt!130389)) (_1!2480 (tuple2!4939 key!932 v!346))))))))

(assert (= (and d!62257 c!43991) b!259295))

(assert (= (and d!62257 (not c!43991)) b!259296))

(assert (= (and b!259296 c!43992) b!259297))

(assert (= (and b!259296 (not c!43992)) b!259298))

(declare-fun m!274859 () Bool)

(assert (=> b!259297 m!274859))

(assert (=> d!62137 d!62257))

(declare-fun d!62259 () Bool)

(assert (=> d!62259 (= (getValueByKey!314 lt!130389 (_1!2480 (tuple2!4939 key!932 v!346))) (Some!319 (_2!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun lt!130620 () Unit!8045)

(declare-fun choose!1257 (List!3817 (_ BitVec 64) V!8459) Unit!8045)

(assert (=> d!62259 (= lt!130620 (choose!1257 lt!130389 (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun e!168062 () Bool)

(assert (=> d!62259 e!168062))

(declare-fun res!126784 () Bool)

(assert (=> d!62259 (=> (not res!126784) (not e!168062))))

(assert (=> d!62259 (= res!126784 (isStrictlySorted!374 lt!130389))))

(assert (=> d!62259 (= (lemmaContainsTupThenGetReturnValue!170 lt!130389 (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346))) lt!130620)))

(declare-fun b!259303 () Bool)

(declare-fun res!126785 () Bool)

(assert (=> b!259303 (=> (not res!126785) (not e!168062))))

(assert (=> b!259303 (= res!126785 (containsKey!306 lt!130389 (_1!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun b!259304 () Bool)

(assert (=> b!259304 (= e!168062 (contains!1884 lt!130389 (tuple2!4939 (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346)))))))

(assert (= (and d!62259 res!126784) b!259303))

(assert (= (and b!259303 res!126785) b!259304))

(assert (=> d!62259 m!274461))

(declare-fun m!274861 () Bool)

(assert (=> d!62259 m!274861))

(declare-fun m!274863 () Bool)

(assert (=> d!62259 m!274863))

(declare-fun m!274865 () Bool)

(assert (=> b!259303 m!274865))

(declare-fun m!274867 () Bool)

(assert (=> b!259304 m!274867))

(assert (=> d!62137 d!62259))

(declare-fun b!259325 () Bool)

(declare-fun e!168077 () List!3817)

(declare-fun call!24693 () List!3817)

(assert (=> b!259325 (= e!168077 call!24693)))

(declare-fun bm!24689 () Bool)

(declare-fun call!24692 () List!3817)

(assert (=> bm!24689 (= call!24693 call!24692)))

(declare-fun b!259327 () Bool)

(declare-fun res!126791 () Bool)

(declare-fun e!168074 () Bool)

(assert (=> b!259327 (=> (not res!126791) (not e!168074))))

(declare-fun lt!130623 () List!3817)

(assert (=> b!259327 (= res!126791 (containsKey!306 lt!130623 (_1!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun b!259328 () Bool)

(declare-fun e!168075 () List!3817)

(assert (=> b!259328 (= e!168075 call!24692)))

(declare-fun bm!24690 () Bool)

(declare-fun call!24694 () List!3817)

(assert (=> bm!24690 (= call!24694 call!24693)))

(declare-fun e!168073 () List!3817)

(declare-fun b!259329 () Bool)

(assert (=> b!259329 (= e!168073 (insertStrictlySorted!173 (t!8882 (toList!1941 lt!130333)) (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun b!259330 () Bool)

(assert (=> b!259330 (= e!168075 e!168077)))

(declare-fun c!44004 () Bool)

(assert (=> b!259330 (= c!44004 (and ((_ is Cons!3813) (toList!1941 lt!130333)) (= (_1!2480 (h!4476 (toList!1941 lt!130333))) (_1!2480 (tuple2!4939 key!932 v!346)))))))

(declare-fun b!259331 () Bool)

(assert (=> b!259331 (= e!168074 (contains!1884 lt!130623 (tuple2!4939 (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346)))))))

(declare-fun c!44003 () Bool)

(declare-fun b!259332 () Bool)

(assert (=> b!259332 (= c!44003 (and ((_ is Cons!3813) (toList!1941 lt!130333)) (bvsgt (_1!2480 (h!4476 (toList!1941 lt!130333))) (_1!2480 (tuple2!4939 key!932 v!346)))))))

(declare-fun e!168076 () List!3817)

(assert (=> b!259332 (= e!168077 e!168076)))

(declare-fun b!259333 () Bool)

(assert (=> b!259333 (= e!168076 call!24694)))

(declare-fun d!62261 () Bool)

(assert (=> d!62261 e!168074))

(declare-fun res!126790 () Bool)

(assert (=> d!62261 (=> (not res!126790) (not e!168074))))

(assert (=> d!62261 (= res!126790 (isStrictlySorted!374 lt!130623))))

(assert (=> d!62261 (= lt!130623 e!168075)))

(declare-fun c!44002 () Bool)

(assert (=> d!62261 (= c!44002 (and ((_ is Cons!3813) (toList!1941 lt!130333)) (bvslt (_1!2480 (h!4476 (toList!1941 lt!130333))) (_1!2480 (tuple2!4939 key!932 v!346)))))))

(assert (=> d!62261 (isStrictlySorted!374 (toList!1941 lt!130333))))

(assert (=> d!62261 (= (insertStrictlySorted!173 (toList!1941 lt!130333) (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346))) lt!130623)))

(declare-fun b!259326 () Bool)

(assert (=> b!259326 (= e!168073 (ite c!44004 (t!8882 (toList!1941 lt!130333)) (ite c!44003 (Cons!3813 (h!4476 (toList!1941 lt!130333)) (t!8882 (toList!1941 lt!130333))) Nil!3814)))))

(declare-fun bm!24691 () Bool)

(declare-fun $colon$colon!105 (List!3817 tuple2!4938) List!3817)

(assert (=> bm!24691 (= call!24692 ($colon$colon!105 e!168073 (ite c!44002 (h!4476 (toList!1941 lt!130333)) (tuple2!4939 (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346))))))))

(declare-fun c!44001 () Bool)

(assert (=> bm!24691 (= c!44001 c!44002)))

(declare-fun b!259334 () Bool)

(assert (=> b!259334 (= e!168076 call!24694)))

(assert (= (and d!62261 c!44002) b!259328))

(assert (= (and d!62261 (not c!44002)) b!259330))

(assert (= (and b!259330 c!44004) b!259325))

(assert (= (and b!259330 (not c!44004)) b!259332))

(assert (= (and b!259332 c!44003) b!259334))

(assert (= (and b!259332 (not c!44003)) b!259333))

(assert (= (or b!259334 b!259333) bm!24690))

(assert (= (or b!259325 bm!24690) bm!24689))

(assert (= (or b!259328 bm!24689) bm!24691))

(assert (= (and bm!24691 c!44001) b!259329))

(assert (= (and bm!24691 (not c!44001)) b!259326))

(assert (= (and d!62261 res!126790) b!259327))

(assert (= (and b!259327 res!126791) b!259331))

(declare-fun m!274869 () Bool)

(assert (=> bm!24691 m!274869))

(declare-fun m!274871 () Bool)

(assert (=> d!62261 m!274871))

(assert (=> d!62261 m!274717))

(declare-fun m!274873 () Bool)

(assert (=> b!259329 m!274873))

(declare-fun m!274875 () Bool)

(assert (=> b!259327 m!274875))

(declare-fun m!274877 () Bool)

(assert (=> b!259331 m!274877))

(assert (=> d!62137 d!62261))

(declare-fun d!62263 () Bool)

(assert (=> d!62263 (= (apply!256 (+!695 lt!130505 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504))) lt!130515) (get!3063 (getValueByKey!314 (toList!1941 (+!695 lt!130505 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504)))) lt!130515)))))

(declare-fun bs!9132 () Bool)

(assert (= bs!9132 d!62263))

(declare-fun m!274879 () Bool)

(assert (=> bs!9132 m!274879))

(assert (=> bs!9132 m!274879))

(declare-fun m!274881 () Bool)

(assert (=> bs!9132 m!274881))

(assert (=> b!259072 d!62263))

(declare-fun d!62265 () Bool)

(assert (=> d!62265 (= (apply!256 (+!695 lt!130502 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504))) lt!130507) (get!3063 (getValueByKey!314 (toList!1941 (+!695 lt!130502 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504)))) lt!130507)))))

(declare-fun bs!9133 () Bool)

(assert (= bs!9133 d!62265))

(declare-fun m!274883 () Bool)

(assert (=> bs!9133 m!274883))

(assert (=> bs!9133 m!274883))

(declare-fun m!274885 () Bool)

(assert (=> bs!9133 m!274885))

(assert (=> b!259072 d!62265))

(declare-fun d!62267 () Bool)

(assert (=> d!62267 (= (apply!256 (+!695 lt!130502 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504))) lt!130507) (apply!256 lt!130502 lt!130507))))

(declare-fun lt!130626 () Unit!8045)

(declare-fun choose!1258 (ListLongMap!3851 (_ BitVec 64) V!8459 (_ BitVec 64)) Unit!8045)

(assert (=> d!62267 (= lt!130626 (choose!1258 lt!130502 lt!130518 (minValue!4615 thiss!1504) lt!130507))))

(declare-fun e!168080 () Bool)

(assert (=> d!62267 e!168080))

(declare-fun res!126794 () Bool)

(assert (=> d!62267 (=> (not res!126794) (not e!168080))))

(assert (=> d!62267 (= res!126794 (contains!1882 lt!130502 lt!130507))))

(assert (=> d!62267 (= (addApplyDifferent!232 lt!130502 lt!130518 (minValue!4615 thiss!1504) lt!130507) lt!130626)))

(declare-fun b!259338 () Bool)

(assert (=> b!259338 (= e!168080 (not (= lt!130507 lt!130518)))))

(assert (= (and d!62267 res!126794) b!259338))

(declare-fun m!274887 () Bool)

(assert (=> d!62267 m!274887))

(assert (=> d!62267 m!274615))

(declare-fun m!274889 () Bool)

(assert (=> d!62267 m!274889))

(assert (=> d!62267 m!274629))

(assert (=> d!62267 m!274615))

(assert (=> d!62267 m!274617))

(assert (=> b!259072 d!62267))

(declare-fun d!62269 () Bool)

(assert (=> d!62269 (= (apply!256 lt!130502 lt!130507) (get!3063 (getValueByKey!314 (toList!1941 lt!130502) lt!130507)))))

(declare-fun bs!9134 () Bool)

(assert (= bs!9134 d!62269))

(declare-fun m!274891 () Bool)

(assert (=> bs!9134 m!274891))

(assert (=> bs!9134 m!274891))

(declare-fun m!274893 () Bool)

(assert (=> bs!9134 m!274893))

(assert (=> b!259072 d!62269))

(declare-fun d!62271 () Bool)

(declare-fun e!168081 () Bool)

(assert (=> d!62271 e!168081))

(declare-fun res!126796 () Bool)

(assert (=> d!62271 (=> (not res!126796) (not e!168081))))

(declare-fun lt!130628 () ListLongMap!3851)

(assert (=> d!62271 (= res!126796 (contains!1882 lt!130628 (_1!2480 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504)))))))

(declare-fun lt!130627 () List!3817)

(assert (=> d!62271 (= lt!130628 (ListLongMap!3852 lt!130627))))

(declare-fun lt!130629 () Unit!8045)

(declare-fun lt!130630 () Unit!8045)

(assert (=> d!62271 (= lt!130629 lt!130630)))

(assert (=> d!62271 (= (getValueByKey!314 lt!130627 (_1!2480 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504)))))))

(assert (=> d!62271 (= lt!130630 (lemmaContainsTupThenGetReturnValue!170 lt!130627 (_1!2480 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504)))))))

(assert (=> d!62271 (= lt!130627 (insertStrictlySorted!173 (toList!1941 lt!130506) (_1!2480 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504)))))))

(assert (=> d!62271 (= (+!695 lt!130506 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504))) lt!130628)))

(declare-fun b!259339 () Bool)

(declare-fun res!126795 () Bool)

(assert (=> b!259339 (=> (not res!126795) (not e!168081))))

(assert (=> b!259339 (= res!126795 (= (getValueByKey!314 (toList!1941 lt!130628) (_1!2480 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504))))))))

(declare-fun b!259340 () Bool)

(assert (=> b!259340 (= e!168081 (contains!1884 (toList!1941 lt!130628) (tuple2!4939 lt!130510 (minValue!4615 thiss!1504))))))

(assert (= (and d!62271 res!126796) b!259339))

(assert (= (and b!259339 res!126795) b!259340))

(declare-fun m!274895 () Bool)

(assert (=> d!62271 m!274895))

(declare-fun m!274897 () Bool)

(assert (=> d!62271 m!274897))

(declare-fun m!274899 () Bool)

(assert (=> d!62271 m!274899))

(declare-fun m!274901 () Bool)

(assert (=> d!62271 m!274901))

(declare-fun m!274903 () Bool)

(assert (=> b!259339 m!274903))

(declare-fun m!274905 () Bool)

(assert (=> b!259340 m!274905))

(assert (=> b!259072 d!62271))

(declare-fun d!62273 () Bool)

(declare-fun e!168082 () Bool)

(assert (=> d!62273 e!168082))

(declare-fun res!126798 () Bool)

(assert (=> d!62273 (=> (not res!126798) (not e!168082))))

(declare-fun lt!130632 () ListLongMap!3851)

(assert (=> d!62273 (= res!126798 (contains!1882 lt!130632 (_1!2480 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504)))))))

(declare-fun lt!130631 () List!3817)

(assert (=> d!62273 (= lt!130632 (ListLongMap!3852 lt!130631))))

(declare-fun lt!130633 () Unit!8045)

(declare-fun lt!130634 () Unit!8045)

(assert (=> d!62273 (= lt!130633 lt!130634)))

(assert (=> d!62273 (= (getValueByKey!314 lt!130631 (_1!2480 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504)))))))

(assert (=> d!62273 (= lt!130634 (lemmaContainsTupThenGetReturnValue!170 lt!130631 (_1!2480 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504)))))))

(assert (=> d!62273 (= lt!130631 (insertStrictlySorted!173 (toList!1941 lt!130502) (_1!2480 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504)))))))

(assert (=> d!62273 (= (+!695 lt!130502 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504))) lt!130632)))

(declare-fun b!259341 () Bool)

(declare-fun res!126797 () Bool)

(assert (=> b!259341 (=> (not res!126797) (not e!168082))))

(assert (=> b!259341 (= res!126797 (= (getValueByKey!314 (toList!1941 lt!130632) (_1!2480 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130518 (minValue!4615 thiss!1504))))))))

(declare-fun b!259342 () Bool)

(assert (=> b!259342 (= e!168082 (contains!1884 (toList!1941 lt!130632) (tuple2!4939 lt!130518 (minValue!4615 thiss!1504))))))

(assert (= (and d!62273 res!126798) b!259341))

(assert (= (and b!259341 res!126797) b!259342))

(declare-fun m!274907 () Bool)

(assert (=> d!62273 m!274907))

(declare-fun m!274909 () Bool)

(assert (=> d!62273 m!274909))

(declare-fun m!274911 () Bool)

(assert (=> d!62273 m!274911))

(declare-fun m!274913 () Bool)

(assert (=> d!62273 m!274913))

(declare-fun m!274915 () Bool)

(assert (=> b!259341 m!274915))

(declare-fun m!274917 () Bool)

(assert (=> b!259342 m!274917))

(assert (=> b!259072 d!62273))

(declare-fun d!62275 () Bool)

(assert (=> d!62275 (= (apply!256 lt!130505 lt!130515) (get!3063 (getValueByKey!314 (toList!1941 lt!130505) lt!130515)))))

(declare-fun bs!9135 () Bool)

(assert (= bs!9135 d!62275))

(declare-fun m!274919 () Bool)

(assert (=> bs!9135 m!274919))

(assert (=> bs!9135 m!274919))

(declare-fun m!274921 () Bool)

(assert (=> bs!9135 m!274921))

(assert (=> b!259072 d!62275))

(declare-fun d!62277 () Bool)

(assert (=> d!62277 (= (apply!256 lt!130506 lt!130513) (get!3063 (getValueByKey!314 (toList!1941 lt!130506) lt!130513)))))

(declare-fun bs!9136 () Bool)

(assert (= bs!9136 d!62277))

(declare-fun m!274923 () Bool)

(assert (=> bs!9136 m!274923))

(assert (=> bs!9136 m!274923))

(declare-fun m!274925 () Bool)

(assert (=> bs!9136 m!274925))

(assert (=> b!259072 d!62277))

(declare-fun d!62279 () Bool)

(declare-fun e!168084 () Bool)

(assert (=> d!62279 e!168084))

(declare-fun res!126799 () Bool)

(assert (=> d!62279 (=> res!126799 e!168084)))

(declare-fun lt!130636 () Bool)

(assert (=> d!62279 (= res!126799 (not lt!130636))))

(declare-fun lt!130637 () Bool)

(assert (=> d!62279 (= lt!130636 lt!130637)))

(declare-fun lt!130638 () Unit!8045)

(declare-fun e!168083 () Unit!8045)

(assert (=> d!62279 (= lt!130638 e!168083)))

(declare-fun c!44005 () Bool)

(assert (=> d!62279 (= c!44005 lt!130637)))

(assert (=> d!62279 (= lt!130637 (containsKey!306 (toList!1941 (+!695 lt!130514 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504)))) lt!130500))))

(assert (=> d!62279 (= (contains!1882 (+!695 lt!130514 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504))) lt!130500) lt!130636)))

(declare-fun b!259343 () Bool)

(declare-fun lt!130635 () Unit!8045)

(assert (=> b!259343 (= e!168083 lt!130635)))

(assert (=> b!259343 (= lt!130635 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 (+!695 lt!130514 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504)))) lt!130500))))

(assert (=> b!259343 (isDefined!255 (getValueByKey!314 (toList!1941 (+!695 lt!130514 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504)))) lt!130500))))

(declare-fun b!259344 () Bool)

(declare-fun Unit!8062 () Unit!8045)

(assert (=> b!259344 (= e!168083 Unit!8062)))

(declare-fun b!259345 () Bool)

(assert (=> b!259345 (= e!168084 (isDefined!255 (getValueByKey!314 (toList!1941 (+!695 lt!130514 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504)))) lt!130500)))))

(assert (= (and d!62279 c!44005) b!259343))

(assert (= (and d!62279 (not c!44005)) b!259344))

(assert (= (and d!62279 (not res!126799)) b!259345))

(declare-fun m!274927 () Bool)

(assert (=> d!62279 m!274927))

(declare-fun m!274929 () Bool)

(assert (=> b!259343 m!274929))

(declare-fun m!274931 () Bool)

(assert (=> b!259343 m!274931))

(assert (=> b!259343 m!274931))

(declare-fun m!274933 () Bool)

(assert (=> b!259343 m!274933))

(assert (=> b!259345 m!274931))

(assert (=> b!259345 m!274931))

(assert (=> b!259345 m!274933))

(assert (=> b!259072 d!62279))

(declare-fun d!62281 () Bool)

(declare-fun e!168085 () Bool)

(assert (=> d!62281 e!168085))

(declare-fun res!126801 () Bool)

(assert (=> d!62281 (=> (not res!126801) (not e!168085))))

(declare-fun lt!130640 () ListLongMap!3851)

(assert (=> d!62281 (= res!126801 (contains!1882 lt!130640 (_1!2480 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504)))))))

(declare-fun lt!130639 () List!3817)

(assert (=> d!62281 (= lt!130640 (ListLongMap!3852 lt!130639))))

(declare-fun lt!130641 () Unit!8045)

(declare-fun lt!130642 () Unit!8045)

(assert (=> d!62281 (= lt!130641 lt!130642)))

(assert (=> d!62281 (= (getValueByKey!314 lt!130639 (_1!2480 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62281 (= lt!130642 (lemmaContainsTupThenGetReturnValue!170 lt!130639 (_1!2480 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62281 (= lt!130639 (insertStrictlySorted!173 (toList!1941 lt!130514) (_1!2480 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62281 (= (+!695 lt!130514 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504))) lt!130640)))

(declare-fun b!259346 () Bool)

(declare-fun res!126800 () Bool)

(assert (=> b!259346 (=> (not res!126800) (not e!168085))))

(assert (=> b!259346 (= res!126800 (= (getValueByKey!314 (toList!1941 lt!130640) (_1!2480 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504))))))))

(declare-fun b!259347 () Bool)

(assert (=> b!259347 (= e!168085 (contains!1884 (toList!1941 lt!130640) (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504))))))

(assert (= (and d!62281 res!126801) b!259346))

(assert (= (and b!259346 res!126800) b!259347))

(declare-fun m!274935 () Bool)

(assert (=> d!62281 m!274935))

(declare-fun m!274937 () Bool)

(assert (=> d!62281 m!274937))

(declare-fun m!274939 () Bool)

(assert (=> d!62281 m!274939))

(declare-fun m!274941 () Bool)

(assert (=> d!62281 m!274941))

(declare-fun m!274943 () Bool)

(assert (=> b!259346 m!274943))

(declare-fun m!274945 () Bool)

(assert (=> b!259347 m!274945))

(assert (=> b!259072 d!62281))

(declare-fun d!62283 () Bool)

(assert (=> d!62283 (contains!1882 (+!695 lt!130514 (tuple2!4939 lt!130504 (zeroValue!4615 thiss!1504))) lt!130500)))

(declare-fun lt!130645 () Unit!8045)

(declare-fun choose!1259 (ListLongMap!3851 (_ BitVec 64) V!8459 (_ BitVec 64)) Unit!8045)

(assert (=> d!62283 (= lt!130645 (choose!1259 lt!130514 lt!130504 (zeroValue!4615 thiss!1504) lt!130500))))

(assert (=> d!62283 (contains!1882 lt!130514 lt!130500)))

(assert (=> d!62283 (= (addStillContains!232 lt!130514 lt!130504 (zeroValue!4615 thiss!1504) lt!130500) lt!130645)))

(declare-fun bs!9137 () Bool)

(assert (= bs!9137 d!62283))

(assert (=> bs!9137 m!274605))

(assert (=> bs!9137 m!274605))

(assert (=> bs!9137 m!274607))

(declare-fun m!274947 () Bool)

(assert (=> bs!9137 m!274947))

(declare-fun m!274949 () Bool)

(assert (=> bs!9137 m!274949))

(assert (=> b!259072 d!62283))

(declare-fun d!62285 () Bool)

(assert (=> d!62285 (= (apply!256 (+!695 lt!130506 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504))) lt!130513) (apply!256 lt!130506 lt!130513))))

(declare-fun lt!130646 () Unit!8045)

(assert (=> d!62285 (= lt!130646 (choose!1258 lt!130506 lt!130510 (minValue!4615 thiss!1504) lt!130513))))

(declare-fun e!168086 () Bool)

(assert (=> d!62285 e!168086))

(declare-fun res!126802 () Bool)

(assert (=> d!62285 (=> (not res!126802) (not e!168086))))

(assert (=> d!62285 (= res!126802 (contains!1882 lt!130506 lt!130513))))

(assert (=> d!62285 (= (addApplyDifferent!232 lt!130506 lt!130510 (minValue!4615 thiss!1504) lt!130513) lt!130646)))

(declare-fun b!259349 () Bool)

(assert (=> b!259349 (= e!168086 (not (= lt!130513 lt!130510)))))

(assert (= (and d!62285 res!126802) b!259349))

(declare-fun m!274951 () Bool)

(assert (=> d!62285 m!274951))

(assert (=> d!62285 m!274603))

(declare-fun m!274953 () Bool)

(assert (=> d!62285 m!274953))

(assert (=> d!62285 m!274609))

(assert (=> d!62285 m!274603))

(assert (=> d!62285 m!274633))

(assert (=> b!259072 d!62285))

(declare-fun d!62287 () Bool)

(declare-fun e!168087 () Bool)

(assert (=> d!62287 e!168087))

(declare-fun res!126804 () Bool)

(assert (=> d!62287 (=> (not res!126804) (not e!168087))))

(declare-fun lt!130648 () ListLongMap!3851)

(assert (=> d!62287 (= res!126804 (contains!1882 lt!130648 (_1!2480 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504)))))))

(declare-fun lt!130647 () List!3817)

(assert (=> d!62287 (= lt!130648 (ListLongMap!3852 lt!130647))))

(declare-fun lt!130649 () Unit!8045)

(declare-fun lt!130650 () Unit!8045)

(assert (=> d!62287 (= lt!130649 lt!130650)))

(assert (=> d!62287 (= (getValueByKey!314 lt!130647 (_1!2480 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62287 (= lt!130650 (lemmaContainsTupThenGetReturnValue!170 lt!130647 (_1!2480 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62287 (= lt!130647 (insertStrictlySorted!173 (toList!1941 lt!130505) (_1!2480 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62287 (= (+!695 lt!130505 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504))) lt!130648)))

(declare-fun b!259350 () Bool)

(declare-fun res!126803 () Bool)

(assert (=> b!259350 (=> (not res!126803) (not e!168087))))

(assert (=> b!259350 (= res!126803 (= (getValueByKey!314 (toList!1941 lt!130648) (_1!2480 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504))))))))

(declare-fun b!259351 () Bool)

(assert (=> b!259351 (= e!168087 (contains!1884 (toList!1941 lt!130648) (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504))))))

(assert (= (and d!62287 res!126804) b!259350))

(assert (= (and b!259350 res!126803) b!259351))

(declare-fun m!274955 () Bool)

(assert (=> d!62287 m!274955))

(declare-fun m!274957 () Bool)

(assert (=> d!62287 m!274957))

(declare-fun m!274959 () Bool)

(assert (=> d!62287 m!274959))

(declare-fun m!274961 () Bool)

(assert (=> d!62287 m!274961))

(declare-fun m!274963 () Bool)

(assert (=> b!259350 m!274963))

(declare-fun m!274965 () Bool)

(assert (=> b!259351 m!274965))

(assert (=> b!259072 d!62287))

(assert (=> b!259072 d!62215))

(declare-fun d!62289 () Bool)

(assert (=> d!62289 (= (apply!256 (+!695 lt!130505 (tuple2!4939 lt!130508 (zeroValue!4615 thiss!1504))) lt!130515) (apply!256 lt!130505 lt!130515))))

(declare-fun lt!130651 () Unit!8045)

(assert (=> d!62289 (= lt!130651 (choose!1258 lt!130505 lt!130508 (zeroValue!4615 thiss!1504) lt!130515))))

(declare-fun e!168088 () Bool)

(assert (=> d!62289 e!168088))

(declare-fun res!126805 () Bool)

(assert (=> d!62289 (=> (not res!126805) (not e!168088))))

(assert (=> d!62289 (= res!126805 (contains!1882 lt!130505 lt!130515))))

(assert (=> d!62289 (= (addApplyDifferent!232 lt!130505 lt!130508 (zeroValue!4615 thiss!1504) lt!130515) lt!130651)))

(declare-fun b!259352 () Bool)

(assert (=> b!259352 (= e!168088 (not (= lt!130515 lt!130508)))))

(assert (= (and d!62289 res!126805) b!259352))

(declare-fun m!274967 () Bool)

(assert (=> d!62289 m!274967))

(assert (=> d!62289 m!274611))

(declare-fun m!274969 () Bool)

(assert (=> d!62289 m!274969))

(assert (=> d!62289 m!274619))

(assert (=> d!62289 m!274611))

(assert (=> d!62289 m!274625))

(assert (=> b!259072 d!62289))

(declare-fun d!62291 () Bool)

(assert (=> d!62291 (= (apply!256 (+!695 lt!130506 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504))) lt!130513) (get!3063 (getValueByKey!314 (toList!1941 (+!695 lt!130506 (tuple2!4939 lt!130510 (minValue!4615 thiss!1504)))) lt!130513)))))

(declare-fun bs!9138 () Bool)

(assert (= bs!9138 d!62291))

(declare-fun m!274971 () Bool)

(assert (=> bs!9138 m!274971))

(assert (=> bs!9138 m!274971))

(declare-fun m!274973 () Bool)

(assert (=> bs!9138 m!274973))

(assert (=> b!259072 d!62291))

(declare-fun d!62293 () Bool)

(assert (=> d!62293 (= (validKeyInArray!0 (select (arr!5951 lt!130324) index!297)) (and (not (= (select (arr!5951 lt!130324) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5951 lt!130324) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259040 d!62293))

(declare-fun d!62295 () Bool)

(assert (=> d!62295 (arrayContainsKey!0 lt!130324 lt!130406 #b00000000000000000000000000000000)))

(declare-fun lt!130652 () Unit!8045)

(assert (=> d!62295 (= lt!130652 (choose!13 lt!130324 lt!130406 #b00000000000000000000000000000000))))

(assert (=> d!62295 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62295 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130324 lt!130406 #b00000000000000000000000000000000) lt!130652)))

(declare-fun bs!9139 () Bool)

(assert (= bs!9139 d!62295))

(assert (=> bs!9139 m!274499))

(declare-fun m!274975 () Bool)

(assert (=> bs!9139 m!274975))

(assert (=> b!258967 d!62295))

(declare-fun d!62297 () Bool)

(declare-fun res!126806 () Bool)

(declare-fun e!168089 () Bool)

(assert (=> d!62297 (=> res!126806 e!168089)))

(assert (=> d!62297 (= res!126806 (= (select (arr!5951 lt!130324) #b00000000000000000000000000000000) lt!130406))))

(assert (=> d!62297 (= (arrayContainsKey!0 lt!130324 lt!130406 #b00000000000000000000000000000000) e!168089)))

(declare-fun b!259353 () Bool)

(declare-fun e!168090 () Bool)

(assert (=> b!259353 (= e!168089 e!168090)))

(declare-fun res!126807 () Bool)

(assert (=> b!259353 (=> (not res!126807) (not e!168090))))

(assert (=> b!259353 (= res!126807 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 lt!130324)))))

(declare-fun b!259354 () Bool)

(assert (=> b!259354 (= e!168090 (arrayContainsKey!0 lt!130324 lt!130406 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62297 (not res!126806)) b!259353))

(assert (= (and b!259353 res!126807) b!259354))

(assert (=> d!62297 m!274483))

(declare-fun m!274977 () Bool)

(assert (=> b!259354 m!274977))

(assert (=> b!258967 d!62297))

(declare-fun b!259355 () Bool)

(declare-fun e!168093 () SeekEntryResult!1177)

(declare-fun lt!130654 () SeekEntryResult!1177)

(assert (=> b!259355 (= e!168093 (Found!1177 (index!6880 lt!130654)))))

(declare-fun b!259356 () Bool)

(declare-fun e!168092 () SeekEntryResult!1177)

(assert (=> b!259356 (= e!168092 Undefined!1177)))

(declare-fun d!62299 () Bool)

(declare-fun lt!130655 () SeekEntryResult!1177)

(assert (=> d!62299 (and (or ((_ is Undefined!1177) lt!130655) (not ((_ is Found!1177) lt!130655)) (and (bvsge (index!6879 lt!130655) #b00000000000000000000000000000000) (bvslt (index!6879 lt!130655) (size!6299 lt!130324)))) (or ((_ is Undefined!1177) lt!130655) ((_ is Found!1177) lt!130655) (not ((_ is MissingZero!1177) lt!130655)) (and (bvsge (index!6878 lt!130655) #b00000000000000000000000000000000) (bvslt (index!6878 lt!130655) (size!6299 lt!130324)))) (or ((_ is Undefined!1177) lt!130655) ((_ is Found!1177) lt!130655) ((_ is MissingZero!1177) lt!130655) (not ((_ is MissingVacant!1177) lt!130655)) (and (bvsge (index!6881 lt!130655) #b00000000000000000000000000000000) (bvslt (index!6881 lt!130655) (size!6299 lt!130324)))) (or ((_ is Undefined!1177) lt!130655) (ite ((_ is Found!1177) lt!130655) (= (select (arr!5951 lt!130324) (index!6879 lt!130655)) (select (arr!5951 lt!130324) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1177) lt!130655) (= (select (arr!5951 lt!130324) (index!6878 lt!130655)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1177) lt!130655) (= (select (arr!5951 lt!130324) (index!6881 lt!130655)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62299 (= lt!130655 e!168092)))

(declare-fun c!44006 () Bool)

(assert (=> d!62299 (= c!44006 (and ((_ is Intermediate!1177) lt!130654) (undefined!1989 lt!130654)))))

(assert (=> d!62299 (= lt!130654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000) (mask!11082 thiss!1504)) (select (arr!5951 lt!130324) #b00000000000000000000000000000000) lt!130324 (mask!11082 thiss!1504)))))

(assert (=> d!62299 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62299 (= (seekEntryOrOpen!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000) lt!130324 (mask!11082 thiss!1504)) lt!130655)))

(declare-fun b!259357 () Bool)

(assert (=> b!259357 (= e!168092 e!168093)))

(declare-fun lt!130653 () (_ BitVec 64))

(assert (=> b!259357 (= lt!130653 (select (arr!5951 lt!130324) (index!6880 lt!130654)))))

(declare-fun c!44008 () Bool)

(assert (=> b!259357 (= c!44008 (= lt!130653 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun b!259358 () Bool)

(declare-fun e!168091 () SeekEntryResult!1177)

(assert (=> b!259358 (= e!168091 (MissingZero!1177 (index!6880 lt!130654)))))

(declare-fun b!259359 () Bool)

(declare-fun c!44007 () Bool)

(assert (=> b!259359 (= c!44007 (= lt!130653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259359 (= e!168093 e!168091)))

(declare-fun b!259360 () Bool)

(assert (=> b!259360 (= e!168091 (seekKeyOrZeroReturnVacant!0 (x!25071 lt!130654) (index!6880 lt!130654) (index!6880 lt!130654) (select (arr!5951 lt!130324) #b00000000000000000000000000000000) lt!130324 (mask!11082 thiss!1504)))))

(assert (= (and d!62299 c!44006) b!259356))

(assert (= (and d!62299 (not c!44006)) b!259357))

(assert (= (and b!259357 c!44008) b!259355))

(assert (= (and b!259357 (not c!44008)) b!259359))

(assert (= (and b!259359 c!44007) b!259358))

(assert (= (and b!259359 (not c!44007)) b!259360))

(declare-fun m!274979 () Bool)

(assert (=> d!62299 m!274979))

(assert (=> d!62299 m!274483))

(declare-fun m!274981 () Bool)

(assert (=> d!62299 m!274981))

(declare-fun m!274983 () Bool)

(assert (=> d!62299 m!274983))

(assert (=> d!62299 m!274483))

(assert (=> d!62299 m!274979))

(assert (=> d!62299 m!274323))

(declare-fun m!274985 () Bool)

(assert (=> d!62299 m!274985))

(declare-fun m!274987 () Bool)

(assert (=> d!62299 m!274987))

(declare-fun m!274989 () Bool)

(assert (=> b!259357 m!274989))

(assert (=> b!259360 m!274483))

(declare-fun m!274991 () Bool)

(assert (=> b!259360 m!274991))

(assert (=> b!258967 d!62299))

(declare-fun b!259361 () Bool)

(declare-fun e!168094 () (_ BitVec 32))

(declare-fun call!24695 () (_ BitVec 32))

(assert (=> b!259361 (= e!168094 (bvadd #b00000000000000000000000000000001 call!24695))))

(declare-fun d!62301 () Bool)

(declare-fun lt!130656 () (_ BitVec 32))

(assert (=> d!62301 (and (bvsge lt!130656 #b00000000000000000000000000000000) (bvsle lt!130656 (bvsub (size!6299 lt!130324) index!297)))))

(declare-fun e!168095 () (_ BitVec 32))

(assert (=> d!62301 (= lt!130656 e!168095)))

(declare-fun c!44010 () Bool)

(assert (=> d!62301 (= c!44010 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!62301 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6299 lt!130324)))))

(assert (=> d!62301 (= (arrayCountValidKeys!0 lt!130324 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!130656)))

(declare-fun b!259362 () Bool)

(assert (=> b!259362 (= e!168094 call!24695)))

(declare-fun b!259363 () Bool)

(assert (=> b!259363 (= e!168095 e!168094)))

(declare-fun c!44009 () Bool)

(assert (=> b!259363 (= c!44009 (validKeyInArray!0 (select (arr!5951 lt!130324) index!297)))))

(declare-fun bm!24692 () Bool)

(assert (=> bm!24692 (= call!24695 (arrayCountValidKeys!0 lt!130324 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun b!259364 () Bool)

(assert (=> b!259364 (= e!168095 #b00000000000000000000000000000000)))

(assert (= (and d!62301 c!44010) b!259364))

(assert (= (and d!62301 (not c!44010)) b!259363))

(assert (= (and b!259363 c!44009) b!259361))

(assert (= (and b!259363 (not c!44009)) b!259362))

(assert (= (or b!259361 b!259362) bm!24692))

(assert (=> b!259363 m!274563))

(assert (=> b!259363 m!274563))

(assert (=> b!259363 m!274565))

(declare-fun m!274993 () Bool)

(assert (=> bm!24692 m!274993))

(assert (=> d!62155 d!62301))

(declare-fun d!62303 () Bool)

(assert (=> d!62303 (= (arrayCountValidKeys!0 lt!130324 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!62303 true))

(declare-fun _$85!24 () Unit!8045)

(assert (=> d!62303 (= (choose!2 lt!130324 index!297) _$85!24)))

(declare-fun bs!9140 () Bool)

(assert (= bs!9140 d!62303))

(assert (=> bs!9140 m!274559))

(assert (=> d!62155 d!62303))

(declare-fun b!259365 () Bool)

(declare-fun e!168096 () (_ BitVec 32))

(declare-fun call!24696 () (_ BitVec 32))

(assert (=> b!259365 (= e!168096 (bvadd #b00000000000000000000000000000001 call!24696))))

(declare-fun d!62305 () Bool)

(declare-fun lt!130657 () (_ BitVec 32))

(assert (=> d!62305 (and (bvsge lt!130657 #b00000000000000000000000000000000) (bvsle lt!130657 (bvsub (size!6299 (_keys!6948 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!168097 () (_ BitVec 32))

(assert (=> d!62305 (= lt!130657 e!168097)))

(declare-fun c!44012 () Bool)

(assert (=> d!62305 (= c!44012 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> d!62305 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6299 (_keys!6948 thiss!1504)) (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> d!62305 (= (arrayCountValidKeys!0 (_keys!6948 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))) lt!130657)))

(declare-fun b!259366 () Bool)

(assert (=> b!259366 (= e!168096 call!24696)))

(declare-fun b!259367 () Bool)

(assert (=> b!259367 (= e!168097 e!168096)))

(declare-fun c!44011 () Bool)

(assert (=> b!259367 (= c!44011 (validKeyInArray!0 (select (arr!5951 (_keys!6948 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24693 () Bool)

(assert (=> bm!24693 (= call!24696 (arrayCountValidKeys!0 (_keys!6948 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!259368 () Bool)

(assert (=> b!259368 (= e!168097 #b00000000000000000000000000000000)))

(assert (= (and d!62305 c!44012) b!259368))

(assert (= (and d!62305 (not c!44012)) b!259367))

(assert (= (and b!259367 c!44011) b!259365))

(assert (= (and b!259367 (not c!44011)) b!259366))

(assert (= (or b!259365 b!259366) bm!24693))

(declare-fun m!274995 () Bool)

(assert (=> b!259367 m!274995))

(assert (=> b!259367 m!274995))

(declare-fun m!274997 () Bool)

(assert (=> b!259367 m!274997))

(declare-fun m!274999 () Bool)

(assert (=> bm!24693 m!274999))

(assert (=> bm!24629 d!62305))

(declare-fun d!62307 () Bool)

(declare-fun res!126808 () Bool)

(declare-fun e!168098 () Bool)

(assert (=> d!62307 (=> res!126808 e!168098)))

(assert (=> d!62307 (= res!126808 (= (select (arr!5951 lt!130324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62307 (= (arrayContainsKey!0 lt!130324 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!168098)))

(declare-fun b!259369 () Bool)

(declare-fun e!168099 () Bool)

(assert (=> b!259369 (= e!168098 e!168099)))

(declare-fun res!126809 () Bool)

(assert (=> b!259369 (=> (not res!126809) (not e!168099))))

(assert (=> b!259369 (= res!126809 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6299 lt!130324)))))

(declare-fun b!259370 () Bool)

(assert (=> b!259370 (= e!168099 (arrayContainsKey!0 lt!130324 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62307 (not res!126808)) b!259369))

(assert (= (and b!259369 res!126809) b!259370))

(assert (=> d!62307 m!274781))

(declare-fun m!275001 () Bool)

(assert (=> b!259370 m!275001))

(assert (=> b!258939 d!62307))

(declare-fun b!259389 () Bool)

(declare-fun lt!130662 () SeekEntryResult!1177)

(assert (=> b!259389 (and (bvsge (index!6880 lt!130662) #b00000000000000000000000000000000) (bvslt (index!6880 lt!130662) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun res!126818 () Bool)

(assert (=> b!259389 (= res!126818 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6880 lt!130662)) key!932))))

(declare-fun e!168110 () Bool)

(assert (=> b!259389 (=> res!126818 e!168110)))

(declare-fun e!168111 () Bool)

(assert (=> b!259389 (= e!168111 e!168110)))

(declare-fun b!259390 () Bool)

(declare-fun e!168112 () Bool)

(assert (=> b!259390 (= e!168112 e!168111)))

(declare-fun res!126817 () Bool)

(assert (=> b!259390 (= res!126817 (and ((_ is Intermediate!1177) lt!130662) (not (undefined!1989 lt!130662)) (bvslt (x!25071 lt!130662) #b01111111111111111111111111111110) (bvsge (x!25071 lt!130662) #b00000000000000000000000000000000) (bvsge (x!25071 lt!130662) #b00000000000000000000000000000000)))))

(assert (=> b!259390 (=> (not res!126817) (not e!168111))))

(declare-fun b!259391 () Bool)

(declare-fun e!168113 () SeekEntryResult!1177)

(assert (=> b!259391 (= e!168113 (Intermediate!1177 true (toIndex!0 key!932 (mask!11082 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!259392 () Bool)

(assert (=> b!259392 (and (bvsge (index!6880 lt!130662) #b00000000000000000000000000000000) (bvslt (index!6880 lt!130662) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun res!126816 () Bool)

(assert (=> b!259392 (= res!126816 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6880 lt!130662)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259392 (=> res!126816 e!168110)))

(declare-fun b!259393 () Bool)

(assert (=> b!259393 (and (bvsge (index!6880 lt!130662) #b00000000000000000000000000000000) (bvslt (index!6880 lt!130662) (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> b!259393 (= e!168110 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6880 lt!130662)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!62309 () Bool)

(assert (=> d!62309 e!168112))

(declare-fun c!44021 () Bool)

(assert (=> d!62309 (= c!44021 (and ((_ is Intermediate!1177) lt!130662) (undefined!1989 lt!130662)))))

(assert (=> d!62309 (= lt!130662 e!168113)))

(declare-fun c!44019 () Bool)

(assert (=> d!62309 (= c!44019 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!130663 () (_ BitVec 64))

(assert (=> d!62309 (= lt!130663 (select (arr!5951 (_keys!6948 thiss!1504)) (toIndex!0 key!932 (mask!11082 thiss!1504))))))

(assert (=> d!62309 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11082 thiss!1504)) key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)) lt!130662)))

(declare-fun b!259394 () Bool)

(declare-fun e!168114 () SeekEntryResult!1177)

(assert (=> b!259394 (= e!168113 e!168114)))

(declare-fun c!44020 () Bool)

(assert (=> b!259394 (= c!44020 (or (= lt!130663 key!932) (= (bvadd lt!130663 lt!130663) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259395 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!259395 (= e!168114 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11082 thiss!1504)) #b00000000000000000000000000000000 (mask!11082 thiss!1504)) key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(declare-fun b!259396 () Bool)

(assert (=> b!259396 (= e!168114 (Intermediate!1177 false (toIndex!0 key!932 (mask!11082 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!259397 () Bool)

(assert (=> b!259397 (= e!168112 (bvsge (x!25071 lt!130662) #b01111111111111111111111111111110))))

(assert (= (and d!62309 c!44019) b!259391))

(assert (= (and d!62309 (not c!44019)) b!259394))

(assert (= (and b!259394 c!44020) b!259396))

(assert (= (and b!259394 (not c!44020)) b!259395))

(assert (= (and d!62309 c!44021) b!259397))

(assert (= (and d!62309 (not c!44021)) b!259390))

(assert (= (and b!259390 res!126817) b!259389))

(assert (= (and b!259389 (not res!126818)) b!259392))

(assert (= (and b!259392 (not res!126816)) b!259393))

(declare-fun m!275003 () Bool)

(assert (=> b!259392 m!275003))

(assert (=> b!259389 m!275003))

(assert (=> d!62309 m!274663))

(declare-fun m!275005 () Bool)

(assert (=> d!62309 m!275005))

(assert (=> d!62309 m!274323))

(assert (=> b!259395 m!274663))

(declare-fun m!275007 () Bool)

(assert (=> b!259395 m!275007))

(assert (=> b!259395 m!275007))

(declare-fun m!275009 () Bool)

(assert (=> b!259395 m!275009))

(assert (=> b!259393 m!275003))

(assert (=> d!62183 d!62309))

(declare-fun d!62311 () Bool)

(declare-fun lt!130669 () (_ BitVec 32))

(declare-fun lt!130668 () (_ BitVec 32))

(assert (=> d!62311 (= lt!130669 (bvmul (bvxor lt!130668 (bvlshr lt!130668 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!62311 (= lt!130668 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!62311 (and (bvsge (mask!11082 thiss!1504) #b00000000000000000000000000000000) (let ((res!126819 (let ((h!4479 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25089 (bvmul (bvxor h!4479 (bvlshr h!4479 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25089 (bvlshr x!25089 #b00000000000000000000000000001101)) (mask!11082 thiss!1504)))))) (and (bvslt res!126819 (bvadd (mask!11082 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!126819 #b00000000000000000000000000000000))))))

(assert (=> d!62311 (= (toIndex!0 key!932 (mask!11082 thiss!1504)) (bvand (bvxor lt!130669 (bvlshr lt!130669 #b00000000000000000000000000001101)) (mask!11082 thiss!1504)))))

(assert (=> d!62183 d!62311))

(assert (=> d!62183 d!62163))

(declare-fun d!62313 () Bool)

(assert (=> d!62313 (= (apply!256 lt!130521 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3063 (getValueByKey!314 (toList!1941 lt!130521) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9141 () Bool)

(assert (= bs!9141 d!62313))

(assert (=> bs!9141 m!274793))

(assert (=> bs!9141 m!274793))

(declare-fun m!275011 () Bool)

(assert (=> bs!9141 m!275011))

(assert (=> b!259074 d!62313))

(declare-fun d!62315 () Bool)

(assert (=> d!62315 (= (apply!256 (+!695 lt!130459 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504))) lt!130466) (apply!256 lt!130459 lt!130466))))

(declare-fun lt!130670 () Unit!8045)

(assert (=> d!62315 (= lt!130670 (choose!1258 lt!130459 lt!130463 (minValue!4615 thiss!1504) lt!130466))))

(declare-fun e!168115 () Bool)

(assert (=> d!62315 e!168115))

(declare-fun res!126820 () Bool)

(assert (=> d!62315 (=> (not res!126820) (not e!168115))))

(assert (=> d!62315 (= res!126820 (contains!1882 lt!130459 lt!130466))))

(assert (=> d!62315 (= (addApplyDifferent!232 lt!130459 lt!130463 (minValue!4615 thiss!1504) lt!130466) lt!130670)))

(declare-fun b!259398 () Bool)

(assert (=> b!259398 (= e!168115 (not (= lt!130466 lt!130463)))))

(assert (= (and d!62315 res!126820) b!259398))

(declare-fun m!275013 () Bool)

(assert (=> d!62315 m!275013))

(assert (=> d!62315 m!274521))

(declare-fun m!275015 () Bool)

(assert (=> d!62315 m!275015))

(assert (=> d!62315 m!274527))

(assert (=> d!62315 m!274521))

(assert (=> d!62315 m!274551))

(assert (=> b!259022 d!62315))

(declare-fun d!62317 () Bool)

(assert (=> d!62317 (contains!1882 (+!695 lt!130467 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504))) lt!130453)))

(declare-fun lt!130671 () Unit!8045)

(assert (=> d!62317 (= lt!130671 (choose!1259 lt!130467 lt!130457 (zeroValue!4615 thiss!1504) lt!130453))))

(assert (=> d!62317 (contains!1882 lt!130467 lt!130453)))

(assert (=> d!62317 (= (addStillContains!232 lt!130467 lt!130457 (zeroValue!4615 thiss!1504) lt!130453) lt!130671)))

(declare-fun bs!9142 () Bool)

(assert (= bs!9142 d!62317))

(assert (=> bs!9142 m!274523))

(assert (=> bs!9142 m!274523))

(assert (=> bs!9142 m!274525))

(declare-fun m!275017 () Bool)

(assert (=> bs!9142 m!275017))

(declare-fun m!275019 () Bool)

(assert (=> bs!9142 m!275019))

(assert (=> b!259022 d!62317))

(declare-fun d!62319 () Bool)

(assert (=> d!62319 (= (apply!256 lt!130455 lt!130460) (get!3063 (getValueByKey!314 (toList!1941 lt!130455) lt!130460)))))

(declare-fun bs!9143 () Bool)

(assert (= bs!9143 d!62319))

(declare-fun m!275021 () Bool)

(assert (=> bs!9143 m!275021))

(assert (=> bs!9143 m!275021))

(declare-fun m!275023 () Bool)

(assert (=> bs!9143 m!275023))

(assert (=> b!259022 d!62319))

(declare-fun d!62321 () Bool)

(declare-fun e!168117 () Bool)

(assert (=> d!62321 e!168117))

(declare-fun res!126821 () Bool)

(assert (=> d!62321 (=> res!126821 e!168117)))

(declare-fun lt!130673 () Bool)

(assert (=> d!62321 (= res!126821 (not lt!130673))))

(declare-fun lt!130674 () Bool)

(assert (=> d!62321 (= lt!130673 lt!130674)))

(declare-fun lt!130675 () Unit!8045)

(declare-fun e!168116 () Unit!8045)

(assert (=> d!62321 (= lt!130675 e!168116)))

(declare-fun c!44022 () Bool)

(assert (=> d!62321 (= c!44022 lt!130674)))

(assert (=> d!62321 (= lt!130674 (containsKey!306 (toList!1941 (+!695 lt!130467 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504)))) lt!130453))))

(assert (=> d!62321 (= (contains!1882 (+!695 lt!130467 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504))) lt!130453) lt!130673)))

(declare-fun b!259399 () Bool)

(declare-fun lt!130672 () Unit!8045)

(assert (=> b!259399 (= e!168116 lt!130672)))

(assert (=> b!259399 (= lt!130672 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 (+!695 lt!130467 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504)))) lt!130453))))

(assert (=> b!259399 (isDefined!255 (getValueByKey!314 (toList!1941 (+!695 lt!130467 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504)))) lt!130453))))

(declare-fun b!259400 () Bool)

(declare-fun Unit!8063 () Unit!8045)

(assert (=> b!259400 (= e!168116 Unit!8063)))

(declare-fun b!259401 () Bool)

(assert (=> b!259401 (= e!168117 (isDefined!255 (getValueByKey!314 (toList!1941 (+!695 lt!130467 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504)))) lt!130453)))))

(assert (= (and d!62321 c!44022) b!259399))

(assert (= (and d!62321 (not c!44022)) b!259400))

(assert (= (and d!62321 (not res!126821)) b!259401))

(declare-fun m!275025 () Bool)

(assert (=> d!62321 m!275025))

(declare-fun m!275027 () Bool)

(assert (=> b!259399 m!275027))

(declare-fun m!275029 () Bool)

(assert (=> b!259399 m!275029))

(assert (=> b!259399 m!275029))

(declare-fun m!275031 () Bool)

(assert (=> b!259399 m!275031))

(assert (=> b!259401 m!275029))

(assert (=> b!259401 m!275029))

(assert (=> b!259401 m!275031))

(assert (=> b!259022 d!62321))

(declare-fun d!62323 () Bool)

(assert (=> d!62323 (= (apply!256 (+!695 lt!130458 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504))) lt!130468) (apply!256 lt!130458 lt!130468))))

(declare-fun lt!130676 () Unit!8045)

(assert (=> d!62323 (= lt!130676 (choose!1258 lt!130458 lt!130461 (zeroValue!4615 thiss!1504) lt!130468))))

(declare-fun e!168118 () Bool)

(assert (=> d!62323 e!168118))

(declare-fun res!126822 () Bool)

(assert (=> d!62323 (=> (not res!126822) (not e!168118))))

(assert (=> d!62323 (= res!126822 (contains!1882 lt!130458 lt!130468))))

(assert (=> d!62323 (= (addApplyDifferent!232 lt!130458 lt!130461 (zeroValue!4615 thiss!1504) lt!130468) lt!130676)))

(declare-fun b!259402 () Bool)

(assert (=> b!259402 (= e!168118 (not (= lt!130468 lt!130461)))))

(assert (= (and d!62323 res!126822) b!259402))

(declare-fun m!275033 () Bool)

(assert (=> d!62323 m!275033))

(assert (=> d!62323 m!274529))

(declare-fun m!275035 () Bool)

(assert (=> d!62323 m!275035))

(assert (=> d!62323 m!274537))

(assert (=> d!62323 m!274529))

(assert (=> d!62323 m!274543))

(assert (=> b!259022 d!62323))

(declare-fun d!62325 () Bool)

(assert (=> d!62325 (= (apply!256 lt!130458 lt!130468) (get!3063 (getValueByKey!314 (toList!1941 lt!130458) lt!130468)))))

(declare-fun bs!9144 () Bool)

(assert (= bs!9144 d!62325))

(declare-fun m!275037 () Bool)

(assert (=> bs!9144 m!275037))

(assert (=> bs!9144 m!275037))

(declare-fun m!275039 () Bool)

(assert (=> bs!9144 m!275039))

(assert (=> b!259022 d!62325))

(declare-fun d!62327 () Bool)

(assert (=> d!62327 (= (apply!256 (+!695 lt!130458 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504))) lt!130468) (get!3063 (getValueByKey!314 (toList!1941 (+!695 lt!130458 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504)))) lt!130468)))))

(declare-fun bs!9145 () Bool)

(assert (= bs!9145 d!62327))

(declare-fun m!275041 () Bool)

(assert (=> bs!9145 m!275041))

(assert (=> bs!9145 m!275041))

(declare-fun m!275043 () Bool)

(assert (=> bs!9145 m!275043))

(assert (=> b!259022 d!62327))

(declare-fun d!62329 () Bool)

(declare-fun e!168119 () Bool)

(assert (=> d!62329 e!168119))

(declare-fun res!126824 () Bool)

(assert (=> d!62329 (=> (not res!126824) (not e!168119))))

(declare-fun lt!130678 () ListLongMap!3851)

(assert (=> d!62329 (= res!126824 (contains!1882 lt!130678 (_1!2480 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504)))))))

(declare-fun lt!130677 () List!3817)

(assert (=> d!62329 (= lt!130678 (ListLongMap!3852 lt!130677))))

(declare-fun lt!130679 () Unit!8045)

(declare-fun lt!130680 () Unit!8045)

(assert (=> d!62329 (= lt!130679 lt!130680)))

(assert (=> d!62329 (= (getValueByKey!314 lt!130677 (_1!2480 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504)))))))

(assert (=> d!62329 (= lt!130680 (lemmaContainsTupThenGetReturnValue!170 lt!130677 (_1!2480 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504)))))))

(assert (=> d!62329 (= lt!130677 (insertStrictlySorted!173 (toList!1941 lt!130459) (_1!2480 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504)))))))

(assert (=> d!62329 (= (+!695 lt!130459 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504))) lt!130678)))

(declare-fun b!259403 () Bool)

(declare-fun res!126823 () Bool)

(assert (=> b!259403 (=> (not res!126823) (not e!168119))))

(assert (=> b!259403 (= res!126823 (= (getValueByKey!314 (toList!1941 lt!130678) (_1!2480 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504))))))))

(declare-fun b!259404 () Bool)

(assert (=> b!259404 (= e!168119 (contains!1884 (toList!1941 lt!130678) (tuple2!4939 lt!130463 (minValue!4615 thiss!1504))))))

(assert (= (and d!62329 res!126824) b!259403))

(assert (= (and b!259403 res!126823) b!259404))

(declare-fun m!275045 () Bool)

(assert (=> d!62329 m!275045))

(declare-fun m!275047 () Bool)

(assert (=> d!62329 m!275047))

(declare-fun m!275049 () Bool)

(assert (=> d!62329 m!275049))

(declare-fun m!275051 () Bool)

(assert (=> d!62329 m!275051))

(declare-fun m!275053 () Bool)

(assert (=> b!259403 m!275053))

(declare-fun m!275055 () Bool)

(assert (=> b!259404 m!275055))

(assert (=> b!259022 d!62329))

(declare-fun d!62331 () Bool)

(declare-fun e!168120 () Bool)

(assert (=> d!62331 e!168120))

(declare-fun res!126826 () Bool)

(assert (=> d!62331 (=> (not res!126826) (not e!168120))))

(declare-fun lt!130682 () ListLongMap!3851)

(assert (=> d!62331 (= res!126826 (contains!1882 lt!130682 (_1!2480 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504)))))))

(declare-fun lt!130681 () List!3817)

(assert (=> d!62331 (= lt!130682 (ListLongMap!3852 lt!130681))))

(declare-fun lt!130683 () Unit!8045)

(declare-fun lt!130684 () Unit!8045)

(assert (=> d!62331 (= lt!130683 lt!130684)))

(assert (=> d!62331 (= (getValueByKey!314 lt!130681 (_1!2480 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62331 (= lt!130684 (lemmaContainsTupThenGetReturnValue!170 lt!130681 (_1!2480 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62331 (= lt!130681 (insertStrictlySorted!173 (toList!1941 lt!130467) (_1!2480 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62331 (= (+!695 lt!130467 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504))) lt!130682)))

(declare-fun b!259405 () Bool)

(declare-fun res!126825 () Bool)

(assert (=> b!259405 (=> (not res!126825) (not e!168120))))

(assert (=> b!259405 (= res!126825 (= (getValueByKey!314 (toList!1941 lt!130682) (_1!2480 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504))))))))

(declare-fun b!259406 () Bool)

(assert (=> b!259406 (= e!168120 (contains!1884 (toList!1941 lt!130682) (tuple2!4939 lt!130457 (zeroValue!4615 thiss!1504))))))

(assert (= (and d!62331 res!126826) b!259405))

(assert (= (and b!259405 res!126825) b!259406))

(declare-fun m!275057 () Bool)

(assert (=> d!62331 m!275057))

(declare-fun m!275059 () Bool)

(assert (=> d!62331 m!275059))

(declare-fun m!275061 () Bool)

(assert (=> d!62331 m!275061))

(declare-fun m!275063 () Bool)

(assert (=> d!62331 m!275063))

(declare-fun m!275065 () Bool)

(assert (=> b!259405 m!275065))

(declare-fun m!275067 () Bool)

(assert (=> b!259406 m!275067))

(assert (=> b!259022 d!62331))

(declare-fun d!62333 () Bool)

(assert (=> d!62333 (= (apply!256 (+!695 lt!130459 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504))) lt!130466) (get!3063 (getValueByKey!314 (toList!1941 (+!695 lt!130459 (tuple2!4939 lt!130463 (minValue!4615 thiss!1504)))) lt!130466)))))

(declare-fun bs!9146 () Bool)

(assert (= bs!9146 d!62333))

(declare-fun m!275069 () Bool)

(assert (=> bs!9146 m!275069))

(assert (=> bs!9146 m!275069))

(declare-fun m!275071 () Bool)

(assert (=> bs!9146 m!275071))

(assert (=> b!259022 d!62333))

(declare-fun d!62335 () Bool)

(assert (=> d!62335 (= (apply!256 lt!130459 lt!130466) (get!3063 (getValueByKey!314 (toList!1941 lt!130459) lt!130466)))))

(declare-fun bs!9147 () Bool)

(assert (= bs!9147 d!62335))

(declare-fun m!275073 () Bool)

(assert (=> bs!9147 m!275073))

(assert (=> bs!9147 m!275073))

(declare-fun m!275075 () Bool)

(assert (=> bs!9147 m!275075))

(assert (=> b!259022 d!62335))

(declare-fun d!62337 () Bool)

(declare-fun e!168121 () Bool)

(assert (=> d!62337 e!168121))

(declare-fun res!126828 () Bool)

(assert (=> d!62337 (=> (not res!126828) (not e!168121))))

(declare-fun lt!130686 () ListLongMap!3851)

(assert (=> d!62337 (= res!126828 (contains!1882 lt!130686 (_1!2480 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504)))))))

(declare-fun lt!130685 () List!3817)

(assert (=> d!62337 (= lt!130686 (ListLongMap!3852 lt!130685))))

(declare-fun lt!130687 () Unit!8045)

(declare-fun lt!130688 () Unit!8045)

(assert (=> d!62337 (= lt!130687 lt!130688)))

(assert (=> d!62337 (= (getValueByKey!314 lt!130685 (_1!2480 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62337 (= lt!130688 (lemmaContainsTupThenGetReturnValue!170 lt!130685 (_1!2480 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62337 (= lt!130685 (insertStrictlySorted!173 (toList!1941 lt!130458) (_1!2480 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504)))))))

(assert (=> d!62337 (= (+!695 lt!130458 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504))) lt!130686)))

(declare-fun b!259407 () Bool)

(declare-fun res!126827 () Bool)

(assert (=> b!259407 (=> (not res!126827) (not e!168121))))

(assert (=> b!259407 (= res!126827 (= (getValueByKey!314 (toList!1941 lt!130686) (_1!2480 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504))))))))

(declare-fun b!259408 () Bool)

(assert (=> b!259408 (= e!168121 (contains!1884 (toList!1941 lt!130686) (tuple2!4939 lt!130461 (zeroValue!4615 thiss!1504))))))

(assert (= (and d!62337 res!126828) b!259407))

(assert (= (and b!259407 res!126827) b!259408))

(declare-fun m!275077 () Bool)

(assert (=> d!62337 m!275077))

(declare-fun m!275079 () Bool)

(assert (=> d!62337 m!275079))

(declare-fun m!275081 () Bool)

(assert (=> d!62337 m!275081))

(declare-fun m!275083 () Bool)

(assert (=> d!62337 m!275083))

(declare-fun m!275085 () Bool)

(assert (=> b!259407 m!275085))

(declare-fun m!275087 () Bool)

(assert (=> b!259408 m!275087))

(assert (=> b!259022 d!62337))

(declare-fun d!62339 () Bool)

(assert (=> d!62339 (= (apply!256 (+!695 lt!130455 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504))) lt!130460) (apply!256 lt!130455 lt!130460))))

(declare-fun lt!130689 () Unit!8045)

(assert (=> d!62339 (= lt!130689 (choose!1258 lt!130455 lt!130471 (minValue!4615 thiss!1504) lt!130460))))

(declare-fun e!168122 () Bool)

(assert (=> d!62339 e!168122))

(declare-fun res!126829 () Bool)

(assert (=> d!62339 (=> (not res!126829) (not e!168122))))

(assert (=> d!62339 (= res!126829 (contains!1882 lt!130455 lt!130460))))

(assert (=> d!62339 (= (addApplyDifferent!232 lt!130455 lt!130471 (minValue!4615 thiss!1504) lt!130460) lt!130689)))

(declare-fun b!259409 () Bool)

(assert (=> b!259409 (= e!168122 (not (= lt!130460 lt!130471)))))

(assert (= (and d!62339 res!126829) b!259409))

(declare-fun m!275089 () Bool)

(assert (=> d!62339 m!275089))

(assert (=> d!62339 m!274533))

(declare-fun m!275091 () Bool)

(assert (=> d!62339 m!275091))

(assert (=> d!62339 m!274547))

(assert (=> d!62339 m!274533))

(assert (=> d!62339 m!274535))

(assert (=> b!259022 d!62339))

(declare-fun d!62341 () Bool)

(assert (=> d!62341 (= (apply!256 (+!695 lt!130455 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504))) lt!130460) (get!3063 (getValueByKey!314 (toList!1941 (+!695 lt!130455 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504)))) lt!130460)))))

(declare-fun bs!9148 () Bool)

(assert (= bs!9148 d!62341))

(declare-fun m!275093 () Bool)

(assert (=> bs!9148 m!275093))

(assert (=> bs!9148 m!275093))

(declare-fun m!275095 () Bool)

(assert (=> bs!9148 m!275095))

(assert (=> b!259022 d!62341))

(declare-fun b!259410 () Bool)

(declare-fun e!168125 () Bool)

(declare-fun lt!130691 () ListLongMap!3851)

(assert (=> b!259410 (= e!168125 (isEmpty!535 lt!130691))))

(declare-fun call!24697 () ListLongMap!3851)

(declare-fun bm!24694 () Bool)

(assert (=> bm!24694 (= call!24697 (getCurrentListMapNoExtraKeys!578 lt!130324 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4774 thiss!1504)))))

(declare-fun b!259411 () Bool)

(declare-fun e!168123 () Bool)

(declare-fun e!168129 () Bool)

(assert (=> b!259411 (= e!168123 e!168129)))

(assert (=> b!259411 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(declare-fun res!126830 () Bool)

(assert (=> b!259411 (= res!126830 (contains!1882 lt!130691 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(assert (=> b!259411 (=> (not res!126830) (not e!168129))))

(declare-fun b!259412 () Bool)

(declare-fun e!168127 () ListLongMap!3851)

(declare-fun e!168126 () ListLongMap!3851)

(assert (=> b!259412 (= e!168127 e!168126)))

(declare-fun c!44025 () Bool)

(assert (=> b!259412 (= c!44025 (validKeyInArray!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun b!259413 () Bool)

(declare-fun lt!130693 () Unit!8045)

(declare-fun lt!130692 () Unit!8045)

(assert (=> b!259413 (= lt!130693 lt!130692)))

(declare-fun lt!130696 () ListLongMap!3851)

(declare-fun lt!130695 () (_ BitVec 64))

(declare-fun lt!130690 () (_ BitVec 64))

(declare-fun lt!130694 () V!8459)

(assert (=> b!259413 (not (contains!1882 (+!695 lt!130696 (tuple2!4939 lt!130695 lt!130694)) lt!130690))))

(assert (=> b!259413 (= lt!130692 (addStillNotContains!126 lt!130696 lt!130695 lt!130694 lt!130690))))

(assert (=> b!259413 (= lt!130690 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!259413 (= lt!130694 (get!3062 (select (arr!5950 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259413 (= lt!130695 (select (arr!5951 lt!130324) #b00000000000000000000000000000000))))

(assert (=> b!259413 (= lt!130696 call!24697)))

(assert (=> b!259413 (= e!168126 (+!695 call!24697 (tuple2!4939 (select (arr!5951 lt!130324) #b00000000000000000000000000000000) (get!3062 (select (arr!5950 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!259414 () Bool)

(assert (=> b!259414 (= e!168126 call!24697)))

(declare-fun b!259415 () Bool)

(declare-fun e!168128 () Bool)

(assert (=> b!259415 (= e!168128 (validKeyInArray!0 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(assert (=> b!259415 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!259416 () Bool)

(assert (=> b!259416 (= e!168127 (ListLongMap!3852 Nil!3814))))

(declare-fun d!62343 () Bool)

(declare-fun e!168124 () Bool)

(assert (=> d!62343 e!168124))

(declare-fun res!126832 () Bool)

(assert (=> d!62343 (=> (not res!126832) (not e!168124))))

(assert (=> d!62343 (= res!126832 (not (contains!1882 lt!130691 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62343 (= lt!130691 e!168127)))

(declare-fun c!44026 () Bool)

(assert (=> d!62343 (= c!44026 (bvsge #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(assert (=> d!62343 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62343 (= (getCurrentListMapNoExtraKeys!578 lt!130324 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) lt!130691)))

(declare-fun b!259417 () Bool)

(assert (=> b!259417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(assert (=> b!259417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6298 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))))))))

(assert (=> b!259417 (= e!168129 (= (apply!256 lt!130691 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)) (get!3062 (select (arr!5950 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!259418 () Bool)

(assert (=> b!259418 (= e!168125 (= lt!130691 (getCurrentListMapNoExtraKeys!578 lt!130324 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4774 thiss!1504))))))

(declare-fun b!259419 () Bool)

(assert (=> b!259419 (= e!168123 e!168125)))

(declare-fun c!44024 () Bool)

(assert (=> b!259419 (= c!44024 (bvslt #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(declare-fun b!259420 () Bool)

(assert (=> b!259420 (= e!168124 e!168123)))

(declare-fun c!44023 () Bool)

(assert (=> b!259420 (= c!44023 e!168128)))

(declare-fun res!126831 () Bool)

(assert (=> b!259420 (=> (not res!126831) (not e!168128))))

(assert (=> b!259420 (= res!126831 (bvslt #b00000000000000000000000000000000 (size!6299 lt!130324)))))

(declare-fun b!259421 () Bool)

(declare-fun res!126833 () Bool)

(assert (=> b!259421 (=> (not res!126833) (not e!168124))))

(assert (=> b!259421 (= res!126833 (not (contains!1882 lt!130691 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62343 c!44026) b!259416))

(assert (= (and d!62343 (not c!44026)) b!259412))

(assert (= (and b!259412 c!44025) b!259413))

(assert (= (and b!259412 (not c!44025)) b!259414))

(assert (= (or b!259413 b!259414) bm!24694))

(assert (= (and d!62343 res!126832) b!259421))

(assert (= (and b!259421 res!126833) b!259420))

(assert (= (and b!259420 res!126831) b!259415))

(assert (= (and b!259420 c!44023) b!259411))

(assert (= (and b!259420 (not c!44023)) b!259419))

(assert (= (and b!259411 res!126830) b!259417))

(assert (= (and b!259419 c!44024) b!259418))

(assert (= (and b!259419 (not c!44024)) b!259410))

(declare-fun b_lambda!8235 () Bool)

(assert (=> (not b_lambda!8235) (not b!259413)))

(assert (=> b!259413 t!8886))

(declare-fun b_and!13847 () Bool)

(assert (= b_and!13845 (and (=> t!8886 result!5397) b_and!13847)))

(declare-fun b_lambda!8237 () Bool)

(assert (=> (not b_lambda!8237) (not b!259417)))

(assert (=> b!259417 t!8886))

(declare-fun b_and!13849 () Bool)

(assert (= b_and!13847 (and (=> t!8886 result!5397) b_and!13849)))

(declare-fun m!275097 () Bool)

(assert (=> d!62343 m!275097))

(assert (=> d!62343 m!274323))

(assert (=> b!259411 m!274483))

(assert (=> b!259411 m!274483))

(declare-fun m!275099 () Bool)

(assert (=> b!259411 m!275099))

(declare-fun m!275101 () Bool)

(assert (=> b!259418 m!275101))

(declare-fun m!275103 () Bool)

(assert (=> b!259410 m!275103))

(assert (=> b!259415 m!274483))

(assert (=> b!259415 m!274483))

(assert (=> b!259415 m!274487))

(assert (=> b!259412 m!274483))

(assert (=> b!259412 m!274483))

(assert (=> b!259412 m!274487))

(declare-fun m!275105 () Bool)

(assert (=> b!259421 m!275105))

(declare-fun m!275107 () Bool)

(assert (=> b!259413 m!275107))

(declare-fun m!275109 () Bool)

(assert (=> b!259413 m!275109))

(declare-fun m!275111 () Bool)

(assert (=> b!259413 m!275111))

(assert (=> b!259413 m!274505))

(declare-fun m!275113 () Bool)

(assert (=> b!259413 m!275113))

(assert (=> b!259413 m!274483))

(assert (=> b!259413 m!274507))

(assert (=> b!259413 m!274505))

(assert (=> b!259413 m!274509))

(assert (=> b!259413 m!274507))

(assert (=> b!259413 m!275107))

(assert (=> bm!24694 m!275101))

(assert (=> b!259417 m!274483))

(declare-fun m!275115 () Bool)

(assert (=> b!259417 m!275115))

(assert (=> b!259417 m!274505))

(assert (=> b!259417 m!274507))

(assert (=> b!259417 m!274483))

(assert (=> b!259417 m!274507))

(assert (=> b!259417 m!274505))

(assert (=> b!259417 m!274509))

(assert (=> b!259022 d!62343))

(declare-fun d!62345 () Bool)

(declare-fun e!168130 () Bool)

(assert (=> d!62345 e!168130))

(declare-fun res!126835 () Bool)

(assert (=> d!62345 (=> (not res!126835) (not e!168130))))

(declare-fun lt!130698 () ListLongMap!3851)

(assert (=> d!62345 (= res!126835 (contains!1882 lt!130698 (_1!2480 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504)))))))

(declare-fun lt!130697 () List!3817)

(assert (=> d!62345 (= lt!130698 (ListLongMap!3852 lt!130697))))

(declare-fun lt!130699 () Unit!8045)

(declare-fun lt!130700 () Unit!8045)

(assert (=> d!62345 (= lt!130699 lt!130700)))

(assert (=> d!62345 (= (getValueByKey!314 lt!130697 (_1!2480 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504)))))))

(assert (=> d!62345 (= lt!130700 (lemmaContainsTupThenGetReturnValue!170 lt!130697 (_1!2480 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504)))))))

(assert (=> d!62345 (= lt!130697 (insertStrictlySorted!173 (toList!1941 lt!130455) (_1!2480 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504)))))))

(assert (=> d!62345 (= (+!695 lt!130455 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504))) lt!130698)))

(declare-fun b!259422 () Bool)

(declare-fun res!126834 () Bool)

(assert (=> b!259422 (=> (not res!126834) (not e!168130))))

(assert (=> b!259422 (= res!126834 (= (getValueByKey!314 (toList!1941 lt!130698) (_1!2480 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 lt!130471 (minValue!4615 thiss!1504))))))))

(declare-fun b!259423 () Bool)

(assert (=> b!259423 (= e!168130 (contains!1884 (toList!1941 lt!130698) (tuple2!4939 lt!130471 (minValue!4615 thiss!1504))))))

(assert (= (and d!62345 res!126835) b!259422))

(assert (= (and b!259422 res!126834) b!259423))

(declare-fun m!275117 () Bool)

(assert (=> d!62345 m!275117))

(declare-fun m!275119 () Bool)

(assert (=> d!62345 m!275119))

(declare-fun m!275121 () Bool)

(assert (=> d!62345 m!275121))

(declare-fun m!275123 () Bool)

(assert (=> d!62345 m!275123))

(declare-fun m!275125 () Bool)

(assert (=> b!259422 m!275125))

(declare-fun m!275127 () Bool)

(assert (=> b!259423 m!275127))

(assert (=> b!259022 d!62345))

(assert (=> d!62153 d!62143))

(declare-fun d!62347 () Bool)

(assert (=> d!62347 (arrayContainsKey!0 lt!130324 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62347 true))

(declare-fun _$60!381 () Unit!8045)

(assert (=> d!62347 (= (choose!13 lt!130324 key!932 index!297) _$60!381)))

(declare-fun bs!9149 () Bool)

(assert (= bs!9149 d!62347))

(assert (=> bs!9149 m!274343))

(assert (=> d!62153 d!62347))

(declare-fun d!62349 () Bool)

(assert (=> d!62349 (= (inRange!0 (index!6879 lt!130526) (mask!11082 thiss!1504)) (and (bvsge (index!6879 lt!130526) #b00000000000000000000000000000000) (bvslt (index!6879 lt!130526) (bvadd (mask!11082 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!259097 d!62349))

(declare-fun d!62351 () Bool)

(assert (=> d!62351 (= (apply!256 lt!130474 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3063 (getValueByKey!314 (toList!1941 lt!130474) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9150 () Bool)

(assert (= bs!9150 d!62351))

(assert (=> bs!9150 m!274683))

(assert (=> bs!9150 m!274683))

(declare-fun m!275129 () Bool)

(assert (=> bs!9150 m!275129))

(assert (=> b!259024 d!62351))

(assert (=> b!259090 d!62139))

(declare-fun d!62353 () Bool)

(declare-fun e!168131 () Bool)

(assert (=> d!62353 e!168131))

(declare-fun res!126837 () Bool)

(assert (=> d!62353 (=> (not res!126837) (not e!168131))))

(declare-fun lt!130702 () ListLongMap!3851)

(assert (=> d!62353 (= res!126837 (contains!1882 lt!130702 (_1!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(declare-fun lt!130701 () List!3817)

(assert (=> d!62353 (= lt!130702 (ListLongMap!3852 lt!130701))))

(declare-fun lt!130703 () Unit!8045)

(declare-fun lt!130704 () Unit!8045)

(assert (=> d!62353 (= lt!130703 lt!130704)))

(assert (=> d!62353 (= (getValueByKey!314 lt!130701 (_1!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(assert (=> d!62353 (= lt!130704 (lemmaContainsTupThenGetReturnValue!170 lt!130701 (_1!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(assert (=> d!62353 (= lt!130701 (insertStrictlySorted!173 (toList!1941 call!24662) (_1!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))) (_2!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(assert (=> d!62353 (= (+!695 call!24662 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))) lt!130702)))

(declare-fun b!259424 () Bool)

(declare-fun res!126836 () Bool)

(assert (=> b!259424 (=> (not res!126836) (not e!168131))))

(assert (=> b!259424 (= res!126836 (= (getValueByKey!314 (toList!1941 lt!130702) (_1!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))) (Some!319 (_2!2480 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))))

(declare-fun b!259425 () Bool)

(assert (=> b!259425 (= e!168131 (contains!1884 (toList!1941 lt!130702) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))

(assert (= (and d!62353 res!126837) b!259424))

(assert (= (and b!259424 res!126836) b!259425))

(declare-fun m!275131 () Bool)

(assert (=> d!62353 m!275131))

(declare-fun m!275133 () Bool)

(assert (=> d!62353 m!275133))

(declare-fun m!275135 () Bool)

(assert (=> d!62353 m!275135))

(declare-fun m!275137 () Bool)

(assert (=> d!62353 m!275137))

(declare-fun m!275139 () Bool)

(assert (=> b!259424 m!275139))

(declare-fun m!275141 () Bool)

(assert (=> b!259425 m!275141))

(assert (=> b!259063 d!62353))

(declare-fun b!259438 () Bool)

(declare-fun e!168138 () SeekEntryResult!1177)

(assert (=> b!259438 (= e!168138 Undefined!1177)))

(declare-fun b!259439 () Bool)

(declare-fun e!168139 () SeekEntryResult!1177)

(assert (=> b!259439 (= e!168139 (Found!1177 (index!6880 lt!130544)))))

(declare-fun b!259440 () Bool)

(declare-fun c!44035 () Bool)

(declare-fun lt!130709 () (_ BitVec 64))

(assert (=> b!259440 (= c!44035 (= lt!130709 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168140 () SeekEntryResult!1177)

(assert (=> b!259440 (= e!168139 e!168140)))

(declare-fun b!259441 () Bool)

(assert (=> b!259441 (= e!168140 (MissingVacant!1177 (index!6880 lt!130544)))))

(declare-fun b!259442 () Bool)

(assert (=> b!259442 (= e!168140 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25071 lt!130544) #b00000000000000000000000000000001) (nextIndex!0 (index!6880 lt!130544) (x!25071 lt!130544) (mask!11082 thiss!1504)) (index!6880 lt!130544) key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(declare-fun d!62355 () Bool)

(declare-fun lt!130710 () SeekEntryResult!1177)

(assert (=> d!62355 (and (or ((_ is Undefined!1177) lt!130710) (not ((_ is Found!1177) lt!130710)) (and (bvsge (index!6879 lt!130710) #b00000000000000000000000000000000) (bvslt (index!6879 lt!130710) (size!6299 (_keys!6948 thiss!1504))))) (or ((_ is Undefined!1177) lt!130710) ((_ is Found!1177) lt!130710) (not ((_ is MissingVacant!1177) lt!130710)) (not (= (index!6881 lt!130710) (index!6880 lt!130544))) (and (bvsge (index!6881 lt!130710) #b00000000000000000000000000000000) (bvslt (index!6881 lt!130710) (size!6299 (_keys!6948 thiss!1504))))) (or ((_ is Undefined!1177) lt!130710) (ite ((_ is Found!1177) lt!130710) (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6879 lt!130710)) key!932) (and ((_ is MissingVacant!1177) lt!130710) (= (index!6881 lt!130710) (index!6880 lt!130544)) (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6881 lt!130710)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!62355 (= lt!130710 e!168138)))

(declare-fun c!44034 () Bool)

(assert (=> d!62355 (= c!44034 (bvsge (x!25071 lt!130544) #b01111111111111111111111111111110))))

(assert (=> d!62355 (= lt!130709 (select (arr!5951 (_keys!6948 thiss!1504)) (index!6880 lt!130544)))))

(assert (=> d!62355 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62355 (= (seekKeyOrZeroReturnVacant!0 (x!25071 lt!130544) (index!6880 lt!130544) (index!6880 lt!130544) key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)) lt!130710)))

(declare-fun b!259443 () Bool)

(assert (=> b!259443 (= e!168138 e!168139)))

(declare-fun c!44033 () Bool)

(assert (=> b!259443 (= c!44033 (= lt!130709 key!932))))

(assert (= (and d!62355 c!44034) b!259438))

(assert (= (and d!62355 (not c!44034)) b!259443))

(assert (= (and b!259443 c!44033) b!259439))

(assert (= (and b!259443 (not c!44033)) b!259440))

(assert (= (and b!259440 c!44035) b!259441))

(assert (= (and b!259440 (not c!44035)) b!259442))

(declare-fun m!275143 () Bool)

(assert (=> b!259442 m!275143))

(assert (=> b!259442 m!275143))

(declare-fun m!275145 () Bool)

(assert (=> b!259442 m!275145))

(declare-fun m!275147 () Bool)

(assert (=> d!62355 m!275147))

(declare-fun m!275149 () Bool)

(assert (=> d!62355 m!275149))

(assert (=> d!62355 m!274673))

(assert (=> d!62355 m!274323))

(assert (=> b!259140 d!62355))

(declare-fun d!62357 () Bool)

(declare-fun e!168141 () Bool)

(assert (=> d!62357 e!168141))

(declare-fun res!126839 () Bool)

(assert (=> d!62357 (=> (not res!126839) (not e!168141))))

(declare-fun lt!130712 () ListLongMap!3851)

(assert (=> d!62357 (= res!126839 (contains!1882 lt!130712 (_1!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun lt!130711 () List!3817)

(assert (=> d!62357 (= lt!130712 (ListLongMap!3852 lt!130711))))

(declare-fun lt!130713 () Unit!8045)

(declare-fun lt!130714 () Unit!8045)

(assert (=> d!62357 (= lt!130713 lt!130714)))

(assert (=> d!62357 (= (getValueByKey!314 lt!130711 (_1!2480 (tuple2!4939 key!932 v!346))) (Some!319 (_2!2480 (tuple2!4939 key!932 v!346))))))

(assert (=> d!62357 (= lt!130714 (lemmaContainsTupThenGetReturnValue!170 lt!130711 (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346))))))

(assert (=> d!62357 (= lt!130711 (insertStrictlySorted!173 (toList!1941 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504))) (_1!2480 (tuple2!4939 key!932 v!346)) (_2!2480 (tuple2!4939 key!932 v!346))))))

(assert (=> d!62357 (= (+!695 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) (tuple2!4939 key!932 v!346)) lt!130712)))

(declare-fun b!259444 () Bool)

(declare-fun res!126838 () Bool)

(assert (=> b!259444 (=> (not res!126838) (not e!168141))))

(assert (=> b!259444 (= res!126838 (= (getValueByKey!314 (toList!1941 lt!130712) (_1!2480 (tuple2!4939 key!932 v!346))) (Some!319 (_2!2480 (tuple2!4939 key!932 v!346)))))))

(declare-fun b!259445 () Bool)

(assert (=> b!259445 (= e!168141 (contains!1884 (toList!1941 lt!130712) (tuple2!4939 key!932 v!346)))))

(assert (= (and d!62357 res!126839) b!259444))

(assert (= (and b!259444 res!126838) b!259445))

(declare-fun m!275151 () Bool)

(assert (=> d!62357 m!275151))

(declare-fun m!275153 () Bool)

(assert (=> d!62357 m!275153))

(declare-fun m!275155 () Bool)

(assert (=> d!62357 m!275155))

(declare-fun m!275157 () Bool)

(assert (=> d!62357 m!275157))

(declare-fun m!275159 () Bool)

(assert (=> b!259444 m!275159))

(declare-fun m!275161 () Bool)

(assert (=> b!259445 m!275161))

(assert (=> b!258933 d!62357))

(assert (=> b!258933 d!62171))

(declare-fun call!24700 () ListLongMap!3851)

(declare-fun bm!24695 () Bool)

(assert (=> bm!24695 (= call!24700 (getCurrentListMapNoExtraKeys!578 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun b!259447 () Bool)

(declare-fun c!44041 () Bool)

(assert (=> b!259447 (= c!44041 (and (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!168150 () ListLongMap!3851)

(declare-fun e!168152 () ListLongMap!3851)

(assert (=> b!259447 (= e!168150 e!168152)))

(declare-fun e!168149 () Bool)

(declare-fun b!259448 () Bool)

(assert (=> b!259448 (= e!168149 (validKeyInArray!0 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259449 () Bool)

(declare-fun e!168154 () Bool)

(declare-fun e!168143 () Bool)

(assert (=> b!259449 (= e!168154 e!168143)))

(declare-fun res!126843 () Bool)

(declare-fun call!24703 () Bool)

(assert (=> b!259449 (= res!126843 call!24703)))

(assert (=> b!259449 (=> (not res!126843) (not e!168143))))

(declare-fun b!259450 () Bool)

(declare-fun call!24701 () ListLongMap!3851)

(assert (=> b!259450 (= e!168152 call!24701)))

(declare-fun b!259451 () Bool)

(declare-fun call!24702 () ListLongMap!3851)

(assert (=> b!259451 (= e!168150 call!24702)))

(declare-fun bm!24696 () Bool)

(declare-fun call!24699 () ListLongMap!3851)

(assert (=> bm!24696 (= call!24701 call!24699)))

(declare-fun bm!24697 () Bool)

(declare-fun lt!130736 () ListLongMap!3851)

(assert (=> bm!24697 (= call!24703 (contains!1882 lt!130736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168145 () Bool)

(declare-fun b!259452 () Bool)

(assert (=> b!259452 (= e!168145 (= (apply!256 lt!130736 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000)) (get!3062 (select (arr!5950 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6298 (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))))))))

(assert (=> b!259452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))))))))

(declare-fun bm!24698 () Bool)

(declare-fun call!24698 () ListLongMap!3851)

(declare-fun c!44039 () Bool)

(declare-fun c!44038 () Bool)

(assert (=> bm!24698 (= call!24698 (+!695 (ite c!44039 call!24700 (ite c!44038 call!24699 call!24701)) (ite (or c!44039 c!44038) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4615 thiss!1504)) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504)))))))

(declare-fun b!259453 () Bool)

(assert (=> b!259453 (= e!168152 call!24702)))

(declare-fun b!259454 () Bool)

(declare-fun res!126847 () Bool)

(declare-fun e!168148 () Bool)

(assert (=> b!259454 (=> (not res!126847) (not e!168148))))

(declare-fun e!168147 () Bool)

(assert (=> b!259454 (= res!126847 e!168147)))

(declare-fun res!126844 () Bool)

(assert (=> b!259454 (=> res!126844 e!168147)))

(assert (=> b!259454 (= res!126844 (not e!168149))))

(declare-fun res!126840 () Bool)

(assert (=> b!259454 (=> (not res!126840) (not e!168149))))

(assert (=> b!259454 (= res!126840 (bvslt #b00000000000000000000000000000000 (size!6299 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))))))))

(declare-fun b!259455 () Bool)

(declare-fun e!168153 () Unit!8045)

(declare-fun lt!130726 () Unit!8045)

(assert (=> b!259455 (= e!168153 lt!130726)))

(declare-fun lt!130729 () ListLongMap!3851)

(assert (=> b!259455 (= lt!130729 (getCurrentListMapNoExtraKeys!578 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130719 () (_ BitVec 64))

(assert (=> b!259455 (= lt!130719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130715 () (_ BitVec 64))

(assert (=> b!259455 (= lt!130715 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130734 () Unit!8045)

(assert (=> b!259455 (= lt!130734 (addStillContains!232 lt!130729 lt!130719 (zeroValue!4615 thiss!1504) lt!130715))))

(assert (=> b!259455 (contains!1882 (+!695 lt!130729 (tuple2!4939 lt!130719 (zeroValue!4615 thiss!1504))) lt!130715)))

(declare-fun lt!130731 () Unit!8045)

(assert (=> b!259455 (= lt!130731 lt!130734)))

(declare-fun lt!130721 () ListLongMap!3851)

(assert (=> b!259455 (= lt!130721 (getCurrentListMapNoExtraKeys!578 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130725 () (_ BitVec 64))

(assert (=> b!259455 (= lt!130725 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130728 () (_ BitVec 64))

(assert (=> b!259455 (= lt!130728 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130727 () Unit!8045)

(assert (=> b!259455 (= lt!130727 (addApplyDifferent!232 lt!130721 lt!130725 (minValue!4615 thiss!1504) lt!130728))))

(assert (=> b!259455 (= (apply!256 (+!695 lt!130721 (tuple2!4939 lt!130725 (minValue!4615 thiss!1504))) lt!130728) (apply!256 lt!130721 lt!130728))))

(declare-fun lt!130732 () Unit!8045)

(assert (=> b!259455 (= lt!130732 lt!130727)))

(declare-fun lt!130720 () ListLongMap!3851)

(assert (=> b!259455 (= lt!130720 (getCurrentListMapNoExtraKeys!578 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130723 () (_ BitVec 64))

(assert (=> b!259455 (= lt!130723 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130730 () (_ BitVec 64))

(assert (=> b!259455 (= lt!130730 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!130735 () Unit!8045)

(assert (=> b!259455 (= lt!130735 (addApplyDifferent!232 lt!130720 lt!130723 (zeroValue!4615 thiss!1504) lt!130730))))

(assert (=> b!259455 (= (apply!256 (+!695 lt!130720 (tuple2!4939 lt!130723 (zeroValue!4615 thiss!1504))) lt!130730) (apply!256 lt!130720 lt!130730))))

(declare-fun lt!130724 () Unit!8045)

(assert (=> b!259455 (= lt!130724 lt!130735)))

(declare-fun lt!130717 () ListLongMap!3851)

(assert (=> b!259455 (= lt!130717 (getCurrentListMapNoExtraKeys!578 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)))))

(declare-fun lt!130733 () (_ BitVec 64))

(assert (=> b!259455 (= lt!130733 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130722 () (_ BitVec 64))

(assert (=> b!259455 (= lt!130722 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!259455 (= lt!130726 (addApplyDifferent!232 lt!130717 lt!130733 (minValue!4615 thiss!1504) lt!130722))))

(assert (=> b!259455 (= (apply!256 (+!695 lt!130717 (tuple2!4939 lt!130733 (minValue!4615 thiss!1504))) lt!130722) (apply!256 lt!130717 lt!130722))))

(declare-fun d!62359 () Bool)

(assert (=> d!62359 e!168148))

(declare-fun res!126841 () Bool)

(assert (=> d!62359 (=> (not res!126841) (not e!168148))))

(assert (=> d!62359 (= res!126841 (or (bvsge #b00000000000000000000000000000000 (size!6299 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))))))))))

(declare-fun lt!130716 () ListLongMap!3851)

(assert (=> d!62359 (= lt!130736 lt!130716)))

(declare-fun lt!130718 () Unit!8045)

(assert (=> d!62359 (= lt!130718 e!168153)))

(declare-fun c!44037 () Bool)

(declare-fun e!168144 () Bool)

(assert (=> d!62359 (= c!44037 e!168144)))

(declare-fun res!126848 () Bool)

(assert (=> d!62359 (=> (not res!126848) (not e!168144))))

(assert (=> d!62359 (= res!126848 (bvslt #b00000000000000000000000000000000 (size!6299 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))))))))

(declare-fun e!168146 () ListLongMap!3851)

(assert (=> d!62359 (= lt!130716 e!168146)))

(assert (=> d!62359 (= c!44039 (and (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62359 (validMask!0 (mask!11082 thiss!1504))))

(assert (=> d!62359 (= (getCurrentListMap!1469 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (array!12568 (store (arr!5950 (_values!4757 thiss!1504)) index!297 (ValueCellFull!2961 v!346)) (size!6298 (_values!4757 thiss!1504))) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) lt!130736)))

(declare-fun b!259446 () Bool)

(assert (=> b!259446 (= e!168146 (+!695 call!24698 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4615 thiss!1504))))))

(declare-fun b!259456 () Bool)

(declare-fun Unit!8064 () Unit!8045)

(assert (=> b!259456 (= e!168153 Unit!8064)))

(declare-fun b!259457 () Bool)

(assert (=> b!259457 (= e!168143 (= (apply!256 lt!130736 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4615 thiss!1504)))))

(declare-fun b!259458 () Bool)

(declare-fun res!126842 () Bool)

(assert (=> b!259458 (=> (not res!126842) (not e!168148))))

(assert (=> b!259458 (= res!126842 e!168154)))

(declare-fun c!44036 () Bool)

(assert (=> b!259458 (= c!44036 (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24699 () Bool)

(assert (=> bm!24699 (= call!24702 call!24698)))

(declare-fun b!259459 () Bool)

(assert (=> b!259459 (= e!168154 (not call!24703))))

(declare-fun b!259460 () Bool)

(assert (=> b!259460 (= e!168146 e!168150)))

(assert (=> b!259460 (= c!44038 (and (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259461 () Bool)

(declare-fun e!168142 () Bool)

(declare-fun call!24704 () Bool)

(assert (=> b!259461 (= e!168142 (not call!24704))))

(declare-fun bm!24700 () Bool)

(assert (=> bm!24700 (= call!24699 call!24700)))

(declare-fun bm!24701 () Bool)

(assert (=> bm!24701 (= call!24704 (contains!1882 lt!130736 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259462 () Bool)

(declare-fun e!168151 () Bool)

(assert (=> b!259462 (= e!168151 (= (apply!256 lt!130736 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4615 thiss!1504)))))

(declare-fun b!259463 () Bool)

(assert (=> b!259463 (= e!168147 e!168145)))

(declare-fun res!126845 () Bool)

(assert (=> b!259463 (=> (not res!126845) (not e!168145))))

(assert (=> b!259463 (= res!126845 (contains!1882 lt!130736 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!259463 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))))))))

(declare-fun b!259464 () Bool)

(assert (=> b!259464 (= e!168148 e!168142)))

(declare-fun c!44040 () Bool)

(assert (=> b!259464 (= c!44040 (not (= (bvand (extraKeys!4511 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259465 () Bool)

(assert (=> b!259465 (= e!168144 (validKeyInArray!0 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!259466 () Bool)

(assert (=> b!259466 (= e!168142 e!168151)))

(declare-fun res!126846 () Bool)

(assert (=> b!259466 (= res!126846 call!24704)))

(assert (=> b!259466 (=> (not res!126846) (not e!168151))))

(assert (= (and d!62359 c!44039) b!259446))

(assert (= (and d!62359 (not c!44039)) b!259460))

(assert (= (and b!259460 c!44038) b!259451))

(assert (= (and b!259460 (not c!44038)) b!259447))

(assert (= (and b!259447 c!44041) b!259453))

(assert (= (and b!259447 (not c!44041)) b!259450))

(assert (= (or b!259453 b!259450) bm!24696))

(assert (= (or b!259451 bm!24696) bm!24700))

(assert (= (or b!259451 b!259453) bm!24699))

(assert (= (or b!259446 bm!24700) bm!24695))

(assert (= (or b!259446 bm!24699) bm!24698))

(assert (= (and d!62359 res!126848) b!259465))

(assert (= (and d!62359 c!44037) b!259455))

(assert (= (and d!62359 (not c!44037)) b!259456))

(assert (= (and d!62359 res!126841) b!259454))

(assert (= (and b!259454 res!126840) b!259448))

(assert (= (and b!259454 (not res!126844)) b!259463))

(assert (= (and b!259463 res!126845) b!259452))

(assert (= (and b!259454 res!126847) b!259458))

(assert (= (and b!259458 c!44036) b!259449))

(assert (= (and b!259458 (not c!44036)) b!259459))

(assert (= (and b!259449 res!126843) b!259457))

(assert (= (or b!259449 b!259459) bm!24697))

(assert (= (and b!259458 res!126842) b!259464))

(assert (= (and b!259464 c!44040) b!259466))

(assert (= (and b!259464 (not c!44040)) b!259461))

(assert (= (and b!259466 res!126846) b!259462))

(assert (= (or b!259466 b!259461) bm!24701))

(declare-fun b_lambda!8239 () Bool)

(assert (=> (not b_lambda!8239) (not b!259452)))

(assert (=> b!259452 t!8886))

(declare-fun b_and!13851 () Bool)

(assert (= b_and!13849 (and (=> t!8886 result!5397) b_and!13851)))

(assert (=> b!259465 m!274701))

(assert (=> b!259465 m!274701))

(assert (=> b!259465 m!274709))

(assert (=> b!259452 m!274701))

(declare-fun m!275163 () Bool)

(assert (=> b!259452 m!275163))

(assert (=> b!259452 m!274505))

(assert (=> b!259452 m!274701))

(assert (=> b!259452 m!274507))

(assert (=> b!259452 m!274505))

(assert (=> b!259452 m!274509))

(assert (=> b!259452 m!274507))

(declare-fun m!275165 () Bool)

(assert (=> bm!24698 m!275165))

(declare-fun m!275167 () Bool)

(assert (=> bm!24697 m!275167))

(declare-fun m!275169 () Bool)

(assert (=> bm!24701 m!275169))

(declare-fun m!275171 () Bool)

(assert (=> b!259462 m!275171))

(assert (=> b!259448 m!274701))

(assert (=> b!259448 m!274701))

(assert (=> b!259448 m!274709))

(declare-fun m!275173 () Bool)

(assert (=> b!259446 m!275173))

(declare-fun m!275175 () Bool)

(assert (=> b!259455 m!275175))

(declare-fun m!275177 () Bool)

(assert (=> b!259455 m!275177))

(assert (=> b!259455 m!275177))

(declare-fun m!275179 () Bool)

(assert (=> b!259455 m!275179))

(declare-fun m!275181 () Bool)

(assert (=> b!259455 m!275181))

(declare-fun m!275183 () Bool)

(assert (=> b!259455 m!275183))

(declare-fun m!275185 () Bool)

(assert (=> b!259455 m!275185))

(assert (=> b!259455 m!274701))

(declare-fun m!275187 () Bool)

(assert (=> b!259455 m!275187))

(declare-fun m!275189 () Bool)

(assert (=> b!259455 m!275189))

(declare-fun m!275191 () Bool)

(assert (=> b!259455 m!275191))

(declare-fun m!275193 () Bool)

(assert (=> b!259455 m!275193))

(declare-fun m!275195 () Bool)

(assert (=> b!259455 m!275195))

(assert (=> b!259455 m!275183))

(declare-fun m!275197 () Bool)

(assert (=> b!259455 m!275197))

(declare-fun m!275199 () Bool)

(assert (=> b!259455 m!275199))

(declare-fun m!275201 () Bool)

(assert (=> b!259455 m!275201))

(declare-fun m!275203 () Bool)

(assert (=> b!259455 m!275203))

(assert (=> b!259455 m!275187))

(assert (=> b!259455 m!275175))

(declare-fun m!275205 () Bool)

(assert (=> b!259455 m!275205))

(assert (=> b!259463 m!274701))

(assert (=> b!259463 m!274701))

(declare-fun m!275207 () Bool)

(assert (=> b!259463 m!275207))

(assert (=> bm!24695 m!275203))

(assert (=> d!62359 m!274323))

(declare-fun m!275209 () Bool)

(assert (=> b!259457 m!275209))

(assert (=> b!258933 d!62359))

(declare-fun b!259467 () Bool)

(declare-fun e!168155 () (_ BitVec 32))

(declare-fun call!24705 () (_ BitVec 32))

(assert (=> b!259467 (= e!168155 (bvadd #b00000000000000000000000000000001 call!24705))))

(declare-fun d!62361 () Bool)

(declare-fun lt!130737 () (_ BitVec 32))

(assert (=> d!62361 (and (bvsge lt!130737 #b00000000000000000000000000000000) (bvsle lt!130737 (bvsub (size!6299 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!168156 () (_ BitVec 32))

(assert (=> d!62361 (= lt!130737 e!168156)))

(declare-fun c!44043 () Bool)

(assert (=> d!62361 (= c!44043 (bvsge #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))))))

(assert (=> d!62361 (and (bvsle #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6299 (_keys!6948 thiss!1504)) (size!6299 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))))))))

(assert (=> d!62361 (= (arrayCountValidKeys!0 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) lt!130737)))

(declare-fun b!259468 () Bool)

(assert (=> b!259468 (= e!168155 call!24705)))

(declare-fun b!259469 () Bool)

(assert (=> b!259469 (= e!168156 e!168155)))

(declare-fun c!44042 () Bool)

(assert (=> b!259469 (= c!44042 (validKeyInArray!0 (select (arr!5951 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!24702 () Bool)

(assert (=> bm!24702 (= call!24705 (arrayCountValidKeys!0 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!259470 () Bool)

(assert (=> b!259470 (= e!168156 #b00000000000000000000000000000000)))

(assert (= (and d!62361 c!44043) b!259470))

(assert (= (and d!62361 (not c!44043)) b!259469))

(assert (= (and b!259469 c!44042) b!259467))

(assert (= (and b!259469 (not c!44042)) b!259468))

(assert (= (or b!259467 b!259468) bm!24702))

(assert (=> b!259469 m!274701))

(assert (=> b!259469 m!274701))

(assert (=> b!259469 m!274709))

(declare-fun m!275211 () Bool)

(assert (=> bm!24702 m!275211))

(assert (=> b!258912 d!62361))

(assert (=> b!258912 d!62139))

(assert (=> b!259065 d!62195))

(declare-fun d!62363 () Bool)

(declare-fun e!168158 () Bool)

(assert (=> d!62363 e!168158))

(declare-fun res!126849 () Bool)

(assert (=> d!62363 (=> res!126849 e!168158)))

(declare-fun lt!130739 () Bool)

(assert (=> d!62363 (= res!126849 (not lt!130739))))

(declare-fun lt!130740 () Bool)

(assert (=> d!62363 (= lt!130739 lt!130740)))

(declare-fun lt!130741 () Unit!8045)

(declare-fun e!168157 () Unit!8045)

(assert (=> d!62363 (= lt!130741 e!168157)))

(declare-fun c!44044 () Bool)

(assert (=> d!62363 (= c!44044 lt!130740)))

(assert (=> d!62363 (= lt!130740 (containsKey!306 (toList!1941 lt!130521) (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62363 (= (contains!1882 lt!130521 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)) lt!130739)))

(declare-fun b!259471 () Bool)

(declare-fun lt!130738 () Unit!8045)

(assert (=> b!259471 (= e!168157 lt!130738)))

(assert (=> b!259471 (= lt!130738 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 lt!130521) (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259471 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130521) (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259472 () Bool)

(declare-fun Unit!8065 () Unit!8045)

(assert (=> b!259472 (= e!168157 Unit!8065)))

(declare-fun b!259473 () Bool)

(assert (=> b!259473 (= e!168158 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130521) (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62363 c!44044) b!259471))

(assert (= (and d!62363 (not c!44044)) b!259472))

(assert (= (and d!62363 (not res!126849)) b!259473))

(assert (=> d!62363 m!274471))

(declare-fun m!275213 () Bool)

(assert (=> d!62363 m!275213))

(assert (=> b!259471 m!274471))

(declare-fun m!275215 () Bool)

(assert (=> b!259471 m!275215))

(assert (=> b!259471 m!274471))

(declare-fun m!275217 () Bool)

(assert (=> b!259471 m!275217))

(assert (=> b!259471 m!275217))

(declare-fun m!275219 () Bool)

(assert (=> b!259471 m!275219))

(assert (=> b!259473 m!274471))

(assert (=> b!259473 m!275217))

(assert (=> b!259473 m!275217))

(assert (=> b!259473 m!275219))

(assert (=> b!259080 d!62363))

(declare-fun d!62365 () Bool)

(assert (=> d!62365 (arrayNoDuplicates!0 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) #b00000000000000000000000000000000 Nil!3815)))

(assert (=> d!62365 true))

(declare-fun _$65!89 () Unit!8045)

(assert (=> d!62365 (= (choose!41 (_keys!6948 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3815) _$65!89)))

(declare-fun bs!9151 () Bool)

(assert (= bs!9151 d!62365))

(assert (=> bs!9151 m!274353))

(assert (=> bs!9151 m!274569))

(assert (=> d!62157 d!62365))

(assert (=> d!62171 d!62163))

(declare-fun d!62367 () Bool)

(assert (=> d!62367 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!258910 d!62367))

(assert (=> bm!24671 d!62159))

(assert (=> b!259082 d!62195))

(assert (=> d!62151 d!62163))

(declare-fun c!44045 () Bool)

(declare-fun d!62369 () Bool)

(assert (=> d!62369 (= c!44045 (and ((_ is Cons!3813) (toList!1941 lt!130390)) (= (_1!2480 (h!4476 (toList!1941 lt!130390))) (_1!2480 (tuple2!4939 key!932 v!346)))))))

(declare-fun e!168159 () Option!320)

(assert (=> d!62369 (= (getValueByKey!314 (toList!1941 lt!130390) (_1!2480 (tuple2!4939 key!932 v!346))) e!168159)))

(declare-fun b!259476 () Bool)

(declare-fun e!168160 () Option!320)

(assert (=> b!259476 (= e!168160 (getValueByKey!314 (t!8882 (toList!1941 lt!130390)) (_1!2480 (tuple2!4939 key!932 v!346))))))

(declare-fun b!259474 () Bool)

(assert (=> b!259474 (= e!168159 (Some!319 (_2!2480 (h!4476 (toList!1941 lt!130390)))))))

(declare-fun b!259477 () Bool)

(assert (=> b!259477 (= e!168160 None!318)))

(declare-fun b!259475 () Bool)

(assert (=> b!259475 (= e!168159 e!168160)))

(declare-fun c!44046 () Bool)

(assert (=> b!259475 (= c!44046 (and ((_ is Cons!3813) (toList!1941 lt!130390)) (not (= (_1!2480 (h!4476 (toList!1941 lt!130390))) (_1!2480 (tuple2!4939 key!932 v!346))))))))

(assert (= (and d!62369 c!44045) b!259474))

(assert (= (and d!62369 (not c!44045)) b!259475))

(assert (= (and b!259475 c!44046) b!259476))

(assert (= (and b!259475 (not c!44046)) b!259477))

(declare-fun m!275221 () Bool)

(assert (=> b!259476 m!275221))

(assert (=> b!258917 d!62369))

(declare-fun d!62371 () Bool)

(declare-fun e!168162 () Bool)

(assert (=> d!62371 e!168162))

(declare-fun res!126850 () Bool)

(assert (=> d!62371 (=> res!126850 e!168162)))

(declare-fun lt!130743 () Bool)

(assert (=> d!62371 (= res!126850 (not lt!130743))))

(declare-fun lt!130744 () Bool)

(assert (=> d!62371 (= lt!130743 lt!130744)))

(declare-fun lt!130745 () Unit!8045)

(declare-fun e!168161 () Unit!8045)

(assert (=> d!62371 (= lt!130745 e!168161)))

(declare-fun c!44047 () Bool)

(assert (=> d!62371 (= c!44047 lt!130744)))

(assert (=> d!62371 (= lt!130744 (containsKey!306 (toList!1941 lt!130474) (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(assert (=> d!62371 (= (contains!1882 lt!130474 (select (arr!5951 lt!130324) #b00000000000000000000000000000000)) lt!130743)))

(declare-fun b!259478 () Bool)

(declare-fun lt!130742 () Unit!8045)

(assert (=> b!259478 (= e!168161 lt!130742)))

(assert (=> b!259478 (= lt!130742 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 lt!130474) (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(assert (=> b!259478 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130474) (select (arr!5951 lt!130324) #b00000000000000000000000000000000)))))

(declare-fun b!259479 () Bool)

(declare-fun Unit!8066 () Unit!8045)

(assert (=> b!259479 (= e!168161 Unit!8066)))

(declare-fun b!259480 () Bool)

(assert (=> b!259480 (= e!168162 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130474) (select (arr!5951 lt!130324) #b00000000000000000000000000000000))))))

(assert (= (and d!62371 c!44047) b!259478))

(assert (= (and d!62371 (not c!44047)) b!259479))

(assert (= (and d!62371 (not res!126850)) b!259480))

(assert (=> d!62371 m!274483))

(declare-fun m!275223 () Bool)

(assert (=> d!62371 m!275223))

(assert (=> b!259478 m!274483))

(declare-fun m!275225 () Bool)

(assert (=> b!259478 m!275225))

(assert (=> b!259478 m!274483))

(assert (=> b!259478 m!274845))

(assert (=> b!259478 m!274845))

(declare-fun m!275227 () Bool)

(assert (=> b!259478 m!275227))

(assert (=> b!259480 m!274483))

(assert (=> b!259480 m!274845))

(assert (=> b!259480 m!274845))

(assert (=> b!259480 m!275227))

(assert (=> b!259030 d!62371))

(declare-fun d!62373 () Bool)

(assert (=> d!62373 (= (apply!256 lt!130521 (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000)) (get!3063 (getValueByKey!314 (toList!1941 lt!130521) (select (arr!5951 (_keys!6948 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9152 () Bool)

(assert (= bs!9152 d!62373))

(assert (=> bs!9152 m!274471))

(assert (=> bs!9152 m!275217))

(assert (=> bs!9152 m!275217))

(declare-fun m!275229 () Bool)

(assert (=> bs!9152 m!275229))

(assert (=> b!259069 d!62373))

(declare-fun d!62375 () Bool)

(declare-fun c!44048 () Bool)

(assert (=> d!62375 (= c!44048 ((_ is ValueCellFull!2961) (select (arr!5950 (_values!4757 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!168163 () V!8459)

(assert (=> d!62375 (= (get!3062 (select (arr!5950 (_values!4757 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168163)))

(declare-fun b!259481 () Bool)

(assert (=> b!259481 (= e!168163 (get!3064 (select (arr!5950 (_values!4757 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!259482 () Bool)

(assert (=> b!259482 (= e!168163 (get!3065 (select (arr!5950 (_values!4757 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!599 (defaultEntry!4774 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62375 c!44048) b!259481))

(assert (= (and d!62375 (not c!44048)) b!259482))

(assert (=> b!259481 m!274589))

(assert (=> b!259481 m!274505))

(declare-fun m!275231 () Bool)

(assert (=> b!259481 m!275231))

(assert (=> b!259482 m!274589))

(assert (=> b!259482 m!274505))

(declare-fun m!275233 () Bool)

(assert (=> b!259482 m!275233))

(assert (=> b!259069 d!62375))

(assert (=> b!259015 d!62201))

(declare-fun d!62377 () Bool)

(declare-fun e!168165 () Bool)

(assert (=> d!62377 e!168165))

(declare-fun res!126851 () Bool)

(assert (=> d!62377 (=> res!126851 e!168165)))

(declare-fun lt!130747 () Bool)

(assert (=> d!62377 (= res!126851 (not lt!130747))))

(declare-fun lt!130748 () Bool)

(assert (=> d!62377 (= lt!130747 lt!130748)))

(declare-fun lt!130749 () Unit!8045)

(declare-fun e!168164 () Unit!8045)

(assert (=> d!62377 (= lt!130749 e!168164)))

(declare-fun c!44049 () Bool)

(assert (=> d!62377 (= c!44049 lt!130748)))

(assert (=> d!62377 (= lt!130748 (containsKey!306 (toList!1941 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504))) key!932))))

(assert (=> d!62377 (= (contains!1882 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) key!932) lt!130747)))

(declare-fun b!259483 () Bool)

(declare-fun lt!130746 () Unit!8045)

(assert (=> b!259483 (= e!168164 lt!130746)))

(assert (=> b!259483 (= lt!130746 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504))) key!932))))

(assert (=> b!259483 (isDefined!255 (getValueByKey!314 (toList!1941 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504))) key!932))))

(declare-fun b!259484 () Bool)

(declare-fun Unit!8067 () Unit!8045)

(assert (=> b!259484 (= e!168164 Unit!8067)))

(declare-fun b!259485 () Bool)

(assert (=> b!259485 (= e!168165 (isDefined!255 (getValueByKey!314 (toList!1941 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504))) key!932)))))

(assert (= (and d!62377 c!44049) b!259483))

(assert (= (and d!62377 (not c!44049)) b!259484))

(assert (= (and d!62377 (not res!126851)) b!259485))

(declare-fun m!275235 () Bool)

(assert (=> d!62377 m!275235))

(declare-fun m!275237 () Bool)

(assert (=> b!259483 m!275237))

(declare-fun m!275239 () Bool)

(assert (=> b!259483 m!275239))

(assert (=> b!259483 m!275239))

(declare-fun m!275241 () Bool)

(assert (=> b!259483 m!275241))

(assert (=> b!259485 m!275239))

(assert (=> b!259485 m!275239))

(assert (=> b!259485 m!275241))

(assert (=> d!62179 d!62377))

(assert (=> d!62179 d!62171))

(declare-fun d!62379 () Bool)

(assert (=> d!62379 (contains!1882 (getCurrentListMap!1469 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) key!932)))

(assert (=> d!62379 true))

(declare-fun _$17!86 () Unit!8045)

(assert (=> d!62379 (= (choose!1254 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4774 thiss!1504)) _$17!86)))

(declare-fun bs!9153 () Bool)

(assert (= bs!9153 d!62379))

(assert (=> bs!9153 m!274371))

(assert (=> bs!9153 m!274371))

(assert (=> bs!9153 m!274651))

(assert (=> d!62179 d!62379))

(assert (=> d!62179 d!62163))

(assert (=> d!62181 d!62183))

(declare-fun b!259502 () Bool)

(declare-fun e!168174 () Bool)

(declare-fun e!168177 () Bool)

(assert (=> b!259502 (= e!168174 e!168177)))

(declare-fun res!126860 () Bool)

(declare-fun call!24710 () Bool)

(assert (=> b!259502 (= res!126860 call!24710)))

(assert (=> b!259502 (=> (not res!126860) (not e!168177))))

(declare-fun b!259503 () Bool)

(declare-fun e!168175 () Bool)

(assert (=> b!259503 (= e!168174 e!168175)))

(declare-fun c!44054 () Bool)

(declare-fun lt!130752 () SeekEntryResult!1177)

(assert (=> b!259503 (= c!44054 ((_ is MissingVacant!1177) lt!130752))))

(declare-fun d!62381 () Bool)

(assert (=> d!62381 e!168174))

(declare-fun c!44055 () Bool)

(assert (=> d!62381 (= c!44055 ((_ is MissingZero!1177) lt!130752))))

(assert (=> d!62381 (= lt!130752 (seekEntryOrOpen!0 key!932 (_keys!6948 thiss!1504) (mask!11082 thiss!1504)))))

(assert (=> d!62381 true))

(declare-fun _$34!1122 () Unit!8045)

(assert (=> d!62381 (= (choose!1255 (_keys!6948 thiss!1504) (_values!4757 thiss!1504) (mask!11082 thiss!1504) (extraKeys!4511 thiss!1504) (zeroValue!4615 thiss!1504) (minValue!4615 thiss!1504) key!932 (defaultEntry!4774 thiss!1504)) _$34!1122)))

(declare-fun b!259504 () Bool)

(declare-fun res!126861 () Bool)

(assert (=> b!259504 (= res!126861 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6878 lt!130752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259504 (=> (not res!126861) (not e!168177))))

(declare-fun b!259505 () Bool)

(declare-fun res!126863 () Bool)

(declare-fun e!168176 () Bool)

(assert (=> b!259505 (=> (not res!126863) (not e!168176))))

(assert (=> b!259505 (= res!126863 call!24710)))

(assert (=> b!259505 (= e!168175 e!168176)))

(declare-fun bm!24707 () Bool)

(assert (=> bm!24707 (= call!24710 (inRange!0 (ite c!44055 (index!6878 lt!130752) (index!6881 lt!130752)) (mask!11082 thiss!1504)))))

(declare-fun b!259506 () Bool)

(declare-fun res!126862 () Bool)

(assert (=> b!259506 (=> (not res!126862) (not e!168176))))

(assert (=> b!259506 (= res!126862 (= (select (arr!5951 (_keys!6948 thiss!1504)) (index!6881 lt!130752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24708 () Bool)

(declare-fun call!24711 () Bool)

(assert (=> bm!24708 (= call!24711 (arrayContainsKey!0 (_keys!6948 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!259507 () Bool)

(assert (=> b!259507 (= e!168175 ((_ is Undefined!1177) lt!130752))))

(declare-fun b!259508 () Bool)

(assert (=> b!259508 (= e!168176 (not call!24711))))

(declare-fun b!259509 () Bool)

(assert (=> b!259509 (= e!168177 (not call!24711))))

(assert (= (and d!62381 c!44055) b!259502))

(assert (= (and d!62381 (not c!44055)) b!259503))

(assert (= (and b!259502 res!126860) b!259504))

(assert (= (and b!259504 res!126861) b!259509))

(assert (= (and b!259503 c!44054) b!259505))

(assert (= (and b!259503 (not c!44054)) b!259507))

(assert (= (and b!259505 res!126863) b!259506))

(assert (= (and b!259506 res!126862) b!259508))

(assert (= (or b!259502 b!259505) bm!24707))

(assert (= (or b!259509 b!259508) bm!24708))

(declare-fun m!275243 () Bool)

(assert (=> b!259504 m!275243))

(declare-fun m!275245 () Bool)

(assert (=> b!259506 m!275245))

(assert (=> d!62381 m!274379))

(assert (=> bm!24708 m!274325))

(declare-fun m!275247 () Bool)

(assert (=> bm!24707 m!275247))

(assert (=> d!62181 d!62381))

(assert (=> d!62181 d!62163))

(assert (=> b!259052 d!62293))

(declare-fun d!62383 () Bool)

(declare-fun res!126864 () Bool)

(declare-fun e!168178 () Bool)

(assert (=> d!62383 (=> res!126864 e!168178)))

(assert (=> d!62383 (= res!126864 (= (select (arr!5951 (_keys!6948 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62383 (= (arrayContainsKey!0 (_keys!6948 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!168178)))

(declare-fun b!259510 () Bool)

(declare-fun e!168179 () Bool)

(assert (=> b!259510 (= e!168178 e!168179)))

(declare-fun res!126865 () Bool)

(assert (=> b!259510 (=> (not res!126865) (not e!168179))))

(assert (=> b!259510 (= res!126865 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6299 (_keys!6948 thiss!1504))))))

(declare-fun b!259511 () Bool)

(assert (=> b!259511 (= e!168179 (arrayContainsKey!0 (_keys!6948 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62383 (not res!126864)) b!259510))

(assert (= (and b!259510 res!126865) b!259511))

(assert (=> d!62383 m!274995))

(declare-fun m!275249 () Bool)

(assert (=> b!259511 m!275249))

(assert (=> b!259046 d!62383))

(assert (=> b!259032 d!62201))

(declare-fun d!62385 () Bool)

(declare-fun e!168181 () Bool)

(assert (=> d!62385 e!168181))

(declare-fun res!126866 () Bool)

(assert (=> d!62385 (=> res!126866 e!168181)))

(declare-fun lt!130754 () Bool)

(assert (=> d!62385 (= res!126866 (not lt!130754))))

(declare-fun lt!130755 () Bool)

(assert (=> d!62385 (= lt!130754 lt!130755)))

(declare-fun lt!130756 () Unit!8045)

(declare-fun e!168180 () Unit!8045)

(assert (=> d!62385 (= lt!130756 e!168180)))

(declare-fun c!44056 () Bool)

(assert (=> d!62385 (= c!44056 lt!130755)))

(assert (=> d!62385 (= lt!130755 (containsKey!306 (toList!1941 lt!130474) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62385 (= (contains!1882 lt!130474 #b1000000000000000000000000000000000000000000000000000000000000000) lt!130754)))

(declare-fun b!259512 () Bool)

(declare-fun lt!130753 () Unit!8045)

(assert (=> b!259512 (= e!168180 lt!130753)))

(assert (=> b!259512 (= lt!130753 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1941 lt!130474) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259512 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130474) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259513 () Bool)

(declare-fun Unit!8068 () Unit!8045)

(assert (=> b!259513 (= e!168180 Unit!8068)))

(declare-fun b!259514 () Bool)

(assert (=> b!259514 (= e!168181 (isDefined!255 (getValueByKey!314 (toList!1941 lt!130474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62385 c!44056) b!259512))

(assert (= (and d!62385 (not c!44056)) b!259513))

(assert (= (and d!62385 (not res!126866)) b!259514))

(declare-fun m!275251 () Bool)

(assert (=> d!62385 m!275251))

(declare-fun m!275253 () Bool)

(assert (=> b!259512 m!275253))

(assert (=> b!259512 m!274827))

(assert (=> b!259512 m!274827))

(declare-fun m!275255 () Bool)

(assert (=> b!259512 m!275255))

(assert (=> b!259514 m!274827))

(assert (=> b!259514 m!274827))

(assert (=> b!259514 m!275255))

(assert (=> bm!24657 d!62385))

(assert (=> b!258942 d!62201))

(assert (=> bm!24651 d!62343))

(declare-fun d!62387 () Bool)

(assert (=> d!62387 (= (arrayCountValidKeys!0 (array!12570 (store (arr!5951 (_keys!6948 thiss!1504)) index!297 key!932) (size!6299 (_keys!6948 thiss!1504))) #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6948 thiss!1504) #b00000000000000000000000000000000 (size!6299 (_keys!6948 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!62387 true))

(declare-fun _$84!39 () Unit!8045)

(assert (=> d!62387 (= (choose!1 (_keys!6948 thiss!1504) index!297 key!932) _$84!39)))

(declare-fun bs!9154 () Bool)

(assert (= bs!9154 d!62387))

(assert (=> bs!9154 m!274353))

(assert (=> bs!9154 m!274449))

(assert (=> bs!9154 m!274341))

(assert (=> d!62135 d!62387))

(declare-fun mapIsEmpty!11264 () Bool)

(declare-fun mapRes!11264 () Bool)

(assert (=> mapIsEmpty!11264 mapRes!11264))

(declare-fun b!259515 () Bool)

(declare-fun e!168183 () Bool)

(assert (=> b!259515 (= e!168183 tp_is_empty!6609)))

(declare-fun b!259516 () Bool)

(declare-fun e!168182 () Bool)

(assert (=> b!259516 (= e!168182 tp_is_empty!6609)))

(declare-fun condMapEmpty!11264 () Bool)

(declare-fun mapDefault!11264 () ValueCell!2961)

(assert (=> mapNonEmpty!11263 (= condMapEmpty!11264 (= mapRest!11263 ((as const (Array (_ BitVec 32) ValueCell!2961)) mapDefault!11264)))))

(assert (=> mapNonEmpty!11263 (= tp!23566 (and e!168182 mapRes!11264))))

(declare-fun mapNonEmpty!11264 () Bool)

(declare-fun tp!23567 () Bool)

(assert (=> mapNonEmpty!11264 (= mapRes!11264 (and tp!23567 e!168183))))

(declare-fun mapKey!11264 () (_ BitVec 32))

(declare-fun mapRest!11264 () (Array (_ BitVec 32) ValueCell!2961))

(declare-fun mapValue!11264 () ValueCell!2961)

(assert (=> mapNonEmpty!11264 (= mapRest!11263 (store mapRest!11264 mapKey!11264 mapValue!11264))))

(assert (= (and mapNonEmpty!11263 condMapEmpty!11264) mapIsEmpty!11264))

(assert (= (and mapNonEmpty!11263 (not condMapEmpty!11264)) mapNonEmpty!11264))

(assert (= (and mapNonEmpty!11264 ((_ is ValueCellFull!2961) mapValue!11264)) b!259515))

(assert (= (and mapNonEmpty!11263 ((_ is ValueCellFull!2961) mapDefault!11264)) b!259516))

(declare-fun m!275257 () Bool)

(assert (=> mapNonEmpty!11264 m!275257))

(declare-fun b_lambda!8241 () Bool)

(assert (= b_lambda!8237 (or (and b!258835 b_free!6747) b_lambda!8241)))

(declare-fun b_lambda!8243 () Bool)

(assert (= b_lambda!8231 (or (and b!258835 b_free!6747) b_lambda!8243)))

(declare-fun b_lambda!8245 () Bool)

(assert (= b_lambda!8239 (or (and b!258835 b_free!6747) b_lambda!8245)))

(declare-fun b_lambda!8247 () Bool)

(assert (= b_lambda!8235 (or (and b!258835 b_free!6747) b_lambda!8247)))

(declare-fun b_lambda!8249 () Bool)

(assert (= b_lambda!8233 (or (and b!258835 b_free!6747) b_lambda!8249)))

(check-sat (not d!62385) (not b!259220) (not d!62353) (not d!62325) (not d!62343) (not b!259471) (not b!259476) (not b!259367) (not d!62329) (not bm!24673) (not d!62319) (not d!62379) (not b!259423) (not d!62321) (not b!259215) (not b!259415) (not d!62327) (not b!259272) tp_is_empty!6609 (not b!259395) (not d!62331) (not bm!24674) (not d!62249) (not b!259339) (not b!259184) (not b!259418) (not b!259183) (not b!259407) (not d!62255) (not d!62377) (not b!259342) (not bm!24681) (not b!259360) (not b_lambda!8245) (not d!62347) (not b!259446) (not b!259185) (not b!259412) (not b!259151) (not d!62283) (not b!259264) (not b!259224) (not b!259473) (not b!259260) (not b!259422) (not d!62339) (not b!259282) (not b!259255) (not d!62303) (not b!259421) (not d!62267) (not d!62271) (not d!62279) b_and!13851 (not b!259411) (not d!62355) (not b!259406) (not b!259354) (not b!259363) (not b!259256) (not bm!24697) (not b!259261) (not b_lambda!8241) (not b!259214) (not b!259465) (not b!259452) (not b!259245) (not d!62219) (not b!259425) (not b_lambda!8247) (not b!259263) (not b!259327) (not d!62189) (not b!259294) (not b!259178) (not b!259226) (not b!259297) (not b!259482) (not d!62309) (not bm!24678) (not b!259273) (not b!259331) (not b!259512) (not b!259444) (not b!259511) (not d!62209) (not b!259237) (not d!62241) (not bm!24693) (not d!62299) (not b!259172) (not b!259514) (not d!62225) (not b!259345) (not b!259154) (not d!62259) (not d!62291) (not b!259410) (not b!259481) (not b!259405) (not b!259347) (not d!62263) (not b!259213) (not b!259179) (not b!259219) (not b!259223) (not bm!24691) (not b!259417) (not b!259149) (not d!62323) (not d!62381) (not bm!24672) (not d!62371) (not b!259341) (not b!259343) (not d!62221) (not b!259168) (not bm!24694) (not b_next!6747) (not d!62243) (not b!259291) (not d!62337) (not d!62215) (not b!259350) (not b_lambda!8243) (not d!62345) (not d!62275) (not b!259346) (not d!62191) (not b!259236) (not d!62287) (not b!259292) (not d!62373) (not b!259483) (not b!259155) (not d!62295) (not bm!24677) (not b!259247) (not b!259401) (not b!259285) (not d!62365) (not b!259329) (not b!259404) (not d!62359) (not b!259258) (not b!259278) (not bm!24707) (not d!62265) (not b!259480) (not b!259442) (not b_lambda!8249) (not b!259217) (not bm!24682) (not b!259212) (not bm!24708) (not b!259270) (not b!259304) (not b!259455) (not b!259478) (not bm!24698) (not b!259469) (not d!62333) (not d!62261) (not b!259249) (not d!62273) (not d!62247) (not b!259370) (not b!259462) (not b!259448) (not bm!24701) (not d!62205) (not bm!24702) (not b!259290) (not d!62251) (not d!62239) (not d!62317) (not b!259463) (not b!259413) (not bm!24695) (not b!259408) (not d!62363) (not b!259181) (not d!62315) (not d!62277) (not d!62203) (not b!259457) (not b!259424) (not b!259303) (not d!62357) (not b!259351) (not b!259445) (not bm!24680) (not b!259153) (not b!259265) (not b!259485) (not b!259244) (not b!259284) (not d!62289) (not b_lambda!8227) (not bm!24679) (not d!62387) (not bm!24692) (not b!259340) (not d!62281) (not d!62197) (not d!62335) (not d!62313) (not mapNonEmpty!11264) (not d!62233) (not b_lambda!8229) (not b!259399) (not d!62341) (not b!259152) (not b!259403) (not d!62351) (not d!62217) (not d!62269) (not d!62285))
(check-sat b_and!13851 (not b_next!6747))
