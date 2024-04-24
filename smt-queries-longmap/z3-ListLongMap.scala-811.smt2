; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19730 () Bool)

(assert start!19730)

(declare-fun b!193356 () Bool)

(declare-fun b_free!4705 () Bool)

(declare-fun b_next!4705 () Bool)

(assert (=> b!193356 (= b_free!4705 (not b_next!4705))))

(declare-fun tp!16979 () Bool)

(declare-fun b_and!11425 () Bool)

(assert (=> b!193356 (= tp!16979 b_and!11425)))

(declare-fun b!193344 () Bool)

(declare-fun e!127210 () Bool)

(declare-fun tp_is_empty!4477 () Bool)

(assert (=> b!193344 (= e!127210 tp_is_empty!4477)))

(declare-fun b!193345 () Bool)

(declare-fun e!127207 () Bool)

(declare-fun e!127214 () Bool)

(assert (=> b!193345 (= e!127207 e!127214)))

(declare-fun res!91357 () Bool)

(assert (=> b!193345 (=> (not res!91357) (not e!127214))))

(declare-datatypes ((SeekEntryResult!676 0))(
  ( (MissingZero!676 (index!4874 (_ BitVec 32))) (Found!676 (index!4875 (_ BitVec 32))) (Intermediate!676 (undefined!1488 Bool) (index!4876 (_ BitVec 32)) (x!20636 (_ BitVec 32))) (Undefined!676) (MissingVacant!676 (index!4877 (_ BitVec 32))) )
))
(declare-fun lt!96279 () SeekEntryResult!676)

(get-info :version)

(assert (=> b!193345 (= res!91357 (and (not ((_ is Undefined!676) lt!96279)) (not ((_ is MissingVacant!676) lt!96279)) (not ((_ is MissingZero!676) lt!96279)) ((_ is Found!676) lt!96279)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5617 0))(
  ( (V!5618 (val!2283 Int)) )
))
(declare-datatypes ((ValueCell!1895 0))(
  ( (ValueCellFull!1895 (v!4240 V!5617)) (EmptyCell!1895) )
))
(declare-datatypes ((array!8187 0))(
  ( (array!8188 (arr!3854 (Array (_ BitVec 32) (_ BitVec 64))) (size!4178 (_ BitVec 32))) )
))
(declare-datatypes ((array!8189 0))(
  ( (array!8190 (arr!3855 (Array (_ BitVec 32) ValueCell!1895)) (size!4179 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2698 0))(
  ( (LongMapFixedSize!2699 (defaultEntry!3945 Int) (mask!9196 (_ BitVec 32)) (extraKeys!3682 (_ BitVec 32)) (zeroValue!3786 V!5617) (minValue!3786 V!5617) (_size!1398 (_ BitVec 32)) (_keys!5935 array!8187) (_values!3928 array!8189) (_vacant!1398 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2698)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8187 (_ BitVec 32)) SeekEntryResult!676)

(assert (=> b!193345 (= lt!96279 (seekEntryOrOpen!0 key!828 (_keys!5935 thiss!1248) (mask!9196 thiss!1248)))))

(declare-fun b!193346 () Bool)

(declare-fun e!127205 () Bool)

(declare-fun e!127206 () Bool)

(declare-fun mapRes!7742 () Bool)

(assert (=> b!193346 (= e!127205 (and e!127206 mapRes!7742))))

(declare-fun condMapEmpty!7742 () Bool)

(declare-fun mapDefault!7742 () ValueCell!1895)

(assert (=> b!193346 (= condMapEmpty!7742 (= (arr!3855 (_values!3928 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1895)) mapDefault!7742)))))

(declare-fun b!193347 () Bool)

(assert (=> b!193347 (= e!127206 tp_is_empty!4477)))

(declare-fun b!193348 () Bool)

(declare-fun res!91360 () Bool)

(declare-fun e!127213 () Bool)

(assert (=> b!193348 (=> res!91360 e!127213)))

(assert (=> b!193348 (= res!91360 (or (not (= (size!4179 (_values!3928 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9196 thiss!1248)))) (not (= (size!4178 (_keys!5935 thiss!1248)) (size!4179 (_values!3928 thiss!1248)))) (bvslt (mask!9196 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3682 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3682 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7742 () Bool)

(assert (=> mapIsEmpty!7742 mapRes!7742))

(declare-fun b!193350 () Bool)

(declare-datatypes ((Unit!5837 0))(
  ( (Unit!5838) )
))
(declare-fun e!127211 () Unit!5837)

(declare-fun Unit!5839 () Unit!5837)

(assert (=> b!193350 (= e!127211 Unit!5839)))

(declare-fun lt!96278 () Unit!5837)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!177 (array!8187 array!8189 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 64) Int) Unit!5837)

(assert (=> b!193350 (= lt!96278 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!177 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)))))

(assert (=> b!193350 false))

(declare-fun b!193351 () Bool)

(assert (=> b!193351 (= e!127214 (not e!127213))))

(declare-fun res!91361 () Bool)

(assert (=> b!193351 (=> res!91361 e!127213)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193351 (= res!91361 (not (validMask!0 (mask!9196 thiss!1248))))))

(declare-fun v!309 () V!5617)

(declare-datatypes ((tuple2!3492 0))(
  ( (tuple2!3493 (_1!1757 (_ BitVec 64)) (_2!1757 V!5617)) )
))
(declare-datatypes ((List!2400 0))(
  ( (Nil!2397) (Cons!2396 (h!3037 tuple2!3492) (t!7314 List!2400)) )
))
(declare-datatypes ((ListLongMap!2413 0))(
  ( (ListLongMap!2414 (toList!1222 List!2400)) )
))
(declare-fun lt!96280 () ListLongMap!2413)

(declare-fun +!315 (ListLongMap!2413 tuple2!3492) ListLongMap!2413)

(declare-fun getCurrentListMap!874 (array!8187 array!8189 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 32) Int) ListLongMap!2413)

(assert (=> b!193351 (= (+!315 lt!96280 (tuple2!3493 key!828 v!309)) (getCurrentListMap!874 (_keys!5935 thiss!1248) (array!8190 (store (arr!3855 (_values!3928 thiss!1248)) (index!4875 lt!96279) (ValueCellFull!1895 v!309)) (size!4179 (_values!3928 thiss!1248))) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96282 () Unit!5837)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!119 (array!8187 array!8189 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 32) (_ BitVec 64) V!5617 Int) Unit!5837)

(assert (=> b!193351 (= lt!96282 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!119 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) (index!4875 lt!96279) key!828 v!309 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96277 () Unit!5837)

(assert (=> b!193351 (= lt!96277 e!127211)))

(declare-fun c!34878 () Bool)

(declare-fun contains!1355 (ListLongMap!2413 (_ BitVec 64)) Bool)

(assert (=> b!193351 (= c!34878 (contains!1355 lt!96280 key!828))))

(assert (=> b!193351 (= lt!96280 (getCurrentListMap!874 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun b!193352 () Bool)

(assert (=> b!193352 (= e!127213 (and (bvsge (index!4875 lt!96279) #b00000000000000000000000000000000) (bvslt (index!4875 lt!96279) (size!4178 (_keys!5935 thiss!1248)))))))

(declare-fun b!193353 () Bool)

(declare-fun e!127208 () Bool)

(assert (=> b!193353 (= e!127208 (= (select (arr!3854 (_keys!5935 thiss!1248)) (index!4875 lt!96279)) key!828))))

(declare-fun mapNonEmpty!7742 () Bool)

(declare-fun tp!16978 () Bool)

(assert (=> mapNonEmpty!7742 (= mapRes!7742 (and tp!16978 e!127210))))

(declare-fun mapRest!7742 () (Array (_ BitVec 32) ValueCell!1895))

(declare-fun mapValue!7742 () ValueCell!1895)

(declare-fun mapKey!7742 () (_ BitVec 32))

(assert (=> mapNonEmpty!7742 (= (arr!3855 (_values!3928 thiss!1248)) (store mapRest!7742 mapKey!7742 mapValue!7742))))

(declare-fun res!91363 () Bool)

(assert (=> start!19730 (=> (not res!91363) (not e!127207))))

(declare-fun valid!1128 (LongMapFixedSize!2698) Bool)

(assert (=> start!19730 (= res!91363 (valid!1128 thiss!1248))))

(assert (=> start!19730 e!127207))

(declare-fun e!127209 () Bool)

(assert (=> start!19730 e!127209))

(assert (=> start!19730 true))

(assert (=> start!19730 tp_is_empty!4477))

(declare-fun b!193349 () Bool)

(declare-fun res!91358 () Bool)

(assert (=> b!193349 (=> res!91358 e!127213)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8187 (_ BitVec 32)) Bool)

(assert (=> b!193349 (= res!91358 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5935 thiss!1248) (mask!9196 thiss!1248))))))

(declare-fun b!193354 () Bool)

(declare-fun res!91359 () Bool)

(assert (=> b!193354 (=> (not res!91359) (not e!127207))))

(assert (=> b!193354 (= res!91359 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193355 () Bool)

(declare-fun res!91356 () Bool)

(assert (=> b!193355 (=> res!91356 e!127213)))

(declare-datatypes ((List!2401 0))(
  ( (Nil!2398) (Cons!2397 (h!3038 (_ BitVec 64)) (t!7315 List!2401)) )
))
(declare-fun arrayNoDuplicates!0 (array!8187 (_ BitVec 32) List!2401) Bool)

(assert (=> b!193355 (= res!91356 (not (arrayNoDuplicates!0 (_keys!5935 thiss!1248) #b00000000000000000000000000000000 Nil!2398)))))

(declare-fun array_inv!2487 (array!8187) Bool)

(declare-fun array_inv!2488 (array!8189) Bool)

(assert (=> b!193356 (= e!127209 (and tp!16979 tp_is_empty!4477 (array_inv!2487 (_keys!5935 thiss!1248)) (array_inv!2488 (_values!3928 thiss!1248)) e!127205))))

(declare-fun b!193357 () Bool)

(declare-fun lt!96281 () Unit!5837)

(assert (=> b!193357 (= e!127211 lt!96281)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!179 (array!8187 array!8189 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 64) Int) Unit!5837)

(assert (=> b!193357 (= lt!96281 (lemmaInListMapThenSeekEntryOrOpenFindsIt!179 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)))))

(declare-fun res!91362 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193357 (= res!91362 (inRange!0 (index!4875 lt!96279) (mask!9196 thiss!1248)))))

(assert (=> b!193357 (=> (not res!91362) (not e!127208))))

(assert (=> b!193357 e!127208))

(assert (= (and start!19730 res!91363) b!193354))

(assert (= (and b!193354 res!91359) b!193345))

(assert (= (and b!193345 res!91357) b!193351))

(assert (= (and b!193351 c!34878) b!193357))

(assert (= (and b!193351 (not c!34878)) b!193350))

(assert (= (and b!193357 res!91362) b!193353))

(assert (= (and b!193351 (not res!91361)) b!193348))

(assert (= (and b!193348 (not res!91360)) b!193349))

(assert (= (and b!193349 (not res!91358)) b!193355))

(assert (= (and b!193355 (not res!91356)) b!193352))

(assert (= (and b!193346 condMapEmpty!7742) mapIsEmpty!7742))

(assert (= (and b!193346 (not condMapEmpty!7742)) mapNonEmpty!7742))

(assert (= (and mapNonEmpty!7742 ((_ is ValueCellFull!1895) mapValue!7742)) b!193344))

(assert (= (and b!193346 ((_ is ValueCellFull!1895) mapDefault!7742)) b!193347))

(assert (= b!193356 b!193346))

(assert (= start!19730 b!193356))

(declare-fun m!220281 () Bool)

(assert (=> b!193350 m!220281))

(declare-fun m!220283 () Bool)

(assert (=> b!193356 m!220283))

(declare-fun m!220285 () Bool)

(assert (=> b!193356 m!220285))

(declare-fun m!220287 () Bool)

(assert (=> mapNonEmpty!7742 m!220287))

(declare-fun m!220289 () Bool)

(assert (=> b!193351 m!220289))

(declare-fun m!220291 () Bool)

(assert (=> b!193351 m!220291))

(declare-fun m!220293 () Bool)

(assert (=> b!193351 m!220293))

(declare-fun m!220295 () Bool)

(assert (=> b!193351 m!220295))

(declare-fun m!220297 () Bool)

(assert (=> b!193351 m!220297))

(declare-fun m!220299 () Bool)

(assert (=> b!193351 m!220299))

(declare-fun m!220301 () Bool)

(assert (=> b!193351 m!220301))

(declare-fun m!220303 () Bool)

(assert (=> b!193353 m!220303))

(declare-fun m!220305 () Bool)

(assert (=> start!19730 m!220305))

(declare-fun m!220307 () Bool)

(assert (=> b!193355 m!220307))

(declare-fun m!220309 () Bool)

(assert (=> b!193349 m!220309))

(declare-fun m!220311 () Bool)

(assert (=> b!193345 m!220311))

(declare-fun m!220313 () Bool)

(assert (=> b!193357 m!220313))

(declare-fun m!220315 () Bool)

(assert (=> b!193357 m!220315))

(check-sat (not b!193350) (not b!193357) (not b!193345) (not b!193351) (not start!19730) tp_is_empty!4477 (not b!193355) (not b!193356) (not b!193349) b_and!11425 (not mapNonEmpty!7742) (not b_next!4705))
(check-sat b_and!11425 (not b_next!4705))
(get-model)

(declare-fun d!56647 () Bool)

(assert (=> d!56647 (= (array_inv!2487 (_keys!5935 thiss!1248)) (bvsge (size!4178 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193356 d!56647))

(declare-fun d!56649 () Bool)

(assert (=> d!56649 (= (array_inv!2488 (_values!3928 thiss!1248)) (bvsge (size!4179 (_values!3928 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193356 d!56649))

(declare-fun d!56651 () Bool)

(declare-fun e!127277 () Bool)

(assert (=> d!56651 e!127277))

(declare-fun res!91416 () Bool)

(assert (=> d!56651 (=> (not res!91416) (not e!127277))))

(declare-fun lt!96324 () SeekEntryResult!676)

(assert (=> d!56651 (= res!91416 ((_ is Found!676) lt!96324))))

(assert (=> d!56651 (= lt!96324 (seekEntryOrOpen!0 key!828 (_keys!5935 thiss!1248) (mask!9196 thiss!1248)))))

(declare-fun lt!96323 () Unit!5837)

(declare-fun choose!1064 (array!8187 array!8189 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 64) Int) Unit!5837)

(assert (=> d!56651 (= lt!96323 (choose!1064 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)))))

(assert (=> d!56651 (validMask!0 (mask!9196 thiss!1248))))

(assert (=> d!56651 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!179 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)) lt!96323)))

(declare-fun b!193446 () Bool)

(declare-fun res!91417 () Bool)

(assert (=> b!193446 (=> (not res!91417) (not e!127277))))

(assert (=> b!193446 (= res!91417 (inRange!0 (index!4875 lt!96324) (mask!9196 thiss!1248)))))

(declare-fun b!193447 () Bool)

(assert (=> b!193447 (= e!127277 (= (select (arr!3854 (_keys!5935 thiss!1248)) (index!4875 lt!96324)) key!828))))

(assert (=> b!193447 (and (bvsge (index!4875 lt!96324) #b00000000000000000000000000000000) (bvslt (index!4875 lt!96324) (size!4178 (_keys!5935 thiss!1248))))))

(assert (= (and d!56651 res!91416) b!193446))

(assert (= (and b!193446 res!91417) b!193447))

(assert (=> d!56651 m!220311))

(declare-fun m!220389 () Bool)

(assert (=> d!56651 m!220389))

(assert (=> d!56651 m!220301))

(declare-fun m!220391 () Bool)

(assert (=> b!193446 m!220391))

(declare-fun m!220393 () Bool)

(assert (=> b!193447 m!220393))

(assert (=> b!193357 d!56651))

(declare-fun d!56653 () Bool)

(assert (=> d!56653 (= (inRange!0 (index!4875 lt!96279) (mask!9196 thiss!1248)) (and (bvsge (index!4875 lt!96279) #b00000000000000000000000000000000) (bvslt (index!4875 lt!96279) (bvadd (mask!9196 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193357 d!56653))

(declare-fun d!56655 () Bool)

(declare-fun res!91424 () Bool)

(declare-fun e!127280 () Bool)

(assert (=> d!56655 (=> (not res!91424) (not e!127280))))

(declare-fun simpleValid!202 (LongMapFixedSize!2698) Bool)

(assert (=> d!56655 (= res!91424 (simpleValid!202 thiss!1248))))

(assert (=> d!56655 (= (valid!1128 thiss!1248) e!127280)))

(declare-fun b!193454 () Bool)

(declare-fun res!91425 () Bool)

(assert (=> b!193454 (=> (not res!91425) (not e!127280))))

(declare-fun arrayCountValidKeys!0 (array!8187 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!193454 (= res!91425 (= (arrayCountValidKeys!0 (_keys!5935 thiss!1248) #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))) (_size!1398 thiss!1248)))))

(declare-fun b!193455 () Bool)

(declare-fun res!91426 () Bool)

(assert (=> b!193455 (=> (not res!91426) (not e!127280))))

(assert (=> b!193455 (= res!91426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5935 thiss!1248) (mask!9196 thiss!1248)))))

(declare-fun b!193456 () Bool)

(assert (=> b!193456 (= e!127280 (arrayNoDuplicates!0 (_keys!5935 thiss!1248) #b00000000000000000000000000000000 Nil!2398))))

(assert (= (and d!56655 res!91424) b!193454))

(assert (= (and b!193454 res!91425) b!193455))

(assert (= (and b!193455 res!91426) b!193456))

(declare-fun m!220395 () Bool)

(assert (=> d!56655 m!220395))

(declare-fun m!220397 () Bool)

(assert (=> b!193454 m!220397))

(assert (=> b!193455 m!220309))

(assert (=> b!193456 m!220307))

(assert (=> start!19730 d!56655))

(declare-fun b!193465 () Bool)

(declare-fun e!127289 () Bool)

(declare-fun e!127287 () Bool)

(assert (=> b!193465 (= e!127289 e!127287)))

(declare-fun lt!96333 () (_ BitVec 64))

(assert (=> b!193465 (= lt!96333 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96332 () Unit!5837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8187 (_ BitVec 64) (_ BitVec 32)) Unit!5837)

(assert (=> b!193465 (= lt!96332 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5935 thiss!1248) lt!96333 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!193465 (arrayContainsKey!0 (_keys!5935 thiss!1248) lt!96333 #b00000000000000000000000000000000)))

(declare-fun lt!96331 () Unit!5837)

(assert (=> b!193465 (= lt!96331 lt!96332)))

(declare-fun res!91432 () Bool)

(assert (=> b!193465 (= res!91432 (= (seekEntryOrOpen!0 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000) (_keys!5935 thiss!1248) (mask!9196 thiss!1248)) (Found!676 #b00000000000000000000000000000000)))))

(assert (=> b!193465 (=> (not res!91432) (not e!127287))))

(declare-fun b!193466 () Bool)

(declare-fun e!127288 () Bool)

(assert (=> b!193466 (= e!127288 e!127289)))

(declare-fun c!34887 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!193466 (= c!34887 (validKeyInArray!0 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19517 () Bool)

(declare-fun call!19520 () Bool)

(assert (=> bm!19517 (= call!19520 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5935 thiss!1248) (mask!9196 thiss!1248)))))

(declare-fun b!193467 () Bool)

(assert (=> b!193467 (= e!127287 call!19520)))

(declare-fun b!193468 () Bool)

(assert (=> b!193468 (= e!127289 call!19520)))

(declare-fun d!56657 () Bool)

(declare-fun res!91431 () Bool)

(assert (=> d!56657 (=> res!91431 e!127288)))

(assert (=> d!56657 (= res!91431 (bvsge #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))

(assert (=> d!56657 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5935 thiss!1248) (mask!9196 thiss!1248)) e!127288)))

(assert (= (and d!56657 (not res!91431)) b!193466))

(assert (= (and b!193466 c!34887) b!193465))

(assert (= (and b!193466 (not c!34887)) b!193468))

(assert (= (and b!193465 res!91432) b!193467))

(assert (= (or b!193467 b!193468) bm!19517))

(declare-fun m!220399 () Bool)

(assert (=> b!193465 m!220399))

(declare-fun m!220401 () Bool)

(assert (=> b!193465 m!220401))

(declare-fun m!220403 () Bool)

(assert (=> b!193465 m!220403))

(assert (=> b!193465 m!220399))

(declare-fun m!220405 () Bool)

(assert (=> b!193465 m!220405))

(assert (=> b!193466 m!220399))

(assert (=> b!193466 m!220399))

(declare-fun m!220407 () Bool)

(assert (=> b!193466 m!220407))

(declare-fun m!220409 () Bool)

(assert (=> bm!19517 m!220409))

(assert (=> b!193349 d!56657))

(declare-fun d!56659 () Bool)

(declare-fun lt!96342 () SeekEntryResult!676)

(assert (=> d!56659 (and (or ((_ is Undefined!676) lt!96342) (not ((_ is Found!676) lt!96342)) (and (bvsge (index!4875 lt!96342) #b00000000000000000000000000000000) (bvslt (index!4875 lt!96342) (size!4178 (_keys!5935 thiss!1248))))) (or ((_ is Undefined!676) lt!96342) ((_ is Found!676) lt!96342) (not ((_ is MissingZero!676) lt!96342)) (and (bvsge (index!4874 lt!96342) #b00000000000000000000000000000000) (bvslt (index!4874 lt!96342) (size!4178 (_keys!5935 thiss!1248))))) (or ((_ is Undefined!676) lt!96342) ((_ is Found!676) lt!96342) ((_ is MissingZero!676) lt!96342) (not ((_ is MissingVacant!676) lt!96342)) (and (bvsge (index!4877 lt!96342) #b00000000000000000000000000000000) (bvslt (index!4877 lt!96342) (size!4178 (_keys!5935 thiss!1248))))) (or ((_ is Undefined!676) lt!96342) (ite ((_ is Found!676) lt!96342) (= (select (arr!3854 (_keys!5935 thiss!1248)) (index!4875 lt!96342)) key!828) (ite ((_ is MissingZero!676) lt!96342) (= (select (arr!3854 (_keys!5935 thiss!1248)) (index!4874 lt!96342)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!676) lt!96342) (= (select (arr!3854 (_keys!5935 thiss!1248)) (index!4877 lt!96342)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!127297 () SeekEntryResult!676)

(assert (=> d!56659 (= lt!96342 e!127297)))

(declare-fun c!34895 () Bool)

(declare-fun lt!96341 () SeekEntryResult!676)

(assert (=> d!56659 (= c!34895 (and ((_ is Intermediate!676) lt!96341) (undefined!1488 lt!96341)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8187 (_ BitVec 32)) SeekEntryResult!676)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56659 (= lt!96341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9196 thiss!1248)) key!828 (_keys!5935 thiss!1248) (mask!9196 thiss!1248)))))

(assert (=> d!56659 (validMask!0 (mask!9196 thiss!1248))))

(assert (=> d!56659 (= (seekEntryOrOpen!0 key!828 (_keys!5935 thiss!1248) (mask!9196 thiss!1248)) lt!96342)))

(declare-fun b!193481 () Bool)

(declare-fun e!127296 () SeekEntryResult!676)

(assert (=> b!193481 (= e!127296 (Found!676 (index!4876 lt!96341)))))

(declare-fun e!127298 () SeekEntryResult!676)

(declare-fun b!193482 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8187 (_ BitVec 32)) SeekEntryResult!676)

(assert (=> b!193482 (= e!127298 (seekKeyOrZeroReturnVacant!0 (x!20636 lt!96341) (index!4876 lt!96341) (index!4876 lt!96341) key!828 (_keys!5935 thiss!1248) (mask!9196 thiss!1248)))))

(declare-fun b!193483 () Bool)

(assert (=> b!193483 (= e!127298 (MissingZero!676 (index!4876 lt!96341)))))

(declare-fun b!193484 () Bool)

(declare-fun c!34894 () Bool)

(declare-fun lt!96340 () (_ BitVec 64))

(assert (=> b!193484 (= c!34894 (= lt!96340 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193484 (= e!127296 e!127298)))

(declare-fun b!193485 () Bool)

(assert (=> b!193485 (= e!127297 e!127296)))

(assert (=> b!193485 (= lt!96340 (select (arr!3854 (_keys!5935 thiss!1248)) (index!4876 lt!96341)))))

(declare-fun c!34896 () Bool)

(assert (=> b!193485 (= c!34896 (= lt!96340 key!828))))

(declare-fun b!193486 () Bool)

(assert (=> b!193486 (= e!127297 Undefined!676)))

(assert (= (and d!56659 c!34895) b!193486))

(assert (= (and d!56659 (not c!34895)) b!193485))

(assert (= (and b!193485 c!34896) b!193481))

(assert (= (and b!193485 (not c!34896)) b!193484))

(assert (= (and b!193484 c!34894) b!193483))

(assert (= (and b!193484 (not c!34894)) b!193482))

(declare-fun m!220411 () Bool)

(assert (=> d!56659 m!220411))

(declare-fun m!220413 () Bool)

(assert (=> d!56659 m!220413))

(declare-fun m!220415 () Bool)

(assert (=> d!56659 m!220415))

(declare-fun m!220417 () Bool)

(assert (=> d!56659 m!220417))

(assert (=> d!56659 m!220301))

(declare-fun m!220419 () Bool)

(assert (=> d!56659 m!220419))

(assert (=> d!56659 m!220413))

(declare-fun m!220421 () Bool)

(assert (=> b!193482 m!220421))

(declare-fun m!220423 () Bool)

(assert (=> b!193485 m!220423))

(assert (=> b!193345 d!56659))

(declare-fun b!193503 () Bool)

(declare-fun e!127309 () Bool)

(declare-fun lt!96347 () SeekEntryResult!676)

(assert (=> b!193503 (= e!127309 ((_ is Undefined!676) lt!96347))))

(declare-fun bm!19522 () Bool)

(declare-fun call!19526 () Bool)

(assert (=> bm!19522 (= call!19526 (arrayContainsKey!0 (_keys!5935 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!193504 () Bool)

(declare-fun e!127308 () Bool)

(assert (=> b!193504 (= e!127308 (not call!19526))))

(declare-fun b!193505 () Bool)

(assert (=> b!193505 (and (bvsge (index!4874 lt!96347) #b00000000000000000000000000000000) (bvslt (index!4874 lt!96347) (size!4178 (_keys!5935 thiss!1248))))))

(declare-fun res!91442 () Bool)

(assert (=> b!193505 (= res!91442 (= (select (arr!3854 (_keys!5935 thiss!1248)) (index!4874 lt!96347)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193505 (=> (not res!91442) (not e!127308))))

(declare-fun b!193506 () Bool)

(declare-fun e!127310 () Bool)

(assert (=> b!193506 (= e!127310 e!127309)))

(declare-fun c!34901 () Bool)

(assert (=> b!193506 (= c!34901 ((_ is MissingVacant!676) lt!96347))))

(declare-fun call!19525 () Bool)

(declare-fun bm!19523 () Bool)

(declare-fun c!34902 () Bool)

(assert (=> bm!19523 (= call!19525 (inRange!0 (ite c!34902 (index!4874 lt!96347) (index!4877 lt!96347)) (mask!9196 thiss!1248)))))

(declare-fun b!193508 () Bool)

(declare-fun res!91444 () Bool)

(declare-fun e!127307 () Bool)

(assert (=> b!193508 (=> (not res!91444) (not e!127307))))

(assert (=> b!193508 (= res!91444 call!19525)))

(assert (=> b!193508 (= e!127309 e!127307)))

(declare-fun b!193509 () Bool)

(assert (=> b!193509 (= e!127307 (not call!19526))))

(declare-fun b!193510 () Bool)

(declare-fun res!91441 () Bool)

(assert (=> b!193510 (=> (not res!91441) (not e!127307))))

(assert (=> b!193510 (= res!91441 (= (select (arr!3854 (_keys!5935 thiss!1248)) (index!4877 lt!96347)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193510 (and (bvsge (index!4877 lt!96347) #b00000000000000000000000000000000) (bvslt (index!4877 lt!96347) (size!4178 (_keys!5935 thiss!1248))))))

(declare-fun b!193507 () Bool)

(assert (=> b!193507 (= e!127310 e!127308)))

(declare-fun res!91443 () Bool)

(assert (=> b!193507 (= res!91443 call!19525)))

(assert (=> b!193507 (=> (not res!91443) (not e!127308))))

(declare-fun d!56661 () Bool)

(assert (=> d!56661 e!127310))

(assert (=> d!56661 (= c!34902 ((_ is MissingZero!676) lt!96347))))

(assert (=> d!56661 (= lt!96347 (seekEntryOrOpen!0 key!828 (_keys!5935 thiss!1248) (mask!9196 thiss!1248)))))

(declare-fun lt!96348 () Unit!5837)

(declare-fun choose!1065 (array!8187 array!8189 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 64) Int) Unit!5837)

(assert (=> d!56661 (= lt!96348 (choose!1065 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)))))

(assert (=> d!56661 (validMask!0 (mask!9196 thiss!1248))))

(assert (=> d!56661 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!177 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) key!828 (defaultEntry!3945 thiss!1248)) lt!96348)))

(assert (= (and d!56661 c!34902) b!193507))

(assert (= (and d!56661 (not c!34902)) b!193506))

(assert (= (and b!193507 res!91443) b!193505))

(assert (= (and b!193505 res!91442) b!193504))

(assert (= (and b!193506 c!34901) b!193508))

(assert (= (and b!193506 (not c!34901)) b!193503))

(assert (= (and b!193508 res!91444) b!193510))

(assert (= (and b!193510 res!91441) b!193509))

(assert (= (or b!193507 b!193508) bm!19523))

(assert (= (or b!193504 b!193509) bm!19522))

(declare-fun m!220425 () Bool)

(assert (=> bm!19522 m!220425))

(assert (=> d!56661 m!220311))

(declare-fun m!220427 () Bool)

(assert (=> d!56661 m!220427))

(assert (=> d!56661 m!220301))

(declare-fun m!220429 () Bool)

(assert (=> b!193505 m!220429))

(declare-fun m!220431 () Bool)

(assert (=> b!193510 m!220431))

(declare-fun m!220433 () Bool)

(assert (=> bm!19523 m!220433))

(assert (=> b!193350 d!56661))

(declare-fun b!193521 () Bool)

(declare-fun e!127322 () Bool)

(declare-fun e!127320 () Bool)

(assert (=> b!193521 (= e!127322 e!127320)))

(declare-fun res!91452 () Bool)

(assert (=> b!193521 (=> (not res!91452) (not e!127320))))

(declare-fun e!127319 () Bool)

(assert (=> b!193521 (= res!91452 (not e!127319))))

(declare-fun res!91451 () Bool)

(assert (=> b!193521 (=> (not res!91451) (not e!127319))))

(assert (=> b!193521 (= res!91451 (validKeyInArray!0 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193522 () Bool)

(declare-fun contains!1357 (List!2401 (_ BitVec 64)) Bool)

(assert (=> b!193522 (= e!127319 (contains!1357 Nil!2398 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193523 () Bool)

(declare-fun e!127321 () Bool)

(assert (=> b!193523 (= e!127320 e!127321)))

(declare-fun c!34905 () Bool)

(assert (=> b!193523 (= c!34905 (validKeyInArray!0 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193524 () Bool)

(declare-fun call!19529 () Bool)

(assert (=> b!193524 (= e!127321 call!19529)))

(declare-fun b!193525 () Bool)

(assert (=> b!193525 (= e!127321 call!19529)))

(declare-fun bm!19526 () Bool)

(assert (=> bm!19526 (= call!19529 (arrayNoDuplicates!0 (_keys!5935 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34905 (Cons!2397 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000) Nil!2398) Nil!2398)))))

(declare-fun d!56663 () Bool)

(declare-fun res!91453 () Bool)

(assert (=> d!56663 (=> res!91453 e!127322)))

(assert (=> d!56663 (= res!91453 (bvsge #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))

(assert (=> d!56663 (= (arrayNoDuplicates!0 (_keys!5935 thiss!1248) #b00000000000000000000000000000000 Nil!2398) e!127322)))

(assert (= (and d!56663 (not res!91453)) b!193521))

(assert (= (and b!193521 res!91451) b!193522))

(assert (= (and b!193521 res!91452) b!193523))

(assert (= (and b!193523 c!34905) b!193525))

(assert (= (and b!193523 (not c!34905)) b!193524))

(assert (= (or b!193525 b!193524) bm!19526))

(assert (=> b!193521 m!220399))

(assert (=> b!193521 m!220399))

(assert (=> b!193521 m!220407))

(assert (=> b!193522 m!220399))

(assert (=> b!193522 m!220399))

(declare-fun m!220435 () Bool)

(assert (=> b!193522 m!220435))

(assert (=> b!193523 m!220399))

(assert (=> b!193523 m!220399))

(assert (=> b!193523 m!220407))

(assert (=> bm!19526 m!220399))

(declare-fun m!220437 () Bool)

(assert (=> bm!19526 m!220437))

(assert (=> b!193355 d!56663))

(declare-fun d!56665 () Bool)

(assert (=> d!56665 (= (validMask!0 (mask!9196 thiss!1248)) (and (or (= (mask!9196 thiss!1248) #b00000000000000000000000000000111) (= (mask!9196 thiss!1248) #b00000000000000000000000000001111) (= (mask!9196 thiss!1248) #b00000000000000000000000000011111) (= (mask!9196 thiss!1248) #b00000000000000000000000000111111) (= (mask!9196 thiss!1248) #b00000000000000000000000001111111) (= (mask!9196 thiss!1248) #b00000000000000000000000011111111) (= (mask!9196 thiss!1248) #b00000000000000000000000111111111) (= (mask!9196 thiss!1248) #b00000000000000000000001111111111) (= (mask!9196 thiss!1248) #b00000000000000000000011111111111) (= (mask!9196 thiss!1248) #b00000000000000000000111111111111) (= (mask!9196 thiss!1248) #b00000000000000000001111111111111) (= (mask!9196 thiss!1248) #b00000000000000000011111111111111) (= (mask!9196 thiss!1248) #b00000000000000000111111111111111) (= (mask!9196 thiss!1248) #b00000000000000001111111111111111) (= (mask!9196 thiss!1248) #b00000000000000011111111111111111) (= (mask!9196 thiss!1248) #b00000000000000111111111111111111) (= (mask!9196 thiss!1248) #b00000000000001111111111111111111) (= (mask!9196 thiss!1248) #b00000000000011111111111111111111) (= (mask!9196 thiss!1248) #b00000000000111111111111111111111) (= (mask!9196 thiss!1248) #b00000000001111111111111111111111) (= (mask!9196 thiss!1248) #b00000000011111111111111111111111) (= (mask!9196 thiss!1248) #b00000000111111111111111111111111) (= (mask!9196 thiss!1248) #b00000001111111111111111111111111) (= (mask!9196 thiss!1248) #b00000011111111111111111111111111) (= (mask!9196 thiss!1248) #b00000111111111111111111111111111) (= (mask!9196 thiss!1248) #b00001111111111111111111111111111) (= (mask!9196 thiss!1248) #b00011111111111111111111111111111) (= (mask!9196 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9196 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!193351 d!56665))

(declare-fun d!56667 () Bool)

(declare-fun e!127328 () Bool)

(assert (=> d!56667 e!127328))

(declare-fun res!91456 () Bool)

(assert (=> d!56667 (=> res!91456 e!127328)))

(declare-fun lt!96359 () Bool)

(assert (=> d!56667 (= res!91456 (not lt!96359))))

(declare-fun lt!96360 () Bool)

(assert (=> d!56667 (= lt!96359 lt!96360)))

(declare-fun lt!96357 () Unit!5837)

(declare-fun e!127327 () Unit!5837)

(assert (=> d!56667 (= lt!96357 e!127327)))

(declare-fun c!34908 () Bool)

(assert (=> d!56667 (= c!34908 lt!96360)))

(declare-fun containsKey!247 (List!2400 (_ BitVec 64)) Bool)

(assert (=> d!56667 (= lt!96360 (containsKey!247 (toList!1222 lt!96280) key!828))))

(assert (=> d!56667 (= (contains!1355 lt!96280 key!828) lt!96359)))

(declare-fun b!193532 () Bool)

(declare-fun lt!96358 () Unit!5837)

(assert (=> b!193532 (= e!127327 lt!96358)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!195 (List!2400 (_ BitVec 64)) Unit!5837)

(assert (=> b!193532 (= lt!96358 (lemmaContainsKeyImpliesGetValueByKeyDefined!195 (toList!1222 lt!96280) key!828))))

(declare-datatypes ((Option!250 0))(
  ( (Some!249 (v!4245 V!5617)) (None!248) )
))
(declare-fun isDefined!196 (Option!250) Bool)

(declare-fun getValueByKey!244 (List!2400 (_ BitVec 64)) Option!250)

(assert (=> b!193532 (isDefined!196 (getValueByKey!244 (toList!1222 lt!96280) key!828))))

(declare-fun b!193533 () Bool)

(declare-fun Unit!5843 () Unit!5837)

(assert (=> b!193533 (= e!127327 Unit!5843)))

(declare-fun b!193534 () Bool)

(assert (=> b!193534 (= e!127328 (isDefined!196 (getValueByKey!244 (toList!1222 lt!96280) key!828)))))

(assert (= (and d!56667 c!34908) b!193532))

(assert (= (and d!56667 (not c!34908)) b!193533))

(assert (= (and d!56667 (not res!91456)) b!193534))

(declare-fun m!220439 () Bool)

(assert (=> d!56667 m!220439))

(declare-fun m!220441 () Bool)

(assert (=> b!193532 m!220441))

(declare-fun m!220443 () Bool)

(assert (=> b!193532 m!220443))

(assert (=> b!193532 m!220443))

(declare-fun m!220445 () Bool)

(assert (=> b!193532 m!220445))

(assert (=> b!193534 m!220443))

(assert (=> b!193534 m!220443))

(assert (=> b!193534 m!220445))

(assert (=> b!193351 d!56667))

(declare-fun b!193577 () Bool)

(declare-fun e!127358 () Bool)

(declare-fun e!127364 () Bool)

(assert (=> b!193577 (= e!127358 e!127364)))

(declare-fun res!91479 () Bool)

(assert (=> b!193577 (=> (not res!91479) (not e!127364))))

(declare-fun lt!96407 () ListLongMap!2413)

(assert (=> b!193577 (= res!91479 (contains!1355 lt!96407 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193577 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))

(declare-fun d!56669 () Bool)

(declare-fun e!127365 () Bool)

(assert (=> d!56669 e!127365))

(declare-fun res!91475 () Bool)

(assert (=> d!56669 (=> (not res!91475) (not e!127365))))

(assert (=> d!56669 (= res!91475 (or (bvsge #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))))

(declare-fun lt!96411 () ListLongMap!2413)

(assert (=> d!56669 (= lt!96407 lt!96411)))

(declare-fun lt!96417 () Unit!5837)

(declare-fun e!127359 () Unit!5837)

(assert (=> d!56669 (= lt!96417 e!127359)))

(declare-fun c!34922 () Bool)

(declare-fun e!127367 () Bool)

(assert (=> d!56669 (= c!34922 e!127367)))

(declare-fun res!91482 () Bool)

(assert (=> d!56669 (=> (not res!91482) (not e!127367))))

(assert (=> d!56669 (= res!91482 (bvslt #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))

(declare-fun e!127360 () ListLongMap!2413)

(assert (=> d!56669 (= lt!96411 e!127360)))

(declare-fun c!34921 () Bool)

(assert (=> d!56669 (= c!34921 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56669 (validMask!0 (mask!9196 thiss!1248))))

(assert (=> d!56669 (= (getCurrentListMap!874 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)) lt!96407)))

(declare-fun b!193578 () Bool)

(assert (=> b!193578 (= e!127367 (validKeyInArray!0 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193579 () Bool)

(declare-fun e!127357 () Bool)

(declare-fun e!127355 () Bool)

(assert (=> b!193579 (= e!127357 e!127355)))

(declare-fun res!91477 () Bool)

(declare-fun call!19550 () Bool)

(assert (=> b!193579 (= res!91477 call!19550)))

(assert (=> b!193579 (=> (not res!91477) (not e!127355))))

(declare-fun b!193580 () Bool)

(declare-fun call!19548 () ListLongMap!2413)

(assert (=> b!193580 (= e!127360 (+!315 call!19548 (tuple2!3493 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3786 thiss!1248))))))

(declare-fun bm!19541 () Bool)

(declare-fun call!19544 () ListLongMap!2413)

(declare-fun call!19547 () ListLongMap!2413)

(assert (=> bm!19541 (= call!19544 call!19547)))

(declare-fun bm!19542 () Bool)

(declare-fun call!19546 () ListLongMap!2413)

(assert (=> bm!19542 (= call!19546 call!19548)))

(declare-fun b!193581 () Bool)

(declare-fun e!127356 () Bool)

(declare-fun call!19545 () Bool)

(assert (=> b!193581 (= e!127356 (not call!19545))))

(declare-fun b!193582 () Bool)

(assert (=> b!193582 (= e!127357 (not call!19550))))

(declare-fun b!193583 () Bool)

(declare-fun e!127366 () Bool)

(declare-fun apply!186 (ListLongMap!2413 (_ BitVec 64)) V!5617)

(assert (=> b!193583 (= e!127366 (= (apply!186 lt!96407 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3786 thiss!1248)))))

(declare-fun b!193584 () Bool)

(declare-fun get!2237 (ValueCell!1895 V!5617) V!5617)

(declare-fun dynLambda!529 (Int (_ BitVec 64)) V!5617)

(assert (=> b!193584 (= e!127364 (= (apply!186 lt!96407 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)) (get!2237 (select (arr!3855 (_values!3928 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!529 (defaultEntry!3945 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4179 (_values!3928 thiss!1248))))))

(assert (=> b!193584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))

(declare-fun b!193585 () Bool)

(assert (=> b!193585 (= e!127355 (= (apply!186 lt!96407 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3786 thiss!1248)))))

(declare-fun b!193586 () Bool)

(assert (=> b!193586 (= e!127356 e!127366)))

(declare-fun res!91478 () Bool)

(assert (=> b!193586 (= res!91478 call!19545)))

(assert (=> b!193586 (=> (not res!91478) (not e!127366))))

(declare-fun b!193587 () Bool)

(declare-fun Unit!5844 () Unit!5837)

(assert (=> b!193587 (= e!127359 Unit!5844)))

(declare-fun call!19549 () ListLongMap!2413)

(declare-fun bm!19543 () Bool)

(declare-fun c!34923 () Bool)

(assert (=> bm!19543 (= call!19548 (+!315 (ite c!34921 call!19547 (ite c!34923 call!19544 call!19549)) (ite (or c!34921 c!34923) (tuple2!3493 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3786 thiss!1248)) (tuple2!3493 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3786 thiss!1248)))))))

(declare-fun b!193588 () Bool)

(assert (=> b!193588 (= e!127365 e!127357)))

(declare-fun c!34925 () Bool)

(assert (=> b!193588 (= c!34925 (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193589 () Bool)

(declare-fun e!127362 () ListLongMap!2413)

(assert (=> b!193589 (= e!127362 call!19549)))

(declare-fun b!193590 () Bool)

(declare-fun res!91480 () Bool)

(assert (=> b!193590 (=> (not res!91480) (not e!127365))))

(assert (=> b!193590 (= res!91480 e!127356)))

(declare-fun c!34926 () Bool)

(assert (=> b!193590 (= c!34926 (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193591 () Bool)

(declare-fun e!127363 () ListLongMap!2413)

(assert (=> b!193591 (= e!127360 e!127363)))

(assert (=> b!193591 (= c!34923 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193592 () Bool)

(assert (=> b!193592 (= e!127363 call!19546)))

(declare-fun b!193593 () Bool)

(declare-fun c!34924 () Bool)

(assert (=> b!193593 (= c!34924 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!193593 (= e!127363 e!127362)))

(declare-fun b!193594 () Bool)

(declare-fun res!91483 () Bool)

(assert (=> b!193594 (=> (not res!91483) (not e!127365))))

(assert (=> b!193594 (= res!91483 e!127358)))

(declare-fun res!91476 () Bool)

(assert (=> b!193594 (=> res!91476 e!127358)))

(declare-fun e!127361 () Bool)

(assert (=> b!193594 (= res!91476 (not e!127361))))

(declare-fun res!91481 () Bool)

(assert (=> b!193594 (=> (not res!91481) (not e!127361))))

(assert (=> b!193594 (= res!91481 (bvslt #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))

(declare-fun bm!19544 () Bool)

(assert (=> bm!19544 (= call!19549 call!19544)))

(declare-fun bm!19545 () Bool)

(assert (=> bm!19545 (= call!19550 (contains!1355 lt!96407 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193595 () Bool)

(declare-fun lt!96409 () Unit!5837)

(assert (=> b!193595 (= e!127359 lt!96409)))

(declare-fun lt!96412 () ListLongMap!2413)

(declare-fun getCurrentListMapNoExtraKeys!217 (array!8187 array!8189 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 32) Int) ListLongMap!2413)

(assert (=> b!193595 (= lt!96412 (getCurrentListMapNoExtraKeys!217 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96416 () (_ BitVec 64))

(assert (=> b!193595 (= lt!96416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96423 () (_ BitVec 64))

(assert (=> b!193595 (= lt!96423 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96419 () Unit!5837)

(declare-fun addStillContains!162 (ListLongMap!2413 (_ BitVec 64) V!5617 (_ BitVec 64)) Unit!5837)

(assert (=> b!193595 (= lt!96419 (addStillContains!162 lt!96412 lt!96416 (zeroValue!3786 thiss!1248) lt!96423))))

(assert (=> b!193595 (contains!1355 (+!315 lt!96412 (tuple2!3493 lt!96416 (zeroValue!3786 thiss!1248))) lt!96423)))

(declare-fun lt!96425 () Unit!5837)

(assert (=> b!193595 (= lt!96425 lt!96419)))

(declare-fun lt!96415 () ListLongMap!2413)

(assert (=> b!193595 (= lt!96415 (getCurrentListMapNoExtraKeys!217 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96424 () (_ BitVec 64))

(assert (=> b!193595 (= lt!96424 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96414 () (_ BitVec 64))

(assert (=> b!193595 (= lt!96414 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96410 () Unit!5837)

(declare-fun addApplyDifferent!162 (ListLongMap!2413 (_ BitVec 64) V!5617 (_ BitVec 64)) Unit!5837)

(assert (=> b!193595 (= lt!96410 (addApplyDifferent!162 lt!96415 lt!96424 (minValue!3786 thiss!1248) lt!96414))))

(assert (=> b!193595 (= (apply!186 (+!315 lt!96415 (tuple2!3493 lt!96424 (minValue!3786 thiss!1248))) lt!96414) (apply!186 lt!96415 lt!96414))))

(declare-fun lt!96405 () Unit!5837)

(assert (=> b!193595 (= lt!96405 lt!96410)))

(declare-fun lt!96413 () ListLongMap!2413)

(assert (=> b!193595 (= lt!96413 (getCurrentListMapNoExtraKeys!217 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96422 () (_ BitVec 64))

(assert (=> b!193595 (= lt!96422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96426 () (_ BitVec 64))

(assert (=> b!193595 (= lt!96426 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96420 () Unit!5837)

(assert (=> b!193595 (= lt!96420 (addApplyDifferent!162 lt!96413 lt!96422 (zeroValue!3786 thiss!1248) lt!96426))))

(assert (=> b!193595 (= (apply!186 (+!315 lt!96413 (tuple2!3493 lt!96422 (zeroValue!3786 thiss!1248))) lt!96426) (apply!186 lt!96413 lt!96426))))

(declare-fun lt!96421 () Unit!5837)

(assert (=> b!193595 (= lt!96421 lt!96420)))

(declare-fun lt!96418 () ListLongMap!2413)

(assert (=> b!193595 (= lt!96418 (getCurrentListMapNoExtraKeys!217 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96406 () (_ BitVec 64))

(assert (=> b!193595 (= lt!96406 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96408 () (_ BitVec 64))

(assert (=> b!193595 (= lt!96408 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193595 (= lt!96409 (addApplyDifferent!162 lt!96418 lt!96406 (minValue!3786 thiss!1248) lt!96408))))

(assert (=> b!193595 (= (apply!186 (+!315 lt!96418 (tuple2!3493 lt!96406 (minValue!3786 thiss!1248))) lt!96408) (apply!186 lt!96418 lt!96408))))

(declare-fun bm!19546 () Bool)

(assert (=> bm!19546 (= call!19545 (contains!1355 lt!96407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193596 () Bool)

(assert (=> b!193596 (= e!127362 call!19546)))

(declare-fun b!193597 () Bool)

(assert (=> b!193597 (= e!127361 (validKeyInArray!0 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19547 () Bool)

(assert (=> bm!19547 (= call!19547 (getCurrentListMapNoExtraKeys!217 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(assert (= (and d!56669 c!34921) b!193580))

(assert (= (and d!56669 (not c!34921)) b!193591))

(assert (= (and b!193591 c!34923) b!193592))

(assert (= (and b!193591 (not c!34923)) b!193593))

(assert (= (and b!193593 c!34924) b!193596))

(assert (= (and b!193593 (not c!34924)) b!193589))

(assert (= (or b!193596 b!193589) bm!19544))

(assert (= (or b!193592 bm!19544) bm!19541))

(assert (= (or b!193592 b!193596) bm!19542))

(assert (= (or b!193580 bm!19541) bm!19547))

(assert (= (or b!193580 bm!19542) bm!19543))

(assert (= (and d!56669 res!91482) b!193578))

(assert (= (and d!56669 c!34922) b!193595))

(assert (= (and d!56669 (not c!34922)) b!193587))

(assert (= (and d!56669 res!91475) b!193594))

(assert (= (and b!193594 res!91481) b!193597))

(assert (= (and b!193594 (not res!91476)) b!193577))

(assert (= (and b!193577 res!91479) b!193584))

(assert (= (and b!193594 res!91483) b!193590))

(assert (= (and b!193590 c!34926) b!193586))

(assert (= (and b!193590 (not c!34926)) b!193581))

(assert (= (and b!193586 res!91478) b!193583))

(assert (= (or b!193586 b!193581) bm!19546))

(assert (= (and b!193590 res!91480) b!193588))

(assert (= (and b!193588 c!34925) b!193579))

(assert (= (and b!193588 (not c!34925)) b!193582))

(assert (= (and b!193579 res!91477) b!193585))

(assert (= (or b!193579 b!193582) bm!19545))

(declare-fun b_lambda!7485 () Bool)

(assert (=> (not b_lambda!7485) (not b!193584)))

(declare-fun t!7319 () Bool)

(declare-fun tb!2875 () Bool)

(assert (=> (and b!193356 (= (defaultEntry!3945 thiss!1248) (defaultEntry!3945 thiss!1248)) t!7319) tb!2875))

(declare-fun result!4919 () Bool)

(assert (=> tb!2875 (= result!4919 tp_is_empty!4477)))

(assert (=> b!193584 t!7319))

(declare-fun b_and!11431 () Bool)

(assert (= b_and!11425 (and (=> t!7319 result!4919) b_and!11431)))

(declare-fun m!220447 () Bool)

(assert (=> bm!19545 m!220447))

(assert (=> d!56669 m!220301))

(declare-fun m!220449 () Bool)

(assert (=> bm!19546 m!220449))

(declare-fun m!220451 () Bool)

(assert (=> b!193580 m!220451))

(declare-fun m!220453 () Bool)

(assert (=> b!193585 m!220453))

(declare-fun m!220455 () Bool)

(assert (=> bm!19543 m!220455))

(declare-fun m!220457 () Bool)

(assert (=> bm!19547 m!220457))

(declare-fun m!220459 () Bool)

(assert (=> b!193583 m!220459))

(declare-fun m!220461 () Bool)

(assert (=> b!193595 m!220461))

(declare-fun m!220463 () Bool)

(assert (=> b!193595 m!220463))

(declare-fun m!220465 () Bool)

(assert (=> b!193595 m!220465))

(declare-fun m!220467 () Bool)

(assert (=> b!193595 m!220467))

(declare-fun m!220469 () Bool)

(assert (=> b!193595 m!220469))

(declare-fun m!220471 () Bool)

(assert (=> b!193595 m!220471))

(declare-fun m!220473 () Bool)

(assert (=> b!193595 m!220473))

(declare-fun m!220475 () Bool)

(assert (=> b!193595 m!220475))

(declare-fun m!220477 () Bool)

(assert (=> b!193595 m!220477))

(assert (=> b!193595 m!220465))

(declare-fun m!220479 () Bool)

(assert (=> b!193595 m!220479))

(declare-fun m!220481 () Bool)

(assert (=> b!193595 m!220481))

(declare-fun m!220483 () Bool)

(assert (=> b!193595 m!220483))

(assert (=> b!193595 m!220457))

(assert (=> b!193595 m!220461))

(declare-fun m!220485 () Bool)

(assert (=> b!193595 m!220485))

(assert (=> b!193595 m!220469))

(assert (=> b!193595 m!220399))

(declare-fun m!220487 () Bool)

(assert (=> b!193595 m!220487))

(assert (=> b!193595 m!220481))

(declare-fun m!220489 () Bool)

(assert (=> b!193595 m!220489))

(assert (=> b!193597 m!220399))

(assert (=> b!193597 m!220399))

(assert (=> b!193597 m!220407))

(declare-fun m!220491 () Bool)

(assert (=> b!193584 m!220491))

(assert (=> b!193584 m!220399))

(assert (=> b!193584 m!220491))

(declare-fun m!220493 () Bool)

(assert (=> b!193584 m!220493))

(declare-fun m!220495 () Bool)

(assert (=> b!193584 m!220495))

(assert (=> b!193584 m!220399))

(declare-fun m!220497 () Bool)

(assert (=> b!193584 m!220497))

(assert (=> b!193584 m!220493))

(assert (=> b!193578 m!220399))

(assert (=> b!193578 m!220399))

(assert (=> b!193578 m!220407))

(assert (=> b!193577 m!220399))

(assert (=> b!193577 m!220399))

(declare-fun m!220499 () Bool)

(assert (=> b!193577 m!220499))

(assert (=> b!193351 d!56669))

(declare-fun d!56671 () Bool)

(declare-fun e!127370 () Bool)

(assert (=> d!56671 e!127370))

(declare-fun res!91486 () Bool)

(assert (=> d!56671 (=> (not res!91486) (not e!127370))))

(assert (=> d!56671 (= res!91486 (and (bvsge (index!4875 lt!96279) #b00000000000000000000000000000000) (bvslt (index!4875 lt!96279) (size!4179 (_values!3928 thiss!1248)))))))

(declare-fun lt!96429 () Unit!5837)

(declare-fun choose!1066 (array!8187 array!8189 (_ BitVec 32) (_ BitVec 32) V!5617 V!5617 (_ BitVec 32) (_ BitVec 64) V!5617 Int) Unit!5837)

(assert (=> d!56671 (= lt!96429 (choose!1066 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) (index!4875 lt!96279) key!828 v!309 (defaultEntry!3945 thiss!1248)))))

(assert (=> d!56671 (validMask!0 (mask!9196 thiss!1248))))

(assert (=> d!56671 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!119 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) (index!4875 lt!96279) key!828 v!309 (defaultEntry!3945 thiss!1248)) lt!96429)))

(declare-fun b!193602 () Bool)

(assert (=> b!193602 (= e!127370 (= (+!315 (getCurrentListMap!874 (_keys!5935 thiss!1248) (_values!3928 thiss!1248) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)) (tuple2!3493 key!828 v!309)) (getCurrentListMap!874 (_keys!5935 thiss!1248) (array!8190 (store (arr!3855 (_values!3928 thiss!1248)) (index!4875 lt!96279) (ValueCellFull!1895 v!309)) (size!4179 (_values!3928 thiss!1248))) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248))))))

(assert (= (and d!56671 res!91486) b!193602))

(declare-fun m!220501 () Bool)

(assert (=> d!56671 m!220501))

(assert (=> d!56671 m!220301))

(assert (=> b!193602 m!220289))

(assert (=> b!193602 m!220289))

(declare-fun m!220503 () Bool)

(assert (=> b!193602 m!220503))

(assert (=> b!193602 m!220293))

(assert (=> b!193602 m!220291))

(assert (=> b!193351 d!56671))

(declare-fun b!193603 () Bool)

(declare-fun e!127374 () Bool)

(declare-fun e!127380 () Bool)

(assert (=> b!193603 (= e!127374 e!127380)))

(declare-fun res!91491 () Bool)

(assert (=> b!193603 (=> (not res!91491) (not e!127380))))

(declare-fun lt!96432 () ListLongMap!2413)

(assert (=> b!193603 (= res!91491 (contains!1355 lt!96432 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))

(declare-fun d!56673 () Bool)

(declare-fun e!127381 () Bool)

(assert (=> d!56673 e!127381))

(declare-fun res!91487 () Bool)

(assert (=> d!56673 (=> (not res!91487) (not e!127381))))

(assert (=> d!56673 (= res!91487 (or (bvsge #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))))

(declare-fun lt!96436 () ListLongMap!2413)

(assert (=> d!56673 (= lt!96432 lt!96436)))

(declare-fun lt!96442 () Unit!5837)

(declare-fun e!127375 () Unit!5837)

(assert (=> d!56673 (= lt!96442 e!127375)))

(declare-fun c!34928 () Bool)

(declare-fun e!127383 () Bool)

(assert (=> d!56673 (= c!34928 e!127383)))

(declare-fun res!91494 () Bool)

(assert (=> d!56673 (=> (not res!91494) (not e!127383))))

(assert (=> d!56673 (= res!91494 (bvslt #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))

(declare-fun e!127376 () ListLongMap!2413)

(assert (=> d!56673 (= lt!96436 e!127376)))

(declare-fun c!34927 () Bool)

(assert (=> d!56673 (= c!34927 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56673 (validMask!0 (mask!9196 thiss!1248))))

(assert (=> d!56673 (= (getCurrentListMap!874 (_keys!5935 thiss!1248) (array!8190 (store (arr!3855 (_values!3928 thiss!1248)) (index!4875 lt!96279) (ValueCellFull!1895 v!309)) (size!4179 (_values!3928 thiss!1248))) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)) lt!96432)))

(declare-fun b!193604 () Bool)

(assert (=> b!193604 (= e!127383 (validKeyInArray!0 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193605 () Bool)

(declare-fun e!127373 () Bool)

(declare-fun e!127371 () Bool)

(assert (=> b!193605 (= e!127373 e!127371)))

(declare-fun res!91489 () Bool)

(declare-fun call!19557 () Bool)

(assert (=> b!193605 (= res!91489 call!19557)))

(assert (=> b!193605 (=> (not res!91489) (not e!127371))))

(declare-fun b!193606 () Bool)

(declare-fun call!19555 () ListLongMap!2413)

(assert (=> b!193606 (= e!127376 (+!315 call!19555 (tuple2!3493 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3786 thiss!1248))))))

(declare-fun bm!19548 () Bool)

(declare-fun call!19551 () ListLongMap!2413)

(declare-fun call!19554 () ListLongMap!2413)

(assert (=> bm!19548 (= call!19551 call!19554)))

(declare-fun bm!19549 () Bool)

(declare-fun call!19553 () ListLongMap!2413)

(assert (=> bm!19549 (= call!19553 call!19555)))

(declare-fun b!193607 () Bool)

(declare-fun e!127372 () Bool)

(declare-fun call!19552 () Bool)

(assert (=> b!193607 (= e!127372 (not call!19552))))

(declare-fun b!193608 () Bool)

(assert (=> b!193608 (= e!127373 (not call!19557))))

(declare-fun b!193609 () Bool)

(declare-fun e!127382 () Bool)

(assert (=> b!193609 (= e!127382 (= (apply!186 lt!96432 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3786 thiss!1248)))))

(declare-fun b!193610 () Bool)

(assert (=> b!193610 (= e!127380 (= (apply!186 lt!96432 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)) (get!2237 (select (arr!3855 (array!8190 (store (arr!3855 (_values!3928 thiss!1248)) (index!4875 lt!96279) (ValueCellFull!1895 v!309)) (size!4179 (_values!3928 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!529 (defaultEntry!3945 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4179 (array!8190 (store (arr!3855 (_values!3928 thiss!1248)) (index!4875 lt!96279) (ValueCellFull!1895 v!309)) (size!4179 (_values!3928 thiss!1248))))))))

(assert (=> b!193610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))

(declare-fun b!193611 () Bool)

(assert (=> b!193611 (= e!127371 (= (apply!186 lt!96432 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3786 thiss!1248)))))

(declare-fun b!193612 () Bool)

(assert (=> b!193612 (= e!127372 e!127382)))

(declare-fun res!91490 () Bool)

(assert (=> b!193612 (= res!91490 call!19552)))

(assert (=> b!193612 (=> (not res!91490) (not e!127382))))

(declare-fun b!193613 () Bool)

(declare-fun Unit!5845 () Unit!5837)

(assert (=> b!193613 (= e!127375 Unit!5845)))

(declare-fun call!19556 () ListLongMap!2413)

(declare-fun bm!19550 () Bool)

(declare-fun c!34929 () Bool)

(assert (=> bm!19550 (= call!19555 (+!315 (ite c!34927 call!19554 (ite c!34929 call!19551 call!19556)) (ite (or c!34927 c!34929) (tuple2!3493 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3786 thiss!1248)) (tuple2!3493 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3786 thiss!1248)))))))

(declare-fun b!193614 () Bool)

(assert (=> b!193614 (= e!127381 e!127373)))

(declare-fun c!34931 () Bool)

(assert (=> b!193614 (= c!34931 (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193615 () Bool)

(declare-fun e!127378 () ListLongMap!2413)

(assert (=> b!193615 (= e!127378 call!19556)))

(declare-fun b!193616 () Bool)

(declare-fun res!91492 () Bool)

(assert (=> b!193616 (=> (not res!91492) (not e!127381))))

(assert (=> b!193616 (= res!91492 e!127372)))

(declare-fun c!34932 () Bool)

(assert (=> b!193616 (= c!34932 (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193617 () Bool)

(declare-fun e!127379 () ListLongMap!2413)

(assert (=> b!193617 (= e!127376 e!127379)))

(assert (=> b!193617 (= c!34929 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193618 () Bool)

(assert (=> b!193618 (= e!127379 call!19553)))

(declare-fun b!193619 () Bool)

(declare-fun c!34930 () Bool)

(assert (=> b!193619 (= c!34930 (and (not (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3682 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!193619 (= e!127379 e!127378)))

(declare-fun b!193620 () Bool)

(declare-fun res!91495 () Bool)

(assert (=> b!193620 (=> (not res!91495) (not e!127381))))

(assert (=> b!193620 (= res!91495 e!127374)))

(declare-fun res!91488 () Bool)

(assert (=> b!193620 (=> res!91488 e!127374)))

(declare-fun e!127377 () Bool)

(assert (=> b!193620 (= res!91488 (not e!127377))))

(declare-fun res!91493 () Bool)

(assert (=> b!193620 (=> (not res!91493) (not e!127377))))

(assert (=> b!193620 (= res!91493 (bvslt #b00000000000000000000000000000000 (size!4178 (_keys!5935 thiss!1248))))))

(declare-fun bm!19551 () Bool)

(assert (=> bm!19551 (= call!19556 call!19551)))

(declare-fun bm!19552 () Bool)

(assert (=> bm!19552 (= call!19557 (contains!1355 lt!96432 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193621 () Bool)

(declare-fun lt!96434 () Unit!5837)

(assert (=> b!193621 (= e!127375 lt!96434)))

(declare-fun lt!96437 () ListLongMap!2413)

(assert (=> b!193621 (= lt!96437 (getCurrentListMapNoExtraKeys!217 (_keys!5935 thiss!1248) (array!8190 (store (arr!3855 (_values!3928 thiss!1248)) (index!4875 lt!96279) (ValueCellFull!1895 v!309)) (size!4179 (_values!3928 thiss!1248))) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96441 () (_ BitVec 64))

(assert (=> b!193621 (= lt!96441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96448 () (_ BitVec 64))

(assert (=> b!193621 (= lt!96448 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96444 () Unit!5837)

(assert (=> b!193621 (= lt!96444 (addStillContains!162 lt!96437 lt!96441 (zeroValue!3786 thiss!1248) lt!96448))))

(assert (=> b!193621 (contains!1355 (+!315 lt!96437 (tuple2!3493 lt!96441 (zeroValue!3786 thiss!1248))) lt!96448)))

(declare-fun lt!96450 () Unit!5837)

(assert (=> b!193621 (= lt!96450 lt!96444)))

(declare-fun lt!96440 () ListLongMap!2413)

(assert (=> b!193621 (= lt!96440 (getCurrentListMapNoExtraKeys!217 (_keys!5935 thiss!1248) (array!8190 (store (arr!3855 (_values!3928 thiss!1248)) (index!4875 lt!96279) (ValueCellFull!1895 v!309)) (size!4179 (_values!3928 thiss!1248))) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96449 () (_ BitVec 64))

(assert (=> b!193621 (= lt!96449 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96439 () (_ BitVec 64))

(assert (=> b!193621 (= lt!96439 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96435 () Unit!5837)

(assert (=> b!193621 (= lt!96435 (addApplyDifferent!162 lt!96440 lt!96449 (minValue!3786 thiss!1248) lt!96439))))

(assert (=> b!193621 (= (apply!186 (+!315 lt!96440 (tuple2!3493 lt!96449 (minValue!3786 thiss!1248))) lt!96439) (apply!186 lt!96440 lt!96439))))

(declare-fun lt!96430 () Unit!5837)

(assert (=> b!193621 (= lt!96430 lt!96435)))

(declare-fun lt!96438 () ListLongMap!2413)

(assert (=> b!193621 (= lt!96438 (getCurrentListMapNoExtraKeys!217 (_keys!5935 thiss!1248) (array!8190 (store (arr!3855 (_values!3928 thiss!1248)) (index!4875 lt!96279) (ValueCellFull!1895 v!309)) (size!4179 (_values!3928 thiss!1248))) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96447 () (_ BitVec 64))

(assert (=> b!193621 (= lt!96447 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96451 () (_ BitVec 64))

(assert (=> b!193621 (= lt!96451 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96445 () Unit!5837)

(assert (=> b!193621 (= lt!96445 (addApplyDifferent!162 lt!96438 lt!96447 (zeroValue!3786 thiss!1248) lt!96451))))

(assert (=> b!193621 (= (apply!186 (+!315 lt!96438 (tuple2!3493 lt!96447 (zeroValue!3786 thiss!1248))) lt!96451) (apply!186 lt!96438 lt!96451))))

(declare-fun lt!96446 () Unit!5837)

(assert (=> b!193621 (= lt!96446 lt!96445)))

(declare-fun lt!96443 () ListLongMap!2413)

(assert (=> b!193621 (= lt!96443 (getCurrentListMapNoExtraKeys!217 (_keys!5935 thiss!1248) (array!8190 (store (arr!3855 (_values!3928 thiss!1248)) (index!4875 lt!96279) (ValueCellFull!1895 v!309)) (size!4179 (_values!3928 thiss!1248))) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(declare-fun lt!96431 () (_ BitVec 64))

(assert (=> b!193621 (= lt!96431 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96433 () (_ BitVec 64))

(assert (=> b!193621 (= lt!96433 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193621 (= lt!96434 (addApplyDifferent!162 lt!96443 lt!96431 (minValue!3786 thiss!1248) lt!96433))))

(assert (=> b!193621 (= (apply!186 (+!315 lt!96443 (tuple2!3493 lt!96431 (minValue!3786 thiss!1248))) lt!96433) (apply!186 lt!96443 lt!96433))))

(declare-fun bm!19553 () Bool)

(assert (=> bm!19553 (= call!19552 (contains!1355 lt!96432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193622 () Bool)

(assert (=> b!193622 (= e!127378 call!19553)))

(declare-fun b!193623 () Bool)

(assert (=> b!193623 (= e!127377 (validKeyInArray!0 (select (arr!3854 (_keys!5935 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19554 () Bool)

(assert (=> bm!19554 (= call!19554 (getCurrentListMapNoExtraKeys!217 (_keys!5935 thiss!1248) (array!8190 (store (arr!3855 (_values!3928 thiss!1248)) (index!4875 lt!96279) (ValueCellFull!1895 v!309)) (size!4179 (_values!3928 thiss!1248))) (mask!9196 thiss!1248) (extraKeys!3682 thiss!1248) (zeroValue!3786 thiss!1248) (minValue!3786 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3945 thiss!1248)))))

(assert (= (and d!56673 c!34927) b!193606))

(assert (= (and d!56673 (not c!34927)) b!193617))

(assert (= (and b!193617 c!34929) b!193618))

(assert (= (and b!193617 (not c!34929)) b!193619))

(assert (= (and b!193619 c!34930) b!193622))

(assert (= (and b!193619 (not c!34930)) b!193615))

(assert (= (or b!193622 b!193615) bm!19551))

(assert (= (or b!193618 bm!19551) bm!19548))

(assert (= (or b!193618 b!193622) bm!19549))

(assert (= (or b!193606 bm!19548) bm!19554))

(assert (= (or b!193606 bm!19549) bm!19550))

(assert (= (and d!56673 res!91494) b!193604))

(assert (= (and d!56673 c!34928) b!193621))

(assert (= (and d!56673 (not c!34928)) b!193613))

(assert (= (and d!56673 res!91487) b!193620))

(assert (= (and b!193620 res!91493) b!193623))

(assert (= (and b!193620 (not res!91488)) b!193603))

(assert (= (and b!193603 res!91491) b!193610))

(assert (= (and b!193620 res!91495) b!193616))

(assert (= (and b!193616 c!34932) b!193612))

(assert (= (and b!193616 (not c!34932)) b!193607))

(assert (= (and b!193612 res!91490) b!193609))

(assert (= (or b!193612 b!193607) bm!19553))

(assert (= (and b!193616 res!91492) b!193614))

(assert (= (and b!193614 c!34931) b!193605))

(assert (= (and b!193614 (not c!34931)) b!193608))

(assert (= (and b!193605 res!91489) b!193611))

(assert (= (or b!193605 b!193608) bm!19552))

(declare-fun b_lambda!7487 () Bool)

(assert (=> (not b_lambda!7487) (not b!193610)))

(assert (=> b!193610 t!7319))

(declare-fun b_and!11433 () Bool)

(assert (= b_and!11431 (and (=> t!7319 result!4919) b_and!11433)))

(declare-fun m!220505 () Bool)

(assert (=> bm!19552 m!220505))

(assert (=> d!56673 m!220301))

(declare-fun m!220507 () Bool)

(assert (=> bm!19553 m!220507))

(declare-fun m!220509 () Bool)

(assert (=> b!193606 m!220509))

(declare-fun m!220511 () Bool)

(assert (=> b!193611 m!220511))

(declare-fun m!220513 () Bool)

(assert (=> bm!19550 m!220513))

(declare-fun m!220515 () Bool)

(assert (=> bm!19554 m!220515))

(declare-fun m!220517 () Bool)

(assert (=> b!193609 m!220517))

(declare-fun m!220519 () Bool)

(assert (=> b!193621 m!220519))

(declare-fun m!220521 () Bool)

(assert (=> b!193621 m!220521))

(declare-fun m!220523 () Bool)

(assert (=> b!193621 m!220523))

(declare-fun m!220525 () Bool)

(assert (=> b!193621 m!220525))

(declare-fun m!220527 () Bool)

(assert (=> b!193621 m!220527))

(declare-fun m!220529 () Bool)

(assert (=> b!193621 m!220529))

(declare-fun m!220531 () Bool)

(assert (=> b!193621 m!220531))

(declare-fun m!220533 () Bool)

(assert (=> b!193621 m!220533))

(declare-fun m!220535 () Bool)

(assert (=> b!193621 m!220535))

(assert (=> b!193621 m!220523))

(declare-fun m!220537 () Bool)

(assert (=> b!193621 m!220537))

(declare-fun m!220539 () Bool)

(assert (=> b!193621 m!220539))

(declare-fun m!220541 () Bool)

(assert (=> b!193621 m!220541))

(assert (=> b!193621 m!220515))

(assert (=> b!193621 m!220519))

(declare-fun m!220543 () Bool)

(assert (=> b!193621 m!220543))

(assert (=> b!193621 m!220527))

(assert (=> b!193621 m!220399))

(declare-fun m!220545 () Bool)

(assert (=> b!193621 m!220545))

(assert (=> b!193621 m!220539))

(declare-fun m!220547 () Bool)

(assert (=> b!193621 m!220547))

(assert (=> b!193623 m!220399))

(assert (=> b!193623 m!220399))

(assert (=> b!193623 m!220407))

(declare-fun m!220549 () Bool)

(assert (=> b!193610 m!220549))

(assert (=> b!193610 m!220399))

(assert (=> b!193610 m!220549))

(assert (=> b!193610 m!220493))

(declare-fun m!220551 () Bool)

(assert (=> b!193610 m!220551))

(assert (=> b!193610 m!220399))

(declare-fun m!220553 () Bool)

(assert (=> b!193610 m!220553))

(assert (=> b!193610 m!220493))

(assert (=> b!193604 m!220399))

(assert (=> b!193604 m!220399))

(assert (=> b!193604 m!220407))

(assert (=> b!193603 m!220399))

(assert (=> b!193603 m!220399))

(declare-fun m!220555 () Bool)

(assert (=> b!193603 m!220555))

(assert (=> b!193351 d!56673))

(declare-fun d!56675 () Bool)

(declare-fun e!127386 () Bool)

(assert (=> d!56675 e!127386))

(declare-fun res!91500 () Bool)

(assert (=> d!56675 (=> (not res!91500) (not e!127386))))

(declare-fun lt!96460 () ListLongMap!2413)

(assert (=> d!56675 (= res!91500 (contains!1355 lt!96460 (_1!1757 (tuple2!3493 key!828 v!309))))))

(declare-fun lt!96463 () List!2400)

(assert (=> d!56675 (= lt!96460 (ListLongMap!2414 lt!96463))))

(declare-fun lt!96462 () Unit!5837)

(declare-fun lt!96461 () Unit!5837)

(assert (=> d!56675 (= lt!96462 lt!96461)))

(assert (=> d!56675 (= (getValueByKey!244 lt!96463 (_1!1757 (tuple2!3493 key!828 v!309))) (Some!249 (_2!1757 (tuple2!3493 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!131 (List!2400 (_ BitVec 64) V!5617) Unit!5837)

(assert (=> d!56675 (= lt!96461 (lemmaContainsTupThenGetReturnValue!131 lt!96463 (_1!1757 (tuple2!3493 key!828 v!309)) (_2!1757 (tuple2!3493 key!828 v!309))))))

(declare-fun insertStrictlySorted!134 (List!2400 (_ BitVec 64) V!5617) List!2400)

(assert (=> d!56675 (= lt!96463 (insertStrictlySorted!134 (toList!1222 lt!96280) (_1!1757 (tuple2!3493 key!828 v!309)) (_2!1757 (tuple2!3493 key!828 v!309))))))

(assert (=> d!56675 (= (+!315 lt!96280 (tuple2!3493 key!828 v!309)) lt!96460)))

(declare-fun b!193628 () Bool)

(declare-fun res!91501 () Bool)

(assert (=> b!193628 (=> (not res!91501) (not e!127386))))

(assert (=> b!193628 (= res!91501 (= (getValueByKey!244 (toList!1222 lt!96460) (_1!1757 (tuple2!3493 key!828 v!309))) (Some!249 (_2!1757 (tuple2!3493 key!828 v!309)))))))

(declare-fun b!193629 () Bool)

(declare-fun contains!1358 (List!2400 tuple2!3492) Bool)

(assert (=> b!193629 (= e!127386 (contains!1358 (toList!1222 lt!96460) (tuple2!3493 key!828 v!309)))))

(assert (= (and d!56675 res!91500) b!193628))

(assert (= (and b!193628 res!91501) b!193629))

(declare-fun m!220557 () Bool)

(assert (=> d!56675 m!220557))

(declare-fun m!220559 () Bool)

(assert (=> d!56675 m!220559))

(declare-fun m!220561 () Bool)

(assert (=> d!56675 m!220561))

(declare-fun m!220563 () Bool)

(assert (=> d!56675 m!220563))

(declare-fun m!220565 () Bool)

(assert (=> b!193628 m!220565))

(declare-fun m!220567 () Bool)

(assert (=> b!193629 m!220567))

(assert (=> b!193351 d!56675))

(declare-fun b!193636 () Bool)

(declare-fun e!127392 () Bool)

(assert (=> b!193636 (= e!127392 tp_is_empty!4477)))

(declare-fun condMapEmpty!7751 () Bool)

(declare-fun mapDefault!7751 () ValueCell!1895)

(assert (=> mapNonEmpty!7742 (= condMapEmpty!7751 (= mapRest!7742 ((as const (Array (_ BitVec 32) ValueCell!1895)) mapDefault!7751)))))

(declare-fun e!127391 () Bool)

(declare-fun mapRes!7751 () Bool)

(assert (=> mapNonEmpty!7742 (= tp!16978 (and e!127391 mapRes!7751))))

(declare-fun b!193637 () Bool)

(assert (=> b!193637 (= e!127391 tp_is_empty!4477)))

(declare-fun mapIsEmpty!7751 () Bool)

(assert (=> mapIsEmpty!7751 mapRes!7751))

(declare-fun mapNonEmpty!7751 () Bool)

(declare-fun tp!16994 () Bool)

(assert (=> mapNonEmpty!7751 (= mapRes!7751 (and tp!16994 e!127392))))

(declare-fun mapRest!7751 () (Array (_ BitVec 32) ValueCell!1895))

(declare-fun mapValue!7751 () ValueCell!1895)

(declare-fun mapKey!7751 () (_ BitVec 32))

(assert (=> mapNonEmpty!7751 (= mapRest!7742 (store mapRest!7751 mapKey!7751 mapValue!7751))))

(assert (= (and mapNonEmpty!7742 condMapEmpty!7751) mapIsEmpty!7751))

(assert (= (and mapNonEmpty!7742 (not condMapEmpty!7751)) mapNonEmpty!7751))

(assert (= (and mapNonEmpty!7751 ((_ is ValueCellFull!1895) mapValue!7751)) b!193636))

(assert (= (and mapNonEmpty!7742 ((_ is ValueCellFull!1895) mapDefault!7751)) b!193637))

(declare-fun m!220569 () Bool)

(assert (=> mapNonEmpty!7751 m!220569))

(declare-fun b_lambda!7489 () Bool)

(assert (= b_lambda!7485 (or (and b!193356 b_free!4705) b_lambda!7489)))

(declare-fun b_lambda!7491 () Bool)

(assert (= b_lambda!7487 (or (and b!193356 b_free!4705) b_lambda!7491)))

(check-sat (not b!193629) (not b!193603) (not b!193456) (not bm!19554) (not bm!19546) (not b!193523) (not d!56651) (not b!193628) (not bm!19543) (not b!193446) (not b!193585) (not b!193534) (not d!56673) (not b_lambda!7491) (not b!193455) (not b!193482) (not b!193611) (not b!193584) (not b!193577) (not bm!19552) (not b!193532) (not b!193522) (not b!193602) (not d!56671) (not bm!19553) (not b!193583) (not b!193578) (not d!56667) (not b!193610) (not b!193606) (not b!193580) (not bm!19523) (not b!193609) (not b!193597) (not b!193465) (not b!193454) (not bm!19522) (not bm!19526) b_and!11433 (not d!56661) (not bm!19517) (not b!193623) (not b!193466) (not b!193621) tp_is_empty!4477 (not b!193595) (not d!56659) (not b!193521) (not d!56675) (not bm!19545) (not bm!19547) (not d!56655) (not b_lambda!7489) (not b_next!4705) (not mapNonEmpty!7751) (not bm!19550) (not d!56669) (not b!193604))
(check-sat b_and!11433 (not b_next!4705))
