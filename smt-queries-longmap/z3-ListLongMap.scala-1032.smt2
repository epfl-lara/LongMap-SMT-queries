; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21878 () Bool)

(assert start!21878)

(declare-fun b!220921 () Bool)

(declare-fun b_free!5941 () Bool)

(declare-fun b_next!5941 () Bool)

(assert (=> b!220921 (= b_free!5941 (not b_next!5941))))

(declare-fun tp!20965 () Bool)

(declare-fun b_and!12813 () Bool)

(assert (=> b!220921 (= tp!20965 b_and!12813)))

(declare-fun b!220903 () Bool)

(declare-fun e!143596 () Bool)

(assert (=> b!220903 (= e!143596 false)))

(declare-fun lt!112140 () Bool)

(declare-datatypes ((V!7385 0))(
  ( (V!7386 (val!2946 Int)) )
))
(declare-datatypes ((ValueCell!2558 0))(
  ( (ValueCellFull!2558 (v!4960 V!7385)) (EmptyCell!2558) )
))
(declare-datatypes ((array!10841 0))(
  ( (array!10842 (arr!5139 (Array (_ BitVec 32) ValueCell!2558)) (size!5473 (_ BitVec 32))) )
))
(declare-datatypes ((array!10843 0))(
  ( (array!10844 (arr!5140 (Array (_ BitVec 32) (_ BitVec 64))) (size!5474 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3016 0))(
  ( (LongMapFixedSize!3017 (defaultEntry!4167 Int) (mask!9974 (_ BitVec 32)) (extraKeys!3904 (_ BitVec 32)) (zeroValue!4008 V!7385) (minValue!4008 V!7385) (_size!1557 (_ BitVec 32)) (_keys!6220 array!10843) (_values!4150 array!10841) (_vacant!1557 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3016)

(declare-datatypes ((List!3257 0))(
  ( (Nil!3254) (Cons!3253 (h!3901 (_ BitVec 64)) (t!8207 List!3257)) )
))
(declare-fun arrayNoDuplicates!0 (array!10843 (_ BitVec 32) List!3257) Bool)

(assert (=> b!220903 (= lt!112140 (arrayNoDuplicates!0 (_keys!6220 thiss!1504) #b00000000000000000000000000000000 Nil!3254))))

(declare-fun b!220904 () Bool)

(declare-fun res!108330 () Bool)

(declare-datatypes ((SeekEntryResult!815 0))(
  ( (MissingZero!815 (index!5430 (_ BitVec 32))) (Found!815 (index!5431 (_ BitVec 32))) (Intermediate!815 (undefined!1627 Bool) (index!5432 (_ BitVec 32)) (x!22986 (_ BitVec 32))) (Undefined!815) (MissingVacant!815 (index!5433 (_ BitVec 32))) )
))
(declare-fun lt!112141 () SeekEntryResult!815)

(assert (=> b!220904 (= res!108330 (= (select (arr!5140 (_keys!6220 thiss!1504)) (index!5433 lt!112141)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143593 () Bool)

(assert (=> b!220904 (=> (not res!108330) (not e!143593))))

(declare-fun b!220905 () Bool)

(declare-fun call!20633 () Bool)

(assert (=> b!220905 (= e!143593 (not call!20633))))

(declare-fun b!220906 () Bool)

(declare-fun e!143592 () Bool)

(get-info :version)

(assert (=> b!220906 (= e!143592 ((_ is Undefined!815) lt!112141))))

(declare-fun b!220908 () Bool)

(declare-fun res!108329 () Bool)

(assert (=> b!220908 (=> (not res!108329) (not e!143596))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220908 (= res!108329 (arrayContainsKey!0 (_keys!6220 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220909 () Bool)

(declare-datatypes ((Unit!6554 0))(
  ( (Unit!6555) )
))
(declare-fun e!143587 () Unit!6554)

(declare-fun Unit!6556 () Unit!6554)

(assert (=> b!220909 (= e!143587 Unit!6556)))

(declare-fun lt!112138 () Unit!6554)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!206 (array!10843 array!10841 (_ BitVec 32) (_ BitVec 32) V!7385 V!7385 (_ BitVec 64) Int) Unit!6554)

(assert (=> b!220909 (= lt!112138 (lemmaInListMapThenSeekEntryOrOpenFindsIt!206 (_keys!6220 thiss!1504) (_values!4150 thiss!1504) (mask!9974 thiss!1504) (extraKeys!3904 thiss!1504) (zeroValue!4008 thiss!1504) (minValue!4008 thiss!1504) key!932 (defaultEntry!4167 thiss!1504)))))

(assert (=> b!220909 false))

(declare-fun mapIsEmpty!9874 () Bool)

(declare-fun mapRes!9874 () Bool)

(assert (=> mapIsEmpty!9874 mapRes!9874))

(declare-fun b!220910 () Bool)

(declare-fun res!108335 () Bool)

(assert (=> b!220910 (=> (not res!108335) (not e!143596))))

(assert (=> b!220910 (= res!108335 (and (= (size!5473 (_values!4150 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9974 thiss!1504))) (= (size!5474 (_keys!6220 thiss!1504)) (size!5473 (_values!4150 thiss!1504))) (bvsge (mask!9974 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3904 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3904 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220911 () Bool)

(declare-fun res!108333 () Bool)

(declare-fun e!143590 () Bool)

(assert (=> b!220911 (=> (not res!108333) (not e!143590))))

(assert (=> b!220911 (= res!108333 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220912 () Bool)

(declare-fun e!143594 () Bool)

(assert (=> b!220912 (= e!143590 e!143594)))

(declare-fun res!108331 () Bool)

(assert (=> b!220912 (=> (not res!108331) (not e!143594))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220912 (= res!108331 (or (= lt!112141 (MissingZero!815 index!297)) (= lt!112141 (MissingVacant!815 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10843 (_ BitVec 32)) SeekEntryResult!815)

(assert (=> b!220912 (= lt!112141 (seekEntryOrOpen!0 key!932 (_keys!6220 thiss!1504) (mask!9974 thiss!1504)))))

(declare-fun b!220913 () Bool)

(assert (=> b!220913 (= e!143592 e!143593)))

(declare-fun res!108336 () Bool)

(declare-fun call!20634 () Bool)

(assert (=> b!220913 (= res!108336 call!20634)))

(assert (=> b!220913 (=> (not res!108336) (not e!143593))))

(declare-fun b!220914 () Bool)

(declare-fun res!108332 () Bool)

(declare-fun e!143598 () Bool)

(assert (=> b!220914 (=> (not res!108332) (not e!143598))))

(assert (=> b!220914 (= res!108332 (= (select (arr!5140 (_keys!6220 thiss!1504)) (index!5430 lt!112141)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!36742 () Bool)

(declare-fun bm!20630 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20630 (= call!20634 (inRange!0 (ite c!36742 (index!5430 lt!112141) (index!5433 lt!112141)) (mask!9974 thiss!1504)))))

(declare-fun b!220915 () Bool)

(declare-fun e!143595 () Bool)

(declare-fun tp_is_empty!5803 () Bool)

(assert (=> b!220915 (= e!143595 tp_is_empty!5803)))

(declare-fun b!220916 () Bool)

(declare-fun c!36740 () Bool)

(assert (=> b!220916 (= c!36740 ((_ is MissingVacant!815) lt!112141))))

(declare-fun e!143597 () Bool)

(assert (=> b!220916 (= e!143597 e!143592)))

(declare-fun b!220917 () Bool)

(declare-fun res!108337 () Bool)

(assert (=> b!220917 (=> (not res!108337) (not e!143598))))

(assert (=> b!220917 (= res!108337 call!20634)))

(assert (=> b!220917 (= e!143597 e!143598)))

(declare-fun bm!20631 () Bool)

(assert (=> bm!20631 (= call!20633 (arrayContainsKey!0 (_keys!6220 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220918 () Bool)

(declare-fun res!108328 () Bool)

(assert (=> b!220918 (=> (not res!108328) (not e!143596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10843 (_ BitVec 32)) Bool)

(assert (=> b!220918 (= res!108328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6220 thiss!1504) (mask!9974 thiss!1504)))))

(declare-fun res!108334 () Bool)

(assert (=> start!21878 (=> (not res!108334) (not e!143590))))

(declare-fun valid!1230 (LongMapFixedSize!3016) Bool)

(assert (=> start!21878 (= res!108334 (valid!1230 thiss!1504))))

(assert (=> start!21878 e!143590))

(declare-fun e!143591 () Bool)

(assert (=> start!21878 e!143591))

(assert (=> start!21878 true))

(declare-fun b!220907 () Bool)

(declare-fun e!143588 () Bool)

(declare-fun e!143589 () Bool)

(assert (=> b!220907 (= e!143588 (and e!143589 mapRes!9874))))

(declare-fun condMapEmpty!9874 () Bool)

(declare-fun mapDefault!9874 () ValueCell!2558)

(assert (=> b!220907 (= condMapEmpty!9874 (= (arr!5139 (_values!4150 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2558)) mapDefault!9874)))))

(declare-fun b!220919 () Bool)

(assert (=> b!220919 (= e!143594 e!143596)))

(declare-fun res!108327 () Bool)

(assert (=> b!220919 (=> (not res!108327) (not e!143596))))

(assert (=> b!220919 (= res!108327 (inRange!0 index!297 (mask!9974 thiss!1504)))))

(declare-fun lt!112139 () Unit!6554)

(assert (=> b!220919 (= lt!112139 e!143587)))

(declare-fun c!36741 () Bool)

(declare-datatypes ((tuple2!4336 0))(
  ( (tuple2!4337 (_1!2179 (_ BitVec 64)) (_2!2179 V!7385)) )
))
(declare-datatypes ((List!3258 0))(
  ( (Nil!3255) (Cons!3254 (h!3902 tuple2!4336) (t!8208 List!3258)) )
))
(declare-datatypes ((ListLongMap!3239 0))(
  ( (ListLongMap!3240 (toList!1635 List!3258)) )
))
(declare-fun contains!1478 (ListLongMap!3239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1144 (array!10843 array!10841 (_ BitVec 32) (_ BitVec 32) V!7385 V!7385 (_ BitVec 32) Int) ListLongMap!3239)

(assert (=> b!220919 (= c!36741 (contains!1478 (getCurrentListMap!1144 (_keys!6220 thiss!1504) (_values!4150 thiss!1504) (mask!9974 thiss!1504) (extraKeys!3904 thiss!1504) (zeroValue!4008 thiss!1504) (minValue!4008 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4167 thiss!1504)) key!932))))

(declare-fun b!220920 () Bool)

(declare-fun res!108338 () Bool)

(assert (=> b!220920 (=> (not res!108338) (not e!143596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220920 (= res!108338 (validMask!0 (mask!9974 thiss!1504)))))

(declare-fun array_inv!3385 (array!10843) Bool)

(declare-fun array_inv!3386 (array!10841) Bool)

(assert (=> b!220921 (= e!143591 (and tp!20965 tp_is_empty!5803 (array_inv!3385 (_keys!6220 thiss!1504)) (array_inv!3386 (_values!4150 thiss!1504)) e!143588))))

(declare-fun b!220922 () Bool)

(declare-fun lt!112137 () Unit!6554)

(assert (=> b!220922 (= e!143587 lt!112137)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!206 (array!10843 array!10841 (_ BitVec 32) (_ BitVec 32) V!7385 V!7385 (_ BitVec 64) Int) Unit!6554)

(assert (=> b!220922 (= lt!112137 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!206 (_keys!6220 thiss!1504) (_values!4150 thiss!1504) (mask!9974 thiss!1504) (extraKeys!3904 thiss!1504) (zeroValue!4008 thiss!1504) (minValue!4008 thiss!1504) key!932 (defaultEntry!4167 thiss!1504)))))

(assert (=> b!220922 (= c!36742 ((_ is MissingZero!815) lt!112141))))

(assert (=> b!220922 e!143597))

(declare-fun mapNonEmpty!9874 () Bool)

(declare-fun tp!20964 () Bool)

(assert (=> mapNonEmpty!9874 (= mapRes!9874 (and tp!20964 e!143595))))

(declare-fun mapValue!9874 () ValueCell!2558)

(declare-fun mapKey!9874 () (_ BitVec 32))

(declare-fun mapRest!9874 () (Array (_ BitVec 32) ValueCell!2558))

(assert (=> mapNonEmpty!9874 (= (arr!5139 (_values!4150 thiss!1504)) (store mapRest!9874 mapKey!9874 mapValue!9874))))

(declare-fun b!220923 () Bool)

(assert (=> b!220923 (= e!143589 tp_is_empty!5803)))

(declare-fun b!220924 () Bool)

(assert (=> b!220924 (= e!143598 (not call!20633))))

(assert (= (and start!21878 res!108334) b!220911))

(assert (= (and b!220911 res!108333) b!220912))

(assert (= (and b!220912 res!108331) b!220919))

(assert (= (and b!220919 c!36741) b!220909))

(assert (= (and b!220919 (not c!36741)) b!220922))

(assert (= (and b!220922 c!36742) b!220917))

(assert (= (and b!220922 (not c!36742)) b!220916))

(assert (= (and b!220917 res!108337) b!220914))

(assert (= (and b!220914 res!108332) b!220924))

(assert (= (and b!220916 c!36740) b!220913))

(assert (= (and b!220916 (not c!36740)) b!220906))

(assert (= (and b!220913 res!108336) b!220904))

(assert (= (and b!220904 res!108330) b!220905))

(assert (= (or b!220917 b!220913) bm!20630))

(assert (= (or b!220924 b!220905) bm!20631))

(assert (= (and b!220919 res!108327) b!220908))

(assert (= (and b!220908 res!108329) b!220920))

(assert (= (and b!220920 res!108338) b!220910))

(assert (= (and b!220910 res!108335) b!220918))

(assert (= (and b!220918 res!108328) b!220903))

(assert (= (and b!220907 condMapEmpty!9874) mapIsEmpty!9874))

(assert (= (and b!220907 (not condMapEmpty!9874)) mapNonEmpty!9874))

(assert (= (and mapNonEmpty!9874 ((_ is ValueCellFull!2558) mapValue!9874)) b!220915))

(assert (= (and b!220907 ((_ is ValueCellFull!2558) mapDefault!9874)) b!220923))

(assert (= b!220921 b!220907))

(assert (= start!21878 b!220921))

(declare-fun m!245263 () Bool)

(assert (=> bm!20631 m!245263))

(declare-fun m!245265 () Bool)

(assert (=> bm!20630 m!245265))

(declare-fun m!245267 () Bool)

(assert (=> b!220904 m!245267))

(declare-fun m!245269 () Bool)

(assert (=> b!220918 m!245269))

(declare-fun m!245271 () Bool)

(assert (=> b!220909 m!245271))

(declare-fun m!245273 () Bool)

(assert (=> b!220922 m!245273))

(declare-fun m!245275 () Bool)

(assert (=> mapNonEmpty!9874 m!245275))

(assert (=> b!220908 m!245263))

(declare-fun m!245277 () Bool)

(assert (=> b!220914 m!245277))

(declare-fun m!245279 () Bool)

(assert (=> b!220903 m!245279))

(declare-fun m!245281 () Bool)

(assert (=> b!220919 m!245281))

(declare-fun m!245283 () Bool)

(assert (=> b!220919 m!245283))

(assert (=> b!220919 m!245283))

(declare-fun m!245285 () Bool)

(assert (=> b!220919 m!245285))

(declare-fun m!245287 () Bool)

(assert (=> b!220912 m!245287))

(declare-fun m!245289 () Bool)

(assert (=> b!220921 m!245289))

(declare-fun m!245291 () Bool)

(assert (=> b!220921 m!245291))

(declare-fun m!245293 () Bool)

(assert (=> b!220920 m!245293))

(declare-fun m!245295 () Bool)

(assert (=> start!21878 m!245295))

(check-sat (not b!220918) (not b!220912) b_and!12813 (not bm!20631) (not mapNonEmpty!9874) (not b!220908) (not b!220920) (not b!220919) (not b!220903) (not bm!20630) (not b!220921) (not b!220922) tp_is_empty!5803 (not b_next!5941) (not b!220909) (not start!21878))
(check-sat b_and!12813 (not b_next!5941))
