; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25138 () Bool)

(assert start!25138)

(declare-fun b!261825 () Bool)

(declare-fun b_free!6781 () Bool)

(declare-fun b_next!6781 () Bool)

(assert (=> b!261825 (= b_free!6781 (not b_next!6781))))

(declare-fun tp!23674 () Bool)

(declare-fun b_and!13889 () Bool)

(assert (=> b!261825 (= tp!23674 b_and!13889)))

(declare-fun mapIsEmpty!11323 () Bool)

(declare-fun mapRes!11323 () Bool)

(assert (=> mapIsEmpty!11323 mapRes!11323))

(declare-fun b!261819 () Bool)

(declare-fun e!169669 () Bool)

(declare-datatypes ((V!8505 0))(
  ( (V!8506 (val!3366 Int)) )
))
(declare-datatypes ((ValueCell!2978 0))(
  ( (ValueCellFull!2978 (v!5485 V!8505)) (EmptyCell!2978) )
))
(declare-datatypes ((array!12635 0))(
  ( (array!12636 (arr!5979 (Array (_ BitVec 32) ValueCell!2978)) (size!6331 (_ BitVec 32))) )
))
(declare-datatypes ((array!12637 0))(
  ( (array!12638 (arr!5980 (Array (_ BitVec 32) (_ BitVec 64))) (size!6332 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3856 0))(
  ( (LongMapFixedSize!3857 (defaultEntry!4826 Int) (mask!11177 (_ BitVec 32)) (extraKeys!4563 (_ BitVec 32)) (zeroValue!4667 V!8505) (minValue!4667 V!8505) (_size!1977 (_ BitVec 32)) (_keys!7013 array!12637) (_values!4809 array!12635) (_vacant!1977 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3856)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!261819 (= e!169669 (or (not (= (size!6331 (_values!4809 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11177 thiss!1504)))) (not (= (size!6332 (_keys!7013 thiss!1504)) (size!6331 (_values!4809 thiss!1504)))) (bvslt (mask!11177 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4563 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4563 thiss!1504) #b00000000000000000000000000000011) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6332 (_keys!7013 thiss!1504))))))))

(declare-fun b!261820 () Bool)

(declare-fun e!169668 () Bool)

(declare-fun e!169675 () Bool)

(assert (=> b!261820 (= e!169668 e!169675)))

(declare-fun res!127872 () Bool)

(declare-fun call!24992 () Bool)

(assert (=> b!261820 (= res!127872 call!24992)))

(assert (=> b!261820 (=> (not res!127872) (not e!169675))))

(declare-fun b!261821 () Bool)

(declare-fun e!169670 () Bool)

(declare-fun tp_is_empty!6643 () Bool)

(assert (=> b!261821 (= e!169670 tp_is_empty!6643)))

(declare-fun b!261822 () Bool)

(declare-fun res!127874 () Bool)

(declare-fun e!169671 () Bool)

(assert (=> b!261822 (=> (not res!127874) (not e!169671))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!261822 (= res!127874 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261823 () Bool)

(declare-fun res!127876 () Bool)

(declare-fun e!169673 () Bool)

(assert (=> b!261823 (=> (not res!127876) (not e!169673))))

(declare-datatypes ((SeekEntryResult!1188 0))(
  ( (MissingZero!1188 (index!6922 (_ BitVec 32))) (Found!1188 (index!6923 (_ BitVec 32))) (Intermediate!1188 (undefined!2000 Bool) (index!6924 (_ BitVec 32)) (x!25193 (_ BitVec 32))) (Undefined!1188) (MissingVacant!1188 (index!6925 (_ BitVec 32))) )
))
(declare-fun lt!132168 () SeekEntryResult!1188)

(assert (=> b!261823 (= res!127876 (= (select (arr!5980 (_keys!7013 thiss!1504)) (index!6922 lt!132168)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261824 () Bool)

(declare-fun c!44598 () Bool)

(get-info :version)

(assert (=> b!261824 (= c!44598 ((_ is MissingVacant!1188) lt!132168))))

(declare-fun e!169672 () Bool)

(assert (=> b!261824 (= e!169672 e!169668)))

(declare-fun bm!24988 () Bool)

(declare-fun c!44596 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24988 (= call!24992 (inRange!0 (ite c!44596 (index!6922 lt!132168) (index!6925 lt!132168)) (mask!11177 thiss!1504)))))

(declare-fun e!169665 () Bool)

(declare-fun e!169674 () Bool)

(declare-fun array_inv!3957 (array!12637) Bool)

(declare-fun array_inv!3958 (array!12635) Bool)

(assert (=> b!261825 (= e!169674 (and tp!23674 tp_is_empty!6643 (array_inv!3957 (_keys!7013 thiss!1504)) (array_inv!3958 (_values!4809 thiss!1504)) e!169665))))

(declare-fun mapNonEmpty!11323 () Bool)

(declare-fun tp!23673 () Bool)

(assert (=> mapNonEmpty!11323 (= mapRes!11323 (and tp!23673 e!169670))))

(declare-fun mapValue!11323 () ValueCell!2978)

(declare-fun mapKey!11323 () (_ BitVec 32))

(declare-fun mapRest!11323 () (Array (_ BitVec 32) ValueCell!2978))

(assert (=> mapNonEmpty!11323 (= (arr!5979 (_values!4809 thiss!1504)) (store mapRest!11323 mapKey!11323 mapValue!11323))))

(declare-fun b!261826 () Bool)

(declare-datatypes ((Unit!8108 0))(
  ( (Unit!8109) )
))
(declare-fun e!169661 () Unit!8108)

(declare-fun Unit!8110 () Unit!8108)

(assert (=> b!261826 (= e!169661 Unit!8110)))

(declare-fun lt!132160 () Unit!8108)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!444 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) Int) Unit!8108)

(assert (=> b!261826 (= lt!132160 (lemmaInListMapThenSeekEntryOrOpenFindsIt!444 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)))))

(assert (=> b!261826 false))

(declare-fun b!261827 () Bool)

(declare-fun e!169662 () Bool)

(assert (=> b!261827 (= e!169662 (not e!169669))))

(declare-fun res!127870 () Bool)

(assert (=> b!261827 (=> res!127870 e!169669)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!261827 (= res!127870 (not (validMask!0 (mask!11177 thiss!1504))))))

(declare-fun lt!132163 () array!12637)

(declare-fun arrayCountValidKeys!0 (array!12637 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261827 (= (arrayCountValidKeys!0 lt!132163 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132167 () Unit!8108)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12637 (_ BitVec 32)) Unit!8108)

(assert (=> b!261827 (= lt!132167 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132163 index!297))))

(declare-fun arrayContainsKey!0 (array!12637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!261827 (arrayContainsKey!0 lt!132163 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132172 () Unit!8108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12637 (_ BitVec 64) (_ BitVec 32)) Unit!8108)

(assert (=> b!261827 (= lt!132172 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132163 key!932 index!297))))

(declare-fun v!346 () V!8505)

(declare-datatypes ((tuple2!4912 0))(
  ( (tuple2!4913 (_1!2467 (_ BitVec 64)) (_2!2467 V!8505)) )
))
(declare-datatypes ((List!3810 0))(
  ( (Nil!3807) (Cons!3806 (h!4472 tuple2!4912) (t!8874 List!3810)) )
))
(declare-datatypes ((ListLongMap!3815 0))(
  ( (ListLongMap!3816 (toList!1923 List!3810)) )
))
(declare-fun lt!132162 () ListLongMap!3815)

(declare-fun +!710 (ListLongMap!3815 tuple2!4912) ListLongMap!3815)

(declare-fun getCurrentListMap!1432 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 32) Int) ListLongMap!3815)

(assert (=> b!261827 (= (+!710 lt!132162 (tuple2!4913 key!932 v!346)) (getCurrentListMap!1432 lt!132163 (array!12636 (store (arr!5979 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6331 (_values!4809 thiss!1504))) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132166 () Unit!8108)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!121 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 32) (_ BitVec 64) V!8505 Int) Unit!8108)

(assert (=> b!261827 (= lt!132166 (lemmaAddValidKeyToArrayThenAddPairToListMap!121 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) index!297 key!932 v!346 (defaultEntry!4826 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12637 (_ BitVec 32)) Bool)

(assert (=> b!261827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132163 (mask!11177 thiss!1504))))

(declare-fun lt!132165 () Unit!8108)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12637 (_ BitVec 32) (_ BitVec 32)) Unit!8108)

(assert (=> b!261827 (= lt!132165 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7013 thiss!1504) index!297 (mask!11177 thiss!1504)))))

(assert (=> b!261827 (= (arrayCountValidKeys!0 lt!132163 #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7013 thiss!1504) #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504)))))))

(declare-fun lt!132161 () Unit!8108)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12637 (_ BitVec 32) (_ BitVec 64)) Unit!8108)

(assert (=> b!261827 (= lt!132161 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7013 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3811 0))(
  ( (Nil!3808) (Cons!3807 (h!4473 (_ BitVec 64)) (t!8875 List!3811)) )
))
(declare-fun arrayNoDuplicates!0 (array!12637 (_ BitVec 32) List!3811) Bool)

(assert (=> b!261827 (arrayNoDuplicates!0 lt!132163 #b00000000000000000000000000000000 Nil!3808)))

(assert (=> b!261827 (= lt!132163 (array!12638 (store (arr!5980 (_keys!7013 thiss!1504)) index!297 key!932) (size!6332 (_keys!7013 thiss!1504))))))

(declare-fun lt!132170 () Unit!8108)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12637 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3811) Unit!8108)

(assert (=> b!261827 (= lt!132170 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7013 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3808))))

(declare-fun lt!132171 () Unit!8108)

(declare-fun e!169667 () Unit!8108)

(assert (=> b!261827 (= lt!132171 e!169667)))

(declare-fun c!44597 () Bool)

(assert (=> b!261827 (= c!44597 (arrayContainsKey!0 (_keys!7013 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261828 () Bool)

(declare-fun e!169664 () Bool)

(assert (=> b!261828 (= e!169664 e!169662)))

(declare-fun res!127873 () Bool)

(assert (=> b!261828 (=> (not res!127873) (not e!169662))))

(assert (=> b!261828 (= res!127873 (inRange!0 index!297 (mask!11177 thiss!1504)))))

(declare-fun lt!132173 () Unit!8108)

(assert (=> b!261828 (= lt!132173 e!169661)))

(declare-fun c!44595 () Bool)

(declare-fun contains!1881 (ListLongMap!3815 (_ BitVec 64)) Bool)

(assert (=> b!261828 (= c!44595 (contains!1881 lt!132162 key!932))))

(assert (=> b!261828 (= lt!132162 (getCurrentListMap!1432 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun b!261829 () Bool)

(assert (=> b!261829 (= e!169668 ((_ is Undefined!1188) lt!132168))))

(declare-fun res!127871 () Bool)

(assert (=> start!25138 (=> (not res!127871) (not e!169671))))

(declare-fun valid!1509 (LongMapFixedSize!3856) Bool)

(assert (=> start!25138 (= res!127871 (valid!1509 thiss!1504))))

(assert (=> start!25138 e!169671))

(assert (=> start!25138 e!169674))

(assert (=> start!25138 true))

(assert (=> start!25138 tp_is_empty!6643))

(declare-fun b!261830 () Bool)

(declare-fun call!24991 () Bool)

(assert (=> b!261830 (= e!169673 (not call!24991))))

(declare-fun b!261831 () Bool)

(declare-fun res!127869 () Bool)

(assert (=> b!261831 (= res!127869 (= (select (arr!5980 (_keys!7013 thiss!1504)) (index!6925 lt!132168)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261831 (=> (not res!127869) (not e!169675))))

(declare-fun b!261832 () Bool)

(declare-fun Unit!8111 () Unit!8108)

(assert (=> b!261832 (= e!169667 Unit!8111)))

(declare-fun b!261833 () Bool)

(declare-fun Unit!8112 () Unit!8108)

(assert (=> b!261833 (= e!169667 Unit!8112)))

(declare-fun lt!132164 () Unit!8108)

(declare-fun lemmaArrayContainsKeyThenInListMap!258 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) (_ BitVec 32) Int) Unit!8108)

(assert (=> b!261833 (= lt!132164 (lemmaArrayContainsKeyThenInListMap!258 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(assert (=> b!261833 false))

(declare-fun b!261834 () Bool)

(declare-fun res!127877 () Bool)

(assert (=> b!261834 (=> (not res!127877) (not e!169673))))

(assert (=> b!261834 (= res!127877 call!24992)))

(assert (=> b!261834 (= e!169672 e!169673)))

(declare-fun b!261835 () Bool)

(declare-fun lt!132169 () Unit!8108)

(assert (=> b!261835 (= e!169661 lt!132169)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!446 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) Int) Unit!8108)

(assert (=> b!261835 (= lt!132169 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!446 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)))))

(assert (=> b!261835 (= c!44596 ((_ is MissingZero!1188) lt!132168))))

(assert (=> b!261835 e!169672))

(declare-fun b!261836 () Bool)

(assert (=> b!261836 (= e!169671 e!169664)))

(declare-fun res!127875 () Bool)

(assert (=> b!261836 (=> (not res!127875) (not e!169664))))

(assert (=> b!261836 (= res!127875 (or (= lt!132168 (MissingZero!1188 index!297)) (= lt!132168 (MissingVacant!1188 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12637 (_ BitVec 32)) SeekEntryResult!1188)

(assert (=> b!261836 (= lt!132168 (seekEntryOrOpen!0 key!932 (_keys!7013 thiss!1504) (mask!11177 thiss!1504)))))

(declare-fun bm!24989 () Bool)

(assert (=> bm!24989 (= call!24991 (arrayContainsKey!0 (_keys!7013 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261837 () Bool)

(declare-fun e!169663 () Bool)

(assert (=> b!261837 (= e!169665 (and e!169663 mapRes!11323))))

(declare-fun condMapEmpty!11323 () Bool)

(declare-fun mapDefault!11323 () ValueCell!2978)

(assert (=> b!261837 (= condMapEmpty!11323 (= (arr!5979 (_values!4809 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2978)) mapDefault!11323)))))

(declare-fun b!261838 () Bool)

(assert (=> b!261838 (= e!169675 (not call!24991))))

(declare-fun b!261839 () Bool)

(assert (=> b!261839 (= e!169663 tp_is_empty!6643)))

(assert (= (and start!25138 res!127871) b!261822))

(assert (= (and b!261822 res!127874) b!261836))

(assert (= (and b!261836 res!127875) b!261828))

(assert (= (and b!261828 c!44595) b!261826))

(assert (= (and b!261828 (not c!44595)) b!261835))

(assert (= (and b!261835 c!44596) b!261834))

(assert (= (and b!261835 (not c!44596)) b!261824))

(assert (= (and b!261834 res!127877) b!261823))

(assert (= (and b!261823 res!127876) b!261830))

(assert (= (and b!261824 c!44598) b!261820))

(assert (= (and b!261824 (not c!44598)) b!261829))

(assert (= (and b!261820 res!127872) b!261831))

(assert (= (and b!261831 res!127869) b!261838))

(assert (= (or b!261834 b!261820) bm!24988))

(assert (= (or b!261830 b!261838) bm!24989))

(assert (= (and b!261828 res!127873) b!261827))

(assert (= (and b!261827 c!44597) b!261833))

(assert (= (and b!261827 (not c!44597)) b!261832))

(assert (= (and b!261827 (not res!127870)) b!261819))

(assert (= (and b!261837 condMapEmpty!11323) mapIsEmpty!11323))

(assert (= (and b!261837 (not condMapEmpty!11323)) mapNonEmpty!11323))

(assert (= (and mapNonEmpty!11323 ((_ is ValueCellFull!2978) mapValue!11323)) b!261821))

(assert (= (and b!261837 ((_ is ValueCellFull!2978) mapDefault!11323)) b!261839))

(assert (= b!261825 b!261837))

(assert (= start!25138 b!261825))

(declare-fun m!277441 () Bool)

(assert (=> b!261835 m!277441))

(declare-fun m!277443 () Bool)

(assert (=> start!25138 m!277443))

(declare-fun m!277445 () Bool)

(assert (=> b!261828 m!277445))

(declare-fun m!277447 () Bool)

(assert (=> b!261828 m!277447))

(declare-fun m!277449 () Bool)

(assert (=> b!261828 m!277449))

(declare-fun m!277451 () Bool)

(assert (=> b!261827 m!277451))

(declare-fun m!277453 () Bool)

(assert (=> b!261827 m!277453))

(declare-fun m!277455 () Bool)

(assert (=> b!261827 m!277455))

(declare-fun m!277457 () Bool)

(assert (=> b!261827 m!277457))

(declare-fun m!277459 () Bool)

(assert (=> b!261827 m!277459))

(declare-fun m!277461 () Bool)

(assert (=> b!261827 m!277461))

(declare-fun m!277463 () Bool)

(assert (=> b!261827 m!277463))

(declare-fun m!277465 () Bool)

(assert (=> b!261827 m!277465))

(declare-fun m!277467 () Bool)

(assert (=> b!261827 m!277467))

(declare-fun m!277469 () Bool)

(assert (=> b!261827 m!277469))

(declare-fun m!277471 () Bool)

(assert (=> b!261827 m!277471))

(declare-fun m!277473 () Bool)

(assert (=> b!261827 m!277473))

(declare-fun m!277475 () Bool)

(assert (=> b!261827 m!277475))

(declare-fun m!277477 () Bool)

(assert (=> b!261827 m!277477))

(declare-fun m!277479 () Bool)

(assert (=> b!261827 m!277479))

(declare-fun m!277481 () Bool)

(assert (=> b!261827 m!277481))

(declare-fun m!277483 () Bool)

(assert (=> b!261827 m!277483))

(declare-fun m!277485 () Bool)

(assert (=> b!261827 m!277485))

(declare-fun m!277487 () Bool)

(assert (=> bm!24988 m!277487))

(declare-fun m!277489 () Bool)

(assert (=> b!261825 m!277489))

(declare-fun m!277491 () Bool)

(assert (=> b!261825 m!277491))

(declare-fun m!277493 () Bool)

(assert (=> b!261826 m!277493))

(declare-fun m!277495 () Bool)

(assert (=> b!261831 m!277495))

(declare-fun m!277497 () Bool)

(assert (=> b!261823 m!277497))

(declare-fun m!277499 () Bool)

(assert (=> mapNonEmpty!11323 m!277499))

(declare-fun m!277501 () Bool)

(assert (=> b!261836 m!277501))

(assert (=> bm!24989 m!277453))

(declare-fun m!277503 () Bool)

(assert (=> b!261833 m!277503))

(check-sat (not bm!24988) (not b!261835) (not b!261828) (not start!25138) (not b!261833) (not b!261825) (not mapNonEmpty!11323) (not bm!24989) (not b!261827) (not b!261836) b_and!13889 (not b_next!6781) tp_is_empty!6643 (not b!261826))
(check-sat b_and!13889 (not b_next!6781))
(get-model)

(declare-fun d!62815 () Bool)

(declare-fun res!127938 () Bool)

(declare-fun e!169768 () Bool)

(assert (=> d!62815 (=> (not res!127938) (not e!169768))))

(declare-fun simpleValid!283 (LongMapFixedSize!3856) Bool)

(assert (=> d!62815 (= res!127938 (simpleValid!283 thiss!1504))))

(assert (=> d!62815 (= (valid!1509 thiss!1504) e!169768)))

(declare-fun b!261972 () Bool)

(declare-fun res!127939 () Bool)

(assert (=> b!261972 (=> (not res!127939) (not e!169768))))

(assert (=> b!261972 (= res!127939 (= (arrayCountValidKeys!0 (_keys!7013 thiss!1504) #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))) (_size!1977 thiss!1504)))))

(declare-fun b!261973 () Bool)

(declare-fun res!127940 () Bool)

(assert (=> b!261973 (=> (not res!127940) (not e!169768))))

(assert (=> b!261973 (= res!127940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7013 thiss!1504) (mask!11177 thiss!1504)))))

(declare-fun b!261974 () Bool)

(assert (=> b!261974 (= e!169768 (arrayNoDuplicates!0 (_keys!7013 thiss!1504) #b00000000000000000000000000000000 Nil!3808))))

(assert (= (and d!62815 res!127938) b!261972))

(assert (= (and b!261972 res!127939) b!261973))

(assert (= (and b!261973 res!127940) b!261974))

(declare-fun m!277633 () Bool)

(assert (=> d!62815 m!277633))

(assert (=> b!261972 m!277473))

(declare-fun m!277635 () Bool)

(assert (=> b!261973 m!277635))

(declare-fun m!277637 () Bool)

(assert (=> b!261974 m!277637))

(assert (=> start!25138 d!62815))

(declare-fun b!261987 () Bool)

(declare-fun e!169776 () SeekEntryResult!1188)

(assert (=> b!261987 (= e!169776 Undefined!1188)))

(declare-fun b!261988 () Bool)

(declare-fun e!169777 () SeekEntryResult!1188)

(declare-fun lt!132266 () SeekEntryResult!1188)

(assert (=> b!261988 (= e!169777 (Found!1188 (index!6924 lt!132266)))))

(declare-fun d!62817 () Bool)

(declare-fun lt!132264 () SeekEntryResult!1188)

(assert (=> d!62817 (and (or ((_ is Undefined!1188) lt!132264) (not ((_ is Found!1188) lt!132264)) (and (bvsge (index!6923 lt!132264) #b00000000000000000000000000000000) (bvslt (index!6923 lt!132264) (size!6332 (_keys!7013 thiss!1504))))) (or ((_ is Undefined!1188) lt!132264) ((_ is Found!1188) lt!132264) (not ((_ is MissingZero!1188) lt!132264)) (and (bvsge (index!6922 lt!132264) #b00000000000000000000000000000000) (bvslt (index!6922 lt!132264) (size!6332 (_keys!7013 thiss!1504))))) (or ((_ is Undefined!1188) lt!132264) ((_ is Found!1188) lt!132264) ((_ is MissingZero!1188) lt!132264) (not ((_ is MissingVacant!1188) lt!132264)) (and (bvsge (index!6925 lt!132264) #b00000000000000000000000000000000) (bvslt (index!6925 lt!132264) (size!6332 (_keys!7013 thiss!1504))))) (or ((_ is Undefined!1188) lt!132264) (ite ((_ is Found!1188) lt!132264) (= (select (arr!5980 (_keys!7013 thiss!1504)) (index!6923 lt!132264)) key!932) (ite ((_ is MissingZero!1188) lt!132264) (= (select (arr!5980 (_keys!7013 thiss!1504)) (index!6922 lt!132264)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1188) lt!132264) (= (select (arr!5980 (_keys!7013 thiss!1504)) (index!6925 lt!132264)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62817 (= lt!132264 e!169776)))

(declare-fun c!44629 () Bool)

(assert (=> d!62817 (= c!44629 (and ((_ is Intermediate!1188) lt!132266) (undefined!2000 lt!132266)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12637 (_ BitVec 32)) SeekEntryResult!1188)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62817 (= lt!132266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11177 thiss!1504)) key!932 (_keys!7013 thiss!1504) (mask!11177 thiss!1504)))))

(assert (=> d!62817 (validMask!0 (mask!11177 thiss!1504))))

(assert (=> d!62817 (= (seekEntryOrOpen!0 key!932 (_keys!7013 thiss!1504) (mask!11177 thiss!1504)) lt!132264)))

(declare-fun b!261989 () Bool)

(declare-fun c!44630 () Bool)

(declare-fun lt!132265 () (_ BitVec 64))

(assert (=> b!261989 (= c!44630 (= lt!132265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169775 () SeekEntryResult!1188)

(assert (=> b!261989 (= e!169777 e!169775)))

(declare-fun b!261990 () Bool)

(assert (=> b!261990 (= e!169775 (MissingZero!1188 (index!6924 lt!132266)))))

(declare-fun b!261991 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12637 (_ BitVec 32)) SeekEntryResult!1188)

(assert (=> b!261991 (= e!169775 (seekKeyOrZeroReturnVacant!0 (x!25193 lt!132266) (index!6924 lt!132266) (index!6924 lt!132266) key!932 (_keys!7013 thiss!1504) (mask!11177 thiss!1504)))))

(declare-fun b!261992 () Bool)

(assert (=> b!261992 (= e!169776 e!169777)))

(assert (=> b!261992 (= lt!132265 (select (arr!5980 (_keys!7013 thiss!1504)) (index!6924 lt!132266)))))

(declare-fun c!44631 () Bool)

(assert (=> b!261992 (= c!44631 (= lt!132265 key!932))))

(assert (= (and d!62817 c!44629) b!261987))

(assert (= (and d!62817 (not c!44629)) b!261992))

(assert (= (and b!261992 c!44631) b!261988))

(assert (= (and b!261992 (not c!44631)) b!261989))

(assert (= (and b!261989 c!44630) b!261990))

(assert (= (and b!261989 (not c!44630)) b!261991))

(assert (=> d!62817 m!277451))

(declare-fun m!277639 () Bool)

(assert (=> d!62817 m!277639))

(declare-fun m!277641 () Bool)

(assert (=> d!62817 m!277641))

(declare-fun m!277643 () Bool)

(assert (=> d!62817 m!277643))

(declare-fun m!277645 () Bool)

(assert (=> d!62817 m!277645))

(assert (=> d!62817 m!277643))

(declare-fun m!277647 () Bool)

(assert (=> d!62817 m!277647))

(declare-fun m!277649 () Bool)

(assert (=> b!261991 m!277649))

(declare-fun m!277651 () Bool)

(assert (=> b!261992 m!277651))

(assert (=> b!261836 d!62817))

(declare-fun d!62819 () Bool)

(declare-fun res!127945 () Bool)

(declare-fun e!169782 () Bool)

(assert (=> d!62819 (=> res!127945 e!169782)))

(assert (=> d!62819 (= res!127945 (= (select (arr!5980 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62819 (= (arrayContainsKey!0 (_keys!7013 thiss!1504) key!932 #b00000000000000000000000000000000) e!169782)))

(declare-fun b!261997 () Bool)

(declare-fun e!169783 () Bool)

(assert (=> b!261997 (= e!169782 e!169783)))

(declare-fun res!127946 () Bool)

(assert (=> b!261997 (=> (not res!127946) (not e!169783))))

(assert (=> b!261997 (= res!127946 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6332 (_keys!7013 thiss!1504))))))

(declare-fun b!261998 () Bool)

(assert (=> b!261998 (= e!169783 (arrayContainsKey!0 (_keys!7013 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62819 (not res!127945)) b!261997))

(assert (= (and b!261997 res!127946) b!261998))

(declare-fun m!277653 () Bool)

(assert (=> d!62819 m!277653))

(declare-fun m!277655 () Bool)

(assert (=> b!261998 m!277655))

(assert (=> bm!24989 d!62819))

(declare-fun d!62821 () Bool)

(declare-fun e!169786 () Bool)

(assert (=> d!62821 e!169786))

(declare-fun res!127952 () Bool)

(assert (=> d!62821 (=> (not res!127952) (not e!169786))))

(declare-fun lt!132271 () SeekEntryResult!1188)

(assert (=> d!62821 (= res!127952 ((_ is Found!1188) lt!132271))))

(assert (=> d!62821 (= lt!132271 (seekEntryOrOpen!0 key!932 (_keys!7013 thiss!1504) (mask!11177 thiss!1504)))))

(declare-fun lt!132272 () Unit!8108)

(declare-fun choose!1287 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) Int) Unit!8108)

(assert (=> d!62821 (= lt!132272 (choose!1287 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)))))

(assert (=> d!62821 (validMask!0 (mask!11177 thiss!1504))))

(assert (=> d!62821 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!444 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)) lt!132272)))

(declare-fun b!262003 () Bool)

(declare-fun res!127951 () Bool)

(assert (=> b!262003 (=> (not res!127951) (not e!169786))))

(assert (=> b!262003 (= res!127951 (inRange!0 (index!6923 lt!132271) (mask!11177 thiss!1504)))))

(declare-fun b!262004 () Bool)

(assert (=> b!262004 (= e!169786 (= (select (arr!5980 (_keys!7013 thiss!1504)) (index!6923 lt!132271)) key!932))))

(assert (=> b!262004 (and (bvsge (index!6923 lt!132271) #b00000000000000000000000000000000) (bvslt (index!6923 lt!132271) (size!6332 (_keys!7013 thiss!1504))))))

(assert (= (and d!62821 res!127952) b!262003))

(assert (= (and b!262003 res!127951) b!262004))

(assert (=> d!62821 m!277501))

(declare-fun m!277657 () Bool)

(assert (=> d!62821 m!277657))

(assert (=> d!62821 m!277451))

(declare-fun m!277659 () Bool)

(assert (=> b!262003 m!277659))

(declare-fun m!277661 () Bool)

(assert (=> b!262004 m!277661))

(assert (=> b!261826 d!62821))

(declare-fun b!262047 () Bool)

(declare-fun e!169813 () Bool)

(declare-fun call!25022 () Bool)

(assert (=> b!262047 (= e!169813 (not call!25022))))

(declare-fun b!262048 () Bool)

(declare-fun e!169815 () Unit!8108)

(declare-fun lt!132328 () Unit!8108)

(assert (=> b!262048 (= e!169815 lt!132328)))

(declare-fun lt!132322 () ListLongMap!3815)

(declare-fun getCurrentListMapNoExtraKeys!576 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 32) Int) ListLongMap!3815)

(assert (=> b!262048 (= lt!132322 (getCurrentListMapNoExtraKeys!576 lt!132163 (array!12636 (store (arr!5979 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6331 (_values!4809 thiss!1504))) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132319 () (_ BitVec 64))

(assert (=> b!262048 (= lt!132319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132334 () (_ BitVec 64))

(assert (=> b!262048 (= lt!132334 (select (arr!5980 lt!132163) #b00000000000000000000000000000000))))

(declare-fun lt!132324 () Unit!8108)

(declare-fun addStillContains!236 (ListLongMap!3815 (_ BitVec 64) V!8505 (_ BitVec 64)) Unit!8108)

(assert (=> b!262048 (= lt!132324 (addStillContains!236 lt!132322 lt!132319 (zeroValue!4667 thiss!1504) lt!132334))))

(assert (=> b!262048 (contains!1881 (+!710 lt!132322 (tuple2!4913 lt!132319 (zeroValue!4667 thiss!1504))) lt!132334)))

(declare-fun lt!132323 () Unit!8108)

(assert (=> b!262048 (= lt!132323 lt!132324)))

(declare-fun lt!132320 () ListLongMap!3815)

(assert (=> b!262048 (= lt!132320 (getCurrentListMapNoExtraKeys!576 lt!132163 (array!12636 (store (arr!5979 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6331 (_values!4809 thiss!1504))) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132333 () (_ BitVec 64))

(assert (=> b!262048 (= lt!132333 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132318 () (_ BitVec 64))

(assert (=> b!262048 (= lt!132318 (select (arr!5980 lt!132163) #b00000000000000000000000000000000))))

(declare-fun lt!132329 () Unit!8108)

(declare-fun addApplyDifferent!236 (ListLongMap!3815 (_ BitVec 64) V!8505 (_ BitVec 64)) Unit!8108)

(assert (=> b!262048 (= lt!132329 (addApplyDifferent!236 lt!132320 lt!132333 (minValue!4667 thiss!1504) lt!132318))))

(declare-fun apply!260 (ListLongMap!3815 (_ BitVec 64)) V!8505)

(assert (=> b!262048 (= (apply!260 (+!710 lt!132320 (tuple2!4913 lt!132333 (minValue!4667 thiss!1504))) lt!132318) (apply!260 lt!132320 lt!132318))))

(declare-fun lt!132325 () Unit!8108)

(assert (=> b!262048 (= lt!132325 lt!132329)))

(declare-fun lt!132321 () ListLongMap!3815)

(assert (=> b!262048 (= lt!132321 (getCurrentListMapNoExtraKeys!576 lt!132163 (array!12636 (store (arr!5979 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6331 (_values!4809 thiss!1504))) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132331 () (_ BitVec 64))

(assert (=> b!262048 (= lt!132331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132337 () (_ BitVec 64))

(assert (=> b!262048 (= lt!132337 (select (arr!5980 lt!132163) #b00000000000000000000000000000000))))

(declare-fun lt!132317 () Unit!8108)

(assert (=> b!262048 (= lt!132317 (addApplyDifferent!236 lt!132321 lt!132331 (zeroValue!4667 thiss!1504) lt!132337))))

(assert (=> b!262048 (= (apply!260 (+!710 lt!132321 (tuple2!4913 lt!132331 (zeroValue!4667 thiss!1504))) lt!132337) (apply!260 lt!132321 lt!132337))))

(declare-fun lt!132335 () Unit!8108)

(assert (=> b!262048 (= lt!132335 lt!132317)))

(declare-fun lt!132332 () ListLongMap!3815)

(assert (=> b!262048 (= lt!132332 (getCurrentListMapNoExtraKeys!576 lt!132163 (array!12636 (store (arr!5979 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6331 (_values!4809 thiss!1504))) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132336 () (_ BitVec 64))

(assert (=> b!262048 (= lt!132336 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132338 () (_ BitVec 64))

(assert (=> b!262048 (= lt!132338 (select (arr!5980 lt!132163) #b00000000000000000000000000000000))))

(assert (=> b!262048 (= lt!132328 (addApplyDifferent!236 lt!132332 lt!132336 (minValue!4667 thiss!1504) lt!132338))))

(assert (=> b!262048 (= (apply!260 (+!710 lt!132332 (tuple2!4913 lt!132336 (minValue!4667 thiss!1504))) lt!132338) (apply!260 lt!132332 lt!132338))))

(declare-fun bm!25016 () Bool)

(declare-fun call!25019 () ListLongMap!3815)

(assert (=> bm!25016 (= call!25019 (getCurrentListMapNoExtraKeys!576 lt!132163 (array!12636 (store (arr!5979 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6331 (_values!4809 thiss!1504))) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun bm!25017 () Bool)

(declare-fun lt!132327 () ListLongMap!3815)

(assert (=> bm!25017 (= call!25022 (contains!1881 lt!132327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25018 () Bool)

(declare-fun call!25024 () ListLongMap!3815)

(declare-fun call!25020 () ListLongMap!3815)

(assert (=> bm!25018 (= call!25024 call!25020)))

(declare-fun b!262049 () Bool)

(declare-fun e!169818 () Bool)

(declare-fun e!169817 () Bool)

(assert (=> b!262049 (= e!169818 e!169817)))

(declare-fun res!127978 () Bool)

(assert (=> b!262049 (=> (not res!127978) (not e!169817))))

(assert (=> b!262049 (= res!127978 (contains!1881 lt!132327 (select (arr!5980 lt!132163) #b00000000000000000000000000000000)))))

(assert (=> b!262049 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6332 lt!132163)))))

(declare-fun b!262050 () Bool)

(declare-fun res!127971 () Bool)

(declare-fun e!169821 () Bool)

(assert (=> b!262050 (=> (not res!127971) (not e!169821))))

(assert (=> b!262050 (= res!127971 e!169818)))

(declare-fun res!127979 () Bool)

(assert (=> b!262050 (=> res!127979 e!169818)))

(declare-fun e!169825 () Bool)

(assert (=> b!262050 (= res!127979 (not e!169825))))

(declare-fun res!127976 () Bool)

(assert (=> b!262050 (=> (not res!127976) (not e!169825))))

(assert (=> b!262050 (= res!127976 (bvslt #b00000000000000000000000000000000 (size!6332 lt!132163)))))

(declare-fun bm!25019 () Bool)

(declare-fun call!25023 () ListLongMap!3815)

(assert (=> bm!25019 (= call!25023 call!25019)))

(declare-fun b!262052 () Bool)

(declare-fun e!169816 () ListLongMap!3815)

(assert (=> b!262052 (= e!169816 call!25024)))

(declare-fun b!262053 () Bool)

(declare-fun res!127975 () Bool)

(assert (=> b!262053 (=> (not res!127975) (not e!169821))))

(assert (=> b!262053 (= res!127975 e!169813)))

(declare-fun c!44644 () Bool)

(assert (=> b!262053 (= c!44644 (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262054 () Bool)

(declare-fun e!169823 () ListLongMap!3815)

(assert (=> b!262054 (= e!169823 call!25024)))

(declare-fun b!262055 () Bool)

(declare-fun e!169824 () Bool)

(assert (=> b!262055 (= e!169813 e!169824)))

(declare-fun res!127972 () Bool)

(assert (=> b!262055 (= res!127972 call!25022)))

(assert (=> b!262055 (=> (not res!127972) (not e!169824))))

(declare-fun b!262056 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!262056 (= e!169825 (validKeyInArray!0 (select (arr!5980 lt!132163) #b00000000000000000000000000000000)))))

(declare-fun b!262057 () Bool)

(declare-fun e!169819 () Bool)

(declare-fun e!169820 () Bool)

(assert (=> b!262057 (= e!169819 e!169820)))

(declare-fun res!127973 () Bool)

(declare-fun call!25021 () Bool)

(assert (=> b!262057 (= res!127973 call!25021)))

(assert (=> b!262057 (=> (not res!127973) (not e!169820))))

(declare-fun b!262058 () Bool)

(assert (=> b!262058 (= e!169821 e!169819)))

(declare-fun c!44645 () Bool)

(assert (=> b!262058 (= c!44645 (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262059 () Bool)

(declare-fun call!25025 () ListLongMap!3815)

(assert (=> b!262059 (= e!169816 call!25025)))

(declare-fun b!262060 () Bool)

(declare-fun e!169814 () ListLongMap!3815)

(assert (=> b!262060 (= e!169814 (+!710 call!25020 (tuple2!4913 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4667 thiss!1504))))))

(declare-fun b!262061 () Bool)

(assert (=> b!262061 (= e!169820 (= (apply!260 lt!132327 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4667 thiss!1504)))))

(declare-fun bm!25020 () Bool)

(assert (=> bm!25020 (= call!25025 call!25023)))

(declare-fun bm!25021 () Bool)

(assert (=> bm!25021 (= call!25021 (contains!1881 lt!132327 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262062 () Bool)

(declare-fun c!44649 () Bool)

(assert (=> b!262062 (= c!44649 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!262062 (= e!169823 e!169816)))

(declare-fun b!262063 () Bool)

(declare-fun e!169822 () Bool)

(assert (=> b!262063 (= e!169822 (validKeyInArray!0 (select (arr!5980 lt!132163) #b00000000000000000000000000000000)))))

(declare-fun b!262064 () Bool)

(assert (=> b!262064 (= e!169814 e!169823)))

(declare-fun c!44646 () Bool)

(assert (=> b!262064 (= c!44646 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!25022 () Bool)

(declare-fun c!44647 () Bool)

(assert (=> bm!25022 (= call!25020 (+!710 (ite c!44647 call!25019 (ite c!44646 call!25023 call!25025)) (ite (or c!44647 c!44646) (tuple2!4913 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4667 thiss!1504)) (tuple2!4913 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4667 thiss!1504)))))))

(declare-fun b!262065 () Bool)

(declare-fun Unit!8121 () Unit!8108)

(assert (=> b!262065 (= e!169815 Unit!8121)))

(declare-fun d!62823 () Bool)

(assert (=> d!62823 e!169821))

(declare-fun res!127974 () Bool)

(assert (=> d!62823 (=> (not res!127974) (not e!169821))))

(assert (=> d!62823 (= res!127974 (or (bvsge #b00000000000000000000000000000000 (size!6332 lt!132163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6332 lt!132163)))))))

(declare-fun lt!132330 () ListLongMap!3815)

(assert (=> d!62823 (= lt!132327 lt!132330)))

(declare-fun lt!132326 () Unit!8108)

(assert (=> d!62823 (= lt!132326 e!169815)))

(declare-fun c!44648 () Bool)

(assert (=> d!62823 (= c!44648 e!169822)))

(declare-fun res!127977 () Bool)

(assert (=> d!62823 (=> (not res!127977) (not e!169822))))

(assert (=> d!62823 (= res!127977 (bvslt #b00000000000000000000000000000000 (size!6332 lt!132163)))))

(assert (=> d!62823 (= lt!132330 e!169814)))

(assert (=> d!62823 (= c!44647 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62823 (validMask!0 (mask!11177 thiss!1504))))

(assert (=> d!62823 (= (getCurrentListMap!1432 lt!132163 (array!12636 (store (arr!5979 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6331 (_values!4809 thiss!1504))) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)) lt!132327)))

(declare-fun b!262051 () Bool)

(assert (=> b!262051 (= e!169824 (= (apply!260 lt!132327 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4667 thiss!1504)))))

(declare-fun b!262066 () Bool)

(assert (=> b!262066 (= e!169819 (not call!25021))))

(declare-fun b!262067 () Bool)

(declare-fun get!3081 (ValueCell!2978 V!8505) V!8505)

(declare-fun dynLambda!594 (Int (_ BitVec 64)) V!8505)

(assert (=> b!262067 (= e!169817 (= (apply!260 lt!132327 (select (arr!5980 lt!132163) #b00000000000000000000000000000000)) (get!3081 (select (arr!5979 (array!12636 (store (arr!5979 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6331 (_values!4809 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!594 (defaultEntry!4826 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6331 (array!12636 (store (arr!5979 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6331 (_values!4809 thiss!1504))))))))

(assert (=> b!262067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6332 lt!132163)))))

(assert (= (and d!62823 c!44647) b!262060))

(assert (= (and d!62823 (not c!44647)) b!262064))

(assert (= (and b!262064 c!44646) b!262054))

(assert (= (and b!262064 (not c!44646)) b!262062))

(assert (= (and b!262062 c!44649) b!262052))

(assert (= (and b!262062 (not c!44649)) b!262059))

(assert (= (or b!262052 b!262059) bm!25020))

(assert (= (or b!262054 bm!25020) bm!25019))

(assert (= (or b!262054 b!262052) bm!25018))

(assert (= (or b!262060 bm!25019) bm!25016))

(assert (= (or b!262060 bm!25018) bm!25022))

(assert (= (and d!62823 res!127977) b!262063))

(assert (= (and d!62823 c!44648) b!262048))

(assert (= (and d!62823 (not c!44648)) b!262065))

(assert (= (and d!62823 res!127974) b!262050))

(assert (= (and b!262050 res!127976) b!262056))

(assert (= (and b!262050 (not res!127979)) b!262049))

(assert (= (and b!262049 res!127978) b!262067))

(assert (= (and b!262050 res!127971) b!262053))

(assert (= (and b!262053 c!44644) b!262055))

(assert (= (and b!262053 (not c!44644)) b!262047))

(assert (= (and b!262055 res!127972) b!262051))

(assert (= (or b!262055 b!262047) bm!25017))

(assert (= (and b!262053 res!127975) b!262058))

(assert (= (and b!262058 c!44645) b!262057))

(assert (= (and b!262058 (not c!44645)) b!262066))

(assert (= (and b!262057 res!127973) b!262061))

(assert (= (or b!262057 b!262066) bm!25021))

(declare-fun b_lambda!8297 () Bool)

(assert (=> (not b_lambda!8297) (not b!262067)))

(declare-fun t!8879 () Bool)

(declare-fun tb!3025 () Bool)

(assert (=> (and b!261825 (= (defaultEntry!4826 thiss!1504) (defaultEntry!4826 thiss!1504)) t!8879) tb!3025))

(declare-fun result!5413 () Bool)

(assert (=> tb!3025 (= result!5413 tp_is_empty!6643)))

(assert (=> b!262067 t!8879))

(declare-fun b_and!13895 () Bool)

(assert (= b_and!13889 (and (=> t!8879 result!5413) b_and!13895)))

(declare-fun m!277663 () Bool)

(assert (=> b!262063 m!277663))

(assert (=> b!262063 m!277663))

(declare-fun m!277665 () Bool)

(assert (=> b!262063 m!277665))

(declare-fun m!277667 () Bool)

(assert (=> b!262061 m!277667))

(declare-fun m!277669 () Bool)

(assert (=> b!262048 m!277669))

(declare-fun m!277671 () Bool)

(assert (=> b!262048 m!277671))

(declare-fun m!277673 () Bool)

(assert (=> b!262048 m!277673))

(declare-fun m!277675 () Bool)

(assert (=> b!262048 m!277675))

(declare-fun m!277677 () Bool)

(assert (=> b!262048 m!277677))

(declare-fun m!277679 () Bool)

(assert (=> b!262048 m!277679))

(declare-fun m!277681 () Bool)

(assert (=> b!262048 m!277681))

(declare-fun m!277683 () Bool)

(assert (=> b!262048 m!277683))

(assert (=> b!262048 m!277675))

(declare-fun m!277685 () Bool)

(assert (=> b!262048 m!277685))

(assert (=> b!262048 m!277679))

(declare-fun m!277687 () Bool)

(assert (=> b!262048 m!277687))

(assert (=> b!262048 m!277683))

(declare-fun m!277689 () Bool)

(assert (=> b!262048 m!277689))

(declare-fun m!277691 () Bool)

(assert (=> b!262048 m!277691))

(declare-fun m!277693 () Bool)

(assert (=> b!262048 m!277693))

(declare-fun m!277695 () Bool)

(assert (=> b!262048 m!277695))

(declare-fun m!277697 () Bool)

(assert (=> b!262048 m!277697))

(assert (=> b!262048 m!277663))

(assert (=> b!262048 m!277671))

(declare-fun m!277699 () Bool)

(assert (=> b!262048 m!277699))

(declare-fun m!277701 () Bool)

(assert (=> bm!25021 m!277701))

(assert (=> b!262067 m!277663))

(declare-fun m!277703 () Bool)

(assert (=> b!262067 m!277703))

(assert (=> b!262067 m!277663))

(declare-fun m!277705 () Bool)

(assert (=> b!262067 m!277705))

(declare-fun m!277707 () Bool)

(assert (=> b!262067 m!277707))

(assert (=> b!262067 m!277705))

(declare-fun m!277709 () Bool)

(assert (=> b!262067 m!277709))

(assert (=> b!262067 m!277707))

(declare-fun m!277711 () Bool)

(assert (=> bm!25017 m!277711))

(declare-fun m!277713 () Bool)

(assert (=> bm!25022 m!277713))

(declare-fun m!277715 () Bool)

(assert (=> b!262060 m!277715))

(declare-fun m!277717 () Bool)

(assert (=> b!262051 m!277717))

(assert (=> bm!25016 m!277695))

(assert (=> b!262049 m!277663))

(assert (=> b!262049 m!277663))

(declare-fun m!277719 () Bool)

(assert (=> b!262049 m!277719))

(assert (=> b!262056 m!277663))

(assert (=> b!262056 m!277663))

(assert (=> b!262056 m!277665))

(assert (=> d!62823 m!277451))

(assert (=> b!261827 d!62823))

(declare-fun b!262080 () Bool)

(declare-fun e!169831 () Bool)

(assert (=> b!262080 (= e!169831 (bvslt (size!6332 (_keys!7013 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!262081 () Bool)

(declare-fun e!169830 () Bool)

(assert (=> b!262081 (= e!169830 (= (arrayCountValidKeys!0 (array!12638 (store (arr!5980 (_keys!7013 thiss!1504)) index!297 key!932) (size!6332 (_keys!7013 thiss!1504))) #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7013 thiss!1504) #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!62825 () Bool)

(assert (=> d!62825 e!169830))

(declare-fun res!127989 () Bool)

(assert (=> d!62825 (=> (not res!127989) (not e!169830))))

(assert (=> d!62825 (= res!127989 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6332 (_keys!7013 thiss!1504)))))))

(declare-fun lt!132341 () Unit!8108)

(declare-fun choose!1 (array!12637 (_ BitVec 32) (_ BitVec 64)) Unit!8108)

(assert (=> d!62825 (= lt!132341 (choose!1 (_keys!7013 thiss!1504) index!297 key!932))))

(assert (=> d!62825 e!169831))

(declare-fun res!127988 () Bool)

(assert (=> d!62825 (=> (not res!127988) (not e!169831))))

(assert (=> d!62825 (= res!127988 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6332 (_keys!7013 thiss!1504)))))))

(assert (=> d!62825 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7013 thiss!1504) index!297 key!932) lt!132341)))

(declare-fun b!262078 () Bool)

(declare-fun res!127991 () Bool)

(assert (=> b!262078 (=> (not res!127991) (not e!169831))))

(assert (=> b!262078 (= res!127991 (not (validKeyInArray!0 (select (arr!5980 (_keys!7013 thiss!1504)) index!297))))))

(declare-fun b!262079 () Bool)

(declare-fun res!127990 () Bool)

(assert (=> b!262079 (=> (not res!127990) (not e!169831))))

(assert (=> b!262079 (= res!127990 (validKeyInArray!0 key!932))))

(assert (= (and d!62825 res!127988) b!262078))

(assert (= (and b!262078 res!127991) b!262079))

(assert (= (and b!262079 res!127990) b!262080))

(assert (= (and d!62825 res!127989) b!262081))

(assert (=> b!262081 m!277471))

(declare-fun m!277721 () Bool)

(assert (=> b!262081 m!277721))

(assert (=> b!262081 m!277473))

(declare-fun m!277723 () Bool)

(assert (=> d!62825 m!277723))

(declare-fun m!277725 () Bool)

(assert (=> b!262078 m!277725))

(assert (=> b!262078 m!277725))

(declare-fun m!277727 () Bool)

(assert (=> b!262078 m!277727))

(declare-fun m!277729 () Bool)

(assert (=> b!262079 m!277729))

(assert (=> b!261827 d!62825))

(declare-fun b!262090 () Bool)

(declare-fun e!169836 () (_ BitVec 32))

(declare-fun e!169837 () (_ BitVec 32))

(assert (=> b!262090 (= e!169836 e!169837)))

(declare-fun c!44654 () Bool)

(assert (=> b!262090 (= c!44654 (validKeyInArray!0 (select (arr!5980 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!25025 () Bool)

(declare-fun call!25028 () (_ BitVec 32))

(assert (=> bm!25025 (= call!25028 (arrayCountValidKeys!0 (_keys!7013 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6332 (_keys!7013 thiss!1504))))))

(declare-fun b!262091 () Bool)

(assert (=> b!262091 (= e!169836 #b00000000000000000000000000000000)))

(declare-fun d!62827 () Bool)

(declare-fun lt!132344 () (_ BitVec 32))

(assert (=> d!62827 (and (bvsge lt!132344 #b00000000000000000000000000000000) (bvsle lt!132344 (bvsub (size!6332 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62827 (= lt!132344 e!169836)))

(declare-fun c!44655 () Bool)

(assert (=> d!62827 (= c!44655 (bvsge #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))))))

(assert (=> d!62827 (and (bvsle #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6332 (_keys!7013 thiss!1504)) (size!6332 (_keys!7013 thiss!1504))))))

(assert (=> d!62827 (= (arrayCountValidKeys!0 (_keys!7013 thiss!1504) #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))) lt!132344)))

(declare-fun b!262092 () Bool)

(assert (=> b!262092 (= e!169837 (bvadd #b00000000000000000000000000000001 call!25028))))

(declare-fun b!262093 () Bool)

(assert (=> b!262093 (= e!169837 call!25028)))

(assert (= (and d!62827 c!44655) b!262091))

(assert (= (and d!62827 (not c!44655)) b!262090))

(assert (= (and b!262090 c!44654) b!262092))

(assert (= (and b!262090 (not c!44654)) b!262093))

(assert (= (or b!262092 b!262093) bm!25025))

(assert (=> b!262090 m!277653))

(assert (=> b!262090 m!277653))

(declare-fun m!277731 () Bool)

(assert (=> b!262090 m!277731))

(declare-fun m!277733 () Bool)

(assert (=> bm!25025 m!277733))

(assert (=> b!261827 d!62827))

(declare-fun d!62829 () Bool)

(declare-fun e!169840 () Bool)

(assert (=> d!62829 e!169840))

(declare-fun res!127994 () Bool)

(assert (=> d!62829 (=> (not res!127994) (not e!169840))))

(assert (=> d!62829 (= res!127994 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6332 (_keys!7013 thiss!1504))) (bvslt index!297 (size!6331 (_values!4809 thiss!1504)))))))

(declare-fun lt!132347 () Unit!8108)

(declare-fun choose!1288 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 32) (_ BitVec 64) V!8505 Int) Unit!8108)

(assert (=> d!62829 (= lt!132347 (choose!1288 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) index!297 key!932 v!346 (defaultEntry!4826 thiss!1504)))))

(assert (=> d!62829 (validMask!0 (mask!11177 thiss!1504))))

(assert (=> d!62829 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!121 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) index!297 key!932 v!346 (defaultEntry!4826 thiss!1504)) lt!132347)))

(declare-fun b!262096 () Bool)

(assert (=> b!262096 (= e!169840 (= (+!710 (getCurrentListMap!1432 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)) (tuple2!4913 key!932 v!346)) (getCurrentListMap!1432 (array!12638 (store (arr!5980 (_keys!7013 thiss!1504)) index!297 key!932) (size!6332 (_keys!7013 thiss!1504))) (array!12636 (store (arr!5979 (_values!4809 thiss!1504)) index!297 (ValueCellFull!2978 v!346)) (size!6331 (_values!4809 thiss!1504))) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504))))))

(assert (= (and d!62829 res!127994) b!262096))

(declare-fun m!277735 () Bool)

(assert (=> d!62829 m!277735))

(assert (=> d!62829 m!277451))

(declare-fun m!277737 () Bool)

(assert (=> b!262096 m!277737))

(assert (=> b!262096 m!277479))

(assert (=> b!262096 m!277449))

(declare-fun m!277739 () Bool)

(assert (=> b!262096 m!277739))

(assert (=> b!262096 m!277471))

(assert (=> b!262096 m!277449))

(assert (=> b!261827 d!62829))

(declare-fun b!262097 () Bool)

(declare-fun e!169841 () (_ BitVec 32))

(declare-fun e!169842 () (_ BitVec 32))

(assert (=> b!262097 (= e!169841 e!169842)))

(declare-fun c!44656 () Bool)

(assert (=> b!262097 (= c!44656 (validKeyInArray!0 (select (arr!5980 lt!132163) index!297)))))

(declare-fun bm!25026 () Bool)

(declare-fun call!25029 () (_ BitVec 32))

(assert (=> bm!25026 (= call!25029 (arrayCountValidKeys!0 lt!132163 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!262098 () Bool)

(assert (=> b!262098 (= e!169841 #b00000000000000000000000000000000)))

(declare-fun d!62831 () Bool)

(declare-fun lt!132348 () (_ BitVec 32))

(assert (=> d!62831 (and (bvsge lt!132348 #b00000000000000000000000000000000) (bvsle lt!132348 (bvsub (size!6332 lt!132163) index!297)))))

(assert (=> d!62831 (= lt!132348 e!169841)))

(declare-fun c!44657 () Bool)

(assert (=> d!62831 (= c!44657 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62831 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6332 lt!132163)))))

(assert (=> d!62831 (= (arrayCountValidKeys!0 lt!132163 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!132348)))

(declare-fun b!262099 () Bool)

(assert (=> b!262099 (= e!169842 (bvadd #b00000000000000000000000000000001 call!25029))))

(declare-fun b!262100 () Bool)

(assert (=> b!262100 (= e!169842 call!25029)))

(assert (= (and d!62831 c!44657) b!262098))

(assert (= (and d!62831 (not c!44657)) b!262097))

(assert (= (and b!262097 c!44656) b!262099))

(assert (= (and b!262097 (not c!44656)) b!262100))

(assert (= (or b!262099 b!262100) bm!25026))

(declare-fun m!277741 () Bool)

(assert (=> b!262097 m!277741))

(assert (=> b!262097 m!277741))

(declare-fun m!277743 () Bool)

(assert (=> b!262097 m!277743))

(declare-fun m!277745 () Bool)

(assert (=> bm!25026 m!277745))

(assert (=> b!261827 d!62831))

(declare-fun d!62833 () Bool)

(declare-fun e!169845 () Bool)

(assert (=> d!62833 e!169845))

(declare-fun res!127999 () Bool)

(assert (=> d!62833 (=> (not res!127999) (not e!169845))))

(declare-fun lt!132359 () ListLongMap!3815)

(assert (=> d!62833 (= res!127999 (contains!1881 lt!132359 (_1!2467 (tuple2!4913 key!932 v!346))))))

(declare-fun lt!132360 () List!3810)

(assert (=> d!62833 (= lt!132359 (ListLongMap!3816 lt!132360))))

(declare-fun lt!132358 () Unit!8108)

(declare-fun lt!132357 () Unit!8108)

(assert (=> d!62833 (= lt!132358 lt!132357)))

(declare-datatypes ((Option!322 0))(
  ( (Some!321 (v!5490 V!8505)) (None!320) )
))
(declare-fun getValueByKey!316 (List!3810 (_ BitVec 64)) Option!322)

(assert (=> d!62833 (= (getValueByKey!316 lt!132360 (_1!2467 (tuple2!4913 key!932 v!346))) (Some!321 (_2!2467 (tuple2!4913 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!175 (List!3810 (_ BitVec 64) V!8505) Unit!8108)

(assert (=> d!62833 (= lt!132357 (lemmaContainsTupThenGetReturnValue!175 lt!132360 (_1!2467 (tuple2!4913 key!932 v!346)) (_2!2467 (tuple2!4913 key!932 v!346))))))

(declare-fun insertStrictlySorted!178 (List!3810 (_ BitVec 64) V!8505) List!3810)

(assert (=> d!62833 (= lt!132360 (insertStrictlySorted!178 (toList!1923 lt!132162) (_1!2467 (tuple2!4913 key!932 v!346)) (_2!2467 (tuple2!4913 key!932 v!346))))))

(assert (=> d!62833 (= (+!710 lt!132162 (tuple2!4913 key!932 v!346)) lt!132359)))

(declare-fun b!262105 () Bool)

(declare-fun res!128000 () Bool)

(assert (=> b!262105 (=> (not res!128000) (not e!169845))))

(assert (=> b!262105 (= res!128000 (= (getValueByKey!316 (toList!1923 lt!132359) (_1!2467 (tuple2!4913 key!932 v!346))) (Some!321 (_2!2467 (tuple2!4913 key!932 v!346)))))))

(declare-fun b!262106 () Bool)

(declare-fun contains!1883 (List!3810 tuple2!4912) Bool)

(assert (=> b!262106 (= e!169845 (contains!1883 (toList!1923 lt!132359) (tuple2!4913 key!932 v!346)))))

(assert (= (and d!62833 res!127999) b!262105))

(assert (= (and b!262105 res!128000) b!262106))

(declare-fun m!277747 () Bool)

(assert (=> d!62833 m!277747))

(declare-fun m!277749 () Bool)

(assert (=> d!62833 m!277749))

(declare-fun m!277751 () Bool)

(assert (=> d!62833 m!277751))

(declare-fun m!277753 () Bool)

(assert (=> d!62833 m!277753))

(declare-fun m!277755 () Bool)

(assert (=> b!262105 m!277755))

(declare-fun m!277757 () Bool)

(assert (=> b!262106 m!277757))

(assert (=> b!261827 d!62833))

(declare-fun b!262107 () Bool)

(declare-fun e!169846 () (_ BitVec 32))

(declare-fun e!169847 () (_ BitVec 32))

(assert (=> b!262107 (= e!169846 e!169847)))

(declare-fun c!44658 () Bool)

(assert (=> b!262107 (= c!44658 (validKeyInArray!0 (select (arr!5980 lt!132163) #b00000000000000000000000000000000)))))

(declare-fun bm!25027 () Bool)

(declare-fun call!25030 () (_ BitVec 32))

(assert (=> bm!25027 (= call!25030 (arrayCountValidKeys!0 lt!132163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6332 (_keys!7013 thiss!1504))))))

(declare-fun b!262108 () Bool)

(assert (=> b!262108 (= e!169846 #b00000000000000000000000000000000)))

(declare-fun d!62835 () Bool)

(declare-fun lt!132361 () (_ BitVec 32))

(assert (=> d!62835 (and (bvsge lt!132361 #b00000000000000000000000000000000) (bvsle lt!132361 (bvsub (size!6332 lt!132163) #b00000000000000000000000000000000)))))

(assert (=> d!62835 (= lt!132361 e!169846)))

(declare-fun c!44659 () Bool)

(assert (=> d!62835 (= c!44659 (bvsge #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))))))

(assert (=> d!62835 (and (bvsle #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6332 (_keys!7013 thiss!1504)) (size!6332 lt!132163)))))

(assert (=> d!62835 (= (arrayCountValidKeys!0 lt!132163 #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))) lt!132361)))

(declare-fun b!262109 () Bool)

(assert (=> b!262109 (= e!169847 (bvadd #b00000000000000000000000000000001 call!25030))))

(declare-fun b!262110 () Bool)

(assert (=> b!262110 (= e!169847 call!25030)))

(assert (= (and d!62835 c!44659) b!262108))

(assert (= (and d!62835 (not c!44659)) b!262107))

(assert (= (and b!262107 c!44658) b!262109))

(assert (= (and b!262107 (not c!44658)) b!262110))

(assert (= (or b!262109 b!262110) bm!25027))

(assert (=> b!262107 m!277663))

(assert (=> b!262107 m!277663))

(assert (=> b!262107 m!277665))

(declare-fun m!277759 () Bool)

(assert (=> bm!25027 m!277759))

(assert (=> b!261827 d!62835))

(declare-fun d!62837 () Bool)

(declare-fun res!128001 () Bool)

(declare-fun e!169848 () Bool)

(assert (=> d!62837 (=> res!128001 e!169848)))

(assert (=> d!62837 (= res!128001 (= (select (arr!5980 lt!132163) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62837 (= (arrayContainsKey!0 lt!132163 key!932 #b00000000000000000000000000000000) e!169848)))

(declare-fun b!262111 () Bool)

(declare-fun e!169849 () Bool)

(assert (=> b!262111 (= e!169848 e!169849)))

(declare-fun res!128002 () Bool)

(assert (=> b!262111 (=> (not res!128002) (not e!169849))))

(assert (=> b!262111 (= res!128002 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6332 lt!132163)))))

(declare-fun b!262112 () Bool)

(assert (=> b!262112 (= e!169849 (arrayContainsKey!0 lt!132163 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62837 (not res!128001)) b!262111))

(assert (= (and b!262111 res!128002) b!262112))

(assert (=> d!62837 m!277663))

(declare-fun m!277761 () Bool)

(assert (=> b!262112 m!277761))

(assert (=> b!261827 d!62837))

(assert (=> b!261827 d!62819))

(declare-fun d!62839 () Bool)

(declare-fun e!169852 () Bool)

(assert (=> d!62839 e!169852))

(declare-fun res!128005 () Bool)

(assert (=> d!62839 (=> (not res!128005) (not e!169852))))

(assert (=> d!62839 (= res!128005 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6332 (_keys!7013 thiss!1504)))))))

(declare-fun lt!132364 () Unit!8108)

(declare-fun choose!102 ((_ BitVec 64) array!12637 (_ BitVec 32) (_ BitVec 32)) Unit!8108)

(assert (=> d!62839 (= lt!132364 (choose!102 key!932 (_keys!7013 thiss!1504) index!297 (mask!11177 thiss!1504)))))

(assert (=> d!62839 (validMask!0 (mask!11177 thiss!1504))))

(assert (=> d!62839 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7013 thiss!1504) index!297 (mask!11177 thiss!1504)) lt!132364)))

(declare-fun b!262115 () Bool)

(assert (=> b!262115 (= e!169852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12638 (store (arr!5980 (_keys!7013 thiss!1504)) index!297 key!932) (size!6332 (_keys!7013 thiss!1504))) (mask!11177 thiss!1504)))))

(assert (= (and d!62839 res!128005) b!262115))

(declare-fun m!277763 () Bool)

(assert (=> d!62839 m!277763))

(assert (=> d!62839 m!277451))

(assert (=> b!262115 m!277471))

(declare-fun m!277765 () Bool)

(assert (=> b!262115 m!277765))

(assert (=> b!261827 d!62839))

(declare-fun d!62841 () Bool)

(assert (=> d!62841 (arrayContainsKey!0 lt!132163 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132367 () Unit!8108)

(declare-fun choose!13 (array!12637 (_ BitVec 64) (_ BitVec 32)) Unit!8108)

(assert (=> d!62841 (= lt!132367 (choose!13 lt!132163 key!932 index!297))))

(assert (=> d!62841 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62841 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132163 key!932 index!297) lt!132367)))

(declare-fun bs!9212 () Bool)

(assert (= bs!9212 d!62841))

(assert (=> bs!9212 m!277465))

(declare-fun m!277767 () Bool)

(assert (=> bs!9212 m!277767))

(assert (=> b!261827 d!62841))

(declare-fun d!62843 () Bool)

(assert (=> d!62843 (= (validMask!0 (mask!11177 thiss!1504)) (and (or (= (mask!11177 thiss!1504) #b00000000000000000000000000000111) (= (mask!11177 thiss!1504) #b00000000000000000000000000001111) (= (mask!11177 thiss!1504) #b00000000000000000000000000011111) (= (mask!11177 thiss!1504) #b00000000000000000000000000111111) (= (mask!11177 thiss!1504) #b00000000000000000000000001111111) (= (mask!11177 thiss!1504) #b00000000000000000000000011111111) (= (mask!11177 thiss!1504) #b00000000000000000000000111111111) (= (mask!11177 thiss!1504) #b00000000000000000000001111111111) (= (mask!11177 thiss!1504) #b00000000000000000000011111111111) (= (mask!11177 thiss!1504) #b00000000000000000000111111111111) (= (mask!11177 thiss!1504) #b00000000000000000001111111111111) (= (mask!11177 thiss!1504) #b00000000000000000011111111111111) (= (mask!11177 thiss!1504) #b00000000000000000111111111111111) (= (mask!11177 thiss!1504) #b00000000000000001111111111111111) (= (mask!11177 thiss!1504) #b00000000000000011111111111111111) (= (mask!11177 thiss!1504) #b00000000000000111111111111111111) (= (mask!11177 thiss!1504) #b00000000000001111111111111111111) (= (mask!11177 thiss!1504) #b00000000000011111111111111111111) (= (mask!11177 thiss!1504) #b00000000000111111111111111111111) (= (mask!11177 thiss!1504) #b00000000001111111111111111111111) (= (mask!11177 thiss!1504) #b00000000011111111111111111111111) (= (mask!11177 thiss!1504) #b00000000111111111111111111111111) (= (mask!11177 thiss!1504) #b00000001111111111111111111111111) (= (mask!11177 thiss!1504) #b00000011111111111111111111111111) (= (mask!11177 thiss!1504) #b00000111111111111111111111111111) (= (mask!11177 thiss!1504) #b00001111111111111111111111111111) (= (mask!11177 thiss!1504) #b00011111111111111111111111111111) (= (mask!11177 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11177 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!261827 d!62843))

(declare-fun d!62845 () Bool)

(assert (=> d!62845 (= (arrayCountValidKeys!0 lt!132163 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!132370 () Unit!8108)

(declare-fun choose!2 (array!12637 (_ BitVec 32)) Unit!8108)

(assert (=> d!62845 (= lt!132370 (choose!2 lt!132163 index!297))))

(declare-fun e!169855 () Bool)

(assert (=> d!62845 e!169855))

(declare-fun res!128010 () Bool)

(assert (=> d!62845 (=> (not res!128010) (not e!169855))))

(assert (=> d!62845 (= res!128010 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6332 lt!132163))))))

(assert (=> d!62845 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132163 index!297) lt!132370)))

(declare-fun b!262120 () Bool)

(declare-fun res!128011 () Bool)

(assert (=> b!262120 (=> (not res!128011) (not e!169855))))

(assert (=> b!262120 (= res!128011 (validKeyInArray!0 (select (arr!5980 lt!132163) index!297)))))

(declare-fun b!262121 () Bool)

(assert (=> b!262121 (= e!169855 (bvslt (size!6332 lt!132163) #b01111111111111111111111111111111))))

(assert (= (and d!62845 res!128010) b!262120))

(assert (= (and b!262120 res!128011) b!262121))

(declare-fun m!277769 () Bool)

(assert (=> d!62845 m!277769))

(declare-fun m!277771 () Bool)

(assert (=> d!62845 m!277771))

(assert (=> b!262120 m!277741))

(assert (=> b!262120 m!277741))

(assert (=> b!262120 m!277743))

(assert (=> b!261827 d!62845))

(declare-fun b!262130 () Bool)

(declare-fun e!169864 () Bool)

(declare-fun call!25033 () Bool)

(assert (=> b!262130 (= e!169864 call!25033)))

(declare-fun b!262131 () Bool)

(declare-fun e!169863 () Bool)

(assert (=> b!262131 (= e!169864 e!169863)))

(declare-fun lt!132378 () (_ BitVec 64))

(assert (=> b!262131 (= lt!132378 (select (arr!5980 lt!132163) #b00000000000000000000000000000000))))

(declare-fun lt!132379 () Unit!8108)

(assert (=> b!262131 (= lt!132379 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132163 lt!132378 #b00000000000000000000000000000000))))

(assert (=> b!262131 (arrayContainsKey!0 lt!132163 lt!132378 #b00000000000000000000000000000000)))

(declare-fun lt!132377 () Unit!8108)

(assert (=> b!262131 (= lt!132377 lt!132379)))

(declare-fun res!128016 () Bool)

(assert (=> b!262131 (= res!128016 (= (seekEntryOrOpen!0 (select (arr!5980 lt!132163) #b00000000000000000000000000000000) lt!132163 (mask!11177 thiss!1504)) (Found!1188 #b00000000000000000000000000000000)))))

(assert (=> b!262131 (=> (not res!128016) (not e!169863))))

(declare-fun bm!25030 () Bool)

(assert (=> bm!25030 (= call!25033 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!132163 (mask!11177 thiss!1504)))))

(declare-fun b!262132 () Bool)

(declare-fun e!169862 () Bool)

(assert (=> b!262132 (= e!169862 e!169864)))

(declare-fun c!44662 () Bool)

(assert (=> b!262132 (= c!44662 (validKeyInArray!0 (select (arr!5980 lt!132163) #b00000000000000000000000000000000)))))

(declare-fun d!62847 () Bool)

(declare-fun res!128017 () Bool)

(assert (=> d!62847 (=> res!128017 e!169862)))

(assert (=> d!62847 (= res!128017 (bvsge #b00000000000000000000000000000000 (size!6332 lt!132163)))))

(assert (=> d!62847 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132163 (mask!11177 thiss!1504)) e!169862)))

(declare-fun b!262133 () Bool)

(assert (=> b!262133 (= e!169863 call!25033)))

(assert (= (and d!62847 (not res!128017)) b!262132))

(assert (= (and b!262132 c!44662) b!262131))

(assert (= (and b!262132 (not c!44662)) b!262130))

(assert (= (and b!262131 res!128016) b!262133))

(assert (= (or b!262133 b!262130) bm!25030))

(assert (=> b!262131 m!277663))

(declare-fun m!277773 () Bool)

(assert (=> b!262131 m!277773))

(declare-fun m!277775 () Bool)

(assert (=> b!262131 m!277775))

(assert (=> b!262131 m!277663))

(declare-fun m!277777 () Bool)

(assert (=> b!262131 m!277777))

(declare-fun m!277779 () Bool)

(assert (=> bm!25030 m!277779))

(assert (=> b!262132 m!277663))

(assert (=> b!262132 m!277663))

(assert (=> b!262132 m!277665))

(assert (=> b!261827 d!62847))

(declare-fun d!62849 () Bool)

(declare-fun e!169867 () Bool)

(assert (=> d!62849 e!169867))

(declare-fun res!128020 () Bool)

(assert (=> d!62849 (=> (not res!128020) (not e!169867))))

(assert (=> d!62849 (= res!128020 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6332 (_keys!7013 thiss!1504)))))))

(declare-fun lt!132382 () Unit!8108)

(declare-fun choose!41 (array!12637 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3811) Unit!8108)

(assert (=> d!62849 (= lt!132382 (choose!41 (_keys!7013 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3808))))

(assert (=> d!62849 (bvslt (size!6332 (_keys!7013 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62849 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7013 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3808) lt!132382)))

(declare-fun b!262136 () Bool)

(assert (=> b!262136 (= e!169867 (arrayNoDuplicates!0 (array!12638 (store (arr!5980 (_keys!7013 thiss!1504)) index!297 key!932) (size!6332 (_keys!7013 thiss!1504))) #b00000000000000000000000000000000 Nil!3808))))

(assert (= (and d!62849 res!128020) b!262136))

(declare-fun m!277781 () Bool)

(assert (=> d!62849 m!277781))

(assert (=> b!262136 m!277471))

(declare-fun m!277783 () Bool)

(assert (=> b!262136 m!277783))

(assert (=> b!261827 d!62849))

(declare-fun b!262147 () Bool)

(declare-fun e!169879 () Bool)

(declare-fun call!25036 () Bool)

(assert (=> b!262147 (= e!169879 call!25036)))

(declare-fun b!262148 () Bool)

(declare-fun e!169877 () Bool)

(assert (=> b!262148 (= e!169877 e!169879)))

(declare-fun c!44665 () Bool)

(assert (=> b!262148 (= c!44665 (validKeyInArray!0 (select (arr!5980 lt!132163) #b00000000000000000000000000000000)))))

(declare-fun b!262149 () Bool)

(declare-fun e!169876 () Bool)

(assert (=> b!262149 (= e!169876 e!169877)))

(declare-fun res!128028 () Bool)

(assert (=> b!262149 (=> (not res!128028) (not e!169877))))

(declare-fun e!169878 () Bool)

(assert (=> b!262149 (= res!128028 (not e!169878))))

(declare-fun res!128027 () Bool)

(assert (=> b!262149 (=> (not res!128027) (not e!169878))))

(assert (=> b!262149 (= res!128027 (validKeyInArray!0 (select (arr!5980 lt!132163) #b00000000000000000000000000000000)))))

(declare-fun d!62851 () Bool)

(declare-fun res!128029 () Bool)

(assert (=> d!62851 (=> res!128029 e!169876)))

(assert (=> d!62851 (= res!128029 (bvsge #b00000000000000000000000000000000 (size!6332 lt!132163)))))

(assert (=> d!62851 (= (arrayNoDuplicates!0 lt!132163 #b00000000000000000000000000000000 Nil!3808) e!169876)))

(declare-fun bm!25033 () Bool)

(assert (=> bm!25033 (= call!25036 (arrayNoDuplicates!0 lt!132163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44665 (Cons!3807 (select (arr!5980 lt!132163) #b00000000000000000000000000000000) Nil!3808) Nil!3808)))))

(declare-fun b!262150 () Bool)

(assert (=> b!262150 (= e!169879 call!25036)))

(declare-fun b!262151 () Bool)

(declare-fun contains!1884 (List!3811 (_ BitVec 64)) Bool)

(assert (=> b!262151 (= e!169878 (contains!1884 Nil!3808 (select (arr!5980 lt!132163) #b00000000000000000000000000000000)))))

(assert (= (and d!62851 (not res!128029)) b!262149))

(assert (= (and b!262149 res!128027) b!262151))

(assert (= (and b!262149 res!128028) b!262148))

(assert (= (and b!262148 c!44665) b!262150))

(assert (= (and b!262148 (not c!44665)) b!262147))

(assert (= (or b!262150 b!262147) bm!25033))

(assert (=> b!262148 m!277663))

(assert (=> b!262148 m!277663))

(assert (=> b!262148 m!277665))

(assert (=> b!262149 m!277663))

(assert (=> b!262149 m!277663))

(assert (=> b!262149 m!277665))

(assert (=> bm!25033 m!277663))

(declare-fun m!277785 () Bool)

(assert (=> bm!25033 m!277785))

(assert (=> b!262151 m!277663))

(assert (=> b!262151 m!277663))

(declare-fun m!277787 () Bool)

(assert (=> b!262151 m!277787))

(assert (=> b!261827 d!62851))

(declare-fun d!62853 () Bool)

(assert (=> d!62853 (contains!1881 (getCurrentListMap!1432 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)) key!932)))

(declare-fun lt!132385 () Unit!8108)

(declare-fun choose!1289 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) (_ BitVec 32) Int) Unit!8108)

(assert (=> d!62853 (= lt!132385 (choose!1289 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(assert (=> d!62853 (validMask!0 (mask!11177 thiss!1504))))

(assert (=> d!62853 (= (lemmaArrayContainsKeyThenInListMap!258 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)) lt!132385)))

(declare-fun bs!9213 () Bool)

(assert (= bs!9213 d!62853))

(assert (=> bs!9213 m!277449))

(assert (=> bs!9213 m!277449))

(declare-fun m!277789 () Bool)

(assert (=> bs!9213 m!277789))

(declare-fun m!277791 () Bool)

(assert (=> bs!9213 m!277791))

(assert (=> bs!9213 m!277451))

(assert (=> b!261833 d!62853))

(declare-fun d!62855 () Bool)

(assert (=> d!62855 (= (inRange!0 (ite c!44596 (index!6922 lt!132168) (index!6925 lt!132168)) (mask!11177 thiss!1504)) (and (bvsge (ite c!44596 (index!6922 lt!132168) (index!6925 lt!132168)) #b00000000000000000000000000000000) (bvslt (ite c!44596 (index!6922 lt!132168) (index!6925 lt!132168)) (bvadd (mask!11177 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24988 d!62855))

(declare-fun d!62857 () Bool)

(assert (=> d!62857 (= (inRange!0 index!297 (mask!11177 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11177 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!261828 d!62857))

(declare-fun d!62859 () Bool)

(declare-fun e!169885 () Bool)

(assert (=> d!62859 e!169885))

(declare-fun res!128032 () Bool)

(assert (=> d!62859 (=> res!128032 e!169885)))

(declare-fun lt!132395 () Bool)

(assert (=> d!62859 (= res!128032 (not lt!132395))))

(declare-fun lt!132397 () Bool)

(assert (=> d!62859 (= lt!132395 lt!132397)))

(declare-fun lt!132396 () Unit!8108)

(declare-fun e!169884 () Unit!8108)

(assert (=> d!62859 (= lt!132396 e!169884)))

(declare-fun c!44668 () Bool)

(assert (=> d!62859 (= c!44668 lt!132397)))

(declare-fun containsKey!308 (List!3810 (_ BitVec 64)) Bool)

(assert (=> d!62859 (= lt!132397 (containsKey!308 (toList!1923 lt!132162) key!932))))

(assert (=> d!62859 (= (contains!1881 lt!132162 key!932) lt!132395)))

(declare-fun b!262158 () Bool)

(declare-fun lt!132394 () Unit!8108)

(assert (=> b!262158 (= e!169884 lt!132394)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!257 (List!3810 (_ BitVec 64)) Unit!8108)

(assert (=> b!262158 (= lt!132394 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1923 lt!132162) key!932))))

(declare-fun isDefined!258 (Option!322) Bool)

(assert (=> b!262158 (isDefined!258 (getValueByKey!316 (toList!1923 lt!132162) key!932))))

(declare-fun b!262159 () Bool)

(declare-fun Unit!8122 () Unit!8108)

(assert (=> b!262159 (= e!169884 Unit!8122)))

(declare-fun b!262160 () Bool)

(assert (=> b!262160 (= e!169885 (isDefined!258 (getValueByKey!316 (toList!1923 lt!132162) key!932)))))

(assert (= (and d!62859 c!44668) b!262158))

(assert (= (and d!62859 (not c!44668)) b!262159))

(assert (= (and d!62859 (not res!128032)) b!262160))

(declare-fun m!277793 () Bool)

(assert (=> d!62859 m!277793))

(declare-fun m!277795 () Bool)

(assert (=> b!262158 m!277795))

(declare-fun m!277797 () Bool)

(assert (=> b!262158 m!277797))

(assert (=> b!262158 m!277797))

(declare-fun m!277799 () Bool)

(assert (=> b!262158 m!277799))

(assert (=> b!262160 m!277797))

(assert (=> b!262160 m!277797))

(assert (=> b!262160 m!277799))

(assert (=> b!261828 d!62859))

(declare-fun b!262161 () Bool)

(declare-fun e!169886 () Bool)

(declare-fun call!25040 () Bool)

(assert (=> b!262161 (= e!169886 (not call!25040))))

(declare-fun b!262162 () Bool)

(declare-fun e!169888 () Unit!8108)

(declare-fun lt!132409 () Unit!8108)

(assert (=> b!262162 (= e!169888 lt!132409)))

(declare-fun lt!132403 () ListLongMap!3815)

(assert (=> b!262162 (= lt!132403 (getCurrentListMapNoExtraKeys!576 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132400 () (_ BitVec 64))

(assert (=> b!262162 (= lt!132400 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132415 () (_ BitVec 64))

(assert (=> b!262162 (= lt!132415 (select (arr!5980 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132405 () Unit!8108)

(assert (=> b!262162 (= lt!132405 (addStillContains!236 lt!132403 lt!132400 (zeroValue!4667 thiss!1504) lt!132415))))

(assert (=> b!262162 (contains!1881 (+!710 lt!132403 (tuple2!4913 lt!132400 (zeroValue!4667 thiss!1504))) lt!132415)))

(declare-fun lt!132404 () Unit!8108)

(assert (=> b!262162 (= lt!132404 lt!132405)))

(declare-fun lt!132401 () ListLongMap!3815)

(assert (=> b!262162 (= lt!132401 (getCurrentListMapNoExtraKeys!576 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132414 () (_ BitVec 64))

(assert (=> b!262162 (= lt!132414 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132399 () (_ BitVec 64))

(assert (=> b!262162 (= lt!132399 (select (arr!5980 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132410 () Unit!8108)

(assert (=> b!262162 (= lt!132410 (addApplyDifferent!236 lt!132401 lt!132414 (minValue!4667 thiss!1504) lt!132399))))

(assert (=> b!262162 (= (apply!260 (+!710 lt!132401 (tuple2!4913 lt!132414 (minValue!4667 thiss!1504))) lt!132399) (apply!260 lt!132401 lt!132399))))

(declare-fun lt!132406 () Unit!8108)

(assert (=> b!262162 (= lt!132406 lt!132410)))

(declare-fun lt!132402 () ListLongMap!3815)

(assert (=> b!262162 (= lt!132402 (getCurrentListMapNoExtraKeys!576 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132412 () (_ BitVec 64))

(assert (=> b!262162 (= lt!132412 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132418 () (_ BitVec 64))

(assert (=> b!262162 (= lt!132418 (select (arr!5980 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132398 () Unit!8108)

(assert (=> b!262162 (= lt!132398 (addApplyDifferent!236 lt!132402 lt!132412 (zeroValue!4667 thiss!1504) lt!132418))))

(assert (=> b!262162 (= (apply!260 (+!710 lt!132402 (tuple2!4913 lt!132412 (zeroValue!4667 thiss!1504))) lt!132418) (apply!260 lt!132402 lt!132418))))

(declare-fun lt!132416 () Unit!8108)

(assert (=> b!262162 (= lt!132416 lt!132398)))

(declare-fun lt!132413 () ListLongMap!3815)

(assert (=> b!262162 (= lt!132413 (getCurrentListMapNoExtraKeys!576 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun lt!132417 () (_ BitVec 64))

(assert (=> b!262162 (= lt!132417 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132419 () (_ BitVec 64))

(assert (=> b!262162 (= lt!132419 (select (arr!5980 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262162 (= lt!132409 (addApplyDifferent!236 lt!132413 lt!132417 (minValue!4667 thiss!1504) lt!132419))))

(assert (=> b!262162 (= (apply!260 (+!710 lt!132413 (tuple2!4913 lt!132417 (minValue!4667 thiss!1504))) lt!132419) (apply!260 lt!132413 lt!132419))))

(declare-fun bm!25034 () Bool)

(declare-fun call!25037 () ListLongMap!3815)

(assert (=> bm!25034 (= call!25037 (getCurrentListMapNoExtraKeys!576 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)))))

(declare-fun bm!25035 () Bool)

(declare-fun lt!132408 () ListLongMap!3815)

(assert (=> bm!25035 (= call!25040 (contains!1881 lt!132408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25036 () Bool)

(declare-fun call!25042 () ListLongMap!3815)

(declare-fun call!25038 () ListLongMap!3815)

(assert (=> bm!25036 (= call!25042 call!25038)))

(declare-fun b!262163 () Bool)

(declare-fun e!169891 () Bool)

(declare-fun e!169890 () Bool)

(assert (=> b!262163 (= e!169891 e!169890)))

(declare-fun res!128040 () Bool)

(assert (=> b!262163 (=> (not res!128040) (not e!169890))))

(assert (=> b!262163 (= res!128040 (contains!1881 lt!132408 (select (arr!5980 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!262163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))))))

(declare-fun b!262164 () Bool)

(declare-fun res!128033 () Bool)

(declare-fun e!169894 () Bool)

(assert (=> b!262164 (=> (not res!128033) (not e!169894))))

(assert (=> b!262164 (= res!128033 e!169891)))

(declare-fun res!128041 () Bool)

(assert (=> b!262164 (=> res!128041 e!169891)))

(declare-fun e!169898 () Bool)

(assert (=> b!262164 (= res!128041 (not e!169898))))

(declare-fun res!128038 () Bool)

(assert (=> b!262164 (=> (not res!128038) (not e!169898))))

(assert (=> b!262164 (= res!128038 (bvslt #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))))))

(declare-fun bm!25037 () Bool)

(declare-fun call!25041 () ListLongMap!3815)

(assert (=> bm!25037 (= call!25041 call!25037)))

(declare-fun b!262166 () Bool)

(declare-fun e!169889 () ListLongMap!3815)

(assert (=> b!262166 (= e!169889 call!25042)))

(declare-fun b!262167 () Bool)

(declare-fun res!128037 () Bool)

(assert (=> b!262167 (=> (not res!128037) (not e!169894))))

(assert (=> b!262167 (= res!128037 e!169886)))

(declare-fun c!44669 () Bool)

(assert (=> b!262167 (= c!44669 (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262168 () Bool)

(declare-fun e!169896 () ListLongMap!3815)

(assert (=> b!262168 (= e!169896 call!25042)))

(declare-fun b!262169 () Bool)

(declare-fun e!169897 () Bool)

(assert (=> b!262169 (= e!169886 e!169897)))

(declare-fun res!128034 () Bool)

(assert (=> b!262169 (= res!128034 call!25040)))

(assert (=> b!262169 (=> (not res!128034) (not e!169897))))

(declare-fun b!262170 () Bool)

(assert (=> b!262170 (= e!169898 (validKeyInArray!0 (select (arr!5980 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!262171 () Bool)

(declare-fun e!169892 () Bool)

(declare-fun e!169893 () Bool)

(assert (=> b!262171 (= e!169892 e!169893)))

(declare-fun res!128035 () Bool)

(declare-fun call!25039 () Bool)

(assert (=> b!262171 (= res!128035 call!25039)))

(assert (=> b!262171 (=> (not res!128035) (not e!169893))))

(declare-fun b!262172 () Bool)

(assert (=> b!262172 (= e!169894 e!169892)))

(declare-fun c!44670 () Bool)

(assert (=> b!262172 (= c!44670 (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262173 () Bool)

(declare-fun call!25043 () ListLongMap!3815)

(assert (=> b!262173 (= e!169889 call!25043)))

(declare-fun b!262174 () Bool)

(declare-fun e!169887 () ListLongMap!3815)

(assert (=> b!262174 (= e!169887 (+!710 call!25038 (tuple2!4913 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4667 thiss!1504))))))

(declare-fun b!262175 () Bool)

(assert (=> b!262175 (= e!169893 (= (apply!260 lt!132408 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4667 thiss!1504)))))

(declare-fun bm!25038 () Bool)

(assert (=> bm!25038 (= call!25043 call!25041)))

(declare-fun bm!25039 () Bool)

(assert (=> bm!25039 (= call!25039 (contains!1881 lt!132408 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262176 () Bool)

(declare-fun c!44674 () Bool)

(assert (=> b!262176 (= c!44674 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!262176 (= e!169896 e!169889)))

(declare-fun b!262177 () Bool)

(declare-fun e!169895 () Bool)

(assert (=> b!262177 (= e!169895 (validKeyInArray!0 (select (arr!5980 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!262178 () Bool)

(assert (=> b!262178 (= e!169887 e!169896)))

(declare-fun c!44671 () Bool)

(assert (=> b!262178 (= c!44671 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!44672 () Bool)

(declare-fun bm!25040 () Bool)

(assert (=> bm!25040 (= call!25038 (+!710 (ite c!44672 call!25037 (ite c!44671 call!25041 call!25043)) (ite (or c!44672 c!44671) (tuple2!4913 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4667 thiss!1504)) (tuple2!4913 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4667 thiss!1504)))))))

(declare-fun b!262179 () Bool)

(declare-fun Unit!8123 () Unit!8108)

(assert (=> b!262179 (= e!169888 Unit!8123)))

(declare-fun d!62861 () Bool)

(assert (=> d!62861 e!169894))

(declare-fun res!128036 () Bool)

(assert (=> d!62861 (=> (not res!128036) (not e!169894))))

(assert (=> d!62861 (= res!128036 (or (bvsge #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))))))))

(declare-fun lt!132411 () ListLongMap!3815)

(assert (=> d!62861 (= lt!132408 lt!132411)))

(declare-fun lt!132407 () Unit!8108)

(assert (=> d!62861 (= lt!132407 e!169888)))

(declare-fun c!44673 () Bool)

(assert (=> d!62861 (= c!44673 e!169895)))

(declare-fun res!128039 () Bool)

(assert (=> d!62861 (=> (not res!128039) (not e!169895))))

(assert (=> d!62861 (= res!128039 (bvslt #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))))))

(assert (=> d!62861 (= lt!132411 e!169887)))

(assert (=> d!62861 (= c!44672 (and (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4563 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62861 (validMask!0 (mask!11177 thiss!1504))))

(assert (=> d!62861 (= (getCurrentListMap!1432 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4826 thiss!1504)) lt!132408)))

(declare-fun b!262165 () Bool)

(assert (=> b!262165 (= e!169897 (= (apply!260 lt!132408 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4667 thiss!1504)))))

(declare-fun b!262180 () Bool)

(assert (=> b!262180 (= e!169892 (not call!25039))))

(declare-fun b!262181 () Bool)

(assert (=> b!262181 (= e!169890 (= (apply!260 lt!132408 (select (arr!5980 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000)) (get!3081 (select (arr!5979 (_values!4809 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!594 (defaultEntry!4826 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262181 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6331 (_values!4809 thiss!1504))))))

(assert (=> b!262181 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6332 (_keys!7013 thiss!1504))))))

(assert (= (and d!62861 c!44672) b!262174))

(assert (= (and d!62861 (not c!44672)) b!262178))

(assert (= (and b!262178 c!44671) b!262168))

(assert (= (and b!262178 (not c!44671)) b!262176))

(assert (= (and b!262176 c!44674) b!262166))

(assert (= (and b!262176 (not c!44674)) b!262173))

(assert (= (or b!262166 b!262173) bm!25038))

(assert (= (or b!262168 bm!25038) bm!25037))

(assert (= (or b!262168 b!262166) bm!25036))

(assert (= (or b!262174 bm!25037) bm!25034))

(assert (= (or b!262174 bm!25036) bm!25040))

(assert (= (and d!62861 res!128039) b!262177))

(assert (= (and d!62861 c!44673) b!262162))

(assert (= (and d!62861 (not c!44673)) b!262179))

(assert (= (and d!62861 res!128036) b!262164))

(assert (= (and b!262164 res!128038) b!262170))

(assert (= (and b!262164 (not res!128041)) b!262163))

(assert (= (and b!262163 res!128040) b!262181))

(assert (= (and b!262164 res!128033) b!262167))

(assert (= (and b!262167 c!44669) b!262169))

(assert (= (and b!262167 (not c!44669)) b!262161))

(assert (= (and b!262169 res!128034) b!262165))

(assert (= (or b!262169 b!262161) bm!25035))

(assert (= (and b!262167 res!128037) b!262172))

(assert (= (and b!262172 c!44670) b!262171))

(assert (= (and b!262172 (not c!44670)) b!262180))

(assert (= (and b!262171 res!128035) b!262175))

(assert (= (or b!262171 b!262180) bm!25039))

(declare-fun b_lambda!8299 () Bool)

(assert (=> (not b_lambda!8299) (not b!262181)))

(assert (=> b!262181 t!8879))

(declare-fun b_and!13897 () Bool)

(assert (= b_and!13895 (and (=> t!8879 result!5413) b_and!13897)))

(assert (=> b!262177 m!277653))

(assert (=> b!262177 m!277653))

(assert (=> b!262177 m!277731))

(declare-fun m!277801 () Bool)

(assert (=> b!262175 m!277801))

(declare-fun m!277803 () Bool)

(assert (=> b!262162 m!277803))

(declare-fun m!277805 () Bool)

(assert (=> b!262162 m!277805))

(declare-fun m!277807 () Bool)

(assert (=> b!262162 m!277807))

(declare-fun m!277809 () Bool)

(assert (=> b!262162 m!277809))

(declare-fun m!277811 () Bool)

(assert (=> b!262162 m!277811))

(declare-fun m!277813 () Bool)

(assert (=> b!262162 m!277813))

(declare-fun m!277815 () Bool)

(assert (=> b!262162 m!277815))

(declare-fun m!277817 () Bool)

(assert (=> b!262162 m!277817))

(assert (=> b!262162 m!277809))

(declare-fun m!277819 () Bool)

(assert (=> b!262162 m!277819))

(assert (=> b!262162 m!277813))

(declare-fun m!277821 () Bool)

(assert (=> b!262162 m!277821))

(assert (=> b!262162 m!277817))

(declare-fun m!277823 () Bool)

(assert (=> b!262162 m!277823))

(declare-fun m!277825 () Bool)

(assert (=> b!262162 m!277825))

(declare-fun m!277827 () Bool)

(assert (=> b!262162 m!277827))

(declare-fun m!277829 () Bool)

(assert (=> b!262162 m!277829))

(declare-fun m!277831 () Bool)

(assert (=> b!262162 m!277831))

(assert (=> b!262162 m!277653))

(assert (=> b!262162 m!277805))

(declare-fun m!277833 () Bool)

(assert (=> b!262162 m!277833))

(declare-fun m!277835 () Bool)

(assert (=> bm!25039 m!277835))

(assert (=> b!262181 m!277653))

(declare-fun m!277837 () Bool)

(assert (=> b!262181 m!277837))

(assert (=> b!262181 m!277653))

(assert (=> b!262181 m!277705))

(declare-fun m!277839 () Bool)

(assert (=> b!262181 m!277839))

(assert (=> b!262181 m!277705))

(declare-fun m!277841 () Bool)

(assert (=> b!262181 m!277841))

(assert (=> b!262181 m!277839))

(declare-fun m!277843 () Bool)

(assert (=> bm!25035 m!277843))

(declare-fun m!277845 () Bool)

(assert (=> bm!25040 m!277845))

(declare-fun m!277847 () Bool)

(assert (=> b!262174 m!277847))

(declare-fun m!277849 () Bool)

(assert (=> b!262165 m!277849))

(assert (=> bm!25034 m!277829))

(assert (=> b!262163 m!277653))

(assert (=> b!262163 m!277653))

(declare-fun m!277851 () Bool)

(assert (=> b!262163 m!277851))

(assert (=> b!262170 m!277653))

(assert (=> b!262170 m!277653))

(assert (=> b!262170 m!277731))

(assert (=> d!62861 m!277451))

(assert (=> b!261828 d!62861))

(declare-fun b!262198 () Bool)

(declare-fun lt!132425 () SeekEntryResult!1188)

(assert (=> b!262198 (and (bvsge (index!6922 lt!132425) #b00000000000000000000000000000000) (bvslt (index!6922 lt!132425) (size!6332 (_keys!7013 thiss!1504))))))

(declare-fun res!128052 () Bool)

(assert (=> b!262198 (= res!128052 (= (select (arr!5980 (_keys!7013 thiss!1504)) (index!6922 lt!132425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169909 () Bool)

(assert (=> b!262198 (=> (not res!128052) (not e!169909))))

(declare-fun b!262199 () Bool)

(declare-fun res!128051 () Bool)

(declare-fun e!169908 () Bool)

(assert (=> b!262199 (=> (not res!128051) (not e!169908))))

(assert (=> b!262199 (= res!128051 (= (select (arr!5980 (_keys!7013 thiss!1504)) (index!6925 lt!132425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262199 (and (bvsge (index!6925 lt!132425) #b00000000000000000000000000000000) (bvslt (index!6925 lt!132425) (size!6332 (_keys!7013 thiss!1504))))))

(declare-fun b!262200 () Bool)

(declare-fun res!128053 () Bool)

(assert (=> b!262200 (=> (not res!128053) (not e!169908))))

(declare-fun call!25048 () Bool)

(assert (=> b!262200 (= res!128053 call!25048)))

(declare-fun e!169907 () Bool)

(assert (=> b!262200 (= e!169907 e!169908)))

(declare-fun b!262201 () Bool)

(declare-fun call!25049 () Bool)

(assert (=> b!262201 (= e!169908 (not call!25049))))

(declare-fun d!62863 () Bool)

(declare-fun e!169910 () Bool)

(assert (=> d!62863 e!169910))

(declare-fun c!44680 () Bool)

(assert (=> d!62863 (= c!44680 ((_ is MissingZero!1188) lt!132425))))

(assert (=> d!62863 (= lt!132425 (seekEntryOrOpen!0 key!932 (_keys!7013 thiss!1504) (mask!11177 thiss!1504)))))

(declare-fun lt!132424 () Unit!8108)

(declare-fun choose!1290 (array!12637 array!12635 (_ BitVec 32) (_ BitVec 32) V!8505 V!8505 (_ BitVec 64) Int) Unit!8108)

(assert (=> d!62863 (= lt!132424 (choose!1290 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)))))

(assert (=> d!62863 (validMask!0 (mask!11177 thiss!1504))))

(assert (=> d!62863 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!446 (_keys!7013 thiss!1504) (_values!4809 thiss!1504) (mask!11177 thiss!1504) (extraKeys!4563 thiss!1504) (zeroValue!4667 thiss!1504) (minValue!4667 thiss!1504) key!932 (defaultEntry!4826 thiss!1504)) lt!132424)))

(declare-fun b!262202 () Bool)

(assert (=> b!262202 (= e!169910 e!169909)))

(declare-fun res!128050 () Bool)

(assert (=> b!262202 (= res!128050 call!25048)))

(assert (=> b!262202 (=> (not res!128050) (not e!169909))))

(declare-fun b!262203 () Bool)

(assert (=> b!262203 (= e!169910 e!169907)))

(declare-fun c!44679 () Bool)

(assert (=> b!262203 (= c!44679 ((_ is MissingVacant!1188) lt!132425))))

(declare-fun bm!25045 () Bool)

(assert (=> bm!25045 (= call!25048 (inRange!0 (ite c!44680 (index!6922 lt!132425) (index!6925 lt!132425)) (mask!11177 thiss!1504)))))

(declare-fun b!262204 () Bool)

(assert (=> b!262204 (= e!169909 (not call!25049))))

(declare-fun b!262205 () Bool)

(assert (=> b!262205 (= e!169907 ((_ is Undefined!1188) lt!132425))))

(declare-fun bm!25046 () Bool)

(assert (=> bm!25046 (= call!25049 (arrayContainsKey!0 (_keys!7013 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!62863 c!44680) b!262202))

(assert (= (and d!62863 (not c!44680)) b!262203))

(assert (= (and b!262202 res!128050) b!262198))

(assert (= (and b!262198 res!128052) b!262204))

(assert (= (and b!262203 c!44679) b!262200))

(assert (= (and b!262203 (not c!44679)) b!262205))

(assert (= (and b!262200 res!128053) b!262199))

(assert (= (and b!262199 res!128051) b!262201))

(assert (= (or b!262202 b!262200) bm!25045))

(assert (= (or b!262204 b!262201) bm!25046))

(declare-fun m!277853 () Bool)

(assert (=> b!262198 m!277853))

(declare-fun m!277855 () Bool)

(assert (=> b!262199 m!277855))

(assert (=> d!62863 m!277501))

(declare-fun m!277857 () Bool)

(assert (=> d!62863 m!277857))

(assert (=> d!62863 m!277451))

(assert (=> bm!25046 m!277453))

(declare-fun m!277859 () Bool)

(assert (=> bm!25045 m!277859))

(assert (=> b!261835 d!62863))

(declare-fun d!62865 () Bool)

(assert (=> d!62865 (= (array_inv!3957 (_keys!7013 thiss!1504)) (bvsge (size!6332 (_keys!7013 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!261825 d!62865))

(declare-fun d!62867 () Bool)

(assert (=> d!62867 (= (array_inv!3958 (_values!4809 thiss!1504)) (bvsge (size!6331 (_values!4809 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!261825 d!62867))

(declare-fun mapNonEmpty!11332 () Bool)

(declare-fun mapRes!11332 () Bool)

(declare-fun tp!23689 () Bool)

(declare-fun e!169916 () Bool)

(assert (=> mapNonEmpty!11332 (= mapRes!11332 (and tp!23689 e!169916))))

(declare-fun mapValue!11332 () ValueCell!2978)

(declare-fun mapKey!11332 () (_ BitVec 32))

(declare-fun mapRest!11332 () (Array (_ BitVec 32) ValueCell!2978))

(assert (=> mapNonEmpty!11332 (= mapRest!11323 (store mapRest!11332 mapKey!11332 mapValue!11332))))

(declare-fun mapIsEmpty!11332 () Bool)

(assert (=> mapIsEmpty!11332 mapRes!11332))

(declare-fun b!262212 () Bool)

(assert (=> b!262212 (= e!169916 tp_is_empty!6643)))

(declare-fun b!262213 () Bool)

(declare-fun e!169915 () Bool)

(assert (=> b!262213 (= e!169915 tp_is_empty!6643)))

(declare-fun condMapEmpty!11332 () Bool)

(declare-fun mapDefault!11332 () ValueCell!2978)

(assert (=> mapNonEmpty!11323 (= condMapEmpty!11332 (= mapRest!11323 ((as const (Array (_ BitVec 32) ValueCell!2978)) mapDefault!11332)))))

(assert (=> mapNonEmpty!11323 (= tp!23673 (and e!169915 mapRes!11332))))

(assert (= (and mapNonEmpty!11323 condMapEmpty!11332) mapIsEmpty!11332))

(assert (= (and mapNonEmpty!11323 (not condMapEmpty!11332)) mapNonEmpty!11332))

(assert (= (and mapNonEmpty!11332 ((_ is ValueCellFull!2978) mapValue!11332)) b!262212))

(assert (= (and mapNonEmpty!11323 ((_ is ValueCellFull!2978) mapDefault!11332)) b!262213))

(declare-fun m!277861 () Bool)

(assert (=> mapNonEmpty!11332 m!277861))

(declare-fun b_lambda!8301 () Bool)

(assert (= b_lambda!8297 (or (and b!261825 b_free!6781) b_lambda!8301)))

(declare-fun b_lambda!8303 () Bool)

(assert (= b_lambda!8299 (or (and b!261825 b_free!6781) b_lambda!8303)))

(check-sat (not b!262115) (not mapNonEmpty!11332) (not d!62859) (not d!62845) (not bm!25040) (not b!261973) (not b!262131) (not b!262063) (not b!262079) (not b!262097) (not b!261974) (not b!262163) (not b!262049) (not b_lambda!8303) (not d!62853) (not bm!25035) (not b!262067) (not b_next!6781) (not bm!25017) (not b!262048) (not bm!25025) (not d!62817) (not bm!25033) (not b!262158) (not b!262170) (not bm!25030) (not b!262051) (not bm!25027) (not b!262132) (not b!262149) (not b!262177) (not d!62863) b_and!13897 (not b!261991) (not d!62839) (not b!262078) (not bm!25045) (not b!262081) (not b!262107) (not b!262060) (not b!262151) (not d!62849) (not d!62829) (not d!62825) (not bm!25021) (not b!262090) (not b_lambda!8301) (not bm!25022) (not d!62841) (not b!262148) (not bm!25039) (not d!62861) (not b!262106) (not d!62823) (not d!62821) (not b!262162) (not bm!25034) (not b!262165) (not b!262136) (not d!62833) (not d!62815) (not b!262120) (not b!262056) (not bm!25026) (not b!262112) (not b!262160) tp_is_empty!6643 (not bm!25046) (not b!262174) (not b!261972) (not b!262181) (not b!261998) (not b!262105) (not bm!25016) (not b!262175) (not b!262096) (not b!262003) (not b!262061))
(check-sat b_and!13897 (not b_next!6781))
