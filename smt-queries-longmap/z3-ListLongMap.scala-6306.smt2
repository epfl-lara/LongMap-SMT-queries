; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80750 () Bool)

(assert start!80750)

(declare-fun b!946779 () Bool)

(declare-fun b_free!18157 () Bool)

(declare-fun b_next!18157 () Bool)

(assert (=> b!946779 (= b_free!18157 (not b_next!18157))))

(declare-fun tp!63025 () Bool)

(declare-fun b_and!29553 () Bool)

(assert (=> b!946779 (= tp!63025 b_and!29553)))

(declare-fun b!946771 () Bool)

(declare-fun e!532798 () Bool)

(declare-fun e!532793 () Bool)

(assert (=> b!946771 (= e!532798 e!532793)))

(declare-fun res!635509 () Bool)

(assert (=> b!946771 (=> (not res!635509) (not e!532793))))

(declare-datatypes ((SeekEntryResult!9108 0))(
  ( (MissingZero!9108 (index!38803 (_ BitVec 32))) (Found!9108 (index!38804 (_ BitVec 32))) (Intermediate!9108 (undefined!9920 Bool) (index!38805 (_ BitVec 32)) (x!81455 (_ BitVec 32))) (Undefined!9108) (MissingVacant!9108 (index!38806 (_ BitVec 32))) )
))
(declare-fun lt!426226 () SeekEntryResult!9108)

(get-info :version)

(assert (=> b!946771 (= res!635509 ((_ is Found!9108) lt!426226))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32519 0))(
  ( (V!32520 (val!10383 Int)) )
))
(declare-datatypes ((ValueCell!9851 0))(
  ( (ValueCellFull!9851 (v!12916 V!32519)) (EmptyCell!9851) )
))
(declare-datatypes ((array!57287 0))(
  ( (array!57288 (arr!27557 (Array (_ BitVec 32) ValueCell!9851)) (size!28032 (_ BitVec 32))) )
))
(declare-datatypes ((array!57289 0))(
  ( (array!57290 (arr!27558 (Array (_ BitVec 32) (_ BitVec 64))) (size!28033 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4852 0))(
  ( (LongMapFixedSize!4853 (defaultEntry!5723 Int) (mask!27441 (_ BitVec 32)) (extraKeys!5455 (_ BitVec 32)) (zeroValue!5559 V!32519) (minValue!5559 V!32519) (_size!2481 (_ BitVec 32)) (_keys!10623 array!57289) (_values!5746 array!57287) (_vacant!2481 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4852)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57289 (_ BitVec 32)) SeekEntryResult!9108)

(assert (=> b!946771 (= lt!426226 (seekEntry!0 key!756 (_keys!10623 thiss!1141) (mask!27441 thiss!1141)))))

(declare-fun b!946772 () Bool)

(declare-fun e!532794 () Bool)

(assert (=> b!946772 (= e!532793 (not e!532794))))

(declare-fun res!635506 () Bool)

(assert (=> b!946772 (=> res!635506 e!532794)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946772 (= res!635506 (not (validMask!0 (mask!27441 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946772 (arrayContainsKey!0 (_keys!10623 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31800 0))(
  ( (Unit!31801) )
))
(declare-fun lt!426225 () Unit!31800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57289 (_ BitVec 64) (_ BitVec 32)) Unit!31800)

(assert (=> b!946772 (= lt!426225 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10623 thiss!1141) key!756 (index!38804 lt!426226)))))

(declare-fun b!946773 () Bool)

(declare-fun e!532795 () Bool)

(declare-fun e!532792 () Bool)

(declare-fun mapRes!32866 () Bool)

(assert (=> b!946773 (= e!532795 (and e!532792 mapRes!32866))))

(declare-fun condMapEmpty!32866 () Bool)

(declare-fun mapDefault!32866 () ValueCell!9851)

(assert (=> b!946773 (= condMapEmpty!32866 (= (arr!27557 (_values!5746 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9851)) mapDefault!32866)))))

(declare-fun b!946774 () Bool)

(declare-fun res!635510 () Bool)

(assert (=> b!946774 (=> res!635510 e!532794)))

(assert (=> b!946774 (= res!635510 (or (not (= (size!28032 (_values!5746 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27441 thiss!1141)))) (not (= (size!28033 (_keys!10623 thiss!1141)) (size!28032 (_values!5746 thiss!1141)))) (bvslt (mask!27441 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5455 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5455 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!32866 () Bool)

(declare-fun tp!63024 () Bool)

(declare-fun e!532796 () Bool)

(assert (=> mapNonEmpty!32866 (= mapRes!32866 (and tp!63024 e!532796))))

(declare-fun mapRest!32866 () (Array (_ BitVec 32) ValueCell!9851))

(declare-fun mapKey!32866 () (_ BitVec 32))

(declare-fun mapValue!32866 () ValueCell!9851)

(assert (=> mapNonEmpty!32866 (= (arr!27557 (_values!5746 thiss!1141)) (store mapRest!32866 mapKey!32866 mapValue!32866))))

(declare-fun b!946775 () Bool)

(declare-fun res!635507 () Bool)

(assert (=> b!946775 (=> (not res!635507) (not e!532798))))

(assert (=> b!946775 (= res!635507 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!635508 () Bool)

(assert (=> start!80750 (=> (not res!635508) (not e!532798))))

(declare-fun valid!1854 (LongMapFixedSize!4852) Bool)

(assert (=> start!80750 (= res!635508 (valid!1854 thiss!1141))))

(assert (=> start!80750 e!532798))

(declare-fun e!532797 () Bool)

(assert (=> start!80750 e!532797))

(assert (=> start!80750 true))

(declare-fun b!946776 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57289 (_ BitVec 32)) Bool)

(assert (=> b!946776 (= e!532794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10623 thiss!1141) (mask!27441 thiss!1141)))))

(declare-fun b!946777 () Bool)

(declare-fun tp_is_empty!20665 () Bool)

(assert (=> b!946777 (= e!532792 tp_is_empty!20665)))

(declare-fun b!946778 () Bool)

(assert (=> b!946778 (= e!532796 tp_is_empty!20665)))

(declare-fun array_inv!21454 (array!57289) Bool)

(declare-fun array_inv!21455 (array!57287) Bool)

(assert (=> b!946779 (= e!532797 (and tp!63025 tp_is_empty!20665 (array_inv!21454 (_keys!10623 thiss!1141)) (array_inv!21455 (_values!5746 thiss!1141)) e!532795))))

(declare-fun mapIsEmpty!32866 () Bool)

(assert (=> mapIsEmpty!32866 mapRes!32866))

(assert (= (and start!80750 res!635508) b!946775))

(assert (= (and b!946775 res!635507) b!946771))

(assert (= (and b!946771 res!635509) b!946772))

(assert (= (and b!946772 (not res!635506)) b!946774))

(assert (= (and b!946774 (not res!635510)) b!946776))

(assert (= (and b!946773 condMapEmpty!32866) mapIsEmpty!32866))

(assert (= (and b!946773 (not condMapEmpty!32866)) mapNonEmpty!32866))

(assert (= (and mapNonEmpty!32866 ((_ is ValueCellFull!9851) mapValue!32866)) b!946778))

(assert (= (and b!946773 ((_ is ValueCellFull!9851) mapDefault!32866)) b!946777))

(assert (= b!946779 b!946773))

(assert (= start!80750 b!946779))

(declare-fun m!879369 () Bool)

(assert (=> b!946772 m!879369))

(declare-fun m!879371 () Bool)

(assert (=> b!946772 m!879371))

(declare-fun m!879373 () Bool)

(assert (=> b!946772 m!879373))

(declare-fun m!879375 () Bool)

(assert (=> b!946779 m!879375))

(declare-fun m!879377 () Bool)

(assert (=> b!946779 m!879377))

(declare-fun m!879379 () Bool)

(assert (=> b!946771 m!879379))

(declare-fun m!879381 () Bool)

(assert (=> b!946776 m!879381))

(declare-fun m!879383 () Bool)

(assert (=> start!80750 m!879383))

(declare-fun m!879385 () Bool)

(assert (=> mapNonEmpty!32866 m!879385))

(check-sat tp_is_empty!20665 (not b_next!18157) (not b!946779) (not b!946776) (not b!946771) (not b!946772) b_and!29553 (not mapNonEmpty!32866) (not start!80750))
(check-sat b_and!29553 (not b_next!18157))
(get-model)

(declare-fun d!114433 () Bool)

(declare-fun res!635547 () Bool)

(declare-fun e!532849 () Bool)

(assert (=> d!114433 (=> (not res!635547) (not e!532849))))

(declare-fun simpleValid!361 (LongMapFixedSize!4852) Bool)

(assert (=> d!114433 (= res!635547 (simpleValid!361 thiss!1141))))

(assert (=> d!114433 (= (valid!1854 thiss!1141) e!532849)))

(declare-fun b!946840 () Bool)

(declare-fun res!635548 () Bool)

(assert (=> b!946840 (=> (not res!635548) (not e!532849))))

(declare-fun arrayCountValidKeys!0 (array!57289 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946840 (= res!635548 (= (arrayCountValidKeys!0 (_keys!10623 thiss!1141) #b00000000000000000000000000000000 (size!28033 (_keys!10623 thiss!1141))) (_size!2481 thiss!1141)))))

(declare-fun b!946841 () Bool)

(declare-fun res!635549 () Bool)

(assert (=> b!946841 (=> (not res!635549) (not e!532849))))

(assert (=> b!946841 (= res!635549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10623 thiss!1141) (mask!27441 thiss!1141)))))

(declare-fun b!946842 () Bool)

(declare-datatypes ((List!19306 0))(
  ( (Nil!19303) (Cons!19302 (h!20458 (_ BitVec 64)) (t!27618 List!19306)) )
))
(declare-fun arrayNoDuplicates!0 (array!57289 (_ BitVec 32) List!19306) Bool)

(assert (=> b!946842 (= e!532849 (arrayNoDuplicates!0 (_keys!10623 thiss!1141) #b00000000000000000000000000000000 Nil!19303))))

(assert (= (and d!114433 res!635547) b!946840))

(assert (= (and b!946840 res!635548) b!946841))

(assert (= (and b!946841 res!635549) b!946842))

(declare-fun m!879423 () Bool)

(assert (=> d!114433 m!879423))

(declare-fun m!879425 () Bool)

(assert (=> b!946840 m!879425))

(assert (=> b!946841 m!879381))

(declare-fun m!879427 () Bool)

(assert (=> b!946842 m!879427))

(assert (=> start!80750 d!114433))

(declare-fun d!114435 () Bool)

(assert (=> d!114435 (= (validMask!0 (mask!27441 thiss!1141)) (and (or (= (mask!27441 thiss!1141) #b00000000000000000000000000000111) (= (mask!27441 thiss!1141) #b00000000000000000000000000001111) (= (mask!27441 thiss!1141) #b00000000000000000000000000011111) (= (mask!27441 thiss!1141) #b00000000000000000000000000111111) (= (mask!27441 thiss!1141) #b00000000000000000000000001111111) (= (mask!27441 thiss!1141) #b00000000000000000000000011111111) (= (mask!27441 thiss!1141) #b00000000000000000000000111111111) (= (mask!27441 thiss!1141) #b00000000000000000000001111111111) (= (mask!27441 thiss!1141) #b00000000000000000000011111111111) (= (mask!27441 thiss!1141) #b00000000000000000000111111111111) (= (mask!27441 thiss!1141) #b00000000000000000001111111111111) (= (mask!27441 thiss!1141) #b00000000000000000011111111111111) (= (mask!27441 thiss!1141) #b00000000000000000111111111111111) (= (mask!27441 thiss!1141) #b00000000000000001111111111111111) (= (mask!27441 thiss!1141) #b00000000000000011111111111111111) (= (mask!27441 thiss!1141) #b00000000000000111111111111111111) (= (mask!27441 thiss!1141) #b00000000000001111111111111111111) (= (mask!27441 thiss!1141) #b00000000000011111111111111111111) (= (mask!27441 thiss!1141) #b00000000000111111111111111111111) (= (mask!27441 thiss!1141) #b00000000001111111111111111111111) (= (mask!27441 thiss!1141) #b00000000011111111111111111111111) (= (mask!27441 thiss!1141) #b00000000111111111111111111111111) (= (mask!27441 thiss!1141) #b00000001111111111111111111111111) (= (mask!27441 thiss!1141) #b00000011111111111111111111111111) (= (mask!27441 thiss!1141) #b00000111111111111111111111111111) (= (mask!27441 thiss!1141) #b00001111111111111111111111111111) (= (mask!27441 thiss!1141) #b00011111111111111111111111111111) (= (mask!27441 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27441 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946772 d!114435))

(declare-fun d!114437 () Bool)

(declare-fun res!635554 () Bool)

(declare-fun e!532854 () Bool)

(assert (=> d!114437 (=> res!635554 e!532854)))

(assert (=> d!114437 (= res!635554 (= (select (arr!27558 (_keys!10623 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114437 (= (arrayContainsKey!0 (_keys!10623 thiss!1141) key!756 #b00000000000000000000000000000000) e!532854)))

(declare-fun b!946847 () Bool)

(declare-fun e!532855 () Bool)

(assert (=> b!946847 (= e!532854 e!532855)))

(declare-fun res!635555 () Bool)

(assert (=> b!946847 (=> (not res!635555) (not e!532855))))

(assert (=> b!946847 (= res!635555 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28033 (_keys!10623 thiss!1141))))))

(declare-fun b!946848 () Bool)

(assert (=> b!946848 (= e!532855 (arrayContainsKey!0 (_keys!10623 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114437 (not res!635554)) b!946847))

(assert (= (and b!946847 res!635555) b!946848))

(declare-fun m!879429 () Bool)

(assert (=> d!114437 m!879429))

(declare-fun m!879431 () Bool)

(assert (=> b!946848 m!879431))

(assert (=> b!946772 d!114437))

(declare-fun d!114439 () Bool)

(assert (=> d!114439 (arrayContainsKey!0 (_keys!10623 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426241 () Unit!31800)

(declare-fun choose!13 (array!57289 (_ BitVec 64) (_ BitVec 32)) Unit!31800)

(assert (=> d!114439 (= lt!426241 (choose!13 (_keys!10623 thiss!1141) key!756 (index!38804 lt!426226)))))

(assert (=> d!114439 (bvsge (index!38804 lt!426226) #b00000000000000000000000000000000)))

(assert (=> d!114439 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10623 thiss!1141) key!756 (index!38804 lt!426226)) lt!426241)))

(declare-fun bs!26587 () Bool)

(assert (= bs!26587 d!114439))

(assert (=> bs!26587 m!879371))

(declare-fun m!879433 () Bool)

(assert (=> bs!26587 m!879433))

(assert (=> b!946772 d!114439))

(declare-fun b!946857 () Bool)

(declare-fun e!532864 () Bool)

(declare-fun call!41080 () Bool)

(assert (=> b!946857 (= e!532864 call!41080)))

(declare-fun b!946858 () Bool)

(declare-fun e!532863 () Bool)

(assert (=> b!946858 (= e!532863 e!532864)))

(declare-fun c!98598 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946858 (= c!98598 (validKeyInArray!0 (select (arr!27558 (_keys!10623 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41077 () Bool)

(assert (=> bm!41077 (= call!41080 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10623 thiss!1141) (mask!27441 thiss!1141)))))

(declare-fun d!114441 () Bool)

(declare-fun res!635560 () Bool)

(assert (=> d!114441 (=> res!635560 e!532863)))

(assert (=> d!114441 (= res!635560 (bvsge #b00000000000000000000000000000000 (size!28033 (_keys!10623 thiss!1141))))))

(assert (=> d!114441 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10623 thiss!1141) (mask!27441 thiss!1141)) e!532863)))

(declare-fun b!946859 () Bool)

(declare-fun e!532862 () Bool)

(assert (=> b!946859 (= e!532862 call!41080)))

(declare-fun b!946860 () Bool)

(assert (=> b!946860 (= e!532864 e!532862)))

(declare-fun lt!426248 () (_ BitVec 64))

(assert (=> b!946860 (= lt!426248 (select (arr!27558 (_keys!10623 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426250 () Unit!31800)

(assert (=> b!946860 (= lt!426250 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10623 thiss!1141) lt!426248 #b00000000000000000000000000000000))))

(assert (=> b!946860 (arrayContainsKey!0 (_keys!10623 thiss!1141) lt!426248 #b00000000000000000000000000000000)))

(declare-fun lt!426249 () Unit!31800)

(assert (=> b!946860 (= lt!426249 lt!426250)))

(declare-fun res!635561 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57289 (_ BitVec 32)) SeekEntryResult!9108)

(assert (=> b!946860 (= res!635561 (= (seekEntryOrOpen!0 (select (arr!27558 (_keys!10623 thiss!1141)) #b00000000000000000000000000000000) (_keys!10623 thiss!1141) (mask!27441 thiss!1141)) (Found!9108 #b00000000000000000000000000000000)))))

(assert (=> b!946860 (=> (not res!635561) (not e!532862))))

(assert (= (and d!114441 (not res!635560)) b!946858))

(assert (= (and b!946858 c!98598) b!946860))

(assert (= (and b!946858 (not c!98598)) b!946857))

(assert (= (and b!946860 res!635561) b!946859))

(assert (= (or b!946859 b!946857) bm!41077))

(assert (=> b!946858 m!879429))

(assert (=> b!946858 m!879429))

(declare-fun m!879435 () Bool)

(assert (=> b!946858 m!879435))

(declare-fun m!879437 () Bool)

(assert (=> bm!41077 m!879437))

(assert (=> b!946860 m!879429))

(declare-fun m!879439 () Bool)

(assert (=> b!946860 m!879439))

(declare-fun m!879441 () Bool)

(assert (=> b!946860 m!879441))

(assert (=> b!946860 m!879429))

(declare-fun m!879443 () Bool)

(assert (=> b!946860 m!879443))

(assert (=> b!946776 d!114441))

(declare-fun b!946873 () Bool)

(declare-fun e!532872 () SeekEntryResult!9108)

(declare-fun lt!426261 () SeekEntryResult!9108)

(assert (=> b!946873 (= e!532872 (Found!9108 (index!38805 lt!426261)))))

(declare-fun b!946874 () Bool)

(declare-fun e!532871 () SeekEntryResult!9108)

(assert (=> b!946874 (= e!532871 e!532872)))

(declare-fun lt!426262 () (_ BitVec 64))

(assert (=> b!946874 (= lt!426262 (select (arr!27558 (_keys!10623 thiss!1141)) (index!38805 lt!426261)))))

(declare-fun c!98607 () Bool)

(assert (=> b!946874 (= c!98607 (= lt!426262 key!756))))

(declare-fun b!946875 () Bool)

(assert (=> b!946875 (= e!532871 Undefined!9108)))

(declare-fun b!946877 () Bool)

(declare-fun e!532873 () SeekEntryResult!9108)

(declare-fun lt!426259 () SeekEntryResult!9108)

(assert (=> b!946877 (= e!532873 (ite ((_ is MissingVacant!9108) lt!426259) (MissingZero!9108 (index!38806 lt!426259)) lt!426259))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57289 (_ BitVec 32)) SeekEntryResult!9108)

(assert (=> b!946877 (= lt!426259 (seekKeyOrZeroReturnVacant!0 (x!81455 lt!426261) (index!38805 lt!426261) (index!38805 lt!426261) key!756 (_keys!10623 thiss!1141) (mask!27441 thiss!1141)))))

(declare-fun b!946878 () Bool)

(declare-fun c!98606 () Bool)

(assert (=> b!946878 (= c!98606 (= lt!426262 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946878 (= e!532872 e!532873)))

(declare-fun d!114443 () Bool)

(declare-fun lt!426260 () SeekEntryResult!9108)

(assert (=> d!114443 (and (or ((_ is MissingVacant!9108) lt!426260) (not ((_ is Found!9108) lt!426260)) (and (bvsge (index!38804 lt!426260) #b00000000000000000000000000000000) (bvslt (index!38804 lt!426260) (size!28033 (_keys!10623 thiss!1141))))) (not ((_ is MissingVacant!9108) lt!426260)) (or (not ((_ is Found!9108) lt!426260)) (= (select (arr!27558 (_keys!10623 thiss!1141)) (index!38804 lt!426260)) key!756)))))

(assert (=> d!114443 (= lt!426260 e!532871)))

(declare-fun c!98605 () Bool)

(assert (=> d!114443 (= c!98605 (and ((_ is Intermediate!9108) lt!426261) (undefined!9920 lt!426261)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57289 (_ BitVec 32)) SeekEntryResult!9108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114443 (= lt!426261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27441 thiss!1141)) key!756 (_keys!10623 thiss!1141) (mask!27441 thiss!1141)))))

(assert (=> d!114443 (validMask!0 (mask!27441 thiss!1141))))

(assert (=> d!114443 (= (seekEntry!0 key!756 (_keys!10623 thiss!1141) (mask!27441 thiss!1141)) lt!426260)))

(declare-fun b!946876 () Bool)

(assert (=> b!946876 (= e!532873 (MissingZero!9108 (index!38805 lt!426261)))))

(assert (= (and d!114443 c!98605) b!946875))

(assert (= (and d!114443 (not c!98605)) b!946874))

(assert (= (and b!946874 c!98607) b!946873))

(assert (= (and b!946874 (not c!98607)) b!946878))

(assert (= (and b!946878 c!98606) b!946876))

(assert (= (and b!946878 (not c!98606)) b!946877))

(declare-fun m!879445 () Bool)

(assert (=> b!946874 m!879445))

(declare-fun m!879447 () Bool)

(assert (=> b!946877 m!879447))

(declare-fun m!879449 () Bool)

(assert (=> d!114443 m!879449))

(declare-fun m!879451 () Bool)

(assert (=> d!114443 m!879451))

(assert (=> d!114443 m!879451))

(declare-fun m!879453 () Bool)

(assert (=> d!114443 m!879453))

(assert (=> d!114443 m!879369))

(assert (=> b!946771 d!114443))

(declare-fun d!114445 () Bool)

(assert (=> d!114445 (= (array_inv!21454 (_keys!10623 thiss!1141)) (bvsge (size!28033 (_keys!10623 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946779 d!114445))

(declare-fun d!114447 () Bool)

(assert (=> d!114447 (= (array_inv!21455 (_values!5746 thiss!1141)) (bvsge (size!28032 (_values!5746 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946779 d!114447))

(declare-fun condMapEmpty!32875 () Bool)

(declare-fun mapDefault!32875 () ValueCell!9851)

(assert (=> mapNonEmpty!32866 (= condMapEmpty!32875 (= mapRest!32866 ((as const (Array (_ BitVec 32) ValueCell!9851)) mapDefault!32875)))))

(declare-fun e!532878 () Bool)

(declare-fun mapRes!32875 () Bool)

(assert (=> mapNonEmpty!32866 (= tp!63024 (and e!532878 mapRes!32875))))

(declare-fun b!946886 () Bool)

(assert (=> b!946886 (= e!532878 tp_is_empty!20665)))

(declare-fun mapIsEmpty!32875 () Bool)

(assert (=> mapIsEmpty!32875 mapRes!32875))

(declare-fun mapNonEmpty!32875 () Bool)

(declare-fun tp!63040 () Bool)

(declare-fun e!532879 () Bool)

(assert (=> mapNonEmpty!32875 (= mapRes!32875 (and tp!63040 e!532879))))

(declare-fun mapValue!32875 () ValueCell!9851)

(declare-fun mapRest!32875 () (Array (_ BitVec 32) ValueCell!9851))

(declare-fun mapKey!32875 () (_ BitVec 32))

(assert (=> mapNonEmpty!32875 (= mapRest!32866 (store mapRest!32875 mapKey!32875 mapValue!32875))))

(declare-fun b!946885 () Bool)

(assert (=> b!946885 (= e!532879 tp_is_empty!20665)))

(assert (= (and mapNonEmpty!32866 condMapEmpty!32875) mapIsEmpty!32875))

(assert (= (and mapNonEmpty!32866 (not condMapEmpty!32875)) mapNonEmpty!32875))

(assert (= (and mapNonEmpty!32875 ((_ is ValueCellFull!9851) mapValue!32875)) b!946885))

(assert (= (and mapNonEmpty!32866 ((_ is ValueCellFull!9851) mapDefault!32875)) b!946886))

(declare-fun m!879455 () Bool)

(assert (=> mapNonEmpty!32875 m!879455))

(check-sat tp_is_empty!20665 (not b_next!18157) (not b!946877) (not mapNonEmpty!32875) (not b!946848) (not d!114433) b_and!29553 (not b!946860) (not d!114443) (not b!946841) (not b!946842) (not d!114439) (not bm!41077) (not b!946840) (not b!946858))
(check-sat b_and!29553 (not b_next!18157))
