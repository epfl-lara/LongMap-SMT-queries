; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24276 () Bool)

(assert start!24276)

(declare-fun b!253790 () Bool)

(declare-fun b_free!6673 () Bool)

(declare-fun b_next!6673 () Bool)

(assert (=> b!253790 (= b_free!6673 (not b_next!6673))))

(declare-fun tp!23306 () Bool)

(declare-fun b_and!13689 () Bool)

(assert (=> b!253790 (= tp!23306 b_and!13689)))

(declare-fun b!253781 () Bool)

(declare-fun e!164505 () Bool)

(declare-fun tp_is_empty!6535 () Bool)

(assert (=> b!253781 (= e!164505 tp_is_empty!6535)))

(declare-fun res!124212 () Bool)

(declare-fun e!164515 () Bool)

(assert (=> start!24276 (=> (not res!124212) (not e!164515))))

(declare-datatypes ((V!8361 0))(
  ( (V!8362 (val!3312 Int)) )
))
(declare-datatypes ((ValueCell!2924 0))(
  ( (ValueCellFull!2924 (v!5380 V!8361)) (EmptyCell!2924) )
))
(declare-datatypes ((array!12393 0))(
  ( (array!12394 (arr!5871 (Array (_ BitVec 32) ValueCell!2924)) (size!6219 (_ BitVec 32))) )
))
(declare-datatypes ((array!12395 0))(
  ( (array!12396 (arr!5872 (Array (_ BitVec 32) (_ BitVec 64))) (size!6220 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3748 0))(
  ( (LongMapFixedSize!3749 (defaultEntry!4687 Int) (mask!10928 (_ BitVec 32)) (extraKeys!4424 (_ BitVec 32)) (zeroValue!4528 V!8361) (minValue!4528 V!8361) (_size!1923 (_ BitVec 32)) (_keys!6840 array!12395) (_values!4670 array!12393) (_vacant!1923 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3748)

(declare-fun valid!1466 (LongMapFixedSize!3748) Bool)

(assert (=> start!24276 (= res!124212 (valid!1466 thiss!1504))))

(assert (=> start!24276 e!164515))

(declare-fun e!164508 () Bool)

(assert (=> start!24276 e!164508))

(assert (=> start!24276 true))

(declare-fun b!253782 () Bool)

(declare-datatypes ((Unit!7825 0))(
  ( (Unit!7826) )
))
(declare-fun e!164507 () Unit!7825)

(declare-fun Unit!7827 () Unit!7825)

(assert (=> b!253782 (= e!164507 Unit!7827)))

(declare-fun bm!23937 () Bool)

(declare-fun call!23940 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23937 (= call!23940 (arrayContainsKey!0 (_keys!6840 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253783 () Bool)

(declare-fun res!124210 () Bool)

(declare-datatypes ((SeekEntryResult!1139 0))(
  ( (MissingZero!1139 (index!6726 (_ BitVec 32))) (Found!1139 (index!6727 (_ BitVec 32))) (Intermediate!1139 (undefined!1951 Bool) (index!6728 (_ BitVec 32)) (x!24838 (_ BitVec 32))) (Undefined!1139) (MissingVacant!1139 (index!6729 (_ BitVec 32))) )
))
(declare-fun lt!127084 () SeekEntryResult!1139)

(assert (=> b!253783 (= res!124210 (= (select (arr!5872 (_keys!6840 thiss!1504)) (index!6729 lt!127084)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164503 () Bool)

(assert (=> b!253783 (=> (not res!124210) (not e!164503))))

(declare-fun b!253784 () Bool)

(declare-fun e!164510 () Bool)

(assert (=> b!253784 (= e!164510 (not call!23940))))

(declare-fun b!253785 () Bool)

(declare-fun e!164504 () Bool)

(declare-fun mapRes!11118 () Bool)

(assert (=> b!253785 (= e!164504 (and e!164505 mapRes!11118))))

(declare-fun condMapEmpty!11118 () Bool)

(declare-fun mapDefault!11118 () ValueCell!2924)

(assert (=> b!253785 (= condMapEmpty!11118 (= (arr!5871 (_values!4670 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2924)) mapDefault!11118)))))

(declare-fun b!253786 () Bool)

(declare-fun res!124209 () Bool)

(declare-fun e!164512 () Bool)

(assert (=> b!253786 (=> res!124209 e!164512)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12395 (_ BitVec 32)) Bool)

(assert (=> b!253786 (= res!124209 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6840 thiss!1504) (mask!10928 thiss!1504))))))

(declare-fun b!253787 () Bool)

(declare-fun e!164511 () Bool)

(assert (=> b!253787 (= e!164515 e!164511)))

(declare-fun res!124214 () Bool)

(assert (=> b!253787 (=> (not res!124214) (not e!164511))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!253787 (= res!124214 (or (= lt!127084 (MissingZero!1139 index!297)) (= lt!127084 (MissingVacant!1139 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12395 (_ BitVec 32)) SeekEntryResult!1139)

(assert (=> b!253787 (= lt!127084 (seekEntryOrOpen!0 key!932 (_keys!6840 thiss!1504) (mask!10928 thiss!1504)))))

(declare-fun b!253788 () Bool)

(declare-fun res!124215 () Bool)

(assert (=> b!253788 (=> res!124215 e!164512)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253788 (= res!124215 (not (validKeyInArray!0 key!932)))))

(declare-fun b!253789 () Bool)

(declare-fun e!164513 () Bool)

(assert (=> b!253789 (= e!164513 e!164503)))

(declare-fun res!124221 () Bool)

(declare-fun call!23941 () Bool)

(assert (=> b!253789 (= res!124221 call!23941)))

(assert (=> b!253789 (=> (not res!124221) (not e!164503))))

(declare-fun array_inv!3873 (array!12395) Bool)

(declare-fun array_inv!3874 (array!12393) Bool)

(assert (=> b!253790 (= e!164508 (and tp!23306 tp_is_empty!6535 (array_inv!3873 (_keys!6840 thiss!1504)) (array_inv!3874 (_values!4670 thiss!1504)) e!164504))))

(declare-fun b!253791 () Bool)

(declare-fun e!164509 () Unit!7825)

(declare-fun lt!127077 () Unit!7825)

(assert (=> b!253791 (= e!164509 lt!127077)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!411 (array!12395 array!12393 (_ BitVec 32) (_ BitVec 32) V!8361 V!8361 (_ BitVec 64) Int) Unit!7825)

(assert (=> b!253791 (= lt!127077 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!411 (_keys!6840 thiss!1504) (_values!4670 thiss!1504) (mask!10928 thiss!1504) (extraKeys!4424 thiss!1504) (zeroValue!4528 thiss!1504) (minValue!4528 thiss!1504) key!932 (defaultEntry!4687 thiss!1504)))))

(declare-fun c!42801 () Bool)

(get-info :version)

(assert (=> b!253791 (= c!42801 ((_ is MissingZero!1139) lt!127084))))

(declare-fun e!164514 () Bool)

(assert (=> b!253791 e!164514))

(declare-fun b!253792 () Bool)

(declare-fun res!124216 () Bool)

(assert (=> b!253792 (=> res!124216 e!164512)))

(assert (=> b!253792 (= res!124216 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6220 (_keys!6840 thiss!1504)))))))

(declare-fun b!253793 () Bool)

(declare-fun res!124213 () Bool)

(assert (=> b!253793 (=> (not res!124213) (not e!164510))))

(assert (=> b!253793 (= res!124213 call!23941)))

(assert (=> b!253793 (= e!164514 e!164510)))

(declare-fun b!253794 () Bool)

(declare-fun res!124217 () Bool)

(assert (=> b!253794 (=> res!124217 e!164512)))

(declare-datatypes ((List!3733 0))(
  ( (Nil!3730) (Cons!3729 (h!4391 (_ BitVec 64)) (t!8771 List!3733)) )
))
(declare-fun arrayNoDuplicates!0 (array!12395 (_ BitVec 32) List!3733) Bool)

(assert (=> b!253794 (= res!124217 (not (arrayNoDuplicates!0 (_keys!6840 thiss!1504) #b00000000000000000000000000000000 Nil!3730)))))

(declare-fun mapNonEmpty!11118 () Bool)

(declare-fun tp!23307 () Bool)

(declare-fun e!164516 () Bool)

(assert (=> mapNonEmpty!11118 (= mapRes!11118 (and tp!23307 e!164516))))

(declare-fun mapValue!11118 () ValueCell!2924)

(declare-fun mapKey!11118 () (_ BitVec 32))

(declare-fun mapRest!11118 () (Array (_ BitVec 32) ValueCell!2924))

(assert (=> mapNonEmpty!11118 (= (arr!5871 (_values!4670 thiss!1504)) (store mapRest!11118 mapKey!11118 mapValue!11118))))

(declare-fun lt!127083 () Bool)

(declare-fun b!253795 () Bool)

(assert (=> b!253795 (= e!164512 (or (and (not (= (select (arr!5872 (_keys!6840 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5872 (_keys!6840 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000))) (not lt!127083)))))

(declare-fun bm!23938 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23938 (= call!23941 (inRange!0 (ite c!42801 (index!6726 lt!127084) (index!6729 lt!127084)) (mask!10928 thiss!1504)))))

(declare-fun b!253796 () Bool)

(assert (=> b!253796 (= e!164513 ((_ is Undefined!1139) lt!127084))))

(declare-fun b!253797 () Bool)

(declare-fun res!124211 () Bool)

(assert (=> b!253797 (=> (not res!124211) (not e!164510))))

(assert (=> b!253797 (= res!124211 (= (select (arr!5872 (_keys!6840 thiss!1504)) (index!6726 lt!127084)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253798 () Bool)

(declare-fun Unit!7828 () Unit!7825)

(assert (=> b!253798 (= e!164507 Unit!7828)))

(declare-fun lt!127082 () Unit!7825)

(declare-fun lemmaArrayContainsKeyThenInListMap!220 (array!12395 array!12393 (_ BitVec 32) (_ BitVec 32) V!8361 V!8361 (_ BitVec 64) (_ BitVec 32) Int) Unit!7825)

(assert (=> b!253798 (= lt!127082 (lemmaArrayContainsKeyThenInListMap!220 (_keys!6840 thiss!1504) (_values!4670 thiss!1504) (mask!10928 thiss!1504) (extraKeys!4424 thiss!1504) (zeroValue!4528 thiss!1504) (minValue!4528 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4687 thiss!1504)))))

(assert (=> b!253798 false))

(declare-fun b!253799 () Bool)

(assert (=> b!253799 (= e!164503 (not call!23940))))

(declare-fun b!253800 () Bool)

(declare-fun e!164506 () Bool)

(assert (=> b!253800 (= e!164506 (not e!164512))))

(declare-fun res!124222 () Bool)

(assert (=> b!253800 (=> res!124222 e!164512)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!253800 (= res!124222 (not (validMask!0 (mask!10928 thiss!1504))))))

(declare-fun lt!127086 () array!12395)

(assert (=> b!253800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127086 (mask!10928 thiss!1504))))

(declare-fun lt!127080 () Unit!7825)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12395 (_ BitVec 32) (_ BitVec 32)) Unit!7825)

(assert (=> b!253800 (= lt!127080 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6840 thiss!1504) index!297 (mask!10928 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12395 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!253800 (= (arrayCountValidKeys!0 lt!127086 #b00000000000000000000000000000000 (size!6220 (_keys!6840 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6840 thiss!1504) #b00000000000000000000000000000000 (size!6220 (_keys!6840 thiss!1504)))))))

(declare-fun lt!127078 () Unit!7825)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12395 (_ BitVec 32) (_ BitVec 64)) Unit!7825)

(assert (=> b!253800 (= lt!127078 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6840 thiss!1504) index!297 key!932))))

(assert (=> b!253800 (arrayNoDuplicates!0 lt!127086 #b00000000000000000000000000000000 Nil!3730)))

(assert (=> b!253800 (= lt!127086 (array!12396 (store (arr!5872 (_keys!6840 thiss!1504)) index!297 key!932) (size!6220 (_keys!6840 thiss!1504))))))

(declare-fun lt!127087 () Unit!7825)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12395 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3733) Unit!7825)

(assert (=> b!253800 (= lt!127087 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6840 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3730))))

(declare-fun lt!127085 () Unit!7825)

(assert (=> b!253800 (= lt!127085 e!164507)))

(declare-fun c!42804 () Bool)

(assert (=> b!253800 (= c!42804 lt!127083)))

(assert (=> b!253800 (= lt!127083 (arrayContainsKey!0 (_keys!6840 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253801 () Bool)

(assert (=> b!253801 (= e!164516 tp_is_empty!6535)))

(declare-fun b!253802 () Bool)

(assert (=> b!253802 (= e!164511 e!164506)))

(declare-fun res!124219 () Bool)

(assert (=> b!253802 (=> (not res!124219) (not e!164506))))

(assert (=> b!253802 (= res!124219 (inRange!0 index!297 (mask!10928 thiss!1504)))))

(declare-fun lt!127079 () Unit!7825)

(assert (=> b!253802 (= lt!127079 e!164509)))

(declare-fun c!42802 () Bool)

(declare-datatypes ((tuple2!4832 0))(
  ( (tuple2!4833 (_1!2427 (_ BitVec 64)) (_2!2427 V!8361)) )
))
(declare-datatypes ((List!3734 0))(
  ( (Nil!3731) (Cons!3730 (h!4392 tuple2!4832) (t!8772 List!3734)) )
))
(declare-datatypes ((ListLongMap!3735 0))(
  ( (ListLongMap!3736 (toList!1883 List!3734)) )
))
(declare-fun contains!1818 (ListLongMap!3735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1392 (array!12395 array!12393 (_ BitVec 32) (_ BitVec 32) V!8361 V!8361 (_ BitVec 32) Int) ListLongMap!3735)

(assert (=> b!253802 (= c!42802 (contains!1818 (getCurrentListMap!1392 (_keys!6840 thiss!1504) (_values!4670 thiss!1504) (mask!10928 thiss!1504) (extraKeys!4424 thiss!1504) (zeroValue!4528 thiss!1504) (minValue!4528 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4687 thiss!1504)) key!932))))

(declare-fun b!253803 () Bool)

(declare-fun c!42803 () Bool)

(assert (=> b!253803 (= c!42803 ((_ is MissingVacant!1139) lt!127084))))

(assert (=> b!253803 (= e!164514 e!164513)))

(declare-fun mapIsEmpty!11118 () Bool)

(assert (=> mapIsEmpty!11118 mapRes!11118))

(declare-fun b!253804 () Bool)

(declare-fun Unit!7829 () Unit!7825)

(assert (=> b!253804 (= e!164509 Unit!7829)))

(declare-fun lt!127081 () Unit!7825)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!411 (array!12395 array!12393 (_ BitVec 32) (_ BitVec 32) V!8361 V!8361 (_ BitVec 64) Int) Unit!7825)

(assert (=> b!253804 (= lt!127081 (lemmaInListMapThenSeekEntryOrOpenFindsIt!411 (_keys!6840 thiss!1504) (_values!4670 thiss!1504) (mask!10928 thiss!1504) (extraKeys!4424 thiss!1504) (zeroValue!4528 thiss!1504) (minValue!4528 thiss!1504) key!932 (defaultEntry!4687 thiss!1504)))))

(assert (=> b!253804 false))

(declare-fun b!253805 () Bool)

(declare-fun res!124220 () Bool)

(assert (=> b!253805 (=> (not res!124220) (not e!164515))))

(assert (=> b!253805 (= res!124220 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!253806 () Bool)

(declare-fun res!124218 () Bool)

(assert (=> b!253806 (=> res!124218 e!164512)))

(assert (=> b!253806 (= res!124218 (or (not (= (size!6219 (_values!4670 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10928 thiss!1504)))) (not (= (size!6220 (_keys!6840 thiss!1504)) (size!6219 (_values!4670 thiss!1504)))) (bvslt (mask!10928 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4424 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4424 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!24276 res!124212) b!253805))

(assert (= (and b!253805 res!124220) b!253787))

(assert (= (and b!253787 res!124214) b!253802))

(assert (= (and b!253802 c!42802) b!253804))

(assert (= (and b!253802 (not c!42802)) b!253791))

(assert (= (and b!253791 c!42801) b!253793))

(assert (= (and b!253791 (not c!42801)) b!253803))

(assert (= (and b!253793 res!124213) b!253797))

(assert (= (and b!253797 res!124211) b!253784))

(assert (= (and b!253803 c!42803) b!253789))

(assert (= (and b!253803 (not c!42803)) b!253796))

(assert (= (and b!253789 res!124221) b!253783))

(assert (= (and b!253783 res!124210) b!253799))

(assert (= (or b!253793 b!253789) bm!23938))

(assert (= (or b!253784 b!253799) bm!23937))

(assert (= (and b!253802 res!124219) b!253800))

(assert (= (and b!253800 c!42804) b!253798))

(assert (= (and b!253800 (not c!42804)) b!253782))

(assert (= (and b!253800 (not res!124222)) b!253806))

(assert (= (and b!253806 (not res!124218)) b!253786))

(assert (= (and b!253786 (not res!124209)) b!253794))

(assert (= (and b!253794 (not res!124217)) b!253792))

(assert (= (and b!253792 (not res!124216)) b!253788))

(assert (= (and b!253788 (not res!124215)) b!253795))

(assert (= (and b!253785 condMapEmpty!11118) mapIsEmpty!11118))

(assert (= (and b!253785 (not condMapEmpty!11118)) mapNonEmpty!11118))

(assert (= (and mapNonEmpty!11118 ((_ is ValueCellFull!2924) mapValue!11118)) b!253801))

(assert (= (and b!253785 ((_ is ValueCellFull!2924) mapDefault!11118)) b!253781))

(assert (= b!253790 b!253785))

(assert (= start!24276 b!253790))

(declare-fun m!269009 () Bool)

(assert (=> b!253786 m!269009))

(declare-fun m!269011 () Bool)

(assert (=> mapNonEmpty!11118 m!269011))

(declare-fun m!269013 () Bool)

(assert (=> b!253788 m!269013))

(declare-fun m!269015 () Bool)

(assert (=> b!253790 m!269015))

(declare-fun m!269017 () Bool)

(assert (=> b!253790 m!269017))

(declare-fun m!269019 () Bool)

(assert (=> b!253802 m!269019))

(declare-fun m!269021 () Bool)

(assert (=> b!253802 m!269021))

(assert (=> b!253802 m!269021))

(declare-fun m!269023 () Bool)

(assert (=> b!253802 m!269023))

(declare-fun m!269025 () Bool)

(assert (=> b!253798 m!269025))

(declare-fun m!269027 () Bool)

(assert (=> b!253787 m!269027))

(declare-fun m!269029 () Bool)

(assert (=> b!253795 m!269029))

(declare-fun m!269031 () Bool)

(assert (=> b!253804 m!269031))

(declare-fun m!269033 () Bool)

(assert (=> bm!23937 m!269033))

(declare-fun m!269035 () Bool)

(assert (=> b!253794 m!269035))

(declare-fun m!269037 () Bool)

(assert (=> b!253791 m!269037))

(declare-fun m!269039 () Bool)

(assert (=> b!253797 m!269039))

(declare-fun m!269041 () Bool)

(assert (=> start!24276 m!269041))

(declare-fun m!269043 () Bool)

(assert (=> b!253800 m!269043))

(assert (=> b!253800 m!269033))

(declare-fun m!269045 () Bool)

(assert (=> b!253800 m!269045))

(declare-fun m!269047 () Bool)

(assert (=> b!253800 m!269047))

(declare-fun m!269049 () Bool)

(assert (=> b!253800 m!269049))

(declare-fun m!269051 () Bool)

(assert (=> b!253800 m!269051))

(declare-fun m!269053 () Bool)

(assert (=> b!253800 m!269053))

(declare-fun m!269055 () Bool)

(assert (=> b!253800 m!269055))

(declare-fun m!269057 () Bool)

(assert (=> b!253800 m!269057))

(declare-fun m!269059 () Bool)

(assert (=> b!253800 m!269059))

(declare-fun m!269061 () Bool)

(assert (=> b!253783 m!269061))

(declare-fun m!269063 () Bool)

(assert (=> bm!23938 m!269063))

(check-sat (not bm!23938) (not b!253802) b_and!13689 (not start!24276) (not b!253786) (not b!253788) (not b!253794) (not b!253798) (not bm!23937) tp_is_empty!6535 (not b!253804) (not mapNonEmpty!11118) (not b!253791) (not b!253790) (not b_next!6673) (not b!253800) (not b!253787))
(check-sat b_and!13689 (not b_next!6673))
