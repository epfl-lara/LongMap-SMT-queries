; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107642 () Bool)

(assert start!107642)

(declare-fun b!1273865 () Bool)

(declare-fun b_free!27757 () Bool)

(declare-fun b_next!27757 () Bool)

(assert (=> b!1273865 (= b_free!27757 (not b_next!27757))))

(declare-fun tp!97834 () Bool)

(declare-fun b_and!45795 () Bool)

(assert (=> b!1273865 (= tp!97834 b_and!45795)))

(declare-fun b!1273862 () Bool)

(declare-fun res!847005 () Bool)

(declare-fun e!726909 () Bool)

(assert (=> b!1273862 (=> (not res!847005) (not e!726909))))

(declare-datatypes ((V!49363 0))(
  ( (V!49364 (val!16638 Int)) )
))
(declare-datatypes ((ValueCell!15710 0))(
  ( (ValueCellFull!15710 (v!19274 V!49363)) (EmptyCell!15710) )
))
(declare-datatypes ((array!83435 0))(
  ( (array!83436 (arr!40238 (Array (_ BitVec 32) ValueCell!15710)) (size!40787 (_ BitVec 32))) )
))
(declare-datatypes ((array!83437 0))(
  ( (array!83438 (arr!40239 (Array (_ BitVec 32) (_ BitVec 64))) (size!40788 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6184 0))(
  ( (LongMapFixedSize!6185 (defaultEntry!6738 Int) (mask!34531 (_ BitVec 32)) (extraKeys!6417 (_ BitVec 32)) (zeroValue!6523 V!49363) (minValue!6523 V!49363) (_size!3147 (_ BitVec 32)) (_keys!12149 array!83437) (_values!6761 array!83435) (_vacant!3147 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6184)

(declare-fun arrayCountValidKeys!0 (array!83437 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273862 (= res!847005 (= (arrayCountValidKeys!0 (_keys!12149 thiss!1551) #b00000000000000000000000000000000 (size!40788 (_keys!12149 thiss!1551))) (_size!3147 thiss!1551)))))

(declare-fun mapIsEmpty!51328 () Bool)

(declare-fun mapRes!51328 () Bool)

(assert (=> mapIsEmpty!51328 mapRes!51328))

(declare-fun b!1273863 () Bool)

(declare-fun e!726910 () Bool)

(declare-fun tp_is_empty!33127 () Bool)

(assert (=> b!1273863 (= e!726910 tp_is_empty!33127)))

(declare-fun b!1273864 () Bool)

(declare-fun res!847004 () Bool)

(assert (=> b!1273864 (=> (not res!847004) (not e!726909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83437 (_ BitVec 32)) Bool)

(assert (=> b!1273864 (= res!847004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12149 thiss!1551) (mask!34531 thiss!1551)))))

(declare-fun res!847003 () Bool)

(assert (=> start!107642 (=> (not res!847003) (not e!726909))))

(declare-fun simpleValid!477 (LongMapFixedSize!6184) Bool)

(assert (=> start!107642 (= res!847003 (simpleValid!477 thiss!1551))))

(assert (=> start!107642 e!726909))

(declare-fun e!726908 () Bool)

(assert (=> start!107642 e!726908))

(declare-fun e!726911 () Bool)

(declare-fun array_inv!30743 (array!83437) Bool)

(declare-fun array_inv!30744 (array!83435) Bool)

(assert (=> b!1273865 (= e!726908 (and tp!97834 tp_is_empty!33127 (array_inv!30743 (_keys!12149 thiss!1551)) (array_inv!30744 (_values!6761 thiss!1551)) e!726911))))

(declare-fun b!1273866 () Bool)

(assert (=> b!1273866 (= e!726911 (and e!726910 mapRes!51328))))

(declare-fun condMapEmpty!51328 () Bool)

(declare-fun mapDefault!51328 () ValueCell!15710)

(assert (=> b!1273866 (= condMapEmpty!51328 (= (arr!40238 (_values!6761 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15710)) mapDefault!51328)))))

(declare-fun b!1273867 () Bool)

(declare-fun e!726906 () Bool)

(assert (=> b!1273867 (= e!726906 tp_is_empty!33127)))

(declare-fun b!1273868 () Bool)

(assert (=> b!1273868 (= e!726909 (and (bvsle #b00000000000000000000000000000000 (size!40788 (_keys!12149 thiss!1551))) (bvsge (size!40788 (_keys!12149 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!51328 () Bool)

(declare-fun tp!97835 () Bool)

(assert (=> mapNonEmpty!51328 (= mapRes!51328 (and tp!97835 e!726906))))

(declare-fun mapKey!51328 () (_ BitVec 32))

(declare-fun mapValue!51328 () ValueCell!15710)

(declare-fun mapRest!51328 () (Array (_ BitVec 32) ValueCell!15710))

(assert (=> mapNonEmpty!51328 (= (arr!40238 (_values!6761 thiss!1551)) (store mapRest!51328 mapKey!51328 mapValue!51328))))

(assert (= (and start!107642 res!847003) b!1273862))

(assert (= (and b!1273862 res!847005) b!1273864))

(assert (= (and b!1273864 res!847004) b!1273868))

(assert (= (and b!1273866 condMapEmpty!51328) mapIsEmpty!51328))

(assert (= (and b!1273866 (not condMapEmpty!51328)) mapNonEmpty!51328))

(get-info :version)

(assert (= (and mapNonEmpty!51328 ((_ is ValueCellFull!15710) mapValue!51328)) b!1273867))

(assert (= (and b!1273866 ((_ is ValueCellFull!15710) mapDefault!51328)) b!1273863))

(assert (= b!1273865 b!1273866))

(assert (= start!107642 b!1273865))

(declare-fun m!1170379 () Bool)

(assert (=> start!107642 m!1170379))

(declare-fun m!1170381 () Bool)

(assert (=> b!1273864 m!1170381))

(declare-fun m!1170383 () Bool)

(assert (=> b!1273862 m!1170383))

(declare-fun m!1170385 () Bool)

(assert (=> mapNonEmpty!51328 m!1170385))

(declare-fun m!1170387 () Bool)

(assert (=> b!1273865 m!1170387))

(declare-fun m!1170389 () Bool)

(assert (=> b!1273865 m!1170389))

(check-sat (not b!1273865) b_and!45795 (not mapNonEmpty!51328) tp_is_empty!33127 (not b_next!27757) (not b!1273862) (not start!107642) (not b!1273864))
(check-sat b_and!45795 (not b_next!27757))
(get-model)

(declare-fun d!139943 () Bool)

(assert (=> d!139943 (= (array_inv!30743 (_keys!12149 thiss!1551)) (bvsge (size!40788 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273865 d!139943))

(declare-fun d!139945 () Bool)

(assert (=> d!139945 (= (array_inv!30744 (_values!6761 thiss!1551)) (bvsge (size!40787 (_values!6761 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273865 d!139945))

(declare-fun b!1273919 () Bool)

(declare-fun e!726956 () Bool)

(declare-fun e!726955 () Bool)

(assert (=> b!1273919 (= e!726956 e!726955)))

(declare-fun c!123773 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273919 (= c!123773 (validKeyInArray!0 (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1273920 () Bool)

(declare-fun e!726954 () Bool)

(assert (=> b!1273920 (= e!726955 e!726954)))

(declare-fun lt!574991 () (_ BitVec 64))

(assert (=> b!1273920 (= lt!574991 (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42182 0))(
  ( (Unit!42183) )
))
(declare-fun lt!574992 () Unit!42182)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83437 (_ BitVec 64) (_ BitVec 32)) Unit!42182)

(assert (=> b!1273920 (= lt!574992 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12149 thiss!1551) lt!574991 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273920 (arrayContainsKey!0 (_keys!12149 thiss!1551) lt!574991 #b00000000000000000000000000000000)))

(declare-fun lt!574990 () Unit!42182)

(assert (=> b!1273920 (= lt!574990 lt!574992)))

(declare-fun res!847028 () Bool)

(declare-datatypes ((SeekEntryResult!9997 0))(
  ( (MissingZero!9997 (index!42359 (_ BitVec 32))) (Found!9997 (index!42360 (_ BitVec 32))) (Intermediate!9997 (undefined!10809 Bool) (index!42361 (_ BitVec 32)) (x!112693 (_ BitVec 32))) (Undefined!9997) (MissingVacant!9997 (index!42362 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83437 (_ BitVec 32)) SeekEntryResult!9997)

(assert (=> b!1273920 (= res!847028 (= (seekEntryOrOpen!0 (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000) (_keys!12149 thiss!1551) (mask!34531 thiss!1551)) (Found!9997 #b00000000000000000000000000000000)))))

(assert (=> b!1273920 (=> (not res!847028) (not e!726954))))

(declare-fun d!139947 () Bool)

(declare-fun res!847029 () Bool)

(assert (=> d!139947 (=> res!847029 e!726956)))

(assert (=> d!139947 (= res!847029 (bvsge #b00000000000000000000000000000000 (size!40788 (_keys!12149 thiss!1551))))))

(assert (=> d!139947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12149 thiss!1551) (mask!34531 thiss!1551)) e!726956)))

(declare-fun b!1273921 () Bool)

(declare-fun call!62596 () Bool)

(assert (=> b!1273921 (= e!726954 call!62596)))

(declare-fun b!1273922 () Bool)

(assert (=> b!1273922 (= e!726955 call!62596)))

(declare-fun bm!62593 () Bool)

(assert (=> bm!62593 (= call!62596 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12149 thiss!1551) (mask!34531 thiss!1551)))))

(assert (= (and d!139947 (not res!847029)) b!1273919))

(assert (= (and b!1273919 c!123773) b!1273920))

(assert (= (and b!1273919 (not c!123773)) b!1273922))

(assert (= (and b!1273920 res!847028) b!1273921))

(assert (= (or b!1273921 b!1273922) bm!62593))

(declare-fun m!1170415 () Bool)

(assert (=> b!1273919 m!1170415))

(assert (=> b!1273919 m!1170415))

(declare-fun m!1170417 () Bool)

(assert (=> b!1273919 m!1170417))

(assert (=> b!1273920 m!1170415))

(declare-fun m!1170419 () Bool)

(assert (=> b!1273920 m!1170419))

(declare-fun m!1170421 () Bool)

(assert (=> b!1273920 m!1170421))

(assert (=> b!1273920 m!1170415))

(declare-fun m!1170423 () Bool)

(assert (=> b!1273920 m!1170423))

(declare-fun m!1170425 () Bool)

(assert (=> bm!62593 m!1170425))

(assert (=> b!1273864 d!139947))

(declare-fun b!1273931 () Bool)

(declare-fun e!726962 () (_ BitVec 32))

(assert (=> b!1273931 (= e!726962 #b00000000000000000000000000000000)))

(declare-fun d!139949 () Bool)

(declare-fun lt!574995 () (_ BitVec 32))

(assert (=> d!139949 (and (bvsge lt!574995 #b00000000000000000000000000000000) (bvsle lt!574995 (bvsub (size!40788 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!139949 (= lt!574995 e!726962)))

(declare-fun c!123778 () Bool)

(assert (=> d!139949 (= c!123778 (bvsge #b00000000000000000000000000000000 (size!40788 (_keys!12149 thiss!1551))))))

(assert (=> d!139949 (and (bvsle #b00000000000000000000000000000000 (size!40788 (_keys!12149 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40788 (_keys!12149 thiss!1551)) (size!40788 (_keys!12149 thiss!1551))))))

(assert (=> d!139949 (= (arrayCountValidKeys!0 (_keys!12149 thiss!1551) #b00000000000000000000000000000000 (size!40788 (_keys!12149 thiss!1551))) lt!574995)))

(declare-fun b!1273932 () Bool)

(declare-fun e!726961 () (_ BitVec 32))

(declare-fun call!62599 () (_ BitVec 32))

(assert (=> b!1273932 (= e!726961 call!62599)))

(declare-fun bm!62596 () Bool)

(assert (=> bm!62596 (= call!62599 (arrayCountValidKeys!0 (_keys!12149 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40788 (_keys!12149 thiss!1551))))))

(declare-fun b!1273933 () Bool)

(assert (=> b!1273933 (= e!726961 (bvadd #b00000000000000000000000000000001 call!62599))))

(declare-fun b!1273934 () Bool)

(assert (=> b!1273934 (= e!726962 e!726961)))

(declare-fun c!123779 () Bool)

(assert (=> b!1273934 (= c!123779 (validKeyInArray!0 (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (= (and d!139949 c!123778) b!1273931))

(assert (= (and d!139949 (not c!123778)) b!1273934))

(assert (= (and b!1273934 c!123779) b!1273933))

(assert (= (and b!1273934 (not c!123779)) b!1273932))

(assert (= (or b!1273933 b!1273932) bm!62596))

(declare-fun m!1170427 () Bool)

(assert (=> bm!62596 m!1170427))

(assert (=> b!1273934 m!1170415))

(assert (=> b!1273934 m!1170415))

(assert (=> b!1273934 m!1170417))

(assert (=> b!1273862 d!139949))

(declare-fun b!1273944 () Bool)

(declare-fun res!847041 () Bool)

(declare-fun e!726965 () Bool)

(assert (=> b!1273944 (=> (not res!847041) (not e!726965))))

(declare-fun size!40793 (LongMapFixedSize!6184) (_ BitVec 32))

(assert (=> b!1273944 (= res!847041 (bvsge (size!40793 thiss!1551) (_size!3147 thiss!1551)))))

(declare-fun d!139951 () Bool)

(declare-fun res!847039 () Bool)

(assert (=> d!139951 (=> (not res!847039) (not e!726965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!139951 (= res!847039 (validMask!0 (mask!34531 thiss!1551)))))

(assert (=> d!139951 (= (simpleValid!477 thiss!1551) e!726965)))

(declare-fun b!1273943 () Bool)

(declare-fun res!847038 () Bool)

(assert (=> b!1273943 (=> (not res!847038) (not e!726965))))

(assert (=> b!1273943 (= res!847038 (and (= (size!40787 (_values!6761 thiss!1551)) (bvadd (mask!34531 thiss!1551) #b00000000000000000000000000000001)) (= (size!40788 (_keys!12149 thiss!1551)) (size!40787 (_values!6761 thiss!1551))) (bvsge (_size!3147 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3147 thiss!1551) (bvadd (mask!34531 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1273945 () Bool)

(declare-fun res!847040 () Bool)

(assert (=> b!1273945 (=> (not res!847040) (not e!726965))))

(assert (=> b!1273945 (= res!847040 (= (size!40793 thiss!1551) (bvadd (_size!3147 thiss!1551) (bvsdiv (bvadd (extraKeys!6417 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273946 () Bool)

(assert (=> b!1273946 (= e!726965 (and (bvsge (extraKeys!6417 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6417 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3147 thiss!1551) #b00000000000000000000000000000000)))))

(assert (= (and d!139951 res!847039) b!1273943))

(assert (= (and b!1273943 res!847038) b!1273944))

(assert (= (and b!1273944 res!847041) b!1273945))

(assert (= (and b!1273945 res!847040) b!1273946))

(declare-fun m!1170429 () Bool)

(assert (=> b!1273944 m!1170429))

(declare-fun m!1170431 () Bool)

(assert (=> d!139951 m!1170431))

(assert (=> b!1273945 m!1170429))

(assert (=> start!107642 d!139951))

(declare-fun mapNonEmpty!51337 () Bool)

(declare-fun mapRes!51337 () Bool)

(declare-fun tp!97850 () Bool)

(declare-fun e!726971 () Bool)

(assert (=> mapNonEmpty!51337 (= mapRes!51337 (and tp!97850 e!726971))))

(declare-fun mapValue!51337 () ValueCell!15710)

(declare-fun mapRest!51337 () (Array (_ BitVec 32) ValueCell!15710))

(declare-fun mapKey!51337 () (_ BitVec 32))

(assert (=> mapNonEmpty!51337 (= mapRest!51328 (store mapRest!51337 mapKey!51337 mapValue!51337))))

(declare-fun mapIsEmpty!51337 () Bool)

(assert (=> mapIsEmpty!51337 mapRes!51337))

(declare-fun b!1273953 () Bool)

(assert (=> b!1273953 (= e!726971 tp_is_empty!33127)))

(declare-fun b!1273954 () Bool)

(declare-fun e!726970 () Bool)

(assert (=> b!1273954 (= e!726970 tp_is_empty!33127)))

(declare-fun condMapEmpty!51337 () Bool)

(declare-fun mapDefault!51337 () ValueCell!15710)

(assert (=> mapNonEmpty!51328 (= condMapEmpty!51337 (= mapRest!51328 ((as const (Array (_ BitVec 32) ValueCell!15710)) mapDefault!51337)))))

(assert (=> mapNonEmpty!51328 (= tp!97835 (and e!726970 mapRes!51337))))

(assert (= (and mapNonEmpty!51328 condMapEmpty!51337) mapIsEmpty!51337))

(assert (= (and mapNonEmpty!51328 (not condMapEmpty!51337)) mapNonEmpty!51337))

(assert (= (and mapNonEmpty!51337 ((_ is ValueCellFull!15710) mapValue!51337)) b!1273953))

(assert (= (and mapNonEmpty!51328 ((_ is ValueCellFull!15710) mapDefault!51337)) b!1273954))

(declare-fun m!1170433 () Bool)

(assert (=> mapNonEmpty!51337 m!1170433))

(check-sat (not mapNonEmpty!51337) (not b!1273944) b_and!45795 (not b!1273920) tp_is_empty!33127 (not b!1273934) (not b_next!27757) (not bm!62596) (not bm!62593) (not d!139951) (not b!1273945) (not b!1273919))
(check-sat b_and!45795 (not b_next!27757))
(get-model)

(declare-fun d!139953 () Bool)

(assert (=> d!139953 (arrayContainsKey!0 (_keys!12149 thiss!1551) lt!574991 #b00000000000000000000000000000000)))

(declare-fun lt!574998 () Unit!42182)

(declare-fun choose!13 (array!83437 (_ BitVec 64) (_ BitVec 32)) Unit!42182)

(assert (=> d!139953 (= lt!574998 (choose!13 (_keys!12149 thiss!1551) lt!574991 #b00000000000000000000000000000000))))

(assert (=> d!139953 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!139953 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12149 thiss!1551) lt!574991 #b00000000000000000000000000000000) lt!574998)))

(declare-fun bs!36140 () Bool)

(assert (= bs!36140 d!139953))

(assert (=> bs!36140 m!1170421))

(declare-fun m!1170435 () Bool)

(assert (=> bs!36140 m!1170435))

(assert (=> b!1273920 d!139953))

(declare-fun d!139955 () Bool)

(declare-fun res!847046 () Bool)

(declare-fun e!726976 () Bool)

(assert (=> d!139955 (=> res!847046 e!726976)))

(assert (=> d!139955 (= res!847046 (= (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000) lt!574991))))

(assert (=> d!139955 (= (arrayContainsKey!0 (_keys!12149 thiss!1551) lt!574991 #b00000000000000000000000000000000) e!726976)))

(declare-fun b!1273959 () Bool)

(declare-fun e!726977 () Bool)

(assert (=> b!1273959 (= e!726976 e!726977)))

(declare-fun res!847047 () Bool)

(assert (=> b!1273959 (=> (not res!847047) (not e!726977))))

(assert (=> b!1273959 (= res!847047 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40788 (_keys!12149 thiss!1551))))))

(declare-fun b!1273960 () Bool)

(assert (=> b!1273960 (= e!726977 (arrayContainsKey!0 (_keys!12149 thiss!1551) lt!574991 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!139955 (not res!847046)) b!1273959))

(assert (= (and b!1273959 res!847047) b!1273960))

(assert (=> d!139955 m!1170415))

(declare-fun m!1170437 () Bool)

(assert (=> b!1273960 m!1170437))

(assert (=> b!1273920 d!139955))

(declare-fun b!1273973 () Bool)

(declare-fun e!726985 () SeekEntryResult!9997)

(declare-fun e!726984 () SeekEntryResult!9997)

(assert (=> b!1273973 (= e!726985 e!726984)))

(declare-fun lt!575006 () (_ BitVec 64))

(declare-fun lt!575005 () SeekEntryResult!9997)

(assert (=> b!1273973 (= lt!575006 (select (arr!40239 (_keys!12149 thiss!1551)) (index!42361 lt!575005)))))

(declare-fun c!123786 () Bool)

(assert (=> b!1273973 (= c!123786 (= lt!575006 (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun d!139957 () Bool)

(declare-fun lt!575007 () SeekEntryResult!9997)

(assert (=> d!139957 (and (or ((_ is Undefined!9997) lt!575007) (not ((_ is Found!9997) lt!575007)) (and (bvsge (index!42360 lt!575007) #b00000000000000000000000000000000) (bvslt (index!42360 lt!575007) (size!40788 (_keys!12149 thiss!1551))))) (or ((_ is Undefined!9997) lt!575007) ((_ is Found!9997) lt!575007) (not ((_ is MissingZero!9997) lt!575007)) (and (bvsge (index!42359 lt!575007) #b00000000000000000000000000000000) (bvslt (index!42359 lt!575007) (size!40788 (_keys!12149 thiss!1551))))) (or ((_ is Undefined!9997) lt!575007) ((_ is Found!9997) lt!575007) ((_ is MissingZero!9997) lt!575007) (not ((_ is MissingVacant!9997) lt!575007)) (and (bvsge (index!42362 lt!575007) #b00000000000000000000000000000000) (bvslt (index!42362 lt!575007) (size!40788 (_keys!12149 thiss!1551))))) (or ((_ is Undefined!9997) lt!575007) (ite ((_ is Found!9997) lt!575007) (= (select (arr!40239 (_keys!12149 thiss!1551)) (index!42360 lt!575007)) (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9997) lt!575007) (= (select (arr!40239 (_keys!12149 thiss!1551)) (index!42359 lt!575007)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9997) lt!575007) (= (select (arr!40239 (_keys!12149 thiss!1551)) (index!42362 lt!575007)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!139957 (= lt!575007 e!726985)))

(declare-fun c!123787 () Bool)

(assert (=> d!139957 (= c!123787 (and ((_ is Intermediate!9997) lt!575005) (undefined!10809 lt!575005)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!83437 (_ BitVec 32)) SeekEntryResult!9997)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!139957 (= lt!575005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000) (mask!34531 thiss!1551)) (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000) (_keys!12149 thiss!1551) (mask!34531 thiss!1551)))))

(assert (=> d!139957 (validMask!0 (mask!34531 thiss!1551))))

(assert (=> d!139957 (= (seekEntryOrOpen!0 (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000) (_keys!12149 thiss!1551) (mask!34531 thiss!1551)) lt!575007)))

(declare-fun b!1273974 () Bool)

(assert (=> b!1273974 (= e!726985 Undefined!9997)))

(declare-fun b!1273975 () Bool)

(declare-fun c!123788 () Bool)

(assert (=> b!1273975 (= c!123788 (= lt!575006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!726986 () SeekEntryResult!9997)

(assert (=> b!1273975 (= e!726984 e!726986)))

(declare-fun b!1273976 () Bool)

(assert (=> b!1273976 (= e!726986 (MissingZero!9997 (index!42361 lt!575005)))))

(declare-fun b!1273977 () Bool)

(assert (=> b!1273977 (= e!726984 (Found!9997 (index!42361 lt!575005)))))

(declare-fun b!1273978 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!83437 (_ BitVec 32)) SeekEntryResult!9997)

(assert (=> b!1273978 (= e!726986 (seekKeyOrZeroReturnVacant!0 (x!112693 lt!575005) (index!42361 lt!575005) (index!42361 lt!575005) (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000) (_keys!12149 thiss!1551) (mask!34531 thiss!1551)))))

(assert (= (and d!139957 c!123787) b!1273974))

(assert (= (and d!139957 (not c!123787)) b!1273973))

(assert (= (and b!1273973 c!123786) b!1273977))

(assert (= (and b!1273973 (not c!123786)) b!1273975))

(assert (= (and b!1273975 c!123788) b!1273976))

(assert (= (and b!1273975 (not c!123788)) b!1273978))

(declare-fun m!1170439 () Bool)

(assert (=> b!1273973 m!1170439))

(assert (=> d!139957 m!1170415))

(declare-fun m!1170441 () Bool)

(assert (=> d!139957 m!1170441))

(declare-fun m!1170443 () Bool)

(assert (=> d!139957 m!1170443))

(declare-fun m!1170445 () Bool)

(assert (=> d!139957 m!1170445))

(declare-fun m!1170447 () Bool)

(assert (=> d!139957 m!1170447))

(assert (=> d!139957 m!1170441))

(assert (=> d!139957 m!1170415))

(declare-fun m!1170449 () Bool)

(assert (=> d!139957 m!1170449))

(assert (=> d!139957 m!1170431))

(assert (=> b!1273978 m!1170415))

(declare-fun m!1170451 () Bool)

(assert (=> b!1273978 m!1170451))

(assert (=> b!1273920 d!139957))

(declare-fun d!139959 () Bool)

(assert (=> d!139959 (= (validMask!0 (mask!34531 thiss!1551)) (and (or (= (mask!34531 thiss!1551) #b00000000000000000000000000000111) (= (mask!34531 thiss!1551) #b00000000000000000000000000001111) (= (mask!34531 thiss!1551) #b00000000000000000000000000011111) (= (mask!34531 thiss!1551) #b00000000000000000000000000111111) (= (mask!34531 thiss!1551) #b00000000000000000000000001111111) (= (mask!34531 thiss!1551) #b00000000000000000000000011111111) (= (mask!34531 thiss!1551) #b00000000000000000000000111111111) (= (mask!34531 thiss!1551) #b00000000000000000000001111111111) (= (mask!34531 thiss!1551) #b00000000000000000000011111111111) (= (mask!34531 thiss!1551) #b00000000000000000000111111111111) (= (mask!34531 thiss!1551) #b00000000000000000001111111111111) (= (mask!34531 thiss!1551) #b00000000000000000011111111111111) (= (mask!34531 thiss!1551) #b00000000000000000111111111111111) (= (mask!34531 thiss!1551) #b00000000000000001111111111111111) (= (mask!34531 thiss!1551) #b00000000000000011111111111111111) (= (mask!34531 thiss!1551) #b00000000000000111111111111111111) (= (mask!34531 thiss!1551) #b00000000000001111111111111111111) (= (mask!34531 thiss!1551) #b00000000000011111111111111111111) (= (mask!34531 thiss!1551) #b00000000000111111111111111111111) (= (mask!34531 thiss!1551) #b00000000001111111111111111111111) (= (mask!34531 thiss!1551) #b00000000011111111111111111111111) (= (mask!34531 thiss!1551) #b00000000111111111111111111111111) (= (mask!34531 thiss!1551) #b00000001111111111111111111111111) (= (mask!34531 thiss!1551) #b00000011111111111111111111111111) (= (mask!34531 thiss!1551) #b00000111111111111111111111111111) (= (mask!34531 thiss!1551) #b00001111111111111111111111111111) (= (mask!34531 thiss!1551) #b00011111111111111111111111111111) (= (mask!34531 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34531 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> d!139951 d!139959))

(declare-fun b!1273979 () Bool)

(declare-fun e!726988 () (_ BitVec 32))

(assert (=> b!1273979 (= e!726988 #b00000000000000000000000000000000)))

(declare-fun d!139961 () Bool)

(declare-fun lt!575008 () (_ BitVec 32))

(assert (=> d!139961 (and (bvsge lt!575008 #b00000000000000000000000000000000) (bvsle lt!575008 (bvsub (size!40788 (_keys!12149 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!139961 (= lt!575008 e!726988)))

(declare-fun c!123789 () Bool)

(assert (=> d!139961 (= c!123789 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40788 (_keys!12149 thiss!1551))))))

(assert (=> d!139961 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40788 (_keys!12149 thiss!1551))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!40788 (_keys!12149 thiss!1551)) (size!40788 (_keys!12149 thiss!1551))))))

(assert (=> d!139961 (= (arrayCountValidKeys!0 (_keys!12149 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40788 (_keys!12149 thiss!1551))) lt!575008)))

(declare-fun b!1273980 () Bool)

(declare-fun e!726987 () (_ BitVec 32))

(declare-fun call!62600 () (_ BitVec 32))

(assert (=> b!1273980 (= e!726987 call!62600)))

(declare-fun bm!62597 () Bool)

(assert (=> bm!62597 (= call!62600 (arrayCountValidKeys!0 (_keys!12149 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!40788 (_keys!12149 thiss!1551))))))

(declare-fun b!1273981 () Bool)

(assert (=> b!1273981 (= e!726987 (bvadd #b00000000000000000000000000000001 call!62600))))

(declare-fun b!1273982 () Bool)

(assert (=> b!1273982 (= e!726988 e!726987)))

(declare-fun c!123790 () Bool)

(assert (=> b!1273982 (= c!123790 (validKeyInArray!0 (select (arr!40239 (_keys!12149 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!139961 c!123789) b!1273979))

(assert (= (and d!139961 (not c!123789)) b!1273982))

(assert (= (and b!1273982 c!123790) b!1273981))

(assert (= (and b!1273982 (not c!123790)) b!1273980))

(assert (= (or b!1273981 b!1273980) bm!62597))

(declare-fun m!1170453 () Bool)

(assert (=> bm!62597 m!1170453))

(declare-fun m!1170455 () Bool)

(assert (=> b!1273982 m!1170455))

(assert (=> b!1273982 m!1170455))

(declare-fun m!1170457 () Bool)

(assert (=> b!1273982 m!1170457))

(assert (=> bm!62596 d!139961))

(declare-fun d!139963 () Bool)

(assert (=> d!139963 (= (validKeyInArray!0 (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000)) (and (not (= (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!40239 (_keys!12149 thiss!1551)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1273934 d!139963))

(declare-fun d!139965 () Bool)

(assert (=> d!139965 (= (size!40793 thiss!1551) (bvadd (_size!3147 thiss!1551) (bvsdiv (bvadd (extraKeys!6417 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1273944 d!139965))

(assert (=> b!1273945 d!139965))

(declare-fun b!1273983 () Bool)

(declare-fun e!726991 () Bool)

(declare-fun e!726990 () Bool)

(assert (=> b!1273983 (= e!726991 e!726990)))

(declare-fun c!123791 () Bool)

(assert (=> b!1273983 (= c!123791 (validKeyInArray!0 (select (arr!40239 (_keys!12149 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1273984 () Bool)

(declare-fun e!726989 () Bool)

(assert (=> b!1273984 (= e!726990 e!726989)))

(declare-fun lt!575010 () (_ BitVec 64))

(assert (=> b!1273984 (= lt!575010 (select (arr!40239 (_keys!12149 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!575011 () Unit!42182)

(assert (=> b!1273984 (= lt!575011 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12149 thiss!1551) lt!575010 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1273984 (arrayContainsKey!0 (_keys!12149 thiss!1551) lt!575010 #b00000000000000000000000000000000)))

(declare-fun lt!575009 () Unit!42182)

(assert (=> b!1273984 (= lt!575009 lt!575011)))

(declare-fun res!847048 () Bool)

(assert (=> b!1273984 (= res!847048 (= (seekEntryOrOpen!0 (select (arr!40239 (_keys!12149 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!12149 thiss!1551) (mask!34531 thiss!1551)) (Found!9997 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1273984 (=> (not res!847048) (not e!726989))))

(declare-fun d!139967 () Bool)

(declare-fun res!847049 () Bool)

(assert (=> d!139967 (=> res!847049 e!726991)))

(assert (=> d!139967 (= res!847049 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40788 (_keys!12149 thiss!1551))))))

(assert (=> d!139967 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12149 thiss!1551) (mask!34531 thiss!1551)) e!726991)))

(declare-fun b!1273985 () Bool)

(declare-fun call!62601 () Bool)

(assert (=> b!1273985 (= e!726989 call!62601)))

(declare-fun b!1273986 () Bool)

(assert (=> b!1273986 (= e!726990 call!62601)))

(declare-fun bm!62598 () Bool)

(assert (=> bm!62598 (= call!62601 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!12149 thiss!1551) (mask!34531 thiss!1551)))))

(assert (= (and d!139967 (not res!847049)) b!1273983))

(assert (= (and b!1273983 c!123791) b!1273984))

(assert (= (and b!1273983 (not c!123791)) b!1273986))

(assert (= (and b!1273984 res!847048) b!1273985))

(assert (= (or b!1273985 b!1273986) bm!62598))

(assert (=> b!1273983 m!1170455))

(assert (=> b!1273983 m!1170455))

(assert (=> b!1273983 m!1170457))

(assert (=> b!1273984 m!1170455))

(declare-fun m!1170459 () Bool)

(assert (=> b!1273984 m!1170459))

(declare-fun m!1170461 () Bool)

(assert (=> b!1273984 m!1170461))

(assert (=> b!1273984 m!1170455))

(declare-fun m!1170463 () Bool)

(assert (=> b!1273984 m!1170463))

(declare-fun m!1170465 () Bool)

(assert (=> bm!62598 m!1170465))

(assert (=> bm!62593 d!139967))

(assert (=> b!1273919 d!139963))

(declare-fun mapNonEmpty!51338 () Bool)

(declare-fun mapRes!51338 () Bool)

(declare-fun tp!97851 () Bool)

(declare-fun e!726993 () Bool)

(assert (=> mapNonEmpty!51338 (= mapRes!51338 (and tp!97851 e!726993))))

(declare-fun mapKey!51338 () (_ BitVec 32))

(declare-fun mapValue!51338 () ValueCell!15710)

(declare-fun mapRest!51338 () (Array (_ BitVec 32) ValueCell!15710))

(assert (=> mapNonEmpty!51338 (= mapRest!51337 (store mapRest!51338 mapKey!51338 mapValue!51338))))

(declare-fun mapIsEmpty!51338 () Bool)

(assert (=> mapIsEmpty!51338 mapRes!51338))

(declare-fun b!1273987 () Bool)

(assert (=> b!1273987 (= e!726993 tp_is_empty!33127)))

(declare-fun b!1273988 () Bool)

(declare-fun e!726992 () Bool)

(assert (=> b!1273988 (= e!726992 tp_is_empty!33127)))

(declare-fun condMapEmpty!51338 () Bool)

(declare-fun mapDefault!51338 () ValueCell!15710)

(assert (=> mapNonEmpty!51337 (= condMapEmpty!51338 (= mapRest!51337 ((as const (Array (_ BitVec 32) ValueCell!15710)) mapDefault!51338)))))

(assert (=> mapNonEmpty!51337 (= tp!97850 (and e!726992 mapRes!51338))))

(assert (= (and mapNonEmpty!51337 condMapEmpty!51338) mapIsEmpty!51338))

(assert (= (and mapNonEmpty!51337 (not condMapEmpty!51338)) mapNonEmpty!51338))

(assert (= (and mapNonEmpty!51338 ((_ is ValueCellFull!15710) mapValue!51338)) b!1273987))

(assert (= (and mapNonEmpty!51337 ((_ is ValueCellFull!15710) mapDefault!51338)) b!1273988))

(declare-fun m!1170467 () Bool)

(assert (=> mapNonEmpty!51338 m!1170467))

(check-sat (not b!1273978) (not bm!62597) b_and!45795 (not mapNonEmpty!51338) (not b!1273984) tp_is_empty!33127 (not bm!62598) (not b_next!27757) (not b!1273983) (not d!139957) (not b!1273960) (not d!139953) (not b!1273982))
(check-sat b_and!45795 (not b_next!27757))
