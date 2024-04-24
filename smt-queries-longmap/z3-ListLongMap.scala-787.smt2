; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18752 () Bool)

(assert start!18752)

(declare-fun b!185307 () Bool)

(declare-fun b_free!4561 () Bool)

(declare-fun b_next!4561 () Bool)

(assert (=> b!185307 (= b_free!4561 (not b_next!4561))))

(declare-fun tp!16476 () Bool)

(declare-fun b_and!11173 () Bool)

(assert (=> b!185307 (= tp!16476 b_and!11173)))

(declare-fun b!185306 () Bool)

(declare-fun res!87647 () Bool)

(declare-fun e!121940 () Bool)

(assert (=> b!185306 (=> (not res!87647) (not e!121940))))

(declare-datatypes ((V!5425 0))(
  ( (V!5426 (val!2211 Int)) )
))
(declare-datatypes ((ValueCell!1823 0))(
  ( (ValueCellFull!1823 (v!4121 V!5425)) (EmptyCell!1823) )
))
(declare-datatypes ((array!7857 0))(
  ( (array!7858 (arr!3710 (Array (_ BitVec 32) (_ BitVec 64))) (size!4026 (_ BitVec 32))) )
))
(declare-datatypes ((array!7859 0))(
  ( (array!7860 (arr!3711 (Array (_ BitVec 32) ValueCell!1823)) (size!4027 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2554 0))(
  ( (LongMapFixedSize!2555 (defaultEntry!3777 Int) (mask!8880 (_ BitVec 32)) (extraKeys!3514 (_ BitVec 32)) (zeroValue!3618 V!5425) (minValue!3618 V!5425) (_size!1326 (_ BitVec 32)) (_keys!5714 array!7857) (_values!3760 array!7859) (_vacant!1326 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2554)

(assert (=> b!185306 (= res!87647 (and (= (size!4027 (_values!3760 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8880 thiss!1248))) (= (size!4026 (_keys!5714 thiss!1248)) (size!4027 (_values!3760 thiss!1248))) (bvsge (mask!8880 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3514 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3514 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7455 () Bool)

(declare-fun mapRes!7455 () Bool)

(assert (=> mapIsEmpty!7455 mapRes!7455))

(declare-fun res!87650 () Bool)

(declare-fun e!121942 () Bool)

(assert (=> start!18752 (=> (not res!87650) (not e!121942))))

(declare-fun valid!1077 (LongMapFixedSize!2554) Bool)

(assert (=> start!18752 (= res!87650 (valid!1077 thiss!1248))))

(assert (=> start!18752 e!121942))

(declare-fun e!121943 () Bool)

(assert (=> start!18752 e!121943))

(assert (=> start!18752 true))

(declare-fun e!121944 () Bool)

(declare-fun tp_is_empty!4333 () Bool)

(declare-fun array_inv!2393 (array!7857) Bool)

(declare-fun array_inv!2394 (array!7859) Bool)

(assert (=> b!185307 (= e!121943 (and tp!16476 tp_is_empty!4333 (array_inv!2393 (_keys!5714 thiss!1248)) (array_inv!2394 (_values!3760 thiss!1248)) e!121944))))

(declare-fun b!185308 () Bool)

(declare-fun res!87649 () Bool)

(assert (=> b!185308 (=> (not res!87649) (not e!121940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7857 (_ BitVec 32)) Bool)

(assert (=> b!185308 (= res!87649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5714 thiss!1248) (mask!8880 thiss!1248)))))

(declare-fun b!185309 () Bool)

(declare-fun e!121941 () Bool)

(assert (=> b!185309 (= e!121941 tp_is_empty!4333)))

(declare-fun b!185310 () Bool)

(declare-fun res!87646 () Bool)

(assert (=> b!185310 (=> (not res!87646) (not e!121942))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!185310 (= res!87646 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185311 () Bool)

(declare-fun res!87645 () Bool)

(assert (=> b!185311 (=> (not res!87645) (not e!121940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185311 (= res!87645 (validMask!0 (mask!8880 thiss!1248)))))

(declare-fun b!185312 () Bool)

(assert (=> b!185312 (= e!121942 e!121940)))

(declare-fun res!87644 () Bool)

(assert (=> b!185312 (=> (not res!87644) (not e!121940))))

(declare-datatypes ((SeekEntryResult!621 0))(
  ( (MissingZero!621 (index!4654 (_ BitVec 32))) (Found!621 (index!4655 (_ BitVec 32))) (Intermediate!621 (undefined!1433 Bool) (index!4656 (_ BitVec 32)) (x!20115 (_ BitVec 32))) (Undefined!621) (MissingVacant!621 (index!4657 (_ BitVec 32))) )
))
(declare-fun lt!91703 () SeekEntryResult!621)

(get-info :version)

(assert (=> b!185312 (= res!87644 (and (not ((_ is Undefined!621) lt!91703)) (not ((_ is MissingVacant!621) lt!91703)) (not ((_ is MissingZero!621) lt!91703)) ((_ is Found!621) lt!91703)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7857 (_ BitVec 32)) SeekEntryResult!621)

(assert (=> b!185312 (= lt!91703 (seekEntryOrOpen!0 key!828 (_keys!5714 thiss!1248) (mask!8880 thiss!1248)))))

(declare-fun mapNonEmpty!7455 () Bool)

(declare-fun tp!16475 () Bool)

(declare-fun e!121945 () Bool)

(assert (=> mapNonEmpty!7455 (= mapRes!7455 (and tp!16475 e!121945))))

(declare-fun mapValue!7455 () ValueCell!1823)

(declare-fun mapRest!7455 () (Array (_ BitVec 32) ValueCell!1823))

(declare-fun mapKey!7455 () (_ BitVec 32))

(assert (=> mapNonEmpty!7455 (= (arr!3711 (_values!3760 thiss!1248)) (store mapRest!7455 mapKey!7455 mapValue!7455))))

(declare-fun b!185313 () Bool)

(assert (=> b!185313 (= e!121945 tp_is_empty!4333)))

(declare-fun b!185314 () Bool)

(declare-fun res!87648 () Bool)

(assert (=> b!185314 (=> (not res!87648) (not e!121940))))

(declare-datatypes ((tuple2!3386 0))(
  ( (tuple2!3387 (_1!1704 (_ BitVec 64)) (_2!1704 V!5425)) )
))
(declare-datatypes ((List!2319 0))(
  ( (Nil!2316) (Cons!2315 (h!2948 tuple2!3386) (t!7191 List!2319)) )
))
(declare-datatypes ((ListLongMap!2307 0))(
  ( (ListLongMap!2308 (toList!1169 List!2319)) )
))
(declare-fun contains!1275 (ListLongMap!2307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!821 (array!7857 array!7859 (_ BitVec 32) (_ BitVec 32) V!5425 V!5425 (_ BitVec 32) Int) ListLongMap!2307)

(assert (=> b!185314 (= res!87648 (not (contains!1275 (getCurrentListMap!821 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)) key!828)))))

(declare-fun b!185315 () Bool)

(assert (=> b!185315 (= e!121944 (and e!121941 mapRes!7455))))

(declare-fun condMapEmpty!7455 () Bool)

(declare-fun mapDefault!7455 () ValueCell!1823)

(assert (=> b!185315 (= condMapEmpty!7455 (= (arr!3711 (_values!3760 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1823)) mapDefault!7455)))))

(declare-fun b!185316 () Bool)

(declare-datatypes ((List!2320 0))(
  ( (Nil!2317) (Cons!2316 (h!2949 (_ BitVec 64)) (t!7192 List!2320)) )
))
(declare-fun arrayNoDuplicates!0 (array!7857 (_ BitVec 32) List!2320) Bool)

(assert (=> b!185316 (= e!121940 (not (arrayNoDuplicates!0 (_keys!5714 thiss!1248) #b00000000000000000000000000000000 Nil!2317)))))

(assert (= (and start!18752 res!87650) b!185310))

(assert (= (and b!185310 res!87646) b!185312))

(assert (= (and b!185312 res!87644) b!185314))

(assert (= (and b!185314 res!87648) b!185311))

(assert (= (and b!185311 res!87645) b!185306))

(assert (= (and b!185306 res!87647) b!185308))

(assert (= (and b!185308 res!87649) b!185316))

(assert (= (and b!185315 condMapEmpty!7455) mapIsEmpty!7455))

(assert (= (and b!185315 (not condMapEmpty!7455)) mapNonEmpty!7455))

(assert (= (and mapNonEmpty!7455 ((_ is ValueCellFull!1823) mapValue!7455)) b!185313))

(assert (= (and b!185315 ((_ is ValueCellFull!1823) mapDefault!7455)) b!185309))

(assert (= b!185307 b!185315))

(assert (= start!18752 b!185307))

(declare-fun m!212725 () Bool)

(assert (=> b!185314 m!212725))

(assert (=> b!185314 m!212725))

(declare-fun m!212727 () Bool)

(assert (=> b!185314 m!212727))

(declare-fun m!212729 () Bool)

(assert (=> b!185312 m!212729))

(declare-fun m!212731 () Bool)

(assert (=> b!185316 m!212731))

(declare-fun m!212733 () Bool)

(assert (=> b!185307 m!212733))

(declare-fun m!212735 () Bool)

(assert (=> b!185307 m!212735))

(declare-fun m!212737 () Bool)

(assert (=> start!18752 m!212737))

(declare-fun m!212739 () Bool)

(assert (=> b!185311 m!212739))

(declare-fun m!212741 () Bool)

(assert (=> mapNonEmpty!7455 m!212741))

(declare-fun m!212743 () Bool)

(assert (=> b!185308 m!212743))

(check-sat (not b!185311) (not b_next!4561) (not b!185312) (not b!185308) b_and!11173 (not b!185314) (not mapNonEmpty!7455) (not b!185316) tp_is_empty!4333 (not b!185307) (not start!18752))
(check-sat b_and!11173 (not b_next!4561))
(get-model)

(declare-fun d!55171 () Bool)

(declare-fun e!121993 () Bool)

(assert (=> d!55171 e!121993))

(declare-fun res!87695 () Bool)

(assert (=> d!55171 (=> res!87695 e!121993)))

(declare-fun lt!91719 () Bool)

(assert (=> d!55171 (= res!87695 (not lt!91719))))

(declare-fun lt!91720 () Bool)

(assert (=> d!55171 (= lt!91719 lt!91720)))

(declare-datatypes ((Unit!5588 0))(
  ( (Unit!5589) )
))
(declare-fun lt!91718 () Unit!5588)

(declare-fun e!121992 () Unit!5588)

(assert (=> d!55171 (= lt!91718 e!121992)))

(declare-fun c!33266 () Bool)

(assert (=> d!55171 (= c!33266 lt!91720)))

(declare-fun containsKey!226 (List!2319 (_ BitVec 64)) Bool)

(assert (=> d!55171 (= lt!91720 (containsKey!226 (toList!1169 (getCurrentListMap!821 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248))) key!828))))

(assert (=> d!55171 (= (contains!1275 (getCurrentListMap!821 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)) key!828) lt!91719)))

(declare-fun b!185389 () Bool)

(declare-fun lt!91721 () Unit!5588)

(assert (=> b!185389 (= e!121992 lt!91721)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!174 (List!2319 (_ BitVec 64)) Unit!5588)

(assert (=> b!185389 (= lt!91721 (lemmaContainsKeyImpliesGetValueByKeyDefined!174 (toList!1169 (getCurrentListMap!821 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248))) key!828))))

(declare-datatypes ((Option!229 0))(
  ( (Some!228 (v!4124 V!5425)) (None!227) )
))
(declare-fun isDefined!175 (Option!229) Bool)

(declare-fun getValueByKey!223 (List!2319 (_ BitVec 64)) Option!229)

(assert (=> b!185389 (isDefined!175 (getValueByKey!223 (toList!1169 (getCurrentListMap!821 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248))) key!828))))

(declare-fun b!185390 () Bool)

(declare-fun Unit!5590 () Unit!5588)

(assert (=> b!185390 (= e!121992 Unit!5590)))

(declare-fun b!185391 () Bool)

(assert (=> b!185391 (= e!121993 (isDefined!175 (getValueByKey!223 (toList!1169 (getCurrentListMap!821 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248))) key!828)))))

(assert (= (and d!55171 c!33266) b!185389))

(assert (= (and d!55171 (not c!33266)) b!185390))

(assert (= (and d!55171 (not res!87695)) b!185391))

(declare-fun m!212785 () Bool)

(assert (=> d!55171 m!212785))

(declare-fun m!212787 () Bool)

(assert (=> b!185389 m!212787))

(declare-fun m!212789 () Bool)

(assert (=> b!185389 m!212789))

(assert (=> b!185389 m!212789))

(declare-fun m!212791 () Bool)

(assert (=> b!185389 m!212791))

(assert (=> b!185391 m!212789))

(assert (=> b!185391 m!212789))

(assert (=> b!185391 m!212791))

(assert (=> b!185314 d!55171))

(declare-fun b!185434 () Bool)

(declare-fun e!122021 () Bool)

(declare-fun lt!91785 () ListLongMap!2307)

(declare-fun apply!165 (ListLongMap!2307 (_ BitVec 64)) V!5425)

(assert (=> b!185434 (= e!122021 (= (apply!165 lt!91785 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3618 thiss!1248)))))

(declare-fun bm!18685 () Bool)

(declare-fun call!18692 () ListLongMap!2307)

(declare-fun call!18694 () ListLongMap!2307)

(assert (=> bm!18685 (= call!18692 call!18694)))

(declare-fun b!185435 () Bool)

(declare-fun e!122025 () Bool)

(declare-fun call!18689 () Bool)

(assert (=> b!185435 (= e!122025 (not call!18689))))

(declare-fun b!185436 () Bool)

(declare-fun e!122028 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!185436 (= e!122028 (validKeyInArray!0 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185437 () Bool)

(declare-fun e!122020 () Bool)

(assert (=> b!185437 (= e!122020 e!122025)))

(declare-fun c!33281 () Bool)

(assert (=> b!185437 (= c!33281 (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185438 () Bool)

(declare-fun e!122026 () Bool)

(declare-fun get!2144 (ValueCell!1823 V!5425) V!5425)

(declare-fun dynLambda!508 (Int (_ BitVec 64)) V!5425)

(assert (=> b!185438 (= e!122026 (= (apply!165 lt!91785 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000)) (get!2144 (select (arr!3711 (_values!3760 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!508 (defaultEntry!3777 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185438 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4027 (_values!3760 thiss!1248))))))

(assert (=> b!185438 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4026 (_keys!5714 thiss!1248))))))

(declare-fun bm!18686 () Bool)

(declare-fun call!18690 () ListLongMap!2307)

(declare-fun call!18693 () ListLongMap!2307)

(assert (=> bm!18686 (= call!18690 call!18693)))

(declare-fun b!185439 () Bool)

(declare-fun c!33282 () Bool)

(assert (=> b!185439 (= c!33282 (and (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!122031 () ListLongMap!2307)

(declare-fun e!122032 () ListLongMap!2307)

(assert (=> b!185439 (= e!122031 e!122032)))

(declare-fun b!185440 () Bool)

(assert (=> b!185440 (= e!122032 call!18692)))

(declare-fun b!185441 () Bool)

(declare-fun res!87714 () Bool)

(assert (=> b!185441 (=> (not res!87714) (not e!122020))))

(declare-fun e!122024 () Bool)

(assert (=> b!185441 (= res!87714 e!122024)))

(declare-fun c!33283 () Bool)

(assert (=> b!185441 (= c!33283 (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!185442 () Bool)

(assert (=> b!185442 (= e!122024 e!122021)))

(declare-fun res!87721 () Bool)

(declare-fun call!18688 () Bool)

(assert (=> b!185442 (= res!87721 call!18688)))

(assert (=> b!185442 (=> (not res!87721) (not e!122021))))

(declare-fun b!185443 () Bool)

(declare-fun e!122029 () Bool)

(assert (=> b!185443 (= e!122029 (validKeyInArray!0 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185444 () Bool)

(declare-fun e!122030 () Unit!5588)

(declare-fun Unit!5591 () Unit!5588)

(assert (=> b!185444 (= e!122030 Unit!5591)))

(declare-fun b!185445 () Bool)

(declare-fun res!87716 () Bool)

(assert (=> b!185445 (=> (not res!87716) (not e!122020))))

(declare-fun e!122023 () Bool)

(assert (=> b!185445 (= res!87716 e!122023)))

(declare-fun res!87719 () Bool)

(assert (=> b!185445 (=> res!87719 e!122023)))

(assert (=> b!185445 (= res!87719 (not e!122029))))

(declare-fun res!87717 () Bool)

(assert (=> b!185445 (=> (not res!87717) (not e!122029))))

(assert (=> b!185445 (= res!87717 (bvslt #b00000000000000000000000000000000 (size!4026 (_keys!5714 thiss!1248))))))

(declare-fun b!185446 () Bool)

(declare-fun e!122022 () Bool)

(assert (=> b!185446 (= e!122025 e!122022)))

(declare-fun res!87715 () Bool)

(assert (=> b!185446 (= res!87715 call!18689)))

(assert (=> b!185446 (=> (not res!87715) (not e!122022))))

(declare-fun b!185447 () Bool)

(declare-fun e!122027 () ListLongMap!2307)

(declare-fun +!285 (ListLongMap!2307 tuple2!3386) ListLongMap!2307)

(assert (=> b!185447 (= e!122027 (+!285 call!18694 (tuple2!3387 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3618 thiss!1248))))))

(declare-fun b!185448 () Bool)

(declare-fun lt!91777 () Unit!5588)

(assert (=> b!185448 (= e!122030 lt!91777)))

(declare-fun lt!91771 () ListLongMap!2307)

(declare-fun getCurrentListMapNoExtraKeys!196 (array!7857 array!7859 (_ BitVec 32) (_ BitVec 32) V!5425 V!5425 (_ BitVec 32) Int) ListLongMap!2307)

(assert (=> b!185448 (= lt!91771 (getCurrentListMapNoExtraKeys!196 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)))))

(declare-fun lt!91774 () (_ BitVec 64))

(assert (=> b!185448 (= lt!91774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91767 () (_ BitVec 64))

(assert (=> b!185448 (= lt!91767 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91775 () Unit!5588)

(declare-fun addStillContains!141 (ListLongMap!2307 (_ BitVec 64) V!5425 (_ BitVec 64)) Unit!5588)

(assert (=> b!185448 (= lt!91775 (addStillContains!141 lt!91771 lt!91774 (zeroValue!3618 thiss!1248) lt!91767))))

(assert (=> b!185448 (contains!1275 (+!285 lt!91771 (tuple2!3387 lt!91774 (zeroValue!3618 thiss!1248))) lt!91767)))

(declare-fun lt!91766 () Unit!5588)

(assert (=> b!185448 (= lt!91766 lt!91775)))

(declare-fun lt!91783 () ListLongMap!2307)

(assert (=> b!185448 (= lt!91783 (getCurrentListMapNoExtraKeys!196 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)))))

(declare-fun lt!91781 () (_ BitVec 64))

(assert (=> b!185448 (= lt!91781 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91776 () (_ BitVec 64))

(assert (=> b!185448 (= lt!91776 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91768 () Unit!5588)

(declare-fun addApplyDifferent!141 (ListLongMap!2307 (_ BitVec 64) V!5425 (_ BitVec 64)) Unit!5588)

(assert (=> b!185448 (= lt!91768 (addApplyDifferent!141 lt!91783 lt!91781 (minValue!3618 thiss!1248) lt!91776))))

(assert (=> b!185448 (= (apply!165 (+!285 lt!91783 (tuple2!3387 lt!91781 (minValue!3618 thiss!1248))) lt!91776) (apply!165 lt!91783 lt!91776))))

(declare-fun lt!91772 () Unit!5588)

(assert (=> b!185448 (= lt!91772 lt!91768)))

(declare-fun lt!91778 () ListLongMap!2307)

(assert (=> b!185448 (= lt!91778 (getCurrentListMapNoExtraKeys!196 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)))))

(declare-fun lt!91773 () (_ BitVec 64))

(assert (=> b!185448 (= lt!91773 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91782 () (_ BitVec 64))

(assert (=> b!185448 (= lt!91782 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91769 () Unit!5588)

(assert (=> b!185448 (= lt!91769 (addApplyDifferent!141 lt!91778 lt!91773 (zeroValue!3618 thiss!1248) lt!91782))))

(assert (=> b!185448 (= (apply!165 (+!285 lt!91778 (tuple2!3387 lt!91773 (zeroValue!3618 thiss!1248))) lt!91782) (apply!165 lt!91778 lt!91782))))

(declare-fun lt!91784 () Unit!5588)

(assert (=> b!185448 (= lt!91784 lt!91769)))

(declare-fun lt!91770 () ListLongMap!2307)

(assert (=> b!185448 (= lt!91770 (getCurrentListMapNoExtraKeys!196 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)))))

(declare-fun lt!91780 () (_ BitVec 64))

(assert (=> b!185448 (= lt!91780 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91787 () (_ BitVec 64))

(assert (=> b!185448 (= lt!91787 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185448 (= lt!91777 (addApplyDifferent!141 lt!91770 lt!91780 (minValue!3618 thiss!1248) lt!91787))))

(assert (=> b!185448 (= (apply!165 (+!285 lt!91770 (tuple2!3387 lt!91780 (minValue!3618 thiss!1248))) lt!91787) (apply!165 lt!91770 lt!91787))))

(declare-fun b!185449 () Bool)

(declare-fun call!18691 () ListLongMap!2307)

(assert (=> b!185449 (= e!122032 call!18691)))

(declare-fun b!185450 () Bool)

(assert (=> b!185450 (= e!122022 (= (apply!165 lt!91785 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3618 thiss!1248)))))

(declare-fun bm!18687 () Bool)

(assert (=> bm!18687 (= call!18691 call!18690)))

(declare-fun b!185451 () Bool)

(assert (=> b!185451 (= e!122023 e!122026)))

(declare-fun res!87720 () Bool)

(assert (=> b!185451 (=> (not res!87720) (not e!122026))))

(assert (=> b!185451 (= res!87720 (contains!1275 lt!91785 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185451 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4026 (_keys!5714 thiss!1248))))))

(declare-fun bm!18688 () Bool)

(assert (=> bm!18688 (= call!18693 (getCurrentListMapNoExtraKeys!196 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)))))

(declare-fun b!185452 () Bool)

(assert (=> b!185452 (= e!122031 call!18692)))

(declare-fun b!185453 () Bool)

(assert (=> b!185453 (= e!122024 (not call!18688))))

(declare-fun d!55173 () Bool)

(assert (=> d!55173 e!122020))

(declare-fun res!87722 () Bool)

(assert (=> d!55173 (=> (not res!87722) (not e!122020))))

(assert (=> d!55173 (= res!87722 (or (bvsge #b00000000000000000000000000000000 (size!4026 (_keys!5714 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4026 (_keys!5714 thiss!1248))))))))

(declare-fun lt!91786 () ListLongMap!2307)

(assert (=> d!55173 (= lt!91785 lt!91786)))

(declare-fun lt!91779 () Unit!5588)

(assert (=> d!55173 (= lt!91779 e!122030)))

(declare-fun c!33279 () Bool)

(assert (=> d!55173 (= c!33279 e!122028)))

(declare-fun res!87718 () Bool)

(assert (=> d!55173 (=> (not res!87718) (not e!122028))))

(assert (=> d!55173 (= res!87718 (bvslt #b00000000000000000000000000000000 (size!4026 (_keys!5714 thiss!1248))))))

(assert (=> d!55173 (= lt!91786 e!122027)))

(declare-fun c!33280 () Bool)

(assert (=> d!55173 (= c!33280 (and (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55173 (validMask!0 (mask!8880 thiss!1248))))

(assert (=> d!55173 (= (getCurrentListMap!821 (_keys!5714 thiss!1248) (_values!3760 thiss!1248) (mask!8880 thiss!1248) (extraKeys!3514 thiss!1248) (zeroValue!3618 thiss!1248) (minValue!3618 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3777 thiss!1248)) lt!91785)))

(declare-fun bm!18689 () Bool)

(assert (=> bm!18689 (= call!18688 (contains!1275 lt!91785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185454 () Bool)

(assert (=> b!185454 (= e!122027 e!122031)))

(declare-fun c!33284 () Bool)

(assert (=> b!185454 (= c!33284 (and (not (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3514 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18690 () Bool)

(assert (=> bm!18690 (= call!18689 (contains!1275 lt!91785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18691 () Bool)

(assert (=> bm!18691 (= call!18694 (+!285 (ite c!33280 call!18693 (ite c!33284 call!18690 call!18691)) (ite (or c!33280 c!33284) (tuple2!3387 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3618 thiss!1248)) (tuple2!3387 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3618 thiss!1248)))))))

(assert (= (and d!55173 c!33280) b!185447))

(assert (= (and d!55173 (not c!33280)) b!185454))

(assert (= (and b!185454 c!33284) b!185452))

(assert (= (and b!185454 (not c!33284)) b!185439))

(assert (= (and b!185439 c!33282) b!185440))

(assert (= (and b!185439 (not c!33282)) b!185449))

(assert (= (or b!185440 b!185449) bm!18687))

(assert (= (or b!185452 bm!18687) bm!18686))

(assert (= (or b!185452 b!185440) bm!18685))

(assert (= (or b!185447 bm!18686) bm!18688))

(assert (= (or b!185447 bm!18685) bm!18691))

(assert (= (and d!55173 res!87718) b!185436))

(assert (= (and d!55173 c!33279) b!185448))

(assert (= (and d!55173 (not c!33279)) b!185444))

(assert (= (and d!55173 res!87722) b!185445))

(assert (= (and b!185445 res!87717) b!185443))

(assert (= (and b!185445 (not res!87719)) b!185451))

(assert (= (and b!185451 res!87720) b!185438))

(assert (= (and b!185445 res!87716) b!185441))

(assert (= (and b!185441 c!33283) b!185442))

(assert (= (and b!185441 (not c!33283)) b!185453))

(assert (= (and b!185442 res!87721) b!185434))

(assert (= (or b!185442 b!185453) bm!18689))

(assert (= (and b!185441 res!87714) b!185437))

(assert (= (and b!185437 c!33281) b!185446))

(assert (= (and b!185437 (not c!33281)) b!185435))

(assert (= (and b!185446 res!87715) b!185450))

(assert (= (or b!185446 b!185435) bm!18690))

(declare-fun b_lambda!7269 () Bool)

(assert (=> (not b_lambda!7269) (not b!185438)))

(declare-fun t!7196 () Bool)

(declare-fun tb!2833 () Bool)

(assert (=> (and b!185307 (= (defaultEntry!3777 thiss!1248) (defaultEntry!3777 thiss!1248)) t!7196) tb!2833))

(declare-fun result!4793 () Bool)

(assert (=> tb!2833 (= result!4793 tp_is_empty!4333)))

(assert (=> b!185438 t!7196))

(declare-fun b_and!11179 () Bool)

(assert (= b_and!11173 (and (=> t!7196 result!4793) b_and!11179)))

(declare-fun m!212793 () Bool)

(assert (=> bm!18691 m!212793))

(declare-fun m!212795 () Bool)

(assert (=> bm!18690 m!212795))

(declare-fun m!212797 () Bool)

(assert (=> b!185438 m!212797))

(declare-fun m!212799 () Bool)

(assert (=> b!185438 m!212799))

(assert (=> b!185438 m!212797))

(declare-fun m!212801 () Bool)

(assert (=> b!185438 m!212801))

(declare-fun m!212803 () Bool)

(assert (=> b!185438 m!212803))

(assert (=> b!185438 m!212801))

(assert (=> b!185438 m!212799))

(declare-fun m!212805 () Bool)

(assert (=> b!185438 m!212805))

(declare-fun m!212807 () Bool)

(assert (=> b!185448 m!212807))

(assert (=> b!185448 m!212799))

(declare-fun m!212809 () Bool)

(assert (=> b!185448 m!212809))

(declare-fun m!212811 () Bool)

(assert (=> b!185448 m!212811))

(declare-fun m!212813 () Bool)

(assert (=> b!185448 m!212813))

(declare-fun m!212815 () Bool)

(assert (=> b!185448 m!212815))

(declare-fun m!212817 () Bool)

(assert (=> b!185448 m!212817))

(assert (=> b!185448 m!212807))

(declare-fun m!212819 () Bool)

(assert (=> b!185448 m!212819))

(declare-fun m!212821 () Bool)

(assert (=> b!185448 m!212821))

(assert (=> b!185448 m!212809))

(declare-fun m!212823 () Bool)

(assert (=> b!185448 m!212823))

(declare-fun m!212825 () Bool)

(assert (=> b!185448 m!212825))

(declare-fun m!212827 () Bool)

(assert (=> b!185448 m!212827))

(declare-fun m!212829 () Bool)

(assert (=> b!185448 m!212829))

(declare-fun m!212831 () Bool)

(assert (=> b!185448 m!212831))

(assert (=> b!185448 m!212827))

(declare-fun m!212833 () Bool)

(assert (=> b!185448 m!212833))

(declare-fun m!212835 () Bool)

(assert (=> b!185448 m!212835))

(assert (=> b!185448 m!212825))

(declare-fun m!212837 () Bool)

(assert (=> b!185448 m!212837))

(declare-fun m!212839 () Bool)

(assert (=> b!185434 m!212839))

(declare-fun m!212841 () Bool)

(assert (=> b!185447 m!212841))

(assert (=> b!185451 m!212799))

(assert (=> b!185451 m!212799))

(declare-fun m!212843 () Bool)

(assert (=> b!185451 m!212843))

(declare-fun m!212845 () Bool)

(assert (=> b!185450 m!212845))

(assert (=> bm!18688 m!212817))

(assert (=> b!185443 m!212799))

(assert (=> b!185443 m!212799))

(declare-fun m!212847 () Bool)

(assert (=> b!185443 m!212847))

(declare-fun m!212849 () Bool)

(assert (=> bm!18689 m!212849))

(assert (=> b!185436 m!212799))

(assert (=> b!185436 m!212799))

(assert (=> b!185436 m!212847))

(assert (=> d!55173 m!212739))

(assert (=> b!185314 d!55173))

(declare-fun d!55175 () Bool)

(declare-fun res!87729 () Bool)

(declare-fun e!122035 () Bool)

(assert (=> d!55175 (=> (not res!87729) (not e!122035))))

(declare-fun simpleValid!181 (LongMapFixedSize!2554) Bool)

(assert (=> d!55175 (= res!87729 (simpleValid!181 thiss!1248))))

(assert (=> d!55175 (= (valid!1077 thiss!1248) e!122035)))

(declare-fun b!185463 () Bool)

(declare-fun res!87730 () Bool)

(assert (=> b!185463 (=> (not res!87730) (not e!122035))))

(declare-fun arrayCountValidKeys!0 (array!7857 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!185463 (= res!87730 (= (arrayCountValidKeys!0 (_keys!5714 thiss!1248) #b00000000000000000000000000000000 (size!4026 (_keys!5714 thiss!1248))) (_size!1326 thiss!1248)))))

(declare-fun b!185464 () Bool)

(declare-fun res!87731 () Bool)

(assert (=> b!185464 (=> (not res!87731) (not e!122035))))

(assert (=> b!185464 (= res!87731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5714 thiss!1248) (mask!8880 thiss!1248)))))

(declare-fun b!185465 () Bool)

(assert (=> b!185465 (= e!122035 (arrayNoDuplicates!0 (_keys!5714 thiss!1248) #b00000000000000000000000000000000 Nil!2317))))

(assert (= (and d!55175 res!87729) b!185463))

(assert (= (and b!185463 res!87730) b!185464))

(assert (= (and b!185464 res!87731) b!185465))

(declare-fun m!212851 () Bool)

(assert (=> d!55175 m!212851))

(declare-fun m!212853 () Bool)

(assert (=> b!185463 m!212853))

(assert (=> b!185464 m!212743))

(assert (=> b!185465 m!212731))

(assert (=> start!18752 d!55175))

(declare-fun bm!18694 () Bool)

(declare-fun call!18697 () Bool)

(assert (=> bm!18694 (= call!18697 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5714 thiss!1248) (mask!8880 thiss!1248)))))

(declare-fun b!185474 () Bool)

(declare-fun e!122042 () Bool)

(assert (=> b!185474 (= e!122042 call!18697)))

(declare-fun d!55177 () Bool)

(declare-fun res!87736 () Bool)

(declare-fun e!122043 () Bool)

(assert (=> d!55177 (=> res!87736 e!122043)))

(assert (=> d!55177 (= res!87736 (bvsge #b00000000000000000000000000000000 (size!4026 (_keys!5714 thiss!1248))))))

(assert (=> d!55177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5714 thiss!1248) (mask!8880 thiss!1248)) e!122043)))

(declare-fun b!185475 () Bool)

(declare-fun e!122044 () Bool)

(assert (=> b!185475 (= e!122044 call!18697)))

(declare-fun b!185476 () Bool)

(assert (=> b!185476 (= e!122043 e!122044)))

(declare-fun c!33287 () Bool)

(assert (=> b!185476 (= c!33287 (validKeyInArray!0 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185477 () Bool)

(assert (=> b!185477 (= e!122044 e!122042)))

(declare-fun lt!91795 () (_ BitVec 64))

(assert (=> b!185477 (= lt!91795 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91796 () Unit!5588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7857 (_ BitVec 64) (_ BitVec 32)) Unit!5588)

(assert (=> b!185477 (= lt!91796 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5714 thiss!1248) lt!91795 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!185477 (arrayContainsKey!0 (_keys!5714 thiss!1248) lt!91795 #b00000000000000000000000000000000)))

(declare-fun lt!91794 () Unit!5588)

(assert (=> b!185477 (= lt!91794 lt!91796)))

(declare-fun res!87737 () Bool)

(assert (=> b!185477 (= res!87737 (= (seekEntryOrOpen!0 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000) (_keys!5714 thiss!1248) (mask!8880 thiss!1248)) (Found!621 #b00000000000000000000000000000000)))))

(assert (=> b!185477 (=> (not res!87737) (not e!122042))))

(assert (= (and d!55177 (not res!87736)) b!185476))

(assert (= (and b!185476 c!33287) b!185477))

(assert (= (and b!185476 (not c!33287)) b!185475))

(assert (= (and b!185477 res!87737) b!185474))

(assert (= (or b!185474 b!185475) bm!18694))

(declare-fun m!212855 () Bool)

(assert (=> bm!18694 m!212855))

(assert (=> b!185476 m!212799))

(assert (=> b!185476 m!212799))

(assert (=> b!185476 m!212847))

(assert (=> b!185477 m!212799))

(declare-fun m!212857 () Bool)

(assert (=> b!185477 m!212857))

(declare-fun m!212859 () Bool)

(assert (=> b!185477 m!212859))

(assert (=> b!185477 m!212799))

(declare-fun m!212861 () Bool)

(assert (=> b!185477 m!212861))

(assert (=> b!185308 d!55177))

(declare-fun d!55179 () Bool)

(assert (=> d!55179 (= (array_inv!2393 (_keys!5714 thiss!1248)) (bvsge (size!4026 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185307 d!55179))

(declare-fun d!55181 () Bool)

(assert (=> d!55181 (= (array_inv!2394 (_values!3760 thiss!1248)) (bvsge (size!4027 (_values!3760 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185307 d!55181))

(declare-fun d!55183 () Bool)

(declare-fun lt!91803 () SeekEntryResult!621)

(assert (=> d!55183 (and (or ((_ is Undefined!621) lt!91803) (not ((_ is Found!621) lt!91803)) (and (bvsge (index!4655 lt!91803) #b00000000000000000000000000000000) (bvslt (index!4655 lt!91803) (size!4026 (_keys!5714 thiss!1248))))) (or ((_ is Undefined!621) lt!91803) ((_ is Found!621) lt!91803) (not ((_ is MissingZero!621) lt!91803)) (and (bvsge (index!4654 lt!91803) #b00000000000000000000000000000000) (bvslt (index!4654 lt!91803) (size!4026 (_keys!5714 thiss!1248))))) (or ((_ is Undefined!621) lt!91803) ((_ is Found!621) lt!91803) ((_ is MissingZero!621) lt!91803) (not ((_ is MissingVacant!621) lt!91803)) (and (bvsge (index!4657 lt!91803) #b00000000000000000000000000000000) (bvslt (index!4657 lt!91803) (size!4026 (_keys!5714 thiss!1248))))) (or ((_ is Undefined!621) lt!91803) (ite ((_ is Found!621) lt!91803) (= (select (arr!3710 (_keys!5714 thiss!1248)) (index!4655 lt!91803)) key!828) (ite ((_ is MissingZero!621) lt!91803) (= (select (arr!3710 (_keys!5714 thiss!1248)) (index!4654 lt!91803)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!621) lt!91803) (= (select (arr!3710 (_keys!5714 thiss!1248)) (index!4657 lt!91803)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!122051 () SeekEntryResult!621)

(assert (=> d!55183 (= lt!91803 e!122051)))

(declare-fun c!33296 () Bool)

(declare-fun lt!91805 () SeekEntryResult!621)

(assert (=> d!55183 (= c!33296 (and ((_ is Intermediate!621) lt!91805) (undefined!1433 lt!91805)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7857 (_ BitVec 32)) SeekEntryResult!621)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55183 (= lt!91805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8880 thiss!1248)) key!828 (_keys!5714 thiss!1248) (mask!8880 thiss!1248)))))

(assert (=> d!55183 (validMask!0 (mask!8880 thiss!1248))))

(assert (=> d!55183 (= (seekEntryOrOpen!0 key!828 (_keys!5714 thiss!1248) (mask!8880 thiss!1248)) lt!91803)))

(declare-fun b!185490 () Bool)

(declare-fun e!122053 () SeekEntryResult!621)

(assert (=> b!185490 (= e!122051 e!122053)))

(declare-fun lt!91804 () (_ BitVec 64))

(assert (=> b!185490 (= lt!91804 (select (arr!3710 (_keys!5714 thiss!1248)) (index!4656 lt!91805)))))

(declare-fun c!33295 () Bool)

(assert (=> b!185490 (= c!33295 (= lt!91804 key!828))))

(declare-fun b!185491 () Bool)

(assert (=> b!185491 (= e!122051 Undefined!621)))

(declare-fun b!185492 () Bool)

(declare-fun c!33294 () Bool)

(assert (=> b!185492 (= c!33294 (= lt!91804 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!122052 () SeekEntryResult!621)

(assert (=> b!185492 (= e!122053 e!122052)))

(declare-fun b!185493 () Bool)

(assert (=> b!185493 (= e!122052 (MissingZero!621 (index!4656 lt!91805)))))

(declare-fun b!185494 () Bool)

(assert (=> b!185494 (= e!122053 (Found!621 (index!4656 lt!91805)))))

(declare-fun b!185495 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7857 (_ BitVec 32)) SeekEntryResult!621)

(assert (=> b!185495 (= e!122052 (seekKeyOrZeroReturnVacant!0 (x!20115 lt!91805) (index!4656 lt!91805) (index!4656 lt!91805) key!828 (_keys!5714 thiss!1248) (mask!8880 thiss!1248)))))

(assert (= (and d!55183 c!33296) b!185491))

(assert (= (and d!55183 (not c!33296)) b!185490))

(assert (= (and b!185490 c!33295) b!185494))

(assert (= (and b!185490 (not c!33295)) b!185492))

(assert (= (and b!185492 c!33294) b!185493))

(assert (= (and b!185492 (not c!33294)) b!185495))

(assert (=> d!55183 m!212739))

(declare-fun m!212863 () Bool)

(assert (=> d!55183 m!212863))

(assert (=> d!55183 m!212863))

(declare-fun m!212865 () Bool)

(assert (=> d!55183 m!212865))

(declare-fun m!212867 () Bool)

(assert (=> d!55183 m!212867))

(declare-fun m!212869 () Bool)

(assert (=> d!55183 m!212869))

(declare-fun m!212871 () Bool)

(assert (=> d!55183 m!212871))

(declare-fun m!212873 () Bool)

(assert (=> b!185490 m!212873))

(declare-fun m!212875 () Bool)

(assert (=> b!185495 m!212875))

(assert (=> b!185312 d!55183))

(declare-fun d!55185 () Bool)

(assert (=> d!55185 (= (validMask!0 (mask!8880 thiss!1248)) (and (or (= (mask!8880 thiss!1248) #b00000000000000000000000000000111) (= (mask!8880 thiss!1248) #b00000000000000000000000000001111) (= (mask!8880 thiss!1248) #b00000000000000000000000000011111) (= (mask!8880 thiss!1248) #b00000000000000000000000000111111) (= (mask!8880 thiss!1248) #b00000000000000000000000001111111) (= (mask!8880 thiss!1248) #b00000000000000000000000011111111) (= (mask!8880 thiss!1248) #b00000000000000000000000111111111) (= (mask!8880 thiss!1248) #b00000000000000000000001111111111) (= (mask!8880 thiss!1248) #b00000000000000000000011111111111) (= (mask!8880 thiss!1248) #b00000000000000000000111111111111) (= (mask!8880 thiss!1248) #b00000000000000000001111111111111) (= (mask!8880 thiss!1248) #b00000000000000000011111111111111) (= (mask!8880 thiss!1248) #b00000000000000000111111111111111) (= (mask!8880 thiss!1248) #b00000000000000001111111111111111) (= (mask!8880 thiss!1248) #b00000000000000011111111111111111) (= (mask!8880 thiss!1248) #b00000000000000111111111111111111) (= (mask!8880 thiss!1248) #b00000000000001111111111111111111) (= (mask!8880 thiss!1248) #b00000000000011111111111111111111) (= (mask!8880 thiss!1248) #b00000000000111111111111111111111) (= (mask!8880 thiss!1248) #b00000000001111111111111111111111) (= (mask!8880 thiss!1248) #b00000000011111111111111111111111) (= (mask!8880 thiss!1248) #b00000000111111111111111111111111) (= (mask!8880 thiss!1248) #b00000001111111111111111111111111) (= (mask!8880 thiss!1248) #b00000011111111111111111111111111) (= (mask!8880 thiss!1248) #b00000111111111111111111111111111) (= (mask!8880 thiss!1248) #b00001111111111111111111111111111) (= (mask!8880 thiss!1248) #b00011111111111111111111111111111) (= (mask!8880 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8880 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185311 d!55185))

(declare-fun d!55187 () Bool)

(declare-fun res!87745 () Bool)

(declare-fun e!122065 () Bool)

(assert (=> d!55187 (=> res!87745 e!122065)))

(assert (=> d!55187 (= res!87745 (bvsge #b00000000000000000000000000000000 (size!4026 (_keys!5714 thiss!1248))))))

(assert (=> d!55187 (= (arrayNoDuplicates!0 (_keys!5714 thiss!1248) #b00000000000000000000000000000000 Nil!2317) e!122065)))

(declare-fun b!185506 () Bool)

(declare-fun e!122063 () Bool)

(declare-fun contains!1278 (List!2320 (_ BitVec 64)) Bool)

(assert (=> b!185506 (= e!122063 (contains!1278 Nil!2317 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18697 () Bool)

(declare-fun call!18700 () Bool)

(declare-fun c!33299 () Bool)

(assert (=> bm!18697 (= call!18700 (arrayNoDuplicates!0 (_keys!5714 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33299 (Cons!2316 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000) Nil!2317) Nil!2317)))))

(declare-fun b!185507 () Bool)

(declare-fun e!122064 () Bool)

(declare-fun e!122062 () Bool)

(assert (=> b!185507 (= e!122064 e!122062)))

(assert (=> b!185507 (= c!33299 (validKeyInArray!0 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185508 () Bool)

(assert (=> b!185508 (= e!122062 call!18700)))

(declare-fun b!185509 () Bool)

(assert (=> b!185509 (= e!122062 call!18700)))

(declare-fun b!185510 () Bool)

(assert (=> b!185510 (= e!122065 e!122064)))

(declare-fun res!87746 () Bool)

(assert (=> b!185510 (=> (not res!87746) (not e!122064))))

(assert (=> b!185510 (= res!87746 (not e!122063))))

(declare-fun res!87744 () Bool)

(assert (=> b!185510 (=> (not res!87744) (not e!122063))))

(assert (=> b!185510 (= res!87744 (validKeyInArray!0 (select (arr!3710 (_keys!5714 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55187 (not res!87745)) b!185510))

(assert (= (and b!185510 res!87744) b!185506))

(assert (= (and b!185510 res!87746) b!185507))

(assert (= (and b!185507 c!33299) b!185508))

(assert (= (and b!185507 (not c!33299)) b!185509))

(assert (= (or b!185508 b!185509) bm!18697))

(assert (=> b!185506 m!212799))

(assert (=> b!185506 m!212799))

(declare-fun m!212877 () Bool)

(assert (=> b!185506 m!212877))

(assert (=> bm!18697 m!212799))

(declare-fun m!212879 () Bool)

(assert (=> bm!18697 m!212879))

(assert (=> b!185507 m!212799))

(assert (=> b!185507 m!212799))

(assert (=> b!185507 m!212847))

(assert (=> b!185510 m!212799))

(assert (=> b!185510 m!212799))

(assert (=> b!185510 m!212847))

(assert (=> b!185316 d!55187))

(declare-fun mapNonEmpty!7464 () Bool)

(declare-fun mapRes!7464 () Bool)

(declare-fun tp!16491 () Bool)

(declare-fun e!122070 () Bool)

(assert (=> mapNonEmpty!7464 (= mapRes!7464 (and tp!16491 e!122070))))

(declare-fun mapValue!7464 () ValueCell!1823)

(declare-fun mapRest!7464 () (Array (_ BitVec 32) ValueCell!1823))

(declare-fun mapKey!7464 () (_ BitVec 32))

(assert (=> mapNonEmpty!7464 (= mapRest!7455 (store mapRest!7464 mapKey!7464 mapValue!7464))))

(declare-fun condMapEmpty!7464 () Bool)

(declare-fun mapDefault!7464 () ValueCell!1823)

(assert (=> mapNonEmpty!7455 (= condMapEmpty!7464 (= mapRest!7455 ((as const (Array (_ BitVec 32) ValueCell!1823)) mapDefault!7464)))))

(declare-fun e!122071 () Bool)

(assert (=> mapNonEmpty!7455 (= tp!16475 (and e!122071 mapRes!7464))))

(declare-fun b!185517 () Bool)

(assert (=> b!185517 (= e!122070 tp_is_empty!4333)))

(declare-fun mapIsEmpty!7464 () Bool)

(assert (=> mapIsEmpty!7464 mapRes!7464))

(declare-fun b!185518 () Bool)

(assert (=> b!185518 (= e!122071 tp_is_empty!4333)))

(assert (= (and mapNonEmpty!7455 condMapEmpty!7464) mapIsEmpty!7464))

(assert (= (and mapNonEmpty!7455 (not condMapEmpty!7464)) mapNonEmpty!7464))

(assert (= (and mapNonEmpty!7464 ((_ is ValueCellFull!1823) mapValue!7464)) b!185517))

(assert (= (and mapNonEmpty!7455 ((_ is ValueCellFull!1823) mapDefault!7464)) b!185518))

(declare-fun m!212881 () Bool)

(assert (=> mapNonEmpty!7464 m!212881))

(declare-fun b_lambda!7271 () Bool)

(assert (= b_lambda!7269 (or (and b!185307 b_free!4561) b_lambda!7271)))

(check-sat (not bm!18691) (not b!185443) (not b!185506) (not b!185447) (not bm!18689) (not bm!18690) (not b!185436) (not bm!18697) (not mapNonEmpty!7464) (not b!185434) (not b_lambda!7271) (not b!185507) (not d!55171) (not b!185389) (not d!55183) (not b!185465) (not b!185477) (not b!185438) (not b!185451) (not b_next!4561) (not b!185510) (not d!55175) (not b!185448) (not bm!18688) (not b!185476) (not bm!18694) (not b!185464) (not b!185450) b_and!11179 (not b!185495) (not d!55173) (not b!185463) tp_is_empty!4333 (not b!185391))
(check-sat b_and!11179 (not b_next!4561))
