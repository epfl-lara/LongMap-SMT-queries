; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80062 () Bool)

(assert start!80062)

(declare-fun b!940514 () Bool)

(declare-fun b_free!17791 () Bool)

(declare-fun b_next!17791 () Bool)

(assert (=> b!940514 (= b_free!17791 (not b_next!17791))))

(declare-fun tp!61838 () Bool)

(declare-fun b_and!29213 () Bool)

(assert (=> b!940514 (= tp!61838 b_and!29213)))

(declare-fun b!940509 () Bool)

(declare-fun e!528394 () Bool)

(declare-fun tp_is_empty!20299 () Bool)

(assert (=> b!940509 (= e!528394 tp_is_empty!20299)))

(declare-fun b!940510 () Bool)

(declare-fun e!528397 () Bool)

(declare-datatypes ((V!32031 0))(
  ( (V!32032 (val!10200 Int)) )
))
(declare-datatypes ((ValueCell!9668 0))(
  ( (ValueCellFull!9668 (v!12728 V!32031)) (EmptyCell!9668) )
))
(declare-datatypes ((array!56591 0))(
  ( (array!56592 (arr!27229 (Array (_ BitVec 32) ValueCell!9668)) (size!27689 (_ BitVec 32))) )
))
(declare-datatypes ((array!56593 0))(
  ( (array!56594 (arr!27230 (Array (_ BitVec 32) (_ BitVec 64))) (size!27690 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4486 0))(
  ( (LongMapFixedSize!4487 (defaultEntry!5534 Int) (mask!27093 (_ BitVec 32)) (extraKeys!5266 (_ BitVec 32)) (zeroValue!5370 V!32031) (minValue!5370 V!32031) (_size!2298 (_ BitVec 32)) (_keys!10410 array!56593) (_values!5557 array!56591) (_vacant!2298 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4486)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940510 (= e!528397 (not (validMask!0 (mask!27093 thiss!1141))))))

(declare-fun b!940511 () Bool)

(declare-fun res!632295 () Bool)

(assert (=> b!940511 (=> (not res!632295) (not e!528397))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940511 (= res!632295 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940512 () Bool)

(declare-fun e!528399 () Bool)

(assert (=> b!940512 (= e!528399 tp_is_empty!20299)))

(declare-fun mapIsEmpty!32228 () Bool)

(declare-fun mapRes!32228 () Bool)

(assert (=> mapIsEmpty!32228 mapRes!32228))

(declare-fun b!940513 () Bool)

(declare-fun e!528395 () Bool)

(assert (=> b!940513 (= e!528395 (and e!528399 mapRes!32228))))

(declare-fun condMapEmpty!32228 () Bool)

(declare-fun mapDefault!32228 () ValueCell!9668)

(assert (=> b!940513 (= condMapEmpty!32228 (= (arr!27229 (_values!5557 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9668)) mapDefault!32228)))))

(declare-fun mapNonEmpty!32228 () Bool)

(declare-fun tp!61837 () Bool)

(assert (=> mapNonEmpty!32228 (= mapRes!32228 (and tp!61837 e!528394))))

(declare-fun mapKey!32228 () (_ BitVec 32))

(declare-fun mapRest!32228 () (Array (_ BitVec 32) ValueCell!9668))

(declare-fun mapValue!32228 () ValueCell!9668)

(assert (=> mapNonEmpty!32228 (= (arr!27229 (_values!5557 thiss!1141)) (store mapRest!32228 mapKey!32228 mapValue!32228))))

(declare-fun res!632294 () Bool)

(assert (=> start!80062 (=> (not res!632294) (not e!528397))))

(declare-fun valid!1732 (LongMapFixedSize!4486) Bool)

(assert (=> start!80062 (= res!632294 (valid!1732 thiss!1141))))

(assert (=> start!80062 e!528397))

(declare-fun e!528398 () Bool)

(assert (=> start!80062 e!528398))

(assert (=> start!80062 true))

(declare-fun array_inv!21260 (array!56593) Bool)

(declare-fun array_inv!21261 (array!56591) Bool)

(assert (=> b!940514 (= e!528398 (and tp!61838 tp_is_empty!20299 (array_inv!21260 (_keys!10410 thiss!1141)) (array_inv!21261 (_values!5557 thiss!1141)) e!528395))))

(assert (= (and start!80062 res!632294) b!940511))

(assert (= (and b!940511 res!632295) b!940510))

(assert (= (and b!940513 condMapEmpty!32228) mapIsEmpty!32228))

(assert (= (and b!940513 (not condMapEmpty!32228)) mapNonEmpty!32228))

(get-info :version)

(assert (= (and mapNonEmpty!32228 ((_ is ValueCellFull!9668) mapValue!32228)) b!940509))

(assert (= (and b!940513 ((_ is ValueCellFull!9668) mapDefault!32228)) b!940512))

(assert (= b!940514 b!940513))

(assert (= start!80062 b!940514))

(declare-fun m!876717 () Bool)

(assert (=> b!940510 m!876717))

(declare-fun m!876719 () Bool)

(assert (=> mapNonEmpty!32228 m!876719))

(declare-fun m!876721 () Bool)

(assert (=> start!80062 m!876721))

(declare-fun m!876723 () Bool)

(assert (=> b!940514 m!876723))

(declare-fun m!876725 () Bool)

(assert (=> b!940514 m!876725))

(check-sat (not mapNonEmpty!32228) (not b!940510) (not start!80062) (not b!940514) tp_is_empty!20299 (not b_next!17791) b_and!29213)
(check-sat b_and!29213 (not b_next!17791))
(get-model)

(declare-fun d!114275 () Bool)

(declare-fun res!632314 () Bool)

(declare-fun e!528438 () Bool)

(assert (=> d!114275 (=> (not res!632314) (not e!528438))))

(declare-fun simpleValid!336 (LongMapFixedSize!4486) Bool)

(assert (=> d!114275 (= res!632314 (simpleValid!336 thiss!1141))))

(assert (=> d!114275 (= (valid!1732 thiss!1141) e!528438)))

(declare-fun b!940557 () Bool)

(declare-fun res!632315 () Bool)

(assert (=> b!940557 (=> (not res!632315) (not e!528438))))

(declare-fun arrayCountValidKeys!0 (array!56593 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!940557 (= res!632315 (= (arrayCountValidKeys!0 (_keys!10410 thiss!1141) #b00000000000000000000000000000000 (size!27690 (_keys!10410 thiss!1141))) (_size!2298 thiss!1141)))))

(declare-fun b!940558 () Bool)

(declare-fun res!632316 () Bool)

(assert (=> b!940558 (=> (not res!632316) (not e!528438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56593 (_ BitVec 32)) Bool)

(assert (=> b!940558 (= res!632316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10410 thiss!1141) (mask!27093 thiss!1141)))))

(declare-fun b!940559 () Bool)

(declare-datatypes ((List!19165 0))(
  ( (Nil!19162) (Cons!19161 (h!20313 (_ BitVec 64)) (t!27472 List!19165)) )
))
(declare-fun arrayNoDuplicates!0 (array!56593 (_ BitVec 32) List!19165) Bool)

(assert (=> b!940559 (= e!528438 (arrayNoDuplicates!0 (_keys!10410 thiss!1141) #b00000000000000000000000000000000 Nil!19162))))

(assert (= (and d!114275 res!632314) b!940557))

(assert (= (and b!940557 res!632315) b!940558))

(assert (= (and b!940558 res!632316) b!940559))

(declare-fun m!876747 () Bool)

(assert (=> d!114275 m!876747))

(declare-fun m!876749 () Bool)

(assert (=> b!940557 m!876749))

(declare-fun m!876751 () Bool)

(assert (=> b!940558 m!876751))

(declare-fun m!876753 () Bool)

(assert (=> b!940559 m!876753))

(assert (=> start!80062 d!114275))

(declare-fun d!114277 () Bool)

(assert (=> d!114277 (= (validMask!0 (mask!27093 thiss!1141)) (and (or (= (mask!27093 thiss!1141) #b00000000000000000000000000000111) (= (mask!27093 thiss!1141) #b00000000000000000000000000001111) (= (mask!27093 thiss!1141) #b00000000000000000000000000011111) (= (mask!27093 thiss!1141) #b00000000000000000000000000111111) (= (mask!27093 thiss!1141) #b00000000000000000000000001111111) (= (mask!27093 thiss!1141) #b00000000000000000000000011111111) (= (mask!27093 thiss!1141) #b00000000000000000000000111111111) (= (mask!27093 thiss!1141) #b00000000000000000000001111111111) (= (mask!27093 thiss!1141) #b00000000000000000000011111111111) (= (mask!27093 thiss!1141) #b00000000000000000000111111111111) (= (mask!27093 thiss!1141) #b00000000000000000001111111111111) (= (mask!27093 thiss!1141) #b00000000000000000011111111111111) (= (mask!27093 thiss!1141) #b00000000000000000111111111111111) (= (mask!27093 thiss!1141) #b00000000000000001111111111111111) (= (mask!27093 thiss!1141) #b00000000000000011111111111111111) (= (mask!27093 thiss!1141) #b00000000000000111111111111111111) (= (mask!27093 thiss!1141) #b00000000000001111111111111111111) (= (mask!27093 thiss!1141) #b00000000000011111111111111111111) (= (mask!27093 thiss!1141) #b00000000000111111111111111111111) (= (mask!27093 thiss!1141) #b00000000001111111111111111111111) (= (mask!27093 thiss!1141) #b00000000011111111111111111111111) (= (mask!27093 thiss!1141) #b00000000111111111111111111111111) (= (mask!27093 thiss!1141) #b00000001111111111111111111111111) (= (mask!27093 thiss!1141) #b00000011111111111111111111111111) (= (mask!27093 thiss!1141) #b00000111111111111111111111111111) (= (mask!27093 thiss!1141) #b00001111111111111111111111111111) (= (mask!27093 thiss!1141) #b00011111111111111111111111111111) (= (mask!27093 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27093 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!940510 d!114277))

(declare-fun d!114279 () Bool)

(assert (=> d!114279 (= (array_inv!21260 (_keys!10410 thiss!1141)) (bvsge (size!27690 (_keys!10410 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!940514 d!114279))

(declare-fun d!114281 () Bool)

(assert (=> d!114281 (= (array_inv!21261 (_values!5557 thiss!1141)) (bvsge (size!27689 (_values!5557 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!940514 d!114281))

(declare-fun condMapEmpty!32237 () Bool)

(declare-fun mapDefault!32237 () ValueCell!9668)

(assert (=> mapNonEmpty!32228 (= condMapEmpty!32237 (= mapRest!32228 ((as const (Array (_ BitVec 32) ValueCell!9668)) mapDefault!32237)))))

(declare-fun e!528444 () Bool)

(declare-fun mapRes!32237 () Bool)

(assert (=> mapNonEmpty!32228 (= tp!61837 (and e!528444 mapRes!32237))))

(declare-fun mapIsEmpty!32237 () Bool)

(assert (=> mapIsEmpty!32237 mapRes!32237))

(declare-fun b!940567 () Bool)

(assert (=> b!940567 (= e!528444 tp_is_empty!20299)))

(declare-fun b!940566 () Bool)

(declare-fun e!528443 () Bool)

(assert (=> b!940566 (= e!528443 tp_is_empty!20299)))

(declare-fun mapNonEmpty!32237 () Bool)

(declare-fun tp!61853 () Bool)

(assert (=> mapNonEmpty!32237 (= mapRes!32237 (and tp!61853 e!528443))))

(declare-fun mapValue!32237 () ValueCell!9668)

(declare-fun mapKey!32237 () (_ BitVec 32))

(declare-fun mapRest!32237 () (Array (_ BitVec 32) ValueCell!9668))

(assert (=> mapNonEmpty!32237 (= mapRest!32228 (store mapRest!32237 mapKey!32237 mapValue!32237))))

(assert (= (and mapNonEmpty!32228 condMapEmpty!32237) mapIsEmpty!32237))

(assert (= (and mapNonEmpty!32228 (not condMapEmpty!32237)) mapNonEmpty!32237))

(assert (= (and mapNonEmpty!32237 ((_ is ValueCellFull!9668) mapValue!32237)) b!940566))

(assert (= (and mapNonEmpty!32228 ((_ is ValueCellFull!9668) mapDefault!32237)) b!940567))

(declare-fun m!876755 () Bool)

(assert (=> mapNonEmpty!32237 m!876755))

(check-sat (not b!940558) (not mapNonEmpty!32237) (not b!940559) (not b!940557) (not d!114275) tp_is_empty!20299 (not b_next!17791) b_and!29213)
(check-sat b_and!29213 (not b_next!17791))
(get-model)

(declare-fun b!940577 () Bool)

(declare-fun res!632326 () Bool)

(declare-fun e!528447 () Bool)

(assert (=> b!940577 (=> (not res!632326) (not e!528447))))

(declare-fun size!27695 (LongMapFixedSize!4486) (_ BitVec 32))

(assert (=> b!940577 (= res!632326 (bvsge (size!27695 thiss!1141) (_size!2298 thiss!1141)))))

(declare-fun b!940576 () Bool)

(declare-fun res!632325 () Bool)

(assert (=> b!940576 (=> (not res!632325) (not e!528447))))

(assert (=> b!940576 (= res!632325 (and (= (size!27689 (_values!5557 thiss!1141)) (bvadd (mask!27093 thiss!1141) #b00000000000000000000000000000001)) (= (size!27690 (_keys!10410 thiss!1141)) (size!27689 (_values!5557 thiss!1141))) (bvsge (_size!2298 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2298 thiss!1141) (bvadd (mask!27093 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!940578 () Bool)

(declare-fun res!632327 () Bool)

(assert (=> b!940578 (=> (not res!632327) (not e!528447))))

(assert (=> b!940578 (= res!632327 (= (size!27695 thiss!1141) (bvadd (_size!2298 thiss!1141) (bvsdiv (bvadd (extraKeys!5266 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!114283 () Bool)

(declare-fun res!632328 () Bool)

(assert (=> d!114283 (=> (not res!632328) (not e!528447))))

(assert (=> d!114283 (= res!632328 (validMask!0 (mask!27093 thiss!1141)))))

(assert (=> d!114283 (= (simpleValid!336 thiss!1141) e!528447)))

(declare-fun b!940579 () Bool)

(assert (=> b!940579 (= e!528447 (and (bvsge (extraKeys!5266 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5266 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2298 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114283 res!632328) b!940576))

(assert (= (and b!940576 res!632325) b!940577))

(assert (= (and b!940577 res!632326) b!940578))

(assert (= (and b!940578 res!632327) b!940579))

(declare-fun m!876757 () Bool)

(assert (=> b!940577 m!876757))

(assert (=> b!940578 m!876757))

(assert (=> d!114283 m!876717))

(assert (=> d!114275 d!114283))

(declare-fun b!940588 () Bool)

(declare-fun e!528452 () (_ BitVec 32))

(assert (=> b!940588 (= e!528452 #b00000000000000000000000000000000)))

(declare-fun b!940589 () Bool)

(declare-fun e!528453 () (_ BitVec 32))

(assert (=> b!940589 (= e!528452 e!528453)))

(declare-fun c!98289 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!940589 (= c!98289 (validKeyInArray!0 (select (arr!27230 (_keys!10410 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40941 () Bool)

(declare-fun call!40944 () (_ BitVec 32))

(assert (=> bm!40941 (= call!40944 (arrayCountValidKeys!0 (_keys!10410 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27690 (_keys!10410 thiss!1141))))))

(declare-fun d!114285 () Bool)

(declare-fun lt!424928 () (_ BitVec 32))

(assert (=> d!114285 (and (bvsge lt!424928 #b00000000000000000000000000000000) (bvsle lt!424928 (bvsub (size!27690 (_keys!10410 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114285 (= lt!424928 e!528452)))

(declare-fun c!98290 () Bool)

(assert (=> d!114285 (= c!98290 (bvsge #b00000000000000000000000000000000 (size!27690 (_keys!10410 thiss!1141))))))

(assert (=> d!114285 (and (bvsle #b00000000000000000000000000000000 (size!27690 (_keys!10410 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27690 (_keys!10410 thiss!1141)) (size!27690 (_keys!10410 thiss!1141))))))

(assert (=> d!114285 (= (arrayCountValidKeys!0 (_keys!10410 thiss!1141) #b00000000000000000000000000000000 (size!27690 (_keys!10410 thiss!1141))) lt!424928)))

(declare-fun b!940590 () Bool)

(assert (=> b!940590 (= e!528453 call!40944)))

(declare-fun b!940591 () Bool)

(assert (=> b!940591 (= e!528453 (bvadd #b00000000000000000000000000000001 call!40944))))

(assert (= (and d!114285 c!98290) b!940588))

(assert (= (and d!114285 (not c!98290)) b!940589))

(assert (= (and b!940589 c!98289) b!940591))

(assert (= (and b!940589 (not c!98289)) b!940590))

(assert (= (or b!940591 b!940590) bm!40941))

(declare-fun m!876759 () Bool)

(assert (=> b!940589 m!876759))

(assert (=> b!940589 m!876759))

(declare-fun m!876761 () Bool)

(assert (=> b!940589 m!876761))

(declare-fun m!876763 () Bool)

(assert (=> bm!40941 m!876763))

(assert (=> b!940557 d!114285))

(declare-fun d!114287 () Bool)

(declare-fun res!632334 () Bool)

(declare-fun e!528460 () Bool)

(assert (=> d!114287 (=> res!632334 e!528460)))

(assert (=> d!114287 (= res!632334 (bvsge #b00000000000000000000000000000000 (size!27690 (_keys!10410 thiss!1141))))))

(assert (=> d!114287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10410 thiss!1141) (mask!27093 thiss!1141)) e!528460)))

(declare-fun b!940600 () Bool)

(declare-fun e!528461 () Bool)

(assert (=> b!940600 (= e!528460 e!528461)))

(declare-fun c!98293 () Bool)

(assert (=> b!940600 (= c!98293 (validKeyInArray!0 (select (arr!27230 (_keys!10410 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!940601 () Bool)

(declare-fun call!40947 () Bool)

(assert (=> b!940601 (= e!528461 call!40947)))

(declare-fun bm!40944 () Bool)

(assert (=> bm!40944 (= call!40947 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10410 thiss!1141) (mask!27093 thiss!1141)))))

(declare-fun b!940602 () Bool)

(declare-fun e!528462 () Bool)

(assert (=> b!940602 (= e!528462 call!40947)))

(declare-fun b!940603 () Bool)

(assert (=> b!940603 (= e!528461 e!528462)))

(declare-fun lt!424937 () (_ BitVec 64))

(assert (=> b!940603 (= lt!424937 (select (arr!27230 (_keys!10410 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31734 0))(
  ( (Unit!31735) )
))
(declare-fun lt!424936 () Unit!31734)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56593 (_ BitVec 64) (_ BitVec 32)) Unit!31734)

(assert (=> b!940603 (= lt!424936 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10410 thiss!1141) lt!424937 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940603 (arrayContainsKey!0 (_keys!10410 thiss!1141) lt!424937 #b00000000000000000000000000000000)))

(declare-fun lt!424935 () Unit!31734)

(assert (=> b!940603 (= lt!424935 lt!424936)))

(declare-fun res!632333 () Bool)

(declare-datatypes ((SeekEntryResult!8937 0))(
  ( (MissingZero!8937 (index!38119 (_ BitVec 32))) (Found!8937 (index!38120 (_ BitVec 32))) (Intermediate!8937 (undefined!9749 Bool) (index!38121 (_ BitVec 32)) (x!80510 (_ BitVec 32))) (Undefined!8937) (MissingVacant!8937 (index!38122 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56593 (_ BitVec 32)) SeekEntryResult!8937)

(assert (=> b!940603 (= res!632333 (= (seekEntryOrOpen!0 (select (arr!27230 (_keys!10410 thiss!1141)) #b00000000000000000000000000000000) (_keys!10410 thiss!1141) (mask!27093 thiss!1141)) (Found!8937 #b00000000000000000000000000000000)))))

(assert (=> b!940603 (=> (not res!632333) (not e!528462))))

(assert (= (and d!114287 (not res!632334)) b!940600))

(assert (= (and b!940600 c!98293) b!940603))

(assert (= (and b!940600 (not c!98293)) b!940601))

(assert (= (and b!940603 res!632333) b!940602))

(assert (= (or b!940602 b!940601) bm!40944))

(assert (=> b!940600 m!876759))

(assert (=> b!940600 m!876759))

(assert (=> b!940600 m!876761))

(declare-fun m!876765 () Bool)

(assert (=> bm!40944 m!876765))

(assert (=> b!940603 m!876759))

(declare-fun m!876767 () Bool)

(assert (=> b!940603 m!876767))

(declare-fun m!876769 () Bool)

(assert (=> b!940603 m!876769))

(assert (=> b!940603 m!876759))

(declare-fun m!876771 () Bool)

(assert (=> b!940603 m!876771))

(assert (=> b!940558 d!114287))

(declare-fun b!940614 () Bool)

(declare-fun e!528471 () Bool)

(declare-fun call!40950 () Bool)

(assert (=> b!940614 (= e!528471 call!40950)))

(declare-fun b!940616 () Bool)

(declare-fun e!528472 () Bool)

(assert (=> b!940616 (= e!528472 e!528471)))

(declare-fun c!98296 () Bool)

(assert (=> b!940616 (= c!98296 (validKeyInArray!0 (select (arr!27230 (_keys!10410 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40947 () Bool)

(assert (=> bm!40947 (= call!40950 (arrayNoDuplicates!0 (_keys!10410 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98296 (Cons!19161 (select (arr!27230 (_keys!10410 thiss!1141)) #b00000000000000000000000000000000) Nil!19162) Nil!19162)))))

(declare-fun b!940617 () Bool)

(assert (=> b!940617 (= e!528471 call!40950)))

(declare-fun b!940618 () Bool)

(declare-fun e!528473 () Bool)

(declare-fun contains!5132 (List!19165 (_ BitVec 64)) Bool)

(assert (=> b!940618 (= e!528473 (contains!5132 Nil!19162 (select (arr!27230 (_keys!10410 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!940615 () Bool)

(declare-fun e!528474 () Bool)

(assert (=> b!940615 (= e!528474 e!528472)))

(declare-fun res!632342 () Bool)

(assert (=> b!940615 (=> (not res!632342) (not e!528472))))

(assert (=> b!940615 (= res!632342 (not e!528473))))

(declare-fun res!632341 () Bool)

(assert (=> b!940615 (=> (not res!632341) (not e!528473))))

(assert (=> b!940615 (= res!632341 (validKeyInArray!0 (select (arr!27230 (_keys!10410 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114289 () Bool)

(declare-fun res!632343 () Bool)

(assert (=> d!114289 (=> res!632343 e!528474)))

(assert (=> d!114289 (= res!632343 (bvsge #b00000000000000000000000000000000 (size!27690 (_keys!10410 thiss!1141))))))

(assert (=> d!114289 (= (arrayNoDuplicates!0 (_keys!10410 thiss!1141) #b00000000000000000000000000000000 Nil!19162) e!528474)))

(assert (= (and d!114289 (not res!632343)) b!940615))

(assert (= (and b!940615 res!632341) b!940618))

(assert (= (and b!940615 res!632342) b!940616))

(assert (= (and b!940616 c!98296) b!940614))

(assert (= (and b!940616 (not c!98296)) b!940617))

(assert (= (or b!940614 b!940617) bm!40947))

(assert (=> b!940616 m!876759))

(assert (=> b!940616 m!876759))

(assert (=> b!940616 m!876761))

(assert (=> bm!40947 m!876759))

(declare-fun m!876773 () Bool)

(assert (=> bm!40947 m!876773))

(assert (=> b!940618 m!876759))

(assert (=> b!940618 m!876759))

(declare-fun m!876775 () Bool)

(assert (=> b!940618 m!876775))

(assert (=> b!940615 m!876759))

(assert (=> b!940615 m!876759))

(assert (=> b!940615 m!876761))

(assert (=> b!940559 d!114289))

(declare-fun condMapEmpty!32238 () Bool)

(declare-fun mapDefault!32238 () ValueCell!9668)

(assert (=> mapNonEmpty!32237 (= condMapEmpty!32238 (= mapRest!32237 ((as const (Array (_ BitVec 32) ValueCell!9668)) mapDefault!32238)))))

(declare-fun e!528476 () Bool)

(declare-fun mapRes!32238 () Bool)

(assert (=> mapNonEmpty!32237 (= tp!61853 (and e!528476 mapRes!32238))))

(declare-fun mapIsEmpty!32238 () Bool)

(assert (=> mapIsEmpty!32238 mapRes!32238))

(declare-fun b!940620 () Bool)

(assert (=> b!940620 (= e!528476 tp_is_empty!20299)))

(declare-fun b!940619 () Bool)

(declare-fun e!528475 () Bool)

(assert (=> b!940619 (= e!528475 tp_is_empty!20299)))

(declare-fun mapNonEmpty!32238 () Bool)

(declare-fun tp!61854 () Bool)

(assert (=> mapNonEmpty!32238 (= mapRes!32238 (and tp!61854 e!528475))))

(declare-fun mapRest!32238 () (Array (_ BitVec 32) ValueCell!9668))

(declare-fun mapValue!32238 () ValueCell!9668)

(declare-fun mapKey!32238 () (_ BitVec 32))

(assert (=> mapNonEmpty!32238 (= mapRest!32237 (store mapRest!32238 mapKey!32238 mapValue!32238))))

(assert (= (and mapNonEmpty!32237 condMapEmpty!32238) mapIsEmpty!32238))

(assert (= (and mapNonEmpty!32237 (not condMapEmpty!32238)) mapNonEmpty!32238))

(assert (= (and mapNonEmpty!32238 ((_ is ValueCellFull!9668) mapValue!32238)) b!940619))

(assert (= (and mapNonEmpty!32237 ((_ is ValueCellFull!9668) mapDefault!32238)) b!940620))

(declare-fun m!876777 () Bool)

(assert (=> mapNonEmpty!32238 m!876777))

(check-sat (not b!940578) (not bm!40947) (not b!940577) (not bm!40944) (not b!940615) (not b!940600) (not b!940616) (not b!940618) tp_is_empty!20299 (not mapNonEmpty!32238) (not d!114283) (not bm!40941) (not b_next!17791) b_and!29213 (not b!940589) (not b!940603))
(check-sat b_and!29213 (not b_next!17791))
