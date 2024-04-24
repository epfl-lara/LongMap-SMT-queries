; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77322 () Bool)

(assert start!77322)

(declare-fun b!901381 () Bool)

(declare-fun b_free!16051 () Bool)

(declare-fun b_next!16051 () Bool)

(assert (=> b!901381 (= b_free!16051 (not b_next!16051))))

(declare-fun tp!56244 () Bool)

(declare-fun b_and!26383 () Bool)

(assert (=> b!901381 (= tp!56244 b_and!26383)))

(declare-fun b!901376 () Bool)

(declare-fun e!504583 () Bool)

(declare-fun e!504581 () Bool)

(assert (=> b!901376 (= e!504583 e!504581)))

(declare-fun res!608443 () Bool)

(assert (=> b!901376 (=> res!608443 e!504581)))

(declare-datatypes ((array!52847 0))(
  ( (array!52848 (arr!25390 (Array (_ BitVec 32) (_ BitVec 64))) (size!25850 (_ BitVec 32))) )
))
(declare-datatypes ((V!29471 0))(
  ( (V!29472 (val!9240 Int)) )
))
(declare-datatypes ((ValueCell!8708 0))(
  ( (ValueCellFull!8708 (v!11734 V!29471)) (EmptyCell!8708) )
))
(declare-datatypes ((array!52849 0))(
  ( (array!52850 (arr!25391 (Array (_ BitVec 32) ValueCell!8708)) (size!25851 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4432 0))(
  ( (LongMapFixedSize!4433 (defaultEntry!5450 Int) (mask!26280 (_ BitVec 32)) (extraKeys!5176 (_ BitVec 32)) (zeroValue!5280 V!29471) (minValue!5280 V!29471) (_size!2271 (_ BitVec 32)) (_keys!10282 array!52847) (_values!5467 array!52849) (_vacant!2271 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4432)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!901376 (= res!608443 (not (validMask!0 (mask!26280 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8894 0))(
  ( (MissingZero!8894 (index!37947 (_ BitVec 32))) (Found!8894 (index!37948 (_ BitVec 32))) (Intermediate!8894 (undefined!9706 Bool) (index!37949 (_ BitVec 32)) (x!76695 (_ BitVec 32))) (Undefined!8894) (MissingVacant!8894 (index!37950 (_ BitVec 32))) )
))
(declare-fun lt!407244 () SeekEntryResult!8894)

(declare-datatypes ((tuple2!11976 0))(
  ( (tuple2!11977 (_1!5999 (_ BitVec 64)) (_2!5999 V!29471)) )
))
(declare-datatypes ((List!17809 0))(
  ( (Nil!17806) (Cons!17805 (h!18957 tuple2!11976) (t!25154 List!17809)) )
))
(declare-datatypes ((ListLongMap!10675 0))(
  ( (ListLongMap!10676 (toList!5353 List!17809)) )
))
(declare-fun contains!4402 (ListLongMap!10675 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2625 (array!52847 array!52849 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 32) Int) ListLongMap!10675)

(assert (=> b!901376 (contains!4402 (getCurrentListMap!2625 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)) (select (arr!25390 (_keys!10282 thiss!1181)) (index!37948 lt!407244)))))

(declare-datatypes ((Unit!30586 0))(
  ( (Unit!30587) )
))
(declare-fun lt!407243 () Unit!30586)

(declare-fun lemmaValidKeyInArrayIsInListMap!255 (array!52847 array!52849 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 32) Int) Unit!30586)

(assert (=> b!901376 (= lt!407243 (lemmaValidKeyInArrayIsInListMap!255 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) (index!37948 lt!407244) (defaultEntry!5450 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901376 (arrayContainsKey!0 (_keys!10282 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407245 () Unit!30586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52847 (_ BitVec 64) (_ BitVec 32)) Unit!30586)

(assert (=> b!901376 (= lt!407245 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10282 thiss!1181) key!785 (index!37948 lt!407244)))))

(declare-fun mapNonEmpty!29245 () Bool)

(declare-fun mapRes!29245 () Bool)

(declare-fun tp!56245 () Bool)

(declare-fun e!504580 () Bool)

(assert (=> mapNonEmpty!29245 (= mapRes!29245 (and tp!56245 e!504580))))

(declare-fun mapValue!29245 () ValueCell!8708)

(declare-fun mapRest!29245 () (Array (_ BitVec 32) ValueCell!8708))

(declare-fun mapKey!29245 () (_ BitVec 32))

(assert (=> mapNonEmpty!29245 (= (arr!25391 (_values!5467 thiss!1181)) (store mapRest!29245 mapKey!29245 mapValue!29245))))

(declare-fun res!608444 () Bool)

(declare-fun e!504582 () Bool)

(assert (=> start!77322 (=> (not res!608444) (not e!504582))))

(declare-fun valid!1714 (LongMapFixedSize!4432) Bool)

(assert (=> start!77322 (= res!608444 (valid!1714 thiss!1181))))

(assert (=> start!77322 e!504582))

(declare-fun e!504578 () Bool)

(assert (=> start!77322 e!504578))

(assert (=> start!77322 true))

(declare-fun b!901377 () Bool)

(declare-fun e!504585 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901377 (= e!504585 (inRange!0 (index!37948 lt!407244) (mask!26280 thiss!1181)))))

(declare-fun b!901378 () Bool)

(declare-fun res!608440 () Bool)

(assert (=> b!901378 (=> (not res!608440) (not e!504582))))

(assert (=> b!901378 (= res!608440 (not (= key!785 (bvneg key!785))))))

(declare-fun b!901379 () Bool)

(declare-fun e!504579 () Bool)

(declare-fun tp_is_empty!18379 () Bool)

(assert (=> b!901379 (= e!504579 tp_is_empty!18379)))

(declare-fun b!901380 () Bool)

(declare-datatypes ((List!17810 0))(
  ( (Nil!17807) (Cons!17806 (h!18958 (_ BitVec 64)) (t!25155 List!17810)) )
))
(declare-fun arrayNoDuplicates!0 (array!52847 (_ BitVec 32) List!17810) Bool)

(assert (=> b!901380 (= e!504581 (arrayNoDuplicates!0 (_keys!10282 thiss!1181) #b00000000000000000000000000000000 Nil!17807))))

(declare-fun mapIsEmpty!29245 () Bool)

(assert (=> mapIsEmpty!29245 mapRes!29245))

(declare-fun e!504577 () Bool)

(declare-fun array_inv!19974 (array!52847) Bool)

(declare-fun array_inv!19975 (array!52849) Bool)

(assert (=> b!901381 (= e!504578 (and tp!56244 tp_is_empty!18379 (array_inv!19974 (_keys!10282 thiss!1181)) (array_inv!19975 (_values!5467 thiss!1181)) e!504577))))

(declare-fun b!901382 () Bool)

(assert (=> b!901382 (= e!504580 tp_is_empty!18379)))

(declare-fun b!901383 () Bool)

(declare-fun res!608441 () Bool)

(assert (=> b!901383 (=> res!608441 e!504581)))

(assert (=> b!901383 (= res!608441 (or (not (= (size!25851 (_values!5467 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26280 thiss!1181)))) (not (= (size!25850 (_keys!10282 thiss!1181)) (size!25851 (_values!5467 thiss!1181)))) (bvslt (mask!26280 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5176 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5176 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!901384 () Bool)

(assert (=> b!901384 (= e!504582 (not e!504583))))

(declare-fun res!608445 () Bool)

(assert (=> b!901384 (=> res!608445 e!504583)))

(get-info :version)

(assert (=> b!901384 (= res!608445 (not ((_ is Found!8894) lt!407244)))))

(assert (=> b!901384 e!504585))

(declare-fun res!608442 () Bool)

(assert (=> b!901384 (=> res!608442 e!504585)))

(assert (=> b!901384 (= res!608442 (not ((_ is Found!8894) lt!407244)))))

(declare-fun lt!407242 () Unit!30586)

(declare-fun lemmaSeekEntryGivesInRangeIndex!113 (array!52847 array!52849 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 64)) Unit!30586)

(assert (=> b!901384 (= lt!407242 (lemmaSeekEntryGivesInRangeIndex!113 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52847 (_ BitVec 32)) SeekEntryResult!8894)

(assert (=> b!901384 (= lt!407244 (seekEntry!0 key!785 (_keys!10282 thiss!1181) (mask!26280 thiss!1181)))))

(declare-fun b!901385 () Bool)

(declare-fun res!608439 () Bool)

(assert (=> b!901385 (=> res!608439 e!504581)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52847 (_ BitVec 32)) Bool)

(assert (=> b!901385 (= res!608439 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10282 thiss!1181) (mask!26280 thiss!1181))))))

(declare-fun b!901386 () Bool)

(assert (=> b!901386 (= e!504577 (and e!504579 mapRes!29245))))

(declare-fun condMapEmpty!29245 () Bool)

(declare-fun mapDefault!29245 () ValueCell!8708)

(assert (=> b!901386 (= condMapEmpty!29245 (= (arr!25391 (_values!5467 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8708)) mapDefault!29245)))))

(assert (= (and start!77322 res!608444) b!901378))

(assert (= (and b!901378 res!608440) b!901384))

(assert (= (and b!901384 (not res!608442)) b!901377))

(assert (= (and b!901384 (not res!608445)) b!901376))

(assert (= (and b!901376 (not res!608443)) b!901383))

(assert (= (and b!901383 (not res!608441)) b!901385))

(assert (= (and b!901385 (not res!608439)) b!901380))

(assert (= (and b!901386 condMapEmpty!29245) mapIsEmpty!29245))

(assert (= (and b!901386 (not condMapEmpty!29245)) mapNonEmpty!29245))

(assert (= (and mapNonEmpty!29245 ((_ is ValueCellFull!8708) mapValue!29245)) b!901382))

(assert (= (and b!901386 ((_ is ValueCellFull!8708) mapDefault!29245)) b!901379))

(assert (= b!901381 b!901386))

(assert (= start!77322 b!901381))

(declare-fun m!838211 () Bool)

(assert (=> b!901376 m!838211))

(declare-fun m!838213 () Bool)

(assert (=> b!901376 m!838213))

(declare-fun m!838215 () Bool)

(assert (=> b!901376 m!838215))

(declare-fun m!838217 () Bool)

(assert (=> b!901376 m!838217))

(declare-fun m!838219 () Bool)

(assert (=> b!901376 m!838219))

(declare-fun m!838221 () Bool)

(assert (=> b!901376 m!838221))

(assert (=> b!901376 m!838221))

(assert (=> b!901376 m!838217))

(declare-fun m!838223 () Bool)

(assert (=> b!901376 m!838223))

(declare-fun m!838225 () Bool)

(assert (=> b!901377 m!838225))

(declare-fun m!838227 () Bool)

(assert (=> mapNonEmpty!29245 m!838227))

(declare-fun m!838229 () Bool)

(assert (=> b!901385 m!838229))

(declare-fun m!838231 () Bool)

(assert (=> b!901384 m!838231))

(declare-fun m!838233 () Bool)

(assert (=> b!901384 m!838233))

(declare-fun m!838235 () Bool)

(assert (=> b!901381 m!838235))

(declare-fun m!838237 () Bool)

(assert (=> b!901381 m!838237))

(declare-fun m!838239 () Bool)

(assert (=> b!901380 m!838239))

(declare-fun m!838241 () Bool)

(assert (=> start!77322 m!838241))

(check-sat (not b!901381) (not mapNonEmpty!29245) (not b_next!16051) b_and!26383 (not b!901385) (not b!901384) tp_is_empty!18379 (not b!901376) (not b!901380) (not b!901377) (not start!77322))
(check-sat b_and!26383 (not b_next!16051))
(get-model)

(declare-fun b!901463 () Bool)

(declare-fun e!504648 () Bool)

(declare-fun e!504650 () Bool)

(assert (=> b!901463 (= e!504648 e!504650)))

(declare-fun c!95631 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!901463 (= c!95631 (validKeyInArray!0 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901464 () Bool)

(declare-fun e!504649 () Bool)

(declare-fun contains!4404 (List!17810 (_ BitVec 64)) Bool)

(assert (=> b!901464 (= e!504649 (contains!4404 Nil!17807 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901465 () Bool)

(declare-fun call!40081 () Bool)

(assert (=> b!901465 (= e!504650 call!40081)))

(declare-fun bm!40078 () Bool)

(assert (=> bm!40078 (= call!40081 (arrayNoDuplicates!0 (_keys!10282 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95631 (Cons!17806 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000) Nil!17807) Nil!17807)))))

(declare-fun d!112055 () Bool)

(declare-fun res!608496 () Bool)

(declare-fun e!504651 () Bool)

(assert (=> d!112055 (=> res!608496 e!504651)))

(assert (=> d!112055 (= res!608496 (bvsge #b00000000000000000000000000000000 (size!25850 (_keys!10282 thiss!1181))))))

(assert (=> d!112055 (= (arrayNoDuplicates!0 (_keys!10282 thiss!1181) #b00000000000000000000000000000000 Nil!17807) e!504651)))

(declare-fun b!901466 () Bool)

(assert (=> b!901466 (= e!504651 e!504648)))

(declare-fun res!608495 () Bool)

(assert (=> b!901466 (=> (not res!608495) (not e!504648))))

(assert (=> b!901466 (= res!608495 (not e!504649))))

(declare-fun res!608494 () Bool)

(assert (=> b!901466 (=> (not res!608494) (not e!504649))))

(assert (=> b!901466 (= res!608494 (validKeyInArray!0 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901467 () Bool)

(assert (=> b!901467 (= e!504650 call!40081)))

(assert (= (and d!112055 (not res!608496)) b!901466))

(assert (= (and b!901466 res!608494) b!901464))

(assert (= (and b!901466 res!608495) b!901463))

(assert (= (and b!901463 c!95631) b!901467))

(assert (= (and b!901463 (not c!95631)) b!901465))

(assert (= (or b!901467 b!901465) bm!40078))

(declare-fun m!838307 () Bool)

(assert (=> b!901463 m!838307))

(assert (=> b!901463 m!838307))

(declare-fun m!838309 () Bool)

(assert (=> b!901463 m!838309))

(assert (=> b!901464 m!838307))

(assert (=> b!901464 m!838307))

(declare-fun m!838311 () Bool)

(assert (=> b!901464 m!838311))

(assert (=> bm!40078 m!838307))

(declare-fun m!838313 () Bool)

(assert (=> bm!40078 m!838313))

(assert (=> b!901466 m!838307))

(assert (=> b!901466 m!838307))

(assert (=> b!901466 m!838309))

(assert (=> b!901380 d!112055))

(declare-fun d!112057 () Bool)

(declare-fun e!504657 () Bool)

(assert (=> d!112057 e!504657))

(declare-fun res!608499 () Bool)

(assert (=> d!112057 (=> res!608499 e!504657)))

(declare-fun lt!407281 () Bool)

(assert (=> d!112057 (= res!608499 (not lt!407281))))

(declare-fun lt!407279 () Bool)

(assert (=> d!112057 (= lt!407281 lt!407279)))

(declare-fun lt!407278 () Unit!30586)

(declare-fun e!504656 () Unit!30586)

(assert (=> d!112057 (= lt!407278 e!504656)))

(declare-fun c!95634 () Bool)

(assert (=> d!112057 (= c!95634 lt!407279)))

(declare-fun containsKey!433 (List!17809 (_ BitVec 64)) Bool)

(assert (=> d!112057 (= lt!407279 (containsKey!433 (toList!5353 (getCurrentListMap!2625 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181))) (select (arr!25390 (_keys!10282 thiss!1181)) (index!37948 lt!407244))))))

(assert (=> d!112057 (= (contains!4402 (getCurrentListMap!2625 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)) (select (arr!25390 (_keys!10282 thiss!1181)) (index!37948 lt!407244))) lt!407281)))

(declare-fun b!901474 () Bool)

(declare-fun lt!407280 () Unit!30586)

(assert (=> b!901474 (= e!504656 lt!407280)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!327 (List!17809 (_ BitVec 64)) Unit!30586)

(assert (=> b!901474 (= lt!407280 (lemmaContainsKeyImpliesGetValueByKeyDefined!327 (toList!5353 (getCurrentListMap!2625 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181))) (select (arr!25390 (_keys!10282 thiss!1181)) (index!37948 lt!407244))))))

(declare-datatypes ((Option!466 0))(
  ( (Some!465 (v!11737 V!29471)) (None!464) )
))
(declare-fun isDefined!335 (Option!466) Bool)

(declare-fun getValueByKey!460 (List!17809 (_ BitVec 64)) Option!466)

(assert (=> b!901474 (isDefined!335 (getValueByKey!460 (toList!5353 (getCurrentListMap!2625 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181))) (select (arr!25390 (_keys!10282 thiss!1181)) (index!37948 lt!407244))))))

(declare-fun b!901475 () Bool)

(declare-fun Unit!30590 () Unit!30586)

(assert (=> b!901475 (= e!504656 Unit!30590)))

(declare-fun b!901476 () Bool)

(assert (=> b!901476 (= e!504657 (isDefined!335 (getValueByKey!460 (toList!5353 (getCurrentListMap!2625 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181))) (select (arr!25390 (_keys!10282 thiss!1181)) (index!37948 lt!407244)))))))

(assert (= (and d!112057 c!95634) b!901474))

(assert (= (and d!112057 (not c!95634)) b!901475))

(assert (= (and d!112057 (not res!608499)) b!901476))

(assert (=> d!112057 m!838217))

(declare-fun m!838315 () Bool)

(assert (=> d!112057 m!838315))

(assert (=> b!901474 m!838217))

(declare-fun m!838317 () Bool)

(assert (=> b!901474 m!838317))

(assert (=> b!901474 m!838217))

(declare-fun m!838319 () Bool)

(assert (=> b!901474 m!838319))

(assert (=> b!901474 m!838319))

(declare-fun m!838321 () Bool)

(assert (=> b!901474 m!838321))

(assert (=> b!901476 m!838217))

(assert (=> b!901476 m!838319))

(assert (=> b!901476 m!838319))

(assert (=> b!901476 m!838321))

(assert (=> b!901376 d!112057))

(declare-fun d!112059 () Bool)

(assert (=> d!112059 (= (validMask!0 (mask!26280 thiss!1181)) (and (or (= (mask!26280 thiss!1181) #b00000000000000000000000000000111) (= (mask!26280 thiss!1181) #b00000000000000000000000000001111) (= (mask!26280 thiss!1181) #b00000000000000000000000000011111) (= (mask!26280 thiss!1181) #b00000000000000000000000000111111) (= (mask!26280 thiss!1181) #b00000000000000000000000001111111) (= (mask!26280 thiss!1181) #b00000000000000000000000011111111) (= (mask!26280 thiss!1181) #b00000000000000000000000111111111) (= (mask!26280 thiss!1181) #b00000000000000000000001111111111) (= (mask!26280 thiss!1181) #b00000000000000000000011111111111) (= (mask!26280 thiss!1181) #b00000000000000000000111111111111) (= (mask!26280 thiss!1181) #b00000000000000000001111111111111) (= (mask!26280 thiss!1181) #b00000000000000000011111111111111) (= (mask!26280 thiss!1181) #b00000000000000000111111111111111) (= (mask!26280 thiss!1181) #b00000000000000001111111111111111) (= (mask!26280 thiss!1181) #b00000000000000011111111111111111) (= (mask!26280 thiss!1181) #b00000000000000111111111111111111) (= (mask!26280 thiss!1181) #b00000000000001111111111111111111) (= (mask!26280 thiss!1181) #b00000000000011111111111111111111) (= (mask!26280 thiss!1181) #b00000000000111111111111111111111) (= (mask!26280 thiss!1181) #b00000000001111111111111111111111) (= (mask!26280 thiss!1181) #b00000000011111111111111111111111) (= (mask!26280 thiss!1181) #b00000000111111111111111111111111) (= (mask!26280 thiss!1181) #b00000001111111111111111111111111) (= (mask!26280 thiss!1181) #b00000011111111111111111111111111) (= (mask!26280 thiss!1181) #b00000111111111111111111111111111) (= (mask!26280 thiss!1181) #b00001111111111111111111111111111) (= (mask!26280 thiss!1181) #b00011111111111111111111111111111) (= (mask!26280 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26280 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!901376 d!112059))

(declare-fun d!112061 () Bool)

(assert (=> d!112061 (arrayContainsKey!0 (_keys!10282 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407284 () Unit!30586)

(declare-fun choose!13 (array!52847 (_ BitVec 64) (_ BitVec 32)) Unit!30586)

(assert (=> d!112061 (= lt!407284 (choose!13 (_keys!10282 thiss!1181) key!785 (index!37948 lt!407244)))))

(assert (=> d!112061 (bvsge (index!37948 lt!407244) #b00000000000000000000000000000000)))

(assert (=> d!112061 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10282 thiss!1181) key!785 (index!37948 lt!407244)) lt!407284)))

(declare-fun bs!25303 () Bool)

(assert (= bs!25303 d!112061))

(assert (=> bs!25303 m!838215))

(declare-fun m!838323 () Bool)

(assert (=> bs!25303 m!838323))

(assert (=> b!901376 d!112061))

(declare-fun d!112063 () Bool)

(declare-fun e!504660 () Bool)

(assert (=> d!112063 e!504660))

(declare-fun res!608502 () Bool)

(assert (=> d!112063 (=> (not res!608502) (not e!504660))))

(assert (=> d!112063 (= res!608502 (and (bvsge (index!37948 lt!407244) #b00000000000000000000000000000000) (bvslt (index!37948 lt!407244) (size!25850 (_keys!10282 thiss!1181)))))))

(declare-fun lt!407287 () Unit!30586)

(declare-fun choose!1520 (array!52847 array!52849 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 32) Int) Unit!30586)

(assert (=> d!112063 (= lt!407287 (choose!1520 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) (index!37948 lt!407244) (defaultEntry!5450 thiss!1181)))))

(assert (=> d!112063 (validMask!0 (mask!26280 thiss!1181))))

(assert (=> d!112063 (= (lemmaValidKeyInArrayIsInListMap!255 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) (index!37948 lt!407244) (defaultEntry!5450 thiss!1181)) lt!407287)))

(declare-fun b!901479 () Bool)

(assert (=> b!901479 (= e!504660 (contains!4402 (getCurrentListMap!2625 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)) (select (arr!25390 (_keys!10282 thiss!1181)) (index!37948 lt!407244))))))

(assert (= (and d!112063 res!608502) b!901479))

(declare-fun m!838325 () Bool)

(assert (=> d!112063 m!838325))

(assert (=> d!112063 m!838219))

(assert (=> b!901479 m!838221))

(assert (=> b!901479 m!838217))

(assert (=> b!901479 m!838221))

(assert (=> b!901479 m!838217))

(assert (=> b!901479 m!838223))

(assert (=> b!901376 d!112063))

(declare-fun d!112065 () Bool)

(declare-fun res!608507 () Bool)

(declare-fun e!504665 () Bool)

(assert (=> d!112065 (=> res!608507 e!504665)))

(assert (=> d!112065 (= res!608507 (= (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!112065 (= (arrayContainsKey!0 (_keys!10282 thiss!1181) key!785 #b00000000000000000000000000000000) e!504665)))

(declare-fun b!901484 () Bool)

(declare-fun e!504666 () Bool)

(assert (=> b!901484 (= e!504665 e!504666)))

(declare-fun res!608508 () Bool)

(assert (=> b!901484 (=> (not res!608508) (not e!504666))))

(assert (=> b!901484 (= res!608508 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25850 (_keys!10282 thiss!1181))))))

(declare-fun b!901485 () Bool)

(assert (=> b!901485 (= e!504666 (arrayContainsKey!0 (_keys!10282 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112065 (not res!608507)) b!901484))

(assert (= (and b!901484 res!608508) b!901485))

(assert (=> d!112065 m!838307))

(declare-fun m!838327 () Bool)

(assert (=> b!901485 m!838327))

(assert (=> b!901376 d!112065))

(declare-fun call!40102 () ListLongMap!10675)

(declare-fun c!95650 () Bool)

(declare-fun call!40099 () ListLongMap!10675)

(declare-fun call!40096 () ListLongMap!10675)

(declare-fun bm!40093 () Bool)

(declare-fun call!40101 () ListLongMap!10675)

(declare-fun c!95648 () Bool)

(declare-fun +!2607 (ListLongMap!10675 tuple2!11976) ListLongMap!10675)

(assert (=> bm!40093 (= call!40102 (+!2607 (ite c!95650 call!40096 (ite c!95648 call!40101 call!40099)) (ite (or c!95650 c!95648) (tuple2!11977 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5280 thiss!1181)) (tuple2!11977 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5280 thiss!1181)))))))

(declare-fun b!901528 () Bool)

(declare-fun e!504697 () Bool)

(assert (=> b!901528 (= e!504697 (validKeyInArray!0 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40094 () Bool)

(assert (=> bm!40094 (= call!40101 call!40096)))

(declare-fun b!901529 () Bool)

(declare-fun e!504704 () Unit!30586)

(declare-fun lt!407350 () Unit!30586)

(assert (=> b!901529 (= e!504704 lt!407350)))

(declare-fun lt!407337 () ListLongMap!10675)

(declare-fun getCurrentListMapNoExtraKeys!3328 (array!52847 array!52849 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 32) Int) ListLongMap!10675)

(assert (=> b!901529 (= lt!407337 (getCurrentListMapNoExtraKeys!3328 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)))))

(declare-fun lt!407332 () (_ BitVec 64))

(assert (=> b!901529 (= lt!407332 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407353 () (_ BitVec 64))

(assert (=> b!901529 (= lt!407353 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407342 () Unit!30586)

(declare-fun addStillContains!338 (ListLongMap!10675 (_ BitVec 64) V!29471 (_ BitVec 64)) Unit!30586)

(assert (=> b!901529 (= lt!407342 (addStillContains!338 lt!407337 lt!407332 (zeroValue!5280 thiss!1181) lt!407353))))

(assert (=> b!901529 (contains!4402 (+!2607 lt!407337 (tuple2!11977 lt!407332 (zeroValue!5280 thiss!1181))) lt!407353)))

(declare-fun lt!407335 () Unit!30586)

(assert (=> b!901529 (= lt!407335 lt!407342)))

(declare-fun lt!407349 () ListLongMap!10675)

(assert (=> b!901529 (= lt!407349 (getCurrentListMapNoExtraKeys!3328 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)))))

(declare-fun lt!407346 () (_ BitVec 64))

(assert (=> b!901529 (= lt!407346 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407352 () (_ BitVec 64))

(assert (=> b!901529 (= lt!407352 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407333 () Unit!30586)

(declare-fun addApplyDifferent!338 (ListLongMap!10675 (_ BitVec 64) V!29471 (_ BitVec 64)) Unit!30586)

(assert (=> b!901529 (= lt!407333 (addApplyDifferent!338 lt!407349 lt!407346 (minValue!5280 thiss!1181) lt!407352))))

(declare-fun apply!412 (ListLongMap!10675 (_ BitVec 64)) V!29471)

(assert (=> b!901529 (= (apply!412 (+!2607 lt!407349 (tuple2!11977 lt!407346 (minValue!5280 thiss!1181))) lt!407352) (apply!412 lt!407349 lt!407352))))

(declare-fun lt!407347 () Unit!30586)

(assert (=> b!901529 (= lt!407347 lt!407333)))

(declare-fun lt!407334 () ListLongMap!10675)

(assert (=> b!901529 (= lt!407334 (getCurrentListMapNoExtraKeys!3328 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)))))

(declare-fun lt!407336 () (_ BitVec 64))

(assert (=> b!901529 (= lt!407336 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407339 () (_ BitVec 64))

(assert (=> b!901529 (= lt!407339 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407344 () Unit!30586)

(assert (=> b!901529 (= lt!407344 (addApplyDifferent!338 lt!407334 lt!407336 (zeroValue!5280 thiss!1181) lt!407339))))

(assert (=> b!901529 (= (apply!412 (+!2607 lt!407334 (tuple2!11977 lt!407336 (zeroValue!5280 thiss!1181))) lt!407339) (apply!412 lt!407334 lt!407339))))

(declare-fun lt!407348 () Unit!30586)

(assert (=> b!901529 (= lt!407348 lt!407344)))

(declare-fun lt!407338 () ListLongMap!10675)

(assert (=> b!901529 (= lt!407338 (getCurrentListMapNoExtraKeys!3328 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)))))

(declare-fun lt!407341 () (_ BitVec 64))

(assert (=> b!901529 (= lt!407341 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407351 () (_ BitVec 64))

(assert (=> b!901529 (= lt!407351 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901529 (= lt!407350 (addApplyDifferent!338 lt!407338 lt!407341 (minValue!5280 thiss!1181) lt!407351))))

(assert (=> b!901529 (= (apply!412 (+!2607 lt!407338 (tuple2!11977 lt!407341 (minValue!5280 thiss!1181))) lt!407351) (apply!412 lt!407338 lt!407351))))

(declare-fun b!901530 () Bool)

(declare-fun res!608527 () Bool)

(declare-fun e!504698 () Bool)

(assert (=> b!901530 (=> (not res!608527) (not e!504698))))

(declare-fun e!504695 () Bool)

(assert (=> b!901530 (= res!608527 e!504695)))

(declare-fun res!608528 () Bool)

(assert (=> b!901530 (=> res!608528 e!504695)))

(declare-fun e!504693 () Bool)

(assert (=> b!901530 (= res!608528 (not e!504693))))

(declare-fun res!608534 () Bool)

(assert (=> b!901530 (=> (not res!608534) (not e!504693))))

(assert (=> b!901530 (= res!608534 (bvslt #b00000000000000000000000000000000 (size!25850 (_keys!10282 thiss!1181))))))

(declare-fun b!901531 () Bool)

(declare-fun e!504701 () ListLongMap!10675)

(assert (=> b!901531 (= e!504701 call!40099)))

(declare-fun b!901532 () Bool)

(declare-fun e!504694 () ListLongMap!10675)

(declare-fun call!40100 () ListLongMap!10675)

(assert (=> b!901532 (= e!504694 call!40100)))

(declare-fun bm!40095 () Bool)

(declare-fun call!40097 () Bool)

(declare-fun lt!407343 () ListLongMap!10675)

(assert (=> bm!40095 (= call!40097 (contains!4402 lt!407343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901533 () Bool)

(declare-fun e!504702 () Bool)

(declare-fun call!40098 () Bool)

(assert (=> b!901533 (= e!504702 (not call!40098))))

(declare-fun b!901534 () Bool)

(declare-fun e!504699 () ListLongMap!10675)

(assert (=> b!901534 (= e!504699 e!504694)))

(assert (=> b!901534 (= c!95648 (and (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901535 () Bool)

(declare-fun e!504703 () Bool)

(assert (=> b!901535 (= e!504703 (= (apply!412 lt!407343 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5280 thiss!1181)))))

(declare-fun b!901536 () Bool)

(declare-fun c!95652 () Bool)

(assert (=> b!901536 (= c!95652 (and (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901536 (= e!504694 e!504701)))

(declare-fun bm!40096 () Bool)

(assert (=> bm!40096 (= call!40099 call!40101)))

(declare-fun bm!40097 () Bool)

(assert (=> bm!40097 (= call!40100 call!40102)))

(declare-fun b!901537 () Bool)

(declare-fun e!504705 () Bool)

(declare-fun get!13373 (ValueCell!8708 V!29471) V!29471)

(declare-fun dynLambda!1327 (Int (_ BitVec 64)) V!29471)

(assert (=> b!901537 (= e!504705 (= (apply!412 lt!407343 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)) (get!13373 (select (arr!25391 (_values!5467 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1327 (defaultEntry!5450 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25851 (_values!5467 thiss!1181))))))

(assert (=> b!901537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25850 (_keys!10282 thiss!1181))))))

(declare-fun b!901538 () Bool)

(declare-fun e!504696 () Bool)

(assert (=> b!901538 (= e!504696 e!504703)))

(declare-fun res!608533 () Bool)

(assert (=> b!901538 (= res!608533 call!40097)))

(assert (=> b!901538 (=> (not res!608533) (not e!504703))))

(declare-fun b!901539 () Bool)

(declare-fun e!504700 () Bool)

(assert (=> b!901539 (= e!504700 (= (apply!412 lt!407343 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5280 thiss!1181)))))

(declare-fun b!901540 () Bool)

(assert (=> b!901540 (= e!504695 e!504705)))

(declare-fun res!608535 () Bool)

(assert (=> b!901540 (=> (not res!608535) (not e!504705))))

(assert (=> b!901540 (= res!608535 (contains!4402 lt!407343 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25850 (_keys!10282 thiss!1181))))))

(declare-fun b!901541 () Bool)

(assert (=> b!901541 (= e!504702 e!504700)))

(declare-fun res!608531 () Bool)

(assert (=> b!901541 (= res!608531 call!40098)))

(assert (=> b!901541 (=> (not res!608531) (not e!504700))))

(declare-fun b!901542 () Bool)

(declare-fun Unit!30591 () Unit!30586)

(assert (=> b!901542 (= e!504704 Unit!30591)))

(declare-fun b!901543 () Bool)

(declare-fun res!608529 () Bool)

(assert (=> b!901543 (=> (not res!608529) (not e!504698))))

(assert (=> b!901543 (= res!608529 e!504696)))

(declare-fun c!95647 () Bool)

(assert (=> b!901543 (= c!95647 (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!901544 () Bool)

(assert (=> b!901544 (= e!504701 call!40100)))

(declare-fun bm!40098 () Bool)

(assert (=> bm!40098 (= call!40096 (getCurrentListMapNoExtraKeys!3328 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)))))

(declare-fun b!901545 () Bool)

(assert (=> b!901545 (= e!504696 (not call!40097))))

(declare-fun d!112067 () Bool)

(assert (=> d!112067 e!504698))

(declare-fun res!608530 () Bool)

(assert (=> d!112067 (=> (not res!608530) (not e!504698))))

(assert (=> d!112067 (= res!608530 (or (bvsge #b00000000000000000000000000000000 (size!25850 (_keys!10282 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25850 (_keys!10282 thiss!1181))))))))

(declare-fun lt!407340 () ListLongMap!10675)

(assert (=> d!112067 (= lt!407343 lt!407340)))

(declare-fun lt!407345 () Unit!30586)

(assert (=> d!112067 (= lt!407345 e!504704)))

(declare-fun c!95649 () Bool)

(assert (=> d!112067 (= c!95649 e!504697)))

(declare-fun res!608532 () Bool)

(assert (=> d!112067 (=> (not res!608532) (not e!504697))))

(assert (=> d!112067 (= res!608532 (bvslt #b00000000000000000000000000000000 (size!25850 (_keys!10282 thiss!1181))))))

(assert (=> d!112067 (= lt!407340 e!504699)))

(assert (=> d!112067 (= c!95650 (and (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112067 (validMask!0 (mask!26280 thiss!1181))))

(assert (=> d!112067 (= (getCurrentListMap!2625 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)) lt!407343)))

(declare-fun b!901546 () Bool)

(assert (=> b!901546 (= e!504699 (+!2607 call!40102 (tuple2!11977 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5280 thiss!1181))))))

(declare-fun b!901547 () Bool)

(assert (=> b!901547 (= e!504698 e!504702)))

(declare-fun c!95651 () Bool)

(assert (=> b!901547 (= c!95651 (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901548 () Bool)

(assert (=> b!901548 (= e!504693 (validKeyInArray!0 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40099 () Bool)

(assert (=> bm!40099 (= call!40098 (contains!4402 lt!407343 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!112067 c!95650) b!901546))

(assert (= (and d!112067 (not c!95650)) b!901534))

(assert (= (and b!901534 c!95648) b!901532))

(assert (= (and b!901534 (not c!95648)) b!901536))

(assert (= (and b!901536 c!95652) b!901544))

(assert (= (and b!901536 (not c!95652)) b!901531))

(assert (= (or b!901544 b!901531) bm!40096))

(assert (= (or b!901532 bm!40096) bm!40094))

(assert (= (or b!901532 b!901544) bm!40097))

(assert (= (or b!901546 bm!40094) bm!40098))

(assert (= (or b!901546 bm!40097) bm!40093))

(assert (= (and d!112067 res!608532) b!901528))

(assert (= (and d!112067 c!95649) b!901529))

(assert (= (and d!112067 (not c!95649)) b!901542))

(assert (= (and d!112067 res!608530) b!901530))

(assert (= (and b!901530 res!608534) b!901548))

(assert (= (and b!901530 (not res!608528)) b!901540))

(assert (= (and b!901540 res!608535) b!901537))

(assert (= (and b!901530 res!608527) b!901543))

(assert (= (and b!901543 c!95647) b!901538))

(assert (= (and b!901543 (not c!95647)) b!901545))

(assert (= (and b!901538 res!608533) b!901535))

(assert (= (or b!901538 b!901545) bm!40095))

(assert (= (and b!901543 res!608529) b!901547))

(assert (= (and b!901547 c!95651) b!901541))

(assert (= (and b!901547 (not c!95651)) b!901533))

(assert (= (and b!901541 res!608531) b!901539))

(assert (= (or b!901541 b!901533) bm!40099))

(declare-fun b_lambda!13033 () Bool)

(assert (=> (not b_lambda!13033) (not b!901537)))

(declare-fun t!25159 () Bool)

(declare-fun tb!5197 () Bool)

(assert (=> (and b!901381 (= (defaultEntry!5450 thiss!1181) (defaultEntry!5450 thiss!1181)) t!25159) tb!5197))

(declare-fun result!10179 () Bool)

(assert (=> tb!5197 (= result!10179 tp_is_empty!18379)))

(assert (=> b!901537 t!25159))

(declare-fun b_and!26389 () Bool)

(assert (= b_and!26383 (and (=> t!25159 result!10179) b_and!26389)))

(assert (=> d!112067 m!838219))

(assert (=> b!901537 m!838307))

(declare-fun m!838329 () Bool)

(assert (=> b!901537 m!838329))

(declare-fun m!838331 () Bool)

(assert (=> b!901537 m!838331))

(assert (=> b!901537 m!838307))

(declare-fun m!838333 () Bool)

(assert (=> b!901537 m!838333))

(assert (=> b!901537 m!838329))

(assert (=> b!901537 m!838331))

(declare-fun m!838335 () Bool)

(assert (=> b!901537 m!838335))

(declare-fun m!838337 () Bool)

(assert (=> bm!40095 m!838337))

(declare-fun m!838339 () Bool)

(assert (=> bm!40099 m!838339))

(assert (=> b!901540 m!838307))

(assert (=> b!901540 m!838307))

(declare-fun m!838341 () Bool)

(assert (=> b!901540 m!838341))

(declare-fun m!838343 () Bool)

(assert (=> b!901529 m!838343))

(declare-fun m!838345 () Bool)

(assert (=> b!901529 m!838345))

(declare-fun m!838347 () Bool)

(assert (=> b!901529 m!838347))

(declare-fun m!838349 () Bool)

(assert (=> b!901529 m!838349))

(declare-fun m!838351 () Bool)

(assert (=> b!901529 m!838351))

(declare-fun m!838353 () Bool)

(assert (=> b!901529 m!838353))

(declare-fun m!838355 () Bool)

(assert (=> b!901529 m!838355))

(declare-fun m!838357 () Bool)

(assert (=> b!901529 m!838357))

(declare-fun m!838359 () Bool)

(assert (=> b!901529 m!838359))

(declare-fun m!838361 () Bool)

(assert (=> b!901529 m!838361))

(declare-fun m!838363 () Bool)

(assert (=> b!901529 m!838363))

(declare-fun m!838365 () Bool)

(assert (=> b!901529 m!838365))

(declare-fun m!838367 () Bool)

(assert (=> b!901529 m!838367))

(assert (=> b!901529 m!838361))

(assert (=> b!901529 m!838359))

(declare-fun m!838369 () Bool)

(assert (=> b!901529 m!838369))

(declare-fun m!838371 () Bool)

(assert (=> b!901529 m!838371))

(assert (=> b!901529 m!838347))

(assert (=> b!901529 m!838353))

(assert (=> b!901529 m!838307))

(declare-fun m!838373 () Bool)

(assert (=> b!901529 m!838373))

(assert (=> b!901548 m!838307))

(assert (=> b!901548 m!838307))

(assert (=> b!901548 m!838309))

(assert (=> b!901528 m!838307))

(assert (=> b!901528 m!838307))

(assert (=> b!901528 m!838309))

(declare-fun m!838375 () Bool)

(assert (=> b!901535 m!838375))

(declare-fun m!838377 () Bool)

(assert (=> b!901539 m!838377))

(assert (=> bm!40098 m!838373))

(declare-fun m!838379 () Bool)

(assert (=> bm!40093 m!838379))

(declare-fun m!838381 () Bool)

(assert (=> b!901546 m!838381))

(assert (=> b!901376 d!112067))

(declare-fun d!112069 () Bool)

(declare-fun res!608542 () Bool)

(declare-fun e!504708 () Bool)

(assert (=> d!112069 (=> (not res!608542) (not e!504708))))

(declare-fun simpleValid!330 (LongMapFixedSize!4432) Bool)

(assert (=> d!112069 (= res!608542 (simpleValid!330 thiss!1181))))

(assert (=> d!112069 (= (valid!1714 thiss!1181) e!504708)))

(declare-fun b!901557 () Bool)

(declare-fun res!608543 () Bool)

(assert (=> b!901557 (=> (not res!608543) (not e!504708))))

(declare-fun arrayCountValidKeys!0 (array!52847 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901557 (= res!608543 (= (arrayCountValidKeys!0 (_keys!10282 thiss!1181) #b00000000000000000000000000000000 (size!25850 (_keys!10282 thiss!1181))) (_size!2271 thiss!1181)))))

(declare-fun b!901558 () Bool)

(declare-fun res!608544 () Bool)

(assert (=> b!901558 (=> (not res!608544) (not e!504708))))

(assert (=> b!901558 (= res!608544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10282 thiss!1181) (mask!26280 thiss!1181)))))

(declare-fun b!901559 () Bool)

(assert (=> b!901559 (= e!504708 (arrayNoDuplicates!0 (_keys!10282 thiss!1181) #b00000000000000000000000000000000 Nil!17807))))

(assert (= (and d!112069 res!608542) b!901557))

(assert (= (and b!901557 res!608543) b!901558))

(assert (= (and b!901558 res!608544) b!901559))

(declare-fun m!838383 () Bool)

(assert (=> d!112069 m!838383))

(declare-fun m!838385 () Bool)

(assert (=> b!901557 m!838385))

(assert (=> b!901558 m!838229))

(assert (=> b!901559 m!838239))

(assert (=> start!77322 d!112069))

(declare-fun d!112071 () Bool)

(declare-fun e!504711 () Bool)

(assert (=> d!112071 e!504711))

(declare-fun res!608547 () Bool)

(assert (=> d!112071 (=> res!608547 e!504711)))

(declare-fun lt!407359 () SeekEntryResult!8894)

(assert (=> d!112071 (= res!608547 (not ((_ is Found!8894) lt!407359)))))

(assert (=> d!112071 (= lt!407359 (seekEntry!0 key!785 (_keys!10282 thiss!1181) (mask!26280 thiss!1181)))))

(declare-fun lt!407358 () Unit!30586)

(declare-fun choose!1521 (array!52847 array!52849 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 64)) Unit!30586)

(assert (=> d!112071 (= lt!407358 (choose!1521 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) key!785))))

(assert (=> d!112071 (validMask!0 (mask!26280 thiss!1181))))

(assert (=> d!112071 (= (lemmaSeekEntryGivesInRangeIndex!113 (_keys!10282 thiss!1181) (_values!5467 thiss!1181) (mask!26280 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) key!785) lt!407358)))

(declare-fun b!901562 () Bool)

(assert (=> b!901562 (= e!504711 (inRange!0 (index!37948 lt!407359) (mask!26280 thiss!1181)))))

(assert (= (and d!112071 (not res!608547)) b!901562))

(assert (=> d!112071 m!838233))

(declare-fun m!838387 () Bool)

(assert (=> d!112071 m!838387))

(assert (=> d!112071 m!838219))

(declare-fun m!838389 () Bool)

(assert (=> b!901562 m!838389))

(assert (=> b!901384 d!112071))

(declare-fun b!901575 () Bool)

(declare-fun e!504720 () SeekEntryResult!8894)

(declare-fun lt!407370 () SeekEntryResult!8894)

(assert (=> b!901575 (= e!504720 (Found!8894 (index!37949 lt!407370)))))

(declare-fun b!901576 () Bool)

(declare-fun e!504719 () SeekEntryResult!8894)

(assert (=> b!901576 (= e!504719 (MissingZero!8894 (index!37949 lt!407370)))))

(declare-fun b!901577 () Bool)

(declare-fun lt!407368 () SeekEntryResult!8894)

(assert (=> b!901577 (= e!504719 (ite ((_ is MissingVacant!8894) lt!407368) (MissingZero!8894 (index!37950 lt!407368)) lt!407368))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52847 (_ BitVec 32)) SeekEntryResult!8894)

(assert (=> b!901577 (= lt!407368 (seekKeyOrZeroReturnVacant!0 (x!76695 lt!407370) (index!37949 lt!407370) (index!37949 lt!407370) key!785 (_keys!10282 thiss!1181) (mask!26280 thiss!1181)))))

(declare-fun b!901578 () Bool)

(declare-fun e!504718 () SeekEntryResult!8894)

(assert (=> b!901578 (= e!504718 e!504720)))

(declare-fun lt!407371 () (_ BitVec 64))

(assert (=> b!901578 (= lt!407371 (select (arr!25390 (_keys!10282 thiss!1181)) (index!37949 lt!407370)))))

(declare-fun c!95661 () Bool)

(assert (=> b!901578 (= c!95661 (= lt!407371 key!785))))

(declare-fun d!112073 () Bool)

(declare-fun lt!407369 () SeekEntryResult!8894)

(assert (=> d!112073 (and (or ((_ is MissingVacant!8894) lt!407369) (not ((_ is Found!8894) lt!407369)) (and (bvsge (index!37948 lt!407369) #b00000000000000000000000000000000) (bvslt (index!37948 lt!407369) (size!25850 (_keys!10282 thiss!1181))))) (not ((_ is MissingVacant!8894) lt!407369)) (or (not ((_ is Found!8894) lt!407369)) (= (select (arr!25390 (_keys!10282 thiss!1181)) (index!37948 lt!407369)) key!785)))))

(assert (=> d!112073 (= lt!407369 e!504718)))

(declare-fun c!95659 () Bool)

(assert (=> d!112073 (= c!95659 (and ((_ is Intermediate!8894) lt!407370) (undefined!9706 lt!407370)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52847 (_ BitVec 32)) SeekEntryResult!8894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112073 (= lt!407370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26280 thiss!1181)) key!785 (_keys!10282 thiss!1181) (mask!26280 thiss!1181)))))

(assert (=> d!112073 (validMask!0 (mask!26280 thiss!1181))))

(assert (=> d!112073 (= (seekEntry!0 key!785 (_keys!10282 thiss!1181) (mask!26280 thiss!1181)) lt!407369)))

(declare-fun b!901579 () Bool)

(assert (=> b!901579 (= e!504718 Undefined!8894)))

(declare-fun b!901580 () Bool)

(declare-fun c!95660 () Bool)

(assert (=> b!901580 (= c!95660 (= lt!407371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!901580 (= e!504720 e!504719)))

(assert (= (and d!112073 c!95659) b!901579))

(assert (= (and d!112073 (not c!95659)) b!901578))

(assert (= (and b!901578 c!95661) b!901575))

(assert (= (and b!901578 (not c!95661)) b!901580))

(assert (= (and b!901580 c!95660) b!901576))

(assert (= (and b!901580 (not c!95660)) b!901577))

(declare-fun m!838391 () Bool)

(assert (=> b!901577 m!838391))

(declare-fun m!838393 () Bool)

(assert (=> b!901578 m!838393))

(declare-fun m!838395 () Bool)

(assert (=> d!112073 m!838395))

(declare-fun m!838397 () Bool)

(assert (=> d!112073 m!838397))

(assert (=> d!112073 m!838397))

(declare-fun m!838399 () Bool)

(assert (=> d!112073 m!838399))

(assert (=> d!112073 m!838219))

(assert (=> b!901384 d!112073))

(declare-fun b!901589 () Bool)

(declare-fun e!504727 () Bool)

(declare-fun e!504729 () Bool)

(assert (=> b!901589 (= e!504727 e!504729)))

(declare-fun c!95664 () Bool)

(assert (=> b!901589 (= c!95664 (validKeyInArray!0 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40102 () Bool)

(declare-fun call!40105 () Bool)

(assert (=> bm!40102 (= call!40105 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10282 thiss!1181) (mask!26280 thiss!1181)))))

(declare-fun b!901590 () Bool)

(declare-fun e!504728 () Bool)

(assert (=> b!901590 (= e!504729 e!504728)))

(declare-fun lt!407379 () (_ BitVec 64))

(assert (=> b!901590 (= lt!407379 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407378 () Unit!30586)

(assert (=> b!901590 (= lt!407378 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10282 thiss!1181) lt!407379 #b00000000000000000000000000000000))))

(assert (=> b!901590 (arrayContainsKey!0 (_keys!10282 thiss!1181) lt!407379 #b00000000000000000000000000000000)))

(declare-fun lt!407380 () Unit!30586)

(assert (=> b!901590 (= lt!407380 lt!407378)))

(declare-fun res!608552 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52847 (_ BitVec 32)) SeekEntryResult!8894)

(assert (=> b!901590 (= res!608552 (= (seekEntryOrOpen!0 (select (arr!25390 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000) (_keys!10282 thiss!1181) (mask!26280 thiss!1181)) (Found!8894 #b00000000000000000000000000000000)))))

(assert (=> b!901590 (=> (not res!608552) (not e!504728))))

(declare-fun b!901591 () Bool)

(assert (=> b!901591 (= e!504728 call!40105)))

(declare-fun d!112075 () Bool)

(declare-fun res!608553 () Bool)

(assert (=> d!112075 (=> res!608553 e!504727)))

(assert (=> d!112075 (= res!608553 (bvsge #b00000000000000000000000000000000 (size!25850 (_keys!10282 thiss!1181))))))

(assert (=> d!112075 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10282 thiss!1181) (mask!26280 thiss!1181)) e!504727)))

(declare-fun b!901592 () Bool)

(assert (=> b!901592 (= e!504729 call!40105)))

(assert (= (and d!112075 (not res!608553)) b!901589))

(assert (= (and b!901589 c!95664) b!901590))

(assert (= (and b!901589 (not c!95664)) b!901592))

(assert (= (and b!901590 res!608552) b!901591))

(assert (= (or b!901591 b!901592) bm!40102))

(assert (=> b!901589 m!838307))

(assert (=> b!901589 m!838307))

(assert (=> b!901589 m!838309))

(declare-fun m!838401 () Bool)

(assert (=> bm!40102 m!838401))

(assert (=> b!901590 m!838307))

(declare-fun m!838403 () Bool)

(assert (=> b!901590 m!838403))

(declare-fun m!838405 () Bool)

(assert (=> b!901590 m!838405))

(assert (=> b!901590 m!838307))

(declare-fun m!838407 () Bool)

(assert (=> b!901590 m!838407))

(assert (=> b!901385 d!112075))

(declare-fun d!112077 () Bool)

(assert (=> d!112077 (= (array_inv!19974 (_keys!10282 thiss!1181)) (bvsge (size!25850 (_keys!10282 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901381 d!112077))

(declare-fun d!112079 () Bool)

(assert (=> d!112079 (= (array_inv!19975 (_values!5467 thiss!1181)) (bvsge (size!25851 (_values!5467 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901381 d!112079))

(declare-fun d!112081 () Bool)

(assert (=> d!112081 (= (inRange!0 (index!37948 lt!407244) (mask!26280 thiss!1181)) (and (bvsge (index!37948 lt!407244) #b00000000000000000000000000000000) (bvslt (index!37948 lt!407244) (bvadd (mask!26280 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!901377 d!112081))

(declare-fun b!901599 () Bool)

(declare-fun e!504734 () Bool)

(assert (=> b!901599 (= e!504734 tp_is_empty!18379)))

(declare-fun mapIsEmpty!29254 () Bool)

(declare-fun mapRes!29254 () Bool)

(assert (=> mapIsEmpty!29254 mapRes!29254))

(declare-fun b!901600 () Bool)

(declare-fun e!504735 () Bool)

(assert (=> b!901600 (= e!504735 tp_is_empty!18379)))

(declare-fun condMapEmpty!29254 () Bool)

(declare-fun mapDefault!29254 () ValueCell!8708)

(assert (=> mapNonEmpty!29245 (= condMapEmpty!29254 (= mapRest!29245 ((as const (Array (_ BitVec 32) ValueCell!8708)) mapDefault!29254)))))

(assert (=> mapNonEmpty!29245 (= tp!56245 (and e!504735 mapRes!29254))))

(declare-fun mapNonEmpty!29254 () Bool)

(declare-fun tp!56260 () Bool)

(assert (=> mapNonEmpty!29254 (= mapRes!29254 (and tp!56260 e!504734))))

(declare-fun mapRest!29254 () (Array (_ BitVec 32) ValueCell!8708))

(declare-fun mapValue!29254 () ValueCell!8708)

(declare-fun mapKey!29254 () (_ BitVec 32))

(assert (=> mapNonEmpty!29254 (= mapRest!29245 (store mapRest!29254 mapKey!29254 mapValue!29254))))

(assert (= (and mapNonEmpty!29245 condMapEmpty!29254) mapIsEmpty!29254))

(assert (= (and mapNonEmpty!29245 (not condMapEmpty!29254)) mapNonEmpty!29254))

(assert (= (and mapNonEmpty!29254 ((_ is ValueCellFull!8708) mapValue!29254)) b!901599))

(assert (= (and mapNonEmpty!29245 ((_ is ValueCellFull!8708) mapDefault!29254)) b!901600))

(declare-fun m!838409 () Bool)

(assert (=> mapNonEmpty!29254 m!838409))

(declare-fun b_lambda!13035 () Bool)

(assert (= b_lambda!13033 (or (and b!901381 b_free!16051) b_lambda!13035)))

(check-sat (not b!901529) (not b!901485) (not b!901548) (not b_next!16051) (not bm!40098) (not bm!40099) (not b!901589) (not d!112069) (not mapNonEmpty!29254) (not b!901464) (not b!901557) (not bm!40093) (not b!901559) (not b!901463) (not b!901558) (not d!112067) (not d!112063) (not bm!40102) (not b!901466) (not b!901528) (not d!112071) (not d!112061) (not b_lambda!13035) (not b!901540) (not b!901537) tp_is_empty!18379 (not bm!40095) (not b!901539) (not b!901590) b_and!26389 (not bm!40078) (not b!901476) (not b!901474) (not b!901546) (not b!901562) (not b!901535) (not d!112057) (not b!901577) (not d!112073) (not b!901479))
(check-sat b_and!26389 (not b_next!16051))
