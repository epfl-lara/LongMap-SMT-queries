; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24270 () Bool)

(assert start!24270)

(declare-fun b!253750 () Bool)

(declare-fun b_free!6667 () Bool)

(declare-fun b_next!6667 () Bool)

(assert (=> b!253750 (= b_free!6667 (not b_next!6667))))

(declare-fun tp!23289 () Bool)

(declare-fun b_and!13723 () Bool)

(assert (=> b!253750 (= tp!23289 b_and!13723)))

(declare-fun b!253741 () Bool)

(declare-fun e!164504 () Bool)

(declare-datatypes ((V!8353 0))(
  ( (V!8354 (val!3309 Int)) )
))
(declare-datatypes ((ValueCell!2921 0))(
  ( (ValueCellFull!2921 (v!5384 V!8353)) (EmptyCell!2921) )
))
(declare-datatypes ((array!12387 0))(
  ( (array!12388 (arr!5869 (Array (_ BitVec 32) ValueCell!2921)) (size!6216 (_ BitVec 32))) )
))
(declare-datatypes ((array!12389 0))(
  ( (array!12390 (arr!5870 (Array (_ BitVec 32) (_ BitVec 64))) (size!6217 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3742 0))(
  ( (LongMapFixedSize!3743 (defaultEntry!4684 Int) (mask!10924 (_ BitVec 32)) (extraKeys!4421 (_ BitVec 32)) (zeroValue!4525 V!8353) (minValue!4525 V!8353) (_size!1920 (_ BitVec 32)) (_keys!6838 array!12389) (_values!4667 array!12387) (_vacant!1920 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3742)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!253741 (= e!164504 (or (= (select (arr!5870 (_keys!6838 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!5870 (_keys!6838 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!23931 () Bool)

(declare-fun call!23935 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23931 (= call!23935 (arrayContainsKey!0 (_keys!6838 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253742 () Bool)

(declare-fun e!164503 () Bool)

(declare-fun e!164495 () Bool)

(assert (=> b!253742 (= e!164503 e!164495)))

(declare-fun res!124201 () Bool)

(assert (=> b!253742 (=> (not res!124201) (not e!164495))))

(declare-datatypes ((SeekEntryResult!1105 0))(
  ( (MissingZero!1105 (index!6590 (_ BitVec 32))) (Found!1105 (index!6591 (_ BitVec 32))) (Intermediate!1105 (undefined!1917 Bool) (index!6592 (_ BitVec 32)) (x!24797 (_ BitVec 32))) (Undefined!1105) (MissingVacant!1105 (index!6593 (_ BitVec 32))) )
))
(declare-fun lt!127225 () SeekEntryResult!1105)

(assert (=> b!253742 (= res!124201 (or (= lt!127225 (MissingZero!1105 index!297)) (= lt!127225 (MissingVacant!1105 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12389 (_ BitVec 32)) SeekEntryResult!1105)

(assert (=> b!253742 (= lt!127225 (seekEntryOrOpen!0 key!932 (_keys!6838 thiss!1504) (mask!10924 thiss!1504)))))

(declare-fun b!253743 () Bool)

(declare-fun e!164496 () Bool)

(assert (=> b!253743 (= e!164496 (not e!164504))))

(declare-fun res!124208 () Bool)

(assert (=> b!253743 (=> res!124208 e!164504)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!253743 (= res!124208 (not (validMask!0 (mask!10924 thiss!1504))))))

(declare-fun lt!127229 () array!12389)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12389 (_ BitVec 32)) Bool)

(assert (=> b!253743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127229 (mask!10924 thiss!1504))))

(declare-datatypes ((Unit!7821 0))(
  ( (Unit!7822) )
))
(declare-fun lt!127227 () Unit!7821)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12389 (_ BitVec 32) (_ BitVec 32)) Unit!7821)

(assert (=> b!253743 (= lt!127227 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6838 thiss!1504) index!297 (mask!10924 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12389 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!253743 (= (arrayCountValidKeys!0 lt!127229 #b00000000000000000000000000000000 (size!6217 (_keys!6838 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6838 thiss!1504) #b00000000000000000000000000000000 (size!6217 (_keys!6838 thiss!1504)))))))

(declare-fun lt!127231 () Unit!7821)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12389 (_ BitVec 32) (_ BitVec 64)) Unit!7821)

(assert (=> b!253743 (= lt!127231 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6838 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3667 0))(
  ( (Nil!3664) (Cons!3663 (h!4325 (_ BitVec 64)) (t!8706 List!3667)) )
))
(declare-fun arrayNoDuplicates!0 (array!12389 (_ BitVec 32) List!3667) Bool)

(assert (=> b!253743 (arrayNoDuplicates!0 lt!127229 #b00000000000000000000000000000000 Nil!3664)))

(assert (=> b!253743 (= lt!127229 (array!12390 (store (arr!5870 (_keys!6838 thiss!1504)) index!297 key!932) (size!6217 (_keys!6838 thiss!1504))))))

(declare-fun lt!127230 () Unit!7821)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3667) Unit!7821)

(assert (=> b!253743 (= lt!127230 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6838 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3664))))

(declare-fun lt!127232 () Unit!7821)

(declare-fun e!164499 () Unit!7821)

(assert (=> b!253743 (= lt!127232 e!164499)))

(declare-fun c!42804 () Bool)

(assert (=> b!253743 (= c!42804 (arrayContainsKey!0 (_keys!6838 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253744 () Bool)

(declare-fun e!164494 () Bool)

(declare-fun e!164493 () Bool)

(assert (=> b!253744 (= e!164494 e!164493)))

(declare-fun res!124211 () Bool)

(declare-fun call!23934 () Bool)

(assert (=> b!253744 (= res!124211 call!23934)))

(assert (=> b!253744 (=> (not res!124211) (not e!164493))))

(declare-fun b!253745 () Bool)

(declare-fun res!124212 () Bool)

(assert (=> b!253745 (=> res!124212 e!164504)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253745 (= res!124212 (not (validKeyInArray!0 key!932)))))

(declare-fun b!253746 () Bool)

(declare-fun res!124209 () Bool)

(assert (=> b!253746 (=> res!124209 e!164504)))

(assert (=> b!253746 (= res!124209 (or (not (= (size!6216 (_values!4667 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10924 thiss!1504)))) (not (= (size!6217 (_keys!6838 thiss!1504)) (size!6216 (_values!4667 thiss!1504)))) (bvslt (mask!10924 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4421 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4421 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!253747 () Bool)

(declare-fun e!164502 () Bool)

(declare-fun e!164498 () Bool)

(declare-fun mapRes!11109 () Bool)

(assert (=> b!253747 (= e!164502 (and e!164498 mapRes!11109))))

(declare-fun condMapEmpty!11109 () Bool)

(declare-fun mapDefault!11109 () ValueCell!2921)

(assert (=> b!253747 (= condMapEmpty!11109 (= (arr!5869 (_values!4667 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2921)) mapDefault!11109)))))

(declare-fun b!253748 () Bool)

(declare-fun Unit!7823 () Unit!7821)

(assert (=> b!253748 (= e!164499 Unit!7823)))

(declare-fun b!253749 () Bool)

(declare-fun res!124210 () Bool)

(assert (=> b!253749 (=> res!124210 e!164504)))

(assert (=> b!253749 (= res!124210 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6217 (_keys!6838 thiss!1504)))))))

(declare-fun mapIsEmpty!11109 () Bool)

(assert (=> mapIsEmpty!11109 mapRes!11109))

(declare-fun tp_is_empty!6529 () Bool)

(declare-fun e!164492 () Bool)

(declare-fun array_inv!3861 (array!12389) Bool)

(declare-fun array_inv!3862 (array!12387) Bool)

(assert (=> b!253750 (= e!164492 (and tp!23289 tp_is_empty!6529 (array_inv!3861 (_keys!6838 thiss!1504)) (array_inv!3862 (_values!4667 thiss!1504)) e!164502))))

(declare-fun mapNonEmpty!11109 () Bool)

(declare-fun tp!23288 () Bool)

(declare-fun e!164501 () Bool)

(assert (=> mapNonEmpty!11109 (= mapRes!11109 (and tp!23288 e!164501))))

(declare-fun mapKey!11109 () (_ BitVec 32))

(declare-fun mapRest!11109 () (Array (_ BitVec 32) ValueCell!2921))

(declare-fun mapValue!11109 () ValueCell!2921)

(assert (=> mapNonEmpty!11109 (= (arr!5869 (_values!4667 thiss!1504)) (store mapRest!11109 mapKey!11109 mapValue!11109))))

(declare-fun b!253751 () Bool)

(declare-fun res!124207 () Bool)

(assert (=> b!253751 (=> (not res!124207) (not e!164503))))

(assert (=> b!253751 (= res!124207 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!253752 () Bool)

(declare-fun res!124206 () Bool)

(assert (=> b!253752 (= res!124206 (= (select (arr!5870 (_keys!6838 thiss!1504)) (index!6593 lt!127225)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253752 (=> (not res!124206) (not e!164493))))

(declare-fun b!253753 () Bool)

(declare-fun c!42807 () Bool)

(get-info :version)

(assert (=> b!253753 (= c!42807 ((_ is MissingVacant!1105) lt!127225))))

(declare-fun e!164506 () Bool)

(assert (=> b!253753 (= e!164506 e!164494)))

(declare-fun b!253754 () Bool)

(declare-fun res!124199 () Bool)

(assert (=> b!253754 (=> res!124199 e!164504)))

(assert (=> b!253754 (= res!124199 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6838 thiss!1504) (mask!10924 thiss!1504))))))

(declare-fun b!253755 () Bool)

(declare-fun res!124200 () Bool)

(assert (=> b!253755 (=> res!124200 e!164504)))

(assert (=> b!253755 (= res!124200 (not (arrayNoDuplicates!0 (_keys!6838 thiss!1504) #b00000000000000000000000000000000 Nil!3664)))))

(declare-fun b!253756 () Bool)

(declare-fun res!124202 () Bool)

(declare-fun e!164497 () Bool)

(assert (=> b!253756 (=> (not res!124202) (not e!164497))))

(assert (=> b!253756 (= res!124202 call!23934)))

(assert (=> b!253756 (= e!164506 e!164497)))

(declare-fun res!124203 () Bool)

(assert (=> start!24270 (=> (not res!124203) (not e!164503))))

(declare-fun valid!1470 (LongMapFixedSize!3742) Bool)

(assert (=> start!24270 (= res!124203 (valid!1470 thiss!1504))))

(assert (=> start!24270 e!164503))

(assert (=> start!24270 e!164492))

(assert (=> start!24270 true))

(declare-fun b!253757 () Bool)

(assert (=> b!253757 (= e!164493 (not call!23935))))

(declare-fun b!253758 () Bool)

(declare-fun e!164500 () Unit!7821)

(declare-fun Unit!7824 () Unit!7821)

(assert (=> b!253758 (= e!164500 Unit!7824)))

(declare-fun lt!127228 () Unit!7821)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!406 (array!12389 array!12387 (_ BitVec 32) (_ BitVec 32) V!8353 V!8353 (_ BitVec 64) Int) Unit!7821)

(assert (=> b!253758 (= lt!127228 (lemmaInListMapThenSeekEntryOrOpenFindsIt!406 (_keys!6838 thiss!1504) (_values!4667 thiss!1504) (mask!10924 thiss!1504) (extraKeys!4421 thiss!1504) (zeroValue!4525 thiss!1504) (minValue!4525 thiss!1504) key!932 (defaultEntry!4684 thiss!1504)))))

(assert (=> b!253758 false))

(declare-fun b!253759 () Bool)

(assert (=> b!253759 (= e!164495 e!164496)))

(declare-fun res!124205 () Bool)

(assert (=> b!253759 (=> (not res!124205) (not e!164496))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253759 (= res!124205 (inRange!0 index!297 (mask!10924 thiss!1504)))))

(declare-fun lt!127226 () Unit!7821)

(assert (=> b!253759 (= lt!127226 e!164500)))

(declare-fun c!42806 () Bool)

(declare-datatypes ((tuple2!4788 0))(
  ( (tuple2!4789 (_1!2405 (_ BitVec 64)) (_2!2405 V!8353)) )
))
(declare-datatypes ((List!3668 0))(
  ( (Nil!3665) (Cons!3664 (h!4326 tuple2!4788) (t!8707 List!3668)) )
))
(declare-datatypes ((ListLongMap!3703 0))(
  ( (ListLongMap!3704 (toList!1867 List!3668)) )
))
(declare-fun contains!1813 (ListLongMap!3703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1399 (array!12389 array!12387 (_ BitVec 32) (_ BitVec 32) V!8353 V!8353 (_ BitVec 32) Int) ListLongMap!3703)

(assert (=> b!253759 (= c!42806 (contains!1813 (getCurrentListMap!1399 (_keys!6838 thiss!1504) (_values!4667 thiss!1504) (mask!10924 thiss!1504) (extraKeys!4421 thiss!1504) (zeroValue!4525 thiss!1504) (minValue!4525 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4684 thiss!1504)) key!932))))

(declare-fun b!253760 () Bool)

(declare-fun res!124204 () Bool)

(assert (=> b!253760 (=> (not res!124204) (not e!164497))))

(assert (=> b!253760 (= res!124204 (= (select (arr!5870 (_keys!6838 thiss!1504)) (index!6590 lt!127225)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253761 () Bool)

(assert (=> b!253761 (= e!164498 tp_is_empty!6529)))

(declare-fun b!253762 () Bool)

(assert (=> b!253762 (= e!164497 (not call!23935))))

(declare-fun b!253763 () Bool)

(declare-fun Unit!7825 () Unit!7821)

(assert (=> b!253763 (= e!164499 Unit!7825)))

(declare-fun lt!127234 () Unit!7821)

(declare-fun lemmaArrayContainsKeyThenInListMap!225 (array!12389 array!12387 (_ BitVec 32) (_ BitVec 32) V!8353 V!8353 (_ BitVec 64) (_ BitVec 32) Int) Unit!7821)

(assert (=> b!253763 (= lt!127234 (lemmaArrayContainsKeyThenInListMap!225 (_keys!6838 thiss!1504) (_values!4667 thiss!1504) (mask!10924 thiss!1504) (extraKeys!4421 thiss!1504) (zeroValue!4525 thiss!1504) (minValue!4525 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4684 thiss!1504)))))

(assert (=> b!253763 false))

(declare-fun b!253764 () Bool)

(assert (=> b!253764 (= e!164494 ((_ is Undefined!1105) lt!127225))))

(declare-fun b!253765 () Bool)

(assert (=> b!253765 (= e!164501 tp_is_empty!6529)))

(declare-fun b!253766 () Bool)

(declare-fun lt!127233 () Unit!7821)

(assert (=> b!253766 (= e!164500 lt!127233)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!400 (array!12389 array!12387 (_ BitVec 32) (_ BitVec 32) V!8353 V!8353 (_ BitVec 64) Int) Unit!7821)

(assert (=> b!253766 (= lt!127233 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!400 (_keys!6838 thiss!1504) (_values!4667 thiss!1504) (mask!10924 thiss!1504) (extraKeys!4421 thiss!1504) (zeroValue!4525 thiss!1504) (minValue!4525 thiss!1504) key!932 (defaultEntry!4684 thiss!1504)))))

(declare-fun c!42805 () Bool)

(assert (=> b!253766 (= c!42805 ((_ is MissingZero!1105) lt!127225))))

(assert (=> b!253766 e!164506))

(declare-fun bm!23932 () Bool)

(assert (=> bm!23932 (= call!23934 (inRange!0 (ite c!42805 (index!6590 lt!127225) (index!6593 lt!127225)) (mask!10924 thiss!1504)))))

(assert (= (and start!24270 res!124203) b!253751))

(assert (= (and b!253751 res!124207) b!253742))

(assert (= (and b!253742 res!124201) b!253759))

(assert (= (and b!253759 c!42806) b!253758))

(assert (= (and b!253759 (not c!42806)) b!253766))

(assert (= (and b!253766 c!42805) b!253756))

(assert (= (and b!253766 (not c!42805)) b!253753))

(assert (= (and b!253756 res!124202) b!253760))

(assert (= (and b!253760 res!124204) b!253762))

(assert (= (and b!253753 c!42807) b!253744))

(assert (= (and b!253753 (not c!42807)) b!253764))

(assert (= (and b!253744 res!124211) b!253752))

(assert (= (and b!253752 res!124206) b!253757))

(assert (= (or b!253756 b!253744) bm!23932))

(assert (= (or b!253762 b!253757) bm!23931))

(assert (= (and b!253759 res!124205) b!253743))

(assert (= (and b!253743 c!42804) b!253763))

(assert (= (and b!253743 (not c!42804)) b!253748))

(assert (= (and b!253743 (not res!124208)) b!253746))

(assert (= (and b!253746 (not res!124209)) b!253754))

(assert (= (and b!253754 (not res!124199)) b!253755))

(assert (= (and b!253755 (not res!124200)) b!253749))

(assert (= (and b!253749 (not res!124210)) b!253745))

(assert (= (and b!253745 (not res!124212)) b!253741))

(assert (= (and b!253747 condMapEmpty!11109) mapIsEmpty!11109))

(assert (= (and b!253747 (not condMapEmpty!11109)) mapNonEmpty!11109))

(assert (= (and mapNonEmpty!11109 ((_ is ValueCellFull!2921) mapValue!11109)) b!253765))

(assert (= (and b!253747 ((_ is ValueCellFull!2921) mapDefault!11109)) b!253761))

(assert (= b!253750 b!253747))

(assert (= start!24270 b!253750))

(declare-fun m!269639 () Bool)

(assert (=> b!253750 m!269639))

(declare-fun m!269641 () Bool)

(assert (=> b!253750 m!269641))

(declare-fun m!269643 () Bool)

(assert (=> b!253755 m!269643))

(declare-fun m!269645 () Bool)

(assert (=> b!253760 m!269645))

(declare-fun m!269647 () Bool)

(assert (=> b!253752 m!269647))

(declare-fun m!269649 () Bool)

(assert (=> mapNonEmpty!11109 m!269649))

(declare-fun m!269651 () Bool)

(assert (=> bm!23931 m!269651))

(declare-fun m!269653 () Bool)

(assert (=> b!253759 m!269653))

(declare-fun m!269655 () Bool)

(assert (=> b!253759 m!269655))

(assert (=> b!253759 m!269655))

(declare-fun m!269657 () Bool)

(assert (=> b!253759 m!269657))

(declare-fun m!269659 () Bool)

(assert (=> b!253754 m!269659))

(declare-fun m!269661 () Bool)

(assert (=> b!253758 m!269661))

(declare-fun m!269663 () Bool)

(assert (=> b!253763 m!269663))

(declare-fun m!269665 () Bool)

(assert (=> b!253743 m!269665))

(assert (=> b!253743 m!269651))

(declare-fun m!269667 () Bool)

(assert (=> b!253743 m!269667))

(declare-fun m!269669 () Bool)

(assert (=> b!253743 m!269669))

(declare-fun m!269671 () Bool)

(assert (=> b!253743 m!269671))

(declare-fun m!269673 () Bool)

(assert (=> b!253743 m!269673))

(declare-fun m!269675 () Bool)

(assert (=> b!253743 m!269675))

(declare-fun m!269677 () Bool)

(assert (=> b!253743 m!269677))

(declare-fun m!269679 () Bool)

(assert (=> b!253743 m!269679))

(declare-fun m!269681 () Bool)

(assert (=> b!253743 m!269681))

(declare-fun m!269683 () Bool)

(assert (=> b!253742 m!269683))

(declare-fun m!269685 () Bool)

(assert (=> b!253745 m!269685))

(declare-fun m!269687 () Bool)

(assert (=> start!24270 m!269687))

(declare-fun m!269689 () Bool)

(assert (=> b!253766 m!269689))

(declare-fun m!269691 () Bool)

(assert (=> b!253741 m!269691))

(declare-fun m!269693 () Bool)

(assert (=> bm!23932 m!269693))

(check-sat (not b!253750) tp_is_empty!6529 (not b!253743) (not b!253758) (not bm!23931) (not b!253745) (not mapNonEmpty!11109) (not b!253759) b_and!13723 (not b!253766) (not b!253763) (not b_next!6667) (not bm!23932) (not b!253742) (not b!253755) (not b!253754) (not start!24270))
(check-sat b_and!13723 (not b_next!6667))
