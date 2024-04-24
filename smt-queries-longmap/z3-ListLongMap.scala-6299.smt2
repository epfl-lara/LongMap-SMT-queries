; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80736 () Bool)

(assert start!80736)

(declare-fun b!946737 () Bool)

(declare-fun b_free!18115 () Bool)

(declare-fun b_next!18115 () Bool)

(assert (=> b!946737 (= b_free!18115 (not b_next!18115))))

(declare-fun tp!62873 () Bool)

(declare-fun b_and!29547 () Bool)

(assert (=> b!946737 (= tp!62873 b_and!29547)))

(declare-fun e!532634 () Bool)

(declare-datatypes ((SeekEntryResult!9049 0))(
  ( (MissingZero!9049 (index!38567 (_ BitVec 32))) (Found!9049 (index!38568 (_ BitVec 32))) (Intermediate!9049 (undefined!9861 Bool) (index!38569 (_ BitVec 32)) (x!81267 (_ BitVec 32))) (Undefined!9049) (MissingVacant!9049 (index!38570 (_ BitVec 32))) )
))
(declare-fun lt!426481 () SeekEntryResult!9049)

(declare-datatypes ((V!32463 0))(
  ( (V!32464 (val!10362 Int)) )
))
(declare-datatypes ((ValueCell!9830 0))(
  ( (ValueCellFull!9830 (v!12893 V!32463)) (EmptyCell!9830) )
))
(declare-datatypes ((array!57275 0))(
  ( (array!57276 (arr!27553 (Array (_ BitVec 32) ValueCell!9830)) (size!28023 (_ BitVec 32))) )
))
(declare-datatypes ((array!57277 0))(
  ( (array!57278 (arr!27554 (Array (_ BitVec 32) (_ BitVec 64))) (size!28024 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4810 0))(
  ( (LongMapFixedSize!4811 (defaultEntry!5702 Int) (mask!27427 (_ BitVec 32)) (extraKeys!5434 (_ BitVec 32)) (zeroValue!5538 V!32463) (minValue!5538 V!32463) (_size!2460 (_ BitVec 32)) (_keys!10616 array!57277) (_values!5725 array!57275) (_vacant!2460 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4810)

(declare-fun b!946736 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946736 (= e!532634 (not (arrayContainsKey!0 (_keys!10616 thiss!1141) key!756 (index!38568 lt!426481))))))

(declare-fun mapIsEmpty!32778 () Bool)

(declare-fun mapRes!32778 () Bool)

(assert (=> mapIsEmpty!32778 mapRes!32778))

(declare-fun e!532638 () Bool)

(declare-fun e!532639 () Bool)

(declare-fun tp_is_empty!20623 () Bool)

(declare-fun array_inv!21482 (array!57277) Bool)

(declare-fun array_inv!21483 (array!57275) Bool)

(assert (=> b!946737 (= e!532638 (and tp!62873 tp_is_empty!20623 (array_inv!21482 (_keys!10616 thiss!1141)) (array_inv!21483 (_values!5725 thiss!1141)) e!532639))))

(declare-fun b!946738 () Bool)

(declare-fun res!635461 () Bool)

(declare-fun e!532633 () Bool)

(assert (=> b!946738 (=> (not res!635461) (not e!532633))))

(assert (=> b!946738 (= res!635461 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946739 () Bool)

(declare-fun e!532637 () Bool)

(assert (=> b!946739 (= e!532639 (and e!532637 mapRes!32778))))

(declare-fun condMapEmpty!32778 () Bool)

(declare-fun mapDefault!32778 () ValueCell!9830)

(assert (=> b!946739 (= condMapEmpty!32778 (= (arr!27553 (_values!5725 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9830)) mapDefault!32778)))))

(declare-fun res!635463 () Bool)

(assert (=> start!80736 (=> (not res!635463) (not e!532633))))

(declare-fun valid!1843 (LongMapFixedSize!4810) Bool)

(assert (=> start!80736 (= res!635463 (valid!1843 thiss!1141))))

(assert (=> start!80736 e!532633))

(assert (=> start!80736 e!532638))

(assert (=> start!80736 true))

(declare-fun b!946740 () Bool)

(assert (=> b!946740 (= e!532637 tp_is_empty!20623)))

(declare-fun mapNonEmpty!32778 () Bool)

(declare-fun tp!62874 () Bool)

(declare-fun e!532636 () Bool)

(assert (=> mapNonEmpty!32778 (= mapRes!32778 (and tp!62874 e!532636))))

(declare-fun mapKey!32778 () (_ BitVec 32))

(declare-fun mapRest!32778 () (Array (_ BitVec 32) ValueCell!9830))

(declare-fun mapValue!32778 () ValueCell!9830)

(assert (=> mapNonEmpty!32778 (= (arr!27553 (_values!5725 thiss!1141)) (store mapRest!32778 mapKey!32778 mapValue!32778))))

(declare-fun b!946741 () Bool)

(assert (=> b!946741 (= e!532636 tp_is_empty!20623)))

(declare-fun b!946742 () Bool)

(assert (=> b!946742 (= e!532633 e!532634)))

(declare-fun res!635462 () Bool)

(assert (=> b!946742 (=> (not res!635462) (not e!532634))))

(get-info :version)

(assert (=> b!946742 (= res!635462 (and ((_ is Found!9049) lt!426481) (bvsge (index!38568 lt!426481) #b00000000000000000000000000000000) (bvslt (index!38568 lt!426481) (size!28024 (_keys!10616 thiss!1141))) (bvslt (size!28024 (_keys!10616 thiss!1141)) #b01111111111111111111111111111111)))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57277 (_ BitVec 32)) SeekEntryResult!9049)

(assert (=> b!946742 (= lt!426481 (seekEntry!0 key!756 (_keys!10616 thiss!1141) (mask!27427 thiss!1141)))))

(assert (= (and start!80736 res!635463) b!946738))

(assert (= (and b!946738 res!635461) b!946742))

(assert (= (and b!946742 res!635462) b!946736))

(assert (= (and b!946739 condMapEmpty!32778) mapIsEmpty!32778))

(assert (= (and b!946739 (not condMapEmpty!32778)) mapNonEmpty!32778))

(assert (= (and mapNonEmpty!32778 ((_ is ValueCellFull!9830) mapValue!32778)) b!946741))

(assert (= (and b!946739 ((_ is ValueCellFull!9830) mapDefault!32778)) b!946740))

(assert (= b!946737 b!946739))

(assert (= start!80736 b!946737))

(declare-fun m!880755 () Bool)

(assert (=> b!946737 m!880755))

(declare-fun m!880757 () Bool)

(assert (=> b!946737 m!880757))

(declare-fun m!880759 () Bool)

(assert (=> b!946736 m!880759))

(declare-fun m!880761 () Bool)

(assert (=> mapNonEmpty!32778 m!880761))

(declare-fun m!880763 () Bool)

(assert (=> b!946742 m!880763))

(declare-fun m!880765 () Bool)

(assert (=> start!80736 m!880765))

(check-sat (not b!946736) (not b!946742) (not start!80736) (not mapNonEmpty!32778) (not b_next!18115) b_and!29547 (not b!946737) tp_is_empty!20623)
(check-sat b_and!29547 (not b_next!18115))
(get-model)

(declare-fun d!114773 () Bool)

(declare-fun res!635486 () Bool)

(declare-fun e!532686 () Bool)

(assert (=> d!114773 (=> res!635486 e!532686)))

(assert (=> d!114773 (= res!635486 (= (select (arr!27554 (_keys!10616 thiss!1141)) (index!38568 lt!426481)) key!756))))

(assert (=> d!114773 (= (arrayContainsKey!0 (_keys!10616 thiss!1141) key!756 (index!38568 lt!426481)) e!532686)))

(declare-fun b!946789 () Bool)

(declare-fun e!532687 () Bool)

(assert (=> b!946789 (= e!532686 e!532687)))

(declare-fun res!635487 () Bool)

(assert (=> b!946789 (=> (not res!635487) (not e!532687))))

(assert (=> b!946789 (= res!635487 (bvslt (bvadd (index!38568 lt!426481) #b00000000000000000000000000000001) (size!28024 (_keys!10616 thiss!1141))))))

(declare-fun b!946790 () Bool)

(assert (=> b!946790 (= e!532687 (arrayContainsKey!0 (_keys!10616 thiss!1141) key!756 (bvadd (index!38568 lt!426481) #b00000000000000000000000000000001)))))

(assert (= (and d!114773 (not res!635486)) b!946789))

(assert (= (and b!946789 res!635487) b!946790))

(declare-fun m!880791 () Bool)

(assert (=> d!114773 m!880791))

(declare-fun m!880793 () Bool)

(assert (=> b!946790 m!880793))

(assert (=> b!946736 d!114773))

(declare-fun d!114775 () Bool)

(assert (=> d!114775 (= (array_inv!21482 (_keys!10616 thiss!1141)) (bvsge (size!28024 (_keys!10616 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946737 d!114775))

(declare-fun d!114777 () Bool)

(assert (=> d!114777 (= (array_inv!21483 (_values!5725 thiss!1141)) (bvsge (size!28023 (_values!5725 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946737 d!114777))

(declare-fun d!114779 () Bool)

(declare-fun res!635494 () Bool)

(declare-fun e!532690 () Bool)

(assert (=> d!114779 (=> (not res!635494) (not e!532690))))

(declare-fun simpleValid!354 (LongMapFixedSize!4810) Bool)

(assert (=> d!114779 (= res!635494 (simpleValid!354 thiss!1141))))

(assert (=> d!114779 (= (valid!1843 thiss!1141) e!532690)))

(declare-fun b!946797 () Bool)

(declare-fun res!635495 () Bool)

(assert (=> b!946797 (=> (not res!635495) (not e!532690))))

(declare-fun arrayCountValidKeys!0 (array!57277 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946797 (= res!635495 (= (arrayCountValidKeys!0 (_keys!10616 thiss!1141) #b00000000000000000000000000000000 (size!28024 (_keys!10616 thiss!1141))) (_size!2460 thiss!1141)))))

(declare-fun b!946798 () Bool)

(declare-fun res!635496 () Bool)

(assert (=> b!946798 (=> (not res!635496) (not e!532690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57277 (_ BitVec 32)) Bool)

(assert (=> b!946798 (= res!635496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10616 thiss!1141) (mask!27427 thiss!1141)))))

(declare-fun b!946799 () Bool)

(declare-datatypes ((List!19279 0))(
  ( (Nil!19276) (Cons!19275 (h!20433 (_ BitVec 64)) (t!27592 List!19279)) )
))
(declare-fun arrayNoDuplicates!0 (array!57277 (_ BitVec 32) List!19279) Bool)

(assert (=> b!946799 (= e!532690 (arrayNoDuplicates!0 (_keys!10616 thiss!1141) #b00000000000000000000000000000000 Nil!19276))))

(assert (= (and d!114779 res!635494) b!946797))

(assert (= (and b!946797 res!635495) b!946798))

(assert (= (and b!946798 res!635496) b!946799))

(declare-fun m!880795 () Bool)

(assert (=> d!114779 m!880795))

(declare-fun m!880797 () Bool)

(assert (=> b!946797 m!880797))

(declare-fun m!880799 () Bool)

(assert (=> b!946798 m!880799))

(declare-fun m!880801 () Bool)

(assert (=> b!946799 m!880801))

(assert (=> start!80736 d!114779))

(declare-fun b!946812 () Bool)

(declare-fun c!98768 () Bool)

(declare-fun lt!426498 () (_ BitVec 64))

(assert (=> b!946812 (= c!98768 (= lt!426498 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532699 () SeekEntryResult!9049)

(declare-fun e!532698 () SeekEntryResult!9049)

(assert (=> b!946812 (= e!532699 e!532698)))

(declare-fun d!114781 () Bool)

(declare-fun lt!426499 () SeekEntryResult!9049)

(assert (=> d!114781 (and (or ((_ is MissingVacant!9049) lt!426499) (not ((_ is Found!9049) lt!426499)) (and (bvsge (index!38568 lt!426499) #b00000000000000000000000000000000) (bvslt (index!38568 lt!426499) (size!28024 (_keys!10616 thiss!1141))))) (not ((_ is MissingVacant!9049) lt!426499)) (or (not ((_ is Found!9049) lt!426499)) (= (select (arr!27554 (_keys!10616 thiss!1141)) (index!38568 lt!426499)) key!756)))))

(declare-fun e!532697 () SeekEntryResult!9049)

(assert (=> d!114781 (= lt!426499 e!532697)))

(declare-fun c!98767 () Bool)

(declare-fun lt!426497 () SeekEntryResult!9049)

(assert (=> d!114781 (= c!98767 (and ((_ is Intermediate!9049) lt!426497) (undefined!9861 lt!426497)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57277 (_ BitVec 32)) SeekEntryResult!9049)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114781 (= lt!426497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27427 thiss!1141)) key!756 (_keys!10616 thiss!1141) (mask!27427 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114781 (validMask!0 (mask!27427 thiss!1141))))

(assert (=> d!114781 (= (seekEntry!0 key!756 (_keys!10616 thiss!1141) (mask!27427 thiss!1141)) lt!426499)))

(declare-fun b!946813 () Bool)

(assert (=> b!946813 (= e!532699 (Found!9049 (index!38569 lt!426497)))))

(declare-fun b!946814 () Bool)

(declare-fun lt!426496 () SeekEntryResult!9049)

(assert (=> b!946814 (= e!532698 (ite ((_ is MissingVacant!9049) lt!426496) (MissingZero!9049 (index!38570 lt!426496)) lt!426496))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57277 (_ BitVec 32)) SeekEntryResult!9049)

(assert (=> b!946814 (= lt!426496 (seekKeyOrZeroReturnVacant!0 (x!81267 lt!426497) (index!38569 lt!426497) (index!38569 lt!426497) key!756 (_keys!10616 thiss!1141) (mask!27427 thiss!1141)))))

(declare-fun b!946815 () Bool)

(assert (=> b!946815 (= e!532697 e!532699)))

(assert (=> b!946815 (= lt!426498 (select (arr!27554 (_keys!10616 thiss!1141)) (index!38569 lt!426497)))))

(declare-fun c!98766 () Bool)

(assert (=> b!946815 (= c!98766 (= lt!426498 key!756))))

(declare-fun b!946816 () Bool)

(assert (=> b!946816 (= e!532698 (MissingZero!9049 (index!38569 lt!426497)))))

(declare-fun b!946817 () Bool)

(assert (=> b!946817 (= e!532697 Undefined!9049)))

(assert (= (and d!114781 c!98767) b!946817))

(assert (= (and d!114781 (not c!98767)) b!946815))

(assert (= (and b!946815 c!98766) b!946813))

(assert (= (and b!946815 (not c!98766)) b!946812))

(assert (= (and b!946812 c!98768) b!946816))

(assert (= (and b!946812 (not c!98768)) b!946814))

(declare-fun m!880803 () Bool)

(assert (=> d!114781 m!880803))

(declare-fun m!880805 () Bool)

(assert (=> d!114781 m!880805))

(assert (=> d!114781 m!880805))

(declare-fun m!880807 () Bool)

(assert (=> d!114781 m!880807))

(declare-fun m!880809 () Bool)

(assert (=> d!114781 m!880809))

(declare-fun m!880811 () Bool)

(assert (=> b!946814 m!880811))

(declare-fun m!880813 () Bool)

(assert (=> b!946815 m!880813))

(assert (=> b!946742 d!114781))

(declare-fun condMapEmpty!32787 () Bool)

(declare-fun mapDefault!32787 () ValueCell!9830)

(assert (=> mapNonEmpty!32778 (= condMapEmpty!32787 (= mapRest!32778 ((as const (Array (_ BitVec 32) ValueCell!9830)) mapDefault!32787)))))

(declare-fun e!532704 () Bool)

(declare-fun mapRes!32787 () Bool)

(assert (=> mapNonEmpty!32778 (= tp!62874 (and e!532704 mapRes!32787))))

(declare-fun b!946825 () Bool)

(assert (=> b!946825 (= e!532704 tp_is_empty!20623)))

(declare-fun mapIsEmpty!32787 () Bool)

(assert (=> mapIsEmpty!32787 mapRes!32787))

(declare-fun mapNonEmpty!32787 () Bool)

(declare-fun tp!62889 () Bool)

(declare-fun e!532705 () Bool)

(assert (=> mapNonEmpty!32787 (= mapRes!32787 (and tp!62889 e!532705))))

(declare-fun mapRest!32787 () (Array (_ BitVec 32) ValueCell!9830))

(declare-fun mapKey!32787 () (_ BitVec 32))

(declare-fun mapValue!32787 () ValueCell!9830)

(assert (=> mapNonEmpty!32787 (= mapRest!32778 (store mapRest!32787 mapKey!32787 mapValue!32787))))

(declare-fun b!946824 () Bool)

(assert (=> b!946824 (= e!532705 tp_is_empty!20623)))

(assert (= (and mapNonEmpty!32778 condMapEmpty!32787) mapIsEmpty!32787))

(assert (= (and mapNonEmpty!32778 (not condMapEmpty!32787)) mapNonEmpty!32787))

(assert (= (and mapNonEmpty!32787 ((_ is ValueCellFull!9830) mapValue!32787)) b!946824))

(assert (= (and mapNonEmpty!32778 ((_ is ValueCellFull!9830) mapDefault!32787)) b!946825))

(declare-fun m!880815 () Bool)

(assert (=> mapNonEmpty!32787 m!880815))

(check-sat tp_is_empty!20623 (not b!946799) (not b!946797) (not b!946790) (not mapNonEmpty!32787) (not b!946814) (not d!114779) (not b!946798) (not b_next!18115) b_and!29547 (not d!114781))
(check-sat b_and!29547 (not b_next!18115))
