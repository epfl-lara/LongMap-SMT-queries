; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18198 () Bool)

(assert start!18198)

(declare-fun b!181025 () Bool)

(declare-fun b_free!4473 () Bool)

(declare-fun b_next!4473 () Bool)

(assert (=> b!181025 (= b_free!4473 (not b_next!4473))))

(declare-fun tp!16162 () Bool)

(declare-fun b_and!11015 () Bool)

(assert (=> b!181025 (= tp!16162 b_and!11015)))

(declare-fun res!85721 () Bool)

(declare-fun e!119239 () Bool)

(assert (=> start!18198 (=> (not res!85721) (not e!119239))))

(declare-datatypes ((V!5307 0))(
  ( (V!5308 (val!2167 Int)) )
))
(declare-datatypes ((ValueCell!1779 0))(
  ( (ValueCellFull!1779 (v!4062 V!5307)) (EmptyCell!1779) )
))
(declare-datatypes ((array!7667 0))(
  ( (array!7668 (arr!3629 (Array (_ BitVec 32) (_ BitVec 64))) (size!3938 (_ BitVec 32))) )
))
(declare-datatypes ((array!7669 0))(
  ( (array!7670 (arr!3630 (Array (_ BitVec 32) ValueCell!1779)) (size!3939 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2466 0))(
  ( (LongMapFixedSize!2467 (defaultEntry!3712 Int) (mask!8725 (_ BitVec 32)) (extraKeys!3449 (_ BitVec 32)) (zeroValue!3553 V!5307) (minValue!3553 V!5307) (_size!1282 (_ BitVec 32)) (_keys!5610 array!7667) (_values!3695 array!7669) (_vacant!1282 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2466)

(declare-fun valid!1025 (LongMapFixedSize!2466) Bool)

(assert (=> start!18198 (= res!85721 (valid!1025 thiss!1248))))

(assert (=> start!18198 e!119239))

(declare-fun e!119243 () Bool)

(assert (=> start!18198 e!119243))

(assert (=> start!18198 true))

(declare-fun b!181019 () Bool)

(declare-fun res!85719 () Bool)

(assert (=> b!181019 (=> (not res!85719) (not e!119239))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!181019 (= res!85719 (not (= key!828 (bvneg key!828))))))

(declare-fun b!181020 () Bool)

(declare-fun e!119241 () Bool)

(assert (=> b!181020 (= e!119239 e!119241)))

(declare-fun res!85718 () Bool)

(assert (=> b!181020 (=> (not res!85718) (not e!119241))))

(declare-datatypes ((SeekEntryResult!598 0))(
  ( (MissingZero!598 (index!4562 (_ BitVec 32))) (Found!598 (index!4563 (_ BitVec 32))) (Intermediate!598 (undefined!1410 Bool) (index!4564 (_ BitVec 32)) (x!19776 (_ BitVec 32))) (Undefined!598) (MissingVacant!598 (index!4565 (_ BitVec 32))) )
))
(declare-fun lt!89479 () SeekEntryResult!598)

(get-info :version)

(assert (=> b!181020 (= res!85718 (and (not ((_ is Undefined!598) lt!89479)) (not ((_ is MissingVacant!598) lt!89479)) (not ((_ is MissingZero!598) lt!89479)) ((_ is Found!598) lt!89479)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7667 (_ BitVec 32)) SeekEntryResult!598)

(assert (=> b!181020 (= lt!89479 (seekEntryOrOpen!0 key!828 (_keys!5610 thiss!1248) (mask!8725 thiss!1248)))))

(declare-fun mapIsEmpty!7274 () Bool)

(declare-fun mapRes!7274 () Bool)

(assert (=> mapIsEmpty!7274 mapRes!7274))

(declare-fun b!181021 () Bool)

(declare-fun e!119237 () Bool)

(declare-fun tp_is_empty!4245 () Bool)

(assert (=> b!181021 (= e!119237 tp_is_empty!4245)))

(declare-fun mapNonEmpty!7274 () Bool)

(declare-fun tp!16163 () Bool)

(declare-fun e!119242 () Bool)

(assert (=> mapNonEmpty!7274 (= mapRes!7274 (and tp!16163 e!119242))))

(declare-fun mapRest!7274 () (Array (_ BitVec 32) ValueCell!1779))

(declare-fun mapValue!7274 () ValueCell!1779)

(declare-fun mapKey!7274 () (_ BitVec 32))

(assert (=> mapNonEmpty!7274 (= (arr!3630 (_values!3695 thiss!1248)) (store mapRest!7274 mapKey!7274 mapValue!7274))))

(declare-fun b!181022 () Bool)

(declare-fun e!119238 () Bool)

(assert (=> b!181022 (= e!119238 (and e!119237 mapRes!7274))))

(declare-fun condMapEmpty!7274 () Bool)

(declare-fun mapDefault!7274 () ValueCell!1779)

(assert (=> b!181022 (= condMapEmpty!7274 (= (arr!3630 (_values!3695 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1779)) mapDefault!7274)))))

(declare-fun b!181023 () Bool)

(assert (=> b!181023 (= e!119241 (and (= (size!3939 (_values!3695 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8725 thiss!1248))) (not (= (size!3938 (_keys!5610 thiss!1248)) (size!3939 (_values!3695 thiss!1248))))))))

(declare-fun b!181024 () Bool)

(declare-fun res!85720 () Bool)

(assert (=> b!181024 (=> (not res!85720) (not e!119241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181024 (= res!85720 (validMask!0 (mask!8725 thiss!1248)))))

(declare-fun array_inv!2339 (array!7667) Bool)

(declare-fun array_inv!2340 (array!7669) Bool)

(assert (=> b!181025 (= e!119243 (and tp!16162 tp_is_empty!4245 (array_inv!2339 (_keys!5610 thiss!1248)) (array_inv!2340 (_values!3695 thiss!1248)) e!119238))))

(declare-fun b!181026 () Bool)

(assert (=> b!181026 (= e!119242 tp_is_empty!4245)))

(declare-fun b!181027 () Bool)

(declare-fun res!85722 () Bool)

(assert (=> b!181027 (=> (not res!85722) (not e!119241))))

(declare-datatypes ((tuple2!3380 0))(
  ( (tuple2!3381 (_1!1701 (_ BitVec 64)) (_2!1701 V!5307)) )
))
(declare-datatypes ((List!2303 0))(
  ( (Nil!2300) (Cons!2299 (h!2925 tuple2!3380) (t!7155 List!2303)) )
))
(declare-datatypes ((ListLongMap!2297 0))(
  ( (ListLongMap!2298 (toList!1164 List!2303)) )
))
(declare-fun contains!1242 (ListLongMap!2297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!812 (array!7667 array!7669 (_ BitVec 32) (_ BitVec 32) V!5307 V!5307 (_ BitVec 32) Int) ListLongMap!2297)

(assert (=> b!181027 (= res!85722 (contains!1242 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)) key!828))))

(assert (= (and start!18198 res!85721) b!181019))

(assert (= (and b!181019 res!85719) b!181020))

(assert (= (and b!181020 res!85718) b!181027))

(assert (= (and b!181027 res!85722) b!181024))

(assert (= (and b!181024 res!85720) b!181023))

(assert (= (and b!181022 condMapEmpty!7274) mapIsEmpty!7274))

(assert (= (and b!181022 (not condMapEmpty!7274)) mapNonEmpty!7274))

(assert (= (and mapNonEmpty!7274 ((_ is ValueCellFull!1779) mapValue!7274)) b!181026))

(assert (= (and b!181022 ((_ is ValueCellFull!1779) mapDefault!7274)) b!181021))

(assert (= b!181025 b!181022))

(assert (= start!18198 b!181025))

(declare-fun m!208971 () Bool)

(assert (=> b!181024 m!208971))

(declare-fun m!208973 () Bool)

(assert (=> mapNonEmpty!7274 m!208973))

(declare-fun m!208975 () Bool)

(assert (=> start!18198 m!208975))

(declare-fun m!208977 () Bool)

(assert (=> b!181020 m!208977))

(declare-fun m!208979 () Bool)

(assert (=> b!181027 m!208979))

(assert (=> b!181027 m!208979))

(declare-fun m!208981 () Bool)

(assert (=> b!181027 m!208981))

(declare-fun m!208983 () Bool)

(assert (=> b!181025 m!208983))

(declare-fun m!208985 () Bool)

(assert (=> b!181025 m!208985))

(check-sat (not start!18198) (not b!181020) tp_is_empty!4245 b_and!11015 (not b!181025) (not b_next!4473) (not b!181027) (not mapNonEmpty!7274) (not b!181024))
(check-sat b_and!11015 (not b_next!4473))
(get-model)

(declare-fun d!54339 () Bool)

(declare-fun e!119270 () Bool)

(assert (=> d!54339 e!119270))

(declare-fun res!85740 () Bool)

(assert (=> d!54339 (=> res!85740 e!119270)))

(declare-fun lt!89491 () Bool)

(assert (=> d!54339 (= res!85740 (not lt!89491))))

(declare-fun lt!89492 () Bool)

(assert (=> d!54339 (= lt!89491 lt!89492)))

(declare-datatypes ((Unit!5504 0))(
  ( (Unit!5505) )
))
(declare-fun lt!89494 () Unit!5504)

(declare-fun e!119269 () Unit!5504)

(assert (=> d!54339 (= lt!89494 e!119269)))

(declare-fun c!32430 () Bool)

(assert (=> d!54339 (= c!32430 lt!89492)))

(declare-fun containsKey!212 (List!2303 (_ BitVec 64)) Bool)

(assert (=> d!54339 (= lt!89492 (containsKey!212 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828))))

(assert (=> d!54339 (= (contains!1242 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)) key!828) lt!89491)))

(declare-fun b!181061 () Bool)

(declare-fun lt!89493 () Unit!5504)

(assert (=> b!181061 (= e!119269 lt!89493)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!160 (List!2303 (_ BitVec 64)) Unit!5504)

(assert (=> b!181061 (= lt!89493 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828))))

(declare-datatypes ((Option!214 0))(
  ( (Some!213 (v!4064 V!5307)) (None!212) )
))
(declare-fun isDefined!161 (Option!214) Bool)

(declare-fun getValueByKey!208 (List!2303 (_ BitVec 64)) Option!214)

(assert (=> b!181061 (isDefined!161 (getValueByKey!208 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828))))

(declare-fun b!181062 () Bool)

(declare-fun Unit!5506 () Unit!5504)

(assert (=> b!181062 (= e!119269 Unit!5506)))

(declare-fun b!181063 () Bool)

(assert (=> b!181063 (= e!119270 (isDefined!161 (getValueByKey!208 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828)))))

(assert (= (and d!54339 c!32430) b!181061))

(assert (= (and d!54339 (not c!32430)) b!181062))

(assert (= (and d!54339 (not res!85740)) b!181063))

(declare-fun m!209003 () Bool)

(assert (=> d!54339 m!209003))

(declare-fun m!209005 () Bool)

(assert (=> b!181061 m!209005))

(declare-fun m!209007 () Bool)

(assert (=> b!181061 m!209007))

(assert (=> b!181061 m!209007))

(declare-fun m!209009 () Bool)

(assert (=> b!181061 m!209009))

(assert (=> b!181063 m!209007))

(assert (=> b!181063 m!209007))

(assert (=> b!181063 m!209009))

(assert (=> b!181027 d!54339))

(declare-fun bm!18301 () Bool)

(declare-fun call!18304 () ListLongMap!2297)

(declare-fun call!18309 () ListLongMap!2297)

(assert (=> bm!18301 (= call!18304 call!18309)))

(declare-fun b!181106 () Bool)

(declare-fun e!119309 () ListLongMap!2297)

(declare-fun e!119308 () ListLongMap!2297)

(assert (=> b!181106 (= e!119309 e!119308)))

(declare-fun c!32444 () Bool)

(assert (=> b!181106 (= c!32444 (and (not (= (bvand (extraKeys!3449 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3449 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181107 () Bool)

(declare-fun e!119300 () Bool)

(declare-fun e!119297 () Bool)

(assert (=> b!181107 (= e!119300 e!119297)))

(declare-fun res!85759 () Bool)

(declare-fun call!18307 () Bool)

(assert (=> b!181107 (= res!85759 call!18307)))

(assert (=> b!181107 (=> (not res!85759) (not e!119297))))

(declare-fun b!181108 () Bool)

(declare-fun e!119304 () Unit!5504)

(declare-fun Unit!5507 () Unit!5504)

(assert (=> b!181108 (= e!119304 Unit!5507)))

(declare-fun call!18306 () ListLongMap!2297)

(declare-fun call!18308 () ListLongMap!2297)

(declare-fun c!32447 () Bool)

(declare-fun bm!18302 () Bool)

(declare-fun +!271 (ListLongMap!2297 tuple2!3380) ListLongMap!2297)

(assert (=> bm!18302 (= call!18306 (+!271 (ite c!32447 call!18308 (ite c!32444 call!18309 call!18304)) (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))))))

(declare-fun b!181109 () Bool)

(assert (=> b!181109 (= e!119309 (+!271 call!18306 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))))))

(declare-fun b!181110 () Bool)

(declare-fun e!119299 () Bool)

(declare-fun e!119301 () Bool)

(assert (=> b!181110 (= e!119299 e!119301)))

(declare-fun res!85765 () Bool)

(declare-fun call!18310 () Bool)

(assert (=> b!181110 (= res!85765 call!18310)))

(assert (=> b!181110 (=> (not res!85765) (not e!119301))))

(declare-fun d!54341 () Bool)

(declare-fun e!119303 () Bool)

(assert (=> d!54341 e!119303))

(declare-fun res!85767 () Bool)

(assert (=> d!54341 (=> (not res!85767) (not e!119303))))

(assert (=> d!54341 (= res!85767 (or (bvsge #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))))

(declare-fun lt!89553 () ListLongMap!2297)

(declare-fun lt!89540 () ListLongMap!2297)

(assert (=> d!54341 (= lt!89553 lt!89540)))

(declare-fun lt!89556 () Unit!5504)

(assert (=> d!54341 (= lt!89556 e!119304)))

(declare-fun c!32448 () Bool)

(declare-fun e!119298 () Bool)

(assert (=> d!54341 (= c!32448 e!119298)))

(declare-fun res!85763 () Bool)

(assert (=> d!54341 (=> (not res!85763) (not e!119298))))

(assert (=> d!54341 (= res!85763 (bvslt #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(assert (=> d!54341 (= lt!89540 e!119309)))

(assert (=> d!54341 (= c!32447 (and (not (= (bvand (extraKeys!3449 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3449 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54341 (validMask!0 (mask!8725 thiss!1248))))

(assert (=> d!54341 (= (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)) lt!89553)))

(declare-fun b!181111 () Bool)

(declare-fun e!119306 () ListLongMap!2297)

(declare-fun call!18305 () ListLongMap!2297)

(assert (=> b!181111 (= e!119306 call!18305)))

(declare-fun bm!18303 () Bool)

(assert (=> bm!18303 (= call!18310 (contains!1242 lt!89553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181112 () Bool)

(declare-fun res!85766 () Bool)

(assert (=> b!181112 (=> (not res!85766) (not e!119303))))

(declare-fun e!119305 () Bool)

(assert (=> b!181112 (= res!85766 e!119305)))

(declare-fun res!85762 () Bool)

(assert (=> b!181112 (=> res!85762 e!119305)))

(declare-fun e!119307 () Bool)

(assert (=> b!181112 (= res!85762 (not e!119307))))

(declare-fun res!85761 () Bool)

(assert (=> b!181112 (=> (not res!85761) (not e!119307))))

(assert (=> b!181112 (= res!85761 (bvslt #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(declare-fun b!181113 () Bool)

(declare-fun lt!89557 () Unit!5504)

(assert (=> b!181113 (= e!119304 lt!89557)))

(declare-fun lt!89541 () ListLongMap!2297)

(declare-fun getCurrentListMapNoExtraKeys!184 (array!7667 array!7669 (_ BitVec 32) (_ BitVec 32) V!5307 V!5307 (_ BitVec 32) Int) ListLongMap!2297)

(assert (=> b!181113 (= lt!89541 (getCurrentListMapNoExtraKeys!184 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))))

(declare-fun lt!89539 () (_ BitVec 64))

(assert (=> b!181113 (= lt!89539 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89554 () (_ BitVec 64))

(assert (=> b!181113 (= lt!89554 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89548 () Unit!5504)

(declare-fun addStillContains!127 (ListLongMap!2297 (_ BitVec 64) V!5307 (_ BitVec 64)) Unit!5504)

(assert (=> b!181113 (= lt!89548 (addStillContains!127 lt!89541 lt!89539 (zeroValue!3553 thiss!1248) lt!89554))))

(assert (=> b!181113 (contains!1242 (+!271 lt!89541 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248))) lt!89554)))

(declare-fun lt!89559 () Unit!5504)

(assert (=> b!181113 (= lt!89559 lt!89548)))

(declare-fun lt!89542 () ListLongMap!2297)

(assert (=> b!181113 (= lt!89542 (getCurrentListMapNoExtraKeys!184 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))))

(declare-fun lt!89552 () (_ BitVec 64))

(assert (=> b!181113 (= lt!89552 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89550 () (_ BitVec 64))

(assert (=> b!181113 (= lt!89550 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89558 () Unit!5504)

(declare-fun addApplyDifferent!127 (ListLongMap!2297 (_ BitVec 64) V!5307 (_ BitVec 64)) Unit!5504)

(assert (=> b!181113 (= lt!89558 (addApplyDifferent!127 lt!89542 lt!89552 (minValue!3553 thiss!1248) lt!89550))))

(declare-fun apply!151 (ListLongMap!2297 (_ BitVec 64)) V!5307)

(assert (=> b!181113 (= (apply!151 (+!271 lt!89542 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248))) lt!89550) (apply!151 lt!89542 lt!89550))))

(declare-fun lt!89551 () Unit!5504)

(assert (=> b!181113 (= lt!89551 lt!89558)))

(declare-fun lt!89544 () ListLongMap!2297)

(assert (=> b!181113 (= lt!89544 (getCurrentListMapNoExtraKeys!184 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))))

(declare-fun lt!89547 () (_ BitVec 64))

(assert (=> b!181113 (= lt!89547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89555 () (_ BitVec 64))

(assert (=> b!181113 (= lt!89555 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89545 () Unit!5504)

(assert (=> b!181113 (= lt!89545 (addApplyDifferent!127 lt!89544 lt!89547 (zeroValue!3553 thiss!1248) lt!89555))))

(assert (=> b!181113 (= (apply!151 (+!271 lt!89544 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248))) lt!89555) (apply!151 lt!89544 lt!89555))))

(declare-fun lt!89560 () Unit!5504)

(assert (=> b!181113 (= lt!89560 lt!89545)))

(declare-fun lt!89549 () ListLongMap!2297)

(assert (=> b!181113 (= lt!89549 (getCurrentListMapNoExtraKeys!184 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))))

(declare-fun lt!89543 () (_ BitVec 64))

(assert (=> b!181113 (= lt!89543 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89546 () (_ BitVec 64))

(assert (=> b!181113 (= lt!89546 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181113 (= lt!89557 (addApplyDifferent!127 lt!89549 lt!89543 (minValue!3553 thiss!1248) lt!89546))))

(assert (=> b!181113 (= (apply!151 (+!271 lt!89549 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248))) lt!89546) (apply!151 lt!89549 lt!89546))))

(declare-fun b!181114 () Bool)

(declare-fun c!32445 () Bool)

(assert (=> b!181114 (= c!32445 (and (not (= (bvand (extraKeys!3449 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3449 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!181114 (= e!119308 e!119306)))

(declare-fun b!181115 () Bool)

(declare-fun e!119302 () Bool)

(declare-fun get!2073 (ValueCell!1779 V!5307) V!5307)

(declare-fun dynLambda!494 (Int (_ BitVec 64)) V!5307)

(assert (=> b!181115 (= e!119302 (= (apply!151 lt!89553 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)) (get!2073 (select (arr!3630 (_values!3695 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3712 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3939 (_values!3695 thiss!1248))))))

(assert (=> b!181115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(declare-fun b!181116 () Bool)

(assert (=> b!181116 (= e!119301 (= (apply!151 lt!89553 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3553 thiss!1248)))))

(declare-fun b!181117 () Bool)

(assert (=> b!181117 (= e!119300 (not call!18307))))

(declare-fun bm!18304 () Bool)

(assert (=> bm!18304 (= call!18308 (getCurrentListMapNoExtraKeys!184 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))))

(declare-fun b!181118 () Bool)

(declare-fun res!85760 () Bool)

(assert (=> b!181118 (=> (not res!85760) (not e!119303))))

(assert (=> b!181118 (= res!85760 e!119299)))

(declare-fun c!32443 () Bool)

(assert (=> b!181118 (= c!32443 (not (= (bvand (extraKeys!3449 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!181119 () Bool)

(assert (=> b!181119 (= e!119306 call!18304)))

(declare-fun bm!18305 () Bool)

(assert (=> bm!18305 (= call!18309 call!18308)))

(declare-fun b!181120 () Bool)

(assert (=> b!181120 (= e!119308 call!18305)))

(declare-fun bm!18306 () Bool)

(assert (=> bm!18306 (= call!18307 (contains!1242 lt!89553 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181121 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!181121 (= e!119298 (validKeyInArray!0 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18307 () Bool)

(assert (=> bm!18307 (= call!18305 call!18306)))

(declare-fun b!181122 () Bool)

(assert (=> b!181122 (= e!119307 (validKeyInArray!0 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181123 () Bool)

(assert (=> b!181123 (= e!119305 e!119302)))

(declare-fun res!85764 () Bool)

(assert (=> b!181123 (=> (not res!85764) (not e!119302))))

(assert (=> b!181123 (= res!85764 (contains!1242 lt!89553 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181123 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(declare-fun b!181124 () Bool)

(assert (=> b!181124 (= e!119303 e!119300)))

(declare-fun c!32446 () Bool)

(assert (=> b!181124 (= c!32446 (not (= (bvand (extraKeys!3449 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181125 () Bool)

(assert (=> b!181125 (= e!119299 (not call!18310))))

(declare-fun b!181126 () Bool)

(assert (=> b!181126 (= e!119297 (= (apply!151 lt!89553 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3553 thiss!1248)))))

(assert (= (and d!54341 c!32447) b!181109))

(assert (= (and d!54341 (not c!32447)) b!181106))

(assert (= (and b!181106 c!32444) b!181120))

(assert (= (and b!181106 (not c!32444)) b!181114))

(assert (= (and b!181114 c!32445) b!181111))

(assert (= (and b!181114 (not c!32445)) b!181119))

(assert (= (or b!181111 b!181119) bm!18301))

(assert (= (or b!181120 bm!18301) bm!18305))

(assert (= (or b!181120 b!181111) bm!18307))

(assert (= (or b!181109 bm!18305) bm!18304))

(assert (= (or b!181109 bm!18307) bm!18302))

(assert (= (and d!54341 res!85763) b!181121))

(assert (= (and d!54341 c!32448) b!181113))

(assert (= (and d!54341 (not c!32448)) b!181108))

(assert (= (and d!54341 res!85767) b!181112))

(assert (= (and b!181112 res!85761) b!181122))

(assert (= (and b!181112 (not res!85762)) b!181123))

(assert (= (and b!181123 res!85764) b!181115))

(assert (= (and b!181112 res!85766) b!181118))

(assert (= (and b!181118 c!32443) b!181110))

(assert (= (and b!181118 (not c!32443)) b!181125))

(assert (= (and b!181110 res!85765) b!181116))

(assert (= (or b!181110 b!181125) bm!18303))

(assert (= (and b!181118 res!85760) b!181124))

(assert (= (and b!181124 c!32446) b!181107))

(assert (= (and b!181124 (not c!32446)) b!181117))

(assert (= (and b!181107 res!85759) b!181126))

(assert (= (or b!181107 b!181117) bm!18306))

(declare-fun b_lambda!7135 () Bool)

(assert (=> (not b_lambda!7135) (not b!181115)))

(declare-fun t!7158 () Bool)

(declare-fun tb!2813 () Bool)

(assert (=> (and b!181025 (= (defaultEntry!3712 thiss!1248) (defaultEntry!3712 thiss!1248)) t!7158) tb!2813))

(declare-fun result!4717 () Bool)

(assert (=> tb!2813 (= result!4717 tp_is_empty!4245)))

(assert (=> b!181115 t!7158))

(declare-fun b_and!11019 () Bool)

(assert (= b_and!11015 (and (=> t!7158 result!4717) b_and!11019)))

(declare-fun m!209011 () Bool)

(assert (=> b!181122 m!209011))

(assert (=> b!181122 m!209011))

(declare-fun m!209013 () Bool)

(assert (=> b!181122 m!209013))

(assert (=> b!181121 m!209011))

(assert (=> b!181121 m!209011))

(assert (=> b!181121 m!209013))

(assert (=> b!181115 m!209011))

(declare-fun m!209015 () Bool)

(assert (=> b!181115 m!209015))

(assert (=> b!181115 m!209011))

(declare-fun m!209017 () Bool)

(assert (=> b!181115 m!209017))

(assert (=> b!181115 m!209017))

(declare-fun m!209019 () Bool)

(assert (=> b!181115 m!209019))

(declare-fun m!209021 () Bool)

(assert (=> b!181115 m!209021))

(assert (=> b!181115 m!209019))

(declare-fun m!209023 () Bool)

(assert (=> b!181109 m!209023))

(assert (=> b!181123 m!209011))

(assert (=> b!181123 m!209011))

(declare-fun m!209025 () Bool)

(assert (=> b!181123 m!209025))

(declare-fun m!209027 () Bool)

(assert (=> b!181116 m!209027))

(declare-fun m!209029 () Bool)

(assert (=> bm!18302 m!209029))

(declare-fun m!209031 () Bool)

(assert (=> b!181126 m!209031))

(assert (=> d!54341 m!208971))

(declare-fun m!209033 () Bool)

(assert (=> b!181113 m!209033))

(declare-fun m!209035 () Bool)

(assert (=> b!181113 m!209035))

(declare-fun m!209037 () Bool)

(assert (=> b!181113 m!209037))

(declare-fun m!209039 () Bool)

(assert (=> b!181113 m!209039))

(declare-fun m!209041 () Bool)

(assert (=> b!181113 m!209041))

(declare-fun m!209043 () Bool)

(assert (=> b!181113 m!209043))

(declare-fun m!209045 () Bool)

(assert (=> b!181113 m!209045))

(declare-fun m!209047 () Bool)

(assert (=> b!181113 m!209047))

(declare-fun m!209049 () Bool)

(assert (=> b!181113 m!209049))

(declare-fun m!209051 () Bool)

(assert (=> b!181113 m!209051))

(declare-fun m!209053 () Bool)

(assert (=> b!181113 m!209053))

(assert (=> b!181113 m!209045))

(declare-fun m!209055 () Bool)

(assert (=> b!181113 m!209055))

(assert (=> b!181113 m!209033))

(assert (=> b!181113 m!209011))

(declare-fun m!209057 () Bool)

(assert (=> b!181113 m!209057))

(assert (=> b!181113 m!209057))

(declare-fun m!209059 () Bool)

(assert (=> b!181113 m!209059))

(declare-fun m!209061 () Bool)

(assert (=> b!181113 m!209061))

(declare-fun m!209063 () Bool)

(assert (=> b!181113 m!209063))

(assert (=> b!181113 m!209037))

(declare-fun m!209065 () Bool)

(assert (=> bm!18303 m!209065))

(declare-fun m!209067 () Bool)

(assert (=> bm!18306 m!209067))

(assert (=> bm!18304 m!209049))

(assert (=> b!181027 d!54341))

(declare-fun d!54343 () Bool)

(assert (=> d!54343 (= (array_inv!2339 (_keys!5610 thiss!1248)) (bvsge (size!3938 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181025 d!54343))

(declare-fun d!54345 () Bool)

(assert (=> d!54345 (= (array_inv!2340 (_values!3695 thiss!1248)) (bvsge (size!3939 (_values!3695 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181025 d!54345))

(declare-fun d!54347 () Bool)

(declare-fun res!85774 () Bool)

(declare-fun e!119312 () Bool)

(assert (=> d!54347 (=> (not res!85774) (not e!119312))))

(declare-fun simpleValid!167 (LongMapFixedSize!2466) Bool)

(assert (=> d!54347 (= res!85774 (simpleValid!167 thiss!1248))))

(assert (=> d!54347 (= (valid!1025 thiss!1248) e!119312)))

(declare-fun b!181135 () Bool)

(declare-fun res!85775 () Bool)

(assert (=> b!181135 (=> (not res!85775) (not e!119312))))

(declare-fun arrayCountValidKeys!0 (array!7667 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181135 (= res!85775 (= (arrayCountValidKeys!0 (_keys!5610 thiss!1248) #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))) (_size!1282 thiss!1248)))))

(declare-fun b!181136 () Bool)

(declare-fun res!85776 () Bool)

(assert (=> b!181136 (=> (not res!85776) (not e!119312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7667 (_ BitVec 32)) Bool)

(assert (=> b!181136 (= res!85776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5610 thiss!1248) (mask!8725 thiss!1248)))))

(declare-fun b!181137 () Bool)

(declare-datatypes ((List!2305 0))(
  ( (Nil!2302) (Cons!2301 (h!2927 (_ BitVec 64)) (t!7159 List!2305)) )
))
(declare-fun arrayNoDuplicates!0 (array!7667 (_ BitVec 32) List!2305) Bool)

(assert (=> b!181137 (= e!119312 (arrayNoDuplicates!0 (_keys!5610 thiss!1248) #b00000000000000000000000000000000 Nil!2302))))

(assert (= (and d!54347 res!85774) b!181135))

(assert (= (and b!181135 res!85775) b!181136))

(assert (= (and b!181136 res!85776) b!181137))

(declare-fun m!209069 () Bool)

(assert (=> d!54347 m!209069))

(declare-fun m!209071 () Bool)

(assert (=> b!181135 m!209071))

(declare-fun m!209073 () Bool)

(assert (=> b!181136 m!209073))

(declare-fun m!209075 () Bool)

(assert (=> b!181137 m!209075))

(assert (=> start!18198 d!54347))

(declare-fun b!181150 () Bool)

(declare-fun e!119320 () SeekEntryResult!598)

(declare-fun lt!89568 () SeekEntryResult!598)

(assert (=> b!181150 (= e!119320 (Found!598 (index!4564 lt!89568)))))

(declare-fun b!181151 () Bool)

(declare-fun e!119319 () SeekEntryResult!598)

(assert (=> b!181151 (= e!119319 Undefined!598)))

(declare-fun b!181152 () Bool)

(assert (=> b!181152 (= e!119319 e!119320)))

(declare-fun lt!89567 () (_ BitVec 64))

(assert (=> b!181152 (= lt!89567 (select (arr!3629 (_keys!5610 thiss!1248)) (index!4564 lt!89568)))))

(declare-fun c!32456 () Bool)

(assert (=> b!181152 (= c!32456 (= lt!89567 key!828))))

(declare-fun d!54349 () Bool)

(declare-fun lt!89569 () SeekEntryResult!598)

(assert (=> d!54349 (and (or ((_ is Undefined!598) lt!89569) (not ((_ is Found!598) lt!89569)) (and (bvsge (index!4563 lt!89569) #b00000000000000000000000000000000) (bvslt (index!4563 lt!89569) (size!3938 (_keys!5610 thiss!1248))))) (or ((_ is Undefined!598) lt!89569) ((_ is Found!598) lt!89569) (not ((_ is MissingZero!598) lt!89569)) (and (bvsge (index!4562 lt!89569) #b00000000000000000000000000000000) (bvslt (index!4562 lt!89569) (size!3938 (_keys!5610 thiss!1248))))) (or ((_ is Undefined!598) lt!89569) ((_ is Found!598) lt!89569) ((_ is MissingZero!598) lt!89569) (not ((_ is MissingVacant!598) lt!89569)) (and (bvsge (index!4565 lt!89569) #b00000000000000000000000000000000) (bvslt (index!4565 lt!89569) (size!3938 (_keys!5610 thiss!1248))))) (or ((_ is Undefined!598) lt!89569) (ite ((_ is Found!598) lt!89569) (= (select (arr!3629 (_keys!5610 thiss!1248)) (index!4563 lt!89569)) key!828) (ite ((_ is MissingZero!598) lt!89569) (= (select (arr!3629 (_keys!5610 thiss!1248)) (index!4562 lt!89569)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!598) lt!89569) (= (select (arr!3629 (_keys!5610 thiss!1248)) (index!4565 lt!89569)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54349 (= lt!89569 e!119319)))

(declare-fun c!32457 () Bool)

(assert (=> d!54349 (= c!32457 (and ((_ is Intermediate!598) lt!89568) (undefined!1410 lt!89568)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7667 (_ BitVec 32)) SeekEntryResult!598)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54349 (= lt!89568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8725 thiss!1248)) key!828 (_keys!5610 thiss!1248) (mask!8725 thiss!1248)))))

(assert (=> d!54349 (validMask!0 (mask!8725 thiss!1248))))

(assert (=> d!54349 (= (seekEntryOrOpen!0 key!828 (_keys!5610 thiss!1248) (mask!8725 thiss!1248)) lt!89569)))

(declare-fun b!181153 () Bool)

(declare-fun e!119321 () SeekEntryResult!598)

(assert (=> b!181153 (= e!119321 (MissingZero!598 (index!4564 lt!89568)))))

(declare-fun b!181154 () Bool)

(declare-fun c!32455 () Bool)

(assert (=> b!181154 (= c!32455 (= lt!89567 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181154 (= e!119320 e!119321)))

(declare-fun b!181155 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7667 (_ BitVec 32)) SeekEntryResult!598)

(assert (=> b!181155 (= e!119321 (seekKeyOrZeroReturnVacant!0 (x!19776 lt!89568) (index!4564 lt!89568) (index!4564 lt!89568) key!828 (_keys!5610 thiss!1248) (mask!8725 thiss!1248)))))

(assert (= (and d!54349 c!32457) b!181151))

(assert (= (and d!54349 (not c!32457)) b!181152))

(assert (= (and b!181152 c!32456) b!181150))

(assert (= (and b!181152 (not c!32456)) b!181154))

(assert (= (and b!181154 c!32455) b!181153))

(assert (= (and b!181154 (not c!32455)) b!181155))

(declare-fun m!209077 () Bool)

(assert (=> b!181152 m!209077))

(assert (=> d!54349 m!208971))

(declare-fun m!209079 () Bool)

(assert (=> d!54349 m!209079))

(declare-fun m!209081 () Bool)

(assert (=> d!54349 m!209081))

(declare-fun m!209083 () Bool)

(assert (=> d!54349 m!209083))

(declare-fun m!209085 () Bool)

(assert (=> d!54349 m!209085))

(declare-fun m!209087 () Bool)

(assert (=> d!54349 m!209087))

(assert (=> d!54349 m!209079))

(declare-fun m!209089 () Bool)

(assert (=> b!181155 m!209089))

(assert (=> b!181020 d!54349))

(declare-fun d!54351 () Bool)

(assert (=> d!54351 (= (validMask!0 (mask!8725 thiss!1248)) (and (or (= (mask!8725 thiss!1248) #b00000000000000000000000000000111) (= (mask!8725 thiss!1248) #b00000000000000000000000000001111) (= (mask!8725 thiss!1248) #b00000000000000000000000000011111) (= (mask!8725 thiss!1248) #b00000000000000000000000000111111) (= (mask!8725 thiss!1248) #b00000000000000000000000001111111) (= (mask!8725 thiss!1248) #b00000000000000000000000011111111) (= (mask!8725 thiss!1248) #b00000000000000000000000111111111) (= (mask!8725 thiss!1248) #b00000000000000000000001111111111) (= (mask!8725 thiss!1248) #b00000000000000000000011111111111) (= (mask!8725 thiss!1248) #b00000000000000000000111111111111) (= (mask!8725 thiss!1248) #b00000000000000000001111111111111) (= (mask!8725 thiss!1248) #b00000000000000000011111111111111) (= (mask!8725 thiss!1248) #b00000000000000000111111111111111) (= (mask!8725 thiss!1248) #b00000000000000001111111111111111) (= (mask!8725 thiss!1248) #b00000000000000011111111111111111) (= (mask!8725 thiss!1248) #b00000000000000111111111111111111) (= (mask!8725 thiss!1248) #b00000000000001111111111111111111) (= (mask!8725 thiss!1248) #b00000000000011111111111111111111) (= (mask!8725 thiss!1248) #b00000000000111111111111111111111) (= (mask!8725 thiss!1248) #b00000000001111111111111111111111) (= (mask!8725 thiss!1248) #b00000000011111111111111111111111) (= (mask!8725 thiss!1248) #b00000000111111111111111111111111) (= (mask!8725 thiss!1248) #b00000001111111111111111111111111) (= (mask!8725 thiss!1248) #b00000011111111111111111111111111) (= (mask!8725 thiss!1248) #b00000111111111111111111111111111) (= (mask!8725 thiss!1248) #b00001111111111111111111111111111) (= (mask!8725 thiss!1248) #b00011111111111111111111111111111) (= (mask!8725 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8725 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!181024 d!54351))

(declare-fun b!181163 () Bool)

(declare-fun e!119326 () Bool)

(assert (=> b!181163 (= e!119326 tp_is_empty!4245)))

(declare-fun b!181162 () Bool)

(declare-fun e!119327 () Bool)

(assert (=> b!181162 (= e!119327 tp_is_empty!4245)))

(declare-fun condMapEmpty!7280 () Bool)

(declare-fun mapDefault!7280 () ValueCell!1779)

(assert (=> mapNonEmpty!7274 (= condMapEmpty!7280 (= mapRest!7274 ((as const (Array (_ BitVec 32) ValueCell!1779)) mapDefault!7280)))))

(declare-fun mapRes!7280 () Bool)

(assert (=> mapNonEmpty!7274 (= tp!16163 (and e!119326 mapRes!7280))))

(declare-fun mapNonEmpty!7280 () Bool)

(declare-fun tp!16172 () Bool)

(assert (=> mapNonEmpty!7280 (= mapRes!7280 (and tp!16172 e!119327))))

(declare-fun mapRest!7280 () (Array (_ BitVec 32) ValueCell!1779))

(declare-fun mapValue!7280 () ValueCell!1779)

(declare-fun mapKey!7280 () (_ BitVec 32))

(assert (=> mapNonEmpty!7280 (= mapRest!7274 (store mapRest!7280 mapKey!7280 mapValue!7280))))

(declare-fun mapIsEmpty!7280 () Bool)

(assert (=> mapIsEmpty!7280 mapRes!7280))

(assert (= (and mapNonEmpty!7274 condMapEmpty!7280) mapIsEmpty!7280))

(assert (= (and mapNonEmpty!7274 (not condMapEmpty!7280)) mapNonEmpty!7280))

(assert (= (and mapNonEmpty!7280 ((_ is ValueCellFull!1779) mapValue!7280)) b!181162))

(assert (= (and mapNonEmpty!7274 ((_ is ValueCellFull!1779) mapDefault!7280)) b!181163))

(declare-fun m!209091 () Bool)

(assert (=> mapNonEmpty!7280 m!209091))

(declare-fun b_lambda!7137 () Bool)

(assert (= b_lambda!7135 (or (and b!181025 b_free!4473) b_lambda!7137)))

(check-sat (not b!181121) (not bm!18306) (not bm!18302) (not d!54339) (not d!54349) (not b!181063) (not bm!18304) (not b!181109) (not d!54347) (not mapNonEmpty!7280) (not d!54341) (not b!181135) (not b!181123) (not b!181061) (not bm!18303) tp_is_empty!4245 (not b!181137) (not b!181126) (not b_lambda!7137) (not b!181122) (not b!181155) (not b!181115) (not b!181113) (not b_next!4473) b_and!11019 (not b!181136) (not b!181116))
(check-sat b_and!11019 (not b_next!4473))
(get-model)

(declare-fun d!54353 () Bool)

(declare-fun e!119330 () Bool)

(assert (=> d!54353 e!119330))

(declare-fun res!85782 () Bool)

(assert (=> d!54353 (=> (not res!85782) (not e!119330))))

(declare-fun lt!89581 () ListLongMap!2297)

(assert (=> d!54353 (= res!85782 (contains!1242 lt!89581 (_1!1701 (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))))))))

(declare-fun lt!89578 () List!2303)

(assert (=> d!54353 (= lt!89581 (ListLongMap!2298 lt!89578))))

(declare-fun lt!89579 () Unit!5504)

(declare-fun lt!89580 () Unit!5504)

(assert (=> d!54353 (= lt!89579 lt!89580)))

(assert (=> d!54353 (= (getValueByKey!208 lt!89578 (_1!1701 (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))))) (Some!213 (_2!1701 (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!110 (List!2303 (_ BitVec 64) V!5307) Unit!5504)

(assert (=> d!54353 (= lt!89580 (lemmaContainsTupThenGetReturnValue!110 lt!89578 (_1!1701 (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))) (_2!1701 (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))))))))

(declare-fun insertStrictlySorted!113 (List!2303 (_ BitVec 64) V!5307) List!2303)

(assert (=> d!54353 (= lt!89578 (insertStrictlySorted!113 (toList!1164 (ite c!32447 call!18308 (ite c!32444 call!18309 call!18304))) (_1!1701 (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))) (_2!1701 (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))))))))

(assert (=> d!54353 (= (+!271 (ite c!32447 call!18308 (ite c!32444 call!18309 call!18304)) (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))) lt!89581)))

(declare-fun b!181168 () Bool)

(declare-fun res!85781 () Bool)

(assert (=> b!181168 (=> (not res!85781) (not e!119330))))

(assert (=> b!181168 (= res!85781 (= (getValueByKey!208 (toList!1164 lt!89581) (_1!1701 (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))))) (Some!213 (_2!1701 (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))))))))

(declare-fun b!181169 () Bool)

(declare-fun contains!1244 (List!2303 tuple2!3380) Bool)

(assert (=> b!181169 (= e!119330 (contains!1244 (toList!1164 lt!89581) (ite (or c!32447 c!32444) (tuple2!3381 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3553 thiss!1248)) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))))))

(assert (= (and d!54353 res!85782) b!181168))

(assert (= (and b!181168 res!85781) b!181169))

(declare-fun m!209093 () Bool)

(assert (=> d!54353 m!209093))

(declare-fun m!209095 () Bool)

(assert (=> d!54353 m!209095))

(declare-fun m!209097 () Bool)

(assert (=> d!54353 m!209097))

(declare-fun m!209099 () Bool)

(assert (=> d!54353 m!209099))

(declare-fun m!209101 () Bool)

(assert (=> b!181168 m!209101))

(declare-fun m!209103 () Bool)

(assert (=> b!181169 m!209103))

(assert (=> bm!18302 d!54353))

(declare-fun b!181194 () Bool)

(assert (=> b!181194 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(assert (=> b!181194 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3939 (_values!3695 thiss!1248))))))

(declare-fun e!119349 () Bool)

(declare-fun lt!89601 () ListLongMap!2297)

(assert (=> b!181194 (= e!119349 (= (apply!151 lt!89601 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)) (get!2073 (select (arr!3630 (_values!3695 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3712 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!181195 () Bool)

(declare-fun e!119351 () Bool)

(assert (=> b!181195 (= e!119351 (validKeyInArray!0 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181195 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!181196 () Bool)

(declare-fun lt!89597 () Unit!5504)

(declare-fun lt!89599 () Unit!5504)

(assert (=> b!181196 (= lt!89597 lt!89599)))

(declare-fun lt!89596 () (_ BitVec 64))

(declare-fun lt!89600 () V!5307)

(declare-fun lt!89602 () (_ BitVec 64))

(declare-fun lt!89598 () ListLongMap!2297)

(assert (=> b!181196 (not (contains!1242 (+!271 lt!89598 (tuple2!3381 lt!89596 lt!89600)) lt!89602))))

(declare-fun addStillNotContains!82 (ListLongMap!2297 (_ BitVec 64) V!5307 (_ BitVec 64)) Unit!5504)

(assert (=> b!181196 (= lt!89599 (addStillNotContains!82 lt!89598 lt!89596 lt!89600 lt!89602))))

(assert (=> b!181196 (= lt!89602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!181196 (= lt!89600 (get!2073 (select (arr!3630 (_values!3695 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3712 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181196 (= lt!89596 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18313 () ListLongMap!2297)

(assert (=> b!181196 (= lt!89598 call!18313)))

(declare-fun e!119347 () ListLongMap!2297)

(assert (=> b!181196 (= e!119347 (+!271 call!18313 (tuple2!3381 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000) (get!2073 (select (arr!3630 (_values!3695 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3712 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!181198 () Bool)

(declare-fun res!85794 () Bool)

(declare-fun e!119346 () Bool)

(assert (=> b!181198 (=> (not res!85794) (not e!119346))))

(assert (=> b!181198 (= res!85794 (not (contains!1242 lt!89601 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181199 () Bool)

(declare-fun e!119350 () ListLongMap!2297)

(assert (=> b!181199 (= e!119350 e!119347)))

(declare-fun c!32466 () Bool)

(assert (=> b!181199 (= c!32466 (validKeyInArray!0 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181200 () Bool)

(declare-fun e!119348 () Bool)

(assert (=> b!181200 (= e!119348 e!119349)))

(assert (=> b!181200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(declare-fun res!85791 () Bool)

(assert (=> b!181200 (= res!85791 (contains!1242 lt!89601 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181200 (=> (not res!85791) (not e!119349))))

(declare-fun b!181201 () Bool)

(assert (=> b!181201 (= e!119346 e!119348)))

(declare-fun c!32468 () Bool)

(assert (=> b!181201 (= c!32468 e!119351)))

(declare-fun res!85792 () Bool)

(assert (=> b!181201 (=> (not res!85792) (not e!119351))))

(assert (=> b!181201 (= res!85792 (bvslt #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(declare-fun b!181202 () Bool)

(assert (=> b!181202 (= e!119347 call!18313)))

(declare-fun b!181203 () Bool)

(declare-fun e!119345 () Bool)

(declare-fun isEmpty!457 (ListLongMap!2297) Bool)

(assert (=> b!181203 (= e!119345 (isEmpty!457 lt!89601))))

(declare-fun b!181204 () Bool)

(assert (=> b!181204 (= e!119348 e!119345)))

(declare-fun c!32467 () Bool)

(assert (=> b!181204 (= c!32467 (bvslt #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(declare-fun b!181197 () Bool)

(assert (=> b!181197 (= e!119345 (= lt!89601 (getCurrentListMapNoExtraKeys!184 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3712 thiss!1248))))))

(declare-fun d!54355 () Bool)

(assert (=> d!54355 e!119346))

(declare-fun res!85793 () Bool)

(assert (=> d!54355 (=> (not res!85793) (not e!119346))))

(assert (=> d!54355 (= res!85793 (not (contains!1242 lt!89601 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54355 (= lt!89601 e!119350)))

(declare-fun c!32469 () Bool)

(assert (=> d!54355 (= c!32469 (bvsge #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(assert (=> d!54355 (validMask!0 (mask!8725 thiss!1248))))

(assert (=> d!54355 (= (getCurrentListMapNoExtraKeys!184 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)) lt!89601)))

(declare-fun bm!18310 () Bool)

(assert (=> bm!18310 (= call!18313 (getCurrentListMapNoExtraKeys!184 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3712 thiss!1248)))))

(declare-fun b!181205 () Bool)

(assert (=> b!181205 (= e!119350 (ListLongMap!2298 Nil!2300))))

(assert (= (and d!54355 c!32469) b!181205))

(assert (= (and d!54355 (not c!32469)) b!181199))

(assert (= (and b!181199 c!32466) b!181196))

(assert (= (and b!181199 (not c!32466)) b!181202))

(assert (= (or b!181196 b!181202) bm!18310))

(assert (= (and d!54355 res!85793) b!181198))

(assert (= (and b!181198 res!85794) b!181201))

(assert (= (and b!181201 res!85792) b!181195))

(assert (= (and b!181201 c!32468) b!181200))

(assert (= (and b!181201 (not c!32468)) b!181204))

(assert (= (and b!181200 res!85791) b!181194))

(assert (= (and b!181204 c!32467) b!181197))

(assert (= (and b!181204 (not c!32467)) b!181203))

(declare-fun b_lambda!7139 () Bool)

(assert (=> (not b_lambda!7139) (not b!181194)))

(assert (=> b!181194 t!7158))

(declare-fun b_and!11021 () Bool)

(assert (= b_and!11019 (and (=> t!7158 result!4717) b_and!11021)))

(declare-fun b_lambda!7141 () Bool)

(assert (=> (not b_lambda!7141) (not b!181196)))

(assert (=> b!181196 t!7158))

(declare-fun b_and!11023 () Bool)

(assert (= b_and!11021 (and (=> t!7158 result!4717) b_and!11023)))

(declare-fun m!209105 () Bool)

(assert (=> b!181196 m!209105))

(assert (=> b!181196 m!209019))

(declare-fun m!209107 () Bool)

(assert (=> b!181196 m!209107))

(declare-fun m!209109 () Bool)

(assert (=> b!181196 m!209109))

(declare-fun m!209111 () Bool)

(assert (=> b!181196 m!209111))

(assert (=> b!181196 m!209017))

(assert (=> b!181196 m!209017))

(assert (=> b!181196 m!209019))

(assert (=> b!181196 m!209021))

(assert (=> b!181196 m!209109))

(assert (=> b!181196 m!209011))

(assert (=> b!181194 m!209019))

(assert (=> b!181194 m!209011))

(assert (=> b!181194 m!209017))

(assert (=> b!181194 m!209017))

(assert (=> b!181194 m!209019))

(assert (=> b!181194 m!209021))

(assert (=> b!181194 m!209011))

(declare-fun m!209113 () Bool)

(assert (=> b!181194 m!209113))

(declare-fun m!209115 () Bool)

(assert (=> b!181198 m!209115))

(declare-fun m!209117 () Bool)

(assert (=> b!181197 m!209117))

(assert (=> b!181195 m!209011))

(assert (=> b!181195 m!209011))

(assert (=> b!181195 m!209013))

(declare-fun m!209119 () Bool)

(assert (=> b!181203 m!209119))

(assert (=> b!181200 m!209011))

(assert (=> b!181200 m!209011))

(declare-fun m!209121 () Bool)

(assert (=> b!181200 m!209121))

(declare-fun m!209123 () Bool)

(assert (=> d!54355 m!209123))

(assert (=> d!54355 m!208971))

(assert (=> b!181199 m!209011))

(assert (=> b!181199 m!209011))

(assert (=> b!181199 m!209013))

(assert (=> bm!18310 m!209117))

(assert (=> bm!18304 d!54355))

(declare-fun d!54357 () Bool)

(declare-fun get!2074 (Option!214) V!5307)

(assert (=> d!54357 (= (apply!151 lt!89553 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2074 (getValueByKey!208 (toList!1164 lt!89553) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7394 () Bool)

(assert (= bs!7394 d!54357))

(declare-fun m!209125 () Bool)

(assert (=> bs!7394 m!209125))

(assert (=> bs!7394 m!209125))

(declare-fun m!209127 () Bool)

(assert (=> bs!7394 m!209127))

(assert (=> b!181116 d!54357))

(declare-fun d!54359 () Bool)

(declare-fun res!85799 () Bool)

(declare-fun e!119356 () Bool)

(assert (=> d!54359 (=> res!85799 e!119356)))

(assert (=> d!54359 (= res!85799 (and ((_ is Cons!2299) (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))) (= (_1!1701 (h!2925 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))))) key!828)))))

(assert (=> d!54359 (= (containsKey!212 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828) e!119356)))

(declare-fun b!181210 () Bool)

(declare-fun e!119357 () Bool)

(assert (=> b!181210 (= e!119356 e!119357)))

(declare-fun res!85800 () Bool)

(assert (=> b!181210 (=> (not res!85800) (not e!119357))))

(assert (=> b!181210 (= res!85800 (and (or (not ((_ is Cons!2299) (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))))) (bvsle (_1!1701 (h!2925 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))))) key!828)) ((_ is Cons!2299) (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))) (bvslt (_1!1701 (h!2925 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))))) key!828)))))

(declare-fun b!181211 () Bool)

(assert (=> b!181211 (= e!119357 (containsKey!212 (t!7155 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))) key!828))))

(assert (= (and d!54359 (not res!85799)) b!181210))

(assert (= (and b!181210 res!85800) b!181211))

(declare-fun m!209129 () Bool)

(assert (=> b!181211 m!209129))

(assert (=> d!54339 d!54359))

(declare-fun d!54361 () Bool)

(declare-fun e!119359 () Bool)

(assert (=> d!54361 e!119359))

(declare-fun res!85801 () Bool)

(assert (=> d!54361 (=> res!85801 e!119359)))

(declare-fun lt!89603 () Bool)

(assert (=> d!54361 (= res!85801 (not lt!89603))))

(declare-fun lt!89604 () Bool)

(assert (=> d!54361 (= lt!89603 lt!89604)))

(declare-fun lt!89606 () Unit!5504)

(declare-fun e!119358 () Unit!5504)

(assert (=> d!54361 (= lt!89606 e!119358)))

(declare-fun c!32470 () Bool)

(assert (=> d!54361 (= c!32470 lt!89604)))

(assert (=> d!54361 (= lt!89604 (containsKey!212 (toList!1164 lt!89553) (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54361 (= (contains!1242 lt!89553 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)) lt!89603)))

(declare-fun b!181212 () Bool)

(declare-fun lt!89605 () Unit!5504)

(assert (=> b!181212 (= e!119358 lt!89605)))

(assert (=> b!181212 (= lt!89605 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1164 lt!89553) (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181212 (isDefined!161 (getValueByKey!208 (toList!1164 lt!89553) (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181213 () Bool)

(declare-fun Unit!5508 () Unit!5504)

(assert (=> b!181213 (= e!119358 Unit!5508)))

(declare-fun b!181214 () Bool)

(assert (=> b!181214 (= e!119359 (isDefined!161 (getValueByKey!208 (toList!1164 lt!89553) (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54361 c!32470) b!181212))

(assert (= (and d!54361 (not c!32470)) b!181213))

(assert (= (and d!54361 (not res!85801)) b!181214))

(assert (=> d!54361 m!209011))

(declare-fun m!209131 () Bool)

(assert (=> d!54361 m!209131))

(assert (=> b!181212 m!209011))

(declare-fun m!209133 () Bool)

(assert (=> b!181212 m!209133))

(assert (=> b!181212 m!209011))

(declare-fun m!209135 () Bool)

(assert (=> b!181212 m!209135))

(assert (=> b!181212 m!209135))

(declare-fun m!209137 () Bool)

(assert (=> b!181212 m!209137))

(assert (=> b!181214 m!209011))

(assert (=> b!181214 m!209135))

(assert (=> b!181214 m!209135))

(assert (=> b!181214 m!209137))

(assert (=> b!181123 d!54361))

(declare-fun d!54363 () Bool)

(assert (=> d!54363 (= (apply!151 lt!89553 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)) (get!2074 (getValueByKey!208 (toList!1164 lt!89553) (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7395 () Bool)

(assert (= bs!7395 d!54363))

(assert (=> bs!7395 m!209011))

(assert (=> bs!7395 m!209135))

(assert (=> bs!7395 m!209135))

(declare-fun m!209139 () Bool)

(assert (=> bs!7395 m!209139))

(assert (=> b!181115 d!54363))

(declare-fun d!54365 () Bool)

(declare-fun c!32473 () Bool)

(assert (=> d!54365 (= c!32473 ((_ is ValueCellFull!1779) (select (arr!3630 (_values!3695 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119362 () V!5307)

(assert (=> d!54365 (= (get!2073 (select (arr!3630 (_values!3695 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3712 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119362)))

(declare-fun b!181219 () Bool)

(declare-fun get!2075 (ValueCell!1779 V!5307) V!5307)

(assert (=> b!181219 (= e!119362 (get!2075 (select (arr!3630 (_values!3695 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3712 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181220 () Bool)

(declare-fun get!2076 (ValueCell!1779 V!5307) V!5307)

(assert (=> b!181220 (= e!119362 (get!2076 (select (arr!3630 (_values!3695 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!494 (defaultEntry!3712 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54365 c!32473) b!181219))

(assert (= (and d!54365 (not c!32473)) b!181220))

(assert (=> b!181219 m!209017))

(assert (=> b!181219 m!209019))

(declare-fun m!209141 () Bool)

(assert (=> b!181219 m!209141))

(assert (=> b!181220 m!209017))

(assert (=> b!181220 m!209019))

(declare-fun m!209143 () Bool)

(assert (=> b!181220 m!209143))

(assert (=> b!181115 d!54365))

(declare-fun d!54367 () Bool)

(assert (=> d!54367 (= (validKeyInArray!0 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181122 d!54367))

(declare-fun d!54369 () Bool)

(assert (=> d!54369 (= (apply!151 (+!271 lt!89542 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248))) lt!89550) (apply!151 lt!89542 lt!89550))))

(declare-fun lt!89609 () Unit!5504)

(declare-fun choose!961 (ListLongMap!2297 (_ BitVec 64) V!5307 (_ BitVec 64)) Unit!5504)

(assert (=> d!54369 (= lt!89609 (choose!961 lt!89542 lt!89552 (minValue!3553 thiss!1248) lt!89550))))

(declare-fun e!119365 () Bool)

(assert (=> d!54369 e!119365))

(declare-fun res!85804 () Bool)

(assert (=> d!54369 (=> (not res!85804) (not e!119365))))

(assert (=> d!54369 (= res!85804 (contains!1242 lt!89542 lt!89550))))

(assert (=> d!54369 (= (addApplyDifferent!127 lt!89542 lt!89552 (minValue!3553 thiss!1248) lt!89550) lt!89609)))

(declare-fun b!181224 () Bool)

(assert (=> b!181224 (= e!119365 (not (= lt!89550 lt!89552)))))

(assert (= (and d!54369 res!85804) b!181224))

(assert (=> d!54369 m!209033))

(assert (=> d!54369 m!209033))

(assert (=> d!54369 m!209035))

(declare-fun m!209145 () Bool)

(assert (=> d!54369 m!209145))

(declare-fun m!209147 () Bool)

(assert (=> d!54369 m!209147))

(assert (=> d!54369 m!209061))

(assert (=> b!181113 d!54369))

(assert (=> b!181113 d!54355))

(declare-fun d!54371 () Bool)

(assert (=> d!54371 (= (apply!151 lt!89544 lt!89555) (get!2074 (getValueByKey!208 (toList!1164 lt!89544) lt!89555)))))

(declare-fun bs!7396 () Bool)

(assert (= bs!7396 d!54371))

(declare-fun m!209149 () Bool)

(assert (=> bs!7396 m!209149))

(assert (=> bs!7396 m!209149))

(declare-fun m!209151 () Bool)

(assert (=> bs!7396 m!209151))

(assert (=> b!181113 d!54371))

(declare-fun d!54373 () Bool)

(assert (=> d!54373 (= (apply!151 lt!89549 lt!89546) (get!2074 (getValueByKey!208 (toList!1164 lt!89549) lt!89546)))))

(declare-fun bs!7397 () Bool)

(assert (= bs!7397 d!54373))

(declare-fun m!209153 () Bool)

(assert (=> bs!7397 m!209153))

(assert (=> bs!7397 m!209153))

(declare-fun m!209155 () Bool)

(assert (=> bs!7397 m!209155))

(assert (=> b!181113 d!54373))

(declare-fun d!54375 () Bool)

(declare-fun e!119366 () Bool)

(assert (=> d!54375 e!119366))

(declare-fun res!85806 () Bool)

(assert (=> d!54375 (=> (not res!85806) (not e!119366))))

(declare-fun lt!89613 () ListLongMap!2297)

(assert (=> d!54375 (= res!85806 (contains!1242 lt!89613 (_1!1701 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248)))))))

(declare-fun lt!89610 () List!2303)

(assert (=> d!54375 (= lt!89613 (ListLongMap!2298 lt!89610))))

(declare-fun lt!89611 () Unit!5504)

(declare-fun lt!89612 () Unit!5504)

(assert (=> d!54375 (= lt!89611 lt!89612)))

(assert (=> d!54375 (= (getValueByKey!208 lt!89610 (_1!1701 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248)))) (Some!213 (_2!1701 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248)))))))

(assert (=> d!54375 (= lt!89612 (lemmaContainsTupThenGetReturnValue!110 lt!89610 (_1!1701 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248))) (_2!1701 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248)))))))

(assert (=> d!54375 (= lt!89610 (insertStrictlySorted!113 (toList!1164 lt!89549) (_1!1701 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248))) (_2!1701 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248)))))))

(assert (=> d!54375 (= (+!271 lt!89549 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248))) lt!89613)))

(declare-fun b!181225 () Bool)

(declare-fun res!85805 () Bool)

(assert (=> b!181225 (=> (not res!85805) (not e!119366))))

(assert (=> b!181225 (= res!85805 (= (getValueByKey!208 (toList!1164 lt!89613) (_1!1701 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248)))) (Some!213 (_2!1701 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248))))))))

(declare-fun b!181226 () Bool)

(assert (=> b!181226 (= e!119366 (contains!1244 (toList!1164 lt!89613) (tuple2!3381 lt!89543 (minValue!3553 thiss!1248))))))

(assert (= (and d!54375 res!85806) b!181225))

(assert (= (and b!181225 res!85805) b!181226))

(declare-fun m!209157 () Bool)

(assert (=> d!54375 m!209157))

(declare-fun m!209159 () Bool)

(assert (=> d!54375 m!209159))

(declare-fun m!209161 () Bool)

(assert (=> d!54375 m!209161))

(declare-fun m!209163 () Bool)

(assert (=> d!54375 m!209163))

(declare-fun m!209165 () Bool)

(assert (=> b!181225 m!209165))

(declare-fun m!209167 () Bool)

(assert (=> b!181226 m!209167))

(assert (=> b!181113 d!54375))

(declare-fun d!54377 () Bool)

(assert (=> d!54377 (= (apply!151 (+!271 lt!89544 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248))) lt!89555) (get!2074 (getValueByKey!208 (toList!1164 (+!271 lt!89544 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248)))) lt!89555)))))

(declare-fun bs!7398 () Bool)

(assert (= bs!7398 d!54377))

(declare-fun m!209169 () Bool)

(assert (=> bs!7398 m!209169))

(assert (=> bs!7398 m!209169))

(declare-fun m!209171 () Bool)

(assert (=> bs!7398 m!209171))

(assert (=> b!181113 d!54377))

(declare-fun d!54379 () Bool)

(declare-fun e!119367 () Bool)

(assert (=> d!54379 e!119367))

(declare-fun res!85808 () Bool)

(assert (=> d!54379 (=> (not res!85808) (not e!119367))))

(declare-fun lt!89617 () ListLongMap!2297)

(assert (=> d!54379 (= res!85808 (contains!1242 lt!89617 (_1!1701 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248)))))))

(declare-fun lt!89614 () List!2303)

(assert (=> d!54379 (= lt!89617 (ListLongMap!2298 lt!89614))))

(declare-fun lt!89615 () Unit!5504)

(declare-fun lt!89616 () Unit!5504)

(assert (=> d!54379 (= lt!89615 lt!89616)))

(assert (=> d!54379 (= (getValueByKey!208 lt!89614 (_1!1701 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248)))) (Some!213 (_2!1701 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248)))))))

(assert (=> d!54379 (= lt!89616 (lemmaContainsTupThenGetReturnValue!110 lt!89614 (_1!1701 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248))) (_2!1701 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248)))))))

(assert (=> d!54379 (= lt!89614 (insertStrictlySorted!113 (toList!1164 lt!89544) (_1!1701 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248))) (_2!1701 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248)))))))

(assert (=> d!54379 (= (+!271 lt!89544 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248))) lt!89617)))

(declare-fun b!181227 () Bool)

(declare-fun res!85807 () Bool)

(assert (=> b!181227 (=> (not res!85807) (not e!119367))))

(assert (=> b!181227 (= res!85807 (= (getValueByKey!208 (toList!1164 lt!89617) (_1!1701 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248)))) (Some!213 (_2!1701 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248))))))))

(declare-fun b!181228 () Bool)

(assert (=> b!181228 (= e!119367 (contains!1244 (toList!1164 lt!89617) (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248))))))

(assert (= (and d!54379 res!85808) b!181227))

(assert (= (and b!181227 res!85807) b!181228))

(declare-fun m!209173 () Bool)

(assert (=> d!54379 m!209173))

(declare-fun m!209175 () Bool)

(assert (=> d!54379 m!209175))

(declare-fun m!209177 () Bool)

(assert (=> d!54379 m!209177))

(declare-fun m!209179 () Bool)

(assert (=> d!54379 m!209179))

(declare-fun m!209181 () Bool)

(assert (=> b!181227 m!209181))

(declare-fun m!209183 () Bool)

(assert (=> b!181228 m!209183))

(assert (=> b!181113 d!54379))

(declare-fun d!54381 () Bool)

(declare-fun e!119369 () Bool)

(assert (=> d!54381 e!119369))

(declare-fun res!85809 () Bool)

(assert (=> d!54381 (=> res!85809 e!119369)))

(declare-fun lt!89618 () Bool)

(assert (=> d!54381 (= res!85809 (not lt!89618))))

(declare-fun lt!89619 () Bool)

(assert (=> d!54381 (= lt!89618 lt!89619)))

(declare-fun lt!89621 () Unit!5504)

(declare-fun e!119368 () Unit!5504)

(assert (=> d!54381 (= lt!89621 e!119368)))

(declare-fun c!32474 () Bool)

(assert (=> d!54381 (= c!32474 lt!89619)))

(assert (=> d!54381 (= lt!89619 (containsKey!212 (toList!1164 (+!271 lt!89541 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248)))) lt!89554))))

(assert (=> d!54381 (= (contains!1242 (+!271 lt!89541 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248))) lt!89554) lt!89618)))

(declare-fun b!181229 () Bool)

(declare-fun lt!89620 () Unit!5504)

(assert (=> b!181229 (= e!119368 lt!89620)))

(assert (=> b!181229 (= lt!89620 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1164 (+!271 lt!89541 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248)))) lt!89554))))

(assert (=> b!181229 (isDefined!161 (getValueByKey!208 (toList!1164 (+!271 lt!89541 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248)))) lt!89554))))

(declare-fun b!181230 () Bool)

(declare-fun Unit!5509 () Unit!5504)

(assert (=> b!181230 (= e!119368 Unit!5509)))

(declare-fun b!181231 () Bool)

(assert (=> b!181231 (= e!119369 (isDefined!161 (getValueByKey!208 (toList!1164 (+!271 lt!89541 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248)))) lt!89554)))))

(assert (= (and d!54381 c!32474) b!181229))

(assert (= (and d!54381 (not c!32474)) b!181230))

(assert (= (and d!54381 (not res!85809)) b!181231))

(declare-fun m!209185 () Bool)

(assert (=> d!54381 m!209185))

(declare-fun m!209187 () Bool)

(assert (=> b!181229 m!209187))

(declare-fun m!209189 () Bool)

(assert (=> b!181229 m!209189))

(assert (=> b!181229 m!209189))

(declare-fun m!209191 () Bool)

(assert (=> b!181229 m!209191))

(assert (=> b!181231 m!209189))

(assert (=> b!181231 m!209189))

(assert (=> b!181231 m!209191))

(assert (=> b!181113 d!54381))

(declare-fun d!54383 () Bool)

(assert (=> d!54383 (= (apply!151 (+!271 lt!89544 (tuple2!3381 lt!89547 (zeroValue!3553 thiss!1248))) lt!89555) (apply!151 lt!89544 lt!89555))))

(declare-fun lt!89622 () Unit!5504)

(assert (=> d!54383 (= lt!89622 (choose!961 lt!89544 lt!89547 (zeroValue!3553 thiss!1248) lt!89555))))

(declare-fun e!119370 () Bool)

(assert (=> d!54383 e!119370))

(declare-fun res!85810 () Bool)

(assert (=> d!54383 (=> (not res!85810) (not e!119370))))

(assert (=> d!54383 (= res!85810 (contains!1242 lt!89544 lt!89555))))

(assert (=> d!54383 (= (addApplyDifferent!127 lt!89544 lt!89547 (zeroValue!3553 thiss!1248) lt!89555) lt!89622)))

(declare-fun b!181232 () Bool)

(assert (=> b!181232 (= e!119370 (not (= lt!89555 lt!89547)))))

(assert (= (and d!54383 res!85810) b!181232))

(assert (=> d!54383 m!209045))

(assert (=> d!54383 m!209045))

(assert (=> d!54383 m!209055))

(declare-fun m!209193 () Bool)

(assert (=> d!54383 m!209193))

(declare-fun m!209195 () Bool)

(assert (=> d!54383 m!209195))

(assert (=> d!54383 m!209041))

(assert (=> b!181113 d!54383))

(declare-fun d!54385 () Bool)

(declare-fun e!119371 () Bool)

(assert (=> d!54385 e!119371))

(declare-fun res!85812 () Bool)

(assert (=> d!54385 (=> (not res!85812) (not e!119371))))

(declare-fun lt!89626 () ListLongMap!2297)

(assert (=> d!54385 (= res!85812 (contains!1242 lt!89626 (_1!1701 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248)))))))

(declare-fun lt!89623 () List!2303)

(assert (=> d!54385 (= lt!89626 (ListLongMap!2298 lt!89623))))

(declare-fun lt!89624 () Unit!5504)

(declare-fun lt!89625 () Unit!5504)

(assert (=> d!54385 (= lt!89624 lt!89625)))

(assert (=> d!54385 (= (getValueByKey!208 lt!89623 (_1!1701 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248)))) (Some!213 (_2!1701 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248)))))))

(assert (=> d!54385 (= lt!89625 (lemmaContainsTupThenGetReturnValue!110 lt!89623 (_1!1701 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248))) (_2!1701 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248)))))))

(assert (=> d!54385 (= lt!89623 (insertStrictlySorted!113 (toList!1164 lt!89542) (_1!1701 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248))) (_2!1701 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248)))))))

(assert (=> d!54385 (= (+!271 lt!89542 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248))) lt!89626)))

(declare-fun b!181233 () Bool)

(declare-fun res!85811 () Bool)

(assert (=> b!181233 (=> (not res!85811) (not e!119371))))

(assert (=> b!181233 (= res!85811 (= (getValueByKey!208 (toList!1164 lt!89626) (_1!1701 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248)))) (Some!213 (_2!1701 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248))))))))

(declare-fun b!181234 () Bool)

(assert (=> b!181234 (= e!119371 (contains!1244 (toList!1164 lt!89626) (tuple2!3381 lt!89552 (minValue!3553 thiss!1248))))))

(assert (= (and d!54385 res!85812) b!181233))

(assert (= (and b!181233 res!85811) b!181234))

(declare-fun m!209197 () Bool)

(assert (=> d!54385 m!209197))

(declare-fun m!209199 () Bool)

(assert (=> d!54385 m!209199))

(declare-fun m!209201 () Bool)

(assert (=> d!54385 m!209201))

(declare-fun m!209203 () Bool)

(assert (=> d!54385 m!209203))

(declare-fun m!209205 () Bool)

(assert (=> b!181233 m!209205))

(declare-fun m!209207 () Bool)

(assert (=> b!181234 m!209207))

(assert (=> b!181113 d!54385))

(declare-fun d!54387 () Bool)

(assert (=> d!54387 (= (apply!151 (+!271 lt!89542 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248))) lt!89550) (get!2074 (getValueByKey!208 (toList!1164 (+!271 lt!89542 (tuple2!3381 lt!89552 (minValue!3553 thiss!1248)))) lt!89550)))))

(declare-fun bs!7399 () Bool)

(assert (= bs!7399 d!54387))

(declare-fun m!209209 () Bool)

(assert (=> bs!7399 m!209209))

(assert (=> bs!7399 m!209209))

(declare-fun m!209211 () Bool)

(assert (=> bs!7399 m!209211))

(assert (=> b!181113 d!54387))

(declare-fun d!54389 () Bool)

(assert (=> d!54389 (= (apply!151 (+!271 lt!89549 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248))) lt!89546) (apply!151 lt!89549 lt!89546))))

(declare-fun lt!89627 () Unit!5504)

(assert (=> d!54389 (= lt!89627 (choose!961 lt!89549 lt!89543 (minValue!3553 thiss!1248) lt!89546))))

(declare-fun e!119372 () Bool)

(assert (=> d!54389 e!119372))

(declare-fun res!85813 () Bool)

(assert (=> d!54389 (=> (not res!85813) (not e!119372))))

(assert (=> d!54389 (= res!85813 (contains!1242 lt!89549 lt!89546))))

(assert (=> d!54389 (= (addApplyDifferent!127 lt!89549 lt!89543 (minValue!3553 thiss!1248) lt!89546) lt!89627)))

(declare-fun b!181235 () Bool)

(assert (=> b!181235 (= e!119372 (not (= lt!89546 lt!89543)))))

(assert (= (and d!54389 res!85813) b!181235))

(assert (=> d!54389 m!209057))

(assert (=> d!54389 m!209057))

(assert (=> d!54389 m!209059))

(declare-fun m!209213 () Bool)

(assert (=> d!54389 m!209213))

(declare-fun m!209215 () Bool)

(assert (=> d!54389 m!209215))

(assert (=> d!54389 m!209047))

(assert (=> b!181113 d!54389))

(declare-fun d!54391 () Bool)

(declare-fun e!119373 () Bool)

(assert (=> d!54391 e!119373))

(declare-fun res!85815 () Bool)

(assert (=> d!54391 (=> (not res!85815) (not e!119373))))

(declare-fun lt!89631 () ListLongMap!2297)

(assert (=> d!54391 (= res!85815 (contains!1242 lt!89631 (_1!1701 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248)))))))

(declare-fun lt!89628 () List!2303)

(assert (=> d!54391 (= lt!89631 (ListLongMap!2298 lt!89628))))

(declare-fun lt!89629 () Unit!5504)

(declare-fun lt!89630 () Unit!5504)

(assert (=> d!54391 (= lt!89629 lt!89630)))

(assert (=> d!54391 (= (getValueByKey!208 lt!89628 (_1!1701 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248)))) (Some!213 (_2!1701 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248)))))))

(assert (=> d!54391 (= lt!89630 (lemmaContainsTupThenGetReturnValue!110 lt!89628 (_1!1701 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248))) (_2!1701 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248)))))))

(assert (=> d!54391 (= lt!89628 (insertStrictlySorted!113 (toList!1164 lt!89541) (_1!1701 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248))) (_2!1701 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248)))))))

(assert (=> d!54391 (= (+!271 lt!89541 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248))) lt!89631)))

(declare-fun b!181236 () Bool)

(declare-fun res!85814 () Bool)

(assert (=> b!181236 (=> (not res!85814) (not e!119373))))

(assert (=> b!181236 (= res!85814 (= (getValueByKey!208 (toList!1164 lt!89631) (_1!1701 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248)))) (Some!213 (_2!1701 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248))))))))

(declare-fun b!181237 () Bool)

(assert (=> b!181237 (= e!119373 (contains!1244 (toList!1164 lt!89631) (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248))))))

(assert (= (and d!54391 res!85815) b!181236))

(assert (= (and b!181236 res!85814) b!181237))

(declare-fun m!209217 () Bool)

(assert (=> d!54391 m!209217))

(declare-fun m!209219 () Bool)

(assert (=> d!54391 m!209219))

(declare-fun m!209221 () Bool)

(assert (=> d!54391 m!209221))

(declare-fun m!209223 () Bool)

(assert (=> d!54391 m!209223))

(declare-fun m!209225 () Bool)

(assert (=> b!181236 m!209225))

(declare-fun m!209227 () Bool)

(assert (=> b!181237 m!209227))

(assert (=> b!181113 d!54391))

(declare-fun d!54393 () Bool)

(assert (=> d!54393 (contains!1242 (+!271 lt!89541 (tuple2!3381 lt!89539 (zeroValue!3553 thiss!1248))) lt!89554)))

(declare-fun lt!89634 () Unit!5504)

(declare-fun choose!962 (ListLongMap!2297 (_ BitVec 64) V!5307 (_ BitVec 64)) Unit!5504)

(assert (=> d!54393 (= lt!89634 (choose!962 lt!89541 lt!89539 (zeroValue!3553 thiss!1248) lt!89554))))

(assert (=> d!54393 (contains!1242 lt!89541 lt!89554)))

(assert (=> d!54393 (= (addStillContains!127 lt!89541 lt!89539 (zeroValue!3553 thiss!1248) lt!89554) lt!89634)))

(declare-fun bs!7400 () Bool)

(assert (= bs!7400 d!54393))

(assert (=> bs!7400 m!209037))

(assert (=> bs!7400 m!209037))

(assert (=> bs!7400 m!209039))

(declare-fun m!209229 () Bool)

(assert (=> bs!7400 m!209229))

(declare-fun m!209231 () Bool)

(assert (=> bs!7400 m!209231))

(assert (=> b!181113 d!54393))

(declare-fun d!54395 () Bool)

(assert (=> d!54395 (= (apply!151 (+!271 lt!89549 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248))) lt!89546) (get!2074 (getValueByKey!208 (toList!1164 (+!271 lt!89549 (tuple2!3381 lt!89543 (minValue!3553 thiss!1248)))) lt!89546)))))

(declare-fun bs!7401 () Bool)

(assert (= bs!7401 d!54395))

(declare-fun m!209233 () Bool)

(assert (=> bs!7401 m!209233))

(assert (=> bs!7401 m!209233))

(declare-fun m!209235 () Bool)

(assert (=> bs!7401 m!209235))

(assert (=> b!181113 d!54395))

(declare-fun d!54397 () Bool)

(assert (=> d!54397 (= (apply!151 lt!89542 lt!89550) (get!2074 (getValueByKey!208 (toList!1164 lt!89542) lt!89550)))))

(declare-fun bs!7402 () Bool)

(assert (= bs!7402 d!54397))

(declare-fun m!209237 () Bool)

(assert (=> bs!7402 m!209237))

(assert (=> bs!7402 m!209237))

(declare-fun m!209239 () Bool)

(assert (=> bs!7402 m!209239))

(assert (=> b!181113 d!54397))

(assert (=> b!181121 d!54367))

(declare-fun b!181249 () Bool)

(declare-fun e!119383 () Bool)

(declare-fun call!18316 () Bool)

(assert (=> b!181249 (= e!119383 call!18316)))

(declare-fun b!181251 () Bool)

(assert (=> b!181251 (= e!119383 call!18316)))

(declare-fun b!181252 () Bool)

(declare-fun e!119384 () Bool)

(declare-fun contains!1245 (List!2305 (_ BitVec 64)) Bool)

(assert (=> b!181252 (= e!119384 (contains!1245 Nil!2302 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181253 () Bool)

(declare-fun e!119385 () Bool)

(assert (=> b!181253 (= e!119385 e!119383)))

(declare-fun c!32477 () Bool)

(assert (=> b!181253 (= c!32477 (validKeyInArray!0 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18313 () Bool)

(assert (=> bm!18313 (= call!18316 (arrayNoDuplicates!0 (_keys!5610 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32477 (Cons!2301 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000) Nil!2302) Nil!2302)))))

(declare-fun b!181250 () Bool)

(declare-fun e!119382 () Bool)

(assert (=> b!181250 (= e!119382 e!119385)))

(declare-fun res!85824 () Bool)

(assert (=> b!181250 (=> (not res!85824) (not e!119385))))

(assert (=> b!181250 (= res!85824 (not e!119384))))

(declare-fun res!85823 () Bool)

(assert (=> b!181250 (=> (not res!85823) (not e!119384))))

(assert (=> b!181250 (= res!85823 (validKeyInArray!0 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54399 () Bool)

(declare-fun res!85822 () Bool)

(assert (=> d!54399 (=> res!85822 e!119382)))

(assert (=> d!54399 (= res!85822 (bvsge #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(assert (=> d!54399 (= (arrayNoDuplicates!0 (_keys!5610 thiss!1248) #b00000000000000000000000000000000 Nil!2302) e!119382)))

(assert (= (and d!54399 (not res!85822)) b!181250))

(assert (= (and b!181250 res!85823) b!181252))

(assert (= (and b!181250 res!85824) b!181253))

(assert (= (and b!181253 c!32477) b!181249))

(assert (= (and b!181253 (not c!32477)) b!181251))

(assert (= (or b!181249 b!181251) bm!18313))

(assert (=> b!181252 m!209011))

(assert (=> b!181252 m!209011))

(declare-fun m!209241 () Bool)

(assert (=> b!181252 m!209241))

(assert (=> b!181253 m!209011))

(assert (=> b!181253 m!209011))

(assert (=> b!181253 m!209013))

(assert (=> bm!18313 m!209011))

(declare-fun m!209243 () Bool)

(assert (=> bm!18313 m!209243))

(assert (=> b!181250 m!209011))

(assert (=> b!181250 m!209011))

(assert (=> b!181250 m!209013))

(assert (=> b!181137 d!54399))

(declare-fun d!54401 () Bool)

(declare-fun e!119387 () Bool)

(assert (=> d!54401 e!119387))

(declare-fun res!85825 () Bool)

(assert (=> d!54401 (=> res!85825 e!119387)))

(declare-fun lt!89635 () Bool)

(assert (=> d!54401 (= res!85825 (not lt!89635))))

(declare-fun lt!89636 () Bool)

(assert (=> d!54401 (= lt!89635 lt!89636)))

(declare-fun lt!89638 () Unit!5504)

(declare-fun e!119386 () Unit!5504)

(assert (=> d!54401 (= lt!89638 e!119386)))

(declare-fun c!32478 () Bool)

(assert (=> d!54401 (= c!32478 lt!89636)))

(assert (=> d!54401 (= lt!89636 (containsKey!212 (toList!1164 lt!89553) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54401 (= (contains!1242 lt!89553 #b1000000000000000000000000000000000000000000000000000000000000000) lt!89635)))

(declare-fun b!181254 () Bool)

(declare-fun lt!89637 () Unit!5504)

(assert (=> b!181254 (= e!119386 lt!89637)))

(assert (=> b!181254 (= lt!89637 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1164 lt!89553) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181254 (isDefined!161 (getValueByKey!208 (toList!1164 lt!89553) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181255 () Bool)

(declare-fun Unit!5510 () Unit!5504)

(assert (=> b!181255 (= e!119386 Unit!5510)))

(declare-fun b!181256 () Bool)

(assert (=> b!181256 (= e!119387 (isDefined!161 (getValueByKey!208 (toList!1164 lt!89553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54401 c!32478) b!181254))

(assert (= (and d!54401 (not c!32478)) b!181255))

(assert (= (and d!54401 (not res!85825)) b!181256))

(declare-fun m!209245 () Bool)

(assert (=> d!54401 m!209245))

(declare-fun m!209247 () Bool)

(assert (=> b!181254 m!209247))

(declare-fun m!209249 () Bool)

(assert (=> b!181254 m!209249))

(assert (=> b!181254 m!209249))

(declare-fun m!209251 () Bool)

(assert (=> b!181254 m!209251))

(assert (=> b!181256 m!209249))

(assert (=> b!181256 m!209249))

(assert (=> b!181256 m!209251))

(assert (=> bm!18306 d!54401))

(assert (=> d!54341 d!54351))

(declare-fun b!181269 () Bool)

(declare-fun e!119395 () SeekEntryResult!598)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181269 (= e!119395 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19776 lt!89568) #b00000000000000000000000000000001) (nextIndex!0 (index!4564 lt!89568) (x!19776 lt!89568) (mask!8725 thiss!1248)) (index!4564 lt!89568) key!828 (_keys!5610 thiss!1248) (mask!8725 thiss!1248)))))

(declare-fun b!181270 () Bool)

(declare-fun e!119394 () SeekEntryResult!598)

(declare-fun e!119396 () SeekEntryResult!598)

(assert (=> b!181270 (= e!119394 e!119396)))

(declare-fun c!32486 () Bool)

(declare-fun lt!89643 () (_ BitVec 64))

(assert (=> b!181270 (= c!32486 (= lt!89643 key!828))))

(declare-fun d!54403 () Bool)

(declare-fun lt!89644 () SeekEntryResult!598)

(assert (=> d!54403 (and (or ((_ is Undefined!598) lt!89644) (not ((_ is Found!598) lt!89644)) (and (bvsge (index!4563 lt!89644) #b00000000000000000000000000000000) (bvslt (index!4563 lt!89644) (size!3938 (_keys!5610 thiss!1248))))) (or ((_ is Undefined!598) lt!89644) ((_ is Found!598) lt!89644) (not ((_ is MissingVacant!598) lt!89644)) (not (= (index!4565 lt!89644) (index!4564 lt!89568))) (and (bvsge (index!4565 lt!89644) #b00000000000000000000000000000000) (bvslt (index!4565 lt!89644) (size!3938 (_keys!5610 thiss!1248))))) (or ((_ is Undefined!598) lt!89644) (ite ((_ is Found!598) lt!89644) (= (select (arr!3629 (_keys!5610 thiss!1248)) (index!4563 lt!89644)) key!828) (and ((_ is MissingVacant!598) lt!89644) (= (index!4565 lt!89644) (index!4564 lt!89568)) (= (select (arr!3629 (_keys!5610 thiss!1248)) (index!4565 lt!89644)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54403 (= lt!89644 e!119394)))

(declare-fun c!32487 () Bool)

(assert (=> d!54403 (= c!32487 (bvsge (x!19776 lt!89568) #b01111111111111111111111111111110))))

(assert (=> d!54403 (= lt!89643 (select (arr!3629 (_keys!5610 thiss!1248)) (index!4564 lt!89568)))))

(assert (=> d!54403 (validMask!0 (mask!8725 thiss!1248))))

(assert (=> d!54403 (= (seekKeyOrZeroReturnVacant!0 (x!19776 lt!89568) (index!4564 lt!89568) (index!4564 lt!89568) key!828 (_keys!5610 thiss!1248) (mask!8725 thiss!1248)) lt!89644)))

(declare-fun b!181271 () Bool)

(assert (=> b!181271 (= e!119394 Undefined!598)))

(declare-fun b!181272 () Bool)

(assert (=> b!181272 (= e!119395 (MissingVacant!598 (index!4564 lt!89568)))))

(declare-fun b!181273 () Bool)

(declare-fun c!32485 () Bool)

(assert (=> b!181273 (= c!32485 (= lt!89643 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181273 (= e!119396 e!119395)))

(declare-fun b!181274 () Bool)

(assert (=> b!181274 (= e!119396 (Found!598 (index!4564 lt!89568)))))

(assert (= (and d!54403 c!32487) b!181271))

(assert (= (and d!54403 (not c!32487)) b!181270))

(assert (= (and b!181270 c!32486) b!181274))

(assert (= (and b!181270 (not c!32486)) b!181273))

(assert (= (and b!181273 c!32485) b!181272))

(assert (= (and b!181273 (not c!32485)) b!181269))

(declare-fun m!209253 () Bool)

(assert (=> b!181269 m!209253))

(assert (=> b!181269 m!209253))

(declare-fun m!209255 () Bool)

(assert (=> b!181269 m!209255))

(declare-fun m!209257 () Bool)

(assert (=> d!54403 m!209257))

(declare-fun m!209259 () Bool)

(assert (=> d!54403 m!209259))

(assert (=> d!54403 m!209077))

(assert (=> d!54403 m!208971))

(assert (=> b!181155 d!54403))

(declare-fun b!181283 () Bool)

(declare-fun e!119404 () Bool)

(declare-fun call!18319 () Bool)

(assert (=> b!181283 (= e!119404 call!18319)))

(declare-fun b!181284 () Bool)

(declare-fun e!119403 () Bool)

(assert (=> b!181284 (= e!119403 e!119404)))

(declare-fun lt!89652 () (_ BitVec 64))

(assert (=> b!181284 (= lt!89652 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89653 () Unit!5504)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7667 (_ BitVec 64) (_ BitVec 32)) Unit!5504)

(assert (=> b!181284 (= lt!89653 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5610 thiss!1248) lt!89652 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!181284 (arrayContainsKey!0 (_keys!5610 thiss!1248) lt!89652 #b00000000000000000000000000000000)))

(declare-fun lt!89651 () Unit!5504)

(assert (=> b!181284 (= lt!89651 lt!89653)))

(declare-fun res!85831 () Bool)

(assert (=> b!181284 (= res!85831 (= (seekEntryOrOpen!0 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000) (_keys!5610 thiss!1248) (mask!8725 thiss!1248)) (Found!598 #b00000000000000000000000000000000)))))

(assert (=> b!181284 (=> (not res!85831) (not e!119404))))

(declare-fun b!181285 () Bool)

(assert (=> b!181285 (= e!119403 call!18319)))

(declare-fun b!181286 () Bool)

(declare-fun e!119405 () Bool)

(assert (=> b!181286 (= e!119405 e!119403)))

(declare-fun c!32490 () Bool)

(assert (=> b!181286 (= c!32490 (validKeyInArray!0 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18316 () Bool)

(assert (=> bm!18316 (= call!18319 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5610 thiss!1248) (mask!8725 thiss!1248)))))

(declare-fun d!54405 () Bool)

(declare-fun res!85830 () Bool)

(assert (=> d!54405 (=> res!85830 e!119405)))

(assert (=> d!54405 (= res!85830 (bvsge #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(assert (=> d!54405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5610 thiss!1248) (mask!8725 thiss!1248)) e!119405)))

(assert (= (and d!54405 (not res!85830)) b!181286))

(assert (= (and b!181286 c!32490) b!181284))

(assert (= (and b!181286 (not c!32490)) b!181285))

(assert (= (and b!181284 res!85831) b!181283))

(assert (= (or b!181283 b!181285) bm!18316))

(assert (=> b!181284 m!209011))

(declare-fun m!209261 () Bool)

(assert (=> b!181284 m!209261))

(declare-fun m!209263 () Bool)

(assert (=> b!181284 m!209263))

(assert (=> b!181284 m!209011))

(declare-fun m!209265 () Bool)

(assert (=> b!181284 m!209265))

(assert (=> b!181286 m!209011))

(assert (=> b!181286 m!209011))

(assert (=> b!181286 m!209013))

(declare-fun m!209267 () Bool)

(assert (=> bm!18316 m!209267))

(assert (=> b!181136 d!54405))

(declare-fun d!54407 () Bool)

(declare-fun e!119407 () Bool)

(assert (=> d!54407 e!119407))

(declare-fun res!85832 () Bool)

(assert (=> d!54407 (=> res!85832 e!119407)))

(declare-fun lt!89654 () Bool)

(assert (=> d!54407 (= res!85832 (not lt!89654))))

(declare-fun lt!89655 () Bool)

(assert (=> d!54407 (= lt!89654 lt!89655)))

(declare-fun lt!89657 () Unit!5504)

(declare-fun e!119406 () Unit!5504)

(assert (=> d!54407 (= lt!89657 e!119406)))

(declare-fun c!32491 () Bool)

(assert (=> d!54407 (= c!32491 lt!89655)))

(assert (=> d!54407 (= lt!89655 (containsKey!212 (toList!1164 lt!89553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54407 (= (contains!1242 lt!89553 #b0000000000000000000000000000000000000000000000000000000000000000) lt!89654)))

(declare-fun b!181287 () Bool)

(declare-fun lt!89656 () Unit!5504)

(assert (=> b!181287 (= e!119406 lt!89656)))

(assert (=> b!181287 (= lt!89656 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1164 lt!89553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181287 (isDefined!161 (getValueByKey!208 (toList!1164 lt!89553) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181288 () Bool)

(declare-fun Unit!5511 () Unit!5504)

(assert (=> b!181288 (= e!119406 Unit!5511)))

(declare-fun b!181289 () Bool)

(assert (=> b!181289 (= e!119407 (isDefined!161 (getValueByKey!208 (toList!1164 lt!89553) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54407 c!32491) b!181287))

(assert (= (and d!54407 (not c!32491)) b!181288))

(assert (= (and d!54407 (not res!85832)) b!181289))

(declare-fun m!209269 () Bool)

(assert (=> d!54407 m!209269))

(declare-fun m!209271 () Bool)

(assert (=> b!181287 m!209271))

(assert (=> b!181287 m!209125))

(assert (=> b!181287 m!209125))

(declare-fun m!209273 () Bool)

(assert (=> b!181287 m!209273))

(assert (=> b!181289 m!209125))

(assert (=> b!181289 m!209125))

(assert (=> b!181289 m!209273))

(assert (=> bm!18303 d!54407))

(declare-fun d!54409 () Bool)

(declare-fun isEmpty!458 (Option!214) Bool)

(assert (=> d!54409 (= (isDefined!161 (getValueByKey!208 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828)) (not (isEmpty!458 (getValueByKey!208 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828))))))

(declare-fun bs!7403 () Bool)

(assert (= bs!7403 d!54409))

(assert (=> bs!7403 m!209007))

(declare-fun m!209275 () Bool)

(assert (=> bs!7403 m!209275))

(assert (=> b!181063 d!54409))

(declare-fun d!54411 () Bool)

(declare-fun c!32496 () Bool)

(assert (=> d!54411 (= c!32496 (and ((_ is Cons!2299) (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))) (= (_1!1701 (h!2925 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))))) key!828)))))

(declare-fun e!119412 () Option!214)

(assert (=> d!54411 (= (getValueByKey!208 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828) e!119412)))

(declare-fun b!181301 () Bool)

(declare-fun e!119413 () Option!214)

(assert (=> b!181301 (= e!119413 None!212)))

(declare-fun b!181298 () Bool)

(assert (=> b!181298 (= e!119412 (Some!213 (_2!1701 (h!2925 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))))))))

(declare-fun b!181300 () Bool)

(assert (=> b!181300 (= e!119413 (getValueByKey!208 (t!7155 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))) key!828))))

(declare-fun b!181299 () Bool)

(assert (=> b!181299 (= e!119412 e!119413)))

(declare-fun c!32497 () Bool)

(assert (=> b!181299 (= c!32497 (and ((_ is Cons!2299) (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))) (not (= (_1!1701 (h!2925 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))))) key!828))))))

(assert (= (and d!54411 c!32496) b!181298))

(assert (= (and d!54411 (not c!32496)) b!181299))

(assert (= (and b!181299 c!32497) b!181300))

(assert (= (and b!181299 (not c!32497)) b!181301))

(declare-fun m!209277 () Bool)

(assert (=> b!181300 m!209277))

(assert (=> b!181063 d!54411))

(declare-fun d!54413 () Bool)

(declare-fun e!119426 () Bool)

(assert (=> d!54413 e!119426))

(declare-fun c!32506 () Bool)

(declare-fun lt!89663 () SeekEntryResult!598)

(assert (=> d!54413 (= c!32506 (and ((_ is Intermediate!598) lt!89663) (undefined!1410 lt!89663)))))

(declare-fun e!119427 () SeekEntryResult!598)

(assert (=> d!54413 (= lt!89663 e!119427)))

(declare-fun c!32505 () Bool)

(assert (=> d!54413 (= c!32505 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!89662 () (_ BitVec 64))

(assert (=> d!54413 (= lt!89662 (select (arr!3629 (_keys!5610 thiss!1248)) (toIndex!0 key!828 (mask!8725 thiss!1248))))))

(assert (=> d!54413 (validMask!0 (mask!8725 thiss!1248))))

(assert (=> d!54413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8725 thiss!1248)) key!828 (_keys!5610 thiss!1248) (mask!8725 thiss!1248)) lt!89663)))

(declare-fun b!181320 () Bool)

(assert (=> b!181320 (and (bvsge (index!4564 lt!89663) #b00000000000000000000000000000000) (bvslt (index!4564 lt!89663) (size!3938 (_keys!5610 thiss!1248))))))

(declare-fun res!85841 () Bool)

(assert (=> b!181320 (= res!85841 (= (select (arr!3629 (_keys!5610 thiss!1248)) (index!4564 lt!89663)) key!828))))

(declare-fun e!119424 () Bool)

(assert (=> b!181320 (=> res!85841 e!119424)))

(declare-fun e!119428 () Bool)

(assert (=> b!181320 (= e!119428 e!119424)))

(declare-fun b!181321 () Bool)

(assert (=> b!181321 (= e!119426 e!119428)))

(declare-fun res!85839 () Bool)

(assert (=> b!181321 (= res!85839 (and ((_ is Intermediate!598) lt!89663) (not (undefined!1410 lt!89663)) (bvslt (x!19776 lt!89663) #b01111111111111111111111111111110) (bvsge (x!19776 lt!89663) #b00000000000000000000000000000000) (bvsge (x!19776 lt!89663) #b00000000000000000000000000000000)))))

(assert (=> b!181321 (=> (not res!85839) (not e!119428))))

(declare-fun b!181322 () Bool)

(declare-fun e!119425 () SeekEntryResult!598)

(assert (=> b!181322 (= e!119425 (Intermediate!598 false (toIndex!0 key!828 (mask!8725 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181323 () Bool)

(assert (=> b!181323 (and (bvsge (index!4564 lt!89663) #b00000000000000000000000000000000) (bvslt (index!4564 lt!89663) (size!3938 (_keys!5610 thiss!1248))))))

(declare-fun res!85840 () Bool)

(assert (=> b!181323 (= res!85840 (= (select (arr!3629 (_keys!5610 thiss!1248)) (index!4564 lt!89663)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181323 (=> res!85840 e!119424)))

(declare-fun b!181324 () Bool)

(assert (=> b!181324 (= e!119426 (bvsge (x!19776 lt!89663) #b01111111111111111111111111111110))))

(declare-fun b!181325 () Bool)

(assert (=> b!181325 (and (bvsge (index!4564 lt!89663) #b00000000000000000000000000000000) (bvslt (index!4564 lt!89663) (size!3938 (_keys!5610 thiss!1248))))))

(assert (=> b!181325 (= e!119424 (= (select (arr!3629 (_keys!5610 thiss!1248)) (index!4564 lt!89663)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181326 () Bool)

(assert (=> b!181326 (= e!119425 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8725 thiss!1248)) #b00000000000000000000000000000000 (mask!8725 thiss!1248)) key!828 (_keys!5610 thiss!1248) (mask!8725 thiss!1248)))))

(declare-fun b!181327 () Bool)

(assert (=> b!181327 (= e!119427 (Intermediate!598 true (toIndex!0 key!828 (mask!8725 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181328 () Bool)

(assert (=> b!181328 (= e!119427 e!119425)))

(declare-fun c!32504 () Bool)

(assert (=> b!181328 (= c!32504 (or (= lt!89662 key!828) (= (bvadd lt!89662 lt!89662) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54413 c!32505) b!181327))

(assert (= (and d!54413 (not c!32505)) b!181328))

(assert (= (and b!181328 c!32504) b!181322))

(assert (= (and b!181328 (not c!32504)) b!181326))

(assert (= (and d!54413 c!32506) b!181324))

(assert (= (and d!54413 (not c!32506)) b!181321))

(assert (= (and b!181321 res!85839) b!181320))

(assert (= (and b!181320 (not res!85841)) b!181323))

(assert (= (and b!181323 (not res!85840)) b!181325))

(declare-fun m!209279 () Bool)

(assert (=> b!181325 m!209279))

(assert (=> b!181326 m!209079))

(declare-fun m!209281 () Bool)

(assert (=> b!181326 m!209281))

(assert (=> b!181326 m!209281))

(declare-fun m!209283 () Bool)

(assert (=> b!181326 m!209283))

(assert (=> d!54413 m!209079))

(declare-fun m!209285 () Bool)

(assert (=> d!54413 m!209285))

(assert (=> d!54413 m!208971))

(assert (=> b!181320 m!209279))

(assert (=> b!181323 m!209279))

(assert (=> d!54349 d!54413))

(declare-fun d!54415 () Bool)

(declare-fun lt!89669 () (_ BitVec 32))

(declare-fun lt!89668 () (_ BitVec 32))

(assert (=> d!54415 (= lt!89669 (bvmul (bvxor lt!89668 (bvlshr lt!89668 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54415 (= lt!89668 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54415 (and (bvsge (mask!8725 thiss!1248) #b00000000000000000000000000000000) (let ((res!85842 (let ((h!2928 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19795 (bvmul (bvxor h!2928 (bvlshr h!2928 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19795 (bvlshr x!19795 #b00000000000000000000000000001101)) (mask!8725 thiss!1248)))))) (and (bvslt res!85842 (bvadd (mask!8725 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!85842 #b00000000000000000000000000000000))))))

(assert (=> d!54415 (= (toIndex!0 key!828 (mask!8725 thiss!1248)) (bvand (bvxor lt!89669 (bvlshr lt!89669 #b00000000000000000000000000001101)) (mask!8725 thiss!1248)))))

(assert (=> d!54349 d!54415))

(assert (=> d!54349 d!54351))

(declare-fun d!54417 () Bool)

(assert (=> d!54417 (isDefined!161 (getValueByKey!208 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828))))

(declare-fun lt!89672 () Unit!5504)

(declare-fun choose!963 (List!2303 (_ BitVec 64)) Unit!5504)

(assert (=> d!54417 (= lt!89672 (choose!963 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828))))

(declare-fun e!119431 () Bool)

(assert (=> d!54417 e!119431))

(declare-fun res!85845 () Bool)

(assert (=> d!54417 (=> (not res!85845) (not e!119431))))

(declare-fun isStrictlySorted!342 (List!2303) Bool)

(assert (=> d!54417 (= res!85845 (isStrictlySorted!342 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248)))))))

(assert (=> d!54417 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828) lt!89672)))

(declare-fun b!181331 () Bool)

(assert (=> b!181331 (= e!119431 (containsKey!212 (toList!1164 (getCurrentListMap!812 (_keys!5610 thiss!1248) (_values!3695 thiss!1248) (mask!8725 thiss!1248) (extraKeys!3449 thiss!1248) (zeroValue!3553 thiss!1248) (minValue!3553 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3712 thiss!1248))) key!828))))

(assert (= (and d!54417 res!85845) b!181331))

(assert (=> d!54417 m!209007))

(assert (=> d!54417 m!209007))

(assert (=> d!54417 m!209009))

(declare-fun m!209287 () Bool)

(assert (=> d!54417 m!209287))

(declare-fun m!209289 () Bool)

(assert (=> d!54417 m!209289))

(assert (=> b!181331 m!209003))

(assert (=> b!181061 d!54417))

(assert (=> b!181061 d!54409))

(assert (=> b!181061 d!54411))

(declare-fun b!181341 () Bool)

(declare-fun res!85855 () Bool)

(declare-fun e!119434 () Bool)

(assert (=> b!181341 (=> (not res!85855) (not e!119434))))

(declare-fun size!3942 (LongMapFixedSize!2466) (_ BitVec 32))

(assert (=> b!181341 (= res!85855 (bvsge (size!3942 thiss!1248) (_size!1282 thiss!1248)))))

(declare-fun b!181340 () Bool)

(declare-fun res!85857 () Bool)

(assert (=> b!181340 (=> (not res!85857) (not e!119434))))

(assert (=> b!181340 (= res!85857 (and (= (size!3939 (_values!3695 thiss!1248)) (bvadd (mask!8725 thiss!1248) #b00000000000000000000000000000001)) (= (size!3938 (_keys!5610 thiss!1248)) (size!3939 (_values!3695 thiss!1248))) (bvsge (_size!1282 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1282 thiss!1248) (bvadd (mask!8725 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!181343 () Bool)

(assert (=> b!181343 (= e!119434 (and (bvsge (extraKeys!3449 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3449 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1282 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!181342 () Bool)

(declare-fun res!85854 () Bool)

(assert (=> b!181342 (=> (not res!85854) (not e!119434))))

(assert (=> b!181342 (= res!85854 (= (size!3942 thiss!1248) (bvadd (_size!1282 thiss!1248) (bvsdiv (bvadd (extraKeys!3449 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!54419 () Bool)

(declare-fun res!85856 () Bool)

(assert (=> d!54419 (=> (not res!85856) (not e!119434))))

(assert (=> d!54419 (= res!85856 (validMask!0 (mask!8725 thiss!1248)))))

(assert (=> d!54419 (= (simpleValid!167 thiss!1248) e!119434)))

(assert (= (and d!54419 res!85856) b!181340))

(assert (= (and b!181340 res!85857) b!181341))

(assert (= (and b!181341 res!85855) b!181342))

(assert (= (and b!181342 res!85854) b!181343))

(declare-fun m!209291 () Bool)

(assert (=> b!181341 m!209291))

(assert (=> b!181342 m!209291))

(assert (=> d!54419 m!208971))

(assert (=> d!54347 d!54419))

(declare-fun b!181352 () Bool)

(declare-fun e!119439 () (_ BitVec 32))

(assert (=> b!181352 (= e!119439 #b00000000000000000000000000000000)))

(declare-fun b!181353 () Bool)

(declare-fun e!119440 () (_ BitVec 32))

(declare-fun call!18322 () (_ BitVec 32))

(assert (=> b!181353 (= e!119440 call!18322)))

(declare-fun d!54421 () Bool)

(declare-fun lt!89675 () (_ BitVec 32))

(assert (=> d!54421 (and (bvsge lt!89675 #b00000000000000000000000000000000) (bvsle lt!89675 (bvsub (size!3938 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54421 (= lt!89675 e!119439)))

(declare-fun c!32511 () Bool)

(assert (=> d!54421 (= c!32511 (bvsge #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))))))

(assert (=> d!54421 (and (bvsle #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3938 (_keys!5610 thiss!1248)) (size!3938 (_keys!5610 thiss!1248))))))

(assert (=> d!54421 (= (arrayCountValidKeys!0 (_keys!5610 thiss!1248) #b00000000000000000000000000000000 (size!3938 (_keys!5610 thiss!1248))) lt!89675)))

(declare-fun b!181354 () Bool)

(assert (=> b!181354 (= e!119440 (bvadd #b00000000000000000000000000000001 call!18322))))

(declare-fun b!181355 () Bool)

(assert (=> b!181355 (= e!119439 e!119440)))

(declare-fun c!32512 () Bool)

(assert (=> b!181355 (= c!32512 (validKeyInArray!0 (select (arr!3629 (_keys!5610 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18319 () Bool)

(assert (=> bm!18319 (= call!18322 (arrayCountValidKeys!0 (_keys!5610 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3938 (_keys!5610 thiss!1248))))))

(assert (= (and d!54421 c!32511) b!181352))

(assert (= (and d!54421 (not c!32511)) b!181355))

(assert (= (and b!181355 c!32512) b!181354))

(assert (= (and b!181355 (not c!32512)) b!181353))

(assert (= (or b!181354 b!181353) bm!18319))

(assert (=> b!181355 m!209011))

(assert (=> b!181355 m!209011))

(assert (=> b!181355 m!209013))

(declare-fun m!209293 () Bool)

(assert (=> bm!18319 m!209293))

(assert (=> b!181135 d!54421))

(declare-fun d!54423 () Bool)

(declare-fun e!119441 () Bool)

(assert (=> d!54423 e!119441))

(declare-fun res!85859 () Bool)

(assert (=> d!54423 (=> (not res!85859) (not e!119441))))

(declare-fun lt!89679 () ListLongMap!2297)

(assert (=> d!54423 (= res!85859 (contains!1242 lt!89679 (_1!1701 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))))))

(declare-fun lt!89676 () List!2303)

(assert (=> d!54423 (= lt!89679 (ListLongMap!2298 lt!89676))))

(declare-fun lt!89677 () Unit!5504)

(declare-fun lt!89678 () Unit!5504)

(assert (=> d!54423 (= lt!89677 lt!89678)))

(assert (=> d!54423 (= (getValueByKey!208 lt!89676 (_1!1701 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))) (Some!213 (_2!1701 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))))))

(assert (=> d!54423 (= lt!89678 (lemmaContainsTupThenGetReturnValue!110 lt!89676 (_1!1701 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))) (_2!1701 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))))))

(assert (=> d!54423 (= lt!89676 (insertStrictlySorted!113 (toList!1164 call!18306) (_1!1701 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))) (_2!1701 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))))))

(assert (=> d!54423 (= (+!271 call!18306 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))) lt!89679)))

(declare-fun b!181356 () Bool)

(declare-fun res!85858 () Bool)

(assert (=> b!181356 (=> (not res!85858) (not e!119441))))

(assert (=> b!181356 (= res!85858 (= (getValueByKey!208 (toList!1164 lt!89679) (_1!1701 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248)))) (Some!213 (_2!1701 (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))))))))

(declare-fun b!181357 () Bool)

(assert (=> b!181357 (= e!119441 (contains!1244 (toList!1164 lt!89679) (tuple2!3381 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3553 thiss!1248))))))

(assert (= (and d!54423 res!85859) b!181356))

(assert (= (and b!181356 res!85858) b!181357))

(declare-fun m!209295 () Bool)

(assert (=> d!54423 m!209295))

(declare-fun m!209297 () Bool)

(assert (=> d!54423 m!209297))

(declare-fun m!209299 () Bool)

(assert (=> d!54423 m!209299))

(declare-fun m!209301 () Bool)

(assert (=> d!54423 m!209301))

(declare-fun m!209303 () Bool)

(assert (=> b!181356 m!209303))

(declare-fun m!209305 () Bool)

(assert (=> b!181357 m!209305))

(assert (=> b!181109 d!54423))

(declare-fun d!54425 () Bool)

(assert (=> d!54425 (= (apply!151 lt!89553 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2074 (getValueByKey!208 (toList!1164 lt!89553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7404 () Bool)

(assert (= bs!7404 d!54425))

(assert (=> bs!7404 m!209249))

(assert (=> bs!7404 m!209249))

(declare-fun m!209307 () Bool)

(assert (=> bs!7404 m!209307))

(assert (=> b!181126 d!54425))

(declare-fun b!181359 () Bool)

(declare-fun e!119442 () Bool)

(assert (=> b!181359 (= e!119442 tp_is_empty!4245)))

(declare-fun b!181358 () Bool)

(declare-fun e!119443 () Bool)

(assert (=> b!181358 (= e!119443 tp_is_empty!4245)))

(declare-fun condMapEmpty!7281 () Bool)

(declare-fun mapDefault!7281 () ValueCell!1779)

(assert (=> mapNonEmpty!7280 (= condMapEmpty!7281 (= mapRest!7280 ((as const (Array (_ BitVec 32) ValueCell!1779)) mapDefault!7281)))))

(declare-fun mapRes!7281 () Bool)

(assert (=> mapNonEmpty!7280 (= tp!16172 (and e!119442 mapRes!7281))))

(declare-fun mapNonEmpty!7281 () Bool)

(declare-fun tp!16173 () Bool)

(assert (=> mapNonEmpty!7281 (= mapRes!7281 (and tp!16173 e!119443))))

(declare-fun mapRest!7281 () (Array (_ BitVec 32) ValueCell!1779))

(declare-fun mapKey!7281 () (_ BitVec 32))

(declare-fun mapValue!7281 () ValueCell!1779)

(assert (=> mapNonEmpty!7281 (= mapRest!7280 (store mapRest!7281 mapKey!7281 mapValue!7281))))

(declare-fun mapIsEmpty!7281 () Bool)

(assert (=> mapIsEmpty!7281 mapRes!7281))

(assert (= (and mapNonEmpty!7280 condMapEmpty!7281) mapIsEmpty!7281))

(assert (= (and mapNonEmpty!7280 (not condMapEmpty!7281)) mapNonEmpty!7281))

(assert (= (and mapNonEmpty!7281 ((_ is ValueCellFull!1779) mapValue!7281)) b!181358))

(assert (= (and mapNonEmpty!7280 ((_ is ValueCellFull!1779) mapDefault!7281)) b!181359))

(declare-fun m!209309 () Bool)

(assert (=> mapNonEmpty!7281 m!209309))

(declare-fun b_lambda!7143 () Bool)

(assert (= b_lambda!7141 (or (and b!181025 b_free!4473) b_lambda!7143)))

(declare-fun b_lambda!7145 () Bool)

(assert (= b_lambda!7139 (or (and b!181025 b_free!4473) b_lambda!7145)))

(check-sat (not b!181342) (not bm!18316) (not b!181219) (not b!181287) (not b!181231) (not b!181196) (not b!181284) (not b!181236) (not mapNonEmpty!7281) (not d!54375) (not b!181169) (not b_lambda!7143) (not d!54413) (not d!54379) (not b!181254) (not d!54417) (not d!54397) (not d!54357) (not b!181214) (not b!181331) (not b!181256) (not b!181225) (not b!181357) (not b!181194) tp_is_empty!4245 (not d!54369) (not b!181195) (not d!54387) (not b!181226) (not d!54409) (not b_lambda!7137) (not d!54425) (not b!181227) (not b!181341) (not d!54419) (not d!54353) (not b!181168) (not d!54391) (not d!54385) (not b!181253) (not b!181269) (not b!181356) (not bm!18319) (not d!54401) (not b!181233) (not b!181199) (not b!181212) (not b!181228) (not d!54407) (not d!54361) (not d!54393) (not b!181300) (not d!54371) (not b!181237) (not b!181286) (not b!181200) (not b!181234) (not d!54389) (not b!181198) (not b!181326) (not b_next!4473) (not b!181229) (not d!54383) (not b!181220) (not d!54363) (not b_lambda!7145) (not b!181355) (not d!54373) (not b!181203) (not bm!18313) (not b!181289) (not d!54377) (not d!54355) (not d!54403) (not b!181197) (not d!54423) b_and!11023 (not b!181252) (not b!181211) (not bm!18310) (not b!181250) (not d!54395) (not d!54381))
(check-sat b_and!11023 (not b_next!4473))
