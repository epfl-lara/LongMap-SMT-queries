; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22160 () Bool)

(assert start!22160)

(declare-fun b!231225 () Bool)

(declare-fun b_free!6223 () Bool)

(declare-fun b_next!6223 () Bool)

(assert (=> b!231225 (= b_free!6223 (not b_next!6223))))

(declare-fun tp!21810 () Bool)

(declare-fun b_and!13095 () Bool)

(assert (=> b!231225 (= tp!21810 b_and!13095)))

(declare-fun b!231213 () Bool)

(declare-fun e!150098 () Bool)

(declare-datatypes ((SeekEntryResult!950 0))(
  ( (MissingZero!950 (index!5970 (_ BitVec 32))) (Found!950 (index!5971 (_ BitVec 32))) (Intermediate!950 (undefined!1762 Bool) (index!5972 (_ BitVec 32)) (x!23497 (_ BitVec 32))) (Undefined!950) (MissingVacant!950 (index!5973 (_ BitVec 32))) )
))
(declare-fun lt!116433 () SeekEntryResult!950)

(get-info :version)

(assert (=> b!231213 (= e!150098 ((_ is Undefined!950) lt!116433))))

(declare-fun b!231214 () Bool)

(declare-fun e!150089 () Bool)

(declare-fun e!150092 () Bool)

(assert (=> b!231214 (= e!150089 e!150092)))

(declare-fun res!113616 () Bool)

(assert (=> b!231214 (=> (not res!113616) (not e!150092))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7761 0))(
  ( (V!7762 (val!3087 Int)) )
))
(declare-datatypes ((ValueCell!2699 0))(
  ( (ValueCellFull!2699 (v!5101 V!7761)) (EmptyCell!2699) )
))
(declare-datatypes ((array!11405 0))(
  ( (array!11406 (arr!5421 (Array (_ BitVec 32) ValueCell!2699)) (size!5755 (_ BitVec 32))) )
))
(declare-datatypes ((array!11407 0))(
  ( (array!11408 (arr!5422 (Array (_ BitVec 32) (_ BitVec 64))) (size!5756 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3298 0))(
  ( (LongMapFixedSize!3299 (defaultEntry!4308 Int) (mask!10209 (_ BitVec 32)) (extraKeys!4045 (_ BitVec 32)) (zeroValue!4149 V!7761) (minValue!4149 V!7761) (_size!1698 (_ BitVec 32)) (_keys!6361 array!11407) (_values!4291 array!11405) (_vacant!1698 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3298)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231214 (= res!113616 (inRange!0 index!297 (mask!10209 thiss!1504)))))

(declare-datatypes ((Unit!7083 0))(
  ( (Unit!7084) )
))
(declare-fun lt!116442 () Unit!7083)

(declare-fun e!150097 () Unit!7083)

(assert (=> b!231214 (= lt!116442 e!150097)))

(declare-fun c!38409 () Bool)

(declare-datatypes ((tuple2!4524 0))(
  ( (tuple2!4525 (_1!2273 (_ BitVec 64)) (_2!2273 V!7761)) )
))
(declare-datatypes ((List!3462 0))(
  ( (Nil!3459) (Cons!3458 (h!4106 tuple2!4524) (t!8412 List!3462)) )
))
(declare-datatypes ((ListLongMap!3427 0))(
  ( (ListLongMap!3428 (toList!1729 List!3462)) )
))
(declare-fun lt!116435 () ListLongMap!3427)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1602 (ListLongMap!3427 (_ BitVec 64)) Bool)

(assert (=> b!231214 (= c!38409 (contains!1602 lt!116435 key!932))))

(declare-fun getCurrentListMap!1238 (array!11407 array!11405 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 32) Int) ListLongMap!3427)

(assert (=> b!231214 (= lt!116435 (getCurrentListMap!1238 (_keys!6361 thiss!1504) (_values!4291 thiss!1504) (mask!10209 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4308 thiss!1504)))))

(declare-fun bm!21476 () Bool)

(declare-fun c!38408 () Bool)

(declare-fun call!21480 () Bool)

(assert (=> bm!21476 (= call!21480 (inRange!0 (ite c!38408 (index!5970 lt!116433) (index!5973 lt!116433)) (mask!10209 thiss!1504)))))

(declare-fun b!231215 () Bool)

(declare-fun lt!116434 () Unit!7083)

(assert (=> b!231215 (= e!150097 lt!116434)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!299 (array!11407 array!11405 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 64) Int) Unit!7083)

(assert (=> b!231215 (= lt!116434 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!299 (_keys!6361 thiss!1504) (_values!4291 thiss!1504) (mask!10209 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) key!932 (defaultEntry!4308 thiss!1504)))))

(assert (=> b!231215 (= c!38408 ((_ is MissingZero!950) lt!116433))))

(declare-fun e!150099 () Bool)

(assert (=> b!231215 e!150099))

(declare-fun b!231216 () Bool)

(declare-fun res!113612 () Bool)

(assert (=> b!231216 (= res!113612 (= (select (arr!5422 (_keys!6361 thiss!1504)) (index!5973 lt!116433)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!150086 () Bool)

(assert (=> b!231216 (=> (not res!113612) (not e!150086))))

(declare-fun b!231217 () Bool)

(assert (=> b!231217 (= e!150098 e!150086)))

(declare-fun res!113615 () Bool)

(assert (=> b!231217 (= res!113615 call!21480)))

(assert (=> b!231217 (=> (not res!113615) (not e!150086))))

(declare-fun b!231218 () Bool)

(declare-fun c!38407 () Bool)

(assert (=> b!231218 (= c!38407 ((_ is MissingVacant!950) lt!116433))))

(assert (=> b!231218 (= e!150099 e!150098)))

(declare-fun res!113614 () Bool)

(declare-fun e!150087 () Bool)

(assert (=> start!22160 (=> (not res!113614) (not e!150087))))

(declare-fun valid!1324 (LongMapFixedSize!3298) Bool)

(assert (=> start!22160 (= res!113614 (valid!1324 thiss!1504))))

(assert (=> start!22160 e!150087))

(declare-fun e!150093 () Bool)

(assert (=> start!22160 e!150093))

(assert (=> start!22160 true))

(declare-fun tp_is_empty!6085 () Bool)

(assert (=> start!22160 tp_is_empty!6085))

(declare-fun b!231219 () Bool)

(declare-fun e!150088 () Bool)

(assert (=> b!231219 (= e!150088 tp_is_empty!6085)))

(declare-fun bm!21477 () Bool)

(declare-fun call!21479 () Bool)

(declare-fun arrayContainsKey!0 (array!11407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21477 (= call!21479 (arrayContainsKey!0 (_keys!6361 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231220 () Bool)

(declare-fun res!113618 () Bool)

(declare-fun e!150091 () Bool)

(assert (=> b!231220 (=> (not res!113618) (not e!150091))))

(assert (=> b!231220 (= res!113618 call!21480)))

(assert (=> b!231220 (= e!150099 e!150091)))

(declare-fun b!231221 () Bool)

(declare-fun Unit!7085 () Unit!7083)

(assert (=> b!231221 (= e!150097 Unit!7085)))

(declare-fun lt!116431 () Unit!7083)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!301 (array!11407 array!11405 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 64) Int) Unit!7083)

(assert (=> b!231221 (= lt!116431 (lemmaInListMapThenSeekEntryOrOpenFindsIt!301 (_keys!6361 thiss!1504) (_values!4291 thiss!1504) (mask!10209 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) key!932 (defaultEntry!4308 thiss!1504)))))

(assert (=> b!231221 false))

(declare-fun b!231222 () Bool)

(declare-fun res!113617 () Bool)

(assert (=> b!231222 (=> (not res!113617) (not e!150087))))

(assert (=> b!231222 (= res!113617 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10297 () Bool)

(declare-fun mapRes!10297 () Bool)

(assert (=> mapIsEmpty!10297 mapRes!10297))

(declare-fun b!231223 () Bool)

(declare-fun e!150095 () Unit!7083)

(declare-fun Unit!7086 () Unit!7083)

(assert (=> b!231223 (= e!150095 Unit!7086)))

(declare-fun b!231224 () Bool)

(assert (=> b!231224 (= e!150091 (not call!21479))))

(declare-fun mapNonEmpty!10297 () Bool)

(declare-fun tp!21811 () Bool)

(declare-fun e!150096 () Bool)

(assert (=> mapNonEmpty!10297 (= mapRes!10297 (and tp!21811 e!150096))))

(declare-fun mapValue!10297 () ValueCell!2699)

(declare-fun mapRest!10297 () (Array (_ BitVec 32) ValueCell!2699))

(declare-fun mapKey!10297 () (_ BitVec 32))

(assert (=> mapNonEmpty!10297 (= (arr!5421 (_values!4291 thiss!1504)) (store mapRest!10297 mapKey!10297 mapValue!10297))))

(declare-fun e!150090 () Bool)

(declare-fun array_inv!3577 (array!11407) Bool)

(declare-fun array_inv!3578 (array!11405) Bool)

(assert (=> b!231225 (= e!150093 (and tp!21810 tp_is_empty!6085 (array_inv!3577 (_keys!6361 thiss!1504)) (array_inv!3578 (_values!4291 thiss!1504)) e!150090))))

(declare-fun b!231226 () Bool)

(assert (=> b!231226 (= e!150096 tp_is_empty!6085)))

(declare-fun b!231227 () Bool)

(declare-fun Unit!7087 () Unit!7083)

(assert (=> b!231227 (= e!150095 Unit!7087)))

(declare-fun lt!116443 () Unit!7083)

(declare-fun lemmaArrayContainsKeyThenInListMap!142 (array!11407 array!11405 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 64) (_ BitVec 32) Int) Unit!7083)

(assert (=> b!231227 (= lt!116443 (lemmaArrayContainsKeyThenInListMap!142 (_keys!6361 thiss!1504) (_values!4291 thiss!1504) (mask!10209 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4308 thiss!1504)))))

(assert (=> b!231227 false))

(declare-fun b!231228 () Bool)

(assert (=> b!231228 (= e!150086 (not call!21479))))

(declare-fun b!231229 () Bool)

(assert (=> b!231229 (= e!150087 e!150089)))

(declare-fun res!113613 () Bool)

(assert (=> b!231229 (=> (not res!113613) (not e!150089))))

(assert (=> b!231229 (= res!113613 (or (= lt!116433 (MissingZero!950 index!297)) (= lt!116433 (MissingVacant!950 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11407 (_ BitVec 32)) SeekEntryResult!950)

(assert (=> b!231229 (= lt!116433 (seekEntryOrOpen!0 key!932 (_keys!6361 thiss!1504) (mask!10209 thiss!1504)))))

(declare-fun b!231230 () Bool)

(assert (=> b!231230 (= e!150090 (and e!150088 mapRes!10297))))

(declare-fun condMapEmpty!10297 () Bool)

(declare-fun mapDefault!10297 () ValueCell!2699)

(assert (=> b!231230 (= condMapEmpty!10297 (= (arr!5421 (_values!4291 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2699)) mapDefault!10297)))))

(declare-fun b!231231 () Bool)

(declare-fun res!113611 () Bool)

(assert (=> b!231231 (=> (not res!113611) (not e!150091))))

(assert (=> b!231231 (= res!113611 (= (select (arr!5422 (_keys!6361 thiss!1504)) (index!5970 lt!116433)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231232 () Bool)

(assert (=> b!231232 (= e!150092 (not true))))

(declare-fun lt!116439 () array!11407)

(declare-fun arrayCountValidKeys!0 (array!11407 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231232 (= (arrayCountValidKeys!0 lt!116439 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116432 () Unit!7083)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11407 (_ BitVec 32)) Unit!7083)

(assert (=> b!231232 (= lt!116432 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116439 index!297))))

(assert (=> b!231232 (arrayContainsKey!0 lt!116439 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116441 () Unit!7083)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11407 (_ BitVec 64) (_ BitVec 32)) Unit!7083)

(assert (=> b!231232 (= lt!116441 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116439 key!932 index!297))))

(declare-fun v!346 () V!7761)

(declare-fun +!615 (ListLongMap!3427 tuple2!4524) ListLongMap!3427)

(assert (=> b!231232 (= (+!615 lt!116435 (tuple2!4525 key!932 v!346)) (getCurrentListMap!1238 lt!116439 (array!11406 (store (arr!5421 (_values!4291 thiss!1504)) index!297 (ValueCellFull!2699 v!346)) (size!5755 (_values!4291 thiss!1504))) (mask!10209 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4308 thiss!1504)))))

(declare-fun lt!116436 () Unit!7083)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!70 (array!11407 array!11405 (_ BitVec 32) (_ BitVec 32) V!7761 V!7761 (_ BitVec 32) (_ BitVec 64) V!7761 Int) Unit!7083)

(assert (=> b!231232 (= lt!116436 (lemmaAddValidKeyToArrayThenAddPairToListMap!70 (_keys!6361 thiss!1504) (_values!4291 thiss!1504) (mask!10209 thiss!1504) (extraKeys!4045 thiss!1504) (zeroValue!4149 thiss!1504) (minValue!4149 thiss!1504) index!297 key!932 v!346 (defaultEntry!4308 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11407 (_ BitVec 32)) Bool)

(assert (=> b!231232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116439 (mask!10209 thiss!1504))))

(declare-fun lt!116438 () Unit!7083)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11407 (_ BitVec 32) (_ BitVec 32)) Unit!7083)

(assert (=> b!231232 (= lt!116438 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6361 thiss!1504) index!297 (mask!10209 thiss!1504)))))

(assert (=> b!231232 (= (arrayCountValidKeys!0 lt!116439 #b00000000000000000000000000000000 (size!5756 (_keys!6361 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6361 thiss!1504) #b00000000000000000000000000000000 (size!5756 (_keys!6361 thiss!1504)))))))

(declare-fun lt!116437 () Unit!7083)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11407 (_ BitVec 32) (_ BitVec 64)) Unit!7083)

(assert (=> b!231232 (= lt!116437 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6361 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3463 0))(
  ( (Nil!3460) (Cons!3459 (h!4107 (_ BitVec 64)) (t!8413 List!3463)) )
))
(declare-fun arrayNoDuplicates!0 (array!11407 (_ BitVec 32) List!3463) Bool)

(assert (=> b!231232 (arrayNoDuplicates!0 lt!116439 #b00000000000000000000000000000000 Nil!3460)))

(assert (=> b!231232 (= lt!116439 (array!11408 (store (arr!5422 (_keys!6361 thiss!1504)) index!297 key!932) (size!5756 (_keys!6361 thiss!1504))))))

(declare-fun lt!116430 () Unit!7083)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11407 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3463) Unit!7083)

(assert (=> b!231232 (= lt!116430 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6361 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3460))))

(declare-fun lt!116440 () Unit!7083)

(assert (=> b!231232 (= lt!116440 e!150095)))

(declare-fun c!38410 () Bool)

(assert (=> b!231232 (= c!38410 (arrayContainsKey!0 (_keys!6361 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!22160 res!113614) b!231222))

(assert (= (and b!231222 res!113617) b!231229))

(assert (= (and b!231229 res!113613) b!231214))

(assert (= (and b!231214 c!38409) b!231221))

(assert (= (and b!231214 (not c!38409)) b!231215))

(assert (= (and b!231215 c!38408) b!231220))

(assert (= (and b!231215 (not c!38408)) b!231218))

(assert (= (and b!231220 res!113618) b!231231))

(assert (= (and b!231231 res!113611) b!231224))

(assert (= (and b!231218 c!38407) b!231217))

(assert (= (and b!231218 (not c!38407)) b!231213))

(assert (= (and b!231217 res!113615) b!231216))

(assert (= (and b!231216 res!113612) b!231228))

(assert (= (or b!231220 b!231217) bm!21476))

(assert (= (or b!231224 b!231228) bm!21477))

(assert (= (and b!231214 res!113616) b!231232))

(assert (= (and b!231232 c!38410) b!231227))

(assert (= (and b!231232 (not c!38410)) b!231223))

(assert (= (and b!231230 condMapEmpty!10297) mapIsEmpty!10297))

(assert (= (and b!231230 (not condMapEmpty!10297)) mapNonEmpty!10297))

(assert (= (and mapNonEmpty!10297 ((_ is ValueCellFull!2699) mapValue!10297)) b!231226))

(assert (= (and b!231230 ((_ is ValueCellFull!2699) mapDefault!10297)) b!231219))

(assert (= b!231225 b!231230))

(assert (= start!22160 b!231225))

(declare-fun m!252133 () Bool)

(assert (=> b!231231 m!252133))

(declare-fun m!252135 () Bool)

(assert (=> mapNonEmpty!10297 m!252135))

(declare-fun m!252137 () Bool)

(assert (=> b!231214 m!252137))

(declare-fun m!252139 () Bool)

(assert (=> b!231214 m!252139))

(declare-fun m!252141 () Bool)

(assert (=> b!231214 m!252141))

(declare-fun m!252143 () Bool)

(assert (=> b!231225 m!252143))

(declare-fun m!252145 () Bool)

(assert (=> b!231225 m!252145))

(declare-fun m!252147 () Bool)

(assert (=> b!231215 m!252147))

(declare-fun m!252149 () Bool)

(assert (=> b!231229 m!252149))

(declare-fun m!252151 () Bool)

(assert (=> start!22160 m!252151))

(declare-fun m!252153 () Bool)

(assert (=> b!231216 m!252153))

(declare-fun m!252155 () Bool)

(assert (=> b!231232 m!252155))

(declare-fun m!252157 () Bool)

(assert (=> b!231232 m!252157))

(declare-fun m!252159 () Bool)

(assert (=> b!231232 m!252159))

(declare-fun m!252161 () Bool)

(assert (=> b!231232 m!252161))

(declare-fun m!252163 () Bool)

(assert (=> b!231232 m!252163))

(declare-fun m!252165 () Bool)

(assert (=> b!231232 m!252165))

(declare-fun m!252167 () Bool)

(assert (=> b!231232 m!252167))

(declare-fun m!252169 () Bool)

(assert (=> b!231232 m!252169))

(declare-fun m!252171 () Bool)

(assert (=> b!231232 m!252171))

(declare-fun m!252173 () Bool)

(assert (=> b!231232 m!252173))

(declare-fun m!252175 () Bool)

(assert (=> b!231232 m!252175))

(declare-fun m!252177 () Bool)

(assert (=> b!231232 m!252177))

(declare-fun m!252179 () Bool)

(assert (=> b!231232 m!252179))

(declare-fun m!252181 () Bool)

(assert (=> b!231232 m!252181))

(declare-fun m!252183 () Bool)

(assert (=> b!231232 m!252183))

(declare-fun m!252185 () Bool)

(assert (=> b!231232 m!252185))

(declare-fun m!252187 () Bool)

(assert (=> b!231232 m!252187))

(declare-fun m!252189 () Bool)

(assert (=> b!231221 m!252189))

(declare-fun m!252191 () Bool)

(assert (=> b!231227 m!252191))

(assert (=> bm!21477 m!252155))

(declare-fun m!252193 () Bool)

(assert (=> bm!21476 m!252193))

(check-sat (not b!231225) (not bm!21477) b_and!13095 (not b!231227) (not b!231214) (not mapNonEmpty!10297) tp_is_empty!6085 (not b!231221) (not b!231215) (not bm!21476) (not b!231232) (not start!22160) (not b!231229) (not b_next!6223))
(check-sat b_and!13095 (not b_next!6223))
