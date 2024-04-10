; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18596 () Bool)

(assert start!18596)

(declare-fun b!184109 () Bool)

(declare-fun b_free!4539 () Bool)

(declare-fun b_next!4539 () Bool)

(assert (=> b!184109 (= b_free!4539 (not b_next!4539))))

(declare-fun tp!16395 () Bool)

(declare-fun b_and!11121 () Bool)

(assert (=> b!184109 (= tp!16395 b_and!11121)))

(declare-datatypes ((V!5395 0))(
  ( (V!5396 (val!2200 Int)) )
))
(declare-datatypes ((ValueCell!1812 0))(
  ( (ValueCellFull!1812 (v!4105 V!5395)) (EmptyCell!1812) )
))
(declare-datatypes ((array!7819 0))(
  ( (array!7820 (arr!3695 (Array (_ BitVec 32) (_ BitVec 64))) (size!4009 (_ BitVec 32))) )
))
(declare-datatypes ((array!7821 0))(
  ( (array!7822 (arr!3696 (Array (_ BitVec 32) ValueCell!1812)) (size!4010 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2532 0))(
  ( (LongMapFixedSize!2533 (defaultEntry!3760 Int) (mask!8838 (_ BitVec 32)) (extraKeys!3497 (_ BitVec 32)) (zeroValue!3601 V!5395) (minValue!3601 V!5395) (_size!1315 (_ BitVec 32)) (_keys!5686 array!7819) (_values!3743 array!7821) (_vacant!1315 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2532)

(declare-fun e!121194 () Bool)

(declare-fun tp_is_empty!4311 () Bool)

(declare-fun e!121195 () Bool)

(declare-fun array_inv!2391 (array!7819) Bool)

(declare-fun array_inv!2392 (array!7821) Bool)

(assert (=> b!184109 (= e!121195 (and tp!16395 tp_is_empty!4311 (array_inv!2391 (_keys!5686 thiss!1248)) (array_inv!2392 (_values!3743 thiss!1248)) e!121194))))

(declare-fun res!87119 () Bool)

(declare-fun e!121191 () Bool)

(assert (=> start!18596 (=> (not res!87119) (not e!121191))))

(declare-fun valid!1048 (LongMapFixedSize!2532) Bool)

(assert (=> start!18596 (= res!87119 (valid!1048 thiss!1248))))

(assert (=> start!18596 e!121191))

(assert (=> start!18596 e!121195))

(assert (=> start!18596 true))

(declare-fun b!184110 () Bool)

(declare-fun e!121193 () Bool)

(assert (=> b!184110 (= e!121193 (and (= (size!4010 (_values!3743 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8838 thiss!1248))) (= (size!4009 (_keys!5686 thiss!1248)) (size!4010 (_values!3743 thiss!1248))) (bvslt (mask!8838 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!184111 () Bool)

(declare-fun e!121197 () Bool)

(assert (=> b!184111 (= e!121197 tp_is_empty!4311)))

(declare-fun mapNonEmpty!7408 () Bool)

(declare-fun mapRes!7408 () Bool)

(declare-fun tp!16396 () Bool)

(declare-fun e!121192 () Bool)

(assert (=> mapNonEmpty!7408 (= mapRes!7408 (and tp!16396 e!121192))))

(declare-fun mapValue!7408 () ValueCell!1812)

(declare-fun mapKey!7408 () (_ BitVec 32))

(declare-fun mapRest!7408 () (Array (_ BitVec 32) ValueCell!1812))

(assert (=> mapNonEmpty!7408 (= (arr!3696 (_values!3743 thiss!1248)) (store mapRest!7408 mapKey!7408 mapValue!7408))))

(declare-fun b!184112 () Bool)

(assert (=> b!184112 (= e!121191 e!121193)))

(declare-fun res!87120 () Bool)

(assert (=> b!184112 (=> (not res!87120) (not e!121193))))

(declare-datatypes ((SeekEntryResult!625 0))(
  ( (MissingZero!625 (index!4670 (_ BitVec 32))) (Found!625 (index!4671 (_ BitVec 32))) (Intermediate!625 (undefined!1437 Bool) (index!4672 (_ BitVec 32)) (x!20031 (_ BitVec 32))) (Undefined!625) (MissingVacant!625 (index!4673 (_ BitVec 32))) )
))
(declare-fun lt!91034 () SeekEntryResult!625)

(get-info :version)

(assert (=> b!184112 (= res!87120 (and (not ((_ is Undefined!625) lt!91034)) (not ((_ is MissingVacant!625) lt!91034)) (not ((_ is MissingZero!625) lt!91034)) ((_ is Found!625) lt!91034)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7819 (_ BitVec 32)) SeekEntryResult!625)

(assert (=> b!184112 (= lt!91034 (seekEntryOrOpen!0 key!828 (_keys!5686 thiss!1248) (mask!8838 thiss!1248)))))

(declare-fun b!184113 () Bool)

(declare-fun res!87121 () Bool)

(assert (=> b!184113 (=> (not res!87121) (not e!121191))))

(assert (=> b!184113 (= res!87121 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184114 () Bool)

(assert (=> b!184114 (= e!121192 tp_is_empty!4311)))

(declare-fun b!184115 () Bool)

(declare-fun res!87117 () Bool)

(assert (=> b!184115 (=> (not res!87117) (not e!121193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184115 (= res!87117 (validMask!0 (mask!8838 thiss!1248)))))

(declare-fun mapIsEmpty!7408 () Bool)

(assert (=> mapIsEmpty!7408 mapRes!7408))

(declare-fun b!184116 () Bool)

(assert (=> b!184116 (= e!121194 (and e!121197 mapRes!7408))))

(declare-fun condMapEmpty!7408 () Bool)

(declare-fun mapDefault!7408 () ValueCell!1812)

(assert (=> b!184116 (= condMapEmpty!7408 (= (arr!3696 (_values!3743 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1812)) mapDefault!7408)))))

(declare-fun b!184117 () Bool)

(declare-fun res!87118 () Bool)

(assert (=> b!184117 (=> (not res!87118) (not e!121193))))

(declare-datatypes ((tuple2!3428 0))(
  ( (tuple2!3429 (_1!1725 (_ BitVec 64)) (_2!1725 V!5395)) )
))
(declare-datatypes ((List!2343 0))(
  ( (Nil!2340) (Cons!2339 (h!2970 tuple2!3428) (t!7215 List!2343)) )
))
(declare-datatypes ((ListLongMap!2345 0))(
  ( (ListLongMap!2346 (toList!1188 List!2343)) )
))
(declare-fun contains!1278 (ListLongMap!2345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!836 (array!7819 array!7821 (_ BitVec 32) (_ BitVec 32) V!5395 V!5395 (_ BitVec 32) Int) ListLongMap!2345)

(assert (=> b!184117 (= res!87118 (not (contains!1278 (getCurrentListMap!836 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248)) key!828)))))

(assert (= (and start!18596 res!87119) b!184113))

(assert (= (and b!184113 res!87121) b!184112))

(assert (= (and b!184112 res!87120) b!184117))

(assert (= (and b!184117 res!87118) b!184115))

(assert (= (and b!184115 res!87117) b!184110))

(assert (= (and b!184116 condMapEmpty!7408) mapIsEmpty!7408))

(assert (= (and b!184116 (not condMapEmpty!7408)) mapNonEmpty!7408))

(assert (= (and mapNonEmpty!7408 ((_ is ValueCellFull!1812) mapValue!7408)) b!184114))

(assert (= (and b!184116 ((_ is ValueCellFull!1812) mapDefault!7408)) b!184111))

(assert (= b!184109 b!184116))

(assert (= start!18596 b!184109))

(declare-fun m!211559 () Bool)

(assert (=> start!18596 m!211559))

(declare-fun m!211561 () Bool)

(assert (=> b!184109 m!211561))

(declare-fun m!211563 () Bool)

(assert (=> b!184109 m!211563))

(declare-fun m!211565 () Bool)

(assert (=> b!184117 m!211565))

(assert (=> b!184117 m!211565))

(declare-fun m!211567 () Bool)

(assert (=> b!184117 m!211567))

(declare-fun m!211569 () Bool)

(assert (=> b!184115 m!211569))

(declare-fun m!211571 () Bool)

(assert (=> b!184112 m!211571))

(declare-fun m!211573 () Bool)

(assert (=> mapNonEmpty!7408 m!211573))

(check-sat (not b!184109) (not b!184115) (not b!184117) tp_is_empty!4311 b_and!11121 (not b_next!4539) (not mapNonEmpty!7408) (not start!18596) (not b!184112))
(check-sat b_and!11121 (not b_next!4539))
(get-model)

(declare-fun d!54883 () Bool)

(declare-fun e!121223 () Bool)

(assert (=> d!54883 e!121223))

(declare-fun res!87139 () Bool)

(assert (=> d!54883 (=> res!87139 e!121223)))

(declare-fun lt!91046 () Bool)

(assert (=> d!54883 (= res!87139 (not lt!91046))))

(declare-fun lt!91049 () Bool)

(assert (=> d!54883 (= lt!91046 lt!91049)))

(declare-datatypes ((Unit!5564 0))(
  ( (Unit!5565) )
))
(declare-fun lt!91048 () Unit!5564)

(declare-fun e!121224 () Unit!5564)

(assert (=> d!54883 (= lt!91048 e!121224)))

(declare-fun c!33020 () Bool)

(assert (=> d!54883 (= c!33020 lt!91049)))

(declare-fun containsKey!222 (List!2343 (_ BitVec 64)) Bool)

(assert (=> d!54883 (= lt!91049 (containsKey!222 (toList!1188 (getCurrentListMap!836 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248))) key!828))))

(assert (=> d!54883 (= (contains!1278 (getCurrentListMap!836 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248)) key!828) lt!91046)))

(declare-fun b!184151 () Bool)

(declare-fun lt!91047 () Unit!5564)

(assert (=> b!184151 (= e!121224 lt!91047)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!170 (List!2343 (_ BitVec 64)) Unit!5564)

(assert (=> b!184151 (= lt!91047 (lemmaContainsKeyImpliesGetValueByKeyDefined!170 (toList!1188 (getCurrentListMap!836 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248))) key!828))))

(declare-datatypes ((Option!224 0))(
  ( (Some!223 (v!4107 V!5395)) (None!222) )
))
(declare-fun isDefined!171 (Option!224) Bool)

(declare-fun getValueByKey!218 (List!2343 (_ BitVec 64)) Option!224)

(assert (=> b!184151 (isDefined!171 (getValueByKey!218 (toList!1188 (getCurrentListMap!836 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248))) key!828))))

(declare-fun b!184152 () Bool)

(declare-fun Unit!5566 () Unit!5564)

(assert (=> b!184152 (= e!121224 Unit!5566)))

(declare-fun b!184153 () Bool)

(assert (=> b!184153 (= e!121223 (isDefined!171 (getValueByKey!218 (toList!1188 (getCurrentListMap!836 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248))) key!828)))))

(assert (= (and d!54883 c!33020) b!184151))

(assert (= (and d!54883 (not c!33020)) b!184152))

(assert (= (and d!54883 (not res!87139)) b!184153))

(declare-fun m!211591 () Bool)

(assert (=> d!54883 m!211591))

(declare-fun m!211593 () Bool)

(assert (=> b!184151 m!211593))

(declare-fun m!211595 () Bool)

(assert (=> b!184151 m!211595))

(assert (=> b!184151 m!211595))

(declare-fun m!211597 () Bool)

(assert (=> b!184151 m!211597))

(assert (=> b!184153 m!211595))

(assert (=> b!184153 m!211595))

(assert (=> b!184153 m!211597))

(assert (=> b!184117 d!54883))

(declare-fun b!184196 () Bool)

(declare-fun e!121251 () Unit!5564)

(declare-fun lt!91095 () Unit!5564)

(assert (=> b!184196 (= e!121251 lt!91095)))

(declare-fun lt!91106 () ListLongMap!2345)

(declare-fun getCurrentListMapNoExtraKeys!194 (array!7819 array!7821 (_ BitVec 32) (_ BitVec 32) V!5395 V!5395 (_ BitVec 32) Int) ListLongMap!2345)

(assert (=> b!184196 (= lt!91106 (getCurrentListMapNoExtraKeys!194 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248)))))

(declare-fun lt!91102 () (_ BitVec 64))

(assert (=> b!184196 (= lt!91102 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91115 () (_ BitVec 64))

(assert (=> b!184196 (= lt!91115 (select (arr!3695 (_keys!5686 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91103 () Unit!5564)

(declare-fun addStillContains!137 (ListLongMap!2345 (_ BitVec 64) V!5395 (_ BitVec 64)) Unit!5564)

(assert (=> b!184196 (= lt!91103 (addStillContains!137 lt!91106 lt!91102 (zeroValue!3601 thiss!1248) lt!91115))))

(declare-fun +!281 (ListLongMap!2345 tuple2!3428) ListLongMap!2345)

(assert (=> b!184196 (contains!1278 (+!281 lt!91106 (tuple2!3429 lt!91102 (zeroValue!3601 thiss!1248))) lt!91115)))

(declare-fun lt!91110 () Unit!5564)

(assert (=> b!184196 (= lt!91110 lt!91103)))

(declare-fun lt!91107 () ListLongMap!2345)

(assert (=> b!184196 (= lt!91107 (getCurrentListMapNoExtraKeys!194 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248)))))

(declare-fun lt!91104 () (_ BitVec 64))

(assert (=> b!184196 (= lt!91104 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91114 () (_ BitVec 64))

(assert (=> b!184196 (= lt!91114 (select (arr!3695 (_keys!5686 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91100 () Unit!5564)

(declare-fun addApplyDifferent!137 (ListLongMap!2345 (_ BitVec 64) V!5395 (_ BitVec 64)) Unit!5564)

(assert (=> b!184196 (= lt!91100 (addApplyDifferent!137 lt!91107 lt!91104 (minValue!3601 thiss!1248) lt!91114))))

(declare-fun apply!161 (ListLongMap!2345 (_ BitVec 64)) V!5395)

(assert (=> b!184196 (= (apply!161 (+!281 lt!91107 (tuple2!3429 lt!91104 (minValue!3601 thiss!1248))) lt!91114) (apply!161 lt!91107 lt!91114))))

(declare-fun lt!91097 () Unit!5564)

(assert (=> b!184196 (= lt!91097 lt!91100)))

(declare-fun lt!91109 () ListLongMap!2345)

(assert (=> b!184196 (= lt!91109 (getCurrentListMapNoExtraKeys!194 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248)))))

(declare-fun lt!91112 () (_ BitVec 64))

(assert (=> b!184196 (= lt!91112 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91099 () (_ BitVec 64))

(assert (=> b!184196 (= lt!91099 (select (arr!3695 (_keys!5686 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91096 () Unit!5564)

(assert (=> b!184196 (= lt!91096 (addApplyDifferent!137 lt!91109 lt!91112 (zeroValue!3601 thiss!1248) lt!91099))))

(assert (=> b!184196 (= (apply!161 (+!281 lt!91109 (tuple2!3429 lt!91112 (zeroValue!3601 thiss!1248))) lt!91099) (apply!161 lt!91109 lt!91099))))

(declare-fun lt!91111 () Unit!5564)

(assert (=> b!184196 (= lt!91111 lt!91096)))

(declare-fun lt!91105 () ListLongMap!2345)

(assert (=> b!184196 (= lt!91105 (getCurrentListMapNoExtraKeys!194 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248)))))

(declare-fun lt!91098 () (_ BitVec 64))

(assert (=> b!184196 (= lt!91098 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91108 () (_ BitVec 64))

(assert (=> b!184196 (= lt!91108 (select (arr!3695 (_keys!5686 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184196 (= lt!91095 (addApplyDifferent!137 lt!91105 lt!91098 (minValue!3601 thiss!1248) lt!91108))))

(assert (=> b!184196 (= (apply!161 (+!281 lt!91105 (tuple2!3429 lt!91098 (minValue!3601 thiss!1248))) lt!91108) (apply!161 lt!91105 lt!91108))))

(declare-fun bm!18586 () Bool)

(declare-fun call!18591 () ListLongMap!2345)

(declare-fun call!18593 () ListLongMap!2345)

(assert (=> bm!18586 (= call!18591 call!18593)))

(declare-fun bm!18587 () Bool)

(declare-fun call!18590 () Bool)

(declare-fun lt!91094 () ListLongMap!2345)

(assert (=> bm!18587 (= call!18590 (contains!1278 lt!91094 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!33034 () Bool)

(declare-fun bm!18588 () Bool)

(declare-fun call!18592 () ListLongMap!2345)

(declare-fun c!33033 () Bool)

(declare-fun call!18595 () ListLongMap!2345)

(assert (=> bm!18588 (= call!18592 (+!281 (ite c!33033 call!18595 (ite c!33034 call!18593 call!18591)) (ite (or c!33033 c!33034) (tuple2!3429 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3601 thiss!1248)) (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3601 thiss!1248)))))))

(declare-fun b!184198 () Bool)

(declare-fun e!121257 () Bool)

(declare-fun e!121262 () Bool)

(assert (=> b!184198 (= e!121257 e!121262)))

(declare-fun c!33038 () Bool)

(assert (=> b!184198 (= c!33038 (not (= (bvand (extraKeys!3497 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184199 () Bool)

(declare-fun res!87162 () Bool)

(assert (=> b!184199 (=> (not res!87162) (not e!121257))))

(declare-fun e!121261 () Bool)

(assert (=> b!184199 (= res!87162 e!121261)))

(declare-fun res!87158 () Bool)

(assert (=> b!184199 (=> res!87158 e!121261)))

(declare-fun e!121252 () Bool)

(assert (=> b!184199 (= res!87158 (not e!121252))))

(declare-fun res!87161 () Bool)

(assert (=> b!184199 (=> (not res!87161) (not e!121252))))

(assert (=> b!184199 (= res!87161 (bvslt #b00000000000000000000000000000000 (size!4009 (_keys!5686 thiss!1248))))))

(declare-fun b!184200 () Bool)

(declare-fun c!33037 () Bool)

(assert (=> b!184200 (= c!33037 (and (not (= (bvand (extraKeys!3497 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3497 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!121253 () ListLongMap!2345)

(declare-fun e!121258 () ListLongMap!2345)

(assert (=> b!184200 (= e!121253 e!121258)))

(declare-fun b!184201 () Bool)

(declare-fun res!87164 () Bool)

(assert (=> b!184201 (=> (not res!87164) (not e!121257))))

(declare-fun e!121259 () Bool)

(assert (=> b!184201 (= res!87164 e!121259)))

(declare-fun c!33035 () Bool)

(assert (=> b!184201 (= c!33035 (not (= (bvand (extraKeys!3497 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!184202 () Bool)

(declare-fun e!121263 () ListLongMap!2345)

(assert (=> b!184202 (= e!121263 e!121253)))

(assert (=> b!184202 (= c!33034 (and (not (= (bvand (extraKeys!3497 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3497 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18589 () Bool)

(assert (=> bm!18589 (= call!18595 (getCurrentListMapNoExtraKeys!194 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248)))))

(declare-fun b!184203 () Bool)

(declare-fun e!121260 () Bool)

(assert (=> b!184203 (= e!121260 (= (apply!161 lt!91094 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3601 thiss!1248)))))

(declare-fun b!184204 () Bool)

(declare-fun Unit!5567 () Unit!5564)

(assert (=> b!184204 (= e!121251 Unit!5567)))

(declare-fun b!184205 () Bool)

(declare-fun e!121256 () Bool)

(assert (=> b!184205 (= e!121262 e!121256)))

(declare-fun res!87163 () Bool)

(assert (=> b!184205 (= res!87163 call!18590)))

(assert (=> b!184205 (=> (not res!87163) (not e!121256))))

(declare-fun b!184206 () Bool)

(assert (=> b!184206 (= e!121256 (= (apply!161 lt!91094 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3601 thiss!1248)))))

(declare-fun b!184207 () Bool)

(declare-fun e!121255 () Bool)

(declare-fun get!2120 (ValueCell!1812 V!5395) V!5395)

(declare-fun dynLambda!504 (Int (_ BitVec 64)) V!5395)

(assert (=> b!184207 (= e!121255 (= (apply!161 lt!91094 (select (arr!3695 (_keys!5686 thiss!1248)) #b00000000000000000000000000000000)) (get!2120 (select (arr!3696 (_values!3743 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!504 (defaultEntry!3760 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4010 (_values!3743 thiss!1248))))))

(assert (=> b!184207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4009 (_keys!5686 thiss!1248))))))

(declare-fun b!184208 () Bool)

(declare-fun call!18594 () Bool)

(assert (=> b!184208 (= e!121259 (not call!18594))))

(declare-fun b!184209 () Bool)

(declare-fun e!121254 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!184209 (= e!121254 (validKeyInArray!0 (select (arr!3695 (_keys!5686 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18590 () Bool)

(assert (=> bm!18590 (= call!18594 (contains!1278 lt!91094 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184210 () Bool)

(assert (=> b!184210 (= e!121261 e!121255)))

(declare-fun res!87160 () Bool)

(assert (=> b!184210 (=> (not res!87160) (not e!121255))))

(assert (=> b!184210 (= res!87160 (contains!1278 lt!91094 (select (arr!3695 (_keys!5686 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184210 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4009 (_keys!5686 thiss!1248))))))

(declare-fun b!184197 () Bool)

(assert (=> b!184197 (= e!121262 (not call!18590))))

(declare-fun d!54885 () Bool)

(assert (=> d!54885 e!121257))

(declare-fun res!87166 () Bool)

(assert (=> d!54885 (=> (not res!87166) (not e!121257))))

(assert (=> d!54885 (= res!87166 (or (bvsge #b00000000000000000000000000000000 (size!4009 (_keys!5686 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4009 (_keys!5686 thiss!1248))))))))

(declare-fun lt!91101 () ListLongMap!2345)

(assert (=> d!54885 (= lt!91094 lt!91101)))

(declare-fun lt!91113 () Unit!5564)

(assert (=> d!54885 (= lt!91113 e!121251)))

(declare-fun c!33036 () Bool)

(assert (=> d!54885 (= c!33036 e!121254)))

(declare-fun res!87159 () Bool)

(assert (=> d!54885 (=> (not res!87159) (not e!121254))))

(assert (=> d!54885 (= res!87159 (bvslt #b00000000000000000000000000000000 (size!4009 (_keys!5686 thiss!1248))))))

(assert (=> d!54885 (= lt!91101 e!121263)))

(assert (=> d!54885 (= c!33033 (and (not (= (bvand (extraKeys!3497 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3497 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54885 (validMask!0 (mask!8838 thiss!1248))))

(assert (=> d!54885 (= (getCurrentListMap!836 (_keys!5686 thiss!1248) (_values!3743 thiss!1248) (mask!8838 thiss!1248) (extraKeys!3497 thiss!1248) (zeroValue!3601 thiss!1248) (minValue!3601 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3760 thiss!1248)) lt!91094)))

(declare-fun bm!18591 () Bool)

(assert (=> bm!18591 (= call!18593 call!18595)))

(declare-fun b!184211 () Bool)

(assert (=> b!184211 (= e!121259 e!121260)))

(declare-fun res!87165 () Bool)

(assert (=> b!184211 (= res!87165 call!18594)))

(assert (=> b!184211 (=> (not res!87165) (not e!121260))))

(declare-fun b!184212 () Bool)

(assert (=> b!184212 (= e!121252 (validKeyInArray!0 (select (arr!3695 (_keys!5686 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18592 () Bool)

(declare-fun call!18589 () ListLongMap!2345)

(assert (=> bm!18592 (= call!18589 call!18592)))

(declare-fun b!184213 () Bool)

(assert (=> b!184213 (= e!121258 call!18591)))

(declare-fun b!184214 () Bool)

(assert (=> b!184214 (= e!121253 call!18589)))

(declare-fun b!184215 () Bool)

(assert (=> b!184215 (= e!121263 (+!281 call!18592 (tuple2!3429 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3601 thiss!1248))))))

(declare-fun b!184216 () Bool)

(assert (=> b!184216 (= e!121258 call!18589)))

(assert (= (and d!54885 c!33033) b!184215))

(assert (= (and d!54885 (not c!33033)) b!184202))

(assert (= (and b!184202 c!33034) b!184214))

(assert (= (and b!184202 (not c!33034)) b!184200))

(assert (= (and b!184200 c!33037) b!184216))

(assert (= (and b!184200 (not c!33037)) b!184213))

(assert (= (or b!184216 b!184213) bm!18586))

(assert (= (or b!184214 bm!18586) bm!18591))

(assert (= (or b!184214 b!184216) bm!18592))

(assert (= (or b!184215 bm!18591) bm!18589))

(assert (= (or b!184215 bm!18592) bm!18588))

(assert (= (and d!54885 res!87159) b!184209))

(assert (= (and d!54885 c!33036) b!184196))

(assert (= (and d!54885 (not c!33036)) b!184204))

(assert (= (and d!54885 res!87166) b!184199))

(assert (= (and b!184199 res!87161) b!184212))

(assert (= (and b!184199 (not res!87158)) b!184210))

(assert (= (and b!184210 res!87160) b!184207))

(assert (= (and b!184199 res!87162) b!184201))

(assert (= (and b!184201 c!33035) b!184211))

(assert (= (and b!184201 (not c!33035)) b!184208))

(assert (= (and b!184211 res!87165) b!184203))

(assert (= (or b!184211 b!184208) bm!18590))

(assert (= (and b!184201 res!87164) b!184198))

(assert (= (and b!184198 c!33038) b!184205))

(assert (= (and b!184198 (not c!33038)) b!184197))

(assert (= (and b!184205 res!87163) b!184206))

(assert (= (or b!184205 b!184197) bm!18587))

(declare-fun b_lambda!7215 () Bool)

(assert (=> (not b_lambda!7215) (not b!184207)))

(declare-fun t!7217 () Bool)

(declare-fun tb!2833 () Bool)

(assert (=> (and b!184109 (= (defaultEntry!3760 thiss!1248) (defaultEntry!3760 thiss!1248)) t!7217) tb!2833))

(declare-fun result!4777 () Bool)

(assert (=> tb!2833 (= result!4777 tp_is_empty!4311)))

(assert (=> b!184207 t!7217))

(declare-fun b_and!11125 () Bool)

(assert (= b_and!11121 (and (=> t!7217 result!4777) b_and!11125)))

(declare-fun m!211599 () Bool)

(assert (=> b!184215 m!211599))

(declare-fun m!211601 () Bool)

(assert (=> b!184207 m!211601))

(declare-fun m!211603 () Bool)

(assert (=> b!184207 m!211603))

(declare-fun m!211605 () Bool)

(assert (=> b!184207 m!211605))

(declare-fun m!211607 () Bool)

(assert (=> b!184207 m!211607))

(assert (=> b!184207 m!211601))

(declare-fun m!211609 () Bool)

(assert (=> b!184207 m!211609))

(assert (=> b!184207 m!211607))

(assert (=> b!184207 m!211603))

(declare-fun m!211611 () Bool)

(assert (=> bm!18588 m!211611))

(declare-fun m!211613 () Bool)

(assert (=> b!184206 m!211613))

(declare-fun m!211615 () Bool)

(assert (=> bm!18590 m!211615))

(declare-fun m!211617 () Bool)

(assert (=> bm!18587 m!211617))

(declare-fun m!211619 () Bool)

(assert (=> bm!18589 m!211619))

(declare-fun m!211621 () Bool)

(assert (=> b!184203 m!211621))

(declare-fun m!211623 () Bool)

(assert (=> b!184196 m!211623))

(declare-fun m!211625 () Bool)

(assert (=> b!184196 m!211625))

(declare-fun m!211627 () Bool)

(assert (=> b!184196 m!211627))

(declare-fun m!211629 () Bool)

(assert (=> b!184196 m!211629))

(declare-fun m!211631 () Bool)

(assert (=> b!184196 m!211631))

(declare-fun m!211633 () Bool)

(assert (=> b!184196 m!211633))

(declare-fun m!211635 () Bool)

(assert (=> b!184196 m!211635))

(assert (=> b!184196 m!211629))

(declare-fun m!211637 () Bool)

(assert (=> b!184196 m!211637))

(declare-fun m!211639 () Bool)

(assert (=> b!184196 m!211639))

(declare-fun m!211641 () Bool)

(assert (=> b!184196 m!211641))

(assert (=> b!184196 m!211631))

(declare-fun m!211643 () Bool)

(assert (=> b!184196 m!211643))

(declare-fun m!211645 () Bool)

(assert (=> b!184196 m!211645))

(assert (=> b!184196 m!211603))

(assert (=> b!184196 m!211619))

(declare-fun m!211647 () Bool)

(assert (=> b!184196 m!211647))

(assert (=> b!184196 m!211623))

(declare-fun m!211649 () Bool)

(assert (=> b!184196 m!211649))

(assert (=> b!184196 m!211627))

(declare-fun m!211651 () Bool)

(assert (=> b!184196 m!211651))

(assert (=> b!184212 m!211603))

(assert (=> b!184212 m!211603))

(declare-fun m!211653 () Bool)

(assert (=> b!184212 m!211653))

(assert (=> d!54885 m!211569))

(assert (=> b!184210 m!211603))

(assert (=> b!184210 m!211603))

(declare-fun m!211655 () Bool)

(assert (=> b!184210 m!211655))

(assert (=> b!184209 m!211603))

(assert (=> b!184209 m!211603))

(assert (=> b!184209 m!211653))

(assert (=> b!184117 d!54885))

(declare-fun d!54887 () Bool)

(assert (=> d!54887 (= (array_inv!2391 (_keys!5686 thiss!1248)) (bvsge (size!4009 (_keys!5686 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184109 d!54887))

(declare-fun d!54889 () Bool)

(assert (=> d!54889 (= (array_inv!2392 (_values!3743 thiss!1248)) (bvsge (size!4010 (_values!3743 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184109 d!54889))

(declare-fun b!184231 () Bool)

(declare-fun e!121272 () SeekEntryResult!625)

(declare-fun e!121271 () SeekEntryResult!625)

(assert (=> b!184231 (= e!121272 e!121271)))

(declare-fun lt!91122 () (_ BitVec 64))

(declare-fun lt!91124 () SeekEntryResult!625)

(assert (=> b!184231 (= lt!91122 (select (arr!3695 (_keys!5686 thiss!1248)) (index!4672 lt!91124)))))

(declare-fun c!33045 () Bool)

(assert (=> b!184231 (= c!33045 (= lt!91122 key!828))))

(declare-fun b!184232 () Bool)

(declare-fun e!121270 () SeekEntryResult!625)

(assert (=> b!184232 (= e!121270 (MissingZero!625 (index!4672 lt!91124)))))

(declare-fun b!184233 () Bool)

(assert (=> b!184233 (= e!121272 Undefined!625)))

(declare-fun b!184234 () Bool)

(assert (=> b!184234 (= e!121271 (Found!625 (index!4672 lt!91124)))))

(declare-fun b!184235 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7819 (_ BitVec 32)) SeekEntryResult!625)

(assert (=> b!184235 (= e!121270 (seekKeyOrZeroReturnVacant!0 (x!20031 lt!91124) (index!4672 lt!91124) (index!4672 lt!91124) key!828 (_keys!5686 thiss!1248) (mask!8838 thiss!1248)))))

(declare-fun d!54891 () Bool)

(declare-fun lt!91123 () SeekEntryResult!625)

(assert (=> d!54891 (and (or ((_ is Undefined!625) lt!91123) (not ((_ is Found!625) lt!91123)) (and (bvsge (index!4671 lt!91123) #b00000000000000000000000000000000) (bvslt (index!4671 lt!91123) (size!4009 (_keys!5686 thiss!1248))))) (or ((_ is Undefined!625) lt!91123) ((_ is Found!625) lt!91123) (not ((_ is MissingZero!625) lt!91123)) (and (bvsge (index!4670 lt!91123) #b00000000000000000000000000000000) (bvslt (index!4670 lt!91123) (size!4009 (_keys!5686 thiss!1248))))) (or ((_ is Undefined!625) lt!91123) ((_ is Found!625) lt!91123) ((_ is MissingZero!625) lt!91123) (not ((_ is MissingVacant!625) lt!91123)) (and (bvsge (index!4673 lt!91123) #b00000000000000000000000000000000) (bvslt (index!4673 lt!91123) (size!4009 (_keys!5686 thiss!1248))))) (or ((_ is Undefined!625) lt!91123) (ite ((_ is Found!625) lt!91123) (= (select (arr!3695 (_keys!5686 thiss!1248)) (index!4671 lt!91123)) key!828) (ite ((_ is MissingZero!625) lt!91123) (= (select (arr!3695 (_keys!5686 thiss!1248)) (index!4670 lt!91123)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!625) lt!91123) (= (select (arr!3695 (_keys!5686 thiss!1248)) (index!4673 lt!91123)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54891 (= lt!91123 e!121272)))

(declare-fun c!33047 () Bool)

(assert (=> d!54891 (= c!33047 (and ((_ is Intermediate!625) lt!91124) (undefined!1437 lt!91124)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7819 (_ BitVec 32)) SeekEntryResult!625)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54891 (= lt!91124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8838 thiss!1248)) key!828 (_keys!5686 thiss!1248) (mask!8838 thiss!1248)))))

(assert (=> d!54891 (validMask!0 (mask!8838 thiss!1248))))

(assert (=> d!54891 (= (seekEntryOrOpen!0 key!828 (_keys!5686 thiss!1248) (mask!8838 thiss!1248)) lt!91123)))

(declare-fun b!184236 () Bool)

(declare-fun c!33046 () Bool)

(assert (=> b!184236 (= c!33046 (= lt!91122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184236 (= e!121271 e!121270)))

(assert (= (and d!54891 c!33047) b!184233))

(assert (= (and d!54891 (not c!33047)) b!184231))

(assert (= (and b!184231 c!33045) b!184234))

(assert (= (and b!184231 (not c!33045)) b!184236))

(assert (= (and b!184236 c!33046) b!184232))

(assert (= (and b!184236 (not c!33046)) b!184235))

(declare-fun m!211657 () Bool)

(assert (=> b!184231 m!211657))

(declare-fun m!211659 () Bool)

(assert (=> b!184235 m!211659))

(assert (=> d!54891 m!211569))

(declare-fun m!211661 () Bool)

(assert (=> d!54891 m!211661))

(declare-fun m!211663 () Bool)

(assert (=> d!54891 m!211663))

(declare-fun m!211665 () Bool)

(assert (=> d!54891 m!211665))

(declare-fun m!211667 () Bool)

(assert (=> d!54891 m!211667))

(declare-fun m!211669 () Bool)

(assert (=> d!54891 m!211669))

(assert (=> d!54891 m!211667))

(assert (=> b!184112 d!54891))

(declare-fun d!54893 () Bool)

(assert (=> d!54893 (= (validMask!0 (mask!8838 thiss!1248)) (and (or (= (mask!8838 thiss!1248) #b00000000000000000000000000000111) (= (mask!8838 thiss!1248) #b00000000000000000000000000001111) (= (mask!8838 thiss!1248) #b00000000000000000000000000011111) (= (mask!8838 thiss!1248) #b00000000000000000000000000111111) (= (mask!8838 thiss!1248) #b00000000000000000000000001111111) (= (mask!8838 thiss!1248) #b00000000000000000000000011111111) (= (mask!8838 thiss!1248) #b00000000000000000000000111111111) (= (mask!8838 thiss!1248) #b00000000000000000000001111111111) (= (mask!8838 thiss!1248) #b00000000000000000000011111111111) (= (mask!8838 thiss!1248) #b00000000000000000000111111111111) (= (mask!8838 thiss!1248) #b00000000000000000001111111111111) (= (mask!8838 thiss!1248) #b00000000000000000011111111111111) (= (mask!8838 thiss!1248) #b00000000000000000111111111111111) (= (mask!8838 thiss!1248) #b00000000000000001111111111111111) (= (mask!8838 thiss!1248) #b00000000000000011111111111111111) (= (mask!8838 thiss!1248) #b00000000000000111111111111111111) (= (mask!8838 thiss!1248) #b00000000000001111111111111111111) (= (mask!8838 thiss!1248) #b00000000000011111111111111111111) (= (mask!8838 thiss!1248) #b00000000000111111111111111111111) (= (mask!8838 thiss!1248) #b00000000001111111111111111111111) (= (mask!8838 thiss!1248) #b00000000011111111111111111111111) (= (mask!8838 thiss!1248) #b00000000111111111111111111111111) (= (mask!8838 thiss!1248) #b00000001111111111111111111111111) (= (mask!8838 thiss!1248) #b00000011111111111111111111111111) (= (mask!8838 thiss!1248) #b00000111111111111111111111111111) (= (mask!8838 thiss!1248) #b00001111111111111111111111111111) (= (mask!8838 thiss!1248) #b00011111111111111111111111111111) (= (mask!8838 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8838 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!184115 d!54893))

(declare-fun d!54895 () Bool)

(declare-fun res!87173 () Bool)

(declare-fun e!121275 () Bool)

(assert (=> d!54895 (=> (not res!87173) (not e!121275))))

(declare-fun simpleValid!177 (LongMapFixedSize!2532) Bool)

(assert (=> d!54895 (= res!87173 (simpleValid!177 thiss!1248))))

(assert (=> d!54895 (= (valid!1048 thiss!1248) e!121275)))

(declare-fun b!184243 () Bool)

(declare-fun res!87174 () Bool)

(assert (=> b!184243 (=> (not res!87174) (not e!121275))))

(declare-fun arrayCountValidKeys!0 (array!7819 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184243 (= res!87174 (= (arrayCountValidKeys!0 (_keys!5686 thiss!1248) #b00000000000000000000000000000000 (size!4009 (_keys!5686 thiss!1248))) (_size!1315 thiss!1248)))))

(declare-fun b!184244 () Bool)

(declare-fun res!87175 () Bool)

(assert (=> b!184244 (=> (not res!87175) (not e!121275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7819 (_ BitVec 32)) Bool)

(assert (=> b!184244 (= res!87175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5686 thiss!1248) (mask!8838 thiss!1248)))))

(declare-fun b!184245 () Bool)

(declare-datatypes ((List!2344 0))(
  ( (Nil!2341) (Cons!2340 (h!2971 (_ BitVec 64)) (t!7218 List!2344)) )
))
(declare-fun arrayNoDuplicates!0 (array!7819 (_ BitVec 32) List!2344) Bool)

(assert (=> b!184245 (= e!121275 (arrayNoDuplicates!0 (_keys!5686 thiss!1248) #b00000000000000000000000000000000 Nil!2341))))

(assert (= (and d!54895 res!87173) b!184243))

(assert (= (and b!184243 res!87174) b!184244))

(assert (= (and b!184244 res!87175) b!184245))

(declare-fun m!211671 () Bool)

(assert (=> d!54895 m!211671))

(declare-fun m!211673 () Bool)

(assert (=> b!184243 m!211673))

(declare-fun m!211675 () Bool)

(assert (=> b!184244 m!211675))

(declare-fun m!211677 () Bool)

(assert (=> b!184245 m!211677))

(assert (=> start!18596 d!54895))

(declare-fun b!184252 () Bool)

(declare-fun e!121280 () Bool)

(assert (=> b!184252 (= e!121280 tp_is_empty!4311)))

(declare-fun condMapEmpty!7414 () Bool)

(declare-fun mapDefault!7414 () ValueCell!1812)

(assert (=> mapNonEmpty!7408 (= condMapEmpty!7414 (= mapRest!7408 ((as const (Array (_ BitVec 32) ValueCell!1812)) mapDefault!7414)))))

(declare-fun e!121281 () Bool)

(declare-fun mapRes!7414 () Bool)

(assert (=> mapNonEmpty!7408 (= tp!16396 (and e!121281 mapRes!7414))))

(declare-fun b!184253 () Bool)

(assert (=> b!184253 (= e!121281 tp_is_empty!4311)))

(declare-fun mapIsEmpty!7414 () Bool)

(assert (=> mapIsEmpty!7414 mapRes!7414))

(declare-fun mapNonEmpty!7414 () Bool)

(declare-fun tp!16405 () Bool)

(assert (=> mapNonEmpty!7414 (= mapRes!7414 (and tp!16405 e!121280))))

(declare-fun mapRest!7414 () (Array (_ BitVec 32) ValueCell!1812))

(declare-fun mapKey!7414 () (_ BitVec 32))

(declare-fun mapValue!7414 () ValueCell!1812)

(assert (=> mapNonEmpty!7414 (= mapRest!7408 (store mapRest!7414 mapKey!7414 mapValue!7414))))

(assert (= (and mapNonEmpty!7408 condMapEmpty!7414) mapIsEmpty!7414))

(assert (= (and mapNonEmpty!7408 (not condMapEmpty!7414)) mapNonEmpty!7414))

(assert (= (and mapNonEmpty!7414 ((_ is ValueCellFull!1812) mapValue!7414)) b!184252))

(assert (= (and mapNonEmpty!7408 ((_ is ValueCellFull!1812) mapDefault!7414)) b!184253))

(declare-fun m!211679 () Bool)

(assert (=> mapNonEmpty!7414 m!211679))

(declare-fun b_lambda!7217 () Bool)

(assert (= b_lambda!7215 (or (and b!184109 b_free!4539) b_lambda!7217)))

(check-sat (not bm!18589) (not b!184215) (not bm!18588) (not b_lambda!7217) (not b!184196) (not b!184206) (not b!184235) (not mapNonEmpty!7414) (not d!54883) (not b!184151) (not d!54891) (not bm!18587) (not b!184244) (not b!184153) (not b!184203) (not b!184243) (not d!54885) (not b!184210) (not b!184212) (not b!184245) tp_is_empty!4311 (not b!184207) b_and!11125 (not b!184209) (not bm!18590) (not d!54895) (not b_next!4539))
(check-sat b_and!11125 (not b_next!4539))
