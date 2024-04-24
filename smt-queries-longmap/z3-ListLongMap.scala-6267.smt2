; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80304 () Bool)

(assert start!80304)

(declare-fun b!942657 () Bool)

(declare-fun b_free!17923 () Bool)

(declare-fun b_next!17923 () Bool)

(assert (=> b!942657 (= b_free!17923 (not b_next!17923))))

(declare-fun tp!62259 () Bool)

(declare-fun b_and!29345 () Bool)

(assert (=> b!942657 (= tp!62259 b_and!29345)))

(declare-fun res!633346 () Bool)

(declare-fun e!530047 () Bool)

(assert (=> start!80304 (=> (not res!633346) (not e!530047))))

(declare-datatypes ((V!32207 0))(
  ( (V!32208 (val!10266 Int)) )
))
(declare-datatypes ((ValueCell!9734 0))(
  ( (ValueCellFull!9734 (v!12794 V!32207)) (EmptyCell!9734) )
))
(declare-datatypes ((array!56869 0))(
  ( (array!56870 (arr!27361 (Array (_ BitVec 32) ValueCell!9734)) (size!27825 (_ BitVec 32))) )
))
(declare-datatypes ((array!56871 0))(
  ( (array!56872 (arr!27362 (Array (_ BitVec 32) (_ BitVec 64))) (size!27826 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4618 0))(
  ( (LongMapFixedSize!4619 (defaultEntry!5600 Int) (mask!27224 (_ BitVec 32)) (extraKeys!5332 (_ BitVec 32)) (zeroValue!5436 V!32207) (minValue!5436 V!32207) (_size!2364 (_ BitVec 32)) (_keys!10488 array!56871) (_values!5623 array!56869) (_vacant!2364 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4618)

(declare-fun valid!1774 (LongMapFixedSize!4618) Bool)

(assert (=> start!80304 (= res!633346 (valid!1774 thiss!1141))))

(assert (=> start!80304 e!530047))

(declare-fun e!530051 () Bool)

(assert (=> start!80304 e!530051))

(assert (=> start!80304 true))

(declare-fun mapNonEmpty!32451 () Bool)

(declare-fun mapRes!32451 () Bool)

(declare-fun tp!62258 () Bool)

(declare-fun e!530046 () Bool)

(assert (=> mapNonEmpty!32451 (= mapRes!32451 (and tp!62258 e!530046))))

(declare-fun mapRest!32451 () (Array (_ BitVec 32) ValueCell!9734))

(declare-fun mapValue!32451 () ValueCell!9734)

(declare-fun mapKey!32451 () (_ BitVec 32))

(assert (=> mapNonEmpty!32451 (= (arr!27361 (_values!5623 thiss!1141)) (store mapRest!32451 mapKey!32451 mapValue!32451))))

(declare-fun b!942653 () Bool)

(declare-fun res!633345 () Bool)

(assert (=> b!942653 (=> (not res!633345) (not e!530047))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8980 0))(
  ( (MissingZero!8980 (index!38291 (_ BitVec 32))) (Found!8980 (index!38292 (_ BitVec 32))) (Intermediate!8980 (undefined!9792 Bool) (index!38293 (_ BitVec 32)) (x!80801 (_ BitVec 32))) (Undefined!8980) (MissingVacant!8980 (index!38294 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56871 (_ BitVec 32)) SeekEntryResult!8980)

(assert (=> b!942653 (= res!633345 (not ((_ is Found!8980) (seekEntry!0 key!756 (_keys!10488 thiss!1141) (mask!27224 thiss!1141)))))))

(declare-fun mapIsEmpty!32451 () Bool)

(assert (=> mapIsEmpty!32451 mapRes!32451))

(declare-fun b!942654 () Bool)

(declare-fun res!633347 () Bool)

(assert (=> b!942654 (=> (not res!633347) (not e!530047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942654 (= res!633347 (validMask!0 (mask!27224 thiss!1141)))))

(declare-fun b!942655 () Bool)

(declare-fun e!530049 () Bool)

(declare-fun tp_is_empty!20431 () Bool)

(assert (=> b!942655 (= e!530049 tp_is_empty!20431)))

(declare-fun b!942656 () Bool)

(assert (=> b!942656 (= e!530046 tp_is_empty!20431)))

(declare-fun e!530050 () Bool)

(declare-fun array_inv!21352 (array!56871) Bool)

(declare-fun array_inv!21353 (array!56869) Bool)

(assert (=> b!942657 (= e!530051 (and tp!62259 tp_is_empty!20431 (array_inv!21352 (_keys!10488 thiss!1141)) (array_inv!21353 (_values!5623 thiss!1141)) e!530050))))

(declare-fun b!942658 () Bool)

(assert (=> b!942658 (= e!530047 (and (= (size!27825 (_values!5623 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27224 thiss!1141))) (= (size!27826 (_keys!10488 thiss!1141)) (size!27825 (_values!5623 thiss!1141))) (bvsge (mask!27224 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5332 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!942659 () Bool)

(declare-fun res!633344 () Bool)

(assert (=> b!942659 (=> (not res!633344) (not e!530047))))

(assert (=> b!942659 (= res!633344 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942660 () Bool)

(assert (=> b!942660 (= e!530050 (and e!530049 mapRes!32451))))

(declare-fun condMapEmpty!32451 () Bool)

(declare-fun mapDefault!32451 () ValueCell!9734)

(assert (=> b!942660 (= condMapEmpty!32451 (= (arr!27361 (_values!5623 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9734)) mapDefault!32451)))))

(assert (= (and start!80304 res!633346) b!942659))

(assert (= (and b!942659 res!633344) b!942653))

(assert (= (and b!942653 res!633345) b!942654))

(assert (= (and b!942654 res!633347) b!942658))

(assert (= (and b!942660 condMapEmpty!32451) mapIsEmpty!32451))

(assert (= (and b!942660 (not condMapEmpty!32451)) mapNonEmpty!32451))

(assert (= (and mapNonEmpty!32451 ((_ is ValueCellFull!9734) mapValue!32451)) b!942656))

(assert (= (and b!942660 ((_ is ValueCellFull!9734) mapDefault!32451)) b!942655))

(assert (= b!942657 b!942660))

(assert (= start!80304 b!942657))

(declare-fun m!877973 () Bool)

(assert (=> mapNonEmpty!32451 m!877973))

(declare-fun m!877975 () Bool)

(assert (=> b!942653 m!877975))

(declare-fun m!877977 () Bool)

(assert (=> start!80304 m!877977))

(declare-fun m!877979 () Bool)

(assert (=> b!942654 m!877979))

(declare-fun m!877981 () Bool)

(assert (=> b!942657 m!877981))

(declare-fun m!877983 () Bool)

(assert (=> b!942657 m!877983))

(check-sat tp_is_empty!20431 b_and!29345 (not b!942654) (not mapNonEmpty!32451) (not b_next!17923) (not b!942657) (not b!942653) (not start!80304))
(check-sat b_and!29345 (not b_next!17923))
(get-model)

(declare-fun d!114429 () Bool)

(assert (=> d!114429 (= (validMask!0 (mask!27224 thiss!1141)) (and (or (= (mask!27224 thiss!1141) #b00000000000000000000000000000111) (= (mask!27224 thiss!1141) #b00000000000000000000000000001111) (= (mask!27224 thiss!1141) #b00000000000000000000000000011111) (= (mask!27224 thiss!1141) #b00000000000000000000000000111111) (= (mask!27224 thiss!1141) #b00000000000000000000000001111111) (= (mask!27224 thiss!1141) #b00000000000000000000000011111111) (= (mask!27224 thiss!1141) #b00000000000000000000000111111111) (= (mask!27224 thiss!1141) #b00000000000000000000001111111111) (= (mask!27224 thiss!1141) #b00000000000000000000011111111111) (= (mask!27224 thiss!1141) #b00000000000000000000111111111111) (= (mask!27224 thiss!1141) #b00000000000000000001111111111111) (= (mask!27224 thiss!1141) #b00000000000000000011111111111111) (= (mask!27224 thiss!1141) #b00000000000000000111111111111111) (= (mask!27224 thiss!1141) #b00000000000000001111111111111111) (= (mask!27224 thiss!1141) #b00000000000000011111111111111111) (= (mask!27224 thiss!1141) #b00000000000000111111111111111111) (= (mask!27224 thiss!1141) #b00000000000001111111111111111111) (= (mask!27224 thiss!1141) #b00000000000011111111111111111111) (= (mask!27224 thiss!1141) #b00000000000111111111111111111111) (= (mask!27224 thiss!1141) #b00000000001111111111111111111111) (= (mask!27224 thiss!1141) #b00000000011111111111111111111111) (= (mask!27224 thiss!1141) #b00000000111111111111111111111111) (= (mask!27224 thiss!1141) #b00000001111111111111111111111111) (= (mask!27224 thiss!1141) #b00000011111111111111111111111111) (= (mask!27224 thiss!1141) #b00000111111111111111111111111111) (= (mask!27224 thiss!1141) #b00001111111111111111111111111111) (= (mask!27224 thiss!1141) #b00011111111111111111111111111111) (= (mask!27224 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27224 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942654 d!114429))

(declare-fun d!114431 () Bool)

(declare-fun res!633378 () Bool)

(declare-fun e!530090 () Bool)

(assert (=> d!114431 (=> (not res!633378) (not e!530090))))

(declare-fun simpleValid!343 (LongMapFixedSize!4618) Bool)

(assert (=> d!114431 (= res!633378 (simpleValid!343 thiss!1141))))

(assert (=> d!114431 (= (valid!1774 thiss!1141) e!530090)))

(declare-fun b!942715 () Bool)

(declare-fun res!633379 () Bool)

(assert (=> b!942715 (=> (not res!633379) (not e!530090))))

(declare-fun arrayCountValidKeys!0 (array!56871 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942715 (= res!633379 (= (arrayCountValidKeys!0 (_keys!10488 thiss!1141) #b00000000000000000000000000000000 (size!27826 (_keys!10488 thiss!1141))) (_size!2364 thiss!1141)))))

(declare-fun b!942716 () Bool)

(declare-fun res!633380 () Bool)

(assert (=> b!942716 (=> (not res!633380) (not e!530090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56871 (_ BitVec 32)) Bool)

(assert (=> b!942716 (= res!633380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10488 thiss!1141) (mask!27224 thiss!1141)))))

(declare-fun b!942717 () Bool)

(declare-datatypes ((List!19194 0))(
  ( (Nil!19191) (Cons!19190 (h!20344 (_ BitVec 64)) (t!27501 List!19194)) )
))
(declare-fun arrayNoDuplicates!0 (array!56871 (_ BitVec 32) List!19194) Bool)

(assert (=> b!942717 (= e!530090 (arrayNoDuplicates!0 (_keys!10488 thiss!1141) #b00000000000000000000000000000000 Nil!19191))))

(assert (= (and d!114431 res!633378) b!942715))

(assert (= (and b!942715 res!633379) b!942716))

(assert (= (and b!942716 res!633380) b!942717))

(declare-fun m!878009 () Bool)

(assert (=> d!114431 m!878009))

(declare-fun m!878011 () Bool)

(assert (=> b!942715 m!878011))

(declare-fun m!878013 () Bool)

(assert (=> b!942716 m!878013))

(declare-fun m!878015 () Bool)

(assert (=> b!942717 m!878015))

(assert (=> start!80304 d!114431))

(declare-fun d!114433 () Bool)

(assert (=> d!114433 (= (array_inv!21352 (_keys!10488 thiss!1141)) (bvsge (size!27826 (_keys!10488 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942657 d!114433))

(declare-fun d!114435 () Bool)

(assert (=> d!114435 (= (array_inv!21353 (_values!5623 thiss!1141)) (bvsge (size!27825 (_values!5623 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942657 d!114435))

(declare-fun b!942730 () Bool)

(declare-fun e!530097 () SeekEntryResult!8980)

(assert (=> b!942730 (= e!530097 Undefined!8980)))

(declare-fun b!942731 () Bool)

(declare-fun c!98412 () Bool)

(declare-fun lt!425402 () (_ BitVec 64))

(assert (=> b!942731 (= c!98412 (= lt!425402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!530099 () SeekEntryResult!8980)

(declare-fun e!530098 () SeekEntryResult!8980)

(assert (=> b!942731 (= e!530099 e!530098)))

(declare-fun d!114437 () Bool)

(declare-fun lt!425400 () SeekEntryResult!8980)

(assert (=> d!114437 (and (or ((_ is MissingVacant!8980) lt!425400) (not ((_ is Found!8980) lt!425400)) (and (bvsge (index!38292 lt!425400) #b00000000000000000000000000000000) (bvslt (index!38292 lt!425400) (size!27826 (_keys!10488 thiss!1141))))) (not ((_ is MissingVacant!8980) lt!425400)) (or (not ((_ is Found!8980) lt!425400)) (= (select (arr!27362 (_keys!10488 thiss!1141)) (index!38292 lt!425400)) key!756)))))

(assert (=> d!114437 (= lt!425400 e!530097)))

(declare-fun c!98413 () Bool)

(declare-fun lt!425399 () SeekEntryResult!8980)

(assert (=> d!114437 (= c!98413 (and ((_ is Intermediate!8980) lt!425399) (undefined!9792 lt!425399)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56871 (_ BitVec 32)) SeekEntryResult!8980)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114437 (= lt!425399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27224 thiss!1141)) key!756 (_keys!10488 thiss!1141) (mask!27224 thiss!1141)))))

(assert (=> d!114437 (validMask!0 (mask!27224 thiss!1141))))

(assert (=> d!114437 (= (seekEntry!0 key!756 (_keys!10488 thiss!1141) (mask!27224 thiss!1141)) lt!425400)))

(declare-fun b!942732 () Bool)

(assert (=> b!942732 (= e!530099 (Found!8980 (index!38293 lt!425399)))))

(declare-fun b!942733 () Bool)

(assert (=> b!942733 (= e!530098 (MissingZero!8980 (index!38293 lt!425399)))))

(declare-fun b!942734 () Bool)

(declare-fun lt!425401 () SeekEntryResult!8980)

(assert (=> b!942734 (= e!530098 (ite ((_ is MissingVacant!8980) lt!425401) (MissingZero!8980 (index!38294 lt!425401)) lt!425401))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56871 (_ BitVec 32)) SeekEntryResult!8980)

(assert (=> b!942734 (= lt!425401 (seekKeyOrZeroReturnVacant!0 (x!80801 lt!425399) (index!38293 lt!425399) (index!38293 lt!425399) key!756 (_keys!10488 thiss!1141) (mask!27224 thiss!1141)))))

(declare-fun b!942735 () Bool)

(assert (=> b!942735 (= e!530097 e!530099)))

(assert (=> b!942735 (= lt!425402 (select (arr!27362 (_keys!10488 thiss!1141)) (index!38293 lt!425399)))))

(declare-fun c!98411 () Bool)

(assert (=> b!942735 (= c!98411 (= lt!425402 key!756))))

(assert (= (and d!114437 c!98413) b!942730))

(assert (= (and d!114437 (not c!98413)) b!942735))

(assert (= (and b!942735 c!98411) b!942732))

(assert (= (and b!942735 (not c!98411)) b!942731))

(assert (= (and b!942731 c!98412) b!942733))

(assert (= (and b!942731 (not c!98412)) b!942734))

(declare-fun m!878017 () Bool)

(assert (=> d!114437 m!878017))

(declare-fun m!878019 () Bool)

(assert (=> d!114437 m!878019))

(assert (=> d!114437 m!878019))

(declare-fun m!878021 () Bool)

(assert (=> d!114437 m!878021))

(assert (=> d!114437 m!877979))

(declare-fun m!878023 () Bool)

(assert (=> b!942734 m!878023))

(declare-fun m!878025 () Bool)

(assert (=> b!942735 m!878025))

(assert (=> b!942653 d!114437))

(declare-fun condMapEmpty!32460 () Bool)

(declare-fun mapDefault!32460 () ValueCell!9734)

(assert (=> mapNonEmpty!32451 (= condMapEmpty!32460 (= mapRest!32451 ((as const (Array (_ BitVec 32) ValueCell!9734)) mapDefault!32460)))))

(declare-fun e!530105 () Bool)

(declare-fun mapRes!32460 () Bool)

(assert (=> mapNonEmpty!32451 (= tp!62258 (and e!530105 mapRes!32460))))

(declare-fun mapIsEmpty!32460 () Bool)

(assert (=> mapIsEmpty!32460 mapRes!32460))

(declare-fun b!942742 () Bool)

(declare-fun e!530104 () Bool)

(assert (=> b!942742 (= e!530104 tp_is_empty!20431)))

(declare-fun b!942743 () Bool)

(assert (=> b!942743 (= e!530105 tp_is_empty!20431)))

(declare-fun mapNonEmpty!32460 () Bool)

(declare-fun tp!62274 () Bool)

(assert (=> mapNonEmpty!32460 (= mapRes!32460 (and tp!62274 e!530104))))

(declare-fun mapKey!32460 () (_ BitVec 32))

(declare-fun mapValue!32460 () ValueCell!9734)

(declare-fun mapRest!32460 () (Array (_ BitVec 32) ValueCell!9734))

(assert (=> mapNonEmpty!32460 (= mapRest!32451 (store mapRest!32460 mapKey!32460 mapValue!32460))))

(assert (= (and mapNonEmpty!32451 condMapEmpty!32460) mapIsEmpty!32460))

(assert (= (and mapNonEmpty!32451 (not condMapEmpty!32460)) mapNonEmpty!32460))

(assert (= (and mapNonEmpty!32460 ((_ is ValueCellFull!9734) mapValue!32460)) b!942742))

(assert (= (and mapNonEmpty!32451 ((_ is ValueCellFull!9734) mapDefault!32460)) b!942743))

(declare-fun m!878027 () Bool)

(assert (=> mapNonEmpty!32460 m!878027))

(check-sat (not b!942717) tp_is_empty!20431 (not b!942715) b_and!29345 (not mapNonEmpty!32460) (not d!114437) (not b!942734) (not d!114431) (not b!942716) (not b_next!17923))
(check-sat b_and!29345 (not b_next!17923))
(get-model)

(declare-fun b!942755 () Bool)

(declare-fun e!530108 () Bool)

(assert (=> b!942755 (= e!530108 (and (bvsge (extraKeys!5332 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5332 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2364 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!114439 () Bool)

(declare-fun res!633391 () Bool)

(assert (=> d!114439 (=> (not res!633391) (not e!530108))))

(assert (=> d!114439 (= res!633391 (validMask!0 (mask!27224 thiss!1141)))))

(assert (=> d!114439 (= (simpleValid!343 thiss!1141) e!530108)))

(declare-fun b!942752 () Bool)

(declare-fun res!633390 () Bool)

(assert (=> b!942752 (=> (not res!633390) (not e!530108))))

(assert (=> b!942752 (= res!633390 (and (= (size!27825 (_values!5623 thiss!1141)) (bvadd (mask!27224 thiss!1141) #b00000000000000000000000000000001)) (= (size!27826 (_keys!10488 thiss!1141)) (size!27825 (_values!5623 thiss!1141))) (bvsge (_size!2364 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2364 thiss!1141) (bvadd (mask!27224 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!942753 () Bool)

(declare-fun res!633392 () Bool)

(assert (=> b!942753 (=> (not res!633392) (not e!530108))))

(declare-fun size!27831 (LongMapFixedSize!4618) (_ BitVec 32))

(assert (=> b!942753 (= res!633392 (bvsge (size!27831 thiss!1141) (_size!2364 thiss!1141)))))

(declare-fun b!942754 () Bool)

(declare-fun res!633389 () Bool)

(assert (=> b!942754 (=> (not res!633389) (not e!530108))))

(assert (=> b!942754 (= res!633389 (= (size!27831 thiss!1141) (bvadd (_size!2364 thiss!1141) (bvsdiv (bvadd (extraKeys!5332 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!114439 res!633391) b!942752))

(assert (= (and b!942752 res!633390) b!942753))

(assert (= (and b!942753 res!633392) b!942754))

(assert (= (and b!942754 res!633389) b!942755))

(assert (=> d!114439 m!877979))

(declare-fun m!878029 () Bool)

(assert (=> b!942753 m!878029))

(assert (=> b!942754 m!878029))

(assert (=> d!114431 d!114439))

(declare-fun b!942768 () Bool)

(declare-fun e!530117 () SeekEntryResult!8980)

(declare-fun e!530116 () SeekEntryResult!8980)

(assert (=> b!942768 (= e!530117 e!530116)))

(declare-fun c!98422 () Bool)

(declare-fun lt!425407 () (_ BitVec 64))

(assert (=> b!942768 (= c!98422 (= lt!425407 key!756))))

(declare-fun b!942769 () Bool)

(declare-fun e!530115 () SeekEntryResult!8980)

(assert (=> b!942769 (= e!530115 (MissingVacant!8980 (index!38293 lt!425399)))))

(declare-fun b!942770 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942770 (= e!530115 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80801 lt!425399) #b00000000000000000000000000000001) (nextIndex!0 (index!38293 lt!425399) (bvadd (x!80801 lt!425399) #b00000000000000000000000000000001) (mask!27224 thiss!1141)) (index!38293 lt!425399) key!756 (_keys!10488 thiss!1141) (mask!27224 thiss!1141)))))

(declare-fun b!942771 () Bool)

(declare-fun c!98421 () Bool)

(assert (=> b!942771 (= c!98421 (= lt!425407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942771 (= e!530116 e!530115)))

(declare-fun b!942772 () Bool)

(assert (=> b!942772 (= e!530116 (Found!8980 (index!38293 lt!425399)))))

(declare-fun b!942773 () Bool)

(assert (=> b!942773 (= e!530117 Undefined!8980)))

(declare-fun lt!425408 () SeekEntryResult!8980)

(declare-fun d!114441 () Bool)

(assert (=> d!114441 (and (or ((_ is Undefined!8980) lt!425408) (not ((_ is Found!8980) lt!425408)) (and (bvsge (index!38292 lt!425408) #b00000000000000000000000000000000) (bvslt (index!38292 lt!425408) (size!27826 (_keys!10488 thiss!1141))))) (or ((_ is Undefined!8980) lt!425408) ((_ is Found!8980) lt!425408) (not ((_ is MissingVacant!8980) lt!425408)) (not (= (index!38294 lt!425408) (index!38293 lt!425399))) (and (bvsge (index!38294 lt!425408) #b00000000000000000000000000000000) (bvslt (index!38294 lt!425408) (size!27826 (_keys!10488 thiss!1141))))) (or ((_ is Undefined!8980) lt!425408) (ite ((_ is Found!8980) lt!425408) (= (select (arr!27362 (_keys!10488 thiss!1141)) (index!38292 lt!425408)) key!756) (and ((_ is MissingVacant!8980) lt!425408) (= (index!38294 lt!425408) (index!38293 lt!425399)) (= (select (arr!27362 (_keys!10488 thiss!1141)) (index!38294 lt!425408)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114441 (= lt!425408 e!530117)))

(declare-fun c!98420 () Bool)

(assert (=> d!114441 (= c!98420 (bvsge (x!80801 lt!425399) #b01111111111111111111111111111110))))

(assert (=> d!114441 (= lt!425407 (select (arr!27362 (_keys!10488 thiss!1141)) (index!38293 lt!425399)))))

(assert (=> d!114441 (validMask!0 (mask!27224 thiss!1141))))

(assert (=> d!114441 (= (seekKeyOrZeroReturnVacant!0 (x!80801 lt!425399) (index!38293 lt!425399) (index!38293 lt!425399) key!756 (_keys!10488 thiss!1141) (mask!27224 thiss!1141)) lt!425408)))

(assert (= (and d!114441 c!98420) b!942773))

(assert (= (and d!114441 (not c!98420)) b!942768))

(assert (= (and b!942768 c!98422) b!942772))

(assert (= (and b!942768 (not c!98422)) b!942771))

(assert (= (and b!942771 c!98421) b!942769))

(assert (= (and b!942771 (not c!98421)) b!942770))

(declare-fun m!878031 () Bool)

(assert (=> b!942770 m!878031))

(assert (=> b!942770 m!878031))

(declare-fun m!878033 () Bool)

(assert (=> b!942770 m!878033))

(declare-fun m!878035 () Bool)

(assert (=> d!114441 m!878035))

(declare-fun m!878037 () Bool)

(assert (=> d!114441 m!878037))

(assert (=> d!114441 m!878025))

(assert (=> d!114441 m!877979))

(assert (=> b!942734 d!114441))

(declare-fun b!942792 () Bool)

(declare-fun lt!425413 () SeekEntryResult!8980)

(assert (=> b!942792 (and (bvsge (index!38293 lt!425413) #b00000000000000000000000000000000) (bvslt (index!38293 lt!425413) (size!27826 (_keys!10488 thiss!1141))))))

(declare-fun res!633400 () Bool)

(assert (=> b!942792 (= res!633400 (= (select (arr!27362 (_keys!10488 thiss!1141)) (index!38293 lt!425413)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!530130 () Bool)

(assert (=> b!942792 (=> res!633400 e!530130)))

(declare-fun b!942793 () Bool)

(assert (=> b!942793 (and (bvsge (index!38293 lt!425413) #b00000000000000000000000000000000) (bvslt (index!38293 lt!425413) (size!27826 (_keys!10488 thiss!1141))))))

(declare-fun res!633401 () Bool)

(assert (=> b!942793 (= res!633401 (= (select (arr!27362 (_keys!10488 thiss!1141)) (index!38293 lt!425413)) key!756))))

(assert (=> b!942793 (=> res!633401 e!530130)))

(declare-fun e!530129 () Bool)

(assert (=> b!942793 (= e!530129 e!530130)))

(declare-fun b!942794 () Bool)

(assert (=> b!942794 (and (bvsge (index!38293 lt!425413) #b00000000000000000000000000000000) (bvslt (index!38293 lt!425413) (size!27826 (_keys!10488 thiss!1141))))))

(assert (=> b!942794 (= e!530130 (= (select (arr!27362 (_keys!10488 thiss!1141)) (index!38293 lt!425413)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!942795 () Bool)

(declare-fun e!530132 () SeekEntryResult!8980)

(assert (=> b!942795 (= e!530132 (Intermediate!8980 true (toIndex!0 key!756 (mask!27224 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!942796 () Bool)

(declare-fun e!530128 () Bool)

(assert (=> b!942796 (= e!530128 e!530129)))

(declare-fun res!633399 () Bool)

(assert (=> b!942796 (= res!633399 (and ((_ is Intermediate!8980) lt!425413) (not (undefined!9792 lt!425413)) (bvslt (x!80801 lt!425413) #b01111111111111111111111111111110) (bvsge (x!80801 lt!425413) #b00000000000000000000000000000000) (bvsge (x!80801 lt!425413) #b00000000000000000000000000000000)))))

(assert (=> b!942796 (=> (not res!633399) (not e!530129))))

(declare-fun b!942797 () Bool)

(declare-fun e!530131 () SeekEntryResult!8980)

(assert (=> b!942797 (= e!530131 (Intermediate!8980 false (toIndex!0 key!756 (mask!27224 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!942798 () Bool)

(assert (=> b!942798 (= e!530128 (bvsge (x!80801 lt!425413) #b01111111111111111111111111111110))))

(declare-fun b!942799 () Bool)

(assert (=> b!942799 (= e!530132 e!530131)))

(declare-fun c!98429 () Bool)

(declare-fun lt!425414 () (_ BitVec 64))

(assert (=> b!942799 (= c!98429 (or (= lt!425414 key!756) (= (bvadd lt!425414 lt!425414) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!114443 () Bool)

(assert (=> d!114443 e!530128))

(declare-fun c!98430 () Bool)

(assert (=> d!114443 (= c!98430 (and ((_ is Intermediate!8980) lt!425413) (undefined!9792 lt!425413)))))

(assert (=> d!114443 (= lt!425413 e!530132)))

(declare-fun c!98431 () Bool)

(assert (=> d!114443 (= c!98431 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114443 (= lt!425414 (select (arr!27362 (_keys!10488 thiss!1141)) (toIndex!0 key!756 (mask!27224 thiss!1141))))))

(assert (=> d!114443 (validMask!0 (mask!27224 thiss!1141))))

(assert (=> d!114443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27224 thiss!1141)) key!756 (_keys!10488 thiss!1141) (mask!27224 thiss!1141)) lt!425413)))

(declare-fun b!942800 () Bool)

(assert (=> b!942800 (= e!530131 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27224 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27224 thiss!1141)) key!756 (_keys!10488 thiss!1141) (mask!27224 thiss!1141)))))

(assert (= (and d!114443 c!98431) b!942795))

(assert (= (and d!114443 (not c!98431)) b!942799))

(assert (= (and b!942799 c!98429) b!942797))

(assert (= (and b!942799 (not c!98429)) b!942800))

(assert (= (and d!114443 c!98430) b!942798))

(assert (= (and d!114443 (not c!98430)) b!942796))

(assert (= (and b!942796 res!633399) b!942793))

(assert (= (and b!942793 (not res!633401)) b!942792))

(assert (= (and b!942792 (not res!633400)) b!942794))

(declare-fun m!878039 () Bool)

(assert (=> b!942793 m!878039))

(assert (=> b!942794 m!878039))

(assert (=> b!942792 m!878039))

(assert (=> b!942800 m!878019))

(declare-fun m!878041 () Bool)

(assert (=> b!942800 m!878041))

(assert (=> b!942800 m!878041))

(declare-fun m!878043 () Bool)

(assert (=> b!942800 m!878043))

(assert (=> d!114443 m!878019))

(declare-fun m!878045 () Bool)

(assert (=> d!114443 m!878045))

(assert (=> d!114443 m!877979))

(assert (=> d!114437 d!114443))

(declare-fun d!114445 () Bool)

(declare-fun lt!425420 () (_ BitVec 32))

(declare-fun lt!425419 () (_ BitVec 32))

(assert (=> d!114445 (= lt!425420 (bvmul (bvxor lt!425419 (bvlshr lt!425419 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114445 (= lt!425419 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114445 (and (bvsge (mask!27224 thiss!1141) #b00000000000000000000000000000000) (let ((res!633402 (let ((h!20345 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80819 (bvmul (bvxor h!20345 (bvlshr h!20345 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80819 (bvlshr x!80819 #b00000000000000000000000000001101)) (mask!27224 thiss!1141)))))) (and (bvslt res!633402 (bvadd (mask!27224 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!633402 #b00000000000000000000000000000000))))))

(assert (=> d!114445 (= (toIndex!0 key!756 (mask!27224 thiss!1141)) (bvand (bvxor lt!425420 (bvlshr lt!425420 #b00000000000000000000000000001101)) (mask!27224 thiss!1141)))))

(assert (=> d!114437 d!114445))

(assert (=> d!114437 d!114429))

(declare-fun bm!40977 () Bool)

(declare-fun call!40980 () (_ BitVec 32))

(assert (=> bm!40977 (= call!40980 (arrayCountValidKeys!0 (_keys!10488 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27826 (_keys!10488 thiss!1141))))))

(declare-fun d!114447 () Bool)

(declare-fun lt!425423 () (_ BitVec 32))

(assert (=> d!114447 (and (bvsge lt!425423 #b00000000000000000000000000000000) (bvsle lt!425423 (bvsub (size!27826 (_keys!10488 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!530138 () (_ BitVec 32))

(assert (=> d!114447 (= lt!425423 e!530138)))

(declare-fun c!98437 () Bool)

(assert (=> d!114447 (= c!98437 (bvsge #b00000000000000000000000000000000 (size!27826 (_keys!10488 thiss!1141))))))

(assert (=> d!114447 (and (bvsle #b00000000000000000000000000000000 (size!27826 (_keys!10488 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27826 (_keys!10488 thiss!1141)) (size!27826 (_keys!10488 thiss!1141))))))

(assert (=> d!114447 (= (arrayCountValidKeys!0 (_keys!10488 thiss!1141) #b00000000000000000000000000000000 (size!27826 (_keys!10488 thiss!1141))) lt!425423)))

(declare-fun b!942809 () Bool)

(declare-fun e!530137 () (_ BitVec 32))

(assert (=> b!942809 (= e!530137 call!40980)))

(declare-fun b!942810 () Bool)

(assert (=> b!942810 (= e!530138 e!530137)))

(declare-fun c!98436 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942810 (= c!98436 (validKeyInArray!0 (select (arr!27362 (_keys!10488 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942811 () Bool)

(assert (=> b!942811 (= e!530138 #b00000000000000000000000000000000)))

(declare-fun b!942812 () Bool)

(assert (=> b!942812 (= e!530137 (bvadd #b00000000000000000000000000000001 call!40980))))

(assert (= (and d!114447 c!98437) b!942811))

(assert (= (and d!114447 (not c!98437)) b!942810))

(assert (= (and b!942810 c!98436) b!942812))

(assert (= (and b!942810 (not c!98436)) b!942809))

(assert (= (or b!942812 b!942809) bm!40977))

(declare-fun m!878047 () Bool)

(assert (=> bm!40977 m!878047))

(declare-fun m!878049 () Bool)

(assert (=> b!942810 m!878049))

(assert (=> b!942810 m!878049))

(declare-fun m!878051 () Bool)

(assert (=> b!942810 m!878051))

(assert (=> b!942715 d!114447))

(declare-fun b!942823 () Bool)

(declare-fun e!530148 () Bool)

(declare-fun e!530150 () Bool)

(assert (=> b!942823 (= e!530148 e!530150)))

(declare-fun c!98440 () Bool)

(assert (=> b!942823 (= c!98440 (validKeyInArray!0 (select (arr!27362 (_keys!10488 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942824 () Bool)

(declare-fun call!40983 () Bool)

(assert (=> b!942824 (= e!530150 call!40983)))

(declare-fun d!114449 () Bool)

(declare-fun res!633411 () Bool)

(declare-fun e!530149 () Bool)

(assert (=> d!114449 (=> res!633411 e!530149)))

(assert (=> d!114449 (= res!633411 (bvsge #b00000000000000000000000000000000 (size!27826 (_keys!10488 thiss!1141))))))

(assert (=> d!114449 (= (arrayNoDuplicates!0 (_keys!10488 thiss!1141) #b00000000000000000000000000000000 Nil!19191) e!530149)))

(declare-fun b!942825 () Bool)

(assert (=> b!942825 (= e!530149 e!530148)))

(declare-fun res!633410 () Bool)

(assert (=> b!942825 (=> (not res!633410) (not e!530148))))

(declare-fun e!530147 () Bool)

(assert (=> b!942825 (= res!633410 (not e!530147))))

(declare-fun res!633409 () Bool)

(assert (=> b!942825 (=> (not res!633409) (not e!530147))))

(assert (=> b!942825 (= res!633409 (validKeyInArray!0 (select (arr!27362 (_keys!10488 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942826 () Bool)

(assert (=> b!942826 (= e!530150 call!40983)))

(declare-fun b!942827 () Bool)

(declare-fun contains!5137 (List!19194 (_ BitVec 64)) Bool)

(assert (=> b!942827 (= e!530147 (contains!5137 Nil!19191 (select (arr!27362 (_keys!10488 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40980 () Bool)

(assert (=> bm!40980 (= call!40983 (arrayNoDuplicates!0 (_keys!10488 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98440 (Cons!19190 (select (arr!27362 (_keys!10488 thiss!1141)) #b00000000000000000000000000000000) Nil!19191) Nil!19191)))))

(assert (= (and d!114449 (not res!633411)) b!942825))

(assert (= (and b!942825 res!633409) b!942827))

(assert (= (and b!942825 res!633410) b!942823))

(assert (= (and b!942823 c!98440) b!942824))

(assert (= (and b!942823 (not c!98440)) b!942826))

(assert (= (or b!942824 b!942826) bm!40980))

(assert (=> b!942823 m!878049))

(assert (=> b!942823 m!878049))

(assert (=> b!942823 m!878051))

(assert (=> b!942825 m!878049))

(assert (=> b!942825 m!878049))

(assert (=> b!942825 m!878051))

(assert (=> b!942827 m!878049))

(assert (=> b!942827 m!878049))

(declare-fun m!878053 () Bool)

(assert (=> b!942827 m!878053))

(assert (=> bm!40980 m!878049))

(declare-fun m!878055 () Bool)

(assert (=> bm!40980 m!878055))

(assert (=> b!942717 d!114449))

(declare-fun b!942836 () Bool)

(declare-fun e!530159 () Bool)

(declare-fun e!530158 () Bool)

(assert (=> b!942836 (= e!530159 e!530158)))

(declare-fun lt!425430 () (_ BitVec 64))

(assert (=> b!942836 (= lt!425430 (select (arr!27362 (_keys!10488 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31778 0))(
  ( (Unit!31779) )
))
(declare-fun lt!425432 () Unit!31778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56871 (_ BitVec 64) (_ BitVec 32)) Unit!31778)

(assert (=> b!942836 (= lt!425432 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10488 thiss!1141) lt!425430 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942836 (arrayContainsKey!0 (_keys!10488 thiss!1141) lt!425430 #b00000000000000000000000000000000)))

(declare-fun lt!425431 () Unit!31778)

(assert (=> b!942836 (= lt!425431 lt!425432)))

(declare-fun res!633417 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56871 (_ BitVec 32)) SeekEntryResult!8980)

(assert (=> b!942836 (= res!633417 (= (seekEntryOrOpen!0 (select (arr!27362 (_keys!10488 thiss!1141)) #b00000000000000000000000000000000) (_keys!10488 thiss!1141) (mask!27224 thiss!1141)) (Found!8980 #b00000000000000000000000000000000)))))

(assert (=> b!942836 (=> (not res!633417) (not e!530158))))

(declare-fun bm!40983 () Bool)

(declare-fun call!40986 () Bool)

(assert (=> bm!40983 (= call!40986 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10488 thiss!1141) (mask!27224 thiss!1141)))))

(declare-fun b!942837 () Bool)

(assert (=> b!942837 (= e!530159 call!40986)))

(declare-fun b!942838 () Bool)

(assert (=> b!942838 (= e!530158 call!40986)))

(declare-fun b!942839 () Bool)

(declare-fun e!530157 () Bool)

(assert (=> b!942839 (= e!530157 e!530159)))

(declare-fun c!98443 () Bool)

(assert (=> b!942839 (= c!98443 (validKeyInArray!0 (select (arr!27362 (_keys!10488 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114451 () Bool)

(declare-fun res!633416 () Bool)

(assert (=> d!114451 (=> res!633416 e!530157)))

(assert (=> d!114451 (= res!633416 (bvsge #b00000000000000000000000000000000 (size!27826 (_keys!10488 thiss!1141))))))

(assert (=> d!114451 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10488 thiss!1141) (mask!27224 thiss!1141)) e!530157)))

(assert (= (and d!114451 (not res!633416)) b!942839))

(assert (= (and b!942839 c!98443) b!942836))

(assert (= (and b!942839 (not c!98443)) b!942837))

(assert (= (and b!942836 res!633417) b!942838))

(assert (= (or b!942838 b!942837) bm!40983))

(assert (=> b!942836 m!878049))

(declare-fun m!878057 () Bool)

(assert (=> b!942836 m!878057))

(declare-fun m!878059 () Bool)

(assert (=> b!942836 m!878059))

(assert (=> b!942836 m!878049))

(declare-fun m!878061 () Bool)

(assert (=> b!942836 m!878061))

(declare-fun m!878063 () Bool)

(assert (=> bm!40983 m!878063))

(assert (=> b!942839 m!878049))

(assert (=> b!942839 m!878049))

(assert (=> b!942839 m!878051))

(assert (=> b!942716 d!114451))

(declare-fun condMapEmpty!32461 () Bool)

(declare-fun mapDefault!32461 () ValueCell!9734)

(assert (=> mapNonEmpty!32460 (= condMapEmpty!32461 (= mapRest!32460 ((as const (Array (_ BitVec 32) ValueCell!9734)) mapDefault!32461)))))

(declare-fun e!530161 () Bool)

(declare-fun mapRes!32461 () Bool)

(assert (=> mapNonEmpty!32460 (= tp!62274 (and e!530161 mapRes!32461))))

(declare-fun mapIsEmpty!32461 () Bool)

(assert (=> mapIsEmpty!32461 mapRes!32461))

(declare-fun b!942840 () Bool)

(declare-fun e!530160 () Bool)

(assert (=> b!942840 (= e!530160 tp_is_empty!20431)))

(declare-fun b!942841 () Bool)

(assert (=> b!942841 (= e!530161 tp_is_empty!20431)))

(declare-fun mapNonEmpty!32461 () Bool)

(declare-fun tp!62275 () Bool)

(assert (=> mapNonEmpty!32461 (= mapRes!32461 (and tp!62275 e!530160))))

(declare-fun mapValue!32461 () ValueCell!9734)

(declare-fun mapKey!32461 () (_ BitVec 32))

(declare-fun mapRest!32461 () (Array (_ BitVec 32) ValueCell!9734))

(assert (=> mapNonEmpty!32461 (= mapRest!32460 (store mapRest!32461 mapKey!32461 mapValue!32461))))

(assert (= (and mapNonEmpty!32460 condMapEmpty!32461) mapIsEmpty!32461))

(assert (= (and mapNonEmpty!32460 (not condMapEmpty!32461)) mapNonEmpty!32461))

(assert (= (and mapNonEmpty!32461 ((_ is ValueCellFull!9734) mapValue!32461)) b!942840))

(assert (= (and mapNonEmpty!32460 ((_ is ValueCellFull!9734) mapDefault!32461)) b!942841))

(declare-fun m!878065 () Bool)

(assert (=> mapNonEmpty!32461 m!878065))

(check-sat (not b!942754) (not b!942753) (not b!942823) (not b!942810) (not b!942825) (not b!942800) (not b!942836) (not b!942839) (not d!114439) (not b_next!17923) (not bm!40983) (not mapNonEmpty!32461) (not b!942770) (not bm!40980) tp_is_empty!20431 (not d!114443) (not b!942827) b_and!29345 (not bm!40977) (not d!114441))
(check-sat b_and!29345 (not b_next!17923))
