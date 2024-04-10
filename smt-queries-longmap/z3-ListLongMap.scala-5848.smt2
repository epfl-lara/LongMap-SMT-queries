; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75564 () Bool)

(assert start!75564)

(declare-fun b!888837 () Bool)

(declare-fun b_free!15591 () Bool)

(declare-fun b_next!15591 () Bool)

(assert (=> b!888837 (= b_free!15591 (not b_next!15591))))

(declare-fun tp!54727 () Bool)

(declare-fun b_and!25831 () Bool)

(assert (=> b!888837 (= tp!54727 b_and!25831)))

(declare-fun mapIsEmpty!28419 () Bool)

(declare-fun mapRes!28419 () Bool)

(assert (=> mapIsEmpty!28419 mapRes!28419))

(declare-fun b!888831 () Bool)

(declare-fun e!495344 () Bool)

(declare-fun tp_is_empty!17919 () Bool)

(assert (=> b!888831 (= e!495344 tp_is_empty!17919)))

(declare-fun b!888832 () Bool)

(declare-fun res!602504 () Bool)

(declare-fun e!495343 () Bool)

(assert (=> b!888832 (=> (not res!602504) (not e!495343))))

(declare-datatypes ((array!51810 0))(
  ( (array!51811 (arr!24915 (Array (_ BitVec 32) (_ BitVec 64))) (size!25357 (_ BitVec 32))) )
))
(declare-datatypes ((V!28857 0))(
  ( (V!28858 (val!9010 Int)) )
))
(declare-datatypes ((ValueCell!8478 0))(
  ( (ValueCellFull!8478 (v!11486 V!28857)) (EmptyCell!8478) )
))
(declare-datatypes ((array!51812 0))(
  ( (array!51813 (arr!24916 (Array (_ BitVec 32) ValueCell!8478)) (size!25358 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3972 0))(
  ( (LongMapFixedSize!3973 (defaultEntry!5183 Int) (mask!25615 (_ BitVec 32)) (extraKeys!4877 (_ BitVec 32)) (zeroValue!4981 V!28857) (minValue!4981 V!28857) (_size!2041 (_ BitVec 32)) (_keys!9864 array!51810) (_values!5168 array!51812) (_vacant!2041 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3972)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4332 (LongMapFixedSize!3972 (_ BitVec 64)) Bool)

(assert (=> b!888832 (= res!602504 (contains!4332 thiss!1181 key!785))))

(declare-fun b!888833 () Bool)

(declare-datatypes ((Option!449 0))(
  ( (Some!448 (v!11487 V!28857)) (None!447) )
))
(declare-fun isDefined!322 (Option!449) Bool)

(declare-datatypes ((tuple2!11938 0))(
  ( (tuple2!11939 (_1!5980 (_ BitVec 64)) (_2!5980 V!28857)) )
))
(declare-datatypes ((List!17693 0))(
  ( (Nil!17690) (Cons!17689 (h!18820 tuple2!11938) (t!24992 List!17693)) )
))
(declare-fun getValueByKey!443 (List!17693 (_ BitVec 64)) Option!449)

(declare-datatypes ((ListLongMap!10635 0))(
  ( (ListLongMap!10636 (toList!5333 List!17693)) )
))
(declare-fun map!12122 (LongMapFixedSize!3972) ListLongMap!10635)

(assert (=> b!888833 (= e!495343 (not (isDefined!322 (getValueByKey!443 (toList!5333 (map!12122 thiss!1181)) key!785))))))

(declare-fun res!602502 () Bool)

(assert (=> start!75564 (=> (not res!602502) (not e!495343))))

(declare-fun valid!1549 (LongMapFixedSize!3972) Bool)

(assert (=> start!75564 (= res!602502 (valid!1549 thiss!1181))))

(assert (=> start!75564 e!495343))

(declare-fun e!495346 () Bool)

(assert (=> start!75564 e!495346))

(assert (=> start!75564 true))

(declare-fun mapNonEmpty!28419 () Bool)

(declare-fun tp!54728 () Bool)

(declare-fun e!495345 () Bool)

(assert (=> mapNonEmpty!28419 (= mapRes!28419 (and tp!54728 e!495345))))

(declare-fun mapRest!28419 () (Array (_ BitVec 32) ValueCell!8478))

(declare-fun mapValue!28419 () ValueCell!8478)

(declare-fun mapKey!28419 () (_ BitVec 32))

(assert (=> mapNonEmpty!28419 (= (arr!24916 (_values!5168 thiss!1181)) (store mapRest!28419 mapKey!28419 mapValue!28419))))

(declare-fun b!888834 () Bool)

(declare-fun e!495342 () Bool)

(assert (=> b!888834 (= e!495342 (and e!495344 mapRes!28419))))

(declare-fun condMapEmpty!28419 () Bool)

(declare-fun mapDefault!28419 () ValueCell!8478)

(assert (=> b!888834 (= condMapEmpty!28419 (= (arr!24916 (_values!5168 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8478)) mapDefault!28419)))))

(declare-fun b!888835 () Bool)

(declare-fun res!602503 () Bool)

(assert (=> b!888835 (=> (not res!602503) (not e!495343))))

(assert (=> b!888835 (= res!602503 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4877 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4877 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888836 () Bool)

(assert (=> b!888836 (= e!495345 tp_is_empty!17919)))

(declare-fun array_inv!19606 (array!51810) Bool)

(declare-fun array_inv!19607 (array!51812) Bool)

(assert (=> b!888837 (= e!495346 (and tp!54727 tp_is_empty!17919 (array_inv!19606 (_keys!9864 thiss!1181)) (array_inv!19607 (_values!5168 thiss!1181)) e!495342))))

(assert (= (and start!75564 res!602502) b!888835))

(assert (= (and b!888835 res!602503) b!888832))

(assert (= (and b!888832 res!602504) b!888833))

(assert (= (and b!888834 condMapEmpty!28419) mapIsEmpty!28419))

(assert (= (and b!888834 (not condMapEmpty!28419)) mapNonEmpty!28419))

(get-info :version)

(assert (= (and mapNonEmpty!28419 ((_ is ValueCellFull!8478) mapValue!28419)) b!888836))

(assert (= (and b!888834 ((_ is ValueCellFull!8478) mapDefault!28419)) b!888831))

(assert (= b!888837 b!888834))

(assert (= start!75564 b!888837))

(declare-fun m!828019 () Bool)

(assert (=> b!888833 m!828019))

(declare-fun m!828021 () Bool)

(assert (=> b!888833 m!828021))

(assert (=> b!888833 m!828021))

(declare-fun m!828023 () Bool)

(assert (=> b!888833 m!828023))

(declare-fun m!828025 () Bool)

(assert (=> b!888837 m!828025))

(declare-fun m!828027 () Bool)

(assert (=> b!888837 m!828027))

(declare-fun m!828029 () Bool)

(assert (=> b!888832 m!828029))

(declare-fun m!828031 () Bool)

(assert (=> start!75564 m!828031))

(declare-fun m!828033 () Bool)

(assert (=> mapNonEmpty!28419 m!828033))

(check-sat tp_is_empty!17919 (not b!888837) b_and!25831 (not mapNonEmpty!28419) (not b!888832) (not b_next!15591) (not b!888833) (not start!75564))
(check-sat b_and!25831 (not b_next!15591))
(get-model)

(declare-fun d!110103 () Bool)

(declare-fun lt!401960 () Bool)

(declare-fun contains!4334 (ListLongMap!10635 (_ BitVec 64)) Bool)

(assert (=> d!110103 (= lt!401960 (contains!4334 (map!12122 thiss!1181) key!785))))

(declare-fun e!495378 () Bool)

(assert (=> d!110103 (= lt!401960 e!495378)))

(declare-fun c!93914 () Bool)

(assert (=> d!110103 (= c!93914 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110103 (valid!1549 thiss!1181)))

(assert (=> d!110103 (= (contains!4332 thiss!1181 key!785) lt!401960)))

(declare-fun b!888879 () Bool)

(declare-fun e!495376 () Bool)

(assert (=> b!888879 (= e!495376 (not (= (bvand (extraKeys!4877 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888880 () Bool)

(declare-fun e!495379 () Bool)

(declare-fun call!39492 () Bool)

(assert (=> b!888880 (= e!495379 call!39492)))

(declare-fun bm!39487 () Bool)

(declare-fun arrayContainsKey!0 (array!51810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39487 (= call!39492 (arrayContainsKey!0 (_keys!9864 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!888881 () Bool)

(assert (=> b!888881 (= e!495379 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4877 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4877 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888882 () Bool)

(declare-fun c!93915 () Bool)

(declare-datatypes ((SeekEntryResult!8768 0))(
  ( (MissingZero!8768 (index!37443 (_ BitVec 32))) (Found!8768 (index!37444 (_ BitVec 32))) (Intermediate!8768 (undefined!9580 Bool) (index!37445 (_ BitVec 32)) (x!75428 (_ BitVec 32))) (Undefined!8768) (MissingVacant!8768 (index!37446 (_ BitVec 32))) )
))
(declare-fun lt!401959 () SeekEntryResult!8768)

(assert (=> b!888882 (= c!93915 ((_ is Found!8768) lt!401959))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51810 (_ BitVec 32)) SeekEntryResult!8768)

(assert (=> b!888882 (= lt!401959 (seekEntry!0 key!785 (_keys!9864 thiss!1181) (mask!25615 thiss!1181)))))

(declare-fun e!495377 () Bool)

(assert (=> b!888882 (= e!495376 e!495377)))

(declare-fun b!888883 () Bool)

(declare-datatypes ((Unit!30274 0))(
  ( (Unit!30275) )
))
(declare-fun e!495380 () Unit!30274)

(declare-fun Unit!30276 () Unit!30274)

(assert (=> b!888883 (= e!495380 Unit!30276)))

(declare-fun b!888884 () Bool)

(assert (=> b!888884 false))

(declare-fun lt!401968 () Unit!30274)

(declare-fun lt!401965 () Unit!30274)

(assert (=> b!888884 (= lt!401968 lt!401965)))

(declare-fun lt!401963 () SeekEntryResult!8768)

(declare-fun lt!401964 () (_ BitVec 32))

(assert (=> b!888884 (and ((_ is Found!8768) lt!401963) (= (index!37444 lt!401963) lt!401964))))

(assert (=> b!888884 (= lt!401963 (seekEntry!0 key!785 (_keys!9864 thiss!1181) (mask!25615 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51810 (_ BitVec 32)) Unit!30274)

(assert (=> b!888884 (= lt!401965 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401964 (_keys!9864 thiss!1181) (mask!25615 thiss!1181)))))

(declare-fun lt!401954 () Unit!30274)

(declare-fun lt!401961 () Unit!30274)

(assert (=> b!888884 (= lt!401954 lt!401961)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51810 (_ BitVec 32)) Bool)

(assert (=> b!888884 (arrayForallSeekEntryOrOpenFound!0 lt!401964 (_keys!9864 thiss!1181) (mask!25615 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30274)

(assert (=> b!888884 (= lt!401961 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9864 thiss!1181) (mask!25615 thiss!1181) #b00000000000000000000000000000000 lt!401964))))

(declare-fun arrayScanForKey!0 (array!51810 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888884 (= lt!401964 (arrayScanForKey!0 (_keys!9864 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!401966 () Unit!30274)

(declare-fun lt!401957 () Unit!30274)

(assert (=> b!888884 (= lt!401966 lt!401957)))

(assert (=> b!888884 e!495379))

(declare-fun c!93911 () Bool)

(assert (=> b!888884 (= c!93911 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!159 (array!51810 array!51812 (_ BitVec 32) (_ BitVec 32) V!28857 V!28857 (_ BitVec 64) Int) Unit!30274)

(assert (=> b!888884 (= lt!401957 (lemmaKeyInListMapIsInArray!159 (_keys!9864 thiss!1181) (_values!5168 thiss!1181) (mask!25615 thiss!1181) (extraKeys!4877 thiss!1181) (zeroValue!4981 thiss!1181) (minValue!4981 thiss!1181) key!785 (defaultEntry!5183 thiss!1181)))))

(declare-fun Unit!30277 () Unit!30274)

(assert (=> b!888884 (= e!495380 Unit!30277)))

(declare-fun b!888885 () Bool)

(assert (=> b!888885 (= e!495378 (not (= (bvand (extraKeys!4877 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!888886 () Bool)

(assert (=> b!888886 (= e!495377 true)))

(declare-fun lt!401967 () Unit!30274)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51810 (_ BitVec 64) (_ BitVec 32)) Unit!30274)

(assert (=> b!888886 (= lt!401967 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9864 thiss!1181) key!785 (index!37444 lt!401959)))))

(assert (=> b!888886 call!39492))

(declare-fun lt!401955 () Unit!30274)

(assert (=> b!888886 (= lt!401955 lt!401967)))

(declare-fun lt!401962 () Unit!30274)

(declare-fun lemmaValidKeyInArrayIsInListMap!206 (array!51810 array!51812 (_ BitVec 32) (_ BitVec 32) V!28857 V!28857 (_ BitVec 32) Int) Unit!30274)

(assert (=> b!888886 (= lt!401962 (lemmaValidKeyInArrayIsInListMap!206 (_keys!9864 thiss!1181) (_values!5168 thiss!1181) (mask!25615 thiss!1181) (extraKeys!4877 thiss!1181) (zeroValue!4981 thiss!1181) (minValue!4981 thiss!1181) (index!37444 lt!401959) (defaultEntry!5183 thiss!1181)))))

(declare-fun call!39490 () Bool)

(assert (=> b!888886 call!39490))

(declare-fun lt!401956 () Unit!30274)

(assert (=> b!888886 (= lt!401956 lt!401962)))

(declare-fun bm!39488 () Bool)

(declare-fun call!39491 () ListLongMap!10635)

(declare-fun getCurrentListMap!2617 (array!51810 array!51812 (_ BitVec 32) (_ BitVec 32) V!28857 V!28857 (_ BitVec 32) Int) ListLongMap!10635)

(assert (=> bm!39488 (= call!39491 (getCurrentListMap!2617 (_keys!9864 thiss!1181) (_values!5168 thiss!1181) (mask!25615 thiss!1181) (extraKeys!4877 thiss!1181) (zeroValue!4981 thiss!1181) (minValue!4981 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5183 thiss!1181)))))

(declare-fun b!888887 () Bool)

(assert (=> b!888887 (= e!495377 false)))

(declare-fun c!93912 () Bool)

(assert (=> b!888887 (= c!93912 call!39490)))

(declare-fun lt!401958 () Unit!30274)

(assert (=> b!888887 (= lt!401958 e!495380)))

(declare-fun b!888888 () Bool)

(assert (=> b!888888 (= e!495378 e!495376)))

(declare-fun c!93913 () Bool)

(assert (=> b!888888 (= c!93913 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39489 () Bool)

(assert (=> bm!39489 (= call!39490 (contains!4334 call!39491 (ite c!93915 (select (arr!24915 (_keys!9864 thiss!1181)) (index!37444 lt!401959)) key!785)))))

(assert (= (and d!110103 c!93914) b!888885))

(assert (= (and d!110103 (not c!93914)) b!888888))

(assert (= (and b!888888 c!93913) b!888879))

(assert (= (and b!888888 (not c!93913)) b!888882))

(assert (= (and b!888882 c!93915) b!888886))

(assert (= (and b!888882 (not c!93915)) b!888887))

(assert (= (and b!888887 c!93912) b!888884))

(assert (= (and b!888887 (not c!93912)) b!888883))

(assert (= (and b!888884 c!93911) b!888880))

(assert (= (and b!888884 (not c!93911)) b!888881))

(assert (= (or b!888886 b!888880) bm!39487))

(assert (= (or b!888886 b!888887) bm!39488))

(assert (= (or b!888886 b!888887) bm!39489))

(assert (=> d!110103 m!828019))

(assert (=> d!110103 m!828019))

(declare-fun m!828051 () Bool)

(assert (=> d!110103 m!828051))

(assert (=> d!110103 m!828031))

(declare-fun m!828053 () Bool)

(assert (=> b!888882 m!828053))

(declare-fun m!828055 () Bool)

(assert (=> b!888886 m!828055))

(declare-fun m!828057 () Bool)

(assert (=> b!888886 m!828057))

(declare-fun m!828059 () Bool)

(assert (=> bm!39487 m!828059))

(declare-fun m!828061 () Bool)

(assert (=> b!888884 m!828061))

(declare-fun m!828063 () Bool)

(assert (=> b!888884 m!828063))

(declare-fun m!828065 () Bool)

(assert (=> b!888884 m!828065))

(assert (=> b!888884 m!828053))

(declare-fun m!828067 () Bool)

(assert (=> b!888884 m!828067))

(declare-fun m!828069 () Bool)

(assert (=> b!888884 m!828069))

(declare-fun m!828071 () Bool)

(assert (=> bm!39488 m!828071))

(declare-fun m!828073 () Bool)

(assert (=> bm!39489 m!828073))

(declare-fun m!828075 () Bool)

(assert (=> bm!39489 m!828075))

(assert (=> b!888832 d!110103))

(declare-fun d!110105 () Bool)

(assert (=> d!110105 (= (array_inv!19606 (_keys!9864 thiss!1181)) (bvsge (size!25357 (_keys!9864 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888837 d!110105))

(declare-fun d!110107 () Bool)

(assert (=> d!110107 (= (array_inv!19607 (_values!5168 thiss!1181)) (bvsge (size!25358 (_values!5168 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888837 d!110107))

(declare-fun d!110109 () Bool)

(declare-fun res!602520 () Bool)

(declare-fun e!495383 () Bool)

(assert (=> d!110109 (=> (not res!602520) (not e!495383))))

(declare-fun simpleValid!291 (LongMapFixedSize!3972) Bool)

(assert (=> d!110109 (= res!602520 (simpleValid!291 thiss!1181))))

(assert (=> d!110109 (= (valid!1549 thiss!1181) e!495383)))

(declare-fun b!888895 () Bool)

(declare-fun res!602521 () Bool)

(assert (=> b!888895 (=> (not res!602521) (not e!495383))))

(declare-fun arrayCountValidKeys!0 (array!51810 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888895 (= res!602521 (= (arrayCountValidKeys!0 (_keys!9864 thiss!1181) #b00000000000000000000000000000000 (size!25357 (_keys!9864 thiss!1181))) (_size!2041 thiss!1181)))))

(declare-fun b!888896 () Bool)

(declare-fun res!602522 () Bool)

(assert (=> b!888896 (=> (not res!602522) (not e!495383))))

(assert (=> b!888896 (= res!602522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9864 thiss!1181) (mask!25615 thiss!1181)))))

(declare-fun b!888897 () Bool)

(declare-datatypes ((List!17695 0))(
  ( (Nil!17692) (Cons!17691 (h!18822 (_ BitVec 64)) (t!24994 List!17695)) )
))
(declare-fun arrayNoDuplicates!0 (array!51810 (_ BitVec 32) List!17695) Bool)

(assert (=> b!888897 (= e!495383 (arrayNoDuplicates!0 (_keys!9864 thiss!1181) #b00000000000000000000000000000000 Nil!17692))))

(assert (= (and d!110109 res!602520) b!888895))

(assert (= (and b!888895 res!602521) b!888896))

(assert (= (and b!888896 res!602522) b!888897))

(declare-fun m!828077 () Bool)

(assert (=> d!110109 m!828077))

(declare-fun m!828079 () Bool)

(assert (=> b!888895 m!828079))

(declare-fun m!828081 () Bool)

(assert (=> b!888896 m!828081))

(declare-fun m!828083 () Bool)

(assert (=> b!888897 m!828083))

(assert (=> start!75564 d!110109))

(declare-fun d!110111 () Bool)

(declare-fun isEmpty!677 (Option!449) Bool)

(assert (=> d!110111 (= (isDefined!322 (getValueByKey!443 (toList!5333 (map!12122 thiss!1181)) key!785)) (not (isEmpty!677 (getValueByKey!443 (toList!5333 (map!12122 thiss!1181)) key!785))))))

(declare-fun bs!24933 () Bool)

(assert (= bs!24933 d!110111))

(assert (=> bs!24933 m!828021))

(declare-fun m!828085 () Bool)

(assert (=> bs!24933 m!828085))

(assert (=> b!888833 d!110111))

(declare-fun d!110113 () Bool)

(declare-fun c!93920 () Bool)

(assert (=> d!110113 (= c!93920 (and ((_ is Cons!17689) (toList!5333 (map!12122 thiss!1181))) (= (_1!5980 (h!18820 (toList!5333 (map!12122 thiss!1181)))) key!785)))))

(declare-fun e!495388 () Option!449)

(assert (=> d!110113 (= (getValueByKey!443 (toList!5333 (map!12122 thiss!1181)) key!785) e!495388)))

(declare-fun b!888907 () Bool)

(declare-fun e!495389 () Option!449)

(assert (=> b!888907 (= e!495388 e!495389)))

(declare-fun c!93921 () Bool)

(assert (=> b!888907 (= c!93921 (and ((_ is Cons!17689) (toList!5333 (map!12122 thiss!1181))) (not (= (_1!5980 (h!18820 (toList!5333 (map!12122 thiss!1181)))) key!785))))))

(declare-fun b!888906 () Bool)

(assert (=> b!888906 (= e!495388 (Some!448 (_2!5980 (h!18820 (toList!5333 (map!12122 thiss!1181))))))))

(declare-fun b!888909 () Bool)

(assert (=> b!888909 (= e!495389 None!447)))

(declare-fun b!888908 () Bool)

(assert (=> b!888908 (= e!495389 (getValueByKey!443 (t!24992 (toList!5333 (map!12122 thiss!1181))) key!785))))

(assert (= (and d!110113 c!93920) b!888906))

(assert (= (and d!110113 (not c!93920)) b!888907))

(assert (= (and b!888907 c!93921) b!888908))

(assert (= (and b!888907 (not c!93921)) b!888909))

(declare-fun m!828087 () Bool)

(assert (=> b!888908 m!828087))

(assert (=> b!888833 d!110113))

(declare-fun d!110115 () Bool)

(assert (=> d!110115 (= (map!12122 thiss!1181) (getCurrentListMap!2617 (_keys!9864 thiss!1181) (_values!5168 thiss!1181) (mask!25615 thiss!1181) (extraKeys!4877 thiss!1181) (zeroValue!4981 thiss!1181) (minValue!4981 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5183 thiss!1181)))))

(declare-fun bs!24934 () Bool)

(assert (= bs!24934 d!110115))

(assert (=> bs!24934 m!828071))

(assert (=> b!888833 d!110115))

(declare-fun b!888916 () Bool)

(declare-fun e!495395 () Bool)

(assert (=> b!888916 (= e!495395 tp_is_empty!17919)))

(declare-fun mapNonEmpty!28425 () Bool)

(declare-fun mapRes!28425 () Bool)

(declare-fun tp!54737 () Bool)

(assert (=> mapNonEmpty!28425 (= mapRes!28425 (and tp!54737 e!495395))))

(declare-fun mapRest!28425 () (Array (_ BitVec 32) ValueCell!8478))

(declare-fun mapKey!28425 () (_ BitVec 32))

(declare-fun mapValue!28425 () ValueCell!8478)

(assert (=> mapNonEmpty!28425 (= mapRest!28419 (store mapRest!28425 mapKey!28425 mapValue!28425))))

(declare-fun condMapEmpty!28425 () Bool)

(declare-fun mapDefault!28425 () ValueCell!8478)

(assert (=> mapNonEmpty!28419 (= condMapEmpty!28425 (= mapRest!28419 ((as const (Array (_ BitVec 32) ValueCell!8478)) mapDefault!28425)))))

(declare-fun e!495394 () Bool)

(assert (=> mapNonEmpty!28419 (= tp!54728 (and e!495394 mapRes!28425))))

(declare-fun mapIsEmpty!28425 () Bool)

(assert (=> mapIsEmpty!28425 mapRes!28425))

(declare-fun b!888917 () Bool)

(assert (=> b!888917 (= e!495394 tp_is_empty!17919)))

(assert (= (and mapNonEmpty!28419 condMapEmpty!28425) mapIsEmpty!28425))

(assert (= (and mapNonEmpty!28419 (not condMapEmpty!28425)) mapNonEmpty!28425))

(assert (= (and mapNonEmpty!28425 ((_ is ValueCellFull!8478) mapValue!28425)) b!888916))

(assert (= (and mapNonEmpty!28419 ((_ is ValueCellFull!8478) mapDefault!28425)) b!888917))

(declare-fun m!828089 () Bool)

(assert (=> mapNonEmpty!28425 m!828089))

(check-sat (not d!110103) (not bm!39488) (not b!888896) (not d!110115) b_and!25831 (not b_next!15591) (not b!888884) (not d!110111) (not b!888882) (not d!110109) tp_is_empty!17919 (not b!888895) (not b!888886) (not bm!39487) (not b!888908) (not mapNonEmpty!28425) (not b!888897) (not bm!39489))
(check-sat b_and!25831 (not b_next!15591))
