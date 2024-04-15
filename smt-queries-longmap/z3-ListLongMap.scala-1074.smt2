; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22130 () Bool)

(assert start!22130)

(declare-fun b!230323 () Bool)

(declare-fun b_free!6193 () Bool)

(declare-fun b_next!6193 () Bool)

(assert (=> b!230323 (= b_free!6193 (not b_next!6193))))

(declare-fun tp!21721 () Bool)

(declare-fun b_and!13065 () Bool)

(assert (=> b!230323 (= tp!21721 b_and!13065)))

(declare-fun b!230313 () Bool)

(declare-fun e!149460 () Bool)

(declare-fun e!149456 () Bool)

(assert (=> b!230313 (= e!149460 e!149456)))

(declare-fun res!113251 () Bool)

(assert (=> b!230313 (=> (not res!113251) (not e!149456))))

(declare-datatypes ((SeekEntryResult!935 0))(
  ( (MissingZero!935 (index!5910 (_ BitVec 32))) (Found!935 (index!5911 (_ BitVec 32))) (Intermediate!935 (undefined!1747 Bool) (index!5912 (_ BitVec 32)) (x!23442 (_ BitVec 32))) (Undefined!935) (MissingVacant!935 (index!5913 (_ BitVec 32))) )
))
(declare-fun lt!115816 () SeekEntryResult!935)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230313 (= res!113251 (or (= lt!115816 (MissingZero!935 index!297)) (= lt!115816 (MissingVacant!935 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7721 0))(
  ( (V!7722 (val!3072 Int)) )
))
(declare-datatypes ((ValueCell!2684 0))(
  ( (ValueCellFull!2684 (v!5086 V!7721)) (EmptyCell!2684) )
))
(declare-datatypes ((array!11345 0))(
  ( (array!11346 (arr!5391 (Array (_ BitVec 32) ValueCell!2684)) (size!5725 (_ BitVec 32))) )
))
(declare-datatypes ((array!11347 0))(
  ( (array!11348 (arr!5392 (Array (_ BitVec 32) (_ BitVec 64))) (size!5726 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3268 0))(
  ( (LongMapFixedSize!3269 (defaultEntry!4293 Int) (mask!10184 (_ BitVec 32)) (extraKeys!4030 (_ BitVec 32)) (zeroValue!4134 V!7721) (minValue!4134 V!7721) (_size!1683 (_ BitVec 32)) (_keys!6346 array!11347) (_values!4276 array!11345) (_vacant!1683 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3268)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11347 (_ BitVec 32)) SeekEntryResult!935)

(assert (=> b!230313 (= lt!115816 (seekEntryOrOpen!0 key!932 (_keys!6346 thiss!1504) (mask!10184 thiss!1504)))))

(declare-fun b!230314 () Bool)

(declare-fun e!149462 () Bool)

(declare-fun e!149466 () Bool)

(declare-fun mapRes!10252 () Bool)

(assert (=> b!230314 (= e!149462 (and e!149466 mapRes!10252))))

(declare-fun condMapEmpty!10252 () Bool)

(declare-fun mapDefault!10252 () ValueCell!2684)

(assert (=> b!230314 (= condMapEmpty!10252 (= (arr!5391 (_values!4276 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2684)) mapDefault!10252)))))

(declare-fun b!230315 () Bool)

(declare-datatypes ((Unit!7028 0))(
  ( (Unit!7029) )
))
(declare-fun e!149461 () Unit!7028)

(declare-fun Unit!7030 () Unit!7028)

(assert (=> b!230315 (= e!149461 Unit!7030)))

(declare-fun lt!115810 () Unit!7028)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!291 (array!11347 array!11345 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 64) Int) Unit!7028)

(assert (=> b!230315 (= lt!115810 (lemmaInListMapThenSeekEntryOrOpenFindsIt!291 (_keys!6346 thiss!1504) (_values!4276 thiss!1504) (mask!10184 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) key!932 (defaultEntry!4293 thiss!1504)))))

(assert (=> b!230315 false))

(declare-fun mapNonEmpty!10252 () Bool)

(declare-fun tp!21720 () Bool)

(declare-fun e!149468 () Bool)

(assert (=> mapNonEmpty!10252 (= mapRes!10252 (and tp!21720 e!149468))))

(declare-fun mapKey!10252 () (_ BitVec 32))

(declare-fun mapRest!10252 () (Array (_ BitVec 32) ValueCell!2684))

(declare-fun mapValue!10252 () ValueCell!2684)

(assert (=> mapNonEmpty!10252 (= (arr!5391 (_values!4276 thiss!1504)) (store mapRest!10252 mapKey!10252 mapValue!10252))))

(declare-fun b!230316 () Bool)

(declare-fun e!149469 () Bool)

(assert (=> b!230316 (= e!149456 e!149469)))

(declare-fun res!113255 () Bool)

(assert (=> b!230316 (=> (not res!113255) (not e!149469))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230316 (= res!113255 (inRange!0 index!297 (mask!10184 thiss!1504)))))

(declare-fun lt!115813 () Unit!7028)

(assert (=> b!230316 (= lt!115813 e!149461)))

(declare-fun c!38230 () Bool)

(declare-datatypes ((tuple2!4502 0))(
  ( (tuple2!4503 (_1!2262 (_ BitVec 64)) (_2!2262 V!7721)) )
))
(declare-datatypes ((List!3440 0))(
  ( (Nil!3437) (Cons!3436 (h!4084 tuple2!4502) (t!8390 List!3440)) )
))
(declare-datatypes ((ListLongMap!3405 0))(
  ( (ListLongMap!3406 (toList!1718 List!3440)) )
))
(declare-fun lt!115818 () ListLongMap!3405)

(declare-fun contains!1593 (ListLongMap!3405 (_ BitVec 64)) Bool)

(assert (=> b!230316 (= c!38230 (contains!1593 lt!115818 key!932))))

(declare-fun getCurrentListMap!1227 (array!11347 array!11345 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 32) Int) ListLongMap!3405)

(assert (=> b!230316 (= lt!115818 (getCurrentListMap!1227 (_keys!6346 thiss!1504) (_values!4276 thiss!1504) (mask!10184 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4293 thiss!1504)))))

(declare-fun b!230317 () Bool)

(declare-fun tp_is_empty!6055 () Bool)

(assert (=> b!230317 (= e!149468 tp_is_empty!6055)))

(declare-fun b!230318 () Bool)

(declare-fun res!113258 () Bool)

(assert (=> b!230318 (= res!113258 (= (select (arr!5392 (_keys!6346 thiss!1504)) (index!5913 lt!115816)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149458 () Bool)

(assert (=> b!230318 (=> (not res!113258) (not e!149458))))

(declare-fun b!230319 () Bool)

(declare-fun e!149467 () Bool)

(declare-fun call!21389 () Bool)

(assert (=> b!230319 (= e!149467 (not call!21389))))

(declare-fun b!230320 () Bool)

(declare-fun lt!115811 () Unit!7028)

(assert (=> b!230320 (= e!149461 lt!115811)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!288 (array!11347 array!11345 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 64) Int) Unit!7028)

(assert (=> b!230320 (= lt!115811 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!288 (_keys!6346 thiss!1504) (_values!4276 thiss!1504) (mask!10184 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) key!932 (defaultEntry!4293 thiss!1504)))))

(declare-fun c!38227 () Bool)

(get-info :version)

(assert (=> b!230320 (= c!38227 ((_ is MissingZero!935) lt!115816))))

(declare-fun e!149463 () Bool)

(assert (=> b!230320 e!149463))

(declare-fun b!230321 () Bool)

(declare-fun e!149459 () Unit!7028)

(declare-fun Unit!7031 () Unit!7028)

(assert (=> b!230321 (= e!149459 Unit!7031)))

(declare-fun b!230322 () Bool)

(assert (=> b!230322 (= e!149466 tp_is_empty!6055)))

(declare-fun e!149465 () Bool)

(declare-fun array_inv!3557 (array!11347) Bool)

(declare-fun array_inv!3558 (array!11345) Bool)

(assert (=> b!230323 (= e!149465 (and tp!21721 tp_is_empty!6055 (array_inv!3557 (_keys!6346 thiss!1504)) (array_inv!3558 (_values!4276 thiss!1504)) e!149462))))

(declare-fun mapIsEmpty!10252 () Bool)

(assert (=> mapIsEmpty!10252 mapRes!10252))

(declare-fun b!230324 () Bool)

(declare-fun c!38229 () Bool)

(assert (=> b!230324 (= c!38229 ((_ is MissingVacant!935) lt!115816))))

(declare-fun e!149464 () Bool)

(assert (=> b!230324 (= e!149463 e!149464)))

(declare-fun bm!21386 () Bool)

(declare-fun call!21390 () Bool)

(assert (=> bm!21386 (= call!21390 (inRange!0 (ite c!38227 (index!5910 lt!115816) (index!5913 lt!115816)) (mask!10184 thiss!1504)))))

(declare-fun b!230326 () Bool)

(assert (=> b!230326 (= e!149469 (not true))))

(declare-fun lt!115817 () array!11347)

(declare-fun arrayContainsKey!0 (array!11347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230326 (arrayContainsKey!0 lt!115817 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!115819 () Unit!7028)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11347 (_ BitVec 64) (_ BitVec 32)) Unit!7028)

(assert (=> b!230326 (= lt!115819 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!115817 key!932 index!297))))

(declare-fun v!346 () V!7721)

(declare-fun +!604 (ListLongMap!3405 tuple2!4502) ListLongMap!3405)

(assert (=> b!230326 (= (+!604 lt!115818 (tuple2!4503 key!932 v!346)) (getCurrentListMap!1227 lt!115817 (array!11346 (store (arr!5391 (_values!4276 thiss!1504)) index!297 (ValueCellFull!2684 v!346)) (size!5725 (_values!4276 thiss!1504))) (mask!10184 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4293 thiss!1504)))))

(declare-fun lt!115814 () Unit!7028)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!59 (array!11347 array!11345 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 32) (_ BitVec 64) V!7721 Int) Unit!7028)

(assert (=> b!230326 (= lt!115814 (lemmaAddValidKeyToArrayThenAddPairToListMap!59 (_keys!6346 thiss!1504) (_values!4276 thiss!1504) (mask!10184 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) index!297 key!932 v!346 (defaultEntry!4293 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11347 (_ BitVec 32)) Bool)

(assert (=> b!230326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115817 (mask!10184 thiss!1504))))

(declare-fun lt!115815 () Unit!7028)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11347 (_ BitVec 32) (_ BitVec 32)) Unit!7028)

(assert (=> b!230326 (= lt!115815 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6346 thiss!1504) index!297 (mask!10184 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11347 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230326 (= (arrayCountValidKeys!0 lt!115817 #b00000000000000000000000000000000 (size!5726 (_keys!6346 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6346 thiss!1504) #b00000000000000000000000000000000 (size!5726 (_keys!6346 thiss!1504)))))))

(declare-fun lt!115809 () Unit!7028)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11347 (_ BitVec 32) (_ BitVec 64)) Unit!7028)

(assert (=> b!230326 (= lt!115809 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6346 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3441 0))(
  ( (Nil!3438) (Cons!3437 (h!4085 (_ BitVec 64)) (t!8391 List!3441)) )
))
(declare-fun arrayNoDuplicates!0 (array!11347 (_ BitVec 32) List!3441) Bool)

(assert (=> b!230326 (arrayNoDuplicates!0 lt!115817 #b00000000000000000000000000000000 Nil!3438)))

(assert (=> b!230326 (= lt!115817 (array!11348 (store (arr!5392 (_keys!6346 thiss!1504)) index!297 key!932) (size!5726 (_keys!6346 thiss!1504))))))

(declare-fun lt!115808 () Unit!7028)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3441) Unit!7028)

(assert (=> b!230326 (= lt!115808 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6346 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3438))))

(declare-fun lt!115812 () Unit!7028)

(assert (=> b!230326 (= lt!115812 e!149459)))

(declare-fun c!38228 () Bool)

(assert (=> b!230326 (= c!38228 (arrayContainsKey!0 (_keys!6346 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230327 () Bool)

(assert (=> b!230327 (= e!149464 ((_ is Undefined!935) lt!115816))))

(declare-fun bm!21387 () Bool)

(assert (=> bm!21387 (= call!21389 (arrayContainsKey!0 (_keys!6346 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230328 () Bool)

(declare-fun res!113254 () Bool)

(assert (=> b!230328 (=> (not res!113254) (not e!149467))))

(assert (=> b!230328 (= res!113254 call!21390)))

(assert (=> b!230328 (= e!149463 e!149467)))

(declare-fun b!230329 () Bool)

(assert (=> b!230329 (= e!149458 (not call!21389))))

(declare-fun b!230330 () Bool)

(declare-fun res!113252 () Bool)

(assert (=> b!230330 (=> (not res!113252) (not e!149460))))

(assert (=> b!230330 (= res!113252 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230331 () Bool)

(declare-fun Unit!7032 () Unit!7028)

(assert (=> b!230331 (= e!149459 Unit!7032)))

(declare-fun lt!115807 () Unit!7028)

(declare-fun lemmaArrayContainsKeyThenInListMap!132 (array!11347 array!11345 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 64) (_ BitVec 32) Int) Unit!7028)

(assert (=> b!230331 (= lt!115807 (lemmaArrayContainsKeyThenInListMap!132 (_keys!6346 thiss!1504) (_values!4276 thiss!1504) (mask!10184 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4293 thiss!1504)))))

(assert (=> b!230331 false))

(declare-fun b!230332 () Bool)

(declare-fun res!113253 () Bool)

(assert (=> b!230332 (=> (not res!113253) (not e!149467))))

(assert (=> b!230332 (= res!113253 (= (select (arr!5392 (_keys!6346 thiss!1504)) (index!5910 lt!115816)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230325 () Bool)

(assert (=> b!230325 (= e!149464 e!149458)))

(declare-fun res!113256 () Bool)

(assert (=> b!230325 (= res!113256 call!21390)))

(assert (=> b!230325 (=> (not res!113256) (not e!149458))))

(declare-fun res!113257 () Bool)

(assert (=> start!22130 (=> (not res!113257) (not e!149460))))

(declare-fun valid!1314 (LongMapFixedSize!3268) Bool)

(assert (=> start!22130 (= res!113257 (valid!1314 thiss!1504))))

(assert (=> start!22130 e!149460))

(assert (=> start!22130 e!149465))

(assert (=> start!22130 true))

(assert (=> start!22130 tp_is_empty!6055))

(assert (= (and start!22130 res!113257) b!230330))

(assert (= (and b!230330 res!113252) b!230313))

(assert (= (and b!230313 res!113251) b!230316))

(assert (= (and b!230316 c!38230) b!230315))

(assert (= (and b!230316 (not c!38230)) b!230320))

(assert (= (and b!230320 c!38227) b!230328))

(assert (= (and b!230320 (not c!38227)) b!230324))

(assert (= (and b!230328 res!113254) b!230332))

(assert (= (and b!230332 res!113253) b!230319))

(assert (= (and b!230324 c!38229) b!230325))

(assert (= (and b!230324 (not c!38229)) b!230327))

(assert (= (and b!230325 res!113256) b!230318))

(assert (= (and b!230318 res!113258) b!230329))

(assert (= (or b!230328 b!230325) bm!21386))

(assert (= (or b!230319 b!230329) bm!21387))

(assert (= (and b!230316 res!113255) b!230326))

(assert (= (and b!230326 c!38228) b!230331))

(assert (= (and b!230326 (not c!38228)) b!230321))

(assert (= (and b!230314 condMapEmpty!10252) mapIsEmpty!10252))

(assert (= (and b!230314 (not condMapEmpty!10252)) mapNonEmpty!10252))

(assert (= (and mapNonEmpty!10252 ((_ is ValueCellFull!2684) mapValue!10252)) b!230317))

(assert (= (and b!230314 ((_ is ValueCellFull!2684) mapDefault!10252)) b!230322))

(assert (= b!230323 b!230314))

(assert (= start!22130 b!230323))

(declare-fun m!251215 () Bool)

(assert (=> b!230320 m!251215))

(declare-fun m!251217 () Bool)

(assert (=> b!230326 m!251217))

(declare-fun m!251219 () Bool)

(assert (=> b!230326 m!251219))

(declare-fun m!251221 () Bool)

(assert (=> b!230326 m!251221))

(declare-fun m!251223 () Bool)

(assert (=> b!230326 m!251223))

(declare-fun m!251225 () Bool)

(assert (=> b!230326 m!251225))

(declare-fun m!251227 () Bool)

(assert (=> b!230326 m!251227))

(declare-fun m!251229 () Bool)

(assert (=> b!230326 m!251229))

(declare-fun m!251231 () Bool)

(assert (=> b!230326 m!251231))

(declare-fun m!251233 () Bool)

(assert (=> b!230326 m!251233))

(declare-fun m!251235 () Bool)

(assert (=> b!230326 m!251235))

(declare-fun m!251237 () Bool)

(assert (=> b!230326 m!251237))

(declare-fun m!251239 () Bool)

(assert (=> b!230326 m!251239))

(declare-fun m!251241 () Bool)

(assert (=> b!230326 m!251241))

(declare-fun m!251243 () Bool)

(assert (=> b!230326 m!251243))

(declare-fun m!251245 () Bool)

(assert (=> b!230326 m!251245))

(declare-fun m!251247 () Bool)

(assert (=> b!230331 m!251247))

(declare-fun m!251249 () Bool)

(assert (=> b!230323 m!251249))

(declare-fun m!251251 () Bool)

(assert (=> b!230323 m!251251))

(declare-fun m!251253 () Bool)

(assert (=> b!230332 m!251253))

(declare-fun m!251255 () Bool)

(assert (=> start!22130 m!251255))

(declare-fun m!251257 () Bool)

(assert (=> bm!21386 m!251257))

(declare-fun m!251259 () Bool)

(assert (=> b!230316 m!251259))

(declare-fun m!251261 () Bool)

(assert (=> b!230316 m!251261))

(declare-fun m!251263 () Bool)

(assert (=> b!230316 m!251263))

(declare-fun m!251265 () Bool)

(assert (=> b!230313 m!251265))

(declare-fun m!251267 () Bool)

(assert (=> mapNonEmpty!10252 m!251267))

(assert (=> bm!21387 m!251217))

(declare-fun m!251269 () Bool)

(assert (=> b!230318 m!251269))

(declare-fun m!251271 () Bool)

(assert (=> b!230315 m!251271))

(check-sat (not bm!21386) (not b_next!6193) (not b!230316) (not start!22130) (not b!230320) (not b!230315) (not bm!21387) tp_is_empty!6055 (not b!230331) (not b!230313) (not mapNonEmpty!10252) (not b!230326) (not b!230323) b_and!13065)
(check-sat b_and!13065 (not b_next!6193))
