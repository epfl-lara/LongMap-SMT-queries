; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17808 () Bool)

(assert start!17808)

(declare-fun b!177849 () Bool)

(declare-fun b_free!4393 () Bool)

(declare-fun b_next!4393 () Bool)

(assert (=> b!177849 (= b_free!4393 (not b_next!4393))))

(declare-fun tp!15885 () Bool)

(declare-fun b_and!10915 () Bool)

(assert (=> b!177849 (= tp!15885 b_and!10915)))

(declare-fun b!177848 () Bool)

(declare-fun res!84279 () Bool)

(declare-fun e!117252 () Bool)

(assert (=> b!177848 (=> (not res!84279) (not e!117252))))

(declare-datatypes ((V!5201 0))(
  ( (V!5202 (val!2127 Int)) )
))
(declare-datatypes ((ValueCell!1739 0))(
  ( (ValueCellFull!1739 (v!4010 V!5201)) (EmptyCell!1739) )
))
(declare-datatypes ((array!7471 0))(
  ( (array!7472 (arr!3542 (Array (_ BitVec 32) (_ BitVec 64))) (size!3847 (_ BitVec 32))) )
))
(declare-datatypes ((array!7473 0))(
  ( (array!7474 (arr!3543 (Array (_ BitVec 32) ValueCell!1739)) (size!3848 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2386 0))(
  ( (LongMapFixedSize!2387 (defaultEntry!3659 Int) (mask!8607 (_ BitVec 32)) (extraKeys!3396 (_ BitVec 32)) (zeroValue!3500 V!5201) (minValue!3500 V!5201) (_size!1242 (_ BitVec 32)) (_keys!5531 array!7471) (_values!3642 array!7473) (_vacant!1242 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2386)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177848 (= res!84279 (validMask!0 (mask!8607 thiss!1248)))))

(declare-fun e!117254 () Bool)

(declare-fun e!117253 () Bool)

(declare-fun tp_is_empty!4165 () Bool)

(declare-fun array_inv!2291 (array!7471) Bool)

(declare-fun array_inv!2292 (array!7473) Bool)

(assert (=> b!177849 (= e!117253 (and tp!15885 tp_is_empty!4165 (array_inv!2291 (_keys!5531 thiss!1248)) (array_inv!2292 (_values!3642 thiss!1248)) e!117254))))

(declare-fun b!177850 () Bool)

(declare-fun res!84281 () Bool)

(assert (=> b!177850 (=> (not res!84281) (not e!117252))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!568 0))(
  ( (MissingZero!568 (index!4440 (_ BitVec 32))) (Found!568 (index!4441 (_ BitVec 32))) (Intermediate!568 (undefined!1380 Bool) (index!4442 (_ BitVec 32)) (x!19492 (_ BitVec 32))) (Undefined!568) (MissingVacant!568 (index!4443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7471 (_ BitVec 32)) SeekEntryResult!568)

(assert (=> b!177850 (= res!84281 ((_ is Undefined!568) (seekEntryOrOpen!0 key!828 (_keys!5531 thiss!1248) (mask!8607 thiss!1248))))))

(declare-fun b!177851 () Bool)

(declare-fun res!84283 () Bool)

(assert (=> b!177851 (=> (not res!84283) (not e!117252))))

(declare-datatypes ((tuple2!3264 0))(
  ( (tuple2!3265 (_1!1643 (_ BitVec 64)) (_2!1643 V!5201)) )
))
(declare-datatypes ((List!2233 0))(
  ( (Nil!2230) (Cons!2229 (h!2851 tuple2!3264) (t!7059 List!2233)) )
))
(declare-datatypes ((ListLongMap!2197 0))(
  ( (ListLongMap!2198 (toList!1114 List!2233)) )
))
(declare-fun contains!1193 (ListLongMap!2197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!769 (array!7471 array!7473 (_ BitVec 32) (_ BitVec 32) V!5201 V!5201 (_ BitVec 32) Int) ListLongMap!2197)

(assert (=> b!177851 (= res!84283 (not (contains!1193 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)) key!828)))))

(declare-fun b!177852 () Bool)

(declare-fun e!117256 () Bool)

(assert (=> b!177852 (= e!117256 tp_is_empty!4165)))

(declare-fun b!177853 () Bool)

(assert (=> b!177853 (= e!117252 (and (= (size!3848 (_values!3642 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8607 thiss!1248))) (not (= (size!3847 (_keys!5531 thiss!1248)) (size!3848 (_values!3642 thiss!1248))))))))

(declare-fun b!177854 () Bool)

(declare-fun e!117251 () Bool)

(assert (=> b!177854 (= e!117251 tp_is_empty!4165)))

(declare-fun res!84280 () Bool)

(assert (=> start!17808 (=> (not res!84280) (not e!117252))))

(declare-fun valid!1021 (LongMapFixedSize!2386) Bool)

(assert (=> start!17808 (= res!84280 (valid!1021 thiss!1248))))

(assert (=> start!17808 e!117252))

(assert (=> start!17808 e!117253))

(assert (=> start!17808 true))

(declare-fun mapNonEmpty!7117 () Bool)

(declare-fun mapRes!7117 () Bool)

(declare-fun tp!15886 () Bool)

(assert (=> mapNonEmpty!7117 (= mapRes!7117 (and tp!15886 e!117256))))

(declare-fun mapValue!7117 () ValueCell!1739)

(declare-fun mapKey!7117 () (_ BitVec 32))

(declare-fun mapRest!7117 () (Array (_ BitVec 32) ValueCell!1739))

(assert (=> mapNonEmpty!7117 (= (arr!3543 (_values!3642 thiss!1248)) (store mapRest!7117 mapKey!7117 mapValue!7117))))

(declare-fun b!177855 () Bool)

(declare-fun res!84282 () Bool)

(assert (=> b!177855 (=> (not res!84282) (not e!117252))))

(assert (=> b!177855 (= res!84282 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177856 () Bool)

(assert (=> b!177856 (= e!117254 (and e!117251 mapRes!7117))))

(declare-fun condMapEmpty!7117 () Bool)

(declare-fun mapDefault!7117 () ValueCell!1739)

(assert (=> b!177856 (= condMapEmpty!7117 (= (arr!3543 (_values!3642 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1739)) mapDefault!7117)))))

(declare-fun mapIsEmpty!7117 () Bool)

(assert (=> mapIsEmpty!7117 mapRes!7117))

(assert (= (and start!17808 res!84280) b!177855))

(assert (= (and b!177855 res!84282) b!177850))

(assert (= (and b!177850 res!84281) b!177851))

(assert (= (and b!177851 res!84283) b!177848))

(assert (= (and b!177848 res!84279) b!177853))

(assert (= (and b!177856 condMapEmpty!7117) mapIsEmpty!7117))

(assert (= (and b!177856 (not condMapEmpty!7117)) mapNonEmpty!7117))

(assert (= (and mapNonEmpty!7117 ((_ is ValueCellFull!1739) mapValue!7117)) b!177852))

(assert (= (and b!177856 ((_ is ValueCellFull!1739) mapDefault!7117)) b!177854))

(assert (= b!177849 b!177856))

(assert (= start!17808 b!177849))

(declare-fun m!206469 () Bool)

(assert (=> b!177851 m!206469))

(assert (=> b!177851 m!206469))

(declare-fun m!206471 () Bool)

(assert (=> b!177851 m!206471))

(declare-fun m!206473 () Bool)

(assert (=> b!177850 m!206473))

(declare-fun m!206475 () Bool)

(assert (=> b!177848 m!206475))

(declare-fun m!206477 () Bool)

(assert (=> b!177849 m!206477))

(declare-fun m!206479 () Bool)

(assert (=> b!177849 m!206479))

(declare-fun m!206481 () Bool)

(assert (=> mapNonEmpty!7117 m!206481))

(declare-fun m!206483 () Bool)

(assert (=> start!17808 m!206483))

(check-sat (not mapNonEmpty!7117) (not b!177851) (not start!17808) (not b!177849) (not b_next!4393) (not b!177850) (not b!177848) b_and!10915 tp_is_empty!4165)
(check-sat b_and!10915 (not b_next!4393))
(get-model)

(declare-fun d!53913 () Bool)

(declare-fun e!117297 () Bool)

(assert (=> d!53913 e!117297))

(declare-fun res!84316 () Bool)

(assert (=> d!53913 (=> res!84316 e!117297)))

(declare-fun lt!87937 () Bool)

(assert (=> d!53913 (= res!84316 (not lt!87937))))

(declare-fun lt!87938 () Bool)

(assert (=> d!53913 (= lt!87937 lt!87938)))

(declare-datatypes ((Unit!5431 0))(
  ( (Unit!5432) )
))
(declare-fun lt!87940 () Unit!5431)

(declare-fun e!117298 () Unit!5431)

(assert (=> d!53913 (= lt!87940 e!117298)))

(declare-fun c!31863 () Bool)

(assert (=> d!53913 (= c!31863 lt!87938)))

(declare-fun containsKey!201 (List!2233 (_ BitVec 64)) Bool)

(assert (=> d!53913 (= lt!87938 (containsKey!201 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(assert (=> d!53913 (= (contains!1193 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)) key!828) lt!87937)))

(declare-fun b!177917 () Bool)

(declare-fun lt!87939 () Unit!5431)

(assert (=> b!177917 (= e!117298 lt!87939)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!149 (List!2233 (_ BitVec 64)) Unit!5431)

(assert (=> b!177917 (= lt!87939 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(declare-datatypes ((Option!204 0))(
  ( (Some!203 (v!4013 V!5201)) (None!202) )
))
(declare-fun isDefined!150 (Option!204) Bool)

(declare-fun getValueByKey!198 (List!2233 (_ BitVec 64)) Option!204)

(assert (=> b!177917 (isDefined!150 (getValueByKey!198 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(declare-fun b!177918 () Bool)

(declare-fun Unit!5433 () Unit!5431)

(assert (=> b!177918 (= e!117298 Unit!5433)))

(declare-fun b!177919 () Bool)

(assert (=> b!177919 (= e!117297 (isDefined!150 (getValueByKey!198 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828)))))

(assert (= (and d!53913 c!31863) b!177917))

(assert (= (and d!53913 (not c!31863)) b!177918))

(assert (= (and d!53913 (not res!84316)) b!177919))

(declare-fun m!206517 () Bool)

(assert (=> d!53913 m!206517))

(declare-fun m!206519 () Bool)

(assert (=> b!177917 m!206519))

(declare-fun m!206521 () Bool)

(assert (=> b!177917 m!206521))

(assert (=> b!177917 m!206521))

(declare-fun m!206523 () Bool)

(assert (=> b!177917 m!206523))

(assert (=> b!177919 m!206521))

(assert (=> b!177919 m!206521))

(assert (=> b!177919 m!206523))

(assert (=> b!177851 d!53913))

(declare-fun bm!17977 () Bool)

(declare-fun call!17983 () Bool)

(declare-fun lt!87987 () ListLongMap!2197)

(assert (=> bm!17977 (= call!17983 (contains!1193 lt!87987 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177962 () Bool)

(declare-fun e!117334 () Bool)

(assert (=> b!177962 (= e!117334 (not call!17983))))

(declare-fun b!177963 () Bool)

(declare-fun e!117335 () Bool)

(assert (=> b!177963 (= e!117335 e!117334)))

(declare-fun c!31880 () Bool)

(assert (=> b!177963 (= c!31880 (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17978 () Bool)

(declare-fun call!17984 () ListLongMap!2197)

(declare-fun getCurrentListMapNoExtraKeys!173 (array!7471 array!7473 (_ BitVec 32) (_ BitVec 32) V!5201 V!5201 (_ BitVec 32) Int) ListLongMap!2197)

(assert (=> bm!17978 (= call!17984 (getCurrentListMapNoExtraKeys!173 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))

(declare-fun b!177964 () Bool)

(declare-fun e!117327 () Unit!5431)

(declare-fun Unit!5434 () Unit!5431)

(assert (=> b!177964 (= e!117327 Unit!5434)))

(declare-fun b!177965 () Bool)

(declare-fun e!117325 () ListLongMap!2197)

(declare-fun call!17981 () ListLongMap!2197)

(assert (=> b!177965 (= e!117325 call!17981)))

(declare-fun bm!17979 () Bool)

(declare-fun call!17980 () Bool)

(assert (=> bm!17979 (= call!17980 (contains!1193 lt!87987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177966 () Bool)

(declare-fun e!117336 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!177966 (= e!117336 (validKeyInArray!0 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177967 () Bool)

(declare-fun res!84339 () Bool)

(assert (=> b!177967 (=> (not res!84339) (not e!117335))))

(declare-fun e!117332 () Bool)

(assert (=> b!177967 (= res!84339 e!117332)))

(declare-fun res!84338 () Bool)

(assert (=> b!177967 (=> res!84338 e!117332)))

(assert (=> b!177967 (= res!84338 (not e!117336))))

(declare-fun res!84335 () Bool)

(assert (=> b!177967 (=> (not res!84335) (not e!117336))))

(assert (=> b!177967 (= res!84335 (bvslt #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun b!177968 () Bool)

(declare-fun e!117333 () Bool)

(declare-fun e!117329 () Bool)

(assert (=> b!177968 (= e!117333 e!117329)))

(declare-fun res!84340 () Bool)

(assert (=> b!177968 (= res!84340 call!17980)))

(assert (=> b!177968 (=> (not res!84340) (not e!117329))))

(declare-fun b!177969 () Bool)

(declare-fun e!117328 () ListLongMap!2197)

(assert (=> b!177969 (= e!117328 call!17981)))

(declare-fun call!17982 () ListLongMap!2197)

(declare-fun call!17986 () ListLongMap!2197)

(declare-fun c!31878 () Bool)

(declare-fun call!17985 () ListLongMap!2197)

(declare-fun bm!17980 () Bool)

(declare-fun c!31879 () Bool)

(declare-fun +!259 (ListLongMap!2197 tuple2!3264) ListLongMap!2197)

(assert (=> bm!17980 (= call!17985 (+!259 (ite c!31879 call!17984 (ite c!31878 call!17982 call!17986)) (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(declare-fun bm!17981 () Bool)

(assert (=> bm!17981 (= call!17981 call!17985)))

(declare-fun b!177970 () Bool)

(declare-fun c!31877 () Bool)

(assert (=> b!177970 (= c!31877 (and (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!177970 (= e!117328 e!117325)))

(declare-fun b!177971 () Bool)

(declare-fun apply!142 (ListLongMap!2197 (_ BitVec 64)) V!5201)

(assert (=> b!177971 (= e!117329 (= (apply!142 lt!87987 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3500 thiss!1248)))))

(declare-fun b!177972 () Bool)

(declare-fun res!84343 () Bool)

(assert (=> b!177972 (=> (not res!84343) (not e!117335))))

(assert (=> b!177972 (= res!84343 e!117333)))

(declare-fun c!31876 () Bool)

(assert (=> b!177972 (= c!31876 (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!177973 () Bool)

(declare-fun e!117331 () Bool)

(assert (=> b!177973 (= e!117334 e!117331)))

(declare-fun res!84342 () Bool)

(assert (=> b!177973 (= res!84342 call!17983)))

(assert (=> b!177973 (=> (not res!84342) (not e!117331))))

(declare-fun b!177974 () Bool)

(declare-fun e!117326 () Bool)

(declare-fun get!2032 (ValueCell!1739 V!5201) V!5201)

(declare-fun dynLambda!485 (Int (_ BitVec 64)) V!5201)

(assert (=> b!177974 (= e!117326 (= (apply!142 lt!87987 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)) (get!2032 (select (arr!3543 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177974 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3848 (_values!3642 thiss!1248))))))

(assert (=> b!177974 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun b!177975 () Bool)

(assert (=> b!177975 (= e!117333 (not call!17980))))

(declare-fun bm!17982 () Bool)

(assert (=> bm!17982 (= call!17986 call!17982)))

(declare-fun bm!17983 () Bool)

(assert (=> bm!17983 (= call!17982 call!17984)))

(declare-fun d!53915 () Bool)

(assert (=> d!53915 e!117335))

(declare-fun res!84341 () Bool)

(assert (=> d!53915 (=> (not res!84341) (not e!117335))))

(assert (=> d!53915 (= res!84341 (or (bvsge #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))))

(declare-fun lt!87991 () ListLongMap!2197)

(assert (=> d!53915 (= lt!87987 lt!87991)))

(declare-fun lt!87993 () Unit!5431)

(assert (=> d!53915 (= lt!87993 e!117327)))

(declare-fun c!31881 () Bool)

(declare-fun e!117337 () Bool)

(assert (=> d!53915 (= c!31881 e!117337)))

(declare-fun res!84337 () Bool)

(assert (=> d!53915 (=> (not res!84337) (not e!117337))))

(assert (=> d!53915 (= res!84337 (bvslt #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun e!117330 () ListLongMap!2197)

(assert (=> d!53915 (= lt!87991 e!117330)))

(assert (=> d!53915 (= c!31879 (and (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53915 (validMask!0 (mask!8607 thiss!1248))))

(assert (=> d!53915 (= (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)) lt!87987)))

(declare-fun b!177976 () Bool)

(assert (=> b!177976 (= e!117331 (= (apply!142 lt!87987 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3500 thiss!1248)))))

(declare-fun b!177977 () Bool)

(assert (=> b!177977 (= e!117330 (+!259 call!17985 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))

(declare-fun b!177978 () Bool)

(assert (=> b!177978 (= e!117325 call!17986)))

(declare-fun b!177979 () Bool)

(declare-fun lt!87996 () Unit!5431)

(assert (=> b!177979 (= e!117327 lt!87996)))

(declare-fun lt!87986 () ListLongMap!2197)

(assert (=> b!177979 (= lt!87986 (getCurrentListMapNoExtraKeys!173 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))

(declare-fun lt!88000 () (_ BitVec 64))

(assert (=> b!177979 (= lt!88000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87989 () (_ BitVec 64))

(assert (=> b!177979 (= lt!87989 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87998 () Unit!5431)

(declare-fun addStillContains!118 (ListLongMap!2197 (_ BitVec 64) V!5201 (_ BitVec 64)) Unit!5431)

(assert (=> b!177979 (= lt!87998 (addStillContains!118 lt!87986 lt!88000 (zeroValue!3500 thiss!1248) lt!87989))))

(assert (=> b!177979 (contains!1193 (+!259 lt!87986 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248))) lt!87989)))

(declare-fun lt!87988 () Unit!5431)

(assert (=> b!177979 (= lt!87988 lt!87998)))

(declare-fun lt!88002 () ListLongMap!2197)

(assert (=> b!177979 (= lt!88002 (getCurrentListMapNoExtraKeys!173 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))

(declare-fun lt!88006 () (_ BitVec 64))

(assert (=> b!177979 (= lt!88006 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87999 () (_ BitVec 64))

(assert (=> b!177979 (= lt!87999 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88003 () Unit!5431)

(declare-fun addApplyDifferent!118 (ListLongMap!2197 (_ BitVec 64) V!5201 (_ BitVec 64)) Unit!5431)

(assert (=> b!177979 (= lt!88003 (addApplyDifferent!118 lt!88002 lt!88006 (minValue!3500 thiss!1248) lt!87999))))

(assert (=> b!177979 (= (apply!142 (+!259 lt!88002 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248))) lt!87999) (apply!142 lt!88002 lt!87999))))

(declare-fun lt!88005 () Unit!5431)

(assert (=> b!177979 (= lt!88005 lt!88003)))

(declare-fun lt!87985 () ListLongMap!2197)

(assert (=> b!177979 (= lt!87985 (getCurrentListMapNoExtraKeys!173 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))

(declare-fun lt!88001 () (_ BitVec 64))

(assert (=> b!177979 (= lt!88001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87992 () (_ BitVec 64))

(assert (=> b!177979 (= lt!87992 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87995 () Unit!5431)

(assert (=> b!177979 (= lt!87995 (addApplyDifferent!118 lt!87985 lt!88001 (zeroValue!3500 thiss!1248) lt!87992))))

(assert (=> b!177979 (= (apply!142 (+!259 lt!87985 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248))) lt!87992) (apply!142 lt!87985 lt!87992))))

(declare-fun lt!87990 () Unit!5431)

(assert (=> b!177979 (= lt!87990 lt!87995)))

(declare-fun lt!87994 () ListLongMap!2197)

(assert (=> b!177979 (= lt!87994 (getCurrentListMapNoExtraKeys!173 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))

(declare-fun lt!87997 () (_ BitVec 64))

(assert (=> b!177979 (= lt!87997 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88004 () (_ BitVec 64))

(assert (=> b!177979 (= lt!88004 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177979 (= lt!87996 (addApplyDifferent!118 lt!87994 lt!87997 (minValue!3500 thiss!1248) lt!88004))))

(assert (=> b!177979 (= (apply!142 (+!259 lt!87994 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248))) lt!88004) (apply!142 lt!87994 lt!88004))))

(declare-fun b!177980 () Bool)

(assert (=> b!177980 (= e!117330 e!117328)))

(assert (=> b!177980 (= c!31878 (and (not (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3396 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177981 () Bool)

(assert (=> b!177981 (= e!117332 e!117326)))

(declare-fun res!84336 () Bool)

(assert (=> b!177981 (=> (not res!84336) (not e!117326))))

(assert (=> b!177981 (= res!84336 (contains!1193 lt!87987 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177981 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun b!177982 () Bool)

(assert (=> b!177982 (= e!117337 (validKeyInArray!0 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53915 c!31879) b!177977))

(assert (= (and d!53915 (not c!31879)) b!177980))

(assert (= (and b!177980 c!31878) b!177969))

(assert (= (and b!177980 (not c!31878)) b!177970))

(assert (= (and b!177970 c!31877) b!177965))

(assert (= (and b!177970 (not c!31877)) b!177978))

(assert (= (or b!177965 b!177978) bm!17982))

(assert (= (or b!177969 bm!17982) bm!17983))

(assert (= (or b!177969 b!177965) bm!17981))

(assert (= (or b!177977 bm!17983) bm!17978))

(assert (= (or b!177977 bm!17981) bm!17980))

(assert (= (and d!53915 res!84337) b!177982))

(assert (= (and d!53915 c!31881) b!177979))

(assert (= (and d!53915 (not c!31881)) b!177964))

(assert (= (and d!53915 res!84341) b!177967))

(assert (= (and b!177967 res!84335) b!177966))

(assert (= (and b!177967 (not res!84338)) b!177981))

(assert (= (and b!177981 res!84336) b!177974))

(assert (= (and b!177967 res!84339) b!177972))

(assert (= (and b!177972 c!31876) b!177968))

(assert (= (and b!177972 (not c!31876)) b!177975))

(assert (= (and b!177968 res!84340) b!177971))

(assert (= (or b!177968 b!177975) bm!17979))

(assert (= (and b!177972 res!84343) b!177963))

(assert (= (and b!177963 c!31880) b!177973))

(assert (= (and b!177963 (not c!31880)) b!177962))

(assert (= (and b!177973 res!84342) b!177976))

(assert (= (or b!177973 b!177962) bm!17977))

(declare-fun b_lambda!7089 () Bool)

(assert (=> (not b_lambda!7089) (not b!177974)))

(declare-fun t!7062 () Bool)

(declare-fun tb!2787 () Bool)

(assert (=> (and b!177849 (= (defaultEntry!3659 thiss!1248) (defaultEntry!3659 thiss!1248)) t!7062) tb!2787))

(declare-fun result!4651 () Bool)

(assert (=> tb!2787 (= result!4651 tp_is_empty!4165)))

(assert (=> b!177974 t!7062))

(declare-fun b_and!10921 () Bool)

(assert (= b_and!10915 (and (=> t!7062 result!4651) b_and!10921)))

(declare-fun m!206525 () Bool)

(assert (=> b!177974 m!206525))

(declare-fun m!206527 () Bool)

(assert (=> b!177974 m!206527))

(declare-fun m!206529 () Bool)

(assert (=> b!177974 m!206529))

(declare-fun m!206531 () Bool)

(assert (=> b!177974 m!206531))

(declare-fun m!206533 () Bool)

(assert (=> b!177974 m!206533))

(assert (=> b!177974 m!206531))

(assert (=> b!177974 m!206525))

(assert (=> b!177974 m!206527))

(declare-fun m!206535 () Bool)

(assert (=> b!177976 m!206535))

(assert (=> b!177981 m!206531))

(assert (=> b!177981 m!206531))

(declare-fun m!206537 () Bool)

(assert (=> b!177981 m!206537))

(declare-fun m!206539 () Bool)

(assert (=> b!177977 m!206539))

(declare-fun m!206541 () Bool)

(assert (=> b!177979 m!206541))

(declare-fun m!206543 () Bool)

(assert (=> b!177979 m!206543))

(declare-fun m!206545 () Bool)

(assert (=> b!177979 m!206545))

(declare-fun m!206547 () Bool)

(assert (=> b!177979 m!206547))

(declare-fun m!206549 () Bool)

(assert (=> b!177979 m!206549))

(declare-fun m!206551 () Bool)

(assert (=> b!177979 m!206551))

(assert (=> b!177979 m!206531))

(assert (=> b!177979 m!206551))

(declare-fun m!206553 () Bool)

(assert (=> b!177979 m!206553))

(declare-fun m!206555 () Bool)

(assert (=> b!177979 m!206555))

(declare-fun m!206557 () Bool)

(assert (=> b!177979 m!206557))

(declare-fun m!206559 () Bool)

(assert (=> b!177979 m!206559))

(assert (=> b!177979 m!206543))

(declare-fun m!206561 () Bool)

(assert (=> b!177979 m!206561))

(declare-fun m!206563 () Bool)

(assert (=> b!177979 m!206563))

(declare-fun m!206565 () Bool)

(assert (=> b!177979 m!206565))

(assert (=> b!177979 m!206561))

(declare-fun m!206567 () Bool)

(assert (=> b!177979 m!206567))

(declare-fun m!206569 () Bool)

(assert (=> b!177979 m!206569))

(assert (=> b!177979 m!206559))

(declare-fun m!206571 () Bool)

(assert (=> b!177979 m!206571))

(declare-fun m!206573 () Bool)

(assert (=> bm!17979 m!206573))

(assert (=> b!177982 m!206531))

(assert (=> b!177982 m!206531))

(declare-fun m!206575 () Bool)

(assert (=> b!177982 m!206575))

(assert (=> bm!17978 m!206555))

(declare-fun m!206577 () Bool)

(assert (=> b!177971 m!206577))

(declare-fun m!206579 () Bool)

(assert (=> bm!17980 m!206579))

(assert (=> b!177966 m!206531))

(assert (=> b!177966 m!206531))

(assert (=> b!177966 m!206575))

(assert (=> d!53915 m!206475))

(declare-fun m!206581 () Bool)

(assert (=> bm!17977 m!206581))

(assert (=> b!177851 d!53915))

(declare-fun b!177997 () Bool)

(declare-fun e!117346 () SeekEntryResult!568)

(declare-fun lt!88013 () SeekEntryResult!568)

(assert (=> b!177997 (= e!117346 (MissingZero!568 (index!4442 lt!88013)))))

(declare-fun b!177998 () Bool)

(declare-fun c!31889 () Bool)

(declare-fun lt!88015 () (_ BitVec 64))

(assert (=> b!177998 (= c!31889 (= lt!88015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!117345 () SeekEntryResult!568)

(assert (=> b!177998 (= e!117345 e!117346)))

(declare-fun b!178000 () Bool)

(declare-fun e!117344 () SeekEntryResult!568)

(assert (=> b!178000 (= e!117344 Undefined!568)))

(declare-fun b!178001 () Bool)

(assert (=> b!178001 (= e!117345 (Found!568 (index!4442 lt!88013)))))

(declare-fun b!178002 () Bool)

(assert (=> b!178002 (= e!117344 e!117345)))

(assert (=> b!178002 (= lt!88015 (select (arr!3542 (_keys!5531 thiss!1248)) (index!4442 lt!88013)))))

(declare-fun c!31888 () Bool)

(assert (=> b!178002 (= c!31888 (= lt!88015 key!828))))

(declare-fun b!177999 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7471 (_ BitVec 32)) SeekEntryResult!568)

(assert (=> b!177999 (= e!117346 (seekKeyOrZeroReturnVacant!0 (x!19492 lt!88013) (index!4442 lt!88013) (index!4442 lt!88013) key!828 (_keys!5531 thiss!1248) (mask!8607 thiss!1248)))))

(declare-fun d!53917 () Bool)

(declare-fun lt!88014 () SeekEntryResult!568)

(assert (=> d!53917 (and (or ((_ is Undefined!568) lt!88014) (not ((_ is Found!568) lt!88014)) (and (bvsge (index!4441 lt!88014) #b00000000000000000000000000000000) (bvslt (index!4441 lt!88014) (size!3847 (_keys!5531 thiss!1248))))) (or ((_ is Undefined!568) lt!88014) ((_ is Found!568) lt!88014) (not ((_ is MissingZero!568) lt!88014)) (and (bvsge (index!4440 lt!88014) #b00000000000000000000000000000000) (bvslt (index!4440 lt!88014) (size!3847 (_keys!5531 thiss!1248))))) (or ((_ is Undefined!568) lt!88014) ((_ is Found!568) lt!88014) ((_ is MissingZero!568) lt!88014) (not ((_ is MissingVacant!568) lt!88014)) (and (bvsge (index!4443 lt!88014) #b00000000000000000000000000000000) (bvslt (index!4443 lt!88014) (size!3847 (_keys!5531 thiss!1248))))) (or ((_ is Undefined!568) lt!88014) (ite ((_ is Found!568) lt!88014) (= (select (arr!3542 (_keys!5531 thiss!1248)) (index!4441 lt!88014)) key!828) (ite ((_ is MissingZero!568) lt!88014) (= (select (arr!3542 (_keys!5531 thiss!1248)) (index!4440 lt!88014)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!568) lt!88014) (= (select (arr!3542 (_keys!5531 thiss!1248)) (index!4443 lt!88014)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53917 (= lt!88014 e!117344)))

(declare-fun c!31890 () Bool)

(assert (=> d!53917 (= c!31890 (and ((_ is Intermediate!568) lt!88013) (undefined!1380 lt!88013)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7471 (_ BitVec 32)) SeekEntryResult!568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53917 (= lt!88013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8607 thiss!1248)) key!828 (_keys!5531 thiss!1248) (mask!8607 thiss!1248)))))

(assert (=> d!53917 (validMask!0 (mask!8607 thiss!1248))))

(assert (=> d!53917 (= (seekEntryOrOpen!0 key!828 (_keys!5531 thiss!1248) (mask!8607 thiss!1248)) lt!88014)))

(assert (= (and d!53917 c!31890) b!178000))

(assert (= (and d!53917 (not c!31890)) b!178002))

(assert (= (and b!178002 c!31888) b!178001))

(assert (= (and b!178002 (not c!31888)) b!177998))

(assert (= (and b!177998 c!31889) b!177997))

(assert (= (and b!177998 (not c!31889)) b!177999))

(declare-fun m!206583 () Bool)

(assert (=> b!178002 m!206583))

(declare-fun m!206585 () Bool)

(assert (=> b!177999 m!206585))

(assert (=> d!53917 m!206475))

(declare-fun m!206587 () Bool)

(assert (=> d!53917 m!206587))

(assert (=> d!53917 m!206587))

(declare-fun m!206589 () Bool)

(assert (=> d!53917 m!206589))

(declare-fun m!206591 () Bool)

(assert (=> d!53917 m!206591))

(declare-fun m!206593 () Bool)

(assert (=> d!53917 m!206593))

(declare-fun m!206595 () Bool)

(assert (=> d!53917 m!206595))

(assert (=> b!177850 d!53917))

(declare-fun d!53919 () Bool)

(assert (=> d!53919 (= (array_inv!2291 (_keys!5531 thiss!1248)) (bvsge (size!3847 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177849 d!53919))

(declare-fun d!53921 () Bool)

(assert (=> d!53921 (= (array_inv!2292 (_values!3642 thiss!1248)) (bvsge (size!3848 (_values!3642 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177849 d!53921))

(declare-fun d!53923 () Bool)

(assert (=> d!53923 (= (validMask!0 (mask!8607 thiss!1248)) (and (or (= (mask!8607 thiss!1248) #b00000000000000000000000000000111) (= (mask!8607 thiss!1248) #b00000000000000000000000000001111) (= (mask!8607 thiss!1248) #b00000000000000000000000000011111) (= (mask!8607 thiss!1248) #b00000000000000000000000000111111) (= (mask!8607 thiss!1248) #b00000000000000000000000001111111) (= (mask!8607 thiss!1248) #b00000000000000000000000011111111) (= (mask!8607 thiss!1248) #b00000000000000000000000111111111) (= (mask!8607 thiss!1248) #b00000000000000000000001111111111) (= (mask!8607 thiss!1248) #b00000000000000000000011111111111) (= (mask!8607 thiss!1248) #b00000000000000000000111111111111) (= (mask!8607 thiss!1248) #b00000000000000000001111111111111) (= (mask!8607 thiss!1248) #b00000000000000000011111111111111) (= (mask!8607 thiss!1248) #b00000000000000000111111111111111) (= (mask!8607 thiss!1248) #b00000000000000001111111111111111) (= (mask!8607 thiss!1248) #b00000000000000011111111111111111) (= (mask!8607 thiss!1248) #b00000000000000111111111111111111) (= (mask!8607 thiss!1248) #b00000000000001111111111111111111) (= (mask!8607 thiss!1248) #b00000000000011111111111111111111) (= (mask!8607 thiss!1248) #b00000000000111111111111111111111) (= (mask!8607 thiss!1248) #b00000000001111111111111111111111) (= (mask!8607 thiss!1248) #b00000000011111111111111111111111) (= (mask!8607 thiss!1248) #b00000000111111111111111111111111) (= (mask!8607 thiss!1248) #b00000001111111111111111111111111) (= (mask!8607 thiss!1248) #b00000011111111111111111111111111) (= (mask!8607 thiss!1248) #b00000111111111111111111111111111) (= (mask!8607 thiss!1248) #b00001111111111111111111111111111) (= (mask!8607 thiss!1248) #b00011111111111111111111111111111) (= (mask!8607 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8607 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!177848 d!53923))

(declare-fun d!53925 () Bool)

(declare-fun res!84350 () Bool)

(declare-fun e!117349 () Bool)

(assert (=> d!53925 (=> (not res!84350) (not e!117349))))

(declare-fun simpleValid!156 (LongMapFixedSize!2386) Bool)

(assert (=> d!53925 (= res!84350 (simpleValid!156 thiss!1248))))

(assert (=> d!53925 (= (valid!1021 thiss!1248) e!117349)))

(declare-fun b!178009 () Bool)

(declare-fun res!84351 () Bool)

(assert (=> b!178009 (=> (not res!84351) (not e!117349))))

(declare-fun arrayCountValidKeys!0 (array!7471 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178009 (= res!84351 (= (arrayCountValidKeys!0 (_keys!5531 thiss!1248) #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))) (_size!1242 thiss!1248)))))

(declare-fun b!178010 () Bool)

(declare-fun res!84352 () Bool)

(assert (=> b!178010 (=> (not res!84352) (not e!117349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7471 (_ BitVec 32)) Bool)

(assert (=> b!178010 (= res!84352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5531 thiss!1248) (mask!8607 thiss!1248)))))

(declare-fun b!178011 () Bool)

(declare-datatypes ((List!2235 0))(
  ( (Nil!2232) (Cons!2231 (h!2853 (_ BitVec 64)) (t!7063 List!2235)) )
))
(declare-fun arrayNoDuplicates!0 (array!7471 (_ BitVec 32) List!2235) Bool)

(assert (=> b!178011 (= e!117349 (arrayNoDuplicates!0 (_keys!5531 thiss!1248) #b00000000000000000000000000000000 Nil!2232))))

(assert (= (and d!53925 res!84350) b!178009))

(assert (= (and b!178009 res!84351) b!178010))

(assert (= (and b!178010 res!84352) b!178011))

(declare-fun m!206597 () Bool)

(assert (=> d!53925 m!206597))

(declare-fun m!206599 () Bool)

(assert (=> b!178009 m!206599))

(declare-fun m!206601 () Bool)

(assert (=> b!178010 m!206601))

(declare-fun m!206603 () Bool)

(assert (=> b!178011 m!206603))

(assert (=> start!17808 d!53925))

(declare-fun condMapEmpty!7126 () Bool)

(declare-fun mapDefault!7126 () ValueCell!1739)

(assert (=> mapNonEmpty!7117 (= condMapEmpty!7126 (= mapRest!7117 ((as const (Array (_ BitVec 32) ValueCell!1739)) mapDefault!7126)))))

(declare-fun e!117355 () Bool)

(declare-fun mapRes!7126 () Bool)

(assert (=> mapNonEmpty!7117 (= tp!15886 (and e!117355 mapRes!7126))))

(declare-fun mapNonEmpty!7126 () Bool)

(declare-fun tp!15901 () Bool)

(declare-fun e!117354 () Bool)

(assert (=> mapNonEmpty!7126 (= mapRes!7126 (and tp!15901 e!117354))))

(declare-fun mapKey!7126 () (_ BitVec 32))

(declare-fun mapRest!7126 () (Array (_ BitVec 32) ValueCell!1739))

(declare-fun mapValue!7126 () ValueCell!1739)

(assert (=> mapNonEmpty!7126 (= mapRest!7117 (store mapRest!7126 mapKey!7126 mapValue!7126))))

(declare-fun b!178019 () Bool)

(assert (=> b!178019 (= e!117355 tp_is_empty!4165)))

(declare-fun mapIsEmpty!7126 () Bool)

(assert (=> mapIsEmpty!7126 mapRes!7126))

(declare-fun b!178018 () Bool)

(assert (=> b!178018 (= e!117354 tp_is_empty!4165)))

(assert (= (and mapNonEmpty!7117 condMapEmpty!7126) mapIsEmpty!7126))

(assert (= (and mapNonEmpty!7117 (not condMapEmpty!7126)) mapNonEmpty!7126))

(assert (= (and mapNonEmpty!7126 ((_ is ValueCellFull!1739) mapValue!7126)) b!178018))

(assert (= (and mapNonEmpty!7117 ((_ is ValueCellFull!1739) mapDefault!7126)) b!178019))

(declare-fun m!206605 () Bool)

(assert (=> mapNonEmpty!7126 m!206605))

(declare-fun b_lambda!7091 () Bool)

(assert (= b_lambda!7089 (or (and b!177849 b_free!4393) b_lambda!7091)))

(check-sat (not b!177979) (not b!177999) (not b!178011) (not b_next!4393) (not d!53913) (not b!177977) (not mapNonEmpty!7126) (not b!178009) (not d!53917) (not d!53915) tp_is_empty!4165 (not b!177976) (not bm!17980) (not b!177966) (not b!177974) (not bm!17979) (not b!177981) (not bm!17977) (not bm!17978) (not b!177917) (not b!178010) (not b!177971) (not b_lambda!7091) (not d!53925) b_and!10921 (not b!177982) (not b!177919))
(check-sat b_and!10921 (not b_next!4393))
(get-model)

(declare-fun b!178030 () Bool)

(declare-fun e!117365 () Bool)

(declare-fun contains!1195 (List!2235 (_ BitVec 64)) Bool)

(assert (=> b!178030 (= e!117365 (contains!1195 Nil!2232 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17986 () Bool)

(declare-fun call!17989 () Bool)

(declare-fun c!31893 () Bool)

(assert (=> bm!17986 (= call!17989 (arrayNoDuplicates!0 (_keys!5531 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31893 (Cons!2231 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000) Nil!2232) Nil!2232)))))

(declare-fun d!53927 () Bool)

(declare-fun res!84361 () Bool)

(declare-fun e!117367 () Bool)

(assert (=> d!53927 (=> res!84361 e!117367)))

(assert (=> d!53927 (= res!84361 (bvsge #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(assert (=> d!53927 (= (arrayNoDuplicates!0 (_keys!5531 thiss!1248) #b00000000000000000000000000000000 Nil!2232) e!117367)))

(declare-fun b!178031 () Bool)

(declare-fun e!117366 () Bool)

(assert (=> b!178031 (= e!117366 call!17989)))

(declare-fun b!178032 () Bool)

(assert (=> b!178032 (= e!117366 call!17989)))

(declare-fun b!178033 () Bool)

(declare-fun e!117364 () Bool)

(assert (=> b!178033 (= e!117364 e!117366)))

(assert (=> b!178033 (= c!31893 (validKeyInArray!0 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178034 () Bool)

(assert (=> b!178034 (= e!117367 e!117364)))

(declare-fun res!84360 () Bool)

(assert (=> b!178034 (=> (not res!84360) (not e!117364))))

(assert (=> b!178034 (= res!84360 (not e!117365))))

(declare-fun res!84359 () Bool)

(assert (=> b!178034 (=> (not res!84359) (not e!117365))))

(assert (=> b!178034 (= res!84359 (validKeyInArray!0 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53927 (not res!84361)) b!178034))

(assert (= (and b!178034 res!84359) b!178030))

(assert (= (and b!178034 res!84360) b!178033))

(assert (= (and b!178033 c!31893) b!178032))

(assert (= (and b!178033 (not c!31893)) b!178031))

(assert (= (or b!178032 b!178031) bm!17986))

(assert (=> b!178030 m!206531))

(assert (=> b!178030 m!206531))

(declare-fun m!206607 () Bool)

(assert (=> b!178030 m!206607))

(assert (=> bm!17986 m!206531))

(declare-fun m!206609 () Bool)

(assert (=> bm!17986 m!206609))

(assert (=> b!178033 m!206531))

(assert (=> b!178033 m!206531))

(assert (=> b!178033 m!206575))

(assert (=> b!178034 m!206531))

(assert (=> b!178034 m!206531))

(assert (=> b!178034 m!206575))

(assert (=> b!178011 d!53927))

(declare-fun d!53929 () Bool)

(declare-fun isEmpty!455 (Option!204) Bool)

(assert (=> d!53929 (= (isDefined!150 (getValueByKey!198 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828)) (not (isEmpty!455 (getValueByKey!198 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))))

(declare-fun bs!7326 () Bool)

(assert (= bs!7326 d!53929))

(assert (=> bs!7326 m!206521))

(declare-fun m!206611 () Bool)

(assert (=> bs!7326 m!206611))

(assert (=> b!177919 d!53929))

(declare-fun b!178044 () Bool)

(declare-fun e!117372 () Option!204)

(declare-fun e!117373 () Option!204)

(assert (=> b!178044 (= e!117372 e!117373)))

(declare-fun c!31899 () Bool)

(assert (=> b!178044 (= c!31899 (and ((_ is Cons!2229) (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) (not (= (_1!1643 (h!2851 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) key!828))))))

(declare-fun b!178043 () Bool)

(assert (=> b!178043 (= e!117372 (Some!203 (_2!1643 (h!2851 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))))))

(declare-fun b!178046 () Bool)

(assert (=> b!178046 (= e!117373 None!202)))

(declare-fun d!53931 () Bool)

(declare-fun c!31898 () Bool)

(assert (=> d!53931 (= c!31898 (and ((_ is Cons!2229) (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) (= (_1!1643 (h!2851 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) key!828)))))

(assert (=> d!53931 (= (getValueByKey!198 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828) e!117372)))

(declare-fun b!178045 () Bool)

(assert (=> b!178045 (= e!117373 (getValueByKey!198 (t!7059 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) key!828))))

(assert (= (and d!53931 c!31898) b!178043))

(assert (= (and d!53931 (not c!31898)) b!178044))

(assert (= (and b!178044 c!31899) b!178045))

(assert (= (and b!178044 (not c!31899)) b!178046))

(declare-fun m!206613 () Bool)

(assert (=> b!178045 m!206613))

(assert (=> b!177919 d!53931))

(declare-fun b!178055 () Bool)

(declare-fun e!117382 () Bool)

(declare-fun e!117381 () Bool)

(assert (=> b!178055 (= e!117382 e!117381)))

(declare-fun c!31902 () Bool)

(assert (=> b!178055 (= c!31902 (validKeyInArray!0 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53933 () Bool)

(declare-fun res!84367 () Bool)

(assert (=> d!53933 (=> res!84367 e!117382)))

(assert (=> d!53933 (= res!84367 (bvsge #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(assert (=> d!53933 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5531 thiss!1248) (mask!8607 thiss!1248)) e!117382)))

(declare-fun b!178056 () Bool)

(declare-fun e!117380 () Bool)

(assert (=> b!178056 (= e!117381 e!117380)))

(declare-fun lt!88024 () (_ BitVec 64))

(assert (=> b!178056 (= lt!88024 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88022 () Unit!5431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7471 (_ BitVec 64) (_ BitVec 32)) Unit!5431)

(assert (=> b!178056 (= lt!88022 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5531 thiss!1248) lt!88024 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!178056 (arrayContainsKey!0 (_keys!5531 thiss!1248) lt!88024 #b00000000000000000000000000000000)))

(declare-fun lt!88023 () Unit!5431)

(assert (=> b!178056 (= lt!88023 lt!88022)))

(declare-fun res!84366 () Bool)

(assert (=> b!178056 (= res!84366 (= (seekEntryOrOpen!0 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000) (_keys!5531 thiss!1248) (mask!8607 thiss!1248)) (Found!568 #b00000000000000000000000000000000)))))

(assert (=> b!178056 (=> (not res!84366) (not e!117380))))

(declare-fun b!178057 () Bool)

(declare-fun call!17992 () Bool)

(assert (=> b!178057 (= e!117380 call!17992)))

(declare-fun b!178058 () Bool)

(assert (=> b!178058 (= e!117381 call!17992)))

(declare-fun bm!17989 () Bool)

(assert (=> bm!17989 (= call!17992 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5531 thiss!1248) (mask!8607 thiss!1248)))))

(assert (= (and d!53933 (not res!84367)) b!178055))

(assert (= (and b!178055 c!31902) b!178056))

(assert (= (and b!178055 (not c!31902)) b!178058))

(assert (= (and b!178056 res!84366) b!178057))

(assert (= (or b!178057 b!178058) bm!17989))

(assert (=> b!178055 m!206531))

(assert (=> b!178055 m!206531))

(assert (=> b!178055 m!206575))

(assert (=> b!178056 m!206531))

(declare-fun m!206615 () Bool)

(assert (=> b!178056 m!206615))

(declare-fun m!206617 () Bool)

(assert (=> b!178056 m!206617))

(assert (=> b!178056 m!206531))

(declare-fun m!206619 () Bool)

(assert (=> b!178056 m!206619))

(declare-fun m!206621 () Bool)

(assert (=> bm!17989 m!206621))

(assert (=> b!178010 d!53933))

(assert (=> d!53915 d!53923))

(declare-fun d!53935 () Bool)

(assert (=> d!53935 (= (validKeyInArray!0 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177966 d!53935))

(declare-fun b!178077 () Bool)

(declare-fun e!117395 () SeekEntryResult!568)

(declare-fun e!117394 () SeekEntryResult!568)

(assert (=> b!178077 (= e!117395 e!117394)))

(declare-fun c!31909 () Bool)

(declare-fun lt!88029 () (_ BitVec 64))

(assert (=> b!178077 (= c!31909 (or (= lt!88029 key!828) (= (bvadd lt!88029 lt!88029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!53937 () Bool)

(declare-fun e!117396 () Bool)

(assert (=> d!53937 e!117396))

(declare-fun c!31911 () Bool)

(declare-fun lt!88030 () SeekEntryResult!568)

(assert (=> d!53937 (= c!31911 (and ((_ is Intermediate!568) lt!88030) (undefined!1380 lt!88030)))))

(assert (=> d!53937 (= lt!88030 e!117395)))

(declare-fun c!31910 () Bool)

(assert (=> d!53937 (= c!31910 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53937 (= lt!88029 (select (arr!3542 (_keys!5531 thiss!1248)) (toIndex!0 key!828 (mask!8607 thiss!1248))))))

(assert (=> d!53937 (validMask!0 (mask!8607 thiss!1248))))

(assert (=> d!53937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8607 thiss!1248)) key!828 (_keys!5531 thiss!1248) (mask!8607 thiss!1248)) lt!88030)))

(declare-fun b!178078 () Bool)

(declare-fun e!117397 () Bool)

(assert (=> b!178078 (= e!117396 e!117397)))

(declare-fun res!84376 () Bool)

(assert (=> b!178078 (= res!84376 (and ((_ is Intermediate!568) lt!88030) (not (undefined!1380 lt!88030)) (bvslt (x!19492 lt!88030) #b01111111111111111111111111111110) (bvsge (x!19492 lt!88030) #b00000000000000000000000000000000) (bvsge (x!19492 lt!88030) #b00000000000000000000000000000000)))))

(assert (=> b!178078 (=> (not res!84376) (not e!117397))))

(declare-fun b!178079 () Bool)

(assert (=> b!178079 (and (bvsge (index!4442 lt!88030) #b00000000000000000000000000000000) (bvslt (index!4442 lt!88030) (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun e!117393 () Bool)

(assert (=> b!178079 (= e!117393 (= (select (arr!3542 (_keys!5531 thiss!1248)) (index!4442 lt!88030)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178080 () Bool)

(assert (=> b!178080 (= e!117394 (Intermediate!568 false (toIndex!0 key!828 (mask!8607 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178081 () Bool)

(assert (=> b!178081 (= e!117395 (Intermediate!568 true (toIndex!0 key!828 (mask!8607 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178082 () Bool)

(assert (=> b!178082 (= e!117396 (bvsge (x!19492 lt!88030) #b01111111111111111111111111111110))))

(declare-fun b!178083 () Bool)

(assert (=> b!178083 (and (bvsge (index!4442 lt!88030) #b00000000000000000000000000000000) (bvslt (index!4442 lt!88030) (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun res!84374 () Bool)

(assert (=> b!178083 (= res!84374 (= (select (arr!3542 (_keys!5531 thiss!1248)) (index!4442 lt!88030)) key!828))))

(assert (=> b!178083 (=> res!84374 e!117393)))

(assert (=> b!178083 (= e!117397 e!117393)))

(declare-fun b!178084 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178084 (= e!117394 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8607 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8607 thiss!1248)) key!828 (_keys!5531 thiss!1248) (mask!8607 thiss!1248)))))

(declare-fun b!178085 () Bool)

(assert (=> b!178085 (and (bvsge (index!4442 lt!88030) #b00000000000000000000000000000000) (bvslt (index!4442 lt!88030) (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun res!84375 () Bool)

(assert (=> b!178085 (= res!84375 (= (select (arr!3542 (_keys!5531 thiss!1248)) (index!4442 lt!88030)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178085 (=> res!84375 e!117393)))

(assert (= (and d!53937 c!31910) b!178081))

(assert (= (and d!53937 (not c!31910)) b!178077))

(assert (= (and b!178077 c!31909) b!178080))

(assert (= (and b!178077 (not c!31909)) b!178084))

(assert (= (and d!53937 c!31911) b!178082))

(assert (= (and d!53937 (not c!31911)) b!178078))

(assert (= (and b!178078 res!84376) b!178083))

(assert (= (and b!178083 (not res!84374)) b!178085))

(assert (= (and b!178085 (not res!84375)) b!178079))

(declare-fun m!206623 () Bool)

(assert (=> b!178083 m!206623))

(assert (=> d!53937 m!206587))

(declare-fun m!206625 () Bool)

(assert (=> d!53937 m!206625))

(assert (=> d!53937 m!206475))

(assert (=> b!178085 m!206623))

(assert (=> b!178084 m!206587))

(declare-fun m!206627 () Bool)

(assert (=> b!178084 m!206627))

(assert (=> b!178084 m!206627))

(declare-fun m!206629 () Bool)

(assert (=> b!178084 m!206629))

(assert (=> b!178079 m!206623))

(assert (=> d!53917 d!53937))

(declare-fun d!53939 () Bool)

(declare-fun lt!88036 () (_ BitVec 32))

(declare-fun lt!88035 () (_ BitVec 32))

(assert (=> d!53939 (= lt!88036 (bvmul (bvxor lt!88035 (bvlshr lt!88035 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53939 (= lt!88035 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53939 (and (bvsge (mask!8607 thiss!1248) #b00000000000000000000000000000000) (let ((res!84377 (let ((h!2854 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19508 (bvmul (bvxor h!2854 (bvlshr h!2854 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19508 (bvlshr x!19508 #b00000000000000000000000000001101)) (mask!8607 thiss!1248)))))) (and (bvslt res!84377 (bvadd (mask!8607 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84377 #b00000000000000000000000000000000))))))

(assert (=> d!53939 (= (toIndex!0 key!828 (mask!8607 thiss!1248)) (bvand (bvxor lt!88036 (bvlshr lt!88036 #b00000000000000000000000000001101)) (mask!8607 thiss!1248)))))

(assert (=> d!53917 d!53939))

(assert (=> d!53917 d!53923))

(declare-fun bm!17992 () Bool)

(declare-fun call!17995 () (_ BitVec 32))

(assert (=> bm!17992 (= call!17995 (arrayCountValidKeys!0 (_keys!5531 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun b!178094 () Bool)

(declare-fun e!117403 () (_ BitVec 32))

(assert (=> b!178094 (= e!117403 (bvadd #b00000000000000000000000000000001 call!17995))))

(declare-fun d!53941 () Bool)

(declare-fun lt!88039 () (_ BitVec 32))

(assert (=> d!53941 (and (bvsge lt!88039 #b00000000000000000000000000000000) (bvsle lt!88039 (bvsub (size!3847 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117402 () (_ BitVec 32))

(assert (=> d!53941 (= lt!88039 e!117402)))

(declare-fun c!31916 () Bool)

(assert (=> d!53941 (= c!31916 (bvsge #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(assert (=> d!53941 (and (bvsle #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3847 (_keys!5531 thiss!1248)) (size!3847 (_keys!5531 thiss!1248))))))

(assert (=> d!53941 (= (arrayCountValidKeys!0 (_keys!5531 thiss!1248) #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))) lt!88039)))

(declare-fun b!178095 () Bool)

(assert (=> b!178095 (= e!117403 call!17995)))

(declare-fun b!178096 () Bool)

(assert (=> b!178096 (= e!117402 #b00000000000000000000000000000000)))

(declare-fun b!178097 () Bool)

(assert (=> b!178097 (= e!117402 e!117403)))

(declare-fun c!31917 () Bool)

(assert (=> b!178097 (= c!31917 (validKeyInArray!0 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53941 c!31916) b!178096))

(assert (= (and d!53941 (not c!31916)) b!178097))

(assert (= (and b!178097 c!31917) b!178094))

(assert (= (and b!178097 (not c!31917)) b!178095))

(assert (= (or b!178094 b!178095) bm!17992))

(declare-fun m!206631 () Bool)

(assert (=> bm!17992 m!206631))

(assert (=> b!178097 m!206531))

(assert (=> b!178097 m!206531))

(assert (=> b!178097 m!206575))

(assert (=> b!178009 d!53941))

(declare-fun d!53943 () Bool)

(declare-fun get!2033 (Option!204) V!5201)

(assert (=> d!53943 (= (apply!142 lt!87987 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)) (get!2033 (getValueByKey!198 (toList!1114 lt!87987) (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7327 () Bool)

(assert (= bs!7327 d!53943))

(assert (=> bs!7327 m!206531))

(declare-fun m!206633 () Bool)

(assert (=> bs!7327 m!206633))

(assert (=> bs!7327 m!206633))

(declare-fun m!206635 () Bool)

(assert (=> bs!7327 m!206635))

(assert (=> b!177974 d!53943))

(declare-fun d!53945 () Bool)

(declare-fun c!31920 () Bool)

(assert (=> d!53945 (= c!31920 ((_ is ValueCellFull!1739) (select (arr!3543 (_values!3642 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117406 () V!5201)

(assert (=> d!53945 (= (get!2032 (select (arr!3543 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117406)))

(declare-fun b!178102 () Bool)

(declare-fun get!2034 (ValueCell!1739 V!5201) V!5201)

(assert (=> b!178102 (= e!117406 (get!2034 (select (arr!3543 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178103 () Bool)

(declare-fun get!2035 (ValueCell!1739 V!5201) V!5201)

(assert (=> b!178103 (= e!117406 (get!2035 (select (arr!3543 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53945 c!31920) b!178102))

(assert (= (and d!53945 (not c!31920)) b!178103))

(assert (=> b!178102 m!206525))

(assert (=> b!178102 m!206527))

(declare-fun m!206637 () Bool)

(assert (=> b!178102 m!206637))

(assert (=> b!178103 m!206525))

(assert (=> b!178103 m!206527))

(declare-fun m!206639 () Bool)

(assert (=> b!178103 m!206639))

(assert (=> b!177974 d!53945))

(declare-fun d!53947 () Bool)

(declare-fun e!117407 () Bool)

(assert (=> d!53947 e!117407))

(declare-fun res!84378 () Bool)

(assert (=> d!53947 (=> res!84378 e!117407)))

(declare-fun lt!88040 () Bool)

(assert (=> d!53947 (= res!84378 (not lt!88040))))

(declare-fun lt!88041 () Bool)

(assert (=> d!53947 (= lt!88040 lt!88041)))

(declare-fun lt!88043 () Unit!5431)

(declare-fun e!117408 () Unit!5431)

(assert (=> d!53947 (= lt!88043 e!117408)))

(declare-fun c!31921 () Bool)

(assert (=> d!53947 (= c!31921 lt!88041)))

(assert (=> d!53947 (= lt!88041 (containsKey!201 (toList!1114 lt!87987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53947 (= (contains!1193 lt!87987 #b0000000000000000000000000000000000000000000000000000000000000000) lt!88040)))

(declare-fun b!178104 () Bool)

(declare-fun lt!88042 () Unit!5431)

(assert (=> b!178104 (= e!117408 lt!88042)))

(assert (=> b!178104 (= lt!88042 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1114 lt!87987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178104 (isDefined!150 (getValueByKey!198 (toList!1114 lt!87987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178105 () Bool)

(declare-fun Unit!5435 () Unit!5431)

(assert (=> b!178105 (= e!117408 Unit!5435)))

(declare-fun b!178106 () Bool)

(assert (=> b!178106 (= e!117407 (isDefined!150 (getValueByKey!198 (toList!1114 lt!87987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53947 c!31921) b!178104))

(assert (= (and d!53947 (not c!31921)) b!178105))

(assert (= (and d!53947 (not res!84378)) b!178106))

(declare-fun m!206641 () Bool)

(assert (=> d!53947 m!206641))

(declare-fun m!206643 () Bool)

(assert (=> b!178104 m!206643))

(declare-fun m!206645 () Bool)

(assert (=> b!178104 m!206645))

(assert (=> b!178104 m!206645))

(declare-fun m!206647 () Bool)

(assert (=> b!178104 m!206647))

(assert (=> b!178106 m!206645))

(assert (=> b!178106 m!206645))

(assert (=> b!178106 m!206647))

(assert (=> bm!17979 d!53947))

(declare-fun d!53949 () Bool)

(assert (=> d!53949 (isDefined!150 (getValueByKey!198 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(declare-fun lt!88046 () Unit!5431)

(declare-fun choose!956 (List!2233 (_ BitVec 64)) Unit!5431)

(assert (=> d!53949 (= lt!88046 (choose!956 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(declare-fun e!117411 () Bool)

(assert (=> d!53949 e!117411))

(declare-fun res!84381 () Bool)

(assert (=> d!53949 (=> (not res!84381) (not e!117411))))

(declare-fun isStrictlySorted!325 (List!2233) Bool)

(assert (=> d!53949 (= res!84381 (isStrictlySorted!325 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))))))

(assert (=> d!53949 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828) lt!88046)))

(declare-fun b!178109 () Bool)

(assert (=> b!178109 (= e!117411 (containsKey!201 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828))))

(assert (= (and d!53949 res!84381) b!178109))

(assert (=> d!53949 m!206521))

(assert (=> d!53949 m!206521))

(assert (=> d!53949 m!206523))

(declare-fun m!206649 () Bool)

(assert (=> d!53949 m!206649))

(declare-fun m!206651 () Bool)

(assert (=> d!53949 m!206651))

(assert (=> b!178109 m!206517))

(assert (=> b!177917 d!53949))

(assert (=> b!177917 d!53929))

(assert (=> b!177917 d!53931))

(declare-fun b!178120 () Bool)

(declare-fun res!84390 () Bool)

(declare-fun e!117414 () Bool)

(assert (=> b!178120 (=> (not res!84390) (not e!117414))))

(declare-fun size!3853 (LongMapFixedSize!2386) (_ BitVec 32))

(assert (=> b!178120 (= res!84390 (= (size!3853 thiss!1248) (bvadd (_size!1242 thiss!1248) (bvsdiv (bvadd (extraKeys!3396 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!178119 () Bool)

(declare-fun res!84393 () Bool)

(assert (=> b!178119 (=> (not res!84393) (not e!117414))))

(assert (=> b!178119 (= res!84393 (bvsge (size!3853 thiss!1248) (_size!1242 thiss!1248)))))

(declare-fun b!178118 () Bool)

(declare-fun res!84392 () Bool)

(assert (=> b!178118 (=> (not res!84392) (not e!117414))))

(assert (=> b!178118 (= res!84392 (and (= (size!3848 (_values!3642 thiss!1248)) (bvadd (mask!8607 thiss!1248) #b00000000000000000000000000000001)) (= (size!3847 (_keys!5531 thiss!1248)) (size!3848 (_values!3642 thiss!1248))) (bvsge (_size!1242 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1242 thiss!1248) (bvadd (mask!8607 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!53951 () Bool)

(declare-fun res!84391 () Bool)

(assert (=> d!53951 (=> (not res!84391) (not e!117414))))

(assert (=> d!53951 (= res!84391 (validMask!0 (mask!8607 thiss!1248)))))

(assert (=> d!53951 (= (simpleValid!156 thiss!1248) e!117414)))

(declare-fun b!178121 () Bool)

(assert (=> b!178121 (= e!117414 (and (bvsge (extraKeys!3396 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3396 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1242 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!53951 res!84391) b!178118))

(assert (= (and b!178118 res!84392) b!178119))

(assert (= (and b!178119 res!84393) b!178120))

(assert (= (and b!178120 res!84390) b!178121))

(declare-fun m!206653 () Bool)

(assert (=> b!178120 m!206653))

(assert (=> b!178119 m!206653))

(assert (=> d!53951 m!206475))

(assert (=> d!53925 d!53951))

(assert (=> b!177982 d!53935))

(declare-fun d!53953 () Bool)

(declare-fun e!117415 () Bool)

(assert (=> d!53953 e!117415))

(declare-fun res!84394 () Bool)

(assert (=> d!53953 (=> res!84394 e!117415)))

(declare-fun lt!88047 () Bool)

(assert (=> d!53953 (= res!84394 (not lt!88047))))

(declare-fun lt!88048 () Bool)

(assert (=> d!53953 (= lt!88047 lt!88048)))

(declare-fun lt!88050 () Unit!5431)

(declare-fun e!117416 () Unit!5431)

(assert (=> d!53953 (= lt!88050 e!117416)))

(declare-fun c!31922 () Bool)

(assert (=> d!53953 (= c!31922 lt!88048)))

(assert (=> d!53953 (= lt!88048 (containsKey!201 (toList!1114 lt!87987) (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53953 (= (contains!1193 lt!87987 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)) lt!88047)))

(declare-fun b!178122 () Bool)

(declare-fun lt!88049 () Unit!5431)

(assert (=> b!178122 (= e!117416 lt!88049)))

(assert (=> b!178122 (= lt!88049 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1114 lt!87987) (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178122 (isDefined!150 (getValueByKey!198 (toList!1114 lt!87987) (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178123 () Bool)

(declare-fun Unit!5436 () Unit!5431)

(assert (=> b!178123 (= e!117416 Unit!5436)))

(declare-fun b!178124 () Bool)

(assert (=> b!178124 (= e!117415 (isDefined!150 (getValueByKey!198 (toList!1114 lt!87987) (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53953 c!31922) b!178122))

(assert (= (and d!53953 (not c!31922)) b!178123))

(assert (= (and d!53953 (not res!84394)) b!178124))

(assert (=> d!53953 m!206531))

(declare-fun m!206655 () Bool)

(assert (=> d!53953 m!206655))

(assert (=> b!178122 m!206531))

(declare-fun m!206657 () Bool)

(assert (=> b!178122 m!206657))

(assert (=> b!178122 m!206531))

(assert (=> b!178122 m!206633))

(assert (=> b!178122 m!206633))

(declare-fun m!206659 () Bool)

(assert (=> b!178122 m!206659))

(assert (=> b!178124 m!206531))

(assert (=> b!178124 m!206633))

(assert (=> b!178124 m!206633))

(assert (=> b!178124 m!206659))

(assert (=> b!177981 d!53953))

(declare-fun b!178137 () Bool)

(declare-fun e!117425 () SeekEntryResult!568)

(assert (=> b!178137 (= e!117425 Undefined!568)))

(declare-fun b!178138 () Bool)

(declare-fun e!117424 () SeekEntryResult!568)

(assert (=> b!178138 (= e!117425 e!117424)))

(declare-fun c!31931 () Bool)

(declare-fun lt!88056 () (_ BitVec 64))

(assert (=> b!178138 (= c!31931 (= lt!88056 key!828))))

(declare-fun b!178139 () Bool)

(declare-fun e!117423 () SeekEntryResult!568)

(assert (=> b!178139 (= e!117423 (MissingVacant!568 (index!4442 lt!88013)))))

(declare-fun b!178140 () Bool)

(assert (=> b!178140 (= e!117424 (Found!568 (index!4442 lt!88013)))))

(declare-fun d!53955 () Bool)

(declare-fun lt!88055 () SeekEntryResult!568)

(assert (=> d!53955 (and (or ((_ is Undefined!568) lt!88055) (not ((_ is Found!568) lt!88055)) (and (bvsge (index!4441 lt!88055) #b00000000000000000000000000000000) (bvslt (index!4441 lt!88055) (size!3847 (_keys!5531 thiss!1248))))) (or ((_ is Undefined!568) lt!88055) ((_ is Found!568) lt!88055) (not ((_ is MissingVacant!568) lt!88055)) (not (= (index!4443 lt!88055) (index!4442 lt!88013))) (and (bvsge (index!4443 lt!88055) #b00000000000000000000000000000000) (bvslt (index!4443 lt!88055) (size!3847 (_keys!5531 thiss!1248))))) (or ((_ is Undefined!568) lt!88055) (ite ((_ is Found!568) lt!88055) (= (select (arr!3542 (_keys!5531 thiss!1248)) (index!4441 lt!88055)) key!828) (and ((_ is MissingVacant!568) lt!88055) (= (index!4443 lt!88055) (index!4442 lt!88013)) (= (select (arr!3542 (_keys!5531 thiss!1248)) (index!4443 lt!88055)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53955 (= lt!88055 e!117425)))

(declare-fun c!31930 () Bool)

(assert (=> d!53955 (= c!31930 (bvsge (x!19492 lt!88013) #b01111111111111111111111111111110))))

(assert (=> d!53955 (= lt!88056 (select (arr!3542 (_keys!5531 thiss!1248)) (index!4442 lt!88013)))))

(assert (=> d!53955 (validMask!0 (mask!8607 thiss!1248))))

(assert (=> d!53955 (= (seekKeyOrZeroReturnVacant!0 (x!19492 lt!88013) (index!4442 lt!88013) (index!4442 lt!88013) key!828 (_keys!5531 thiss!1248) (mask!8607 thiss!1248)) lt!88055)))

(declare-fun b!178141 () Bool)

(declare-fun c!31929 () Bool)

(assert (=> b!178141 (= c!31929 (= lt!88056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178141 (= e!117424 e!117423)))

(declare-fun b!178142 () Bool)

(assert (=> b!178142 (= e!117423 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19492 lt!88013) #b00000000000000000000000000000001) (nextIndex!0 (index!4442 lt!88013) (bvadd (x!19492 lt!88013) #b00000000000000000000000000000001) (mask!8607 thiss!1248)) (index!4442 lt!88013) key!828 (_keys!5531 thiss!1248) (mask!8607 thiss!1248)))))

(assert (= (and d!53955 c!31930) b!178137))

(assert (= (and d!53955 (not c!31930)) b!178138))

(assert (= (and b!178138 c!31931) b!178140))

(assert (= (and b!178138 (not c!31931)) b!178141))

(assert (= (and b!178141 c!31929) b!178139))

(assert (= (and b!178141 (not c!31929)) b!178142))

(declare-fun m!206661 () Bool)

(assert (=> d!53955 m!206661))

(declare-fun m!206663 () Bool)

(assert (=> d!53955 m!206663))

(assert (=> d!53955 m!206583))

(assert (=> d!53955 m!206475))

(declare-fun m!206665 () Bool)

(assert (=> b!178142 m!206665))

(assert (=> b!178142 m!206665))

(declare-fun m!206667 () Bool)

(assert (=> b!178142 m!206667))

(assert (=> b!177999 d!53955))

(declare-fun d!53957 () Bool)

(assert (=> d!53957 (= (apply!142 lt!87987 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2033 (getValueByKey!198 (toList!1114 lt!87987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7328 () Bool)

(assert (= bs!7328 d!53957))

(assert (=> bs!7328 m!206645))

(assert (=> bs!7328 m!206645))

(declare-fun m!206669 () Bool)

(assert (=> bs!7328 m!206669))

(assert (=> b!177971 d!53957))

(declare-fun b!178167 () Bool)

(declare-fun e!117440 () Bool)

(declare-fun e!117443 () Bool)

(assert (=> b!178167 (= e!117440 e!117443)))

(declare-fun c!31940 () Bool)

(assert (=> b!178167 (= c!31940 (bvslt #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun b!178168 () Bool)

(declare-fun e!117444 () ListLongMap!2197)

(declare-fun call!17998 () ListLongMap!2197)

(assert (=> b!178168 (= e!117444 call!17998)))

(declare-fun b!178169 () Bool)

(declare-fun e!117441 () ListLongMap!2197)

(assert (=> b!178169 (= e!117441 (ListLongMap!2198 Nil!2230))))

(declare-fun b!178170 () Bool)

(declare-fun lt!88076 () ListLongMap!2197)

(declare-fun isEmpty!456 (ListLongMap!2197) Bool)

(assert (=> b!178170 (= e!117443 (isEmpty!456 lt!88076))))

(declare-fun b!178171 () Bool)

(declare-fun e!117442 () Bool)

(assert (=> b!178171 (= e!117440 e!117442)))

(assert (=> b!178171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun res!84403 () Bool)

(assert (=> b!178171 (= res!84403 (contains!1193 lt!88076 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178171 (=> (not res!84403) (not e!117442))))

(declare-fun b!178173 () Bool)

(assert (=> b!178173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(assert (=> b!178173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3848 (_values!3642 thiss!1248))))))

(assert (=> b!178173 (= e!117442 (= (apply!142 lt!88076 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)) (get!2032 (select (arr!3543 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!178174 () Bool)

(declare-fun lt!88071 () Unit!5431)

(declare-fun lt!88072 () Unit!5431)

(assert (=> b!178174 (= lt!88071 lt!88072)))

(declare-fun lt!88075 () (_ BitVec 64))

(declare-fun lt!88077 () ListLongMap!2197)

(declare-fun lt!88074 () V!5201)

(declare-fun lt!88073 () (_ BitVec 64))

(assert (=> b!178174 (not (contains!1193 (+!259 lt!88077 (tuple2!3265 lt!88075 lt!88074)) lt!88073))))

(declare-fun addStillNotContains!80 (ListLongMap!2197 (_ BitVec 64) V!5201 (_ BitVec 64)) Unit!5431)

(assert (=> b!178174 (= lt!88072 (addStillNotContains!80 lt!88077 lt!88075 lt!88074 lt!88073))))

(assert (=> b!178174 (= lt!88073 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!178174 (= lt!88074 (get!2032 (select (arr!3543 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178174 (= lt!88075 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178174 (= lt!88077 call!17998)))

(assert (=> b!178174 (= e!117444 (+!259 call!17998 (tuple2!3265 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000) (get!2032 (select (arr!3543 (_values!3642 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!485 (defaultEntry!3659 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!178175 () Bool)

(declare-fun e!117445 () Bool)

(assert (=> b!178175 (= e!117445 e!117440)))

(declare-fun c!31942 () Bool)

(declare-fun e!117446 () Bool)

(assert (=> b!178175 (= c!31942 e!117446)))

(declare-fun res!84406 () Bool)

(assert (=> b!178175 (=> (not res!84406) (not e!117446))))

(assert (=> b!178175 (= res!84406 (bvslt #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(declare-fun b!178176 () Bool)

(assert (=> b!178176 (= e!117441 e!117444)))

(declare-fun c!31943 () Bool)

(assert (=> b!178176 (= c!31943 (validKeyInArray!0 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178177 () Bool)

(assert (=> b!178177 (= e!117443 (= lt!88076 (getCurrentListMapNoExtraKeys!173 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3659 thiss!1248))))))

(declare-fun b!178178 () Bool)

(declare-fun res!84405 () Bool)

(assert (=> b!178178 (=> (not res!84405) (not e!117445))))

(assert (=> b!178178 (= res!84405 (not (contains!1193 lt!88076 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!17995 () Bool)

(assert (=> bm!17995 (= call!17998 (getCurrentListMapNoExtraKeys!173 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3659 thiss!1248)))))

(declare-fun b!178172 () Bool)

(assert (=> b!178172 (= e!117446 (validKeyInArray!0 (select (arr!3542 (_keys!5531 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178172 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!53959 () Bool)

(assert (=> d!53959 e!117445))

(declare-fun res!84404 () Bool)

(assert (=> d!53959 (=> (not res!84404) (not e!117445))))

(assert (=> d!53959 (= res!84404 (not (contains!1193 lt!88076 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53959 (= lt!88076 e!117441)))

(declare-fun c!31941 () Bool)

(assert (=> d!53959 (= c!31941 (bvsge #b00000000000000000000000000000000 (size!3847 (_keys!5531 thiss!1248))))))

(assert (=> d!53959 (validMask!0 (mask!8607 thiss!1248))))

(assert (=> d!53959 (= (getCurrentListMapNoExtraKeys!173 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)) lt!88076)))

(assert (= (and d!53959 c!31941) b!178169))

(assert (= (and d!53959 (not c!31941)) b!178176))

(assert (= (and b!178176 c!31943) b!178174))

(assert (= (and b!178176 (not c!31943)) b!178168))

(assert (= (or b!178174 b!178168) bm!17995))

(assert (= (and d!53959 res!84404) b!178178))

(assert (= (and b!178178 res!84405) b!178175))

(assert (= (and b!178175 res!84406) b!178172))

(assert (= (and b!178175 c!31942) b!178171))

(assert (= (and b!178175 (not c!31942)) b!178167))

(assert (= (and b!178171 res!84403) b!178173))

(assert (= (and b!178167 c!31940) b!178177))

(assert (= (and b!178167 (not c!31940)) b!178170))

(declare-fun b_lambda!7093 () Bool)

(assert (=> (not b_lambda!7093) (not b!178173)))

(assert (=> b!178173 t!7062))

(declare-fun b_and!10923 () Bool)

(assert (= b_and!10921 (and (=> t!7062 result!4651) b_and!10923)))

(declare-fun b_lambda!7095 () Bool)

(assert (=> (not b_lambda!7095) (not b!178174)))

(assert (=> b!178174 t!7062))

(declare-fun b_and!10925 () Bool)

(assert (= b_and!10923 (and (=> t!7062 result!4651) b_and!10925)))

(declare-fun m!206671 () Bool)

(assert (=> bm!17995 m!206671))

(declare-fun m!206673 () Bool)

(assert (=> b!178174 m!206673))

(assert (=> b!178174 m!206525))

(declare-fun m!206675 () Bool)

(assert (=> b!178174 m!206675))

(declare-fun m!206677 () Bool)

(assert (=> b!178174 m!206677))

(assert (=> b!178174 m!206527))

(declare-fun m!206679 () Bool)

(assert (=> b!178174 m!206679))

(assert (=> b!178174 m!206675))

(assert (=> b!178174 m!206525))

(assert (=> b!178174 m!206527))

(assert (=> b!178174 m!206529))

(assert (=> b!178174 m!206531))

(declare-fun m!206681 () Bool)

(assert (=> d!53959 m!206681))

(assert (=> d!53959 m!206475))

(assert (=> b!178171 m!206531))

(assert (=> b!178171 m!206531))

(declare-fun m!206683 () Bool)

(assert (=> b!178171 m!206683))

(assert (=> b!178172 m!206531))

(assert (=> b!178172 m!206531))

(assert (=> b!178172 m!206575))

(assert (=> b!178176 m!206531))

(assert (=> b!178176 m!206531))

(assert (=> b!178176 m!206575))

(assert (=> b!178177 m!206671))

(declare-fun m!206685 () Bool)

(assert (=> b!178178 m!206685))

(declare-fun m!206687 () Bool)

(assert (=> b!178170 m!206687))

(assert (=> b!178173 m!206525))

(assert (=> b!178173 m!206531))

(declare-fun m!206689 () Bool)

(assert (=> b!178173 m!206689))

(assert (=> b!178173 m!206527))

(assert (=> b!178173 m!206525))

(assert (=> b!178173 m!206527))

(assert (=> b!178173 m!206529))

(assert (=> b!178173 m!206531))

(assert (=> bm!17978 d!53959))

(declare-fun d!53961 () Bool)

(declare-fun res!84411 () Bool)

(declare-fun e!117451 () Bool)

(assert (=> d!53961 (=> res!84411 e!117451)))

(assert (=> d!53961 (= res!84411 (and ((_ is Cons!2229) (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) (= (_1!1643 (h!2851 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) key!828)))))

(assert (=> d!53961 (= (containsKey!201 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))) key!828) e!117451)))

(declare-fun b!178183 () Bool)

(declare-fun e!117452 () Bool)

(assert (=> b!178183 (= e!117451 e!117452)))

(declare-fun res!84412 () Bool)

(assert (=> b!178183 (=> (not res!84412) (not e!117452))))

(assert (=> b!178183 (= res!84412 (and (or (not ((_ is Cons!2229) (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) (bvsle (_1!1643 (h!2851 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) key!828)) ((_ is Cons!2229) (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) (bvslt (_1!1643 (h!2851 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248))))) key!828)))))

(declare-fun b!178184 () Bool)

(assert (=> b!178184 (= e!117452 (containsKey!201 (t!7059 (toList!1114 (getCurrentListMap!769 (_keys!5531 thiss!1248) (_values!3642 thiss!1248) (mask!8607 thiss!1248) (extraKeys!3396 thiss!1248) (zeroValue!3500 thiss!1248) (minValue!3500 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3659 thiss!1248)))) key!828))))

(assert (= (and d!53961 (not res!84411)) b!178183))

(assert (= (and b!178183 res!84412) b!178184))

(declare-fun m!206691 () Bool)

(assert (=> b!178184 m!206691))

(assert (=> d!53913 d!53961))

(declare-fun d!53963 () Bool)

(declare-fun e!117455 () Bool)

(assert (=> d!53963 e!117455))

(declare-fun res!84418 () Bool)

(assert (=> d!53963 (=> (not res!84418) (not e!117455))))

(declare-fun lt!88088 () ListLongMap!2197)

(assert (=> d!53963 (= res!84418 (contains!1193 lt!88088 (_1!1643 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248)))))))

(declare-fun lt!88089 () List!2233)

(assert (=> d!53963 (= lt!88088 (ListLongMap!2198 lt!88089))))

(declare-fun lt!88087 () Unit!5431)

(declare-fun lt!88086 () Unit!5431)

(assert (=> d!53963 (= lt!88087 lt!88086)))

(assert (=> d!53963 (= (getValueByKey!198 lt!88089 (_1!1643 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248)))) (Some!203 (_2!1643 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!105 (List!2233 (_ BitVec 64) V!5201) Unit!5431)

(assert (=> d!53963 (= lt!88086 (lemmaContainsTupThenGetReturnValue!105 lt!88089 (_1!1643 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248))) (_2!1643 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248)))))))

(declare-fun insertStrictlySorted!108 (List!2233 (_ BitVec 64) V!5201) List!2233)

(assert (=> d!53963 (= lt!88089 (insertStrictlySorted!108 (toList!1114 lt!87985) (_1!1643 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248))) (_2!1643 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248)))))))

(assert (=> d!53963 (= (+!259 lt!87985 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248))) lt!88088)))

(declare-fun b!178189 () Bool)

(declare-fun res!84417 () Bool)

(assert (=> b!178189 (=> (not res!84417) (not e!117455))))

(assert (=> b!178189 (= res!84417 (= (getValueByKey!198 (toList!1114 lt!88088) (_1!1643 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248)))) (Some!203 (_2!1643 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248))))))))

(declare-fun b!178190 () Bool)

(declare-fun contains!1196 (List!2233 tuple2!3264) Bool)

(assert (=> b!178190 (= e!117455 (contains!1196 (toList!1114 lt!88088) (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248))))))

(assert (= (and d!53963 res!84418) b!178189))

(assert (= (and b!178189 res!84417) b!178190))

(declare-fun m!206693 () Bool)

(assert (=> d!53963 m!206693))

(declare-fun m!206695 () Bool)

(assert (=> d!53963 m!206695))

(declare-fun m!206697 () Bool)

(assert (=> d!53963 m!206697))

(declare-fun m!206699 () Bool)

(assert (=> d!53963 m!206699))

(declare-fun m!206701 () Bool)

(assert (=> b!178189 m!206701))

(declare-fun m!206703 () Bool)

(assert (=> b!178190 m!206703))

(assert (=> b!177979 d!53963))

(assert (=> b!177979 d!53959))

(declare-fun d!53965 () Bool)

(assert (=> d!53965 (= (apply!142 lt!88002 lt!87999) (get!2033 (getValueByKey!198 (toList!1114 lt!88002) lt!87999)))))

(declare-fun bs!7329 () Bool)

(assert (= bs!7329 d!53965))

(declare-fun m!206705 () Bool)

(assert (=> bs!7329 m!206705))

(assert (=> bs!7329 m!206705))

(declare-fun m!206707 () Bool)

(assert (=> bs!7329 m!206707))

(assert (=> b!177979 d!53965))

(declare-fun d!53967 () Bool)

(assert (=> d!53967 (= (apply!142 (+!259 lt!88002 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248))) lt!87999) (apply!142 lt!88002 lt!87999))))

(declare-fun lt!88092 () Unit!5431)

(declare-fun choose!957 (ListLongMap!2197 (_ BitVec 64) V!5201 (_ BitVec 64)) Unit!5431)

(assert (=> d!53967 (= lt!88092 (choose!957 lt!88002 lt!88006 (minValue!3500 thiss!1248) lt!87999))))

(declare-fun e!117458 () Bool)

(assert (=> d!53967 e!117458))

(declare-fun res!84421 () Bool)

(assert (=> d!53967 (=> (not res!84421) (not e!117458))))

(assert (=> d!53967 (= res!84421 (contains!1193 lt!88002 lt!87999))))

(assert (=> d!53967 (= (addApplyDifferent!118 lt!88002 lt!88006 (minValue!3500 thiss!1248) lt!87999) lt!88092)))

(declare-fun b!178194 () Bool)

(assert (=> b!178194 (= e!117458 (not (= lt!87999 lt!88006)))))

(assert (= (and d!53967 res!84421) b!178194))

(assert (=> d!53967 m!206565))

(assert (=> d!53967 m!206559))

(assert (=> d!53967 m!206571))

(declare-fun m!206709 () Bool)

(assert (=> d!53967 m!206709))

(declare-fun m!206711 () Bool)

(assert (=> d!53967 m!206711))

(assert (=> d!53967 m!206559))

(assert (=> b!177979 d!53967))

(declare-fun d!53969 () Bool)

(assert (=> d!53969 (= (apply!142 (+!259 lt!88002 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248))) lt!87999) (get!2033 (getValueByKey!198 (toList!1114 (+!259 lt!88002 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248)))) lt!87999)))))

(declare-fun bs!7330 () Bool)

(assert (= bs!7330 d!53969))

(declare-fun m!206713 () Bool)

(assert (=> bs!7330 m!206713))

(assert (=> bs!7330 m!206713))

(declare-fun m!206715 () Bool)

(assert (=> bs!7330 m!206715))

(assert (=> b!177979 d!53969))

(declare-fun d!53971 () Bool)

(assert (=> d!53971 (= (apply!142 lt!87994 lt!88004) (get!2033 (getValueByKey!198 (toList!1114 lt!87994) lt!88004)))))

(declare-fun bs!7331 () Bool)

(assert (= bs!7331 d!53971))

(declare-fun m!206717 () Bool)

(assert (=> bs!7331 m!206717))

(assert (=> bs!7331 m!206717))

(declare-fun m!206719 () Bool)

(assert (=> bs!7331 m!206719))

(assert (=> b!177979 d!53971))

(declare-fun d!53973 () Bool)

(assert (=> d!53973 (= (apply!142 (+!259 lt!87985 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248))) lt!87992) (get!2033 (getValueByKey!198 (toList!1114 (+!259 lt!87985 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248)))) lt!87992)))))

(declare-fun bs!7332 () Bool)

(assert (= bs!7332 d!53973))

(declare-fun m!206721 () Bool)

(assert (=> bs!7332 m!206721))

(assert (=> bs!7332 m!206721))

(declare-fun m!206723 () Bool)

(assert (=> bs!7332 m!206723))

(assert (=> b!177979 d!53973))

(declare-fun d!53975 () Bool)

(declare-fun e!117459 () Bool)

(assert (=> d!53975 e!117459))

(declare-fun res!84423 () Bool)

(assert (=> d!53975 (=> (not res!84423) (not e!117459))))

(declare-fun lt!88095 () ListLongMap!2197)

(assert (=> d!53975 (= res!84423 (contains!1193 lt!88095 (_1!1643 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248)))))))

(declare-fun lt!88096 () List!2233)

(assert (=> d!53975 (= lt!88095 (ListLongMap!2198 lt!88096))))

(declare-fun lt!88094 () Unit!5431)

(declare-fun lt!88093 () Unit!5431)

(assert (=> d!53975 (= lt!88094 lt!88093)))

(assert (=> d!53975 (= (getValueByKey!198 lt!88096 (_1!1643 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248)))) (Some!203 (_2!1643 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248)))))))

(assert (=> d!53975 (= lt!88093 (lemmaContainsTupThenGetReturnValue!105 lt!88096 (_1!1643 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248))) (_2!1643 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248)))))))

(assert (=> d!53975 (= lt!88096 (insertStrictlySorted!108 (toList!1114 lt!88002) (_1!1643 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248))) (_2!1643 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248)))))))

(assert (=> d!53975 (= (+!259 lt!88002 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248))) lt!88095)))

(declare-fun b!178195 () Bool)

(declare-fun res!84422 () Bool)

(assert (=> b!178195 (=> (not res!84422) (not e!117459))))

(assert (=> b!178195 (= res!84422 (= (getValueByKey!198 (toList!1114 lt!88095) (_1!1643 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248)))) (Some!203 (_2!1643 (tuple2!3265 lt!88006 (minValue!3500 thiss!1248))))))))

(declare-fun b!178196 () Bool)

(assert (=> b!178196 (= e!117459 (contains!1196 (toList!1114 lt!88095) (tuple2!3265 lt!88006 (minValue!3500 thiss!1248))))))

(assert (= (and d!53975 res!84423) b!178195))

(assert (= (and b!178195 res!84422) b!178196))

(declare-fun m!206725 () Bool)

(assert (=> d!53975 m!206725))

(declare-fun m!206727 () Bool)

(assert (=> d!53975 m!206727))

(declare-fun m!206729 () Bool)

(assert (=> d!53975 m!206729))

(declare-fun m!206731 () Bool)

(assert (=> d!53975 m!206731))

(declare-fun m!206733 () Bool)

(assert (=> b!178195 m!206733))

(declare-fun m!206735 () Bool)

(assert (=> b!178196 m!206735))

(assert (=> b!177979 d!53975))

(declare-fun d!53977 () Bool)

(assert (=> d!53977 (= (apply!142 lt!87985 lt!87992) (get!2033 (getValueByKey!198 (toList!1114 lt!87985) lt!87992)))))

(declare-fun bs!7333 () Bool)

(assert (= bs!7333 d!53977))

(declare-fun m!206737 () Bool)

(assert (=> bs!7333 m!206737))

(assert (=> bs!7333 m!206737))

(declare-fun m!206739 () Bool)

(assert (=> bs!7333 m!206739))

(assert (=> b!177979 d!53977))

(declare-fun d!53979 () Bool)

(declare-fun e!117460 () Bool)

(assert (=> d!53979 e!117460))

(declare-fun res!84425 () Bool)

(assert (=> d!53979 (=> (not res!84425) (not e!117460))))

(declare-fun lt!88099 () ListLongMap!2197)

(assert (=> d!53979 (= res!84425 (contains!1193 lt!88099 (_1!1643 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248)))))))

(declare-fun lt!88100 () List!2233)

(assert (=> d!53979 (= lt!88099 (ListLongMap!2198 lt!88100))))

(declare-fun lt!88098 () Unit!5431)

(declare-fun lt!88097 () Unit!5431)

(assert (=> d!53979 (= lt!88098 lt!88097)))

(assert (=> d!53979 (= (getValueByKey!198 lt!88100 (_1!1643 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248)))) (Some!203 (_2!1643 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248)))))))

(assert (=> d!53979 (= lt!88097 (lemmaContainsTupThenGetReturnValue!105 lt!88100 (_1!1643 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248))) (_2!1643 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248)))))))

(assert (=> d!53979 (= lt!88100 (insertStrictlySorted!108 (toList!1114 lt!87994) (_1!1643 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248))) (_2!1643 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248)))))))

(assert (=> d!53979 (= (+!259 lt!87994 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248))) lt!88099)))

(declare-fun b!178197 () Bool)

(declare-fun res!84424 () Bool)

(assert (=> b!178197 (=> (not res!84424) (not e!117460))))

(assert (=> b!178197 (= res!84424 (= (getValueByKey!198 (toList!1114 lt!88099) (_1!1643 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248)))) (Some!203 (_2!1643 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248))))))))

(declare-fun b!178198 () Bool)

(assert (=> b!178198 (= e!117460 (contains!1196 (toList!1114 lt!88099) (tuple2!3265 lt!87997 (minValue!3500 thiss!1248))))))

(assert (= (and d!53979 res!84425) b!178197))

(assert (= (and b!178197 res!84424) b!178198))

(declare-fun m!206741 () Bool)

(assert (=> d!53979 m!206741))

(declare-fun m!206743 () Bool)

(assert (=> d!53979 m!206743))

(declare-fun m!206745 () Bool)

(assert (=> d!53979 m!206745))

(declare-fun m!206747 () Bool)

(assert (=> d!53979 m!206747))

(declare-fun m!206749 () Bool)

(assert (=> b!178197 m!206749))

(declare-fun m!206751 () Bool)

(assert (=> b!178198 m!206751))

(assert (=> b!177979 d!53979))

(declare-fun d!53981 () Bool)

(declare-fun e!117461 () Bool)

(assert (=> d!53981 e!117461))

(declare-fun res!84426 () Bool)

(assert (=> d!53981 (=> res!84426 e!117461)))

(declare-fun lt!88101 () Bool)

(assert (=> d!53981 (= res!84426 (not lt!88101))))

(declare-fun lt!88102 () Bool)

(assert (=> d!53981 (= lt!88101 lt!88102)))

(declare-fun lt!88104 () Unit!5431)

(declare-fun e!117462 () Unit!5431)

(assert (=> d!53981 (= lt!88104 e!117462)))

(declare-fun c!31944 () Bool)

(assert (=> d!53981 (= c!31944 lt!88102)))

(assert (=> d!53981 (= lt!88102 (containsKey!201 (toList!1114 (+!259 lt!87986 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248)))) lt!87989))))

(assert (=> d!53981 (= (contains!1193 (+!259 lt!87986 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248))) lt!87989) lt!88101)))

(declare-fun b!178199 () Bool)

(declare-fun lt!88103 () Unit!5431)

(assert (=> b!178199 (= e!117462 lt!88103)))

(assert (=> b!178199 (= lt!88103 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1114 (+!259 lt!87986 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248)))) lt!87989))))

(assert (=> b!178199 (isDefined!150 (getValueByKey!198 (toList!1114 (+!259 lt!87986 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248)))) lt!87989))))

(declare-fun b!178200 () Bool)

(declare-fun Unit!5437 () Unit!5431)

(assert (=> b!178200 (= e!117462 Unit!5437)))

(declare-fun b!178201 () Bool)

(assert (=> b!178201 (= e!117461 (isDefined!150 (getValueByKey!198 (toList!1114 (+!259 lt!87986 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248)))) lt!87989)))))

(assert (= (and d!53981 c!31944) b!178199))

(assert (= (and d!53981 (not c!31944)) b!178200))

(assert (= (and d!53981 (not res!84426)) b!178201))

(declare-fun m!206753 () Bool)

(assert (=> d!53981 m!206753))

(declare-fun m!206755 () Bool)

(assert (=> b!178199 m!206755))

(declare-fun m!206757 () Bool)

(assert (=> b!178199 m!206757))

(assert (=> b!178199 m!206757))

(declare-fun m!206759 () Bool)

(assert (=> b!178199 m!206759))

(assert (=> b!178201 m!206757))

(assert (=> b!178201 m!206757))

(assert (=> b!178201 m!206759))

(assert (=> b!177979 d!53981))

(declare-fun d!53983 () Bool)

(declare-fun e!117463 () Bool)

(assert (=> d!53983 e!117463))

(declare-fun res!84428 () Bool)

(assert (=> d!53983 (=> (not res!84428) (not e!117463))))

(declare-fun lt!88107 () ListLongMap!2197)

(assert (=> d!53983 (= res!84428 (contains!1193 lt!88107 (_1!1643 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248)))))))

(declare-fun lt!88108 () List!2233)

(assert (=> d!53983 (= lt!88107 (ListLongMap!2198 lt!88108))))

(declare-fun lt!88106 () Unit!5431)

(declare-fun lt!88105 () Unit!5431)

(assert (=> d!53983 (= lt!88106 lt!88105)))

(assert (=> d!53983 (= (getValueByKey!198 lt!88108 (_1!1643 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248)))) (Some!203 (_2!1643 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248)))))))

(assert (=> d!53983 (= lt!88105 (lemmaContainsTupThenGetReturnValue!105 lt!88108 (_1!1643 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248))) (_2!1643 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248)))))))

(assert (=> d!53983 (= lt!88108 (insertStrictlySorted!108 (toList!1114 lt!87986) (_1!1643 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248))) (_2!1643 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248)))))))

(assert (=> d!53983 (= (+!259 lt!87986 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248))) lt!88107)))

(declare-fun b!178202 () Bool)

(declare-fun res!84427 () Bool)

(assert (=> b!178202 (=> (not res!84427) (not e!117463))))

(assert (=> b!178202 (= res!84427 (= (getValueByKey!198 (toList!1114 lt!88107) (_1!1643 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248)))) (Some!203 (_2!1643 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248))))))))

(declare-fun b!178203 () Bool)

(assert (=> b!178203 (= e!117463 (contains!1196 (toList!1114 lt!88107) (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248))))))

(assert (= (and d!53983 res!84428) b!178202))

(assert (= (and b!178202 res!84427) b!178203))

(declare-fun m!206761 () Bool)

(assert (=> d!53983 m!206761))

(declare-fun m!206763 () Bool)

(assert (=> d!53983 m!206763))

(declare-fun m!206765 () Bool)

(assert (=> d!53983 m!206765))

(declare-fun m!206767 () Bool)

(assert (=> d!53983 m!206767))

(declare-fun m!206769 () Bool)

(assert (=> b!178202 m!206769))

(declare-fun m!206771 () Bool)

(assert (=> b!178203 m!206771))

(assert (=> b!177979 d!53983))

(declare-fun d!53985 () Bool)

(assert (=> d!53985 (= (apply!142 (+!259 lt!87994 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248))) lt!88004) (apply!142 lt!87994 lt!88004))))

(declare-fun lt!88109 () Unit!5431)

(assert (=> d!53985 (= lt!88109 (choose!957 lt!87994 lt!87997 (minValue!3500 thiss!1248) lt!88004))))

(declare-fun e!117464 () Bool)

(assert (=> d!53985 e!117464))

(declare-fun res!84429 () Bool)

(assert (=> d!53985 (=> (not res!84429) (not e!117464))))

(assert (=> d!53985 (= res!84429 (contains!1193 lt!87994 lt!88004))))

(assert (=> d!53985 (= (addApplyDifferent!118 lt!87994 lt!87997 (minValue!3500 thiss!1248) lt!88004) lt!88109)))

(declare-fun b!178204 () Bool)

(assert (=> b!178204 (= e!117464 (not (= lt!88004 lt!87997)))))

(assert (= (and d!53985 res!84429) b!178204))

(assert (=> d!53985 m!206557))

(assert (=> d!53985 m!206551))

(assert (=> d!53985 m!206553))

(declare-fun m!206773 () Bool)

(assert (=> d!53985 m!206773))

(declare-fun m!206775 () Bool)

(assert (=> d!53985 m!206775))

(assert (=> d!53985 m!206551))

(assert (=> b!177979 d!53985))

(declare-fun d!53987 () Bool)

(assert (=> d!53987 (= (apply!142 (+!259 lt!87994 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248))) lt!88004) (get!2033 (getValueByKey!198 (toList!1114 (+!259 lt!87994 (tuple2!3265 lt!87997 (minValue!3500 thiss!1248)))) lt!88004)))))

(declare-fun bs!7334 () Bool)

(assert (= bs!7334 d!53987))

(declare-fun m!206777 () Bool)

(assert (=> bs!7334 m!206777))

(assert (=> bs!7334 m!206777))

(declare-fun m!206779 () Bool)

(assert (=> bs!7334 m!206779))

(assert (=> b!177979 d!53987))

(declare-fun d!53989 () Bool)

(assert (=> d!53989 (= (apply!142 (+!259 lt!87985 (tuple2!3265 lt!88001 (zeroValue!3500 thiss!1248))) lt!87992) (apply!142 lt!87985 lt!87992))))

(declare-fun lt!88110 () Unit!5431)

(assert (=> d!53989 (= lt!88110 (choose!957 lt!87985 lt!88001 (zeroValue!3500 thiss!1248) lt!87992))))

(declare-fun e!117465 () Bool)

(assert (=> d!53989 e!117465))

(declare-fun res!84430 () Bool)

(assert (=> d!53989 (=> (not res!84430) (not e!117465))))

(assert (=> d!53989 (= res!84430 (contains!1193 lt!87985 lt!87992))))

(assert (=> d!53989 (= (addApplyDifferent!118 lt!87985 lt!88001 (zeroValue!3500 thiss!1248) lt!87992) lt!88110)))

(declare-fun b!178205 () Bool)

(assert (=> b!178205 (= e!117465 (not (= lt!87992 lt!88001)))))

(assert (= (and d!53989 res!84430) b!178205))

(assert (=> d!53989 m!206567))

(assert (=> d!53989 m!206561))

(assert (=> d!53989 m!206563))

(declare-fun m!206781 () Bool)

(assert (=> d!53989 m!206781))

(declare-fun m!206783 () Bool)

(assert (=> d!53989 m!206783))

(assert (=> d!53989 m!206561))

(assert (=> b!177979 d!53989))

(declare-fun d!53991 () Bool)

(assert (=> d!53991 (contains!1193 (+!259 lt!87986 (tuple2!3265 lt!88000 (zeroValue!3500 thiss!1248))) lt!87989)))

(declare-fun lt!88113 () Unit!5431)

(declare-fun choose!958 (ListLongMap!2197 (_ BitVec 64) V!5201 (_ BitVec 64)) Unit!5431)

(assert (=> d!53991 (= lt!88113 (choose!958 lt!87986 lt!88000 (zeroValue!3500 thiss!1248) lt!87989))))

(assert (=> d!53991 (contains!1193 lt!87986 lt!87989)))

(assert (=> d!53991 (= (addStillContains!118 lt!87986 lt!88000 (zeroValue!3500 thiss!1248) lt!87989) lt!88113)))

(declare-fun bs!7335 () Bool)

(assert (= bs!7335 d!53991))

(assert (=> bs!7335 m!206543))

(assert (=> bs!7335 m!206543))

(assert (=> bs!7335 m!206545))

(declare-fun m!206785 () Bool)

(assert (=> bs!7335 m!206785))

(declare-fun m!206787 () Bool)

(assert (=> bs!7335 m!206787))

(assert (=> b!177979 d!53991))

(declare-fun d!53993 () Bool)

(declare-fun e!117466 () Bool)

(assert (=> d!53993 e!117466))

(declare-fun res!84432 () Bool)

(assert (=> d!53993 (=> (not res!84432) (not e!117466))))

(declare-fun lt!88116 () ListLongMap!2197)

(assert (=> d!53993 (= res!84432 (contains!1193 lt!88116 (_1!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(declare-fun lt!88117 () List!2233)

(assert (=> d!53993 (= lt!88116 (ListLongMap!2198 lt!88117))))

(declare-fun lt!88115 () Unit!5431)

(declare-fun lt!88114 () Unit!5431)

(assert (=> d!53993 (= lt!88115 lt!88114)))

(assert (=> d!53993 (= (getValueByKey!198 lt!88117 (_1!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))) (Some!203 (_2!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(assert (=> d!53993 (= lt!88114 (lemmaContainsTupThenGetReturnValue!105 lt!88117 (_1!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))) (_2!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(assert (=> d!53993 (= lt!88117 (insertStrictlySorted!108 (toList!1114 call!17985) (_1!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))) (_2!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(assert (=> d!53993 (= (+!259 call!17985 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))) lt!88116)))

(declare-fun b!178207 () Bool)

(declare-fun res!84431 () Bool)

(assert (=> b!178207 (=> (not res!84431) (not e!117466))))

(assert (=> b!178207 (= res!84431 (= (getValueByKey!198 (toList!1114 lt!88116) (_1!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))) (Some!203 (_2!1643 (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))))

(declare-fun b!178208 () Bool)

(assert (=> b!178208 (= e!117466 (contains!1196 (toList!1114 lt!88116) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))

(assert (= (and d!53993 res!84432) b!178207))

(assert (= (and b!178207 res!84431) b!178208))

(declare-fun m!206789 () Bool)

(assert (=> d!53993 m!206789))

(declare-fun m!206791 () Bool)

(assert (=> d!53993 m!206791))

(declare-fun m!206793 () Bool)

(assert (=> d!53993 m!206793))

(declare-fun m!206795 () Bool)

(assert (=> d!53993 m!206795))

(declare-fun m!206797 () Bool)

(assert (=> b!178207 m!206797))

(declare-fun m!206799 () Bool)

(assert (=> b!178208 m!206799))

(assert (=> b!177977 d!53993))

(declare-fun d!53995 () Bool)

(declare-fun e!117467 () Bool)

(assert (=> d!53995 e!117467))

(declare-fun res!84434 () Bool)

(assert (=> d!53995 (=> (not res!84434) (not e!117467))))

(declare-fun lt!88120 () ListLongMap!2197)

(assert (=> d!53995 (= res!84434 (contains!1193 lt!88120 (_1!1643 (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))))

(declare-fun lt!88121 () List!2233)

(assert (=> d!53995 (= lt!88120 (ListLongMap!2198 lt!88121))))

(declare-fun lt!88119 () Unit!5431)

(declare-fun lt!88118 () Unit!5431)

(assert (=> d!53995 (= lt!88119 lt!88118)))

(assert (=> d!53995 (= (getValueByKey!198 lt!88121 (_1!1643 (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))) (Some!203 (_2!1643 (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))))

(assert (=> d!53995 (= lt!88118 (lemmaContainsTupThenGetReturnValue!105 lt!88121 (_1!1643 (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))) (_2!1643 (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))))

(assert (=> d!53995 (= lt!88121 (insertStrictlySorted!108 (toList!1114 (ite c!31879 call!17984 (ite c!31878 call!17982 call!17986))) (_1!1643 (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))) (_2!1643 (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))))))

(assert (=> d!53995 (= (+!259 (ite c!31879 call!17984 (ite c!31878 call!17982 call!17986)) (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))) lt!88120)))

(declare-fun b!178209 () Bool)

(declare-fun res!84433 () Bool)

(assert (=> b!178209 (=> (not res!84433) (not e!117467))))

(assert (=> b!178209 (= res!84433 (= (getValueByKey!198 (toList!1114 lt!88120) (_1!1643 (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248))))) (Some!203 (_2!1643 (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))))

(declare-fun b!178210 () Bool)

(assert (=> b!178210 (= e!117467 (contains!1196 (toList!1114 lt!88120) (ite (or c!31879 c!31878) (tuple2!3265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3500 thiss!1248)) (tuple2!3265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3500 thiss!1248)))))))

(assert (= (and d!53995 res!84434) b!178209))

(assert (= (and b!178209 res!84433) b!178210))

(declare-fun m!206801 () Bool)

(assert (=> d!53995 m!206801))

(declare-fun m!206803 () Bool)

(assert (=> d!53995 m!206803))

(declare-fun m!206805 () Bool)

(assert (=> d!53995 m!206805))

(declare-fun m!206807 () Bool)

(assert (=> d!53995 m!206807))

(declare-fun m!206809 () Bool)

(assert (=> b!178209 m!206809))

(declare-fun m!206811 () Bool)

(assert (=> b!178210 m!206811))

(assert (=> bm!17980 d!53995))

(declare-fun d!53997 () Bool)

(declare-fun e!117468 () Bool)

(assert (=> d!53997 e!117468))

(declare-fun res!84435 () Bool)

(assert (=> d!53997 (=> res!84435 e!117468)))

(declare-fun lt!88122 () Bool)

(assert (=> d!53997 (= res!84435 (not lt!88122))))

(declare-fun lt!88123 () Bool)

(assert (=> d!53997 (= lt!88122 lt!88123)))

(declare-fun lt!88125 () Unit!5431)

(declare-fun e!117469 () Unit!5431)

(assert (=> d!53997 (= lt!88125 e!117469)))

(declare-fun c!31945 () Bool)

(assert (=> d!53997 (= c!31945 lt!88123)))

(assert (=> d!53997 (= lt!88123 (containsKey!201 (toList!1114 lt!87987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53997 (= (contains!1193 lt!87987 #b1000000000000000000000000000000000000000000000000000000000000000) lt!88122)))

(declare-fun b!178211 () Bool)

(declare-fun lt!88124 () Unit!5431)

(assert (=> b!178211 (= e!117469 lt!88124)))

(assert (=> b!178211 (= lt!88124 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1114 lt!87987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178211 (isDefined!150 (getValueByKey!198 (toList!1114 lt!87987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178212 () Bool)

(declare-fun Unit!5438 () Unit!5431)

(assert (=> b!178212 (= e!117469 Unit!5438)))

(declare-fun b!178213 () Bool)

(assert (=> b!178213 (= e!117468 (isDefined!150 (getValueByKey!198 (toList!1114 lt!87987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53997 c!31945) b!178211))

(assert (= (and d!53997 (not c!31945)) b!178212))

(assert (= (and d!53997 (not res!84435)) b!178213))

(declare-fun m!206813 () Bool)

(assert (=> d!53997 m!206813))

(declare-fun m!206815 () Bool)

(assert (=> b!178211 m!206815))

(declare-fun m!206817 () Bool)

(assert (=> b!178211 m!206817))

(assert (=> b!178211 m!206817))

(declare-fun m!206819 () Bool)

(assert (=> b!178211 m!206819))

(assert (=> b!178213 m!206817))

(assert (=> b!178213 m!206817))

(assert (=> b!178213 m!206819))

(assert (=> bm!17977 d!53997))

(declare-fun d!53999 () Bool)

(assert (=> d!53999 (= (apply!142 lt!87987 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2033 (getValueByKey!198 (toList!1114 lt!87987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7336 () Bool)

(assert (= bs!7336 d!53999))

(assert (=> bs!7336 m!206817))

(assert (=> bs!7336 m!206817))

(declare-fun m!206821 () Bool)

(assert (=> bs!7336 m!206821))

(assert (=> b!177976 d!53999))

(declare-fun condMapEmpty!7127 () Bool)

(declare-fun mapDefault!7127 () ValueCell!1739)

(assert (=> mapNonEmpty!7126 (= condMapEmpty!7127 (= mapRest!7126 ((as const (Array (_ BitVec 32) ValueCell!1739)) mapDefault!7127)))))

(declare-fun e!117471 () Bool)

(declare-fun mapRes!7127 () Bool)

(assert (=> mapNonEmpty!7126 (= tp!15901 (and e!117471 mapRes!7127))))

(declare-fun mapNonEmpty!7127 () Bool)

(declare-fun tp!15902 () Bool)

(declare-fun e!117470 () Bool)

(assert (=> mapNonEmpty!7127 (= mapRes!7127 (and tp!15902 e!117470))))

(declare-fun mapValue!7127 () ValueCell!1739)

(declare-fun mapRest!7127 () (Array (_ BitVec 32) ValueCell!1739))

(declare-fun mapKey!7127 () (_ BitVec 32))

(assert (=> mapNonEmpty!7127 (= mapRest!7126 (store mapRest!7127 mapKey!7127 mapValue!7127))))

(declare-fun b!178215 () Bool)

(assert (=> b!178215 (= e!117471 tp_is_empty!4165)))

(declare-fun mapIsEmpty!7127 () Bool)

(assert (=> mapIsEmpty!7127 mapRes!7127))

(declare-fun b!178214 () Bool)

(assert (=> b!178214 (= e!117470 tp_is_empty!4165)))

(assert (= (and mapNonEmpty!7126 condMapEmpty!7127) mapIsEmpty!7127))

(assert (= (and mapNonEmpty!7126 (not condMapEmpty!7127)) mapNonEmpty!7127))

(assert (= (and mapNonEmpty!7127 ((_ is ValueCellFull!1739) mapValue!7127)) b!178214))

(assert (= (and mapNonEmpty!7126 ((_ is ValueCellFull!1739) mapDefault!7127)) b!178215))

(declare-fun m!206823 () Bool)

(assert (=> mapNonEmpty!7127 m!206823))

(declare-fun b_lambda!7097 () Bool)

(assert (= b_lambda!7093 (or (and b!177849 b_free!4393) b_lambda!7097)))

(declare-fun b_lambda!7099 () Bool)

(assert (= b_lambda!7095 (or (and b!177849 b_free!4393) b_lambda!7099)))

(check-sat (not bm!17989) (not b!178172) (not d!53993) (not d!53973) (not d!53969) (not d!53955) (not b!178203) (not b!178209) b_and!10925 (not b!178084) (not b!178045) (not b!178189) (not b!178171) (not b!178106) (not b!178176) (not d!53965) (not b!178124) (not b!178102) (not d!53987) (not b!178056) (not d!53949) (not b!178142) (not d!53981) (not b!178178) (not b!178119) (not b_next!4393) (not mapNonEmpty!7127) (not b!178197) (not b!178034) (not d!53967) (not b!178184) (not b_lambda!7091) (not b!178097) (not d!53963) (not b!178174) (not b!178202) (not b!178177) (not b!178030) (not b!178033) (not b!178103) (not d!53975) (not bm!17995) (not d!53995) (not d!53979) (not d!53953) (not d!53971) (not d!53991) (not d!53951) (not b!178208) (not bm!17986) (not b!178199) (not b!178055) (not b!178198) (not b!178196) (not d!53957) (not b!178201) (not d!53985) (not d!53977) (not b!178173) (not b!178104) (not d!53997) (not d!53989) (not b!178122) (not b!178207) (not b!178195) (not d!53959) (not d!53937) (not b!178211) (not b!178120) (not b!178210) (not b!178109) (not b_lambda!7099) (not d!53929) (not b!178213) (not bm!17992) (not b!178190) tp_is_empty!4165 (not d!53943) (not d!53983) (not d!53999) (not d!53947) (not b_lambda!7097) (not b!178170))
(check-sat b_and!10925 (not b_next!4393))
