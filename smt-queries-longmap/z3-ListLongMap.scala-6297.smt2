; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80692 () Bool)

(assert start!80692)

(declare-fun b!946463 () Bool)

(declare-fun b_free!18103 () Bool)

(declare-fun b_next!18103 () Bool)

(assert (=> b!946463 (= b_free!18103 (not b_next!18103))))

(declare-fun tp!62831 () Bool)

(declare-fun b_and!29535 () Bool)

(assert (=> b!946463 (= tp!62831 b_and!29535)))

(declare-fun mapIsEmpty!32753 () Bool)

(declare-fun mapRes!32753 () Bool)

(assert (=> mapIsEmpty!32753 mapRes!32753))

(declare-fun b!946458 () Bool)

(declare-fun e!532431 () Bool)

(declare-fun e!532436 () Bool)

(assert (=> b!946458 (= e!532431 (and e!532436 mapRes!32753))))

(declare-fun condMapEmpty!32753 () Bool)

(declare-datatypes ((V!32447 0))(
  ( (V!32448 (val!10356 Int)) )
))
(declare-datatypes ((ValueCell!9824 0))(
  ( (ValueCellFull!9824 (v!12887 V!32447)) (EmptyCell!9824) )
))
(declare-datatypes ((array!57247 0))(
  ( (array!57248 (arr!27541 (Array (_ BitVec 32) ValueCell!9824)) (size!28010 (_ BitVec 32))) )
))
(declare-datatypes ((array!57249 0))(
  ( (array!57250 (arr!27542 (Array (_ BitVec 32) (_ BitVec 64))) (size!28011 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4798 0))(
  ( (LongMapFixedSize!4799 (defaultEntry!5696 Int) (mask!27410 (_ BitVec 32)) (extraKeys!5428 (_ BitVec 32)) (zeroValue!5532 V!32447) (minValue!5532 V!32447) (_size!2454 (_ BitVec 32)) (_keys!10605 array!57249) (_values!5719 array!57247) (_vacant!2454 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4798)

(declare-fun mapDefault!32753 () ValueCell!9824)

(assert (=> b!946458 (= condMapEmpty!32753 (= (arr!27541 (_values!5719 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9824)) mapDefault!32753)))))

(declare-fun mapNonEmpty!32753 () Bool)

(declare-fun tp!62830 () Bool)

(declare-fun e!532434 () Bool)

(assert (=> mapNonEmpty!32753 (= mapRes!32753 (and tp!62830 e!532434))))

(declare-fun mapKey!32753 () (_ BitVec 32))

(declare-fun mapValue!32753 () ValueCell!9824)

(declare-fun mapRest!32753 () (Array (_ BitVec 32) ValueCell!9824))

(assert (=> mapNonEmpty!32753 (= (arr!27541 (_values!5719 thiss!1141)) (store mapRest!32753 mapKey!32753 mapValue!32753))))

(declare-fun b!946459 () Bool)

(declare-fun tp_is_empty!20611 () Bool)

(assert (=> b!946459 (= e!532436 tp_is_empty!20611)))

(declare-fun res!635368 () Bool)

(declare-fun e!532435 () Bool)

(assert (=> start!80692 (=> (not res!635368) (not e!532435))))

(declare-fun valid!1839 (LongMapFixedSize!4798) Bool)

(assert (=> start!80692 (= res!635368 (valid!1839 thiss!1141))))

(assert (=> start!80692 e!532435))

(declare-fun e!532432 () Bool)

(assert (=> start!80692 e!532432))

(assert (=> start!80692 true))

(declare-fun b!946460 () Bool)

(declare-fun res!635369 () Bool)

(assert (=> b!946460 (=> (not res!635369) (not e!532435))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946460 (= res!635369 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946461 () Bool)

(assert (=> b!946461 (= e!532434 tp_is_empty!20611)))

(declare-fun b!946462 () Bool)

(declare-datatypes ((SeekEntryResult!9046 0))(
  ( (MissingZero!9046 (index!38555 (_ BitVec 32))) (Found!9046 (index!38556 (_ BitVec 32))) (Intermediate!9046 (undefined!9858 Bool) (index!38557 (_ BitVec 32)) (x!81223 (_ BitVec 32))) (Undefined!9046) (MissingVacant!9046 (index!38558 (_ BitVec 32))) )
))
(declare-fun lt!426409 () SeekEntryResult!9046)

(get-info :version)

(assert (=> b!946462 (= e!532435 (and ((_ is Found!9046) lt!426409) (bvsge (index!38556 lt!426409) #b00000000000000000000000000000000) (bvsge (index!38556 lt!426409) (size!28011 (_keys!10605 thiss!1141)))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57249 (_ BitVec 32)) SeekEntryResult!9046)

(assert (=> b!946462 (= lt!426409 (seekEntry!0 key!756 (_keys!10605 thiss!1141) (mask!27410 thiss!1141)))))

(declare-fun array_inv!21474 (array!57249) Bool)

(declare-fun array_inv!21475 (array!57247) Bool)

(assert (=> b!946463 (= e!532432 (and tp!62831 tp_is_empty!20611 (array_inv!21474 (_keys!10605 thiss!1141)) (array_inv!21475 (_values!5719 thiss!1141)) e!532431))))

(assert (= (and start!80692 res!635368) b!946460))

(assert (= (and b!946460 res!635369) b!946462))

(assert (= (and b!946458 condMapEmpty!32753) mapIsEmpty!32753))

(assert (= (and b!946458 (not condMapEmpty!32753)) mapNonEmpty!32753))

(assert (= (and mapNonEmpty!32753 ((_ is ValueCellFull!9824) mapValue!32753)) b!946461))

(assert (= (and b!946458 ((_ is ValueCellFull!9824) mapDefault!32753)) b!946459))

(assert (= b!946463 b!946458))

(assert (= start!80692 b!946463))

(declare-fun m!880613 () Bool)

(assert (=> mapNonEmpty!32753 m!880613))

(declare-fun m!880615 () Bool)

(assert (=> start!80692 m!880615))

(declare-fun m!880617 () Bool)

(assert (=> b!946462 m!880617))

(declare-fun m!880619 () Bool)

(assert (=> b!946463 m!880619))

(declare-fun m!880621 () Bool)

(assert (=> b!946463 m!880621))

(check-sat tp_is_empty!20611 b_and!29535 (not b!946462) (not start!80692) (not b_next!18103) (not mapNonEmpty!32753) (not b!946463))
(check-sat b_and!29535 (not b_next!18103))
(get-model)

(declare-fun d!114737 () Bool)

(assert (=> d!114737 (= (array_inv!21474 (_keys!10605 thiss!1141)) (bvsge (size!28011 (_keys!10605 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946463 d!114737))

(declare-fun d!114739 () Bool)

(assert (=> d!114739 (= (array_inv!21475 (_values!5719 thiss!1141)) (bvsge (size!28010 (_values!5719 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946463 d!114739))

(declare-fun d!114741 () Bool)

(declare-fun res!635388 () Bool)

(declare-fun e!532475 () Bool)

(assert (=> d!114741 (=> (not res!635388) (not e!532475))))

(declare-fun simpleValid!352 (LongMapFixedSize!4798) Bool)

(assert (=> d!114741 (= res!635388 (simpleValid!352 thiss!1141))))

(assert (=> d!114741 (= (valid!1839 thiss!1141) e!532475)))

(declare-fun b!946506 () Bool)

(declare-fun res!635389 () Bool)

(assert (=> b!946506 (=> (not res!635389) (not e!532475))))

(declare-fun arrayCountValidKeys!0 (array!57249 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946506 (= res!635389 (= (arrayCountValidKeys!0 (_keys!10605 thiss!1141) #b00000000000000000000000000000000 (size!28011 (_keys!10605 thiss!1141))) (_size!2454 thiss!1141)))))

(declare-fun b!946507 () Bool)

(declare-fun res!635390 () Bool)

(assert (=> b!946507 (=> (not res!635390) (not e!532475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57249 (_ BitVec 32)) Bool)

(assert (=> b!946507 (= res!635390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10605 thiss!1141) (mask!27410 thiss!1141)))))

(declare-fun b!946508 () Bool)

(declare-datatypes ((List!19277 0))(
  ( (Nil!19274) (Cons!19273 (h!20430 (_ BitVec 64)) (t!27590 List!19277)) )
))
(declare-fun arrayNoDuplicates!0 (array!57249 (_ BitVec 32) List!19277) Bool)

(assert (=> b!946508 (= e!532475 (arrayNoDuplicates!0 (_keys!10605 thiss!1141) #b00000000000000000000000000000000 Nil!19274))))

(assert (= (and d!114741 res!635388) b!946506))

(assert (= (and b!946506 res!635389) b!946507))

(assert (= (and b!946507 res!635390) b!946508))

(declare-fun m!880643 () Bool)

(assert (=> d!114741 m!880643))

(declare-fun m!880645 () Bool)

(assert (=> b!946506 m!880645))

(declare-fun m!880647 () Bool)

(assert (=> b!946507 m!880647))

(declare-fun m!880649 () Bool)

(assert (=> b!946508 m!880649))

(assert (=> start!80692 d!114741))

(declare-fun b!946521 () Bool)

(declare-fun e!532484 () SeekEntryResult!9046)

(assert (=> b!946521 (= e!532484 Undefined!9046)))

(declare-fun b!946522 () Bool)

(declare-fun e!532482 () SeekEntryResult!9046)

(assert (=> b!946522 (= e!532484 e!532482)))

(declare-fun lt!426424 () (_ BitVec 64))

(declare-fun lt!426425 () SeekEntryResult!9046)

(assert (=> b!946522 (= lt!426424 (select (arr!27542 (_keys!10605 thiss!1141)) (index!38557 lt!426425)))))

(declare-fun c!98718 () Bool)

(assert (=> b!946522 (= c!98718 (= lt!426424 key!756))))

(declare-fun b!946523 () Bool)

(declare-fun c!98719 () Bool)

(assert (=> b!946523 (= c!98719 (= lt!426424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532483 () SeekEntryResult!9046)

(assert (=> b!946523 (= e!532482 e!532483)))

(declare-fun d!114743 () Bool)

(declare-fun lt!426427 () SeekEntryResult!9046)

(assert (=> d!114743 (and (or ((_ is MissingVacant!9046) lt!426427) (not ((_ is Found!9046) lt!426427)) (and (bvsge (index!38556 lt!426427) #b00000000000000000000000000000000) (bvslt (index!38556 lt!426427) (size!28011 (_keys!10605 thiss!1141))))) (not ((_ is MissingVacant!9046) lt!426427)) (or (not ((_ is Found!9046) lt!426427)) (= (select (arr!27542 (_keys!10605 thiss!1141)) (index!38556 lt!426427)) key!756)))))

(assert (=> d!114743 (= lt!426427 e!532484)))

(declare-fun c!98720 () Bool)

(assert (=> d!114743 (= c!98720 (and ((_ is Intermediate!9046) lt!426425) (undefined!9858 lt!426425)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57249 (_ BitVec 32)) SeekEntryResult!9046)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114743 (= lt!426425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27410 thiss!1141)) key!756 (_keys!10605 thiss!1141) (mask!27410 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114743 (validMask!0 (mask!27410 thiss!1141))))

(assert (=> d!114743 (= (seekEntry!0 key!756 (_keys!10605 thiss!1141) (mask!27410 thiss!1141)) lt!426427)))

(declare-fun b!946524 () Bool)

(assert (=> b!946524 (= e!532482 (Found!9046 (index!38557 lt!426425)))))

(declare-fun b!946525 () Bool)

(assert (=> b!946525 (= e!532483 (MissingZero!9046 (index!38557 lt!426425)))))

(declare-fun b!946526 () Bool)

(declare-fun lt!426426 () SeekEntryResult!9046)

(assert (=> b!946526 (= e!532483 (ite ((_ is MissingVacant!9046) lt!426426) (MissingZero!9046 (index!38558 lt!426426)) lt!426426))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57249 (_ BitVec 32)) SeekEntryResult!9046)

(assert (=> b!946526 (= lt!426426 (seekKeyOrZeroReturnVacant!0 (x!81223 lt!426425) (index!38557 lt!426425) (index!38557 lt!426425) key!756 (_keys!10605 thiss!1141) (mask!27410 thiss!1141)))))

(assert (= (and d!114743 c!98720) b!946521))

(assert (= (and d!114743 (not c!98720)) b!946522))

(assert (= (and b!946522 c!98718) b!946524))

(assert (= (and b!946522 (not c!98718)) b!946523))

(assert (= (and b!946523 c!98719) b!946525))

(assert (= (and b!946523 (not c!98719)) b!946526))

(declare-fun m!880651 () Bool)

(assert (=> b!946522 m!880651))

(declare-fun m!880653 () Bool)

(assert (=> d!114743 m!880653))

(declare-fun m!880655 () Bool)

(assert (=> d!114743 m!880655))

(assert (=> d!114743 m!880655))

(declare-fun m!880657 () Bool)

(assert (=> d!114743 m!880657))

(declare-fun m!880659 () Bool)

(assert (=> d!114743 m!880659))

(declare-fun m!880661 () Bool)

(assert (=> b!946526 m!880661))

(assert (=> b!946462 d!114743))

(declare-fun condMapEmpty!32762 () Bool)

(declare-fun mapDefault!32762 () ValueCell!9824)

(assert (=> mapNonEmpty!32753 (= condMapEmpty!32762 (= mapRest!32753 ((as const (Array (_ BitVec 32) ValueCell!9824)) mapDefault!32762)))))

(declare-fun e!532490 () Bool)

(declare-fun mapRes!32762 () Bool)

(assert (=> mapNonEmpty!32753 (= tp!62830 (and e!532490 mapRes!32762))))

(declare-fun b!946533 () Bool)

(declare-fun e!532489 () Bool)

(assert (=> b!946533 (= e!532489 tp_is_empty!20611)))

(declare-fun mapNonEmpty!32762 () Bool)

(declare-fun tp!62846 () Bool)

(assert (=> mapNonEmpty!32762 (= mapRes!32762 (and tp!62846 e!532489))))

(declare-fun mapRest!32762 () (Array (_ BitVec 32) ValueCell!9824))

(declare-fun mapKey!32762 () (_ BitVec 32))

(declare-fun mapValue!32762 () ValueCell!9824)

(assert (=> mapNonEmpty!32762 (= mapRest!32753 (store mapRest!32762 mapKey!32762 mapValue!32762))))

(declare-fun b!946534 () Bool)

(assert (=> b!946534 (= e!532490 tp_is_empty!20611)))

(declare-fun mapIsEmpty!32762 () Bool)

(assert (=> mapIsEmpty!32762 mapRes!32762))

(assert (= (and mapNonEmpty!32753 condMapEmpty!32762) mapIsEmpty!32762))

(assert (= (and mapNonEmpty!32753 (not condMapEmpty!32762)) mapNonEmpty!32762))

(assert (= (and mapNonEmpty!32762 ((_ is ValueCellFull!9824) mapValue!32762)) b!946533))

(assert (= (and mapNonEmpty!32753 ((_ is ValueCellFull!9824) mapDefault!32762)) b!946534))

(declare-fun m!880663 () Bool)

(assert (=> mapNonEmpty!32762 m!880663))

(check-sat b_and!29535 (not mapNonEmpty!32762) (not b!946507) (not b!946508) (not d!114741) (not b!946526) tp_is_empty!20611 (not d!114743) (not b_next!18103) (not b!946506))
(check-sat b_and!29535 (not b_next!18103))
