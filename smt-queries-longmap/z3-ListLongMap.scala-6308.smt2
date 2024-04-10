; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80816 () Bool)

(assert start!80816)

(declare-fun b!947341 () Bool)

(declare-fun b_free!18171 () Bool)

(declare-fun b_next!18171 () Bool)

(assert (=> b!947341 (= b_free!18171 (not b_next!18171))))

(declare-fun tp!63072 () Bool)

(declare-fun b_and!29593 () Bool)

(assert (=> b!947341 (= tp!63072 b_and!29593)))

(declare-fun b!947339 () Bool)

(declare-fun e!533191 () Bool)

(declare-datatypes ((SeekEntryResult!9113 0))(
  ( (MissingZero!9113 (index!38823 (_ BitVec 32))) (Found!9113 (index!38824 (_ BitVec 32))) (Intermediate!9113 (undefined!9925 Bool) (index!38825 (_ BitVec 32)) (x!81497 (_ BitVec 32))) (Undefined!9113) (MissingVacant!9113 (index!38826 (_ BitVec 32))) )
))
(declare-fun lt!426551 () SeekEntryResult!9113)

(declare-datatypes ((V!32537 0))(
  ( (V!32538 (val!10390 Int)) )
))
(declare-datatypes ((ValueCell!9858 0))(
  ( (ValueCellFull!9858 (v!12924 V!32537)) (EmptyCell!9858) )
))
(declare-datatypes ((array!57354 0))(
  ( (array!57355 (arr!27588 (Array (_ BitVec 32) ValueCell!9858)) (size!28061 (_ BitVec 32))) )
))
(declare-datatypes ((array!57356 0))(
  ( (array!57357 (arr!27589 (Array (_ BitVec 32) (_ BitVec 64))) (size!28062 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4866 0))(
  ( (LongMapFixedSize!4867 (defaultEntry!5730 Int) (mask!27465 (_ BitVec 32)) (extraKeys!5462 (_ BitVec 32)) (zeroValue!5566 V!32537) (minValue!5566 V!32537) (_size!2488 (_ BitVec 32)) (_keys!10639 array!57356) (_values!5753 array!57354) (_vacant!2488 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4866)

(assert (=> b!947339 (= e!533191 (and (bvsge (index!38824 lt!426551) #b00000000000000000000000000000000) (bvslt (index!38824 lt!426551) (size!28062 (_keys!10639 thiss!1141)))))))

(declare-fun b!947340 () Bool)

(declare-fun res!635797 () Bool)

(declare-fun e!533189 () Bool)

(assert (=> b!947340 (=> (not res!635797) (not e!533189))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!947340 (= res!635797 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32893 () Bool)

(declare-fun mapRes!32893 () Bool)

(declare-fun tp!63071 () Bool)

(declare-fun e!533188 () Bool)

(assert (=> mapNonEmpty!32893 (= mapRes!32893 (and tp!63071 e!533188))))

(declare-fun mapKey!32893 () (_ BitVec 32))

(declare-fun mapRest!32893 () (Array (_ BitVec 32) ValueCell!9858))

(declare-fun mapValue!32893 () ValueCell!9858)

(assert (=> mapNonEmpty!32893 (= (arr!27588 (_values!5753 thiss!1141)) (store mapRest!32893 mapKey!32893 mapValue!32893))))

(declare-fun e!533190 () Bool)

(declare-fun tp_is_empty!20679 () Bool)

(declare-fun e!533185 () Bool)

(declare-fun array_inv!21416 (array!57356) Bool)

(declare-fun array_inv!21417 (array!57354) Bool)

(assert (=> b!947341 (= e!533190 (and tp!63072 tp_is_empty!20679 (array_inv!21416 (_keys!10639 thiss!1141)) (array_inv!21417 (_values!5753 thiss!1141)) e!533185))))

(declare-fun b!947342 () Bool)

(declare-fun e!533187 () Bool)

(assert (=> b!947342 (= e!533185 (and e!533187 mapRes!32893))))

(declare-fun condMapEmpty!32893 () Bool)

(declare-fun mapDefault!32893 () ValueCell!9858)

(assert (=> b!947342 (= condMapEmpty!32893 (= (arr!27588 (_values!5753 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9858)) mapDefault!32893)))))

(declare-fun b!947343 () Bool)

(declare-fun res!635793 () Bool)

(assert (=> b!947343 (=> res!635793 e!533191)))

(assert (=> b!947343 (= res!635793 (or (not (= (size!28061 (_values!5753 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27465 thiss!1141)))) (not (= (size!28062 (_keys!10639 thiss!1141)) (size!28061 (_values!5753 thiss!1141)))) (bvslt (mask!27465 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5462 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5462 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun res!635795 () Bool)

(assert (=> start!80816 (=> (not res!635795) (not e!533189))))

(declare-fun valid!1854 (LongMapFixedSize!4866) Bool)

(assert (=> start!80816 (= res!635795 (valid!1854 thiss!1141))))

(assert (=> start!80816 e!533189))

(assert (=> start!80816 e!533190))

(assert (=> start!80816 true))

(declare-fun mapIsEmpty!32893 () Bool)

(assert (=> mapIsEmpty!32893 mapRes!32893))

(declare-fun b!947344 () Bool)

(declare-fun e!533192 () Bool)

(assert (=> b!947344 (= e!533192 (not e!533191))))

(declare-fun res!635796 () Bool)

(assert (=> b!947344 (=> res!635796 e!533191)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947344 (= res!635796 (not (validMask!0 (mask!27465 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947344 (arrayContainsKey!0 (_keys!10639 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31922 0))(
  ( (Unit!31923) )
))
(declare-fun lt!426552 () Unit!31922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57356 (_ BitVec 64) (_ BitVec 32)) Unit!31922)

(assert (=> b!947344 (= lt!426552 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10639 thiss!1141) key!756 (index!38824 lt!426551)))))

(declare-fun b!947345 () Bool)

(declare-fun res!635794 () Bool)

(assert (=> b!947345 (=> res!635794 e!533191)))

(declare-datatypes ((List!19305 0))(
  ( (Nil!19302) (Cons!19301 (h!20457 (_ BitVec 64)) (t!27626 List!19305)) )
))
(declare-fun arrayNoDuplicates!0 (array!57356 (_ BitVec 32) List!19305) Bool)

(assert (=> b!947345 (= res!635794 (not (arrayNoDuplicates!0 (_keys!10639 thiss!1141) #b00000000000000000000000000000000 Nil!19302)))))

(declare-fun b!947346 () Bool)

(assert (=> b!947346 (= e!533188 tp_is_empty!20679)))

(declare-fun b!947347 () Bool)

(assert (=> b!947347 (= e!533189 e!533192)))

(declare-fun res!635792 () Bool)

(assert (=> b!947347 (=> (not res!635792) (not e!533192))))

(get-info :version)

(assert (=> b!947347 (= res!635792 ((_ is Found!9113) lt!426551))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57356 (_ BitVec 32)) SeekEntryResult!9113)

(assert (=> b!947347 (= lt!426551 (seekEntry!0 key!756 (_keys!10639 thiss!1141) (mask!27465 thiss!1141)))))

(declare-fun b!947348 () Bool)

(assert (=> b!947348 (= e!533187 tp_is_empty!20679)))

(declare-fun b!947349 () Bool)

(declare-fun res!635791 () Bool)

(assert (=> b!947349 (=> res!635791 e!533191)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57356 (_ BitVec 32)) Bool)

(assert (=> b!947349 (= res!635791 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10639 thiss!1141) (mask!27465 thiss!1141))))))

(assert (= (and start!80816 res!635795) b!947340))

(assert (= (and b!947340 res!635797) b!947347))

(assert (= (and b!947347 res!635792) b!947344))

(assert (= (and b!947344 (not res!635796)) b!947343))

(assert (= (and b!947343 (not res!635793)) b!947349))

(assert (= (and b!947349 (not res!635791)) b!947345))

(assert (= (and b!947345 (not res!635794)) b!947339))

(assert (= (and b!947342 condMapEmpty!32893) mapIsEmpty!32893))

(assert (= (and b!947342 (not condMapEmpty!32893)) mapNonEmpty!32893))

(assert (= (and mapNonEmpty!32893 ((_ is ValueCellFull!9858) mapValue!32893)) b!947346))

(assert (= (and b!947342 ((_ is ValueCellFull!9858) mapDefault!32893)) b!947348))

(assert (= b!947341 b!947342))

(assert (= start!80816 b!947341))

(declare-fun m!880331 () Bool)

(assert (=> start!80816 m!880331))

(declare-fun m!880333 () Bool)

(assert (=> b!947344 m!880333))

(declare-fun m!880335 () Bool)

(assert (=> b!947344 m!880335))

(declare-fun m!880337 () Bool)

(assert (=> b!947344 m!880337))

(declare-fun m!880339 () Bool)

(assert (=> mapNonEmpty!32893 m!880339))

(declare-fun m!880341 () Bool)

(assert (=> b!947345 m!880341))

(declare-fun m!880343 () Bool)

(assert (=> b!947349 m!880343))

(declare-fun m!880345 () Bool)

(assert (=> b!947341 m!880345))

(declare-fun m!880347 () Bool)

(assert (=> b!947341 m!880347))

(declare-fun m!880349 () Bool)

(assert (=> b!947347 m!880349))

(check-sat b_and!29593 tp_is_empty!20679 (not start!80816) (not b!947341) (not b_next!18171) (not b!947344) (not mapNonEmpty!32893) (not b!947347) (not b!947349) (not b!947345))
(check-sat b_and!29593 (not b_next!18171))
(get-model)

(declare-fun b!947391 () Bool)

(declare-fun e!533224 () Bool)

(declare-fun call!41115 () Bool)

(assert (=> b!947391 (= e!533224 call!41115)))

(declare-fun bm!41112 () Bool)

(assert (=> bm!41112 (= call!41115 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10639 thiss!1141) (mask!27465 thiss!1141)))))

(declare-fun b!947392 () Bool)

(declare-fun e!533225 () Bool)

(assert (=> b!947392 (= e!533225 call!41115)))

(declare-fun b!947393 () Bool)

(declare-fun e!533223 () Bool)

(assert (=> b!947393 (= e!533223 e!533224)))

(declare-fun c!98690 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947393 (= c!98690 (validKeyInArray!0 (select (arr!27589 (_keys!10639 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114669 () Bool)

(declare-fun res!635824 () Bool)

(assert (=> d!114669 (=> res!635824 e!533223)))

(assert (=> d!114669 (= res!635824 (bvsge #b00000000000000000000000000000000 (size!28062 (_keys!10639 thiss!1141))))))

(assert (=> d!114669 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10639 thiss!1141) (mask!27465 thiss!1141)) e!533223)))

(declare-fun b!947394 () Bool)

(assert (=> b!947394 (= e!533224 e!533225)))

(declare-fun lt!426566 () (_ BitVec 64))

(assert (=> b!947394 (= lt!426566 (select (arr!27589 (_keys!10639 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426565 () Unit!31922)

(assert (=> b!947394 (= lt!426565 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10639 thiss!1141) lt!426566 #b00000000000000000000000000000000))))

(assert (=> b!947394 (arrayContainsKey!0 (_keys!10639 thiss!1141) lt!426566 #b00000000000000000000000000000000)))

(declare-fun lt!426567 () Unit!31922)

(assert (=> b!947394 (= lt!426567 lt!426565)))

(declare-fun res!635823 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57356 (_ BitVec 32)) SeekEntryResult!9113)

(assert (=> b!947394 (= res!635823 (= (seekEntryOrOpen!0 (select (arr!27589 (_keys!10639 thiss!1141)) #b00000000000000000000000000000000) (_keys!10639 thiss!1141) (mask!27465 thiss!1141)) (Found!9113 #b00000000000000000000000000000000)))))

(assert (=> b!947394 (=> (not res!635823) (not e!533225))))

(assert (= (and d!114669 (not res!635824)) b!947393))

(assert (= (and b!947393 c!98690) b!947394))

(assert (= (and b!947393 (not c!98690)) b!947391))

(assert (= (and b!947394 res!635823) b!947392))

(assert (= (or b!947392 b!947391) bm!41112))

(declare-fun m!880371 () Bool)

(assert (=> bm!41112 m!880371))

(declare-fun m!880373 () Bool)

(assert (=> b!947393 m!880373))

(assert (=> b!947393 m!880373))

(declare-fun m!880375 () Bool)

(assert (=> b!947393 m!880375))

(assert (=> b!947394 m!880373))

(declare-fun m!880377 () Bool)

(assert (=> b!947394 m!880377))

(declare-fun m!880379 () Bool)

(assert (=> b!947394 m!880379))

(assert (=> b!947394 m!880373))

(declare-fun m!880381 () Bool)

(assert (=> b!947394 m!880381))

(assert (=> b!947349 d!114669))

(declare-fun d!114671 () Bool)

(assert (=> d!114671 (= (validMask!0 (mask!27465 thiss!1141)) (and (or (= (mask!27465 thiss!1141) #b00000000000000000000000000000111) (= (mask!27465 thiss!1141) #b00000000000000000000000000001111) (= (mask!27465 thiss!1141) #b00000000000000000000000000011111) (= (mask!27465 thiss!1141) #b00000000000000000000000000111111) (= (mask!27465 thiss!1141) #b00000000000000000000000001111111) (= (mask!27465 thiss!1141) #b00000000000000000000000011111111) (= (mask!27465 thiss!1141) #b00000000000000000000000111111111) (= (mask!27465 thiss!1141) #b00000000000000000000001111111111) (= (mask!27465 thiss!1141) #b00000000000000000000011111111111) (= (mask!27465 thiss!1141) #b00000000000000000000111111111111) (= (mask!27465 thiss!1141) #b00000000000000000001111111111111) (= (mask!27465 thiss!1141) #b00000000000000000011111111111111) (= (mask!27465 thiss!1141) #b00000000000000000111111111111111) (= (mask!27465 thiss!1141) #b00000000000000001111111111111111) (= (mask!27465 thiss!1141) #b00000000000000011111111111111111) (= (mask!27465 thiss!1141) #b00000000000000111111111111111111) (= (mask!27465 thiss!1141) #b00000000000001111111111111111111) (= (mask!27465 thiss!1141) #b00000000000011111111111111111111) (= (mask!27465 thiss!1141) #b00000000000111111111111111111111) (= (mask!27465 thiss!1141) #b00000000001111111111111111111111) (= (mask!27465 thiss!1141) #b00000000011111111111111111111111) (= (mask!27465 thiss!1141) #b00000000111111111111111111111111) (= (mask!27465 thiss!1141) #b00000001111111111111111111111111) (= (mask!27465 thiss!1141) #b00000011111111111111111111111111) (= (mask!27465 thiss!1141) #b00000111111111111111111111111111) (= (mask!27465 thiss!1141) #b00001111111111111111111111111111) (= (mask!27465 thiss!1141) #b00011111111111111111111111111111) (= (mask!27465 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27465 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947344 d!114671))

(declare-fun d!114673 () Bool)

(declare-fun res!635829 () Bool)

(declare-fun e!533230 () Bool)

(assert (=> d!114673 (=> res!635829 e!533230)))

(assert (=> d!114673 (= res!635829 (= (select (arr!27589 (_keys!10639 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114673 (= (arrayContainsKey!0 (_keys!10639 thiss!1141) key!756 #b00000000000000000000000000000000) e!533230)))

(declare-fun b!947399 () Bool)

(declare-fun e!533231 () Bool)

(assert (=> b!947399 (= e!533230 e!533231)))

(declare-fun res!635830 () Bool)

(assert (=> b!947399 (=> (not res!635830) (not e!533231))))

(assert (=> b!947399 (= res!635830 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28062 (_keys!10639 thiss!1141))))))

(declare-fun b!947400 () Bool)

(assert (=> b!947400 (= e!533231 (arrayContainsKey!0 (_keys!10639 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114673 (not res!635829)) b!947399))

(assert (= (and b!947399 res!635830) b!947400))

(assert (=> d!114673 m!880373))

(declare-fun m!880383 () Bool)

(assert (=> b!947400 m!880383))

(assert (=> b!947344 d!114673))

(declare-fun d!114675 () Bool)

(assert (=> d!114675 (arrayContainsKey!0 (_keys!10639 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426570 () Unit!31922)

(declare-fun choose!13 (array!57356 (_ BitVec 64) (_ BitVec 32)) Unit!31922)

(assert (=> d!114675 (= lt!426570 (choose!13 (_keys!10639 thiss!1141) key!756 (index!38824 lt!426551)))))

(assert (=> d!114675 (bvsge (index!38824 lt!426551) #b00000000000000000000000000000000)))

(assert (=> d!114675 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10639 thiss!1141) key!756 (index!38824 lt!426551)) lt!426570)))

(declare-fun bs!26628 () Bool)

(assert (= bs!26628 d!114675))

(assert (=> bs!26628 m!880335))

(declare-fun m!880385 () Bool)

(assert (=> bs!26628 m!880385))

(assert (=> b!947344 d!114675))

(declare-fun b!947413 () Bool)

(declare-fun e!533239 () SeekEntryResult!9113)

(declare-fun e!533240 () SeekEntryResult!9113)

(assert (=> b!947413 (= e!533239 e!533240)))

(declare-fun lt!426581 () (_ BitVec 64))

(declare-fun lt!426579 () SeekEntryResult!9113)

(assert (=> b!947413 (= lt!426581 (select (arr!27589 (_keys!10639 thiss!1141)) (index!38825 lt!426579)))))

(declare-fun c!98699 () Bool)

(assert (=> b!947413 (= c!98699 (= lt!426581 key!756))))

(declare-fun d!114677 () Bool)

(declare-fun lt!426582 () SeekEntryResult!9113)

(assert (=> d!114677 (and (or ((_ is MissingVacant!9113) lt!426582) (not ((_ is Found!9113) lt!426582)) (and (bvsge (index!38824 lt!426582) #b00000000000000000000000000000000) (bvslt (index!38824 lt!426582) (size!28062 (_keys!10639 thiss!1141))))) (not ((_ is MissingVacant!9113) lt!426582)) (or (not ((_ is Found!9113) lt!426582)) (= (select (arr!27589 (_keys!10639 thiss!1141)) (index!38824 lt!426582)) key!756)))))

(assert (=> d!114677 (= lt!426582 e!533239)))

(declare-fun c!98697 () Bool)

(assert (=> d!114677 (= c!98697 (and ((_ is Intermediate!9113) lt!426579) (undefined!9925 lt!426579)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57356 (_ BitVec 32)) SeekEntryResult!9113)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114677 (= lt!426579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27465 thiss!1141)) key!756 (_keys!10639 thiss!1141) (mask!27465 thiss!1141)))))

(assert (=> d!114677 (validMask!0 (mask!27465 thiss!1141))))

(assert (=> d!114677 (= (seekEntry!0 key!756 (_keys!10639 thiss!1141) (mask!27465 thiss!1141)) lt!426582)))

(declare-fun b!947414 () Bool)

(declare-fun e!533238 () SeekEntryResult!9113)

(assert (=> b!947414 (= e!533238 (MissingZero!9113 (index!38825 lt!426579)))))

(declare-fun b!947415 () Bool)

(declare-fun c!98698 () Bool)

(assert (=> b!947415 (= c!98698 (= lt!426581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947415 (= e!533240 e!533238)))

(declare-fun b!947416 () Bool)

(declare-fun lt!426580 () SeekEntryResult!9113)

(assert (=> b!947416 (= e!533238 (ite ((_ is MissingVacant!9113) lt!426580) (MissingZero!9113 (index!38826 lt!426580)) lt!426580))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57356 (_ BitVec 32)) SeekEntryResult!9113)

(assert (=> b!947416 (= lt!426580 (seekKeyOrZeroReturnVacant!0 (x!81497 lt!426579) (index!38825 lt!426579) (index!38825 lt!426579) key!756 (_keys!10639 thiss!1141) (mask!27465 thiss!1141)))))

(declare-fun b!947417 () Bool)

(assert (=> b!947417 (= e!533240 (Found!9113 (index!38825 lt!426579)))))

(declare-fun b!947418 () Bool)

(assert (=> b!947418 (= e!533239 Undefined!9113)))

(assert (= (and d!114677 c!98697) b!947418))

(assert (= (and d!114677 (not c!98697)) b!947413))

(assert (= (and b!947413 c!98699) b!947417))

(assert (= (and b!947413 (not c!98699)) b!947415))

(assert (= (and b!947415 c!98698) b!947414))

(assert (= (and b!947415 (not c!98698)) b!947416))

(declare-fun m!880387 () Bool)

(assert (=> b!947413 m!880387))

(declare-fun m!880389 () Bool)

(assert (=> d!114677 m!880389))

(declare-fun m!880391 () Bool)

(assert (=> d!114677 m!880391))

(assert (=> d!114677 m!880391))

(declare-fun m!880393 () Bool)

(assert (=> d!114677 m!880393))

(assert (=> d!114677 m!880333))

(declare-fun m!880395 () Bool)

(assert (=> b!947416 m!880395))

(assert (=> b!947347 d!114677))

(declare-fun b!947429 () Bool)

(declare-fun e!533252 () Bool)

(declare-fun e!533251 () Bool)

(assert (=> b!947429 (= e!533252 e!533251)))

(declare-fun c!98702 () Bool)

(assert (=> b!947429 (= c!98702 (validKeyInArray!0 (select (arr!27589 (_keys!10639 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114679 () Bool)

(declare-fun res!635839 () Bool)

(declare-fun e!533249 () Bool)

(assert (=> d!114679 (=> res!635839 e!533249)))

(assert (=> d!114679 (= res!635839 (bvsge #b00000000000000000000000000000000 (size!28062 (_keys!10639 thiss!1141))))))

(assert (=> d!114679 (= (arrayNoDuplicates!0 (_keys!10639 thiss!1141) #b00000000000000000000000000000000 Nil!19302) e!533249)))

(declare-fun b!947430 () Bool)

(assert (=> b!947430 (= e!533249 e!533252)))

(declare-fun res!635837 () Bool)

(assert (=> b!947430 (=> (not res!635837) (not e!533252))))

(declare-fun e!533250 () Bool)

(assert (=> b!947430 (= res!635837 (not e!533250))))

(declare-fun res!635838 () Bool)

(assert (=> b!947430 (=> (not res!635838) (not e!533250))))

(assert (=> b!947430 (= res!635838 (validKeyInArray!0 (select (arr!27589 (_keys!10639 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947431 () Bool)

(declare-fun call!41118 () Bool)

(assert (=> b!947431 (= e!533251 call!41118)))

(declare-fun bm!41115 () Bool)

(assert (=> bm!41115 (= call!41118 (arrayNoDuplicates!0 (_keys!10639 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98702 (Cons!19301 (select (arr!27589 (_keys!10639 thiss!1141)) #b00000000000000000000000000000000) Nil!19302) Nil!19302)))))

(declare-fun b!947432 () Bool)

(declare-fun contains!5199 (List!19305 (_ BitVec 64)) Bool)

(assert (=> b!947432 (= e!533250 (contains!5199 Nil!19302 (select (arr!27589 (_keys!10639 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947433 () Bool)

(assert (=> b!947433 (= e!533251 call!41118)))

(assert (= (and d!114679 (not res!635839)) b!947430))

(assert (= (and b!947430 res!635838) b!947432))

(assert (= (and b!947430 res!635837) b!947429))

(assert (= (and b!947429 c!98702) b!947433))

(assert (= (and b!947429 (not c!98702)) b!947431))

(assert (= (or b!947433 b!947431) bm!41115))

(assert (=> b!947429 m!880373))

(assert (=> b!947429 m!880373))

(assert (=> b!947429 m!880375))

(assert (=> b!947430 m!880373))

(assert (=> b!947430 m!880373))

(assert (=> b!947430 m!880375))

(assert (=> bm!41115 m!880373))

(declare-fun m!880397 () Bool)

(assert (=> bm!41115 m!880397))

(assert (=> b!947432 m!880373))

(assert (=> b!947432 m!880373))

(declare-fun m!880399 () Bool)

(assert (=> b!947432 m!880399))

(assert (=> b!947345 d!114679))

(declare-fun d!114681 () Bool)

(declare-fun res!635846 () Bool)

(declare-fun e!533255 () Bool)

(assert (=> d!114681 (=> (not res!635846) (not e!533255))))

(declare-fun simpleValid!363 (LongMapFixedSize!4866) Bool)

(assert (=> d!114681 (= res!635846 (simpleValid!363 thiss!1141))))

(assert (=> d!114681 (= (valid!1854 thiss!1141) e!533255)))

(declare-fun b!947440 () Bool)

(declare-fun res!635847 () Bool)

(assert (=> b!947440 (=> (not res!635847) (not e!533255))))

(declare-fun arrayCountValidKeys!0 (array!57356 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947440 (= res!635847 (= (arrayCountValidKeys!0 (_keys!10639 thiss!1141) #b00000000000000000000000000000000 (size!28062 (_keys!10639 thiss!1141))) (_size!2488 thiss!1141)))))

(declare-fun b!947441 () Bool)

(declare-fun res!635848 () Bool)

(assert (=> b!947441 (=> (not res!635848) (not e!533255))))

(assert (=> b!947441 (= res!635848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10639 thiss!1141) (mask!27465 thiss!1141)))))

(declare-fun b!947442 () Bool)

(assert (=> b!947442 (= e!533255 (arrayNoDuplicates!0 (_keys!10639 thiss!1141) #b00000000000000000000000000000000 Nil!19302))))

(assert (= (and d!114681 res!635846) b!947440))

(assert (= (and b!947440 res!635847) b!947441))

(assert (= (and b!947441 res!635848) b!947442))

(declare-fun m!880401 () Bool)

(assert (=> d!114681 m!880401))

(declare-fun m!880403 () Bool)

(assert (=> b!947440 m!880403))

(assert (=> b!947441 m!880343))

(assert (=> b!947442 m!880341))

(assert (=> start!80816 d!114681))

(declare-fun d!114683 () Bool)

(assert (=> d!114683 (= (array_inv!21416 (_keys!10639 thiss!1141)) (bvsge (size!28062 (_keys!10639 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947341 d!114683))

(declare-fun d!114685 () Bool)

(assert (=> d!114685 (= (array_inv!21417 (_values!5753 thiss!1141)) (bvsge (size!28061 (_values!5753 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947341 d!114685))

(declare-fun b!947449 () Bool)

(declare-fun e!533261 () Bool)

(assert (=> b!947449 (= e!533261 tp_is_empty!20679)))

(declare-fun condMapEmpty!32899 () Bool)

(declare-fun mapDefault!32899 () ValueCell!9858)

(assert (=> mapNonEmpty!32893 (= condMapEmpty!32899 (= mapRest!32893 ((as const (Array (_ BitVec 32) ValueCell!9858)) mapDefault!32899)))))

(declare-fun e!533260 () Bool)

(declare-fun mapRes!32899 () Bool)

(assert (=> mapNonEmpty!32893 (= tp!63071 (and e!533260 mapRes!32899))))

(declare-fun mapNonEmpty!32899 () Bool)

(declare-fun tp!63081 () Bool)

(assert (=> mapNonEmpty!32899 (= mapRes!32899 (and tp!63081 e!533261))))

(declare-fun mapRest!32899 () (Array (_ BitVec 32) ValueCell!9858))

(declare-fun mapKey!32899 () (_ BitVec 32))

(declare-fun mapValue!32899 () ValueCell!9858)

(assert (=> mapNonEmpty!32899 (= mapRest!32893 (store mapRest!32899 mapKey!32899 mapValue!32899))))

(declare-fun mapIsEmpty!32899 () Bool)

(assert (=> mapIsEmpty!32899 mapRes!32899))

(declare-fun b!947450 () Bool)

(assert (=> b!947450 (= e!533260 tp_is_empty!20679)))

(assert (= (and mapNonEmpty!32893 condMapEmpty!32899) mapIsEmpty!32899))

(assert (= (and mapNonEmpty!32893 (not condMapEmpty!32899)) mapNonEmpty!32899))

(assert (= (and mapNonEmpty!32899 ((_ is ValueCellFull!9858) mapValue!32899)) b!947449))

(assert (= (and mapNonEmpty!32893 ((_ is ValueCellFull!9858) mapDefault!32899)) b!947450))

(declare-fun m!880405 () Bool)

(assert (=> mapNonEmpty!32899 m!880405))

(check-sat b_and!29593 (not b!947416) (not mapNonEmpty!32899) (not b!947442) (not b!947400) tp_is_empty!20679 (not b!947393) (not d!114675) (not b!947441) (not bm!41112) (not b_next!18171) (not b!947429) (not d!114681) (not b!947430) (not b!947440) (not d!114677) (not b!947394) (not b!947432) (not bm!41115))
(check-sat b_and!29593 (not b_next!18171))
