; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107644 () Bool)

(assert start!107644)

(declare-fun b!1273949 () Bool)

(declare-fun b_free!27759 () Bool)

(declare-fun b_next!27759 () Bool)

(assert (=> b!1273949 (= b_free!27759 (not b_next!27759))))

(declare-fun tp!97839 () Bool)

(declare-fun b_and!45815 () Bool)

(assert (=> b!1273949 (= tp!97839 b_and!45815)))

(declare-fun res!847039 () Bool)

(declare-fun e!726955 () Bool)

(assert (=> start!107644 (=> (not res!847039) (not e!726955))))

(declare-datatypes ((V!49365 0))(
  ( (V!49366 (val!16639 Int)) )
))
(declare-datatypes ((ValueCell!15711 0))(
  ( (ValueCellFull!15711 (v!19276 V!49365)) (EmptyCell!15711) )
))
(declare-datatypes ((array!83540 0))(
  ( (array!83541 (arr!40290 (Array (_ BitVec 32) ValueCell!15711)) (size!40837 (_ BitVec 32))) )
))
(declare-datatypes ((array!83542 0))(
  ( (array!83543 (arr!40291 (Array (_ BitVec 32) (_ BitVec 64))) (size!40838 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6186 0))(
  ( (LongMapFixedSize!6187 (defaultEntry!6739 Int) (mask!34537 (_ BitVec 32)) (extraKeys!6418 (_ BitVec 32)) (zeroValue!6524 V!49365) (minValue!6524 V!49365) (_size!3148 (_ BitVec 32)) (_keys!12154 array!83542) (_values!6762 array!83540) (_vacant!3148 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6186)

(declare-fun simpleValid!480 (LongMapFixedSize!6186) Bool)

(assert (=> start!107644 (= res!847039 (simpleValid!480 thiss!1551))))

(assert (=> start!107644 e!726955))

(declare-fun e!726954 () Bool)

(assert (=> start!107644 e!726954))

(declare-fun mapNonEmpty!51331 () Bool)

(declare-fun mapRes!51331 () Bool)

(declare-fun tp!97840 () Bool)

(declare-fun e!726957 () Bool)

(assert (=> mapNonEmpty!51331 (= mapRes!51331 (and tp!97840 e!726957))))

(declare-fun mapValue!51331 () ValueCell!15711)

(declare-fun mapRest!51331 () (Array (_ BitVec 32) ValueCell!15711))

(declare-fun mapKey!51331 () (_ BitVec 32))

(assert (=> mapNonEmpty!51331 (= (arr!40290 (_values!6762 thiss!1551)) (store mapRest!51331 mapKey!51331 mapValue!51331))))

(declare-fun b!1273947 () Bool)

(declare-fun e!726956 () Bool)

(declare-fun tp_is_empty!33129 () Bool)

(assert (=> b!1273947 (= e!726956 tp_is_empty!33129)))

(declare-fun mapIsEmpty!51331 () Bool)

(assert (=> mapIsEmpty!51331 mapRes!51331))

(declare-fun b!1273948 () Bool)

(assert (=> b!1273948 (= e!726955 (and (bvsle #b00000000000000000000000000000000 (size!40838 (_keys!12154 thiss!1551))) (bvsge (size!40838 (_keys!12154 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun e!726958 () Bool)

(declare-fun array_inv!30629 (array!83542) Bool)

(declare-fun array_inv!30630 (array!83540) Bool)

(assert (=> b!1273949 (= e!726954 (and tp!97839 tp_is_empty!33129 (array_inv!30629 (_keys!12154 thiss!1551)) (array_inv!30630 (_values!6762 thiss!1551)) e!726958))))

(declare-fun b!1273950 () Bool)

(declare-fun res!847040 () Bool)

(assert (=> b!1273950 (=> (not res!847040) (not e!726955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83542 (_ BitVec 32)) Bool)

(assert (=> b!1273950 (= res!847040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12154 thiss!1551) (mask!34537 thiss!1551)))))

(declare-fun b!1273951 () Bool)

(assert (=> b!1273951 (= e!726958 (and e!726956 mapRes!51331))))

(declare-fun condMapEmpty!51331 () Bool)

(declare-fun mapDefault!51331 () ValueCell!15711)

(assert (=> b!1273951 (= condMapEmpty!51331 (= (arr!40290 (_values!6762 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15711)) mapDefault!51331)))))

(declare-fun b!1273952 () Bool)

(declare-fun res!847041 () Bool)

(assert (=> b!1273952 (=> (not res!847041) (not e!726955))))

(declare-fun arrayCountValidKeys!0 (array!83542 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273952 (= res!847041 (= (arrayCountValidKeys!0 (_keys!12154 thiss!1551) #b00000000000000000000000000000000 (size!40838 (_keys!12154 thiss!1551))) (_size!3148 thiss!1551)))))

(declare-fun b!1273953 () Bool)

(assert (=> b!1273953 (= e!726957 tp_is_empty!33129)))

(assert (= (and start!107644 res!847039) b!1273952))

(assert (= (and b!1273952 res!847041) b!1273950))

(assert (= (and b!1273950 res!847040) b!1273948))

(assert (= (and b!1273951 condMapEmpty!51331) mapIsEmpty!51331))

(assert (= (and b!1273951 (not condMapEmpty!51331)) mapNonEmpty!51331))

(get-info :version)

(assert (= (and mapNonEmpty!51331 ((_ is ValueCellFull!15711) mapValue!51331)) b!1273953))

(assert (= (and b!1273951 ((_ is ValueCellFull!15711) mapDefault!51331)) b!1273947))

(assert (= b!1273949 b!1273951))

(assert (= start!107644 b!1273949))

(declare-fun m!1170891 () Bool)

(assert (=> b!1273949 m!1170891))

(declare-fun m!1170893 () Bool)

(assert (=> b!1273949 m!1170893))

(declare-fun m!1170895 () Bool)

(assert (=> b!1273950 m!1170895))

(declare-fun m!1170897 () Bool)

(assert (=> start!107644 m!1170897))

(declare-fun m!1170899 () Bool)

(assert (=> b!1273952 m!1170899))

(declare-fun m!1170901 () Bool)

(assert (=> mapNonEmpty!51331 m!1170901))

(check-sat b_and!45815 (not b!1273952) (not b_next!27759) (not b!1273950) (not start!107644) tp_is_empty!33129 (not mapNonEmpty!51331) (not b!1273949))
(check-sat b_and!45815 (not b_next!27759))
(get-model)

(declare-fun d!140055 () Bool)

(declare-fun res!847060 () Bool)

(declare-fun e!726979 () Bool)

(assert (=> d!140055 (=> (not res!847060) (not e!726979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!140055 (= res!847060 (validMask!0 (mask!34537 thiss!1551)))))

(assert (=> d!140055 (= (simpleValid!480 thiss!1551) e!726979)))

(declare-fun b!1273983 () Bool)

(declare-fun res!847059 () Bool)

(assert (=> b!1273983 (=> (not res!847059) (not e!726979))))

(assert (=> b!1273983 (= res!847059 (and (= (size!40837 (_values!6762 thiss!1551)) (bvadd (mask!34537 thiss!1551) #b00000000000000000000000000000001)) (= (size!40838 (_keys!12154 thiss!1551)) (size!40837 (_values!6762 thiss!1551))) (bvsge (_size!3148 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3148 thiss!1551) (bvadd (mask!34537 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1273986 () Bool)

(assert (=> b!1273986 (= e!726979 (and (bvsge (extraKeys!6418 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6418 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3148 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273985 () Bool)

(declare-fun res!847061 () Bool)

(assert (=> b!1273985 (=> (not res!847061) (not e!726979))))

(declare-fun size!40841 (LongMapFixedSize!6186) (_ BitVec 32))

(assert (=> b!1273985 (= res!847061 (= (size!40841 thiss!1551) (bvadd (_size!3148 thiss!1551) (bvsdiv (bvadd (extraKeys!6418 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273984 () Bool)

(declare-fun res!847062 () Bool)

(assert (=> b!1273984 (=> (not res!847062) (not e!726979))))

(assert (=> b!1273984 (= res!847062 (bvsge (size!40841 thiss!1551) (_size!3148 thiss!1551)))))

(assert (= (and d!140055 res!847060) b!1273983))

(assert (= (and b!1273983 res!847059) b!1273984))

(assert (= (and b!1273984 res!847062) b!1273985))

(assert (= (and b!1273985 res!847061) b!1273986))

(declare-fun m!1170915 () Bool)

(assert (=> d!140055 m!1170915))

(declare-fun m!1170917 () Bool)

(assert (=> b!1273985 m!1170917))

(assert (=> b!1273984 m!1170917))

(assert (=> start!107644 d!140055))

(declare-fun d!140057 () Bool)

(assert (=> d!140057 (= (array_inv!30629 (_keys!12154 thiss!1551)) (bvsge (size!40838 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273949 d!140057))

(declare-fun d!140059 () Bool)

(assert (=> d!140059 (= (array_inv!30630 (_values!6762 thiss!1551)) (bvsge (size!40837 (_values!6762 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273949 d!140059))

(declare-fun b!1273995 () Bool)

(declare-fun e!726986 () Bool)

(declare-fun call!62615 () Bool)

(assert (=> b!1273995 (= e!726986 call!62615)))

(declare-fun b!1273996 () Bool)

(declare-fun e!726988 () Bool)

(assert (=> b!1273996 (= e!726988 call!62615)))

(declare-fun b!1273997 () Bool)

(assert (=> b!1273997 (= e!726986 e!726988)))

(declare-fun lt!575169 () (_ BitVec 64))

(assert (=> b!1273997 (= lt!575169 (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42336 0))(
  ( (Unit!42337) )
))
(declare-fun lt!575170 () Unit!42336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83542 (_ BitVec 64) (_ BitVec 32)) Unit!42336)

(assert (=> b!1273997 (= lt!575170 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12154 thiss!1551) lt!575169 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273997 (arrayContainsKey!0 (_keys!12154 thiss!1551) lt!575169 #b00000000000000000000000000000000)))

(declare-fun lt!575168 () Unit!42336)

(assert (=> b!1273997 (= lt!575168 lt!575170)))

(declare-fun res!847067 () Bool)

(declare-datatypes ((SeekEntryResult!9998 0))(
  ( (MissingZero!9998 (index!42363 (_ BitVec 32))) (Found!9998 (index!42364 (_ BitVec 32))) (Intermediate!9998 (undefined!10810 Bool) (index!42365 (_ BitVec 32)) (x!112697 (_ BitVec 32))) (Undefined!9998) (MissingVacant!9998 (index!42366 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83542 (_ BitVec 32)) SeekEntryResult!9998)

(assert (=> b!1273997 (= res!847067 (= (seekEntryOrOpen!0 (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000) (_keys!12154 thiss!1551) (mask!34537 thiss!1551)) (Found!9998 #b00000000000000000000000000000000)))))

(assert (=> b!1273997 (=> (not res!847067) (not e!726988))))

(declare-fun bm!62612 () Bool)

(assert (=> bm!62612 (= call!62615 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12154 thiss!1551) (mask!34537 thiss!1551)))))

(declare-fun b!1273998 () Bool)

(declare-fun e!726987 () Bool)

(assert (=> b!1273998 (= e!726987 e!726986)))

(declare-fun c!123789 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273998 (= c!123789 (validKeyInArray!0 (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun d!140061 () Bool)

(declare-fun res!847068 () Bool)

(assert (=> d!140061 (=> res!847068 e!726987)))

(assert (=> d!140061 (= res!847068 (bvsge #b00000000000000000000000000000000 (size!40838 (_keys!12154 thiss!1551))))))

(assert (=> d!140061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12154 thiss!1551) (mask!34537 thiss!1551)) e!726987)))

(assert (= (and d!140061 (not res!847068)) b!1273998))

(assert (= (and b!1273998 c!123789) b!1273997))

(assert (= (and b!1273998 (not c!123789)) b!1273995))

(assert (= (and b!1273997 res!847067) b!1273996))

(assert (= (or b!1273996 b!1273995) bm!62612))

(declare-fun m!1170919 () Bool)

(assert (=> b!1273997 m!1170919))

(declare-fun m!1170921 () Bool)

(assert (=> b!1273997 m!1170921))

(declare-fun m!1170923 () Bool)

(assert (=> b!1273997 m!1170923))

(assert (=> b!1273997 m!1170919))

(declare-fun m!1170925 () Bool)

(assert (=> b!1273997 m!1170925))

(declare-fun m!1170927 () Bool)

(assert (=> bm!62612 m!1170927))

(assert (=> b!1273998 m!1170919))

(assert (=> b!1273998 m!1170919))

(declare-fun m!1170929 () Bool)

(assert (=> b!1273998 m!1170929))

(assert (=> b!1273950 d!140061))

(declare-fun b!1274007 () Bool)

(declare-fun e!726993 () (_ BitVec 32))

(declare-fun call!62618 () (_ BitVec 32))

(assert (=> b!1274007 (= e!726993 call!62618)))

(declare-fun b!1274008 () Bool)

(declare-fun e!726994 () (_ BitVec 32))

(assert (=> b!1274008 (= e!726994 e!726993)))

(declare-fun c!123794 () Bool)

(assert (=> b!1274008 (= c!123794 (validKeyInArray!0 (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun bm!62615 () Bool)

(assert (=> bm!62615 (= call!62618 (arrayCountValidKeys!0 (_keys!12154 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40838 (_keys!12154 thiss!1551))))))

(declare-fun d!140063 () Bool)

(declare-fun lt!575173 () (_ BitVec 32))

(assert (=> d!140063 (and (bvsge lt!575173 #b00000000000000000000000000000000) (bvsle lt!575173 (bvsub (size!40838 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!140063 (= lt!575173 e!726994)))

(declare-fun c!123795 () Bool)

(assert (=> d!140063 (= c!123795 (bvsge #b00000000000000000000000000000000 (size!40838 (_keys!12154 thiss!1551))))))

(assert (=> d!140063 (and (bvsle #b00000000000000000000000000000000 (size!40838 (_keys!12154 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40838 (_keys!12154 thiss!1551)) (size!40838 (_keys!12154 thiss!1551))))))

(assert (=> d!140063 (= (arrayCountValidKeys!0 (_keys!12154 thiss!1551) #b00000000000000000000000000000000 (size!40838 (_keys!12154 thiss!1551))) lt!575173)))

(declare-fun b!1274009 () Bool)

(assert (=> b!1274009 (= e!726993 (bvadd #b00000000000000000000000000000001 call!62618))))

(declare-fun b!1274010 () Bool)

(assert (=> b!1274010 (= e!726994 #b00000000000000000000000000000000)))

(assert (= (and d!140063 c!123795) b!1274010))

(assert (= (and d!140063 (not c!123795)) b!1274008))

(assert (= (and b!1274008 c!123794) b!1274009))

(assert (= (and b!1274008 (not c!123794)) b!1274007))

(assert (= (or b!1274009 b!1274007) bm!62615))

(assert (=> b!1274008 m!1170919))

(assert (=> b!1274008 m!1170919))

(assert (=> b!1274008 m!1170929))

(declare-fun m!1170931 () Bool)

(assert (=> bm!62615 m!1170931))

(assert (=> b!1273952 d!140063))

(declare-fun mapIsEmpty!51337 () Bool)

(declare-fun mapRes!51337 () Bool)

(assert (=> mapIsEmpty!51337 mapRes!51337))

(declare-fun condMapEmpty!51337 () Bool)

(declare-fun mapDefault!51337 () ValueCell!15711)

(assert (=> mapNonEmpty!51331 (= condMapEmpty!51337 (= mapRest!51331 ((as const (Array (_ BitVec 32) ValueCell!15711)) mapDefault!51337)))))

(declare-fun e!726999 () Bool)

(assert (=> mapNonEmpty!51331 (= tp!97840 (and e!726999 mapRes!51337))))

(declare-fun b!1274017 () Bool)

(declare-fun e!727000 () Bool)

(assert (=> b!1274017 (= e!727000 tp_is_empty!33129)))

(declare-fun mapNonEmpty!51337 () Bool)

(declare-fun tp!97849 () Bool)

(assert (=> mapNonEmpty!51337 (= mapRes!51337 (and tp!97849 e!727000))))

(declare-fun mapKey!51337 () (_ BitVec 32))

(declare-fun mapValue!51337 () ValueCell!15711)

(declare-fun mapRest!51337 () (Array (_ BitVec 32) ValueCell!15711))

(assert (=> mapNonEmpty!51337 (= mapRest!51331 (store mapRest!51337 mapKey!51337 mapValue!51337))))

(declare-fun b!1274018 () Bool)

(assert (=> b!1274018 (= e!726999 tp_is_empty!33129)))

(assert (= (and mapNonEmpty!51331 condMapEmpty!51337) mapIsEmpty!51337))

(assert (= (and mapNonEmpty!51331 (not condMapEmpty!51337)) mapNonEmpty!51337))

(assert (= (and mapNonEmpty!51337 ((_ is ValueCellFull!15711) mapValue!51337)) b!1274017))

(assert (= (and mapNonEmpty!51331 ((_ is ValueCellFull!15711) mapDefault!51337)) b!1274018))

(declare-fun m!1170933 () Bool)

(assert (=> mapNonEmpty!51337 m!1170933))

(check-sat b_and!45815 (not b!1273985) (not b_next!27759) (not b!1274008) (not b!1273998) (not b!1273984) (not b!1273997) (not bm!62612) tp_is_empty!33129 (not bm!62615) (not d!140055) (not mapNonEmpty!51337))
(check-sat b_and!45815 (not b_next!27759))
(get-model)

(declare-fun b!1274019 () Bool)

(declare-fun e!727001 () (_ BitVec 32))

(declare-fun call!62619 () (_ BitVec 32))

(assert (=> b!1274019 (= e!727001 call!62619)))

(declare-fun b!1274020 () Bool)

(declare-fun e!727002 () (_ BitVec 32))

(assert (=> b!1274020 (= e!727002 e!727001)))

(declare-fun c!123796 () Bool)

(assert (=> b!1274020 (= c!123796 (validKeyInArray!0 (select (arr!40291 (_keys!12154 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!62616 () Bool)

(assert (=> bm!62616 (= call!62619 (arrayCountValidKeys!0 (_keys!12154 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!40838 (_keys!12154 thiss!1551))))))

(declare-fun d!140065 () Bool)

(declare-fun lt!575174 () (_ BitVec 32))

(assert (=> d!140065 (and (bvsge lt!575174 #b00000000000000000000000000000000) (bvsle lt!575174 (bvsub (size!40838 (_keys!12154 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!140065 (= lt!575174 e!727002)))

(declare-fun c!123797 () Bool)

(assert (=> d!140065 (= c!123797 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40838 (_keys!12154 thiss!1551))))))

(assert (=> d!140065 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40838 (_keys!12154 thiss!1551))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!40838 (_keys!12154 thiss!1551)) (size!40838 (_keys!12154 thiss!1551))))))

(assert (=> d!140065 (= (arrayCountValidKeys!0 (_keys!12154 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40838 (_keys!12154 thiss!1551))) lt!575174)))

(declare-fun b!1274021 () Bool)

(assert (=> b!1274021 (= e!727001 (bvadd #b00000000000000000000000000000001 call!62619))))

(declare-fun b!1274022 () Bool)

(assert (=> b!1274022 (= e!727002 #b00000000000000000000000000000000)))

(assert (= (and d!140065 c!123797) b!1274022))

(assert (= (and d!140065 (not c!123797)) b!1274020))

(assert (= (and b!1274020 c!123796) b!1274021))

(assert (= (and b!1274020 (not c!123796)) b!1274019))

(assert (= (or b!1274021 b!1274019) bm!62616))

(declare-fun m!1170935 () Bool)

(assert (=> b!1274020 m!1170935))

(assert (=> b!1274020 m!1170935))

(declare-fun m!1170937 () Bool)

(assert (=> b!1274020 m!1170937))

(declare-fun m!1170939 () Bool)

(assert (=> bm!62616 m!1170939))

(assert (=> bm!62615 d!140065))

(declare-fun d!140067 () Bool)

(assert (=> d!140067 (= (size!40841 thiss!1551) (bvadd (_size!3148 thiss!1551) (bvsdiv (bvadd (extraKeys!6418 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1273985 d!140067))

(declare-fun d!140069 () Bool)

(assert (=> d!140069 (arrayContainsKey!0 (_keys!12154 thiss!1551) lt!575169 #b00000000000000000000000000000000)))

(declare-fun lt!575177 () Unit!42336)

(declare-fun choose!13 (array!83542 (_ BitVec 64) (_ BitVec 32)) Unit!42336)

(assert (=> d!140069 (= lt!575177 (choose!13 (_keys!12154 thiss!1551) lt!575169 #b00000000000000000000000000000000))))

(assert (=> d!140069 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!140069 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12154 thiss!1551) lt!575169 #b00000000000000000000000000000000) lt!575177)))

(declare-fun bs!36167 () Bool)

(assert (= bs!36167 d!140069))

(assert (=> bs!36167 m!1170923))

(declare-fun m!1170941 () Bool)

(assert (=> bs!36167 m!1170941))

(assert (=> b!1273997 d!140069))

(declare-fun d!140071 () Bool)

(declare-fun res!847073 () Bool)

(declare-fun e!727007 () Bool)

(assert (=> d!140071 (=> res!847073 e!727007)))

(assert (=> d!140071 (= res!847073 (= (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000) lt!575169))))

(assert (=> d!140071 (= (arrayContainsKey!0 (_keys!12154 thiss!1551) lt!575169 #b00000000000000000000000000000000) e!727007)))

(declare-fun b!1274027 () Bool)

(declare-fun e!727008 () Bool)

(assert (=> b!1274027 (= e!727007 e!727008)))

(declare-fun res!847074 () Bool)

(assert (=> b!1274027 (=> (not res!847074) (not e!727008))))

(assert (=> b!1274027 (= res!847074 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40838 (_keys!12154 thiss!1551))))))

(declare-fun b!1274028 () Bool)

(assert (=> b!1274028 (= e!727008 (arrayContainsKey!0 (_keys!12154 thiss!1551) lt!575169 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!140071 (not res!847073)) b!1274027))

(assert (= (and b!1274027 res!847074) b!1274028))

(assert (=> d!140071 m!1170919))

(declare-fun m!1170943 () Bool)

(assert (=> b!1274028 m!1170943))

(assert (=> b!1273997 d!140071))

(declare-fun d!140073 () Bool)

(declare-fun lt!575185 () SeekEntryResult!9998)

(assert (=> d!140073 (and (or ((_ is Undefined!9998) lt!575185) (not ((_ is Found!9998) lt!575185)) (and (bvsge (index!42364 lt!575185) #b00000000000000000000000000000000) (bvslt (index!42364 lt!575185) (size!40838 (_keys!12154 thiss!1551))))) (or ((_ is Undefined!9998) lt!575185) ((_ is Found!9998) lt!575185) (not ((_ is MissingZero!9998) lt!575185)) (and (bvsge (index!42363 lt!575185) #b00000000000000000000000000000000) (bvslt (index!42363 lt!575185) (size!40838 (_keys!12154 thiss!1551))))) (or ((_ is Undefined!9998) lt!575185) ((_ is Found!9998) lt!575185) ((_ is MissingZero!9998) lt!575185) (not ((_ is MissingVacant!9998) lt!575185)) (and (bvsge (index!42366 lt!575185) #b00000000000000000000000000000000) (bvslt (index!42366 lt!575185) (size!40838 (_keys!12154 thiss!1551))))) (or ((_ is Undefined!9998) lt!575185) (ite ((_ is Found!9998) lt!575185) (= (select (arr!40291 (_keys!12154 thiss!1551)) (index!42364 lt!575185)) (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9998) lt!575185) (= (select (arr!40291 (_keys!12154 thiss!1551)) (index!42363 lt!575185)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9998) lt!575185) (= (select (arr!40291 (_keys!12154 thiss!1551)) (index!42366 lt!575185)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!727017 () SeekEntryResult!9998)

(assert (=> d!140073 (= lt!575185 e!727017)))

(declare-fun c!123805 () Bool)

(declare-fun lt!575184 () SeekEntryResult!9998)

(assert (=> d!140073 (= c!123805 (and ((_ is Intermediate!9998) lt!575184) (undefined!10810 lt!575184)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!83542 (_ BitVec 32)) SeekEntryResult!9998)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!140073 (= lt!575184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000) (mask!34537 thiss!1551)) (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000) (_keys!12154 thiss!1551) (mask!34537 thiss!1551)))))

(assert (=> d!140073 (validMask!0 (mask!34537 thiss!1551))))

(assert (=> d!140073 (= (seekEntryOrOpen!0 (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000) (_keys!12154 thiss!1551) (mask!34537 thiss!1551)) lt!575185)))

(declare-fun b!1274041 () Bool)

(declare-fun e!727015 () SeekEntryResult!9998)

(assert (=> b!1274041 (= e!727015 (MissingZero!9998 (index!42365 lt!575184)))))

(declare-fun b!1274042 () Bool)

(declare-fun e!727016 () SeekEntryResult!9998)

(assert (=> b!1274042 (= e!727017 e!727016)))

(declare-fun lt!575186 () (_ BitVec 64))

(assert (=> b!1274042 (= lt!575186 (select (arr!40291 (_keys!12154 thiss!1551)) (index!42365 lt!575184)))))

(declare-fun c!123804 () Bool)

(assert (=> b!1274042 (= c!123804 (= lt!575186 (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1274043 () Bool)

(declare-fun c!123806 () Bool)

(assert (=> b!1274043 (= c!123806 (= lt!575186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1274043 (= e!727016 e!727015)))

(declare-fun b!1274044 () Bool)

(assert (=> b!1274044 (= e!727016 (Found!9998 (index!42365 lt!575184)))))

(declare-fun b!1274045 () Bool)

(assert (=> b!1274045 (= e!727017 Undefined!9998)))

(declare-fun b!1274046 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!83542 (_ BitVec 32)) SeekEntryResult!9998)

(assert (=> b!1274046 (= e!727015 (seekKeyOrZeroReturnVacant!0 (x!112697 lt!575184) (index!42365 lt!575184) (index!42365 lt!575184) (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000) (_keys!12154 thiss!1551) (mask!34537 thiss!1551)))))

(assert (= (and d!140073 c!123805) b!1274045))

(assert (= (and d!140073 (not c!123805)) b!1274042))

(assert (= (and b!1274042 c!123804) b!1274044))

(assert (= (and b!1274042 (not c!123804)) b!1274043))

(assert (= (and b!1274043 c!123806) b!1274041))

(assert (= (and b!1274043 (not c!123806)) b!1274046))

(declare-fun m!1170945 () Bool)

(assert (=> d!140073 m!1170945))

(declare-fun m!1170947 () Bool)

(assert (=> d!140073 m!1170947))

(declare-fun m!1170949 () Bool)

(assert (=> d!140073 m!1170949))

(assert (=> d!140073 m!1170919))

(declare-fun m!1170951 () Bool)

(assert (=> d!140073 m!1170951))

(declare-fun m!1170953 () Bool)

(assert (=> d!140073 m!1170953))

(assert (=> d!140073 m!1170915))

(assert (=> d!140073 m!1170919))

(assert (=> d!140073 m!1170949))

(declare-fun m!1170955 () Bool)

(assert (=> b!1274042 m!1170955))

(assert (=> b!1274046 m!1170919))

(declare-fun m!1170957 () Bool)

(assert (=> b!1274046 m!1170957))

(assert (=> b!1273997 d!140073))

(declare-fun b!1274047 () Bool)

(declare-fun e!727018 () Bool)

(declare-fun call!62620 () Bool)

(assert (=> b!1274047 (= e!727018 call!62620)))

(declare-fun b!1274048 () Bool)

(declare-fun e!727020 () Bool)

(assert (=> b!1274048 (= e!727020 call!62620)))

(declare-fun b!1274049 () Bool)

(assert (=> b!1274049 (= e!727018 e!727020)))

(declare-fun lt!575188 () (_ BitVec 64))

(assert (=> b!1274049 (= lt!575188 (select (arr!40291 (_keys!12154 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!575189 () Unit!42336)

(assert (=> b!1274049 (= lt!575189 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12154 thiss!1551) lt!575188 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1274049 (arrayContainsKey!0 (_keys!12154 thiss!1551) lt!575188 #b00000000000000000000000000000000)))

(declare-fun lt!575187 () Unit!42336)

(assert (=> b!1274049 (= lt!575187 lt!575189)))

(declare-fun res!847075 () Bool)

(assert (=> b!1274049 (= res!847075 (= (seekEntryOrOpen!0 (select (arr!40291 (_keys!12154 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!12154 thiss!1551) (mask!34537 thiss!1551)) (Found!9998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1274049 (=> (not res!847075) (not e!727020))))

(declare-fun bm!62617 () Bool)

(assert (=> bm!62617 (= call!62620 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!12154 thiss!1551) (mask!34537 thiss!1551)))))

(declare-fun b!1274050 () Bool)

(declare-fun e!727019 () Bool)

(assert (=> b!1274050 (= e!727019 e!727018)))

(declare-fun c!123807 () Bool)

(assert (=> b!1274050 (= c!123807 (validKeyInArray!0 (select (arr!40291 (_keys!12154 thiss!1551)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!140075 () Bool)

(declare-fun res!847076 () Bool)

(assert (=> d!140075 (=> res!847076 e!727019)))

(assert (=> d!140075 (= res!847076 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40838 (_keys!12154 thiss!1551))))))

(assert (=> d!140075 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12154 thiss!1551) (mask!34537 thiss!1551)) e!727019)))

(assert (= (and d!140075 (not res!847076)) b!1274050))

(assert (= (and b!1274050 c!123807) b!1274049))

(assert (= (and b!1274050 (not c!123807)) b!1274047))

(assert (= (and b!1274049 res!847075) b!1274048))

(assert (= (or b!1274048 b!1274047) bm!62617))

(assert (=> b!1274049 m!1170935))

(declare-fun m!1170959 () Bool)

(assert (=> b!1274049 m!1170959))

(declare-fun m!1170961 () Bool)

(assert (=> b!1274049 m!1170961))

(assert (=> b!1274049 m!1170935))

(declare-fun m!1170963 () Bool)

(assert (=> b!1274049 m!1170963))

(declare-fun m!1170965 () Bool)

(assert (=> bm!62617 m!1170965))

(assert (=> b!1274050 m!1170935))

(assert (=> b!1274050 m!1170935))

(assert (=> b!1274050 m!1170937))

(assert (=> bm!62612 d!140075))

(declare-fun d!140077 () Bool)

(assert (=> d!140077 (= (validMask!0 (mask!34537 thiss!1551)) (and (or (= (mask!34537 thiss!1551) #b00000000000000000000000000000111) (= (mask!34537 thiss!1551) #b00000000000000000000000000001111) (= (mask!34537 thiss!1551) #b00000000000000000000000000011111) (= (mask!34537 thiss!1551) #b00000000000000000000000000111111) (= (mask!34537 thiss!1551) #b00000000000000000000000001111111) (= (mask!34537 thiss!1551) #b00000000000000000000000011111111) (= (mask!34537 thiss!1551) #b00000000000000000000000111111111) (= (mask!34537 thiss!1551) #b00000000000000000000001111111111) (= (mask!34537 thiss!1551) #b00000000000000000000011111111111) (= (mask!34537 thiss!1551) #b00000000000000000000111111111111) (= (mask!34537 thiss!1551) #b00000000000000000001111111111111) (= (mask!34537 thiss!1551) #b00000000000000000011111111111111) (= (mask!34537 thiss!1551) #b00000000000000000111111111111111) (= (mask!34537 thiss!1551) #b00000000000000001111111111111111) (= (mask!34537 thiss!1551) #b00000000000000011111111111111111) (= (mask!34537 thiss!1551) #b00000000000000111111111111111111) (= (mask!34537 thiss!1551) #b00000000000001111111111111111111) (= (mask!34537 thiss!1551) #b00000000000011111111111111111111) (= (mask!34537 thiss!1551) #b00000000000111111111111111111111) (= (mask!34537 thiss!1551) #b00000000001111111111111111111111) (= (mask!34537 thiss!1551) #b00000000011111111111111111111111) (= (mask!34537 thiss!1551) #b00000000111111111111111111111111) (= (mask!34537 thiss!1551) #b00000001111111111111111111111111) (= (mask!34537 thiss!1551) #b00000011111111111111111111111111) (= (mask!34537 thiss!1551) #b00000111111111111111111111111111) (= (mask!34537 thiss!1551) #b00001111111111111111111111111111) (= (mask!34537 thiss!1551) #b00011111111111111111111111111111) (= (mask!34537 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34537 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> d!140055 d!140077))

(declare-fun d!140079 () Bool)

(assert (=> d!140079 (= (validKeyInArray!0 (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000)) (and (not (= (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!40291 (_keys!12154 thiss!1551)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1273998 d!140079))

(assert (=> b!1273984 d!140067))

(assert (=> b!1274008 d!140079))

(declare-fun mapIsEmpty!51338 () Bool)

(declare-fun mapRes!51338 () Bool)

(assert (=> mapIsEmpty!51338 mapRes!51338))

(declare-fun condMapEmpty!51338 () Bool)

(declare-fun mapDefault!51338 () ValueCell!15711)

(assert (=> mapNonEmpty!51337 (= condMapEmpty!51338 (= mapRest!51337 ((as const (Array (_ BitVec 32) ValueCell!15711)) mapDefault!51338)))))

(declare-fun e!727021 () Bool)

(assert (=> mapNonEmpty!51337 (= tp!97849 (and e!727021 mapRes!51338))))

(declare-fun b!1274051 () Bool)

(declare-fun e!727022 () Bool)

(assert (=> b!1274051 (= e!727022 tp_is_empty!33129)))

(declare-fun mapNonEmpty!51338 () Bool)

(declare-fun tp!97850 () Bool)

(assert (=> mapNonEmpty!51338 (= mapRes!51338 (and tp!97850 e!727022))))

(declare-fun mapValue!51338 () ValueCell!15711)

(declare-fun mapKey!51338 () (_ BitVec 32))

(declare-fun mapRest!51338 () (Array (_ BitVec 32) ValueCell!15711))

(assert (=> mapNonEmpty!51338 (= mapRest!51337 (store mapRest!51338 mapKey!51338 mapValue!51338))))

(declare-fun b!1274052 () Bool)

(assert (=> b!1274052 (= e!727021 tp_is_empty!33129)))

(assert (= (and mapNonEmpty!51337 condMapEmpty!51338) mapIsEmpty!51338))

(assert (= (and mapNonEmpty!51337 (not condMapEmpty!51338)) mapNonEmpty!51338))

(assert (= (and mapNonEmpty!51338 ((_ is ValueCellFull!15711) mapValue!51338)) b!1274051))

(assert (= (and mapNonEmpty!51337 ((_ is ValueCellFull!15711) mapDefault!51338)) b!1274052))

(declare-fun m!1170967 () Bool)

(assert (=> mapNonEmpty!51338 m!1170967))

(check-sat (not d!140073) (not b!1274049) (not b!1274020) (not b!1274050) (not b!1274028) (not b_next!27759) (not d!140069) (not mapNonEmpty!51338) tp_is_empty!33129 (not b!1274046) (not bm!62616) b_and!45815 (not bm!62617))
(check-sat b_and!45815 (not b_next!27759))
