; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18330 () Bool)

(assert start!18330)

(declare-fun b!181988 () Bool)

(declare-fun b_free!4491 () Bool)

(declare-fun b_next!4491 () Bool)

(assert (=> b!181988 (= b_free!4491 (not b_next!4491))))

(declare-fun tp!16227 () Bool)

(declare-fun b_and!11047 () Bool)

(assert (=> b!181988 (= tp!16227 b_and!11047)))

(declare-fun b!181981 () Bool)

(declare-fun res!86137 () Bool)

(declare-fun e!119847 () Bool)

(assert (=> b!181981 (=> (not res!86137) (not e!119847))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!181981 (= res!86137 (not (= key!828 (bvneg key!828))))))

(declare-fun b!181982 () Bool)

(declare-fun e!119851 () Bool)

(declare-datatypes ((V!5331 0))(
  ( (V!5332 (val!2176 Int)) )
))
(declare-datatypes ((ValueCell!1788 0))(
  ( (ValueCellFull!1788 (v!4074 V!5331)) (EmptyCell!1788) )
))
(declare-datatypes ((array!7709 0))(
  ( (array!7710 (arr!3647 (Array (_ BitVec 32) (_ BitVec 64))) (size!3958 (_ BitVec 32))) )
))
(declare-datatypes ((array!7711 0))(
  ( (array!7712 (arr!3648 (Array (_ BitVec 32) ValueCell!1788)) (size!3959 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2484 0))(
  ( (LongMapFixedSize!2485 (defaultEntry!3726 Int) (mask!8759 (_ BitVec 32)) (extraKeys!3463 (_ BitVec 32)) (zeroValue!3567 V!5331) (minValue!3567 V!5331) (_size!1291 (_ BitVec 32)) (_keys!5633 array!7709) (_values!3709 array!7711) (_vacant!1291 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2484)

(assert (=> b!181982 (= e!119851 (and (= (size!3959 (_values!3709 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8759 thiss!1248))) (= (size!3958 (_keys!5633 thiss!1248)) (size!3959 (_values!3709 thiss!1248))) (bvsge (mask!8759 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3463 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3463 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!181983 () Bool)

(declare-fun res!86140 () Bool)

(assert (=> b!181983 (=> (not res!86140) (not e!119851))))

(declare-datatypes ((tuple2!3394 0))(
  ( (tuple2!3395 (_1!1708 (_ BitVec 64)) (_2!1708 V!5331)) )
))
(declare-datatypes ((List!2313 0))(
  ( (Nil!2310) (Cons!2309 (h!2937 tuple2!3394) (t!7171 List!2313)) )
))
(declare-datatypes ((ListLongMap!2311 0))(
  ( (ListLongMap!2312 (toList!1171 List!2313)) )
))
(declare-fun contains!1253 (ListLongMap!2311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!819 (array!7709 array!7711 (_ BitVec 32) (_ BitVec 32) V!5331 V!5331 (_ BitVec 32) Int) ListLongMap!2311)

(assert (=> b!181983 (= res!86140 (contains!1253 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)) key!828))))

(declare-fun b!181984 () Bool)

(declare-fun e!119852 () Bool)

(declare-fun tp_is_empty!4263 () Bool)

(assert (=> b!181984 (= e!119852 tp_is_empty!4263)))

(declare-fun b!181985 () Bool)

(declare-fun e!119849 () Bool)

(assert (=> b!181985 (= e!119849 tp_is_empty!4263)))

(declare-fun b!181986 () Bool)

(declare-fun res!86138 () Bool)

(assert (=> b!181986 (=> (not res!86138) (not e!119851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181986 (= res!86138 (validMask!0 (mask!8759 thiss!1248)))))

(declare-fun res!86139 () Bool)

(assert (=> start!18330 (=> (not res!86139) (not e!119847))))

(declare-fun valid!1029 (LongMapFixedSize!2484) Bool)

(assert (=> start!18330 (= res!86139 (valid!1029 thiss!1248))))

(assert (=> start!18330 e!119847))

(declare-fun e!119853 () Bool)

(assert (=> start!18330 e!119853))

(assert (=> start!18330 true))

(declare-fun b!181987 () Bool)

(declare-fun e!119848 () Bool)

(declare-fun mapRes!7312 () Bool)

(assert (=> b!181987 (= e!119848 (and e!119852 mapRes!7312))))

(declare-fun condMapEmpty!7312 () Bool)

(declare-fun mapDefault!7312 () ValueCell!1788)

(assert (=> b!181987 (= condMapEmpty!7312 (= (arr!3648 (_values!3709 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1788)) mapDefault!7312)))))

(declare-fun array_inv!2349 (array!7709) Bool)

(declare-fun array_inv!2350 (array!7711) Bool)

(assert (=> b!181988 (= e!119853 (and tp!16227 tp_is_empty!4263 (array_inv!2349 (_keys!5633 thiss!1248)) (array_inv!2350 (_values!3709 thiss!1248)) e!119848))))

(declare-fun mapNonEmpty!7312 () Bool)

(declare-fun tp!16228 () Bool)

(assert (=> mapNonEmpty!7312 (= mapRes!7312 (and tp!16228 e!119849))))

(declare-fun mapValue!7312 () ValueCell!1788)

(declare-fun mapKey!7312 () (_ BitVec 32))

(declare-fun mapRest!7312 () (Array (_ BitVec 32) ValueCell!1788))

(assert (=> mapNonEmpty!7312 (= (arr!3648 (_values!3709 thiss!1248)) (store mapRest!7312 mapKey!7312 mapValue!7312))))

(declare-fun mapIsEmpty!7312 () Bool)

(assert (=> mapIsEmpty!7312 mapRes!7312))

(declare-fun b!181989 () Bool)

(assert (=> b!181989 (= e!119847 e!119851)))

(declare-fun res!86136 () Bool)

(assert (=> b!181989 (=> (not res!86136) (not e!119851))))

(declare-datatypes ((SeekEntryResult!603 0))(
  ( (MissingZero!603 (index!4582 (_ BitVec 32))) (Found!603 (index!4583 (_ BitVec 32))) (Intermediate!603 (undefined!1415 Bool) (index!4584 (_ BitVec 32)) (x!19851 (_ BitVec 32))) (Undefined!603) (MissingVacant!603 (index!4585 (_ BitVec 32))) )
))
(declare-fun lt!89987 () SeekEntryResult!603)

(get-info :version)

(assert (=> b!181989 (= res!86136 (and (not ((_ is Undefined!603) lt!89987)) (not ((_ is MissingVacant!603) lt!89987)) (not ((_ is MissingZero!603) lt!89987)) ((_ is Found!603) lt!89987)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7709 (_ BitVec 32)) SeekEntryResult!603)

(assert (=> b!181989 (= lt!89987 (seekEntryOrOpen!0 key!828 (_keys!5633 thiss!1248) (mask!8759 thiss!1248)))))

(assert (= (and start!18330 res!86139) b!181981))

(assert (= (and b!181981 res!86137) b!181989))

(assert (= (and b!181989 res!86136) b!181983))

(assert (= (and b!181983 res!86140) b!181986))

(assert (= (and b!181986 res!86138) b!181982))

(assert (= (and b!181987 condMapEmpty!7312) mapIsEmpty!7312))

(assert (= (and b!181987 (not condMapEmpty!7312)) mapNonEmpty!7312))

(assert (= (and mapNonEmpty!7312 ((_ is ValueCellFull!1788) mapValue!7312)) b!181985))

(assert (= (and b!181987 ((_ is ValueCellFull!1788) mapDefault!7312)) b!181984))

(assert (= b!181988 b!181987))

(assert (= start!18330 b!181988))

(declare-fun m!209821 () Bool)

(assert (=> b!181988 m!209821))

(declare-fun m!209823 () Bool)

(assert (=> b!181988 m!209823))

(declare-fun m!209825 () Bool)

(assert (=> start!18330 m!209825))

(declare-fun m!209827 () Bool)

(assert (=> b!181986 m!209827))

(declare-fun m!209829 () Bool)

(assert (=> b!181989 m!209829))

(declare-fun m!209831 () Bool)

(assert (=> b!181983 m!209831))

(assert (=> b!181983 m!209831))

(declare-fun m!209833 () Bool)

(assert (=> b!181983 m!209833))

(declare-fun m!209835 () Bool)

(assert (=> mapNonEmpty!7312 m!209835))

(check-sat (not b!181989) (not b_next!4491) (not start!18330) tp_is_empty!4263 (not b!181983) (not b!181988) (not b!181986) b_and!11047 (not mapNonEmpty!7312))
(check-sat b_and!11047 (not b_next!4491))
(get-model)

(declare-fun d!54535 () Bool)

(assert (=> d!54535 (= (array_inv!2349 (_keys!5633 thiss!1248)) (bvsge (size!3958 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181988 d!54535))

(declare-fun d!54537 () Bool)

(assert (=> d!54537 (= (array_inv!2350 (_values!3709 thiss!1248)) (bvsge (size!3959 (_values!3709 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181988 d!54537))

(declare-fun d!54539 () Bool)

(declare-fun e!119879 () Bool)

(assert (=> d!54539 e!119879))

(declare-fun res!86158 () Bool)

(assert (=> d!54539 (=> res!86158 e!119879)))

(declare-fun lt!90002 () Bool)

(assert (=> d!54539 (= res!86158 (not lt!90002))))

(declare-fun lt!90001 () Bool)

(assert (=> d!54539 (= lt!90002 lt!90001)))

(declare-datatypes ((Unit!5524 0))(
  ( (Unit!5525) )
))
(declare-fun lt!90000 () Unit!5524)

(declare-fun e!119880 () Unit!5524)

(assert (=> d!54539 (= lt!90000 e!119880)))

(declare-fun c!32630 () Bool)

(assert (=> d!54539 (= c!32630 lt!90001)))

(declare-fun containsKey!215 (List!2313 (_ BitVec 64)) Bool)

(assert (=> d!54539 (= lt!90001 (containsKey!215 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828))))

(assert (=> d!54539 (= (contains!1253 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)) key!828) lt!90002)))

(declare-fun b!182023 () Bool)

(declare-fun lt!89999 () Unit!5524)

(assert (=> b!182023 (= e!119880 lt!89999)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!163 (List!2313 (_ BitVec 64)) Unit!5524)

(assert (=> b!182023 (= lt!89999 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828))))

(declare-datatypes ((Option!217 0))(
  ( (Some!216 (v!4076 V!5331)) (None!215) )
))
(declare-fun isDefined!164 (Option!217) Bool)

(declare-fun getValueByKey!211 (List!2313 (_ BitVec 64)) Option!217)

(assert (=> b!182023 (isDefined!164 (getValueByKey!211 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828))))

(declare-fun b!182024 () Bool)

(declare-fun Unit!5526 () Unit!5524)

(assert (=> b!182024 (= e!119880 Unit!5526)))

(declare-fun b!182025 () Bool)

(assert (=> b!182025 (= e!119879 (isDefined!164 (getValueByKey!211 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828)))))

(assert (= (and d!54539 c!32630) b!182023))

(assert (= (and d!54539 (not c!32630)) b!182024))

(assert (= (and d!54539 (not res!86158)) b!182025))

(declare-fun m!209853 () Bool)

(assert (=> d!54539 m!209853))

(declare-fun m!209855 () Bool)

(assert (=> b!182023 m!209855))

(declare-fun m!209857 () Bool)

(assert (=> b!182023 m!209857))

(assert (=> b!182023 m!209857))

(declare-fun m!209859 () Bool)

(assert (=> b!182023 m!209859))

(assert (=> b!182025 m!209857))

(assert (=> b!182025 m!209857))

(assert (=> b!182025 m!209859))

(assert (=> b!181983 d!54539))

(declare-fun bm!18388 () Bool)

(declare-fun call!18393 () ListLongMap!2311)

(declare-fun call!18391 () ListLongMap!2311)

(assert (=> bm!18388 (= call!18393 call!18391)))

(declare-fun b!182068 () Bool)

(declare-fun c!32643 () Bool)

(assert (=> b!182068 (= c!32643 (and (not (= (bvand (extraKeys!3463 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3463 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!119917 () ListLongMap!2311)

(declare-fun e!119914 () ListLongMap!2311)

(assert (=> b!182068 (= e!119917 e!119914)))

(declare-fun d!54541 () Bool)

(declare-fun e!119919 () Bool)

(assert (=> d!54541 e!119919))

(declare-fun res!86180 () Bool)

(assert (=> d!54541 (=> (not res!86180) (not e!119919))))

(assert (=> d!54541 (= res!86180 (or (bvsge #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))))

(declare-fun lt!90065 () ListLongMap!2311)

(declare-fun lt!90047 () ListLongMap!2311)

(assert (=> d!54541 (= lt!90065 lt!90047)))

(declare-fun lt!90060 () Unit!5524)

(declare-fun e!119911 () Unit!5524)

(assert (=> d!54541 (= lt!90060 e!119911)))

(declare-fun c!32646 () Bool)

(declare-fun e!119907 () Bool)

(assert (=> d!54541 (= c!32646 e!119907)))

(declare-fun res!86177 () Bool)

(assert (=> d!54541 (=> (not res!86177) (not e!119907))))

(assert (=> d!54541 (= res!86177 (bvslt #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(declare-fun e!119918 () ListLongMap!2311)

(assert (=> d!54541 (= lt!90047 e!119918)))

(declare-fun c!32645 () Bool)

(assert (=> d!54541 (= c!32645 (and (not (= (bvand (extraKeys!3463 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3463 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54541 (validMask!0 (mask!8759 thiss!1248))))

(assert (=> d!54541 (= (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)) lt!90065)))

(declare-fun b!182069 () Bool)

(declare-fun call!18395 () ListLongMap!2311)

(declare-fun +!274 (ListLongMap!2311 tuple2!3394) ListLongMap!2311)

(assert (=> b!182069 (= e!119918 (+!274 call!18395 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))))))

(declare-fun b!182070 () Bool)

(declare-fun e!119909 () Bool)

(declare-fun e!119912 () Bool)

(assert (=> b!182070 (= e!119909 e!119912)))

(declare-fun res!86183 () Bool)

(assert (=> b!182070 (=> (not res!86183) (not e!119912))))

(assert (=> b!182070 (= res!86183 (contains!1253 lt!90065 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182070 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(declare-fun b!182071 () Bool)

(declare-fun e!119910 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182071 (= e!119910 (validKeyInArray!0 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182072 () Bool)

(declare-fun Unit!5527 () Unit!5524)

(assert (=> b!182072 (= e!119911 Unit!5527)))

(declare-fun b!182073 () Bool)

(declare-fun e!119913 () Bool)

(assert (=> b!182073 (= e!119919 e!119913)))

(declare-fun c!32648 () Bool)

(assert (=> b!182073 (= c!32648 (not (= (bvand (extraKeys!3463 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182074 () Bool)

(declare-fun e!119915 () Bool)

(assert (=> b!182074 (= e!119913 e!119915)))

(declare-fun res!86179 () Bool)

(declare-fun call!18396 () Bool)

(assert (=> b!182074 (= res!86179 call!18396)))

(assert (=> b!182074 (=> (not res!86179) (not e!119915))))

(declare-fun bm!18389 () Bool)

(declare-fun call!18394 () ListLongMap!2311)

(assert (=> bm!18389 (= call!18391 call!18394)))

(declare-fun bm!18390 () Bool)

(declare-fun call!18397 () ListLongMap!2311)

(assert (=> bm!18390 (= call!18397 call!18395)))

(declare-fun b!182075 () Bool)

(assert (=> b!182075 (= e!119918 e!119917)))

(declare-fun c!32647 () Bool)

(assert (=> b!182075 (= c!32647 (and (not (= (bvand (extraKeys!3463 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3463 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182076 () Bool)

(declare-fun e!119908 () Bool)

(declare-fun apply!154 (ListLongMap!2311 (_ BitVec 64)) V!5331)

(assert (=> b!182076 (= e!119908 (= (apply!154 lt!90065 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3567 thiss!1248)))))

(declare-fun b!182077 () Bool)

(declare-fun get!2088 (ValueCell!1788 V!5331) V!5331)

(declare-fun dynLambda!497 (Int (_ BitVec 64)) V!5331)

(assert (=> b!182077 (= e!119912 (= (apply!154 lt!90065 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)) (get!2088 (select (arr!3648 (_values!3709 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3726 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3959 (_values!3709 thiss!1248))))))

(assert (=> b!182077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(declare-fun b!182078 () Bool)

(assert (=> b!182078 (= e!119914 call!18397)))

(declare-fun b!182079 () Bool)

(assert (=> b!182079 (= e!119907 (validKeyInArray!0 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18391 () Bool)

(declare-fun call!18392 () Bool)

(assert (=> bm!18391 (= call!18392 (contains!1253 lt!90065 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182080 () Bool)

(assert (=> b!182080 (= e!119917 call!18397)))

(declare-fun bm!18392 () Bool)

(assert (=> bm!18392 (= call!18396 (contains!1253 lt!90065 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182081 () Bool)

(declare-fun lt!90066 () Unit!5524)

(assert (=> b!182081 (= e!119911 lt!90066)))

(declare-fun lt!90064 () ListLongMap!2311)

(declare-fun getCurrentListMapNoExtraKeys!187 (array!7709 array!7711 (_ BitVec 32) (_ BitVec 32) V!5331 V!5331 (_ BitVec 32) Int) ListLongMap!2311)

(assert (=> b!182081 (= lt!90064 (getCurrentListMapNoExtraKeys!187 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))))

(declare-fun lt!90057 () (_ BitVec 64))

(assert (=> b!182081 (= lt!90057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90055 () (_ BitVec 64))

(assert (=> b!182081 (= lt!90055 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90050 () Unit!5524)

(declare-fun addStillContains!130 (ListLongMap!2311 (_ BitVec 64) V!5331 (_ BitVec 64)) Unit!5524)

(assert (=> b!182081 (= lt!90050 (addStillContains!130 lt!90064 lt!90057 (zeroValue!3567 thiss!1248) lt!90055))))

(assert (=> b!182081 (contains!1253 (+!274 lt!90064 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248))) lt!90055)))

(declare-fun lt!90067 () Unit!5524)

(assert (=> b!182081 (= lt!90067 lt!90050)))

(declare-fun lt!90058 () ListLongMap!2311)

(assert (=> b!182081 (= lt!90058 (getCurrentListMapNoExtraKeys!187 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))))

(declare-fun lt!90056 () (_ BitVec 64))

(assert (=> b!182081 (= lt!90056 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90061 () (_ BitVec 64))

(assert (=> b!182081 (= lt!90061 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90059 () Unit!5524)

(declare-fun addApplyDifferent!130 (ListLongMap!2311 (_ BitVec 64) V!5331 (_ BitVec 64)) Unit!5524)

(assert (=> b!182081 (= lt!90059 (addApplyDifferent!130 lt!90058 lt!90056 (minValue!3567 thiss!1248) lt!90061))))

(assert (=> b!182081 (= (apply!154 (+!274 lt!90058 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248))) lt!90061) (apply!154 lt!90058 lt!90061))))

(declare-fun lt!90053 () Unit!5524)

(assert (=> b!182081 (= lt!90053 lt!90059)))

(declare-fun lt!90048 () ListLongMap!2311)

(assert (=> b!182081 (= lt!90048 (getCurrentListMapNoExtraKeys!187 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))))

(declare-fun lt!90063 () (_ BitVec 64))

(assert (=> b!182081 (= lt!90063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90054 () (_ BitVec 64))

(assert (=> b!182081 (= lt!90054 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90062 () Unit!5524)

(assert (=> b!182081 (= lt!90062 (addApplyDifferent!130 lt!90048 lt!90063 (zeroValue!3567 thiss!1248) lt!90054))))

(assert (=> b!182081 (= (apply!154 (+!274 lt!90048 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248))) lt!90054) (apply!154 lt!90048 lt!90054))))

(declare-fun lt!90051 () Unit!5524)

(assert (=> b!182081 (= lt!90051 lt!90062)))

(declare-fun lt!90049 () ListLongMap!2311)

(assert (=> b!182081 (= lt!90049 (getCurrentListMapNoExtraKeys!187 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))))

(declare-fun lt!90052 () (_ BitVec 64))

(assert (=> b!182081 (= lt!90052 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90068 () (_ BitVec 64))

(assert (=> b!182081 (= lt!90068 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182081 (= lt!90066 (addApplyDifferent!130 lt!90049 lt!90052 (minValue!3567 thiss!1248) lt!90068))))

(assert (=> b!182081 (= (apply!154 (+!274 lt!90049 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248))) lt!90068) (apply!154 lt!90049 lt!90068))))

(declare-fun b!182082 () Bool)

(assert (=> b!182082 (= e!119913 (not call!18396))))

(declare-fun b!182083 () Bool)

(declare-fun res!86181 () Bool)

(assert (=> b!182083 (=> (not res!86181) (not e!119919))))

(assert (=> b!182083 (= res!86181 e!119909)))

(declare-fun res!86185 () Bool)

(assert (=> b!182083 (=> res!86185 e!119909)))

(assert (=> b!182083 (= res!86185 (not e!119910))))

(declare-fun res!86182 () Bool)

(assert (=> b!182083 (=> (not res!86182) (not e!119910))))

(assert (=> b!182083 (= res!86182 (bvslt #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(declare-fun b!182084 () Bool)

(assert (=> b!182084 (= e!119915 (= (apply!154 lt!90065 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3567 thiss!1248)))))

(declare-fun b!182085 () Bool)

(declare-fun e!119916 () Bool)

(assert (=> b!182085 (= e!119916 e!119908)))

(declare-fun res!86178 () Bool)

(assert (=> b!182085 (= res!86178 call!18392)))

(assert (=> b!182085 (=> (not res!86178) (not e!119908))))

(declare-fun b!182086 () Bool)

(declare-fun res!86184 () Bool)

(assert (=> b!182086 (=> (not res!86184) (not e!119919))))

(assert (=> b!182086 (= res!86184 e!119916)))

(declare-fun c!32644 () Bool)

(assert (=> b!182086 (= c!32644 (not (= (bvand (extraKeys!3463 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!182087 () Bool)

(assert (=> b!182087 (= e!119914 call!18393)))

(declare-fun bm!18393 () Bool)

(assert (=> bm!18393 (= call!18394 (getCurrentListMapNoExtraKeys!187 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))))

(declare-fun b!182088 () Bool)

(assert (=> b!182088 (= e!119916 (not call!18392))))

(declare-fun bm!18394 () Bool)

(assert (=> bm!18394 (= call!18395 (+!274 (ite c!32645 call!18394 (ite c!32647 call!18391 call!18393)) (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))))))

(assert (= (and d!54541 c!32645) b!182069))

(assert (= (and d!54541 (not c!32645)) b!182075))

(assert (= (and b!182075 c!32647) b!182080))

(assert (= (and b!182075 (not c!32647)) b!182068))

(assert (= (and b!182068 c!32643) b!182078))

(assert (= (and b!182068 (not c!32643)) b!182087))

(assert (= (or b!182078 b!182087) bm!18388))

(assert (= (or b!182080 bm!18388) bm!18389))

(assert (= (or b!182080 b!182078) bm!18390))

(assert (= (or b!182069 bm!18389) bm!18393))

(assert (= (or b!182069 bm!18390) bm!18394))

(assert (= (and d!54541 res!86177) b!182079))

(assert (= (and d!54541 c!32646) b!182081))

(assert (= (and d!54541 (not c!32646)) b!182072))

(assert (= (and d!54541 res!86180) b!182083))

(assert (= (and b!182083 res!86182) b!182071))

(assert (= (and b!182083 (not res!86185)) b!182070))

(assert (= (and b!182070 res!86183) b!182077))

(assert (= (and b!182083 res!86181) b!182086))

(assert (= (and b!182086 c!32644) b!182085))

(assert (= (and b!182086 (not c!32644)) b!182088))

(assert (= (and b!182085 res!86178) b!182076))

(assert (= (or b!182085 b!182088) bm!18391))

(assert (= (and b!182086 res!86184) b!182073))

(assert (= (and b!182073 c!32648) b!182074))

(assert (= (and b!182073 (not c!32648)) b!182082))

(assert (= (and b!182074 res!86179) b!182084))

(assert (= (or b!182074 b!182082) bm!18392))

(declare-fun b_lambda!7163 () Bool)

(assert (=> (not b_lambda!7163) (not b!182077)))

(declare-fun t!7173 () Bool)

(declare-fun tb!2819 () Bool)

(assert (=> (and b!181988 (= (defaultEntry!3726 thiss!1248) (defaultEntry!3726 thiss!1248)) t!7173) tb!2819))

(declare-fun result!4735 () Bool)

(assert (=> tb!2819 (= result!4735 tp_is_empty!4263)))

(assert (=> b!182077 t!7173))

(declare-fun b_and!11051 () Bool)

(assert (= b_and!11047 (and (=> t!7173 result!4735) b_and!11051)))

(declare-fun m!209861 () Bool)

(assert (=> b!182069 m!209861))

(declare-fun m!209863 () Bool)

(assert (=> b!182076 m!209863))

(declare-fun m!209865 () Bool)

(assert (=> b!182081 m!209865))

(declare-fun m!209867 () Bool)

(assert (=> b!182081 m!209867))

(declare-fun m!209869 () Bool)

(assert (=> b!182081 m!209869))

(declare-fun m!209871 () Bool)

(assert (=> b!182081 m!209871))

(declare-fun m!209873 () Bool)

(assert (=> b!182081 m!209873))

(declare-fun m!209875 () Bool)

(assert (=> b!182081 m!209875))

(declare-fun m!209877 () Bool)

(assert (=> b!182081 m!209877))

(declare-fun m!209879 () Bool)

(assert (=> b!182081 m!209879))

(declare-fun m!209881 () Bool)

(assert (=> b!182081 m!209881))

(declare-fun m!209883 () Bool)

(assert (=> b!182081 m!209883))

(declare-fun m!209885 () Bool)

(assert (=> b!182081 m!209885))

(assert (=> b!182081 m!209883))

(declare-fun m!209887 () Bool)

(assert (=> b!182081 m!209887))

(declare-fun m!209889 () Bool)

(assert (=> b!182081 m!209889))

(assert (=> b!182081 m!209879))

(declare-fun m!209891 () Bool)

(assert (=> b!182081 m!209891))

(declare-fun m!209893 () Bool)

(assert (=> b!182081 m!209893))

(assert (=> b!182081 m!209877))

(declare-fun m!209895 () Bool)

(assert (=> b!182081 m!209895))

(assert (=> b!182081 m!209871))

(declare-fun m!209897 () Bool)

(assert (=> b!182081 m!209897))

(assert (=> b!182079 m!209875))

(assert (=> b!182079 m!209875))

(declare-fun m!209899 () Bool)

(assert (=> b!182079 m!209899))

(declare-fun m!209901 () Bool)

(assert (=> bm!18392 m!209901))

(assert (=> d!54541 m!209827))

(declare-fun m!209903 () Bool)

(assert (=> bm!18391 m!209903))

(assert (=> b!182077 m!209875))

(declare-fun m!209905 () Bool)

(assert (=> b!182077 m!209905))

(declare-fun m!209907 () Bool)

(assert (=> b!182077 m!209907))

(assert (=> b!182077 m!209875))

(assert (=> b!182077 m!209907))

(declare-fun m!209909 () Bool)

(assert (=> b!182077 m!209909))

(declare-fun m!209911 () Bool)

(assert (=> b!182077 m!209911))

(assert (=> b!182077 m!209909))

(assert (=> b!182070 m!209875))

(assert (=> b!182070 m!209875))

(declare-fun m!209913 () Bool)

(assert (=> b!182070 m!209913))

(assert (=> b!182071 m!209875))

(assert (=> b!182071 m!209875))

(assert (=> b!182071 m!209899))

(declare-fun m!209915 () Bool)

(assert (=> b!182084 m!209915))

(declare-fun m!209917 () Bool)

(assert (=> bm!18394 m!209917))

(assert (=> bm!18393 m!209893))

(assert (=> b!181983 d!54541))

(declare-fun d!54543 () Bool)

(declare-fun res!86192 () Bool)

(declare-fun e!119922 () Bool)

(assert (=> d!54543 (=> (not res!86192) (not e!119922))))

(declare-fun simpleValid!170 (LongMapFixedSize!2484) Bool)

(assert (=> d!54543 (= res!86192 (simpleValid!170 thiss!1248))))

(assert (=> d!54543 (= (valid!1029 thiss!1248) e!119922)))

(declare-fun b!182097 () Bool)

(declare-fun res!86193 () Bool)

(assert (=> b!182097 (=> (not res!86193) (not e!119922))))

(declare-fun arrayCountValidKeys!0 (array!7709 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182097 (= res!86193 (= (arrayCountValidKeys!0 (_keys!5633 thiss!1248) #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))) (_size!1291 thiss!1248)))))

(declare-fun b!182098 () Bool)

(declare-fun res!86194 () Bool)

(assert (=> b!182098 (=> (not res!86194) (not e!119922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7709 (_ BitVec 32)) Bool)

(assert (=> b!182098 (= res!86194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5633 thiss!1248) (mask!8759 thiss!1248)))))

(declare-fun b!182099 () Bool)

(declare-datatypes ((List!2314 0))(
  ( (Nil!2311) (Cons!2310 (h!2938 (_ BitVec 64)) (t!7174 List!2314)) )
))
(declare-fun arrayNoDuplicates!0 (array!7709 (_ BitVec 32) List!2314) Bool)

(assert (=> b!182099 (= e!119922 (arrayNoDuplicates!0 (_keys!5633 thiss!1248) #b00000000000000000000000000000000 Nil!2311))))

(assert (= (and d!54543 res!86192) b!182097))

(assert (= (and b!182097 res!86193) b!182098))

(assert (= (and b!182098 res!86194) b!182099))

(declare-fun m!209919 () Bool)

(assert (=> d!54543 m!209919))

(declare-fun m!209921 () Bool)

(assert (=> b!182097 m!209921))

(declare-fun m!209923 () Bool)

(assert (=> b!182098 m!209923))

(declare-fun m!209925 () Bool)

(assert (=> b!182099 m!209925))

(assert (=> start!18330 d!54543))

(declare-fun b!182112 () Bool)

(declare-fun e!119929 () SeekEntryResult!603)

(declare-fun e!119930 () SeekEntryResult!603)

(assert (=> b!182112 (= e!119929 e!119930)))

(declare-fun lt!90075 () (_ BitVec 64))

(declare-fun lt!90076 () SeekEntryResult!603)

(assert (=> b!182112 (= lt!90075 (select (arr!3647 (_keys!5633 thiss!1248)) (index!4584 lt!90076)))))

(declare-fun c!32657 () Bool)

(assert (=> b!182112 (= c!32657 (= lt!90075 key!828))))

(declare-fun b!182113 () Bool)

(declare-fun c!32656 () Bool)

(assert (=> b!182113 (= c!32656 (= lt!90075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119931 () SeekEntryResult!603)

(assert (=> b!182113 (= e!119930 e!119931)))

(declare-fun b!182114 () Bool)

(assert (=> b!182114 (= e!119930 (Found!603 (index!4584 lt!90076)))))

(declare-fun b!182115 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7709 (_ BitVec 32)) SeekEntryResult!603)

(assert (=> b!182115 (= e!119931 (seekKeyOrZeroReturnVacant!0 (x!19851 lt!90076) (index!4584 lt!90076) (index!4584 lt!90076) key!828 (_keys!5633 thiss!1248) (mask!8759 thiss!1248)))))

(declare-fun b!182116 () Bool)

(assert (=> b!182116 (= e!119931 (MissingZero!603 (index!4584 lt!90076)))))

(declare-fun b!182117 () Bool)

(assert (=> b!182117 (= e!119929 Undefined!603)))

(declare-fun d!54545 () Bool)

(declare-fun lt!90077 () SeekEntryResult!603)

(assert (=> d!54545 (and (or ((_ is Undefined!603) lt!90077) (not ((_ is Found!603) lt!90077)) (and (bvsge (index!4583 lt!90077) #b00000000000000000000000000000000) (bvslt (index!4583 lt!90077) (size!3958 (_keys!5633 thiss!1248))))) (or ((_ is Undefined!603) lt!90077) ((_ is Found!603) lt!90077) (not ((_ is MissingZero!603) lt!90077)) (and (bvsge (index!4582 lt!90077) #b00000000000000000000000000000000) (bvslt (index!4582 lt!90077) (size!3958 (_keys!5633 thiss!1248))))) (or ((_ is Undefined!603) lt!90077) ((_ is Found!603) lt!90077) ((_ is MissingZero!603) lt!90077) (not ((_ is MissingVacant!603) lt!90077)) (and (bvsge (index!4585 lt!90077) #b00000000000000000000000000000000) (bvslt (index!4585 lt!90077) (size!3958 (_keys!5633 thiss!1248))))) (or ((_ is Undefined!603) lt!90077) (ite ((_ is Found!603) lt!90077) (= (select (arr!3647 (_keys!5633 thiss!1248)) (index!4583 lt!90077)) key!828) (ite ((_ is MissingZero!603) lt!90077) (= (select (arr!3647 (_keys!5633 thiss!1248)) (index!4582 lt!90077)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!603) lt!90077) (= (select (arr!3647 (_keys!5633 thiss!1248)) (index!4585 lt!90077)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54545 (= lt!90077 e!119929)))

(declare-fun c!32655 () Bool)

(assert (=> d!54545 (= c!32655 (and ((_ is Intermediate!603) lt!90076) (undefined!1415 lt!90076)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7709 (_ BitVec 32)) SeekEntryResult!603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54545 (= lt!90076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8759 thiss!1248)) key!828 (_keys!5633 thiss!1248) (mask!8759 thiss!1248)))))

(assert (=> d!54545 (validMask!0 (mask!8759 thiss!1248))))

(assert (=> d!54545 (= (seekEntryOrOpen!0 key!828 (_keys!5633 thiss!1248) (mask!8759 thiss!1248)) lt!90077)))

(assert (= (and d!54545 c!32655) b!182117))

(assert (= (and d!54545 (not c!32655)) b!182112))

(assert (= (and b!182112 c!32657) b!182114))

(assert (= (and b!182112 (not c!32657)) b!182113))

(assert (= (and b!182113 c!32656) b!182116))

(assert (= (and b!182113 (not c!32656)) b!182115))

(declare-fun m!209927 () Bool)

(assert (=> b!182112 m!209927))

(declare-fun m!209929 () Bool)

(assert (=> b!182115 m!209929))

(declare-fun m!209931 () Bool)

(assert (=> d!54545 m!209931))

(assert (=> d!54545 m!209931))

(declare-fun m!209933 () Bool)

(assert (=> d!54545 m!209933))

(assert (=> d!54545 m!209827))

(declare-fun m!209935 () Bool)

(assert (=> d!54545 m!209935))

(declare-fun m!209937 () Bool)

(assert (=> d!54545 m!209937))

(declare-fun m!209939 () Bool)

(assert (=> d!54545 m!209939))

(assert (=> b!181989 d!54545))

(declare-fun d!54547 () Bool)

(assert (=> d!54547 (= (validMask!0 (mask!8759 thiss!1248)) (and (or (= (mask!8759 thiss!1248) #b00000000000000000000000000000111) (= (mask!8759 thiss!1248) #b00000000000000000000000000001111) (= (mask!8759 thiss!1248) #b00000000000000000000000000011111) (= (mask!8759 thiss!1248) #b00000000000000000000000000111111) (= (mask!8759 thiss!1248) #b00000000000000000000000001111111) (= (mask!8759 thiss!1248) #b00000000000000000000000011111111) (= (mask!8759 thiss!1248) #b00000000000000000000000111111111) (= (mask!8759 thiss!1248) #b00000000000000000000001111111111) (= (mask!8759 thiss!1248) #b00000000000000000000011111111111) (= (mask!8759 thiss!1248) #b00000000000000000000111111111111) (= (mask!8759 thiss!1248) #b00000000000000000001111111111111) (= (mask!8759 thiss!1248) #b00000000000000000011111111111111) (= (mask!8759 thiss!1248) #b00000000000000000111111111111111) (= (mask!8759 thiss!1248) #b00000000000000001111111111111111) (= (mask!8759 thiss!1248) #b00000000000000011111111111111111) (= (mask!8759 thiss!1248) #b00000000000000111111111111111111) (= (mask!8759 thiss!1248) #b00000000000001111111111111111111) (= (mask!8759 thiss!1248) #b00000000000011111111111111111111) (= (mask!8759 thiss!1248) #b00000000000111111111111111111111) (= (mask!8759 thiss!1248) #b00000000001111111111111111111111) (= (mask!8759 thiss!1248) #b00000000011111111111111111111111) (= (mask!8759 thiss!1248) #b00000000111111111111111111111111) (= (mask!8759 thiss!1248) #b00000001111111111111111111111111) (= (mask!8759 thiss!1248) #b00000011111111111111111111111111) (= (mask!8759 thiss!1248) #b00000111111111111111111111111111) (= (mask!8759 thiss!1248) #b00001111111111111111111111111111) (= (mask!8759 thiss!1248) #b00011111111111111111111111111111) (= (mask!8759 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8759 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!181986 d!54547))

(declare-fun b!182125 () Bool)

(declare-fun e!119936 () Bool)

(assert (=> b!182125 (= e!119936 tp_is_empty!4263)))

(declare-fun mapNonEmpty!7318 () Bool)

(declare-fun mapRes!7318 () Bool)

(declare-fun tp!16237 () Bool)

(declare-fun e!119937 () Bool)

(assert (=> mapNonEmpty!7318 (= mapRes!7318 (and tp!16237 e!119937))))

(declare-fun mapKey!7318 () (_ BitVec 32))

(declare-fun mapValue!7318 () ValueCell!1788)

(declare-fun mapRest!7318 () (Array (_ BitVec 32) ValueCell!1788))

(assert (=> mapNonEmpty!7318 (= mapRest!7312 (store mapRest!7318 mapKey!7318 mapValue!7318))))

(declare-fun b!182124 () Bool)

(assert (=> b!182124 (= e!119937 tp_is_empty!4263)))

(declare-fun mapIsEmpty!7318 () Bool)

(assert (=> mapIsEmpty!7318 mapRes!7318))

(declare-fun condMapEmpty!7318 () Bool)

(declare-fun mapDefault!7318 () ValueCell!1788)

(assert (=> mapNonEmpty!7312 (= condMapEmpty!7318 (= mapRest!7312 ((as const (Array (_ BitVec 32) ValueCell!1788)) mapDefault!7318)))))

(assert (=> mapNonEmpty!7312 (= tp!16228 (and e!119936 mapRes!7318))))

(assert (= (and mapNonEmpty!7312 condMapEmpty!7318) mapIsEmpty!7318))

(assert (= (and mapNonEmpty!7312 (not condMapEmpty!7318)) mapNonEmpty!7318))

(assert (= (and mapNonEmpty!7318 ((_ is ValueCellFull!1788) mapValue!7318)) b!182124))

(assert (= (and mapNonEmpty!7312 ((_ is ValueCellFull!1788) mapDefault!7318)) b!182125))

(declare-fun m!209941 () Bool)

(assert (=> mapNonEmpty!7318 m!209941))

(declare-fun b_lambda!7165 () Bool)

(assert (= b_lambda!7163 (or (and b!181988 b_free!4491) b_lambda!7165)))

(check-sat (not d!54539) (not b!182070) (not b_next!4491) (not b!182069) tp_is_empty!4263 (not bm!18394) (not d!54545) (not b!182079) (not bm!18392) (not mapNonEmpty!7318) (not b!182098) (not bm!18393) (not b!182076) (not b!182115) (not b!182097) (not bm!18391) (not d!54543) b_and!11051 (not b!182081) (not b_lambda!7165) (not b!182077) (not b!182023) (not b!182025) (not b!182084) (not d!54541) (not b!182099) (not b!182071))
(check-sat b_and!11051 (not b_next!4491))
(get-model)

(declare-fun d!54549 () Bool)

(declare-fun e!119940 () Bool)

(assert (=> d!54549 e!119940))

(declare-fun res!86199 () Bool)

(assert (=> d!54549 (=> (not res!86199) (not e!119940))))

(declare-fun lt!90088 () ListLongMap!2311)

(assert (=> d!54549 (= res!86199 (contains!1253 lt!90088 (_1!1708 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))))))

(declare-fun lt!90089 () List!2313)

(assert (=> d!54549 (= lt!90088 (ListLongMap!2312 lt!90089))))

(declare-fun lt!90087 () Unit!5524)

(declare-fun lt!90086 () Unit!5524)

(assert (=> d!54549 (= lt!90087 lt!90086)))

(assert (=> d!54549 (= (getValueByKey!211 lt!90089 (_1!1708 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))) (Some!216 (_2!1708 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!112 (List!2313 (_ BitVec 64) V!5331) Unit!5524)

(assert (=> d!54549 (= lt!90086 (lemmaContainsTupThenGetReturnValue!112 lt!90089 (_1!1708 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))) (_2!1708 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))))))

(declare-fun insertStrictlySorted!115 (List!2313 (_ BitVec 64) V!5331) List!2313)

(assert (=> d!54549 (= lt!90089 (insertStrictlySorted!115 (toList!1171 call!18395) (_1!1708 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))) (_2!1708 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))))))

(assert (=> d!54549 (= (+!274 call!18395 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))) lt!90088)))

(declare-fun b!182130 () Bool)

(declare-fun res!86200 () Bool)

(assert (=> b!182130 (=> (not res!86200) (not e!119940))))

(assert (=> b!182130 (= res!86200 (= (getValueByKey!211 (toList!1171 lt!90088) (_1!1708 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))) (Some!216 (_2!1708 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))))))))

(declare-fun b!182131 () Bool)

(declare-fun contains!1254 (List!2313 tuple2!3394) Bool)

(assert (=> b!182131 (= e!119940 (contains!1254 (toList!1171 lt!90088) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))))))

(assert (= (and d!54549 res!86199) b!182130))

(assert (= (and b!182130 res!86200) b!182131))

(declare-fun m!209943 () Bool)

(assert (=> d!54549 m!209943))

(declare-fun m!209945 () Bool)

(assert (=> d!54549 m!209945))

(declare-fun m!209947 () Bool)

(assert (=> d!54549 m!209947))

(declare-fun m!209949 () Bool)

(assert (=> d!54549 m!209949))

(declare-fun m!209951 () Bool)

(assert (=> b!182130 m!209951))

(declare-fun m!209953 () Bool)

(assert (=> b!182131 m!209953))

(assert (=> b!182069 d!54549))

(declare-fun d!54551 () Bool)

(declare-fun get!2089 (Option!217) V!5331)

(assert (=> d!54551 (= (apply!154 lt!90065 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)) (get!2089 (getValueByKey!211 (toList!1171 lt!90065) (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7425 () Bool)

(assert (= bs!7425 d!54551))

(assert (=> bs!7425 m!209875))

(declare-fun m!209955 () Bool)

(assert (=> bs!7425 m!209955))

(assert (=> bs!7425 m!209955))

(declare-fun m!209957 () Bool)

(assert (=> bs!7425 m!209957))

(assert (=> b!182077 d!54551))

(declare-fun d!54553 () Bool)

(declare-fun c!32660 () Bool)

(assert (=> d!54553 (= c!32660 ((_ is ValueCellFull!1788) (select (arr!3648 (_values!3709 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119943 () V!5331)

(assert (=> d!54553 (= (get!2088 (select (arr!3648 (_values!3709 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3726 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119943)))

(declare-fun b!182136 () Bool)

(declare-fun get!2090 (ValueCell!1788 V!5331) V!5331)

(assert (=> b!182136 (= e!119943 (get!2090 (select (arr!3648 (_values!3709 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3726 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182137 () Bool)

(declare-fun get!2091 (ValueCell!1788 V!5331) V!5331)

(assert (=> b!182137 (= e!119943 (get!2091 (select (arr!3648 (_values!3709 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3726 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54553 c!32660) b!182136))

(assert (= (and d!54553 (not c!32660)) b!182137))

(assert (=> b!182136 m!209907))

(assert (=> b!182136 m!209909))

(declare-fun m!209959 () Bool)

(assert (=> b!182136 m!209959))

(assert (=> b!182137 m!209907))

(assert (=> b!182137 m!209909))

(declare-fun m!209961 () Bool)

(assert (=> b!182137 m!209961))

(assert (=> b!182077 d!54553))

(declare-fun d!54555 () Bool)

(assert (=> d!54555 (= (apply!154 lt!90065 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2089 (getValueByKey!211 (toList!1171 lt!90065) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7426 () Bool)

(assert (= bs!7426 d!54555))

(declare-fun m!209963 () Bool)

(assert (=> bs!7426 m!209963))

(assert (=> bs!7426 m!209963))

(declare-fun m!209965 () Bool)

(assert (=> bs!7426 m!209965))

(assert (=> b!182076 d!54555))

(declare-fun d!54557 () Bool)

(declare-fun e!119944 () Bool)

(assert (=> d!54557 e!119944))

(declare-fun res!86201 () Bool)

(assert (=> d!54557 (=> res!86201 e!119944)))

(declare-fun lt!90093 () Bool)

(assert (=> d!54557 (= res!86201 (not lt!90093))))

(declare-fun lt!90092 () Bool)

(assert (=> d!54557 (= lt!90093 lt!90092)))

(declare-fun lt!90091 () Unit!5524)

(declare-fun e!119945 () Unit!5524)

(assert (=> d!54557 (= lt!90091 e!119945)))

(declare-fun c!32661 () Bool)

(assert (=> d!54557 (= c!32661 lt!90092)))

(assert (=> d!54557 (= lt!90092 (containsKey!215 (toList!1171 lt!90065) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54557 (= (contains!1253 lt!90065 #b0000000000000000000000000000000000000000000000000000000000000000) lt!90093)))

(declare-fun b!182138 () Bool)

(declare-fun lt!90090 () Unit!5524)

(assert (=> b!182138 (= e!119945 lt!90090)))

(assert (=> b!182138 (= lt!90090 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1171 lt!90065) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182138 (isDefined!164 (getValueByKey!211 (toList!1171 lt!90065) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182139 () Bool)

(declare-fun Unit!5528 () Unit!5524)

(assert (=> b!182139 (= e!119945 Unit!5528)))

(declare-fun b!182140 () Bool)

(assert (=> b!182140 (= e!119944 (isDefined!164 (getValueByKey!211 (toList!1171 lt!90065) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54557 c!32661) b!182138))

(assert (= (and d!54557 (not c!32661)) b!182139))

(assert (= (and d!54557 (not res!86201)) b!182140))

(declare-fun m!209967 () Bool)

(assert (=> d!54557 m!209967))

(declare-fun m!209969 () Bool)

(assert (=> b!182138 m!209969))

(assert (=> b!182138 m!209963))

(assert (=> b!182138 m!209963))

(declare-fun m!209971 () Bool)

(assert (=> b!182138 m!209971))

(assert (=> b!182140 m!209963))

(assert (=> b!182140 m!209963))

(assert (=> b!182140 m!209971))

(assert (=> bm!18391 d!54557))

(declare-fun d!54559 () Bool)

(assert (=> d!54559 (= (validKeyInArray!0 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182071 d!54559))

(declare-fun b!182165 () Bool)

(declare-fun e!119961 () Bool)

(declare-fun e!119965 () Bool)

(assert (=> b!182165 (= e!119961 e!119965)))

(assert (=> b!182165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(declare-fun res!86212 () Bool)

(declare-fun lt!90114 () ListLongMap!2311)

(assert (=> b!182165 (= res!86212 (contains!1253 lt!90114 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182165 (=> (not res!86212) (not e!119965))))

(declare-fun b!182166 () Bool)

(declare-fun e!119960 () ListLongMap!2311)

(declare-fun e!119966 () ListLongMap!2311)

(assert (=> b!182166 (= e!119960 e!119966)))

(declare-fun c!32673 () Bool)

(assert (=> b!182166 (= c!32673 (validKeyInArray!0 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182167 () Bool)

(declare-fun res!86211 () Bool)

(declare-fun e!119962 () Bool)

(assert (=> b!182167 (=> (not res!86211) (not e!119962))))

(assert (=> b!182167 (= res!86211 (not (contains!1253 lt!90114 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182168 () Bool)

(declare-fun e!119963 () Bool)

(assert (=> b!182168 (= e!119961 e!119963)))

(declare-fun c!32670 () Bool)

(assert (=> b!182168 (= c!32670 (bvslt #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(declare-fun b!182169 () Bool)

(assert (=> b!182169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(assert (=> b!182169 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3959 (_values!3709 thiss!1248))))))

(assert (=> b!182169 (= e!119965 (= (apply!154 lt!90114 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)) (get!2088 (select (arr!3648 (_values!3709 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3726 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!182170 () Bool)

(assert (=> b!182170 (= e!119963 (= lt!90114 (getCurrentListMapNoExtraKeys!187 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3726 thiss!1248))))))

(declare-fun b!182171 () Bool)

(declare-fun lt!90113 () Unit!5524)

(declare-fun lt!90110 () Unit!5524)

(assert (=> b!182171 (= lt!90113 lt!90110)))

(declare-fun lt!90111 () (_ BitVec 64))

(declare-fun lt!90112 () V!5331)

(declare-fun lt!90108 () ListLongMap!2311)

(declare-fun lt!90109 () (_ BitVec 64))

(assert (=> b!182171 (not (contains!1253 (+!274 lt!90108 (tuple2!3395 lt!90109 lt!90112)) lt!90111))))

(declare-fun addStillNotContains!84 (ListLongMap!2311 (_ BitVec 64) V!5331 (_ BitVec 64)) Unit!5524)

(assert (=> b!182171 (= lt!90110 (addStillNotContains!84 lt!90108 lt!90109 lt!90112 lt!90111))))

(assert (=> b!182171 (= lt!90111 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!182171 (= lt!90112 (get!2088 (select (arr!3648 (_values!3709 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3726 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182171 (= lt!90109 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!18400 () ListLongMap!2311)

(assert (=> b!182171 (= lt!90108 call!18400)))

(assert (=> b!182171 (= e!119966 (+!274 call!18400 (tuple2!3395 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000) (get!2088 (select (arr!3648 (_values!3709 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3726 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!54561 () Bool)

(assert (=> d!54561 e!119962))

(declare-fun res!86213 () Bool)

(assert (=> d!54561 (=> (not res!86213) (not e!119962))))

(assert (=> d!54561 (= res!86213 (not (contains!1253 lt!90114 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54561 (= lt!90114 e!119960)))

(declare-fun c!32671 () Bool)

(assert (=> d!54561 (= c!32671 (bvsge #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(assert (=> d!54561 (validMask!0 (mask!8759 thiss!1248))))

(assert (=> d!54561 (= (getCurrentListMapNoExtraKeys!187 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)) lt!90114)))

(declare-fun b!182172 () Bool)

(assert (=> b!182172 (= e!119962 e!119961)))

(declare-fun c!32672 () Bool)

(declare-fun e!119964 () Bool)

(assert (=> b!182172 (= c!32672 e!119964)))

(declare-fun res!86210 () Bool)

(assert (=> b!182172 (=> (not res!86210) (not e!119964))))

(assert (=> b!182172 (= res!86210 (bvslt #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(declare-fun b!182173 () Bool)

(assert (=> b!182173 (= e!119966 call!18400)))

(declare-fun b!182174 () Bool)

(assert (=> b!182174 (= e!119964 (validKeyInArray!0 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182174 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!18397 () Bool)

(assert (=> bm!18397 (= call!18400 (getCurrentListMapNoExtraKeys!187 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3726 thiss!1248)))))

(declare-fun b!182175 () Bool)

(declare-fun isEmpty!461 (ListLongMap!2311) Bool)

(assert (=> b!182175 (= e!119963 (isEmpty!461 lt!90114))))

(declare-fun b!182176 () Bool)

(assert (=> b!182176 (= e!119960 (ListLongMap!2312 Nil!2310))))

(assert (= (and d!54561 c!32671) b!182176))

(assert (= (and d!54561 (not c!32671)) b!182166))

(assert (= (and b!182166 c!32673) b!182171))

(assert (= (and b!182166 (not c!32673)) b!182173))

(assert (= (or b!182171 b!182173) bm!18397))

(assert (= (and d!54561 res!86213) b!182167))

(assert (= (and b!182167 res!86211) b!182172))

(assert (= (and b!182172 res!86210) b!182174))

(assert (= (and b!182172 c!32672) b!182165))

(assert (= (and b!182172 (not c!32672)) b!182168))

(assert (= (and b!182165 res!86212) b!182169))

(assert (= (and b!182168 c!32670) b!182170))

(assert (= (and b!182168 (not c!32670)) b!182175))

(declare-fun b_lambda!7167 () Bool)

(assert (=> (not b_lambda!7167) (not b!182169)))

(assert (=> b!182169 t!7173))

(declare-fun b_and!11053 () Bool)

(assert (= b_and!11051 (and (=> t!7173 result!4735) b_and!11053)))

(declare-fun b_lambda!7169 () Bool)

(assert (=> (not b_lambda!7169) (not b!182171)))

(assert (=> b!182171 t!7173))

(declare-fun b_and!11055 () Bool)

(assert (= b_and!11053 (and (=> t!7173 result!4735) b_and!11055)))

(assert (=> b!182166 m!209875))

(assert (=> b!182166 m!209875))

(assert (=> b!182166 m!209899))

(assert (=> b!182169 m!209875))

(declare-fun m!209973 () Bool)

(assert (=> b!182169 m!209973))

(assert (=> b!182169 m!209907))

(assert (=> b!182169 m!209909))

(assert (=> b!182169 m!209875))

(assert (=> b!182169 m!209907))

(assert (=> b!182169 m!209909))

(assert (=> b!182169 m!209911))

(declare-fun m!209975 () Bool)

(assert (=> b!182170 m!209975))

(declare-fun m!209977 () Bool)

(assert (=> b!182171 m!209977))

(declare-fun m!209979 () Bool)

(assert (=> b!182171 m!209979))

(assert (=> b!182171 m!209907))

(assert (=> b!182171 m!209875))

(assert (=> b!182171 m!209907))

(assert (=> b!182171 m!209909))

(assert (=> b!182171 m!209911))

(declare-fun m!209981 () Bool)

(assert (=> b!182171 m!209981))

(assert (=> b!182171 m!209977))

(declare-fun m!209983 () Bool)

(assert (=> b!182171 m!209983))

(assert (=> b!182171 m!209909))

(assert (=> bm!18397 m!209975))

(assert (=> b!182165 m!209875))

(assert (=> b!182165 m!209875))

(declare-fun m!209985 () Bool)

(assert (=> b!182165 m!209985))

(declare-fun m!209987 () Bool)

(assert (=> d!54561 m!209987))

(assert (=> d!54561 m!209827))

(declare-fun m!209989 () Bool)

(assert (=> b!182175 m!209989))

(assert (=> b!182174 m!209875))

(assert (=> b!182174 m!209875))

(assert (=> b!182174 m!209899))

(declare-fun m!209991 () Bool)

(assert (=> b!182167 m!209991))

(assert (=> bm!18393 d!54561))

(assert (=> b!182079 d!54559))

(declare-fun d!54563 () Bool)

(declare-fun e!119967 () Bool)

(assert (=> d!54563 e!119967))

(declare-fun res!86214 () Bool)

(assert (=> d!54563 (=> res!86214 e!119967)))

(declare-fun lt!90118 () Bool)

(assert (=> d!54563 (= res!86214 (not lt!90118))))

(declare-fun lt!90117 () Bool)

(assert (=> d!54563 (= lt!90118 lt!90117)))

(declare-fun lt!90116 () Unit!5524)

(declare-fun e!119968 () Unit!5524)

(assert (=> d!54563 (= lt!90116 e!119968)))

(declare-fun c!32674 () Bool)

(assert (=> d!54563 (= c!32674 lt!90117)))

(assert (=> d!54563 (= lt!90117 (containsKey!215 (toList!1171 lt!90065) (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54563 (= (contains!1253 lt!90065 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)) lt!90118)))

(declare-fun b!182177 () Bool)

(declare-fun lt!90115 () Unit!5524)

(assert (=> b!182177 (= e!119968 lt!90115)))

(assert (=> b!182177 (= lt!90115 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1171 lt!90065) (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182177 (isDefined!164 (getValueByKey!211 (toList!1171 lt!90065) (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182178 () Bool)

(declare-fun Unit!5529 () Unit!5524)

(assert (=> b!182178 (= e!119968 Unit!5529)))

(declare-fun b!182179 () Bool)

(assert (=> b!182179 (= e!119967 (isDefined!164 (getValueByKey!211 (toList!1171 lt!90065) (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54563 c!32674) b!182177))

(assert (= (and d!54563 (not c!32674)) b!182178))

(assert (= (and d!54563 (not res!86214)) b!182179))

(assert (=> d!54563 m!209875))

(declare-fun m!209993 () Bool)

(assert (=> d!54563 m!209993))

(assert (=> b!182177 m!209875))

(declare-fun m!209995 () Bool)

(assert (=> b!182177 m!209995))

(assert (=> b!182177 m!209875))

(assert (=> b!182177 m!209955))

(assert (=> b!182177 m!209955))

(declare-fun m!209997 () Bool)

(assert (=> b!182177 m!209997))

(assert (=> b!182179 m!209875))

(assert (=> b!182179 m!209955))

(assert (=> b!182179 m!209955))

(assert (=> b!182179 m!209997))

(assert (=> b!182070 d!54563))

(declare-fun d!54565 () Bool)

(declare-fun res!86219 () Bool)

(declare-fun e!119973 () Bool)

(assert (=> d!54565 (=> res!86219 e!119973)))

(assert (=> d!54565 (= res!86219 (and ((_ is Cons!2309) (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))) (= (_1!1708 (h!2937 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))))) key!828)))))

(assert (=> d!54565 (= (containsKey!215 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828) e!119973)))

(declare-fun b!182184 () Bool)

(declare-fun e!119974 () Bool)

(assert (=> b!182184 (= e!119973 e!119974)))

(declare-fun res!86220 () Bool)

(assert (=> b!182184 (=> (not res!86220) (not e!119974))))

(assert (=> b!182184 (= res!86220 (and (or (not ((_ is Cons!2309) (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))))) (bvsle (_1!1708 (h!2937 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))))) key!828)) ((_ is Cons!2309) (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))) (bvslt (_1!1708 (h!2937 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))))) key!828)))))

(declare-fun b!182185 () Bool)

(assert (=> b!182185 (= e!119974 (containsKey!215 (t!7171 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))) key!828))))

(assert (= (and d!54565 (not res!86219)) b!182184))

(assert (= (and b!182184 res!86220) b!182185))

(declare-fun m!209999 () Bool)

(assert (=> b!182185 m!209999))

(assert (=> d!54539 d!54565))

(declare-fun d!54567 () Bool)

(declare-fun isEmpty!462 (Option!217) Bool)

(assert (=> d!54567 (= (isDefined!164 (getValueByKey!211 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828)) (not (isEmpty!462 (getValueByKey!211 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828))))))

(declare-fun bs!7427 () Bool)

(assert (= bs!7427 d!54567))

(assert (=> bs!7427 m!209857))

(declare-fun m!210001 () Bool)

(assert (=> bs!7427 m!210001))

(assert (=> b!182025 d!54567))

(declare-fun b!182195 () Bool)

(declare-fun e!119979 () Option!217)

(declare-fun e!119980 () Option!217)

(assert (=> b!182195 (= e!119979 e!119980)))

(declare-fun c!32680 () Bool)

(assert (=> b!182195 (= c!32680 (and ((_ is Cons!2309) (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))) (not (= (_1!1708 (h!2937 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))))) key!828))))))

(declare-fun b!182194 () Bool)

(assert (=> b!182194 (= e!119979 (Some!216 (_2!1708 (h!2937 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))))))))

(declare-fun b!182196 () Bool)

(assert (=> b!182196 (= e!119980 (getValueByKey!211 (t!7171 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))) key!828))))

(declare-fun b!182197 () Bool)

(assert (=> b!182197 (= e!119980 None!215)))

(declare-fun d!54569 () Bool)

(declare-fun c!32679 () Bool)

(assert (=> d!54569 (= c!32679 (and ((_ is Cons!2309) (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))) (= (_1!1708 (h!2937 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))))) key!828)))))

(assert (=> d!54569 (= (getValueByKey!211 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828) e!119979)))

(assert (= (and d!54569 c!32679) b!182194))

(assert (= (and d!54569 (not c!32679)) b!182195))

(assert (= (and b!182195 c!32680) b!182196))

(assert (= (and b!182195 (not c!32680)) b!182197))

(declare-fun m!210003 () Bool)

(assert (=> b!182196 m!210003))

(assert (=> b!182025 d!54569))

(declare-fun bm!18400 () Bool)

(declare-fun call!18403 () (_ BitVec 32))

(assert (=> bm!18400 (= call!18403 (arrayCountValidKeys!0 (_keys!5633 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3958 (_keys!5633 thiss!1248))))))

(declare-fun b!182206 () Bool)

(declare-fun e!119985 () (_ BitVec 32))

(assert (=> b!182206 (= e!119985 (bvadd #b00000000000000000000000000000001 call!18403))))

(declare-fun d!54571 () Bool)

(declare-fun lt!90121 () (_ BitVec 32))

(assert (=> d!54571 (and (bvsge lt!90121 #b00000000000000000000000000000000) (bvsle lt!90121 (bvsub (size!3958 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119986 () (_ BitVec 32))

(assert (=> d!54571 (= lt!90121 e!119986)))

(declare-fun c!32685 () Bool)

(assert (=> d!54571 (= c!32685 (bvsge #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(assert (=> d!54571 (and (bvsle #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3958 (_keys!5633 thiss!1248)) (size!3958 (_keys!5633 thiss!1248))))))

(assert (=> d!54571 (= (arrayCountValidKeys!0 (_keys!5633 thiss!1248) #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))) lt!90121)))

(declare-fun b!182207 () Bool)

(assert (=> b!182207 (= e!119985 call!18403)))

(declare-fun b!182208 () Bool)

(assert (=> b!182208 (= e!119986 #b00000000000000000000000000000000)))

(declare-fun b!182209 () Bool)

(assert (=> b!182209 (= e!119986 e!119985)))

(declare-fun c!32686 () Bool)

(assert (=> b!182209 (= c!32686 (validKeyInArray!0 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54571 c!32685) b!182208))

(assert (= (and d!54571 (not c!32685)) b!182209))

(assert (= (and b!182209 c!32686) b!182206))

(assert (= (and b!182209 (not c!32686)) b!182207))

(assert (= (or b!182206 b!182207) bm!18400))

(declare-fun m!210005 () Bool)

(assert (=> bm!18400 m!210005))

(assert (=> b!182209 m!209875))

(assert (=> b!182209 m!209875))

(assert (=> b!182209 m!209899))

(assert (=> b!182097 d!54571))

(declare-fun d!54573 () Bool)

(assert (=> d!54573 (= (apply!154 (+!274 lt!90049 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248))) lt!90068) (apply!154 lt!90049 lt!90068))))

(declare-fun lt!90124 () Unit!5524)

(declare-fun choose!967 (ListLongMap!2311 (_ BitVec 64) V!5331 (_ BitVec 64)) Unit!5524)

(assert (=> d!54573 (= lt!90124 (choose!967 lt!90049 lt!90052 (minValue!3567 thiss!1248) lt!90068))))

(declare-fun e!119989 () Bool)

(assert (=> d!54573 e!119989))

(declare-fun res!86223 () Bool)

(assert (=> d!54573 (=> (not res!86223) (not e!119989))))

(assert (=> d!54573 (= res!86223 (contains!1253 lt!90049 lt!90068))))

(assert (=> d!54573 (= (addApplyDifferent!130 lt!90049 lt!90052 (minValue!3567 thiss!1248) lt!90068) lt!90124)))

(declare-fun b!182213 () Bool)

(assert (=> b!182213 (= e!119989 (not (= lt!90068 lt!90052)))))

(assert (= (and d!54573 res!86223) b!182213))

(assert (=> d!54573 m!209865))

(declare-fun m!210007 () Bool)

(assert (=> d!54573 m!210007))

(declare-fun m!210009 () Bool)

(assert (=> d!54573 m!210009))

(assert (=> d!54573 m!209877))

(assert (=> d!54573 m!209895))

(assert (=> d!54573 m!209877))

(assert (=> b!182081 d!54573))

(declare-fun d!54575 () Bool)

(declare-fun e!119990 () Bool)

(assert (=> d!54575 e!119990))

(declare-fun res!86224 () Bool)

(assert (=> d!54575 (=> res!86224 e!119990)))

(declare-fun lt!90128 () Bool)

(assert (=> d!54575 (= res!86224 (not lt!90128))))

(declare-fun lt!90127 () Bool)

(assert (=> d!54575 (= lt!90128 lt!90127)))

(declare-fun lt!90126 () Unit!5524)

(declare-fun e!119991 () Unit!5524)

(assert (=> d!54575 (= lt!90126 e!119991)))

(declare-fun c!32687 () Bool)

(assert (=> d!54575 (= c!32687 lt!90127)))

(assert (=> d!54575 (= lt!90127 (containsKey!215 (toList!1171 (+!274 lt!90064 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248)))) lt!90055))))

(assert (=> d!54575 (= (contains!1253 (+!274 lt!90064 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248))) lt!90055) lt!90128)))

(declare-fun b!182214 () Bool)

(declare-fun lt!90125 () Unit!5524)

(assert (=> b!182214 (= e!119991 lt!90125)))

(assert (=> b!182214 (= lt!90125 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1171 (+!274 lt!90064 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248)))) lt!90055))))

(assert (=> b!182214 (isDefined!164 (getValueByKey!211 (toList!1171 (+!274 lt!90064 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248)))) lt!90055))))

(declare-fun b!182215 () Bool)

(declare-fun Unit!5530 () Unit!5524)

(assert (=> b!182215 (= e!119991 Unit!5530)))

(declare-fun b!182216 () Bool)

(assert (=> b!182216 (= e!119990 (isDefined!164 (getValueByKey!211 (toList!1171 (+!274 lt!90064 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248)))) lt!90055)))))

(assert (= (and d!54575 c!32687) b!182214))

(assert (= (and d!54575 (not c!32687)) b!182215))

(assert (= (and d!54575 (not res!86224)) b!182216))

(declare-fun m!210011 () Bool)

(assert (=> d!54575 m!210011))

(declare-fun m!210013 () Bool)

(assert (=> b!182214 m!210013))

(declare-fun m!210015 () Bool)

(assert (=> b!182214 m!210015))

(assert (=> b!182214 m!210015))

(declare-fun m!210017 () Bool)

(assert (=> b!182214 m!210017))

(assert (=> b!182216 m!210015))

(assert (=> b!182216 m!210015))

(assert (=> b!182216 m!210017))

(assert (=> b!182081 d!54575))

(declare-fun d!54577 () Bool)

(assert (=> d!54577 (= (apply!154 (+!274 lt!90058 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248))) lt!90061) (apply!154 lt!90058 lt!90061))))

(declare-fun lt!90129 () Unit!5524)

(assert (=> d!54577 (= lt!90129 (choose!967 lt!90058 lt!90056 (minValue!3567 thiss!1248) lt!90061))))

(declare-fun e!119992 () Bool)

(assert (=> d!54577 e!119992))

(declare-fun res!86225 () Bool)

(assert (=> d!54577 (=> (not res!86225) (not e!119992))))

(assert (=> d!54577 (= res!86225 (contains!1253 lt!90058 lt!90061))))

(assert (=> d!54577 (= (addApplyDifferent!130 lt!90058 lt!90056 (minValue!3567 thiss!1248) lt!90061) lt!90129)))

(declare-fun b!182217 () Bool)

(assert (=> b!182217 (= e!119992 (not (= lt!90061 lt!90056)))))

(assert (= (and d!54577 res!86225) b!182217))

(assert (=> d!54577 m!209885))

(declare-fun m!210019 () Bool)

(assert (=> d!54577 m!210019))

(declare-fun m!210021 () Bool)

(assert (=> d!54577 m!210021))

(assert (=> d!54577 m!209871))

(assert (=> d!54577 m!209873))

(assert (=> d!54577 m!209871))

(assert (=> b!182081 d!54577))

(declare-fun d!54579 () Bool)

(assert (=> d!54579 (= (apply!154 (+!274 lt!90058 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248))) lt!90061) (get!2089 (getValueByKey!211 (toList!1171 (+!274 lt!90058 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248)))) lt!90061)))))

(declare-fun bs!7428 () Bool)

(assert (= bs!7428 d!54579))

(declare-fun m!210023 () Bool)

(assert (=> bs!7428 m!210023))

(assert (=> bs!7428 m!210023))

(declare-fun m!210025 () Bool)

(assert (=> bs!7428 m!210025))

(assert (=> b!182081 d!54579))

(declare-fun d!54581 () Bool)

(declare-fun e!119993 () Bool)

(assert (=> d!54581 e!119993))

(declare-fun res!86226 () Bool)

(assert (=> d!54581 (=> (not res!86226) (not e!119993))))

(declare-fun lt!90132 () ListLongMap!2311)

(assert (=> d!54581 (= res!86226 (contains!1253 lt!90132 (_1!1708 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248)))))))

(declare-fun lt!90133 () List!2313)

(assert (=> d!54581 (= lt!90132 (ListLongMap!2312 lt!90133))))

(declare-fun lt!90131 () Unit!5524)

(declare-fun lt!90130 () Unit!5524)

(assert (=> d!54581 (= lt!90131 lt!90130)))

(assert (=> d!54581 (= (getValueByKey!211 lt!90133 (_1!1708 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248)))) (Some!216 (_2!1708 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248)))))))

(assert (=> d!54581 (= lt!90130 (lemmaContainsTupThenGetReturnValue!112 lt!90133 (_1!1708 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248))) (_2!1708 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248)))))))

(assert (=> d!54581 (= lt!90133 (insertStrictlySorted!115 (toList!1171 lt!90058) (_1!1708 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248))) (_2!1708 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248)))))))

(assert (=> d!54581 (= (+!274 lt!90058 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248))) lt!90132)))

(declare-fun b!182218 () Bool)

(declare-fun res!86227 () Bool)

(assert (=> b!182218 (=> (not res!86227) (not e!119993))))

(assert (=> b!182218 (= res!86227 (= (getValueByKey!211 (toList!1171 lt!90132) (_1!1708 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248)))) (Some!216 (_2!1708 (tuple2!3395 lt!90056 (minValue!3567 thiss!1248))))))))

(declare-fun b!182219 () Bool)

(assert (=> b!182219 (= e!119993 (contains!1254 (toList!1171 lt!90132) (tuple2!3395 lt!90056 (minValue!3567 thiss!1248))))))

(assert (= (and d!54581 res!86226) b!182218))

(assert (= (and b!182218 res!86227) b!182219))

(declare-fun m!210027 () Bool)

(assert (=> d!54581 m!210027))

(declare-fun m!210029 () Bool)

(assert (=> d!54581 m!210029))

(declare-fun m!210031 () Bool)

(assert (=> d!54581 m!210031))

(declare-fun m!210033 () Bool)

(assert (=> d!54581 m!210033))

(declare-fun m!210035 () Bool)

(assert (=> b!182218 m!210035))

(declare-fun m!210037 () Bool)

(assert (=> b!182219 m!210037))

(assert (=> b!182081 d!54581))

(declare-fun d!54583 () Bool)

(assert (=> d!54583 (= (apply!154 (+!274 lt!90049 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248))) lt!90068) (get!2089 (getValueByKey!211 (toList!1171 (+!274 lt!90049 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248)))) lt!90068)))))

(declare-fun bs!7429 () Bool)

(assert (= bs!7429 d!54583))

(declare-fun m!210039 () Bool)

(assert (=> bs!7429 m!210039))

(assert (=> bs!7429 m!210039))

(declare-fun m!210041 () Bool)

(assert (=> bs!7429 m!210041))

(assert (=> b!182081 d!54583))

(declare-fun d!54585 () Bool)

(assert (=> d!54585 (= (apply!154 lt!90048 lt!90054) (get!2089 (getValueByKey!211 (toList!1171 lt!90048) lt!90054)))))

(declare-fun bs!7430 () Bool)

(assert (= bs!7430 d!54585))

(declare-fun m!210043 () Bool)

(assert (=> bs!7430 m!210043))

(assert (=> bs!7430 m!210043))

(declare-fun m!210045 () Bool)

(assert (=> bs!7430 m!210045))

(assert (=> b!182081 d!54585))

(declare-fun d!54587 () Bool)

(assert (=> d!54587 (= (apply!154 (+!274 lt!90048 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248))) lt!90054) (get!2089 (getValueByKey!211 (toList!1171 (+!274 lt!90048 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248)))) lt!90054)))))

(declare-fun bs!7431 () Bool)

(assert (= bs!7431 d!54587))

(declare-fun m!210047 () Bool)

(assert (=> bs!7431 m!210047))

(assert (=> bs!7431 m!210047))

(declare-fun m!210049 () Bool)

(assert (=> bs!7431 m!210049))

(assert (=> b!182081 d!54587))

(declare-fun d!54589 () Bool)

(assert (=> d!54589 (contains!1253 (+!274 lt!90064 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248))) lt!90055)))

(declare-fun lt!90136 () Unit!5524)

(declare-fun choose!968 (ListLongMap!2311 (_ BitVec 64) V!5331 (_ BitVec 64)) Unit!5524)

(assert (=> d!54589 (= lt!90136 (choose!968 lt!90064 lt!90057 (zeroValue!3567 thiss!1248) lt!90055))))

(assert (=> d!54589 (contains!1253 lt!90064 lt!90055)))

(assert (=> d!54589 (= (addStillContains!130 lt!90064 lt!90057 (zeroValue!3567 thiss!1248) lt!90055) lt!90136)))

(declare-fun bs!7432 () Bool)

(assert (= bs!7432 d!54589))

(assert (=> bs!7432 m!209879))

(assert (=> bs!7432 m!209879))

(assert (=> bs!7432 m!209891))

(declare-fun m!210051 () Bool)

(assert (=> bs!7432 m!210051))

(declare-fun m!210053 () Bool)

(assert (=> bs!7432 m!210053))

(assert (=> b!182081 d!54589))

(declare-fun d!54591 () Bool)

(assert (=> d!54591 (= (apply!154 (+!274 lt!90048 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248))) lt!90054) (apply!154 lt!90048 lt!90054))))

(declare-fun lt!90137 () Unit!5524)

(assert (=> d!54591 (= lt!90137 (choose!967 lt!90048 lt!90063 (zeroValue!3567 thiss!1248) lt!90054))))

(declare-fun e!119994 () Bool)

(assert (=> d!54591 e!119994))

(declare-fun res!86228 () Bool)

(assert (=> d!54591 (=> (not res!86228) (not e!119994))))

(assert (=> d!54591 (= res!86228 (contains!1253 lt!90048 lt!90054))))

(assert (=> d!54591 (= (addApplyDifferent!130 lt!90048 lt!90063 (zeroValue!3567 thiss!1248) lt!90054) lt!90137)))

(declare-fun b!182221 () Bool)

(assert (=> b!182221 (= e!119994 (not (= lt!90054 lt!90063)))))

(assert (= (and d!54591 res!86228) b!182221))

(assert (=> d!54591 m!209881))

(declare-fun m!210055 () Bool)

(assert (=> d!54591 m!210055))

(declare-fun m!210057 () Bool)

(assert (=> d!54591 m!210057))

(assert (=> d!54591 m!209883))

(assert (=> d!54591 m!209887))

(assert (=> d!54591 m!209883))

(assert (=> b!182081 d!54591))

(declare-fun d!54593 () Bool)

(declare-fun e!119995 () Bool)

(assert (=> d!54593 e!119995))

(declare-fun res!86229 () Bool)

(assert (=> d!54593 (=> (not res!86229) (not e!119995))))

(declare-fun lt!90140 () ListLongMap!2311)

(assert (=> d!54593 (= res!86229 (contains!1253 lt!90140 (_1!1708 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248)))))))

(declare-fun lt!90141 () List!2313)

(assert (=> d!54593 (= lt!90140 (ListLongMap!2312 lt!90141))))

(declare-fun lt!90139 () Unit!5524)

(declare-fun lt!90138 () Unit!5524)

(assert (=> d!54593 (= lt!90139 lt!90138)))

(assert (=> d!54593 (= (getValueByKey!211 lt!90141 (_1!1708 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248)))) (Some!216 (_2!1708 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248)))))))

(assert (=> d!54593 (= lt!90138 (lemmaContainsTupThenGetReturnValue!112 lt!90141 (_1!1708 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248))) (_2!1708 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248)))))))

(assert (=> d!54593 (= lt!90141 (insertStrictlySorted!115 (toList!1171 lt!90049) (_1!1708 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248))) (_2!1708 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248)))))))

(assert (=> d!54593 (= (+!274 lt!90049 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248))) lt!90140)))

(declare-fun b!182222 () Bool)

(declare-fun res!86230 () Bool)

(assert (=> b!182222 (=> (not res!86230) (not e!119995))))

(assert (=> b!182222 (= res!86230 (= (getValueByKey!211 (toList!1171 lt!90140) (_1!1708 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248)))) (Some!216 (_2!1708 (tuple2!3395 lt!90052 (minValue!3567 thiss!1248))))))))

(declare-fun b!182223 () Bool)

(assert (=> b!182223 (= e!119995 (contains!1254 (toList!1171 lt!90140) (tuple2!3395 lt!90052 (minValue!3567 thiss!1248))))))

(assert (= (and d!54593 res!86229) b!182222))

(assert (= (and b!182222 res!86230) b!182223))

(declare-fun m!210059 () Bool)

(assert (=> d!54593 m!210059))

(declare-fun m!210061 () Bool)

(assert (=> d!54593 m!210061))

(declare-fun m!210063 () Bool)

(assert (=> d!54593 m!210063))

(declare-fun m!210065 () Bool)

(assert (=> d!54593 m!210065))

(declare-fun m!210067 () Bool)

(assert (=> b!182222 m!210067))

(declare-fun m!210069 () Bool)

(assert (=> b!182223 m!210069))

(assert (=> b!182081 d!54593))

(declare-fun d!54595 () Bool)

(declare-fun e!119996 () Bool)

(assert (=> d!54595 e!119996))

(declare-fun res!86231 () Bool)

(assert (=> d!54595 (=> (not res!86231) (not e!119996))))

(declare-fun lt!90144 () ListLongMap!2311)

(assert (=> d!54595 (= res!86231 (contains!1253 lt!90144 (_1!1708 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248)))))))

(declare-fun lt!90145 () List!2313)

(assert (=> d!54595 (= lt!90144 (ListLongMap!2312 lt!90145))))

(declare-fun lt!90143 () Unit!5524)

(declare-fun lt!90142 () Unit!5524)

(assert (=> d!54595 (= lt!90143 lt!90142)))

(assert (=> d!54595 (= (getValueByKey!211 lt!90145 (_1!1708 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248)))) (Some!216 (_2!1708 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248)))))))

(assert (=> d!54595 (= lt!90142 (lemmaContainsTupThenGetReturnValue!112 lt!90145 (_1!1708 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248))) (_2!1708 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248)))))))

(assert (=> d!54595 (= lt!90145 (insertStrictlySorted!115 (toList!1171 lt!90048) (_1!1708 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248))) (_2!1708 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248)))))))

(assert (=> d!54595 (= (+!274 lt!90048 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248))) lt!90144)))

(declare-fun b!182224 () Bool)

(declare-fun res!86232 () Bool)

(assert (=> b!182224 (=> (not res!86232) (not e!119996))))

(assert (=> b!182224 (= res!86232 (= (getValueByKey!211 (toList!1171 lt!90144) (_1!1708 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248)))) (Some!216 (_2!1708 (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248))))))))

(declare-fun b!182225 () Bool)

(assert (=> b!182225 (= e!119996 (contains!1254 (toList!1171 lt!90144) (tuple2!3395 lt!90063 (zeroValue!3567 thiss!1248))))))

(assert (= (and d!54595 res!86231) b!182224))

(assert (= (and b!182224 res!86232) b!182225))

(declare-fun m!210071 () Bool)

(assert (=> d!54595 m!210071))

(declare-fun m!210073 () Bool)

(assert (=> d!54595 m!210073))

(declare-fun m!210075 () Bool)

(assert (=> d!54595 m!210075))

(declare-fun m!210077 () Bool)

(assert (=> d!54595 m!210077))

(declare-fun m!210079 () Bool)

(assert (=> b!182224 m!210079))

(declare-fun m!210081 () Bool)

(assert (=> b!182225 m!210081))

(assert (=> b!182081 d!54595))

(assert (=> b!182081 d!54561))

(declare-fun d!54597 () Bool)

(assert (=> d!54597 (= (apply!154 lt!90049 lt!90068) (get!2089 (getValueByKey!211 (toList!1171 lt!90049) lt!90068)))))

(declare-fun bs!7433 () Bool)

(assert (= bs!7433 d!54597))

(declare-fun m!210083 () Bool)

(assert (=> bs!7433 m!210083))

(assert (=> bs!7433 m!210083))

(declare-fun m!210085 () Bool)

(assert (=> bs!7433 m!210085))

(assert (=> b!182081 d!54597))

(declare-fun d!54599 () Bool)

(assert (=> d!54599 (= (apply!154 lt!90058 lt!90061) (get!2089 (getValueByKey!211 (toList!1171 lt!90058) lt!90061)))))

(declare-fun bs!7434 () Bool)

(assert (= bs!7434 d!54599))

(declare-fun m!210087 () Bool)

(assert (=> bs!7434 m!210087))

(assert (=> bs!7434 m!210087))

(declare-fun m!210089 () Bool)

(assert (=> bs!7434 m!210089))

(assert (=> b!182081 d!54599))

(declare-fun d!54601 () Bool)

(declare-fun e!119997 () Bool)

(assert (=> d!54601 e!119997))

(declare-fun res!86233 () Bool)

(assert (=> d!54601 (=> (not res!86233) (not e!119997))))

(declare-fun lt!90148 () ListLongMap!2311)

(assert (=> d!54601 (= res!86233 (contains!1253 lt!90148 (_1!1708 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248)))))))

(declare-fun lt!90149 () List!2313)

(assert (=> d!54601 (= lt!90148 (ListLongMap!2312 lt!90149))))

(declare-fun lt!90147 () Unit!5524)

(declare-fun lt!90146 () Unit!5524)

(assert (=> d!54601 (= lt!90147 lt!90146)))

(assert (=> d!54601 (= (getValueByKey!211 lt!90149 (_1!1708 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248)))) (Some!216 (_2!1708 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248)))))))

(assert (=> d!54601 (= lt!90146 (lemmaContainsTupThenGetReturnValue!112 lt!90149 (_1!1708 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248))) (_2!1708 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248)))))))

(assert (=> d!54601 (= lt!90149 (insertStrictlySorted!115 (toList!1171 lt!90064) (_1!1708 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248))) (_2!1708 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248)))))))

(assert (=> d!54601 (= (+!274 lt!90064 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248))) lt!90148)))

(declare-fun b!182226 () Bool)

(declare-fun res!86234 () Bool)

(assert (=> b!182226 (=> (not res!86234) (not e!119997))))

(assert (=> b!182226 (= res!86234 (= (getValueByKey!211 (toList!1171 lt!90148) (_1!1708 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248)))) (Some!216 (_2!1708 (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248))))))))

(declare-fun b!182227 () Bool)

(assert (=> b!182227 (= e!119997 (contains!1254 (toList!1171 lt!90148) (tuple2!3395 lt!90057 (zeroValue!3567 thiss!1248))))))

(assert (= (and d!54601 res!86233) b!182226))

(assert (= (and b!182226 res!86234) b!182227))

(declare-fun m!210091 () Bool)

(assert (=> d!54601 m!210091))

(declare-fun m!210093 () Bool)

(assert (=> d!54601 m!210093))

(declare-fun m!210095 () Bool)

(assert (=> d!54601 m!210095))

(declare-fun m!210097 () Bool)

(assert (=> d!54601 m!210097))

(declare-fun m!210099 () Bool)

(assert (=> b!182226 m!210099))

(declare-fun m!210101 () Bool)

(assert (=> b!182227 m!210101))

(assert (=> b!182081 d!54601))

(assert (=> d!54541 d!54547))

(declare-fun b!182236 () Bool)

(declare-fun res!86243 () Bool)

(declare-fun e!120000 () Bool)

(assert (=> b!182236 (=> (not res!86243) (not e!120000))))

(assert (=> b!182236 (= res!86243 (and (= (size!3959 (_values!3709 thiss!1248)) (bvadd (mask!8759 thiss!1248) #b00000000000000000000000000000001)) (= (size!3958 (_keys!5633 thiss!1248)) (size!3959 (_values!3709 thiss!1248))) (bvsge (_size!1291 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1291 thiss!1248) (bvadd (mask!8759 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!182237 () Bool)

(declare-fun res!86244 () Bool)

(assert (=> b!182237 (=> (not res!86244) (not e!120000))))

(declare-fun size!3962 (LongMapFixedSize!2484) (_ BitVec 32))

(assert (=> b!182237 (= res!86244 (bvsge (size!3962 thiss!1248) (_size!1291 thiss!1248)))))

(declare-fun b!182239 () Bool)

(assert (=> b!182239 (= e!120000 (and (bvsge (extraKeys!3463 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3463 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1291 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!182238 () Bool)

(declare-fun res!86246 () Bool)

(assert (=> b!182238 (=> (not res!86246) (not e!120000))))

(assert (=> b!182238 (= res!86246 (= (size!3962 thiss!1248) (bvadd (_size!1291 thiss!1248) (bvsdiv (bvadd (extraKeys!3463 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!54603 () Bool)

(declare-fun res!86245 () Bool)

(assert (=> d!54603 (=> (not res!86245) (not e!120000))))

(assert (=> d!54603 (= res!86245 (validMask!0 (mask!8759 thiss!1248)))))

(assert (=> d!54603 (= (simpleValid!170 thiss!1248) e!120000)))

(assert (= (and d!54603 res!86245) b!182236))

(assert (= (and b!182236 res!86243) b!182237))

(assert (= (and b!182237 res!86244) b!182238))

(assert (= (and b!182238 res!86246) b!182239))

(declare-fun m!210103 () Bool)

(assert (=> b!182237 m!210103))

(assert (=> b!182238 m!210103))

(assert (=> d!54603 m!209827))

(assert (=> d!54543 d!54603))

(declare-fun d!54605 () Bool)

(declare-fun lt!90154 () SeekEntryResult!603)

(assert (=> d!54605 (and (or ((_ is Undefined!603) lt!90154) (not ((_ is Found!603) lt!90154)) (and (bvsge (index!4583 lt!90154) #b00000000000000000000000000000000) (bvslt (index!4583 lt!90154) (size!3958 (_keys!5633 thiss!1248))))) (or ((_ is Undefined!603) lt!90154) ((_ is Found!603) lt!90154) (not ((_ is MissingVacant!603) lt!90154)) (not (= (index!4585 lt!90154) (index!4584 lt!90076))) (and (bvsge (index!4585 lt!90154) #b00000000000000000000000000000000) (bvslt (index!4585 lt!90154) (size!3958 (_keys!5633 thiss!1248))))) (or ((_ is Undefined!603) lt!90154) (ite ((_ is Found!603) lt!90154) (= (select (arr!3647 (_keys!5633 thiss!1248)) (index!4583 lt!90154)) key!828) (and ((_ is MissingVacant!603) lt!90154) (= (index!4585 lt!90154) (index!4584 lt!90076)) (= (select (arr!3647 (_keys!5633 thiss!1248)) (index!4585 lt!90154)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!120008 () SeekEntryResult!603)

(assert (=> d!54605 (= lt!90154 e!120008)))

(declare-fun c!32695 () Bool)

(assert (=> d!54605 (= c!32695 (bvsge (x!19851 lt!90076) #b01111111111111111111111111111110))))

(declare-fun lt!90155 () (_ BitVec 64))

(assert (=> d!54605 (= lt!90155 (select (arr!3647 (_keys!5633 thiss!1248)) (index!4584 lt!90076)))))

(assert (=> d!54605 (validMask!0 (mask!8759 thiss!1248))))

(assert (=> d!54605 (= (seekKeyOrZeroReturnVacant!0 (x!19851 lt!90076) (index!4584 lt!90076) (index!4584 lt!90076) key!828 (_keys!5633 thiss!1248) (mask!8759 thiss!1248)) lt!90154)))

(declare-fun b!182252 () Bool)

(declare-fun e!120007 () SeekEntryResult!603)

(assert (=> b!182252 (= e!120007 (Found!603 (index!4584 lt!90076)))))

(declare-fun e!120009 () SeekEntryResult!603)

(declare-fun b!182253 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182253 (= e!120009 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19851 lt!90076) #b00000000000000000000000000000001) (nextIndex!0 (index!4584 lt!90076) (x!19851 lt!90076) (mask!8759 thiss!1248)) (index!4584 lt!90076) key!828 (_keys!5633 thiss!1248) (mask!8759 thiss!1248)))))

(declare-fun b!182254 () Bool)

(declare-fun c!32694 () Bool)

(assert (=> b!182254 (= c!32694 (= lt!90155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182254 (= e!120007 e!120009)))

(declare-fun b!182255 () Bool)

(assert (=> b!182255 (= e!120008 e!120007)))

(declare-fun c!32696 () Bool)

(assert (=> b!182255 (= c!32696 (= lt!90155 key!828))))

(declare-fun b!182256 () Bool)

(assert (=> b!182256 (= e!120008 Undefined!603)))

(declare-fun b!182257 () Bool)

(assert (=> b!182257 (= e!120009 (MissingVacant!603 (index!4584 lt!90076)))))

(assert (= (and d!54605 c!32695) b!182256))

(assert (= (and d!54605 (not c!32695)) b!182255))

(assert (= (and b!182255 c!32696) b!182252))

(assert (= (and b!182255 (not c!32696)) b!182254))

(assert (= (and b!182254 c!32694) b!182257))

(assert (= (and b!182254 (not c!32694)) b!182253))

(declare-fun m!210105 () Bool)

(assert (=> d!54605 m!210105))

(declare-fun m!210107 () Bool)

(assert (=> d!54605 m!210107))

(assert (=> d!54605 m!209927))

(assert (=> d!54605 m!209827))

(declare-fun m!210109 () Bool)

(assert (=> b!182253 m!210109))

(assert (=> b!182253 m!210109))

(declare-fun m!210111 () Bool)

(assert (=> b!182253 m!210111))

(assert (=> b!182115 d!54605))

(declare-fun d!54607 () Bool)

(declare-fun e!120010 () Bool)

(assert (=> d!54607 e!120010))

(declare-fun res!86247 () Bool)

(assert (=> d!54607 (=> res!86247 e!120010)))

(declare-fun lt!90159 () Bool)

(assert (=> d!54607 (= res!86247 (not lt!90159))))

(declare-fun lt!90158 () Bool)

(assert (=> d!54607 (= lt!90159 lt!90158)))

(declare-fun lt!90157 () Unit!5524)

(declare-fun e!120011 () Unit!5524)

(assert (=> d!54607 (= lt!90157 e!120011)))

(declare-fun c!32697 () Bool)

(assert (=> d!54607 (= c!32697 lt!90158)))

(assert (=> d!54607 (= lt!90158 (containsKey!215 (toList!1171 lt!90065) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54607 (= (contains!1253 lt!90065 #b1000000000000000000000000000000000000000000000000000000000000000) lt!90159)))

(declare-fun b!182258 () Bool)

(declare-fun lt!90156 () Unit!5524)

(assert (=> b!182258 (= e!120011 lt!90156)))

(assert (=> b!182258 (= lt!90156 (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1171 lt!90065) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182258 (isDefined!164 (getValueByKey!211 (toList!1171 lt!90065) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182259 () Bool)

(declare-fun Unit!5531 () Unit!5524)

(assert (=> b!182259 (= e!120011 Unit!5531)))

(declare-fun b!182260 () Bool)

(assert (=> b!182260 (= e!120010 (isDefined!164 (getValueByKey!211 (toList!1171 lt!90065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54607 c!32697) b!182258))

(assert (= (and d!54607 (not c!32697)) b!182259))

(assert (= (and d!54607 (not res!86247)) b!182260))

(declare-fun m!210113 () Bool)

(assert (=> d!54607 m!210113))

(declare-fun m!210115 () Bool)

(assert (=> b!182258 m!210115))

(declare-fun m!210117 () Bool)

(assert (=> b!182258 m!210117))

(assert (=> b!182258 m!210117))

(declare-fun m!210119 () Bool)

(assert (=> b!182258 m!210119))

(assert (=> b!182260 m!210117))

(assert (=> b!182260 m!210117))

(assert (=> b!182260 m!210119))

(assert (=> bm!18392 d!54607))

(declare-fun d!54609 () Bool)

(assert (=> d!54609 (isDefined!164 (getValueByKey!211 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828))))

(declare-fun lt!90162 () Unit!5524)

(declare-fun choose!969 (List!2313 (_ BitVec 64)) Unit!5524)

(assert (=> d!54609 (= lt!90162 (choose!969 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828))))

(declare-fun e!120014 () Bool)

(assert (=> d!54609 e!120014))

(declare-fun res!86250 () Bool)

(assert (=> d!54609 (=> (not res!86250) (not e!120014))))

(declare-fun isStrictlySorted!344 (List!2313) Bool)

(assert (=> d!54609 (= res!86250 (isStrictlySorted!344 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248)))))))

(assert (=> d!54609 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!163 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828) lt!90162)))

(declare-fun b!182263 () Bool)

(assert (=> b!182263 (= e!120014 (containsKey!215 (toList!1171 (getCurrentListMap!819 (_keys!5633 thiss!1248) (_values!3709 thiss!1248) (mask!8759 thiss!1248) (extraKeys!3463 thiss!1248) (zeroValue!3567 thiss!1248) (minValue!3567 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3726 thiss!1248))) key!828))))

(assert (= (and d!54609 res!86250) b!182263))

(assert (=> d!54609 m!209857))

(assert (=> d!54609 m!209857))

(assert (=> d!54609 m!209859))

(declare-fun m!210121 () Bool)

(assert (=> d!54609 m!210121))

(declare-fun m!210123 () Bool)

(assert (=> d!54609 m!210123))

(assert (=> b!182263 m!209853))

(assert (=> b!182023 d!54609))

(assert (=> b!182023 d!54567))

(assert (=> b!182023 d!54569))

(declare-fun d!54611 () Bool)

(declare-fun e!120015 () Bool)

(assert (=> d!54611 e!120015))

(declare-fun res!86251 () Bool)

(assert (=> d!54611 (=> (not res!86251) (not e!120015))))

(declare-fun lt!90165 () ListLongMap!2311)

(assert (=> d!54611 (= res!86251 (contains!1253 lt!90165 (_1!1708 (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))))))))

(declare-fun lt!90166 () List!2313)

(assert (=> d!54611 (= lt!90165 (ListLongMap!2312 lt!90166))))

(declare-fun lt!90164 () Unit!5524)

(declare-fun lt!90163 () Unit!5524)

(assert (=> d!54611 (= lt!90164 lt!90163)))

(assert (=> d!54611 (= (getValueByKey!211 lt!90166 (_1!1708 (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))))) (Some!216 (_2!1708 (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))))))))

(assert (=> d!54611 (= lt!90163 (lemmaContainsTupThenGetReturnValue!112 lt!90166 (_1!1708 (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))) (_2!1708 (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))))))))

(assert (=> d!54611 (= lt!90166 (insertStrictlySorted!115 (toList!1171 (ite c!32645 call!18394 (ite c!32647 call!18391 call!18393))) (_1!1708 (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))) (_2!1708 (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))))))))

(assert (=> d!54611 (= (+!274 (ite c!32645 call!18394 (ite c!32647 call!18391 call!18393)) (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))) lt!90165)))

(declare-fun b!182264 () Bool)

(declare-fun res!86252 () Bool)

(assert (=> b!182264 (=> (not res!86252) (not e!120015))))

(assert (=> b!182264 (= res!86252 (= (getValueByKey!211 (toList!1171 lt!90165) (_1!1708 (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248))))) (Some!216 (_2!1708 (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))))))))

(declare-fun b!182265 () Bool)

(assert (=> b!182265 (= e!120015 (contains!1254 (toList!1171 lt!90165) (ite (or c!32645 c!32647) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3567 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3567 thiss!1248)))))))

(assert (= (and d!54611 res!86251) b!182264))

(assert (= (and b!182264 res!86252) b!182265))

(declare-fun m!210125 () Bool)

(assert (=> d!54611 m!210125))

(declare-fun m!210127 () Bool)

(assert (=> d!54611 m!210127))

(declare-fun m!210129 () Bool)

(assert (=> d!54611 m!210129))

(declare-fun m!210131 () Bool)

(assert (=> d!54611 m!210131))

(declare-fun m!210133 () Bool)

(assert (=> b!182264 m!210133))

(declare-fun m!210135 () Bool)

(assert (=> b!182265 m!210135))

(assert (=> bm!18394 d!54611))

(declare-fun d!54613 () Bool)

(assert (=> d!54613 (= (apply!154 lt!90065 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2089 (getValueByKey!211 (toList!1171 lt!90065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7435 () Bool)

(assert (= bs!7435 d!54613))

(assert (=> bs!7435 m!210117))

(assert (=> bs!7435 m!210117))

(declare-fun m!210137 () Bool)

(assert (=> bs!7435 m!210137))

(assert (=> b!182084 d!54613))

(declare-fun b!182276 () Bool)

(declare-fun e!120027 () Bool)

(declare-fun call!18406 () Bool)

(assert (=> b!182276 (= e!120027 call!18406)))

(declare-fun b!182277 () Bool)

(declare-fun e!120024 () Bool)

(assert (=> b!182277 (= e!120024 e!120027)))

(declare-fun c!32700 () Bool)

(assert (=> b!182277 (= c!32700 (validKeyInArray!0 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18403 () Bool)

(assert (=> bm!18403 (= call!18406 (arrayNoDuplicates!0 (_keys!5633 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32700 (Cons!2310 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000) Nil!2311) Nil!2311)))))

(declare-fun d!54615 () Bool)

(declare-fun res!86261 () Bool)

(declare-fun e!120025 () Bool)

(assert (=> d!54615 (=> res!86261 e!120025)))

(assert (=> d!54615 (= res!86261 (bvsge #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(assert (=> d!54615 (= (arrayNoDuplicates!0 (_keys!5633 thiss!1248) #b00000000000000000000000000000000 Nil!2311) e!120025)))

(declare-fun b!182278 () Bool)

(declare-fun e!120026 () Bool)

(declare-fun contains!1255 (List!2314 (_ BitVec 64)) Bool)

(assert (=> b!182278 (= e!120026 (contains!1255 Nil!2311 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182279 () Bool)

(assert (=> b!182279 (= e!120025 e!120024)))

(declare-fun res!86259 () Bool)

(assert (=> b!182279 (=> (not res!86259) (not e!120024))))

(assert (=> b!182279 (= res!86259 (not e!120026))))

(declare-fun res!86260 () Bool)

(assert (=> b!182279 (=> (not res!86260) (not e!120026))))

(assert (=> b!182279 (= res!86260 (validKeyInArray!0 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182280 () Bool)

(assert (=> b!182280 (= e!120027 call!18406)))

(assert (= (and d!54615 (not res!86261)) b!182279))

(assert (= (and b!182279 res!86260) b!182278))

(assert (= (and b!182279 res!86259) b!182277))

(assert (= (and b!182277 c!32700) b!182280))

(assert (= (and b!182277 (not c!32700)) b!182276))

(assert (= (or b!182280 b!182276) bm!18403))

(assert (=> b!182277 m!209875))

(assert (=> b!182277 m!209875))

(assert (=> b!182277 m!209899))

(assert (=> bm!18403 m!209875))

(declare-fun m!210139 () Bool)

(assert (=> bm!18403 m!210139))

(assert (=> b!182278 m!209875))

(assert (=> b!182278 m!209875))

(declare-fun m!210141 () Bool)

(assert (=> b!182278 m!210141))

(assert (=> b!182279 m!209875))

(assert (=> b!182279 m!209875))

(assert (=> b!182279 m!209899))

(assert (=> b!182099 d!54615))

(declare-fun b!182299 () Bool)

(declare-fun e!120039 () Bool)

(declare-fun lt!90172 () SeekEntryResult!603)

(assert (=> b!182299 (= e!120039 (bvsge (x!19851 lt!90172) #b01111111111111111111111111111110))))

(declare-fun b!182300 () Bool)

(declare-fun e!120042 () SeekEntryResult!603)

(declare-fun e!120038 () SeekEntryResult!603)

(assert (=> b!182300 (= e!120042 e!120038)))

(declare-fun c!32709 () Bool)

(declare-fun lt!90171 () (_ BitVec 64))

(assert (=> b!182300 (= c!32709 (or (= lt!90171 key!828) (= (bvadd lt!90171 lt!90171) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182301 () Bool)

(assert (=> b!182301 (and (bvsge (index!4584 lt!90172) #b00000000000000000000000000000000) (bvslt (index!4584 lt!90172) (size!3958 (_keys!5633 thiss!1248))))))

(declare-fun res!86269 () Bool)

(assert (=> b!182301 (= res!86269 (= (select (arr!3647 (_keys!5633 thiss!1248)) (index!4584 lt!90172)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120040 () Bool)

(assert (=> b!182301 (=> res!86269 e!120040)))

(declare-fun b!182302 () Bool)

(assert (=> b!182302 (= e!120042 (Intermediate!603 true (toIndex!0 key!828 (mask!8759 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!182303 () Bool)

(assert (=> b!182303 (= e!120038 (Intermediate!603 false (toIndex!0 key!828 (mask!8759 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!182304 () Bool)

(assert (=> b!182304 (and (bvsge (index!4584 lt!90172) #b00000000000000000000000000000000) (bvslt (index!4584 lt!90172) (size!3958 (_keys!5633 thiss!1248))))))

(declare-fun res!86268 () Bool)

(assert (=> b!182304 (= res!86268 (= (select (arr!3647 (_keys!5633 thiss!1248)) (index!4584 lt!90172)) key!828))))

(assert (=> b!182304 (=> res!86268 e!120040)))

(declare-fun e!120041 () Bool)

(assert (=> b!182304 (= e!120041 e!120040)))

(declare-fun b!182305 () Bool)

(assert (=> b!182305 (= e!120038 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8759 thiss!1248)) #b00000000000000000000000000000000 (mask!8759 thiss!1248)) key!828 (_keys!5633 thiss!1248) (mask!8759 thiss!1248)))))

(declare-fun b!182306 () Bool)

(assert (=> b!182306 (and (bvsge (index!4584 lt!90172) #b00000000000000000000000000000000) (bvslt (index!4584 lt!90172) (size!3958 (_keys!5633 thiss!1248))))))

(assert (=> b!182306 (= e!120040 (= (select (arr!3647 (_keys!5633 thiss!1248)) (index!4584 lt!90172)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!54617 () Bool)

(assert (=> d!54617 e!120039))

(declare-fun c!32707 () Bool)

(assert (=> d!54617 (= c!32707 (and ((_ is Intermediate!603) lt!90172) (undefined!1415 lt!90172)))))

(assert (=> d!54617 (= lt!90172 e!120042)))

(declare-fun c!32708 () Bool)

(assert (=> d!54617 (= c!32708 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!54617 (= lt!90171 (select (arr!3647 (_keys!5633 thiss!1248)) (toIndex!0 key!828 (mask!8759 thiss!1248))))))

(assert (=> d!54617 (validMask!0 (mask!8759 thiss!1248))))

(assert (=> d!54617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8759 thiss!1248)) key!828 (_keys!5633 thiss!1248) (mask!8759 thiss!1248)) lt!90172)))

(declare-fun b!182307 () Bool)

(assert (=> b!182307 (= e!120039 e!120041)))

(declare-fun res!86270 () Bool)

(assert (=> b!182307 (= res!86270 (and ((_ is Intermediate!603) lt!90172) (not (undefined!1415 lt!90172)) (bvslt (x!19851 lt!90172) #b01111111111111111111111111111110) (bvsge (x!19851 lt!90172) #b00000000000000000000000000000000) (bvsge (x!19851 lt!90172) #b00000000000000000000000000000000)))))

(assert (=> b!182307 (=> (not res!86270) (not e!120041))))

(assert (= (and d!54617 c!32708) b!182302))

(assert (= (and d!54617 (not c!32708)) b!182300))

(assert (= (and b!182300 c!32709) b!182303))

(assert (= (and b!182300 (not c!32709)) b!182305))

(assert (= (and d!54617 c!32707) b!182299))

(assert (= (and d!54617 (not c!32707)) b!182307))

(assert (= (and b!182307 res!86270) b!182304))

(assert (= (and b!182304 (not res!86268)) b!182301))

(assert (= (and b!182301 (not res!86269)) b!182306))

(declare-fun m!210143 () Bool)

(assert (=> b!182306 m!210143))

(assert (=> d!54617 m!209931))

(declare-fun m!210145 () Bool)

(assert (=> d!54617 m!210145))

(assert (=> d!54617 m!209827))

(assert (=> b!182305 m!209931))

(declare-fun m!210147 () Bool)

(assert (=> b!182305 m!210147))

(assert (=> b!182305 m!210147))

(declare-fun m!210149 () Bool)

(assert (=> b!182305 m!210149))

(assert (=> b!182301 m!210143))

(assert (=> b!182304 m!210143))

(assert (=> d!54545 d!54617))

(declare-fun d!54619 () Bool)

(declare-fun lt!90178 () (_ BitVec 32))

(declare-fun lt!90177 () (_ BitVec 32))

(assert (=> d!54619 (= lt!90178 (bvmul (bvxor lt!90177 (bvlshr lt!90177 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54619 (= lt!90177 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54619 (and (bvsge (mask!8759 thiss!1248) #b00000000000000000000000000000000) (let ((res!86271 (let ((h!2939 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19869 (bvmul (bvxor h!2939 (bvlshr h!2939 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19869 (bvlshr x!19869 #b00000000000000000000000000001101)) (mask!8759 thiss!1248)))))) (and (bvslt res!86271 (bvadd (mask!8759 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!86271 #b00000000000000000000000000000000))))))

(assert (=> d!54619 (= (toIndex!0 key!828 (mask!8759 thiss!1248)) (bvand (bvxor lt!90178 (bvlshr lt!90178 #b00000000000000000000000000001101)) (mask!8759 thiss!1248)))))

(assert (=> d!54545 d!54619))

(assert (=> d!54545 d!54547))

(declare-fun bm!18406 () Bool)

(declare-fun call!18409 () Bool)

(assert (=> bm!18406 (= call!18409 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5633 thiss!1248) (mask!8759 thiss!1248)))))

(declare-fun b!182316 () Bool)

(declare-fun e!120049 () Bool)

(assert (=> b!182316 (= e!120049 call!18409)))

(declare-fun b!182317 () Bool)

(declare-fun e!120050 () Bool)

(assert (=> b!182317 (= e!120050 call!18409)))

(declare-fun d!54621 () Bool)

(declare-fun res!86277 () Bool)

(declare-fun e!120051 () Bool)

(assert (=> d!54621 (=> res!86277 e!120051)))

(assert (=> d!54621 (= res!86277 (bvsge #b00000000000000000000000000000000 (size!3958 (_keys!5633 thiss!1248))))))

(assert (=> d!54621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5633 thiss!1248) (mask!8759 thiss!1248)) e!120051)))

(declare-fun b!182318 () Bool)

(assert (=> b!182318 (= e!120051 e!120049)))

(declare-fun c!32712 () Bool)

(assert (=> b!182318 (= c!32712 (validKeyInArray!0 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182319 () Bool)

(assert (=> b!182319 (= e!120049 e!120050)))

(declare-fun lt!90187 () (_ BitVec 64))

(assert (=> b!182319 (= lt!90187 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90185 () Unit!5524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7709 (_ BitVec 64) (_ BitVec 32)) Unit!5524)

(assert (=> b!182319 (= lt!90185 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5633 thiss!1248) lt!90187 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!182319 (arrayContainsKey!0 (_keys!5633 thiss!1248) lt!90187 #b00000000000000000000000000000000)))

(declare-fun lt!90186 () Unit!5524)

(assert (=> b!182319 (= lt!90186 lt!90185)))

(declare-fun res!86276 () Bool)

(assert (=> b!182319 (= res!86276 (= (seekEntryOrOpen!0 (select (arr!3647 (_keys!5633 thiss!1248)) #b00000000000000000000000000000000) (_keys!5633 thiss!1248) (mask!8759 thiss!1248)) (Found!603 #b00000000000000000000000000000000)))))

(assert (=> b!182319 (=> (not res!86276) (not e!120050))))

(assert (= (and d!54621 (not res!86277)) b!182318))

(assert (= (and b!182318 c!32712) b!182319))

(assert (= (and b!182318 (not c!32712)) b!182316))

(assert (= (and b!182319 res!86276) b!182317))

(assert (= (or b!182317 b!182316) bm!18406))

(declare-fun m!210151 () Bool)

(assert (=> bm!18406 m!210151))

(assert (=> b!182318 m!209875))

(assert (=> b!182318 m!209875))

(assert (=> b!182318 m!209899))

(assert (=> b!182319 m!209875))

(declare-fun m!210153 () Bool)

(assert (=> b!182319 m!210153))

(declare-fun m!210155 () Bool)

(assert (=> b!182319 m!210155))

(assert (=> b!182319 m!209875))

(declare-fun m!210157 () Bool)

(assert (=> b!182319 m!210157))

(assert (=> b!182098 d!54621))

(declare-fun b!182321 () Bool)

(declare-fun e!120052 () Bool)

(assert (=> b!182321 (= e!120052 tp_is_empty!4263)))

(declare-fun mapNonEmpty!7319 () Bool)

(declare-fun mapRes!7319 () Bool)

(declare-fun tp!16238 () Bool)

(declare-fun e!120053 () Bool)

(assert (=> mapNonEmpty!7319 (= mapRes!7319 (and tp!16238 e!120053))))

(declare-fun mapRest!7319 () (Array (_ BitVec 32) ValueCell!1788))

(declare-fun mapKey!7319 () (_ BitVec 32))

(declare-fun mapValue!7319 () ValueCell!1788)

(assert (=> mapNonEmpty!7319 (= mapRest!7318 (store mapRest!7319 mapKey!7319 mapValue!7319))))

(declare-fun b!182320 () Bool)

(assert (=> b!182320 (= e!120053 tp_is_empty!4263)))

(declare-fun mapIsEmpty!7319 () Bool)

(assert (=> mapIsEmpty!7319 mapRes!7319))

(declare-fun condMapEmpty!7319 () Bool)

(declare-fun mapDefault!7319 () ValueCell!1788)

(assert (=> mapNonEmpty!7318 (= condMapEmpty!7319 (= mapRest!7318 ((as const (Array (_ BitVec 32) ValueCell!1788)) mapDefault!7319)))))

(assert (=> mapNonEmpty!7318 (= tp!16237 (and e!120052 mapRes!7319))))

(assert (= (and mapNonEmpty!7318 condMapEmpty!7319) mapIsEmpty!7319))

(assert (= (and mapNonEmpty!7318 (not condMapEmpty!7319)) mapNonEmpty!7319))

(assert (= (and mapNonEmpty!7319 ((_ is ValueCellFull!1788) mapValue!7319)) b!182320))

(assert (= (and mapNonEmpty!7318 ((_ is ValueCellFull!1788) mapDefault!7319)) b!182321))

(declare-fun m!210159 () Bool)

(assert (=> mapNonEmpty!7319 m!210159))

(declare-fun b_lambda!7171 () Bool)

(assert (= b_lambda!7169 (or (and b!181988 b_free!4491) b_lambda!7171)))

(declare-fun b_lambda!7173 () Bool)

(assert (= b_lambda!7167 (or (and b!181988 b_free!4491) b_lambda!7173)))

(check-sat (not b!182175) (not b!182174) (not bm!18406) (not b!182165) (not b!182237) (not d!54583) (not b!182238) (not b!182222) (not b!182177) (not d!54595) (not d!54573) (not d!54585) (not d!54551) (not b!182223) (not b_lambda!7171) (not b!182171) (not d!54579) (not b!182225) (not b!182185) (not b!182179) (not b!182318) (not d!54567) (not d!54563) (not b!182263) (not mapNonEmpty!7319) (not d!54611) (not b!182219) (not b_next!4491) (not d!54609) (not b!182227) (not d!54593) (not d!54549) (not d!54605) (not d!54561) (not b!182209) (not b!182319) (not d!54589) (not b!182226) (not b!182224) (not b!182265) (not d!54591) (not b!182218) (not b!182131) (not b!182278) (not b!182264) (not d!54577) (not bm!18403) (not b!182305) (not b!182258) (not b!182216) (not b!182279) (not d!54557) (not d!54613) (not b!182137) tp_is_empty!4263 (not b!182214) (not b!182166) (not b_lambda!7173) (not b!182140) (not d!54601) (not b!182169) (not b!182130) (not bm!18397) (not bm!18400) b_and!11055 (not b!182138) (not b!182167) (not d!54575) (not b_lambda!7165) (not d!54603) (not d!54599) (not d!54597) (not b!182260) (not b!182196) (not b!182170) (not d!54581) (not d!54555) (not d!54617) (not d!54607) (not b!182277) (not b!182253) (not d!54587) (not b!182136))
(check-sat b_and!11055 (not b_next!4491))
