; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81408 () Bool)

(assert start!81408)

(declare-fun b!951787 () Bool)

(declare-fun b_free!18279 () Bool)

(declare-fun b_next!18279 () Bool)

(assert (=> b!951787 (= b_free!18279 (not b_next!18279))))

(declare-fun tp!63452 () Bool)

(declare-fun b_and!29751 () Bool)

(assert (=> b!951787 (= tp!63452 b_and!29751)))

(declare-fun res!637786 () Bool)

(declare-fun e!535986 () Bool)

(assert (=> start!81408 (=> (not res!637786) (not e!535986))))

(declare-datatypes ((V!32681 0))(
  ( (V!32682 (val!10444 Int)) )
))
(declare-datatypes ((ValueCell!9912 0))(
  ( (ValueCellFull!9912 (v!12993 V!32681)) (EmptyCell!9912) )
))
(declare-datatypes ((array!57604 0))(
  ( (array!57605 (arr!27696 (Array (_ BitVec 32) ValueCell!9912)) (size!28174 (_ BitVec 32))) )
))
(declare-datatypes ((array!57606 0))(
  ( (array!57607 (arr!27697 (Array (_ BitVec 32) (_ BitVec 64))) (size!28175 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4974 0))(
  ( (LongMapFixedSize!4975 (defaultEntry!5812 Int) (mask!27643 (_ BitVec 32)) (extraKeys!5544 (_ BitVec 32)) (zeroValue!5648 V!32681) (minValue!5648 V!32681) (_size!2542 (_ BitVec 32)) (_keys!10759 array!57606) (_values!5835 array!57604) (_vacant!2542 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4974)

(declare-fun valid!1893 (LongMapFixedSize!4974) Bool)

(assert (=> start!81408 (= res!637786 (valid!1893 thiss!1141))))

(assert (=> start!81408 e!535986))

(declare-fun e!535987 () Bool)

(assert (=> start!81408 e!535987))

(assert (=> start!81408 true))

(declare-fun mapIsEmpty!33111 () Bool)

(declare-fun mapRes!33111 () Bool)

(assert (=> mapIsEmpty!33111 mapRes!33111))

(declare-fun b!951785 () Bool)

(declare-fun e!535991 () Bool)

(assert (=> b!951785 (= e!535986 (not e!535991))))

(declare-fun res!637790 () Bool)

(assert (=> b!951785 (=> res!637790 e!535991)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951785 (= res!637790 (not (validMask!0 (mask!27643 thiss!1141))))))

(declare-fun lt!428780 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57606 (_ BitVec 32)) Bool)

(assert (=> b!951785 (arrayForallSeekEntryOrOpenFound!0 lt!428780 (_keys!10759 thiss!1141) (mask!27643 thiss!1141))))

(declare-datatypes ((Unit!32031 0))(
  ( (Unit!32032) )
))
(declare-fun lt!428779 () Unit!32031)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32031)

(assert (=> b!951785 (= lt!428779 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10759 thiss!1141) (mask!27643 thiss!1141) #b00000000000000000000000000000000 lt!428780))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57606 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951785 (= lt!428780 (arrayScanForKey!0 (_keys!10759 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951785 (arrayContainsKey!0 (_keys!10759 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!428781 () Unit!32031)

(declare-fun lemmaKeyInListMapIsInArray!332 (array!57606 array!57604 (_ BitVec 32) (_ BitVec 32) V!32681 V!32681 (_ BitVec 64) Int) Unit!32031)

(assert (=> b!951785 (= lt!428781 (lemmaKeyInListMapIsInArray!332 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) key!756 (defaultEntry!5812 thiss!1141)))))

(declare-fun b!951786 () Bool)

(declare-fun e!535990 () Bool)

(declare-fun tp_is_empty!20787 () Bool)

(assert (=> b!951786 (= e!535990 tp_is_empty!20787)))

(declare-fun e!535985 () Bool)

(declare-fun array_inv!21498 (array!57606) Bool)

(declare-fun array_inv!21499 (array!57604) Bool)

(assert (=> b!951787 (= e!535987 (and tp!63452 tp_is_empty!20787 (array_inv!21498 (_keys!10759 thiss!1141)) (array_inv!21499 (_values!5835 thiss!1141)) e!535985))))

(declare-fun b!951788 () Bool)

(declare-fun res!637789 () Bool)

(assert (=> b!951788 (=> (not res!637789) (not e!535986))))

(assert (=> b!951788 (= res!637789 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951789 () Bool)

(declare-fun e!535988 () Bool)

(assert (=> b!951789 (= e!535985 (and e!535988 mapRes!33111))))

(declare-fun condMapEmpty!33111 () Bool)

(declare-fun mapDefault!33111 () ValueCell!9912)

(assert (=> b!951789 (= condMapEmpty!33111 (= (arr!27696 (_values!5835 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9912)) mapDefault!33111)))))

(declare-fun b!951790 () Bool)

(declare-fun res!637787 () Bool)

(assert (=> b!951790 (=> (not res!637787) (not e!535986))))

(declare-datatypes ((tuple2!13578 0))(
  ( (tuple2!13579 (_1!6800 (_ BitVec 64)) (_2!6800 V!32681)) )
))
(declare-datatypes ((List!19360 0))(
  ( (Nil!19357) (Cons!19356 (h!20517 tuple2!13578) (t!27711 List!19360)) )
))
(declare-datatypes ((ListLongMap!12275 0))(
  ( (ListLongMap!12276 (toList!6153 List!19360)) )
))
(declare-fun contains!5246 (ListLongMap!12275 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3386 (array!57606 array!57604 (_ BitVec 32) (_ BitVec 32) V!32681 V!32681 (_ BitVec 32) Int) ListLongMap!12275)

(assert (=> b!951790 (= res!637787 (contains!5246 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!33111 () Bool)

(declare-fun tp!63451 () Bool)

(assert (=> mapNonEmpty!33111 (= mapRes!33111 (and tp!63451 e!535990))))

(declare-fun mapKey!33111 () (_ BitVec 32))

(declare-fun mapValue!33111 () ValueCell!9912)

(declare-fun mapRest!33111 () (Array (_ BitVec 32) ValueCell!9912))

(assert (=> mapNonEmpty!33111 (= (arr!27696 (_values!5835 thiss!1141)) (store mapRest!33111 mapKey!33111 mapValue!33111))))

(declare-fun b!951791 () Bool)

(assert (=> b!951791 (= e!535988 tp_is_empty!20787)))

(declare-fun b!951792 () Bool)

(assert (=> b!951792 (= e!535991 (= (size!28175 (_keys!10759 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27643 thiss!1141))))))

(declare-fun b!951793 () Bool)

(declare-fun res!637788 () Bool)

(assert (=> b!951793 (=> (not res!637788) (not e!535986))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9157 0))(
  ( (MissingZero!9157 (index!38999 (_ BitVec 32))) (Found!9157 (index!39000 (_ BitVec 32))) (Intermediate!9157 (undefined!9969 Bool) (index!39001 (_ BitVec 32)) (x!81891 (_ BitVec 32))) (Undefined!9157) (MissingVacant!9157 (index!39002 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57606 (_ BitVec 32)) SeekEntryResult!9157)

(assert (=> b!951793 (= res!637788 (not ((_ is Found!9157) (seekEntry!0 key!756 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))))

(assert (= (and start!81408 res!637786) b!951788))

(assert (= (and b!951788 res!637789) b!951793))

(assert (= (and b!951793 res!637788) b!951790))

(assert (= (and b!951790 res!637787) b!951785))

(assert (= (and b!951785 (not res!637790)) b!951792))

(assert (= (and b!951789 condMapEmpty!33111) mapIsEmpty!33111))

(assert (= (and b!951789 (not condMapEmpty!33111)) mapNonEmpty!33111))

(assert (= (and mapNonEmpty!33111 ((_ is ValueCellFull!9912) mapValue!33111)) b!951786))

(assert (= (and b!951789 ((_ is ValueCellFull!9912) mapDefault!33111)) b!951791))

(assert (= b!951787 b!951789))

(assert (= start!81408 b!951787))

(declare-fun m!883981 () Bool)

(assert (=> start!81408 m!883981))

(declare-fun m!883983 () Bool)

(assert (=> b!951785 m!883983))

(declare-fun m!883985 () Bool)

(assert (=> b!951785 m!883985))

(declare-fun m!883987 () Bool)

(assert (=> b!951785 m!883987))

(declare-fun m!883989 () Bool)

(assert (=> b!951785 m!883989))

(declare-fun m!883991 () Bool)

(assert (=> b!951785 m!883991))

(declare-fun m!883993 () Bool)

(assert (=> b!951785 m!883993))

(declare-fun m!883995 () Bool)

(assert (=> b!951787 m!883995))

(declare-fun m!883997 () Bool)

(assert (=> b!951787 m!883997))

(declare-fun m!883999 () Bool)

(assert (=> mapNonEmpty!33111 m!883999))

(declare-fun m!884001 () Bool)

(assert (=> b!951793 m!884001))

(declare-fun m!884003 () Bool)

(assert (=> b!951790 m!884003))

(assert (=> b!951790 m!884003))

(declare-fun m!884005 () Bool)

(assert (=> b!951790 m!884005))

(check-sat (not start!81408) (not b!951787) (not b_next!18279) tp_is_empty!20787 (not b!951793) (not b!951785) (not mapNonEmpty!33111) (not b!951790) b_and!29751)
(check-sat b_and!29751 (not b_next!18279))
(get-model)

(declare-fun d!115385 () Bool)

(declare-fun res!637812 () Bool)

(declare-fun e!536015 () Bool)

(assert (=> d!115385 (=> (not res!637812) (not e!536015))))

(declare-fun simpleValid!380 (LongMapFixedSize!4974) Bool)

(assert (=> d!115385 (= res!637812 (simpleValid!380 thiss!1141))))

(assert (=> d!115385 (= (valid!1893 thiss!1141) e!536015)))

(declare-fun b!951827 () Bool)

(declare-fun res!637813 () Bool)

(assert (=> b!951827 (=> (not res!637813) (not e!536015))))

(declare-fun arrayCountValidKeys!0 (array!57606 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951827 (= res!637813 (= (arrayCountValidKeys!0 (_keys!10759 thiss!1141) #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))) (_size!2542 thiss!1141)))))

(declare-fun b!951828 () Bool)

(declare-fun res!637814 () Bool)

(assert (=> b!951828 (=> (not res!637814) (not e!536015))))

(assert (=> b!951828 (= res!637814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))

(declare-fun b!951829 () Bool)

(declare-datatypes ((List!19361 0))(
  ( (Nil!19358) (Cons!19357 (h!20518 (_ BitVec 64)) (t!27714 List!19361)) )
))
(declare-fun arrayNoDuplicates!0 (array!57606 (_ BitVec 32) List!19361) Bool)

(assert (=> b!951829 (= e!536015 (arrayNoDuplicates!0 (_keys!10759 thiss!1141) #b00000000000000000000000000000000 Nil!19358))))

(assert (= (and d!115385 res!637812) b!951827))

(assert (= (and b!951827 res!637813) b!951828))

(assert (= (and b!951828 res!637814) b!951829))

(declare-fun m!884033 () Bool)

(assert (=> d!115385 m!884033))

(declare-fun m!884035 () Bool)

(assert (=> b!951827 m!884035))

(declare-fun m!884037 () Bool)

(assert (=> b!951828 m!884037))

(declare-fun m!884039 () Bool)

(assert (=> b!951829 m!884039))

(assert (=> start!81408 d!115385))

(declare-fun d!115387 () Bool)

(assert (=> d!115387 (= (array_inv!21498 (_keys!10759 thiss!1141)) (bvsge (size!28175 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951787 d!115387))

(declare-fun d!115389 () Bool)

(assert (=> d!115389 (= (array_inv!21499 (_values!5835 thiss!1141)) (bvsge (size!28174 (_values!5835 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951787 d!115389))

(declare-fun b!951842 () Bool)

(declare-fun c!99506 () Bool)

(declare-fun lt!428802 () (_ BitVec 64))

(assert (=> b!951842 (= c!99506 (= lt!428802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536024 () SeekEntryResult!9157)

(declare-fun e!536022 () SeekEntryResult!9157)

(assert (=> b!951842 (= e!536024 e!536022)))

(declare-fun b!951843 () Bool)

(declare-fun lt!428799 () SeekEntryResult!9157)

(assert (=> b!951843 (= e!536022 (MissingZero!9157 (index!39001 lt!428799)))))

(declare-fun b!951844 () Bool)

(declare-fun e!536023 () SeekEntryResult!9157)

(assert (=> b!951844 (= e!536023 Undefined!9157)))

(declare-fun b!951845 () Bool)

(assert (=> b!951845 (= e!536024 (Found!9157 (index!39001 lt!428799)))))

(declare-fun b!951846 () Bool)

(declare-fun lt!428800 () SeekEntryResult!9157)

(assert (=> b!951846 (= e!536022 (ite ((_ is MissingVacant!9157) lt!428800) (MissingZero!9157 (index!39002 lt!428800)) lt!428800))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57606 (_ BitVec 32)) SeekEntryResult!9157)

(assert (=> b!951846 (= lt!428800 (seekKeyOrZeroReturnVacant!0 (x!81891 lt!428799) (index!39001 lt!428799) (index!39001 lt!428799) key!756 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))

(declare-fun d!115391 () Bool)

(declare-fun lt!428801 () SeekEntryResult!9157)

(assert (=> d!115391 (and (or ((_ is MissingVacant!9157) lt!428801) (not ((_ is Found!9157) lt!428801)) (and (bvsge (index!39000 lt!428801) #b00000000000000000000000000000000) (bvslt (index!39000 lt!428801) (size!28175 (_keys!10759 thiss!1141))))) (not ((_ is MissingVacant!9157) lt!428801)) (or (not ((_ is Found!9157) lt!428801)) (= (select (arr!27697 (_keys!10759 thiss!1141)) (index!39000 lt!428801)) key!756)))))

(assert (=> d!115391 (= lt!428801 e!536023)))

(declare-fun c!99507 () Bool)

(assert (=> d!115391 (= c!99507 (and ((_ is Intermediate!9157) lt!428799) (undefined!9969 lt!428799)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57606 (_ BitVec 32)) SeekEntryResult!9157)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115391 (= lt!428799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27643 thiss!1141)) key!756 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))

(assert (=> d!115391 (validMask!0 (mask!27643 thiss!1141))))

(assert (=> d!115391 (= (seekEntry!0 key!756 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)) lt!428801)))

(declare-fun b!951847 () Bool)

(assert (=> b!951847 (= e!536023 e!536024)))

(assert (=> b!951847 (= lt!428802 (select (arr!27697 (_keys!10759 thiss!1141)) (index!39001 lt!428799)))))

(declare-fun c!99505 () Bool)

(assert (=> b!951847 (= c!99505 (= lt!428802 key!756))))

(assert (= (and d!115391 c!99507) b!951844))

(assert (= (and d!115391 (not c!99507)) b!951847))

(assert (= (and b!951847 c!99505) b!951845))

(assert (= (and b!951847 (not c!99505)) b!951842))

(assert (= (and b!951842 c!99506) b!951843))

(assert (= (and b!951842 (not c!99506)) b!951846))

(declare-fun m!884041 () Bool)

(assert (=> b!951846 m!884041))

(declare-fun m!884043 () Bool)

(assert (=> d!115391 m!884043))

(declare-fun m!884045 () Bool)

(assert (=> d!115391 m!884045))

(assert (=> d!115391 m!884045))

(declare-fun m!884047 () Bool)

(assert (=> d!115391 m!884047))

(assert (=> d!115391 m!883987))

(declare-fun m!884049 () Bool)

(assert (=> b!951847 m!884049))

(assert (=> b!951793 d!115391))

(declare-fun b!951856 () Bool)

(declare-fun e!536032 () Bool)

(declare-fun call!41517 () Bool)

(assert (=> b!951856 (= e!536032 call!41517)))

(declare-fun b!951857 () Bool)

(declare-fun e!536031 () Bool)

(assert (=> b!951857 (= e!536031 e!536032)))

(declare-fun lt!428810 () (_ BitVec 64))

(assert (=> b!951857 (= lt!428810 (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780))))

(declare-fun lt!428809 () Unit!32031)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57606 (_ BitVec 64) (_ BitVec 32)) Unit!32031)

(assert (=> b!951857 (= lt!428809 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10759 thiss!1141) lt!428810 lt!428780))))

(assert (=> b!951857 (arrayContainsKey!0 (_keys!10759 thiss!1141) lt!428810 #b00000000000000000000000000000000)))

(declare-fun lt!428811 () Unit!32031)

(assert (=> b!951857 (= lt!428811 lt!428809)))

(declare-fun res!637820 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57606 (_ BitVec 32)) SeekEntryResult!9157)

(assert (=> b!951857 (= res!637820 (= (seekEntryOrOpen!0 (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780) (_keys!10759 thiss!1141) (mask!27643 thiss!1141)) (Found!9157 lt!428780)))))

(assert (=> b!951857 (=> (not res!637820) (not e!536032))))

(declare-fun bm!41514 () Bool)

(assert (=> bm!41514 (= call!41517 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428780 #b00000000000000000000000000000001) (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))

(declare-fun b!951858 () Bool)

(declare-fun e!536033 () Bool)

(assert (=> b!951858 (= e!536033 e!536031)))

(declare-fun c!99510 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951858 (= c!99510 (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780)))))

(declare-fun b!951859 () Bool)

(assert (=> b!951859 (= e!536031 call!41517)))

(declare-fun d!115393 () Bool)

(declare-fun res!637819 () Bool)

(assert (=> d!115393 (=> res!637819 e!536033)))

(assert (=> d!115393 (= res!637819 (bvsge lt!428780 (size!28175 (_keys!10759 thiss!1141))))))

(assert (=> d!115393 (= (arrayForallSeekEntryOrOpenFound!0 lt!428780 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)) e!536033)))

(assert (= (and d!115393 (not res!637819)) b!951858))

(assert (= (and b!951858 c!99510) b!951857))

(assert (= (and b!951858 (not c!99510)) b!951859))

(assert (= (and b!951857 res!637820) b!951856))

(assert (= (or b!951856 b!951859) bm!41514))

(declare-fun m!884051 () Bool)

(assert (=> b!951857 m!884051))

(declare-fun m!884053 () Bool)

(assert (=> b!951857 m!884053))

(declare-fun m!884055 () Bool)

(assert (=> b!951857 m!884055))

(assert (=> b!951857 m!884051))

(declare-fun m!884057 () Bool)

(assert (=> b!951857 m!884057))

(declare-fun m!884059 () Bool)

(assert (=> bm!41514 m!884059))

(assert (=> b!951858 m!884051))

(assert (=> b!951858 m!884051))

(declare-fun m!884061 () Bool)

(assert (=> b!951858 m!884061))

(assert (=> b!951785 d!115393))

(declare-fun d!115395 () Bool)

(declare-fun res!637825 () Bool)

(declare-fun e!536038 () Bool)

(assert (=> d!115395 (=> res!637825 e!536038)))

(assert (=> d!115395 (= res!637825 (= (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115395 (= (arrayContainsKey!0 (_keys!10759 thiss!1141) key!756 #b00000000000000000000000000000000) e!536038)))

(declare-fun b!951864 () Bool)

(declare-fun e!536039 () Bool)

(assert (=> b!951864 (= e!536038 e!536039)))

(declare-fun res!637826 () Bool)

(assert (=> b!951864 (=> (not res!637826) (not e!536039))))

(assert (=> b!951864 (= res!637826 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun b!951865 () Bool)

(assert (=> b!951865 (= e!536039 (arrayContainsKey!0 (_keys!10759 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115395 (not res!637825)) b!951864))

(assert (= (and b!951864 res!637826) b!951865))

(declare-fun m!884063 () Bool)

(assert (=> d!115395 m!884063))

(declare-fun m!884065 () Bool)

(assert (=> b!951865 m!884065))

(assert (=> b!951785 d!115395))

(declare-fun d!115397 () Bool)

(declare-fun e!536042 () Bool)

(assert (=> d!115397 e!536042))

(declare-fun c!99513 () Bool)

(assert (=> d!115397 (= c!99513 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428814 () Unit!32031)

(declare-fun choose!1593 (array!57606 array!57604 (_ BitVec 32) (_ BitVec 32) V!32681 V!32681 (_ BitVec 64) Int) Unit!32031)

(assert (=> d!115397 (= lt!428814 (choose!1593 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) key!756 (defaultEntry!5812 thiss!1141)))))

(assert (=> d!115397 (validMask!0 (mask!27643 thiss!1141))))

(assert (=> d!115397 (= (lemmaKeyInListMapIsInArray!332 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) key!756 (defaultEntry!5812 thiss!1141)) lt!428814)))

(declare-fun b!951870 () Bool)

(assert (=> b!951870 (= e!536042 (arrayContainsKey!0 (_keys!10759 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951871 () Bool)

(assert (=> b!951871 (= e!536042 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115397 c!99513) b!951870))

(assert (= (and d!115397 (not c!99513)) b!951871))

(declare-fun m!884067 () Bool)

(assert (=> d!115397 m!884067))

(assert (=> d!115397 m!883987))

(assert (=> b!951870 m!883993))

(assert (=> b!951785 d!115397))

(declare-fun d!115399 () Bool)

(declare-fun lt!428817 () (_ BitVec 32))

(assert (=> d!115399 (and (or (bvslt lt!428817 #b00000000000000000000000000000000) (bvsge lt!428817 (size!28175 (_keys!10759 thiss!1141))) (and (bvsge lt!428817 #b00000000000000000000000000000000) (bvslt lt!428817 (size!28175 (_keys!10759 thiss!1141))))) (bvsge lt!428817 #b00000000000000000000000000000000) (bvslt lt!428817 (size!28175 (_keys!10759 thiss!1141))) (= (select (arr!27697 (_keys!10759 thiss!1141)) lt!428817) key!756))))

(declare-fun e!536045 () (_ BitVec 32))

(assert (=> d!115399 (= lt!428817 e!536045)))

(declare-fun c!99516 () Bool)

(assert (=> d!115399 (= c!99516 (= (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115399 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))) (bvslt (size!28175 (_keys!10759 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115399 (= (arrayScanForKey!0 (_keys!10759 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428817)))

(declare-fun b!951876 () Bool)

(assert (=> b!951876 (= e!536045 #b00000000000000000000000000000000)))

(declare-fun b!951877 () Bool)

(assert (=> b!951877 (= e!536045 (arrayScanForKey!0 (_keys!10759 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115399 c!99516) b!951876))

(assert (= (and d!115399 (not c!99516)) b!951877))

(declare-fun m!884069 () Bool)

(assert (=> d!115399 m!884069))

(assert (=> d!115399 m!884063))

(declare-fun m!884071 () Bool)

(assert (=> b!951877 m!884071))

(assert (=> b!951785 d!115399))

(declare-fun d!115401 () Bool)

(assert (=> d!115401 (arrayForallSeekEntryOrOpenFound!0 lt!428780 (_keys!10759 thiss!1141) (mask!27643 thiss!1141))))

(declare-fun lt!428820 () Unit!32031)

(declare-fun choose!38 (array!57606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32031)

(assert (=> d!115401 (= lt!428820 (choose!38 (_keys!10759 thiss!1141) (mask!27643 thiss!1141) #b00000000000000000000000000000000 lt!428780))))

(assert (=> d!115401 (validMask!0 (mask!27643 thiss!1141))))

(assert (=> d!115401 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10759 thiss!1141) (mask!27643 thiss!1141) #b00000000000000000000000000000000 lt!428780) lt!428820)))

(declare-fun bs!26742 () Bool)

(assert (= bs!26742 d!115401))

(assert (=> bs!26742 m!883985))

(declare-fun m!884073 () Bool)

(assert (=> bs!26742 m!884073))

(assert (=> bs!26742 m!883987))

(assert (=> b!951785 d!115401))

(declare-fun d!115403 () Bool)

(assert (=> d!115403 (= (validMask!0 (mask!27643 thiss!1141)) (and (or (= (mask!27643 thiss!1141) #b00000000000000000000000000000111) (= (mask!27643 thiss!1141) #b00000000000000000000000000001111) (= (mask!27643 thiss!1141) #b00000000000000000000000000011111) (= (mask!27643 thiss!1141) #b00000000000000000000000000111111) (= (mask!27643 thiss!1141) #b00000000000000000000000001111111) (= (mask!27643 thiss!1141) #b00000000000000000000000011111111) (= (mask!27643 thiss!1141) #b00000000000000000000000111111111) (= (mask!27643 thiss!1141) #b00000000000000000000001111111111) (= (mask!27643 thiss!1141) #b00000000000000000000011111111111) (= (mask!27643 thiss!1141) #b00000000000000000000111111111111) (= (mask!27643 thiss!1141) #b00000000000000000001111111111111) (= (mask!27643 thiss!1141) #b00000000000000000011111111111111) (= (mask!27643 thiss!1141) #b00000000000000000111111111111111) (= (mask!27643 thiss!1141) #b00000000000000001111111111111111) (= (mask!27643 thiss!1141) #b00000000000000011111111111111111) (= (mask!27643 thiss!1141) #b00000000000000111111111111111111) (= (mask!27643 thiss!1141) #b00000000000001111111111111111111) (= (mask!27643 thiss!1141) #b00000000000011111111111111111111) (= (mask!27643 thiss!1141) #b00000000000111111111111111111111) (= (mask!27643 thiss!1141) #b00000000001111111111111111111111) (= (mask!27643 thiss!1141) #b00000000011111111111111111111111) (= (mask!27643 thiss!1141) #b00000000111111111111111111111111) (= (mask!27643 thiss!1141) #b00000001111111111111111111111111) (= (mask!27643 thiss!1141) #b00000011111111111111111111111111) (= (mask!27643 thiss!1141) #b00000111111111111111111111111111) (= (mask!27643 thiss!1141) #b00001111111111111111111111111111) (= (mask!27643 thiss!1141) #b00011111111111111111111111111111) (= (mask!27643 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27643 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951785 d!115403))

(declare-fun d!115405 () Bool)

(declare-fun e!536050 () Bool)

(assert (=> d!115405 e!536050))

(declare-fun res!637829 () Bool)

(assert (=> d!115405 (=> res!637829 e!536050)))

(declare-fun lt!428831 () Bool)

(assert (=> d!115405 (= res!637829 (not lt!428831))))

(declare-fun lt!428830 () Bool)

(assert (=> d!115405 (= lt!428831 lt!428830)))

(declare-fun lt!428829 () Unit!32031)

(declare-fun e!536051 () Unit!32031)

(assert (=> d!115405 (= lt!428829 e!536051)))

(declare-fun c!99519 () Bool)

(assert (=> d!115405 (= c!99519 lt!428830)))

(declare-fun containsKey!470 (List!19360 (_ BitVec 64)) Bool)

(assert (=> d!115405 (= lt!428830 (containsKey!470 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756))))

(assert (=> d!115405 (= (contains!5246 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)) key!756) lt!428831)))

(declare-fun b!951884 () Bool)

(declare-fun lt!428832 () Unit!32031)

(assert (=> b!951884 (= e!536051 lt!428832)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!366 (List!19360 (_ BitVec 64)) Unit!32031)

(assert (=> b!951884 (= lt!428832 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756))))

(declare-datatypes ((Option!509 0))(
  ( (Some!508 (v!12995 V!32681)) (None!507) )
))
(declare-fun isDefined!375 (Option!509) Bool)

(declare-fun getValueByKey!503 (List!19360 (_ BitVec 64)) Option!509)

(assert (=> b!951884 (isDefined!375 (getValueByKey!503 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756))))

(declare-fun b!951885 () Bool)

(declare-fun Unit!32033 () Unit!32031)

(assert (=> b!951885 (= e!536051 Unit!32033)))

(declare-fun b!951886 () Bool)

(assert (=> b!951886 (= e!536050 (isDefined!375 (getValueByKey!503 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756)))))

(assert (= (and d!115405 c!99519) b!951884))

(assert (= (and d!115405 (not c!99519)) b!951885))

(assert (= (and d!115405 (not res!637829)) b!951886))

(declare-fun m!884075 () Bool)

(assert (=> d!115405 m!884075))

(declare-fun m!884077 () Bool)

(assert (=> b!951884 m!884077))

(declare-fun m!884079 () Bool)

(assert (=> b!951884 m!884079))

(assert (=> b!951884 m!884079))

(declare-fun m!884081 () Bool)

(assert (=> b!951884 m!884081))

(assert (=> b!951886 m!884079))

(assert (=> b!951886 m!884079))

(assert (=> b!951886 m!884081))

(assert (=> b!951790 d!115405))

(declare-fun b!951929 () Bool)

(declare-fun e!536088 () Unit!32031)

(declare-fun Unit!32034 () Unit!32031)

(assert (=> b!951929 (= e!536088 Unit!32034)))

(declare-fun b!951930 () Bool)

(declare-fun e!536082 () Bool)

(declare-fun e!536089 () Bool)

(assert (=> b!951930 (= e!536082 e!536089)))

(declare-fun c!99534 () Bool)

(assert (=> b!951930 (= c!99534 (not (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951931 () Bool)

(declare-fun e!536087 () ListLongMap!12275)

(declare-fun call!41534 () ListLongMap!12275)

(declare-fun +!2868 (ListLongMap!12275 tuple2!13578) ListLongMap!12275)

(assert (=> b!951931 (= e!536087 (+!2868 call!41534 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))))))

(declare-fun b!951932 () Bool)

(declare-fun e!536079 () Bool)

(assert (=> b!951932 (= e!536079 (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951933 () Bool)

(declare-fun e!536084 () Bool)

(declare-fun call!41532 () Bool)

(assert (=> b!951933 (= e!536084 (not call!41532))))

(declare-fun b!951934 () Bool)

(declare-fun lt!428894 () Unit!32031)

(assert (=> b!951934 (= e!536088 lt!428894)))

(declare-fun lt!428882 () ListLongMap!12275)

(declare-fun getCurrentListMapNoExtraKeys!3323 (array!57606 array!57604 (_ BitVec 32) (_ BitVec 32) V!32681 V!32681 (_ BitVec 32) Int) ListLongMap!12275)

(assert (=> b!951934 (= lt!428882 (getCurrentListMapNoExtraKeys!3323 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))))

(declare-fun lt!428896 () (_ BitVec 64))

(assert (=> b!951934 (= lt!428896 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428877 () (_ BitVec 64))

(assert (=> b!951934 (= lt!428877 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428890 () Unit!32031)

(declare-fun addStillContains!587 (ListLongMap!12275 (_ BitVec 64) V!32681 (_ BitVec 64)) Unit!32031)

(assert (=> b!951934 (= lt!428890 (addStillContains!587 lt!428882 lt!428896 (zeroValue!5648 thiss!1141) lt!428877))))

(assert (=> b!951934 (contains!5246 (+!2868 lt!428882 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141))) lt!428877)))

(declare-fun lt!428891 () Unit!32031)

(assert (=> b!951934 (= lt!428891 lt!428890)))

(declare-fun lt!428889 () ListLongMap!12275)

(assert (=> b!951934 (= lt!428889 (getCurrentListMapNoExtraKeys!3323 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))))

(declare-fun lt!428879 () (_ BitVec 64))

(assert (=> b!951934 (= lt!428879 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428881 () (_ BitVec 64))

(assert (=> b!951934 (= lt!428881 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428883 () Unit!32031)

(declare-fun addApplyDifferent!467 (ListLongMap!12275 (_ BitVec 64) V!32681 (_ BitVec 64)) Unit!32031)

(assert (=> b!951934 (= lt!428883 (addApplyDifferent!467 lt!428889 lt!428879 (minValue!5648 thiss!1141) lt!428881))))

(declare-fun apply!884 (ListLongMap!12275 (_ BitVec 64)) V!32681)

(assert (=> b!951934 (= (apply!884 (+!2868 lt!428889 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141))) lt!428881) (apply!884 lt!428889 lt!428881))))

(declare-fun lt!428893 () Unit!32031)

(assert (=> b!951934 (= lt!428893 lt!428883)))

(declare-fun lt!428897 () ListLongMap!12275)

(assert (=> b!951934 (= lt!428897 (getCurrentListMapNoExtraKeys!3323 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))))

(declare-fun lt!428880 () (_ BitVec 64))

(assert (=> b!951934 (= lt!428880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428884 () (_ BitVec 64))

(assert (=> b!951934 (= lt!428884 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428878 () Unit!32031)

(assert (=> b!951934 (= lt!428878 (addApplyDifferent!467 lt!428897 lt!428880 (zeroValue!5648 thiss!1141) lt!428884))))

(assert (=> b!951934 (= (apply!884 (+!2868 lt!428897 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141))) lt!428884) (apply!884 lt!428897 lt!428884))))

(declare-fun lt!428898 () Unit!32031)

(assert (=> b!951934 (= lt!428898 lt!428878)))

(declare-fun lt!428895 () ListLongMap!12275)

(assert (=> b!951934 (= lt!428895 (getCurrentListMapNoExtraKeys!3323 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))))

(declare-fun lt!428888 () (_ BitVec 64))

(assert (=> b!951934 (= lt!428888 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428885 () (_ BitVec 64))

(assert (=> b!951934 (= lt!428885 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951934 (= lt!428894 (addApplyDifferent!467 lt!428895 lt!428888 (minValue!5648 thiss!1141) lt!428885))))

(assert (=> b!951934 (= (apply!884 (+!2868 lt!428895 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141))) lt!428885) (apply!884 lt!428895 lt!428885))))

(declare-fun b!951935 () Bool)

(declare-fun e!536090 () Bool)

(declare-fun lt!428886 () ListLongMap!12275)

(assert (=> b!951935 (= e!536090 (= (apply!884 lt!428886 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5648 thiss!1141)))))

(declare-fun b!951936 () Bool)

(declare-fun e!536081 () Bool)

(declare-fun get!14556 (ValueCell!9912 V!32681) V!32681)

(declare-fun dynLambda!1657 (Int (_ BitVec 64)) V!32681)

(assert (=> b!951936 (= e!536081 (= (apply!884 lt!428886 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)) (get!14556 (select (arr!27696 (_values!5835 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1657 (defaultEntry!5812 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951936 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28174 (_values!5835 thiss!1141))))))

(assert (=> b!951936 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun d!115407 () Bool)

(assert (=> d!115407 e!536082))

(declare-fun res!637854 () Bool)

(assert (=> d!115407 (=> (not res!637854) (not e!536082))))

(assert (=> d!115407 (= res!637854 (or (bvsge #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))))

(declare-fun lt!428887 () ListLongMap!12275)

(assert (=> d!115407 (= lt!428886 lt!428887)))

(declare-fun lt!428892 () Unit!32031)

(assert (=> d!115407 (= lt!428892 e!536088)))

(declare-fun c!99536 () Bool)

(assert (=> d!115407 (= c!99536 e!536079)))

(declare-fun res!637851 () Bool)

(assert (=> d!115407 (=> (not res!637851) (not e!536079))))

(assert (=> d!115407 (= res!637851 (bvslt #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(assert (=> d!115407 (= lt!428887 e!536087)))

(declare-fun c!99532 () Bool)

(assert (=> d!115407 (= c!99532 (and (not (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115407 (validMask!0 (mask!27643 thiss!1141))))

(assert (=> d!115407 (= (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)) lt!428886)))

(declare-fun b!951937 () Bool)

(declare-fun e!536086 () Bool)

(assert (=> b!951937 (= e!536086 e!536081)))

(declare-fun res!637848 () Bool)

(assert (=> b!951937 (=> (not res!637848) (not e!536081))))

(assert (=> b!951937 (= res!637848 (contains!5246 lt!428886 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951937 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun b!951938 () Bool)

(declare-fun e!536085 () Bool)

(assert (=> b!951938 (= e!536085 (= (apply!884 lt!428886 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5648 thiss!1141)))))

(declare-fun b!951939 () Bool)

(declare-fun res!637853 () Bool)

(assert (=> b!951939 (=> (not res!637853) (not e!536082))))

(assert (=> b!951939 (= res!637853 e!536086)))

(declare-fun res!637850 () Bool)

(assert (=> b!951939 (=> res!637850 e!536086)))

(declare-fun e!536078 () Bool)

(assert (=> b!951939 (= res!637850 (not e!536078))))

(declare-fun res!637849 () Bool)

(assert (=> b!951939 (=> (not res!637849) (not e!536078))))

(assert (=> b!951939 (= res!637849 (bvslt #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun b!951940 () Bool)

(assert (=> b!951940 (= e!536078 (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951941 () Bool)

(declare-fun e!536083 () ListLongMap!12275)

(declare-fun call!41533 () ListLongMap!12275)

(assert (=> b!951941 (= e!536083 call!41533)))

(declare-fun bm!41529 () Bool)

(declare-fun call!41537 () ListLongMap!12275)

(assert (=> bm!41529 (= call!41537 call!41534)))

(declare-fun bm!41530 () Bool)

(declare-fun call!41538 () ListLongMap!12275)

(assert (=> bm!41530 (= call!41538 (getCurrentListMapNoExtraKeys!3323 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))))

(declare-fun c!99537 () Bool)

(declare-fun call!41536 () ListLongMap!12275)

(declare-fun bm!41531 () Bool)

(assert (=> bm!41531 (= call!41534 (+!2868 (ite c!99532 call!41538 (ite c!99537 call!41536 call!41533)) (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))))))

(declare-fun bm!41532 () Bool)

(assert (=> bm!41532 (= call!41533 call!41536)))

(declare-fun bm!41533 () Bool)

(declare-fun call!41535 () Bool)

(assert (=> bm!41533 (= call!41535 (contains!5246 lt!428886 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951942 () Bool)

(declare-fun c!99535 () Bool)

(assert (=> b!951942 (= c!99535 (and (not (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!536080 () ListLongMap!12275)

(assert (=> b!951942 (= e!536080 e!536083)))

(declare-fun b!951943 () Bool)

(assert (=> b!951943 (= e!536080 call!41537)))

(declare-fun b!951944 () Bool)

(assert (=> b!951944 (= e!536089 e!536085)))

(declare-fun res!637855 () Bool)

(assert (=> b!951944 (= res!637855 call!41535)))

(assert (=> b!951944 (=> (not res!637855) (not e!536085))))

(declare-fun bm!41534 () Bool)

(assert (=> bm!41534 (= call!41532 (contains!5246 lt!428886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951945 () Bool)

(assert (=> b!951945 (= e!536084 e!536090)))

(declare-fun res!637856 () Bool)

(assert (=> b!951945 (= res!637856 call!41532)))

(assert (=> b!951945 (=> (not res!637856) (not e!536090))))

(declare-fun bm!41535 () Bool)

(assert (=> bm!41535 (= call!41536 call!41538)))

(declare-fun b!951946 () Bool)

(assert (=> b!951946 (= e!536089 (not call!41535))))

(declare-fun b!951947 () Bool)

(assert (=> b!951947 (= e!536083 call!41537)))

(declare-fun b!951948 () Bool)

(declare-fun res!637852 () Bool)

(assert (=> b!951948 (=> (not res!637852) (not e!536082))))

(assert (=> b!951948 (= res!637852 e!536084)))

(declare-fun c!99533 () Bool)

(assert (=> b!951948 (= c!99533 (not (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!951949 () Bool)

(assert (=> b!951949 (= e!536087 e!536080)))

(assert (=> b!951949 (= c!99537 (and (not (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!115407 c!99532) b!951931))

(assert (= (and d!115407 (not c!99532)) b!951949))

(assert (= (and b!951949 c!99537) b!951943))

(assert (= (and b!951949 (not c!99537)) b!951942))

(assert (= (and b!951942 c!99535) b!951947))

(assert (= (and b!951942 (not c!99535)) b!951941))

(assert (= (or b!951947 b!951941) bm!41532))

(assert (= (or b!951943 bm!41532) bm!41535))

(assert (= (or b!951943 b!951947) bm!41529))

(assert (= (or b!951931 bm!41535) bm!41530))

(assert (= (or b!951931 bm!41529) bm!41531))

(assert (= (and d!115407 res!637851) b!951932))

(assert (= (and d!115407 c!99536) b!951934))

(assert (= (and d!115407 (not c!99536)) b!951929))

(assert (= (and d!115407 res!637854) b!951939))

(assert (= (and b!951939 res!637849) b!951940))

(assert (= (and b!951939 (not res!637850)) b!951937))

(assert (= (and b!951937 res!637848) b!951936))

(assert (= (and b!951939 res!637853) b!951948))

(assert (= (and b!951948 c!99533) b!951945))

(assert (= (and b!951948 (not c!99533)) b!951933))

(assert (= (and b!951945 res!637856) b!951935))

(assert (= (or b!951945 b!951933) bm!41534))

(assert (= (and b!951948 res!637852) b!951930))

(assert (= (and b!951930 c!99534) b!951944))

(assert (= (and b!951930 (not c!99534)) b!951946))

(assert (= (and b!951944 res!637855) b!951938))

(assert (= (or b!951944 b!951946) bm!41533))

(declare-fun b_lambda!14399 () Bool)

(assert (=> (not b_lambda!14399) (not b!951936)))

(declare-fun t!27713 () Bool)

(declare-fun tb!6203 () Bool)

(assert (=> (and b!951787 (= (defaultEntry!5812 thiss!1141) (defaultEntry!5812 thiss!1141)) t!27713) tb!6203))

(declare-fun result!12331 () Bool)

(assert (=> tb!6203 (= result!12331 tp_is_empty!20787)))

(assert (=> b!951936 t!27713))

(declare-fun b_and!29755 () Bool)

(assert (= b_and!29751 (and (=> t!27713 result!12331) b_and!29755)))

(assert (=> b!951940 m!884063))

(assert (=> b!951940 m!884063))

(declare-fun m!884083 () Bool)

(assert (=> b!951940 m!884083))

(declare-fun m!884085 () Bool)

(assert (=> b!951936 m!884085))

(declare-fun m!884087 () Bool)

(assert (=> b!951936 m!884087))

(declare-fun m!884089 () Bool)

(assert (=> b!951936 m!884089))

(assert (=> b!951936 m!884063))

(declare-fun m!884091 () Bool)

(assert (=> b!951936 m!884091))

(assert (=> b!951936 m!884087))

(assert (=> b!951936 m!884063))

(assert (=> b!951936 m!884085))

(declare-fun m!884093 () Bool)

(assert (=> b!951938 m!884093))

(assert (=> b!951932 m!884063))

(assert (=> b!951932 m!884063))

(assert (=> b!951932 m!884083))

(declare-fun m!884095 () Bool)

(assert (=> b!951934 m!884095))

(declare-fun m!884097 () Bool)

(assert (=> b!951934 m!884097))

(declare-fun m!884099 () Bool)

(assert (=> b!951934 m!884099))

(declare-fun m!884101 () Bool)

(assert (=> b!951934 m!884101))

(declare-fun m!884103 () Bool)

(assert (=> b!951934 m!884103))

(declare-fun m!884105 () Bool)

(assert (=> b!951934 m!884105))

(declare-fun m!884107 () Bool)

(assert (=> b!951934 m!884107))

(assert (=> b!951934 m!884101))

(declare-fun m!884109 () Bool)

(assert (=> b!951934 m!884109))

(declare-fun m!884111 () Bool)

(assert (=> b!951934 m!884111))

(declare-fun m!884113 () Bool)

(assert (=> b!951934 m!884113))

(declare-fun m!884115 () Bool)

(assert (=> b!951934 m!884115))

(assert (=> b!951934 m!884113))

(declare-fun m!884117 () Bool)

(assert (=> b!951934 m!884117))

(declare-fun m!884119 () Bool)

(assert (=> b!951934 m!884119))

(declare-fun m!884121 () Bool)

(assert (=> b!951934 m!884121))

(assert (=> b!951934 m!884105))

(assert (=> b!951934 m!884117))

(assert (=> b!951934 m!884063))

(declare-fun m!884123 () Bool)

(assert (=> b!951934 m!884123))

(declare-fun m!884125 () Bool)

(assert (=> b!951934 m!884125))

(assert (=> d!115407 m!883987))

(declare-fun m!884127 () Bool)

(assert (=> bm!41533 m!884127))

(declare-fun m!884129 () Bool)

(assert (=> bm!41531 m!884129))

(declare-fun m!884131 () Bool)

(assert (=> b!951931 m!884131))

(declare-fun m!884133 () Bool)

(assert (=> bm!41534 m!884133))

(assert (=> bm!41530 m!884111))

(assert (=> b!951937 m!884063))

(assert (=> b!951937 m!884063))

(declare-fun m!884135 () Bool)

(assert (=> b!951937 m!884135))

(declare-fun m!884137 () Bool)

(assert (=> b!951935 m!884137))

(assert (=> b!951790 d!115407))

(declare-fun b!951958 () Bool)

(declare-fun e!536095 () Bool)

(assert (=> b!951958 (= e!536095 tp_is_empty!20787)))

(declare-fun mapIsEmpty!33117 () Bool)

(declare-fun mapRes!33117 () Bool)

(assert (=> mapIsEmpty!33117 mapRes!33117))

(declare-fun condMapEmpty!33117 () Bool)

(declare-fun mapDefault!33117 () ValueCell!9912)

(assert (=> mapNonEmpty!33111 (= condMapEmpty!33117 (= mapRest!33111 ((as const (Array (_ BitVec 32) ValueCell!9912)) mapDefault!33117)))))

(declare-fun e!536096 () Bool)

(assert (=> mapNonEmpty!33111 (= tp!63451 (and e!536096 mapRes!33117))))

(declare-fun mapNonEmpty!33117 () Bool)

(declare-fun tp!63461 () Bool)

(assert (=> mapNonEmpty!33117 (= mapRes!33117 (and tp!63461 e!536095))))

(declare-fun mapRest!33117 () (Array (_ BitVec 32) ValueCell!9912))

(declare-fun mapKey!33117 () (_ BitVec 32))

(declare-fun mapValue!33117 () ValueCell!9912)

(assert (=> mapNonEmpty!33117 (= mapRest!33111 (store mapRest!33117 mapKey!33117 mapValue!33117))))

(declare-fun b!951959 () Bool)

(assert (=> b!951959 (= e!536096 tp_is_empty!20787)))

(assert (= (and mapNonEmpty!33111 condMapEmpty!33117) mapIsEmpty!33117))

(assert (= (and mapNonEmpty!33111 (not condMapEmpty!33117)) mapNonEmpty!33117))

(assert (= (and mapNonEmpty!33117 ((_ is ValueCellFull!9912) mapValue!33117)) b!951958))

(assert (= (and mapNonEmpty!33111 ((_ is ValueCellFull!9912) mapDefault!33117)) b!951959))

(declare-fun m!884139 () Bool)

(assert (=> mapNonEmpty!33117 m!884139))

(declare-fun b_lambda!14401 () Bool)

(assert (= b_lambda!14399 (or (and b!951787 b_free!18279) b_lambda!14401)))

(check-sat (not b!951940) (not bm!41534) (not b!951935) (not b!951858) (not b!951865) (not b!951938) (not mapNonEmpty!33117) (not bm!41530) (not b!951884) (not d!115405) (not b!951932) (not b!951877) (not d!115397) (not b!951937) (not b!951846) (not b!951870) (not b!951931) (not b!951829) (not d!115407) (not b!951828) (not d!115391) (not d!115385) (not b!951934) b_and!29755 (not d!115401) (not b!951936) (not b!951857) (not bm!41531) (not bm!41533) (not bm!41514) (not b_next!18279) (not b_lambda!14401) tp_is_empty!20787 (not b!951827) (not b!951886))
(check-sat b_and!29755 (not b_next!18279))
(get-model)

(declare-fun b!951984 () Bool)

(declare-fun e!536117 () ListLongMap!12275)

(declare-fun e!536111 () ListLongMap!12275)

(assert (=> b!951984 (= e!536117 e!536111)))

(declare-fun c!99546 () Bool)

(assert (=> b!951984 (= c!99546 (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951985 () Bool)

(declare-fun e!536116 () Bool)

(declare-fun e!536113 () Bool)

(assert (=> b!951985 (= e!536116 e!536113)))

(assert (=> b!951985 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun res!637865 () Bool)

(declare-fun lt!428917 () ListLongMap!12275)

(assert (=> b!951985 (= res!637865 (contains!5246 lt!428917 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951985 (=> (not res!637865) (not e!536113))))

(declare-fun bm!41538 () Bool)

(declare-fun call!41541 () ListLongMap!12275)

(assert (=> bm!41538 (= call!41541 (getCurrentListMapNoExtraKeys!3323 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5812 thiss!1141)))))

(declare-fun d!115409 () Bool)

(declare-fun e!536114 () Bool)

(assert (=> d!115409 e!536114))

(declare-fun res!637868 () Bool)

(assert (=> d!115409 (=> (not res!637868) (not e!536114))))

(assert (=> d!115409 (= res!637868 (not (contains!5246 lt!428917 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!115409 (= lt!428917 e!536117)))

(declare-fun c!99549 () Bool)

(assert (=> d!115409 (= c!99549 (bvsge #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(assert (=> d!115409 (validMask!0 (mask!27643 thiss!1141))))

(assert (=> d!115409 (= (getCurrentListMapNoExtraKeys!3323 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)) lt!428917)))

(declare-fun b!951986 () Bool)

(declare-fun e!536115 () Bool)

(assert (=> b!951986 (= e!536116 e!536115)))

(declare-fun c!99548 () Bool)

(assert (=> b!951986 (= c!99548 (bvslt #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun b!951987 () Bool)

(assert (=> b!951987 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(assert (=> b!951987 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28174 (_values!5835 thiss!1141))))))

(assert (=> b!951987 (= e!536113 (= (apply!884 lt!428917 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)) (get!14556 (select (arr!27696 (_values!5835 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1657 (defaultEntry!5812 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951988 () Bool)

(assert (=> b!951988 (= e!536115 (= lt!428917 (getCurrentListMapNoExtraKeys!3323 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5812 thiss!1141))))))

(declare-fun b!951989 () Bool)

(declare-fun res!637866 () Bool)

(assert (=> b!951989 (=> (not res!637866) (not e!536114))))

(assert (=> b!951989 (= res!637866 (not (contains!5246 lt!428917 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!951990 () Bool)

(declare-fun e!536112 () Bool)

(assert (=> b!951990 (= e!536112 (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951990 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!951991 () Bool)

(assert (=> b!951991 (= e!536114 e!536116)))

(declare-fun c!99547 () Bool)

(assert (=> b!951991 (= c!99547 e!536112)))

(declare-fun res!637867 () Bool)

(assert (=> b!951991 (=> (not res!637867) (not e!536112))))

(assert (=> b!951991 (= res!637867 (bvslt #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun b!951992 () Bool)

(declare-fun lt!428919 () Unit!32031)

(declare-fun lt!428914 () Unit!32031)

(assert (=> b!951992 (= lt!428919 lt!428914)))

(declare-fun lt!428913 () ListLongMap!12275)

(declare-fun lt!428915 () V!32681)

(declare-fun lt!428918 () (_ BitVec 64))

(declare-fun lt!428916 () (_ BitVec 64))

(assert (=> b!951992 (not (contains!5246 (+!2868 lt!428913 (tuple2!13579 lt!428918 lt!428915)) lt!428916))))

(declare-fun addStillNotContains!228 (ListLongMap!12275 (_ BitVec 64) V!32681 (_ BitVec 64)) Unit!32031)

(assert (=> b!951992 (= lt!428914 (addStillNotContains!228 lt!428913 lt!428918 lt!428915 lt!428916))))

(assert (=> b!951992 (= lt!428916 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!951992 (= lt!428915 (get!14556 (select (arr!27696 (_values!5835 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1657 (defaultEntry!5812 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!951992 (= lt!428918 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951992 (= lt!428913 call!41541)))

(assert (=> b!951992 (= e!536111 (+!2868 call!41541 (tuple2!13579 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000) (get!14556 (select (arr!27696 (_values!5835 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1657 (defaultEntry!5812 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!951993 () Bool)

(assert (=> b!951993 (= e!536117 (ListLongMap!12276 Nil!19357))))

(declare-fun b!951994 () Bool)

(declare-fun isEmpty!714 (ListLongMap!12275) Bool)

(assert (=> b!951994 (= e!536115 (isEmpty!714 lt!428917))))

(declare-fun b!951995 () Bool)

(assert (=> b!951995 (= e!536111 call!41541)))

(assert (= (and d!115409 c!99549) b!951993))

(assert (= (and d!115409 (not c!99549)) b!951984))

(assert (= (and b!951984 c!99546) b!951992))

(assert (= (and b!951984 (not c!99546)) b!951995))

(assert (= (or b!951992 b!951995) bm!41538))

(assert (= (and d!115409 res!637868) b!951989))

(assert (= (and b!951989 res!637866) b!951991))

(assert (= (and b!951991 res!637867) b!951990))

(assert (= (and b!951991 c!99547) b!951985))

(assert (= (and b!951991 (not c!99547)) b!951986))

(assert (= (and b!951985 res!637865) b!951987))

(assert (= (and b!951986 c!99548) b!951988))

(assert (= (and b!951986 (not c!99548)) b!951994))

(declare-fun b_lambda!14403 () Bool)

(assert (=> (not b_lambda!14403) (not b!951987)))

(assert (=> b!951987 t!27713))

(declare-fun b_and!29757 () Bool)

(assert (= b_and!29755 (and (=> t!27713 result!12331) b_and!29757)))

(declare-fun b_lambda!14405 () Bool)

(assert (=> (not b_lambda!14405) (not b!951992)))

(assert (=> b!951992 t!27713))

(declare-fun b_and!29759 () Bool)

(assert (= b_and!29757 (and (=> t!27713 result!12331) b_and!29759)))

(declare-fun m!884141 () Bool)

(assert (=> bm!41538 m!884141))

(assert (=> b!951990 m!884063))

(assert (=> b!951990 m!884063))

(assert (=> b!951990 m!884083))

(assert (=> b!951985 m!884063))

(assert (=> b!951985 m!884063))

(declare-fun m!884143 () Bool)

(assert (=> b!951985 m!884143))

(declare-fun m!884145 () Bool)

(assert (=> d!115409 m!884145))

(assert (=> d!115409 m!883987))

(assert (=> b!951992 m!884063))

(declare-fun m!884147 () Bool)

(assert (=> b!951992 m!884147))

(assert (=> b!951992 m!884085))

(assert (=> b!951992 m!884087))

(assert (=> b!951992 m!884089))

(declare-fun m!884149 () Bool)

(assert (=> b!951992 m!884149))

(declare-fun m!884151 () Bool)

(assert (=> b!951992 m!884151))

(assert (=> b!951992 m!884085))

(assert (=> b!951992 m!884149))

(assert (=> b!951992 m!884087))

(declare-fun m!884153 () Bool)

(assert (=> b!951992 m!884153))

(assert (=> b!951984 m!884063))

(assert (=> b!951984 m!884063))

(assert (=> b!951984 m!884083))

(assert (=> b!951988 m!884141))

(declare-fun m!884155 () Bool)

(assert (=> b!951989 m!884155))

(declare-fun m!884157 () Bool)

(assert (=> b!951994 m!884157))

(assert (=> b!951987 m!884063))

(assert (=> b!951987 m!884085))

(assert (=> b!951987 m!884087))

(assert (=> b!951987 m!884089))

(assert (=> b!951987 m!884063))

(declare-fun m!884159 () Bool)

(assert (=> b!951987 m!884159))

(assert (=> b!951987 m!884085))

(assert (=> b!951987 m!884087))

(assert (=> bm!41530 d!115409))

(declare-fun bm!41541 () Bool)

(declare-fun call!41544 () (_ BitVec 32))

(assert (=> bm!41541 (= call!41544 (arrayCountValidKeys!0 (_keys!10759 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun b!952004 () Bool)

(declare-fun e!536123 () (_ BitVec 32))

(assert (=> b!952004 (= e!536123 call!41544)))

(declare-fun d!115411 () Bool)

(declare-fun lt!428922 () (_ BitVec 32))

(assert (=> d!115411 (and (bvsge lt!428922 #b00000000000000000000000000000000) (bvsle lt!428922 (bvsub (size!28175 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!536122 () (_ BitVec 32))

(assert (=> d!115411 (= lt!428922 e!536122)))

(declare-fun c!99555 () Bool)

(assert (=> d!115411 (= c!99555 (bvsge #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(assert (=> d!115411 (and (bvsle #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28175 (_keys!10759 thiss!1141)) (size!28175 (_keys!10759 thiss!1141))))))

(assert (=> d!115411 (= (arrayCountValidKeys!0 (_keys!10759 thiss!1141) #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))) lt!428922)))

(declare-fun b!952005 () Bool)

(assert (=> b!952005 (= e!536122 e!536123)))

(declare-fun c!99554 () Bool)

(assert (=> b!952005 (= c!99554 (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952006 () Bool)

(assert (=> b!952006 (= e!536123 (bvadd #b00000000000000000000000000000001 call!41544))))

(declare-fun b!952007 () Bool)

(assert (=> b!952007 (= e!536122 #b00000000000000000000000000000000)))

(assert (= (and d!115411 c!99555) b!952007))

(assert (= (and d!115411 (not c!99555)) b!952005))

(assert (= (and b!952005 c!99554) b!952006))

(assert (= (and b!952005 (not c!99554)) b!952004))

(assert (= (or b!952006 b!952004) bm!41541))

(declare-fun m!884161 () Bool)

(assert (=> bm!41541 m!884161))

(assert (=> b!952005 m!884063))

(assert (=> b!952005 m!884063))

(assert (=> b!952005 m!884083))

(assert (=> b!951827 d!115411))

(declare-fun d!115413 () Bool)

(declare-fun res!637873 () Bool)

(declare-fun e!536128 () Bool)

(assert (=> d!115413 (=> res!637873 e!536128)))

(assert (=> d!115413 (= res!637873 (and ((_ is Cons!19356) (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))) (= (_1!6800 (h!20517 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))))) key!756)))))

(assert (=> d!115413 (= (containsKey!470 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756) e!536128)))

(declare-fun b!952012 () Bool)

(declare-fun e!536129 () Bool)

(assert (=> b!952012 (= e!536128 e!536129)))

(declare-fun res!637874 () Bool)

(assert (=> b!952012 (=> (not res!637874) (not e!536129))))

(assert (=> b!952012 (= res!637874 (and (or (not ((_ is Cons!19356) (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))))) (bvsle (_1!6800 (h!20517 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))))) key!756)) ((_ is Cons!19356) (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))) (bvslt (_1!6800 (h!20517 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))))) key!756)))))

(declare-fun b!952013 () Bool)

(assert (=> b!952013 (= e!536129 (containsKey!470 (t!27711 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))) key!756))))

(assert (= (and d!115413 (not res!637873)) b!952012))

(assert (= (and b!952012 res!637874) b!952013))

(declare-fun m!884163 () Bool)

(assert (=> b!952013 m!884163))

(assert (=> d!115405 d!115413))

(declare-fun b!952022 () Bool)

(declare-fun res!637884 () Bool)

(declare-fun e!536132 () Bool)

(assert (=> b!952022 (=> (not res!637884) (not e!536132))))

(assert (=> b!952022 (= res!637884 (and (= (size!28174 (_values!5835 thiss!1141)) (bvadd (mask!27643 thiss!1141) #b00000000000000000000000000000001)) (= (size!28175 (_keys!10759 thiss!1141)) (size!28174 (_values!5835 thiss!1141))) (bvsge (_size!2542 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2542 thiss!1141) (bvadd (mask!27643 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!952024 () Bool)

(declare-fun res!637885 () Bool)

(assert (=> b!952024 (=> (not res!637885) (not e!536132))))

(declare-fun size!28178 (LongMapFixedSize!4974) (_ BitVec 32))

(assert (=> b!952024 (= res!637885 (= (size!28178 thiss!1141) (bvadd (_size!2542 thiss!1141) (bvsdiv (bvadd (extraKeys!5544 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!952023 () Bool)

(declare-fun res!637883 () Bool)

(assert (=> b!952023 (=> (not res!637883) (not e!536132))))

(assert (=> b!952023 (= res!637883 (bvsge (size!28178 thiss!1141) (_size!2542 thiss!1141)))))

(declare-fun b!952025 () Bool)

(assert (=> b!952025 (= e!536132 (and (bvsge (extraKeys!5544 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5544 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2542 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!115415 () Bool)

(declare-fun res!637886 () Bool)

(assert (=> d!115415 (=> (not res!637886) (not e!536132))))

(assert (=> d!115415 (= res!637886 (validMask!0 (mask!27643 thiss!1141)))))

(assert (=> d!115415 (= (simpleValid!380 thiss!1141) e!536132)))

(assert (= (and d!115415 res!637886) b!952022))

(assert (= (and b!952022 res!637884) b!952023))

(assert (= (and b!952023 res!637883) b!952024))

(assert (= (and b!952024 res!637885) b!952025))

(declare-fun m!884165 () Bool)

(assert (=> b!952024 m!884165))

(assert (=> b!952023 m!884165))

(assert (=> d!115415 m!883987))

(assert (=> d!115385 d!115415))

(declare-fun b!952026 () Bool)

(declare-fun e!536134 () Bool)

(declare-fun call!41545 () Bool)

(assert (=> b!952026 (= e!536134 call!41545)))

(declare-fun b!952027 () Bool)

(declare-fun e!536133 () Bool)

(assert (=> b!952027 (= e!536133 e!536134)))

(declare-fun lt!428924 () (_ BitVec 64))

(assert (=> b!952027 (= lt!428924 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428923 () Unit!32031)

(assert (=> b!952027 (= lt!428923 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10759 thiss!1141) lt!428924 #b00000000000000000000000000000000))))

(assert (=> b!952027 (arrayContainsKey!0 (_keys!10759 thiss!1141) lt!428924 #b00000000000000000000000000000000)))

(declare-fun lt!428925 () Unit!32031)

(assert (=> b!952027 (= lt!428925 lt!428923)))

(declare-fun res!637888 () Bool)

(assert (=> b!952027 (= res!637888 (= (seekEntryOrOpen!0 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000) (_keys!10759 thiss!1141) (mask!27643 thiss!1141)) (Found!9157 #b00000000000000000000000000000000)))))

(assert (=> b!952027 (=> (not res!637888) (not e!536134))))

(declare-fun bm!41542 () Bool)

(assert (=> bm!41542 (= call!41545 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))

(declare-fun b!952028 () Bool)

(declare-fun e!536135 () Bool)

(assert (=> b!952028 (= e!536135 e!536133)))

(declare-fun c!99556 () Bool)

(assert (=> b!952028 (= c!99556 (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952029 () Bool)

(assert (=> b!952029 (= e!536133 call!41545)))

(declare-fun d!115417 () Bool)

(declare-fun res!637887 () Bool)

(assert (=> d!115417 (=> res!637887 e!536135)))

(assert (=> d!115417 (= res!637887 (bvsge #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(assert (=> d!115417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)) e!536135)))

(assert (= (and d!115417 (not res!637887)) b!952028))

(assert (= (and b!952028 c!99556) b!952027))

(assert (= (and b!952028 (not c!99556)) b!952029))

(assert (= (and b!952027 res!637888) b!952026))

(assert (= (or b!952026 b!952029) bm!41542))

(assert (=> b!952027 m!884063))

(declare-fun m!884167 () Bool)

(assert (=> b!952027 m!884167))

(declare-fun m!884169 () Bool)

(assert (=> b!952027 m!884169))

(assert (=> b!952027 m!884063))

(declare-fun m!884171 () Bool)

(assert (=> b!952027 m!884171))

(declare-fun m!884173 () Bool)

(assert (=> bm!41542 m!884173))

(assert (=> b!952028 m!884063))

(assert (=> b!952028 m!884063))

(assert (=> b!952028 m!884083))

(assert (=> b!951828 d!115417))

(declare-fun d!115419 () Bool)

(declare-fun e!536138 () Bool)

(assert (=> d!115419 e!536138))

(declare-fun res!637893 () Bool)

(assert (=> d!115419 (=> (not res!637893) (not e!536138))))

(declare-fun lt!428935 () ListLongMap!12275)

(assert (=> d!115419 (= res!637893 (contains!5246 lt!428935 (_1!6800 (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))))))))

(declare-fun lt!428937 () List!19360)

(assert (=> d!115419 (= lt!428935 (ListLongMap!12276 lt!428937))))

(declare-fun lt!428936 () Unit!32031)

(declare-fun lt!428934 () Unit!32031)

(assert (=> d!115419 (= lt!428936 lt!428934)))

(assert (=> d!115419 (= (getValueByKey!503 lt!428937 (_1!6800 (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))))) (Some!508 (_2!6800 (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!267 (List!19360 (_ BitVec 64) V!32681) Unit!32031)

(assert (=> d!115419 (= lt!428934 (lemmaContainsTupThenGetReturnValue!267 lt!428937 (_1!6800 (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))) (_2!6800 (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))))))))

(declare-fun insertStrictlySorted!324 (List!19360 (_ BitVec 64) V!32681) List!19360)

(assert (=> d!115419 (= lt!428937 (insertStrictlySorted!324 (toList!6153 (ite c!99532 call!41538 (ite c!99537 call!41536 call!41533))) (_1!6800 (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))) (_2!6800 (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))))))))

(assert (=> d!115419 (= (+!2868 (ite c!99532 call!41538 (ite c!99537 call!41536 call!41533)) (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))) lt!428935)))

(declare-fun b!952034 () Bool)

(declare-fun res!637894 () Bool)

(assert (=> b!952034 (=> (not res!637894) (not e!536138))))

(assert (=> b!952034 (= res!637894 (= (getValueByKey!503 (toList!6153 lt!428935) (_1!6800 (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))))) (Some!508 (_2!6800 (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))))))))

(declare-fun b!952035 () Bool)

(declare-fun contains!5247 (List!19360 tuple2!13578) Bool)

(assert (=> b!952035 (= e!536138 (contains!5247 (toList!6153 lt!428935) (ite (or c!99532 c!99537) (tuple2!13579 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5648 thiss!1141)) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))))))

(assert (= (and d!115419 res!637893) b!952034))

(assert (= (and b!952034 res!637894) b!952035))

(declare-fun m!884175 () Bool)

(assert (=> d!115419 m!884175))

(declare-fun m!884177 () Bool)

(assert (=> d!115419 m!884177))

(declare-fun m!884179 () Bool)

(assert (=> d!115419 m!884179))

(declare-fun m!884181 () Bool)

(assert (=> d!115419 m!884181))

(declare-fun m!884183 () Bool)

(assert (=> b!952034 m!884183))

(declare-fun m!884185 () Bool)

(assert (=> b!952035 m!884185))

(assert (=> bm!41531 d!115419))

(assert (=> d!115401 d!115393))

(declare-fun d!115421 () Bool)

(assert (=> d!115421 (arrayForallSeekEntryOrOpenFound!0 lt!428780 (_keys!10759 thiss!1141) (mask!27643 thiss!1141))))

(assert (=> d!115421 true))

(declare-fun _$72!125 () Unit!32031)

(assert (=> d!115421 (= (choose!38 (_keys!10759 thiss!1141) (mask!27643 thiss!1141) #b00000000000000000000000000000000 lt!428780) _$72!125)))

(declare-fun bs!26743 () Bool)

(assert (= bs!26743 d!115421))

(assert (=> bs!26743 m!883985))

(assert (=> d!115401 d!115421))

(assert (=> d!115401 d!115403))

(declare-fun b!952054 () Bool)

(declare-fun lt!428942 () SeekEntryResult!9157)

(assert (=> b!952054 (and (bvsge (index!39001 lt!428942) #b00000000000000000000000000000000) (bvslt (index!39001 lt!428942) (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun e!536152 () Bool)

(assert (=> b!952054 (= e!536152 (= (select (arr!27697 (_keys!10759 thiss!1141)) (index!39001 lt!428942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!115423 () Bool)

(declare-fun e!536153 () Bool)

(assert (=> d!115423 e!536153))

(declare-fun c!99564 () Bool)

(assert (=> d!115423 (= c!99564 (and ((_ is Intermediate!9157) lt!428942) (undefined!9969 lt!428942)))))

(declare-fun e!536151 () SeekEntryResult!9157)

(assert (=> d!115423 (= lt!428942 e!536151)))

(declare-fun c!99565 () Bool)

(assert (=> d!115423 (= c!99565 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!428943 () (_ BitVec 64))

(assert (=> d!115423 (= lt!428943 (select (arr!27697 (_keys!10759 thiss!1141)) (toIndex!0 key!756 (mask!27643 thiss!1141))))))

(assert (=> d!115423 (validMask!0 (mask!27643 thiss!1141))))

(assert (=> d!115423 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27643 thiss!1141)) key!756 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)) lt!428942)))

(declare-fun b!952055 () Bool)

(assert (=> b!952055 (= e!536153 (bvsge (x!81891 lt!428942) #b01111111111111111111111111111110))))

(declare-fun b!952056 () Bool)

(declare-fun e!536150 () SeekEntryResult!9157)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952056 (= e!536150 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27643 thiss!1141)) #b00000000000000000000000000000000 (mask!27643 thiss!1141)) key!756 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))

(declare-fun b!952057 () Bool)

(assert (=> b!952057 (= e!536151 e!536150)))

(declare-fun c!99563 () Bool)

(assert (=> b!952057 (= c!99563 (or (= lt!428943 key!756) (= (bvadd lt!428943 lt!428943) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!952058 () Bool)

(assert (=> b!952058 (and (bvsge (index!39001 lt!428942) #b00000000000000000000000000000000) (bvslt (index!39001 lt!428942) (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun res!637903 () Bool)

(assert (=> b!952058 (= res!637903 (= (select (arr!27697 (_keys!10759 thiss!1141)) (index!39001 lt!428942)) key!756))))

(assert (=> b!952058 (=> res!637903 e!536152)))

(declare-fun e!536149 () Bool)

(assert (=> b!952058 (= e!536149 e!536152)))

(declare-fun b!952059 () Bool)

(assert (=> b!952059 (and (bvsge (index!39001 lt!428942) #b00000000000000000000000000000000) (bvslt (index!39001 lt!428942) (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun res!637902 () Bool)

(assert (=> b!952059 (= res!637902 (= (select (arr!27697 (_keys!10759 thiss!1141)) (index!39001 lt!428942)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952059 (=> res!637902 e!536152)))

(declare-fun b!952060 () Bool)

(assert (=> b!952060 (= e!536150 (Intermediate!9157 false (toIndex!0 key!756 (mask!27643 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!952061 () Bool)

(assert (=> b!952061 (= e!536153 e!536149)))

(declare-fun res!637901 () Bool)

(assert (=> b!952061 (= res!637901 (and ((_ is Intermediate!9157) lt!428942) (not (undefined!9969 lt!428942)) (bvslt (x!81891 lt!428942) #b01111111111111111111111111111110) (bvsge (x!81891 lt!428942) #b00000000000000000000000000000000) (bvsge (x!81891 lt!428942) #b00000000000000000000000000000000)))))

(assert (=> b!952061 (=> (not res!637901) (not e!536149))))

(declare-fun b!952062 () Bool)

(assert (=> b!952062 (= e!536151 (Intermediate!9157 true (toIndex!0 key!756 (mask!27643 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!115423 c!99565) b!952062))

(assert (= (and d!115423 (not c!99565)) b!952057))

(assert (= (and b!952057 c!99563) b!952060))

(assert (= (and b!952057 (not c!99563)) b!952056))

(assert (= (and d!115423 c!99564) b!952055))

(assert (= (and d!115423 (not c!99564)) b!952061))

(assert (= (and b!952061 res!637901) b!952058))

(assert (= (and b!952058 (not res!637903)) b!952059))

(assert (= (and b!952059 (not res!637902)) b!952054))

(assert (=> b!952056 m!884045))

(declare-fun m!884187 () Bool)

(assert (=> b!952056 m!884187))

(assert (=> b!952056 m!884187))

(declare-fun m!884189 () Bool)

(assert (=> b!952056 m!884189))

(assert (=> d!115423 m!884045))

(declare-fun m!884191 () Bool)

(assert (=> d!115423 m!884191))

(assert (=> d!115423 m!883987))

(declare-fun m!884193 () Bool)

(assert (=> b!952059 m!884193))

(assert (=> b!952054 m!884193))

(assert (=> b!952058 m!884193))

(assert (=> d!115391 d!115423))

(declare-fun d!115425 () Bool)

(declare-fun lt!428949 () (_ BitVec 32))

(declare-fun lt!428948 () (_ BitVec 32))

(assert (=> d!115425 (= lt!428949 (bvmul (bvxor lt!428948 (bvlshr lt!428948 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115425 (= lt!428948 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115425 (and (bvsge (mask!27643 thiss!1141) #b00000000000000000000000000000000) (let ((res!637904 (let ((h!20519 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81908 (bvmul (bvxor h!20519 (bvlshr h!20519 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81908 (bvlshr x!81908 #b00000000000000000000000000001101)) (mask!27643 thiss!1141)))))) (and (bvslt res!637904 (bvadd (mask!27643 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!637904 #b00000000000000000000000000000000))))))

(assert (=> d!115425 (= (toIndex!0 key!756 (mask!27643 thiss!1141)) (bvand (bvxor lt!428949 (bvlshr lt!428949 #b00000000000000000000000000001101)) (mask!27643 thiss!1141)))))

(assert (=> d!115391 d!115425))

(assert (=> d!115391 d!115403))

(declare-fun d!115427 () Bool)

(assert (=> d!115427 (= (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951940 d!115427))

(declare-fun d!115429 () Bool)

(declare-fun res!637905 () Bool)

(declare-fun e!536154 () Bool)

(assert (=> d!115429 (=> res!637905 e!536154)))

(assert (=> d!115429 (= res!637905 (= (select (arr!27697 (_keys!10759 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115429 (= (arrayContainsKey!0 (_keys!10759 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!536154)))

(declare-fun b!952063 () Bool)

(declare-fun e!536155 () Bool)

(assert (=> b!952063 (= e!536154 e!536155)))

(declare-fun res!637906 () Bool)

(assert (=> b!952063 (=> (not res!637906) (not e!536155))))

(assert (=> b!952063 (= res!637906 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun b!952064 () Bool)

(assert (=> b!952064 (= e!536155 (arrayContainsKey!0 (_keys!10759 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115429 (not res!637905)) b!952063))

(assert (= (and b!952063 res!637906) b!952064))

(declare-fun m!884195 () Bool)

(assert (=> d!115429 m!884195))

(declare-fun m!884197 () Bool)

(assert (=> b!952064 m!884197))

(assert (=> b!951865 d!115429))

(declare-fun d!115431 () Bool)

(declare-fun e!536156 () Bool)

(assert (=> d!115431 e!536156))

(declare-fun res!637907 () Bool)

(assert (=> d!115431 (=> res!637907 e!536156)))

(declare-fun lt!428952 () Bool)

(assert (=> d!115431 (= res!637907 (not lt!428952))))

(declare-fun lt!428951 () Bool)

(assert (=> d!115431 (= lt!428952 lt!428951)))

(declare-fun lt!428950 () Unit!32031)

(declare-fun e!536157 () Unit!32031)

(assert (=> d!115431 (= lt!428950 e!536157)))

(declare-fun c!99566 () Bool)

(assert (=> d!115431 (= c!99566 lt!428951)))

(assert (=> d!115431 (= lt!428951 (containsKey!470 (toList!6153 lt!428886) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115431 (= (contains!5246 lt!428886 #b0000000000000000000000000000000000000000000000000000000000000000) lt!428952)))

(declare-fun b!952065 () Bool)

(declare-fun lt!428953 () Unit!32031)

(assert (=> b!952065 (= e!536157 lt!428953)))

(assert (=> b!952065 (= lt!428953 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6153 lt!428886) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952065 (isDefined!375 (getValueByKey!503 (toList!6153 lt!428886) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952066 () Bool)

(declare-fun Unit!32035 () Unit!32031)

(assert (=> b!952066 (= e!536157 Unit!32035)))

(declare-fun b!952067 () Bool)

(assert (=> b!952067 (= e!536156 (isDefined!375 (getValueByKey!503 (toList!6153 lt!428886) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115431 c!99566) b!952065))

(assert (= (and d!115431 (not c!99566)) b!952066))

(assert (= (and d!115431 (not res!637907)) b!952067))

(declare-fun m!884199 () Bool)

(assert (=> d!115431 m!884199))

(declare-fun m!884201 () Bool)

(assert (=> b!952065 m!884201))

(declare-fun m!884203 () Bool)

(assert (=> b!952065 m!884203))

(assert (=> b!952065 m!884203))

(declare-fun m!884205 () Bool)

(assert (=> b!952065 m!884205))

(assert (=> b!952067 m!884203))

(assert (=> b!952067 m!884203))

(assert (=> b!952067 m!884205))

(assert (=> bm!41534 d!115431))

(declare-fun b!952078 () Bool)

(declare-fun e!536169 () Bool)

(declare-fun e!536166 () Bool)

(assert (=> b!952078 (= e!536169 e!536166)))

(declare-fun res!637916 () Bool)

(assert (=> b!952078 (=> (not res!637916) (not e!536166))))

(declare-fun e!536167 () Bool)

(assert (=> b!952078 (= res!637916 (not e!536167))))

(declare-fun res!637915 () Bool)

(assert (=> b!952078 (=> (not res!637915) (not e!536167))))

(assert (=> b!952078 (= res!637915 (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115433 () Bool)

(declare-fun res!637914 () Bool)

(assert (=> d!115433 (=> res!637914 e!536169)))

(assert (=> d!115433 (= res!637914 (bvsge #b00000000000000000000000000000000 (size!28175 (_keys!10759 thiss!1141))))))

(assert (=> d!115433 (= (arrayNoDuplicates!0 (_keys!10759 thiss!1141) #b00000000000000000000000000000000 Nil!19358) e!536169)))

(declare-fun b!952079 () Bool)

(declare-fun contains!5248 (List!19361 (_ BitVec 64)) Bool)

(assert (=> b!952079 (= e!536167 (contains!5248 Nil!19358 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41545 () Bool)

(declare-fun call!41548 () Bool)

(declare-fun c!99569 () Bool)

(assert (=> bm!41545 (= call!41548 (arrayNoDuplicates!0 (_keys!10759 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99569 (Cons!19357 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000) Nil!19358) Nil!19358)))))

(declare-fun b!952080 () Bool)

(declare-fun e!536168 () Bool)

(assert (=> b!952080 (= e!536168 call!41548)))

(declare-fun b!952081 () Bool)

(assert (=> b!952081 (= e!536168 call!41548)))

(declare-fun b!952082 () Bool)

(assert (=> b!952082 (= e!536166 e!536168)))

(assert (=> b!952082 (= c!99569 (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115433 (not res!637914)) b!952078))

(assert (= (and b!952078 res!637915) b!952079))

(assert (= (and b!952078 res!637916) b!952082))

(assert (= (and b!952082 c!99569) b!952080))

(assert (= (and b!952082 (not c!99569)) b!952081))

(assert (= (or b!952080 b!952081) bm!41545))

(assert (=> b!952078 m!884063))

(assert (=> b!952078 m!884063))

(assert (=> b!952078 m!884083))

(assert (=> b!952079 m!884063))

(assert (=> b!952079 m!884063))

(declare-fun m!884207 () Bool)

(assert (=> b!952079 m!884207))

(assert (=> bm!41545 m!884063))

(declare-fun m!884209 () Bool)

(assert (=> bm!41545 m!884209))

(assert (=> b!952082 m!884063))

(assert (=> b!952082 m!884063))

(assert (=> b!952082 m!884083))

(assert (=> b!951829 d!115433))

(declare-fun d!115435 () Bool)

(declare-fun e!536170 () Bool)

(assert (=> d!115435 e!536170))

(declare-fun res!637917 () Bool)

(assert (=> d!115435 (=> res!637917 e!536170)))

(declare-fun lt!428956 () Bool)

(assert (=> d!115435 (= res!637917 (not lt!428956))))

(declare-fun lt!428955 () Bool)

(assert (=> d!115435 (= lt!428956 lt!428955)))

(declare-fun lt!428954 () Unit!32031)

(declare-fun e!536171 () Unit!32031)

(assert (=> d!115435 (= lt!428954 e!536171)))

(declare-fun c!99570 () Bool)

(assert (=> d!115435 (= c!99570 lt!428955)))

(assert (=> d!115435 (= lt!428955 (containsKey!470 (toList!6153 lt!428886) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115435 (= (contains!5246 lt!428886 #b1000000000000000000000000000000000000000000000000000000000000000) lt!428956)))

(declare-fun b!952083 () Bool)

(declare-fun lt!428957 () Unit!32031)

(assert (=> b!952083 (= e!536171 lt!428957)))

(assert (=> b!952083 (= lt!428957 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6153 lt!428886) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952083 (isDefined!375 (getValueByKey!503 (toList!6153 lt!428886) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952084 () Bool)

(declare-fun Unit!32036 () Unit!32031)

(assert (=> b!952084 (= e!536171 Unit!32036)))

(declare-fun b!952085 () Bool)

(assert (=> b!952085 (= e!536170 (isDefined!375 (getValueByKey!503 (toList!6153 lt!428886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115435 c!99570) b!952083))

(assert (= (and d!115435 (not c!99570)) b!952084))

(assert (= (and d!115435 (not res!637917)) b!952085))

(declare-fun m!884211 () Bool)

(assert (=> d!115435 m!884211))

(declare-fun m!884213 () Bool)

(assert (=> b!952083 m!884213))

(declare-fun m!884215 () Bool)

(assert (=> b!952083 m!884215))

(assert (=> b!952083 m!884215))

(declare-fun m!884217 () Bool)

(assert (=> b!952083 m!884217))

(assert (=> b!952085 m!884215))

(assert (=> b!952085 m!884215))

(assert (=> b!952085 m!884217))

(assert (=> bm!41533 d!115435))

(assert (=> d!115407 d!115403))

(declare-fun d!115437 () Bool)

(declare-fun e!536174 () Bool)

(assert (=> d!115437 e!536174))

(declare-fun c!99573 () Bool)

(assert (=> d!115437 (= c!99573 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!115437 true))

(declare-fun _$15!107 () Unit!32031)

(assert (=> d!115437 (= (choose!1593 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) key!756 (defaultEntry!5812 thiss!1141)) _$15!107)))

(declare-fun b!952090 () Bool)

(assert (=> b!952090 (= e!536174 (arrayContainsKey!0 (_keys!10759 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952091 () Bool)

(assert (=> b!952091 (= e!536174 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5544 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115437 c!99573) b!952090))

(assert (= (and d!115437 (not c!99573)) b!952091))

(assert (=> b!952090 m!883993))

(assert (=> d!115397 d!115437))

(assert (=> d!115397 d!115403))

(assert (=> b!951932 d!115427))

(declare-fun b!952104 () Bool)

(declare-fun e!536182 () SeekEntryResult!9157)

(assert (=> b!952104 (= e!536182 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81891 lt!428799) #b00000000000000000000000000000001) (nextIndex!0 (index!39001 lt!428799) (x!81891 lt!428799) (mask!27643 thiss!1141)) (index!39001 lt!428799) key!756 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))

(declare-fun b!952105 () Bool)

(declare-fun e!536183 () SeekEntryResult!9157)

(declare-fun e!536181 () SeekEntryResult!9157)

(assert (=> b!952105 (= e!536183 e!536181)))

(declare-fun c!99582 () Bool)

(declare-fun lt!428962 () (_ BitVec 64))

(assert (=> b!952105 (= c!99582 (= lt!428962 key!756))))

(declare-fun b!952106 () Bool)

(assert (=> b!952106 (= e!536183 Undefined!9157)))

(declare-fun d!115439 () Bool)

(declare-fun lt!428963 () SeekEntryResult!9157)

(assert (=> d!115439 (and (or ((_ is Undefined!9157) lt!428963) (not ((_ is Found!9157) lt!428963)) (and (bvsge (index!39000 lt!428963) #b00000000000000000000000000000000) (bvslt (index!39000 lt!428963) (size!28175 (_keys!10759 thiss!1141))))) (or ((_ is Undefined!9157) lt!428963) ((_ is Found!9157) lt!428963) (not ((_ is MissingVacant!9157) lt!428963)) (not (= (index!39002 lt!428963) (index!39001 lt!428799))) (and (bvsge (index!39002 lt!428963) #b00000000000000000000000000000000) (bvslt (index!39002 lt!428963) (size!28175 (_keys!10759 thiss!1141))))) (or ((_ is Undefined!9157) lt!428963) (ite ((_ is Found!9157) lt!428963) (= (select (arr!27697 (_keys!10759 thiss!1141)) (index!39000 lt!428963)) key!756) (and ((_ is MissingVacant!9157) lt!428963) (= (index!39002 lt!428963) (index!39001 lt!428799)) (= (select (arr!27697 (_keys!10759 thiss!1141)) (index!39002 lt!428963)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!115439 (= lt!428963 e!536183)))

(declare-fun c!99580 () Bool)

(assert (=> d!115439 (= c!99580 (bvsge (x!81891 lt!428799) #b01111111111111111111111111111110))))

(assert (=> d!115439 (= lt!428962 (select (arr!27697 (_keys!10759 thiss!1141)) (index!39001 lt!428799)))))

(assert (=> d!115439 (validMask!0 (mask!27643 thiss!1141))))

(assert (=> d!115439 (= (seekKeyOrZeroReturnVacant!0 (x!81891 lt!428799) (index!39001 lt!428799) (index!39001 lt!428799) key!756 (_keys!10759 thiss!1141) (mask!27643 thiss!1141)) lt!428963)))

(declare-fun b!952107 () Bool)

(assert (=> b!952107 (= e!536181 (Found!9157 (index!39001 lt!428799)))))

(declare-fun b!952108 () Bool)

(declare-fun c!99581 () Bool)

(assert (=> b!952108 (= c!99581 (= lt!428962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952108 (= e!536181 e!536182)))

(declare-fun b!952109 () Bool)

(assert (=> b!952109 (= e!536182 (MissingVacant!9157 (index!39001 lt!428799)))))

(assert (= (and d!115439 c!99580) b!952106))

(assert (= (and d!115439 (not c!99580)) b!952105))

(assert (= (and b!952105 c!99582) b!952107))

(assert (= (and b!952105 (not c!99582)) b!952108))

(assert (= (and b!952108 c!99581) b!952109))

(assert (= (and b!952108 (not c!99581)) b!952104))

(declare-fun m!884219 () Bool)

(assert (=> b!952104 m!884219))

(assert (=> b!952104 m!884219))

(declare-fun m!884221 () Bool)

(assert (=> b!952104 m!884221))

(declare-fun m!884223 () Bool)

(assert (=> d!115439 m!884223))

(declare-fun m!884225 () Bool)

(assert (=> d!115439 m!884225))

(assert (=> d!115439 m!884049))

(assert (=> d!115439 m!883987))

(assert (=> b!951846 d!115439))

(declare-fun d!115441 () Bool)

(declare-fun get!14557 (Option!509) V!32681)

(assert (=> d!115441 (= (apply!884 lt!428895 lt!428885) (get!14557 (getValueByKey!503 (toList!6153 lt!428895) lt!428885)))))

(declare-fun bs!26744 () Bool)

(assert (= bs!26744 d!115441))

(declare-fun m!884227 () Bool)

(assert (=> bs!26744 m!884227))

(assert (=> bs!26744 m!884227))

(declare-fun m!884229 () Bool)

(assert (=> bs!26744 m!884229))

(assert (=> b!951934 d!115441))

(declare-fun d!115443 () Bool)

(declare-fun e!536184 () Bool)

(assert (=> d!115443 e!536184))

(declare-fun res!637918 () Bool)

(assert (=> d!115443 (=> (not res!637918) (not e!536184))))

(declare-fun lt!428965 () ListLongMap!12275)

(assert (=> d!115443 (= res!637918 (contains!5246 lt!428965 (_1!6800 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141)))))))

(declare-fun lt!428967 () List!19360)

(assert (=> d!115443 (= lt!428965 (ListLongMap!12276 lt!428967))))

(declare-fun lt!428966 () Unit!32031)

(declare-fun lt!428964 () Unit!32031)

(assert (=> d!115443 (= lt!428966 lt!428964)))

(assert (=> d!115443 (= (getValueByKey!503 lt!428967 (_1!6800 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141)))) (Some!508 (_2!6800 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141)))))))

(assert (=> d!115443 (= lt!428964 (lemmaContainsTupThenGetReturnValue!267 lt!428967 (_1!6800 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141))) (_2!6800 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141)))))))

(assert (=> d!115443 (= lt!428967 (insertStrictlySorted!324 (toList!6153 lt!428897) (_1!6800 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141))) (_2!6800 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141)))))))

(assert (=> d!115443 (= (+!2868 lt!428897 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141))) lt!428965)))

(declare-fun b!952110 () Bool)

(declare-fun res!637919 () Bool)

(assert (=> b!952110 (=> (not res!637919) (not e!536184))))

(assert (=> b!952110 (= res!637919 (= (getValueByKey!503 (toList!6153 lt!428965) (_1!6800 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141)))) (Some!508 (_2!6800 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141))))))))

(declare-fun b!952111 () Bool)

(assert (=> b!952111 (= e!536184 (contains!5247 (toList!6153 lt!428965) (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141))))))

(assert (= (and d!115443 res!637918) b!952110))

(assert (= (and b!952110 res!637919) b!952111))

(declare-fun m!884231 () Bool)

(assert (=> d!115443 m!884231))

(declare-fun m!884233 () Bool)

(assert (=> d!115443 m!884233))

(declare-fun m!884235 () Bool)

(assert (=> d!115443 m!884235))

(declare-fun m!884237 () Bool)

(assert (=> d!115443 m!884237))

(declare-fun m!884239 () Bool)

(assert (=> b!952110 m!884239))

(declare-fun m!884241 () Bool)

(assert (=> b!952111 m!884241))

(assert (=> b!951934 d!115443))

(declare-fun d!115445 () Bool)

(assert (=> d!115445 (= (apply!884 (+!2868 lt!428897 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141))) lt!428884) (apply!884 lt!428897 lt!428884))))

(declare-fun lt!428970 () Unit!32031)

(declare-fun choose!1594 (ListLongMap!12275 (_ BitVec 64) V!32681 (_ BitVec 64)) Unit!32031)

(assert (=> d!115445 (= lt!428970 (choose!1594 lt!428897 lt!428880 (zeroValue!5648 thiss!1141) lt!428884))))

(declare-fun e!536187 () Bool)

(assert (=> d!115445 e!536187))

(declare-fun res!637922 () Bool)

(assert (=> d!115445 (=> (not res!637922) (not e!536187))))

(assert (=> d!115445 (= res!637922 (contains!5246 lt!428897 lt!428884))))

(assert (=> d!115445 (= (addApplyDifferent!467 lt!428897 lt!428880 (zeroValue!5648 thiss!1141) lt!428884) lt!428970)))

(declare-fun b!952115 () Bool)

(assert (=> b!952115 (= e!536187 (not (= lt!428884 lt!428880)))))

(assert (= (and d!115445 res!637922) b!952115))

(assert (=> d!115445 m!884113))

(assert (=> d!115445 m!884097))

(assert (=> d!115445 m!884113))

(assert (=> d!115445 m!884115))

(declare-fun m!884243 () Bool)

(assert (=> d!115445 m!884243))

(declare-fun m!884245 () Bool)

(assert (=> d!115445 m!884245))

(assert (=> b!951934 d!115445))

(declare-fun d!115447 () Bool)

(assert (=> d!115447 (contains!5246 (+!2868 lt!428882 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141))) lt!428877)))

(declare-fun lt!428973 () Unit!32031)

(declare-fun choose!1595 (ListLongMap!12275 (_ BitVec 64) V!32681 (_ BitVec 64)) Unit!32031)

(assert (=> d!115447 (= lt!428973 (choose!1595 lt!428882 lt!428896 (zeroValue!5648 thiss!1141) lt!428877))))

(assert (=> d!115447 (contains!5246 lt!428882 lt!428877)))

(assert (=> d!115447 (= (addStillContains!587 lt!428882 lt!428896 (zeroValue!5648 thiss!1141) lt!428877) lt!428973)))

(declare-fun bs!26745 () Bool)

(assert (= bs!26745 d!115447))

(assert (=> bs!26745 m!884117))

(assert (=> bs!26745 m!884117))

(assert (=> bs!26745 m!884119))

(declare-fun m!884247 () Bool)

(assert (=> bs!26745 m!884247))

(declare-fun m!884249 () Bool)

(assert (=> bs!26745 m!884249))

(assert (=> b!951934 d!115447))

(declare-fun d!115449 () Bool)

(assert (=> d!115449 (= (apply!884 (+!2868 lt!428895 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141))) lt!428885) (apply!884 lt!428895 lt!428885))))

(declare-fun lt!428974 () Unit!32031)

(assert (=> d!115449 (= lt!428974 (choose!1594 lt!428895 lt!428888 (minValue!5648 thiss!1141) lt!428885))))

(declare-fun e!536188 () Bool)

(assert (=> d!115449 e!536188))

(declare-fun res!637923 () Bool)

(assert (=> d!115449 (=> (not res!637923) (not e!536188))))

(assert (=> d!115449 (= res!637923 (contains!5246 lt!428895 lt!428885))))

(assert (=> d!115449 (= (addApplyDifferent!467 lt!428895 lt!428888 (minValue!5648 thiss!1141) lt!428885) lt!428974)))

(declare-fun b!952117 () Bool)

(assert (=> b!952117 (= e!536188 (not (= lt!428885 lt!428888)))))

(assert (= (and d!115449 res!637923) b!952117))

(assert (=> d!115449 m!884105))

(assert (=> d!115449 m!884121))

(assert (=> d!115449 m!884105))

(assert (=> d!115449 m!884107))

(declare-fun m!884251 () Bool)

(assert (=> d!115449 m!884251))

(declare-fun m!884253 () Bool)

(assert (=> d!115449 m!884253))

(assert (=> b!951934 d!115449))

(declare-fun d!115451 () Bool)

(assert (=> d!115451 (= (apply!884 (+!2868 lt!428895 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141))) lt!428885) (get!14557 (getValueByKey!503 (toList!6153 (+!2868 lt!428895 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141)))) lt!428885)))))

(declare-fun bs!26746 () Bool)

(assert (= bs!26746 d!115451))

(declare-fun m!884255 () Bool)

(assert (=> bs!26746 m!884255))

(assert (=> bs!26746 m!884255))

(declare-fun m!884257 () Bool)

(assert (=> bs!26746 m!884257))

(assert (=> b!951934 d!115451))

(declare-fun d!115453 () Bool)

(assert (=> d!115453 (= (apply!884 (+!2868 lt!428889 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141))) lt!428881) (get!14557 (getValueByKey!503 (toList!6153 (+!2868 lt!428889 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141)))) lt!428881)))))

(declare-fun bs!26747 () Bool)

(assert (= bs!26747 d!115453))

(declare-fun m!884259 () Bool)

(assert (=> bs!26747 m!884259))

(assert (=> bs!26747 m!884259))

(declare-fun m!884261 () Bool)

(assert (=> bs!26747 m!884261))

(assert (=> b!951934 d!115453))

(declare-fun d!115455 () Bool)

(assert (=> d!115455 (= (apply!884 lt!428889 lt!428881) (get!14557 (getValueByKey!503 (toList!6153 lt!428889) lt!428881)))))

(declare-fun bs!26748 () Bool)

(assert (= bs!26748 d!115455))

(declare-fun m!884263 () Bool)

(assert (=> bs!26748 m!884263))

(assert (=> bs!26748 m!884263))

(declare-fun m!884265 () Bool)

(assert (=> bs!26748 m!884265))

(assert (=> b!951934 d!115455))

(declare-fun d!115457 () Bool)

(declare-fun e!536189 () Bool)

(assert (=> d!115457 e!536189))

(declare-fun res!637924 () Bool)

(assert (=> d!115457 (=> (not res!637924) (not e!536189))))

(declare-fun lt!428976 () ListLongMap!12275)

(assert (=> d!115457 (= res!637924 (contains!5246 lt!428976 (_1!6800 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141)))))))

(declare-fun lt!428978 () List!19360)

(assert (=> d!115457 (= lt!428976 (ListLongMap!12276 lt!428978))))

(declare-fun lt!428977 () Unit!32031)

(declare-fun lt!428975 () Unit!32031)

(assert (=> d!115457 (= lt!428977 lt!428975)))

(assert (=> d!115457 (= (getValueByKey!503 lt!428978 (_1!6800 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141)))) (Some!508 (_2!6800 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141)))))))

(assert (=> d!115457 (= lt!428975 (lemmaContainsTupThenGetReturnValue!267 lt!428978 (_1!6800 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141))) (_2!6800 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141)))))))

(assert (=> d!115457 (= lt!428978 (insertStrictlySorted!324 (toList!6153 lt!428882) (_1!6800 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141))) (_2!6800 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141)))))))

(assert (=> d!115457 (= (+!2868 lt!428882 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141))) lt!428976)))

(declare-fun b!952118 () Bool)

(declare-fun res!637925 () Bool)

(assert (=> b!952118 (=> (not res!637925) (not e!536189))))

(assert (=> b!952118 (= res!637925 (= (getValueByKey!503 (toList!6153 lt!428976) (_1!6800 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141)))) (Some!508 (_2!6800 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141))))))))

(declare-fun b!952119 () Bool)

(assert (=> b!952119 (= e!536189 (contains!5247 (toList!6153 lt!428976) (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141))))))

(assert (= (and d!115457 res!637924) b!952118))

(assert (= (and b!952118 res!637925) b!952119))

(declare-fun m!884267 () Bool)

(assert (=> d!115457 m!884267))

(declare-fun m!884269 () Bool)

(assert (=> d!115457 m!884269))

(declare-fun m!884271 () Bool)

(assert (=> d!115457 m!884271))

(declare-fun m!884273 () Bool)

(assert (=> d!115457 m!884273))

(declare-fun m!884275 () Bool)

(assert (=> b!952118 m!884275))

(declare-fun m!884277 () Bool)

(assert (=> b!952119 m!884277))

(assert (=> b!951934 d!115457))

(declare-fun d!115459 () Bool)

(assert (=> d!115459 (= (apply!884 (+!2868 lt!428889 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141))) lt!428881) (apply!884 lt!428889 lt!428881))))

(declare-fun lt!428979 () Unit!32031)

(assert (=> d!115459 (= lt!428979 (choose!1594 lt!428889 lt!428879 (minValue!5648 thiss!1141) lt!428881))))

(declare-fun e!536190 () Bool)

(assert (=> d!115459 e!536190))

(declare-fun res!637926 () Bool)

(assert (=> d!115459 (=> (not res!637926) (not e!536190))))

(assert (=> d!115459 (= res!637926 (contains!5246 lt!428889 lt!428881))))

(assert (=> d!115459 (= (addApplyDifferent!467 lt!428889 lt!428879 (minValue!5648 thiss!1141) lt!428881) lt!428979)))

(declare-fun b!952120 () Bool)

(assert (=> b!952120 (= e!536190 (not (= lt!428881 lt!428879)))))

(assert (= (and d!115459 res!637926) b!952120))

(assert (=> d!115459 m!884101))

(assert (=> d!115459 m!884103))

(assert (=> d!115459 m!884101))

(assert (=> d!115459 m!884109))

(declare-fun m!884279 () Bool)

(assert (=> d!115459 m!884279))

(declare-fun m!884281 () Bool)

(assert (=> d!115459 m!884281))

(assert (=> b!951934 d!115459))

(declare-fun d!115461 () Bool)

(declare-fun e!536191 () Bool)

(assert (=> d!115461 e!536191))

(declare-fun res!637927 () Bool)

(assert (=> d!115461 (=> res!637927 e!536191)))

(declare-fun lt!428982 () Bool)

(assert (=> d!115461 (= res!637927 (not lt!428982))))

(declare-fun lt!428981 () Bool)

(assert (=> d!115461 (= lt!428982 lt!428981)))

(declare-fun lt!428980 () Unit!32031)

(declare-fun e!536192 () Unit!32031)

(assert (=> d!115461 (= lt!428980 e!536192)))

(declare-fun c!99583 () Bool)

(assert (=> d!115461 (= c!99583 lt!428981)))

(assert (=> d!115461 (= lt!428981 (containsKey!470 (toList!6153 (+!2868 lt!428882 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141)))) lt!428877))))

(assert (=> d!115461 (= (contains!5246 (+!2868 lt!428882 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141))) lt!428877) lt!428982)))

(declare-fun b!952121 () Bool)

(declare-fun lt!428983 () Unit!32031)

(assert (=> b!952121 (= e!536192 lt!428983)))

(assert (=> b!952121 (= lt!428983 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6153 (+!2868 lt!428882 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141)))) lt!428877))))

(assert (=> b!952121 (isDefined!375 (getValueByKey!503 (toList!6153 (+!2868 lt!428882 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141)))) lt!428877))))

(declare-fun b!952122 () Bool)

(declare-fun Unit!32037 () Unit!32031)

(assert (=> b!952122 (= e!536192 Unit!32037)))

(declare-fun b!952123 () Bool)

(assert (=> b!952123 (= e!536191 (isDefined!375 (getValueByKey!503 (toList!6153 (+!2868 lt!428882 (tuple2!13579 lt!428896 (zeroValue!5648 thiss!1141)))) lt!428877)))))

(assert (= (and d!115461 c!99583) b!952121))

(assert (= (and d!115461 (not c!99583)) b!952122))

(assert (= (and d!115461 (not res!637927)) b!952123))

(declare-fun m!884283 () Bool)

(assert (=> d!115461 m!884283))

(declare-fun m!884285 () Bool)

(assert (=> b!952121 m!884285))

(declare-fun m!884287 () Bool)

(assert (=> b!952121 m!884287))

(assert (=> b!952121 m!884287))

(declare-fun m!884289 () Bool)

(assert (=> b!952121 m!884289))

(assert (=> b!952123 m!884287))

(assert (=> b!952123 m!884287))

(assert (=> b!952123 m!884289))

(assert (=> b!951934 d!115461))

(declare-fun d!115463 () Bool)

(assert (=> d!115463 (= (apply!884 (+!2868 lt!428897 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141))) lt!428884) (get!14557 (getValueByKey!503 (toList!6153 (+!2868 lt!428897 (tuple2!13579 lt!428880 (zeroValue!5648 thiss!1141)))) lt!428884)))))

(declare-fun bs!26749 () Bool)

(assert (= bs!26749 d!115463))

(declare-fun m!884291 () Bool)

(assert (=> bs!26749 m!884291))

(assert (=> bs!26749 m!884291))

(declare-fun m!884293 () Bool)

(assert (=> bs!26749 m!884293))

(assert (=> b!951934 d!115463))

(assert (=> b!951934 d!115409))

(declare-fun d!115465 () Bool)

(assert (=> d!115465 (= (apply!884 lt!428897 lt!428884) (get!14557 (getValueByKey!503 (toList!6153 lt!428897) lt!428884)))))

(declare-fun bs!26750 () Bool)

(assert (= bs!26750 d!115465))

(declare-fun m!884295 () Bool)

(assert (=> bs!26750 m!884295))

(assert (=> bs!26750 m!884295))

(declare-fun m!884297 () Bool)

(assert (=> bs!26750 m!884297))

(assert (=> b!951934 d!115465))

(declare-fun d!115467 () Bool)

(declare-fun e!536193 () Bool)

(assert (=> d!115467 e!536193))

(declare-fun res!637928 () Bool)

(assert (=> d!115467 (=> (not res!637928) (not e!536193))))

(declare-fun lt!428985 () ListLongMap!12275)

(assert (=> d!115467 (= res!637928 (contains!5246 lt!428985 (_1!6800 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141)))))))

(declare-fun lt!428987 () List!19360)

(assert (=> d!115467 (= lt!428985 (ListLongMap!12276 lt!428987))))

(declare-fun lt!428986 () Unit!32031)

(declare-fun lt!428984 () Unit!32031)

(assert (=> d!115467 (= lt!428986 lt!428984)))

(assert (=> d!115467 (= (getValueByKey!503 lt!428987 (_1!6800 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141)))) (Some!508 (_2!6800 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141)))))))

(assert (=> d!115467 (= lt!428984 (lemmaContainsTupThenGetReturnValue!267 lt!428987 (_1!6800 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141))) (_2!6800 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141)))))))

(assert (=> d!115467 (= lt!428987 (insertStrictlySorted!324 (toList!6153 lt!428889) (_1!6800 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141))) (_2!6800 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141)))))))

(assert (=> d!115467 (= (+!2868 lt!428889 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141))) lt!428985)))

(declare-fun b!952124 () Bool)

(declare-fun res!637929 () Bool)

(assert (=> b!952124 (=> (not res!637929) (not e!536193))))

(assert (=> b!952124 (= res!637929 (= (getValueByKey!503 (toList!6153 lt!428985) (_1!6800 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141)))) (Some!508 (_2!6800 (tuple2!13579 lt!428879 (minValue!5648 thiss!1141))))))))

(declare-fun b!952125 () Bool)

(assert (=> b!952125 (= e!536193 (contains!5247 (toList!6153 lt!428985) (tuple2!13579 lt!428879 (minValue!5648 thiss!1141))))))

(assert (= (and d!115467 res!637928) b!952124))

(assert (= (and b!952124 res!637929) b!952125))

(declare-fun m!884299 () Bool)

(assert (=> d!115467 m!884299))

(declare-fun m!884301 () Bool)

(assert (=> d!115467 m!884301))

(declare-fun m!884303 () Bool)

(assert (=> d!115467 m!884303))

(declare-fun m!884305 () Bool)

(assert (=> d!115467 m!884305))

(declare-fun m!884307 () Bool)

(assert (=> b!952124 m!884307))

(declare-fun m!884309 () Bool)

(assert (=> b!952125 m!884309))

(assert (=> b!951934 d!115467))

(declare-fun d!115469 () Bool)

(declare-fun e!536194 () Bool)

(assert (=> d!115469 e!536194))

(declare-fun res!637930 () Bool)

(assert (=> d!115469 (=> (not res!637930) (not e!536194))))

(declare-fun lt!428989 () ListLongMap!12275)

(assert (=> d!115469 (= res!637930 (contains!5246 lt!428989 (_1!6800 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141)))))))

(declare-fun lt!428991 () List!19360)

(assert (=> d!115469 (= lt!428989 (ListLongMap!12276 lt!428991))))

(declare-fun lt!428990 () Unit!32031)

(declare-fun lt!428988 () Unit!32031)

(assert (=> d!115469 (= lt!428990 lt!428988)))

(assert (=> d!115469 (= (getValueByKey!503 lt!428991 (_1!6800 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141)))) (Some!508 (_2!6800 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141)))))))

(assert (=> d!115469 (= lt!428988 (lemmaContainsTupThenGetReturnValue!267 lt!428991 (_1!6800 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141))) (_2!6800 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141)))))))

(assert (=> d!115469 (= lt!428991 (insertStrictlySorted!324 (toList!6153 lt!428895) (_1!6800 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141))) (_2!6800 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141)))))))

(assert (=> d!115469 (= (+!2868 lt!428895 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141))) lt!428989)))

(declare-fun b!952126 () Bool)

(declare-fun res!637931 () Bool)

(assert (=> b!952126 (=> (not res!637931) (not e!536194))))

(assert (=> b!952126 (= res!637931 (= (getValueByKey!503 (toList!6153 lt!428989) (_1!6800 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141)))) (Some!508 (_2!6800 (tuple2!13579 lt!428888 (minValue!5648 thiss!1141))))))))

(declare-fun b!952127 () Bool)

(assert (=> b!952127 (= e!536194 (contains!5247 (toList!6153 lt!428989) (tuple2!13579 lt!428888 (minValue!5648 thiss!1141))))))

(assert (= (and d!115469 res!637930) b!952126))

(assert (= (and b!952126 res!637931) b!952127))

(declare-fun m!884311 () Bool)

(assert (=> d!115469 m!884311))

(declare-fun m!884313 () Bool)

(assert (=> d!115469 m!884313))

(declare-fun m!884315 () Bool)

(assert (=> d!115469 m!884315))

(declare-fun m!884317 () Bool)

(assert (=> d!115469 m!884317))

(declare-fun m!884319 () Bool)

(assert (=> b!952126 m!884319))

(declare-fun m!884321 () Bool)

(assert (=> b!952127 m!884321))

(assert (=> b!951934 d!115469))

(declare-fun b!952128 () Bool)

(declare-fun e!536196 () Bool)

(declare-fun call!41549 () Bool)

(assert (=> b!952128 (= e!536196 call!41549)))

(declare-fun b!952129 () Bool)

(declare-fun e!536195 () Bool)

(assert (=> b!952129 (= e!536195 e!536196)))

(declare-fun lt!428993 () (_ BitVec 64))

(assert (=> b!952129 (= lt!428993 (select (arr!27697 (_keys!10759 thiss!1141)) (bvadd lt!428780 #b00000000000000000000000000000001)))))

(declare-fun lt!428992 () Unit!32031)

(assert (=> b!952129 (= lt!428992 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10759 thiss!1141) lt!428993 (bvadd lt!428780 #b00000000000000000000000000000001)))))

(assert (=> b!952129 (arrayContainsKey!0 (_keys!10759 thiss!1141) lt!428993 #b00000000000000000000000000000000)))

(declare-fun lt!428994 () Unit!32031)

(assert (=> b!952129 (= lt!428994 lt!428992)))

(declare-fun res!637933 () Bool)

(assert (=> b!952129 (= res!637933 (= (seekEntryOrOpen!0 (select (arr!27697 (_keys!10759 thiss!1141)) (bvadd lt!428780 #b00000000000000000000000000000001)) (_keys!10759 thiss!1141) (mask!27643 thiss!1141)) (Found!9157 (bvadd lt!428780 #b00000000000000000000000000000001))))))

(assert (=> b!952129 (=> (not res!637933) (not e!536196))))

(declare-fun bm!41546 () Bool)

(assert (=> bm!41546 (= call!41549 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428780 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))

(declare-fun b!952130 () Bool)

(declare-fun e!536197 () Bool)

(assert (=> b!952130 (= e!536197 e!536195)))

(declare-fun c!99584 () Bool)

(assert (=> b!952130 (= c!99584 (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) (bvadd lt!428780 #b00000000000000000000000000000001))))))

(declare-fun b!952131 () Bool)

(assert (=> b!952131 (= e!536195 call!41549)))

(declare-fun d!115471 () Bool)

(declare-fun res!637932 () Bool)

(assert (=> d!115471 (=> res!637932 e!536197)))

(assert (=> d!115471 (= res!637932 (bvsge (bvadd lt!428780 #b00000000000000000000000000000001) (size!28175 (_keys!10759 thiss!1141))))))

(assert (=> d!115471 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428780 #b00000000000000000000000000000001) (_keys!10759 thiss!1141) (mask!27643 thiss!1141)) e!536197)))

(assert (= (and d!115471 (not res!637932)) b!952130))

(assert (= (and b!952130 c!99584) b!952129))

(assert (= (and b!952130 (not c!99584)) b!952131))

(assert (= (and b!952129 res!637933) b!952128))

(assert (= (or b!952128 b!952131) bm!41546))

(declare-fun m!884323 () Bool)

(assert (=> b!952129 m!884323))

(declare-fun m!884325 () Bool)

(assert (=> b!952129 m!884325))

(declare-fun m!884327 () Bool)

(assert (=> b!952129 m!884327))

(assert (=> b!952129 m!884323))

(declare-fun m!884329 () Bool)

(assert (=> b!952129 m!884329))

(declare-fun m!884331 () Bool)

(assert (=> bm!41546 m!884331))

(assert (=> b!952130 m!884323))

(assert (=> b!952130 m!884323))

(declare-fun m!884333 () Bool)

(assert (=> b!952130 m!884333))

(assert (=> bm!41514 d!115471))

(declare-fun d!115473 () Bool)

(assert (=> d!115473 (arrayContainsKey!0 (_keys!10759 thiss!1141) lt!428810 #b00000000000000000000000000000000)))

(declare-fun lt!428997 () Unit!32031)

(declare-fun choose!13 (array!57606 (_ BitVec 64) (_ BitVec 32)) Unit!32031)

(assert (=> d!115473 (= lt!428997 (choose!13 (_keys!10759 thiss!1141) lt!428810 lt!428780))))

(assert (=> d!115473 (bvsge lt!428780 #b00000000000000000000000000000000)))

(assert (=> d!115473 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10759 thiss!1141) lt!428810 lt!428780) lt!428997)))

(declare-fun bs!26751 () Bool)

(assert (= bs!26751 d!115473))

(assert (=> bs!26751 m!884055))

(declare-fun m!884335 () Bool)

(assert (=> bs!26751 m!884335))

(assert (=> b!951857 d!115473))

(declare-fun d!115475 () Bool)

(declare-fun res!637934 () Bool)

(declare-fun e!536198 () Bool)

(assert (=> d!115475 (=> res!637934 e!536198)))

(assert (=> d!115475 (= res!637934 (= (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000) lt!428810))))

(assert (=> d!115475 (= (arrayContainsKey!0 (_keys!10759 thiss!1141) lt!428810 #b00000000000000000000000000000000) e!536198)))

(declare-fun b!952132 () Bool)

(declare-fun e!536199 () Bool)

(assert (=> b!952132 (= e!536198 e!536199)))

(declare-fun res!637935 () Bool)

(assert (=> b!952132 (=> (not res!637935) (not e!536199))))

(assert (=> b!952132 (= res!637935 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28175 (_keys!10759 thiss!1141))))))

(declare-fun b!952133 () Bool)

(assert (=> b!952133 (= e!536199 (arrayContainsKey!0 (_keys!10759 thiss!1141) lt!428810 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115475 (not res!637934)) b!952132))

(assert (= (and b!952132 res!637935) b!952133))

(assert (=> d!115475 m!884063))

(declare-fun m!884337 () Bool)

(assert (=> b!952133 m!884337))

(assert (=> b!951857 d!115475))

(declare-fun d!115477 () Bool)

(declare-fun lt!429005 () SeekEntryResult!9157)

(assert (=> d!115477 (and (or ((_ is Undefined!9157) lt!429005) (not ((_ is Found!9157) lt!429005)) (and (bvsge (index!39000 lt!429005) #b00000000000000000000000000000000) (bvslt (index!39000 lt!429005) (size!28175 (_keys!10759 thiss!1141))))) (or ((_ is Undefined!9157) lt!429005) ((_ is Found!9157) lt!429005) (not ((_ is MissingZero!9157) lt!429005)) (and (bvsge (index!38999 lt!429005) #b00000000000000000000000000000000) (bvslt (index!38999 lt!429005) (size!28175 (_keys!10759 thiss!1141))))) (or ((_ is Undefined!9157) lt!429005) ((_ is Found!9157) lt!429005) ((_ is MissingZero!9157) lt!429005) (not ((_ is MissingVacant!9157) lt!429005)) (and (bvsge (index!39002 lt!429005) #b00000000000000000000000000000000) (bvslt (index!39002 lt!429005) (size!28175 (_keys!10759 thiss!1141))))) (or ((_ is Undefined!9157) lt!429005) (ite ((_ is Found!9157) lt!429005) (= (select (arr!27697 (_keys!10759 thiss!1141)) (index!39000 lt!429005)) (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780)) (ite ((_ is MissingZero!9157) lt!429005) (= (select (arr!27697 (_keys!10759 thiss!1141)) (index!38999 lt!429005)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9157) lt!429005) (= (select (arr!27697 (_keys!10759 thiss!1141)) (index!39002 lt!429005)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!536206 () SeekEntryResult!9157)

(assert (=> d!115477 (= lt!429005 e!536206)))

(declare-fun c!99593 () Bool)

(declare-fun lt!429006 () SeekEntryResult!9157)

(assert (=> d!115477 (= c!99593 (and ((_ is Intermediate!9157) lt!429006) (undefined!9969 lt!429006)))))

(assert (=> d!115477 (= lt!429006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780) (mask!27643 thiss!1141)) (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780) (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))

(assert (=> d!115477 (validMask!0 (mask!27643 thiss!1141))))

(assert (=> d!115477 (= (seekEntryOrOpen!0 (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780) (_keys!10759 thiss!1141) (mask!27643 thiss!1141)) lt!429005)))

(declare-fun b!952146 () Bool)

(declare-fun e!536207 () SeekEntryResult!9157)

(assert (=> b!952146 (= e!536206 e!536207)))

(declare-fun lt!429004 () (_ BitVec 64))

(assert (=> b!952146 (= lt!429004 (select (arr!27697 (_keys!10759 thiss!1141)) (index!39001 lt!429006)))))

(declare-fun c!99591 () Bool)

(assert (=> b!952146 (= c!99591 (= lt!429004 (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780)))))

(declare-fun b!952147 () Bool)

(assert (=> b!952147 (= e!536206 Undefined!9157)))

(declare-fun b!952148 () Bool)

(declare-fun e!536208 () SeekEntryResult!9157)

(assert (=> b!952148 (= e!536208 (MissingZero!9157 (index!39001 lt!429006)))))

(declare-fun b!952149 () Bool)

(assert (=> b!952149 (= e!536207 (Found!9157 (index!39001 lt!429006)))))

(declare-fun b!952150 () Bool)

(assert (=> b!952150 (= e!536208 (seekKeyOrZeroReturnVacant!0 (x!81891 lt!429006) (index!39001 lt!429006) (index!39001 lt!429006) (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780) (_keys!10759 thiss!1141) (mask!27643 thiss!1141)))))

(declare-fun b!952151 () Bool)

(declare-fun c!99592 () Bool)

(assert (=> b!952151 (= c!99592 (= lt!429004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952151 (= e!536207 e!536208)))

(assert (= (and d!115477 c!99593) b!952147))

(assert (= (and d!115477 (not c!99593)) b!952146))

(assert (= (and b!952146 c!99591) b!952149))

(assert (= (and b!952146 (not c!99591)) b!952151))

(assert (= (and b!952151 c!99592) b!952148))

(assert (= (and b!952151 (not c!99592)) b!952150))

(assert (=> d!115477 m!883987))

(assert (=> d!115477 m!884051))

(declare-fun m!884339 () Bool)

(assert (=> d!115477 m!884339))

(declare-fun m!884341 () Bool)

(assert (=> d!115477 m!884341))

(declare-fun m!884343 () Bool)

(assert (=> d!115477 m!884343))

(declare-fun m!884345 () Bool)

(assert (=> d!115477 m!884345))

(assert (=> d!115477 m!884339))

(assert (=> d!115477 m!884051))

(declare-fun m!884347 () Bool)

(assert (=> d!115477 m!884347))

(declare-fun m!884349 () Bool)

(assert (=> b!952146 m!884349))

(assert (=> b!952150 m!884051))

(declare-fun m!884351 () Bool)

(assert (=> b!952150 m!884351))

(assert (=> b!951857 d!115477))

(declare-fun d!115479 () Bool)

(assert (=> d!115479 (= (validKeyInArray!0 (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780)) (and (not (= (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27697 (_keys!10759 thiss!1141)) lt!428780) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951858 d!115479))

(declare-fun d!115481 () Bool)

(declare-fun e!536209 () Bool)

(assert (=> d!115481 e!536209))

(declare-fun res!637936 () Bool)

(assert (=> d!115481 (=> (not res!637936) (not e!536209))))

(declare-fun lt!429008 () ListLongMap!12275)

(assert (=> d!115481 (= res!637936 (contains!5246 lt!429008 (_1!6800 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))))))

(declare-fun lt!429010 () List!19360)

(assert (=> d!115481 (= lt!429008 (ListLongMap!12276 lt!429010))))

(declare-fun lt!429009 () Unit!32031)

(declare-fun lt!429007 () Unit!32031)

(assert (=> d!115481 (= lt!429009 lt!429007)))

(assert (=> d!115481 (= (getValueByKey!503 lt!429010 (_1!6800 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))) (Some!508 (_2!6800 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))))))

(assert (=> d!115481 (= lt!429007 (lemmaContainsTupThenGetReturnValue!267 lt!429010 (_1!6800 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))) (_2!6800 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))))))

(assert (=> d!115481 (= lt!429010 (insertStrictlySorted!324 (toList!6153 call!41534) (_1!6800 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))) (_2!6800 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))))))

(assert (=> d!115481 (= (+!2868 call!41534 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))) lt!429008)))

(declare-fun b!952152 () Bool)

(declare-fun res!637937 () Bool)

(assert (=> b!952152 (=> (not res!637937) (not e!536209))))

(assert (=> b!952152 (= res!637937 (= (getValueByKey!503 (toList!6153 lt!429008) (_1!6800 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141)))) (Some!508 (_2!6800 (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))))))))

(declare-fun b!952153 () Bool)

(assert (=> b!952153 (= e!536209 (contains!5247 (toList!6153 lt!429008) (tuple2!13579 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5648 thiss!1141))))))

(assert (= (and d!115481 res!637936) b!952152))

(assert (= (and b!952152 res!637937) b!952153))

(declare-fun m!884353 () Bool)

(assert (=> d!115481 m!884353))

(declare-fun m!884355 () Bool)

(assert (=> d!115481 m!884355))

(declare-fun m!884357 () Bool)

(assert (=> d!115481 m!884357))

(declare-fun m!884359 () Bool)

(assert (=> d!115481 m!884359))

(declare-fun m!884361 () Bool)

(assert (=> b!952152 m!884361))

(declare-fun m!884363 () Bool)

(assert (=> b!952153 m!884363))

(assert (=> b!951931 d!115481))

(declare-fun d!115483 () Bool)

(assert (=> d!115483 (= (apply!884 lt!428886 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14557 (getValueByKey!503 (toList!6153 lt!428886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26752 () Bool)

(assert (= bs!26752 d!115483))

(assert (=> bs!26752 m!884215))

(assert (=> bs!26752 m!884215))

(declare-fun m!884365 () Bool)

(assert (=> bs!26752 m!884365))

(assert (=> b!951938 d!115483))

(declare-fun d!115485 () Bool)

(declare-fun lt!429011 () (_ BitVec 32))

(assert (=> d!115485 (and (or (bvslt lt!429011 #b00000000000000000000000000000000) (bvsge lt!429011 (size!28175 (_keys!10759 thiss!1141))) (and (bvsge lt!429011 #b00000000000000000000000000000000) (bvslt lt!429011 (size!28175 (_keys!10759 thiss!1141))))) (bvsge lt!429011 #b00000000000000000000000000000000) (bvslt lt!429011 (size!28175 (_keys!10759 thiss!1141))) (= (select (arr!27697 (_keys!10759 thiss!1141)) lt!429011) key!756))))

(declare-fun e!536210 () (_ BitVec 32))

(assert (=> d!115485 (= lt!429011 e!536210)))

(declare-fun c!99594 () Bool)

(assert (=> d!115485 (= c!99594 (= (select (arr!27697 (_keys!10759 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115485 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28175 (_keys!10759 thiss!1141))) (bvslt (size!28175 (_keys!10759 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115485 (= (arrayScanForKey!0 (_keys!10759 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!429011)))

(declare-fun b!952154 () Bool)

(assert (=> b!952154 (= e!536210 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!952155 () Bool)

(assert (=> b!952155 (= e!536210 (arrayScanForKey!0 (_keys!10759 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115485 c!99594) b!952154))

(assert (= (and d!115485 (not c!99594)) b!952155))

(declare-fun m!884367 () Bool)

(assert (=> d!115485 m!884367))

(assert (=> d!115485 m!884195))

(declare-fun m!884369 () Bool)

(assert (=> b!952155 m!884369))

(assert (=> b!951877 d!115485))

(declare-fun d!115487 () Bool)

(assert (=> d!115487 (= (apply!884 lt!428886 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14557 (getValueByKey!503 (toList!6153 lt!428886) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26753 () Bool)

(assert (= bs!26753 d!115487))

(assert (=> bs!26753 m!884203))

(assert (=> bs!26753 m!884203))

(declare-fun m!884371 () Bool)

(assert (=> bs!26753 m!884371))

(assert (=> b!951935 d!115487))

(declare-fun d!115489 () Bool)

(assert (=> d!115489 (isDefined!375 (getValueByKey!503 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756))))

(declare-fun lt!429014 () Unit!32031)

(declare-fun choose!1596 (List!19360 (_ BitVec 64)) Unit!32031)

(assert (=> d!115489 (= lt!429014 (choose!1596 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756))))

(declare-fun e!536213 () Bool)

(assert (=> d!115489 e!536213))

(declare-fun res!637940 () Bool)

(assert (=> d!115489 (=> (not res!637940) (not e!536213))))

(declare-fun isStrictlySorted!513 (List!19360) Bool)

(assert (=> d!115489 (= res!637940 (isStrictlySorted!513 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))))))

(assert (=> d!115489 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756) lt!429014)))

(declare-fun b!952158 () Bool)

(assert (=> b!952158 (= e!536213 (containsKey!470 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756))))

(assert (= (and d!115489 res!637940) b!952158))

(assert (=> d!115489 m!884079))

(assert (=> d!115489 m!884079))

(assert (=> d!115489 m!884081))

(declare-fun m!884373 () Bool)

(assert (=> d!115489 m!884373))

(declare-fun m!884375 () Bool)

(assert (=> d!115489 m!884375))

(assert (=> b!952158 m!884075))

(assert (=> b!951884 d!115489))

(declare-fun d!115491 () Bool)

(declare-fun isEmpty!715 (Option!509) Bool)

(assert (=> d!115491 (= (isDefined!375 (getValueByKey!503 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756)) (not (isEmpty!715 (getValueByKey!503 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756))))))

(declare-fun bs!26754 () Bool)

(assert (= bs!26754 d!115491))

(assert (=> bs!26754 m!884079))

(declare-fun m!884377 () Bool)

(assert (=> bs!26754 m!884377))

(assert (=> b!951884 d!115491))

(declare-fun b!952168 () Bool)

(declare-fun e!536218 () Option!509)

(declare-fun e!536219 () Option!509)

(assert (=> b!952168 (= e!536218 e!536219)))

(declare-fun c!99600 () Bool)

(assert (=> b!952168 (= c!99600 (and ((_ is Cons!19356) (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))) (not (= (_1!6800 (h!20517 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))))) key!756))))))

(declare-fun d!115493 () Bool)

(declare-fun c!99599 () Bool)

(assert (=> d!115493 (= c!99599 (and ((_ is Cons!19356) (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))) (= (_1!6800 (h!20517 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))))) key!756)))))

(assert (=> d!115493 (= (getValueByKey!503 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141))) key!756) e!536218)))

(declare-fun b!952167 () Bool)

(assert (=> b!952167 (= e!536218 (Some!508 (_2!6800 (h!20517 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))))))))

(declare-fun b!952170 () Bool)

(assert (=> b!952170 (= e!536219 None!507)))

(declare-fun b!952169 () Bool)

(assert (=> b!952169 (= e!536219 (getValueByKey!503 (t!27711 (toList!6153 (getCurrentListMap!3386 (_keys!10759 thiss!1141) (_values!5835 thiss!1141) (mask!27643 thiss!1141) (extraKeys!5544 thiss!1141) (zeroValue!5648 thiss!1141) (minValue!5648 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5812 thiss!1141)))) key!756))))

(assert (= (and d!115493 c!99599) b!952167))

(assert (= (and d!115493 (not c!99599)) b!952168))

(assert (= (and b!952168 c!99600) b!952169))

(assert (= (and b!952168 (not c!99600)) b!952170))

(declare-fun m!884379 () Bool)

(assert (=> b!952169 m!884379))

(assert (=> b!951884 d!115493))

(assert (=> b!951870 d!115395))

(declare-fun d!115495 () Bool)

(assert (=> d!115495 (= (apply!884 lt!428886 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)) (get!14557 (getValueByKey!503 (toList!6153 lt!428886) (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26755 () Bool)

(assert (= bs!26755 d!115495))

(assert (=> bs!26755 m!884063))

(declare-fun m!884381 () Bool)

(assert (=> bs!26755 m!884381))

(assert (=> bs!26755 m!884381))

(declare-fun m!884383 () Bool)

(assert (=> bs!26755 m!884383))

(assert (=> b!951936 d!115495))

(declare-fun d!115497 () Bool)

(declare-fun c!99603 () Bool)

(assert (=> d!115497 (= c!99603 ((_ is ValueCellFull!9912) (select (arr!27696 (_values!5835 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!536222 () V!32681)

(assert (=> d!115497 (= (get!14556 (select (arr!27696 (_values!5835 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1657 (defaultEntry!5812 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!536222)))

(declare-fun b!952175 () Bool)

(declare-fun get!14558 (ValueCell!9912 V!32681) V!32681)

(assert (=> b!952175 (= e!536222 (get!14558 (select (arr!27696 (_values!5835 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1657 (defaultEntry!5812 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!952176 () Bool)

(declare-fun get!14559 (ValueCell!9912 V!32681) V!32681)

(assert (=> b!952176 (= e!536222 (get!14559 (select (arr!27696 (_values!5835 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1657 (defaultEntry!5812 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115497 c!99603) b!952175))

(assert (= (and d!115497 (not c!99603)) b!952176))

(assert (=> b!952175 m!884085))

(assert (=> b!952175 m!884087))

(declare-fun m!884385 () Bool)

(assert (=> b!952175 m!884385))

(assert (=> b!952176 m!884085))

(assert (=> b!952176 m!884087))

(declare-fun m!884387 () Bool)

(assert (=> b!952176 m!884387))

(assert (=> b!951936 d!115497))

(declare-fun d!115499 () Bool)

(declare-fun e!536223 () Bool)

(assert (=> d!115499 e!536223))

(declare-fun res!637941 () Bool)

(assert (=> d!115499 (=> res!637941 e!536223)))

(declare-fun lt!429017 () Bool)

(assert (=> d!115499 (= res!637941 (not lt!429017))))

(declare-fun lt!429016 () Bool)

(assert (=> d!115499 (= lt!429017 lt!429016)))

(declare-fun lt!429015 () Unit!32031)

(declare-fun e!536224 () Unit!32031)

(assert (=> d!115499 (= lt!429015 e!536224)))

(declare-fun c!99604 () Bool)

(assert (=> d!115499 (= c!99604 lt!429016)))

(assert (=> d!115499 (= lt!429016 (containsKey!470 (toList!6153 lt!428886) (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115499 (= (contains!5246 lt!428886 (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)) lt!429017)))

(declare-fun b!952177 () Bool)

(declare-fun lt!429018 () Unit!32031)

(assert (=> b!952177 (= e!536224 lt!429018)))

(assert (=> b!952177 (= lt!429018 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6153 lt!428886) (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952177 (isDefined!375 (getValueByKey!503 (toList!6153 lt!428886) (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952178 () Bool)

(declare-fun Unit!32038 () Unit!32031)

(assert (=> b!952178 (= e!536224 Unit!32038)))

(declare-fun b!952179 () Bool)

(assert (=> b!952179 (= e!536223 (isDefined!375 (getValueByKey!503 (toList!6153 lt!428886) (select (arr!27697 (_keys!10759 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115499 c!99604) b!952177))

(assert (= (and d!115499 (not c!99604)) b!952178))

(assert (= (and d!115499 (not res!637941)) b!952179))

(assert (=> d!115499 m!884063))

(declare-fun m!884389 () Bool)

(assert (=> d!115499 m!884389))

(assert (=> b!952177 m!884063))

(declare-fun m!884391 () Bool)

(assert (=> b!952177 m!884391))

(assert (=> b!952177 m!884063))

(assert (=> b!952177 m!884381))

(assert (=> b!952177 m!884381))

(declare-fun m!884393 () Bool)

(assert (=> b!952177 m!884393))

(assert (=> b!952179 m!884063))

(assert (=> b!952179 m!884381))

(assert (=> b!952179 m!884381))

(assert (=> b!952179 m!884393))

(assert (=> b!951937 d!115499))

(assert (=> b!951886 d!115491))

(assert (=> b!951886 d!115493))

(declare-fun b!952180 () Bool)

(declare-fun e!536225 () Bool)

(assert (=> b!952180 (= e!536225 tp_is_empty!20787)))

(declare-fun mapIsEmpty!33118 () Bool)

(declare-fun mapRes!33118 () Bool)

(assert (=> mapIsEmpty!33118 mapRes!33118))

(declare-fun condMapEmpty!33118 () Bool)

(declare-fun mapDefault!33118 () ValueCell!9912)

(assert (=> mapNonEmpty!33117 (= condMapEmpty!33118 (= mapRest!33117 ((as const (Array (_ BitVec 32) ValueCell!9912)) mapDefault!33118)))))

(declare-fun e!536226 () Bool)

(assert (=> mapNonEmpty!33117 (= tp!63461 (and e!536226 mapRes!33118))))

(declare-fun mapNonEmpty!33118 () Bool)

(declare-fun tp!63462 () Bool)

(assert (=> mapNonEmpty!33118 (= mapRes!33118 (and tp!63462 e!536225))))

(declare-fun mapRest!33118 () (Array (_ BitVec 32) ValueCell!9912))

(declare-fun mapKey!33118 () (_ BitVec 32))

(declare-fun mapValue!33118 () ValueCell!9912)

(assert (=> mapNonEmpty!33118 (= mapRest!33117 (store mapRest!33118 mapKey!33118 mapValue!33118))))

(declare-fun b!952181 () Bool)

(assert (=> b!952181 (= e!536226 tp_is_empty!20787)))

(assert (= (and mapNonEmpty!33117 condMapEmpty!33118) mapIsEmpty!33118))

(assert (= (and mapNonEmpty!33117 (not condMapEmpty!33118)) mapNonEmpty!33118))

(assert (= (and mapNonEmpty!33118 ((_ is ValueCellFull!9912) mapValue!33118)) b!952180))

(assert (= (and mapNonEmpty!33117 ((_ is ValueCellFull!9912) mapDefault!33118)) b!952181))

(declare-fun m!884395 () Bool)

(assert (=> mapNonEmpty!33118 m!884395))

(declare-fun b_lambda!14407 () Bool)

(assert (= b_lambda!14405 (or (and b!951787 b_free!18279) b_lambda!14407)))

(declare-fun b_lambda!14409 () Bool)

(assert (= b_lambda!14403 (or (and b!951787 b_free!18279) b_lambda!14409)))

(check-sat (not b_lambda!14409) (not b!952175) (not d!115457) (not b!952024) (not b!952127) (not b_lambda!14407) (not d!115447) (not b!952177) (not b!951988) (not b!951994) (not d!115423) (not d!115495) (not b!951987) (not bm!41538) (not d!115443) (not d!115463) (not b!952150) (not b!952110) (not d!115499) (not d!115451) (not b!952158) (not b!952118) (not d!115409) (not d!115487) (not d!115431) (not d!115441) (not d!115419) (not b!952085) (not b!952023) b_and!29759 (not d!115445) (not d!115415) (not d!115481) (not d!115491) (not d!115477) (not b!952179) (not b!951989) (not d!115489) (not b!952119) (not b!952013) (not b!951985) (not mapNonEmpty!33118) (not b!952155) (not bm!41541) (not b!952064) (not b!952111) (not bm!41545) (not b!952028) (not b!952034) (not b!952125) (not b!951990) (not d!115473) (not d!115453) (not b!952056) (not bm!41542) (not b!952005) (not b!952133) (not b!952121) (not b!952130) (not d!115465) (not d!115455) (not b!952126) (not b!952027) (not d!115459) (not b!952124) (not b!952035) (not b!952082) (not d!115461) (not b!952065) (not b!952176) (not b!951984) (not d!115439) (not b_next!18279) (not b!952123) (not b!952079) (not d!115467) (not b!952152) (not b!951992) (not b_lambda!14401) (not d!115469) (not b!952104) (not d!115435) tp_is_empty!20787 (not b!952067) (not b!952083) (not b!952169) (not d!115421) (not b!952129) (not b!952153) (not bm!41546) (not b!952090) (not d!115483) (not b!952078) (not d!115449))
(check-sat b_and!29759 (not b_next!18279))
