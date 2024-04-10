; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22014 () Bool)

(assert start!22014)

(declare-fun b!226724 () Bool)

(declare-fun b_free!6081 () Bool)

(declare-fun b_next!6081 () Bool)

(assert (=> b!226724 (= b_free!6081 (not b_next!6081))))

(declare-fun tp!21385 () Bool)

(declare-fun b_and!12979 () Bool)

(assert (=> b!226724 (= tp!21385 b_and!12979)))

(declare-fun b!226702 () Bool)

(declare-fun e!147088 () Bool)

(assert (=> b!226702 (= e!147088 true)))

(declare-fun lt!114104 () Bool)

(declare-datatypes ((V!7571 0))(
  ( (V!7572 (val!3016 Int)) )
))
(declare-datatypes ((ValueCell!2628 0))(
  ( (ValueCellFull!2628 (v!5036 V!7571)) (EmptyCell!2628) )
))
(declare-datatypes ((array!11129 0))(
  ( (array!11130 (arr!5284 (Array (_ BitVec 32) ValueCell!2628)) (size!5617 (_ BitVec 32))) )
))
(declare-datatypes ((array!11131 0))(
  ( (array!11132 (arr!5285 (Array (_ BitVec 32) (_ BitVec 64))) (size!5618 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3156 0))(
  ( (LongMapFixedSize!3157 (defaultEntry!4237 Int) (mask!10091 (_ BitVec 32)) (extraKeys!3974 (_ BitVec 32)) (zeroValue!4078 V!7571) (minValue!4078 V!7571) (_size!1627 (_ BitVec 32)) (_keys!6291 array!11131) (_values!4220 array!11129) (_vacant!1627 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3156)

(declare-datatypes ((List!3378 0))(
  ( (Nil!3375) (Cons!3374 (h!4022 (_ BitVec 64)) (t!8337 List!3378)) )
))
(declare-fun arrayNoDuplicates!0 (array!11131 (_ BitVec 32) List!3378) Bool)

(assert (=> b!226702 (= lt!114104 (arrayNoDuplicates!0 (_keys!6291 thiss!1504) #b00000000000000000000000000000000 Nil!3375))))

(declare-fun b!226703 () Bool)

(declare-fun res!111605 () Bool)

(declare-fun e!147078 () Bool)

(assert (=> b!226703 (=> (not res!111605) (not e!147078))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!226703 (= res!111605 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226704 () Bool)

(declare-fun res!111616 () Bool)

(assert (=> b!226704 (=> res!111616 e!147088)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11131 (_ BitVec 32)) Bool)

(assert (=> b!226704 (= res!111616 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6291 thiss!1504) (mask!10091 thiss!1504))))))

(declare-fun b!226705 () Bool)

(declare-fun e!147086 () Bool)

(declare-fun call!21077 () Bool)

(assert (=> b!226705 (= e!147086 (not call!21077))))

(declare-fun b!226706 () Bool)

(declare-fun e!147075 () Bool)

(declare-fun tp_is_empty!5943 () Bool)

(assert (=> b!226706 (= e!147075 tp_is_empty!5943)))

(declare-fun b!226707 () Bool)

(declare-fun e!147085 () Bool)

(declare-fun e!147079 () Bool)

(assert (=> b!226707 (= e!147085 e!147079)))

(declare-fun res!111607 () Bool)

(assert (=> b!226707 (=> (not res!111607) (not e!147079))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226707 (= res!111607 (inRange!0 index!297 (mask!10091 thiss!1504)))))

(declare-datatypes ((Unit!6861 0))(
  ( (Unit!6862) )
))
(declare-fun lt!114108 () Unit!6861)

(declare-fun e!147076 () Unit!6861)

(assert (=> b!226707 (= lt!114108 e!147076)))

(declare-fun c!37582 () Bool)

(declare-datatypes ((tuple2!4460 0))(
  ( (tuple2!4461 (_1!2241 (_ BitVec 64)) (_2!2241 V!7571)) )
))
(declare-datatypes ((List!3379 0))(
  ( (Nil!3376) (Cons!3375 (h!4023 tuple2!4460) (t!8338 List!3379)) )
))
(declare-datatypes ((ListLongMap!3373 0))(
  ( (ListLongMap!3374 (toList!1702 List!3379)) )
))
(declare-fun contains!1576 (ListLongMap!3373 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1230 (array!11131 array!11129 (_ BitVec 32) (_ BitVec 32) V!7571 V!7571 (_ BitVec 32) Int) ListLongMap!3373)

(assert (=> b!226707 (= c!37582 (contains!1576 (getCurrentListMap!1230 (_keys!6291 thiss!1504) (_values!4220 thiss!1504) (mask!10091 thiss!1504) (extraKeys!3974 thiss!1504) (zeroValue!4078 thiss!1504) (minValue!4078 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4237 thiss!1504)) key!932))))

(declare-fun bm!21074 () Bool)

(declare-fun arrayContainsKey!0 (array!11131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21074 (= call!21077 (arrayContainsKey!0 (_keys!6291 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226708 () Bool)

(declare-fun e!147087 () Bool)

(assert (=> b!226708 (= e!147087 tp_is_empty!5943)))

(declare-fun b!226709 () Bool)

(declare-fun e!147084 () Bool)

(assert (=> b!226709 (= e!147084 e!147086)))

(declare-fun res!111613 () Bool)

(declare-fun call!21078 () Bool)

(assert (=> b!226709 (= res!111613 call!21078)))

(assert (=> b!226709 (=> (not res!111613) (not e!147086))))

(declare-fun b!226710 () Bool)

(declare-fun res!111608 () Bool)

(declare-fun e!147077 () Bool)

(assert (=> b!226710 (=> (not res!111608) (not e!147077))))

(assert (=> b!226710 (= res!111608 call!21078)))

(declare-fun e!147082 () Bool)

(assert (=> b!226710 (= e!147082 e!147077)))

(declare-fun b!226711 () Bool)

(declare-fun Unit!6863 () Unit!6861)

(assert (=> b!226711 (= e!147076 Unit!6863)))

(declare-fun lt!114105 () Unit!6861)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!258 (array!11131 array!11129 (_ BitVec 32) (_ BitVec 32) V!7571 V!7571 (_ BitVec 64) Int) Unit!6861)

(assert (=> b!226711 (= lt!114105 (lemmaInListMapThenSeekEntryOrOpenFindsIt!258 (_keys!6291 thiss!1504) (_values!4220 thiss!1504) (mask!10091 thiss!1504) (extraKeys!3974 thiss!1504) (zeroValue!4078 thiss!1504) (minValue!4078 thiss!1504) key!932 (defaultEntry!4237 thiss!1504)))))

(assert (=> b!226711 false))

(declare-fun b!226712 () Bool)

(declare-fun res!111606 () Bool)

(assert (=> b!226712 (=> (not res!111606) (not e!147077))))

(declare-datatypes ((SeekEntryResult!886 0))(
  ( (MissingZero!886 (index!5714 (_ BitVec 32))) (Found!886 (index!5715 (_ BitVec 32))) (Intermediate!886 (undefined!1698 Bool) (index!5716 (_ BitVec 32)) (x!23242 (_ BitVec 32))) (Undefined!886) (MissingVacant!886 (index!5717 (_ BitVec 32))) )
))
(declare-fun lt!114109 () SeekEntryResult!886)

(assert (=> b!226712 (= res!111606 (= (select (arr!5285 (_keys!6291 thiss!1504)) (index!5714 lt!114109)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226713 () Bool)

(declare-fun lt!114106 () Unit!6861)

(assert (=> b!226713 (= e!147076 lt!114106)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!272 (array!11131 array!11129 (_ BitVec 32) (_ BitVec 32) V!7571 V!7571 (_ BitVec 64) Int) Unit!6861)

(assert (=> b!226713 (= lt!114106 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!272 (_keys!6291 thiss!1504) (_values!4220 thiss!1504) (mask!10091 thiss!1504) (extraKeys!3974 thiss!1504) (zeroValue!4078 thiss!1504) (minValue!4078 thiss!1504) key!932 (defaultEntry!4237 thiss!1504)))))

(declare-fun c!37581 () Bool)

(get-info :version)

(assert (=> b!226713 (= c!37581 ((_ is MissingZero!886) lt!114109))))

(assert (=> b!226713 e!147082))

(declare-fun b!226714 () Bool)

(declare-fun res!111604 () Bool)

(assert (=> b!226714 (=> res!111604 e!147088)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226714 (= res!111604 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226715 () Bool)

(assert (=> b!226715 (= e!147079 (not e!147088))))

(declare-fun res!111614 () Bool)

(assert (=> b!226715 (=> res!111614 e!147088)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226715 (= res!111614 (not (validMask!0 (mask!10091 thiss!1504))))))

(declare-fun lt!114101 () array!11131)

(declare-fun arrayCountValidKeys!0 (array!11131 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226715 (= (arrayCountValidKeys!0 lt!114101 #b00000000000000000000000000000000 (size!5618 (_keys!6291 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6291 thiss!1504) #b00000000000000000000000000000000 (size!5618 (_keys!6291 thiss!1504)))))))

(declare-fun lt!114107 () Unit!6861)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11131 (_ BitVec 32) (_ BitVec 64)) Unit!6861)

(assert (=> b!226715 (= lt!114107 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6291 thiss!1504) index!297 key!932))))

(assert (=> b!226715 (arrayNoDuplicates!0 lt!114101 #b00000000000000000000000000000000 Nil!3375)))

(assert (=> b!226715 (= lt!114101 (array!11132 (store (arr!5285 (_keys!6291 thiss!1504)) index!297 key!932) (size!5618 (_keys!6291 thiss!1504))))))

(declare-fun lt!114110 () Unit!6861)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11131 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3378) Unit!6861)

(assert (=> b!226715 (= lt!114110 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6291 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3375))))

(declare-fun lt!114103 () Unit!6861)

(declare-fun e!147081 () Unit!6861)

(assert (=> b!226715 (= lt!114103 e!147081)))

(declare-fun c!37583 () Bool)

(declare-fun lt!114102 () Bool)

(assert (=> b!226715 (= c!37583 lt!114102)))

(assert (=> b!226715 (= lt!114102 (arrayContainsKey!0 (_keys!6291 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!111610 () Bool)

(assert (=> start!22014 (=> (not res!111610) (not e!147078))))

(declare-fun valid!1269 (LongMapFixedSize!3156) Bool)

(assert (=> start!22014 (= res!111610 (valid!1269 thiss!1504))))

(assert (=> start!22014 e!147078))

(declare-fun e!147080 () Bool)

(assert (=> start!22014 e!147080))

(assert (=> start!22014 true))

(declare-fun b!226716 () Bool)

(declare-fun c!37584 () Bool)

(assert (=> b!226716 (= c!37584 ((_ is MissingVacant!886) lt!114109))))

(assert (=> b!226716 (= e!147082 e!147084)))

(declare-fun mapNonEmpty!10084 () Bool)

(declare-fun mapRes!10084 () Bool)

(declare-fun tp!21384 () Bool)

(assert (=> mapNonEmpty!10084 (= mapRes!10084 (and tp!21384 e!147075))))

(declare-fun mapValue!10084 () ValueCell!2628)

(declare-fun mapKey!10084 () (_ BitVec 32))

(declare-fun mapRest!10084 () (Array (_ BitVec 32) ValueCell!2628))

(assert (=> mapNonEmpty!10084 (= (arr!5284 (_values!4220 thiss!1504)) (store mapRest!10084 mapKey!10084 mapValue!10084))))

(declare-fun b!226717 () Bool)

(declare-fun e!147083 () Bool)

(assert (=> b!226717 (= e!147083 (and e!147087 mapRes!10084))))

(declare-fun condMapEmpty!10084 () Bool)

(declare-fun mapDefault!10084 () ValueCell!2628)

(assert (=> b!226717 (= condMapEmpty!10084 (= (arr!5284 (_values!4220 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2628)) mapDefault!10084)))))

(declare-fun b!226718 () Bool)

(declare-fun res!111615 () Bool)

(assert (=> b!226718 (= res!111615 (= (select (arr!5285 (_keys!6291 thiss!1504)) (index!5717 lt!114109)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226718 (=> (not res!111615) (not e!147086))))

(declare-fun b!226719 () Bool)

(declare-fun Unit!6864 () Unit!6861)

(assert (=> b!226719 (= e!147081 Unit!6864)))

(declare-fun b!226720 () Bool)

(assert (=> b!226720 (= e!147078 e!147085)))

(declare-fun res!111612 () Bool)

(assert (=> b!226720 (=> (not res!111612) (not e!147085))))

(assert (=> b!226720 (= res!111612 (or (= lt!114109 (MissingZero!886 index!297)) (= lt!114109 (MissingVacant!886 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11131 (_ BitVec 32)) SeekEntryResult!886)

(assert (=> b!226720 (= lt!114109 (seekEntryOrOpen!0 key!932 (_keys!6291 thiss!1504) (mask!10091 thiss!1504)))))

(declare-fun b!226721 () Bool)

(declare-fun Unit!6865 () Unit!6861)

(assert (=> b!226721 (= e!147081 Unit!6865)))

(declare-fun lt!114100 () Unit!6861)

(declare-fun lemmaArrayContainsKeyThenInListMap!97 (array!11131 array!11129 (_ BitVec 32) (_ BitVec 32) V!7571 V!7571 (_ BitVec 64) (_ BitVec 32) Int) Unit!6861)

(assert (=> b!226721 (= lt!114100 (lemmaArrayContainsKeyThenInListMap!97 (_keys!6291 thiss!1504) (_values!4220 thiss!1504) (mask!10091 thiss!1504) (extraKeys!3974 thiss!1504) (zeroValue!4078 thiss!1504) (minValue!4078 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4237 thiss!1504)))))

(assert (=> b!226721 false))

(declare-fun mapIsEmpty!10084 () Bool)

(assert (=> mapIsEmpty!10084 mapRes!10084))

(declare-fun b!226722 () Bool)

(declare-fun res!111609 () Bool)

(assert (=> b!226722 (=> res!111609 e!147088)))

(assert (=> b!226722 (= res!111609 lt!114102)))

(declare-fun b!226723 () Bool)

(assert (=> b!226723 (= e!147084 ((_ is Undefined!886) lt!114109))))

(declare-fun array_inv!3493 (array!11131) Bool)

(declare-fun array_inv!3494 (array!11129) Bool)

(assert (=> b!226724 (= e!147080 (and tp!21385 tp_is_empty!5943 (array_inv!3493 (_keys!6291 thiss!1504)) (array_inv!3494 (_values!4220 thiss!1504)) e!147083))))

(declare-fun b!226725 () Bool)

(declare-fun res!111611 () Bool)

(assert (=> b!226725 (=> res!111611 e!147088)))

(assert (=> b!226725 (= res!111611 (or (not (= (size!5618 (_keys!6291 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10091 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5618 (_keys!6291 thiss!1504)))))))

(declare-fun b!226726 () Bool)

(assert (=> b!226726 (= e!147077 (not call!21077))))

(declare-fun bm!21075 () Bool)

(assert (=> bm!21075 (= call!21078 (inRange!0 (ite c!37581 (index!5714 lt!114109) (index!5717 lt!114109)) (mask!10091 thiss!1504)))))

(assert (= (and start!22014 res!111610) b!226703))

(assert (= (and b!226703 res!111605) b!226720))

(assert (= (and b!226720 res!111612) b!226707))

(assert (= (and b!226707 c!37582) b!226711))

(assert (= (and b!226707 (not c!37582)) b!226713))

(assert (= (and b!226713 c!37581) b!226710))

(assert (= (and b!226713 (not c!37581)) b!226716))

(assert (= (and b!226710 res!111608) b!226712))

(assert (= (and b!226712 res!111606) b!226726))

(assert (= (and b!226716 c!37584) b!226709))

(assert (= (and b!226716 (not c!37584)) b!226723))

(assert (= (and b!226709 res!111613) b!226718))

(assert (= (and b!226718 res!111615) b!226705))

(assert (= (or b!226710 b!226709) bm!21075))

(assert (= (or b!226726 b!226705) bm!21074))

(assert (= (and b!226707 res!111607) b!226715))

(assert (= (and b!226715 c!37583) b!226721))

(assert (= (and b!226715 (not c!37583)) b!226719))

(assert (= (and b!226715 (not res!111614)) b!226725))

(assert (= (and b!226725 (not res!111611)) b!226714))

(assert (= (and b!226714 (not res!111604)) b!226722))

(assert (= (and b!226722 (not res!111609)) b!226704))

(assert (= (and b!226704 (not res!111616)) b!226702))

(assert (= (and b!226717 condMapEmpty!10084) mapIsEmpty!10084))

(assert (= (and b!226717 (not condMapEmpty!10084)) mapNonEmpty!10084))

(assert (= (and mapNonEmpty!10084 ((_ is ValueCellFull!2628) mapValue!10084)) b!226706))

(assert (= (and b!226717 ((_ is ValueCellFull!2628) mapDefault!10084)) b!226708))

(assert (= b!226724 b!226717))

(assert (= start!22014 b!226724))

(declare-fun m!248899 () Bool)

(assert (=> b!226715 m!248899))

(declare-fun m!248901 () Bool)

(assert (=> b!226715 m!248901))

(declare-fun m!248903 () Bool)

(assert (=> b!226715 m!248903))

(declare-fun m!248905 () Bool)

(assert (=> b!226715 m!248905))

(declare-fun m!248907 () Bool)

(assert (=> b!226715 m!248907))

(declare-fun m!248909 () Bool)

(assert (=> b!226715 m!248909))

(declare-fun m!248911 () Bool)

(assert (=> b!226715 m!248911))

(declare-fun m!248913 () Bool)

(assert (=> b!226715 m!248913))

(assert (=> bm!21074 m!248901))

(declare-fun m!248915 () Bool)

(assert (=> b!226707 m!248915))

(declare-fun m!248917 () Bool)

(assert (=> b!226707 m!248917))

(assert (=> b!226707 m!248917))

(declare-fun m!248919 () Bool)

(assert (=> b!226707 m!248919))

(declare-fun m!248921 () Bool)

(assert (=> b!226713 m!248921))

(declare-fun m!248923 () Bool)

(assert (=> mapNonEmpty!10084 m!248923))

(declare-fun m!248925 () Bool)

(assert (=> b!226702 m!248925))

(declare-fun m!248927 () Bool)

(assert (=> b!226704 m!248927))

(declare-fun m!248929 () Bool)

(assert (=> b!226714 m!248929))

(declare-fun m!248931 () Bool)

(assert (=> bm!21075 m!248931))

(declare-fun m!248933 () Bool)

(assert (=> b!226718 m!248933))

(declare-fun m!248935 () Bool)

(assert (=> start!22014 m!248935))

(declare-fun m!248937 () Bool)

(assert (=> b!226711 m!248937))

(declare-fun m!248939 () Bool)

(assert (=> b!226720 m!248939))

(declare-fun m!248941 () Bool)

(assert (=> b!226712 m!248941))

(declare-fun m!248943 () Bool)

(assert (=> b!226721 m!248943))

(declare-fun m!248945 () Bool)

(assert (=> b!226724 m!248945))

(declare-fun m!248947 () Bool)

(assert (=> b!226724 m!248947))

(check-sat (not bm!21074) (not b!226715) (not b!226707) tp_is_empty!5943 (not start!22014) (not bm!21075) (not b_next!6081) (not b!226721) (not mapNonEmpty!10084) (not b!226713) (not b!226724) (not b!226702) (not b!226704) (not b!226714) (not b!226711) b_and!12979 (not b!226720))
(check-sat b_and!12979 (not b_next!6081))
