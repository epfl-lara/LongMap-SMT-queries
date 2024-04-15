; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18200 () Bool)

(assert start!18200)

(declare-fun b!180845 () Bool)

(declare-fun b_free!4471 () Bool)

(declare-fun b_next!4471 () Bool)

(assert (=> b!180845 (= b_free!4471 (not b_next!4471))))

(declare-fun tp!16156 () Bool)

(declare-fun b_and!10987 () Bool)

(assert (=> b!180845 (= tp!16156 b_and!10987)))

(declare-fun mapNonEmpty!7271 () Bool)

(declare-fun mapRes!7271 () Bool)

(declare-fun tp!16157 () Bool)

(declare-fun e!119121 () Bool)

(assert (=> mapNonEmpty!7271 (= mapRes!7271 (and tp!16157 e!119121))))

(declare-datatypes ((V!5305 0))(
  ( (V!5306 (val!2166 Int)) )
))
(declare-datatypes ((ValueCell!1778 0))(
  ( (ValueCellFull!1778 (v!4055 V!5305)) (EmptyCell!1778) )
))
(declare-fun mapRest!7271 () (Array (_ BitVec 32) ValueCell!1778))

(declare-datatypes ((array!7643 0))(
  ( (array!7644 (arr!3616 (Array (_ BitVec 32) (_ BitVec 64))) (size!3926 (_ BitVec 32))) )
))
(declare-datatypes ((array!7645 0))(
  ( (array!7646 (arr!3617 (Array (_ BitVec 32) ValueCell!1778)) (size!3927 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2464 0))(
  ( (LongMapFixedSize!2465 (defaultEntry!3711 Int) (mask!8723 (_ BitVec 32)) (extraKeys!3448 (_ BitVec 32)) (zeroValue!3552 V!5305) (minValue!3552 V!5305) (_size!1281 (_ BitVec 32)) (_keys!5608 array!7643) (_values!3694 array!7645) (_vacant!1281 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2464)

(declare-fun mapValue!7271 () ValueCell!1778)

(declare-fun mapKey!7271 () (_ BitVec 32))

(assert (=> mapNonEmpty!7271 (= (arr!3617 (_values!3694 thiss!1248)) (store mapRest!7271 mapKey!7271 mapValue!7271))))

(declare-fun e!119120 () Bool)

(declare-fun tp_is_empty!4243 () Bool)

(declare-fun e!119116 () Bool)

(declare-fun array_inv!2339 (array!7643) Bool)

(declare-fun array_inv!2340 (array!7645) Bool)

(assert (=> b!180845 (= e!119120 (and tp!16156 tp_is_empty!4243 (array_inv!2339 (_keys!5608 thiss!1248)) (array_inv!2340 (_values!3694 thiss!1248)) e!119116))))

(declare-fun mapIsEmpty!7271 () Bool)

(assert (=> mapIsEmpty!7271 mapRes!7271))

(declare-fun b!180846 () Bool)

(declare-fun res!85608 () Bool)

(declare-fun e!119118 () Bool)

(assert (=> b!180846 (=> (not res!85608) (not e!119118))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3354 0))(
  ( (tuple2!3355 (_1!1688 (_ BitVec 64)) (_2!1688 V!5305)) )
))
(declare-datatypes ((List!2300 0))(
  ( (Nil!2297) (Cons!2296 (h!2922 tuple2!3354) (t!7143 List!2300)) )
))
(declare-datatypes ((ListLongMap!2263 0))(
  ( (ListLongMap!2264 (toList!1147 List!2300)) )
))
(declare-fun contains!1231 (ListLongMap!2263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!780 (array!7643 array!7645 (_ BitVec 32) (_ BitVec 32) V!5305 V!5305 (_ BitVec 32) Int) ListLongMap!2263)

(assert (=> b!180846 (= res!85608 (contains!1231 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)) key!828))))

(declare-fun b!180847 () Bool)

(assert (=> b!180847 (= e!119121 tp_is_empty!4243)))

(declare-fun b!180848 () Bool)

(declare-fun e!119119 () Bool)

(assert (=> b!180848 (= e!119116 (and e!119119 mapRes!7271))))

(declare-fun condMapEmpty!7271 () Bool)

(declare-fun mapDefault!7271 () ValueCell!1778)

(assert (=> b!180848 (= condMapEmpty!7271 (= (arr!3617 (_values!3694 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1778)) mapDefault!7271)))))

(declare-fun res!85612 () Bool)

(declare-fun e!119117 () Bool)

(assert (=> start!18200 (=> (not res!85612) (not e!119117))))

(declare-fun valid!1043 (LongMapFixedSize!2464) Bool)

(assert (=> start!18200 (= res!85612 (valid!1043 thiss!1248))))

(assert (=> start!18200 e!119117))

(assert (=> start!18200 e!119120))

(assert (=> start!18200 true))

(declare-fun b!180849 () Bool)

(assert (=> b!180849 (= e!119117 e!119118)))

(declare-fun res!85610 () Bool)

(assert (=> b!180849 (=> (not res!85610) (not e!119118))))

(declare-datatypes ((SeekEntryResult!605 0))(
  ( (MissingZero!605 (index!4590 (_ BitVec 32))) (Found!605 (index!4591 (_ BitVec 32))) (Intermediate!605 (undefined!1417 Bool) (index!4592 (_ BitVec 32)) (x!19782 (_ BitVec 32))) (Undefined!605) (MissingVacant!605 (index!4593 (_ BitVec 32))) )
))
(declare-fun lt!89295 () SeekEntryResult!605)

(get-info :version)

(assert (=> b!180849 (= res!85610 (and (not ((_ is Undefined!605) lt!89295)) (not ((_ is MissingVacant!605) lt!89295)) (not ((_ is MissingZero!605) lt!89295)) ((_ is Found!605) lt!89295)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7643 (_ BitVec 32)) SeekEntryResult!605)

(assert (=> b!180849 (= lt!89295 (seekEntryOrOpen!0 key!828 (_keys!5608 thiss!1248) (mask!8723 thiss!1248)))))

(declare-fun b!180850 () Bool)

(declare-fun res!85609 () Bool)

(assert (=> b!180850 (=> (not res!85609) (not e!119118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!180850 (= res!85609 (validMask!0 (mask!8723 thiss!1248)))))

(declare-fun b!180851 () Bool)

(declare-fun res!85611 () Bool)

(assert (=> b!180851 (=> (not res!85611) (not e!119117))))

(assert (=> b!180851 (= res!85611 (not (= key!828 (bvneg key!828))))))

(declare-fun b!180852 () Bool)

(assert (=> b!180852 (= e!119119 tp_is_empty!4243)))

(declare-fun b!180853 () Bool)

(assert (=> b!180853 (= e!119118 (and (= (size!3927 (_values!3694 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8723 thiss!1248))) (not (= (size!3926 (_keys!5608 thiss!1248)) (size!3927 (_values!3694 thiss!1248))))))))

(assert (= (and start!18200 res!85612) b!180851))

(assert (= (and b!180851 res!85611) b!180849))

(assert (= (and b!180849 res!85610) b!180846))

(assert (= (and b!180846 res!85608) b!180850))

(assert (= (and b!180850 res!85609) b!180853))

(assert (= (and b!180848 condMapEmpty!7271) mapIsEmpty!7271))

(assert (= (and b!180848 (not condMapEmpty!7271)) mapNonEmpty!7271))

(assert (= (and mapNonEmpty!7271 ((_ is ValueCellFull!1778) mapValue!7271)) b!180847))

(assert (= (and b!180848 ((_ is ValueCellFull!1778) mapDefault!7271)) b!180852))

(assert (= b!180845 b!180848))

(assert (= start!18200 b!180845))

(declare-fun m!208339 () Bool)

(assert (=> b!180849 m!208339))

(declare-fun m!208341 () Bool)

(assert (=> start!18200 m!208341))

(declare-fun m!208343 () Bool)

(assert (=> b!180846 m!208343))

(assert (=> b!180846 m!208343))

(declare-fun m!208345 () Bool)

(assert (=> b!180846 m!208345))

(declare-fun m!208347 () Bool)

(assert (=> b!180845 m!208347))

(declare-fun m!208349 () Bool)

(assert (=> b!180845 m!208349))

(declare-fun m!208351 () Bool)

(assert (=> b!180850 m!208351))

(declare-fun m!208353 () Bool)

(assert (=> mapNonEmpty!7271 m!208353))

(check-sat (not start!18200) (not b_next!4471) (not b!180845) (not b!180850) tp_is_empty!4243 (not mapNonEmpty!7271) (not b!180846) (not b!180849) b_and!10987)
(check-sat b_and!10987 (not b_next!4471))
(get-model)

(declare-fun d!54191 () Bool)

(assert (=> d!54191 (= (array_inv!2339 (_keys!5608 thiss!1248)) (bvsge (size!3926 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180845 d!54191))

(declare-fun d!54193 () Bool)

(assert (=> d!54193 (= (array_inv!2340 (_values!3694 thiss!1248)) (bvsge (size!3927 (_values!3694 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180845 d!54193))

(declare-fun b!180920 () Bool)

(declare-fun e!119172 () SeekEntryResult!605)

(assert (=> b!180920 (= e!119172 Undefined!605)))

(declare-fun b!180921 () Bool)

(declare-fun e!119170 () SeekEntryResult!605)

(declare-fun lt!89308 () SeekEntryResult!605)

(assert (=> b!180921 (= e!119170 (Found!605 (index!4592 lt!89308)))))

(declare-fun d!54195 () Bool)

(declare-fun lt!89310 () SeekEntryResult!605)

(assert (=> d!54195 (and (or ((_ is Undefined!605) lt!89310) (not ((_ is Found!605) lt!89310)) (and (bvsge (index!4591 lt!89310) #b00000000000000000000000000000000) (bvslt (index!4591 lt!89310) (size!3926 (_keys!5608 thiss!1248))))) (or ((_ is Undefined!605) lt!89310) ((_ is Found!605) lt!89310) (not ((_ is MissingZero!605) lt!89310)) (and (bvsge (index!4590 lt!89310) #b00000000000000000000000000000000) (bvslt (index!4590 lt!89310) (size!3926 (_keys!5608 thiss!1248))))) (or ((_ is Undefined!605) lt!89310) ((_ is Found!605) lt!89310) ((_ is MissingZero!605) lt!89310) (not ((_ is MissingVacant!605) lt!89310)) (and (bvsge (index!4593 lt!89310) #b00000000000000000000000000000000) (bvslt (index!4593 lt!89310) (size!3926 (_keys!5608 thiss!1248))))) (or ((_ is Undefined!605) lt!89310) (ite ((_ is Found!605) lt!89310) (= (select (arr!3616 (_keys!5608 thiss!1248)) (index!4591 lt!89310)) key!828) (ite ((_ is MissingZero!605) lt!89310) (= (select (arr!3616 (_keys!5608 thiss!1248)) (index!4590 lt!89310)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!605) lt!89310) (= (select (arr!3616 (_keys!5608 thiss!1248)) (index!4593 lt!89310)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54195 (= lt!89310 e!119172)))

(declare-fun c!32409 () Bool)

(assert (=> d!54195 (= c!32409 (and ((_ is Intermediate!605) lt!89308) (undefined!1417 lt!89308)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7643 (_ BitVec 32)) SeekEntryResult!605)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54195 (= lt!89308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8723 thiss!1248)) key!828 (_keys!5608 thiss!1248) (mask!8723 thiss!1248)))))

(assert (=> d!54195 (validMask!0 (mask!8723 thiss!1248))))

(assert (=> d!54195 (= (seekEntryOrOpen!0 key!828 (_keys!5608 thiss!1248) (mask!8723 thiss!1248)) lt!89310)))

(declare-fun e!119171 () SeekEntryResult!605)

(declare-fun b!180922 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7643 (_ BitVec 32)) SeekEntryResult!605)

(assert (=> b!180922 (= e!119171 (seekKeyOrZeroReturnVacant!0 (x!19782 lt!89308) (index!4592 lt!89308) (index!4592 lt!89308) key!828 (_keys!5608 thiss!1248) (mask!8723 thiss!1248)))))

(declare-fun b!180923 () Bool)

(assert (=> b!180923 (= e!119172 e!119170)))

(declare-fun lt!89309 () (_ BitVec 64))

(assert (=> b!180923 (= lt!89309 (select (arr!3616 (_keys!5608 thiss!1248)) (index!4592 lt!89308)))))

(declare-fun c!32410 () Bool)

(assert (=> b!180923 (= c!32410 (= lt!89309 key!828))))

(declare-fun b!180924 () Bool)

(declare-fun c!32408 () Bool)

(assert (=> b!180924 (= c!32408 (= lt!89309 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180924 (= e!119170 e!119171)))

(declare-fun b!180925 () Bool)

(assert (=> b!180925 (= e!119171 (MissingZero!605 (index!4592 lt!89308)))))

(assert (= (and d!54195 c!32409) b!180920))

(assert (= (and d!54195 (not c!32409)) b!180923))

(assert (= (and b!180923 c!32410) b!180921))

(assert (= (and b!180923 (not c!32410)) b!180924))

(assert (= (and b!180924 c!32408) b!180925))

(assert (= (and b!180924 (not c!32408)) b!180922))

(declare-fun m!208387 () Bool)

(assert (=> d!54195 m!208387))

(declare-fun m!208389 () Bool)

(assert (=> d!54195 m!208389))

(declare-fun m!208391 () Bool)

(assert (=> d!54195 m!208391))

(declare-fun m!208393 () Bool)

(assert (=> d!54195 m!208393))

(assert (=> d!54195 m!208387))

(declare-fun m!208395 () Bool)

(assert (=> d!54195 m!208395))

(assert (=> d!54195 m!208351))

(declare-fun m!208397 () Bool)

(assert (=> b!180922 m!208397))

(declare-fun m!208399 () Bool)

(assert (=> b!180923 m!208399))

(assert (=> b!180849 d!54195))

(declare-fun d!54197 () Bool)

(declare-fun e!119177 () Bool)

(assert (=> d!54197 e!119177))

(declare-fun res!85645 () Bool)

(assert (=> d!54197 (=> res!85645 e!119177)))

(declare-fun lt!89322 () Bool)

(assert (=> d!54197 (= res!85645 (not lt!89322))))

(declare-fun lt!89320 () Bool)

(assert (=> d!54197 (= lt!89322 lt!89320)))

(declare-datatypes ((Unit!5475 0))(
  ( (Unit!5476) )
))
(declare-fun lt!89321 () Unit!5475)

(declare-fun e!119178 () Unit!5475)

(assert (=> d!54197 (= lt!89321 e!119178)))

(declare-fun c!32413 () Bool)

(assert (=> d!54197 (= c!32413 lt!89320)))

(declare-fun containsKey!210 (List!2300 (_ BitVec 64)) Bool)

(assert (=> d!54197 (= lt!89320 (containsKey!210 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(assert (=> d!54197 (= (contains!1231 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)) key!828) lt!89322)))

(declare-fun b!180932 () Bool)

(declare-fun lt!89319 () Unit!5475)

(assert (=> b!180932 (= e!119178 lt!89319)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!159 (List!2300 (_ BitVec 64)) Unit!5475)

(assert (=> b!180932 (= lt!89319 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(declare-datatypes ((Option!212 0))(
  ( (Some!211 (v!4058 V!5305)) (None!210) )
))
(declare-fun isDefined!160 (Option!212) Bool)

(declare-fun getValueByKey!206 (List!2300 (_ BitVec 64)) Option!212)

(assert (=> b!180932 (isDefined!160 (getValueByKey!206 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(declare-fun b!180933 () Bool)

(declare-fun Unit!5477 () Unit!5475)

(assert (=> b!180933 (= e!119178 Unit!5477)))

(declare-fun b!180934 () Bool)

(assert (=> b!180934 (= e!119177 (isDefined!160 (getValueByKey!206 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828)))))

(assert (= (and d!54197 c!32413) b!180932))

(assert (= (and d!54197 (not c!32413)) b!180933))

(assert (= (and d!54197 (not res!85645)) b!180934))

(declare-fun m!208401 () Bool)

(assert (=> d!54197 m!208401))

(declare-fun m!208403 () Bool)

(assert (=> b!180932 m!208403))

(declare-fun m!208405 () Bool)

(assert (=> b!180932 m!208405))

(assert (=> b!180932 m!208405))

(declare-fun m!208407 () Bool)

(assert (=> b!180932 m!208407))

(assert (=> b!180934 m!208405))

(assert (=> b!180934 m!208405))

(assert (=> b!180934 m!208407))

(assert (=> b!180846 d!54197))

(declare-fun b!180977 () Bool)

(declare-fun e!119212 () ListLongMap!2263)

(declare-fun call!18280 () ListLongMap!2263)

(assert (=> b!180977 (= e!119212 call!18280)))

(declare-fun b!180978 () Bool)

(declare-fun e!119207 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!180978 (= e!119207 (validKeyInArray!0 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180979 () Bool)

(declare-fun e!119216 () Bool)

(declare-fun call!18284 () Bool)

(assert (=> b!180979 (= e!119216 (not call!18284))))

(declare-fun b!180980 () Bool)

(declare-fun e!119211 () ListLongMap!2263)

(declare-fun e!119205 () ListLongMap!2263)

(assert (=> b!180980 (= e!119211 e!119205)))

(declare-fun c!32428 () Bool)

(assert (=> b!180980 (= c!32428 (and (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18277 () Bool)

(declare-fun call!18286 () ListLongMap!2263)

(assert (=> bm!18277 (= call!18280 call!18286)))

(declare-fun bm!18278 () Bool)

(declare-fun call!18281 () ListLongMap!2263)

(declare-fun call!18282 () ListLongMap!2263)

(assert (=> bm!18278 (= call!18281 call!18282)))

(declare-fun d!54199 () Bool)

(declare-fun e!119214 () Bool)

(assert (=> d!54199 e!119214))

(declare-fun res!85665 () Bool)

(assert (=> d!54199 (=> (not res!85665) (not e!119214))))

(assert (=> d!54199 (= res!85665 (or (bvsge #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))))

(declare-fun lt!89380 () ListLongMap!2263)

(declare-fun lt!89369 () ListLongMap!2263)

(assert (=> d!54199 (= lt!89380 lt!89369)))

(declare-fun lt!89385 () Unit!5475)

(declare-fun e!119209 () Unit!5475)

(assert (=> d!54199 (= lt!89385 e!119209)))

(declare-fun c!32427 () Bool)

(assert (=> d!54199 (= c!32427 e!119207)))

(declare-fun res!85667 () Bool)

(assert (=> d!54199 (=> (not res!85667) (not e!119207))))

(assert (=> d!54199 (= res!85667 (bvslt #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(assert (=> d!54199 (= lt!89369 e!119211)))

(declare-fun c!32430 () Bool)

(assert (=> d!54199 (= c!32430 (and (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54199 (validMask!0 (mask!8723 thiss!1248))))

(assert (=> d!54199 (= (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)) lt!89380)))

(declare-fun b!180981 () Bool)

(declare-fun e!119206 () Bool)

(declare-fun apply!151 (ListLongMap!2263 (_ BitVec 64)) V!5305)

(declare-fun get!2067 (ValueCell!1778 V!5305) V!5305)

(declare-fun dynLambda!485 (Int (_ BitVec 64)) V!5305)

(assert (=> b!180981 (= e!119206 (= (apply!151 lt!89380 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)) (get!2067 (select (arr!3617 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3927 (_values!3694 thiss!1248))))))

(assert (=> b!180981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(declare-fun b!180982 () Bool)

(declare-fun c!32426 () Bool)

(assert (=> b!180982 (= c!32426 (and (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!180982 (= e!119205 e!119212)))

(declare-fun b!180983 () Bool)

(declare-fun e!119215 () Bool)

(assert (=> b!180983 (= e!119215 (= (apply!151 lt!89380 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3552 thiss!1248)))))

(declare-fun b!180984 () Bool)

(declare-fun e!119208 () Bool)

(declare-fun call!18285 () Bool)

(assert (=> b!180984 (= e!119208 (not call!18285))))

(declare-fun bm!18279 () Bool)

(assert (=> bm!18279 (= call!18284 (contains!1231 lt!89380 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180985 () Bool)

(assert (=> b!180985 (= e!119216 e!119215)))

(declare-fun res!85664 () Bool)

(assert (=> b!180985 (= res!85664 call!18284)))

(assert (=> b!180985 (=> (not res!85664) (not e!119215))))

(declare-fun b!180986 () Bool)

(assert (=> b!180986 (= e!119205 call!18281)))

(declare-fun b!180987 () Bool)

(declare-fun res!85669 () Bool)

(assert (=> b!180987 (=> (not res!85669) (not e!119214))))

(declare-fun e!119213 () Bool)

(assert (=> b!180987 (= res!85669 e!119213)))

(declare-fun res!85670 () Bool)

(assert (=> b!180987 (=> res!85670 e!119213)))

(declare-fun e!119217 () Bool)

(assert (=> b!180987 (= res!85670 (not e!119217))))

(declare-fun res!85672 () Bool)

(assert (=> b!180987 (=> (not res!85672) (not e!119217))))

(assert (=> b!180987 (= res!85672 (bvslt #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(declare-fun b!180988 () Bool)

(declare-fun Unit!5478 () Unit!5475)

(assert (=> b!180988 (= e!119209 Unit!5478)))

(declare-fun b!180989 () Bool)

(assert (=> b!180989 (= e!119213 e!119206)))

(declare-fun res!85671 () Bool)

(assert (=> b!180989 (=> (not res!85671) (not e!119206))))

(assert (=> b!180989 (= res!85671 (contains!1231 lt!89380 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180989 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(declare-fun bm!18280 () Bool)

(declare-fun call!18283 () ListLongMap!2263)

(assert (=> bm!18280 (= call!18286 call!18283)))

(declare-fun b!180990 () Bool)

(declare-fun lt!89378 () Unit!5475)

(assert (=> b!180990 (= e!119209 lt!89378)))

(declare-fun lt!89381 () ListLongMap!2263)

(declare-fun getCurrentListMapNoExtraKeys!172 (array!7643 array!7645 (_ BitVec 32) (_ BitVec 32) V!5305 V!5305 (_ BitVec 32) Int) ListLongMap!2263)

(assert (=> b!180990 (= lt!89381 (getCurrentListMapNoExtraKeys!172 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))

(declare-fun lt!89387 () (_ BitVec 64))

(assert (=> b!180990 (= lt!89387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89384 () (_ BitVec 64))

(assert (=> b!180990 (= lt!89384 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89368 () Unit!5475)

(declare-fun addStillContains!127 (ListLongMap!2263 (_ BitVec 64) V!5305 (_ BitVec 64)) Unit!5475)

(assert (=> b!180990 (= lt!89368 (addStillContains!127 lt!89381 lt!89387 (zeroValue!3552 thiss!1248) lt!89384))))

(declare-fun +!268 (ListLongMap!2263 tuple2!3354) ListLongMap!2263)

(assert (=> b!180990 (contains!1231 (+!268 lt!89381 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248))) lt!89384)))

(declare-fun lt!89371 () Unit!5475)

(assert (=> b!180990 (= lt!89371 lt!89368)))

(declare-fun lt!89383 () ListLongMap!2263)

(assert (=> b!180990 (= lt!89383 (getCurrentListMapNoExtraKeys!172 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))

(declare-fun lt!89374 () (_ BitVec 64))

(assert (=> b!180990 (= lt!89374 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89388 () (_ BitVec 64))

(assert (=> b!180990 (= lt!89388 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89370 () Unit!5475)

(declare-fun addApplyDifferent!127 (ListLongMap!2263 (_ BitVec 64) V!5305 (_ BitVec 64)) Unit!5475)

(assert (=> b!180990 (= lt!89370 (addApplyDifferent!127 lt!89383 lt!89374 (minValue!3552 thiss!1248) lt!89388))))

(assert (=> b!180990 (= (apply!151 (+!268 lt!89383 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248))) lt!89388) (apply!151 lt!89383 lt!89388))))

(declare-fun lt!89373 () Unit!5475)

(assert (=> b!180990 (= lt!89373 lt!89370)))

(declare-fun lt!89379 () ListLongMap!2263)

(assert (=> b!180990 (= lt!89379 (getCurrentListMapNoExtraKeys!172 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))

(declare-fun lt!89367 () (_ BitVec 64))

(assert (=> b!180990 (= lt!89367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89377 () (_ BitVec 64))

(assert (=> b!180990 (= lt!89377 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89375 () Unit!5475)

(assert (=> b!180990 (= lt!89375 (addApplyDifferent!127 lt!89379 lt!89367 (zeroValue!3552 thiss!1248) lt!89377))))

(assert (=> b!180990 (= (apply!151 (+!268 lt!89379 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248))) lt!89377) (apply!151 lt!89379 lt!89377))))

(declare-fun lt!89376 () Unit!5475)

(assert (=> b!180990 (= lt!89376 lt!89375)))

(declare-fun lt!89386 () ListLongMap!2263)

(assert (=> b!180990 (= lt!89386 (getCurrentListMapNoExtraKeys!172 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))

(declare-fun lt!89382 () (_ BitVec 64))

(assert (=> b!180990 (= lt!89382 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89372 () (_ BitVec 64))

(assert (=> b!180990 (= lt!89372 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180990 (= lt!89378 (addApplyDifferent!127 lt!89386 lt!89382 (minValue!3552 thiss!1248) lt!89372))))

(assert (=> b!180990 (= (apply!151 (+!268 lt!89386 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248))) lt!89372) (apply!151 lt!89386 lt!89372))))

(declare-fun b!180991 () Bool)

(assert (=> b!180991 (= e!119212 call!18281)))

(declare-fun b!180992 () Bool)

(assert (=> b!180992 (= e!119211 (+!268 call!18282 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))

(declare-fun bm!18281 () Bool)

(assert (=> bm!18281 (= call!18283 (getCurrentListMapNoExtraKeys!172 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))

(declare-fun b!180993 () Bool)

(declare-fun res!85666 () Bool)

(assert (=> b!180993 (=> (not res!85666) (not e!119214))))

(assert (=> b!180993 (= res!85666 e!119208)))

(declare-fun c!32431 () Bool)

(assert (=> b!180993 (= c!32431 (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18282 () Bool)

(assert (=> bm!18282 (= call!18282 (+!268 (ite c!32430 call!18283 (ite c!32428 call!18286 call!18280)) (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(declare-fun b!180994 () Bool)

(assert (=> b!180994 (= e!119214 e!119216)))

(declare-fun c!32429 () Bool)

(assert (=> b!180994 (= c!32429 (not (= (bvand (extraKeys!3448 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!180995 () Bool)

(declare-fun e!119210 () Bool)

(assert (=> b!180995 (= e!119208 e!119210)))

(declare-fun res!85668 () Bool)

(assert (=> b!180995 (= res!85668 call!18285)))

(assert (=> b!180995 (=> (not res!85668) (not e!119210))))

(declare-fun b!180996 () Bool)

(assert (=> b!180996 (= e!119217 (validKeyInArray!0 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180997 () Bool)

(assert (=> b!180997 (= e!119210 (= (apply!151 lt!89380 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3552 thiss!1248)))))

(declare-fun bm!18283 () Bool)

(assert (=> bm!18283 (= call!18285 (contains!1231 lt!89380 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!54199 c!32430) b!180992))

(assert (= (and d!54199 (not c!32430)) b!180980))

(assert (= (and b!180980 c!32428) b!180986))

(assert (= (and b!180980 (not c!32428)) b!180982))

(assert (= (and b!180982 c!32426) b!180991))

(assert (= (and b!180982 (not c!32426)) b!180977))

(assert (= (or b!180991 b!180977) bm!18277))

(assert (= (or b!180986 bm!18277) bm!18280))

(assert (= (or b!180986 b!180991) bm!18278))

(assert (= (or b!180992 bm!18280) bm!18281))

(assert (= (or b!180992 bm!18278) bm!18282))

(assert (= (and d!54199 res!85667) b!180978))

(assert (= (and d!54199 c!32427) b!180990))

(assert (= (and d!54199 (not c!32427)) b!180988))

(assert (= (and d!54199 res!85665) b!180987))

(assert (= (and b!180987 res!85672) b!180996))

(assert (= (and b!180987 (not res!85670)) b!180989))

(assert (= (and b!180989 res!85671) b!180981))

(assert (= (and b!180987 res!85669) b!180993))

(assert (= (and b!180993 c!32431) b!180995))

(assert (= (and b!180993 (not c!32431)) b!180984))

(assert (= (and b!180995 res!85668) b!180997))

(assert (= (or b!180995 b!180984) bm!18283))

(assert (= (and b!180993 res!85666) b!180994))

(assert (= (and b!180994 c!32429) b!180985))

(assert (= (and b!180994 (not c!32429)) b!180979))

(assert (= (and b!180985 res!85664) b!180983))

(assert (= (or b!180985 b!180979) bm!18279))

(declare-fun b_lambda!7117 () Bool)

(assert (=> (not b_lambda!7117) (not b!180981)))

(declare-fun t!7147 () Bool)

(declare-fun tb!2805 () Bool)

(assert (=> (and b!180845 (= (defaultEntry!3711 thiss!1248) (defaultEntry!3711 thiss!1248)) t!7147) tb!2805))

(declare-fun result!4709 () Bool)

(assert (=> tb!2805 (= result!4709 tp_is_empty!4243)))

(assert (=> b!180981 t!7147))

(declare-fun b_and!10993 () Bool)

(assert (= b_and!10987 (and (=> t!7147 result!4709) b_and!10993)))

(declare-fun m!208409 () Bool)

(assert (=> b!180983 m!208409))

(declare-fun m!208411 () Bool)

(assert (=> b!180981 m!208411))

(declare-fun m!208413 () Bool)

(assert (=> b!180981 m!208413))

(declare-fun m!208415 () Bool)

(assert (=> b!180981 m!208415))

(assert (=> b!180981 m!208411))

(declare-fun m!208417 () Bool)

(assert (=> b!180981 m!208417))

(assert (=> b!180981 m!208415))

(assert (=> b!180981 m!208417))

(declare-fun m!208419 () Bool)

(assert (=> b!180981 m!208419))

(declare-fun m!208421 () Bool)

(assert (=> b!180992 m!208421))

(declare-fun m!208423 () Bool)

(assert (=> bm!18282 m!208423))

(declare-fun m!208425 () Bool)

(assert (=> b!180990 m!208425))

(declare-fun m!208427 () Bool)

(assert (=> b!180990 m!208427))

(declare-fun m!208429 () Bool)

(assert (=> b!180990 m!208429))

(assert (=> b!180990 m!208425))

(declare-fun m!208431 () Bool)

(assert (=> b!180990 m!208431))

(declare-fun m!208433 () Bool)

(assert (=> b!180990 m!208433))

(declare-fun m!208435 () Bool)

(assert (=> b!180990 m!208435))

(assert (=> b!180990 m!208411))

(assert (=> b!180990 m!208427))

(declare-fun m!208437 () Bool)

(assert (=> b!180990 m!208437))

(declare-fun m!208439 () Bool)

(assert (=> b!180990 m!208439))

(declare-fun m!208441 () Bool)

(assert (=> b!180990 m!208441))

(declare-fun m!208443 () Bool)

(assert (=> b!180990 m!208443))

(assert (=> b!180990 m!208439))

(declare-fun m!208445 () Bool)

(assert (=> b!180990 m!208445))

(declare-fun m!208447 () Bool)

(assert (=> b!180990 m!208447))

(declare-fun m!208449 () Bool)

(assert (=> b!180990 m!208449))

(declare-fun m!208451 () Bool)

(assert (=> b!180990 m!208451))

(declare-fun m!208453 () Bool)

(assert (=> b!180990 m!208453))

(assert (=> b!180990 m!208435))

(declare-fun m!208455 () Bool)

(assert (=> b!180990 m!208455))

(assert (=> b!180989 m!208411))

(assert (=> b!180989 m!208411))

(declare-fun m!208457 () Bool)

(assert (=> b!180989 m!208457))

(declare-fun m!208459 () Bool)

(assert (=> b!180997 m!208459))

(assert (=> b!180996 m!208411))

(assert (=> b!180996 m!208411))

(declare-fun m!208461 () Bool)

(assert (=> b!180996 m!208461))

(declare-fun m!208463 () Bool)

(assert (=> bm!18279 m!208463))

(declare-fun m!208465 () Bool)

(assert (=> bm!18283 m!208465))

(assert (=> b!180978 m!208411))

(assert (=> b!180978 m!208411))

(assert (=> b!180978 m!208461))

(assert (=> bm!18281 m!208441))

(assert (=> d!54199 m!208351))

(assert (=> b!180846 d!54199))

(declare-fun d!54201 () Bool)

(declare-fun res!85679 () Bool)

(declare-fun e!119220 () Bool)

(assert (=> d!54201 (=> (not res!85679) (not e!119220))))

(declare-fun simpleValid!167 (LongMapFixedSize!2464) Bool)

(assert (=> d!54201 (= res!85679 (simpleValid!167 thiss!1248))))

(assert (=> d!54201 (= (valid!1043 thiss!1248) e!119220)))

(declare-fun b!181006 () Bool)

(declare-fun res!85680 () Bool)

(assert (=> b!181006 (=> (not res!85680) (not e!119220))))

(declare-fun arrayCountValidKeys!0 (array!7643 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181006 (= res!85680 (= (arrayCountValidKeys!0 (_keys!5608 thiss!1248) #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))) (_size!1281 thiss!1248)))))

(declare-fun b!181007 () Bool)

(declare-fun res!85681 () Bool)

(assert (=> b!181007 (=> (not res!85681) (not e!119220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7643 (_ BitVec 32)) Bool)

(assert (=> b!181007 (= res!85681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5608 thiss!1248) (mask!8723 thiss!1248)))))

(declare-fun b!181008 () Bool)

(declare-datatypes ((List!2303 0))(
  ( (Nil!2300) (Cons!2299 (h!2925 (_ BitVec 64)) (t!7148 List!2303)) )
))
(declare-fun arrayNoDuplicates!0 (array!7643 (_ BitVec 32) List!2303) Bool)

(assert (=> b!181008 (= e!119220 (arrayNoDuplicates!0 (_keys!5608 thiss!1248) #b00000000000000000000000000000000 Nil!2300))))

(assert (= (and d!54201 res!85679) b!181006))

(assert (= (and b!181006 res!85680) b!181007))

(assert (= (and b!181007 res!85681) b!181008))

(declare-fun m!208467 () Bool)

(assert (=> d!54201 m!208467))

(declare-fun m!208469 () Bool)

(assert (=> b!181006 m!208469))

(declare-fun m!208471 () Bool)

(assert (=> b!181007 m!208471))

(declare-fun m!208473 () Bool)

(assert (=> b!181008 m!208473))

(assert (=> start!18200 d!54201))

(declare-fun d!54203 () Bool)

(assert (=> d!54203 (= (validMask!0 (mask!8723 thiss!1248)) (and (or (= (mask!8723 thiss!1248) #b00000000000000000000000000000111) (= (mask!8723 thiss!1248) #b00000000000000000000000000001111) (= (mask!8723 thiss!1248) #b00000000000000000000000000011111) (= (mask!8723 thiss!1248) #b00000000000000000000000000111111) (= (mask!8723 thiss!1248) #b00000000000000000000000001111111) (= (mask!8723 thiss!1248) #b00000000000000000000000011111111) (= (mask!8723 thiss!1248) #b00000000000000000000000111111111) (= (mask!8723 thiss!1248) #b00000000000000000000001111111111) (= (mask!8723 thiss!1248) #b00000000000000000000011111111111) (= (mask!8723 thiss!1248) #b00000000000000000000111111111111) (= (mask!8723 thiss!1248) #b00000000000000000001111111111111) (= (mask!8723 thiss!1248) #b00000000000000000011111111111111) (= (mask!8723 thiss!1248) #b00000000000000000111111111111111) (= (mask!8723 thiss!1248) #b00000000000000001111111111111111) (= (mask!8723 thiss!1248) #b00000000000000011111111111111111) (= (mask!8723 thiss!1248) #b00000000000000111111111111111111) (= (mask!8723 thiss!1248) #b00000000000001111111111111111111) (= (mask!8723 thiss!1248) #b00000000000011111111111111111111) (= (mask!8723 thiss!1248) #b00000000000111111111111111111111) (= (mask!8723 thiss!1248) #b00000000001111111111111111111111) (= (mask!8723 thiss!1248) #b00000000011111111111111111111111) (= (mask!8723 thiss!1248) #b00000000111111111111111111111111) (= (mask!8723 thiss!1248) #b00000001111111111111111111111111) (= (mask!8723 thiss!1248) #b00000011111111111111111111111111) (= (mask!8723 thiss!1248) #b00000111111111111111111111111111) (= (mask!8723 thiss!1248) #b00001111111111111111111111111111) (= (mask!8723 thiss!1248) #b00011111111111111111111111111111) (= (mask!8723 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8723 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!180850 d!54203))

(declare-fun b!181015 () Bool)

(declare-fun e!119225 () Bool)

(assert (=> b!181015 (= e!119225 tp_is_empty!4243)))

(declare-fun b!181016 () Bool)

(declare-fun e!119226 () Bool)

(assert (=> b!181016 (= e!119226 tp_is_empty!4243)))

(declare-fun mapNonEmpty!7280 () Bool)

(declare-fun mapRes!7280 () Bool)

(declare-fun tp!16172 () Bool)

(assert (=> mapNonEmpty!7280 (= mapRes!7280 (and tp!16172 e!119225))))

(declare-fun mapKey!7280 () (_ BitVec 32))

(declare-fun mapRest!7280 () (Array (_ BitVec 32) ValueCell!1778))

(declare-fun mapValue!7280 () ValueCell!1778)

(assert (=> mapNonEmpty!7280 (= mapRest!7271 (store mapRest!7280 mapKey!7280 mapValue!7280))))

(declare-fun condMapEmpty!7280 () Bool)

(declare-fun mapDefault!7280 () ValueCell!1778)

(assert (=> mapNonEmpty!7271 (= condMapEmpty!7280 (= mapRest!7271 ((as const (Array (_ BitVec 32) ValueCell!1778)) mapDefault!7280)))))

(assert (=> mapNonEmpty!7271 (= tp!16157 (and e!119226 mapRes!7280))))

(declare-fun mapIsEmpty!7280 () Bool)

(assert (=> mapIsEmpty!7280 mapRes!7280))

(assert (= (and mapNonEmpty!7271 condMapEmpty!7280) mapIsEmpty!7280))

(assert (= (and mapNonEmpty!7271 (not condMapEmpty!7280)) mapNonEmpty!7280))

(assert (= (and mapNonEmpty!7280 ((_ is ValueCellFull!1778) mapValue!7280)) b!181015))

(assert (= (and mapNonEmpty!7271 ((_ is ValueCellFull!1778) mapDefault!7280)) b!181016))

(declare-fun m!208475 () Bool)

(assert (=> mapNonEmpty!7280 m!208475))

(declare-fun b_lambda!7119 () Bool)

(assert (= b_lambda!7117 (or (and b!180845 b_free!4471) b_lambda!7119)))

(check-sat (not b!180989) (not b!181008) (not b!180932) (not d!54197) (not mapNonEmpty!7280) (not d!54199) (not b!180922) (not d!54201) (not bm!18279) (not b!180992) (not b!180934) (not b_next!4471) (not bm!18282) (not b!181006) (not b!180996) (not b!180983) (not b!180990) (not b!180981) (not d!54195) b_and!10993 (not b!181007) (not bm!18283) (not b!180978) tp_is_empty!4243 (not b!180997) (not b_lambda!7119) (not bm!18281))
(check-sat b_and!10993 (not b_next!4471))
(get-model)

(declare-fun b!181025 () Bool)

(declare-fun e!119232 () (_ BitVec 32))

(assert (=> b!181025 (= e!119232 #b00000000000000000000000000000000)))

(declare-fun b!181026 () Bool)

(declare-fun e!119231 () (_ BitVec 32))

(declare-fun call!18289 () (_ BitVec 32))

(assert (=> b!181026 (= e!119231 call!18289)))

(declare-fun d!54205 () Bool)

(declare-fun lt!89391 () (_ BitVec 32))

(assert (=> d!54205 (and (bvsge lt!89391 #b00000000000000000000000000000000) (bvsle lt!89391 (bvsub (size!3926 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54205 (= lt!89391 e!119232)))

(declare-fun c!32437 () Bool)

(assert (=> d!54205 (= c!32437 (bvsge #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(assert (=> d!54205 (and (bvsle #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3926 (_keys!5608 thiss!1248)) (size!3926 (_keys!5608 thiss!1248))))))

(assert (=> d!54205 (= (arrayCountValidKeys!0 (_keys!5608 thiss!1248) #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))) lt!89391)))

(declare-fun b!181027 () Bool)

(assert (=> b!181027 (= e!119231 (bvadd #b00000000000000000000000000000001 call!18289))))

(declare-fun b!181028 () Bool)

(assert (=> b!181028 (= e!119232 e!119231)))

(declare-fun c!32436 () Bool)

(assert (=> b!181028 (= c!32436 (validKeyInArray!0 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18286 () Bool)

(assert (=> bm!18286 (= call!18289 (arrayCountValidKeys!0 (_keys!5608 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3926 (_keys!5608 thiss!1248))))))

(assert (= (and d!54205 c!32437) b!181025))

(assert (= (and d!54205 (not c!32437)) b!181028))

(assert (= (and b!181028 c!32436) b!181027))

(assert (= (and b!181028 (not c!32436)) b!181026))

(assert (= (or b!181027 b!181026) bm!18286))

(assert (=> b!181028 m!208411))

(assert (=> b!181028 m!208411))

(assert (=> b!181028 m!208461))

(declare-fun m!208477 () Bool)

(assert (=> bm!18286 m!208477))

(assert (=> b!181006 d!54205))

(declare-fun d!54207 () Bool)

(declare-fun get!2068 (Option!212) V!5305)

(assert (=> d!54207 (= (apply!151 lt!89380 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2068 (getValueByKey!206 (toList!1147 lt!89380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7369 () Bool)

(assert (= bs!7369 d!54207))

(declare-fun m!208479 () Bool)

(assert (=> bs!7369 m!208479))

(assert (=> bs!7369 m!208479))

(declare-fun m!208481 () Bool)

(assert (=> bs!7369 m!208481))

(assert (=> b!180983 d!54207))

(declare-fun d!54209 () Bool)

(declare-fun isEmpty!461 (Option!212) Bool)

(assert (=> d!54209 (= (isDefined!160 (getValueByKey!206 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828)) (not (isEmpty!461 (getValueByKey!206 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))))

(declare-fun bs!7370 () Bool)

(assert (= bs!7370 d!54209))

(assert (=> bs!7370 m!208405))

(declare-fun m!208483 () Bool)

(assert (=> bs!7370 m!208483))

(assert (=> b!180934 d!54209))

(declare-fun b!181040 () Bool)

(declare-fun e!119238 () Option!212)

(assert (=> b!181040 (= e!119238 None!210)))

(declare-fun d!54211 () Bool)

(declare-fun c!32442 () Bool)

(assert (=> d!54211 (= c!32442 (and ((_ is Cons!2296) (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) (= (_1!1688 (h!2922 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) key!828)))))

(declare-fun e!119237 () Option!212)

(assert (=> d!54211 (= (getValueByKey!206 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828) e!119237)))

(declare-fun b!181039 () Bool)

(assert (=> b!181039 (= e!119238 (getValueByKey!206 (t!7143 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) key!828))))

(declare-fun b!181037 () Bool)

(assert (=> b!181037 (= e!119237 (Some!211 (_2!1688 (h!2922 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))))))

(declare-fun b!181038 () Bool)

(assert (=> b!181038 (= e!119237 e!119238)))

(declare-fun c!32443 () Bool)

(assert (=> b!181038 (= c!32443 (and ((_ is Cons!2296) (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) (not (= (_1!1688 (h!2922 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) key!828))))))

(assert (= (and d!54211 c!32442) b!181037))

(assert (= (and d!54211 (not c!32442)) b!181038))

(assert (= (and b!181038 c!32443) b!181039))

(assert (= (and b!181038 (not c!32443)) b!181040))

(declare-fun m!208485 () Bool)

(assert (=> b!181039 m!208485))

(assert (=> b!180934 d!54211))

(declare-fun b!181049 () Bool)

(declare-fun res!85691 () Bool)

(declare-fun e!119241 () Bool)

(assert (=> b!181049 (=> (not res!85691) (not e!119241))))

(assert (=> b!181049 (= res!85691 (and (= (size!3927 (_values!3694 thiss!1248)) (bvadd (mask!8723 thiss!1248) #b00000000000000000000000000000001)) (= (size!3926 (_keys!5608 thiss!1248)) (size!3927 (_values!3694 thiss!1248))) (bvsge (_size!1281 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1281 thiss!1248) (bvadd (mask!8723 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!181050 () Bool)

(declare-fun res!85690 () Bool)

(assert (=> b!181050 (=> (not res!85690) (not e!119241))))

(declare-fun size!3932 (LongMapFixedSize!2464) (_ BitVec 32))

(assert (=> b!181050 (= res!85690 (bvsge (size!3932 thiss!1248) (_size!1281 thiss!1248)))))

(declare-fun d!54213 () Bool)

(declare-fun res!85692 () Bool)

(assert (=> d!54213 (=> (not res!85692) (not e!119241))))

(assert (=> d!54213 (= res!85692 (validMask!0 (mask!8723 thiss!1248)))))

(assert (=> d!54213 (= (simpleValid!167 thiss!1248) e!119241)))

(declare-fun b!181052 () Bool)

(assert (=> b!181052 (= e!119241 (and (bvsge (extraKeys!3448 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3448 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1281 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!181051 () Bool)

(declare-fun res!85693 () Bool)

(assert (=> b!181051 (=> (not res!85693) (not e!119241))))

(assert (=> b!181051 (= res!85693 (= (size!3932 thiss!1248) (bvadd (_size!1281 thiss!1248) (bvsdiv (bvadd (extraKeys!3448 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!54213 res!85692) b!181049))

(assert (= (and b!181049 res!85691) b!181050))

(assert (= (and b!181050 res!85690) b!181051))

(assert (= (and b!181051 res!85693) b!181052))

(declare-fun m!208487 () Bool)

(assert (=> b!181050 m!208487))

(assert (=> d!54213 m!208351))

(assert (=> b!181051 m!208487))

(assert (=> d!54201 d!54213))

(assert (=> d!54199 d!54203))

(declare-fun d!54215 () Bool)

(assert (=> d!54215 (= (apply!151 (+!268 lt!89386 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248))) lt!89372) (apply!151 lt!89386 lt!89372))))

(declare-fun lt!89394 () Unit!5475)

(declare-fun choose!968 (ListLongMap!2263 (_ BitVec 64) V!5305 (_ BitVec 64)) Unit!5475)

(assert (=> d!54215 (= lt!89394 (choose!968 lt!89386 lt!89382 (minValue!3552 thiss!1248) lt!89372))))

(declare-fun e!119244 () Bool)

(assert (=> d!54215 e!119244))

(declare-fun res!85696 () Bool)

(assert (=> d!54215 (=> (not res!85696) (not e!119244))))

(assert (=> d!54215 (= res!85696 (contains!1231 lt!89386 lt!89372))))

(assert (=> d!54215 (= (addApplyDifferent!127 lt!89386 lt!89382 (minValue!3552 thiss!1248) lt!89372) lt!89394)))

(declare-fun b!181056 () Bool)

(assert (=> b!181056 (= e!119244 (not (= lt!89372 lt!89382)))))

(assert (= (and d!54215 res!85696) b!181056))

(declare-fun m!208489 () Bool)

(assert (=> d!54215 m!208489))

(assert (=> d!54215 m!208427))

(assert (=> d!54215 m!208429))

(assert (=> d!54215 m!208427))

(assert (=> d!54215 m!208453))

(declare-fun m!208491 () Bool)

(assert (=> d!54215 m!208491))

(assert (=> b!180990 d!54215))

(declare-fun d!54217 () Bool)

(declare-fun e!119247 () Bool)

(assert (=> d!54217 e!119247))

(declare-fun res!85702 () Bool)

(assert (=> d!54217 (=> (not res!85702) (not e!119247))))

(declare-fun lt!89405 () ListLongMap!2263)

(assert (=> d!54217 (= res!85702 (contains!1231 lt!89405 (_1!1688 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248)))))))

(declare-fun lt!89406 () List!2300)

(assert (=> d!54217 (= lt!89405 (ListLongMap!2264 lt!89406))))

(declare-fun lt!89403 () Unit!5475)

(declare-fun lt!89404 () Unit!5475)

(assert (=> d!54217 (= lt!89403 lt!89404)))

(assert (=> d!54217 (= (getValueByKey!206 lt!89406 (_1!1688 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248)))) (Some!211 (_2!1688 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!111 (List!2300 (_ BitVec 64) V!5305) Unit!5475)

(assert (=> d!54217 (= lt!89404 (lemmaContainsTupThenGetReturnValue!111 lt!89406 (_1!1688 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248))) (_2!1688 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248)))))))

(declare-fun insertStrictlySorted!114 (List!2300 (_ BitVec 64) V!5305) List!2300)

(assert (=> d!54217 (= lt!89406 (insertStrictlySorted!114 (toList!1147 lt!89386) (_1!1688 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248))) (_2!1688 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248)))))))

(assert (=> d!54217 (= (+!268 lt!89386 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248))) lt!89405)))

(declare-fun b!181061 () Bool)

(declare-fun res!85701 () Bool)

(assert (=> b!181061 (=> (not res!85701) (not e!119247))))

(assert (=> b!181061 (= res!85701 (= (getValueByKey!206 (toList!1147 lt!89405) (_1!1688 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248)))) (Some!211 (_2!1688 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248))))))))

(declare-fun b!181062 () Bool)

(declare-fun contains!1234 (List!2300 tuple2!3354) Bool)

(assert (=> b!181062 (= e!119247 (contains!1234 (toList!1147 lt!89405) (tuple2!3355 lt!89382 (minValue!3552 thiss!1248))))))

(assert (= (and d!54217 res!85702) b!181061))

(assert (= (and b!181061 res!85701) b!181062))

(declare-fun m!208493 () Bool)

(assert (=> d!54217 m!208493))

(declare-fun m!208495 () Bool)

(assert (=> d!54217 m!208495))

(declare-fun m!208497 () Bool)

(assert (=> d!54217 m!208497))

(declare-fun m!208499 () Bool)

(assert (=> d!54217 m!208499))

(declare-fun m!208501 () Bool)

(assert (=> b!181061 m!208501))

(declare-fun m!208503 () Bool)

(assert (=> b!181062 m!208503))

(assert (=> b!180990 d!54217))

(declare-fun d!54219 () Bool)

(declare-fun e!119248 () Bool)

(assert (=> d!54219 e!119248))

(declare-fun res!85703 () Bool)

(assert (=> d!54219 (=> res!85703 e!119248)))

(declare-fun lt!89410 () Bool)

(assert (=> d!54219 (= res!85703 (not lt!89410))))

(declare-fun lt!89408 () Bool)

(assert (=> d!54219 (= lt!89410 lt!89408)))

(declare-fun lt!89409 () Unit!5475)

(declare-fun e!119249 () Unit!5475)

(assert (=> d!54219 (= lt!89409 e!119249)))

(declare-fun c!32444 () Bool)

(assert (=> d!54219 (= c!32444 lt!89408)))

(assert (=> d!54219 (= lt!89408 (containsKey!210 (toList!1147 (+!268 lt!89381 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248)))) lt!89384))))

(assert (=> d!54219 (= (contains!1231 (+!268 lt!89381 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248))) lt!89384) lt!89410)))

(declare-fun b!181063 () Bool)

(declare-fun lt!89407 () Unit!5475)

(assert (=> b!181063 (= e!119249 lt!89407)))

(assert (=> b!181063 (= lt!89407 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1147 (+!268 lt!89381 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248)))) lt!89384))))

(assert (=> b!181063 (isDefined!160 (getValueByKey!206 (toList!1147 (+!268 lt!89381 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248)))) lt!89384))))

(declare-fun b!181064 () Bool)

(declare-fun Unit!5479 () Unit!5475)

(assert (=> b!181064 (= e!119249 Unit!5479)))

(declare-fun b!181065 () Bool)

(assert (=> b!181065 (= e!119248 (isDefined!160 (getValueByKey!206 (toList!1147 (+!268 lt!89381 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248)))) lt!89384)))))

(assert (= (and d!54219 c!32444) b!181063))

(assert (= (and d!54219 (not c!32444)) b!181064))

(assert (= (and d!54219 (not res!85703)) b!181065))

(declare-fun m!208505 () Bool)

(assert (=> d!54219 m!208505))

(declare-fun m!208507 () Bool)

(assert (=> b!181063 m!208507))

(declare-fun m!208509 () Bool)

(assert (=> b!181063 m!208509))

(assert (=> b!181063 m!208509))

(declare-fun m!208511 () Bool)

(assert (=> b!181063 m!208511))

(assert (=> b!181065 m!208509))

(assert (=> b!181065 m!208509))

(assert (=> b!181065 m!208511))

(assert (=> b!180990 d!54219))

(declare-fun d!54221 () Bool)

(assert (=> d!54221 (= (apply!151 lt!89379 lt!89377) (get!2068 (getValueByKey!206 (toList!1147 lt!89379) lt!89377)))))

(declare-fun bs!7371 () Bool)

(assert (= bs!7371 d!54221))

(declare-fun m!208513 () Bool)

(assert (=> bs!7371 m!208513))

(assert (=> bs!7371 m!208513))

(declare-fun m!208515 () Bool)

(assert (=> bs!7371 m!208515))

(assert (=> b!180990 d!54221))

(declare-fun d!54223 () Bool)

(assert (=> d!54223 (= (apply!151 (+!268 lt!89386 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248))) lt!89372) (get!2068 (getValueByKey!206 (toList!1147 (+!268 lt!89386 (tuple2!3355 lt!89382 (minValue!3552 thiss!1248)))) lt!89372)))))

(declare-fun bs!7372 () Bool)

(assert (= bs!7372 d!54223))

(declare-fun m!208517 () Bool)

(assert (=> bs!7372 m!208517))

(assert (=> bs!7372 m!208517))

(declare-fun m!208519 () Bool)

(assert (=> bs!7372 m!208519))

(assert (=> b!180990 d!54223))

(declare-fun d!54225 () Bool)

(assert (=> d!54225 (= (apply!151 (+!268 lt!89383 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248))) lt!89388) (get!2068 (getValueByKey!206 (toList!1147 (+!268 lt!89383 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248)))) lt!89388)))))

(declare-fun bs!7373 () Bool)

(assert (= bs!7373 d!54225))

(declare-fun m!208521 () Bool)

(assert (=> bs!7373 m!208521))

(assert (=> bs!7373 m!208521))

(declare-fun m!208523 () Bool)

(assert (=> bs!7373 m!208523))

(assert (=> b!180990 d!54225))

(declare-fun d!54227 () Bool)

(declare-fun e!119250 () Bool)

(assert (=> d!54227 e!119250))

(declare-fun res!85705 () Bool)

(assert (=> d!54227 (=> (not res!85705) (not e!119250))))

(declare-fun lt!89413 () ListLongMap!2263)

(assert (=> d!54227 (= res!85705 (contains!1231 lt!89413 (_1!1688 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248)))))))

(declare-fun lt!89414 () List!2300)

(assert (=> d!54227 (= lt!89413 (ListLongMap!2264 lt!89414))))

(declare-fun lt!89411 () Unit!5475)

(declare-fun lt!89412 () Unit!5475)

(assert (=> d!54227 (= lt!89411 lt!89412)))

(assert (=> d!54227 (= (getValueByKey!206 lt!89414 (_1!1688 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248)))) (Some!211 (_2!1688 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54227 (= lt!89412 (lemmaContainsTupThenGetReturnValue!111 lt!89414 (_1!1688 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248))) (_2!1688 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54227 (= lt!89414 (insertStrictlySorted!114 (toList!1147 lt!89379) (_1!1688 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248))) (_2!1688 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54227 (= (+!268 lt!89379 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248))) lt!89413)))

(declare-fun b!181066 () Bool)

(declare-fun res!85704 () Bool)

(assert (=> b!181066 (=> (not res!85704) (not e!119250))))

(assert (=> b!181066 (= res!85704 (= (getValueByKey!206 (toList!1147 lt!89413) (_1!1688 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248)))) (Some!211 (_2!1688 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248))))))))

(declare-fun b!181067 () Bool)

(assert (=> b!181067 (= e!119250 (contains!1234 (toList!1147 lt!89413) (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248))))))

(assert (= (and d!54227 res!85705) b!181066))

(assert (= (and b!181066 res!85704) b!181067))

(declare-fun m!208525 () Bool)

(assert (=> d!54227 m!208525))

(declare-fun m!208527 () Bool)

(assert (=> d!54227 m!208527))

(declare-fun m!208529 () Bool)

(assert (=> d!54227 m!208529))

(declare-fun m!208531 () Bool)

(assert (=> d!54227 m!208531))

(declare-fun m!208533 () Bool)

(assert (=> b!181066 m!208533))

(declare-fun m!208535 () Bool)

(assert (=> b!181067 m!208535))

(assert (=> b!180990 d!54227))

(declare-fun d!54229 () Bool)

(declare-fun e!119251 () Bool)

(assert (=> d!54229 e!119251))

(declare-fun res!85707 () Bool)

(assert (=> d!54229 (=> (not res!85707) (not e!119251))))

(declare-fun lt!89417 () ListLongMap!2263)

(assert (=> d!54229 (= res!85707 (contains!1231 lt!89417 (_1!1688 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248)))))))

(declare-fun lt!89418 () List!2300)

(assert (=> d!54229 (= lt!89417 (ListLongMap!2264 lt!89418))))

(declare-fun lt!89415 () Unit!5475)

(declare-fun lt!89416 () Unit!5475)

(assert (=> d!54229 (= lt!89415 lt!89416)))

(assert (=> d!54229 (= (getValueByKey!206 lt!89418 (_1!1688 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248)))) (Some!211 (_2!1688 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54229 (= lt!89416 (lemmaContainsTupThenGetReturnValue!111 lt!89418 (_1!1688 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248))) (_2!1688 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54229 (= lt!89418 (insertStrictlySorted!114 (toList!1147 lt!89381) (_1!1688 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248))) (_2!1688 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248)))))))

(assert (=> d!54229 (= (+!268 lt!89381 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248))) lt!89417)))

(declare-fun b!181068 () Bool)

(declare-fun res!85706 () Bool)

(assert (=> b!181068 (=> (not res!85706) (not e!119251))))

(assert (=> b!181068 (= res!85706 (= (getValueByKey!206 (toList!1147 lt!89417) (_1!1688 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248)))) (Some!211 (_2!1688 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248))))))))

(declare-fun b!181069 () Bool)

(assert (=> b!181069 (= e!119251 (contains!1234 (toList!1147 lt!89417) (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248))))))

(assert (= (and d!54229 res!85707) b!181068))

(assert (= (and b!181068 res!85706) b!181069))

(declare-fun m!208537 () Bool)

(assert (=> d!54229 m!208537))

(declare-fun m!208539 () Bool)

(assert (=> d!54229 m!208539))

(declare-fun m!208541 () Bool)

(assert (=> d!54229 m!208541))

(declare-fun m!208543 () Bool)

(assert (=> d!54229 m!208543))

(declare-fun m!208545 () Bool)

(assert (=> b!181068 m!208545))

(declare-fun m!208547 () Bool)

(assert (=> b!181069 m!208547))

(assert (=> b!180990 d!54229))

(declare-fun d!54231 () Bool)

(assert (=> d!54231 (= (apply!151 lt!89386 lt!89372) (get!2068 (getValueByKey!206 (toList!1147 lt!89386) lt!89372)))))

(declare-fun bs!7374 () Bool)

(assert (= bs!7374 d!54231))

(declare-fun m!208549 () Bool)

(assert (=> bs!7374 m!208549))

(assert (=> bs!7374 m!208549))

(declare-fun m!208551 () Bool)

(assert (=> bs!7374 m!208551))

(assert (=> b!180990 d!54231))

(declare-fun d!54233 () Bool)

(assert (=> d!54233 (= (apply!151 (+!268 lt!89379 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248))) lt!89377) (get!2068 (getValueByKey!206 (toList!1147 (+!268 lt!89379 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248)))) lt!89377)))))

(declare-fun bs!7375 () Bool)

(assert (= bs!7375 d!54233))

(declare-fun m!208553 () Bool)

(assert (=> bs!7375 m!208553))

(assert (=> bs!7375 m!208553))

(declare-fun m!208555 () Bool)

(assert (=> bs!7375 m!208555))

(assert (=> b!180990 d!54233))

(declare-fun d!54235 () Bool)

(assert (=> d!54235 (contains!1231 (+!268 lt!89381 (tuple2!3355 lt!89387 (zeroValue!3552 thiss!1248))) lt!89384)))

(declare-fun lt!89421 () Unit!5475)

(declare-fun choose!969 (ListLongMap!2263 (_ BitVec 64) V!5305 (_ BitVec 64)) Unit!5475)

(assert (=> d!54235 (= lt!89421 (choose!969 lt!89381 lt!89387 (zeroValue!3552 thiss!1248) lt!89384))))

(assert (=> d!54235 (contains!1231 lt!89381 lt!89384)))

(assert (=> d!54235 (= (addStillContains!127 lt!89381 lt!89387 (zeroValue!3552 thiss!1248) lt!89384) lt!89421)))

(declare-fun bs!7376 () Bool)

(assert (= bs!7376 d!54235))

(assert (=> bs!7376 m!208435))

(assert (=> bs!7376 m!208435))

(assert (=> bs!7376 m!208455))

(declare-fun m!208557 () Bool)

(assert (=> bs!7376 m!208557))

(declare-fun m!208559 () Bool)

(assert (=> bs!7376 m!208559))

(assert (=> b!180990 d!54235))

(declare-fun d!54237 () Bool)

(assert (=> d!54237 (= (apply!151 (+!268 lt!89379 (tuple2!3355 lt!89367 (zeroValue!3552 thiss!1248))) lt!89377) (apply!151 lt!89379 lt!89377))))

(declare-fun lt!89422 () Unit!5475)

(assert (=> d!54237 (= lt!89422 (choose!968 lt!89379 lt!89367 (zeroValue!3552 thiss!1248) lt!89377))))

(declare-fun e!119252 () Bool)

(assert (=> d!54237 e!119252))

(declare-fun res!85708 () Bool)

(assert (=> d!54237 (=> (not res!85708) (not e!119252))))

(assert (=> d!54237 (= res!85708 (contains!1231 lt!89379 lt!89377))))

(assert (=> d!54237 (= (addApplyDifferent!127 lt!89379 lt!89367 (zeroValue!3552 thiss!1248) lt!89377) lt!89422)))

(declare-fun b!181071 () Bool)

(assert (=> b!181071 (= e!119252 (not (= lt!89377 lt!89367)))))

(assert (= (and d!54237 res!85708) b!181071))

(declare-fun m!208561 () Bool)

(assert (=> d!54237 m!208561))

(assert (=> d!54237 m!208425))

(assert (=> d!54237 m!208431))

(assert (=> d!54237 m!208425))

(assert (=> d!54237 m!208437))

(declare-fun m!208563 () Bool)

(assert (=> d!54237 m!208563))

(assert (=> b!180990 d!54237))

(declare-fun d!54239 () Bool)

(assert (=> d!54239 (= (apply!151 lt!89383 lt!89388) (get!2068 (getValueByKey!206 (toList!1147 lt!89383) lt!89388)))))

(declare-fun bs!7377 () Bool)

(assert (= bs!7377 d!54239))

(declare-fun m!208565 () Bool)

(assert (=> bs!7377 m!208565))

(assert (=> bs!7377 m!208565))

(declare-fun m!208567 () Bool)

(assert (=> bs!7377 m!208567))

(assert (=> b!180990 d!54239))

(declare-fun b!181096 () Bool)

(declare-fun e!119270 () Bool)

(assert (=> b!181096 (= e!119270 (validKeyInArray!0 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181096 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!181097 () Bool)

(declare-fun e!119271 () ListLongMap!2263)

(declare-fun call!18292 () ListLongMap!2263)

(assert (=> b!181097 (= e!119271 call!18292)))

(declare-fun b!181098 () Bool)

(declare-fun res!85718 () Bool)

(declare-fun e!119272 () Bool)

(assert (=> b!181098 (=> (not res!85718) (not e!119272))))

(declare-fun lt!89443 () ListLongMap!2263)

(assert (=> b!181098 (= res!85718 (not (contains!1231 lt!89443 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181100 () Bool)

(declare-fun lt!89441 () Unit!5475)

(declare-fun lt!89440 () Unit!5475)

(assert (=> b!181100 (= lt!89441 lt!89440)))

(declare-fun lt!89437 () V!5305)

(declare-fun lt!89442 () (_ BitVec 64))

(declare-fun lt!89439 () (_ BitVec 64))

(declare-fun lt!89438 () ListLongMap!2263)

(assert (=> b!181100 (not (contains!1231 (+!268 lt!89438 (tuple2!3355 lt!89442 lt!89437)) lt!89439))))

(declare-fun addStillNotContains!83 (ListLongMap!2263 (_ BitVec 64) V!5305 (_ BitVec 64)) Unit!5475)

(assert (=> b!181100 (= lt!89440 (addStillNotContains!83 lt!89438 lt!89442 lt!89437 lt!89439))))

(assert (=> b!181100 (= lt!89439 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!181100 (= lt!89437 (get!2067 (select (arr!3617 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!181100 (= lt!89442 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181100 (= lt!89438 call!18292)))

(assert (=> b!181100 (= e!119271 (+!268 call!18292 (tuple2!3355 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000) (get!2067 (select (arr!3617 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!181101 () Bool)

(declare-fun e!119268 () Bool)

(declare-fun e!119273 () Bool)

(assert (=> b!181101 (= e!119268 e!119273)))

(assert (=> b!181101 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(declare-fun res!85720 () Bool)

(assert (=> b!181101 (= res!85720 (contains!1231 lt!89443 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181101 (=> (not res!85720) (not e!119273))))

(declare-fun b!181102 () Bool)

(declare-fun e!119269 () Bool)

(assert (=> b!181102 (= e!119269 (= lt!89443 (getCurrentListMapNoExtraKeys!172 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3711 thiss!1248))))))

(declare-fun b!181103 () Bool)

(declare-fun e!119267 () ListLongMap!2263)

(assert (=> b!181103 (= e!119267 (ListLongMap!2264 Nil!2297))))

(declare-fun b!181104 () Bool)

(assert (=> b!181104 (= e!119267 e!119271)))

(declare-fun c!32455 () Bool)

(assert (=> b!181104 (= c!32455 (validKeyInArray!0 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181105 () Bool)

(declare-fun isEmpty!462 (ListLongMap!2263) Bool)

(assert (=> b!181105 (= e!119269 (isEmpty!462 lt!89443))))

(declare-fun b!181106 () Bool)

(assert (=> b!181106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(assert (=> b!181106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3927 (_values!3694 thiss!1248))))))

(assert (=> b!181106 (= e!119273 (= (apply!151 lt!89443 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)) (get!2067 (select (arr!3617 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!54241 () Bool)

(assert (=> d!54241 e!119272))

(declare-fun res!85717 () Bool)

(assert (=> d!54241 (=> (not res!85717) (not e!119272))))

(assert (=> d!54241 (= res!85717 (not (contains!1231 lt!89443 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54241 (= lt!89443 e!119267)))

(declare-fun c!32453 () Bool)

(assert (=> d!54241 (= c!32453 (bvsge #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(assert (=> d!54241 (validMask!0 (mask!8723 thiss!1248))))

(assert (=> d!54241 (= (getCurrentListMapNoExtraKeys!172 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)) lt!89443)))

(declare-fun b!181099 () Bool)

(assert (=> b!181099 (= e!119268 e!119269)))

(declare-fun c!32454 () Bool)

(assert (=> b!181099 (= c!32454 (bvslt #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(declare-fun b!181107 () Bool)

(assert (=> b!181107 (= e!119272 e!119268)))

(declare-fun c!32456 () Bool)

(assert (=> b!181107 (= c!32456 e!119270)))

(declare-fun res!85719 () Bool)

(assert (=> b!181107 (=> (not res!85719) (not e!119270))))

(assert (=> b!181107 (= res!85719 (bvslt #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(declare-fun bm!18289 () Bool)

(assert (=> bm!18289 (= call!18292 (getCurrentListMapNoExtraKeys!172 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3711 thiss!1248)))))

(assert (= (and d!54241 c!32453) b!181103))

(assert (= (and d!54241 (not c!32453)) b!181104))

(assert (= (and b!181104 c!32455) b!181100))

(assert (= (and b!181104 (not c!32455)) b!181097))

(assert (= (or b!181100 b!181097) bm!18289))

(assert (= (and d!54241 res!85717) b!181098))

(assert (= (and b!181098 res!85718) b!181107))

(assert (= (and b!181107 res!85719) b!181096))

(assert (= (and b!181107 c!32456) b!181101))

(assert (= (and b!181107 (not c!32456)) b!181099))

(assert (= (and b!181101 res!85720) b!181106))

(assert (= (and b!181099 c!32454) b!181102))

(assert (= (and b!181099 (not c!32454)) b!181105))

(declare-fun b_lambda!7121 () Bool)

(assert (=> (not b_lambda!7121) (not b!181100)))

(assert (=> b!181100 t!7147))

(declare-fun b_and!10995 () Bool)

(assert (= b_and!10993 (and (=> t!7147 result!4709) b_and!10995)))

(declare-fun b_lambda!7123 () Bool)

(assert (=> (not b_lambda!7123) (not b!181106)))

(assert (=> b!181106 t!7147))

(declare-fun b_and!10997 () Bool)

(assert (= b_and!10995 (and (=> t!7147 result!4709) b_and!10997)))

(declare-fun m!208569 () Bool)

(assert (=> b!181102 m!208569))

(assert (=> b!181106 m!208417))

(assert (=> b!181106 m!208415))

(assert (=> b!181106 m!208411))

(assert (=> b!181106 m!208415))

(assert (=> b!181106 m!208417))

(assert (=> b!181106 m!208419))

(assert (=> b!181106 m!208411))

(declare-fun m!208571 () Bool)

(assert (=> b!181106 m!208571))

(assert (=> b!181100 m!208415))

(assert (=> b!181100 m!208417))

(assert (=> b!181100 m!208419))

(declare-fun m!208573 () Bool)

(assert (=> b!181100 m!208573))

(declare-fun m!208575 () Bool)

(assert (=> b!181100 m!208575))

(assert (=> b!181100 m!208573))

(assert (=> b!181100 m!208417))

(declare-fun m!208577 () Bool)

(assert (=> b!181100 m!208577))

(declare-fun m!208579 () Bool)

(assert (=> b!181100 m!208579))

(assert (=> b!181100 m!208415))

(assert (=> b!181100 m!208411))

(assert (=> b!181101 m!208411))

(assert (=> b!181101 m!208411))

(declare-fun m!208581 () Bool)

(assert (=> b!181101 m!208581))

(assert (=> b!181096 m!208411))

(assert (=> b!181096 m!208411))

(assert (=> b!181096 m!208461))

(assert (=> bm!18289 m!208569))

(declare-fun m!208583 () Bool)

(assert (=> b!181105 m!208583))

(assert (=> b!181104 m!208411))

(assert (=> b!181104 m!208411))

(assert (=> b!181104 m!208461))

(declare-fun m!208585 () Bool)

(assert (=> d!54241 m!208585))

(assert (=> d!54241 m!208351))

(declare-fun m!208587 () Bool)

(assert (=> b!181098 m!208587))

(assert (=> b!180990 d!54241))

(declare-fun d!54243 () Bool)

(assert (=> d!54243 (= (apply!151 (+!268 lt!89383 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248))) lt!89388) (apply!151 lt!89383 lt!89388))))

(declare-fun lt!89444 () Unit!5475)

(assert (=> d!54243 (= lt!89444 (choose!968 lt!89383 lt!89374 (minValue!3552 thiss!1248) lt!89388))))

(declare-fun e!119274 () Bool)

(assert (=> d!54243 e!119274))

(declare-fun res!85721 () Bool)

(assert (=> d!54243 (=> (not res!85721) (not e!119274))))

(assert (=> d!54243 (= res!85721 (contains!1231 lt!89383 lt!89388))))

(assert (=> d!54243 (= (addApplyDifferent!127 lt!89383 lt!89374 (minValue!3552 thiss!1248) lt!89388) lt!89444)))

(declare-fun b!181108 () Bool)

(assert (=> b!181108 (= e!119274 (not (= lt!89388 lt!89374)))))

(assert (= (and d!54243 res!85721) b!181108))

(declare-fun m!208589 () Bool)

(assert (=> d!54243 m!208589))

(assert (=> d!54243 m!208439))

(assert (=> d!54243 m!208445))

(assert (=> d!54243 m!208439))

(assert (=> d!54243 m!208443))

(declare-fun m!208591 () Bool)

(assert (=> d!54243 m!208591))

(assert (=> b!180990 d!54243))

(declare-fun d!54245 () Bool)

(declare-fun e!119275 () Bool)

(assert (=> d!54245 e!119275))

(declare-fun res!85723 () Bool)

(assert (=> d!54245 (=> (not res!85723) (not e!119275))))

(declare-fun lt!89447 () ListLongMap!2263)

(assert (=> d!54245 (= res!85723 (contains!1231 lt!89447 (_1!1688 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248)))))))

(declare-fun lt!89448 () List!2300)

(assert (=> d!54245 (= lt!89447 (ListLongMap!2264 lt!89448))))

(declare-fun lt!89445 () Unit!5475)

(declare-fun lt!89446 () Unit!5475)

(assert (=> d!54245 (= lt!89445 lt!89446)))

(assert (=> d!54245 (= (getValueByKey!206 lt!89448 (_1!1688 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248)))) (Some!211 (_2!1688 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248)))))))

(assert (=> d!54245 (= lt!89446 (lemmaContainsTupThenGetReturnValue!111 lt!89448 (_1!1688 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248))) (_2!1688 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248)))))))

(assert (=> d!54245 (= lt!89448 (insertStrictlySorted!114 (toList!1147 lt!89383) (_1!1688 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248))) (_2!1688 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248)))))))

(assert (=> d!54245 (= (+!268 lt!89383 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248))) lt!89447)))

(declare-fun b!181109 () Bool)

(declare-fun res!85722 () Bool)

(assert (=> b!181109 (=> (not res!85722) (not e!119275))))

(assert (=> b!181109 (= res!85722 (= (getValueByKey!206 (toList!1147 lt!89447) (_1!1688 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248)))) (Some!211 (_2!1688 (tuple2!3355 lt!89374 (minValue!3552 thiss!1248))))))))

(declare-fun b!181110 () Bool)

(assert (=> b!181110 (= e!119275 (contains!1234 (toList!1147 lt!89447) (tuple2!3355 lt!89374 (minValue!3552 thiss!1248))))))

(assert (= (and d!54245 res!85723) b!181109))

(assert (= (and b!181109 res!85722) b!181110))

(declare-fun m!208593 () Bool)

(assert (=> d!54245 m!208593))

(declare-fun m!208595 () Bool)

(assert (=> d!54245 m!208595))

(declare-fun m!208597 () Bool)

(assert (=> d!54245 m!208597))

(declare-fun m!208599 () Bool)

(assert (=> d!54245 m!208599))

(declare-fun m!208601 () Bool)

(assert (=> b!181109 m!208601))

(declare-fun m!208603 () Bool)

(assert (=> b!181110 m!208603))

(assert (=> b!180990 d!54245))

(declare-fun d!54247 () Bool)

(declare-fun e!119276 () Bool)

(assert (=> d!54247 e!119276))

(declare-fun res!85724 () Bool)

(assert (=> d!54247 (=> res!85724 e!119276)))

(declare-fun lt!89452 () Bool)

(assert (=> d!54247 (= res!85724 (not lt!89452))))

(declare-fun lt!89450 () Bool)

(assert (=> d!54247 (= lt!89452 lt!89450)))

(declare-fun lt!89451 () Unit!5475)

(declare-fun e!119277 () Unit!5475)

(assert (=> d!54247 (= lt!89451 e!119277)))

(declare-fun c!32457 () Bool)

(assert (=> d!54247 (= c!32457 lt!89450)))

(assert (=> d!54247 (= lt!89450 (containsKey!210 (toList!1147 lt!89380) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54247 (= (contains!1231 lt!89380 #b0000000000000000000000000000000000000000000000000000000000000000) lt!89452)))

(declare-fun b!181111 () Bool)

(declare-fun lt!89449 () Unit!5475)

(assert (=> b!181111 (= e!119277 lt!89449)))

(assert (=> b!181111 (= lt!89449 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1147 lt!89380) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181111 (isDefined!160 (getValueByKey!206 (toList!1147 lt!89380) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181112 () Bool)

(declare-fun Unit!5480 () Unit!5475)

(assert (=> b!181112 (= e!119277 Unit!5480)))

(declare-fun b!181113 () Bool)

(assert (=> b!181113 (= e!119276 (isDefined!160 (getValueByKey!206 (toList!1147 lt!89380) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54247 c!32457) b!181111))

(assert (= (and d!54247 (not c!32457)) b!181112))

(assert (= (and d!54247 (not res!85724)) b!181113))

(declare-fun m!208605 () Bool)

(assert (=> d!54247 m!208605))

(declare-fun m!208607 () Bool)

(assert (=> b!181111 m!208607))

(declare-fun m!208609 () Bool)

(assert (=> b!181111 m!208609))

(assert (=> b!181111 m!208609))

(declare-fun m!208611 () Bool)

(assert (=> b!181111 m!208611))

(assert (=> b!181113 m!208609))

(assert (=> b!181113 m!208609))

(assert (=> b!181113 m!208611))

(assert (=> bm!18283 d!54247))

(declare-fun d!54249 () Bool)

(assert (=> d!54249 (= (apply!151 lt!89380 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)) (get!2068 (getValueByKey!206 (toList!1147 lt!89380) (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7378 () Bool)

(assert (= bs!7378 d!54249))

(assert (=> bs!7378 m!208411))

(declare-fun m!208613 () Bool)

(assert (=> bs!7378 m!208613))

(assert (=> bs!7378 m!208613))

(declare-fun m!208615 () Bool)

(assert (=> bs!7378 m!208615))

(assert (=> b!180981 d!54249))

(declare-fun d!54251 () Bool)

(declare-fun c!32460 () Bool)

(assert (=> d!54251 (= c!32460 ((_ is ValueCellFull!1778) (select (arr!3617 (_values!3694 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119280 () V!5305)

(assert (=> d!54251 (= (get!2067 (select (arr!3617 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119280)))

(declare-fun b!181118 () Bool)

(declare-fun get!2069 (ValueCell!1778 V!5305) V!5305)

(assert (=> b!181118 (= e!119280 (get!2069 (select (arr!3617 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181119 () Bool)

(declare-fun get!2070 (ValueCell!1778 V!5305) V!5305)

(assert (=> b!181119 (= e!119280 (get!2070 (select (arr!3617 (_values!3694 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3711 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54251 c!32460) b!181118))

(assert (= (and d!54251 (not c!32460)) b!181119))

(assert (=> b!181118 m!208415))

(assert (=> b!181118 m!208417))

(declare-fun m!208617 () Bool)

(assert (=> b!181118 m!208617))

(assert (=> b!181119 m!208415))

(assert (=> b!181119 m!208417))

(declare-fun m!208619 () Bool)

(assert (=> b!181119 m!208619))

(assert (=> b!180981 d!54251))

(declare-fun d!54253 () Bool)

(assert (=> d!54253 (isDefined!160 (getValueByKey!206 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(declare-fun lt!89455 () Unit!5475)

(declare-fun choose!970 (List!2300 (_ BitVec 64)) Unit!5475)

(assert (=> d!54253 (= lt!89455 (choose!970 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(declare-fun e!119283 () Bool)

(assert (=> d!54253 e!119283))

(declare-fun res!85727 () Bool)

(assert (=> d!54253 (=> (not res!85727) (not e!119283))))

(declare-fun isStrictlySorted!337 (List!2300) Bool)

(assert (=> d!54253 (= res!85727 (isStrictlySorted!337 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))))))

(assert (=> d!54253 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828) lt!89455)))

(declare-fun b!181122 () Bool)

(assert (=> b!181122 (= e!119283 (containsKey!210 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828))))

(assert (= (and d!54253 res!85727) b!181122))

(assert (=> d!54253 m!208405))

(assert (=> d!54253 m!208405))

(assert (=> d!54253 m!208407))

(declare-fun m!208621 () Bool)

(assert (=> d!54253 m!208621))

(declare-fun m!208623 () Bool)

(assert (=> d!54253 m!208623))

(assert (=> b!181122 m!208401))

(assert (=> b!180932 d!54253))

(assert (=> b!180932 d!54209))

(assert (=> b!180932 d!54211))

(declare-fun e!119291 () SeekEntryResult!605)

(declare-fun b!181135 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181135 (= e!119291 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19782 lt!89308) #b00000000000000000000000000000001) (nextIndex!0 (index!4592 lt!89308) (x!19782 lt!89308) (mask!8723 thiss!1248)) (index!4592 lt!89308) key!828 (_keys!5608 thiss!1248) (mask!8723 thiss!1248)))))

(declare-fun lt!89460 () SeekEntryResult!605)

(declare-fun d!54255 () Bool)

(assert (=> d!54255 (and (or ((_ is Undefined!605) lt!89460) (not ((_ is Found!605) lt!89460)) (and (bvsge (index!4591 lt!89460) #b00000000000000000000000000000000) (bvslt (index!4591 lt!89460) (size!3926 (_keys!5608 thiss!1248))))) (or ((_ is Undefined!605) lt!89460) ((_ is Found!605) lt!89460) (not ((_ is MissingVacant!605) lt!89460)) (not (= (index!4593 lt!89460) (index!4592 lt!89308))) (and (bvsge (index!4593 lt!89460) #b00000000000000000000000000000000) (bvslt (index!4593 lt!89460) (size!3926 (_keys!5608 thiss!1248))))) (or ((_ is Undefined!605) lt!89460) (ite ((_ is Found!605) lt!89460) (= (select (arr!3616 (_keys!5608 thiss!1248)) (index!4591 lt!89460)) key!828) (and ((_ is MissingVacant!605) lt!89460) (= (index!4593 lt!89460) (index!4592 lt!89308)) (= (select (arr!3616 (_keys!5608 thiss!1248)) (index!4593 lt!89460)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!119290 () SeekEntryResult!605)

(assert (=> d!54255 (= lt!89460 e!119290)))

(declare-fun c!32467 () Bool)

(assert (=> d!54255 (= c!32467 (bvsge (x!19782 lt!89308) #b01111111111111111111111111111110))))

(declare-fun lt!89461 () (_ BitVec 64))

(assert (=> d!54255 (= lt!89461 (select (arr!3616 (_keys!5608 thiss!1248)) (index!4592 lt!89308)))))

(assert (=> d!54255 (validMask!0 (mask!8723 thiss!1248))))

(assert (=> d!54255 (= (seekKeyOrZeroReturnVacant!0 (x!19782 lt!89308) (index!4592 lt!89308) (index!4592 lt!89308) key!828 (_keys!5608 thiss!1248) (mask!8723 thiss!1248)) lt!89460)))

(declare-fun b!181136 () Bool)

(declare-fun c!32469 () Bool)

(assert (=> b!181136 (= c!32469 (= lt!89461 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119292 () SeekEntryResult!605)

(assert (=> b!181136 (= e!119292 e!119291)))

(declare-fun b!181137 () Bool)

(assert (=> b!181137 (= e!119290 Undefined!605)))

(declare-fun b!181138 () Bool)

(assert (=> b!181138 (= e!119290 e!119292)))

(declare-fun c!32468 () Bool)

(assert (=> b!181138 (= c!32468 (= lt!89461 key!828))))

(declare-fun b!181139 () Bool)

(assert (=> b!181139 (= e!119292 (Found!605 (index!4592 lt!89308)))))

(declare-fun b!181140 () Bool)

(assert (=> b!181140 (= e!119291 (MissingVacant!605 (index!4592 lt!89308)))))

(assert (= (and d!54255 c!32467) b!181137))

(assert (= (and d!54255 (not c!32467)) b!181138))

(assert (= (and b!181138 c!32468) b!181139))

(assert (= (and b!181138 (not c!32468)) b!181136))

(assert (= (and b!181136 c!32469) b!181140))

(assert (= (and b!181136 (not c!32469)) b!181135))

(declare-fun m!208625 () Bool)

(assert (=> b!181135 m!208625))

(assert (=> b!181135 m!208625))

(declare-fun m!208627 () Bool)

(assert (=> b!181135 m!208627))

(declare-fun m!208629 () Bool)

(assert (=> d!54255 m!208629))

(declare-fun m!208631 () Bool)

(assert (=> d!54255 m!208631))

(assert (=> d!54255 m!208399))

(assert (=> d!54255 m!208351))

(assert (=> b!180922 d!54255))

(declare-fun d!54257 () Bool)

(declare-fun e!119293 () Bool)

(assert (=> d!54257 e!119293))

(declare-fun res!85728 () Bool)

(assert (=> d!54257 (=> res!85728 e!119293)))

(declare-fun lt!89465 () Bool)

(assert (=> d!54257 (= res!85728 (not lt!89465))))

(declare-fun lt!89463 () Bool)

(assert (=> d!54257 (= lt!89465 lt!89463)))

(declare-fun lt!89464 () Unit!5475)

(declare-fun e!119294 () Unit!5475)

(assert (=> d!54257 (= lt!89464 e!119294)))

(declare-fun c!32470 () Bool)

(assert (=> d!54257 (= c!32470 lt!89463)))

(assert (=> d!54257 (= lt!89463 (containsKey!210 (toList!1147 lt!89380) (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54257 (= (contains!1231 lt!89380 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)) lt!89465)))

(declare-fun b!181141 () Bool)

(declare-fun lt!89462 () Unit!5475)

(assert (=> b!181141 (= e!119294 lt!89462)))

(assert (=> b!181141 (= lt!89462 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1147 lt!89380) (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181141 (isDefined!160 (getValueByKey!206 (toList!1147 lt!89380) (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181142 () Bool)

(declare-fun Unit!5481 () Unit!5475)

(assert (=> b!181142 (= e!119294 Unit!5481)))

(declare-fun b!181143 () Bool)

(assert (=> b!181143 (= e!119293 (isDefined!160 (getValueByKey!206 (toList!1147 lt!89380) (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54257 c!32470) b!181141))

(assert (= (and d!54257 (not c!32470)) b!181142))

(assert (= (and d!54257 (not res!85728)) b!181143))

(assert (=> d!54257 m!208411))

(declare-fun m!208633 () Bool)

(assert (=> d!54257 m!208633))

(assert (=> b!181141 m!208411))

(declare-fun m!208635 () Bool)

(assert (=> b!181141 m!208635))

(assert (=> b!181141 m!208411))

(assert (=> b!181141 m!208613))

(assert (=> b!181141 m!208613))

(declare-fun m!208637 () Bool)

(assert (=> b!181141 m!208637))

(assert (=> b!181143 m!208411))

(assert (=> b!181143 m!208613))

(assert (=> b!181143 m!208613))

(assert (=> b!181143 m!208637))

(assert (=> b!180989 d!54257))

(declare-fun d!54259 () Bool)

(assert (=> d!54259 (= (apply!151 lt!89380 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2068 (getValueByKey!206 (toList!1147 lt!89380) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7379 () Bool)

(assert (= bs!7379 d!54259))

(assert (=> bs!7379 m!208609))

(assert (=> bs!7379 m!208609))

(declare-fun m!208639 () Bool)

(assert (=> bs!7379 m!208639))

(assert (=> b!180997 d!54259))

(declare-fun d!54261 () Bool)

(assert (=> d!54261 (= (validKeyInArray!0 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180996 d!54261))

(declare-fun d!54263 () Bool)

(declare-fun res!85733 () Bool)

(declare-fun e!119299 () Bool)

(assert (=> d!54263 (=> res!85733 e!119299)))

(assert (=> d!54263 (= res!85733 (and ((_ is Cons!2296) (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) (= (_1!1688 (h!2922 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) key!828)))))

(assert (=> d!54263 (= (containsKey!210 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))) key!828) e!119299)))

(declare-fun b!181148 () Bool)

(declare-fun e!119300 () Bool)

(assert (=> b!181148 (= e!119299 e!119300)))

(declare-fun res!85734 () Bool)

(assert (=> b!181148 (=> (not res!85734) (not e!119300))))

(assert (=> b!181148 (= res!85734 (and (or (not ((_ is Cons!2296) (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) (bvsle (_1!1688 (h!2922 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) key!828)) ((_ is Cons!2296) (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) (bvslt (_1!1688 (h!2922 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248))))) key!828)))))

(declare-fun b!181149 () Bool)

(assert (=> b!181149 (= e!119300 (containsKey!210 (t!7143 (toList!1147 (getCurrentListMap!780 (_keys!5608 thiss!1248) (_values!3694 thiss!1248) (mask!8723 thiss!1248) (extraKeys!3448 thiss!1248) (zeroValue!3552 thiss!1248) (minValue!3552 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3711 thiss!1248)))) key!828))))

(assert (= (and d!54263 (not res!85733)) b!181148))

(assert (= (and b!181148 res!85734) b!181149))

(declare-fun m!208641 () Bool)

(assert (=> b!181149 m!208641))

(assert (=> d!54197 d!54263))

(assert (=> b!180978 d!54261))

(declare-fun d!54265 () Bool)

(declare-fun e!119301 () Bool)

(assert (=> d!54265 e!119301))

(declare-fun res!85736 () Bool)

(assert (=> d!54265 (=> (not res!85736) (not e!119301))))

(declare-fun lt!89468 () ListLongMap!2263)

(assert (=> d!54265 (= res!85736 (contains!1231 lt!89468 (_1!1688 (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))))

(declare-fun lt!89469 () List!2300)

(assert (=> d!54265 (= lt!89468 (ListLongMap!2264 lt!89469))))

(declare-fun lt!89466 () Unit!5475)

(declare-fun lt!89467 () Unit!5475)

(assert (=> d!54265 (= lt!89466 lt!89467)))

(assert (=> d!54265 (= (getValueByKey!206 lt!89469 (_1!1688 (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))) (Some!211 (_2!1688 (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))))

(assert (=> d!54265 (= lt!89467 (lemmaContainsTupThenGetReturnValue!111 lt!89469 (_1!1688 (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))) (_2!1688 (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))))

(assert (=> d!54265 (= lt!89469 (insertStrictlySorted!114 (toList!1147 (ite c!32430 call!18283 (ite c!32428 call!18286 call!18280))) (_1!1688 (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))) (_2!1688 (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))))

(assert (=> d!54265 (= (+!268 (ite c!32430 call!18283 (ite c!32428 call!18286 call!18280)) (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))) lt!89468)))

(declare-fun b!181150 () Bool)

(declare-fun res!85735 () Bool)

(assert (=> b!181150 (=> (not res!85735) (not e!119301))))

(assert (=> b!181150 (= res!85735 (= (getValueByKey!206 (toList!1147 lt!89468) (_1!1688 (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))) (Some!211 (_2!1688 (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))))

(declare-fun b!181151 () Bool)

(assert (=> b!181151 (= e!119301 (contains!1234 (toList!1147 lt!89468) (ite (or c!32430 c!32428) (tuple2!3355 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3552 thiss!1248)) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(assert (= (and d!54265 res!85736) b!181150))

(assert (= (and b!181150 res!85735) b!181151))

(declare-fun m!208643 () Bool)

(assert (=> d!54265 m!208643))

(declare-fun m!208645 () Bool)

(assert (=> d!54265 m!208645))

(declare-fun m!208647 () Bool)

(assert (=> d!54265 m!208647))

(declare-fun m!208649 () Bool)

(assert (=> d!54265 m!208649))

(declare-fun m!208651 () Bool)

(assert (=> b!181150 m!208651))

(declare-fun m!208653 () Bool)

(assert (=> b!181151 m!208653))

(assert (=> bm!18282 d!54265))

(declare-fun bm!18292 () Bool)

(declare-fun call!18295 () Bool)

(declare-fun c!32473 () Bool)

(assert (=> bm!18292 (= call!18295 (arrayNoDuplicates!0 (_keys!5608 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32473 (Cons!2299 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000) Nil!2300) Nil!2300)))))

(declare-fun b!181162 () Bool)

(declare-fun e!119312 () Bool)

(assert (=> b!181162 (= e!119312 call!18295)))

(declare-fun b!181163 () Bool)

(declare-fun e!119310 () Bool)

(assert (=> b!181163 (= e!119310 e!119312)))

(assert (=> b!181163 (= c!32473 (validKeyInArray!0 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181165 () Bool)

(assert (=> b!181165 (= e!119312 call!18295)))

(declare-fun b!181166 () Bool)

(declare-fun e!119313 () Bool)

(assert (=> b!181166 (= e!119313 e!119310)))

(declare-fun res!85744 () Bool)

(assert (=> b!181166 (=> (not res!85744) (not e!119310))))

(declare-fun e!119311 () Bool)

(assert (=> b!181166 (= res!85744 (not e!119311))))

(declare-fun res!85745 () Bool)

(assert (=> b!181166 (=> (not res!85745) (not e!119311))))

(assert (=> b!181166 (= res!85745 (validKeyInArray!0 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181164 () Bool)

(declare-fun contains!1235 (List!2303 (_ BitVec 64)) Bool)

(assert (=> b!181164 (= e!119311 (contains!1235 Nil!2300 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54267 () Bool)

(declare-fun res!85743 () Bool)

(assert (=> d!54267 (=> res!85743 e!119313)))

(assert (=> d!54267 (= res!85743 (bvsge #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(assert (=> d!54267 (= (arrayNoDuplicates!0 (_keys!5608 thiss!1248) #b00000000000000000000000000000000 Nil!2300) e!119313)))

(assert (= (and d!54267 (not res!85743)) b!181166))

(assert (= (and b!181166 res!85745) b!181164))

(assert (= (and b!181166 res!85744) b!181163))

(assert (= (and b!181163 c!32473) b!181162))

(assert (= (and b!181163 (not c!32473)) b!181165))

(assert (= (or b!181162 b!181165) bm!18292))

(assert (=> bm!18292 m!208411))

(declare-fun m!208655 () Bool)

(assert (=> bm!18292 m!208655))

(assert (=> b!181163 m!208411))

(assert (=> b!181163 m!208411))

(assert (=> b!181163 m!208461))

(assert (=> b!181166 m!208411))

(assert (=> b!181166 m!208411))

(assert (=> b!181166 m!208461))

(assert (=> b!181164 m!208411))

(assert (=> b!181164 m!208411))

(declare-fun m!208657 () Bool)

(assert (=> b!181164 m!208657))

(assert (=> b!181008 d!54267))

(declare-fun d!54269 () Bool)

(declare-fun e!119314 () Bool)

(assert (=> d!54269 e!119314))

(declare-fun res!85746 () Bool)

(assert (=> d!54269 (=> res!85746 e!119314)))

(declare-fun lt!89473 () Bool)

(assert (=> d!54269 (= res!85746 (not lt!89473))))

(declare-fun lt!89471 () Bool)

(assert (=> d!54269 (= lt!89473 lt!89471)))

(declare-fun lt!89472 () Unit!5475)

(declare-fun e!119315 () Unit!5475)

(assert (=> d!54269 (= lt!89472 e!119315)))

(declare-fun c!32474 () Bool)

(assert (=> d!54269 (= c!32474 lt!89471)))

(assert (=> d!54269 (= lt!89471 (containsKey!210 (toList!1147 lt!89380) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54269 (= (contains!1231 lt!89380 #b1000000000000000000000000000000000000000000000000000000000000000) lt!89473)))

(declare-fun b!181167 () Bool)

(declare-fun lt!89470 () Unit!5475)

(assert (=> b!181167 (= e!119315 lt!89470)))

(assert (=> b!181167 (= lt!89470 (lemmaContainsKeyImpliesGetValueByKeyDefined!159 (toList!1147 lt!89380) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181167 (isDefined!160 (getValueByKey!206 (toList!1147 lt!89380) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181168 () Bool)

(declare-fun Unit!5482 () Unit!5475)

(assert (=> b!181168 (= e!119315 Unit!5482)))

(declare-fun b!181169 () Bool)

(assert (=> b!181169 (= e!119314 (isDefined!160 (getValueByKey!206 (toList!1147 lt!89380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54269 c!32474) b!181167))

(assert (= (and d!54269 (not c!32474)) b!181168))

(assert (= (and d!54269 (not res!85746)) b!181169))

(declare-fun m!208659 () Bool)

(assert (=> d!54269 m!208659))

(declare-fun m!208661 () Bool)

(assert (=> b!181167 m!208661))

(assert (=> b!181167 m!208479))

(assert (=> b!181167 m!208479))

(declare-fun m!208663 () Bool)

(assert (=> b!181167 m!208663))

(assert (=> b!181169 m!208479))

(assert (=> b!181169 m!208479))

(assert (=> b!181169 m!208663))

(assert (=> bm!18279 d!54269))

(assert (=> bm!18281 d!54241))

(declare-fun d!54271 () Bool)

(declare-fun e!119316 () Bool)

(assert (=> d!54271 e!119316))

(declare-fun res!85748 () Bool)

(assert (=> d!54271 (=> (not res!85748) (not e!119316))))

(declare-fun lt!89476 () ListLongMap!2263)

(assert (=> d!54271 (= res!85748 (contains!1231 lt!89476 (_1!1688 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(declare-fun lt!89477 () List!2300)

(assert (=> d!54271 (= lt!89476 (ListLongMap!2264 lt!89477))))

(declare-fun lt!89474 () Unit!5475)

(declare-fun lt!89475 () Unit!5475)

(assert (=> d!54271 (= lt!89474 lt!89475)))

(assert (=> d!54271 (= (getValueByKey!206 lt!89477 (_1!1688 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))) (Some!211 (_2!1688 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(assert (=> d!54271 (= lt!89475 (lemmaContainsTupThenGetReturnValue!111 lt!89477 (_1!1688 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))) (_2!1688 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(assert (=> d!54271 (= lt!89477 (insertStrictlySorted!114 (toList!1147 call!18282) (_1!1688 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))) (_2!1688 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))))))

(assert (=> d!54271 (= (+!268 call!18282 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))) lt!89476)))

(declare-fun b!181170 () Bool)

(declare-fun res!85747 () Bool)

(assert (=> b!181170 (=> (not res!85747) (not e!119316))))

(assert (=> b!181170 (= res!85747 (= (getValueByKey!206 (toList!1147 lt!89476) (_1!1688 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248)))) (Some!211 (_2!1688 (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))))

(declare-fun b!181171 () Bool)

(assert (=> b!181171 (= e!119316 (contains!1234 (toList!1147 lt!89476) (tuple2!3355 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3552 thiss!1248))))))

(assert (= (and d!54271 res!85748) b!181170))

(assert (= (and b!181170 res!85747) b!181171))

(declare-fun m!208665 () Bool)

(assert (=> d!54271 m!208665))

(declare-fun m!208667 () Bool)

(assert (=> d!54271 m!208667))

(declare-fun m!208669 () Bool)

(assert (=> d!54271 m!208669))

(declare-fun m!208671 () Bool)

(assert (=> d!54271 m!208671))

(declare-fun m!208673 () Bool)

(assert (=> b!181170 m!208673))

(declare-fun m!208675 () Bool)

(assert (=> b!181171 m!208675))

(assert (=> b!180992 d!54271))

(declare-fun b!181180 () Bool)

(declare-fun e!119323 () Bool)

(declare-fun e!119325 () Bool)

(assert (=> b!181180 (= e!119323 e!119325)))

(declare-fun c!32477 () Bool)

(assert (=> b!181180 (= c!32477 (validKeyInArray!0 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181181 () Bool)

(declare-fun e!119324 () Bool)

(assert (=> b!181181 (= e!119325 e!119324)))

(declare-fun lt!89484 () (_ BitVec 64))

(assert (=> b!181181 (= lt!89484 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89486 () Unit!5475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7643 (_ BitVec 64) (_ BitVec 32)) Unit!5475)

(assert (=> b!181181 (= lt!89486 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5608 thiss!1248) lt!89484 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!181181 (arrayContainsKey!0 (_keys!5608 thiss!1248) lt!89484 #b00000000000000000000000000000000)))

(declare-fun lt!89485 () Unit!5475)

(assert (=> b!181181 (= lt!89485 lt!89486)))

(declare-fun res!85753 () Bool)

(assert (=> b!181181 (= res!85753 (= (seekEntryOrOpen!0 (select (arr!3616 (_keys!5608 thiss!1248)) #b00000000000000000000000000000000) (_keys!5608 thiss!1248) (mask!8723 thiss!1248)) (Found!605 #b00000000000000000000000000000000)))))

(assert (=> b!181181 (=> (not res!85753) (not e!119324))))

(declare-fun bm!18295 () Bool)

(declare-fun call!18298 () Bool)

(assert (=> bm!18295 (= call!18298 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5608 thiss!1248) (mask!8723 thiss!1248)))))

(declare-fun b!181182 () Bool)

(assert (=> b!181182 (= e!119324 call!18298)))

(declare-fun d!54273 () Bool)

(declare-fun res!85754 () Bool)

(assert (=> d!54273 (=> res!85754 e!119323)))

(assert (=> d!54273 (= res!85754 (bvsge #b00000000000000000000000000000000 (size!3926 (_keys!5608 thiss!1248))))))

(assert (=> d!54273 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5608 thiss!1248) (mask!8723 thiss!1248)) e!119323)))

(declare-fun b!181183 () Bool)

(assert (=> b!181183 (= e!119325 call!18298)))

(assert (= (and d!54273 (not res!85754)) b!181180))

(assert (= (and b!181180 c!32477) b!181181))

(assert (= (and b!181180 (not c!32477)) b!181183))

(assert (= (and b!181181 res!85753) b!181182))

(assert (= (or b!181182 b!181183) bm!18295))

(assert (=> b!181180 m!208411))

(assert (=> b!181180 m!208411))

(assert (=> b!181180 m!208461))

(assert (=> b!181181 m!208411))

(declare-fun m!208677 () Bool)

(assert (=> b!181181 m!208677))

(declare-fun m!208679 () Bool)

(assert (=> b!181181 m!208679))

(assert (=> b!181181 m!208411))

(declare-fun m!208681 () Bool)

(assert (=> b!181181 m!208681))

(declare-fun m!208683 () Bool)

(assert (=> bm!18295 m!208683))

(assert (=> b!181007 d!54273))

(declare-fun b!181202 () Bool)

(declare-fun e!119336 () SeekEntryResult!605)

(assert (=> b!181202 (= e!119336 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8723 thiss!1248)) #b00000000000000000000000000000000 (mask!8723 thiss!1248)) key!828 (_keys!5608 thiss!1248) (mask!8723 thiss!1248)))))

(declare-fun d!54275 () Bool)

(declare-fun e!119339 () Bool)

(assert (=> d!54275 e!119339))

(declare-fun c!32486 () Bool)

(declare-fun lt!89491 () SeekEntryResult!605)

(assert (=> d!54275 (= c!32486 (and ((_ is Intermediate!605) lt!89491) (undefined!1417 lt!89491)))))

(declare-fun e!119338 () SeekEntryResult!605)

(assert (=> d!54275 (= lt!89491 e!119338)))

(declare-fun c!32485 () Bool)

(assert (=> d!54275 (= c!32485 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!89492 () (_ BitVec 64))

(assert (=> d!54275 (= lt!89492 (select (arr!3616 (_keys!5608 thiss!1248)) (toIndex!0 key!828 (mask!8723 thiss!1248))))))

(assert (=> d!54275 (validMask!0 (mask!8723 thiss!1248))))

(assert (=> d!54275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8723 thiss!1248)) key!828 (_keys!5608 thiss!1248) (mask!8723 thiss!1248)) lt!89491)))

(declare-fun b!181203 () Bool)

(assert (=> b!181203 (and (bvsge (index!4592 lt!89491) #b00000000000000000000000000000000) (bvslt (index!4592 lt!89491) (size!3926 (_keys!5608 thiss!1248))))))

(declare-fun res!85761 () Bool)

(assert (=> b!181203 (= res!85761 (= (select (arr!3616 (_keys!5608 thiss!1248)) (index!4592 lt!89491)) key!828))))

(declare-fun e!119337 () Bool)

(assert (=> b!181203 (=> res!85761 e!119337)))

(declare-fun e!119340 () Bool)

(assert (=> b!181203 (= e!119340 e!119337)))

(declare-fun b!181204 () Bool)

(assert (=> b!181204 (= e!119338 (Intermediate!605 true (toIndex!0 key!828 (mask!8723 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181205 () Bool)

(assert (=> b!181205 (and (bvsge (index!4592 lt!89491) #b00000000000000000000000000000000) (bvslt (index!4592 lt!89491) (size!3926 (_keys!5608 thiss!1248))))))

(declare-fun res!85763 () Bool)

(assert (=> b!181205 (= res!85763 (= (select (arr!3616 (_keys!5608 thiss!1248)) (index!4592 lt!89491)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181205 (=> res!85763 e!119337)))

(declare-fun b!181206 () Bool)

(assert (=> b!181206 (and (bvsge (index!4592 lt!89491) #b00000000000000000000000000000000) (bvslt (index!4592 lt!89491) (size!3926 (_keys!5608 thiss!1248))))))

(assert (=> b!181206 (= e!119337 (= (select (arr!3616 (_keys!5608 thiss!1248)) (index!4592 lt!89491)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181207 () Bool)

(assert (=> b!181207 (= e!119338 e!119336)))

(declare-fun c!32484 () Bool)

(assert (=> b!181207 (= c!32484 (or (= lt!89492 key!828) (= (bvadd lt!89492 lt!89492) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181208 () Bool)

(assert (=> b!181208 (= e!119339 (bvsge (x!19782 lt!89491) #b01111111111111111111111111111110))))

(declare-fun b!181209 () Bool)

(assert (=> b!181209 (= e!119336 (Intermediate!605 false (toIndex!0 key!828 (mask!8723 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!181210 () Bool)

(assert (=> b!181210 (= e!119339 e!119340)))

(declare-fun res!85762 () Bool)

(assert (=> b!181210 (= res!85762 (and ((_ is Intermediate!605) lt!89491) (not (undefined!1417 lt!89491)) (bvslt (x!19782 lt!89491) #b01111111111111111111111111111110) (bvsge (x!19782 lt!89491) #b00000000000000000000000000000000) (bvsge (x!19782 lt!89491) #b00000000000000000000000000000000)))))

(assert (=> b!181210 (=> (not res!85762) (not e!119340))))

(assert (= (and d!54275 c!32485) b!181204))

(assert (= (and d!54275 (not c!32485)) b!181207))

(assert (= (and b!181207 c!32484) b!181209))

(assert (= (and b!181207 (not c!32484)) b!181202))

(assert (= (and d!54275 c!32486) b!181208))

(assert (= (and d!54275 (not c!32486)) b!181210))

(assert (= (and b!181210 res!85762) b!181203))

(assert (= (and b!181203 (not res!85761)) b!181205))

(assert (= (and b!181205 (not res!85763)) b!181206))

(declare-fun m!208685 () Bool)

(assert (=> b!181206 m!208685))

(assert (=> b!181203 m!208685))

(assert (=> b!181205 m!208685))

(assert (=> d!54275 m!208387))

(declare-fun m!208687 () Bool)

(assert (=> d!54275 m!208687))

(assert (=> d!54275 m!208351))

(assert (=> b!181202 m!208387))

(declare-fun m!208689 () Bool)

(assert (=> b!181202 m!208689))

(assert (=> b!181202 m!208689))

(declare-fun m!208691 () Bool)

(assert (=> b!181202 m!208691))

(assert (=> d!54195 d!54275))

(declare-fun d!54277 () Bool)

(declare-fun lt!89498 () (_ BitVec 32))

(declare-fun lt!89497 () (_ BitVec 32))

(assert (=> d!54277 (= lt!89498 (bvmul (bvxor lt!89497 (bvlshr lt!89497 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54277 (= lt!89497 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54277 (and (bvsge (mask!8723 thiss!1248) #b00000000000000000000000000000000) (let ((res!85764 (let ((h!2926 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19802 (bvmul (bvxor h!2926 (bvlshr h!2926 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19802 (bvlshr x!19802 #b00000000000000000000000000001101)) (mask!8723 thiss!1248)))))) (and (bvslt res!85764 (bvadd (mask!8723 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!85764 #b00000000000000000000000000000000))))))

(assert (=> d!54277 (= (toIndex!0 key!828 (mask!8723 thiss!1248)) (bvand (bvxor lt!89498 (bvlshr lt!89498 #b00000000000000000000000000001101)) (mask!8723 thiss!1248)))))

(assert (=> d!54195 d!54277))

(assert (=> d!54195 d!54203))

(declare-fun b!181211 () Bool)

(declare-fun e!119341 () Bool)

(assert (=> b!181211 (= e!119341 tp_is_empty!4243)))

(declare-fun b!181212 () Bool)

(declare-fun e!119342 () Bool)

(assert (=> b!181212 (= e!119342 tp_is_empty!4243)))

(declare-fun mapNonEmpty!7281 () Bool)

(declare-fun mapRes!7281 () Bool)

(declare-fun tp!16173 () Bool)

(assert (=> mapNonEmpty!7281 (= mapRes!7281 (and tp!16173 e!119341))))

(declare-fun mapValue!7281 () ValueCell!1778)

(declare-fun mapKey!7281 () (_ BitVec 32))

(declare-fun mapRest!7281 () (Array (_ BitVec 32) ValueCell!1778))

(assert (=> mapNonEmpty!7281 (= mapRest!7280 (store mapRest!7281 mapKey!7281 mapValue!7281))))

(declare-fun condMapEmpty!7281 () Bool)

(declare-fun mapDefault!7281 () ValueCell!1778)

(assert (=> mapNonEmpty!7280 (= condMapEmpty!7281 (= mapRest!7280 ((as const (Array (_ BitVec 32) ValueCell!1778)) mapDefault!7281)))))

(assert (=> mapNonEmpty!7280 (= tp!16172 (and e!119342 mapRes!7281))))

(declare-fun mapIsEmpty!7281 () Bool)

(assert (=> mapIsEmpty!7281 mapRes!7281))

(assert (= (and mapNonEmpty!7280 condMapEmpty!7281) mapIsEmpty!7281))

(assert (= (and mapNonEmpty!7280 (not condMapEmpty!7281)) mapNonEmpty!7281))

(assert (= (and mapNonEmpty!7281 ((_ is ValueCellFull!1778) mapValue!7281)) b!181211))

(assert (= (and mapNonEmpty!7280 ((_ is ValueCellFull!1778) mapDefault!7281)) b!181212))

(declare-fun m!208693 () Bool)

(assert (=> mapNonEmpty!7281 m!208693))

(declare-fun b_lambda!7125 () Bool)

(assert (= b_lambda!7123 (or (and b!180845 b_free!4471) b_lambda!7125)))

(declare-fun b_lambda!7127 () Bool)

(assert (= b_lambda!7121 (or (and b!180845 b_free!4471) b_lambda!7127)))

(check-sat (not d!54247) (not b!181039) (not b!181104) (not b!181098) (not b!181050) (not d!54209) (not b!181096) (not b!181164) (not d!54219) (not b!181181) (not b!181119) (not b!181150) (not b!181106) (not b!181101) (not d!54233) (not d!54253) (not d!54217) (not d!54227) (not d!54259) (not b!181202) (not d!54245) (not bm!18295) (not b!181141) (not mapNonEmpty!7281) (not b_next!4471) (not b!181169) (not b!181166) (not b!181065) (not bm!18292) (not d!54269) (not b!181109) (not d!54229) (not d!54235) (not d!54255) (not b!181069) (not bm!18286) (not d!54207) (not b!181180) (not b!181100) (not b!181151) (not b!181051) (not b!181063) (not d!54225) (not b!181135) (not d!54231) (not b_lambda!7127) (not b!181068) (not b!181110) (not bm!18289) (not d!54265) (not b!181061) (not b_lambda!7125) (not d!54215) tp_is_empty!4243 (not b!181028) (not d!54221) (not b!181149) (not b!181111) (not b!181171) (not b!181062) (not b!181163) (not b!181066) (not d!54271) (not b!181102) (not b!181113) (not d!54241) (not b!181143) (not d!54243) (not d!54237) (not d!54223) (not b!181118) (not b!181105) b_and!10997 (not b!181170) (not d!54257) (not d!54239) (not b!181122) (not b_lambda!7119) (not b!181067) (not d!54249) (not d!54213) (not d!54275) (not b!181167))
(check-sat b_and!10997 (not b_next!4471))
