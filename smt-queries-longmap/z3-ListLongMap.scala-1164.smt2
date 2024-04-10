; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24608 () Bool)

(assert start!24608)

(declare-fun b!257589 () Bool)

(declare-fun b_free!6735 () Bool)

(declare-fun b_next!6735 () Bool)

(assert (=> b!257589 (= b_free!6735 (not b_next!6735))))

(declare-fun tp!23513 () Bool)

(declare-fun b_and!13805 () Bool)

(assert (=> b!257589 (= tp!23513 b_and!13805)))

(declare-fun b!257579 () Bool)

(declare-fun e!166967 () Bool)

(declare-fun e!166970 () Bool)

(assert (=> b!257579 (= e!166967 e!166970)))

(declare-fun res!125983 () Bool)

(declare-fun call!24459 () Bool)

(assert (=> b!257579 (= res!125983 call!24459)))

(assert (=> b!257579 (=> (not res!125983) (not e!166970))))

(declare-fun b!257580 () Bool)

(declare-fun res!125984 () Bool)

(declare-fun e!166974 () Bool)

(assert (=> b!257580 (=> (not res!125984) (not e!166974))))

(declare-datatypes ((V!8443 0))(
  ( (V!8444 (val!3343 Int)) )
))
(declare-datatypes ((ValueCell!2955 0))(
  ( (ValueCellFull!2955 (v!5438 V!8443)) (EmptyCell!2955) )
))
(declare-datatypes ((array!12539 0))(
  ( (array!12540 (arr!5938 (Array (_ BitVec 32) ValueCell!2955)) (size!6285 (_ BitVec 32))) )
))
(declare-datatypes ((array!12541 0))(
  ( (array!12542 (arr!5939 (Array (_ BitVec 32) (_ BitVec 64))) (size!6286 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3810 0))(
  ( (LongMapFixedSize!3811 (defaultEntry!4753 Int) (mask!11043 (_ BitVec 32)) (extraKeys!4490 (_ BitVec 32)) (zeroValue!4594 V!8443) (minValue!4594 V!8443) (_size!1954 (_ BitVec 32)) (_keys!6921 array!12541) (_values!4736 array!12539) (_vacant!1954 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3810)

(declare-datatypes ((SeekEntryResult!1171 0))(
  ( (MissingZero!1171 (index!6854 (_ BitVec 32))) (Found!1171 (index!6855 (_ BitVec 32))) (Intermediate!1171 (undefined!1983 Bool) (index!6856 (_ BitVec 32)) (x!25021 (_ BitVec 32))) (Undefined!1171) (MissingVacant!1171 (index!6857 (_ BitVec 32))) )
))
(declare-fun lt!129529 () SeekEntryResult!1171)

(assert (=> b!257580 (= res!125984 (= (select (arr!5939 (_keys!6921 thiss!1504)) (index!6854 lt!129529)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!125987 () Bool)

(declare-fun e!166968 () Bool)

(assert (=> start!24608 (=> (not res!125987) (not e!166968))))

(declare-fun valid!1489 (LongMapFixedSize!3810) Bool)

(assert (=> start!24608 (= res!125987 (valid!1489 thiss!1504))))

(assert (=> start!24608 e!166968))

(declare-fun e!166977 () Bool)

(assert (=> start!24608 e!166977))

(assert (=> start!24608 true))

(declare-fun tp_is_empty!6597 () Bool)

(assert (=> start!24608 tp_is_empty!6597))

(declare-fun mapIsEmpty!11232 () Bool)

(declare-fun mapRes!11232 () Bool)

(assert (=> mapIsEmpty!11232 mapRes!11232))

(declare-fun b!257581 () Bool)

(declare-datatypes ((Unit!8002 0))(
  ( (Unit!8003) )
))
(declare-fun e!166973 () Unit!8002)

(declare-fun lt!129523 () Unit!8002)

(assert (=> b!257581 (= e!166973 lt!129523)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!437 (array!12541 array!12539 (_ BitVec 32) (_ BitVec 32) V!8443 V!8443 (_ BitVec 64) Int) Unit!8002)

(assert (=> b!257581 (= lt!129523 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!437 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) key!932 (defaultEntry!4753 thiss!1504)))))

(declare-fun c!43596 () Bool)

(get-info :version)

(assert (=> b!257581 (= c!43596 ((_ is MissingZero!1171) lt!129529))))

(declare-fun e!166969 () Bool)

(assert (=> b!257581 e!166969))

(declare-fun b!257582 () Bool)

(declare-fun e!166975 () Unit!8002)

(declare-fun Unit!8004 () Unit!8002)

(assert (=> b!257582 (= e!166975 Unit!8004)))

(declare-fun lt!129528 () Unit!8002)

(declare-fun lemmaArrayContainsKeyThenInListMap!241 (array!12541 array!12539 (_ BitVec 32) (_ BitVec 32) V!8443 V!8443 (_ BitVec 64) (_ BitVec 32) Int) Unit!8002)

(assert (=> b!257582 (= lt!129528 (lemmaArrayContainsKeyThenInListMap!241 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(assert (=> b!257582 false))

(declare-fun b!257583 () Bool)

(declare-fun call!24460 () Bool)

(assert (=> b!257583 (= e!166974 (not call!24460))))

(declare-fun b!257584 () Bool)

(declare-fun e!166978 () Bool)

(assert (=> b!257584 (= e!166968 e!166978)))

(declare-fun res!125986 () Bool)

(assert (=> b!257584 (=> (not res!125986) (not e!166978))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!257584 (= res!125986 (or (= lt!129529 (MissingZero!1171 index!297)) (= lt!129529 (MissingVacant!1171 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12541 (_ BitVec 32)) SeekEntryResult!1171)

(assert (=> b!257584 (= lt!129529 (seekEntryOrOpen!0 key!932 (_keys!6921 thiss!1504) (mask!11043 thiss!1504)))))

(declare-fun bm!24456 () Bool)

(declare-fun arrayContainsKey!0 (array!12541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24456 (= call!24460 (arrayContainsKey!0 (_keys!6921 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257585 () Bool)

(declare-fun res!125981 () Bool)

(assert (=> b!257585 (=> (not res!125981) (not e!166968))))

(assert (=> b!257585 (= res!125981 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!257586 () Bool)

(assert (=> b!257586 (= e!166967 ((_ is Undefined!1171) lt!129529))))

(declare-fun mapNonEmpty!11232 () Bool)

(declare-fun tp!23514 () Bool)

(declare-fun e!166980 () Bool)

(assert (=> mapNonEmpty!11232 (= mapRes!11232 (and tp!23514 e!166980))))

(declare-fun mapRest!11232 () (Array (_ BitVec 32) ValueCell!2955))

(declare-fun mapValue!11232 () ValueCell!2955)

(declare-fun mapKey!11232 () (_ BitVec 32))

(assert (=> mapNonEmpty!11232 (= (arr!5938 (_values!4736 thiss!1504)) (store mapRest!11232 mapKey!11232 mapValue!11232))))

(declare-fun b!257587 () Bool)

(declare-fun e!166979 () Bool)

(assert (=> b!257587 (= e!166978 e!166979)))

(declare-fun res!125985 () Bool)

(assert (=> b!257587 (=> (not res!125985) (not e!166979))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257587 (= res!125985 (inRange!0 index!297 (mask!11043 thiss!1504)))))

(declare-fun lt!129535 () Unit!8002)

(assert (=> b!257587 (= lt!129535 e!166973)))

(declare-fun c!43595 () Bool)

(declare-datatypes ((tuple2!4926 0))(
  ( (tuple2!4927 (_1!2474 (_ BitVec 64)) (_2!2474 V!8443)) )
))
(declare-datatypes ((List!3805 0))(
  ( (Nil!3802) (Cons!3801 (h!4463 tuple2!4926) (t!8866 List!3805)) )
))
(declare-datatypes ((ListLongMap!3839 0))(
  ( (ListLongMap!3840 (toList!1935 List!3805)) )
))
(declare-fun lt!129526 () ListLongMap!3839)

(declare-fun contains!1875 (ListLongMap!3839 (_ BitVec 64)) Bool)

(assert (=> b!257587 (= c!43595 (contains!1875 lt!129526 key!932))))

(declare-fun getCurrentListMap!1463 (array!12541 array!12539 (_ BitVec 32) (_ BitVec 32) V!8443 V!8443 (_ BitVec 32) Int) ListLongMap!3839)

(assert (=> b!257587 (= lt!129526 (getCurrentListMap!1463 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun b!257588 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!257588 (= e!166979 (not (validMask!0 (mask!11043 thiss!1504))))))

(declare-fun lt!129532 () array!12541)

(declare-fun arrayCountValidKeys!0 (array!12541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!257588 (= (arrayCountValidKeys!0 lt!129532 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!129533 () Unit!8002)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12541 (_ BitVec 32)) Unit!8002)

(assert (=> b!257588 (= lt!129533 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129532 index!297))))

(assert (=> b!257588 (arrayContainsKey!0 lt!129532 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129525 () Unit!8002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12541 (_ BitVec 64) (_ BitVec 32)) Unit!8002)

(assert (=> b!257588 (= lt!129525 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129532 key!932 index!297))))

(declare-fun v!346 () V!8443)

(declare-fun +!689 (ListLongMap!3839 tuple2!4926) ListLongMap!3839)

(assert (=> b!257588 (= (+!689 lt!129526 (tuple2!4927 key!932 v!346)) (getCurrentListMap!1463 lt!129532 (array!12540 (store (arr!5938 (_values!4736 thiss!1504)) index!297 (ValueCellFull!2955 v!346)) (size!6285 (_values!4736 thiss!1504))) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun lt!129527 () Unit!8002)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!99 (array!12541 array!12539 (_ BitVec 32) (_ BitVec 32) V!8443 V!8443 (_ BitVec 32) (_ BitVec 64) V!8443 Int) Unit!8002)

(assert (=> b!257588 (= lt!129527 (lemmaAddValidKeyToArrayThenAddPairToListMap!99 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) index!297 key!932 v!346 (defaultEntry!4753 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12541 (_ BitVec 32)) Bool)

(assert (=> b!257588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129532 (mask!11043 thiss!1504))))

(declare-fun lt!129536 () Unit!8002)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12541 (_ BitVec 32) (_ BitVec 32)) Unit!8002)

(assert (=> b!257588 (= lt!129536 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6921 thiss!1504) index!297 (mask!11043 thiss!1504)))))

(assert (=> b!257588 (= (arrayCountValidKeys!0 lt!129532 #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6921 thiss!1504) #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504)))))))

(declare-fun lt!129524 () Unit!8002)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12541 (_ BitVec 32) (_ BitVec 64)) Unit!8002)

(assert (=> b!257588 (= lt!129524 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6921 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3806 0))(
  ( (Nil!3803) (Cons!3802 (h!4464 (_ BitVec 64)) (t!8867 List!3806)) )
))
(declare-fun arrayNoDuplicates!0 (array!12541 (_ BitVec 32) List!3806) Bool)

(assert (=> b!257588 (arrayNoDuplicates!0 lt!129532 #b00000000000000000000000000000000 Nil!3803)))

(assert (=> b!257588 (= lt!129532 (array!12542 (store (arr!5939 (_keys!6921 thiss!1504)) index!297 key!932) (size!6286 (_keys!6921 thiss!1504))))))

(declare-fun lt!129530 () Unit!8002)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12541 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3806) Unit!8002)

(assert (=> b!257588 (= lt!129530 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6921 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3803))))

(declare-fun lt!129534 () Unit!8002)

(assert (=> b!257588 (= lt!129534 e!166975)))

(declare-fun c!43594 () Bool)

(assert (=> b!257588 (= c!43594 (arrayContainsKey!0 (_keys!6921 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!166976 () Bool)

(declare-fun array_inv!3925 (array!12541) Bool)

(declare-fun array_inv!3926 (array!12539) Bool)

(assert (=> b!257589 (= e!166977 (and tp!23513 tp_is_empty!6597 (array_inv!3925 (_keys!6921 thiss!1504)) (array_inv!3926 (_values!4736 thiss!1504)) e!166976))))

(declare-fun b!257590 () Bool)

(declare-fun c!43593 () Bool)

(assert (=> b!257590 (= c!43593 ((_ is MissingVacant!1171) lt!129529))))

(assert (=> b!257590 (= e!166969 e!166967)))

(declare-fun bm!24457 () Bool)

(assert (=> bm!24457 (= call!24459 (inRange!0 (ite c!43596 (index!6854 lt!129529) (index!6857 lt!129529)) (mask!11043 thiss!1504)))))

(declare-fun b!257591 () Bool)

(declare-fun res!125982 () Bool)

(assert (=> b!257591 (=> (not res!125982) (not e!166974))))

(assert (=> b!257591 (= res!125982 call!24459)))

(assert (=> b!257591 (= e!166969 e!166974)))

(declare-fun b!257592 () Bool)

(assert (=> b!257592 (= e!166970 (not call!24460))))

(declare-fun b!257593 () Bool)

(declare-fun e!166971 () Bool)

(assert (=> b!257593 (= e!166971 tp_is_empty!6597)))

(declare-fun b!257594 () Bool)

(declare-fun Unit!8005 () Unit!8002)

(assert (=> b!257594 (= e!166975 Unit!8005)))

(declare-fun b!257595 () Bool)

(assert (=> b!257595 (= e!166976 (and e!166971 mapRes!11232))))

(declare-fun condMapEmpty!11232 () Bool)

(declare-fun mapDefault!11232 () ValueCell!2955)

(assert (=> b!257595 (= condMapEmpty!11232 (= (arr!5938 (_values!4736 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2955)) mapDefault!11232)))))

(declare-fun b!257596 () Bool)

(declare-fun res!125988 () Bool)

(assert (=> b!257596 (= res!125988 (= (select (arr!5939 (_keys!6921 thiss!1504)) (index!6857 lt!129529)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257596 (=> (not res!125988) (not e!166970))))

(declare-fun b!257597 () Bool)

(declare-fun Unit!8006 () Unit!8002)

(assert (=> b!257597 (= e!166973 Unit!8006)))

(declare-fun lt!129531 () Unit!8002)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!434 (array!12541 array!12539 (_ BitVec 32) (_ BitVec 32) V!8443 V!8443 (_ BitVec 64) Int) Unit!8002)

(assert (=> b!257597 (= lt!129531 (lemmaInListMapThenSeekEntryOrOpenFindsIt!434 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) key!932 (defaultEntry!4753 thiss!1504)))))

(assert (=> b!257597 false))

(declare-fun b!257598 () Bool)

(assert (=> b!257598 (= e!166980 tp_is_empty!6597)))

(assert (= (and start!24608 res!125987) b!257585))

(assert (= (and b!257585 res!125981) b!257584))

(assert (= (and b!257584 res!125986) b!257587))

(assert (= (and b!257587 c!43595) b!257597))

(assert (= (and b!257587 (not c!43595)) b!257581))

(assert (= (and b!257581 c!43596) b!257591))

(assert (= (and b!257581 (not c!43596)) b!257590))

(assert (= (and b!257591 res!125982) b!257580))

(assert (= (and b!257580 res!125984) b!257583))

(assert (= (and b!257590 c!43593) b!257579))

(assert (= (and b!257590 (not c!43593)) b!257586))

(assert (= (and b!257579 res!125983) b!257596))

(assert (= (and b!257596 res!125988) b!257592))

(assert (= (or b!257591 b!257579) bm!24457))

(assert (= (or b!257583 b!257592) bm!24456))

(assert (= (and b!257587 res!125985) b!257588))

(assert (= (and b!257588 c!43594) b!257582))

(assert (= (and b!257588 (not c!43594)) b!257594))

(assert (= (and b!257595 condMapEmpty!11232) mapIsEmpty!11232))

(assert (= (and b!257595 (not condMapEmpty!11232)) mapNonEmpty!11232))

(assert (= (and mapNonEmpty!11232 ((_ is ValueCellFull!2955) mapValue!11232)) b!257598))

(assert (= (and b!257595 ((_ is ValueCellFull!2955) mapDefault!11232)) b!257593))

(assert (= b!257589 b!257595))

(assert (= start!24608 b!257589))

(declare-fun m!272897 () Bool)

(assert (=> bm!24457 m!272897))

(declare-fun m!272899 () Bool)

(assert (=> b!257596 m!272899))

(declare-fun m!272901 () Bool)

(assert (=> start!24608 m!272901))

(declare-fun m!272903 () Bool)

(assert (=> bm!24456 m!272903))

(declare-fun m!272905 () Bool)

(assert (=> b!257584 m!272905))

(declare-fun m!272907 () Bool)

(assert (=> b!257580 m!272907))

(declare-fun m!272909 () Bool)

(assert (=> b!257582 m!272909))

(declare-fun m!272911 () Bool)

(assert (=> mapNonEmpty!11232 m!272911))

(declare-fun m!272913 () Bool)

(assert (=> b!257587 m!272913))

(declare-fun m!272915 () Bool)

(assert (=> b!257587 m!272915))

(declare-fun m!272917 () Bool)

(assert (=> b!257587 m!272917))

(declare-fun m!272919 () Bool)

(assert (=> b!257588 m!272919))

(declare-fun m!272921 () Bool)

(assert (=> b!257588 m!272921))

(declare-fun m!272923 () Bool)

(assert (=> b!257588 m!272923))

(declare-fun m!272925 () Bool)

(assert (=> b!257588 m!272925))

(declare-fun m!272927 () Bool)

(assert (=> b!257588 m!272927))

(declare-fun m!272929 () Bool)

(assert (=> b!257588 m!272929))

(declare-fun m!272931 () Bool)

(assert (=> b!257588 m!272931))

(declare-fun m!272933 () Bool)

(assert (=> b!257588 m!272933))

(declare-fun m!272935 () Bool)

(assert (=> b!257588 m!272935))

(declare-fun m!272937 () Bool)

(assert (=> b!257588 m!272937))

(declare-fun m!272939 () Bool)

(assert (=> b!257588 m!272939))

(declare-fun m!272941 () Bool)

(assert (=> b!257588 m!272941))

(assert (=> b!257588 m!272903))

(declare-fun m!272943 () Bool)

(assert (=> b!257588 m!272943))

(declare-fun m!272945 () Bool)

(assert (=> b!257588 m!272945))

(declare-fun m!272947 () Bool)

(assert (=> b!257588 m!272947))

(declare-fun m!272949 () Bool)

(assert (=> b!257588 m!272949))

(declare-fun m!272951 () Bool)

(assert (=> b!257588 m!272951))

(declare-fun m!272953 () Bool)

(assert (=> b!257581 m!272953))

(declare-fun m!272955 () Bool)

(assert (=> b!257597 m!272955))

(declare-fun m!272957 () Bool)

(assert (=> b!257589 m!272957))

(declare-fun m!272959 () Bool)

(assert (=> b!257589 m!272959))

(check-sat (not b!257581) (not b!257597) (not start!24608) b_and!13805 (not b!257588) (not b_next!6735) (not b!257582) tp_is_empty!6597 (not bm!24456) (not bm!24457) (not b!257589) (not b!257584) (not b!257587) (not mapNonEmpty!11232))
(check-sat b_and!13805 (not b_next!6735))
(get-model)

(declare-fun b!257670 () Bool)

(declare-fun e!167028 () Bool)

(assert (=> b!257670 (= e!167028 (= (arrayCountValidKeys!0 (array!12542 (store (arr!5939 (_keys!6921 thiss!1504)) index!297 key!932) (size!6286 (_keys!6921 thiss!1504))) #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6921 thiss!1504) #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!257669 () Bool)

(declare-fun e!167027 () Bool)

(assert (=> b!257669 (= e!167027 (bvslt (size!6286 (_keys!6921 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!61823 () Bool)

(assert (=> d!61823 e!167028))

(declare-fun res!126021 () Bool)

(assert (=> d!61823 (=> (not res!126021) (not e!167028))))

(assert (=> d!61823 (= res!126021 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 (_keys!6921 thiss!1504)))))))

(declare-fun lt!129581 () Unit!8002)

(declare-fun choose!1 (array!12541 (_ BitVec 32) (_ BitVec 64)) Unit!8002)

(assert (=> d!61823 (= lt!129581 (choose!1 (_keys!6921 thiss!1504) index!297 key!932))))

(assert (=> d!61823 e!167027))

(declare-fun res!126024 () Bool)

(assert (=> d!61823 (=> (not res!126024) (not e!167027))))

(assert (=> d!61823 (= res!126024 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 (_keys!6921 thiss!1504)))))))

(assert (=> d!61823 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6921 thiss!1504) index!297 key!932) lt!129581)))

(declare-fun b!257668 () Bool)

(declare-fun res!126022 () Bool)

(assert (=> b!257668 (=> (not res!126022) (not e!167027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!257668 (= res!126022 (validKeyInArray!0 key!932))))

(declare-fun b!257667 () Bool)

(declare-fun res!126023 () Bool)

(assert (=> b!257667 (=> (not res!126023) (not e!167027))))

(assert (=> b!257667 (= res!126023 (not (validKeyInArray!0 (select (arr!5939 (_keys!6921 thiss!1504)) index!297))))))

(assert (= (and d!61823 res!126024) b!257667))

(assert (= (and b!257667 res!126023) b!257668))

(assert (= (and b!257668 res!126022) b!257669))

(assert (= (and d!61823 res!126021) b!257670))

(assert (=> b!257670 m!272937))

(declare-fun m!273025 () Bool)

(assert (=> b!257670 m!273025))

(assert (=> b!257670 m!272945))

(declare-fun m!273027 () Bool)

(assert (=> d!61823 m!273027))

(declare-fun m!273029 () Bool)

(assert (=> b!257668 m!273029))

(declare-fun m!273031 () Bool)

(assert (=> b!257667 m!273031))

(assert (=> b!257667 m!273031))

(declare-fun m!273033 () Bool)

(assert (=> b!257667 m!273033))

(assert (=> b!257588 d!61823))

(declare-fun d!61825 () Bool)

(assert (=> d!61825 (= (arrayCountValidKeys!0 lt!129532 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!129584 () Unit!8002)

(declare-fun choose!2 (array!12541 (_ BitVec 32)) Unit!8002)

(assert (=> d!61825 (= lt!129584 (choose!2 lt!129532 index!297))))

(declare-fun e!167031 () Bool)

(assert (=> d!61825 e!167031))

(declare-fun res!126029 () Bool)

(assert (=> d!61825 (=> (not res!126029) (not e!167031))))

(assert (=> d!61825 (= res!126029 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 lt!129532))))))

(assert (=> d!61825 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!129532 index!297) lt!129584)))

(declare-fun b!257675 () Bool)

(declare-fun res!126030 () Bool)

(assert (=> b!257675 (=> (not res!126030) (not e!167031))))

(assert (=> b!257675 (= res!126030 (validKeyInArray!0 (select (arr!5939 lt!129532) index!297)))))

(declare-fun b!257676 () Bool)

(assert (=> b!257676 (= e!167031 (bvslt (size!6286 lt!129532) #b01111111111111111111111111111111))))

(assert (= (and d!61825 res!126029) b!257675))

(assert (= (and b!257675 res!126030) b!257676))

(declare-fun m!273035 () Bool)

(assert (=> d!61825 m!273035))

(declare-fun m!273037 () Bool)

(assert (=> d!61825 m!273037))

(declare-fun m!273039 () Bool)

(assert (=> b!257675 m!273039))

(assert (=> b!257675 m!273039))

(declare-fun m!273041 () Bool)

(assert (=> b!257675 m!273041))

(assert (=> b!257588 d!61825))

(declare-fun b!257685 () Bool)

(declare-fun e!167037 () (_ BitVec 32))

(declare-fun e!167036 () (_ BitVec 32))

(assert (=> b!257685 (= e!167037 e!167036)))

(declare-fun c!43614 () Bool)

(assert (=> b!257685 (= c!43614 (validKeyInArray!0 (select (arr!5939 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24466 () Bool)

(declare-fun call!24469 () (_ BitVec 32))

(assert (=> bm!24466 (= call!24469 (arrayCountValidKeys!0 (_keys!6921 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6921 thiss!1504))))))

(declare-fun b!257686 () Bool)

(assert (=> b!257686 (= e!167036 call!24469)))

(declare-fun b!257687 () Bool)

(assert (=> b!257687 (= e!167037 #b00000000000000000000000000000000)))

(declare-fun d!61827 () Bool)

(declare-fun lt!129587 () (_ BitVec 32))

(assert (=> d!61827 (and (bvsge lt!129587 #b00000000000000000000000000000000) (bvsle lt!129587 (bvsub (size!6286 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61827 (= lt!129587 e!167037)))

(declare-fun c!43613 () Bool)

(assert (=> d!61827 (= c!43613 (bvsge #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))))))

(assert (=> d!61827 (and (bvsle #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6286 (_keys!6921 thiss!1504)) (size!6286 (_keys!6921 thiss!1504))))))

(assert (=> d!61827 (= (arrayCountValidKeys!0 (_keys!6921 thiss!1504) #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))) lt!129587)))

(declare-fun b!257688 () Bool)

(assert (=> b!257688 (= e!167036 (bvadd #b00000000000000000000000000000001 call!24469))))

(assert (= (and d!61827 c!43613) b!257687))

(assert (= (and d!61827 (not c!43613)) b!257685))

(assert (= (and b!257685 c!43614) b!257688))

(assert (= (and b!257685 (not c!43614)) b!257686))

(assert (= (or b!257688 b!257686) bm!24466))

(declare-fun m!273043 () Bool)

(assert (=> b!257685 m!273043))

(assert (=> b!257685 m!273043))

(declare-fun m!273045 () Bool)

(assert (=> b!257685 m!273045))

(declare-fun m!273047 () Bool)

(assert (=> bm!24466 m!273047))

(assert (=> b!257588 d!61827))

(declare-fun d!61829 () Bool)

(declare-fun e!167040 () Bool)

(assert (=> d!61829 e!167040))

(declare-fun res!126033 () Bool)

(assert (=> d!61829 (=> (not res!126033) (not e!167040))))

(assert (=> d!61829 (= res!126033 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 (_keys!6921 thiss!1504))) (bvslt index!297 (size!6285 (_values!4736 thiss!1504)))))))

(declare-fun lt!129590 () Unit!8002)

(declare-fun choose!1240 (array!12541 array!12539 (_ BitVec 32) (_ BitVec 32) V!8443 V!8443 (_ BitVec 32) (_ BitVec 64) V!8443 Int) Unit!8002)

(assert (=> d!61829 (= lt!129590 (choose!1240 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) index!297 key!932 v!346 (defaultEntry!4753 thiss!1504)))))

(assert (=> d!61829 (validMask!0 (mask!11043 thiss!1504))))

(assert (=> d!61829 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!99 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) index!297 key!932 v!346 (defaultEntry!4753 thiss!1504)) lt!129590)))

(declare-fun b!257691 () Bool)

(assert (=> b!257691 (= e!167040 (= (+!689 (getCurrentListMap!1463 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)) (tuple2!4927 key!932 v!346)) (getCurrentListMap!1463 (array!12542 (store (arr!5939 (_keys!6921 thiss!1504)) index!297 key!932) (size!6286 (_keys!6921 thiss!1504))) (array!12540 (store (arr!5938 (_values!4736 thiss!1504)) index!297 (ValueCellFull!2955 v!346)) (size!6285 (_values!4736 thiss!1504))) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504))))))

(assert (= (and d!61829 res!126033) b!257691))

(declare-fun m!273049 () Bool)

(assert (=> d!61829 m!273049))

(assert (=> d!61829 m!272919))

(assert (=> b!257691 m!272917))

(assert (=> b!257691 m!272925))

(declare-fun m!273051 () Bool)

(assert (=> b!257691 m!273051))

(assert (=> b!257691 m!272917))

(declare-fun m!273053 () Bool)

(assert (=> b!257691 m!273053))

(assert (=> b!257691 m!272937))

(assert (=> b!257588 d!61829))

(declare-fun d!61831 () Bool)

(assert (=> d!61831 (= (validMask!0 (mask!11043 thiss!1504)) (and (or (= (mask!11043 thiss!1504) #b00000000000000000000000000000111) (= (mask!11043 thiss!1504) #b00000000000000000000000000001111) (= (mask!11043 thiss!1504) #b00000000000000000000000000011111) (= (mask!11043 thiss!1504) #b00000000000000000000000000111111) (= (mask!11043 thiss!1504) #b00000000000000000000000001111111) (= (mask!11043 thiss!1504) #b00000000000000000000000011111111) (= (mask!11043 thiss!1504) #b00000000000000000000000111111111) (= (mask!11043 thiss!1504) #b00000000000000000000001111111111) (= (mask!11043 thiss!1504) #b00000000000000000000011111111111) (= (mask!11043 thiss!1504) #b00000000000000000000111111111111) (= (mask!11043 thiss!1504) #b00000000000000000001111111111111) (= (mask!11043 thiss!1504) #b00000000000000000011111111111111) (= (mask!11043 thiss!1504) #b00000000000000000111111111111111) (= (mask!11043 thiss!1504) #b00000000000000001111111111111111) (= (mask!11043 thiss!1504) #b00000000000000011111111111111111) (= (mask!11043 thiss!1504) #b00000000000000111111111111111111) (= (mask!11043 thiss!1504) #b00000000000001111111111111111111) (= (mask!11043 thiss!1504) #b00000000000011111111111111111111) (= (mask!11043 thiss!1504) #b00000000000111111111111111111111) (= (mask!11043 thiss!1504) #b00000000001111111111111111111111) (= (mask!11043 thiss!1504) #b00000000011111111111111111111111) (= (mask!11043 thiss!1504) #b00000000111111111111111111111111) (= (mask!11043 thiss!1504) #b00000001111111111111111111111111) (= (mask!11043 thiss!1504) #b00000011111111111111111111111111) (= (mask!11043 thiss!1504) #b00000111111111111111111111111111) (= (mask!11043 thiss!1504) #b00001111111111111111111111111111) (= (mask!11043 thiss!1504) #b00011111111111111111111111111111) (= (mask!11043 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11043 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!257588 d!61831))

(declare-fun b!257692 () Bool)

(declare-fun e!167042 () (_ BitVec 32))

(declare-fun e!167041 () (_ BitVec 32))

(assert (=> b!257692 (= e!167042 e!167041)))

(declare-fun c!43616 () Bool)

(assert (=> b!257692 (= c!43616 (validKeyInArray!0 (select (arr!5939 lt!129532) index!297)))))

(declare-fun bm!24467 () Bool)

(declare-fun call!24470 () (_ BitVec 32))

(assert (=> bm!24467 (= call!24470 (arrayCountValidKeys!0 lt!129532 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!257693 () Bool)

(assert (=> b!257693 (= e!167041 call!24470)))

(declare-fun b!257694 () Bool)

(assert (=> b!257694 (= e!167042 #b00000000000000000000000000000000)))

(declare-fun d!61833 () Bool)

(declare-fun lt!129591 () (_ BitVec 32))

(assert (=> d!61833 (and (bvsge lt!129591 #b00000000000000000000000000000000) (bvsle lt!129591 (bvsub (size!6286 lt!129532) index!297)))))

(assert (=> d!61833 (= lt!129591 e!167042)))

(declare-fun c!43615 () Bool)

(assert (=> d!61833 (= c!43615 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!61833 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6286 lt!129532)))))

(assert (=> d!61833 (= (arrayCountValidKeys!0 lt!129532 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!129591)))

(declare-fun b!257695 () Bool)

(assert (=> b!257695 (= e!167041 (bvadd #b00000000000000000000000000000001 call!24470))))

(assert (= (and d!61833 c!43615) b!257694))

(assert (= (and d!61833 (not c!43615)) b!257692))

(assert (= (and b!257692 c!43616) b!257695))

(assert (= (and b!257692 (not c!43616)) b!257693))

(assert (= (or b!257695 b!257693) bm!24467))

(assert (=> b!257692 m!273039))

(assert (=> b!257692 m!273039))

(assert (=> b!257692 m!273041))

(declare-fun m!273055 () Bool)

(assert (=> bm!24467 m!273055))

(assert (=> b!257588 d!61833))

(declare-fun d!61835 () Bool)

(declare-fun e!167045 () Bool)

(assert (=> d!61835 e!167045))

(declare-fun res!126039 () Bool)

(assert (=> d!61835 (=> (not res!126039) (not e!167045))))

(declare-fun lt!129603 () ListLongMap!3839)

(assert (=> d!61835 (= res!126039 (contains!1875 lt!129603 (_1!2474 (tuple2!4927 key!932 v!346))))))

(declare-fun lt!129602 () List!3805)

(assert (=> d!61835 (= lt!129603 (ListLongMap!3840 lt!129602))))

(declare-fun lt!129601 () Unit!8002)

(declare-fun lt!129600 () Unit!8002)

(assert (=> d!61835 (= lt!129601 lt!129600)))

(declare-datatypes ((Option!318 0))(
  ( (Some!317 (v!5442 V!8443)) (None!316) )
))
(declare-fun getValueByKey!312 (List!3805 (_ BitVec 64)) Option!318)

(assert (=> d!61835 (= (getValueByKey!312 lt!129602 (_1!2474 (tuple2!4927 key!932 v!346))) (Some!317 (_2!2474 (tuple2!4927 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!168 (List!3805 (_ BitVec 64) V!8443) Unit!8002)

(assert (=> d!61835 (= lt!129600 (lemmaContainsTupThenGetReturnValue!168 lt!129602 (_1!2474 (tuple2!4927 key!932 v!346)) (_2!2474 (tuple2!4927 key!932 v!346))))))

(declare-fun insertStrictlySorted!171 (List!3805 (_ BitVec 64) V!8443) List!3805)

(assert (=> d!61835 (= lt!129602 (insertStrictlySorted!171 (toList!1935 lt!129526) (_1!2474 (tuple2!4927 key!932 v!346)) (_2!2474 (tuple2!4927 key!932 v!346))))))

(assert (=> d!61835 (= (+!689 lt!129526 (tuple2!4927 key!932 v!346)) lt!129603)))

(declare-fun b!257700 () Bool)

(declare-fun res!126038 () Bool)

(assert (=> b!257700 (=> (not res!126038) (not e!167045))))

(assert (=> b!257700 (= res!126038 (= (getValueByKey!312 (toList!1935 lt!129603) (_1!2474 (tuple2!4927 key!932 v!346))) (Some!317 (_2!2474 (tuple2!4927 key!932 v!346)))))))

(declare-fun b!257701 () Bool)

(declare-fun contains!1876 (List!3805 tuple2!4926) Bool)

(assert (=> b!257701 (= e!167045 (contains!1876 (toList!1935 lt!129603) (tuple2!4927 key!932 v!346)))))

(assert (= (and d!61835 res!126039) b!257700))

(assert (= (and b!257700 res!126038) b!257701))

(declare-fun m!273057 () Bool)

(assert (=> d!61835 m!273057))

(declare-fun m!273059 () Bool)

(assert (=> d!61835 m!273059))

(declare-fun m!273061 () Bool)

(assert (=> d!61835 m!273061))

(declare-fun m!273063 () Bool)

(assert (=> d!61835 m!273063))

(declare-fun m!273065 () Bool)

(assert (=> b!257700 m!273065))

(declare-fun m!273067 () Bool)

(assert (=> b!257701 m!273067))

(assert (=> b!257588 d!61835))

(declare-fun d!61837 () Bool)

(declare-fun res!126046 () Bool)

(declare-fun e!167057 () Bool)

(assert (=> d!61837 (=> res!126046 e!167057)))

(assert (=> d!61837 (= res!126046 (bvsge #b00000000000000000000000000000000 (size!6286 lt!129532)))))

(assert (=> d!61837 (= (arrayNoDuplicates!0 lt!129532 #b00000000000000000000000000000000 Nil!3803) e!167057)))

(declare-fun b!257712 () Bool)

(declare-fun e!167055 () Bool)

(declare-fun e!167054 () Bool)

(assert (=> b!257712 (= e!167055 e!167054)))

(declare-fun c!43619 () Bool)

(assert (=> b!257712 (= c!43619 (validKeyInArray!0 (select (arr!5939 lt!129532) #b00000000000000000000000000000000)))))

(declare-fun b!257713 () Bool)

(declare-fun call!24473 () Bool)

(assert (=> b!257713 (= e!167054 call!24473)))

(declare-fun b!257714 () Bool)

(declare-fun e!167056 () Bool)

(declare-fun contains!1877 (List!3806 (_ BitVec 64)) Bool)

(assert (=> b!257714 (= e!167056 (contains!1877 Nil!3803 (select (arr!5939 lt!129532) #b00000000000000000000000000000000)))))

(declare-fun bm!24470 () Bool)

(assert (=> bm!24470 (= call!24473 (arrayNoDuplicates!0 lt!129532 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43619 (Cons!3802 (select (arr!5939 lt!129532) #b00000000000000000000000000000000) Nil!3803) Nil!3803)))))

(declare-fun b!257715 () Bool)

(assert (=> b!257715 (= e!167054 call!24473)))

(declare-fun b!257716 () Bool)

(assert (=> b!257716 (= e!167057 e!167055)))

(declare-fun res!126048 () Bool)

(assert (=> b!257716 (=> (not res!126048) (not e!167055))))

(assert (=> b!257716 (= res!126048 (not e!167056))))

(declare-fun res!126047 () Bool)

(assert (=> b!257716 (=> (not res!126047) (not e!167056))))

(assert (=> b!257716 (= res!126047 (validKeyInArray!0 (select (arr!5939 lt!129532) #b00000000000000000000000000000000)))))

(assert (= (and d!61837 (not res!126046)) b!257716))

(assert (= (and b!257716 res!126047) b!257714))

(assert (= (and b!257716 res!126048) b!257712))

(assert (= (and b!257712 c!43619) b!257713))

(assert (= (and b!257712 (not c!43619)) b!257715))

(assert (= (or b!257713 b!257715) bm!24470))

(declare-fun m!273069 () Bool)

(assert (=> b!257712 m!273069))

(assert (=> b!257712 m!273069))

(declare-fun m!273071 () Bool)

(assert (=> b!257712 m!273071))

(assert (=> b!257714 m!273069))

(assert (=> b!257714 m!273069))

(declare-fun m!273073 () Bool)

(assert (=> b!257714 m!273073))

(assert (=> bm!24470 m!273069))

(declare-fun m!273075 () Bool)

(assert (=> bm!24470 m!273075))

(assert (=> b!257716 m!273069))

(assert (=> b!257716 m!273069))

(assert (=> b!257716 m!273071))

(assert (=> b!257588 d!61837))

(declare-fun d!61839 () Bool)

(declare-fun e!167060 () Bool)

(assert (=> d!61839 e!167060))

(declare-fun res!126051 () Bool)

(assert (=> d!61839 (=> (not res!126051) (not e!167060))))

(assert (=> d!61839 (= res!126051 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 (_keys!6921 thiss!1504)))))))

(declare-fun lt!129606 () Unit!8002)

(declare-fun choose!41 (array!12541 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3806) Unit!8002)

(assert (=> d!61839 (= lt!129606 (choose!41 (_keys!6921 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3803))))

(assert (=> d!61839 (bvslt (size!6286 (_keys!6921 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61839 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6921 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3803) lt!129606)))

(declare-fun b!257719 () Bool)

(assert (=> b!257719 (= e!167060 (arrayNoDuplicates!0 (array!12542 (store (arr!5939 (_keys!6921 thiss!1504)) index!297 key!932) (size!6286 (_keys!6921 thiss!1504))) #b00000000000000000000000000000000 Nil!3803))))

(assert (= (and d!61839 res!126051) b!257719))

(declare-fun m!273077 () Bool)

(assert (=> d!61839 m!273077))

(assert (=> b!257719 m!272937))

(declare-fun m!273079 () Bool)

(assert (=> b!257719 m!273079))

(assert (=> b!257588 d!61839))

(declare-fun d!61841 () Bool)

(declare-fun res!126056 () Bool)

(declare-fun e!167065 () Bool)

(assert (=> d!61841 (=> res!126056 e!167065)))

(assert (=> d!61841 (= res!126056 (= (select (arr!5939 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61841 (= (arrayContainsKey!0 (_keys!6921 thiss!1504) key!932 #b00000000000000000000000000000000) e!167065)))

(declare-fun b!257724 () Bool)

(declare-fun e!167066 () Bool)

(assert (=> b!257724 (= e!167065 e!167066)))

(declare-fun res!126057 () Bool)

(assert (=> b!257724 (=> (not res!126057) (not e!167066))))

(assert (=> b!257724 (= res!126057 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6921 thiss!1504))))))

(declare-fun b!257725 () Bool)

(assert (=> b!257725 (= e!167066 (arrayContainsKey!0 (_keys!6921 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61841 (not res!126056)) b!257724))

(assert (= (and b!257724 res!126057) b!257725))

(assert (=> d!61841 m!273043))

(declare-fun m!273081 () Bool)

(assert (=> b!257725 m!273081))

(assert (=> b!257588 d!61841))

(declare-fun b!257768 () Bool)

(declare-fun e!167094 () Unit!8002)

(declare-fun Unit!8011 () Unit!8002)

(assert (=> b!257768 (= e!167094 Unit!8011)))

(declare-fun bm!24485 () Bool)

(declare-fun call!24494 () Bool)

(declare-fun lt!129654 () ListLongMap!3839)

(assert (=> bm!24485 (= call!24494 (contains!1875 lt!129654 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24486 () Bool)

(declare-fun call!24489 () ListLongMap!3839)

(declare-fun call!24490 () ListLongMap!3839)

(assert (=> bm!24486 (= call!24489 call!24490)))

(declare-fun b!257769 () Bool)

(declare-fun res!126081 () Bool)

(declare-fun e!167098 () Bool)

(assert (=> b!257769 (=> (not res!126081) (not e!167098))))

(declare-fun e!167101 () Bool)

(assert (=> b!257769 (= res!126081 e!167101)))

(declare-fun res!126084 () Bool)

(assert (=> b!257769 (=> res!126084 e!167101)))

(declare-fun e!167102 () Bool)

(assert (=> b!257769 (= res!126084 (not e!167102))))

(declare-fun res!126079 () Bool)

(assert (=> b!257769 (=> (not res!126079) (not e!167102))))

(assert (=> b!257769 (= res!126079 (bvslt #b00000000000000000000000000000000 (size!6286 lt!129532)))))

(declare-fun b!257770 () Bool)

(declare-fun e!167097 () Bool)

(declare-fun apply!254 (ListLongMap!3839 (_ BitVec 64)) V!8443)

(assert (=> b!257770 (= e!167097 (= (apply!254 lt!129654 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4594 thiss!1504)))))

(declare-fun call!24488 () ListLongMap!3839)

(declare-fun bm!24487 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!576 (array!12541 array!12539 (_ BitVec 32) (_ BitVec 32) V!8443 V!8443 (_ BitVec 32) Int) ListLongMap!3839)

(assert (=> bm!24487 (= call!24488 (getCurrentListMapNoExtraKeys!576 lt!129532 (array!12540 (store (arr!5938 (_values!4736 thiss!1504)) index!297 (ValueCellFull!2955 v!346)) (size!6285 (_values!4736 thiss!1504))) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun b!257771 () Bool)

(declare-fun e!167105 () ListLongMap!3839)

(declare-fun call!24492 () ListLongMap!3839)

(assert (=> b!257771 (= e!167105 call!24492)))

(declare-fun b!257772 () Bool)

(declare-fun e!167100 () Bool)

(assert (=> b!257772 (= e!167100 e!167097)))

(declare-fun res!126083 () Bool)

(declare-fun call!24493 () Bool)

(assert (=> b!257772 (= res!126083 call!24493)))

(assert (=> b!257772 (=> (not res!126083) (not e!167097))))

(declare-fun b!257773 () Bool)

(declare-fun e!167104 () Bool)

(assert (=> b!257773 (= e!167098 e!167104)))

(declare-fun c!43634 () Bool)

(assert (=> b!257773 (= c!43634 (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257774 () Bool)

(declare-fun e!167093 () Bool)

(assert (=> b!257774 (= e!167104 e!167093)))

(declare-fun res!126078 () Bool)

(assert (=> b!257774 (= res!126078 call!24494)))

(assert (=> b!257774 (=> (not res!126078) (not e!167093))))

(declare-fun b!257775 () Bool)

(declare-fun e!167096 () Bool)

(declare-fun get!3053 (ValueCell!2955 V!8443) V!8443)

(declare-fun dynLambda!597 (Int (_ BitVec 64)) V!8443)

(assert (=> b!257775 (= e!167096 (= (apply!254 lt!129654 (select (arr!5939 lt!129532) #b00000000000000000000000000000000)) (get!3053 (select (arr!5938 (array!12540 (store (arr!5938 (_values!4736 thiss!1504)) index!297 (ValueCellFull!2955 v!346)) (size!6285 (_values!4736 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!597 (defaultEntry!4753 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6285 (array!12540 (store (arr!5938 (_values!4736 thiss!1504)) index!297 (ValueCellFull!2955 v!346)) (size!6285 (_values!4736 thiss!1504))))))))

(assert (=> b!257775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 lt!129532)))))

(declare-fun b!257776 () Bool)

(declare-fun e!167095 () ListLongMap!3839)

(declare-fun call!24491 () ListLongMap!3839)

(assert (=> b!257776 (= e!167095 (+!689 call!24491 (tuple2!4927 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4594 thiss!1504))))))

(declare-fun b!257777 () Bool)

(assert (=> b!257777 (= e!167100 (not call!24493))))

(declare-fun b!257778 () Bool)

(declare-fun res!126077 () Bool)

(assert (=> b!257778 (=> (not res!126077) (not e!167098))))

(assert (=> b!257778 (= res!126077 e!167100)))

(declare-fun c!43637 () Bool)

(assert (=> b!257778 (= c!43637 (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!43635 () Bool)

(declare-fun bm!24489 () Bool)

(declare-fun c!43632 () Bool)

(assert (=> bm!24489 (= call!24491 (+!689 (ite c!43632 call!24488 (ite c!43635 call!24490 call!24489)) (ite (or c!43632 c!43635) (tuple2!4927 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4594 thiss!1504)) (tuple2!4927 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4594 thiss!1504)))))))

(declare-fun b!257779 () Bool)

(assert (=> b!257779 (= e!167105 call!24489)))

(declare-fun b!257780 () Bool)

(declare-fun c!43633 () Bool)

(assert (=> b!257780 (= c!43633 (and (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167103 () ListLongMap!3839)

(assert (=> b!257780 (= e!167103 e!167105)))

(declare-fun b!257781 () Bool)

(assert (=> b!257781 (= e!167093 (= (apply!254 lt!129654 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4594 thiss!1504)))))

(declare-fun b!257782 () Bool)

(assert (=> b!257782 (= e!167095 e!167103)))

(assert (=> b!257782 (= c!43635 (and (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257783 () Bool)

(declare-fun e!167099 () Bool)

(assert (=> b!257783 (= e!167099 (validKeyInArray!0 (select (arr!5939 lt!129532) #b00000000000000000000000000000000)))))

(declare-fun b!257784 () Bool)

(assert (=> b!257784 (= e!167102 (validKeyInArray!0 (select (arr!5939 lt!129532) #b00000000000000000000000000000000)))))

(declare-fun bm!24490 () Bool)

(assert (=> bm!24490 (= call!24492 call!24491)))

(declare-fun b!257785 () Bool)

(assert (=> b!257785 (= e!167104 (not call!24494))))

(declare-fun bm!24491 () Bool)

(assert (=> bm!24491 (= call!24493 (contains!1875 lt!129654 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257786 () Bool)

(assert (=> b!257786 (= e!167103 call!24492)))

(declare-fun b!257787 () Bool)

(declare-fun lt!129652 () Unit!8002)

(assert (=> b!257787 (= e!167094 lt!129652)))

(declare-fun lt!129671 () ListLongMap!3839)

(assert (=> b!257787 (= lt!129671 (getCurrentListMapNoExtraKeys!576 lt!129532 (array!12540 (store (arr!5938 (_values!4736 thiss!1504)) index!297 (ValueCellFull!2955 v!346)) (size!6285 (_values!4736 thiss!1504))) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun lt!129653 () (_ BitVec 64))

(assert (=> b!257787 (= lt!129653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129656 () (_ BitVec 64))

(assert (=> b!257787 (= lt!129656 (select (arr!5939 lt!129532) #b00000000000000000000000000000000))))

(declare-fun lt!129651 () Unit!8002)

(declare-fun addStillContains!230 (ListLongMap!3839 (_ BitVec 64) V!8443 (_ BitVec 64)) Unit!8002)

(assert (=> b!257787 (= lt!129651 (addStillContains!230 lt!129671 lt!129653 (zeroValue!4594 thiss!1504) lt!129656))))

(assert (=> b!257787 (contains!1875 (+!689 lt!129671 (tuple2!4927 lt!129653 (zeroValue!4594 thiss!1504))) lt!129656)))

(declare-fun lt!129672 () Unit!8002)

(assert (=> b!257787 (= lt!129672 lt!129651)))

(declare-fun lt!129670 () ListLongMap!3839)

(assert (=> b!257787 (= lt!129670 (getCurrentListMapNoExtraKeys!576 lt!129532 (array!12540 (store (arr!5938 (_values!4736 thiss!1504)) index!297 (ValueCellFull!2955 v!346)) (size!6285 (_values!4736 thiss!1504))) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun lt!129661 () (_ BitVec 64))

(assert (=> b!257787 (= lt!129661 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129664 () (_ BitVec 64))

(assert (=> b!257787 (= lt!129664 (select (arr!5939 lt!129532) #b00000000000000000000000000000000))))

(declare-fun lt!129668 () Unit!8002)

(declare-fun addApplyDifferent!230 (ListLongMap!3839 (_ BitVec 64) V!8443 (_ BitVec 64)) Unit!8002)

(assert (=> b!257787 (= lt!129668 (addApplyDifferent!230 lt!129670 lt!129661 (minValue!4594 thiss!1504) lt!129664))))

(assert (=> b!257787 (= (apply!254 (+!689 lt!129670 (tuple2!4927 lt!129661 (minValue!4594 thiss!1504))) lt!129664) (apply!254 lt!129670 lt!129664))))

(declare-fun lt!129657 () Unit!8002)

(assert (=> b!257787 (= lt!129657 lt!129668)))

(declare-fun lt!129667 () ListLongMap!3839)

(assert (=> b!257787 (= lt!129667 (getCurrentListMapNoExtraKeys!576 lt!129532 (array!12540 (store (arr!5938 (_values!4736 thiss!1504)) index!297 (ValueCellFull!2955 v!346)) (size!6285 (_values!4736 thiss!1504))) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun lt!129665 () (_ BitVec 64))

(assert (=> b!257787 (= lt!129665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129666 () (_ BitVec 64))

(assert (=> b!257787 (= lt!129666 (select (arr!5939 lt!129532) #b00000000000000000000000000000000))))

(declare-fun lt!129659 () Unit!8002)

(assert (=> b!257787 (= lt!129659 (addApplyDifferent!230 lt!129667 lt!129665 (zeroValue!4594 thiss!1504) lt!129666))))

(assert (=> b!257787 (= (apply!254 (+!689 lt!129667 (tuple2!4927 lt!129665 (zeroValue!4594 thiss!1504))) lt!129666) (apply!254 lt!129667 lt!129666))))

(declare-fun lt!129669 () Unit!8002)

(assert (=> b!257787 (= lt!129669 lt!129659)))

(declare-fun lt!129658 () ListLongMap!3839)

(assert (=> b!257787 (= lt!129658 (getCurrentListMapNoExtraKeys!576 lt!129532 (array!12540 (store (arr!5938 (_values!4736 thiss!1504)) index!297 (ValueCellFull!2955 v!346)) (size!6285 (_values!4736 thiss!1504))) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun lt!129662 () (_ BitVec 64))

(assert (=> b!257787 (= lt!129662 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129660 () (_ BitVec 64))

(assert (=> b!257787 (= lt!129660 (select (arr!5939 lt!129532) #b00000000000000000000000000000000))))

(assert (=> b!257787 (= lt!129652 (addApplyDifferent!230 lt!129658 lt!129662 (minValue!4594 thiss!1504) lt!129660))))

(assert (=> b!257787 (= (apply!254 (+!689 lt!129658 (tuple2!4927 lt!129662 (minValue!4594 thiss!1504))) lt!129660) (apply!254 lt!129658 lt!129660))))

(declare-fun b!257788 () Bool)

(assert (=> b!257788 (= e!167101 e!167096)))

(declare-fun res!126082 () Bool)

(assert (=> b!257788 (=> (not res!126082) (not e!167096))))

(assert (=> b!257788 (= res!126082 (contains!1875 lt!129654 (select (arr!5939 lt!129532) #b00000000000000000000000000000000)))))

(assert (=> b!257788 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 lt!129532)))))

(declare-fun d!61843 () Bool)

(assert (=> d!61843 e!167098))

(declare-fun res!126076 () Bool)

(assert (=> d!61843 (=> (not res!126076) (not e!167098))))

(assert (=> d!61843 (= res!126076 (or (bvsge #b00000000000000000000000000000000 (size!6286 lt!129532)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 lt!129532)))))))

(declare-fun lt!129655 () ListLongMap!3839)

(assert (=> d!61843 (= lt!129654 lt!129655)))

(declare-fun lt!129663 () Unit!8002)

(assert (=> d!61843 (= lt!129663 e!167094)))

(declare-fun c!43636 () Bool)

(assert (=> d!61843 (= c!43636 e!167099)))

(declare-fun res!126080 () Bool)

(assert (=> d!61843 (=> (not res!126080) (not e!167099))))

(assert (=> d!61843 (= res!126080 (bvslt #b00000000000000000000000000000000 (size!6286 lt!129532)))))

(assert (=> d!61843 (= lt!129655 e!167095)))

(assert (=> d!61843 (= c!43632 (and (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61843 (validMask!0 (mask!11043 thiss!1504))))

(assert (=> d!61843 (= (getCurrentListMap!1463 lt!129532 (array!12540 (store (arr!5938 (_values!4736 thiss!1504)) index!297 (ValueCellFull!2955 v!346)) (size!6285 (_values!4736 thiss!1504))) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)) lt!129654)))

(declare-fun bm!24488 () Bool)

(assert (=> bm!24488 (= call!24490 call!24488)))

(assert (= (and d!61843 c!43632) b!257776))

(assert (= (and d!61843 (not c!43632)) b!257782))

(assert (= (and b!257782 c!43635) b!257786))

(assert (= (and b!257782 (not c!43635)) b!257780))

(assert (= (and b!257780 c!43633) b!257771))

(assert (= (and b!257780 (not c!43633)) b!257779))

(assert (= (or b!257771 b!257779) bm!24486))

(assert (= (or b!257786 bm!24486) bm!24488))

(assert (= (or b!257786 b!257771) bm!24490))

(assert (= (or b!257776 bm!24488) bm!24487))

(assert (= (or b!257776 bm!24490) bm!24489))

(assert (= (and d!61843 res!126080) b!257783))

(assert (= (and d!61843 c!43636) b!257787))

(assert (= (and d!61843 (not c!43636)) b!257768))

(assert (= (and d!61843 res!126076) b!257769))

(assert (= (and b!257769 res!126079) b!257784))

(assert (= (and b!257769 (not res!126084)) b!257788))

(assert (= (and b!257788 res!126082) b!257775))

(assert (= (and b!257769 res!126081) b!257778))

(assert (= (and b!257778 c!43637) b!257772))

(assert (= (and b!257778 (not c!43637)) b!257777))

(assert (= (and b!257772 res!126083) b!257770))

(assert (= (or b!257772 b!257777) bm!24491))

(assert (= (and b!257778 res!126077) b!257773))

(assert (= (and b!257773 c!43634) b!257774))

(assert (= (and b!257773 (not c!43634)) b!257785))

(assert (= (and b!257774 res!126078) b!257781))

(assert (= (or b!257774 b!257785) bm!24485))

(declare-fun b_lambda!8187 () Bool)

(assert (=> (not b_lambda!8187) (not b!257775)))

(declare-fun t!8871 () Bool)

(declare-fun tb!3021 () Bool)

(assert (=> (and b!257589 (= (defaultEntry!4753 thiss!1504) (defaultEntry!4753 thiss!1504)) t!8871) tb!3021))

(declare-fun result!5385 () Bool)

(assert (=> tb!3021 (= result!5385 tp_is_empty!6597)))

(assert (=> b!257775 t!8871))

(declare-fun b_and!13809 () Bool)

(assert (= b_and!13805 (and (=> t!8871 result!5385) b_and!13809)))

(declare-fun m!273083 () Bool)

(assert (=> b!257770 m!273083))

(assert (=> b!257783 m!273069))

(assert (=> b!257783 m!273069))

(assert (=> b!257783 m!273071))

(declare-fun m!273085 () Bool)

(assert (=> b!257781 m!273085))

(declare-fun m!273087 () Bool)

(assert (=> bm!24491 m!273087))

(assert (=> d!61843 m!272919))

(declare-fun m!273089 () Bool)

(assert (=> b!257776 m!273089))

(declare-fun m!273091 () Bool)

(assert (=> bm!24489 m!273091))

(declare-fun m!273093 () Bool)

(assert (=> bm!24485 m!273093))

(declare-fun m!273095 () Bool)

(assert (=> bm!24487 m!273095))

(assert (=> b!257775 m!273069))

(declare-fun m!273097 () Bool)

(assert (=> b!257775 m!273097))

(declare-fun m!273099 () Bool)

(assert (=> b!257775 m!273099))

(assert (=> b!257775 m!273069))

(declare-fun m!273101 () Bool)

(assert (=> b!257775 m!273101))

(assert (=> b!257775 m!273101))

(assert (=> b!257775 m!273099))

(declare-fun m!273103 () Bool)

(assert (=> b!257775 m!273103))

(assert (=> b!257788 m!273069))

(assert (=> b!257788 m!273069))

(declare-fun m!273105 () Bool)

(assert (=> b!257788 m!273105))

(assert (=> b!257784 m!273069))

(assert (=> b!257784 m!273069))

(assert (=> b!257784 m!273071))

(declare-fun m!273107 () Bool)

(assert (=> b!257787 m!273107))

(declare-fun m!273109 () Bool)

(assert (=> b!257787 m!273109))

(declare-fun m!273111 () Bool)

(assert (=> b!257787 m!273111))

(declare-fun m!273113 () Bool)

(assert (=> b!257787 m!273113))

(declare-fun m!273115 () Bool)

(assert (=> b!257787 m!273115))

(declare-fun m!273117 () Bool)

(assert (=> b!257787 m!273117))

(assert (=> b!257787 m!273095))

(declare-fun m!273119 () Bool)

(assert (=> b!257787 m!273119))

(declare-fun m!273121 () Bool)

(assert (=> b!257787 m!273121))

(declare-fun m!273123 () Bool)

(assert (=> b!257787 m!273123))

(assert (=> b!257787 m!273115))

(assert (=> b!257787 m!273069))

(declare-fun m!273125 () Bool)

(assert (=> b!257787 m!273125))

(declare-fun m!273127 () Bool)

(assert (=> b!257787 m!273127))

(declare-fun m!273129 () Bool)

(assert (=> b!257787 m!273129))

(assert (=> b!257787 m!273125))

(declare-fun m!273131 () Bool)

(assert (=> b!257787 m!273131))

(assert (=> b!257787 m!273113))

(declare-fun m!273133 () Bool)

(assert (=> b!257787 m!273133))

(assert (=> b!257787 m!273121))

(declare-fun m!273135 () Bool)

(assert (=> b!257787 m!273135))

(assert (=> b!257588 d!61843))

(declare-fun d!61845 () Bool)

(declare-fun e!167108 () Bool)

(assert (=> d!61845 e!167108))

(declare-fun res!126087 () Bool)

(assert (=> d!61845 (=> (not res!126087) (not e!167108))))

(assert (=> d!61845 (= res!126087 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6286 (_keys!6921 thiss!1504)))))))

(declare-fun lt!129675 () Unit!8002)

(declare-fun choose!102 ((_ BitVec 64) array!12541 (_ BitVec 32) (_ BitVec 32)) Unit!8002)

(assert (=> d!61845 (= lt!129675 (choose!102 key!932 (_keys!6921 thiss!1504) index!297 (mask!11043 thiss!1504)))))

(assert (=> d!61845 (validMask!0 (mask!11043 thiss!1504))))

(assert (=> d!61845 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6921 thiss!1504) index!297 (mask!11043 thiss!1504)) lt!129675)))

(declare-fun b!257793 () Bool)

(assert (=> b!257793 (= e!167108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12542 (store (arr!5939 (_keys!6921 thiss!1504)) index!297 key!932) (size!6286 (_keys!6921 thiss!1504))) (mask!11043 thiss!1504)))))

(assert (= (and d!61845 res!126087) b!257793))

(declare-fun m!273137 () Bool)

(assert (=> d!61845 m!273137))

(assert (=> d!61845 m!272919))

(assert (=> b!257793 m!272937))

(declare-fun m!273139 () Bool)

(assert (=> b!257793 m!273139))

(assert (=> b!257588 d!61845))

(declare-fun b!257802 () Bool)

(declare-fun e!167116 () Bool)

(declare-fun e!167117 () Bool)

(assert (=> b!257802 (= e!167116 e!167117)))

(declare-fun lt!129684 () (_ BitVec 64))

(assert (=> b!257802 (= lt!129684 (select (arr!5939 lt!129532) #b00000000000000000000000000000000))))

(declare-fun lt!129683 () Unit!8002)

(assert (=> b!257802 (= lt!129683 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129532 lt!129684 #b00000000000000000000000000000000))))

(assert (=> b!257802 (arrayContainsKey!0 lt!129532 lt!129684 #b00000000000000000000000000000000)))

(declare-fun lt!129682 () Unit!8002)

(assert (=> b!257802 (= lt!129682 lt!129683)))

(declare-fun res!126092 () Bool)

(assert (=> b!257802 (= res!126092 (= (seekEntryOrOpen!0 (select (arr!5939 lt!129532) #b00000000000000000000000000000000) lt!129532 (mask!11043 thiss!1504)) (Found!1171 #b00000000000000000000000000000000)))))

(assert (=> b!257802 (=> (not res!126092) (not e!167117))))

(declare-fun b!257803 () Bool)

(declare-fun call!24497 () Bool)

(assert (=> b!257803 (= e!167116 call!24497)))

(declare-fun bm!24494 () Bool)

(assert (=> bm!24494 (= call!24497 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!129532 (mask!11043 thiss!1504)))))

(declare-fun b!257804 () Bool)

(assert (=> b!257804 (= e!167117 call!24497)))

(declare-fun d!61847 () Bool)

(declare-fun res!126093 () Bool)

(declare-fun e!167115 () Bool)

(assert (=> d!61847 (=> res!126093 e!167115)))

(assert (=> d!61847 (= res!126093 (bvsge #b00000000000000000000000000000000 (size!6286 lt!129532)))))

(assert (=> d!61847 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!129532 (mask!11043 thiss!1504)) e!167115)))

(declare-fun b!257805 () Bool)

(assert (=> b!257805 (= e!167115 e!167116)))

(declare-fun c!43640 () Bool)

(assert (=> b!257805 (= c!43640 (validKeyInArray!0 (select (arr!5939 lt!129532) #b00000000000000000000000000000000)))))

(assert (= (and d!61847 (not res!126093)) b!257805))

(assert (= (and b!257805 c!43640) b!257802))

(assert (= (and b!257805 (not c!43640)) b!257803))

(assert (= (and b!257802 res!126092) b!257804))

(assert (= (or b!257804 b!257803) bm!24494))

(assert (=> b!257802 m!273069))

(declare-fun m!273141 () Bool)

(assert (=> b!257802 m!273141))

(declare-fun m!273143 () Bool)

(assert (=> b!257802 m!273143))

(assert (=> b!257802 m!273069))

(declare-fun m!273145 () Bool)

(assert (=> b!257802 m!273145))

(declare-fun m!273147 () Bool)

(assert (=> bm!24494 m!273147))

(assert (=> b!257805 m!273069))

(assert (=> b!257805 m!273069))

(assert (=> b!257805 m!273071))

(assert (=> b!257588 d!61847))

(declare-fun b!257806 () Bool)

(declare-fun e!167119 () (_ BitVec 32))

(declare-fun e!167118 () (_ BitVec 32))

(assert (=> b!257806 (= e!167119 e!167118)))

(declare-fun c!43642 () Bool)

(assert (=> b!257806 (= c!43642 (validKeyInArray!0 (select (arr!5939 lt!129532) #b00000000000000000000000000000000)))))

(declare-fun bm!24495 () Bool)

(declare-fun call!24498 () (_ BitVec 32))

(assert (=> bm!24495 (= call!24498 (arrayCountValidKeys!0 lt!129532 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 (_keys!6921 thiss!1504))))))

(declare-fun b!257807 () Bool)

(assert (=> b!257807 (= e!167118 call!24498)))

(declare-fun b!257808 () Bool)

(assert (=> b!257808 (= e!167119 #b00000000000000000000000000000000)))

(declare-fun d!61849 () Bool)

(declare-fun lt!129685 () (_ BitVec 32))

(assert (=> d!61849 (and (bvsge lt!129685 #b00000000000000000000000000000000) (bvsle lt!129685 (bvsub (size!6286 lt!129532) #b00000000000000000000000000000000)))))

(assert (=> d!61849 (= lt!129685 e!167119)))

(declare-fun c!43641 () Bool)

(assert (=> d!61849 (= c!43641 (bvsge #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))))))

(assert (=> d!61849 (and (bvsle #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6286 (_keys!6921 thiss!1504)) (size!6286 lt!129532)))))

(assert (=> d!61849 (= (arrayCountValidKeys!0 lt!129532 #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))) lt!129685)))

(declare-fun b!257809 () Bool)

(assert (=> b!257809 (= e!167118 (bvadd #b00000000000000000000000000000001 call!24498))))

(assert (= (and d!61849 c!43641) b!257808))

(assert (= (and d!61849 (not c!43641)) b!257806))

(assert (= (and b!257806 c!43642) b!257809))

(assert (= (and b!257806 (not c!43642)) b!257807))

(assert (= (or b!257809 b!257807) bm!24495))

(assert (=> b!257806 m!273069))

(assert (=> b!257806 m!273069))

(assert (=> b!257806 m!273071))

(declare-fun m!273149 () Bool)

(assert (=> bm!24495 m!273149))

(assert (=> b!257588 d!61849))

(declare-fun d!61851 () Bool)

(assert (=> d!61851 (arrayContainsKey!0 lt!129532 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129688 () Unit!8002)

(declare-fun choose!13 (array!12541 (_ BitVec 64) (_ BitVec 32)) Unit!8002)

(assert (=> d!61851 (= lt!129688 (choose!13 lt!129532 key!932 index!297))))

(assert (=> d!61851 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61851 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!129532 key!932 index!297) lt!129688)))

(declare-fun bs!9085 () Bool)

(assert (= bs!9085 d!61851))

(assert (=> bs!9085 m!272939))

(declare-fun m!273151 () Bool)

(assert (=> bs!9085 m!273151))

(assert (=> b!257588 d!61851))

(declare-fun d!61853 () Bool)

(declare-fun res!126094 () Bool)

(declare-fun e!167120 () Bool)

(assert (=> d!61853 (=> res!126094 e!167120)))

(assert (=> d!61853 (= res!126094 (= (select (arr!5939 lt!129532) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61853 (= (arrayContainsKey!0 lt!129532 key!932 #b00000000000000000000000000000000) e!167120)))

(declare-fun b!257810 () Bool)

(declare-fun e!167121 () Bool)

(assert (=> b!257810 (= e!167120 e!167121)))

(declare-fun res!126095 () Bool)

(assert (=> b!257810 (=> (not res!126095) (not e!167121))))

(assert (=> b!257810 (= res!126095 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6286 lt!129532)))))

(declare-fun b!257811 () Bool)

(assert (=> b!257811 (= e!167121 (arrayContainsKey!0 lt!129532 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61853 (not res!126094)) b!257810))

(assert (= (and b!257810 res!126095) b!257811))

(assert (=> d!61853 m!273069))

(declare-fun m!273153 () Bool)

(assert (=> b!257811 m!273153))

(assert (=> b!257588 d!61853))

(assert (=> bm!24456 d!61841))

(declare-fun d!61855 () Bool)

(declare-fun res!126102 () Bool)

(declare-fun e!167124 () Bool)

(assert (=> d!61855 (=> (not res!126102) (not e!167124))))

(declare-fun simpleValid!277 (LongMapFixedSize!3810) Bool)

(assert (=> d!61855 (= res!126102 (simpleValid!277 thiss!1504))))

(assert (=> d!61855 (= (valid!1489 thiss!1504) e!167124)))

(declare-fun b!257818 () Bool)

(declare-fun res!126103 () Bool)

(assert (=> b!257818 (=> (not res!126103) (not e!167124))))

(assert (=> b!257818 (= res!126103 (= (arrayCountValidKeys!0 (_keys!6921 thiss!1504) #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))) (_size!1954 thiss!1504)))))

(declare-fun b!257819 () Bool)

(declare-fun res!126104 () Bool)

(assert (=> b!257819 (=> (not res!126104) (not e!167124))))

(assert (=> b!257819 (= res!126104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6921 thiss!1504) (mask!11043 thiss!1504)))))

(declare-fun b!257820 () Bool)

(assert (=> b!257820 (= e!167124 (arrayNoDuplicates!0 (_keys!6921 thiss!1504) #b00000000000000000000000000000000 Nil!3803))))

(assert (= (and d!61855 res!126102) b!257818))

(assert (= (and b!257818 res!126103) b!257819))

(assert (= (and b!257819 res!126104) b!257820))

(declare-fun m!273155 () Bool)

(assert (=> d!61855 m!273155))

(assert (=> b!257818 m!272945))

(declare-fun m!273157 () Bool)

(assert (=> b!257819 m!273157))

(declare-fun m!273159 () Bool)

(assert (=> b!257820 m!273159))

(assert (=> start!24608 d!61855))

(declare-fun d!61857 () Bool)

(assert (=> d!61857 (= (array_inv!3925 (_keys!6921 thiss!1504)) (bvsge (size!6286 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257589 d!61857))

(declare-fun d!61859 () Bool)

(assert (=> d!61859 (= (array_inv!3926 (_values!4736 thiss!1504)) (bvsge (size!6285 (_values!4736 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257589 d!61859))

(declare-fun b!257837 () Bool)

(declare-fun e!167134 () Bool)

(declare-fun call!24503 () Bool)

(assert (=> b!257837 (= e!167134 (not call!24503))))

(declare-fun b!257838 () Bool)

(declare-fun lt!129693 () SeekEntryResult!1171)

(assert (=> b!257838 (and (bvsge (index!6854 lt!129693) #b00000000000000000000000000000000) (bvslt (index!6854 lt!129693) (size!6286 (_keys!6921 thiss!1504))))))

(declare-fun res!126115 () Bool)

(assert (=> b!257838 (= res!126115 (= (select (arr!5939 (_keys!6921 thiss!1504)) (index!6854 lt!129693)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257838 (=> (not res!126115) (not e!167134))))

(declare-fun d!61861 () Bool)

(declare-fun e!167136 () Bool)

(assert (=> d!61861 e!167136))

(declare-fun c!43648 () Bool)

(assert (=> d!61861 (= c!43648 ((_ is MissingZero!1171) lt!129693))))

(assert (=> d!61861 (= lt!129693 (seekEntryOrOpen!0 key!932 (_keys!6921 thiss!1504) (mask!11043 thiss!1504)))))

(declare-fun lt!129694 () Unit!8002)

(declare-fun choose!1241 (array!12541 array!12539 (_ BitVec 32) (_ BitVec 32) V!8443 V!8443 (_ BitVec 64) Int) Unit!8002)

(assert (=> d!61861 (= lt!129694 (choose!1241 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) key!932 (defaultEntry!4753 thiss!1504)))))

(assert (=> d!61861 (validMask!0 (mask!11043 thiss!1504))))

(assert (=> d!61861 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!437 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) key!932 (defaultEntry!4753 thiss!1504)) lt!129694)))

(declare-fun b!257839 () Bool)

(declare-fun e!167133 () Bool)

(assert (=> b!257839 (= e!167133 ((_ is Undefined!1171) lt!129693))))

(declare-fun b!257840 () Bool)

(assert (=> b!257840 (= e!167136 e!167134)))

(declare-fun res!126113 () Bool)

(declare-fun call!24504 () Bool)

(assert (=> b!257840 (= res!126113 call!24504)))

(assert (=> b!257840 (=> (not res!126113) (not e!167134))))

(declare-fun bm!24500 () Bool)

(assert (=> bm!24500 (= call!24504 (inRange!0 (ite c!43648 (index!6854 lt!129693) (index!6857 lt!129693)) (mask!11043 thiss!1504)))))

(declare-fun b!257841 () Bool)

(declare-fun e!167135 () Bool)

(assert (=> b!257841 (= e!167135 (not call!24503))))

(declare-fun b!257842 () Bool)

(assert (=> b!257842 (= e!167136 e!167133)))

(declare-fun c!43647 () Bool)

(assert (=> b!257842 (= c!43647 ((_ is MissingVacant!1171) lt!129693))))

(declare-fun b!257843 () Bool)

(declare-fun res!126114 () Bool)

(assert (=> b!257843 (=> (not res!126114) (not e!167135))))

(assert (=> b!257843 (= res!126114 (= (select (arr!5939 (_keys!6921 thiss!1504)) (index!6857 lt!129693)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257843 (and (bvsge (index!6857 lt!129693) #b00000000000000000000000000000000) (bvslt (index!6857 lt!129693) (size!6286 (_keys!6921 thiss!1504))))))

(declare-fun bm!24501 () Bool)

(assert (=> bm!24501 (= call!24503 (arrayContainsKey!0 (_keys!6921 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257844 () Bool)

(declare-fun res!126116 () Bool)

(assert (=> b!257844 (=> (not res!126116) (not e!167135))))

(assert (=> b!257844 (= res!126116 call!24504)))

(assert (=> b!257844 (= e!167133 e!167135)))

(assert (= (and d!61861 c!43648) b!257840))

(assert (= (and d!61861 (not c!43648)) b!257842))

(assert (= (and b!257840 res!126113) b!257838))

(assert (= (and b!257838 res!126115) b!257837))

(assert (= (and b!257842 c!43647) b!257844))

(assert (= (and b!257842 (not c!43647)) b!257839))

(assert (= (and b!257844 res!126116) b!257843))

(assert (= (and b!257843 res!126114) b!257841))

(assert (= (or b!257840 b!257844) bm!24500))

(assert (= (or b!257837 b!257841) bm!24501))

(declare-fun m!273161 () Bool)

(assert (=> b!257843 m!273161))

(declare-fun m!273163 () Bool)

(assert (=> bm!24500 m!273163))

(assert (=> d!61861 m!272905))

(declare-fun m!273165 () Bool)

(assert (=> d!61861 m!273165))

(assert (=> d!61861 m!272919))

(assert (=> bm!24501 m!272903))

(declare-fun m!273167 () Bool)

(assert (=> b!257838 m!273167))

(assert (=> b!257581 d!61861))

(declare-fun d!61863 () Bool)

(assert (=> d!61863 (contains!1875 (getCurrentListMap!1463 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)) key!932)))

(declare-fun lt!129697 () Unit!8002)

(declare-fun choose!1242 (array!12541 array!12539 (_ BitVec 32) (_ BitVec 32) V!8443 V!8443 (_ BitVec 64) (_ BitVec 32) Int) Unit!8002)

(assert (=> d!61863 (= lt!129697 (choose!1242 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(assert (=> d!61863 (validMask!0 (mask!11043 thiss!1504))))

(assert (=> d!61863 (= (lemmaArrayContainsKeyThenInListMap!241 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)) lt!129697)))

(declare-fun bs!9086 () Bool)

(assert (= bs!9086 d!61863))

(assert (=> bs!9086 m!272917))

(assert (=> bs!9086 m!272917))

(declare-fun m!273169 () Bool)

(assert (=> bs!9086 m!273169))

(declare-fun m!273171 () Bool)

(assert (=> bs!9086 m!273171))

(assert (=> bs!9086 m!272919))

(assert (=> b!257582 d!61863))

(declare-fun d!61865 () Bool)

(assert (=> d!61865 (= (inRange!0 (ite c!43596 (index!6854 lt!129529) (index!6857 lt!129529)) (mask!11043 thiss!1504)) (and (bvsge (ite c!43596 (index!6854 lt!129529) (index!6857 lt!129529)) #b00000000000000000000000000000000) (bvslt (ite c!43596 (index!6854 lt!129529) (index!6857 lt!129529)) (bvadd (mask!11043 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24457 d!61865))

(declare-fun d!61867 () Bool)

(assert (=> d!61867 (= (inRange!0 index!297 (mask!11043 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11043 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!257587 d!61867))

(declare-fun d!61869 () Bool)

(declare-fun e!167142 () Bool)

(assert (=> d!61869 e!167142))

(declare-fun res!126119 () Bool)

(assert (=> d!61869 (=> res!126119 e!167142)))

(declare-fun lt!129709 () Bool)

(assert (=> d!61869 (= res!126119 (not lt!129709))))

(declare-fun lt!129707 () Bool)

(assert (=> d!61869 (= lt!129709 lt!129707)))

(declare-fun lt!129706 () Unit!8002)

(declare-fun e!167141 () Unit!8002)

(assert (=> d!61869 (= lt!129706 e!167141)))

(declare-fun c!43651 () Bool)

(assert (=> d!61869 (= c!43651 lt!129707)))

(declare-fun containsKey!304 (List!3805 (_ BitVec 64)) Bool)

(assert (=> d!61869 (= lt!129707 (containsKey!304 (toList!1935 lt!129526) key!932))))

(assert (=> d!61869 (= (contains!1875 lt!129526 key!932) lt!129709)))

(declare-fun b!257851 () Bool)

(declare-fun lt!129708 () Unit!8002)

(assert (=> b!257851 (= e!167141 lt!129708)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!252 (List!3805 (_ BitVec 64)) Unit!8002)

(assert (=> b!257851 (= lt!129708 (lemmaContainsKeyImpliesGetValueByKeyDefined!252 (toList!1935 lt!129526) key!932))))

(declare-fun isDefined!253 (Option!318) Bool)

(assert (=> b!257851 (isDefined!253 (getValueByKey!312 (toList!1935 lt!129526) key!932))))

(declare-fun b!257852 () Bool)

(declare-fun Unit!8012 () Unit!8002)

(assert (=> b!257852 (= e!167141 Unit!8012)))

(declare-fun b!257853 () Bool)

(assert (=> b!257853 (= e!167142 (isDefined!253 (getValueByKey!312 (toList!1935 lt!129526) key!932)))))

(assert (= (and d!61869 c!43651) b!257851))

(assert (= (and d!61869 (not c!43651)) b!257852))

(assert (= (and d!61869 (not res!126119)) b!257853))

(declare-fun m!273173 () Bool)

(assert (=> d!61869 m!273173))

(declare-fun m!273175 () Bool)

(assert (=> b!257851 m!273175))

(declare-fun m!273177 () Bool)

(assert (=> b!257851 m!273177))

(assert (=> b!257851 m!273177))

(declare-fun m!273179 () Bool)

(assert (=> b!257851 m!273179))

(assert (=> b!257853 m!273177))

(assert (=> b!257853 m!273177))

(assert (=> b!257853 m!273179))

(assert (=> b!257587 d!61869))

(declare-fun b!257854 () Bool)

(declare-fun e!167144 () Unit!8002)

(declare-fun Unit!8013 () Unit!8002)

(assert (=> b!257854 (= e!167144 Unit!8013)))

(declare-fun bm!24502 () Bool)

(declare-fun call!24511 () Bool)

(declare-fun lt!129713 () ListLongMap!3839)

(assert (=> bm!24502 (= call!24511 (contains!1875 lt!129713 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24503 () Bool)

(declare-fun call!24506 () ListLongMap!3839)

(declare-fun call!24507 () ListLongMap!3839)

(assert (=> bm!24503 (= call!24506 call!24507)))

(declare-fun b!257855 () Bool)

(declare-fun res!126125 () Bool)

(declare-fun e!167148 () Bool)

(assert (=> b!257855 (=> (not res!126125) (not e!167148))))

(declare-fun e!167151 () Bool)

(assert (=> b!257855 (= res!126125 e!167151)))

(declare-fun res!126128 () Bool)

(assert (=> b!257855 (=> res!126128 e!167151)))

(declare-fun e!167152 () Bool)

(assert (=> b!257855 (= res!126128 (not e!167152))))

(declare-fun res!126123 () Bool)

(assert (=> b!257855 (=> (not res!126123) (not e!167152))))

(assert (=> b!257855 (= res!126123 (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))))))

(declare-fun b!257856 () Bool)

(declare-fun e!167147 () Bool)

(assert (=> b!257856 (= e!167147 (= (apply!254 lt!129713 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4594 thiss!1504)))))

(declare-fun bm!24504 () Bool)

(declare-fun call!24505 () ListLongMap!3839)

(assert (=> bm!24504 (= call!24505 (getCurrentListMapNoExtraKeys!576 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun b!257857 () Bool)

(declare-fun e!167155 () ListLongMap!3839)

(declare-fun call!24509 () ListLongMap!3839)

(assert (=> b!257857 (= e!167155 call!24509)))

(declare-fun b!257858 () Bool)

(declare-fun e!167150 () Bool)

(assert (=> b!257858 (= e!167150 e!167147)))

(declare-fun res!126127 () Bool)

(declare-fun call!24510 () Bool)

(assert (=> b!257858 (= res!126127 call!24510)))

(assert (=> b!257858 (=> (not res!126127) (not e!167147))))

(declare-fun b!257859 () Bool)

(declare-fun e!167154 () Bool)

(assert (=> b!257859 (= e!167148 e!167154)))

(declare-fun c!43654 () Bool)

(assert (=> b!257859 (= c!43654 (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257860 () Bool)

(declare-fun e!167143 () Bool)

(assert (=> b!257860 (= e!167154 e!167143)))

(declare-fun res!126122 () Bool)

(assert (=> b!257860 (= res!126122 call!24511)))

(assert (=> b!257860 (=> (not res!126122) (not e!167143))))

(declare-fun b!257861 () Bool)

(declare-fun e!167146 () Bool)

(assert (=> b!257861 (= e!167146 (= (apply!254 lt!129713 (select (arr!5939 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000)) (get!3053 (select (arr!5938 (_values!4736 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!597 (defaultEntry!4753 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!257861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6285 (_values!4736 thiss!1504))))))

(assert (=> b!257861 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))))))

(declare-fun b!257862 () Bool)

(declare-fun e!167145 () ListLongMap!3839)

(declare-fun call!24508 () ListLongMap!3839)

(assert (=> b!257862 (= e!167145 (+!689 call!24508 (tuple2!4927 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4594 thiss!1504))))))

(declare-fun b!257863 () Bool)

(assert (=> b!257863 (= e!167150 (not call!24510))))

(declare-fun b!257864 () Bool)

(declare-fun res!126121 () Bool)

(assert (=> b!257864 (=> (not res!126121) (not e!167148))))

(assert (=> b!257864 (= res!126121 e!167150)))

(declare-fun c!43657 () Bool)

(assert (=> b!257864 (= c!43657 (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!43652 () Bool)

(declare-fun bm!24506 () Bool)

(declare-fun c!43655 () Bool)

(assert (=> bm!24506 (= call!24508 (+!689 (ite c!43652 call!24505 (ite c!43655 call!24507 call!24506)) (ite (or c!43652 c!43655) (tuple2!4927 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4594 thiss!1504)) (tuple2!4927 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4594 thiss!1504)))))))

(declare-fun b!257865 () Bool)

(assert (=> b!257865 (= e!167155 call!24506)))

(declare-fun b!257866 () Bool)

(declare-fun c!43653 () Bool)

(assert (=> b!257866 (= c!43653 (and (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!167153 () ListLongMap!3839)

(assert (=> b!257866 (= e!167153 e!167155)))

(declare-fun b!257867 () Bool)

(assert (=> b!257867 (= e!167143 (= (apply!254 lt!129713 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4594 thiss!1504)))))

(declare-fun b!257868 () Bool)

(assert (=> b!257868 (= e!167145 e!167153)))

(assert (=> b!257868 (= c!43655 (and (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!257869 () Bool)

(declare-fun e!167149 () Bool)

(assert (=> b!257869 (= e!167149 (validKeyInArray!0 (select (arr!5939 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!257870 () Bool)

(assert (=> b!257870 (= e!167152 (validKeyInArray!0 (select (arr!5939 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24507 () Bool)

(assert (=> bm!24507 (= call!24509 call!24508)))

(declare-fun b!257871 () Bool)

(assert (=> b!257871 (= e!167154 (not call!24511))))

(declare-fun bm!24508 () Bool)

(assert (=> bm!24508 (= call!24510 (contains!1875 lt!129713 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!257872 () Bool)

(assert (=> b!257872 (= e!167153 call!24509)))

(declare-fun b!257873 () Bool)

(declare-fun lt!129711 () Unit!8002)

(assert (=> b!257873 (= e!167144 lt!129711)))

(declare-fun lt!129730 () ListLongMap!3839)

(assert (=> b!257873 (= lt!129730 (getCurrentListMapNoExtraKeys!576 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun lt!129712 () (_ BitVec 64))

(assert (=> b!257873 (= lt!129712 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129715 () (_ BitVec 64))

(assert (=> b!257873 (= lt!129715 (select (arr!5939 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129710 () Unit!8002)

(assert (=> b!257873 (= lt!129710 (addStillContains!230 lt!129730 lt!129712 (zeroValue!4594 thiss!1504) lt!129715))))

(assert (=> b!257873 (contains!1875 (+!689 lt!129730 (tuple2!4927 lt!129712 (zeroValue!4594 thiss!1504))) lt!129715)))

(declare-fun lt!129731 () Unit!8002)

(assert (=> b!257873 (= lt!129731 lt!129710)))

(declare-fun lt!129729 () ListLongMap!3839)

(assert (=> b!257873 (= lt!129729 (getCurrentListMapNoExtraKeys!576 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun lt!129720 () (_ BitVec 64))

(assert (=> b!257873 (= lt!129720 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129723 () (_ BitVec 64))

(assert (=> b!257873 (= lt!129723 (select (arr!5939 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129727 () Unit!8002)

(assert (=> b!257873 (= lt!129727 (addApplyDifferent!230 lt!129729 lt!129720 (minValue!4594 thiss!1504) lt!129723))))

(assert (=> b!257873 (= (apply!254 (+!689 lt!129729 (tuple2!4927 lt!129720 (minValue!4594 thiss!1504))) lt!129723) (apply!254 lt!129729 lt!129723))))

(declare-fun lt!129716 () Unit!8002)

(assert (=> b!257873 (= lt!129716 lt!129727)))

(declare-fun lt!129726 () ListLongMap!3839)

(assert (=> b!257873 (= lt!129726 (getCurrentListMapNoExtraKeys!576 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun lt!129724 () (_ BitVec 64))

(assert (=> b!257873 (= lt!129724 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129725 () (_ BitVec 64))

(assert (=> b!257873 (= lt!129725 (select (arr!5939 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129718 () Unit!8002)

(assert (=> b!257873 (= lt!129718 (addApplyDifferent!230 lt!129726 lt!129724 (zeroValue!4594 thiss!1504) lt!129725))))

(assert (=> b!257873 (= (apply!254 (+!689 lt!129726 (tuple2!4927 lt!129724 (zeroValue!4594 thiss!1504))) lt!129725) (apply!254 lt!129726 lt!129725))))

(declare-fun lt!129728 () Unit!8002)

(assert (=> b!257873 (= lt!129728 lt!129718)))

(declare-fun lt!129717 () ListLongMap!3839)

(assert (=> b!257873 (= lt!129717 (getCurrentListMapNoExtraKeys!576 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)))))

(declare-fun lt!129721 () (_ BitVec 64))

(assert (=> b!257873 (= lt!129721 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129719 () (_ BitVec 64))

(assert (=> b!257873 (= lt!129719 (select (arr!5939 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!257873 (= lt!129711 (addApplyDifferent!230 lt!129717 lt!129721 (minValue!4594 thiss!1504) lt!129719))))

(assert (=> b!257873 (= (apply!254 (+!689 lt!129717 (tuple2!4927 lt!129721 (minValue!4594 thiss!1504))) lt!129719) (apply!254 lt!129717 lt!129719))))

(declare-fun b!257874 () Bool)

(assert (=> b!257874 (= e!167151 e!167146)))

(declare-fun res!126126 () Bool)

(assert (=> b!257874 (=> (not res!126126) (not e!167146))))

(assert (=> b!257874 (= res!126126 (contains!1875 lt!129713 (select (arr!5939 (_keys!6921 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!257874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))))))

(declare-fun d!61871 () Bool)

(assert (=> d!61871 e!167148))

(declare-fun res!126120 () Bool)

(assert (=> d!61871 (=> (not res!126120) (not e!167148))))

(assert (=> d!61871 (= res!126120 (or (bvsge #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))))))))

(declare-fun lt!129714 () ListLongMap!3839)

(assert (=> d!61871 (= lt!129713 lt!129714)))

(declare-fun lt!129722 () Unit!8002)

(assert (=> d!61871 (= lt!129722 e!167144)))

(declare-fun c!43656 () Bool)

(assert (=> d!61871 (= c!43656 e!167149)))

(declare-fun res!126124 () Bool)

(assert (=> d!61871 (=> (not res!126124) (not e!167149))))

(assert (=> d!61871 (= res!126124 (bvslt #b00000000000000000000000000000000 (size!6286 (_keys!6921 thiss!1504))))))

(assert (=> d!61871 (= lt!129714 e!167145)))

(assert (=> d!61871 (= c!43652 (and (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4490 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61871 (validMask!0 (mask!11043 thiss!1504))))

(assert (=> d!61871 (= (getCurrentListMap!1463 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4753 thiss!1504)) lt!129713)))

(declare-fun bm!24505 () Bool)

(assert (=> bm!24505 (= call!24507 call!24505)))

(assert (= (and d!61871 c!43652) b!257862))

(assert (= (and d!61871 (not c!43652)) b!257868))

(assert (= (and b!257868 c!43655) b!257872))

(assert (= (and b!257868 (not c!43655)) b!257866))

(assert (= (and b!257866 c!43653) b!257857))

(assert (= (and b!257866 (not c!43653)) b!257865))

(assert (= (or b!257857 b!257865) bm!24503))

(assert (= (or b!257872 bm!24503) bm!24505))

(assert (= (or b!257872 b!257857) bm!24507))

(assert (= (or b!257862 bm!24505) bm!24504))

(assert (= (or b!257862 bm!24507) bm!24506))

(assert (= (and d!61871 res!126124) b!257869))

(assert (= (and d!61871 c!43656) b!257873))

(assert (= (and d!61871 (not c!43656)) b!257854))

(assert (= (and d!61871 res!126120) b!257855))

(assert (= (and b!257855 res!126123) b!257870))

(assert (= (and b!257855 (not res!126128)) b!257874))

(assert (= (and b!257874 res!126126) b!257861))

(assert (= (and b!257855 res!126125) b!257864))

(assert (= (and b!257864 c!43657) b!257858))

(assert (= (and b!257864 (not c!43657)) b!257863))

(assert (= (and b!257858 res!126127) b!257856))

(assert (= (or b!257858 b!257863) bm!24508))

(assert (= (and b!257864 res!126121) b!257859))

(assert (= (and b!257859 c!43654) b!257860))

(assert (= (and b!257859 (not c!43654)) b!257871))

(assert (= (and b!257860 res!126122) b!257867))

(assert (= (or b!257860 b!257871) bm!24502))

(declare-fun b_lambda!8189 () Bool)

(assert (=> (not b_lambda!8189) (not b!257861)))

(assert (=> b!257861 t!8871))

(declare-fun b_and!13811 () Bool)

(assert (= b_and!13809 (and (=> t!8871 result!5385) b_and!13811)))

(declare-fun m!273181 () Bool)

(assert (=> b!257856 m!273181))

(assert (=> b!257869 m!273043))

(assert (=> b!257869 m!273043))

(assert (=> b!257869 m!273045))

(declare-fun m!273183 () Bool)

(assert (=> b!257867 m!273183))

(declare-fun m!273185 () Bool)

(assert (=> bm!24508 m!273185))

(assert (=> d!61871 m!272919))

(declare-fun m!273187 () Bool)

(assert (=> b!257862 m!273187))

(declare-fun m!273189 () Bool)

(assert (=> bm!24506 m!273189))

(declare-fun m!273191 () Bool)

(assert (=> bm!24502 m!273191))

(declare-fun m!273193 () Bool)

(assert (=> bm!24504 m!273193))

(assert (=> b!257861 m!273043))

(declare-fun m!273195 () Bool)

(assert (=> b!257861 m!273195))

(assert (=> b!257861 m!273099))

(assert (=> b!257861 m!273043))

(declare-fun m!273197 () Bool)

(assert (=> b!257861 m!273197))

(assert (=> b!257861 m!273197))

(assert (=> b!257861 m!273099))

(declare-fun m!273199 () Bool)

(assert (=> b!257861 m!273199))

(assert (=> b!257874 m!273043))

(assert (=> b!257874 m!273043))

(declare-fun m!273201 () Bool)

(assert (=> b!257874 m!273201))

(assert (=> b!257870 m!273043))

(assert (=> b!257870 m!273043))

(assert (=> b!257870 m!273045))

(declare-fun m!273203 () Bool)

(assert (=> b!257873 m!273203))

(declare-fun m!273205 () Bool)

(assert (=> b!257873 m!273205))

(declare-fun m!273207 () Bool)

(assert (=> b!257873 m!273207))

(declare-fun m!273209 () Bool)

(assert (=> b!257873 m!273209))

(declare-fun m!273211 () Bool)

(assert (=> b!257873 m!273211))

(declare-fun m!273213 () Bool)

(assert (=> b!257873 m!273213))

(assert (=> b!257873 m!273193))

(declare-fun m!273215 () Bool)

(assert (=> b!257873 m!273215))

(declare-fun m!273217 () Bool)

(assert (=> b!257873 m!273217))

(declare-fun m!273219 () Bool)

(assert (=> b!257873 m!273219))

(assert (=> b!257873 m!273211))

(assert (=> b!257873 m!273043))

(declare-fun m!273221 () Bool)

(assert (=> b!257873 m!273221))

(declare-fun m!273223 () Bool)

(assert (=> b!257873 m!273223))

(declare-fun m!273225 () Bool)

(assert (=> b!257873 m!273225))

(assert (=> b!257873 m!273221))

(declare-fun m!273227 () Bool)

(assert (=> b!257873 m!273227))

(assert (=> b!257873 m!273209))

(declare-fun m!273229 () Bool)

(assert (=> b!257873 m!273229))

(assert (=> b!257873 m!273217))

(declare-fun m!273231 () Bool)

(assert (=> b!257873 m!273231))

(assert (=> b!257587 d!61871))

(declare-fun d!61873 () Bool)

(declare-fun e!167158 () Bool)

(assert (=> d!61873 e!167158))

(declare-fun res!126134 () Bool)

(assert (=> d!61873 (=> (not res!126134) (not e!167158))))

(declare-fun lt!129736 () SeekEntryResult!1171)

(assert (=> d!61873 (= res!126134 ((_ is Found!1171) lt!129736))))

(assert (=> d!61873 (= lt!129736 (seekEntryOrOpen!0 key!932 (_keys!6921 thiss!1504) (mask!11043 thiss!1504)))))

(declare-fun lt!129737 () Unit!8002)

(declare-fun choose!1243 (array!12541 array!12539 (_ BitVec 32) (_ BitVec 32) V!8443 V!8443 (_ BitVec 64) Int) Unit!8002)

(assert (=> d!61873 (= lt!129737 (choose!1243 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) key!932 (defaultEntry!4753 thiss!1504)))))

(assert (=> d!61873 (validMask!0 (mask!11043 thiss!1504))))

(assert (=> d!61873 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!434 (_keys!6921 thiss!1504) (_values!4736 thiss!1504) (mask!11043 thiss!1504) (extraKeys!4490 thiss!1504) (zeroValue!4594 thiss!1504) (minValue!4594 thiss!1504) key!932 (defaultEntry!4753 thiss!1504)) lt!129737)))

(declare-fun b!257879 () Bool)

(declare-fun res!126133 () Bool)

(assert (=> b!257879 (=> (not res!126133) (not e!167158))))

(assert (=> b!257879 (= res!126133 (inRange!0 (index!6855 lt!129736) (mask!11043 thiss!1504)))))

(declare-fun b!257880 () Bool)

(assert (=> b!257880 (= e!167158 (= (select (arr!5939 (_keys!6921 thiss!1504)) (index!6855 lt!129736)) key!932))))

(assert (=> b!257880 (and (bvsge (index!6855 lt!129736) #b00000000000000000000000000000000) (bvslt (index!6855 lt!129736) (size!6286 (_keys!6921 thiss!1504))))))

(assert (= (and d!61873 res!126134) b!257879))

(assert (= (and b!257879 res!126133) b!257880))

(assert (=> d!61873 m!272905))

(declare-fun m!273233 () Bool)

(assert (=> d!61873 m!273233))

(assert (=> d!61873 m!272919))

(declare-fun m!273235 () Bool)

(assert (=> b!257879 m!273235))

(declare-fun m!273237 () Bool)

(assert (=> b!257880 m!273237))

(assert (=> b!257597 d!61873))

(declare-fun b!257893 () Bool)

(declare-fun e!167167 () SeekEntryResult!1171)

(assert (=> b!257893 (= e!167167 Undefined!1171)))

(declare-fun b!257894 () Bool)

(declare-fun c!43665 () Bool)

(declare-fun lt!129745 () (_ BitVec 64))

(assert (=> b!257894 (= c!43665 (= lt!129745 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!167165 () SeekEntryResult!1171)

(declare-fun e!167166 () SeekEntryResult!1171)

(assert (=> b!257894 (= e!167165 e!167166)))

(declare-fun b!257895 () Bool)

(declare-fun lt!129746 () SeekEntryResult!1171)

(assert (=> b!257895 (= e!167166 (MissingZero!1171 (index!6856 lt!129746)))))

(declare-fun b!257897 () Bool)

(assert (=> b!257897 (= e!167165 (Found!1171 (index!6856 lt!129746)))))

(declare-fun b!257898 () Bool)

(assert (=> b!257898 (= e!167167 e!167165)))

(assert (=> b!257898 (= lt!129745 (select (arr!5939 (_keys!6921 thiss!1504)) (index!6856 lt!129746)))))

(declare-fun c!43664 () Bool)

(assert (=> b!257898 (= c!43664 (= lt!129745 key!932))))

(declare-fun b!257896 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12541 (_ BitVec 32)) SeekEntryResult!1171)

(assert (=> b!257896 (= e!167166 (seekKeyOrZeroReturnVacant!0 (x!25021 lt!129746) (index!6856 lt!129746) (index!6856 lt!129746) key!932 (_keys!6921 thiss!1504) (mask!11043 thiss!1504)))))

(declare-fun d!61875 () Bool)

(declare-fun lt!129744 () SeekEntryResult!1171)

(assert (=> d!61875 (and (or ((_ is Undefined!1171) lt!129744) (not ((_ is Found!1171) lt!129744)) (and (bvsge (index!6855 lt!129744) #b00000000000000000000000000000000) (bvslt (index!6855 lt!129744) (size!6286 (_keys!6921 thiss!1504))))) (or ((_ is Undefined!1171) lt!129744) ((_ is Found!1171) lt!129744) (not ((_ is MissingZero!1171) lt!129744)) (and (bvsge (index!6854 lt!129744) #b00000000000000000000000000000000) (bvslt (index!6854 lt!129744) (size!6286 (_keys!6921 thiss!1504))))) (or ((_ is Undefined!1171) lt!129744) ((_ is Found!1171) lt!129744) ((_ is MissingZero!1171) lt!129744) (not ((_ is MissingVacant!1171) lt!129744)) (and (bvsge (index!6857 lt!129744) #b00000000000000000000000000000000) (bvslt (index!6857 lt!129744) (size!6286 (_keys!6921 thiss!1504))))) (or ((_ is Undefined!1171) lt!129744) (ite ((_ is Found!1171) lt!129744) (= (select (arr!5939 (_keys!6921 thiss!1504)) (index!6855 lt!129744)) key!932) (ite ((_ is MissingZero!1171) lt!129744) (= (select (arr!5939 (_keys!6921 thiss!1504)) (index!6854 lt!129744)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1171) lt!129744) (= (select (arr!5939 (_keys!6921 thiss!1504)) (index!6857 lt!129744)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61875 (= lt!129744 e!167167)))

(declare-fun c!43666 () Bool)

(assert (=> d!61875 (= c!43666 (and ((_ is Intermediate!1171) lt!129746) (undefined!1983 lt!129746)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12541 (_ BitVec 32)) SeekEntryResult!1171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61875 (= lt!129746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11043 thiss!1504)) key!932 (_keys!6921 thiss!1504) (mask!11043 thiss!1504)))))

(assert (=> d!61875 (validMask!0 (mask!11043 thiss!1504))))

(assert (=> d!61875 (= (seekEntryOrOpen!0 key!932 (_keys!6921 thiss!1504) (mask!11043 thiss!1504)) lt!129744)))

(assert (= (and d!61875 c!43666) b!257893))

(assert (= (and d!61875 (not c!43666)) b!257898))

(assert (= (and b!257898 c!43664) b!257897))

(assert (= (and b!257898 (not c!43664)) b!257894))

(assert (= (and b!257894 c!43665) b!257895))

(assert (= (and b!257894 (not c!43665)) b!257896))

(declare-fun m!273239 () Bool)

(assert (=> b!257898 m!273239))

(declare-fun m!273241 () Bool)

(assert (=> b!257896 m!273241))

(declare-fun m!273243 () Bool)

(assert (=> d!61875 m!273243))

(declare-fun m!273245 () Bool)

(assert (=> d!61875 m!273245))

(assert (=> d!61875 m!272919))

(declare-fun m!273247 () Bool)

(assert (=> d!61875 m!273247))

(declare-fun m!273249 () Bool)

(assert (=> d!61875 m!273249))

(declare-fun m!273251 () Bool)

(assert (=> d!61875 m!273251))

(assert (=> d!61875 m!273247))

(assert (=> b!257584 d!61875))

(declare-fun b!257906 () Bool)

(declare-fun e!167173 () Bool)

(assert (=> b!257906 (= e!167173 tp_is_empty!6597)))

(declare-fun mapNonEmpty!11238 () Bool)

(declare-fun mapRes!11238 () Bool)

(declare-fun tp!23523 () Bool)

(declare-fun e!167172 () Bool)

(assert (=> mapNonEmpty!11238 (= mapRes!11238 (and tp!23523 e!167172))))

(declare-fun mapKey!11238 () (_ BitVec 32))

(declare-fun mapRest!11238 () (Array (_ BitVec 32) ValueCell!2955))

(declare-fun mapValue!11238 () ValueCell!2955)

(assert (=> mapNonEmpty!11238 (= mapRest!11232 (store mapRest!11238 mapKey!11238 mapValue!11238))))

(declare-fun mapIsEmpty!11238 () Bool)

(assert (=> mapIsEmpty!11238 mapRes!11238))

(declare-fun condMapEmpty!11238 () Bool)

(declare-fun mapDefault!11238 () ValueCell!2955)

(assert (=> mapNonEmpty!11232 (= condMapEmpty!11238 (= mapRest!11232 ((as const (Array (_ BitVec 32) ValueCell!2955)) mapDefault!11238)))))

(assert (=> mapNonEmpty!11232 (= tp!23514 (and e!167173 mapRes!11238))))

(declare-fun b!257905 () Bool)

(assert (=> b!257905 (= e!167172 tp_is_empty!6597)))

(assert (= (and mapNonEmpty!11232 condMapEmpty!11238) mapIsEmpty!11238))

(assert (= (and mapNonEmpty!11232 (not condMapEmpty!11238)) mapNonEmpty!11238))

(assert (= (and mapNonEmpty!11238 ((_ is ValueCellFull!2955) mapValue!11238)) b!257905))

(assert (= (and mapNonEmpty!11232 ((_ is ValueCellFull!2955) mapDefault!11238)) b!257906))

(declare-fun m!273253 () Bool)

(assert (=> mapNonEmpty!11238 m!273253))

(declare-fun b_lambda!8191 () Bool)

(assert (= b_lambda!8187 (or (and b!257589 b_free!6735) b_lambda!8191)))

(declare-fun b_lambda!8193 () Bool)

(assert (= b_lambda!8189 (or (and b!257589 b_free!6735) b_lambda!8193)))

(check-sat (not d!61855) (not mapNonEmpty!11238) (not b!257691) (not b!257869) (not b_lambda!8191) b_and!13811 (not bm!24494) (not b!257692) (not b!257862) (not b!257805) (not d!61845) (not b!257867) (not bm!24470) (not b!257802) (not bm!24466) (not d!61843) (not b!257793) (not d!61871) (not b!257879) (not b!257675) (not b!257725) (not b!257853) (not bm!24506) (not b!257685) (not bm!24495) (not b!257667) (not b!257783) (not bm!24485) (not b!257775) (not b!257818) (not bm!24508) (not b!257668) (not b!257716) (not b!257784) (not b!257819) (not b!257861) (not b!257896) (not bm!24489) (not b!257670) (not d!61835) (not d!61823) (not d!61869) (not b!257700) (not d!61839) (not d!61825) (not b!257714) (not d!61861) (not b!257851) (not bm!24500) (not bm!24487) (not b!257788) (not d!61875) (not d!61851) (not d!61863) (not b!257820) (not b!257870) (not b!257712) (not b_lambda!8193) (not b!257781) (not b!257811) (not b!257770) (not b!257873) (not bm!24501) (not b!257776) (not d!61829) (not b_next!6735) (not b!257806) (not bm!24467) (not b!257787) (not b!257856) (not bm!24491) tp_is_empty!6597 (not bm!24504) (not b!257874) (not b!257719) (not b!257701) (not bm!24502) (not d!61873))
(check-sat b_and!13811 (not b_next!6735))
