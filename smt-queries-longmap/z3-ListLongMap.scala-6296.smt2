; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80678 () Bool)

(assert start!80678)

(declare-fun b!946371 () Bool)

(declare-fun b_free!18097 () Bool)

(declare-fun b_next!18097 () Bool)

(assert (=> b!946371 (= b_free!18097 (not b_next!18097))))

(declare-fun tp!62810 () Bool)

(declare-fun b_and!29529 () Bool)

(assert (=> b!946371 (= tp!62810 b_and!29529)))

(declare-fun b!946369 () Bool)

(declare-fun e!532359 () Bool)

(declare-fun tp_is_empty!20605 () Bool)

(assert (=> b!946369 (= e!532359 tp_is_empty!20605)))

(declare-fun b!946370 () Bool)

(declare-fun e!532363 () Bool)

(assert (=> b!946370 (= e!532363 tp_is_empty!20605)))

(declare-fun e!532361 () Bool)

(declare-fun e!532364 () Bool)

(declare-datatypes ((V!32439 0))(
  ( (V!32440 (val!10353 Int)) )
))
(declare-datatypes ((ValueCell!9821 0))(
  ( (ValueCellFull!9821 (v!12884 V!32439)) (EmptyCell!9821) )
))
(declare-datatypes ((array!57233 0))(
  ( (array!57234 (arr!27535 (Array (_ BitVec 32) ValueCell!9821)) (size!28004 (_ BitVec 32))) )
))
(declare-datatypes ((array!57235 0))(
  ( (array!57236 (arr!27536 (Array (_ BitVec 32) (_ BitVec 64))) (size!28005 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4792 0))(
  ( (LongMapFixedSize!4793 (defaultEntry!5693 Int) (mask!27404 (_ BitVec 32)) (extraKeys!5425 (_ BitVec 32)) (zeroValue!5529 V!32439) (minValue!5529 V!32439) (_size!2451 (_ BitVec 32)) (_keys!10601 array!57235) (_values!5716 array!57233) (_vacant!2451 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4792)

(declare-fun array_inv!21468 (array!57235) Bool)

(declare-fun array_inv!21469 (array!57233) Bool)

(assert (=> b!946371 (= e!532361 (and tp!62810 tp_is_empty!20605 (array_inv!21468 (_keys!10601 thiss!1141)) (array_inv!21469 (_values!5716 thiss!1141)) e!532364))))

(declare-fun b!946372 () Bool)

(declare-fun mapRes!32741 () Bool)

(assert (=> b!946372 (= e!532364 (and e!532363 mapRes!32741))))

(declare-fun condMapEmpty!32741 () Bool)

(declare-fun mapDefault!32741 () ValueCell!9821)

(assert (=> b!946372 (= condMapEmpty!32741 (= (arr!27535 (_values!5716 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9821)) mapDefault!32741)))))

(declare-fun res!635342 () Bool)

(declare-fun e!532362 () Bool)

(assert (=> start!80678 (=> (not res!635342) (not e!532362))))

(declare-fun valid!1837 (LongMapFixedSize!4792) Bool)

(assert (=> start!80678 (= res!635342 (valid!1837 thiss!1141))))

(assert (=> start!80678 e!532362))

(assert (=> start!80678 e!532361))

(assert (=> start!80678 true))

(declare-fun b!946373 () Bool)

(declare-datatypes ((SeekEntryResult!9044 0))(
  ( (MissingZero!9044 (index!38547 (_ BitVec 32))) (Found!9044 (index!38548 (_ BitVec 32))) (Intermediate!9044 (undefined!9856 Bool) (index!38549 (_ BitVec 32)) (x!81205 (_ BitVec 32))) (Undefined!9044) (MissingVacant!9044 (index!38550 (_ BitVec 32))) )
))
(declare-fun lt!426388 () SeekEntryResult!9044)

(get-info :version)

(assert (=> b!946373 (= e!532362 (and ((_ is Found!9044) lt!426388) (bvslt (index!38548 lt!426388) #b00000000000000000000000000000000)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57235 (_ BitVec 32)) SeekEntryResult!9044)

(assert (=> b!946373 (= lt!426388 (seekEntry!0 key!756 (_keys!10601 thiss!1141) (mask!27404 thiss!1141)))))

(declare-fun mapIsEmpty!32741 () Bool)

(assert (=> mapIsEmpty!32741 mapRes!32741))

(declare-fun b!946374 () Bool)

(declare-fun res!635341 () Bool)

(assert (=> b!946374 (=> (not res!635341) (not e!532362))))

(assert (=> b!946374 (= res!635341 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32741 () Bool)

(declare-fun tp!62809 () Bool)

(assert (=> mapNonEmpty!32741 (= mapRes!32741 (and tp!62809 e!532359))))

(declare-fun mapValue!32741 () ValueCell!9821)

(declare-fun mapRest!32741 () (Array (_ BitVec 32) ValueCell!9821))

(declare-fun mapKey!32741 () (_ BitVec 32))

(assert (=> mapNonEmpty!32741 (= (arr!27535 (_values!5716 thiss!1141)) (store mapRest!32741 mapKey!32741 mapValue!32741))))

(assert (= (and start!80678 res!635342) b!946374))

(assert (= (and b!946374 res!635341) b!946373))

(assert (= (and b!946372 condMapEmpty!32741) mapIsEmpty!32741))

(assert (= (and b!946372 (not condMapEmpty!32741)) mapNonEmpty!32741))

(assert (= (and mapNonEmpty!32741 ((_ is ValueCellFull!9821) mapValue!32741)) b!946369))

(assert (= (and b!946372 ((_ is ValueCellFull!9821) mapDefault!32741)) b!946370))

(assert (= b!946371 b!946372))

(assert (= start!80678 b!946371))

(declare-fun m!880561 () Bool)

(assert (=> b!946371 m!880561))

(declare-fun m!880563 () Bool)

(assert (=> b!946371 m!880563))

(declare-fun m!880565 () Bool)

(assert (=> start!80678 m!880565))

(declare-fun m!880567 () Bool)

(assert (=> b!946373 m!880567))

(declare-fun m!880569 () Bool)

(assert (=> mapNonEmpty!32741 m!880569))

(check-sat (not mapNonEmpty!32741) (not b!946371) tp_is_empty!20605 (not b_next!18097) b_and!29529 (not b!946373) (not start!80678))
(check-sat b_and!29529 (not b_next!18097))
(get-model)

(declare-fun d!114727 () Bool)

(declare-fun res!635361 () Bool)

(declare-fun e!532403 () Bool)

(assert (=> d!114727 (=> (not res!635361) (not e!532403))))

(declare-fun simpleValid!351 (LongMapFixedSize!4792) Bool)

(assert (=> d!114727 (= res!635361 (simpleValid!351 thiss!1141))))

(assert (=> d!114727 (= (valid!1837 thiss!1141) e!532403)))

(declare-fun b!946417 () Bool)

(declare-fun res!635362 () Bool)

(assert (=> b!946417 (=> (not res!635362) (not e!532403))))

(declare-fun arrayCountValidKeys!0 (array!57235 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946417 (= res!635362 (= (arrayCountValidKeys!0 (_keys!10601 thiss!1141) #b00000000000000000000000000000000 (size!28005 (_keys!10601 thiss!1141))) (_size!2451 thiss!1141)))))

(declare-fun b!946418 () Bool)

(declare-fun res!635363 () Bool)

(assert (=> b!946418 (=> (not res!635363) (not e!532403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57235 (_ BitVec 32)) Bool)

(assert (=> b!946418 (= res!635363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10601 thiss!1141) (mask!27404 thiss!1141)))))

(declare-fun b!946419 () Bool)

(declare-datatypes ((List!19276 0))(
  ( (Nil!19273) (Cons!19272 (h!20429 (_ BitVec 64)) (t!27589 List!19276)) )
))
(declare-fun arrayNoDuplicates!0 (array!57235 (_ BitVec 32) List!19276) Bool)

(assert (=> b!946419 (= e!532403 (arrayNoDuplicates!0 (_keys!10601 thiss!1141) #b00000000000000000000000000000000 Nil!19273))))

(assert (= (and d!114727 res!635361) b!946417))

(assert (= (and b!946417 res!635362) b!946418))

(assert (= (and b!946418 res!635363) b!946419))

(declare-fun m!880591 () Bool)

(assert (=> d!114727 m!880591))

(declare-fun m!880593 () Bool)

(assert (=> b!946417 m!880593))

(declare-fun m!880595 () Bool)

(assert (=> b!946418 m!880595))

(declare-fun m!880597 () Bool)

(assert (=> b!946419 m!880597))

(assert (=> start!80678 d!114727))

(declare-fun d!114729 () Bool)

(assert (=> d!114729 (= (array_inv!21468 (_keys!10601 thiss!1141)) (bvsge (size!28005 (_keys!10601 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946371 d!114729))

(declare-fun d!114731 () Bool)

(assert (=> d!114731 (= (array_inv!21469 (_values!5716 thiss!1141)) (bvsge (size!28004 (_values!5716 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946371 d!114731))

(declare-fun b!946432 () Bool)

(declare-fun e!532410 () SeekEntryResult!9044)

(declare-fun lt!426405 () SeekEntryResult!9044)

(assert (=> b!946432 (= e!532410 (Found!9044 (index!38549 lt!426405)))))

(declare-fun b!946433 () Bool)

(declare-fun e!532412 () SeekEntryResult!9044)

(assert (=> b!946433 (= e!532412 Undefined!9044)))

(declare-fun b!946434 () Bool)

(declare-fun c!98710 () Bool)

(declare-fun lt!426406 () (_ BitVec 64))

(assert (=> b!946434 (= c!98710 (= lt!426406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532411 () SeekEntryResult!9044)

(assert (=> b!946434 (= e!532410 e!532411)))

(declare-fun d!114733 () Bool)

(declare-fun lt!426403 () SeekEntryResult!9044)

(assert (=> d!114733 (and (or ((_ is MissingVacant!9044) lt!426403) (not ((_ is Found!9044) lt!426403)) (and (bvsge (index!38548 lt!426403) #b00000000000000000000000000000000) (bvslt (index!38548 lt!426403) (size!28005 (_keys!10601 thiss!1141))))) (not ((_ is MissingVacant!9044) lt!426403)) (or (not ((_ is Found!9044) lt!426403)) (= (select (arr!27536 (_keys!10601 thiss!1141)) (index!38548 lt!426403)) key!756)))))

(assert (=> d!114733 (= lt!426403 e!532412)))

(declare-fun c!98709 () Bool)

(assert (=> d!114733 (= c!98709 (and ((_ is Intermediate!9044) lt!426405) (undefined!9856 lt!426405)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57235 (_ BitVec 32)) SeekEntryResult!9044)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114733 (= lt!426405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27404 thiss!1141)) key!756 (_keys!10601 thiss!1141) (mask!27404 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114733 (validMask!0 (mask!27404 thiss!1141))))

(assert (=> d!114733 (= (seekEntry!0 key!756 (_keys!10601 thiss!1141) (mask!27404 thiss!1141)) lt!426403)))

(declare-fun b!946435 () Bool)

(assert (=> b!946435 (= e!532411 (MissingZero!9044 (index!38549 lt!426405)))))

(declare-fun b!946436 () Bool)

(assert (=> b!946436 (= e!532412 e!532410)))

(assert (=> b!946436 (= lt!426406 (select (arr!27536 (_keys!10601 thiss!1141)) (index!38549 lt!426405)))))

(declare-fun c!98711 () Bool)

(assert (=> b!946436 (= c!98711 (= lt!426406 key!756))))

(declare-fun b!946437 () Bool)

(declare-fun lt!426404 () SeekEntryResult!9044)

(assert (=> b!946437 (= e!532411 (ite ((_ is MissingVacant!9044) lt!426404) (MissingZero!9044 (index!38550 lt!426404)) lt!426404))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57235 (_ BitVec 32)) SeekEntryResult!9044)

(assert (=> b!946437 (= lt!426404 (seekKeyOrZeroReturnVacant!0 (x!81205 lt!426405) (index!38549 lt!426405) (index!38549 lt!426405) key!756 (_keys!10601 thiss!1141) (mask!27404 thiss!1141)))))

(assert (= (and d!114733 c!98709) b!946433))

(assert (= (and d!114733 (not c!98709)) b!946436))

(assert (= (and b!946436 c!98711) b!946432))

(assert (= (and b!946436 (not c!98711)) b!946434))

(assert (= (and b!946434 c!98710) b!946435))

(assert (= (and b!946434 (not c!98710)) b!946437))

(declare-fun m!880599 () Bool)

(assert (=> d!114733 m!880599))

(declare-fun m!880601 () Bool)

(assert (=> d!114733 m!880601))

(assert (=> d!114733 m!880601))

(declare-fun m!880603 () Bool)

(assert (=> d!114733 m!880603))

(declare-fun m!880605 () Bool)

(assert (=> d!114733 m!880605))

(declare-fun m!880607 () Bool)

(assert (=> b!946436 m!880607))

(declare-fun m!880609 () Bool)

(assert (=> b!946437 m!880609))

(assert (=> b!946373 d!114733))

(declare-fun b!946445 () Bool)

(declare-fun e!532417 () Bool)

(assert (=> b!946445 (= e!532417 tp_is_empty!20605)))

(declare-fun mapIsEmpty!32750 () Bool)

(declare-fun mapRes!32750 () Bool)

(assert (=> mapIsEmpty!32750 mapRes!32750))

(declare-fun mapNonEmpty!32750 () Bool)

(declare-fun tp!62825 () Bool)

(declare-fun e!532418 () Bool)

(assert (=> mapNonEmpty!32750 (= mapRes!32750 (and tp!62825 e!532418))))

(declare-fun mapValue!32750 () ValueCell!9821)

(declare-fun mapKey!32750 () (_ BitVec 32))

(declare-fun mapRest!32750 () (Array (_ BitVec 32) ValueCell!9821))

(assert (=> mapNonEmpty!32750 (= mapRest!32741 (store mapRest!32750 mapKey!32750 mapValue!32750))))

(declare-fun b!946444 () Bool)

(assert (=> b!946444 (= e!532418 tp_is_empty!20605)))

(declare-fun condMapEmpty!32750 () Bool)

(declare-fun mapDefault!32750 () ValueCell!9821)

(assert (=> mapNonEmpty!32741 (= condMapEmpty!32750 (= mapRest!32741 ((as const (Array (_ BitVec 32) ValueCell!9821)) mapDefault!32750)))))

(assert (=> mapNonEmpty!32741 (= tp!62809 (and e!532417 mapRes!32750))))

(assert (= (and mapNonEmpty!32741 condMapEmpty!32750) mapIsEmpty!32750))

(assert (= (and mapNonEmpty!32741 (not condMapEmpty!32750)) mapNonEmpty!32750))

(assert (= (and mapNonEmpty!32750 ((_ is ValueCellFull!9821) mapValue!32750)) b!946444))

(assert (= (and mapNonEmpty!32741 ((_ is ValueCellFull!9821) mapDefault!32750)) b!946445))

(declare-fun m!880611 () Bool)

(assert (=> mapNonEmpty!32750 m!880611))

(check-sat (not b!946419) (not b!946418) (not b!946437) (not d!114727) (not b!946417) tp_is_empty!20605 (not b_next!18097) b_and!29529 (not mapNonEmpty!32750) (not d!114733))
(check-sat b_and!29529 (not b_next!18097))
