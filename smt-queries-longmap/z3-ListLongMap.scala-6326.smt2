; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81574 () Bool)

(assert start!81574)

(declare-fun b!952666 () Bool)

(declare-fun b_free!18277 () Bool)

(declare-fun b_next!18277 () Bool)

(assert (=> b!952666 (= b_free!18277 (not b_next!18277))))

(declare-fun tp!63446 () Bool)

(declare-fun b_and!29759 () Bool)

(assert (=> b!952666 (= tp!63446 b_and!29759)))

(declare-fun b!952661 () Bool)

(declare-fun e!536550 () Bool)

(declare-fun e!536549 () Bool)

(assert (=> b!952661 (= e!536550 (not e!536549))))

(declare-fun res!638117 () Bool)

(assert (=> b!952661 (=> res!638117 e!536549)))

(declare-datatypes ((V!32679 0))(
  ( (V!32680 (val!10443 Int)) )
))
(declare-datatypes ((ValueCell!9911 0))(
  ( (ValueCellFull!9911 (v!12989 V!32679)) (EmptyCell!9911) )
))
(declare-datatypes ((array!57651 0))(
  ( (array!57652 (arr!27715 (Array (_ BitVec 32) ValueCell!9911)) (size!28194 (_ BitVec 32))) )
))
(declare-datatypes ((array!57653 0))(
  ( (array!57654 (arr!27716 (Array (_ BitVec 32) (_ BitVec 64))) (size!28195 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4972 0))(
  ( (LongMapFixedSize!4973 (defaultEntry!5811 Int) (mask!27685 (_ BitVec 32)) (extraKeys!5543 (_ BitVec 32)) (zeroValue!5647 V!32679) (minValue!5647 V!32679) (_size!2541 (_ BitVec 32)) (_keys!10786 array!57653) (_values!5834 array!57651) (_vacant!2541 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4972)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952661 (= res!638117 (not (validMask!0 (mask!27685 thiss!1141))))))

(declare-fun lt!429131 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57653 (_ BitVec 32)) Bool)

(assert (=> b!952661 (arrayForallSeekEntryOrOpenFound!0 lt!429131 (_keys!10786 thiss!1141) (mask!27685 thiss!1141))))

(declare-datatypes ((Unit!32008 0))(
  ( (Unit!32009) )
))
(declare-fun lt!429133 () Unit!32008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32008)

(assert (=> b!952661 (= lt!429133 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10786 thiss!1141) (mask!27685 thiss!1141) #b00000000000000000000000000000000 lt!429131))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57653 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952661 (= lt!429131 (arrayScanForKey!0 (_keys!10786 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952661 (arrayContainsKey!0 (_keys!10786 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429132 () Unit!32008)

(declare-fun lemmaKeyInListMapIsInArray!328 (array!57653 array!57651 (_ BitVec 32) (_ BitVec 32) V!32679 V!32679 (_ BitVec 64) Int) Unit!32008)

(assert (=> b!952661 (= lt!429132 (lemmaKeyInListMapIsInArray!328 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) key!756 (defaultEntry!5811 thiss!1141)))))

(declare-fun b!952662 () Bool)

(declare-fun res!638115 () Bool)

(assert (=> b!952662 (=> (not res!638115) (not e!536550))))

(assert (=> b!952662 (= res!638115 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952663 () Bool)

(assert (=> b!952663 (= e!536549 (= (size!28195 (_keys!10786 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27685 thiss!1141))))))

(declare-fun mapNonEmpty!33108 () Bool)

(declare-fun mapRes!33108 () Bool)

(declare-fun tp!63447 () Bool)

(declare-fun e!536548 () Bool)

(assert (=> mapNonEmpty!33108 (= mapRes!33108 (and tp!63447 e!536548))))

(declare-fun mapValue!33108 () ValueCell!9911)

(declare-fun mapKey!33108 () (_ BitVec 32))

(declare-fun mapRest!33108 () (Array (_ BitVec 32) ValueCell!9911))

(assert (=> mapNonEmpty!33108 (= (arr!27715 (_values!5834 thiss!1141)) (store mapRest!33108 mapKey!33108 mapValue!33108))))

(declare-fun b!952664 () Bool)

(declare-fun res!638119 () Bool)

(assert (=> b!952664 (=> (not res!638119) (not e!536550))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9114 0))(
  ( (MissingZero!9114 (index!38827 (_ BitVec 32))) (Found!9114 (index!38828 (_ BitVec 32))) (Intermediate!9114 (undefined!9926 Bool) (index!38829 (_ BitVec 32)) (x!81862 (_ BitVec 32))) (Undefined!9114) (MissingVacant!9114 (index!38830 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57653 (_ BitVec 32)) SeekEntryResult!9114)

(assert (=> b!952664 (= res!638119 (not ((_ is Found!9114) (seekEntry!0 key!756 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))))

(declare-fun res!638118 () Bool)

(assert (=> start!81574 (=> (not res!638118) (not e!536550))))

(declare-fun valid!1900 (LongMapFixedSize!4972) Bool)

(assert (=> start!81574 (= res!638118 (valid!1900 thiss!1141))))

(assert (=> start!81574 e!536550))

(declare-fun e!536546 () Bool)

(assert (=> start!81574 e!536546))

(assert (=> start!81574 true))

(declare-fun mapIsEmpty!33108 () Bool)

(assert (=> mapIsEmpty!33108 mapRes!33108))

(declare-fun b!952665 () Bool)

(declare-fun e!536552 () Bool)

(declare-fun tp_is_empty!20785 () Bool)

(assert (=> b!952665 (= e!536552 tp_is_empty!20785)))

(declare-fun e!536551 () Bool)

(declare-fun array_inv!21586 (array!57653) Bool)

(declare-fun array_inv!21587 (array!57651) Bool)

(assert (=> b!952666 (= e!536546 (and tp!63446 tp_is_empty!20785 (array_inv!21586 (_keys!10786 thiss!1141)) (array_inv!21587 (_values!5834 thiss!1141)) e!536551))))

(declare-fun b!952667 () Bool)

(declare-fun res!638116 () Bool)

(assert (=> b!952667 (=> (not res!638116) (not e!536550))))

(declare-datatypes ((tuple2!13556 0))(
  ( (tuple2!13557 (_1!6789 (_ BitVec 64)) (_2!6789 V!32679)) )
))
(declare-datatypes ((List!19346 0))(
  ( (Nil!19343) (Cons!19342 (h!20509 tuple2!13556) (t!27689 List!19346)) )
))
(declare-datatypes ((ListLongMap!12255 0))(
  ( (ListLongMap!12256 (toList!6143 List!19346)) )
))
(declare-fun contains!5247 (ListLongMap!12255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3376 (array!57653 array!57651 (_ BitVec 32) (_ BitVec 32) V!32679 V!32679 (_ BitVec 32) Int) ListLongMap!12255)

(assert (=> b!952667 (= res!638116 (contains!5247 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)) key!756))))

(declare-fun b!952668 () Bool)

(assert (=> b!952668 (= e!536548 tp_is_empty!20785)))

(declare-fun b!952669 () Bool)

(assert (=> b!952669 (= e!536551 (and e!536552 mapRes!33108))))

(declare-fun condMapEmpty!33108 () Bool)

(declare-fun mapDefault!33108 () ValueCell!9911)

(assert (=> b!952669 (= condMapEmpty!33108 (= (arr!27715 (_values!5834 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9911)) mapDefault!33108)))))

(assert (= (and start!81574 res!638118) b!952662))

(assert (= (and b!952662 res!638115) b!952664))

(assert (= (and b!952664 res!638119) b!952667))

(assert (= (and b!952667 res!638116) b!952661))

(assert (= (and b!952661 (not res!638117)) b!952663))

(assert (= (and b!952669 condMapEmpty!33108) mapIsEmpty!33108))

(assert (= (and b!952669 (not condMapEmpty!33108)) mapNonEmpty!33108))

(assert (= (and mapNonEmpty!33108 ((_ is ValueCellFull!9911) mapValue!33108)) b!952668))

(assert (= (and b!952669 ((_ is ValueCellFull!9911) mapDefault!33108)) b!952665))

(assert (= b!952666 b!952669))

(assert (= start!81574 b!952666))

(declare-fun m!885249 () Bool)

(assert (=> start!81574 m!885249))

(declare-fun m!885251 () Bool)

(assert (=> b!952667 m!885251))

(assert (=> b!952667 m!885251))

(declare-fun m!885253 () Bool)

(assert (=> b!952667 m!885253))

(declare-fun m!885255 () Bool)

(assert (=> b!952661 m!885255))

(declare-fun m!885257 () Bool)

(assert (=> b!952661 m!885257))

(declare-fun m!885259 () Bool)

(assert (=> b!952661 m!885259))

(declare-fun m!885261 () Bool)

(assert (=> b!952661 m!885261))

(declare-fun m!885263 () Bool)

(assert (=> b!952661 m!885263))

(declare-fun m!885265 () Bool)

(assert (=> b!952661 m!885265))

(declare-fun m!885267 () Bool)

(assert (=> mapNonEmpty!33108 m!885267))

(declare-fun m!885269 () Bool)

(assert (=> b!952664 m!885269))

(declare-fun m!885271 () Bool)

(assert (=> b!952666 m!885271))

(declare-fun m!885273 () Bool)

(assert (=> b!952666 m!885273))

(check-sat (not start!81574) (not b!952664) (not mapNonEmpty!33108) b_and!29759 (not b!952667) (not b_next!18277) (not b!952666) tp_is_empty!20785 (not b!952661))
(check-sat b_and!29759 (not b_next!18277))
(get-model)

(declare-fun d!115707 () Bool)

(assert (=> d!115707 (arrayForallSeekEntryOrOpenFound!0 lt!429131 (_keys!10786 thiss!1141) (mask!27685 thiss!1141))))

(declare-fun lt!429154 () Unit!32008)

(declare-fun choose!38 (array!57653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32008)

(assert (=> d!115707 (= lt!429154 (choose!38 (_keys!10786 thiss!1141) (mask!27685 thiss!1141) #b00000000000000000000000000000000 lt!429131))))

(assert (=> d!115707 (validMask!0 (mask!27685 thiss!1141))))

(assert (=> d!115707 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10786 thiss!1141) (mask!27685 thiss!1141) #b00000000000000000000000000000000 lt!429131) lt!429154)))

(declare-fun bs!26755 () Bool)

(assert (= bs!26755 d!115707))

(assert (=> bs!26755 m!885265))

(declare-fun m!885327 () Bool)

(assert (=> bs!26755 m!885327))

(assert (=> bs!26755 m!885259))

(assert (=> b!952661 d!115707))

(declare-fun d!115709 () Bool)

(declare-fun res!638154 () Bool)

(declare-fun e!536599 () Bool)

(assert (=> d!115709 (=> res!638154 e!536599)))

(assert (=> d!115709 (= res!638154 (= (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115709 (= (arrayContainsKey!0 (_keys!10786 thiss!1141) key!756 #b00000000000000000000000000000000) e!536599)))

(declare-fun b!952728 () Bool)

(declare-fun e!536600 () Bool)

(assert (=> b!952728 (= e!536599 e!536600)))

(declare-fun res!638155 () Bool)

(assert (=> b!952728 (=> (not res!638155) (not e!536600))))

(assert (=> b!952728 (= res!638155 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun b!952729 () Bool)

(assert (=> b!952729 (= e!536600 (arrayContainsKey!0 (_keys!10786 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115709 (not res!638154)) b!952728))

(assert (= (and b!952728 res!638155) b!952729))

(declare-fun m!885329 () Bool)

(assert (=> d!115709 m!885329))

(declare-fun m!885331 () Bool)

(assert (=> b!952729 m!885331))

(assert (=> b!952661 d!115709))

(declare-fun d!115711 () Bool)

(declare-fun e!536603 () Bool)

(assert (=> d!115711 e!536603))

(declare-fun c!99783 () Bool)

(assert (=> d!115711 (= c!99783 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429157 () Unit!32008)

(declare-fun choose!1599 (array!57653 array!57651 (_ BitVec 32) (_ BitVec 32) V!32679 V!32679 (_ BitVec 64) Int) Unit!32008)

(assert (=> d!115711 (= lt!429157 (choose!1599 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) key!756 (defaultEntry!5811 thiss!1141)))))

(assert (=> d!115711 (validMask!0 (mask!27685 thiss!1141))))

(assert (=> d!115711 (= (lemmaKeyInListMapIsInArray!328 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) key!756 (defaultEntry!5811 thiss!1141)) lt!429157)))

(declare-fun b!952734 () Bool)

(assert (=> b!952734 (= e!536603 (arrayContainsKey!0 (_keys!10786 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952735 () Bool)

(assert (=> b!952735 (= e!536603 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115711 c!99783) b!952734))

(assert (= (and d!115711 (not c!99783)) b!952735))

(declare-fun m!885333 () Bool)

(assert (=> d!115711 m!885333))

(assert (=> d!115711 m!885259))

(assert (=> b!952734 m!885263))

(assert (=> b!952661 d!115711))

(declare-fun d!115713 () Bool)

(declare-fun lt!429160 () (_ BitVec 32))

(assert (=> d!115713 (and (or (bvslt lt!429160 #b00000000000000000000000000000000) (bvsge lt!429160 (size!28195 (_keys!10786 thiss!1141))) (and (bvsge lt!429160 #b00000000000000000000000000000000) (bvslt lt!429160 (size!28195 (_keys!10786 thiss!1141))))) (bvsge lt!429160 #b00000000000000000000000000000000) (bvslt lt!429160 (size!28195 (_keys!10786 thiss!1141))) (= (select (arr!27716 (_keys!10786 thiss!1141)) lt!429160) key!756))))

(declare-fun e!536606 () (_ BitVec 32))

(assert (=> d!115713 (= lt!429160 e!536606)))

(declare-fun c!99786 () Bool)

(assert (=> d!115713 (= c!99786 (= (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115713 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))) (bvslt (size!28195 (_keys!10786 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115713 (= (arrayScanForKey!0 (_keys!10786 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429160)))

(declare-fun b!952740 () Bool)

(assert (=> b!952740 (= e!536606 #b00000000000000000000000000000000)))

(declare-fun b!952741 () Bool)

(assert (=> b!952741 (= e!536606 (arrayScanForKey!0 (_keys!10786 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115713 c!99786) b!952740))

(assert (= (and d!115713 (not c!99786)) b!952741))

(declare-fun m!885335 () Bool)

(assert (=> d!115713 m!885335))

(assert (=> d!115713 m!885329))

(declare-fun m!885337 () Bool)

(assert (=> b!952741 m!885337))

(assert (=> b!952661 d!115713))

(declare-fun b!952750 () Bool)

(declare-fun e!536615 () Bool)

(declare-fun e!536613 () Bool)

(assert (=> b!952750 (= e!536615 e!536613)))

(declare-fun lt!429169 () (_ BitVec 64))

(assert (=> b!952750 (= lt!429169 (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131))))

(declare-fun lt!429168 () Unit!32008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57653 (_ BitVec 64) (_ BitVec 32)) Unit!32008)

(assert (=> b!952750 (= lt!429168 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10786 thiss!1141) lt!429169 lt!429131))))

(assert (=> b!952750 (arrayContainsKey!0 (_keys!10786 thiss!1141) lt!429169 #b00000000000000000000000000000000)))

(declare-fun lt!429167 () Unit!32008)

(assert (=> b!952750 (= lt!429167 lt!429168)))

(declare-fun res!638161 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57653 (_ BitVec 32)) SeekEntryResult!9114)

(assert (=> b!952750 (= res!638161 (= (seekEntryOrOpen!0 (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131) (_keys!10786 thiss!1141) (mask!27685 thiss!1141)) (Found!9114 lt!429131)))))

(assert (=> b!952750 (=> (not res!638161) (not e!536613))))

(declare-fun b!952751 () Bool)

(declare-fun call!41562 () Bool)

(assert (=> b!952751 (= e!536613 call!41562)))

(declare-fun bm!41559 () Bool)

(assert (=> bm!41559 (= call!41562 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429131 #b00000000000000000000000000000001) (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))

(declare-fun d!115715 () Bool)

(declare-fun res!638160 () Bool)

(declare-fun e!536614 () Bool)

(assert (=> d!115715 (=> res!638160 e!536614)))

(assert (=> d!115715 (= res!638160 (bvsge lt!429131 (size!28195 (_keys!10786 thiss!1141))))))

(assert (=> d!115715 (= (arrayForallSeekEntryOrOpenFound!0 lt!429131 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)) e!536614)))

(declare-fun b!952752 () Bool)

(assert (=> b!952752 (= e!536615 call!41562)))

(declare-fun b!952753 () Bool)

(assert (=> b!952753 (= e!536614 e!536615)))

(declare-fun c!99789 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952753 (= c!99789 (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131)))))

(assert (= (and d!115715 (not res!638160)) b!952753))

(assert (= (and b!952753 c!99789) b!952750))

(assert (= (and b!952753 (not c!99789)) b!952752))

(assert (= (and b!952750 res!638161) b!952751))

(assert (= (or b!952751 b!952752) bm!41559))

(declare-fun m!885339 () Bool)

(assert (=> b!952750 m!885339))

(declare-fun m!885341 () Bool)

(assert (=> b!952750 m!885341))

(declare-fun m!885343 () Bool)

(assert (=> b!952750 m!885343))

(assert (=> b!952750 m!885339))

(declare-fun m!885345 () Bool)

(assert (=> b!952750 m!885345))

(declare-fun m!885347 () Bool)

(assert (=> bm!41559 m!885347))

(assert (=> b!952753 m!885339))

(assert (=> b!952753 m!885339))

(declare-fun m!885349 () Bool)

(assert (=> b!952753 m!885349))

(assert (=> b!952661 d!115715))

(declare-fun d!115717 () Bool)

(assert (=> d!115717 (= (validMask!0 (mask!27685 thiss!1141)) (and (or (= (mask!27685 thiss!1141) #b00000000000000000000000000000111) (= (mask!27685 thiss!1141) #b00000000000000000000000000001111) (= (mask!27685 thiss!1141) #b00000000000000000000000000011111) (= (mask!27685 thiss!1141) #b00000000000000000000000000111111) (= (mask!27685 thiss!1141) #b00000000000000000000000001111111) (= (mask!27685 thiss!1141) #b00000000000000000000000011111111) (= (mask!27685 thiss!1141) #b00000000000000000000000111111111) (= (mask!27685 thiss!1141) #b00000000000000000000001111111111) (= (mask!27685 thiss!1141) #b00000000000000000000011111111111) (= (mask!27685 thiss!1141) #b00000000000000000000111111111111) (= (mask!27685 thiss!1141) #b00000000000000000001111111111111) (= (mask!27685 thiss!1141) #b00000000000000000011111111111111) (= (mask!27685 thiss!1141) #b00000000000000000111111111111111) (= (mask!27685 thiss!1141) #b00000000000000001111111111111111) (= (mask!27685 thiss!1141) #b00000000000000011111111111111111) (= (mask!27685 thiss!1141) #b00000000000000111111111111111111) (= (mask!27685 thiss!1141) #b00000000000001111111111111111111) (= (mask!27685 thiss!1141) #b00000000000011111111111111111111) (= (mask!27685 thiss!1141) #b00000000000111111111111111111111) (= (mask!27685 thiss!1141) #b00000000001111111111111111111111) (= (mask!27685 thiss!1141) #b00000000011111111111111111111111) (= (mask!27685 thiss!1141) #b00000000111111111111111111111111) (= (mask!27685 thiss!1141) #b00000001111111111111111111111111) (= (mask!27685 thiss!1141) #b00000011111111111111111111111111) (= (mask!27685 thiss!1141) #b00000111111111111111111111111111) (= (mask!27685 thiss!1141) #b00001111111111111111111111111111) (= (mask!27685 thiss!1141) #b00011111111111111111111111111111) (= (mask!27685 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27685 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!952661 d!115717))

(declare-fun b!952766 () Bool)

(declare-fun e!536623 () SeekEntryResult!9114)

(declare-fun lt!429179 () SeekEntryResult!9114)

(assert (=> b!952766 (= e!536623 (MissingZero!9114 (index!38829 lt!429179)))))

(declare-fun b!952767 () Bool)

(declare-fun e!536624 () SeekEntryResult!9114)

(assert (=> b!952767 (= e!536624 Undefined!9114)))

(declare-fun b!952768 () Bool)

(declare-fun lt!429181 () SeekEntryResult!9114)

(assert (=> b!952768 (= e!536623 (ite ((_ is MissingVacant!9114) lt!429181) (MissingZero!9114 (index!38830 lt!429181)) lt!429181))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57653 (_ BitVec 32)) SeekEntryResult!9114)

(assert (=> b!952768 (= lt!429181 (seekKeyOrZeroReturnVacant!0 (x!81862 lt!429179) (index!38829 lt!429179) (index!38829 lt!429179) key!756 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))

(declare-fun b!952769 () Bool)

(declare-fun e!536622 () SeekEntryResult!9114)

(assert (=> b!952769 (= e!536622 (Found!9114 (index!38829 lt!429179)))))

(declare-fun d!115719 () Bool)

(declare-fun lt!429178 () SeekEntryResult!9114)

(assert (=> d!115719 (and (or ((_ is MissingVacant!9114) lt!429178) (not ((_ is Found!9114) lt!429178)) (and (bvsge (index!38828 lt!429178) #b00000000000000000000000000000000) (bvslt (index!38828 lt!429178) (size!28195 (_keys!10786 thiss!1141))))) (not ((_ is MissingVacant!9114) lt!429178)) (or (not ((_ is Found!9114) lt!429178)) (= (select (arr!27716 (_keys!10786 thiss!1141)) (index!38828 lt!429178)) key!756)))))

(assert (=> d!115719 (= lt!429178 e!536624)))

(declare-fun c!99797 () Bool)

(assert (=> d!115719 (= c!99797 (and ((_ is Intermediate!9114) lt!429179) (undefined!9926 lt!429179)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57653 (_ BitVec 32)) SeekEntryResult!9114)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115719 (= lt!429179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27685 thiss!1141)) key!756 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))

(assert (=> d!115719 (validMask!0 (mask!27685 thiss!1141))))

(assert (=> d!115719 (= (seekEntry!0 key!756 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)) lt!429178)))

(declare-fun b!952770 () Bool)

(assert (=> b!952770 (= e!536624 e!536622)))

(declare-fun lt!429180 () (_ BitVec 64))

(assert (=> b!952770 (= lt!429180 (select (arr!27716 (_keys!10786 thiss!1141)) (index!38829 lt!429179)))))

(declare-fun c!99798 () Bool)

(assert (=> b!952770 (= c!99798 (= lt!429180 key!756))))

(declare-fun b!952771 () Bool)

(declare-fun c!99796 () Bool)

(assert (=> b!952771 (= c!99796 (= lt!429180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952771 (= e!536622 e!536623)))

(assert (= (and d!115719 c!99797) b!952767))

(assert (= (and d!115719 (not c!99797)) b!952770))

(assert (= (and b!952770 c!99798) b!952769))

(assert (= (and b!952770 (not c!99798)) b!952771))

(assert (= (and b!952771 c!99796) b!952766))

(assert (= (and b!952771 (not c!99796)) b!952768))

(declare-fun m!885351 () Bool)

(assert (=> b!952768 m!885351))

(declare-fun m!885353 () Bool)

(assert (=> d!115719 m!885353))

(declare-fun m!885355 () Bool)

(assert (=> d!115719 m!885355))

(assert (=> d!115719 m!885355))

(declare-fun m!885357 () Bool)

(assert (=> d!115719 m!885357))

(assert (=> d!115719 m!885259))

(declare-fun m!885359 () Bool)

(assert (=> b!952770 m!885359))

(assert (=> b!952664 d!115719))

(declare-fun d!115721 () Bool)

(declare-fun e!536629 () Bool)

(assert (=> d!115721 e!536629))

(declare-fun res!638164 () Bool)

(assert (=> d!115721 (=> res!638164 e!536629)))

(declare-fun lt!429190 () Bool)

(assert (=> d!115721 (= res!638164 (not lt!429190))))

(declare-fun lt!429193 () Bool)

(assert (=> d!115721 (= lt!429190 lt!429193)))

(declare-fun lt!429191 () Unit!32008)

(declare-fun e!536630 () Unit!32008)

(assert (=> d!115721 (= lt!429191 e!536630)))

(declare-fun c!99801 () Bool)

(assert (=> d!115721 (= c!99801 lt!429193)))

(declare-fun containsKey!472 (List!19346 (_ BitVec 64)) Bool)

(assert (=> d!115721 (= lt!429193 (containsKey!472 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(assert (=> d!115721 (= (contains!5247 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)) key!756) lt!429190)))

(declare-fun b!952778 () Bool)

(declare-fun lt!429192 () Unit!32008)

(assert (=> b!952778 (= e!536630 lt!429192)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!366 (List!19346 (_ BitVec 64)) Unit!32008)

(assert (=> b!952778 (= lt!429192 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(declare-datatypes ((Option!507 0))(
  ( (Some!506 (v!12992 V!32679)) (None!505) )
))
(declare-fun isDefined!374 (Option!507) Bool)

(declare-fun getValueByKey!501 (List!19346 (_ BitVec 64)) Option!507)

(assert (=> b!952778 (isDefined!374 (getValueByKey!501 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(declare-fun b!952779 () Bool)

(declare-fun Unit!32012 () Unit!32008)

(assert (=> b!952779 (= e!536630 Unit!32012)))

(declare-fun b!952780 () Bool)

(assert (=> b!952780 (= e!536629 (isDefined!374 (getValueByKey!501 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756)))))

(assert (= (and d!115721 c!99801) b!952778))

(assert (= (and d!115721 (not c!99801)) b!952779))

(assert (= (and d!115721 (not res!638164)) b!952780))

(declare-fun m!885361 () Bool)

(assert (=> d!115721 m!885361))

(declare-fun m!885363 () Bool)

(assert (=> b!952778 m!885363))

(declare-fun m!885365 () Bool)

(assert (=> b!952778 m!885365))

(assert (=> b!952778 m!885365))

(declare-fun m!885367 () Bool)

(assert (=> b!952778 m!885367))

(assert (=> b!952780 m!885365))

(assert (=> b!952780 m!885365))

(assert (=> b!952780 m!885367))

(assert (=> b!952667 d!115721))

(declare-fun b!952823 () Bool)

(declare-fun e!536668 () Bool)

(declare-fun call!41583 () Bool)

(assert (=> b!952823 (= e!536668 (not call!41583))))

(declare-fun bm!41574 () Bool)

(declare-fun call!41581 () ListLongMap!12255)

(declare-fun call!41577 () ListLongMap!12255)

(assert (=> bm!41574 (= call!41581 call!41577)))

(declare-fun b!952824 () Bool)

(declare-fun e!536662 () Bool)

(declare-fun e!536660 () Bool)

(assert (=> b!952824 (= e!536662 e!536660)))

(declare-fun res!638184 () Bool)

(declare-fun call!41578 () Bool)

(assert (=> b!952824 (= res!638184 call!41578)))

(assert (=> b!952824 (=> (not res!638184) (not e!536660))))

(declare-fun b!952825 () Bool)

(declare-fun e!536661 () Unit!32008)

(declare-fun Unit!32013 () Unit!32008)

(assert (=> b!952825 (= e!536661 Unit!32013)))

(declare-fun b!952826 () Bool)

(declare-fun e!536663 () ListLongMap!12255)

(declare-fun call!41579 () ListLongMap!12255)

(declare-fun +!2879 (ListLongMap!12255 tuple2!13556) ListLongMap!12255)

(assert (=> b!952826 (= e!536663 (+!2879 call!41579 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))

(declare-fun b!952827 () Bool)

(declare-fun e!536665 () Bool)

(declare-fun e!536664 () Bool)

(assert (=> b!952827 (= e!536665 e!536664)))

(declare-fun res!638187 () Bool)

(assert (=> b!952827 (=> (not res!638187) (not e!536664))))

(declare-fun lt!429253 () ListLongMap!12255)

(assert (=> b!952827 (= res!638187 (contains!5247 lt!429253 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun b!952828 () Bool)

(declare-fun e!536659 () Bool)

(assert (=> b!952828 (= e!536659 (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952829 () Bool)

(declare-fun e!536669 () Bool)

(declare-fun apply!893 (ListLongMap!12255 (_ BitVec 64)) V!32679)

(assert (=> b!952829 (= e!536669 (= (apply!893 lt!429253 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5647 thiss!1141)))))

(declare-fun b!952830 () Bool)

(assert (=> b!952830 (= e!536668 e!536669)))

(declare-fun res!638189 () Bool)

(assert (=> b!952830 (= res!638189 call!41583)))

(assert (=> b!952830 (=> (not res!638189) (not e!536669))))

(declare-fun d!115723 () Bool)

(declare-fun e!536658 () Bool)

(assert (=> d!115723 e!536658))

(declare-fun res!638183 () Bool)

(assert (=> d!115723 (=> (not res!638183) (not e!536658))))

(assert (=> d!115723 (= res!638183 (or (bvsge #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))))

(declare-fun lt!429255 () ListLongMap!12255)

(assert (=> d!115723 (= lt!429253 lt!429255)))

(declare-fun lt!429250 () Unit!32008)

(assert (=> d!115723 (= lt!429250 e!536661)))

(declare-fun c!99814 () Bool)

(assert (=> d!115723 (= c!99814 e!536659)))

(declare-fun res!638190 () Bool)

(assert (=> d!115723 (=> (not res!638190) (not e!536659))))

(assert (=> d!115723 (= res!638190 (bvslt #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(assert (=> d!115723 (= lt!429255 e!536663)))

(declare-fun c!99817 () Bool)

(assert (=> d!115723 (= c!99817 (and (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115723 (validMask!0 (mask!27685 thiss!1141))))

(assert (=> d!115723 (= (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)) lt!429253)))

(declare-fun b!952831 () Bool)

(declare-fun res!638191 () Bool)

(assert (=> b!952831 (=> (not res!638191) (not e!536658))))

(assert (=> b!952831 (= res!638191 e!536665)))

(declare-fun res!638185 () Bool)

(assert (=> b!952831 (=> res!638185 e!536665)))

(declare-fun e!536667 () Bool)

(assert (=> b!952831 (= res!638185 (not e!536667))))

(declare-fun res!638188 () Bool)

(assert (=> b!952831 (=> (not res!638188) (not e!536667))))

(assert (=> b!952831 (= res!638188 (bvslt #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun bm!41575 () Bool)

(declare-fun call!41580 () ListLongMap!12255)

(assert (=> bm!41575 (= call!41580 call!41579)))

(declare-fun b!952832 () Bool)

(assert (=> b!952832 (= e!536662 (not call!41578))))

(declare-fun bm!41576 () Bool)

(assert (=> bm!41576 (= call!41583 (contains!5247 lt!429253 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952833 () Bool)

(declare-fun lt!429257 () Unit!32008)

(assert (=> b!952833 (= e!536661 lt!429257)))

(declare-fun lt!429244 () ListLongMap!12255)

(declare-fun getCurrentListMapNoExtraKeys!3367 (array!57653 array!57651 (_ BitVec 32) (_ BitVec 32) V!32679 V!32679 (_ BitVec 32) Int) ListLongMap!12255)

(assert (=> b!952833 (= lt!429244 (getCurrentListMapNoExtraKeys!3367 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))

(declare-fun lt!429251 () (_ BitVec 64))

(assert (=> b!952833 (= lt!429251 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429241 () (_ BitVec 64))

(assert (=> b!952833 (= lt!429241 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429258 () Unit!32008)

(declare-fun addStillContains!582 (ListLongMap!12255 (_ BitVec 64) V!32679 (_ BitVec 64)) Unit!32008)

(assert (=> b!952833 (= lt!429258 (addStillContains!582 lt!429244 lt!429251 (zeroValue!5647 thiss!1141) lt!429241))))

(assert (=> b!952833 (contains!5247 (+!2879 lt!429244 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141))) lt!429241)))

(declare-fun lt!429247 () Unit!32008)

(assert (=> b!952833 (= lt!429247 lt!429258)))

(declare-fun lt!429259 () ListLongMap!12255)

(assert (=> b!952833 (= lt!429259 (getCurrentListMapNoExtraKeys!3367 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))

(declare-fun lt!429239 () (_ BitVec 64))

(assert (=> b!952833 (= lt!429239 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429243 () (_ BitVec 64))

(assert (=> b!952833 (= lt!429243 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429240 () Unit!32008)

(declare-fun addApplyDifferent!463 (ListLongMap!12255 (_ BitVec 64) V!32679 (_ BitVec 64)) Unit!32008)

(assert (=> b!952833 (= lt!429240 (addApplyDifferent!463 lt!429259 lt!429239 (minValue!5647 thiss!1141) lt!429243))))

(assert (=> b!952833 (= (apply!893 (+!2879 lt!429259 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141))) lt!429243) (apply!893 lt!429259 lt!429243))))

(declare-fun lt!429254 () Unit!32008)

(assert (=> b!952833 (= lt!429254 lt!429240)))

(declare-fun lt!429249 () ListLongMap!12255)

(assert (=> b!952833 (= lt!429249 (getCurrentListMapNoExtraKeys!3367 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))

(declare-fun lt!429256 () (_ BitVec 64))

(assert (=> b!952833 (= lt!429256 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429238 () (_ BitVec 64))

(assert (=> b!952833 (= lt!429238 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429246 () Unit!32008)

(assert (=> b!952833 (= lt!429246 (addApplyDifferent!463 lt!429249 lt!429256 (zeroValue!5647 thiss!1141) lt!429238))))

(assert (=> b!952833 (= (apply!893 (+!2879 lt!429249 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141))) lt!429238) (apply!893 lt!429249 lt!429238))))

(declare-fun lt!429252 () Unit!32008)

(assert (=> b!952833 (= lt!429252 lt!429246)))

(declare-fun lt!429242 () ListLongMap!12255)

(assert (=> b!952833 (= lt!429242 (getCurrentListMapNoExtraKeys!3367 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))

(declare-fun lt!429245 () (_ BitVec 64))

(assert (=> b!952833 (= lt!429245 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429248 () (_ BitVec 64))

(assert (=> b!952833 (= lt!429248 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952833 (= lt!429257 (addApplyDifferent!463 lt!429242 lt!429245 (minValue!5647 thiss!1141) lt!429248))))

(assert (=> b!952833 (= (apply!893 (+!2879 lt!429242 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141))) lt!429248) (apply!893 lt!429242 lt!429248))))

(declare-fun b!952834 () Bool)

(assert (=> b!952834 (= e!536658 e!536662)))

(declare-fun c!99815 () Bool)

(assert (=> b!952834 (= c!99815 (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952835 () Bool)

(assert (=> b!952835 (= e!536667 (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952836 () Bool)

(declare-fun e!536657 () ListLongMap!12255)

(assert (=> b!952836 (= e!536657 call!41580)))

(declare-fun b!952837 () Bool)

(declare-fun c!99818 () Bool)

(assert (=> b!952837 (= c!99818 (and (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!536666 () ListLongMap!12255)

(assert (=> b!952837 (= e!536666 e!536657)))

(declare-fun b!952838 () Bool)

(assert (=> b!952838 (= e!536660 (= (apply!893 lt!429253 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5647 thiss!1141)))))

(declare-fun c!99816 () Bool)

(declare-fun call!41582 () ListLongMap!12255)

(declare-fun bm!41577 () Bool)

(assert (=> bm!41577 (= call!41579 (+!2879 (ite c!99817 call!41577 (ite c!99816 call!41581 call!41582)) (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(declare-fun b!952839 () Bool)

(assert (=> b!952839 (= e!536663 e!536666)))

(assert (=> b!952839 (= c!99816 (and (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952840 () Bool)

(assert (=> b!952840 (= e!536657 call!41582)))

(declare-fun bm!41578 () Bool)

(assert (=> bm!41578 (= call!41577 (getCurrentListMapNoExtraKeys!3367 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))

(declare-fun b!952841 () Bool)

(assert (=> b!952841 (= e!536666 call!41580)))

(declare-fun bm!41579 () Bool)

(assert (=> bm!41579 (= call!41582 call!41581)))

(declare-fun b!952842 () Bool)

(declare-fun get!14579 (ValueCell!9911 V!32679) V!32679)

(declare-fun dynLambda!1676 (Int (_ BitVec 64)) V!32679)

(assert (=> b!952842 (= e!536664 (= (apply!893 lt!429253 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)) (get!14579 (select (arr!27715 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1676 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952842 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28194 (_values!5834 thiss!1141))))))

(assert (=> b!952842 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun b!952843 () Bool)

(declare-fun res!638186 () Bool)

(assert (=> b!952843 (=> (not res!638186) (not e!536658))))

(assert (=> b!952843 (= res!638186 e!536668)))

(declare-fun c!99819 () Bool)

(assert (=> b!952843 (= c!99819 (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41580 () Bool)

(assert (=> bm!41580 (= call!41578 (contains!5247 lt!429253 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115723 c!99817) b!952826))

(assert (= (and d!115723 (not c!99817)) b!952839))

(assert (= (and b!952839 c!99816) b!952841))

(assert (= (and b!952839 (not c!99816)) b!952837))

(assert (= (and b!952837 c!99818) b!952836))

(assert (= (and b!952837 (not c!99818)) b!952840))

(assert (= (or b!952836 b!952840) bm!41579))

(assert (= (or b!952841 bm!41579) bm!41574))

(assert (= (or b!952841 b!952836) bm!41575))

(assert (= (or b!952826 bm!41574) bm!41578))

(assert (= (or b!952826 bm!41575) bm!41577))

(assert (= (and d!115723 res!638190) b!952828))

(assert (= (and d!115723 c!99814) b!952833))

(assert (= (and d!115723 (not c!99814)) b!952825))

(assert (= (and d!115723 res!638183) b!952831))

(assert (= (and b!952831 res!638188) b!952835))

(assert (= (and b!952831 (not res!638185)) b!952827))

(assert (= (and b!952827 res!638187) b!952842))

(assert (= (and b!952831 res!638191) b!952843))

(assert (= (and b!952843 c!99819) b!952830))

(assert (= (and b!952843 (not c!99819)) b!952823))

(assert (= (and b!952830 res!638189) b!952829))

(assert (= (or b!952830 b!952823) bm!41576))

(assert (= (and b!952843 res!638186) b!952834))

(assert (= (and b!952834 c!99815) b!952824))

(assert (= (and b!952834 (not c!99815)) b!952832))

(assert (= (and b!952824 res!638184) b!952838))

(assert (= (or b!952824 b!952832) bm!41580))

(declare-fun b_lambda!14413 () Bool)

(assert (=> (not b_lambda!14413) (not b!952842)))

(declare-fun t!27692 () Bool)

(declare-fun tb!6195 () Bool)

(assert (=> (and b!952666 (= (defaultEntry!5811 thiss!1141) (defaultEntry!5811 thiss!1141)) t!27692) tb!6195))

(declare-fun result!12323 () Bool)

(assert (=> tb!6195 (= result!12323 tp_is_empty!20785)))

(assert (=> b!952842 t!27692))

(declare-fun b_and!29765 () Bool)

(assert (= b_and!29759 (and (=> t!27692 result!12323) b_and!29765)))

(assert (=> b!952827 m!885329))

(assert (=> b!952827 m!885329))

(declare-fun m!885369 () Bool)

(assert (=> b!952827 m!885369))

(declare-fun m!885371 () Bool)

(assert (=> b!952838 m!885371))

(declare-fun m!885373 () Bool)

(assert (=> b!952826 m!885373))

(declare-fun m!885375 () Bool)

(assert (=> bm!41576 m!885375))

(assert (=> b!952835 m!885329))

(assert (=> b!952835 m!885329))

(declare-fun m!885377 () Bool)

(assert (=> b!952835 m!885377))

(assert (=> b!952828 m!885329))

(assert (=> b!952828 m!885329))

(assert (=> b!952828 m!885377))

(declare-fun m!885379 () Bool)

(assert (=> b!952842 m!885379))

(assert (=> b!952842 m!885329))

(assert (=> b!952842 m!885379))

(declare-fun m!885381 () Bool)

(assert (=> b!952842 m!885381))

(declare-fun m!885383 () Bool)

(assert (=> b!952842 m!885383))

(assert (=> b!952842 m!885329))

(declare-fun m!885385 () Bool)

(assert (=> b!952842 m!885385))

(assert (=> b!952842 m!885381))

(declare-fun m!885387 () Bool)

(assert (=> b!952833 m!885387))

(declare-fun m!885389 () Bool)

(assert (=> b!952833 m!885389))

(declare-fun m!885391 () Bool)

(assert (=> b!952833 m!885391))

(declare-fun m!885393 () Bool)

(assert (=> b!952833 m!885393))

(assert (=> b!952833 m!885329))

(declare-fun m!885395 () Bool)

(assert (=> b!952833 m!885395))

(declare-fun m!885397 () Bool)

(assert (=> b!952833 m!885397))

(declare-fun m!885399 () Bool)

(assert (=> b!952833 m!885399))

(declare-fun m!885401 () Bool)

(assert (=> b!952833 m!885401))

(declare-fun m!885403 () Bool)

(assert (=> b!952833 m!885403))

(declare-fun m!885405 () Bool)

(assert (=> b!952833 m!885405))

(assert (=> b!952833 m!885397))

(assert (=> b!952833 m!885401))

(assert (=> b!952833 m!885391))

(declare-fun m!885407 () Bool)

(assert (=> b!952833 m!885407))

(declare-fun m!885409 () Bool)

(assert (=> b!952833 m!885409))

(declare-fun m!885411 () Bool)

(assert (=> b!952833 m!885411))

(declare-fun m!885413 () Bool)

(assert (=> b!952833 m!885413))

(declare-fun m!885415 () Bool)

(assert (=> b!952833 m!885415))

(assert (=> b!952833 m!885393))

(declare-fun m!885417 () Bool)

(assert (=> b!952833 m!885417))

(declare-fun m!885419 () Bool)

(assert (=> b!952829 m!885419))

(assert (=> d!115723 m!885259))

(assert (=> bm!41578 m!885413))

(declare-fun m!885421 () Bool)

(assert (=> bm!41580 m!885421))

(declare-fun m!885423 () Bool)

(assert (=> bm!41577 m!885423))

(assert (=> b!952667 d!115723))

(declare-fun d!115725 () Bool)

(declare-fun res!638198 () Bool)

(declare-fun e!536672 () Bool)

(assert (=> d!115725 (=> (not res!638198) (not e!536672))))

(declare-fun simpleValid!380 (LongMapFixedSize!4972) Bool)

(assert (=> d!115725 (= res!638198 (simpleValid!380 thiss!1141))))

(assert (=> d!115725 (= (valid!1900 thiss!1141) e!536672)))

(declare-fun b!952852 () Bool)

(declare-fun res!638199 () Bool)

(assert (=> b!952852 (=> (not res!638199) (not e!536672))))

(declare-fun arrayCountValidKeys!0 (array!57653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952852 (= res!638199 (= (arrayCountValidKeys!0 (_keys!10786 thiss!1141) #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))) (_size!2541 thiss!1141)))))

(declare-fun b!952853 () Bool)

(declare-fun res!638200 () Bool)

(assert (=> b!952853 (=> (not res!638200) (not e!536672))))

(assert (=> b!952853 (= res!638200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))

(declare-fun b!952854 () Bool)

(declare-datatypes ((List!19348 0))(
  ( (Nil!19345) (Cons!19344 (h!20511 (_ BitVec 64)) (t!27693 List!19348)) )
))
(declare-fun arrayNoDuplicates!0 (array!57653 (_ BitVec 32) List!19348) Bool)

(assert (=> b!952854 (= e!536672 (arrayNoDuplicates!0 (_keys!10786 thiss!1141) #b00000000000000000000000000000000 Nil!19345))))

(assert (= (and d!115725 res!638198) b!952852))

(assert (= (and b!952852 res!638199) b!952853))

(assert (= (and b!952853 res!638200) b!952854))

(declare-fun m!885425 () Bool)

(assert (=> d!115725 m!885425))

(declare-fun m!885427 () Bool)

(assert (=> b!952852 m!885427))

(declare-fun m!885429 () Bool)

(assert (=> b!952853 m!885429))

(declare-fun m!885431 () Bool)

(assert (=> b!952854 m!885431))

(assert (=> start!81574 d!115725))

(declare-fun d!115727 () Bool)

(assert (=> d!115727 (= (array_inv!21586 (_keys!10786 thiss!1141)) (bvsge (size!28195 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952666 d!115727))

(declare-fun d!115729 () Bool)

(assert (=> d!115729 (= (array_inv!21587 (_values!5834 thiss!1141)) (bvsge (size!28194 (_values!5834 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952666 d!115729))

(declare-fun mapIsEmpty!33117 () Bool)

(declare-fun mapRes!33117 () Bool)

(assert (=> mapIsEmpty!33117 mapRes!33117))

(declare-fun mapNonEmpty!33117 () Bool)

(declare-fun tp!63462 () Bool)

(declare-fun e!536678 () Bool)

(assert (=> mapNonEmpty!33117 (= mapRes!33117 (and tp!63462 e!536678))))

(declare-fun mapRest!33117 () (Array (_ BitVec 32) ValueCell!9911))

(declare-fun mapValue!33117 () ValueCell!9911)

(declare-fun mapKey!33117 () (_ BitVec 32))

(assert (=> mapNonEmpty!33117 (= mapRest!33108 (store mapRest!33117 mapKey!33117 mapValue!33117))))

(declare-fun condMapEmpty!33117 () Bool)

(declare-fun mapDefault!33117 () ValueCell!9911)

(assert (=> mapNonEmpty!33108 (= condMapEmpty!33117 (= mapRest!33108 ((as const (Array (_ BitVec 32) ValueCell!9911)) mapDefault!33117)))))

(declare-fun e!536677 () Bool)

(assert (=> mapNonEmpty!33108 (= tp!63447 (and e!536677 mapRes!33117))))

(declare-fun b!952861 () Bool)

(assert (=> b!952861 (= e!536678 tp_is_empty!20785)))

(declare-fun b!952862 () Bool)

(assert (=> b!952862 (= e!536677 tp_is_empty!20785)))

(assert (= (and mapNonEmpty!33108 condMapEmpty!33117) mapIsEmpty!33117))

(assert (= (and mapNonEmpty!33108 (not condMapEmpty!33117)) mapNonEmpty!33117))

(assert (= (and mapNonEmpty!33117 ((_ is ValueCellFull!9911) mapValue!33117)) b!952861))

(assert (= (and mapNonEmpty!33108 ((_ is ValueCellFull!9911) mapDefault!33117)) b!952862))

(declare-fun m!885433 () Bool)

(assert (=> mapNonEmpty!33117 m!885433))

(declare-fun b_lambda!14415 () Bool)

(assert (= b_lambda!14413 (or (and b!952666 b_free!18277) b_lambda!14415)))

(check-sat b_and!29765 (not b!952741) (not bm!41577) (not b!952768) (not mapNonEmpty!33117) (not d!115719) (not d!115707) (not b_lambda!14415) tp_is_empty!20785 (not b!952829) (not b!952780) (not b!952842) (not bm!41576) (not b!952835) (not b!952833) (not b!952734) (not d!115711) (not b!952826) (not b!952729) (not b!952854) (not d!115723) (not bm!41580) (not d!115725) (not b!952778) (not b!952828) (not b!952753) (not b!952853) (not bm!41578) (not bm!41559) (not b_next!18277) (not b!952838) (not d!115721) (not b!952750) (not b!952827) (not b!952852))
(check-sat b_and!29765 (not b_next!18277))
(get-model)

(declare-fun d!115731 () Bool)

(declare-fun e!536681 () Bool)

(assert (=> d!115731 e!536681))

(declare-fun res!638205 () Bool)

(assert (=> d!115731 (=> (not res!638205) (not e!536681))))

(declare-fun lt!429269 () ListLongMap!12255)

(assert (=> d!115731 (= res!638205 (contains!5247 lt!429269 (_1!6789 (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))))

(declare-fun lt!429270 () List!19346)

(assert (=> d!115731 (= lt!429269 (ListLongMap!12256 lt!429270))))

(declare-fun lt!429271 () Unit!32008)

(declare-fun lt!429268 () Unit!32008)

(assert (=> d!115731 (= lt!429271 lt!429268)))

(assert (=> d!115731 (= (getValueByKey!501 lt!429270 (_1!6789 (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))) (Some!506 (_2!6789 (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!268 (List!19346 (_ BitVec 64) V!32679) Unit!32008)

(assert (=> d!115731 (= lt!429268 (lemmaContainsTupThenGetReturnValue!268 lt!429270 (_1!6789 (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))) (_2!6789 (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))))

(declare-fun insertStrictlySorted!325 (List!19346 (_ BitVec 64) V!32679) List!19346)

(assert (=> d!115731 (= lt!429270 (insertStrictlySorted!325 (toList!6143 (ite c!99817 call!41577 (ite c!99816 call!41581 call!41582))) (_1!6789 (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))) (_2!6789 (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))))

(assert (=> d!115731 (= (+!2879 (ite c!99817 call!41577 (ite c!99816 call!41581 call!41582)) (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))) lt!429269)))

(declare-fun b!952867 () Bool)

(declare-fun res!638206 () Bool)

(assert (=> b!952867 (=> (not res!638206) (not e!536681))))

(assert (=> b!952867 (= res!638206 (= (getValueByKey!501 (toList!6143 lt!429269) (_1!6789 (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))) (Some!506 (_2!6789 (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))))

(declare-fun b!952868 () Bool)

(declare-fun contains!5249 (List!19346 tuple2!13556) Bool)

(assert (=> b!952868 (= e!536681 (contains!5249 (toList!6143 lt!429269) (ite (or c!99817 c!99816) (tuple2!13557 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(assert (= (and d!115731 res!638205) b!952867))

(assert (= (and b!952867 res!638206) b!952868))

(declare-fun m!885435 () Bool)

(assert (=> d!115731 m!885435))

(declare-fun m!885437 () Bool)

(assert (=> d!115731 m!885437))

(declare-fun m!885439 () Bool)

(assert (=> d!115731 m!885439))

(declare-fun m!885441 () Bool)

(assert (=> d!115731 m!885441))

(declare-fun m!885443 () Bool)

(assert (=> b!952867 m!885443))

(declare-fun m!885445 () Bool)

(assert (=> b!952868 m!885445))

(assert (=> bm!41577 d!115731))

(assert (=> d!115723 d!115717))

(assert (=> b!952734 d!115709))

(declare-fun b!952869 () Bool)

(declare-fun e!536684 () Bool)

(declare-fun e!536682 () Bool)

(assert (=> b!952869 (= e!536684 e!536682)))

(declare-fun lt!429274 () (_ BitVec 64))

(assert (=> b!952869 (= lt!429274 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429273 () Unit!32008)

(assert (=> b!952869 (= lt!429273 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10786 thiss!1141) lt!429274 #b00000000000000000000000000000000))))

(assert (=> b!952869 (arrayContainsKey!0 (_keys!10786 thiss!1141) lt!429274 #b00000000000000000000000000000000)))

(declare-fun lt!429272 () Unit!32008)

(assert (=> b!952869 (= lt!429272 lt!429273)))

(declare-fun res!638208 () Bool)

(assert (=> b!952869 (= res!638208 (= (seekEntryOrOpen!0 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000) (_keys!10786 thiss!1141) (mask!27685 thiss!1141)) (Found!9114 #b00000000000000000000000000000000)))))

(assert (=> b!952869 (=> (not res!638208) (not e!536682))))

(declare-fun b!952870 () Bool)

(declare-fun call!41584 () Bool)

(assert (=> b!952870 (= e!536682 call!41584)))

(declare-fun bm!41581 () Bool)

(assert (=> bm!41581 (= call!41584 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))

(declare-fun d!115733 () Bool)

(declare-fun res!638207 () Bool)

(declare-fun e!536683 () Bool)

(assert (=> d!115733 (=> res!638207 e!536683)))

(assert (=> d!115733 (= res!638207 (bvsge #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(assert (=> d!115733 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)) e!536683)))

(declare-fun b!952871 () Bool)

(assert (=> b!952871 (= e!536684 call!41584)))

(declare-fun b!952872 () Bool)

(assert (=> b!952872 (= e!536683 e!536684)))

(declare-fun c!99820 () Bool)

(assert (=> b!952872 (= c!99820 (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115733 (not res!638207)) b!952872))

(assert (= (and b!952872 c!99820) b!952869))

(assert (= (and b!952872 (not c!99820)) b!952871))

(assert (= (and b!952869 res!638208) b!952870))

(assert (= (or b!952870 b!952871) bm!41581))

(assert (=> b!952869 m!885329))

(declare-fun m!885447 () Bool)

(assert (=> b!952869 m!885447))

(declare-fun m!885449 () Bool)

(assert (=> b!952869 m!885449))

(assert (=> b!952869 m!885329))

(declare-fun m!885451 () Bool)

(assert (=> b!952869 m!885451))

(declare-fun m!885453 () Bool)

(assert (=> bm!41581 m!885453))

(assert (=> b!952872 m!885329))

(assert (=> b!952872 m!885329))

(assert (=> b!952872 m!885377))

(assert (=> b!952853 d!115733))

(declare-fun bm!41584 () Bool)

(declare-fun call!41587 () Bool)

(declare-fun c!99823 () Bool)

(assert (=> bm!41584 (= call!41587 (arrayNoDuplicates!0 (_keys!10786 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99823 (Cons!19344 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000) Nil!19345) Nil!19345)))))

(declare-fun d!115735 () Bool)

(declare-fun res!638215 () Bool)

(declare-fun e!536695 () Bool)

(assert (=> d!115735 (=> res!638215 e!536695)))

(assert (=> d!115735 (= res!638215 (bvsge #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(assert (=> d!115735 (= (arrayNoDuplicates!0 (_keys!10786 thiss!1141) #b00000000000000000000000000000000 Nil!19345) e!536695)))

(declare-fun b!952883 () Bool)

(declare-fun e!536693 () Bool)

(declare-fun e!536694 () Bool)

(assert (=> b!952883 (= e!536693 e!536694)))

(assert (=> b!952883 (= c!99823 (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952884 () Bool)

(declare-fun e!536696 () Bool)

(declare-fun contains!5250 (List!19348 (_ BitVec 64)) Bool)

(assert (=> b!952884 (= e!536696 (contains!5250 Nil!19345 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952885 () Bool)

(assert (=> b!952885 (= e!536694 call!41587)))

(declare-fun b!952886 () Bool)

(assert (=> b!952886 (= e!536695 e!536693)))

(declare-fun res!638216 () Bool)

(assert (=> b!952886 (=> (not res!638216) (not e!536693))))

(assert (=> b!952886 (= res!638216 (not e!536696))))

(declare-fun res!638217 () Bool)

(assert (=> b!952886 (=> (not res!638217) (not e!536696))))

(assert (=> b!952886 (= res!638217 (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952887 () Bool)

(assert (=> b!952887 (= e!536694 call!41587)))

(assert (= (and d!115735 (not res!638215)) b!952886))

(assert (= (and b!952886 res!638217) b!952884))

(assert (= (and b!952886 res!638216) b!952883))

(assert (= (and b!952883 c!99823) b!952885))

(assert (= (and b!952883 (not c!99823)) b!952887))

(assert (= (or b!952885 b!952887) bm!41584))

(assert (=> bm!41584 m!885329))

(declare-fun m!885455 () Bool)

(assert (=> bm!41584 m!885455))

(assert (=> b!952883 m!885329))

(assert (=> b!952883 m!885329))

(assert (=> b!952883 m!885377))

(assert (=> b!952884 m!885329))

(assert (=> b!952884 m!885329))

(declare-fun m!885457 () Bool)

(assert (=> b!952884 m!885457))

(assert (=> b!952886 m!885329))

(assert (=> b!952886 m!885329))

(assert (=> b!952886 m!885377))

(assert (=> b!952854 d!115735))

(declare-fun d!115737 () Bool)

(declare-fun get!14580 (Option!507) V!32679)

(assert (=> d!115737 (= (apply!893 lt!429253 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14580 (getValueByKey!501 (toList!6143 lt!429253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26756 () Bool)

(assert (= bs!26756 d!115737))

(declare-fun m!885459 () Bool)

(assert (=> bs!26756 m!885459))

(assert (=> bs!26756 m!885459))

(declare-fun m!885461 () Bool)

(assert (=> bs!26756 m!885461))

(assert (=> b!952838 d!115737))

(declare-fun d!115739 () Bool)

(declare-fun lt!429275 () (_ BitVec 32))

(assert (=> d!115739 (and (or (bvslt lt!429275 #b00000000000000000000000000000000) (bvsge lt!429275 (size!28195 (_keys!10786 thiss!1141))) (and (bvsge lt!429275 #b00000000000000000000000000000000) (bvslt lt!429275 (size!28195 (_keys!10786 thiss!1141))))) (bvsge lt!429275 #b00000000000000000000000000000000) (bvslt lt!429275 (size!28195 (_keys!10786 thiss!1141))) (= (select (arr!27716 (_keys!10786 thiss!1141)) lt!429275) key!756))))

(declare-fun e!536697 () (_ BitVec 32))

(assert (=> d!115739 (= lt!429275 e!536697)))

(declare-fun c!99824 () Bool)

(assert (=> d!115739 (= c!99824 (= (select (arr!27716 (_keys!10786 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115739 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28195 (_keys!10786 thiss!1141))) (bvslt (size!28195 (_keys!10786 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115739 (= (arrayScanForKey!0 (_keys!10786 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!429275)))

(declare-fun b!952888 () Bool)

(assert (=> b!952888 (= e!536697 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!952889 () Bool)

(assert (=> b!952889 (= e!536697 (arrayScanForKey!0 (_keys!10786 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115739 c!99824) b!952888))

(assert (= (and d!115739 (not c!99824)) b!952889))

(declare-fun m!885463 () Bool)

(assert (=> d!115739 m!885463))

(declare-fun m!885465 () Bool)

(assert (=> d!115739 m!885465))

(declare-fun m!885467 () Bool)

(assert (=> b!952889 m!885467))

(assert (=> b!952741 d!115739))

(declare-fun b!952914 () Bool)

(declare-fun e!536715 () ListLongMap!12255)

(assert (=> b!952914 (= e!536715 (ListLongMap!12256 Nil!19343))))

(declare-fun b!952915 () Bool)

(declare-fun lt!429295 () Unit!32008)

(declare-fun lt!429291 () Unit!32008)

(assert (=> b!952915 (= lt!429295 lt!429291)))

(declare-fun lt!429292 () (_ BitVec 64))

(declare-fun lt!429294 () (_ BitVec 64))

(declare-fun lt!429293 () V!32679)

(declare-fun lt!429290 () ListLongMap!12255)

(assert (=> b!952915 (not (contains!5247 (+!2879 lt!429290 (tuple2!13557 lt!429292 lt!429293)) lt!429294))))

(declare-fun addStillNotContains!230 (ListLongMap!12255 (_ BitVec 64) V!32679 (_ BitVec 64)) Unit!32008)

(assert (=> b!952915 (= lt!429291 (addStillNotContains!230 lt!429290 lt!429292 lt!429293 lt!429294))))

(assert (=> b!952915 (= lt!429294 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!952915 (= lt!429293 (get!14579 (select (arr!27715 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1676 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!952915 (= lt!429292 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun call!41590 () ListLongMap!12255)

(assert (=> b!952915 (= lt!429290 call!41590)))

(declare-fun e!536713 () ListLongMap!12255)

(assert (=> b!952915 (= e!536713 (+!2879 call!41590 (tuple2!13557 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000) (get!14579 (select (arr!27715 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1676 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!952916 () Bool)

(declare-fun e!536718 () Bool)

(declare-fun e!536714 () Bool)

(assert (=> b!952916 (= e!536718 e!536714)))

(assert (=> b!952916 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun res!638229 () Bool)

(declare-fun lt!429296 () ListLongMap!12255)

(assert (=> b!952916 (= res!638229 (contains!5247 lt!429296 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952916 (=> (not res!638229) (not e!536714))))

(declare-fun b!952917 () Bool)

(declare-fun e!536717 () Bool)

(assert (=> b!952917 (= e!536718 e!536717)))

(declare-fun c!99836 () Bool)

(assert (=> b!952917 (= c!99836 (bvslt #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun b!952918 () Bool)

(declare-fun e!536712 () Bool)

(assert (=> b!952918 (= e!536712 (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952918 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!952919 () Bool)

(declare-fun e!536716 () Bool)

(assert (=> b!952919 (= e!536716 e!536718)))

(declare-fun c!99835 () Bool)

(assert (=> b!952919 (= c!99835 e!536712)))

(declare-fun res!638226 () Bool)

(assert (=> b!952919 (=> (not res!638226) (not e!536712))))

(assert (=> b!952919 (= res!638226 (bvslt #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun b!952920 () Bool)

(declare-fun isEmpty!720 (ListLongMap!12255) Bool)

(assert (=> b!952920 (= e!536717 (isEmpty!720 lt!429296))))

(declare-fun b!952921 () Bool)

(assert (=> b!952921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(assert (=> b!952921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28194 (_values!5834 thiss!1141))))))

(assert (=> b!952921 (= e!536714 (= (apply!893 lt!429296 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)) (get!14579 (select (arr!27715 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1676 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!115741 () Bool)

(assert (=> d!115741 e!536716))

(declare-fun res!638227 () Bool)

(assert (=> d!115741 (=> (not res!638227) (not e!536716))))

(assert (=> d!115741 (= res!638227 (not (contains!5247 lt!429296 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!115741 (= lt!429296 e!536715)))

(declare-fun c!99833 () Bool)

(assert (=> d!115741 (= c!99833 (bvsge #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(assert (=> d!115741 (validMask!0 (mask!27685 thiss!1141))))

(assert (=> d!115741 (= (getCurrentListMapNoExtraKeys!3367 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)) lt!429296)))

(declare-fun b!952922 () Bool)

(declare-fun res!638228 () Bool)

(assert (=> b!952922 (=> (not res!638228) (not e!536716))))

(assert (=> b!952922 (= res!638228 (not (contains!5247 lt!429296 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!952923 () Bool)

(assert (=> b!952923 (= e!536717 (= lt!429296 (getCurrentListMapNoExtraKeys!3367 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5811 thiss!1141))))))

(declare-fun b!952924 () Bool)

(assert (=> b!952924 (= e!536713 call!41590)))

(declare-fun b!952925 () Bool)

(assert (=> b!952925 (= e!536715 e!536713)))

(declare-fun c!99834 () Bool)

(assert (=> b!952925 (= c!99834 (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41587 () Bool)

(assert (=> bm!41587 (= call!41590 (getCurrentListMapNoExtraKeys!3367 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5811 thiss!1141)))))

(assert (= (and d!115741 c!99833) b!952914))

(assert (= (and d!115741 (not c!99833)) b!952925))

(assert (= (and b!952925 c!99834) b!952915))

(assert (= (and b!952925 (not c!99834)) b!952924))

(assert (= (or b!952915 b!952924) bm!41587))

(assert (= (and d!115741 res!638227) b!952922))

(assert (= (and b!952922 res!638228) b!952919))

(assert (= (and b!952919 res!638226) b!952918))

(assert (= (and b!952919 c!99835) b!952916))

(assert (= (and b!952919 (not c!99835)) b!952917))

(assert (= (and b!952916 res!638229) b!952921))

(assert (= (and b!952917 c!99836) b!952923))

(assert (= (and b!952917 (not c!99836)) b!952920))

(declare-fun b_lambda!14417 () Bool)

(assert (=> (not b_lambda!14417) (not b!952915)))

(assert (=> b!952915 t!27692))

(declare-fun b_and!29767 () Bool)

(assert (= b_and!29765 (and (=> t!27692 result!12323) b_and!29767)))

(declare-fun b_lambda!14419 () Bool)

(assert (=> (not b_lambda!14419) (not b!952921)))

(assert (=> b!952921 t!27692))

(declare-fun b_and!29769 () Bool)

(assert (= b_and!29767 (and (=> t!27692 result!12323) b_and!29769)))

(declare-fun m!885469 () Bool)

(assert (=> bm!41587 m!885469))

(assert (=> b!952918 m!885329))

(assert (=> b!952918 m!885329))

(assert (=> b!952918 m!885377))

(declare-fun m!885471 () Bool)

(assert (=> d!115741 m!885471))

(assert (=> d!115741 m!885259))

(assert (=> b!952923 m!885469))

(assert (=> b!952925 m!885329))

(assert (=> b!952925 m!885329))

(assert (=> b!952925 m!885377))

(declare-fun m!885473 () Bool)

(assert (=> b!952922 m!885473))

(assert (=> b!952915 m!885381))

(declare-fun m!885475 () Bool)

(assert (=> b!952915 m!885475))

(assert (=> b!952915 m!885329))

(assert (=> b!952915 m!885379))

(assert (=> b!952915 m!885381))

(assert (=> b!952915 m!885383))

(declare-fun m!885477 () Bool)

(assert (=> b!952915 m!885477))

(declare-fun m!885479 () Bool)

(assert (=> b!952915 m!885479))

(declare-fun m!885481 () Bool)

(assert (=> b!952915 m!885481))

(assert (=> b!952915 m!885477))

(assert (=> b!952915 m!885379))

(assert (=> b!952916 m!885329))

(assert (=> b!952916 m!885329))

(declare-fun m!885483 () Bool)

(assert (=> b!952916 m!885483))

(declare-fun m!885485 () Bool)

(assert (=> b!952920 m!885485))

(assert (=> b!952921 m!885329))

(declare-fun m!885487 () Bool)

(assert (=> b!952921 m!885487))

(assert (=> b!952921 m!885381))

(assert (=> b!952921 m!885329))

(assert (=> b!952921 m!885379))

(assert (=> b!952921 m!885381))

(assert (=> b!952921 m!885383))

(assert (=> b!952921 m!885379))

(assert (=> bm!41578 d!115741))

(declare-fun b!952938 () Bool)

(declare-fun e!536725 () SeekEntryResult!9114)

(declare-fun e!536727 () SeekEntryResult!9114)

(assert (=> b!952938 (= e!536725 e!536727)))

(declare-fun c!99844 () Bool)

(declare-fun lt!429302 () (_ BitVec 64))

(assert (=> b!952938 (= c!99844 (= lt!429302 key!756))))

(declare-fun d!115743 () Bool)

(declare-fun lt!429301 () SeekEntryResult!9114)

(assert (=> d!115743 (and (or ((_ is Undefined!9114) lt!429301) (not ((_ is Found!9114) lt!429301)) (and (bvsge (index!38828 lt!429301) #b00000000000000000000000000000000) (bvslt (index!38828 lt!429301) (size!28195 (_keys!10786 thiss!1141))))) (or ((_ is Undefined!9114) lt!429301) ((_ is Found!9114) lt!429301) (not ((_ is MissingVacant!9114) lt!429301)) (not (= (index!38830 lt!429301) (index!38829 lt!429179))) (and (bvsge (index!38830 lt!429301) #b00000000000000000000000000000000) (bvslt (index!38830 lt!429301) (size!28195 (_keys!10786 thiss!1141))))) (or ((_ is Undefined!9114) lt!429301) (ite ((_ is Found!9114) lt!429301) (= (select (arr!27716 (_keys!10786 thiss!1141)) (index!38828 lt!429301)) key!756) (and ((_ is MissingVacant!9114) lt!429301) (= (index!38830 lt!429301) (index!38829 lt!429179)) (= (select (arr!27716 (_keys!10786 thiss!1141)) (index!38830 lt!429301)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!115743 (= lt!429301 e!536725)))

(declare-fun c!99845 () Bool)

(assert (=> d!115743 (= c!99845 (bvsge (x!81862 lt!429179) #b01111111111111111111111111111110))))

(assert (=> d!115743 (= lt!429302 (select (arr!27716 (_keys!10786 thiss!1141)) (index!38829 lt!429179)))))

(assert (=> d!115743 (validMask!0 (mask!27685 thiss!1141))))

(assert (=> d!115743 (= (seekKeyOrZeroReturnVacant!0 (x!81862 lt!429179) (index!38829 lt!429179) (index!38829 lt!429179) key!756 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)) lt!429301)))

(declare-fun b!952939 () Bool)

(declare-fun c!99843 () Bool)

(assert (=> b!952939 (= c!99843 (= lt!429302 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536726 () SeekEntryResult!9114)

(assert (=> b!952939 (= e!536727 e!536726)))

(declare-fun b!952940 () Bool)

(assert (=> b!952940 (= e!536727 (Found!9114 (index!38829 lt!429179)))))

(declare-fun b!952941 () Bool)

(assert (=> b!952941 (= e!536725 Undefined!9114)))

(declare-fun b!952942 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952942 (= e!536726 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81862 lt!429179) #b00000000000000000000000000000001) (nextIndex!0 (index!38829 lt!429179) (bvadd (x!81862 lt!429179) #b00000000000000000000000000000001) (mask!27685 thiss!1141)) (index!38829 lt!429179) key!756 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))

(declare-fun b!952943 () Bool)

(assert (=> b!952943 (= e!536726 (MissingVacant!9114 (index!38829 lt!429179)))))

(assert (= (and d!115743 c!99845) b!952941))

(assert (= (and d!115743 (not c!99845)) b!952938))

(assert (= (and b!952938 c!99844) b!952940))

(assert (= (and b!952938 (not c!99844)) b!952939))

(assert (= (and b!952939 c!99843) b!952943))

(assert (= (and b!952939 (not c!99843)) b!952942))

(declare-fun m!885489 () Bool)

(assert (=> d!115743 m!885489))

(declare-fun m!885491 () Bool)

(assert (=> d!115743 m!885491))

(assert (=> d!115743 m!885359))

(assert (=> d!115743 m!885259))

(declare-fun m!885493 () Bool)

(assert (=> b!952942 m!885493))

(assert (=> b!952942 m!885493))

(declare-fun m!885495 () Bool)

(assert (=> b!952942 m!885495))

(assert (=> b!952768 d!115743))

(declare-fun d!115745 () Bool)

(assert (=> d!115745 (= (apply!893 lt!429253 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)) (get!14580 (getValueByKey!501 (toList!6143 lt!429253) (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26757 () Bool)

(assert (= bs!26757 d!115745))

(assert (=> bs!26757 m!885329))

(declare-fun m!885497 () Bool)

(assert (=> bs!26757 m!885497))

(assert (=> bs!26757 m!885497))

(declare-fun m!885499 () Bool)

(assert (=> bs!26757 m!885499))

(assert (=> b!952842 d!115745))

(declare-fun d!115747 () Bool)

(declare-fun c!99848 () Bool)

(assert (=> d!115747 (= c!99848 ((_ is ValueCellFull!9911) (select (arr!27715 (_values!5834 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!536730 () V!32679)

(assert (=> d!115747 (= (get!14579 (select (arr!27715 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1676 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!536730)))

(declare-fun b!952948 () Bool)

(declare-fun get!14581 (ValueCell!9911 V!32679) V!32679)

(assert (=> b!952948 (= e!536730 (get!14581 (select (arr!27715 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1676 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!952949 () Bool)

(declare-fun get!14582 (ValueCell!9911 V!32679) V!32679)

(assert (=> b!952949 (= e!536730 (get!14582 (select (arr!27715 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1676 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115747 c!99848) b!952948))

(assert (= (and d!115747 (not c!99848)) b!952949))

(assert (=> b!952948 m!885379))

(assert (=> b!952948 m!885381))

(declare-fun m!885501 () Bool)

(assert (=> b!952948 m!885501))

(assert (=> b!952949 m!885379))

(assert (=> b!952949 m!885381))

(declare-fun m!885503 () Bool)

(assert (=> b!952949 m!885503))

(assert (=> b!952842 d!115747))

(declare-fun d!115749 () Bool)

(assert (=> d!115749 (isDefined!374 (getValueByKey!501 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(declare-fun lt!429305 () Unit!32008)

(declare-fun choose!1600 (List!19346 (_ BitVec 64)) Unit!32008)

(assert (=> d!115749 (= lt!429305 (choose!1600 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(declare-fun e!536733 () Bool)

(assert (=> d!115749 e!536733))

(declare-fun res!638232 () Bool)

(assert (=> d!115749 (=> (not res!638232) (not e!536733))))

(declare-fun isStrictlySorted!501 (List!19346) Bool)

(assert (=> d!115749 (= res!638232 (isStrictlySorted!501 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))))

(assert (=> d!115749 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756) lt!429305)))

(declare-fun b!952952 () Bool)

(assert (=> b!952952 (= e!536733 (containsKey!472 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(assert (= (and d!115749 res!638232) b!952952))

(assert (=> d!115749 m!885365))

(assert (=> d!115749 m!885365))

(assert (=> d!115749 m!885367))

(declare-fun m!885505 () Bool)

(assert (=> d!115749 m!885505))

(declare-fun m!885507 () Bool)

(assert (=> d!115749 m!885507))

(assert (=> b!952952 m!885361))

(assert (=> b!952778 d!115749))

(declare-fun d!115751 () Bool)

(declare-fun isEmpty!721 (Option!507) Bool)

(assert (=> d!115751 (= (isDefined!374 (getValueByKey!501 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756)) (not (isEmpty!721 (getValueByKey!501 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))))

(declare-fun bs!26758 () Bool)

(assert (= bs!26758 d!115751))

(assert (=> bs!26758 m!885365))

(declare-fun m!885509 () Bool)

(assert (=> bs!26758 m!885509))

(assert (=> b!952778 d!115751))

(declare-fun b!952964 () Bool)

(declare-fun e!536739 () Option!507)

(assert (=> b!952964 (= e!536739 None!505)))

(declare-fun b!952963 () Bool)

(assert (=> b!952963 (= e!536739 (getValueByKey!501 (t!27689 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) key!756))))

(declare-fun b!952961 () Bool)

(declare-fun e!536738 () Option!507)

(assert (=> b!952961 (= e!536738 (Some!506 (_2!6789 (h!20509 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))))))

(declare-fun d!115753 () Bool)

(declare-fun c!99853 () Bool)

(assert (=> d!115753 (= c!99853 (and ((_ is Cons!19342) (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) (= (_1!6789 (h!20509 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) key!756)))))

(assert (=> d!115753 (= (getValueByKey!501 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756) e!536738)))

(declare-fun b!952962 () Bool)

(assert (=> b!952962 (= e!536738 e!536739)))

(declare-fun c!99854 () Bool)

(assert (=> b!952962 (= c!99854 (and ((_ is Cons!19342) (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) (not (= (_1!6789 (h!20509 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) key!756))))))

(assert (= (and d!115753 c!99853) b!952961))

(assert (= (and d!115753 (not c!99853)) b!952962))

(assert (= (and b!952962 c!99854) b!952963))

(assert (= (and b!952962 (not c!99854)) b!952964))

(declare-fun m!885511 () Bool)

(assert (=> b!952963 m!885511))

(assert (=> b!952778 d!115753))

(declare-fun d!115755 () Bool)

(declare-fun e!536740 () Bool)

(assert (=> d!115755 e!536740))

(declare-fun res!638233 () Bool)

(assert (=> d!115755 (=> res!638233 e!536740)))

(declare-fun lt!429306 () Bool)

(assert (=> d!115755 (= res!638233 (not lt!429306))))

(declare-fun lt!429309 () Bool)

(assert (=> d!115755 (= lt!429306 lt!429309)))

(declare-fun lt!429307 () Unit!32008)

(declare-fun e!536741 () Unit!32008)

(assert (=> d!115755 (= lt!429307 e!536741)))

(declare-fun c!99855 () Bool)

(assert (=> d!115755 (= c!99855 lt!429309)))

(assert (=> d!115755 (= lt!429309 (containsKey!472 (toList!6143 lt!429253) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115755 (= (contains!5247 lt!429253 #b1000000000000000000000000000000000000000000000000000000000000000) lt!429306)))

(declare-fun b!952965 () Bool)

(declare-fun lt!429308 () Unit!32008)

(assert (=> b!952965 (= e!536741 lt!429308)))

(assert (=> b!952965 (= lt!429308 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6143 lt!429253) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952965 (isDefined!374 (getValueByKey!501 (toList!6143 lt!429253) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952966 () Bool)

(declare-fun Unit!32014 () Unit!32008)

(assert (=> b!952966 (= e!536741 Unit!32014)))

(declare-fun b!952967 () Bool)

(assert (=> b!952967 (= e!536740 (isDefined!374 (getValueByKey!501 (toList!6143 lt!429253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115755 c!99855) b!952965))

(assert (= (and d!115755 (not c!99855)) b!952966))

(assert (= (and d!115755 (not res!638233)) b!952967))

(declare-fun m!885513 () Bool)

(assert (=> d!115755 m!885513))

(declare-fun m!885515 () Bool)

(assert (=> b!952965 m!885515))

(assert (=> b!952965 m!885459))

(assert (=> b!952965 m!885459))

(declare-fun m!885517 () Bool)

(assert (=> b!952965 m!885517))

(assert (=> b!952967 m!885459))

(assert (=> b!952967 m!885459))

(assert (=> b!952967 m!885517))

(assert (=> bm!41580 d!115755))

(declare-fun d!115757 () Bool)

(assert (=> d!115757 (= (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952828 d!115757))

(declare-fun d!115759 () Bool)

(declare-fun e!536742 () Bool)

(assert (=> d!115759 e!536742))

(declare-fun res!638234 () Bool)

(assert (=> d!115759 (=> (not res!638234) (not e!536742))))

(declare-fun lt!429311 () ListLongMap!12255)

(assert (=> d!115759 (= res!638234 (contains!5247 lt!429311 (_1!6789 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(declare-fun lt!429312 () List!19346)

(assert (=> d!115759 (= lt!429311 (ListLongMap!12256 lt!429312))))

(declare-fun lt!429313 () Unit!32008)

(declare-fun lt!429310 () Unit!32008)

(assert (=> d!115759 (= lt!429313 lt!429310)))

(assert (=> d!115759 (= (getValueByKey!501 lt!429312 (_1!6789 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))) (Some!506 (_2!6789 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(assert (=> d!115759 (= lt!429310 (lemmaContainsTupThenGetReturnValue!268 lt!429312 (_1!6789 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))) (_2!6789 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(assert (=> d!115759 (= lt!429312 (insertStrictlySorted!325 (toList!6143 call!41579) (_1!6789 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))) (_2!6789 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(assert (=> d!115759 (= (+!2879 call!41579 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))) lt!429311)))

(declare-fun b!952968 () Bool)

(declare-fun res!638235 () Bool)

(assert (=> b!952968 (=> (not res!638235) (not e!536742))))

(assert (=> b!952968 (= res!638235 (= (getValueByKey!501 (toList!6143 lt!429311) (_1!6789 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))) (Some!506 (_2!6789 (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))))

(declare-fun b!952969 () Bool)

(assert (=> b!952969 (= e!536742 (contains!5249 (toList!6143 lt!429311) (tuple2!13557 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))

(assert (= (and d!115759 res!638234) b!952968))

(assert (= (and b!952968 res!638235) b!952969))

(declare-fun m!885519 () Bool)

(assert (=> d!115759 m!885519))

(declare-fun m!885521 () Bool)

(assert (=> d!115759 m!885521))

(declare-fun m!885523 () Bool)

(assert (=> d!115759 m!885523))

(declare-fun m!885525 () Bool)

(assert (=> d!115759 m!885525))

(declare-fun m!885527 () Bool)

(assert (=> b!952968 m!885527))

(declare-fun m!885529 () Bool)

(assert (=> b!952969 m!885529))

(assert (=> b!952826 d!115759))

(declare-fun d!115761 () Bool)

(declare-fun e!536743 () Bool)

(assert (=> d!115761 e!536743))

(declare-fun res!638236 () Bool)

(assert (=> d!115761 (=> res!638236 e!536743)))

(declare-fun lt!429314 () Bool)

(assert (=> d!115761 (= res!638236 (not lt!429314))))

(declare-fun lt!429317 () Bool)

(assert (=> d!115761 (= lt!429314 lt!429317)))

(declare-fun lt!429315 () Unit!32008)

(declare-fun e!536744 () Unit!32008)

(assert (=> d!115761 (= lt!429315 e!536744)))

(declare-fun c!99856 () Bool)

(assert (=> d!115761 (= c!99856 lt!429317)))

(assert (=> d!115761 (= lt!429317 (containsKey!472 (toList!6143 lt!429253) (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115761 (= (contains!5247 lt!429253 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)) lt!429314)))

(declare-fun b!952970 () Bool)

(declare-fun lt!429316 () Unit!32008)

(assert (=> b!952970 (= e!536744 lt!429316)))

(assert (=> b!952970 (= lt!429316 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6143 lt!429253) (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952970 (isDefined!374 (getValueByKey!501 (toList!6143 lt!429253) (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952971 () Bool)

(declare-fun Unit!32015 () Unit!32008)

(assert (=> b!952971 (= e!536744 Unit!32015)))

(declare-fun b!952972 () Bool)

(assert (=> b!952972 (= e!536743 (isDefined!374 (getValueByKey!501 (toList!6143 lt!429253) (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115761 c!99856) b!952970))

(assert (= (and d!115761 (not c!99856)) b!952971))

(assert (= (and d!115761 (not res!638236)) b!952972))

(assert (=> d!115761 m!885329))

(declare-fun m!885531 () Bool)

(assert (=> d!115761 m!885531))

(assert (=> b!952970 m!885329))

(declare-fun m!885533 () Bool)

(assert (=> b!952970 m!885533))

(assert (=> b!952970 m!885329))

(assert (=> b!952970 m!885497))

(assert (=> b!952970 m!885497))

(declare-fun m!885535 () Bool)

(assert (=> b!952970 m!885535))

(assert (=> b!952972 m!885329))

(assert (=> b!952972 m!885497))

(assert (=> b!952972 m!885497))

(assert (=> b!952972 m!885535))

(assert (=> b!952827 d!115761))

(assert (=> b!952780 d!115751))

(assert (=> b!952780 d!115753))

(declare-fun d!115763 () Bool)

(assert (=> d!115763 (= (apply!893 lt!429253 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14580 (getValueByKey!501 (toList!6143 lt!429253) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26759 () Bool)

(assert (= bs!26759 d!115763))

(declare-fun m!885537 () Bool)

(assert (=> bs!26759 m!885537))

(assert (=> bs!26759 m!885537))

(declare-fun m!885539 () Bool)

(assert (=> bs!26759 m!885539))

(assert (=> b!952829 d!115763))

(declare-fun b!952991 () Bool)

(declare-fun e!536757 () SeekEntryResult!9114)

(declare-fun e!536758 () SeekEntryResult!9114)

(assert (=> b!952991 (= e!536757 e!536758)))

(declare-fun c!99865 () Bool)

(declare-fun lt!429323 () (_ BitVec 64))

(assert (=> b!952991 (= c!99865 (or (= lt!429323 key!756) (= (bvadd lt!429323 lt!429323) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!952992 () Bool)

(assert (=> b!952992 (= e!536757 (Intermediate!9114 true (toIndex!0 key!756 (mask!27685 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!952993 () Bool)

(declare-fun lt!429322 () SeekEntryResult!9114)

(assert (=> b!952993 (and (bvsge (index!38829 lt!429322) #b00000000000000000000000000000000) (bvslt (index!38829 lt!429322) (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun res!638243 () Bool)

(assert (=> b!952993 (= res!638243 (= (select (arr!27716 (_keys!10786 thiss!1141)) (index!38829 lt!429322)) key!756))))

(declare-fun e!536755 () Bool)

(assert (=> b!952993 (=> res!638243 e!536755)))

(declare-fun e!536756 () Bool)

(assert (=> b!952993 (= e!536756 e!536755)))

(declare-fun d!115765 () Bool)

(declare-fun e!536759 () Bool)

(assert (=> d!115765 e!536759))

(declare-fun c!99863 () Bool)

(assert (=> d!115765 (= c!99863 (and ((_ is Intermediate!9114) lt!429322) (undefined!9926 lt!429322)))))

(assert (=> d!115765 (= lt!429322 e!536757)))

(declare-fun c!99864 () Bool)

(assert (=> d!115765 (= c!99864 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!115765 (= lt!429323 (select (arr!27716 (_keys!10786 thiss!1141)) (toIndex!0 key!756 (mask!27685 thiss!1141))))))

(assert (=> d!115765 (validMask!0 (mask!27685 thiss!1141))))

(assert (=> d!115765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27685 thiss!1141)) key!756 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)) lt!429322)))

(declare-fun b!952994 () Bool)

(assert (=> b!952994 (= e!536758 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27685 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27685 thiss!1141)) key!756 (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))

(declare-fun b!952995 () Bool)

(assert (=> b!952995 (= e!536759 e!536756)))

(declare-fun res!638245 () Bool)

(assert (=> b!952995 (= res!638245 (and ((_ is Intermediate!9114) lt!429322) (not (undefined!9926 lt!429322)) (bvslt (x!81862 lt!429322) #b01111111111111111111111111111110) (bvsge (x!81862 lt!429322) #b00000000000000000000000000000000) (bvsge (x!81862 lt!429322) #b00000000000000000000000000000000)))))

(assert (=> b!952995 (=> (not res!638245) (not e!536756))))

(declare-fun b!952996 () Bool)

(assert (=> b!952996 (and (bvsge (index!38829 lt!429322) #b00000000000000000000000000000000) (bvslt (index!38829 lt!429322) (size!28195 (_keys!10786 thiss!1141))))))

(assert (=> b!952996 (= e!536755 (= (select (arr!27716 (_keys!10786 thiss!1141)) (index!38829 lt!429322)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952997 () Bool)

(assert (=> b!952997 (= e!536759 (bvsge (x!81862 lt!429322) #b01111111111111111111111111111110))))

(declare-fun b!952998 () Bool)

(assert (=> b!952998 (and (bvsge (index!38829 lt!429322) #b00000000000000000000000000000000) (bvslt (index!38829 lt!429322) (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun res!638244 () Bool)

(assert (=> b!952998 (= res!638244 (= (select (arr!27716 (_keys!10786 thiss!1141)) (index!38829 lt!429322)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952998 (=> res!638244 e!536755)))

(declare-fun b!952999 () Bool)

(assert (=> b!952999 (= e!536758 (Intermediate!9114 false (toIndex!0 key!756 (mask!27685 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!115765 c!99864) b!952992))

(assert (= (and d!115765 (not c!99864)) b!952991))

(assert (= (and b!952991 c!99865) b!952999))

(assert (= (and b!952991 (not c!99865)) b!952994))

(assert (= (and d!115765 c!99863) b!952997))

(assert (= (and d!115765 (not c!99863)) b!952995))

(assert (= (and b!952995 res!638245) b!952993))

(assert (= (and b!952993 (not res!638243)) b!952998))

(assert (= (and b!952998 (not res!638244)) b!952996))

(declare-fun m!885541 () Bool)

(assert (=> b!952993 m!885541))

(assert (=> b!952996 m!885541))

(assert (=> d!115765 m!885355))

(declare-fun m!885543 () Bool)

(assert (=> d!115765 m!885543))

(assert (=> d!115765 m!885259))

(assert (=> b!952994 m!885355))

(declare-fun m!885545 () Bool)

(assert (=> b!952994 m!885545))

(assert (=> b!952994 m!885545))

(declare-fun m!885547 () Bool)

(assert (=> b!952994 m!885547))

(assert (=> b!952998 m!885541))

(assert (=> d!115719 d!115765))

(declare-fun d!115767 () Bool)

(declare-fun lt!429329 () (_ BitVec 32))

(declare-fun lt!429328 () (_ BitVec 32))

(assert (=> d!115767 (= lt!429329 (bvmul (bvxor lt!429328 (bvlshr lt!429328 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115767 (= lt!429328 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115767 (and (bvsge (mask!27685 thiss!1141) #b00000000000000000000000000000000) (let ((res!638246 (let ((h!20512 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81882 (bvmul (bvxor h!20512 (bvlshr h!20512 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81882 (bvlshr x!81882 #b00000000000000000000000000001101)) (mask!27685 thiss!1141)))))) (and (bvslt res!638246 (bvadd (mask!27685 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!638246 #b00000000000000000000000000000000))))))

(assert (=> d!115767 (= (toIndex!0 key!756 (mask!27685 thiss!1141)) (bvand (bvxor lt!429329 (bvlshr lt!429329 #b00000000000000000000000000001101)) (mask!27685 thiss!1141)))))

(assert (=> d!115719 d!115767))

(assert (=> d!115719 d!115717))

(declare-fun d!115769 () Bool)

(assert (=> d!115769 (arrayContainsKey!0 (_keys!10786 thiss!1141) lt!429169 #b00000000000000000000000000000000)))

(declare-fun lt!429332 () Unit!32008)

(declare-fun choose!13 (array!57653 (_ BitVec 64) (_ BitVec 32)) Unit!32008)

(assert (=> d!115769 (= lt!429332 (choose!13 (_keys!10786 thiss!1141) lt!429169 lt!429131))))

(assert (=> d!115769 (bvsge lt!429131 #b00000000000000000000000000000000)))

(assert (=> d!115769 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10786 thiss!1141) lt!429169 lt!429131) lt!429332)))

(declare-fun bs!26760 () Bool)

(assert (= bs!26760 d!115769))

(assert (=> bs!26760 m!885343))

(declare-fun m!885549 () Bool)

(assert (=> bs!26760 m!885549))

(assert (=> b!952750 d!115769))

(declare-fun d!115771 () Bool)

(declare-fun res!638247 () Bool)

(declare-fun e!536760 () Bool)

(assert (=> d!115771 (=> res!638247 e!536760)))

(assert (=> d!115771 (= res!638247 (= (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000) lt!429169))))

(assert (=> d!115771 (= (arrayContainsKey!0 (_keys!10786 thiss!1141) lt!429169 #b00000000000000000000000000000000) e!536760)))

(declare-fun b!953000 () Bool)

(declare-fun e!536761 () Bool)

(assert (=> b!953000 (= e!536760 e!536761)))

(declare-fun res!638248 () Bool)

(assert (=> b!953000 (=> (not res!638248) (not e!536761))))

(assert (=> b!953000 (= res!638248 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun b!953001 () Bool)

(assert (=> b!953001 (= e!536761 (arrayContainsKey!0 (_keys!10786 thiss!1141) lt!429169 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115771 (not res!638247)) b!953000))

(assert (= (and b!953000 res!638248) b!953001))

(assert (=> d!115771 m!885329))

(declare-fun m!885551 () Bool)

(assert (=> b!953001 m!885551))

(assert (=> b!952750 d!115771))

(declare-fun b!953014 () Bool)

(declare-fun e!536768 () SeekEntryResult!9114)

(declare-fun e!536770 () SeekEntryResult!9114)

(assert (=> b!953014 (= e!536768 e!536770)))

(declare-fun lt!429340 () (_ BitVec 64))

(declare-fun lt!429341 () SeekEntryResult!9114)

(assert (=> b!953014 (= lt!429340 (select (arr!27716 (_keys!10786 thiss!1141)) (index!38829 lt!429341)))))

(declare-fun c!99873 () Bool)

(assert (=> b!953014 (= c!99873 (= lt!429340 (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131)))))

(declare-fun b!953015 () Bool)

(declare-fun e!536769 () SeekEntryResult!9114)

(assert (=> b!953015 (= e!536769 (MissingZero!9114 (index!38829 lt!429341)))))

(declare-fun b!953016 () Bool)

(assert (=> b!953016 (= e!536769 (seekKeyOrZeroReturnVacant!0 (x!81862 lt!429341) (index!38829 lt!429341) (index!38829 lt!429341) (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131) (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))

(declare-fun d!115773 () Bool)

(declare-fun lt!429339 () SeekEntryResult!9114)

(assert (=> d!115773 (and (or ((_ is Undefined!9114) lt!429339) (not ((_ is Found!9114) lt!429339)) (and (bvsge (index!38828 lt!429339) #b00000000000000000000000000000000) (bvslt (index!38828 lt!429339) (size!28195 (_keys!10786 thiss!1141))))) (or ((_ is Undefined!9114) lt!429339) ((_ is Found!9114) lt!429339) (not ((_ is MissingZero!9114) lt!429339)) (and (bvsge (index!38827 lt!429339) #b00000000000000000000000000000000) (bvslt (index!38827 lt!429339) (size!28195 (_keys!10786 thiss!1141))))) (or ((_ is Undefined!9114) lt!429339) ((_ is Found!9114) lt!429339) ((_ is MissingZero!9114) lt!429339) (not ((_ is MissingVacant!9114) lt!429339)) (and (bvsge (index!38830 lt!429339) #b00000000000000000000000000000000) (bvslt (index!38830 lt!429339) (size!28195 (_keys!10786 thiss!1141))))) (or ((_ is Undefined!9114) lt!429339) (ite ((_ is Found!9114) lt!429339) (= (select (arr!27716 (_keys!10786 thiss!1141)) (index!38828 lt!429339)) (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131)) (ite ((_ is MissingZero!9114) lt!429339) (= (select (arr!27716 (_keys!10786 thiss!1141)) (index!38827 lt!429339)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9114) lt!429339) (= (select (arr!27716 (_keys!10786 thiss!1141)) (index!38830 lt!429339)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!115773 (= lt!429339 e!536768)))

(declare-fun c!99874 () Bool)

(assert (=> d!115773 (= c!99874 (and ((_ is Intermediate!9114) lt!429341) (undefined!9926 lt!429341)))))

(assert (=> d!115773 (= lt!429341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131) (mask!27685 thiss!1141)) (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131) (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))

(assert (=> d!115773 (validMask!0 (mask!27685 thiss!1141))))

(assert (=> d!115773 (= (seekEntryOrOpen!0 (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131) (_keys!10786 thiss!1141) (mask!27685 thiss!1141)) lt!429339)))

(declare-fun b!953017 () Bool)

(assert (=> b!953017 (= e!536770 (Found!9114 (index!38829 lt!429341)))))

(declare-fun b!953018 () Bool)

(declare-fun c!99872 () Bool)

(assert (=> b!953018 (= c!99872 (= lt!429340 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!953018 (= e!536770 e!536769)))

(declare-fun b!953019 () Bool)

(assert (=> b!953019 (= e!536768 Undefined!9114)))

(assert (= (and d!115773 c!99874) b!953019))

(assert (= (and d!115773 (not c!99874)) b!953014))

(assert (= (and b!953014 c!99873) b!953017))

(assert (= (and b!953014 (not c!99873)) b!953018))

(assert (= (and b!953018 c!99872) b!953015))

(assert (= (and b!953018 (not c!99872)) b!953016))

(declare-fun m!885553 () Bool)

(assert (=> b!953014 m!885553))

(assert (=> b!953016 m!885339))

(declare-fun m!885555 () Bool)

(assert (=> b!953016 m!885555))

(declare-fun m!885557 () Bool)

(assert (=> d!115773 m!885557))

(declare-fun m!885559 () Bool)

(assert (=> d!115773 m!885559))

(assert (=> d!115773 m!885339))

(declare-fun m!885561 () Bool)

(assert (=> d!115773 m!885561))

(assert (=> d!115773 m!885339))

(assert (=> d!115773 m!885559))

(declare-fun m!885563 () Bool)

(assert (=> d!115773 m!885563))

(assert (=> d!115773 m!885259))

(declare-fun m!885565 () Bool)

(assert (=> d!115773 m!885565))

(assert (=> b!952750 d!115773))

(declare-fun d!115775 () Bool)

(declare-fun res!638249 () Bool)

(declare-fun e!536771 () Bool)

(assert (=> d!115775 (=> res!638249 e!536771)))

(assert (=> d!115775 (= res!638249 (= (select (arr!27716 (_keys!10786 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115775 (= (arrayContainsKey!0 (_keys!10786 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!536771)))

(declare-fun b!953020 () Bool)

(declare-fun e!536772 () Bool)

(assert (=> b!953020 (= e!536771 e!536772)))

(declare-fun res!638250 () Bool)

(assert (=> b!953020 (=> (not res!638250) (not e!536772))))

(assert (=> b!953020 (= res!638250 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28195 (_keys!10786 thiss!1141))))))

(declare-fun b!953021 () Bool)

(assert (=> b!953021 (= e!536772 (arrayContainsKey!0 (_keys!10786 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115775 (not res!638249)) b!953020))

(assert (= (and b!953020 res!638250) b!953021))

(assert (=> d!115775 m!885465))

(declare-fun m!885567 () Bool)

(assert (=> b!953021 m!885567))

(assert (=> b!952729 d!115775))

(declare-fun d!115777 () Bool)

(assert (=> d!115777 (= (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131)) (and (not (= (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27716 (_keys!10786 thiss!1141)) lt!429131) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952753 d!115777))

(declare-fun d!115779 () Bool)

(declare-fun res!638255 () Bool)

(declare-fun e!536777 () Bool)

(assert (=> d!115779 (=> res!638255 e!536777)))

(assert (=> d!115779 (= res!638255 (and ((_ is Cons!19342) (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) (= (_1!6789 (h!20509 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) key!756)))))

(assert (=> d!115779 (= (containsKey!472 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756) e!536777)))

(declare-fun b!953026 () Bool)

(declare-fun e!536778 () Bool)

(assert (=> b!953026 (= e!536777 e!536778)))

(declare-fun res!638256 () Bool)

(assert (=> b!953026 (=> (not res!638256) (not e!536778))))

(assert (=> b!953026 (= res!638256 (and (or (not ((_ is Cons!19342) (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) (bvsle (_1!6789 (h!20509 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) key!756)) ((_ is Cons!19342) (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) (bvslt (_1!6789 (h!20509 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) key!756)))))

(declare-fun b!953027 () Bool)

(assert (=> b!953027 (= e!536778 (containsKey!472 (t!27689 (toList!6143 (getCurrentListMap!3376 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) key!756))))

(assert (= (and d!115779 (not res!638255)) b!953026))

(assert (= (and b!953026 res!638256) b!953027))

(declare-fun m!885569 () Bool)

(assert (=> b!953027 m!885569))

(assert (=> d!115721 d!115779))

(declare-fun d!115781 () Bool)

(declare-fun e!536779 () Bool)

(assert (=> d!115781 e!536779))

(declare-fun res!638257 () Bool)

(assert (=> d!115781 (=> res!638257 e!536779)))

(declare-fun lt!429342 () Bool)

(assert (=> d!115781 (= res!638257 (not lt!429342))))

(declare-fun lt!429345 () Bool)

(assert (=> d!115781 (= lt!429342 lt!429345)))

(declare-fun lt!429343 () Unit!32008)

(declare-fun e!536780 () Unit!32008)

(assert (=> d!115781 (= lt!429343 e!536780)))

(declare-fun c!99875 () Bool)

(assert (=> d!115781 (= c!99875 lt!429345)))

(assert (=> d!115781 (= lt!429345 (containsKey!472 (toList!6143 lt!429253) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115781 (= (contains!5247 lt!429253 #b0000000000000000000000000000000000000000000000000000000000000000) lt!429342)))

(declare-fun b!953028 () Bool)

(declare-fun lt!429344 () Unit!32008)

(assert (=> b!953028 (= e!536780 lt!429344)))

(assert (=> b!953028 (= lt!429344 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6143 lt!429253) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!953028 (isDefined!374 (getValueByKey!501 (toList!6143 lt!429253) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!953029 () Bool)

(declare-fun Unit!32016 () Unit!32008)

(assert (=> b!953029 (= e!536780 Unit!32016)))

(declare-fun b!953030 () Bool)

(assert (=> b!953030 (= e!536779 (isDefined!374 (getValueByKey!501 (toList!6143 lt!429253) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115781 c!99875) b!953028))

(assert (= (and d!115781 (not c!99875)) b!953029))

(assert (= (and d!115781 (not res!638257)) b!953030))

(declare-fun m!885571 () Bool)

(assert (=> d!115781 m!885571))

(declare-fun m!885573 () Bool)

(assert (=> b!953028 m!885573))

(assert (=> b!953028 m!885537))

(assert (=> b!953028 m!885537))

(declare-fun m!885575 () Bool)

(assert (=> b!953028 m!885575))

(assert (=> b!953030 m!885537))

(assert (=> b!953030 m!885537))

(assert (=> b!953030 m!885575))

(assert (=> bm!41576 d!115781))

(declare-fun b!953031 () Bool)

(declare-fun e!536783 () Bool)

(declare-fun e!536781 () Bool)

(assert (=> b!953031 (= e!536783 e!536781)))

(declare-fun lt!429348 () (_ BitVec 64))

(assert (=> b!953031 (= lt!429348 (select (arr!27716 (_keys!10786 thiss!1141)) (bvadd lt!429131 #b00000000000000000000000000000001)))))

(declare-fun lt!429347 () Unit!32008)

(assert (=> b!953031 (= lt!429347 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10786 thiss!1141) lt!429348 (bvadd lt!429131 #b00000000000000000000000000000001)))))

(assert (=> b!953031 (arrayContainsKey!0 (_keys!10786 thiss!1141) lt!429348 #b00000000000000000000000000000000)))

(declare-fun lt!429346 () Unit!32008)

(assert (=> b!953031 (= lt!429346 lt!429347)))

(declare-fun res!638259 () Bool)

(assert (=> b!953031 (= res!638259 (= (seekEntryOrOpen!0 (select (arr!27716 (_keys!10786 thiss!1141)) (bvadd lt!429131 #b00000000000000000000000000000001)) (_keys!10786 thiss!1141) (mask!27685 thiss!1141)) (Found!9114 (bvadd lt!429131 #b00000000000000000000000000000001))))))

(assert (=> b!953031 (=> (not res!638259) (not e!536781))))

(declare-fun b!953032 () Bool)

(declare-fun call!41591 () Bool)

(assert (=> b!953032 (= e!536781 call!41591)))

(declare-fun bm!41588 () Bool)

(assert (=> bm!41588 (= call!41591 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429131 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10786 thiss!1141) (mask!27685 thiss!1141)))))

(declare-fun d!115783 () Bool)

(declare-fun res!638258 () Bool)

(declare-fun e!536782 () Bool)

(assert (=> d!115783 (=> res!638258 e!536782)))

(assert (=> d!115783 (= res!638258 (bvsge (bvadd lt!429131 #b00000000000000000000000000000001) (size!28195 (_keys!10786 thiss!1141))))))

(assert (=> d!115783 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429131 #b00000000000000000000000000000001) (_keys!10786 thiss!1141) (mask!27685 thiss!1141)) e!536782)))

(declare-fun b!953033 () Bool)

(assert (=> b!953033 (= e!536783 call!41591)))

(declare-fun b!953034 () Bool)

(assert (=> b!953034 (= e!536782 e!536783)))

(declare-fun c!99876 () Bool)

(assert (=> b!953034 (= c!99876 (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) (bvadd lt!429131 #b00000000000000000000000000000001))))))

(assert (= (and d!115783 (not res!638258)) b!953034))

(assert (= (and b!953034 c!99876) b!953031))

(assert (= (and b!953034 (not c!99876)) b!953033))

(assert (= (and b!953031 res!638259) b!953032))

(assert (= (or b!953032 b!953033) bm!41588))

(declare-fun m!885577 () Bool)

(assert (=> b!953031 m!885577))

(declare-fun m!885579 () Bool)

(assert (=> b!953031 m!885579))

(declare-fun m!885581 () Bool)

(assert (=> b!953031 m!885581))

(assert (=> b!953031 m!885577))

(declare-fun m!885583 () Bool)

(assert (=> b!953031 m!885583))

(declare-fun m!885585 () Bool)

(assert (=> bm!41588 m!885585))

(assert (=> b!953034 m!885577))

(assert (=> b!953034 m!885577))

(declare-fun m!885587 () Bool)

(assert (=> b!953034 m!885587))

(assert (=> bm!41559 d!115783))

(declare-fun d!115785 () Bool)

(declare-fun e!536784 () Bool)

(assert (=> d!115785 e!536784))

(declare-fun res!638260 () Bool)

(assert (=> d!115785 (=> (not res!638260) (not e!536784))))

(declare-fun lt!429350 () ListLongMap!12255)

(assert (=> d!115785 (= res!638260 (contains!5247 lt!429350 (_1!6789 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141)))))))

(declare-fun lt!429351 () List!19346)

(assert (=> d!115785 (= lt!429350 (ListLongMap!12256 lt!429351))))

(declare-fun lt!429352 () Unit!32008)

(declare-fun lt!429349 () Unit!32008)

(assert (=> d!115785 (= lt!429352 lt!429349)))

(assert (=> d!115785 (= (getValueByKey!501 lt!429351 (_1!6789 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141)))) (Some!506 (_2!6789 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141)))))))

(assert (=> d!115785 (= lt!429349 (lemmaContainsTupThenGetReturnValue!268 lt!429351 (_1!6789 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141))) (_2!6789 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141)))))))

(assert (=> d!115785 (= lt!429351 (insertStrictlySorted!325 (toList!6143 lt!429259) (_1!6789 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141))) (_2!6789 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141)))))))

(assert (=> d!115785 (= (+!2879 lt!429259 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141))) lt!429350)))

(declare-fun b!953035 () Bool)

(declare-fun res!638261 () Bool)

(assert (=> b!953035 (=> (not res!638261) (not e!536784))))

(assert (=> b!953035 (= res!638261 (= (getValueByKey!501 (toList!6143 lt!429350) (_1!6789 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141)))) (Some!506 (_2!6789 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141))))))))

(declare-fun b!953036 () Bool)

(assert (=> b!953036 (= e!536784 (contains!5249 (toList!6143 lt!429350) (tuple2!13557 lt!429239 (minValue!5647 thiss!1141))))))

(assert (= (and d!115785 res!638260) b!953035))

(assert (= (and b!953035 res!638261) b!953036))

(declare-fun m!885589 () Bool)

(assert (=> d!115785 m!885589))

(declare-fun m!885591 () Bool)

(assert (=> d!115785 m!885591))

(declare-fun m!885593 () Bool)

(assert (=> d!115785 m!885593))

(declare-fun m!885595 () Bool)

(assert (=> d!115785 m!885595))

(declare-fun m!885597 () Bool)

(assert (=> b!953035 m!885597))

(declare-fun m!885599 () Bool)

(assert (=> b!953036 m!885599))

(assert (=> b!952833 d!115785))

(declare-fun d!115787 () Bool)

(declare-fun e!536785 () Bool)

(assert (=> d!115787 e!536785))

(declare-fun res!638262 () Bool)

(assert (=> d!115787 (=> res!638262 e!536785)))

(declare-fun lt!429353 () Bool)

(assert (=> d!115787 (= res!638262 (not lt!429353))))

(declare-fun lt!429356 () Bool)

(assert (=> d!115787 (= lt!429353 lt!429356)))

(declare-fun lt!429354 () Unit!32008)

(declare-fun e!536786 () Unit!32008)

(assert (=> d!115787 (= lt!429354 e!536786)))

(declare-fun c!99877 () Bool)

(assert (=> d!115787 (= c!99877 lt!429356)))

(assert (=> d!115787 (= lt!429356 (containsKey!472 (toList!6143 (+!2879 lt!429244 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141)))) lt!429241))))

(assert (=> d!115787 (= (contains!5247 (+!2879 lt!429244 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141))) lt!429241) lt!429353)))

(declare-fun b!953037 () Bool)

(declare-fun lt!429355 () Unit!32008)

(assert (=> b!953037 (= e!536786 lt!429355)))

(assert (=> b!953037 (= lt!429355 (lemmaContainsKeyImpliesGetValueByKeyDefined!366 (toList!6143 (+!2879 lt!429244 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141)))) lt!429241))))

(assert (=> b!953037 (isDefined!374 (getValueByKey!501 (toList!6143 (+!2879 lt!429244 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141)))) lt!429241))))

(declare-fun b!953038 () Bool)

(declare-fun Unit!32017 () Unit!32008)

(assert (=> b!953038 (= e!536786 Unit!32017)))

(declare-fun b!953039 () Bool)

(assert (=> b!953039 (= e!536785 (isDefined!374 (getValueByKey!501 (toList!6143 (+!2879 lt!429244 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141)))) lt!429241)))))

(assert (= (and d!115787 c!99877) b!953037))

(assert (= (and d!115787 (not c!99877)) b!953038))

(assert (= (and d!115787 (not res!638262)) b!953039))

(declare-fun m!885601 () Bool)

(assert (=> d!115787 m!885601))

(declare-fun m!885603 () Bool)

(assert (=> b!953037 m!885603))

(declare-fun m!885605 () Bool)

(assert (=> b!953037 m!885605))

(assert (=> b!953037 m!885605))

(declare-fun m!885607 () Bool)

(assert (=> b!953037 m!885607))

(assert (=> b!953039 m!885605))

(assert (=> b!953039 m!885605))

(assert (=> b!953039 m!885607))

(assert (=> b!952833 d!115787))

(declare-fun d!115789 () Bool)

(assert (=> d!115789 (contains!5247 (+!2879 lt!429244 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141))) lt!429241)))

(declare-fun lt!429359 () Unit!32008)

(declare-fun choose!1601 (ListLongMap!12255 (_ BitVec 64) V!32679 (_ BitVec 64)) Unit!32008)

(assert (=> d!115789 (= lt!429359 (choose!1601 lt!429244 lt!429251 (zeroValue!5647 thiss!1141) lt!429241))))

(assert (=> d!115789 (contains!5247 lt!429244 lt!429241)))

(assert (=> d!115789 (= (addStillContains!582 lt!429244 lt!429251 (zeroValue!5647 thiss!1141) lt!429241) lt!429359)))

(declare-fun bs!26761 () Bool)

(assert (= bs!26761 d!115789))

(assert (=> bs!26761 m!885397))

(assert (=> bs!26761 m!885397))

(assert (=> bs!26761 m!885399))

(declare-fun m!885609 () Bool)

(assert (=> bs!26761 m!885609))

(declare-fun m!885611 () Bool)

(assert (=> bs!26761 m!885611))

(assert (=> b!952833 d!115789))

(declare-fun d!115791 () Bool)

(assert (=> d!115791 (= (apply!893 (+!2879 lt!429242 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141))) lt!429248) (get!14580 (getValueByKey!501 (toList!6143 (+!2879 lt!429242 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141)))) lt!429248)))))

(declare-fun bs!26762 () Bool)

(assert (= bs!26762 d!115791))

(declare-fun m!885613 () Bool)

(assert (=> bs!26762 m!885613))

(assert (=> bs!26762 m!885613))

(declare-fun m!885615 () Bool)

(assert (=> bs!26762 m!885615))

(assert (=> b!952833 d!115791))

(declare-fun d!115793 () Bool)

(assert (=> d!115793 (= (apply!893 lt!429259 lt!429243) (get!14580 (getValueByKey!501 (toList!6143 lt!429259) lt!429243)))))

(declare-fun bs!26763 () Bool)

(assert (= bs!26763 d!115793))

(declare-fun m!885617 () Bool)

(assert (=> bs!26763 m!885617))

(assert (=> bs!26763 m!885617))

(declare-fun m!885619 () Bool)

(assert (=> bs!26763 m!885619))

(assert (=> b!952833 d!115793))

(declare-fun d!115795 () Bool)

(declare-fun e!536787 () Bool)

(assert (=> d!115795 e!536787))

(declare-fun res!638263 () Bool)

(assert (=> d!115795 (=> (not res!638263) (not e!536787))))

(declare-fun lt!429361 () ListLongMap!12255)

(assert (=> d!115795 (= res!638263 (contains!5247 lt!429361 (_1!6789 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141)))))))

(declare-fun lt!429362 () List!19346)

(assert (=> d!115795 (= lt!429361 (ListLongMap!12256 lt!429362))))

(declare-fun lt!429363 () Unit!32008)

(declare-fun lt!429360 () Unit!32008)

(assert (=> d!115795 (= lt!429363 lt!429360)))

(assert (=> d!115795 (= (getValueByKey!501 lt!429362 (_1!6789 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141)))) (Some!506 (_2!6789 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115795 (= lt!429360 (lemmaContainsTupThenGetReturnValue!268 lt!429362 (_1!6789 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141))) (_2!6789 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115795 (= lt!429362 (insertStrictlySorted!325 (toList!6143 lt!429249) (_1!6789 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141))) (_2!6789 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115795 (= (+!2879 lt!429249 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141))) lt!429361)))

(declare-fun b!953041 () Bool)

(declare-fun res!638264 () Bool)

(assert (=> b!953041 (=> (not res!638264) (not e!536787))))

(assert (=> b!953041 (= res!638264 (= (getValueByKey!501 (toList!6143 lt!429361) (_1!6789 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141)))) (Some!506 (_2!6789 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141))))))))

(declare-fun b!953042 () Bool)

(assert (=> b!953042 (= e!536787 (contains!5249 (toList!6143 lt!429361) (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141))))))

(assert (= (and d!115795 res!638263) b!953041))

(assert (= (and b!953041 res!638264) b!953042))

(declare-fun m!885621 () Bool)

(assert (=> d!115795 m!885621))

(declare-fun m!885623 () Bool)

(assert (=> d!115795 m!885623))

(declare-fun m!885625 () Bool)

(assert (=> d!115795 m!885625))

(declare-fun m!885627 () Bool)

(assert (=> d!115795 m!885627))

(declare-fun m!885629 () Bool)

(assert (=> b!953041 m!885629))

(declare-fun m!885631 () Bool)

(assert (=> b!953042 m!885631))

(assert (=> b!952833 d!115795))

(declare-fun d!115797 () Bool)

(assert (=> d!115797 (= (apply!893 lt!429249 lt!429238) (get!14580 (getValueByKey!501 (toList!6143 lt!429249) lt!429238)))))

(declare-fun bs!26764 () Bool)

(assert (= bs!26764 d!115797))

(declare-fun m!885633 () Bool)

(assert (=> bs!26764 m!885633))

(assert (=> bs!26764 m!885633))

(declare-fun m!885635 () Bool)

(assert (=> bs!26764 m!885635))

(assert (=> b!952833 d!115797))

(declare-fun d!115799 () Bool)

(assert (=> d!115799 (= (apply!893 (+!2879 lt!429259 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141))) lt!429243) (apply!893 lt!429259 lt!429243))))

(declare-fun lt!429366 () Unit!32008)

(declare-fun choose!1602 (ListLongMap!12255 (_ BitVec 64) V!32679 (_ BitVec 64)) Unit!32008)

(assert (=> d!115799 (= lt!429366 (choose!1602 lt!429259 lt!429239 (minValue!5647 thiss!1141) lt!429243))))

(declare-fun e!536790 () Bool)

(assert (=> d!115799 e!536790))

(declare-fun res!638267 () Bool)

(assert (=> d!115799 (=> (not res!638267) (not e!536790))))

(assert (=> d!115799 (= res!638267 (contains!5247 lt!429259 lt!429243))))

(assert (=> d!115799 (= (addApplyDifferent!463 lt!429259 lt!429239 (minValue!5647 thiss!1141) lt!429243) lt!429366)))

(declare-fun b!953046 () Bool)

(assert (=> b!953046 (= e!536790 (not (= lt!429243 lt!429239)))))

(assert (= (and d!115799 res!638267) b!953046))

(declare-fun m!885637 () Bool)

(assert (=> d!115799 m!885637))

(assert (=> d!115799 m!885405))

(assert (=> d!115799 m!885401))

(assert (=> d!115799 m!885403))

(assert (=> d!115799 m!885401))

(declare-fun m!885639 () Bool)

(assert (=> d!115799 m!885639))

(assert (=> b!952833 d!115799))

(declare-fun d!115801 () Bool)

(declare-fun e!536791 () Bool)

(assert (=> d!115801 e!536791))

(declare-fun res!638268 () Bool)

(assert (=> d!115801 (=> (not res!638268) (not e!536791))))

(declare-fun lt!429368 () ListLongMap!12255)

(assert (=> d!115801 (= res!638268 (contains!5247 lt!429368 (_1!6789 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141)))))))

(declare-fun lt!429369 () List!19346)

(assert (=> d!115801 (= lt!429368 (ListLongMap!12256 lt!429369))))

(declare-fun lt!429370 () Unit!32008)

(declare-fun lt!429367 () Unit!32008)

(assert (=> d!115801 (= lt!429370 lt!429367)))

(assert (=> d!115801 (= (getValueByKey!501 lt!429369 (_1!6789 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141)))) (Some!506 (_2!6789 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115801 (= lt!429367 (lemmaContainsTupThenGetReturnValue!268 lt!429369 (_1!6789 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141))) (_2!6789 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115801 (= lt!429369 (insertStrictlySorted!325 (toList!6143 lt!429244) (_1!6789 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141))) (_2!6789 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115801 (= (+!2879 lt!429244 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141))) lt!429368)))

(declare-fun b!953047 () Bool)

(declare-fun res!638269 () Bool)

(assert (=> b!953047 (=> (not res!638269) (not e!536791))))

(assert (=> b!953047 (= res!638269 (= (getValueByKey!501 (toList!6143 lt!429368) (_1!6789 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141)))) (Some!506 (_2!6789 (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141))))))))

(declare-fun b!953048 () Bool)

(assert (=> b!953048 (= e!536791 (contains!5249 (toList!6143 lt!429368) (tuple2!13557 lt!429251 (zeroValue!5647 thiss!1141))))))

(assert (= (and d!115801 res!638268) b!953047))

(assert (= (and b!953047 res!638269) b!953048))

(declare-fun m!885641 () Bool)

(assert (=> d!115801 m!885641))

(declare-fun m!885643 () Bool)

(assert (=> d!115801 m!885643))

(declare-fun m!885645 () Bool)

(assert (=> d!115801 m!885645))

(declare-fun m!885647 () Bool)

(assert (=> d!115801 m!885647))

(declare-fun m!885649 () Bool)

(assert (=> b!953047 m!885649))

(declare-fun m!885651 () Bool)

(assert (=> b!953048 m!885651))

(assert (=> b!952833 d!115801))

(assert (=> b!952833 d!115741))

(declare-fun d!115803 () Bool)

(assert (=> d!115803 (= (apply!893 (+!2879 lt!429242 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141))) lt!429248) (apply!893 lt!429242 lt!429248))))

(declare-fun lt!429371 () Unit!32008)

(assert (=> d!115803 (= lt!429371 (choose!1602 lt!429242 lt!429245 (minValue!5647 thiss!1141) lt!429248))))

(declare-fun e!536792 () Bool)

(assert (=> d!115803 e!536792))

(declare-fun res!638270 () Bool)

(assert (=> d!115803 (=> (not res!638270) (not e!536792))))

(assert (=> d!115803 (= res!638270 (contains!5247 lt!429242 lt!429248))))

(assert (=> d!115803 (= (addApplyDifferent!463 lt!429242 lt!429245 (minValue!5647 thiss!1141) lt!429248) lt!429371)))

(declare-fun b!953049 () Bool)

(assert (=> b!953049 (= e!536792 (not (= lt!429248 lt!429245)))))

(assert (= (and d!115803 res!638270) b!953049))

(declare-fun m!885653 () Bool)

(assert (=> d!115803 m!885653))

(assert (=> d!115803 m!885387))

(assert (=> d!115803 m!885393))

(assert (=> d!115803 m!885417))

(assert (=> d!115803 m!885393))

(declare-fun m!885655 () Bool)

(assert (=> d!115803 m!885655))

(assert (=> b!952833 d!115803))

(declare-fun d!115805 () Bool)

(assert (=> d!115805 (= (apply!893 (+!2879 lt!429259 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141))) lt!429243) (get!14580 (getValueByKey!501 (toList!6143 (+!2879 lt!429259 (tuple2!13557 lt!429239 (minValue!5647 thiss!1141)))) lt!429243)))))

(declare-fun bs!26765 () Bool)

(assert (= bs!26765 d!115805))

(declare-fun m!885657 () Bool)

(assert (=> bs!26765 m!885657))

(assert (=> bs!26765 m!885657))

(declare-fun m!885659 () Bool)

(assert (=> bs!26765 m!885659))

(assert (=> b!952833 d!115805))

(declare-fun d!115807 () Bool)

(assert (=> d!115807 (= (apply!893 lt!429242 lt!429248) (get!14580 (getValueByKey!501 (toList!6143 lt!429242) lt!429248)))))

(declare-fun bs!26766 () Bool)

(assert (= bs!26766 d!115807))

(declare-fun m!885661 () Bool)

(assert (=> bs!26766 m!885661))

(assert (=> bs!26766 m!885661))

(declare-fun m!885663 () Bool)

(assert (=> bs!26766 m!885663))

(assert (=> b!952833 d!115807))

(declare-fun d!115809 () Bool)

(assert (=> d!115809 (= (apply!893 (+!2879 lt!429249 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141))) lt!429238) (get!14580 (getValueByKey!501 (toList!6143 (+!2879 lt!429249 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141)))) lt!429238)))))

(declare-fun bs!26767 () Bool)

(assert (= bs!26767 d!115809))

(declare-fun m!885665 () Bool)

(assert (=> bs!26767 m!885665))

(assert (=> bs!26767 m!885665))

(declare-fun m!885667 () Bool)

(assert (=> bs!26767 m!885667))

(assert (=> b!952833 d!115809))

(declare-fun d!115811 () Bool)

(assert (=> d!115811 (= (apply!893 (+!2879 lt!429249 (tuple2!13557 lt!429256 (zeroValue!5647 thiss!1141))) lt!429238) (apply!893 lt!429249 lt!429238))))

(declare-fun lt!429372 () Unit!32008)

(assert (=> d!115811 (= lt!429372 (choose!1602 lt!429249 lt!429256 (zeroValue!5647 thiss!1141) lt!429238))))

(declare-fun e!536793 () Bool)

(assert (=> d!115811 e!536793))

(declare-fun res!638271 () Bool)

(assert (=> d!115811 (=> (not res!638271) (not e!536793))))

(assert (=> d!115811 (= res!638271 (contains!5247 lt!429249 lt!429238))))

(assert (=> d!115811 (= (addApplyDifferent!463 lt!429249 lt!429256 (zeroValue!5647 thiss!1141) lt!429238) lt!429372)))

(declare-fun b!953050 () Bool)

(assert (=> b!953050 (= e!536793 (not (= lt!429238 lt!429256)))))

(assert (= (and d!115811 res!638271) b!953050))

(declare-fun m!885669 () Bool)

(assert (=> d!115811 m!885669))

(assert (=> d!115811 m!885411))

(assert (=> d!115811 m!885391))

(assert (=> d!115811 m!885407))

(assert (=> d!115811 m!885391))

(declare-fun m!885671 () Bool)

(assert (=> d!115811 m!885671))

(assert (=> b!952833 d!115811))

(declare-fun d!115813 () Bool)

(declare-fun e!536794 () Bool)

(assert (=> d!115813 e!536794))

(declare-fun res!638272 () Bool)

(assert (=> d!115813 (=> (not res!638272) (not e!536794))))

(declare-fun lt!429374 () ListLongMap!12255)

(assert (=> d!115813 (= res!638272 (contains!5247 lt!429374 (_1!6789 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141)))))))

(declare-fun lt!429375 () List!19346)

(assert (=> d!115813 (= lt!429374 (ListLongMap!12256 lt!429375))))

(declare-fun lt!429376 () Unit!32008)

(declare-fun lt!429373 () Unit!32008)

(assert (=> d!115813 (= lt!429376 lt!429373)))

(assert (=> d!115813 (= (getValueByKey!501 lt!429375 (_1!6789 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141)))) (Some!506 (_2!6789 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141)))))))

(assert (=> d!115813 (= lt!429373 (lemmaContainsTupThenGetReturnValue!268 lt!429375 (_1!6789 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141))) (_2!6789 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141)))))))

(assert (=> d!115813 (= lt!429375 (insertStrictlySorted!325 (toList!6143 lt!429242) (_1!6789 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141))) (_2!6789 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141)))))))

(assert (=> d!115813 (= (+!2879 lt!429242 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141))) lt!429374)))

(declare-fun b!953051 () Bool)

(declare-fun res!638273 () Bool)

(assert (=> b!953051 (=> (not res!638273) (not e!536794))))

(assert (=> b!953051 (= res!638273 (= (getValueByKey!501 (toList!6143 lt!429374) (_1!6789 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141)))) (Some!506 (_2!6789 (tuple2!13557 lt!429245 (minValue!5647 thiss!1141))))))))

(declare-fun b!953052 () Bool)

(assert (=> b!953052 (= e!536794 (contains!5249 (toList!6143 lt!429374) (tuple2!13557 lt!429245 (minValue!5647 thiss!1141))))))

(assert (= (and d!115813 res!638272) b!953051))

(assert (= (and b!953051 res!638273) b!953052))

(declare-fun m!885673 () Bool)

(assert (=> d!115813 m!885673))

(declare-fun m!885675 () Bool)

(assert (=> d!115813 m!885675))

(declare-fun m!885677 () Bool)

(assert (=> d!115813 m!885677))

(declare-fun m!885679 () Bool)

(assert (=> d!115813 m!885679))

(declare-fun m!885681 () Bool)

(assert (=> b!953051 m!885681))

(declare-fun m!885683 () Bool)

(assert (=> b!953052 m!885683))

(assert (=> b!952833 d!115813))

(declare-fun b!953061 () Bool)

(declare-fun e!536799 () (_ BitVec 32))

(declare-fun call!41594 () (_ BitVec 32))

(assert (=> b!953061 (= e!536799 call!41594)))

(declare-fun b!953062 () Bool)

(declare-fun e!536800 () (_ BitVec 32))

(assert (=> b!953062 (= e!536800 #b00000000000000000000000000000000)))

(declare-fun b!953063 () Bool)

(assert (=> b!953063 (= e!536800 e!536799)))

(declare-fun c!99883 () Bool)

(assert (=> b!953063 (= c!99883 (validKeyInArray!0 (select (arr!27716 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!953064 () Bool)

(assert (=> b!953064 (= e!536799 (bvadd #b00000000000000000000000000000001 call!41594))))

(declare-fun d!115815 () Bool)

(declare-fun lt!429379 () (_ BitVec 32))

(assert (=> d!115815 (and (bvsge lt!429379 #b00000000000000000000000000000000) (bvsle lt!429379 (bvsub (size!28195 (_keys!10786 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115815 (= lt!429379 e!536800)))

(declare-fun c!99882 () Bool)

(assert (=> d!115815 (= c!99882 (bvsge #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))))))

(assert (=> d!115815 (and (bvsle #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28195 (_keys!10786 thiss!1141)) (size!28195 (_keys!10786 thiss!1141))))))

(assert (=> d!115815 (= (arrayCountValidKeys!0 (_keys!10786 thiss!1141) #b00000000000000000000000000000000 (size!28195 (_keys!10786 thiss!1141))) lt!429379)))

(declare-fun bm!41591 () Bool)

(assert (=> bm!41591 (= call!41594 (arrayCountValidKeys!0 (_keys!10786 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28195 (_keys!10786 thiss!1141))))))

(assert (= (and d!115815 c!99882) b!953062))

(assert (= (and d!115815 (not c!99882)) b!953063))

(assert (= (and b!953063 c!99883) b!953064))

(assert (= (and b!953063 (not c!99883)) b!953061))

(assert (= (or b!953064 b!953061) bm!41591))

(assert (=> b!953063 m!885329))

(assert (=> b!953063 m!885329))

(assert (=> b!953063 m!885377))

(declare-fun m!885685 () Bool)

(assert (=> bm!41591 m!885685))

(assert (=> b!952852 d!115815))

(assert (=> d!115707 d!115715))

(declare-fun d!115817 () Bool)

(assert (=> d!115817 (arrayForallSeekEntryOrOpenFound!0 lt!429131 (_keys!10786 thiss!1141) (mask!27685 thiss!1141))))

(assert (=> d!115817 true))

(declare-fun _$72!119 () Unit!32008)

(assert (=> d!115817 (= (choose!38 (_keys!10786 thiss!1141) (mask!27685 thiss!1141) #b00000000000000000000000000000000 lt!429131) _$72!119)))

(declare-fun bs!26768 () Bool)

(assert (= bs!26768 d!115817))

(assert (=> bs!26768 m!885265))

(assert (=> d!115707 d!115817))

(assert (=> d!115707 d!115717))

(assert (=> b!952835 d!115757))

(declare-fun d!115819 () Bool)

(declare-fun e!536803 () Bool)

(assert (=> d!115819 e!536803))

(declare-fun c!99886 () Bool)

(assert (=> d!115819 (= c!99886 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!115819 true))

(declare-fun _$15!107 () Unit!32008)

(assert (=> d!115819 (= (choose!1599 (_keys!10786 thiss!1141) (_values!5834 thiss!1141) (mask!27685 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) key!756 (defaultEntry!5811 thiss!1141)) _$15!107)))

(declare-fun b!953069 () Bool)

(assert (=> b!953069 (= e!536803 (arrayContainsKey!0 (_keys!10786 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!953070 () Bool)

(assert (=> b!953070 (= e!536803 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115819 c!99886) b!953069))

(assert (= (and d!115819 (not c!99886)) b!953070))

(assert (=> b!953069 m!885263))

(assert (=> d!115711 d!115819))

(assert (=> d!115711 d!115717))

(declare-fun b!953081 () Bool)

(declare-fun res!638283 () Bool)

(declare-fun e!536806 () Bool)

(assert (=> b!953081 (=> (not res!638283) (not e!536806))))

(declare-fun size!28200 (LongMapFixedSize!4972) (_ BitVec 32))

(assert (=> b!953081 (= res!638283 (= (size!28200 thiss!1141) (bvadd (_size!2541 thiss!1141) (bvsdiv (bvadd (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!953082 () Bool)

(assert (=> b!953082 (= e!536806 (and (bvsge (extraKeys!5543 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5543 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2541 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!953080 () Bool)

(declare-fun res!638285 () Bool)

(assert (=> b!953080 (=> (not res!638285) (not e!536806))))

(assert (=> b!953080 (= res!638285 (bvsge (size!28200 thiss!1141) (_size!2541 thiss!1141)))))

(declare-fun d!115821 () Bool)

(declare-fun res!638284 () Bool)

(assert (=> d!115821 (=> (not res!638284) (not e!536806))))

(assert (=> d!115821 (= res!638284 (validMask!0 (mask!27685 thiss!1141)))))

(assert (=> d!115821 (= (simpleValid!380 thiss!1141) e!536806)))

(declare-fun b!953079 () Bool)

(declare-fun res!638282 () Bool)

(assert (=> b!953079 (=> (not res!638282) (not e!536806))))

(assert (=> b!953079 (= res!638282 (and (= (size!28194 (_values!5834 thiss!1141)) (bvadd (mask!27685 thiss!1141) #b00000000000000000000000000000001)) (= (size!28195 (_keys!10786 thiss!1141)) (size!28194 (_values!5834 thiss!1141))) (bvsge (_size!2541 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2541 thiss!1141) (bvadd (mask!27685 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!115821 res!638284) b!953079))

(assert (= (and b!953079 res!638282) b!953080))

(assert (= (and b!953080 res!638285) b!953081))

(assert (= (and b!953081 res!638283) b!953082))

(declare-fun m!885687 () Bool)

(assert (=> b!953081 m!885687))

(assert (=> b!953080 m!885687))

(assert (=> d!115821 m!885259))

(assert (=> d!115725 d!115821))

(declare-fun mapIsEmpty!33118 () Bool)

(declare-fun mapRes!33118 () Bool)

(assert (=> mapIsEmpty!33118 mapRes!33118))

(declare-fun mapNonEmpty!33118 () Bool)

(declare-fun tp!63463 () Bool)

(declare-fun e!536808 () Bool)

(assert (=> mapNonEmpty!33118 (= mapRes!33118 (and tp!63463 e!536808))))

(declare-fun mapValue!33118 () ValueCell!9911)

(declare-fun mapKey!33118 () (_ BitVec 32))

(declare-fun mapRest!33118 () (Array (_ BitVec 32) ValueCell!9911))

(assert (=> mapNonEmpty!33118 (= mapRest!33117 (store mapRest!33118 mapKey!33118 mapValue!33118))))

(declare-fun condMapEmpty!33118 () Bool)

(declare-fun mapDefault!33118 () ValueCell!9911)

(assert (=> mapNonEmpty!33117 (= condMapEmpty!33118 (= mapRest!33117 ((as const (Array (_ BitVec 32) ValueCell!9911)) mapDefault!33118)))))

(declare-fun e!536807 () Bool)

(assert (=> mapNonEmpty!33117 (= tp!63462 (and e!536807 mapRes!33118))))

(declare-fun b!953083 () Bool)

(assert (=> b!953083 (= e!536808 tp_is_empty!20785)))

(declare-fun b!953084 () Bool)

(assert (=> b!953084 (= e!536807 tp_is_empty!20785)))

(assert (= (and mapNonEmpty!33117 condMapEmpty!33118) mapIsEmpty!33118))

(assert (= (and mapNonEmpty!33117 (not condMapEmpty!33118)) mapNonEmpty!33118))

(assert (= (and mapNonEmpty!33118 ((_ is ValueCellFull!9911) mapValue!33118)) b!953083))

(assert (= (and mapNonEmpty!33117 ((_ is ValueCellFull!9911) mapDefault!33118)) b!953084))

(declare-fun m!885689 () Bool)

(assert (=> mapNonEmpty!33118 m!885689))

(declare-fun b_lambda!14421 () Bool)

(assert (= b_lambda!14419 (or (and b!952666 b_free!18277) b_lambda!14421)))

(declare-fun b_lambda!14423 () Bool)

(assert (= b_lambda!14417 (or (and b!952666 b_free!18277) b_lambda!14423)))

(check-sat (not b!952915) (not b!953063) (not b!952886) (not b!952952) (not b!952867) (not b!952869) (not b!952965) (not b!952872) (not b!953028) (not d!115805) (not d!115781) (not b!953041) (not d!115731) (not d!115801) (not b!952963) (not d!115795) (not b!953048) (not d!115817) (not b!953069) (not d!115809) (not b!953036) (not d!115769) (not b!952868) (not d!115785) (not b!952922) (not b!952918) (not b_lambda!14423) (not d!115741) (not b!953030) (not d!115749) (not b!952969) (not d!115755) (not b!952883) (not b!953052) (not d!115807) (not d!115811) (not b!952884) (not bm!41581) (not b!952970) (not bm!41591) (not b!953037) (not d!115813) (not d!115759) (not b!953051) (not b!952942) (not d!115793) (not b!952920) (not b!953031) (not b!953035) (not b!952948) (not b!953081) (not d!115791) (not bm!41588) (not b!952994) (not b!953001) (not d!115751) (not b_next!18277) (not b!952916) (not d!115763) (not d!115761) (not d!115789) (not d!115797) (not b!952949) (not b!953016) (not b_lambda!14421) (not d!115803) (not d!115765) (not d!115821) (not mapNonEmpty!33118) (not d!115743) (not b!953021) (not d!115745) (not b_lambda!14415) (not b!953034) (not b!952921) (not bm!41587) (not bm!41584) b_and!29769 (not d!115799) (not d!115773) tp_is_empty!20785 (not b!953047) (not b!952889) (not b!953042) (not b!952968) (not b!953027) (not d!115737) (not b!953039) (not b!953080) (not b!952967) (not b!952972) (not b!952923) (not b!952925) (not d!115787))
(check-sat b_and!29769 (not b_next!18277))
