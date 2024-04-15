; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17752 () Bool)

(assert start!17752)

(declare-fun b!177268 () Bool)

(declare-fun b_free!4387 () Bool)

(declare-fun b_next!4387 () Bool)

(assert (=> b!177268 (= b_free!4387 (not b_next!4387))))

(declare-fun tp!15864 () Bool)

(declare-fun b_and!10863 () Bool)

(assert (=> b!177268 (= tp!15864 b_and!10863)))

(declare-fun tp_is_empty!4159 () Bool)

(declare-fun e!116895 () Bool)

(declare-fun e!116893 () Bool)

(declare-datatypes ((V!5193 0))(
  ( (V!5194 (val!2124 Int)) )
))
(declare-datatypes ((ValueCell!1736 0))(
  ( (ValueCellFull!1736 (v!3999 V!5193)) (EmptyCell!1736) )
))
(declare-datatypes ((array!7451 0))(
  ( (array!7452 (arr!3532 (Array (_ BitVec 32) (_ BitVec 64))) (size!3837 (_ BitVec 32))) )
))
(declare-datatypes ((array!7453 0))(
  ( (array!7454 (arr!3533 (Array (_ BitVec 32) ValueCell!1736)) (size!3838 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2380 0))(
  ( (LongMapFixedSize!2381 (defaultEntry!3654 Int) (mask!8593 (_ BitVec 32)) (extraKeys!3391 (_ BitVec 32)) (zeroValue!3495 V!5193) (minValue!3495 V!5193) (_size!1239 (_ BitVec 32)) (_keys!5521 array!7451) (_values!3637 array!7453) (_vacant!1239 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2380)

(declare-fun array_inv!2281 (array!7451) Bool)

(declare-fun array_inv!2282 (array!7453) Bool)

(assert (=> b!177268 (= e!116893 (and tp!15864 tp_is_empty!4159 (array_inv!2281 (_keys!5521 thiss!1248)) (array_inv!2282 (_values!3637 thiss!1248)) e!116895))))

(declare-fun b!177269 () Bool)

(declare-fun e!116898 () Bool)

(declare-fun mapRes!7104 () Bool)

(assert (=> b!177269 (= e!116895 (and e!116898 mapRes!7104))))

(declare-fun condMapEmpty!7104 () Bool)

(declare-fun mapDefault!7104 () ValueCell!1736)

(assert (=> b!177269 (= condMapEmpty!7104 (= (arr!3533 (_values!3637 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1736)) mapDefault!7104)))))

(declare-fun b!177270 () Bool)

(declare-fun res!83997 () Bool)

(declare-fun e!116896 () Bool)

(assert (=> b!177270 (=> (not res!83997) (not e!116896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177270 (= res!83997 (validMask!0 (mask!8593 thiss!1248)))))

(declare-fun b!177272 () Bool)

(declare-fun res!83996 () Bool)

(assert (=> b!177272 (=> (not res!83996) (not e!116896))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!177272 (= res!83996 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177273 () Bool)

(declare-fun res!83999 () Bool)

(assert (=> b!177273 (=> (not res!83999) (not e!116896))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!579 0))(
  ( (MissingZero!579 (index!4484 (_ BitVec 32))) (Found!579 (index!4485 (_ BitVec 32))) (Intermediate!579 (undefined!1391 Bool) (index!4486 (_ BitVec 32)) (x!19476 (_ BitVec 32))) (Undefined!579) (MissingVacant!579 (index!4487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7451 (_ BitVec 32)) SeekEntryResult!579)

(assert (=> b!177273 (= res!83999 ((_ is Undefined!579) (seekEntryOrOpen!0 key!828 (_keys!5521 thiss!1248) (mask!8593 thiss!1248))))))

(declare-fun b!177274 () Bool)

(declare-fun res!84000 () Bool)

(assert (=> b!177274 (=> (not res!84000) (not e!116896))))

(declare-datatypes ((tuple2!3290 0))(
  ( (tuple2!3291 (_1!1656 (_ BitVec 64)) (_2!1656 V!5193)) )
))
(declare-datatypes ((List!2257 0))(
  ( (Nil!2254) (Cons!2253 (h!2874 tuple2!3290) (t!7080 List!2257)) )
))
(declare-datatypes ((ListLongMap!2209 0))(
  ( (ListLongMap!2210 (toList!1120 List!2257)) )
))
(declare-fun contains!1191 (ListLongMap!2209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!756 (array!7451 array!7453 (_ BitVec 32) (_ BitVec 32) V!5193 V!5193 (_ BitVec 32) Int) ListLongMap!2209)

(assert (=> b!177274 (= res!84000 (not (contains!1191 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!7104 () Bool)

(assert (=> mapIsEmpty!7104 mapRes!7104))

(declare-fun b!177271 () Bool)

(assert (=> b!177271 (= e!116896 (not (= (size!3838 (_values!3637 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8593 thiss!1248)))))))

(declare-fun res!83998 () Bool)

(assert (=> start!17752 (=> (not res!83998) (not e!116896))))

(declare-fun valid!1014 (LongMapFixedSize!2380) Bool)

(assert (=> start!17752 (= res!83998 (valid!1014 thiss!1248))))

(assert (=> start!17752 e!116896))

(assert (=> start!17752 e!116893))

(assert (=> start!17752 true))

(declare-fun b!177275 () Bool)

(declare-fun e!116894 () Bool)

(assert (=> b!177275 (= e!116894 tp_is_empty!4159)))

(declare-fun b!177276 () Bool)

(assert (=> b!177276 (= e!116898 tp_is_empty!4159)))

(declare-fun mapNonEmpty!7104 () Bool)

(declare-fun tp!15863 () Bool)

(assert (=> mapNonEmpty!7104 (= mapRes!7104 (and tp!15863 e!116894))))

(declare-fun mapRest!7104 () (Array (_ BitVec 32) ValueCell!1736))

(declare-fun mapValue!7104 () ValueCell!1736)

(declare-fun mapKey!7104 () (_ BitVec 32))

(assert (=> mapNonEmpty!7104 (= (arr!3533 (_values!3637 thiss!1248)) (store mapRest!7104 mapKey!7104 mapValue!7104))))

(assert (= (and start!17752 res!83998) b!177272))

(assert (= (and b!177272 res!83996) b!177273))

(assert (= (and b!177273 res!83999) b!177274))

(assert (= (and b!177274 res!84000) b!177270))

(assert (= (and b!177270 res!83997) b!177271))

(assert (= (and b!177269 condMapEmpty!7104) mapIsEmpty!7104))

(assert (= (and b!177269 (not condMapEmpty!7104)) mapNonEmpty!7104))

(assert (= (and mapNonEmpty!7104 ((_ is ValueCellFull!1736) mapValue!7104)) b!177275))

(assert (= (and b!177269 ((_ is ValueCellFull!1736) mapDefault!7104)) b!177276))

(assert (= b!177268 b!177269))

(assert (= start!17752 b!177268))

(declare-fun m!205311 () Bool)

(assert (=> b!177273 m!205311))

(declare-fun m!205313 () Bool)

(assert (=> b!177270 m!205313))

(declare-fun m!205315 () Bool)

(assert (=> b!177274 m!205315))

(assert (=> b!177274 m!205315))

(declare-fun m!205317 () Bool)

(assert (=> b!177274 m!205317))

(declare-fun m!205319 () Bool)

(assert (=> b!177268 m!205319))

(declare-fun m!205321 () Bool)

(assert (=> b!177268 m!205321))

(declare-fun m!205323 () Bool)

(assert (=> mapNonEmpty!7104 m!205323))

(declare-fun m!205325 () Bool)

(assert (=> start!17752 m!205325))

(check-sat (not b!177273) tp_is_empty!4159 (not start!17752) (not b_next!4387) b_and!10863 (not b!177270) (not mapNonEmpty!7104) (not b!177268) (not b!177274))
(check-sat b_and!10863 (not b_next!4387))
(get-model)

(declare-fun d!53601 () Bool)

(assert (=> d!53601 (= (validMask!0 (mask!8593 thiss!1248)) (and (or (= (mask!8593 thiss!1248) #b00000000000000000000000000000111) (= (mask!8593 thiss!1248) #b00000000000000000000000000001111) (= (mask!8593 thiss!1248) #b00000000000000000000000000011111) (= (mask!8593 thiss!1248) #b00000000000000000000000000111111) (= (mask!8593 thiss!1248) #b00000000000000000000000001111111) (= (mask!8593 thiss!1248) #b00000000000000000000000011111111) (= (mask!8593 thiss!1248) #b00000000000000000000000111111111) (= (mask!8593 thiss!1248) #b00000000000000000000001111111111) (= (mask!8593 thiss!1248) #b00000000000000000000011111111111) (= (mask!8593 thiss!1248) #b00000000000000000000111111111111) (= (mask!8593 thiss!1248) #b00000000000000000001111111111111) (= (mask!8593 thiss!1248) #b00000000000000000011111111111111) (= (mask!8593 thiss!1248) #b00000000000000000111111111111111) (= (mask!8593 thiss!1248) #b00000000000000001111111111111111) (= (mask!8593 thiss!1248) #b00000000000000011111111111111111) (= (mask!8593 thiss!1248) #b00000000000000111111111111111111) (= (mask!8593 thiss!1248) #b00000000000001111111111111111111) (= (mask!8593 thiss!1248) #b00000000000011111111111111111111) (= (mask!8593 thiss!1248) #b00000000000111111111111111111111) (= (mask!8593 thiss!1248) #b00000000001111111111111111111111) (= (mask!8593 thiss!1248) #b00000000011111111111111111111111) (= (mask!8593 thiss!1248) #b00000000111111111111111111111111) (= (mask!8593 thiss!1248) #b00000001111111111111111111111111) (= (mask!8593 thiss!1248) #b00000011111111111111111111111111) (= (mask!8593 thiss!1248) #b00000111111111111111111111111111) (= (mask!8593 thiss!1248) #b00001111111111111111111111111111) (= (mask!8593 thiss!1248) #b00011111111111111111111111111111) (= (mask!8593 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8593 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!177270 d!53601))

(declare-fun d!53603 () Bool)

(declare-fun res!84037 () Bool)

(declare-fun e!116937 () Bool)

(assert (=> d!53603 (=> (not res!84037) (not e!116937))))

(declare-fun simpleValid!155 (LongMapFixedSize!2380) Bool)

(assert (=> d!53603 (= res!84037 (simpleValid!155 thiss!1248))))

(assert (=> d!53603 (= (valid!1014 thiss!1248) e!116937)))

(declare-fun b!177337 () Bool)

(declare-fun res!84038 () Bool)

(assert (=> b!177337 (=> (not res!84038) (not e!116937))))

(declare-fun arrayCountValidKeys!0 (array!7451 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177337 (= res!84038 (= (arrayCountValidKeys!0 (_keys!5521 thiss!1248) #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))) (_size!1239 thiss!1248)))))

(declare-fun b!177338 () Bool)

(declare-fun res!84039 () Bool)

(assert (=> b!177338 (=> (not res!84039) (not e!116937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7451 (_ BitVec 32)) Bool)

(assert (=> b!177338 (= res!84039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5521 thiss!1248) (mask!8593 thiss!1248)))))

(declare-fun b!177339 () Bool)

(declare-datatypes ((List!2258 0))(
  ( (Nil!2255) (Cons!2254 (h!2875 (_ BitVec 64)) (t!7083 List!2258)) )
))
(declare-fun arrayNoDuplicates!0 (array!7451 (_ BitVec 32) List!2258) Bool)

(assert (=> b!177339 (= e!116937 (arrayNoDuplicates!0 (_keys!5521 thiss!1248) #b00000000000000000000000000000000 Nil!2255))))

(assert (= (and d!53603 res!84037) b!177337))

(assert (= (and b!177337 res!84038) b!177338))

(assert (= (and b!177338 res!84039) b!177339))

(declare-fun m!205359 () Bool)

(assert (=> d!53603 m!205359))

(declare-fun m!205361 () Bool)

(assert (=> b!177337 m!205361))

(declare-fun m!205363 () Bool)

(assert (=> b!177338 m!205363))

(declare-fun m!205365 () Bool)

(assert (=> b!177339 m!205365))

(assert (=> start!17752 d!53603))

(declare-fun d!53605 () Bool)

(assert (=> d!53605 (= (array_inv!2281 (_keys!5521 thiss!1248)) (bvsge (size!3837 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177268 d!53605))

(declare-fun d!53607 () Bool)

(assert (=> d!53607 (= (array_inv!2282 (_values!3637 thiss!1248)) (bvsge (size!3838 (_values!3637 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177268 d!53607))

(declare-fun b!177352 () Bool)

(declare-fun e!116944 () SeekEntryResult!579)

(assert (=> b!177352 (= e!116944 Undefined!579)))

(declare-fun b!177353 () Bool)

(declare-fun e!116946 () SeekEntryResult!579)

(declare-fun lt!87500 () SeekEntryResult!579)

(assert (=> b!177353 (= e!116946 (MissingZero!579 (index!4486 lt!87500)))))

(declare-fun d!53609 () Bool)

(declare-fun lt!87499 () SeekEntryResult!579)

(assert (=> d!53609 (and (or ((_ is Undefined!579) lt!87499) (not ((_ is Found!579) lt!87499)) (and (bvsge (index!4485 lt!87499) #b00000000000000000000000000000000) (bvslt (index!4485 lt!87499) (size!3837 (_keys!5521 thiss!1248))))) (or ((_ is Undefined!579) lt!87499) ((_ is Found!579) lt!87499) (not ((_ is MissingZero!579) lt!87499)) (and (bvsge (index!4484 lt!87499) #b00000000000000000000000000000000) (bvslt (index!4484 lt!87499) (size!3837 (_keys!5521 thiss!1248))))) (or ((_ is Undefined!579) lt!87499) ((_ is Found!579) lt!87499) ((_ is MissingZero!579) lt!87499) (not ((_ is MissingVacant!579) lt!87499)) (and (bvsge (index!4487 lt!87499) #b00000000000000000000000000000000) (bvslt (index!4487 lt!87499) (size!3837 (_keys!5521 thiss!1248))))) (or ((_ is Undefined!579) lt!87499) (ite ((_ is Found!579) lt!87499) (= (select (arr!3532 (_keys!5521 thiss!1248)) (index!4485 lt!87499)) key!828) (ite ((_ is MissingZero!579) lt!87499) (= (select (arr!3532 (_keys!5521 thiss!1248)) (index!4484 lt!87499)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!579) lt!87499) (= (select (arr!3532 (_keys!5521 thiss!1248)) (index!4487 lt!87499)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53609 (= lt!87499 e!116944)))

(declare-fun c!31743 () Bool)

(assert (=> d!53609 (= c!31743 (and ((_ is Intermediate!579) lt!87500) (undefined!1391 lt!87500)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7451 (_ BitVec 32)) SeekEntryResult!579)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53609 (= lt!87500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8593 thiss!1248)) key!828 (_keys!5521 thiss!1248) (mask!8593 thiss!1248)))))

(assert (=> d!53609 (validMask!0 (mask!8593 thiss!1248))))

(assert (=> d!53609 (= (seekEntryOrOpen!0 key!828 (_keys!5521 thiss!1248) (mask!8593 thiss!1248)) lt!87499)))

(declare-fun b!177354 () Bool)

(declare-fun c!31745 () Bool)

(declare-fun lt!87498 () (_ BitVec 64))

(assert (=> b!177354 (= c!31745 (= lt!87498 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116945 () SeekEntryResult!579)

(assert (=> b!177354 (= e!116945 e!116946)))

(declare-fun b!177355 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7451 (_ BitVec 32)) SeekEntryResult!579)

(assert (=> b!177355 (= e!116946 (seekKeyOrZeroReturnVacant!0 (x!19476 lt!87500) (index!4486 lt!87500) (index!4486 lt!87500) key!828 (_keys!5521 thiss!1248) (mask!8593 thiss!1248)))))

(declare-fun b!177356 () Bool)

(assert (=> b!177356 (= e!116945 (Found!579 (index!4486 lt!87500)))))

(declare-fun b!177357 () Bool)

(assert (=> b!177357 (= e!116944 e!116945)))

(assert (=> b!177357 (= lt!87498 (select (arr!3532 (_keys!5521 thiss!1248)) (index!4486 lt!87500)))))

(declare-fun c!31744 () Bool)

(assert (=> b!177357 (= c!31744 (= lt!87498 key!828))))

(assert (= (and d!53609 c!31743) b!177352))

(assert (= (and d!53609 (not c!31743)) b!177357))

(assert (= (and b!177357 c!31744) b!177356))

(assert (= (and b!177357 (not c!31744)) b!177354))

(assert (= (and b!177354 c!31745) b!177353))

(assert (= (and b!177354 (not c!31745)) b!177355))

(declare-fun m!205367 () Bool)

(assert (=> d!53609 m!205367))

(declare-fun m!205369 () Bool)

(assert (=> d!53609 m!205369))

(assert (=> d!53609 m!205367))

(assert (=> d!53609 m!205313))

(declare-fun m!205371 () Bool)

(assert (=> d!53609 m!205371))

(declare-fun m!205373 () Bool)

(assert (=> d!53609 m!205373))

(declare-fun m!205375 () Bool)

(assert (=> d!53609 m!205375))

(declare-fun m!205377 () Bool)

(assert (=> b!177355 m!205377))

(declare-fun m!205379 () Bool)

(assert (=> b!177357 m!205379))

(assert (=> b!177273 d!53609))

(declare-fun d!53611 () Bool)

(declare-fun e!116951 () Bool)

(assert (=> d!53611 e!116951))

(declare-fun res!84042 () Bool)

(assert (=> d!53611 (=> res!84042 e!116951)))

(declare-fun lt!87512 () Bool)

(assert (=> d!53611 (= res!84042 (not lt!87512))))

(declare-fun lt!87510 () Bool)

(assert (=> d!53611 (= lt!87512 lt!87510)))

(declare-datatypes ((Unit!5397 0))(
  ( (Unit!5398) )
))
(declare-fun lt!87509 () Unit!5397)

(declare-fun e!116952 () Unit!5397)

(assert (=> d!53611 (= lt!87509 e!116952)))

(declare-fun c!31748 () Bool)

(assert (=> d!53611 (= c!31748 lt!87510)))

(declare-fun containsKey!198 (List!2257 (_ BitVec 64)) Bool)

(assert (=> d!53611 (= lt!87510 (containsKey!198 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(assert (=> d!53611 (= (contains!1191 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)) key!828) lt!87512)))

(declare-fun b!177364 () Bool)

(declare-fun lt!87511 () Unit!5397)

(assert (=> b!177364 (= e!116952 lt!87511)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!147 (List!2257 (_ BitVec 64)) Unit!5397)

(assert (=> b!177364 (= lt!87511 (lemmaContainsKeyImpliesGetValueByKeyDefined!147 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(declare-datatypes ((Option!200 0))(
  ( (Some!199 (v!4002 V!5193)) (None!198) )
))
(declare-fun isDefined!148 (Option!200) Bool)

(declare-fun getValueByKey!194 (List!2257 (_ BitVec 64)) Option!200)

(assert (=> b!177364 (isDefined!148 (getValueByKey!194 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(declare-fun b!177365 () Bool)

(declare-fun Unit!5399 () Unit!5397)

(assert (=> b!177365 (= e!116952 Unit!5399)))

(declare-fun b!177366 () Bool)

(assert (=> b!177366 (= e!116951 (isDefined!148 (getValueByKey!194 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828)))))

(assert (= (and d!53611 c!31748) b!177364))

(assert (= (and d!53611 (not c!31748)) b!177365))

(assert (= (and d!53611 (not res!84042)) b!177366))

(declare-fun m!205381 () Bool)

(assert (=> d!53611 m!205381))

(declare-fun m!205383 () Bool)

(assert (=> b!177364 m!205383))

(declare-fun m!205385 () Bool)

(assert (=> b!177364 m!205385))

(assert (=> b!177364 m!205385))

(declare-fun m!205387 () Bool)

(assert (=> b!177364 m!205387))

(assert (=> b!177366 m!205385))

(assert (=> b!177366 m!205385))

(assert (=> b!177366 m!205387))

(assert (=> b!177274 d!53611))

(declare-fun d!53613 () Bool)

(declare-fun e!116989 () Bool)

(assert (=> d!53613 e!116989))

(declare-fun res!84061 () Bool)

(assert (=> d!53613 (=> (not res!84061) (not e!116989))))

(assert (=> d!53613 (= res!84061 (or (bvsge #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))))

(declare-fun lt!87559 () ListLongMap!2209)

(declare-fun lt!87563 () ListLongMap!2209)

(assert (=> d!53613 (= lt!87559 lt!87563)))

(declare-fun lt!87557 () Unit!5397)

(declare-fun e!116982 () Unit!5397)

(assert (=> d!53613 (= lt!87557 e!116982)))

(declare-fun c!31761 () Bool)

(declare-fun e!116981 () Bool)

(assert (=> d!53613 (= c!31761 e!116981)))

(declare-fun res!84069 () Bool)

(assert (=> d!53613 (=> (not res!84069) (not e!116981))))

(assert (=> d!53613 (= res!84069 (bvslt #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(declare-fun e!116986 () ListLongMap!2209)

(assert (=> d!53613 (= lt!87563 e!116986)))

(declare-fun c!31765 () Bool)

(assert (=> d!53613 (= c!31765 (and (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53613 (validMask!0 (mask!8593 thiss!1248))))

(assert (=> d!53613 (= (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)) lt!87559)))

(declare-fun bm!17932 () Bool)

(declare-fun call!17937 () ListLongMap!2209)

(declare-fun getCurrentListMapNoExtraKeys!162 (array!7451 array!7453 (_ BitVec 32) (_ BitVec 32) V!5193 V!5193 (_ BitVec 32) Int) ListLongMap!2209)

(assert (=> bm!17932 (= call!17937 (getCurrentListMapNoExtraKeys!162 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))

(declare-fun b!177409 () Bool)

(declare-fun e!116985 () ListLongMap!2209)

(declare-fun call!17935 () ListLongMap!2209)

(assert (=> b!177409 (= e!116985 call!17935)))

(declare-fun b!177410 () Bool)

(declare-fun e!116984 () Bool)

(declare-fun e!116990 () Bool)

(assert (=> b!177410 (= e!116984 e!116990)))

(declare-fun res!84067 () Bool)

(assert (=> b!177410 (=> (not res!84067) (not e!116990))))

(assert (=> b!177410 (= res!84067 (contains!1191 lt!87559 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177410 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(declare-fun b!177411 () Bool)

(declare-fun e!116988 () ListLongMap!2209)

(declare-fun call!17936 () ListLongMap!2209)

(assert (=> b!177411 (= e!116988 call!17936)))

(declare-fun b!177412 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!177412 (= e!116981 (validKeyInArray!0 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17933 () Bool)

(declare-fun call!17938 () Bool)

(assert (=> bm!17933 (= call!17938 (contains!1191 lt!87559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177413 () Bool)

(assert (=> b!177413 (= e!116985 call!17936)))

(declare-fun b!177414 () Bool)

(declare-fun e!116983 () Bool)

(assert (=> b!177414 (= e!116983 (validKeyInArray!0 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177415 () Bool)

(declare-fun lt!87565 () Unit!5397)

(assert (=> b!177415 (= e!116982 lt!87565)))

(declare-fun lt!87558 () ListLongMap!2209)

(assert (=> b!177415 (= lt!87558 (getCurrentListMapNoExtraKeys!162 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))

(declare-fun lt!87560 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87560 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87566 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87566 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87569 () Unit!5397)

(declare-fun addStillContains!117 (ListLongMap!2209 (_ BitVec 64) V!5193 (_ BitVec 64)) Unit!5397)

(assert (=> b!177415 (= lt!87569 (addStillContains!117 lt!87558 lt!87560 (zeroValue!3495 thiss!1248) lt!87566))))

(declare-fun +!253 (ListLongMap!2209 tuple2!3290) ListLongMap!2209)

(assert (=> b!177415 (contains!1191 (+!253 lt!87558 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248))) lt!87566)))

(declare-fun lt!87574 () Unit!5397)

(assert (=> b!177415 (= lt!87574 lt!87569)))

(declare-fun lt!87562 () ListLongMap!2209)

(assert (=> b!177415 (= lt!87562 (getCurrentListMapNoExtraKeys!162 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))

(declare-fun lt!87573 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87573 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87571 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87571 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87570 () Unit!5397)

(declare-fun addApplyDifferent!117 (ListLongMap!2209 (_ BitVec 64) V!5193 (_ BitVec 64)) Unit!5397)

(assert (=> b!177415 (= lt!87570 (addApplyDifferent!117 lt!87562 lt!87573 (minValue!3495 thiss!1248) lt!87571))))

(declare-fun apply!141 (ListLongMap!2209 (_ BitVec 64)) V!5193)

(assert (=> b!177415 (= (apply!141 (+!253 lt!87562 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248))) lt!87571) (apply!141 lt!87562 lt!87571))))

(declare-fun lt!87572 () Unit!5397)

(assert (=> b!177415 (= lt!87572 lt!87570)))

(declare-fun lt!87561 () ListLongMap!2209)

(assert (=> b!177415 (= lt!87561 (getCurrentListMapNoExtraKeys!162 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))

(declare-fun lt!87577 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87577 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87564 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87564 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87575 () Unit!5397)

(assert (=> b!177415 (= lt!87575 (addApplyDifferent!117 lt!87561 lt!87577 (zeroValue!3495 thiss!1248) lt!87564))))

(assert (=> b!177415 (= (apply!141 (+!253 lt!87561 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248))) lt!87564) (apply!141 lt!87561 lt!87564))))

(declare-fun lt!87576 () Unit!5397)

(assert (=> b!177415 (= lt!87576 lt!87575)))

(declare-fun lt!87567 () ListLongMap!2209)

(assert (=> b!177415 (= lt!87567 (getCurrentListMapNoExtraKeys!162 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))

(declare-fun lt!87578 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87578 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87568 () (_ BitVec 64))

(assert (=> b!177415 (= lt!87568 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177415 (= lt!87565 (addApplyDifferent!117 lt!87567 lt!87578 (minValue!3495 thiss!1248) lt!87568))))

(assert (=> b!177415 (= (apply!141 (+!253 lt!87567 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248))) lt!87568) (apply!141 lt!87567 lt!87568))))

(declare-fun b!177416 () Bool)

(declare-fun e!116987 () Bool)

(assert (=> b!177416 (= e!116987 (not call!17938))))

(declare-fun b!177417 () Bool)

(declare-fun e!116991 () Bool)

(assert (=> b!177417 (= e!116991 (= (apply!141 lt!87559 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3495 thiss!1248)))))

(declare-fun b!177418 () Bool)

(declare-fun e!116980 () Bool)

(declare-fun e!116979 () Bool)

(assert (=> b!177418 (= e!116980 e!116979)))

(declare-fun res!84064 () Bool)

(declare-fun call!17941 () Bool)

(assert (=> b!177418 (= res!84064 call!17941)))

(assert (=> b!177418 (=> (not res!84064) (not e!116979))))

(declare-fun b!177419 () Bool)

(declare-fun get!2014 (ValueCell!1736 V!5193) V!5193)

(declare-fun dynLambda!475 (Int (_ BitVec 64)) V!5193)

(assert (=> b!177419 (= e!116990 (= (apply!141 lt!87559 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)) (get!2014 (select (arr!3533 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3838 (_values!3637 thiss!1248))))))

(assert (=> b!177419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(declare-fun bm!17934 () Bool)

(declare-fun call!17939 () ListLongMap!2209)

(declare-fun c!31766 () Bool)

(declare-fun call!17940 () ListLongMap!2209)

(assert (=> bm!17934 (= call!17940 (+!253 (ite c!31765 call!17937 (ite c!31766 call!17939 call!17935)) (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(declare-fun b!177420 () Bool)

(declare-fun res!84065 () Bool)

(assert (=> b!177420 (=> (not res!84065) (not e!116989))))

(assert (=> b!177420 (= res!84065 e!116984)))

(declare-fun res!84066 () Bool)

(assert (=> b!177420 (=> res!84066 e!116984)))

(assert (=> b!177420 (= res!84066 (not e!116983))))

(declare-fun res!84068 () Bool)

(assert (=> b!177420 (=> (not res!84068) (not e!116983))))

(assert (=> b!177420 (= res!84068 (bvslt #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(declare-fun b!177421 () Bool)

(assert (=> b!177421 (= e!116989 e!116980)))

(declare-fun c!31762 () Bool)

(assert (=> b!177421 (= c!31762 (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177422 () Bool)

(assert (=> b!177422 (= e!116980 (not call!17941))))

(declare-fun bm!17935 () Bool)

(assert (=> bm!17935 (= call!17941 (contains!1191 lt!87559 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177423 () Bool)

(assert (=> b!177423 (= e!116987 e!116991)))

(declare-fun res!84063 () Bool)

(assert (=> b!177423 (= res!84063 call!17938)))

(assert (=> b!177423 (=> (not res!84063) (not e!116991))))

(declare-fun b!177424 () Bool)

(assert (=> b!177424 (= e!116986 e!116988)))

(assert (=> b!177424 (= c!31766 (and (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177425 () Bool)

(assert (=> b!177425 (= e!116979 (= (apply!141 lt!87559 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3495 thiss!1248)))))

(declare-fun bm!17936 () Bool)

(assert (=> bm!17936 (= call!17936 call!17940)))

(declare-fun b!177426 () Bool)

(assert (=> b!177426 (= e!116986 (+!253 call!17940 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))

(declare-fun bm!17937 () Bool)

(assert (=> bm!17937 (= call!17935 call!17939)))

(declare-fun b!177427 () Bool)

(declare-fun Unit!5400 () Unit!5397)

(assert (=> b!177427 (= e!116982 Unit!5400)))

(declare-fun b!177428 () Bool)

(declare-fun c!31764 () Bool)

(assert (=> b!177428 (= c!31764 (and (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!177428 (= e!116988 e!116985)))

(declare-fun b!177429 () Bool)

(declare-fun res!84062 () Bool)

(assert (=> b!177429 (=> (not res!84062) (not e!116989))))

(assert (=> b!177429 (= res!84062 e!116987)))

(declare-fun c!31763 () Bool)

(assert (=> b!177429 (= c!31763 (not (= (bvand (extraKeys!3391 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!17938 () Bool)

(assert (=> bm!17938 (= call!17939 call!17937)))

(assert (= (and d!53613 c!31765) b!177426))

(assert (= (and d!53613 (not c!31765)) b!177424))

(assert (= (and b!177424 c!31766) b!177411))

(assert (= (and b!177424 (not c!31766)) b!177428))

(assert (= (and b!177428 c!31764) b!177413))

(assert (= (and b!177428 (not c!31764)) b!177409))

(assert (= (or b!177413 b!177409) bm!17937))

(assert (= (or b!177411 bm!17937) bm!17938))

(assert (= (or b!177411 b!177413) bm!17936))

(assert (= (or b!177426 bm!17938) bm!17932))

(assert (= (or b!177426 bm!17936) bm!17934))

(assert (= (and d!53613 res!84069) b!177412))

(assert (= (and d!53613 c!31761) b!177415))

(assert (= (and d!53613 (not c!31761)) b!177427))

(assert (= (and d!53613 res!84061) b!177420))

(assert (= (and b!177420 res!84068) b!177414))

(assert (= (and b!177420 (not res!84066)) b!177410))

(assert (= (and b!177410 res!84067) b!177419))

(assert (= (and b!177420 res!84065) b!177429))

(assert (= (and b!177429 c!31763) b!177423))

(assert (= (and b!177429 (not c!31763)) b!177416))

(assert (= (and b!177423 res!84063) b!177417))

(assert (= (or b!177423 b!177416) bm!17933))

(assert (= (and b!177429 res!84062) b!177421))

(assert (= (and b!177421 c!31762) b!177418))

(assert (= (and b!177421 (not c!31762)) b!177422))

(assert (= (and b!177418 res!84064) b!177425))

(assert (= (or b!177418 b!177422) bm!17935))

(declare-fun b_lambda!7037 () Bool)

(assert (=> (not b_lambda!7037) (not b!177419)))

(declare-fun t!7082 () Bool)

(declare-fun tb!2785 () Bool)

(assert (=> (and b!177268 (= (defaultEntry!3654 thiss!1248) (defaultEntry!3654 thiss!1248)) t!7082) tb!2785))

(declare-fun result!4645 () Bool)

(assert (=> tb!2785 (= result!4645 tp_is_empty!4159)))

(assert (=> b!177419 t!7082))

(declare-fun b_and!10869 () Bool)

(assert (= b_and!10863 (and (=> t!7082 result!4645) b_and!10869)))

(assert (=> d!53613 m!205313))

(declare-fun m!205389 () Bool)

(assert (=> b!177426 m!205389))

(declare-fun m!205391 () Bool)

(assert (=> b!177425 m!205391))

(declare-fun m!205393 () Bool)

(assert (=> b!177410 m!205393))

(assert (=> b!177410 m!205393))

(declare-fun m!205395 () Bool)

(assert (=> b!177410 m!205395))

(assert (=> b!177412 m!205393))

(assert (=> b!177412 m!205393))

(declare-fun m!205397 () Bool)

(assert (=> b!177412 m!205397))

(assert (=> b!177414 m!205393))

(assert (=> b!177414 m!205393))

(assert (=> b!177414 m!205397))

(declare-fun m!205399 () Bool)

(assert (=> bm!17933 m!205399))

(declare-fun m!205401 () Bool)

(assert (=> bm!17935 m!205401))

(declare-fun m!205403 () Bool)

(assert (=> b!177419 m!205403))

(declare-fun m!205405 () Bool)

(assert (=> b!177419 m!205405))

(assert (=> b!177419 m!205393))

(assert (=> b!177419 m!205403))

(assert (=> b!177419 m!205405))

(declare-fun m!205407 () Bool)

(assert (=> b!177419 m!205407))

(assert (=> b!177419 m!205393))

(declare-fun m!205409 () Bool)

(assert (=> b!177419 m!205409))

(declare-fun m!205411 () Bool)

(assert (=> b!177415 m!205411))

(declare-fun m!205413 () Bool)

(assert (=> b!177415 m!205413))

(declare-fun m!205415 () Bool)

(assert (=> b!177415 m!205415))

(declare-fun m!205417 () Bool)

(assert (=> b!177415 m!205417))

(declare-fun m!205419 () Bool)

(assert (=> b!177415 m!205419))

(assert (=> b!177415 m!205417))

(declare-fun m!205421 () Bool)

(assert (=> b!177415 m!205421))

(declare-fun m!205423 () Bool)

(assert (=> b!177415 m!205423))

(declare-fun m!205425 () Bool)

(assert (=> b!177415 m!205425))

(assert (=> b!177415 m!205419))

(declare-fun m!205427 () Bool)

(assert (=> b!177415 m!205427))

(assert (=> b!177415 m!205393))

(declare-fun m!205429 () Bool)

(assert (=> b!177415 m!205429))

(declare-fun m!205431 () Bool)

(assert (=> b!177415 m!205431))

(declare-fun m!205433 () Bool)

(assert (=> b!177415 m!205433))

(declare-fun m!205435 () Bool)

(assert (=> b!177415 m!205435))

(declare-fun m!205437 () Bool)

(assert (=> b!177415 m!205437))

(assert (=> b!177415 m!205423))

(assert (=> b!177415 m!205413))

(declare-fun m!205439 () Bool)

(assert (=> b!177415 m!205439))

(declare-fun m!205441 () Bool)

(assert (=> b!177415 m!205441))

(assert (=> bm!17932 m!205431))

(declare-fun m!205443 () Bool)

(assert (=> bm!17934 m!205443))

(declare-fun m!205445 () Bool)

(assert (=> b!177417 m!205445))

(assert (=> b!177274 d!53613))

(declare-fun b!177438 () Bool)

(declare-fun e!116996 () Bool)

(assert (=> b!177438 (= e!116996 tp_is_empty!4159)))

(declare-fun b!177439 () Bool)

(declare-fun e!116997 () Bool)

(assert (=> b!177439 (= e!116997 tp_is_empty!4159)))

(declare-fun mapNonEmpty!7113 () Bool)

(declare-fun mapRes!7113 () Bool)

(declare-fun tp!15879 () Bool)

(assert (=> mapNonEmpty!7113 (= mapRes!7113 (and tp!15879 e!116996))))

(declare-fun mapKey!7113 () (_ BitVec 32))

(declare-fun mapRest!7113 () (Array (_ BitVec 32) ValueCell!1736))

(declare-fun mapValue!7113 () ValueCell!1736)

(assert (=> mapNonEmpty!7113 (= mapRest!7104 (store mapRest!7113 mapKey!7113 mapValue!7113))))

(declare-fun condMapEmpty!7113 () Bool)

(declare-fun mapDefault!7113 () ValueCell!1736)

(assert (=> mapNonEmpty!7104 (= condMapEmpty!7113 (= mapRest!7104 ((as const (Array (_ BitVec 32) ValueCell!1736)) mapDefault!7113)))))

(assert (=> mapNonEmpty!7104 (= tp!15863 (and e!116997 mapRes!7113))))

(declare-fun mapIsEmpty!7113 () Bool)

(assert (=> mapIsEmpty!7113 mapRes!7113))

(assert (= (and mapNonEmpty!7104 condMapEmpty!7113) mapIsEmpty!7113))

(assert (= (and mapNonEmpty!7104 (not condMapEmpty!7113)) mapNonEmpty!7113))

(assert (= (and mapNonEmpty!7113 ((_ is ValueCellFull!1736) mapValue!7113)) b!177438))

(assert (= (and mapNonEmpty!7104 ((_ is ValueCellFull!1736) mapDefault!7113)) b!177439))

(declare-fun m!205447 () Bool)

(assert (=> mapNonEmpty!7113 m!205447))

(declare-fun b_lambda!7039 () Bool)

(assert (= b_lambda!7037 (or (and b!177268 b_free!4387) b_lambda!7039)))

(check-sat (not b!177338) (not b!177364) (not b!177415) (not b!177355) (not bm!17933) (not bm!17934) (not b_lambda!7039) (not bm!17932) (not b!177412) (not d!53613) tp_is_empty!4159 (not bm!17935) (not b!177425) (not b!177426) (not b_next!4387) (not mapNonEmpty!7113) (not d!53611) (not b!177410) (not d!53603) (not b!177337) (not b!177417) (not d!53609) (not b!177419) (not b!177366) (not b!177339) b_and!10869 (not b!177414))
(check-sat b_and!10869 (not b_next!4387))
(get-model)

(declare-fun b!177448 () Bool)

(declare-fun e!117002 () (_ BitVec 32))

(declare-fun call!17944 () (_ BitVec 32))

(assert (=> b!177448 (= e!117002 call!17944)))

(declare-fun bm!17941 () Bool)

(assert (=> bm!17941 (= call!17944 (arrayCountValidKeys!0 (_keys!5521 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3837 (_keys!5521 thiss!1248))))))

(declare-fun b!177449 () Bool)

(declare-fun e!117003 () (_ BitVec 32))

(assert (=> b!177449 (= e!117003 #b00000000000000000000000000000000)))

(declare-fun d!53615 () Bool)

(declare-fun lt!87581 () (_ BitVec 32))

(assert (=> d!53615 (and (bvsge lt!87581 #b00000000000000000000000000000000) (bvsle lt!87581 (bvsub (size!3837 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53615 (= lt!87581 e!117003)))

(declare-fun c!31771 () Bool)

(assert (=> d!53615 (= c!31771 (bvsge #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(assert (=> d!53615 (and (bvsle #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3837 (_keys!5521 thiss!1248)) (size!3837 (_keys!5521 thiss!1248))))))

(assert (=> d!53615 (= (arrayCountValidKeys!0 (_keys!5521 thiss!1248) #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))) lt!87581)))

(declare-fun b!177450 () Bool)

(assert (=> b!177450 (= e!117002 (bvadd #b00000000000000000000000000000001 call!17944))))

(declare-fun b!177451 () Bool)

(assert (=> b!177451 (= e!117003 e!117002)))

(declare-fun c!31772 () Bool)

(assert (=> b!177451 (= c!31772 (validKeyInArray!0 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53615 c!31771) b!177449))

(assert (= (and d!53615 (not c!31771)) b!177451))

(assert (= (and b!177451 c!31772) b!177450))

(assert (= (and b!177451 (not c!31772)) b!177448))

(assert (= (or b!177450 b!177448) bm!17941))

(declare-fun m!205449 () Bool)

(assert (=> bm!17941 m!205449))

(assert (=> b!177451 m!205393))

(assert (=> b!177451 m!205393))

(assert (=> b!177451 m!205397))

(assert (=> b!177337 d!53615))

(declare-fun d!53617 () Bool)

(declare-fun get!2015 (Option!200) V!5193)

(assert (=> d!53617 (= (apply!141 (+!253 lt!87561 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248))) lt!87564) (get!2015 (getValueByKey!194 (toList!1120 (+!253 lt!87561 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248)))) lt!87564)))))

(declare-fun bs!7268 () Bool)

(assert (= bs!7268 d!53617))

(declare-fun m!205451 () Bool)

(assert (=> bs!7268 m!205451))

(assert (=> bs!7268 m!205451))

(declare-fun m!205453 () Bool)

(assert (=> bs!7268 m!205453))

(assert (=> b!177415 d!53617))

(declare-fun d!53619 () Bool)

(declare-fun e!117004 () Bool)

(assert (=> d!53619 e!117004))

(declare-fun res!84070 () Bool)

(assert (=> d!53619 (=> res!84070 e!117004)))

(declare-fun lt!87585 () Bool)

(assert (=> d!53619 (= res!84070 (not lt!87585))))

(declare-fun lt!87583 () Bool)

(assert (=> d!53619 (= lt!87585 lt!87583)))

(declare-fun lt!87582 () Unit!5397)

(declare-fun e!117005 () Unit!5397)

(assert (=> d!53619 (= lt!87582 e!117005)))

(declare-fun c!31773 () Bool)

(assert (=> d!53619 (= c!31773 lt!87583)))

(assert (=> d!53619 (= lt!87583 (containsKey!198 (toList!1120 (+!253 lt!87558 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248)))) lt!87566))))

(assert (=> d!53619 (= (contains!1191 (+!253 lt!87558 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248))) lt!87566) lt!87585)))

(declare-fun b!177452 () Bool)

(declare-fun lt!87584 () Unit!5397)

(assert (=> b!177452 (= e!117005 lt!87584)))

(assert (=> b!177452 (= lt!87584 (lemmaContainsKeyImpliesGetValueByKeyDefined!147 (toList!1120 (+!253 lt!87558 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248)))) lt!87566))))

(assert (=> b!177452 (isDefined!148 (getValueByKey!194 (toList!1120 (+!253 lt!87558 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248)))) lt!87566))))

(declare-fun b!177453 () Bool)

(declare-fun Unit!5401 () Unit!5397)

(assert (=> b!177453 (= e!117005 Unit!5401)))

(declare-fun b!177454 () Bool)

(assert (=> b!177454 (= e!117004 (isDefined!148 (getValueByKey!194 (toList!1120 (+!253 lt!87558 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248)))) lt!87566)))))

(assert (= (and d!53619 c!31773) b!177452))

(assert (= (and d!53619 (not c!31773)) b!177453))

(assert (= (and d!53619 (not res!84070)) b!177454))

(declare-fun m!205455 () Bool)

(assert (=> d!53619 m!205455))

(declare-fun m!205457 () Bool)

(assert (=> b!177452 m!205457))

(declare-fun m!205459 () Bool)

(assert (=> b!177452 m!205459))

(assert (=> b!177452 m!205459))

(declare-fun m!205461 () Bool)

(assert (=> b!177452 m!205461))

(assert (=> b!177454 m!205459))

(assert (=> b!177454 m!205459))

(assert (=> b!177454 m!205461))

(assert (=> b!177415 d!53619))

(declare-fun d!53621 () Bool)

(declare-fun e!117024 () Bool)

(assert (=> d!53621 e!117024))

(declare-fun res!84081 () Bool)

(assert (=> d!53621 (=> (not res!84081) (not e!117024))))

(declare-fun lt!87604 () ListLongMap!2209)

(assert (=> d!53621 (= res!84081 (not (contains!1191 lt!87604 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!117025 () ListLongMap!2209)

(assert (=> d!53621 (= lt!87604 e!117025)))

(declare-fun c!31785 () Bool)

(assert (=> d!53621 (= c!31785 (bvsge #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(assert (=> d!53621 (validMask!0 (mask!8593 thiss!1248))))

(assert (=> d!53621 (= (getCurrentListMapNoExtraKeys!162 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)) lt!87604)))

(declare-fun b!177479 () Bool)

(declare-fun e!117021 () Bool)

(assert (=> b!177479 (= e!117021 (= lt!87604 (getCurrentListMapNoExtraKeys!162 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3654 thiss!1248))))))

(declare-fun b!177480 () Bool)

(declare-fun isEmpty!451 (ListLongMap!2209) Bool)

(assert (=> b!177480 (= e!117021 (isEmpty!451 lt!87604))))

(declare-fun b!177481 () Bool)

(declare-fun lt!87601 () Unit!5397)

(declare-fun lt!87600 () Unit!5397)

(assert (=> b!177481 (= lt!87601 lt!87600)))

(declare-fun lt!87605 () (_ BitVec 64))

(declare-fun lt!87602 () (_ BitVec 64))

(declare-fun lt!87603 () ListLongMap!2209)

(declare-fun lt!87606 () V!5193)

(assert (=> b!177481 (not (contains!1191 (+!253 lt!87603 (tuple2!3291 lt!87602 lt!87606)) lt!87605))))

(declare-fun addStillNotContains!78 (ListLongMap!2209 (_ BitVec 64) V!5193 (_ BitVec 64)) Unit!5397)

(assert (=> b!177481 (= lt!87600 (addStillNotContains!78 lt!87603 lt!87602 lt!87606 lt!87605))))

(assert (=> b!177481 (= lt!87605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!177481 (= lt!87606 (get!2014 (select (arr!3533 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!177481 (= lt!87602 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!17947 () ListLongMap!2209)

(assert (=> b!177481 (= lt!87603 call!17947)))

(declare-fun e!117026 () ListLongMap!2209)

(assert (=> b!177481 (= e!117026 (+!253 call!17947 (tuple2!3291 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000) (get!2014 (select (arr!3533 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!177482 () Bool)

(declare-fun e!117020 () Bool)

(declare-fun e!117022 () Bool)

(assert (=> b!177482 (= e!117020 e!117022)))

(assert (=> b!177482 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(declare-fun res!84082 () Bool)

(assert (=> b!177482 (= res!84082 (contains!1191 lt!87604 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177482 (=> (not res!84082) (not e!117022))))

(declare-fun b!177483 () Bool)

(declare-fun e!117023 () Bool)

(assert (=> b!177483 (= e!117023 (validKeyInArray!0 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177483 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!177484 () Bool)

(declare-fun res!84080 () Bool)

(assert (=> b!177484 (=> (not res!84080) (not e!117024))))

(assert (=> b!177484 (= res!84080 (not (contains!1191 lt!87604 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177485 () Bool)

(assert (=> b!177485 (= e!117020 e!117021)))

(declare-fun c!31783 () Bool)

(assert (=> b!177485 (= c!31783 (bvslt #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(declare-fun b!177486 () Bool)

(assert (=> b!177486 (= e!117024 e!117020)))

(declare-fun c!31784 () Bool)

(assert (=> b!177486 (= c!31784 e!117023)))

(declare-fun res!84079 () Bool)

(assert (=> b!177486 (=> (not res!84079) (not e!117023))))

(assert (=> b!177486 (= res!84079 (bvslt #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(declare-fun bm!17944 () Bool)

(assert (=> bm!17944 (= call!17947 (getCurrentListMapNoExtraKeys!162 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3654 thiss!1248)))))

(declare-fun b!177487 () Bool)

(assert (=> b!177487 (= e!117026 call!17947)))

(declare-fun b!177488 () Bool)

(assert (=> b!177488 (= e!117025 (ListLongMap!2210 Nil!2254))))

(declare-fun b!177489 () Bool)

(assert (=> b!177489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(assert (=> b!177489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3838 (_values!3637 thiss!1248))))))

(assert (=> b!177489 (= e!117022 (= (apply!141 lt!87604 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)) (get!2014 (select (arr!3533 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!177490 () Bool)

(assert (=> b!177490 (= e!117025 e!117026)))

(declare-fun c!31782 () Bool)

(assert (=> b!177490 (= c!31782 (validKeyInArray!0 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53621 c!31785) b!177488))

(assert (= (and d!53621 (not c!31785)) b!177490))

(assert (= (and b!177490 c!31782) b!177481))

(assert (= (and b!177490 (not c!31782)) b!177487))

(assert (= (or b!177481 b!177487) bm!17944))

(assert (= (and d!53621 res!84081) b!177484))

(assert (= (and b!177484 res!84080) b!177486))

(assert (= (and b!177486 res!84079) b!177483))

(assert (= (and b!177486 c!31784) b!177482))

(assert (= (and b!177486 (not c!31784)) b!177485))

(assert (= (and b!177482 res!84082) b!177489))

(assert (= (and b!177485 c!31783) b!177479))

(assert (= (and b!177485 (not c!31783)) b!177480))

(declare-fun b_lambda!7041 () Bool)

(assert (=> (not b_lambda!7041) (not b!177481)))

(assert (=> b!177481 t!7082))

(declare-fun b_and!10871 () Bool)

(assert (= b_and!10869 (and (=> t!7082 result!4645) b_and!10871)))

(declare-fun b_lambda!7043 () Bool)

(assert (=> (not b_lambda!7043) (not b!177489)))

(assert (=> b!177489 t!7082))

(declare-fun b_and!10873 () Bool)

(assert (= b_and!10871 (and (=> t!7082 result!4645) b_and!10873)))

(assert (=> b!177483 m!205393))

(assert (=> b!177483 m!205393))

(assert (=> b!177483 m!205397))

(declare-fun m!205463 () Bool)

(assert (=> bm!17944 m!205463))

(assert (=> b!177482 m!205393))

(assert (=> b!177482 m!205393))

(declare-fun m!205465 () Bool)

(assert (=> b!177482 m!205465))

(declare-fun m!205467 () Bool)

(assert (=> b!177480 m!205467))

(declare-fun m!205469 () Bool)

(assert (=> b!177481 m!205469))

(assert (=> b!177481 m!205403))

(assert (=> b!177481 m!205405))

(assert (=> b!177481 m!205407))

(declare-fun m!205471 () Bool)

(assert (=> b!177481 m!205471))

(assert (=> b!177481 m!205405))

(declare-fun m!205473 () Bool)

(assert (=> b!177481 m!205473))

(assert (=> b!177481 m!205403))

(assert (=> b!177481 m!205473))

(declare-fun m!205475 () Bool)

(assert (=> b!177481 m!205475))

(assert (=> b!177481 m!205393))

(assert (=> b!177479 m!205463))

(assert (=> b!177489 m!205403))

(assert (=> b!177489 m!205405))

(assert (=> b!177489 m!205407))

(assert (=> b!177489 m!205405))

(assert (=> b!177489 m!205393))

(declare-fun m!205477 () Bool)

(assert (=> b!177489 m!205477))

(assert (=> b!177489 m!205403))

(assert (=> b!177489 m!205393))

(declare-fun m!205479 () Bool)

(assert (=> d!53621 m!205479))

(assert (=> d!53621 m!205313))

(declare-fun m!205481 () Bool)

(assert (=> b!177484 m!205481))

(assert (=> b!177490 m!205393))

(assert (=> b!177490 m!205393))

(assert (=> b!177490 m!205397))

(assert (=> b!177415 d!53621))

(declare-fun d!53623 () Bool)

(declare-fun e!117029 () Bool)

(assert (=> d!53623 e!117029))

(declare-fun res!84088 () Bool)

(assert (=> d!53623 (=> (not res!84088) (not e!117029))))

(declare-fun lt!87616 () ListLongMap!2209)

(assert (=> d!53623 (= res!84088 (contains!1191 lt!87616 (_1!1656 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248)))))))

(declare-fun lt!87618 () List!2257)

(assert (=> d!53623 (= lt!87616 (ListLongMap!2210 lt!87618))))

(declare-fun lt!87617 () Unit!5397)

(declare-fun lt!87615 () Unit!5397)

(assert (=> d!53623 (= lt!87617 lt!87615)))

(assert (=> d!53623 (= (getValueByKey!194 lt!87618 (_1!1656 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248)))) (Some!199 (_2!1656 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!104 (List!2257 (_ BitVec 64) V!5193) Unit!5397)

(assert (=> d!53623 (= lt!87615 (lemmaContainsTupThenGetReturnValue!104 lt!87618 (_1!1656 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248))) (_2!1656 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248)))))))

(declare-fun insertStrictlySorted!107 (List!2257 (_ BitVec 64) V!5193) List!2257)

(assert (=> d!53623 (= lt!87618 (insertStrictlySorted!107 (toList!1120 lt!87562) (_1!1656 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248))) (_2!1656 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248)))))))

(assert (=> d!53623 (= (+!253 lt!87562 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248))) lt!87616)))

(declare-fun b!177495 () Bool)

(declare-fun res!84087 () Bool)

(assert (=> b!177495 (=> (not res!84087) (not e!117029))))

(assert (=> b!177495 (= res!84087 (= (getValueByKey!194 (toList!1120 lt!87616) (_1!1656 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248)))) (Some!199 (_2!1656 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248))))))))

(declare-fun b!177496 () Bool)

(declare-fun contains!1192 (List!2257 tuple2!3290) Bool)

(assert (=> b!177496 (= e!117029 (contains!1192 (toList!1120 lt!87616) (tuple2!3291 lt!87573 (minValue!3495 thiss!1248))))))

(assert (= (and d!53623 res!84088) b!177495))

(assert (= (and b!177495 res!84087) b!177496))

(declare-fun m!205483 () Bool)

(assert (=> d!53623 m!205483))

(declare-fun m!205485 () Bool)

(assert (=> d!53623 m!205485))

(declare-fun m!205487 () Bool)

(assert (=> d!53623 m!205487))

(declare-fun m!205489 () Bool)

(assert (=> d!53623 m!205489))

(declare-fun m!205491 () Bool)

(assert (=> b!177495 m!205491))

(declare-fun m!205493 () Bool)

(assert (=> b!177496 m!205493))

(assert (=> b!177415 d!53623))

(declare-fun d!53625 () Bool)

(assert (=> d!53625 (= (apply!141 (+!253 lt!87562 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248))) lt!87571) (apply!141 lt!87562 lt!87571))))

(declare-fun lt!87621 () Unit!5397)

(declare-fun choose!953 (ListLongMap!2209 (_ BitVec 64) V!5193 (_ BitVec 64)) Unit!5397)

(assert (=> d!53625 (= lt!87621 (choose!953 lt!87562 lt!87573 (minValue!3495 thiss!1248) lt!87571))))

(declare-fun e!117032 () Bool)

(assert (=> d!53625 e!117032))

(declare-fun res!84091 () Bool)

(assert (=> d!53625 (=> (not res!84091) (not e!117032))))

(assert (=> d!53625 (= res!84091 (contains!1191 lt!87562 lt!87571))))

(assert (=> d!53625 (= (addApplyDifferent!117 lt!87562 lt!87573 (minValue!3495 thiss!1248) lt!87571) lt!87621)))

(declare-fun b!177500 () Bool)

(assert (=> b!177500 (= e!117032 (not (= lt!87571 lt!87573)))))

(assert (= (and d!53625 res!84091) b!177500))

(assert (=> d!53625 m!205419))

(assert (=> d!53625 m!205427))

(declare-fun m!205495 () Bool)

(assert (=> d!53625 m!205495))

(assert (=> d!53625 m!205433))

(declare-fun m!205497 () Bool)

(assert (=> d!53625 m!205497))

(assert (=> d!53625 m!205419))

(assert (=> b!177415 d!53625))

(declare-fun d!53627 () Bool)

(assert (=> d!53627 (= (apply!141 (+!253 lt!87561 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248))) lt!87564) (apply!141 lt!87561 lt!87564))))

(declare-fun lt!87622 () Unit!5397)

(assert (=> d!53627 (= lt!87622 (choose!953 lt!87561 lt!87577 (zeroValue!3495 thiss!1248) lt!87564))))

(declare-fun e!117033 () Bool)

(assert (=> d!53627 e!117033))

(declare-fun res!84092 () Bool)

(assert (=> d!53627 (=> (not res!84092) (not e!117033))))

(assert (=> d!53627 (= res!84092 (contains!1191 lt!87561 lt!87564))))

(assert (=> d!53627 (= (addApplyDifferent!117 lt!87561 lt!87577 (zeroValue!3495 thiss!1248) lt!87564) lt!87622)))

(declare-fun b!177501 () Bool)

(assert (=> b!177501 (= e!117033 (not (= lt!87564 lt!87577)))))

(assert (= (and d!53627 res!84092) b!177501))

(assert (=> d!53627 m!205417))

(assert (=> d!53627 m!205421))

(declare-fun m!205499 () Bool)

(assert (=> d!53627 m!205499))

(assert (=> d!53627 m!205415))

(declare-fun m!205501 () Bool)

(assert (=> d!53627 m!205501))

(assert (=> d!53627 m!205417))

(assert (=> b!177415 d!53627))

(declare-fun d!53629 () Bool)

(assert (=> d!53629 (= (apply!141 (+!253 lt!87567 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248))) lt!87568) (apply!141 lt!87567 lt!87568))))

(declare-fun lt!87623 () Unit!5397)

(assert (=> d!53629 (= lt!87623 (choose!953 lt!87567 lt!87578 (minValue!3495 thiss!1248) lt!87568))))

(declare-fun e!117034 () Bool)

(assert (=> d!53629 e!117034))

(declare-fun res!84093 () Bool)

(assert (=> d!53629 (=> (not res!84093) (not e!117034))))

(assert (=> d!53629 (= res!84093 (contains!1191 lt!87567 lt!87568))))

(assert (=> d!53629 (= (addApplyDifferent!117 lt!87567 lt!87578 (minValue!3495 thiss!1248) lt!87568) lt!87623)))

(declare-fun b!177502 () Bool)

(assert (=> b!177502 (= e!117034 (not (= lt!87568 lt!87578)))))

(assert (= (and d!53629 res!84093) b!177502))

(assert (=> d!53629 m!205423))

(assert (=> d!53629 m!205425))

(declare-fun m!205503 () Bool)

(assert (=> d!53629 m!205503))

(assert (=> d!53629 m!205437))

(declare-fun m!205505 () Bool)

(assert (=> d!53629 m!205505))

(assert (=> d!53629 m!205423))

(assert (=> b!177415 d!53629))

(declare-fun d!53631 () Bool)

(assert (=> d!53631 (= (apply!141 lt!87567 lt!87568) (get!2015 (getValueByKey!194 (toList!1120 lt!87567) lt!87568)))))

(declare-fun bs!7269 () Bool)

(assert (= bs!7269 d!53631))

(declare-fun m!205507 () Bool)

(assert (=> bs!7269 m!205507))

(assert (=> bs!7269 m!205507))

(declare-fun m!205509 () Bool)

(assert (=> bs!7269 m!205509))

(assert (=> b!177415 d!53631))

(declare-fun d!53633 () Bool)

(assert (=> d!53633 (= (apply!141 lt!87562 lt!87571) (get!2015 (getValueByKey!194 (toList!1120 lt!87562) lt!87571)))))

(declare-fun bs!7270 () Bool)

(assert (= bs!7270 d!53633))

(declare-fun m!205511 () Bool)

(assert (=> bs!7270 m!205511))

(assert (=> bs!7270 m!205511))

(declare-fun m!205513 () Bool)

(assert (=> bs!7270 m!205513))

(assert (=> b!177415 d!53633))

(declare-fun d!53635 () Bool)

(assert (=> d!53635 (= (apply!141 (+!253 lt!87567 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248))) lt!87568) (get!2015 (getValueByKey!194 (toList!1120 (+!253 lt!87567 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248)))) lt!87568)))))

(declare-fun bs!7271 () Bool)

(assert (= bs!7271 d!53635))

(declare-fun m!205515 () Bool)

(assert (=> bs!7271 m!205515))

(assert (=> bs!7271 m!205515))

(declare-fun m!205517 () Bool)

(assert (=> bs!7271 m!205517))

(assert (=> b!177415 d!53635))

(declare-fun d!53637 () Bool)

(declare-fun e!117035 () Bool)

(assert (=> d!53637 e!117035))

(declare-fun res!84095 () Bool)

(assert (=> d!53637 (=> (not res!84095) (not e!117035))))

(declare-fun lt!87625 () ListLongMap!2209)

(assert (=> d!53637 (= res!84095 (contains!1191 lt!87625 (_1!1656 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248)))))))

(declare-fun lt!87627 () List!2257)

(assert (=> d!53637 (= lt!87625 (ListLongMap!2210 lt!87627))))

(declare-fun lt!87626 () Unit!5397)

(declare-fun lt!87624 () Unit!5397)

(assert (=> d!53637 (= lt!87626 lt!87624)))

(assert (=> d!53637 (= (getValueByKey!194 lt!87627 (_1!1656 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248)))) (Some!199 (_2!1656 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53637 (= lt!87624 (lemmaContainsTupThenGetReturnValue!104 lt!87627 (_1!1656 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248))) (_2!1656 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53637 (= lt!87627 (insertStrictlySorted!107 (toList!1120 lt!87558) (_1!1656 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248))) (_2!1656 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53637 (= (+!253 lt!87558 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248))) lt!87625)))

(declare-fun b!177503 () Bool)

(declare-fun res!84094 () Bool)

(assert (=> b!177503 (=> (not res!84094) (not e!117035))))

(assert (=> b!177503 (= res!84094 (= (getValueByKey!194 (toList!1120 lt!87625) (_1!1656 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248)))) (Some!199 (_2!1656 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248))))))))

(declare-fun b!177504 () Bool)

(assert (=> b!177504 (= e!117035 (contains!1192 (toList!1120 lt!87625) (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248))))))

(assert (= (and d!53637 res!84095) b!177503))

(assert (= (and b!177503 res!84094) b!177504))

(declare-fun m!205519 () Bool)

(assert (=> d!53637 m!205519))

(declare-fun m!205521 () Bool)

(assert (=> d!53637 m!205521))

(declare-fun m!205523 () Bool)

(assert (=> d!53637 m!205523))

(declare-fun m!205525 () Bool)

(assert (=> d!53637 m!205525))

(declare-fun m!205527 () Bool)

(assert (=> b!177503 m!205527))

(declare-fun m!205529 () Bool)

(assert (=> b!177504 m!205529))

(assert (=> b!177415 d!53637))

(declare-fun d!53639 () Bool)

(declare-fun e!117036 () Bool)

(assert (=> d!53639 e!117036))

(declare-fun res!84097 () Bool)

(assert (=> d!53639 (=> (not res!84097) (not e!117036))))

(declare-fun lt!87629 () ListLongMap!2209)

(assert (=> d!53639 (= res!84097 (contains!1191 lt!87629 (_1!1656 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248)))))))

(declare-fun lt!87631 () List!2257)

(assert (=> d!53639 (= lt!87629 (ListLongMap!2210 lt!87631))))

(declare-fun lt!87630 () Unit!5397)

(declare-fun lt!87628 () Unit!5397)

(assert (=> d!53639 (= lt!87630 lt!87628)))

(assert (=> d!53639 (= (getValueByKey!194 lt!87631 (_1!1656 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248)))) (Some!199 (_2!1656 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248)))))))

(assert (=> d!53639 (= lt!87628 (lemmaContainsTupThenGetReturnValue!104 lt!87631 (_1!1656 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248))) (_2!1656 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248)))))))

(assert (=> d!53639 (= lt!87631 (insertStrictlySorted!107 (toList!1120 lt!87567) (_1!1656 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248))) (_2!1656 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248)))))))

(assert (=> d!53639 (= (+!253 lt!87567 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248))) lt!87629)))

(declare-fun b!177505 () Bool)

(declare-fun res!84096 () Bool)

(assert (=> b!177505 (=> (not res!84096) (not e!117036))))

(assert (=> b!177505 (= res!84096 (= (getValueByKey!194 (toList!1120 lt!87629) (_1!1656 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248)))) (Some!199 (_2!1656 (tuple2!3291 lt!87578 (minValue!3495 thiss!1248))))))))

(declare-fun b!177506 () Bool)

(assert (=> b!177506 (= e!117036 (contains!1192 (toList!1120 lt!87629) (tuple2!3291 lt!87578 (minValue!3495 thiss!1248))))))

(assert (= (and d!53639 res!84097) b!177505))

(assert (= (and b!177505 res!84096) b!177506))

(declare-fun m!205531 () Bool)

(assert (=> d!53639 m!205531))

(declare-fun m!205533 () Bool)

(assert (=> d!53639 m!205533))

(declare-fun m!205535 () Bool)

(assert (=> d!53639 m!205535))

(declare-fun m!205537 () Bool)

(assert (=> d!53639 m!205537))

(declare-fun m!205539 () Bool)

(assert (=> b!177505 m!205539))

(declare-fun m!205541 () Bool)

(assert (=> b!177506 m!205541))

(assert (=> b!177415 d!53639))

(declare-fun d!53641 () Bool)

(assert (=> d!53641 (= (apply!141 lt!87561 lt!87564) (get!2015 (getValueByKey!194 (toList!1120 lt!87561) lt!87564)))))

(declare-fun bs!7272 () Bool)

(assert (= bs!7272 d!53641))

(declare-fun m!205543 () Bool)

(assert (=> bs!7272 m!205543))

(assert (=> bs!7272 m!205543))

(declare-fun m!205545 () Bool)

(assert (=> bs!7272 m!205545))

(assert (=> b!177415 d!53641))

(declare-fun d!53643 () Bool)

(assert (=> d!53643 (contains!1191 (+!253 lt!87558 (tuple2!3291 lt!87560 (zeroValue!3495 thiss!1248))) lt!87566)))

(declare-fun lt!87634 () Unit!5397)

(declare-fun choose!954 (ListLongMap!2209 (_ BitVec 64) V!5193 (_ BitVec 64)) Unit!5397)

(assert (=> d!53643 (= lt!87634 (choose!954 lt!87558 lt!87560 (zeroValue!3495 thiss!1248) lt!87566))))

(assert (=> d!53643 (contains!1191 lt!87558 lt!87566)))

(assert (=> d!53643 (= (addStillContains!117 lt!87558 lt!87560 (zeroValue!3495 thiss!1248) lt!87566) lt!87634)))

(declare-fun bs!7273 () Bool)

(assert (= bs!7273 d!53643))

(assert (=> bs!7273 m!205413))

(assert (=> bs!7273 m!205413))

(assert (=> bs!7273 m!205439))

(declare-fun m!205547 () Bool)

(assert (=> bs!7273 m!205547))

(declare-fun m!205549 () Bool)

(assert (=> bs!7273 m!205549))

(assert (=> b!177415 d!53643))

(declare-fun d!53645 () Bool)

(declare-fun e!117037 () Bool)

(assert (=> d!53645 e!117037))

(declare-fun res!84099 () Bool)

(assert (=> d!53645 (=> (not res!84099) (not e!117037))))

(declare-fun lt!87636 () ListLongMap!2209)

(assert (=> d!53645 (= res!84099 (contains!1191 lt!87636 (_1!1656 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248)))))))

(declare-fun lt!87638 () List!2257)

(assert (=> d!53645 (= lt!87636 (ListLongMap!2210 lt!87638))))

(declare-fun lt!87637 () Unit!5397)

(declare-fun lt!87635 () Unit!5397)

(assert (=> d!53645 (= lt!87637 lt!87635)))

(assert (=> d!53645 (= (getValueByKey!194 lt!87638 (_1!1656 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248)))) (Some!199 (_2!1656 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53645 (= lt!87635 (lemmaContainsTupThenGetReturnValue!104 lt!87638 (_1!1656 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248))) (_2!1656 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53645 (= lt!87638 (insertStrictlySorted!107 (toList!1120 lt!87561) (_1!1656 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248))) (_2!1656 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248)))))))

(assert (=> d!53645 (= (+!253 lt!87561 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248))) lt!87636)))

(declare-fun b!177508 () Bool)

(declare-fun res!84098 () Bool)

(assert (=> b!177508 (=> (not res!84098) (not e!117037))))

(assert (=> b!177508 (= res!84098 (= (getValueByKey!194 (toList!1120 lt!87636) (_1!1656 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248)))) (Some!199 (_2!1656 (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248))))))))

(declare-fun b!177509 () Bool)

(assert (=> b!177509 (= e!117037 (contains!1192 (toList!1120 lt!87636) (tuple2!3291 lt!87577 (zeroValue!3495 thiss!1248))))))

(assert (= (and d!53645 res!84099) b!177508))

(assert (= (and b!177508 res!84098) b!177509))

(declare-fun m!205551 () Bool)

(assert (=> d!53645 m!205551))

(declare-fun m!205553 () Bool)

(assert (=> d!53645 m!205553))

(declare-fun m!205555 () Bool)

(assert (=> d!53645 m!205555))

(declare-fun m!205557 () Bool)

(assert (=> d!53645 m!205557))

(declare-fun m!205559 () Bool)

(assert (=> b!177508 m!205559))

(declare-fun m!205561 () Bool)

(assert (=> b!177509 m!205561))

(assert (=> b!177415 d!53645))

(declare-fun d!53647 () Bool)

(assert (=> d!53647 (= (apply!141 (+!253 lt!87562 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248))) lt!87571) (get!2015 (getValueByKey!194 (toList!1120 (+!253 lt!87562 (tuple2!3291 lt!87573 (minValue!3495 thiss!1248)))) lt!87571)))))

(declare-fun bs!7274 () Bool)

(assert (= bs!7274 d!53647))

(declare-fun m!205563 () Bool)

(assert (=> bs!7274 m!205563))

(assert (=> bs!7274 m!205563))

(declare-fun m!205565 () Bool)

(assert (=> bs!7274 m!205565))

(assert (=> b!177415 d!53647))

(declare-fun d!53649 () Bool)

(declare-fun isEmpty!452 (Option!200) Bool)

(assert (=> d!53649 (= (isDefined!148 (getValueByKey!194 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828)) (not (isEmpty!452 (getValueByKey!194 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))))

(declare-fun bs!7275 () Bool)

(assert (= bs!7275 d!53649))

(assert (=> bs!7275 m!205385))

(declare-fun m!205567 () Bool)

(assert (=> bs!7275 m!205567))

(assert (=> b!177366 d!53649))

(declare-fun d!53651 () Bool)

(declare-fun c!31790 () Bool)

(assert (=> d!53651 (= c!31790 (and ((_ is Cons!2253) (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) (= (_1!1656 (h!2874 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) key!828)))))

(declare-fun e!117042 () Option!200)

(assert (=> d!53651 (= (getValueByKey!194 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828) e!117042)))

(declare-fun b!177521 () Bool)

(declare-fun e!117043 () Option!200)

(assert (=> b!177521 (= e!117043 None!198)))

(declare-fun b!177520 () Bool)

(assert (=> b!177520 (= e!117043 (getValueByKey!194 (t!7080 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) key!828))))

(declare-fun b!177519 () Bool)

(assert (=> b!177519 (= e!117042 e!117043)))

(declare-fun c!31791 () Bool)

(assert (=> b!177519 (= c!31791 (and ((_ is Cons!2253) (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) (not (= (_1!1656 (h!2874 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) key!828))))))

(declare-fun b!177518 () Bool)

(assert (=> b!177518 (= e!117042 (Some!199 (_2!1656 (h!2874 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))))))

(assert (= (and d!53651 c!31790) b!177518))

(assert (= (and d!53651 (not c!31790)) b!177519))

(assert (= (and b!177519 c!31791) b!177520))

(assert (= (and b!177519 (not c!31791)) b!177521))

(declare-fun m!205569 () Bool)

(assert (=> b!177520 m!205569))

(assert (=> b!177366 d!53651))

(declare-fun b!177533 () Bool)

(declare-fun e!117046 () Bool)

(assert (=> b!177533 (= e!117046 (and (bvsge (extraKeys!3391 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3391 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1239 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!177530 () Bool)

(declare-fun res!84109 () Bool)

(assert (=> b!177530 (=> (not res!84109) (not e!117046))))

(assert (=> b!177530 (= res!84109 (and (= (size!3838 (_values!3637 thiss!1248)) (bvadd (mask!8593 thiss!1248) #b00000000000000000000000000000001)) (= (size!3837 (_keys!5521 thiss!1248)) (size!3838 (_values!3637 thiss!1248))) (bvsge (_size!1239 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1239 thiss!1248) (bvadd (mask!8593 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!53653 () Bool)

(declare-fun res!84110 () Bool)

(assert (=> d!53653 (=> (not res!84110) (not e!117046))))

(assert (=> d!53653 (= res!84110 (validMask!0 (mask!8593 thiss!1248)))))

(assert (=> d!53653 (= (simpleValid!155 thiss!1248) e!117046)))

(declare-fun b!177531 () Bool)

(declare-fun res!84108 () Bool)

(assert (=> b!177531 (=> (not res!84108) (not e!117046))))

(declare-fun size!3843 (LongMapFixedSize!2380) (_ BitVec 32))

(assert (=> b!177531 (= res!84108 (bvsge (size!3843 thiss!1248) (_size!1239 thiss!1248)))))

(declare-fun b!177532 () Bool)

(declare-fun res!84111 () Bool)

(assert (=> b!177532 (=> (not res!84111) (not e!117046))))

(assert (=> b!177532 (= res!84111 (= (size!3843 thiss!1248) (bvadd (_size!1239 thiss!1248) (bvsdiv (bvadd (extraKeys!3391 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!53653 res!84110) b!177530))

(assert (= (and b!177530 res!84109) b!177531))

(assert (= (and b!177531 res!84108) b!177532))

(assert (= (and b!177532 res!84111) b!177533))

(assert (=> d!53653 m!205313))

(declare-fun m!205571 () Bool)

(assert (=> b!177531 m!205571))

(assert (=> b!177532 m!205571))

(assert (=> d!53603 d!53653))

(declare-fun d!53655 () Bool)

(assert (=> d!53655 (= (validKeyInArray!0 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177414 d!53655))

(assert (=> d!53613 d!53601))

(declare-fun b!177542 () Bool)

(declare-fun e!117055 () Bool)

(declare-fun e!117054 () Bool)

(assert (=> b!177542 (= e!117055 e!117054)))

(declare-fun c!31794 () Bool)

(assert (=> b!177542 (= c!31794 (validKeyInArray!0 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17947 () Bool)

(declare-fun call!17950 () Bool)

(assert (=> bm!17947 (= call!17950 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5521 thiss!1248) (mask!8593 thiss!1248)))))

(declare-fun b!177543 () Bool)

(declare-fun e!117053 () Bool)

(assert (=> b!177543 (= e!117053 call!17950)))

(declare-fun d!53657 () Bool)

(declare-fun res!84116 () Bool)

(assert (=> d!53657 (=> res!84116 e!117055)))

(assert (=> d!53657 (= res!84116 (bvsge #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(assert (=> d!53657 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5521 thiss!1248) (mask!8593 thiss!1248)) e!117055)))

(declare-fun b!177544 () Bool)

(assert (=> b!177544 (= e!117054 call!17950)))

(declare-fun b!177545 () Bool)

(assert (=> b!177545 (= e!117054 e!117053)))

(declare-fun lt!87645 () (_ BitVec 64))

(assert (=> b!177545 (= lt!87645 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87646 () Unit!5397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7451 (_ BitVec 64) (_ BitVec 32)) Unit!5397)

(assert (=> b!177545 (= lt!87646 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5521 thiss!1248) lt!87645 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!177545 (arrayContainsKey!0 (_keys!5521 thiss!1248) lt!87645 #b00000000000000000000000000000000)))

(declare-fun lt!87647 () Unit!5397)

(assert (=> b!177545 (= lt!87647 lt!87646)))

(declare-fun res!84117 () Bool)

(assert (=> b!177545 (= res!84117 (= (seekEntryOrOpen!0 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000) (_keys!5521 thiss!1248) (mask!8593 thiss!1248)) (Found!579 #b00000000000000000000000000000000)))))

(assert (=> b!177545 (=> (not res!84117) (not e!117053))))

(assert (= (and d!53657 (not res!84116)) b!177542))

(assert (= (and b!177542 c!31794) b!177545))

(assert (= (and b!177542 (not c!31794)) b!177544))

(assert (= (and b!177545 res!84117) b!177543))

(assert (= (or b!177543 b!177544) bm!17947))

(assert (=> b!177542 m!205393))

(assert (=> b!177542 m!205393))

(assert (=> b!177542 m!205397))

(declare-fun m!205573 () Bool)

(assert (=> bm!17947 m!205573))

(assert (=> b!177545 m!205393))

(declare-fun m!205575 () Bool)

(assert (=> b!177545 m!205575))

(declare-fun m!205577 () Bool)

(assert (=> b!177545 m!205577))

(assert (=> b!177545 m!205393))

(declare-fun m!205579 () Bool)

(assert (=> b!177545 m!205579))

(assert (=> b!177338 d!53657))

(declare-fun d!53659 () Bool)

(assert (=> d!53659 (= (apply!141 lt!87559 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2015 (getValueByKey!194 (toList!1120 lt!87559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7276 () Bool)

(assert (= bs!7276 d!53659))

(declare-fun m!205581 () Bool)

(assert (=> bs!7276 m!205581))

(assert (=> bs!7276 m!205581))

(declare-fun m!205583 () Bool)

(assert (=> bs!7276 m!205583))

(assert (=> b!177425 d!53659))

(declare-fun b!177564 () Bool)

(declare-fun lt!87652 () SeekEntryResult!579)

(assert (=> b!177564 (and (bvsge (index!4486 lt!87652) #b00000000000000000000000000000000) (bvslt (index!4486 lt!87652) (size!3837 (_keys!5521 thiss!1248))))))

(declare-fun res!84126 () Bool)

(assert (=> b!177564 (= res!84126 (= (select (arr!3532 (_keys!5521 thiss!1248)) (index!4486 lt!87652)) key!828))))

(declare-fun e!117070 () Bool)

(assert (=> b!177564 (=> res!84126 e!117070)))

(declare-fun e!117066 () Bool)

(assert (=> b!177564 (= e!117066 e!117070)))

(declare-fun b!177565 () Bool)

(assert (=> b!177565 (and (bvsge (index!4486 lt!87652) #b00000000000000000000000000000000) (bvslt (index!4486 lt!87652) (size!3837 (_keys!5521 thiss!1248))))))

(declare-fun res!84124 () Bool)

(assert (=> b!177565 (= res!84124 (= (select (arr!3532 (_keys!5521 thiss!1248)) (index!4486 lt!87652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177565 (=> res!84124 e!117070)))

(declare-fun b!177566 () Bool)

(declare-fun e!117068 () Bool)

(assert (=> b!177566 (= e!117068 (bvsge (x!19476 lt!87652) #b01111111111111111111111111111110))))

(declare-fun b!177567 () Bool)

(declare-fun e!117067 () SeekEntryResult!579)

(declare-fun e!117069 () SeekEntryResult!579)

(assert (=> b!177567 (= e!117067 e!117069)))

(declare-fun c!31801 () Bool)

(declare-fun lt!87653 () (_ BitVec 64))

(assert (=> b!177567 (= c!31801 (or (= lt!87653 key!828) (= (bvadd lt!87653 lt!87653) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177568 () Bool)

(assert (=> b!177568 (= e!117069 (Intermediate!579 false (toIndex!0 key!828 (mask!8593 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!177569 () Bool)

(assert (=> b!177569 (and (bvsge (index!4486 lt!87652) #b00000000000000000000000000000000) (bvslt (index!4486 lt!87652) (size!3837 (_keys!5521 thiss!1248))))))

(assert (=> b!177569 (= e!117070 (= (select (arr!3532 (_keys!5521 thiss!1248)) (index!4486 lt!87652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177570 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177570 (= e!117069 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8593 thiss!1248)) #b00000000000000000000000000000000 (mask!8593 thiss!1248)) key!828 (_keys!5521 thiss!1248) (mask!8593 thiss!1248)))))

(declare-fun d!53661 () Bool)

(assert (=> d!53661 e!117068))

(declare-fun c!31802 () Bool)

(assert (=> d!53661 (= c!31802 (and ((_ is Intermediate!579) lt!87652) (undefined!1391 lt!87652)))))

(assert (=> d!53661 (= lt!87652 e!117067)))

(declare-fun c!31803 () Bool)

(assert (=> d!53661 (= c!31803 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53661 (= lt!87653 (select (arr!3532 (_keys!5521 thiss!1248)) (toIndex!0 key!828 (mask!8593 thiss!1248))))))

(assert (=> d!53661 (validMask!0 (mask!8593 thiss!1248))))

(assert (=> d!53661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8593 thiss!1248)) key!828 (_keys!5521 thiss!1248) (mask!8593 thiss!1248)) lt!87652)))

(declare-fun b!177571 () Bool)

(assert (=> b!177571 (= e!117067 (Intermediate!579 true (toIndex!0 key!828 (mask!8593 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!177572 () Bool)

(assert (=> b!177572 (= e!117068 e!117066)))

(declare-fun res!84125 () Bool)

(assert (=> b!177572 (= res!84125 (and ((_ is Intermediate!579) lt!87652) (not (undefined!1391 lt!87652)) (bvslt (x!19476 lt!87652) #b01111111111111111111111111111110) (bvsge (x!19476 lt!87652) #b00000000000000000000000000000000) (bvsge (x!19476 lt!87652) #b00000000000000000000000000000000)))))

(assert (=> b!177572 (=> (not res!84125) (not e!117066))))

(assert (= (and d!53661 c!31803) b!177571))

(assert (= (and d!53661 (not c!31803)) b!177567))

(assert (= (and b!177567 c!31801) b!177568))

(assert (= (and b!177567 (not c!31801)) b!177570))

(assert (= (and d!53661 c!31802) b!177566))

(assert (= (and d!53661 (not c!31802)) b!177572))

(assert (= (and b!177572 res!84125) b!177564))

(assert (= (and b!177564 (not res!84126)) b!177565))

(assert (= (and b!177565 (not res!84124)) b!177569))

(declare-fun m!205585 () Bool)

(assert (=> b!177565 m!205585))

(assert (=> b!177569 m!205585))

(assert (=> b!177570 m!205367))

(declare-fun m!205587 () Bool)

(assert (=> b!177570 m!205587))

(assert (=> b!177570 m!205587))

(declare-fun m!205589 () Bool)

(assert (=> b!177570 m!205589))

(assert (=> d!53661 m!205367))

(declare-fun m!205591 () Bool)

(assert (=> d!53661 m!205591))

(assert (=> d!53661 m!205313))

(assert (=> b!177564 m!205585))

(assert (=> d!53609 d!53661))

(declare-fun d!53663 () Bool)

(declare-fun lt!87659 () (_ BitVec 32))

(declare-fun lt!87658 () (_ BitVec 32))

(assert (=> d!53663 (= lt!87659 (bvmul (bvxor lt!87658 (bvlshr lt!87658 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53663 (= lt!87658 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53663 (and (bvsge (mask!8593 thiss!1248) #b00000000000000000000000000000000) (let ((res!84127 (let ((h!2876 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19493 (bvmul (bvxor h!2876 (bvlshr h!2876 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19493 (bvlshr x!19493 #b00000000000000000000000000001101)) (mask!8593 thiss!1248)))))) (and (bvslt res!84127 (bvadd (mask!8593 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84127 #b00000000000000000000000000000000))))))

(assert (=> d!53663 (= (toIndex!0 key!828 (mask!8593 thiss!1248)) (bvand (bvxor lt!87659 (bvlshr lt!87659 #b00000000000000000000000000001101)) (mask!8593 thiss!1248)))))

(assert (=> d!53609 d!53663))

(assert (=> d!53609 d!53601))

(assert (=> bm!17932 d!53621))

(declare-fun b!177583 () Bool)

(declare-fun e!117082 () Bool)

(declare-fun e!117079 () Bool)

(assert (=> b!177583 (= e!117082 e!117079)))

(declare-fun c!31806 () Bool)

(assert (=> b!177583 (= c!31806 (validKeyInArray!0 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177584 () Bool)

(declare-fun e!117081 () Bool)

(declare-fun contains!1193 (List!2258 (_ BitVec 64)) Bool)

(assert (=> b!177584 (= e!117081 (contains!1193 Nil!2255 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17950 () Bool)

(declare-fun call!17953 () Bool)

(assert (=> bm!17950 (= call!17953 (arrayNoDuplicates!0 (_keys!5521 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31806 (Cons!2254 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000) Nil!2255) Nil!2255)))))

(declare-fun b!177585 () Bool)

(assert (=> b!177585 (= e!117079 call!17953)))

(declare-fun b!177586 () Bool)

(assert (=> b!177586 (= e!117079 call!17953)))

(declare-fun d!53665 () Bool)

(declare-fun res!84136 () Bool)

(declare-fun e!117080 () Bool)

(assert (=> d!53665 (=> res!84136 e!117080)))

(assert (=> d!53665 (= res!84136 (bvsge #b00000000000000000000000000000000 (size!3837 (_keys!5521 thiss!1248))))))

(assert (=> d!53665 (= (arrayNoDuplicates!0 (_keys!5521 thiss!1248) #b00000000000000000000000000000000 Nil!2255) e!117080)))

(declare-fun b!177587 () Bool)

(assert (=> b!177587 (= e!117080 e!117082)))

(declare-fun res!84135 () Bool)

(assert (=> b!177587 (=> (not res!84135) (not e!117082))))

(assert (=> b!177587 (= res!84135 (not e!117081))))

(declare-fun res!84134 () Bool)

(assert (=> b!177587 (=> (not res!84134) (not e!117081))))

(assert (=> b!177587 (= res!84134 (validKeyInArray!0 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53665 (not res!84136)) b!177587))

(assert (= (and b!177587 res!84134) b!177584))

(assert (= (and b!177587 res!84135) b!177583))

(assert (= (and b!177583 c!31806) b!177585))

(assert (= (and b!177583 (not c!31806)) b!177586))

(assert (= (or b!177585 b!177586) bm!17950))

(assert (=> b!177583 m!205393))

(assert (=> b!177583 m!205393))

(assert (=> b!177583 m!205397))

(assert (=> b!177584 m!205393))

(assert (=> b!177584 m!205393))

(declare-fun m!205593 () Bool)

(assert (=> b!177584 m!205593))

(assert (=> bm!17950 m!205393))

(declare-fun m!205595 () Bool)

(assert (=> bm!17950 m!205595))

(assert (=> b!177587 m!205393))

(assert (=> b!177587 m!205393))

(assert (=> b!177587 m!205397))

(assert (=> b!177339 d!53665))

(declare-fun d!53667 () Bool)

(assert (=> d!53667 (= (apply!141 lt!87559 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2015 (getValueByKey!194 (toList!1120 lt!87559) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7277 () Bool)

(assert (= bs!7277 d!53667))

(declare-fun m!205597 () Bool)

(assert (=> bs!7277 m!205597))

(assert (=> bs!7277 m!205597))

(declare-fun m!205599 () Bool)

(assert (=> bs!7277 m!205599))

(assert (=> b!177417 d!53667))

(declare-fun d!53669 () Bool)

(assert (=> d!53669 (= (apply!141 lt!87559 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)) (get!2015 (getValueByKey!194 (toList!1120 lt!87559) (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7278 () Bool)

(assert (= bs!7278 d!53669))

(assert (=> bs!7278 m!205393))

(declare-fun m!205601 () Bool)

(assert (=> bs!7278 m!205601))

(assert (=> bs!7278 m!205601))

(declare-fun m!205603 () Bool)

(assert (=> bs!7278 m!205603))

(assert (=> b!177419 d!53669))

(declare-fun d!53671 () Bool)

(declare-fun c!31809 () Bool)

(assert (=> d!53671 (= c!31809 ((_ is ValueCellFull!1736) (select (arr!3533 (_values!3637 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117085 () V!5193)

(assert (=> d!53671 (= (get!2014 (select (arr!3533 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117085)))

(declare-fun b!177592 () Bool)

(declare-fun get!2016 (ValueCell!1736 V!5193) V!5193)

(assert (=> b!177592 (= e!117085 (get!2016 (select (arr!3533 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177593 () Bool)

(declare-fun get!2017 (ValueCell!1736 V!5193) V!5193)

(assert (=> b!177593 (= e!117085 (get!2017 (select (arr!3533 (_values!3637 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!475 (defaultEntry!3654 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53671 c!31809) b!177592))

(assert (= (and d!53671 (not c!31809)) b!177593))

(assert (=> b!177592 m!205403))

(assert (=> b!177592 m!205405))

(declare-fun m!205605 () Bool)

(assert (=> b!177592 m!205605))

(assert (=> b!177593 m!205403))

(assert (=> b!177593 m!205405))

(declare-fun m!205607 () Bool)

(assert (=> b!177593 m!205607))

(assert (=> b!177419 d!53671))

(declare-fun d!53673 () Bool)

(declare-fun e!117086 () Bool)

(assert (=> d!53673 e!117086))

(declare-fun res!84138 () Bool)

(assert (=> d!53673 (=> (not res!84138) (not e!117086))))

(declare-fun lt!87661 () ListLongMap!2209)

(assert (=> d!53673 (= res!84138 (contains!1191 lt!87661 (_1!1656 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(declare-fun lt!87663 () List!2257)

(assert (=> d!53673 (= lt!87661 (ListLongMap!2210 lt!87663))))

(declare-fun lt!87662 () Unit!5397)

(declare-fun lt!87660 () Unit!5397)

(assert (=> d!53673 (= lt!87662 lt!87660)))

(assert (=> d!53673 (= (getValueByKey!194 lt!87663 (_1!1656 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))) (Some!199 (_2!1656 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(assert (=> d!53673 (= lt!87660 (lemmaContainsTupThenGetReturnValue!104 lt!87663 (_1!1656 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))) (_2!1656 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(assert (=> d!53673 (= lt!87663 (insertStrictlySorted!107 (toList!1120 call!17940) (_1!1656 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))) (_2!1656 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(assert (=> d!53673 (= (+!253 call!17940 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))) lt!87661)))

(declare-fun b!177594 () Bool)

(declare-fun res!84137 () Bool)

(assert (=> b!177594 (=> (not res!84137) (not e!117086))))

(assert (=> b!177594 (= res!84137 (= (getValueByKey!194 (toList!1120 lt!87661) (_1!1656 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))) (Some!199 (_2!1656 (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))))

(declare-fun b!177595 () Bool)

(assert (=> b!177595 (= e!117086 (contains!1192 (toList!1120 lt!87661) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))

(assert (= (and d!53673 res!84138) b!177594))

(assert (= (and b!177594 res!84137) b!177595))

(declare-fun m!205609 () Bool)

(assert (=> d!53673 m!205609))

(declare-fun m!205611 () Bool)

(assert (=> d!53673 m!205611))

(declare-fun m!205613 () Bool)

(assert (=> d!53673 m!205613))

(declare-fun m!205615 () Bool)

(assert (=> d!53673 m!205615))

(declare-fun m!205617 () Bool)

(assert (=> b!177594 m!205617))

(declare-fun m!205619 () Bool)

(assert (=> b!177595 m!205619))

(assert (=> b!177426 d!53673))

(declare-fun d!53675 () Bool)

(declare-fun e!117087 () Bool)

(assert (=> d!53675 e!117087))

(declare-fun res!84140 () Bool)

(assert (=> d!53675 (=> (not res!84140) (not e!117087))))

(declare-fun lt!87665 () ListLongMap!2209)

(assert (=> d!53675 (= res!84140 (contains!1191 lt!87665 (_1!1656 (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))))

(declare-fun lt!87667 () List!2257)

(assert (=> d!53675 (= lt!87665 (ListLongMap!2210 lt!87667))))

(declare-fun lt!87666 () Unit!5397)

(declare-fun lt!87664 () Unit!5397)

(assert (=> d!53675 (= lt!87666 lt!87664)))

(assert (=> d!53675 (= (getValueByKey!194 lt!87667 (_1!1656 (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))) (Some!199 (_2!1656 (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))))

(assert (=> d!53675 (= lt!87664 (lemmaContainsTupThenGetReturnValue!104 lt!87667 (_1!1656 (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))) (_2!1656 (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))))

(assert (=> d!53675 (= lt!87667 (insertStrictlySorted!107 (toList!1120 (ite c!31765 call!17937 (ite c!31766 call!17939 call!17935))) (_1!1656 (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))) (_2!1656 (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))))))

(assert (=> d!53675 (= (+!253 (ite c!31765 call!17937 (ite c!31766 call!17939 call!17935)) (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))) lt!87665)))

(declare-fun b!177596 () Bool)

(declare-fun res!84139 () Bool)

(assert (=> b!177596 (=> (not res!84139) (not e!117087))))

(assert (=> b!177596 (= res!84139 (= (getValueByKey!194 (toList!1120 lt!87665) (_1!1656 (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248))))) (Some!199 (_2!1656 (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))))

(declare-fun b!177597 () Bool)

(assert (=> b!177597 (= e!117087 (contains!1192 (toList!1120 lt!87665) (ite (or c!31765 c!31766) (tuple2!3291 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3495 thiss!1248)) (tuple2!3291 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3495 thiss!1248)))))))

(assert (= (and d!53675 res!84140) b!177596))

(assert (= (and b!177596 res!84139) b!177597))

(declare-fun m!205621 () Bool)

(assert (=> d!53675 m!205621))

(declare-fun m!205623 () Bool)

(assert (=> d!53675 m!205623))

(declare-fun m!205625 () Bool)

(assert (=> d!53675 m!205625))

(declare-fun m!205627 () Bool)

(assert (=> d!53675 m!205627))

(declare-fun m!205629 () Bool)

(assert (=> b!177596 m!205629))

(declare-fun m!205631 () Bool)

(assert (=> b!177597 m!205631))

(assert (=> bm!17934 d!53675))

(declare-fun d!53677 () Bool)

(declare-fun e!117088 () Bool)

(assert (=> d!53677 e!117088))

(declare-fun res!84141 () Bool)

(assert (=> d!53677 (=> res!84141 e!117088)))

(declare-fun lt!87671 () Bool)

(assert (=> d!53677 (= res!84141 (not lt!87671))))

(declare-fun lt!87669 () Bool)

(assert (=> d!53677 (= lt!87671 lt!87669)))

(declare-fun lt!87668 () Unit!5397)

(declare-fun e!117089 () Unit!5397)

(assert (=> d!53677 (= lt!87668 e!117089)))

(declare-fun c!31810 () Bool)

(assert (=> d!53677 (= c!31810 lt!87669)))

(assert (=> d!53677 (= lt!87669 (containsKey!198 (toList!1120 lt!87559) (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53677 (= (contains!1191 lt!87559 (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)) lt!87671)))

(declare-fun b!177598 () Bool)

(declare-fun lt!87670 () Unit!5397)

(assert (=> b!177598 (= e!117089 lt!87670)))

(assert (=> b!177598 (= lt!87670 (lemmaContainsKeyImpliesGetValueByKeyDefined!147 (toList!1120 lt!87559) (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177598 (isDefined!148 (getValueByKey!194 (toList!1120 lt!87559) (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177599 () Bool)

(declare-fun Unit!5402 () Unit!5397)

(assert (=> b!177599 (= e!117089 Unit!5402)))

(declare-fun b!177600 () Bool)

(assert (=> b!177600 (= e!117088 (isDefined!148 (getValueByKey!194 (toList!1120 lt!87559) (select (arr!3532 (_keys!5521 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53677 c!31810) b!177598))

(assert (= (and d!53677 (not c!31810)) b!177599))

(assert (= (and d!53677 (not res!84141)) b!177600))

(assert (=> d!53677 m!205393))

(declare-fun m!205633 () Bool)

(assert (=> d!53677 m!205633))

(assert (=> b!177598 m!205393))

(declare-fun m!205635 () Bool)

(assert (=> b!177598 m!205635))

(assert (=> b!177598 m!205393))

(assert (=> b!177598 m!205601))

(assert (=> b!177598 m!205601))

(declare-fun m!205637 () Bool)

(assert (=> b!177598 m!205637))

(assert (=> b!177600 m!205393))

(assert (=> b!177600 m!205601))

(assert (=> b!177600 m!205601))

(assert (=> b!177600 m!205637))

(assert (=> b!177410 d!53677))

(assert (=> b!177412 d!53655))

(declare-fun d!53679 () Bool)

(declare-fun res!84146 () Bool)

(declare-fun e!117094 () Bool)

(assert (=> d!53679 (=> res!84146 e!117094)))

(assert (=> d!53679 (= res!84146 (and ((_ is Cons!2253) (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) (= (_1!1656 (h!2874 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) key!828)))))

(assert (=> d!53679 (= (containsKey!198 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828) e!117094)))

(declare-fun b!177605 () Bool)

(declare-fun e!117095 () Bool)

(assert (=> b!177605 (= e!117094 e!117095)))

(declare-fun res!84147 () Bool)

(assert (=> b!177605 (=> (not res!84147) (not e!117095))))

(assert (=> b!177605 (= res!84147 (and (or (not ((_ is Cons!2253) (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) (bvsle (_1!1656 (h!2874 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) key!828)) ((_ is Cons!2253) (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) (bvslt (_1!1656 (h!2874 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))))) key!828)))))

(declare-fun b!177606 () Bool)

(assert (=> b!177606 (= e!117095 (containsKey!198 (t!7080 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))) key!828))))

(assert (= (and d!53679 (not res!84146)) b!177605))

(assert (= (and b!177605 res!84147) b!177606))

(declare-fun m!205639 () Bool)

(assert (=> b!177606 m!205639))

(assert (=> d!53611 d!53679))

(declare-fun d!53681 () Bool)

(declare-fun e!117096 () Bool)

(assert (=> d!53681 e!117096))

(declare-fun res!84148 () Bool)

(assert (=> d!53681 (=> res!84148 e!117096)))

(declare-fun lt!87675 () Bool)

(assert (=> d!53681 (= res!84148 (not lt!87675))))

(declare-fun lt!87673 () Bool)

(assert (=> d!53681 (= lt!87675 lt!87673)))

(declare-fun lt!87672 () Unit!5397)

(declare-fun e!117097 () Unit!5397)

(assert (=> d!53681 (= lt!87672 e!117097)))

(declare-fun c!31811 () Bool)

(assert (=> d!53681 (= c!31811 lt!87673)))

(assert (=> d!53681 (= lt!87673 (containsKey!198 (toList!1120 lt!87559) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53681 (= (contains!1191 lt!87559 #b0000000000000000000000000000000000000000000000000000000000000000) lt!87675)))

(declare-fun b!177607 () Bool)

(declare-fun lt!87674 () Unit!5397)

(assert (=> b!177607 (= e!117097 lt!87674)))

(assert (=> b!177607 (= lt!87674 (lemmaContainsKeyImpliesGetValueByKeyDefined!147 (toList!1120 lt!87559) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177607 (isDefined!148 (getValueByKey!194 (toList!1120 lt!87559) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177608 () Bool)

(declare-fun Unit!5403 () Unit!5397)

(assert (=> b!177608 (= e!117097 Unit!5403)))

(declare-fun b!177609 () Bool)

(assert (=> b!177609 (= e!117096 (isDefined!148 (getValueByKey!194 (toList!1120 lt!87559) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53681 c!31811) b!177607))

(assert (= (and d!53681 (not c!31811)) b!177608))

(assert (= (and d!53681 (not res!84148)) b!177609))

(declare-fun m!205641 () Bool)

(assert (=> d!53681 m!205641))

(declare-fun m!205643 () Bool)

(assert (=> b!177607 m!205643))

(assert (=> b!177607 m!205597))

(assert (=> b!177607 m!205597))

(declare-fun m!205645 () Bool)

(assert (=> b!177607 m!205645))

(assert (=> b!177609 m!205597))

(assert (=> b!177609 m!205597))

(assert (=> b!177609 m!205645))

(assert (=> bm!17933 d!53681))

(declare-fun d!53683 () Bool)

(declare-fun e!117098 () Bool)

(assert (=> d!53683 e!117098))

(declare-fun res!84149 () Bool)

(assert (=> d!53683 (=> res!84149 e!117098)))

(declare-fun lt!87679 () Bool)

(assert (=> d!53683 (= res!84149 (not lt!87679))))

(declare-fun lt!87677 () Bool)

(assert (=> d!53683 (= lt!87679 lt!87677)))

(declare-fun lt!87676 () Unit!5397)

(declare-fun e!117099 () Unit!5397)

(assert (=> d!53683 (= lt!87676 e!117099)))

(declare-fun c!31812 () Bool)

(assert (=> d!53683 (= c!31812 lt!87677)))

(assert (=> d!53683 (= lt!87677 (containsKey!198 (toList!1120 lt!87559) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53683 (= (contains!1191 lt!87559 #b1000000000000000000000000000000000000000000000000000000000000000) lt!87679)))

(declare-fun b!177610 () Bool)

(declare-fun lt!87678 () Unit!5397)

(assert (=> b!177610 (= e!117099 lt!87678)))

(assert (=> b!177610 (= lt!87678 (lemmaContainsKeyImpliesGetValueByKeyDefined!147 (toList!1120 lt!87559) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177610 (isDefined!148 (getValueByKey!194 (toList!1120 lt!87559) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177611 () Bool)

(declare-fun Unit!5404 () Unit!5397)

(assert (=> b!177611 (= e!117099 Unit!5404)))

(declare-fun b!177612 () Bool)

(assert (=> b!177612 (= e!117098 (isDefined!148 (getValueByKey!194 (toList!1120 lt!87559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53683 c!31812) b!177610))

(assert (= (and d!53683 (not c!31812)) b!177611))

(assert (= (and d!53683 (not res!84149)) b!177612))

(declare-fun m!205647 () Bool)

(assert (=> d!53683 m!205647))

(declare-fun m!205649 () Bool)

(assert (=> b!177610 m!205649))

(assert (=> b!177610 m!205581))

(assert (=> b!177610 m!205581))

(declare-fun m!205651 () Bool)

(assert (=> b!177610 m!205651))

(assert (=> b!177612 m!205581))

(assert (=> b!177612 m!205581))

(assert (=> b!177612 m!205651))

(assert (=> bm!17935 d!53683))

(declare-fun b!177625 () Bool)

(declare-fun e!117108 () SeekEntryResult!579)

(assert (=> b!177625 (= e!117108 Undefined!579)))

(declare-fun b!177626 () Bool)

(declare-fun e!117107 () SeekEntryResult!579)

(assert (=> b!177626 (= e!117107 (MissingVacant!579 (index!4486 lt!87500)))))

(declare-fun b!177627 () Bool)

(declare-fun e!117106 () SeekEntryResult!579)

(assert (=> b!177627 (= e!117108 e!117106)))

(declare-fun c!31820 () Bool)

(declare-fun lt!87684 () (_ BitVec 64))

(assert (=> b!177627 (= c!31820 (= lt!87684 key!828))))

(declare-fun b!177628 () Bool)

(declare-fun c!31821 () Bool)

(assert (=> b!177628 (= c!31821 (= lt!87684 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177628 (= e!117106 e!117107)))

(declare-fun b!177629 () Bool)

(assert (=> b!177629 (= e!117107 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19476 lt!87500) #b00000000000000000000000000000001) (nextIndex!0 (index!4486 lt!87500) (x!19476 lt!87500) (mask!8593 thiss!1248)) (index!4486 lt!87500) key!828 (_keys!5521 thiss!1248) (mask!8593 thiss!1248)))))

(declare-fun b!177630 () Bool)

(assert (=> b!177630 (= e!117106 (Found!579 (index!4486 lt!87500)))))

(declare-fun d!53685 () Bool)

(declare-fun lt!87685 () SeekEntryResult!579)

(assert (=> d!53685 (and (or ((_ is Undefined!579) lt!87685) (not ((_ is Found!579) lt!87685)) (and (bvsge (index!4485 lt!87685) #b00000000000000000000000000000000) (bvslt (index!4485 lt!87685) (size!3837 (_keys!5521 thiss!1248))))) (or ((_ is Undefined!579) lt!87685) ((_ is Found!579) lt!87685) (not ((_ is MissingVacant!579) lt!87685)) (not (= (index!4487 lt!87685) (index!4486 lt!87500))) (and (bvsge (index!4487 lt!87685) #b00000000000000000000000000000000) (bvslt (index!4487 lt!87685) (size!3837 (_keys!5521 thiss!1248))))) (or ((_ is Undefined!579) lt!87685) (ite ((_ is Found!579) lt!87685) (= (select (arr!3532 (_keys!5521 thiss!1248)) (index!4485 lt!87685)) key!828) (and ((_ is MissingVacant!579) lt!87685) (= (index!4487 lt!87685) (index!4486 lt!87500)) (= (select (arr!3532 (_keys!5521 thiss!1248)) (index!4487 lt!87685)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53685 (= lt!87685 e!117108)))

(declare-fun c!31819 () Bool)

(assert (=> d!53685 (= c!31819 (bvsge (x!19476 lt!87500) #b01111111111111111111111111111110))))

(assert (=> d!53685 (= lt!87684 (select (arr!3532 (_keys!5521 thiss!1248)) (index!4486 lt!87500)))))

(assert (=> d!53685 (validMask!0 (mask!8593 thiss!1248))))

(assert (=> d!53685 (= (seekKeyOrZeroReturnVacant!0 (x!19476 lt!87500) (index!4486 lt!87500) (index!4486 lt!87500) key!828 (_keys!5521 thiss!1248) (mask!8593 thiss!1248)) lt!87685)))

(assert (= (and d!53685 c!31819) b!177625))

(assert (= (and d!53685 (not c!31819)) b!177627))

(assert (= (and b!177627 c!31820) b!177630))

(assert (= (and b!177627 (not c!31820)) b!177628))

(assert (= (and b!177628 c!31821) b!177626))

(assert (= (and b!177628 (not c!31821)) b!177629))

(declare-fun m!205653 () Bool)

(assert (=> b!177629 m!205653))

(assert (=> b!177629 m!205653))

(declare-fun m!205655 () Bool)

(assert (=> b!177629 m!205655))

(declare-fun m!205657 () Bool)

(assert (=> d!53685 m!205657))

(declare-fun m!205659 () Bool)

(assert (=> d!53685 m!205659))

(assert (=> d!53685 m!205379))

(assert (=> d!53685 m!205313))

(assert (=> b!177355 d!53685))

(declare-fun d!53687 () Bool)

(assert (=> d!53687 (isDefined!148 (getValueByKey!194 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(declare-fun lt!87688 () Unit!5397)

(declare-fun choose!955 (List!2257 (_ BitVec 64)) Unit!5397)

(assert (=> d!53687 (= lt!87688 (choose!955 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(declare-fun e!117111 () Bool)

(assert (=> d!53687 e!117111))

(declare-fun res!84152 () Bool)

(assert (=> d!53687 (=> (not res!84152) (not e!117111))))

(declare-fun isStrictlySorted!332 (List!2257) Bool)

(assert (=> d!53687 (= res!84152 (isStrictlySorted!332 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248)))))))

(assert (=> d!53687 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!147 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828) lt!87688)))

(declare-fun b!177633 () Bool)

(assert (=> b!177633 (= e!117111 (containsKey!198 (toList!1120 (getCurrentListMap!756 (_keys!5521 thiss!1248) (_values!3637 thiss!1248) (mask!8593 thiss!1248) (extraKeys!3391 thiss!1248) (zeroValue!3495 thiss!1248) (minValue!3495 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3654 thiss!1248))) key!828))))

(assert (= (and d!53687 res!84152) b!177633))

(assert (=> d!53687 m!205385))

(assert (=> d!53687 m!205385))

(assert (=> d!53687 m!205387))

(declare-fun m!205661 () Bool)

(assert (=> d!53687 m!205661))

(declare-fun m!205663 () Bool)

(assert (=> d!53687 m!205663))

(assert (=> b!177633 m!205381))

(assert (=> b!177364 d!53687))

(assert (=> b!177364 d!53649))

(assert (=> b!177364 d!53651))

(declare-fun b!177634 () Bool)

(declare-fun e!117112 () Bool)

(assert (=> b!177634 (= e!117112 tp_is_empty!4159)))

(declare-fun b!177635 () Bool)

(declare-fun e!117113 () Bool)

(assert (=> b!177635 (= e!117113 tp_is_empty!4159)))

(declare-fun mapNonEmpty!7114 () Bool)

(declare-fun mapRes!7114 () Bool)

(declare-fun tp!15880 () Bool)

(assert (=> mapNonEmpty!7114 (= mapRes!7114 (and tp!15880 e!117112))))

(declare-fun mapValue!7114 () ValueCell!1736)

(declare-fun mapRest!7114 () (Array (_ BitVec 32) ValueCell!1736))

(declare-fun mapKey!7114 () (_ BitVec 32))

(assert (=> mapNonEmpty!7114 (= mapRest!7113 (store mapRest!7114 mapKey!7114 mapValue!7114))))

(declare-fun condMapEmpty!7114 () Bool)

(declare-fun mapDefault!7114 () ValueCell!1736)

(assert (=> mapNonEmpty!7113 (= condMapEmpty!7114 (= mapRest!7113 ((as const (Array (_ BitVec 32) ValueCell!1736)) mapDefault!7114)))))

(assert (=> mapNonEmpty!7113 (= tp!15879 (and e!117113 mapRes!7114))))

(declare-fun mapIsEmpty!7114 () Bool)

(assert (=> mapIsEmpty!7114 mapRes!7114))

(assert (= (and mapNonEmpty!7113 condMapEmpty!7114) mapIsEmpty!7114))

(assert (= (and mapNonEmpty!7113 (not condMapEmpty!7114)) mapNonEmpty!7114))

(assert (= (and mapNonEmpty!7114 ((_ is ValueCellFull!1736) mapValue!7114)) b!177634))

(assert (= (and mapNonEmpty!7113 ((_ is ValueCellFull!1736) mapDefault!7114)) b!177635))

(declare-fun m!205665 () Bool)

(assert (=> mapNonEmpty!7114 m!205665))

(declare-fun b_lambda!7045 () Bool)

(assert (= b_lambda!7043 (or (and b!177268 b_free!4387) b_lambda!7045)))

(declare-fun b_lambda!7047 () Bool)

(assert (= b_lambda!7041 (or (and b!177268 b_free!4387) b_lambda!7047)))

(check-sat (not d!53637) (not b!177606) (not b!177592) (not b_next!4387) (not b!177452) (not b!177598) (not b!177481) (not b!177495) (not d!53681) (not d!53629) (not d!53625) (not d!53623) (not d!53631) (not d!53639) (not d!53633) (not d!53635) tp_is_empty!4159 (not d!53653) (not d!53687) (not d!53685) (not b!177597) b_and!10873 (not b!177584) (not b!177633) (not d!53667) (not d!53677) (not b!177482) (not d!53647) (not b!177504) (not b!177593) (not b!177454) (not d!53627) (not d!53649) (not bm!17947) (not d!53673) (not bm!17944) (not d!53643) (not b!177596) (not b!177629) (not b!177520) (not d!53621) (not b_lambda!7045) (not b!177483) (not b!177531) (not b!177542) (not d!53645) (not b!177587) (not mapNonEmpty!7114) (not b!177607) (not b!177612) (not d!53641) (not bm!17941) (not b!177489) (not b!177503) (not b!177508) (not d!53661) (not b!177506) (not b!177570) (not b!177480) (not b!177545) (not d!53675) (not b!177600) (not b!177490) (not b!177532) (not b!177479) (not b!177509) (not b!177583) (not b!177610) (not b!177484) (not b!177505) (not b!177451) (not d!53669) (not b_lambda!7039) (not d!53683) (not b!177595) (not b!177496) (not d!53659) (not bm!17950) (not b_lambda!7047) (not b!177594) (not d!53619) (not b!177609) (not d!53617))
(check-sat b_and!10873 (not b_next!4387))
