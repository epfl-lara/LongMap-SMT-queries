; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17010 () Bool)

(assert start!17010)

(declare-fun b!170908 () Bool)

(declare-fun b_free!4231 () Bool)

(declare-fun b_next!4231 () Bool)

(assert (=> b!170908 (= b_free!4231 (not b_next!4231))))

(declare-fun tp!15323 () Bool)

(declare-fun b_and!10659 () Bool)

(assert (=> b!170908 (= tp!15323 b_and!10659)))

(declare-fun tp_is_empty!4003 () Bool)

(declare-fun e!112813 () Bool)

(declare-datatypes ((V!4985 0))(
  ( (V!4986 (val!2046 Int)) )
))
(declare-datatypes ((ValueCell!1658 0))(
  ( (ValueCellFull!1658 (v!3912 V!4985)) (EmptyCell!1658) )
))
(declare-datatypes ((array!7105 0))(
  ( (array!7106 (arr!3380 (Array (_ BitVec 32) (_ BitVec 64))) (size!3673 (_ BitVec 32))) )
))
(declare-datatypes ((array!7107 0))(
  ( (array!7108 (arr!3381 (Array (_ BitVec 32) ValueCell!1658)) (size!3674 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2224 0))(
  ( (LongMapFixedSize!2225 (defaultEntry!3554 Int) (mask!8382 (_ BitVec 32)) (extraKeys!3295 (_ BitVec 32)) (zeroValue!3397 V!4985) (minValue!3397 V!4985) (_size!1161 (_ BitVec 32)) (_keys!5386 array!7105) (_values!3537 array!7107) (_vacant!1161 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2224)

(declare-fun e!112815 () Bool)

(declare-fun array_inv!2177 (array!7105) Bool)

(declare-fun array_inv!2178 (array!7107) Bool)

(assert (=> b!170908 (= e!112813 (and tp!15323 tp_is_empty!4003 (array_inv!2177 (_keys!5386 thiss!1248)) (array_inv!2178 (_values!3537 thiss!1248)) e!112815))))

(declare-fun mapNonEmpty!6797 () Bool)

(declare-fun mapRes!6797 () Bool)

(declare-fun tp!15322 () Bool)

(declare-fun e!112816 () Bool)

(assert (=> mapNonEmpty!6797 (= mapRes!6797 (and tp!15322 e!112816))))

(declare-fun mapRest!6797 () (Array (_ BitVec 32) ValueCell!1658))

(declare-fun mapKey!6797 () (_ BitVec 32))

(declare-fun mapValue!6797 () ValueCell!1658)

(assert (=> mapNonEmpty!6797 (= (arr!3381 (_values!3537 thiss!1248)) (store mapRest!6797 mapKey!6797 mapValue!6797))))

(declare-fun b!170909 () Bool)

(declare-fun e!112818 () Bool)

(declare-fun e!112817 () Bool)

(assert (=> b!170909 (= e!112818 (not e!112817))))

(declare-fun res!81251 () Bool)

(assert (=> b!170909 (=> (not res!81251) (not e!112817))))

(declare-fun lt!85094 () LongMapFixedSize!2224)

(declare-fun valid!963 (LongMapFixedSize!2224) Bool)

(assert (=> b!170909 (= res!81251 (valid!963 lt!85094))))

(declare-fun v!309 () V!4985)

(assert (=> b!170909 (= lt!85094 (LongMapFixedSize!2225 (defaultEntry!3554 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (_size!1161 thiss!1248) (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (_vacant!1161 thiss!1248)))))

(declare-datatypes ((tuple2!3198 0))(
  ( (tuple2!3199 (_1!1610 (_ BitVec 64)) (_2!1610 V!4985)) )
))
(declare-datatypes ((List!2176 0))(
  ( (Nil!2173) (Cons!2172 (h!2789 tuple2!3198) (t!6970 List!2176)) )
))
(declare-datatypes ((ListLongMap!2131 0))(
  ( (ListLongMap!2132 (toList!1081 List!2176)) )
))
(declare-fun +!243 (ListLongMap!2131 tuple2!3198) ListLongMap!2131)

(declare-fun getCurrentListMap!737 (array!7105 array!7107 (_ BitVec 32) (_ BitVec 32) V!4985 V!4985 (_ BitVec 32) Int) ListLongMap!2131)

(assert (=> b!170909 (= (+!243 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-datatypes ((Unit!5251 0))(
  ( (Unit!5252) )
))
(declare-fun lt!85095 () Unit!5251)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!85 (array!7105 array!7107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!4985 V!4985 V!4985 Int) Unit!5251)

(assert (=> b!170909 (= lt!85095 (lemmaChangeZeroKeyThenAddPairToListMap!85 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3397 thiss!1248) v!309 (minValue!3397 thiss!1248) (defaultEntry!3554 thiss!1248)))))

(declare-fun b!170910 () Bool)

(declare-fun e!112814 () Bool)

(assert (=> b!170910 (= e!112814 tp_is_empty!4003)))

(declare-fun b!170911 () Bool)

(declare-fun e!112811 () Bool)

(assert (=> b!170911 (= e!112817 e!112811)))

(declare-fun res!81250 () Bool)

(assert (=> b!170911 (=> (not res!81250) (not e!112811))))

(declare-fun lt!85093 () ListLongMap!2131)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1139 (ListLongMap!2131 (_ BitVec 64)) Bool)

(assert (=> b!170911 (= res!81250 (contains!1139 lt!85093 key!828))))

(declare-fun map!1846 (LongMapFixedSize!2224) ListLongMap!2131)

(assert (=> b!170911 (= lt!85093 (map!1846 lt!85094))))

(declare-fun b!170912 () Bool)

(assert (=> b!170912 (= e!112815 (and e!112814 mapRes!6797))))

(declare-fun condMapEmpty!6797 () Bool)

(declare-fun mapDefault!6797 () ValueCell!1658)

(assert (=> b!170912 (= condMapEmpty!6797 (= (arr!3381 (_values!3537 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1658)) mapDefault!6797)))))

(declare-fun b!170913 () Bool)

(assert (=> b!170913 (= e!112816 tp_is_empty!4003)))

(declare-fun b!170914 () Bool)

(declare-fun res!81249 () Bool)

(assert (=> b!170914 (=> (not res!81249) (not e!112818))))

(assert (=> b!170914 (= res!81249 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!6797 () Bool)

(assert (=> mapIsEmpty!6797 mapRes!6797))

(declare-fun res!81252 () Bool)

(assert (=> start!17010 (=> (not res!81252) (not e!112818))))

(assert (=> start!17010 (= res!81252 (valid!963 thiss!1248))))

(assert (=> start!17010 e!112818))

(assert (=> start!17010 e!112813))

(assert (=> start!17010 true))

(assert (=> start!17010 tp_is_empty!4003))

(declare-fun b!170907 () Bool)

(assert (=> b!170907 (= e!112811 (= lt!85093 (+!243 (map!1846 thiss!1248) (tuple2!3199 key!828 v!309))))))

(assert (= (and start!17010 res!81252) b!170914))

(assert (= (and b!170914 res!81249) b!170909))

(assert (= (and b!170909 res!81251) b!170911))

(assert (= (and b!170911 res!81250) b!170907))

(assert (= (and b!170912 condMapEmpty!6797) mapIsEmpty!6797))

(assert (= (and b!170912 (not condMapEmpty!6797)) mapNonEmpty!6797))

(get-info :version)

(assert (= (and mapNonEmpty!6797 ((_ is ValueCellFull!1658) mapValue!6797)) b!170913))

(assert (= (and b!170912 ((_ is ValueCellFull!1658) mapDefault!6797)) b!170910))

(assert (= b!170908 b!170912))

(assert (= start!17010 b!170908))

(declare-fun m!199345 () Bool)

(assert (=> b!170911 m!199345))

(declare-fun m!199347 () Bool)

(assert (=> b!170911 m!199347))

(declare-fun m!199349 () Bool)

(assert (=> b!170907 m!199349))

(assert (=> b!170907 m!199349))

(declare-fun m!199351 () Bool)

(assert (=> b!170907 m!199351))

(declare-fun m!199353 () Bool)

(assert (=> start!17010 m!199353))

(declare-fun m!199355 () Bool)

(assert (=> mapNonEmpty!6797 m!199355))

(declare-fun m!199357 () Bool)

(assert (=> b!170908 m!199357))

(declare-fun m!199359 () Bool)

(assert (=> b!170908 m!199359))

(declare-fun m!199361 () Bool)

(assert (=> b!170909 m!199361))

(declare-fun m!199363 () Bool)

(assert (=> b!170909 m!199363))

(declare-fun m!199365 () Bool)

(assert (=> b!170909 m!199365))

(declare-fun m!199367 () Bool)

(assert (=> b!170909 m!199367))

(assert (=> b!170909 m!199361))

(declare-fun m!199369 () Bool)

(assert (=> b!170909 m!199369))

(check-sat (not b!170911) tp_is_empty!4003 (not start!17010) b_and!10659 (not b!170908) (not b_next!4231) (not b!170909) (not b!170907) (not mapNonEmpty!6797))
(check-sat b_and!10659 (not b_next!4231))
(get-model)

(declare-fun d!51841 () Bool)

(assert (=> d!51841 (= (array_inv!2177 (_keys!5386 thiss!1248)) (bvsge (size!3673 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170908 d!51841))

(declare-fun d!51843 () Bool)

(assert (=> d!51843 (= (array_inv!2178 (_values!3537 thiss!1248)) (bvsge (size!3674 (_values!3537 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170908 d!51843))

(declare-fun d!51845 () Bool)

(declare-fun e!112869 () Bool)

(assert (=> d!51845 e!112869))

(declare-fun res!81282 () Bool)

(assert (=> d!51845 (=> (not res!81282) (not e!112869))))

(declare-fun lt!85122 () ListLongMap!2131)

(assert (=> d!51845 (= res!81282 (contains!1139 lt!85122 (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun lt!85123 () List!2176)

(assert (=> d!51845 (= lt!85122 (ListLongMap!2132 lt!85123))))

(declare-fun lt!85125 () Unit!5251)

(declare-fun lt!85124 () Unit!5251)

(assert (=> d!51845 (= lt!85125 lt!85124)))

(declare-datatypes ((Option!191 0))(
  ( (Some!190 (v!3915 V!4985)) (None!189) )
))
(declare-fun getValueByKey!185 (List!2176 (_ BitVec 64)) Option!191)

(assert (=> d!51845 (= (getValueByKey!185 lt!85123 (_1!1610 (tuple2!3199 key!828 v!309))) (Some!190 (_2!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!98 (List!2176 (_ BitVec 64) V!4985) Unit!5251)

(assert (=> d!51845 (= lt!85124 (lemmaContainsTupThenGetReturnValue!98 lt!85123 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun insertStrictlySorted!101 (List!2176 (_ BitVec 64) V!4985) List!2176)

(assert (=> d!51845 (= lt!85123 (insertStrictlySorted!101 (toList!1081 (map!1846 thiss!1248)) (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))))))

(assert (=> d!51845 (= (+!243 (map!1846 thiss!1248) (tuple2!3199 key!828 v!309)) lt!85122)))

(declare-fun b!170967 () Bool)

(declare-fun res!81281 () Bool)

(assert (=> b!170967 (=> (not res!81281) (not e!112869))))

(assert (=> b!170967 (= res!81281 (= (getValueByKey!185 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))) (Some!190 (_2!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun b!170968 () Bool)

(declare-fun contains!1141 (List!2176 tuple2!3198) Bool)

(assert (=> b!170968 (= e!112869 (contains!1141 (toList!1081 lt!85122) (tuple2!3199 key!828 v!309)))))

(assert (= (and d!51845 res!81282) b!170967))

(assert (= (and b!170967 res!81281) b!170968))

(declare-fun m!199423 () Bool)

(assert (=> d!51845 m!199423))

(declare-fun m!199425 () Bool)

(assert (=> d!51845 m!199425))

(declare-fun m!199427 () Bool)

(assert (=> d!51845 m!199427))

(declare-fun m!199429 () Bool)

(assert (=> d!51845 m!199429))

(declare-fun m!199431 () Bool)

(assert (=> b!170967 m!199431))

(declare-fun m!199433 () Bool)

(assert (=> b!170968 m!199433))

(assert (=> b!170907 d!51845))

(declare-fun d!51847 () Bool)

(assert (=> d!51847 (= (map!1846 thiss!1248) (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun bs!7066 () Bool)

(assert (= bs!7066 d!51847))

(assert (=> bs!7066 m!199361))

(assert (=> b!170907 d!51847))

(declare-fun d!51849 () Bool)

(declare-fun e!112874 () Bool)

(assert (=> d!51849 e!112874))

(declare-fun res!81285 () Bool)

(assert (=> d!51849 (=> res!81285 e!112874)))

(declare-fun lt!85134 () Bool)

(assert (=> d!51849 (= res!81285 (not lt!85134))))

(declare-fun lt!85136 () Bool)

(assert (=> d!51849 (= lt!85134 lt!85136)))

(declare-fun lt!85137 () Unit!5251)

(declare-fun e!112875 () Unit!5251)

(assert (=> d!51849 (= lt!85137 e!112875)))

(declare-fun c!30512 () Bool)

(assert (=> d!51849 (= c!30512 lt!85136)))

(declare-fun containsKey!188 (List!2176 (_ BitVec 64)) Bool)

(assert (=> d!51849 (= lt!85136 (containsKey!188 (toList!1081 lt!85093) key!828))))

(assert (=> d!51849 (= (contains!1139 lt!85093 key!828) lt!85134)))

(declare-fun b!170975 () Bool)

(declare-fun lt!85135 () Unit!5251)

(assert (=> b!170975 (= e!112875 lt!85135)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!136 (List!2176 (_ BitVec 64)) Unit!5251)

(assert (=> b!170975 (= lt!85135 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85093) key!828))))

(declare-fun isDefined!137 (Option!191) Bool)

(assert (=> b!170975 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85093) key!828))))

(declare-fun b!170976 () Bool)

(declare-fun Unit!5255 () Unit!5251)

(assert (=> b!170976 (= e!112875 Unit!5255)))

(declare-fun b!170977 () Bool)

(assert (=> b!170977 (= e!112874 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85093) key!828)))))

(assert (= (and d!51849 c!30512) b!170975))

(assert (= (and d!51849 (not c!30512)) b!170976))

(assert (= (and d!51849 (not res!81285)) b!170977))

(declare-fun m!199435 () Bool)

(assert (=> d!51849 m!199435))

(declare-fun m!199437 () Bool)

(assert (=> b!170975 m!199437))

(declare-fun m!199439 () Bool)

(assert (=> b!170975 m!199439))

(assert (=> b!170975 m!199439))

(declare-fun m!199441 () Bool)

(assert (=> b!170975 m!199441))

(assert (=> b!170977 m!199439))

(assert (=> b!170977 m!199439))

(assert (=> b!170977 m!199441))

(assert (=> b!170911 d!51849))

(declare-fun d!51851 () Bool)

(assert (=> d!51851 (= (map!1846 lt!85094) (getCurrentListMap!737 (_keys!5386 lt!85094) (_values!3537 lt!85094) (mask!8382 lt!85094) (extraKeys!3295 lt!85094) (zeroValue!3397 lt!85094) (minValue!3397 lt!85094) #b00000000000000000000000000000000 (defaultEntry!3554 lt!85094)))))

(declare-fun bs!7067 () Bool)

(assert (= bs!7067 d!51851))

(declare-fun m!199443 () Bool)

(assert (=> bs!7067 m!199443))

(assert (=> b!170911 d!51851))

(declare-fun d!51853 () Bool)

(declare-fun res!81292 () Bool)

(declare-fun e!112878 () Bool)

(assert (=> d!51853 (=> (not res!81292) (not e!112878))))

(declare-fun simpleValid!135 (LongMapFixedSize!2224) Bool)

(assert (=> d!51853 (= res!81292 (simpleValid!135 thiss!1248))))

(assert (=> d!51853 (= (valid!963 thiss!1248) e!112878)))

(declare-fun b!170984 () Bool)

(declare-fun res!81293 () Bool)

(assert (=> b!170984 (=> (not res!81293) (not e!112878))))

(declare-fun arrayCountValidKeys!0 (array!7105 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170984 (= res!81293 (= (arrayCountValidKeys!0 (_keys!5386 thiss!1248) #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))) (_size!1161 thiss!1248)))))

(declare-fun b!170985 () Bool)

(declare-fun res!81294 () Bool)

(assert (=> b!170985 (=> (not res!81294) (not e!112878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7105 (_ BitVec 32)) Bool)

(assert (=> b!170985 (= res!81294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5386 thiss!1248) (mask!8382 thiss!1248)))))

(declare-fun b!170986 () Bool)

(declare-datatypes ((List!2178 0))(
  ( (Nil!2175) (Cons!2174 (h!2791 (_ BitVec 64)) (t!6974 List!2178)) )
))
(declare-fun arrayNoDuplicates!0 (array!7105 (_ BitVec 32) List!2178) Bool)

(assert (=> b!170986 (= e!112878 (arrayNoDuplicates!0 (_keys!5386 thiss!1248) #b00000000000000000000000000000000 Nil!2175))))

(assert (= (and d!51853 res!81292) b!170984))

(assert (= (and b!170984 res!81293) b!170985))

(assert (= (and b!170985 res!81294) b!170986))

(declare-fun m!199445 () Bool)

(assert (=> d!51853 m!199445))

(declare-fun m!199447 () Bool)

(assert (=> b!170984 m!199447))

(declare-fun m!199449 () Bool)

(assert (=> b!170985 m!199449))

(declare-fun m!199451 () Bool)

(assert (=> b!170986 m!199451))

(assert (=> start!17010 d!51853))

(declare-fun b!171029 () Bool)

(declare-fun e!112908 () ListLongMap!2131)

(declare-fun e!112910 () ListLongMap!2131)

(assert (=> b!171029 (= e!112908 e!112910)))

(declare-fun c!30528 () Bool)

(assert (=> b!171029 (= c!30528 (and (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171030 () Bool)

(declare-fun call!17395 () ListLongMap!2131)

(assert (=> b!171030 (= e!112910 call!17395)))

(declare-fun b!171031 () Bool)

(declare-fun e!112917 () Bool)

(declare-fun lt!85199 () ListLongMap!2131)

(declare-fun apply!129 (ListLongMap!2131 (_ BitVec 64)) V!4985)

(declare-fun get!1944 (ValueCell!1658 V!4985) V!4985)

(declare-fun dynLambda!472 (Int (_ BitVec 64)) V!4985)

(assert (=> b!171031 (= e!112917 (= (apply!129 lt!85199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!171031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3674 (_values!3537 thiss!1248))))))

(assert (=> b!171031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun bm!17389 () Bool)

(declare-fun call!17392 () ListLongMap!2131)

(assert (=> bm!17389 (= call!17395 call!17392)))

(declare-fun b!171032 () Bool)

(declare-fun e!112905 () ListLongMap!2131)

(declare-fun call!17393 () ListLongMap!2131)

(assert (=> b!171032 (= e!112905 call!17393)))

(declare-fun b!171033 () Bool)

(declare-fun e!112915 () Bool)

(assert (=> b!171033 (= e!112915 e!112917)))

(declare-fun res!81320 () Bool)

(assert (=> b!171033 (=> (not res!81320) (not e!112917))))

(assert (=> b!171033 (= res!81320 (contains!1139 lt!85199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun bm!17390 () Bool)

(declare-fun call!17398 () ListLongMap!2131)

(declare-fun call!17396 () ListLongMap!2131)

(assert (=> bm!17390 (= call!17398 call!17396)))

(declare-fun b!171034 () Bool)

(declare-fun e!112913 () Bool)

(declare-fun e!112916 () Bool)

(assert (=> b!171034 (= e!112913 e!112916)))

(declare-fun c!30527 () Bool)

(assert (=> b!171034 (= c!30527 (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171035 () Bool)

(declare-fun call!17397 () Bool)

(assert (=> b!171035 (= e!112916 (not call!17397))))

(declare-fun b!171037 () Bool)

(declare-fun res!81316 () Bool)

(assert (=> b!171037 (=> (not res!81316) (not e!112913))))

(assert (=> b!171037 (= res!81316 e!112915)))

(declare-fun res!81313 () Bool)

(assert (=> b!171037 (=> res!81313 e!112915)))

(declare-fun e!112911 () Bool)

(assert (=> b!171037 (= res!81313 (not e!112911))))

(declare-fun res!81319 () Bool)

(assert (=> b!171037 (=> (not res!81319) (not e!112911))))

(assert (=> b!171037 (= res!81319 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171038 () Bool)

(declare-fun e!112912 () Unit!5251)

(declare-fun lt!85194 () Unit!5251)

(assert (=> b!171038 (= e!112912 lt!85194)))

(declare-fun lt!85198 () ListLongMap!2131)

(declare-fun getCurrentListMapNoExtraKeys!160 (array!7105 array!7107 (_ BitVec 32) (_ BitVec 32) V!4985 V!4985 (_ BitVec 32) Int) ListLongMap!2131)

(assert (=> b!171038 (= lt!85198 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!85184 () (_ BitVec 64))

(assert (=> b!171038 (= lt!85184 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85187 () (_ BitVec 64))

(assert (=> b!171038 (= lt!85187 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85195 () Unit!5251)

(declare-fun addStillContains!105 (ListLongMap!2131 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5251)

(assert (=> b!171038 (= lt!85195 (addStillContains!105 lt!85198 lt!85184 v!309 lt!85187))))

(assert (=> b!171038 (contains!1139 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)) lt!85187)))

(declare-fun lt!85186 () Unit!5251)

(assert (=> b!171038 (= lt!85186 lt!85195)))

(declare-fun lt!85201 () ListLongMap!2131)

(assert (=> b!171038 (= lt!85201 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!85203 () (_ BitVec 64))

(assert (=> b!171038 (= lt!85203 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85185 () (_ BitVec 64))

(assert (=> b!171038 (= lt!85185 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85183 () Unit!5251)

(declare-fun addApplyDifferent!105 (ListLongMap!2131 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5251)

(assert (=> b!171038 (= lt!85183 (addApplyDifferent!105 lt!85201 lt!85203 (minValue!3397 thiss!1248) lt!85185))))

(assert (=> b!171038 (= (apply!129 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) lt!85185) (apply!129 lt!85201 lt!85185))))

(declare-fun lt!85188 () Unit!5251)

(assert (=> b!171038 (= lt!85188 lt!85183)))

(declare-fun lt!85202 () ListLongMap!2131)

(assert (=> b!171038 (= lt!85202 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!85200 () (_ BitVec 64))

(assert (=> b!171038 (= lt!85200 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85191 () (_ BitVec 64))

(assert (=> b!171038 (= lt!85191 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85196 () Unit!5251)

(assert (=> b!171038 (= lt!85196 (addApplyDifferent!105 lt!85202 lt!85200 v!309 lt!85191))))

(assert (=> b!171038 (= (apply!129 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309)) lt!85191) (apply!129 lt!85202 lt!85191))))

(declare-fun lt!85192 () Unit!5251)

(assert (=> b!171038 (= lt!85192 lt!85196)))

(declare-fun lt!85190 () ListLongMap!2131)

(assert (=> b!171038 (= lt!85190 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!85189 () (_ BitVec 64))

(assert (=> b!171038 (= lt!85189 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85197 () (_ BitVec 64))

(assert (=> b!171038 (= lt!85197 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!171038 (= lt!85194 (addApplyDifferent!105 lt!85190 lt!85189 (minValue!3397 thiss!1248) lt!85197))))

(assert (=> b!171038 (= (apply!129 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) lt!85197) (apply!129 lt!85190 lt!85197))))

(declare-fun b!171039 () Bool)

(declare-fun Unit!5256 () Unit!5251)

(assert (=> b!171039 (= e!112912 Unit!5256)))

(declare-fun b!171040 () Bool)

(declare-fun e!112907 () Bool)

(declare-fun e!112909 () Bool)

(assert (=> b!171040 (= e!112907 e!112909)))

(declare-fun res!81314 () Bool)

(declare-fun call!17394 () Bool)

(assert (=> b!171040 (= res!81314 call!17394)))

(assert (=> b!171040 (=> (not res!81314) (not e!112909))))

(declare-fun bm!17391 () Bool)

(assert (=> bm!17391 (= call!17393 call!17398)))

(declare-fun b!171041 () Bool)

(declare-fun e!112906 () Bool)

(assert (=> b!171041 (= e!112916 e!112906)))

(declare-fun res!81321 () Bool)

(assert (=> b!171041 (= res!81321 call!17397)))

(assert (=> b!171041 (=> (not res!81321) (not e!112906))))

(declare-fun b!171042 () Bool)

(assert (=> b!171042 (= e!112909 (= (apply!129 lt!85199 #b0000000000000000000000000000000000000000000000000000000000000000) v!309))))

(declare-fun b!171043 () Bool)

(assert (=> b!171043 (= e!112908 (+!243 call!17392 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun b!171044 () Bool)

(declare-fun c!30530 () Bool)

(assert (=> b!171044 (= c!30530 (and (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!171044 (= e!112910 e!112905)))

(declare-fun bm!17392 () Bool)

(assert (=> bm!17392 (= call!17394 (contains!1139 lt!85199 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17393 () Bool)

(assert (=> bm!17393 (= call!17396 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun c!30529 () Bool)

(declare-fun bm!17394 () Bool)

(assert (=> bm!17394 (= call!17392 (+!243 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393)) (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171045 () Bool)

(declare-fun res!81318 () Bool)

(assert (=> b!171045 (=> (not res!81318) (not e!112913))))

(assert (=> b!171045 (= res!81318 e!112907)))

(declare-fun c!30525 () Bool)

(assert (=> b!171045 (= c!30525 (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!51855 () Bool)

(assert (=> d!51855 e!112913))

(declare-fun res!81317 () Bool)

(assert (=> d!51855 (=> (not res!81317) (not e!112913))))

(assert (=> d!51855 (= res!81317 (or (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))))

(declare-fun lt!85182 () ListLongMap!2131)

(assert (=> d!51855 (= lt!85199 lt!85182)))

(declare-fun lt!85193 () Unit!5251)

(assert (=> d!51855 (= lt!85193 e!112912)))

(declare-fun c!30526 () Bool)

(declare-fun e!112914 () Bool)

(assert (=> d!51855 (= c!30526 e!112914)))

(declare-fun res!81315 () Bool)

(assert (=> d!51855 (=> (not res!81315) (not e!112914))))

(assert (=> d!51855 (= res!81315 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!51855 (= lt!85182 e!112908)))

(assert (=> d!51855 (= c!30529 (and (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!51855 (validMask!0 (mask!8382 thiss!1248))))

(assert (=> d!51855 (= (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) lt!85199)))

(declare-fun b!171036 () Bool)

(assert (=> b!171036 (= e!112907 (not call!17394))))

(declare-fun b!171046 () Bool)

(assert (=> b!171046 (= e!112905 call!17395)))

(declare-fun b!171047 () Bool)

(assert (=> b!171047 (= e!112906 (= (apply!129 lt!85199 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3397 thiss!1248)))))

(declare-fun bm!17395 () Bool)

(assert (=> bm!17395 (= call!17397 (contains!1139 lt!85199 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171048 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!171048 (= e!112914 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171049 () Bool)

(assert (=> b!171049 (= e!112911 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51855 c!30529) b!171043))

(assert (= (and d!51855 (not c!30529)) b!171029))

(assert (= (and b!171029 c!30528) b!171030))

(assert (= (and b!171029 (not c!30528)) b!171044))

(assert (= (and b!171044 c!30530) b!171046))

(assert (= (and b!171044 (not c!30530)) b!171032))

(assert (= (or b!171046 b!171032) bm!17391))

(assert (= (or b!171030 bm!17391) bm!17390))

(assert (= (or b!171030 b!171046) bm!17389))

(assert (= (or b!171043 bm!17390) bm!17393))

(assert (= (or b!171043 bm!17389) bm!17394))

(assert (= (and d!51855 res!81315) b!171048))

(assert (= (and d!51855 c!30526) b!171038))

(assert (= (and d!51855 (not c!30526)) b!171039))

(assert (= (and d!51855 res!81317) b!171037))

(assert (= (and b!171037 res!81319) b!171049))

(assert (= (and b!171037 (not res!81313)) b!171033))

(assert (= (and b!171033 res!81320) b!171031))

(assert (= (and b!171037 res!81316) b!171045))

(assert (= (and b!171045 c!30525) b!171040))

(assert (= (and b!171045 (not c!30525)) b!171036))

(assert (= (and b!171040 res!81314) b!171042))

(assert (= (or b!171040 b!171036) bm!17392))

(assert (= (and b!171045 res!81318) b!171034))

(assert (= (and b!171034 c!30527) b!171041))

(assert (= (and b!171034 (not c!30527)) b!171035))

(assert (= (and b!171041 res!81321) b!171047))

(assert (= (or b!171041 b!171035) bm!17395))

(declare-fun b_lambda!6909 () Bool)

(assert (=> (not b_lambda!6909) (not b!171031)))

(declare-fun t!6973 () Bool)

(declare-fun tb!2757 () Bool)

(assert (=> (and b!170908 (= (defaultEntry!3554 thiss!1248) (defaultEntry!3554 thiss!1248)) t!6973) tb!2757))

(declare-fun result!4553 () Bool)

(assert (=> tb!2757 (= result!4553 tp_is_empty!4003)))

(assert (=> b!171031 t!6973))

(declare-fun b_and!10665 () Bool)

(assert (= b_and!10659 (and (=> t!6973 result!4553) b_and!10665)))

(declare-fun m!199453 () Bool)

(assert (=> b!171049 m!199453))

(assert (=> b!171049 m!199453))

(declare-fun m!199455 () Bool)

(assert (=> b!171049 m!199455))

(assert (=> b!171033 m!199453))

(assert (=> b!171033 m!199453))

(declare-fun m!199457 () Bool)

(assert (=> b!171033 m!199457))

(declare-fun m!199459 () Bool)

(assert (=> bm!17394 m!199459))

(declare-fun m!199461 () Bool)

(assert (=> bm!17393 m!199461))

(assert (=> b!171048 m!199453))

(assert (=> b!171048 m!199453))

(assert (=> b!171048 m!199455))

(declare-fun m!199463 () Bool)

(assert (=> bm!17395 m!199463))

(declare-fun m!199465 () Bool)

(assert (=> b!171042 m!199465))

(declare-fun m!199467 () Bool)

(assert (=> b!171047 m!199467))

(declare-fun m!199469 () Bool)

(assert (=> b!171038 m!199469))

(declare-fun m!199471 () Bool)

(assert (=> b!171038 m!199471))

(assert (=> b!171038 m!199469))

(declare-fun m!199473 () Bool)

(assert (=> b!171038 m!199473))

(declare-fun m!199475 () Bool)

(assert (=> b!171038 m!199475))

(declare-fun m!199477 () Bool)

(assert (=> b!171038 m!199477))

(declare-fun m!199479 () Bool)

(assert (=> b!171038 m!199479))

(declare-fun m!199481 () Bool)

(assert (=> b!171038 m!199481))

(assert (=> b!171038 m!199461))

(declare-fun m!199483 () Bool)

(assert (=> b!171038 m!199483))

(declare-fun m!199485 () Bool)

(assert (=> b!171038 m!199485))

(assert (=> b!171038 m!199483))

(declare-fun m!199487 () Bool)

(assert (=> b!171038 m!199487))

(declare-fun m!199489 () Bool)

(assert (=> b!171038 m!199489))

(declare-fun m!199491 () Bool)

(assert (=> b!171038 m!199491))

(assert (=> b!171038 m!199479))

(assert (=> b!171038 m!199475))

(declare-fun m!199493 () Bool)

(assert (=> b!171038 m!199493))

(declare-fun m!199495 () Bool)

(assert (=> b!171038 m!199495))

(assert (=> b!171038 m!199453))

(declare-fun m!199497 () Bool)

(assert (=> b!171038 m!199497))

(declare-fun m!199499 () Bool)

(assert (=> b!171043 m!199499))

(declare-fun m!199501 () Bool)

(assert (=> b!171031 m!199501))

(declare-fun m!199503 () Bool)

(assert (=> b!171031 m!199503))

(assert (=> b!171031 m!199503))

(assert (=> b!171031 m!199501))

(declare-fun m!199505 () Bool)

(assert (=> b!171031 m!199505))

(assert (=> b!171031 m!199453))

(declare-fun m!199507 () Bool)

(assert (=> b!171031 m!199507))

(assert (=> b!171031 m!199453))

(declare-fun m!199509 () Bool)

(assert (=> d!51855 m!199509))

(declare-fun m!199511 () Bool)

(assert (=> bm!17392 m!199511))

(assert (=> b!170909 d!51855))

(declare-fun d!51857 () Bool)

(assert (=> d!51857 (= (+!243 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!85206 () Unit!5251)

(declare-fun choose!929 (array!7105 array!7107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!4985 V!4985 V!4985 Int) Unit!5251)

(assert (=> d!51857 (= lt!85206 (choose!929 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3397 thiss!1248) v!309 (minValue!3397 thiss!1248) (defaultEntry!3554 thiss!1248)))))

(assert (=> d!51857 (validMask!0 (mask!8382 thiss!1248))))

(assert (=> d!51857 (= (lemmaChangeZeroKeyThenAddPairToListMap!85 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3397 thiss!1248) v!309 (minValue!3397 thiss!1248) (defaultEntry!3554 thiss!1248)) lt!85206)))

(declare-fun bs!7068 () Bool)

(assert (= bs!7068 d!51857))

(assert (=> bs!7068 m!199361))

(assert (=> bs!7068 m!199369))

(assert (=> bs!7068 m!199509))

(assert (=> bs!7068 m!199361))

(assert (=> bs!7068 m!199365))

(declare-fun m!199513 () Bool)

(assert (=> bs!7068 m!199513))

(assert (=> b!170909 d!51857))

(declare-fun d!51859 () Bool)

(declare-fun res!81322 () Bool)

(declare-fun e!112918 () Bool)

(assert (=> d!51859 (=> (not res!81322) (not e!112918))))

(assert (=> d!51859 (= res!81322 (simpleValid!135 lt!85094))))

(assert (=> d!51859 (= (valid!963 lt!85094) e!112918)))

(declare-fun b!171052 () Bool)

(declare-fun res!81323 () Bool)

(assert (=> b!171052 (=> (not res!81323) (not e!112918))))

(assert (=> b!171052 (= res!81323 (= (arrayCountValidKeys!0 (_keys!5386 lt!85094) #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))) (_size!1161 lt!85094)))))

(declare-fun b!171053 () Bool)

(declare-fun res!81324 () Bool)

(assert (=> b!171053 (=> (not res!81324) (not e!112918))))

(assert (=> b!171053 (= res!81324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5386 lt!85094) (mask!8382 lt!85094)))))

(declare-fun b!171054 () Bool)

(assert (=> b!171054 (= e!112918 (arrayNoDuplicates!0 (_keys!5386 lt!85094) #b00000000000000000000000000000000 Nil!2175))))

(assert (= (and d!51859 res!81322) b!171052))

(assert (= (and b!171052 res!81323) b!171053))

(assert (= (and b!171053 res!81324) b!171054))

(declare-fun m!199515 () Bool)

(assert (=> d!51859 m!199515))

(declare-fun m!199517 () Bool)

(assert (=> b!171052 m!199517))

(declare-fun m!199519 () Bool)

(assert (=> b!171053 m!199519))

(declare-fun m!199521 () Bool)

(assert (=> b!171054 m!199521))

(assert (=> b!170909 d!51859))

(declare-fun b!171055 () Bool)

(declare-fun e!112922 () ListLongMap!2131)

(declare-fun e!112924 () ListLongMap!2131)

(assert (=> b!171055 (= e!112922 e!112924)))

(declare-fun c!30534 () Bool)

(assert (=> b!171055 (= c!30534 (and (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171056 () Bool)

(declare-fun call!17402 () ListLongMap!2131)

(assert (=> b!171056 (= e!112924 call!17402)))

(declare-fun b!171057 () Bool)

(declare-fun e!112931 () Bool)

(declare-fun lt!85224 () ListLongMap!2131)

(assert (=> b!171057 (= e!112931 (= (apply!129 lt!85224 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!171057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3674 (_values!3537 thiss!1248))))))

(assert (=> b!171057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun bm!17396 () Bool)

(declare-fun call!17399 () ListLongMap!2131)

(assert (=> bm!17396 (= call!17402 call!17399)))

(declare-fun b!171058 () Bool)

(declare-fun e!112919 () ListLongMap!2131)

(declare-fun call!17400 () ListLongMap!2131)

(assert (=> b!171058 (= e!112919 call!17400)))

(declare-fun b!171059 () Bool)

(declare-fun e!112929 () Bool)

(assert (=> b!171059 (= e!112929 e!112931)))

(declare-fun res!81332 () Bool)

(assert (=> b!171059 (=> (not res!81332) (not e!112931))))

(assert (=> b!171059 (= res!81332 (contains!1139 lt!85224 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun bm!17397 () Bool)

(declare-fun call!17405 () ListLongMap!2131)

(declare-fun call!17403 () ListLongMap!2131)

(assert (=> bm!17397 (= call!17405 call!17403)))

(declare-fun b!171060 () Bool)

(declare-fun e!112927 () Bool)

(declare-fun e!112930 () Bool)

(assert (=> b!171060 (= e!112927 e!112930)))

(declare-fun c!30533 () Bool)

(assert (=> b!171060 (= c!30533 (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171061 () Bool)

(declare-fun call!17404 () Bool)

(assert (=> b!171061 (= e!112930 (not call!17404))))

(declare-fun b!171063 () Bool)

(declare-fun res!81328 () Bool)

(assert (=> b!171063 (=> (not res!81328) (not e!112927))))

(assert (=> b!171063 (= res!81328 e!112929)))

(declare-fun res!81325 () Bool)

(assert (=> b!171063 (=> res!81325 e!112929)))

(declare-fun e!112925 () Bool)

(assert (=> b!171063 (= res!81325 (not e!112925))))

(declare-fun res!81331 () Bool)

(assert (=> b!171063 (=> (not res!81331) (not e!112925))))

(assert (=> b!171063 (= res!81331 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171064 () Bool)

(declare-fun e!112926 () Unit!5251)

(declare-fun lt!85219 () Unit!5251)

(assert (=> b!171064 (= e!112926 lt!85219)))

(declare-fun lt!85223 () ListLongMap!2131)

(assert (=> b!171064 (= lt!85223 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!85209 () (_ BitVec 64))

(assert (=> b!171064 (= lt!85209 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85212 () (_ BitVec 64))

(assert (=> b!171064 (= lt!85212 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85220 () Unit!5251)

(assert (=> b!171064 (= lt!85220 (addStillContains!105 lt!85223 lt!85209 (zeroValue!3397 thiss!1248) lt!85212))))

(assert (=> b!171064 (contains!1139 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) lt!85212)))

(declare-fun lt!85211 () Unit!5251)

(assert (=> b!171064 (= lt!85211 lt!85220)))

(declare-fun lt!85226 () ListLongMap!2131)

(assert (=> b!171064 (= lt!85226 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!85228 () (_ BitVec 64))

(assert (=> b!171064 (= lt!85228 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85210 () (_ BitVec 64))

(assert (=> b!171064 (= lt!85210 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85208 () Unit!5251)

(assert (=> b!171064 (= lt!85208 (addApplyDifferent!105 lt!85226 lt!85228 (minValue!3397 thiss!1248) lt!85210))))

(assert (=> b!171064 (= (apply!129 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) lt!85210) (apply!129 lt!85226 lt!85210))))

(declare-fun lt!85213 () Unit!5251)

(assert (=> b!171064 (= lt!85213 lt!85208)))

(declare-fun lt!85227 () ListLongMap!2131)

(assert (=> b!171064 (= lt!85227 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!85225 () (_ BitVec 64))

(assert (=> b!171064 (= lt!85225 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85216 () (_ BitVec 64))

(assert (=> b!171064 (= lt!85216 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85221 () Unit!5251)

(assert (=> b!171064 (= lt!85221 (addApplyDifferent!105 lt!85227 lt!85225 (zeroValue!3397 thiss!1248) lt!85216))))

(assert (=> b!171064 (= (apply!129 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) lt!85216) (apply!129 lt!85227 lt!85216))))

(declare-fun lt!85217 () Unit!5251)

(assert (=> b!171064 (= lt!85217 lt!85221)))

(declare-fun lt!85215 () ListLongMap!2131)

(assert (=> b!171064 (= lt!85215 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun lt!85214 () (_ BitVec 64))

(assert (=> b!171064 (= lt!85214 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85222 () (_ BitVec 64))

(assert (=> b!171064 (= lt!85222 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!171064 (= lt!85219 (addApplyDifferent!105 lt!85215 lt!85214 (minValue!3397 thiss!1248) lt!85222))))

(assert (=> b!171064 (= (apply!129 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) lt!85222) (apply!129 lt!85215 lt!85222))))

(declare-fun b!171065 () Bool)

(declare-fun Unit!5257 () Unit!5251)

(assert (=> b!171065 (= e!112926 Unit!5257)))

(declare-fun b!171066 () Bool)

(declare-fun e!112921 () Bool)

(declare-fun e!112923 () Bool)

(assert (=> b!171066 (= e!112921 e!112923)))

(declare-fun res!81326 () Bool)

(declare-fun call!17401 () Bool)

(assert (=> b!171066 (= res!81326 call!17401)))

(assert (=> b!171066 (=> (not res!81326) (not e!112923))))

(declare-fun bm!17398 () Bool)

(assert (=> bm!17398 (= call!17400 call!17405)))

(declare-fun b!171067 () Bool)

(declare-fun e!112920 () Bool)

(assert (=> b!171067 (= e!112930 e!112920)))

(declare-fun res!81333 () Bool)

(assert (=> b!171067 (= res!81333 call!17404)))

(assert (=> b!171067 (=> (not res!81333) (not e!112920))))

(declare-fun b!171068 () Bool)

(assert (=> b!171068 (= e!112923 (= (apply!129 lt!85224 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3397 thiss!1248)))))

(declare-fun b!171069 () Bool)

(assert (=> b!171069 (= e!112922 (+!243 call!17399 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun b!171070 () Bool)

(declare-fun c!30536 () Bool)

(assert (=> b!171070 (= c!30536 (and (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!171070 (= e!112924 e!112919)))

(declare-fun bm!17399 () Bool)

(assert (=> bm!17399 (= call!17401 (contains!1139 lt!85224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17400 () Bool)

(assert (=> bm!17400 (= call!17403 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(declare-fun bm!17401 () Bool)

(declare-fun c!30535 () Bool)

(assert (=> bm!17401 (= call!17399 (+!243 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400)) (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171071 () Bool)

(declare-fun res!81330 () Bool)

(assert (=> b!171071 (=> (not res!81330) (not e!112927))))

(assert (=> b!171071 (= res!81330 e!112921)))

(declare-fun c!30531 () Bool)

(assert (=> b!171071 (= c!30531 (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!51861 () Bool)

(assert (=> d!51861 e!112927))

(declare-fun res!81329 () Bool)

(assert (=> d!51861 (=> (not res!81329) (not e!112927))))

(assert (=> d!51861 (= res!81329 (or (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))))

(declare-fun lt!85207 () ListLongMap!2131)

(assert (=> d!51861 (= lt!85224 lt!85207)))

(declare-fun lt!85218 () Unit!5251)

(assert (=> d!51861 (= lt!85218 e!112926)))

(declare-fun c!30532 () Bool)

(declare-fun e!112928 () Bool)

(assert (=> d!51861 (= c!30532 e!112928)))

(declare-fun res!81327 () Bool)

(assert (=> d!51861 (=> (not res!81327) (not e!112928))))

(assert (=> d!51861 (= res!81327 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!51861 (= lt!85207 e!112922)))

(assert (=> d!51861 (= c!30535 (and (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3295 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!51861 (validMask!0 (mask!8382 thiss!1248))))

(assert (=> d!51861 (= (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) lt!85224)))

(declare-fun b!171062 () Bool)

(assert (=> b!171062 (= e!112921 (not call!17401))))

(declare-fun b!171072 () Bool)

(assert (=> b!171072 (= e!112919 call!17402)))

(declare-fun b!171073 () Bool)

(assert (=> b!171073 (= e!112920 (= (apply!129 lt!85224 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3397 thiss!1248)))))

(declare-fun bm!17402 () Bool)

(assert (=> bm!17402 (= call!17404 (contains!1139 lt!85224 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171074 () Bool)

(assert (=> b!171074 (= e!112928 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171075 () Bool)

(assert (=> b!171075 (= e!112925 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51861 c!30535) b!171069))

(assert (= (and d!51861 (not c!30535)) b!171055))

(assert (= (and b!171055 c!30534) b!171056))

(assert (= (and b!171055 (not c!30534)) b!171070))

(assert (= (and b!171070 c!30536) b!171072))

(assert (= (and b!171070 (not c!30536)) b!171058))

(assert (= (or b!171072 b!171058) bm!17398))

(assert (= (or b!171056 bm!17398) bm!17397))

(assert (= (or b!171056 b!171072) bm!17396))

(assert (= (or b!171069 bm!17397) bm!17400))

(assert (= (or b!171069 bm!17396) bm!17401))

(assert (= (and d!51861 res!81327) b!171074))

(assert (= (and d!51861 c!30532) b!171064))

(assert (= (and d!51861 (not c!30532)) b!171065))

(assert (= (and d!51861 res!81329) b!171063))

(assert (= (and b!171063 res!81331) b!171075))

(assert (= (and b!171063 (not res!81325)) b!171059))

(assert (= (and b!171059 res!81332) b!171057))

(assert (= (and b!171063 res!81328) b!171071))

(assert (= (and b!171071 c!30531) b!171066))

(assert (= (and b!171071 (not c!30531)) b!171062))

(assert (= (and b!171066 res!81326) b!171068))

(assert (= (or b!171066 b!171062) bm!17399))

(assert (= (and b!171071 res!81330) b!171060))

(assert (= (and b!171060 c!30533) b!171067))

(assert (= (and b!171060 (not c!30533)) b!171061))

(assert (= (and b!171067 res!81333) b!171073))

(assert (= (or b!171067 b!171061) bm!17402))

(declare-fun b_lambda!6911 () Bool)

(assert (=> (not b_lambda!6911) (not b!171057)))

(assert (=> b!171057 t!6973))

(declare-fun b_and!10667 () Bool)

(assert (= b_and!10665 (and (=> t!6973 result!4553) b_and!10667)))

(assert (=> b!171075 m!199453))

(assert (=> b!171075 m!199453))

(assert (=> b!171075 m!199455))

(assert (=> b!171059 m!199453))

(assert (=> b!171059 m!199453))

(declare-fun m!199523 () Bool)

(assert (=> b!171059 m!199523))

(declare-fun m!199525 () Bool)

(assert (=> bm!17401 m!199525))

(declare-fun m!199527 () Bool)

(assert (=> bm!17400 m!199527))

(assert (=> b!171074 m!199453))

(assert (=> b!171074 m!199453))

(assert (=> b!171074 m!199455))

(declare-fun m!199529 () Bool)

(assert (=> bm!17402 m!199529))

(declare-fun m!199531 () Bool)

(assert (=> b!171068 m!199531))

(declare-fun m!199533 () Bool)

(assert (=> b!171073 m!199533))

(declare-fun m!199535 () Bool)

(assert (=> b!171064 m!199535))

(declare-fun m!199537 () Bool)

(assert (=> b!171064 m!199537))

(assert (=> b!171064 m!199535))

(declare-fun m!199539 () Bool)

(assert (=> b!171064 m!199539))

(declare-fun m!199541 () Bool)

(assert (=> b!171064 m!199541))

(declare-fun m!199543 () Bool)

(assert (=> b!171064 m!199543))

(declare-fun m!199545 () Bool)

(assert (=> b!171064 m!199545))

(declare-fun m!199547 () Bool)

(assert (=> b!171064 m!199547))

(assert (=> b!171064 m!199527))

(declare-fun m!199549 () Bool)

(assert (=> b!171064 m!199549))

(declare-fun m!199551 () Bool)

(assert (=> b!171064 m!199551))

(assert (=> b!171064 m!199549))

(declare-fun m!199553 () Bool)

(assert (=> b!171064 m!199553))

(declare-fun m!199555 () Bool)

(assert (=> b!171064 m!199555))

(declare-fun m!199557 () Bool)

(assert (=> b!171064 m!199557))

(assert (=> b!171064 m!199545))

(assert (=> b!171064 m!199541))

(declare-fun m!199559 () Bool)

(assert (=> b!171064 m!199559))

(declare-fun m!199561 () Bool)

(assert (=> b!171064 m!199561))

(assert (=> b!171064 m!199453))

(declare-fun m!199563 () Bool)

(assert (=> b!171064 m!199563))

(declare-fun m!199565 () Bool)

(assert (=> b!171069 m!199565))

(assert (=> b!171057 m!199501))

(assert (=> b!171057 m!199503))

(assert (=> b!171057 m!199503))

(assert (=> b!171057 m!199501))

(assert (=> b!171057 m!199505))

(assert (=> b!171057 m!199453))

(declare-fun m!199567 () Bool)

(assert (=> b!171057 m!199567))

(assert (=> b!171057 m!199453))

(assert (=> d!51861 m!199509))

(declare-fun m!199569 () Bool)

(assert (=> bm!17399 m!199569))

(assert (=> b!170909 d!51861))

(declare-fun d!51863 () Bool)

(declare-fun e!112932 () Bool)

(assert (=> d!51863 e!112932))

(declare-fun res!81335 () Bool)

(assert (=> d!51863 (=> (not res!81335) (not e!112932))))

(declare-fun lt!85229 () ListLongMap!2131)

(assert (=> d!51863 (= res!81335 (contains!1139 lt!85229 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85230 () List!2176)

(assert (=> d!51863 (= lt!85229 (ListLongMap!2132 lt!85230))))

(declare-fun lt!85232 () Unit!5251)

(declare-fun lt!85231 () Unit!5251)

(assert (=> d!51863 (= lt!85232 lt!85231)))

(assert (=> d!51863 (= (getValueByKey!185 lt!85230 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!51863 (= lt!85231 (lemmaContainsTupThenGetReturnValue!98 lt!85230 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!51863 (= lt!85230 (insertStrictlySorted!101 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!51863 (= (+!243 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85229)))

(declare-fun b!171076 () Bool)

(declare-fun res!81334 () Bool)

(assert (=> b!171076 (=> (not res!81334) (not e!112932))))

(assert (=> b!171076 (= res!81334 (= (getValueByKey!185 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171077 () Bool)

(assert (=> b!171077 (= e!112932 (contains!1141 (toList!1081 lt!85229) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!51863 res!81335) b!171076))

(assert (= (and b!171076 res!81334) b!171077))

(declare-fun m!199571 () Bool)

(assert (=> d!51863 m!199571))

(declare-fun m!199573 () Bool)

(assert (=> d!51863 m!199573))

(declare-fun m!199575 () Bool)

(assert (=> d!51863 m!199575))

(declare-fun m!199577 () Bool)

(assert (=> d!51863 m!199577))

(declare-fun m!199579 () Bool)

(assert (=> b!171076 m!199579))

(declare-fun m!199581 () Bool)

(assert (=> b!171077 m!199581))

(assert (=> b!170909 d!51863))

(declare-fun b!171085 () Bool)

(declare-fun e!112938 () Bool)

(assert (=> b!171085 (= e!112938 tp_is_empty!4003)))

(declare-fun mapNonEmpty!6806 () Bool)

(declare-fun mapRes!6806 () Bool)

(declare-fun tp!15338 () Bool)

(declare-fun e!112937 () Bool)

(assert (=> mapNonEmpty!6806 (= mapRes!6806 (and tp!15338 e!112937))))

(declare-fun mapValue!6806 () ValueCell!1658)

(declare-fun mapKey!6806 () (_ BitVec 32))

(declare-fun mapRest!6806 () (Array (_ BitVec 32) ValueCell!1658))

(assert (=> mapNonEmpty!6806 (= mapRest!6797 (store mapRest!6806 mapKey!6806 mapValue!6806))))

(declare-fun mapIsEmpty!6806 () Bool)

(assert (=> mapIsEmpty!6806 mapRes!6806))

(declare-fun condMapEmpty!6806 () Bool)

(declare-fun mapDefault!6806 () ValueCell!1658)

(assert (=> mapNonEmpty!6797 (= condMapEmpty!6806 (= mapRest!6797 ((as const (Array (_ BitVec 32) ValueCell!1658)) mapDefault!6806)))))

(assert (=> mapNonEmpty!6797 (= tp!15322 (and e!112938 mapRes!6806))))

(declare-fun b!171084 () Bool)

(assert (=> b!171084 (= e!112937 tp_is_empty!4003)))

(assert (= (and mapNonEmpty!6797 condMapEmpty!6806) mapIsEmpty!6806))

(assert (= (and mapNonEmpty!6797 (not condMapEmpty!6806)) mapNonEmpty!6806))

(assert (= (and mapNonEmpty!6806 ((_ is ValueCellFull!1658) mapValue!6806)) b!171084))

(assert (= (and mapNonEmpty!6797 ((_ is ValueCellFull!1658) mapDefault!6806)) b!171085))

(declare-fun m!199583 () Bool)

(assert (=> mapNonEmpty!6806 m!199583))

(declare-fun b_lambda!6913 () Bool)

(assert (= b_lambda!6911 (or (and b!170908 b_free!4231) b_lambda!6913)))

(declare-fun b_lambda!6915 () Bool)

(assert (= b_lambda!6909 (or (and b!170908 b_free!4231) b_lambda!6915)))

(check-sat (not b!171048) (not b_lambda!6913) (not bm!17395) (not b!171077) (not bm!17399) (not b!171033) (not d!51853) (not b!171054) (not b!170967) (not b!171052) (not b!171057) (not d!51863) (not d!51859) (not b!171068) (not mapNonEmpty!6806) (not b!171074) (not d!51847) (not bm!17392) (not b!171076) (not d!51861) (not b!171049) (not bm!17400) (not b!171064) tp_is_empty!4003 (not bm!17393) (not b!171053) (not bm!17394) (not d!51855) (not d!51857) (not b!171069) (not b!171073) (not d!51845) (not b!170975) (not b!171031) (not d!51851) (not b!171043) (not b!171059) (not b!170986) (not bm!17402) (not b!171042) (not b_next!4231) (not d!51849) (not b!171038) (not b!171075) (not b!171047) (not b_lambda!6915) (not b!170968) b_and!10667 (not b!170977) (not bm!17401) (not b!170984) (not b!170985))
(check-sat b_and!10667 (not b_next!4231))
(get-model)

(declare-fun b!171110 () Bool)

(declare-fun e!112958 () Bool)

(declare-fun e!112956 () Bool)

(assert (=> b!171110 (= e!112958 e!112956)))

(declare-fun c!30547 () Bool)

(assert (=> b!171110 (= c!30547 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171111 () Bool)

(declare-fun lt!85248 () ListLongMap!2131)

(assert (=> b!171111 (= e!112956 (= lt!85248 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248))))))

(declare-fun b!171112 () Bool)

(declare-fun e!112953 () ListLongMap!2131)

(declare-fun call!17408 () ListLongMap!2131)

(assert (=> b!171112 (= e!112953 call!17408)))

(declare-fun d!51865 () Bool)

(declare-fun e!112959 () Bool)

(assert (=> d!51865 e!112959))

(declare-fun res!81344 () Bool)

(assert (=> d!51865 (=> (not res!81344) (not e!112959))))

(assert (=> d!51865 (= res!81344 (not (contains!1139 lt!85248 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!112955 () ListLongMap!2131)

(assert (=> d!51865 (= lt!85248 e!112955)))

(declare-fun c!30546 () Bool)

(assert (=> d!51865 (= c!30546 (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!51865 (validMask!0 (mask!8382 thiss!1248))))

(assert (=> d!51865 (= (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) lt!85248)))

(declare-fun b!171113 () Bool)

(assert (=> b!171113 (= e!112959 e!112958)))

(declare-fun c!30545 () Bool)

(declare-fun e!112954 () Bool)

(assert (=> b!171113 (= c!30545 e!112954)))

(declare-fun res!81347 () Bool)

(assert (=> b!171113 (=> (not res!81347) (not e!112954))))

(assert (=> b!171113 (= res!81347 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171114 () Bool)

(assert (=> b!171114 (= e!112954 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171114 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!171115 () Bool)

(declare-fun res!81345 () Bool)

(assert (=> b!171115 (=> (not res!81345) (not e!112959))))

(assert (=> b!171115 (= res!81345 (not (contains!1139 lt!85248 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171116 () Bool)

(assert (=> b!171116 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> b!171116 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3674 (_values!3537 thiss!1248))))))

(declare-fun e!112957 () Bool)

(assert (=> b!171116 (= e!112957 (= (apply!129 lt!85248 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171117 () Bool)

(assert (=> b!171117 (= e!112955 (ListLongMap!2132 Nil!2173))))

(declare-fun b!171118 () Bool)

(declare-fun lt!85247 () Unit!5251)

(declare-fun lt!85252 () Unit!5251)

(assert (=> b!171118 (= lt!85247 lt!85252)))

(declare-fun lt!85251 () (_ BitVec 64))

(declare-fun lt!85249 () ListLongMap!2131)

(declare-fun lt!85253 () V!4985)

(declare-fun lt!85250 () (_ BitVec 64))

(assert (=> b!171118 (not (contains!1139 (+!243 lt!85249 (tuple2!3199 lt!85250 lt!85253)) lt!85251))))

(declare-fun addStillNotContains!73 (ListLongMap!2131 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5251)

(assert (=> b!171118 (= lt!85252 (addStillNotContains!73 lt!85249 lt!85250 lt!85253 lt!85251))))

(assert (=> b!171118 (= lt!85251 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171118 (= lt!85253 (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171118 (= lt!85250 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!171118 (= lt!85249 call!17408)))

(assert (=> b!171118 (= e!112953 (+!243 call!17408 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!171119 () Bool)

(assert (=> b!171119 (= e!112958 e!112957)))

(assert (=> b!171119 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun res!81346 () Bool)

(assert (=> b!171119 (= res!81346 (contains!1139 lt!85248 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171119 (=> (not res!81346) (not e!112957))))

(declare-fun bm!17405 () Bool)

(assert (=> bm!17405 (= call!17408 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)))))

(declare-fun b!171120 () Bool)

(assert (=> b!171120 (= e!112955 e!112953)))

(declare-fun c!30548 () Bool)

(assert (=> b!171120 (= c!30548 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171121 () Bool)

(declare-fun isEmpty!439 (ListLongMap!2131) Bool)

(assert (=> b!171121 (= e!112956 (isEmpty!439 lt!85248))))

(assert (= (and d!51865 c!30546) b!171117))

(assert (= (and d!51865 (not c!30546)) b!171120))

(assert (= (and b!171120 c!30548) b!171118))

(assert (= (and b!171120 (not c!30548)) b!171112))

(assert (= (or b!171118 b!171112) bm!17405))

(assert (= (and d!51865 res!81344) b!171115))

(assert (= (and b!171115 res!81345) b!171113))

(assert (= (and b!171113 res!81347) b!171114))

(assert (= (and b!171113 c!30545) b!171119))

(assert (= (and b!171113 (not c!30545)) b!171110))

(assert (= (and b!171119 res!81346) b!171116))

(assert (= (and b!171110 c!30547) b!171111))

(assert (= (and b!171110 (not c!30547)) b!171121))

(declare-fun b_lambda!6917 () Bool)

(assert (=> (not b_lambda!6917) (not b!171116)))

(assert (=> b!171116 t!6973))

(declare-fun b_and!10669 () Bool)

(assert (= b_and!10667 (and (=> t!6973 result!4553) b_and!10669)))

(declare-fun b_lambda!6919 () Bool)

(assert (=> (not b_lambda!6919) (not b!171118)))

(assert (=> b!171118 t!6973))

(declare-fun b_and!10671 () Bool)

(assert (= b_and!10669 (and (=> t!6973 result!4553) b_and!10671)))

(assert (=> b!171119 m!199453))

(assert (=> b!171119 m!199453))

(declare-fun m!199585 () Bool)

(assert (=> b!171119 m!199585))

(assert (=> b!171120 m!199453))

(assert (=> b!171120 m!199453))

(assert (=> b!171120 m!199455))

(declare-fun m!199587 () Bool)

(assert (=> d!51865 m!199587))

(assert (=> d!51865 m!199509))

(declare-fun m!199589 () Bool)

(assert (=> b!171118 m!199589))

(declare-fun m!199591 () Bool)

(assert (=> b!171118 m!199591))

(declare-fun m!199593 () Bool)

(assert (=> b!171118 m!199593))

(declare-fun m!199595 () Bool)

(assert (=> b!171118 m!199595))

(assert (=> b!171118 m!199503))

(assert (=> b!171118 m!199501))

(assert (=> b!171118 m!199453))

(assert (=> b!171118 m!199591))

(assert (=> b!171118 m!199503))

(assert (=> b!171118 m!199501))

(assert (=> b!171118 m!199505))

(assert (=> b!171114 m!199453))

(assert (=> b!171114 m!199453))

(assert (=> b!171114 m!199455))

(declare-fun m!199597 () Bool)

(assert (=> b!171111 m!199597))

(assert (=> bm!17405 m!199597))

(assert (=> b!171116 m!199453))

(declare-fun m!199599 () Bool)

(assert (=> b!171116 m!199599))

(assert (=> b!171116 m!199503))

(assert (=> b!171116 m!199503))

(assert (=> b!171116 m!199501))

(assert (=> b!171116 m!199505))

(assert (=> b!171116 m!199501))

(assert (=> b!171116 m!199453))

(declare-fun m!199601 () Bool)

(assert (=> b!171121 m!199601))

(declare-fun m!199603 () Bool)

(assert (=> b!171115 m!199603))

(assert (=> bm!17393 d!51865))

(assert (=> d!51857 d!51855))

(declare-fun d!51867 () Bool)

(assert (=> d!51867 (= (+!243 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))

(assert (=> d!51867 true))

(declare-fun _$7!128 () Unit!5251)

(assert (=> d!51867 (= (choose!929 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3397 thiss!1248) v!309 (minValue!3397 thiss!1248) (defaultEntry!3554 thiss!1248)) _$7!128)))

(declare-fun bs!7069 () Bool)

(assert (= bs!7069 d!51867))

(assert (=> bs!7069 m!199361))

(assert (=> bs!7069 m!199361))

(assert (=> bs!7069 m!199369))

(assert (=> bs!7069 m!199365))

(assert (=> d!51857 d!51867))

(declare-fun d!51869 () Bool)

(assert (=> d!51869 (= (validMask!0 (mask!8382 thiss!1248)) (and (or (= (mask!8382 thiss!1248) #b00000000000000000000000000000111) (= (mask!8382 thiss!1248) #b00000000000000000000000000001111) (= (mask!8382 thiss!1248) #b00000000000000000000000000011111) (= (mask!8382 thiss!1248) #b00000000000000000000000000111111) (= (mask!8382 thiss!1248) #b00000000000000000000000001111111) (= (mask!8382 thiss!1248) #b00000000000000000000000011111111) (= (mask!8382 thiss!1248) #b00000000000000000000000111111111) (= (mask!8382 thiss!1248) #b00000000000000000000001111111111) (= (mask!8382 thiss!1248) #b00000000000000000000011111111111) (= (mask!8382 thiss!1248) #b00000000000000000000111111111111) (= (mask!8382 thiss!1248) #b00000000000000000001111111111111) (= (mask!8382 thiss!1248) #b00000000000000000011111111111111) (= (mask!8382 thiss!1248) #b00000000000000000111111111111111) (= (mask!8382 thiss!1248) #b00000000000000001111111111111111) (= (mask!8382 thiss!1248) #b00000000000000011111111111111111) (= (mask!8382 thiss!1248) #b00000000000000111111111111111111) (= (mask!8382 thiss!1248) #b00000000000001111111111111111111) (= (mask!8382 thiss!1248) #b00000000000011111111111111111111) (= (mask!8382 thiss!1248) #b00000000000111111111111111111111) (= (mask!8382 thiss!1248) #b00000000001111111111111111111111) (= (mask!8382 thiss!1248) #b00000000011111111111111111111111) (= (mask!8382 thiss!1248) #b00000000111111111111111111111111) (= (mask!8382 thiss!1248) #b00000001111111111111111111111111) (= (mask!8382 thiss!1248) #b00000011111111111111111111111111) (= (mask!8382 thiss!1248) #b00000111111111111111111111111111) (= (mask!8382 thiss!1248) #b00001111111111111111111111111111) (= (mask!8382 thiss!1248) #b00011111111111111111111111111111) (= (mask!8382 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8382 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> d!51857 d!51869))

(assert (=> d!51857 d!51861))

(assert (=> d!51857 d!51863))

(declare-fun d!51871 () Bool)

(declare-fun e!112960 () Bool)

(assert (=> d!51871 e!112960))

(declare-fun res!81348 () Bool)

(assert (=> d!51871 (=> res!81348 e!112960)))

(declare-fun lt!85254 () Bool)

(assert (=> d!51871 (= res!81348 (not lt!85254))))

(declare-fun lt!85256 () Bool)

(assert (=> d!51871 (= lt!85254 lt!85256)))

(declare-fun lt!85257 () Unit!5251)

(declare-fun e!112961 () Unit!5251)

(assert (=> d!51871 (= lt!85257 e!112961)))

(declare-fun c!30549 () Bool)

(assert (=> d!51871 (= c!30549 lt!85256)))

(assert (=> d!51871 (= lt!85256 (containsKey!188 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51871 (= (contains!1139 lt!85199 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85254)))

(declare-fun b!171122 () Bool)

(declare-fun lt!85255 () Unit!5251)

(assert (=> b!171122 (= e!112961 lt!85255)))

(assert (=> b!171122 (= lt!85255 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171122 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171123 () Bool)

(declare-fun Unit!5258 () Unit!5251)

(assert (=> b!171123 (= e!112961 Unit!5258)))

(declare-fun b!171124 () Bool)

(assert (=> b!171124 (= e!112960 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51871 c!30549) b!171122))

(assert (= (and d!51871 (not c!30549)) b!171123))

(assert (= (and d!51871 (not res!81348)) b!171124))

(declare-fun m!199605 () Bool)

(assert (=> d!51871 m!199605))

(declare-fun m!199607 () Bool)

(assert (=> b!171122 m!199607))

(declare-fun m!199609 () Bool)

(assert (=> b!171122 m!199609))

(assert (=> b!171122 m!199609))

(declare-fun m!199611 () Bool)

(assert (=> b!171122 m!199611))

(assert (=> b!171124 m!199609))

(assert (=> b!171124 m!199609))

(assert (=> b!171124 m!199611))

(assert (=> bm!17392 d!51871))

(declare-fun lt!85260 () Bool)

(declare-fun d!51873 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!148 (List!2176) (InoxSet tuple2!3198))

(assert (=> d!51873 (= lt!85260 (select (content!148 (toList!1081 lt!85122)) (tuple2!3199 key!828 v!309)))))

(declare-fun e!112967 () Bool)

(assert (=> d!51873 (= lt!85260 e!112967)))

(declare-fun res!81353 () Bool)

(assert (=> d!51873 (=> (not res!81353) (not e!112967))))

(assert (=> d!51873 (= res!81353 ((_ is Cons!2172) (toList!1081 lt!85122)))))

(assert (=> d!51873 (= (contains!1141 (toList!1081 lt!85122) (tuple2!3199 key!828 v!309)) lt!85260)))

(declare-fun b!171129 () Bool)

(declare-fun e!112966 () Bool)

(assert (=> b!171129 (= e!112967 e!112966)))

(declare-fun res!81354 () Bool)

(assert (=> b!171129 (=> res!81354 e!112966)))

(assert (=> b!171129 (= res!81354 (= (h!2789 (toList!1081 lt!85122)) (tuple2!3199 key!828 v!309)))))

(declare-fun b!171130 () Bool)

(assert (=> b!171130 (= e!112966 (contains!1141 (t!6970 (toList!1081 lt!85122)) (tuple2!3199 key!828 v!309)))))

(assert (= (and d!51873 res!81353) b!171129))

(assert (= (and b!171129 (not res!81354)) b!171130))

(declare-fun m!199613 () Bool)

(assert (=> d!51873 m!199613))

(declare-fun m!199615 () Bool)

(assert (=> d!51873 m!199615))

(declare-fun m!199617 () Bool)

(assert (=> b!171130 m!199617))

(assert (=> b!170968 d!51873))

(declare-fun d!51875 () Bool)

(declare-fun get!1945 (Option!191) V!4985)

(assert (=> d!51875 (= (apply!129 lt!85199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) (get!1945 (getValueByKey!185 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7070 () Bool)

(assert (= bs!7070 d!51875))

(assert (=> bs!7070 m!199453))

(declare-fun m!199619 () Bool)

(assert (=> bs!7070 m!199619))

(assert (=> bs!7070 m!199619))

(declare-fun m!199621 () Bool)

(assert (=> bs!7070 m!199621))

(assert (=> b!171031 d!51875))

(declare-fun d!51877 () Bool)

(declare-fun c!30552 () Bool)

(assert (=> d!51877 (= c!30552 ((_ is ValueCellFull!1658) (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!112970 () V!4985)

(assert (=> d!51877 (= (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!112970)))

(declare-fun b!171135 () Bool)

(declare-fun get!1946 (ValueCell!1658 V!4985) V!4985)

(assert (=> b!171135 (= e!112970 (get!1946 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171136 () Bool)

(declare-fun get!1947 (ValueCell!1658 V!4985) V!4985)

(assert (=> b!171136 (= e!112970 (get!1947 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51877 c!30552) b!171135))

(assert (= (and d!51877 (not c!30552)) b!171136))

(assert (=> b!171135 m!199503))

(assert (=> b!171135 m!199501))

(declare-fun m!199623 () Bool)

(assert (=> b!171135 m!199623))

(assert (=> b!171136 m!199503))

(assert (=> b!171136 m!199501))

(declare-fun m!199625 () Bool)

(assert (=> b!171136 m!199625))

(assert (=> b!171031 d!51877))

(declare-fun d!51879 () Bool)

(assert (=> d!51879 (= (apply!129 lt!85224 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1945 (getValueByKey!185 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7071 () Bool)

(assert (= bs!7071 d!51879))

(declare-fun m!199627 () Bool)

(assert (=> bs!7071 m!199627))

(assert (=> bs!7071 m!199627))

(declare-fun m!199629 () Bool)

(assert (=> bs!7071 m!199629))

(assert (=> b!171068 d!51879))

(declare-fun b!171145 () Bool)

(declare-fun e!112978 () Bool)

(declare-fun e!112977 () Bool)

(assert (=> b!171145 (= e!112978 e!112977)))

(declare-fun c!30555 () Bool)

(assert (=> b!171145 (= c!30555 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun d!51881 () Bool)

(declare-fun res!81360 () Bool)

(assert (=> d!51881 (=> res!81360 e!112978)))

(assert (=> d!51881 (= res!81360 (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(assert (=> d!51881 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5386 lt!85094) (mask!8382 lt!85094)) e!112978)))

(declare-fun b!171146 () Bool)

(declare-fun call!17411 () Bool)

(assert (=> b!171146 (= e!112977 call!17411)))

(declare-fun b!171147 () Bool)

(declare-fun e!112979 () Bool)

(assert (=> b!171147 (= e!112977 e!112979)))

(declare-fun lt!85269 () (_ BitVec 64))

(assert (=> b!171147 (= lt!85269 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000))))

(declare-fun lt!85267 () Unit!5251)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7105 (_ BitVec 64) (_ BitVec 32)) Unit!5251)

(assert (=> b!171147 (= lt!85267 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5386 lt!85094) lt!85269 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!171147 (arrayContainsKey!0 (_keys!5386 lt!85094) lt!85269 #b00000000000000000000000000000000)))

(declare-fun lt!85268 () Unit!5251)

(assert (=> b!171147 (= lt!85268 lt!85267)))

(declare-fun res!81359 () Bool)

(declare-datatypes ((SeekEntryResult!528 0))(
  ( (MissingZero!528 (index!4280 (_ BitVec 32))) (Found!528 (index!4281 (_ BitVec 32))) (Intermediate!528 (undefined!1340 Bool) (index!4282 (_ BitVec 32)) (x!18953 (_ BitVec 32))) (Undefined!528) (MissingVacant!528 (index!4283 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7105 (_ BitVec 32)) SeekEntryResult!528)

(assert (=> b!171147 (= res!81359 (= (seekEntryOrOpen!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) (_keys!5386 lt!85094) (mask!8382 lt!85094)) (Found!528 #b00000000000000000000000000000000)))))

(assert (=> b!171147 (=> (not res!81359) (not e!112979))))

(declare-fun b!171148 () Bool)

(assert (=> b!171148 (= e!112979 call!17411)))

(declare-fun bm!17408 () Bool)

(assert (=> bm!17408 (= call!17411 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5386 lt!85094) (mask!8382 lt!85094)))))

(assert (= (and d!51881 (not res!81360)) b!171145))

(assert (= (and b!171145 c!30555) b!171147))

(assert (= (and b!171145 (not c!30555)) b!171146))

(assert (= (and b!171147 res!81359) b!171148))

(assert (= (or b!171148 b!171146) bm!17408))

(declare-fun m!199631 () Bool)

(assert (=> b!171145 m!199631))

(assert (=> b!171145 m!199631))

(declare-fun m!199633 () Bool)

(assert (=> b!171145 m!199633))

(assert (=> b!171147 m!199631))

(declare-fun m!199635 () Bool)

(assert (=> b!171147 m!199635))

(declare-fun m!199637 () Bool)

(assert (=> b!171147 m!199637))

(assert (=> b!171147 m!199631))

(declare-fun m!199639 () Bool)

(assert (=> b!171147 m!199639))

(declare-fun m!199641 () Bool)

(assert (=> bm!17408 m!199641))

(assert (=> b!171053 d!51881))

(declare-fun d!51883 () Bool)

(declare-fun lt!85272 () (_ BitVec 32))

(assert (=> d!51883 (and (bvsge lt!85272 #b00000000000000000000000000000000) (bvsle lt!85272 (bvsub (size!3673 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun e!112985 () (_ BitVec 32))

(assert (=> d!51883 (= lt!85272 e!112985)))

(declare-fun c!30560 () Bool)

(assert (=> d!51883 (= c!30560 (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(assert (=> d!51883 (and (bvsle #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3673 (_keys!5386 lt!85094)) (size!3673 (_keys!5386 lt!85094))))))

(assert (=> d!51883 (= (arrayCountValidKeys!0 (_keys!5386 lt!85094) #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))) lt!85272)))

(declare-fun bm!17411 () Bool)

(declare-fun call!17414 () (_ BitVec 32))

(assert (=> bm!17411 (= call!17414 (arrayCountValidKeys!0 (_keys!5386 lt!85094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 lt!85094))))))

(declare-fun b!171157 () Bool)

(declare-fun e!112984 () (_ BitVec 32))

(assert (=> b!171157 (= e!112984 (bvadd #b00000000000000000000000000000001 call!17414))))

(declare-fun b!171158 () Bool)

(assert (=> b!171158 (= e!112985 #b00000000000000000000000000000000)))

(declare-fun b!171159 () Bool)

(assert (=> b!171159 (= e!112984 call!17414)))

(declare-fun b!171160 () Bool)

(assert (=> b!171160 (= e!112985 e!112984)))

(declare-fun c!30561 () Bool)

(assert (=> b!171160 (= c!30561 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(assert (= (and d!51883 c!30560) b!171158))

(assert (= (and d!51883 (not c!30560)) b!171160))

(assert (= (and b!171160 c!30561) b!171157))

(assert (= (and b!171160 (not c!30561)) b!171159))

(assert (= (or b!171157 b!171159) bm!17411))

(declare-fun m!199643 () Bool)

(assert (=> bm!17411 m!199643))

(assert (=> b!171160 m!199631))

(assert (=> b!171160 m!199631))

(assert (=> b!171160 m!199633))

(assert (=> b!171052 d!51883))

(declare-fun b!171161 () Bool)

(declare-fun e!112989 () ListLongMap!2131)

(declare-fun e!112991 () ListLongMap!2131)

(assert (=> b!171161 (= e!112989 e!112991)))

(declare-fun c!30565 () Bool)

(assert (=> b!171161 (= c!30565 (and (not (= (bvand (extraKeys!3295 lt!85094) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3295 lt!85094) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171162 () Bool)

(declare-fun call!17418 () ListLongMap!2131)

(assert (=> b!171162 (= e!112991 call!17418)))

(declare-fun b!171163 () Bool)

(declare-fun e!112998 () Bool)

(declare-fun lt!85290 () ListLongMap!2131)

(assert (=> b!171163 (= e!112998 (= (apply!129 lt!85290 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)) (get!1944 (select (arr!3381 (_values!3537 lt!85094)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 lt!85094) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!171163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3674 (_values!3537 lt!85094))))))

(assert (=> b!171163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(declare-fun bm!17412 () Bool)

(declare-fun call!17415 () ListLongMap!2131)

(assert (=> bm!17412 (= call!17418 call!17415)))

(declare-fun b!171164 () Bool)

(declare-fun e!112986 () ListLongMap!2131)

(declare-fun call!17416 () ListLongMap!2131)

(assert (=> b!171164 (= e!112986 call!17416)))

(declare-fun b!171165 () Bool)

(declare-fun e!112996 () Bool)

(assert (=> b!171165 (= e!112996 e!112998)))

(declare-fun res!81368 () Bool)

(assert (=> b!171165 (=> (not res!81368) (not e!112998))))

(assert (=> b!171165 (= res!81368 (contains!1139 lt!85290 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(assert (=> b!171165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(declare-fun bm!17413 () Bool)

(declare-fun call!17421 () ListLongMap!2131)

(declare-fun call!17419 () ListLongMap!2131)

(assert (=> bm!17413 (= call!17421 call!17419)))

(declare-fun b!171166 () Bool)

(declare-fun e!112994 () Bool)

(declare-fun e!112997 () Bool)

(assert (=> b!171166 (= e!112994 e!112997)))

(declare-fun c!30564 () Bool)

(assert (=> b!171166 (= c!30564 (not (= (bvand (extraKeys!3295 lt!85094) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171167 () Bool)

(declare-fun call!17420 () Bool)

(assert (=> b!171167 (= e!112997 (not call!17420))))

(declare-fun b!171169 () Bool)

(declare-fun res!81364 () Bool)

(assert (=> b!171169 (=> (not res!81364) (not e!112994))))

(assert (=> b!171169 (= res!81364 e!112996)))

(declare-fun res!81361 () Bool)

(assert (=> b!171169 (=> res!81361 e!112996)))

(declare-fun e!112992 () Bool)

(assert (=> b!171169 (= res!81361 (not e!112992))))

(declare-fun res!81367 () Bool)

(assert (=> b!171169 (=> (not res!81367) (not e!112992))))

(assert (=> b!171169 (= res!81367 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(declare-fun b!171170 () Bool)

(declare-fun e!112993 () Unit!5251)

(declare-fun lt!85285 () Unit!5251)

(assert (=> b!171170 (= e!112993 lt!85285)))

(declare-fun lt!85289 () ListLongMap!2131)

(assert (=> b!171170 (= lt!85289 (getCurrentListMapNoExtraKeys!160 (_keys!5386 lt!85094) (_values!3537 lt!85094) (mask!8382 lt!85094) (extraKeys!3295 lt!85094) (zeroValue!3397 lt!85094) (minValue!3397 lt!85094) #b00000000000000000000000000000000 (defaultEntry!3554 lt!85094)))))

(declare-fun lt!85275 () (_ BitVec 64))

(assert (=> b!171170 (= lt!85275 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85278 () (_ BitVec 64))

(assert (=> b!171170 (= lt!85278 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000))))

(declare-fun lt!85286 () Unit!5251)

(assert (=> b!171170 (= lt!85286 (addStillContains!105 lt!85289 lt!85275 (zeroValue!3397 lt!85094) lt!85278))))

(assert (=> b!171170 (contains!1139 (+!243 lt!85289 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094))) lt!85278)))

(declare-fun lt!85277 () Unit!5251)

(assert (=> b!171170 (= lt!85277 lt!85286)))

(declare-fun lt!85292 () ListLongMap!2131)

(assert (=> b!171170 (= lt!85292 (getCurrentListMapNoExtraKeys!160 (_keys!5386 lt!85094) (_values!3537 lt!85094) (mask!8382 lt!85094) (extraKeys!3295 lt!85094) (zeroValue!3397 lt!85094) (minValue!3397 lt!85094) #b00000000000000000000000000000000 (defaultEntry!3554 lt!85094)))))

(declare-fun lt!85294 () (_ BitVec 64))

(assert (=> b!171170 (= lt!85294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85276 () (_ BitVec 64))

(assert (=> b!171170 (= lt!85276 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000))))

(declare-fun lt!85274 () Unit!5251)

(assert (=> b!171170 (= lt!85274 (addApplyDifferent!105 lt!85292 lt!85294 (minValue!3397 lt!85094) lt!85276))))

(assert (=> b!171170 (= (apply!129 (+!243 lt!85292 (tuple2!3199 lt!85294 (minValue!3397 lt!85094))) lt!85276) (apply!129 lt!85292 lt!85276))))

(declare-fun lt!85279 () Unit!5251)

(assert (=> b!171170 (= lt!85279 lt!85274)))

(declare-fun lt!85293 () ListLongMap!2131)

(assert (=> b!171170 (= lt!85293 (getCurrentListMapNoExtraKeys!160 (_keys!5386 lt!85094) (_values!3537 lt!85094) (mask!8382 lt!85094) (extraKeys!3295 lt!85094) (zeroValue!3397 lt!85094) (minValue!3397 lt!85094) #b00000000000000000000000000000000 (defaultEntry!3554 lt!85094)))))

(declare-fun lt!85291 () (_ BitVec 64))

(assert (=> b!171170 (= lt!85291 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85282 () (_ BitVec 64))

(assert (=> b!171170 (= lt!85282 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000))))

(declare-fun lt!85287 () Unit!5251)

(assert (=> b!171170 (= lt!85287 (addApplyDifferent!105 lt!85293 lt!85291 (zeroValue!3397 lt!85094) lt!85282))))

(assert (=> b!171170 (= (apply!129 (+!243 lt!85293 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094))) lt!85282) (apply!129 lt!85293 lt!85282))))

(declare-fun lt!85283 () Unit!5251)

(assert (=> b!171170 (= lt!85283 lt!85287)))

(declare-fun lt!85281 () ListLongMap!2131)

(assert (=> b!171170 (= lt!85281 (getCurrentListMapNoExtraKeys!160 (_keys!5386 lt!85094) (_values!3537 lt!85094) (mask!8382 lt!85094) (extraKeys!3295 lt!85094) (zeroValue!3397 lt!85094) (minValue!3397 lt!85094) #b00000000000000000000000000000000 (defaultEntry!3554 lt!85094)))))

(declare-fun lt!85280 () (_ BitVec 64))

(assert (=> b!171170 (= lt!85280 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85288 () (_ BitVec 64))

(assert (=> b!171170 (= lt!85288 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000))))

(assert (=> b!171170 (= lt!85285 (addApplyDifferent!105 lt!85281 lt!85280 (minValue!3397 lt!85094) lt!85288))))

(assert (=> b!171170 (= (apply!129 (+!243 lt!85281 (tuple2!3199 lt!85280 (minValue!3397 lt!85094))) lt!85288) (apply!129 lt!85281 lt!85288))))

(declare-fun b!171171 () Bool)

(declare-fun Unit!5259 () Unit!5251)

(assert (=> b!171171 (= e!112993 Unit!5259)))

(declare-fun b!171172 () Bool)

(declare-fun e!112988 () Bool)

(declare-fun e!112990 () Bool)

(assert (=> b!171172 (= e!112988 e!112990)))

(declare-fun res!81362 () Bool)

(declare-fun call!17417 () Bool)

(assert (=> b!171172 (= res!81362 call!17417)))

(assert (=> b!171172 (=> (not res!81362) (not e!112990))))

(declare-fun bm!17414 () Bool)

(assert (=> bm!17414 (= call!17416 call!17421)))

(declare-fun b!171173 () Bool)

(declare-fun e!112987 () Bool)

(assert (=> b!171173 (= e!112997 e!112987)))

(declare-fun res!81369 () Bool)

(assert (=> b!171173 (= res!81369 call!17420)))

(assert (=> b!171173 (=> (not res!81369) (not e!112987))))

(declare-fun b!171174 () Bool)

(assert (=> b!171174 (= e!112990 (= (apply!129 lt!85290 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3397 lt!85094)))))

(declare-fun b!171175 () Bool)

(assert (=> b!171175 (= e!112989 (+!243 call!17415 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))))))

(declare-fun b!171176 () Bool)

(declare-fun c!30567 () Bool)

(assert (=> b!171176 (= c!30567 (and (not (= (bvand (extraKeys!3295 lt!85094) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3295 lt!85094) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!171176 (= e!112991 e!112986)))

(declare-fun bm!17415 () Bool)

(assert (=> bm!17415 (= call!17417 (contains!1139 lt!85290 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17416 () Bool)

(assert (=> bm!17416 (= call!17419 (getCurrentListMapNoExtraKeys!160 (_keys!5386 lt!85094) (_values!3537 lt!85094) (mask!8382 lt!85094) (extraKeys!3295 lt!85094) (zeroValue!3397 lt!85094) (minValue!3397 lt!85094) #b00000000000000000000000000000000 (defaultEntry!3554 lt!85094)))))

(declare-fun c!30566 () Bool)

(declare-fun bm!17417 () Bool)

(assert (=> bm!17417 (= call!17415 (+!243 (ite c!30566 call!17419 (ite c!30565 call!17421 call!17416)) (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))))))

(declare-fun b!171177 () Bool)

(declare-fun res!81366 () Bool)

(assert (=> b!171177 (=> (not res!81366) (not e!112994))))

(assert (=> b!171177 (= res!81366 e!112988)))

(declare-fun c!30562 () Bool)

(assert (=> b!171177 (= c!30562 (not (= (bvand (extraKeys!3295 lt!85094) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!51885 () Bool)

(assert (=> d!51885 e!112994))

(declare-fun res!81365 () Bool)

(assert (=> d!51885 (=> (not res!81365) (not e!112994))))

(assert (=> d!51885 (= res!81365 (or (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))))

(declare-fun lt!85273 () ListLongMap!2131)

(assert (=> d!51885 (= lt!85290 lt!85273)))

(declare-fun lt!85284 () Unit!5251)

(assert (=> d!51885 (= lt!85284 e!112993)))

(declare-fun c!30563 () Bool)

(declare-fun e!112995 () Bool)

(assert (=> d!51885 (= c!30563 e!112995)))

(declare-fun res!81363 () Bool)

(assert (=> d!51885 (=> (not res!81363) (not e!112995))))

(assert (=> d!51885 (= res!81363 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(assert (=> d!51885 (= lt!85273 e!112989)))

(assert (=> d!51885 (= c!30566 (and (not (= (bvand (extraKeys!3295 lt!85094) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3295 lt!85094) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!51885 (validMask!0 (mask!8382 lt!85094))))

(assert (=> d!51885 (= (getCurrentListMap!737 (_keys!5386 lt!85094) (_values!3537 lt!85094) (mask!8382 lt!85094) (extraKeys!3295 lt!85094) (zeroValue!3397 lt!85094) (minValue!3397 lt!85094) #b00000000000000000000000000000000 (defaultEntry!3554 lt!85094)) lt!85290)))

(declare-fun b!171168 () Bool)

(assert (=> b!171168 (= e!112988 (not call!17417))))

(declare-fun b!171178 () Bool)

(assert (=> b!171178 (= e!112986 call!17418)))

(declare-fun b!171179 () Bool)

(assert (=> b!171179 (= e!112987 (= (apply!129 lt!85290 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3397 lt!85094)))))

(declare-fun bm!17418 () Bool)

(assert (=> bm!17418 (= call!17420 (contains!1139 lt!85290 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171180 () Bool)

(assert (=> b!171180 (= e!112995 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun b!171181 () Bool)

(assert (=> b!171181 (= e!112992 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(assert (= (and d!51885 c!30566) b!171175))

(assert (= (and d!51885 (not c!30566)) b!171161))

(assert (= (and b!171161 c!30565) b!171162))

(assert (= (and b!171161 (not c!30565)) b!171176))

(assert (= (and b!171176 c!30567) b!171178))

(assert (= (and b!171176 (not c!30567)) b!171164))

(assert (= (or b!171178 b!171164) bm!17414))

(assert (= (or b!171162 bm!17414) bm!17413))

(assert (= (or b!171162 b!171178) bm!17412))

(assert (= (or b!171175 bm!17413) bm!17416))

(assert (= (or b!171175 bm!17412) bm!17417))

(assert (= (and d!51885 res!81363) b!171180))

(assert (= (and d!51885 c!30563) b!171170))

(assert (= (and d!51885 (not c!30563)) b!171171))

(assert (= (and d!51885 res!81365) b!171169))

(assert (= (and b!171169 res!81367) b!171181))

(assert (= (and b!171169 (not res!81361)) b!171165))

(assert (= (and b!171165 res!81368) b!171163))

(assert (= (and b!171169 res!81364) b!171177))

(assert (= (and b!171177 c!30562) b!171172))

(assert (= (and b!171177 (not c!30562)) b!171168))

(assert (= (and b!171172 res!81362) b!171174))

(assert (= (or b!171172 b!171168) bm!17415))

(assert (= (and b!171177 res!81366) b!171166))

(assert (= (and b!171166 c!30564) b!171173))

(assert (= (and b!171166 (not c!30564)) b!171167))

(assert (= (and b!171173 res!81369) b!171179))

(assert (= (or b!171173 b!171167) bm!17418))

(declare-fun b_lambda!6921 () Bool)

(assert (=> (not b_lambda!6921) (not b!171163)))

(declare-fun t!6976 () Bool)

(declare-fun tb!2759 () Bool)

(assert (=> (and b!170908 (= (defaultEntry!3554 thiss!1248) (defaultEntry!3554 lt!85094)) t!6976) tb!2759))

(declare-fun result!4559 () Bool)

(assert (=> tb!2759 (= result!4559 tp_is_empty!4003)))

(assert (=> b!171163 t!6976))

(declare-fun b_and!10673 () Bool)

(assert (= b_and!10671 (and (=> t!6976 result!4559) b_and!10673)))

(assert (=> b!171181 m!199631))

(assert (=> b!171181 m!199631))

(assert (=> b!171181 m!199633))

(assert (=> b!171165 m!199631))

(assert (=> b!171165 m!199631))

(declare-fun m!199645 () Bool)

(assert (=> b!171165 m!199645))

(declare-fun m!199647 () Bool)

(assert (=> bm!17417 m!199647))

(declare-fun m!199649 () Bool)

(assert (=> bm!17416 m!199649))

(assert (=> b!171180 m!199631))

(assert (=> b!171180 m!199631))

(assert (=> b!171180 m!199633))

(declare-fun m!199651 () Bool)

(assert (=> bm!17418 m!199651))

(declare-fun m!199653 () Bool)

(assert (=> b!171174 m!199653))

(declare-fun m!199655 () Bool)

(assert (=> b!171179 m!199655))

(declare-fun m!199657 () Bool)

(assert (=> b!171170 m!199657))

(declare-fun m!199659 () Bool)

(assert (=> b!171170 m!199659))

(assert (=> b!171170 m!199657))

(declare-fun m!199661 () Bool)

(assert (=> b!171170 m!199661))

(declare-fun m!199663 () Bool)

(assert (=> b!171170 m!199663))

(declare-fun m!199665 () Bool)

(assert (=> b!171170 m!199665))

(declare-fun m!199667 () Bool)

(assert (=> b!171170 m!199667))

(declare-fun m!199669 () Bool)

(assert (=> b!171170 m!199669))

(assert (=> b!171170 m!199649))

(declare-fun m!199671 () Bool)

(assert (=> b!171170 m!199671))

(declare-fun m!199673 () Bool)

(assert (=> b!171170 m!199673))

(assert (=> b!171170 m!199671))

(declare-fun m!199675 () Bool)

(assert (=> b!171170 m!199675))

(declare-fun m!199677 () Bool)

(assert (=> b!171170 m!199677))

(declare-fun m!199679 () Bool)

(assert (=> b!171170 m!199679))

(assert (=> b!171170 m!199667))

(assert (=> b!171170 m!199663))

(declare-fun m!199681 () Bool)

(assert (=> b!171170 m!199681))

(declare-fun m!199683 () Bool)

(assert (=> b!171170 m!199683))

(assert (=> b!171170 m!199631))

(declare-fun m!199685 () Bool)

(assert (=> b!171170 m!199685))

(declare-fun m!199687 () Bool)

(assert (=> b!171175 m!199687))

(declare-fun m!199689 () Bool)

(assert (=> b!171163 m!199689))

(declare-fun m!199691 () Bool)

(assert (=> b!171163 m!199691))

(assert (=> b!171163 m!199691))

(assert (=> b!171163 m!199689))

(declare-fun m!199693 () Bool)

(assert (=> b!171163 m!199693))

(assert (=> b!171163 m!199631))

(declare-fun m!199695 () Bool)

(assert (=> b!171163 m!199695))

(assert (=> b!171163 m!199631))

(declare-fun m!199697 () Bool)

(assert (=> d!51885 m!199697))

(declare-fun m!199699 () Bool)

(assert (=> bm!17415 m!199699))

(assert (=> d!51851 d!51885))

(declare-fun d!51887 () Bool)

(declare-fun e!112999 () Bool)

(assert (=> d!51887 e!112999))

(declare-fun res!81371 () Bool)

(assert (=> d!51887 (=> (not res!81371) (not e!112999))))

(declare-fun lt!85295 () ListLongMap!2131)

(assert (=> d!51887 (= res!81371 (contains!1139 lt!85295 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun lt!85296 () List!2176)

(assert (=> d!51887 (= lt!85295 (ListLongMap!2132 lt!85296))))

(declare-fun lt!85298 () Unit!5251)

(declare-fun lt!85297 () Unit!5251)

(assert (=> d!51887 (= lt!85298 lt!85297)))

(assert (=> d!51887 (= (getValueByKey!185 lt!85296 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!190 (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51887 (= lt!85297 (lemmaContainsTupThenGetReturnValue!98 lt!85296 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51887 (= lt!85296 (insertStrictlySorted!101 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393))) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51887 (= (+!243 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393)) (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85295)))

(declare-fun b!171182 () Bool)

(declare-fun res!81370 () Bool)

(assert (=> b!171182 (=> (not res!81370) (not e!112999))))

(assert (=> b!171182 (= res!81370 (= (getValueByKey!185 (toList!1081 lt!85295) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!190 (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171183 () Bool)

(assert (=> b!171183 (= e!112999 (contains!1141 (toList!1081 lt!85295) (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (= (and d!51887 res!81371) b!171182))

(assert (= (and b!171182 res!81370) b!171183))

(declare-fun m!199701 () Bool)

(assert (=> d!51887 m!199701))

(declare-fun m!199703 () Bool)

(assert (=> d!51887 m!199703))

(declare-fun m!199705 () Bool)

(assert (=> d!51887 m!199705))

(declare-fun m!199707 () Bool)

(assert (=> d!51887 m!199707))

(declare-fun m!199709 () Bool)

(assert (=> b!171182 m!199709))

(declare-fun m!199711 () Bool)

(assert (=> b!171183 m!199711))

(assert (=> bm!17394 d!51887))

(declare-fun d!51889 () Bool)

(assert (=> d!51889 (= (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!171048 d!51889))

(declare-fun d!51891 () Bool)

(declare-fun e!113000 () Bool)

(assert (=> d!51891 e!113000))

(declare-fun res!81372 () Bool)

(assert (=> d!51891 (=> res!81372 e!113000)))

(declare-fun lt!85299 () Bool)

(assert (=> d!51891 (= res!81372 (not lt!85299))))

(declare-fun lt!85301 () Bool)

(assert (=> d!51891 (= lt!85299 lt!85301)))

(declare-fun lt!85302 () Unit!5251)

(declare-fun e!113001 () Unit!5251)

(assert (=> d!51891 (= lt!85302 e!113001)))

(declare-fun c!30568 () Bool)

(assert (=> d!51891 (= c!30568 lt!85301)))

(assert (=> d!51891 (= lt!85301 (containsKey!188 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51891 (= (contains!1139 lt!85224 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85299)))

(declare-fun b!171184 () Bool)

(declare-fun lt!85300 () Unit!5251)

(assert (=> b!171184 (= e!113001 lt!85300)))

(assert (=> b!171184 (= lt!85300 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171184 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171185 () Bool)

(declare-fun Unit!5260 () Unit!5251)

(assert (=> b!171185 (= e!113001 Unit!5260)))

(declare-fun b!171186 () Bool)

(assert (=> b!171186 (= e!113000 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51891 c!30568) b!171184))

(assert (= (and d!51891 (not c!30568)) b!171185))

(assert (= (and d!51891 (not res!81372)) b!171186))

(declare-fun m!199713 () Bool)

(assert (=> d!51891 m!199713))

(declare-fun m!199715 () Bool)

(assert (=> b!171184 m!199715))

(assert (=> b!171184 m!199627))

(assert (=> b!171184 m!199627))

(declare-fun m!199717 () Bool)

(assert (=> b!171184 m!199717))

(assert (=> b!171186 m!199627))

(assert (=> b!171186 m!199627))

(assert (=> b!171186 m!199717))

(assert (=> bm!17399 d!51891))

(declare-fun d!51893 () Bool)

(declare-fun e!113002 () Bool)

(assert (=> d!51893 e!113002))

(declare-fun res!81373 () Bool)

(assert (=> d!51893 (=> res!81373 e!113002)))

(declare-fun lt!85303 () Bool)

(assert (=> d!51893 (= res!81373 (not lt!85303))))

(declare-fun lt!85305 () Bool)

(assert (=> d!51893 (= lt!85303 lt!85305)))

(declare-fun lt!85306 () Unit!5251)

(declare-fun e!113003 () Unit!5251)

(assert (=> d!51893 (= lt!85306 e!113003)))

(declare-fun c!30569 () Bool)

(assert (=> d!51893 (= c!30569 lt!85305)))

(assert (=> d!51893 (= lt!85305 (containsKey!188 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51893 (= (contains!1139 lt!85199 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85303)))

(declare-fun b!171187 () Bool)

(declare-fun lt!85304 () Unit!5251)

(assert (=> b!171187 (= e!113003 lt!85304)))

(assert (=> b!171187 (= lt!85304 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171187 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171188 () Bool)

(declare-fun Unit!5261 () Unit!5251)

(assert (=> b!171188 (= e!113003 Unit!5261)))

(declare-fun b!171189 () Bool)

(assert (=> b!171189 (= e!113002 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51893 c!30569) b!171187))

(assert (= (and d!51893 (not c!30569)) b!171188))

(assert (= (and d!51893 (not res!81373)) b!171189))

(declare-fun m!199719 () Bool)

(assert (=> d!51893 m!199719))

(declare-fun m!199721 () Bool)

(assert (=> b!171187 m!199721))

(declare-fun m!199723 () Bool)

(assert (=> b!171187 m!199723))

(assert (=> b!171187 m!199723))

(declare-fun m!199725 () Bool)

(assert (=> b!171187 m!199725))

(assert (=> b!171189 m!199723))

(assert (=> b!171189 m!199723))

(assert (=> b!171189 m!199725))

(assert (=> bm!17395 d!51893))

(declare-fun b!171200 () Bool)

(declare-fun e!113013 () Bool)

(declare-fun contains!1142 (List!2178 (_ BitVec 64)) Bool)

(assert (=> b!171200 (= e!113013 (contains!1142 Nil!2175 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun b!171201 () Bool)

(declare-fun e!113014 () Bool)

(declare-fun call!17424 () Bool)

(assert (=> b!171201 (= e!113014 call!17424)))

(declare-fun b!171202 () Bool)

(assert (=> b!171202 (= e!113014 call!17424)))

(declare-fun bm!17421 () Bool)

(declare-fun c!30572 () Bool)

(assert (=> bm!17421 (= call!17424 (arrayNoDuplicates!0 (_keys!5386 lt!85094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30572 (Cons!2174 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) Nil!2175) Nil!2175)))))

(declare-fun d!51895 () Bool)

(declare-fun res!81381 () Bool)

(declare-fun e!113015 () Bool)

(assert (=> d!51895 (=> res!81381 e!113015)))

(assert (=> d!51895 (= res!81381 (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(assert (=> d!51895 (= (arrayNoDuplicates!0 (_keys!5386 lt!85094) #b00000000000000000000000000000000 Nil!2175) e!113015)))

(declare-fun b!171203 () Bool)

(declare-fun e!113012 () Bool)

(assert (=> b!171203 (= e!113012 e!113014)))

(assert (=> b!171203 (= c!30572 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun b!171204 () Bool)

(assert (=> b!171204 (= e!113015 e!113012)))

(declare-fun res!81380 () Bool)

(assert (=> b!171204 (=> (not res!81380) (not e!113012))))

(assert (=> b!171204 (= res!81380 (not e!113013))))

(declare-fun res!81382 () Bool)

(assert (=> b!171204 (=> (not res!81382) (not e!113013))))

(assert (=> b!171204 (= res!81382 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(assert (= (and d!51895 (not res!81381)) b!171204))

(assert (= (and b!171204 res!81382) b!171200))

(assert (= (and b!171204 res!81380) b!171203))

(assert (= (and b!171203 c!30572) b!171201))

(assert (= (and b!171203 (not c!30572)) b!171202))

(assert (= (or b!171201 b!171202) bm!17421))

(assert (=> b!171200 m!199631))

(assert (=> b!171200 m!199631))

(declare-fun m!199727 () Bool)

(assert (=> b!171200 m!199727))

(assert (=> bm!17421 m!199631))

(declare-fun m!199729 () Bool)

(assert (=> bm!17421 m!199729))

(assert (=> b!171203 m!199631))

(assert (=> b!171203 m!199631))

(assert (=> b!171203 m!199633))

(assert (=> b!171204 m!199631))

(assert (=> b!171204 m!199631))

(assert (=> b!171204 m!199633))

(assert (=> b!171054 d!51895))

(declare-fun d!51897 () Bool)

(assert (=> d!51897 (= (apply!129 lt!85199 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1945 (getValueByKey!185 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7072 () Bool)

(assert (= bs!7072 d!51897))

(assert (=> bs!7072 m!199723))

(assert (=> bs!7072 m!199723))

(declare-fun m!199731 () Bool)

(assert (=> bs!7072 m!199731))

(assert (=> b!171047 d!51897))

(declare-fun d!51899 () Bool)

(declare-fun e!113016 () Bool)

(assert (=> d!51899 e!113016))

(declare-fun res!81383 () Bool)

(assert (=> d!51899 (=> res!81383 e!113016)))

(declare-fun lt!85307 () Bool)

(assert (=> d!51899 (= res!81383 (not lt!85307))))

(declare-fun lt!85309 () Bool)

(assert (=> d!51899 (= lt!85307 lt!85309)))

(declare-fun lt!85310 () Unit!5251)

(declare-fun e!113017 () Unit!5251)

(assert (=> d!51899 (= lt!85310 e!113017)))

(declare-fun c!30573 () Bool)

(assert (=> d!51899 (= c!30573 lt!85309)))

(assert (=> d!51899 (= lt!85309 (containsKey!188 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!51899 (= (contains!1139 lt!85229 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85307)))

(declare-fun b!171205 () Bool)

(declare-fun lt!85308 () Unit!5251)

(assert (=> b!171205 (= e!113017 lt!85308)))

(assert (=> b!171205 (= lt!85308 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> b!171205 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171206 () Bool)

(declare-fun Unit!5262 () Unit!5251)

(assert (=> b!171206 (= e!113017 Unit!5262)))

(declare-fun b!171207 () Bool)

(assert (=> b!171207 (= e!113016 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!51899 c!30573) b!171205))

(assert (= (and d!51899 (not c!30573)) b!171206))

(assert (= (and d!51899 (not res!81383)) b!171207))

(declare-fun m!199733 () Bool)

(assert (=> d!51899 m!199733))

(declare-fun m!199735 () Bool)

(assert (=> b!171205 m!199735))

(assert (=> b!171205 m!199579))

(assert (=> b!171205 m!199579))

(declare-fun m!199737 () Bool)

(assert (=> b!171205 m!199737))

(assert (=> b!171207 m!199579))

(assert (=> b!171207 m!199579))

(assert (=> b!171207 m!199737))

(assert (=> d!51863 d!51899))

(declare-fun b!171217 () Bool)

(declare-fun e!113022 () Option!191)

(declare-fun e!113023 () Option!191)

(assert (=> b!171217 (= e!113022 e!113023)))

(declare-fun c!30579 () Bool)

(assert (=> b!171217 (= c!30579 (and ((_ is Cons!2172) lt!85230) (not (= (_1!1610 (h!2789 lt!85230)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!171218 () Bool)

(assert (=> b!171218 (= e!113023 (getValueByKey!185 (t!6970 lt!85230) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!51901 () Bool)

(declare-fun c!30578 () Bool)

(assert (=> d!51901 (= c!30578 (and ((_ is Cons!2172) lt!85230) (= (_1!1610 (h!2789 lt!85230)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51901 (= (getValueByKey!185 lt!85230 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113022)))

(declare-fun b!171216 () Bool)

(assert (=> b!171216 (= e!113022 (Some!190 (_2!1610 (h!2789 lt!85230))))))

(declare-fun b!171219 () Bool)

(assert (=> b!171219 (= e!113023 None!189)))

(assert (= (and d!51901 c!30578) b!171216))

(assert (= (and d!51901 (not c!30578)) b!171217))

(assert (= (and b!171217 c!30579) b!171218))

(assert (= (and b!171217 (not c!30579)) b!171219))

(declare-fun m!199739 () Bool)

(assert (=> b!171218 m!199739))

(assert (=> d!51863 d!51901))

(declare-fun d!51903 () Bool)

(assert (=> d!51903 (= (getValueByKey!185 lt!85230 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85313 () Unit!5251)

(declare-fun choose!930 (List!2176 (_ BitVec 64) V!4985) Unit!5251)

(assert (=> d!51903 (= lt!85313 (choose!930 lt!85230 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!113026 () Bool)

(assert (=> d!51903 e!113026))

(declare-fun res!81388 () Bool)

(assert (=> d!51903 (=> (not res!81388) (not e!113026))))

(declare-fun isStrictlySorted!318 (List!2176) Bool)

(assert (=> d!51903 (= res!81388 (isStrictlySorted!318 lt!85230))))

(assert (=> d!51903 (= (lemmaContainsTupThenGetReturnValue!98 lt!85230 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85313)))

(declare-fun b!171224 () Bool)

(declare-fun res!81389 () Bool)

(assert (=> b!171224 (=> (not res!81389) (not e!113026))))

(assert (=> b!171224 (= res!81389 (containsKey!188 lt!85230 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171225 () Bool)

(assert (=> b!171225 (= e!113026 (contains!1141 lt!85230 (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!51903 res!81388) b!171224))

(assert (= (and b!171224 res!81389) b!171225))

(assert (=> d!51903 m!199573))

(declare-fun m!199741 () Bool)

(assert (=> d!51903 m!199741))

(declare-fun m!199743 () Bool)

(assert (=> d!51903 m!199743))

(declare-fun m!199745 () Bool)

(assert (=> b!171224 m!199745))

(declare-fun m!199747 () Bool)

(assert (=> b!171225 m!199747))

(assert (=> d!51863 d!51903))

(declare-fun b!171246 () Bool)

(declare-fun e!113039 () List!2176)

(declare-fun call!17433 () List!2176)

(assert (=> b!171246 (= e!113039 call!17433)))

(declare-fun b!171247 () Bool)

(assert (=> b!171247 (= e!113039 call!17433)))

(declare-fun b!171248 () Bool)

(declare-fun c!30588 () Bool)

(assert (=> b!171248 (= c!30588 (and ((_ is Cons!2172) (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (bvsgt (_1!1610 (h!2789 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!113038 () List!2176)

(assert (=> b!171248 (= e!113038 e!113039)))

(declare-fun d!51905 () Bool)

(declare-fun e!113037 () Bool)

(assert (=> d!51905 e!113037))

(declare-fun res!81395 () Bool)

(assert (=> d!51905 (=> (not res!81395) (not e!113037))))

(declare-fun lt!85316 () List!2176)

(assert (=> d!51905 (= res!81395 (isStrictlySorted!318 lt!85316))))

(declare-fun e!113041 () List!2176)

(assert (=> d!51905 (= lt!85316 e!113041)))

(declare-fun c!30589 () Bool)

(assert (=> d!51905 (= c!30589 (and ((_ is Cons!2172) (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (bvslt (_1!1610 (h!2789 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51905 (isStrictlySorted!318 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))))

(assert (=> d!51905 (= (insertStrictlySorted!101 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85316)))

(declare-fun b!171249 () Bool)

(assert (=> b!171249 (= e!113041 e!113038)))

(declare-fun c!30590 () Bool)

(assert (=> b!171249 (= c!30590 (and ((_ is Cons!2172) (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (= (_1!1610 (h!2789 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171250 () Bool)

(assert (=> b!171250 (= e!113037 (contains!1141 lt!85316 (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171251 () Bool)

(declare-fun call!17431 () List!2176)

(assert (=> b!171251 (= e!113038 call!17431)))

(declare-fun e!113040 () List!2176)

(declare-fun b!171252 () Bool)

(assert (=> b!171252 (= e!113040 (ite c!30590 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (ite c!30588 (Cons!2172 (h!2789 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) Nil!2173)))))

(declare-fun bm!17428 () Bool)

(declare-fun call!17432 () List!2176)

(assert (=> bm!17428 (= call!17431 call!17432)))

(declare-fun b!171253 () Bool)

(assert (=> b!171253 (= e!113041 call!17432)))

(declare-fun b!171254 () Bool)

(assert (=> b!171254 (= e!113040 (insertStrictlySorted!101 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun bm!17429 () Bool)

(assert (=> bm!17429 (= call!17433 call!17431)))

(declare-fun b!171255 () Bool)

(declare-fun res!81394 () Bool)

(assert (=> b!171255 (=> (not res!81394) (not e!113037))))

(assert (=> b!171255 (= res!81394 (containsKey!188 lt!85316 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun bm!17430 () Bool)

(declare-fun $colon$colon!96 (List!2176 tuple2!3198) List!2176)

(assert (=> bm!17430 (= call!17432 ($colon$colon!96 e!113040 (ite c!30589 (h!2789 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!30591 () Bool)

(assert (=> bm!17430 (= c!30591 c!30589)))

(assert (= (and d!51905 c!30589) b!171253))

(assert (= (and d!51905 (not c!30589)) b!171249))

(assert (= (and b!171249 c!30590) b!171251))

(assert (= (and b!171249 (not c!30590)) b!171248))

(assert (= (and b!171248 c!30588) b!171246))

(assert (= (and b!171248 (not c!30588)) b!171247))

(assert (= (or b!171246 b!171247) bm!17429))

(assert (= (or b!171251 bm!17429) bm!17428))

(assert (= (or b!171253 bm!17428) bm!17430))

(assert (= (and bm!17430 c!30591) b!171254))

(assert (= (and bm!17430 (not c!30591)) b!171252))

(assert (= (and d!51905 res!81395) b!171255))

(assert (= (and b!171255 res!81394) b!171250))

(declare-fun m!199749 () Bool)

(assert (=> b!171254 m!199749))

(declare-fun m!199751 () Bool)

(assert (=> b!171255 m!199751))

(declare-fun m!199753 () Bool)

(assert (=> d!51905 m!199753))

(declare-fun m!199755 () Bool)

(assert (=> d!51905 m!199755))

(declare-fun m!199757 () Bool)

(assert (=> bm!17430 m!199757))

(declare-fun m!199759 () Bool)

(assert (=> b!171250 m!199759))

(assert (=> d!51863 d!51905))

(declare-fun d!51907 () Bool)

(declare-fun e!113042 () Bool)

(assert (=> d!51907 e!113042))

(declare-fun res!81397 () Bool)

(assert (=> d!51907 (=> (not res!81397) (not e!113042))))

(declare-fun lt!85317 () ListLongMap!2131)

(assert (=> d!51907 (= res!81397 (contains!1139 lt!85317 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85318 () List!2176)

(assert (=> d!51907 (= lt!85317 (ListLongMap!2132 lt!85318))))

(declare-fun lt!85320 () Unit!5251)

(declare-fun lt!85319 () Unit!5251)

(assert (=> d!51907 (= lt!85320 lt!85319)))

(assert (=> d!51907 (= (getValueByKey!185 lt!85318 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!51907 (= lt!85319 (lemmaContainsTupThenGetReturnValue!98 lt!85318 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!51907 (= lt!85318 (insertStrictlySorted!101 (toList!1081 call!17399) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!51907 (= (+!243 call!17399 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) lt!85317)))

(declare-fun b!171256 () Bool)

(declare-fun res!81396 () Bool)

(assert (=> b!171256 (=> (not res!81396) (not e!113042))))

(assert (=> b!171256 (= res!81396 (= (getValueByKey!185 (toList!1081 lt!85317) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171257 () Bool)

(assert (=> b!171257 (= e!113042 (contains!1141 (toList!1081 lt!85317) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(assert (= (and d!51907 res!81397) b!171256))

(assert (= (and b!171256 res!81396) b!171257))

(declare-fun m!199761 () Bool)

(assert (=> d!51907 m!199761))

(declare-fun m!199763 () Bool)

(assert (=> d!51907 m!199763))

(declare-fun m!199765 () Bool)

(assert (=> d!51907 m!199765))

(declare-fun m!199767 () Bool)

(assert (=> d!51907 m!199767))

(declare-fun m!199769 () Bool)

(assert (=> b!171256 m!199769))

(declare-fun m!199771 () Bool)

(assert (=> b!171257 m!199771))

(assert (=> b!171069 d!51907))

(declare-fun b!171258 () Bool)

(declare-fun e!113044 () Bool)

(declare-fun e!113043 () Bool)

(assert (=> b!171258 (= e!113044 e!113043)))

(declare-fun c!30592 () Bool)

(assert (=> b!171258 (= c!30592 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51909 () Bool)

(declare-fun res!81399 () Bool)

(assert (=> d!51909 (=> res!81399 e!113044)))

(assert (=> d!51909 (= res!81399 (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!51909 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5386 thiss!1248) (mask!8382 thiss!1248)) e!113044)))

(declare-fun b!171259 () Bool)

(declare-fun call!17434 () Bool)

(assert (=> b!171259 (= e!113043 call!17434)))

(declare-fun b!171260 () Bool)

(declare-fun e!113045 () Bool)

(assert (=> b!171260 (= e!113043 e!113045)))

(declare-fun lt!85323 () (_ BitVec 64))

(assert (=> b!171260 (= lt!85323 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85321 () Unit!5251)

(assert (=> b!171260 (= lt!85321 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5386 thiss!1248) lt!85323 #b00000000000000000000000000000000))))

(assert (=> b!171260 (arrayContainsKey!0 (_keys!5386 thiss!1248) lt!85323 #b00000000000000000000000000000000)))

(declare-fun lt!85322 () Unit!5251)

(assert (=> b!171260 (= lt!85322 lt!85321)))

(declare-fun res!81398 () Bool)

(assert (=> b!171260 (= res!81398 (= (seekEntryOrOpen!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (_keys!5386 thiss!1248) (mask!8382 thiss!1248)) (Found!528 #b00000000000000000000000000000000)))))

(assert (=> b!171260 (=> (not res!81398) (not e!113045))))

(declare-fun b!171261 () Bool)

(assert (=> b!171261 (= e!113045 call!17434)))

(declare-fun bm!17431 () Bool)

(assert (=> bm!17431 (= call!17434 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5386 thiss!1248) (mask!8382 thiss!1248)))))

(assert (= (and d!51909 (not res!81399)) b!171258))

(assert (= (and b!171258 c!30592) b!171260))

(assert (= (and b!171258 (not c!30592)) b!171259))

(assert (= (and b!171260 res!81398) b!171261))

(assert (= (or b!171261 b!171259) bm!17431))

(assert (=> b!171258 m!199453))

(assert (=> b!171258 m!199453))

(assert (=> b!171258 m!199455))

(assert (=> b!171260 m!199453))

(declare-fun m!199773 () Bool)

(assert (=> b!171260 m!199773))

(declare-fun m!199775 () Bool)

(assert (=> b!171260 m!199775))

(assert (=> b!171260 m!199453))

(declare-fun m!199777 () Bool)

(assert (=> b!171260 m!199777))

(declare-fun m!199779 () Bool)

(assert (=> bm!17431 m!199779))

(assert (=> b!170985 d!51909))

(declare-fun d!51911 () Bool)

(declare-fun e!113046 () Bool)

(assert (=> d!51911 e!113046))

(declare-fun res!81401 () Bool)

(assert (=> d!51911 (=> (not res!81401) (not e!113046))))

(declare-fun lt!85324 () ListLongMap!2131)

(assert (=> d!51911 (= res!81401 (contains!1139 lt!85324 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun lt!85325 () List!2176)

(assert (=> d!51911 (= lt!85324 (ListLongMap!2132 lt!85325))))

(declare-fun lt!85327 () Unit!5251)

(declare-fun lt!85326 () Unit!5251)

(assert (=> d!51911 (= lt!85327 lt!85326)))

(assert (=> d!51911 (= (getValueByKey!185 lt!85325 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!190 (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51911 (= lt!85326 (lemmaContainsTupThenGetReturnValue!98 lt!85325 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51911 (= lt!85325 (insertStrictlySorted!101 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400))) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!51911 (= (+!243 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400)) (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85324)))

(declare-fun b!171262 () Bool)

(declare-fun res!81400 () Bool)

(assert (=> b!171262 (=> (not res!81400) (not e!113046))))

(assert (=> b!171262 (= res!81400 (= (getValueByKey!185 (toList!1081 lt!85324) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!190 (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171263 () Bool)

(assert (=> b!171263 (= e!113046 (contains!1141 (toList!1081 lt!85324) (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (= (and d!51911 res!81401) b!171262))

(assert (= (and b!171262 res!81400) b!171263))

(declare-fun m!199781 () Bool)

(assert (=> d!51911 m!199781))

(declare-fun m!199783 () Bool)

(assert (=> d!51911 m!199783))

(declare-fun m!199785 () Bool)

(assert (=> d!51911 m!199785))

(declare-fun m!199787 () Bool)

(assert (=> d!51911 m!199787))

(declare-fun m!199789 () Bool)

(assert (=> b!171262 m!199789))

(declare-fun m!199791 () Bool)

(assert (=> b!171263 m!199791))

(assert (=> bm!17401 d!51911))

(declare-fun d!51913 () Bool)

(declare-fun lt!85328 () (_ BitVec 32))

(assert (=> d!51913 (and (bvsge lt!85328 #b00000000000000000000000000000000) (bvsle lt!85328 (bvsub (size!3673 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113048 () (_ BitVec 32))

(assert (=> d!51913 (= lt!85328 e!113048)))

(declare-fun c!30593 () Bool)

(assert (=> d!51913 (= c!30593 (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!51913 (and (bvsle #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3673 (_keys!5386 thiss!1248)) (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!51913 (= (arrayCountValidKeys!0 (_keys!5386 thiss!1248) #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))) lt!85328)))

(declare-fun bm!17432 () Bool)

(declare-fun call!17435 () (_ BitVec 32))

(assert (=> bm!17432 (= call!17435 (arrayCountValidKeys!0 (_keys!5386 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171264 () Bool)

(declare-fun e!113047 () (_ BitVec 32))

(assert (=> b!171264 (= e!113047 (bvadd #b00000000000000000000000000000001 call!17435))))

(declare-fun b!171265 () Bool)

(assert (=> b!171265 (= e!113048 #b00000000000000000000000000000000)))

(declare-fun b!171266 () Bool)

(assert (=> b!171266 (= e!113047 call!17435)))

(declare-fun b!171267 () Bool)

(assert (=> b!171267 (= e!113048 e!113047)))

(declare-fun c!30594 () Bool)

(assert (=> b!171267 (= c!30594 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51913 c!30593) b!171265))

(assert (= (and d!51913 (not c!30593)) b!171267))

(assert (= (and b!171267 c!30594) b!171264))

(assert (= (and b!171267 (not c!30594)) b!171266))

(assert (= (or b!171264 b!171266) bm!17432))

(declare-fun m!199793 () Bool)

(assert (=> bm!17432 m!199793))

(assert (=> b!171267 m!199453))

(assert (=> b!171267 m!199453))

(assert (=> b!171267 m!199455))

(assert (=> b!170984 d!51913))

(declare-fun b!171268 () Bool)

(declare-fun e!113054 () Bool)

(declare-fun e!113052 () Bool)

(assert (=> b!171268 (= e!113054 e!113052)))

(declare-fun c!30597 () Bool)

(assert (=> b!171268 (= c!30597 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171269 () Bool)

(declare-fun lt!85330 () ListLongMap!2131)

(assert (=> b!171269 (= e!113052 (= lt!85330 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248))))))

(declare-fun b!171270 () Bool)

(declare-fun e!113049 () ListLongMap!2131)

(declare-fun call!17436 () ListLongMap!2131)

(assert (=> b!171270 (= e!113049 call!17436)))

(declare-fun d!51915 () Bool)

(declare-fun e!113055 () Bool)

(assert (=> d!51915 e!113055))

(declare-fun res!81402 () Bool)

(assert (=> d!51915 (=> (not res!81402) (not e!113055))))

(assert (=> d!51915 (= res!81402 (not (contains!1139 lt!85330 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!113051 () ListLongMap!2131)

(assert (=> d!51915 (= lt!85330 e!113051)))

(declare-fun c!30596 () Bool)

(assert (=> d!51915 (= c!30596 (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!51915 (validMask!0 (mask!8382 thiss!1248))))

(assert (=> d!51915 (= (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)) lt!85330)))

(declare-fun b!171271 () Bool)

(assert (=> b!171271 (= e!113055 e!113054)))

(declare-fun c!30595 () Bool)

(declare-fun e!113050 () Bool)

(assert (=> b!171271 (= c!30595 e!113050)))

(declare-fun res!81405 () Bool)

(assert (=> b!171271 (=> (not res!81405) (not e!113050))))

(assert (=> b!171271 (= res!81405 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171272 () Bool)

(assert (=> b!171272 (= e!113050 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171272 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!171273 () Bool)

(declare-fun res!81403 () Bool)

(assert (=> b!171273 (=> (not res!81403) (not e!113055))))

(assert (=> b!171273 (= res!81403 (not (contains!1139 lt!85330 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171274 () Bool)

(assert (=> b!171274 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> b!171274 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3674 (_values!3537 thiss!1248))))))

(declare-fun e!113053 () Bool)

(assert (=> b!171274 (= e!113053 (= (apply!129 lt!85330 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171275 () Bool)

(assert (=> b!171275 (= e!113051 (ListLongMap!2132 Nil!2173))))

(declare-fun b!171276 () Bool)

(declare-fun lt!85329 () Unit!5251)

(declare-fun lt!85334 () Unit!5251)

(assert (=> b!171276 (= lt!85329 lt!85334)))

(declare-fun lt!85331 () ListLongMap!2131)

(declare-fun lt!85333 () (_ BitVec 64))

(declare-fun lt!85335 () V!4985)

(declare-fun lt!85332 () (_ BitVec 64))

(assert (=> b!171276 (not (contains!1139 (+!243 lt!85331 (tuple2!3199 lt!85332 lt!85335)) lt!85333))))

(assert (=> b!171276 (= lt!85334 (addStillNotContains!73 lt!85331 lt!85332 lt!85335 lt!85333))))

(assert (=> b!171276 (= lt!85333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171276 (= lt!85335 (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171276 (= lt!85332 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!171276 (= lt!85331 call!17436)))

(assert (=> b!171276 (= e!113049 (+!243 call!17436 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!171277 () Bool)

(assert (=> b!171277 (= e!113054 e!113053)))

(assert (=> b!171277 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun res!81404 () Bool)

(assert (=> b!171277 (= res!81404 (contains!1139 lt!85330 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171277 (=> (not res!81404) (not e!113053))))

(declare-fun bm!17433 () Bool)

(assert (=> bm!17433 (= call!17436 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)))))

(declare-fun b!171278 () Bool)

(assert (=> b!171278 (= e!113051 e!113049)))

(declare-fun c!30598 () Bool)

(assert (=> b!171278 (= c!30598 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171279 () Bool)

(assert (=> b!171279 (= e!113052 (isEmpty!439 lt!85330))))

(assert (= (and d!51915 c!30596) b!171275))

(assert (= (and d!51915 (not c!30596)) b!171278))

(assert (= (and b!171278 c!30598) b!171276))

(assert (= (and b!171278 (not c!30598)) b!171270))

(assert (= (or b!171276 b!171270) bm!17433))

(assert (= (and d!51915 res!81402) b!171273))

(assert (= (and b!171273 res!81403) b!171271))

(assert (= (and b!171271 res!81405) b!171272))

(assert (= (and b!171271 c!30595) b!171277))

(assert (= (and b!171271 (not c!30595)) b!171268))

(assert (= (and b!171277 res!81404) b!171274))

(assert (= (and b!171268 c!30597) b!171269))

(assert (= (and b!171268 (not c!30597)) b!171279))

(declare-fun b_lambda!6923 () Bool)

(assert (=> (not b_lambda!6923) (not b!171274)))

(assert (=> b!171274 t!6973))

(declare-fun b_and!10675 () Bool)

(assert (= b_and!10673 (and (=> t!6973 result!4553) b_and!10675)))

(declare-fun b_lambda!6925 () Bool)

(assert (=> (not b_lambda!6925) (not b!171276)))

(assert (=> b!171276 t!6973))

(declare-fun b_and!10677 () Bool)

(assert (= b_and!10675 (and (=> t!6973 result!4553) b_and!10677)))

(assert (=> b!171277 m!199453))

(assert (=> b!171277 m!199453))

(declare-fun m!199795 () Bool)

(assert (=> b!171277 m!199795))

(assert (=> b!171278 m!199453))

(assert (=> b!171278 m!199453))

(assert (=> b!171278 m!199455))

(declare-fun m!199797 () Bool)

(assert (=> d!51915 m!199797))

(assert (=> d!51915 m!199509))

(declare-fun m!199799 () Bool)

(assert (=> b!171276 m!199799))

(declare-fun m!199801 () Bool)

(assert (=> b!171276 m!199801))

(declare-fun m!199803 () Bool)

(assert (=> b!171276 m!199803))

(declare-fun m!199805 () Bool)

(assert (=> b!171276 m!199805))

(assert (=> b!171276 m!199503))

(assert (=> b!171276 m!199501))

(assert (=> b!171276 m!199453))

(assert (=> b!171276 m!199801))

(assert (=> b!171276 m!199503))

(assert (=> b!171276 m!199501))

(assert (=> b!171276 m!199505))

(assert (=> b!171272 m!199453))

(assert (=> b!171272 m!199453))

(assert (=> b!171272 m!199455))

(declare-fun m!199807 () Bool)

(assert (=> b!171269 m!199807))

(assert (=> bm!17433 m!199807))

(assert (=> b!171274 m!199453))

(declare-fun m!199809 () Bool)

(assert (=> b!171274 m!199809))

(assert (=> b!171274 m!199503))

(assert (=> b!171274 m!199503))

(assert (=> b!171274 m!199501))

(assert (=> b!171274 m!199505))

(assert (=> b!171274 m!199501))

(assert (=> b!171274 m!199453))

(declare-fun m!199811 () Bool)

(assert (=> b!171279 m!199811))

(declare-fun m!199813 () Bool)

(assert (=> b!171273 m!199813))

(assert (=> bm!17400 d!51915))

(assert (=> b!171049 d!51889))

(declare-fun b!171289 () Bool)

(declare-fun res!81415 () Bool)

(declare-fun e!113058 () Bool)

(assert (=> b!171289 (=> (not res!81415) (not e!113058))))

(declare-fun size!3679 (LongMapFixedSize!2224) (_ BitVec 32))

(assert (=> b!171289 (= res!81415 (bvsge (size!3679 thiss!1248) (_size!1161 thiss!1248)))))

(declare-fun b!171288 () Bool)

(declare-fun res!81414 () Bool)

(assert (=> b!171288 (=> (not res!81414) (not e!113058))))

(assert (=> b!171288 (= res!81414 (and (= (size!3674 (_values!3537 thiss!1248)) (bvadd (mask!8382 thiss!1248) #b00000000000000000000000000000001)) (= (size!3673 (_keys!5386 thiss!1248)) (size!3674 (_values!3537 thiss!1248))) (bvsge (_size!1161 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1161 thiss!1248) (bvadd (mask!8382 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!51917 () Bool)

(declare-fun res!81416 () Bool)

(assert (=> d!51917 (=> (not res!81416) (not e!113058))))

(assert (=> d!51917 (= res!81416 (validMask!0 (mask!8382 thiss!1248)))))

(assert (=> d!51917 (= (simpleValid!135 thiss!1248) e!113058)))

(declare-fun b!171291 () Bool)

(assert (=> b!171291 (= e!113058 (and (bvsge (extraKeys!3295 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3295 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1161 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!171290 () Bool)

(declare-fun res!81417 () Bool)

(assert (=> b!171290 (=> (not res!81417) (not e!113058))))

(assert (=> b!171290 (= res!81417 (= (size!3679 thiss!1248) (bvadd (_size!1161 thiss!1248) (bvsdiv (bvadd (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!51917 res!81416) b!171288))

(assert (= (and b!171288 res!81414) b!171289))

(assert (= (and b!171289 res!81415) b!171290))

(assert (= (and b!171290 res!81417) b!171291))

(declare-fun m!199815 () Bool)

(assert (=> b!171289 m!199815))

(assert (=> d!51917 m!199509))

(assert (=> b!171290 m!199815))

(assert (=> d!51853 d!51917))

(declare-fun d!51919 () Bool)

(declare-fun e!113059 () Bool)

(assert (=> d!51919 e!113059))

(declare-fun res!81418 () Bool)

(assert (=> d!51919 (=> res!81418 e!113059)))

(declare-fun lt!85336 () Bool)

(assert (=> d!51919 (= res!81418 (not lt!85336))))

(declare-fun lt!85338 () Bool)

(assert (=> d!51919 (= lt!85336 lt!85338)))

(declare-fun lt!85339 () Unit!5251)

(declare-fun e!113060 () Unit!5251)

(assert (=> d!51919 (= lt!85339 e!113060)))

(declare-fun c!30599 () Bool)

(assert (=> d!51919 (= c!30599 lt!85338)))

(assert (=> d!51919 (= lt!85338 (containsKey!188 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51919 (= (contains!1139 lt!85199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) lt!85336)))

(declare-fun b!171292 () Bool)

(declare-fun lt!85337 () Unit!5251)

(assert (=> b!171292 (= e!113060 lt!85337)))

(assert (=> b!171292 (= lt!85337 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171292 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171293 () Bool)

(declare-fun Unit!5263 () Unit!5251)

(assert (=> b!171293 (= e!113060 Unit!5263)))

(declare-fun b!171294 () Bool)

(assert (=> b!171294 (= e!113059 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!51919 c!30599) b!171292))

(assert (= (and d!51919 (not c!30599)) b!171293))

(assert (= (and d!51919 (not res!81418)) b!171294))

(assert (=> d!51919 m!199453))

(declare-fun m!199817 () Bool)

(assert (=> d!51919 m!199817))

(assert (=> b!171292 m!199453))

(declare-fun m!199819 () Bool)

(assert (=> b!171292 m!199819))

(assert (=> b!171292 m!199453))

(assert (=> b!171292 m!199619))

(assert (=> b!171292 m!199619))

(declare-fun m!199821 () Bool)

(assert (=> b!171292 m!199821))

(assert (=> b!171294 m!199453))

(assert (=> b!171294 m!199619))

(assert (=> b!171294 m!199619))

(assert (=> b!171294 m!199821))

(assert (=> b!171033 d!51919))

(declare-fun d!51921 () Bool)

(assert (=> d!51921 (= (apply!129 lt!85224 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1945 (getValueByKey!185 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7073 () Bool)

(assert (= bs!7073 d!51921))

(declare-fun m!199823 () Bool)

(assert (=> bs!7073 m!199823))

(assert (=> bs!7073 m!199823))

(declare-fun m!199825 () Bool)

(assert (=> bs!7073 m!199825))

(assert (=> b!171073 d!51921))

(declare-fun d!51923 () Bool)

(assert (=> d!51923 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85093) key!828))))

(declare-fun lt!85342 () Unit!5251)

(declare-fun choose!931 (List!2176 (_ BitVec 64)) Unit!5251)

(assert (=> d!51923 (= lt!85342 (choose!931 (toList!1081 lt!85093) key!828))))

(declare-fun e!113063 () Bool)

(assert (=> d!51923 e!113063))

(declare-fun res!81421 () Bool)

(assert (=> d!51923 (=> (not res!81421) (not e!113063))))

(assert (=> d!51923 (= res!81421 (isStrictlySorted!318 (toList!1081 lt!85093)))))

(assert (=> d!51923 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85093) key!828) lt!85342)))

(declare-fun b!171297 () Bool)

(assert (=> b!171297 (= e!113063 (containsKey!188 (toList!1081 lt!85093) key!828))))

(assert (= (and d!51923 res!81421) b!171297))

(assert (=> d!51923 m!199439))

(assert (=> d!51923 m!199439))

(assert (=> d!51923 m!199441))

(declare-fun m!199827 () Bool)

(assert (=> d!51923 m!199827))

(declare-fun m!199829 () Bool)

(assert (=> d!51923 m!199829))

(assert (=> b!171297 m!199435))

(assert (=> b!170975 d!51923))

(declare-fun d!51925 () Bool)

(declare-fun isEmpty!440 (Option!191) Bool)

(assert (=> d!51925 (= (isDefined!137 (getValueByKey!185 (toList!1081 lt!85093) key!828)) (not (isEmpty!440 (getValueByKey!185 (toList!1081 lt!85093) key!828))))))

(declare-fun bs!7074 () Bool)

(assert (= bs!7074 d!51925))

(assert (=> bs!7074 m!199439))

(declare-fun m!199831 () Bool)

(assert (=> bs!7074 m!199831))

(assert (=> b!170975 d!51925))

(declare-fun b!171299 () Bool)

(declare-fun e!113064 () Option!191)

(declare-fun e!113065 () Option!191)

(assert (=> b!171299 (= e!113064 e!113065)))

(declare-fun c!30601 () Bool)

(assert (=> b!171299 (= c!30601 (and ((_ is Cons!2172) (toList!1081 lt!85093)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85093))) key!828))))))

(declare-fun b!171300 () Bool)

(assert (=> b!171300 (= e!113065 (getValueByKey!185 (t!6970 (toList!1081 lt!85093)) key!828))))

(declare-fun d!51927 () Bool)

(declare-fun c!30600 () Bool)

(assert (=> d!51927 (= c!30600 (and ((_ is Cons!2172) (toList!1081 lt!85093)) (= (_1!1610 (h!2789 (toList!1081 lt!85093))) key!828)))))

(assert (=> d!51927 (= (getValueByKey!185 (toList!1081 lt!85093) key!828) e!113064)))

(declare-fun b!171298 () Bool)

(assert (=> b!171298 (= e!113064 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85093)))))))

(declare-fun b!171301 () Bool)

(assert (=> b!171301 (= e!113065 None!189)))

(assert (= (and d!51927 c!30600) b!171298))

(assert (= (and d!51927 (not c!30600)) b!171299))

(assert (= (and b!171299 c!30601) b!171300))

(assert (= (and b!171299 (not c!30601)) b!171301))

(declare-fun m!199833 () Bool)

(assert (=> b!171300 m!199833))

(assert (=> b!170975 d!51927))

(declare-fun d!51929 () Bool)

(assert (=> d!51929 (= (apply!129 lt!85224 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) (get!1945 (getValueByKey!185 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7075 () Bool)

(assert (= bs!7075 d!51929))

(assert (=> bs!7075 m!199453))

(declare-fun m!199835 () Bool)

(assert (=> bs!7075 m!199835))

(assert (=> bs!7075 m!199835))

(declare-fun m!199837 () Bool)

(assert (=> bs!7075 m!199837))

(assert (=> b!171057 d!51929))

(assert (=> b!171057 d!51877))

(declare-fun d!51931 () Bool)

(declare-fun e!113066 () Bool)

(assert (=> d!51931 e!113066))

(declare-fun res!81422 () Bool)

(assert (=> d!51931 (=> res!81422 e!113066)))

(declare-fun lt!85343 () Bool)

(assert (=> d!51931 (= res!81422 (not lt!85343))))

(declare-fun lt!85345 () Bool)

(assert (=> d!51931 (= lt!85343 lt!85345)))

(declare-fun lt!85346 () Unit!5251)

(declare-fun e!113067 () Unit!5251)

(assert (=> d!51931 (= lt!85346 e!113067)))

(declare-fun c!30602 () Bool)

(assert (=> d!51931 (= c!30602 lt!85345)))

(assert (=> d!51931 (= lt!85345 (containsKey!188 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))))))

(assert (=> d!51931 (= (contains!1139 lt!85122 (_1!1610 (tuple2!3199 key!828 v!309))) lt!85343)))

(declare-fun b!171302 () Bool)

(declare-fun lt!85344 () Unit!5251)

(assert (=> b!171302 (= e!113067 lt!85344)))

(assert (=> b!171302 (= lt!85344 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))))))

(assert (=> b!171302 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun b!171303 () Bool)

(declare-fun Unit!5264 () Unit!5251)

(assert (=> b!171303 (= e!113067 Unit!5264)))

(declare-fun b!171304 () Bool)

(assert (=> b!171304 (= e!113066 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(assert (= (and d!51931 c!30602) b!171302))

(assert (= (and d!51931 (not c!30602)) b!171303))

(assert (= (and d!51931 (not res!81422)) b!171304))

(declare-fun m!199839 () Bool)

(assert (=> d!51931 m!199839))

(declare-fun m!199841 () Bool)

(assert (=> b!171302 m!199841))

(assert (=> b!171302 m!199431))

(assert (=> b!171302 m!199431))

(declare-fun m!199843 () Bool)

(assert (=> b!171302 m!199843))

(assert (=> b!171304 m!199431))

(assert (=> b!171304 m!199431))

(assert (=> b!171304 m!199843))

(assert (=> d!51845 d!51931))

(declare-fun b!171306 () Bool)

(declare-fun e!113068 () Option!191)

(declare-fun e!113069 () Option!191)

(assert (=> b!171306 (= e!113068 e!113069)))

(declare-fun c!30604 () Bool)

(assert (=> b!171306 (= c!30604 (and ((_ is Cons!2172) lt!85123) (not (= (_1!1610 (h!2789 lt!85123)) (_1!1610 (tuple2!3199 key!828 v!309))))))))

(declare-fun b!171307 () Bool)

(assert (=> b!171307 (= e!113069 (getValueByKey!185 (t!6970 lt!85123) (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun d!51933 () Bool)

(declare-fun c!30603 () Bool)

(assert (=> d!51933 (= c!30603 (and ((_ is Cons!2172) lt!85123) (= (_1!1610 (h!2789 lt!85123)) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(assert (=> d!51933 (= (getValueByKey!185 lt!85123 (_1!1610 (tuple2!3199 key!828 v!309))) e!113068)))

(declare-fun b!171305 () Bool)

(assert (=> b!171305 (= e!113068 (Some!190 (_2!1610 (h!2789 lt!85123))))))

(declare-fun b!171308 () Bool)

(assert (=> b!171308 (= e!113069 None!189)))

(assert (= (and d!51933 c!30603) b!171305))

(assert (= (and d!51933 (not c!30603)) b!171306))

(assert (= (and b!171306 c!30604) b!171307))

(assert (= (and b!171306 (not c!30604)) b!171308))

(declare-fun m!199845 () Bool)

(assert (=> b!171307 m!199845))

(assert (=> d!51845 d!51933))

(declare-fun d!51935 () Bool)

(assert (=> d!51935 (= (getValueByKey!185 lt!85123 (_1!1610 (tuple2!3199 key!828 v!309))) (Some!190 (_2!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun lt!85347 () Unit!5251)

(assert (=> d!51935 (= lt!85347 (choose!930 lt!85123 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun e!113070 () Bool)

(assert (=> d!51935 e!113070))

(declare-fun res!81423 () Bool)

(assert (=> d!51935 (=> (not res!81423) (not e!113070))))

(assert (=> d!51935 (= res!81423 (isStrictlySorted!318 lt!85123))))

(assert (=> d!51935 (= (lemmaContainsTupThenGetReturnValue!98 lt!85123 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))) lt!85347)))

(declare-fun b!171309 () Bool)

(declare-fun res!81424 () Bool)

(assert (=> b!171309 (=> (not res!81424) (not e!113070))))

(assert (=> b!171309 (= res!81424 (containsKey!188 lt!85123 (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun b!171310 () Bool)

(assert (=> b!171310 (= e!113070 (contains!1141 lt!85123 (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))))))

(assert (= (and d!51935 res!81423) b!171309))

(assert (= (and b!171309 res!81424) b!171310))

(assert (=> d!51935 m!199425))

(declare-fun m!199847 () Bool)

(assert (=> d!51935 m!199847))

(declare-fun m!199849 () Bool)

(assert (=> d!51935 m!199849))

(declare-fun m!199851 () Bool)

(assert (=> b!171309 m!199851))

(declare-fun m!199853 () Bool)

(assert (=> b!171310 m!199853))

(assert (=> d!51845 d!51935))

(declare-fun b!171311 () Bool)

(declare-fun e!113073 () List!2176)

(declare-fun call!17439 () List!2176)

(assert (=> b!171311 (= e!113073 call!17439)))

(declare-fun b!171312 () Bool)

(assert (=> b!171312 (= e!113073 call!17439)))

(declare-fun c!30605 () Bool)

(declare-fun b!171313 () Bool)

(assert (=> b!171313 (= c!30605 (and ((_ is Cons!2172) (toList!1081 (map!1846 thiss!1248))) (bvsgt (_1!1610 (h!2789 (toList!1081 (map!1846 thiss!1248)))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun e!113072 () List!2176)

(assert (=> b!171313 (= e!113072 e!113073)))

(declare-fun d!51937 () Bool)

(declare-fun e!113071 () Bool)

(assert (=> d!51937 e!113071))

(declare-fun res!81426 () Bool)

(assert (=> d!51937 (=> (not res!81426) (not e!113071))))

(declare-fun lt!85348 () List!2176)

(assert (=> d!51937 (= res!81426 (isStrictlySorted!318 lt!85348))))

(declare-fun e!113075 () List!2176)

(assert (=> d!51937 (= lt!85348 e!113075)))

(declare-fun c!30606 () Bool)

(assert (=> d!51937 (= c!30606 (and ((_ is Cons!2172) (toList!1081 (map!1846 thiss!1248))) (bvslt (_1!1610 (h!2789 (toList!1081 (map!1846 thiss!1248)))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(assert (=> d!51937 (isStrictlySorted!318 (toList!1081 (map!1846 thiss!1248)))))

(assert (=> d!51937 (= (insertStrictlySorted!101 (toList!1081 (map!1846 thiss!1248)) (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))) lt!85348)))

(declare-fun b!171314 () Bool)

(assert (=> b!171314 (= e!113075 e!113072)))

(declare-fun c!30607 () Bool)

(assert (=> b!171314 (= c!30607 (and ((_ is Cons!2172) (toList!1081 (map!1846 thiss!1248))) (= (_1!1610 (h!2789 (toList!1081 (map!1846 thiss!1248)))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun b!171315 () Bool)

(assert (=> b!171315 (= e!113071 (contains!1141 lt!85348 (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun b!171316 () Bool)

(declare-fun call!17437 () List!2176)

(assert (=> b!171316 (= e!113072 call!17437)))

(declare-fun e!113074 () List!2176)

(declare-fun b!171317 () Bool)

(assert (=> b!171317 (= e!113074 (ite c!30607 (t!6970 (toList!1081 (map!1846 thiss!1248))) (ite c!30605 (Cons!2172 (h!2789 (toList!1081 (map!1846 thiss!1248))) (t!6970 (toList!1081 (map!1846 thiss!1248)))) Nil!2173)))))

(declare-fun bm!17434 () Bool)

(declare-fun call!17438 () List!2176)

(assert (=> bm!17434 (= call!17437 call!17438)))

(declare-fun b!171318 () Bool)

(assert (=> b!171318 (= e!113075 call!17438)))

(declare-fun b!171319 () Bool)

(assert (=> b!171319 (= e!113074 (insertStrictlySorted!101 (t!6970 (toList!1081 (map!1846 thiss!1248))) (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun bm!17435 () Bool)

(assert (=> bm!17435 (= call!17439 call!17437)))

(declare-fun b!171320 () Bool)

(declare-fun res!81425 () Bool)

(assert (=> b!171320 (=> (not res!81425) (not e!113071))))

(assert (=> b!171320 (= res!81425 (containsKey!188 lt!85348 (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun bm!17436 () Bool)

(assert (=> bm!17436 (= call!17438 ($colon$colon!96 e!113074 (ite c!30606 (h!2789 (toList!1081 (map!1846 thiss!1248))) (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))))))))

(declare-fun c!30608 () Bool)

(assert (=> bm!17436 (= c!30608 c!30606)))

(assert (= (and d!51937 c!30606) b!171318))

(assert (= (and d!51937 (not c!30606)) b!171314))

(assert (= (and b!171314 c!30607) b!171316))

(assert (= (and b!171314 (not c!30607)) b!171313))

(assert (= (and b!171313 c!30605) b!171311))

(assert (= (and b!171313 (not c!30605)) b!171312))

(assert (= (or b!171311 b!171312) bm!17435))

(assert (= (or b!171316 bm!17435) bm!17434))

(assert (= (or b!171318 bm!17434) bm!17436))

(assert (= (and bm!17436 c!30608) b!171319))

(assert (= (and bm!17436 (not c!30608)) b!171317))

(assert (= (and d!51937 res!81426) b!171320))

(assert (= (and b!171320 res!81425) b!171315))

(declare-fun m!199855 () Bool)

(assert (=> b!171319 m!199855))

(declare-fun m!199857 () Bool)

(assert (=> b!171320 m!199857))

(declare-fun m!199859 () Bool)

(assert (=> d!51937 m!199859))

(declare-fun m!199861 () Bool)

(assert (=> d!51937 m!199861))

(declare-fun m!199863 () Bool)

(assert (=> bm!17436 m!199863))

(declare-fun m!199865 () Bool)

(assert (=> b!171315 m!199865))

(assert (=> d!51845 d!51937))

(declare-fun b!171321 () Bool)

(declare-fun e!113077 () Bool)

(assert (=> b!171321 (= e!113077 (contains!1142 Nil!2175 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171322 () Bool)

(declare-fun e!113078 () Bool)

(declare-fun call!17440 () Bool)

(assert (=> b!171322 (= e!113078 call!17440)))

(declare-fun b!171323 () Bool)

(assert (=> b!171323 (= e!113078 call!17440)))

(declare-fun bm!17437 () Bool)

(declare-fun c!30609 () Bool)

(assert (=> bm!17437 (= call!17440 (arrayNoDuplicates!0 (_keys!5386 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30609 (Cons!2174 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) Nil!2175) Nil!2175)))))

(declare-fun d!51939 () Bool)

(declare-fun res!81428 () Bool)

(declare-fun e!113079 () Bool)

(assert (=> d!51939 (=> res!81428 e!113079)))

(assert (=> d!51939 (= res!81428 (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!51939 (= (arrayNoDuplicates!0 (_keys!5386 thiss!1248) #b00000000000000000000000000000000 Nil!2175) e!113079)))

(declare-fun b!171324 () Bool)

(declare-fun e!113076 () Bool)

(assert (=> b!171324 (= e!113076 e!113078)))

(assert (=> b!171324 (= c!30609 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171325 () Bool)

(assert (=> b!171325 (= e!113079 e!113076)))

(declare-fun res!81427 () Bool)

(assert (=> b!171325 (=> (not res!81427) (not e!113076))))

(assert (=> b!171325 (= res!81427 (not e!113077))))

(declare-fun res!81429 () Bool)

(assert (=> b!171325 (=> (not res!81429) (not e!113077))))

(assert (=> b!171325 (= res!81429 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51939 (not res!81428)) b!171325))

(assert (= (and b!171325 res!81429) b!171321))

(assert (= (and b!171325 res!81427) b!171324))

(assert (= (and b!171324 c!30609) b!171322))

(assert (= (and b!171324 (not c!30609)) b!171323))

(assert (= (or b!171322 b!171323) bm!17437))

(assert (=> b!171321 m!199453))

(assert (=> b!171321 m!199453))

(declare-fun m!199867 () Bool)

(assert (=> b!171321 m!199867))

(assert (=> bm!17437 m!199453))

(declare-fun m!199869 () Bool)

(assert (=> bm!17437 m!199869))

(assert (=> b!171324 m!199453))

(assert (=> b!171324 m!199453))

(assert (=> b!171324 m!199455))

(assert (=> b!171325 m!199453))

(assert (=> b!171325 m!199453))

(assert (=> b!171325 m!199455))

(assert (=> b!170986 d!51939))

(assert (=> b!171075 d!51889))

(declare-fun d!51941 () Bool)

(declare-fun lt!85349 () Bool)

(assert (=> d!51941 (= lt!85349 (select (content!148 (toList!1081 lt!85229)) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!113081 () Bool)

(assert (=> d!51941 (= lt!85349 e!113081)))

(declare-fun res!81430 () Bool)

(assert (=> d!51941 (=> (not res!81430) (not e!113081))))

(assert (=> d!51941 (= res!81430 ((_ is Cons!2172) (toList!1081 lt!85229)))))

(assert (=> d!51941 (= (contains!1141 (toList!1081 lt!85229) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85349)))

(declare-fun b!171326 () Bool)

(declare-fun e!113080 () Bool)

(assert (=> b!171326 (= e!113081 e!113080)))

(declare-fun res!81431 () Bool)

(assert (=> b!171326 (=> res!81431 e!113080)))

(assert (=> b!171326 (= res!81431 (= (h!2789 (toList!1081 lt!85229)) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!171327 () Bool)

(assert (=> b!171327 (= e!113080 (contains!1141 (t!6970 (toList!1081 lt!85229)) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!51941 res!81430) b!171326))

(assert (= (and b!171326 (not res!81431)) b!171327))

(declare-fun m!199871 () Bool)

(assert (=> d!51941 m!199871))

(declare-fun m!199873 () Bool)

(assert (=> d!51941 m!199873))

(declare-fun m!199875 () Bool)

(assert (=> b!171327 m!199875))

(assert (=> b!171077 d!51941))

(assert (=> b!171074 d!51889))

(assert (=> b!170977 d!51925))

(assert (=> b!170977 d!51927))

(declare-fun d!51943 () Bool)

(declare-fun e!113082 () Bool)

(assert (=> d!51943 e!113082))

(declare-fun res!81432 () Bool)

(assert (=> d!51943 (=> res!81432 e!113082)))

(declare-fun lt!85350 () Bool)

(assert (=> d!51943 (= res!81432 (not lt!85350))))

(declare-fun lt!85352 () Bool)

(assert (=> d!51943 (= lt!85350 lt!85352)))

(declare-fun lt!85353 () Unit!5251)

(declare-fun e!113083 () Unit!5251)

(assert (=> d!51943 (= lt!85353 e!113083)))

(declare-fun c!30610 () Bool)

(assert (=> d!51943 (= c!30610 lt!85352)))

(assert (=> d!51943 (= lt!85352 (containsKey!188 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51943 (= (contains!1139 lt!85224 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) lt!85350)))

(declare-fun b!171328 () Bool)

(declare-fun lt!85351 () Unit!5251)

(assert (=> b!171328 (= e!113083 lt!85351)))

(assert (=> b!171328 (= lt!85351 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171328 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171329 () Bool)

(declare-fun Unit!5265 () Unit!5251)

(assert (=> b!171329 (= e!113083 Unit!5265)))

(declare-fun b!171330 () Bool)

(assert (=> b!171330 (= e!113082 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!51943 c!30610) b!171328))

(assert (= (and d!51943 (not c!30610)) b!171329))

(assert (= (and d!51943 (not res!81432)) b!171330))

(assert (=> d!51943 m!199453))

(declare-fun m!199877 () Bool)

(assert (=> d!51943 m!199877))

(assert (=> b!171328 m!199453))

(declare-fun m!199879 () Bool)

(assert (=> b!171328 m!199879))

(assert (=> b!171328 m!199453))

(assert (=> b!171328 m!199835))

(assert (=> b!171328 m!199835))

(declare-fun m!199881 () Bool)

(assert (=> b!171328 m!199881))

(assert (=> b!171330 m!199453))

(assert (=> b!171330 m!199835))

(assert (=> b!171330 m!199835))

(assert (=> b!171330 m!199881))

(assert (=> b!171059 d!51943))

(assert (=> d!51847 d!51861))

(declare-fun d!51945 () Bool)

(declare-fun e!113084 () Bool)

(assert (=> d!51945 e!113084))

(declare-fun res!81433 () Bool)

(assert (=> d!51945 (=> res!81433 e!113084)))

(declare-fun lt!85354 () Bool)

(assert (=> d!51945 (= res!81433 (not lt!85354))))

(declare-fun lt!85356 () Bool)

(assert (=> d!51945 (= lt!85354 lt!85356)))

(declare-fun lt!85357 () Unit!5251)

(declare-fun e!113085 () Unit!5251)

(assert (=> d!51945 (= lt!85357 e!113085)))

(declare-fun c!30611 () Bool)

(assert (=> d!51945 (= c!30611 lt!85356)))

(assert (=> d!51945 (= lt!85356 (containsKey!188 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187))))

(assert (=> d!51945 (= (contains!1139 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)) lt!85187) lt!85354)))

(declare-fun b!171331 () Bool)

(declare-fun lt!85355 () Unit!5251)

(assert (=> b!171331 (= e!113085 lt!85355)))

(assert (=> b!171331 (= lt!85355 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187))))

(assert (=> b!171331 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187))))

(declare-fun b!171332 () Bool)

(declare-fun Unit!5266 () Unit!5251)

(assert (=> b!171332 (= e!113085 Unit!5266)))

(declare-fun b!171333 () Bool)

(assert (=> b!171333 (= e!113084 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187)))))

(assert (= (and d!51945 c!30611) b!171331))

(assert (= (and d!51945 (not c!30611)) b!171332))

(assert (= (and d!51945 (not res!81433)) b!171333))

(declare-fun m!199883 () Bool)

(assert (=> d!51945 m!199883))

(declare-fun m!199885 () Bool)

(assert (=> b!171331 m!199885))

(declare-fun m!199887 () Bool)

(assert (=> b!171331 m!199887))

(assert (=> b!171331 m!199887))

(declare-fun m!199889 () Bool)

(assert (=> b!171331 m!199889))

(assert (=> b!171333 m!199887))

(assert (=> b!171333 m!199887))

(assert (=> b!171333 m!199889))

(assert (=> b!171038 d!51945))

(declare-fun d!51947 () Bool)

(declare-fun e!113086 () Bool)

(assert (=> d!51947 e!113086))

(declare-fun res!81435 () Bool)

(assert (=> d!51947 (=> (not res!81435) (not e!113086))))

(declare-fun lt!85358 () ListLongMap!2131)

(assert (=> d!51947 (= res!81435 (contains!1139 lt!85358 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85359 () List!2176)

(assert (=> d!51947 (= lt!85358 (ListLongMap!2132 lt!85359))))

(declare-fun lt!85361 () Unit!5251)

(declare-fun lt!85360 () Unit!5251)

(assert (=> d!51947 (= lt!85361 lt!85360)))

(assert (=> d!51947 (= (getValueByKey!185 lt!85359 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(assert (=> d!51947 (= lt!85360 (lemmaContainsTupThenGetReturnValue!98 lt!85359 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(assert (=> d!51947 (= lt!85359 (insertStrictlySorted!101 (toList!1081 lt!85201) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(assert (=> d!51947 (= (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) lt!85358)))

(declare-fun b!171334 () Bool)

(declare-fun res!81434 () Bool)

(assert (=> b!171334 (=> (not res!81434) (not e!113086))))

(assert (=> b!171334 (= res!81434 (= (getValueByKey!185 (toList!1081 lt!85358) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))))

(declare-fun b!171335 () Bool)

(assert (=> b!171335 (= e!113086 (contains!1141 (toList!1081 lt!85358) (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))

(assert (= (and d!51947 res!81435) b!171334))

(assert (= (and b!171334 res!81434) b!171335))

(declare-fun m!199891 () Bool)

(assert (=> d!51947 m!199891))

(declare-fun m!199893 () Bool)

(assert (=> d!51947 m!199893))

(declare-fun m!199895 () Bool)

(assert (=> d!51947 m!199895))

(declare-fun m!199897 () Bool)

(assert (=> d!51947 m!199897))

(declare-fun m!199899 () Bool)

(assert (=> b!171334 m!199899))

(declare-fun m!199901 () Bool)

(assert (=> b!171335 m!199901))

(assert (=> b!171038 d!51947))

(declare-fun d!51949 () Bool)

(declare-fun e!113087 () Bool)

(assert (=> d!51949 e!113087))

(declare-fun res!81437 () Bool)

(assert (=> d!51949 (=> (not res!81437) (not e!113087))))

(declare-fun lt!85362 () ListLongMap!2131)

(assert (=> d!51949 (= res!81437 (contains!1139 lt!85362 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85363 () List!2176)

(assert (=> d!51949 (= lt!85362 (ListLongMap!2132 lt!85363))))

(declare-fun lt!85365 () Unit!5251)

(declare-fun lt!85364 () Unit!5251)

(assert (=> d!51949 (= lt!85365 lt!85364)))

(assert (=> d!51949 (= (getValueByKey!185 lt!85363 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(assert (=> d!51949 (= lt!85364 (lemmaContainsTupThenGetReturnValue!98 lt!85363 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(assert (=> d!51949 (= lt!85363 (insertStrictlySorted!101 (toList!1081 lt!85190) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(assert (=> d!51949 (= (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) lt!85362)))

(declare-fun b!171336 () Bool)

(declare-fun res!81436 () Bool)

(assert (=> b!171336 (=> (not res!81436) (not e!113087))))

(assert (=> b!171336 (= res!81436 (= (getValueByKey!185 (toList!1081 lt!85362) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))))

(declare-fun b!171337 () Bool)

(assert (=> b!171337 (= e!113087 (contains!1141 (toList!1081 lt!85362) (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))

(assert (= (and d!51949 res!81437) b!171336))

(assert (= (and b!171336 res!81436) b!171337))

(declare-fun m!199903 () Bool)

(assert (=> d!51949 m!199903))

(declare-fun m!199905 () Bool)

(assert (=> d!51949 m!199905))

(declare-fun m!199907 () Bool)

(assert (=> d!51949 m!199907))

(declare-fun m!199909 () Bool)

(assert (=> d!51949 m!199909))

(declare-fun m!199911 () Bool)

(assert (=> b!171336 m!199911))

(declare-fun m!199913 () Bool)

(assert (=> b!171337 m!199913))

(assert (=> b!171038 d!51949))

(declare-fun d!51951 () Bool)

(assert (=> d!51951 (= (apply!129 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) lt!85185) (apply!129 lt!85201 lt!85185))))

(declare-fun lt!85368 () Unit!5251)

(declare-fun choose!932 (ListLongMap!2131 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5251)

(assert (=> d!51951 (= lt!85368 (choose!932 lt!85201 lt!85203 (minValue!3397 thiss!1248) lt!85185))))

(declare-fun e!113090 () Bool)

(assert (=> d!51951 e!113090))

(declare-fun res!81440 () Bool)

(assert (=> d!51951 (=> (not res!81440) (not e!113090))))

(assert (=> d!51951 (= res!81440 (contains!1139 lt!85201 lt!85185))))

(assert (=> d!51951 (= (addApplyDifferent!105 lt!85201 lt!85203 (minValue!3397 thiss!1248) lt!85185) lt!85368)))

(declare-fun b!171341 () Bool)

(assert (=> b!171341 (= e!113090 (not (= lt!85185 lt!85203)))))

(assert (= (and d!51951 res!81440) b!171341))

(assert (=> d!51951 m!199483))

(declare-fun m!199915 () Bool)

(assert (=> d!51951 m!199915))

(assert (=> d!51951 m!199483))

(assert (=> d!51951 m!199485))

(assert (=> d!51951 m!199487))

(declare-fun m!199917 () Bool)

(assert (=> d!51951 m!199917))

(assert (=> b!171038 d!51951))

(declare-fun d!51953 () Bool)

(assert (=> d!51953 (= (apply!129 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) lt!85197) (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) lt!85197)))))

(declare-fun bs!7076 () Bool)

(assert (= bs!7076 d!51953))

(declare-fun m!199919 () Bool)

(assert (=> bs!7076 m!199919))

(assert (=> bs!7076 m!199919))

(declare-fun m!199921 () Bool)

(assert (=> bs!7076 m!199921))

(assert (=> b!171038 d!51953))

(declare-fun d!51955 () Bool)

(assert (=> d!51955 (= (apply!129 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309)) lt!85191) (apply!129 lt!85202 lt!85191))))

(declare-fun lt!85369 () Unit!5251)

(assert (=> d!51955 (= lt!85369 (choose!932 lt!85202 lt!85200 v!309 lt!85191))))

(declare-fun e!113091 () Bool)

(assert (=> d!51955 e!113091))

(declare-fun res!81441 () Bool)

(assert (=> d!51955 (=> (not res!81441) (not e!113091))))

(assert (=> d!51955 (= res!81441 (contains!1139 lt!85202 lt!85191))))

(assert (=> d!51955 (= (addApplyDifferent!105 lt!85202 lt!85200 v!309 lt!85191) lt!85369)))

(declare-fun b!171342 () Bool)

(assert (=> b!171342 (= e!113091 (not (= lt!85191 lt!85200)))))

(assert (= (and d!51955 res!81441) b!171342))

(assert (=> d!51955 m!199475))

(declare-fun m!199923 () Bool)

(assert (=> d!51955 m!199923))

(assert (=> d!51955 m!199475))

(assert (=> d!51955 m!199477))

(assert (=> d!51955 m!199497))

(declare-fun m!199925 () Bool)

(assert (=> d!51955 m!199925))

(assert (=> b!171038 d!51955))

(assert (=> b!171038 d!51865))

(declare-fun d!51957 () Bool)

(assert (=> d!51957 (= (apply!129 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309)) lt!85191) (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309))) lt!85191)))))

(declare-fun bs!7077 () Bool)

(assert (= bs!7077 d!51957))

(declare-fun m!199927 () Bool)

(assert (=> bs!7077 m!199927))

(assert (=> bs!7077 m!199927))

(declare-fun m!199929 () Bool)

(assert (=> bs!7077 m!199929))

(assert (=> b!171038 d!51957))

(declare-fun d!51959 () Bool)

(assert (=> d!51959 (= (apply!129 lt!85201 lt!85185) (get!1945 (getValueByKey!185 (toList!1081 lt!85201) lt!85185)))))

(declare-fun bs!7078 () Bool)

(assert (= bs!7078 d!51959))

(declare-fun m!199931 () Bool)

(assert (=> bs!7078 m!199931))

(assert (=> bs!7078 m!199931))

(declare-fun m!199933 () Bool)

(assert (=> bs!7078 m!199933))

(assert (=> b!171038 d!51959))

(declare-fun d!51961 () Bool)

(assert (=> d!51961 (= (apply!129 lt!85202 lt!85191) (get!1945 (getValueByKey!185 (toList!1081 lt!85202) lt!85191)))))

(declare-fun bs!7079 () Bool)

(assert (= bs!7079 d!51961))

(declare-fun m!199935 () Bool)

(assert (=> bs!7079 m!199935))

(assert (=> bs!7079 m!199935))

(declare-fun m!199937 () Bool)

(assert (=> bs!7079 m!199937))

(assert (=> b!171038 d!51961))

(declare-fun d!51963 () Bool)

(declare-fun e!113092 () Bool)

(assert (=> d!51963 e!113092))

(declare-fun res!81443 () Bool)

(assert (=> d!51963 (=> (not res!81443) (not e!113092))))

(declare-fun lt!85370 () ListLongMap!2131)

(assert (=> d!51963 (= res!81443 (contains!1139 lt!85370 (_1!1610 (tuple2!3199 lt!85184 v!309))))))

(declare-fun lt!85371 () List!2176)

(assert (=> d!51963 (= lt!85370 (ListLongMap!2132 lt!85371))))

(declare-fun lt!85373 () Unit!5251)

(declare-fun lt!85372 () Unit!5251)

(assert (=> d!51963 (= lt!85373 lt!85372)))

(assert (=> d!51963 (= (getValueByKey!185 lt!85371 (_1!1610 (tuple2!3199 lt!85184 v!309))) (Some!190 (_2!1610 (tuple2!3199 lt!85184 v!309))))))

(assert (=> d!51963 (= lt!85372 (lemmaContainsTupThenGetReturnValue!98 lt!85371 (_1!1610 (tuple2!3199 lt!85184 v!309)) (_2!1610 (tuple2!3199 lt!85184 v!309))))))

(assert (=> d!51963 (= lt!85371 (insertStrictlySorted!101 (toList!1081 lt!85198) (_1!1610 (tuple2!3199 lt!85184 v!309)) (_2!1610 (tuple2!3199 lt!85184 v!309))))))

(assert (=> d!51963 (= (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)) lt!85370)))

(declare-fun b!171343 () Bool)

(declare-fun res!81442 () Bool)

(assert (=> b!171343 (=> (not res!81442) (not e!113092))))

(assert (=> b!171343 (= res!81442 (= (getValueByKey!185 (toList!1081 lt!85370) (_1!1610 (tuple2!3199 lt!85184 v!309))) (Some!190 (_2!1610 (tuple2!3199 lt!85184 v!309)))))))

(declare-fun b!171344 () Bool)

(assert (=> b!171344 (= e!113092 (contains!1141 (toList!1081 lt!85370) (tuple2!3199 lt!85184 v!309)))))

(assert (= (and d!51963 res!81443) b!171343))

(assert (= (and b!171343 res!81442) b!171344))

(declare-fun m!199939 () Bool)

(assert (=> d!51963 m!199939))

(declare-fun m!199941 () Bool)

(assert (=> d!51963 m!199941))

(declare-fun m!199943 () Bool)

(assert (=> d!51963 m!199943))

(declare-fun m!199945 () Bool)

(assert (=> d!51963 m!199945))

(declare-fun m!199947 () Bool)

(assert (=> b!171343 m!199947))

(declare-fun m!199949 () Bool)

(assert (=> b!171344 m!199949))

(assert (=> b!171038 d!51963))

(declare-fun d!51965 () Bool)

(assert (=> d!51965 (= (apply!129 lt!85190 lt!85197) (get!1945 (getValueByKey!185 (toList!1081 lt!85190) lt!85197)))))

(declare-fun bs!7080 () Bool)

(assert (= bs!7080 d!51965))

(declare-fun m!199951 () Bool)

(assert (=> bs!7080 m!199951))

(assert (=> bs!7080 m!199951))

(declare-fun m!199953 () Bool)

(assert (=> bs!7080 m!199953))

(assert (=> b!171038 d!51965))

(declare-fun d!51967 () Bool)

(assert (=> d!51967 (contains!1139 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)) lt!85187)))

(declare-fun lt!85376 () Unit!5251)

(declare-fun choose!933 (ListLongMap!2131 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5251)

(assert (=> d!51967 (= lt!85376 (choose!933 lt!85198 lt!85184 v!309 lt!85187))))

(assert (=> d!51967 (contains!1139 lt!85198 lt!85187)))

(assert (=> d!51967 (= (addStillContains!105 lt!85198 lt!85184 v!309 lt!85187) lt!85376)))

(declare-fun bs!7081 () Bool)

(assert (= bs!7081 d!51967))

(assert (=> bs!7081 m!199479))

(assert (=> bs!7081 m!199479))

(assert (=> bs!7081 m!199481))

(declare-fun m!199955 () Bool)

(assert (=> bs!7081 m!199955))

(declare-fun m!199957 () Bool)

(assert (=> bs!7081 m!199957))

(assert (=> b!171038 d!51967))

(declare-fun d!51969 () Bool)

(declare-fun e!113093 () Bool)

(assert (=> d!51969 e!113093))

(declare-fun res!81445 () Bool)

(assert (=> d!51969 (=> (not res!81445) (not e!113093))))

(declare-fun lt!85377 () ListLongMap!2131)

(assert (=> d!51969 (= res!81445 (contains!1139 lt!85377 (_1!1610 (tuple2!3199 lt!85200 v!309))))))

(declare-fun lt!85378 () List!2176)

(assert (=> d!51969 (= lt!85377 (ListLongMap!2132 lt!85378))))

(declare-fun lt!85380 () Unit!5251)

(declare-fun lt!85379 () Unit!5251)

(assert (=> d!51969 (= lt!85380 lt!85379)))

(assert (=> d!51969 (= (getValueByKey!185 lt!85378 (_1!1610 (tuple2!3199 lt!85200 v!309))) (Some!190 (_2!1610 (tuple2!3199 lt!85200 v!309))))))

(assert (=> d!51969 (= lt!85379 (lemmaContainsTupThenGetReturnValue!98 lt!85378 (_1!1610 (tuple2!3199 lt!85200 v!309)) (_2!1610 (tuple2!3199 lt!85200 v!309))))))

(assert (=> d!51969 (= lt!85378 (insertStrictlySorted!101 (toList!1081 lt!85202) (_1!1610 (tuple2!3199 lt!85200 v!309)) (_2!1610 (tuple2!3199 lt!85200 v!309))))))

(assert (=> d!51969 (= (+!243 lt!85202 (tuple2!3199 lt!85200 v!309)) lt!85377)))

(declare-fun b!171346 () Bool)

(declare-fun res!81444 () Bool)

(assert (=> b!171346 (=> (not res!81444) (not e!113093))))

(assert (=> b!171346 (= res!81444 (= (getValueByKey!185 (toList!1081 lt!85377) (_1!1610 (tuple2!3199 lt!85200 v!309))) (Some!190 (_2!1610 (tuple2!3199 lt!85200 v!309)))))))

(declare-fun b!171347 () Bool)

(assert (=> b!171347 (= e!113093 (contains!1141 (toList!1081 lt!85377) (tuple2!3199 lt!85200 v!309)))))

(assert (= (and d!51969 res!81445) b!171346))

(assert (= (and b!171346 res!81444) b!171347))

(declare-fun m!199959 () Bool)

(assert (=> d!51969 m!199959))

(declare-fun m!199961 () Bool)

(assert (=> d!51969 m!199961))

(declare-fun m!199963 () Bool)

(assert (=> d!51969 m!199963))

(declare-fun m!199965 () Bool)

(assert (=> d!51969 m!199965))

(declare-fun m!199967 () Bool)

(assert (=> b!171346 m!199967))

(declare-fun m!199969 () Bool)

(assert (=> b!171347 m!199969))

(assert (=> b!171038 d!51969))

(declare-fun d!51971 () Bool)

(assert (=> d!51971 (= (apply!129 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) lt!85185) (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) lt!85185)))))

(declare-fun bs!7082 () Bool)

(assert (= bs!7082 d!51971))

(declare-fun m!199971 () Bool)

(assert (=> bs!7082 m!199971))

(assert (=> bs!7082 m!199971))

(declare-fun m!199973 () Bool)

(assert (=> bs!7082 m!199973))

(assert (=> b!171038 d!51971))

(declare-fun d!51973 () Bool)

(assert (=> d!51973 (= (apply!129 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) lt!85197) (apply!129 lt!85190 lt!85197))))

(declare-fun lt!85381 () Unit!5251)

(assert (=> d!51973 (= lt!85381 (choose!932 lt!85190 lt!85189 (minValue!3397 thiss!1248) lt!85197))))

(declare-fun e!113094 () Bool)

(assert (=> d!51973 e!113094))

(declare-fun res!81446 () Bool)

(assert (=> d!51973 (=> (not res!81446) (not e!113094))))

(assert (=> d!51973 (= res!81446 (contains!1139 lt!85190 lt!85197))))

(assert (=> d!51973 (= (addApplyDifferent!105 lt!85190 lt!85189 (minValue!3397 thiss!1248) lt!85197) lt!85381)))

(declare-fun b!171348 () Bool)

(assert (=> b!171348 (= e!113094 (not (= lt!85197 lt!85189)))))

(assert (= (and d!51973 res!81446) b!171348))

(assert (=> d!51973 m!199469))

(declare-fun m!199975 () Bool)

(assert (=> d!51973 m!199975))

(assert (=> d!51973 m!199469))

(assert (=> d!51973 m!199471))

(assert (=> d!51973 m!199493))

(declare-fun m!199977 () Bool)

(assert (=> d!51973 m!199977))

(assert (=> b!171038 d!51973))

(declare-fun b!171350 () Bool)

(declare-fun e!113095 () Option!191)

(declare-fun e!113096 () Option!191)

(assert (=> b!171350 (= e!113095 e!113096)))

(declare-fun c!30613 () Bool)

(assert (=> b!171350 (= c!30613 (and ((_ is Cons!2172) (toList!1081 lt!85229)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85229))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!171351 () Bool)

(assert (=> b!171351 (= e!113096 (getValueByKey!185 (t!6970 (toList!1081 lt!85229)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!51975 () Bool)

(declare-fun c!30612 () Bool)

(assert (=> d!51975 (= c!30612 (and ((_ is Cons!2172) (toList!1081 lt!85229)) (= (_1!1610 (h!2789 (toList!1081 lt!85229))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51975 (= (getValueByKey!185 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113095)))

(declare-fun b!171349 () Bool)

(assert (=> b!171349 (= e!113095 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85229)))))))

(declare-fun b!171352 () Bool)

(assert (=> b!171352 (= e!113096 None!189)))

(assert (= (and d!51975 c!30612) b!171349))

(assert (= (and d!51975 (not c!30612)) b!171350))

(assert (= (and b!171350 c!30613) b!171351))

(assert (= (and b!171350 (not c!30613)) b!171352))

(declare-fun m!199979 () Bool)

(assert (=> b!171351 m!199979))

(assert (=> b!171076 d!51975))

(declare-fun d!51977 () Bool)

(declare-fun e!113097 () Bool)

(assert (=> d!51977 e!113097))

(declare-fun res!81447 () Bool)

(assert (=> d!51977 (=> res!81447 e!113097)))

(declare-fun lt!85382 () Bool)

(assert (=> d!51977 (= res!81447 (not lt!85382))))

(declare-fun lt!85384 () Bool)

(assert (=> d!51977 (= lt!85382 lt!85384)))

(declare-fun lt!85385 () Unit!5251)

(declare-fun e!113098 () Unit!5251)

(assert (=> d!51977 (= lt!85385 e!113098)))

(declare-fun c!30614 () Bool)

(assert (=> d!51977 (= c!30614 lt!85384)))

(assert (=> d!51977 (= lt!85384 (containsKey!188 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51977 (= (contains!1139 lt!85224 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85382)))

(declare-fun b!171353 () Bool)

(declare-fun lt!85383 () Unit!5251)

(assert (=> b!171353 (= e!113098 lt!85383)))

(assert (=> b!171353 (= lt!85383 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171353 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171354 () Bool)

(declare-fun Unit!5267 () Unit!5251)

(assert (=> b!171354 (= e!113098 Unit!5267)))

(declare-fun b!171355 () Bool)

(assert (=> b!171355 (= e!113097 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51977 c!30614) b!171353))

(assert (= (and d!51977 (not c!30614)) b!171354))

(assert (= (and d!51977 (not res!81447)) b!171355))

(declare-fun m!199981 () Bool)

(assert (=> d!51977 m!199981))

(declare-fun m!199983 () Bool)

(assert (=> b!171353 m!199983))

(assert (=> b!171353 m!199823))

(assert (=> b!171353 m!199823))

(declare-fun m!199985 () Bool)

(assert (=> b!171353 m!199985))

(assert (=> b!171355 m!199823))

(assert (=> b!171355 m!199823))

(assert (=> b!171355 m!199985))

(assert (=> bm!17402 d!51977))

(assert (=> d!51861 d!51869))

(assert (=> d!51855 d!51869))

(declare-fun b!171357 () Bool)

(declare-fun e!113099 () Option!191)

(declare-fun e!113100 () Option!191)

(assert (=> b!171357 (= e!113099 e!113100)))

(declare-fun c!30616 () Bool)

(assert (=> b!171357 (= c!30616 (and ((_ is Cons!2172) (toList!1081 lt!85122)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85122))) (_1!1610 (tuple2!3199 key!828 v!309))))))))

(declare-fun b!171358 () Bool)

(assert (=> b!171358 (= e!113100 (getValueByKey!185 (t!6970 (toList!1081 lt!85122)) (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun d!51979 () Bool)

(declare-fun c!30615 () Bool)

(assert (=> d!51979 (= c!30615 (and ((_ is Cons!2172) (toList!1081 lt!85122)) (= (_1!1610 (h!2789 (toList!1081 lt!85122))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(assert (=> d!51979 (= (getValueByKey!185 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))) e!113099)))

(declare-fun b!171356 () Bool)

(assert (=> b!171356 (= e!113099 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85122)))))))

(declare-fun b!171359 () Bool)

(assert (=> b!171359 (= e!113100 None!189)))

(assert (= (and d!51979 c!30615) b!171356))

(assert (= (and d!51979 (not c!30615)) b!171357))

(assert (= (and b!171357 c!30616) b!171358))

(assert (= (and b!171357 (not c!30616)) b!171359))

(declare-fun m!199987 () Bool)

(assert (=> b!171358 m!199987))

(assert (=> b!170967 d!51979))

(declare-fun d!51981 () Bool)

(declare-fun e!113101 () Bool)

(assert (=> d!51981 e!113101))

(declare-fun res!81449 () Bool)

(assert (=> d!51981 (=> (not res!81449) (not e!113101))))

(declare-fun lt!85386 () ListLongMap!2131)

(assert (=> d!51981 (= res!81449 (contains!1139 lt!85386 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(declare-fun lt!85387 () List!2176)

(assert (=> d!51981 (= lt!85386 (ListLongMap!2132 lt!85387))))

(declare-fun lt!85389 () Unit!5251)

(declare-fun lt!85388 () Unit!5251)

(assert (=> d!51981 (= lt!85389 lt!85388)))

(assert (=> d!51981 (= (getValueByKey!185 lt!85387 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!51981 (= lt!85388 (lemmaContainsTupThenGetReturnValue!98 lt!85387 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!51981 (= lt!85387 (insertStrictlySorted!101 (toList!1081 lt!85227) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!51981 (= (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) lt!85386)))

(declare-fun b!171360 () Bool)

(declare-fun res!81448 () Bool)

(assert (=> b!171360 (=> (not res!81448) (not e!113101))))

(assert (=> b!171360 (= res!81448 (= (getValueByKey!185 (toList!1081 lt!85386) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))))

(declare-fun b!171361 () Bool)

(assert (=> b!171361 (= e!113101 (contains!1141 (toList!1081 lt!85386) (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))

(assert (= (and d!51981 res!81449) b!171360))

(assert (= (and b!171360 res!81448) b!171361))

(declare-fun m!199989 () Bool)

(assert (=> d!51981 m!199989))

(declare-fun m!199991 () Bool)

(assert (=> d!51981 m!199991))

(declare-fun m!199993 () Bool)

(assert (=> d!51981 m!199993))

(declare-fun m!199995 () Bool)

(assert (=> d!51981 m!199995))

(declare-fun m!199997 () Bool)

(assert (=> b!171360 m!199997))

(declare-fun m!199999 () Bool)

(assert (=> b!171361 m!199999))

(assert (=> b!171064 d!51981))

(declare-fun d!51983 () Bool)

(assert (=> d!51983 (= (apply!129 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) lt!85216) (apply!129 lt!85227 lt!85216))))

(declare-fun lt!85390 () Unit!5251)

(assert (=> d!51983 (= lt!85390 (choose!932 lt!85227 lt!85225 (zeroValue!3397 thiss!1248) lt!85216))))

(declare-fun e!113102 () Bool)

(assert (=> d!51983 e!113102))

(declare-fun res!81450 () Bool)

(assert (=> d!51983 (=> (not res!81450) (not e!113102))))

(assert (=> d!51983 (= res!81450 (contains!1139 lt!85227 lt!85216))))

(assert (=> d!51983 (= (addApplyDifferent!105 lt!85227 lt!85225 (zeroValue!3397 thiss!1248) lt!85216) lt!85390)))

(declare-fun b!171362 () Bool)

(assert (=> b!171362 (= e!113102 (not (= lt!85216 lt!85225)))))

(assert (= (and d!51983 res!81450) b!171362))

(assert (=> d!51983 m!199541))

(declare-fun m!200001 () Bool)

(assert (=> d!51983 m!200001))

(assert (=> d!51983 m!199541))

(assert (=> d!51983 m!199543))

(assert (=> d!51983 m!199563))

(declare-fun m!200003 () Bool)

(assert (=> d!51983 m!200003))

(assert (=> b!171064 d!51983))

(assert (=> b!171064 d!51915))

(declare-fun d!51985 () Bool)

(declare-fun e!113103 () Bool)

(assert (=> d!51985 e!113103))

(declare-fun res!81452 () Bool)

(assert (=> d!51985 (=> (not res!81452) (not e!113103))))

(declare-fun lt!85391 () ListLongMap!2131)

(assert (=> d!51985 (= res!81452 (contains!1139 lt!85391 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85392 () List!2176)

(assert (=> d!51985 (= lt!85391 (ListLongMap!2132 lt!85392))))

(declare-fun lt!85394 () Unit!5251)

(declare-fun lt!85393 () Unit!5251)

(assert (=> d!51985 (= lt!85394 lt!85393)))

(assert (=> d!51985 (= (getValueByKey!185 lt!85392 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(assert (=> d!51985 (= lt!85393 (lemmaContainsTupThenGetReturnValue!98 lt!85392 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(assert (=> d!51985 (= lt!85392 (insertStrictlySorted!101 (toList!1081 lt!85226) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(assert (=> d!51985 (= (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) lt!85391)))

(declare-fun b!171363 () Bool)

(declare-fun res!81451 () Bool)

(assert (=> b!171363 (=> (not res!81451) (not e!113103))))

(assert (=> b!171363 (= res!81451 (= (getValueByKey!185 (toList!1081 lt!85391) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))))

(declare-fun b!171364 () Bool)

(assert (=> b!171364 (= e!113103 (contains!1141 (toList!1081 lt!85391) (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))

(assert (= (and d!51985 res!81452) b!171363))

(assert (= (and b!171363 res!81451) b!171364))

(declare-fun m!200005 () Bool)

(assert (=> d!51985 m!200005))

(declare-fun m!200007 () Bool)

(assert (=> d!51985 m!200007))

(declare-fun m!200009 () Bool)

(assert (=> d!51985 m!200009))

(declare-fun m!200011 () Bool)

(assert (=> d!51985 m!200011))

(declare-fun m!200013 () Bool)

(assert (=> b!171363 m!200013))

(declare-fun m!200015 () Bool)

(assert (=> b!171364 m!200015))

(assert (=> b!171064 d!51985))

(declare-fun d!51987 () Bool)

(assert (=> d!51987 (= (apply!129 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) lt!85210) (apply!129 lt!85226 lt!85210))))

(declare-fun lt!85395 () Unit!5251)

(assert (=> d!51987 (= lt!85395 (choose!932 lt!85226 lt!85228 (minValue!3397 thiss!1248) lt!85210))))

(declare-fun e!113104 () Bool)

(assert (=> d!51987 e!113104))

(declare-fun res!81453 () Bool)

(assert (=> d!51987 (=> (not res!81453) (not e!113104))))

(assert (=> d!51987 (= res!81453 (contains!1139 lt!85226 lt!85210))))

(assert (=> d!51987 (= (addApplyDifferent!105 lt!85226 lt!85228 (minValue!3397 thiss!1248) lt!85210) lt!85395)))

(declare-fun b!171365 () Bool)

(assert (=> b!171365 (= e!113104 (not (= lt!85210 lt!85228)))))

(assert (= (and d!51987 res!81453) b!171365))

(assert (=> d!51987 m!199549))

(declare-fun m!200017 () Bool)

(assert (=> d!51987 m!200017))

(assert (=> d!51987 m!199549))

(assert (=> d!51987 m!199551))

(assert (=> d!51987 m!199553))

(declare-fun m!200019 () Bool)

(assert (=> d!51987 m!200019))

(assert (=> b!171064 d!51987))

(declare-fun d!51989 () Bool)

(assert (=> d!51989 (= (apply!129 lt!85215 lt!85222) (get!1945 (getValueByKey!185 (toList!1081 lt!85215) lt!85222)))))

(declare-fun bs!7083 () Bool)

(assert (= bs!7083 d!51989))

(declare-fun m!200021 () Bool)

(assert (=> bs!7083 m!200021))

(assert (=> bs!7083 m!200021))

(declare-fun m!200023 () Bool)

(assert (=> bs!7083 m!200023))

(assert (=> b!171064 d!51989))

(declare-fun d!51991 () Bool)

(assert (=> d!51991 (= (apply!129 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) lt!85222) (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) lt!85222)))))

(declare-fun bs!7084 () Bool)

(assert (= bs!7084 d!51991))

(declare-fun m!200025 () Bool)

(assert (=> bs!7084 m!200025))

(assert (=> bs!7084 m!200025))

(declare-fun m!200027 () Bool)

(assert (=> bs!7084 m!200027))

(assert (=> b!171064 d!51991))

(declare-fun d!51993 () Bool)

(assert (=> d!51993 (= (apply!129 lt!85226 lt!85210) (get!1945 (getValueByKey!185 (toList!1081 lt!85226) lt!85210)))))

(declare-fun bs!7085 () Bool)

(assert (= bs!7085 d!51993))

(declare-fun m!200029 () Bool)

(assert (=> bs!7085 m!200029))

(assert (=> bs!7085 m!200029))

(declare-fun m!200031 () Bool)

(assert (=> bs!7085 m!200031))

(assert (=> b!171064 d!51993))

(declare-fun d!51995 () Bool)

(assert (=> d!51995 (contains!1139 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) lt!85212)))

(declare-fun lt!85396 () Unit!5251)

(assert (=> d!51995 (= lt!85396 (choose!933 lt!85223 lt!85209 (zeroValue!3397 thiss!1248) lt!85212))))

(assert (=> d!51995 (contains!1139 lt!85223 lt!85212)))

(assert (=> d!51995 (= (addStillContains!105 lt!85223 lt!85209 (zeroValue!3397 thiss!1248) lt!85212) lt!85396)))

(declare-fun bs!7086 () Bool)

(assert (= bs!7086 d!51995))

(assert (=> bs!7086 m!199545))

(assert (=> bs!7086 m!199545))

(assert (=> bs!7086 m!199547))

(declare-fun m!200033 () Bool)

(assert (=> bs!7086 m!200033))

(declare-fun m!200035 () Bool)

(assert (=> bs!7086 m!200035))

(assert (=> b!171064 d!51995))

(declare-fun d!51997 () Bool)

(declare-fun e!113105 () Bool)

(assert (=> d!51997 e!113105))

(declare-fun res!81455 () Bool)

(assert (=> d!51997 (=> (not res!81455) (not e!113105))))

(declare-fun lt!85397 () ListLongMap!2131)

(assert (=> d!51997 (= res!81455 (contains!1139 lt!85397 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85398 () List!2176)

(assert (=> d!51997 (= lt!85397 (ListLongMap!2132 lt!85398))))

(declare-fun lt!85400 () Unit!5251)

(declare-fun lt!85399 () Unit!5251)

(assert (=> d!51997 (= lt!85400 lt!85399)))

(assert (=> d!51997 (= (getValueByKey!185 lt!85398 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(assert (=> d!51997 (= lt!85399 (lemmaContainsTupThenGetReturnValue!98 lt!85398 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(assert (=> d!51997 (= lt!85398 (insertStrictlySorted!101 (toList!1081 lt!85215) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(assert (=> d!51997 (= (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) lt!85397)))

(declare-fun b!171366 () Bool)

(declare-fun res!81454 () Bool)

(assert (=> b!171366 (=> (not res!81454) (not e!113105))))

(assert (=> b!171366 (= res!81454 (= (getValueByKey!185 (toList!1081 lt!85397) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))))

(declare-fun b!171367 () Bool)

(assert (=> b!171367 (= e!113105 (contains!1141 (toList!1081 lt!85397) (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))

(assert (= (and d!51997 res!81455) b!171366))

(assert (= (and b!171366 res!81454) b!171367))

(declare-fun m!200037 () Bool)

(assert (=> d!51997 m!200037))

(declare-fun m!200039 () Bool)

(assert (=> d!51997 m!200039))

(declare-fun m!200041 () Bool)

(assert (=> d!51997 m!200041))

(declare-fun m!200043 () Bool)

(assert (=> d!51997 m!200043))

(declare-fun m!200045 () Bool)

(assert (=> b!171366 m!200045))

(declare-fun m!200047 () Bool)

(assert (=> b!171367 m!200047))

(assert (=> b!171064 d!51997))

(declare-fun d!51999 () Bool)

(assert (=> d!51999 (= (apply!129 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) lt!85210) (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) lt!85210)))))

(declare-fun bs!7087 () Bool)

(assert (= bs!7087 d!51999))

(declare-fun m!200049 () Bool)

(assert (=> bs!7087 m!200049))

(assert (=> bs!7087 m!200049))

(declare-fun m!200051 () Bool)

(assert (=> bs!7087 m!200051))

(assert (=> b!171064 d!51999))

(declare-fun d!52001 () Bool)

(declare-fun e!113106 () Bool)

(assert (=> d!52001 e!113106))

(declare-fun res!81457 () Bool)

(assert (=> d!52001 (=> (not res!81457) (not e!113106))))

(declare-fun lt!85401 () ListLongMap!2131)

(assert (=> d!52001 (= res!81457 (contains!1139 lt!85401 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(declare-fun lt!85402 () List!2176)

(assert (=> d!52001 (= lt!85401 (ListLongMap!2132 lt!85402))))

(declare-fun lt!85404 () Unit!5251)

(declare-fun lt!85403 () Unit!5251)

(assert (=> d!52001 (= lt!85404 lt!85403)))

(assert (=> d!52001 (= (getValueByKey!185 lt!85402 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!52001 (= lt!85403 (lemmaContainsTupThenGetReturnValue!98 lt!85402 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!52001 (= lt!85402 (insertStrictlySorted!101 (toList!1081 lt!85223) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!52001 (= (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) lt!85401)))

(declare-fun b!171368 () Bool)

(declare-fun res!81456 () Bool)

(assert (=> b!171368 (=> (not res!81456) (not e!113106))))

(assert (=> b!171368 (= res!81456 (= (getValueByKey!185 (toList!1081 lt!85401) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))

(declare-fun b!171369 () Bool)

(assert (=> b!171369 (= e!113106 (contains!1141 (toList!1081 lt!85401) (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))

(assert (= (and d!52001 res!81457) b!171368))

(assert (= (and b!171368 res!81456) b!171369))

(declare-fun m!200053 () Bool)

(assert (=> d!52001 m!200053))

(declare-fun m!200055 () Bool)

(assert (=> d!52001 m!200055))

(declare-fun m!200057 () Bool)

(assert (=> d!52001 m!200057))

(declare-fun m!200059 () Bool)

(assert (=> d!52001 m!200059))

(declare-fun m!200061 () Bool)

(assert (=> b!171368 m!200061))

(declare-fun m!200063 () Bool)

(assert (=> b!171369 m!200063))

(assert (=> b!171064 d!52001))

(declare-fun d!52003 () Bool)

(declare-fun e!113107 () Bool)

(assert (=> d!52003 e!113107))

(declare-fun res!81458 () Bool)

(assert (=> d!52003 (=> res!81458 e!113107)))

(declare-fun lt!85405 () Bool)

(assert (=> d!52003 (= res!81458 (not lt!85405))))

(declare-fun lt!85407 () Bool)

(assert (=> d!52003 (= lt!85405 lt!85407)))

(declare-fun lt!85408 () Unit!5251)

(declare-fun e!113108 () Unit!5251)

(assert (=> d!52003 (= lt!85408 e!113108)))

(declare-fun c!30617 () Bool)

(assert (=> d!52003 (= c!30617 lt!85407)))

(assert (=> d!52003 (= lt!85407 (containsKey!188 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212))))

(assert (=> d!52003 (= (contains!1139 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) lt!85212) lt!85405)))

(declare-fun b!171370 () Bool)

(declare-fun lt!85406 () Unit!5251)

(assert (=> b!171370 (= e!113108 lt!85406)))

(assert (=> b!171370 (= lt!85406 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212))))

(assert (=> b!171370 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212))))

(declare-fun b!171371 () Bool)

(declare-fun Unit!5268 () Unit!5251)

(assert (=> b!171371 (= e!113108 Unit!5268)))

(declare-fun b!171372 () Bool)

(assert (=> b!171372 (= e!113107 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212)))))

(assert (= (and d!52003 c!30617) b!171370))

(assert (= (and d!52003 (not c!30617)) b!171371))

(assert (= (and d!52003 (not res!81458)) b!171372))

(declare-fun m!200065 () Bool)

(assert (=> d!52003 m!200065))

(declare-fun m!200067 () Bool)

(assert (=> b!171370 m!200067))

(declare-fun m!200069 () Bool)

(assert (=> b!171370 m!200069))

(assert (=> b!171370 m!200069))

(declare-fun m!200071 () Bool)

(assert (=> b!171370 m!200071))

(assert (=> b!171372 m!200069))

(assert (=> b!171372 m!200069))

(assert (=> b!171372 m!200071))

(assert (=> b!171064 d!52003))

(declare-fun d!52005 () Bool)

(assert (=> d!52005 (= (apply!129 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) lt!85216) (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) lt!85216)))))

(declare-fun bs!7088 () Bool)

(assert (= bs!7088 d!52005))

(declare-fun m!200073 () Bool)

(assert (=> bs!7088 m!200073))

(assert (=> bs!7088 m!200073))

(declare-fun m!200075 () Bool)

(assert (=> bs!7088 m!200075))

(assert (=> b!171064 d!52005))

(declare-fun d!52007 () Bool)

(assert (=> d!52007 (= (apply!129 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) lt!85222) (apply!129 lt!85215 lt!85222))))

(declare-fun lt!85409 () Unit!5251)

(assert (=> d!52007 (= lt!85409 (choose!932 lt!85215 lt!85214 (minValue!3397 thiss!1248) lt!85222))))

(declare-fun e!113109 () Bool)

(assert (=> d!52007 e!113109))

(declare-fun res!81459 () Bool)

(assert (=> d!52007 (=> (not res!81459) (not e!113109))))

(assert (=> d!52007 (= res!81459 (contains!1139 lt!85215 lt!85222))))

(assert (=> d!52007 (= (addApplyDifferent!105 lt!85215 lt!85214 (minValue!3397 thiss!1248) lt!85222) lt!85409)))

(declare-fun b!171373 () Bool)

(assert (=> b!171373 (= e!113109 (not (= lt!85222 lt!85214)))))

(assert (= (and d!52007 res!81459) b!171373))

(assert (=> d!52007 m!199535))

(declare-fun m!200077 () Bool)

(assert (=> d!52007 m!200077))

(assert (=> d!52007 m!199535))

(assert (=> d!52007 m!199537))

(assert (=> d!52007 m!199559))

(declare-fun m!200079 () Bool)

(assert (=> d!52007 m!200079))

(assert (=> b!171064 d!52007))

(declare-fun d!52009 () Bool)

(assert (=> d!52009 (= (apply!129 lt!85227 lt!85216) (get!1945 (getValueByKey!185 (toList!1081 lt!85227) lt!85216)))))

(declare-fun bs!7089 () Bool)

(assert (= bs!7089 d!52009))

(declare-fun m!200081 () Bool)

(assert (=> bs!7089 m!200081))

(assert (=> bs!7089 m!200081))

(declare-fun m!200083 () Bool)

(assert (=> bs!7089 m!200083))

(assert (=> b!171064 d!52009))

(declare-fun d!52011 () Bool)

(declare-fun res!81464 () Bool)

(declare-fun e!113114 () Bool)

(assert (=> d!52011 (=> res!81464 e!113114)))

(assert (=> d!52011 (= res!81464 (and ((_ is Cons!2172) (toList!1081 lt!85093)) (= (_1!1610 (h!2789 (toList!1081 lt!85093))) key!828)))))

(assert (=> d!52011 (= (containsKey!188 (toList!1081 lt!85093) key!828) e!113114)))

(declare-fun b!171378 () Bool)

(declare-fun e!113115 () Bool)

(assert (=> b!171378 (= e!113114 e!113115)))

(declare-fun res!81465 () Bool)

(assert (=> b!171378 (=> (not res!81465) (not e!113115))))

(assert (=> b!171378 (= res!81465 (and (or (not ((_ is Cons!2172) (toList!1081 lt!85093))) (bvsle (_1!1610 (h!2789 (toList!1081 lt!85093))) key!828)) ((_ is Cons!2172) (toList!1081 lt!85093)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85093))) key!828)))))

(declare-fun b!171379 () Bool)

(assert (=> b!171379 (= e!113115 (containsKey!188 (t!6970 (toList!1081 lt!85093)) key!828))))

(assert (= (and d!52011 (not res!81464)) b!171378))

(assert (= (and b!171378 res!81465) b!171379))

(declare-fun m!200085 () Bool)

(assert (=> b!171379 m!200085))

(assert (=> d!51849 d!52011))

(declare-fun d!52013 () Bool)

(declare-fun e!113116 () Bool)

(assert (=> d!52013 e!113116))

(declare-fun res!81467 () Bool)

(assert (=> d!52013 (=> (not res!81467) (not e!113116))))

(declare-fun lt!85410 () ListLongMap!2131)

(assert (=> d!52013 (= res!81467 (contains!1139 lt!85410 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85411 () List!2176)

(assert (=> d!52013 (= lt!85410 (ListLongMap!2132 lt!85411))))

(declare-fun lt!85413 () Unit!5251)

(declare-fun lt!85412 () Unit!5251)

(assert (=> d!52013 (= lt!85413 lt!85412)))

(assert (=> d!52013 (= (getValueByKey!185 lt!85411 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!52013 (= lt!85412 (lemmaContainsTupThenGetReturnValue!98 lt!85411 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!52013 (= lt!85411 (insertStrictlySorted!101 (toList!1081 call!17392) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!52013 (= (+!243 call!17392 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) lt!85410)))

(declare-fun b!171380 () Bool)

(declare-fun res!81466 () Bool)

(assert (=> b!171380 (=> (not res!81466) (not e!113116))))

(assert (=> b!171380 (= res!81466 (= (getValueByKey!185 (toList!1081 lt!85410) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171381 () Bool)

(assert (=> b!171381 (= e!113116 (contains!1141 (toList!1081 lt!85410) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(assert (= (and d!52013 res!81467) b!171380))

(assert (= (and b!171380 res!81466) b!171381))

(declare-fun m!200087 () Bool)

(assert (=> d!52013 m!200087))

(declare-fun m!200089 () Bool)

(assert (=> d!52013 m!200089))

(declare-fun m!200091 () Bool)

(assert (=> d!52013 m!200091))

(declare-fun m!200093 () Bool)

(assert (=> d!52013 m!200093))

(declare-fun m!200095 () Bool)

(assert (=> b!171380 m!200095))

(declare-fun m!200097 () Bool)

(assert (=> b!171381 m!200097))

(assert (=> b!171043 d!52013))

(declare-fun b!171383 () Bool)

(declare-fun res!81469 () Bool)

(declare-fun e!113117 () Bool)

(assert (=> b!171383 (=> (not res!81469) (not e!113117))))

(assert (=> b!171383 (= res!81469 (bvsge (size!3679 lt!85094) (_size!1161 lt!85094)))))

(declare-fun b!171382 () Bool)

(declare-fun res!81468 () Bool)

(assert (=> b!171382 (=> (not res!81468) (not e!113117))))

(assert (=> b!171382 (= res!81468 (and (= (size!3674 (_values!3537 lt!85094)) (bvadd (mask!8382 lt!85094) #b00000000000000000000000000000001)) (= (size!3673 (_keys!5386 lt!85094)) (size!3674 (_values!3537 lt!85094))) (bvsge (_size!1161 lt!85094) #b00000000000000000000000000000000) (bvsle (_size!1161 lt!85094) (bvadd (mask!8382 lt!85094) #b00000000000000000000000000000001))))))

(declare-fun d!52015 () Bool)

(declare-fun res!81470 () Bool)

(assert (=> d!52015 (=> (not res!81470) (not e!113117))))

(assert (=> d!52015 (= res!81470 (validMask!0 (mask!8382 lt!85094)))))

(assert (=> d!52015 (= (simpleValid!135 lt!85094) e!113117)))

(declare-fun b!171385 () Bool)

(assert (=> b!171385 (= e!113117 (and (bvsge (extraKeys!3295 lt!85094) #b00000000000000000000000000000000) (bvsle (extraKeys!3295 lt!85094) #b00000000000000000000000000000011) (bvsge (_vacant!1161 lt!85094) #b00000000000000000000000000000000)))))

(declare-fun b!171384 () Bool)

(declare-fun res!81471 () Bool)

(assert (=> b!171384 (=> (not res!81471) (not e!113117))))

(assert (=> b!171384 (= res!81471 (= (size!3679 lt!85094) (bvadd (_size!1161 lt!85094) (bvsdiv (bvadd (extraKeys!3295 lt!85094) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!52015 res!81470) b!171382))

(assert (= (and b!171382 res!81468) b!171383))

(assert (= (and b!171383 res!81469) b!171384))

(assert (= (and b!171384 res!81471) b!171385))

(declare-fun m!200099 () Bool)

(assert (=> b!171383 m!200099))

(assert (=> d!52015 m!199697))

(assert (=> b!171384 m!200099))

(assert (=> d!51859 d!52015))

(declare-fun d!52017 () Bool)

(assert (=> d!52017 (= (apply!129 lt!85199 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1945 (getValueByKey!185 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7090 () Bool)

(assert (= bs!7090 d!52017))

(assert (=> bs!7090 m!199609))

(assert (=> bs!7090 m!199609))

(declare-fun m!200101 () Bool)

(assert (=> bs!7090 m!200101))

(assert (=> b!171042 d!52017))

(declare-fun b!171387 () Bool)

(declare-fun e!113119 () Bool)

(assert (=> b!171387 (= e!113119 tp_is_empty!4003)))

(declare-fun mapNonEmpty!6807 () Bool)

(declare-fun mapRes!6807 () Bool)

(declare-fun tp!15339 () Bool)

(declare-fun e!113118 () Bool)

(assert (=> mapNonEmpty!6807 (= mapRes!6807 (and tp!15339 e!113118))))

(declare-fun mapValue!6807 () ValueCell!1658)

(declare-fun mapKey!6807 () (_ BitVec 32))

(declare-fun mapRest!6807 () (Array (_ BitVec 32) ValueCell!1658))

(assert (=> mapNonEmpty!6807 (= mapRest!6806 (store mapRest!6807 mapKey!6807 mapValue!6807))))

(declare-fun mapIsEmpty!6807 () Bool)

(assert (=> mapIsEmpty!6807 mapRes!6807))

(declare-fun condMapEmpty!6807 () Bool)

(declare-fun mapDefault!6807 () ValueCell!1658)

(assert (=> mapNonEmpty!6806 (= condMapEmpty!6807 (= mapRest!6806 ((as const (Array (_ BitVec 32) ValueCell!1658)) mapDefault!6807)))))

(assert (=> mapNonEmpty!6806 (= tp!15338 (and e!113119 mapRes!6807))))

(declare-fun b!171386 () Bool)

(assert (=> b!171386 (= e!113118 tp_is_empty!4003)))

(assert (= (and mapNonEmpty!6806 condMapEmpty!6807) mapIsEmpty!6807))

(assert (= (and mapNonEmpty!6806 (not condMapEmpty!6807)) mapNonEmpty!6807))

(assert (= (and mapNonEmpty!6807 ((_ is ValueCellFull!1658) mapValue!6807)) b!171386))

(assert (= (and mapNonEmpty!6806 ((_ is ValueCellFull!1658) mapDefault!6807)) b!171387))

(declare-fun m!200103 () Bool)

(assert (=> mapNonEmpty!6807 m!200103))

(declare-fun b_lambda!6927 () Bool)

(assert (= b_lambda!6919 (or (and b!170908 b_free!4231) b_lambda!6927)))

(declare-fun b_lambda!6929 () Bool)

(assert (= b_lambda!6923 (or (and b!170908 b_free!4231) b_lambda!6929)))

(declare-fun b_lambda!6931 () Bool)

(assert (= b_lambda!6925 (or (and b!170908 b_free!4231) b_lambda!6931)))

(declare-fun b_lambda!6933 () Bool)

(assert (= b_lambda!6917 (or (and b!170908 b_free!4231) b_lambda!6933)))

(check-sat (not d!51941) (not bm!17430) (not b!171174) (not b!171257) (not b!171328) (not d!51893) (not b!171297) (not b!171184) (not d!51973) (not bm!17433) (not b!171218) (not d!51961) (not b!171136) (not b!171263) (not b!171360) (not d!51911) (not b!171204) (not b!171254) (not bm!17405) (not d!52001) (not d!51887) (not d!51903) (not b!171145) (not b!171258) (not b_lambda!6913) (not b!171262) tp_is_empty!4003 (not bm!17436) (not bm!17432) (not b!171324) (not b!171384) (not b!171121) (not b!171120) (not b_lambda!6921) (not d!51955) (not d!51867) (not b!171276) (not b!171336) (not b!171255) (not b_lambda!6931) (not d!51875) (not b!171267) (not d!51931) (not b!171183) (not b!171279) (not b!171147) (not b!171358) (not d!51923) (not d!51981) (not bm!17408) (not d!52015) (not b!171333) (not d!51971) (not d!52017) (not b!171207) (not b!171370) (not b!171347) (not b!171260) (not b!171130) (not b!171321) (not bm!17417) (not d!51985) (not d!51967) (not b!171315) (not b!171274) (not d!51905) (not b!171310) (not d!51963) (not b!171343) (not d!51991) (not b!171355) (not d!51907) (not b!171361) (not d!52007) (not b!171124) (not d!51959) (not b!171381) (not b!171372) (not b!171353) (not bm!17416) (not bm!17415) (not b!171290) (not b!171379) (not d!51943) (not d!51999) (not b!171118) (not b!171135) (not b!171250) (not bm!17431) (not d!51873) (not d!51897) (not b!171307) (not d!51957) (not b!171273) (not b!171309) (not b!171165) (not d!51945) (not b!171344) (not b!171289) (not b!171363) (not d!51921) (not b!171224) (not b!171366) (not d!51937) (not d!51925) (not b!171380) (not b!171269) (not b!171175) (not b!171335) (not b!171170) (not d!51949) (not b!171304) (not d!51865) (not b!171114) (not bm!17437) (not b!171369) (not d!51899) (not b!171327) (not d!51917) (not d!51871) (not d!51997) (not b!171111) (not b!171179) (not d!51885) (not d!51977) (not b!171277) (not d!52005) (not b!171331) (not b!171181) (not b!171187) (not b!171320) (not b!171186) (not b!171203) (not b_next!4231) (not d!51989) (not b!171383) (not b_lambda!6929) (not d!51919) (not d!51879) (not d!51935) (not b!171302) b_and!10677 (not b!171364) (not b!171160) (not d!51965) (not b!171367) (not d!51947) (not b!171300) (not b!171325) (not b!171272) (not b!171116) (not bm!17421) (not b!171180) (not d!51929) (not d!52013) (not bm!17411) (not b!171122) (not d!52009) (not d!51995) (not b!171294) (not d!51983) (not b!171351) (not d!51951) (not b!171119) (not d!51987) (not b!171225) (not b!171278) (not mapNonEmpty!6807) (not b!171346) (not b_lambda!6933) (not b!171337) (not bm!17418) (not b!171292) (not b_lambda!6915) (not b!171182) (not d!52003) (not b!171330) (not b!171163) (not b!171334) (not b_lambda!6927) (not b!171205) (not b!171368) (not b!171319) (not d!51953) (not d!51915) (not d!51891) (not b!171115) (not b!171189) (not b!171200) (not d!51993) (not b!171256) (not d!51969))
(check-sat b_and!10677 (not b_next!4231))
(get-model)

(declare-fun d!52019 () Bool)

(declare-fun res!81472 () Bool)

(declare-fun e!113120 () Bool)

(assert (=> d!52019 (=> res!81472 e!113120)))

(assert (=> d!52019 (= res!81472 (and ((_ is Cons!2172) (toList!1081 lt!85224)) (= (_1!1610 (h!2789 (toList!1081 lt!85224))) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52019 (= (containsKey!188 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) e!113120)))

(declare-fun b!171388 () Bool)

(declare-fun e!113121 () Bool)

(assert (=> b!171388 (= e!113120 e!113121)))

(declare-fun res!81473 () Bool)

(assert (=> b!171388 (=> (not res!81473) (not e!113121))))

(assert (=> b!171388 (= res!81473 (and (or (not ((_ is Cons!2172) (toList!1081 lt!85224))) (bvsle (_1!1610 (h!2789 (toList!1081 lt!85224))) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2172) (toList!1081 lt!85224)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85224))) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!171389 () Bool)

(assert (=> b!171389 (= e!113121 (containsKey!188 (t!6970 (toList!1081 lt!85224)) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52019 (not res!81472)) b!171388))

(assert (= (and b!171388 res!81473) b!171389))

(assert (=> b!171389 m!199453))

(declare-fun m!200105 () Bool)

(assert (=> b!171389 m!200105))

(assert (=> d!51943 d!52019))

(declare-fun d!52021 () Bool)

(declare-fun e!113122 () Bool)

(assert (=> d!52021 e!113122))

(declare-fun res!81474 () Bool)

(assert (=> d!52021 (=> res!81474 e!113122)))

(declare-fun lt!85414 () Bool)

(assert (=> d!52021 (= res!81474 (not lt!85414))))

(declare-fun lt!85416 () Bool)

(assert (=> d!52021 (= lt!85414 lt!85416)))

(declare-fun lt!85417 () Unit!5251)

(declare-fun e!113123 () Unit!5251)

(assert (=> d!52021 (= lt!85417 e!113123)))

(declare-fun c!30618 () Bool)

(assert (=> d!52021 (= c!30618 lt!85416)))

(assert (=> d!52021 (= lt!85416 (containsKey!188 (toList!1081 lt!85386) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!52021 (= (contains!1139 lt!85386 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) lt!85414)))

(declare-fun b!171390 () Bool)

(declare-fun lt!85415 () Unit!5251)

(assert (=> b!171390 (= e!113123 lt!85415)))

(assert (=> b!171390 (= lt!85415 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85386) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(assert (=> b!171390 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85386) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171391 () Bool)

(declare-fun Unit!5269 () Unit!5251)

(assert (=> b!171391 (= e!113123 Unit!5269)))

(declare-fun b!171392 () Bool)

(assert (=> b!171392 (= e!113122 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85386) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))))

(assert (= (and d!52021 c!30618) b!171390))

(assert (= (and d!52021 (not c!30618)) b!171391))

(assert (= (and d!52021 (not res!81474)) b!171392))

(declare-fun m!200107 () Bool)

(assert (=> d!52021 m!200107))

(declare-fun m!200109 () Bool)

(assert (=> b!171390 m!200109))

(assert (=> b!171390 m!199997))

(assert (=> b!171390 m!199997))

(declare-fun m!200111 () Bool)

(assert (=> b!171390 m!200111))

(assert (=> b!171392 m!199997))

(assert (=> b!171392 m!199997))

(assert (=> b!171392 m!200111))

(assert (=> d!51981 d!52021))

(declare-fun b!171394 () Bool)

(declare-fun e!113124 () Option!191)

(declare-fun e!113125 () Option!191)

(assert (=> b!171394 (= e!113124 e!113125)))

(declare-fun c!30620 () Bool)

(assert (=> b!171394 (= c!30620 (and ((_ is Cons!2172) lt!85387) (not (= (_1!1610 (h!2789 lt!85387)) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))))

(declare-fun b!171395 () Bool)

(assert (=> b!171395 (= e!113125 (getValueByKey!185 (t!6970 lt!85387) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(declare-fun d!52023 () Bool)

(declare-fun c!30619 () Bool)

(assert (=> d!52023 (= c!30619 (and ((_ is Cons!2172) lt!85387) (= (_1!1610 (h!2789 lt!85387)) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52023 (= (getValueByKey!185 lt!85387 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) e!113124)))

(declare-fun b!171393 () Bool)

(assert (=> b!171393 (= e!113124 (Some!190 (_2!1610 (h!2789 lt!85387))))))

(declare-fun b!171396 () Bool)

(assert (=> b!171396 (= e!113125 None!189)))

(assert (= (and d!52023 c!30619) b!171393))

(assert (= (and d!52023 (not c!30619)) b!171394))

(assert (= (and b!171394 c!30620) b!171395))

(assert (= (and b!171394 (not c!30620)) b!171396))

(declare-fun m!200113 () Bool)

(assert (=> b!171395 m!200113))

(assert (=> d!51981 d!52023))

(declare-fun d!52025 () Bool)

(assert (=> d!52025 (= (getValueByKey!185 lt!85387 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(declare-fun lt!85418 () Unit!5251)

(assert (=> d!52025 (= lt!85418 (choose!930 lt!85387 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(declare-fun e!113126 () Bool)

(assert (=> d!52025 e!113126))

(declare-fun res!81475 () Bool)

(assert (=> d!52025 (=> (not res!81475) (not e!113126))))

(assert (=> d!52025 (= res!81475 (isStrictlySorted!318 lt!85387))))

(assert (=> d!52025 (= (lemmaContainsTupThenGetReturnValue!98 lt!85387 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) lt!85418)))

(declare-fun b!171397 () Bool)

(declare-fun res!81476 () Bool)

(assert (=> b!171397 (=> (not res!81476) (not e!113126))))

(assert (=> b!171397 (= res!81476 (containsKey!188 lt!85387 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171398 () Bool)

(assert (=> b!171398 (= e!113126 (contains!1141 lt!85387 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))))

(assert (= (and d!52025 res!81475) b!171397))

(assert (= (and b!171397 res!81476) b!171398))

(assert (=> d!52025 m!199991))

(declare-fun m!200115 () Bool)

(assert (=> d!52025 m!200115))

(declare-fun m!200117 () Bool)

(assert (=> d!52025 m!200117))

(declare-fun m!200119 () Bool)

(assert (=> b!171397 m!200119))

(declare-fun m!200121 () Bool)

(assert (=> b!171398 m!200121))

(assert (=> d!51981 d!52025))

(declare-fun b!171399 () Bool)

(declare-fun e!113129 () List!2176)

(declare-fun call!17443 () List!2176)

(assert (=> b!171399 (= e!113129 call!17443)))

(declare-fun b!171400 () Bool)

(assert (=> b!171400 (= e!113129 call!17443)))

(declare-fun b!171401 () Bool)

(declare-fun c!30621 () Bool)

(assert (=> b!171401 (= c!30621 (and ((_ is Cons!2172) (toList!1081 lt!85227)) (bvsgt (_1!1610 (h!2789 (toList!1081 lt!85227))) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))))

(declare-fun e!113128 () List!2176)

(assert (=> b!171401 (= e!113128 e!113129)))

(declare-fun d!52027 () Bool)

(declare-fun e!113127 () Bool)

(assert (=> d!52027 e!113127))

(declare-fun res!81478 () Bool)

(assert (=> d!52027 (=> (not res!81478) (not e!113127))))

(declare-fun lt!85419 () List!2176)

(assert (=> d!52027 (= res!81478 (isStrictlySorted!318 lt!85419))))

(declare-fun e!113131 () List!2176)

(assert (=> d!52027 (= lt!85419 e!113131)))

(declare-fun c!30622 () Bool)

(assert (=> d!52027 (= c!30622 (and ((_ is Cons!2172) (toList!1081 lt!85227)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85227))) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52027 (isStrictlySorted!318 (toList!1081 lt!85227))))

(assert (=> d!52027 (= (insertStrictlySorted!101 (toList!1081 lt!85227) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) lt!85419)))

(declare-fun b!171402 () Bool)

(assert (=> b!171402 (= e!113131 e!113128)))

(declare-fun c!30623 () Bool)

(assert (=> b!171402 (= c!30623 (and ((_ is Cons!2172) (toList!1081 lt!85227)) (= (_1!1610 (h!2789 (toList!1081 lt!85227))) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))))

(declare-fun b!171403 () Bool)

(assert (=> b!171403 (= e!113127 (contains!1141 lt!85419 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))))

(declare-fun b!171404 () Bool)

(declare-fun call!17441 () List!2176)

(assert (=> b!171404 (= e!113128 call!17441)))

(declare-fun e!113130 () List!2176)

(declare-fun b!171405 () Bool)

(assert (=> b!171405 (= e!113130 (ite c!30623 (t!6970 (toList!1081 lt!85227)) (ite c!30621 (Cons!2172 (h!2789 (toList!1081 lt!85227)) (t!6970 (toList!1081 lt!85227))) Nil!2173)))))

(declare-fun bm!17438 () Bool)

(declare-fun call!17442 () List!2176)

(assert (=> bm!17438 (= call!17441 call!17442)))

(declare-fun b!171406 () Bool)

(assert (=> b!171406 (= e!113131 call!17442)))

(declare-fun b!171407 () Bool)

(assert (=> b!171407 (= e!113130 (insertStrictlySorted!101 (t!6970 (toList!1081 lt!85227)) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(declare-fun bm!17439 () Bool)

(assert (=> bm!17439 (= call!17443 call!17441)))

(declare-fun b!171408 () Bool)

(declare-fun res!81477 () Bool)

(assert (=> b!171408 (=> (not res!81477) (not e!113127))))

(assert (=> b!171408 (= res!81477 (containsKey!188 lt!85419 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(declare-fun bm!17440 () Bool)

(assert (=> bm!17440 (= call!17442 ($colon$colon!96 e!113130 (ite c!30622 (h!2789 (toList!1081 lt!85227)) (tuple2!3199 (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))))

(declare-fun c!30624 () Bool)

(assert (=> bm!17440 (= c!30624 c!30622)))

(assert (= (and d!52027 c!30622) b!171406))

(assert (= (and d!52027 (not c!30622)) b!171402))

(assert (= (and b!171402 c!30623) b!171404))

(assert (= (and b!171402 (not c!30623)) b!171401))

(assert (= (and b!171401 c!30621) b!171399))

(assert (= (and b!171401 (not c!30621)) b!171400))

(assert (= (or b!171399 b!171400) bm!17439))

(assert (= (or b!171404 bm!17439) bm!17438))

(assert (= (or b!171406 bm!17438) bm!17440))

(assert (= (and bm!17440 c!30624) b!171407))

(assert (= (and bm!17440 (not c!30624)) b!171405))

(assert (= (and d!52027 res!81478) b!171408))

(assert (= (and b!171408 res!81477) b!171403))

(declare-fun m!200123 () Bool)

(assert (=> b!171407 m!200123))

(declare-fun m!200125 () Bool)

(assert (=> b!171408 m!200125))

(declare-fun m!200127 () Bool)

(assert (=> d!52027 m!200127))

(declare-fun m!200129 () Bool)

(assert (=> d!52027 m!200129))

(declare-fun m!200131 () Bool)

(assert (=> bm!17440 m!200131))

(declare-fun m!200133 () Bool)

(assert (=> b!171403 m!200133))

(assert (=> d!51981 d!52027))

(assert (=> b!171325 d!51889))

(declare-fun d!52029 () Bool)

(assert (=> d!52029 (= (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!440 (getValueByKey!185 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7091 () Bool)

(assert (= bs!7091 d!52029))

(assert (=> bs!7091 m!199627))

(declare-fun m!200135 () Bool)

(assert (=> bs!7091 m!200135))

(assert (=> b!171186 d!52029))

(declare-fun b!171410 () Bool)

(declare-fun e!113132 () Option!191)

(declare-fun e!113133 () Option!191)

(assert (=> b!171410 (= e!113132 e!113133)))

(declare-fun c!30626 () Bool)

(assert (=> b!171410 (= c!30626 (and ((_ is Cons!2172) (toList!1081 lt!85224)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85224))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171411 () Bool)

(assert (=> b!171411 (= e!113133 (getValueByKey!185 (t!6970 (toList!1081 lt!85224)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!52031 () Bool)

(declare-fun c!30625 () Bool)

(assert (=> d!52031 (= c!30625 (and ((_ is Cons!2172) (toList!1081 lt!85224)) (= (_1!1610 (h!2789 (toList!1081 lt!85224))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52031 (= (getValueByKey!185 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000) e!113132)))

(declare-fun b!171409 () Bool)

(assert (=> b!171409 (= e!113132 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85224)))))))

(declare-fun b!171412 () Bool)

(assert (=> b!171412 (= e!113133 None!189)))

(assert (= (and d!52031 c!30625) b!171409))

(assert (= (and d!52031 (not c!30625)) b!171410))

(assert (= (and b!171410 c!30626) b!171411))

(assert (= (and b!171410 (not c!30626)) b!171412))

(declare-fun m!200137 () Bool)

(assert (=> b!171411 m!200137))

(assert (=> b!171186 d!52031))

(declare-fun d!52033 () Bool)

(declare-fun lt!85420 () Bool)

(assert (=> d!52033 (= lt!85420 (select (content!148 (toList!1081 lt!85391)) (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))

(declare-fun e!113135 () Bool)

(assert (=> d!52033 (= lt!85420 e!113135)))

(declare-fun res!81479 () Bool)

(assert (=> d!52033 (=> (not res!81479) (not e!113135))))

(assert (=> d!52033 (= res!81479 ((_ is Cons!2172) (toList!1081 lt!85391)))))

(assert (=> d!52033 (= (contains!1141 (toList!1081 lt!85391) (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) lt!85420)))

(declare-fun b!171413 () Bool)

(declare-fun e!113134 () Bool)

(assert (=> b!171413 (= e!113135 e!113134)))

(declare-fun res!81480 () Bool)

(assert (=> b!171413 (=> res!81480 e!113134)))

(assert (=> b!171413 (= res!81480 (= (h!2789 (toList!1081 lt!85391)) (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))

(declare-fun b!171414 () Bool)

(assert (=> b!171414 (= e!113134 (contains!1141 (t!6970 (toList!1081 lt!85391)) (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))

(assert (= (and d!52033 res!81479) b!171413))

(assert (= (and b!171413 (not res!81480)) b!171414))

(declare-fun m!200139 () Bool)

(assert (=> d!52033 m!200139))

(declare-fun m!200141 () Bool)

(assert (=> d!52033 m!200141))

(declare-fun m!200143 () Bool)

(assert (=> b!171414 m!200143))

(assert (=> b!171364 d!52033))

(declare-fun d!52035 () Bool)

(declare-fun e!113136 () Bool)

(assert (=> d!52035 e!113136))

(declare-fun res!81481 () Bool)

(assert (=> d!52035 (=> res!81481 e!113136)))

(declare-fun lt!85421 () Bool)

(assert (=> d!52035 (= res!81481 (not lt!85421))))

(declare-fun lt!85423 () Bool)

(assert (=> d!52035 (= lt!85421 lt!85423)))

(declare-fun lt!85424 () Unit!5251)

(declare-fun e!113137 () Unit!5251)

(assert (=> d!52035 (= lt!85424 e!113137)))

(declare-fun c!30627 () Bool)

(assert (=> d!52035 (= c!30627 lt!85423)))

(assert (=> d!52035 (= lt!85423 (containsKey!188 (toList!1081 lt!85362) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(assert (=> d!52035 (= (contains!1139 lt!85362 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) lt!85421)))

(declare-fun b!171415 () Bool)

(declare-fun lt!85422 () Unit!5251)

(assert (=> b!171415 (= e!113137 lt!85422)))

(assert (=> b!171415 (= lt!85422 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85362) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(assert (=> b!171415 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85362) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(declare-fun b!171416 () Bool)

(declare-fun Unit!5270 () Unit!5251)

(assert (=> b!171416 (= e!113137 Unit!5270)))

(declare-fun b!171417 () Bool)

(assert (=> b!171417 (= e!113136 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85362) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52035 c!30627) b!171415))

(assert (= (and d!52035 (not c!30627)) b!171416))

(assert (= (and d!52035 (not res!81481)) b!171417))

(declare-fun m!200145 () Bool)

(assert (=> d!52035 m!200145))

(declare-fun m!200147 () Bool)

(assert (=> b!171415 m!200147))

(assert (=> b!171415 m!199911))

(assert (=> b!171415 m!199911))

(declare-fun m!200149 () Bool)

(assert (=> b!171415 m!200149))

(assert (=> b!171417 m!199911))

(assert (=> b!171417 m!199911))

(assert (=> b!171417 m!200149))

(assert (=> d!51949 d!52035))

(declare-fun b!171419 () Bool)

(declare-fun e!113138 () Option!191)

(declare-fun e!113139 () Option!191)

(assert (=> b!171419 (= e!113138 e!113139)))

(declare-fun c!30629 () Bool)

(assert (=> b!171419 (= c!30629 (and ((_ is Cons!2172) lt!85363) (not (= (_1!1610 (h!2789 lt!85363)) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171420 () Bool)

(assert (=> b!171420 (= e!113139 (getValueByKey!185 (t!6970 lt!85363) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(declare-fun d!52037 () Bool)

(declare-fun c!30628 () Bool)

(assert (=> d!52037 (= c!30628 (and ((_ is Cons!2172) lt!85363) (= (_1!1610 (h!2789 lt!85363)) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))))

(assert (=> d!52037 (= (getValueByKey!185 lt!85363 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) e!113138)))

(declare-fun b!171418 () Bool)

(assert (=> b!171418 (= e!113138 (Some!190 (_2!1610 (h!2789 lt!85363))))))

(declare-fun b!171421 () Bool)

(assert (=> b!171421 (= e!113139 None!189)))

(assert (= (and d!52037 c!30628) b!171418))

(assert (= (and d!52037 (not c!30628)) b!171419))

(assert (= (and b!171419 c!30629) b!171420))

(assert (= (and b!171419 (not c!30629)) b!171421))

(declare-fun m!200151 () Bool)

(assert (=> b!171420 m!200151))

(assert (=> d!51949 d!52037))

(declare-fun d!52039 () Bool)

(assert (=> d!52039 (= (getValueByKey!185 lt!85363 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85425 () Unit!5251)

(assert (=> d!52039 (= lt!85425 (choose!930 lt!85363 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(declare-fun e!113140 () Bool)

(assert (=> d!52039 e!113140))

(declare-fun res!81482 () Bool)

(assert (=> d!52039 (=> (not res!81482) (not e!113140))))

(assert (=> d!52039 (= res!81482 (isStrictlySorted!318 lt!85363))))

(assert (=> d!52039 (= (lemmaContainsTupThenGetReturnValue!98 lt!85363 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) lt!85425)))

(declare-fun b!171422 () Bool)

(declare-fun res!81483 () Bool)

(assert (=> b!171422 (=> (not res!81483) (not e!113140))))

(assert (=> b!171422 (= res!81483 (containsKey!188 lt!85363 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(declare-fun b!171423 () Bool)

(assert (=> b!171423 (= e!113140 (contains!1141 lt!85363 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52039 res!81482) b!171422))

(assert (= (and b!171422 res!81483) b!171423))

(assert (=> d!52039 m!199905))

(declare-fun m!200153 () Bool)

(assert (=> d!52039 m!200153))

(declare-fun m!200155 () Bool)

(assert (=> d!52039 m!200155))

(declare-fun m!200157 () Bool)

(assert (=> b!171422 m!200157))

(declare-fun m!200159 () Bool)

(assert (=> b!171423 m!200159))

(assert (=> d!51949 d!52039))

(declare-fun b!171424 () Bool)

(declare-fun e!113143 () List!2176)

(declare-fun call!17446 () List!2176)

(assert (=> b!171424 (= e!113143 call!17446)))

(declare-fun b!171425 () Bool)

(assert (=> b!171425 (= e!113143 call!17446)))

(declare-fun b!171426 () Bool)

(declare-fun c!30630 () Bool)

(assert (=> b!171426 (= c!30630 (and ((_ is Cons!2172) (toList!1081 lt!85190)) (bvsgt (_1!1610 (h!2789 (toList!1081 lt!85190))) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))))

(declare-fun e!113142 () List!2176)

(assert (=> b!171426 (= e!113142 e!113143)))

(declare-fun d!52041 () Bool)

(declare-fun e!113141 () Bool)

(assert (=> d!52041 e!113141))

(declare-fun res!81485 () Bool)

(assert (=> d!52041 (=> (not res!81485) (not e!113141))))

(declare-fun lt!85426 () List!2176)

(assert (=> d!52041 (= res!81485 (isStrictlySorted!318 lt!85426))))

(declare-fun e!113145 () List!2176)

(assert (=> d!52041 (= lt!85426 e!113145)))

(declare-fun c!30631 () Bool)

(assert (=> d!52041 (= c!30631 (and ((_ is Cons!2172) (toList!1081 lt!85190)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85190))) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))))

(assert (=> d!52041 (isStrictlySorted!318 (toList!1081 lt!85190))))

(assert (=> d!52041 (= (insertStrictlySorted!101 (toList!1081 lt!85190) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) lt!85426)))

(declare-fun b!171427 () Bool)

(assert (=> b!171427 (= e!113145 e!113142)))

(declare-fun c!30632 () Bool)

(assert (=> b!171427 (= c!30632 (and ((_ is Cons!2172) (toList!1081 lt!85190)) (= (_1!1610 (h!2789 (toList!1081 lt!85190))) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))))

(declare-fun b!171428 () Bool)

(assert (=> b!171428 (= e!113141 (contains!1141 lt!85426 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))))

(declare-fun b!171429 () Bool)

(declare-fun call!17444 () List!2176)

(assert (=> b!171429 (= e!113142 call!17444)))

(declare-fun e!113144 () List!2176)

(declare-fun b!171430 () Bool)

(assert (=> b!171430 (= e!113144 (ite c!30632 (t!6970 (toList!1081 lt!85190)) (ite c!30630 (Cons!2172 (h!2789 (toList!1081 lt!85190)) (t!6970 (toList!1081 lt!85190))) Nil!2173)))))

(declare-fun bm!17441 () Bool)

(declare-fun call!17445 () List!2176)

(assert (=> bm!17441 (= call!17444 call!17445)))

(declare-fun b!171431 () Bool)

(assert (=> b!171431 (= e!113145 call!17445)))

(declare-fun b!171432 () Bool)

(assert (=> b!171432 (= e!113144 (insertStrictlySorted!101 (t!6970 (toList!1081 lt!85190)) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17442 () Bool)

(assert (=> bm!17442 (= call!17446 call!17444)))

(declare-fun b!171433 () Bool)

(declare-fun res!81484 () Bool)

(assert (=> b!171433 (=> (not res!81484) (not e!113141))))

(assert (=> b!171433 (= res!81484 (containsKey!188 lt!85426 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17443 () Bool)

(assert (=> bm!17443 (= call!17445 ($colon$colon!96 e!113144 (ite c!30631 (h!2789 (toList!1081 lt!85190)) (tuple2!3199 (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30633 () Bool)

(assert (=> bm!17443 (= c!30633 c!30631)))

(assert (= (and d!52041 c!30631) b!171431))

(assert (= (and d!52041 (not c!30631)) b!171427))

(assert (= (and b!171427 c!30632) b!171429))

(assert (= (and b!171427 (not c!30632)) b!171426))

(assert (= (and b!171426 c!30630) b!171424))

(assert (= (and b!171426 (not c!30630)) b!171425))

(assert (= (or b!171424 b!171425) bm!17442))

(assert (= (or b!171429 bm!17442) bm!17441))

(assert (= (or b!171431 bm!17441) bm!17443))

(assert (= (and bm!17443 c!30633) b!171432))

(assert (= (and bm!17443 (not c!30633)) b!171430))

(assert (= (and d!52041 res!81485) b!171433))

(assert (= (and b!171433 res!81484) b!171428))

(declare-fun m!200161 () Bool)

(assert (=> b!171432 m!200161))

(declare-fun m!200163 () Bool)

(assert (=> b!171433 m!200163))

(declare-fun m!200165 () Bool)

(assert (=> d!52041 m!200165))

(declare-fun m!200167 () Bool)

(assert (=> d!52041 m!200167))

(declare-fun m!200169 () Bool)

(assert (=> bm!17443 m!200169))

(declare-fun m!200171 () Bool)

(assert (=> b!171428 m!200171))

(assert (=> d!51949 d!52041))

(declare-fun b!171434 () Bool)

(declare-fun e!113148 () List!2176)

(declare-fun call!17449 () List!2176)

(assert (=> b!171434 (= e!113148 call!17449)))

(declare-fun b!171435 () Bool)

(assert (=> b!171435 (= e!113148 call!17449)))

(declare-fun b!171436 () Bool)

(declare-fun c!30634 () Bool)

(assert (=> b!171436 (= c!30634 (and ((_ is Cons!2172) (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (bvsgt (_1!1610 (h!2789 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!113147 () List!2176)

(assert (=> b!171436 (= e!113147 e!113148)))

(declare-fun d!52043 () Bool)

(declare-fun e!113146 () Bool)

(assert (=> d!52043 e!113146))

(declare-fun res!81487 () Bool)

(assert (=> d!52043 (=> (not res!81487) (not e!113146))))

(declare-fun lt!85427 () List!2176)

(assert (=> d!52043 (= res!81487 (isStrictlySorted!318 lt!85427))))

(declare-fun e!113150 () List!2176)

(assert (=> d!52043 (= lt!85427 e!113150)))

(declare-fun c!30635 () Bool)

(assert (=> d!52043 (= c!30635 (and ((_ is Cons!2172) (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (bvslt (_1!1610 (h!2789 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52043 (isStrictlySorted!318 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))))

(assert (=> d!52043 (= (insertStrictlySorted!101 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85427)))

(declare-fun b!171437 () Bool)

(assert (=> b!171437 (= e!113150 e!113147)))

(declare-fun c!30636 () Bool)

(assert (=> b!171437 (= c!30636 (and ((_ is Cons!2172) (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (= (_1!1610 (h!2789 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171438 () Bool)

(assert (=> b!171438 (= e!113146 (contains!1141 lt!85427 (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171439 () Bool)

(declare-fun call!17447 () List!2176)

(assert (=> b!171439 (= e!113147 call!17447)))

(declare-fun b!171440 () Bool)

(declare-fun e!113149 () List!2176)

(assert (=> b!171440 (= e!113149 (ite c!30636 (t!6970 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (ite c!30634 (Cons!2172 (h!2789 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (t!6970 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))) Nil!2173)))))

(declare-fun bm!17444 () Bool)

(declare-fun call!17448 () List!2176)

(assert (=> bm!17444 (= call!17447 call!17448)))

(declare-fun b!171441 () Bool)

(assert (=> b!171441 (= e!113150 call!17448)))

(declare-fun b!171442 () Bool)

(assert (=> b!171442 (= e!113149 (insertStrictlySorted!101 (t!6970 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun bm!17445 () Bool)

(assert (=> bm!17445 (= call!17449 call!17447)))

(declare-fun b!171443 () Bool)

(declare-fun res!81486 () Bool)

(assert (=> b!171443 (=> (not res!81486) (not e!113146))))

(assert (=> b!171443 (= res!81486 (containsKey!188 lt!85427 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun bm!17446 () Bool)

(assert (=> bm!17446 (= call!17448 ($colon$colon!96 e!113149 (ite c!30635 (h!2789 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!30637 () Bool)

(assert (=> bm!17446 (= c!30637 c!30635)))

(assert (= (and d!52043 c!30635) b!171441))

(assert (= (and d!52043 (not c!30635)) b!171437))

(assert (= (and b!171437 c!30636) b!171439))

(assert (= (and b!171437 (not c!30636)) b!171436))

(assert (= (and b!171436 c!30634) b!171434))

(assert (= (and b!171436 (not c!30634)) b!171435))

(assert (= (or b!171434 b!171435) bm!17445))

(assert (= (or b!171439 bm!17445) bm!17444))

(assert (= (or b!171441 bm!17444) bm!17446))

(assert (= (and bm!17446 c!30637) b!171442))

(assert (= (and bm!17446 (not c!30637)) b!171440))

(assert (= (and d!52043 res!81487) b!171443))

(assert (= (and b!171443 res!81486) b!171438))

(declare-fun m!200173 () Bool)

(assert (=> b!171442 m!200173))

(declare-fun m!200175 () Bool)

(assert (=> b!171443 m!200175))

(declare-fun m!200177 () Bool)

(assert (=> d!52043 m!200177))

(declare-fun m!200179 () Bool)

(assert (=> d!52043 m!200179))

(declare-fun m!200181 () Bool)

(assert (=> bm!17446 m!200181))

(declare-fun m!200183 () Bool)

(assert (=> b!171438 m!200183))

(assert (=> b!171254 d!52043))

(declare-fun d!52045 () Bool)

(assert (=> d!52045 (= (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!171145 d!52045))

(declare-fun d!52047 () Bool)

(assert (=> d!52047 (= (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!440 (getValueByKey!185 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7092 () Bool)

(assert (= bs!7092 d!52047))

(assert (=> bs!7092 m!199619))

(declare-fun m!200185 () Bool)

(assert (=> bs!7092 m!200185))

(assert (=> b!171294 d!52047))

(declare-fun b!171445 () Bool)

(declare-fun e!113151 () Option!191)

(declare-fun e!113152 () Option!191)

(assert (=> b!171445 (= e!113151 e!113152)))

(declare-fun c!30639 () Bool)

(assert (=> b!171445 (= c!30639 (and ((_ is Cons!2172) (toList!1081 lt!85199)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85199))) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!171446 () Bool)

(assert (=> b!171446 (= e!113152 (getValueByKey!185 (t!6970 (toList!1081 lt!85199)) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52049 () Bool)

(declare-fun c!30638 () Bool)

(assert (=> d!52049 (= c!30638 (and ((_ is Cons!2172) (toList!1081 lt!85199)) (= (_1!1610 (h!2789 (toList!1081 lt!85199))) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52049 (= (getValueByKey!185 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) e!113151)))

(declare-fun b!171444 () Bool)

(assert (=> b!171444 (= e!113151 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85199)))))))

(declare-fun b!171447 () Bool)

(assert (=> b!171447 (= e!113152 None!189)))

(assert (= (and d!52049 c!30638) b!171444))

(assert (= (and d!52049 (not c!30638)) b!171445))

(assert (= (and b!171445 c!30639) b!171446))

(assert (= (and b!171445 (not c!30639)) b!171447))

(assert (=> b!171446 m!199453))

(declare-fun m!200187 () Bool)

(assert (=> b!171446 m!200187))

(assert (=> b!171294 d!52049))

(assert (=> b!171120 d!51889))

(declare-fun d!52051 () Bool)

(declare-fun e!113153 () Bool)

(assert (=> d!52051 e!113153))

(declare-fun res!81488 () Bool)

(assert (=> d!52051 (=> res!81488 e!113153)))

(declare-fun lt!85428 () Bool)

(assert (=> d!52051 (= res!81488 (not lt!85428))))

(declare-fun lt!85430 () Bool)

(assert (=> d!52051 (= lt!85428 lt!85430)))

(declare-fun lt!85431 () Unit!5251)

(declare-fun e!113154 () Unit!5251)

(assert (=> d!52051 (= lt!85431 e!113154)))

(declare-fun c!30640 () Bool)

(assert (=> d!52051 (= c!30640 lt!85430)))

(assert (=> d!52051 (= lt!85430 (containsKey!188 (toList!1081 lt!85215) lt!85222))))

(assert (=> d!52051 (= (contains!1139 lt!85215 lt!85222) lt!85428)))

(declare-fun b!171448 () Bool)

(declare-fun lt!85429 () Unit!5251)

(assert (=> b!171448 (= e!113154 lt!85429)))

(assert (=> b!171448 (= lt!85429 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85215) lt!85222))))

(assert (=> b!171448 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85215) lt!85222))))

(declare-fun b!171449 () Bool)

(declare-fun Unit!5271 () Unit!5251)

(assert (=> b!171449 (= e!113154 Unit!5271)))

(declare-fun b!171450 () Bool)

(assert (=> b!171450 (= e!113153 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85215) lt!85222)))))

(assert (= (and d!52051 c!30640) b!171448))

(assert (= (and d!52051 (not c!30640)) b!171449))

(assert (= (and d!52051 (not res!81488)) b!171450))

(declare-fun m!200189 () Bool)

(assert (=> d!52051 m!200189))

(declare-fun m!200191 () Bool)

(assert (=> b!171448 m!200191))

(assert (=> b!171448 m!200021))

(assert (=> b!171448 m!200021))

(declare-fun m!200193 () Bool)

(assert (=> b!171448 m!200193))

(assert (=> b!171450 m!200021))

(assert (=> b!171450 m!200021))

(assert (=> b!171450 m!200193))

(assert (=> d!52007 d!52051))

(assert (=> d!52007 d!51989))

(declare-fun d!52053 () Bool)

(assert (=> d!52053 (= (apply!129 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) lt!85222) (apply!129 lt!85215 lt!85222))))

(assert (=> d!52053 true))

(declare-fun _$34!1047 () Unit!5251)

(assert (=> d!52053 (= (choose!932 lt!85215 lt!85214 (minValue!3397 thiss!1248) lt!85222) _$34!1047)))

(declare-fun bs!7093 () Bool)

(assert (= bs!7093 d!52053))

(assert (=> bs!7093 m!199535))

(assert (=> bs!7093 m!199535))

(assert (=> bs!7093 m!199537))

(assert (=> bs!7093 m!199559))

(assert (=> d!52007 d!52053))

(assert (=> d!52007 d!51991))

(assert (=> d!52007 d!51997))

(declare-fun d!52055 () Bool)

(assert (=> d!52055 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85201) lt!85185)) (v!3915 (getValueByKey!185 (toList!1081 lt!85201) lt!85185)))))

(assert (=> d!51959 d!52055))

(declare-fun b!171453 () Bool)

(declare-fun e!113155 () Option!191)

(declare-fun e!113156 () Option!191)

(assert (=> b!171453 (= e!113155 e!113156)))

(declare-fun c!30642 () Bool)

(assert (=> b!171453 (= c!30642 (and ((_ is Cons!2172) (toList!1081 lt!85201)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85201))) lt!85185))))))

(declare-fun b!171454 () Bool)

(assert (=> b!171454 (= e!113156 (getValueByKey!185 (t!6970 (toList!1081 lt!85201)) lt!85185))))

(declare-fun d!52057 () Bool)

(declare-fun c!30641 () Bool)

(assert (=> d!52057 (= c!30641 (and ((_ is Cons!2172) (toList!1081 lt!85201)) (= (_1!1610 (h!2789 (toList!1081 lt!85201))) lt!85185)))))

(assert (=> d!52057 (= (getValueByKey!185 (toList!1081 lt!85201) lt!85185) e!113155)))

(declare-fun b!171452 () Bool)

(assert (=> b!171452 (= e!113155 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85201)))))))

(declare-fun b!171455 () Bool)

(assert (=> b!171455 (= e!113156 None!189)))

(assert (= (and d!52057 c!30641) b!171452))

(assert (= (and d!52057 (not c!30641)) b!171453))

(assert (= (and b!171453 c!30642) b!171454))

(assert (= (and b!171453 (not c!30642)) b!171455))

(declare-fun m!200195 () Bool)

(assert (=> b!171454 m!200195))

(assert (=> d!51959 d!52057))

(declare-fun b!171457 () Bool)

(declare-fun e!113157 () Option!191)

(declare-fun e!113158 () Option!191)

(assert (=> b!171457 (= e!113157 e!113158)))

(declare-fun c!30644 () Bool)

(assert (=> b!171457 (= c!30644 (and ((_ is Cons!2172) (toList!1081 lt!85317)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85317))) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171458 () Bool)

(assert (=> b!171458 (= e!113158 (getValueByKey!185 (t!6970 (toList!1081 lt!85317)) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun d!52059 () Bool)

(declare-fun c!30643 () Bool)

(assert (=> d!52059 (= c!30643 (and ((_ is Cons!2172) (toList!1081 lt!85317)) (= (_1!1610 (h!2789 (toList!1081 lt!85317))) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52059 (= (getValueByKey!185 (toList!1081 lt!85317) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) e!113157)))

(declare-fun b!171456 () Bool)

(assert (=> b!171456 (= e!113157 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85317)))))))

(declare-fun b!171459 () Bool)

(assert (=> b!171459 (= e!113158 None!189)))

(assert (= (and d!52059 c!30643) b!171456))

(assert (= (and d!52059 (not c!30643)) b!171457))

(assert (= (and b!171457 c!30644) b!171458))

(assert (= (and b!171457 (not c!30644)) b!171459))

(declare-fun m!200197 () Bool)

(assert (=> b!171458 m!200197))

(assert (=> b!171256 d!52059))

(declare-fun d!52061 () Bool)

(declare-fun lt!85432 () Bool)

(assert (=> d!52061 (= lt!85432 (select (content!148 (toList!1081 lt!85401)) (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))

(declare-fun e!113160 () Bool)

(assert (=> d!52061 (= lt!85432 e!113160)))

(declare-fun res!81489 () Bool)

(assert (=> d!52061 (=> (not res!81489) (not e!113160))))

(assert (=> d!52061 (= res!81489 ((_ is Cons!2172) (toList!1081 lt!85401)))))

(assert (=> d!52061 (= (contains!1141 (toList!1081 lt!85401) (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) lt!85432)))

(declare-fun b!171460 () Bool)

(declare-fun e!113159 () Bool)

(assert (=> b!171460 (= e!113160 e!113159)))

(declare-fun res!81490 () Bool)

(assert (=> b!171460 (=> res!81490 e!113159)))

(assert (=> b!171460 (= res!81490 (= (h!2789 (toList!1081 lt!85401)) (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))

(declare-fun b!171461 () Bool)

(assert (=> b!171461 (= e!113159 (contains!1141 (t!6970 (toList!1081 lt!85401)) (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))

(assert (= (and d!52061 res!81489) b!171460))

(assert (= (and b!171460 (not res!81490)) b!171461))

(declare-fun m!200199 () Bool)

(assert (=> d!52061 m!200199))

(declare-fun m!200201 () Bool)

(assert (=> d!52061 m!200201))

(declare-fun m!200203 () Bool)

(assert (=> b!171461 m!200203))

(assert (=> b!171369 d!52061))

(declare-fun d!52063 () Bool)

(assert (=> d!52063 (= (apply!129 lt!85290 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1945 (getValueByKey!185 (toList!1081 lt!85290) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7094 () Bool)

(assert (= bs!7094 d!52063))

(declare-fun m!200205 () Bool)

(assert (=> bs!7094 m!200205))

(assert (=> bs!7094 m!200205))

(declare-fun m!200207 () Bool)

(assert (=> bs!7094 m!200207))

(assert (=> b!171174 d!52063))

(declare-fun b!171463 () Bool)

(declare-fun e!113161 () Option!191)

(declare-fun e!113162 () Option!191)

(assert (=> b!171463 (= e!113161 e!113162)))

(declare-fun c!30646 () Bool)

(assert (=> b!171463 (= c!30646 (and ((_ is Cons!2172) (toList!1081 lt!85386)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85386))) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))))

(declare-fun b!171464 () Bool)

(assert (=> b!171464 (= e!113162 (getValueByKey!185 (t!6970 (toList!1081 lt!85386)) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))))

(declare-fun d!52065 () Bool)

(declare-fun c!30645 () Bool)

(assert (=> d!52065 (= c!30645 (and ((_ is Cons!2172) (toList!1081 lt!85386)) (= (_1!1610 (h!2789 (toList!1081 lt!85386))) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52065 (= (getValueByKey!185 (toList!1081 lt!85386) (_1!1610 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) e!113161)))

(declare-fun b!171462 () Bool)

(assert (=> b!171462 (= e!113161 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85386)))))))

(declare-fun b!171465 () Bool)

(assert (=> b!171465 (= e!113162 None!189)))

(assert (= (and d!52065 c!30645) b!171462))

(assert (= (and d!52065 (not c!30645)) b!171463))

(assert (= (and b!171463 c!30646) b!171464))

(assert (= (and b!171463 (not c!30646)) b!171465))

(declare-fun m!200209 () Bool)

(assert (=> b!171464 m!200209))

(assert (=> b!171360 d!52065))

(declare-fun d!52067 () Bool)

(assert (=> d!52067 (= (get!1947 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171136 d!52067))

(declare-fun d!52069 () Bool)

(declare-fun res!81491 () Bool)

(declare-fun e!113163 () Bool)

(assert (=> d!52069 (=> res!81491 e!113163)))

(assert (=> d!52069 (= res!81491 (and ((_ is Cons!2172) (toList!1081 lt!85199)) (= (_1!1610 (h!2789 (toList!1081 lt!85199))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52069 (= (containsKey!188 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000) e!113163)))

(declare-fun b!171466 () Bool)

(declare-fun e!113164 () Bool)

(assert (=> b!171466 (= e!113163 e!113164)))

(declare-fun res!81492 () Bool)

(assert (=> b!171466 (=> (not res!81492) (not e!113164))))

(assert (=> b!171466 (= res!81492 (and (or (not ((_ is Cons!2172) (toList!1081 lt!85199))) (bvsle (_1!1610 (h!2789 (toList!1081 lt!85199))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2172) (toList!1081 lt!85199)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85199))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171467 () Bool)

(assert (=> b!171467 (= e!113164 (containsKey!188 (t!6970 (toList!1081 lt!85199)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52069 (not res!81491)) b!171466))

(assert (= (and b!171466 res!81492) b!171467))

(declare-fun m!200211 () Bool)

(assert (=> b!171467 m!200211))

(assert (=> d!51893 d!52069))

(declare-fun b!171468 () Bool)

(declare-fun e!113166 () Bool)

(declare-fun e!113165 () Bool)

(assert (=> b!171468 (= e!113166 e!113165)))

(declare-fun c!30647 () Bool)

(assert (=> b!171468 (= c!30647 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52071 () Bool)

(declare-fun res!81494 () Bool)

(assert (=> d!52071 (=> res!81494 e!113166)))

(assert (=> d!52071 (= res!81494 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 lt!85094))))))

(assert (=> d!52071 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5386 lt!85094) (mask!8382 lt!85094)) e!113166)))

(declare-fun b!171469 () Bool)

(declare-fun call!17450 () Bool)

(assert (=> b!171469 (= e!113165 call!17450)))

(declare-fun b!171470 () Bool)

(declare-fun e!113167 () Bool)

(assert (=> b!171470 (= e!113165 e!113167)))

(declare-fun lt!85435 () (_ BitVec 64))

(assert (=> b!171470 (= lt!85435 (select (arr!3380 (_keys!5386 lt!85094)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!85433 () Unit!5251)

(assert (=> b!171470 (= lt!85433 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5386 lt!85094) lt!85435 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!171470 (arrayContainsKey!0 (_keys!5386 lt!85094) lt!85435 #b00000000000000000000000000000000)))

(declare-fun lt!85434 () Unit!5251)

(assert (=> b!171470 (= lt!85434 lt!85433)))

(declare-fun res!81493 () Bool)

(assert (=> b!171470 (= res!81493 (= (seekEntryOrOpen!0 (select (arr!3380 (_keys!5386 lt!85094)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5386 lt!85094) (mask!8382 lt!85094)) (Found!528 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171470 (=> (not res!81493) (not e!113167))))

(declare-fun b!171471 () Bool)

(assert (=> b!171471 (= e!113167 call!17450)))

(declare-fun bm!17447 () Bool)

(assert (=> bm!17447 (= call!17450 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5386 lt!85094) (mask!8382 lt!85094)))))

(assert (= (and d!52071 (not res!81494)) b!171468))

(assert (= (and b!171468 c!30647) b!171470))

(assert (= (and b!171468 (not c!30647)) b!171469))

(assert (= (and b!171470 res!81493) b!171471))

(assert (= (or b!171471 b!171469) bm!17447))

(declare-fun m!200213 () Bool)

(assert (=> b!171468 m!200213))

(assert (=> b!171468 m!200213))

(declare-fun m!200215 () Bool)

(assert (=> b!171468 m!200215))

(assert (=> b!171470 m!200213))

(declare-fun m!200217 () Bool)

(assert (=> b!171470 m!200217))

(declare-fun m!200219 () Bool)

(assert (=> b!171470 m!200219))

(assert (=> b!171470 m!200213))

(declare-fun m!200221 () Bool)

(assert (=> b!171470 m!200221))

(declare-fun m!200223 () Bool)

(assert (=> bm!17447 m!200223))

(assert (=> bm!17408 d!52071))

(declare-fun d!52073 () Bool)

(assert (=> d!52073 (= (size!3679 thiss!1248) (bvadd (_size!1161 thiss!1248) (bvsdiv (bvadd (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!171289 d!52073))

(declare-fun b!171473 () Bool)

(declare-fun e!113168 () Option!191)

(declare-fun e!113169 () Option!191)

(assert (=> b!171473 (= e!113168 e!113169)))

(declare-fun c!30649 () Bool)

(assert (=> b!171473 (= c!30649 (and ((_ is Cons!2172) (toList!1081 lt!85362)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85362))) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171474 () Bool)

(assert (=> b!171474 (= e!113169 (getValueByKey!185 (t!6970 (toList!1081 lt!85362)) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))))

(declare-fun c!30648 () Bool)

(declare-fun d!52075 () Bool)

(assert (=> d!52075 (= c!30648 (and ((_ is Cons!2172) (toList!1081 lt!85362)) (= (_1!1610 (h!2789 (toList!1081 lt!85362))) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))))

(assert (=> d!52075 (= (getValueByKey!185 (toList!1081 lt!85362) (_1!1610 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) e!113168)))

(declare-fun b!171472 () Bool)

(assert (=> b!171472 (= e!113168 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85362)))))))

(declare-fun b!171475 () Bool)

(assert (=> b!171475 (= e!113169 None!189)))

(assert (= (and d!52075 c!30648) b!171472))

(assert (= (and d!52075 (not c!30648)) b!171473))

(assert (= (and b!171473 c!30649) b!171474))

(assert (= (and b!171473 (not c!30649)) b!171475))

(declare-fun m!200225 () Bool)

(assert (=> b!171474 m!200225))

(assert (=> b!171336 d!52075))

(assert (=> b!171258 d!51889))

(declare-fun d!52077 () Bool)

(assert (=> d!52077 (= (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) lt!85210)) (v!3915 (getValueByKey!185 (toList!1081 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) lt!85210)))))

(assert (=> d!51999 d!52077))

(declare-fun b!171477 () Bool)

(declare-fun e!113170 () Option!191)

(declare-fun e!113171 () Option!191)

(assert (=> b!171477 (= e!113170 e!113171)))

(declare-fun c!30651 () Bool)

(assert (=> b!171477 (= c!30651 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))) (not (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))) lt!85210))))))

(declare-fun b!171478 () Bool)

(assert (=> b!171478 (= e!113171 (getValueByKey!185 (t!6970 (toList!1081 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))) lt!85210))))

(declare-fun d!52079 () Bool)

(declare-fun c!30650 () Bool)

(assert (=> d!52079 (= c!30650 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))) (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))) lt!85210)))))

(assert (=> d!52079 (= (getValueByKey!185 (toList!1081 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) lt!85210) e!113170)))

(declare-fun b!171476 () Bool)

(assert (=> b!171476 (= e!113170 (Some!190 (_2!1610 (h!2789 (toList!1081 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))))))

(declare-fun b!171479 () Bool)

(assert (=> b!171479 (= e!113171 None!189)))

(assert (= (and d!52079 c!30650) b!171476))

(assert (= (and d!52079 (not c!30650)) b!171477))

(assert (= (and b!171477 c!30651) b!171478))

(assert (= (and b!171477 (not c!30651)) b!171479))

(declare-fun m!200227 () Bool)

(assert (=> b!171478 m!200227))

(assert (=> d!51999 d!52079))

(declare-fun d!52081 () Bool)

(assert (=> d!52081 (not (contains!1139 (+!243 lt!85331 (tuple2!3199 lt!85332 lt!85335)) lt!85333))))

(declare-fun lt!85438 () Unit!5251)

(declare-fun choose!934 (ListLongMap!2131 (_ BitVec 64) V!4985 (_ BitVec 64)) Unit!5251)

(assert (=> d!52081 (= lt!85438 (choose!934 lt!85331 lt!85332 lt!85335 lt!85333))))

(declare-fun e!113174 () Bool)

(assert (=> d!52081 e!113174))

(declare-fun res!81497 () Bool)

(assert (=> d!52081 (=> (not res!81497) (not e!113174))))

(assert (=> d!52081 (= res!81497 (not (contains!1139 lt!85331 lt!85333)))))

(assert (=> d!52081 (= (addStillNotContains!73 lt!85331 lt!85332 lt!85335 lt!85333) lt!85438)))

(declare-fun b!171483 () Bool)

(assert (=> b!171483 (= e!113174 (not (= lt!85332 lt!85333)))))

(assert (= (and d!52081 res!81497) b!171483))

(assert (=> d!52081 m!199801))

(assert (=> d!52081 m!199801))

(assert (=> d!52081 m!199803))

(declare-fun m!200229 () Bool)

(assert (=> d!52081 m!200229))

(declare-fun m!200231 () Bool)

(assert (=> d!52081 m!200231))

(assert (=> b!171276 d!52081))

(declare-fun d!52083 () Bool)

(declare-fun e!113175 () Bool)

(assert (=> d!52083 e!113175))

(declare-fun res!81499 () Bool)

(assert (=> d!52083 (=> (not res!81499) (not e!113175))))

(declare-fun lt!85439 () ListLongMap!2131)

(assert (=> d!52083 (= res!81499 (contains!1139 lt!85439 (_1!1610 (tuple2!3199 lt!85332 lt!85335))))))

(declare-fun lt!85440 () List!2176)

(assert (=> d!52083 (= lt!85439 (ListLongMap!2132 lt!85440))))

(declare-fun lt!85442 () Unit!5251)

(declare-fun lt!85441 () Unit!5251)

(assert (=> d!52083 (= lt!85442 lt!85441)))

(assert (=> d!52083 (= (getValueByKey!185 lt!85440 (_1!1610 (tuple2!3199 lt!85332 lt!85335))) (Some!190 (_2!1610 (tuple2!3199 lt!85332 lt!85335))))))

(assert (=> d!52083 (= lt!85441 (lemmaContainsTupThenGetReturnValue!98 lt!85440 (_1!1610 (tuple2!3199 lt!85332 lt!85335)) (_2!1610 (tuple2!3199 lt!85332 lt!85335))))))

(assert (=> d!52083 (= lt!85440 (insertStrictlySorted!101 (toList!1081 lt!85331) (_1!1610 (tuple2!3199 lt!85332 lt!85335)) (_2!1610 (tuple2!3199 lt!85332 lt!85335))))))

(assert (=> d!52083 (= (+!243 lt!85331 (tuple2!3199 lt!85332 lt!85335)) lt!85439)))

(declare-fun b!171484 () Bool)

(declare-fun res!81498 () Bool)

(assert (=> b!171484 (=> (not res!81498) (not e!113175))))

(assert (=> b!171484 (= res!81498 (= (getValueByKey!185 (toList!1081 lt!85439) (_1!1610 (tuple2!3199 lt!85332 lt!85335))) (Some!190 (_2!1610 (tuple2!3199 lt!85332 lt!85335)))))))

(declare-fun b!171485 () Bool)

(assert (=> b!171485 (= e!113175 (contains!1141 (toList!1081 lt!85439) (tuple2!3199 lt!85332 lt!85335)))))

(assert (= (and d!52083 res!81499) b!171484))

(assert (= (and b!171484 res!81498) b!171485))

(declare-fun m!200233 () Bool)

(assert (=> d!52083 m!200233))

(declare-fun m!200235 () Bool)

(assert (=> d!52083 m!200235))

(declare-fun m!200237 () Bool)

(assert (=> d!52083 m!200237))

(declare-fun m!200239 () Bool)

(assert (=> d!52083 m!200239))

(declare-fun m!200241 () Bool)

(assert (=> b!171484 m!200241))

(declare-fun m!200243 () Bool)

(assert (=> b!171485 m!200243))

(assert (=> b!171276 d!52083))

(declare-fun d!52085 () Bool)

(declare-fun e!113176 () Bool)

(assert (=> d!52085 e!113176))

(declare-fun res!81500 () Bool)

(assert (=> d!52085 (=> res!81500 e!113176)))

(declare-fun lt!85443 () Bool)

(assert (=> d!52085 (= res!81500 (not lt!85443))))

(declare-fun lt!85445 () Bool)

(assert (=> d!52085 (= lt!85443 lt!85445)))

(declare-fun lt!85446 () Unit!5251)

(declare-fun e!113177 () Unit!5251)

(assert (=> d!52085 (= lt!85446 e!113177)))

(declare-fun c!30652 () Bool)

(assert (=> d!52085 (= c!30652 lt!85445)))

(assert (=> d!52085 (= lt!85445 (containsKey!188 (toList!1081 (+!243 lt!85331 (tuple2!3199 lt!85332 lt!85335))) lt!85333))))

(assert (=> d!52085 (= (contains!1139 (+!243 lt!85331 (tuple2!3199 lt!85332 lt!85335)) lt!85333) lt!85443)))

(declare-fun b!171486 () Bool)

(declare-fun lt!85444 () Unit!5251)

(assert (=> b!171486 (= e!113177 lt!85444)))

(assert (=> b!171486 (= lt!85444 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 (+!243 lt!85331 (tuple2!3199 lt!85332 lt!85335))) lt!85333))))

(assert (=> b!171486 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85331 (tuple2!3199 lt!85332 lt!85335))) lt!85333))))

(declare-fun b!171487 () Bool)

(declare-fun Unit!5272 () Unit!5251)

(assert (=> b!171487 (= e!113177 Unit!5272)))

(declare-fun b!171488 () Bool)

(assert (=> b!171488 (= e!113176 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85331 (tuple2!3199 lt!85332 lt!85335))) lt!85333)))))

(assert (= (and d!52085 c!30652) b!171486))

(assert (= (and d!52085 (not c!30652)) b!171487))

(assert (= (and d!52085 (not res!81500)) b!171488))

(declare-fun m!200245 () Bool)

(assert (=> d!52085 m!200245))

(declare-fun m!200247 () Bool)

(assert (=> b!171486 m!200247))

(declare-fun m!200249 () Bool)

(assert (=> b!171486 m!200249))

(assert (=> b!171486 m!200249))

(declare-fun m!200251 () Bool)

(assert (=> b!171486 m!200251))

(assert (=> b!171488 m!200249))

(assert (=> b!171488 m!200249))

(assert (=> b!171488 m!200251))

(assert (=> b!171276 d!52085))

(declare-fun d!52087 () Bool)

(declare-fun e!113178 () Bool)

(assert (=> d!52087 e!113178))

(declare-fun res!81502 () Bool)

(assert (=> d!52087 (=> (not res!81502) (not e!113178))))

(declare-fun lt!85447 () ListLongMap!2131)

(assert (=> d!52087 (= res!81502 (contains!1139 lt!85447 (_1!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!85448 () List!2176)

(assert (=> d!52087 (= lt!85447 (ListLongMap!2132 lt!85448))))

(declare-fun lt!85450 () Unit!5251)

(declare-fun lt!85449 () Unit!5251)

(assert (=> d!52087 (= lt!85450 lt!85449)))

(assert (=> d!52087 (= (getValueByKey!185 lt!85448 (_1!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!190 (_2!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52087 (= lt!85449 (lemmaContainsTupThenGetReturnValue!98 lt!85448 (_1!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52087 (= lt!85448 (insertStrictlySorted!101 (toList!1081 call!17436) (_1!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52087 (= (+!243 call!17436 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!85447)))

(declare-fun b!171489 () Bool)

(declare-fun res!81501 () Bool)

(assert (=> b!171489 (=> (not res!81501) (not e!113178))))

(assert (=> b!171489 (= res!81501 (= (getValueByKey!185 (toList!1081 lt!85447) (_1!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!190 (_2!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!171490 () Bool)

(assert (=> b!171490 (= e!113178 (contains!1141 (toList!1081 lt!85447) (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!52087 res!81502) b!171489))

(assert (= (and b!171489 res!81501) b!171490))

(declare-fun m!200253 () Bool)

(assert (=> d!52087 m!200253))

(declare-fun m!200255 () Bool)

(assert (=> d!52087 m!200255))

(declare-fun m!200257 () Bool)

(assert (=> d!52087 m!200257))

(declare-fun m!200259 () Bool)

(assert (=> d!52087 m!200259))

(declare-fun m!200261 () Bool)

(assert (=> b!171489 m!200261))

(declare-fun m!200263 () Bool)

(assert (=> b!171490 m!200263))

(assert (=> b!171276 d!52087))

(assert (=> b!171276 d!51877))

(declare-fun d!52089 () Bool)

(assert (=> d!52089 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!85451 () Unit!5251)

(assert (=> d!52089 (= lt!85451 (choose!931 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113179 () Bool)

(assert (=> d!52089 e!113179))

(declare-fun res!81503 () Bool)

(assert (=> d!52089 (=> (not res!81503) (not e!113179))))

(assert (=> d!52089 (= res!81503 (isStrictlySorted!318 (toList!1081 lt!85224)))))

(assert (=> d!52089 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) lt!85451)))

(declare-fun b!171491 () Bool)

(assert (=> b!171491 (= e!113179 (containsKey!188 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52089 res!81503) b!171491))

(assert (=> d!52089 m!199453))

(assert (=> d!52089 m!199835))

(assert (=> d!52089 m!199835))

(assert (=> d!52089 m!199881))

(assert (=> d!52089 m!199453))

(declare-fun m!200265 () Bool)

(assert (=> d!52089 m!200265))

(declare-fun m!200267 () Bool)

(assert (=> d!52089 m!200267))

(assert (=> b!171491 m!199453))

(assert (=> b!171491 m!199877))

(assert (=> b!171328 d!52089))

(declare-fun d!52091 () Bool)

(assert (=> d!52091 (= (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!440 (getValueByKey!185 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7095 () Bool)

(assert (= bs!7095 d!52091))

(assert (=> bs!7095 m!199835))

(declare-fun m!200269 () Bool)

(assert (=> bs!7095 m!200269))

(assert (=> b!171328 d!52091))

(declare-fun b!171493 () Bool)

(declare-fun e!113180 () Option!191)

(declare-fun e!113181 () Option!191)

(assert (=> b!171493 (= e!113180 e!113181)))

(declare-fun c!30654 () Bool)

(assert (=> b!171493 (= c!30654 (and ((_ is Cons!2172) (toList!1081 lt!85224)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85224))) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!171494 () Bool)

(assert (=> b!171494 (= e!113181 (getValueByKey!185 (t!6970 (toList!1081 lt!85224)) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52093 () Bool)

(declare-fun c!30653 () Bool)

(assert (=> d!52093 (= c!30653 (and ((_ is Cons!2172) (toList!1081 lt!85224)) (= (_1!1610 (h!2789 (toList!1081 lt!85224))) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52093 (= (getValueByKey!185 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) e!113180)))

(declare-fun b!171492 () Bool)

(assert (=> b!171492 (= e!113180 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85224)))))))

(declare-fun b!171495 () Bool)

(assert (=> b!171495 (= e!113181 None!189)))

(assert (= (and d!52093 c!30653) b!171492))

(assert (= (and d!52093 (not c!30653)) b!171493))

(assert (= (and b!171493 c!30654) b!171494))

(assert (= (and b!171493 (not c!30654)) b!171495))

(assert (=> b!171494 m!199453))

(declare-fun m!200271 () Bool)

(assert (=> b!171494 m!200271))

(assert (=> b!171328 d!52093))

(declare-fun b!171497 () Bool)

(declare-fun e!113182 () Option!191)

(declare-fun e!113183 () Option!191)

(assert (=> b!171497 (= e!113182 e!113183)))

(declare-fun c!30656 () Bool)

(assert (=> b!171497 (= c!30656 (and ((_ is Cons!2172) (toList!1081 lt!85377)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85377))) (_1!1610 (tuple2!3199 lt!85200 v!309))))))))

(declare-fun b!171498 () Bool)

(assert (=> b!171498 (= e!113183 (getValueByKey!185 (t!6970 (toList!1081 lt!85377)) (_1!1610 (tuple2!3199 lt!85200 v!309))))))

(declare-fun d!52095 () Bool)

(declare-fun c!30655 () Bool)

(assert (=> d!52095 (= c!30655 (and ((_ is Cons!2172) (toList!1081 lt!85377)) (= (_1!1610 (h!2789 (toList!1081 lt!85377))) (_1!1610 (tuple2!3199 lt!85200 v!309)))))))

(assert (=> d!52095 (= (getValueByKey!185 (toList!1081 lt!85377) (_1!1610 (tuple2!3199 lt!85200 v!309))) e!113182)))

(declare-fun b!171496 () Bool)

(assert (=> b!171496 (= e!113182 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85377)))))))

(declare-fun b!171499 () Bool)

(assert (=> b!171499 (= e!113183 None!189)))

(assert (= (and d!52095 c!30655) b!171496))

(assert (= (and d!52095 (not c!30655)) b!171497))

(assert (= (and b!171497 c!30656) b!171498))

(assert (= (and b!171497 (not c!30656)) b!171499))

(declare-fun m!200273 () Bool)

(assert (=> b!171498 m!200273))

(assert (=> b!171346 d!52095))

(declare-fun d!52097 () Bool)

(declare-fun e!113184 () Bool)

(assert (=> d!52097 e!113184))

(declare-fun res!81505 () Bool)

(assert (=> d!52097 (=> (not res!81505) (not e!113184))))

(declare-fun lt!85452 () ListLongMap!2131)

(assert (=> d!52097 (= res!81505 (contains!1139 lt!85452 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))))))

(declare-fun lt!85453 () List!2176)

(assert (=> d!52097 (= lt!85452 (ListLongMap!2132 lt!85453))))

(declare-fun lt!85455 () Unit!5251)

(declare-fun lt!85454 () Unit!5251)

(assert (=> d!52097 (= lt!85455 lt!85454)))

(assert (=> d!52097 (= (getValueByKey!185 lt!85453 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))) (Some!190 (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))))))

(assert (=> d!52097 (= lt!85454 (lemmaContainsTupThenGetReturnValue!98 lt!85453 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))))))

(assert (=> d!52097 (= lt!85453 (insertStrictlySorted!101 (toList!1081 call!17415) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))))))

(assert (=> d!52097 (= (+!243 call!17415 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))) lt!85452)))

(declare-fun b!171500 () Bool)

(declare-fun res!81504 () Bool)

(assert (=> b!171500 (=> (not res!81504) (not e!113184))))

(assert (=> b!171500 (= res!81504 (= (getValueByKey!185 (toList!1081 lt!85452) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))) (Some!190 (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))))))))

(declare-fun b!171501 () Bool)

(assert (=> b!171501 (= e!113184 (contains!1141 (toList!1081 lt!85452) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))))))

(assert (= (and d!52097 res!81505) b!171500))

(assert (= (and b!171500 res!81504) b!171501))

(declare-fun m!200275 () Bool)

(assert (=> d!52097 m!200275))

(declare-fun m!200277 () Bool)

(assert (=> d!52097 m!200277))

(declare-fun m!200279 () Bool)

(assert (=> d!52097 m!200279))

(declare-fun m!200281 () Bool)

(assert (=> d!52097 m!200281))

(declare-fun m!200283 () Bool)

(assert (=> b!171500 m!200283))

(declare-fun m!200285 () Bool)

(assert (=> b!171501 m!200285))

(assert (=> b!171175 d!52097))

(declare-fun b!171503 () Bool)

(declare-fun e!113185 () Option!191)

(declare-fun e!113186 () Option!191)

(assert (=> b!171503 (= e!113185 e!113186)))

(declare-fun c!30658 () Bool)

(assert (=> b!171503 (= c!30658 (and ((_ is Cons!2172) (toList!1081 lt!85410)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85410))) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171504 () Bool)

(assert (=> b!171504 (= e!113186 (getValueByKey!185 (t!6970 (toList!1081 lt!85410)) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun d!52099 () Bool)

(declare-fun c!30657 () Bool)

(assert (=> d!52099 (= c!30657 (and ((_ is Cons!2172) (toList!1081 lt!85410)) (= (_1!1610 (h!2789 (toList!1081 lt!85410))) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52099 (= (getValueByKey!185 (toList!1081 lt!85410) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) e!113185)))

(declare-fun b!171502 () Bool)

(assert (=> b!171502 (= e!113185 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85410)))))))

(declare-fun b!171505 () Bool)

(assert (=> b!171505 (= e!113186 None!189)))

(assert (= (and d!52099 c!30657) b!171502))

(assert (= (and d!52099 (not c!30657)) b!171503))

(assert (= (and b!171503 c!30658) b!171504))

(assert (= (and b!171503 (not c!30658)) b!171505))

(declare-fun m!200287 () Bool)

(assert (=> b!171504 m!200287))

(assert (=> b!171380 d!52099))

(declare-fun d!52101 () Bool)

(declare-fun lt!85456 () Bool)

(assert (=> d!52101 (= lt!85456 (select (content!148 (t!6970 (toList!1081 lt!85229))) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!113188 () Bool)

(assert (=> d!52101 (= lt!85456 e!113188)))

(declare-fun res!81506 () Bool)

(assert (=> d!52101 (=> (not res!81506) (not e!113188))))

(assert (=> d!52101 (= res!81506 ((_ is Cons!2172) (t!6970 (toList!1081 lt!85229))))))

(assert (=> d!52101 (= (contains!1141 (t!6970 (toList!1081 lt!85229)) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85456)))

(declare-fun b!171506 () Bool)

(declare-fun e!113187 () Bool)

(assert (=> b!171506 (= e!113188 e!113187)))

(declare-fun res!81507 () Bool)

(assert (=> b!171506 (=> res!81507 e!113187)))

(assert (=> b!171506 (= res!81507 (= (h!2789 (t!6970 (toList!1081 lt!85229))) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!171507 () Bool)

(assert (=> b!171507 (= e!113187 (contains!1141 (t!6970 (t!6970 (toList!1081 lt!85229))) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52101 res!81506) b!171506))

(assert (= (and b!171506 (not res!81507)) b!171507))

(declare-fun m!200289 () Bool)

(assert (=> d!52101 m!200289))

(declare-fun m!200291 () Bool)

(assert (=> d!52101 m!200291))

(declare-fun m!200293 () Bool)

(assert (=> b!171507 m!200293))

(assert (=> b!171327 d!52101))

(declare-fun d!52103 () Bool)

(declare-fun isEmpty!441 (List!2176) Bool)

(assert (=> d!52103 (= (isEmpty!439 lt!85330) (isEmpty!441 (toList!1081 lt!85330)))))

(declare-fun bs!7096 () Bool)

(assert (= bs!7096 d!52103))

(declare-fun m!200295 () Bool)

(assert (=> bs!7096 m!200295))

(assert (=> b!171279 d!52103))

(declare-fun d!52105 () Bool)

(assert (=> d!52105 (= (isDefined!137 (getValueByKey!185 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) (not (isEmpty!440 (getValueByKey!185 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun bs!7097 () Bool)

(assert (= bs!7097 d!52105))

(assert (=> bs!7097 m!199579))

(declare-fun m!200297 () Bool)

(assert (=> bs!7097 m!200297))

(assert (=> b!171207 d!52105))

(assert (=> b!171207 d!51975))

(declare-fun d!52107 () Bool)

(declare-fun lt!85457 () Bool)

(assert (=> d!52107 (= lt!85457 (select (content!148 lt!85230) (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!113190 () Bool)

(assert (=> d!52107 (= lt!85457 e!113190)))

(declare-fun res!81508 () Bool)

(assert (=> d!52107 (=> (not res!81508) (not e!113190))))

(assert (=> d!52107 (= res!81508 ((_ is Cons!2172) lt!85230))))

(assert (=> d!52107 (= (contains!1141 lt!85230 (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!85457)))

(declare-fun b!171508 () Bool)

(declare-fun e!113189 () Bool)

(assert (=> b!171508 (= e!113190 e!113189)))

(declare-fun res!81509 () Bool)

(assert (=> b!171508 (=> res!81509 e!113189)))

(assert (=> b!171508 (= res!81509 (= (h!2789 lt!85230) (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171509 () Bool)

(assert (=> b!171509 (= e!113189 (contains!1141 (t!6970 lt!85230) (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52107 res!81508) b!171508))

(assert (= (and b!171508 (not res!81509)) b!171509))

(declare-fun m!200299 () Bool)

(assert (=> d!52107 m!200299))

(declare-fun m!200301 () Bool)

(assert (=> d!52107 m!200301))

(declare-fun m!200303 () Bool)

(assert (=> b!171509 m!200303))

(assert (=> b!171225 d!52107))

(declare-fun d!52109 () Bool)

(assert (=> d!52109 (= ($colon$colon!96 e!113074 (ite c!30606 (h!2789 (toList!1081 (map!1846 thiss!1248))) (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))))) (Cons!2172 (ite c!30606 (h!2789 (toList!1081 (map!1846 thiss!1248))) (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))) e!113074))))

(assert (=> bm!17436 d!52109))

(declare-fun d!52111 () Bool)

(declare-fun e!113191 () Bool)

(assert (=> d!52111 e!113191))

(declare-fun res!81511 () Bool)

(assert (=> d!52111 (=> (not res!81511) (not e!113191))))

(declare-fun lt!85458 () ListLongMap!2131)

(assert (=> d!52111 (= res!81511 (contains!1139 lt!85458 (_1!1610 (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))))))))

(declare-fun lt!85459 () List!2176)

(assert (=> d!52111 (= lt!85458 (ListLongMap!2132 lt!85459))))

(declare-fun lt!85461 () Unit!5251)

(declare-fun lt!85460 () Unit!5251)

(assert (=> d!52111 (= lt!85461 lt!85460)))

(assert (=> d!52111 (= (getValueByKey!185 lt!85459 (_1!1610 (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))))) (Some!190 (_2!1610 (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))))))))

(assert (=> d!52111 (= lt!85460 (lemmaContainsTupThenGetReturnValue!98 lt!85459 (_1!1610 (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))) (_2!1610 (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))))))))

(assert (=> d!52111 (= lt!85459 (insertStrictlySorted!101 (toList!1081 (ite c!30566 call!17419 (ite c!30565 call!17421 call!17416))) (_1!1610 (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))) (_2!1610 (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))))))))

(assert (=> d!52111 (= (+!243 (ite c!30566 call!17419 (ite c!30565 call!17421 call!17416)) (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))) lt!85458)))

(declare-fun b!171510 () Bool)

(declare-fun res!81510 () Bool)

(assert (=> b!171510 (=> (not res!81510) (not e!113191))))

(assert (=> b!171510 (= res!81510 (= (getValueByKey!185 (toList!1081 lt!85458) (_1!1610 (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094))))) (Some!190 (_2!1610 (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))))))))

(declare-fun b!171511 () Bool)

(assert (=> b!171511 (= e!113191 (contains!1141 (toList!1081 lt!85458) (ite (or c!30566 c!30565) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 lt!85094)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 lt!85094)))))))

(assert (= (and d!52111 res!81511) b!171510))

(assert (= (and b!171510 res!81510) b!171511))

(declare-fun m!200305 () Bool)

(assert (=> d!52111 m!200305))

(declare-fun m!200307 () Bool)

(assert (=> d!52111 m!200307))

(declare-fun m!200309 () Bool)

(assert (=> d!52111 m!200309))

(declare-fun m!200311 () Bool)

(assert (=> d!52111 m!200311))

(declare-fun m!200313 () Bool)

(assert (=> b!171510 m!200313))

(declare-fun m!200315 () Bool)

(assert (=> b!171511 m!200315))

(assert (=> bm!17417 d!52111))

(declare-fun d!52113 () Bool)

(assert (=> d!52113 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85226) lt!85210)) (v!3915 (getValueByKey!185 (toList!1081 lt!85226) lt!85210)))))

(assert (=> d!51993 d!52113))

(declare-fun b!171513 () Bool)

(declare-fun e!113192 () Option!191)

(declare-fun e!113193 () Option!191)

(assert (=> b!171513 (= e!113192 e!113193)))

(declare-fun c!30660 () Bool)

(assert (=> b!171513 (= c!30660 (and ((_ is Cons!2172) (toList!1081 lt!85226)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85226))) lt!85210))))))

(declare-fun b!171514 () Bool)

(assert (=> b!171514 (= e!113193 (getValueByKey!185 (t!6970 (toList!1081 lt!85226)) lt!85210))))

(declare-fun d!52115 () Bool)

(declare-fun c!30659 () Bool)

(assert (=> d!52115 (= c!30659 (and ((_ is Cons!2172) (toList!1081 lt!85226)) (= (_1!1610 (h!2789 (toList!1081 lt!85226))) lt!85210)))))

(assert (=> d!52115 (= (getValueByKey!185 (toList!1081 lt!85226) lt!85210) e!113192)))

(declare-fun b!171512 () Bool)

(assert (=> b!171512 (= e!113192 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85226)))))))

(declare-fun b!171515 () Bool)

(assert (=> b!171515 (= e!113193 None!189)))

(assert (= (and d!52115 c!30659) b!171512))

(assert (= (and d!52115 (not c!30659)) b!171513))

(assert (= (and b!171513 c!30660) b!171514))

(assert (= (and b!171513 (not c!30660)) b!171515))

(declare-fun m!200317 () Bool)

(assert (=> b!171514 m!200317))

(assert (=> d!51993 d!52115))

(declare-fun b!171516 () Bool)

(declare-fun e!113195 () Bool)

(declare-fun e!113194 () Bool)

(assert (=> b!171516 (= e!113195 e!113194)))

(declare-fun c!30661 () Bool)

(assert (=> b!171516 (= c!30661 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52117 () Bool)

(declare-fun res!81513 () Bool)

(assert (=> d!52117 (=> res!81513 e!113195)))

(assert (=> d!52117 (= res!81513 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!52117 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5386 thiss!1248) (mask!8382 thiss!1248)) e!113195)))

(declare-fun b!171517 () Bool)

(declare-fun call!17451 () Bool)

(assert (=> b!171517 (= e!113194 call!17451)))

(declare-fun b!171518 () Bool)

(declare-fun e!113196 () Bool)

(assert (=> b!171518 (= e!113194 e!113196)))

(declare-fun lt!85464 () (_ BitVec 64))

(assert (=> b!171518 (= lt!85464 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!85462 () Unit!5251)

(assert (=> b!171518 (= lt!85462 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5386 thiss!1248) lt!85464 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!171518 (arrayContainsKey!0 (_keys!5386 thiss!1248) lt!85464 #b00000000000000000000000000000000)))

(declare-fun lt!85463 () Unit!5251)

(assert (=> b!171518 (= lt!85463 lt!85462)))

(declare-fun res!81512 () Bool)

(assert (=> b!171518 (= res!81512 (= (seekEntryOrOpen!0 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5386 thiss!1248) (mask!8382 thiss!1248)) (Found!528 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171518 (=> (not res!81512) (not e!113196))))

(declare-fun b!171519 () Bool)

(assert (=> b!171519 (= e!113196 call!17451)))

(declare-fun bm!17448 () Bool)

(assert (=> bm!17448 (= call!17451 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5386 thiss!1248) (mask!8382 thiss!1248)))))

(assert (= (and d!52117 (not res!81513)) b!171516))

(assert (= (and b!171516 c!30661) b!171518))

(assert (= (and b!171516 (not c!30661)) b!171517))

(assert (= (and b!171518 res!81512) b!171519))

(assert (= (or b!171519 b!171517) bm!17448))

(declare-fun m!200319 () Bool)

(assert (=> b!171516 m!200319))

(assert (=> b!171516 m!200319))

(declare-fun m!200321 () Bool)

(assert (=> b!171516 m!200321))

(assert (=> b!171518 m!200319))

(declare-fun m!200323 () Bool)

(assert (=> b!171518 m!200323))

(declare-fun m!200325 () Bool)

(assert (=> b!171518 m!200325))

(assert (=> b!171518 m!200319))

(declare-fun m!200327 () Bool)

(assert (=> b!171518 m!200327))

(declare-fun m!200329 () Bool)

(assert (=> bm!17448 m!200329))

(assert (=> bm!17431 d!52117))

(declare-fun d!52119 () Bool)

(assert (=> d!52119 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85465 () Unit!5251)

(assert (=> d!52119 (= lt!85465 (choose!931 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113197 () Bool)

(assert (=> d!52119 e!113197))

(declare-fun res!81514 () Bool)

(assert (=> d!52119 (=> (not res!81514) (not e!113197))))

(assert (=> d!52119 (= res!81514 (isStrictlySorted!318 (toList!1081 lt!85199)))))

(assert (=> d!52119 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000) lt!85465)))

(declare-fun b!171520 () Bool)

(assert (=> b!171520 (= e!113197 (containsKey!188 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52119 res!81514) b!171520))

(assert (=> d!52119 m!199723))

(assert (=> d!52119 m!199723))

(assert (=> d!52119 m!199725))

(declare-fun m!200331 () Bool)

(assert (=> d!52119 m!200331))

(declare-fun m!200333 () Bool)

(assert (=> d!52119 m!200333))

(assert (=> b!171520 m!199719))

(assert (=> b!171187 d!52119))

(declare-fun d!52121 () Bool)

(assert (=> d!52121 (= (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!440 (getValueByKey!185 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7098 () Bool)

(assert (= bs!7098 d!52121))

(assert (=> bs!7098 m!199723))

(declare-fun m!200335 () Bool)

(assert (=> bs!7098 m!200335))

(assert (=> b!171187 d!52121))

(declare-fun b!171522 () Bool)

(declare-fun e!113198 () Option!191)

(declare-fun e!113199 () Option!191)

(assert (=> b!171522 (= e!113198 e!113199)))

(declare-fun c!30663 () Bool)

(assert (=> b!171522 (= c!30663 (and ((_ is Cons!2172) (toList!1081 lt!85199)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85199))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171523 () Bool)

(assert (=> b!171523 (= e!113199 (getValueByKey!185 (t!6970 (toList!1081 lt!85199)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!52123 () Bool)

(declare-fun c!30662 () Bool)

(assert (=> d!52123 (= c!30662 (and ((_ is Cons!2172) (toList!1081 lt!85199)) (= (_1!1610 (h!2789 (toList!1081 lt!85199))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52123 (= (getValueByKey!185 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000) e!113198)))

(declare-fun b!171521 () Bool)

(assert (=> b!171521 (= e!113198 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85199)))))))

(declare-fun b!171524 () Bool)

(assert (=> b!171524 (= e!113199 None!189)))

(assert (= (and d!52123 c!30662) b!171521))

(assert (= (and d!52123 (not c!30662)) b!171522))

(assert (= (and b!171522 c!30663) b!171523))

(assert (= (and b!171522 (not c!30663)) b!171524))

(declare-fun m!200337 () Bool)

(assert (=> b!171523 m!200337))

(assert (=> b!171187 d!52123))

(declare-fun lt!85466 () Bool)

(declare-fun d!52125 () Bool)

(assert (=> d!52125 (= lt!85466 (select (content!148 lt!85123) (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun e!113201 () Bool)

(assert (=> d!52125 (= lt!85466 e!113201)))

(declare-fun res!81515 () Bool)

(assert (=> d!52125 (=> (not res!81515) (not e!113201))))

(assert (=> d!52125 (= res!81515 ((_ is Cons!2172) lt!85123))))

(assert (=> d!52125 (= (contains!1141 lt!85123 (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))) lt!85466)))

(declare-fun b!171525 () Bool)

(declare-fun e!113200 () Bool)

(assert (=> b!171525 (= e!113201 e!113200)))

(declare-fun res!81516 () Bool)

(assert (=> b!171525 (=> res!81516 e!113200)))

(assert (=> b!171525 (= res!81516 (= (h!2789 lt!85123) (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun b!171526 () Bool)

(assert (=> b!171526 (= e!113200 (contains!1141 (t!6970 lt!85123) (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))))))

(assert (= (and d!52125 res!81515) b!171525))

(assert (= (and b!171525 (not res!81516)) b!171526))

(declare-fun m!200339 () Bool)

(assert (=> d!52125 m!200339))

(declare-fun m!200341 () Bool)

(assert (=> d!52125 m!200341))

(declare-fun m!200343 () Bool)

(assert (=> b!171526 m!200343))

(assert (=> b!171310 d!52125))

(declare-fun d!52127 () Bool)

(declare-fun e!113202 () Bool)

(assert (=> d!52127 e!113202))

(declare-fun res!81517 () Bool)

(assert (=> d!52127 (=> res!81517 e!113202)))

(declare-fun lt!85467 () Bool)

(assert (=> d!52127 (= res!81517 (not lt!85467))))

(declare-fun lt!85469 () Bool)

(assert (=> d!52127 (= lt!85467 lt!85469)))

(declare-fun lt!85470 () Unit!5251)

(declare-fun e!113203 () Unit!5251)

(assert (=> d!52127 (= lt!85470 e!113203)))

(declare-fun c!30664 () Bool)

(assert (=> d!52127 (= c!30664 lt!85469)))

(assert (=> d!52127 (= lt!85469 (containsKey!188 (toList!1081 lt!85317) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!52127 (= (contains!1139 lt!85317 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85467)))

(declare-fun b!171527 () Bool)

(declare-fun lt!85468 () Unit!5251)

(assert (=> b!171527 (= e!113203 lt!85468)))

(assert (=> b!171527 (= lt!85468 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85317) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> b!171527 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85317) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171528 () Bool)

(declare-fun Unit!5273 () Unit!5251)

(assert (=> b!171528 (= e!113203 Unit!5273)))

(declare-fun b!171529 () Bool)

(assert (=> b!171529 (= e!113202 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85317) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52127 c!30664) b!171527))

(assert (= (and d!52127 (not c!30664)) b!171528))

(assert (= (and d!52127 (not res!81517)) b!171529))

(declare-fun m!200345 () Bool)

(assert (=> d!52127 m!200345))

(declare-fun m!200347 () Bool)

(assert (=> b!171527 m!200347))

(assert (=> b!171527 m!199769))

(assert (=> b!171527 m!199769))

(declare-fun m!200349 () Bool)

(assert (=> b!171527 m!200349))

(assert (=> b!171529 m!199769))

(assert (=> b!171529 m!199769))

(assert (=> b!171529 m!200349))

(assert (=> d!51907 d!52127))

(declare-fun b!171531 () Bool)

(declare-fun e!113204 () Option!191)

(declare-fun e!113205 () Option!191)

(assert (=> b!171531 (= e!113204 e!113205)))

(declare-fun c!30666 () Bool)

(assert (=> b!171531 (= c!30666 (and ((_ is Cons!2172) lt!85318) (not (= (_1!1610 (h!2789 lt!85318)) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171532 () Bool)

(assert (=> b!171532 (= e!113205 (getValueByKey!185 (t!6970 lt!85318) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun d!52129 () Bool)

(declare-fun c!30665 () Bool)

(assert (=> d!52129 (= c!30665 (and ((_ is Cons!2172) lt!85318) (= (_1!1610 (h!2789 lt!85318)) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52129 (= (getValueByKey!185 lt!85318 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) e!113204)))

(declare-fun b!171530 () Bool)

(assert (=> b!171530 (= e!113204 (Some!190 (_2!1610 (h!2789 lt!85318))))))

(declare-fun b!171533 () Bool)

(assert (=> b!171533 (= e!113205 None!189)))

(assert (= (and d!52129 c!30665) b!171530))

(assert (= (and d!52129 (not c!30665)) b!171531))

(assert (= (and b!171531 c!30666) b!171532))

(assert (= (and b!171531 (not c!30666)) b!171533))

(declare-fun m!200351 () Bool)

(assert (=> b!171532 m!200351))

(assert (=> d!51907 d!52129))

(declare-fun d!52131 () Bool)

(assert (=> d!52131 (= (getValueByKey!185 lt!85318 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85471 () Unit!5251)

(assert (=> d!52131 (= lt!85471 (choose!930 lt!85318 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun e!113206 () Bool)

(assert (=> d!52131 e!113206))

(declare-fun res!81518 () Bool)

(assert (=> d!52131 (=> (not res!81518) (not e!113206))))

(assert (=> d!52131 (= res!81518 (isStrictlySorted!318 lt!85318))))

(assert (=> d!52131 (= (lemmaContainsTupThenGetReturnValue!98 lt!85318 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85471)))

(declare-fun b!171534 () Bool)

(declare-fun res!81519 () Bool)

(assert (=> b!171534 (=> (not res!81519) (not e!113206))))

(assert (=> b!171534 (= res!81519 (containsKey!188 lt!85318 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171535 () Bool)

(assert (=> b!171535 (= e!113206 (contains!1141 lt!85318 (tuple2!3199 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52131 res!81518) b!171534))

(assert (= (and b!171534 res!81519) b!171535))

(assert (=> d!52131 m!199763))

(declare-fun m!200353 () Bool)

(assert (=> d!52131 m!200353))

(declare-fun m!200355 () Bool)

(assert (=> d!52131 m!200355))

(declare-fun m!200357 () Bool)

(assert (=> b!171534 m!200357))

(declare-fun m!200359 () Bool)

(assert (=> b!171535 m!200359))

(assert (=> d!51907 d!52131))

(declare-fun b!171536 () Bool)

(declare-fun e!113209 () List!2176)

(declare-fun call!17454 () List!2176)

(assert (=> b!171536 (= e!113209 call!17454)))

(declare-fun b!171537 () Bool)

(assert (=> b!171537 (= e!113209 call!17454)))

(declare-fun b!171538 () Bool)

(declare-fun c!30667 () Bool)

(assert (=> b!171538 (= c!30667 (and ((_ is Cons!2172) (toList!1081 call!17399)) (bvsgt (_1!1610 (h!2789 (toList!1081 call!17399))) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun e!113208 () List!2176)

(assert (=> b!171538 (= e!113208 e!113209)))

(declare-fun d!52133 () Bool)

(declare-fun e!113207 () Bool)

(assert (=> d!52133 e!113207))

(declare-fun res!81521 () Bool)

(assert (=> d!52133 (=> (not res!81521) (not e!113207))))

(declare-fun lt!85472 () List!2176)

(assert (=> d!52133 (= res!81521 (isStrictlySorted!318 lt!85472))))

(declare-fun e!113211 () List!2176)

(assert (=> d!52133 (= lt!85472 e!113211)))

(declare-fun c!30668 () Bool)

(assert (=> d!52133 (= c!30668 (and ((_ is Cons!2172) (toList!1081 call!17399)) (bvslt (_1!1610 (h!2789 (toList!1081 call!17399))) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52133 (isStrictlySorted!318 (toList!1081 call!17399))))

(assert (=> d!52133 (= (insertStrictlySorted!101 (toList!1081 call!17399) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85472)))

(declare-fun b!171539 () Bool)

(assert (=> b!171539 (= e!113211 e!113208)))

(declare-fun c!30669 () Bool)

(assert (=> b!171539 (= c!30669 (and ((_ is Cons!2172) (toList!1081 call!17399)) (= (_1!1610 (h!2789 (toList!1081 call!17399))) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171540 () Bool)

(assert (=> b!171540 (= e!113207 (contains!1141 lt!85472 (tuple2!3199 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171541 () Bool)

(declare-fun call!17452 () List!2176)

(assert (=> b!171541 (= e!113208 call!17452)))

(declare-fun e!113210 () List!2176)

(declare-fun b!171542 () Bool)

(assert (=> b!171542 (= e!113210 (ite c!30669 (t!6970 (toList!1081 call!17399)) (ite c!30667 (Cons!2172 (h!2789 (toList!1081 call!17399)) (t!6970 (toList!1081 call!17399))) Nil!2173)))))

(declare-fun bm!17449 () Bool)

(declare-fun call!17453 () List!2176)

(assert (=> bm!17449 (= call!17452 call!17453)))

(declare-fun b!171543 () Bool)

(assert (=> b!171543 (= e!113211 call!17453)))

(declare-fun b!171544 () Bool)

(assert (=> b!171544 (= e!113210 (insertStrictlySorted!101 (t!6970 (toList!1081 call!17399)) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17450 () Bool)

(assert (=> bm!17450 (= call!17454 call!17452)))

(declare-fun b!171545 () Bool)

(declare-fun res!81520 () Bool)

(assert (=> b!171545 (=> (not res!81520) (not e!113207))))

(assert (=> b!171545 (= res!81520 (containsKey!188 lt!85472 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17451 () Bool)

(assert (=> bm!17451 (= call!17453 ($colon$colon!96 e!113210 (ite c!30668 (h!2789 (toList!1081 call!17399)) (tuple2!3199 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30670 () Bool)

(assert (=> bm!17451 (= c!30670 c!30668)))

(assert (= (and d!52133 c!30668) b!171543))

(assert (= (and d!52133 (not c!30668)) b!171539))

(assert (= (and b!171539 c!30669) b!171541))

(assert (= (and b!171539 (not c!30669)) b!171538))

(assert (= (and b!171538 c!30667) b!171536))

(assert (= (and b!171538 (not c!30667)) b!171537))

(assert (= (or b!171536 b!171537) bm!17450))

(assert (= (or b!171541 bm!17450) bm!17449))

(assert (= (or b!171543 bm!17449) bm!17451))

(assert (= (and bm!17451 c!30670) b!171544))

(assert (= (and bm!17451 (not c!30670)) b!171542))

(assert (= (and d!52133 res!81521) b!171545))

(assert (= (and b!171545 res!81520) b!171540))

(declare-fun m!200361 () Bool)

(assert (=> b!171544 m!200361))

(declare-fun m!200363 () Bool)

(assert (=> b!171545 m!200363))

(declare-fun m!200365 () Bool)

(assert (=> d!52133 m!200365))

(declare-fun m!200367 () Bool)

(assert (=> d!52133 m!200367))

(declare-fun m!200369 () Bool)

(assert (=> bm!17451 m!200369))

(declare-fun m!200371 () Bool)

(assert (=> b!171540 m!200371))

(assert (=> d!51907 d!52133))

(declare-fun d!52135 () Bool)

(declare-fun e!113212 () Bool)

(assert (=> d!52135 e!113212))

(declare-fun res!81522 () Bool)

(assert (=> d!52135 (=> res!81522 e!113212)))

(declare-fun lt!85473 () Bool)

(assert (=> d!52135 (= res!81522 (not lt!85473))))

(declare-fun lt!85475 () Bool)

(assert (=> d!52135 (= lt!85473 lt!85475)))

(declare-fun lt!85476 () Unit!5251)

(declare-fun e!113213 () Unit!5251)

(assert (=> d!52135 (= lt!85476 e!113213)))

(declare-fun c!30671 () Bool)

(assert (=> d!52135 (= c!30671 lt!85475)))

(assert (=> d!52135 (= lt!85475 (containsKey!188 (toList!1081 lt!85290) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52135 (= (contains!1139 lt!85290 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85473)))

(declare-fun b!171546 () Bool)

(declare-fun lt!85474 () Unit!5251)

(assert (=> b!171546 (= e!113213 lt!85474)))

(assert (=> b!171546 (= lt!85474 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85290) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171546 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85290) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171547 () Bool)

(declare-fun Unit!5274 () Unit!5251)

(assert (=> b!171547 (= e!113213 Unit!5274)))

(declare-fun b!171548 () Bool)

(assert (=> b!171548 (= e!113212 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52135 c!30671) b!171546))

(assert (= (and d!52135 (not c!30671)) b!171547))

(assert (= (and d!52135 (not res!81522)) b!171548))

(declare-fun m!200373 () Bool)

(assert (=> d!52135 m!200373))

(declare-fun m!200375 () Bool)

(assert (=> b!171546 m!200375))

(declare-fun m!200377 () Bool)

(assert (=> b!171546 m!200377))

(assert (=> b!171546 m!200377))

(declare-fun m!200379 () Bool)

(assert (=> b!171546 m!200379))

(assert (=> b!171548 m!200377))

(assert (=> b!171548 m!200377))

(assert (=> b!171548 m!200379))

(assert (=> bm!17418 d!52135))

(declare-fun b!171549 () Bool)

(declare-fun e!113219 () Bool)

(declare-fun e!113217 () Bool)

(assert (=> b!171549 (= e!113219 e!113217)))

(declare-fun c!30674 () Bool)

(assert (=> b!171549 (= c!30674 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171550 () Bool)

(declare-fun lt!85478 () ListLongMap!2131)

(assert (=> b!171550 (= e!113217 (= lt!85478 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248))))))

(declare-fun b!171551 () Bool)

(declare-fun e!113214 () ListLongMap!2131)

(declare-fun call!17455 () ListLongMap!2131)

(assert (=> b!171551 (= e!113214 call!17455)))

(declare-fun d!52137 () Bool)

(declare-fun e!113220 () Bool)

(assert (=> d!52137 e!113220))

(declare-fun res!81523 () Bool)

(assert (=> d!52137 (=> (not res!81523) (not e!113220))))

(assert (=> d!52137 (= res!81523 (not (contains!1139 lt!85478 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!113216 () ListLongMap!2131)

(assert (=> d!52137 (= lt!85478 e!113216)))

(declare-fun c!30673 () Bool)

(assert (=> d!52137 (= c!30673 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!52137 (validMask!0 (mask!8382 thiss!1248))))

(assert (=> d!52137 (= (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)) lt!85478)))

(declare-fun b!171552 () Bool)

(assert (=> b!171552 (= e!113220 e!113219)))

(declare-fun c!30672 () Bool)

(declare-fun e!113215 () Bool)

(assert (=> b!171552 (= c!30672 e!113215)))

(declare-fun res!81526 () Bool)

(assert (=> b!171552 (=> (not res!81526) (not e!113215))))

(assert (=> b!171552 (= res!81526 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171553 () Bool)

(assert (=> b!171553 (= e!113215 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171553 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!171554 () Bool)

(declare-fun res!81524 () Bool)

(assert (=> b!171554 (=> (not res!81524) (not e!113220))))

(assert (=> b!171554 (= res!81524 (not (contains!1139 lt!85478 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171555 () Bool)

(assert (=> b!171555 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> b!171555 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3674 (_values!3537 thiss!1248))))))

(declare-fun e!113218 () Bool)

(assert (=> b!171555 (= e!113218 (= (apply!129 lt!85478 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171556 () Bool)

(assert (=> b!171556 (= e!113216 (ListLongMap!2132 Nil!2173))))

(declare-fun b!171557 () Bool)

(declare-fun lt!85477 () Unit!5251)

(declare-fun lt!85482 () Unit!5251)

(assert (=> b!171557 (= lt!85477 lt!85482)))

(declare-fun lt!85481 () (_ BitVec 64))

(declare-fun lt!85483 () V!4985)

(declare-fun lt!85480 () (_ BitVec 64))

(declare-fun lt!85479 () ListLongMap!2131)

(assert (=> b!171557 (not (contains!1139 (+!243 lt!85479 (tuple2!3199 lt!85480 lt!85483)) lt!85481))))

(assert (=> b!171557 (= lt!85482 (addStillNotContains!73 lt!85479 lt!85480 lt!85483 lt!85481))))

(assert (=> b!171557 (= lt!85481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171557 (= lt!85483 (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171557 (= lt!85480 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!171557 (= lt!85479 call!17455)))

(assert (=> b!171557 (= e!113214 (+!243 call!17455 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!171558 () Bool)

(assert (=> b!171558 (= e!113219 e!113218)))

(assert (=> b!171558 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun res!81525 () Bool)

(assert (=> b!171558 (= res!81525 (contains!1139 lt!85478 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171558 (=> (not res!81525) (not e!113218))))

(declare-fun bm!17452 () Bool)

(assert (=> bm!17452 (= call!17455 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (bvor (extraKeys!3295 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)))))

(declare-fun b!171559 () Bool)

(assert (=> b!171559 (= e!113216 e!113214)))

(declare-fun c!30675 () Bool)

(assert (=> b!171559 (= c!30675 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171560 () Bool)

(assert (=> b!171560 (= e!113217 (isEmpty!439 lt!85478))))

(assert (= (and d!52137 c!30673) b!171556))

(assert (= (and d!52137 (not c!30673)) b!171559))

(assert (= (and b!171559 c!30675) b!171557))

(assert (= (and b!171559 (not c!30675)) b!171551))

(assert (= (or b!171557 b!171551) bm!17452))

(assert (= (and d!52137 res!81523) b!171554))

(assert (= (and b!171554 res!81524) b!171552))

(assert (= (and b!171552 res!81526) b!171553))

(assert (= (and b!171552 c!30672) b!171558))

(assert (= (and b!171552 (not c!30672)) b!171549))

(assert (= (and b!171558 res!81525) b!171555))

(assert (= (and b!171549 c!30674) b!171550))

(assert (= (and b!171549 (not c!30674)) b!171560))

(declare-fun b_lambda!6935 () Bool)

(assert (=> (not b_lambda!6935) (not b!171555)))

(assert (=> b!171555 t!6973))

(declare-fun b_and!10679 () Bool)

(assert (= b_and!10677 (and (=> t!6973 result!4553) b_and!10679)))

(declare-fun b_lambda!6937 () Bool)

(assert (=> (not b_lambda!6937) (not b!171557)))

(assert (=> b!171557 t!6973))

(declare-fun b_and!10681 () Bool)

(assert (= b_and!10679 (and (=> t!6973 result!4553) b_and!10681)))

(assert (=> b!171558 m!200319))

(assert (=> b!171558 m!200319))

(declare-fun m!200381 () Bool)

(assert (=> b!171558 m!200381))

(assert (=> b!171559 m!200319))

(assert (=> b!171559 m!200319))

(assert (=> b!171559 m!200321))

(declare-fun m!200383 () Bool)

(assert (=> d!52137 m!200383))

(assert (=> d!52137 m!199509))

(declare-fun m!200385 () Bool)

(assert (=> b!171557 m!200385))

(declare-fun m!200387 () Bool)

(assert (=> b!171557 m!200387))

(declare-fun m!200389 () Bool)

(assert (=> b!171557 m!200389))

(declare-fun m!200391 () Bool)

(assert (=> b!171557 m!200391))

(declare-fun m!200393 () Bool)

(assert (=> b!171557 m!200393))

(assert (=> b!171557 m!199501))

(assert (=> b!171557 m!200319))

(assert (=> b!171557 m!200387))

(assert (=> b!171557 m!200393))

(assert (=> b!171557 m!199501))

(declare-fun m!200395 () Bool)

(assert (=> b!171557 m!200395))

(assert (=> b!171553 m!200319))

(assert (=> b!171553 m!200319))

(assert (=> b!171553 m!200321))

(declare-fun m!200397 () Bool)

(assert (=> b!171550 m!200397))

(assert (=> bm!17452 m!200397))

(assert (=> b!171555 m!200319))

(declare-fun m!200399 () Bool)

(assert (=> b!171555 m!200399))

(assert (=> b!171555 m!200393))

(assert (=> b!171555 m!200393))

(assert (=> b!171555 m!199501))

(assert (=> b!171555 m!200395))

(assert (=> b!171555 m!199501))

(assert (=> b!171555 m!200319))

(declare-fun m!200401 () Bool)

(assert (=> b!171560 m!200401))

(declare-fun m!200403 () Bool)

(assert (=> b!171554 m!200403))

(assert (=> bm!17405 d!52137))

(declare-fun d!52139 () Bool)

(assert (=> d!52139 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85190) lt!85197)) (v!3915 (getValueByKey!185 (toList!1081 lt!85190) lt!85197)))))

(assert (=> d!51965 d!52139))

(declare-fun b!171562 () Bool)

(declare-fun e!113221 () Option!191)

(declare-fun e!113222 () Option!191)

(assert (=> b!171562 (= e!113221 e!113222)))

(declare-fun c!30677 () Bool)

(assert (=> b!171562 (= c!30677 (and ((_ is Cons!2172) (toList!1081 lt!85190)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85190))) lt!85197))))))

(declare-fun b!171563 () Bool)

(assert (=> b!171563 (= e!113222 (getValueByKey!185 (t!6970 (toList!1081 lt!85190)) lt!85197))))

(declare-fun d!52141 () Bool)

(declare-fun c!30676 () Bool)

(assert (=> d!52141 (= c!30676 (and ((_ is Cons!2172) (toList!1081 lt!85190)) (= (_1!1610 (h!2789 (toList!1081 lt!85190))) lt!85197)))))

(assert (=> d!52141 (= (getValueByKey!185 (toList!1081 lt!85190) lt!85197) e!113221)))

(declare-fun b!171561 () Bool)

(assert (=> b!171561 (= e!113221 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85190)))))))

(declare-fun b!171564 () Bool)

(assert (=> b!171564 (= e!113222 None!189)))

(assert (= (and d!52141 c!30676) b!171561))

(assert (= (and d!52141 (not c!30676)) b!171562))

(assert (= (and b!171562 c!30677) b!171563))

(assert (= (and b!171562 (not c!30677)) b!171564))

(declare-fun m!200405 () Bool)

(assert (=> b!171563 m!200405))

(assert (=> d!51965 d!52141))

(declare-fun d!52143 () Bool)

(assert (=> d!52143 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3915 (getValueByKey!185 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52017 d!52143))

(declare-fun b!171566 () Bool)

(declare-fun e!113223 () Option!191)

(declare-fun e!113224 () Option!191)

(assert (=> b!171566 (= e!113223 e!113224)))

(declare-fun c!30679 () Bool)

(assert (=> b!171566 (= c!30679 (and ((_ is Cons!2172) (toList!1081 lt!85199)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85199))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171567 () Bool)

(assert (=> b!171567 (= e!113224 (getValueByKey!185 (t!6970 (toList!1081 lt!85199)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!52145 () Bool)

(declare-fun c!30678 () Bool)

(assert (=> d!52145 (= c!30678 (and ((_ is Cons!2172) (toList!1081 lt!85199)) (= (_1!1610 (h!2789 (toList!1081 lt!85199))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52145 (= (getValueByKey!185 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000) e!113223)))

(declare-fun b!171565 () Bool)

(assert (=> b!171565 (= e!113223 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85199)))))))

(declare-fun b!171568 () Bool)

(assert (=> b!171568 (= e!113224 None!189)))

(assert (= (and d!52145 c!30678) b!171565))

(assert (= (and d!52145 (not c!30678)) b!171566))

(assert (= (and b!171566 c!30679) b!171567))

(assert (= (and b!171566 (not c!30679)) b!171568))

(declare-fun m!200407 () Bool)

(assert (=> b!171567 m!200407))

(assert (=> d!52017 d!52145))

(declare-fun d!52147 () Bool)

(assert (=> d!52147 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85484 () Unit!5251)

(assert (=> d!52147 (= lt!85484 (choose!931 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113225 () Bool)

(assert (=> d!52147 e!113225))

(declare-fun res!81527 () Bool)

(assert (=> d!52147 (=> (not res!81527) (not e!113225))))

(assert (=> d!52147 (= res!81527 (isStrictlySorted!318 (toList!1081 lt!85199)))))

(assert (=> d!52147 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000) lt!85484)))

(declare-fun b!171569 () Bool)

(assert (=> b!171569 (= e!113225 (containsKey!188 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52147 res!81527) b!171569))

(assert (=> d!52147 m!199609))

(assert (=> d!52147 m!199609))

(assert (=> d!52147 m!199611))

(declare-fun m!200409 () Bool)

(assert (=> d!52147 m!200409))

(assert (=> d!52147 m!200333))

(assert (=> b!171569 m!199605))

(assert (=> b!171122 d!52147))

(declare-fun d!52149 () Bool)

(assert (=> d!52149 (= (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!440 (getValueByKey!185 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7099 () Bool)

(assert (= bs!7099 d!52149))

(assert (=> bs!7099 m!199609))

(declare-fun m!200411 () Bool)

(assert (=> bs!7099 m!200411))

(assert (=> b!171122 d!52149))

(assert (=> b!171122 d!52145))

(assert (=> b!171324 d!51889))

(declare-fun d!52151 () Bool)

(assert (=> d!52151 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85485 () Unit!5251)

(assert (=> d!52151 (= lt!85485 (choose!931 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113226 () Bool)

(assert (=> d!52151 e!113226))

(declare-fun res!81528 () Bool)

(assert (=> d!52151 (=> (not res!81528) (not e!113226))))

(assert (=> d!52151 (= res!81528 (isStrictlySorted!318 (toList!1081 lt!85224)))))

(assert (=> d!52151 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000) lt!85485)))

(declare-fun b!171570 () Bool)

(assert (=> b!171570 (= e!113226 (containsKey!188 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52151 res!81528) b!171570))

(assert (=> d!52151 m!199823))

(assert (=> d!52151 m!199823))

(assert (=> d!52151 m!199985))

(declare-fun m!200413 () Bool)

(assert (=> d!52151 m!200413))

(assert (=> d!52151 m!200267))

(assert (=> b!171570 m!199981))

(assert (=> b!171353 d!52151))

(declare-fun d!52153 () Bool)

(assert (=> d!52153 (= (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!440 (getValueByKey!185 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7100 () Bool)

(assert (= bs!7100 d!52153))

(assert (=> bs!7100 m!199823))

(declare-fun m!200415 () Bool)

(assert (=> bs!7100 m!200415))

(assert (=> b!171353 d!52153))

(declare-fun b!171572 () Bool)

(declare-fun e!113227 () Option!191)

(declare-fun e!113228 () Option!191)

(assert (=> b!171572 (= e!113227 e!113228)))

(declare-fun c!30681 () Bool)

(assert (=> b!171572 (= c!30681 (and ((_ is Cons!2172) (toList!1081 lt!85224)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85224))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171573 () Bool)

(assert (=> b!171573 (= e!113228 (getValueByKey!185 (t!6970 (toList!1081 lt!85224)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!52155 () Bool)

(declare-fun c!30680 () Bool)

(assert (=> d!52155 (= c!30680 (and ((_ is Cons!2172) (toList!1081 lt!85224)) (= (_1!1610 (h!2789 (toList!1081 lt!85224))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52155 (= (getValueByKey!185 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000) e!113227)))

(declare-fun b!171571 () Bool)

(assert (=> b!171571 (= e!113227 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85224)))))))

(declare-fun b!171574 () Bool)

(assert (=> b!171574 (= e!113228 None!189)))

(assert (= (and d!52155 c!30680) b!171571))

(assert (= (and d!52155 (not c!30680)) b!171572))

(assert (= (and b!171572 c!30681) b!171573))

(assert (= (and b!171572 (not c!30681)) b!171574))

(declare-fun m!200417 () Bool)

(assert (=> b!171573 m!200417))

(assert (=> b!171353 d!52155))

(declare-fun d!52157 () Bool)

(declare-fun e!113229 () Bool)

(assert (=> d!52157 e!113229))

(declare-fun res!81530 () Bool)

(assert (=> d!52157 (=> (not res!81530) (not e!113229))))

(declare-fun lt!85486 () ListLongMap!2131)

(assert (=> d!52157 (= res!81530 (contains!1139 lt!85486 (_1!1610 (tuple2!3199 lt!85280 (minValue!3397 lt!85094)))))))

(declare-fun lt!85487 () List!2176)

(assert (=> d!52157 (= lt!85486 (ListLongMap!2132 lt!85487))))

(declare-fun lt!85489 () Unit!5251)

(declare-fun lt!85488 () Unit!5251)

(assert (=> d!52157 (= lt!85489 lt!85488)))

(assert (=> d!52157 (= (getValueByKey!185 lt!85487 (_1!1610 (tuple2!3199 lt!85280 (minValue!3397 lt!85094)))) (Some!190 (_2!1610 (tuple2!3199 lt!85280 (minValue!3397 lt!85094)))))))

(assert (=> d!52157 (= lt!85488 (lemmaContainsTupThenGetReturnValue!98 lt!85487 (_1!1610 (tuple2!3199 lt!85280 (minValue!3397 lt!85094))) (_2!1610 (tuple2!3199 lt!85280 (minValue!3397 lt!85094)))))))

(assert (=> d!52157 (= lt!85487 (insertStrictlySorted!101 (toList!1081 lt!85281) (_1!1610 (tuple2!3199 lt!85280 (minValue!3397 lt!85094))) (_2!1610 (tuple2!3199 lt!85280 (minValue!3397 lt!85094)))))))

(assert (=> d!52157 (= (+!243 lt!85281 (tuple2!3199 lt!85280 (minValue!3397 lt!85094))) lt!85486)))

(declare-fun b!171575 () Bool)

(declare-fun res!81529 () Bool)

(assert (=> b!171575 (=> (not res!81529) (not e!113229))))

(assert (=> b!171575 (= res!81529 (= (getValueByKey!185 (toList!1081 lt!85486) (_1!1610 (tuple2!3199 lt!85280 (minValue!3397 lt!85094)))) (Some!190 (_2!1610 (tuple2!3199 lt!85280 (minValue!3397 lt!85094))))))))

(declare-fun b!171576 () Bool)

(assert (=> b!171576 (= e!113229 (contains!1141 (toList!1081 lt!85486) (tuple2!3199 lt!85280 (minValue!3397 lt!85094))))))

(assert (= (and d!52157 res!81530) b!171575))

(assert (= (and b!171575 res!81529) b!171576))

(declare-fun m!200419 () Bool)

(assert (=> d!52157 m!200419))

(declare-fun m!200421 () Bool)

(assert (=> d!52157 m!200421))

(declare-fun m!200423 () Bool)

(assert (=> d!52157 m!200423))

(declare-fun m!200425 () Bool)

(assert (=> d!52157 m!200425))

(declare-fun m!200427 () Bool)

(assert (=> b!171575 m!200427))

(declare-fun m!200429 () Bool)

(assert (=> b!171576 m!200429))

(assert (=> b!171170 d!52157))

(declare-fun d!52159 () Bool)

(assert (=> d!52159 (= (apply!129 (+!243 lt!85293 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094))) lt!85282) (apply!129 lt!85293 lt!85282))))

(declare-fun lt!85490 () Unit!5251)

(assert (=> d!52159 (= lt!85490 (choose!932 lt!85293 lt!85291 (zeroValue!3397 lt!85094) lt!85282))))

(declare-fun e!113230 () Bool)

(assert (=> d!52159 e!113230))

(declare-fun res!81531 () Bool)

(assert (=> d!52159 (=> (not res!81531) (not e!113230))))

(assert (=> d!52159 (= res!81531 (contains!1139 lt!85293 lt!85282))))

(assert (=> d!52159 (= (addApplyDifferent!105 lt!85293 lt!85291 (zeroValue!3397 lt!85094) lt!85282) lt!85490)))

(declare-fun b!171577 () Bool)

(assert (=> b!171577 (= e!113230 (not (= lt!85282 lt!85291)))))

(assert (= (and d!52159 res!81531) b!171577))

(assert (=> d!52159 m!199663))

(declare-fun m!200431 () Bool)

(assert (=> d!52159 m!200431))

(assert (=> d!52159 m!199663))

(assert (=> d!52159 m!199665))

(assert (=> d!52159 m!199685))

(declare-fun m!200433 () Bool)

(assert (=> d!52159 m!200433))

(assert (=> b!171170 d!52159))

(declare-fun d!52161 () Bool)

(assert (=> d!52161 (= (apply!129 lt!85292 lt!85276) (get!1945 (getValueByKey!185 (toList!1081 lt!85292) lt!85276)))))

(declare-fun bs!7101 () Bool)

(assert (= bs!7101 d!52161))

(declare-fun m!200435 () Bool)

(assert (=> bs!7101 m!200435))

(assert (=> bs!7101 m!200435))

(declare-fun m!200437 () Bool)

(assert (=> bs!7101 m!200437))

(assert (=> b!171170 d!52161))

(declare-fun d!52163 () Bool)

(assert (=> d!52163 (contains!1139 (+!243 lt!85289 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094))) lt!85278)))

(declare-fun lt!85491 () Unit!5251)

(assert (=> d!52163 (= lt!85491 (choose!933 lt!85289 lt!85275 (zeroValue!3397 lt!85094) lt!85278))))

(assert (=> d!52163 (contains!1139 lt!85289 lt!85278)))

(assert (=> d!52163 (= (addStillContains!105 lt!85289 lt!85275 (zeroValue!3397 lt!85094) lt!85278) lt!85491)))

(declare-fun bs!7102 () Bool)

(assert (= bs!7102 d!52163))

(assert (=> bs!7102 m!199667))

(assert (=> bs!7102 m!199667))

(assert (=> bs!7102 m!199669))

(declare-fun m!200439 () Bool)

(assert (=> bs!7102 m!200439))

(declare-fun m!200441 () Bool)

(assert (=> bs!7102 m!200441))

(assert (=> b!171170 d!52163))

(declare-fun d!52165 () Bool)

(assert (=> d!52165 (= (apply!129 lt!85281 lt!85288) (get!1945 (getValueByKey!185 (toList!1081 lt!85281) lt!85288)))))

(declare-fun bs!7103 () Bool)

(assert (= bs!7103 d!52165))

(declare-fun m!200443 () Bool)

(assert (=> bs!7103 m!200443))

(assert (=> bs!7103 m!200443))

(declare-fun m!200445 () Bool)

(assert (=> bs!7103 m!200445))

(assert (=> b!171170 d!52165))

(declare-fun d!52167 () Bool)

(declare-fun e!113231 () Bool)

(assert (=> d!52167 e!113231))

(declare-fun res!81532 () Bool)

(assert (=> d!52167 (=> res!81532 e!113231)))

(declare-fun lt!85492 () Bool)

(assert (=> d!52167 (= res!81532 (not lt!85492))))

(declare-fun lt!85494 () Bool)

(assert (=> d!52167 (= lt!85492 lt!85494)))

(declare-fun lt!85495 () Unit!5251)

(declare-fun e!113232 () Unit!5251)

(assert (=> d!52167 (= lt!85495 e!113232)))

(declare-fun c!30682 () Bool)

(assert (=> d!52167 (= c!30682 lt!85494)))

(assert (=> d!52167 (= lt!85494 (containsKey!188 (toList!1081 (+!243 lt!85289 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094)))) lt!85278))))

(assert (=> d!52167 (= (contains!1139 (+!243 lt!85289 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094))) lt!85278) lt!85492)))

(declare-fun b!171578 () Bool)

(declare-fun lt!85493 () Unit!5251)

(assert (=> b!171578 (= e!113232 lt!85493)))

(assert (=> b!171578 (= lt!85493 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 (+!243 lt!85289 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094)))) lt!85278))))

(assert (=> b!171578 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85289 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094)))) lt!85278))))

(declare-fun b!171579 () Bool)

(declare-fun Unit!5275 () Unit!5251)

(assert (=> b!171579 (= e!113232 Unit!5275)))

(declare-fun b!171580 () Bool)

(assert (=> b!171580 (= e!113231 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85289 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094)))) lt!85278)))))

(assert (= (and d!52167 c!30682) b!171578))

(assert (= (and d!52167 (not c!30682)) b!171579))

(assert (= (and d!52167 (not res!81532)) b!171580))

(declare-fun m!200447 () Bool)

(assert (=> d!52167 m!200447))

(declare-fun m!200449 () Bool)

(assert (=> b!171578 m!200449))

(declare-fun m!200451 () Bool)

(assert (=> b!171578 m!200451))

(assert (=> b!171578 m!200451))

(declare-fun m!200453 () Bool)

(assert (=> b!171578 m!200453))

(assert (=> b!171580 m!200451))

(assert (=> b!171580 m!200451))

(assert (=> b!171580 m!200453))

(assert (=> b!171170 d!52167))

(declare-fun d!52169 () Bool)

(assert (=> d!52169 (= (apply!129 (+!243 lt!85293 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094))) lt!85282) (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85293 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094)))) lt!85282)))))

(declare-fun bs!7104 () Bool)

(assert (= bs!7104 d!52169))

(declare-fun m!200455 () Bool)

(assert (=> bs!7104 m!200455))

(assert (=> bs!7104 m!200455))

(declare-fun m!200457 () Bool)

(assert (=> bs!7104 m!200457))

(assert (=> b!171170 d!52169))

(declare-fun d!52171 () Bool)

(assert (=> d!52171 (= (apply!129 (+!243 lt!85281 (tuple2!3199 lt!85280 (minValue!3397 lt!85094))) lt!85288) (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85281 (tuple2!3199 lt!85280 (minValue!3397 lt!85094)))) lt!85288)))))

(declare-fun bs!7105 () Bool)

(assert (= bs!7105 d!52171))

(declare-fun m!200459 () Bool)

(assert (=> bs!7105 m!200459))

(assert (=> bs!7105 m!200459))

(declare-fun m!200461 () Bool)

(assert (=> bs!7105 m!200461))

(assert (=> b!171170 d!52171))

(declare-fun d!52173 () Bool)

(assert (=> d!52173 (= (apply!129 lt!85293 lt!85282) (get!1945 (getValueByKey!185 (toList!1081 lt!85293) lt!85282)))))

(declare-fun bs!7106 () Bool)

(assert (= bs!7106 d!52173))

(declare-fun m!200463 () Bool)

(assert (=> bs!7106 m!200463))

(assert (=> bs!7106 m!200463))

(declare-fun m!200465 () Bool)

(assert (=> bs!7106 m!200465))

(assert (=> b!171170 d!52173))

(declare-fun d!52175 () Bool)

(declare-fun e!113233 () Bool)

(assert (=> d!52175 e!113233))

(declare-fun res!81534 () Bool)

(assert (=> d!52175 (=> (not res!81534) (not e!113233))))

(declare-fun lt!85496 () ListLongMap!2131)

(assert (=> d!52175 (= res!81534 (contains!1139 lt!85496 (_1!1610 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094)))))))

(declare-fun lt!85497 () List!2176)

(assert (=> d!52175 (= lt!85496 (ListLongMap!2132 lt!85497))))

(declare-fun lt!85499 () Unit!5251)

(declare-fun lt!85498 () Unit!5251)

(assert (=> d!52175 (= lt!85499 lt!85498)))

(assert (=> d!52175 (= (getValueByKey!185 lt!85497 (_1!1610 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094)))) (Some!190 (_2!1610 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094)))))))

(assert (=> d!52175 (= lt!85498 (lemmaContainsTupThenGetReturnValue!98 lt!85497 (_1!1610 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094))) (_2!1610 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094)))))))

(assert (=> d!52175 (= lt!85497 (insertStrictlySorted!101 (toList!1081 lt!85293) (_1!1610 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094))) (_2!1610 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094)))))))

(assert (=> d!52175 (= (+!243 lt!85293 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094))) lt!85496)))

(declare-fun b!171581 () Bool)

(declare-fun res!81533 () Bool)

(assert (=> b!171581 (=> (not res!81533) (not e!113233))))

(assert (=> b!171581 (= res!81533 (= (getValueByKey!185 (toList!1081 lt!85496) (_1!1610 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094)))) (Some!190 (_2!1610 (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094))))))))

(declare-fun b!171582 () Bool)

(assert (=> b!171582 (= e!113233 (contains!1141 (toList!1081 lt!85496) (tuple2!3199 lt!85291 (zeroValue!3397 lt!85094))))))

(assert (= (and d!52175 res!81534) b!171581))

(assert (= (and b!171581 res!81533) b!171582))

(declare-fun m!200467 () Bool)

(assert (=> d!52175 m!200467))

(declare-fun m!200469 () Bool)

(assert (=> d!52175 m!200469))

(declare-fun m!200471 () Bool)

(assert (=> d!52175 m!200471))

(declare-fun m!200473 () Bool)

(assert (=> d!52175 m!200473))

(declare-fun m!200475 () Bool)

(assert (=> b!171581 m!200475))

(declare-fun m!200477 () Bool)

(assert (=> b!171582 m!200477))

(assert (=> b!171170 d!52175))

(declare-fun d!52177 () Bool)

(declare-fun e!113234 () Bool)

(assert (=> d!52177 e!113234))

(declare-fun res!81536 () Bool)

(assert (=> d!52177 (=> (not res!81536) (not e!113234))))

(declare-fun lt!85500 () ListLongMap!2131)

(assert (=> d!52177 (= res!81536 (contains!1139 lt!85500 (_1!1610 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094)))))))

(declare-fun lt!85501 () List!2176)

(assert (=> d!52177 (= lt!85500 (ListLongMap!2132 lt!85501))))

(declare-fun lt!85503 () Unit!5251)

(declare-fun lt!85502 () Unit!5251)

(assert (=> d!52177 (= lt!85503 lt!85502)))

(assert (=> d!52177 (= (getValueByKey!185 lt!85501 (_1!1610 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094)))) (Some!190 (_2!1610 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094)))))))

(assert (=> d!52177 (= lt!85502 (lemmaContainsTupThenGetReturnValue!98 lt!85501 (_1!1610 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094))) (_2!1610 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094)))))))

(assert (=> d!52177 (= lt!85501 (insertStrictlySorted!101 (toList!1081 lt!85289) (_1!1610 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094))) (_2!1610 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094)))))))

(assert (=> d!52177 (= (+!243 lt!85289 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094))) lt!85500)))

(declare-fun b!171583 () Bool)

(declare-fun res!81535 () Bool)

(assert (=> b!171583 (=> (not res!81535) (not e!113234))))

(assert (=> b!171583 (= res!81535 (= (getValueByKey!185 (toList!1081 lt!85500) (_1!1610 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094)))) (Some!190 (_2!1610 (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094))))))))

(declare-fun b!171584 () Bool)

(assert (=> b!171584 (= e!113234 (contains!1141 (toList!1081 lt!85500) (tuple2!3199 lt!85275 (zeroValue!3397 lt!85094))))))

(assert (= (and d!52177 res!81536) b!171583))

(assert (= (and b!171583 res!81535) b!171584))

(declare-fun m!200479 () Bool)

(assert (=> d!52177 m!200479))

(declare-fun m!200481 () Bool)

(assert (=> d!52177 m!200481))

(declare-fun m!200483 () Bool)

(assert (=> d!52177 m!200483))

(declare-fun m!200485 () Bool)

(assert (=> d!52177 m!200485))

(declare-fun m!200487 () Bool)

(assert (=> b!171583 m!200487))

(declare-fun m!200489 () Bool)

(assert (=> b!171584 m!200489))

(assert (=> b!171170 d!52177))

(declare-fun d!52179 () Bool)

(declare-fun e!113235 () Bool)

(assert (=> d!52179 e!113235))

(declare-fun res!81538 () Bool)

(assert (=> d!52179 (=> (not res!81538) (not e!113235))))

(declare-fun lt!85504 () ListLongMap!2131)

(assert (=> d!52179 (= res!81538 (contains!1139 lt!85504 (_1!1610 (tuple2!3199 lt!85294 (minValue!3397 lt!85094)))))))

(declare-fun lt!85505 () List!2176)

(assert (=> d!52179 (= lt!85504 (ListLongMap!2132 lt!85505))))

(declare-fun lt!85507 () Unit!5251)

(declare-fun lt!85506 () Unit!5251)

(assert (=> d!52179 (= lt!85507 lt!85506)))

(assert (=> d!52179 (= (getValueByKey!185 lt!85505 (_1!1610 (tuple2!3199 lt!85294 (minValue!3397 lt!85094)))) (Some!190 (_2!1610 (tuple2!3199 lt!85294 (minValue!3397 lt!85094)))))))

(assert (=> d!52179 (= lt!85506 (lemmaContainsTupThenGetReturnValue!98 lt!85505 (_1!1610 (tuple2!3199 lt!85294 (minValue!3397 lt!85094))) (_2!1610 (tuple2!3199 lt!85294 (minValue!3397 lt!85094)))))))

(assert (=> d!52179 (= lt!85505 (insertStrictlySorted!101 (toList!1081 lt!85292) (_1!1610 (tuple2!3199 lt!85294 (minValue!3397 lt!85094))) (_2!1610 (tuple2!3199 lt!85294 (minValue!3397 lt!85094)))))))

(assert (=> d!52179 (= (+!243 lt!85292 (tuple2!3199 lt!85294 (minValue!3397 lt!85094))) lt!85504)))

(declare-fun b!171585 () Bool)

(declare-fun res!81537 () Bool)

(assert (=> b!171585 (=> (not res!81537) (not e!113235))))

(assert (=> b!171585 (= res!81537 (= (getValueByKey!185 (toList!1081 lt!85504) (_1!1610 (tuple2!3199 lt!85294 (minValue!3397 lt!85094)))) (Some!190 (_2!1610 (tuple2!3199 lt!85294 (minValue!3397 lt!85094))))))))

(declare-fun b!171586 () Bool)

(assert (=> b!171586 (= e!113235 (contains!1141 (toList!1081 lt!85504) (tuple2!3199 lt!85294 (minValue!3397 lt!85094))))))

(assert (= (and d!52179 res!81538) b!171585))

(assert (= (and b!171585 res!81537) b!171586))

(declare-fun m!200491 () Bool)

(assert (=> d!52179 m!200491))

(declare-fun m!200493 () Bool)

(assert (=> d!52179 m!200493))

(declare-fun m!200495 () Bool)

(assert (=> d!52179 m!200495))

(declare-fun m!200497 () Bool)

(assert (=> d!52179 m!200497))

(declare-fun m!200499 () Bool)

(assert (=> b!171585 m!200499))

(declare-fun m!200501 () Bool)

(assert (=> b!171586 m!200501))

(assert (=> b!171170 d!52179))

(declare-fun d!52181 () Bool)

(assert (=> d!52181 (= (apply!129 (+!243 lt!85281 (tuple2!3199 lt!85280 (minValue!3397 lt!85094))) lt!85288) (apply!129 lt!85281 lt!85288))))

(declare-fun lt!85508 () Unit!5251)

(assert (=> d!52181 (= lt!85508 (choose!932 lt!85281 lt!85280 (minValue!3397 lt!85094) lt!85288))))

(declare-fun e!113236 () Bool)

(assert (=> d!52181 e!113236))

(declare-fun res!81539 () Bool)

(assert (=> d!52181 (=> (not res!81539) (not e!113236))))

(assert (=> d!52181 (= res!81539 (contains!1139 lt!85281 lt!85288))))

(assert (=> d!52181 (= (addApplyDifferent!105 lt!85281 lt!85280 (minValue!3397 lt!85094) lt!85288) lt!85508)))

(declare-fun b!171587 () Bool)

(assert (=> b!171587 (= e!113236 (not (= lt!85288 lt!85280)))))

(assert (= (and d!52181 res!81539) b!171587))

(assert (=> d!52181 m!199657))

(declare-fun m!200503 () Bool)

(assert (=> d!52181 m!200503))

(assert (=> d!52181 m!199657))

(assert (=> d!52181 m!199659))

(assert (=> d!52181 m!199681))

(declare-fun m!200505 () Bool)

(assert (=> d!52181 m!200505))

(assert (=> b!171170 d!52181))

(declare-fun d!52183 () Bool)

(assert (=> d!52183 (= (apply!129 (+!243 lt!85292 (tuple2!3199 lt!85294 (minValue!3397 lt!85094))) lt!85276) (apply!129 lt!85292 lt!85276))))

(declare-fun lt!85509 () Unit!5251)

(assert (=> d!52183 (= lt!85509 (choose!932 lt!85292 lt!85294 (minValue!3397 lt!85094) lt!85276))))

(declare-fun e!113237 () Bool)

(assert (=> d!52183 e!113237))

(declare-fun res!81540 () Bool)

(assert (=> d!52183 (=> (not res!81540) (not e!113237))))

(assert (=> d!52183 (= res!81540 (contains!1139 lt!85292 lt!85276))))

(assert (=> d!52183 (= (addApplyDifferent!105 lt!85292 lt!85294 (minValue!3397 lt!85094) lt!85276) lt!85509)))

(declare-fun b!171588 () Bool)

(assert (=> b!171588 (= e!113237 (not (= lt!85276 lt!85294)))))

(assert (= (and d!52183 res!81540) b!171588))

(assert (=> d!52183 m!199671))

(declare-fun m!200507 () Bool)

(assert (=> d!52183 m!200507))

(assert (=> d!52183 m!199671))

(assert (=> d!52183 m!199673))

(assert (=> d!52183 m!199675))

(declare-fun m!200509 () Bool)

(assert (=> d!52183 m!200509))

(assert (=> b!171170 d!52183))

(declare-fun b!171589 () Bool)

(declare-fun e!113243 () Bool)

(declare-fun e!113241 () Bool)

(assert (=> b!171589 (= e!113243 e!113241)))

(declare-fun c!30685 () Bool)

(assert (=> b!171589 (= c!30685 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(declare-fun b!171590 () Bool)

(declare-fun lt!85511 () ListLongMap!2131)

(assert (=> b!171590 (= e!113241 (= lt!85511 (getCurrentListMapNoExtraKeys!160 (_keys!5386 lt!85094) (_values!3537 lt!85094) (mask!8382 lt!85094) (extraKeys!3295 lt!85094) (zeroValue!3397 lt!85094) (minValue!3397 lt!85094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 lt!85094))))))

(declare-fun b!171591 () Bool)

(declare-fun e!113238 () ListLongMap!2131)

(declare-fun call!17456 () ListLongMap!2131)

(assert (=> b!171591 (= e!113238 call!17456)))

(declare-fun d!52185 () Bool)

(declare-fun e!113244 () Bool)

(assert (=> d!52185 e!113244))

(declare-fun res!81541 () Bool)

(assert (=> d!52185 (=> (not res!81541) (not e!113244))))

(assert (=> d!52185 (= res!81541 (not (contains!1139 lt!85511 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!113240 () ListLongMap!2131)

(assert (=> d!52185 (= lt!85511 e!113240)))

(declare-fun c!30684 () Bool)

(assert (=> d!52185 (= c!30684 (bvsge #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(assert (=> d!52185 (validMask!0 (mask!8382 lt!85094))))

(assert (=> d!52185 (= (getCurrentListMapNoExtraKeys!160 (_keys!5386 lt!85094) (_values!3537 lt!85094) (mask!8382 lt!85094) (extraKeys!3295 lt!85094) (zeroValue!3397 lt!85094) (minValue!3397 lt!85094) #b00000000000000000000000000000000 (defaultEntry!3554 lt!85094)) lt!85511)))

(declare-fun b!171592 () Bool)

(assert (=> b!171592 (= e!113244 e!113243)))

(declare-fun c!30683 () Bool)

(declare-fun e!113239 () Bool)

(assert (=> b!171592 (= c!30683 e!113239)))

(declare-fun res!81544 () Bool)

(assert (=> b!171592 (=> (not res!81544) (not e!113239))))

(assert (=> b!171592 (= res!81544 (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(declare-fun b!171593 () Bool)

(assert (=> b!171593 (= e!113239 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(assert (=> b!171593 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!171594 () Bool)

(declare-fun res!81542 () Bool)

(assert (=> b!171594 (=> (not res!81542) (not e!113244))))

(assert (=> b!171594 (= res!81542 (not (contains!1139 lt!85511 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171595 () Bool)

(assert (=> b!171595 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(assert (=> b!171595 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3674 (_values!3537 lt!85094))))))

(declare-fun e!113242 () Bool)

(assert (=> b!171595 (= e!113242 (= (apply!129 lt!85511 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)) (get!1944 (select (arr!3381 (_values!3537 lt!85094)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 lt!85094) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171596 () Bool)

(assert (=> b!171596 (= e!113240 (ListLongMap!2132 Nil!2173))))

(declare-fun b!171597 () Bool)

(declare-fun lt!85510 () Unit!5251)

(declare-fun lt!85515 () Unit!5251)

(assert (=> b!171597 (= lt!85510 lt!85515)))

(declare-fun lt!85512 () ListLongMap!2131)

(declare-fun lt!85514 () (_ BitVec 64))

(declare-fun lt!85513 () (_ BitVec 64))

(declare-fun lt!85516 () V!4985)

(assert (=> b!171597 (not (contains!1139 (+!243 lt!85512 (tuple2!3199 lt!85513 lt!85516)) lt!85514))))

(assert (=> b!171597 (= lt!85515 (addStillNotContains!73 lt!85512 lt!85513 lt!85516 lt!85514))))

(assert (=> b!171597 (= lt!85514 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171597 (= lt!85516 (get!1944 (select (arr!3381 (_values!3537 lt!85094)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 lt!85094) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171597 (= lt!85513 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000))))

(assert (=> b!171597 (= lt!85512 call!17456)))

(assert (=> b!171597 (= e!113238 (+!243 call!17456 (tuple2!3199 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 lt!85094)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 lt!85094) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!171598 () Bool)

(assert (=> b!171598 (= e!113243 e!113242)))

(assert (=> b!171598 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3673 (_keys!5386 lt!85094))))))

(declare-fun res!81543 () Bool)

(assert (=> b!171598 (= res!81543 (contains!1139 lt!85511 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(assert (=> b!171598 (=> (not res!81543) (not e!113242))))

(declare-fun bm!17453 () Bool)

(assert (=> bm!17453 (= call!17456 (getCurrentListMapNoExtraKeys!160 (_keys!5386 lt!85094) (_values!3537 lt!85094) (mask!8382 lt!85094) (extraKeys!3295 lt!85094) (zeroValue!3397 lt!85094) (minValue!3397 lt!85094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 lt!85094)))))

(declare-fun b!171599 () Bool)

(assert (=> b!171599 (= e!113240 e!113238)))

(declare-fun c!30686 () Bool)

(assert (=> b!171599 (= c!30686 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun b!171600 () Bool)

(assert (=> b!171600 (= e!113241 (isEmpty!439 lt!85511))))

(assert (= (and d!52185 c!30684) b!171596))

(assert (= (and d!52185 (not c!30684)) b!171599))

(assert (= (and b!171599 c!30686) b!171597))

(assert (= (and b!171599 (not c!30686)) b!171591))

(assert (= (or b!171597 b!171591) bm!17453))

(assert (= (and d!52185 res!81541) b!171594))

(assert (= (and b!171594 res!81542) b!171592))

(assert (= (and b!171592 res!81544) b!171593))

(assert (= (and b!171592 c!30683) b!171598))

(assert (= (and b!171592 (not c!30683)) b!171589))

(assert (= (and b!171598 res!81543) b!171595))

(assert (= (and b!171589 c!30685) b!171590))

(assert (= (and b!171589 (not c!30685)) b!171600))

(declare-fun b_lambda!6939 () Bool)

(assert (=> (not b_lambda!6939) (not b!171595)))

(assert (=> b!171595 t!6976))

(declare-fun b_and!10683 () Bool)

(assert (= b_and!10681 (and (=> t!6976 result!4559) b_and!10683)))

(declare-fun b_lambda!6941 () Bool)

(assert (=> (not b_lambda!6941) (not b!171597)))

(assert (=> b!171597 t!6976))

(declare-fun b_and!10685 () Bool)

(assert (= b_and!10683 (and (=> t!6976 result!4559) b_and!10685)))

(assert (=> b!171598 m!199631))

(assert (=> b!171598 m!199631))

(declare-fun m!200511 () Bool)

(assert (=> b!171598 m!200511))

(assert (=> b!171599 m!199631))

(assert (=> b!171599 m!199631))

(assert (=> b!171599 m!199633))

(declare-fun m!200513 () Bool)

(assert (=> d!52185 m!200513))

(assert (=> d!52185 m!199697))

(declare-fun m!200515 () Bool)

(assert (=> b!171597 m!200515))

(declare-fun m!200517 () Bool)

(assert (=> b!171597 m!200517))

(declare-fun m!200519 () Bool)

(assert (=> b!171597 m!200519))

(declare-fun m!200521 () Bool)

(assert (=> b!171597 m!200521))

(assert (=> b!171597 m!199691))

(assert (=> b!171597 m!199689))

(assert (=> b!171597 m!199631))

(assert (=> b!171597 m!200517))

(assert (=> b!171597 m!199691))

(assert (=> b!171597 m!199689))

(assert (=> b!171597 m!199693))

(assert (=> b!171593 m!199631))

(assert (=> b!171593 m!199631))

(assert (=> b!171593 m!199633))

(declare-fun m!200523 () Bool)

(assert (=> b!171590 m!200523))

(assert (=> bm!17453 m!200523))

(assert (=> b!171595 m!199631))

(declare-fun m!200525 () Bool)

(assert (=> b!171595 m!200525))

(assert (=> b!171595 m!199691))

(assert (=> b!171595 m!199691))

(assert (=> b!171595 m!199689))

(assert (=> b!171595 m!199693))

(assert (=> b!171595 m!199689))

(assert (=> b!171595 m!199631))

(declare-fun m!200527 () Bool)

(assert (=> b!171600 m!200527))

(declare-fun m!200529 () Bool)

(assert (=> b!171594 m!200529))

(assert (=> b!171170 d!52185))

(declare-fun d!52187 () Bool)

(assert (=> d!52187 (= (apply!129 (+!243 lt!85292 (tuple2!3199 lt!85294 (minValue!3397 lt!85094))) lt!85276) (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85292 (tuple2!3199 lt!85294 (minValue!3397 lt!85094)))) lt!85276)))))

(declare-fun bs!7107 () Bool)

(assert (= bs!7107 d!52187))

(declare-fun m!200531 () Bool)

(assert (=> bs!7107 m!200531))

(assert (=> bs!7107 m!200531))

(declare-fun m!200533 () Bool)

(assert (=> bs!7107 m!200533))

(assert (=> b!171170 d!52187))

(assert (=> d!51995 d!52003))

(assert (=> d!51995 d!52001))

(declare-fun d!52189 () Bool)

(assert (=> d!52189 (contains!1139 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) lt!85212)))

(assert (=> d!52189 true))

(declare-fun _$35!408 () Unit!5251)

(assert (=> d!52189 (= (choose!933 lt!85223 lt!85209 (zeroValue!3397 thiss!1248) lt!85212) _$35!408)))

(declare-fun bs!7108 () Bool)

(assert (= bs!7108 d!52189))

(assert (=> bs!7108 m!199545))

(assert (=> bs!7108 m!199545))

(assert (=> bs!7108 m!199547))

(assert (=> d!51995 d!52189))

(declare-fun d!52191 () Bool)

(declare-fun e!113245 () Bool)

(assert (=> d!52191 e!113245))

(declare-fun res!81545 () Bool)

(assert (=> d!52191 (=> res!81545 e!113245)))

(declare-fun lt!85517 () Bool)

(assert (=> d!52191 (= res!81545 (not lt!85517))))

(declare-fun lt!85519 () Bool)

(assert (=> d!52191 (= lt!85517 lt!85519)))

(declare-fun lt!85520 () Unit!5251)

(declare-fun e!113246 () Unit!5251)

(assert (=> d!52191 (= lt!85520 e!113246)))

(declare-fun c!30687 () Bool)

(assert (=> d!52191 (= c!30687 lt!85519)))

(assert (=> d!52191 (= lt!85519 (containsKey!188 (toList!1081 lt!85223) lt!85212))))

(assert (=> d!52191 (= (contains!1139 lt!85223 lt!85212) lt!85517)))

(declare-fun b!171602 () Bool)

(declare-fun lt!85518 () Unit!5251)

(assert (=> b!171602 (= e!113246 lt!85518)))

(assert (=> b!171602 (= lt!85518 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85223) lt!85212))))

(assert (=> b!171602 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85223) lt!85212))))

(declare-fun b!171603 () Bool)

(declare-fun Unit!5276 () Unit!5251)

(assert (=> b!171603 (= e!113246 Unit!5276)))

(declare-fun b!171604 () Bool)

(assert (=> b!171604 (= e!113245 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85223) lt!85212)))))

(assert (= (and d!52191 c!30687) b!171602))

(assert (= (and d!52191 (not c!30687)) b!171603))

(assert (= (and d!52191 (not res!81545)) b!171604))

(declare-fun m!200535 () Bool)

(assert (=> d!52191 m!200535))

(declare-fun m!200537 () Bool)

(assert (=> b!171602 m!200537))

(declare-fun m!200539 () Bool)

(assert (=> b!171602 m!200539))

(assert (=> b!171602 m!200539))

(declare-fun m!200541 () Bool)

(assert (=> b!171602 m!200541))

(assert (=> b!171604 m!200539))

(assert (=> b!171604 m!200539))

(assert (=> b!171604 m!200541))

(assert (=> d!51995 d!52191))

(declare-fun d!52193 () Bool)

(declare-fun e!113247 () Bool)

(assert (=> d!52193 e!113247))

(declare-fun res!81546 () Bool)

(assert (=> d!52193 (=> res!81546 e!113247)))

(declare-fun lt!85521 () Bool)

(assert (=> d!52193 (= res!81546 (not lt!85521))))

(declare-fun lt!85523 () Bool)

(assert (=> d!52193 (= lt!85521 lt!85523)))

(declare-fun lt!85524 () Unit!5251)

(declare-fun e!113248 () Unit!5251)

(assert (=> d!52193 (= lt!85524 e!113248)))

(declare-fun c!30688 () Bool)

(assert (=> d!52193 (= c!30688 lt!85523)))

(assert (=> d!52193 (= lt!85523 (containsKey!188 (toList!1081 lt!85295) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52193 (= (contains!1139 lt!85295 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85521)))

(declare-fun b!171605 () Bool)

(declare-fun lt!85522 () Unit!5251)

(assert (=> b!171605 (= e!113248 lt!85522)))

(assert (=> b!171605 (= lt!85522 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85295) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> b!171605 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85295) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171606 () Bool)

(declare-fun Unit!5277 () Unit!5251)

(assert (=> b!171606 (= e!113248 Unit!5277)))

(declare-fun b!171607 () Bool)

(assert (=> b!171607 (= e!113247 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85295) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52193 c!30688) b!171605))

(assert (= (and d!52193 (not c!30688)) b!171606))

(assert (= (and d!52193 (not res!81546)) b!171607))

(declare-fun m!200543 () Bool)

(assert (=> d!52193 m!200543))

(declare-fun m!200545 () Bool)

(assert (=> b!171605 m!200545))

(assert (=> b!171605 m!199709))

(assert (=> b!171605 m!199709))

(declare-fun m!200547 () Bool)

(assert (=> b!171605 m!200547))

(assert (=> b!171607 m!199709))

(assert (=> b!171607 m!199709))

(assert (=> b!171607 m!200547))

(assert (=> d!51887 d!52193))

(declare-fun b!171609 () Bool)

(declare-fun e!113249 () Option!191)

(declare-fun e!113250 () Option!191)

(assert (=> b!171609 (= e!113249 e!113250)))

(declare-fun c!30690 () Bool)

(assert (=> b!171609 (= c!30690 (and ((_ is Cons!2172) lt!85296) (not (= (_1!1610 (h!2789 lt!85296)) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(declare-fun b!171610 () Bool)

(assert (=> b!171610 (= e!113250 (getValueByKey!185 (t!6970 lt!85296) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun c!30689 () Bool)

(declare-fun d!52195 () Bool)

(assert (=> d!52195 (= c!30689 (and ((_ is Cons!2172) lt!85296) (= (_1!1610 (h!2789 lt!85296)) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52195 (= (getValueByKey!185 lt!85296 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) e!113249)))

(declare-fun b!171608 () Bool)

(assert (=> b!171608 (= e!113249 (Some!190 (_2!1610 (h!2789 lt!85296))))))

(declare-fun b!171611 () Bool)

(assert (=> b!171611 (= e!113250 None!189)))

(assert (= (and d!52195 c!30689) b!171608))

(assert (= (and d!52195 (not c!30689)) b!171609))

(assert (= (and b!171609 c!30690) b!171610))

(assert (= (and b!171609 (not c!30690)) b!171611))

(declare-fun m!200549 () Bool)

(assert (=> b!171610 m!200549))

(assert (=> d!51887 d!52195))

(declare-fun d!52197 () Bool)

(assert (=> d!52197 (= (getValueByKey!185 lt!85296 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!190 (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun lt!85525 () Unit!5251)

(assert (=> d!52197 (= lt!85525 (choose!930 lt!85296 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun e!113251 () Bool)

(assert (=> d!52197 e!113251))

(declare-fun res!81547 () Bool)

(assert (=> d!52197 (=> (not res!81547) (not e!113251))))

(assert (=> d!52197 (= res!81547 (isStrictlySorted!318 lt!85296))))

(assert (=> d!52197 (= (lemmaContainsTupThenGetReturnValue!98 lt!85296 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85525)))

(declare-fun b!171612 () Bool)

(declare-fun res!81548 () Bool)

(assert (=> b!171612 (=> (not res!81548) (not e!113251))))

(assert (=> b!171612 (= res!81548 (containsKey!188 lt!85296 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171613 () Bool)

(assert (=> b!171613 (= e!113251 (contains!1141 lt!85296 (tuple2!3199 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52197 res!81547) b!171612))

(assert (= (and b!171612 res!81548) b!171613))

(assert (=> d!52197 m!199703))

(declare-fun m!200551 () Bool)

(assert (=> d!52197 m!200551))

(declare-fun m!200553 () Bool)

(assert (=> d!52197 m!200553))

(declare-fun m!200555 () Bool)

(assert (=> b!171612 m!200555))

(declare-fun m!200557 () Bool)

(assert (=> b!171613 m!200557))

(assert (=> d!51887 d!52197))

(declare-fun b!171614 () Bool)

(declare-fun e!113254 () List!2176)

(declare-fun call!17459 () List!2176)

(assert (=> b!171614 (= e!113254 call!17459)))

(declare-fun b!171615 () Bool)

(assert (=> b!171615 (= e!113254 call!17459)))

(declare-fun b!171616 () Bool)

(declare-fun c!30691 () Bool)

(assert (=> b!171616 (= c!30691 (and ((_ is Cons!2172) (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393)))) (bvsgt (_1!1610 (h!2789 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393))))) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun e!113253 () List!2176)

(assert (=> b!171616 (= e!113253 e!113254)))

(declare-fun d!52199 () Bool)

(declare-fun e!113252 () Bool)

(assert (=> d!52199 e!113252))

(declare-fun res!81550 () Bool)

(assert (=> d!52199 (=> (not res!81550) (not e!113252))))

(declare-fun lt!85526 () List!2176)

(assert (=> d!52199 (= res!81550 (isStrictlySorted!318 lt!85526))))

(declare-fun e!113256 () List!2176)

(assert (=> d!52199 (= lt!85526 e!113256)))

(declare-fun c!30692 () Bool)

(assert (=> d!52199 (= c!30692 (and ((_ is Cons!2172) (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393)))) (bvslt (_1!1610 (h!2789 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393))))) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52199 (isStrictlySorted!318 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393))))))

(assert (=> d!52199 (= (insertStrictlySorted!101 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393))) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85526)))

(declare-fun b!171617 () Bool)

(assert (=> b!171617 (= e!113256 e!113253)))

(declare-fun c!30693 () Bool)

(assert (=> b!171617 (= c!30693 (and ((_ is Cons!2172) (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393)))) (= (_1!1610 (h!2789 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393))))) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171618 () Bool)

(assert (=> b!171618 (= e!113252 (contains!1141 lt!85526 (tuple2!3199 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171619 () Bool)

(declare-fun call!17457 () List!2176)

(assert (=> b!171619 (= e!113253 call!17457)))

(declare-fun b!171620 () Bool)

(declare-fun e!113255 () List!2176)

(assert (=> b!171620 (= e!113255 (ite c!30693 (t!6970 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393)))) (ite c!30691 (Cons!2172 (h!2789 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393)))) (t!6970 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393))))) Nil!2173)))))

(declare-fun bm!17454 () Bool)

(declare-fun call!17458 () List!2176)

(assert (=> bm!17454 (= call!17457 call!17458)))

(declare-fun b!171621 () Bool)

(assert (=> b!171621 (= e!113256 call!17458)))

(declare-fun b!171622 () Bool)

(assert (=> b!171622 (= e!113255 (insertStrictlySorted!101 (t!6970 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393)))) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun bm!17455 () Bool)

(assert (=> bm!17455 (= call!17459 call!17457)))

(declare-fun b!171623 () Bool)

(declare-fun res!81549 () Bool)

(assert (=> b!171623 (=> (not res!81549) (not e!113252))))

(assert (=> b!171623 (= res!81549 (containsKey!188 lt!85526 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun bm!17456 () Bool)

(assert (=> bm!17456 (= call!17458 ($colon$colon!96 e!113255 (ite c!30692 (h!2789 (toList!1081 (ite c!30529 call!17396 (ite c!30528 call!17398 call!17393)))) (tuple2!3199 (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(declare-fun c!30694 () Bool)

(assert (=> bm!17456 (= c!30694 c!30692)))

(assert (= (and d!52199 c!30692) b!171621))

(assert (= (and d!52199 (not c!30692)) b!171617))

(assert (= (and b!171617 c!30693) b!171619))

(assert (= (and b!171617 (not c!30693)) b!171616))

(assert (= (and b!171616 c!30691) b!171614))

(assert (= (and b!171616 (not c!30691)) b!171615))

(assert (= (or b!171614 b!171615) bm!17455))

(assert (= (or b!171619 bm!17455) bm!17454))

(assert (= (or b!171621 bm!17454) bm!17456))

(assert (= (and bm!17456 c!30694) b!171622))

(assert (= (and bm!17456 (not c!30694)) b!171620))

(assert (= (and d!52199 res!81550) b!171623))

(assert (= (and b!171623 res!81549) b!171618))

(declare-fun m!200559 () Bool)

(assert (=> b!171622 m!200559))

(declare-fun m!200561 () Bool)

(assert (=> b!171623 m!200561))

(declare-fun m!200563 () Bool)

(assert (=> d!52199 m!200563))

(declare-fun m!200565 () Bool)

(assert (=> d!52199 m!200565))

(declare-fun m!200567 () Bool)

(assert (=> bm!17456 m!200567))

(declare-fun m!200569 () Bool)

(assert (=> b!171618 m!200569))

(assert (=> d!51887 d!52199))

(declare-fun d!52201 () Bool)

(assert (=> d!52201 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85215) lt!85222)) (v!3915 (getValueByKey!185 (toList!1081 lt!85215) lt!85222)))))

(assert (=> d!51989 d!52201))

(declare-fun b!171625 () Bool)

(declare-fun e!113257 () Option!191)

(declare-fun e!113258 () Option!191)

(assert (=> b!171625 (= e!113257 e!113258)))

(declare-fun c!30696 () Bool)

(assert (=> b!171625 (= c!30696 (and ((_ is Cons!2172) (toList!1081 lt!85215)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85215))) lt!85222))))))

(declare-fun b!171626 () Bool)

(assert (=> b!171626 (= e!113258 (getValueByKey!185 (t!6970 (toList!1081 lt!85215)) lt!85222))))

(declare-fun d!52203 () Bool)

(declare-fun c!30695 () Bool)

(assert (=> d!52203 (= c!30695 (and ((_ is Cons!2172) (toList!1081 lt!85215)) (= (_1!1610 (h!2789 (toList!1081 lt!85215))) lt!85222)))))

(assert (=> d!52203 (= (getValueByKey!185 (toList!1081 lt!85215) lt!85222) e!113257)))

(declare-fun b!171624 () Bool)

(assert (=> b!171624 (= e!113257 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85215)))))))

(declare-fun b!171627 () Bool)

(assert (=> b!171627 (= e!113258 None!189)))

(assert (= (and d!52203 c!30695) b!171624))

(assert (= (and d!52203 (not c!30695)) b!171625))

(assert (= (and b!171625 c!30696) b!171626))

(assert (= (and b!171625 (not c!30696)) b!171627))

(declare-fun m!200571 () Bool)

(assert (=> b!171626 m!200571))

(assert (=> d!51989 d!52203))

(declare-fun d!52205 () Bool)

(assert (=> d!52205 (= ($colon$colon!96 e!113040 (ite c!30589 (h!2789 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))) (Cons!2172 (ite c!30589 (h!2789 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!113040))))

(assert (=> bm!17430 d!52205))

(declare-fun d!52207 () Bool)

(assert (=> d!52207 (= (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) lt!85185)) (v!3915 (getValueByKey!185 (toList!1081 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) lt!85185)))))

(assert (=> d!51971 d!52207))

(declare-fun b!171629 () Bool)

(declare-fun e!113259 () Option!191)

(declare-fun e!113260 () Option!191)

(assert (=> b!171629 (= e!113259 e!113260)))

(declare-fun c!30698 () Bool)

(assert (=> b!171629 (= c!30698 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))) (not (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))) lt!85185))))))

(declare-fun b!171630 () Bool)

(assert (=> b!171630 (= e!113260 (getValueByKey!185 (t!6970 (toList!1081 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))) lt!85185))))

(declare-fun d!52209 () Bool)

(declare-fun c!30697 () Bool)

(assert (=> d!52209 (= c!30697 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))) (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))) lt!85185)))))

(assert (=> d!52209 (= (getValueByKey!185 (toList!1081 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) lt!85185) e!113259)))

(declare-fun b!171628 () Bool)

(assert (=> b!171628 (= e!113259 (Some!190 (_2!1610 (h!2789 (toList!1081 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))))))

(declare-fun b!171631 () Bool)

(assert (=> b!171631 (= e!113260 None!189)))

(assert (= (and d!52209 c!30697) b!171628))

(assert (= (and d!52209 (not c!30697)) b!171629))

(assert (= (and b!171629 c!30698) b!171630))

(assert (= (and b!171629 (not c!30698)) b!171631))

(declare-fun m!200573 () Bool)

(assert (=> b!171630 m!200573))

(assert (=> d!51971 d!52209))

(declare-fun b!171633 () Bool)

(declare-fun e!113261 () Option!191)

(declare-fun e!113262 () Option!191)

(assert (=> b!171633 (= e!113261 e!113262)))

(declare-fun c!30700 () Bool)

(assert (=> b!171633 (= c!30700 (and ((_ is Cons!2172) (toList!1081 lt!85401)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85401))) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))))

(declare-fun b!171634 () Bool)

(assert (=> b!171634 (= e!113262 (getValueByKey!185 (t!6970 (toList!1081 lt!85401)) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(declare-fun d!52211 () Bool)

(declare-fun c!30699 () Bool)

(assert (=> d!52211 (= c!30699 (and ((_ is Cons!2172) (toList!1081 lt!85401)) (= (_1!1610 (h!2789 (toList!1081 lt!85401))) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52211 (= (getValueByKey!185 (toList!1081 lt!85401) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) e!113261)))

(declare-fun b!171632 () Bool)

(assert (=> b!171632 (= e!113261 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85401)))))))

(declare-fun b!171635 () Bool)

(assert (=> b!171635 (= e!113262 None!189)))

(assert (= (and d!52211 c!30699) b!171632))

(assert (= (and d!52211 (not c!30699)) b!171633))

(assert (= (and b!171633 c!30700) b!171634))

(assert (= (and b!171633 (not c!30700)) b!171635))

(declare-fun m!200575 () Bool)

(assert (=> b!171634 m!200575))

(assert (=> b!171368 d!52211))

(declare-fun d!52213 () Bool)

(declare-fun lt!85529 () Bool)

(declare-fun content!149 (List!2178) (InoxSet (_ BitVec 64)))

(assert (=> d!52213 (= lt!85529 (select (content!149 Nil!2175) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun e!113268 () Bool)

(assert (=> d!52213 (= lt!85529 e!113268)))

(declare-fun res!81555 () Bool)

(assert (=> d!52213 (=> (not res!81555) (not e!113268))))

(assert (=> d!52213 (= res!81555 ((_ is Cons!2174) Nil!2175))))

(assert (=> d!52213 (= (contains!1142 Nil!2175 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)) lt!85529)))

(declare-fun b!171640 () Bool)

(declare-fun e!113267 () Bool)

(assert (=> b!171640 (= e!113268 e!113267)))

(declare-fun res!81556 () Bool)

(assert (=> b!171640 (=> res!81556 e!113267)))

(assert (=> b!171640 (= res!81556 (= (h!2791 Nil!2175) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun b!171641 () Bool)

(assert (=> b!171641 (= e!113267 (contains!1142 (t!6974 Nil!2175) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(assert (= (and d!52213 res!81555) b!171640))

(assert (= (and b!171640 (not res!81556)) b!171641))

(declare-fun m!200577 () Bool)

(assert (=> d!52213 m!200577))

(assert (=> d!52213 m!199631))

(declare-fun m!200579 () Bool)

(assert (=> d!52213 m!200579))

(assert (=> b!171641 m!199631))

(declare-fun m!200581 () Bool)

(assert (=> b!171641 m!200581))

(assert (=> b!171200 d!52213))

(declare-fun d!52215 () Bool)

(assert (=> d!52215 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187))))

(declare-fun lt!85530 () Unit!5251)

(assert (=> d!52215 (= lt!85530 (choose!931 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187))))

(declare-fun e!113269 () Bool)

(assert (=> d!52215 e!113269))

(declare-fun res!81557 () Bool)

(assert (=> d!52215 (=> (not res!81557) (not e!113269))))

(assert (=> d!52215 (= res!81557 (isStrictlySorted!318 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)))))))

(assert (=> d!52215 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187) lt!85530)))

(declare-fun b!171642 () Bool)

(assert (=> b!171642 (= e!113269 (containsKey!188 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187))))

(assert (= (and d!52215 res!81557) b!171642))

(assert (=> d!52215 m!199887))

(assert (=> d!52215 m!199887))

(assert (=> d!52215 m!199889))

(declare-fun m!200583 () Bool)

(assert (=> d!52215 m!200583))

(declare-fun m!200585 () Bool)

(assert (=> d!52215 m!200585))

(assert (=> b!171642 m!199883))

(assert (=> b!171331 d!52215))

(declare-fun d!52217 () Bool)

(assert (=> d!52217 (= (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187)) (not (isEmpty!440 (getValueByKey!185 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187))))))

(declare-fun bs!7109 () Bool)

(assert (= bs!7109 d!52217))

(assert (=> bs!7109 m!199887))

(declare-fun m!200587 () Bool)

(assert (=> bs!7109 m!200587))

(assert (=> b!171331 d!52217))

(declare-fun b!171644 () Bool)

(declare-fun e!113270 () Option!191)

(declare-fun e!113271 () Option!191)

(assert (=> b!171644 (= e!113270 e!113271)))

(declare-fun c!30702 () Bool)

(assert (=> b!171644 (= c!30702 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)))) (not (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))))) lt!85187))))))

(declare-fun b!171645 () Bool)

(assert (=> b!171645 (= e!113271 (getValueByKey!185 (t!6970 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)))) lt!85187))))

(declare-fun c!30701 () Bool)

(declare-fun d!52219 () Bool)

(assert (=> d!52219 (= c!30701 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)))) (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))))) lt!85187)))))

(assert (=> d!52219 (= (getValueByKey!185 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187) e!113270)))

(declare-fun b!171643 () Bool)

(assert (=> b!171643 (= e!113270 (Some!190 (_2!1610 (h!2789 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)))))))))

(declare-fun b!171646 () Bool)

(assert (=> b!171646 (= e!113271 None!189)))

(assert (= (and d!52219 c!30701) b!171643))

(assert (= (and d!52219 (not c!30701)) b!171644))

(assert (= (and b!171644 c!30702) b!171645))

(assert (= (and b!171644 (not c!30702)) b!171646))

(declare-fun m!200589 () Bool)

(assert (=> b!171645 m!200589))

(assert (=> b!171331 d!52219))

(declare-fun lt!85531 () Bool)

(declare-fun d!52221 () Bool)

(assert (=> d!52221 (= lt!85531 (select (content!148 (toList!1081 lt!85358)) (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))

(declare-fun e!113273 () Bool)

(assert (=> d!52221 (= lt!85531 e!113273)))

(declare-fun res!81558 () Bool)

(assert (=> d!52221 (=> (not res!81558) (not e!113273))))

(assert (=> d!52221 (= res!81558 ((_ is Cons!2172) (toList!1081 lt!85358)))))

(assert (=> d!52221 (= (contains!1141 (toList!1081 lt!85358) (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) lt!85531)))

(declare-fun b!171647 () Bool)

(declare-fun e!113272 () Bool)

(assert (=> b!171647 (= e!113273 e!113272)))

(declare-fun res!81559 () Bool)

(assert (=> b!171647 (=> res!81559 e!113272)))

(assert (=> b!171647 (= res!81559 (= (h!2789 (toList!1081 lt!85358)) (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))

(declare-fun b!171648 () Bool)

(assert (=> b!171648 (= e!113272 (contains!1141 (t!6970 (toList!1081 lt!85358)) (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))

(assert (= (and d!52221 res!81558) b!171647))

(assert (= (and b!171647 (not res!81559)) b!171648))

(declare-fun m!200591 () Bool)

(assert (=> d!52221 m!200591))

(declare-fun m!200593 () Bool)

(assert (=> d!52221 m!200593))

(declare-fun m!200595 () Bool)

(assert (=> b!171648 m!200595))

(assert (=> b!171335 d!52221))

(declare-fun d!52223 () Bool)

(assert (=> d!52223 (= (get!1946 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3912 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171135 d!52223))

(declare-fun d!52225 () Bool)

(assert (=> d!52225 (= (apply!129 lt!85330 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) (get!1945 (getValueByKey!185 (toList!1081 lt!85330) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7110 () Bool)

(assert (= bs!7110 d!52225))

(assert (=> bs!7110 m!199453))

(declare-fun m!200597 () Bool)

(assert (=> bs!7110 m!200597))

(assert (=> bs!7110 m!200597))

(declare-fun m!200599 () Bool)

(assert (=> bs!7110 m!200599))

(assert (=> b!171274 d!52225))

(assert (=> b!171274 d!51877))

(declare-fun d!52227 () Bool)

(assert (=> d!52227 (= (validMask!0 (mask!8382 lt!85094)) (and (or (= (mask!8382 lt!85094) #b00000000000000000000000000000111) (= (mask!8382 lt!85094) #b00000000000000000000000000001111) (= (mask!8382 lt!85094) #b00000000000000000000000000011111) (= (mask!8382 lt!85094) #b00000000000000000000000000111111) (= (mask!8382 lt!85094) #b00000000000000000000000001111111) (= (mask!8382 lt!85094) #b00000000000000000000000011111111) (= (mask!8382 lt!85094) #b00000000000000000000000111111111) (= (mask!8382 lt!85094) #b00000000000000000000001111111111) (= (mask!8382 lt!85094) #b00000000000000000000011111111111) (= (mask!8382 lt!85094) #b00000000000000000000111111111111) (= (mask!8382 lt!85094) #b00000000000000000001111111111111) (= (mask!8382 lt!85094) #b00000000000000000011111111111111) (= (mask!8382 lt!85094) #b00000000000000000111111111111111) (= (mask!8382 lt!85094) #b00000000000000001111111111111111) (= (mask!8382 lt!85094) #b00000000000000011111111111111111) (= (mask!8382 lt!85094) #b00000000000000111111111111111111) (= (mask!8382 lt!85094) #b00000000000001111111111111111111) (= (mask!8382 lt!85094) #b00000000000011111111111111111111) (= (mask!8382 lt!85094) #b00000000000111111111111111111111) (= (mask!8382 lt!85094) #b00000000001111111111111111111111) (= (mask!8382 lt!85094) #b00000000011111111111111111111111) (= (mask!8382 lt!85094) #b00000000111111111111111111111111) (= (mask!8382 lt!85094) #b00000001111111111111111111111111) (= (mask!8382 lt!85094) #b00000011111111111111111111111111) (= (mask!8382 lt!85094) #b00000111111111111111111111111111) (= (mask!8382 lt!85094) #b00001111111111111111111111111111) (= (mask!8382 lt!85094) #b00011111111111111111111111111111) (= (mask!8382 lt!85094) #b00111111111111111111111111111111)) (bvsle (mask!8382 lt!85094) #b00111111111111111111111111111111)))))

(assert (=> d!52015 d!52227))

(declare-fun d!52229 () Bool)

(declare-fun lt!85532 () Bool)

(assert (=> d!52229 (= lt!85532 (select (content!148 (toList!1081 lt!85295)) (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun e!113275 () Bool)

(assert (=> d!52229 (= lt!85532 e!113275)))

(declare-fun res!81560 () Bool)

(assert (=> d!52229 (=> (not res!81560) (not e!113275))))

(assert (=> d!52229 (= res!81560 ((_ is Cons!2172) (toList!1081 lt!85295)))))

(assert (=> d!52229 (= (contains!1141 (toList!1081 lt!85295) (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85532)))

(declare-fun b!171649 () Bool)

(declare-fun e!113274 () Bool)

(assert (=> b!171649 (= e!113275 e!113274)))

(declare-fun res!81561 () Bool)

(assert (=> b!171649 (=> res!81561 e!113274)))

(assert (=> b!171649 (= res!81561 (= (h!2789 (toList!1081 lt!85295)) (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171650 () Bool)

(assert (=> b!171650 (= e!113274 (contains!1141 (t!6970 (toList!1081 lt!85295)) (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (= (and d!52229 res!81560) b!171649))

(assert (= (and b!171649 (not res!81561)) b!171650))

(declare-fun m!200601 () Bool)

(assert (=> d!52229 m!200601))

(declare-fun m!200603 () Bool)

(assert (=> d!52229 m!200603))

(declare-fun m!200605 () Bool)

(assert (=> b!171650 m!200605))

(assert (=> b!171183 d!52229))

(declare-fun d!52231 () Bool)

(declare-fun e!113276 () Bool)

(assert (=> d!52231 e!113276))

(declare-fun res!81562 () Bool)

(assert (=> d!52231 (=> res!81562 e!113276)))

(declare-fun lt!85533 () Bool)

(assert (=> d!52231 (= res!81562 (not lt!85533))))

(declare-fun lt!85535 () Bool)

(assert (=> d!52231 (= lt!85533 lt!85535)))

(declare-fun lt!85536 () Unit!5251)

(declare-fun e!113277 () Unit!5251)

(assert (=> d!52231 (= lt!85536 e!113277)))

(declare-fun c!30703 () Bool)

(assert (=> d!52231 (= c!30703 lt!85535)))

(assert (=> d!52231 (= lt!85535 (containsKey!188 (toList!1081 lt!85248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52231 (= (contains!1139 lt!85248 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85533)))

(declare-fun b!171651 () Bool)

(declare-fun lt!85534 () Unit!5251)

(assert (=> b!171651 (= e!113277 lt!85534)))

(assert (=> b!171651 (= lt!85534 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171651 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171652 () Bool)

(declare-fun Unit!5278 () Unit!5251)

(assert (=> b!171652 (= e!113277 Unit!5278)))

(declare-fun b!171653 () Bool)

(assert (=> b!171653 (= e!113276 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52231 c!30703) b!171651))

(assert (= (and d!52231 (not c!30703)) b!171652))

(assert (= (and d!52231 (not res!81562)) b!171653))

(declare-fun m!200607 () Bool)

(assert (=> d!52231 m!200607))

(declare-fun m!200609 () Bool)

(assert (=> b!171651 m!200609))

(declare-fun m!200611 () Bool)

(assert (=> b!171651 m!200611))

(assert (=> b!171651 m!200611))

(declare-fun m!200613 () Bool)

(assert (=> b!171651 m!200613))

(assert (=> b!171653 m!200611))

(assert (=> b!171653 m!200611))

(assert (=> b!171653 m!200613))

(assert (=> d!51865 d!52231))

(assert (=> d!51865 d!51869))

(declare-fun d!52233 () Bool)

(declare-fun e!113278 () Bool)

(assert (=> d!52233 e!113278))

(declare-fun res!81563 () Bool)

(assert (=> d!52233 (=> res!81563 e!113278)))

(declare-fun lt!85537 () Bool)

(assert (=> d!52233 (= res!81563 (not lt!85537))))

(declare-fun lt!85539 () Bool)

(assert (=> d!52233 (= lt!85537 lt!85539)))

(declare-fun lt!85540 () Unit!5251)

(declare-fun e!113279 () Unit!5251)

(assert (=> d!52233 (= lt!85540 e!113279)))

(declare-fun c!30704 () Bool)

(assert (=> d!52233 (= c!30704 lt!85539)))

(assert (=> d!52233 (= lt!85539 (containsKey!188 (toList!1081 lt!85202) lt!85191))))

(assert (=> d!52233 (= (contains!1139 lt!85202 lt!85191) lt!85537)))

(declare-fun b!171654 () Bool)

(declare-fun lt!85538 () Unit!5251)

(assert (=> b!171654 (= e!113279 lt!85538)))

(assert (=> b!171654 (= lt!85538 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85202) lt!85191))))

(assert (=> b!171654 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85202) lt!85191))))

(declare-fun b!171655 () Bool)

(declare-fun Unit!5279 () Unit!5251)

(assert (=> b!171655 (= e!113279 Unit!5279)))

(declare-fun b!171656 () Bool)

(assert (=> b!171656 (= e!113278 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85202) lt!85191)))))

(assert (= (and d!52233 c!30704) b!171654))

(assert (= (and d!52233 (not c!30704)) b!171655))

(assert (= (and d!52233 (not res!81563)) b!171656))

(declare-fun m!200615 () Bool)

(assert (=> d!52233 m!200615))

(declare-fun m!200617 () Bool)

(assert (=> b!171654 m!200617))

(assert (=> b!171654 m!199935))

(assert (=> b!171654 m!199935))

(declare-fun m!200619 () Bool)

(assert (=> b!171654 m!200619))

(assert (=> b!171656 m!199935))

(assert (=> b!171656 m!199935))

(assert (=> b!171656 m!200619))

(assert (=> d!51955 d!52233))

(assert (=> d!51955 d!51957))

(declare-fun d!52235 () Bool)

(assert (=> d!52235 (= (apply!129 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309)) lt!85191) (apply!129 lt!85202 lt!85191))))

(assert (=> d!52235 true))

(declare-fun _$34!1048 () Unit!5251)

(assert (=> d!52235 (= (choose!932 lt!85202 lt!85200 v!309 lt!85191) _$34!1048)))

(declare-fun bs!7111 () Bool)

(assert (= bs!7111 d!52235))

(assert (=> bs!7111 m!199475))

(assert (=> bs!7111 m!199475))

(assert (=> bs!7111 m!199477))

(assert (=> bs!7111 m!199497))

(assert (=> d!51955 d!52235))

(assert (=> d!51955 d!51961))

(assert (=> d!51955 d!51969))

(declare-fun d!52237 () Bool)

(declare-fun e!113280 () Bool)

(assert (=> d!52237 e!113280))

(declare-fun res!81564 () Bool)

(assert (=> d!52237 (=> res!81564 e!113280)))

(declare-fun lt!85541 () Bool)

(assert (=> d!52237 (= res!81564 (not lt!85541))))

(declare-fun lt!85543 () Bool)

(assert (=> d!52237 (= lt!85541 lt!85543)))

(declare-fun lt!85544 () Unit!5251)

(declare-fun e!113281 () Unit!5251)

(assert (=> d!52237 (= lt!85544 e!113281)))

(declare-fun c!30705 () Bool)

(assert (=> d!52237 (= c!30705 lt!85543)))

(assert (=> d!52237 (= lt!85543 (containsKey!188 (toList!1081 lt!85391) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(assert (=> d!52237 (= (contains!1139 lt!85391 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) lt!85541)))

(declare-fun b!171657 () Bool)

(declare-fun lt!85542 () Unit!5251)

(assert (=> b!171657 (= e!113281 lt!85542)))

(assert (=> b!171657 (= lt!85542 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85391) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(assert (=> b!171657 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85391) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(declare-fun b!171658 () Bool)

(declare-fun Unit!5280 () Unit!5251)

(assert (=> b!171658 (= e!113281 Unit!5280)))

(declare-fun b!171659 () Bool)

(assert (=> b!171659 (= e!113280 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85391) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52237 c!30705) b!171657))

(assert (= (and d!52237 (not c!30705)) b!171658))

(assert (= (and d!52237 (not res!81564)) b!171659))

(declare-fun m!200621 () Bool)

(assert (=> d!52237 m!200621))

(declare-fun m!200623 () Bool)

(assert (=> b!171657 m!200623))

(assert (=> b!171657 m!200013))

(assert (=> b!171657 m!200013))

(declare-fun m!200625 () Bool)

(assert (=> b!171657 m!200625))

(assert (=> b!171659 m!200013))

(assert (=> b!171659 m!200013))

(assert (=> b!171659 m!200625))

(assert (=> d!51985 d!52237))

(declare-fun b!171661 () Bool)

(declare-fun e!113282 () Option!191)

(declare-fun e!113283 () Option!191)

(assert (=> b!171661 (= e!113282 e!113283)))

(declare-fun c!30707 () Bool)

(assert (=> b!171661 (= c!30707 (and ((_ is Cons!2172) lt!85392) (not (= (_1!1610 (h!2789 lt!85392)) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171662 () Bool)

(assert (=> b!171662 (= e!113283 (getValueByKey!185 (t!6970 lt!85392) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(declare-fun d!52239 () Bool)

(declare-fun c!30706 () Bool)

(assert (=> d!52239 (= c!30706 (and ((_ is Cons!2172) lt!85392) (= (_1!1610 (h!2789 lt!85392)) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))))

(assert (=> d!52239 (= (getValueByKey!185 lt!85392 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) e!113282)))

(declare-fun b!171660 () Bool)

(assert (=> b!171660 (= e!113282 (Some!190 (_2!1610 (h!2789 lt!85392))))))

(declare-fun b!171663 () Bool)

(assert (=> b!171663 (= e!113283 None!189)))

(assert (= (and d!52239 c!30706) b!171660))

(assert (= (and d!52239 (not c!30706)) b!171661))

(assert (= (and b!171661 c!30707) b!171662))

(assert (= (and b!171661 (not c!30707)) b!171663))

(declare-fun m!200627 () Bool)

(assert (=> b!171662 m!200627))

(assert (=> d!51985 d!52239))

(declare-fun d!52241 () Bool)

(assert (=> d!52241 (= (getValueByKey!185 lt!85392 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85545 () Unit!5251)

(assert (=> d!52241 (= lt!85545 (choose!930 lt!85392 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(declare-fun e!113284 () Bool)

(assert (=> d!52241 e!113284))

(declare-fun res!81565 () Bool)

(assert (=> d!52241 (=> (not res!81565) (not e!113284))))

(assert (=> d!52241 (= res!81565 (isStrictlySorted!318 lt!85392))))

(assert (=> d!52241 (= (lemmaContainsTupThenGetReturnValue!98 lt!85392 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) lt!85545)))

(declare-fun b!171664 () Bool)

(declare-fun res!81566 () Bool)

(assert (=> b!171664 (=> (not res!81566) (not e!113284))))

(assert (=> b!171664 (= res!81566 (containsKey!188 lt!85392 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(declare-fun b!171665 () Bool)

(assert (=> b!171665 (= e!113284 (contains!1141 lt!85392 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52241 res!81565) b!171664))

(assert (= (and b!171664 res!81566) b!171665))

(assert (=> d!52241 m!200007))

(declare-fun m!200629 () Bool)

(assert (=> d!52241 m!200629))

(declare-fun m!200631 () Bool)

(assert (=> d!52241 m!200631))

(declare-fun m!200633 () Bool)

(assert (=> b!171664 m!200633))

(declare-fun m!200635 () Bool)

(assert (=> b!171665 m!200635))

(assert (=> d!51985 d!52241))

(declare-fun b!171666 () Bool)

(declare-fun e!113287 () List!2176)

(declare-fun call!17462 () List!2176)

(assert (=> b!171666 (= e!113287 call!17462)))

(declare-fun b!171667 () Bool)

(assert (=> b!171667 (= e!113287 call!17462)))

(declare-fun c!30708 () Bool)

(declare-fun b!171668 () Bool)

(assert (=> b!171668 (= c!30708 (and ((_ is Cons!2172) (toList!1081 lt!85226)) (bvsgt (_1!1610 (h!2789 (toList!1081 lt!85226))) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))))

(declare-fun e!113286 () List!2176)

(assert (=> b!171668 (= e!113286 e!113287)))

(declare-fun d!52243 () Bool)

(declare-fun e!113285 () Bool)

(assert (=> d!52243 e!113285))

(declare-fun res!81568 () Bool)

(assert (=> d!52243 (=> (not res!81568) (not e!113285))))

(declare-fun lt!85546 () List!2176)

(assert (=> d!52243 (= res!81568 (isStrictlySorted!318 lt!85546))))

(declare-fun e!113289 () List!2176)

(assert (=> d!52243 (= lt!85546 e!113289)))

(declare-fun c!30709 () Bool)

(assert (=> d!52243 (= c!30709 (and ((_ is Cons!2172) (toList!1081 lt!85226)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85226))) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))))

(assert (=> d!52243 (isStrictlySorted!318 (toList!1081 lt!85226))))

(assert (=> d!52243 (= (insertStrictlySorted!101 (toList!1081 lt!85226) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) lt!85546)))

(declare-fun b!171669 () Bool)

(assert (=> b!171669 (= e!113289 e!113286)))

(declare-fun c!30710 () Bool)

(assert (=> b!171669 (= c!30710 (and ((_ is Cons!2172) (toList!1081 lt!85226)) (= (_1!1610 (h!2789 (toList!1081 lt!85226))) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))))

(declare-fun b!171670 () Bool)

(assert (=> b!171670 (= e!113285 (contains!1141 lt!85546 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))))

(declare-fun b!171671 () Bool)

(declare-fun call!17460 () List!2176)

(assert (=> b!171671 (= e!113286 call!17460)))

(declare-fun e!113288 () List!2176)

(declare-fun b!171672 () Bool)

(assert (=> b!171672 (= e!113288 (ite c!30710 (t!6970 (toList!1081 lt!85226)) (ite c!30708 (Cons!2172 (h!2789 (toList!1081 lt!85226)) (t!6970 (toList!1081 lt!85226))) Nil!2173)))))

(declare-fun bm!17457 () Bool)

(declare-fun call!17461 () List!2176)

(assert (=> bm!17457 (= call!17460 call!17461)))

(declare-fun b!171673 () Bool)

(assert (=> b!171673 (= e!113289 call!17461)))

(declare-fun b!171674 () Bool)

(assert (=> b!171674 (= e!113288 (insertStrictlySorted!101 (t!6970 (toList!1081 lt!85226)) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17458 () Bool)

(assert (=> bm!17458 (= call!17462 call!17460)))

(declare-fun b!171675 () Bool)

(declare-fun res!81567 () Bool)

(assert (=> b!171675 (=> (not res!81567) (not e!113285))))

(assert (=> b!171675 (= res!81567 (containsKey!188 lt!85546 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17459 () Bool)

(assert (=> bm!17459 (= call!17461 ($colon$colon!96 e!113288 (ite c!30709 (h!2789 (toList!1081 lt!85226)) (tuple2!3199 (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30711 () Bool)

(assert (=> bm!17459 (= c!30711 c!30709)))

(assert (= (and d!52243 c!30709) b!171673))

(assert (= (and d!52243 (not c!30709)) b!171669))

(assert (= (and b!171669 c!30710) b!171671))

(assert (= (and b!171669 (not c!30710)) b!171668))

(assert (= (and b!171668 c!30708) b!171666))

(assert (= (and b!171668 (not c!30708)) b!171667))

(assert (= (or b!171666 b!171667) bm!17458))

(assert (= (or b!171671 bm!17458) bm!17457))

(assert (= (or b!171673 bm!17457) bm!17459))

(assert (= (and bm!17459 c!30711) b!171674))

(assert (= (and bm!17459 (not c!30711)) b!171672))

(assert (= (and d!52243 res!81568) b!171675))

(assert (= (and b!171675 res!81567) b!171670))

(declare-fun m!200637 () Bool)

(assert (=> b!171674 m!200637))

(declare-fun m!200639 () Bool)

(assert (=> b!171675 m!200639))

(declare-fun m!200641 () Bool)

(assert (=> d!52243 m!200641))

(declare-fun m!200643 () Bool)

(assert (=> d!52243 m!200643))

(declare-fun m!200645 () Bool)

(assert (=> bm!17459 m!200645))

(declare-fun m!200647 () Bool)

(assert (=> b!171670 m!200647))

(assert (=> d!51985 d!52243))

(declare-fun d!52245 () Bool)

(assert (=> d!52245 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3915 (getValueByKey!185 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51921 d!52245))

(assert (=> d!51921 d!52155))

(declare-fun d!52247 () Bool)

(assert (=> d!52247 (= (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212)) (not (isEmpty!440 (getValueByKey!185 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212))))))

(declare-fun bs!7112 () Bool)

(assert (= bs!7112 d!52247))

(assert (=> bs!7112 m!200069))

(declare-fun m!200649 () Bool)

(assert (=> bs!7112 m!200649))

(assert (=> b!171372 d!52247))

(declare-fun b!171677 () Bool)

(declare-fun e!113290 () Option!191)

(declare-fun e!113291 () Option!191)

(assert (=> b!171677 (= e!113290 e!113291)))

(declare-fun c!30713 () Bool)

(assert (=> b!171677 (= c!30713 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))) (not (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))) lt!85212))))))

(declare-fun b!171678 () Bool)

(assert (=> b!171678 (= e!113291 (getValueByKey!185 (t!6970 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))) lt!85212))))

(declare-fun d!52249 () Bool)

(declare-fun c!30712 () Bool)

(assert (=> d!52249 (= c!30712 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))) (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))) lt!85212)))))

(assert (=> d!52249 (= (getValueByKey!185 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212) e!113290)))

(declare-fun b!171676 () Bool)

(assert (=> b!171676 (= e!113290 (Some!190 (_2!1610 (h!2789 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))))

(declare-fun b!171679 () Bool)

(assert (=> b!171679 (= e!113291 None!189)))

(assert (= (and d!52249 c!30712) b!171676))

(assert (= (and d!52249 (not c!30712)) b!171677))

(assert (= (and b!171677 c!30713) b!171678))

(assert (= (and b!171677 (not c!30713)) b!171679))

(declare-fun m!200651 () Bool)

(assert (=> b!171678 m!200651))

(assert (=> b!171372 d!52249))

(declare-fun d!52251 () Bool)

(declare-fun res!81569 () Bool)

(declare-fun e!113292 () Bool)

(assert (=> d!52251 (=> res!81569 e!113292)))

(assert (=> d!52251 (= res!81569 (and ((_ is Cons!2172) lt!85348) (= (_1!1610 (h!2789 lt!85348)) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(assert (=> d!52251 (= (containsKey!188 lt!85348 (_1!1610 (tuple2!3199 key!828 v!309))) e!113292)))

(declare-fun b!171680 () Bool)

(declare-fun e!113293 () Bool)

(assert (=> b!171680 (= e!113292 e!113293)))

(declare-fun res!81570 () Bool)

(assert (=> b!171680 (=> (not res!81570) (not e!113293))))

(assert (=> b!171680 (= res!81570 (and (or (not ((_ is Cons!2172) lt!85348)) (bvsle (_1!1610 (h!2789 lt!85348)) (_1!1610 (tuple2!3199 key!828 v!309)))) ((_ is Cons!2172) lt!85348) (bvslt (_1!1610 (h!2789 lt!85348)) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun b!171681 () Bool)

(assert (=> b!171681 (= e!113293 (containsKey!188 (t!6970 lt!85348) (_1!1610 (tuple2!3199 key!828 v!309))))))

(assert (= (and d!52251 (not res!81569)) b!171680))

(assert (= (and b!171680 res!81570) b!171681))

(declare-fun m!200653 () Bool)

(assert (=> b!171681 m!200653))

(assert (=> b!171320 d!52251))

(declare-fun d!52253 () Bool)

(assert (=> d!52253 (= (isDefined!137 (getValueByKey!185 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309)))) (not (isEmpty!440 (getValueByKey!185 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))))))))

(declare-fun bs!7113 () Bool)

(assert (= bs!7113 d!52253))

(assert (=> bs!7113 m!199431))

(declare-fun m!200655 () Bool)

(assert (=> bs!7113 m!200655))

(assert (=> b!171304 d!52253))

(assert (=> b!171304 d!51979))

(assert (=> b!171204 d!52045))

(assert (=> bm!17416 d!52185))

(declare-fun d!52255 () Bool)

(declare-fun res!81571 () Bool)

(declare-fun e!113294 () Bool)

(assert (=> d!52255 (=> res!81571 e!113294)))

(assert (=> d!52255 (= res!81571 (and ((_ is Cons!2172) lt!85230) (= (_1!1610 (h!2789 lt!85230)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52255 (= (containsKey!188 lt!85230 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113294)))

(declare-fun b!171682 () Bool)

(declare-fun e!113295 () Bool)

(assert (=> b!171682 (= e!113294 e!113295)))

(declare-fun res!81572 () Bool)

(assert (=> b!171682 (=> (not res!81572) (not e!113295))))

(assert (=> b!171682 (= res!81572 (and (or (not ((_ is Cons!2172) lt!85230)) (bvsle (_1!1610 (h!2789 lt!85230)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2172) lt!85230) (bvslt (_1!1610 (h!2789 lt!85230)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171683 () Bool)

(assert (=> b!171683 (= e!113295 (containsKey!188 (t!6970 lt!85230) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52255 (not res!81571)) b!171682))

(assert (= (and b!171682 res!81572) b!171683))

(declare-fun m!200657 () Bool)

(assert (=> b!171683 m!200657))

(assert (=> b!171224 d!52255))

(assert (=> b!171278 d!51889))

(declare-fun d!52257 () Bool)

(assert (=> d!52257 (= (apply!129 lt!85290 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1945 (getValueByKey!185 (toList!1081 lt!85290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7114 () Bool)

(assert (= bs!7114 d!52257))

(assert (=> bs!7114 m!200377))

(assert (=> bs!7114 m!200377))

(declare-fun m!200659 () Bool)

(assert (=> bs!7114 m!200659))

(assert (=> b!171179 d!52257))

(declare-fun b!171685 () Bool)

(declare-fun e!113296 () Option!191)

(declare-fun e!113297 () Option!191)

(assert (=> b!171685 (= e!113296 e!113297)))

(declare-fun c!30715 () Bool)

(assert (=> b!171685 (= c!30715 (and ((_ is Cons!2172) (t!6970 (toList!1081 lt!85122))) (not (= (_1!1610 (h!2789 (t!6970 (toList!1081 lt!85122)))) (_1!1610 (tuple2!3199 key!828 v!309))))))))

(declare-fun b!171686 () Bool)

(assert (=> b!171686 (= e!113297 (getValueByKey!185 (t!6970 (t!6970 (toList!1081 lt!85122))) (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun d!52259 () Bool)

(declare-fun c!30714 () Bool)

(assert (=> d!52259 (= c!30714 (and ((_ is Cons!2172) (t!6970 (toList!1081 lt!85122))) (= (_1!1610 (h!2789 (t!6970 (toList!1081 lt!85122)))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(assert (=> d!52259 (= (getValueByKey!185 (t!6970 (toList!1081 lt!85122)) (_1!1610 (tuple2!3199 key!828 v!309))) e!113296)))

(declare-fun b!171684 () Bool)

(assert (=> b!171684 (= e!113296 (Some!190 (_2!1610 (h!2789 (t!6970 (toList!1081 lt!85122))))))))

(declare-fun b!171687 () Bool)

(assert (=> b!171687 (= e!113297 None!189)))

(assert (= (and d!52259 c!30714) b!171684))

(assert (= (and d!52259 (not c!30714)) b!171685))

(assert (= (and b!171685 c!30715) b!171686))

(assert (= (and b!171685 (not c!30715)) b!171687))

(declare-fun m!200661 () Bool)

(assert (=> b!171686 m!200661))

(assert (=> b!171358 d!52259))

(declare-fun d!52261 () Bool)

(declare-fun lt!85547 () Bool)

(assert (=> d!52261 (= lt!85547 (select (content!149 Nil!2175) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113299 () Bool)

(assert (=> d!52261 (= lt!85547 e!113299)))

(declare-fun res!81573 () Bool)

(assert (=> d!52261 (=> (not res!81573) (not e!113299))))

(assert (=> d!52261 (= res!81573 ((_ is Cons!2174) Nil!2175))))

(assert (=> d!52261 (= (contains!1142 Nil!2175 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) lt!85547)))

(declare-fun b!171688 () Bool)

(declare-fun e!113298 () Bool)

(assert (=> b!171688 (= e!113299 e!113298)))

(declare-fun res!81574 () Bool)

(assert (=> b!171688 (=> res!81574 e!113298)))

(assert (=> b!171688 (= res!81574 (= (h!2791 Nil!2175) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171689 () Bool)

(assert (=> b!171689 (= e!113298 (contains!1142 (t!6974 Nil!2175) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52261 res!81573) b!171688))

(assert (= (and b!171688 (not res!81574)) b!171689))

(assert (=> d!52261 m!200577))

(assert (=> d!52261 m!199453))

(declare-fun m!200663 () Bool)

(assert (=> d!52261 m!200663))

(assert (=> b!171689 m!199453))

(declare-fun m!200665 () Bool)

(assert (=> b!171689 m!200665))

(assert (=> b!171321 d!52261))

(declare-fun d!52263 () Bool)

(assert (=> d!52263 (= (isEmpty!440 (getValueByKey!185 (toList!1081 lt!85093) key!828)) (not ((_ is Some!190) (getValueByKey!185 (toList!1081 lt!85093) key!828))))))

(assert (=> d!51925 d!52263))

(declare-fun d!52265 () Bool)

(declare-fun lt!85548 () Bool)

(assert (=> d!52265 (= lt!85548 (select (content!148 lt!85316) (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!113301 () Bool)

(assert (=> d!52265 (= lt!85548 e!113301)))

(declare-fun res!81575 () Bool)

(assert (=> d!52265 (=> (not res!81575) (not e!113301))))

(assert (=> d!52265 (= res!81575 ((_ is Cons!2172) lt!85316))))

(assert (=> d!52265 (= (contains!1141 lt!85316 (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!85548)))

(declare-fun b!171690 () Bool)

(declare-fun e!113300 () Bool)

(assert (=> b!171690 (= e!113301 e!113300)))

(declare-fun res!81576 () Bool)

(assert (=> b!171690 (=> res!81576 e!113300)))

(assert (=> b!171690 (= res!81576 (= (h!2789 lt!85316) (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171691 () Bool)

(assert (=> b!171691 (= e!113300 (contains!1141 (t!6970 lt!85316) (tuple2!3199 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52265 res!81575) b!171690))

(assert (= (and b!171690 (not res!81576)) b!171691))

(declare-fun m!200667 () Bool)

(assert (=> d!52265 m!200667))

(declare-fun m!200669 () Bool)

(assert (=> d!52265 m!200669))

(declare-fun m!200671 () Bool)

(assert (=> b!171691 m!200671))

(assert (=> b!171250 d!52265))

(declare-fun d!52267 () Bool)

(declare-fun lt!85549 () Bool)

(assert (=> d!52267 (= lt!85549 (select (content!148 (toList!1081 lt!85397)) (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))

(declare-fun e!113303 () Bool)

(assert (=> d!52267 (= lt!85549 e!113303)))

(declare-fun res!81577 () Bool)

(assert (=> d!52267 (=> (not res!81577) (not e!113303))))

(assert (=> d!52267 (= res!81577 ((_ is Cons!2172) (toList!1081 lt!85397)))))

(assert (=> d!52267 (= (contains!1141 (toList!1081 lt!85397) (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) lt!85549)))

(declare-fun b!171692 () Bool)

(declare-fun e!113302 () Bool)

(assert (=> b!171692 (= e!113303 e!113302)))

(declare-fun res!81578 () Bool)

(assert (=> b!171692 (=> res!81578 e!113302)))

(assert (=> b!171692 (= res!81578 (= (h!2789 (toList!1081 lt!85397)) (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))

(declare-fun b!171693 () Bool)

(assert (=> b!171693 (= e!113302 (contains!1141 (t!6970 (toList!1081 lt!85397)) (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))

(assert (= (and d!52267 res!81577) b!171692))

(assert (= (and b!171692 (not res!81578)) b!171693))

(declare-fun m!200673 () Bool)

(assert (=> d!52267 m!200673))

(declare-fun m!200675 () Bool)

(assert (=> d!52267 m!200675))

(declare-fun m!200677 () Bool)

(assert (=> b!171693 m!200677))

(assert (=> b!171367 d!52267))

(declare-fun b!171695 () Bool)

(declare-fun e!113304 () Option!191)

(declare-fun e!113305 () Option!191)

(assert (=> b!171695 (= e!113304 e!113305)))

(declare-fun c!30717 () Bool)

(assert (=> b!171695 (= c!30717 (and ((_ is Cons!2172) (toList!1081 lt!85391)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85391))) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171696 () Bool)

(assert (=> b!171696 (= e!113305 (getValueByKey!185 (t!6970 (toList!1081 lt!85391)) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))))))

(declare-fun d!52269 () Bool)

(declare-fun c!30716 () Bool)

(assert (=> d!52269 (= c!30716 (and ((_ is Cons!2172) (toList!1081 lt!85391)) (= (_1!1610 (h!2789 (toList!1081 lt!85391))) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))))))))

(assert (=> d!52269 (= (getValueByKey!185 (toList!1081 lt!85391) (_1!1610 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248)))) e!113304)))

(declare-fun b!171694 () Bool)

(assert (=> b!171694 (= e!113304 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85391)))))))

(declare-fun b!171697 () Bool)

(assert (=> b!171697 (= e!113305 None!189)))

(assert (= (and d!52269 c!30716) b!171694))

(assert (= (and d!52269 (not c!30716)) b!171695))

(assert (= (and b!171695 c!30717) b!171696))

(assert (= (and b!171695 (not c!30717)) b!171697))

(declare-fun m!200679 () Bool)

(assert (=> b!171696 m!200679))

(assert (=> b!171363 d!52269))

(declare-fun d!52271 () Bool)

(assert (=> d!52271 (= (apply!129 lt!85248 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) (get!1945 (getValueByKey!185 (toList!1081 lt!85248) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7115 () Bool)

(assert (= bs!7115 d!52271))

(assert (=> bs!7115 m!199453))

(declare-fun m!200681 () Bool)

(assert (=> bs!7115 m!200681))

(assert (=> bs!7115 m!200681))

(declare-fun m!200683 () Bool)

(assert (=> bs!7115 m!200683))

(assert (=> b!171116 d!52271))

(assert (=> b!171116 d!51877))

(declare-fun d!52273 () Bool)

(declare-fun e!113306 () Bool)

(assert (=> d!52273 e!113306))

(declare-fun res!81579 () Bool)

(assert (=> d!52273 (=> res!81579 e!113306)))

(declare-fun lt!85550 () Bool)

(assert (=> d!52273 (= res!81579 (not lt!85550))))

(declare-fun lt!85552 () Bool)

(assert (=> d!52273 (= lt!85550 lt!85552)))

(declare-fun lt!85553 () Unit!5251)

(declare-fun e!113307 () Unit!5251)

(assert (=> d!52273 (= lt!85553 e!113307)))

(declare-fun c!30718 () Bool)

(assert (=> d!52273 (= c!30718 lt!85552)))

(assert (=> d!52273 (= lt!85552 (containsKey!188 (toList!1081 lt!85401) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(assert (=> d!52273 (= (contains!1139 lt!85401 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85550)))

(declare-fun b!171698 () Bool)

(declare-fun lt!85551 () Unit!5251)

(assert (=> b!171698 (= e!113307 lt!85551)))

(assert (=> b!171698 (= lt!85551 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85401) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(assert (=> b!171698 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85401) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171699 () Bool)

(declare-fun Unit!5281 () Unit!5251)

(assert (=> b!171699 (= e!113307 Unit!5281)))

(declare-fun b!171700 () Bool)

(assert (=> b!171700 (= e!113306 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85401) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))

(assert (= (and d!52273 c!30718) b!171698))

(assert (= (and d!52273 (not c!30718)) b!171699))

(assert (= (and d!52273 (not res!81579)) b!171700))

(declare-fun m!200685 () Bool)

(assert (=> d!52273 m!200685))

(declare-fun m!200687 () Bool)

(assert (=> b!171698 m!200687))

(assert (=> b!171698 m!200061))

(assert (=> b!171698 m!200061))

(declare-fun m!200689 () Bool)

(assert (=> b!171698 m!200689))

(assert (=> b!171700 m!200061))

(assert (=> b!171700 m!200061))

(assert (=> b!171700 m!200689))

(assert (=> d!52001 d!52273))

(declare-fun b!171702 () Bool)

(declare-fun e!113308 () Option!191)

(declare-fun e!113309 () Option!191)

(assert (=> b!171702 (= e!113308 e!113309)))

(declare-fun c!30720 () Bool)

(assert (=> b!171702 (= c!30720 (and ((_ is Cons!2172) lt!85402) (not (= (_1!1610 (h!2789 lt!85402)) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))))

(declare-fun b!171703 () Bool)

(assert (=> b!171703 (= e!113309 (getValueByKey!185 (t!6970 lt!85402) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(declare-fun c!30719 () Bool)

(declare-fun d!52275 () Bool)

(assert (=> d!52275 (= c!30719 (and ((_ is Cons!2172) lt!85402) (= (_1!1610 (h!2789 lt!85402)) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52275 (= (getValueByKey!185 lt!85402 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) e!113308)))

(declare-fun b!171701 () Bool)

(assert (=> b!171701 (= e!113308 (Some!190 (_2!1610 (h!2789 lt!85402))))))

(declare-fun b!171704 () Bool)

(assert (=> b!171704 (= e!113309 None!189)))

(assert (= (and d!52275 c!30719) b!171701))

(assert (= (and d!52275 (not c!30719)) b!171702))

(assert (= (and b!171702 c!30720) b!171703))

(assert (= (and b!171702 (not c!30720)) b!171704))

(declare-fun m!200691 () Bool)

(assert (=> b!171703 m!200691))

(assert (=> d!52001 d!52275))

(declare-fun d!52277 () Bool)

(assert (=> d!52277 (= (getValueByKey!185 lt!85402 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(declare-fun lt!85554 () Unit!5251)

(assert (=> d!52277 (= lt!85554 (choose!930 lt!85402 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(declare-fun e!113310 () Bool)

(assert (=> d!52277 e!113310))

(declare-fun res!81580 () Bool)

(assert (=> d!52277 (=> (not res!81580) (not e!113310))))

(assert (=> d!52277 (= res!81580 (isStrictlySorted!318 lt!85402))))

(assert (=> d!52277 (= (lemmaContainsTupThenGetReturnValue!98 lt!85402 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85554)))

(declare-fun b!171705 () Bool)

(declare-fun res!81581 () Bool)

(assert (=> b!171705 (=> (not res!81581) (not e!113310))))

(assert (=> b!171705 (= res!81581 (containsKey!188 lt!85402 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(declare-fun b!171706 () Bool)

(assert (=> b!171706 (= e!113310 (contains!1141 lt!85402 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))

(assert (= (and d!52277 res!81580) b!171705))

(assert (= (and b!171705 res!81581) b!171706))

(assert (=> d!52277 m!200055))

(declare-fun m!200693 () Bool)

(assert (=> d!52277 m!200693))

(declare-fun m!200695 () Bool)

(assert (=> d!52277 m!200695))

(declare-fun m!200697 () Bool)

(assert (=> b!171705 m!200697))

(declare-fun m!200699 () Bool)

(assert (=> b!171706 m!200699))

(assert (=> d!52001 d!52277))

(declare-fun b!171707 () Bool)

(declare-fun e!113313 () List!2176)

(declare-fun call!17465 () List!2176)

(assert (=> b!171707 (= e!113313 call!17465)))

(declare-fun b!171708 () Bool)

(assert (=> b!171708 (= e!113313 call!17465)))

(declare-fun b!171709 () Bool)

(declare-fun c!30721 () Bool)

(assert (=> b!171709 (= c!30721 (and ((_ is Cons!2172) (toList!1081 lt!85223)) (bvsgt (_1!1610 (h!2789 (toList!1081 lt!85223))) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))

(declare-fun e!113312 () List!2176)

(assert (=> b!171709 (= e!113312 e!113313)))

(declare-fun d!52279 () Bool)

(declare-fun e!113311 () Bool)

(assert (=> d!52279 e!113311))

(declare-fun res!81583 () Bool)

(assert (=> d!52279 (=> (not res!81583) (not e!113311))))

(declare-fun lt!85555 () List!2176)

(assert (=> d!52279 (= res!81583 (isStrictlySorted!318 lt!85555))))

(declare-fun e!113315 () List!2176)

(assert (=> d!52279 (= lt!85555 e!113315)))

(declare-fun c!30722 () Bool)

(assert (=> d!52279 (= c!30722 (and ((_ is Cons!2172) (toList!1081 lt!85223)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85223))) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52279 (isStrictlySorted!318 (toList!1081 lt!85223))))

(assert (=> d!52279 (= (insertStrictlySorted!101 (toList!1081 lt!85223) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85555)))

(declare-fun b!171710 () Bool)

(assert (=> b!171710 (= e!113315 e!113312)))

(declare-fun c!30723 () Bool)

(assert (=> b!171710 (= c!30723 (and ((_ is Cons!2172) (toList!1081 lt!85223)) (= (_1!1610 (h!2789 (toList!1081 lt!85223))) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))

(declare-fun b!171711 () Bool)

(assert (=> b!171711 (= e!113311 (contains!1141 lt!85555 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))

(declare-fun b!171712 () Bool)

(declare-fun call!17463 () List!2176)

(assert (=> b!171712 (= e!113312 call!17463)))

(declare-fun b!171713 () Bool)

(declare-fun e!113314 () List!2176)

(assert (=> b!171713 (= e!113314 (ite c!30723 (t!6970 (toList!1081 lt!85223)) (ite c!30721 (Cons!2172 (h!2789 (toList!1081 lt!85223)) (t!6970 (toList!1081 lt!85223))) Nil!2173)))))

(declare-fun bm!17460 () Bool)

(declare-fun call!17464 () List!2176)

(assert (=> bm!17460 (= call!17463 call!17464)))

(declare-fun b!171714 () Bool)

(assert (=> b!171714 (= e!113315 call!17464)))

(declare-fun b!171715 () Bool)

(assert (=> b!171715 (= e!113314 (insertStrictlySorted!101 (t!6970 (toList!1081 lt!85223)) (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(declare-fun bm!17461 () Bool)

(assert (=> bm!17461 (= call!17465 call!17463)))

(declare-fun b!171716 () Bool)

(declare-fun res!81582 () Bool)

(assert (=> b!171716 (=> (not res!81582) (not e!113311))))

(assert (=> b!171716 (= res!81582 (containsKey!188 lt!85555 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))

(declare-fun bm!17462 () Bool)

(assert (=> bm!17462 (= call!17464 ($colon$colon!96 e!113314 (ite c!30722 (h!2789 (toList!1081 lt!85223)) (tuple2!3199 (_1!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))))))

(declare-fun c!30724 () Bool)

(assert (=> bm!17462 (= c!30724 c!30722)))

(assert (= (and d!52279 c!30722) b!171714))

(assert (= (and d!52279 (not c!30722)) b!171710))

(assert (= (and b!171710 c!30723) b!171712))

(assert (= (and b!171710 (not c!30723)) b!171709))

(assert (= (and b!171709 c!30721) b!171707))

(assert (= (and b!171709 (not c!30721)) b!171708))

(assert (= (or b!171707 b!171708) bm!17461))

(assert (= (or b!171712 bm!17461) bm!17460))

(assert (= (or b!171714 bm!17460) bm!17462))

(assert (= (and bm!17462 c!30724) b!171715))

(assert (= (and bm!17462 (not c!30724)) b!171713))

(assert (= (and d!52279 res!81583) b!171716))

(assert (= (and b!171716 res!81582) b!171711))

(declare-fun m!200701 () Bool)

(assert (=> b!171715 m!200701))

(declare-fun m!200703 () Bool)

(assert (=> b!171716 m!200703))

(declare-fun m!200705 () Bool)

(assert (=> d!52279 m!200705))

(declare-fun m!200707 () Bool)

(assert (=> d!52279 m!200707))

(declare-fun m!200709 () Bool)

(assert (=> bm!17462 m!200709))

(declare-fun m!200711 () Bool)

(assert (=> b!171711 m!200711))

(assert (=> d!52001 d!52279))

(declare-fun d!52281 () Bool)

(declare-fun res!81584 () Bool)

(declare-fun e!113316 () Bool)

(assert (=> d!52281 (=> res!81584 e!113316)))

(assert (=> d!52281 (= res!81584 (and ((_ is Cons!2172) lt!85123) (= (_1!1610 (h!2789 lt!85123)) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(assert (=> d!52281 (= (containsKey!188 lt!85123 (_1!1610 (tuple2!3199 key!828 v!309))) e!113316)))

(declare-fun b!171717 () Bool)

(declare-fun e!113317 () Bool)

(assert (=> b!171717 (= e!113316 e!113317)))

(declare-fun res!81585 () Bool)

(assert (=> b!171717 (=> (not res!81585) (not e!113317))))

(assert (=> b!171717 (= res!81585 (and (or (not ((_ is Cons!2172) lt!85123)) (bvsle (_1!1610 (h!2789 lt!85123)) (_1!1610 (tuple2!3199 key!828 v!309)))) ((_ is Cons!2172) lt!85123) (bvslt (_1!1610 (h!2789 lt!85123)) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun b!171718 () Bool)

(assert (=> b!171718 (= e!113317 (containsKey!188 (t!6970 lt!85123) (_1!1610 (tuple2!3199 key!828 v!309))))))

(assert (= (and d!52281 (not res!81584)) b!171717))

(assert (= (and b!171717 res!81585) b!171718))

(declare-fun m!200713 () Bool)

(assert (=> b!171718 m!200713))

(assert (=> b!171309 d!52281))

(assert (=> d!51951 d!51947))

(declare-fun d!52283 () Bool)

(declare-fun e!113318 () Bool)

(assert (=> d!52283 e!113318))

(declare-fun res!81586 () Bool)

(assert (=> d!52283 (=> res!81586 e!113318)))

(declare-fun lt!85556 () Bool)

(assert (=> d!52283 (= res!81586 (not lt!85556))))

(declare-fun lt!85558 () Bool)

(assert (=> d!52283 (= lt!85556 lt!85558)))

(declare-fun lt!85559 () Unit!5251)

(declare-fun e!113319 () Unit!5251)

(assert (=> d!52283 (= lt!85559 e!113319)))

(declare-fun c!30725 () Bool)

(assert (=> d!52283 (= c!30725 lt!85558)))

(assert (=> d!52283 (= lt!85558 (containsKey!188 (toList!1081 lt!85201) lt!85185))))

(assert (=> d!52283 (= (contains!1139 lt!85201 lt!85185) lt!85556)))

(declare-fun b!171719 () Bool)

(declare-fun lt!85557 () Unit!5251)

(assert (=> b!171719 (= e!113319 lt!85557)))

(assert (=> b!171719 (= lt!85557 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85201) lt!85185))))

(assert (=> b!171719 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85201) lt!85185))))

(declare-fun b!171720 () Bool)

(declare-fun Unit!5282 () Unit!5251)

(assert (=> b!171720 (= e!113319 Unit!5282)))

(declare-fun b!171721 () Bool)

(assert (=> b!171721 (= e!113318 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85201) lt!85185)))))

(assert (= (and d!52283 c!30725) b!171719))

(assert (= (and d!52283 (not c!30725)) b!171720))

(assert (= (and d!52283 (not res!81586)) b!171721))

(declare-fun m!200715 () Bool)

(assert (=> d!52283 m!200715))

(declare-fun m!200717 () Bool)

(assert (=> b!171719 m!200717))

(assert (=> b!171719 m!199931))

(assert (=> b!171719 m!199931))

(declare-fun m!200719 () Bool)

(assert (=> b!171719 m!200719))

(assert (=> b!171721 m!199931))

(assert (=> b!171721 m!199931))

(assert (=> b!171721 m!200719))

(assert (=> d!51951 d!52283))

(assert (=> d!51951 d!51959))

(declare-fun d!52285 () Bool)

(assert (=> d!52285 (= (apply!129 (+!243 lt!85201 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) lt!85185) (apply!129 lt!85201 lt!85185))))

(assert (=> d!52285 true))

(declare-fun _$34!1049 () Unit!5251)

(assert (=> d!52285 (= (choose!932 lt!85201 lt!85203 (minValue!3397 thiss!1248) lt!85185) _$34!1049)))

(declare-fun bs!7116 () Bool)

(assert (= bs!7116 d!52285))

(assert (=> bs!7116 m!199483))

(assert (=> bs!7116 m!199483))

(assert (=> bs!7116 m!199485))

(assert (=> bs!7116 m!199487))

(assert (=> d!51951 d!52285))

(assert (=> d!51951 d!51971))

(declare-fun d!52287 () Bool)

(declare-fun e!113320 () Bool)

(assert (=> d!52287 e!113320))

(declare-fun res!81587 () Bool)

(assert (=> d!52287 (=> res!81587 e!113320)))

(declare-fun lt!85560 () Bool)

(assert (=> d!52287 (= res!81587 (not lt!85560))))

(declare-fun lt!85562 () Bool)

(assert (=> d!52287 (= lt!85560 lt!85562)))

(declare-fun lt!85563 () Unit!5251)

(declare-fun e!113321 () Unit!5251)

(assert (=> d!52287 (= lt!85563 e!113321)))

(declare-fun c!30726 () Bool)

(assert (=> d!52287 (= c!30726 lt!85562)))

(assert (=> d!52287 (= lt!85562 (containsKey!188 (toList!1081 lt!85330) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52287 (= (contains!1139 lt!85330 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85560)))

(declare-fun b!171722 () Bool)

(declare-fun lt!85561 () Unit!5251)

(assert (=> b!171722 (= e!113321 lt!85561)))

(assert (=> b!171722 (= lt!85561 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85330) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171722 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85330) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171723 () Bool)

(declare-fun Unit!5283 () Unit!5251)

(assert (=> b!171723 (= e!113321 Unit!5283)))

(declare-fun b!171724 () Bool)

(assert (=> b!171724 (= e!113320 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85330) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52287 c!30726) b!171722))

(assert (= (and d!52287 (not c!30726)) b!171723))

(assert (= (and d!52287 (not res!81587)) b!171724))

(declare-fun m!200721 () Bool)

(assert (=> d!52287 m!200721))

(declare-fun m!200723 () Bool)

(assert (=> b!171722 m!200723))

(declare-fun m!200725 () Bool)

(assert (=> b!171722 m!200725))

(assert (=> b!171722 m!200725))

(declare-fun m!200727 () Bool)

(assert (=> b!171722 m!200727))

(assert (=> b!171724 m!200725))

(assert (=> b!171724 m!200725))

(assert (=> b!171724 m!200727))

(assert (=> d!51915 d!52287))

(assert (=> d!51915 d!51869))

(declare-fun d!52289 () Bool)

(declare-fun e!113322 () Bool)

(assert (=> d!52289 e!113322))

(declare-fun res!81588 () Bool)

(assert (=> d!52289 (=> res!81588 e!113322)))

(declare-fun lt!85564 () Bool)

(assert (=> d!52289 (= res!81588 (not lt!85564))))

(declare-fun lt!85566 () Bool)

(assert (=> d!52289 (= lt!85564 lt!85566)))

(declare-fun lt!85567 () Unit!5251)

(declare-fun e!113323 () Unit!5251)

(assert (=> d!52289 (= lt!85567 e!113323)))

(declare-fun c!30727 () Bool)

(assert (=> d!52289 (= c!30727 lt!85566)))

(assert (=> d!52289 (= lt!85566 (containsKey!188 (toList!1081 lt!85248) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52289 (= (contains!1139 lt!85248 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) lt!85564)))

(declare-fun b!171725 () Bool)

(declare-fun lt!85565 () Unit!5251)

(assert (=> b!171725 (= e!113323 lt!85565)))

(assert (=> b!171725 (= lt!85565 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85248) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171725 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85248) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171726 () Bool)

(declare-fun Unit!5284 () Unit!5251)

(assert (=> b!171726 (= e!113323 Unit!5284)))

(declare-fun b!171727 () Bool)

(assert (=> b!171727 (= e!113322 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85248) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52289 c!30727) b!171725))

(assert (= (and d!52289 (not c!30727)) b!171726))

(assert (= (and d!52289 (not res!81588)) b!171727))

(assert (=> d!52289 m!199453))

(declare-fun m!200729 () Bool)

(assert (=> d!52289 m!200729))

(assert (=> b!171725 m!199453))

(declare-fun m!200731 () Bool)

(assert (=> b!171725 m!200731))

(assert (=> b!171725 m!199453))

(assert (=> b!171725 m!200681))

(assert (=> b!171725 m!200681))

(declare-fun m!200733 () Bool)

(assert (=> b!171725 m!200733))

(assert (=> b!171727 m!199453))

(assert (=> b!171727 m!200681))

(assert (=> b!171727 m!200681))

(assert (=> b!171727 m!200733))

(assert (=> b!171119 d!52289))

(declare-fun b!171728 () Bool)

(declare-fun e!113325 () Bool)

(assert (=> b!171728 (= e!113325 (contains!1142 (ite c!30609 (Cons!2174 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) Nil!2175) Nil!2175) (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171729 () Bool)

(declare-fun e!113326 () Bool)

(declare-fun call!17466 () Bool)

(assert (=> b!171729 (= e!113326 call!17466)))

(declare-fun b!171730 () Bool)

(assert (=> b!171730 (= e!113326 call!17466)))

(declare-fun bm!17463 () Bool)

(declare-fun c!30728 () Bool)

(assert (=> bm!17463 (= call!17466 (arrayNoDuplicates!0 (_keys!5386 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!30728 (Cons!2174 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30609 (Cons!2174 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) Nil!2175) Nil!2175)) (ite c!30609 (Cons!2174 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) Nil!2175) Nil!2175))))))

(declare-fun d!52291 () Bool)

(declare-fun res!81590 () Bool)

(declare-fun e!113327 () Bool)

(assert (=> d!52291 (=> res!81590 e!113327)))

(assert (=> d!52291 (= res!81590 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!52291 (= (arrayNoDuplicates!0 (_keys!5386 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30609 (Cons!2174 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) Nil!2175) Nil!2175)) e!113327)))

(declare-fun b!171731 () Bool)

(declare-fun e!113324 () Bool)

(assert (=> b!171731 (= e!113324 e!113326)))

(assert (=> b!171731 (= c!30728 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171732 () Bool)

(assert (=> b!171732 (= e!113327 e!113324)))

(declare-fun res!81589 () Bool)

(assert (=> b!171732 (=> (not res!81589) (not e!113324))))

(assert (=> b!171732 (= res!81589 (not e!113325))))

(declare-fun res!81591 () Bool)

(assert (=> b!171732 (=> (not res!81591) (not e!113325))))

(assert (=> b!171732 (= res!81591 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!52291 (not res!81590)) b!171732))

(assert (= (and b!171732 res!81591) b!171728))

(assert (= (and b!171732 res!81589) b!171731))

(assert (= (and b!171731 c!30728) b!171729))

(assert (= (and b!171731 (not c!30728)) b!171730))

(assert (= (or b!171729 b!171730) bm!17463))

(assert (=> b!171728 m!200319))

(assert (=> b!171728 m!200319))

(declare-fun m!200735 () Bool)

(assert (=> b!171728 m!200735))

(assert (=> bm!17463 m!200319))

(declare-fun m!200737 () Bool)

(assert (=> bm!17463 m!200737))

(assert (=> b!171731 m!200319))

(assert (=> b!171731 m!200319))

(assert (=> b!171731 m!200321))

(assert (=> b!171732 m!200319))

(assert (=> b!171732 m!200319))

(assert (=> b!171732 m!200321))

(assert (=> bm!17437 d!52291))

(declare-fun d!52293 () Bool)

(declare-fun res!81592 () Bool)

(declare-fun e!113328 () Bool)

(assert (=> d!52293 (=> res!81592 e!113328)))

(assert (=> d!52293 (= res!81592 (and ((_ is Cons!2172) (toList!1081 lt!85229)) (= (_1!1610 (h!2789 (toList!1081 lt!85229))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52293 (= (containsKey!188 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113328)))

(declare-fun b!171733 () Bool)

(declare-fun e!113329 () Bool)

(assert (=> b!171733 (= e!113328 e!113329)))

(declare-fun res!81593 () Bool)

(assert (=> b!171733 (=> (not res!81593) (not e!113329))))

(assert (=> b!171733 (= res!81593 (and (or (not ((_ is Cons!2172) (toList!1081 lt!85229))) (bvsle (_1!1610 (h!2789 (toList!1081 lt!85229))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2172) (toList!1081 lt!85229)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85229))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171734 () Bool)

(assert (=> b!171734 (= e!113329 (containsKey!188 (t!6970 (toList!1081 lt!85229)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52293 (not res!81592)) b!171733))

(assert (= (and b!171733 res!81593) b!171734))

(declare-fun m!200739 () Bool)

(assert (=> b!171734 m!200739))

(assert (=> d!51899 d!52293))

(declare-fun b!171735 () Bool)

(declare-fun e!113335 () Bool)

(declare-fun e!113333 () Bool)

(assert (=> b!171735 (= e!113335 e!113333)))

(declare-fun c!30731 () Bool)

(assert (=> b!171735 (= c!30731 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171736 () Bool)

(declare-fun lt!85569 () ListLongMap!2131)

(assert (=> b!171736 (= e!113333 (= lt!85569 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248))))))

(declare-fun b!171737 () Bool)

(declare-fun e!113330 () ListLongMap!2131)

(declare-fun call!17467 () ListLongMap!2131)

(assert (=> b!171737 (= e!113330 call!17467)))

(declare-fun d!52295 () Bool)

(declare-fun e!113336 () Bool)

(assert (=> d!52295 e!113336))

(declare-fun res!81594 () Bool)

(assert (=> d!52295 (=> (not res!81594) (not e!113336))))

(assert (=> d!52295 (= res!81594 (not (contains!1139 lt!85569 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!113332 () ListLongMap!2131)

(assert (=> d!52295 (= lt!85569 e!113332)))

(declare-fun c!30730 () Bool)

(assert (=> d!52295 (= c!30730 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!52295 (validMask!0 (mask!8382 thiss!1248))))

(assert (=> d!52295 (= (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)) lt!85569)))

(declare-fun b!171738 () Bool)

(assert (=> b!171738 (= e!113336 e!113335)))

(declare-fun c!30729 () Bool)

(declare-fun e!113331 () Bool)

(assert (=> b!171738 (= c!30729 e!113331)))

(declare-fun res!81597 () Bool)

(assert (=> b!171738 (=> (not res!81597) (not e!113331))))

(assert (=> b!171738 (= res!81597 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171739 () Bool)

(assert (=> b!171739 (= e!113331 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171739 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!171740 () Bool)

(declare-fun res!81595 () Bool)

(assert (=> b!171740 (=> (not res!81595) (not e!113336))))

(assert (=> b!171740 (= res!81595 (not (contains!1139 lt!85569 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171741 () Bool)

(assert (=> b!171741 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> b!171741 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3674 (_values!3537 thiss!1248))))))

(declare-fun e!113334 () Bool)

(assert (=> b!171741 (= e!113334 (= (apply!129 lt!85569 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171742 () Bool)

(assert (=> b!171742 (= e!113332 (ListLongMap!2132 Nil!2173))))

(declare-fun b!171743 () Bool)

(declare-fun lt!85568 () Unit!5251)

(declare-fun lt!85573 () Unit!5251)

(assert (=> b!171743 (= lt!85568 lt!85573)))

(declare-fun lt!85572 () (_ BitVec 64))

(declare-fun lt!85574 () V!4985)

(declare-fun lt!85570 () ListLongMap!2131)

(declare-fun lt!85571 () (_ BitVec 64))

(assert (=> b!171743 (not (contains!1139 (+!243 lt!85570 (tuple2!3199 lt!85571 lt!85574)) lt!85572))))

(assert (=> b!171743 (= lt!85573 (addStillNotContains!73 lt!85570 lt!85571 lt!85574 lt!85572))))

(assert (=> b!171743 (= lt!85572 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171743 (= lt!85574 (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171743 (= lt!85571 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!171743 (= lt!85570 call!17467)))

(assert (=> b!171743 (= e!113330 (+!243 call!17467 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!171744 () Bool)

(assert (=> b!171744 (= e!113335 e!113334)))

(assert (=> b!171744 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun res!81596 () Bool)

(assert (=> b!171744 (= res!81596 (contains!1139 lt!85569 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171744 (=> (not res!81596) (not e!113334))))

(declare-fun bm!17464 () Bool)

(assert (=> bm!17464 (= call!17467 (getCurrentListMapNoExtraKeys!160 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3554 thiss!1248)))))

(declare-fun b!171745 () Bool)

(assert (=> b!171745 (= e!113332 e!113330)))

(declare-fun c!30732 () Bool)

(assert (=> b!171745 (= c!30732 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171746 () Bool)

(assert (=> b!171746 (= e!113333 (isEmpty!439 lt!85569))))

(assert (= (and d!52295 c!30730) b!171742))

(assert (= (and d!52295 (not c!30730)) b!171745))

(assert (= (and b!171745 c!30732) b!171743))

(assert (= (and b!171745 (not c!30732)) b!171737))

(assert (= (or b!171743 b!171737) bm!17464))

(assert (= (and d!52295 res!81594) b!171740))

(assert (= (and b!171740 res!81595) b!171738))

(assert (= (and b!171738 res!81597) b!171739))

(assert (= (and b!171738 c!30729) b!171744))

(assert (= (and b!171738 (not c!30729)) b!171735))

(assert (= (and b!171744 res!81596) b!171741))

(assert (= (and b!171735 c!30731) b!171736))

(assert (= (and b!171735 (not c!30731)) b!171746))

(declare-fun b_lambda!6943 () Bool)

(assert (=> (not b_lambda!6943) (not b!171741)))

(assert (=> b!171741 t!6973))

(declare-fun b_and!10687 () Bool)

(assert (= b_and!10685 (and (=> t!6973 result!4553) b_and!10687)))

(declare-fun b_lambda!6945 () Bool)

(assert (=> (not b_lambda!6945) (not b!171743)))

(assert (=> b!171743 t!6973))

(declare-fun b_and!10689 () Bool)

(assert (= b_and!10687 (and (=> t!6973 result!4553) b_and!10689)))

(assert (=> b!171744 m!200319))

(assert (=> b!171744 m!200319))

(declare-fun m!200741 () Bool)

(assert (=> b!171744 m!200741))

(assert (=> b!171745 m!200319))

(assert (=> b!171745 m!200319))

(assert (=> b!171745 m!200321))

(declare-fun m!200743 () Bool)

(assert (=> d!52295 m!200743))

(assert (=> d!52295 m!199509))

(declare-fun m!200745 () Bool)

(assert (=> b!171743 m!200745))

(declare-fun m!200747 () Bool)

(assert (=> b!171743 m!200747))

(declare-fun m!200749 () Bool)

(assert (=> b!171743 m!200749))

(declare-fun m!200751 () Bool)

(assert (=> b!171743 m!200751))

(assert (=> b!171743 m!200393))

(assert (=> b!171743 m!199501))

(assert (=> b!171743 m!200319))

(assert (=> b!171743 m!200747))

(assert (=> b!171743 m!200393))

(assert (=> b!171743 m!199501))

(assert (=> b!171743 m!200395))

(assert (=> b!171739 m!200319))

(assert (=> b!171739 m!200319))

(assert (=> b!171739 m!200321))

(declare-fun m!200753 () Bool)

(assert (=> b!171736 m!200753))

(assert (=> bm!17464 m!200753))

(assert (=> b!171741 m!200319))

(declare-fun m!200755 () Bool)

(assert (=> b!171741 m!200755))

(assert (=> b!171741 m!200393))

(assert (=> b!171741 m!200393))

(assert (=> b!171741 m!199501))

(assert (=> b!171741 m!200395))

(assert (=> b!171741 m!199501))

(assert (=> b!171741 m!200319))

(declare-fun m!200757 () Bool)

(assert (=> b!171746 m!200757))

(declare-fun m!200759 () Bool)

(assert (=> b!171740 m!200759))

(assert (=> b!171269 d!52295))

(declare-fun d!52297 () Bool)

(declare-fun e!113337 () Bool)

(assert (=> d!52297 e!113337))

(declare-fun res!81598 () Bool)

(assert (=> d!52297 (=> res!81598 e!113337)))

(declare-fun lt!85575 () Bool)

(assert (=> d!52297 (= res!81598 (not lt!85575))))

(declare-fun lt!85577 () Bool)

(assert (=> d!52297 (= lt!85575 lt!85577)))

(declare-fun lt!85578 () Unit!5251)

(declare-fun e!113338 () Unit!5251)

(assert (=> d!52297 (= lt!85578 e!113338)))

(declare-fun c!30733 () Bool)

(assert (=> d!52297 (= c!30733 lt!85577)))

(assert (=> d!52297 (= lt!85577 (containsKey!188 (toList!1081 lt!85324) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52297 (= (contains!1139 lt!85324 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85575)))

(declare-fun b!171747 () Bool)

(declare-fun lt!85576 () Unit!5251)

(assert (=> b!171747 (= e!113338 lt!85576)))

(assert (=> b!171747 (= lt!85576 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85324) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> b!171747 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85324) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171748 () Bool)

(declare-fun Unit!5285 () Unit!5251)

(assert (=> b!171748 (= e!113338 Unit!5285)))

(declare-fun b!171749 () Bool)

(assert (=> b!171749 (= e!113337 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85324) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52297 c!30733) b!171747))

(assert (= (and d!52297 (not c!30733)) b!171748))

(assert (= (and d!52297 (not res!81598)) b!171749))

(declare-fun m!200761 () Bool)

(assert (=> d!52297 m!200761))

(declare-fun m!200763 () Bool)

(assert (=> b!171747 m!200763))

(assert (=> b!171747 m!199789))

(assert (=> b!171747 m!199789))

(declare-fun m!200765 () Bool)

(assert (=> b!171747 m!200765))

(assert (=> b!171749 m!199789))

(assert (=> b!171749 m!199789))

(assert (=> b!171749 m!200765))

(assert (=> d!51911 d!52297))

(declare-fun b!171751 () Bool)

(declare-fun e!113339 () Option!191)

(declare-fun e!113340 () Option!191)

(assert (=> b!171751 (= e!113339 e!113340)))

(declare-fun c!30735 () Bool)

(assert (=> b!171751 (= c!30735 (and ((_ is Cons!2172) lt!85325) (not (= (_1!1610 (h!2789 lt!85325)) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(declare-fun b!171752 () Bool)

(assert (=> b!171752 (= e!113340 (getValueByKey!185 (t!6970 lt!85325) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun c!30734 () Bool)

(declare-fun d!52299 () Bool)

(assert (=> d!52299 (= c!30734 (and ((_ is Cons!2172) lt!85325) (= (_1!1610 (h!2789 lt!85325)) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52299 (= (getValueByKey!185 lt!85325 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) e!113339)))

(declare-fun b!171750 () Bool)

(assert (=> b!171750 (= e!113339 (Some!190 (_2!1610 (h!2789 lt!85325))))))

(declare-fun b!171753 () Bool)

(assert (=> b!171753 (= e!113340 None!189)))

(assert (= (and d!52299 c!30734) b!171750))

(assert (= (and d!52299 (not c!30734)) b!171751))

(assert (= (and b!171751 c!30735) b!171752))

(assert (= (and b!171751 (not c!30735)) b!171753))

(declare-fun m!200767 () Bool)

(assert (=> b!171752 m!200767))

(assert (=> d!51911 d!52299))

(declare-fun d!52301 () Bool)

(assert (=> d!52301 (= (getValueByKey!185 lt!85325 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) (Some!190 (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun lt!85579 () Unit!5251)

(assert (=> d!52301 (= lt!85579 (choose!930 lt!85325 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun e!113341 () Bool)

(assert (=> d!52301 e!113341))

(declare-fun res!81599 () Bool)

(assert (=> d!52301 (=> (not res!81599) (not e!113341))))

(assert (=> d!52301 (= res!81599 (isStrictlySorted!318 lt!85325))))

(assert (=> d!52301 (= (lemmaContainsTupThenGetReturnValue!98 lt!85325 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85579)))

(declare-fun b!171754 () Bool)

(declare-fun res!81600 () Bool)

(assert (=> b!171754 (=> (not res!81600) (not e!113341))))

(assert (=> b!171754 (= res!81600 (containsKey!188 lt!85325 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!171755 () Bool)

(assert (=> b!171755 (= e!113341 (contains!1141 lt!85325 (tuple2!3199 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (= (and d!52301 res!81599) b!171754))

(assert (= (and b!171754 res!81600) b!171755))

(assert (=> d!52301 m!199783))

(declare-fun m!200769 () Bool)

(assert (=> d!52301 m!200769))

(declare-fun m!200771 () Bool)

(assert (=> d!52301 m!200771))

(declare-fun m!200773 () Bool)

(assert (=> b!171754 m!200773))

(declare-fun m!200775 () Bool)

(assert (=> b!171755 m!200775))

(assert (=> d!51911 d!52301))

(declare-fun b!171756 () Bool)

(declare-fun e!113344 () List!2176)

(declare-fun call!17470 () List!2176)

(assert (=> b!171756 (= e!113344 call!17470)))

(declare-fun b!171757 () Bool)

(assert (=> b!171757 (= e!113344 call!17470)))

(declare-fun c!30736 () Bool)

(declare-fun b!171758 () Bool)

(assert (=> b!171758 (= c!30736 (and ((_ is Cons!2172) (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400)))) (bvsgt (_1!1610 (h!2789 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400))))) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun e!113343 () List!2176)

(assert (=> b!171758 (= e!113343 e!113344)))

(declare-fun d!52303 () Bool)

(declare-fun e!113342 () Bool)

(assert (=> d!52303 e!113342))

(declare-fun res!81602 () Bool)

(assert (=> d!52303 (=> (not res!81602) (not e!113342))))

(declare-fun lt!85580 () List!2176)

(assert (=> d!52303 (= res!81602 (isStrictlySorted!318 lt!85580))))

(declare-fun e!113346 () List!2176)

(assert (=> d!52303 (= lt!85580 e!113346)))

(declare-fun c!30737 () Bool)

(assert (=> d!52303 (= c!30737 (and ((_ is Cons!2172) (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400)))) (bvslt (_1!1610 (h!2789 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400))))) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52303 (isStrictlySorted!318 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400))))))

(assert (=> d!52303 (= (insertStrictlySorted!101 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400))) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) lt!85580)))

(declare-fun b!171759 () Bool)

(assert (=> b!171759 (= e!113346 e!113343)))

(declare-fun c!30738 () Bool)

(assert (=> b!171759 (= c!30738 (and ((_ is Cons!2172) (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400)))) (= (_1!1610 (h!2789 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400))))) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171760 () Bool)

(assert (=> b!171760 (= e!113342 (contains!1141 lt!85580 (tuple2!3199 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171761 () Bool)

(declare-fun call!17468 () List!2176)

(assert (=> b!171761 (= e!113343 call!17468)))

(declare-fun b!171762 () Bool)

(declare-fun e!113345 () List!2176)

(assert (=> b!171762 (= e!113345 (ite c!30738 (t!6970 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400)))) (ite c!30736 (Cons!2172 (h!2789 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400)))) (t!6970 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400))))) Nil!2173)))))

(declare-fun bm!17465 () Bool)

(declare-fun call!17469 () List!2176)

(assert (=> bm!17465 (= call!17468 call!17469)))

(declare-fun b!171763 () Bool)

(assert (=> b!171763 (= e!113346 call!17469)))

(declare-fun b!171764 () Bool)

(assert (=> b!171764 (= e!113345 (insertStrictlySorted!101 (t!6970 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400)))) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun bm!17466 () Bool)

(assert (=> bm!17466 (= call!17470 call!17468)))

(declare-fun b!171765 () Bool)

(declare-fun res!81601 () Bool)

(assert (=> b!171765 (=> (not res!81601) (not e!113342))))

(assert (=> b!171765 (= res!81601 (containsKey!188 lt!85580 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun bm!17467 () Bool)

(assert (=> bm!17467 (= call!17469 ($colon$colon!96 e!113345 (ite c!30737 (h!2789 (toList!1081 (ite c!30535 call!17403 (ite c!30534 call!17405 call!17400)))) (tuple2!3199 (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (_2!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(declare-fun c!30739 () Bool)

(assert (=> bm!17467 (= c!30739 c!30737)))

(assert (= (and d!52303 c!30737) b!171763))

(assert (= (and d!52303 (not c!30737)) b!171759))

(assert (= (and b!171759 c!30738) b!171761))

(assert (= (and b!171759 (not c!30738)) b!171758))

(assert (= (and b!171758 c!30736) b!171756))

(assert (= (and b!171758 (not c!30736)) b!171757))

(assert (= (or b!171756 b!171757) bm!17466))

(assert (= (or b!171761 bm!17466) bm!17465))

(assert (= (or b!171763 bm!17465) bm!17467))

(assert (= (and bm!17467 c!30739) b!171764))

(assert (= (and bm!17467 (not c!30739)) b!171762))

(assert (= (and d!52303 res!81602) b!171765))

(assert (= (and b!171765 res!81601) b!171760))

(declare-fun m!200777 () Bool)

(assert (=> b!171764 m!200777))

(declare-fun m!200779 () Bool)

(assert (=> b!171765 m!200779))

(declare-fun m!200781 () Bool)

(assert (=> d!52303 m!200781))

(declare-fun m!200783 () Bool)

(assert (=> d!52303 m!200783))

(declare-fun m!200785 () Bool)

(assert (=> bm!17467 m!200785))

(declare-fun m!200787 () Bool)

(assert (=> b!171760 m!200787))

(assert (=> d!51911 d!52303))

(declare-fun d!52305 () Bool)

(declare-fun res!81607 () Bool)

(declare-fun e!113351 () Bool)

(assert (=> d!52305 (=> res!81607 e!113351)))

(assert (=> d!52305 (= res!81607 (or ((_ is Nil!2173) lt!85316) ((_ is Nil!2173) (t!6970 lt!85316))))))

(assert (=> d!52305 (= (isStrictlySorted!318 lt!85316) e!113351)))

(declare-fun b!171770 () Bool)

(declare-fun e!113352 () Bool)

(assert (=> b!171770 (= e!113351 e!113352)))

(declare-fun res!81608 () Bool)

(assert (=> b!171770 (=> (not res!81608) (not e!113352))))

(assert (=> b!171770 (= res!81608 (bvslt (_1!1610 (h!2789 lt!85316)) (_1!1610 (h!2789 (t!6970 lt!85316)))))))

(declare-fun b!171771 () Bool)

(assert (=> b!171771 (= e!113352 (isStrictlySorted!318 (t!6970 lt!85316)))))

(assert (= (and d!52305 (not res!81607)) b!171770))

(assert (= (and b!171770 res!81608) b!171771))

(declare-fun m!200789 () Bool)

(assert (=> b!171771 m!200789))

(assert (=> d!51905 d!52305))

(declare-fun d!52307 () Bool)

(declare-fun res!81609 () Bool)

(declare-fun e!113353 () Bool)

(assert (=> d!52307 (=> res!81609 e!113353)))

(assert (=> d!52307 (= res!81609 (or ((_ is Nil!2173) (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) ((_ is Nil!2173) (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))))))))

(assert (=> d!52307 (= (isStrictlySorted!318 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248)))) e!113353)))

(declare-fun b!171772 () Bool)

(declare-fun e!113354 () Bool)

(assert (=> b!171772 (= e!113353 e!113354)))

(declare-fun res!81610 () Bool)

(assert (=> b!171772 (=> (not res!81610) (not e!113354))))

(assert (=> b!171772 (= res!81610 (bvslt (_1!1610 (h!2789 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))) (_1!1610 (h!2789 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))))))))

(declare-fun b!171773 () Bool)

(assert (=> b!171773 (= e!113354 (isStrictlySorted!318 (t!6970 (toList!1081 (getCurrentListMap!737 (_keys!5386 thiss!1248) (_values!3537 thiss!1248) (mask!8382 thiss!1248) (extraKeys!3295 thiss!1248) (zeroValue!3397 thiss!1248) (minValue!3397 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3554 thiss!1248))))))))

(assert (= (and d!52307 (not res!81609)) b!171772))

(assert (= (and b!171772 res!81610) b!171773))

(assert (=> b!171773 m!200179))

(assert (=> d!51905 d!52307))

(declare-fun d!52309 () Bool)

(assert (=> d!52309 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))) (v!3915 (getValueByKey!185 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!51875 d!52309))

(assert (=> d!51875 d!52049))

(assert (=> d!51983 d!51981))

(assert (=> d!51983 d!52005))

(declare-fun d!52311 () Bool)

(assert (=> d!52311 (= (apply!129 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) lt!85216) (apply!129 lt!85227 lt!85216))))

(assert (=> d!52311 true))

(declare-fun _$34!1050 () Unit!5251)

(assert (=> d!52311 (= (choose!932 lt!85227 lt!85225 (zeroValue!3397 thiss!1248) lt!85216) _$34!1050)))

(declare-fun bs!7117 () Bool)

(assert (= bs!7117 d!52311))

(assert (=> bs!7117 m!199541))

(assert (=> bs!7117 m!199541))

(assert (=> bs!7117 m!199543))

(assert (=> bs!7117 m!199563))

(assert (=> d!51983 d!52311))

(declare-fun d!52313 () Bool)

(declare-fun e!113355 () Bool)

(assert (=> d!52313 e!113355))

(declare-fun res!81611 () Bool)

(assert (=> d!52313 (=> res!81611 e!113355)))

(declare-fun lt!85581 () Bool)

(assert (=> d!52313 (= res!81611 (not lt!85581))))

(declare-fun lt!85583 () Bool)

(assert (=> d!52313 (= lt!85581 lt!85583)))

(declare-fun lt!85584 () Unit!5251)

(declare-fun e!113356 () Unit!5251)

(assert (=> d!52313 (= lt!85584 e!113356)))

(declare-fun c!30740 () Bool)

(assert (=> d!52313 (= c!30740 lt!85583)))

(assert (=> d!52313 (= lt!85583 (containsKey!188 (toList!1081 lt!85227) lt!85216))))

(assert (=> d!52313 (= (contains!1139 lt!85227 lt!85216) lt!85581)))

(declare-fun b!171774 () Bool)

(declare-fun lt!85582 () Unit!5251)

(assert (=> b!171774 (= e!113356 lt!85582)))

(assert (=> b!171774 (= lt!85582 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85227) lt!85216))))

(assert (=> b!171774 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85227) lt!85216))))

(declare-fun b!171775 () Bool)

(declare-fun Unit!5286 () Unit!5251)

(assert (=> b!171775 (= e!113356 Unit!5286)))

(declare-fun b!171776 () Bool)

(assert (=> b!171776 (= e!113355 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85227) lt!85216)))))

(assert (= (and d!52313 c!30740) b!171774))

(assert (= (and d!52313 (not c!30740)) b!171775))

(assert (= (and d!52313 (not res!81611)) b!171776))

(declare-fun m!200791 () Bool)

(assert (=> d!52313 m!200791))

(declare-fun m!200793 () Bool)

(assert (=> b!171774 m!200793))

(assert (=> b!171774 m!200081))

(assert (=> b!171774 m!200081))

(declare-fun m!200795 () Bool)

(assert (=> b!171774 m!200795))

(assert (=> b!171776 m!200081))

(assert (=> b!171776 m!200081))

(assert (=> b!171776 m!200795))

(assert (=> d!51983 d!52313))

(assert (=> d!51983 d!52009))

(declare-fun d!52315 () Bool)

(assert (=> d!52315 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!85585 () Unit!5251)

(assert (=> d!52315 (= lt!85585 (choose!931 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113357 () Bool)

(assert (=> d!52315 e!113357))

(declare-fun res!81612 () Bool)

(assert (=> d!52315 (=> (not res!81612) (not e!113357))))

(assert (=> d!52315 (= res!81612 (isStrictlySorted!318 (toList!1081 lt!85199)))))

(assert (=> d!52315 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) lt!85585)))

(declare-fun b!171777 () Bool)

(assert (=> b!171777 (= e!113357 (containsKey!188 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52315 res!81612) b!171777))

(assert (=> d!52315 m!199453))

(assert (=> d!52315 m!199619))

(assert (=> d!52315 m!199619))

(assert (=> d!52315 m!199821))

(assert (=> d!52315 m!199453))

(declare-fun m!200797 () Bool)

(assert (=> d!52315 m!200797))

(assert (=> d!52315 m!200333))

(assert (=> b!171777 m!199453))

(assert (=> b!171777 m!199817))

(assert (=> b!171292 d!52315))

(assert (=> b!171292 d!52047))

(assert (=> b!171292 d!52049))

(declare-fun b!171779 () Bool)

(declare-fun e!113358 () Option!191)

(declare-fun e!113359 () Option!191)

(assert (=> b!171779 (= e!113358 e!113359)))

(declare-fun c!30742 () Bool)

(assert (=> b!171779 (= c!30742 (and ((_ is Cons!2172) (toList!1081 lt!85358)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85358))) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171780 () Bool)

(assert (=> b!171780 (= e!113359 (getValueByKey!185 (t!6970 (toList!1081 lt!85358)) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(declare-fun c!30741 () Bool)

(declare-fun d!52317 () Bool)

(assert (=> d!52317 (= c!30741 (and ((_ is Cons!2172) (toList!1081 lt!85358)) (= (_1!1610 (h!2789 (toList!1081 lt!85358))) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))))

(assert (=> d!52317 (= (getValueByKey!185 (toList!1081 lt!85358) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) e!113358)))

(declare-fun b!171778 () Bool)

(assert (=> b!171778 (= e!113358 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85358)))))))

(declare-fun b!171781 () Bool)

(assert (=> b!171781 (= e!113359 None!189)))

(assert (= (and d!52317 c!30741) b!171778))

(assert (= (and d!52317 (not c!30741)) b!171779))

(assert (= (and b!171779 c!30742) b!171780))

(assert (= (and b!171779 (not c!30742)) b!171781))

(declare-fun m!200799 () Bool)

(assert (=> b!171780 m!200799))

(assert (=> b!171334 d!52317))

(declare-fun d!52319 () Bool)

(assert (=> d!52319 (arrayContainsKey!0 (_keys!5386 lt!85094) lt!85269 #b00000000000000000000000000000000)))

(declare-fun lt!85588 () Unit!5251)

(declare-fun choose!13 (array!7105 (_ BitVec 64) (_ BitVec 32)) Unit!5251)

(assert (=> d!52319 (= lt!85588 (choose!13 (_keys!5386 lt!85094) lt!85269 #b00000000000000000000000000000000))))

(assert (=> d!52319 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!52319 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5386 lt!85094) lt!85269 #b00000000000000000000000000000000) lt!85588)))

(declare-fun bs!7118 () Bool)

(assert (= bs!7118 d!52319))

(assert (=> bs!7118 m!199637))

(declare-fun m!200801 () Bool)

(assert (=> bs!7118 m!200801))

(assert (=> b!171147 d!52319))

(declare-fun d!52321 () Bool)

(declare-fun res!81617 () Bool)

(declare-fun e!113364 () Bool)

(assert (=> d!52321 (=> res!81617 e!113364)))

(assert (=> d!52321 (= res!81617 (= (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) lt!85269))))

(assert (=> d!52321 (= (arrayContainsKey!0 (_keys!5386 lt!85094) lt!85269 #b00000000000000000000000000000000) e!113364)))

(declare-fun b!171786 () Bool)

(declare-fun e!113365 () Bool)

(assert (=> b!171786 (= e!113364 e!113365)))

(declare-fun res!81618 () Bool)

(assert (=> b!171786 (=> (not res!81618) (not e!113365))))

(assert (=> b!171786 (= res!81618 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 lt!85094))))))

(declare-fun b!171787 () Bool)

(assert (=> b!171787 (= e!113365 (arrayContainsKey!0 (_keys!5386 lt!85094) lt!85269 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!52321 (not res!81617)) b!171786))

(assert (= (and b!171786 res!81618) b!171787))

(assert (=> d!52321 m!199631))

(declare-fun m!200803 () Bool)

(assert (=> b!171787 m!200803))

(assert (=> b!171147 d!52321))

(declare-fun b!171800 () Bool)

(declare-fun e!113374 () SeekEntryResult!528)

(declare-fun e!113372 () SeekEntryResult!528)

(assert (=> b!171800 (= e!113374 e!113372)))

(declare-fun lt!85595 () (_ BitVec 64))

(declare-fun lt!85597 () SeekEntryResult!528)

(assert (=> b!171800 (= lt!85595 (select (arr!3380 (_keys!5386 lt!85094)) (index!4282 lt!85597)))))

(declare-fun c!30749 () Bool)

(assert (=> b!171800 (= c!30749 (= lt!85595 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun b!171801 () Bool)

(assert (=> b!171801 (= e!113372 (Found!528 (index!4282 lt!85597)))))

(declare-fun b!171802 () Bool)

(declare-fun e!113373 () SeekEntryResult!528)

(assert (=> b!171802 (= e!113373 (MissingZero!528 (index!4282 lt!85597)))))

(declare-fun b!171803 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7105 (_ BitVec 32)) SeekEntryResult!528)

(assert (=> b!171803 (= e!113373 (seekKeyOrZeroReturnVacant!0 (x!18953 lt!85597) (index!4282 lt!85597) (index!4282 lt!85597) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) (_keys!5386 lt!85094) (mask!8382 lt!85094)))))

(declare-fun d!52323 () Bool)

(declare-fun lt!85596 () SeekEntryResult!528)

(assert (=> d!52323 (and (or ((_ is Undefined!528) lt!85596) (not ((_ is Found!528) lt!85596)) (and (bvsge (index!4281 lt!85596) #b00000000000000000000000000000000) (bvslt (index!4281 lt!85596) (size!3673 (_keys!5386 lt!85094))))) (or ((_ is Undefined!528) lt!85596) ((_ is Found!528) lt!85596) (not ((_ is MissingZero!528) lt!85596)) (and (bvsge (index!4280 lt!85596) #b00000000000000000000000000000000) (bvslt (index!4280 lt!85596) (size!3673 (_keys!5386 lt!85094))))) (or ((_ is Undefined!528) lt!85596) ((_ is Found!528) lt!85596) ((_ is MissingZero!528) lt!85596) (not ((_ is MissingVacant!528) lt!85596)) (and (bvsge (index!4283 lt!85596) #b00000000000000000000000000000000) (bvslt (index!4283 lt!85596) (size!3673 (_keys!5386 lt!85094))))) (or ((_ is Undefined!528) lt!85596) (ite ((_ is Found!528) lt!85596) (= (select (arr!3380 (_keys!5386 lt!85094)) (index!4281 lt!85596)) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!528) lt!85596) (= (select (arr!3380 (_keys!5386 lt!85094)) (index!4280 lt!85596)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!528) lt!85596) (= (select (arr!3380 (_keys!5386 lt!85094)) (index!4283 lt!85596)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52323 (= lt!85596 e!113374)))

(declare-fun c!30751 () Bool)

(assert (=> d!52323 (= c!30751 (and ((_ is Intermediate!528) lt!85597) (undefined!1340 lt!85597)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7105 (_ BitVec 32)) SeekEntryResult!528)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!52323 (= lt!85597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) (mask!8382 lt!85094)) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) (_keys!5386 lt!85094) (mask!8382 lt!85094)))))

(assert (=> d!52323 (validMask!0 (mask!8382 lt!85094))))

(assert (=> d!52323 (= (seekEntryOrOpen!0 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) (_keys!5386 lt!85094) (mask!8382 lt!85094)) lt!85596)))

(declare-fun b!171804 () Bool)

(assert (=> b!171804 (= e!113374 Undefined!528)))

(declare-fun b!171805 () Bool)

(declare-fun c!30750 () Bool)

(assert (=> b!171805 (= c!30750 (= lt!85595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171805 (= e!113372 e!113373)))

(assert (= (and d!52323 c!30751) b!171804))

(assert (= (and d!52323 (not c!30751)) b!171800))

(assert (= (and b!171800 c!30749) b!171801))

(assert (= (and b!171800 (not c!30749)) b!171805))

(assert (= (and b!171805 c!30750) b!171802))

(assert (= (and b!171805 (not c!30750)) b!171803))

(declare-fun m!200805 () Bool)

(assert (=> b!171800 m!200805))

(assert (=> b!171803 m!199631))

(declare-fun m!200807 () Bool)

(assert (=> b!171803 m!200807))

(assert (=> d!52323 m!199697))

(assert (=> d!52323 m!199631))

(declare-fun m!200809 () Bool)

(assert (=> d!52323 m!200809))

(assert (=> d!52323 m!200809))

(assert (=> d!52323 m!199631))

(declare-fun m!200811 () Bool)

(assert (=> d!52323 m!200811))

(declare-fun m!200813 () Bool)

(assert (=> d!52323 m!200813))

(declare-fun m!200815 () Bool)

(assert (=> d!52323 m!200815))

(declare-fun m!200817 () Bool)

(assert (=> d!52323 m!200817))

(assert (=> b!171147 d!52323))

(declare-fun d!52325 () Bool)

(declare-fun res!81619 () Bool)

(declare-fun e!113375 () Bool)

(assert (=> d!52325 (=> res!81619 e!113375)))

(assert (=> d!52325 (= res!81619 (and ((_ is Cons!2172) lt!85316) (= (_1!1610 (h!2789 lt!85316)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52325 (= (containsKey!188 lt!85316 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113375)))

(declare-fun b!171806 () Bool)

(declare-fun e!113376 () Bool)

(assert (=> b!171806 (= e!113375 e!113376)))

(declare-fun res!81620 () Bool)

(assert (=> b!171806 (=> (not res!81620) (not e!113376))))

(assert (=> b!171806 (= res!81620 (and (or (not ((_ is Cons!2172) lt!85316)) (bvsle (_1!1610 (h!2789 lt!85316)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2172) lt!85316) (bvslt (_1!1610 (h!2789 lt!85316)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171807 () Bool)

(assert (=> b!171807 (= e!113376 (containsKey!188 (t!6970 lt!85316) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52325 (not res!81619)) b!171806))

(assert (= (and b!171806 res!81620) b!171807))

(declare-fun m!200819 () Bool)

(assert (=> b!171807 m!200819))

(assert (=> b!171255 d!52325))

(declare-fun d!52327 () Bool)

(declare-fun res!81621 () Bool)

(declare-fun e!113377 () Bool)

(assert (=> d!52327 (=> res!81621 e!113377)))

(assert (=> d!52327 (= res!81621 (and ((_ is Cons!2172) (toList!1081 lt!85224)) (= (_1!1610 (h!2789 (toList!1081 lt!85224))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52327 (= (containsKey!188 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000) e!113377)))

(declare-fun b!171808 () Bool)

(declare-fun e!113378 () Bool)

(assert (=> b!171808 (= e!113377 e!113378)))

(declare-fun res!81622 () Bool)

(assert (=> b!171808 (=> (not res!81622) (not e!113378))))

(assert (=> b!171808 (= res!81622 (and (or (not ((_ is Cons!2172) (toList!1081 lt!85224))) (bvsle (_1!1610 (h!2789 (toList!1081 lt!85224))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2172) (toList!1081 lt!85224)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85224))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171809 () Bool)

(assert (=> b!171809 (= e!113378 (containsKey!188 (t!6970 (toList!1081 lt!85224)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52327 (not res!81621)) b!171808))

(assert (= (and b!171808 res!81622) b!171809))

(declare-fun m!200821 () Bool)

(assert (=> b!171809 m!200821))

(assert (=> d!51891 d!52327))

(declare-fun d!52329 () Bool)

(declare-fun lt!85598 () Bool)

(assert (=> d!52329 (= lt!85598 (select (content!148 (toList!1081 lt!85370)) (tuple2!3199 lt!85184 v!309)))))

(declare-fun e!113380 () Bool)

(assert (=> d!52329 (= lt!85598 e!113380)))

(declare-fun res!81623 () Bool)

(assert (=> d!52329 (=> (not res!81623) (not e!113380))))

(assert (=> d!52329 (= res!81623 ((_ is Cons!2172) (toList!1081 lt!85370)))))

(assert (=> d!52329 (= (contains!1141 (toList!1081 lt!85370) (tuple2!3199 lt!85184 v!309)) lt!85598)))

(declare-fun b!171810 () Bool)

(declare-fun e!113379 () Bool)

(assert (=> b!171810 (= e!113380 e!113379)))

(declare-fun res!81624 () Bool)

(assert (=> b!171810 (=> res!81624 e!113379)))

(assert (=> b!171810 (= res!81624 (= (h!2789 (toList!1081 lt!85370)) (tuple2!3199 lt!85184 v!309)))))

(declare-fun b!171811 () Bool)

(assert (=> b!171811 (= e!113379 (contains!1141 (t!6970 (toList!1081 lt!85370)) (tuple2!3199 lt!85184 v!309)))))

(assert (= (and d!52329 res!81623) b!171810))

(assert (= (and b!171810 (not res!81624)) b!171811))

(declare-fun m!200823 () Bool)

(assert (=> d!52329 m!200823))

(declare-fun m!200825 () Bool)

(assert (=> d!52329 m!200825))

(declare-fun m!200827 () Bool)

(assert (=> b!171811 m!200827))

(assert (=> b!171344 d!52329))

(declare-fun b!171813 () Bool)

(declare-fun e!113381 () Option!191)

(declare-fun e!113382 () Option!191)

(assert (=> b!171813 (= e!113381 e!113382)))

(declare-fun c!30753 () Bool)

(assert (=> b!171813 (= c!30753 (and ((_ is Cons!2172) (t!6970 lt!85123)) (not (= (_1!1610 (h!2789 (t!6970 lt!85123))) (_1!1610 (tuple2!3199 key!828 v!309))))))))

(declare-fun b!171814 () Bool)

(assert (=> b!171814 (= e!113382 (getValueByKey!185 (t!6970 (t!6970 lt!85123)) (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun d!52331 () Bool)

(declare-fun c!30752 () Bool)

(assert (=> d!52331 (= c!30752 (and ((_ is Cons!2172) (t!6970 lt!85123)) (= (_1!1610 (h!2789 (t!6970 lt!85123))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(assert (=> d!52331 (= (getValueByKey!185 (t!6970 lt!85123) (_1!1610 (tuple2!3199 key!828 v!309))) e!113381)))

(declare-fun b!171812 () Bool)

(assert (=> b!171812 (= e!113381 (Some!190 (_2!1610 (h!2789 (t!6970 lt!85123)))))))

(declare-fun b!171815 () Bool)

(assert (=> b!171815 (= e!113382 None!189)))

(assert (= (and d!52331 c!30752) b!171812))

(assert (= (and d!52331 (not c!30752)) b!171813))

(assert (= (and b!171813 c!30753) b!171814))

(assert (= (and b!171813 (not c!30753)) b!171815))

(declare-fun m!200829 () Bool)

(assert (=> b!171814 m!200829))

(assert (=> b!171307 d!52331))

(declare-fun d!52333 () Bool)

(assert (=> d!52333 (= (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) lt!85222)) (v!3915 (getValueByKey!185 (toList!1081 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) lt!85222)))))

(assert (=> d!51991 d!52333))

(declare-fun b!171817 () Bool)

(declare-fun e!113383 () Option!191)

(declare-fun e!113384 () Option!191)

(assert (=> b!171817 (= e!113383 e!113384)))

(declare-fun c!30755 () Bool)

(assert (=> b!171817 (= c!30755 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))) (not (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))) lt!85222))))))

(declare-fun b!171818 () Bool)

(assert (=> b!171818 (= e!113384 (getValueByKey!185 (t!6970 (toList!1081 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))) lt!85222))))

(declare-fun d!52335 () Bool)

(declare-fun c!30754 () Bool)

(assert (=> d!52335 (= c!30754 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))) (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))) lt!85222)))))

(assert (=> d!52335 (= (getValueByKey!185 (toList!1081 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) lt!85222) e!113383)))

(declare-fun b!171816 () Bool)

(assert (=> b!171816 (= e!113383 (Some!190 (_2!1610 (h!2789 (toList!1081 (+!243 lt!85215 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))))))

(declare-fun b!171819 () Bool)

(assert (=> b!171819 (= e!113384 None!189)))

(assert (= (and d!52335 c!30754) b!171816))

(assert (= (and d!52335 (not c!30754)) b!171817))

(assert (= (and b!171817 c!30755) b!171818))

(assert (= (and b!171817 (not c!30755)) b!171819))

(declare-fun m!200831 () Bool)

(assert (=> b!171818 m!200831))

(assert (=> d!51991 d!52335))

(declare-fun b!171821 () Bool)

(declare-fun e!113385 () Option!191)

(declare-fun e!113386 () Option!191)

(assert (=> b!171821 (= e!113385 e!113386)))

(declare-fun c!30757 () Bool)

(assert (=> b!171821 (= c!30757 (and ((_ is Cons!2172) (t!6970 (toList!1081 lt!85229))) (not (= (_1!1610 (h!2789 (t!6970 (toList!1081 lt!85229)))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!171822 () Bool)

(assert (=> b!171822 (= e!113386 (getValueByKey!185 (t!6970 (t!6970 (toList!1081 lt!85229))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!52337 () Bool)

(declare-fun c!30756 () Bool)

(assert (=> d!52337 (= c!30756 (and ((_ is Cons!2172) (t!6970 (toList!1081 lt!85229))) (= (_1!1610 (h!2789 (t!6970 (toList!1081 lt!85229)))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52337 (= (getValueByKey!185 (t!6970 (toList!1081 lt!85229)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113385)))

(declare-fun b!171820 () Bool)

(assert (=> b!171820 (= e!113385 (Some!190 (_2!1610 (h!2789 (t!6970 (toList!1081 lt!85229))))))))

(declare-fun b!171823 () Bool)

(assert (=> b!171823 (= e!113386 None!189)))

(assert (= (and d!52337 c!30756) b!171820))

(assert (= (and d!52337 (not c!30756)) b!171821))

(assert (= (and b!171821 c!30757) b!171822))

(assert (= (and b!171821 (not c!30757)) b!171823))

(declare-fun m!200833 () Bool)

(assert (=> b!171822 m!200833))

(assert (=> b!171351 d!52337))

(declare-fun d!52339 () Bool)

(declare-fun c!30760 () Bool)

(assert (=> d!52339 (= c!30760 ((_ is Nil!2173) (toList!1081 lt!85229)))))

(declare-fun e!113389 () (InoxSet tuple2!3198))

(assert (=> d!52339 (= (content!148 (toList!1081 lt!85229)) e!113389)))

(declare-fun b!171828 () Bool)

(assert (=> b!171828 (= e!113389 ((as const (Array tuple2!3198 Bool)) false))))

(declare-fun b!171829 () Bool)

(assert (=> b!171829 (= e!113389 ((_ map or) (store ((as const (Array tuple2!3198 Bool)) false) (h!2789 (toList!1081 lt!85229)) true) (content!148 (t!6970 (toList!1081 lt!85229)))))))

(assert (= (and d!52339 c!30760) b!171828))

(assert (= (and d!52339 (not c!30760)) b!171829))

(declare-fun m!200835 () Bool)

(assert (=> b!171829 m!200835))

(assert (=> b!171829 m!200289))

(assert (=> d!51941 d!52339))

(declare-fun d!52341 () Bool)

(declare-fun e!113390 () Bool)

(assert (=> d!52341 e!113390))

(declare-fun res!81625 () Bool)

(assert (=> d!52341 (=> res!81625 e!113390)))

(declare-fun lt!85599 () Bool)

(assert (=> d!52341 (= res!81625 (not lt!85599))))

(declare-fun lt!85601 () Bool)

(assert (=> d!52341 (= lt!85599 lt!85601)))

(declare-fun lt!85602 () Unit!5251)

(declare-fun e!113391 () Unit!5251)

(assert (=> d!52341 (= lt!85602 e!113391)))

(declare-fun c!30761 () Bool)

(assert (=> d!52341 (= c!30761 lt!85601)))

(assert (=> d!52341 (= lt!85601 (containsKey!188 (toList!1081 lt!85330) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52341 (= (contains!1139 lt!85330 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85599)))

(declare-fun b!171830 () Bool)

(declare-fun lt!85600 () Unit!5251)

(assert (=> b!171830 (= e!113391 lt!85600)))

(assert (=> b!171830 (= lt!85600 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85330) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171830 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85330) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171831 () Bool)

(declare-fun Unit!5287 () Unit!5251)

(assert (=> b!171831 (= e!113391 Unit!5287)))

(declare-fun b!171832 () Bool)

(assert (=> b!171832 (= e!113390 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85330) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52341 c!30761) b!171830))

(assert (= (and d!52341 (not c!30761)) b!171831))

(assert (= (and d!52341 (not res!81625)) b!171832))

(declare-fun m!200837 () Bool)

(assert (=> d!52341 m!200837))

(declare-fun m!200839 () Bool)

(assert (=> b!171830 m!200839))

(declare-fun m!200841 () Bool)

(assert (=> b!171830 m!200841))

(assert (=> b!171830 m!200841))

(declare-fun m!200843 () Bool)

(assert (=> b!171830 m!200843))

(assert (=> b!171832 m!200841))

(assert (=> b!171832 m!200841))

(assert (=> b!171832 m!200843))

(assert (=> b!171273 d!52341))

(declare-fun b!171834 () Bool)

(declare-fun e!113392 () Option!191)

(declare-fun e!113393 () Option!191)

(assert (=> b!171834 (= e!113392 e!113393)))

(declare-fun c!30763 () Bool)

(assert (=> b!171834 (= c!30763 (and ((_ is Cons!2172) (t!6970 lt!85230)) (not (= (_1!1610 (h!2789 (t!6970 lt!85230))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!171835 () Bool)

(assert (=> b!171835 (= e!113393 (getValueByKey!185 (t!6970 (t!6970 lt!85230)) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!52343 () Bool)

(declare-fun c!30762 () Bool)

(assert (=> d!52343 (= c!30762 (and ((_ is Cons!2172) (t!6970 lt!85230)) (= (_1!1610 (h!2789 (t!6970 lt!85230))) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52343 (= (getValueByKey!185 (t!6970 lt!85230) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113392)))

(declare-fun b!171833 () Bool)

(assert (=> b!171833 (= e!113392 (Some!190 (_2!1610 (h!2789 (t!6970 lt!85230)))))))

(declare-fun b!171836 () Bool)

(assert (=> b!171836 (= e!113393 None!189)))

(assert (= (and d!52343 c!30762) b!171833))

(assert (= (and d!52343 (not c!30762)) b!171834))

(assert (= (and b!171834 c!30763) b!171835))

(assert (= (and b!171834 (not c!30763)) b!171836))

(declare-fun m!200845 () Bool)

(assert (=> b!171835 m!200845))

(assert (=> b!171218 d!52343))

(declare-fun d!52345 () Bool)

(assert (=> d!52345 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212))))

(declare-fun lt!85603 () Unit!5251)

(assert (=> d!52345 (= lt!85603 (choose!931 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212))))

(declare-fun e!113394 () Bool)

(assert (=> d!52345 e!113394))

(declare-fun res!81626 () Bool)

(assert (=> d!52345 (=> (not res!81626) (not e!113394))))

(assert (=> d!52345 (= res!81626 (isStrictlySorted!318 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))))))

(assert (=> d!52345 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212) lt!85603)))

(declare-fun b!171837 () Bool)

(assert (=> b!171837 (= e!113394 (containsKey!188 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212))))

(assert (= (and d!52345 res!81626) b!171837))

(assert (=> d!52345 m!200069))

(assert (=> d!52345 m!200069))

(assert (=> d!52345 m!200071))

(declare-fun m!200847 () Bool)

(assert (=> d!52345 m!200847))

(declare-fun m!200849 () Bool)

(assert (=> d!52345 m!200849))

(assert (=> b!171837 m!200065))

(assert (=> b!171370 d!52345))

(assert (=> b!171370 d!52247))

(assert (=> b!171370 d!52249))

(assert (=> d!51967 d!51945))

(assert (=> d!51967 d!51963))

(declare-fun d!52347 () Bool)

(assert (=> d!52347 (contains!1139 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)) lt!85187)))

(assert (=> d!52347 true))

(declare-fun _$35!409 () Unit!5251)

(assert (=> d!52347 (= (choose!933 lt!85198 lt!85184 v!309 lt!85187) _$35!409)))

(declare-fun bs!7119 () Bool)

(assert (= bs!7119 d!52347))

(assert (=> bs!7119 m!199479))

(assert (=> bs!7119 m!199479))

(assert (=> bs!7119 m!199481))

(assert (=> d!51967 d!52347))

(declare-fun d!52349 () Bool)

(declare-fun e!113395 () Bool)

(assert (=> d!52349 e!113395))

(declare-fun res!81627 () Bool)

(assert (=> d!52349 (=> res!81627 e!113395)))

(declare-fun lt!85604 () Bool)

(assert (=> d!52349 (= res!81627 (not lt!85604))))

(declare-fun lt!85606 () Bool)

(assert (=> d!52349 (= lt!85604 lt!85606)))

(declare-fun lt!85607 () Unit!5251)

(declare-fun e!113396 () Unit!5251)

(assert (=> d!52349 (= lt!85607 e!113396)))

(declare-fun c!30764 () Bool)

(assert (=> d!52349 (= c!30764 lt!85606)))

(assert (=> d!52349 (= lt!85606 (containsKey!188 (toList!1081 lt!85198) lt!85187))))

(assert (=> d!52349 (= (contains!1139 lt!85198 lt!85187) lt!85604)))

(declare-fun b!171838 () Bool)

(declare-fun lt!85605 () Unit!5251)

(assert (=> b!171838 (= e!113396 lt!85605)))

(assert (=> b!171838 (= lt!85605 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85198) lt!85187))))

(assert (=> b!171838 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85198) lt!85187))))

(declare-fun b!171839 () Bool)

(declare-fun Unit!5288 () Unit!5251)

(assert (=> b!171839 (= e!113396 Unit!5288)))

(declare-fun b!171840 () Bool)

(assert (=> b!171840 (= e!113395 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85198) lt!85187)))))

(assert (= (and d!52349 c!30764) b!171838))

(assert (= (and d!52349 (not c!30764)) b!171839))

(assert (= (and d!52349 (not res!81627)) b!171840))

(declare-fun m!200851 () Bool)

(assert (=> d!52349 m!200851))

(declare-fun m!200853 () Bool)

(assert (=> b!171838 m!200853))

(declare-fun m!200855 () Bool)

(assert (=> b!171838 m!200855))

(assert (=> b!171838 m!200855))

(declare-fun m!200857 () Bool)

(assert (=> b!171838 m!200857))

(assert (=> b!171840 m!200855))

(assert (=> b!171840 m!200855))

(assert (=> b!171840 m!200857))

(assert (=> d!51967 d!52349))

(declare-fun d!52351 () Bool)

(declare-fun res!81628 () Bool)

(declare-fun e!113397 () Bool)

(assert (=> d!52351 (=> res!81628 e!113397)))

(assert (=> d!52351 (= res!81628 (or ((_ is Nil!2173) lt!85348) ((_ is Nil!2173) (t!6970 lt!85348))))))

(assert (=> d!52351 (= (isStrictlySorted!318 lt!85348) e!113397)))

(declare-fun b!171841 () Bool)

(declare-fun e!113398 () Bool)

(assert (=> b!171841 (= e!113397 e!113398)))

(declare-fun res!81629 () Bool)

(assert (=> b!171841 (=> (not res!81629) (not e!113398))))

(assert (=> b!171841 (= res!81629 (bvslt (_1!1610 (h!2789 lt!85348)) (_1!1610 (h!2789 (t!6970 lt!85348)))))))

(declare-fun b!171842 () Bool)

(assert (=> b!171842 (= e!113398 (isStrictlySorted!318 (t!6970 lt!85348)))))

(assert (= (and d!52351 (not res!81628)) b!171841))

(assert (= (and b!171841 res!81629) b!171842))

(declare-fun m!200859 () Bool)

(assert (=> b!171842 m!200859))

(assert (=> d!51937 d!52351))

(declare-fun d!52353 () Bool)

(declare-fun res!81630 () Bool)

(declare-fun e!113399 () Bool)

(assert (=> d!52353 (=> res!81630 e!113399)))

(assert (=> d!52353 (= res!81630 (or ((_ is Nil!2173) (toList!1081 (map!1846 thiss!1248))) ((_ is Nil!2173) (t!6970 (toList!1081 (map!1846 thiss!1248))))))))

(assert (=> d!52353 (= (isStrictlySorted!318 (toList!1081 (map!1846 thiss!1248))) e!113399)))

(declare-fun b!171843 () Bool)

(declare-fun e!113400 () Bool)

(assert (=> b!171843 (= e!113399 e!113400)))

(declare-fun res!81631 () Bool)

(assert (=> b!171843 (=> (not res!81631) (not e!113400))))

(assert (=> b!171843 (= res!81631 (bvslt (_1!1610 (h!2789 (toList!1081 (map!1846 thiss!1248)))) (_1!1610 (h!2789 (t!6970 (toList!1081 (map!1846 thiss!1248)))))))))

(declare-fun b!171844 () Bool)

(assert (=> b!171844 (= e!113400 (isStrictlySorted!318 (t!6970 (toList!1081 (map!1846 thiss!1248)))))))

(assert (= (and d!52353 (not res!81630)) b!171843))

(assert (= (and b!171843 res!81631) b!171844))

(declare-fun m!200861 () Bool)

(assert (=> b!171844 m!200861))

(assert (=> d!51937 d!52353))

(assert (=> d!51903 d!51901))

(declare-fun d!52355 () Bool)

(assert (=> d!52355 (= (getValueByKey!185 lt!85230 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52355 true))

(declare-fun _$22!531 () Unit!5251)

(assert (=> d!52355 (= (choose!930 lt!85230 (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) _$22!531)))

(declare-fun bs!7120 () Bool)

(assert (= bs!7120 d!52355))

(assert (=> bs!7120 m!199573))

(assert (=> d!51903 d!52355))

(declare-fun d!52357 () Bool)

(declare-fun res!81632 () Bool)

(declare-fun e!113401 () Bool)

(assert (=> d!52357 (=> res!81632 e!113401)))

(assert (=> d!52357 (= res!81632 (or ((_ is Nil!2173) lt!85230) ((_ is Nil!2173) (t!6970 lt!85230))))))

(assert (=> d!52357 (= (isStrictlySorted!318 lt!85230) e!113401)))

(declare-fun b!171845 () Bool)

(declare-fun e!113402 () Bool)

(assert (=> b!171845 (= e!113401 e!113402)))

(declare-fun res!81633 () Bool)

(assert (=> b!171845 (=> (not res!81633) (not e!113402))))

(assert (=> b!171845 (= res!81633 (bvslt (_1!1610 (h!2789 lt!85230)) (_1!1610 (h!2789 (t!6970 lt!85230)))))))

(declare-fun b!171846 () Bool)

(assert (=> b!171846 (= e!113402 (isStrictlySorted!318 (t!6970 lt!85230)))))

(assert (= (and d!52357 (not res!81632)) b!171845))

(assert (= (and b!171845 res!81633) b!171846))

(declare-fun m!200863 () Bool)

(assert (=> b!171846 m!200863))

(assert (=> d!51903 d!52357))

(declare-fun d!52359 () Bool)

(declare-fun e!113403 () Bool)

(assert (=> d!52359 e!113403))

(declare-fun res!81634 () Bool)

(assert (=> d!52359 (=> res!81634 e!113403)))

(declare-fun lt!85608 () Bool)

(assert (=> d!52359 (= res!81634 (not lt!85608))))

(declare-fun lt!85610 () Bool)

(assert (=> d!52359 (= lt!85608 lt!85610)))

(declare-fun lt!85611 () Unit!5251)

(declare-fun e!113404 () Unit!5251)

(assert (=> d!52359 (= lt!85611 e!113404)))

(declare-fun c!30765 () Bool)

(assert (=> d!52359 (= c!30765 lt!85610)))

(assert (=> d!52359 (= lt!85610 (containsKey!188 (toList!1081 lt!85290) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52359 (= (contains!1139 lt!85290 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85608)))

(declare-fun b!171847 () Bool)

(declare-fun lt!85609 () Unit!5251)

(assert (=> b!171847 (= e!113404 lt!85609)))

(assert (=> b!171847 (= lt!85609 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85290) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171847 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85290) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171848 () Bool)

(declare-fun Unit!5289 () Unit!5251)

(assert (=> b!171848 (= e!113404 Unit!5289)))

(declare-fun b!171849 () Bool)

(assert (=> b!171849 (= e!113403 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85290) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52359 c!30765) b!171847))

(assert (= (and d!52359 (not c!30765)) b!171848))

(assert (= (and d!52359 (not res!81634)) b!171849))

(declare-fun m!200865 () Bool)

(assert (=> d!52359 m!200865))

(declare-fun m!200867 () Bool)

(assert (=> b!171847 m!200867))

(assert (=> b!171847 m!200205))

(assert (=> b!171847 m!200205))

(declare-fun m!200869 () Bool)

(assert (=> b!171847 m!200869))

(assert (=> b!171849 m!200205))

(assert (=> b!171849 m!200205))

(assert (=> b!171849 m!200869))

(assert (=> bm!17415 d!52359))

(declare-fun d!52361 () Bool)

(declare-fun c!30766 () Bool)

(assert (=> d!52361 (= c!30766 ((_ is Nil!2173) (toList!1081 lt!85122)))))

(declare-fun e!113405 () (InoxSet tuple2!3198))

(assert (=> d!52361 (= (content!148 (toList!1081 lt!85122)) e!113405)))

(declare-fun b!171850 () Bool)

(assert (=> b!171850 (= e!113405 ((as const (Array tuple2!3198 Bool)) false))))

(declare-fun b!171851 () Bool)

(assert (=> b!171851 (= e!113405 ((_ map or) (store ((as const (Array tuple2!3198 Bool)) false) (h!2789 (toList!1081 lt!85122)) true) (content!148 (t!6970 (toList!1081 lt!85122)))))))

(assert (= (and d!52361 c!30766) b!171850))

(assert (= (and d!52361 (not c!30766)) b!171851))

(declare-fun m!200871 () Bool)

(assert (=> b!171851 m!200871))

(declare-fun m!200873 () Bool)

(assert (=> b!171851 m!200873))

(assert (=> d!51873 d!52361))

(declare-fun d!52363 () Bool)

(declare-fun res!81635 () Bool)

(declare-fun e!113406 () Bool)

(assert (=> d!52363 (=> res!81635 e!113406)))

(assert (=> d!52363 (= res!81635 (and ((_ is Cons!2172) (toList!1081 lt!85224)) (= (_1!1610 (h!2789 (toList!1081 lt!85224))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52363 (= (containsKey!188 (toList!1081 lt!85224) #b1000000000000000000000000000000000000000000000000000000000000000) e!113406)))

(declare-fun b!171852 () Bool)

(declare-fun e!113407 () Bool)

(assert (=> b!171852 (= e!113406 e!113407)))

(declare-fun res!81636 () Bool)

(assert (=> b!171852 (=> (not res!81636) (not e!113407))))

(assert (=> b!171852 (= res!81636 (and (or (not ((_ is Cons!2172) (toList!1081 lt!85224))) (bvsle (_1!1610 (h!2789 (toList!1081 lt!85224))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2172) (toList!1081 lt!85224)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85224))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171853 () Bool)

(assert (=> b!171853 (= e!113407 (containsKey!188 (t!6970 (toList!1081 lt!85224)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52363 (not res!81635)) b!171852))

(assert (= (and b!171852 res!81636) b!171853))

(declare-fun m!200875 () Bool)

(assert (=> b!171853 m!200875))

(assert (=> d!51977 d!52363))

(assert (=> bm!17433 d!52295))

(assert (=> b!171330 d!52091))

(assert (=> b!171330 d!52093))

(declare-fun d!52365 () Bool)

(declare-fun e!113408 () Bool)

(assert (=> d!52365 e!113408))

(declare-fun res!81637 () Bool)

(assert (=> d!52365 (=> res!81637 e!113408)))

(declare-fun lt!85612 () Bool)

(assert (=> d!52365 (= res!81637 (not lt!85612))))

(declare-fun lt!85614 () Bool)

(assert (=> d!52365 (= lt!85612 lt!85614)))

(declare-fun lt!85615 () Unit!5251)

(declare-fun e!113409 () Unit!5251)

(assert (=> d!52365 (= lt!85615 e!113409)))

(declare-fun c!30767 () Bool)

(assert (=> d!52365 (= c!30767 lt!85614)))

(assert (=> d!52365 (= lt!85614 (containsKey!188 (toList!1081 lt!85397) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(assert (=> d!52365 (= (contains!1139 lt!85397 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) lt!85612)))

(declare-fun b!171854 () Bool)

(declare-fun lt!85613 () Unit!5251)

(assert (=> b!171854 (= e!113409 lt!85613)))

(assert (=> b!171854 (= lt!85613 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85397) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(assert (=> b!171854 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85397) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(declare-fun b!171855 () Bool)

(declare-fun Unit!5290 () Unit!5251)

(assert (=> b!171855 (= e!113409 Unit!5290)))

(declare-fun b!171856 () Bool)

(assert (=> b!171856 (= e!113408 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85397) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52365 c!30767) b!171854))

(assert (= (and d!52365 (not c!30767)) b!171855))

(assert (= (and d!52365 (not res!81637)) b!171856))

(declare-fun m!200877 () Bool)

(assert (=> d!52365 m!200877))

(declare-fun m!200879 () Bool)

(assert (=> b!171854 m!200879))

(assert (=> b!171854 m!200045))

(assert (=> b!171854 m!200045))

(declare-fun m!200881 () Bool)

(assert (=> b!171854 m!200881))

(assert (=> b!171856 m!200045))

(assert (=> b!171856 m!200045))

(assert (=> b!171856 m!200881))

(assert (=> d!51997 d!52365))

(declare-fun b!171858 () Bool)

(declare-fun e!113410 () Option!191)

(declare-fun e!113411 () Option!191)

(assert (=> b!171858 (= e!113410 e!113411)))

(declare-fun c!30769 () Bool)

(assert (=> b!171858 (= c!30769 (and ((_ is Cons!2172) lt!85398) (not (= (_1!1610 (h!2789 lt!85398)) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171859 () Bool)

(assert (=> b!171859 (= e!113411 (getValueByKey!185 (t!6970 lt!85398) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(declare-fun d!52367 () Bool)

(declare-fun c!30768 () Bool)

(assert (=> d!52367 (= c!30768 (and ((_ is Cons!2172) lt!85398) (= (_1!1610 (h!2789 lt!85398)) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))))

(assert (=> d!52367 (= (getValueByKey!185 lt!85398 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) e!113410)))

(declare-fun b!171857 () Bool)

(assert (=> b!171857 (= e!113410 (Some!190 (_2!1610 (h!2789 lt!85398))))))

(declare-fun b!171860 () Bool)

(assert (=> b!171860 (= e!113411 None!189)))

(assert (= (and d!52367 c!30768) b!171857))

(assert (= (and d!52367 (not c!30768)) b!171858))

(assert (= (and b!171858 c!30769) b!171859))

(assert (= (and b!171858 (not c!30769)) b!171860))

(declare-fun m!200883 () Bool)

(assert (=> b!171859 m!200883))

(assert (=> d!51997 d!52367))

(declare-fun d!52369 () Bool)

(assert (=> d!52369 (= (getValueByKey!185 lt!85398 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85616 () Unit!5251)

(assert (=> d!52369 (= lt!85616 (choose!930 lt!85398 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(declare-fun e!113412 () Bool)

(assert (=> d!52369 e!113412))

(declare-fun res!81638 () Bool)

(assert (=> d!52369 (=> (not res!81638) (not e!113412))))

(assert (=> d!52369 (= res!81638 (isStrictlySorted!318 lt!85398))))

(assert (=> d!52369 (= (lemmaContainsTupThenGetReturnValue!98 lt!85398 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) lt!85616)))

(declare-fun b!171861 () Bool)

(declare-fun res!81639 () Bool)

(assert (=> b!171861 (=> (not res!81639) (not e!113412))))

(assert (=> b!171861 (= res!81639 (containsKey!188 lt!85398 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(declare-fun b!171862 () Bool)

(assert (=> b!171862 (= e!113412 (contains!1141 lt!85398 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52369 res!81638) b!171861))

(assert (= (and b!171861 res!81639) b!171862))

(assert (=> d!52369 m!200039))

(declare-fun m!200885 () Bool)

(assert (=> d!52369 m!200885))

(declare-fun m!200887 () Bool)

(assert (=> d!52369 m!200887))

(declare-fun m!200889 () Bool)

(assert (=> b!171861 m!200889))

(declare-fun m!200891 () Bool)

(assert (=> b!171862 m!200891))

(assert (=> d!51997 d!52369))

(declare-fun b!171863 () Bool)

(declare-fun e!113415 () List!2176)

(declare-fun call!17473 () List!2176)

(assert (=> b!171863 (= e!113415 call!17473)))

(declare-fun b!171864 () Bool)

(assert (=> b!171864 (= e!113415 call!17473)))

(declare-fun b!171865 () Bool)

(declare-fun c!30770 () Bool)

(assert (=> b!171865 (= c!30770 (and ((_ is Cons!2172) (toList!1081 lt!85215)) (bvsgt (_1!1610 (h!2789 (toList!1081 lt!85215))) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))))

(declare-fun e!113414 () List!2176)

(assert (=> b!171865 (= e!113414 e!113415)))

(declare-fun d!52371 () Bool)

(declare-fun e!113413 () Bool)

(assert (=> d!52371 e!113413))

(declare-fun res!81641 () Bool)

(assert (=> d!52371 (=> (not res!81641) (not e!113413))))

(declare-fun lt!85617 () List!2176)

(assert (=> d!52371 (= res!81641 (isStrictlySorted!318 lt!85617))))

(declare-fun e!113417 () List!2176)

(assert (=> d!52371 (= lt!85617 e!113417)))

(declare-fun c!30771 () Bool)

(assert (=> d!52371 (= c!30771 (and ((_ is Cons!2172) (toList!1081 lt!85215)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85215))) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))))

(assert (=> d!52371 (isStrictlySorted!318 (toList!1081 lt!85215))))

(assert (=> d!52371 (= (insertStrictlySorted!101 (toList!1081 lt!85215) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) lt!85617)))

(declare-fun b!171866 () Bool)

(assert (=> b!171866 (= e!113417 e!113414)))

(declare-fun c!30772 () Bool)

(assert (=> b!171866 (= c!30772 (and ((_ is Cons!2172) (toList!1081 lt!85215)) (= (_1!1610 (h!2789 (toList!1081 lt!85215))) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))))

(declare-fun b!171867 () Bool)

(assert (=> b!171867 (= e!113413 (contains!1141 lt!85617 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))))

(declare-fun b!171868 () Bool)

(declare-fun call!17471 () List!2176)

(assert (=> b!171868 (= e!113414 call!17471)))

(declare-fun e!113416 () List!2176)

(declare-fun b!171869 () Bool)

(assert (=> b!171869 (= e!113416 (ite c!30772 (t!6970 (toList!1081 lt!85215)) (ite c!30770 (Cons!2172 (h!2789 (toList!1081 lt!85215)) (t!6970 (toList!1081 lt!85215))) Nil!2173)))))

(declare-fun bm!17468 () Bool)

(declare-fun call!17472 () List!2176)

(assert (=> bm!17468 (= call!17471 call!17472)))

(declare-fun b!171870 () Bool)

(assert (=> b!171870 (= e!113417 call!17472)))

(declare-fun b!171871 () Bool)

(assert (=> b!171871 (= e!113416 (insertStrictlySorted!101 (t!6970 (toList!1081 lt!85215)) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17469 () Bool)

(assert (=> bm!17469 (= call!17473 call!17471)))

(declare-fun b!171872 () Bool)

(declare-fun res!81640 () Bool)

(assert (=> b!171872 (=> (not res!81640) (not e!113413))))

(assert (=> b!171872 (= res!81640 (containsKey!188 lt!85617 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17470 () Bool)

(assert (=> bm!17470 (= call!17472 ($colon$colon!96 e!113416 (ite c!30771 (h!2789 (toList!1081 lt!85215)) (tuple2!3199 (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30773 () Bool)

(assert (=> bm!17470 (= c!30773 c!30771)))

(assert (= (and d!52371 c!30771) b!171870))

(assert (= (and d!52371 (not c!30771)) b!171866))

(assert (= (and b!171866 c!30772) b!171868))

(assert (= (and b!171866 (not c!30772)) b!171865))

(assert (= (and b!171865 c!30770) b!171863))

(assert (= (and b!171865 (not c!30770)) b!171864))

(assert (= (or b!171863 b!171864) bm!17469))

(assert (= (or b!171868 bm!17469) bm!17468))

(assert (= (or b!171870 bm!17468) bm!17470))

(assert (= (and bm!17470 c!30773) b!171871))

(assert (= (and bm!17470 (not c!30773)) b!171869))

(assert (= (and d!52371 res!81641) b!171872))

(assert (= (and b!171872 res!81640) b!171867))

(declare-fun m!200893 () Bool)

(assert (=> b!171871 m!200893))

(declare-fun m!200895 () Bool)

(assert (=> b!171872 m!200895))

(declare-fun m!200897 () Bool)

(assert (=> d!52371 m!200897))

(declare-fun m!200899 () Bool)

(assert (=> d!52371 m!200899))

(declare-fun m!200901 () Bool)

(assert (=> bm!17470 m!200901))

(declare-fun m!200903 () Bool)

(assert (=> b!171867 m!200903))

(assert (=> d!51997 d!52371))

(declare-fun b!171874 () Bool)

(declare-fun e!113418 () Option!191)

(declare-fun e!113419 () Option!191)

(assert (=> b!171874 (= e!113418 e!113419)))

(declare-fun c!30775 () Bool)

(assert (=> b!171874 (= c!30775 (and ((_ is Cons!2172) (toList!1081 lt!85295)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85295))) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(declare-fun b!171875 () Bool)

(assert (=> b!171875 (= e!113419 (getValueByKey!185 (t!6970 (toList!1081 lt!85295)) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun d!52373 () Bool)

(declare-fun c!30774 () Bool)

(assert (=> d!52373 (= c!30774 (and ((_ is Cons!2172) (toList!1081 lt!85295)) (= (_1!1610 (h!2789 (toList!1081 lt!85295))) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52373 (= (getValueByKey!185 (toList!1081 lt!85295) (_1!1610 (ite (or c!30529 c!30528) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) e!113418)))

(declare-fun b!171873 () Bool)

(assert (=> b!171873 (= e!113418 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85295)))))))

(declare-fun b!171876 () Bool)

(assert (=> b!171876 (= e!113419 None!189)))

(assert (= (and d!52373 c!30774) b!171873))

(assert (= (and d!52373 (not c!30774)) b!171874))

(assert (= (and b!171874 c!30775) b!171875))

(assert (= (and b!171874 (not c!30775)) b!171876))

(declare-fun m!200905 () Bool)

(assert (=> b!171875 m!200905))

(assert (=> b!171182 d!52373))

(declare-fun d!52375 () Bool)

(assert (=> d!52375 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85202) lt!85191)) (v!3915 (getValueByKey!185 (toList!1081 lt!85202) lt!85191)))))

(assert (=> d!51961 d!52375))

(declare-fun b!171878 () Bool)

(declare-fun e!113420 () Option!191)

(declare-fun e!113421 () Option!191)

(assert (=> b!171878 (= e!113420 e!113421)))

(declare-fun c!30777 () Bool)

(assert (=> b!171878 (= c!30777 (and ((_ is Cons!2172) (toList!1081 lt!85202)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85202))) lt!85191))))))

(declare-fun b!171879 () Bool)

(assert (=> b!171879 (= e!113421 (getValueByKey!185 (t!6970 (toList!1081 lt!85202)) lt!85191))))

(declare-fun d!52377 () Bool)

(declare-fun c!30776 () Bool)

(assert (=> d!52377 (= c!30776 (and ((_ is Cons!2172) (toList!1081 lt!85202)) (= (_1!1610 (h!2789 (toList!1081 lt!85202))) lt!85191)))))

(assert (=> d!52377 (= (getValueByKey!185 (toList!1081 lt!85202) lt!85191) e!113420)))

(declare-fun b!171877 () Bool)

(assert (=> b!171877 (= e!113420 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85202)))))))

(declare-fun b!171880 () Bool)

(assert (=> b!171880 (= e!113421 None!189)))

(assert (= (and d!52377 c!30776) b!171877))

(assert (= (and d!52377 (not c!30776)) b!171878))

(assert (= (and b!171878 c!30777) b!171879))

(assert (= (and b!171878 (not c!30777)) b!171880))

(declare-fun m!200907 () Bool)

(assert (=> b!171879 m!200907))

(assert (=> d!51961 d!52377))

(assert (=> b!171203 d!52045))

(declare-fun d!52379 () Bool)

(declare-fun lt!85618 () (_ BitVec 32))

(assert (=> d!52379 (and (bvsge lt!85618 #b00000000000000000000000000000000) (bvsle lt!85618 (bvsub (size!3673 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!113423 () (_ BitVec 32))

(assert (=> d!52379 (= lt!85618 e!113423)))

(declare-fun c!30778 () Bool)

(assert (=> d!52379 (= c!30778 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!52379 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3673 (_keys!5386 thiss!1248)) (size!3673 (_keys!5386 thiss!1248))))))

(assert (=> d!52379 (= (arrayCountValidKeys!0 (_keys!5386 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))) lt!85618)))

(declare-fun bm!17471 () Bool)

(declare-fun call!17474 () (_ BitVec 32))

(assert (=> bm!17471 (= call!17474 (arrayCountValidKeys!0 (_keys!5386 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171881 () Bool)

(declare-fun e!113422 () (_ BitVec 32))

(assert (=> b!171881 (= e!113422 (bvadd #b00000000000000000000000000000001 call!17474))))

(declare-fun b!171882 () Bool)

(assert (=> b!171882 (= e!113423 #b00000000000000000000000000000000)))

(declare-fun b!171883 () Bool)

(assert (=> b!171883 (= e!113422 call!17474)))

(declare-fun b!171884 () Bool)

(assert (=> b!171884 (= e!113423 e!113422)))

(declare-fun c!30779 () Bool)

(assert (=> b!171884 (= c!30779 (validKeyInArray!0 (select (arr!3380 (_keys!5386 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!52379 c!30778) b!171882))

(assert (= (and d!52379 (not c!30778)) b!171884))

(assert (= (and b!171884 c!30779) b!171881))

(assert (= (and b!171884 (not c!30779)) b!171883))

(assert (= (or b!171881 b!171883) bm!17471))

(declare-fun m!200909 () Bool)

(assert (=> bm!17471 m!200909))

(assert (=> b!171884 m!200319))

(assert (=> b!171884 m!200319))

(assert (=> b!171884 m!200321))

(assert (=> bm!17432 d!52379))

(assert (=> b!171111 d!52137))

(declare-fun d!52381 () Bool)

(declare-fun res!81642 () Bool)

(declare-fun e!113424 () Bool)

(assert (=> d!52381 (=> res!81642 e!113424)))

(assert (=> d!52381 (= res!81642 (and ((_ is Cons!2172) (toList!1081 lt!85199)) (= (_1!1610 (h!2789 (toList!1081 lt!85199))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52381 (= (containsKey!188 (toList!1081 lt!85199) #b0000000000000000000000000000000000000000000000000000000000000000) e!113424)))

(declare-fun b!171885 () Bool)

(declare-fun e!113425 () Bool)

(assert (=> b!171885 (= e!113424 e!113425)))

(declare-fun res!81643 () Bool)

(assert (=> b!171885 (=> (not res!81643) (not e!113425))))

(assert (=> b!171885 (= res!81643 (and (or (not ((_ is Cons!2172) (toList!1081 lt!85199))) (bvsle (_1!1610 (h!2789 (toList!1081 lt!85199))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2172) (toList!1081 lt!85199)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85199))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171886 () Bool)

(assert (=> b!171886 (= e!113425 (containsKey!188 (t!6970 (toList!1081 lt!85199)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52381 (not res!81642)) b!171885))

(assert (= (and b!171885 res!81643) b!171886))

(declare-fun m!200911 () Bool)

(assert (=> b!171886 m!200911))

(assert (=> d!51871 d!52381))

(assert (=> d!51935 d!51933))

(declare-fun d!52383 () Bool)

(assert (=> d!52383 (= (getValueByKey!185 lt!85123 (_1!1610 (tuple2!3199 key!828 v!309))) (Some!190 (_2!1610 (tuple2!3199 key!828 v!309))))))

(assert (=> d!52383 true))

(declare-fun _$22!532 () Unit!5251)

(assert (=> d!52383 (= (choose!930 lt!85123 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))) _$22!532)))

(declare-fun bs!7121 () Bool)

(assert (= bs!7121 d!52383))

(assert (=> bs!7121 m!199425))

(assert (=> d!51935 d!52383))

(declare-fun d!52385 () Bool)

(declare-fun res!81644 () Bool)

(declare-fun e!113426 () Bool)

(assert (=> d!52385 (=> res!81644 e!113426)))

(assert (=> d!52385 (= res!81644 (or ((_ is Nil!2173) lt!85123) ((_ is Nil!2173) (t!6970 lt!85123))))))

(assert (=> d!52385 (= (isStrictlySorted!318 lt!85123) e!113426)))

(declare-fun b!171887 () Bool)

(declare-fun e!113427 () Bool)

(assert (=> b!171887 (= e!113426 e!113427)))

(declare-fun res!81645 () Bool)

(assert (=> b!171887 (=> (not res!81645) (not e!113427))))

(assert (=> b!171887 (= res!81645 (bvslt (_1!1610 (h!2789 lt!85123)) (_1!1610 (h!2789 (t!6970 lt!85123)))))))

(declare-fun b!171888 () Bool)

(assert (=> b!171888 (= e!113427 (isStrictlySorted!318 (t!6970 lt!85123)))))

(assert (= (and d!52385 (not res!81644)) b!171887))

(assert (= (and b!171887 res!81645) b!171888))

(declare-fun m!200913 () Bool)

(assert (=> b!171888 m!200913))

(assert (=> d!51935 d!52385))

(declare-fun d!52387 () Bool)

(assert (=> d!52387 (arrayContainsKey!0 (_keys!5386 thiss!1248) lt!85323 #b00000000000000000000000000000000)))

(declare-fun lt!85619 () Unit!5251)

(assert (=> d!52387 (= lt!85619 (choose!13 (_keys!5386 thiss!1248) lt!85323 #b00000000000000000000000000000000))))

(assert (=> d!52387 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!52387 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5386 thiss!1248) lt!85323 #b00000000000000000000000000000000) lt!85619)))

(declare-fun bs!7122 () Bool)

(assert (= bs!7122 d!52387))

(assert (=> bs!7122 m!199775))

(declare-fun m!200915 () Bool)

(assert (=> bs!7122 m!200915))

(assert (=> b!171260 d!52387))

(declare-fun d!52389 () Bool)

(declare-fun res!81646 () Bool)

(declare-fun e!113428 () Bool)

(assert (=> d!52389 (=> res!81646 e!113428)))

(assert (=> d!52389 (= res!81646 (= (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) lt!85323))))

(assert (=> d!52389 (= (arrayContainsKey!0 (_keys!5386 thiss!1248) lt!85323 #b00000000000000000000000000000000) e!113428)))

(declare-fun b!171889 () Bool)

(declare-fun e!113429 () Bool)

(assert (=> b!171889 (= e!113428 e!113429)))

(declare-fun res!81647 () Bool)

(assert (=> b!171889 (=> (not res!81647) (not e!113429))))

(assert (=> b!171889 (= res!81647 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 thiss!1248))))))

(declare-fun b!171890 () Bool)

(assert (=> b!171890 (= e!113429 (arrayContainsKey!0 (_keys!5386 thiss!1248) lt!85323 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!52389 (not res!81646)) b!171889))

(assert (= (and b!171889 res!81647) b!171890))

(assert (=> d!52389 m!199453))

(declare-fun m!200917 () Bool)

(assert (=> b!171890 m!200917))

(assert (=> b!171260 d!52389))

(declare-fun b!171891 () Bool)

(declare-fun e!113432 () SeekEntryResult!528)

(declare-fun e!113430 () SeekEntryResult!528)

(assert (=> b!171891 (= e!113432 e!113430)))

(declare-fun lt!85620 () (_ BitVec 64))

(declare-fun lt!85622 () SeekEntryResult!528)

(assert (=> b!171891 (= lt!85620 (select (arr!3380 (_keys!5386 thiss!1248)) (index!4282 lt!85622)))))

(declare-fun c!30780 () Bool)

(assert (=> b!171891 (= c!30780 (= lt!85620 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171892 () Bool)

(assert (=> b!171892 (= e!113430 (Found!528 (index!4282 lt!85622)))))

(declare-fun b!171893 () Bool)

(declare-fun e!113431 () SeekEntryResult!528)

(assert (=> b!171893 (= e!113431 (MissingZero!528 (index!4282 lt!85622)))))

(declare-fun b!171894 () Bool)

(assert (=> b!171894 (= e!113431 (seekKeyOrZeroReturnVacant!0 (x!18953 lt!85622) (index!4282 lt!85622) (index!4282 lt!85622) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (_keys!5386 thiss!1248) (mask!8382 thiss!1248)))))

(declare-fun d!52391 () Bool)

(declare-fun lt!85621 () SeekEntryResult!528)

(assert (=> d!52391 (and (or ((_ is Undefined!528) lt!85621) (not ((_ is Found!528) lt!85621)) (and (bvsge (index!4281 lt!85621) #b00000000000000000000000000000000) (bvslt (index!4281 lt!85621) (size!3673 (_keys!5386 thiss!1248))))) (or ((_ is Undefined!528) lt!85621) ((_ is Found!528) lt!85621) (not ((_ is MissingZero!528) lt!85621)) (and (bvsge (index!4280 lt!85621) #b00000000000000000000000000000000) (bvslt (index!4280 lt!85621) (size!3673 (_keys!5386 thiss!1248))))) (or ((_ is Undefined!528) lt!85621) ((_ is Found!528) lt!85621) ((_ is MissingZero!528) lt!85621) (not ((_ is MissingVacant!528) lt!85621)) (and (bvsge (index!4283 lt!85621) #b00000000000000000000000000000000) (bvslt (index!4283 lt!85621) (size!3673 (_keys!5386 thiss!1248))))) (or ((_ is Undefined!528) lt!85621) (ite ((_ is Found!528) lt!85621) (= (select (arr!3380 (_keys!5386 thiss!1248)) (index!4281 lt!85621)) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!528) lt!85621) (= (select (arr!3380 (_keys!5386 thiss!1248)) (index!4280 lt!85621)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!528) lt!85621) (= (select (arr!3380 (_keys!5386 thiss!1248)) (index!4283 lt!85621)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52391 (= lt!85621 e!113432)))

(declare-fun c!30782 () Bool)

(assert (=> d!52391 (= c!30782 (and ((_ is Intermediate!528) lt!85622) (undefined!1340 lt!85622)))))

(assert (=> d!52391 (= lt!85622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (mask!8382 thiss!1248)) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (_keys!5386 thiss!1248) (mask!8382 thiss!1248)))))

(assert (=> d!52391 (validMask!0 (mask!8382 thiss!1248))))

(assert (=> d!52391 (= (seekEntryOrOpen!0 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (_keys!5386 thiss!1248) (mask!8382 thiss!1248)) lt!85621)))

(declare-fun b!171895 () Bool)

(assert (=> b!171895 (= e!113432 Undefined!528)))

(declare-fun b!171896 () Bool)

(declare-fun c!30781 () Bool)

(assert (=> b!171896 (= c!30781 (= lt!85620 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171896 (= e!113430 e!113431)))

(assert (= (and d!52391 c!30782) b!171895))

(assert (= (and d!52391 (not c!30782)) b!171891))

(assert (= (and b!171891 c!30780) b!171892))

(assert (= (and b!171891 (not c!30780)) b!171896))

(assert (= (and b!171896 c!30781) b!171893))

(assert (= (and b!171896 (not c!30781)) b!171894))

(declare-fun m!200919 () Bool)

(assert (=> b!171891 m!200919))

(assert (=> b!171894 m!199453))

(declare-fun m!200921 () Bool)

(assert (=> b!171894 m!200921))

(assert (=> d!52391 m!199509))

(assert (=> d!52391 m!199453))

(declare-fun m!200923 () Bool)

(assert (=> d!52391 m!200923))

(assert (=> d!52391 m!200923))

(assert (=> d!52391 m!199453))

(declare-fun m!200925 () Bool)

(assert (=> d!52391 m!200925))

(declare-fun m!200927 () Bool)

(assert (=> d!52391 m!200927))

(declare-fun m!200929 () Bool)

(assert (=> d!52391 m!200929))

(declare-fun m!200931 () Bool)

(assert (=> d!52391 m!200931))

(assert (=> b!171260 d!52391))

(declare-fun d!52393 () Bool)

(assert (=> d!52393 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85623 () Unit!5251)

(assert (=> d!52393 (= lt!85623 (choose!931 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!113433 () Bool)

(assert (=> d!52393 e!113433))

(declare-fun res!81648 () Bool)

(assert (=> d!52393 (=> (not res!81648) (not e!113433))))

(assert (=> d!52393 (= res!81648 (isStrictlySorted!318 (toList!1081 lt!85229)))))

(assert (=> d!52393 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85623)))

(declare-fun b!171897 () Bool)

(assert (=> b!171897 (= e!113433 (containsKey!188 (toList!1081 lt!85229) (_1!1610 (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52393 res!81648) b!171897))

(assert (=> d!52393 m!199579))

(assert (=> d!52393 m!199579))

(assert (=> d!52393 m!199737))

(declare-fun m!200933 () Bool)

(assert (=> d!52393 m!200933))

(declare-fun m!200935 () Bool)

(assert (=> d!52393 m!200935))

(assert (=> b!171897 m!199733))

(assert (=> b!171205 d!52393))

(assert (=> b!171205 d!52105))

(assert (=> b!171205 d!51975))

(declare-fun d!52395 () Bool)

(declare-fun lt!85624 () Bool)

(assert (=> d!52395 (= lt!85624 (select (content!148 (toList!1081 lt!85324)) (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun e!113435 () Bool)

(assert (=> d!52395 (= lt!85624 e!113435)))

(declare-fun res!81649 () Bool)

(assert (=> d!52395 (=> (not res!81649) (not e!113435))))

(assert (=> d!52395 (= res!81649 ((_ is Cons!2172) (toList!1081 lt!85324)))))

(assert (=> d!52395 (= (contains!1141 (toList!1081 lt!85324) (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85624)))

(declare-fun b!171898 () Bool)

(declare-fun e!113434 () Bool)

(assert (=> b!171898 (= e!113435 e!113434)))

(declare-fun res!81650 () Bool)

(assert (=> b!171898 (=> res!81650 e!113434)))

(assert (=> b!171898 (= res!81650 (= (h!2789 (toList!1081 lt!85324)) (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171899 () Bool)

(assert (=> b!171899 (= e!113434 (contains!1141 (t!6970 (toList!1081 lt!85324)) (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (= (and d!52395 res!81649) b!171898))

(assert (= (and b!171898 (not res!81650)) b!171899))

(declare-fun m!200937 () Bool)

(assert (=> d!52395 m!200937))

(declare-fun m!200939 () Bool)

(assert (=> d!52395 m!200939))

(declare-fun m!200941 () Bool)

(assert (=> b!171899 m!200941))

(assert (=> b!171263 d!52395))

(assert (=> b!171267 d!51889))

(declare-fun d!52397 () Bool)

(declare-fun e!113436 () Bool)

(assert (=> d!52397 e!113436))

(declare-fun res!81651 () Bool)

(assert (=> d!52397 (=> res!81651 e!113436)))

(declare-fun lt!85625 () Bool)

(assert (=> d!52397 (= res!81651 (not lt!85625))))

(declare-fun lt!85627 () Bool)

(assert (=> d!52397 (= lt!85625 lt!85627)))

(declare-fun lt!85628 () Unit!5251)

(declare-fun e!113437 () Unit!5251)

(assert (=> d!52397 (= lt!85628 e!113437)))

(declare-fun c!30783 () Bool)

(assert (=> d!52397 (= c!30783 lt!85627)))

(assert (=> d!52397 (= lt!85627 (containsKey!188 (toList!1081 lt!85248) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52397 (= (contains!1139 lt!85248 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85625)))

(declare-fun b!171900 () Bool)

(declare-fun lt!85626 () Unit!5251)

(assert (=> b!171900 (= e!113437 lt!85626)))

(assert (=> b!171900 (= lt!85626 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85248) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171900 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85248) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171901 () Bool)

(declare-fun Unit!5291 () Unit!5251)

(assert (=> b!171901 (= e!113437 Unit!5291)))

(declare-fun b!171902 () Bool)

(assert (=> b!171902 (= e!113436 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52397 c!30783) b!171900))

(assert (= (and d!52397 (not c!30783)) b!171901))

(assert (= (and d!52397 (not res!81651)) b!171902))

(declare-fun m!200943 () Bool)

(assert (=> d!52397 m!200943))

(declare-fun m!200945 () Bool)

(assert (=> b!171900 m!200945))

(declare-fun m!200947 () Bool)

(assert (=> b!171900 m!200947))

(assert (=> b!171900 m!200947))

(declare-fun m!200949 () Bool)

(assert (=> b!171900 m!200949))

(assert (=> b!171902 m!200947))

(assert (=> b!171902 m!200947))

(assert (=> b!171902 m!200949))

(assert (=> b!171115 d!52397))

(declare-fun d!52399 () Bool)

(assert (=> d!52399 (= (apply!129 lt!85290 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)) (get!1945 (getValueByKey!185 (toList!1081 lt!85290) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000))))))

(declare-fun bs!7123 () Bool)

(assert (= bs!7123 d!52399))

(assert (=> bs!7123 m!199631))

(declare-fun m!200951 () Bool)

(assert (=> bs!7123 m!200951))

(assert (=> bs!7123 m!200951))

(declare-fun m!200953 () Bool)

(assert (=> bs!7123 m!200953))

(assert (=> b!171163 d!52399))

(declare-fun d!52401 () Bool)

(declare-fun c!30784 () Bool)

(assert (=> d!52401 (= c!30784 ((_ is ValueCellFull!1658) (select (arr!3381 (_values!3537 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun e!113438 () V!4985)

(assert (=> d!52401 (= (get!1944 (select (arr!3381 (_values!3537 lt!85094)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 lt!85094) #b0000000000000000000000000000000000000000000000000000000000000000)) e!113438)))

(declare-fun b!171903 () Bool)

(assert (=> b!171903 (= e!113438 (get!1946 (select (arr!3381 (_values!3537 lt!85094)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 lt!85094) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171904 () Bool)

(assert (=> b!171904 (= e!113438 (get!1947 (select (arr!3381 (_values!3537 lt!85094)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 lt!85094) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52401 c!30784) b!171903))

(assert (= (and d!52401 (not c!30784)) b!171904))

(assert (=> b!171903 m!199691))

(assert (=> b!171903 m!199689))

(declare-fun m!200955 () Bool)

(assert (=> b!171903 m!200955))

(assert (=> b!171904 m!199691))

(assert (=> b!171904 m!199689))

(declare-fun m!200957 () Bool)

(assert (=> b!171904 m!200957))

(assert (=> b!171163 d!52401))

(declare-fun lt!85629 () Bool)

(declare-fun d!52403 () Bool)

(assert (=> d!52403 (= lt!85629 (select (content!148 (t!6970 (toList!1081 lt!85122))) (tuple2!3199 key!828 v!309)))))

(declare-fun e!113440 () Bool)

(assert (=> d!52403 (= lt!85629 e!113440)))

(declare-fun res!81652 () Bool)

(assert (=> d!52403 (=> (not res!81652) (not e!113440))))

(assert (=> d!52403 (= res!81652 ((_ is Cons!2172) (t!6970 (toList!1081 lt!85122))))))

(assert (=> d!52403 (= (contains!1141 (t!6970 (toList!1081 lt!85122)) (tuple2!3199 key!828 v!309)) lt!85629)))

(declare-fun b!171905 () Bool)

(declare-fun e!113439 () Bool)

(assert (=> b!171905 (= e!113440 e!113439)))

(declare-fun res!81653 () Bool)

(assert (=> b!171905 (=> res!81653 e!113439)))

(assert (=> b!171905 (= res!81653 (= (h!2789 (t!6970 (toList!1081 lt!85122))) (tuple2!3199 key!828 v!309)))))

(declare-fun b!171906 () Bool)

(assert (=> b!171906 (= e!113439 (contains!1141 (t!6970 (t!6970 (toList!1081 lt!85122))) (tuple2!3199 key!828 v!309)))))

(assert (= (and d!52403 res!81652) b!171905))

(assert (= (and b!171905 (not res!81653)) b!171906))

(assert (=> d!52403 m!200873))

(declare-fun m!200959 () Bool)

(assert (=> d!52403 m!200959))

(declare-fun m!200961 () Bool)

(assert (=> b!171906 m!200961))

(assert (=> b!171130 d!52403))

(declare-fun d!52405 () Bool)

(assert (=> d!52405 (= (size!3679 lt!85094) (bvadd (_size!1161 lt!85094) (bvsdiv (bvadd (extraKeys!3295 lt!85094) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!171384 d!52405))

(declare-fun d!52407 () Bool)

(declare-fun e!113441 () Bool)

(assert (=> d!52407 e!113441))

(declare-fun res!81654 () Bool)

(assert (=> d!52407 (=> res!81654 e!113441)))

(declare-fun lt!85630 () Bool)

(assert (=> d!52407 (= res!81654 (not lt!85630))))

(declare-fun lt!85632 () Bool)

(assert (=> d!52407 (= lt!85630 lt!85632)))

(declare-fun lt!85633 () Unit!5251)

(declare-fun e!113442 () Unit!5251)

(assert (=> d!52407 (= lt!85633 e!113442)))

(declare-fun c!30785 () Bool)

(assert (=> d!52407 (= c!30785 lt!85632)))

(assert (=> d!52407 (= lt!85632 (containsKey!188 (toList!1081 lt!85358) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(assert (=> d!52407 (= (contains!1139 lt!85358 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) lt!85630)))

(declare-fun b!171907 () Bool)

(declare-fun lt!85631 () Unit!5251)

(assert (=> b!171907 (= e!113442 lt!85631)))

(assert (=> b!171907 (= lt!85631 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85358) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(assert (=> b!171907 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85358) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(declare-fun b!171908 () Bool)

(declare-fun Unit!5292 () Unit!5251)

(assert (=> b!171908 (= e!113442 Unit!5292)))

(declare-fun b!171909 () Bool)

(assert (=> b!171909 (= e!113441 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85358) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52407 c!30785) b!171907))

(assert (= (and d!52407 (not c!30785)) b!171908))

(assert (= (and d!52407 (not res!81654)) b!171909))

(declare-fun m!200963 () Bool)

(assert (=> d!52407 m!200963))

(declare-fun m!200965 () Bool)

(assert (=> b!171907 m!200965))

(assert (=> b!171907 m!199899))

(assert (=> b!171907 m!199899))

(declare-fun m!200967 () Bool)

(assert (=> b!171907 m!200967))

(assert (=> b!171909 m!199899))

(assert (=> b!171909 m!199899))

(assert (=> b!171909 m!200967))

(assert (=> d!51947 d!52407))

(declare-fun b!171911 () Bool)

(declare-fun e!113443 () Option!191)

(declare-fun e!113444 () Option!191)

(assert (=> b!171911 (= e!113443 e!113444)))

(declare-fun c!30787 () Bool)

(assert (=> b!171911 (= c!30787 (and ((_ is Cons!2172) lt!85359) (not (= (_1!1610 (h!2789 lt!85359)) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171912 () Bool)

(assert (=> b!171912 (= e!113444 (getValueByKey!185 (t!6970 lt!85359) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(declare-fun c!30786 () Bool)

(declare-fun d!52409 () Bool)

(assert (=> d!52409 (= c!30786 (and ((_ is Cons!2172) lt!85359) (= (_1!1610 (h!2789 lt!85359)) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))))

(assert (=> d!52409 (= (getValueByKey!185 lt!85359 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) e!113443)))

(declare-fun b!171910 () Bool)

(assert (=> b!171910 (= e!113443 (Some!190 (_2!1610 (h!2789 lt!85359))))))

(declare-fun b!171913 () Bool)

(assert (=> b!171913 (= e!113444 None!189)))

(assert (= (and d!52409 c!30786) b!171910))

(assert (= (and d!52409 (not c!30786)) b!171911))

(assert (= (and b!171911 c!30787) b!171912))

(assert (= (and b!171911 (not c!30787)) b!171913))

(declare-fun m!200969 () Bool)

(assert (=> b!171912 m!200969))

(assert (=> d!51947 d!52409))

(declare-fun d!52411 () Bool)

(assert (=> d!52411 (= (getValueByKey!185 lt!85359 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85634 () Unit!5251)

(assert (=> d!52411 (= lt!85634 (choose!930 lt!85359 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(declare-fun e!113445 () Bool)

(assert (=> d!52411 e!113445))

(declare-fun res!81655 () Bool)

(assert (=> d!52411 (=> (not res!81655) (not e!113445))))

(assert (=> d!52411 (= res!81655 (isStrictlySorted!318 lt!85359))))

(assert (=> d!52411 (= (lemmaContainsTupThenGetReturnValue!98 lt!85359 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) lt!85634)))

(declare-fun b!171914 () Bool)

(declare-fun res!81656 () Bool)

(assert (=> b!171914 (=> (not res!81656) (not e!113445))))

(assert (=> b!171914 (= res!81656 (containsKey!188 lt!85359 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(declare-fun b!171915 () Bool)

(assert (=> b!171915 (= e!113445 (contains!1141 lt!85359 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52411 res!81655) b!171914))

(assert (= (and b!171914 res!81656) b!171915))

(assert (=> d!52411 m!199893))

(declare-fun m!200971 () Bool)

(assert (=> d!52411 m!200971))

(declare-fun m!200973 () Bool)

(assert (=> d!52411 m!200973))

(declare-fun m!200975 () Bool)

(assert (=> b!171914 m!200975))

(declare-fun m!200977 () Bool)

(assert (=> b!171915 m!200977))

(assert (=> d!51947 d!52411))

(declare-fun b!171916 () Bool)

(declare-fun e!113448 () List!2176)

(declare-fun call!17477 () List!2176)

(assert (=> b!171916 (= e!113448 call!17477)))

(declare-fun b!171917 () Bool)

(assert (=> b!171917 (= e!113448 call!17477)))

(declare-fun c!30788 () Bool)

(declare-fun b!171918 () Bool)

(assert (=> b!171918 (= c!30788 (and ((_ is Cons!2172) (toList!1081 lt!85201)) (bvsgt (_1!1610 (h!2789 (toList!1081 lt!85201))) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))))

(declare-fun e!113447 () List!2176)

(assert (=> b!171918 (= e!113447 e!113448)))

(declare-fun d!52413 () Bool)

(declare-fun e!113446 () Bool)

(assert (=> d!52413 e!113446))

(declare-fun res!81658 () Bool)

(assert (=> d!52413 (=> (not res!81658) (not e!113446))))

(declare-fun lt!85635 () List!2176)

(assert (=> d!52413 (= res!81658 (isStrictlySorted!318 lt!85635))))

(declare-fun e!113450 () List!2176)

(assert (=> d!52413 (= lt!85635 e!113450)))

(declare-fun c!30789 () Bool)

(assert (=> d!52413 (= c!30789 (and ((_ is Cons!2172) (toList!1081 lt!85201)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85201))) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))))

(assert (=> d!52413 (isStrictlySorted!318 (toList!1081 lt!85201))))

(assert (=> d!52413 (= (insertStrictlySorted!101 (toList!1081 lt!85201) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))) lt!85635)))

(declare-fun b!171919 () Bool)

(assert (=> b!171919 (= e!113450 e!113447)))

(declare-fun c!30790 () Bool)

(assert (=> b!171919 (= c!30790 (and ((_ is Cons!2172) (toList!1081 lt!85201)) (= (_1!1610 (h!2789 (toList!1081 lt!85201))) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))))

(declare-fun b!171920 () Bool)

(assert (=> b!171920 (= e!113446 (contains!1141 lt!85635 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))))))))

(declare-fun b!171921 () Bool)

(declare-fun call!17475 () List!2176)

(assert (=> b!171921 (= e!113447 call!17475)))

(declare-fun e!113449 () List!2176)

(declare-fun b!171922 () Bool)

(assert (=> b!171922 (= e!113449 (ite c!30790 (t!6970 (toList!1081 lt!85201)) (ite c!30788 (Cons!2172 (h!2789 (toList!1081 lt!85201)) (t!6970 (toList!1081 lt!85201))) Nil!2173)))))

(declare-fun bm!17472 () Bool)

(declare-fun call!17476 () List!2176)

(assert (=> bm!17472 (= call!17475 call!17476)))

(declare-fun b!171923 () Bool)

(assert (=> b!171923 (= e!113450 call!17476)))

(declare-fun b!171924 () Bool)

(assert (=> b!171924 (= e!113449 (insertStrictlySorted!101 (t!6970 (toList!1081 lt!85201)) (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17473 () Bool)

(assert (=> bm!17473 (= call!17477 call!17475)))

(declare-fun b!171925 () Bool)

(declare-fun res!81657 () Bool)

(assert (=> b!171925 (=> (not res!81657) (not e!113446))))

(assert (=> b!171925 (= res!81657 (containsKey!188 lt!85635 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17474 () Bool)

(assert (=> bm!17474 (= call!17476 ($colon$colon!96 e!113449 (ite c!30789 (h!2789 (toList!1081 lt!85201)) (tuple2!3199 (_1!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 lt!85203 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30791 () Bool)

(assert (=> bm!17474 (= c!30791 c!30789)))

(assert (= (and d!52413 c!30789) b!171923))

(assert (= (and d!52413 (not c!30789)) b!171919))

(assert (= (and b!171919 c!30790) b!171921))

(assert (= (and b!171919 (not c!30790)) b!171918))

(assert (= (and b!171918 c!30788) b!171916))

(assert (= (and b!171918 (not c!30788)) b!171917))

(assert (= (or b!171916 b!171917) bm!17473))

(assert (= (or b!171921 bm!17473) bm!17472))

(assert (= (or b!171923 bm!17472) bm!17474))

(assert (= (and bm!17474 c!30791) b!171924))

(assert (= (and bm!17474 (not c!30791)) b!171922))

(assert (= (and d!52413 res!81658) b!171925))

(assert (= (and b!171925 res!81657) b!171920))

(declare-fun m!200979 () Bool)

(assert (=> b!171924 m!200979))

(declare-fun m!200981 () Bool)

(assert (=> b!171925 m!200981))

(declare-fun m!200983 () Bool)

(assert (=> d!52413 m!200983))

(declare-fun m!200985 () Bool)

(assert (=> d!52413 m!200985))

(declare-fun m!200987 () Bool)

(assert (=> bm!17474 m!200987))

(declare-fun m!200989 () Bool)

(assert (=> b!171920 m!200989))

(assert (=> d!51947 d!52413))

(assert (=> b!171181 d!52045))

(declare-fun d!52415 () Bool)

(declare-fun res!81659 () Bool)

(declare-fun e!113451 () Bool)

(assert (=> d!52415 (=> res!81659 e!113451)))

(assert (=> d!52415 (= res!81659 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)))) (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))))) lt!85187)))))

(assert (=> d!52415 (= (containsKey!188 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))) lt!85187) e!113451)))

(declare-fun b!171926 () Bool)

(declare-fun e!113452 () Bool)

(assert (=> b!171926 (= e!113451 e!113452)))

(declare-fun res!81660 () Bool)

(assert (=> b!171926 (=> (not res!81660) (not e!113452))))

(assert (=> b!171926 (= res!81660 (and (or (not ((_ is Cons!2172) (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))))) (bvsle (_1!1610 (h!2789 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))))) lt!85187)) ((_ is Cons!2172) (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)))) (bvslt (_1!1610 (h!2789 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309))))) lt!85187)))))

(declare-fun b!171927 () Bool)

(assert (=> b!171927 (= e!113452 (containsKey!188 (t!6970 (toList!1081 (+!243 lt!85198 (tuple2!3199 lt!85184 v!309)))) lt!85187))))

(assert (= (and d!52415 (not res!81659)) b!171926))

(assert (= (and b!171926 res!81660) b!171927))

(declare-fun m!200991 () Bool)

(assert (=> b!171927 m!200991))

(assert (=> d!51945 d!52415))

(declare-fun d!52417 () Bool)

(assert (=> d!52417 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85636 () Unit!5251)

(assert (=> d!52417 (= lt!85636 (choose!931 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113453 () Bool)

(assert (=> d!52417 e!113453))

(declare-fun res!81661 () Bool)

(assert (=> d!52417 (=> (not res!81661) (not e!113453))))

(assert (=> d!52417 (= res!81661 (isStrictlySorted!318 (toList!1081 lt!85224)))))

(assert (=> d!52417 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000) lt!85636)))

(declare-fun b!171928 () Bool)

(assert (=> b!171928 (= e!113453 (containsKey!188 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52417 res!81661) b!171928))

(assert (=> d!52417 m!199627))

(assert (=> d!52417 m!199627))

(assert (=> d!52417 m!199717))

(declare-fun m!200993 () Bool)

(assert (=> d!52417 m!200993))

(assert (=> d!52417 m!200267))

(assert (=> b!171928 m!199713))

(assert (=> b!171184 d!52417))

(assert (=> b!171184 d!52029))

(assert (=> b!171184 d!52031))

(declare-fun b!171930 () Bool)

(declare-fun e!113454 () Option!191)

(declare-fun e!113455 () Option!191)

(assert (=> b!171930 (= e!113454 e!113455)))

(declare-fun c!30793 () Bool)

(assert (=> b!171930 (= c!30793 (and ((_ is Cons!2172) (toList!1081 lt!85397)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85397))) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))))

(declare-fun b!171931 () Bool)

(assert (=> b!171931 (= e!113455 (getValueByKey!185 (t!6970 (toList!1081 lt!85397)) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))))))

(declare-fun c!30792 () Bool)

(declare-fun d!52419 () Bool)

(assert (=> d!52419 (= c!30792 (and ((_ is Cons!2172) (toList!1081 lt!85397)) (= (_1!1610 (h!2789 (toList!1081 lt!85397))) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248))))))))

(assert (=> d!52419 (= (getValueByKey!185 (toList!1081 lt!85397) (_1!1610 (tuple2!3199 lt!85214 (minValue!3397 thiss!1248)))) e!113454)))

(declare-fun b!171929 () Bool)

(assert (=> b!171929 (= e!113454 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85397)))))))

(declare-fun b!171932 () Bool)

(assert (=> b!171932 (= e!113455 None!189)))

(assert (= (and d!52419 c!30792) b!171929))

(assert (= (and d!52419 (not c!30792)) b!171930))

(assert (= (and b!171930 c!30793) b!171931))

(assert (= (and b!171930 (not c!30793)) b!171932))

(declare-fun m!200995 () Bool)

(assert (=> b!171931 m!200995))

(assert (=> b!171366 d!52419))

(declare-fun d!52421 () Bool)

(assert (=> d!52421 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))) (v!3915 (getValueByKey!185 (toList!1081 lt!85224) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!51929 d!52421))

(assert (=> d!51929 d!52093))

(assert (=> d!51923 d!51925))

(assert (=> d!51923 d!51927))

(declare-fun d!52423 () Bool)

(assert (=> d!52423 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85093) key!828))))

(assert (=> d!52423 true))

(declare-fun _$12!443 () Unit!5251)

(assert (=> d!52423 (= (choose!931 (toList!1081 lt!85093) key!828) _$12!443)))

(declare-fun bs!7124 () Bool)

(assert (= bs!7124 d!52423))

(assert (=> bs!7124 m!199439))

(assert (=> bs!7124 m!199439))

(assert (=> bs!7124 m!199441))

(assert (=> d!51923 d!52423))

(declare-fun d!52425 () Bool)

(declare-fun res!81662 () Bool)

(declare-fun e!113456 () Bool)

(assert (=> d!52425 (=> res!81662 e!113456)))

(assert (=> d!52425 (= res!81662 (or ((_ is Nil!2173) (toList!1081 lt!85093)) ((_ is Nil!2173) (t!6970 (toList!1081 lt!85093)))))))

(assert (=> d!52425 (= (isStrictlySorted!318 (toList!1081 lt!85093)) e!113456)))

(declare-fun b!171933 () Bool)

(declare-fun e!113457 () Bool)

(assert (=> b!171933 (= e!113456 e!113457)))

(declare-fun res!81663 () Bool)

(assert (=> b!171933 (=> (not res!81663) (not e!113457))))

(assert (=> b!171933 (= res!81663 (bvslt (_1!1610 (h!2789 (toList!1081 lt!85093))) (_1!1610 (h!2789 (t!6970 (toList!1081 lt!85093))))))))

(declare-fun b!171934 () Bool)

(assert (=> b!171934 (= e!113457 (isStrictlySorted!318 (t!6970 (toList!1081 lt!85093))))))

(assert (= (and d!52425 (not res!81662)) b!171933))

(assert (= (and b!171933 res!81663) b!171934))

(declare-fun m!200997 () Bool)

(assert (=> b!171934 m!200997))

(assert (=> d!51923 d!52425))

(assert (=> b!171189 d!52121))

(assert (=> b!171189 d!52123))

(assert (=> d!51917 d!51869))

(declare-fun d!52427 () Bool)

(declare-fun e!113458 () Bool)

(assert (=> d!52427 e!113458))

(declare-fun res!81664 () Bool)

(assert (=> d!52427 (=> res!81664 e!113458)))

(declare-fun lt!85637 () Bool)

(assert (=> d!52427 (= res!81664 (not lt!85637))))

(declare-fun lt!85639 () Bool)

(assert (=> d!52427 (= lt!85637 lt!85639)))

(declare-fun lt!85640 () Unit!5251)

(declare-fun e!113459 () Unit!5251)

(assert (=> d!52427 (= lt!85640 e!113459)))

(declare-fun c!30794 () Bool)

(assert (=> d!52427 (= c!30794 lt!85639)))

(assert (=> d!52427 (= lt!85639 (containsKey!188 (toList!1081 lt!85370) (_1!1610 (tuple2!3199 lt!85184 v!309))))))

(assert (=> d!52427 (= (contains!1139 lt!85370 (_1!1610 (tuple2!3199 lt!85184 v!309))) lt!85637)))

(declare-fun b!171935 () Bool)

(declare-fun lt!85638 () Unit!5251)

(assert (=> b!171935 (= e!113459 lt!85638)))

(assert (=> b!171935 (= lt!85638 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85370) (_1!1610 (tuple2!3199 lt!85184 v!309))))))

(assert (=> b!171935 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85370) (_1!1610 (tuple2!3199 lt!85184 v!309))))))

(declare-fun b!171936 () Bool)

(declare-fun Unit!5293 () Unit!5251)

(assert (=> b!171936 (= e!113459 Unit!5293)))

(declare-fun b!171937 () Bool)

(assert (=> b!171937 (= e!113458 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85370) (_1!1610 (tuple2!3199 lt!85184 v!309)))))))

(assert (= (and d!52427 c!30794) b!171935))

(assert (= (and d!52427 (not c!30794)) b!171936))

(assert (= (and d!52427 (not res!81664)) b!171937))

(declare-fun m!200999 () Bool)

(assert (=> d!52427 m!200999))

(declare-fun m!201001 () Bool)

(assert (=> b!171935 m!201001))

(assert (=> b!171935 m!199947))

(assert (=> b!171935 m!199947))

(declare-fun m!201003 () Bool)

(assert (=> b!171935 m!201003))

(assert (=> b!171937 m!199947))

(assert (=> b!171937 m!199947))

(assert (=> b!171937 m!201003))

(assert (=> d!51963 d!52427))

(declare-fun b!171939 () Bool)

(declare-fun e!113460 () Option!191)

(declare-fun e!113461 () Option!191)

(assert (=> b!171939 (= e!113460 e!113461)))

(declare-fun c!30796 () Bool)

(assert (=> b!171939 (= c!30796 (and ((_ is Cons!2172) lt!85371) (not (= (_1!1610 (h!2789 lt!85371)) (_1!1610 (tuple2!3199 lt!85184 v!309))))))))

(declare-fun b!171940 () Bool)

(assert (=> b!171940 (= e!113461 (getValueByKey!185 (t!6970 lt!85371) (_1!1610 (tuple2!3199 lt!85184 v!309))))))

(declare-fun c!30795 () Bool)

(declare-fun d!52429 () Bool)

(assert (=> d!52429 (= c!30795 (and ((_ is Cons!2172) lt!85371) (= (_1!1610 (h!2789 lt!85371)) (_1!1610 (tuple2!3199 lt!85184 v!309)))))))

(assert (=> d!52429 (= (getValueByKey!185 lt!85371 (_1!1610 (tuple2!3199 lt!85184 v!309))) e!113460)))

(declare-fun b!171938 () Bool)

(assert (=> b!171938 (= e!113460 (Some!190 (_2!1610 (h!2789 lt!85371))))))

(declare-fun b!171941 () Bool)

(assert (=> b!171941 (= e!113461 None!189)))

(assert (= (and d!52429 c!30795) b!171938))

(assert (= (and d!52429 (not c!30795)) b!171939))

(assert (= (and b!171939 c!30796) b!171940))

(assert (= (and b!171939 (not c!30796)) b!171941))

(declare-fun m!201005 () Bool)

(assert (=> b!171940 m!201005))

(assert (=> d!51963 d!52429))

(declare-fun d!52431 () Bool)

(assert (=> d!52431 (= (getValueByKey!185 lt!85371 (_1!1610 (tuple2!3199 lt!85184 v!309))) (Some!190 (_2!1610 (tuple2!3199 lt!85184 v!309))))))

(declare-fun lt!85641 () Unit!5251)

(assert (=> d!52431 (= lt!85641 (choose!930 lt!85371 (_1!1610 (tuple2!3199 lt!85184 v!309)) (_2!1610 (tuple2!3199 lt!85184 v!309))))))

(declare-fun e!113462 () Bool)

(assert (=> d!52431 e!113462))

(declare-fun res!81665 () Bool)

(assert (=> d!52431 (=> (not res!81665) (not e!113462))))

(assert (=> d!52431 (= res!81665 (isStrictlySorted!318 lt!85371))))

(assert (=> d!52431 (= (lemmaContainsTupThenGetReturnValue!98 lt!85371 (_1!1610 (tuple2!3199 lt!85184 v!309)) (_2!1610 (tuple2!3199 lt!85184 v!309))) lt!85641)))

(declare-fun b!171942 () Bool)

(declare-fun res!81666 () Bool)

(assert (=> b!171942 (=> (not res!81666) (not e!113462))))

(assert (=> b!171942 (= res!81666 (containsKey!188 lt!85371 (_1!1610 (tuple2!3199 lt!85184 v!309))))))

(declare-fun b!171943 () Bool)

(assert (=> b!171943 (= e!113462 (contains!1141 lt!85371 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85184 v!309)) (_2!1610 (tuple2!3199 lt!85184 v!309)))))))

(assert (= (and d!52431 res!81665) b!171942))

(assert (= (and b!171942 res!81666) b!171943))

(assert (=> d!52431 m!199941))

(declare-fun m!201007 () Bool)

(assert (=> d!52431 m!201007))

(declare-fun m!201009 () Bool)

(assert (=> d!52431 m!201009))

(declare-fun m!201011 () Bool)

(assert (=> b!171942 m!201011))

(declare-fun m!201013 () Bool)

(assert (=> b!171943 m!201013))

(assert (=> d!51963 d!52431))

(declare-fun b!171944 () Bool)

(declare-fun e!113465 () List!2176)

(declare-fun call!17480 () List!2176)

(assert (=> b!171944 (= e!113465 call!17480)))

(declare-fun b!171945 () Bool)

(assert (=> b!171945 (= e!113465 call!17480)))

(declare-fun b!171946 () Bool)

(declare-fun c!30797 () Bool)

(assert (=> b!171946 (= c!30797 (and ((_ is Cons!2172) (toList!1081 lt!85198)) (bvsgt (_1!1610 (h!2789 (toList!1081 lt!85198))) (_1!1610 (tuple2!3199 lt!85184 v!309)))))))

(declare-fun e!113464 () List!2176)

(assert (=> b!171946 (= e!113464 e!113465)))

(declare-fun d!52433 () Bool)

(declare-fun e!113463 () Bool)

(assert (=> d!52433 e!113463))

(declare-fun res!81668 () Bool)

(assert (=> d!52433 (=> (not res!81668) (not e!113463))))

(declare-fun lt!85642 () List!2176)

(assert (=> d!52433 (= res!81668 (isStrictlySorted!318 lt!85642))))

(declare-fun e!113467 () List!2176)

(assert (=> d!52433 (= lt!85642 e!113467)))

(declare-fun c!30798 () Bool)

(assert (=> d!52433 (= c!30798 (and ((_ is Cons!2172) (toList!1081 lt!85198)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85198))) (_1!1610 (tuple2!3199 lt!85184 v!309)))))))

(assert (=> d!52433 (isStrictlySorted!318 (toList!1081 lt!85198))))

(assert (=> d!52433 (= (insertStrictlySorted!101 (toList!1081 lt!85198) (_1!1610 (tuple2!3199 lt!85184 v!309)) (_2!1610 (tuple2!3199 lt!85184 v!309))) lt!85642)))

(declare-fun b!171947 () Bool)

(assert (=> b!171947 (= e!113467 e!113464)))

(declare-fun c!30799 () Bool)

(assert (=> b!171947 (= c!30799 (and ((_ is Cons!2172) (toList!1081 lt!85198)) (= (_1!1610 (h!2789 (toList!1081 lt!85198))) (_1!1610 (tuple2!3199 lt!85184 v!309)))))))

(declare-fun b!171948 () Bool)

(assert (=> b!171948 (= e!113463 (contains!1141 lt!85642 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85184 v!309)) (_2!1610 (tuple2!3199 lt!85184 v!309)))))))

(declare-fun b!171949 () Bool)

(declare-fun call!17478 () List!2176)

(assert (=> b!171949 (= e!113464 call!17478)))

(declare-fun e!113466 () List!2176)

(declare-fun b!171950 () Bool)

(assert (=> b!171950 (= e!113466 (ite c!30799 (t!6970 (toList!1081 lt!85198)) (ite c!30797 (Cons!2172 (h!2789 (toList!1081 lt!85198)) (t!6970 (toList!1081 lt!85198))) Nil!2173)))))

(declare-fun bm!17475 () Bool)

(declare-fun call!17479 () List!2176)

(assert (=> bm!17475 (= call!17478 call!17479)))

(declare-fun b!171951 () Bool)

(assert (=> b!171951 (= e!113467 call!17479)))

(declare-fun b!171952 () Bool)

(assert (=> b!171952 (= e!113466 (insertStrictlySorted!101 (t!6970 (toList!1081 lt!85198)) (_1!1610 (tuple2!3199 lt!85184 v!309)) (_2!1610 (tuple2!3199 lt!85184 v!309))))))

(declare-fun bm!17476 () Bool)

(assert (=> bm!17476 (= call!17480 call!17478)))

(declare-fun b!171953 () Bool)

(declare-fun res!81667 () Bool)

(assert (=> b!171953 (=> (not res!81667) (not e!113463))))

(assert (=> b!171953 (= res!81667 (containsKey!188 lt!85642 (_1!1610 (tuple2!3199 lt!85184 v!309))))))

(declare-fun bm!17477 () Bool)

(assert (=> bm!17477 (= call!17479 ($colon$colon!96 e!113466 (ite c!30798 (h!2789 (toList!1081 lt!85198)) (tuple2!3199 (_1!1610 (tuple2!3199 lt!85184 v!309)) (_2!1610 (tuple2!3199 lt!85184 v!309))))))))

(declare-fun c!30800 () Bool)

(assert (=> bm!17477 (= c!30800 c!30798)))

(assert (= (and d!52433 c!30798) b!171951))

(assert (= (and d!52433 (not c!30798)) b!171947))

(assert (= (and b!171947 c!30799) b!171949))

(assert (= (and b!171947 (not c!30799)) b!171946))

(assert (= (and b!171946 c!30797) b!171944))

(assert (= (and b!171946 (not c!30797)) b!171945))

(assert (= (or b!171944 b!171945) bm!17476))

(assert (= (or b!171949 bm!17476) bm!17475))

(assert (= (or b!171951 bm!17475) bm!17477))

(assert (= (and bm!17477 c!30800) b!171952))

(assert (= (and bm!17477 (not c!30800)) b!171950))

(assert (= (and d!52433 res!81668) b!171953))

(assert (= (and b!171953 res!81667) b!171948))

(declare-fun m!201015 () Bool)

(assert (=> b!171952 m!201015))

(declare-fun m!201017 () Bool)

(assert (=> b!171953 m!201017))

(declare-fun m!201019 () Bool)

(assert (=> d!52433 m!201019))

(declare-fun m!201021 () Bool)

(assert (=> d!52433 m!201021))

(declare-fun m!201023 () Bool)

(assert (=> bm!17477 m!201023))

(declare-fun m!201025 () Bool)

(assert (=> b!171948 m!201025))

(assert (=> d!51963 d!52433))

(declare-fun d!52435 () Bool)

(declare-fun res!81669 () Bool)

(declare-fun e!113468 () Bool)

(assert (=> d!52435 (=> res!81669 e!113468)))

(assert (=> d!52435 (= res!81669 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))) (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))) lt!85212)))))

(assert (=> d!52435 (= (containsKey!188 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))) lt!85212) e!113468)))

(declare-fun b!171954 () Bool)

(declare-fun e!113469 () Bool)

(assert (=> b!171954 (= e!113468 e!113469)))

(declare-fun res!81670 () Bool)

(assert (=> b!171954 (=> (not res!81670) (not e!113469))))

(assert (=> b!171954 (= res!81670 (and (or (not ((_ is Cons!2172) (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))) (bvsle (_1!1610 (h!2789 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))) lt!85212)) ((_ is Cons!2172) (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))) (bvslt (_1!1610 (h!2789 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248)))))) lt!85212)))))

(declare-fun b!171955 () Bool)

(assert (=> b!171955 (= e!113469 (containsKey!188 (t!6970 (toList!1081 (+!243 lt!85223 (tuple2!3199 lt!85209 (zeroValue!3397 thiss!1248))))) lt!85212))))

(assert (= (and d!52435 (not res!81669)) b!171954))

(assert (= (and b!171954 res!81670) b!171955))

(declare-fun m!201027 () Bool)

(assert (=> b!171955 m!201027))

(assert (=> d!52003 d!52435))

(assert (=> d!51885 d!52227))

(declare-fun d!52437 () Bool)

(assert (=> d!52437 (not (contains!1139 (+!243 lt!85249 (tuple2!3199 lt!85250 lt!85253)) lt!85251))))

(declare-fun lt!85643 () Unit!5251)

(assert (=> d!52437 (= lt!85643 (choose!934 lt!85249 lt!85250 lt!85253 lt!85251))))

(declare-fun e!113470 () Bool)

(assert (=> d!52437 e!113470))

(declare-fun res!81671 () Bool)

(assert (=> d!52437 (=> (not res!81671) (not e!113470))))

(assert (=> d!52437 (= res!81671 (not (contains!1139 lt!85249 lt!85251)))))

(assert (=> d!52437 (= (addStillNotContains!73 lt!85249 lt!85250 lt!85253 lt!85251) lt!85643)))

(declare-fun b!171956 () Bool)

(assert (=> b!171956 (= e!113470 (not (= lt!85250 lt!85251)))))

(assert (= (and d!52437 res!81671) b!171956))

(assert (=> d!52437 m!199591))

(assert (=> d!52437 m!199591))

(assert (=> d!52437 m!199593))

(declare-fun m!201029 () Bool)

(assert (=> d!52437 m!201029))

(declare-fun m!201031 () Bool)

(assert (=> d!52437 m!201031))

(assert (=> b!171118 d!52437))

(declare-fun d!52439 () Bool)

(declare-fun e!113471 () Bool)

(assert (=> d!52439 e!113471))

(declare-fun res!81672 () Bool)

(assert (=> d!52439 (=> res!81672 e!113471)))

(declare-fun lt!85644 () Bool)

(assert (=> d!52439 (= res!81672 (not lt!85644))))

(declare-fun lt!85646 () Bool)

(assert (=> d!52439 (= lt!85644 lt!85646)))

(declare-fun lt!85647 () Unit!5251)

(declare-fun e!113472 () Unit!5251)

(assert (=> d!52439 (= lt!85647 e!113472)))

(declare-fun c!30801 () Bool)

(assert (=> d!52439 (= c!30801 lt!85646)))

(assert (=> d!52439 (= lt!85646 (containsKey!188 (toList!1081 (+!243 lt!85249 (tuple2!3199 lt!85250 lt!85253))) lt!85251))))

(assert (=> d!52439 (= (contains!1139 (+!243 lt!85249 (tuple2!3199 lt!85250 lt!85253)) lt!85251) lt!85644)))

(declare-fun b!171957 () Bool)

(declare-fun lt!85645 () Unit!5251)

(assert (=> b!171957 (= e!113472 lt!85645)))

(assert (=> b!171957 (= lt!85645 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 (+!243 lt!85249 (tuple2!3199 lt!85250 lt!85253))) lt!85251))))

(assert (=> b!171957 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85249 (tuple2!3199 lt!85250 lt!85253))) lt!85251))))

(declare-fun b!171958 () Bool)

(declare-fun Unit!5294 () Unit!5251)

(assert (=> b!171958 (= e!113472 Unit!5294)))

(declare-fun b!171959 () Bool)

(assert (=> b!171959 (= e!113471 (isDefined!137 (getValueByKey!185 (toList!1081 (+!243 lt!85249 (tuple2!3199 lt!85250 lt!85253))) lt!85251)))))

(assert (= (and d!52439 c!30801) b!171957))

(assert (= (and d!52439 (not c!30801)) b!171958))

(assert (= (and d!52439 (not res!81672)) b!171959))

(declare-fun m!201033 () Bool)

(assert (=> d!52439 m!201033))

(declare-fun m!201035 () Bool)

(assert (=> b!171957 m!201035))

(declare-fun m!201037 () Bool)

(assert (=> b!171957 m!201037))

(assert (=> b!171957 m!201037))

(declare-fun m!201039 () Bool)

(assert (=> b!171957 m!201039))

(assert (=> b!171959 m!201037))

(assert (=> b!171959 m!201037))

(assert (=> b!171959 m!201039))

(assert (=> b!171118 d!52439))

(assert (=> b!171118 d!51877))

(declare-fun d!52441 () Bool)

(declare-fun e!113473 () Bool)

(assert (=> d!52441 e!113473))

(declare-fun res!81674 () Bool)

(assert (=> d!52441 (=> (not res!81674) (not e!113473))))

(declare-fun lt!85648 () ListLongMap!2131)

(assert (=> d!52441 (= res!81674 (contains!1139 lt!85648 (_1!1610 (tuple2!3199 lt!85250 lt!85253))))))

(declare-fun lt!85649 () List!2176)

(assert (=> d!52441 (= lt!85648 (ListLongMap!2132 lt!85649))))

(declare-fun lt!85651 () Unit!5251)

(declare-fun lt!85650 () Unit!5251)

(assert (=> d!52441 (= lt!85651 lt!85650)))

(assert (=> d!52441 (= (getValueByKey!185 lt!85649 (_1!1610 (tuple2!3199 lt!85250 lt!85253))) (Some!190 (_2!1610 (tuple2!3199 lt!85250 lt!85253))))))

(assert (=> d!52441 (= lt!85650 (lemmaContainsTupThenGetReturnValue!98 lt!85649 (_1!1610 (tuple2!3199 lt!85250 lt!85253)) (_2!1610 (tuple2!3199 lt!85250 lt!85253))))))

(assert (=> d!52441 (= lt!85649 (insertStrictlySorted!101 (toList!1081 lt!85249) (_1!1610 (tuple2!3199 lt!85250 lt!85253)) (_2!1610 (tuple2!3199 lt!85250 lt!85253))))))

(assert (=> d!52441 (= (+!243 lt!85249 (tuple2!3199 lt!85250 lt!85253)) lt!85648)))

(declare-fun b!171960 () Bool)

(declare-fun res!81673 () Bool)

(assert (=> b!171960 (=> (not res!81673) (not e!113473))))

(assert (=> b!171960 (= res!81673 (= (getValueByKey!185 (toList!1081 lt!85648) (_1!1610 (tuple2!3199 lt!85250 lt!85253))) (Some!190 (_2!1610 (tuple2!3199 lt!85250 lt!85253)))))))

(declare-fun b!171961 () Bool)

(assert (=> b!171961 (= e!113473 (contains!1141 (toList!1081 lt!85648) (tuple2!3199 lt!85250 lt!85253)))))

(assert (= (and d!52441 res!81674) b!171960))

(assert (= (and b!171960 res!81673) b!171961))

(declare-fun m!201041 () Bool)

(assert (=> d!52441 m!201041))

(declare-fun m!201043 () Bool)

(assert (=> d!52441 m!201043))

(declare-fun m!201045 () Bool)

(assert (=> d!52441 m!201045))

(declare-fun m!201047 () Bool)

(assert (=> d!52441 m!201047))

(declare-fun m!201049 () Bool)

(assert (=> b!171960 m!201049))

(declare-fun m!201051 () Bool)

(assert (=> b!171961 m!201051))

(assert (=> b!171118 d!52441))

(declare-fun d!52443 () Bool)

(declare-fun e!113474 () Bool)

(assert (=> d!52443 e!113474))

(declare-fun res!81676 () Bool)

(assert (=> d!52443 (=> (not res!81676) (not e!113474))))

(declare-fun lt!85652 () ListLongMap!2131)

(assert (=> d!52443 (= res!81676 (contains!1139 lt!85652 (_1!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!85653 () List!2176)

(assert (=> d!52443 (= lt!85652 (ListLongMap!2132 lt!85653))))

(declare-fun lt!85655 () Unit!5251)

(declare-fun lt!85654 () Unit!5251)

(assert (=> d!52443 (= lt!85655 lt!85654)))

(assert (=> d!52443 (= (getValueByKey!185 lt!85653 (_1!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!190 (_2!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52443 (= lt!85654 (lemmaContainsTupThenGetReturnValue!98 lt!85653 (_1!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52443 (= lt!85653 (insertStrictlySorted!101 (toList!1081 call!17408) (_1!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52443 (= (+!243 call!17408 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!85652)))

(declare-fun b!171962 () Bool)

(declare-fun res!81675 () Bool)

(assert (=> b!171962 (=> (not res!81675) (not e!113474))))

(assert (=> b!171962 (= res!81675 (= (getValueByKey!185 (toList!1081 lt!85652) (_1!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!190 (_2!1610 (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!171963 () Bool)

(assert (=> b!171963 (= e!113474 (contains!1141 (toList!1081 lt!85652) (tuple2!3199 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000) (get!1944 (select (arr!3381 (_values!3537 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3554 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!52443 res!81676) b!171962))

(assert (= (and b!171962 res!81675) b!171963))

(declare-fun m!201053 () Bool)

(assert (=> d!52443 m!201053))

(declare-fun m!201055 () Bool)

(assert (=> d!52443 m!201055))

(declare-fun m!201057 () Bool)

(assert (=> d!52443 m!201057))

(declare-fun m!201059 () Bool)

(assert (=> d!52443 m!201059))

(declare-fun m!201061 () Bool)

(assert (=> b!171962 m!201061))

(declare-fun m!201063 () Bool)

(assert (=> b!171963 m!201063))

(assert (=> b!171118 d!52443))

(declare-fun d!52445 () Bool)

(assert (=> d!52445 (= (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309))) lt!85191)) (v!3915 (getValueByKey!185 (toList!1081 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309))) lt!85191)))))

(assert (=> d!51957 d!52445))

(declare-fun b!171965 () Bool)

(declare-fun e!113475 () Option!191)

(declare-fun e!113476 () Option!191)

(assert (=> b!171965 (= e!113475 e!113476)))

(declare-fun c!30803 () Bool)

(assert (=> b!171965 (= c!30803 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309)))) (not (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309))))) lt!85191))))))

(declare-fun b!171966 () Bool)

(assert (=> b!171966 (= e!113476 (getValueByKey!185 (t!6970 (toList!1081 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309)))) lt!85191))))

(declare-fun c!30802 () Bool)

(declare-fun d!52447 () Bool)

(assert (=> d!52447 (= c!30802 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309)))) (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309))))) lt!85191)))))

(assert (=> d!52447 (= (getValueByKey!185 (toList!1081 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309))) lt!85191) e!113475)))

(declare-fun b!171964 () Bool)

(assert (=> b!171964 (= e!113475 (Some!190 (_2!1610 (h!2789 (toList!1081 (+!243 lt!85202 (tuple2!3199 lt!85200 v!309)))))))))

(declare-fun b!171967 () Bool)

(assert (=> b!171967 (= e!113476 None!189)))

(assert (= (and d!52447 c!30802) b!171964))

(assert (= (and d!52447 (not c!30802)) b!171965))

(assert (= (and b!171965 c!30803) b!171966))

(assert (= (and b!171965 (not c!30803)) b!171967))

(declare-fun m!201065 () Bool)

(assert (=> b!171966 m!201065))

(assert (=> d!51957 d!52447))

(declare-fun d!52449 () Bool)

(assert (=> d!52449 (= (isEmpty!439 lt!85248) (isEmpty!441 (toList!1081 lt!85248)))))

(declare-fun bs!7125 () Bool)

(assert (= bs!7125 d!52449))

(declare-fun m!201067 () Bool)

(assert (=> bs!7125 m!201067))

(assert (=> b!171121 d!52449))

(declare-fun d!52451 () Bool)

(assert (=> d!52451 (= (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) lt!85197)) (v!3915 (getValueByKey!185 (toList!1081 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) lt!85197)))))

(assert (=> d!51953 d!52451))

(declare-fun b!171969 () Bool)

(declare-fun e!113477 () Option!191)

(declare-fun e!113478 () Option!191)

(assert (=> b!171969 (= e!113477 e!113478)))

(declare-fun c!30805 () Bool)

(assert (=> b!171969 (= c!30805 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))) (not (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))) lt!85197))))))

(declare-fun b!171970 () Bool)

(assert (=> b!171970 (= e!113478 (getValueByKey!185 (t!6970 (toList!1081 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))) lt!85197))))

(declare-fun d!52453 () Bool)

(declare-fun c!30804 () Bool)

(assert (=> d!52453 (= c!30804 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))) (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))))) lt!85197)))))

(assert (=> d!52453 (= (getValueByKey!185 (toList!1081 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248)))) lt!85197) e!113477)))

(declare-fun b!171968 () Bool)

(assert (=> b!171968 (= e!113477 (Some!190 (_2!1610 (h!2789 (toList!1081 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))))))

(declare-fun b!171971 () Bool)

(assert (=> b!171971 (= e!113478 None!189)))

(assert (= (and d!52453 c!30804) b!171968))

(assert (= (and d!52453 (not c!30804)) b!171969))

(assert (= (and b!171969 c!30805) b!171970))

(assert (= (and b!171969 (not c!30805)) b!171971))

(declare-fun m!201069 () Bool)

(assert (=> b!171970 m!201069))

(assert (=> d!51953 d!52453))

(declare-fun d!52455 () Bool)

(declare-fun res!81677 () Bool)

(declare-fun e!113479 () Bool)

(assert (=> d!52455 (=> res!81677 e!113479)))

(assert (=> d!52455 (= res!81677 (and ((_ is Cons!2172) (toList!1081 lt!85122)) (= (_1!1610 (h!2789 (toList!1081 lt!85122))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(assert (=> d!52455 (= (containsKey!188 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))) e!113479)))

(declare-fun b!171972 () Bool)

(declare-fun e!113480 () Bool)

(assert (=> b!171972 (= e!113479 e!113480)))

(declare-fun res!81678 () Bool)

(assert (=> b!171972 (=> (not res!81678) (not e!113480))))

(assert (=> b!171972 (= res!81678 (and (or (not ((_ is Cons!2172) (toList!1081 lt!85122))) (bvsle (_1!1610 (h!2789 (toList!1081 lt!85122))) (_1!1610 (tuple2!3199 key!828 v!309)))) ((_ is Cons!2172) (toList!1081 lt!85122)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85122))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun b!171973 () Bool)

(assert (=> b!171973 (= e!113480 (containsKey!188 (t!6970 (toList!1081 lt!85122)) (_1!1610 (tuple2!3199 key!828 v!309))))))

(assert (= (and d!52455 (not res!81677)) b!171972))

(assert (= (and b!171972 res!81678) b!171973))

(declare-fun m!201071 () Bool)

(assert (=> b!171973 m!201071))

(assert (=> d!51931 d!52455))

(declare-fun d!52457 () Bool)

(declare-fun res!81679 () Bool)

(declare-fun e!113481 () Bool)

(assert (=> d!52457 (=> res!81679 e!113481)))

(assert (=> d!52457 (= res!81679 (and ((_ is Cons!2172) (t!6970 (toList!1081 lt!85093))) (= (_1!1610 (h!2789 (t!6970 (toList!1081 lt!85093)))) key!828)))))

(assert (=> d!52457 (= (containsKey!188 (t!6970 (toList!1081 lt!85093)) key!828) e!113481)))

(declare-fun b!171974 () Bool)

(declare-fun e!113482 () Bool)

(assert (=> b!171974 (= e!113481 e!113482)))

(declare-fun res!81680 () Bool)

(assert (=> b!171974 (=> (not res!81680) (not e!113482))))

(assert (=> b!171974 (= res!81680 (and (or (not ((_ is Cons!2172) (t!6970 (toList!1081 lt!85093)))) (bvsle (_1!1610 (h!2789 (t!6970 (toList!1081 lt!85093)))) key!828)) ((_ is Cons!2172) (t!6970 (toList!1081 lt!85093))) (bvslt (_1!1610 (h!2789 (t!6970 (toList!1081 lt!85093)))) key!828)))))

(declare-fun b!171975 () Bool)

(assert (=> b!171975 (= e!113482 (containsKey!188 (t!6970 (t!6970 (toList!1081 lt!85093))) key!828))))

(assert (= (and d!52457 (not res!81679)) b!171974))

(assert (= (and b!171974 res!81680) b!171975))

(declare-fun m!201073 () Bool)

(assert (=> b!171975 m!201073))

(assert (=> b!171379 d!52457))

(assert (=> b!171355 d!52153))

(assert (=> b!171355 d!52155))

(declare-fun d!52459 () Bool)

(declare-fun e!113483 () Bool)

(assert (=> d!52459 e!113483))

(declare-fun res!81681 () Bool)

(assert (=> d!52459 (=> res!81681 e!113483)))

(declare-fun lt!85656 () Bool)

(assert (=> d!52459 (= res!81681 (not lt!85656))))

(declare-fun lt!85658 () Bool)

(assert (=> d!52459 (= lt!85656 lt!85658)))

(declare-fun lt!85659 () Unit!5251)

(declare-fun e!113484 () Unit!5251)

(assert (=> d!52459 (= lt!85659 e!113484)))

(declare-fun c!30806 () Bool)

(assert (=> d!52459 (= c!30806 lt!85658)))

(assert (=> d!52459 (= lt!85658 (containsKey!188 (toList!1081 lt!85377) (_1!1610 (tuple2!3199 lt!85200 v!309))))))

(assert (=> d!52459 (= (contains!1139 lt!85377 (_1!1610 (tuple2!3199 lt!85200 v!309))) lt!85656)))

(declare-fun b!171976 () Bool)

(declare-fun lt!85657 () Unit!5251)

(assert (=> b!171976 (= e!113484 lt!85657)))

(assert (=> b!171976 (= lt!85657 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85377) (_1!1610 (tuple2!3199 lt!85200 v!309))))))

(assert (=> b!171976 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85377) (_1!1610 (tuple2!3199 lt!85200 v!309))))))

(declare-fun b!171977 () Bool)

(declare-fun Unit!5295 () Unit!5251)

(assert (=> b!171977 (= e!113484 Unit!5295)))

(declare-fun b!171978 () Bool)

(assert (=> b!171978 (= e!113483 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85377) (_1!1610 (tuple2!3199 lt!85200 v!309)))))))

(assert (= (and d!52459 c!30806) b!171976))

(assert (= (and d!52459 (not c!30806)) b!171977))

(assert (= (and d!52459 (not res!81681)) b!171978))

(declare-fun m!201075 () Bool)

(assert (=> d!52459 m!201075))

(declare-fun m!201077 () Bool)

(assert (=> b!171976 m!201077))

(assert (=> b!171976 m!199967))

(assert (=> b!171976 m!199967))

(declare-fun m!201079 () Bool)

(assert (=> b!171976 m!201079))

(assert (=> b!171978 m!199967))

(assert (=> b!171978 m!199967))

(assert (=> b!171978 m!201079))

(assert (=> d!51969 d!52459))

(declare-fun b!171980 () Bool)

(declare-fun e!113485 () Option!191)

(declare-fun e!113486 () Option!191)

(assert (=> b!171980 (= e!113485 e!113486)))

(declare-fun c!30808 () Bool)

(assert (=> b!171980 (= c!30808 (and ((_ is Cons!2172) lt!85378) (not (= (_1!1610 (h!2789 lt!85378)) (_1!1610 (tuple2!3199 lt!85200 v!309))))))))

(declare-fun b!171981 () Bool)

(assert (=> b!171981 (= e!113486 (getValueByKey!185 (t!6970 lt!85378) (_1!1610 (tuple2!3199 lt!85200 v!309))))))

(declare-fun c!30807 () Bool)

(declare-fun d!52461 () Bool)

(assert (=> d!52461 (= c!30807 (and ((_ is Cons!2172) lt!85378) (= (_1!1610 (h!2789 lt!85378)) (_1!1610 (tuple2!3199 lt!85200 v!309)))))))

(assert (=> d!52461 (= (getValueByKey!185 lt!85378 (_1!1610 (tuple2!3199 lt!85200 v!309))) e!113485)))

(declare-fun b!171979 () Bool)

(assert (=> b!171979 (= e!113485 (Some!190 (_2!1610 (h!2789 lt!85378))))))

(declare-fun b!171982 () Bool)

(assert (=> b!171982 (= e!113486 None!189)))

(assert (= (and d!52461 c!30807) b!171979))

(assert (= (and d!52461 (not c!30807)) b!171980))

(assert (= (and b!171980 c!30808) b!171981))

(assert (= (and b!171980 (not c!30808)) b!171982))

(declare-fun m!201081 () Bool)

(assert (=> b!171981 m!201081))

(assert (=> d!51969 d!52461))

(declare-fun d!52463 () Bool)

(assert (=> d!52463 (= (getValueByKey!185 lt!85378 (_1!1610 (tuple2!3199 lt!85200 v!309))) (Some!190 (_2!1610 (tuple2!3199 lt!85200 v!309))))))

(declare-fun lt!85660 () Unit!5251)

(assert (=> d!52463 (= lt!85660 (choose!930 lt!85378 (_1!1610 (tuple2!3199 lt!85200 v!309)) (_2!1610 (tuple2!3199 lt!85200 v!309))))))

(declare-fun e!113487 () Bool)

(assert (=> d!52463 e!113487))

(declare-fun res!81682 () Bool)

(assert (=> d!52463 (=> (not res!81682) (not e!113487))))

(assert (=> d!52463 (= res!81682 (isStrictlySorted!318 lt!85378))))

(assert (=> d!52463 (= (lemmaContainsTupThenGetReturnValue!98 lt!85378 (_1!1610 (tuple2!3199 lt!85200 v!309)) (_2!1610 (tuple2!3199 lt!85200 v!309))) lt!85660)))

(declare-fun b!171983 () Bool)

(declare-fun res!81683 () Bool)

(assert (=> b!171983 (=> (not res!81683) (not e!113487))))

(assert (=> b!171983 (= res!81683 (containsKey!188 lt!85378 (_1!1610 (tuple2!3199 lt!85200 v!309))))))

(declare-fun b!171984 () Bool)

(assert (=> b!171984 (= e!113487 (contains!1141 lt!85378 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85200 v!309)) (_2!1610 (tuple2!3199 lt!85200 v!309)))))))

(assert (= (and d!52463 res!81682) b!171983))

(assert (= (and b!171983 res!81683) b!171984))

(assert (=> d!52463 m!199961))

(declare-fun m!201083 () Bool)

(assert (=> d!52463 m!201083))

(declare-fun m!201085 () Bool)

(assert (=> d!52463 m!201085))

(declare-fun m!201087 () Bool)

(assert (=> b!171983 m!201087))

(declare-fun m!201089 () Bool)

(assert (=> b!171984 m!201089))

(assert (=> d!51969 d!52463))

(declare-fun b!171985 () Bool)

(declare-fun e!113490 () List!2176)

(declare-fun call!17483 () List!2176)

(assert (=> b!171985 (= e!113490 call!17483)))

(declare-fun b!171986 () Bool)

(assert (=> b!171986 (= e!113490 call!17483)))

(declare-fun b!171987 () Bool)

(declare-fun c!30809 () Bool)

(assert (=> b!171987 (= c!30809 (and ((_ is Cons!2172) (toList!1081 lt!85202)) (bvsgt (_1!1610 (h!2789 (toList!1081 lt!85202))) (_1!1610 (tuple2!3199 lt!85200 v!309)))))))

(declare-fun e!113489 () List!2176)

(assert (=> b!171987 (= e!113489 e!113490)))

(declare-fun d!52465 () Bool)

(declare-fun e!113488 () Bool)

(assert (=> d!52465 e!113488))

(declare-fun res!81685 () Bool)

(assert (=> d!52465 (=> (not res!81685) (not e!113488))))

(declare-fun lt!85661 () List!2176)

(assert (=> d!52465 (= res!81685 (isStrictlySorted!318 lt!85661))))

(declare-fun e!113492 () List!2176)

(assert (=> d!52465 (= lt!85661 e!113492)))

(declare-fun c!30810 () Bool)

(assert (=> d!52465 (= c!30810 (and ((_ is Cons!2172) (toList!1081 lt!85202)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85202))) (_1!1610 (tuple2!3199 lt!85200 v!309)))))))

(assert (=> d!52465 (isStrictlySorted!318 (toList!1081 lt!85202))))

(assert (=> d!52465 (= (insertStrictlySorted!101 (toList!1081 lt!85202) (_1!1610 (tuple2!3199 lt!85200 v!309)) (_2!1610 (tuple2!3199 lt!85200 v!309))) lt!85661)))

(declare-fun b!171988 () Bool)

(assert (=> b!171988 (= e!113492 e!113489)))

(declare-fun c!30811 () Bool)

(assert (=> b!171988 (= c!30811 (and ((_ is Cons!2172) (toList!1081 lt!85202)) (= (_1!1610 (h!2789 (toList!1081 lt!85202))) (_1!1610 (tuple2!3199 lt!85200 v!309)))))))

(declare-fun b!171989 () Bool)

(assert (=> b!171989 (= e!113488 (contains!1141 lt!85661 (tuple2!3199 (_1!1610 (tuple2!3199 lt!85200 v!309)) (_2!1610 (tuple2!3199 lt!85200 v!309)))))))

(declare-fun b!171990 () Bool)

(declare-fun call!17481 () List!2176)

(assert (=> b!171990 (= e!113489 call!17481)))

(declare-fun e!113491 () List!2176)

(declare-fun b!171991 () Bool)

(assert (=> b!171991 (= e!113491 (ite c!30811 (t!6970 (toList!1081 lt!85202)) (ite c!30809 (Cons!2172 (h!2789 (toList!1081 lt!85202)) (t!6970 (toList!1081 lt!85202))) Nil!2173)))))

(declare-fun bm!17478 () Bool)

(declare-fun call!17482 () List!2176)

(assert (=> bm!17478 (= call!17481 call!17482)))

(declare-fun b!171992 () Bool)

(assert (=> b!171992 (= e!113492 call!17482)))

(declare-fun b!171993 () Bool)

(assert (=> b!171993 (= e!113491 (insertStrictlySorted!101 (t!6970 (toList!1081 lt!85202)) (_1!1610 (tuple2!3199 lt!85200 v!309)) (_2!1610 (tuple2!3199 lt!85200 v!309))))))

(declare-fun bm!17479 () Bool)

(assert (=> bm!17479 (= call!17483 call!17481)))

(declare-fun b!171994 () Bool)

(declare-fun res!81684 () Bool)

(assert (=> b!171994 (=> (not res!81684) (not e!113488))))

(assert (=> b!171994 (= res!81684 (containsKey!188 lt!85661 (_1!1610 (tuple2!3199 lt!85200 v!309))))))

(declare-fun bm!17480 () Bool)

(assert (=> bm!17480 (= call!17482 ($colon$colon!96 e!113491 (ite c!30810 (h!2789 (toList!1081 lt!85202)) (tuple2!3199 (_1!1610 (tuple2!3199 lt!85200 v!309)) (_2!1610 (tuple2!3199 lt!85200 v!309))))))))

(declare-fun c!30812 () Bool)

(assert (=> bm!17480 (= c!30812 c!30810)))

(assert (= (and d!52465 c!30810) b!171992))

(assert (= (and d!52465 (not c!30810)) b!171988))

(assert (= (and b!171988 c!30811) b!171990))

(assert (= (and b!171988 (not c!30811)) b!171987))

(assert (= (and b!171987 c!30809) b!171985))

(assert (= (and b!171987 (not c!30809)) b!171986))

(assert (= (or b!171985 b!171986) bm!17479))

(assert (= (or b!171990 bm!17479) bm!17478))

(assert (= (or b!171992 bm!17478) bm!17480))

(assert (= (and bm!17480 c!30812) b!171993))

(assert (= (and bm!17480 (not c!30812)) b!171991))

(assert (= (and d!52465 res!81685) b!171994))

(assert (= (and b!171994 res!81684) b!171989))

(declare-fun m!201091 () Bool)

(assert (=> b!171993 m!201091))

(declare-fun m!201093 () Bool)

(assert (=> b!171994 m!201093))

(declare-fun m!201095 () Bool)

(assert (=> d!52465 m!201095))

(declare-fun m!201097 () Bool)

(assert (=> d!52465 m!201097))

(declare-fun m!201099 () Bool)

(assert (=> bm!17480 m!201099))

(declare-fun m!201101 () Bool)

(assert (=> b!171989 m!201101))

(assert (=> d!51969 d!52465))

(assert (=> b!171124 d!52149))

(assert (=> b!171124 d!52145))

(declare-fun d!52467 () Bool)

(declare-fun e!113493 () Bool)

(assert (=> d!52467 e!113493))

(declare-fun res!81686 () Bool)

(assert (=> d!52467 (=> res!81686 e!113493)))

(declare-fun lt!85662 () Bool)

(assert (=> d!52467 (= res!81686 (not lt!85662))))

(declare-fun lt!85664 () Bool)

(assert (=> d!52467 (= lt!85662 lt!85664)))

(declare-fun lt!85665 () Unit!5251)

(declare-fun e!113494 () Unit!5251)

(assert (=> d!52467 (= lt!85665 e!113494)))

(declare-fun c!30813 () Bool)

(assert (=> d!52467 (= c!30813 lt!85664)))

(assert (=> d!52467 (= lt!85664 (containsKey!188 (toList!1081 lt!85410) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> d!52467 (= (contains!1139 lt!85410 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85662)))

(declare-fun b!171995 () Bool)

(declare-fun lt!85663 () Unit!5251)

(assert (=> b!171995 (= e!113494 lt!85663)))

(assert (=> b!171995 (= lt!85663 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85410) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(assert (=> b!171995 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85410) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!171996 () Bool)

(declare-fun Unit!5296 () Unit!5251)

(assert (=> b!171996 (= e!113494 Unit!5296)))

(declare-fun b!171997 () Bool)

(assert (=> b!171997 (= e!113493 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85410) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52467 c!30813) b!171995))

(assert (= (and d!52467 (not c!30813)) b!171996))

(assert (= (and d!52467 (not res!81686)) b!171997))

(declare-fun m!201103 () Bool)

(assert (=> d!52467 m!201103))

(declare-fun m!201105 () Bool)

(assert (=> b!171995 m!201105))

(assert (=> b!171995 m!200095))

(assert (=> b!171995 m!200095))

(declare-fun m!201107 () Bool)

(assert (=> b!171995 m!201107))

(assert (=> b!171997 m!200095))

(assert (=> b!171997 m!200095))

(assert (=> b!171997 m!201107))

(assert (=> d!52013 d!52467))

(declare-fun b!171999 () Bool)

(declare-fun e!113495 () Option!191)

(declare-fun e!113496 () Option!191)

(assert (=> b!171999 (= e!113495 e!113496)))

(declare-fun c!30815 () Bool)

(assert (=> b!171999 (= c!30815 (and ((_ is Cons!2172) lt!85411) (not (= (_1!1610 (h!2789 lt!85411)) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun b!172000 () Bool)

(assert (=> b!172000 (= e!113496 (getValueByKey!185 (t!6970 lt!85411) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun d!52469 () Bool)

(declare-fun c!30814 () Bool)

(assert (=> d!52469 (= c!30814 (and ((_ is Cons!2172) lt!85411) (= (_1!1610 (h!2789 lt!85411)) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52469 (= (getValueByKey!185 lt!85411 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) e!113495)))

(declare-fun b!171998 () Bool)

(assert (=> b!171998 (= e!113495 (Some!190 (_2!1610 (h!2789 lt!85411))))))

(declare-fun b!172001 () Bool)

(assert (=> b!172001 (= e!113496 None!189)))

(assert (= (and d!52469 c!30814) b!171998))

(assert (= (and d!52469 (not c!30814)) b!171999))

(assert (= (and b!171999 c!30815) b!172000))

(assert (= (and b!171999 (not c!30815)) b!172001))

(declare-fun m!201109 () Bool)

(assert (=> b!172000 m!201109))

(assert (=> d!52013 d!52469))

(declare-fun d!52471 () Bool)

(assert (=> d!52471 (= (getValueByKey!185 lt!85411 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) (Some!190 (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun lt!85666 () Unit!5251)

(assert (=> d!52471 (= lt!85666 (choose!930 lt!85411 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun e!113497 () Bool)

(assert (=> d!52471 e!113497))

(declare-fun res!81687 () Bool)

(assert (=> d!52471 (=> (not res!81687) (not e!113497))))

(assert (=> d!52471 (= res!81687 (isStrictlySorted!318 lt!85411))))

(assert (=> d!52471 (= (lemmaContainsTupThenGetReturnValue!98 lt!85411 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85666)))

(declare-fun b!172002 () Bool)

(declare-fun res!81688 () Bool)

(assert (=> b!172002 (=> (not res!81688) (not e!113497))))

(assert (=> b!172002 (= res!81688 (containsKey!188 lt!85411 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun b!172003 () Bool)

(assert (=> b!172003 (= e!113497 (contains!1141 lt!85411 (tuple2!3199 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (= (and d!52471 res!81687) b!172002))

(assert (= (and b!172002 res!81688) b!172003))

(assert (=> d!52471 m!200089))

(declare-fun m!201111 () Bool)

(assert (=> d!52471 m!201111))

(declare-fun m!201113 () Bool)

(assert (=> d!52471 m!201113))

(declare-fun m!201115 () Bool)

(assert (=> b!172002 m!201115))

(declare-fun m!201117 () Bool)

(assert (=> b!172003 m!201117))

(assert (=> d!52013 d!52471))

(declare-fun b!172004 () Bool)

(declare-fun e!113500 () List!2176)

(declare-fun call!17486 () List!2176)

(assert (=> b!172004 (= e!113500 call!17486)))

(declare-fun b!172005 () Bool)

(assert (=> b!172005 (= e!113500 call!17486)))

(declare-fun b!172006 () Bool)

(declare-fun c!30816 () Bool)

(assert (=> b!172006 (= c!30816 (and ((_ is Cons!2172) (toList!1081 call!17392)) (bvsgt (_1!1610 (h!2789 (toList!1081 call!17392))) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun e!113499 () List!2176)

(assert (=> b!172006 (= e!113499 e!113500)))

(declare-fun d!52473 () Bool)

(declare-fun e!113498 () Bool)

(assert (=> d!52473 e!113498))

(declare-fun res!81690 () Bool)

(assert (=> d!52473 (=> (not res!81690) (not e!113498))))

(declare-fun lt!85667 () List!2176)

(assert (=> d!52473 (= res!81690 (isStrictlySorted!318 lt!85667))))

(declare-fun e!113502 () List!2176)

(assert (=> d!52473 (= lt!85667 e!113502)))

(declare-fun c!30817 () Bool)

(assert (=> d!52473 (= c!30817 (and ((_ is Cons!2172) (toList!1081 call!17392)) (bvslt (_1!1610 (h!2789 (toList!1081 call!17392))) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(assert (=> d!52473 (isStrictlySorted!318 (toList!1081 call!17392))))

(assert (=> d!52473 (= (insertStrictlySorted!101 (toList!1081 call!17392) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))) lt!85667)))

(declare-fun b!172007 () Bool)

(assert (=> b!172007 (= e!113502 e!113499)))

(declare-fun c!30818 () Bool)

(assert (=> b!172007 (= c!30818 (and ((_ is Cons!2172) (toList!1081 call!17392)) (= (_1!1610 (h!2789 (toList!1081 call!17392))) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!172008 () Bool)

(assert (=> b!172008 (= e!113498 (contains!1141 lt!85667 (tuple2!3199 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun b!172009 () Bool)

(declare-fun call!17484 () List!2176)

(assert (=> b!172009 (= e!113499 call!17484)))

(declare-fun e!113501 () List!2176)

(declare-fun b!172010 () Bool)

(assert (=> b!172010 (= e!113501 (ite c!30818 (t!6970 (toList!1081 call!17392)) (ite c!30816 (Cons!2172 (h!2789 (toList!1081 call!17392)) (t!6970 (toList!1081 call!17392))) Nil!2173)))))

(declare-fun bm!17481 () Bool)

(declare-fun call!17485 () List!2176)

(assert (=> bm!17481 (= call!17484 call!17485)))

(declare-fun b!172011 () Bool)

(assert (=> b!172011 (= e!113502 call!17485)))

(declare-fun b!172012 () Bool)

(assert (=> b!172012 (= e!113501 (insertStrictlySorted!101 (t!6970 (toList!1081 call!17392)) (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17482 () Bool)

(assert (=> bm!17482 (= call!17486 call!17484)))

(declare-fun b!172013 () Bool)

(declare-fun res!81689 () Bool)

(assert (=> b!172013 (=> (not res!81689) (not e!113498))))

(assert (=> b!172013 (= res!81689 (containsKey!188 lt!85667 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))

(declare-fun bm!17483 () Bool)

(assert (=> bm!17483 (= call!17485 ($colon$colon!96 e!113501 (ite c!30817 (h!2789 (toList!1081 call!17392)) (tuple2!3199 (_1!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) (_2!1610 (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(declare-fun c!30819 () Bool)

(assert (=> bm!17483 (= c!30819 c!30817)))

(assert (= (and d!52473 c!30817) b!172011))

(assert (= (and d!52473 (not c!30817)) b!172007))

(assert (= (and b!172007 c!30818) b!172009))

(assert (= (and b!172007 (not c!30818)) b!172006))

(assert (= (and b!172006 c!30816) b!172004))

(assert (= (and b!172006 (not c!30816)) b!172005))

(assert (= (or b!172004 b!172005) bm!17482))

(assert (= (or b!172009 bm!17482) bm!17481))

(assert (= (or b!172011 bm!17481) bm!17483))

(assert (= (and bm!17483 c!30819) b!172012))

(assert (= (and bm!17483 (not c!30819)) b!172010))

(assert (= (and d!52473 res!81690) b!172013))

(assert (= (and b!172013 res!81689) b!172008))

(declare-fun m!201119 () Bool)

(assert (=> b!172012 m!201119))

(declare-fun m!201121 () Bool)

(assert (=> b!172013 m!201121))

(declare-fun m!201123 () Bool)

(assert (=> d!52473 m!201123))

(declare-fun m!201125 () Bool)

(assert (=> d!52473 m!201125))

(declare-fun m!201127 () Bool)

(assert (=> bm!17483 m!201127))

(declare-fun m!201129 () Bool)

(assert (=> b!172008 m!201129))

(assert (=> d!52013 d!52473))

(assert (=> b!171272 d!51889))

(declare-fun d!52475 () Bool)

(declare-fun lt!85668 () Bool)

(assert (=> d!52475 (= lt!85668 (select (content!148 lt!85348) (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun e!113504 () Bool)

(assert (=> d!52475 (= lt!85668 e!113504)))

(declare-fun res!81691 () Bool)

(assert (=> d!52475 (=> (not res!81691) (not e!113504))))

(assert (=> d!52475 (= res!81691 ((_ is Cons!2172) lt!85348))))

(assert (=> d!52475 (= (contains!1141 lt!85348 (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))) lt!85668)))

(declare-fun b!172014 () Bool)

(declare-fun e!113503 () Bool)

(assert (=> b!172014 (= e!113504 e!113503)))

(declare-fun res!81692 () Bool)

(assert (=> b!172014 (=> res!81692 e!113503)))

(assert (=> b!172014 (= res!81692 (= (h!2789 lt!85348) (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun b!172015 () Bool)

(assert (=> b!172015 (= e!113503 (contains!1141 (t!6970 lt!85348) (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))))))

(assert (= (and d!52475 res!81691) b!172014))

(assert (= (and b!172014 (not res!81692)) b!172015))

(declare-fun m!201131 () Bool)

(assert (=> d!52475 m!201131))

(declare-fun m!201133 () Bool)

(assert (=> d!52475 m!201133))

(declare-fun m!201135 () Bool)

(assert (=> b!172015 m!201135))

(assert (=> b!171315 d!52475))

(declare-fun lt!85669 () Bool)

(declare-fun d!52477 () Bool)

(assert (=> d!52477 (= lt!85669 (select (content!148 (toList!1081 lt!85362)) (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))

(declare-fun e!113506 () Bool)

(assert (=> d!52477 (= lt!85669 e!113506)))

(declare-fun res!81693 () Bool)

(assert (=> d!52477 (=> (not res!81693) (not e!113506))))

(assert (=> d!52477 (= res!81693 ((_ is Cons!2172) (toList!1081 lt!85362)))))

(assert (=> d!52477 (= (contains!1141 (toList!1081 lt!85362) (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) lt!85669)))

(declare-fun b!172016 () Bool)

(declare-fun e!113505 () Bool)

(assert (=> b!172016 (= e!113506 e!113505)))

(declare-fun res!81694 () Bool)

(assert (=> b!172016 (=> res!81694 e!113505)))

(assert (=> b!172016 (= res!81694 (= (h!2789 (toList!1081 lt!85362)) (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))

(declare-fun b!172017 () Bool)

(assert (=> b!172017 (= e!113505 (contains!1141 (t!6970 (toList!1081 lt!85362)) (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))))))

(assert (= (and d!52477 res!81693) b!172016))

(assert (= (and b!172016 (not res!81694)) b!172017))

(declare-fun m!201137 () Bool)

(assert (=> d!52477 m!201137))

(declare-fun m!201139 () Bool)

(assert (=> d!52477 m!201139))

(declare-fun m!201141 () Bool)

(assert (=> b!172017 m!201141))

(assert (=> b!171337 d!52477))

(declare-fun d!52479 () Bool)

(declare-fun lt!85670 () Bool)

(assert (=> d!52479 (= lt!85670 (select (content!148 (toList!1081 lt!85386)) (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))

(declare-fun e!113508 () Bool)

(assert (=> d!52479 (= lt!85670 e!113508)))

(declare-fun res!81695 () Bool)

(assert (=> d!52479 (=> (not res!81695) (not e!113508))))

(assert (=> d!52479 (= res!81695 ((_ is Cons!2172) (toList!1081 lt!85386)))))

(assert (=> d!52479 (= (contains!1141 (toList!1081 lt!85386) (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))) lt!85670)))

(declare-fun b!172018 () Bool)

(declare-fun e!113507 () Bool)

(assert (=> b!172018 (= e!113508 e!113507)))

(declare-fun res!81696 () Bool)

(assert (=> b!172018 (=> res!81696 e!113507)))

(assert (=> b!172018 (= res!81696 (= (h!2789 (toList!1081 lt!85386)) (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))

(declare-fun b!172019 () Bool)

(assert (=> b!172019 (= e!113507 (contains!1141 (t!6970 (toList!1081 lt!85386)) (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))

(assert (= (and d!52479 res!81695) b!172018))

(assert (= (and b!172018 (not res!81696)) b!172019))

(declare-fun m!201143 () Bool)

(assert (=> d!52479 m!201143))

(declare-fun m!201145 () Bool)

(assert (=> d!52479 m!201145))

(declare-fun m!201147 () Bool)

(assert (=> b!172019 m!201147))

(assert (=> b!171361 d!52479))

(assert (=> b!171333 d!52217))

(assert (=> b!171333 d!52219))

(assert (=> b!171290 d!52073))

(declare-fun b!172021 () Bool)

(declare-fun e!113509 () Option!191)

(declare-fun e!113510 () Option!191)

(assert (=> b!172021 (= e!113509 e!113510)))

(declare-fun c!30821 () Bool)

(assert (=> b!172021 (= c!30821 (and ((_ is Cons!2172) (toList!1081 lt!85370)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85370))) (_1!1610 (tuple2!3199 lt!85184 v!309))))))))

(declare-fun b!172022 () Bool)

(assert (=> b!172022 (= e!113510 (getValueByKey!185 (t!6970 (toList!1081 lt!85370)) (_1!1610 (tuple2!3199 lt!85184 v!309))))))

(declare-fun d!52481 () Bool)

(declare-fun c!30820 () Bool)

(assert (=> d!52481 (= c!30820 (and ((_ is Cons!2172) (toList!1081 lt!85370)) (= (_1!1610 (h!2789 (toList!1081 lt!85370))) (_1!1610 (tuple2!3199 lt!85184 v!309)))))))

(assert (=> d!52481 (= (getValueByKey!185 (toList!1081 lt!85370) (_1!1610 (tuple2!3199 lt!85184 v!309))) e!113509)))

(declare-fun b!172020 () Bool)

(assert (=> b!172020 (= e!113509 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85370)))))))

(declare-fun b!172023 () Bool)

(assert (=> b!172023 (= e!113510 None!189)))

(assert (= (and d!52481 c!30820) b!172020))

(assert (= (and d!52481 (not c!30820)) b!172021))

(assert (= (and b!172021 c!30821) b!172022))

(assert (= (and b!172021 (not c!30821)) b!172023))

(declare-fun m!201149 () Bool)

(assert (=> b!172022 m!201149))

(assert (=> b!171343 d!52481))

(declare-fun d!52483 () Bool)

(declare-fun lt!85671 () Bool)

(assert (=> d!52483 (= lt!85671 (select (content!148 (toList!1081 lt!85317)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun e!113512 () Bool)

(assert (=> d!52483 (= lt!85671 e!113512)))

(declare-fun res!81697 () Bool)

(assert (=> d!52483 (=> (not res!81697) (not e!113512))))

(assert (=> d!52483 (= res!81697 ((_ is Cons!2172) (toList!1081 lt!85317)))))

(assert (=> d!52483 (= (contains!1141 (toList!1081 lt!85317) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) lt!85671)))

(declare-fun b!172024 () Bool)

(declare-fun e!113511 () Bool)

(assert (=> b!172024 (= e!113512 e!113511)))

(declare-fun res!81698 () Bool)

(assert (=> b!172024 (=> res!81698 e!113511)))

(assert (=> b!172024 (= res!81698 (= (h!2789 (toList!1081 lt!85317)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun b!172025 () Bool)

(assert (=> b!172025 (= e!113511 (contains!1141 (t!6970 (toList!1081 lt!85317)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(assert (= (and d!52483 res!81697) b!172024))

(assert (= (and b!172024 (not res!81698)) b!172025))

(declare-fun m!201151 () Bool)

(assert (=> d!52483 m!201151))

(declare-fun m!201153 () Bool)

(assert (=> d!52483 m!201153))

(declare-fun m!201155 () Bool)

(assert (=> b!172025 m!201155))

(assert (=> b!171257 d!52483))

(assert (=> d!51867 d!51863))

(assert (=> d!51867 d!51861))

(assert (=> d!51867 d!51855))

(assert (=> d!51973 d!51949))

(assert (=> d!51973 d!51953))

(assert (=> d!51973 d!51965))

(declare-fun d!52485 () Bool)

(assert (=> d!52485 (= (apply!129 (+!243 lt!85190 (tuple2!3199 lt!85189 (minValue!3397 thiss!1248))) lt!85197) (apply!129 lt!85190 lt!85197))))

(assert (=> d!52485 true))

(declare-fun _$34!1051 () Unit!5251)

(assert (=> d!52485 (= (choose!932 lt!85190 lt!85189 (minValue!3397 thiss!1248) lt!85197) _$34!1051)))

(declare-fun bs!7126 () Bool)

(assert (= bs!7126 d!52485))

(assert (=> bs!7126 m!199469))

(assert (=> bs!7126 m!199469))

(assert (=> bs!7126 m!199471))

(assert (=> bs!7126 m!199493))

(assert (=> d!51973 d!52485))

(declare-fun d!52487 () Bool)

(declare-fun e!113513 () Bool)

(assert (=> d!52487 e!113513))

(declare-fun res!81699 () Bool)

(assert (=> d!52487 (=> res!81699 e!113513)))

(declare-fun lt!85672 () Bool)

(assert (=> d!52487 (= res!81699 (not lt!85672))))

(declare-fun lt!85674 () Bool)

(assert (=> d!52487 (= lt!85672 lt!85674)))

(declare-fun lt!85675 () Unit!5251)

(declare-fun e!113514 () Unit!5251)

(assert (=> d!52487 (= lt!85675 e!113514)))

(declare-fun c!30822 () Bool)

(assert (=> d!52487 (= c!30822 lt!85674)))

(assert (=> d!52487 (= lt!85674 (containsKey!188 (toList!1081 lt!85190) lt!85197))))

(assert (=> d!52487 (= (contains!1139 lt!85190 lt!85197) lt!85672)))

(declare-fun b!172026 () Bool)

(declare-fun lt!85673 () Unit!5251)

(assert (=> b!172026 (= e!113514 lt!85673)))

(assert (=> b!172026 (= lt!85673 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85190) lt!85197))))

(assert (=> b!172026 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85190) lt!85197))))

(declare-fun b!172027 () Bool)

(declare-fun Unit!5297 () Unit!5251)

(assert (=> b!172027 (= e!113514 Unit!5297)))

(declare-fun b!172028 () Bool)

(assert (=> b!172028 (= e!113513 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85190) lt!85197)))))

(assert (= (and d!52487 c!30822) b!172026))

(assert (= (and d!52487 (not c!30822)) b!172027))

(assert (= (and d!52487 (not res!81699)) b!172028))

(declare-fun m!201157 () Bool)

(assert (=> d!52487 m!201157))

(declare-fun m!201159 () Bool)

(assert (=> b!172026 m!201159))

(assert (=> b!172026 m!199951))

(assert (=> b!172026 m!199951))

(declare-fun m!201161 () Bool)

(assert (=> b!172026 m!201161))

(assert (=> b!172028 m!199951))

(assert (=> b!172028 m!199951))

(assert (=> b!172028 m!201161))

(assert (=> d!51973 d!52487))

(declare-fun b!172029 () Bool)

(declare-fun e!113516 () Bool)

(assert (=> b!172029 (= e!113516 (contains!1142 (ite c!30572 (Cons!2174 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) Nil!2175) Nil!2175) (select (arr!3380 (_keys!5386 lt!85094)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!172030 () Bool)

(declare-fun e!113517 () Bool)

(declare-fun call!17487 () Bool)

(assert (=> b!172030 (= e!113517 call!17487)))

(declare-fun b!172031 () Bool)

(assert (=> b!172031 (= e!113517 call!17487)))

(declare-fun bm!17484 () Bool)

(declare-fun c!30823 () Bool)

(assert (=> bm!17484 (= call!17487 (arrayNoDuplicates!0 (_keys!5386 lt!85094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!30823 (Cons!2174 (select (arr!3380 (_keys!5386 lt!85094)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30572 (Cons!2174 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) Nil!2175) Nil!2175)) (ite c!30572 (Cons!2174 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) Nil!2175) Nil!2175))))))

(declare-fun d!52489 () Bool)

(declare-fun res!81701 () Bool)

(declare-fun e!113518 () Bool)

(assert (=> d!52489 (=> res!81701 e!113518)))

(assert (=> d!52489 (= res!81701 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 lt!85094))))))

(assert (=> d!52489 (= (arrayNoDuplicates!0 (_keys!5386 lt!85094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30572 (Cons!2174 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000) Nil!2175) Nil!2175)) e!113518)))

(declare-fun b!172032 () Bool)

(declare-fun e!113515 () Bool)

(assert (=> b!172032 (= e!113515 e!113517)))

(assert (=> b!172032 (= c!30823 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!172033 () Bool)

(assert (=> b!172033 (= e!113518 e!113515)))

(declare-fun res!81700 () Bool)

(assert (=> b!172033 (=> (not res!81700) (not e!113515))))

(assert (=> b!172033 (= res!81700 (not e!113516))))

(declare-fun res!81702 () Bool)

(assert (=> b!172033 (=> (not res!81702) (not e!113516))))

(assert (=> b!172033 (= res!81702 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!52489 (not res!81701)) b!172033))

(assert (= (and b!172033 res!81702) b!172029))

(assert (= (and b!172033 res!81700) b!172032))

(assert (= (and b!172032 c!30823) b!172030))

(assert (= (and b!172032 (not c!30823)) b!172031))

(assert (= (or b!172030 b!172031) bm!17484))

(assert (=> b!172029 m!200213))

(assert (=> b!172029 m!200213))

(declare-fun m!201163 () Bool)

(assert (=> b!172029 m!201163))

(assert (=> bm!17484 m!200213))

(declare-fun m!201165 () Bool)

(assert (=> bm!17484 m!201165))

(assert (=> b!172032 m!200213))

(assert (=> b!172032 m!200213))

(assert (=> b!172032 m!200215))

(assert (=> b!172033 m!200213))

(assert (=> b!172033 m!200213))

(assert (=> b!172033 m!200215))

(assert (=> bm!17421 d!52489))

(declare-fun d!52491 () Bool)

(declare-fun e!113519 () Bool)

(assert (=> d!52491 e!113519))

(declare-fun res!81703 () Bool)

(assert (=> d!52491 (=> res!81703 e!113519)))

(declare-fun lt!85676 () Bool)

(assert (=> d!52491 (= res!81703 (not lt!85676))))

(declare-fun lt!85678 () Bool)

(assert (=> d!52491 (= lt!85676 lt!85678)))

(declare-fun lt!85679 () Unit!5251)

(declare-fun e!113520 () Unit!5251)

(assert (=> d!52491 (= lt!85679 e!113520)))

(declare-fun c!30824 () Bool)

(assert (=> d!52491 (= c!30824 lt!85678)))

(assert (=> d!52491 (= lt!85678 (containsKey!188 (toList!1081 lt!85330) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52491 (= (contains!1139 lt!85330 (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) lt!85676)))

(declare-fun b!172034 () Bool)

(declare-fun lt!85677 () Unit!5251)

(assert (=> b!172034 (= e!113520 lt!85677)))

(assert (=> b!172034 (= lt!85677 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85330) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!172034 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85330) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172035 () Bool)

(declare-fun Unit!5298 () Unit!5251)

(assert (=> b!172035 (= e!113520 Unit!5298)))

(declare-fun b!172036 () Bool)

(assert (=> b!172036 (= e!113519 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85330) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52491 c!30824) b!172034))

(assert (= (and d!52491 (not c!30824)) b!172035))

(assert (= (and d!52491 (not res!81703)) b!172036))

(assert (=> d!52491 m!199453))

(declare-fun m!201167 () Bool)

(assert (=> d!52491 m!201167))

(assert (=> b!172034 m!199453))

(declare-fun m!201169 () Bool)

(assert (=> b!172034 m!201169))

(assert (=> b!172034 m!199453))

(assert (=> b!172034 m!200597))

(assert (=> b!172034 m!200597))

(declare-fun m!201171 () Bool)

(assert (=> b!172034 m!201171))

(assert (=> b!172036 m!199453))

(assert (=> b!172036 m!200597))

(assert (=> b!172036 m!200597))

(assert (=> b!172036 m!201171))

(assert (=> b!171277 d!52491))

(declare-fun b!172038 () Bool)

(declare-fun e!113521 () Option!191)

(declare-fun e!113522 () Option!191)

(assert (=> b!172038 (= e!113521 e!113522)))

(declare-fun c!30826 () Bool)

(assert (=> b!172038 (= c!30826 (and ((_ is Cons!2172) (toList!1081 lt!85324)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85324))) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))))

(declare-fun b!172039 () Bool)

(assert (=> b!172039 (= e!113522 (getValueByKey!185 (t!6970 (toList!1081 lt!85324)) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))))

(declare-fun c!30825 () Bool)

(declare-fun d!52493 () Bool)

(assert (=> d!52493 (= c!30825 (and ((_ is Cons!2172) (toList!1081 lt!85324)) (= (_1!1610 (h!2789 (toList!1081 lt!85324))) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248)))))))))

(assert (=> d!52493 (= (getValueByKey!185 (toList!1081 lt!85324) (_1!1610 (ite (or c!30535 c!30534) (tuple2!3199 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3397 thiss!1248)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))) e!113521)))

(declare-fun b!172037 () Bool)

(assert (=> b!172037 (= e!113521 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85324)))))))

(declare-fun b!172040 () Bool)

(assert (=> b!172040 (= e!113522 None!189)))

(assert (= (and d!52493 c!30825) b!172037))

(assert (= (and d!52493 (not c!30825)) b!172038))

(assert (= (and b!172038 c!30826) b!172039))

(assert (= (and b!172038 (not c!30826)) b!172040))

(declare-fun m!201173 () Bool)

(assert (=> b!172039 m!201173))

(assert (=> b!171262 d!52493))

(declare-fun d!52495 () Bool)

(declare-fun lt!85680 () Bool)

(assert (=> d!52495 (= lt!85680 (select (content!148 (toList!1081 lt!85377)) (tuple2!3199 lt!85200 v!309)))))

(declare-fun e!113524 () Bool)

(assert (=> d!52495 (= lt!85680 e!113524)))

(declare-fun res!81704 () Bool)

(assert (=> d!52495 (=> (not res!81704) (not e!113524))))

(assert (=> d!52495 (= res!81704 ((_ is Cons!2172) (toList!1081 lt!85377)))))

(assert (=> d!52495 (= (contains!1141 (toList!1081 lt!85377) (tuple2!3199 lt!85200 v!309)) lt!85680)))

(declare-fun b!172041 () Bool)

(declare-fun e!113523 () Bool)

(assert (=> b!172041 (= e!113524 e!113523)))

(declare-fun res!81705 () Bool)

(assert (=> b!172041 (=> res!81705 e!113523)))

(assert (=> b!172041 (= res!81705 (= (h!2789 (toList!1081 lt!85377)) (tuple2!3199 lt!85200 v!309)))))

(declare-fun b!172042 () Bool)

(assert (=> b!172042 (= e!113523 (contains!1141 (t!6970 (toList!1081 lt!85377)) (tuple2!3199 lt!85200 v!309)))))

(assert (= (and d!52495 res!81704) b!172041))

(assert (= (and b!172041 (not res!81705)) b!172042))

(declare-fun m!201175 () Bool)

(assert (=> d!52495 m!201175))

(declare-fun m!201177 () Bool)

(assert (=> d!52495 m!201177))

(declare-fun m!201179 () Bool)

(assert (=> b!172042 m!201179))

(assert (=> b!171347 d!52495))

(declare-fun b!172043 () Bool)

(declare-fun e!113527 () List!2176)

(declare-fun call!17490 () List!2176)

(assert (=> b!172043 (= e!113527 call!17490)))

(declare-fun b!172044 () Bool)

(assert (=> b!172044 (= e!113527 call!17490)))

(declare-fun c!30827 () Bool)

(declare-fun b!172045 () Bool)

(assert (=> b!172045 (= c!30827 (and ((_ is Cons!2172) (t!6970 (toList!1081 (map!1846 thiss!1248)))) (bvsgt (_1!1610 (h!2789 (t!6970 (toList!1081 (map!1846 thiss!1248))))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun e!113526 () List!2176)

(assert (=> b!172045 (= e!113526 e!113527)))

(declare-fun d!52497 () Bool)

(declare-fun e!113525 () Bool)

(assert (=> d!52497 e!113525))

(declare-fun res!81707 () Bool)

(assert (=> d!52497 (=> (not res!81707) (not e!113525))))

(declare-fun lt!85681 () List!2176)

(assert (=> d!52497 (= res!81707 (isStrictlySorted!318 lt!85681))))

(declare-fun e!113529 () List!2176)

(assert (=> d!52497 (= lt!85681 e!113529)))

(declare-fun c!30828 () Bool)

(assert (=> d!52497 (= c!30828 (and ((_ is Cons!2172) (t!6970 (toList!1081 (map!1846 thiss!1248)))) (bvslt (_1!1610 (h!2789 (t!6970 (toList!1081 (map!1846 thiss!1248))))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(assert (=> d!52497 (isStrictlySorted!318 (t!6970 (toList!1081 (map!1846 thiss!1248))))))

(assert (=> d!52497 (= (insertStrictlySorted!101 (t!6970 (toList!1081 (map!1846 thiss!1248))) (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))) lt!85681)))

(declare-fun b!172046 () Bool)

(assert (=> b!172046 (= e!113529 e!113526)))

(declare-fun c!30829 () Bool)

(assert (=> b!172046 (= c!30829 (and ((_ is Cons!2172) (t!6970 (toList!1081 (map!1846 thiss!1248)))) (= (_1!1610 (h!2789 (t!6970 (toList!1081 (map!1846 thiss!1248))))) (_1!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun b!172047 () Bool)

(assert (=> b!172047 (= e!113525 (contains!1141 lt!85681 (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309)))))))

(declare-fun b!172048 () Bool)

(declare-fun call!17488 () List!2176)

(assert (=> b!172048 (= e!113526 call!17488)))

(declare-fun e!113528 () List!2176)

(declare-fun b!172049 () Bool)

(assert (=> b!172049 (= e!113528 (ite c!30829 (t!6970 (t!6970 (toList!1081 (map!1846 thiss!1248)))) (ite c!30827 (Cons!2172 (h!2789 (t!6970 (toList!1081 (map!1846 thiss!1248)))) (t!6970 (t!6970 (toList!1081 (map!1846 thiss!1248))))) Nil!2173)))))

(declare-fun bm!17485 () Bool)

(declare-fun call!17489 () List!2176)

(assert (=> bm!17485 (= call!17488 call!17489)))

(declare-fun b!172050 () Bool)

(assert (=> b!172050 (= e!113529 call!17489)))

(declare-fun b!172051 () Bool)

(assert (=> b!172051 (= e!113528 (insertStrictlySorted!101 (t!6970 (t!6970 (toList!1081 (map!1846 thiss!1248)))) (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun bm!17486 () Bool)

(assert (=> bm!17486 (= call!17490 call!17488)))

(declare-fun b!172052 () Bool)

(declare-fun res!81706 () Bool)

(assert (=> b!172052 (=> (not res!81706) (not e!113525))))

(assert (=> b!172052 (= res!81706 (containsKey!188 lt!85681 (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun bm!17487 () Bool)

(assert (=> bm!17487 (= call!17489 ($colon$colon!96 e!113528 (ite c!30828 (h!2789 (t!6970 (toList!1081 (map!1846 thiss!1248)))) (tuple2!3199 (_1!1610 (tuple2!3199 key!828 v!309)) (_2!1610 (tuple2!3199 key!828 v!309))))))))

(declare-fun c!30830 () Bool)

(assert (=> bm!17487 (= c!30830 c!30828)))

(assert (= (and d!52497 c!30828) b!172050))

(assert (= (and d!52497 (not c!30828)) b!172046))

(assert (= (and b!172046 c!30829) b!172048))

(assert (= (and b!172046 (not c!30829)) b!172045))

(assert (= (and b!172045 c!30827) b!172043))

(assert (= (and b!172045 (not c!30827)) b!172044))

(assert (= (or b!172043 b!172044) bm!17486))

(assert (= (or b!172048 bm!17486) bm!17485))

(assert (= (or b!172050 bm!17485) bm!17487))

(assert (= (and bm!17487 c!30830) b!172051))

(assert (= (and bm!17487 (not c!30830)) b!172049))

(assert (= (and d!52497 res!81707) b!172052))

(assert (= (and b!172052 res!81706) b!172047))

(declare-fun m!201181 () Bool)

(assert (=> b!172051 m!201181))

(declare-fun m!201183 () Bool)

(assert (=> b!172052 m!201183))

(declare-fun m!201185 () Bool)

(assert (=> d!52497 m!201185))

(assert (=> d!52497 m!200861))

(declare-fun m!201187 () Bool)

(assert (=> bm!17487 m!201187))

(declare-fun m!201189 () Bool)

(assert (=> b!172047 m!201189))

(assert (=> b!171319 d!52497))

(declare-fun d!52499 () Bool)

(declare-fun res!81708 () Bool)

(declare-fun e!113530 () Bool)

(assert (=> d!52499 (=> res!81708 e!113530)))

(assert (=> d!52499 (= res!81708 (and ((_ is Cons!2172) (toList!1081 lt!85199)) (= (_1!1610 (h!2789 (toList!1081 lt!85199))) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52499 (= (containsKey!188 (toList!1081 lt!85199) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)) e!113530)))

(declare-fun b!172053 () Bool)

(declare-fun e!113531 () Bool)

(assert (=> b!172053 (= e!113530 e!113531)))

(declare-fun res!81709 () Bool)

(assert (=> b!172053 (=> (not res!81709) (not e!113531))))

(assert (=> b!172053 (= res!81709 (and (or (not ((_ is Cons!2172) (toList!1081 lt!85199))) (bvsle (_1!1610 (h!2789 (toList!1081 lt!85199))) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2172) (toList!1081 lt!85199)) (bvslt (_1!1610 (h!2789 (toList!1081 lt!85199))) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!172054 () Bool)

(assert (=> b!172054 (= e!113531 (containsKey!188 (t!6970 (toList!1081 lt!85199)) (select (arr!3380 (_keys!5386 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52499 (not res!81708)) b!172053))

(assert (= (and b!172053 res!81709) b!172054))

(assert (=> b!172054 m!199453))

(declare-fun m!201191 () Bool)

(assert (=> b!172054 m!201191))

(assert (=> d!51919 d!52499))

(assert (=> d!51987 d!51985))

(declare-fun d!52501 () Bool)

(declare-fun e!113532 () Bool)

(assert (=> d!52501 e!113532))

(declare-fun res!81710 () Bool)

(assert (=> d!52501 (=> res!81710 e!113532)))

(declare-fun lt!85682 () Bool)

(assert (=> d!52501 (= res!81710 (not lt!85682))))

(declare-fun lt!85684 () Bool)

(assert (=> d!52501 (= lt!85682 lt!85684)))

(declare-fun lt!85685 () Unit!5251)

(declare-fun e!113533 () Unit!5251)

(assert (=> d!52501 (= lt!85685 e!113533)))

(declare-fun c!30831 () Bool)

(assert (=> d!52501 (= c!30831 lt!85684)))

(assert (=> d!52501 (= lt!85684 (containsKey!188 (toList!1081 lt!85226) lt!85210))))

(assert (=> d!52501 (= (contains!1139 lt!85226 lt!85210) lt!85682)))

(declare-fun b!172055 () Bool)

(declare-fun lt!85683 () Unit!5251)

(assert (=> b!172055 (= e!113533 lt!85683)))

(assert (=> b!172055 (= lt!85683 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85226) lt!85210))))

(assert (=> b!172055 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85226) lt!85210))))

(declare-fun b!172056 () Bool)

(declare-fun Unit!5299 () Unit!5251)

(assert (=> b!172056 (= e!113533 Unit!5299)))

(declare-fun b!172057 () Bool)

(assert (=> b!172057 (= e!113532 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85226) lt!85210)))))

(assert (= (and d!52501 c!30831) b!172055))

(assert (= (and d!52501 (not c!30831)) b!172056))

(assert (= (and d!52501 (not res!81710)) b!172057))

(declare-fun m!201193 () Bool)

(assert (=> d!52501 m!201193))

(declare-fun m!201195 () Bool)

(assert (=> b!172055 m!201195))

(assert (=> b!172055 m!200029))

(assert (=> b!172055 m!200029))

(declare-fun m!201197 () Bool)

(assert (=> b!172055 m!201197))

(assert (=> b!172057 m!200029))

(assert (=> b!172057 m!200029))

(assert (=> b!172057 m!201197))

(assert (=> d!51987 d!52501))

(assert (=> d!51987 d!51993))

(declare-fun d!52503 () Bool)

(assert (=> d!52503 (= (apply!129 (+!243 lt!85226 (tuple2!3199 lt!85228 (minValue!3397 thiss!1248))) lt!85210) (apply!129 lt!85226 lt!85210))))

(assert (=> d!52503 true))

(declare-fun _$34!1052 () Unit!5251)

(assert (=> d!52503 (= (choose!932 lt!85226 lt!85228 (minValue!3397 thiss!1248) lt!85210) _$34!1052)))

(declare-fun bs!7127 () Bool)

(assert (= bs!7127 d!52503))

(assert (=> bs!7127 m!199549))

(assert (=> bs!7127 m!199549))

(assert (=> bs!7127 m!199551))

(assert (=> bs!7127 m!199553))

(assert (=> d!51987 d!52503))

(assert (=> d!51987 d!51999))

(assert (=> b!171383 d!52405))

(declare-fun d!52505 () Bool)

(assert (=> d!52505 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3915 (getValueByKey!185 (toList!1081 lt!85224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51879 d!52505))

(assert (=> d!51879 d!52031))

(declare-fun d!52507 () Bool)

(assert (=> d!52507 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun lt!85686 () Unit!5251)

(assert (=> d!52507 (= lt!85686 (choose!931 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))))))

(declare-fun e!113534 () Bool)

(assert (=> d!52507 e!113534))

(declare-fun res!81711 () Bool)

(assert (=> d!52507 (=> (not res!81711) (not e!113534))))

(assert (=> d!52507 (= res!81711 (isStrictlySorted!318 (toList!1081 lt!85122)))))

(assert (=> d!52507 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))) lt!85686)))

(declare-fun b!172058 () Bool)

(assert (=> b!172058 (= e!113534 (containsKey!188 (toList!1081 lt!85122) (_1!1610 (tuple2!3199 key!828 v!309))))))

(assert (= (and d!52507 res!81711) b!172058))

(assert (=> d!52507 m!199431))

(assert (=> d!52507 m!199431))

(assert (=> d!52507 m!199843))

(declare-fun m!201199 () Bool)

(assert (=> d!52507 m!201199))

(declare-fun m!201201 () Bool)

(assert (=> d!52507 m!201201))

(assert (=> b!172058 m!199839))

(assert (=> b!171302 d!52507))

(assert (=> b!171302 d!52253))

(assert (=> b!171302 d!51979))

(declare-fun d!52509 () Bool)

(declare-fun lt!85687 () (_ BitVec 32))

(assert (=> d!52509 (and (bvsge lt!85687 #b00000000000000000000000000000000) (bvsle lt!85687 (bvsub (size!3673 (_keys!5386 lt!85094)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!113536 () (_ BitVec 32))

(assert (=> d!52509 (= lt!85687 e!113536)))

(declare-fun c!30832 () Bool)

(assert (=> d!52509 (= c!30832 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 lt!85094))))))

(assert (=> d!52509 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 lt!85094))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3673 (_keys!5386 lt!85094)) (size!3673 (_keys!5386 lt!85094))))))

(assert (=> d!52509 (= (arrayCountValidKeys!0 (_keys!5386 lt!85094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3673 (_keys!5386 lt!85094))) lt!85687)))

(declare-fun bm!17488 () Bool)

(declare-fun call!17491 () (_ BitVec 32))

(assert (=> bm!17488 (= call!17491 (arrayCountValidKeys!0 (_keys!5386 lt!85094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3673 (_keys!5386 lt!85094))))))

(declare-fun b!172059 () Bool)

(declare-fun e!113535 () (_ BitVec 32))

(assert (=> b!172059 (= e!113535 (bvadd #b00000000000000000000000000000001 call!17491))))

(declare-fun b!172060 () Bool)

(assert (=> b!172060 (= e!113536 #b00000000000000000000000000000000)))

(declare-fun b!172061 () Bool)

(assert (=> b!172061 (= e!113535 call!17491)))

(declare-fun b!172062 () Bool)

(assert (=> b!172062 (= e!113536 e!113535)))

(declare-fun c!30833 () Bool)

(assert (=> b!172062 (= c!30833 (validKeyInArray!0 (select (arr!3380 (_keys!5386 lt!85094)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!52509 c!30832) b!172060))

(assert (= (and d!52509 (not c!30832)) b!172062))

(assert (= (and b!172062 c!30833) b!172059))

(assert (= (and b!172062 (not c!30833)) b!172061))

(assert (= (or b!172059 b!172061) bm!17488))

(declare-fun m!201203 () Bool)

(assert (=> bm!17488 m!201203))

(assert (=> b!172062 m!200213))

(assert (=> b!172062 m!200213))

(assert (=> b!172062 m!200215))

(assert (=> bm!17411 d!52509))

(assert (=> b!171297 d!52011))

(declare-fun b!172064 () Bool)

(declare-fun e!113537 () Option!191)

(declare-fun e!113538 () Option!191)

(assert (=> b!172064 (= e!113537 e!113538)))

(declare-fun c!30835 () Bool)

(assert (=> b!172064 (= c!30835 (and ((_ is Cons!2172) (t!6970 (toList!1081 lt!85093))) (not (= (_1!1610 (h!2789 (t!6970 (toList!1081 lt!85093)))) key!828))))))

(declare-fun b!172065 () Bool)

(assert (=> b!172065 (= e!113538 (getValueByKey!185 (t!6970 (t!6970 (toList!1081 lt!85093))) key!828))))

(declare-fun d!52511 () Bool)

(declare-fun c!30834 () Bool)

(assert (=> d!52511 (= c!30834 (and ((_ is Cons!2172) (t!6970 (toList!1081 lt!85093))) (= (_1!1610 (h!2789 (t!6970 (toList!1081 lt!85093)))) key!828)))))

(assert (=> d!52511 (= (getValueByKey!185 (t!6970 (toList!1081 lt!85093)) key!828) e!113537)))

(declare-fun b!172063 () Bool)

(assert (=> b!172063 (= e!113537 (Some!190 (_2!1610 (h!2789 (t!6970 (toList!1081 lt!85093))))))))

(declare-fun b!172066 () Bool)

(assert (=> b!172066 (= e!113538 None!189)))

(assert (= (and d!52511 c!30834) b!172063))

(assert (= (and d!52511 (not c!30834)) b!172064))

(assert (= (and b!172064 c!30835) b!172065))

(assert (= (and b!172064 (not c!30835)) b!172066))

(declare-fun m!201205 () Bool)

(assert (=> b!172065 m!201205))

(assert (=> b!171300 d!52511))

(assert (=> b!171160 d!52045))

(assert (=> b!171114 d!51889))

(declare-fun d!52513 () Bool)

(declare-fun lt!85688 () Bool)

(assert (=> d!52513 (= lt!85688 (select (content!148 (toList!1081 lt!85410)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun e!113540 () Bool)

(assert (=> d!52513 (= lt!85688 e!113540)))

(declare-fun res!81712 () Bool)

(assert (=> d!52513 (=> (not res!81712) (not e!113540))))

(assert (=> d!52513 (= res!81712 ((_ is Cons!2172) (toList!1081 lt!85410)))))

(assert (=> d!52513 (= (contains!1141 (toList!1081 lt!85410) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))) lt!85688)))

(declare-fun b!172067 () Bool)

(declare-fun e!113539 () Bool)

(assert (=> b!172067 (= e!113540 e!113539)))

(declare-fun res!81713 () Bool)

(assert (=> b!172067 (=> res!81713 e!113539)))

(assert (=> b!172067 (= res!81713 (= (h!2789 (toList!1081 lt!85410)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(declare-fun b!172068 () Bool)

(assert (=> b!172068 (= e!113539 (contains!1141 (t!6970 (toList!1081 lt!85410)) (tuple2!3199 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3397 thiss!1248))))))

(assert (= (and d!52513 res!81712) b!172067))

(assert (= (and b!172067 (not res!81713)) b!172068))

(declare-fun m!201207 () Bool)

(assert (=> d!52513 m!201207))

(declare-fun m!201209 () Bool)

(assert (=> d!52513 m!201209))

(declare-fun m!201211 () Bool)

(assert (=> b!172068 m!201211))

(assert (=> b!171381 d!52513))

(declare-fun d!52515 () Bool)

(assert (=> d!52515 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85227) lt!85216)) (v!3915 (getValueByKey!185 (toList!1081 lt!85227) lt!85216)))))

(assert (=> d!52009 d!52515))

(declare-fun b!172070 () Bool)

(declare-fun e!113541 () Option!191)

(declare-fun e!113542 () Option!191)

(assert (=> b!172070 (= e!113541 e!113542)))

(declare-fun c!30837 () Bool)

(assert (=> b!172070 (= c!30837 (and ((_ is Cons!2172) (toList!1081 lt!85227)) (not (= (_1!1610 (h!2789 (toList!1081 lt!85227))) lt!85216))))))

(declare-fun b!172071 () Bool)

(assert (=> b!172071 (= e!113542 (getValueByKey!185 (t!6970 (toList!1081 lt!85227)) lt!85216))))

(declare-fun d!52517 () Bool)

(declare-fun c!30836 () Bool)

(assert (=> d!52517 (= c!30836 (and ((_ is Cons!2172) (toList!1081 lt!85227)) (= (_1!1610 (h!2789 (toList!1081 lt!85227))) lt!85216)))))

(assert (=> d!52517 (= (getValueByKey!185 (toList!1081 lt!85227) lt!85216) e!113541)))

(declare-fun b!172069 () Bool)

(assert (=> b!172069 (= e!113541 (Some!190 (_2!1610 (h!2789 (toList!1081 lt!85227)))))))

(declare-fun b!172072 () Bool)

(assert (=> b!172072 (= e!113542 None!189)))

(assert (= (and d!52517 c!30836) b!172069))

(assert (= (and d!52517 (not c!30836)) b!172070))

(assert (= (and b!172070 c!30837) b!172071))

(assert (= (and b!172070 (not c!30837)) b!172072))

(declare-fun m!201213 () Bool)

(assert (=> b!172071 m!201213))

(assert (=> d!52009 d!52517))

(declare-fun d!52519 () Bool)

(assert (=> d!52519 (= (get!1945 (getValueByKey!185 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3915 (getValueByKey!185 (toList!1081 lt!85199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51897 d!52519))

(assert (=> d!51897 d!52123))

(assert (=> b!171180 d!52045))

(declare-fun d!52521 () Bool)

(assert (=> d!52521 (= (get!1945 (getValueByKey!185 (toList!1081 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) lt!85216)) (v!3915 (getValueByKey!185 (toList!1081 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) lt!85216)))))

(assert (=> d!52005 d!52521))

(declare-fun b!172074 () Bool)

(declare-fun e!113543 () Option!191)

(declare-fun e!113544 () Option!191)

(assert (=> b!172074 (= e!113543 e!113544)))

(declare-fun c!30839 () Bool)

(assert (=> b!172074 (= c!30839 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))) (not (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))) lt!85216))))))

(declare-fun b!172075 () Bool)

(assert (=> b!172075 (= e!113544 (getValueByKey!185 (t!6970 (toList!1081 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))) lt!85216))))

(declare-fun c!30838 () Bool)

(declare-fun d!52523 () Bool)

(assert (=> d!52523 (= c!30838 (and ((_ is Cons!2172) (toList!1081 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))) (= (_1!1610 (h!2789 (toList!1081 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))))) lt!85216)))))

(assert (=> d!52523 (= (getValueByKey!185 (toList!1081 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248)))) lt!85216) e!113543)))

(declare-fun b!172073 () Bool)

(assert (=> b!172073 (= e!113543 (Some!190 (_2!1610 (h!2789 (toList!1081 (+!243 lt!85227 (tuple2!3199 lt!85225 (zeroValue!3397 thiss!1248))))))))))

(declare-fun b!172076 () Bool)

(assert (=> b!172076 (= e!113544 None!189)))

(assert (= (and d!52523 c!30838) b!172073))

(assert (= (and d!52523 (not c!30838)) b!172074))

(assert (= (and b!172074 c!30839) b!172075))

(assert (= (and b!172074 (not c!30839)) b!172076))

(declare-fun m!201215 () Bool)

(assert (=> b!172075 m!201215))

(assert (=> d!52005 d!52523))

(declare-fun d!52525 () Bool)

(declare-fun e!113545 () Bool)

(assert (=> d!52525 e!113545))

(declare-fun res!81714 () Bool)

(assert (=> d!52525 (=> res!81714 e!113545)))

(declare-fun lt!85689 () Bool)

(assert (=> d!52525 (= res!81714 (not lt!85689))))

(declare-fun lt!85691 () Bool)

(assert (=> d!52525 (= lt!85689 lt!85691)))

(declare-fun lt!85692 () Unit!5251)

(declare-fun e!113546 () Unit!5251)

(assert (=> d!52525 (= lt!85692 e!113546)))

(declare-fun c!30840 () Bool)

(assert (=> d!52525 (= c!30840 lt!85691)))

(assert (=> d!52525 (= lt!85691 (containsKey!188 (toList!1081 lt!85290) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(assert (=> d!52525 (= (contains!1139 lt!85290 (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)) lt!85689)))

(declare-fun b!172077 () Bool)

(declare-fun lt!85690 () Unit!5251)

(assert (=> b!172077 (= e!113546 lt!85690)))

(assert (=> b!172077 (= lt!85690 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1081 lt!85290) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(assert (=> b!172077 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85290) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000)))))

(declare-fun b!172078 () Bool)

(declare-fun Unit!5300 () Unit!5251)

(assert (=> b!172078 (= e!113546 Unit!5300)))

(declare-fun b!172079 () Bool)

(assert (=> b!172079 (= e!113545 (isDefined!137 (getValueByKey!185 (toList!1081 lt!85290) (select (arr!3380 (_keys!5386 lt!85094)) #b00000000000000000000000000000000))))))

(assert (= (and d!52525 c!30840) b!172077))

(assert (= (and d!52525 (not c!30840)) b!172078))

(assert (= (and d!52525 (not res!81714)) b!172079))

(assert (=> d!52525 m!199631))

(declare-fun m!201217 () Bool)

(assert (=> d!52525 m!201217))

(assert (=> b!172077 m!199631))

(declare-fun m!201219 () Bool)

(assert (=> b!172077 m!201219))

(assert (=> b!172077 m!199631))

(assert (=> b!172077 m!200951))

(assert (=> b!172077 m!200951))

(declare-fun m!201221 () Bool)

(assert (=> b!172077 m!201221))

(assert (=> b!172079 m!199631))

(assert (=> b!172079 m!200951))

(assert (=> b!172079 m!200951))

(assert (=> b!172079 m!201221))

(assert (=> b!171165 d!52525))

(declare-fun b!172081 () Bool)

(declare-fun e!113548 () Bool)

(assert (=> b!172081 (= e!113548 tp_is_empty!4003)))

(declare-fun mapNonEmpty!6808 () Bool)

(declare-fun mapRes!6808 () Bool)

(declare-fun tp!15340 () Bool)

(declare-fun e!113547 () Bool)

(assert (=> mapNonEmpty!6808 (= mapRes!6808 (and tp!15340 e!113547))))

(declare-fun mapKey!6808 () (_ BitVec 32))

(declare-fun mapRest!6808 () (Array (_ BitVec 32) ValueCell!1658))

(declare-fun mapValue!6808 () ValueCell!1658)

(assert (=> mapNonEmpty!6808 (= mapRest!6807 (store mapRest!6808 mapKey!6808 mapValue!6808))))

(declare-fun mapIsEmpty!6808 () Bool)

(assert (=> mapIsEmpty!6808 mapRes!6808))

(declare-fun condMapEmpty!6808 () Bool)

(declare-fun mapDefault!6808 () ValueCell!1658)

(assert (=> mapNonEmpty!6807 (= condMapEmpty!6808 (= mapRest!6807 ((as const (Array (_ BitVec 32) ValueCell!1658)) mapDefault!6808)))))

(assert (=> mapNonEmpty!6807 (= tp!15339 (and e!113548 mapRes!6808))))

(declare-fun b!172080 () Bool)

(assert (=> b!172080 (= e!113547 tp_is_empty!4003)))

(assert (= (and mapNonEmpty!6807 condMapEmpty!6808) mapIsEmpty!6808))

(assert (= (and mapNonEmpty!6807 (not condMapEmpty!6808)) mapNonEmpty!6808))

(assert (= (and mapNonEmpty!6808 ((_ is ValueCellFull!1658) mapValue!6808)) b!172080))

(assert (= (and mapNonEmpty!6807 ((_ is ValueCellFull!1658) mapDefault!6808)) b!172081))

(declare-fun m!201223 () Bool)

(assert (=> mapNonEmpty!6808 m!201223))

(declare-fun b_lambda!6947 () Bool)

(assert (= b_lambda!6943 (or (and b!170908 b_free!4231) b_lambda!6947)))

(declare-fun b_lambda!6949 () Bool)

(assert (= b_lambda!6921 (or (and b!170908 b_free!4231 (= (defaultEntry!3554 thiss!1248) (defaultEntry!3554 lt!85094))) b_lambda!6949)))

(declare-fun b_lambda!6951 () Bool)

(assert (= b_lambda!6935 (or (and b!170908 b_free!4231) b_lambda!6951)))

(declare-fun b_lambda!6953 () Bool)

(assert (= b_lambda!6945 (or (and b!170908 b_free!4231) b_lambda!6953)))

(declare-fun b_lambda!6955 () Bool)

(assert (= b_lambda!6937 (or (and b!170908 b_free!4231) b_lambda!6955)))

(check-sat (not d!52319) (not b!171642) (not b!171585) (not d!52247) (not b!171725) (not b!171811) (not b!172054) (not b!171501) (not b!171832) (not d!52417) (not b!171807) (not b_lambda!6951) (not bm!17480) (not d!52101) (not b!171392) (not d!52135) (not b!171854) (not b!171686) (not d!52295) (not b!171602) (not bm!17483) (not d!52047) (not b!171948) (not d!52189) (not b!171776) (not d!52173) (not b!171428) (not b!171888) (not b!172013) (not b!171993) (not d!52167) (not b!171859) (not b!171856) (not b!172022) (not b!171485) (not d!52441) (not d!52467) (not b!171520) (not b!171670) (not b!171925) (not d!52051) (not d!52483) (not b!171994) (not b!171700) (not b!171610) (not d!52105) (not b!171764) (not b!171955) (not b!172062) (not bm!17471) (not d!52525) (not b!171705) (not d!52287) (not b!171829) (not bm!17459) (not d!52285) (not b!171973) (not d!52213) (not b!171780) (not b!171523) (not d!52229) (not b_lambda!6913) (not d!52235) (not b!172032) (not d!52089) (not b!172057) (not b!171657) (not b!171912) (not b!171593) tp_is_empty!4003 (not d!52187) (not d!52127) (not b!171623) (not b!171846) (not b!171622) (not b!171961) (not bm!17448) (not b!171653) (not b!171659) (not b!171734) (not b!171446) (not b!171468) (not b!172068) (not d!52423) (not b!171890) (not d!52487) (not b!171849) (not d!52169) (not b!171872) (not b!171728) (not b_lambda!6931) (not b!172002) (not b!171920) (not d!52233) (not b!171937) (not d!52119) (not b!172033) (not d!52133) (not b!171745) (not d!52197) (not d!52427) (not b!171760) (not b!171582) (not b!171681) (not b!171514) (not mapNonEmpty!6808) (not b!171586) (not b!171683) (not b!172017) (not d!52297) (not d!52175) (not d!52041) (not d!52407) (not b!171545) (not b!171573) (not b!171442) (not d!52231) (not b!171411) (not b!171490) (not b!171715) (not d!52323) (not b!172026) (not b_lambda!6941) (not d!52193) (not d!52061) (not b!171645) (not b!171830) (not b!171884) (not b!172008) (not b!171626) (not b!172052) (not d!52463) (not b!171423) (not b!171594) (not b!171984) (not d!52311) (not d!52241) (not b!171803) (not d!52391) (not b!171395) (not d!52083) (not d!52359) (not b!171407) (not b!171732) (not d!52147) (not b!171749) (not b!171943) (not b!171731) (not b!172051) (not b_lambda!6947) (not b!171744) (not b!171736) (not b!171743) (not b!172000) (not b!171607) (not d!52403) (not b!171787) (not b!171706) (not b!172071) (not bm!17462) (not d!52087) (not b!171583) (not b!171450) (not b!171678) (not b!171814) (not d!52485) (not bm!17488) (not bm!17484) (not d!52475) (not d!52473) (not b!172079) (not d!52449) (not d!52225) (not b!172028) (not b!171550) (not b!171970) (not b!171604) (not d!52443) (not b!171612) (not d!52365) (not b!171498) (not b!171595) (not b!171664) (not bm!17470) (not b!172003) (not b!171747) (not b!171724) (not d!52471) (not b_lambda!6953) (not b!171703) (not b!171909) (not b!172055) (not b!171740) (not b!171867) (not b!171989) (not b!171484) (not b!171590) (not b!171467) (not d!52393) (not d!52029) (not b!171389) (not b!171675) (not d!52497) (not d!52303) (not b!171903) (not b!171544) (not d!52199) (not b!171526) (not d!52271) (not d!52165) (not b!171875) (not b!172012) (not d!52085) (not d!52289) (not b!171554) (not bm!17447) (not d!52183) (not d!52273) (not b!171879) (not b!171569) (not b!171960) (not b!171739) (not bm!17464) (not d!52413) (not d!52341) (not b!171931) (not b!171691) (not d!52439) (not b!171952) (not d!52355) (not b!171648) (not b!172019) (not b!171897) (not b!171755) (not b!171997) (not b!171630) (not d!52491) (not b!171597) (not d!52221) (not b!171886) (not b_lambda!6939) (not d!52035) (not b!171963) (not b!171507) (not d!52121) (not d!52053) (not b!171598) (not b!171674) (not b!171540) (not d!52313) (not bm!17463) (not d!52301) (not b!171953) (not b!171641) (not d!52163) (not b!171548) (not b!171934) (not d!52103) (not b!171835) (not b!171438) (not d!52329) (not b!171584) (not d!52283) (not d!52465) (not d!52191) (not b!171567) (not b!171774) (not b!171432) (not b!171995) (not b!171474) (not d!52267) (not d!52257) (not d!52479) (not b!171491) (not b!171403) (not d!52179) (not d!52347) (not b!171464) (not d!52437) (not b!171907) (not d!52039) (not b!171718) (not b!171478) (not b!171894) (not b!171546) (not b!171527) (not b!171957) (not b!171575) (not b!171486) (not d!52217) (not d!52159) (not b!171433) (not d!52091) (not bm!17474) (not b!171861) (not b!171711) (not d!52383) (not b!171516) (not b!171976) (not b!171534) (not b!171576) (not d!52157) (not b!171500) (not d!52237) (not d!52501) (not b!171727) (not b!171489) (not b!171915) (not b!172039) (not b!171966) (not b!171818) (not b!171634) (not b!171458) (not b!171940) (not b!171962) (not d!52411) (not b!171529) (not b!171509) (not d!52021) (not b!171698) (not b!171553) (not b!171927) (not b!171838) (not b!172029) (not b!171511) (not d!52043) (not b!171532) (not b!171837) (not d!52349) (not b!171862) (not b!171741) (not d!52125) (not b!171555) (not b!171417) (not b_next!4231) (not b!171754) (not d!52459) (not d!52253) (not b_lambda!6929) (not d!52151) (not b!171557) (not b!171693) (not b!172047) (not b!171935) (not b!171928) (not b!171716) (not b!171847) (not b!171752) b_and!10689 (not d!52027) (not b!171959) (not d!52345) (not b!171924) (not b!171397) (not b!171719) (not d!52097) (not b!171494) (not b!171899) (not b!171581) (not b!172015) (not b!171777) (not b!171771) (not b!171983) (not b!171651) (not b!171408) (not b!171696) (not b!171654) (not b!171942) (not b!171975) (not b!171773) (not bm!17440) (not d!52507) (not d!52369) (not b!171570) (not b_lambda!6949) (not b!171978) (not b!171563) (not d!52265) (not d!52111) (not d!52081) (not b!171689) (not d!52149) (not b!171809) (not d!52063) (not d!52387) (not b!172075) (not b!171722) (not b!171605) (not b!171842) (not b!171510) (not d!52513) (not b!172034) (not d!52185) (not b!171420) (not d!52399) (not b!171822) (not d!52181) (not bm!17467) (not b!171470) (not b_lambda!6933) (not b!172058) (not bm!17456) (not d!52315) (not d!52395) (not b!171851) (not d!52025) (not b!171600) (not b!171415) (not bm!17443) (not b!171488) (not b!171422) (not d!52261) (not d!52161) (not d!52495) (not d!52277) (not b_lambda!6915) (not d!52215) (not b!171665) (not bm!17452) (not b!171840) (not b!171398) (not b!171580) (not b!171902) (not b!171559) (not bm!17453) (not d!52431) (not b!171906) (not d!52153) (not b_lambda!6927) (not b!171599) (not b!171560) (not b!172036) (not b!171900) (not d!52477) (not b!171656) (not b_lambda!6955) (not b!171558) (not d!52279) (not b!171390) (not b!171914) (not b!171981) (not b!171904) (not b!171650) (not b!172042) (not b!171746) (not bm!17477) (not b!171461) (not b!171454) (not b!171844) (not d!52243) (not d!52177) (not b!171518) (not d!52397) (not b!171535) (not bm!17446) (not d!52171) (not bm!17487) (not b!171662) (not d!52033) (not d!52433) (not b!171618) (not b!172077) (not d!52137) (not b!172025) (not b!171448) (not bm!17451) (not b!172065) (not b!171871) (not d!52107) (not b!171578) (not b!171853) (not d!52371) (not b!171414) (not b!171613) (not b!171721) (not b!171443) (not d!52503) (not d!52131) (not b!171504) (not b!171765))
(check-sat b_and!10689 (not b_next!4231))
