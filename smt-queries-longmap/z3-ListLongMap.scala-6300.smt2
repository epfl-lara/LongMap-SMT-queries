; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80752 () Bool)

(assert start!80752)

(declare-fun b!946844 () Bool)

(declare-fun b_free!18121 () Bool)

(declare-fun b_next!18121 () Bool)

(assert (=> b!946844 (= b_free!18121 (not b_next!18121))))

(declare-fun tp!62895 () Bool)

(declare-fun b_and!29553 () Bool)

(assert (=> b!946844 (= tp!62895 b_and!29553)))

(declare-fun b!946840 () Bool)

(declare-fun e!532721 () Bool)

(declare-fun tp_is_empty!20629 () Bool)

(assert (=> b!946840 (= e!532721 tp_is_empty!20629)))

(declare-fun b!946841 () Bool)

(declare-fun res!635504 () Bool)

(declare-fun e!532726 () Bool)

(assert (=> b!946841 (=> (not res!635504) (not e!532726))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946841 (= res!635504 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!635505 () Bool)

(assert (=> start!80752 (=> (not res!635505) (not e!532726))))

(declare-datatypes ((V!32471 0))(
  ( (V!32472 (val!10365 Int)) )
))
(declare-datatypes ((ValueCell!9833 0))(
  ( (ValueCellFull!9833 (v!12896 V!32471)) (EmptyCell!9833) )
))
(declare-datatypes ((array!57289 0))(
  ( (array!57290 (arr!27559 (Array (_ BitVec 32) ValueCell!9833)) (size!28029 (_ BitVec 32))) )
))
(declare-datatypes ((array!57291 0))(
  ( (array!57292 (arr!27560 (Array (_ BitVec 32) (_ BitVec 64))) (size!28030 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4816 0))(
  ( (LongMapFixedSize!4817 (defaultEntry!5705 Int) (mask!27433 (_ BitVec 32)) (extraKeys!5437 (_ BitVec 32)) (zeroValue!5541 V!32471) (minValue!5541 V!32471) (_size!2463 (_ BitVec 32)) (_keys!10620 array!57291) (_values!5728 array!57289) (_vacant!2463 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4816)

(declare-fun valid!1846 (LongMapFixedSize!4816) Bool)

(assert (=> start!80752 (= res!635505 (valid!1846 thiss!1141))))

(assert (=> start!80752 e!532726))

(declare-fun e!532724 () Bool)

(assert (=> start!80752 e!532724))

(assert (=> start!80752 true))

(declare-fun b!946842 () Bool)

(declare-fun e!532725 () Bool)

(assert (=> b!946842 (= e!532725 tp_is_empty!20629)))

(declare-fun b!946843 () Bool)

(declare-fun e!532722 () Bool)

(declare-fun mapRes!32790 () Bool)

(assert (=> b!946843 (= e!532722 (and e!532721 mapRes!32790))))

(declare-fun condMapEmpty!32790 () Bool)

(declare-fun mapDefault!32790 () ValueCell!9833)

(assert (=> b!946843 (= condMapEmpty!32790 (= (arr!27559 (_values!5728 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9833)) mapDefault!32790)))))

(declare-fun mapNonEmpty!32790 () Bool)

(declare-fun tp!62894 () Bool)

(assert (=> mapNonEmpty!32790 (= mapRes!32790 (and tp!62894 e!532725))))

(declare-fun mapKey!32790 () (_ BitVec 32))

(declare-fun mapRest!32790 () (Array (_ BitVec 32) ValueCell!9833))

(declare-fun mapValue!32790 () ValueCell!9833)

(assert (=> mapNonEmpty!32790 (= (arr!27559 (_values!5728 thiss!1141)) (store mapRest!32790 mapKey!32790 mapValue!32790))))

(declare-fun array_inv!21486 (array!57291) Bool)

(declare-fun array_inv!21487 (array!57289) Bool)

(assert (=> b!946844 (= e!532724 (and tp!62895 tp_is_empty!20629 (array_inv!21486 (_keys!10620 thiss!1141)) (array_inv!21487 (_values!5728 thiss!1141)) e!532722))))

(declare-fun b!946845 () Bool)

(declare-fun e!532723 () Bool)

(assert (=> b!946845 (= e!532726 e!532723)))

(declare-fun res!635503 () Bool)

(assert (=> b!946845 (=> (not res!635503) (not e!532723))))

(declare-datatypes ((SeekEntryResult!9052 0))(
  ( (MissingZero!9052 (index!38579 (_ BitVec 32))) (Found!9052 (index!38580 (_ BitVec 32))) (Intermediate!9052 (undefined!9864 Bool) (index!38581 (_ BitVec 32)) (x!81286 (_ BitVec 32))) (Undefined!9052) (MissingVacant!9052 (index!38582 (_ BitVec 32))) )
))
(declare-fun lt!426505 () SeekEntryResult!9052)

(get-info :version)

(assert (=> b!946845 (= res!635503 ((_ is Found!9052) lt!426505))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57291 (_ BitVec 32)) SeekEntryResult!9052)

(assert (=> b!946845 (= lt!426505 (seekEntry!0 key!756 (_keys!10620 thiss!1141) (mask!27433 thiss!1141)))))

(declare-fun b!946846 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946846 (= e!532723 (not (validMask!0 (mask!27433 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946846 (arrayContainsKey!0 (_keys!10620 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31867 0))(
  ( (Unit!31868) )
))
(declare-fun lt!426504 () Unit!31867)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57291 (_ BitVec 64) (_ BitVec 32)) Unit!31867)

(assert (=> b!946846 (= lt!426504 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10620 thiss!1141) key!756 (index!38580 lt!426505)))))

(declare-fun mapIsEmpty!32790 () Bool)

(assert (=> mapIsEmpty!32790 mapRes!32790))

(assert (= (and start!80752 res!635505) b!946841))

(assert (= (and b!946841 res!635504) b!946845))

(assert (= (and b!946845 res!635503) b!946846))

(assert (= (and b!946843 condMapEmpty!32790) mapIsEmpty!32790))

(assert (= (and b!946843 (not condMapEmpty!32790)) mapNonEmpty!32790))

(assert (= (and mapNonEmpty!32790 ((_ is ValueCellFull!9833) mapValue!32790)) b!946842))

(assert (= (and b!946843 ((_ is ValueCellFull!9833) mapDefault!32790)) b!946840))

(assert (= b!946844 b!946843))

(assert (= start!80752 b!946844))

(declare-fun m!880817 () Bool)

(assert (=> mapNonEmpty!32790 m!880817))

(declare-fun m!880819 () Bool)

(assert (=> b!946844 m!880819))

(declare-fun m!880821 () Bool)

(assert (=> b!946844 m!880821))

(declare-fun m!880823 () Bool)

(assert (=> b!946846 m!880823))

(declare-fun m!880825 () Bool)

(assert (=> b!946846 m!880825))

(declare-fun m!880827 () Bool)

(assert (=> b!946846 m!880827))

(declare-fun m!880829 () Bool)

(assert (=> b!946845 m!880829))

(declare-fun m!880831 () Bool)

(assert (=> start!80752 m!880831))

(check-sat (not start!80752) (not b!946845) tp_is_empty!20629 b_and!29553 (not mapNonEmpty!32790) (not b!946844) (not b!946846) (not b_next!18121))
(check-sat b_and!29553 (not b_next!18121))
(get-model)

(declare-fun d!114785 () Bool)

(assert (=> d!114785 (= (array_inv!21486 (_keys!10620 thiss!1141)) (bvsge (size!28030 (_keys!10620 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946844 d!114785))

(declare-fun d!114787 () Bool)

(assert (=> d!114787 (= (array_inv!21487 (_values!5728 thiss!1141)) (bvsge (size!28029 (_values!5728 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946844 d!114787))

(declare-fun b!946901 () Bool)

(declare-fun e!532776 () SeekEntryResult!9052)

(declare-fun lt!426529 () SeekEntryResult!9052)

(assert (=> b!946901 (= e!532776 (Found!9052 (index!38581 lt!426529)))))

(declare-fun b!946902 () Bool)

(declare-fun e!532775 () SeekEntryResult!9052)

(assert (=> b!946902 (= e!532775 Undefined!9052)))

(declare-fun b!946903 () Bool)

(declare-fun e!532777 () SeekEntryResult!9052)

(declare-fun lt!426526 () SeekEntryResult!9052)

(assert (=> b!946903 (= e!532777 (ite ((_ is MissingVacant!9052) lt!426526) (MissingZero!9052 (index!38582 lt!426526)) lt!426526))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57291 (_ BitVec 32)) SeekEntryResult!9052)

(assert (=> b!946903 (= lt!426526 (seekKeyOrZeroReturnVacant!0 (x!81286 lt!426529) (index!38581 lt!426529) (index!38581 lt!426529) key!756 (_keys!10620 thiss!1141) (mask!27433 thiss!1141)))))

(declare-fun b!946904 () Bool)

(declare-fun c!98777 () Bool)

(declare-fun lt!426527 () (_ BitVec 64))

(assert (=> b!946904 (= c!98777 (= lt!426527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946904 (= e!532776 e!532777)))

(declare-fun b!946906 () Bool)

(assert (=> b!946906 (= e!532777 (MissingZero!9052 (index!38581 lt!426529)))))

(declare-fun d!114789 () Bool)

(declare-fun lt!426528 () SeekEntryResult!9052)

(assert (=> d!114789 (and (or ((_ is MissingVacant!9052) lt!426528) (not ((_ is Found!9052) lt!426528)) (and (bvsge (index!38580 lt!426528) #b00000000000000000000000000000000) (bvslt (index!38580 lt!426528) (size!28030 (_keys!10620 thiss!1141))))) (not ((_ is MissingVacant!9052) lt!426528)) (or (not ((_ is Found!9052) lt!426528)) (= (select (arr!27560 (_keys!10620 thiss!1141)) (index!38580 lt!426528)) key!756)))))

(assert (=> d!114789 (= lt!426528 e!532775)))

(declare-fun c!98775 () Bool)

(assert (=> d!114789 (= c!98775 (and ((_ is Intermediate!9052) lt!426529) (undefined!9864 lt!426529)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57291 (_ BitVec 32)) SeekEntryResult!9052)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114789 (= lt!426529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27433 thiss!1141)) key!756 (_keys!10620 thiss!1141) (mask!27433 thiss!1141)))))

(assert (=> d!114789 (validMask!0 (mask!27433 thiss!1141))))

(assert (=> d!114789 (= (seekEntry!0 key!756 (_keys!10620 thiss!1141) (mask!27433 thiss!1141)) lt!426528)))

(declare-fun b!946905 () Bool)

(assert (=> b!946905 (= e!532775 e!532776)))

(assert (=> b!946905 (= lt!426527 (select (arr!27560 (_keys!10620 thiss!1141)) (index!38581 lt!426529)))))

(declare-fun c!98776 () Bool)

(assert (=> b!946905 (= c!98776 (= lt!426527 key!756))))

(assert (= (and d!114789 c!98775) b!946902))

(assert (= (and d!114789 (not c!98775)) b!946905))

(assert (= (and b!946905 c!98776) b!946901))

(assert (= (and b!946905 (not c!98776)) b!946904))

(assert (= (and b!946904 c!98777) b!946906))

(assert (= (and b!946904 (not c!98777)) b!946903))

(declare-fun m!880865 () Bool)

(assert (=> b!946903 m!880865))

(declare-fun m!880867 () Bool)

(assert (=> d!114789 m!880867))

(declare-fun m!880869 () Bool)

(assert (=> d!114789 m!880869))

(assert (=> d!114789 m!880869))

(declare-fun m!880871 () Bool)

(assert (=> d!114789 m!880871))

(assert (=> d!114789 m!880823))

(declare-fun m!880873 () Bool)

(assert (=> b!946905 m!880873))

(assert (=> b!946845 d!114789))

(declare-fun d!114791 () Bool)

(assert (=> d!114791 (= (validMask!0 (mask!27433 thiss!1141)) (and (or (= (mask!27433 thiss!1141) #b00000000000000000000000000000111) (= (mask!27433 thiss!1141) #b00000000000000000000000000001111) (= (mask!27433 thiss!1141) #b00000000000000000000000000011111) (= (mask!27433 thiss!1141) #b00000000000000000000000000111111) (= (mask!27433 thiss!1141) #b00000000000000000000000001111111) (= (mask!27433 thiss!1141) #b00000000000000000000000011111111) (= (mask!27433 thiss!1141) #b00000000000000000000000111111111) (= (mask!27433 thiss!1141) #b00000000000000000000001111111111) (= (mask!27433 thiss!1141) #b00000000000000000000011111111111) (= (mask!27433 thiss!1141) #b00000000000000000000111111111111) (= (mask!27433 thiss!1141) #b00000000000000000001111111111111) (= (mask!27433 thiss!1141) #b00000000000000000011111111111111) (= (mask!27433 thiss!1141) #b00000000000000000111111111111111) (= (mask!27433 thiss!1141) #b00000000000000001111111111111111) (= (mask!27433 thiss!1141) #b00000000000000011111111111111111) (= (mask!27433 thiss!1141) #b00000000000000111111111111111111) (= (mask!27433 thiss!1141) #b00000000000001111111111111111111) (= (mask!27433 thiss!1141) #b00000000000011111111111111111111) (= (mask!27433 thiss!1141) #b00000000000111111111111111111111) (= (mask!27433 thiss!1141) #b00000000001111111111111111111111) (= (mask!27433 thiss!1141) #b00000000011111111111111111111111) (= (mask!27433 thiss!1141) #b00000000111111111111111111111111) (= (mask!27433 thiss!1141) #b00000001111111111111111111111111) (= (mask!27433 thiss!1141) #b00000011111111111111111111111111) (= (mask!27433 thiss!1141) #b00000111111111111111111111111111) (= (mask!27433 thiss!1141) #b00001111111111111111111111111111) (= (mask!27433 thiss!1141) #b00011111111111111111111111111111) (= (mask!27433 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27433 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946846 d!114791))

(declare-fun d!114793 () Bool)

(declare-fun res!635528 () Bool)

(declare-fun e!532782 () Bool)

(assert (=> d!114793 (=> res!635528 e!532782)))

(assert (=> d!114793 (= res!635528 (= (select (arr!27560 (_keys!10620 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114793 (= (arrayContainsKey!0 (_keys!10620 thiss!1141) key!756 #b00000000000000000000000000000000) e!532782)))

(declare-fun b!946911 () Bool)

(declare-fun e!532783 () Bool)

(assert (=> b!946911 (= e!532782 e!532783)))

(declare-fun res!635529 () Bool)

(assert (=> b!946911 (=> (not res!635529) (not e!532783))))

(assert (=> b!946911 (= res!635529 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28030 (_keys!10620 thiss!1141))))))

(declare-fun b!946912 () Bool)

(assert (=> b!946912 (= e!532783 (arrayContainsKey!0 (_keys!10620 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114793 (not res!635528)) b!946911))

(assert (= (and b!946911 res!635529) b!946912))

(declare-fun m!880875 () Bool)

(assert (=> d!114793 m!880875))

(declare-fun m!880877 () Bool)

(assert (=> b!946912 m!880877))

(assert (=> b!946846 d!114793))

(declare-fun d!114795 () Bool)

(assert (=> d!114795 (arrayContainsKey!0 (_keys!10620 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426532 () Unit!31867)

(declare-fun choose!13 (array!57291 (_ BitVec 64) (_ BitVec 32)) Unit!31867)

(assert (=> d!114795 (= lt!426532 (choose!13 (_keys!10620 thiss!1141) key!756 (index!38580 lt!426505)))))

(assert (=> d!114795 (bvsge (index!38580 lt!426505) #b00000000000000000000000000000000)))

(assert (=> d!114795 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10620 thiss!1141) key!756 (index!38580 lt!426505)) lt!426532)))

(declare-fun bs!26605 () Bool)

(assert (= bs!26605 d!114795))

(assert (=> bs!26605 m!880825))

(declare-fun m!880879 () Bool)

(assert (=> bs!26605 m!880879))

(assert (=> b!946846 d!114795))

(declare-fun d!114797 () Bool)

(declare-fun res!635536 () Bool)

(declare-fun e!532786 () Bool)

(assert (=> d!114797 (=> (not res!635536) (not e!532786))))

(declare-fun simpleValid!355 (LongMapFixedSize!4816) Bool)

(assert (=> d!114797 (= res!635536 (simpleValid!355 thiss!1141))))

(assert (=> d!114797 (= (valid!1846 thiss!1141) e!532786)))

(declare-fun b!946919 () Bool)

(declare-fun res!635537 () Bool)

(assert (=> b!946919 (=> (not res!635537) (not e!532786))))

(declare-fun arrayCountValidKeys!0 (array!57291 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946919 (= res!635537 (= (arrayCountValidKeys!0 (_keys!10620 thiss!1141) #b00000000000000000000000000000000 (size!28030 (_keys!10620 thiss!1141))) (_size!2463 thiss!1141)))))

(declare-fun b!946920 () Bool)

(declare-fun res!635538 () Bool)

(assert (=> b!946920 (=> (not res!635538) (not e!532786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57291 (_ BitVec 32)) Bool)

(assert (=> b!946920 (= res!635538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10620 thiss!1141) (mask!27433 thiss!1141)))))

(declare-fun b!946921 () Bool)

(declare-datatypes ((List!19280 0))(
  ( (Nil!19277) (Cons!19276 (h!20434 (_ BitVec 64)) (t!27593 List!19280)) )
))
(declare-fun arrayNoDuplicates!0 (array!57291 (_ BitVec 32) List!19280) Bool)

(assert (=> b!946921 (= e!532786 (arrayNoDuplicates!0 (_keys!10620 thiss!1141) #b00000000000000000000000000000000 Nil!19277))))

(assert (= (and d!114797 res!635536) b!946919))

(assert (= (and b!946919 res!635537) b!946920))

(assert (= (and b!946920 res!635538) b!946921))

(declare-fun m!880881 () Bool)

(assert (=> d!114797 m!880881))

(declare-fun m!880883 () Bool)

(assert (=> b!946919 m!880883))

(declare-fun m!880885 () Bool)

(assert (=> b!946920 m!880885))

(declare-fun m!880887 () Bool)

(assert (=> b!946921 m!880887))

(assert (=> start!80752 d!114797))

(declare-fun mapIsEmpty!32799 () Bool)

(declare-fun mapRes!32799 () Bool)

(assert (=> mapIsEmpty!32799 mapRes!32799))

(declare-fun b!946929 () Bool)

(declare-fun e!532791 () Bool)

(assert (=> b!946929 (= e!532791 tp_is_empty!20629)))

(declare-fun condMapEmpty!32799 () Bool)

(declare-fun mapDefault!32799 () ValueCell!9833)

(assert (=> mapNonEmpty!32790 (= condMapEmpty!32799 (= mapRest!32790 ((as const (Array (_ BitVec 32) ValueCell!9833)) mapDefault!32799)))))

(assert (=> mapNonEmpty!32790 (= tp!62894 (and e!532791 mapRes!32799))))

(declare-fun b!946928 () Bool)

(declare-fun e!532792 () Bool)

(assert (=> b!946928 (= e!532792 tp_is_empty!20629)))

(declare-fun mapNonEmpty!32799 () Bool)

(declare-fun tp!62910 () Bool)

(assert (=> mapNonEmpty!32799 (= mapRes!32799 (and tp!62910 e!532792))))

(declare-fun mapKey!32799 () (_ BitVec 32))

(declare-fun mapRest!32799 () (Array (_ BitVec 32) ValueCell!9833))

(declare-fun mapValue!32799 () ValueCell!9833)

(assert (=> mapNonEmpty!32799 (= mapRest!32790 (store mapRest!32799 mapKey!32799 mapValue!32799))))

(assert (= (and mapNonEmpty!32790 condMapEmpty!32799) mapIsEmpty!32799))

(assert (= (and mapNonEmpty!32790 (not condMapEmpty!32799)) mapNonEmpty!32799))

(assert (= (and mapNonEmpty!32799 ((_ is ValueCellFull!9833) mapValue!32799)) b!946928))

(assert (= (and mapNonEmpty!32790 ((_ is ValueCellFull!9833) mapDefault!32799)) b!946929))

(declare-fun m!880889 () Bool)

(assert (=> mapNonEmpty!32799 m!880889))

(check-sat (not b!946920) tp_is_empty!20629 (not b!946919) b_and!29553 (not d!114789) (not b!946921) (not d!114797) (not b!946912) (not d!114795) (not mapNonEmpty!32799) (not b!946903) (not b_next!18121))
(check-sat b_and!29553 (not b_next!18121))
