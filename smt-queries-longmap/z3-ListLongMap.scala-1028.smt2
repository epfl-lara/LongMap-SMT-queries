; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21854 () Bool)

(assert start!21854)

(declare-fun b!220114 () Bool)

(declare-fun b_free!5917 () Bool)

(declare-fun b_next!5917 () Bool)

(assert (=> b!220114 (= b_free!5917 (not b_next!5917))))

(declare-fun tp!20892 () Bool)

(declare-fun b_and!12789 () Bool)

(assert (=> b!220114 (= tp!20892 b_and!12789)))

(declare-fun b!220111 () Bool)

(declare-fun res!107895 () Bool)

(declare-fun e!143121 () Bool)

(assert (=> b!220111 (=> (not res!107895) (not e!143121))))

(declare-datatypes ((V!7353 0))(
  ( (V!7354 (val!2934 Int)) )
))
(declare-datatypes ((ValueCell!2546 0))(
  ( (ValueCellFull!2546 (v!4948 V!7353)) (EmptyCell!2546) )
))
(declare-datatypes ((array!10793 0))(
  ( (array!10794 (arr!5115 (Array (_ BitVec 32) ValueCell!2546)) (size!5449 (_ BitVec 32))) )
))
(declare-datatypes ((array!10795 0))(
  ( (array!10796 (arr!5116 (Array (_ BitVec 32) (_ BitVec 64))) (size!5450 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2992 0))(
  ( (LongMapFixedSize!2993 (defaultEntry!4155 Int) (mask!9954 (_ BitVec 32)) (extraKeys!3892 (_ BitVec 32)) (zeroValue!3996 V!7353) (minValue!3996 V!7353) (_size!1545 (_ BitVec 32)) (_keys!6208 array!10795) (_values!4138 array!10793) (_vacant!1545 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2992)

(assert (=> b!220111 (= res!107895 (and (= (size!5449 (_values!4138 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9954 thiss!1504))) (= (size!5450 (_keys!6208 thiss!1504)) (size!5449 (_values!4138 thiss!1504))) (bvsge (mask!9954 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3892 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3892 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220112 () Bool)

(declare-fun e!143128 () Bool)

(declare-fun call!20561 () Bool)

(assert (=> b!220112 (= e!143128 (not call!20561))))

(declare-fun e!143119 () Bool)

(declare-fun e!143129 () Bool)

(declare-fun tp_is_empty!5779 () Bool)

(declare-fun array_inv!3369 (array!10795) Bool)

(declare-fun array_inv!3370 (array!10793) Bool)

(assert (=> b!220114 (= e!143129 (and tp!20892 tp_is_empty!5779 (array_inv!3369 (_keys!6208 thiss!1504)) (array_inv!3370 (_values!4138 thiss!1504)) e!143119))))

(declare-fun b!220115 () Bool)

(declare-fun res!107897 () Bool)

(assert (=> b!220115 (=> (not res!107897) (not e!143128))))

(declare-datatypes ((SeekEntryResult!804 0))(
  ( (MissingZero!804 (index!5386 (_ BitVec 32))) (Found!804 (index!5387 (_ BitVec 32))) (Intermediate!804 (undefined!1616 Bool) (index!5388 (_ BitVec 32)) (x!22943 (_ BitVec 32))) (Undefined!804) (MissingVacant!804 (index!5389 (_ BitVec 32))) )
))
(declare-fun lt!111957 () SeekEntryResult!804)

(assert (=> b!220115 (= res!107897 (= (select (arr!5116 (_keys!6208 thiss!1504)) (index!5386 lt!111957)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220116 () Bool)

(declare-fun e!143123 () Bool)

(declare-fun e!143118 () Bool)

(assert (=> b!220116 (= e!143123 e!143118)))

(declare-fun res!107906 () Bool)

(assert (=> b!220116 (=> (not res!107906) (not e!143118))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220116 (= res!107906 (or (= lt!111957 (MissingZero!804 index!297)) (= lt!111957 (MissingVacant!804 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10795 (_ BitVec 32)) SeekEntryResult!804)

(assert (=> b!220116 (= lt!111957 (seekEntryOrOpen!0 key!932 (_keys!6208 thiss!1504) (mask!9954 thiss!1504)))))

(declare-fun b!220117 () Bool)

(declare-fun e!143122 () Bool)

(assert (=> b!220117 (= e!143122 tp_is_empty!5779)))

(declare-fun b!220118 () Bool)

(declare-datatypes ((Unit!6522 0))(
  ( (Unit!6523) )
))
(declare-fun e!143127 () Unit!6522)

(declare-fun Unit!6524 () Unit!6522)

(assert (=> b!220118 (= e!143127 Unit!6524)))

(declare-fun lt!111959 () Unit!6522)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!198 (array!10795 array!10793 (_ BitVec 32) (_ BitVec 32) V!7353 V!7353 (_ BitVec 64) Int) Unit!6522)

(assert (=> b!220118 (= lt!111959 (lemmaInListMapThenSeekEntryOrOpenFindsIt!198 (_keys!6208 thiss!1504) (_values!4138 thiss!1504) (mask!9954 thiss!1504) (extraKeys!3892 thiss!1504) (zeroValue!3996 thiss!1504) (minValue!3996 thiss!1504) key!932 (defaultEntry!4155 thiss!1504)))))

(assert (=> b!220118 false))

(declare-fun b!220119 () Bool)

(declare-fun e!143130 () Bool)

(assert (=> b!220119 (= e!143130 (not call!20561))))

(declare-fun b!220120 () Bool)

(declare-fun res!107902 () Bool)

(assert (=> b!220120 (=> (not res!107902) (not e!143128))))

(declare-fun call!20562 () Bool)

(assert (=> b!220120 (= res!107902 call!20562)))

(declare-fun e!143126 () Bool)

(assert (=> b!220120 (= e!143126 e!143128)))

(declare-fun b!220121 () Bool)

(declare-fun res!107904 () Bool)

(assert (=> b!220121 (=> (not res!107904) (not e!143121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10795 (_ BitVec 32)) Bool)

(assert (=> b!220121 (= res!107904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6208 thiss!1504) (mask!9954 thiss!1504)))))

(declare-fun b!220122 () Bool)

(declare-fun e!143120 () Bool)

(get-info :version)

(assert (=> b!220122 (= e!143120 ((_ is Undefined!804) lt!111957))))

(declare-fun bm!20558 () Bool)

(declare-fun c!36633 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20558 (= call!20562 (inRange!0 (ite c!36633 (index!5386 lt!111957) (index!5389 lt!111957)) (mask!9954 thiss!1504)))))

(declare-fun b!220123 () Bool)

(declare-fun e!143125 () Bool)

(assert (=> b!220123 (= e!143125 tp_is_empty!5779)))

(declare-fun mapIsEmpty!9838 () Bool)

(declare-fun mapRes!9838 () Bool)

(assert (=> mapIsEmpty!9838 mapRes!9838))

(declare-fun b!220124 () Bool)

(assert (=> b!220124 (= e!143118 e!143121)))

(declare-fun res!107900 () Bool)

(assert (=> b!220124 (=> (not res!107900) (not e!143121))))

(assert (=> b!220124 (= res!107900 (inRange!0 index!297 (mask!9954 thiss!1504)))))

(declare-fun lt!111958 () Unit!6522)

(assert (=> b!220124 (= lt!111958 e!143127)))

(declare-fun c!36634 () Bool)

(declare-datatypes ((tuple2!4316 0))(
  ( (tuple2!4317 (_1!2169 (_ BitVec 64)) (_2!2169 V!7353)) )
))
(declare-datatypes ((List!3239 0))(
  ( (Nil!3236) (Cons!3235 (h!3883 tuple2!4316) (t!8189 List!3239)) )
))
(declare-datatypes ((ListLongMap!3219 0))(
  ( (ListLongMap!3220 (toList!1625 List!3239)) )
))
(declare-fun contains!1468 (ListLongMap!3219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1134 (array!10795 array!10793 (_ BitVec 32) (_ BitVec 32) V!7353 V!7353 (_ BitVec 32) Int) ListLongMap!3219)

(assert (=> b!220124 (= c!36634 (contains!1468 (getCurrentListMap!1134 (_keys!6208 thiss!1504) (_values!4138 thiss!1504) (mask!9954 thiss!1504) (extraKeys!3892 thiss!1504) (zeroValue!3996 thiss!1504) (minValue!3996 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4155 thiss!1504)) key!932))))

(declare-fun b!220125 () Bool)

(assert (=> b!220125 (= e!143119 (and e!143125 mapRes!9838))))

(declare-fun condMapEmpty!9838 () Bool)

(declare-fun mapDefault!9838 () ValueCell!2546)

(assert (=> b!220125 (= condMapEmpty!9838 (= (arr!5115 (_values!4138 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2546)) mapDefault!9838)))))

(declare-fun b!220126 () Bool)

(declare-fun c!36632 () Bool)

(assert (=> b!220126 (= c!36632 ((_ is MissingVacant!804) lt!111957))))

(assert (=> b!220126 (= e!143126 e!143120)))

(declare-fun res!107901 () Bool)

(assert (=> start!21854 (=> (not res!107901) (not e!143123))))

(declare-fun valid!1222 (LongMapFixedSize!2992) Bool)

(assert (=> start!21854 (= res!107901 (valid!1222 thiss!1504))))

(assert (=> start!21854 e!143123))

(assert (=> start!21854 e!143129))

(assert (=> start!21854 true))

(declare-fun b!220113 () Bool)

(declare-fun res!107898 () Bool)

(assert (=> b!220113 (=> (not res!107898) (not e!143121))))

(declare-fun arrayContainsKey!0 (array!10795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220113 (= res!107898 (arrayContainsKey!0 (_keys!6208 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220127 () Bool)

(declare-fun res!107905 () Bool)

(assert (=> b!220127 (=> (not res!107905) (not e!143121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220127 (= res!107905 (validMask!0 (mask!9954 thiss!1504)))))

(declare-fun bm!20559 () Bool)

(assert (=> bm!20559 (= call!20561 (arrayContainsKey!0 (_keys!6208 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220128 () Bool)

(declare-fun res!107896 () Bool)

(assert (=> b!220128 (=> (not res!107896) (not e!143123))))

(assert (=> b!220128 (= res!107896 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220129 () Bool)

(declare-fun res!107899 () Bool)

(assert (=> b!220129 (= res!107899 (= (select (arr!5116 (_keys!6208 thiss!1504)) (index!5389 lt!111957)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!220129 (=> (not res!107899) (not e!143130))))

(declare-fun b!220130 () Bool)

(declare-fun lt!111961 () Unit!6522)

(assert (=> b!220130 (= e!143127 lt!111961)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!199 (array!10795 array!10793 (_ BitVec 32) (_ BitVec 32) V!7353 V!7353 (_ BitVec 64) Int) Unit!6522)

(assert (=> b!220130 (= lt!111961 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!199 (_keys!6208 thiss!1504) (_values!4138 thiss!1504) (mask!9954 thiss!1504) (extraKeys!3892 thiss!1504) (zeroValue!3996 thiss!1504) (minValue!3996 thiss!1504) key!932 (defaultEntry!4155 thiss!1504)))))

(assert (=> b!220130 (= c!36633 ((_ is MissingZero!804) lt!111957))))

(assert (=> b!220130 e!143126))

(declare-fun b!220131 () Bool)

(assert (=> b!220131 (= e!143120 e!143130)))

(declare-fun res!107903 () Bool)

(assert (=> b!220131 (= res!107903 call!20562)))

(assert (=> b!220131 (=> (not res!107903) (not e!143130))))

(declare-fun mapNonEmpty!9838 () Bool)

(declare-fun tp!20893 () Bool)

(assert (=> mapNonEmpty!9838 (= mapRes!9838 (and tp!20893 e!143122))))

(declare-fun mapRest!9838 () (Array (_ BitVec 32) ValueCell!2546))

(declare-fun mapValue!9838 () ValueCell!2546)

(declare-fun mapKey!9838 () (_ BitVec 32))

(assert (=> mapNonEmpty!9838 (= (arr!5115 (_values!4138 thiss!1504)) (store mapRest!9838 mapKey!9838 mapValue!9838))))

(declare-fun b!220132 () Bool)

(assert (=> b!220132 (= e!143121 false)))

(declare-fun lt!111960 () Bool)

(declare-datatypes ((List!3240 0))(
  ( (Nil!3237) (Cons!3236 (h!3884 (_ BitVec 64)) (t!8190 List!3240)) )
))
(declare-fun arrayNoDuplicates!0 (array!10795 (_ BitVec 32) List!3240) Bool)

(assert (=> b!220132 (= lt!111960 (arrayNoDuplicates!0 (_keys!6208 thiss!1504) #b00000000000000000000000000000000 Nil!3237))))

(assert (= (and start!21854 res!107901) b!220128))

(assert (= (and b!220128 res!107896) b!220116))

(assert (= (and b!220116 res!107906) b!220124))

(assert (= (and b!220124 c!36634) b!220118))

(assert (= (and b!220124 (not c!36634)) b!220130))

(assert (= (and b!220130 c!36633) b!220120))

(assert (= (and b!220130 (not c!36633)) b!220126))

(assert (= (and b!220120 res!107902) b!220115))

(assert (= (and b!220115 res!107897) b!220112))

(assert (= (and b!220126 c!36632) b!220131))

(assert (= (and b!220126 (not c!36632)) b!220122))

(assert (= (and b!220131 res!107903) b!220129))

(assert (= (and b!220129 res!107899) b!220119))

(assert (= (or b!220120 b!220131) bm!20558))

(assert (= (or b!220112 b!220119) bm!20559))

(assert (= (and b!220124 res!107900) b!220113))

(assert (= (and b!220113 res!107898) b!220127))

(assert (= (and b!220127 res!107905) b!220111))

(assert (= (and b!220111 res!107895) b!220121))

(assert (= (and b!220121 res!107904) b!220132))

(assert (= (and b!220125 condMapEmpty!9838) mapIsEmpty!9838))

(assert (= (and b!220125 (not condMapEmpty!9838)) mapNonEmpty!9838))

(assert (= (and mapNonEmpty!9838 ((_ is ValueCellFull!2546) mapValue!9838)) b!220117))

(assert (= (and b!220125 ((_ is ValueCellFull!2546) mapDefault!9838)) b!220123))

(assert (= b!220114 b!220125))

(assert (= start!21854 b!220114))

(declare-fun m!244855 () Bool)

(assert (=> bm!20559 m!244855))

(declare-fun m!244857 () Bool)

(assert (=> b!220116 m!244857))

(declare-fun m!244859 () Bool)

(assert (=> b!220115 m!244859))

(declare-fun m!244861 () Bool)

(assert (=> b!220129 m!244861))

(declare-fun m!244863 () Bool)

(assert (=> b!220124 m!244863))

(declare-fun m!244865 () Bool)

(assert (=> b!220124 m!244865))

(assert (=> b!220124 m!244865))

(declare-fun m!244867 () Bool)

(assert (=> b!220124 m!244867))

(declare-fun m!244869 () Bool)

(assert (=> b!220132 m!244869))

(declare-fun m!244871 () Bool)

(assert (=> b!220127 m!244871))

(assert (=> b!220113 m!244855))

(declare-fun m!244873 () Bool)

(assert (=> bm!20558 m!244873))

(declare-fun m!244875 () Bool)

(assert (=> b!220121 m!244875))

(declare-fun m!244877 () Bool)

(assert (=> mapNonEmpty!9838 m!244877))

(declare-fun m!244879 () Bool)

(assert (=> b!220130 m!244879))

(declare-fun m!244881 () Bool)

(assert (=> start!21854 m!244881))

(declare-fun m!244883 () Bool)

(assert (=> b!220118 m!244883))

(declare-fun m!244885 () Bool)

(assert (=> b!220114 m!244885))

(declare-fun m!244887 () Bool)

(assert (=> b!220114 m!244887))

(check-sat (not bm!20559) (not b!220113) (not b!220118) b_and!12789 (not b_next!5917) (not b!220114) (not b!220121) (not mapNonEmpty!9838) (not b!220124) tp_is_empty!5779 (not b!220116) (not bm!20558) (not b!220130) (not start!21854) (not b!220127) (not b!220132))
(check-sat b_and!12789 (not b_next!5917))
