; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17590 () Bool)

(assert start!17590)

(declare-fun b!176017 () Bool)

(declare-fun b_free!4347 () Bool)

(declare-fun b_next!4347 () Bool)

(assert (=> b!176017 (= b_free!4347 (not b_next!4347))))

(declare-fun tp!15728 () Bool)

(declare-fun b_and!10835 () Bool)

(assert (=> b!176017 (= tp!15728 b_and!10835)))

(declare-fun b!176014 () Bool)

(declare-fun res!83424 () Bool)

(declare-fun e!116153 () Bool)

(assert (=> b!176014 (=> (not res!83424) (not e!116153))))

(declare-datatypes ((V!5139 0))(
  ( (V!5140 (val!2104 Int)) )
))
(declare-datatypes ((ValueCell!1716 0))(
  ( (ValueCellFull!1716 (v!3980 V!5139)) (EmptyCell!1716) )
))
(declare-datatypes ((array!7381 0))(
  ( (array!7382 (arr!3503 (Array (_ BitVec 32) (_ BitVec 64))) (size!3806 (_ BitVec 32))) )
))
(declare-datatypes ((array!7383 0))(
  ( (array!7384 (arr!3504 (Array (_ BitVec 32) ValueCell!1716)) (size!3807 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2340 0))(
  ( (LongMapFixedSize!2341 (defaultEntry!3628 Int) (mask!8537 (_ BitVec 32)) (extraKeys!3365 (_ BitVec 32)) (zeroValue!3469 V!5139) (minValue!3469 V!5139) (_size!1219 (_ BitVec 32)) (_keys!5485 array!7381) (_values!3611 array!7383) (_vacant!1219 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2340)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3272 0))(
  ( (tuple2!3273 (_1!1647 (_ BitVec 64)) (_2!1647 V!5139)) )
))
(declare-datatypes ((List!2228 0))(
  ( (Nil!2225) (Cons!2224 (h!2844 tuple2!3272) (t!7050 List!2228)) )
))
(declare-datatypes ((ListLongMap!2199 0))(
  ( (ListLongMap!2200 (toList!1115 List!2228)) )
))
(declare-fun contains!1177 (ListLongMap!2199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!767 (array!7381 array!7383 (_ BitVec 32) (_ BitVec 32) V!5139 V!5139 (_ BitVec 32) Int) ListLongMap!2199)

(assert (=> b!176014 (= res!83424 (contains!1177 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)) key!828))))

(declare-fun b!176015 () Bool)

(assert (=> b!176015 (= e!116153 (and (= (size!3807 (_values!3611 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8537 thiss!1248))) (= (size!3806 (_keys!5485 thiss!1248)) (size!3807 (_values!3611 thiss!1248))) (bvsge (mask!8537 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3365 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3365 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!176016 () Bool)

(declare-fun e!116156 () Bool)

(declare-fun tp_is_empty!4119 () Bool)

(assert (=> b!176016 (= e!116156 tp_is_empty!4119)))

(declare-fun e!116155 () Bool)

(declare-fun e!116152 () Bool)

(declare-fun array_inv!2243 (array!7381) Bool)

(declare-fun array_inv!2244 (array!7383) Bool)

(assert (=> b!176017 (= e!116155 (and tp!15728 tp_is_empty!4119 (array_inv!2243 (_keys!5485 thiss!1248)) (array_inv!2244 (_values!3611 thiss!1248)) e!116152))))

(declare-fun mapIsEmpty!7028 () Bool)

(declare-fun mapRes!7028 () Bool)

(assert (=> mapIsEmpty!7028 mapRes!7028))

(declare-fun b!176018 () Bool)

(assert (=> b!176018 (= e!116152 (and e!116156 mapRes!7028))))

(declare-fun condMapEmpty!7028 () Bool)

(declare-fun mapDefault!7028 () ValueCell!1716)

(assert (=> b!176018 (= condMapEmpty!7028 (= (arr!3504 (_values!3611 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1716)) mapDefault!7028)))))

(declare-fun b!176019 () Bool)

(declare-fun res!83423 () Bool)

(assert (=> b!176019 (=> (not res!83423) (not e!116153))))

(assert (=> b!176019 (= res!83423 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176020 () Bool)

(declare-fun res!83426 () Bool)

(assert (=> b!176020 (=> (not res!83426) (not e!116153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176020 (= res!83426 (validMask!0 (mask!8537 thiss!1248)))))

(declare-fun mapNonEmpty!7028 () Bool)

(declare-fun tp!15727 () Bool)

(declare-fun e!116154 () Bool)

(assert (=> mapNonEmpty!7028 (= mapRes!7028 (and tp!15727 e!116154))))

(declare-fun mapKey!7028 () (_ BitVec 32))

(declare-fun mapRest!7028 () (Array (_ BitVec 32) ValueCell!1716))

(declare-fun mapValue!7028 () ValueCell!1716)

(assert (=> mapNonEmpty!7028 (= (arr!3504 (_values!3611 thiss!1248)) (store mapRest!7028 mapKey!7028 mapValue!7028))))

(declare-fun res!83425 () Bool)

(assert (=> start!17590 (=> (not res!83425) (not e!116153))))

(declare-fun valid!985 (LongMapFixedSize!2340) Bool)

(assert (=> start!17590 (= res!83425 (valid!985 thiss!1248))))

(assert (=> start!17590 e!116153))

(assert (=> start!17590 e!116155))

(assert (=> start!17590 true))

(declare-fun b!176021 () Bool)

(assert (=> b!176021 (= e!116154 tp_is_empty!4119)))

(declare-fun b!176022 () Bool)

(declare-fun res!83427 () Bool)

(assert (=> b!176022 (=> (not res!83427) (not e!116153))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!553 0))(
  ( (MissingZero!553 (index!4380 (_ BitVec 32))) (Found!553 (index!4381 (_ BitVec 32))) (Intermediate!553 (undefined!1365 Bool) (index!4382 (_ BitVec 32)) (x!19337 (_ BitVec 32))) (Undefined!553) (MissingVacant!553 (index!4383 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7381 (_ BitVec 32)) SeekEntryResult!553)

(assert (=> b!176022 (= res!83427 ((_ is Undefined!553) (seekEntryOrOpen!0 key!828 (_keys!5485 thiss!1248) (mask!8537 thiss!1248))))))

(assert (= (and start!17590 res!83425) b!176019))

(assert (= (and b!176019 res!83423) b!176022))

(assert (= (and b!176022 res!83427) b!176014))

(assert (= (and b!176014 res!83424) b!176020))

(assert (= (and b!176020 res!83426) b!176015))

(assert (= (and b!176018 condMapEmpty!7028) mapIsEmpty!7028))

(assert (= (and b!176018 (not condMapEmpty!7028)) mapNonEmpty!7028))

(assert (= (and mapNonEmpty!7028 ((_ is ValueCellFull!1716) mapValue!7028)) b!176021))

(assert (= (and b!176018 ((_ is ValueCellFull!1716) mapDefault!7028)) b!176016))

(assert (= b!176017 b!176018))

(assert (= start!17590 b!176017))

(declare-fun m!204873 () Bool)

(assert (=> b!176020 m!204873))

(declare-fun m!204875 () Bool)

(assert (=> mapNonEmpty!7028 m!204875))

(declare-fun m!204877 () Bool)

(assert (=> b!176014 m!204877))

(assert (=> b!176014 m!204877))

(declare-fun m!204879 () Bool)

(assert (=> b!176014 m!204879))

(declare-fun m!204881 () Bool)

(assert (=> b!176017 m!204881))

(declare-fun m!204883 () Bool)

(assert (=> b!176017 m!204883))

(declare-fun m!204885 () Bool)

(assert (=> b!176022 m!204885))

(declare-fun m!204887 () Bool)

(assert (=> start!17590 m!204887))

(check-sat b_and!10835 (not b!176022) (not b!176017) (not b!176020) (not b_next!4347) tp_is_empty!4119 (not start!17590) (not b!176014) (not mapNonEmpty!7028))
(check-sat b_and!10835 (not b_next!4347))
(get-model)

(declare-fun d!53579 () Bool)

(assert (=> d!53579 (= (array_inv!2243 (_keys!5485 thiss!1248)) (bvsge (size!3806 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176017 d!53579))

(declare-fun d!53581 () Bool)

(assert (=> d!53581 (= (array_inv!2244 (_values!3611 thiss!1248)) (bvsge (size!3807 (_values!3611 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176017 d!53581))

(declare-fun d!53583 () Bool)

(declare-fun res!83449 () Bool)

(declare-fun e!116178 () Bool)

(assert (=> d!53583 (=> (not res!83449) (not e!116178))))

(declare-fun simpleValid!150 (LongMapFixedSize!2340) Bool)

(assert (=> d!53583 (= res!83449 (simpleValid!150 thiss!1248))))

(assert (=> d!53583 (= (valid!985 thiss!1248) e!116178)))

(declare-fun b!176056 () Bool)

(declare-fun res!83450 () Bool)

(assert (=> b!176056 (=> (not res!83450) (not e!116178))))

(declare-fun arrayCountValidKeys!0 (array!7381 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176056 (= res!83450 (= (arrayCountValidKeys!0 (_keys!5485 thiss!1248) #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))) (_size!1219 thiss!1248)))))

(declare-fun b!176057 () Bool)

(declare-fun res!83451 () Bool)

(assert (=> b!176057 (=> (not res!83451) (not e!116178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7381 (_ BitVec 32)) Bool)

(assert (=> b!176057 (= res!83451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5485 thiss!1248) (mask!8537 thiss!1248)))))

(declare-fun b!176058 () Bool)

(declare-datatypes ((List!2230 0))(
  ( (Nil!2227) (Cons!2226 (h!2846 (_ BitVec 64)) (t!7054 List!2230)) )
))
(declare-fun arrayNoDuplicates!0 (array!7381 (_ BitVec 32) List!2230) Bool)

(assert (=> b!176058 (= e!116178 (arrayNoDuplicates!0 (_keys!5485 thiss!1248) #b00000000000000000000000000000000 Nil!2227))))

(assert (= (and d!53583 res!83449) b!176056))

(assert (= (and b!176056 res!83450) b!176057))

(assert (= (and b!176057 res!83451) b!176058))

(declare-fun m!204905 () Bool)

(assert (=> d!53583 m!204905))

(declare-fun m!204907 () Bool)

(assert (=> b!176056 m!204907))

(declare-fun m!204909 () Bool)

(assert (=> b!176057 m!204909))

(declare-fun m!204911 () Bool)

(assert (=> b!176058 m!204911))

(assert (=> start!17590 d!53583))

(declare-fun d!53585 () Bool)

(assert (=> d!53585 (= (validMask!0 (mask!8537 thiss!1248)) (and (or (= (mask!8537 thiss!1248) #b00000000000000000000000000000111) (= (mask!8537 thiss!1248) #b00000000000000000000000000001111) (= (mask!8537 thiss!1248) #b00000000000000000000000000011111) (= (mask!8537 thiss!1248) #b00000000000000000000000000111111) (= (mask!8537 thiss!1248) #b00000000000000000000000001111111) (= (mask!8537 thiss!1248) #b00000000000000000000000011111111) (= (mask!8537 thiss!1248) #b00000000000000000000000111111111) (= (mask!8537 thiss!1248) #b00000000000000000000001111111111) (= (mask!8537 thiss!1248) #b00000000000000000000011111111111) (= (mask!8537 thiss!1248) #b00000000000000000000111111111111) (= (mask!8537 thiss!1248) #b00000000000000000001111111111111) (= (mask!8537 thiss!1248) #b00000000000000000011111111111111) (= (mask!8537 thiss!1248) #b00000000000000000111111111111111) (= (mask!8537 thiss!1248) #b00000000000000001111111111111111) (= (mask!8537 thiss!1248) #b00000000000000011111111111111111) (= (mask!8537 thiss!1248) #b00000000000000111111111111111111) (= (mask!8537 thiss!1248) #b00000000000001111111111111111111) (= (mask!8537 thiss!1248) #b00000000000011111111111111111111) (= (mask!8537 thiss!1248) #b00000000000111111111111111111111) (= (mask!8537 thiss!1248) #b00000000001111111111111111111111) (= (mask!8537 thiss!1248) #b00000000011111111111111111111111) (= (mask!8537 thiss!1248) #b00000000111111111111111111111111) (= (mask!8537 thiss!1248) #b00000001111111111111111111111111) (= (mask!8537 thiss!1248) #b00000011111111111111111111111111) (= (mask!8537 thiss!1248) #b00000111111111111111111111111111) (= (mask!8537 thiss!1248) #b00001111111111111111111111111111) (= (mask!8537 thiss!1248) #b00011111111111111111111111111111) (= (mask!8537 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8537 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176020 d!53585))

(declare-fun b!176071 () Bool)

(declare-fun e!116185 () SeekEntryResult!553)

(declare-fun lt!87089 () SeekEntryResult!553)

(assert (=> b!176071 (= e!116185 (MissingZero!553 (index!4382 lt!87089)))))

(declare-fun b!176072 () Bool)

(declare-fun e!116186 () SeekEntryResult!553)

(assert (=> b!176072 (= e!116186 Undefined!553)))

(declare-fun b!176073 () Bool)

(declare-fun e!116187 () SeekEntryResult!553)

(assert (=> b!176073 (= e!116187 (Found!553 (index!4382 lt!87089)))))

(declare-fun d!53587 () Bool)

(declare-fun lt!87090 () SeekEntryResult!553)

(assert (=> d!53587 (and (or ((_ is Undefined!553) lt!87090) (not ((_ is Found!553) lt!87090)) (and (bvsge (index!4381 lt!87090) #b00000000000000000000000000000000) (bvslt (index!4381 lt!87090) (size!3806 (_keys!5485 thiss!1248))))) (or ((_ is Undefined!553) lt!87090) ((_ is Found!553) lt!87090) (not ((_ is MissingZero!553) lt!87090)) (and (bvsge (index!4380 lt!87090) #b00000000000000000000000000000000) (bvslt (index!4380 lt!87090) (size!3806 (_keys!5485 thiss!1248))))) (or ((_ is Undefined!553) lt!87090) ((_ is Found!553) lt!87090) ((_ is MissingZero!553) lt!87090) (not ((_ is MissingVacant!553) lt!87090)) (and (bvsge (index!4383 lt!87090) #b00000000000000000000000000000000) (bvslt (index!4383 lt!87090) (size!3806 (_keys!5485 thiss!1248))))) (or ((_ is Undefined!553) lt!87090) (ite ((_ is Found!553) lt!87090) (= (select (arr!3503 (_keys!5485 thiss!1248)) (index!4381 lt!87090)) key!828) (ite ((_ is MissingZero!553) lt!87090) (= (select (arr!3503 (_keys!5485 thiss!1248)) (index!4380 lt!87090)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!553) lt!87090) (= (select (arr!3503 (_keys!5485 thiss!1248)) (index!4383 lt!87090)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53587 (= lt!87090 e!116186)))

(declare-fun c!31550 () Bool)

(assert (=> d!53587 (= c!31550 (and ((_ is Intermediate!553) lt!87089) (undefined!1365 lt!87089)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7381 (_ BitVec 32)) SeekEntryResult!553)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53587 (= lt!87089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8537 thiss!1248)) key!828 (_keys!5485 thiss!1248) (mask!8537 thiss!1248)))))

(assert (=> d!53587 (validMask!0 (mask!8537 thiss!1248))))

(assert (=> d!53587 (= (seekEntryOrOpen!0 key!828 (_keys!5485 thiss!1248) (mask!8537 thiss!1248)) lt!87090)))

(declare-fun b!176074 () Bool)

(assert (=> b!176074 (= e!116186 e!116187)))

(declare-fun lt!87091 () (_ BitVec 64))

(assert (=> b!176074 (= lt!87091 (select (arr!3503 (_keys!5485 thiss!1248)) (index!4382 lt!87089)))))

(declare-fun c!31551 () Bool)

(assert (=> b!176074 (= c!31551 (= lt!87091 key!828))))

(declare-fun b!176075 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7381 (_ BitVec 32)) SeekEntryResult!553)

(assert (=> b!176075 (= e!116185 (seekKeyOrZeroReturnVacant!0 (x!19337 lt!87089) (index!4382 lt!87089) (index!4382 lt!87089) key!828 (_keys!5485 thiss!1248) (mask!8537 thiss!1248)))))

(declare-fun b!176076 () Bool)

(declare-fun c!31549 () Bool)

(assert (=> b!176076 (= c!31549 (= lt!87091 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176076 (= e!116187 e!116185)))

(assert (= (and d!53587 c!31550) b!176072))

(assert (= (and d!53587 (not c!31550)) b!176074))

(assert (= (and b!176074 c!31551) b!176073))

(assert (= (and b!176074 (not c!31551)) b!176076))

(assert (= (and b!176076 c!31549) b!176071))

(assert (= (and b!176076 (not c!31549)) b!176075))

(declare-fun m!204913 () Bool)

(assert (=> d!53587 m!204913))

(declare-fun m!204915 () Bool)

(assert (=> d!53587 m!204915))

(assert (=> d!53587 m!204913))

(assert (=> d!53587 m!204873))

(declare-fun m!204917 () Bool)

(assert (=> d!53587 m!204917))

(declare-fun m!204919 () Bool)

(assert (=> d!53587 m!204919))

(declare-fun m!204921 () Bool)

(assert (=> d!53587 m!204921))

(declare-fun m!204923 () Bool)

(assert (=> b!176074 m!204923))

(declare-fun m!204925 () Bool)

(assert (=> b!176075 m!204925))

(assert (=> b!176022 d!53587))

(declare-fun d!53589 () Bool)

(declare-fun e!116193 () Bool)

(assert (=> d!53589 e!116193))

(declare-fun res!83454 () Bool)

(assert (=> d!53589 (=> res!83454 e!116193)))

(declare-fun lt!87102 () Bool)

(assert (=> d!53589 (= res!83454 (not lt!87102))))

(declare-fun lt!87103 () Bool)

(assert (=> d!53589 (= lt!87102 lt!87103)))

(declare-datatypes ((Unit!5396 0))(
  ( (Unit!5397) )
))
(declare-fun lt!87100 () Unit!5396)

(declare-fun e!116192 () Unit!5396)

(assert (=> d!53589 (= lt!87100 e!116192)))

(declare-fun c!31554 () Bool)

(assert (=> d!53589 (= c!31554 lt!87103)))

(declare-fun containsKey!195 (List!2228 (_ BitVec 64)) Bool)

(assert (=> d!53589 (= lt!87103 (containsKey!195 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828))))

(assert (=> d!53589 (= (contains!1177 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)) key!828) lt!87102)))

(declare-fun b!176083 () Bool)

(declare-fun lt!87101 () Unit!5396)

(assert (=> b!176083 (= e!116192 lt!87101)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!143 (List!2228 (_ BitVec 64)) Unit!5396)

(assert (=> b!176083 (= lt!87101 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828))))

(declare-datatypes ((Option!197 0))(
  ( (Some!196 (v!3982 V!5139)) (None!195) )
))
(declare-fun isDefined!144 (Option!197) Bool)

(declare-fun getValueByKey!191 (List!2228 (_ BitVec 64)) Option!197)

(assert (=> b!176083 (isDefined!144 (getValueByKey!191 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828))))

(declare-fun b!176084 () Bool)

(declare-fun Unit!5398 () Unit!5396)

(assert (=> b!176084 (= e!116192 Unit!5398)))

(declare-fun b!176085 () Bool)

(assert (=> b!176085 (= e!116193 (isDefined!144 (getValueByKey!191 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828)))))

(assert (= (and d!53589 c!31554) b!176083))

(assert (= (and d!53589 (not c!31554)) b!176084))

(assert (= (and d!53589 (not res!83454)) b!176085))

(declare-fun m!204927 () Bool)

(assert (=> d!53589 m!204927))

(declare-fun m!204929 () Bool)

(assert (=> b!176083 m!204929))

(declare-fun m!204931 () Bool)

(assert (=> b!176083 m!204931))

(assert (=> b!176083 m!204931))

(declare-fun m!204933 () Bool)

(assert (=> b!176083 m!204933))

(assert (=> b!176085 m!204931))

(assert (=> b!176085 m!204931))

(assert (=> b!176085 m!204933))

(assert (=> b!176014 d!53589))

(declare-fun b!176128 () Bool)

(declare-fun e!116220 () Unit!5396)

(declare-fun lt!87162 () Unit!5396)

(assert (=> b!176128 (= e!116220 lt!87162)))

(declare-fun lt!87158 () ListLongMap!2199)

(declare-fun getCurrentListMapNoExtraKeys!169 (array!7381 array!7383 (_ BitVec 32) (_ BitVec 32) V!5139 V!5139 (_ BitVec 32) Int) ListLongMap!2199)

(assert (=> b!176128 (= lt!87158 (getCurrentListMapNoExtraKeys!169 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))))

(declare-fun lt!87151 () (_ BitVec 64))

(assert (=> b!176128 (= lt!87151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87167 () (_ BitVec 64))

(assert (=> b!176128 (= lt!87167 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87161 () Unit!5396)

(declare-fun addStillContains!112 (ListLongMap!2199 (_ BitVec 64) V!5139 (_ BitVec 64)) Unit!5396)

(assert (=> b!176128 (= lt!87161 (addStillContains!112 lt!87158 lt!87151 (zeroValue!3469 thiss!1248) lt!87167))))

(declare-fun +!253 (ListLongMap!2199 tuple2!3272) ListLongMap!2199)

(assert (=> b!176128 (contains!1177 (+!253 lt!87158 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248))) lt!87167)))

(declare-fun lt!87157 () Unit!5396)

(assert (=> b!176128 (= lt!87157 lt!87161)))

(declare-fun lt!87163 () ListLongMap!2199)

(assert (=> b!176128 (= lt!87163 (getCurrentListMapNoExtraKeys!169 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))))

(declare-fun lt!87159 () (_ BitVec 64))

(assert (=> b!176128 (= lt!87159 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87152 () (_ BitVec 64))

(assert (=> b!176128 (= lt!87152 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87148 () Unit!5396)

(declare-fun addApplyDifferent!112 (ListLongMap!2199 (_ BitVec 64) V!5139 (_ BitVec 64)) Unit!5396)

(assert (=> b!176128 (= lt!87148 (addApplyDifferent!112 lt!87163 lt!87159 (minValue!3469 thiss!1248) lt!87152))))

(declare-fun apply!136 (ListLongMap!2199 (_ BitVec 64)) V!5139)

(assert (=> b!176128 (= (apply!136 (+!253 lt!87163 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248))) lt!87152) (apply!136 lt!87163 lt!87152))))

(declare-fun lt!87169 () Unit!5396)

(assert (=> b!176128 (= lt!87169 lt!87148)))

(declare-fun lt!87168 () ListLongMap!2199)

(assert (=> b!176128 (= lt!87168 (getCurrentListMapNoExtraKeys!169 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))))

(declare-fun lt!87150 () (_ BitVec 64))

(assert (=> b!176128 (= lt!87150 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87153 () (_ BitVec 64))

(assert (=> b!176128 (= lt!87153 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87154 () Unit!5396)

(assert (=> b!176128 (= lt!87154 (addApplyDifferent!112 lt!87168 lt!87150 (zeroValue!3469 thiss!1248) lt!87153))))

(assert (=> b!176128 (= (apply!136 (+!253 lt!87168 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248))) lt!87153) (apply!136 lt!87168 lt!87153))))

(declare-fun lt!87165 () Unit!5396)

(assert (=> b!176128 (= lt!87165 lt!87154)))

(declare-fun lt!87160 () ListLongMap!2199)

(assert (=> b!176128 (= lt!87160 (getCurrentListMapNoExtraKeys!169 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))))

(declare-fun lt!87155 () (_ BitVec 64))

(assert (=> b!176128 (= lt!87155 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87156 () (_ BitVec 64))

(assert (=> b!176128 (= lt!87156 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176128 (= lt!87162 (addApplyDifferent!112 lt!87160 lt!87155 (minValue!3469 thiss!1248) lt!87156))))

(assert (=> b!176128 (= (apply!136 (+!253 lt!87160 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248))) lt!87156) (apply!136 lt!87160 lt!87156))))

(declare-fun b!176129 () Bool)

(declare-fun c!31570 () Bool)

(assert (=> b!176129 (= c!31570 (and (not (= (bvand (extraKeys!3365 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3365 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!116230 () ListLongMap!2199)

(declare-fun e!116224 () ListLongMap!2199)

(assert (=> b!176129 (= e!116230 e!116224)))

(declare-fun b!176130 () Bool)

(declare-fun e!116225 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176130 (= e!116225 (validKeyInArray!0 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17824 () Bool)

(declare-fun call!17831 () Bool)

(declare-fun lt!87149 () ListLongMap!2199)

(assert (=> bm!17824 (= call!17831 (contains!1177 lt!87149 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176131 () Bool)

(declare-fun e!116223 () Bool)

(assert (=> b!176131 (= e!116223 (= (apply!136 lt!87149 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3469 thiss!1248)))))

(declare-fun b!176132 () Bool)

(declare-fun e!116222 () ListLongMap!2199)

(declare-fun call!17828 () ListLongMap!2199)

(assert (=> b!176132 (= e!116222 (+!253 call!17828 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))))))

(declare-fun b!176133 () Bool)

(declare-fun e!116232 () Bool)

(declare-fun e!116226 () Bool)

(assert (=> b!176133 (= e!116232 e!116226)))

(declare-fun res!83473 () Bool)

(assert (=> b!176133 (=> (not res!83473) (not e!116226))))

(assert (=> b!176133 (= res!83473 (contains!1177 lt!87149 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(declare-fun b!176134 () Bool)

(declare-fun e!116221 () Bool)

(assert (=> b!176134 (= e!116221 (not call!17831))))

(declare-fun b!176135 () Bool)

(declare-fun Unit!5399 () Unit!5396)

(assert (=> b!176135 (= e!116220 Unit!5399)))

(declare-fun b!176136 () Bool)

(declare-fun call!17830 () ListLongMap!2199)

(assert (=> b!176136 (= e!116224 call!17830)))

(declare-fun bm!17825 () Bool)

(declare-fun call!17832 () ListLongMap!2199)

(assert (=> bm!17825 (= call!17832 (getCurrentListMapNoExtraKeys!169 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))))

(declare-fun bm!17826 () Bool)

(declare-fun call!17833 () Bool)

(assert (=> bm!17826 (= call!17833 (contains!1177 lt!87149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17827 () Bool)

(assert (=> bm!17827 (= call!17830 call!17828)))

(declare-fun b!176138 () Bool)

(declare-fun e!116228 () Bool)

(assert (=> b!176138 (= e!116228 (not call!17833))))

(declare-fun c!31571 () Bool)

(declare-fun call!17827 () ListLongMap!2199)

(declare-fun c!31568 () Bool)

(declare-fun call!17829 () ListLongMap!2199)

(declare-fun bm!17828 () Bool)

(assert (=> bm!17828 (= call!17828 (+!253 (ite c!31568 call!17832 (ite c!31571 call!17829 call!17827)) (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))))))

(declare-fun b!176139 () Bool)

(declare-fun e!116229 () Bool)

(assert (=> b!176139 (= e!116221 e!116229)))

(declare-fun res!83478 () Bool)

(assert (=> b!176139 (= res!83478 call!17831)))

(assert (=> b!176139 (=> (not res!83478) (not e!116229))))

(declare-fun b!176140 () Bool)

(declare-fun get!1998 (ValueCell!1716 V!5139) V!5139)

(declare-fun dynLambda!479 (Int (_ BitVec 64)) V!5139)

(assert (=> b!176140 (= e!116226 (= (apply!136 lt!87149 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)) (get!1998 (select (arr!3504 (_values!3611 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3628 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3807 (_values!3611 thiss!1248))))))

(assert (=> b!176140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(declare-fun b!176141 () Bool)

(assert (=> b!176141 (= e!116224 call!17827)))

(declare-fun b!176142 () Bool)

(declare-fun e!116227 () Bool)

(assert (=> b!176142 (= e!116227 e!116221)))

(declare-fun c!31572 () Bool)

(assert (=> b!176142 (= c!31572 (not (= (bvand (extraKeys!3365 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!176143 () Bool)

(assert (=> b!176143 (= e!116228 e!116223)))

(declare-fun res!83475 () Bool)

(assert (=> b!176143 (= res!83475 call!17833)))

(assert (=> b!176143 (=> (not res!83475) (not e!116223))))

(declare-fun b!176144 () Bool)

(declare-fun res!83479 () Bool)

(assert (=> b!176144 (=> (not res!83479) (not e!116227))))

(assert (=> b!176144 (= res!83479 e!116228)))

(declare-fun c!31569 () Bool)

(assert (=> b!176144 (= c!31569 (not (= (bvand (extraKeys!3365 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!17829 () Bool)

(assert (=> bm!17829 (= call!17827 call!17829)))

(declare-fun b!176145 () Bool)

(assert (=> b!176145 (= e!116229 (= (apply!136 lt!87149 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3469 thiss!1248)))))

(declare-fun b!176146 () Bool)

(declare-fun res!83477 () Bool)

(assert (=> b!176146 (=> (not res!83477) (not e!116227))))

(assert (=> b!176146 (= res!83477 e!116232)))

(declare-fun res!83476 () Bool)

(assert (=> b!176146 (=> res!83476 e!116232)))

(declare-fun e!116231 () Bool)

(assert (=> b!176146 (= res!83476 (not e!116231))))

(declare-fun res!83480 () Bool)

(assert (=> b!176146 (=> (not res!83480) (not e!116231))))

(assert (=> b!176146 (= res!83480 (bvslt #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(declare-fun b!176147 () Bool)

(assert (=> b!176147 (= e!116231 (validKeyInArray!0 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17830 () Bool)

(assert (=> bm!17830 (= call!17829 call!17832)))

(declare-fun b!176148 () Bool)

(assert (=> b!176148 (= e!116230 call!17830)))

(declare-fun b!176137 () Bool)

(assert (=> b!176137 (= e!116222 e!116230)))

(assert (=> b!176137 (= c!31571 (and (not (= (bvand (extraKeys!3365 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3365 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!53591 () Bool)

(assert (=> d!53591 e!116227))

(declare-fun res!83474 () Bool)

(assert (=> d!53591 (=> (not res!83474) (not e!116227))))

(assert (=> d!53591 (= res!83474 (or (bvsge #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))))

(declare-fun lt!87166 () ListLongMap!2199)

(assert (=> d!53591 (= lt!87149 lt!87166)))

(declare-fun lt!87164 () Unit!5396)

(assert (=> d!53591 (= lt!87164 e!116220)))

(declare-fun c!31567 () Bool)

(assert (=> d!53591 (= c!31567 e!116225)))

(declare-fun res!83481 () Bool)

(assert (=> d!53591 (=> (not res!83481) (not e!116225))))

(assert (=> d!53591 (= res!83481 (bvslt #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(assert (=> d!53591 (= lt!87166 e!116222)))

(assert (=> d!53591 (= c!31568 (and (not (= (bvand (extraKeys!3365 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3365 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53591 (validMask!0 (mask!8537 thiss!1248))))

(assert (=> d!53591 (= (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)) lt!87149)))

(assert (= (and d!53591 c!31568) b!176132))

(assert (= (and d!53591 (not c!31568)) b!176137))

(assert (= (and b!176137 c!31571) b!176148))

(assert (= (and b!176137 (not c!31571)) b!176129))

(assert (= (and b!176129 c!31570) b!176136))

(assert (= (and b!176129 (not c!31570)) b!176141))

(assert (= (or b!176136 b!176141) bm!17829))

(assert (= (or b!176148 bm!17829) bm!17830))

(assert (= (or b!176148 b!176136) bm!17827))

(assert (= (or b!176132 bm!17830) bm!17825))

(assert (= (or b!176132 bm!17827) bm!17828))

(assert (= (and d!53591 res!83481) b!176130))

(assert (= (and d!53591 c!31567) b!176128))

(assert (= (and d!53591 (not c!31567)) b!176135))

(assert (= (and d!53591 res!83474) b!176146))

(assert (= (and b!176146 res!83480) b!176147))

(assert (= (and b!176146 (not res!83476)) b!176133))

(assert (= (and b!176133 res!83473) b!176140))

(assert (= (and b!176146 res!83477) b!176144))

(assert (= (and b!176144 c!31569) b!176143))

(assert (= (and b!176144 (not c!31569)) b!176138))

(assert (= (and b!176143 res!83475) b!176131))

(assert (= (or b!176143 b!176138) bm!17826))

(assert (= (and b!176144 res!83479) b!176142))

(assert (= (and b!176142 c!31572) b!176139))

(assert (= (and b!176142 (not c!31572)) b!176134))

(assert (= (and b!176139 res!83478) b!176145))

(assert (= (or b!176139 b!176134) bm!17824))

(declare-fun b_lambda!7027 () Bool)

(assert (=> (not b_lambda!7027) (not b!176140)))

(declare-fun t!7053 () Bool)

(declare-fun tb!2783 () Bool)

(assert (=> (and b!176017 (= (defaultEntry!3628 thiss!1248) (defaultEntry!3628 thiss!1248)) t!7053) tb!2783))

(declare-fun result!4623 () Bool)

(assert (=> tb!2783 (= result!4623 tp_is_empty!4119)))

(assert (=> b!176140 t!7053))

(declare-fun b_and!10839 () Bool)

(assert (= b_and!10835 (and (=> t!7053 result!4623) b_and!10839)))

(declare-fun m!204935 () Bool)

(assert (=> b!176131 m!204935))

(declare-fun m!204937 () Bool)

(assert (=> b!176132 m!204937))

(declare-fun m!204939 () Bool)

(assert (=> b!176140 m!204939))

(declare-fun m!204941 () Bool)

(assert (=> b!176140 m!204941))

(declare-fun m!204943 () Bool)

(assert (=> b!176140 m!204943))

(declare-fun m!204945 () Bool)

(assert (=> b!176140 m!204945))

(declare-fun m!204947 () Bool)

(assert (=> b!176140 m!204947))

(assert (=> b!176140 m!204939))

(assert (=> b!176140 m!204945))

(assert (=> b!176140 m!204943))

(declare-fun m!204949 () Bool)

(assert (=> bm!17828 m!204949))

(assert (=> b!176147 m!204939))

(assert (=> b!176147 m!204939))

(declare-fun m!204951 () Bool)

(assert (=> b!176147 m!204951))

(declare-fun m!204953 () Bool)

(assert (=> b!176145 m!204953))

(declare-fun m!204955 () Bool)

(assert (=> bm!17824 m!204955))

(assert (=> b!176133 m!204939))

(assert (=> b!176133 m!204939))

(declare-fun m!204957 () Bool)

(assert (=> b!176133 m!204957))

(assert (=> d!53591 m!204873))

(declare-fun m!204959 () Bool)

(assert (=> b!176128 m!204959))

(declare-fun m!204961 () Bool)

(assert (=> b!176128 m!204961))

(declare-fun m!204963 () Bool)

(assert (=> b!176128 m!204963))

(declare-fun m!204965 () Bool)

(assert (=> b!176128 m!204965))

(declare-fun m!204967 () Bool)

(assert (=> b!176128 m!204967))

(declare-fun m!204969 () Bool)

(assert (=> b!176128 m!204969))

(declare-fun m!204971 () Bool)

(assert (=> b!176128 m!204971))

(declare-fun m!204973 () Bool)

(assert (=> b!176128 m!204973))

(assert (=> b!176128 m!204939))

(declare-fun m!204975 () Bool)

(assert (=> b!176128 m!204975))

(declare-fun m!204977 () Bool)

(assert (=> b!176128 m!204977))

(declare-fun m!204979 () Bool)

(assert (=> b!176128 m!204979))

(declare-fun m!204981 () Bool)

(assert (=> b!176128 m!204981))

(declare-fun m!204983 () Bool)

(assert (=> b!176128 m!204983))

(declare-fun m!204985 () Bool)

(assert (=> b!176128 m!204985))

(assert (=> b!176128 m!204981))

(declare-fun m!204987 () Bool)

(assert (=> b!176128 m!204987))

(declare-fun m!204989 () Bool)

(assert (=> b!176128 m!204989))

(assert (=> b!176128 m!204969))

(assert (=> b!176128 m!204959))

(assert (=> b!176128 m!204965))

(assert (=> b!176130 m!204939))

(assert (=> b!176130 m!204939))

(assert (=> b!176130 m!204951))

(declare-fun m!204991 () Bool)

(assert (=> bm!17826 m!204991))

(assert (=> bm!17825 m!204963))

(assert (=> b!176014 d!53591))

(declare-fun b!176158 () Bool)

(declare-fun e!116237 () Bool)

(assert (=> b!176158 (= e!116237 tp_is_empty!4119)))

(declare-fun b!176157 () Bool)

(declare-fun e!116238 () Bool)

(assert (=> b!176157 (= e!116238 tp_is_empty!4119)))

(declare-fun condMapEmpty!7034 () Bool)

(declare-fun mapDefault!7034 () ValueCell!1716)

(assert (=> mapNonEmpty!7028 (= condMapEmpty!7034 (= mapRest!7028 ((as const (Array (_ BitVec 32) ValueCell!1716)) mapDefault!7034)))))

(declare-fun mapRes!7034 () Bool)

(assert (=> mapNonEmpty!7028 (= tp!15727 (and e!116237 mapRes!7034))))

(declare-fun mapIsEmpty!7034 () Bool)

(assert (=> mapIsEmpty!7034 mapRes!7034))

(declare-fun mapNonEmpty!7034 () Bool)

(declare-fun tp!15737 () Bool)

(assert (=> mapNonEmpty!7034 (= mapRes!7034 (and tp!15737 e!116238))))

(declare-fun mapKey!7034 () (_ BitVec 32))

(declare-fun mapValue!7034 () ValueCell!1716)

(declare-fun mapRest!7034 () (Array (_ BitVec 32) ValueCell!1716))

(assert (=> mapNonEmpty!7034 (= mapRest!7028 (store mapRest!7034 mapKey!7034 mapValue!7034))))

(assert (= (and mapNonEmpty!7028 condMapEmpty!7034) mapIsEmpty!7034))

(assert (= (and mapNonEmpty!7028 (not condMapEmpty!7034)) mapNonEmpty!7034))

(assert (= (and mapNonEmpty!7034 ((_ is ValueCellFull!1716) mapValue!7034)) b!176157))

(assert (= (and mapNonEmpty!7028 ((_ is ValueCellFull!1716) mapDefault!7034)) b!176158))

(declare-fun m!204993 () Bool)

(assert (=> mapNonEmpty!7034 m!204993))

(declare-fun b_lambda!7029 () Bool)

(assert (= b_lambda!7027 (or (and b!176017 b_free!4347) b_lambda!7029)))

(check-sat (not b!176056) (not b!176145) (not b!176133) (not b!176132) (not bm!17825) (not b!176075) (not b!176058) (not bm!17824) (not bm!17828) (not b!176147) (not mapNonEmpty!7034) (not b!176085) tp_is_empty!4119 b_and!10839 (not b_lambda!7029) (not d!53591) (not b!176083) (not b!176128) (not d!53589) (not b!176131) (not b!176057) (not d!53587) (not b!176130) (not b!176140) (not bm!17826) (not d!53583) (not b_next!4347))
(check-sat b_and!10839 (not b_next!4347))
(get-model)

(declare-fun d!53593 () Bool)

(declare-fun get!1999 (Option!197) V!5139)

(assert (=> d!53593 (= (apply!136 lt!87149 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)) (get!1999 (getValueByKey!191 (toList!1115 lt!87149) (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7261 () Bool)

(assert (= bs!7261 d!53593))

(assert (=> bs!7261 m!204939))

(declare-fun m!204995 () Bool)

(assert (=> bs!7261 m!204995))

(assert (=> bs!7261 m!204995))

(declare-fun m!204997 () Bool)

(assert (=> bs!7261 m!204997))

(assert (=> b!176140 d!53593))

(declare-fun d!53595 () Bool)

(declare-fun c!31575 () Bool)

(assert (=> d!53595 (= c!31575 ((_ is ValueCellFull!1716) (select (arr!3504 (_values!3611 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!116241 () V!5139)

(assert (=> d!53595 (= (get!1998 (select (arr!3504 (_values!3611 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3628 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!116241)))

(declare-fun b!176163 () Bool)

(declare-fun get!2000 (ValueCell!1716 V!5139) V!5139)

(assert (=> b!176163 (= e!116241 (get!2000 (select (arr!3504 (_values!3611 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3628 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176164 () Bool)

(declare-fun get!2001 (ValueCell!1716 V!5139) V!5139)

(assert (=> b!176164 (= e!116241 (get!2001 (select (arr!3504 (_values!3611 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3628 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53595 c!31575) b!176163))

(assert (= (and d!53595 (not c!31575)) b!176164))

(assert (=> b!176163 m!204943))

(assert (=> b!176163 m!204945))

(declare-fun m!204999 () Bool)

(assert (=> b!176163 m!204999))

(assert (=> b!176164 m!204943))

(assert (=> b!176164 m!204945))

(declare-fun m!205001 () Bool)

(assert (=> b!176164 m!205001))

(assert (=> b!176140 d!53595))

(declare-fun d!53597 () Bool)

(declare-fun e!116243 () Bool)

(assert (=> d!53597 e!116243))

(declare-fun res!83482 () Bool)

(assert (=> d!53597 (=> res!83482 e!116243)))

(declare-fun lt!87172 () Bool)

(assert (=> d!53597 (= res!83482 (not lt!87172))))

(declare-fun lt!87173 () Bool)

(assert (=> d!53597 (= lt!87172 lt!87173)))

(declare-fun lt!87170 () Unit!5396)

(declare-fun e!116242 () Unit!5396)

(assert (=> d!53597 (= lt!87170 e!116242)))

(declare-fun c!31576 () Bool)

(assert (=> d!53597 (= c!31576 lt!87173)))

(assert (=> d!53597 (= lt!87173 (containsKey!195 (toList!1115 lt!87149) (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53597 (= (contains!1177 lt!87149 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)) lt!87172)))

(declare-fun b!176165 () Bool)

(declare-fun lt!87171 () Unit!5396)

(assert (=> b!176165 (= e!116242 lt!87171)))

(assert (=> b!176165 (= lt!87171 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1115 lt!87149) (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176165 (isDefined!144 (getValueByKey!191 (toList!1115 lt!87149) (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176166 () Bool)

(declare-fun Unit!5400 () Unit!5396)

(assert (=> b!176166 (= e!116242 Unit!5400)))

(declare-fun b!176167 () Bool)

(assert (=> b!176167 (= e!116243 (isDefined!144 (getValueByKey!191 (toList!1115 lt!87149) (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53597 c!31576) b!176165))

(assert (= (and d!53597 (not c!31576)) b!176166))

(assert (= (and d!53597 (not res!83482)) b!176167))

(assert (=> d!53597 m!204939))

(declare-fun m!205003 () Bool)

(assert (=> d!53597 m!205003))

(assert (=> b!176165 m!204939))

(declare-fun m!205005 () Bool)

(assert (=> b!176165 m!205005))

(assert (=> b!176165 m!204939))

(assert (=> b!176165 m!204995))

(assert (=> b!176165 m!204995))

(declare-fun m!205007 () Bool)

(assert (=> b!176165 m!205007))

(assert (=> b!176167 m!204939))

(assert (=> b!176167 m!204995))

(assert (=> b!176167 m!204995))

(assert (=> b!176167 m!205007))

(assert (=> b!176133 d!53597))

(declare-fun d!53599 () Bool)

(assert (=> d!53599 (isDefined!144 (getValueByKey!191 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828))))

(declare-fun lt!87176 () Unit!5396)

(declare-fun choose!943 (List!2228 (_ BitVec 64)) Unit!5396)

(assert (=> d!53599 (= lt!87176 (choose!943 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828))))

(declare-fun e!116246 () Bool)

(assert (=> d!53599 e!116246))

(declare-fun res!83485 () Bool)

(assert (=> d!53599 (=> (not res!83485) (not e!116246))))

(declare-fun isStrictlySorted!336 (List!2228) Bool)

(assert (=> d!53599 (= res!83485 (isStrictlySorted!336 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))))))

(assert (=> d!53599 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828) lt!87176)))

(declare-fun b!176170 () Bool)

(assert (=> b!176170 (= e!116246 (containsKey!195 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828))))

(assert (= (and d!53599 res!83485) b!176170))

(assert (=> d!53599 m!204931))

(assert (=> d!53599 m!204931))

(assert (=> d!53599 m!204933))

(declare-fun m!205009 () Bool)

(assert (=> d!53599 m!205009))

(declare-fun m!205011 () Bool)

(assert (=> d!53599 m!205011))

(assert (=> b!176170 m!204927))

(assert (=> b!176083 d!53599))

(declare-fun d!53601 () Bool)

(declare-fun isEmpty!445 (Option!197) Bool)

(assert (=> d!53601 (= (isDefined!144 (getValueByKey!191 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828)) (not (isEmpty!445 (getValueByKey!191 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828))))))

(declare-fun bs!7262 () Bool)

(assert (= bs!7262 d!53601))

(assert (=> bs!7262 m!204931))

(declare-fun m!205013 () Bool)

(assert (=> bs!7262 m!205013))

(assert (=> b!176083 d!53601))

(declare-fun d!53603 () Bool)

(declare-fun c!31581 () Bool)

(assert (=> d!53603 (= c!31581 (and ((_ is Cons!2224) (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))) (= (_1!1647 (h!2844 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))))) key!828)))))

(declare-fun e!116251 () Option!197)

(assert (=> d!53603 (= (getValueByKey!191 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828) e!116251)))

(declare-fun b!176179 () Bool)

(assert (=> b!176179 (= e!116251 (Some!196 (_2!1647 (h!2844 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))))))))

(declare-fun b!176180 () Bool)

(declare-fun e!116252 () Option!197)

(assert (=> b!176180 (= e!116251 e!116252)))

(declare-fun c!31582 () Bool)

(assert (=> b!176180 (= c!31582 (and ((_ is Cons!2224) (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))) (not (= (_1!1647 (h!2844 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))))) key!828))))))

(declare-fun b!176181 () Bool)

(assert (=> b!176181 (= e!116252 (getValueByKey!191 (t!7050 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))) key!828))))

(declare-fun b!176182 () Bool)

(assert (=> b!176182 (= e!116252 None!195)))

(assert (= (and d!53603 c!31581) b!176179))

(assert (= (and d!53603 (not c!31581)) b!176180))

(assert (= (and b!176180 c!31582) b!176181))

(assert (= (and b!176180 (not c!31582)) b!176182))

(declare-fun m!205015 () Bool)

(assert (=> b!176181 m!205015))

(assert (=> b!176083 d!53603))

(declare-fun b!176195 () Bool)

(declare-fun e!116261 () SeekEntryResult!553)

(assert (=> b!176195 (= e!116261 Undefined!553)))

(declare-fun b!176197 () Bool)

(declare-fun e!116259 () SeekEntryResult!553)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!176197 (= e!116259 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19337 lt!87089) #b00000000000000000000000000000001) (nextIndex!0 (index!4382 lt!87089) (x!19337 lt!87089) (mask!8537 thiss!1248)) (index!4382 lt!87089) key!828 (_keys!5485 thiss!1248) (mask!8537 thiss!1248)))))

(declare-fun b!176198 () Bool)

(declare-fun c!31590 () Bool)

(declare-fun lt!87181 () (_ BitVec 64))

(assert (=> b!176198 (= c!31590 (= lt!87181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116260 () SeekEntryResult!553)

(assert (=> b!176198 (= e!116260 e!116259)))

(declare-fun b!176199 () Bool)

(assert (=> b!176199 (= e!116261 e!116260)))

(declare-fun c!31589 () Bool)

(assert (=> b!176199 (= c!31589 (= lt!87181 key!828))))

(declare-fun b!176200 () Bool)

(assert (=> b!176200 (= e!116259 (MissingVacant!553 (index!4382 lt!87089)))))

(declare-fun b!176196 () Bool)

(assert (=> b!176196 (= e!116260 (Found!553 (index!4382 lt!87089)))))

(declare-fun lt!87182 () SeekEntryResult!553)

(declare-fun d!53605 () Bool)

(assert (=> d!53605 (and (or ((_ is Undefined!553) lt!87182) (not ((_ is Found!553) lt!87182)) (and (bvsge (index!4381 lt!87182) #b00000000000000000000000000000000) (bvslt (index!4381 lt!87182) (size!3806 (_keys!5485 thiss!1248))))) (or ((_ is Undefined!553) lt!87182) ((_ is Found!553) lt!87182) (not ((_ is MissingVacant!553) lt!87182)) (not (= (index!4383 lt!87182) (index!4382 lt!87089))) (and (bvsge (index!4383 lt!87182) #b00000000000000000000000000000000) (bvslt (index!4383 lt!87182) (size!3806 (_keys!5485 thiss!1248))))) (or ((_ is Undefined!553) lt!87182) (ite ((_ is Found!553) lt!87182) (= (select (arr!3503 (_keys!5485 thiss!1248)) (index!4381 lt!87182)) key!828) (and ((_ is MissingVacant!553) lt!87182) (= (index!4383 lt!87182) (index!4382 lt!87089)) (= (select (arr!3503 (_keys!5485 thiss!1248)) (index!4383 lt!87182)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53605 (= lt!87182 e!116261)))

(declare-fun c!31591 () Bool)

(assert (=> d!53605 (= c!31591 (bvsge (x!19337 lt!87089) #b01111111111111111111111111111110))))

(assert (=> d!53605 (= lt!87181 (select (arr!3503 (_keys!5485 thiss!1248)) (index!4382 lt!87089)))))

(assert (=> d!53605 (validMask!0 (mask!8537 thiss!1248))))

(assert (=> d!53605 (= (seekKeyOrZeroReturnVacant!0 (x!19337 lt!87089) (index!4382 lt!87089) (index!4382 lt!87089) key!828 (_keys!5485 thiss!1248) (mask!8537 thiss!1248)) lt!87182)))

(assert (= (and d!53605 c!31591) b!176195))

(assert (= (and d!53605 (not c!31591)) b!176199))

(assert (= (and b!176199 c!31589) b!176196))

(assert (= (and b!176199 (not c!31589)) b!176198))

(assert (= (and b!176198 c!31590) b!176200))

(assert (= (and b!176198 (not c!31590)) b!176197))

(declare-fun m!205017 () Bool)

(assert (=> b!176197 m!205017))

(assert (=> b!176197 m!205017))

(declare-fun m!205019 () Bool)

(assert (=> b!176197 m!205019))

(declare-fun m!205021 () Bool)

(assert (=> d!53605 m!205021))

(declare-fun m!205023 () Bool)

(assert (=> d!53605 m!205023))

(assert (=> d!53605 m!204923))

(assert (=> d!53605 m!204873))

(assert (=> b!176075 d!53605))

(assert (=> d!53591 d!53585))

(declare-fun d!53607 () Bool)

(declare-fun e!116263 () Bool)

(assert (=> d!53607 e!116263))

(declare-fun res!83486 () Bool)

(assert (=> d!53607 (=> res!83486 e!116263)))

(declare-fun lt!87185 () Bool)

(assert (=> d!53607 (= res!83486 (not lt!87185))))

(declare-fun lt!87186 () Bool)

(assert (=> d!53607 (= lt!87185 lt!87186)))

(declare-fun lt!87183 () Unit!5396)

(declare-fun e!116262 () Unit!5396)

(assert (=> d!53607 (= lt!87183 e!116262)))

(declare-fun c!31592 () Bool)

(assert (=> d!53607 (= c!31592 lt!87186)))

(assert (=> d!53607 (= lt!87186 (containsKey!195 (toList!1115 lt!87149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53607 (= (contains!1177 lt!87149 #b1000000000000000000000000000000000000000000000000000000000000000) lt!87185)))

(declare-fun b!176201 () Bool)

(declare-fun lt!87184 () Unit!5396)

(assert (=> b!176201 (= e!116262 lt!87184)))

(assert (=> b!176201 (= lt!87184 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1115 lt!87149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176201 (isDefined!144 (getValueByKey!191 (toList!1115 lt!87149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176202 () Bool)

(declare-fun Unit!5401 () Unit!5396)

(assert (=> b!176202 (= e!116262 Unit!5401)))

(declare-fun b!176203 () Bool)

(assert (=> b!176203 (= e!116263 (isDefined!144 (getValueByKey!191 (toList!1115 lt!87149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53607 c!31592) b!176201))

(assert (= (and d!53607 (not c!31592)) b!176202))

(assert (= (and d!53607 (not res!83486)) b!176203))

(declare-fun m!205025 () Bool)

(assert (=> d!53607 m!205025))

(declare-fun m!205027 () Bool)

(assert (=> b!176201 m!205027))

(declare-fun m!205029 () Bool)

(assert (=> b!176201 m!205029))

(assert (=> b!176201 m!205029))

(declare-fun m!205031 () Bool)

(assert (=> b!176201 m!205031))

(assert (=> b!176203 m!205029))

(assert (=> b!176203 m!205029))

(assert (=> b!176203 m!205031))

(assert (=> bm!17824 d!53607))

(declare-fun d!53609 () Bool)

(declare-fun res!83491 () Bool)

(declare-fun e!116268 () Bool)

(assert (=> d!53609 (=> res!83491 e!116268)))

(assert (=> d!53609 (= res!83491 (and ((_ is Cons!2224) (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))) (= (_1!1647 (h!2844 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))))) key!828)))))

(assert (=> d!53609 (= (containsKey!195 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))) key!828) e!116268)))

(declare-fun b!176208 () Bool)

(declare-fun e!116269 () Bool)

(assert (=> b!176208 (= e!116268 e!116269)))

(declare-fun res!83492 () Bool)

(assert (=> b!176208 (=> (not res!83492) (not e!116269))))

(assert (=> b!176208 (= res!83492 (and (or (not ((_ is Cons!2224) (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))))) (bvsle (_1!1647 (h!2844 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))))) key!828)) ((_ is Cons!2224) (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))) (bvslt (_1!1647 (h!2844 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248))))) key!828)))))

(declare-fun b!176209 () Bool)

(assert (=> b!176209 (= e!116269 (containsKey!195 (t!7050 (toList!1115 (getCurrentListMap!767 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)))) key!828))))

(assert (= (and d!53609 (not res!83491)) b!176208))

(assert (= (and b!176208 res!83492) b!176209))

(declare-fun m!205033 () Bool)

(assert (=> b!176209 m!205033))

(assert (=> d!53589 d!53609))

(declare-fun d!53611 () Bool)

(assert (=> d!53611 (= (validKeyInArray!0 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176147 d!53611))

(declare-fun bm!17833 () Bool)

(declare-fun call!17836 () Bool)

(assert (=> bm!17833 (= call!17836 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5485 thiss!1248) (mask!8537 thiss!1248)))))

(declare-fun b!176218 () Bool)

(declare-fun e!116277 () Bool)

(assert (=> b!176218 (= e!116277 call!17836)))

(declare-fun b!176219 () Bool)

(declare-fun e!116276 () Bool)

(declare-fun e!116278 () Bool)

(assert (=> b!176219 (= e!116276 e!116278)))

(declare-fun c!31595 () Bool)

(assert (=> b!176219 (= c!31595 (validKeyInArray!0 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176221 () Bool)

(assert (=> b!176221 (= e!116278 e!116277)))

(declare-fun lt!87193 () (_ BitVec 64))

(assert (=> b!176221 (= lt!87193 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87195 () Unit!5396)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7381 (_ BitVec 64) (_ BitVec 32)) Unit!5396)

(assert (=> b!176221 (= lt!87195 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5485 thiss!1248) lt!87193 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!176221 (arrayContainsKey!0 (_keys!5485 thiss!1248) lt!87193 #b00000000000000000000000000000000)))

(declare-fun lt!87194 () Unit!5396)

(assert (=> b!176221 (= lt!87194 lt!87195)))

(declare-fun res!83498 () Bool)

(assert (=> b!176221 (= res!83498 (= (seekEntryOrOpen!0 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000) (_keys!5485 thiss!1248) (mask!8537 thiss!1248)) (Found!553 #b00000000000000000000000000000000)))))

(assert (=> b!176221 (=> (not res!83498) (not e!116277))))

(declare-fun d!53613 () Bool)

(declare-fun res!83497 () Bool)

(assert (=> d!53613 (=> res!83497 e!116276)))

(assert (=> d!53613 (= res!83497 (bvsge #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(assert (=> d!53613 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5485 thiss!1248) (mask!8537 thiss!1248)) e!116276)))

(declare-fun b!176220 () Bool)

(assert (=> b!176220 (= e!116278 call!17836)))

(assert (= (and d!53613 (not res!83497)) b!176219))

(assert (= (and b!176219 c!31595) b!176221))

(assert (= (and b!176219 (not c!31595)) b!176220))

(assert (= (and b!176221 res!83498) b!176218))

(assert (= (or b!176218 b!176220) bm!17833))

(declare-fun m!205035 () Bool)

(assert (=> bm!17833 m!205035))

(assert (=> b!176219 m!204939))

(assert (=> b!176219 m!204939))

(assert (=> b!176219 m!204951))

(assert (=> b!176221 m!204939))

(declare-fun m!205037 () Bool)

(assert (=> b!176221 m!205037))

(declare-fun m!205039 () Bool)

(assert (=> b!176221 m!205039))

(assert (=> b!176221 m!204939))

(declare-fun m!205041 () Bool)

(assert (=> b!176221 m!205041))

(assert (=> b!176057 d!53613))

(declare-fun d!53615 () Bool)

(declare-fun e!116281 () Bool)

(assert (=> d!53615 e!116281))

(declare-fun res!83503 () Bool)

(assert (=> d!53615 (=> (not res!83503) (not e!116281))))

(declare-fun lt!87205 () ListLongMap!2199)

(assert (=> d!53615 (= res!83503 (contains!1177 lt!87205 (_1!1647 (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))))))))

(declare-fun lt!87206 () List!2228)

(assert (=> d!53615 (= lt!87205 (ListLongMap!2200 lt!87206))))

(declare-fun lt!87204 () Unit!5396)

(declare-fun lt!87207 () Unit!5396)

(assert (=> d!53615 (= lt!87204 lt!87207)))

(assert (=> d!53615 (= (getValueByKey!191 lt!87206 (_1!1647 (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))))) (Some!196 (_2!1647 (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!102 (List!2228 (_ BitVec 64) V!5139) Unit!5396)

(assert (=> d!53615 (= lt!87207 (lemmaContainsTupThenGetReturnValue!102 lt!87206 (_1!1647 (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))) (_2!1647 (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))))))))

(declare-fun insertStrictlySorted!105 (List!2228 (_ BitVec 64) V!5139) List!2228)

(assert (=> d!53615 (= lt!87206 (insertStrictlySorted!105 (toList!1115 (ite c!31568 call!17832 (ite c!31571 call!17829 call!17827))) (_1!1647 (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))) (_2!1647 (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))))))))

(assert (=> d!53615 (= (+!253 (ite c!31568 call!17832 (ite c!31571 call!17829 call!17827)) (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))) lt!87205)))

(declare-fun b!176226 () Bool)

(declare-fun res!83504 () Bool)

(assert (=> b!176226 (=> (not res!83504) (not e!116281))))

(assert (=> b!176226 (= res!83504 (= (getValueByKey!191 (toList!1115 lt!87205) (_1!1647 (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))))) (Some!196 (_2!1647 (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))))))))

(declare-fun b!176227 () Bool)

(declare-fun contains!1179 (List!2228 tuple2!3272) Bool)

(assert (=> b!176227 (= e!116281 (contains!1179 (toList!1115 lt!87205) (ite (or c!31568 c!31571) (tuple2!3273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3469 thiss!1248)) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))))))

(assert (= (and d!53615 res!83503) b!176226))

(assert (= (and b!176226 res!83504) b!176227))

(declare-fun m!205043 () Bool)

(assert (=> d!53615 m!205043))

(declare-fun m!205045 () Bool)

(assert (=> d!53615 m!205045))

(declare-fun m!205047 () Bool)

(assert (=> d!53615 m!205047))

(declare-fun m!205049 () Bool)

(assert (=> d!53615 m!205049))

(declare-fun m!205051 () Bool)

(assert (=> b!176226 m!205051))

(declare-fun m!205053 () Bool)

(assert (=> b!176227 m!205053))

(assert (=> bm!17828 d!53615))

(declare-fun b!176238 () Bool)

(declare-fun e!116290 () Bool)

(declare-fun e!116293 () Bool)

(assert (=> b!176238 (= e!116290 e!116293)))

(declare-fun res!83512 () Bool)

(assert (=> b!176238 (=> (not res!83512) (not e!116293))))

(declare-fun e!116292 () Bool)

(assert (=> b!176238 (= res!83512 (not e!116292))))

(declare-fun res!83511 () Bool)

(assert (=> b!176238 (=> (not res!83511) (not e!116292))))

(assert (=> b!176238 (= res!83511 (validKeyInArray!0 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53617 () Bool)

(declare-fun res!83513 () Bool)

(assert (=> d!53617 (=> res!83513 e!116290)))

(assert (=> d!53617 (= res!83513 (bvsge #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(assert (=> d!53617 (= (arrayNoDuplicates!0 (_keys!5485 thiss!1248) #b00000000000000000000000000000000 Nil!2227) e!116290)))

(declare-fun b!176239 () Bool)

(declare-fun e!116291 () Bool)

(assert (=> b!176239 (= e!116293 e!116291)))

(declare-fun c!31598 () Bool)

(assert (=> b!176239 (= c!31598 (validKeyInArray!0 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17836 () Bool)

(declare-fun call!17839 () Bool)

(assert (=> bm!17836 (= call!17839 (arrayNoDuplicates!0 (_keys!5485 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31598 (Cons!2226 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000) Nil!2227) Nil!2227)))))

(declare-fun b!176240 () Bool)

(assert (=> b!176240 (= e!116291 call!17839)))

(declare-fun b!176241 () Bool)

(declare-fun contains!1180 (List!2230 (_ BitVec 64)) Bool)

(assert (=> b!176241 (= e!116292 (contains!1180 Nil!2227 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176242 () Bool)

(assert (=> b!176242 (= e!116291 call!17839)))

(assert (= (and d!53617 (not res!83513)) b!176238))

(assert (= (and b!176238 res!83511) b!176241))

(assert (= (and b!176238 res!83512) b!176239))

(assert (= (and b!176239 c!31598) b!176242))

(assert (= (and b!176239 (not c!31598)) b!176240))

(assert (= (or b!176242 b!176240) bm!17836))

(assert (=> b!176238 m!204939))

(assert (=> b!176238 m!204939))

(assert (=> b!176238 m!204951))

(assert (=> b!176239 m!204939))

(assert (=> b!176239 m!204939))

(assert (=> b!176239 m!204951))

(assert (=> bm!17836 m!204939))

(declare-fun m!205055 () Bool)

(assert (=> bm!17836 m!205055))

(assert (=> b!176241 m!204939))

(assert (=> b!176241 m!204939))

(declare-fun m!205057 () Bool)

(assert (=> b!176241 m!205057))

(assert (=> b!176058 d!53617))

(declare-fun d!53619 () Bool)

(assert (=> d!53619 (= (apply!136 lt!87149 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1999 (getValueByKey!191 (toList!1115 lt!87149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7263 () Bool)

(assert (= bs!7263 d!53619))

(declare-fun m!205059 () Bool)

(assert (=> bs!7263 m!205059))

(assert (=> bs!7263 m!205059))

(declare-fun m!205061 () Bool)

(assert (=> bs!7263 m!205061))

(assert (=> b!176131 d!53619))

(declare-fun d!53621 () Bool)

(declare-fun e!116294 () Bool)

(assert (=> d!53621 e!116294))

(declare-fun res!83514 () Bool)

(assert (=> d!53621 (=> (not res!83514) (not e!116294))))

(declare-fun lt!87209 () ListLongMap!2199)

(assert (=> d!53621 (= res!83514 (contains!1177 lt!87209 (_1!1647 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))))))

(declare-fun lt!87210 () List!2228)

(assert (=> d!53621 (= lt!87209 (ListLongMap!2200 lt!87210))))

(declare-fun lt!87208 () Unit!5396)

(declare-fun lt!87211 () Unit!5396)

(assert (=> d!53621 (= lt!87208 lt!87211)))

(assert (=> d!53621 (= (getValueByKey!191 lt!87210 (_1!1647 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))) (Some!196 (_2!1647 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))))))

(assert (=> d!53621 (= lt!87211 (lemmaContainsTupThenGetReturnValue!102 lt!87210 (_1!1647 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))) (_2!1647 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))))))

(assert (=> d!53621 (= lt!87210 (insertStrictlySorted!105 (toList!1115 call!17828) (_1!1647 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))) (_2!1647 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))))))

(assert (=> d!53621 (= (+!253 call!17828 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))) lt!87209)))

(declare-fun b!176243 () Bool)

(declare-fun res!83515 () Bool)

(assert (=> b!176243 (=> (not res!83515) (not e!116294))))

(assert (=> b!176243 (= res!83515 (= (getValueByKey!191 (toList!1115 lt!87209) (_1!1647 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248)))) (Some!196 (_2!1647 (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))))))))

(declare-fun b!176244 () Bool)

(assert (=> b!176244 (= e!116294 (contains!1179 (toList!1115 lt!87209) (tuple2!3273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3469 thiss!1248))))))

(assert (= (and d!53621 res!83514) b!176243))

(assert (= (and b!176243 res!83515) b!176244))

(declare-fun m!205063 () Bool)

(assert (=> d!53621 m!205063))

(declare-fun m!205065 () Bool)

(assert (=> d!53621 m!205065))

(declare-fun m!205067 () Bool)

(assert (=> d!53621 m!205067))

(declare-fun m!205069 () Bool)

(assert (=> d!53621 m!205069))

(declare-fun m!205071 () Bool)

(assert (=> b!176243 m!205071))

(declare-fun m!205073 () Bool)

(assert (=> b!176244 m!205073))

(assert (=> b!176132 d!53621))

(declare-fun d!53623 () Bool)

(declare-fun e!116296 () Bool)

(assert (=> d!53623 e!116296))

(declare-fun res!83516 () Bool)

(assert (=> d!53623 (=> res!83516 e!116296)))

(declare-fun lt!87214 () Bool)

(assert (=> d!53623 (= res!83516 (not lt!87214))))

(declare-fun lt!87215 () Bool)

(assert (=> d!53623 (= lt!87214 lt!87215)))

(declare-fun lt!87212 () Unit!5396)

(declare-fun e!116295 () Unit!5396)

(assert (=> d!53623 (= lt!87212 e!116295)))

(declare-fun c!31599 () Bool)

(assert (=> d!53623 (= c!31599 lt!87215)))

(assert (=> d!53623 (= lt!87215 (containsKey!195 (toList!1115 lt!87149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53623 (= (contains!1177 lt!87149 #b0000000000000000000000000000000000000000000000000000000000000000) lt!87214)))

(declare-fun b!176245 () Bool)

(declare-fun lt!87213 () Unit!5396)

(assert (=> b!176245 (= e!116295 lt!87213)))

(assert (=> b!176245 (= lt!87213 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1115 lt!87149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176245 (isDefined!144 (getValueByKey!191 (toList!1115 lt!87149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176246 () Bool)

(declare-fun Unit!5402 () Unit!5396)

(assert (=> b!176246 (= e!116295 Unit!5402)))

(declare-fun b!176247 () Bool)

(assert (=> b!176247 (= e!116296 (isDefined!144 (getValueByKey!191 (toList!1115 lt!87149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53623 c!31599) b!176245))

(assert (= (and d!53623 (not c!31599)) b!176246))

(assert (= (and d!53623 (not res!83516)) b!176247))

(declare-fun m!205075 () Bool)

(assert (=> d!53623 m!205075))

(declare-fun m!205077 () Bool)

(assert (=> b!176245 m!205077))

(assert (=> b!176245 m!205059))

(assert (=> b!176245 m!205059))

(declare-fun m!205079 () Bool)

(assert (=> b!176245 m!205079))

(assert (=> b!176247 m!205059))

(assert (=> b!176247 m!205059))

(assert (=> b!176247 m!205079))

(assert (=> bm!17826 d!53623))

(declare-fun d!53625 () Bool)

(declare-fun e!116297 () Bool)

(assert (=> d!53625 e!116297))

(declare-fun res!83517 () Bool)

(assert (=> d!53625 (=> (not res!83517) (not e!116297))))

(declare-fun lt!87217 () ListLongMap!2199)

(assert (=> d!53625 (= res!83517 (contains!1177 lt!87217 (_1!1647 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248)))))))

(declare-fun lt!87218 () List!2228)

(assert (=> d!53625 (= lt!87217 (ListLongMap!2200 lt!87218))))

(declare-fun lt!87216 () Unit!5396)

(declare-fun lt!87219 () Unit!5396)

(assert (=> d!53625 (= lt!87216 lt!87219)))

(assert (=> d!53625 (= (getValueByKey!191 lt!87218 (_1!1647 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248)))) (Some!196 (_2!1647 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248)))))))

(assert (=> d!53625 (= lt!87219 (lemmaContainsTupThenGetReturnValue!102 lt!87218 (_1!1647 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248))) (_2!1647 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248)))))))

(assert (=> d!53625 (= lt!87218 (insertStrictlySorted!105 (toList!1115 lt!87160) (_1!1647 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248))) (_2!1647 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248)))))))

(assert (=> d!53625 (= (+!253 lt!87160 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248))) lt!87217)))

(declare-fun b!176248 () Bool)

(declare-fun res!83518 () Bool)

(assert (=> b!176248 (=> (not res!83518) (not e!116297))))

(assert (=> b!176248 (= res!83518 (= (getValueByKey!191 (toList!1115 lt!87217) (_1!1647 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248)))) (Some!196 (_2!1647 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248))))))))

(declare-fun b!176249 () Bool)

(assert (=> b!176249 (= e!116297 (contains!1179 (toList!1115 lt!87217) (tuple2!3273 lt!87155 (minValue!3469 thiss!1248))))))

(assert (= (and d!53625 res!83517) b!176248))

(assert (= (and b!176248 res!83518) b!176249))

(declare-fun m!205081 () Bool)

(assert (=> d!53625 m!205081))

(declare-fun m!205083 () Bool)

(assert (=> d!53625 m!205083))

(declare-fun m!205085 () Bool)

(assert (=> d!53625 m!205085))

(declare-fun m!205087 () Bool)

(assert (=> d!53625 m!205087))

(declare-fun m!205089 () Bool)

(assert (=> b!176248 m!205089))

(declare-fun m!205091 () Bool)

(assert (=> b!176249 m!205091))

(assert (=> b!176128 d!53625))

(declare-fun b!176274 () Bool)

(declare-fun e!116312 () Bool)

(assert (=> b!176274 (= e!116312 (validKeyInArray!0 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176274 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!176275 () Bool)

(declare-fun e!116315 () Bool)

(declare-fun e!116314 () Bool)

(assert (=> b!176275 (= e!116315 e!116314)))

(declare-fun c!31609 () Bool)

(assert (=> b!176275 (= c!31609 e!116312)))

(declare-fun res!83528 () Bool)

(assert (=> b!176275 (=> (not res!83528) (not e!116312))))

(assert (=> b!176275 (= res!83528 (bvslt #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(declare-fun b!176276 () Bool)

(declare-fun e!116317 () Bool)

(declare-fun lt!87239 () ListLongMap!2199)

(assert (=> b!176276 (= e!116317 (= lt!87239 (getCurrentListMapNoExtraKeys!169 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3628 thiss!1248))))))

(declare-fun b!176277 () Bool)

(assert (=> b!176277 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(assert (=> b!176277 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3807 (_values!3611 thiss!1248))))))

(declare-fun e!116313 () Bool)

(assert (=> b!176277 (= e!116313 (= (apply!136 lt!87239 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)) (get!1998 (select (arr!3504 (_values!3611 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3628 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!176278 () Bool)

(declare-fun lt!87240 () Unit!5396)

(declare-fun lt!87235 () Unit!5396)

(assert (=> b!176278 (= lt!87240 lt!87235)))

(declare-fun lt!87237 () V!5139)

(declare-fun lt!87236 () (_ BitVec 64))

(declare-fun lt!87238 () ListLongMap!2199)

(declare-fun lt!87234 () (_ BitVec 64))

(assert (=> b!176278 (not (contains!1177 (+!253 lt!87238 (tuple2!3273 lt!87236 lt!87237)) lt!87234))))

(declare-fun addStillNotContains!76 (ListLongMap!2199 (_ BitVec 64) V!5139 (_ BitVec 64)) Unit!5396)

(assert (=> b!176278 (= lt!87235 (addStillNotContains!76 lt!87238 lt!87236 lt!87237 lt!87234))))

(assert (=> b!176278 (= lt!87234 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!176278 (= lt!87237 (get!1998 (select (arr!3504 (_values!3611 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3628 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176278 (= lt!87236 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!17842 () ListLongMap!2199)

(assert (=> b!176278 (= lt!87238 call!17842)))

(declare-fun e!116318 () ListLongMap!2199)

(assert (=> b!176278 (= e!116318 (+!253 call!17842 (tuple2!3273 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000) (get!1998 (select (arr!3504 (_values!3611 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!479 (defaultEntry!3628 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!176279 () Bool)

(declare-fun isEmpty!446 (ListLongMap!2199) Bool)

(assert (=> b!176279 (= e!116317 (isEmpty!446 lt!87239))))

(declare-fun b!176280 () Bool)

(assert (=> b!176280 (= e!116318 call!17842)))

(declare-fun b!176281 () Bool)

(declare-fun e!116316 () ListLongMap!2199)

(assert (=> b!176281 (= e!116316 e!116318)))

(declare-fun c!31608 () Bool)

(assert (=> b!176281 (= c!31608 (validKeyInArray!0 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53627 () Bool)

(assert (=> d!53627 e!116315))

(declare-fun res!83529 () Bool)

(assert (=> d!53627 (=> (not res!83529) (not e!116315))))

(assert (=> d!53627 (= res!83529 (not (contains!1177 lt!87239 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53627 (= lt!87239 e!116316)))

(declare-fun c!31611 () Bool)

(assert (=> d!53627 (= c!31611 (bvsge #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(assert (=> d!53627 (validMask!0 (mask!8537 thiss!1248))))

(assert (=> d!53627 (= (getCurrentListMapNoExtraKeys!169 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3628 thiss!1248)) lt!87239)))

(declare-fun bm!17839 () Bool)

(assert (=> bm!17839 (= call!17842 (getCurrentListMapNoExtraKeys!169 (_keys!5485 thiss!1248) (_values!3611 thiss!1248) (mask!8537 thiss!1248) (extraKeys!3365 thiss!1248) (zeroValue!3469 thiss!1248) (minValue!3469 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3628 thiss!1248)))))

(declare-fun b!176282 () Bool)

(assert (=> b!176282 (= e!116314 e!116317)))

(declare-fun c!31610 () Bool)

(assert (=> b!176282 (= c!31610 (bvslt #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(declare-fun b!176283 () Bool)

(assert (=> b!176283 (= e!116314 e!116313)))

(assert (=> b!176283 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(declare-fun res!83530 () Bool)

(assert (=> b!176283 (= res!83530 (contains!1177 lt!87239 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!176283 (=> (not res!83530) (not e!116313))))

(declare-fun b!176284 () Bool)

(assert (=> b!176284 (= e!116316 (ListLongMap!2200 Nil!2225))))

(declare-fun b!176285 () Bool)

(declare-fun res!83527 () Bool)

(assert (=> b!176285 (=> (not res!83527) (not e!116315))))

(assert (=> b!176285 (= res!83527 (not (contains!1177 lt!87239 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53627 c!31611) b!176284))

(assert (= (and d!53627 (not c!31611)) b!176281))

(assert (= (and b!176281 c!31608) b!176278))

(assert (= (and b!176281 (not c!31608)) b!176280))

(assert (= (or b!176278 b!176280) bm!17839))

(assert (= (and d!53627 res!83529) b!176285))

(assert (= (and b!176285 res!83527) b!176275))

(assert (= (and b!176275 res!83528) b!176274))

(assert (= (and b!176275 c!31609) b!176283))

(assert (= (and b!176275 (not c!31609)) b!176282))

(assert (= (and b!176283 res!83530) b!176277))

(assert (= (and b!176282 c!31610) b!176276))

(assert (= (and b!176282 (not c!31610)) b!176279))

(declare-fun b_lambda!7031 () Bool)

(assert (=> (not b_lambda!7031) (not b!176277)))

(assert (=> b!176277 t!7053))

(declare-fun b_and!10841 () Bool)

(assert (= b_and!10839 (and (=> t!7053 result!4623) b_and!10841)))

(declare-fun b_lambda!7033 () Bool)

(assert (=> (not b_lambda!7033) (not b!176278)))

(assert (=> b!176278 t!7053))

(declare-fun b_and!10843 () Bool)

(assert (= b_and!10841 (and (=> t!7053 result!4623) b_and!10843)))

(declare-fun m!205093 () Bool)

(assert (=> b!176285 m!205093))

(declare-fun m!205095 () Bool)

(assert (=> b!176276 m!205095))

(assert (=> b!176278 m!204939))

(assert (=> b!176278 m!204945))

(assert (=> b!176278 m!204943))

(assert (=> b!176278 m!204945))

(assert (=> b!176278 m!204947))

(declare-fun m!205097 () Bool)

(assert (=> b!176278 m!205097))

(declare-fun m!205099 () Bool)

(assert (=> b!176278 m!205099))

(assert (=> b!176278 m!204943))

(declare-fun m!205101 () Bool)

(assert (=> b!176278 m!205101))

(assert (=> b!176278 m!205097))

(declare-fun m!205103 () Bool)

(assert (=> b!176278 m!205103))

(assert (=> bm!17839 m!205095))

(assert (=> b!176281 m!204939))

(assert (=> b!176281 m!204939))

(assert (=> b!176281 m!204951))

(assert (=> b!176277 m!204939))

(assert (=> b!176277 m!204945))

(assert (=> b!176277 m!204943))

(assert (=> b!176277 m!204945))

(assert (=> b!176277 m!204947))

(assert (=> b!176277 m!204939))

(declare-fun m!205105 () Bool)

(assert (=> b!176277 m!205105))

(assert (=> b!176277 m!204943))

(declare-fun m!205107 () Bool)

(assert (=> d!53627 m!205107))

(assert (=> d!53627 m!204873))

(assert (=> b!176283 m!204939))

(assert (=> b!176283 m!204939))

(declare-fun m!205109 () Bool)

(assert (=> b!176283 m!205109))

(assert (=> b!176274 m!204939))

(assert (=> b!176274 m!204939))

(assert (=> b!176274 m!204951))

(declare-fun m!205111 () Bool)

(assert (=> b!176279 m!205111))

(assert (=> b!176128 d!53627))

(declare-fun d!53629 () Bool)

(assert (=> d!53629 (= (apply!136 (+!253 lt!87160 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248))) lt!87156) (get!1999 (getValueByKey!191 (toList!1115 (+!253 lt!87160 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248)))) lt!87156)))))

(declare-fun bs!7264 () Bool)

(assert (= bs!7264 d!53629))

(declare-fun m!205113 () Bool)

(assert (=> bs!7264 m!205113))

(assert (=> bs!7264 m!205113))

(declare-fun m!205115 () Bool)

(assert (=> bs!7264 m!205115))

(assert (=> b!176128 d!53629))

(declare-fun d!53631 () Bool)

(assert (=> d!53631 (= (apply!136 lt!87160 lt!87156) (get!1999 (getValueByKey!191 (toList!1115 lt!87160) lt!87156)))))

(declare-fun bs!7265 () Bool)

(assert (= bs!7265 d!53631))

(declare-fun m!205117 () Bool)

(assert (=> bs!7265 m!205117))

(assert (=> bs!7265 m!205117))

(declare-fun m!205119 () Bool)

(assert (=> bs!7265 m!205119))

(assert (=> b!176128 d!53631))

(declare-fun d!53633 () Bool)

(assert (=> d!53633 (= (apply!136 lt!87168 lt!87153) (get!1999 (getValueByKey!191 (toList!1115 lt!87168) lt!87153)))))

(declare-fun bs!7266 () Bool)

(assert (= bs!7266 d!53633))

(declare-fun m!205121 () Bool)

(assert (=> bs!7266 m!205121))

(assert (=> bs!7266 m!205121))

(declare-fun m!205123 () Bool)

(assert (=> bs!7266 m!205123))

(assert (=> b!176128 d!53633))

(declare-fun d!53635 () Bool)

(declare-fun e!116319 () Bool)

(assert (=> d!53635 e!116319))

(declare-fun res!83531 () Bool)

(assert (=> d!53635 (=> (not res!83531) (not e!116319))))

(declare-fun lt!87242 () ListLongMap!2199)

(assert (=> d!53635 (= res!83531 (contains!1177 lt!87242 (_1!1647 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248)))))))

(declare-fun lt!87243 () List!2228)

(assert (=> d!53635 (= lt!87242 (ListLongMap!2200 lt!87243))))

(declare-fun lt!87241 () Unit!5396)

(declare-fun lt!87244 () Unit!5396)

(assert (=> d!53635 (= lt!87241 lt!87244)))

(assert (=> d!53635 (= (getValueByKey!191 lt!87243 (_1!1647 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248)))) (Some!196 (_2!1647 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248)))))))

(assert (=> d!53635 (= lt!87244 (lemmaContainsTupThenGetReturnValue!102 lt!87243 (_1!1647 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248))) (_2!1647 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248)))))))

(assert (=> d!53635 (= lt!87243 (insertStrictlySorted!105 (toList!1115 lt!87163) (_1!1647 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248))) (_2!1647 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248)))))))

(assert (=> d!53635 (= (+!253 lt!87163 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248))) lt!87242)))

(declare-fun b!176286 () Bool)

(declare-fun res!83532 () Bool)

(assert (=> b!176286 (=> (not res!83532) (not e!116319))))

(assert (=> b!176286 (= res!83532 (= (getValueByKey!191 (toList!1115 lt!87242) (_1!1647 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248)))) (Some!196 (_2!1647 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248))))))))

(declare-fun b!176287 () Bool)

(assert (=> b!176287 (= e!116319 (contains!1179 (toList!1115 lt!87242) (tuple2!3273 lt!87159 (minValue!3469 thiss!1248))))))

(assert (= (and d!53635 res!83531) b!176286))

(assert (= (and b!176286 res!83532) b!176287))

(declare-fun m!205125 () Bool)

(assert (=> d!53635 m!205125))

(declare-fun m!205127 () Bool)

(assert (=> d!53635 m!205127))

(declare-fun m!205129 () Bool)

(assert (=> d!53635 m!205129))

(declare-fun m!205131 () Bool)

(assert (=> d!53635 m!205131))

(declare-fun m!205133 () Bool)

(assert (=> b!176286 m!205133))

(declare-fun m!205135 () Bool)

(assert (=> b!176287 m!205135))

(assert (=> b!176128 d!53635))

(declare-fun d!53637 () Bool)

(declare-fun e!116321 () Bool)

(assert (=> d!53637 e!116321))

(declare-fun res!83533 () Bool)

(assert (=> d!53637 (=> res!83533 e!116321)))

(declare-fun lt!87247 () Bool)

(assert (=> d!53637 (= res!83533 (not lt!87247))))

(declare-fun lt!87248 () Bool)

(assert (=> d!53637 (= lt!87247 lt!87248)))

(declare-fun lt!87245 () Unit!5396)

(declare-fun e!116320 () Unit!5396)

(assert (=> d!53637 (= lt!87245 e!116320)))

(declare-fun c!31612 () Bool)

(assert (=> d!53637 (= c!31612 lt!87248)))

(assert (=> d!53637 (= lt!87248 (containsKey!195 (toList!1115 (+!253 lt!87158 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248)))) lt!87167))))

(assert (=> d!53637 (= (contains!1177 (+!253 lt!87158 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248))) lt!87167) lt!87247)))

(declare-fun b!176288 () Bool)

(declare-fun lt!87246 () Unit!5396)

(assert (=> b!176288 (= e!116320 lt!87246)))

(assert (=> b!176288 (= lt!87246 (lemmaContainsKeyImpliesGetValueByKeyDefined!143 (toList!1115 (+!253 lt!87158 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248)))) lt!87167))))

(assert (=> b!176288 (isDefined!144 (getValueByKey!191 (toList!1115 (+!253 lt!87158 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248)))) lt!87167))))

(declare-fun b!176289 () Bool)

(declare-fun Unit!5403 () Unit!5396)

(assert (=> b!176289 (= e!116320 Unit!5403)))

(declare-fun b!176290 () Bool)

(assert (=> b!176290 (= e!116321 (isDefined!144 (getValueByKey!191 (toList!1115 (+!253 lt!87158 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248)))) lt!87167)))))

(assert (= (and d!53637 c!31612) b!176288))

(assert (= (and d!53637 (not c!31612)) b!176289))

(assert (= (and d!53637 (not res!83533)) b!176290))

(declare-fun m!205137 () Bool)

(assert (=> d!53637 m!205137))

(declare-fun m!205139 () Bool)

(assert (=> b!176288 m!205139))

(declare-fun m!205141 () Bool)

(assert (=> b!176288 m!205141))

(assert (=> b!176288 m!205141))

(declare-fun m!205143 () Bool)

(assert (=> b!176288 m!205143))

(assert (=> b!176290 m!205141))

(assert (=> b!176290 m!205141))

(assert (=> b!176290 m!205143))

(assert (=> b!176128 d!53637))

(declare-fun d!53639 () Bool)

(assert (=> d!53639 (= (apply!136 (+!253 lt!87160 (tuple2!3273 lt!87155 (minValue!3469 thiss!1248))) lt!87156) (apply!136 lt!87160 lt!87156))))

(declare-fun lt!87251 () Unit!5396)

(declare-fun choose!944 (ListLongMap!2199 (_ BitVec 64) V!5139 (_ BitVec 64)) Unit!5396)

(assert (=> d!53639 (= lt!87251 (choose!944 lt!87160 lt!87155 (minValue!3469 thiss!1248) lt!87156))))

(declare-fun e!116324 () Bool)

(assert (=> d!53639 e!116324))

(declare-fun res!83536 () Bool)

(assert (=> d!53639 (=> (not res!83536) (not e!116324))))

(assert (=> d!53639 (= res!83536 (contains!1177 lt!87160 lt!87156))))

(assert (=> d!53639 (= (addApplyDifferent!112 lt!87160 lt!87155 (minValue!3469 thiss!1248) lt!87156) lt!87251)))

(declare-fun b!176294 () Bool)

(assert (=> b!176294 (= e!116324 (not (= lt!87156 lt!87155)))))

(assert (= (and d!53639 res!83536) b!176294))

(assert (=> d!53639 m!204981))

(declare-fun m!205145 () Bool)

(assert (=> d!53639 m!205145))

(declare-fun m!205147 () Bool)

(assert (=> d!53639 m!205147))

(assert (=> d!53639 m!204981))

(assert (=> d!53639 m!204987))

(assert (=> d!53639 m!204979))

(assert (=> b!176128 d!53639))

(declare-fun d!53641 () Bool)

(assert (=> d!53641 (= (apply!136 (+!253 lt!87163 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248))) lt!87152) (get!1999 (getValueByKey!191 (toList!1115 (+!253 lt!87163 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248)))) lt!87152)))))

(declare-fun bs!7267 () Bool)

(assert (= bs!7267 d!53641))

(declare-fun m!205149 () Bool)

(assert (=> bs!7267 m!205149))

(assert (=> bs!7267 m!205149))

(declare-fun m!205151 () Bool)

(assert (=> bs!7267 m!205151))

(assert (=> b!176128 d!53641))

(declare-fun d!53643 () Bool)

(assert (=> d!53643 (contains!1177 (+!253 lt!87158 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248))) lt!87167)))

(declare-fun lt!87254 () Unit!5396)

(declare-fun choose!945 (ListLongMap!2199 (_ BitVec 64) V!5139 (_ BitVec 64)) Unit!5396)

(assert (=> d!53643 (= lt!87254 (choose!945 lt!87158 lt!87151 (zeroValue!3469 thiss!1248) lt!87167))))

(assert (=> d!53643 (contains!1177 lt!87158 lt!87167)))

(assert (=> d!53643 (= (addStillContains!112 lt!87158 lt!87151 (zeroValue!3469 thiss!1248) lt!87167) lt!87254)))

(declare-fun bs!7268 () Bool)

(assert (= bs!7268 d!53643))

(assert (=> bs!7268 m!204959))

(assert (=> bs!7268 m!204959))

(assert (=> bs!7268 m!204961))

(declare-fun m!205153 () Bool)

(assert (=> bs!7268 m!205153))

(declare-fun m!205155 () Bool)

(assert (=> bs!7268 m!205155))

(assert (=> b!176128 d!53643))

(declare-fun d!53645 () Bool)

(declare-fun e!116325 () Bool)

(assert (=> d!53645 e!116325))

(declare-fun res!83537 () Bool)

(assert (=> d!53645 (=> (not res!83537) (not e!116325))))

(declare-fun lt!87256 () ListLongMap!2199)

(assert (=> d!53645 (= res!83537 (contains!1177 lt!87256 (_1!1647 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248)))))))

(declare-fun lt!87257 () List!2228)

(assert (=> d!53645 (= lt!87256 (ListLongMap!2200 lt!87257))))

(declare-fun lt!87255 () Unit!5396)

(declare-fun lt!87258 () Unit!5396)

(assert (=> d!53645 (= lt!87255 lt!87258)))

(assert (=> d!53645 (= (getValueByKey!191 lt!87257 (_1!1647 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248)))) (Some!196 (_2!1647 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248)))))))

(assert (=> d!53645 (= lt!87258 (lemmaContainsTupThenGetReturnValue!102 lt!87257 (_1!1647 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248))) (_2!1647 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248)))))))

(assert (=> d!53645 (= lt!87257 (insertStrictlySorted!105 (toList!1115 lt!87168) (_1!1647 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248))) (_2!1647 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248)))))))

(assert (=> d!53645 (= (+!253 lt!87168 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248))) lt!87256)))

(declare-fun b!176296 () Bool)

(declare-fun res!83538 () Bool)

(assert (=> b!176296 (=> (not res!83538) (not e!116325))))

(assert (=> b!176296 (= res!83538 (= (getValueByKey!191 (toList!1115 lt!87256) (_1!1647 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248)))) (Some!196 (_2!1647 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248))))))))

(declare-fun b!176297 () Bool)

(assert (=> b!176297 (= e!116325 (contains!1179 (toList!1115 lt!87256) (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248))))))

(assert (= (and d!53645 res!83537) b!176296))

(assert (= (and b!176296 res!83538) b!176297))

(declare-fun m!205157 () Bool)

(assert (=> d!53645 m!205157))

(declare-fun m!205159 () Bool)

(assert (=> d!53645 m!205159))

(declare-fun m!205161 () Bool)

(assert (=> d!53645 m!205161))

(declare-fun m!205163 () Bool)

(assert (=> d!53645 m!205163))

(declare-fun m!205165 () Bool)

(assert (=> b!176296 m!205165))

(declare-fun m!205167 () Bool)

(assert (=> b!176297 m!205167))

(assert (=> b!176128 d!53645))

(declare-fun d!53647 () Bool)

(assert (=> d!53647 (= (apply!136 (+!253 lt!87168 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248))) lt!87153) (apply!136 lt!87168 lt!87153))))

(declare-fun lt!87259 () Unit!5396)

(assert (=> d!53647 (= lt!87259 (choose!944 lt!87168 lt!87150 (zeroValue!3469 thiss!1248) lt!87153))))

(declare-fun e!116326 () Bool)

(assert (=> d!53647 e!116326))

(declare-fun res!83539 () Bool)

(assert (=> d!53647 (=> (not res!83539) (not e!116326))))

(assert (=> d!53647 (= res!83539 (contains!1177 lt!87168 lt!87153))))

(assert (=> d!53647 (= (addApplyDifferent!112 lt!87168 lt!87150 (zeroValue!3469 thiss!1248) lt!87153) lt!87259)))

(declare-fun b!176298 () Bool)

(assert (=> b!176298 (= e!116326 (not (= lt!87153 lt!87150)))))

(assert (= (and d!53647 res!83539) b!176298))

(assert (=> d!53647 m!204969))

(declare-fun m!205169 () Bool)

(assert (=> d!53647 m!205169))

(declare-fun m!205171 () Bool)

(assert (=> d!53647 m!205171))

(assert (=> d!53647 m!204969))

(assert (=> d!53647 m!204971))

(assert (=> d!53647 m!204973))

(assert (=> b!176128 d!53647))

(declare-fun d!53649 () Bool)

(assert (=> d!53649 (= (apply!136 (+!253 lt!87163 (tuple2!3273 lt!87159 (minValue!3469 thiss!1248))) lt!87152) (apply!136 lt!87163 lt!87152))))

(declare-fun lt!87260 () Unit!5396)

(assert (=> d!53649 (= lt!87260 (choose!944 lt!87163 lt!87159 (minValue!3469 thiss!1248) lt!87152))))

(declare-fun e!116327 () Bool)

(assert (=> d!53649 e!116327))

(declare-fun res!83540 () Bool)

(assert (=> d!53649 (=> (not res!83540) (not e!116327))))

(assert (=> d!53649 (= res!83540 (contains!1177 lt!87163 lt!87152))))

(assert (=> d!53649 (= (addApplyDifferent!112 lt!87163 lt!87159 (minValue!3469 thiss!1248) lt!87152) lt!87260)))

(declare-fun b!176299 () Bool)

(assert (=> b!176299 (= e!116327 (not (= lt!87152 lt!87159)))))

(assert (= (and d!53649 res!83540) b!176299))

(assert (=> d!53649 m!204965))

(declare-fun m!205173 () Bool)

(assert (=> d!53649 m!205173))

(declare-fun m!205175 () Bool)

(assert (=> d!53649 m!205175))

(assert (=> d!53649 m!204965))

(assert (=> d!53649 m!204967))

(assert (=> d!53649 m!204983))

(assert (=> b!176128 d!53649))

(declare-fun d!53651 () Bool)

(assert (=> d!53651 (= (apply!136 (+!253 lt!87168 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248))) lt!87153) (get!1999 (getValueByKey!191 (toList!1115 (+!253 lt!87168 (tuple2!3273 lt!87150 (zeroValue!3469 thiss!1248)))) lt!87153)))))

(declare-fun bs!7269 () Bool)

(assert (= bs!7269 d!53651))

(declare-fun m!205177 () Bool)

(assert (=> bs!7269 m!205177))

(assert (=> bs!7269 m!205177))

(declare-fun m!205179 () Bool)

(assert (=> bs!7269 m!205179))

(assert (=> b!176128 d!53651))

(declare-fun d!53653 () Bool)

(assert (=> d!53653 (= (apply!136 lt!87163 lt!87152) (get!1999 (getValueByKey!191 (toList!1115 lt!87163) lt!87152)))))

(declare-fun bs!7270 () Bool)

(assert (= bs!7270 d!53653))

(declare-fun m!205181 () Bool)

(assert (=> bs!7270 m!205181))

(assert (=> bs!7270 m!205181))

(declare-fun m!205183 () Bool)

(assert (=> bs!7270 m!205183))

(assert (=> b!176128 d!53653))

(declare-fun d!53655 () Bool)

(declare-fun e!116328 () Bool)

(assert (=> d!53655 e!116328))

(declare-fun res!83541 () Bool)

(assert (=> d!53655 (=> (not res!83541) (not e!116328))))

(declare-fun lt!87262 () ListLongMap!2199)

(assert (=> d!53655 (= res!83541 (contains!1177 lt!87262 (_1!1647 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248)))))))

(declare-fun lt!87263 () List!2228)

(assert (=> d!53655 (= lt!87262 (ListLongMap!2200 lt!87263))))

(declare-fun lt!87261 () Unit!5396)

(declare-fun lt!87264 () Unit!5396)

(assert (=> d!53655 (= lt!87261 lt!87264)))

(assert (=> d!53655 (= (getValueByKey!191 lt!87263 (_1!1647 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248)))) (Some!196 (_2!1647 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248)))))))

(assert (=> d!53655 (= lt!87264 (lemmaContainsTupThenGetReturnValue!102 lt!87263 (_1!1647 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248))) (_2!1647 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248)))))))

(assert (=> d!53655 (= lt!87263 (insertStrictlySorted!105 (toList!1115 lt!87158) (_1!1647 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248))) (_2!1647 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248)))))))

(assert (=> d!53655 (= (+!253 lt!87158 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248))) lt!87262)))

(declare-fun b!176300 () Bool)

(declare-fun res!83542 () Bool)

(assert (=> b!176300 (=> (not res!83542) (not e!116328))))

(assert (=> b!176300 (= res!83542 (= (getValueByKey!191 (toList!1115 lt!87262) (_1!1647 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248)))) (Some!196 (_2!1647 (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248))))))))

(declare-fun b!176301 () Bool)

(assert (=> b!176301 (= e!116328 (contains!1179 (toList!1115 lt!87262) (tuple2!3273 lt!87151 (zeroValue!3469 thiss!1248))))))

(assert (= (and d!53655 res!83541) b!176300))

(assert (= (and b!176300 res!83542) b!176301))

(declare-fun m!205185 () Bool)

(assert (=> d!53655 m!205185))

(declare-fun m!205187 () Bool)

(assert (=> d!53655 m!205187))

(declare-fun m!205189 () Bool)

(assert (=> d!53655 m!205189))

(declare-fun m!205191 () Bool)

(assert (=> d!53655 m!205191))

(declare-fun m!205193 () Bool)

(assert (=> b!176300 m!205193))

(declare-fun m!205195 () Bool)

(assert (=> b!176301 m!205195))

(assert (=> b!176128 d!53655))

(declare-fun d!53657 () Bool)

(assert (=> d!53657 (= (apply!136 lt!87149 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1999 (getValueByKey!191 (toList!1115 lt!87149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7271 () Bool)

(assert (= bs!7271 d!53657))

(assert (=> bs!7271 m!205029))

(assert (=> bs!7271 m!205029))

(declare-fun m!205197 () Bool)

(assert (=> bs!7271 m!205197))

(assert (=> b!176145 d!53657))

(declare-fun b!176313 () Bool)

(declare-fun e!116331 () Bool)

(assert (=> b!176313 (= e!116331 (and (bvsge (extraKeys!3365 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3365 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1219 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!176310 () Bool)

(declare-fun res!83551 () Bool)

(assert (=> b!176310 (=> (not res!83551) (not e!116331))))

(assert (=> b!176310 (= res!83551 (and (= (size!3807 (_values!3611 thiss!1248)) (bvadd (mask!8537 thiss!1248) #b00000000000000000000000000000001)) (= (size!3806 (_keys!5485 thiss!1248)) (size!3807 (_values!3611 thiss!1248))) (bvsge (_size!1219 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1219 thiss!1248) (bvadd (mask!8537 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!53659 () Bool)

(declare-fun res!83552 () Bool)

(assert (=> d!53659 (=> (not res!83552) (not e!116331))))

(assert (=> d!53659 (= res!83552 (validMask!0 (mask!8537 thiss!1248)))))

(assert (=> d!53659 (= (simpleValid!150 thiss!1248) e!116331)))

(declare-fun b!176311 () Bool)

(declare-fun res!83553 () Bool)

(assert (=> b!176311 (=> (not res!83553) (not e!116331))))

(declare-fun size!3810 (LongMapFixedSize!2340) (_ BitVec 32))

(assert (=> b!176311 (= res!83553 (bvsge (size!3810 thiss!1248) (_size!1219 thiss!1248)))))

(declare-fun b!176312 () Bool)

(declare-fun res!83554 () Bool)

(assert (=> b!176312 (=> (not res!83554) (not e!116331))))

(assert (=> b!176312 (= res!83554 (= (size!3810 thiss!1248) (bvadd (_size!1219 thiss!1248) (bvsdiv (bvadd (extraKeys!3365 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!53659 res!83552) b!176310))

(assert (= (and b!176310 res!83551) b!176311))

(assert (= (and b!176311 res!83553) b!176312))

(assert (= (and b!176312 res!83554) b!176313))

(assert (=> d!53659 m!204873))

(declare-fun m!205199 () Bool)

(assert (=> b!176311 m!205199))

(assert (=> b!176312 m!205199))

(assert (=> d!53583 d!53659))

(declare-fun b!176322 () Bool)

(declare-fun e!116336 () (_ BitVec 32))

(assert (=> b!176322 (= e!116336 #b00000000000000000000000000000000)))

(declare-fun d!53661 () Bool)

(declare-fun lt!87267 () (_ BitVec 32))

(assert (=> d!53661 (and (bvsge lt!87267 #b00000000000000000000000000000000) (bvsle lt!87267 (bvsub (size!3806 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53661 (= lt!87267 e!116336)))

(declare-fun c!31617 () Bool)

(assert (=> d!53661 (= c!31617 (bvsge #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))))))

(assert (=> d!53661 (and (bvsle #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3806 (_keys!5485 thiss!1248)) (size!3806 (_keys!5485 thiss!1248))))))

(assert (=> d!53661 (= (arrayCountValidKeys!0 (_keys!5485 thiss!1248) #b00000000000000000000000000000000 (size!3806 (_keys!5485 thiss!1248))) lt!87267)))

(declare-fun b!176323 () Bool)

(declare-fun e!116337 () (_ BitVec 32))

(assert (=> b!176323 (= e!116336 e!116337)))

(declare-fun c!31618 () Bool)

(assert (=> b!176323 (= c!31618 (validKeyInArray!0 (select (arr!3503 (_keys!5485 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!176324 () Bool)

(declare-fun call!17845 () (_ BitVec 32))

(assert (=> b!176324 (= e!116337 call!17845)))

(declare-fun bm!17842 () Bool)

(assert (=> bm!17842 (= call!17845 (arrayCountValidKeys!0 (_keys!5485 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3806 (_keys!5485 thiss!1248))))))

(declare-fun b!176325 () Bool)

(assert (=> b!176325 (= e!116337 (bvadd #b00000000000000000000000000000001 call!17845))))

(assert (= (and d!53661 c!31617) b!176322))

(assert (= (and d!53661 (not c!31617)) b!176323))

(assert (= (and b!176323 c!31618) b!176325))

(assert (= (and b!176323 (not c!31618)) b!176324))

(assert (= (or b!176325 b!176324) bm!17842))

(assert (=> b!176323 m!204939))

(assert (=> b!176323 m!204939))

(assert (=> b!176323 m!204951))

(declare-fun m!205201 () Bool)

(assert (=> bm!17842 m!205201))

(assert (=> b!176056 d!53661))

(assert (=> b!176130 d!53611))

(assert (=> b!176085 d!53601))

(assert (=> b!176085 d!53603))

(declare-fun b!176344 () Bool)

(declare-fun e!116352 () SeekEntryResult!553)

(assert (=> b!176344 (= e!116352 (Intermediate!553 true (toIndex!0 key!828 (mask!8537 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!176345 () Bool)

(declare-fun lt!87273 () SeekEntryResult!553)

(assert (=> b!176345 (and (bvsge (index!4382 lt!87273) #b00000000000000000000000000000000) (bvslt (index!4382 lt!87273) (size!3806 (_keys!5485 thiss!1248))))))

(declare-fun e!116348 () Bool)

(assert (=> b!176345 (= e!116348 (= (select (arr!3503 (_keys!5485 thiss!1248)) (index!4382 lt!87273)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!176346 () Bool)

(declare-fun e!116350 () Bool)

(declare-fun e!116351 () Bool)

(assert (=> b!176346 (= e!116350 e!116351)))

(declare-fun res!83561 () Bool)

(assert (=> b!176346 (= res!83561 (and ((_ is Intermediate!553) lt!87273) (not (undefined!1365 lt!87273)) (bvslt (x!19337 lt!87273) #b01111111111111111111111111111110) (bvsge (x!19337 lt!87273) #b00000000000000000000000000000000) (bvsge (x!19337 lt!87273) #b00000000000000000000000000000000)))))

(assert (=> b!176346 (=> (not res!83561) (not e!116351))))

(declare-fun b!176347 () Bool)

(declare-fun e!116349 () SeekEntryResult!553)

(assert (=> b!176347 (= e!116349 (Intermediate!553 false (toIndex!0 key!828 (mask!8537 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!53663 () Bool)

(assert (=> d!53663 e!116350))

(declare-fun c!31626 () Bool)

(assert (=> d!53663 (= c!31626 (and ((_ is Intermediate!553) lt!87273) (undefined!1365 lt!87273)))))

(assert (=> d!53663 (= lt!87273 e!116352)))

(declare-fun c!31627 () Bool)

(assert (=> d!53663 (= c!31627 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!87272 () (_ BitVec 64))

(assert (=> d!53663 (= lt!87272 (select (arr!3503 (_keys!5485 thiss!1248)) (toIndex!0 key!828 (mask!8537 thiss!1248))))))

(assert (=> d!53663 (validMask!0 (mask!8537 thiss!1248))))

(assert (=> d!53663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8537 thiss!1248)) key!828 (_keys!5485 thiss!1248) (mask!8537 thiss!1248)) lt!87273)))

(declare-fun b!176348 () Bool)

(assert (=> b!176348 (= e!116350 (bvsge (x!19337 lt!87273) #b01111111111111111111111111111110))))

(declare-fun b!176349 () Bool)

(assert (=> b!176349 (= e!116352 e!116349)))

(declare-fun c!31625 () Bool)

(assert (=> b!176349 (= c!31625 (or (= lt!87272 key!828) (= (bvadd lt!87272 lt!87272) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176350 () Bool)

(assert (=> b!176350 (and (bvsge (index!4382 lt!87273) #b00000000000000000000000000000000) (bvslt (index!4382 lt!87273) (size!3806 (_keys!5485 thiss!1248))))))

(declare-fun res!83562 () Bool)

(assert (=> b!176350 (= res!83562 (= (select (arr!3503 (_keys!5485 thiss!1248)) (index!4382 lt!87273)) key!828))))

(assert (=> b!176350 (=> res!83562 e!116348)))

(assert (=> b!176350 (= e!116351 e!116348)))

(declare-fun b!176351 () Bool)

(assert (=> b!176351 (= e!116349 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8537 thiss!1248)) #b00000000000000000000000000000000 (mask!8537 thiss!1248)) key!828 (_keys!5485 thiss!1248) (mask!8537 thiss!1248)))))

(declare-fun b!176352 () Bool)

(assert (=> b!176352 (and (bvsge (index!4382 lt!87273) #b00000000000000000000000000000000) (bvslt (index!4382 lt!87273) (size!3806 (_keys!5485 thiss!1248))))))

(declare-fun res!83563 () Bool)

(assert (=> b!176352 (= res!83563 (= (select (arr!3503 (_keys!5485 thiss!1248)) (index!4382 lt!87273)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!176352 (=> res!83563 e!116348)))

(assert (= (and d!53663 c!31627) b!176344))

(assert (= (and d!53663 (not c!31627)) b!176349))

(assert (= (and b!176349 c!31625) b!176347))

(assert (= (and b!176349 (not c!31625)) b!176351))

(assert (= (and d!53663 c!31626) b!176348))

(assert (= (and d!53663 (not c!31626)) b!176346))

(assert (= (and b!176346 res!83561) b!176350))

(assert (= (and b!176350 (not res!83562)) b!176352))

(assert (= (and b!176352 (not res!83563)) b!176345))

(declare-fun m!205203 () Bool)

(assert (=> b!176350 m!205203))

(assert (=> b!176352 m!205203))

(assert (=> b!176351 m!204913))

(declare-fun m!205205 () Bool)

(assert (=> b!176351 m!205205))

(assert (=> b!176351 m!205205))

(declare-fun m!205207 () Bool)

(assert (=> b!176351 m!205207))

(assert (=> d!53663 m!204913))

(declare-fun m!205209 () Bool)

(assert (=> d!53663 m!205209))

(assert (=> d!53663 m!204873))

(assert (=> b!176345 m!205203))

(assert (=> d!53587 d!53663))

(declare-fun d!53665 () Bool)

(declare-fun lt!87279 () (_ BitVec 32))

(declare-fun lt!87278 () (_ BitVec 32))

(assert (=> d!53665 (= lt!87279 (bvmul (bvxor lt!87278 (bvlshr lt!87278 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53665 (= lt!87278 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53665 (and (bvsge (mask!8537 thiss!1248) #b00000000000000000000000000000000) (let ((res!83564 (let ((h!2847 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19355 (bvmul (bvxor h!2847 (bvlshr h!2847 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19355 (bvlshr x!19355 #b00000000000000000000000000001101)) (mask!8537 thiss!1248)))))) (and (bvslt res!83564 (bvadd (mask!8537 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!83564 #b00000000000000000000000000000000))))))

(assert (=> d!53665 (= (toIndex!0 key!828 (mask!8537 thiss!1248)) (bvand (bvxor lt!87279 (bvlshr lt!87279 #b00000000000000000000000000001101)) (mask!8537 thiss!1248)))))

(assert (=> d!53587 d!53665))

(assert (=> d!53587 d!53585))

(assert (=> bm!17825 d!53627))

(declare-fun b!176354 () Bool)

(declare-fun e!116353 () Bool)

(assert (=> b!176354 (= e!116353 tp_is_empty!4119)))

(declare-fun b!176353 () Bool)

(declare-fun e!116354 () Bool)

(assert (=> b!176353 (= e!116354 tp_is_empty!4119)))

(declare-fun condMapEmpty!7035 () Bool)

(declare-fun mapDefault!7035 () ValueCell!1716)

(assert (=> mapNonEmpty!7034 (= condMapEmpty!7035 (= mapRest!7034 ((as const (Array (_ BitVec 32) ValueCell!1716)) mapDefault!7035)))))

(declare-fun mapRes!7035 () Bool)

(assert (=> mapNonEmpty!7034 (= tp!15737 (and e!116353 mapRes!7035))))

(declare-fun mapIsEmpty!7035 () Bool)

(assert (=> mapIsEmpty!7035 mapRes!7035))

(declare-fun mapNonEmpty!7035 () Bool)

(declare-fun tp!15738 () Bool)

(assert (=> mapNonEmpty!7035 (= mapRes!7035 (and tp!15738 e!116354))))

(declare-fun mapKey!7035 () (_ BitVec 32))

(declare-fun mapRest!7035 () (Array (_ BitVec 32) ValueCell!1716))

(declare-fun mapValue!7035 () ValueCell!1716)

(assert (=> mapNonEmpty!7035 (= mapRest!7034 (store mapRest!7035 mapKey!7035 mapValue!7035))))

(assert (= (and mapNonEmpty!7034 condMapEmpty!7035) mapIsEmpty!7035))

(assert (= (and mapNonEmpty!7034 (not condMapEmpty!7035)) mapNonEmpty!7035))

(assert (= (and mapNonEmpty!7035 ((_ is ValueCellFull!1716) mapValue!7035)) b!176353))

(assert (= (and mapNonEmpty!7034 ((_ is ValueCellFull!1716) mapDefault!7035)) b!176354))

(declare-fun m!205211 () Bool)

(assert (=> mapNonEmpty!7035 m!205211))

(declare-fun b_lambda!7035 () Bool)

(assert (= b_lambda!7033 (or (and b!176017 b_free!4347) b_lambda!7035)))

(declare-fun b_lambda!7037 () Bool)

(assert (= b_lambda!7031 (or (and b!176017 b_free!4347) b_lambda!7037)))

(check-sat (not d!53605) (not b!176277) (not b!176238) (not d!53639) (not d!53651) (not d!53643) (not d!53635) (not b!176165) (not d!53663) (not b!176170) (not b!176227) (not b!176201) (not d!53601) (not b!176290) (not bm!17836) (not d!53633) (not b!176181) (not b!176209) (not b!176219) (not b_lambda!7029) (not b!176296) (not b!176300) (not bm!17833) (not b!176286) (not d!53647) (not b!176247) (not b!176312) (not b!176351) (not b!176287) (not b!176243) (not b!176281) (not b!176297) (not b!176226) (not d!53615) (not d!53649) (not d!53625) (not b!176221) (not b!176249) (not mapNonEmpty!7035) (not bm!17842) (not b_lambda!7035) b_and!10843 (not b!176279) (not b!176239) (not b!176276) (not d!53659) (not d!53597) (not b!176244) (not b!176311) (not bm!17839) (not b!176163) (not b!176283) (not d!53621) (not d!53657) (not d!53637) (not b_lambda!7037) (not d!53645) (not b!176241) (not d!53593) (not b!176203) (not b!176248) (not b!176323) (not b!176301) (not d!53623) (not b!176288) (not d!53627) (not d!53599) (not b!176278) (not b!176245) (not b!176274) (not b_next!4347) (not d!53631) (not b!176167) (not d!53655) tp_is_empty!4119 (not d!53619) (not d!53629) (not b!176285) (not d!53607) (not b!176164) (not d!53641) (not b!176197) (not d!53653))
(check-sat b_and!10843 (not b_next!4347))
