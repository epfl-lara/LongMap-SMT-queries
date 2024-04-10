; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81350 () Bool)

(assert start!81350)

(declare-fun b!951352 () Bool)

(declare-fun b_free!18267 () Bool)

(declare-fun b_next!18267 () Bool)

(assert (=> b!951352 (= b_free!18267 (not b_next!18267))))

(declare-fun tp!63409 () Bool)

(declare-fun b_and!29735 () Bool)

(assert (=> b!951352 (= tp!63409 b_and!29735)))

(declare-fun b!951350 () Bool)

(declare-fun e!535702 () Bool)

(declare-fun e!535700 () Bool)

(declare-fun mapRes!33087 () Bool)

(assert (=> b!951350 (= e!535702 (and e!535700 mapRes!33087))))

(declare-fun condMapEmpty!33087 () Bool)

(declare-datatypes ((V!32665 0))(
  ( (V!32666 (val!10438 Int)) )
))
(declare-datatypes ((ValueCell!9906 0))(
  ( (ValueCellFull!9906 (v!12985 V!32665)) (EmptyCell!9906) )
))
(declare-datatypes ((array!57576 0))(
  ( (array!57577 (arr!27684 (Array (_ BitVec 32) ValueCell!9906)) (size!28162 (_ BitVec 32))) )
))
(declare-datatypes ((array!57578 0))(
  ( (array!57579 (arr!27685 (Array (_ BitVec 32) (_ BitVec 64))) (size!28163 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4962 0))(
  ( (LongMapFixedSize!4963 (defaultEntry!5802 Int) (mask!27622 (_ BitVec 32)) (extraKeys!5534 (_ BitVec 32)) (zeroValue!5638 V!32665) (minValue!5638 V!32665) (_size!2536 (_ BitVec 32)) (_keys!10745 array!57578) (_values!5825 array!57576) (_vacant!2536 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4962)

(declare-fun mapDefault!33087 () ValueCell!9906)

(assert (=> b!951350 (= condMapEmpty!33087 (= (arr!27684 (_values!5825 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9906)) mapDefault!33087)))))

(declare-fun b!951351 () Bool)

(declare-fun res!637599 () Bool)

(declare-fun e!535704 () Bool)

(assert (=> b!951351 (=> (not res!637599) (not e!535704))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9152 0))(
  ( (MissingZero!9152 (index!38979 (_ BitVec 32))) (Found!9152 (index!38980 (_ BitVec 32))) (Intermediate!9152 (undefined!9964 Bool) (index!38981 (_ BitVec 32)) (x!81850 (_ BitVec 32))) (Undefined!9152) (MissingVacant!9152 (index!38982 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57578 (_ BitVec 32)) SeekEntryResult!9152)

(assert (=> b!951351 (= res!637599 (not ((_ is Found!9152) (seekEntry!0 key!756 (_keys!10745 thiss!1141) (mask!27622 thiss!1141)))))))

(declare-fun e!535706 () Bool)

(declare-fun tp_is_empty!20775 () Bool)

(declare-fun array_inv!21490 (array!57578) Bool)

(declare-fun array_inv!21491 (array!57576) Bool)

(assert (=> b!951352 (= e!535706 (and tp!63409 tp_is_empty!20775 (array_inv!21490 (_keys!10745 thiss!1141)) (array_inv!21491 (_values!5825 thiss!1141)) e!535702))))

(declare-fun res!637603 () Bool)

(assert (=> start!81350 (=> (not res!637603) (not e!535704))))

(declare-fun valid!1887 (LongMapFixedSize!4962) Bool)

(assert (=> start!81350 (= res!637603 (valid!1887 thiss!1141))))

(assert (=> start!81350 e!535704))

(assert (=> start!81350 e!535706))

(assert (=> start!81350 true))

(declare-fun mapNonEmpty!33087 () Bool)

(declare-fun tp!63410 () Bool)

(declare-fun e!535703 () Bool)

(assert (=> mapNonEmpty!33087 (= mapRes!33087 (and tp!63410 e!535703))))

(declare-fun mapRest!33087 () (Array (_ BitVec 32) ValueCell!9906))

(declare-fun mapValue!33087 () ValueCell!9906)

(declare-fun mapKey!33087 () (_ BitVec 32))

(assert (=> mapNonEmpty!33087 (= (arr!27684 (_values!5825 thiss!1141)) (store mapRest!33087 mapKey!33087 mapValue!33087))))

(declare-fun b!951353 () Bool)

(declare-fun e!535701 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57578 (_ BitVec 32)) Bool)

(assert (=> b!951353 (= e!535701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10745 thiss!1141) (mask!27622 thiss!1141)))))

(declare-fun mapIsEmpty!33087 () Bool)

(assert (=> mapIsEmpty!33087 mapRes!33087))

(declare-fun b!951354 () Bool)

(assert (=> b!951354 (= e!535704 (not e!535701))))

(declare-fun res!637600 () Bool)

(assert (=> b!951354 (=> res!637600 e!535701)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951354 (= res!637600 (not (validMask!0 (mask!27622 thiss!1141))))))

(declare-fun lt!428517 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57578 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951354 (= lt!428517 (arrayScanForKey!0 (_keys!10745 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951354 (arrayContainsKey!0 (_keys!10745 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!32017 0))(
  ( (Unit!32018) )
))
(declare-fun lt!428516 () Unit!32017)

(declare-fun lemmaKeyInListMapIsInArray!327 (array!57578 array!57576 (_ BitVec 32) (_ BitVec 32) V!32665 V!32665 (_ BitVec 64) Int) Unit!32017)

(assert (=> b!951354 (= lt!428516 (lemmaKeyInListMapIsInArray!327 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) key!756 (defaultEntry!5802 thiss!1141)))))

(declare-fun b!951355 () Bool)

(assert (=> b!951355 (= e!535700 tp_is_empty!20775)))

(declare-fun b!951356 () Bool)

(declare-fun res!637604 () Bool)

(assert (=> b!951356 (=> (not res!637604) (not e!535704))))

(declare-datatypes ((tuple2!13568 0))(
  ( (tuple2!13569 (_1!6795 (_ BitVec 64)) (_2!6795 V!32665)) )
))
(declare-datatypes ((List!19353 0))(
  ( (Nil!19350) (Cons!19349 (h!20510 tuple2!13568) (t!27700 List!19353)) )
))
(declare-datatypes ((ListLongMap!12265 0))(
  ( (ListLongMap!12266 (toList!6148 List!19353)) )
))
(declare-fun contains!5241 (ListLongMap!12265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3381 (array!57578 array!57576 (_ BitVec 32) (_ BitVec 32) V!32665 V!32665 (_ BitVec 32) Int) ListLongMap!12265)

(assert (=> b!951356 (= res!637604 (contains!5241 (getCurrentListMap!3381 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141)) key!756))))

(declare-fun b!951357 () Bool)

(declare-fun res!637601 () Bool)

(assert (=> b!951357 (=> res!637601 e!535701)))

(assert (=> b!951357 (= res!637601 (or (not (= (size!28163 (_keys!10745 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27622 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!28163 (_keys!10745 thiss!1141))) (bvslt lt!428517 #b00000000000000000000000000000000) (bvsgt lt!428517 (size!28163 (_keys!10745 thiss!1141)))))))

(declare-fun b!951358 () Bool)

(declare-fun res!637602 () Bool)

(assert (=> b!951358 (=> (not res!637602) (not e!535704))))

(assert (=> b!951358 (= res!637602 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951359 () Bool)

(assert (=> b!951359 (= e!535703 tp_is_empty!20775)))

(assert (= (and start!81350 res!637603) b!951358))

(assert (= (and b!951358 res!637602) b!951351))

(assert (= (and b!951351 res!637599) b!951356))

(assert (= (and b!951356 res!637604) b!951354))

(assert (= (and b!951354 (not res!637600)) b!951357))

(assert (= (and b!951357 (not res!637601)) b!951353))

(assert (= (and b!951350 condMapEmpty!33087) mapIsEmpty!33087))

(assert (= (and b!951350 (not condMapEmpty!33087)) mapNonEmpty!33087))

(assert (= (and mapNonEmpty!33087 ((_ is ValueCellFull!9906) mapValue!33087)) b!951359))

(assert (= (and b!951350 ((_ is ValueCellFull!9906) mapDefault!33087)) b!951355))

(assert (= b!951352 b!951350))

(assert (= start!81350 b!951352))

(declare-fun m!883621 () Bool)

(assert (=> mapNonEmpty!33087 m!883621))

(declare-fun m!883623 () Bool)

(assert (=> b!951354 m!883623))

(declare-fun m!883625 () Bool)

(assert (=> b!951354 m!883625))

(declare-fun m!883627 () Bool)

(assert (=> b!951354 m!883627))

(declare-fun m!883629 () Bool)

(assert (=> b!951354 m!883629))

(declare-fun m!883631 () Bool)

(assert (=> b!951351 m!883631))

(declare-fun m!883633 () Bool)

(assert (=> start!81350 m!883633))

(declare-fun m!883635 () Bool)

(assert (=> b!951356 m!883635))

(assert (=> b!951356 m!883635))

(declare-fun m!883637 () Bool)

(assert (=> b!951356 m!883637))

(declare-fun m!883639 () Bool)

(assert (=> b!951353 m!883639))

(declare-fun m!883641 () Bool)

(assert (=> b!951352 m!883641))

(declare-fun m!883643 () Bool)

(assert (=> b!951352 m!883643))

(check-sat (not start!81350) (not mapNonEmpty!33087) (not b!951353) (not b!951351) (not b!951352) (not b_next!18267) (not b!951356) (not b!951354) b_and!29735 tp_is_empty!20775)
(check-sat b_and!29735 (not b_next!18267))
(get-model)

(declare-fun d!115335 () Bool)

(declare-fun res!637629 () Bool)

(declare-fun e!535730 () Bool)

(assert (=> d!115335 (=> (not res!637629) (not e!535730))))

(declare-fun simpleValid!378 (LongMapFixedSize!4962) Bool)

(assert (=> d!115335 (= res!637629 (simpleValid!378 thiss!1141))))

(assert (=> d!115335 (= (valid!1887 thiss!1141) e!535730)))

(declare-fun b!951396 () Bool)

(declare-fun res!637630 () Bool)

(assert (=> b!951396 (=> (not res!637630) (not e!535730))))

(declare-fun arrayCountValidKeys!0 (array!57578 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951396 (= res!637630 (= (arrayCountValidKeys!0 (_keys!10745 thiss!1141) #b00000000000000000000000000000000 (size!28163 (_keys!10745 thiss!1141))) (_size!2536 thiss!1141)))))

(declare-fun b!951397 () Bool)

(declare-fun res!637631 () Bool)

(assert (=> b!951397 (=> (not res!637631) (not e!535730))))

(assert (=> b!951397 (= res!637631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10745 thiss!1141) (mask!27622 thiss!1141)))))

(declare-fun b!951398 () Bool)

(declare-datatypes ((List!19355 0))(
  ( (Nil!19352) (Cons!19351 (h!20512 (_ BitVec 64)) (t!27704 List!19355)) )
))
(declare-fun arrayNoDuplicates!0 (array!57578 (_ BitVec 32) List!19355) Bool)

(assert (=> b!951398 (= e!535730 (arrayNoDuplicates!0 (_keys!10745 thiss!1141) #b00000000000000000000000000000000 Nil!19352))))

(assert (= (and d!115335 res!637629) b!951396))

(assert (= (and b!951396 res!637630) b!951397))

(assert (= (and b!951397 res!637631) b!951398))

(declare-fun m!883669 () Bool)

(assert (=> d!115335 m!883669))

(declare-fun m!883671 () Bool)

(assert (=> b!951396 m!883671))

(assert (=> b!951397 m!883639))

(declare-fun m!883673 () Bool)

(assert (=> b!951398 m!883673))

(assert (=> start!81350 d!115335))

(declare-fun d!115337 () Bool)

(assert (=> d!115337 (= (validMask!0 (mask!27622 thiss!1141)) (and (or (= (mask!27622 thiss!1141) #b00000000000000000000000000000111) (= (mask!27622 thiss!1141) #b00000000000000000000000000001111) (= (mask!27622 thiss!1141) #b00000000000000000000000000011111) (= (mask!27622 thiss!1141) #b00000000000000000000000000111111) (= (mask!27622 thiss!1141) #b00000000000000000000000001111111) (= (mask!27622 thiss!1141) #b00000000000000000000000011111111) (= (mask!27622 thiss!1141) #b00000000000000000000000111111111) (= (mask!27622 thiss!1141) #b00000000000000000000001111111111) (= (mask!27622 thiss!1141) #b00000000000000000000011111111111) (= (mask!27622 thiss!1141) #b00000000000000000000111111111111) (= (mask!27622 thiss!1141) #b00000000000000000001111111111111) (= (mask!27622 thiss!1141) #b00000000000000000011111111111111) (= (mask!27622 thiss!1141) #b00000000000000000111111111111111) (= (mask!27622 thiss!1141) #b00000000000000001111111111111111) (= (mask!27622 thiss!1141) #b00000000000000011111111111111111) (= (mask!27622 thiss!1141) #b00000000000000111111111111111111) (= (mask!27622 thiss!1141) #b00000000000001111111111111111111) (= (mask!27622 thiss!1141) #b00000000000011111111111111111111) (= (mask!27622 thiss!1141) #b00000000000111111111111111111111) (= (mask!27622 thiss!1141) #b00000000001111111111111111111111) (= (mask!27622 thiss!1141) #b00000000011111111111111111111111) (= (mask!27622 thiss!1141) #b00000000111111111111111111111111) (= (mask!27622 thiss!1141) #b00000001111111111111111111111111) (= (mask!27622 thiss!1141) #b00000011111111111111111111111111) (= (mask!27622 thiss!1141) #b00000111111111111111111111111111) (= (mask!27622 thiss!1141) #b00001111111111111111111111111111) (= (mask!27622 thiss!1141) #b00011111111111111111111111111111) (= (mask!27622 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27622 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951354 d!115337))

(declare-fun d!115339 () Bool)

(declare-fun lt!428526 () (_ BitVec 32))

(assert (=> d!115339 (and (or (bvslt lt!428526 #b00000000000000000000000000000000) (bvsge lt!428526 (size!28163 (_keys!10745 thiss!1141))) (and (bvsge lt!428526 #b00000000000000000000000000000000) (bvslt lt!428526 (size!28163 (_keys!10745 thiss!1141))))) (bvsge lt!428526 #b00000000000000000000000000000000) (bvslt lt!428526 (size!28163 (_keys!10745 thiss!1141))) (= (select (arr!27685 (_keys!10745 thiss!1141)) lt!428526) key!756))))

(declare-fun e!535733 () (_ BitVec 32))

(assert (=> d!115339 (= lt!428526 e!535733)))

(declare-fun c!99423 () Bool)

(assert (=> d!115339 (= c!99423 (= (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28163 (_keys!10745 thiss!1141))) (bvslt (size!28163 (_keys!10745 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115339 (= (arrayScanForKey!0 (_keys!10745 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428526)))

(declare-fun b!951403 () Bool)

(assert (=> b!951403 (= e!535733 #b00000000000000000000000000000000)))

(declare-fun b!951404 () Bool)

(assert (=> b!951404 (= e!535733 (arrayScanForKey!0 (_keys!10745 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115339 c!99423) b!951403))

(assert (= (and d!115339 (not c!99423)) b!951404))

(declare-fun m!883675 () Bool)

(assert (=> d!115339 m!883675))

(declare-fun m!883677 () Bool)

(assert (=> d!115339 m!883677))

(declare-fun m!883679 () Bool)

(assert (=> b!951404 m!883679))

(assert (=> b!951354 d!115339))

(declare-fun d!115341 () Bool)

(declare-fun res!637636 () Bool)

(declare-fun e!535738 () Bool)

(assert (=> d!115341 (=> res!637636 e!535738)))

(assert (=> d!115341 (= res!637636 (= (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115341 (= (arrayContainsKey!0 (_keys!10745 thiss!1141) key!756 #b00000000000000000000000000000000) e!535738)))

(declare-fun b!951409 () Bool)

(declare-fun e!535739 () Bool)

(assert (=> b!951409 (= e!535738 e!535739)))

(declare-fun res!637637 () Bool)

(assert (=> b!951409 (=> (not res!637637) (not e!535739))))

(assert (=> b!951409 (= res!637637 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28163 (_keys!10745 thiss!1141))))))

(declare-fun b!951410 () Bool)

(assert (=> b!951410 (= e!535739 (arrayContainsKey!0 (_keys!10745 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115341 (not res!637636)) b!951409))

(assert (= (and b!951409 res!637637) b!951410))

(assert (=> d!115341 m!883677))

(declare-fun m!883681 () Bool)

(assert (=> b!951410 m!883681))

(assert (=> b!951354 d!115341))

(declare-fun d!115343 () Bool)

(declare-fun e!535742 () Bool)

(assert (=> d!115343 e!535742))

(declare-fun c!99426 () Bool)

(assert (=> d!115343 (= c!99426 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428529 () Unit!32017)

(declare-fun choose!1591 (array!57578 array!57576 (_ BitVec 32) (_ BitVec 32) V!32665 V!32665 (_ BitVec 64) Int) Unit!32017)

(assert (=> d!115343 (= lt!428529 (choose!1591 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) key!756 (defaultEntry!5802 thiss!1141)))))

(assert (=> d!115343 (validMask!0 (mask!27622 thiss!1141))))

(assert (=> d!115343 (= (lemmaKeyInListMapIsInArray!327 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) key!756 (defaultEntry!5802 thiss!1141)) lt!428529)))

(declare-fun b!951415 () Bool)

(assert (=> b!951415 (= e!535742 (arrayContainsKey!0 (_keys!10745 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951416 () Bool)

(assert (=> b!951416 (= e!535742 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5534 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5534 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115343 c!99426) b!951415))

(assert (= (and d!115343 (not c!99426)) b!951416))

(declare-fun m!883683 () Bool)

(assert (=> d!115343 m!883683))

(assert (=> d!115343 m!883623))

(assert (=> b!951415 m!883627))

(assert (=> b!951354 d!115343))

(declare-fun b!951426 () Bool)

(declare-fun e!535751 () Bool)

(declare-fun call!41469 () Bool)

(assert (=> b!951426 (= e!535751 call!41469)))

(declare-fun b!951427 () Bool)

(declare-fun e!535749 () Bool)

(assert (=> b!951427 (= e!535749 e!535751)))

(declare-fun lt!428536 () (_ BitVec 64))

(assert (=> b!951427 (= lt!428536 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428537 () Unit!32017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57578 (_ BitVec 64) (_ BitVec 32)) Unit!32017)

(assert (=> b!951427 (= lt!428537 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10745 thiss!1141) lt!428536 #b00000000000000000000000000000000))))

(assert (=> b!951427 (arrayContainsKey!0 (_keys!10745 thiss!1141) lt!428536 #b00000000000000000000000000000000)))

(declare-fun lt!428538 () Unit!32017)

(assert (=> b!951427 (= lt!428538 lt!428537)))

(declare-fun res!637643 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57578 (_ BitVec 32)) SeekEntryResult!9152)

(assert (=> b!951427 (= res!637643 (= (seekEntryOrOpen!0 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000) (_keys!10745 thiss!1141) (mask!27622 thiss!1141)) (Found!9152 #b00000000000000000000000000000000)))))

(assert (=> b!951427 (=> (not res!637643) (not e!535751))))

(declare-fun bm!41466 () Bool)

(assert (=> bm!41466 (= call!41469 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10745 thiss!1141) (mask!27622 thiss!1141)))))

(declare-fun b!951428 () Bool)

(declare-fun e!535750 () Bool)

(assert (=> b!951428 (= e!535750 e!535749)))

(declare-fun c!99429 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951428 (= c!99429 (validKeyInArray!0 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115345 () Bool)

(declare-fun res!637642 () Bool)

(assert (=> d!115345 (=> res!637642 e!535750)))

(assert (=> d!115345 (= res!637642 (bvsge #b00000000000000000000000000000000 (size!28163 (_keys!10745 thiss!1141))))))

(assert (=> d!115345 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10745 thiss!1141) (mask!27622 thiss!1141)) e!535750)))

(declare-fun b!951425 () Bool)

(assert (=> b!951425 (= e!535749 call!41469)))

(assert (= (and d!115345 (not res!637642)) b!951428))

(assert (= (and b!951428 c!99429) b!951427))

(assert (= (and b!951428 (not c!99429)) b!951425))

(assert (= (and b!951427 res!637643) b!951426))

(assert (= (or b!951426 b!951425) bm!41466))

(assert (=> b!951427 m!883677))

(declare-fun m!883685 () Bool)

(assert (=> b!951427 m!883685))

(declare-fun m!883687 () Bool)

(assert (=> b!951427 m!883687))

(assert (=> b!951427 m!883677))

(declare-fun m!883689 () Bool)

(assert (=> b!951427 m!883689))

(declare-fun m!883691 () Bool)

(assert (=> bm!41466 m!883691))

(assert (=> b!951428 m!883677))

(assert (=> b!951428 m!883677))

(declare-fun m!883693 () Bool)

(assert (=> b!951428 m!883693))

(assert (=> b!951353 d!115345))

(declare-fun d!115347 () Bool)

(declare-fun e!535756 () Bool)

(assert (=> d!115347 e!535756))

(declare-fun res!637646 () Bool)

(assert (=> d!115347 (=> res!637646 e!535756)))

(declare-fun lt!428547 () Bool)

(assert (=> d!115347 (= res!637646 (not lt!428547))))

(declare-fun lt!428548 () Bool)

(assert (=> d!115347 (= lt!428547 lt!428548)))

(declare-fun lt!428550 () Unit!32017)

(declare-fun e!535757 () Unit!32017)

(assert (=> d!115347 (= lt!428550 e!535757)))

(declare-fun c!99432 () Bool)

(assert (=> d!115347 (= c!99432 lt!428548)))

(declare-fun containsKey!468 (List!19353 (_ BitVec 64)) Bool)

(assert (=> d!115347 (= lt!428548 (containsKey!468 (toList!6148 (getCurrentListMap!3381 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141))) key!756))))

(assert (=> d!115347 (= (contains!5241 (getCurrentListMap!3381 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141)) key!756) lt!428547)))

(declare-fun b!951435 () Bool)

(declare-fun lt!428549 () Unit!32017)

(assert (=> b!951435 (= e!535757 lt!428549)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!364 (List!19353 (_ BitVec 64)) Unit!32017)

(assert (=> b!951435 (= lt!428549 (lemmaContainsKeyImpliesGetValueByKeyDefined!364 (toList!6148 (getCurrentListMap!3381 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141))) key!756))))

(declare-datatypes ((Option!507 0))(
  ( (Some!506 (v!12987 V!32665)) (None!505) )
))
(declare-fun isDefined!373 (Option!507) Bool)

(declare-fun getValueByKey!501 (List!19353 (_ BitVec 64)) Option!507)

(assert (=> b!951435 (isDefined!373 (getValueByKey!501 (toList!6148 (getCurrentListMap!3381 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141))) key!756))))

(declare-fun b!951436 () Bool)

(declare-fun Unit!32021 () Unit!32017)

(assert (=> b!951436 (= e!535757 Unit!32021)))

(declare-fun b!951437 () Bool)

(assert (=> b!951437 (= e!535756 (isDefined!373 (getValueByKey!501 (toList!6148 (getCurrentListMap!3381 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141))) key!756)))))

(assert (= (and d!115347 c!99432) b!951435))

(assert (= (and d!115347 (not c!99432)) b!951436))

(assert (= (and d!115347 (not res!637646)) b!951437))

(declare-fun m!883695 () Bool)

(assert (=> d!115347 m!883695))

(declare-fun m!883697 () Bool)

(assert (=> b!951435 m!883697))

(declare-fun m!883699 () Bool)

(assert (=> b!951435 m!883699))

(assert (=> b!951435 m!883699))

(declare-fun m!883701 () Bool)

(assert (=> b!951435 m!883701))

(assert (=> b!951437 m!883699))

(assert (=> b!951437 m!883699))

(assert (=> b!951437 m!883701))

(assert (=> b!951356 d!115347))

(declare-fun bm!41481 () Bool)

(declare-fun call!41484 () ListLongMap!12265)

(declare-fun call!41488 () ListLongMap!12265)

(assert (=> bm!41481 (= call!41484 call!41488)))

(declare-fun b!951480 () Bool)

(declare-fun res!637670 () Bool)

(declare-fun e!535790 () Bool)

(assert (=> b!951480 (=> (not res!637670) (not e!535790))))

(declare-fun e!535791 () Bool)

(assert (=> b!951480 (= res!637670 e!535791)))

(declare-fun res!637673 () Bool)

(assert (=> b!951480 (=> res!637673 e!535791)))

(declare-fun e!535785 () Bool)

(assert (=> b!951480 (= res!637673 (not e!535785))))

(declare-fun res!637665 () Bool)

(assert (=> b!951480 (=> (not res!637665) (not e!535785))))

(assert (=> b!951480 (= res!637665 (bvslt #b00000000000000000000000000000000 (size!28163 (_keys!10745 thiss!1141))))))

(declare-fun b!951481 () Bool)

(assert (=> b!951481 (= e!535785 (validKeyInArray!0 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951482 () Bool)

(declare-fun e!535794 () Bool)

(assert (=> b!951482 (= e!535790 e!535794)))

(declare-fun c!99447 () Bool)

(assert (=> b!951482 (= c!99447 (not (= (bvand (extraKeys!5534 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951483 () Bool)

(declare-fun e!535793 () ListLongMap!12265)

(declare-fun e!535796 () ListLongMap!12265)

(assert (=> b!951483 (= e!535793 e!535796)))

(declare-fun c!99449 () Bool)

(assert (=> b!951483 (= c!99449 (and (not (= (bvand (extraKeys!5534 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5534 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951484 () Bool)

(declare-fun e!535792 () Bool)

(assert (=> b!951484 (= e!535791 e!535792)))

(declare-fun res!637672 () Bool)

(assert (=> b!951484 (=> (not res!637672) (not e!535792))))

(declare-fun lt!428610 () ListLongMap!12265)

(assert (=> b!951484 (= res!637672 (contains!5241 lt!428610 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28163 (_keys!10745 thiss!1141))))))

(declare-fun b!951485 () Bool)

(declare-fun e!535786 () Bool)

(declare-fun e!535795 () Bool)

(assert (=> b!951485 (= e!535786 e!535795)))

(declare-fun res!637668 () Bool)

(declare-fun call!41490 () Bool)

(assert (=> b!951485 (= res!637668 call!41490)))

(assert (=> b!951485 (=> (not res!637668) (not e!535795))))

(declare-fun b!951486 () Bool)

(declare-fun e!535789 () Bool)

(assert (=> b!951486 (= e!535789 (validKeyInArray!0 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951487 () Bool)

(declare-fun apply!882 (ListLongMap!12265 (_ BitVec 64)) V!32665)

(assert (=> b!951487 (= e!535795 (= (apply!882 lt!428610 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5638 thiss!1141)))))

(declare-fun b!951488 () Bool)

(declare-fun e!535788 () Bool)

(assert (=> b!951488 (= e!535794 e!535788)))

(declare-fun res!637667 () Bool)

(declare-fun call!41487 () Bool)

(assert (=> b!951488 (= res!637667 call!41487)))

(assert (=> b!951488 (=> (not res!637667) (not e!535788))))

(declare-fun b!951489 () Bool)

(declare-fun e!535787 () Unit!32017)

(declare-fun Unit!32022 () Unit!32017)

(assert (=> b!951489 (= e!535787 Unit!32022)))

(declare-fun bm!41482 () Bool)

(declare-fun call!41485 () ListLongMap!12265)

(declare-fun getCurrentListMapNoExtraKeys!3321 (array!57578 array!57576 (_ BitVec 32) (_ BitVec 32) V!32665 V!32665 (_ BitVec 32) Int) ListLongMap!12265)

(assert (=> bm!41482 (= call!41485 (getCurrentListMapNoExtraKeys!3321 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141)))))

(declare-fun b!951490 () Bool)

(assert (=> b!951490 (= e!535794 (not call!41487))))

(declare-fun d!115349 () Bool)

(assert (=> d!115349 e!535790))

(declare-fun res!637669 () Bool)

(assert (=> d!115349 (=> (not res!637669) (not e!535790))))

(assert (=> d!115349 (= res!637669 (or (bvsge #b00000000000000000000000000000000 (size!28163 (_keys!10745 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28163 (_keys!10745 thiss!1141))))))))

(declare-fun lt!428601 () ListLongMap!12265)

(assert (=> d!115349 (= lt!428610 lt!428601)))

(declare-fun lt!428604 () Unit!32017)

(assert (=> d!115349 (= lt!428604 e!535787)))

(declare-fun c!99446 () Bool)

(assert (=> d!115349 (= c!99446 e!535789)))

(declare-fun res!637666 () Bool)

(assert (=> d!115349 (=> (not res!637666) (not e!535789))))

(assert (=> d!115349 (= res!637666 (bvslt #b00000000000000000000000000000000 (size!28163 (_keys!10745 thiss!1141))))))

(assert (=> d!115349 (= lt!428601 e!535793)))

(declare-fun c!99450 () Bool)

(assert (=> d!115349 (= c!99450 (and (not (= (bvand (extraKeys!5534 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5534 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115349 (validMask!0 (mask!27622 thiss!1141))))

(assert (=> d!115349 (= (getCurrentListMap!3381 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141)) lt!428610)))

(declare-fun b!951491 () Bool)

(declare-fun e!535784 () ListLongMap!12265)

(declare-fun call!41489 () ListLongMap!12265)

(assert (=> b!951491 (= e!535784 call!41489)))

(declare-fun b!951492 () Bool)

(declare-fun c!99445 () Bool)

(assert (=> b!951492 (= c!99445 (and (not (= (bvand (extraKeys!5534 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5534 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!951492 (= e!535796 e!535784)))

(declare-fun b!951493 () Bool)

(assert (=> b!951493 (= e!535786 (not call!41490))))

(declare-fun b!951494 () Bool)

(assert (=> b!951494 (= e!535796 call!41489)))

(declare-fun b!951495 () Bool)

(assert (=> b!951495 (= e!535784 call!41484)))

(declare-fun bm!41483 () Bool)

(assert (=> bm!41483 (= call!41488 call!41485)))

(declare-fun b!951496 () Bool)

(declare-fun call!41486 () ListLongMap!12265)

(declare-fun +!2866 (ListLongMap!12265 tuple2!13568) ListLongMap!12265)

(assert (=> b!951496 (= e!535793 (+!2866 call!41486 (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5638 thiss!1141))))))

(declare-fun b!951497 () Bool)

(declare-fun res!637671 () Bool)

(assert (=> b!951497 (=> (not res!637671) (not e!535790))))

(assert (=> b!951497 (= res!637671 e!535786)))

(declare-fun c!99448 () Bool)

(assert (=> b!951497 (= c!99448 (not (= (bvand (extraKeys!5534 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!951498 () Bool)

(declare-fun lt!428607 () Unit!32017)

(assert (=> b!951498 (= e!535787 lt!428607)))

(declare-fun lt!428609 () ListLongMap!12265)

(assert (=> b!951498 (= lt!428609 (getCurrentListMapNoExtraKeys!3321 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141)))))

(declare-fun lt!428599 () (_ BitVec 64))

(assert (=> b!951498 (= lt!428599 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428612 () (_ BitVec 64))

(assert (=> b!951498 (= lt!428612 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428603 () Unit!32017)

(declare-fun addStillContains!585 (ListLongMap!12265 (_ BitVec 64) V!32665 (_ BitVec 64)) Unit!32017)

(assert (=> b!951498 (= lt!428603 (addStillContains!585 lt!428609 lt!428599 (zeroValue!5638 thiss!1141) lt!428612))))

(assert (=> b!951498 (contains!5241 (+!2866 lt!428609 (tuple2!13569 lt!428599 (zeroValue!5638 thiss!1141))) lt!428612)))

(declare-fun lt!428596 () Unit!32017)

(assert (=> b!951498 (= lt!428596 lt!428603)))

(declare-fun lt!428615 () ListLongMap!12265)

(assert (=> b!951498 (= lt!428615 (getCurrentListMapNoExtraKeys!3321 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141)))))

(declare-fun lt!428602 () (_ BitVec 64))

(assert (=> b!951498 (= lt!428602 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428608 () (_ BitVec 64))

(assert (=> b!951498 (= lt!428608 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428597 () Unit!32017)

(declare-fun addApplyDifferent!465 (ListLongMap!12265 (_ BitVec 64) V!32665 (_ BitVec 64)) Unit!32017)

(assert (=> b!951498 (= lt!428597 (addApplyDifferent!465 lt!428615 lt!428602 (minValue!5638 thiss!1141) lt!428608))))

(assert (=> b!951498 (= (apply!882 (+!2866 lt!428615 (tuple2!13569 lt!428602 (minValue!5638 thiss!1141))) lt!428608) (apply!882 lt!428615 lt!428608))))

(declare-fun lt!428598 () Unit!32017)

(assert (=> b!951498 (= lt!428598 lt!428597)))

(declare-fun lt!428600 () ListLongMap!12265)

(assert (=> b!951498 (= lt!428600 (getCurrentListMapNoExtraKeys!3321 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141)))))

(declare-fun lt!428611 () (_ BitVec 64))

(assert (=> b!951498 (= lt!428611 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428614 () (_ BitVec 64))

(assert (=> b!951498 (= lt!428614 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428606 () Unit!32017)

(assert (=> b!951498 (= lt!428606 (addApplyDifferent!465 lt!428600 lt!428611 (zeroValue!5638 thiss!1141) lt!428614))))

(assert (=> b!951498 (= (apply!882 (+!2866 lt!428600 (tuple2!13569 lt!428611 (zeroValue!5638 thiss!1141))) lt!428614) (apply!882 lt!428600 lt!428614))))

(declare-fun lt!428613 () Unit!32017)

(assert (=> b!951498 (= lt!428613 lt!428606)))

(declare-fun lt!428616 () ListLongMap!12265)

(assert (=> b!951498 (= lt!428616 (getCurrentListMapNoExtraKeys!3321 (_keys!10745 thiss!1141) (_values!5825 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5534 thiss!1141) (zeroValue!5638 thiss!1141) (minValue!5638 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5802 thiss!1141)))))

(declare-fun lt!428605 () (_ BitVec 64))

(assert (=> b!951498 (= lt!428605 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428595 () (_ BitVec 64))

(assert (=> b!951498 (= lt!428595 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951498 (= lt!428607 (addApplyDifferent!465 lt!428616 lt!428605 (minValue!5638 thiss!1141) lt!428595))))

(assert (=> b!951498 (= (apply!882 (+!2866 lt!428616 (tuple2!13569 lt!428605 (minValue!5638 thiss!1141))) lt!428595) (apply!882 lt!428616 lt!428595))))

(declare-fun b!951499 () Bool)

(assert (=> b!951499 (= e!535788 (= (apply!882 lt!428610 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5638 thiss!1141)))))

(declare-fun bm!41484 () Bool)

(assert (=> bm!41484 (= call!41486 (+!2866 (ite c!99450 call!41485 (ite c!99449 call!41488 call!41484)) (ite (or c!99450 c!99449) (tuple2!13569 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5638 thiss!1141)) (tuple2!13569 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5638 thiss!1141)))))))

(declare-fun bm!41485 () Bool)

(assert (=> bm!41485 (= call!41490 (contains!5241 lt!428610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951500 () Bool)

(declare-fun get!14550 (ValueCell!9906 V!32665) V!32665)

(declare-fun dynLambda!1655 (Int (_ BitVec 64)) V!32665)

(assert (=> b!951500 (= e!535792 (= (apply!882 lt!428610 (select (arr!27685 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000)) (get!14550 (select (arr!27684 (_values!5825 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1655 (defaultEntry!5802 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28162 (_values!5825 thiss!1141))))))

(assert (=> b!951500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28163 (_keys!10745 thiss!1141))))))

(declare-fun bm!41486 () Bool)

(assert (=> bm!41486 (= call!41487 (contains!5241 lt!428610 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41487 () Bool)

(assert (=> bm!41487 (= call!41489 call!41486)))

(assert (= (and d!115349 c!99450) b!951496))

(assert (= (and d!115349 (not c!99450)) b!951483))

(assert (= (and b!951483 c!99449) b!951494))

(assert (= (and b!951483 (not c!99449)) b!951492))

(assert (= (and b!951492 c!99445) b!951491))

(assert (= (and b!951492 (not c!99445)) b!951495))

(assert (= (or b!951491 b!951495) bm!41481))

(assert (= (or b!951494 bm!41481) bm!41483))

(assert (= (or b!951494 b!951491) bm!41487))

(assert (= (or b!951496 bm!41483) bm!41482))

(assert (= (or b!951496 bm!41487) bm!41484))

(assert (= (and d!115349 res!637666) b!951486))

(assert (= (and d!115349 c!99446) b!951498))

(assert (= (and d!115349 (not c!99446)) b!951489))

(assert (= (and d!115349 res!637669) b!951480))

(assert (= (and b!951480 res!637665) b!951481))

(assert (= (and b!951480 (not res!637673)) b!951484))

(assert (= (and b!951484 res!637672) b!951500))

(assert (= (and b!951480 res!637670) b!951497))

(assert (= (and b!951497 c!99448) b!951485))

(assert (= (and b!951497 (not c!99448)) b!951493))

(assert (= (and b!951485 res!637668) b!951487))

(assert (= (or b!951485 b!951493) bm!41485))

(assert (= (and b!951497 res!637671) b!951482))

(assert (= (and b!951482 c!99447) b!951488))

(assert (= (and b!951482 (not c!99447)) b!951490))

(assert (= (and b!951488 res!637667) b!951499))

(assert (= (or b!951488 b!951490) bm!41486))

(declare-fun b_lambda!14391 () Bool)

(assert (=> (not b_lambda!14391) (not b!951500)))

(declare-fun t!27703 () Bool)

(declare-fun tb!6199 () Bool)

(assert (=> (and b!951352 (= (defaultEntry!5802 thiss!1141) (defaultEntry!5802 thiss!1141)) t!27703) tb!6199))

(declare-fun result!12319 () Bool)

(assert (=> tb!6199 (= result!12319 tp_is_empty!20775)))

(assert (=> b!951500 t!27703))

(declare-fun b_and!29739 () Bool)

(assert (= b_and!29735 (and (=> t!27703 result!12319) b_and!29739)))

(declare-fun m!883703 () Bool)

(assert (=> bm!41482 m!883703))

(declare-fun m!883705 () Bool)

(assert (=> bm!41486 m!883705))

(declare-fun m!883707 () Bool)

(assert (=> b!951498 m!883707))

(declare-fun m!883709 () Bool)

(assert (=> b!951498 m!883709))

(assert (=> b!951498 m!883677))

(declare-fun m!883711 () Bool)

(assert (=> b!951498 m!883711))

(declare-fun m!883713 () Bool)

(assert (=> b!951498 m!883713))

(assert (=> b!951498 m!883707))

(declare-fun m!883715 () Bool)

(assert (=> b!951498 m!883715))

(declare-fun m!883717 () Bool)

(assert (=> b!951498 m!883717))

(declare-fun m!883719 () Bool)

(assert (=> b!951498 m!883719))

(declare-fun m!883721 () Bool)

(assert (=> b!951498 m!883721))

(assert (=> b!951498 m!883719))

(assert (=> b!951498 m!883715))

(declare-fun m!883723 () Bool)

(assert (=> b!951498 m!883723))

(declare-fun m!883725 () Bool)

(assert (=> b!951498 m!883725))

(declare-fun m!883727 () Bool)

(assert (=> b!951498 m!883727))

(declare-fun m!883729 () Bool)

(assert (=> b!951498 m!883729))

(declare-fun m!883731 () Bool)

(assert (=> b!951498 m!883731))

(declare-fun m!883733 () Bool)

(assert (=> b!951498 m!883733))

(assert (=> b!951498 m!883711))

(assert (=> b!951498 m!883703))

(declare-fun m!883735 () Bool)

(assert (=> b!951498 m!883735))

(declare-fun m!883737 () Bool)

(assert (=> bm!41484 m!883737))

(assert (=> d!115349 m!883623))

(declare-fun m!883739 () Bool)

(assert (=> b!951499 m!883739))

(declare-fun m!883741 () Bool)

(assert (=> b!951487 m!883741))

(declare-fun m!883743 () Bool)

(assert (=> b!951496 m!883743))

(assert (=> b!951486 m!883677))

(assert (=> b!951486 m!883677))

(assert (=> b!951486 m!883693))

(declare-fun m!883745 () Bool)

(assert (=> bm!41485 m!883745))

(assert (=> b!951484 m!883677))

(assert (=> b!951484 m!883677))

(declare-fun m!883747 () Bool)

(assert (=> b!951484 m!883747))

(assert (=> b!951500 m!883677))

(declare-fun m!883749 () Bool)

(assert (=> b!951500 m!883749))

(declare-fun m!883751 () Bool)

(assert (=> b!951500 m!883751))

(assert (=> b!951500 m!883749))

(declare-fun m!883753 () Bool)

(assert (=> b!951500 m!883753))

(assert (=> b!951500 m!883677))

(declare-fun m!883755 () Bool)

(assert (=> b!951500 m!883755))

(assert (=> b!951500 m!883751))

(assert (=> b!951481 m!883677))

(assert (=> b!951481 m!883677))

(assert (=> b!951481 m!883693))

(assert (=> b!951356 d!115349))

(declare-fun b!951515 () Bool)

(declare-fun e!535805 () SeekEntryResult!9152)

(declare-fun e!535804 () SeekEntryResult!9152)

(assert (=> b!951515 (= e!535805 e!535804)))

(declare-fun lt!428627 () (_ BitVec 64))

(declare-fun lt!428628 () SeekEntryResult!9152)

(assert (=> b!951515 (= lt!428627 (select (arr!27685 (_keys!10745 thiss!1141)) (index!38981 lt!428628)))))

(declare-fun c!99459 () Bool)

(assert (=> b!951515 (= c!99459 (= lt!428627 key!756))))

(declare-fun b!951517 () Bool)

(assert (=> b!951517 (= e!535805 Undefined!9152)))

(declare-fun b!951518 () Bool)

(declare-fun c!99458 () Bool)

(assert (=> b!951518 (= c!99458 (= lt!428627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535803 () SeekEntryResult!9152)

(assert (=> b!951518 (= e!535804 e!535803)))

(declare-fun b!951519 () Bool)

(declare-fun lt!428626 () SeekEntryResult!9152)

(assert (=> b!951519 (= e!535803 (ite ((_ is MissingVacant!9152) lt!428626) (MissingZero!9152 (index!38982 lt!428626)) lt!428626))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57578 (_ BitVec 32)) SeekEntryResult!9152)

(assert (=> b!951519 (= lt!428626 (seekKeyOrZeroReturnVacant!0 (x!81850 lt!428628) (index!38981 lt!428628) (index!38981 lt!428628) key!756 (_keys!10745 thiss!1141) (mask!27622 thiss!1141)))))

(declare-fun b!951520 () Bool)

(assert (=> b!951520 (= e!535803 (MissingZero!9152 (index!38981 lt!428628)))))

(declare-fun b!951516 () Bool)

(assert (=> b!951516 (= e!535804 (Found!9152 (index!38981 lt!428628)))))

(declare-fun d!115351 () Bool)

(declare-fun lt!428625 () SeekEntryResult!9152)

(assert (=> d!115351 (and (or ((_ is MissingVacant!9152) lt!428625) (not ((_ is Found!9152) lt!428625)) (and (bvsge (index!38980 lt!428625) #b00000000000000000000000000000000) (bvslt (index!38980 lt!428625) (size!28163 (_keys!10745 thiss!1141))))) (not ((_ is MissingVacant!9152) lt!428625)) (or (not ((_ is Found!9152) lt!428625)) (= (select (arr!27685 (_keys!10745 thiss!1141)) (index!38980 lt!428625)) key!756)))))

(assert (=> d!115351 (= lt!428625 e!535805)))

(declare-fun c!99457 () Bool)

(assert (=> d!115351 (= c!99457 (and ((_ is Intermediate!9152) lt!428628) (undefined!9964 lt!428628)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57578 (_ BitVec 32)) SeekEntryResult!9152)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115351 (= lt!428628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27622 thiss!1141)) key!756 (_keys!10745 thiss!1141) (mask!27622 thiss!1141)))))

(assert (=> d!115351 (validMask!0 (mask!27622 thiss!1141))))

(assert (=> d!115351 (= (seekEntry!0 key!756 (_keys!10745 thiss!1141) (mask!27622 thiss!1141)) lt!428625)))

(assert (= (and d!115351 c!99457) b!951517))

(assert (= (and d!115351 (not c!99457)) b!951515))

(assert (= (and b!951515 c!99459) b!951516))

(assert (= (and b!951515 (not c!99459)) b!951518))

(assert (= (and b!951518 c!99458) b!951520))

(assert (= (and b!951518 (not c!99458)) b!951519))

(declare-fun m!883757 () Bool)

(assert (=> b!951515 m!883757))

(declare-fun m!883759 () Bool)

(assert (=> b!951519 m!883759))

(declare-fun m!883761 () Bool)

(assert (=> d!115351 m!883761))

(declare-fun m!883763 () Bool)

(assert (=> d!115351 m!883763))

(assert (=> d!115351 m!883763))

(declare-fun m!883765 () Bool)

(assert (=> d!115351 m!883765))

(assert (=> d!115351 m!883623))

(assert (=> b!951351 d!115351))

(declare-fun d!115353 () Bool)

(assert (=> d!115353 (= (array_inv!21490 (_keys!10745 thiss!1141)) (bvsge (size!28163 (_keys!10745 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951352 d!115353))

(declare-fun d!115355 () Bool)

(assert (=> d!115355 (= (array_inv!21491 (_values!5825 thiss!1141)) (bvsge (size!28162 (_values!5825 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951352 d!115355))

(declare-fun mapNonEmpty!33093 () Bool)

(declare-fun mapRes!33093 () Bool)

(declare-fun tp!63419 () Bool)

(declare-fun e!535811 () Bool)

(assert (=> mapNonEmpty!33093 (= mapRes!33093 (and tp!63419 e!535811))))

(declare-fun mapRest!33093 () (Array (_ BitVec 32) ValueCell!9906))

(declare-fun mapValue!33093 () ValueCell!9906)

(declare-fun mapKey!33093 () (_ BitVec 32))

(assert (=> mapNonEmpty!33093 (= mapRest!33087 (store mapRest!33093 mapKey!33093 mapValue!33093))))

(declare-fun mapIsEmpty!33093 () Bool)

(assert (=> mapIsEmpty!33093 mapRes!33093))

(declare-fun b!951528 () Bool)

(declare-fun e!535810 () Bool)

(assert (=> b!951528 (= e!535810 tp_is_empty!20775)))

(declare-fun b!951527 () Bool)

(assert (=> b!951527 (= e!535811 tp_is_empty!20775)))

(declare-fun condMapEmpty!33093 () Bool)

(declare-fun mapDefault!33093 () ValueCell!9906)

(assert (=> mapNonEmpty!33087 (= condMapEmpty!33093 (= mapRest!33087 ((as const (Array (_ BitVec 32) ValueCell!9906)) mapDefault!33093)))))

(assert (=> mapNonEmpty!33087 (= tp!63410 (and e!535810 mapRes!33093))))

(assert (= (and mapNonEmpty!33087 condMapEmpty!33093) mapIsEmpty!33093))

(assert (= (and mapNonEmpty!33087 (not condMapEmpty!33093)) mapNonEmpty!33093))

(assert (= (and mapNonEmpty!33093 ((_ is ValueCellFull!9906) mapValue!33093)) b!951527))

(assert (= (and mapNonEmpty!33087 ((_ is ValueCellFull!9906) mapDefault!33093)) b!951528))

(declare-fun m!883767 () Bool)

(assert (=> mapNonEmpty!33093 m!883767))

(declare-fun b_lambda!14393 () Bool)

(assert (= b_lambda!14391 (or (and b!951352 b_free!18267) b_lambda!14393)))

(check-sat (not b!951487) (not bm!41466) (not bm!41485) (not b!951398) (not b!951396) (not b!951404) (not b!951496) (not d!115349) (not mapNonEmpty!33093) b_and!29739 (not b_lambda!14393) (not b!951481) (not bm!41486) (not b!951428) (not b_next!18267) (not b!951486) (not b!951499) (not b!951484) (not d!115351) (not d!115335) (not b!951498) (not b!951500) (not bm!41482) (not b!951410) (not b!951519) (not d!115347) (not bm!41484) (not b!951427) tp_is_empty!20775 (not b!951435) (not b!951397) (not d!115343) (not b!951415) (not b!951437))
(check-sat b_and!29739 (not b_next!18267))
