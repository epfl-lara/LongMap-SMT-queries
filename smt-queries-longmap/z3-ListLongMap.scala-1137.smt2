; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23488 () Bool)

(assert start!23488)

(declare-fun b!246723 () Bool)

(declare-fun b_free!6573 () Bool)

(declare-fun b_next!6573 () Bool)

(assert (=> b!246723 (= b_free!6573 (not b_next!6573))))

(declare-fun tp!22961 () Bool)

(declare-fun b_and!13571 () Bool)

(assert (=> b!246723 (= tp!22961 b_and!13571)))

(declare-fun b!246709 () Bool)

(declare-fun e!160054 () Bool)

(declare-fun e!160058 () Bool)

(assert (=> b!246709 (= e!160054 e!160058)))

(declare-fun res!120954 () Bool)

(assert (=> b!246709 (=> (not res!120954) (not e!160058))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8227 0))(
  ( (V!8228 (val!3262 Int)) )
))
(declare-datatypes ((ValueCell!2874 0))(
  ( (ValueCellFull!2874 (v!5318 V!8227)) (EmptyCell!2874) )
))
(declare-datatypes ((array!12173 0))(
  ( (array!12174 (arr!5776 (Array (_ BitVec 32) ValueCell!2874)) (size!6119 (_ BitVec 32))) )
))
(declare-datatypes ((array!12175 0))(
  ( (array!12176 (arr!5777 (Array (_ BitVec 32) (_ BitVec 64))) (size!6120 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3648 0))(
  ( (LongMapFixedSize!3649 (defaultEntry!4565 Int) (mask!10693 (_ BitVec 32)) (extraKeys!4302 (_ BitVec 32)) (zeroValue!4406 V!8227) (minValue!4406 V!8227) (_size!1873 (_ BitVec 32)) (_keys!6685 array!12175) (_values!4548 array!12173) (_vacant!1873 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3648)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246709 (= res!120954 (inRange!0 index!297 (mask!10693 thiss!1504)))))

(declare-datatypes ((Unit!7619 0))(
  ( (Unit!7620) )
))
(declare-fun lt!123560 () Unit!7619)

(declare-fun e!160051 () Unit!7619)

(assert (=> b!246709 (= lt!123560 e!160051)))

(declare-fun c!41270 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4800 0))(
  ( (tuple2!4801 (_1!2411 (_ BitVec 64)) (_2!2411 V!8227)) )
))
(declare-datatypes ((List!3681 0))(
  ( (Nil!3678) (Cons!3677 (h!4335 tuple2!4800) (t!8700 List!3681)) )
))
(declare-datatypes ((ListLongMap!3713 0))(
  ( (ListLongMap!3714 (toList!1872 List!3681)) )
))
(declare-fun contains!1784 (ListLongMap!3713 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1400 (array!12175 array!12173 (_ BitVec 32) (_ BitVec 32) V!8227 V!8227 (_ BitVec 32) Int) ListLongMap!3713)

(assert (=> b!246709 (= c!41270 (contains!1784 (getCurrentListMap!1400 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)) key!932))))

(declare-fun b!246710 () Bool)

(declare-fun res!120957 () Bool)

(declare-fun e!160049 () Bool)

(assert (=> b!246710 (=> (not res!120957) (not e!160049))))

(assert (=> b!246710 (= res!120957 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246711 () Bool)

(declare-fun e!160056 () Bool)

(declare-fun e!160047 () Bool)

(assert (=> b!246711 (= e!160056 e!160047)))

(declare-fun res!120956 () Bool)

(declare-fun call!23072 () Bool)

(assert (=> b!246711 (= res!120956 call!23072)))

(assert (=> b!246711 (=> (not res!120956) (not e!160047))))

(declare-fun b!246712 () Bool)

(declare-fun res!120953 () Bool)

(declare-fun e!160052 () Bool)

(assert (=> b!246712 (=> (not res!120953) (not e!160052))))

(assert (=> b!246712 (= res!120953 call!23072)))

(declare-fun e!160061 () Bool)

(assert (=> b!246712 (= e!160061 e!160052)))

(declare-fun mapIsEmpty!10922 () Bool)

(declare-fun mapRes!10922 () Bool)

(assert (=> mapIsEmpty!10922 mapRes!10922))

(declare-fun b!246713 () Bool)

(declare-fun e!160057 () Bool)

(assert (=> b!246713 (= e!160057 (or (not (= (size!6120 (_keys!6685 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10693 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6120 (_keys!6685 thiss!1504)))))))

(declare-fun b!246714 () Bool)

(declare-fun e!160048 () Bool)

(declare-fun tp_is_empty!6435 () Bool)

(assert (=> b!246714 (= e!160048 tp_is_empty!6435)))

(declare-fun b!246715 () Bool)

(declare-fun call!23073 () Bool)

(assert (=> b!246715 (= e!160052 (not call!23073))))

(declare-fun b!246716 () Bool)

(declare-fun lt!123567 () Unit!7619)

(assert (=> b!246716 (= e!160051 lt!123567)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!382 (array!12175 array!12173 (_ BitVec 32) (_ BitVec 32) V!8227 V!8227 (_ BitVec 64) Int) Unit!7619)

(assert (=> b!246716 (= lt!123567 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!382 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) key!932 (defaultEntry!4565 thiss!1504)))))

(declare-fun c!41269 () Bool)

(declare-datatypes ((SeekEntryResult!1096 0))(
  ( (MissingZero!1096 (index!6554 (_ BitVec 32))) (Found!1096 (index!6555 (_ BitVec 32))) (Intermediate!1096 (undefined!1908 Bool) (index!6556 (_ BitVec 32)) (x!24488 (_ BitVec 32))) (Undefined!1096) (MissingVacant!1096 (index!6557 (_ BitVec 32))) )
))
(declare-fun lt!123568 () SeekEntryResult!1096)

(get-info :version)

(assert (=> b!246716 (= c!41269 ((_ is MissingZero!1096) lt!123568))))

(assert (=> b!246716 e!160061))

(declare-fun b!246717 () Bool)

(declare-fun e!160060 () Bool)

(assert (=> b!246717 (= e!160060 tp_is_empty!6435)))

(declare-fun b!246718 () Bool)

(assert (=> b!246718 (= e!160047 (not call!23073))))

(declare-fun b!246720 () Bool)

(assert (=> b!246720 (= e!160058 (not e!160057))))

(declare-fun res!120955 () Bool)

(assert (=> b!246720 (=> res!120955 e!160057)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!246720 (= res!120955 (not (validMask!0 (mask!10693 thiss!1504))))))

(declare-fun lt!123564 () array!12175)

(declare-fun arrayCountValidKeys!0 (array!12175 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!246720 (= (arrayCountValidKeys!0 lt!123564 #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6685 thiss!1504) #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504)))))))

(declare-fun lt!123566 () Unit!7619)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12175 (_ BitVec 32) (_ BitVec 64)) Unit!7619)

(assert (=> b!246720 (= lt!123566 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6685 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3682 0))(
  ( (Nil!3679) (Cons!3678 (h!4336 (_ BitVec 64)) (t!8701 List!3682)) )
))
(declare-fun arrayNoDuplicates!0 (array!12175 (_ BitVec 32) List!3682) Bool)

(assert (=> b!246720 (arrayNoDuplicates!0 lt!123564 #b00000000000000000000000000000000 Nil!3679)))

(assert (=> b!246720 (= lt!123564 (array!12176 (store (arr!5777 (_keys!6685 thiss!1504)) index!297 key!932) (size!6120 (_keys!6685 thiss!1504))))))

(declare-fun lt!123563 () Unit!7619)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12175 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3682) Unit!7619)

(assert (=> b!246720 (= lt!123563 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6685 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3679))))

(declare-fun lt!123565 () Unit!7619)

(declare-fun e!160053 () Unit!7619)

(assert (=> b!246720 (= lt!123565 e!160053)))

(declare-fun c!41272 () Bool)

(declare-fun arrayContainsKey!0 (array!12175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!246720 (= c!41272 (arrayContainsKey!0 (_keys!6685 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10922 () Bool)

(declare-fun tp!22960 () Bool)

(assert (=> mapNonEmpty!10922 (= mapRes!10922 (and tp!22960 e!160048))))

(declare-fun mapRest!10922 () (Array (_ BitVec 32) ValueCell!2874))

(declare-fun mapValue!10922 () ValueCell!2874)

(declare-fun mapKey!10922 () (_ BitVec 32))

(assert (=> mapNonEmpty!10922 (= (arr!5776 (_values!4548 thiss!1504)) (store mapRest!10922 mapKey!10922 mapValue!10922))))

(declare-fun b!246721 () Bool)

(declare-fun Unit!7621 () Unit!7619)

(assert (=> b!246721 (= e!160051 Unit!7621)))

(declare-fun lt!123562 () Unit!7619)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!377 (array!12175 array!12173 (_ BitVec 32) (_ BitVec 32) V!8227 V!8227 (_ BitVec 64) Int) Unit!7619)

(assert (=> b!246721 (= lt!123562 (lemmaInListMapThenSeekEntryOrOpenFindsIt!377 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) key!932 (defaultEntry!4565 thiss!1504)))))

(assert (=> b!246721 false))

(declare-fun b!246722 () Bool)

(assert (=> b!246722 (= e!160056 ((_ is Undefined!1096) lt!123568))))

(declare-fun e!160059 () Bool)

(declare-fun e!160050 () Bool)

(declare-fun array_inv!3815 (array!12175) Bool)

(declare-fun array_inv!3816 (array!12173) Bool)

(assert (=> b!246723 (= e!160059 (and tp!22961 tp_is_empty!6435 (array_inv!3815 (_keys!6685 thiss!1504)) (array_inv!3816 (_values!4548 thiss!1504)) e!160050))))

(declare-fun bm!23069 () Bool)

(assert (=> bm!23069 (= call!23073 (arrayContainsKey!0 (_keys!6685 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246724 () Bool)

(assert (=> b!246724 (= e!160049 e!160054)))

(declare-fun res!120961 () Bool)

(assert (=> b!246724 (=> (not res!120961) (not e!160054))))

(assert (=> b!246724 (= res!120961 (or (= lt!123568 (MissingZero!1096 index!297)) (= lt!123568 (MissingVacant!1096 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12175 (_ BitVec 32)) SeekEntryResult!1096)

(assert (=> b!246724 (= lt!123568 (seekEntryOrOpen!0 key!932 (_keys!6685 thiss!1504) (mask!10693 thiss!1504)))))

(declare-fun b!246725 () Bool)

(declare-fun res!120958 () Bool)

(assert (=> b!246725 (= res!120958 (= (select (arr!5777 (_keys!6685 thiss!1504)) (index!6557 lt!123568)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246725 (=> (not res!120958) (not e!160047))))

(declare-fun b!246726 () Bool)

(declare-fun Unit!7622 () Unit!7619)

(assert (=> b!246726 (= e!160053 Unit!7622)))

(declare-fun b!246727 () Bool)

(assert (=> b!246727 (= e!160050 (and e!160060 mapRes!10922))))

(declare-fun condMapEmpty!10922 () Bool)

(declare-fun mapDefault!10922 () ValueCell!2874)

(assert (=> b!246727 (= condMapEmpty!10922 (= (arr!5776 (_values!4548 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2874)) mapDefault!10922)))))

(declare-fun b!246728 () Bool)

(declare-fun c!41271 () Bool)

(assert (=> b!246728 (= c!41271 ((_ is MissingVacant!1096) lt!123568))))

(assert (=> b!246728 (= e!160061 e!160056)))

(declare-fun b!246719 () Bool)

(declare-fun res!120960 () Bool)

(assert (=> b!246719 (=> (not res!120960) (not e!160052))))

(assert (=> b!246719 (= res!120960 (= (select (arr!5777 (_keys!6685 thiss!1504)) (index!6554 lt!123568)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!120959 () Bool)

(assert (=> start!23488 (=> (not res!120959) (not e!160049))))

(declare-fun valid!1427 (LongMapFixedSize!3648) Bool)

(assert (=> start!23488 (= res!120959 (valid!1427 thiss!1504))))

(assert (=> start!23488 e!160049))

(assert (=> start!23488 e!160059))

(assert (=> start!23488 true))

(declare-fun b!246729 () Bool)

(declare-fun Unit!7623 () Unit!7619)

(assert (=> b!246729 (= e!160053 Unit!7623)))

(declare-fun lt!123561 () Unit!7619)

(declare-fun lemmaArrayContainsKeyThenInListMap!181 (array!12175 array!12173 (_ BitVec 32) (_ BitVec 32) V!8227 V!8227 (_ BitVec 64) (_ BitVec 32) Int) Unit!7619)

(assert (=> b!246729 (= lt!123561 (lemmaArrayContainsKeyThenInListMap!181 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)))))

(assert (=> b!246729 false))

(declare-fun bm!23070 () Bool)

(assert (=> bm!23070 (= call!23072 (inRange!0 (ite c!41269 (index!6554 lt!123568) (index!6557 lt!123568)) (mask!10693 thiss!1504)))))

(assert (= (and start!23488 res!120959) b!246710))

(assert (= (and b!246710 res!120957) b!246724))

(assert (= (and b!246724 res!120961) b!246709))

(assert (= (and b!246709 c!41270) b!246721))

(assert (= (and b!246709 (not c!41270)) b!246716))

(assert (= (and b!246716 c!41269) b!246712))

(assert (= (and b!246716 (not c!41269)) b!246728))

(assert (= (and b!246712 res!120953) b!246719))

(assert (= (and b!246719 res!120960) b!246715))

(assert (= (and b!246728 c!41271) b!246711))

(assert (= (and b!246728 (not c!41271)) b!246722))

(assert (= (and b!246711 res!120956) b!246725))

(assert (= (and b!246725 res!120958) b!246718))

(assert (= (or b!246712 b!246711) bm!23070))

(assert (= (or b!246715 b!246718) bm!23069))

(assert (= (and b!246709 res!120954) b!246720))

(assert (= (and b!246720 c!41272) b!246729))

(assert (= (and b!246720 (not c!41272)) b!246726))

(assert (= (and b!246720 (not res!120955)) b!246713))

(assert (= (and b!246727 condMapEmpty!10922) mapIsEmpty!10922))

(assert (= (and b!246727 (not condMapEmpty!10922)) mapNonEmpty!10922))

(assert (= (and mapNonEmpty!10922 ((_ is ValueCellFull!2874) mapValue!10922)) b!246714))

(assert (= (and b!246727 ((_ is ValueCellFull!2874) mapDefault!10922)) b!246717))

(assert (= b!246723 b!246727))

(assert (= start!23488 b!246723))

(declare-fun m!264005 () Bool)

(assert (=> b!246725 m!264005))

(declare-fun m!264007 () Bool)

(assert (=> b!246724 m!264007))

(declare-fun m!264009 () Bool)

(assert (=> bm!23070 m!264009))

(declare-fun m!264011 () Bool)

(assert (=> b!246720 m!264011))

(declare-fun m!264013 () Bool)

(assert (=> b!246720 m!264013))

(declare-fun m!264015 () Bool)

(assert (=> b!246720 m!264015))

(declare-fun m!264017 () Bool)

(assert (=> b!246720 m!264017))

(declare-fun m!264019 () Bool)

(assert (=> b!246720 m!264019))

(declare-fun m!264021 () Bool)

(assert (=> b!246720 m!264021))

(declare-fun m!264023 () Bool)

(assert (=> b!246720 m!264023))

(declare-fun m!264025 () Bool)

(assert (=> b!246720 m!264025))

(declare-fun m!264027 () Bool)

(assert (=> start!23488 m!264027))

(declare-fun m!264029 () Bool)

(assert (=> b!246723 m!264029))

(declare-fun m!264031 () Bool)

(assert (=> b!246723 m!264031))

(declare-fun m!264033 () Bool)

(assert (=> mapNonEmpty!10922 m!264033))

(declare-fun m!264035 () Bool)

(assert (=> b!246729 m!264035))

(declare-fun m!264037 () Bool)

(assert (=> b!246719 m!264037))

(declare-fun m!264039 () Bool)

(assert (=> b!246721 m!264039))

(assert (=> bm!23069 m!264013))

(declare-fun m!264041 () Bool)

(assert (=> b!246716 m!264041))

(declare-fun m!264043 () Bool)

(assert (=> b!246709 m!264043))

(declare-fun m!264045 () Bool)

(assert (=> b!246709 m!264045))

(assert (=> b!246709 m!264045))

(declare-fun m!264047 () Bool)

(assert (=> b!246709 m!264047))

(check-sat (not b!246721) (not b_next!6573) (not b!246723) (not start!23488) (not b!246724) tp_is_empty!6435 (not b!246720) (not b!246716) (not bm!23069) (not b!246709) b_and!13571 (not bm!23070) (not mapNonEmpty!10922) (not b!246729))
(check-sat b_and!13571 (not b_next!6573))
(get-model)

(declare-fun d!60401 () Bool)

(assert (=> d!60401 (= (array_inv!3815 (_keys!6685 thiss!1504)) (bvsge (size!6120 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246723 d!60401))

(declare-fun d!60403 () Bool)

(assert (=> d!60403 (= (array_inv!3816 (_values!4548 thiss!1504)) (bvsge (size!6119 (_values!4548 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246723 d!60403))

(declare-fun d!60405 () Bool)

(assert (=> d!60405 (= (inRange!0 index!297 (mask!10693 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10693 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!246709 d!60405))

(declare-fun d!60407 () Bool)

(declare-fun e!160112 () Bool)

(assert (=> d!60407 e!160112))

(declare-fun res!120991 () Bool)

(assert (=> d!60407 (=> res!120991 e!160112)))

(declare-fun lt!123607 () Bool)

(assert (=> d!60407 (= res!120991 (not lt!123607))))

(declare-fun lt!123606 () Bool)

(assert (=> d!60407 (= lt!123607 lt!123606)))

(declare-fun lt!123604 () Unit!7619)

(declare-fun e!160111 () Unit!7619)

(assert (=> d!60407 (= lt!123604 e!160111)))

(declare-fun c!41287 () Bool)

(assert (=> d!60407 (= c!41287 lt!123606)))

(declare-fun containsKey!283 (List!3681 (_ BitVec 64)) Bool)

(assert (=> d!60407 (= lt!123606 (containsKey!283 (toList!1872 (getCurrentListMap!1400 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504))) key!932))))

(assert (=> d!60407 (= (contains!1784 (getCurrentListMap!1400 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)) key!932) lt!123607)))

(declare-fun b!246799 () Bool)

(declare-fun lt!123605 () Unit!7619)

(assert (=> b!246799 (= e!160111 lt!123605)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!231 (List!3681 (_ BitVec 64)) Unit!7619)

(assert (=> b!246799 (= lt!123605 (lemmaContainsKeyImpliesGetValueByKeyDefined!231 (toList!1872 (getCurrentListMap!1400 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504))) key!932))))

(declare-datatypes ((Option!297 0))(
  ( (Some!296 (v!5320 V!8227)) (None!295) )
))
(declare-fun isDefined!232 (Option!297) Bool)

(declare-fun getValueByKey!291 (List!3681 (_ BitVec 64)) Option!297)

(assert (=> b!246799 (isDefined!232 (getValueByKey!291 (toList!1872 (getCurrentListMap!1400 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504))) key!932))))

(declare-fun b!246800 () Bool)

(declare-fun Unit!7624 () Unit!7619)

(assert (=> b!246800 (= e!160111 Unit!7624)))

(declare-fun b!246801 () Bool)

(assert (=> b!246801 (= e!160112 (isDefined!232 (getValueByKey!291 (toList!1872 (getCurrentListMap!1400 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504))) key!932)))))

(assert (= (and d!60407 c!41287) b!246799))

(assert (= (and d!60407 (not c!41287)) b!246800))

(assert (= (and d!60407 (not res!120991)) b!246801))

(declare-fun m!264093 () Bool)

(assert (=> d!60407 m!264093))

(declare-fun m!264095 () Bool)

(assert (=> b!246799 m!264095))

(declare-fun m!264097 () Bool)

(assert (=> b!246799 m!264097))

(assert (=> b!246799 m!264097))

(declare-fun m!264099 () Bool)

(assert (=> b!246799 m!264099))

(assert (=> b!246801 m!264097))

(assert (=> b!246801 m!264097))

(assert (=> b!246801 m!264099))

(assert (=> b!246709 d!60407))

(declare-fun b!246844 () Bool)

(declare-fun e!160143 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!246844 (= e!160143 (validKeyInArray!0 (select (arr!5777 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246845 () Bool)

(declare-fun e!160147 () Unit!7619)

(declare-fun lt!123668 () Unit!7619)

(assert (=> b!246845 (= e!160147 lt!123668)))

(declare-fun lt!123655 () ListLongMap!3713)

(declare-fun getCurrentListMapNoExtraKeys!555 (array!12175 array!12173 (_ BitVec 32) (_ BitVec 32) V!8227 V!8227 (_ BitVec 32) Int) ListLongMap!3713)

(assert (=> b!246845 (= lt!123655 (getCurrentListMapNoExtraKeys!555 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)))))

(declare-fun lt!123653 () (_ BitVec 64))

(assert (=> b!246845 (= lt!123653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123673 () (_ BitVec 64))

(assert (=> b!246845 (= lt!123673 (select (arr!5777 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123661 () Unit!7619)

(declare-fun addStillContains!209 (ListLongMap!3713 (_ BitVec 64) V!8227 (_ BitVec 64)) Unit!7619)

(assert (=> b!246845 (= lt!123661 (addStillContains!209 lt!123655 lt!123653 (zeroValue!4406 thiss!1504) lt!123673))))

(declare-fun +!660 (ListLongMap!3713 tuple2!4800) ListLongMap!3713)

(assert (=> b!246845 (contains!1784 (+!660 lt!123655 (tuple2!4801 lt!123653 (zeroValue!4406 thiss!1504))) lt!123673)))

(declare-fun lt!123660 () Unit!7619)

(assert (=> b!246845 (= lt!123660 lt!123661)))

(declare-fun lt!123658 () ListLongMap!3713)

(assert (=> b!246845 (= lt!123658 (getCurrentListMapNoExtraKeys!555 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)))))

(declare-fun lt!123667 () (_ BitVec 64))

(assert (=> b!246845 (= lt!123667 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123657 () (_ BitVec 64))

(assert (=> b!246845 (= lt!123657 (select (arr!5777 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123666 () Unit!7619)

(declare-fun addApplyDifferent!209 (ListLongMap!3713 (_ BitVec 64) V!8227 (_ BitVec 64)) Unit!7619)

(assert (=> b!246845 (= lt!123666 (addApplyDifferent!209 lt!123658 lt!123667 (minValue!4406 thiss!1504) lt!123657))))

(declare-fun apply!233 (ListLongMap!3713 (_ BitVec 64)) V!8227)

(assert (=> b!246845 (= (apply!233 (+!660 lt!123658 (tuple2!4801 lt!123667 (minValue!4406 thiss!1504))) lt!123657) (apply!233 lt!123658 lt!123657))))

(declare-fun lt!123669 () Unit!7619)

(assert (=> b!246845 (= lt!123669 lt!123666)))

(declare-fun lt!123664 () ListLongMap!3713)

(assert (=> b!246845 (= lt!123664 (getCurrentListMapNoExtraKeys!555 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)))))

(declare-fun lt!123665 () (_ BitVec 64))

(assert (=> b!246845 (= lt!123665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123670 () (_ BitVec 64))

(assert (=> b!246845 (= lt!123670 (select (arr!5777 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123663 () Unit!7619)

(assert (=> b!246845 (= lt!123663 (addApplyDifferent!209 lt!123664 lt!123665 (zeroValue!4406 thiss!1504) lt!123670))))

(assert (=> b!246845 (= (apply!233 (+!660 lt!123664 (tuple2!4801 lt!123665 (zeroValue!4406 thiss!1504))) lt!123670) (apply!233 lt!123664 lt!123670))))

(declare-fun lt!123671 () Unit!7619)

(assert (=> b!246845 (= lt!123671 lt!123663)))

(declare-fun lt!123656 () ListLongMap!3713)

(assert (=> b!246845 (= lt!123656 (getCurrentListMapNoExtraKeys!555 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)))))

(declare-fun lt!123672 () (_ BitVec 64))

(assert (=> b!246845 (= lt!123672 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123662 () (_ BitVec 64))

(assert (=> b!246845 (= lt!123662 (select (arr!5777 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246845 (= lt!123668 (addApplyDifferent!209 lt!123656 lt!123672 (minValue!4406 thiss!1504) lt!123662))))

(assert (=> b!246845 (= (apply!233 (+!660 lt!123656 (tuple2!4801 lt!123672 (minValue!4406 thiss!1504))) lt!123662) (apply!233 lt!123656 lt!123662))))

(declare-fun b!246846 () Bool)

(declare-fun e!160148 () Bool)

(declare-fun lt!123652 () ListLongMap!3713)

(assert (=> b!246846 (= e!160148 (= (apply!233 lt!123652 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4406 thiss!1504)))))

(declare-fun d!60409 () Bool)

(declare-fun e!160146 () Bool)

(assert (=> d!60409 e!160146))

(declare-fun res!121018 () Bool)

(assert (=> d!60409 (=> (not res!121018) (not e!160146))))

(assert (=> d!60409 (= res!121018 (or (bvsge #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))))))))

(declare-fun lt!123659 () ListLongMap!3713)

(assert (=> d!60409 (= lt!123652 lt!123659)))

(declare-fun lt!123654 () Unit!7619)

(assert (=> d!60409 (= lt!123654 e!160147)))

(declare-fun c!41301 () Bool)

(assert (=> d!60409 (= c!41301 e!160143)))

(declare-fun res!121016 () Bool)

(assert (=> d!60409 (=> (not res!121016) (not e!160143))))

(assert (=> d!60409 (= res!121016 (bvslt #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))))))

(declare-fun e!160139 () ListLongMap!3713)

(assert (=> d!60409 (= lt!123659 e!160139)))

(declare-fun c!41300 () Bool)

(assert (=> d!60409 (= c!41300 (and (not (= (bvand (extraKeys!4302 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4302 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60409 (validMask!0 (mask!10693 thiss!1504))))

(assert (=> d!60409 (= (getCurrentListMap!1400 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)) lt!123652)))

(declare-fun b!246847 () Bool)

(declare-fun e!160149 () Bool)

(declare-fun e!160142 () Bool)

(assert (=> b!246847 (= e!160149 e!160142)))

(declare-fun res!121010 () Bool)

(assert (=> b!246847 (=> (not res!121010) (not e!160142))))

(assert (=> b!246847 (= res!121010 (contains!1784 lt!123652 (select (arr!5777 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246847 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))))))

(declare-fun bm!23091 () Bool)

(declare-fun call!23100 () ListLongMap!3713)

(declare-fun call!23099 () ListLongMap!3713)

(assert (=> bm!23091 (= call!23100 call!23099)))

(declare-fun b!246848 () Bool)

(declare-fun Unit!7625 () Unit!7619)

(assert (=> b!246848 (= e!160147 Unit!7625)))

(declare-fun b!246849 () Bool)

(declare-fun e!160144 () ListLongMap!3713)

(assert (=> b!246849 (= e!160139 e!160144)))

(declare-fun c!41302 () Bool)

(assert (=> b!246849 (= c!41302 (and (not (= (bvand (extraKeys!4302 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4302 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!23095 () ListLongMap!3713)

(declare-fun bm!23092 () Bool)

(declare-fun call!23098 () ListLongMap!3713)

(declare-fun call!23094 () ListLongMap!3713)

(assert (=> bm!23092 (= call!23099 (+!660 (ite c!41300 call!23095 (ite c!41302 call!23094 call!23098)) (ite (or c!41300 c!41302) (tuple2!4801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4406 thiss!1504)) (tuple2!4801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4406 thiss!1504)))))))

(declare-fun bm!23093 () Bool)

(assert (=> bm!23093 (= call!23095 (getCurrentListMapNoExtraKeys!555 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)))))

(declare-fun bm!23094 () Bool)

(assert (=> bm!23094 (= call!23094 call!23095)))

(declare-fun b!246850 () Bool)

(declare-fun e!160141 () Bool)

(assert (=> b!246850 (= e!160141 e!160148)))

(declare-fun res!121011 () Bool)

(declare-fun call!23096 () Bool)

(assert (=> b!246850 (= res!121011 call!23096)))

(assert (=> b!246850 (=> (not res!121011) (not e!160148))))

(declare-fun b!246851 () Bool)

(assert (=> b!246851 (= e!160139 (+!660 call!23099 (tuple2!4801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4406 thiss!1504))))))

(declare-fun b!246852 () Bool)

(declare-fun e!160151 () ListLongMap!3713)

(assert (=> b!246852 (= e!160151 call!23098)))

(declare-fun b!246853 () Bool)

(declare-fun e!160145 () Bool)

(assert (=> b!246853 (= e!160146 e!160145)))

(declare-fun c!41305 () Bool)

(assert (=> b!246853 (= c!41305 (not (= (bvand (extraKeys!4302 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!246854 () Bool)

(assert (=> b!246854 (= e!160144 call!23100)))

(declare-fun b!246855 () Bool)

(declare-fun res!121015 () Bool)

(assert (=> b!246855 (=> (not res!121015) (not e!160146))))

(assert (=> b!246855 (= res!121015 e!160149)))

(declare-fun res!121012 () Bool)

(assert (=> b!246855 (=> res!121012 e!160149)))

(declare-fun e!160150 () Bool)

(assert (=> b!246855 (= res!121012 (not e!160150))))

(declare-fun res!121017 () Bool)

(assert (=> b!246855 (=> (not res!121017) (not e!160150))))

(assert (=> b!246855 (= res!121017 (bvslt #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))))))

(declare-fun b!246856 () Bool)

(assert (=> b!246856 (= e!160151 call!23100)))

(declare-fun b!246857 () Bool)

(declare-fun c!41303 () Bool)

(assert (=> b!246857 (= c!41303 (and (not (= (bvand (extraKeys!4302 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4302 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!246857 (= e!160144 e!160151)))

(declare-fun b!246858 () Bool)

(assert (=> b!246858 (= e!160150 (validKeyInArray!0 (select (arr!5777 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246859 () Bool)

(declare-fun res!121013 () Bool)

(assert (=> b!246859 (=> (not res!121013) (not e!160146))))

(assert (=> b!246859 (= res!121013 e!160141)))

(declare-fun c!41304 () Bool)

(assert (=> b!246859 (= c!41304 (not (= (bvand (extraKeys!4302 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!246860 () Bool)

(declare-fun get!2966 (ValueCell!2874 V!8227) V!8227)

(declare-fun dynLambda!576 (Int (_ BitVec 64)) V!8227)

(assert (=> b!246860 (= e!160142 (= (apply!233 lt!123652 (select (arr!5777 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000)) (get!2966 (select (arr!5776 (_values!4548 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!576 (defaultEntry!4565 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!246860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6119 (_values!4548 thiss!1504))))))

(assert (=> b!246860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))))))

(declare-fun b!246861 () Bool)

(assert (=> b!246861 (= e!160141 (not call!23096))))

(declare-fun bm!23095 () Bool)

(declare-fun call!23097 () Bool)

(assert (=> bm!23095 (= call!23097 (contains!1784 lt!123652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23096 () Bool)

(assert (=> bm!23096 (= call!23098 call!23094)))

(declare-fun b!246862 () Bool)

(assert (=> b!246862 (= e!160145 (not call!23097))))

(declare-fun b!246863 () Bool)

(declare-fun e!160140 () Bool)

(assert (=> b!246863 (= e!160140 (= (apply!233 lt!123652 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4406 thiss!1504)))))

(declare-fun bm!23097 () Bool)

(assert (=> bm!23097 (= call!23096 (contains!1784 lt!123652 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246864 () Bool)

(assert (=> b!246864 (= e!160145 e!160140)))

(declare-fun res!121014 () Bool)

(assert (=> b!246864 (= res!121014 call!23097)))

(assert (=> b!246864 (=> (not res!121014) (not e!160140))))

(assert (= (and d!60409 c!41300) b!246851))

(assert (= (and d!60409 (not c!41300)) b!246849))

(assert (= (and b!246849 c!41302) b!246854))

(assert (= (and b!246849 (not c!41302)) b!246857))

(assert (= (and b!246857 c!41303) b!246856))

(assert (= (and b!246857 (not c!41303)) b!246852))

(assert (= (or b!246856 b!246852) bm!23096))

(assert (= (or b!246854 bm!23096) bm!23094))

(assert (= (or b!246854 b!246856) bm!23091))

(assert (= (or b!246851 bm!23094) bm!23093))

(assert (= (or b!246851 bm!23091) bm!23092))

(assert (= (and d!60409 res!121016) b!246844))

(assert (= (and d!60409 c!41301) b!246845))

(assert (= (and d!60409 (not c!41301)) b!246848))

(assert (= (and d!60409 res!121018) b!246855))

(assert (= (and b!246855 res!121017) b!246858))

(assert (= (and b!246855 (not res!121012)) b!246847))

(assert (= (and b!246847 res!121010) b!246860))

(assert (= (and b!246855 res!121015) b!246859))

(assert (= (and b!246859 c!41304) b!246850))

(assert (= (and b!246859 (not c!41304)) b!246861))

(assert (= (and b!246850 res!121011) b!246846))

(assert (= (or b!246850 b!246861) bm!23097))

(assert (= (and b!246859 res!121013) b!246853))

(assert (= (and b!246853 c!41305) b!246864))

(assert (= (and b!246853 (not c!41305)) b!246862))

(assert (= (and b!246864 res!121014) b!246863))

(assert (= (or b!246864 b!246862) bm!23095))

(declare-fun b_lambda!8043 () Bool)

(assert (=> (not b_lambda!8043) (not b!246860)))

(declare-fun t!8703 () Bool)

(declare-fun tb!2979 () Bool)

(assert (=> (and b!246723 (= (defaultEntry!4565 thiss!1504) (defaultEntry!4565 thiss!1504)) t!8703) tb!2979))

(declare-fun result!5259 () Bool)

(assert (=> tb!2979 (= result!5259 tp_is_empty!6435)))

(assert (=> b!246860 t!8703))

(declare-fun b_and!13575 () Bool)

(assert (= b_and!13571 (and (=> t!8703 result!5259) b_and!13575)))

(assert (=> d!60409 m!264011))

(declare-fun m!264101 () Bool)

(assert (=> b!246851 m!264101))

(declare-fun m!264103 () Bool)

(assert (=> b!246846 m!264103))

(declare-fun m!264105 () Bool)

(assert (=> bm!23097 m!264105))

(declare-fun m!264107 () Bool)

(assert (=> b!246863 m!264107))

(declare-fun m!264109 () Bool)

(assert (=> b!246844 m!264109))

(assert (=> b!246844 m!264109))

(declare-fun m!264111 () Bool)

(assert (=> b!246844 m!264111))

(declare-fun m!264113 () Bool)

(assert (=> bm!23093 m!264113))

(declare-fun m!264115 () Bool)

(assert (=> bm!23095 m!264115))

(declare-fun m!264117 () Bool)

(assert (=> b!246845 m!264117))

(declare-fun m!264119 () Bool)

(assert (=> b!246845 m!264119))

(declare-fun m!264121 () Bool)

(assert (=> b!246845 m!264121))

(assert (=> b!246845 m!264109))

(declare-fun m!264123 () Bool)

(assert (=> b!246845 m!264123))

(declare-fun m!264125 () Bool)

(assert (=> b!246845 m!264125))

(assert (=> b!246845 m!264117))

(assert (=> b!246845 m!264121))

(declare-fun m!264127 () Bool)

(assert (=> b!246845 m!264127))

(declare-fun m!264129 () Bool)

(assert (=> b!246845 m!264129))

(assert (=> b!246845 m!264123))

(declare-fun m!264131 () Bool)

(assert (=> b!246845 m!264131))

(declare-fun m!264133 () Bool)

(assert (=> b!246845 m!264133))

(declare-fun m!264135 () Bool)

(assert (=> b!246845 m!264135))

(declare-fun m!264137 () Bool)

(assert (=> b!246845 m!264137))

(declare-fun m!264139 () Bool)

(assert (=> b!246845 m!264139))

(declare-fun m!264141 () Bool)

(assert (=> b!246845 m!264141))

(assert (=> b!246845 m!264141))

(declare-fun m!264143 () Bool)

(assert (=> b!246845 m!264143))

(declare-fun m!264145 () Bool)

(assert (=> b!246845 m!264145))

(assert (=> b!246845 m!264113))

(declare-fun m!264147 () Bool)

(assert (=> bm!23092 m!264147))

(assert (=> b!246847 m!264109))

(assert (=> b!246847 m!264109))

(declare-fun m!264149 () Bool)

(assert (=> b!246847 m!264149))

(declare-fun m!264151 () Bool)

(assert (=> b!246860 m!264151))

(declare-fun m!264153 () Bool)

(assert (=> b!246860 m!264153))

(assert (=> b!246860 m!264109))

(assert (=> b!246860 m!264109))

(declare-fun m!264155 () Bool)

(assert (=> b!246860 m!264155))

(assert (=> b!246860 m!264153))

(assert (=> b!246860 m!264151))

(declare-fun m!264157 () Bool)

(assert (=> b!246860 m!264157))

(assert (=> b!246858 m!264109))

(assert (=> b!246858 m!264109))

(assert (=> b!246858 m!264111))

(assert (=> b!246709 d!60409))

(declare-fun b!246876 () Bool)

(declare-fun res!121029 () Bool)

(declare-fun e!160156 () Bool)

(assert (=> b!246876 (=> (not res!121029) (not e!160156))))

(assert (=> b!246876 (= res!121029 (validKeyInArray!0 key!932))))

(declare-fun e!160157 () Bool)

(declare-fun b!246878 () Bool)

(assert (=> b!246878 (= e!160157 (= (arrayCountValidKeys!0 (array!12176 (store (arr!5777 (_keys!6685 thiss!1504)) index!297 key!932) (size!6120 (_keys!6685 thiss!1504))) #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6685 thiss!1504) #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!246877 () Bool)

(assert (=> b!246877 (= e!160156 (bvslt (size!6120 (_keys!6685 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!60411 () Bool)

(assert (=> d!60411 e!160157))

(declare-fun res!121030 () Bool)

(assert (=> d!60411 (=> (not res!121030) (not e!160157))))

(assert (=> d!60411 (= res!121030 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6120 (_keys!6685 thiss!1504)))))))

(declare-fun lt!123676 () Unit!7619)

(declare-fun choose!1 (array!12175 (_ BitVec 32) (_ BitVec 64)) Unit!7619)

(assert (=> d!60411 (= lt!123676 (choose!1 (_keys!6685 thiss!1504) index!297 key!932))))

(assert (=> d!60411 e!160156))

(declare-fun res!121027 () Bool)

(assert (=> d!60411 (=> (not res!121027) (not e!160156))))

(assert (=> d!60411 (= res!121027 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6120 (_keys!6685 thiss!1504)))))))

(assert (=> d!60411 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6685 thiss!1504) index!297 key!932) lt!123676)))

(declare-fun b!246875 () Bool)

(declare-fun res!121028 () Bool)

(assert (=> b!246875 (=> (not res!121028) (not e!160156))))

(assert (=> b!246875 (= res!121028 (not (validKeyInArray!0 (select (arr!5777 (_keys!6685 thiss!1504)) index!297))))))

(assert (= (and d!60411 res!121027) b!246875))

(assert (= (and b!246875 res!121028) b!246876))

(assert (= (and b!246876 res!121029) b!246877))

(assert (= (and d!60411 res!121030) b!246878))

(declare-fun m!264159 () Bool)

(assert (=> b!246876 m!264159))

(assert (=> b!246878 m!264021))

(declare-fun m!264161 () Bool)

(assert (=> b!246878 m!264161))

(assert (=> b!246878 m!264023))

(declare-fun m!264163 () Bool)

(assert (=> d!60411 m!264163))

(declare-fun m!264165 () Bool)

(assert (=> b!246875 m!264165))

(assert (=> b!246875 m!264165))

(declare-fun m!264167 () Bool)

(assert (=> b!246875 m!264167))

(assert (=> b!246720 d!60411))

(declare-fun d!60413 () Bool)

(declare-fun res!121035 () Bool)

(declare-fun e!160162 () Bool)

(assert (=> d!60413 (=> res!121035 e!160162)))

(assert (=> d!60413 (= res!121035 (= (select (arr!5777 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60413 (= (arrayContainsKey!0 (_keys!6685 thiss!1504) key!932 #b00000000000000000000000000000000) e!160162)))

(declare-fun b!246883 () Bool)

(declare-fun e!160163 () Bool)

(assert (=> b!246883 (= e!160162 e!160163)))

(declare-fun res!121036 () Bool)

(assert (=> b!246883 (=> (not res!121036) (not e!160163))))

(assert (=> b!246883 (= res!121036 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6120 (_keys!6685 thiss!1504))))))

(declare-fun b!246884 () Bool)

(assert (=> b!246884 (= e!160163 (arrayContainsKey!0 (_keys!6685 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60413 (not res!121035)) b!246883))

(assert (= (and b!246883 res!121036) b!246884))

(assert (=> d!60413 m!264109))

(declare-fun m!264169 () Bool)

(assert (=> b!246884 m!264169))

(assert (=> b!246720 d!60413))

(declare-fun b!246895 () Bool)

(declare-fun e!160174 () Bool)

(declare-fun call!23103 () Bool)

(assert (=> b!246895 (= e!160174 call!23103)))

(declare-fun bm!23100 () Bool)

(declare-fun c!41308 () Bool)

(assert (=> bm!23100 (= call!23103 (arrayNoDuplicates!0 lt!123564 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41308 (Cons!3678 (select (arr!5777 lt!123564) #b00000000000000000000000000000000) Nil!3679) Nil!3679)))))

(declare-fun d!60415 () Bool)

(declare-fun res!121044 () Bool)

(declare-fun e!160172 () Bool)

(assert (=> d!60415 (=> res!121044 e!160172)))

(assert (=> d!60415 (= res!121044 (bvsge #b00000000000000000000000000000000 (size!6120 lt!123564)))))

(assert (=> d!60415 (= (arrayNoDuplicates!0 lt!123564 #b00000000000000000000000000000000 Nil!3679) e!160172)))

(declare-fun b!246896 () Bool)

(declare-fun e!160175 () Bool)

(declare-fun contains!1785 (List!3682 (_ BitVec 64)) Bool)

(assert (=> b!246896 (= e!160175 (contains!1785 Nil!3679 (select (arr!5777 lt!123564) #b00000000000000000000000000000000)))))

(declare-fun b!246897 () Bool)

(assert (=> b!246897 (= e!160174 call!23103)))

(declare-fun b!246898 () Bool)

(declare-fun e!160173 () Bool)

(assert (=> b!246898 (= e!160173 e!160174)))

(assert (=> b!246898 (= c!41308 (validKeyInArray!0 (select (arr!5777 lt!123564) #b00000000000000000000000000000000)))))

(declare-fun b!246899 () Bool)

(assert (=> b!246899 (= e!160172 e!160173)))

(declare-fun res!121045 () Bool)

(assert (=> b!246899 (=> (not res!121045) (not e!160173))))

(assert (=> b!246899 (= res!121045 (not e!160175))))

(declare-fun res!121043 () Bool)

(assert (=> b!246899 (=> (not res!121043) (not e!160175))))

(assert (=> b!246899 (= res!121043 (validKeyInArray!0 (select (arr!5777 lt!123564) #b00000000000000000000000000000000)))))

(assert (= (and d!60415 (not res!121044)) b!246899))

(assert (= (and b!246899 res!121043) b!246896))

(assert (= (and b!246899 res!121045) b!246898))

(assert (= (and b!246898 c!41308) b!246897))

(assert (= (and b!246898 (not c!41308)) b!246895))

(assert (= (or b!246897 b!246895) bm!23100))

(declare-fun m!264171 () Bool)

(assert (=> bm!23100 m!264171))

(declare-fun m!264173 () Bool)

(assert (=> bm!23100 m!264173))

(assert (=> b!246896 m!264171))

(assert (=> b!246896 m!264171))

(declare-fun m!264175 () Bool)

(assert (=> b!246896 m!264175))

(assert (=> b!246898 m!264171))

(assert (=> b!246898 m!264171))

(declare-fun m!264177 () Bool)

(assert (=> b!246898 m!264177))

(assert (=> b!246899 m!264171))

(assert (=> b!246899 m!264171))

(assert (=> b!246899 m!264177))

(assert (=> b!246720 d!60415))

(declare-fun b!246908 () Bool)

(declare-fun e!160181 () (_ BitVec 32))

(declare-fun call!23106 () (_ BitVec 32))

(assert (=> b!246908 (= e!160181 (bvadd #b00000000000000000000000000000001 call!23106))))

(declare-fun b!246909 () Bool)

(declare-fun e!160180 () (_ BitVec 32))

(assert (=> b!246909 (= e!160180 e!160181)))

(declare-fun c!41314 () Bool)

(assert (=> b!246909 (= c!41314 (validKeyInArray!0 (select (arr!5777 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60417 () Bool)

(declare-fun lt!123679 () (_ BitVec 32))

(assert (=> d!60417 (and (bvsge lt!123679 #b00000000000000000000000000000000) (bvsle lt!123679 (bvsub (size!6120 (_keys!6685 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60417 (= lt!123679 e!160180)))

(declare-fun c!41313 () Bool)

(assert (=> d!60417 (= c!41313 (bvsge #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))))))

(assert (=> d!60417 (and (bvsle #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6120 (_keys!6685 thiss!1504)) (size!6120 (_keys!6685 thiss!1504))))))

(assert (=> d!60417 (= (arrayCountValidKeys!0 (_keys!6685 thiss!1504) #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))) lt!123679)))

(declare-fun b!246910 () Bool)

(assert (=> b!246910 (= e!160181 call!23106)))

(declare-fun bm!23103 () Bool)

(assert (=> bm!23103 (= call!23106 (arrayCountValidKeys!0 (_keys!6685 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6120 (_keys!6685 thiss!1504))))))

(declare-fun b!246911 () Bool)

(assert (=> b!246911 (= e!160180 #b00000000000000000000000000000000)))

(assert (= (and d!60417 c!41313) b!246911))

(assert (= (and d!60417 (not c!41313)) b!246909))

(assert (= (and b!246909 c!41314) b!246908))

(assert (= (and b!246909 (not c!41314)) b!246910))

(assert (= (or b!246908 b!246910) bm!23103))

(assert (=> b!246909 m!264109))

(assert (=> b!246909 m!264109))

(assert (=> b!246909 m!264111))

(declare-fun m!264179 () Bool)

(assert (=> bm!23103 m!264179))

(assert (=> b!246720 d!60417))

(declare-fun d!60419 () Bool)

(assert (=> d!60419 (= (validMask!0 (mask!10693 thiss!1504)) (and (or (= (mask!10693 thiss!1504) #b00000000000000000000000000000111) (= (mask!10693 thiss!1504) #b00000000000000000000000000001111) (= (mask!10693 thiss!1504) #b00000000000000000000000000011111) (= (mask!10693 thiss!1504) #b00000000000000000000000000111111) (= (mask!10693 thiss!1504) #b00000000000000000000000001111111) (= (mask!10693 thiss!1504) #b00000000000000000000000011111111) (= (mask!10693 thiss!1504) #b00000000000000000000000111111111) (= (mask!10693 thiss!1504) #b00000000000000000000001111111111) (= (mask!10693 thiss!1504) #b00000000000000000000011111111111) (= (mask!10693 thiss!1504) #b00000000000000000000111111111111) (= (mask!10693 thiss!1504) #b00000000000000000001111111111111) (= (mask!10693 thiss!1504) #b00000000000000000011111111111111) (= (mask!10693 thiss!1504) #b00000000000000000111111111111111) (= (mask!10693 thiss!1504) #b00000000000000001111111111111111) (= (mask!10693 thiss!1504) #b00000000000000011111111111111111) (= (mask!10693 thiss!1504) #b00000000000000111111111111111111) (= (mask!10693 thiss!1504) #b00000000000001111111111111111111) (= (mask!10693 thiss!1504) #b00000000000011111111111111111111) (= (mask!10693 thiss!1504) #b00000000000111111111111111111111) (= (mask!10693 thiss!1504) #b00000000001111111111111111111111) (= (mask!10693 thiss!1504) #b00000000011111111111111111111111) (= (mask!10693 thiss!1504) #b00000000111111111111111111111111) (= (mask!10693 thiss!1504) #b00000001111111111111111111111111) (= (mask!10693 thiss!1504) #b00000011111111111111111111111111) (= (mask!10693 thiss!1504) #b00000111111111111111111111111111) (= (mask!10693 thiss!1504) #b00001111111111111111111111111111) (= (mask!10693 thiss!1504) #b00011111111111111111111111111111) (= (mask!10693 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10693 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!246720 d!60419))

(declare-fun b!246912 () Bool)

(declare-fun e!160183 () (_ BitVec 32))

(declare-fun call!23107 () (_ BitVec 32))

(assert (=> b!246912 (= e!160183 (bvadd #b00000000000000000000000000000001 call!23107))))

(declare-fun b!246913 () Bool)

(declare-fun e!160182 () (_ BitVec 32))

(assert (=> b!246913 (= e!160182 e!160183)))

(declare-fun c!41316 () Bool)

(assert (=> b!246913 (= c!41316 (validKeyInArray!0 (select (arr!5777 lt!123564) #b00000000000000000000000000000000)))))

(declare-fun d!60421 () Bool)

(declare-fun lt!123680 () (_ BitVec 32))

(assert (=> d!60421 (and (bvsge lt!123680 #b00000000000000000000000000000000) (bvsle lt!123680 (bvsub (size!6120 lt!123564) #b00000000000000000000000000000000)))))

(assert (=> d!60421 (= lt!123680 e!160182)))

(declare-fun c!41315 () Bool)

(assert (=> d!60421 (= c!41315 (bvsge #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))))))

(assert (=> d!60421 (and (bvsle #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6120 (_keys!6685 thiss!1504)) (size!6120 lt!123564)))))

(assert (=> d!60421 (= (arrayCountValidKeys!0 lt!123564 #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))) lt!123680)))

(declare-fun b!246914 () Bool)

(assert (=> b!246914 (= e!160183 call!23107)))

(declare-fun bm!23104 () Bool)

(assert (=> bm!23104 (= call!23107 (arrayCountValidKeys!0 lt!123564 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6120 (_keys!6685 thiss!1504))))))

(declare-fun b!246915 () Bool)

(assert (=> b!246915 (= e!160182 #b00000000000000000000000000000000)))

(assert (= (and d!60421 c!41315) b!246915))

(assert (= (and d!60421 (not c!41315)) b!246913))

(assert (= (and b!246913 c!41316) b!246912))

(assert (= (and b!246913 (not c!41316)) b!246914))

(assert (= (or b!246912 b!246914) bm!23104))

(assert (=> b!246913 m!264171))

(assert (=> b!246913 m!264171))

(assert (=> b!246913 m!264177))

(declare-fun m!264181 () Bool)

(assert (=> bm!23104 m!264181))

(assert (=> b!246720 d!60421))

(declare-fun d!60423 () Bool)

(declare-fun e!160186 () Bool)

(assert (=> d!60423 e!160186))

(declare-fun res!121048 () Bool)

(assert (=> d!60423 (=> (not res!121048) (not e!160186))))

(assert (=> d!60423 (= res!121048 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6120 (_keys!6685 thiss!1504)))))))

(declare-fun lt!123683 () Unit!7619)

(declare-fun choose!41 (array!12175 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3682) Unit!7619)

(assert (=> d!60423 (= lt!123683 (choose!41 (_keys!6685 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3679))))

(assert (=> d!60423 (bvslt (size!6120 (_keys!6685 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60423 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6685 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3679) lt!123683)))

(declare-fun b!246918 () Bool)

(assert (=> b!246918 (= e!160186 (arrayNoDuplicates!0 (array!12176 (store (arr!5777 (_keys!6685 thiss!1504)) index!297 key!932) (size!6120 (_keys!6685 thiss!1504))) #b00000000000000000000000000000000 Nil!3679))))

(assert (= (and d!60423 res!121048) b!246918))

(declare-fun m!264183 () Bool)

(assert (=> d!60423 m!264183))

(assert (=> b!246918 m!264021))

(declare-fun m!264185 () Bool)

(assert (=> b!246918 m!264185))

(assert (=> b!246720 d!60423))

(assert (=> bm!23069 d!60413))

(declare-fun b!246931 () Bool)

(declare-fun e!160195 () SeekEntryResult!1096)

(declare-fun lt!123692 () SeekEntryResult!1096)

(assert (=> b!246931 (= e!160195 (MissingZero!1096 (index!6556 lt!123692)))))

(declare-fun b!246932 () Bool)

(declare-fun e!160193 () SeekEntryResult!1096)

(assert (=> b!246932 (= e!160193 (Found!1096 (index!6556 lt!123692)))))

(declare-fun b!246933 () Bool)

(declare-fun e!160194 () SeekEntryResult!1096)

(assert (=> b!246933 (= e!160194 e!160193)))

(declare-fun lt!123691 () (_ BitVec 64))

(assert (=> b!246933 (= lt!123691 (select (arr!5777 (_keys!6685 thiss!1504)) (index!6556 lt!123692)))))

(declare-fun c!41324 () Bool)

(assert (=> b!246933 (= c!41324 (= lt!123691 key!932))))

(declare-fun b!246934 () Bool)

(declare-fun c!41323 () Bool)

(assert (=> b!246934 (= c!41323 (= lt!123691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246934 (= e!160193 e!160195)))

(declare-fun d!60425 () Bool)

(declare-fun lt!123690 () SeekEntryResult!1096)

(assert (=> d!60425 (and (or ((_ is Undefined!1096) lt!123690) (not ((_ is Found!1096) lt!123690)) (and (bvsge (index!6555 lt!123690) #b00000000000000000000000000000000) (bvslt (index!6555 lt!123690) (size!6120 (_keys!6685 thiss!1504))))) (or ((_ is Undefined!1096) lt!123690) ((_ is Found!1096) lt!123690) (not ((_ is MissingZero!1096) lt!123690)) (and (bvsge (index!6554 lt!123690) #b00000000000000000000000000000000) (bvslt (index!6554 lt!123690) (size!6120 (_keys!6685 thiss!1504))))) (or ((_ is Undefined!1096) lt!123690) ((_ is Found!1096) lt!123690) ((_ is MissingZero!1096) lt!123690) (not ((_ is MissingVacant!1096) lt!123690)) (and (bvsge (index!6557 lt!123690) #b00000000000000000000000000000000) (bvslt (index!6557 lt!123690) (size!6120 (_keys!6685 thiss!1504))))) (or ((_ is Undefined!1096) lt!123690) (ite ((_ is Found!1096) lt!123690) (= (select (arr!5777 (_keys!6685 thiss!1504)) (index!6555 lt!123690)) key!932) (ite ((_ is MissingZero!1096) lt!123690) (= (select (arr!5777 (_keys!6685 thiss!1504)) (index!6554 lt!123690)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1096) lt!123690) (= (select (arr!5777 (_keys!6685 thiss!1504)) (index!6557 lt!123690)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60425 (= lt!123690 e!160194)))

(declare-fun c!41325 () Bool)

(assert (=> d!60425 (= c!41325 (and ((_ is Intermediate!1096) lt!123692) (undefined!1908 lt!123692)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12175 (_ BitVec 32)) SeekEntryResult!1096)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60425 (= lt!123692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10693 thiss!1504)) key!932 (_keys!6685 thiss!1504) (mask!10693 thiss!1504)))))

(assert (=> d!60425 (validMask!0 (mask!10693 thiss!1504))))

(assert (=> d!60425 (= (seekEntryOrOpen!0 key!932 (_keys!6685 thiss!1504) (mask!10693 thiss!1504)) lt!123690)))

(declare-fun b!246935 () Bool)

(assert (=> b!246935 (= e!160194 Undefined!1096)))

(declare-fun b!246936 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12175 (_ BitVec 32)) SeekEntryResult!1096)

(assert (=> b!246936 (= e!160195 (seekKeyOrZeroReturnVacant!0 (x!24488 lt!123692) (index!6556 lt!123692) (index!6556 lt!123692) key!932 (_keys!6685 thiss!1504) (mask!10693 thiss!1504)))))

(assert (= (and d!60425 c!41325) b!246935))

(assert (= (and d!60425 (not c!41325)) b!246933))

(assert (= (and b!246933 c!41324) b!246932))

(assert (= (and b!246933 (not c!41324)) b!246934))

(assert (= (and b!246934 c!41323) b!246931))

(assert (= (and b!246934 (not c!41323)) b!246936))

(declare-fun m!264187 () Bool)

(assert (=> b!246933 m!264187))

(declare-fun m!264189 () Bool)

(assert (=> d!60425 m!264189))

(declare-fun m!264191 () Bool)

(assert (=> d!60425 m!264191))

(declare-fun m!264193 () Bool)

(assert (=> d!60425 m!264193))

(assert (=> d!60425 m!264189))

(assert (=> d!60425 m!264011))

(declare-fun m!264195 () Bool)

(assert (=> d!60425 m!264195))

(declare-fun m!264197 () Bool)

(assert (=> d!60425 m!264197))

(declare-fun m!264199 () Bool)

(assert (=> b!246936 m!264199))

(assert (=> b!246724 d!60425))

(declare-fun d!60427 () Bool)

(assert (=> d!60427 (contains!1784 (getCurrentListMap!1400 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)) key!932)))

(declare-fun lt!123695 () Unit!7619)

(declare-fun choose!1158 (array!12175 array!12173 (_ BitVec 32) (_ BitVec 32) V!8227 V!8227 (_ BitVec 64) (_ BitVec 32) Int) Unit!7619)

(assert (=> d!60427 (= lt!123695 (choose!1158 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)))))

(assert (=> d!60427 (validMask!0 (mask!10693 thiss!1504))))

(assert (=> d!60427 (= (lemmaArrayContainsKeyThenInListMap!181 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4565 thiss!1504)) lt!123695)))

(declare-fun bs!8917 () Bool)

(assert (= bs!8917 d!60427))

(assert (=> bs!8917 m!264045))

(assert (=> bs!8917 m!264045))

(assert (=> bs!8917 m!264047))

(declare-fun m!264201 () Bool)

(assert (=> bs!8917 m!264201))

(assert (=> bs!8917 m!264011))

(assert (=> b!246729 d!60427))

(declare-fun d!60429 () Bool)

(assert (=> d!60429 (= (inRange!0 (ite c!41269 (index!6554 lt!123568) (index!6557 lt!123568)) (mask!10693 thiss!1504)) (and (bvsge (ite c!41269 (index!6554 lt!123568) (index!6557 lt!123568)) #b00000000000000000000000000000000) (bvslt (ite c!41269 (index!6554 lt!123568) (index!6557 lt!123568)) (bvadd (mask!10693 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23070 d!60429))

(declare-fun b!246953 () Bool)

(declare-fun lt!123700 () SeekEntryResult!1096)

(assert (=> b!246953 (and (bvsge (index!6554 lt!123700) #b00000000000000000000000000000000) (bvslt (index!6554 lt!123700) (size!6120 (_keys!6685 thiss!1504))))))

(declare-fun res!121059 () Bool)

(assert (=> b!246953 (= res!121059 (= (select (arr!5777 (_keys!6685 thiss!1504)) (index!6554 lt!123700)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160206 () Bool)

(assert (=> b!246953 (=> (not res!121059) (not e!160206))))

(declare-fun b!246954 () Bool)

(declare-fun res!121060 () Bool)

(declare-fun e!160205 () Bool)

(assert (=> b!246954 (=> (not res!121060) (not e!160205))))

(assert (=> b!246954 (= res!121060 (= (select (arr!5777 (_keys!6685 thiss!1504)) (index!6557 lt!123700)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246954 (and (bvsge (index!6557 lt!123700) #b00000000000000000000000000000000) (bvslt (index!6557 lt!123700) (size!6120 (_keys!6685 thiss!1504))))))

(declare-fun b!246955 () Bool)

(declare-fun call!23112 () Bool)

(assert (=> b!246955 (= e!160205 (not call!23112))))

(declare-fun b!246957 () Bool)

(declare-fun e!160207 () Bool)

(assert (=> b!246957 (= e!160207 e!160206)))

(declare-fun res!121058 () Bool)

(declare-fun call!23113 () Bool)

(assert (=> b!246957 (= res!121058 call!23113)))

(assert (=> b!246957 (=> (not res!121058) (not e!160206))))

(declare-fun c!41330 () Bool)

(declare-fun bm!23109 () Bool)

(assert (=> bm!23109 (= call!23113 (inRange!0 (ite c!41330 (index!6554 lt!123700) (index!6557 lt!123700)) (mask!10693 thiss!1504)))))

(declare-fun bm!23110 () Bool)

(assert (=> bm!23110 (= call!23112 (arrayContainsKey!0 (_keys!6685 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246958 () Bool)

(assert (=> b!246958 (= e!160206 (not call!23112))))

(declare-fun d!60431 () Bool)

(assert (=> d!60431 e!160207))

(assert (=> d!60431 (= c!41330 ((_ is MissingZero!1096) lt!123700))))

(assert (=> d!60431 (= lt!123700 (seekEntryOrOpen!0 key!932 (_keys!6685 thiss!1504) (mask!10693 thiss!1504)))))

(declare-fun lt!123701 () Unit!7619)

(declare-fun choose!1159 (array!12175 array!12173 (_ BitVec 32) (_ BitVec 32) V!8227 V!8227 (_ BitVec 64) Int) Unit!7619)

(assert (=> d!60431 (= lt!123701 (choose!1159 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) key!932 (defaultEntry!4565 thiss!1504)))))

(assert (=> d!60431 (validMask!0 (mask!10693 thiss!1504))))

(assert (=> d!60431 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!382 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) key!932 (defaultEntry!4565 thiss!1504)) lt!123701)))

(declare-fun b!246956 () Bool)

(declare-fun res!121057 () Bool)

(assert (=> b!246956 (=> (not res!121057) (not e!160205))))

(assert (=> b!246956 (= res!121057 call!23113)))

(declare-fun e!160204 () Bool)

(assert (=> b!246956 (= e!160204 e!160205)))

(declare-fun b!246959 () Bool)

(assert (=> b!246959 (= e!160204 ((_ is Undefined!1096) lt!123700))))

(declare-fun b!246960 () Bool)

(assert (=> b!246960 (= e!160207 e!160204)))

(declare-fun c!41331 () Bool)

(assert (=> b!246960 (= c!41331 ((_ is MissingVacant!1096) lt!123700))))

(assert (= (and d!60431 c!41330) b!246957))

(assert (= (and d!60431 (not c!41330)) b!246960))

(assert (= (and b!246957 res!121058) b!246953))

(assert (= (and b!246953 res!121059) b!246958))

(assert (= (and b!246960 c!41331) b!246956))

(assert (= (and b!246960 (not c!41331)) b!246959))

(assert (= (and b!246956 res!121057) b!246954))

(assert (= (and b!246954 res!121060) b!246955))

(assert (= (or b!246957 b!246956) bm!23109))

(assert (= (or b!246958 b!246955) bm!23110))

(assert (=> d!60431 m!264007))

(declare-fun m!264203 () Bool)

(assert (=> d!60431 m!264203))

(assert (=> d!60431 m!264011))

(assert (=> bm!23110 m!264013))

(declare-fun m!264205 () Bool)

(assert (=> b!246954 m!264205))

(declare-fun m!264207 () Bool)

(assert (=> bm!23109 m!264207))

(declare-fun m!264209 () Bool)

(assert (=> b!246953 m!264209))

(assert (=> b!246716 d!60431))

(declare-fun d!60433 () Bool)

(declare-fun e!160210 () Bool)

(assert (=> d!60433 e!160210))

(declare-fun res!121065 () Bool)

(assert (=> d!60433 (=> (not res!121065) (not e!160210))))

(declare-fun lt!123706 () SeekEntryResult!1096)

(assert (=> d!60433 (= res!121065 ((_ is Found!1096) lt!123706))))

(assert (=> d!60433 (= lt!123706 (seekEntryOrOpen!0 key!932 (_keys!6685 thiss!1504) (mask!10693 thiss!1504)))))

(declare-fun lt!123707 () Unit!7619)

(declare-fun choose!1160 (array!12175 array!12173 (_ BitVec 32) (_ BitVec 32) V!8227 V!8227 (_ BitVec 64) Int) Unit!7619)

(assert (=> d!60433 (= lt!123707 (choose!1160 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) key!932 (defaultEntry!4565 thiss!1504)))))

(assert (=> d!60433 (validMask!0 (mask!10693 thiss!1504))))

(assert (=> d!60433 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!377 (_keys!6685 thiss!1504) (_values!4548 thiss!1504) (mask!10693 thiss!1504) (extraKeys!4302 thiss!1504) (zeroValue!4406 thiss!1504) (minValue!4406 thiss!1504) key!932 (defaultEntry!4565 thiss!1504)) lt!123707)))

(declare-fun b!246965 () Bool)

(declare-fun res!121066 () Bool)

(assert (=> b!246965 (=> (not res!121066) (not e!160210))))

(assert (=> b!246965 (= res!121066 (inRange!0 (index!6555 lt!123706) (mask!10693 thiss!1504)))))

(declare-fun b!246966 () Bool)

(assert (=> b!246966 (= e!160210 (= (select (arr!5777 (_keys!6685 thiss!1504)) (index!6555 lt!123706)) key!932))))

(assert (=> b!246966 (and (bvsge (index!6555 lt!123706) #b00000000000000000000000000000000) (bvslt (index!6555 lt!123706) (size!6120 (_keys!6685 thiss!1504))))))

(assert (= (and d!60433 res!121065) b!246965))

(assert (= (and b!246965 res!121066) b!246966))

(assert (=> d!60433 m!264007))

(declare-fun m!264211 () Bool)

(assert (=> d!60433 m!264211))

(assert (=> d!60433 m!264011))

(declare-fun m!264213 () Bool)

(assert (=> b!246965 m!264213))

(declare-fun m!264215 () Bool)

(assert (=> b!246966 m!264215))

(assert (=> b!246721 d!60433))

(declare-fun d!60435 () Bool)

(declare-fun res!121073 () Bool)

(declare-fun e!160213 () Bool)

(assert (=> d!60435 (=> (not res!121073) (not e!160213))))

(declare-fun simpleValid!256 (LongMapFixedSize!3648) Bool)

(assert (=> d!60435 (= res!121073 (simpleValid!256 thiss!1504))))

(assert (=> d!60435 (= (valid!1427 thiss!1504) e!160213)))

(declare-fun b!246973 () Bool)

(declare-fun res!121074 () Bool)

(assert (=> b!246973 (=> (not res!121074) (not e!160213))))

(assert (=> b!246973 (= res!121074 (= (arrayCountValidKeys!0 (_keys!6685 thiss!1504) #b00000000000000000000000000000000 (size!6120 (_keys!6685 thiss!1504))) (_size!1873 thiss!1504)))))

(declare-fun b!246974 () Bool)

(declare-fun res!121075 () Bool)

(assert (=> b!246974 (=> (not res!121075) (not e!160213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12175 (_ BitVec 32)) Bool)

(assert (=> b!246974 (= res!121075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6685 thiss!1504) (mask!10693 thiss!1504)))))

(declare-fun b!246975 () Bool)

(assert (=> b!246975 (= e!160213 (arrayNoDuplicates!0 (_keys!6685 thiss!1504) #b00000000000000000000000000000000 Nil!3679))))

(assert (= (and d!60435 res!121073) b!246973))

(assert (= (and b!246973 res!121074) b!246974))

(assert (= (and b!246974 res!121075) b!246975))

(declare-fun m!264217 () Bool)

(assert (=> d!60435 m!264217))

(assert (=> b!246973 m!264023))

(declare-fun m!264219 () Bool)

(assert (=> b!246974 m!264219))

(declare-fun m!264221 () Bool)

(assert (=> b!246975 m!264221))

(assert (=> start!23488 d!60435))

(declare-fun mapIsEmpty!10928 () Bool)

(declare-fun mapRes!10928 () Bool)

(assert (=> mapIsEmpty!10928 mapRes!10928))

(declare-fun b!246982 () Bool)

(declare-fun e!160219 () Bool)

(assert (=> b!246982 (= e!160219 tp_is_empty!6435)))

(declare-fun b!246983 () Bool)

(declare-fun e!160218 () Bool)

(assert (=> b!246983 (= e!160218 tp_is_empty!6435)))

(declare-fun condMapEmpty!10928 () Bool)

(declare-fun mapDefault!10928 () ValueCell!2874)

(assert (=> mapNonEmpty!10922 (= condMapEmpty!10928 (= mapRest!10922 ((as const (Array (_ BitVec 32) ValueCell!2874)) mapDefault!10928)))))

(assert (=> mapNonEmpty!10922 (= tp!22960 (and e!160218 mapRes!10928))))

(declare-fun mapNonEmpty!10928 () Bool)

(declare-fun tp!22970 () Bool)

(assert (=> mapNonEmpty!10928 (= mapRes!10928 (and tp!22970 e!160219))))

(declare-fun mapValue!10928 () ValueCell!2874)

(declare-fun mapRest!10928 () (Array (_ BitVec 32) ValueCell!2874))

(declare-fun mapKey!10928 () (_ BitVec 32))

(assert (=> mapNonEmpty!10928 (= mapRest!10922 (store mapRest!10928 mapKey!10928 mapValue!10928))))

(assert (= (and mapNonEmpty!10922 condMapEmpty!10928) mapIsEmpty!10928))

(assert (= (and mapNonEmpty!10922 (not condMapEmpty!10928)) mapNonEmpty!10928))

(assert (= (and mapNonEmpty!10928 ((_ is ValueCellFull!2874) mapValue!10928)) b!246982))

(assert (= (and mapNonEmpty!10922 ((_ is ValueCellFull!2874) mapDefault!10928)) b!246983))

(declare-fun m!264223 () Bool)

(assert (=> mapNonEmpty!10928 m!264223))

(declare-fun b_lambda!8045 () Bool)

(assert (= b_lambda!8043 (or (and b!246723 b_free!6573) b_lambda!8045)))

(check-sat b_and!13575 (not b_lambda!8045) (not b!246965) (not b!246851) (not b!246847) tp_is_empty!6435 (not b!246974) (not d!60435) (not d!60409) (not b!246936) (not b!246846) (not bm!23104) (not d!60411) (not b!246845) (not b!246878) (not d!60431) (not b!246858) (not b!246799) (not bm!23097) (not bm!23110) (not bm!23093) (not b_next!6573) (not d!60407) (not b!246918) (not b!246875) (not b!246909) (not b!246975) (not b!246896) (not bm!23092) (not d!60433) (not d!60425) (not b!246860) (not b!246863) (not bm!23095) (not b!246801) (not mapNonEmpty!10928) (not b!246844) (not b!246973) (not d!60427) (not d!60423) (not bm!23103) (not bm!23100) (not b!246898) (not bm!23109) (not b!246913) (not b!246876) (not b!246899) (not b!246884))
(check-sat b_and!13575 (not b_next!6573))
