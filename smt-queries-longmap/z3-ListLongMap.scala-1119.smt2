; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22964 () Bool)

(assert start!22964)

(declare-fun b!240191 () Bool)

(declare-fun b_free!6463 () Bool)

(declare-fun b_next!6463 () Bool)

(assert (=> b!240191 (= b_free!6463 (not b_next!6463))))

(declare-fun tp!22592 () Bool)

(declare-fun b_and!13403 () Bool)

(assert (=> b!240191 (= tp!22592 b_and!13403)))

(declare-fun b!240175 () Bool)

(declare-fun res!117738 () Bool)

(declare-fun e!155899 () Bool)

(assert (=> b!240175 (=> (not res!117738) (not e!155899))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!240175 (= res!117738 (validKeyInArray!0 key!932))))

(declare-fun b!240176 () Bool)

(declare-datatypes ((V!8081 0))(
  ( (V!8082 (val!3207 Int)) )
))
(declare-datatypes ((ValueCell!2819 0))(
  ( (ValueCellFull!2819 (v!5239 V!8081)) (EmptyCell!2819) )
))
(declare-datatypes ((array!11921 0))(
  ( (array!11922 (arr!5661 (Array (_ BitVec 32) ValueCell!2819)) (size!6003 (_ BitVec 32))) )
))
(declare-datatypes ((array!11923 0))(
  ( (array!11924 (arr!5662 (Array (_ BitVec 32) (_ BitVec 64))) (size!6004 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3538 0))(
  ( (LongMapFixedSize!3539 (defaultEntry!4454 Int) (mask!10509 (_ BitVec 32)) (extraKeys!4191 (_ BitVec 32)) (zeroValue!4295 V!8081) (minValue!4295 V!8081) (_size!1818 (_ BitVec 32)) (_keys!6555 array!11923) (_values!4437 array!11921) (_vacant!1818 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3538)

(assert (=> b!240176 (= e!155899 (bvsge #b00000000000000000000000000000000 (size!6004 (_keys!6555 thiss!1504))))))

(declare-fun b!240177 () Bool)

(declare-fun e!155896 () Bool)

(declare-fun e!155897 () Bool)

(assert (=> b!240177 (= e!155896 e!155897)))

(declare-fun res!117734 () Bool)

(assert (=> b!240177 (=> (not res!117734) (not e!155897))))

(declare-datatypes ((SeekEntryResult!1043 0))(
  ( (MissingZero!1043 (index!6342 (_ BitVec 32))) (Found!1043 (index!6343 (_ BitVec 32))) (Intermediate!1043 (undefined!1855 Bool) (index!6344 (_ BitVec 32)) (x!24154 (_ BitVec 32))) (Undefined!1043) (MissingVacant!1043 (index!6345 (_ BitVec 32))) )
))
(declare-fun lt!120775 () SeekEntryResult!1043)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240177 (= res!117734 (or (= lt!120775 (MissingZero!1043 index!297)) (= lt!120775 (MissingVacant!1043 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11923 (_ BitVec 32)) SeekEntryResult!1043)

(assert (=> b!240177 (= lt!120775 (seekEntryOrOpen!0 key!932 (_keys!6555 thiss!1504) (mask!10509 thiss!1504)))))

(declare-fun b!240178 () Bool)

(declare-fun res!117730 () Bool)

(assert (=> b!240178 (=> (not res!117730) (not e!155896))))

(assert (=> b!240178 (= res!117730 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240179 () Bool)

(declare-fun res!117727 () Bool)

(assert (=> b!240179 (=> (not res!117727) (not e!155899))))

(assert (=> b!240179 (= res!117727 (and (= (size!6003 (_values!4437 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10509 thiss!1504))) (= (size!6004 (_keys!6555 thiss!1504)) (size!6003 (_values!4437 thiss!1504))) (bvsge (mask!10509 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4191 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4191 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!10719 () Bool)

(declare-fun mapRes!10719 () Bool)

(assert (=> mapIsEmpty!10719 mapRes!10719))

(declare-fun b!240180 () Bool)

(declare-fun e!155902 () Bool)

(declare-fun call!22325 () Bool)

(assert (=> b!240180 (= e!155902 (not call!22325))))

(declare-fun res!117736 () Bool)

(assert (=> start!22964 (=> (not res!117736) (not e!155896))))

(declare-fun valid!1396 (LongMapFixedSize!3538) Bool)

(assert (=> start!22964 (= res!117736 (valid!1396 thiss!1504))))

(assert (=> start!22964 e!155896))

(declare-fun e!155904 () Bool)

(assert (=> start!22964 e!155904))

(assert (=> start!22964 true))

(declare-fun mapNonEmpty!10719 () Bool)

(declare-fun tp!22593 () Bool)

(declare-fun e!155895 () Bool)

(assert (=> mapNonEmpty!10719 (= mapRes!10719 (and tp!22593 e!155895))))

(declare-fun mapRest!10719 () (Array (_ BitVec 32) ValueCell!2819))

(declare-fun mapValue!10719 () ValueCell!2819)

(declare-fun mapKey!10719 () (_ BitVec 32))

(assert (=> mapNonEmpty!10719 (= (arr!5661 (_values!4437 thiss!1504)) (store mapRest!10719 mapKey!10719 mapValue!10719))))

(declare-fun b!240181 () Bool)

(declare-fun e!155905 () Bool)

(declare-fun tp_is_empty!6325 () Bool)

(assert (=> b!240181 (= e!155905 tp_is_empty!6325)))

(declare-fun b!240182 () Bool)

(declare-fun res!117725 () Bool)

(assert (=> b!240182 (=> (not res!117725) (not e!155899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!240182 (= res!117725 (validMask!0 (mask!10509 thiss!1504)))))

(declare-fun b!240183 () Bool)

(declare-datatypes ((Unit!7376 0))(
  ( (Unit!7377) )
))
(declare-fun e!155903 () Unit!7376)

(declare-fun Unit!7378 () Unit!7376)

(assert (=> b!240183 (= e!155903 Unit!7378)))

(declare-fun lt!120776 () Unit!7376)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!342 (array!11923 array!11921 (_ BitVec 32) (_ BitVec 32) V!8081 V!8081 (_ BitVec 64) Int) Unit!7376)

(assert (=> b!240183 (= lt!120776 (lemmaInListMapThenSeekEntryOrOpenFindsIt!342 (_keys!6555 thiss!1504) (_values!4437 thiss!1504) (mask!10509 thiss!1504) (extraKeys!4191 thiss!1504) (zeroValue!4295 thiss!1504) (minValue!4295 thiss!1504) key!932 (defaultEntry!4454 thiss!1504)))))

(assert (=> b!240183 false))

(declare-fun b!240184 () Bool)

(assert (=> b!240184 (= e!155895 tp_is_empty!6325)))

(declare-fun b!240185 () Bool)

(declare-fun e!155898 () Bool)

(get-info :version)

(assert (=> b!240185 (= e!155898 ((_ is Undefined!1043) lt!120775))))

(declare-fun b!240186 () Bool)

(declare-fun res!117733 () Bool)

(assert (=> b!240186 (=> (not res!117733) (not e!155899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11923 (_ BitVec 32)) Bool)

(assert (=> b!240186 (= res!117733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6555 thiss!1504) (mask!10509 thiss!1504)))))

(declare-fun b!240187 () Bool)

(declare-fun e!155901 () Bool)

(assert (=> b!240187 (= e!155901 (and e!155905 mapRes!10719))))

(declare-fun condMapEmpty!10719 () Bool)

(declare-fun mapDefault!10719 () ValueCell!2819)

(assert (=> b!240187 (= condMapEmpty!10719 (= (arr!5661 (_values!4437 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2819)) mapDefault!10719)))))

(declare-fun b!240188 () Bool)

(declare-fun res!117729 () Bool)

(assert (=> b!240188 (=> (not res!117729) (not e!155899))))

(declare-datatypes ((List!3595 0))(
  ( (Nil!3592) (Cons!3591 (h!4247 (_ BitVec 64)) (t!8581 List!3595)) )
))
(declare-fun arrayNoDuplicates!0 (array!11923 (_ BitVec 32) List!3595) Bool)

(assert (=> b!240188 (= res!117729 (arrayNoDuplicates!0 (_keys!6555 thiss!1504) #b00000000000000000000000000000000 Nil!3592))))

(declare-fun b!240189 () Bool)

(declare-fun res!117731 () Bool)

(assert (=> b!240189 (=> (not res!117731) (not e!155902))))

(declare-fun call!22326 () Bool)

(assert (=> b!240189 (= res!117731 call!22326)))

(declare-fun e!155893 () Bool)

(assert (=> b!240189 (= e!155893 e!155902)))

(declare-fun b!240190 () Bool)

(declare-fun lt!120774 () Unit!7376)

(assert (=> b!240190 (= e!155903 lt!120774)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!343 (array!11923 array!11921 (_ BitVec 32) (_ BitVec 32) V!8081 V!8081 (_ BitVec 64) Int) Unit!7376)

(assert (=> b!240190 (= lt!120774 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!343 (_keys!6555 thiss!1504) (_values!4437 thiss!1504) (mask!10509 thiss!1504) (extraKeys!4191 thiss!1504) (zeroValue!4295 thiss!1504) (minValue!4295 thiss!1504) key!932 (defaultEntry!4454 thiss!1504)))))

(declare-fun c!40011 () Bool)

(assert (=> b!240190 (= c!40011 ((_ is MissingZero!1043) lt!120775))))

(assert (=> b!240190 e!155893))

(declare-fun array_inv!3731 (array!11923) Bool)

(declare-fun array_inv!3732 (array!11921) Bool)

(assert (=> b!240191 (= e!155904 (and tp!22592 tp_is_empty!6325 (array_inv!3731 (_keys!6555 thiss!1504)) (array_inv!3732 (_values!4437 thiss!1504)) e!155901))))

(declare-fun b!240192 () Bool)

(declare-fun e!155900 () Bool)

(assert (=> b!240192 (= e!155900 (not call!22325))))

(declare-fun b!240193 () Bool)

(assert (=> b!240193 (= e!155897 e!155899)))

(declare-fun res!117732 () Bool)

(assert (=> b!240193 (=> (not res!117732) (not e!155899))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240193 (= res!117732 (inRange!0 index!297 (mask!10509 thiss!1504)))))

(declare-fun lt!120773 () Unit!7376)

(assert (=> b!240193 (= lt!120773 e!155903)))

(declare-fun c!40009 () Bool)

(declare-datatypes ((tuple2!4694 0))(
  ( (tuple2!4695 (_1!2358 (_ BitVec 64)) (_2!2358 V!8081)) )
))
(declare-datatypes ((List!3596 0))(
  ( (Nil!3593) (Cons!3592 (h!4248 tuple2!4694) (t!8582 List!3596)) )
))
(declare-datatypes ((ListLongMap!3597 0))(
  ( (ListLongMap!3598 (toList!1814 List!3596)) )
))
(declare-fun contains!1705 (ListLongMap!3597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1323 (array!11923 array!11921 (_ BitVec 32) (_ BitVec 32) V!8081 V!8081 (_ BitVec 32) Int) ListLongMap!3597)

(assert (=> b!240193 (= c!40009 (contains!1705 (getCurrentListMap!1323 (_keys!6555 thiss!1504) (_values!4437 thiss!1504) (mask!10509 thiss!1504) (extraKeys!4191 thiss!1504) (zeroValue!4295 thiss!1504) (minValue!4295 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4454 thiss!1504)) key!932))))

(declare-fun b!240194 () Bool)

(declare-fun c!40010 () Bool)

(assert (=> b!240194 (= c!40010 ((_ is MissingVacant!1043) lt!120775))))

(assert (=> b!240194 (= e!155893 e!155898)))

(declare-fun b!240195 () Bool)

(declare-fun res!117735 () Bool)

(assert (=> b!240195 (=> (not res!117735) (not e!155902))))

(assert (=> b!240195 (= res!117735 (= (select (arr!5662 (_keys!6555 thiss!1504)) (index!6342 lt!120775)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22322 () Bool)

(declare-fun arrayContainsKey!0 (array!11923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22322 (= call!22325 (arrayContainsKey!0 (_keys!6555 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240196 () Bool)

(declare-fun res!117737 () Bool)

(assert (=> b!240196 (= res!117737 (= (select (arr!5662 (_keys!6555 thiss!1504)) (index!6345 lt!120775)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240196 (=> (not res!117737) (not e!155900))))

(declare-fun b!240197 () Bool)

(assert (=> b!240197 (= e!155898 e!155900)))

(declare-fun res!117726 () Bool)

(assert (=> b!240197 (= res!117726 call!22326)))

(assert (=> b!240197 (=> (not res!117726) (not e!155900))))

(declare-fun b!240198 () Bool)

(declare-fun res!117728 () Bool)

(assert (=> b!240198 (=> (not res!117728) (not e!155899))))

(assert (=> b!240198 (= res!117728 (arrayContainsKey!0 (_keys!6555 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22323 () Bool)

(assert (=> bm!22323 (= call!22326 (inRange!0 (ite c!40011 (index!6342 lt!120775) (index!6345 lt!120775)) (mask!10509 thiss!1504)))))

(assert (= (and start!22964 res!117736) b!240178))

(assert (= (and b!240178 res!117730) b!240177))

(assert (= (and b!240177 res!117734) b!240193))

(assert (= (and b!240193 c!40009) b!240183))

(assert (= (and b!240193 (not c!40009)) b!240190))

(assert (= (and b!240190 c!40011) b!240189))

(assert (= (and b!240190 (not c!40011)) b!240194))

(assert (= (and b!240189 res!117731) b!240195))

(assert (= (and b!240195 res!117735) b!240180))

(assert (= (and b!240194 c!40010) b!240197))

(assert (= (and b!240194 (not c!40010)) b!240185))

(assert (= (and b!240197 res!117726) b!240196))

(assert (= (and b!240196 res!117737) b!240192))

(assert (= (or b!240189 b!240197) bm!22323))

(assert (= (or b!240180 b!240192) bm!22322))

(assert (= (and b!240193 res!117732) b!240198))

(assert (= (and b!240198 res!117728) b!240182))

(assert (= (and b!240182 res!117725) b!240179))

(assert (= (and b!240179 res!117727) b!240186))

(assert (= (and b!240186 res!117733) b!240188))

(assert (= (and b!240188 res!117729) b!240175))

(assert (= (and b!240175 res!117738) b!240176))

(assert (= (and b!240187 condMapEmpty!10719) mapIsEmpty!10719))

(assert (= (and b!240187 (not condMapEmpty!10719)) mapNonEmpty!10719))

(assert (= (and mapNonEmpty!10719 ((_ is ValueCellFull!2819) mapValue!10719)) b!240184))

(assert (= (and b!240187 ((_ is ValueCellFull!2819) mapDefault!10719)) b!240181))

(assert (= b!240191 b!240187))

(assert (= start!22964 b!240191))

(declare-fun m!259339 () Bool)

(assert (=> b!240188 m!259339))

(declare-fun m!259341 () Bool)

(assert (=> b!240198 m!259341))

(declare-fun m!259343 () Bool)

(assert (=> b!240196 m!259343))

(declare-fun m!259345 () Bool)

(assert (=> b!240195 m!259345))

(declare-fun m!259347 () Bool)

(assert (=> bm!22323 m!259347))

(declare-fun m!259349 () Bool)

(assert (=> b!240182 m!259349))

(declare-fun m!259351 () Bool)

(assert (=> b!240190 m!259351))

(declare-fun m!259353 () Bool)

(assert (=> b!240177 m!259353))

(declare-fun m!259355 () Bool)

(assert (=> b!240175 m!259355))

(declare-fun m!259357 () Bool)

(assert (=> start!22964 m!259357))

(declare-fun m!259359 () Bool)

(assert (=> b!240183 m!259359))

(assert (=> bm!22322 m!259341))

(declare-fun m!259361 () Bool)

(assert (=> mapNonEmpty!10719 m!259361))

(declare-fun m!259363 () Bool)

(assert (=> b!240193 m!259363))

(declare-fun m!259365 () Bool)

(assert (=> b!240193 m!259365))

(assert (=> b!240193 m!259365))

(declare-fun m!259367 () Bool)

(assert (=> b!240193 m!259367))

(declare-fun m!259369 () Bool)

(assert (=> b!240186 m!259369))

(declare-fun m!259371 () Bool)

(assert (=> b!240191 m!259371))

(declare-fun m!259373 () Bool)

(assert (=> b!240191 m!259373))

(check-sat (not b!240186) (not b!240193) (not bm!22322) (not mapNonEmpty!10719) tp_is_empty!6325 (not b!240182) (not b!240198) (not b!240190) (not b_next!6463) (not bm!22323) (not b!240183) (not b!240188) (not b!240191) b_and!13403 (not b!240177) (not start!22964) (not b!240175))
(check-sat b_and!13403 (not b_next!6463))
