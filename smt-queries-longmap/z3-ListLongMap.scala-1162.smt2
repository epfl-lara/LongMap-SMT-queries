; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24512 () Bool)

(assert start!24512)

(declare-fun b!256734 () Bool)

(declare-fun b_free!6723 () Bool)

(declare-fun b_next!6723 () Bool)

(assert (=> b!256734 (= b_free!6723 (not b_next!6723))))

(declare-fun tp!23471 () Bool)

(declare-fun b_and!13785 () Bool)

(assert (=> b!256734 (= tp!23471 b_and!13785)))

(declare-fun b!256725 () Bool)

(declare-fun e!166422 () Bool)

(declare-fun tp_is_empty!6585 () Bool)

(assert (=> b!256725 (= e!166422 tp_is_empty!6585)))

(declare-fun b!256727 () Bool)

(declare-datatypes ((Unit!7968 0))(
  ( (Unit!7969) )
))
(declare-fun e!166415 () Unit!7968)

(declare-fun Unit!7970 () Unit!7968)

(assert (=> b!256727 (= e!166415 Unit!7970)))

(declare-fun lt!128946 () Unit!7968)

(declare-datatypes ((V!8427 0))(
  ( (V!8428 (val!3337 Int)) )
))
(declare-datatypes ((ValueCell!2949 0))(
  ( (ValueCellFull!2949 (v!5426 V!8427)) (EmptyCell!2949) )
))
(declare-datatypes ((array!12511 0))(
  ( (array!12512 (arr!5926 (Array (_ BitVec 32) ValueCell!2949)) (size!6273 (_ BitVec 32))) )
))
(declare-datatypes ((array!12513 0))(
  ( (array!12514 (arr!5927 (Array (_ BitVec 32) (_ BitVec 64))) (size!6274 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3798 0))(
  ( (LongMapFixedSize!3799 (defaultEntry!4737 Int) (mask!11015 (_ BitVec 32)) (extraKeys!4474 (_ BitVec 32)) (zeroValue!4578 V!8427) (minValue!4578 V!8427) (_size!1948 (_ BitVec 32)) (_keys!6901 array!12513) (_values!4720 array!12511) (_vacant!1948 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3798)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!235 (array!12513 array!12511 (_ BitVec 32) (_ BitVec 32) V!8427 V!8427 (_ BitVec 64) (_ BitVec 32) Int) Unit!7968)

(assert (=> b!256727 (= lt!128946 (lemmaArrayContainsKeyThenInListMap!235 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(assert (=> b!256727 false))

(declare-fun b!256728 () Bool)

(declare-fun res!125595 () Bool)

(declare-fun e!166420 () Bool)

(assert (=> b!256728 (=> (not res!125595) (not e!166420))))

(declare-fun call!24335 () Bool)

(assert (=> b!256728 (= res!125595 call!24335)))

(declare-fun e!166427 () Bool)

(assert (=> b!256728 (= e!166427 e!166420)))

(declare-fun b!256729 () Bool)

(declare-fun e!166417 () Bool)

(declare-fun call!24334 () Bool)

(assert (=> b!256729 (= e!166417 (not call!24334))))

(declare-fun b!256730 () Bool)

(declare-fun e!166423 () Unit!7968)

(declare-fun Unit!7971 () Unit!7968)

(assert (=> b!256730 (= e!166423 Unit!7971)))

(declare-fun lt!128953 () Unit!7968)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!429 (array!12513 array!12511 (_ BitVec 32) (_ BitVec 32) V!8427 V!8427 (_ BitVec 64) Int) Unit!7968)

(assert (=> b!256730 (= lt!128953 (lemmaInListMapThenSeekEntryOrOpenFindsIt!429 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) key!932 (defaultEntry!4737 thiss!1504)))))

(assert (=> b!256730 false))

(declare-fun b!256731 () Bool)

(declare-fun res!125597 () Bool)

(declare-fun e!166424 () Bool)

(assert (=> b!256731 (=> (not res!125597) (not e!166424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!256731 (= res!125597 (validKeyInArray!0 key!932))))

(declare-fun b!256732 () Bool)

(declare-fun Unit!7972 () Unit!7968)

(assert (=> b!256732 (= e!166415 Unit!7972)))

(declare-fun b!256733 () Bool)

(declare-fun e!166419 () Bool)

(declare-fun e!166416 () Bool)

(declare-fun mapRes!11208 () Bool)

(assert (=> b!256733 (= e!166419 (and e!166416 mapRes!11208))))

(declare-fun condMapEmpty!11208 () Bool)

(declare-fun mapDefault!11208 () ValueCell!2949)

(assert (=> b!256733 (= condMapEmpty!11208 (= (arr!5926 (_values!4720 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2949)) mapDefault!11208)))))

(declare-fun e!166425 () Bool)

(declare-fun array_inv!3917 (array!12513) Bool)

(declare-fun array_inv!3918 (array!12511) Bool)

(assert (=> b!256734 (= e!166425 (and tp!23471 tp_is_empty!6585 (array_inv!3917 (_keys!6901 thiss!1504)) (array_inv!3918 (_values!4720 thiss!1504)) e!166419))))

(declare-fun b!256735 () Bool)

(declare-fun e!166426 () Bool)

(declare-fun e!166418 () Bool)

(assert (=> b!256735 (= e!166426 e!166418)))

(declare-fun res!125599 () Bool)

(assert (=> b!256735 (=> (not res!125599) (not e!166418))))

(declare-datatypes ((SeekEntryResult!1165 0))(
  ( (MissingZero!1165 (index!6830 (_ BitVec 32))) (Found!1165 (index!6831 (_ BitVec 32))) (Intermediate!1165 (undefined!1977 Bool) (index!6832 (_ BitVec 32)) (x!24979 (_ BitVec 32))) (Undefined!1165) (MissingVacant!1165 (index!6833 (_ BitVec 32))) )
))
(declare-fun lt!128955 () SeekEntryResult!1165)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!256735 (= res!125599 (or (= lt!128955 (MissingZero!1165 index!297)) (= lt!128955 (MissingVacant!1165 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12513 (_ BitVec 32)) SeekEntryResult!1165)

(assert (=> b!256735 (= lt!128955 (seekEntryOrOpen!0 key!932 (_keys!6901 thiss!1504) (mask!11015 thiss!1504)))))

(declare-fun b!256736 () Bool)

(assert (=> b!256736 (= e!166424 (bvslt (size!6274 (_keys!6901 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!256737 () Bool)

(declare-fun e!166421 () Bool)

(assert (=> b!256737 (= e!166421 e!166417)))

(declare-fun res!125600 () Bool)

(assert (=> b!256737 (= res!125600 call!24335)))

(assert (=> b!256737 (=> (not res!125600) (not e!166417))))

(declare-fun b!256738 () Bool)

(assert (=> b!256738 (= e!166416 tp_is_empty!6585)))

(declare-fun b!256739 () Bool)

(get-info :version)

(assert (=> b!256739 (= e!166421 ((_ is Undefined!1165) lt!128955))))

(declare-fun bm!24331 () Bool)

(declare-fun c!43407 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24331 (= call!24335 (inRange!0 (ite c!43407 (index!6830 lt!128955) (index!6833 lt!128955)) (mask!11015 thiss!1504)))))

(declare-fun b!256740 () Bool)

(assert (=> b!256740 (= e!166420 (not call!24334))))

(declare-fun b!256741 () Bool)

(declare-fun c!43410 () Bool)

(assert (=> b!256741 (= c!43410 ((_ is MissingVacant!1165) lt!128955))))

(assert (=> b!256741 (= e!166427 e!166421)))

(declare-fun res!125594 () Bool)

(assert (=> start!24512 (=> (not res!125594) (not e!166426))))

(declare-fun valid!1484 (LongMapFixedSize!3798) Bool)

(assert (=> start!24512 (= res!125594 (valid!1484 thiss!1504))))

(assert (=> start!24512 e!166426))

(assert (=> start!24512 e!166425))

(assert (=> start!24512 true))

(assert (=> start!24512 tp_is_empty!6585))

(declare-fun b!256726 () Bool)

(declare-fun res!125593 () Bool)

(assert (=> b!256726 (= res!125593 (= (select (arr!5927 (_keys!6901 thiss!1504)) (index!6833 lt!128955)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256726 (=> (not res!125593) (not e!166417))))

(declare-fun bm!24332 () Bool)

(declare-fun arrayContainsKey!0 (array!12513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24332 (= call!24334 (arrayContainsKey!0 (_keys!6901 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256742 () Bool)

(declare-fun res!125592 () Bool)

(assert (=> b!256742 (=> (not res!125592) (not e!166426))))

(assert (=> b!256742 (= res!125592 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!11208 () Bool)

(declare-fun tp!23472 () Bool)

(assert (=> mapNonEmpty!11208 (= mapRes!11208 (and tp!23472 e!166422))))

(declare-fun mapRest!11208 () (Array (_ BitVec 32) ValueCell!2949))

(declare-fun mapKey!11208 () (_ BitVec 32))

(declare-fun mapValue!11208 () ValueCell!2949)

(assert (=> mapNonEmpty!11208 (= (arr!5926 (_values!4720 thiss!1504)) (store mapRest!11208 mapKey!11208 mapValue!11208))))

(declare-fun b!256743 () Bool)

(declare-fun e!166414 () Bool)

(assert (=> b!256743 (= e!166418 e!166414)))

(declare-fun res!125598 () Bool)

(assert (=> b!256743 (=> (not res!125598) (not e!166414))))

(assert (=> b!256743 (= res!125598 (inRange!0 index!297 (mask!11015 thiss!1504)))))

(declare-fun lt!128948 () Unit!7968)

(assert (=> b!256743 (= lt!128948 e!166423)))

(declare-fun c!43409 () Bool)

(declare-datatypes ((tuple2!4914 0))(
  ( (tuple2!4915 (_1!2468 (_ BitVec 64)) (_2!2468 V!8427)) )
))
(declare-datatypes ((List!3793 0))(
  ( (Nil!3790) (Cons!3789 (h!4451 tuple2!4914) (t!8850 List!3793)) )
))
(declare-datatypes ((ListLongMap!3827 0))(
  ( (ListLongMap!3828 (toList!1929 List!3793)) )
))
(declare-fun lt!128952 () ListLongMap!3827)

(declare-fun contains!1868 (ListLongMap!3827 (_ BitVec 64)) Bool)

(assert (=> b!256743 (= c!43409 (contains!1868 lt!128952 key!932))))

(declare-fun getCurrentListMap!1457 (array!12513 array!12511 (_ BitVec 32) (_ BitVec 32) V!8427 V!8427 (_ BitVec 32) Int) ListLongMap!3827)

(assert (=> b!256743 (= lt!128952 (getCurrentListMap!1457 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun b!256744 () Bool)

(declare-fun res!125596 () Bool)

(assert (=> b!256744 (=> (not res!125596) (not e!166420))))

(assert (=> b!256744 (= res!125596 (= (select (arr!5927 (_keys!6901 thiss!1504)) (index!6830 lt!128955)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256745 () Bool)

(declare-fun lt!128944 () Unit!7968)

(assert (=> b!256745 (= e!166423 lt!128944)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!432 (array!12513 array!12511 (_ BitVec 32) (_ BitVec 32) V!8427 V!8427 (_ BitVec 64) Int) Unit!7968)

(assert (=> b!256745 (= lt!128944 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!432 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) key!932 (defaultEntry!4737 thiss!1504)))))

(assert (=> b!256745 (= c!43407 ((_ is MissingZero!1165) lt!128955))))

(assert (=> b!256745 e!166427))

(declare-fun b!256746 () Bool)

(assert (=> b!256746 (= e!166414 (not e!166424))))

(declare-fun res!125591 () Bool)

(assert (=> b!256746 (=> (not res!125591) (not e!166424))))

(assert (=> b!256746 (= res!125591 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6901 thiss!1504)))))))

(declare-fun lt!128951 () array!12513)

(assert (=> b!256746 (arrayContainsKey!0 lt!128951 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!128943 () Unit!7968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12513 (_ BitVec 64) (_ BitVec 32)) Unit!7968)

(assert (=> b!256746 (= lt!128943 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128951 key!932 index!297))))

(declare-fun v!346 () V!8427)

(declare-fun +!683 (ListLongMap!3827 tuple2!4914) ListLongMap!3827)

(assert (=> b!256746 (= (+!683 lt!128952 (tuple2!4915 key!932 v!346)) (getCurrentListMap!1457 lt!128951 (array!12512 (store (arr!5926 (_values!4720 thiss!1504)) index!297 (ValueCellFull!2949 v!346)) (size!6273 (_values!4720 thiss!1504))) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun lt!128945 () Unit!7968)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!93 (array!12513 array!12511 (_ BitVec 32) (_ BitVec 32) V!8427 V!8427 (_ BitVec 32) (_ BitVec 64) V!8427 Int) Unit!7968)

(assert (=> b!256746 (= lt!128945 (lemmaAddValidKeyToArrayThenAddPairToListMap!93 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) index!297 key!932 v!346 (defaultEntry!4737 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12513 (_ BitVec 32)) Bool)

(assert (=> b!256746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128951 (mask!11015 thiss!1504))))

(declare-fun lt!128949 () Unit!7968)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12513 (_ BitVec 32) (_ BitVec 32)) Unit!7968)

(assert (=> b!256746 (= lt!128949 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6901 thiss!1504) index!297 (mask!11015 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12513 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!256746 (= (arrayCountValidKeys!0 lt!128951 #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6901 thiss!1504) #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504)))))))

(declare-fun lt!128950 () Unit!7968)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12513 (_ BitVec 32) (_ BitVec 64)) Unit!7968)

(assert (=> b!256746 (= lt!128950 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6901 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3794 0))(
  ( (Nil!3791) (Cons!3790 (h!4452 (_ BitVec 64)) (t!8851 List!3794)) )
))
(declare-fun arrayNoDuplicates!0 (array!12513 (_ BitVec 32) List!3794) Bool)

(assert (=> b!256746 (arrayNoDuplicates!0 lt!128951 #b00000000000000000000000000000000 Nil!3791)))

(assert (=> b!256746 (= lt!128951 (array!12514 (store (arr!5927 (_keys!6901 thiss!1504)) index!297 key!932) (size!6274 (_keys!6901 thiss!1504))))))

(declare-fun lt!128947 () Unit!7968)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12513 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3794) Unit!7968)

(assert (=> b!256746 (= lt!128947 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6901 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3791))))

(declare-fun lt!128954 () Unit!7968)

(assert (=> b!256746 (= lt!128954 e!166415)))

(declare-fun c!43408 () Bool)

(assert (=> b!256746 (= c!43408 (arrayContainsKey!0 (_keys!6901 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11208 () Bool)

(assert (=> mapIsEmpty!11208 mapRes!11208))

(assert (= (and start!24512 res!125594) b!256742))

(assert (= (and b!256742 res!125592) b!256735))

(assert (= (and b!256735 res!125599) b!256743))

(assert (= (and b!256743 c!43409) b!256730))

(assert (= (and b!256743 (not c!43409)) b!256745))

(assert (= (and b!256745 c!43407) b!256728))

(assert (= (and b!256745 (not c!43407)) b!256741))

(assert (= (and b!256728 res!125595) b!256744))

(assert (= (and b!256744 res!125596) b!256740))

(assert (= (and b!256741 c!43410) b!256737))

(assert (= (and b!256741 (not c!43410)) b!256739))

(assert (= (and b!256737 res!125600) b!256726))

(assert (= (and b!256726 res!125593) b!256729))

(assert (= (or b!256728 b!256737) bm!24331))

(assert (= (or b!256740 b!256729) bm!24332))

(assert (= (and b!256743 res!125598) b!256746))

(assert (= (and b!256746 c!43408) b!256727))

(assert (= (and b!256746 (not c!43408)) b!256732))

(assert (= (and b!256746 res!125591) b!256731))

(assert (= (and b!256731 res!125597) b!256736))

(assert (= (and b!256733 condMapEmpty!11208) mapIsEmpty!11208))

(assert (= (and b!256733 (not condMapEmpty!11208)) mapNonEmpty!11208))

(assert (= (and mapNonEmpty!11208 ((_ is ValueCellFull!2949) mapValue!11208)) b!256725))

(assert (= (and b!256733 ((_ is ValueCellFull!2949) mapDefault!11208)) b!256738))

(assert (= b!256734 b!256733))

(assert (= start!24512 b!256734))

(declare-fun m!272075 () Bool)

(assert (=> b!256735 m!272075))

(declare-fun m!272077 () Bool)

(assert (=> bm!24331 m!272077))

(declare-fun m!272079 () Bool)

(assert (=> b!256745 m!272079))

(declare-fun m!272081 () Bool)

(assert (=> b!256744 m!272081))

(declare-fun m!272083 () Bool)

(assert (=> b!256731 m!272083))

(declare-fun m!272085 () Bool)

(assert (=> b!256746 m!272085))

(declare-fun m!272087 () Bool)

(assert (=> b!256746 m!272087))

(declare-fun m!272089 () Bool)

(assert (=> b!256746 m!272089))

(declare-fun m!272091 () Bool)

(assert (=> b!256746 m!272091))

(declare-fun m!272093 () Bool)

(assert (=> b!256746 m!272093))

(declare-fun m!272095 () Bool)

(assert (=> b!256746 m!272095))

(declare-fun m!272097 () Bool)

(assert (=> b!256746 m!272097))

(declare-fun m!272099 () Bool)

(assert (=> b!256746 m!272099))

(declare-fun m!272101 () Bool)

(assert (=> b!256746 m!272101))

(declare-fun m!272103 () Bool)

(assert (=> b!256746 m!272103))

(declare-fun m!272105 () Bool)

(assert (=> b!256746 m!272105))

(declare-fun m!272107 () Bool)

(assert (=> b!256746 m!272107))

(declare-fun m!272109 () Bool)

(assert (=> b!256746 m!272109))

(declare-fun m!272111 () Bool)

(assert (=> b!256746 m!272111))

(declare-fun m!272113 () Bool)

(assert (=> b!256746 m!272113))

(assert (=> bm!24332 m!272085))

(declare-fun m!272115 () Bool)

(assert (=> b!256743 m!272115))

(declare-fun m!272117 () Bool)

(assert (=> b!256743 m!272117))

(declare-fun m!272119 () Bool)

(assert (=> b!256743 m!272119))

(declare-fun m!272121 () Bool)

(assert (=> b!256734 m!272121))

(declare-fun m!272123 () Bool)

(assert (=> b!256734 m!272123))

(declare-fun m!272125 () Bool)

(assert (=> mapNonEmpty!11208 m!272125))

(declare-fun m!272127 () Bool)

(assert (=> b!256730 m!272127))

(declare-fun m!272129 () Bool)

(assert (=> b!256727 m!272129))

(declare-fun m!272131 () Bool)

(assert (=> b!256726 m!272131))

(declare-fun m!272133 () Bool)

(assert (=> start!24512 m!272133))

(check-sat (not mapNonEmpty!11208) (not b!256731) (not b!256735) (not b!256746) (not b!256730) (not b_next!6723) tp_is_empty!6585 (not b!256734) (not b!256745) b_and!13785 (not start!24512) (not b!256727) (not b!256743) (not bm!24331) (not bm!24332))
(check-sat b_and!13785 (not b_next!6723))
(get-model)

(declare-fun d!61717 () Bool)

(assert (=> d!61717 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256731 d!61717))

(declare-fun d!61719 () Bool)

(assert (=> d!61719 (= (inRange!0 (ite c!43407 (index!6830 lt!128955) (index!6833 lt!128955)) (mask!11015 thiss!1504)) (and (bvsge (ite c!43407 (index!6830 lt!128955) (index!6833 lt!128955)) #b00000000000000000000000000000000) (bvslt (ite c!43407 (index!6830 lt!128955) (index!6833 lt!128955)) (bvadd (mask!11015 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24331 d!61719))

(declare-fun b!256825 () Bool)

(declare-fun c!43430 () Bool)

(declare-fun lt!129002 () (_ BitVec 64))

(assert (=> b!256825 (= c!43430 (= lt!129002 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166482 () SeekEntryResult!1165)

(declare-fun e!166481 () SeekEntryResult!1165)

(assert (=> b!256825 (= e!166482 e!166481)))

(declare-fun b!256826 () Bool)

(declare-fun lt!129003 () SeekEntryResult!1165)

(assert (=> b!256826 (= e!166482 (Found!1165 (index!6832 lt!129003)))))

(declare-fun b!256827 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12513 (_ BitVec 32)) SeekEntryResult!1165)

(assert (=> b!256827 (= e!166481 (seekKeyOrZeroReturnVacant!0 (x!24979 lt!129003) (index!6832 lt!129003) (index!6832 lt!129003) key!932 (_keys!6901 thiss!1504) (mask!11015 thiss!1504)))))

(declare-fun b!256828 () Bool)

(declare-fun e!166480 () SeekEntryResult!1165)

(assert (=> b!256828 (= e!166480 Undefined!1165)))

(declare-fun d!61721 () Bool)

(declare-fun lt!129001 () SeekEntryResult!1165)

(assert (=> d!61721 (and (or ((_ is Undefined!1165) lt!129001) (not ((_ is Found!1165) lt!129001)) (and (bvsge (index!6831 lt!129001) #b00000000000000000000000000000000) (bvslt (index!6831 lt!129001) (size!6274 (_keys!6901 thiss!1504))))) (or ((_ is Undefined!1165) lt!129001) ((_ is Found!1165) lt!129001) (not ((_ is MissingZero!1165) lt!129001)) (and (bvsge (index!6830 lt!129001) #b00000000000000000000000000000000) (bvslt (index!6830 lt!129001) (size!6274 (_keys!6901 thiss!1504))))) (or ((_ is Undefined!1165) lt!129001) ((_ is Found!1165) lt!129001) ((_ is MissingZero!1165) lt!129001) (not ((_ is MissingVacant!1165) lt!129001)) (and (bvsge (index!6833 lt!129001) #b00000000000000000000000000000000) (bvslt (index!6833 lt!129001) (size!6274 (_keys!6901 thiss!1504))))) (or ((_ is Undefined!1165) lt!129001) (ite ((_ is Found!1165) lt!129001) (= (select (arr!5927 (_keys!6901 thiss!1504)) (index!6831 lt!129001)) key!932) (ite ((_ is MissingZero!1165) lt!129001) (= (select (arr!5927 (_keys!6901 thiss!1504)) (index!6830 lt!129001)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1165) lt!129001) (= (select (arr!5927 (_keys!6901 thiss!1504)) (index!6833 lt!129001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61721 (= lt!129001 e!166480)))

(declare-fun c!43431 () Bool)

(assert (=> d!61721 (= c!43431 (and ((_ is Intermediate!1165) lt!129003) (undefined!1977 lt!129003)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12513 (_ BitVec 32)) SeekEntryResult!1165)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61721 (= lt!129003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11015 thiss!1504)) key!932 (_keys!6901 thiss!1504) (mask!11015 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61721 (validMask!0 (mask!11015 thiss!1504))))

(assert (=> d!61721 (= (seekEntryOrOpen!0 key!932 (_keys!6901 thiss!1504) (mask!11015 thiss!1504)) lt!129001)))

(declare-fun b!256829 () Bool)

(assert (=> b!256829 (= e!166480 e!166482)))

(assert (=> b!256829 (= lt!129002 (select (arr!5927 (_keys!6901 thiss!1504)) (index!6832 lt!129003)))))

(declare-fun c!43429 () Bool)

(assert (=> b!256829 (= c!43429 (= lt!129002 key!932))))

(declare-fun b!256830 () Bool)

(assert (=> b!256830 (= e!166481 (MissingZero!1165 (index!6832 lt!129003)))))

(assert (= (and d!61721 c!43431) b!256828))

(assert (= (and d!61721 (not c!43431)) b!256829))

(assert (= (and b!256829 c!43429) b!256826))

(assert (= (and b!256829 (not c!43429)) b!256825))

(assert (= (and b!256825 c!43430) b!256830))

(assert (= (and b!256825 (not c!43430)) b!256827))

(declare-fun m!272195 () Bool)

(assert (=> b!256827 m!272195))

(declare-fun m!272197 () Bool)

(assert (=> d!61721 m!272197))

(declare-fun m!272199 () Bool)

(assert (=> d!61721 m!272199))

(declare-fun m!272201 () Bool)

(assert (=> d!61721 m!272201))

(assert (=> d!61721 m!272199))

(declare-fun m!272203 () Bool)

(assert (=> d!61721 m!272203))

(declare-fun m!272205 () Bool)

(assert (=> d!61721 m!272205))

(declare-fun m!272207 () Bool)

(assert (=> d!61721 m!272207))

(declare-fun m!272209 () Bool)

(assert (=> b!256829 m!272209))

(assert (=> b!256735 d!61721))

(declare-fun d!61723 () Bool)

(assert (=> d!61723 (= (inRange!0 index!297 (mask!11015 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11015 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!256743 d!61723))

(declare-fun d!61725 () Bool)

(declare-fun e!166487 () Bool)

(assert (=> d!61725 e!166487))

(declare-fun res!125633 () Bool)

(assert (=> d!61725 (=> res!125633 e!166487)))

(declare-fun lt!129013 () Bool)

(assert (=> d!61725 (= res!125633 (not lt!129013))))

(declare-fun lt!129012 () Bool)

(assert (=> d!61725 (= lt!129013 lt!129012)))

(declare-fun lt!129014 () Unit!7968)

(declare-fun e!166488 () Unit!7968)

(assert (=> d!61725 (= lt!129014 e!166488)))

(declare-fun c!43434 () Bool)

(assert (=> d!61725 (= c!43434 lt!129012)))

(declare-fun containsKey!302 (List!3793 (_ BitVec 64)) Bool)

(assert (=> d!61725 (= lt!129012 (containsKey!302 (toList!1929 lt!128952) key!932))))

(assert (=> d!61725 (= (contains!1868 lt!128952 key!932) lt!129013)))

(declare-fun b!256837 () Bool)

(declare-fun lt!129015 () Unit!7968)

(assert (=> b!256837 (= e!166488 lt!129015)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!250 (List!3793 (_ BitVec 64)) Unit!7968)

(assert (=> b!256837 (= lt!129015 (lemmaContainsKeyImpliesGetValueByKeyDefined!250 (toList!1929 lt!128952) key!932))))

(declare-datatypes ((Option!316 0))(
  ( (Some!315 (v!5430 V!8427)) (None!314) )
))
(declare-fun isDefined!251 (Option!316) Bool)

(declare-fun getValueByKey!310 (List!3793 (_ BitVec 64)) Option!316)

(assert (=> b!256837 (isDefined!251 (getValueByKey!310 (toList!1929 lt!128952) key!932))))

(declare-fun b!256838 () Bool)

(declare-fun Unit!7978 () Unit!7968)

(assert (=> b!256838 (= e!166488 Unit!7978)))

(declare-fun b!256839 () Bool)

(assert (=> b!256839 (= e!166487 (isDefined!251 (getValueByKey!310 (toList!1929 lt!128952) key!932)))))

(assert (= (and d!61725 c!43434) b!256837))

(assert (= (and d!61725 (not c!43434)) b!256838))

(assert (= (and d!61725 (not res!125633)) b!256839))

(declare-fun m!272211 () Bool)

(assert (=> d!61725 m!272211))

(declare-fun m!272213 () Bool)

(assert (=> b!256837 m!272213))

(declare-fun m!272215 () Bool)

(assert (=> b!256837 m!272215))

(assert (=> b!256837 m!272215))

(declare-fun m!272217 () Bool)

(assert (=> b!256837 m!272217))

(assert (=> b!256839 m!272215))

(assert (=> b!256839 m!272215))

(assert (=> b!256839 m!272217))

(assert (=> b!256743 d!61725))

(declare-fun b!256882 () Bool)

(declare-fun e!166515 () Bool)

(declare-fun call!24359 () Bool)

(assert (=> b!256882 (= e!166515 (not call!24359))))

(declare-fun b!256883 () Bool)

(declare-fun res!125656 () Bool)

(declare-fun e!166526 () Bool)

(assert (=> b!256883 (=> (not res!125656) (not e!166526))))

(declare-fun e!166525 () Bool)

(assert (=> b!256883 (= res!125656 e!166525)))

(declare-fun res!125654 () Bool)

(assert (=> b!256883 (=> res!125654 e!166525)))

(declare-fun e!166517 () Bool)

(assert (=> b!256883 (= res!125654 (not e!166517))))

(declare-fun res!125658 () Bool)

(assert (=> b!256883 (=> (not res!125658) (not e!166517))))

(assert (=> b!256883 (= res!125658 (bvslt #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))))))

(declare-fun b!256884 () Bool)

(declare-fun e!166523 () ListLongMap!3827)

(declare-fun call!24358 () ListLongMap!3827)

(assert (=> b!256884 (= e!166523 call!24358)))

(declare-fun d!61727 () Bool)

(assert (=> d!61727 e!166526))

(declare-fun res!125653 () Bool)

(assert (=> d!61727 (=> (not res!125653) (not e!166526))))

(assert (=> d!61727 (= res!125653 (or (bvsge #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))))))))

(declare-fun lt!129078 () ListLongMap!3827)

(declare-fun lt!129062 () ListLongMap!3827)

(assert (=> d!61727 (= lt!129078 lt!129062)))

(declare-fun lt!129063 () Unit!7968)

(declare-fun e!166521 () Unit!7968)

(assert (=> d!61727 (= lt!129063 e!166521)))

(declare-fun c!43452 () Bool)

(declare-fun e!166518 () Bool)

(assert (=> d!61727 (= c!43452 e!166518)))

(declare-fun res!125657 () Bool)

(assert (=> d!61727 (=> (not res!125657) (not e!166518))))

(assert (=> d!61727 (= res!125657 (bvslt #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))))))

(declare-fun e!166519 () ListLongMap!3827)

(assert (=> d!61727 (= lt!129062 e!166519)))

(declare-fun c!43449 () Bool)

(assert (=> d!61727 (= c!43449 (and (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61727 (validMask!0 (mask!11015 thiss!1504))))

(assert (=> d!61727 (= (getCurrentListMap!1457 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)) lt!129078)))

(declare-fun b!256885 () Bool)

(declare-fun c!43451 () Bool)

(assert (=> b!256885 (= c!43451 (and (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!166520 () ListLongMap!3827)

(assert (=> b!256885 (= e!166523 e!166520)))

(declare-fun b!256886 () Bool)

(declare-fun lt!129065 () Unit!7968)

(assert (=> b!256886 (= e!166521 lt!129065)))

(declare-fun lt!129076 () ListLongMap!3827)

(declare-fun getCurrentListMapNoExtraKeys!574 (array!12513 array!12511 (_ BitVec 32) (_ BitVec 32) V!8427 V!8427 (_ BitVec 32) Int) ListLongMap!3827)

(assert (=> b!256886 (= lt!129076 (getCurrentListMapNoExtraKeys!574 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun lt!129070 () (_ BitVec 64))

(assert (=> b!256886 (= lt!129070 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129066 () (_ BitVec 64))

(assert (=> b!256886 (= lt!129066 (select (arr!5927 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129074 () Unit!7968)

(declare-fun addStillContains!228 (ListLongMap!3827 (_ BitVec 64) V!8427 (_ BitVec 64)) Unit!7968)

(assert (=> b!256886 (= lt!129074 (addStillContains!228 lt!129076 lt!129070 (zeroValue!4578 thiss!1504) lt!129066))))

(assert (=> b!256886 (contains!1868 (+!683 lt!129076 (tuple2!4915 lt!129070 (zeroValue!4578 thiss!1504))) lt!129066)))

(declare-fun lt!129071 () Unit!7968)

(assert (=> b!256886 (= lt!129071 lt!129074)))

(declare-fun lt!129077 () ListLongMap!3827)

(assert (=> b!256886 (= lt!129077 (getCurrentListMapNoExtraKeys!574 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun lt!129075 () (_ BitVec 64))

(assert (=> b!256886 (= lt!129075 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129067 () (_ BitVec 64))

(assert (=> b!256886 (= lt!129067 (select (arr!5927 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129079 () Unit!7968)

(declare-fun addApplyDifferent!228 (ListLongMap!3827 (_ BitVec 64) V!8427 (_ BitVec 64)) Unit!7968)

(assert (=> b!256886 (= lt!129079 (addApplyDifferent!228 lt!129077 lt!129075 (minValue!4578 thiss!1504) lt!129067))))

(declare-fun apply!252 (ListLongMap!3827 (_ BitVec 64)) V!8427)

(assert (=> b!256886 (= (apply!252 (+!683 lt!129077 (tuple2!4915 lt!129075 (minValue!4578 thiss!1504))) lt!129067) (apply!252 lt!129077 lt!129067))))

(declare-fun lt!129069 () Unit!7968)

(assert (=> b!256886 (= lt!129069 lt!129079)))

(declare-fun lt!129060 () ListLongMap!3827)

(assert (=> b!256886 (= lt!129060 (getCurrentListMapNoExtraKeys!574 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun lt!129073 () (_ BitVec 64))

(assert (=> b!256886 (= lt!129073 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129068 () (_ BitVec 64))

(assert (=> b!256886 (= lt!129068 (select (arr!5927 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!129064 () Unit!7968)

(assert (=> b!256886 (= lt!129064 (addApplyDifferent!228 lt!129060 lt!129073 (zeroValue!4578 thiss!1504) lt!129068))))

(assert (=> b!256886 (= (apply!252 (+!683 lt!129060 (tuple2!4915 lt!129073 (zeroValue!4578 thiss!1504))) lt!129068) (apply!252 lt!129060 lt!129068))))

(declare-fun lt!129061 () Unit!7968)

(assert (=> b!256886 (= lt!129061 lt!129064)))

(declare-fun lt!129080 () ListLongMap!3827)

(assert (=> b!256886 (= lt!129080 (getCurrentListMapNoExtraKeys!574 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun lt!129081 () (_ BitVec 64))

(assert (=> b!256886 (= lt!129081 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129072 () (_ BitVec 64))

(assert (=> b!256886 (= lt!129072 (select (arr!5927 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256886 (= lt!129065 (addApplyDifferent!228 lt!129080 lt!129081 (minValue!4578 thiss!1504) lt!129072))))

(assert (=> b!256886 (= (apply!252 (+!683 lt!129080 (tuple2!4915 lt!129081 (minValue!4578 thiss!1504))) lt!129072) (apply!252 lt!129080 lt!129072))))

(declare-fun b!256887 () Bool)

(declare-fun e!166516 () Bool)

(declare-fun e!166522 () Bool)

(assert (=> b!256887 (= e!166516 e!166522)))

(declare-fun res!125659 () Bool)

(declare-fun call!24362 () Bool)

(assert (=> b!256887 (= res!125659 call!24362)))

(assert (=> b!256887 (=> (not res!125659) (not e!166522))))

(declare-fun bm!24353 () Bool)

(declare-fun call!24361 () ListLongMap!3827)

(assert (=> bm!24353 (= call!24358 call!24361)))

(declare-fun call!24360 () ListLongMap!3827)

(declare-fun bm!24354 () Bool)

(declare-fun call!24357 () ListLongMap!3827)

(declare-fun c!43450 () Bool)

(declare-fun call!24356 () ListLongMap!3827)

(assert (=> bm!24354 (= call!24361 (+!683 (ite c!43449 call!24360 (ite c!43450 call!24357 call!24356)) (ite (or c!43449 c!43450) (tuple2!4915 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4578 thiss!1504)) (tuple2!4915 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4578 thiss!1504)))))))

(declare-fun bm!24355 () Bool)

(assert (=> bm!24355 (= call!24362 (contains!1868 lt!129078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24356 () Bool)

(assert (=> bm!24356 (= call!24356 call!24357)))

(declare-fun b!256888 () Bool)

(declare-fun e!166527 () Bool)

(declare-fun get!3047 (ValueCell!2949 V!8427) V!8427)

(declare-fun dynLambda!595 (Int (_ BitVec 64)) V!8427)

(assert (=> b!256888 (= e!166527 (= (apply!252 lt!129078 (select (arr!5927 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000)) (get!3047 (select (arr!5926 (_values!4720 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!595 (defaultEntry!4737 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6273 (_values!4720 thiss!1504))))))

(assert (=> b!256888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))))))

(declare-fun b!256889 () Bool)

(declare-fun Unit!7979 () Unit!7968)

(assert (=> b!256889 (= e!166521 Unit!7979)))

(declare-fun b!256890 () Bool)

(assert (=> b!256890 (= e!166522 (= (apply!252 lt!129078 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4578 thiss!1504)))))

(declare-fun b!256891 () Bool)

(assert (=> b!256891 (= e!166520 call!24356)))

(declare-fun b!256892 () Bool)

(assert (=> b!256892 (= e!166519 (+!683 call!24361 (tuple2!4915 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4578 thiss!1504))))))

(declare-fun b!256893 () Bool)

(declare-fun res!125652 () Bool)

(assert (=> b!256893 (=> (not res!125652) (not e!166526))))

(assert (=> b!256893 (= res!125652 e!166516)))

(declare-fun c!43447 () Bool)

(assert (=> b!256893 (= c!43447 (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!256894 () Bool)

(declare-fun e!166524 () Bool)

(assert (=> b!256894 (= e!166515 e!166524)))

(declare-fun res!125655 () Bool)

(assert (=> b!256894 (= res!125655 call!24359)))

(assert (=> b!256894 (=> (not res!125655) (not e!166524))))

(declare-fun b!256895 () Bool)

(assert (=> b!256895 (= e!166518 (validKeyInArray!0 (select (arr!5927 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24357 () Bool)

(assert (=> bm!24357 (= call!24359 (contains!1868 lt!129078 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256896 () Bool)

(assert (=> b!256896 (= e!166525 e!166527)))

(declare-fun res!125660 () Bool)

(assert (=> b!256896 (=> (not res!125660) (not e!166527))))

(assert (=> b!256896 (= res!125660 (contains!1868 lt!129078 (select (arr!5927 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!256896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))))))

(declare-fun bm!24358 () Bool)

(assert (=> bm!24358 (= call!24360 (getCurrentListMapNoExtraKeys!574 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun b!256897 () Bool)

(assert (=> b!256897 (= e!166524 (= (apply!252 lt!129078 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4578 thiss!1504)))))

(declare-fun bm!24359 () Bool)

(assert (=> bm!24359 (= call!24357 call!24360)))

(declare-fun b!256898 () Bool)

(assert (=> b!256898 (= e!166516 (not call!24362))))

(declare-fun b!256899 () Bool)

(assert (=> b!256899 (= e!166526 e!166515)))

(declare-fun c!43448 () Bool)

(assert (=> b!256899 (= c!43448 (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256900 () Bool)

(assert (=> b!256900 (= e!166517 (validKeyInArray!0 (select (arr!5927 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256901 () Bool)

(assert (=> b!256901 (= e!166520 call!24358)))

(declare-fun b!256902 () Bool)

(assert (=> b!256902 (= e!166519 e!166523)))

(assert (=> b!256902 (= c!43450 (and (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61727 c!43449) b!256892))

(assert (= (and d!61727 (not c!43449)) b!256902))

(assert (= (and b!256902 c!43450) b!256884))

(assert (= (and b!256902 (not c!43450)) b!256885))

(assert (= (and b!256885 c!43451) b!256901))

(assert (= (and b!256885 (not c!43451)) b!256891))

(assert (= (or b!256901 b!256891) bm!24356))

(assert (= (or b!256884 bm!24356) bm!24359))

(assert (= (or b!256884 b!256901) bm!24353))

(assert (= (or b!256892 bm!24359) bm!24358))

(assert (= (or b!256892 bm!24353) bm!24354))

(assert (= (and d!61727 res!125657) b!256895))

(assert (= (and d!61727 c!43452) b!256886))

(assert (= (and d!61727 (not c!43452)) b!256889))

(assert (= (and d!61727 res!125653) b!256883))

(assert (= (and b!256883 res!125658) b!256900))

(assert (= (and b!256883 (not res!125654)) b!256896))

(assert (= (and b!256896 res!125660) b!256888))

(assert (= (and b!256883 res!125656) b!256893))

(assert (= (and b!256893 c!43447) b!256887))

(assert (= (and b!256893 (not c!43447)) b!256898))

(assert (= (and b!256887 res!125659) b!256890))

(assert (= (or b!256887 b!256898) bm!24355))

(assert (= (and b!256893 res!125652) b!256899))

(assert (= (and b!256899 c!43448) b!256894))

(assert (= (and b!256899 (not c!43448)) b!256882))

(assert (= (and b!256894 res!125655) b!256897))

(assert (= (or b!256894 b!256882) bm!24357))

(declare-fun b_lambda!8171 () Bool)

(assert (=> (not b_lambda!8171) (not b!256888)))

(declare-fun t!8855 () Bool)

(declare-fun tb!3017 () Bool)

(assert (=> (and b!256734 (= (defaultEntry!4737 thiss!1504) (defaultEntry!4737 thiss!1504)) t!8855) tb!3017))

(declare-fun result!5373 () Bool)

(assert (=> tb!3017 (= result!5373 tp_is_empty!6585)))

(assert (=> b!256888 t!8855))

(declare-fun b_and!13789 () Bool)

(assert (= b_and!13785 (and (=> t!8855 result!5373) b_and!13789)))

(declare-fun m!272219 () Bool)

(assert (=> bm!24355 m!272219))

(declare-fun m!272221 () Bool)

(assert (=> b!256888 m!272221))

(declare-fun m!272223 () Bool)

(assert (=> b!256888 m!272223))

(assert (=> b!256888 m!272223))

(declare-fun m!272225 () Bool)

(assert (=> b!256888 m!272225))

(declare-fun m!272227 () Bool)

(assert (=> b!256888 m!272227))

(assert (=> b!256888 m!272227))

(assert (=> b!256888 m!272221))

(declare-fun m!272229 () Bool)

(assert (=> b!256888 m!272229))

(declare-fun m!272231 () Bool)

(assert (=> b!256890 m!272231))

(declare-fun m!272233 () Bool)

(assert (=> b!256892 m!272233))

(assert (=> b!256895 m!272223))

(assert (=> b!256895 m!272223))

(declare-fun m!272235 () Bool)

(assert (=> b!256895 m!272235))

(assert (=> b!256896 m!272223))

(assert (=> b!256896 m!272223))

(declare-fun m!272237 () Bool)

(assert (=> b!256896 m!272237))

(assert (=> b!256900 m!272223))

(assert (=> b!256900 m!272223))

(assert (=> b!256900 m!272235))

(declare-fun m!272239 () Bool)

(assert (=> bm!24354 m!272239))

(declare-fun m!272241 () Bool)

(assert (=> bm!24357 m!272241))

(declare-fun m!272243 () Bool)

(assert (=> b!256886 m!272243))

(declare-fun m!272245 () Bool)

(assert (=> b!256886 m!272245))

(assert (=> b!256886 m!272223))

(declare-fun m!272247 () Bool)

(assert (=> b!256886 m!272247))

(declare-fun m!272249 () Bool)

(assert (=> b!256886 m!272249))

(declare-fun m!272251 () Bool)

(assert (=> b!256886 m!272251))

(assert (=> b!256886 m!272247))

(declare-fun m!272253 () Bool)

(assert (=> b!256886 m!272253))

(declare-fun m!272255 () Bool)

(assert (=> b!256886 m!272255))

(declare-fun m!272257 () Bool)

(assert (=> b!256886 m!272257))

(declare-fun m!272259 () Bool)

(assert (=> b!256886 m!272259))

(declare-fun m!272261 () Bool)

(assert (=> b!256886 m!272261))

(declare-fun m!272263 () Bool)

(assert (=> b!256886 m!272263))

(declare-fun m!272265 () Bool)

(assert (=> b!256886 m!272265))

(declare-fun m!272267 () Bool)

(assert (=> b!256886 m!272267))

(assert (=> b!256886 m!272259))

(declare-fun m!272269 () Bool)

(assert (=> b!256886 m!272269))

(assert (=> b!256886 m!272257))

(declare-fun m!272271 () Bool)

(assert (=> b!256886 m!272271))

(assert (=> b!256886 m!272255))

(declare-fun m!272273 () Bool)

(assert (=> b!256886 m!272273))

(declare-fun m!272275 () Bool)

(assert (=> b!256897 m!272275))

(assert (=> d!61727 m!272205))

(assert (=> bm!24358 m!272251))

(assert (=> b!256743 d!61727))

(declare-fun d!61729 () Bool)

(declare-fun e!166530 () Bool)

(assert (=> d!61729 e!166530))

(declare-fun res!125665 () Bool)

(assert (=> d!61729 (=> (not res!125665) (not e!166530))))

(declare-fun lt!129086 () SeekEntryResult!1165)

(assert (=> d!61729 (= res!125665 ((_ is Found!1165) lt!129086))))

(assert (=> d!61729 (= lt!129086 (seekEntryOrOpen!0 key!932 (_keys!6901 thiss!1504) (mask!11015 thiss!1504)))))

(declare-fun lt!129087 () Unit!7968)

(declare-fun choose!1232 (array!12513 array!12511 (_ BitVec 32) (_ BitVec 32) V!8427 V!8427 (_ BitVec 64) Int) Unit!7968)

(assert (=> d!61729 (= lt!129087 (choose!1232 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) key!932 (defaultEntry!4737 thiss!1504)))))

(assert (=> d!61729 (validMask!0 (mask!11015 thiss!1504))))

(assert (=> d!61729 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!429 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) key!932 (defaultEntry!4737 thiss!1504)) lt!129087)))

(declare-fun b!256909 () Bool)

(declare-fun res!125666 () Bool)

(assert (=> b!256909 (=> (not res!125666) (not e!166530))))

(assert (=> b!256909 (= res!125666 (inRange!0 (index!6831 lt!129086) (mask!11015 thiss!1504)))))

(declare-fun b!256910 () Bool)

(assert (=> b!256910 (= e!166530 (= (select (arr!5927 (_keys!6901 thiss!1504)) (index!6831 lt!129086)) key!932))))

(assert (=> b!256910 (and (bvsge (index!6831 lt!129086) #b00000000000000000000000000000000) (bvslt (index!6831 lt!129086) (size!6274 (_keys!6901 thiss!1504))))))

(assert (= (and d!61729 res!125665) b!256909))

(assert (= (and b!256909 res!125666) b!256910))

(assert (=> d!61729 m!272075))

(declare-fun m!272277 () Bool)

(assert (=> d!61729 m!272277))

(assert (=> d!61729 m!272205))

(declare-fun m!272279 () Bool)

(assert (=> b!256909 m!272279))

(declare-fun m!272281 () Bool)

(assert (=> b!256910 m!272281))

(assert (=> b!256730 d!61729))

(declare-fun bm!24362 () Bool)

(declare-fun call!24365 () Bool)

(assert (=> bm!24362 (= call!24365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128951 (mask!11015 thiss!1504)))))

(declare-fun b!256920 () Bool)

(declare-fun e!166538 () Bool)

(declare-fun e!166537 () Bool)

(assert (=> b!256920 (= e!166538 e!166537)))

(declare-fun lt!129095 () (_ BitVec 64))

(assert (=> b!256920 (= lt!129095 (select (arr!5927 lt!128951) #b00000000000000000000000000000000))))

(declare-fun lt!129094 () Unit!7968)

(assert (=> b!256920 (= lt!129094 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128951 lt!129095 #b00000000000000000000000000000000))))

(assert (=> b!256920 (arrayContainsKey!0 lt!128951 lt!129095 #b00000000000000000000000000000000)))

(declare-fun lt!129096 () Unit!7968)

(assert (=> b!256920 (= lt!129096 lt!129094)))

(declare-fun res!125671 () Bool)

(assert (=> b!256920 (= res!125671 (= (seekEntryOrOpen!0 (select (arr!5927 lt!128951) #b00000000000000000000000000000000) lt!128951 (mask!11015 thiss!1504)) (Found!1165 #b00000000000000000000000000000000)))))

(assert (=> b!256920 (=> (not res!125671) (not e!166537))))

(declare-fun b!256921 () Bool)

(assert (=> b!256921 (= e!166537 call!24365)))

(declare-fun b!256922 () Bool)

(assert (=> b!256922 (= e!166538 call!24365)))

(declare-fun b!256919 () Bool)

(declare-fun e!166539 () Bool)

(assert (=> b!256919 (= e!166539 e!166538)))

(declare-fun c!43455 () Bool)

(assert (=> b!256919 (= c!43455 (validKeyInArray!0 (select (arr!5927 lt!128951) #b00000000000000000000000000000000)))))

(declare-fun d!61731 () Bool)

(declare-fun res!125672 () Bool)

(assert (=> d!61731 (=> res!125672 e!166539)))

(assert (=> d!61731 (= res!125672 (bvsge #b00000000000000000000000000000000 (size!6274 lt!128951)))))

(assert (=> d!61731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128951 (mask!11015 thiss!1504)) e!166539)))

(assert (= (and d!61731 (not res!125672)) b!256919))

(assert (= (and b!256919 c!43455) b!256920))

(assert (= (and b!256919 (not c!43455)) b!256922))

(assert (= (and b!256920 res!125671) b!256921))

(assert (= (or b!256921 b!256922) bm!24362))

(declare-fun m!272283 () Bool)

(assert (=> bm!24362 m!272283))

(declare-fun m!272285 () Bool)

(assert (=> b!256920 m!272285))

(declare-fun m!272287 () Bool)

(assert (=> b!256920 m!272287))

(declare-fun m!272289 () Bool)

(assert (=> b!256920 m!272289))

(assert (=> b!256920 m!272285))

(declare-fun m!272291 () Bool)

(assert (=> b!256920 m!272291))

(assert (=> b!256919 m!272285))

(assert (=> b!256919 m!272285))

(declare-fun m!272293 () Bool)

(assert (=> b!256919 m!272293))

(assert (=> b!256746 d!61731))

(declare-fun b!256923 () Bool)

(declare-fun e!166540 () Bool)

(declare-fun call!24369 () Bool)

(assert (=> b!256923 (= e!166540 (not call!24369))))

(declare-fun b!256924 () Bool)

(declare-fun res!125677 () Bool)

(declare-fun e!166551 () Bool)

(assert (=> b!256924 (=> (not res!125677) (not e!166551))))

(declare-fun e!166550 () Bool)

(assert (=> b!256924 (= res!125677 e!166550)))

(declare-fun res!125675 () Bool)

(assert (=> b!256924 (=> res!125675 e!166550)))

(declare-fun e!166542 () Bool)

(assert (=> b!256924 (= res!125675 (not e!166542))))

(declare-fun res!125679 () Bool)

(assert (=> b!256924 (=> (not res!125679) (not e!166542))))

(assert (=> b!256924 (= res!125679 (bvslt #b00000000000000000000000000000000 (size!6274 lt!128951)))))

(declare-fun b!256925 () Bool)

(declare-fun e!166548 () ListLongMap!3827)

(declare-fun call!24368 () ListLongMap!3827)

(assert (=> b!256925 (= e!166548 call!24368)))

(declare-fun d!61733 () Bool)

(assert (=> d!61733 e!166551))

(declare-fun res!125674 () Bool)

(assert (=> d!61733 (=> (not res!125674) (not e!166551))))

(assert (=> d!61733 (= res!125674 (or (bvsge #b00000000000000000000000000000000 (size!6274 lt!128951)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 lt!128951)))))))

(declare-fun lt!129115 () ListLongMap!3827)

(declare-fun lt!129099 () ListLongMap!3827)

(assert (=> d!61733 (= lt!129115 lt!129099)))

(declare-fun lt!129100 () Unit!7968)

(declare-fun e!166546 () Unit!7968)

(assert (=> d!61733 (= lt!129100 e!166546)))

(declare-fun c!43461 () Bool)

(declare-fun e!166543 () Bool)

(assert (=> d!61733 (= c!43461 e!166543)))

(declare-fun res!125678 () Bool)

(assert (=> d!61733 (=> (not res!125678) (not e!166543))))

(assert (=> d!61733 (= res!125678 (bvslt #b00000000000000000000000000000000 (size!6274 lt!128951)))))

(declare-fun e!166544 () ListLongMap!3827)

(assert (=> d!61733 (= lt!129099 e!166544)))

(declare-fun c!43458 () Bool)

(assert (=> d!61733 (= c!43458 (and (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61733 (validMask!0 (mask!11015 thiss!1504))))

(assert (=> d!61733 (= (getCurrentListMap!1457 lt!128951 (array!12512 (store (arr!5926 (_values!4720 thiss!1504)) index!297 (ValueCellFull!2949 v!346)) (size!6273 (_values!4720 thiss!1504))) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)) lt!129115)))

(declare-fun b!256926 () Bool)

(declare-fun c!43460 () Bool)

(assert (=> b!256926 (= c!43460 (and (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!166545 () ListLongMap!3827)

(assert (=> b!256926 (= e!166548 e!166545)))

(declare-fun b!256927 () Bool)

(declare-fun lt!129102 () Unit!7968)

(assert (=> b!256927 (= e!166546 lt!129102)))

(declare-fun lt!129113 () ListLongMap!3827)

(assert (=> b!256927 (= lt!129113 (getCurrentListMapNoExtraKeys!574 lt!128951 (array!12512 (store (arr!5926 (_values!4720 thiss!1504)) index!297 (ValueCellFull!2949 v!346)) (size!6273 (_values!4720 thiss!1504))) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun lt!129107 () (_ BitVec 64))

(assert (=> b!256927 (= lt!129107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129103 () (_ BitVec 64))

(assert (=> b!256927 (= lt!129103 (select (arr!5927 lt!128951) #b00000000000000000000000000000000))))

(declare-fun lt!129111 () Unit!7968)

(assert (=> b!256927 (= lt!129111 (addStillContains!228 lt!129113 lt!129107 (zeroValue!4578 thiss!1504) lt!129103))))

(assert (=> b!256927 (contains!1868 (+!683 lt!129113 (tuple2!4915 lt!129107 (zeroValue!4578 thiss!1504))) lt!129103)))

(declare-fun lt!129108 () Unit!7968)

(assert (=> b!256927 (= lt!129108 lt!129111)))

(declare-fun lt!129114 () ListLongMap!3827)

(assert (=> b!256927 (= lt!129114 (getCurrentListMapNoExtraKeys!574 lt!128951 (array!12512 (store (arr!5926 (_values!4720 thiss!1504)) index!297 (ValueCellFull!2949 v!346)) (size!6273 (_values!4720 thiss!1504))) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun lt!129112 () (_ BitVec 64))

(assert (=> b!256927 (= lt!129112 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129104 () (_ BitVec 64))

(assert (=> b!256927 (= lt!129104 (select (arr!5927 lt!128951) #b00000000000000000000000000000000))))

(declare-fun lt!129116 () Unit!7968)

(assert (=> b!256927 (= lt!129116 (addApplyDifferent!228 lt!129114 lt!129112 (minValue!4578 thiss!1504) lt!129104))))

(assert (=> b!256927 (= (apply!252 (+!683 lt!129114 (tuple2!4915 lt!129112 (minValue!4578 thiss!1504))) lt!129104) (apply!252 lt!129114 lt!129104))))

(declare-fun lt!129106 () Unit!7968)

(assert (=> b!256927 (= lt!129106 lt!129116)))

(declare-fun lt!129097 () ListLongMap!3827)

(assert (=> b!256927 (= lt!129097 (getCurrentListMapNoExtraKeys!574 lt!128951 (array!12512 (store (arr!5926 (_values!4720 thiss!1504)) index!297 (ValueCellFull!2949 v!346)) (size!6273 (_values!4720 thiss!1504))) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun lt!129110 () (_ BitVec 64))

(assert (=> b!256927 (= lt!129110 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129105 () (_ BitVec 64))

(assert (=> b!256927 (= lt!129105 (select (arr!5927 lt!128951) #b00000000000000000000000000000000))))

(declare-fun lt!129101 () Unit!7968)

(assert (=> b!256927 (= lt!129101 (addApplyDifferent!228 lt!129097 lt!129110 (zeroValue!4578 thiss!1504) lt!129105))))

(assert (=> b!256927 (= (apply!252 (+!683 lt!129097 (tuple2!4915 lt!129110 (zeroValue!4578 thiss!1504))) lt!129105) (apply!252 lt!129097 lt!129105))))

(declare-fun lt!129098 () Unit!7968)

(assert (=> b!256927 (= lt!129098 lt!129101)))

(declare-fun lt!129117 () ListLongMap!3827)

(assert (=> b!256927 (= lt!129117 (getCurrentListMapNoExtraKeys!574 lt!128951 (array!12512 (store (arr!5926 (_values!4720 thiss!1504)) index!297 (ValueCellFull!2949 v!346)) (size!6273 (_values!4720 thiss!1504))) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun lt!129118 () (_ BitVec 64))

(assert (=> b!256927 (= lt!129118 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!129109 () (_ BitVec 64))

(assert (=> b!256927 (= lt!129109 (select (arr!5927 lt!128951) #b00000000000000000000000000000000))))

(assert (=> b!256927 (= lt!129102 (addApplyDifferent!228 lt!129117 lt!129118 (minValue!4578 thiss!1504) lt!129109))))

(assert (=> b!256927 (= (apply!252 (+!683 lt!129117 (tuple2!4915 lt!129118 (minValue!4578 thiss!1504))) lt!129109) (apply!252 lt!129117 lt!129109))))

(declare-fun b!256928 () Bool)

(declare-fun e!166541 () Bool)

(declare-fun e!166547 () Bool)

(assert (=> b!256928 (= e!166541 e!166547)))

(declare-fun res!125680 () Bool)

(declare-fun call!24372 () Bool)

(assert (=> b!256928 (= res!125680 call!24372)))

(assert (=> b!256928 (=> (not res!125680) (not e!166547))))

(declare-fun bm!24363 () Bool)

(declare-fun call!24371 () ListLongMap!3827)

(assert (=> bm!24363 (= call!24368 call!24371)))

(declare-fun c!43459 () Bool)

(declare-fun bm!24364 () Bool)

(declare-fun call!24367 () ListLongMap!3827)

(declare-fun call!24370 () ListLongMap!3827)

(declare-fun call!24366 () ListLongMap!3827)

(assert (=> bm!24364 (= call!24371 (+!683 (ite c!43458 call!24370 (ite c!43459 call!24367 call!24366)) (ite (or c!43458 c!43459) (tuple2!4915 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4578 thiss!1504)) (tuple2!4915 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4578 thiss!1504)))))))

(declare-fun bm!24365 () Bool)

(assert (=> bm!24365 (= call!24372 (contains!1868 lt!129115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24366 () Bool)

(assert (=> bm!24366 (= call!24366 call!24367)))

(declare-fun e!166552 () Bool)

(declare-fun b!256929 () Bool)

(assert (=> b!256929 (= e!166552 (= (apply!252 lt!129115 (select (arr!5927 lt!128951) #b00000000000000000000000000000000)) (get!3047 (select (arr!5926 (array!12512 (store (arr!5926 (_values!4720 thiss!1504)) index!297 (ValueCellFull!2949 v!346)) (size!6273 (_values!4720 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!595 (defaultEntry!4737 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6273 (array!12512 (store (arr!5926 (_values!4720 thiss!1504)) index!297 (ValueCellFull!2949 v!346)) (size!6273 (_values!4720 thiss!1504))))))))

(assert (=> b!256929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 lt!128951)))))

(declare-fun b!256930 () Bool)

(declare-fun Unit!7980 () Unit!7968)

(assert (=> b!256930 (= e!166546 Unit!7980)))

(declare-fun b!256931 () Bool)

(assert (=> b!256931 (= e!166547 (= (apply!252 lt!129115 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4578 thiss!1504)))))

(declare-fun b!256932 () Bool)

(assert (=> b!256932 (= e!166545 call!24366)))

(declare-fun b!256933 () Bool)

(assert (=> b!256933 (= e!166544 (+!683 call!24371 (tuple2!4915 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4578 thiss!1504))))))

(declare-fun b!256934 () Bool)

(declare-fun res!125673 () Bool)

(assert (=> b!256934 (=> (not res!125673) (not e!166551))))

(assert (=> b!256934 (= res!125673 e!166541)))

(declare-fun c!43456 () Bool)

(assert (=> b!256934 (= c!43456 (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!256935 () Bool)

(declare-fun e!166549 () Bool)

(assert (=> b!256935 (= e!166540 e!166549)))

(declare-fun res!125676 () Bool)

(assert (=> b!256935 (= res!125676 call!24369)))

(assert (=> b!256935 (=> (not res!125676) (not e!166549))))

(declare-fun b!256936 () Bool)

(assert (=> b!256936 (= e!166543 (validKeyInArray!0 (select (arr!5927 lt!128951) #b00000000000000000000000000000000)))))

(declare-fun bm!24367 () Bool)

(assert (=> bm!24367 (= call!24369 (contains!1868 lt!129115 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256937 () Bool)

(assert (=> b!256937 (= e!166550 e!166552)))

(declare-fun res!125681 () Bool)

(assert (=> b!256937 (=> (not res!125681) (not e!166552))))

(assert (=> b!256937 (= res!125681 (contains!1868 lt!129115 (select (arr!5927 lt!128951) #b00000000000000000000000000000000)))))

(assert (=> b!256937 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6274 lt!128951)))))

(declare-fun bm!24368 () Bool)

(assert (=> bm!24368 (= call!24370 (getCurrentListMapNoExtraKeys!574 lt!128951 (array!12512 (store (arr!5926 (_values!4720 thiss!1504)) index!297 (ValueCellFull!2949 v!346)) (size!6273 (_values!4720 thiss!1504))) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(declare-fun b!256938 () Bool)

(assert (=> b!256938 (= e!166549 (= (apply!252 lt!129115 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4578 thiss!1504)))))

(declare-fun bm!24369 () Bool)

(assert (=> bm!24369 (= call!24367 call!24370)))

(declare-fun b!256939 () Bool)

(assert (=> b!256939 (= e!166541 (not call!24372))))

(declare-fun b!256940 () Bool)

(assert (=> b!256940 (= e!166551 e!166540)))

(declare-fun c!43457 () Bool)

(assert (=> b!256940 (= c!43457 (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256941 () Bool)

(assert (=> b!256941 (= e!166542 (validKeyInArray!0 (select (arr!5927 lt!128951) #b00000000000000000000000000000000)))))

(declare-fun b!256942 () Bool)

(assert (=> b!256942 (= e!166545 call!24368)))

(declare-fun b!256943 () Bool)

(assert (=> b!256943 (= e!166544 e!166548)))

(assert (=> b!256943 (= c!43459 (and (not (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4474 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61733 c!43458) b!256933))

(assert (= (and d!61733 (not c!43458)) b!256943))

(assert (= (and b!256943 c!43459) b!256925))

(assert (= (and b!256943 (not c!43459)) b!256926))

(assert (= (and b!256926 c!43460) b!256942))

(assert (= (and b!256926 (not c!43460)) b!256932))

(assert (= (or b!256942 b!256932) bm!24366))

(assert (= (or b!256925 bm!24366) bm!24369))

(assert (= (or b!256925 b!256942) bm!24363))

(assert (= (or b!256933 bm!24369) bm!24368))

(assert (= (or b!256933 bm!24363) bm!24364))

(assert (= (and d!61733 res!125678) b!256936))

(assert (= (and d!61733 c!43461) b!256927))

(assert (= (and d!61733 (not c!43461)) b!256930))

(assert (= (and d!61733 res!125674) b!256924))

(assert (= (and b!256924 res!125679) b!256941))

(assert (= (and b!256924 (not res!125675)) b!256937))

(assert (= (and b!256937 res!125681) b!256929))

(assert (= (and b!256924 res!125677) b!256934))

(assert (= (and b!256934 c!43456) b!256928))

(assert (= (and b!256934 (not c!43456)) b!256939))

(assert (= (and b!256928 res!125680) b!256931))

(assert (= (or b!256928 b!256939) bm!24365))

(assert (= (and b!256934 res!125673) b!256940))

(assert (= (and b!256940 c!43457) b!256935))

(assert (= (and b!256940 (not c!43457)) b!256923))

(assert (= (and b!256935 res!125676) b!256938))

(assert (= (or b!256935 b!256923) bm!24367))

(declare-fun b_lambda!8173 () Bool)

(assert (=> (not b_lambda!8173) (not b!256929)))

(assert (=> b!256929 t!8855))

(declare-fun b_and!13791 () Bool)

(assert (= b_and!13789 (and (=> t!8855 result!5373) b_and!13791)))

(declare-fun m!272295 () Bool)

(assert (=> bm!24365 m!272295))

(assert (=> b!256929 m!272221))

(assert (=> b!256929 m!272285))

(assert (=> b!256929 m!272285))

(declare-fun m!272297 () Bool)

(assert (=> b!256929 m!272297))

(declare-fun m!272299 () Bool)

(assert (=> b!256929 m!272299))

(assert (=> b!256929 m!272299))

(assert (=> b!256929 m!272221))

(declare-fun m!272301 () Bool)

(assert (=> b!256929 m!272301))

(declare-fun m!272303 () Bool)

(assert (=> b!256931 m!272303))

(declare-fun m!272305 () Bool)

(assert (=> b!256933 m!272305))

(assert (=> b!256936 m!272285))

(assert (=> b!256936 m!272285))

(assert (=> b!256936 m!272293))

(assert (=> b!256937 m!272285))

(assert (=> b!256937 m!272285))

(declare-fun m!272307 () Bool)

(assert (=> b!256937 m!272307))

(assert (=> b!256941 m!272285))

(assert (=> b!256941 m!272285))

(assert (=> b!256941 m!272293))

(declare-fun m!272309 () Bool)

(assert (=> bm!24364 m!272309))

(declare-fun m!272311 () Bool)

(assert (=> bm!24367 m!272311))

(declare-fun m!272313 () Bool)

(assert (=> b!256927 m!272313))

(declare-fun m!272315 () Bool)

(assert (=> b!256927 m!272315))

(assert (=> b!256927 m!272285))

(declare-fun m!272317 () Bool)

(assert (=> b!256927 m!272317))

(declare-fun m!272319 () Bool)

(assert (=> b!256927 m!272319))

(declare-fun m!272321 () Bool)

(assert (=> b!256927 m!272321))

(assert (=> b!256927 m!272317))

(declare-fun m!272323 () Bool)

(assert (=> b!256927 m!272323))

(declare-fun m!272325 () Bool)

(assert (=> b!256927 m!272325))

(declare-fun m!272327 () Bool)

(assert (=> b!256927 m!272327))

(declare-fun m!272329 () Bool)

(assert (=> b!256927 m!272329))

(declare-fun m!272331 () Bool)

(assert (=> b!256927 m!272331))

(declare-fun m!272333 () Bool)

(assert (=> b!256927 m!272333))

(declare-fun m!272335 () Bool)

(assert (=> b!256927 m!272335))

(declare-fun m!272337 () Bool)

(assert (=> b!256927 m!272337))

(assert (=> b!256927 m!272329))

(declare-fun m!272339 () Bool)

(assert (=> b!256927 m!272339))

(assert (=> b!256927 m!272327))

(declare-fun m!272341 () Bool)

(assert (=> b!256927 m!272341))

(assert (=> b!256927 m!272325))

(declare-fun m!272343 () Bool)

(assert (=> b!256927 m!272343))

(declare-fun m!272345 () Bool)

(assert (=> b!256938 m!272345))

(assert (=> d!61733 m!272205))

(assert (=> bm!24368 m!272321))

(assert (=> b!256746 d!61733))

(declare-fun b!256954 () Bool)

(declare-fun e!166557 () Bool)

(assert (=> b!256954 (= e!166557 (bvslt (size!6274 (_keys!6901 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!256953 () Bool)

(declare-fun res!125693 () Bool)

(assert (=> b!256953 (=> (not res!125693) (not e!166557))))

(assert (=> b!256953 (= res!125693 (validKeyInArray!0 key!932))))

(declare-fun b!256952 () Bool)

(declare-fun res!125690 () Bool)

(assert (=> b!256952 (=> (not res!125690) (not e!166557))))

(assert (=> b!256952 (= res!125690 (not (validKeyInArray!0 (select (arr!5927 (_keys!6901 thiss!1504)) index!297))))))

(declare-fun b!256955 () Bool)

(declare-fun e!166558 () Bool)

(assert (=> b!256955 (= e!166558 (= (arrayCountValidKeys!0 (array!12514 (store (arr!5927 (_keys!6901 thiss!1504)) index!297 key!932) (size!6274 (_keys!6901 thiss!1504))) #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6901 thiss!1504) #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!61735 () Bool)

(assert (=> d!61735 e!166558))

(declare-fun res!125692 () Bool)

(assert (=> d!61735 (=> (not res!125692) (not e!166558))))

(assert (=> d!61735 (= res!125692 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6901 thiss!1504)))))))

(declare-fun lt!129121 () Unit!7968)

(declare-fun choose!1 (array!12513 (_ BitVec 32) (_ BitVec 64)) Unit!7968)

(assert (=> d!61735 (= lt!129121 (choose!1 (_keys!6901 thiss!1504) index!297 key!932))))

(assert (=> d!61735 e!166557))

(declare-fun res!125691 () Bool)

(assert (=> d!61735 (=> (not res!125691) (not e!166557))))

(assert (=> d!61735 (= res!125691 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6901 thiss!1504)))))))

(assert (=> d!61735 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6901 thiss!1504) index!297 key!932) lt!129121)))

(assert (= (and d!61735 res!125691) b!256952))

(assert (= (and b!256952 res!125690) b!256953))

(assert (= (and b!256953 res!125693) b!256954))

(assert (= (and d!61735 res!125692) b!256955))

(assert (=> b!256953 m!272083))

(declare-fun m!272347 () Bool)

(assert (=> b!256952 m!272347))

(assert (=> b!256952 m!272347))

(declare-fun m!272349 () Bool)

(assert (=> b!256952 m!272349))

(assert (=> b!256955 m!272097))

(declare-fun m!272351 () Bool)

(assert (=> b!256955 m!272351))

(assert (=> b!256955 m!272109))

(declare-fun m!272353 () Bool)

(assert (=> d!61735 m!272353))

(assert (=> b!256746 d!61735))

(declare-fun d!61737 () Bool)

(declare-fun res!125698 () Bool)

(declare-fun e!166563 () Bool)

(assert (=> d!61737 (=> res!125698 e!166563)))

(assert (=> d!61737 (= res!125698 (= (select (arr!5927 lt!128951) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61737 (= (arrayContainsKey!0 lt!128951 key!932 #b00000000000000000000000000000000) e!166563)))

(declare-fun b!256960 () Bool)

(declare-fun e!166564 () Bool)

(assert (=> b!256960 (= e!166563 e!166564)))

(declare-fun res!125699 () Bool)

(assert (=> b!256960 (=> (not res!125699) (not e!166564))))

(assert (=> b!256960 (= res!125699 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6274 lt!128951)))))

(declare-fun b!256961 () Bool)

(assert (=> b!256961 (= e!166564 (arrayContainsKey!0 lt!128951 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61737 (not res!125698)) b!256960))

(assert (= (and b!256960 res!125699) b!256961))

(assert (=> d!61737 m!272285))

(declare-fun m!272355 () Bool)

(assert (=> b!256961 m!272355))

(assert (=> b!256746 d!61737))

(declare-fun d!61739 () Bool)

(declare-fun e!166567 () Bool)

(assert (=> d!61739 e!166567))

(declare-fun res!125704 () Bool)

(assert (=> d!61739 (=> (not res!125704) (not e!166567))))

(declare-fun lt!129130 () ListLongMap!3827)

(assert (=> d!61739 (= res!125704 (contains!1868 lt!129130 (_1!2468 (tuple2!4915 key!932 v!346))))))

(declare-fun lt!129131 () List!3793)

(assert (=> d!61739 (= lt!129130 (ListLongMap!3828 lt!129131))))

(declare-fun lt!129132 () Unit!7968)

(declare-fun lt!129133 () Unit!7968)

(assert (=> d!61739 (= lt!129132 lt!129133)))

(assert (=> d!61739 (= (getValueByKey!310 lt!129131 (_1!2468 (tuple2!4915 key!932 v!346))) (Some!315 (_2!2468 (tuple2!4915 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!166 (List!3793 (_ BitVec 64) V!8427) Unit!7968)

(assert (=> d!61739 (= lt!129133 (lemmaContainsTupThenGetReturnValue!166 lt!129131 (_1!2468 (tuple2!4915 key!932 v!346)) (_2!2468 (tuple2!4915 key!932 v!346))))))

(declare-fun insertStrictlySorted!169 (List!3793 (_ BitVec 64) V!8427) List!3793)

(assert (=> d!61739 (= lt!129131 (insertStrictlySorted!169 (toList!1929 lt!128952) (_1!2468 (tuple2!4915 key!932 v!346)) (_2!2468 (tuple2!4915 key!932 v!346))))))

(assert (=> d!61739 (= (+!683 lt!128952 (tuple2!4915 key!932 v!346)) lt!129130)))

(declare-fun b!256966 () Bool)

(declare-fun res!125705 () Bool)

(assert (=> b!256966 (=> (not res!125705) (not e!166567))))

(assert (=> b!256966 (= res!125705 (= (getValueByKey!310 (toList!1929 lt!129130) (_1!2468 (tuple2!4915 key!932 v!346))) (Some!315 (_2!2468 (tuple2!4915 key!932 v!346)))))))

(declare-fun b!256967 () Bool)

(declare-fun contains!1869 (List!3793 tuple2!4914) Bool)

(assert (=> b!256967 (= e!166567 (contains!1869 (toList!1929 lt!129130) (tuple2!4915 key!932 v!346)))))

(assert (= (and d!61739 res!125704) b!256966))

(assert (= (and b!256966 res!125705) b!256967))

(declare-fun m!272357 () Bool)

(assert (=> d!61739 m!272357))

(declare-fun m!272359 () Bool)

(assert (=> d!61739 m!272359))

(declare-fun m!272361 () Bool)

(assert (=> d!61739 m!272361))

(declare-fun m!272363 () Bool)

(assert (=> d!61739 m!272363))

(declare-fun m!272365 () Bool)

(assert (=> b!256966 m!272365))

(declare-fun m!272367 () Bool)

(assert (=> b!256967 m!272367))

(assert (=> b!256746 d!61739))

(declare-fun b!256976 () Bool)

(declare-fun e!166573 () (_ BitVec 32))

(declare-fun call!24375 () (_ BitVec 32))

(assert (=> b!256976 (= e!166573 call!24375)))

(declare-fun bm!24372 () Bool)

(assert (=> bm!24372 (= call!24375 (arrayCountValidKeys!0 (_keys!6901 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6274 (_keys!6901 thiss!1504))))))

(declare-fun b!256977 () Bool)

(declare-fun e!166572 () (_ BitVec 32))

(assert (=> b!256977 (= e!166572 #b00000000000000000000000000000000)))

(declare-fun b!256978 () Bool)

(assert (=> b!256978 (= e!166573 (bvadd #b00000000000000000000000000000001 call!24375))))

(declare-fun b!256979 () Bool)

(assert (=> b!256979 (= e!166572 e!166573)))

(declare-fun c!43466 () Bool)

(assert (=> b!256979 (= c!43466 (validKeyInArray!0 (select (arr!5927 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61741 () Bool)

(declare-fun lt!129136 () (_ BitVec 32))

(assert (=> d!61741 (and (bvsge lt!129136 #b00000000000000000000000000000000) (bvsle lt!129136 (bvsub (size!6274 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61741 (= lt!129136 e!166572)))

(declare-fun c!43467 () Bool)

(assert (=> d!61741 (= c!43467 (bvsge #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))))))

(assert (=> d!61741 (and (bvsle #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6274 (_keys!6901 thiss!1504)) (size!6274 (_keys!6901 thiss!1504))))))

(assert (=> d!61741 (= (arrayCountValidKeys!0 (_keys!6901 thiss!1504) #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))) lt!129136)))

(assert (= (and d!61741 c!43467) b!256977))

(assert (= (and d!61741 (not c!43467)) b!256979))

(assert (= (and b!256979 c!43466) b!256978))

(assert (= (and b!256979 (not c!43466)) b!256976))

(assert (= (or b!256978 b!256976) bm!24372))

(declare-fun m!272369 () Bool)

(assert (=> bm!24372 m!272369))

(assert (=> b!256979 m!272223))

(assert (=> b!256979 m!272223))

(assert (=> b!256979 m!272235))

(assert (=> b!256746 d!61741))

(declare-fun b!256990 () Bool)

(declare-fun e!166583 () Bool)

(declare-fun e!166584 () Bool)

(assert (=> b!256990 (= e!166583 e!166584)))

(declare-fun c!43470 () Bool)

(assert (=> b!256990 (= c!43470 (validKeyInArray!0 (select (arr!5927 lt!128951) #b00000000000000000000000000000000)))))

(declare-fun b!256991 () Bool)

(declare-fun e!166582 () Bool)

(declare-fun contains!1870 (List!3794 (_ BitVec 64)) Bool)

(assert (=> b!256991 (= e!166582 (contains!1870 Nil!3791 (select (arr!5927 lt!128951) #b00000000000000000000000000000000)))))

(declare-fun b!256992 () Bool)

(declare-fun e!166585 () Bool)

(assert (=> b!256992 (= e!166585 e!166583)))

(declare-fun res!125713 () Bool)

(assert (=> b!256992 (=> (not res!125713) (not e!166583))))

(assert (=> b!256992 (= res!125713 (not e!166582))))

(declare-fun res!125714 () Bool)

(assert (=> b!256992 (=> (not res!125714) (not e!166582))))

(assert (=> b!256992 (= res!125714 (validKeyInArray!0 (select (arr!5927 lt!128951) #b00000000000000000000000000000000)))))

(declare-fun b!256993 () Bool)

(declare-fun call!24378 () Bool)

(assert (=> b!256993 (= e!166584 call!24378)))

(declare-fun b!256994 () Bool)

(assert (=> b!256994 (= e!166584 call!24378)))

(declare-fun bm!24375 () Bool)

(assert (=> bm!24375 (= call!24378 (arrayNoDuplicates!0 lt!128951 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43470 (Cons!3790 (select (arr!5927 lt!128951) #b00000000000000000000000000000000) Nil!3791) Nil!3791)))))

(declare-fun d!61743 () Bool)

(declare-fun res!125712 () Bool)

(assert (=> d!61743 (=> res!125712 e!166585)))

(assert (=> d!61743 (= res!125712 (bvsge #b00000000000000000000000000000000 (size!6274 lt!128951)))))

(assert (=> d!61743 (= (arrayNoDuplicates!0 lt!128951 #b00000000000000000000000000000000 Nil!3791) e!166585)))

(assert (= (and d!61743 (not res!125712)) b!256992))

(assert (= (and b!256992 res!125714) b!256991))

(assert (= (and b!256992 res!125713) b!256990))

(assert (= (and b!256990 c!43470) b!256993))

(assert (= (and b!256990 (not c!43470)) b!256994))

(assert (= (or b!256993 b!256994) bm!24375))

(assert (=> b!256990 m!272285))

(assert (=> b!256990 m!272285))

(assert (=> b!256990 m!272293))

(assert (=> b!256991 m!272285))

(assert (=> b!256991 m!272285))

(declare-fun m!272371 () Bool)

(assert (=> b!256991 m!272371))

(assert (=> b!256992 m!272285))

(assert (=> b!256992 m!272285))

(assert (=> b!256992 m!272293))

(assert (=> bm!24375 m!272285))

(declare-fun m!272373 () Bool)

(assert (=> bm!24375 m!272373))

(assert (=> b!256746 d!61743))

(declare-fun d!61745 () Bool)

(assert (=> d!61745 (arrayContainsKey!0 lt!128951 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!129139 () Unit!7968)

(declare-fun choose!13 (array!12513 (_ BitVec 64) (_ BitVec 32)) Unit!7968)

(assert (=> d!61745 (= lt!129139 (choose!13 lt!128951 key!932 index!297))))

(assert (=> d!61745 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!61745 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128951 key!932 index!297) lt!129139)))

(declare-fun bs!9075 () Bool)

(assert (= bs!9075 d!61745))

(assert (=> bs!9075 m!272105))

(declare-fun m!272375 () Bool)

(assert (=> bs!9075 m!272375))

(assert (=> b!256746 d!61745))

(declare-fun d!61747 () Bool)

(declare-fun e!166588 () Bool)

(assert (=> d!61747 e!166588))

(declare-fun res!125717 () Bool)

(assert (=> d!61747 (=> (not res!125717) (not e!166588))))

(assert (=> d!61747 (= res!125717 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6901 thiss!1504)))))))

(declare-fun lt!129142 () Unit!7968)

(declare-fun choose!41 (array!12513 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3794) Unit!7968)

(assert (=> d!61747 (= lt!129142 (choose!41 (_keys!6901 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3791))))

(assert (=> d!61747 (bvslt (size!6274 (_keys!6901 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61747 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6901 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3791) lt!129142)))

(declare-fun b!256997 () Bool)

(assert (=> b!256997 (= e!166588 (arrayNoDuplicates!0 (array!12514 (store (arr!5927 (_keys!6901 thiss!1504)) index!297 key!932) (size!6274 (_keys!6901 thiss!1504))) #b00000000000000000000000000000000 Nil!3791))))

(assert (= (and d!61747 res!125717) b!256997))

(declare-fun m!272377 () Bool)

(assert (=> d!61747 m!272377))

(assert (=> b!256997 m!272097))

(declare-fun m!272379 () Bool)

(assert (=> b!256997 m!272379))

(assert (=> b!256746 d!61747))

(declare-fun d!61749 () Bool)

(declare-fun res!125718 () Bool)

(declare-fun e!166589 () Bool)

(assert (=> d!61749 (=> res!125718 e!166589)))

(assert (=> d!61749 (= res!125718 (= (select (arr!5927 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61749 (= (arrayContainsKey!0 (_keys!6901 thiss!1504) key!932 #b00000000000000000000000000000000) e!166589)))

(declare-fun b!256998 () Bool)

(declare-fun e!166590 () Bool)

(assert (=> b!256998 (= e!166589 e!166590)))

(declare-fun res!125719 () Bool)

(assert (=> b!256998 (=> (not res!125719) (not e!166590))))

(assert (=> b!256998 (= res!125719 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6274 (_keys!6901 thiss!1504))))))

(declare-fun b!256999 () Bool)

(assert (=> b!256999 (= e!166590 (arrayContainsKey!0 (_keys!6901 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61749 (not res!125718)) b!256998))

(assert (= (and b!256998 res!125719) b!256999))

(assert (=> d!61749 m!272223))

(declare-fun m!272381 () Bool)

(assert (=> b!256999 m!272381))

(assert (=> b!256746 d!61749))

(declare-fun d!61751 () Bool)

(declare-fun e!166593 () Bool)

(assert (=> d!61751 e!166593))

(declare-fun res!125722 () Bool)

(assert (=> d!61751 (=> (not res!125722) (not e!166593))))

(assert (=> d!61751 (= res!125722 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6901 thiss!1504)))))))

(declare-fun lt!129145 () Unit!7968)

(declare-fun choose!102 ((_ BitVec 64) array!12513 (_ BitVec 32) (_ BitVec 32)) Unit!7968)

(assert (=> d!61751 (= lt!129145 (choose!102 key!932 (_keys!6901 thiss!1504) index!297 (mask!11015 thiss!1504)))))

(assert (=> d!61751 (validMask!0 (mask!11015 thiss!1504))))

(assert (=> d!61751 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6901 thiss!1504) index!297 (mask!11015 thiss!1504)) lt!129145)))

(declare-fun b!257002 () Bool)

(assert (=> b!257002 (= e!166593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12514 (store (arr!5927 (_keys!6901 thiss!1504)) index!297 key!932) (size!6274 (_keys!6901 thiss!1504))) (mask!11015 thiss!1504)))))

(assert (= (and d!61751 res!125722) b!257002))

(declare-fun m!272383 () Bool)

(assert (=> d!61751 m!272383))

(assert (=> d!61751 m!272205))

(assert (=> b!257002 m!272097))

(declare-fun m!272385 () Bool)

(assert (=> b!257002 m!272385))

(assert (=> b!256746 d!61751))

(declare-fun d!61753 () Bool)

(declare-fun e!166596 () Bool)

(assert (=> d!61753 e!166596))

(declare-fun res!125725 () Bool)

(assert (=> d!61753 (=> (not res!125725) (not e!166596))))

(assert (=> d!61753 (= res!125725 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6274 (_keys!6901 thiss!1504))) (bvslt index!297 (size!6273 (_values!4720 thiss!1504)))))))

(declare-fun lt!129148 () Unit!7968)

(declare-fun choose!1233 (array!12513 array!12511 (_ BitVec 32) (_ BitVec 32) V!8427 V!8427 (_ BitVec 32) (_ BitVec 64) V!8427 Int) Unit!7968)

(assert (=> d!61753 (= lt!129148 (choose!1233 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) index!297 key!932 v!346 (defaultEntry!4737 thiss!1504)))))

(assert (=> d!61753 (validMask!0 (mask!11015 thiss!1504))))

(assert (=> d!61753 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!93 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) index!297 key!932 v!346 (defaultEntry!4737 thiss!1504)) lt!129148)))

(declare-fun b!257005 () Bool)

(assert (=> b!257005 (= e!166596 (= (+!683 (getCurrentListMap!1457 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)) (tuple2!4915 key!932 v!346)) (getCurrentListMap!1457 (array!12514 (store (arr!5927 (_keys!6901 thiss!1504)) index!297 key!932) (size!6274 (_keys!6901 thiss!1504))) (array!12512 (store (arr!5926 (_values!4720 thiss!1504)) index!297 (ValueCellFull!2949 v!346)) (size!6273 (_values!4720 thiss!1504))) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504))))))

(assert (= (and d!61753 res!125725) b!257005))

(declare-fun m!272387 () Bool)

(assert (=> d!61753 m!272387))

(assert (=> d!61753 m!272205))

(declare-fun m!272389 () Bool)

(assert (=> b!257005 m!272389))

(assert (=> b!257005 m!272091))

(assert (=> b!257005 m!272097))

(assert (=> b!257005 m!272119))

(declare-fun m!272391 () Bool)

(assert (=> b!257005 m!272391))

(assert (=> b!257005 m!272119))

(assert (=> b!256746 d!61753))

(declare-fun b!257006 () Bool)

(declare-fun e!166598 () (_ BitVec 32))

(declare-fun call!24379 () (_ BitVec 32))

(assert (=> b!257006 (= e!166598 call!24379)))

(declare-fun bm!24376 () Bool)

(assert (=> bm!24376 (= call!24379 (arrayCountValidKeys!0 lt!128951 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6274 (_keys!6901 thiss!1504))))))

(declare-fun b!257007 () Bool)

(declare-fun e!166597 () (_ BitVec 32))

(assert (=> b!257007 (= e!166597 #b00000000000000000000000000000000)))

(declare-fun b!257008 () Bool)

(assert (=> b!257008 (= e!166598 (bvadd #b00000000000000000000000000000001 call!24379))))

(declare-fun b!257009 () Bool)

(assert (=> b!257009 (= e!166597 e!166598)))

(declare-fun c!43471 () Bool)

(assert (=> b!257009 (= c!43471 (validKeyInArray!0 (select (arr!5927 lt!128951) #b00000000000000000000000000000000)))))

(declare-fun d!61755 () Bool)

(declare-fun lt!129149 () (_ BitVec 32))

(assert (=> d!61755 (and (bvsge lt!129149 #b00000000000000000000000000000000) (bvsle lt!129149 (bvsub (size!6274 lt!128951) #b00000000000000000000000000000000)))))

(assert (=> d!61755 (= lt!129149 e!166597)))

(declare-fun c!43472 () Bool)

(assert (=> d!61755 (= c!43472 (bvsge #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))))))

(assert (=> d!61755 (and (bvsle #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6274 (_keys!6901 thiss!1504)) (size!6274 lt!128951)))))

(assert (=> d!61755 (= (arrayCountValidKeys!0 lt!128951 #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))) lt!129149)))

(assert (= (and d!61755 c!43472) b!257007))

(assert (= (and d!61755 (not c!43472)) b!257009))

(assert (= (and b!257009 c!43471) b!257008))

(assert (= (and b!257009 (not c!43471)) b!257006))

(assert (= (or b!257008 b!257006) bm!24376))

(declare-fun m!272393 () Bool)

(assert (=> bm!24376 m!272393))

(assert (=> b!257009 m!272285))

(assert (=> b!257009 m!272285))

(assert (=> b!257009 m!272293))

(assert (=> b!256746 d!61755))

(declare-fun d!61757 () Bool)

(assert (=> d!61757 (= (array_inv!3917 (_keys!6901 thiss!1504)) (bvsge (size!6274 (_keys!6901 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256734 d!61757))

(declare-fun d!61759 () Bool)

(assert (=> d!61759 (= (array_inv!3918 (_values!4720 thiss!1504)) (bvsge (size!6273 (_values!4720 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256734 d!61759))

(declare-fun b!257026 () Bool)

(declare-fun e!166607 () Bool)

(declare-fun call!24384 () Bool)

(assert (=> b!257026 (= e!166607 (not call!24384))))

(declare-fun b!257027 () Bool)

(declare-fun e!166608 () Bool)

(assert (=> b!257027 (= e!166608 e!166607)))

(declare-fun res!125736 () Bool)

(declare-fun call!24385 () Bool)

(assert (=> b!257027 (= res!125736 call!24385)))

(assert (=> b!257027 (=> (not res!125736) (not e!166607))))

(declare-fun b!257028 () Bool)

(declare-fun e!166610 () Bool)

(assert (=> b!257028 (= e!166608 e!166610)))

(declare-fun c!43477 () Bool)

(declare-fun lt!129154 () SeekEntryResult!1165)

(assert (=> b!257028 (= c!43477 ((_ is MissingVacant!1165) lt!129154))))

(declare-fun bm!24381 () Bool)

(assert (=> bm!24381 (= call!24384 (arrayContainsKey!0 (_keys!6901 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!257029 () Bool)

(assert (=> b!257029 (and (bvsge (index!6830 lt!129154) #b00000000000000000000000000000000) (bvslt (index!6830 lt!129154) (size!6274 (_keys!6901 thiss!1504))))))

(declare-fun res!125734 () Bool)

(assert (=> b!257029 (= res!125734 (= (select (arr!5927 (_keys!6901 thiss!1504)) (index!6830 lt!129154)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257029 (=> (not res!125734) (not e!166607))))

(declare-fun c!43478 () Bool)

(declare-fun bm!24382 () Bool)

(assert (=> bm!24382 (= call!24385 (inRange!0 (ite c!43478 (index!6830 lt!129154) (index!6833 lt!129154)) (mask!11015 thiss!1504)))))

(declare-fun d!61761 () Bool)

(assert (=> d!61761 e!166608))

(assert (=> d!61761 (= c!43478 ((_ is MissingZero!1165) lt!129154))))

(assert (=> d!61761 (= lt!129154 (seekEntryOrOpen!0 key!932 (_keys!6901 thiss!1504) (mask!11015 thiss!1504)))))

(declare-fun lt!129155 () Unit!7968)

(declare-fun choose!1234 (array!12513 array!12511 (_ BitVec 32) (_ BitVec 32) V!8427 V!8427 (_ BitVec 64) Int) Unit!7968)

(assert (=> d!61761 (= lt!129155 (choose!1234 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) key!932 (defaultEntry!4737 thiss!1504)))))

(assert (=> d!61761 (validMask!0 (mask!11015 thiss!1504))))

(assert (=> d!61761 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!432 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) key!932 (defaultEntry!4737 thiss!1504)) lt!129155)))

(declare-fun b!257030 () Bool)

(assert (=> b!257030 (= e!166610 ((_ is Undefined!1165) lt!129154))))

(declare-fun b!257031 () Bool)

(declare-fun res!125735 () Bool)

(declare-fun e!166609 () Bool)

(assert (=> b!257031 (=> (not res!125735) (not e!166609))))

(assert (=> b!257031 (= res!125735 (= (select (arr!5927 (_keys!6901 thiss!1504)) (index!6833 lt!129154)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!257031 (and (bvsge (index!6833 lt!129154) #b00000000000000000000000000000000) (bvslt (index!6833 lt!129154) (size!6274 (_keys!6901 thiss!1504))))))

(declare-fun b!257032 () Bool)

(declare-fun res!125737 () Bool)

(assert (=> b!257032 (=> (not res!125737) (not e!166609))))

(assert (=> b!257032 (= res!125737 call!24385)))

(assert (=> b!257032 (= e!166610 e!166609)))

(declare-fun b!257033 () Bool)

(assert (=> b!257033 (= e!166609 (not call!24384))))

(assert (= (and d!61761 c!43478) b!257027))

(assert (= (and d!61761 (not c!43478)) b!257028))

(assert (= (and b!257027 res!125736) b!257029))

(assert (= (and b!257029 res!125734) b!257026))

(assert (= (and b!257028 c!43477) b!257032))

(assert (= (and b!257028 (not c!43477)) b!257030))

(assert (= (and b!257032 res!125737) b!257031))

(assert (= (and b!257031 res!125735) b!257033))

(assert (= (or b!257027 b!257032) bm!24382))

(assert (= (or b!257026 b!257033) bm!24381))

(declare-fun m!272395 () Bool)

(assert (=> bm!24382 m!272395))

(declare-fun m!272397 () Bool)

(assert (=> b!257029 m!272397))

(declare-fun m!272399 () Bool)

(assert (=> b!257031 m!272399))

(assert (=> d!61761 m!272075))

(declare-fun m!272401 () Bool)

(assert (=> d!61761 m!272401))

(assert (=> d!61761 m!272205))

(assert (=> bm!24381 m!272085))

(assert (=> b!256745 d!61761))

(declare-fun d!61763 () Bool)

(declare-fun res!125744 () Bool)

(declare-fun e!166613 () Bool)

(assert (=> d!61763 (=> (not res!125744) (not e!166613))))

(declare-fun simpleValid!275 (LongMapFixedSize!3798) Bool)

(assert (=> d!61763 (= res!125744 (simpleValid!275 thiss!1504))))

(assert (=> d!61763 (= (valid!1484 thiss!1504) e!166613)))

(declare-fun b!257040 () Bool)

(declare-fun res!125745 () Bool)

(assert (=> b!257040 (=> (not res!125745) (not e!166613))))

(assert (=> b!257040 (= res!125745 (= (arrayCountValidKeys!0 (_keys!6901 thiss!1504) #b00000000000000000000000000000000 (size!6274 (_keys!6901 thiss!1504))) (_size!1948 thiss!1504)))))

(declare-fun b!257041 () Bool)

(declare-fun res!125746 () Bool)

(assert (=> b!257041 (=> (not res!125746) (not e!166613))))

(assert (=> b!257041 (= res!125746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6901 thiss!1504) (mask!11015 thiss!1504)))))

(declare-fun b!257042 () Bool)

(assert (=> b!257042 (= e!166613 (arrayNoDuplicates!0 (_keys!6901 thiss!1504) #b00000000000000000000000000000000 Nil!3791))))

(assert (= (and d!61763 res!125744) b!257040))

(assert (= (and b!257040 res!125745) b!257041))

(assert (= (and b!257041 res!125746) b!257042))

(declare-fun m!272403 () Bool)

(assert (=> d!61763 m!272403))

(assert (=> b!257040 m!272109))

(declare-fun m!272405 () Bool)

(assert (=> b!257041 m!272405))

(declare-fun m!272407 () Bool)

(assert (=> b!257042 m!272407))

(assert (=> start!24512 d!61763))

(assert (=> bm!24332 d!61749))

(declare-fun d!61765 () Bool)

(assert (=> d!61765 (contains!1868 (getCurrentListMap!1457 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)) key!932)))

(declare-fun lt!129158 () Unit!7968)

(declare-fun choose!1235 (array!12513 array!12511 (_ BitVec 32) (_ BitVec 32) V!8427 V!8427 (_ BitVec 64) (_ BitVec 32) Int) Unit!7968)

(assert (=> d!61765 (= lt!129158 (choose!1235 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)))))

(assert (=> d!61765 (validMask!0 (mask!11015 thiss!1504))))

(assert (=> d!61765 (= (lemmaArrayContainsKeyThenInListMap!235 (_keys!6901 thiss!1504) (_values!4720 thiss!1504) (mask!11015 thiss!1504) (extraKeys!4474 thiss!1504) (zeroValue!4578 thiss!1504) (minValue!4578 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4737 thiss!1504)) lt!129158)))

(declare-fun bs!9076 () Bool)

(assert (= bs!9076 d!61765))

(assert (=> bs!9076 m!272119))

(assert (=> bs!9076 m!272119))

(declare-fun m!272409 () Bool)

(assert (=> bs!9076 m!272409))

(declare-fun m!272411 () Bool)

(assert (=> bs!9076 m!272411))

(assert (=> bs!9076 m!272205))

(assert (=> b!256727 d!61765))

(declare-fun b!257049 () Bool)

(declare-fun e!166618 () Bool)

(assert (=> b!257049 (= e!166618 tp_is_empty!6585)))

(declare-fun mapNonEmpty!11214 () Bool)

(declare-fun mapRes!11214 () Bool)

(declare-fun tp!23481 () Bool)

(assert (=> mapNonEmpty!11214 (= mapRes!11214 (and tp!23481 e!166618))))

(declare-fun mapKey!11214 () (_ BitVec 32))

(declare-fun mapRest!11214 () (Array (_ BitVec 32) ValueCell!2949))

(declare-fun mapValue!11214 () ValueCell!2949)

(assert (=> mapNonEmpty!11214 (= mapRest!11208 (store mapRest!11214 mapKey!11214 mapValue!11214))))

(declare-fun b!257050 () Bool)

(declare-fun e!166619 () Bool)

(assert (=> b!257050 (= e!166619 tp_is_empty!6585)))

(declare-fun mapIsEmpty!11214 () Bool)

(assert (=> mapIsEmpty!11214 mapRes!11214))

(declare-fun condMapEmpty!11214 () Bool)

(declare-fun mapDefault!11214 () ValueCell!2949)

(assert (=> mapNonEmpty!11208 (= condMapEmpty!11214 (= mapRest!11208 ((as const (Array (_ BitVec 32) ValueCell!2949)) mapDefault!11214)))))

(assert (=> mapNonEmpty!11208 (= tp!23472 (and e!166619 mapRes!11214))))

(assert (= (and mapNonEmpty!11208 condMapEmpty!11214) mapIsEmpty!11214))

(assert (= (and mapNonEmpty!11208 (not condMapEmpty!11214)) mapNonEmpty!11214))

(assert (= (and mapNonEmpty!11214 ((_ is ValueCellFull!2949) mapValue!11214)) b!257049))

(assert (= (and mapNonEmpty!11208 ((_ is ValueCellFull!2949) mapDefault!11214)) b!257050))

(declare-fun m!272413 () Bool)

(assert (=> mapNonEmpty!11214 m!272413))

(declare-fun b_lambda!8175 () Bool)

(assert (= b_lambda!8173 (or (and b!256734 b_free!6723) b_lambda!8175)))

(declare-fun b_lambda!8177 () Bool)

(assert (= b_lambda!8171 (or (and b!256734 b_free!6723) b_lambda!8177)))

(check-sat (not b!256909) (not b!256966) (not b!256933) (not bm!24364) (not mapNonEmpty!11214) (not bm!24367) (not d!61725) (not bm!24354) (not d!61761) (not b!257042) (not b!256837) (not b!256938) (not bm!24382) (not b!256900) (not d!61751) (not b!256886) (not bm!24372) (not d!61765) (not bm!24355) (not d!61739) (not b!256953) (not d!61745) (not b!256967) (not b!256892) (not bm!24358) (not b!256979) tp_is_empty!6585 (not b!256961) (not b_lambda!8175) (not b!256931) (not b!256955) (not b!256927) (not b!256941) (not b!257040) (not b!256888) (not bm!24365) (not b!256997) (not bm!24357) (not d!61733) (not b!257009) b_and!13791 (not d!61721) (not bm!24381) (not b!256839) (not b!256929) (not b!256896) (not b!256890) (not d!61735) (not b!257002) (not b!256999) (not b!256992) (not b!257005) (not b!256937) (not b!256990) (not d!61729) (not d!61747) (not b!256919) (not b!256897) (not bm!24375) (not b_lambda!8177) (not b!256936) (not bm!24362) (not d!61763) (not d!61753) (not d!61727) (not b!257041) (not b!256991) (not b_next!6723) (not bm!24376) (not b!256920) (not b!256952) (not b!256827) (not bm!24368) (not b!256895))
(check-sat b_and!13791 (not b_next!6723))
