; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81708 () Bool)

(assert start!81708)

(declare-fun b!953584 () Bool)

(declare-fun b_free!18295 () Bool)

(declare-fun b_next!18295 () Bool)

(assert (=> b!953584 (= b_free!18295 (not b_next!18295))))

(declare-fun tp!63510 () Bool)

(declare-fun b_and!29787 () Bool)

(assert (=> b!953584 (= tp!63510 b_and!29787)))

(declare-fun tp_is_empty!20803 () Bool)

(declare-datatypes ((V!32703 0))(
  ( (V!32704 (val!10452 Int)) )
))
(declare-datatypes ((ValueCell!9920 0))(
  ( (ValueCellFull!9920 (v!13001 V!32703)) (EmptyCell!9920) )
))
(declare-datatypes ((array!57693 0))(
  ( (array!57694 (arr!27733 (Array (_ BitVec 32) ValueCell!9920)) (size!28213 (_ BitVec 32))) )
))
(declare-datatypes ((array!57695 0))(
  ( (array!57696 (arr!27734 (Array (_ BitVec 32) (_ BitVec 64))) (size!28214 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4990 0))(
  ( (LongMapFixedSize!4991 (defaultEntry!5828 Int) (mask!27725 (_ BitVec 32)) (extraKeys!5560 (_ BitVec 32)) (zeroValue!5664 V!32703) (minValue!5664 V!32703) (_size!2550 (_ BitVec 32)) (_keys!10812 array!57695) (_values!5851 array!57693) (_vacant!2550 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4990)

(declare-fun e!537123 () Bool)

(declare-fun e!537127 () Bool)

(declare-fun array_inv!21602 (array!57695) Bool)

(declare-fun array_inv!21603 (array!57693) Bool)

(assert (=> b!953584 (= e!537127 (and tp!63510 tp_is_empty!20803 (array_inv!21602 (_keys!10812 thiss!1141)) (array_inv!21603 (_values!5851 thiss!1141)) e!537123))))

(declare-fun b!953585 () Bool)

(declare-fun res!638526 () Bool)

(declare-fun e!537126 () Bool)

(assert (=> b!953585 (=> (not res!638526) (not e!537126))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13570 0))(
  ( (tuple2!13571 (_1!6796 (_ BitVec 64)) (_2!6796 V!32703)) )
))
(declare-datatypes ((List!19356 0))(
  ( (Nil!19353) (Cons!19352 (h!20520 tuple2!13570) (t!27705 List!19356)) )
))
(declare-datatypes ((ListLongMap!12269 0))(
  ( (ListLongMap!12270 (toList!6150 List!19356)) )
))
(declare-fun contains!5256 (ListLongMap!12269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3383 (array!57695 array!57693 (_ BitVec 32) (_ BitVec 32) V!32703 V!32703 (_ BitVec 32) Int) ListLongMap!12269)

(assert (=> b!953585 (= res!638526 (contains!5256 (getCurrentListMap!3383 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)) key!756))))

(declare-fun res!638527 () Bool)

(assert (=> start!81708 (=> (not res!638527) (not e!537126))))

(declare-fun valid!1907 (LongMapFixedSize!4990) Bool)

(assert (=> start!81708 (= res!638527 (valid!1907 thiss!1141))))

(assert (=> start!81708 e!537126))

(assert (=> start!81708 e!537127))

(assert (=> start!81708 true))

(declare-fun b!953586 () Bool)

(declare-fun res!638530 () Bool)

(declare-fun e!537125 () Bool)

(assert (=> b!953586 (=> res!638530 e!537125)))

(assert (=> b!953586 (= res!638530 (not (= (size!28214 (_keys!10812 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27725 thiss!1141)))))))

(declare-fun mapIsEmpty!33145 () Bool)

(declare-fun mapRes!33145 () Bool)

(assert (=> mapIsEmpty!33145 mapRes!33145))

(declare-fun b!953587 () Bool)

(declare-fun e!537129 () Bool)

(assert (=> b!953587 (= e!537129 tp_is_empty!20803)))

(declare-fun b!953588 () Bool)

(declare-fun res!638531 () Bool)

(assert (=> b!953588 (=> (not res!638531) (not e!537126))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9120 0))(
  ( (MissingZero!9120 (index!38851 (_ BitVec 32))) (Found!9120 (index!38852 (_ BitVec 32))) (Intermediate!9120 (undefined!9932 Bool) (index!38853 (_ BitVec 32)) (x!81930 (_ BitVec 32))) (Undefined!9120) (MissingVacant!9120 (index!38854 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57695 (_ BitVec 32)) SeekEntryResult!9120)

(assert (=> b!953588 (= res!638531 (not ((_ is Found!9120) (seekEntry!0 key!756 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)))))))

(declare-fun b!953589 () Bool)

(declare-fun res!638529 () Bool)

(assert (=> b!953589 (=> (not res!638529) (not e!537126))))

(assert (=> b!953589 (= res!638529 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!953590 () Bool)

(assert (=> b!953590 (= e!537126 (not e!537125))))

(declare-fun res!638532 () Bool)

(assert (=> b!953590 (=> res!638532 e!537125)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!953590 (= res!638532 (not (validMask!0 (mask!27725 thiss!1141))))))

(declare-fun lt!429664 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57695 (_ BitVec 32)) Bool)

(assert (=> b!953590 (arrayForallSeekEntryOrOpenFound!0 lt!429664 (_keys!10812 thiss!1141) (mask!27725 thiss!1141))))

(declare-datatypes ((Unit!32032 0))(
  ( (Unit!32033) )
))
(declare-fun lt!429662 () Unit!32032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32032)

(assert (=> b!953590 (= lt!429662 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10812 thiss!1141) (mask!27725 thiss!1141) #b00000000000000000000000000000000 lt!429664))))

(declare-fun arrayScanForKey!0 (array!57695 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953590 (= lt!429664 (arrayScanForKey!0 (_keys!10812 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953590 (arrayContainsKey!0 (_keys!10812 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429663 () Unit!32032)

(declare-fun lemmaKeyInListMapIsInArray!335 (array!57695 array!57693 (_ BitVec 32) (_ BitVec 32) V!32703 V!32703 (_ BitVec 64) Int) Unit!32032)

(assert (=> b!953590 (= lt!429663 (lemmaKeyInListMapIsInArray!335 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) key!756 (defaultEntry!5828 thiss!1141)))))

(declare-fun b!953591 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57695 (_ BitVec 32)) SeekEntryResult!9120)

(assert (=> b!953591 (= e!537125 (= (seekEntryOrOpen!0 key!756 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)) (Found!9120 lt!429664)))))

(declare-fun b!953592 () Bool)

(assert (=> b!953592 (= e!537123 (and e!537129 mapRes!33145))))

(declare-fun condMapEmpty!33145 () Bool)

(declare-fun mapDefault!33145 () ValueCell!9920)

(assert (=> b!953592 (= condMapEmpty!33145 (= (arr!27733 (_values!5851 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9920)) mapDefault!33145)))))

(declare-fun b!953593 () Bool)

(declare-fun res!638525 () Bool)

(assert (=> b!953593 (=> res!638525 e!537125)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953593 (= res!638525 (not (validKeyInArray!0 key!756)))))

(declare-fun b!953594 () Bool)

(declare-fun res!638528 () Bool)

(assert (=> b!953594 (=> res!638528 e!537125)))

(assert (=> b!953594 (= res!638528 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10812 thiss!1141) (mask!27725 thiss!1141))))))

(declare-fun b!953595 () Bool)

(declare-fun e!537124 () Bool)

(assert (=> b!953595 (= e!537124 tp_is_empty!20803)))

(declare-fun mapNonEmpty!33145 () Bool)

(declare-fun tp!63511 () Bool)

(assert (=> mapNonEmpty!33145 (= mapRes!33145 (and tp!63511 e!537124))))

(declare-fun mapRest!33145 () (Array (_ BitVec 32) ValueCell!9920))

(declare-fun mapKey!33145 () (_ BitVec 32))

(declare-fun mapValue!33145 () ValueCell!9920)

(assert (=> mapNonEmpty!33145 (= (arr!27733 (_values!5851 thiss!1141)) (store mapRest!33145 mapKey!33145 mapValue!33145))))

(assert (= (and start!81708 res!638527) b!953589))

(assert (= (and b!953589 res!638529) b!953588))

(assert (= (and b!953588 res!638531) b!953585))

(assert (= (and b!953585 res!638526) b!953590))

(assert (= (and b!953590 (not res!638532)) b!953586))

(assert (= (and b!953586 (not res!638530)) b!953594))

(assert (= (and b!953594 (not res!638528)) b!953593))

(assert (= (and b!953593 (not res!638525)) b!953591))

(assert (= (and b!953592 condMapEmpty!33145) mapIsEmpty!33145))

(assert (= (and b!953592 (not condMapEmpty!33145)) mapNonEmpty!33145))

(assert (= (and mapNonEmpty!33145 ((_ is ValueCellFull!9920) mapValue!33145)) b!953595))

(assert (= (and b!953592 ((_ is ValueCellFull!9920) mapDefault!33145)) b!953587))

(assert (= b!953584 b!953592))

(assert (= start!81708 b!953584))

(declare-fun m!886093 () Bool)

(assert (=> b!953591 m!886093))

(declare-fun m!886095 () Bool)

(assert (=> b!953584 m!886095))

(declare-fun m!886097 () Bool)

(assert (=> b!953584 m!886097))

(declare-fun m!886099 () Bool)

(assert (=> b!953588 m!886099))

(declare-fun m!886101 () Bool)

(assert (=> b!953590 m!886101))

(declare-fun m!886103 () Bool)

(assert (=> b!953590 m!886103))

(declare-fun m!886105 () Bool)

(assert (=> b!953590 m!886105))

(declare-fun m!886107 () Bool)

(assert (=> b!953590 m!886107))

(declare-fun m!886109 () Bool)

(assert (=> b!953590 m!886109))

(declare-fun m!886111 () Bool)

(assert (=> b!953590 m!886111))

(declare-fun m!886113 () Bool)

(assert (=> b!953594 m!886113))

(declare-fun m!886115 () Bool)

(assert (=> start!81708 m!886115))

(declare-fun m!886117 () Bool)

(assert (=> mapNonEmpty!33145 m!886117))

(declare-fun m!886119 () Bool)

(assert (=> b!953585 m!886119))

(assert (=> b!953585 m!886119))

(declare-fun m!886121 () Bool)

(assert (=> b!953585 m!886121))

(declare-fun m!886123 () Bool)

(assert (=> b!953593 m!886123))

(check-sat tp_is_empty!20803 (not b!953591) (not b!953594) (not b!953585) (not b_next!18295) (not b!953593) (not b!953588) (not mapNonEmpty!33145) (not b!953590) (not start!81708) b_and!29787 (not b!953584))
(check-sat b_and!29787 (not b_next!18295))
(get-model)

(declare-fun d!115883 () Bool)

(declare-fun res!638585 () Bool)

(declare-fun e!537176 () Bool)

(assert (=> d!115883 (=> res!638585 e!537176)))

(assert (=> d!115883 (= res!638585 (= (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115883 (= (arrayContainsKey!0 (_keys!10812 thiss!1141) key!756 #b00000000000000000000000000000000) e!537176)))

(declare-fun b!953672 () Bool)

(declare-fun e!537177 () Bool)

(assert (=> b!953672 (= e!537176 e!537177)))

(declare-fun res!638586 () Bool)

(assert (=> b!953672 (=> (not res!638586) (not e!537177))))

(assert (=> b!953672 (= res!638586 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28214 (_keys!10812 thiss!1141))))))

(declare-fun b!953673 () Bool)

(assert (=> b!953673 (= e!537177 (arrayContainsKey!0 (_keys!10812 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115883 (not res!638585)) b!953672))

(assert (= (and b!953672 res!638586) b!953673))

(declare-fun m!886189 () Bool)

(assert (=> d!115883 m!886189))

(declare-fun m!886191 () Bool)

(assert (=> b!953673 m!886191))

(assert (=> b!953590 d!115883))

(declare-fun d!115885 () Bool)

(declare-fun e!537180 () Bool)

(assert (=> d!115885 e!537180))

(declare-fun c!99969 () Bool)

(assert (=> d!115885 (= c!99969 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429685 () Unit!32032)

(declare-fun choose!1605 (array!57695 array!57693 (_ BitVec 32) (_ BitVec 32) V!32703 V!32703 (_ BitVec 64) Int) Unit!32032)

(assert (=> d!115885 (= lt!429685 (choose!1605 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) key!756 (defaultEntry!5828 thiss!1141)))))

(assert (=> d!115885 (validMask!0 (mask!27725 thiss!1141))))

(assert (=> d!115885 (= (lemmaKeyInListMapIsInArray!335 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) key!756 (defaultEntry!5828 thiss!1141)) lt!429685)))

(declare-fun b!953678 () Bool)

(assert (=> b!953678 (= e!537180 (arrayContainsKey!0 (_keys!10812 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!953679 () Bool)

(assert (=> b!953679 (= e!537180 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115885 c!99969) b!953678))

(assert (= (and d!115885 (not c!99969)) b!953679))

(declare-fun m!886193 () Bool)

(assert (=> d!115885 m!886193))

(assert (=> d!115885 m!886105))

(assert (=> b!953678 m!886109))

(assert (=> b!953590 d!115885))

(declare-fun b!953688 () Bool)

(declare-fun e!537188 () Bool)

(declare-fun call!41647 () Bool)

(assert (=> b!953688 (= e!537188 call!41647)))

(declare-fun d!115887 () Bool)

(declare-fun res!638591 () Bool)

(declare-fun e!537187 () Bool)

(assert (=> d!115887 (=> res!638591 e!537187)))

(assert (=> d!115887 (= res!638591 (bvsge lt!429664 (size!28214 (_keys!10812 thiss!1141))))))

(assert (=> d!115887 (= (arrayForallSeekEntryOrOpenFound!0 lt!429664 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)) e!537187)))

(declare-fun bm!41644 () Bool)

(assert (=> bm!41644 (= call!41647 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429664 #b00000000000000000000000000000001) (_keys!10812 thiss!1141) (mask!27725 thiss!1141)))))

(declare-fun b!953689 () Bool)

(declare-fun e!537189 () Bool)

(assert (=> b!953689 (= e!537187 e!537189)))

(declare-fun c!99972 () Bool)

(assert (=> b!953689 (= c!99972 (validKeyInArray!0 (select (arr!27734 (_keys!10812 thiss!1141)) lt!429664)))))

(declare-fun b!953690 () Bool)

(assert (=> b!953690 (= e!537189 call!41647)))

(declare-fun b!953691 () Bool)

(assert (=> b!953691 (= e!537189 e!537188)))

(declare-fun lt!429693 () (_ BitVec 64))

(assert (=> b!953691 (= lt!429693 (select (arr!27734 (_keys!10812 thiss!1141)) lt!429664))))

(declare-fun lt!429694 () Unit!32032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57695 (_ BitVec 64) (_ BitVec 32)) Unit!32032)

(assert (=> b!953691 (= lt!429694 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10812 thiss!1141) lt!429693 lt!429664))))

(assert (=> b!953691 (arrayContainsKey!0 (_keys!10812 thiss!1141) lt!429693 #b00000000000000000000000000000000)))

(declare-fun lt!429692 () Unit!32032)

(assert (=> b!953691 (= lt!429692 lt!429694)))

(declare-fun res!638592 () Bool)

(assert (=> b!953691 (= res!638592 (= (seekEntryOrOpen!0 (select (arr!27734 (_keys!10812 thiss!1141)) lt!429664) (_keys!10812 thiss!1141) (mask!27725 thiss!1141)) (Found!9120 lt!429664)))))

(assert (=> b!953691 (=> (not res!638592) (not e!537188))))

(assert (= (and d!115887 (not res!638591)) b!953689))

(assert (= (and b!953689 c!99972) b!953691))

(assert (= (and b!953689 (not c!99972)) b!953690))

(assert (= (and b!953691 res!638592) b!953688))

(assert (= (or b!953688 b!953690) bm!41644))

(declare-fun m!886195 () Bool)

(assert (=> bm!41644 m!886195))

(declare-fun m!886197 () Bool)

(assert (=> b!953689 m!886197))

(assert (=> b!953689 m!886197))

(declare-fun m!886199 () Bool)

(assert (=> b!953689 m!886199))

(assert (=> b!953691 m!886197))

(declare-fun m!886201 () Bool)

(assert (=> b!953691 m!886201))

(declare-fun m!886203 () Bool)

(assert (=> b!953691 m!886203))

(assert (=> b!953691 m!886197))

(declare-fun m!886205 () Bool)

(assert (=> b!953691 m!886205))

(assert (=> b!953590 d!115887))

(declare-fun d!115889 () Bool)

(declare-fun lt!429697 () (_ BitVec 32))

(assert (=> d!115889 (and (or (bvslt lt!429697 #b00000000000000000000000000000000) (bvsge lt!429697 (size!28214 (_keys!10812 thiss!1141))) (and (bvsge lt!429697 #b00000000000000000000000000000000) (bvslt lt!429697 (size!28214 (_keys!10812 thiss!1141))))) (bvsge lt!429697 #b00000000000000000000000000000000) (bvslt lt!429697 (size!28214 (_keys!10812 thiss!1141))) (= (select (arr!27734 (_keys!10812 thiss!1141)) lt!429697) key!756))))

(declare-fun e!537192 () (_ BitVec 32))

(assert (=> d!115889 (= lt!429697 e!537192)))

(declare-fun c!99975 () Bool)

(assert (=> d!115889 (= c!99975 (= (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115889 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28214 (_keys!10812 thiss!1141))) (bvslt (size!28214 (_keys!10812 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115889 (= (arrayScanForKey!0 (_keys!10812 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429697)))

(declare-fun b!953696 () Bool)

(assert (=> b!953696 (= e!537192 #b00000000000000000000000000000000)))

(declare-fun b!953697 () Bool)

(assert (=> b!953697 (= e!537192 (arrayScanForKey!0 (_keys!10812 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115889 c!99975) b!953696))

(assert (= (and d!115889 (not c!99975)) b!953697))

(declare-fun m!886207 () Bool)

(assert (=> d!115889 m!886207))

(assert (=> d!115889 m!886189))

(declare-fun m!886209 () Bool)

(assert (=> b!953697 m!886209))

(assert (=> b!953590 d!115889))

(declare-fun d!115891 () Bool)

(assert (=> d!115891 (= (validMask!0 (mask!27725 thiss!1141)) (and (or (= (mask!27725 thiss!1141) #b00000000000000000000000000000111) (= (mask!27725 thiss!1141) #b00000000000000000000000000001111) (= (mask!27725 thiss!1141) #b00000000000000000000000000011111) (= (mask!27725 thiss!1141) #b00000000000000000000000000111111) (= (mask!27725 thiss!1141) #b00000000000000000000000001111111) (= (mask!27725 thiss!1141) #b00000000000000000000000011111111) (= (mask!27725 thiss!1141) #b00000000000000000000000111111111) (= (mask!27725 thiss!1141) #b00000000000000000000001111111111) (= (mask!27725 thiss!1141) #b00000000000000000000011111111111) (= (mask!27725 thiss!1141) #b00000000000000000000111111111111) (= (mask!27725 thiss!1141) #b00000000000000000001111111111111) (= (mask!27725 thiss!1141) #b00000000000000000011111111111111) (= (mask!27725 thiss!1141) #b00000000000000000111111111111111) (= (mask!27725 thiss!1141) #b00000000000000001111111111111111) (= (mask!27725 thiss!1141) #b00000000000000011111111111111111) (= (mask!27725 thiss!1141) #b00000000000000111111111111111111) (= (mask!27725 thiss!1141) #b00000000000001111111111111111111) (= (mask!27725 thiss!1141) #b00000000000011111111111111111111) (= (mask!27725 thiss!1141) #b00000000000111111111111111111111) (= (mask!27725 thiss!1141) #b00000000001111111111111111111111) (= (mask!27725 thiss!1141) #b00000000011111111111111111111111) (= (mask!27725 thiss!1141) #b00000000111111111111111111111111) (= (mask!27725 thiss!1141) #b00000001111111111111111111111111) (= (mask!27725 thiss!1141) #b00000011111111111111111111111111) (= (mask!27725 thiss!1141) #b00000111111111111111111111111111) (= (mask!27725 thiss!1141) #b00001111111111111111111111111111) (= (mask!27725 thiss!1141) #b00011111111111111111111111111111) (= (mask!27725 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27725 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!953590 d!115891))

(declare-fun d!115893 () Bool)

(assert (=> d!115893 (arrayForallSeekEntryOrOpenFound!0 lt!429664 (_keys!10812 thiss!1141) (mask!27725 thiss!1141))))

(declare-fun lt!429700 () Unit!32032)

(declare-fun choose!38 (array!57695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32032)

(assert (=> d!115893 (= lt!429700 (choose!38 (_keys!10812 thiss!1141) (mask!27725 thiss!1141) #b00000000000000000000000000000000 lt!429664))))

(assert (=> d!115893 (validMask!0 (mask!27725 thiss!1141))))

(assert (=> d!115893 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10812 thiss!1141) (mask!27725 thiss!1141) #b00000000000000000000000000000000 lt!429664) lt!429700)))

(declare-fun bs!26780 () Bool)

(assert (= bs!26780 d!115893))

(assert (=> bs!26780 m!886103))

(declare-fun m!886211 () Bool)

(assert (=> bs!26780 m!886211))

(assert (=> bs!26780 m!886105))

(assert (=> b!953590 d!115893))

(declare-fun b!953710 () Bool)

(declare-fun e!537201 () SeekEntryResult!9120)

(assert (=> b!953710 (= e!537201 Undefined!9120)))

(declare-fun b!953711 () Bool)

(declare-fun e!537199 () SeekEntryResult!9120)

(declare-fun lt!429709 () SeekEntryResult!9120)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57695 (_ BitVec 32)) SeekEntryResult!9120)

(assert (=> b!953711 (= e!537199 (seekKeyOrZeroReturnVacant!0 (x!81930 lt!429709) (index!38853 lt!429709) (index!38853 lt!429709) key!756 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)))))

(declare-fun b!953712 () Bool)

(assert (=> b!953712 (= e!537199 (MissingZero!9120 (index!38853 lt!429709)))))

(declare-fun b!953713 () Bool)

(declare-fun e!537200 () SeekEntryResult!9120)

(assert (=> b!953713 (= e!537200 (Found!9120 (index!38853 lt!429709)))))

(declare-fun d!115895 () Bool)

(declare-fun lt!429707 () SeekEntryResult!9120)

(assert (=> d!115895 (and (or ((_ is Undefined!9120) lt!429707) (not ((_ is Found!9120) lt!429707)) (and (bvsge (index!38852 lt!429707) #b00000000000000000000000000000000) (bvslt (index!38852 lt!429707) (size!28214 (_keys!10812 thiss!1141))))) (or ((_ is Undefined!9120) lt!429707) ((_ is Found!9120) lt!429707) (not ((_ is MissingZero!9120) lt!429707)) (and (bvsge (index!38851 lt!429707) #b00000000000000000000000000000000) (bvslt (index!38851 lt!429707) (size!28214 (_keys!10812 thiss!1141))))) (or ((_ is Undefined!9120) lt!429707) ((_ is Found!9120) lt!429707) ((_ is MissingZero!9120) lt!429707) (not ((_ is MissingVacant!9120) lt!429707)) (and (bvsge (index!38854 lt!429707) #b00000000000000000000000000000000) (bvslt (index!38854 lt!429707) (size!28214 (_keys!10812 thiss!1141))))) (or ((_ is Undefined!9120) lt!429707) (ite ((_ is Found!9120) lt!429707) (= (select (arr!27734 (_keys!10812 thiss!1141)) (index!38852 lt!429707)) key!756) (ite ((_ is MissingZero!9120) lt!429707) (= (select (arr!27734 (_keys!10812 thiss!1141)) (index!38851 lt!429707)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9120) lt!429707) (= (select (arr!27734 (_keys!10812 thiss!1141)) (index!38854 lt!429707)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!115895 (= lt!429707 e!537201)))

(declare-fun c!99984 () Bool)

(assert (=> d!115895 (= c!99984 (and ((_ is Intermediate!9120) lt!429709) (undefined!9932 lt!429709)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57695 (_ BitVec 32)) SeekEntryResult!9120)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115895 (= lt!429709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27725 thiss!1141)) key!756 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)))))

(assert (=> d!115895 (validMask!0 (mask!27725 thiss!1141))))

(assert (=> d!115895 (= (seekEntryOrOpen!0 key!756 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)) lt!429707)))

(declare-fun b!953714 () Bool)

(assert (=> b!953714 (= e!537201 e!537200)))

(declare-fun lt!429708 () (_ BitVec 64))

(assert (=> b!953714 (= lt!429708 (select (arr!27734 (_keys!10812 thiss!1141)) (index!38853 lt!429709)))))

(declare-fun c!99983 () Bool)

(assert (=> b!953714 (= c!99983 (= lt!429708 key!756))))

(declare-fun b!953715 () Bool)

(declare-fun c!99982 () Bool)

(assert (=> b!953715 (= c!99982 (= lt!429708 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!953715 (= e!537200 e!537199)))

(assert (= (and d!115895 c!99984) b!953710))

(assert (= (and d!115895 (not c!99984)) b!953714))

(assert (= (and b!953714 c!99983) b!953713))

(assert (= (and b!953714 (not c!99983)) b!953715))

(assert (= (and b!953715 c!99982) b!953712))

(assert (= (and b!953715 (not c!99982)) b!953711))

(declare-fun m!886213 () Bool)

(assert (=> b!953711 m!886213))

(declare-fun m!886215 () Bool)

(assert (=> d!115895 m!886215))

(declare-fun m!886217 () Bool)

(assert (=> d!115895 m!886217))

(assert (=> d!115895 m!886105))

(declare-fun m!886219 () Bool)

(assert (=> d!115895 m!886219))

(declare-fun m!886221 () Bool)

(assert (=> d!115895 m!886221))

(declare-fun m!886223 () Bool)

(assert (=> d!115895 m!886223))

(assert (=> d!115895 m!886219))

(declare-fun m!886225 () Bool)

(assert (=> b!953714 m!886225))

(assert (=> b!953591 d!115895))

(declare-fun d!115897 () Bool)

(declare-fun res!638599 () Bool)

(declare-fun e!537204 () Bool)

(assert (=> d!115897 (=> (not res!638599) (not e!537204))))

(declare-fun simpleValid!383 (LongMapFixedSize!4990) Bool)

(assert (=> d!115897 (= res!638599 (simpleValid!383 thiss!1141))))

(assert (=> d!115897 (= (valid!1907 thiss!1141) e!537204)))

(declare-fun b!953722 () Bool)

(declare-fun res!638600 () Bool)

(assert (=> b!953722 (=> (not res!638600) (not e!537204))))

(declare-fun arrayCountValidKeys!0 (array!57695 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953722 (= res!638600 (= (arrayCountValidKeys!0 (_keys!10812 thiss!1141) #b00000000000000000000000000000000 (size!28214 (_keys!10812 thiss!1141))) (_size!2550 thiss!1141)))))

(declare-fun b!953723 () Bool)

(declare-fun res!638601 () Bool)

(assert (=> b!953723 (=> (not res!638601) (not e!537204))))

(assert (=> b!953723 (= res!638601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)))))

(declare-fun b!953724 () Bool)

(declare-datatypes ((List!19358 0))(
  ( (Nil!19355) (Cons!19354 (h!20522 (_ BitVec 64)) (t!27709 List!19358)) )
))
(declare-fun arrayNoDuplicates!0 (array!57695 (_ BitVec 32) List!19358) Bool)

(assert (=> b!953724 (= e!537204 (arrayNoDuplicates!0 (_keys!10812 thiss!1141) #b00000000000000000000000000000000 Nil!19355))))

(assert (= (and d!115897 res!638599) b!953722))

(assert (= (and b!953722 res!638600) b!953723))

(assert (= (and b!953723 res!638601) b!953724))

(declare-fun m!886227 () Bool)

(assert (=> d!115897 m!886227))

(declare-fun m!886229 () Bool)

(assert (=> b!953722 m!886229))

(assert (=> b!953723 m!886113))

(declare-fun m!886231 () Bool)

(assert (=> b!953724 m!886231))

(assert (=> start!81708 d!115897))

(declare-fun d!115899 () Bool)

(assert (=> d!115899 (= (validKeyInArray!0 key!756) (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953593 d!115899))

(declare-fun d!115901 () Bool)

(assert (=> d!115901 (= (array_inv!21602 (_keys!10812 thiss!1141)) (bvsge (size!28214 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953584 d!115901))

(declare-fun d!115903 () Bool)

(assert (=> d!115903 (= (array_inv!21603 (_values!5851 thiss!1141)) (bvsge (size!28213 (_values!5851 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953584 d!115903))

(declare-fun b!953737 () Bool)

(declare-fun e!537212 () SeekEntryResult!9120)

(declare-fun lt!429718 () SeekEntryResult!9120)

(assert (=> b!953737 (= e!537212 (ite ((_ is MissingVacant!9120) lt!429718) (MissingZero!9120 (index!38854 lt!429718)) lt!429718))))

(declare-fun lt!429721 () SeekEntryResult!9120)

(assert (=> b!953737 (= lt!429718 (seekKeyOrZeroReturnVacant!0 (x!81930 lt!429721) (index!38853 lt!429721) (index!38853 lt!429721) key!756 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)))))

(declare-fun b!953738 () Bool)

(declare-fun e!537211 () SeekEntryResult!9120)

(declare-fun e!537213 () SeekEntryResult!9120)

(assert (=> b!953738 (= e!537211 e!537213)))

(declare-fun lt!429720 () (_ BitVec 64))

(assert (=> b!953738 (= lt!429720 (select (arr!27734 (_keys!10812 thiss!1141)) (index!38853 lt!429721)))))

(declare-fun c!99991 () Bool)

(assert (=> b!953738 (= c!99991 (= lt!429720 key!756))))

(declare-fun b!953739 () Bool)

(assert (=> b!953739 (= e!537212 (MissingZero!9120 (index!38853 lt!429721)))))

(declare-fun b!953740 () Bool)

(declare-fun c!99992 () Bool)

(assert (=> b!953740 (= c!99992 (= lt!429720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!953740 (= e!537213 e!537212)))

(declare-fun d!115905 () Bool)

(declare-fun lt!429719 () SeekEntryResult!9120)

(assert (=> d!115905 (and (or ((_ is MissingVacant!9120) lt!429719) (not ((_ is Found!9120) lt!429719)) (and (bvsge (index!38852 lt!429719) #b00000000000000000000000000000000) (bvslt (index!38852 lt!429719) (size!28214 (_keys!10812 thiss!1141))))) (not ((_ is MissingVacant!9120) lt!429719)) (or (not ((_ is Found!9120) lt!429719)) (= (select (arr!27734 (_keys!10812 thiss!1141)) (index!38852 lt!429719)) key!756)))))

(assert (=> d!115905 (= lt!429719 e!537211)))

(declare-fun c!99993 () Bool)

(assert (=> d!115905 (= c!99993 (and ((_ is Intermediate!9120) lt!429721) (undefined!9932 lt!429721)))))

(assert (=> d!115905 (= lt!429721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27725 thiss!1141)) key!756 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)))))

(assert (=> d!115905 (validMask!0 (mask!27725 thiss!1141))))

(assert (=> d!115905 (= (seekEntry!0 key!756 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)) lt!429719)))

(declare-fun b!953741 () Bool)

(assert (=> b!953741 (= e!537213 (Found!9120 (index!38853 lt!429721)))))

(declare-fun b!953742 () Bool)

(assert (=> b!953742 (= e!537211 Undefined!9120)))

(assert (= (and d!115905 c!99993) b!953742))

(assert (= (and d!115905 (not c!99993)) b!953738))

(assert (= (and b!953738 c!99991) b!953741))

(assert (= (and b!953738 (not c!99991)) b!953740))

(assert (= (and b!953740 c!99992) b!953739))

(assert (= (and b!953740 (not c!99992)) b!953737))

(declare-fun m!886233 () Bool)

(assert (=> b!953737 m!886233))

(declare-fun m!886235 () Bool)

(assert (=> b!953738 m!886235))

(declare-fun m!886237 () Bool)

(assert (=> d!115905 m!886237))

(assert (=> d!115905 m!886219))

(assert (=> d!115905 m!886219))

(assert (=> d!115905 m!886221))

(assert (=> d!115905 m!886105))

(assert (=> b!953588 d!115905))

(declare-fun b!953743 () Bool)

(declare-fun e!537215 () Bool)

(declare-fun call!41648 () Bool)

(assert (=> b!953743 (= e!537215 call!41648)))

(declare-fun d!115907 () Bool)

(declare-fun res!638602 () Bool)

(declare-fun e!537214 () Bool)

(assert (=> d!115907 (=> res!638602 e!537214)))

(assert (=> d!115907 (= res!638602 (bvsge #b00000000000000000000000000000000 (size!28214 (_keys!10812 thiss!1141))))))

(assert (=> d!115907 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10812 thiss!1141) (mask!27725 thiss!1141)) e!537214)))

(declare-fun bm!41645 () Bool)

(assert (=> bm!41645 (= call!41648 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10812 thiss!1141) (mask!27725 thiss!1141)))))

(declare-fun b!953744 () Bool)

(declare-fun e!537216 () Bool)

(assert (=> b!953744 (= e!537214 e!537216)))

(declare-fun c!99994 () Bool)

(assert (=> b!953744 (= c!99994 (validKeyInArray!0 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!953745 () Bool)

(assert (=> b!953745 (= e!537216 call!41648)))

(declare-fun b!953746 () Bool)

(assert (=> b!953746 (= e!537216 e!537215)))

(declare-fun lt!429723 () (_ BitVec 64))

(assert (=> b!953746 (= lt!429723 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429724 () Unit!32032)

(assert (=> b!953746 (= lt!429724 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10812 thiss!1141) lt!429723 #b00000000000000000000000000000000))))

(assert (=> b!953746 (arrayContainsKey!0 (_keys!10812 thiss!1141) lt!429723 #b00000000000000000000000000000000)))

(declare-fun lt!429722 () Unit!32032)

(assert (=> b!953746 (= lt!429722 lt!429724)))

(declare-fun res!638603 () Bool)

(assert (=> b!953746 (= res!638603 (= (seekEntryOrOpen!0 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000) (_keys!10812 thiss!1141) (mask!27725 thiss!1141)) (Found!9120 #b00000000000000000000000000000000)))))

(assert (=> b!953746 (=> (not res!638603) (not e!537215))))

(assert (= (and d!115907 (not res!638602)) b!953744))

(assert (= (and b!953744 c!99994) b!953746))

(assert (= (and b!953744 (not c!99994)) b!953745))

(assert (= (and b!953746 res!638603) b!953743))

(assert (= (or b!953743 b!953745) bm!41645))

(declare-fun m!886239 () Bool)

(assert (=> bm!41645 m!886239))

(assert (=> b!953744 m!886189))

(assert (=> b!953744 m!886189))

(declare-fun m!886241 () Bool)

(assert (=> b!953744 m!886241))

(assert (=> b!953746 m!886189))

(declare-fun m!886243 () Bool)

(assert (=> b!953746 m!886243))

(declare-fun m!886245 () Bool)

(assert (=> b!953746 m!886245))

(assert (=> b!953746 m!886189))

(declare-fun m!886247 () Bool)

(assert (=> b!953746 m!886247))

(assert (=> b!953594 d!115907))

(declare-fun d!115909 () Bool)

(declare-fun e!537222 () Bool)

(assert (=> d!115909 e!537222))

(declare-fun res!638606 () Bool)

(assert (=> d!115909 (=> res!638606 e!537222)))

(declare-fun lt!429734 () Bool)

(assert (=> d!115909 (= res!638606 (not lt!429734))))

(declare-fun lt!429735 () Bool)

(assert (=> d!115909 (= lt!429734 lt!429735)))

(declare-fun lt!429733 () Unit!32032)

(declare-fun e!537221 () Unit!32032)

(assert (=> d!115909 (= lt!429733 e!537221)))

(declare-fun c!99997 () Bool)

(assert (=> d!115909 (= c!99997 lt!429735)))

(declare-fun containsKey!475 (List!19356 (_ BitVec 64)) Bool)

(assert (=> d!115909 (= lt!429735 (containsKey!475 (toList!6150 (getCurrentListMap!3383 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141))) key!756))))

(assert (=> d!115909 (= (contains!5256 (getCurrentListMap!3383 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)) key!756) lt!429734)))

(declare-fun b!953753 () Bool)

(declare-fun lt!429736 () Unit!32032)

(assert (=> b!953753 (= e!537221 lt!429736)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!369 (List!19356 (_ BitVec 64)) Unit!32032)

(assert (=> b!953753 (= lt!429736 (lemmaContainsKeyImpliesGetValueByKeyDefined!369 (toList!6150 (getCurrentListMap!3383 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141))) key!756))))

(declare-datatypes ((Option!510 0))(
  ( (Some!509 (v!13004 V!32703)) (None!508) )
))
(declare-fun isDefined!377 (Option!510) Bool)

(declare-fun getValueByKey!504 (List!19356 (_ BitVec 64)) Option!510)

(assert (=> b!953753 (isDefined!377 (getValueByKey!504 (toList!6150 (getCurrentListMap!3383 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141))) key!756))))

(declare-fun b!953754 () Bool)

(declare-fun Unit!32036 () Unit!32032)

(assert (=> b!953754 (= e!537221 Unit!32036)))

(declare-fun b!953755 () Bool)

(assert (=> b!953755 (= e!537222 (isDefined!377 (getValueByKey!504 (toList!6150 (getCurrentListMap!3383 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141))) key!756)))))

(assert (= (and d!115909 c!99997) b!953753))

(assert (= (and d!115909 (not c!99997)) b!953754))

(assert (= (and d!115909 (not res!638606)) b!953755))

(declare-fun m!886249 () Bool)

(assert (=> d!115909 m!886249))

(declare-fun m!886251 () Bool)

(assert (=> b!953753 m!886251))

(declare-fun m!886253 () Bool)

(assert (=> b!953753 m!886253))

(assert (=> b!953753 m!886253))

(declare-fun m!886255 () Bool)

(assert (=> b!953753 m!886255))

(assert (=> b!953755 m!886253))

(assert (=> b!953755 m!886253))

(assert (=> b!953755 m!886255))

(assert (=> b!953585 d!115909))

(declare-fun b!953798 () Bool)

(declare-fun e!537255 () Bool)

(declare-fun lt!429785 () ListLongMap!12269)

(declare-fun apply!896 (ListLongMap!12269 (_ BitVec 64)) V!32703)

(assert (=> b!953798 (= e!537255 (= (apply!896 lt!429785 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5664 thiss!1141)))))

(declare-fun b!953799 () Bool)

(declare-fun e!537249 () Bool)

(assert (=> b!953799 (= e!537249 (validKeyInArray!0 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!953800 () Bool)

(declare-fun e!537256 () Bool)

(assert (=> b!953800 (= e!537256 (validKeyInArray!0 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!953801 () Bool)

(declare-fun e!537260 () Bool)

(declare-fun e!537253 () Bool)

(assert (=> b!953801 (= e!537260 e!537253)))

(declare-fun c!100011 () Bool)

(assert (=> b!953801 (= c!100011 (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!953803 () Bool)

(declare-fun e!537258 () Bool)

(assert (=> b!953803 (= e!537258 e!537255)))

(declare-fun res!638633 () Bool)

(declare-fun call!41668 () Bool)

(assert (=> b!953803 (= res!638633 call!41668)))

(assert (=> b!953803 (=> (not res!638633) (not e!537255))))

(declare-fun b!953804 () Bool)

(declare-fun e!537257 () Bool)

(declare-fun e!537254 () Bool)

(assert (=> b!953804 (= e!537257 e!537254)))

(declare-fun res!638627 () Bool)

(assert (=> b!953804 (=> (not res!638627) (not e!537254))))

(assert (=> b!953804 (= res!638627 (contains!5256 lt!429785 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!953804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28214 (_keys!10812 thiss!1141))))))

(declare-fun b!953805 () Bool)

(declare-fun e!537251 () ListLongMap!12269)

(declare-fun call!41664 () ListLongMap!12269)

(assert (=> b!953805 (= e!537251 call!41664)))

(declare-fun bm!41660 () Bool)

(declare-fun call!41665 () ListLongMap!12269)

(assert (=> bm!41660 (= call!41664 call!41665)))

(declare-fun b!953806 () Bool)

(declare-fun e!537259 () ListLongMap!12269)

(declare-fun e!537261 () ListLongMap!12269)

(assert (=> b!953806 (= e!537259 e!537261)))

(declare-fun c!100010 () Bool)

(assert (=> b!953806 (= c!100010 (and (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!953807 () Bool)

(assert (=> b!953807 (= e!537261 call!41664)))

(declare-fun b!953808 () Bool)

(declare-fun e!537250 () Unit!32032)

(declare-fun Unit!32037 () Unit!32032)

(assert (=> b!953808 (= e!537250 Unit!32037)))

(declare-fun bm!41661 () Bool)

(declare-fun call!41669 () ListLongMap!12269)

(declare-fun getCurrentListMapNoExtraKeys!3370 (array!57695 array!57693 (_ BitVec 32) (_ BitVec 32) V!32703 V!32703 (_ BitVec 32) Int) ListLongMap!12269)

(assert (=> bm!41661 (= call!41669 (getCurrentListMapNoExtraKeys!3370 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)))))

(declare-fun b!953809 () Bool)

(declare-fun +!2882 (ListLongMap!12269 tuple2!13570) ListLongMap!12269)

(assert (=> b!953809 (= e!537259 (+!2882 call!41665 (tuple2!13571 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5664 thiss!1141))))))

(declare-fun b!953810 () Bool)

(assert (=> b!953810 (= e!537258 (not call!41668))))

(declare-fun b!953811 () Bool)

(declare-fun res!638626 () Bool)

(assert (=> b!953811 (=> (not res!638626) (not e!537260))))

(assert (=> b!953811 (= res!638626 e!537258)))

(declare-fun c!100015 () Bool)

(assert (=> b!953811 (= c!100015 (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!953812 () Bool)

(declare-fun get!14591 (ValueCell!9920 V!32703) V!32703)

(declare-fun dynLambda!1679 (Int (_ BitVec 64)) V!32703)

(assert (=> b!953812 (= e!537254 (= (apply!896 lt!429785 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000)) (get!14591 (select (arr!27733 (_values!5851 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1679 (defaultEntry!5828 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28213 (_values!5851 thiss!1141))))))

(assert (=> b!953812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28214 (_keys!10812 thiss!1141))))))

(declare-fun bm!41662 () Bool)

(assert (=> bm!41662 (= call!41668 (contains!5256 lt!429785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!953813 () Bool)

(declare-fun c!100014 () Bool)

(assert (=> b!953813 (= c!100014 (and (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!953813 (= e!537261 e!537251)))

(declare-fun b!953814 () Bool)

(declare-fun e!537252 () Bool)

(assert (=> b!953814 (= e!537252 (= (apply!896 lt!429785 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5664 thiss!1141)))))

(declare-fun b!953815 () Bool)

(declare-fun call!41667 () Bool)

(assert (=> b!953815 (= e!537253 (not call!41667))))

(declare-fun b!953816 () Bool)

(declare-fun res!638625 () Bool)

(assert (=> b!953816 (=> (not res!638625) (not e!537260))))

(assert (=> b!953816 (= res!638625 e!537257)))

(declare-fun res!638628 () Bool)

(assert (=> b!953816 (=> res!638628 e!537257)))

(assert (=> b!953816 (= res!638628 (not e!537249))))

(declare-fun res!638629 () Bool)

(assert (=> b!953816 (=> (not res!638629) (not e!537249))))

(assert (=> b!953816 (= res!638629 (bvslt #b00000000000000000000000000000000 (size!28214 (_keys!10812 thiss!1141))))))

(declare-fun d!115911 () Bool)

(assert (=> d!115911 e!537260))

(declare-fun res!638632 () Bool)

(assert (=> d!115911 (=> (not res!638632) (not e!537260))))

(assert (=> d!115911 (= res!638632 (or (bvsge #b00000000000000000000000000000000 (size!28214 (_keys!10812 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28214 (_keys!10812 thiss!1141))))))))

(declare-fun lt!429793 () ListLongMap!12269)

(assert (=> d!115911 (= lt!429785 lt!429793)))

(declare-fun lt!429795 () Unit!32032)

(assert (=> d!115911 (= lt!429795 e!537250)))

(declare-fun c!100013 () Bool)

(assert (=> d!115911 (= c!100013 e!537256)))

(declare-fun res!638630 () Bool)

(assert (=> d!115911 (=> (not res!638630) (not e!537256))))

(assert (=> d!115911 (= res!638630 (bvslt #b00000000000000000000000000000000 (size!28214 (_keys!10812 thiss!1141))))))

(assert (=> d!115911 (= lt!429793 e!537259)))

(declare-fun c!100012 () Bool)

(assert (=> d!115911 (= c!100012 (and (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5560 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115911 (validMask!0 (mask!27725 thiss!1141))))

(assert (=> d!115911 (= (getCurrentListMap!3383 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)) lt!429785)))

(declare-fun b!953802 () Bool)

(declare-fun lt!429800 () Unit!32032)

(assert (=> b!953802 (= e!537250 lt!429800)))

(declare-fun lt!429782 () ListLongMap!12269)

(assert (=> b!953802 (= lt!429782 (getCurrentListMapNoExtraKeys!3370 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)))))

(declare-fun lt!429781 () (_ BitVec 64))

(assert (=> b!953802 (= lt!429781 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429796 () (_ BitVec 64))

(assert (=> b!953802 (= lt!429796 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429787 () Unit!32032)

(declare-fun addStillContains!585 (ListLongMap!12269 (_ BitVec 64) V!32703 (_ BitVec 64)) Unit!32032)

(assert (=> b!953802 (= lt!429787 (addStillContains!585 lt!429782 lt!429781 (zeroValue!5664 thiss!1141) lt!429796))))

(assert (=> b!953802 (contains!5256 (+!2882 lt!429782 (tuple2!13571 lt!429781 (zeroValue!5664 thiss!1141))) lt!429796)))

(declare-fun lt!429802 () Unit!32032)

(assert (=> b!953802 (= lt!429802 lt!429787)))

(declare-fun lt!429788 () ListLongMap!12269)

(assert (=> b!953802 (= lt!429788 (getCurrentListMapNoExtraKeys!3370 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)))))

(declare-fun lt!429783 () (_ BitVec 64))

(assert (=> b!953802 (= lt!429783 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429799 () (_ BitVec 64))

(assert (=> b!953802 (= lt!429799 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429797 () Unit!32032)

(declare-fun addApplyDifferent!466 (ListLongMap!12269 (_ BitVec 64) V!32703 (_ BitVec 64)) Unit!32032)

(assert (=> b!953802 (= lt!429797 (addApplyDifferent!466 lt!429788 lt!429783 (minValue!5664 thiss!1141) lt!429799))))

(assert (=> b!953802 (= (apply!896 (+!2882 lt!429788 (tuple2!13571 lt!429783 (minValue!5664 thiss!1141))) lt!429799) (apply!896 lt!429788 lt!429799))))

(declare-fun lt!429784 () Unit!32032)

(assert (=> b!953802 (= lt!429784 lt!429797)))

(declare-fun lt!429794 () ListLongMap!12269)

(assert (=> b!953802 (= lt!429794 (getCurrentListMapNoExtraKeys!3370 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)))))

(declare-fun lt!429786 () (_ BitVec 64))

(assert (=> b!953802 (= lt!429786 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429792 () (_ BitVec 64))

(assert (=> b!953802 (= lt!429792 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429791 () Unit!32032)

(assert (=> b!953802 (= lt!429791 (addApplyDifferent!466 lt!429794 lt!429786 (zeroValue!5664 thiss!1141) lt!429792))))

(assert (=> b!953802 (= (apply!896 (+!2882 lt!429794 (tuple2!13571 lt!429786 (zeroValue!5664 thiss!1141))) lt!429792) (apply!896 lt!429794 lt!429792))))

(declare-fun lt!429801 () Unit!32032)

(assert (=> b!953802 (= lt!429801 lt!429791)))

(declare-fun lt!429789 () ListLongMap!12269)

(assert (=> b!953802 (= lt!429789 (getCurrentListMapNoExtraKeys!3370 (_keys!10812 thiss!1141) (_values!5851 thiss!1141) (mask!27725 thiss!1141) (extraKeys!5560 thiss!1141) (zeroValue!5664 thiss!1141) (minValue!5664 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5828 thiss!1141)))))

(declare-fun lt!429790 () (_ BitVec 64))

(assert (=> b!953802 (= lt!429790 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429798 () (_ BitVec 64))

(assert (=> b!953802 (= lt!429798 (select (arr!27734 (_keys!10812 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953802 (= lt!429800 (addApplyDifferent!466 lt!429789 lt!429790 (minValue!5664 thiss!1141) lt!429798))))

(assert (=> b!953802 (= (apply!896 (+!2882 lt!429789 (tuple2!13571 lt!429790 (minValue!5664 thiss!1141))) lt!429798) (apply!896 lt!429789 lt!429798))))

(declare-fun bm!41663 () Bool)

(declare-fun call!41663 () ListLongMap!12269)

(declare-fun call!41666 () ListLongMap!12269)

(assert (=> bm!41663 (= call!41663 call!41666)))

(declare-fun b!953817 () Bool)

(assert (=> b!953817 (= e!537253 e!537252)))

(declare-fun res!638631 () Bool)

(assert (=> b!953817 (= res!638631 call!41667)))

(assert (=> b!953817 (=> (not res!638631) (not e!537252))))

(declare-fun b!953818 () Bool)

(assert (=> b!953818 (= e!537251 call!41663)))

(declare-fun bm!41664 () Bool)

(assert (=> bm!41664 (= call!41666 call!41669)))

(declare-fun bm!41665 () Bool)

(assert (=> bm!41665 (= call!41665 (+!2882 (ite c!100012 call!41669 (ite c!100010 call!41666 call!41663)) (ite (or c!100012 c!100010) (tuple2!13571 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5664 thiss!1141)) (tuple2!13571 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5664 thiss!1141)))))))

(declare-fun bm!41666 () Bool)

(assert (=> bm!41666 (= call!41667 (contains!5256 lt!429785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115911 c!100012) b!953809))

(assert (= (and d!115911 (not c!100012)) b!953806))

(assert (= (and b!953806 c!100010) b!953807))

(assert (= (and b!953806 (not c!100010)) b!953813))

(assert (= (and b!953813 c!100014) b!953805))

(assert (= (and b!953813 (not c!100014)) b!953818))

(assert (= (or b!953805 b!953818) bm!41663))

(assert (= (or b!953807 bm!41663) bm!41664))

(assert (= (or b!953807 b!953805) bm!41660))

(assert (= (or b!953809 bm!41664) bm!41661))

(assert (= (or b!953809 bm!41660) bm!41665))

(assert (= (and d!115911 res!638630) b!953800))

(assert (= (and d!115911 c!100013) b!953802))

(assert (= (and d!115911 (not c!100013)) b!953808))

(assert (= (and d!115911 res!638632) b!953816))

(assert (= (and b!953816 res!638629) b!953799))

(assert (= (and b!953816 (not res!638628)) b!953804))

(assert (= (and b!953804 res!638627) b!953812))

(assert (= (and b!953816 res!638625) b!953811))

(assert (= (and b!953811 c!100015) b!953803))

(assert (= (and b!953811 (not c!100015)) b!953810))

(assert (= (and b!953803 res!638633) b!953798))

(assert (= (or b!953803 b!953810) bm!41662))

(assert (= (and b!953811 res!638626) b!953801))

(assert (= (and b!953801 c!100011) b!953817))

(assert (= (and b!953801 (not c!100011)) b!953815))

(assert (= (and b!953817 res!638631) b!953814))

(assert (= (or b!953817 b!953815) bm!41666))

(declare-fun b_lambda!14433 () Bool)

(assert (=> (not b_lambda!14433) (not b!953812)))

(declare-fun t!27708 () Bool)

(declare-fun tb!6201 () Bool)

(assert (=> (and b!953584 (= (defaultEntry!5828 thiss!1141) (defaultEntry!5828 thiss!1141)) t!27708) tb!6201))

(declare-fun result!12341 () Bool)

(assert (=> tb!6201 (= result!12341 tp_is_empty!20803)))

(assert (=> b!953812 t!27708))

(declare-fun b_and!29793 () Bool)

(assert (= b_and!29787 (and (=> t!27708 result!12341) b_and!29793)))

(assert (=> b!953799 m!886189))

(assert (=> b!953799 m!886189))

(assert (=> b!953799 m!886241))

(assert (=> b!953804 m!886189))

(assert (=> b!953804 m!886189))

(declare-fun m!886257 () Bool)

(assert (=> b!953804 m!886257))

(declare-fun m!886259 () Bool)

(assert (=> bm!41665 m!886259))

(assert (=> d!115911 m!886105))

(declare-fun m!886261 () Bool)

(assert (=> b!953814 m!886261))

(declare-fun m!886263 () Bool)

(assert (=> bm!41661 m!886263))

(declare-fun m!886265 () Bool)

(assert (=> b!953809 m!886265))

(declare-fun m!886267 () Bool)

(assert (=> bm!41662 m!886267))

(declare-fun m!886269 () Bool)

(assert (=> b!953802 m!886269))

(declare-fun m!886271 () Bool)

(assert (=> b!953802 m!886271))

(declare-fun m!886273 () Bool)

(assert (=> b!953802 m!886273))

(declare-fun m!886275 () Bool)

(assert (=> b!953802 m!886275))

(assert (=> b!953802 m!886275))

(declare-fun m!886277 () Bool)

(assert (=> b!953802 m!886277))

(declare-fun m!886279 () Bool)

(assert (=> b!953802 m!886279))

(declare-fun m!886281 () Bool)

(assert (=> b!953802 m!886281))

(declare-fun m!886283 () Bool)

(assert (=> b!953802 m!886283))

(declare-fun m!886285 () Bool)

(assert (=> b!953802 m!886285))

(declare-fun m!886287 () Bool)

(assert (=> b!953802 m!886287))

(declare-fun m!886289 () Bool)

(assert (=> b!953802 m!886289))

(declare-fun m!886291 () Bool)

(assert (=> b!953802 m!886291))

(declare-fun m!886293 () Bool)

(assert (=> b!953802 m!886293))

(assert (=> b!953802 m!886289))

(assert (=> b!953802 m!886189))

(declare-fun m!886295 () Bool)

(assert (=> b!953802 m!886295))

(assert (=> b!953802 m!886285))

(assert (=> b!953802 m!886281))

(declare-fun m!886297 () Bool)

(assert (=> b!953802 m!886297))

(assert (=> b!953802 m!886263))

(declare-fun m!886299 () Bool)

(assert (=> bm!41666 m!886299))

(declare-fun m!886301 () Bool)

(assert (=> b!953812 m!886301))

(declare-fun m!886303 () Bool)

(assert (=> b!953812 m!886303))

(assert (=> b!953812 m!886301))

(assert (=> b!953812 m!886303))

(declare-fun m!886305 () Bool)

(assert (=> b!953812 m!886305))

(assert (=> b!953812 m!886189))

(declare-fun m!886307 () Bool)

(assert (=> b!953812 m!886307))

(assert (=> b!953812 m!886189))

(assert (=> b!953800 m!886189))

(assert (=> b!953800 m!886189))

(assert (=> b!953800 m!886241))

(declare-fun m!886309 () Bool)

(assert (=> b!953798 m!886309))

(assert (=> b!953585 d!115911))

(declare-fun condMapEmpty!33154 () Bool)

(declare-fun mapDefault!33154 () ValueCell!9920)

(assert (=> mapNonEmpty!33145 (= condMapEmpty!33154 (= mapRest!33145 ((as const (Array (_ BitVec 32) ValueCell!9920)) mapDefault!33154)))))

(declare-fun e!537266 () Bool)

(declare-fun mapRes!33154 () Bool)

(assert (=> mapNonEmpty!33145 (= tp!63511 (and e!537266 mapRes!33154))))

(declare-fun b!953827 () Bool)

(declare-fun e!537267 () Bool)

(assert (=> b!953827 (= e!537267 tp_is_empty!20803)))

(declare-fun b!953828 () Bool)

(assert (=> b!953828 (= e!537266 tp_is_empty!20803)))

(declare-fun mapIsEmpty!33154 () Bool)

(assert (=> mapIsEmpty!33154 mapRes!33154))

(declare-fun mapNonEmpty!33154 () Bool)

(declare-fun tp!63526 () Bool)

(assert (=> mapNonEmpty!33154 (= mapRes!33154 (and tp!63526 e!537267))))

(declare-fun mapKey!33154 () (_ BitVec 32))

(declare-fun mapRest!33154 () (Array (_ BitVec 32) ValueCell!9920))

(declare-fun mapValue!33154 () ValueCell!9920)

(assert (=> mapNonEmpty!33154 (= mapRest!33145 (store mapRest!33154 mapKey!33154 mapValue!33154))))

(assert (= (and mapNonEmpty!33145 condMapEmpty!33154) mapIsEmpty!33154))

(assert (= (and mapNonEmpty!33145 (not condMapEmpty!33154)) mapNonEmpty!33154))

(assert (= (and mapNonEmpty!33154 ((_ is ValueCellFull!9920) mapValue!33154)) b!953827))

(assert (= (and mapNonEmpty!33145 ((_ is ValueCellFull!9920) mapDefault!33154)) b!953828))

(declare-fun m!886311 () Bool)

(assert (=> mapNonEmpty!33154 m!886311))

(declare-fun b_lambda!14435 () Bool)

(assert (= b_lambda!14433 (or (and b!953584 b_free!18295) b_lambda!14435)))

(check-sat (not d!115909) (not b!953691) (not b!953799) (not b!953746) (not d!115911) (not b!953800) (not d!115895) (not d!115893) b_and!29793 (not b!953673) (not b!953798) (not b!953724) (not d!115905) (not d!115897) tp_is_empty!20803 (not b!953809) (not bm!41645) (not b!953755) (not b_next!18295) (not b!953744) (not b!953689) (not bm!41665) (not b!953802) (not b!953814) (not b!953722) (not b!953723) (not b!953804) (not b!953812) (not b!953697) (not b!953711) (not b!953678) (not bm!41662) (not d!115885) (not b!953737) (not bm!41661) (not b_lambda!14435) (not b!953753) (not bm!41666) (not bm!41644) (not mapNonEmpty!33154))
(check-sat b_and!29793 (not b_next!18295))
