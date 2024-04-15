; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22196 () Bool)

(assert start!22196)

(declare-fun b!232306 () Bool)

(declare-fun b_free!6259 () Bool)

(declare-fun b_next!6259 () Bool)

(assert (=> b!232306 (= b_free!6259 (not b_next!6259))))

(declare-fun tp!21919 () Bool)

(declare-fun b_and!13131 () Bool)

(assert (=> b!232306 (= tp!21919 b_and!13131)))

(declare-datatypes ((V!7809 0))(
  ( (V!7810 (val!3105 Int)) )
))
(declare-datatypes ((ValueCell!2717 0))(
  ( (ValueCellFull!2717 (v!5119 V!7809)) (EmptyCell!2717) )
))
(declare-datatypes ((array!11477 0))(
  ( (array!11478 (arr!5457 (Array (_ BitVec 32) ValueCell!2717)) (size!5791 (_ BitVec 32))) )
))
(declare-datatypes ((array!11479 0))(
  ( (array!11480 (arr!5458 (Array (_ BitVec 32) (_ BitVec 64))) (size!5792 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3334 0))(
  ( (LongMapFixedSize!3335 (defaultEntry!4326 Int) (mask!10239 (_ BitVec 32)) (extraKeys!4063 (_ BitVec 32)) (zeroValue!4167 V!7809) (minValue!4167 V!7809) (_size!1716 (_ BitVec 32)) (_keys!6379 array!11479) (_values!4309 array!11477) (_vacant!1716 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3334)

(declare-fun bm!21584 () Bool)

(declare-fun c!38625 () Bool)

(declare-datatypes ((SeekEntryResult!967 0))(
  ( (MissingZero!967 (index!6038 (_ BitVec 32))) (Found!967 (index!6039 (_ BitVec 32))) (Intermediate!967 (undefined!1779 Bool) (index!6040 (_ BitVec 32)) (x!23562 (_ BitVec 32))) (Undefined!967) (MissingVacant!967 (index!6041 (_ BitVec 32))) )
))
(declare-fun lt!117208 () SeekEntryResult!967)

(declare-fun call!21588 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21584 (= call!21588 (inRange!0 (ite c!38625 (index!6038 lt!117208) (index!6041 lt!117208)) (mask!10239 thiss!1504)))))

(declare-fun b!232293 () Bool)

(declare-fun e!150846 () Bool)

(declare-fun call!21587 () Bool)

(assert (=> b!232293 (= e!150846 (not call!21587))))

(declare-fun b!232294 () Bool)

(declare-datatypes ((Unit!7157 0))(
  ( (Unit!7158) )
))
(declare-fun e!150847 () Unit!7157)

(declare-fun Unit!7159 () Unit!7157)

(assert (=> b!232294 (= e!150847 Unit!7159)))

(declare-fun res!114050 () Bool)

(declare-fun e!150845 () Bool)

(assert (=> start!22196 (=> (not res!114050) (not e!150845))))

(declare-fun valid!1333 (LongMapFixedSize!3334) Bool)

(assert (=> start!22196 (= res!114050 (valid!1333 thiss!1504))))

(assert (=> start!22196 e!150845))

(declare-fun e!150852 () Bool)

(assert (=> start!22196 e!150852))

(assert (=> start!22196 true))

(declare-fun tp_is_empty!6121 () Bool)

(assert (=> start!22196 tp_is_empty!6121))

(declare-fun bm!21585 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21585 (= call!21587 (arrayContainsKey!0 (_keys!6379 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232295 () Bool)

(declare-fun e!150853 () Bool)

(declare-fun e!150849 () Bool)

(assert (=> b!232295 (= e!150853 e!150849)))

(declare-fun res!114047 () Bool)

(assert (=> b!232295 (=> (not res!114047) (not e!150849))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232295 (= res!114047 (inRange!0 index!297 (mask!10239 thiss!1504)))))

(declare-fun lt!117199 () Unit!7157)

(declare-fun e!150850 () Unit!7157)

(assert (=> b!232295 (= lt!117199 e!150850)))

(declare-fun c!38626 () Bool)

(declare-datatypes ((tuple2!4558 0))(
  ( (tuple2!4559 (_1!2290 (_ BitVec 64)) (_2!2290 V!7809)) )
))
(declare-datatypes ((List!3495 0))(
  ( (Nil!3492) (Cons!3491 (h!4139 tuple2!4558) (t!8445 List!3495)) )
))
(declare-datatypes ((ListLongMap!3461 0))(
  ( (ListLongMap!3462 (toList!1746 List!3495)) )
))
(declare-fun lt!117196 () ListLongMap!3461)

(declare-fun contains!1617 (ListLongMap!3461 (_ BitVec 64)) Bool)

(assert (=> b!232295 (= c!38626 (contains!1617 lt!117196 key!932))))

(declare-fun getCurrentListMap!1255 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 32) Int) ListLongMap!3461)

(assert (=> b!232295 (= lt!117196 (getCurrentListMap!1255 (_keys!6379 thiss!1504) (_values!4309 thiss!1504) (mask!10239 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4326 thiss!1504)))))

(declare-fun b!232296 () Bool)

(declare-fun e!150843 () Bool)

(assert (=> b!232296 (= e!150843 (not call!21587))))

(declare-fun mapIsEmpty!10351 () Bool)

(declare-fun mapRes!10351 () Bool)

(assert (=> mapIsEmpty!10351 mapRes!10351))

(declare-fun b!232297 () Bool)

(declare-fun Unit!7160 () Unit!7157)

(assert (=> b!232297 (= e!150850 Unit!7160)))

(declare-fun lt!117214 () Unit!7157)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!315 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 64) Int) Unit!7157)

(assert (=> b!232297 (= lt!117214 (lemmaInListMapThenSeekEntryOrOpenFindsIt!315 (_keys!6379 thiss!1504) (_values!4309 thiss!1504) (mask!10239 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) key!932 (defaultEntry!4326 thiss!1504)))))

(assert (=> b!232297 false))

(declare-fun b!232298 () Bool)

(declare-fun res!114045 () Bool)

(assert (=> b!232298 (=> (not res!114045) (not e!150845))))

(assert (=> b!232298 (= res!114045 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232299 () Bool)

(declare-fun res!114049 () Bool)

(assert (=> b!232299 (= res!114049 (= (select (arr!5458 (_keys!6379 thiss!1504)) (index!6041 lt!117208)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!232299 (=> (not res!114049) (not e!150843))))

(declare-fun b!232300 () Bool)

(declare-fun e!150844 () Bool)

(assert (=> b!232300 (= e!150844 tp_is_empty!6121)))

(declare-fun b!232301 () Bool)

(declare-fun lt!117201 () Unit!7157)

(assert (=> b!232301 (= e!150850 lt!117201)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!312 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 64) Int) Unit!7157)

(assert (=> b!232301 (= lt!117201 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!312 (_keys!6379 thiss!1504) (_values!4309 thiss!1504) (mask!10239 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) key!932 (defaultEntry!4326 thiss!1504)))))

(get-info :version)

(assert (=> b!232301 (= c!38625 ((_ is MissingZero!967) lt!117208))))

(declare-fun e!150851 () Bool)

(assert (=> b!232301 e!150851))

(declare-fun b!232302 () Bool)

(declare-fun res!114046 () Bool)

(assert (=> b!232302 (=> (not res!114046) (not e!150846))))

(assert (=> b!232302 (= res!114046 (= (select (arr!5458 (_keys!6379 thiss!1504)) (index!6038 lt!117208)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232303 () Bool)

(assert (=> b!232303 (= e!150849 (not true))))

(declare-fun lt!117207 () array!11477)

(declare-fun lt!117197 () array!11479)

(declare-fun lt!117206 () Bool)

(assert (=> b!232303 (= lt!117206 (valid!1333 (LongMapFixedSize!3335 (defaultEntry!4326 thiss!1504) (mask!10239 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1716 thiss!1504)) lt!117197 lt!117207 (_vacant!1716 thiss!1504))))))

(declare-fun lt!117203 () ListLongMap!3461)

(assert (=> b!232303 (contains!1617 lt!117203 key!932)))

(declare-fun lt!117200 () Unit!7157)

(declare-fun lemmaValidKeyInArrayIsInListMap!146 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 32) Int) Unit!7157)

(assert (=> b!232303 (= lt!117200 (lemmaValidKeyInArrayIsInListMap!146 lt!117197 lt!117207 (mask!10239 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) index!297 (defaultEntry!4326 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11479 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232303 (= (arrayCountValidKeys!0 lt!117197 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117212 () Unit!7157)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11479 (_ BitVec 32)) Unit!7157)

(assert (=> b!232303 (= lt!117212 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117197 index!297))))

(assert (=> b!232303 (arrayContainsKey!0 lt!117197 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117213 () Unit!7157)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11479 (_ BitVec 64) (_ BitVec 32)) Unit!7157)

(assert (=> b!232303 (= lt!117213 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117197 key!932 index!297))))

(declare-fun lt!117204 () ListLongMap!3461)

(assert (=> b!232303 (= lt!117204 lt!117203)))

(assert (=> b!232303 (= lt!117203 (getCurrentListMap!1255 lt!117197 lt!117207 (mask!10239 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4326 thiss!1504)))))

(declare-fun v!346 () V!7809)

(declare-fun +!631 (ListLongMap!3461 tuple2!4558) ListLongMap!3461)

(assert (=> b!232303 (= lt!117204 (+!631 lt!117196 (tuple2!4559 key!932 v!346)))))

(assert (=> b!232303 (= lt!117207 (array!11478 (store (arr!5457 (_values!4309 thiss!1504)) index!297 (ValueCellFull!2717 v!346)) (size!5791 (_values!4309 thiss!1504))))))

(declare-fun lt!117209 () Unit!7157)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!86 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 32) (_ BitVec 64) V!7809 Int) Unit!7157)

(assert (=> b!232303 (= lt!117209 (lemmaAddValidKeyToArrayThenAddPairToListMap!86 (_keys!6379 thiss!1504) (_values!4309 thiss!1504) (mask!10239 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) index!297 key!932 v!346 (defaultEntry!4326 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11479 (_ BitVec 32)) Bool)

(assert (=> b!232303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117197 (mask!10239 thiss!1504))))

(declare-fun lt!117205 () Unit!7157)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11479 (_ BitVec 32) (_ BitVec 32)) Unit!7157)

(assert (=> b!232303 (= lt!117205 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6379 thiss!1504) index!297 (mask!10239 thiss!1504)))))

(assert (=> b!232303 (= (arrayCountValidKeys!0 lt!117197 #b00000000000000000000000000000000 (size!5792 (_keys!6379 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6379 thiss!1504) #b00000000000000000000000000000000 (size!5792 (_keys!6379 thiss!1504)))))))

(declare-fun lt!117210 () Unit!7157)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11479 (_ BitVec 32) (_ BitVec 64)) Unit!7157)

(assert (=> b!232303 (= lt!117210 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6379 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3496 0))(
  ( (Nil!3493) (Cons!3492 (h!4140 (_ BitVec 64)) (t!8446 List!3496)) )
))
(declare-fun arrayNoDuplicates!0 (array!11479 (_ BitVec 32) List!3496) Bool)

(assert (=> b!232303 (arrayNoDuplicates!0 lt!117197 #b00000000000000000000000000000000 Nil!3493)))

(assert (=> b!232303 (= lt!117197 (array!11480 (store (arr!5458 (_keys!6379 thiss!1504)) index!297 key!932) (size!5792 (_keys!6379 thiss!1504))))))

(declare-fun lt!117211 () Unit!7157)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3496) Unit!7157)

(assert (=> b!232303 (= lt!117211 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6379 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3493))))

(declare-fun lt!117202 () Unit!7157)

(assert (=> b!232303 (= lt!117202 e!150847)))

(declare-fun c!38623 () Bool)

(assert (=> b!232303 (= c!38623 (arrayContainsKey!0 (_keys!6379 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232304 () Bool)

(declare-fun e!150854 () Bool)

(assert (=> b!232304 (= e!150854 ((_ is Undefined!967) lt!117208))))

(declare-fun b!232305 () Bool)

(assert (=> b!232305 (= e!150854 e!150843)))

(declare-fun res!114048 () Bool)

(assert (=> b!232305 (= res!114048 call!21588)))

(assert (=> b!232305 (=> (not res!114048) (not e!150843))))

(declare-fun e!150855 () Bool)

(declare-fun array_inv!3599 (array!11479) Bool)

(declare-fun array_inv!3600 (array!11477) Bool)

(assert (=> b!232306 (= e!150852 (and tp!21919 tp_is_empty!6121 (array_inv!3599 (_keys!6379 thiss!1504)) (array_inv!3600 (_values!4309 thiss!1504)) e!150855))))

(declare-fun b!232307 () Bool)

(assert (=> b!232307 (= e!150845 e!150853)))

(declare-fun res!114044 () Bool)

(assert (=> b!232307 (=> (not res!114044) (not e!150853))))

(assert (=> b!232307 (= res!114044 (or (= lt!117208 (MissingZero!967 index!297)) (= lt!117208 (MissingVacant!967 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11479 (_ BitVec 32)) SeekEntryResult!967)

(assert (=> b!232307 (= lt!117208 (seekEntryOrOpen!0 key!932 (_keys!6379 thiss!1504) (mask!10239 thiss!1504)))))

(declare-fun mapNonEmpty!10351 () Bool)

(declare-fun tp!21918 () Bool)

(assert (=> mapNonEmpty!10351 (= mapRes!10351 (and tp!21918 e!150844))))

(declare-fun mapRest!10351 () (Array (_ BitVec 32) ValueCell!2717))

(declare-fun mapKey!10351 () (_ BitVec 32))

(declare-fun mapValue!10351 () ValueCell!2717)

(assert (=> mapNonEmpty!10351 (= (arr!5457 (_values!4309 thiss!1504)) (store mapRest!10351 mapKey!10351 mapValue!10351))))

(declare-fun b!232308 () Bool)

(declare-fun res!114043 () Bool)

(assert (=> b!232308 (=> (not res!114043) (not e!150846))))

(assert (=> b!232308 (= res!114043 call!21588)))

(assert (=> b!232308 (= e!150851 e!150846)))

(declare-fun b!232309 () Bool)

(declare-fun c!38624 () Bool)

(assert (=> b!232309 (= c!38624 ((_ is MissingVacant!967) lt!117208))))

(assert (=> b!232309 (= e!150851 e!150854)))

(declare-fun b!232310 () Bool)

(declare-fun Unit!7161 () Unit!7157)

(assert (=> b!232310 (= e!150847 Unit!7161)))

(declare-fun lt!117198 () Unit!7157)

(declare-fun lemmaArrayContainsKeyThenInListMap!154 (array!11479 array!11477 (_ BitVec 32) (_ BitVec 32) V!7809 V!7809 (_ BitVec 64) (_ BitVec 32) Int) Unit!7157)

(assert (=> b!232310 (= lt!117198 (lemmaArrayContainsKeyThenInListMap!154 (_keys!6379 thiss!1504) (_values!4309 thiss!1504) (mask!10239 thiss!1504) (extraKeys!4063 thiss!1504) (zeroValue!4167 thiss!1504) (minValue!4167 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4326 thiss!1504)))))

(assert (=> b!232310 false))

(declare-fun b!232311 () Bool)

(declare-fun e!150842 () Bool)

(assert (=> b!232311 (= e!150842 tp_is_empty!6121)))

(declare-fun b!232312 () Bool)

(assert (=> b!232312 (= e!150855 (and e!150842 mapRes!10351))))

(declare-fun condMapEmpty!10351 () Bool)

(declare-fun mapDefault!10351 () ValueCell!2717)

(assert (=> b!232312 (= condMapEmpty!10351 (= (arr!5457 (_values!4309 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2717)) mapDefault!10351)))))

(assert (= (and start!22196 res!114050) b!232298))

(assert (= (and b!232298 res!114045) b!232307))

(assert (= (and b!232307 res!114044) b!232295))

(assert (= (and b!232295 c!38626) b!232297))

(assert (= (and b!232295 (not c!38626)) b!232301))

(assert (= (and b!232301 c!38625) b!232308))

(assert (= (and b!232301 (not c!38625)) b!232309))

(assert (= (and b!232308 res!114043) b!232302))

(assert (= (and b!232302 res!114046) b!232293))

(assert (= (and b!232309 c!38624) b!232305))

(assert (= (and b!232309 (not c!38624)) b!232304))

(assert (= (and b!232305 res!114048) b!232299))

(assert (= (and b!232299 res!114049) b!232296))

(assert (= (or b!232308 b!232305) bm!21584))

(assert (= (or b!232293 b!232296) bm!21585))

(assert (= (and b!232295 res!114047) b!232303))

(assert (= (and b!232303 c!38623) b!232310))

(assert (= (and b!232303 (not c!38623)) b!232294))

(assert (= (and b!232312 condMapEmpty!10351) mapIsEmpty!10351))

(assert (= (and b!232312 (not condMapEmpty!10351)) mapNonEmpty!10351))

(assert (= (and mapNonEmpty!10351 ((_ is ValueCellFull!2717) mapValue!10351)) b!232300))

(assert (= (and b!232312 ((_ is ValueCellFull!2717) mapDefault!10351)) b!232311))

(assert (= b!232306 b!232312))

(assert (= start!22196 b!232306))

(declare-fun m!253249 () Bool)

(assert (=> b!232302 m!253249))

(declare-fun m!253251 () Bool)

(assert (=> b!232307 m!253251))

(declare-fun m!253253 () Bool)

(assert (=> bm!21584 m!253253))

(declare-fun m!253255 () Bool)

(assert (=> b!232303 m!253255))

(declare-fun m!253257 () Bool)

(assert (=> b!232303 m!253257))

(declare-fun m!253259 () Bool)

(assert (=> b!232303 m!253259))

(declare-fun m!253261 () Bool)

(assert (=> b!232303 m!253261))

(declare-fun m!253263 () Bool)

(assert (=> b!232303 m!253263))

(declare-fun m!253265 () Bool)

(assert (=> b!232303 m!253265))

(declare-fun m!253267 () Bool)

(assert (=> b!232303 m!253267))

(declare-fun m!253269 () Bool)

(assert (=> b!232303 m!253269))

(declare-fun m!253271 () Bool)

(assert (=> b!232303 m!253271))

(declare-fun m!253273 () Bool)

(assert (=> b!232303 m!253273))

(declare-fun m!253275 () Bool)

(assert (=> b!232303 m!253275))

(declare-fun m!253277 () Bool)

(assert (=> b!232303 m!253277))

(declare-fun m!253279 () Bool)

(assert (=> b!232303 m!253279))

(declare-fun m!253281 () Bool)

(assert (=> b!232303 m!253281))

(declare-fun m!253283 () Bool)

(assert (=> b!232303 m!253283))

(declare-fun m!253285 () Bool)

(assert (=> b!232303 m!253285))

(declare-fun m!253287 () Bool)

(assert (=> b!232303 m!253287))

(declare-fun m!253289 () Bool)

(assert (=> b!232303 m!253289))

(declare-fun m!253291 () Bool)

(assert (=> b!232303 m!253291))

(declare-fun m!253293 () Bool)

(assert (=> b!232303 m!253293))

(declare-fun m!253295 () Bool)

(assert (=> b!232295 m!253295))

(declare-fun m!253297 () Bool)

(assert (=> b!232295 m!253297))

(declare-fun m!253299 () Bool)

(assert (=> b!232295 m!253299))

(assert (=> bm!21585 m!253255))

(declare-fun m!253301 () Bool)

(assert (=> mapNonEmpty!10351 m!253301))

(declare-fun m!253303 () Bool)

(assert (=> b!232310 m!253303))

(declare-fun m!253305 () Bool)

(assert (=> b!232297 m!253305))

(declare-fun m!253307 () Bool)

(assert (=> b!232299 m!253307))

(declare-fun m!253309 () Bool)

(assert (=> start!22196 m!253309))

(declare-fun m!253311 () Bool)

(assert (=> b!232306 m!253311))

(declare-fun m!253313 () Bool)

(assert (=> b!232306 m!253313))

(declare-fun m!253315 () Bool)

(assert (=> b!232301 m!253315))

(check-sat (not start!22196) b_and!13131 (not b!232297) tp_is_empty!6121 (not bm!21585) (not b!232306) (not bm!21584) (not b!232301) (not b!232295) (not b!232307) (not b_next!6259) (not b!232310) (not b!232303) (not mapNonEmpty!10351))
(check-sat b_and!13131 (not b_next!6259))
