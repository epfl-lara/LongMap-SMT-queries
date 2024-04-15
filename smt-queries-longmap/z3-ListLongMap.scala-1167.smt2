; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24868 () Bool)

(assert start!24868)

(declare-fun b!259430 () Bool)

(declare-fun b_free!6751 () Bool)

(declare-fun b_next!6751 () Bool)

(assert (=> b!259430 (= b_free!6751 (not b_next!6751))))

(declare-fun tp!23572 () Bool)

(declare-fun b_and!13827 () Bool)

(assert (=> b!259430 (= tp!23572 b_and!13827)))

(declare-fun b!259412 () Bool)

(declare-datatypes ((Unit!8024 0))(
  ( (Unit!8025) )
))
(declare-fun e!168113 () Unit!8024)

(declare-fun lt!130616 () Unit!8024)

(assert (=> b!259412 (= e!168113 lt!130616)))

(declare-datatypes ((V!8465 0))(
  ( (V!8466 (val!3351 Int)) )
))
(declare-datatypes ((ValueCell!2963 0))(
  ( (ValueCellFull!2963 (v!5455 V!8465)) (EmptyCell!2963) )
))
(declare-datatypes ((array!12569 0))(
  ( (array!12570 (arr!5949 (Array (_ BitVec 32) ValueCell!2963)) (size!6299 (_ BitVec 32))) )
))
(declare-datatypes ((array!12571 0))(
  ( (array!12572 (arr!5950 (Array (_ BitVec 32) (_ BitVec 64))) (size!6300 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3826 0))(
  ( (LongMapFixedSize!3827 (defaultEntry!4786 Int) (mask!11104 (_ BitVec 32)) (extraKeys!4523 (_ BitVec 32)) (zeroValue!4627 V!8465) (minValue!4627 V!8465) (_size!1962 (_ BitVec 32)) (_keys!6963 array!12571) (_values!4769 array!12569) (_vacant!1962 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3826)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!438 (array!12571 array!12569 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) Int) Unit!8024)

(assert (=> b!259412 (= lt!130616 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!438 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)))))

(declare-fun c!44040 () Bool)

(declare-datatypes ((SeekEntryResult!1174 0))(
  ( (MissingZero!1174 (index!6866 (_ BitVec 32))) (Found!1174 (index!6867 (_ BitVec 32))) (Intermediate!1174 (undefined!1986 Bool) (index!6868 (_ BitVec 32)) (x!25093 (_ BitVec 32))) (Undefined!1174) (MissingVacant!1174 (index!6869 (_ BitVec 32))) )
))
(declare-fun lt!130611 () SeekEntryResult!1174)

(get-info :version)

(assert (=> b!259412 (= c!44040 ((_ is MissingZero!1174) lt!130611))))

(declare-fun e!168124 () Bool)

(assert (=> b!259412 e!168124))

(declare-fun b!259413 () Bool)

(declare-fun res!126798 () Bool)

(declare-fun e!168120 () Bool)

(assert (=> b!259413 (=> (not res!126798) (not e!168120))))

(declare-fun call!24693 () Bool)

(assert (=> b!259413 (= res!126798 call!24693)))

(assert (=> b!259413 (= e!168124 e!168120)))

(declare-fun b!259414 () Bool)

(declare-fun res!126796 () Bool)

(declare-fun e!168116 () Bool)

(assert (=> b!259414 (=> (not res!126796) (not e!168116))))

(assert (=> b!259414 (= res!126796 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!259415 () Bool)

(declare-fun e!168121 () Bool)

(declare-fun e!168126 () Bool)

(assert (=> b!259415 (= e!168121 e!168126)))

(declare-fun res!126793 () Bool)

(assert (=> b!259415 (= res!126793 call!24693)))

(assert (=> b!259415 (=> (not res!126793) (not e!168126))))

(declare-fun b!259416 () Bool)

(declare-fun e!168118 () Bool)

(declare-fun tp_is_empty!6613 () Bool)

(assert (=> b!259416 (= e!168118 tp_is_empty!6613)))

(declare-fun b!259417 () Bool)

(assert (=> b!259417 (= e!168121 ((_ is Undefined!1174) lt!130611))))

(declare-fun bm!24689 () Bool)

(declare-fun call!24692 () Bool)

(declare-fun arrayContainsKey!0 (array!12571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24689 (= call!24692 (arrayContainsKey!0 (_keys!6963 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!259418 () Bool)

(assert (=> b!259418 (= e!168126 (not call!24692))))

(declare-fun b!259419 () Bool)

(declare-fun c!44039 () Bool)

(assert (=> b!259419 (= c!44039 ((_ is MissingVacant!1174) lt!130611))))

(assert (=> b!259419 (= e!168124 e!168121)))

(declare-fun b!259420 () Bool)

(declare-fun e!168125 () Unit!8024)

(declare-fun Unit!8026 () Unit!8024)

(assert (=> b!259420 (= e!168125 Unit!8026)))

(declare-fun lt!130606 () Unit!8024)

(declare-fun lemmaArrayContainsKeyThenInListMap!249 (array!12571 array!12569 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) (_ BitVec 32) Int) Unit!8024)

(assert (=> b!259420 (= lt!130606 (lemmaArrayContainsKeyThenInListMap!249 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(assert (=> b!259420 false))

(declare-fun b!259421 () Bool)

(declare-fun e!168119 () Bool)

(declare-fun e!168114 () Bool)

(assert (=> b!259421 (= e!168119 (not e!168114))))

(declare-fun res!126791 () Bool)

(assert (=> b!259421 (=> res!126791 e!168114)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!259421 (= res!126791 (not (validMask!0 (mask!11104 thiss!1504))))))

(declare-fun lt!130608 () array!12571)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12571 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!259421 (= (arrayCountValidKeys!0 lt!130608 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!130610 () Unit!8024)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12571 (_ BitVec 32)) Unit!8024)

(assert (=> b!259421 (= lt!130610 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130608 index!297))))

(assert (=> b!259421 (arrayContainsKey!0 lt!130608 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130612 () Unit!8024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12571 (_ BitVec 64) (_ BitVec 32)) Unit!8024)

(assert (=> b!259421 (= lt!130612 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130608 key!932 index!297))))

(declare-fun v!346 () V!8465)

(declare-datatypes ((tuple2!4888 0))(
  ( (tuple2!4889 (_1!2455 (_ BitVec 64)) (_2!2455 V!8465)) )
))
(declare-datatypes ((List!3787 0))(
  ( (Nil!3784) (Cons!3783 (h!4447 tuple2!4888) (t!8845 List!3787)) )
))
(declare-datatypes ((ListLongMap!3791 0))(
  ( (ListLongMap!3792 (toList!1911 List!3787)) )
))
(declare-fun lt!130615 () ListLongMap!3791)

(declare-fun +!699 (ListLongMap!3791 tuple2!4888) ListLongMap!3791)

(declare-fun getCurrentListMap!1420 (array!12571 array!12569 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 32) Int) ListLongMap!3791)

(assert (=> b!259421 (= (+!699 lt!130615 (tuple2!4889 key!932 v!346)) (getCurrentListMap!1420 lt!130608 (array!12570 (store (arr!5949 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6299 (_values!4769 thiss!1504))) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130609 () Unit!8024)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!110 (array!12571 array!12569 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 32) (_ BitVec 64) V!8465 Int) Unit!8024)

(assert (=> b!259421 (= lt!130609 (lemmaAddValidKeyToArrayThenAddPairToListMap!110 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) index!297 key!932 v!346 (defaultEntry!4786 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12571 (_ BitVec 32)) Bool)

(assert (=> b!259421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130608 (mask!11104 thiss!1504))))

(declare-fun lt!130617 () Unit!8024)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12571 (_ BitVec 32) (_ BitVec 32)) Unit!8024)

(assert (=> b!259421 (= lt!130617 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6963 thiss!1504) index!297 (mask!11104 thiss!1504)))))

(assert (=> b!259421 (= (arrayCountValidKeys!0 lt!130608 #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6963 thiss!1504) #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504)))))))

(declare-fun lt!130605 () Unit!8024)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12571 (_ BitVec 32) (_ BitVec 64)) Unit!8024)

(assert (=> b!259421 (= lt!130605 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6963 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3788 0))(
  ( (Nil!3785) (Cons!3784 (h!4448 (_ BitVec 64)) (t!8846 List!3788)) )
))
(declare-fun arrayNoDuplicates!0 (array!12571 (_ BitVec 32) List!3788) Bool)

(assert (=> b!259421 (arrayNoDuplicates!0 lt!130608 #b00000000000000000000000000000000 Nil!3785)))

(assert (=> b!259421 (= lt!130608 (array!12572 (store (arr!5950 (_keys!6963 thiss!1504)) index!297 key!932) (size!6300 (_keys!6963 thiss!1504))))))

(declare-fun lt!130614 () Unit!8024)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3788) Unit!8024)

(assert (=> b!259421 (= lt!130614 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6963 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3785))))

(declare-fun lt!130613 () Unit!8024)

(assert (=> b!259421 (= lt!130613 e!168125)))

(declare-fun c!44042 () Bool)

(assert (=> b!259421 (= c!44042 (arrayContainsKey!0 (_keys!6963 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!259422 () Bool)

(declare-fun e!168123 () Bool)

(assert (=> b!259422 (= e!168123 e!168119)))

(declare-fun res!126794 () Bool)

(assert (=> b!259422 (=> (not res!126794) (not e!168119))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!259422 (= res!126794 (inRange!0 index!297 (mask!11104 thiss!1504)))))

(declare-fun lt!130607 () Unit!8024)

(assert (=> b!259422 (= lt!130607 e!168113)))

(declare-fun c!44041 () Bool)

(declare-fun contains!1865 (ListLongMap!3791 (_ BitVec 64)) Bool)

(assert (=> b!259422 (= c!44041 (contains!1865 lt!130615 key!932))))

(assert (=> b!259422 (= lt!130615 (getCurrentListMap!1420 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun b!259423 () Bool)

(declare-fun e!168122 () Bool)

(declare-fun e!168127 () Bool)

(declare-fun mapRes!11267 () Bool)

(assert (=> b!259423 (= e!168122 (and e!168127 mapRes!11267))))

(declare-fun condMapEmpty!11267 () Bool)

(declare-fun mapDefault!11267 () ValueCell!2963)

(assert (=> b!259423 (= condMapEmpty!11267 (= (arr!5949 (_values!4769 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2963)) mapDefault!11267)))))

(declare-fun b!259424 () Bool)

(assert (=> b!259424 (= e!168120 (not call!24692))))

(declare-fun b!259425 () Bool)

(assert (=> b!259425 (= e!168114 (or (not (= (size!6299 (_values!4769 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11104 thiss!1504)))) (not (= (size!6300 (_keys!6963 thiss!1504)) (size!6299 (_values!4769 thiss!1504)))) (bvsge (mask!11104 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!11267 () Bool)

(declare-fun tp!23573 () Bool)

(assert (=> mapNonEmpty!11267 (= mapRes!11267 (and tp!23573 e!168118))))

(declare-fun mapRest!11267 () (Array (_ BitVec 32) ValueCell!2963))

(declare-fun mapValue!11267 () ValueCell!2963)

(declare-fun mapKey!11267 () (_ BitVec 32))

(assert (=> mapNonEmpty!11267 (= (arr!5949 (_values!4769 thiss!1504)) (store mapRest!11267 mapKey!11267 mapValue!11267))))

(declare-fun b!259426 () Bool)

(assert (=> b!259426 (= e!168127 tp_is_empty!6613)))

(declare-fun res!126792 () Bool)

(assert (=> start!24868 (=> (not res!126792) (not e!168116))))

(declare-fun valid!1499 (LongMapFixedSize!3826) Bool)

(assert (=> start!24868 (= res!126792 (valid!1499 thiss!1504))))

(assert (=> start!24868 e!168116))

(declare-fun e!168115 () Bool)

(assert (=> start!24868 e!168115))

(assert (=> start!24868 true))

(assert (=> start!24868 tp_is_empty!6613))

(declare-fun b!259427 () Bool)

(declare-fun Unit!8027 () Unit!8024)

(assert (=> b!259427 (= e!168125 Unit!8027)))

(declare-fun mapIsEmpty!11267 () Bool)

(assert (=> mapIsEmpty!11267 mapRes!11267))

(declare-fun bm!24690 () Bool)

(assert (=> bm!24690 (= call!24693 (inRange!0 (ite c!44040 (index!6866 lt!130611) (index!6869 lt!130611)) (mask!11104 thiss!1504)))))

(declare-fun b!259428 () Bool)

(declare-fun res!126790 () Bool)

(assert (=> b!259428 (=> (not res!126790) (not e!168120))))

(assert (=> b!259428 (= res!126790 (= (select (arr!5950 (_keys!6963 thiss!1504)) (index!6866 lt!130611)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259429 () Bool)

(assert (=> b!259429 (= e!168116 e!168123)))

(declare-fun res!126795 () Bool)

(assert (=> b!259429 (=> (not res!126795) (not e!168123))))

(assert (=> b!259429 (= res!126795 (or (= lt!130611 (MissingZero!1174 index!297)) (= lt!130611 (MissingVacant!1174 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12571 (_ BitVec 32)) SeekEntryResult!1174)

(assert (=> b!259429 (= lt!130611 (seekEntryOrOpen!0 key!932 (_keys!6963 thiss!1504) (mask!11104 thiss!1504)))))

(declare-fun array_inv!3937 (array!12571) Bool)

(declare-fun array_inv!3938 (array!12569) Bool)

(assert (=> b!259430 (= e!168115 (and tp!23572 tp_is_empty!6613 (array_inv!3937 (_keys!6963 thiss!1504)) (array_inv!3938 (_values!4769 thiss!1504)) e!168122))))

(declare-fun b!259431 () Bool)

(declare-fun Unit!8028 () Unit!8024)

(assert (=> b!259431 (= e!168113 Unit!8028)))

(declare-fun lt!130604 () Unit!8024)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!435 (array!12571 array!12569 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) Int) Unit!8024)

(assert (=> b!259431 (= lt!130604 (lemmaInListMapThenSeekEntryOrOpenFindsIt!435 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)))))

(assert (=> b!259431 false))

(declare-fun b!259432 () Bool)

(declare-fun res!126797 () Bool)

(assert (=> b!259432 (= res!126797 (= (select (arr!5950 (_keys!6963 thiss!1504)) (index!6869 lt!130611)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259432 (=> (not res!126797) (not e!168126))))

(assert (= (and start!24868 res!126792) b!259414))

(assert (= (and b!259414 res!126796) b!259429))

(assert (= (and b!259429 res!126795) b!259422))

(assert (= (and b!259422 c!44041) b!259431))

(assert (= (and b!259422 (not c!44041)) b!259412))

(assert (= (and b!259412 c!44040) b!259413))

(assert (= (and b!259412 (not c!44040)) b!259419))

(assert (= (and b!259413 res!126798) b!259428))

(assert (= (and b!259428 res!126790) b!259424))

(assert (= (and b!259419 c!44039) b!259415))

(assert (= (and b!259419 (not c!44039)) b!259417))

(assert (= (and b!259415 res!126793) b!259432))

(assert (= (and b!259432 res!126797) b!259418))

(assert (= (or b!259413 b!259415) bm!24690))

(assert (= (or b!259424 b!259418) bm!24689))

(assert (= (and b!259422 res!126794) b!259421))

(assert (= (and b!259421 c!44042) b!259420))

(assert (= (and b!259421 (not c!44042)) b!259427))

(assert (= (and b!259421 (not res!126791)) b!259425))

(assert (= (and b!259423 condMapEmpty!11267) mapIsEmpty!11267))

(assert (= (and b!259423 (not condMapEmpty!11267)) mapNonEmpty!11267))

(assert (= (and mapNonEmpty!11267 ((_ is ValueCellFull!2963) mapValue!11267)) b!259416))

(assert (= (and b!259423 ((_ is ValueCellFull!2963) mapDefault!11267)) b!259426))

(assert (= b!259430 b!259423))

(assert (= start!24868 b!259430))

(declare-fun m!274643 () Bool)

(assert (=> start!24868 m!274643))

(declare-fun m!274645 () Bool)

(assert (=> b!259412 m!274645))

(declare-fun m!274647 () Bool)

(assert (=> b!259429 m!274647))

(declare-fun m!274649 () Bool)

(assert (=> b!259420 m!274649))

(declare-fun m!274651 () Bool)

(assert (=> b!259421 m!274651))

(declare-fun m!274653 () Bool)

(assert (=> b!259421 m!274653))

(declare-fun m!274655 () Bool)

(assert (=> b!259421 m!274655))

(declare-fun m!274657 () Bool)

(assert (=> b!259421 m!274657))

(declare-fun m!274659 () Bool)

(assert (=> b!259421 m!274659))

(declare-fun m!274661 () Bool)

(assert (=> b!259421 m!274661))

(declare-fun m!274663 () Bool)

(assert (=> b!259421 m!274663))

(declare-fun m!274665 () Bool)

(assert (=> b!259421 m!274665))

(declare-fun m!274667 () Bool)

(assert (=> b!259421 m!274667))

(declare-fun m!274669 () Bool)

(assert (=> b!259421 m!274669))

(declare-fun m!274671 () Bool)

(assert (=> b!259421 m!274671))

(declare-fun m!274673 () Bool)

(assert (=> b!259421 m!274673))

(declare-fun m!274675 () Bool)

(assert (=> b!259421 m!274675))

(declare-fun m!274677 () Bool)

(assert (=> b!259421 m!274677))

(declare-fun m!274679 () Bool)

(assert (=> b!259421 m!274679))

(declare-fun m!274681 () Bool)

(assert (=> b!259421 m!274681))

(declare-fun m!274683 () Bool)

(assert (=> b!259421 m!274683))

(declare-fun m!274685 () Bool)

(assert (=> b!259421 m!274685))

(declare-fun m!274687 () Bool)

(assert (=> b!259428 m!274687))

(declare-fun m!274689 () Bool)

(assert (=> b!259432 m!274689))

(declare-fun m!274691 () Bool)

(assert (=> b!259431 m!274691))

(declare-fun m!274693 () Bool)

(assert (=> b!259422 m!274693))

(declare-fun m!274695 () Bool)

(assert (=> b!259422 m!274695))

(declare-fun m!274697 () Bool)

(assert (=> b!259422 m!274697))

(declare-fun m!274699 () Bool)

(assert (=> b!259430 m!274699))

(declare-fun m!274701 () Bool)

(assert (=> b!259430 m!274701))

(declare-fun m!274703 () Bool)

(assert (=> mapNonEmpty!11267 m!274703))

(declare-fun m!274705 () Bool)

(assert (=> bm!24690 m!274705))

(assert (=> bm!24689 m!274651))

(check-sat (not mapNonEmpty!11267) (not bm!24690) (not b!259422) (not b!259431) (not bm!24689) (not b!259421) tp_is_empty!6613 (not b!259430) (not b!259412) b_and!13827 (not b!259420) (not b!259429) (not start!24868) (not b_next!6751))
(check-sat b_and!13827 (not b_next!6751))
(get-model)

(declare-fun d!62243 () Bool)

(assert (=> d!62243 (contains!1865 (getCurrentListMap!1420 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)) key!932)))

(declare-fun lt!130704 () Unit!8024)

(declare-fun choose!1267 (array!12571 array!12569 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) (_ BitVec 32) Int) Unit!8024)

(assert (=> d!62243 (= lt!130704 (choose!1267 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(assert (=> d!62243 (validMask!0 (mask!11104 thiss!1504))))

(assert (=> d!62243 (= (lemmaArrayContainsKeyThenInListMap!249 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)) lt!130704)))

(declare-fun bs!9133 () Bool)

(assert (= bs!9133 d!62243))

(assert (=> bs!9133 m!274697))

(assert (=> bs!9133 m!274697))

(declare-fun m!274835 () Bool)

(assert (=> bs!9133 m!274835))

(declare-fun m!274837 () Bool)

(assert (=> bs!9133 m!274837))

(assert (=> bs!9133 m!274675))

(assert (=> b!259420 d!62243))

(declare-fun d!62245 () Bool)

(assert (=> d!62245 (= (inRange!0 (ite c!44040 (index!6866 lt!130611) (index!6869 lt!130611)) (mask!11104 thiss!1504)) (and (bvsge (ite c!44040 (index!6866 lt!130611) (index!6869 lt!130611)) #b00000000000000000000000000000000) (bvslt (ite c!44040 (index!6866 lt!130611) (index!6869 lt!130611)) (bvadd (mask!11104 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24690 d!62245))

(declare-fun d!62247 () Bool)

(declare-fun e!168220 () Bool)

(assert (=> d!62247 e!168220))

(declare-fun res!126858 () Bool)

(assert (=> d!62247 (=> (not res!126858) (not e!168220))))

(declare-fun lt!130709 () SeekEntryResult!1174)

(assert (=> d!62247 (= res!126858 ((_ is Found!1174) lt!130709))))

(assert (=> d!62247 (= lt!130709 (seekEntryOrOpen!0 key!932 (_keys!6963 thiss!1504) (mask!11104 thiss!1504)))))

(declare-fun lt!130710 () Unit!8024)

(declare-fun choose!1268 (array!12571 array!12569 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) Int) Unit!8024)

(assert (=> d!62247 (= lt!130710 (choose!1268 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)))))

(assert (=> d!62247 (validMask!0 (mask!11104 thiss!1504))))

(assert (=> d!62247 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!435 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)) lt!130710)))

(declare-fun b!259563 () Bool)

(declare-fun res!126857 () Bool)

(assert (=> b!259563 (=> (not res!126857) (not e!168220))))

(assert (=> b!259563 (= res!126857 (inRange!0 (index!6867 lt!130709) (mask!11104 thiss!1504)))))

(declare-fun b!259564 () Bool)

(assert (=> b!259564 (= e!168220 (= (select (arr!5950 (_keys!6963 thiss!1504)) (index!6867 lt!130709)) key!932))))

(assert (=> b!259564 (and (bvsge (index!6867 lt!130709) #b00000000000000000000000000000000) (bvslt (index!6867 lt!130709) (size!6300 (_keys!6963 thiss!1504))))))

(assert (= (and d!62247 res!126858) b!259563))

(assert (= (and b!259563 res!126857) b!259564))

(assert (=> d!62247 m!274647))

(declare-fun m!274839 () Bool)

(assert (=> d!62247 m!274839))

(assert (=> d!62247 m!274675))

(declare-fun m!274841 () Bool)

(assert (=> b!259563 m!274841))

(declare-fun m!274843 () Bool)

(assert (=> b!259564 m!274843))

(assert (=> b!259431 d!62247))

(declare-fun d!62249 () Bool)

(assert (=> d!62249 (= (array_inv!3937 (_keys!6963 thiss!1504)) (bvsge (size!6300 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259430 d!62249))

(declare-fun d!62251 () Bool)

(assert (=> d!62251 (= (array_inv!3938 (_values!4769 thiss!1504)) (bvsge (size!6299 (_values!4769 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259430 d!62251))

(declare-fun d!62253 () Bool)

(declare-fun res!126863 () Bool)

(declare-fun e!168225 () Bool)

(assert (=> d!62253 (=> res!126863 e!168225)))

(assert (=> d!62253 (= res!126863 (= (select (arr!5950 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62253 (= (arrayContainsKey!0 (_keys!6963 thiss!1504) key!932 #b00000000000000000000000000000000) e!168225)))

(declare-fun b!259569 () Bool)

(declare-fun e!168226 () Bool)

(assert (=> b!259569 (= e!168225 e!168226)))

(declare-fun res!126864 () Bool)

(assert (=> b!259569 (=> (not res!126864) (not e!168226))))

(assert (=> b!259569 (= res!126864 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6300 (_keys!6963 thiss!1504))))))

(declare-fun b!259570 () Bool)

(assert (=> b!259570 (= e!168226 (arrayContainsKey!0 (_keys!6963 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62253 (not res!126863)) b!259569))

(assert (= (and b!259569 res!126864) b!259570))

(declare-fun m!274845 () Bool)

(assert (=> d!62253 m!274845))

(declare-fun m!274847 () Bool)

(assert (=> b!259570 m!274847))

(assert (=> bm!24689 d!62253))

(declare-fun d!62255 () Bool)

(assert (=> d!62255 (= (inRange!0 index!297 (mask!11104 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11104 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!259422 d!62255))

(declare-fun d!62257 () Bool)

(declare-fun e!168231 () Bool)

(assert (=> d!62257 e!168231))

(declare-fun res!126867 () Bool)

(assert (=> d!62257 (=> res!126867 e!168231)))

(declare-fun lt!130722 () Bool)

(assert (=> d!62257 (= res!126867 (not lt!130722))))

(declare-fun lt!130720 () Bool)

(assert (=> d!62257 (= lt!130722 lt!130720)))

(declare-fun lt!130721 () Unit!8024)

(declare-fun e!168232 () Unit!8024)

(assert (=> d!62257 (= lt!130721 e!168232)))

(declare-fun c!44069 () Bool)

(assert (=> d!62257 (= c!44069 lt!130720)))

(declare-fun containsKey!305 (List!3787 (_ BitVec 64)) Bool)

(assert (=> d!62257 (= lt!130720 (containsKey!305 (toList!1911 lt!130615) key!932))))

(assert (=> d!62257 (= (contains!1865 lt!130615 key!932) lt!130722)))

(declare-fun b!259577 () Bool)

(declare-fun lt!130719 () Unit!8024)

(assert (=> b!259577 (= e!168232 lt!130719)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!254 (List!3787 (_ BitVec 64)) Unit!8024)

(assert (=> b!259577 (= lt!130719 (lemmaContainsKeyImpliesGetValueByKeyDefined!254 (toList!1911 lt!130615) key!932))))

(declare-datatypes ((Option!319 0))(
  ( (Some!318 (v!5460 V!8465)) (None!317) )
))
(declare-fun isDefined!255 (Option!319) Bool)

(declare-fun getValueByKey!313 (List!3787 (_ BitVec 64)) Option!319)

(assert (=> b!259577 (isDefined!255 (getValueByKey!313 (toList!1911 lt!130615) key!932))))

(declare-fun b!259578 () Bool)

(declare-fun Unit!8034 () Unit!8024)

(assert (=> b!259578 (= e!168232 Unit!8034)))

(declare-fun b!259579 () Bool)

(assert (=> b!259579 (= e!168231 (isDefined!255 (getValueByKey!313 (toList!1911 lt!130615) key!932)))))

(assert (= (and d!62257 c!44069) b!259577))

(assert (= (and d!62257 (not c!44069)) b!259578))

(assert (= (and d!62257 (not res!126867)) b!259579))

(declare-fun m!274849 () Bool)

(assert (=> d!62257 m!274849))

(declare-fun m!274851 () Bool)

(assert (=> b!259577 m!274851))

(declare-fun m!274853 () Bool)

(assert (=> b!259577 m!274853))

(assert (=> b!259577 m!274853))

(declare-fun m!274855 () Bool)

(assert (=> b!259577 m!274855))

(assert (=> b!259579 m!274853))

(assert (=> b!259579 m!274853))

(assert (=> b!259579 m!274855))

(assert (=> b!259422 d!62257))

(declare-fun bm!24717 () Bool)

(declare-fun call!24723 () ListLongMap!3791)

(declare-fun getCurrentListMapNoExtraKeys!573 (array!12571 array!12569 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 32) Int) ListLongMap!3791)

(assert (=> bm!24717 (= call!24723 (getCurrentListMapNoExtraKeys!573 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun b!259622 () Bool)

(declare-fun e!168266 () Bool)

(declare-fun lt!130777 () ListLongMap!3791)

(declare-fun apply!257 (ListLongMap!3791 (_ BitVec 64)) V!8465)

(assert (=> b!259622 (= e!168266 (= (apply!257 lt!130777 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4627 thiss!1504)))))

(declare-fun b!259623 () Bool)

(declare-fun e!168259 () Bool)

(assert (=> b!259623 (= e!168259 e!168266)))

(declare-fun res!126889 () Bool)

(declare-fun call!24726 () Bool)

(assert (=> b!259623 (= res!126889 call!24726)))

(assert (=> b!259623 (=> (not res!126889) (not e!168266))))

(declare-fun b!259624 () Bool)

(declare-fun e!168263 () ListLongMap!3791)

(declare-fun call!24725 () ListLongMap!3791)

(assert (=> b!259624 (= e!168263 call!24725)))

(declare-fun bm!24718 () Bool)

(assert (=> bm!24718 (= call!24726 (contains!1865 lt!130777 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259625 () Bool)

(declare-fun e!168261 () Bool)

(declare-fun get!3062 (ValueCell!2963 V!8465) V!8465)

(declare-fun dynLambda!591 (Int (_ BitVec 64)) V!8465)

(assert (=> b!259625 (= e!168261 (= (apply!257 lt!130777 (select (arr!5950 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000)) (get!3062 (select (arr!5949 (_values!4769 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!591 (defaultEntry!4786 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259625 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 (_values!4769 thiss!1504))))))

(assert (=> b!259625 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))))))

(declare-fun bm!24719 () Bool)

(declare-fun call!24721 () ListLongMap!3791)

(assert (=> bm!24719 (= call!24721 call!24723)))

(declare-fun d!62259 () Bool)

(declare-fun e!168260 () Bool)

(assert (=> d!62259 e!168260))

(declare-fun res!126892 () Bool)

(assert (=> d!62259 (=> (not res!126892) (not e!168260))))

(assert (=> d!62259 (= res!126892 (or (bvsge #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))))))))

(declare-fun lt!130770 () ListLongMap!3791)

(assert (=> d!62259 (= lt!130777 lt!130770)))

(declare-fun lt!130779 () Unit!8024)

(declare-fun e!168270 () Unit!8024)

(assert (=> d!62259 (= lt!130779 e!168270)))

(declare-fun c!44084 () Bool)

(declare-fun e!168264 () Bool)

(assert (=> d!62259 (= c!44084 e!168264)))

(declare-fun res!126886 () Bool)

(assert (=> d!62259 (=> (not res!126886) (not e!168264))))

(assert (=> d!62259 (= res!126886 (bvslt #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))))))

(declare-fun e!168267 () ListLongMap!3791)

(assert (=> d!62259 (= lt!130770 e!168267)))

(declare-fun c!44087 () Bool)

(assert (=> d!62259 (= c!44087 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62259 (validMask!0 (mask!11104 thiss!1504))))

(assert (=> d!62259 (= (getCurrentListMap!1420 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)) lt!130777)))

(declare-fun b!259626 () Bool)

(declare-fun e!168269 () Bool)

(declare-fun call!24722 () Bool)

(assert (=> b!259626 (= e!168269 (not call!24722))))

(declare-fun b!259627 () Bool)

(declare-fun e!168268 () ListLongMap!3791)

(assert (=> b!259627 (= e!168268 call!24725)))

(declare-fun b!259628 () Bool)

(declare-fun res!126887 () Bool)

(assert (=> b!259628 (=> (not res!126887) (not e!168260))))

(declare-fun e!168271 () Bool)

(assert (=> b!259628 (= res!126887 e!168271)))

(declare-fun res!126893 () Bool)

(assert (=> b!259628 (=> res!126893 e!168271)))

(declare-fun e!168262 () Bool)

(assert (=> b!259628 (= res!126893 (not e!168262))))

(declare-fun res!126894 () Bool)

(assert (=> b!259628 (=> (not res!126894) (not e!168262))))

(assert (=> b!259628 (= res!126894 (bvslt #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))))))

(declare-fun b!259629 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!259629 (= e!168264 (validKeyInArray!0 (select (arr!5950 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259630 () Bool)

(declare-fun call!24724 () ListLongMap!3791)

(assert (=> b!259630 (= e!168268 call!24724)))

(declare-fun b!259631 () Bool)

(declare-fun e!168265 () Bool)

(assert (=> b!259631 (= e!168269 e!168265)))

(declare-fun res!126888 () Bool)

(assert (=> b!259631 (= res!126888 call!24722)))

(assert (=> b!259631 (=> (not res!126888) (not e!168265))))

(declare-fun b!259632 () Bool)

(assert (=> b!259632 (= e!168265 (= (apply!257 lt!130777 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4627 thiss!1504)))))

(declare-fun b!259633 () Bool)

(declare-fun c!44082 () Bool)

(assert (=> b!259633 (= c!44082 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!259633 (= e!168263 e!168268)))

(declare-fun b!259634 () Bool)

(assert (=> b!259634 (= e!168267 e!168263)))

(declare-fun c!44086 () Bool)

(assert (=> b!259634 (= c!44086 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259635 () Bool)

(declare-fun Unit!8035 () Unit!8024)

(assert (=> b!259635 (= e!168270 Unit!8035)))

(declare-fun b!259636 () Bool)

(declare-fun lt!130784 () Unit!8024)

(assert (=> b!259636 (= e!168270 lt!130784)))

(declare-fun lt!130778 () ListLongMap!3791)

(assert (=> b!259636 (= lt!130778 (getCurrentListMapNoExtraKeys!573 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130783 () (_ BitVec 64))

(assert (=> b!259636 (= lt!130783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130782 () (_ BitVec 64))

(assert (=> b!259636 (= lt!130782 (select (arr!5950 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130776 () Unit!8024)

(declare-fun addStillContains!233 (ListLongMap!3791 (_ BitVec 64) V!8465 (_ BitVec 64)) Unit!8024)

(assert (=> b!259636 (= lt!130776 (addStillContains!233 lt!130778 lt!130783 (zeroValue!4627 thiss!1504) lt!130782))))

(assert (=> b!259636 (contains!1865 (+!699 lt!130778 (tuple2!4889 lt!130783 (zeroValue!4627 thiss!1504))) lt!130782)))

(declare-fun lt!130787 () Unit!8024)

(assert (=> b!259636 (= lt!130787 lt!130776)))

(declare-fun lt!130780 () ListLongMap!3791)

(assert (=> b!259636 (= lt!130780 (getCurrentListMapNoExtraKeys!573 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130786 () (_ BitVec 64))

(assert (=> b!259636 (= lt!130786 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130788 () (_ BitVec 64))

(assert (=> b!259636 (= lt!130788 (select (arr!5950 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130768 () Unit!8024)

(declare-fun addApplyDifferent!233 (ListLongMap!3791 (_ BitVec 64) V!8465 (_ BitVec 64)) Unit!8024)

(assert (=> b!259636 (= lt!130768 (addApplyDifferent!233 lt!130780 lt!130786 (minValue!4627 thiss!1504) lt!130788))))

(assert (=> b!259636 (= (apply!257 (+!699 lt!130780 (tuple2!4889 lt!130786 (minValue!4627 thiss!1504))) lt!130788) (apply!257 lt!130780 lt!130788))))

(declare-fun lt!130771 () Unit!8024)

(assert (=> b!259636 (= lt!130771 lt!130768)))

(declare-fun lt!130767 () ListLongMap!3791)

(assert (=> b!259636 (= lt!130767 (getCurrentListMapNoExtraKeys!573 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130775 () (_ BitVec 64))

(assert (=> b!259636 (= lt!130775 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130773 () (_ BitVec 64))

(assert (=> b!259636 (= lt!130773 (select (arr!5950 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!130769 () Unit!8024)

(assert (=> b!259636 (= lt!130769 (addApplyDifferent!233 lt!130767 lt!130775 (zeroValue!4627 thiss!1504) lt!130773))))

(assert (=> b!259636 (= (apply!257 (+!699 lt!130767 (tuple2!4889 lt!130775 (zeroValue!4627 thiss!1504))) lt!130773) (apply!257 lt!130767 lt!130773))))

(declare-fun lt!130781 () Unit!8024)

(assert (=> b!259636 (= lt!130781 lt!130769)))

(declare-fun lt!130785 () ListLongMap!3791)

(assert (=> b!259636 (= lt!130785 (getCurrentListMapNoExtraKeys!573 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130772 () (_ BitVec 64))

(assert (=> b!259636 (= lt!130772 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130774 () (_ BitVec 64))

(assert (=> b!259636 (= lt!130774 (select (arr!5950 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259636 (= lt!130784 (addApplyDifferent!233 lt!130785 lt!130772 (minValue!4627 thiss!1504) lt!130774))))

(assert (=> b!259636 (= (apply!257 (+!699 lt!130785 (tuple2!4889 lt!130772 (minValue!4627 thiss!1504))) lt!130774) (apply!257 lt!130785 lt!130774))))

(declare-fun bm!24720 () Bool)

(assert (=> bm!24720 (= call!24722 (contains!1865 lt!130777 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!24720 () ListLongMap!3791)

(declare-fun bm!24721 () Bool)

(assert (=> bm!24721 (= call!24720 (+!699 (ite c!44087 call!24723 (ite c!44086 call!24721 call!24724)) (ite (or c!44087 c!44086) (tuple2!4889 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4627 thiss!1504)) (tuple2!4889 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4627 thiss!1504)))))))

(declare-fun bm!24722 () Bool)

(assert (=> bm!24722 (= call!24725 call!24720)))

(declare-fun b!259637 () Bool)

(assert (=> b!259637 (= e!168260 e!168259)))

(declare-fun c!44085 () Bool)

(assert (=> b!259637 (= c!44085 (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259638 () Bool)

(assert (=> b!259638 (= e!168259 (not call!24726))))

(declare-fun b!259639 () Bool)

(assert (=> b!259639 (= e!168271 e!168261)))

(declare-fun res!126890 () Bool)

(assert (=> b!259639 (=> (not res!126890) (not e!168261))))

(assert (=> b!259639 (= res!126890 (contains!1865 lt!130777 (select (arr!5950 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!259639 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))))))

(declare-fun b!259640 () Bool)

(assert (=> b!259640 (= e!168262 (validKeyInArray!0 (select (arr!5950 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259641 () Bool)

(assert (=> b!259641 (= e!168267 (+!699 call!24720 (tuple2!4889 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4627 thiss!1504))))))

(declare-fun b!259642 () Bool)

(declare-fun res!126891 () Bool)

(assert (=> b!259642 (=> (not res!126891) (not e!168260))))

(assert (=> b!259642 (= res!126891 e!168269)))

(declare-fun c!44083 () Bool)

(assert (=> b!259642 (= c!44083 (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24723 () Bool)

(assert (=> bm!24723 (= call!24724 call!24721)))

(assert (= (and d!62259 c!44087) b!259641))

(assert (= (and d!62259 (not c!44087)) b!259634))

(assert (= (and b!259634 c!44086) b!259624))

(assert (= (and b!259634 (not c!44086)) b!259633))

(assert (= (and b!259633 c!44082) b!259627))

(assert (= (and b!259633 (not c!44082)) b!259630))

(assert (= (or b!259627 b!259630) bm!24723))

(assert (= (or b!259624 bm!24723) bm!24719))

(assert (= (or b!259624 b!259627) bm!24722))

(assert (= (or b!259641 bm!24719) bm!24717))

(assert (= (or b!259641 bm!24722) bm!24721))

(assert (= (and d!62259 res!126886) b!259629))

(assert (= (and d!62259 c!44084) b!259636))

(assert (= (and d!62259 (not c!44084)) b!259635))

(assert (= (and d!62259 res!126892) b!259628))

(assert (= (and b!259628 res!126894) b!259640))

(assert (= (and b!259628 (not res!126893)) b!259639))

(assert (= (and b!259639 res!126890) b!259625))

(assert (= (and b!259628 res!126887) b!259642))

(assert (= (and b!259642 c!44083) b!259631))

(assert (= (and b!259642 (not c!44083)) b!259626))

(assert (= (and b!259631 res!126888) b!259632))

(assert (= (or b!259631 b!259626) bm!24720))

(assert (= (and b!259642 res!126891) b!259637))

(assert (= (and b!259637 c!44085) b!259623))

(assert (= (and b!259637 (not c!44085)) b!259638))

(assert (= (and b!259623 res!126889) b!259622))

(assert (= (or b!259623 b!259638) bm!24718))

(declare-fun b_lambda!8233 () Bool)

(assert (=> (not b_lambda!8233) (not b!259625)))

(declare-fun t!8851 () Bool)

(declare-fun tb!3019 () Bool)

(assert (=> (and b!259430 (= (defaultEntry!4786 thiss!1504) (defaultEntry!4786 thiss!1504)) t!8851) tb!3019))

(declare-fun result!5395 () Bool)

(assert (=> tb!3019 (= result!5395 tp_is_empty!6613)))

(assert (=> b!259625 t!8851))

(declare-fun b_and!13833 () Bool)

(assert (= b_and!13827 (and (=> t!8851 result!5395) b_and!13833)))

(declare-fun m!274857 () Bool)

(assert (=> b!259622 m!274857))

(declare-fun m!274859 () Bool)

(assert (=> bm!24720 m!274859))

(assert (=> b!259639 m!274845))

(assert (=> b!259639 m!274845))

(declare-fun m!274861 () Bool)

(assert (=> b!259639 m!274861))

(declare-fun m!274863 () Bool)

(assert (=> b!259625 m!274863))

(declare-fun m!274865 () Bool)

(assert (=> b!259625 m!274865))

(assert (=> b!259625 m!274863))

(declare-fun m!274867 () Bool)

(assert (=> b!259625 m!274867))

(assert (=> b!259625 m!274865))

(assert (=> b!259625 m!274845))

(declare-fun m!274869 () Bool)

(assert (=> b!259625 m!274869))

(assert (=> b!259625 m!274845))

(declare-fun m!274871 () Bool)

(assert (=> bm!24717 m!274871))

(declare-fun m!274873 () Bool)

(assert (=> b!259632 m!274873))

(declare-fun m!274875 () Bool)

(assert (=> bm!24718 m!274875))

(assert (=> b!259636 m!274871))

(declare-fun m!274877 () Bool)

(assert (=> b!259636 m!274877))

(declare-fun m!274879 () Bool)

(assert (=> b!259636 m!274879))

(declare-fun m!274881 () Bool)

(assert (=> b!259636 m!274881))

(declare-fun m!274883 () Bool)

(assert (=> b!259636 m!274883))

(declare-fun m!274885 () Bool)

(assert (=> b!259636 m!274885))

(declare-fun m!274887 () Bool)

(assert (=> b!259636 m!274887))

(declare-fun m!274889 () Bool)

(assert (=> b!259636 m!274889))

(declare-fun m!274891 () Bool)

(assert (=> b!259636 m!274891))

(declare-fun m!274893 () Bool)

(assert (=> b!259636 m!274893))

(assert (=> b!259636 m!274893))

(declare-fun m!274895 () Bool)

(assert (=> b!259636 m!274895))

(declare-fun m!274897 () Bool)

(assert (=> b!259636 m!274897))

(assert (=> b!259636 m!274887))

(declare-fun m!274899 () Bool)

(assert (=> b!259636 m!274899))

(assert (=> b!259636 m!274877))

(assert (=> b!259636 m!274845))

(declare-fun m!274901 () Bool)

(assert (=> b!259636 m!274901))

(declare-fun m!274903 () Bool)

(assert (=> b!259636 m!274903))

(declare-fun m!274905 () Bool)

(assert (=> b!259636 m!274905))

(assert (=> b!259636 m!274901))

(assert (=> b!259640 m!274845))

(assert (=> b!259640 m!274845))

(declare-fun m!274907 () Bool)

(assert (=> b!259640 m!274907))

(assert (=> d!62259 m!274675))

(assert (=> b!259629 m!274845))

(assert (=> b!259629 m!274845))

(assert (=> b!259629 m!274907))

(declare-fun m!274909 () Bool)

(assert (=> bm!24721 m!274909))

(declare-fun m!274911 () Bool)

(assert (=> b!259641 m!274911))

(assert (=> b!259422 d!62259))

(declare-fun b!259661 () Bool)

(declare-fun lt!130793 () SeekEntryResult!1174)

(assert (=> b!259661 (and (bvsge (index!6866 lt!130793) #b00000000000000000000000000000000) (bvslt (index!6866 lt!130793) (size!6300 (_keys!6963 thiss!1504))))))

(declare-fun res!126906 () Bool)

(assert (=> b!259661 (= res!126906 (= (select (arr!5950 (_keys!6963 thiss!1504)) (index!6866 lt!130793)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168281 () Bool)

(assert (=> b!259661 (=> (not res!126906) (not e!168281))))

(declare-fun b!259662 () Bool)

(declare-fun call!24732 () Bool)

(assert (=> b!259662 (= e!168281 (not call!24732))))

(declare-fun b!259663 () Bool)

(declare-fun res!126903 () Bool)

(declare-fun e!168283 () Bool)

(assert (=> b!259663 (=> (not res!126903) (not e!168283))))

(declare-fun call!24731 () Bool)

(assert (=> b!259663 (= res!126903 call!24731)))

(declare-fun e!168282 () Bool)

(assert (=> b!259663 (= e!168282 e!168283)))

(declare-fun bm!24728 () Bool)

(assert (=> bm!24728 (= call!24732 (arrayContainsKey!0 (_keys!6963 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24729 () Bool)

(declare-fun c!44092 () Bool)

(assert (=> bm!24729 (= call!24731 (inRange!0 (ite c!44092 (index!6866 lt!130793) (index!6869 lt!130793)) (mask!11104 thiss!1504)))))

(declare-fun b!259665 () Bool)

(declare-fun e!168280 () Bool)

(assert (=> b!259665 (= e!168280 e!168282)))

(declare-fun c!44093 () Bool)

(assert (=> b!259665 (= c!44093 ((_ is MissingVacant!1174) lt!130793))))

(declare-fun b!259666 () Bool)

(declare-fun res!126905 () Bool)

(assert (=> b!259666 (=> (not res!126905) (not e!168283))))

(assert (=> b!259666 (= res!126905 (= (select (arr!5950 (_keys!6963 thiss!1504)) (index!6869 lt!130793)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!259666 (and (bvsge (index!6869 lt!130793) #b00000000000000000000000000000000) (bvslt (index!6869 lt!130793) (size!6300 (_keys!6963 thiss!1504))))))

(declare-fun b!259667 () Bool)

(assert (=> b!259667 (= e!168280 e!168281)))

(declare-fun res!126904 () Bool)

(assert (=> b!259667 (= res!126904 call!24731)))

(assert (=> b!259667 (=> (not res!126904) (not e!168281))))

(declare-fun b!259668 () Bool)

(assert (=> b!259668 (= e!168283 (not call!24732))))

(declare-fun b!259664 () Bool)

(assert (=> b!259664 (= e!168282 ((_ is Undefined!1174) lt!130793))))

(declare-fun d!62261 () Bool)

(assert (=> d!62261 e!168280))

(assert (=> d!62261 (= c!44092 ((_ is MissingZero!1174) lt!130793))))

(assert (=> d!62261 (= lt!130793 (seekEntryOrOpen!0 key!932 (_keys!6963 thiss!1504) (mask!11104 thiss!1504)))))

(declare-fun lt!130794 () Unit!8024)

(declare-fun choose!1269 (array!12571 array!12569 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 64) Int) Unit!8024)

(assert (=> d!62261 (= lt!130794 (choose!1269 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)))))

(assert (=> d!62261 (validMask!0 (mask!11104 thiss!1504))))

(assert (=> d!62261 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!438 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) key!932 (defaultEntry!4786 thiss!1504)) lt!130794)))

(assert (= (and d!62261 c!44092) b!259667))

(assert (= (and d!62261 (not c!44092)) b!259665))

(assert (= (and b!259667 res!126904) b!259661))

(assert (= (and b!259661 res!126906) b!259662))

(assert (= (and b!259665 c!44093) b!259663))

(assert (= (and b!259665 (not c!44093)) b!259664))

(assert (= (and b!259663 res!126903) b!259666))

(assert (= (and b!259666 res!126905) b!259668))

(assert (= (or b!259667 b!259663) bm!24729))

(assert (= (or b!259662 b!259668) bm!24728))

(declare-fun m!274913 () Bool)

(assert (=> bm!24729 m!274913))

(assert (=> d!62261 m!274647))

(declare-fun m!274915 () Bool)

(assert (=> d!62261 m!274915))

(assert (=> d!62261 m!274675))

(assert (=> bm!24728 m!274651))

(declare-fun m!274917 () Bool)

(assert (=> b!259661 m!274917))

(declare-fun m!274919 () Bool)

(assert (=> b!259666 m!274919))

(assert (=> b!259412 d!62261))

(declare-fun d!62263 () Bool)

(declare-fun lt!130803 () SeekEntryResult!1174)

(assert (=> d!62263 (and (or ((_ is Undefined!1174) lt!130803) (not ((_ is Found!1174) lt!130803)) (and (bvsge (index!6867 lt!130803) #b00000000000000000000000000000000) (bvslt (index!6867 lt!130803) (size!6300 (_keys!6963 thiss!1504))))) (or ((_ is Undefined!1174) lt!130803) ((_ is Found!1174) lt!130803) (not ((_ is MissingZero!1174) lt!130803)) (and (bvsge (index!6866 lt!130803) #b00000000000000000000000000000000) (bvslt (index!6866 lt!130803) (size!6300 (_keys!6963 thiss!1504))))) (or ((_ is Undefined!1174) lt!130803) ((_ is Found!1174) lt!130803) ((_ is MissingZero!1174) lt!130803) (not ((_ is MissingVacant!1174) lt!130803)) (and (bvsge (index!6869 lt!130803) #b00000000000000000000000000000000) (bvslt (index!6869 lt!130803) (size!6300 (_keys!6963 thiss!1504))))) (or ((_ is Undefined!1174) lt!130803) (ite ((_ is Found!1174) lt!130803) (= (select (arr!5950 (_keys!6963 thiss!1504)) (index!6867 lt!130803)) key!932) (ite ((_ is MissingZero!1174) lt!130803) (= (select (arr!5950 (_keys!6963 thiss!1504)) (index!6866 lt!130803)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1174) lt!130803) (= (select (arr!5950 (_keys!6963 thiss!1504)) (index!6869 lt!130803)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!168292 () SeekEntryResult!1174)

(assert (=> d!62263 (= lt!130803 e!168292)))

(declare-fun c!44100 () Bool)

(declare-fun lt!130801 () SeekEntryResult!1174)

(assert (=> d!62263 (= c!44100 (and ((_ is Intermediate!1174) lt!130801) (undefined!1986 lt!130801)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12571 (_ BitVec 32)) SeekEntryResult!1174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62263 (= lt!130801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11104 thiss!1504)) key!932 (_keys!6963 thiss!1504) (mask!11104 thiss!1504)))))

(assert (=> d!62263 (validMask!0 (mask!11104 thiss!1504))))

(assert (=> d!62263 (= (seekEntryOrOpen!0 key!932 (_keys!6963 thiss!1504) (mask!11104 thiss!1504)) lt!130803)))

(declare-fun b!259681 () Bool)

(assert (=> b!259681 (= e!168292 Undefined!1174)))

(declare-fun b!259682 () Bool)

(declare-fun c!44101 () Bool)

(declare-fun lt!130802 () (_ BitVec 64))

(assert (=> b!259682 (= c!44101 (= lt!130802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168290 () SeekEntryResult!1174)

(declare-fun e!168291 () SeekEntryResult!1174)

(assert (=> b!259682 (= e!168290 e!168291)))

(declare-fun b!259683 () Bool)

(assert (=> b!259683 (= e!168290 (Found!1174 (index!6868 lt!130801)))))

(declare-fun b!259684 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12571 (_ BitVec 32)) SeekEntryResult!1174)

(assert (=> b!259684 (= e!168291 (seekKeyOrZeroReturnVacant!0 (x!25093 lt!130801) (index!6868 lt!130801) (index!6868 lt!130801) key!932 (_keys!6963 thiss!1504) (mask!11104 thiss!1504)))))

(declare-fun b!259685 () Bool)

(assert (=> b!259685 (= e!168292 e!168290)))

(assert (=> b!259685 (= lt!130802 (select (arr!5950 (_keys!6963 thiss!1504)) (index!6868 lt!130801)))))

(declare-fun c!44102 () Bool)

(assert (=> b!259685 (= c!44102 (= lt!130802 key!932))))

(declare-fun b!259686 () Bool)

(assert (=> b!259686 (= e!168291 (MissingZero!1174 (index!6868 lt!130801)))))

(assert (= (and d!62263 c!44100) b!259681))

(assert (= (and d!62263 (not c!44100)) b!259685))

(assert (= (and b!259685 c!44102) b!259683))

(assert (= (and b!259685 (not c!44102)) b!259682))

(assert (= (and b!259682 c!44101) b!259686))

(assert (= (and b!259682 (not c!44101)) b!259684))

(assert (=> d!62263 m!274675))

(declare-fun m!274921 () Bool)

(assert (=> d!62263 m!274921))

(declare-fun m!274923 () Bool)

(assert (=> d!62263 m!274923))

(declare-fun m!274925 () Bool)

(assert (=> d!62263 m!274925))

(assert (=> d!62263 m!274925))

(declare-fun m!274927 () Bool)

(assert (=> d!62263 m!274927))

(declare-fun m!274929 () Bool)

(assert (=> d!62263 m!274929))

(declare-fun m!274931 () Bool)

(assert (=> b!259684 m!274931))

(declare-fun m!274933 () Bool)

(assert (=> b!259685 m!274933))

(assert (=> b!259429 d!62263))

(declare-fun bm!24730 () Bool)

(declare-fun call!24736 () ListLongMap!3791)

(assert (=> bm!24730 (= call!24736 (getCurrentListMapNoExtraKeys!573 lt!130608 (array!12570 (store (arr!5949 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6299 (_values!4769 thiss!1504))) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun b!259687 () Bool)

(declare-fun e!168300 () Bool)

(declare-fun lt!130814 () ListLongMap!3791)

(assert (=> b!259687 (= e!168300 (= (apply!257 lt!130814 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4627 thiss!1504)))))

(declare-fun b!259688 () Bool)

(declare-fun e!168293 () Bool)

(assert (=> b!259688 (= e!168293 e!168300)))

(declare-fun res!126910 () Bool)

(declare-fun call!24739 () Bool)

(assert (=> b!259688 (= res!126910 call!24739)))

(assert (=> b!259688 (=> (not res!126910) (not e!168300))))

(declare-fun b!259689 () Bool)

(declare-fun e!168297 () ListLongMap!3791)

(declare-fun call!24738 () ListLongMap!3791)

(assert (=> b!259689 (= e!168297 call!24738)))

(declare-fun bm!24731 () Bool)

(assert (=> bm!24731 (= call!24739 (contains!1865 lt!130814 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!259690 () Bool)

(declare-fun e!168295 () Bool)

(assert (=> b!259690 (= e!168295 (= (apply!257 lt!130814 (select (arr!5950 lt!130608) #b00000000000000000000000000000000)) (get!3062 (select (arr!5949 (array!12570 (store (arr!5949 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6299 (_values!4769 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!591 (defaultEntry!4786 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!259690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6299 (array!12570 (store (arr!5949 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6299 (_values!4769 thiss!1504))))))))

(assert (=> b!259690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6300 lt!130608)))))

(declare-fun bm!24732 () Bool)

(declare-fun call!24734 () ListLongMap!3791)

(assert (=> bm!24732 (= call!24734 call!24736)))

(declare-fun d!62265 () Bool)

(declare-fun e!168294 () Bool)

(assert (=> d!62265 e!168294))

(declare-fun res!126913 () Bool)

(assert (=> d!62265 (=> (not res!126913) (not e!168294))))

(assert (=> d!62265 (= res!126913 (or (bvsge #b00000000000000000000000000000000 (size!6300 lt!130608)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6300 lt!130608)))))))

(declare-fun lt!130807 () ListLongMap!3791)

(assert (=> d!62265 (= lt!130814 lt!130807)))

(declare-fun lt!130816 () Unit!8024)

(declare-fun e!168304 () Unit!8024)

(assert (=> d!62265 (= lt!130816 e!168304)))

(declare-fun c!44105 () Bool)

(declare-fun e!168298 () Bool)

(assert (=> d!62265 (= c!44105 e!168298)))

(declare-fun res!126907 () Bool)

(assert (=> d!62265 (=> (not res!126907) (not e!168298))))

(assert (=> d!62265 (= res!126907 (bvslt #b00000000000000000000000000000000 (size!6300 lt!130608)))))

(declare-fun e!168301 () ListLongMap!3791)

(assert (=> d!62265 (= lt!130807 e!168301)))

(declare-fun c!44108 () Bool)

(assert (=> d!62265 (= c!44108 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62265 (validMask!0 (mask!11104 thiss!1504))))

(assert (=> d!62265 (= (getCurrentListMap!1420 lt!130608 (array!12570 (store (arr!5949 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6299 (_values!4769 thiss!1504))) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)) lt!130814)))

(declare-fun b!259691 () Bool)

(declare-fun e!168303 () Bool)

(declare-fun call!24735 () Bool)

(assert (=> b!259691 (= e!168303 (not call!24735))))

(declare-fun b!259692 () Bool)

(declare-fun e!168302 () ListLongMap!3791)

(assert (=> b!259692 (= e!168302 call!24738)))

(declare-fun b!259693 () Bool)

(declare-fun res!126908 () Bool)

(assert (=> b!259693 (=> (not res!126908) (not e!168294))))

(declare-fun e!168305 () Bool)

(assert (=> b!259693 (= res!126908 e!168305)))

(declare-fun res!126914 () Bool)

(assert (=> b!259693 (=> res!126914 e!168305)))

(declare-fun e!168296 () Bool)

(assert (=> b!259693 (= res!126914 (not e!168296))))

(declare-fun res!126915 () Bool)

(assert (=> b!259693 (=> (not res!126915) (not e!168296))))

(assert (=> b!259693 (= res!126915 (bvslt #b00000000000000000000000000000000 (size!6300 lt!130608)))))

(declare-fun b!259694 () Bool)

(assert (=> b!259694 (= e!168298 (validKeyInArray!0 (select (arr!5950 lt!130608) #b00000000000000000000000000000000)))))

(declare-fun b!259695 () Bool)

(declare-fun call!24737 () ListLongMap!3791)

(assert (=> b!259695 (= e!168302 call!24737)))

(declare-fun b!259696 () Bool)

(declare-fun e!168299 () Bool)

(assert (=> b!259696 (= e!168303 e!168299)))

(declare-fun res!126909 () Bool)

(assert (=> b!259696 (= res!126909 call!24735)))

(assert (=> b!259696 (=> (not res!126909) (not e!168299))))

(declare-fun b!259697 () Bool)

(assert (=> b!259697 (= e!168299 (= (apply!257 lt!130814 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4627 thiss!1504)))))

(declare-fun b!259698 () Bool)

(declare-fun c!44103 () Bool)

(assert (=> b!259698 (= c!44103 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!259698 (= e!168297 e!168302)))

(declare-fun b!259699 () Bool)

(assert (=> b!259699 (= e!168301 e!168297)))

(declare-fun c!44107 () Bool)

(assert (=> b!259699 (= c!44107 (and (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259700 () Bool)

(declare-fun Unit!8036 () Unit!8024)

(assert (=> b!259700 (= e!168304 Unit!8036)))

(declare-fun b!259701 () Bool)

(declare-fun lt!130821 () Unit!8024)

(assert (=> b!259701 (= e!168304 lt!130821)))

(declare-fun lt!130815 () ListLongMap!3791)

(assert (=> b!259701 (= lt!130815 (getCurrentListMapNoExtraKeys!573 lt!130608 (array!12570 (store (arr!5949 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6299 (_values!4769 thiss!1504))) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130820 () (_ BitVec 64))

(assert (=> b!259701 (= lt!130820 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130819 () (_ BitVec 64))

(assert (=> b!259701 (= lt!130819 (select (arr!5950 lt!130608) #b00000000000000000000000000000000))))

(declare-fun lt!130813 () Unit!8024)

(assert (=> b!259701 (= lt!130813 (addStillContains!233 lt!130815 lt!130820 (zeroValue!4627 thiss!1504) lt!130819))))

(assert (=> b!259701 (contains!1865 (+!699 lt!130815 (tuple2!4889 lt!130820 (zeroValue!4627 thiss!1504))) lt!130819)))

(declare-fun lt!130824 () Unit!8024)

(assert (=> b!259701 (= lt!130824 lt!130813)))

(declare-fun lt!130817 () ListLongMap!3791)

(assert (=> b!259701 (= lt!130817 (getCurrentListMapNoExtraKeys!573 lt!130608 (array!12570 (store (arr!5949 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6299 (_values!4769 thiss!1504))) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130823 () (_ BitVec 64))

(assert (=> b!259701 (= lt!130823 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130825 () (_ BitVec 64))

(assert (=> b!259701 (= lt!130825 (select (arr!5950 lt!130608) #b00000000000000000000000000000000))))

(declare-fun lt!130805 () Unit!8024)

(assert (=> b!259701 (= lt!130805 (addApplyDifferent!233 lt!130817 lt!130823 (minValue!4627 thiss!1504) lt!130825))))

(assert (=> b!259701 (= (apply!257 (+!699 lt!130817 (tuple2!4889 lt!130823 (minValue!4627 thiss!1504))) lt!130825) (apply!257 lt!130817 lt!130825))))

(declare-fun lt!130808 () Unit!8024)

(assert (=> b!259701 (= lt!130808 lt!130805)))

(declare-fun lt!130804 () ListLongMap!3791)

(assert (=> b!259701 (= lt!130804 (getCurrentListMapNoExtraKeys!573 lt!130608 (array!12570 (store (arr!5949 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6299 (_values!4769 thiss!1504))) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130812 () (_ BitVec 64))

(assert (=> b!259701 (= lt!130812 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130810 () (_ BitVec 64))

(assert (=> b!259701 (= lt!130810 (select (arr!5950 lt!130608) #b00000000000000000000000000000000))))

(declare-fun lt!130806 () Unit!8024)

(assert (=> b!259701 (= lt!130806 (addApplyDifferent!233 lt!130804 lt!130812 (zeroValue!4627 thiss!1504) lt!130810))))

(assert (=> b!259701 (= (apply!257 (+!699 lt!130804 (tuple2!4889 lt!130812 (zeroValue!4627 thiss!1504))) lt!130810) (apply!257 lt!130804 lt!130810))))

(declare-fun lt!130818 () Unit!8024)

(assert (=> b!259701 (= lt!130818 lt!130806)))

(declare-fun lt!130822 () ListLongMap!3791)

(assert (=> b!259701 (= lt!130822 (getCurrentListMapNoExtraKeys!573 lt!130608 (array!12570 (store (arr!5949 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6299 (_values!4769 thiss!1504))) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)))))

(declare-fun lt!130809 () (_ BitVec 64))

(assert (=> b!259701 (= lt!130809 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!130811 () (_ BitVec 64))

(assert (=> b!259701 (= lt!130811 (select (arr!5950 lt!130608) #b00000000000000000000000000000000))))

(assert (=> b!259701 (= lt!130821 (addApplyDifferent!233 lt!130822 lt!130809 (minValue!4627 thiss!1504) lt!130811))))

(assert (=> b!259701 (= (apply!257 (+!699 lt!130822 (tuple2!4889 lt!130809 (minValue!4627 thiss!1504))) lt!130811) (apply!257 lt!130822 lt!130811))))

(declare-fun bm!24733 () Bool)

(assert (=> bm!24733 (= call!24735 (contains!1865 lt!130814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!24733 () ListLongMap!3791)

(declare-fun bm!24734 () Bool)

(assert (=> bm!24734 (= call!24733 (+!699 (ite c!44108 call!24736 (ite c!44107 call!24734 call!24737)) (ite (or c!44108 c!44107) (tuple2!4889 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4627 thiss!1504)) (tuple2!4889 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4627 thiss!1504)))))))

(declare-fun bm!24735 () Bool)

(assert (=> bm!24735 (= call!24738 call!24733)))

(declare-fun b!259702 () Bool)

(assert (=> b!259702 (= e!168294 e!168293)))

(declare-fun c!44106 () Bool)

(assert (=> b!259702 (= c!44106 (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!259703 () Bool)

(assert (=> b!259703 (= e!168293 (not call!24739))))

(declare-fun b!259704 () Bool)

(assert (=> b!259704 (= e!168305 e!168295)))

(declare-fun res!126911 () Bool)

(assert (=> b!259704 (=> (not res!126911) (not e!168295))))

(assert (=> b!259704 (= res!126911 (contains!1865 lt!130814 (select (arr!5950 lt!130608) #b00000000000000000000000000000000)))))

(assert (=> b!259704 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6300 lt!130608)))))

(declare-fun b!259705 () Bool)

(assert (=> b!259705 (= e!168296 (validKeyInArray!0 (select (arr!5950 lt!130608) #b00000000000000000000000000000000)))))

(declare-fun b!259706 () Bool)

(assert (=> b!259706 (= e!168301 (+!699 call!24733 (tuple2!4889 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4627 thiss!1504))))))

(declare-fun b!259707 () Bool)

(declare-fun res!126912 () Bool)

(assert (=> b!259707 (=> (not res!126912) (not e!168294))))

(assert (=> b!259707 (= res!126912 e!168303)))

(declare-fun c!44104 () Bool)

(assert (=> b!259707 (= c!44104 (not (= (bvand (extraKeys!4523 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24736 () Bool)

(assert (=> bm!24736 (= call!24737 call!24734)))

(assert (= (and d!62265 c!44108) b!259706))

(assert (= (and d!62265 (not c!44108)) b!259699))

(assert (= (and b!259699 c!44107) b!259689))

(assert (= (and b!259699 (not c!44107)) b!259698))

(assert (= (and b!259698 c!44103) b!259692))

(assert (= (and b!259698 (not c!44103)) b!259695))

(assert (= (or b!259692 b!259695) bm!24736))

(assert (= (or b!259689 bm!24736) bm!24732))

(assert (= (or b!259689 b!259692) bm!24735))

(assert (= (or b!259706 bm!24732) bm!24730))

(assert (= (or b!259706 bm!24735) bm!24734))

(assert (= (and d!62265 res!126907) b!259694))

(assert (= (and d!62265 c!44105) b!259701))

(assert (= (and d!62265 (not c!44105)) b!259700))

(assert (= (and d!62265 res!126913) b!259693))

(assert (= (and b!259693 res!126915) b!259705))

(assert (= (and b!259693 (not res!126914)) b!259704))

(assert (= (and b!259704 res!126911) b!259690))

(assert (= (and b!259693 res!126908) b!259707))

(assert (= (and b!259707 c!44104) b!259696))

(assert (= (and b!259707 (not c!44104)) b!259691))

(assert (= (and b!259696 res!126909) b!259697))

(assert (= (or b!259696 b!259691) bm!24733))

(assert (= (and b!259707 res!126912) b!259702))

(assert (= (and b!259702 c!44106) b!259688))

(assert (= (and b!259702 (not c!44106)) b!259703))

(assert (= (and b!259688 res!126910) b!259687))

(assert (= (or b!259688 b!259703) bm!24731))

(declare-fun b_lambda!8235 () Bool)

(assert (=> (not b_lambda!8235) (not b!259690)))

(assert (=> b!259690 t!8851))

(declare-fun b_and!13835 () Bool)

(assert (= b_and!13833 (and (=> t!8851 result!5395) b_and!13835)))

(declare-fun m!274935 () Bool)

(assert (=> b!259687 m!274935))

(declare-fun m!274937 () Bool)

(assert (=> bm!24733 m!274937))

(declare-fun m!274939 () Bool)

(assert (=> b!259704 m!274939))

(assert (=> b!259704 m!274939))

(declare-fun m!274941 () Bool)

(assert (=> b!259704 m!274941))

(assert (=> b!259690 m!274863))

(declare-fun m!274943 () Bool)

(assert (=> b!259690 m!274943))

(assert (=> b!259690 m!274863))

(declare-fun m!274945 () Bool)

(assert (=> b!259690 m!274945))

(assert (=> b!259690 m!274943))

(assert (=> b!259690 m!274939))

(declare-fun m!274947 () Bool)

(assert (=> b!259690 m!274947))

(assert (=> b!259690 m!274939))

(declare-fun m!274949 () Bool)

(assert (=> bm!24730 m!274949))

(declare-fun m!274951 () Bool)

(assert (=> b!259697 m!274951))

(declare-fun m!274953 () Bool)

(assert (=> bm!24731 m!274953))

(assert (=> b!259701 m!274949))

(declare-fun m!274955 () Bool)

(assert (=> b!259701 m!274955))

(declare-fun m!274957 () Bool)

(assert (=> b!259701 m!274957))

(declare-fun m!274959 () Bool)

(assert (=> b!259701 m!274959))

(declare-fun m!274961 () Bool)

(assert (=> b!259701 m!274961))

(declare-fun m!274963 () Bool)

(assert (=> b!259701 m!274963))

(declare-fun m!274965 () Bool)

(assert (=> b!259701 m!274965))

(declare-fun m!274967 () Bool)

(assert (=> b!259701 m!274967))

(declare-fun m!274969 () Bool)

(assert (=> b!259701 m!274969))

(declare-fun m!274971 () Bool)

(assert (=> b!259701 m!274971))

(assert (=> b!259701 m!274971))

(declare-fun m!274973 () Bool)

(assert (=> b!259701 m!274973))

(declare-fun m!274975 () Bool)

(assert (=> b!259701 m!274975))

(assert (=> b!259701 m!274965))

(declare-fun m!274977 () Bool)

(assert (=> b!259701 m!274977))

(assert (=> b!259701 m!274955))

(assert (=> b!259701 m!274939))

(declare-fun m!274979 () Bool)

(assert (=> b!259701 m!274979))

(declare-fun m!274981 () Bool)

(assert (=> b!259701 m!274981))

(declare-fun m!274983 () Bool)

(assert (=> b!259701 m!274983))

(assert (=> b!259701 m!274979))

(assert (=> b!259705 m!274939))

(assert (=> b!259705 m!274939))

(declare-fun m!274985 () Bool)

(assert (=> b!259705 m!274985))

(assert (=> d!62265 m!274675))

(assert (=> b!259694 m!274939))

(assert (=> b!259694 m!274939))

(assert (=> b!259694 m!274985))

(declare-fun m!274987 () Bool)

(assert (=> bm!24734 m!274987))

(declare-fun m!274989 () Bool)

(assert (=> b!259706 m!274989))

(assert (=> b!259421 d!62265))

(declare-fun d!62267 () Bool)

(declare-fun res!126916 () Bool)

(declare-fun e!168306 () Bool)

(assert (=> d!62267 (=> res!126916 e!168306)))

(assert (=> d!62267 (= res!126916 (= (select (arr!5950 lt!130608) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62267 (= (arrayContainsKey!0 lt!130608 key!932 #b00000000000000000000000000000000) e!168306)))

(declare-fun b!259708 () Bool)

(declare-fun e!168307 () Bool)

(assert (=> b!259708 (= e!168306 e!168307)))

(declare-fun res!126917 () Bool)

(assert (=> b!259708 (=> (not res!126917) (not e!168307))))

(assert (=> b!259708 (= res!126917 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6300 lt!130608)))))

(declare-fun b!259709 () Bool)

(assert (=> b!259709 (= e!168307 (arrayContainsKey!0 lt!130608 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62267 (not res!126916)) b!259708))

(assert (= (and b!259708 res!126917) b!259709))

(assert (=> d!62267 m!274939))

(declare-fun m!274991 () Bool)

(assert (=> b!259709 m!274991))

(assert (=> b!259421 d!62267))

(declare-fun b!259718 () Bool)

(declare-fun e!168313 () (_ BitVec 32))

(declare-fun call!24742 () (_ BitVec 32))

(assert (=> b!259718 (= e!168313 call!24742)))

(declare-fun bm!24739 () Bool)

(assert (=> bm!24739 (= call!24742 (arrayCountValidKeys!0 (_keys!6963 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6300 (_keys!6963 thiss!1504))))))

(declare-fun d!62269 () Bool)

(declare-fun lt!130828 () (_ BitVec 32))

(assert (=> d!62269 (and (bvsge lt!130828 #b00000000000000000000000000000000) (bvsle lt!130828 (bvsub (size!6300 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!168312 () (_ BitVec 32))

(assert (=> d!62269 (= lt!130828 e!168312)))

(declare-fun c!44114 () Bool)

(assert (=> d!62269 (= c!44114 (bvsge #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))))))

(assert (=> d!62269 (and (bvsle #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6300 (_keys!6963 thiss!1504)) (size!6300 (_keys!6963 thiss!1504))))))

(assert (=> d!62269 (= (arrayCountValidKeys!0 (_keys!6963 thiss!1504) #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))) lt!130828)))

(declare-fun b!259719 () Bool)

(assert (=> b!259719 (= e!168312 e!168313)))

(declare-fun c!44113 () Bool)

(assert (=> b!259719 (= c!44113 (validKeyInArray!0 (select (arr!5950 (_keys!6963 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!259720 () Bool)

(assert (=> b!259720 (= e!168313 (bvadd #b00000000000000000000000000000001 call!24742))))

(declare-fun b!259721 () Bool)

(assert (=> b!259721 (= e!168312 #b00000000000000000000000000000000)))

(assert (= (and d!62269 c!44114) b!259721))

(assert (= (and d!62269 (not c!44114)) b!259719))

(assert (= (and b!259719 c!44113) b!259720))

(assert (= (and b!259719 (not c!44113)) b!259718))

(assert (= (or b!259720 b!259718) bm!24739))

(declare-fun m!274993 () Bool)

(assert (=> bm!24739 m!274993))

(assert (=> b!259719 m!274845))

(assert (=> b!259719 m!274845))

(assert (=> b!259719 m!274907))

(assert (=> b!259421 d!62269))

(declare-fun d!62271 () Bool)

(declare-fun e!168316 () Bool)

(assert (=> d!62271 e!168316))

(declare-fun res!126920 () Bool)

(assert (=> d!62271 (=> (not res!126920) (not e!168316))))

(assert (=> d!62271 (= res!126920 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6300 (_keys!6963 thiss!1504))) (bvslt index!297 (size!6299 (_values!4769 thiss!1504)))))))

(declare-fun lt!130831 () Unit!8024)

(declare-fun choose!1270 (array!12571 array!12569 (_ BitVec 32) (_ BitVec 32) V!8465 V!8465 (_ BitVec 32) (_ BitVec 64) V!8465 Int) Unit!8024)

(assert (=> d!62271 (= lt!130831 (choose!1270 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) index!297 key!932 v!346 (defaultEntry!4786 thiss!1504)))))

(assert (=> d!62271 (validMask!0 (mask!11104 thiss!1504))))

(assert (=> d!62271 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!110 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) index!297 key!932 v!346 (defaultEntry!4786 thiss!1504)) lt!130831)))

(declare-fun b!259724 () Bool)

(assert (=> b!259724 (= e!168316 (= (+!699 (getCurrentListMap!1420 (_keys!6963 thiss!1504) (_values!4769 thiss!1504) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504)) (tuple2!4889 key!932 v!346)) (getCurrentListMap!1420 (array!12572 (store (arr!5950 (_keys!6963 thiss!1504)) index!297 key!932) (size!6300 (_keys!6963 thiss!1504))) (array!12570 (store (arr!5949 (_values!4769 thiss!1504)) index!297 (ValueCellFull!2963 v!346)) (size!6299 (_values!4769 thiss!1504))) (mask!11104 thiss!1504) (extraKeys!4523 thiss!1504) (zeroValue!4627 thiss!1504) (minValue!4627 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4786 thiss!1504))))))

(assert (= (and d!62271 res!126920) b!259724))

(declare-fun m!274995 () Bool)

(assert (=> d!62271 m!274995))

(assert (=> d!62271 m!274675))

(assert (=> b!259724 m!274697))

(declare-fun m!274997 () Bool)

(assert (=> b!259724 m!274997))

(assert (=> b!259724 m!274697))

(declare-fun m!274999 () Bool)

(assert (=> b!259724 m!274999))

(assert (=> b!259724 m!274683))

(assert (=> b!259724 m!274659))

(assert (=> b!259421 d!62271))

(declare-fun d!62273 () Bool)

(assert (=> d!62273 (= (validMask!0 (mask!11104 thiss!1504)) (and (or (= (mask!11104 thiss!1504) #b00000000000000000000000000000111) (= (mask!11104 thiss!1504) #b00000000000000000000000000001111) (= (mask!11104 thiss!1504) #b00000000000000000000000000011111) (= (mask!11104 thiss!1504) #b00000000000000000000000000111111) (= (mask!11104 thiss!1504) #b00000000000000000000000001111111) (= (mask!11104 thiss!1504) #b00000000000000000000000011111111) (= (mask!11104 thiss!1504) #b00000000000000000000000111111111) (= (mask!11104 thiss!1504) #b00000000000000000000001111111111) (= (mask!11104 thiss!1504) #b00000000000000000000011111111111) (= (mask!11104 thiss!1504) #b00000000000000000000111111111111) (= (mask!11104 thiss!1504) #b00000000000000000001111111111111) (= (mask!11104 thiss!1504) #b00000000000000000011111111111111) (= (mask!11104 thiss!1504) #b00000000000000000111111111111111) (= (mask!11104 thiss!1504) #b00000000000000001111111111111111) (= (mask!11104 thiss!1504) #b00000000000000011111111111111111) (= (mask!11104 thiss!1504) #b00000000000000111111111111111111) (= (mask!11104 thiss!1504) #b00000000000001111111111111111111) (= (mask!11104 thiss!1504) #b00000000000011111111111111111111) (= (mask!11104 thiss!1504) #b00000000000111111111111111111111) (= (mask!11104 thiss!1504) #b00000000001111111111111111111111) (= (mask!11104 thiss!1504) #b00000000011111111111111111111111) (= (mask!11104 thiss!1504) #b00000000111111111111111111111111) (= (mask!11104 thiss!1504) #b00000001111111111111111111111111) (= (mask!11104 thiss!1504) #b00000011111111111111111111111111) (= (mask!11104 thiss!1504) #b00000111111111111111111111111111) (= (mask!11104 thiss!1504) #b00001111111111111111111111111111) (= (mask!11104 thiss!1504) #b00011111111111111111111111111111) (= (mask!11104 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11104 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!259421 d!62273))

(declare-fun d!62275 () Bool)

(assert (=> d!62275 (arrayContainsKey!0 lt!130608 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130834 () Unit!8024)

(declare-fun choose!13 (array!12571 (_ BitVec 64) (_ BitVec 32)) Unit!8024)

(assert (=> d!62275 (= lt!130834 (choose!13 lt!130608 key!932 index!297))))

(assert (=> d!62275 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62275 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130608 key!932 index!297) lt!130834)))

(declare-fun bs!9134 () Bool)

(assert (= bs!9134 d!62275))

(assert (=> bs!9134 m!274663))

(declare-fun m!275001 () Bool)

(assert (=> bs!9134 m!275001))

(assert (=> b!259421 d!62275))

(declare-fun b!259725 () Bool)

(declare-fun e!168318 () (_ BitVec 32))

(declare-fun call!24743 () (_ BitVec 32))

(assert (=> b!259725 (= e!168318 call!24743)))

(declare-fun bm!24740 () Bool)

(assert (=> bm!24740 (= call!24743 (arrayCountValidKeys!0 lt!130608 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6300 (_keys!6963 thiss!1504))))))

(declare-fun d!62277 () Bool)

(declare-fun lt!130835 () (_ BitVec 32))

(assert (=> d!62277 (and (bvsge lt!130835 #b00000000000000000000000000000000) (bvsle lt!130835 (bvsub (size!6300 lt!130608) #b00000000000000000000000000000000)))))

(declare-fun e!168317 () (_ BitVec 32))

(assert (=> d!62277 (= lt!130835 e!168317)))

(declare-fun c!44116 () Bool)

(assert (=> d!62277 (= c!44116 (bvsge #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))))))

(assert (=> d!62277 (and (bvsle #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6300 (_keys!6963 thiss!1504)) (size!6300 lt!130608)))))

(assert (=> d!62277 (= (arrayCountValidKeys!0 lt!130608 #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))) lt!130835)))

(declare-fun b!259726 () Bool)

(assert (=> b!259726 (= e!168317 e!168318)))

(declare-fun c!44115 () Bool)

(assert (=> b!259726 (= c!44115 (validKeyInArray!0 (select (arr!5950 lt!130608) #b00000000000000000000000000000000)))))

(declare-fun b!259727 () Bool)

(assert (=> b!259727 (= e!168318 (bvadd #b00000000000000000000000000000001 call!24743))))

(declare-fun b!259728 () Bool)

(assert (=> b!259728 (= e!168317 #b00000000000000000000000000000000)))

(assert (= (and d!62277 c!44116) b!259728))

(assert (= (and d!62277 (not c!44116)) b!259726))

(assert (= (and b!259726 c!44115) b!259727))

(assert (= (and b!259726 (not c!44115)) b!259725))

(assert (= (or b!259727 b!259725) bm!24740))

(declare-fun m!275003 () Bool)

(assert (=> bm!24740 m!275003))

(assert (=> b!259726 m!274939))

(assert (=> b!259726 m!274939))

(assert (=> b!259726 m!274985))

(assert (=> b!259421 d!62277))

(declare-fun b!259729 () Bool)

(declare-fun e!168320 () (_ BitVec 32))

(declare-fun call!24744 () (_ BitVec 32))

(assert (=> b!259729 (= e!168320 call!24744)))

(declare-fun bm!24741 () Bool)

(assert (=> bm!24741 (= call!24744 (arrayCountValidKeys!0 lt!130608 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun d!62279 () Bool)

(declare-fun lt!130836 () (_ BitVec 32))

(assert (=> d!62279 (and (bvsge lt!130836 #b00000000000000000000000000000000) (bvsle lt!130836 (bvsub (size!6300 lt!130608) index!297)))))

(declare-fun e!168319 () (_ BitVec 32))

(assert (=> d!62279 (= lt!130836 e!168319)))

(declare-fun c!44118 () Bool)

(assert (=> d!62279 (= c!44118 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62279 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6300 lt!130608)))))

(assert (=> d!62279 (= (arrayCountValidKeys!0 lt!130608 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!130836)))

(declare-fun b!259730 () Bool)

(assert (=> b!259730 (= e!168319 e!168320)))

(declare-fun c!44117 () Bool)

(assert (=> b!259730 (= c!44117 (validKeyInArray!0 (select (arr!5950 lt!130608) index!297)))))

(declare-fun b!259731 () Bool)

(assert (=> b!259731 (= e!168320 (bvadd #b00000000000000000000000000000001 call!24744))))

(declare-fun b!259732 () Bool)

(assert (=> b!259732 (= e!168319 #b00000000000000000000000000000000)))

(assert (= (and d!62279 c!44118) b!259732))

(assert (= (and d!62279 (not c!44118)) b!259730))

(assert (= (and b!259730 c!44117) b!259731))

(assert (= (and b!259730 (not c!44117)) b!259729))

(assert (= (or b!259731 b!259729) bm!24741))

(declare-fun m!275005 () Bool)

(assert (=> bm!24741 m!275005))

(declare-fun m!275007 () Bool)

(assert (=> b!259730 m!275007))

(assert (=> b!259730 m!275007))

(declare-fun m!275009 () Bool)

(assert (=> b!259730 m!275009))

(assert (=> b!259421 d!62279))

(declare-fun b!259743 () Bool)

(declare-fun e!168329 () Bool)

(declare-fun contains!1868 (List!3788 (_ BitVec 64)) Bool)

(assert (=> b!259743 (= e!168329 (contains!1868 Nil!3785 (select (arr!5950 lt!130608) #b00000000000000000000000000000000)))))

(declare-fun b!259744 () Bool)

(declare-fun e!168332 () Bool)

(declare-fun e!168331 () Bool)

(assert (=> b!259744 (= e!168332 e!168331)))

(declare-fun res!126928 () Bool)

(assert (=> b!259744 (=> (not res!126928) (not e!168331))))

(assert (=> b!259744 (= res!126928 (not e!168329))))

(declare-fun res!126929 () Bool)

(assert (=> b!259744 (=> (not res!126929) (not e!168329))))

(assert (=> b!259744 (= res!126929 (validKeyInArray!0 (select (arr!5950 lt!130608) #b00000000000000000000000000000000)))))

(declare-fun b!259745 () Bool)

(declare-fun e!168330 () Bool)

(assert (=> b!259745 (= e!168331 e!168330)))

(declare-fun c!44121 () Bool)

(assert (=> b!259745 (= c!44121 (validKeyInArray!0 (select (arr!5950 lt!130608) #b00000000000000000000000000000000)))))

(declare-fun b!259746 () Bool)

(declare-fun call!24747 () Bool)

(assert (=> b!259746 (= e!168330 call!24747)))

(declare-fun b!259747 () Bool)

(assert (=> b!259747 (= e!168330 call!24747)))

(declare-fun d!62281 () Bool)

(declare-fun res!126927 () Bool)

(assert (=> d!62281 (=> res!126927 e!168332)))

(assert (=> d!62281 (= res!126927 (bvsge #b00000000000000000000000000000000 (size!6300 lt!130608)))))

(assert (=> d!62281 (= (arrayNoDuplicates!0 lt!130608 #b00000000000000000000000000000000 Nil!3785) e!168332)))

(declare-fun bm!24744 () Bool)

(assert (=> bm!24744 (= call!24747 (arrayNoDuplicates!0 lt!130608 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44121 (Cons!3784 (select (arr!5950 lt!130608) #b00000000000000000000000000000000) Nil!3785) Nil!3785)))))

(assert (= (and d!62281 (not res!126927)) b!259744))

(assert (= (and b!259744 res!126929) b!259743))

(assert (= (and b!259744 res!126928) b!259745))

(assert (= (and b!259745 c!44121) b!259746))

(assert (= (and b!259745 (not c!44121)) b!259747))

(assert (= (or b!259746 b!259747) bm!24744))

(assert (=> b!259743 m!274939))

(assert (=> b!259743 m!274939))

(declare-fun m!275011 () Bool)

(assert (=> b!259743 m!275011))

(assert (=> b!259744 m!274939))

(assert (=> b!259744 m!274939))

(assert (=> b!259744 m!274985))

(assert (=> b!259745 m!274939))

(assert (=> b!259745 m!274939))

(assert (=> b!259745 m!274985))

(assert (=> bm!24744 m!274939))

(declare-fun m!275013 () Bool)

(assert (=> bm!24744 m!275013))

(assert (=> b!259421 d!62281))

(declare-fun bm!24747 () Bool)

(declare-fun call!24750 () Bool)

(assert (=> bm!24747 (= call!24750 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130608 (mask!11104 thiss!1504)))))

(declare-fun d!62283 () Bool)

(declare-fun res!126934 () Bool)

(declare-fun e!168341 () Bool)

(assert (=> d!62283 (=> res!126934 e!168341)))

(assert (=> d!62283 (= res!126934 (bvsge #b00000000000000000000000000000000 (size!6300 lt!130608)))))

(assert (=> d!62283 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130608 (mask!11104 thiss!1504)) e!168341)))

(declare-fun b!259756 () Bool)

(declare-fun e!168339 () Bool)

(declare-fun e!168340 () Bool)

(assert (=> b!259756 (= e!168339 e!168340)))

(declare-fun lt!130844 () (_ BitVec 64))

(assert (=> b!259756 (= lt!130844 (select (arr!5950 lt!130608) #b00000000000000000000000000000000))))

(declare-fun lt!130843 () Unit!8024)

(assert (=> b!259756 (= lt!130843 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130608 lt!130844 #b00000000000000000000000000000000))))

(assert (=> b!259756 (arrayContainsKey!0 lt!130608 lt!130844 #b00000000000000000000000000000000)))

(declare-fun lt!130845 () Unit!8024)

(assert (=> b!259756 (= lt!130845 lt!130843)))

(declare-fun res!126935 () Bool)

(assert (=> b!259756 (= res!126935 (= (seekEntryOrOpen!0 (select (arr!5950 lt!130608) #b00000000000000000000000000000000) lt!130608 (mask!11104 thiss!1504)) (Found!1174 #b00000000000000000000000000000000)))))

(assert (=> b!259756 (=> (not res!126935) (not e!168340))))

(declare-fun b!259757 () Bool)

(assert (=> b!259757 (= e!168340 call!24750)))

(declare-fun b!259758 () Bool)

(assert (=> b!259758 (= e!168339 call!24750)))

(declare-fun b!259759 () Bool)

(assert (=> b!259759 (= e!168341 e!168339)))

(declare-fun c!44124 () Bool)

(assert (=> b!259759 (= c!44124 (validKeyInArray!0 (select (arr!5950 lt!130608) #b00000000000000000000000000000000)))))

(assert (= (and d!62283 (not res!126934)) b!259759))

(assert (= (and b!259759 c!44124) b!259756))

(assert (= (and b!259759 (not c!44124)) b!259758))

(assert (= (and b!259756 res!126935) b!259757))

(assert (= (or b!259757 b!259758) bm!24747))

(declare-fun m!275015 () Bool)

(assert (=> bm!24747 m!275015))

(assert (=> b!259756 m!274939))

(declare-fun m!275017 () Bool)

(assert (=> b!259756 m!275017))

(declare-fun m!275019 () Bool)

(assert (=> b!259756 m!275019))

(assert (=> b!259756 m!274939))

(declare-fun m!275021 () Bool)

(assert (=> b!259756 m!275021))

(assert (=> b!259759 m!274939))

(assert (=> b!259759 m!274939))

(assert (=> b!259759 m!274985))

(assert (=> b!259421 d!62283))

(declare-fun d!62285 () Bool)

(declare-fun e!168344 () Bool)

(assert (=> d!62285 e!168344))

(declare-fun res!126938 () Bool)

(assert (=> d!62285 (=> (not res!126938) (not e!168344))))

(assert (=> d!62285 (= res!126938 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6300 (_keys!6963 thiss!1504)))))))

(declare-fun lt!130848 () Unit!8024)

(declare-fun choose!41 (array!12571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3788) Unit!8024)

(assert (=> d!62285 (= lt!130848 (choose!41 (_keys!6963 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3785))))

(assert (=> d!62285 (bvslt (size!6300 (_keys!6963 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62285 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6963 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3785) lt!130848)))

(declare-fun b!259762 () Bool)

(assert (=> b!259762 (= e!168344 (arrayNoDuplicates!0 (array!12572 (store (arr!5950 (_keys!6963 thiss!1504)) index!297 key!932) (size!6300 (_keys!6963 thiss!1504))) #b00000000000000000000000000000000 Nil!3785))))

(assert (= (and d!62285 res!126938) b!259762))

(declare-fun m!275023 () Bool)

(assert (=> d!62285 m!275023))

(assert (=> b!259762 m!274683))

(declare-fun m!275025 () Bool)

(assert (=> b!259762 m!275025))

(assert (=> b!259421 d!62285))

(declare-fun d!62287 () Bool)

(declare-fun e!168347 () Bool)

(assert (=> d!62287 e!168347))

(declare-fun res!126943 () Bool)

(assert (=> d!62287 (=> (not res!126943) (not e!168347))))

(declare-fun lt!130859 () ListLongMap!3791)

(assert (=> d!62287 (= res!126943 (contains!1865 lt!130859 (_1!2455 (tuple2!4889 key!932 v!346))))))

(declare-fun lt!130857 () List!3787)

(assert (=> d!62287 (= lt!130859 (ListLongMap!3792 lt!130857))))

(declare-fun lt!130860 () Unit!8024)

(declare-fun lt!130858 () Unit!8024)

(assert (=> d!62287 (= lt!130860 lt!130858)))

(assert (=> d!62287 (= (getValueByKey!313 lt!130857 (_1!2455 (tuple2!4889 key!932 v!346))) (Some!318 (_2!2455 (tuple2!4889 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!172 (List!3787 (_ BitVec 64) V!8465) Unit!8024)

(assert (=> d!62287 (= lt!130858 (lemmaContainsTupThenGetReturnValue!172 lt!130857 (_1!2455 (tuple2!4889 key!932 v!346)) (_2!2455 (tuple2!4889 key!932 v!346))))))

(declare-fun insertStrictlySorted!175 (List!3787 (_ BitVec 64) V!8465) List!3787)

(assert (=> d!62287 (= lt!130857 (insertStrictlySorted!175 (toList!1911 lt!130615) (_1!2455 (tuple2!4889 key!932 v!346)) (_2!2455 (tuple2!4889 key!932 v!346))))))

(assert (=> d!62287 (= (+!699 lt!130615 (tuple2!4889 key!932 v!346)) lt!130859)))

(declare-fun b!259767 () Bool)

(declare-fun res!126944 () Bool)

(assert (=> b!259767 (=> (not res!126944) (not e!168347))))

(assert (=> b!259767 (= res!126944 (= (getValueByKey!313 (toList!1911 lt!130859) (_1!2455 (tuple2!4889 key!932 v!346))) (Some!318 (_2!2455 (tuple2!4889 key!932 v!346)))))))

(declare-fun b!259768 () Bool)

(declare-fun contains!1869 (List!3787 tuple2!4888) Bool)

(assert (=> b!259768 (= e!168347 (contains!1869 (toList!1911 lt!130859) (tuple2!4889 key!932 v!346)))))

(assert (= (and d!62287 res!126943) b!259767))

(assert (= (and b!259767 res!126944) b!259768))

(declare-fun m!275027 () Bool)

(assert (=> d!62287 m!275027))

(declare-fun m!275029 () Bool)

(assert (=> d!62287 m!275029))

(declare-fun m!275031 () Bool)

(assert (=> d!62287 m!275031))

(declare-fun m!275033 () Bool)

(assert (=> d!62287 m!275033))

(declare-fun m!275035 () Bool)

(assert (=> b!259767 m!275035))

(declare-fun m!275037 () Bool)

(assert (=> b!259768 m!275037))

(assert (=> b!259421 d!62287))

(declare-fun d!62289 () Bool)

(declare-fun e!168353 () Bool)

(assert (=> d!62289 e!168353))

(declare-fun res!126954 () Bool)

(assert (=> d!62289 (=> (not res!126954) (not e!168353))))

(assert (=> d!62289 (= res!126954 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6300 (_keys!6963 thiss!1504)))))))

(declare-fun lt!130863 () Unit!8024)

(declare-fun choose!1 (array!12571 (_ BitVec 32) (_ BitVec 64)) Unit!8024)

(assert (=> d!62289 (= lt!130863 (choose!1 (_keys!6963 thiss!1504) index!297 key!932))))

(declare-fun e!168352 () Bool)

(assert (=> d!62289 e!168352))

(declare-fun res!126956 () Bool)

(assert (=> d!62289 (=> (not res!126956) (not e!168352))))

(assert (=> d!62289 (= res!126956 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6300 (_keys!6963 thiss!1504)))))))

(assert (=> d!62289 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6963 thiss!1504) index!297 key!932) lt!130863)))

(declare-fun b!259777 () Bool)

(declare-fun res!126953 () Bool)

(assert (=> b!259777 (=> (not res!126953) (not e!168352))))

(assert (=> b!259777 (= res!126953 (not (validKeyInArray!0 (select (arr!5950 (_keys!6963 thiss!1504)) index!297))))))

(declare-fun b!259778 () Bool)

(declare-fun res!126955 () Bool)

(assert (=> b!259778 (=> (not res!126955) (not e!168352))))

(assert (=> b!259778 (= res!126955 (validKeyInArray!0 key!932))))

(declare-fun b!259779 () Bool)

(assert (=> b!259779 (= e!168352 (bvslt (size!6300 (_keys!6963 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!259780 () Bool)

(assert (=> b!259780 (= e!168353 (= (arrayCountValidKeys!0 (array!12572 (store (arr!5950 (_keys!6963 thiss!1504)) index!297 key!932) (size!6300 (_keys!6963 thiss!1504))) #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6963 thiss!1504) #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!62289 res!126956) b!259777))

(assert (= (and b!259777 res!126953) b!259778))

(assert (= (and b!259778 res!126955) b!259779))

(assert (= (and d!62289 res!126954) b!259780))

(declare-fun m!275039 () Bool)

(assert (=> d!62289 m!275039))

(declare-fun m!275041 () Bool)

(assert (=> b!259777 m!275041))

(assert (=> b!259777 m!275041))

(declare-fun m!275043 () Bool)

(assert (=> b!259777 m!275043))

(declare-fun m!275045 () Bool)

(assert (=> b!259778 m!275045))

(assert (=> b!259780 m!274683))

(declare-fun m!275047 () Bool)

(assert (=> b!259780 m!275047))

(assert (=> b!259780 m!274669))

(assert (=> b!259421 d!62289))

(declare-fun d!62291 () Bool)

(assert (=> d!62291 (= (arrayCountValidKeys!0 lt!130608 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!130866 () Unit!8024)

(declare-fun choose!2 (array!12571 (_ BitVec 32)) Unit!8024)

(assert (=> d!62291 (= lt!130866 (choose!2 lt!130608 index!297))))

(declare-fun e!168356 () Bool)

(assert (=> d!62291 e!168356))

(declare-fun res!126961 () Bool)

(assert (=> d!62291 (=> (not res!126961) (not e!168356))))

(assert (=> d!62291 (= res!126961 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6300 lt!130608))))))

(assert (=> d!62291 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130608 index!297) lt!130866)))

(declare-fun b!259785 () Bool)

(declare-fun res!126962 () Bool)

(assert (=> b!259785 (=> (not res!126962) (not e!168356))))

(assert (=> b!259785 (= res!126962 (validKeyInArray!0 (select (arr!5950 lt!130608) index!297)))))

(declare-fun b!259786 () Bool)

(assert (=> b!259786 (= e!168356 (bvslt (size!6300 lt!130608) #b01111111111111111111111111111111))))

(assert (= (and d!62291 res!126961) b!259785))

(assert (= (and b!259785 res!126962) b!259786))

(declare-fun m!275049 () Bool)

(assert (=> d!62291 m!275049))

(declare-fun m!275051 () Bool)

(assert (=> d!62291 m!275051))

(assert (=> b!259785 m!275007))

(assert (=> b!259785 m!275007))

(assert (=> b!259785 m!275009))

(assert (=> b!259421 d!62291))

(assert (=> b!259421 d!62253))

(declare-fun d!62293 () Bool)

(declare-fun e!168359 () Bool)

(assert (=> d!62293 e!168359))

(declare-fun res!126965 () Bool)

(assert (=> d!62293 (=> (not res!126965) (not e!168359))))

(assert (=> d!62293 (= res!126965 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6300 (_keys!6963 thiss!1504)))))))

(declare-fun lt!130869 () Unit!8024)

(declare-fun choose!102 ((_ BitVec 64) array!12571 (_ BitVec 32) (_ BitVec 32)) Unit!8024)

(assert (=> d!62293 (= lt!130869 (choose!102 key!932 (_keys!6963 thiss!1504) index!297 (mask!11104 thiss!1504)))))

(assert (=> d!62293 (validMask!0 (mask!11104 thiss!1504))))

(assert (=> d!62293 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6963 thiss!1504) index!297 (mask!11104 thiss!1504)) lt!130869)))

(declare-fun b!259789 () Bool)

(assert (=> b!259789 (= e!168359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12572 (store (arr!5950 (_keys!6963 thiss!1504)) index!297 key!932) (size!6300 (_keys!6963 thiss!1504))) (mask!11104 thiss!1504)))))

(assert (= (and d!62293 res!126965) b!259789))

(declare-fun m!275053 () Bool)

(assert (=> d!62293 m!275053))

(assert (=> d!62293 m!274675))

(assert (=> b!259789 m!274683))

(declare-fun m!275055 () Bool)

(assert (=> b!259789 m!275055))

(assert (=> b!259421 d!62293))

(declare-fun d!62295 () Bool)

(declare-fun res!126972 () Bool)

(declare-fun e!168362 () Bool)

(assert (=> d!62295 (=> (not res!126972) (not e!168362))))

(declare-fun simpleValid!280 (LongMapFixedSize!3826) Bool)

(assert (=> d!62295 (= res!126972 (simpleValid!280 thiss!1504))))

(assert (=> d!62295 (= (valid!1499 thiss!1504) e!168362)))

(declare-fun b!259796 () Bool)

(declare-fun res!126973 () Bool)

(assert (=> b!259796 (=> (not res!126973) (not e!168362))))

(assert (=> b!259796 (= res!126973 (= (arrayCountValidKeys!0 (_keys!6963 thiss!1504) #b00000000000000000000000000000000 (size!6300 (_keys!6963 thiss!1504))) (_size!1962 thiss!1504)))))

(declare-fun b!259797 () Bool)

(declare-fun res!126974 () Bool)

(assert (=> b!259797 (=> (not res!126974) (not e!168362))))

(assert (=> b!259797 (= res!126974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6963 thiss!1504) (mask!11104 thiss!1504)))))

(declare-fun b!259798 () Bool)

(assert (=> b!259798 (= e!168362 (arrayNoDuplicates!0 (_keys!6963 thiss!1504) #b00000000000000000000000000000000 Nil!3785))))

(assert (= (and d!62295 res!126972) b!259796))

(assert (= (and b!259796 res!126973) b!259797))

(assert (= (and b!259797 res!126974) b!259798))

(declare-fun m!275057 () Bool)

(assert (=> d!62295 m!275057))

(assert (=> b!259796 m!274669))

(declare-fun m!275059 () Bool)

(assert (=> b!259797 m!275059))

(declare-fun m!275061 () Bool)

(assert (=> b!259798 m!275061))

(assert (=> start!24868 d!62295))

(declare-fun b!259806 () Bool)

(declare-fun e!168367 () Bool)

(assert (=> b!259806 (= e!168367 tp_is_empty!6613)))

(declare-fun b!259805 () Bool)

(declare-fun e!168368 () Bool)

(assert (=> b!259805 (= e!168368 tp_is_empty!6613)))

(declare-fun condMapEmpty!11276 () Bool)

(declare-fun mapDefault!11276 () ValueCell!2963)

(assert (=> mapNonEmpty!11267 (= condMapEmpty!11276 (= mapRest!11267 ((as const (Array (_ BitVec 32) ValueCell!2963)) mapDefault!11276)))))

(declare-fun mapRes!11276 () Bool)

(assert (=> mapNonEmpty!11267 (= tp!23573 (and e!168367 mapRes!11276))))

(declare-fun mapIsEmpty!11276 () Bool)

(assert (=> mapIsEmpty!11276 mapRes!11276))

(declare-fun mapNonEmpty!11276 () Bool)

(declare-fun tp!23588 () Bool)

(assert (=> mapNonEmpty!11276 (= mapRes!11276 (and tp!23588 e!168368))))

(declare-fun mapRest!11276 () (Array (_ BitVec 32) ValueCell!2963))

(declare-fun mapKey!11276 () (_ BitVec 32))

(declare-fun mapValue!11276 () ValueCell!2963)

(assert (=> mapNonEmpty!11276 (= mapRest!11267 (store mapRest!11276 mapKey!11276 mapValue!11276))))

(assert (= (and mapNonEmpty!11267 condMapEmpty!11276) mapIsEmpty!11276))

(assert (= (and mapNonEmpty!11267 (not condMapEmpty!11276)) mapNonEmpty!11276))

(assert (= (and mapNonEmpty!11276 ((_ is ValueCellFull!2963) mapValue!11276)) b!259805))

(assert (= (and mapNonEmpty!11267 ((_ is ValueCellFull!2963) mapDefault!11276)) b!259806))

(declare-fun m!275063 () Bool)

(assert (=> mapNonEmpty!11276 m!275063))

(declare-fun b_lambda!8237 () Bool)

(assert (= b_lambda!8235 (or (and b!259430 b_free!6751) b_lambda!8237)))

(declare-fun b_lambda!8239 () Bool)

(assert (= b_lambda!8233 (or (and b!259430 b_free!6751) b_lambda!8239)))

(check-sat (not b!259684) (not bm!24729) (not d!62287) (not b_lambda!8239) (not b!259706) (not b!259563) (not b!259641) (not b!259726) (not d!62271) (not b!259570) (not b!259622) (not bm!24733) (not bm!24730) (not d!62275) (not b!259762) (not b!259745) (not b!259636) (not bm!24741) (not d!62259) (not bm!24740) (not b!259778) (not b!259629) (not d!62293) (not b!259724) (not b!259577) (not b!259687) (not mapNonEmpty!11276) (not b!259690) (not bm!24728) (not bm!24720) (not b!259759) (not b!259777) (not bm!24747) (not b!259579) (not b!259704) (not b_lambda!8237) (not b!259756) (not b!259789) (not bm!24721) (not bm!24739) (not d!62247) (not b!259785) (not b!259719) (not b!259796) (not d!62295) (not b!259743) (not d!62261) (not b!259768) (not b!259632) tp_is_empty!6613 (not b!259625) (not b!259730) (not bm!24731) (not d!62265) (not d!62291) (not b!259694) (not b!259705) b_and!13835 (not b!259697) (not b!259780) (not b!259767) (not b!259640) (not b!259744) (not bm!24718) (not b!259639) (not bm!24744) (not d!62257) (not d!62289) (not b_next!6751) (not bm!24717) (not b!259709) (not b!259798) (not bm!24734) (not d!62243) (not b!259797) (not d!62285) (not d!62263) (not b!259701))
(check-sat b_and!13835 (not b_next!6751))
