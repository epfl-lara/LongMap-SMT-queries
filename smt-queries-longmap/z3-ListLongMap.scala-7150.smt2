; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90906 () Bool)

(assert start!90906)

(declare-fun b!1038666 () Bool)

(declare-fun b_free!20953 () Bool)

(declare-fun b_next!20953 () Bool)

(assert (=> b!1038666 (= b_free!20953 (not b_next!20953))))

(declare-fun tp!74027 () Bool)

(declare-fun b_and!33459 () Bool)

(assert (=> b!1038666 (= tp!74027 b_and!33459)))

(declare-fun b!1038659 () Bool)

(declare-fun e!587748 () Bool)

(declare-fun e!587746 () Bool)

(assert (=> b!1038659 (= e!587748 (not e!587746))))

(declare-fun res!692826 () Bool)

(assert (=> b!1038659 (=> res!692826 e!587746)))

(declare-datatypes ((V!37771 0))(
  ( (V!37772 (val!12387 Int)) )
))
(declare-datatypes ((ValueCell!11633 0))(
  ( (ValueCellFull!11633 (v!14973 V!37771)) (EmptyCell!11633) )
))
(declare-datatypes ((array!65403 0))(
  ( (array!65404 (arr!31476 (Array (_ BitVec 32) (_ BitVec 64))) (size!32009 (_ BitVec 32))) )
))
(declare-datatypes ((array!65405 0))(
  ( (array!65406 (arr!31477 (Array (_ BitVec 32) ValueCell!11633)) (size!32010 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5860 0))(
  ( (LongMapFixedSize!5861 (defaultEntry!6312 Int) (mask!30257 (_ BitVec 32)) (extraKeys!6040 (_ BitVec 32)) (zeroValue!6146 V!37771) (minValue!6146 V!37771) (_size!2985 (_ BitVec 32)) (_keys!11514 array!65403) (_values!6335 array!65405) (_vacant!2985 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5860)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038659 (= res!692826 (not (validMask!0 (mask!30257 thiss!1427))))))

(declare-fun lt!457670 () array!65403)

(declare-datatypes ((List!21975 0))(
  ( (Nil!21972) (Cons!21971 (h!23175 (_ BitVec 64)) (t!31180 List!21975)) )
))
(declare-fun arrayNoDuplicates!0 (array!65403 (_ BitVec 32) List!21975) Bool)

(assert (=> b!1038659 (arrayNoDuplicates!0 lt!457670 #b00000000000000000000000000000000 Nil!21972)))

(declare-datatypes ((Unit!33863 0))(
  ( (Unit!33864) )
))
(declare-fun lt!457669 () Unit!33863)

(declare-datatypes ((SeekEntryResult!9768 0))(
  ( (MissingZero!9768 (index!41443 (_ BitVec 32))) (Found!9768 (index!41444 (_ BitVec 32))) (Intermediate!9768 (undefined!10580 Bool) (index!41445 (_ BitVec 32)) (x!92693 (_ BitVec 32))) (Undefined!9768) (MissingVacant!9768 (index!41446 (_ BitVec 32))) )
))
(declare-fun lt!457672 () SeekEntryResult!9768)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65403 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21975) Unit!33863)

(assert (=> b!1038659 (= lt!457669 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11514 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41444 lt!457672) #b00000000000000000000000000000000 Nil!21972))))

(declare-fun arrayCountValidKeys!0 (array!65403 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038659 (= (arrayCountValidKeys!0 lt!457670 #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11514 thiss!1427) #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038659 (= lt!457670 (array!65404 (store (arr!31476 (_keys!11514 thiss!1427)) (index!41444 lt!457672) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32009 (_keys!11514 thiss!1427))))))

(declare-fun lt!457671 () Unit!33863)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65403 (_ BitVec 32) (_ BitVec 64)) Unit!33863)

(assert (=> b!1038659 (= lt!457671 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11514 thiss!1427) (index!41444 lt!457672) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038660 () Bool)

(declare-fun res!692825 () Bool)

(declare-fun e!587745 () Bool)

(assert (=> b!1038660 (=> (not res!692825) (not e!587745))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038660 (= res!692825 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38560 () Bool)

(declare-fun mapRes!38560 () Bool)

(declare-fun tp!74026 () Bool)

(declare-fun e!587747 () Bool)

(assert (=> mapNonEmpty!38560 (= mapRes!38560 (and tp!74026 e!587747))))

(declare-fun mapValue!38560 () ValueCell!11633)

(declare-fun mapKey!38560 () (_ BitVec 32))

(declare-fun mapRest!38560 () (Array (_ BitVec 32) ValueCell!11633))

(assert (=> mapNonEmpty!38560 (= (arr!31477 (_values!6335 thiss!1427)) (store mapRest!38560 mapKey!38560 mapValue!38560))))

(declare-fun b!1038661 () Bool)

(assert (=> b!1038661 (= e!587745 e!587748)))

(declare-fun res!692823 () Bool)

(assert (=> b!1038661 (=> (not res!692823) (not e!587748))))

(get-info :version)

(assert (=> b!1038661 (= res!692823 ((_ is Found!9768) lt!457672))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65403 (_ BitVec 32)) SeekEntryResult!9768)

(assert (=> b!1038661 (= lt!457672 (seekEntry!0 key!909 (_keys!11514 thiss!1427) (mask!30257 thiss!1427)))))

(declare-fun b!1038662 () Bool)

(declare-fun e!587749 () Bool)

(declare-fun tp_is_empty!24673 () Bool)

(assert (=> b!1038662 (= e!587749 tp_is_empty!24673)))

(declare-fun b!1038663 () Bool)

(assert (=> b!1038663 (= e!587747 tp_is_empty!24673)))

(declare-fun b!1038664 () Bool)

(declare-fun e!587744 () Bool)

(assert (=> b!1038664 (= e!587744 (and e!587749 mapRes!38560))))

(declare-fun condMapEmpty!38560 () Bool)

(declare-fun mapDefault!38560 () ValueCell!11633)

(assert (=> b!1038664 (= condMapEmpty!38560 (= (arr!31477 (_values!6335 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11633)) mapDefault!38560)))))

(declare-fun b!1038665 () Bool)

(assert (=> b!1038665 (= e!587746 (or (not (= (size!32009 (_keys!11514 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30257 thiss!1427)))) (bvsge (index!41444 lt!457672) #b00000000000000000000000000000000)))))

(declare-fun e!587743 () Bool)

(declare-fun array_inv!24337 (array!65403) Bool)

(declare-fun array_inv!24338 (array!65405) Bool)

(assert (=> b!1038666 (= e!587743 (and tp!74027 tp_is_empty!24673 (array_inv!24337 (_keys!11514 thiss!1427)) (array_inv!24338 (_values!6335 thiss!1427)) e!587744))))

(declare-fun res!692824 () Bool)

(assert (=> start!90906 (=> (not res!692824) (not e!587745))))

(declare-fun valid!2198 (LongMapFixedSize!5860) Bool)

(assert (=> start!90906 (= res!692824 (valid!2198 thiss!1427))))

(assert (=> start!90906 e!587745))

(assert (=> start!90906 e!587743))

(assert (=> start!90906 true))

(declare-fun mapIsEmpty!38560 () Bool)

(assert (=> mapIsEmpty!38560 mapRes!38560))

(assert (= (and start!90906 res!692824) b!1038660))

(assert (= (and b!1038660 res!692825) b!1038661))

(assert (= (and b!1038661 res!692823) b!1038659))

(assert (= (and b!1038659 (not res!692826)) b!1038665))

(assert (= (and b!1038664 condMapEmpty!38560) mapIsEmpty!38560))

(assert (= (and b!1038664 (not condMapEmpty!38560)) mapNonEmpty!38560))

(assert (= (and mapNonEmpty!38560 ((_ is ValueCellFull!11633) mapValue!38560)) b!1038663))

(assert (= (and b!1038664 ((_ is ValueCellFull!11633) mapDefault!38560)) b!1038662))

(assert (= b!1038666 b!1038664))

(assert (= start!90906 b!1038666))

(declare-fun m!958033 () Bool)

(assert (=> start!90906 m!958033))

(declare-fun m!958035 () Bool)

(assert (=> b!1038666 m!958035))

(declare-fun m!958037 () Bool)

(assert (=> b!1038666 m!958037))

(declare-fun m!958039 () Bool)

(assert (=> b!1038661 m!958039))

(declare-fun m!958041 () Bool)

(assert (=> b!1038659 m!958041))

(declare-fun m!958043 () Bool)

(assert (=> b!1038659 m!958043))

(declare-fun m!958045 () Bool)

(assert (=> b!1038659 m!958045))

(declare-fun m!958047 () Bool)

(assert (=> b!1038659 m!958047))

(declare-fun m!958049 () Bool)

(assert (=> b!1038659 m!958049))

(declare-fun m!958051 () Bool)

(assert (=> b!1038659 m!958051))

(declare-fun m!958053 () Bool)

(assert (=> b!1038659 m!958053))

(declare-fun m!958055 () Bool)

(assert (=> mapNonEmpty!38560 m!958055))

(check-sat (not b!1038659) tp_is_empty!24673 (not b!1038661) (not b_next!20953) b_and!33459 (not start!90906) (not mapNonEmpty!38560) (not b!1038666))
(check-sat b_and!33459 (not b_next!20953))
(get-model)

(declare-fun d!125263 () Bool)

(declare-fun res!692857 () Bool)

(declare-fun e!587800 () Bool)

(assert (=> d!125263 (=> (not res!692857) (not e!587800))))

(declare-fun simpleValid!424 (LongMapFixedSize!5860) Bool)

(assert (=> d!125263 (= res!692857 (simpleValid!424 thiss!1427))))

(assert (=> d!125263 (= (valid!2198 thiss!1427) e!587800)))

(declare-fun b!1038721 () Bool)

(declare-fun res!692858 () Bool)

(assert (=> b!1038721 (=> (not res!692858) (not e!587800))))

(assert (=> b!1038721 (= res!692858 (= (arrayCountValidKeys!0 (_keys!11514 thiss!1427) #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))) (_size!2985 thiss!1427)))))

(declare-fun b!1038722 () Bool)

(declare-fun res!692859 () Bool)

(assert (=> b!1038722 (=> (not res!692859) (not e!587800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65403 (_ BitVec 32)) Bool)

(assert (=> b!1038722 (= res!692859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11514 thiss!1427) (mask!30257 thiss!1427)))))

(declare-fun b!1038723 () Bool)

(assert (=> b!1038723 (= e!587800 (arrayNoDuplicates!0 (_keys!11514 thiss!1427) #b00000000000000000000000000000000 Nil!21972))))

(assert (= (and d!125263 res!692857) b!1038721))

(assert (= (and b!1038721 res!692858) b!1038722))

(assert (= (and b!1038722 res!692859) b!1038723))

(declare-fun m!958105 () Bool)

(assert (=> d!125263 m!958105))

(assert (=> b!1038721 m!958049))

(declare-fun m!958107 () Bool)

(assert (=> b!1038722 m!958107))

(declare-fun m!958109 () Bool)

(assert (=> b!1038723 m!958109))

(assert (=> start!90906 d!125263))

(declare-fun d!125265 () Bool)

(declare-fun e!587803 () Bool)

(assert (=> d!125265 e!587803))

(declare-fun res!692862 () Bool)

(assert (=> d!125265 (=> (not res!692862) (not e!587803))))

(assert (=> d!125265 (= res!692862 (and (bvsge (index!41444 lt!457672) #b00000000000000000000000000000000) (bvslt (index!41444 lt!457672) (size!32009 (_keys!11514 thiss!1427)))))))

(declare-fun lt!457699 () Unit!33863)

(declare-fun choose!53 (array!65403 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21975) Unit!33863)

(assert (=> d!125265 (= lt!457699 (choose!53 (_keys!11514 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41444 lt!457672) #b00000000000000000000000000000000 Nil!21972))))

(assert (=> d!125265 (bvslt (size!32009 (_keys!11514 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125265 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11514 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41444 lt!457672) #b00000000000000000000000000000000 Nil!21972) lt!457699)))

(declare-fun b!1038726 () Bool)

(assert (=> b!1038726 (= e!587803 (arrayNoDuplicates!0 (array!65404 (store (arr!31476 (_keys!11514 thiss!1427)) (index!41444 lt!457672) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32009 (_keys!11514 thiss!1427))) #b00000000000000000000000000000000 Nil!21972))))

(assert (= (and d!125265 res!692862) b!1038726))

(declare-fun m!958111 () Bool)

(assert (=> d!125265 m!958111))

(assert (=> b!1038726 m!958045))

(declare-fun m!958113 () Bool)

(assert (=> b!1038726 m!958113))

(assert (=> b!1038659 d!125265))

(declare-fun b!1038737 () Bool)

(declare-fun e!587815 () Bool)

(declare-fun call!43944 () Bool)

(assert (=> b!1038737 (= e!587815 call!43944)))

(declare-fun b!1038738 () Bool)

(assert (=> b!1038738 (= e!587815 call!43944)))

(declare-fun b!1038739 () Bool)

(declare-fun e!587812 () Bool)

(assert (=> b!1038739 (= e!587812 e!587815)))

(declare-fun c!105232 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038739 (= c!105232 (validKeyInArray!0 (select (arr!31476 lt!457670) #b00000000000000000000000000000000)))))

(declare-fun bm!43941 () Bool)

(assert (=> bm!43941 (= call!43944 (arrayNoDuplicates!0 lt!457670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105232 (Cons!21971 (select (arr!31476 lt!457670) #b00000000000000000000000000000000) Nil!21972) Nil!21972)))))

(declare-fun d!125267 () Bool)

(declare-fun res!692871 () Bool)

(declare-fun e!587814 () Bool)

(assert (=> d!125267 (=> res!692871 e!587814)))

(assert (=> d!125267 (= res!692871 (bvsge #b00000000000000000000000000000000 (size!32009 lt!457670)))))

(assert (=> d!125267 (= (arrayNoDuplicates!0 lt!457670 #b00000000000000000000000000000000 Nil!21972) e!587814)))

(declare-fun b!1038740 () Bool)

(assert (=> b!1038740 (= e!587814 e!587812)))

(declare-fun res!692870 () Bool)

(assert (=> b!1038740 (=> (not res!692870) (not e!587812))))

(declare-fun e!587813 () Bool)

(assert (=> b!1038740 (= res!692870 (not e!587813))))

(declare-fun res!692869 () Bool)

(assert (=> b!1038740 (=> (not res!692869) (not e!587813))))

(assert (=> b!1038740 (= res!692869 (validKeyInArray!0 (select (arr!31476 lt!457670) #b00000000000000000000000000000000)))))

(declare-fun b!1038741 () Bool)

(declare-fun contains!6020 (List!21975 (_ BitVec 64)) Bool)

(assert (=> b!1038741 (= e!587813 (contains!6020 Nil!21972 (select (arr!31476 lt!457670) #b00000000000000000000000000000000)))))

(assert (= (and d!125267 (not res!692871)) b!1038740))

(assert (= (and b!1038740 res!692869) b!1038741))

(assert (= (and b!1038740 res!692870) b!1038739))

(assert (= (and b!1038739 c!105232) b!1038738))

(assert (= (and b!1038739 (not c!105232)) b!1038737))

(assert (= (or b!1038738 b!1038737) bm!43941))

(declare-fun m!958115 () Bool)

(assert (=> b!1038739 m!958115))

(assert (=> b!1038739 m!958115))

(declare-fun m!958117 () Bool)

(assert (=> b!1038739 m!958117))

(assert (=> bm!43941 m!958115))

(declare-fun m!958119 () Bool)

(assert (=> bm!43941 m!958119))

(assert (=> b!1038740 m!958115))

(assert (=> b!1038740 m!958115))

(assert (=> b!1038740 m!958117))

(assert (=> b!1038741 m!958115))

(assert (=> b!1038741 m!958115))

(declare-fun m!958121 () Bool)

(assert (=> b!1038741 m!958121))

(assert (=> b!1038659 d!125267))

(declare-fun b!1038750 () Bool)

(declare-fun e!587821 () (_ BitVec 32))

(assert (=> b!1038750 (= e!587821 #b00000000000000000000000000000000)))

(declare-fun b!1038751 () Bool)

(declare-fun e!587820 () (_ BitVec 32))

(declare-fun call!43947 () (_ BitVec 32))

(assert (=> b!1038751 (= e!587820 call!43947)))

(declare-fun b!1038752 () Bool)

(assert (=> b!1038752 (= e!587820 (bvadd #b00000000000000000000000000000001 call!43947))))

(declare-fun d!125269 () Bool)

(declare-fun lt!457702 () (_ BitVec 32))

(assert (=> d!125269 (and (bvsge lt!457702 #b00000000000000000000000000000000) (bvsle lt!457702 (bvsub (size!32009 lt!457670) #b00000000000000000000000000000000)))))

(assert (=> d!125269 (= lt!457702 e!587821)))

(declare-fun c!105238 () Bool)

(assert (=> d!125269 (= c!105238 (bvsge #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))))))

(assert (=> d!125269 (and (bvsle #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32009 (_keys!11514 thiss!1427)) (size!32009 lt!457670)))))

(assert (=> d!125269 (= (arrayCountValidKeys!0 lt!457670 #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))) lt!457702)))

(declare-fun bm!43944 () Bool)

(assert (=> bm!43944 (= call!43947 (arrayCountValidKeys!0 lt!457670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32009 (_keys!11514 thiss!1427))))))

(declare-fun b!1038753 () Bool)

(assert (=> b!1038753 (= e!587821 e!587820)))

(declare-fun c!105237 () Bool)

(assert (=> b!1038753 (= c!105237 (validKeyInArray!0 (select (arr!31476 lt!457670) #b00000000000000000000000000000000)))))

(assert (= (and d!125269 c!105238) b!1038750))

(assert (= (and d!125269 (not c!105238)) b!1038753))

(assert (= (and b!1038753 c!105237) b!1038752))

(assert (= (and b!1038753 (not c!105237)) b!1038751))

(assert (= (or b!1038752 b!1038751) bm!43944))

(declare-fun m!958123 () Bool)

(assert (=> bm!43944 m!958123))

(assert (=> b!1038753 m!958115))

(assert (=> b!1038753 m!958115))

(assert (=> b!1038753 m!958117))

(assert (=> b!1038659 d!125269))

(declare-fun b!1038764 () Bool)

(declare-fun e!587827 () Bool)

(assert (=> b!1038764 (= e!587827 (bvslt (size!32009 (_keys!11514 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038763 () Bool)

(declare-fun res!692882 () Bool)

(assert (=> b!1038763 (=> (not res!692882) (not e!587827))))

(assert (=> b!1038763 (= res!692882 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1038762 () Bool)

(declare-fun res!692880 () Bool)

(assert (=> b!1038762 (=> (not res!692880) (not e!587827))))

(assert (=> b!1038762 (= res!692880 (validKeyInArray!0 (select (arr!31476 (_keys!11514 thiss!1427)) (index!41444 lt!457672))))))

(declare-fun b!1038765 () Bool)

(declare-fun e!587826 () Bool)

(assert (=> b!1038765 (= e!587826 (= (arrayCountValidKeys!0 (array!65404 (store (arr!31476 (_keys!11514 thiss!1427)) (index!41444 lt!457672) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32009 (_keys!11514 thiss!1427))) #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11514 thiss!1427) #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125271 () Bool)

(assert (=> d!125271 e!587826))

(declare-fun res!692881 () Bool)

(assert (=> d!125271 (=> (not res!692881) (not e!587826))))

(assert (=> d!125271 (= res!692881 (and (bvsge (index!41444 lt!457672) #b00000000000000000000000000000000) (bvslt (index!41444 lt!457672) (size!32009 (_keys!11514 thiss!1427)))))))

(declare-fun lt!457705 () Unit!33863)

(declare-fun choose!82 (array!65403 (_ BitVec 32) (_ BitVec 64)) Unit!33863)

(assert (=> d!125271 (= lt!457705 (choose!82 (_keys!11514 thiss!1427) (index!41444 lt!457672) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125271 e!587827))

(declare-fun res!692883 () Bool)

(assert (=> d!125271 (=> (not res!692883) (not e!587827))))

(assert (=> d!125271 (= res!692883 (and (bvsge (index!41444 lt!457672) #b00000000000000000000000000000000) (bvslt (index!41444 lt!457672) (size!32009 (_keys!11514 thiss!1427)))))))

(assert (=> d!125271 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11514 thiss!1427) (index!41444 lt!457672) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457705)))

(assert (= (and d!125271 res!692883) b!1038762))

(assert (= (and b!1038762 res!692880) b!1038763))

(assert (= (and b!1038763 res!692882) b!1038764))

(assert (= (and d!125271 res!692881) b!1038765))

(declare-fun m!958125 () Bool)

(assert (=> b!1038763 m!958125))

(declare-fun m!958127 () Bool)

(assert (=> b!1038762 m!958127))

(assert (=> b!1038762 m!958127))

(declare-fun m!958129 () Bool)

(assert (=> b!1038762 m!958129))

(assert (=> b!1038765 m!958045))

(declare-fun m!958131 () Bool)

(assert (=> b!1038765 m!958131))

(assert (=> b!1038765 m!958049))

(declare-fun m!958133 () Bool)

(assert (=> d!125271 m!958133))

(assert (=> b!1038659 d!125271))

(declare-fun d!125273 () Bool)

(assert (=> d!125273 (= (validMask!0 (mask!30257 thiss!1427)) (and (or (= (mask!30257 thiss!1427) #b00000000000000000000000000000111) (= (mask!30257 thiss!1427) #b00000000000000000000000000001111) (= (mask!30257 thiss!1427) #b00000000000000000000000000011111) (= (mask!30257 thiss!1427) #b00000000000000000000000000111111) (= (mask!30257 thiss!1427) #b00000000000000000000000001111111) (= (mask!30257 thiss!1427) #b00000000000000000000000011111111) (= (mask!30257 thiss!1427) #b00000000000000000000000111111111) (= (mask!30257 thiss!1427) #b00000000000000000000001111111111) (= (mask!30257 thiss!1427) #b00000000000000000000011111111111) (= (mask!30257 thiss!1427) #b00000000000000000000111111111111) (= (mask!30257 thiss!1427) #b00000000000000000001111111111111) (= (mask!30257 thiss!1427) #b00000000000000000011111111111111) (= (mask!30257 thiss!1427) #b00000000000000000111111111111111) (= (mask!30257 thiss!1427) #b00000000000000001111111111111111) (= (mask!30257 thiss!1427) #b00000000000000011111111111111111) (= (mask!30257 thiss!1427) #b00000000000000111111111111111111) (= (mask!30257 thiss!1427) #b00000000000001111111111111111111) (= (mask!30257 thiss!1427) #b00000000000011111111111111111111) (= (mask!30257 thiss!1427) #b00000000000111111111111111111111) (= (mask!30257 thiss!1427) #b00000000001111111111111111111111) (= (mask!30257 thiss!1427) #b00000000011111111111111111111111) (= (mask!30257 thiss!1427) #b00000000111111111111111111111111) (= (mask!30257 thiss!1427) #b00000001111111111111111111111111) (= (mask!30257 thiss!1427) #b00000011111111111111111111111111) (= (mask!30257 thiss!1427) #b00000111111111111111111111111111) (= (mask!30257 thiss!1427) #b00001111111111111111111111111111) (= (mask!30257 thiss!1427) #b00011111111111111111111111111111) (= (mask!30257 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30257 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1038659 d!125273))

(declare-fun b!1038766 () Bool)

(declare-fun e!587829 () (_ BitVec 32))

(assert (=> b!1038766 (= e!587829 #b00000000000000000000000000000000)))

(declare-fun b!1038767 () Bool)

(declare-fun e!587828 () (_ BitVec 32))

(declare-fun call!43948 () (_ BitVec 32))

(assert (=> b!1038767 (= e!587828 call!43948)))

(declare-fun b!1038768 () Bool)

(assert (=> b!1038768 (= e!587828 (bvadd #b00000000000000000000000000000001 call!43948))))

(declare-fun d!125275 () Bool)

(declare-fun lt!457706 () (_ BitVec 32))

(assert (=> d!125275 (and (bvsge lt!457706 #b00000000000000000000000000000000) (bvsle lt!457706 (bvsub (size!32009 (_keys!11514 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125275 (= lt!457706 e!587829)))

(declare-fun c!105240 () Bool)

(assert (=> d!125275 (= c!105240 (bvsge #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))))))

(assert (=> d!125275 (and (bvsle #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32009 (_keys!11514 thiss!1427)) (size!32009 (_keys!11514 thiss!1427))))))

(assert (=> d!125275 (= (arrayCountValidKeys!0 (_keys!11514 thiss!1427) #b00000000000000000000000000000000 (size!32009 (_keys!11514 thiss!1427))) lt!457706)))

(declare-fun bm!43945 () Bool)

(assert (=> bm!43945 (= call!43948 (arrayCountValidKeys!0 (_keys!11514 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32009 (_keys!11514 thiss!1427))))))

(declare-fun b!1038769 () Bool)

(assert (=> b!1038769 (= e!587829 e!587828)))

(declare-fun c!105239 () Bool)

(assert (=> b!1038769 (= c!105239 (validKeyInArray!0 (select (arr!31476 (_keys!11514 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125275 c!105240) b!1038766))

(assert (= (and d!125275 (not c!105240)) b!1038769))

(assert (= (and b!1038769 c!105239) b!1038768))

(assert (= (and b!1038769 (not c!105239)) b!1038767))

(assert (= (or b!1038768 b!1038767) bm!43945))

(declare-fun m!958135 () Bool)

(assert (=> bm!43945 m!958135))

(declare-fun m!958137 () Bool)

(assert (=> b!1038769 m!958137))

(assert (=> b!1038769 m!958137))

(declare-fun m!958139 () Bool)

(assert (=> b!1038769 m!958139))

(assert (=> b!1038659 d!125275))

(declare-fun b!1038783 () Bool)

(declare-fun e!587837 () SeekEntryResult!9768)

(assert (=> b!1038783 (= e!587837 Undefined!9768)))

(declare-fun b!1038784 () Bool)

(declare-fun e!587838 () SeekEntryResult!9768)

(declare-fun lt!457717 () SeekEntryResult!9768)

(assert (=> b!1038784 (= e!587838 (Found!9768 (index!41445 lt!457717)))))

(declare-fun b!1038785 () Bool)

(assert (=> b!1038785 (= e!587837 e!587838)))

(declare-fun lt!457716 () (_ BitVec 64))

(assert (=> b!1038785 (= lt!457716 (select (arr!31476 (_keys!11514 thiss!1427)) (index!41445 lt!457717)))))

(declare-fun c!105249 () Bool)

(assert (=> b!1038785 (= c!105249 (= lt!457716 key!909))))

(declare-fun b!1038786 () Bool)

(declare-fun c!105248 () Bool)

(assert (=> b!1038786 (= c!105248 (= lt!457716 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587836 () SeekEntryResult!9768)

(assert (=> b!1038786 (= e!587838 e!587836)))

(declare-fun b!1038787 () Bool)

(assert (=> b!1038787 (= e!587836 (MissingZero!9768 (index!41445 lt!457717)))))

(declare-fun b!1038782 () Bool)

(declare-fun lt!457718 () SeekEntryResult!9768)

(assert (=> b!1038782 (= e!587836 (ite ((_ is MissingVacant!9768) lt!457718) (MissingZero!9768 (index!41446 lt!457718)) lt!457718))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65403 (_ BitVec 32)) SeekEntryResult!9768)

(assert (=> b!1038782 (= lt!457718 (seekKeyOrZeroReturnVacant!0 (x!92693 lt!457717) (index!41445 lt!457717) (index!41445 lt!457717) key!909 (_keys!11514 thiss!1427) (mask!30257 thiss!1427)))))

(declare-fun d!125277 () Bool)

(declare-fun lt!457715 () SeekEntryResult!9768)

(assert (=> d!125277 (and (or ((_ is MissingVacant!9768) lt!457715) (not ((_ is Found!9768) lt!457715)) (and (bvsge (index!41444 lt!457715) #b00000000000000000000000000000000) (bvslt (index!41444 lt!457715) (size!32009 (_keys!11514 thiss!1427))))) (not ((_ is MissingVacant!9768) lt!457715)) (or (not ((_ is Found!9768) lt!457715)) (= (select (arr!31476 (_keys!11514 thiss!1427)) (index!41444 lt!457715)) key!909)))))

(assert (=> d!125277 (= lt!457715 e!587837)))

(declare-fun c!105247 () Bool)

(assert (=> d!125277 (= c!105247 (and ((_ is Intermediate!9768) lt!457717) (undefined!10580 lt!457717)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65403 (_ BitVec 32)) SeekEntryResult!9768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125277 (= lt!457717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30257 thiss!1427)) key!909 (_keys!11514 thiss!1427) (mask!30257 thiss!1427)))))

(assert (=> d!125277 (validMask!0 (mask!30257 thiss!1427))))

(assert (=> d!125277 (= (seekEntry!0 key!909 (_keys!11514 thiss!1427) (mask!30257 thiss!1427)) lt!457715)))

(assert (= (and d!125277 c!105247) b!1038783))

(assert (= (and d!125277 (not c!105247)) b!1038785))

(assert (= (and b!1038785 c!105249) b!1038784))

(assert (= (and b!1038785 (not c!105249)) b!1038786))

(assert (= (and b!1038786 c!105248) b!1038787))

(assert (= (and b!1038786 (not c!105248)) b!1038782))

(declare-fun m!958141 () Bool)

(assert (=> b!1038785 m!958141))

(declare-fun m!958143 () Bool)

(assert (=> b!1038782 m!958143))

(declare-fun m!958145 () Bool)

(assert (=> d!125277 m!958145))

(declare-fun m!958147 () Bool)

(assert (=> d!125277 m!958147))

(assert (=> d!125277 m!958147))

(declare-fun m!958149 () Bool)

(assert (=> d!125277 m!958149))

(assert (=> d!125277 m!958043))

(assert (=> b!1038661 d!125277))

(declare-fun d!125279 () Bool)

(assert (=> d!125279 (= (array_inv!24337 (_keys!11514 thiss!1427)) (bvsge (size!32009 (_keys!11514 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038666 d!125279))

(declare-fun d!125281 () Bool)

(assert (=> d!125281 (= (array_inv!24338 (_values!6335 thiss!1427)) (bvsge (size!32010 (_values!6335 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038666 d!125281))

(declare-fun condMapEmpty!38569 () Bool)

(declare-fun mapDefault!38569 () ValueCell!11633)

(assert (=> mapNonEmpty!38560 (= condMapEmpty!38569 (= mapRest!38560 ((as const (Array (_ BitVec 32) ValueCell!11633)) mapDefault!38569)))))

(declare-fun e!587844 () Bool)

(declare-fun mapRes!38569 () Bool)

(assert (=> mapNonEmpty!38560 (= tp!74026 (and e!587844 mapRes!38569))))

(declare-fun mapNonEmpty!38569 () Bool)

(declare-fun tp!74042 () Bool)

(declare-fun e!587843 () Bool)

(assert (=> mapNonEmpty!38569 (= mapRes!38569 (and tp!74042 e!587843))))

(declare-fun mapValue!38569 () ValueCell!11633)

(declare-fun mapKey!38569 () (_ BitVec 32))

(declare-fun mapRest!38569 () (Array (_ BitVec 32) ValueCell!11633))

(assert (=> mapNonEmpty!38569 (= mapRest!38560 (store mapRest!38569 mapKey!38569 mapValue!38569))))

(declare-fun b!1038795 () Bool)

(assert (=> b!1038795 (= e!587844 tp_is_empty!24673)))

(declare-fun b!1038794 () Bool)

(assert (=> b!1038794 (= e!587843 tp_is_empty!24673)))

(declare-fun mapIsEmpty!38569 () Bool)

(assert (=> mapIsEmpty!38569 mapRes!38569))

(assert (= (and mapNonEmpty!38560 condMapEmpty!38569) mapIsEmpty!38569))

(assert (= (and mapNonEmpty!38560 (not condMapEmpty!38569)) mapNonEmpty!38569))

(assert (= (and mapNonEmpty!38569 ((_ is ValueCellFull!11633) mapValue!38569)) b!1038794))

(assert (= (and mapNonEmpty!38560 ((_ is ValueCellFull!11633) mapDefault!38569)) b!1038795))

(declare-fun m!958151 () Bool)

(assert (=> mapNonEmpty!38569 m!958151))

(check-sat (not b!1038741) (not b!1038769) tp_is_empty!24673 (not b!1038782) (not b!1038722) (not b!1038721) b_and!33459 (not b!1038763) (not mapNonEmpty!38569) (not b!1038762) (not bm!43945) (not bm!43944) (not d!125277) (not b!1038723) (not b!1038765) (not b!1038740) (not d!125265) (not b!1038726) (not b_next!20953) (not b!1038753) (not d!125263) (not b!1038739) (not bm!43941) (not d!125271))
(check-sat b_and!33459 (not b_next!20953))
