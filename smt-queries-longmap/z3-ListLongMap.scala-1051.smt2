; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21990 () Bool)

(assert start!21990)

(declare-fun b!225817 () Bool)

(declare-fun b_free!6057 () Bool)

(declare-fun b_next!6057 () Bool)

(assert (=> b!225817 (= b_free!6057 (not b_next!6057))))

(declare-fun tp!21312 () Bool)

(declare-fun b_and!12955 () Bool)

(assert (=> b!225817 (= tp!21312 b_and!12955)))

(declare-fun b!225802 () Bool)

(declare-fun c!37440 () Bool)

(declare-datatypes ((SeekEntryResult!874 0))(
  ( (MissingZero!874 (index!5666 (_ BitVec 32))) (Found!874 (index!5667 (_ BitVec 32))) (Intermediate!874 (undefined!1686 Bool) (index!5668 (_ BitVec 32)) (x!23198 (_ BitVec 32))) (Undefined!874) (MissingVacant!874 (index!5669 (_ BitVec 32))) )
))
(declare-fun lt!113704 () SeekEntryResult!874)

(get-info :version)

(assert (=> b!225802 (= c!37440 ((_ is MissingVacant!874) lt!113704))))

(declare-fun e!146538 () Bool)

(declare-fun e!146547 () Bool)

(assert (=> b!225802 (= e!146538 e!146547)))

(declare-fun b!225803 () Bool)

(declare-fun res!111146 () Bool)

(declare-fun e!146540 () Bool)

(assert (=> b!225803 (=> (not res!111146) (not e!146540))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!225803 (= res!111146 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!225804 () Bool)

(declare-fun res!111138 () Bool)

(declare-fun e!146539 () Bool)

(assert (=> b!225804 (=> res!111138 e!146539)))

(declare-datatypes ((V!7539 0))(
  ( (V!7540 (val!3004 Int)) )
))
(declare-datatypes ((ValueCell!2616 0))(
  ( (ValueCellFull!2616 (v!5024 V!7539)) (EmptyCell!2616) )
))
(declare-datatypes ((array!11081 0))(
  ( (array!11082 (arr!5260 (Array (_ BitVec 32) ValueCell!2616)) (size!5593 (_ BitVec 32))) )
))
(declare-datatypes ((array!11083 0))(
  ( (array!11084 (arr!5261 (Array (_ BitVec 32) (_ BitVec 64))) (size!5594 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3132 0))(
  ( (LongMapFixedSize!3133 (defaultEntry!4225 Int) (mask!10071 (_ BitVec 32)) (extraKeys!3962 (_ BitVec 32)) (zeroValue!4066 V!7539) (minValue!4066 V!7539) (_size!1615 (_ BitVec 32)) (_keys!6279 array!11083) (_values!4208 array!11081) (_vacant!1615 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3132)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225804 (= res!111138 (or (not (= (size!5594 (_keys!6279 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10071 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5594 (_keys!6279 thiss!1504)))))))

(declare-fun mapIsEmpty!10048 () Bool)

(declare-fun mapRes!10048 () Bool)

(assert (=> mapIsEmpty!10048 mapRes!10048))

(declare-fun b!225806 () Bool)

(assert (=> b!225806 (= e!146547 ((_ is Undefined!874) lt!113704))))

(declare-fun b!225807 () Bool)

(declare-datatypes ((Unit!6813 0))(
  ( (Unit!6814) )
))
(declare-fun e!146536 () Unit!6813)

(declare-fun Unit!6815 () Unit!6813)

(assert (=> b!225807 (= e!146536 Unit!6815)))

(declare-fun lt!113712 () Unit!6813)

(declare-fun lemmaArrayContainsKeyThenInListMap!89 (array!11083 array!11081 (_ BitVec 32) (_ BitVec 32) V!7539 V!7539 (_ BitVec 64) (_ BitVec 32) Int) Unit!6813)

(assert (=> b!225807 (= lt!113712 (lemmaArrayContainsKeyThenInListMap!89 (_keys!6279 thiss!1504) (_values!4208 thiss!1504) (mask!10071 thiss!1504) (extraKeys!3962 thiss!1504) (zeroValue!4066 thiss!1504) (minValue!4066 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4225 thiss!1504)))))

(assert (=> b!225807 false))

(declare-fun b!225808 () Bool)

(declare-fun e!146549 () Bool)

(assert (=> b!225808 (= e!146549 (not e!146539))))

(declare-fun res!111136 () Bool)

(assert (=> b!225808 (=> res!111136 e!146539)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225808 (= res!111136 (not (validMask!0 (mask!10071 thiss!1504))))))

(declare-fun lt!113707 () array!11083)

(declare-fun arrayCountValidKeys!0 (array!11083 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225808 (= (arrayCountValidKeys!0 lt!113707 #b00000000000000000000000000000000 (size!5594 (_keys!6279 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6279 thiss!1504) #b00000000000000000000000000000000 (size!5594 (_keys!6279 thiss!1504)))))))

(declare-fun lt!113706 () Unit!6813)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11083 (_ BitVec 32) (_ BitVec 64)) Unit!6813)

(assert (=> b!225808 (= lt!113706 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6279 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3362 0))(
  ( (Nil!3359) (Cons!3358 (h!4006 (_ BitVec 64)) (t!8321 List!3362)) )
))
(declare-fun arrayNoDuplicates!0 (array!11083 (_ BitVec 32) List!3362) Bool)

(assert (=> b!225808 (arrayNoDuplicates!0 lt!113707 #b00000000000000000000000000000000 Nil!3359)))

(assert (=> b!225808 (= lt!113707 (array!11084 (store (arr!5261 (_keys!6279 thiss!1504)) index!297 key!932) (size!5594 (_keys!6279 thiss!1504))))))

(declare-fun lt!113709 () Unit!6813)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11083 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3362) Unit!6813)

(assert (=> b!225808 (= lt!113709 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6279 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3359))))

(declare-fun lt!113705 () Unit!6813)

(assert (=> b!225808 (= lt!113705 e!146536)))

(declare-fun c!37439 () Bool)

(declare-fun lt!113714 () Bool)

(assert (=> b!225808 (= c!37439 lt!113714)))

(declare-fun arrayContainsKey!0 (array!11083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225808 (= lt!113714 (arrayContainsKey!0 (_keys!6279 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225809 () Bool)

(declare-fun res!111147 () Bool)

(assert (=> b!225809 (= res!111147 (= (select (arr!5261 (_keys!6279 thiss!1504)) (index!5669 lt!113704)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146544 () Bool)

(assert (=> b!225809 (=> (not res!111147) (not e!146544))))

(declare-fun bm!21002 () Bool)

(declare-fun call!21006 () Bool)

(assert (=> bm!21002 (= call!21006 (arrayContainsKey!0 (_keys!6279 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225810 () Bool)

(declare-fun res!111140 () Bool)

(declare-fun e!146543 () Bool)

(assert (=> b!225810 (=> (not res!111140) (not e!146543))))

(declare-fun call!21005 () Bool)

(assert (=> b!225810 (= res!111140 call!21005)))

(assert (=> b!225810 (= e!146538 e!146543)))

(declare-fun b!225811 () Bool)

(declare-fun e!146546 () Unit!6813)

(declare-fun lt!113713 () Unit!6813)

(assert (=> b!225811 (= e!146546 lt!113713)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!263 (array!11083 array!11081 (_ BitVec 32) (_ BitVec 32) V!7539 V!7539 (_ BitVec 64) Int) Unit!6813)

(assert (=> b!225811 (= lt!113713 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!263 (_keys!6279 thiss!1504) (_values!4208 thiss!1504) (mask!10071 thiss!1504) (extraKeys!3962 thiss!1504) (zeroValue!4066 thiss!1504) (minValue!4066 thiss!1504) key!932 (defaultEntry!4225 thiss!1504)))))

(declare-fun c!37437 () Bool)

(assert (=> b!225811 (= c!37437 ((_ is MissingZero!874) lt!113704))))

(assert (=> b!225811 e!146538))

(declare-fun b!225812 () Bool)

(declare-fun e!146545 () Bool)

(declare-fun tp_is_empty!5919 () Bool)

(assert (=> b!225812 (= e!146545 tp_is_empty!5919)))

(declare-fun b!225813 () Bool)

(declare-fun Unit!6816 () Unit!6813)

(assert (=> b!225813 (= e!146536 Unit!6816)))

(declare-fun b!225814 () Bool)

(declare-fun e!146541 () Bool)

(assert (=> b!225814 (= e!146541 (and e!146545 mapRes!10048))))

(declare-fun condMapEmpty!10048 () Bool)

(declare-fun mapDefault!10048 () ValueCell!2616)

(assert (=> b!225814 (= condMapEmpty!10048 (= (arr!5260 (_values!4208 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2616)) mapDefault!10048)))))

(declare-fun b!225815 () Bool)

(declare-fun res!111148 () Bool)

(assert (=> b!225815 (=> res!111148 e!146539)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225815 (= res!111148 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225816 () Bool)

(declare-fun e!146535 () Bool)

(assert (=> b!225816 (= e!146540 e!146535)))

(declare-fun res!111142 () Bool)

(assert (=> b!225816 (=> (not res!111142) (not e!146535))))

(assert (=> b!225816 (= res!111142 (or (= lt!113704 (MissingZero!874 index!297)) (= lt!113704 (MissingVacant!874 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11083 (_ BitVec 32)) SeekEntryResult!874)

(assert (=> b!225816 (= lt!113704 (seekEntryOrOpen!0 key!932 (_keys!6279 thiss!1504) (mask!10071 thiss!1504)))))

(declare-fun res!111139 () Bool)

(assert (=> start!21990 (=> (not res!111139) (not e!146540))))

(declare-fun valid!1261 (LongMapFixedSize!3132) Bool)

(assert (=> start!21990 (= res!111139 (valid!1261 thiss!1504))))

(assert (=> start!21990 e!146540))

(declare-fun e!146542 () Bool)

(assert (=> start!21990 e!146542))

(assert (=> start!21990 true))

(declare-fun b!225805 () Bool)

(assert (=> b!225805 (= e!146543 (not call!21006))))

(declare-fun array_inv!3481 (array!11083) Bool)

(declare-fun array_inv!3482 (array!11081) Bool)

(assert (=> b!225817 (= e!146542 (and tp!21312 tp_is_empty!5919 (array_inv!3481 (_keys!6279 thiss!1504)) (array_inv!3482 (_values!4208 thiss!1504)) e!146541))))

(declare-fun bm!21003 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21003 (= call!21005 (inRange!0 (ite c!37437 (index!5666 lt!113704) (index!5669 lt!113704)) (mask!10071 thiss!1504)))))

(declare-fun b!225818 () Bool)

(declare-fun res!111143 () Bool)

(assert (=> b!225818 (=> (not res!111143) (not e!146543))))

(assert (=> b!225818 (= res!111143 (= (select (arr!5261 (_keys!6279 thiss!1504)) (index!5666 lt!113704)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225819 () Bool)

(declare-fun res!111141 () Bool)

(assert (=> b!225819 (=> res!111141 e!146539)))

(assert (=> b!225819 (= res!111141 lt!113714)))

(declare-fun b!225820 () Bool)

(assert (=> b!225820 (= e!146539 true)))

(declare-fun lt!113711 () Bool)

(assert (=> b!225820 (= lt!113711 (arrayNoDuplicates!0 (_keys!6279 thiss!1504) #b00000000000000000000000000000000 Nil!3359))))

(declare-fun b!225821 () Bool)

(assert (=> b!225821 (= e!146547 e!146544)))

(declare-fun res!111144 () Bool)

(assert (=> b!225821 (= res!111144 call!21005)))

(assert (=> b!225821 (=> (not res!111144) (not e!146544))))

(declare-fun b!225822 () Bool)

(declare-fun e!146548 () Bool)

(assert (=> b!225822 (= e!146548 tp_is_empty!5919)))

(declare-fun b!225823 () Bool)

(assert (=> b!225823 (= e!146535 e!146549)))

(declare-fun res!111137 () Bool)

(assert (=> b!225823 (=> (not res!111137) (not e!146549))))

(assert (=> b!225823 (= res!111137 (inRange!0 index!297 (mask!10071 thiss!1504)))))

(declare-fun lt!113708 () Unit!6813)

(assert (=> b!225823 (= lt!113708 e!146546)))

(declare-fun c!37438 () Bool)

(declare-datatypes ((tuple2!4448 0))(
  ( (tuple2!4449 (_1!2235 (_ BitVec 64)) (_2!2235 V!7539)) )
))
(declare-datatypes ((List!3363 0))(
  ( (Nil!3360) (Cons!3359 (h!4007 tuple2!4448) (t!8322 List!3363)) )
))
(declare-datatypes ((ListLongMap!3361 0))(
  ( (ListLongMap!3362 (toList!1696 List!3363)) )
))
(declare-fun contains!1570 (ListLongMap!3361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1224 (array!11083 array!11081 (_ BitVec 32) (_ BitVec 32) V!7539 V!7539 (_ BitVec 32) Int) ListLongMap!3361)

(assert (=> b!225823 (= c!37438 (contains!1570 (getCurrentListMap!1224 (_keys!6279 thiss!1504) (_values!4208 thiss!1504) (mask!10071 thiss!1504) (extraKeys!3962 thiss!1504) (zeroValue!4066 thiss!1504) (minValue!4066 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4225 thiss!1504)) key!932))))

(declare-fun b!225824 () Bool)

(declare-fun res!111145 () Bool)

(assert (=> b!225824 (=> res!111145 e!146539)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11083 (_ BitVec 32)) Bool)

(assert (=> b!225824 (= res!111145 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6279 thiss!1504) (mask!10071 thiss!1504))))))

(declare-fun b!225825 () Bool)

(assert (=> b!225825 (= e!146544 (not call!21006))))

(declare-fun mapNonEmpty!10048 () Bool)

(declare-fun tp!21313 () Bool)

(assert (=> mapNonEmpty!10048 (= mapRes!10048 (and tp!21313 e!146548))))

(declare-fun mapKey!10048 () (_ BitVec 32))

(declare-fun mapRest!10048 () (Array (_ BitVec 32) ValueCell!2616))

(declare-fun mapValue!10048 () ValueCell!2616)

(assert (=> mapNonEmpty!10048 (= (arr!5260 (_values!4208 thiss!1504)) (store mapRest!10048 mapKey!10048 mapValue!10048))))

(declare-fun b!225826 () Bool)

(declare-fun Unit!6817 () Unit!6813)

(assert (=> b!225826 (= e!146546 Unit!6817)))

(declare-fun lt!113710 () Unit!6813)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!250 (array!11083 array!11081 (_ BitVec 32) (_ BitVec 32) V!7539 V!7539 (_ BitVec 64) Int) Unit!6813)

(assert (=> b!225826 (= lt!113710 (lemmaInListMapThenSeekEntryOrOpenFindsIt!250 (_keys!6279 thiss!1504) (_values!4208 thiss!1504) (mask!10071 thiss!1504) (extraKeys!3962 thiss!1504) (zeroValue!4066 thiss!1504) (minValue!4066 thiss!1504) key!932 (defaultEntry!4225 thiss!1504)))))

(assert (=> b!225826 false))

(assert (= (and start!21990 res!111139) b!225803))

(assert (= (and b!225803 res!111146) b!225816))

(assert (= (and b!225816 res!111142) b!225823))

(assert (= (and b!225823 c!37438) b!225826))

(assert (= (and b!225823 (not c!37438)) b!225811))

(assert (= (and b!225811 c!37437) b!225810))

(assert (= (and b!225811 (not c!37437)) b!225802))

(assert (= (and b!225810 res!111140) b!225818))

(assert (= (and b!225818 res!111143) b!225805))

(assert (= (and b!225802 c!37440) b!225821))

(assert (= (and b!225802 (not c!37440)) b!225806))

(assert (= (and b!225821 res!111144) b!225809))

(assert (= (and b!225809 res!111147) b!225825))

(assert (= (or b!225810 b!225821) bm!21003))

(assert (= (or b!225805 b!225825) bm!21002))

(assert (= (and b!225823 res!111137) b!225808))

(assert (= (and b!225808 c!37439) b!225807))

(assert (= (and b!225808 (not c!37439)) b!225813))

(assert (= (and b!225808 (not res!111136)) b!225804))

(assert (= (and b!225804 (not res!111138)) b!225815))

(assert (= (and b!225815 (not res!111148)) b!225819))

(assert (= (and b!225819 (not res!111141)) b!225824))

(assert (= (and b!225824 (not res!111145)) b!225820))

(assert (= (and b!225814 condMapEmpty!10048) mapIsEmpty!10048))

(assert (= (and b!225814 (not condMapEmpty!10048)) mapNonEmpty!10048))

(assert (= (and mapNonEmpty!10048 ((_ is ValueCellFull!2616) mapValue!10048)) b!225822))

(assert (= (and b!225814 ((_ is ValueCellFull!2616) mapDefault!10048)) b!225812))

(assert (= b!225817 b!225814))

(assert (= start!21990 b!225817))

(declare-fun m!248299 () Bool)

(assert (=> b!225818 m!248299))

(declare-fun m!248301 () Bool)

(assert (=> b!225808 m!248301))

(declare-fun m!248303 () Bool)

(assert (=> b!225808 m!248303))

(declare-fun m!248305 () Bool)

(assert (=> b!225808 m!248305))

(declare-fun m!248307 () Bool)

(assert (=> b!225808 m!248307))

(declare-fun m!248309 () Bool)

(assert (=> b!225808 m!248309))

(declare-fun m!248311 () Bool)

(assert (=> b!225808 m!248311))

(declare-fun m!248313 () Bool)

(assert (=> b!225808 m!248313))

(declare-fun m!248315 () Bool)

(assert (=> b!225808 m!248315))

(declare-fun m!248317 () Bool)

(assert (=> b!225807 m!248317))

(declare-fun m!248319 () Bool)

(assert (=> bm!21003 m!248319))

(declare-fun m!248321 () Bool)

(assert (=> mapNonEmpty!10048 m!248321))

(declare-fun m!248323 () Bool)

(assert (=> b!225826 m!248323))

(declare-fun m!248325 () Bool)

(assert (=> b!225815 m!248325))

(declare-fun m!248327 () Bool)

(assert (=> b!225823 m!248327))

(declare-fun m!248329 () Bool)

(assert (=> b!225823 m!248329))

(assert (=> b!225823 m!248329))

(declare-fun m!248331 () Bool)

(assert (=> b!225823 m!248331))

(declare-fun m!248333 () Bool)

(assert (=> b!225817 m!248333))

(declare-fun m!248335 () Bool)

(assert (=> b!225817 m!248335))

(declare-fun m!248337 () Bool)

(assert (=> start!21990 m!248337))

(declare-fun m!248339 () Bool)

(assert (=> b!225809 m!248339))

(assert (=> bm!21002 m!248303))

(declare-fun m!248341 () Bool)

(assert (=> b!225824 m!248341))

(declare-fun m!248343 () Bool)

(assert (=> b!225820 m!248343))

(declare-fun m!248345 () Bool)

(assert (=> b!225811 m!248345))

(declare-fun m!248347 () Bool)

(assert (=> b!225816 m!248347))

(check-sat tp_is_empty!5919 (not b_next!6057) (not mapNonEmpty!10048) (not b!225826) (not b!225817) (not b!225820) b_and!12955 (not b!225807) (not b!225823) (not b!225808) (not b!225815) (not b!225824) (not bm!21003) (not start!21990) (not b!225816) (not bm!21002) (not b!225811))
(check-sat b_and!12955 (not b_next!6057))
