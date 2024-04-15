; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80550 () Bool)

(assert start!80550)

(declare-fun b!945594 () Bool)

(declare-fun b_free!18115 () Bool)

(declare-fun b_next!18115 () Bool)

(assert (=> b!945594 (= b_free!18115 (not b_next!18115))))

(declare-fun tp!62873 () Bool)

(declare-fun b_and!29511 () Bool)

(assert (=> b!945594 (= tp!62873 b_and!29511)))

(declare-fun e!531908 () Bool)

(declare-datatypes ((V!32463 0))(
  ( (V!32464 (val!10362 Int)) )
))
(declare-datatypes ((ValueCell!9830 0))(
  ( (ValueCellFull!9830 (v!12895 V!32463)) (EmptyCell!9830) )
))
(declare-datatypes ((array!57189 0))(
  ( (array!57190 (arr!27515 (Array (_ BitVec 32) ValueCell!9830)) (size!27986 (_ BitVec 32))) )
))
(declare-datatypes ((array!57191 0))(
  ( (array!57192 (arr!27516 (Array (_ BitVec 32) (_ BitVec 64))) (size!27987 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4810 0))(
  ( (LongMapFixedSize!4811 (defaultEntry!5702 Int) (mask!27377 (_ BitVec 32)) (extraKeys!5434 (_ BitVec 32)) (zeroValue!5538 V!32463) (minValue!5538 V!32463) (_size!2460 (_ BitVec 32)) (_keys!10583 array!57191) (_values!5725 array!57189) (_vacant!2460 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4810)

(declare-fun e!531909 () Bool)

(declare-fun tp_is_empty!20623 () Bool)

(declare-fun array_inv!21426 (array!57191) Bool)

(declare-fun array_inv!21427 (array!57189) Bool)

(assert (=> b!945594 (= e!531909 (and tp!62873 tp_is_empty!20623 (array_inv!21426 (_keys!10583 thiss!1141)) (array_inv!21427 (_values!5725 thiss!1141)) e!531908))))

(declare-fun e!531905 () Bool)

(declare-fun b!945595 () Bool)

(declare-datatypes ((SeekEntryResult!9088 0))(
  ( (MissingZero!9088 (index!38723 (_ BitVec 32))) (Found!9088 (index!38724 (_ BitVec 32))) (Intermediate!9088 (undefined!9900 Bool) (index!38725 (_ BitVec 32)) (x!81287 (_ BitVec 32))) (Undefined!9088) (MissingVacant!9088 (index!38726 (_ BitVec 32))) )
))
(declare-fun lt!425884 () SeekEntryResult!9088)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945595 (= e!531905 (not (arrayContainsKey!0 (_keys!10583 thiss!1141) key!756 (index!38724 lt!425884))))))

(declare-fun b!945596 () Bool)

(declare-fun e!531904 () Bool)

(assert (=> b!945596 (= e!531904 tp_is_empty!20623)))

(declare-fun mapNonEmpty!32778 () Bool)

(declare-fun mapRes!32778 () Bool)

(declare-fun tp!62874 () Bool)

(declare-fun e!531903 () Bool)

(assert (=> mapNonEmpty!32778 (= mapRes!32778 (and tp!62874 e!531903))))

(declare-fun mapRest!32778 () (Array (_ BitVec 32) ValueCell!9830))

(declare-fun mapKey!32778 () (_ BitVec 32))

(declare-fun mapValue!32778 () ValueCell!9830)

(assert (=> mapNonEmpty!32778 (= (arr!27515 (_values!5725 thiss!1141)) (store mapRest!32778 mapKey!32778 mapValue!32778))))

(declare-fun b!945597 () Bool)

(assert (=> b!945597 (= e!531908 (and e!531904 mapRes!32778))))

(declare-fun condMapEmpty!32778 () Bool)

(declare-fun mapDefault!32778 () ValueCell!9830)

(assert (=> b!945597 (= condMapEmpty!32778 (= (arr!27515 (_values!5725 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9830)) mapDefault!32778)))))

(declare-fun res!635009 () Bool)

(declare-fun e!531906 () Bool)

(assert (=> start!80550 (=> (not res!635009) (not e!531906))))

(declare-fun valid!1839 (LongMapFixedSize!4810) Bool)

(assert (=> start!80550 (= res!635009 (valid!1839 thiss!1141))))

(assert (=> start!80550 e!531906))

(assert (=> start!80550 e!531909))

(assert (=> start!80550 true))

(declare-fun b!945598 () Bool)

(declare-fun res!635008 () Bool)

(assert (=> b!945598 (=> (not res!635008) (not e!531906))))

(assert (=> b!945598 (= res!635008 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945599 () Bool)

(assert (=> b!945599 (= e!531906 e!531905)))

(declare-fun res!635007 () Bool)

(assert (=> b!945599 (=> (not res!635007) (not e!531905))))

(get-info :version)

(assert (=> b!945599 (= res!635007 (and ((_ is Found!9088) lt!425884) (bvsge (index!38724 lt!425884) #b00000000000000000000000000000000) (bvslt (index!38724 lt!425884) (size!27987 (_keys!10583 thiss!1141))) (bvslt (size!27987 (_keys!10583 thiss!1141)) #b01111111111111111111111111111111)))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57191 (_ BitVec 32)) SeekEntryResult!9088)

(assert (=> b!945599 (= lt!425884 (seekEntry!0 key!756 (_keys!10583 thiss!1141) (mask!27377 thiss!1141)))))

(declare-fun mapIsEmpty!32778 () Bool)

(assert (=> mapIsEmpty!32778 mapRes!32778))

(declare-fun b!945600 () Bool)

(assert (=> b!945600 (= e!531903 tp_is_empty!20623)))

(assert (= (and start!80550 res!635009) b!945598))

(assert (= (and b!945598 res!635008) b!945599))

(assert (= (and b!945599 res!635007) b!945595))

(assert (= (and b!945597 condMapEmpty!32778) mapIsEmpty!32778))

(assert (= (and b!945597 (not condMapEmpty!32778)) mapNonEmpty!32778))

(assert (= (and mapNonEmpty!32778 ((_ is ValueCellFull!9830) mapValue!32778)) b!945600))

(assert (= (and b!945597 ((_ is ValueCellFull!9830) mapDefault!32778)) b!945596))

(assert (= b!945594 b!945597))

(assert (= start!80550 b!945594))

(declare-fun m!878703 () Bool)

(assert (=> start!80550 m!878703))

(declare-fun m!878705 () Bool)

(assert (=> b!945594 m!878705))

(declare-fun m!878707 () Bool)

(assert (=> b!945594 m!878707))

(declare-fun m!878709 () Bool)

(assert (=> b!945595 m!878709))

(declare-fun m!878711 () Bool)

(assert (=> mapNonEmpty!32778 m!878711))

(declare-fun m!878713 () Bool)

(assert (=> b!945599 m!878713))

(check-sat (not b!945599) (not b!945594) (not start!80550) (not mapNonEmpty!32778) tp_is_empty!20623 (not b_next!18115) b_and!29511 (not b!945595))
(check-sat b_and!29511 (not b_next!18115))
(get-model)

(declare-fun d!114253 () Bool)

(declare-fun res!635034 () Bool)

(declare-fun e!531954 () Bool)

(assert (=> d!114253 (=> (not res!635034) (not e!531954))))

(declare-fun simpleValid!354 (LongMapFixedSize!4810) Bool)

(assert (=> d!114253 (= res!635034 (simpleValid!354 thiss!1141))))

(assert (=> d!114253 (= (valid!1839 thiss!1141) e!531954)))

(declare-fun b!945649 () Bool)

(declare-fun res!635035 () Bool)

(assert (=> b!945649 (=> (not res!635035) (not e!531954))))

(declare-fun arrayCountValidKeys!0 (array!57191 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945649 (= res!635035 (= (arrayCountValidKeys!0 (_keys!10583 thiss!1141) #b00000000000000000000000000000000 (size!27987 (_keys!10583 thiss!1141))) (_size!2460 thiss!1141)))))

(declare-fun b!945650 () Bool)

(declare-fun res!635036 () Bool)

(assert (=> b!945650 (=> (not res!635036) (not e!531954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57191 (_ BitVec 32)) Bool)

(assert (=> b!945650 (= res!635036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10583 thiss!1141) (mask!27377 thiss!1141)))))

(declare-fun b!945651 () Bool)

(declare-datatypes ((List!19299 0))(
  ( (Nil!19296) (Cons!19295 (h!20447 (_ BitVec 64)) (t!27611 List!19299)) )
))
(declare-fun arrayNoDuplicates!0 (array!57191 (_ BitVec 32) List!19299) Bool)

(assert (=> b!945651 (= e!531954 (arrayNoDuplicates!0 (_keys!10583 thiss!1141) #b00000000000000000000000000000000 Nil!19296))))

(assert (= (and d!114253 res!635034) b!945649))

(assert (= (and b!945649 res!635035) b!945650))

(assert (= (and b!945650 res!635036) b!945651))

(declare-fun m!878739 () Bool)

(assert (=> d!114253 m!878739))

(declare-fun m!878741 () Bool)

(assert (=> b!945649 m!878741))

(declare-fun m!878743 () Bool)

(assert (=> b!945650 m!878743))

(declare-fun m!878745 () Bool)

(assert (=> b!945651 m!878745))

(assert (=> start!80550 d!114253))

(declare-fun d!114255 () Bool)

(declare-fun res!635041 () Bool)

(declare-fun e!531959 () Bool)

(assert (=> d!114255 (=> res!635041 e!531959)))

(assert (=> d!114255 (= res!635041 (= (select (arr!27516 (_keys!10583 thiss!1141)) (index!38724 lt!425884)) key!756))))

(assert (=> d!114255 (= (arrayContainsKey!0 (_keys!10583 thiss!1141) key!756 (index!38724 lt!425884)) e!531959)))

(declare-fun b!945656 () Bool)

(declare-fun e!531960 () Bool)

(assert (=> b!945656 (= e!531959 e!531960)))

(declare-fun res!635042 () Bool)

(assert (=> b!945656 (=> (not res!635042) (not e!531960))))

(assert (=> b!945656 (= res!635042 (bvslt (bvadd (index!38724 lt!425884) #b00000000000000000000000000000001) (size!27987 (_keys!10583 thiss!1141))))))

(declare-fun b!945657 () Bool)

(assert (=> b!945657 (= e!531960 (arrayContainsKey!0 (_keys!10583 thiss!1141) key!756 (bvadd (index!38724 lt!425884) #b00000000000000000000000000000001)))))

(assert (= (and d!114255 (not res!635041)) b!945656))

(assert (= (and b!945656 res!635042) b!945657))

(declare-fun m!878747 () Bool)

(assert (=> d!114255 m!878747))

(declare-fun m!878749 () Bool)

(assert (=> b!945657 m!878749))

(assert (=> b!945595 d!114255))

(declare-fun b!945670 () Bool)

(declare-fun e!531969 () SeekEntryResult!9088)

(declare-fun lt!425901 () SeekEntryResult!9088)

(assert (=> b!945670 (= e!531969 (ite ((_ is MissingVacant!9088) lt!425901) (MissingZero!9088 (index!38726 lt!425901)) lt!425901))))

(declare-fun lt!425902 () SeekEntryResult!9088)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57191 (_ BitVec 32)) SeekEntryResult!9088)

(assert (=> b!945670 (= lt!425901 (seekKeyOrZeroReturnVacant!0 (x!81287 lt!425902) (index!38725 lt!425902) (index!38725 lt!425902) key!756 (_keys!10583 thiss!1141) (mask!27377 thiss!1141)))))

(declare-fun b!945671 () Bool)

(declare-fun e!531967 () SeekEntryResult!9088)

(declare-fun e!531968 () SeekEntryResult!9088)

(assert (=> b!945671 (= e!531967 e!531968)))

(declare-fun lt!425899 () (_ BitVec 64))

(assert (=> b!945671 (= lt!425899 (select (arr!27516 (_keys!10583 thiss!1141)) (index!38725 lt!425902)))))

(declare-fun c!98421 () Bool)

(assert (=> b!945671 (= c!98421 (= lt!425899 key!756))))

(declare-fun b!945672 () Bool)

(assert (=> b!945672 (= e!531967 Undefined!9088)))

(declare-fun d!114257 () Bool)

(declare-fun lt!425900 () SeekEntryResult!9088)

(assert (=> d!114257 (and (or ((_ is MissingVacant!9088) lt!425900) (not ((_ is Found!9088) lt!425900)) (and (bvsge (index!38724 lt!425900) #b00000000000000000000000000000000) (bvslt (index!38724 lt!425900) (size!27987 (_keys!10583 thiss!1141))))) (not ((_ is MissingVacant!9088) lt!425900)) (or (not ((_ is Found!9088) lt!425900)) (= (select (arr!27516 (_keys!10583 thiss!1141)) (index!38724 lt!425900)) key!756)))))

(assert (=> d!114257 (= lt!425900 e!531967)))

(declare-fun c!98419 () Bool)

(assert (=> d!114257 (= c!98419 (and ((_ is Intermediate!9088) lt!425902) (undefined!9900 lt!425902)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57191 (_ BitVec 32)) SeekEntryResult!9088)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114257 (= lt!425902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27377 thiss!1141)) key!756 (_keys!10583 thiss!1141) (mask!27377 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114257 (validMask!0 (mask!27377 thiss!1141))))

(assert (=> d!114257 (= (seekEntry!0 key!756 (_keys!10583 thiss!1141) (mask!27377 thiss!1141)) lt!425900)))

(declare-fun b!945673 () Bool)

(assert (=> b!945673 (= e!531968 (Found!9088 (index!38725 lt!425902)))))

(declare-fun b!945674 () Bool)

(declare-fun c!98420 () Bool)

(assert (=> b!945674 (= c!98420 (= lt!425899 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!945674 (= e!531968 e!531969)))

(declare-fun b!945675 () Bool)

(assert (=> b!945675 (= e!531969 (MissingZero!9088 (index!38725 lt!425902)))))

(assert (= (and d!114257 c!98419) b!945672))

(assert (= (and d!114257 (not c!98419)) b!945671))

(assert (= (and b!945671 c!98421) b!945673))

(assert (= (and b!945671 (not c!98421)) b!945674))

(assert (= (and b!945674 c!98420) b!945675))

(assert (= (and b!945674 (not c!98420)) b!945670))

(declare-fun m!878751 () Bool)

(assert (=> b!945670 m!878751))

(declare-fun m!878753 () Bool)

(assert (=> b!945671 m!878753))

(declare-fun m!878755 () Bool)

(assert (=> d!114257 m!878755))

(declare-fun m!878757 () Bool)

(assert (=> d!114257 m!878757))

(assert (=> d!114257 m!878757))

(declare-fun m!878759 () Bool)

(assert (=> d!114257 m!878759))

(declare-fun m!878761 () Bool)

(assert (=> d!114257 m!878761))

(assert (=> b!945599 d!114257))

(declare-fun d!114259 () Bool)

(assert (=> d!114259 (= (array_inv!21426 (_keys!10583 thiss!1141)) (bvsge (size!27987 (_keys!10583 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945594 d!114259))

(declare-fun d!114261 () Bool)

(assert (=> d!114261 (= (array_inv!21427 (_values!5725 thiss!1141)) (bvsge (size!27986 (_values!5725 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945594 d!114261))

(declare-fun mapNonEmpty!32787 () Bool)

(declare-fun mapRes!32787 () Bool)

(declare-fun tp!62889 () Bool)

(declare-fun e!531974 () Bool)

(assert (=> mapNonEmpty!32787 (= mapRes!32787 (and tp!62889 e!531974))))

(declare-fun mapKey!32787 () (_ BitVec 32))

(declare-fun mapRest!32787 () (Array (_ BitVec 32) ValueCell!9830))

(declare-fun mapValue!32787 () ValueCell!9830)

(assert (=> mapNonEmpty!32787 (= mapRest!32778 (store mapRest!32787 mapKey!32787 mapValue!32787))))

(declare-fun b!945683 () Bool)

(declare-fun e!531975 () Bool)

(assert (=> b!945683 (= e!531975 tp_is_empty!20623)))

(declare-fun mapIsEmpty!32787 () Bool)

(assert (=> mapIsEmpty!32787 mapRes!32787))

(declare-fun b!945682 () Bool)

(assert (=> b!945682 (= e!531974 tp_is_empty!20623)))

(declare-fun condMapEmpty!32787 () Bool)

(declare-fun mapDefault!32787 () ValueCell!9830)

(assert (=> mapNonEmpty!32778 (= condMapEmpty!32787 (= mapRest!32778 ((as const (Array (_ BitVec 32) ValueCell!9830)) mapDefault!32787)))))

(assert (=> mapNonEmpty!32778 (= tp!62874 (and e!531975 mapRes!32787))))

(assert (= (and mapNonEmpty!32778 condMapEmpty!32787) mapIsEmpty!32787))

(assert (= (and mapNonEmpty!32778 (not condMapEmpty!32787)) mapNonEmpty!32787))

(assert (= (and mapNonEmpty!32787 ((_ is ValueCellFull!9830) mapValue!32787)) b!945682))

(assert (= (and mapNonEmpty!32778 ((_ is ValueCellFull!9830) mapDefault!32787)) b!945683))

(declare-fun m!878763 () Bool)

(assert (=> mapNonEmpty!32787 m!878763))

(check-sat (not b!945649) (not b!945670) tp_is_empty!20623 (not b_next!18115) (not b!945657) (not d!114253) b_and!29511 (not b!945651) (not b!945650) (not d!114257) (not mapNonEmpty!32787))
(check-sat b_and!29511 (not b_next!18115))
