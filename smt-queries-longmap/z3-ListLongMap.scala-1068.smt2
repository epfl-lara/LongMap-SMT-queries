; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22094 () Bool)

(assert start!22094)

(declare-fun b!229185 () Bool)

(declare-fun b_free!6157 () Bool)

(declare-fun b_next!6157 () Bool)

(assert (=> b!229185 (= b_free!6157 (not b_next!6157))))

(declare-fun tp!21613 () Bool)

(declare-fun b_and!13029 () Bool)

(assert (=> b!229185 (= tp!21613 b_and!13029)))

(declare-fun e!148696 () Bool)

(declare-fun tp_is_empty!6019 () Bool)

(declare-datatypes ((V!7673 0))(
  ( (V!7674 (val!3054 Int)) )
))
(declare-datatypes ((ValueCell!2666 0))(
  ( (ValueCellFull!2666 (v!5068 V!7673)) (EmptyCell!2666) )
))
(declare-datatypes ((array!11273 0))(
  ( (array!11274 (arr!5355 (Array (_ BitVec 32) ValueCell!2666)) (size!5689 (_ BitVec 32))) )
))
(declare-datatypes ((array!11275 0))(
  ( (array!11276 (arr!5356 (Array (_ BitVec 32) (_ BitVec 64))) (size!5690 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3232 0))(
  ( (LongMapFixedSize!3233 (defaultEntry!4275 Int) (mask!10154 (_ BitVec 32)) (extraKeys!4012 (_ BitVec 32)) (zeroValue!4116 V!7673) (minValue!4116 V!7673) (_size!1665 (_ BitVec 32)) (_keys!6328 array!11275) (_values!4258 array!11273) (_vacant!1665 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3232)

(declare-fun e!148688 () Bool)

(declare-fun array_inv!3533 (array!11275) Bool)

(declare-fun array_inv!3534 (array!11273) Bool)

(assert (=> b!229185 (= e!148688 (and tp!21613 tp_is_empty!6019 (array_inv!3533 (_keys!6328 thiss!1504)) (array_inv!3534 (_values!4258 thiss!1504)) e!148696))))

(declare-fun b!229186 () Bool)

(declare-datatypes ((Unit!6961 0))(
  ( (Unit!6962) )
))
(declare-fun e!148685 () Unit!6961)

(declare-fun lt!115181 () Unit!6961)

(assert (=> b!229186 (= e!148685 lt!115181)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!276 (array!11275 array!11273 (_ BitVec 32) (_ BitVec 32) V!7673 V!7673 (_ BitVec 64) Int) Unit!6961)

(assert (=> b!229186 (= lt!115181 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!276 (_keys!6328 thiss!1504) (_values!4258 thiss!1504) (mask!10154 thiss!1504) (extraKeys!4012 thiss!1504) (zeroValue!4116 thiss!1504) (minValue!4116 thiss!1504) key!932 (defaultEntry!4275 thiss!1504)))))

(declare-fun c!38014 () Bool)

(declare-datatypes ((SeekEntryResult!918 0))(
  ( (MissingZero!918 (index!5842 (_ BitVec 32))) (Found!918 (index!5843 (_ BitVec 32))) (Intermediate!918 (undefined!1730 Bool) (index!5844 (_ BitVec 32)) (x!23377 (_ BitVec 32))) (Undefined!918) (MissingVacant!918 (index!5845 (_ BitVec 32))) )
))
(declare-fun lt!115173 () SeekEntryResult!918)

(get-info :version)

(assert (=> b!229186 (= c!38014 ((_ is MissingZero!918) lt!115173))))

(declare-fun e!148691 () Bool)

(assert (=> b!229186 e!148691))

(declare-fun res!112777 () Bool)

(declare-fun e!148684 () Bool)

(assert (=> start!22094 (=> (not res!112777) (not e!148684))))

(declare-fun valid!1302 (LongMapFixedSize!3232) Bool)

(assert (=> start!22094 (= res!112777 (valid!1302 thiss!1504))))

(assert (=> start!22094 e!148684))

(assert (=> start!22094 e!148688))

(assert (=> start!22094 true))

(declare-fun b!229187 () Bool)

(declare-fun e!148697 () Bool)

(assert (=> b!229187 (= e!148697 ((_ is Undefined!918) lt!115173))))

(declare-fun mapIsEmpty!10198 () Bool)

(declare-fun mapRes!10198 () Bool)

(assert (=> mapIsEmpty!10198 mapRes!10198))

(declare-fun b!229188 () Bool)

(declare-fun e!148693 () Bool)

(declare-fun call!21281 () Bool)

(assert (=> b!229188 (= e!148693 (not call!21281))))

(declare-fun b!229189 () Bool)

(declare-fun res!112775 () Bool)

(declare-fun e!148692 () Bool)

(assert (=> b!229189 (=> (not res!112775) (not e!148692))))

(declare-fun call!21282 () Bool)

(assert (=> b!229189 (= res!112775 call!21282)))

(assert (=> b!229189 (= e!148691 e!148692)))

(declare-fun b!229190 () Bool)

(declare-fun res!112780 () Bool)

(assert (=> b!229190 (=> (not res!112780) (not e!148692))))

(assert (=> b!229190 (= res!112780 (= (select (arr!5356 (_keys!6328 thiss!1504)) (index!5842 lt!115173)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!229191 () Bool)

(declare-fun Unit!6963 () Unit!6961)

(assert (=> b!229191 (= e!148685 Unit!6963)))

(declare-fun lt!115182 () Unit!6961)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!279 (array!11275 array!11273 (_ BitVec 32) (_ BitVec 32) V!7673 V!7673 (_ BitVec 64) Int) Unit!6961)

(assert (=> b!229191 (= lt!115182 (lemmaInListMapThenSeekEntryOrOpenFindsIt!279 (_keys!6328 thiss!1504) (_values!4258 thiss!1504) (mask!10154 thiss!1504) (extraKeys!4012 thiss!1504) (zeroValue!4116 thiss!1504) (minValue!4116 thiss!1504) key!932 (defaultEntry!4275 thiss!1504)))))

(assert (=> b!229191 false))

(declare-fun b!229192 () Bool)

(declare-fun res!112779 () Bool)

(declare-fun e!148690 () Bool)

(assert (=> b!229192 (=> res!112779 e!148690)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11275 (_ BitVec 32)) Bool)

(assert (=> b!229192 (= res!112779 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6328 thiss!1504) (mask!10154 thiss!1504))))))

(declare-fun b!229193 () Bool)

(declare-fun e!148687 () Unit!6961)

(declare-fun Unit!6964 () Unit!6961)

(assert (=> b!229193 (= e!148687 Unit!6964)))

(declare-fun lt!115178 () Unit!6961)

(declare-fun lemmaArrayContainsKeyThenInListMap!120 (array!11275 array!11273 (_ BitVec 32) (_ BitVec 32) V!7673 V!7673 (_ BitVec 64) (_ BitVec 32) Int) Unit!6961)

(assert (=> b!229193 (= lt!115178 (lemmaArrayContainsKeyThenInListMap!120 (_keys!6328 thiss!1504) (_values!4258 thiss!1504) (mask!10154 thiss!1504) (extraKeys!4012 thiss!1504) (zeroValue!4116 thiss!1504) (minValue!4116 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4275 thiss!1504)))))

(assert (=> b!229193 false))

(declare-fun b!229194 () Bool)

(declare-fun res!112771 () Bool)

(assert (=> b!229194 (=> res!112771 e!148690)))

(assert (=> b!229194 (= res!112771 (or (not (= (size!5689 (_values!4258 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10154 thiss!1504)))) (not (= (size!5690 (_keys!6328 thiss!1504)) (size!5689 (_values!4258 thiss!1504)))) (bvslt (mask!10154 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4012 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4012 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!229195 () Bool)

(declare-fun res!112773 () Bool)

(assert (=> b!229195 (=> (not res!112773) (not e!148684))))

(assert (=> b!229195 (= res!112773 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21278 () Bool)

(declare-fun arrayContainsKey!0 (array!11275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21278 (= call!21281 (arrayContainsKey!0 (_keys!6328 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229196 () Bool)

(declare-fun e!148698 () Bool)

(assert (=> b!229196 (= e!148698 tp_is_empty!6019)))

(declare-fun mapNonEmpty!10198 () Bool)

(declare-fun tp!21612 () Bool)

(assert (=> mapNonEmpty!10198 (= mapRes!10198 (and tp!21612 e!148698))))

(declare-fun mapRest!10198 () (Array (_ BitVec 32) ValueCell!2666))

(declare-fun mapValue!10198 () ValueCell!2666)

(declare-fun mapKey!10198 () (_ BitVec 32))

(assert (=> mapNonEmpty!10198 (= (arr!5355 (_values!4258 thiss!1504)) (store mapRest!10198 mapKey!10198 mapValue!10198))))

(declare-fun b!229197 () Bool)

(assert (=> b!229197 (= e!148697 e!148693)))

(declare-fun res!112778 () Bool)

(assert (=> b!229197 (= res!112778 call!21282)))

(assert (=> b!229197 (=> (not res!112778) (not e!148693))))

(declare-fun b!229198 () Bool)

(assert (=> b!229198 (= e!148690 true)))

(declare-fun lt!115180 () Bool)

(declare-datatypes ((List!3417 0))(
  ( (Nil!3414) (Cons!3413 (h!4061 (_ BitVec 64)) (t!8367 List!3417)) )
))
(declare-fun arrayNoDuplicates!0 (array!11275 (_ BitVec 32) List!3417) Bool)

(assert (=> b!229198 (= lt!115180 (arrayNoDuplicates!0 (_keys!6328 thiss!1504) #b00000000000000000000000000000000 Nil!3414))))

(declare-fun b!229199 () Bool)

(assert (=> b!229199 (= e!148692 (not call!21281))))

(declare-fun b!229200 () Bool)

(declare-fun res!112781 () Bool)

(assert (=> b!229200 (= res!112781 (= (select (arr!5356 (_keys!6328 thiss!1504)) (index!5845 lt!115173)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229200 (=> (not res!112781) (not e!148693))))

(declare-fun b!229201 () Bool)

(declare-fun e!148686 () Bool)

(declare-fun e!148689 () Bool)

(assert (=> b!229201 (= e!148686 e!148689)))

(declare-fun res!112776 () Bool)

(assert (=> b!229201 (=> (not res!112776) (not e!148689))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229201 (= res!112776 (inRange!0 index!297 (mask!10154 thiss!1504)))))

(declare-fun lt!115179 () Unit!6961)

(assert (=> b!229201 (= lt!115179 e!148685)))

(declare-fun c!38011 () Bool)

(declare-datatypes ((tuple2!4480 0))(
  ( (tuple2!4481 (_1!2251 (_ BitVec 64)) (_2!2251 V!7673)) )
))
(declare-datatypes ((List!3418 0))(
  ( (Nil!3415) (Cons!3414 (h!4062 tuple2!4480) (t!8368 List!3418)) )
))
(declare-datatypes ((ListLongMap!3383 0))(
  ( (ListLongMap!3384 (toList!1707 List!3418)) )
))
(declare-fun contains!1582 (ListLongMap!3383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1216 (array!11275 array!11273 (_ BitVec 32) (_ BitVec 32) V!7673 V!7673 (_ BitVec 32) Int) ListLongMap!3383)

(assert (=> b!229201 (= c!38011 (contains!1582 (getCurrentListMap!1216 (_keys!6328 thiss!1504) (_values!4258 thiss!1504) (mask!10154 thiss!1504) (extraKeys!4012 thiss!1504) (zeroValue!4116 thiss!1504) (minValue!4116 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4275 thiss!1504)) key!932))))

(declare-fun bm!21279 () Bool)

(assert (=> bm!21279 (= call!21282 (inRange!0 (ite c!38014 (index!5842 lt!115173) (index!5845 lt!115173)) (mask!10154 thiss!1504)))))

(declare-fun b!229202 () Bool)

(declare-fun e!148694 () Bool)

(assert (=> b!229202 (= e!148694 tp_is_empty!6019)))

(declare-fun b!229203 () Bool)

(assert (=> b!229203 (= e!148696 (and e!148694 mapRes!10198))))

(declare-fun condMapEmpty!10198 () Bool)

(declare-fun mapDefault!10198 () ValueCell!2666)

(assert (=> b!229203 (= condMapEmpty!10198 (= (arr!5355 (_values!4258 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2666)) mapDefault!10198)))))

(declare-fun b!229204 () Bool)

(assert (=> b!229204 (= e!148684 e!148686)))

(declare-fun res!112774 () Bool)

(assert (=> b!229204 (=> (not res!112774) (not e!148686))))

(assert (=> b!229204 (= res!112774 (or (= lt!115173 (MissingZero!918 index!297)) (= lt!115173 (MissingVacant!918 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11275 (_ BitVec 32)) SeekEntryResult!918)

(assert (=> b!229204 (= lt!115173 (seekEntryOrOpen!0 key!932 (_keys!6328 thiss!1504) (mask!10154 thiss!1504)))))

(declare-fun b!229205 () Bool)

(declare-fun Unit!6965 () Unit!6961)

(assert (=> b!229205 (= e!148687 Unit!6965)))

(declare-fun b!229206 () Bool)

(assert (=> b!229206 (= e!148689 (not e!148690))))

(declare-fun res!112772 () Bool)

(assert (=> b!229206 (=> res!112772 e!148690)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229206 (= res!112772 (not (validMask!0 (mask!10154 thiss!1504))))))

(declare-fun lt!115174 () array!11275)

(assert (=> b!229206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115174 (mask!10154 thiss!1504))))

(declare-fun lt!115183 () Unit!6961)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11275 (_ BitVec 32) (_ BitVec 32)) Unit!6961)

(assert (=> b!229206 (= lt!115183 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6328 thiss!1504) index!297 (mask!10154 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11275 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229206 (= (arrayCountValidKeys!0 lt!115174 #b00000000000000000000000000000000 (size!5690 (_keys!6328 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6328 thiss!1504) #b00000000000000000000000000000000 (size!5690 (_keys!6328 thiss!1504)))))))

(declare-fun lt!115177 () Unit!6961)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11275 (_ BitVec 32) (_ BitVec 64)) Unit!6961)

(assert (=> b!229206 (= lt!115177 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6328 thiss!1504) index!297 key!932))))

(assert (=> b!229206 (arrayNoDuplicates!0 lt!115174 #b00000000000000000000000000000000 Nil!3414)))

(assert (=> b!229206 (= lt!115174 (array!11276 (store (arr!5356 (_keys!6328 thiss!1504)) index!297 key!932) (size!5690 (_keys!6328 thiss!1504))))))

(declare-fun lt!115175 () Unit!6961)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11275 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3417) Unit!6961)

(assert (=> b!229206 (= lt!115175 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6328 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3414))))

(declare-fun lt!115176 () Unit!6961)

(assert (=> b!229206 (= lt!115176 e!148687)))

(declare-fun c!38012 () Bool)

(assert (=> b!229206 (= c!38012 (arrayContainsKey!0 (_keys!6328 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229207 () Bool)

(declare-fun c!38013 () Bool)

(assert (=> b!229207 (= c!38013 ((_ is MissingVacant!918) lt!115173))))

(assert (=> b!229207 (= e!148691 e!148697)))

(assert (= (and start!22094 res!112777) b!229195))

(assert (= (and b!229195 res!112773) b!229204))

(assert (= (and b!229204 res!112774) b!229201))

(assert (= (and b!229201 c!38011) b!229191))

(assert (= (and b!229201 (not c!38011)) b!229186))

(assert (= (and b!229186 c!38014) b!229189))

(assert (= (and b!229186 (not c!38014)) b!229207))

(assert (= (and b!229189 res!112775) b!229190))

(assert (= (and b!229190 res!112780) b!229199))

(assert (= (and b!229207 c!38013) b!229197))

(assert (= (and b!229207 (not c!38013)) b!229187))

(assert (= (and b!229197 res!112778) b!229200))

(assert (= (and b!229200 res!112781) b!229188))

(assert (= (or b!229189 b!229197) bm!21279))

(assert (= (or b!229199 b!229188) bm!21278))

(assert (= (and b!229201 res!112776) b!229206))

(assert (= (and b!229206 c!38012) b!229193))

(assert (= (and b!229206 (not c!38012)) b!229205))

(assert (= (and b!229206 (not res!112772)) b!229194))

(assert (= (and b!229194 (not res!112771)) b!229192))

(assert (= (and b!229192 (not res!112779)) b!229198))

(assert (= (and b!229203 condMapEmpty!10198) mapIsEmpty!10198))

(assert (= (and b!229203 (not condMapEmpty!10198)) mapNonEmpty!10198))

(assert (= (and mapNonEmpty!10198 ((_ is ValueCellFull!2666) mapValue!10198)) b!229196))

(assert (= (and b!229203 ((_ is ValueCellFull!2666) mapDefault!10198)) b!229202))

(assert (= b!229185 b!229203))

(assert (= start!22094 b!229185))

(declare-fun m!250255 () Bool)

(assert (=> b!229206 m!250255))

(declare-fun m!250257 () Bool)

(assert (=> b!229206 m!250257))

(declare-fun m!250259 () Bool)

(assert (=> b!229206 m!250259))

(declare-fun m!250261 () Bool)

(assert (=> b!229206 m!250261))

(declare-fun m!250263 () Bool)

(assert (=> b!229206 m!250263))

(declare-fun m!250265 () Bool)

(assert (=> b!229206 m!250265))

(declare-fun m!250267 () Bool)

(assert (=> b!229206 m!250267))

(declare-fun m!250269 () Bool)

(assert (=> b!229206 m!250269))

(declare-fun m!250271 () Bool)

(assert (=> b!229206 m!250271))

(declare-fun m!250273 () Bool)

(assert (=> b!229206 m!250273))

(declare-fun m!250275 () Bool)

(assert (=> start!22094 m!250275))

(declare-fun m!250277 () Bool)

(assert (=> b!229201 m!250277))

(declare-fun m!250279 () Bool)

(assert (=> b!229201 m!250279))

(assert (=> b!229201 m!250279))

(declare-fun m!250281 () Bool)

(assert (=> b!229201 m!250281))

(assert (=> bm!21278 m!250255))

(declare-fun m!250283 () Bool)

(assert (=> b!229198 m!250283))

(declare-fun m!250285 () Bool)

(assert (=> b!229200 m!250285))

(declare-fun m!250287 () Bool)

(assert (=> b!229193 m!250287))

(declare-fun m!250289 () Bool)

(assert (=> mapNonEmpty!10198 m!250289))

(declare-fun m!250291 () Bool)

(assert (=> b!229191 m!250291))

(declare-fun m!250293 () Bool)

(assert (=> b!229190 m!250293))

(declare-fun m!250295 () Bool)

(assert (=> b!229186 m!250295))

(declare-fun m!250297 () Bool)

(assert (=> bm!21279 m!250297))

(declare-fun m!250299 () Bool)

(assert (=> b!229192 m!250299))

(declare-fun m!250301 () Bool)

(assert (=> b!229185 m!250301))

(declare-fun m!250303 () Bool)

(assert (=> b!229185 m!250303))

(declare-fun m!250305 () Bool)

(assert (=> b!229204 m!250305))

(check-sat (not b!229198) b_and!13029 (not bm!21278) (not bm!21279) (not b!229193) (not b!229201) (not b!229191) (not b!229204) (not b!229185) (not b_next!6157) (not b!229206) (not b!229192) tp_is_empty!6019 (not b!229186) (not mapNonEmpty!10198) (not start!22094))
(check-sat b_and!13029 (not b_next!6157))
