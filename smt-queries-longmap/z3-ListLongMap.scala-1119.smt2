; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22962 () Bool)

(assert start!22962)

(declare-fun b!240411 () Bool)

(declare-fun b_free!6465 () Bool)

(declare-fun b_next!6465 () Bool)

(assert (=> b!240411 (= b_free!6465 (not b_next!6465))))

(declare-fun tp!22598 () Bool)

(declare-fun b_and!13431 () Bool)

(assert (=> b!240411 (= tp!22598 b_and!13431)))

(declare-fun b!240394 () Bool)

(declare-fun e!156033 () Bool)

(declare-fun call!22356 () Bool)

(assert (=> b!240394 (= e!156033 (not call!22356))))

(declare-fun b!240395 () Bool)

(declare-fun res!117864 () Bool)

(declare-fun e!156044 () Bool)

(assert (=> b!240395 (=> (not res!117864) (not e!156044))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!240395 (= res!117864 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!22353 () Bool)

(declare-datatypes ((V!8083 0))(
  ( (V!8084 (val!3208 Int)) )
))
(declare-datatypes ((ValueCell!2820 0))(
  ( (ValueCellFull!2820 (v!5246 V!8083)) (EmptyCell!2820) )
))
(declare-datatypes ((array!11933 0))(
  ( (array!11934 (arr!5668 (Array (_ BitVec 32) ValueCell!2820)) (size!6009 (_ BitVec 32))) )
))
(declare-datatypes ((array!11935 0))(
  ( (array!11936 (arr!5669 (Array (_ BitVec 32) (_ BitVec 64))) (size!6010 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3540 0))(
  ( (LongMapFixedSize!3541 (defaultEntry!4455 Int) (mask!10511 (_ BitVec 32)) (extraKeys!4192 (_ BitVec 32)) (zeroValue!4296 V!8083) (minValue!4296 V!8083) (_size!1819 (_ BitVec 32)) (_keys!6557 array!11935) (_values!4438 array!11933) (_vacant!1819 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3540)

(declare-fun arrayContainsKey!0 (array!11935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22353 (= call!22356 (arrayContainsKey!0 (_keys!6557 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240396 () Bool)

(declare-fun e!156036 () Bool)

(assert (=> b!240396 (= e!156036 (not call!22356))))

(declare-fun b!240397 () Bool)

(declare-fun res!117871 () Bool)

(declare-fun e!156035 () Bool)

(assert (=> b!240397 (=> (not res!117871) (not e!156035))))

(assert (=> b!240397 (= res!117871 (and (= (size!6009 (_values!4438 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10511 thiss!1504))) (= (size!6010 (_keys!6557 thiss!1504)) (size!6009 (_values!4438 thiss!1504))) (bvsge (mask!10511 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4192 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4192 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!240398 () Bool)

(declare-fun res!117865 () Bool)

(declare-datatypes ((SeekEntryResult!1045 0))(
  ( (MissingZero!1045 (index!6350 (_ BitVec 32))) (Found!1045 (index!6351 (_ BitVec 32))) (Intermediate!1045 (undefined!1857 Bool) (index!6352 (_ BitVec 32)) (x!24157 (_ BitVec 32))) (Undefined!1045) (MissingVacant!1045 (index!6353 (_ BitVec 32))) )
))
(declare-fun lt!120967 () SeekEntryResult!1045)

(assert (=> b!240398 (= res!117865 (= (select (arr!5669 (_keys!6557 thiss!1504)) (index!6353 lt!120967)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240398 (=> (not res!117865) (not e!156036))))

(declare-fun b!240399 () Bool)

(declare-datatypes ((Unit!7394 0))(
  ( (Unit!7395) )
))
(declare-fun e!156043 () Unit!7394)

(declare-fun lt!120966 () Unit!7394)

(assert (=> b!240399 (= e!156043 lt!120966)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!351 (array!11935 array!11933 (_ BitVec 32) (_ BitVec 32) V!8083 V!8083 (_ BitVec 64) Int) Unit!7394)

(assert (=> b!240399 (= lt!120966 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!351 (_keys!6557 thiss!1504) (_values!4438 thiss!1504) (mask!10511 thiss!1504) (extraKeys!4192 thiss!1504) (zeroValue!4296 thiss!1504) (minValue!4296 thiss!1504) key!932 (defaultEntry!4455 thiss!1504)))))

(declare-fun c!40045 () Bool)

(get-info :version)

(assert (=> b!240399 (= c!40045 ((_ is MissingZero!1045) lt!120967))))

(declare-fun e!156041 () Bool)

(assert (=> b!240399 e!156041))

(declare-fun b!240400 () Bool)

(declare-fun res!117875 () Bool)

(assert (=> b!240400 (=> (not res!117875) (not e!156035))))

(assert (=> b!240400 (= res!117875 (arrayContainsKey!0 (_keys!6557 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240401 () Bool)

(declare-fun res!117862 () Bool)

(assert (=> b!240401 (=> (not res!117862) (not e!156035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!240401 (= res!117862 (validKeyInArray!0 key!932))))

(declare-fun b!240402 () Bool)

(assert (=> b!240402 (= e!156035 (bvsge #b00000000000000000000000000000000 (size!6010 (_keys!6557 thiss!1504))))))

(declare-fun b!240403 () Bool)

(declare-fun e!156039 () Bool)

(assert (=> b!240403 (= e!156039 e!156036)))

(declare-fun res!117872 () Bool)

(declare-fun call!22355 () Bool)

(assert (=> b!240403 (= res!117872 call!22355)))

(assert (=> b!240403 (=> (not res!117872) (not e!156036))))

(declare-fun b!240404 () Bool)

(declare-fun c!40046 () Bool)

(assert (=> b!240404 (= c!40046 ((_ is MissingVacant!1045) lt!120967))))

(assert (=> b!240404 (= e!156041 e!156039)))

(declare-fun mapIsEmpty!10722 () Bool)

(declare-fun mapRes!10722 () Bool)

(assert (=> mapIsEmpty!10722 mapRes!10722))

(declare-fun b!240405 () Bool)

(assert (=> b!240405 (= e!156039 ((_ is Undefined!1045) lt!120967))))

(declare-fun b!240406 () Bool)

(declare-fun e!156034 () Bool)

(assert (=> b!240406 (= e!156034 e!156035)))

(declare-fun res!117870 () Bool)

(assert (=> b!240406 (=> (not res!117870) (not e!156035))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240406 (= res!117870 (inRange!0 index!297 (mask!10511 thiss!1504)))))

(declare-fun lt!120968 () Unit!7394)

(assert (=> b!240406 (= lt!120968 e!156043)))

(declare-fun c!40044 () Bool)

(declare-datatypes ((tuple2!4728 0))(
  ( (tuple2!4729 (_1!2375 (_ BitVec 64)) (_2!2375 V!8083)) )
))
(declare-datatypes ((List!3611 0))(
  ( (Nil!3608) (Cons!3607 (h!4263 tuple2!4728) (t!8606 List!3611)) )
))
(declare-datatypes ((ListLongMap!3641 0))(
  ( (ListLongMap!3642 (toList!1836 List!3611)) )
))
(declare-fun contains!1724 (ListLongMap!3641 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1364 (array!11935 array!11933 (_ BitVec 32) (_ BitVec 32) V!8083 V!8083 (_ BitVec 32) Int) ListLongMap!3641)

(assert (=> b!240406 (= c!40044 (contains!1724 (getCurrentListMap!1364 (_keys!6557 thiss!1504) (_values!4438 thiss!1504) (mask!10511 thiss!1504) (extraKeys!4192 thiss!1504) (zeroValue!4296 thiss!1504) (minValue!4296 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4455 thiss!1504)) key!932))))

(declare-fun b!240407 () Bool)

(declare-fun res!117874 () Bool)

(assert (=> b!240407 (=> (not res!117874) (not e!156033))))

(assert (=> b!240407 (= res!117874 call!22355)))

(assert (=> b!240407 (= e!156041 e!156033)))

(declare-fun b!240408 () Bool)

(assert (=> b!240408 (= e!156044 e!156034)))

(declare-fun res!117868 () Bool)

(assert (=> b!240408 (=> (not res!117868) (not e!156034))))

(assert (=> b!240408 (= res!117868 (or (= lt!120967 (MissingZero!1045 index!297)) (= lt!120967 (MissingVacant!1045 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11935 (_ BitVec 32)) SeekEntryResult!1045)

(assert (=> b!240408 (= lt!120967 (seekEntryOrOpen!0 key!932 (_keys!6557 thiss!1504) (mask!10511 thiss!1504)))))

(declare-fun b!240409 () Bool)

(declare-fun res!117873 () Bool)

(assert (=> b!240409 (=> (not res!117873) (not e!156035))))

(declare-datatypes ((List!3612 0))(
  ( (Nil!3609) (Cons!3608 (h!4264 (_ BitVec 64)) (t!8607 List!3612)) )
))
(declare-fun arrayNoDuplicates!0 (array!11935 (_ BitVec 32) List!3612) Bool)

(assert (=> b!240409 (= res!117873 (arrayNoDuplicates!0 (_keys!6557 thiss!1504) #b00000000000000000000000000000000 Nil!3609))))

(declare-fun bm!22352 () Bool)

(assert (=> bm!22352 (= call!22355 (inRange!0 (ite c!40045 (index!6350 lt!120967) (index!6353 lt!120967)) (mask!10511 thiss!1504)))))

(declare-fun res!117866 () Bool)

(assert (=> start!22962 (=> (not res!117866) (not e!156044))))

(declare-fun valid!1393 (LongMapFixedSize!3540) Bool)

(assert (=> start!22962 (= res!117866 (valid!1393 thiss!1504))))

(assert (=> start!22962 e!156044))

(declare-fun e!156038 () Bool)

(assert (=> start!22962 e!156038))

(assert (=> start!22962 true))

(declare-fun b!240410 () Bool)

(declare-fun e!156045 () Bool)

(declare-fun tp_is_empty!6327 () Bool)

(assert (=> b!240410 (= e!156045 tp_is_empty!6327)))

(declare-fun mapNonEmpty!10722 () Bool)

(declare-fun tp!22599 () Bool)

(declare-fun e!156042 () Bool)

(assert (=> mapNonEmpty!10722 (= mapRes!10722 (and tp!22599 e!156042))))

(declare-fun mapKey!10722 () (_ BitVec 32))

(declare-fun mapRest!10722 () (Array (_ BitVec 32) ValueCell!2820))

(declare-fun mapValue!10722 () ValueCell!2820)

(assert (=> mapNonEmpty!10722 (= (arr!5668 (_values!4438 thiss!1504)) (store mapRest!10722 mapKey!10722 mapValue!10722))))

(declare-fun e!156040 () Bool)

(declare-fun array_inv!3751 (array!11935) Bool)

(declare-fun array_inv!3752 (array!11933) Bool)

(assert (=> b!240411 (= e!156038 (and tp!22598 tp_is_empty!6327 (array_inv!3751 (_keys!6557 thiss!1504)) (array_inv!3752 (_values!4438 thiss!1504)) e!156040))))

(declare-fun b!240412 () Bool)

(declare-fun res!117863 () Bool)

(assert (=> b!240412 (=> (not res!117863) (not e!156035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!240412 (= res!117863 (validMask!0 (mask!10511 thiss!1504)))))

(declare-fun b!240413 () Bool)

(declare-fun res!117869 () Bool)

(assert (=> b!240413 (=> (not res!117869) (not e!156033))))

(assert (=> b!240413 (= res!117869 (= (select (arr!5669 (_keys!6557 thiss!1504)) (index!6350 lt!120967)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240414 () Bool)

(assert (=> b!240414 (= e!156040 (and e!156045 mapRes!10722))))

(declare-fun condMapEmpty!10722 () Bool)

(declare-fun mapDefault!10722 () ValueCell!2820)

(assert (=> b!240414 (= condMapEmpty!10722 (= (arr!5668 (_values!4438 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2820)) mapDefault!10722)))))

(declare-fun b!240415 () Bool)

(declare-fun res!117867 () Bool)

(assert (=> b!240415 (=> (not res!117867) (not e!156035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11935 (_ BitVec 32)) Bool)

(assert (=> b!240415 (= res!117867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6557 thiss!1504) (mask!10511 thiss!1504)))))

(declare-fun b!240416 () Bool)

(assert (=> b!240416 (= e!156042 tp_is_empty!6327)))

(declare-fun b!240417 () Bool)

(declare-fun Unit!7396 () Unit!7394)

(assert (=> b!240417 (= e!156043 Unit!7396)))

(declare-fun lt!120969 () Unit!7394)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!340 (array!11935 array!11933 (_ BitVec 32) (_ BitVec 32) V!8083 V!8083 (_ BitVec 64) Int) Unit!7394)

(assert (=> b!240417 (= lt!120969 (lemmaInListMapThenSeekEntryOrOpenFindsIt!340 (_keys!6557 thiss!1504) (_values!4438 thiss!1504) (mask!10511 thiss!1504) (extraKeys!4192 thiss!1504) (zeroValue!4296 thiss!1504) (minValue!4296 thiss!1504) key!932 (defaultEntry!4455 thiss!1504)))))

(assert (=> b!240417 false))

(assert (= (and start!22962 res!117866) b!240395))

(assert (= (and b!240395 res!117864) b!240408))

(assert (= (and b!240408 res!117868) b!240406))

(assert (= (and b!240406 c!40044) b!240417))

(assert (= (and b!240406 (not c!40044)) b!240399))

(assert (= (and b!240399 c!40045) b!240407))

(assert (= (and b!240399 (not c!40045)) b!240404))

(assert (= (and b!240407 res!117874) b!240413))

(assert (= (and b!240413 res!117869) b!240394))

(assert (= (and b!240404 c!40046) b!240403))

(assert (= (and b!240404 (not c!40046)) b!240405))

(assert (= (and b!240403 res!117872) b!240398))

(assert (= (and b!240398 res!117865) b!240396))

(assert (= (or b!240407 b!240403) bm!22352))

(assert (= (or b!240394 b!240396) bm!22353))

(assert (= (and b!240406 res!117870) b!240400))

(assert (= (and b!240400 res!117875) b!240412))

(assert (= (and b!240412 res!117863) b!240397))

(assert (= (and b!240397 res!117871) b!240415))

(assert (= (and b!240415 res!117867) b!240409))

(assert (= (and b!240409 res!117873) b!240401))

(assert (= (and b!240401 res!117862) b!240402))

(assert (= (and b!240414 condMapEmpty!10722) mapIsEmpty!10722))

(assert (= (and b!240414 (not condMapEmpty!10722)) mapNonEmpty!10722))

(assert (= (and mapNonEmpty!10722 ((_ is ValueCellFull!2820) mapValue!10722)) b!240416))

(assert (= (and b!240414 ((_ is ValueCellFull!2820) mapDefault!10722)) b!240410))

(assert (= b!240411 b!240414))

(assert (= start!22962 b!240411))

(declare-fun m!259991 () Bool)

(assert (=> b!240398 m!259991))

(declare-fun m!259993 () Bool)

(assert (=> b!240411 m!259993))

(declare-fun m!259995 () Bool)

(assert (=> b!240411 m!259995))

(declare-fun m!259997 () Bool)

(assert (=> b!240408 m!259997))

(declare-fun m!259999 () Bool)

(assert (=> b!240401 m!259999))

(declare-fun m!260001 () Bool)

(assert (=> mapNonEmpty!10722 m!260001))

(declare-fun m!260003 () Bool)

(assert (=> b!240409 m!260003))

(declare-fun m!260005 () Bool)

(assert (=> bm!22352 m!260005))

(declare-fun m!260007 () Bool)

(assert (=> start!22962 m!260007))

(declare-fun m!260009 () Bool)

(assert (=> bm!22353 m!260009))

(declare-fun m!260011 () Bool)

(assert (=> b!240417 m!260011))

(declare-fun m!260013 () Bool)

(assert (=> b!240406 m!260013))

(declare-fun m!260015 () Bool)

(assert (=> b!240406 m!260015))

(assert (=> b!240406 m!260015))

(declare-fun m!260017 () Bool)

(assert (=> b!240406 m!260017))

(declare-fun m!260019 () Bool)

(assert (=> b!240412 m!260019))

(declare-fun m!260021 () Bool)

(assert (=> b!240415 m!260021))

(declare-fun m!260023 () Bool)

(assert (=> b!240413 m!260023))

(assert (=> b!240400 m!260009))

(declare-fun m!260025 () Bool)

(assert (=> b!240399 m!260025))

(check-sat (not b!240415) (not bm!22353) b_and!13431 (not mapNonEmpty!10722) (not b_next!6465) (not b!240399) (not b!240401) (not b!240408) (not b!240409) (not bm!22352) (not start!22962) tp_is_empty!6327 (not b!240400) (not b!240417) (not b!240406) (not b!240411) (not b!240412))
(check-sat b_and!13431 (not b_next!6465))
