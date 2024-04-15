; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21920 () Bool)

(assert start!21920)

(declare-fun b!222531 () Bool)

(declare-fun b_free!5983 () Bool)

(declare-fun b_next!5983 () Bool)

(assert (=> b!222531 (= b_free!5983 (not b_next!5983))))

(declare-fun tp!21090 () Bool)

(declare-fun b_and!12855 () Bool)

(assert (=> b!222531 (= tp!21090 b_and!12855)))

(declare-fun b!222517 () Bool)

(declare-fun e!144606 () Bool)

(declare-fun tp_is_empty!5845 () Bool)

(assert (=> b!222517 (= e!144606 tp_is_empty!5845)))

(declare-fun mapIsEmpty!9937 () Bool)

(declare-fun mapRes!9937 () Bool)

(assert (=> mapIsEmpty!9937 mapRes!9937))

(declare-fun b!222518 () Bool)

(declare-fun e!144605 () Bool)

(declare-fun e!144611 () Bool)

(assert (=> b!222518 (= e!144605 e!144611)))

(declare-fun res!109243 () Bool)

(assert (=> b!222518 (=> (not res!109243) (not e!144611))))

(declare-datatypes ((SeekEntryResult!835 0))(
  ( (MissingZero!835 (index!5510 (_ BitVec 32))) (Found!835 (index!5511 (_ BitVec 32))) (Intermediate!835 (undefined!1647 Bool) (index!5512 (_ BitVec 32)) (x!23062 (_ BitVec 32))) (Undefined!835) (MissingVacant!835 (index!5513 (_ BitVec 32))) )
))
(declare-fun lt!112530 () SeekEntryResult!835)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222518 (= res!109243 (or (= lt!112530 (MissingZero!835 index!297)) (= lt!112530 (MissingVacant!835 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7441 0))(
  ( (V!7442 (val!2967 Int)) )
))
(declare-datatypes ((ValueCell!2579 0))(
  ( (ValueCellFull!2579 (v!4981 V!7441)) (EmptyCell!2579) )
))
(declare-datatypes ((array!10925 0))(
  ( (array!10926 (arr!5181 (Array (_ BitVec 32) ValueCell!2579)) (size!5515 (_ BitVec 32))) )
))
(declare-datatypes ((array!10927 0))(
  ( (array!10928 (arr!5182 (Array (_ BitVec 32) (_ BitVec 64))) (size!5516 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3058 0))(
  ( (LongMapFixedSize!3059 (defaultEntry!4188 Int) (mask!10009 (_ BitVec 32)) (extraKeys!3925 (_ BitVec 32)) (zeroValue!4029 V!7441) (minValue!4029 V!7441) (_size!1578 (_ BitVec 32)) (_keys!6241 array!10927) (_values!4171 array!10925) (_vacant!1578 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3058)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10927 (_ BitVec 32)) SeekEntryResult!835)

(assert (=> b!222518 (= lt!112530 (seekEntryOrOpen!0 key!932 (_keys!6241 thiss!1504) (mask!10009 thiss!1504)))))

(declare-fun b!222519 () Bool)

(declare-fun e!144607 () Bool)

(declare-datatypes ((List!3290 0))(
  ( (Nil!3287) (Cons!3286 (h!3934 (_ BitVec 64)) (t!8240 List!3290)) )
))
(declare-fun contains!1506 (List!3290 (_ BitVec 64)) Bool)

(assert (=> b!222519 (= e!144607 (not (contains!1506 Nil!3287 key!932)))))

(declare-fun b!222520 () Bool)

(declare-datatypes ((Unit!6622 0))(
  ( (Unit!6623) )
))
(declare-fun e!144595 () Unit!6622)

(declare-fun Unit!6624 () Unit!6622)

(assert (=> b!222520 (= e!144595 Unit!6624)))

(declare-fun lt!112528 () Unit!6622)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!219 (array!10927 array!10925 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 64) Int) Unit!6622)

(assert (=> b!222520 (= lt!112528 (lemmaInListMapThenSeekEntryOrOpenFindsIt!219 (_keys!6241 thiss!1504) (_values!4171 thiss!1504) (mask!10009 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) key!932 (defaultEntry!4188 thiss!1504)))))

(assert (=> b!222520 false))

(declare-fun b!222521 () Bool)

(declare-fun res!109248 () Bool)

(assert (=> b!222521 (=> (not res!109248) (not e!144605))))

(assert (=> b!222521 (= res!109248 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222523 () Bool)

(declare-fun e!144609 () Bool)

(assert (=> b!222523 (= e!144609 tp_is_empty!5845)))

(declare-fun b!222524 () Bool)

(declare-fun res!109236 () Bool)

(declare-fun e!144598 () Bool)

(assert (=> b!222524 (=> (not res!109236) (not e!144598))))

(declare-fun call!20760 () Bool)

(assert (=> b!222524 (= res!109236 call!20760)))

(declare-fun e!144596 () Bool)

(assert (=> b!222524 (= e!144596 e!144598)))

(declare-fun b!222525 () Bool)

(declare-fun e!144599 () Bool)

(assert (=> b!222525 (= e!144599 (and e!144609 mapRes!9937))))

(declare-fun condMapEmpty!9937 () Bool)

(declare-fun mapDefault!9937 () ValueCell!2579)

(assert (=> b!222525 (= condMapEmpty!9937 (= (arr!5181 (_values!4171 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2579)) mapDefault!9937)))))

(declare-fun b!222526 () Bool)

(declare-fun e!144612 () Bool)

(declare-fun e!144602 () Bool)

(assert (=> b!222526 (= e!144612 e!144602)))

(declare-fun res!109245 () Bool)

(assert (=> b!222526 (=> (not res!109245) (not e!144602))))

(assert (=> b!222526 (= res!109245 (and (bvslt (size!5516 (_keys!6241 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5516 (_keys!6241 thiss!1504)))))))

(declare-fun lt!112531 () Unit!6622)

(declare-fun e!144601 () Unit!6622)

(assert (=> b!222526 (= lt!112531 e!144601)))

(declare-fun c!36968 () Bool)

(declare-fun arrayContainsKey!0 (array!10927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222526 (= c!36968 (arrayContainsKey!0 (_keys!6241 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun c!36969 () Bool)

(declare-fun bm!20756 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20756 (= call!20760 (inRange!0 (ite c!36969 (index!5510 lt!112530) (index!5513 lt!112530)) (mask!10009 thiss!1504)))))

(declare-fun b!222527 () Bool)

(declare-fun Unit!6625 () Unit!6622)

(assert (=> b!222527 (= e!144601 Unit!6625)))

(declare-fun b!222528 () Bool)

(declare-fun Unit!6626 () Unit!6622)

(assert (=> b!222528 (= e!144601 Unit!6626)))

(declare-fun lt!112534 () Unit!6622)

(declare-fun lemmaArrayContainsKeyThenInListMap!62 (array!10927 array!10925 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 64) (_ BitVec 32) Int) Unit!6622)

(assert (=> b!222528 (= lt!112534 (lemmaArrayContainsKeyThenInListMap!62 (_keys!6241 thiss!1504) (_values!4171 thiss!1504) (mask!10009 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4188 thiss!1504)))))

(assert (=> b!222528 false))

(declare-fun b!222529 () Bool)

(declare-fun c!36967 () Bool)

(get-info :version)

(assert (=> b!222529 (= c!36967 ((_ is MissingVacant!835) lt!112530))))

(declare-fun e!144600 () Bool)

(assert (=> b!222529 (= e!144596 e!144600)))

(declare-fun b!222530 () Bool)

(declare-fun res!109249 () Bool)

(assert (=> b!222530 (=> (not res!109249) (not e!144602))))

(assert (=> b!222530 (= res!109249 (not (contains!1506 Nil!3287 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!20757 () Bool)

(declare-fun call!20759 () Bool)

(assert (=> bm!20757 (= call!20759 (arrayContainsKey!0 (_keys!6241 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!144608 () Bool)

(declare-fun array_inv!3415 (array!10927) Bool)

(declare-fun array_inv!3416 (array!10925) Bool)

(assert (=> b!222531 (= e!144608 (and tp!21090 tp_is_empty!5845 (array_inv!3415 (_keys!6241 thiss!1504)) (array_inv!3416 (_values!4171 thiss!1504)) e!144599))))

(declare-fun mapNonEmpty!9937 () Bool)

(declare-fun tp!21091 () Bool)

(assert (=> mapNonEmpty!9937 (= mapRes!9937 (and tp!21091 e!144606))))

(declare-fun mapValue!9937 () ValueCell!2579)

(declare-fun mapKey!9937 () (_ BitVec 32))

(declare-fun mapRest!9937 () (Array (_ BitVec 32) ValueCell!2579))

(assert (=> mapNonEmpty!9937 (= (arr!5181 (_values!4171 thiss!1504)) (store mapRest!9937 mapKey!9937 mapValue!9937))))

(declare-fun res!109241 () Bool)

(assert (=> start!21920 (=> (not res!109241) (not e!144605))))

(declare-fun valid!1247 (LongMapFixedSize!3058) Bool)

(assert (=> start!21920 (= res!109241 (valid!1247 thiss!1504))))

(assert (=> start!21920 e!144605))

(assert (=> start!21920 e!144608))

(assert (=> start!21920 true))

(declare-fun b!222522 () Bool)

(declare-fun e!144597 () Bool)

(assert (=> b!222522 (= e!144597 (contains!1506 Nil!3287 key!932))))

(declare-fun b!222532 () Bool)

(assert (=> b!222532 (= e!144600 ((_ is Undefined!835) lt!112530))))

(declare-fun b!222533 () Bool)

(declare-fun res!109242 () Bool)

(assert (=> b!222533 (=> (not res!109242) (not e!144602))))

(declare-fun noDuplicate!72 (List!3290) Bool)

(assert (=> b!222533 (= res!109242 (noDuplicate!72 Nil!3287))))

(declare-fun b!222534 () Bool)

(declare-fun e!144603 () Bool)

(assert (=> b!222534 (= e!144603 (not call!20759))))

(declare-fun b!222535 () Bool)

(assert (=> b!222535 (= e!144602 false)))

(declare-fun lt!112533 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10927 (_ BitVec 32) List!3290) Bool)

(assert (=> b!222535 (= lt!112533 (arrayNoDuplicates!0 (_keys!6241 thiss!1504) #b00000000000000000000000000000000 Nil!3287))))

(declare-fun b!222536 () Bool)

(assert (=> b!222536 (= e!144598 (not call!20759))))

(declare-fun b!222537 () Bool)

(declare-fun res!109246 () Bool)

(assert (=> b!222537 (=> (not res!109246) (not e!144602))))

(assert (=> b!222537 (= res!109246 (not (contains!1506 Nil!3287 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222538 () Bool)

(declare-fun res!109244 () Bool)

(assert (=> b!222538 (= res!109244 (= (select (arr!5182 (_keys!6241 thiss!1504)) (index!5513 lt!112530)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222538 (=> (not res!109244) (not e!144603))))

(declare-fun b!222539 () Bool)

(declare-fun e!144610 () Bool)

(assert (=> b!222539 (= e!144610 e!144607)))

(declare-fun res!109240 () Bool)

(assert (=> b!222539 (=> (not res!109240) (not e!144607))))

(assert (=> b!222539 (= res!109240 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222540 () Bool)

(declare-fun res!109238 () Bool)

(assert (=> b!222540 (=> (not res!109238) (not e!144602))))

(assert (=> b!222540 (= res!109238 e!144610)))

(declare-fun res!109239 () Bool)

(assert (=> b!222540 (=> res!109239 e!144610)))

(assert (=> b!222540 (= res!109239 e!144597)))

(declare-fun res!109237 () Bool)

(assert (=> b!222540 (=> (not res!109237) (not e!144597))))

(assert (=> b!222540 (= res!109237 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222541 () Bool)

(assert (=> b!222541 (= e!144611 e!144612)))

(declare-fun res!109247 () Bool)

(assert (=> b!222541 (=> (not res!109247) (not e!144612))))

(assert (=> b!222541 (= res!109247 (inRange!0 index!297 (mask!10009 thiss!1504)))))

(declare-fun lt!112532 () Unit!6622)

(assert (=> b!222541 (= lt!112532 e!144595)))

(declare-fun c!36970 () Bool)

(declare-datatypes ((tuple2!4368 0))(
  ( (tuple2!4369 (_1!2195 (_ BitVec 64)) (_2!2195 V!7441)) )
))
(declare-datatypes ((List!3291 0))(
  ( (Nil!3288) (Cons!3287 (h!3935 tuple2!4368) (t!8241 List!3291)) )
))
(declare-datatypes ((ListLongMap!3271 0))(
  ( (ListLongMap!3272 (toList!1651 List!3291)) )
))
(declare-fun contains!1507 (ListLongMap!3271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1160 (array!10927 array!10925 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 32) Int) ListLongMap!3271)

(assert (=> b!222541 (= c!36970 (contains!1507 (getCurrentListMap!1160 (_keys!6241 thiss!1504) (_values!4171 thiss!1504) (mask!10009 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4188 thiss!1504)) key!932))))

(declare-fun b!222542 () Bool)

(declare-fun res!109250 () Bool)

(assert (=> b!222542 (=> (not res!109250) (not e!144598))))

(assert (=> b!222542 (= res!109250 (= (select (arr!5182 (_keys!6241 thiss!1504)) (index!5510 lt!112530)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222543 () Bool)

(assert (=> b!222543 (= e!144600 e!144603)))

(declare-fun res!109235 () Bool)

(assert (=> b!222543 (= res!109235 call!20760)))

(assert (=> b!222543 (=> (not res!109235) (not e!144603))))

(declare-fun b!222544 () Bool)

(declare-fun lt!112529 () Unit!6622)

(assert (=> b!222544 (= e!144595 lt!112529)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!220 (array!10927 array!10925 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 64) Int) Unit!6622)

(assert (=> b!222544 (= lt!112529 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!220 (_keys!6241 thiss!1504) (_values!4171 thiss!1504) (mask!10009 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) key!932 (defaultEntry!4188 thiss!1504)))))

(assert (=> b!222544 (= c!36969 ((_ is MissingZero!835) lt!112530))))

(assert (=> b!222544 e!144596))

(assert (= (and start!21920 res!109241) b!222521))

(assert (= (and b!222521 res!109248) b!222518))

(assert (= (and b!222518 res!109243) b!222541))

(assert (= (and b!222541 c!36970) b!222520))

(assert (= (and b!222541 (not c!36970)) b!222544))

(assert (= (and b!222544 c!36969) b!222524))

(assert (= (and b!222544 (not c!36969)) b!222529))

(assert (= (and b!222524 res!109236) b!222542))

(assert (= (and b!222542 res!109250) b!222536))

(assert (= (and b!222529 c!36967) b!222543))

(assert (= (and b!222529 (not c!36967)) b!222532))

(assert (= (and b!222543 res!109235) b!222538))

(assert (= (and b!222538 res!109244) b!222534))

(assert (= (or b!222524 b!222543) bm!20756))

(assert (= (or b!222536 b!222534) bm!20757))

(assert (= (and b!222541 res!109247) b!222526))

(assert (= (and b!222526 c!36968) b!222528))

(assert (= (and b!222526 (not c!36968)) b!222527))

(assert (= (and b!222526 res!109245) b!222533))

(assert (= (and b!222533 res!109242) b!222537))

(assert (= (and b!222537 res!109246) b!222530))

(assert (= (and b!222530 res!109249) b!222540))

(assert (= (and b!222540 res!109237) b!222522))

(assert (= (and b!222540 (not res!109239)) b!222539))

(assert (= (and b!222539 res!109240) b!222519))

(assert (= (and b!222540 res!109238) b!222535))

(assert (= (and b!222525 condMapEmpty!9937) mapIsEmpty!9937))

(assert (= (and b!222525 (not condMapEmpty!9937)) mapNonEmpty!9937))

(assert (= (and mapNonEmpty!9937 ((_ is ValueCellFull!2579) mapValue!9937)) b!222517))

(assert (= (and b!222525 ((_ is ValueCellFull!2579) mapDefault!9937)) b!222523))

(assert (= b!222531 b!222525))

(assert (= start!21920 b!222531))

(declare-fun m!246049 () Bool)

(assert (=> b!222526 m!246049))

(declare-fun m!246051 () Bool)

(assert (=> b!222538 m!246051))

(declare-fun m!246053 () Bool)

(assert (=> b!222530 m!246053))

(declare-fun m!246055 () Bool)

(assert (=> b!222541 m!246055))

(declare-fun m!246057 () Bool)

(assert (=> b!222541 m!246057))

(assert (=> b!222541 m!246057))

(declare-fun m!246059 () Bool)

(assert (=> b!222541 m!246059))

(declare-fun m!246061 () Bool)

(assert (=> b!222519 m!246061))

(declare-fun m!246063 () Bool)

(assert (=> bm!20756 m!246063))

(declare-fun m!246065 () Bool)

(assert (=> b!222528 m!246065))

(declare-fun m!246067 () Bool)

(assert (=> b!222518 m!246067))

(declare-fun m!246069 () Bool)

(assert (=> b!222533 m!246069))

(assert (=> bm!20757 m!246049))

(declare-fun m!246071 () Bool)

(assert (=> b!222531 m!246071))

(declare-fun m!246073 () Bool)

(assert (=> b!222531 m!246073))

(declare-fun m!246075 () Bool)

(assert (=> b!222520 m!246075))

(declare-fun m!246077 () Bool)

(assert (=> b!222535 m!246077))

(declare-fun m!246079 () Bool)

(assert (=> b!222542 m!246079))

(declare-fun m!246081 () Bool)

(assert (=> mapNonEmpty!9937 m!246081))

(assert (=> b!222522 m!246061))

(declare-fun m!246083 () Bool)

(assert (=> start!21920 m!246083))

(declare-fun m!246085 () Bool)

(assert (=> b!222544 m!246085))

(declare-fun m!246087 () Bool)

(assert (=> b!222537 m!246087))

(check-sat (not b!222531) (not bm!20757) (not b!222528) (not b!222522) (not bm!20756) (not b!222544) (not b!222537) (not b!222533) (not b!222526) tp_is_empty!5845 (not start!21920) (not b!222520) (not b!222530) b_and!12855 (not b!222541) (not b!222535) (not mapNonEmpty!9937) (not b!222519) (not b!222518) (not b_next!5983))
(check-sat b_and!12855 (not b_next!5983))
