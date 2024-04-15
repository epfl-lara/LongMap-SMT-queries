; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91060 () Bool)

(assert start!91060)

(declare-fun b!1039658 () Bool)

(declare-fun b_free!20989 () Bool)

(declare-fun b_next!20989 () Bool)

(assert (=> b!1039658 (= b_free!20989 (not b_next!20989))))

(declare-fun tp!74152 () Bool)

(declare-fun b_and!33495 () Bool)

(assert (=> b!1039658 (= tp!74152 b_and!33495)))

(declare-fun e!588476 () Bool)

(declare-fun tp_is_empty!24709 () Bool)

(declare-fun e!588480 () Bool)

(declare-datatypes ((V!37819 0))(
  ( (V!37820 (val!12405 Int)) )
))
(declare-datatypes ((ValueCell!11651 0))(
  ( (ValueCellFull!11651 (v!14991 V!37819)) (EmptyCell!11651) )
))
(declare-datatypes ((array!65487 0))(
  ( (array!65488 (arr!31512 (Array (_ BitVec 32) (_ BitVec 64))) (size!32045 (_ BitVec 32))) )
))
(declare-datatypes ((array!65489 0))(
  ( (array!65490 (arr!31513 (Array (_ BitVec 32) ValueCell!11651)) (size!32046 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5896 0))(
  ( (LongMapFixedSize!5897 (defaultEntry!6330 Int) (mask!30301 (_ BitVec 32)) (extraKeys!6058 (_ BitVec 32)) (zeroValue!6164 V!37819) (minValue!6164 V!37819) (_size!3003 (_ BitVec 32)) (_keys!11540 array!65487) (_values!6353 array!65489) (_vacant!3003 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5896)

(declare-fun array_inv!24363 (array!65487) Bool)

(declare-fun array_inv!24364 (array!65489) Bool)

(assert (=> b!1039658 (= e!588480 (and tp!74152 tp_is_empty!24709 (array_inv!24363 (_keys!11540 thiss!1427)) (array_inv!24364 (_values!6353 thiss!1427)) e!588476))))

(declare-fun mapNonEmpty!38632 () Bool)

(declare-fun mapRes!38632 () Bool)

(declare-fun tp!74153 () Bool)

(declare-fun e!588479 () Bool)

(assert (=> mapNonEmpty!38632 (= mapRes!38632 (and tp!74153 e!588479))))

(declare-fun mapRest!38632 () (Array (_ BitVec 32) ValueCell!11651))

(declare-fun mapKey!38632 () (_ BitVec 32))

(declare-fun mapValue!38632 () ValueCell!11651)

(assert (=> mapNonEmpty!38632 (= (arr!31513 (_values!6353 thiss!1427)) (store mapRest!38632 mapKey!38632 mapValue!38632))))

(declare-fun b!1039659 () Bool)

(declare-fun e!588478 () Bool)

(declare-fun e!588475 () Bool)

(assert (=> b!1039659 (= e!588478 e!588475)))

(declare-fun res!693303 () Bool)

(assert (=> b!1039659 (=> (not res!693303) (not e!588475))))

(declare-datatypes ((SeekEntryResult!9783 0))(
  ( (MissingZero!9783 (index!41503 (_ BitVec 32))) (Found!9783 (index!41504 (_ BitVec 32))) (Intermediate!9783 (undefined!10595 Bool) (index!41505 (_ BitVec 32)) (x!92804 (_ BitVec 32))) (Undefined!9783) (MissingVacant!9783 (index!41506 (_ BitVec 32))) )
))
(declare-fun lt!458050 () SeekEntryResult!9783)

(get-info :version)

(assert (=> b!1039659 (= res!693303 ((_ is Found!9783) lt!458050))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65487 (_ BitVec 32)) SeekEntryResult!9783)

(assert (=> b!1039659 (= lt!458050 (seekEntry!0 key!909 (_keys!11540 thiss!1427) (mask!30301 thiss!1427)))))

(declare-fun b!1039660 () Bool)

(assert (=> b!1039660 (= e!588479 tp_is_empty!24709)))

(declare-fun mapIsEmpty!38632 () Bool)

(assert (=> mapIsEmpty!38632 mapRes!38632))

(declare-fun b!1039661 () Bool)

(declare-fun e!588477 () Bool)

(assert (=> b!1039661 (= e!588476 (and e!588477 mapRes!38632))))

(declare-fun condMapEmpty!38632 () Bool)

(declare-fun mapDefault!38632 () ValueCell!11651)

(assert (=> b!1039661 (= condMapEmpty!38632 (= (arr!31513 (_values!6353 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11651)) mapDefault!38632)))))

(declare-fun b!1039662 () Bool)

(assert (=> b!1039662 (= e!588475 (not (or (bvslt (index!41504 lt!458050) #b00000000000000000000000000000000) (bvslt (index!41504 lt!458050) (size!32045 (_keys!11540 thiss!1427))))))))

(declare-fun lt!458052 () array!65487)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65487 (_ BitVec 32)) Bool)

(assert (=> b!1039662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458052 (mask!30301 thiss!1427))))

(declare-datatypes ((Unit!33883 0))(
  ( (Unit!33884) )
))
(declare-fun lt!458049 () Unit!33883)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65487 (_ BitVec 32) (_ BitVec 32)) Unit!33883)

(assert (=> b!1039662 (= lt!458049 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11540 thiss!1427) (index!41504 lt!458050) (mask!30301 thiss!1427)))))

(declare-datatypes ((List!21986 0))(
  ( (Nil!21983) (Cons!21982 (h!23186 (_ BitVec 64)) (t!31191 List!21986)) )
))
(declare-fun arrayNoDuplicates!0 (array!65487 (_ BitVec 32) List!21986) Bool)

(assert (=> b!1039662 (arrayNoDuplicates!0 lt!458052 #b00000000000000000000000000000000 Nil!21983)))

(declare-fun lt!458051 () Unit!33883)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65487 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21986) Unit!33883)

(assert (=> b!1039662 (= lt!458051 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11540 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41504 lt!458050) #b00000000000000000000000000000000 Nil!21983))))

(declare-fun arrayCountValidKeys!0 (array!65487 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039662 (= (arrayCountValidKeys!0 lt!458052 #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11540 thiss!1427) #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039662 (= lt!458052 (array!65488 (store (arr!31512 (_keys!11540 thiss!1427)) (index!41504 lt!458050) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32045 (_keys!11540 thiss!1427))))))

(declare-fun lt!458053 () Unit!33883)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65487 (_ BitVec 32) (_ BitVec 64)) Unit!33883)

(assert (=> b!1039662 (= lt!458053 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11540 thiss!1427) (index!41504 lt!458050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039663 () Bool)

(assert (=> b!1039663 (= e!588477 tp_is_empty!24709)))

(declare-fun b!1039657 () Bool)

(declare-fun res!693301 () Bool)

(assert (=> b!1039657 (=> (not res!693301) (not e!588478))))

(assert (=> b!1039657 (= res!693301 (not (= key!909 (bvneg key!909))))))

(declare-fun res!693302 () Bool)

(assert (=> start!91060 (=> (not res!693302) (not e!588478))))

(declare-fun valid!2206 (LongMapFixedSize!5896) Bool)

(assert (=> start!91060 (= res!693302 (valid!2206 thiss!1427))))

(assert (=> start!91060 e!588478))

(assert (=> start!91060 e!588480))

(assert (=> start!91060 true))

(assert (= (and start!91060 res!693302) b!1039657))

(assert (= (and b!1039657 res!693301) b!1039659))

(assert (= (and b!1039659 res!693303) b!1039662))

(assert (= (and b!1039661 condMapEmpty!38632) mapIsEmpty!38632))

(assert (= (and b!1039661 (not condMapEmpty!38632)) mapNonEmpty!38632))

(assert (= (and mapNonEmpty!38632 ((_ is ValueCellFull!11651) mapValue!38632)) b!1039660))

(assert (= (and b!1039661 ((_ is ValueCellFull!11651) mapDefault!38632)) b!1039663))

(assert (= b!1039658 b!1039661))

(assert (= start!91060 b!1039658))

(declare-fun m!958825 () Bool)

(assert (=> b!1039659 m!958825))

(declare-fun m!958827 () Bool)

(assert (=> start!91060 m!958827))

(declare-fun m!958829 () Bool)

(assert (=> b!1039662 m!958829))

(declare-fun m!958831 () Bool)

(assert (=> b!1039662 m!958831))

(declare-fun m!958833 () Bool)

(assert (=> b!1039662 m!958833))

(declare-fun m!958835 () Bool)

(assert (=> b!1039662 m!958835))

(declare-fun m!958837 () Bool)

(assert (=> b!1039662 m!958837))

(declare-fun m!958839 () Bool)

(assert (=> b!1039662 m!958839))

(declare-fun m!958841 () Bool)

(assert (=> b!1039662 m!958841))

(declare-fun m!958843 () Bool)

(assert (=> b!1039662 m!958843))

(declare-fun m!958845 () Bool)

(assert (=> b!1039658 m!958845))

(declare-fun m!958847 () Bool)

(assert (=> b!1039658 m!958847))

(declare-fun m!958849 () Bool)

(assert (=> mapNonEmpty!38632 m!958849))

(check-sat (not b!1039658) (not b_next!20989) (not b!1039659) (not start!91060) tp_is_empty!24709 (not mapNonEmpty!38632) b_and!33495 (not b!1039662))
(check-sat b_and!33495 (not b_next!20989))
(get-model)

(declare-fun d!125409 () Bool)

(declare-fun res!693330 () Bool)

(declare-fun e!588532 () Bool)

(assert (=> d!125409 (=> res!693330 e!588532)))

(assert (=> d!125409 (= res!693330 (bvsge #b00000000000000000000000000000000 (size!32045 lt!458052)))))

(assert (=> d!125409 (= (arrayNoDuplicates!0 lt!458052 #b00000000000000000000000000000000 Nil!21983) e!588532)))

(declare-fun b!1039716 () Bool)

(declare-fun e!588533 () Bool)

(assert (=> b!1039716 (= e!588532 e!588533)))

(declare-fun res!693329 () Bool)

(assert (=> b!1039716 (=> (not res!693329) (not e!588533))))

(declare-fun e!588531 () Bool)

(assert (=> b!1039716 (= res!693329 (not e!588531))))

(declare-fun res!693328 () Bool)

(assert (=> b!1039716 (=> (not res!693328) (not e!588531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039716 (= res!693328 (validKeyInArray!0 (select (arr!31512 lt!458052) #b00000000000000000000000000000000)))))

(declare-fun b!1039717 () Bool)

(declare-fun contains!6026 (List!21986 (_ BitVec 64)) Bool)

(assert (=> b!1039717 (= e!588531 (contains!6026 Nil!21983 (select (arr!31512 lt!458052) #b00000000000000000000000000000000)))))

(declare-fun b!1039718 () Bool)

(declare-fun e!588534 () Bool)

(declare-fun call!43994 () Bool)

(assert (=> b!1039718 (= e!588534 call!43994)))

(declare-fun b!1039719 () Bool)

(assert (=> b!1039719 (= e!588534 call!43994)))

(declare-fun bm!43991 () Bool)

(declare-fun c!105360 () Bool)

(assert (=> bm!43991 (= call!43994 (arrayNoDuplicates!0 lt!458052 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105360 (Cons!21982 (select (arr!31512 lt!458052) #b00000000000000000000000000000000) Nil!21983) Nil!21983)))))

(declare-fun b!1039720 () Bool)

(assert (=> b!1039720 (= e!588533 e!588534)))

(assert (=> b!1039720 (= c!105360 (validKeyInArray!0 (select (arr!31512 lt!458052) #b00000000000000000000000000000000)))))

(assert (= (and d!125409 (not res!693330)) b!1039716))

(assert (= (and b!1039716 res!693328) b!1039717))

(assert (= (and b!1039716 res!693329) b!1039720))

(assert (= (and b!1039720 c!105360) b!1039718))

(assert (= (and b!1039720 (not c!105360)) b!1039719))

(assert (= (or b!1039718 b!1039719) bm!43991))

(declare-fun m!958903 () Bool)

(assert (=> b!1039716 m!958903))

(assert (=> b!1039716 m!958903))

(declare-fun m!958905 () Bool)

(assert (=> b!1039716 m!958905))

(assert (=> b!1039717 m!958903))

(assert (=> b!1039717 m!958903))

(declare-fun m!958907 () Bool)

(assert (=> b!1039717 m!958907))

(assert (=> bm!43991 m!958903))

(declare-fun m!958909 () Bool)

(assert (=> bm!43991 m!958909))

(assert (=> b!1039720 m!958903))

(assert (=> b!1039720 m!958903))

(assert (=> b!1039720 m!958905))

(assert (=> b!1039662 d!125409))

(declare-fun d!125411 () Bool)

(declare-fun e!588537 () Bool)

(assert (=> d!125411 e!588537))

(declare-fun res!693333 () Bool)

(assert (=> d!125411 (=> (not res!693333) (not e!588537))))

(assert (=> d!125411 (= res!693333 (and (bvsge (index!41504 lt!458050) #b00000000000000000000000000000000) (bvslt (index!41504 lt!458050) (size!32045 (_keys!11540 thiss!1427)))))))

(declare-fun lt!458086 () Unit!33883)

(declare-fun choose!25 (array!65487 (_ BitVec 32) (_ BitVec 32)) Unit!33883)

(assert (=> d!125411 (= lt!458086 (choose!25 (_keys!11540 thiss!1427) (index!41504 lt!458050) (mask!30301 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125411 (validMask!0 (mask!30301 thiss!1427))))

(assert (=> d!125411 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11540 thiss!1427) (index!41504 lt!458050) (mask!30301 thiss!1427)) lt!458086)))

(declare-fun b!1039723 () Bool)

(assert (=> b!1039723 (= e!588537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65488 (store (arr!31512 (_keys!11540 thiss!1427)) (index!41504 lt!458050) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32045 (_keys!11540 thiss!1427))) (mask!30301 thiss!1427)))))

(assert (= (and d!125411 res!693333) b!1039723))

(declare-fun m!958911 () Bool)

(assert (=> d!125411 m!958911))

(declare-fun m!958913 () Bool)

(assert (=> d!125411 m!958913))

(assert (=> b!1039723 m!958843))

(declare-fun m!958915 () Bool)

(assert (=> b!1039723 m!958915))

(assert (=> b!1039662 d!125411))

(declare-fun b!1039733 () Bool)

(declare-fun res!693343 () Bool)

(declare-fun e!588542 () Bool)

(assert (=> b!1039733 (=> (not res!693343) (not e!588542))))

(assert (=> b!1039733 (= res!693343 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039735 () Bool)

(declare-fun e!588543 () Bool)

(assert (=> b!1039735 (= e!588543 (= (arrayCountValidKeys!0 (array!65488 (store (arr!31512 (_keys!11540 thiss!1427)) (index!41504 lt!458050) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32045 (_keys!11540 thiss!1427))) #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11540 thiss!1427) #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125413 () Bool)

(assert (=> d!125413 e!588543))

(declare-fun res!693344 () Bool)

(assert (=> d!125413 (=> (not res!693344) (not e!588543))))

(assert (=> d!125413 (= res!693344 (and (bvsge (index!41504 lt!458050) #b00000000000000000000000000000000) (bvslt (index!41504 lt!458050) (size!32045 (_keys!11540 thiss!1427)))))))

(declare-fun lt!458089 () Unit!33883)

(declare-fun choose!82 (array!65487 (_ BitVec 32) (_ BitVec 64)) Unit!33883)

(assert (=> d!125413 (= lt!458089 (choose!82 (_keys!11540 thiss!1427) (index!41504 lt!458050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125413 e!588542))

(declare-fun res!693345 () Bool)

(assert (=> d!125413 (=> (not res!693345) (not e!588542))))

(assert (=> d!125413 (= res!693345 (and (bvsge (index!41504 lt!458050) #b00000000000000000000000000000000) (bvslt (index!41504 lt!458050) (size!32045 (_keys!11540 thiss!1427)))))))

(assert (=> d!125413 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11540 thiss!1427) (index!41504 lt!458050) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458089)))

(declare-fun b!1039734 () Bool)

(assert (=> b!1039734 (= e!588542 (bvslt (size!32045 (_keys!11540 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1039732 () Bool)

(declare-fun res!693342 () Bool)

(assert (=> b!1039732 (=> (not res!693342) (not e!588542))))

(assert (=> b!1039732 (= res!693342 (validKeyInArray!0 (select (arr!31512 (_keys!11540 thiss!1427)) (index!41504 lt!458050))))))

(assert (= (and d!125413 res!693345) b!1039732))

(assert (= (and b!1039732 res!693342) b!1039733))

(assert (= (and b!1039733 res!693343) b!1039734))

(assert (= (and d!125413 res!693344) b!1039735))

(declare-fun m!958917 () Bool)

(assert (=> b!1039733 m!958917))

(assert (=> b!1039735 m!958843))

(declare-fun m!958919 () Bool)

(assert (=> b!1039735 m!958919))

(assert (=> b!1039735 m!958833))

(declare-fun m!958921 () Bool)

(assert (=> d!125413 m!958921))

(declare-fun m!958923 () Bool)

(assert (=> b!1039732 m!958923))

(assert (=> b!1039732 m!958923))

(declare-fun m!958925 () Bool)

(assert (=> b!1039732 m!958925))

(assert (=> b!1039662 d!125413))

(declare-fun d!125415 () Bool)

(declare-fun e!588546 () Bool)

(assert (=> d!125415 e!588546))

(declare-fun res!693348 () Bool)

(assert (=> d!125415 (=> (not res!693348) (not e!588546))))

(assert (=> d!125415 (= res!693348 (and (bvsge (index!41504 lt!458050) #b00000000000000000000000000000000) (bvslt (index!41504 lt!458050) (size!32045 (_keys!11540 thiss!1427)))))))

(declare-fun lt!458092 () Unit!33883)

(declare-fun choose!53 (array!65487 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21986) Unit!33883)

(assert (=> d!125415 (= lt!458092 (choose!53 (_keys!11540 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41504 lt!458050) #b00000000000000000000000000000000 Nil!21983))))

(assert (=> d!125415 (bvslt (size!32045 (_keys!11540 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125415 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11540 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41504 lt!458050) #b00000000000000000000000000000000 Nil!21983) lt!458092)))

(declare-fun b!1039738 () Bool)

(assert (=> b!1039738 (= e!588546 (arrayNoDuplicates!0 (array!65488 (store (arr!31512 (_keys!11540 thiss!1427)) (index!41504 lt!458050) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32045 (_keys!11540 thiss!1427))) #b00000000000000000000000000000000 Nil!21983))))

(assert (= (and d!125415 res!693348) b!1039738))

(declare-fun m!958927 () Bool)

(assert (=> d!125415 m!958927))

(assert (=> b!1039738 m!958843))

(declare-fun m!958929 () Bool)

(assert (=> b!1039738 m!958929))

(assert (=> b!1039662 d!125415))

(declare-fun b!1039747 () Bool)

(declare-fun e!588552 () (_ BitVec 32))

(declare-fun e!588551 () (_ BitVec 32))

(assert (=> b!1039747 (= e!588552 e!588551)))

(declare-fun c!105365 () Bool)

(assert (=> b!1039747 (= c!105365 (validKeyInArray!0 (select (arr!31512 (_keys!11540 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039748 () Bool)

(declare-fun call!43997 () (_ BitVec 32))

(assert (=> b!1039748 (= e!588551 (bvadd #b00000000000000000000000000000001 call!43997))))

(declare-fun b!1039749 () Bool)

(assert (=> b!1039749 (= e!588552 #b00000000000000000000000000000000)))

(declare-fun b!1039750 () Bool)

(assert (=> b!1039750 (= e!588551 call!43997)))

(declare-fun bm!43994 () Bool)

(assert (=> bm!43994 (= call!43997 (arrayCountValidKeys!0 (_keys!11540 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32045 (_keys!11540 thiss!1427))))))

(declare-fun d!125417 () Bool)

(declare-fun lt!458095 () (_ BitVec 32))

(assert (=> d!125417 (and (bvsge lt!458095 #b00000000000000000000000000000000) (bvsle lt!458095 (bvsub (size!32045 (_keys!11540 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125417 (= lt!458095 e!588552)))

(declare-fun c!105366 () Bool)

(assert (=> d!125417 (= c!105366 (bvsge #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))))))

(assert (=> d!125417 (and (bvsle #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32045 (_keys!11540 thiss!1427)) (size!32045 (_keys!11540 thiss!1427))))))

(assert (=> d!125417 (= (arrayCountValidKeys!0 (_keys!11540 thiss!1427) #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))) lt!458095)))

(assert (= (and d!125417 c!105366) b!1039749))

(assert (= (and d!125417 (not c!105366)) b!1039747))

(assert (= (and b!1039747 c!105365) b!1039748))

(assert (= (and b!1039747 (not c!105365)) b!1039750))

(assert (= (or b!1039748 b!1039750) bm!43994))

(declare-fun m!958931 () Bool)

(assert (=> b!1039747 m!958931))

(assert (=> b!1039747 m!958931))

(declare-fun m!958933 () Bool)

(assert (=> b!1039747 m!958933))

(declare-fun m!958935 () Bool)

(assert (=> bm!43994 m!958935))

(assert (=> b!1039662 d!125417))

(declare-fun b!1039759 () Bool)

(declare-fun e!588559 () Bool)

(declare-fun e!588560 () Bool)

(assert (=> b!1039759 (= e!588559 e!588560)))

(declare-fun c!105369 () Bool)

(assert (=> b!1039759 (= c!105369 (validKeyInArray!0 (select (arr!31512 lt!458052) #b00000000000000000000000000000000)))))

(declare-fun bm!43997 () Bool)

(declare-fun call!44000 () Bool)

(assert (=> bm!43997 (= call!44000 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458052 (mask!30301 thiss!1427)))))

(declare-fun d!125419 () Bool)

(declare-fun res!693353 () Bool)

(assert (=> d!125419 (=> res!693353 e!588559)))

(assert (=> d!125419 (= res!693353 (bvsge #b00000000000000000000000000000000 (size!32045 lt!458052)))))

(assert (=> d!125419 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458052 (mask!30301 thiss!1427)) e!588559)))

(declare-fun b!1039760 () Bool)

(assert (=> b!1039760 (= e!588560 call!44000)))

(declare-fun b!1039761 () Bool)

(declare-fun e!588561 () Bool)

(assert (=> b!1039761 (= e!588561 call!44000)))

(declare-fun b!1039762 () Bool)

(assert (=> b!1039762 (= e!588560 e!588561)))

(declare-fun lt!458103 () (_ BitVec 64))

(assert (=> b!1039762 (= lt!458103 (select (arr!31512 lt!458052) #b00000000000000000000000000000000))))

(declare-fun lt!458102 () Unit!33883)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65487 (_ BitVec 64) (_ BitVec 32)) Unit!33883)

(assert (=> b!1039762 (= lt!458102 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458052 lt!458103 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1039762 (arrayContainsKey!0 lt!458052 lt!458103 #b00000000000000000000000000000000)))

(declare-fun lt!458104 () Unit!33883)

(assert (=> b!1039762 (= lt!458104 lt!458102)))

(declare-fun res!693354 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65487 (_ BitVec 32)) SeekEntryResult!9783)

(assert (=> b!1039762 (= res!693354 (= (seekEntryOrOpen!0 (select (arr!31512 lt!458052) #b00000000000000000000000000000000) lt!458052 (mask!30301 thiss!1427)) (Found!9783 #b00000000000000000000000000000000)))))

(assert (=> b!1039762 (=> (not res!693354) (not e!588561))))

(assert (= (and d!125419 (not res!693353)) b!1039759))

(assert (= (and b!1039759 c!105369) b!1039762))

(assert (= (and b!1039759 (not c!105369)) b!1039760))

(assert (= (and b!1039762 res!693354) b!1039761))

(assert (= (or b!1039761 b!1039760) bm!43997))

(assert (=> b!1039759 m!958903))

(assert (=> b!1039759 m!958903))

(assert (=> b!1039759 m!958905))

(declare-fun m!958937 () Bool)

(assert (=> bm!43997 m!958937))

(assert (=> b!1039762 m!958903))

(declare-fun m!958939 () Bool)

(assert (=> b!1039762 m!958939))

(declare-fun m!958941 () Bool)

(assert (=> b!1039762 m!958941))

(assert (=> b!1039762 m!958903))

(declare-fun m!958943 () Bool)

(assert (=> b!1039762 m!958943))

(assert (=> b!1039662 d!125419))

(declare-fun b!1039763 () Bool)

(declare-fun e!588563 () (_ BitVec 32))

(declare-fun e!588562 () (_ BitVec 32))

(assert (=> b!1039763 (= e!588563 e!588562)))

(declare-fun c!105370 () Bool)

(assert (=> b!1039763 (= c!105370 (validKeyInArray!0 (select (arr!31512 lt!458052) #b00000000000000000000000000000000)))))

(declare-fun b!1039764 () Bool)

(declare-fun call!44001 () (_ BitVec 32))

(assert (=> b!1039764 (= e!588562 (bvadd #b00000000000000000000000000000001 call!44001))))

(declare-fun b!1039765 () Bool)

(assert (=> b!1039765 (= e!588563 #b00000000000000000000000000000000)))

(declare-fun b!1039766 () Bool)

(assert (=> b!1039766 (= e!588562 call!44001)))

(declare-fun bm!43998 () Bool)

(assert (=> bm!43998 (= call!44001 (arrayCountValidKeys!0 lt!458052 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32045 (_keys!11540 thiss!1427))))))

(declare-fun d!125421 () Bool)

(declare-fun lt!458105 () (_ BitVec 32))

(assert (=> d!125421 (and (bvsge lt!458105 #b00000000000000000000000000000000) (bvsle lt!458105 (bvsub (size!32045 lt!458052) #b00000000000000000000000000000000)))))

(assert (=> d!125421 (= lt!458105 e!588563)))

(declare-fun c!105371 () Bool)

(assert (=> d!125421 (= c!105371 (bvsge #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))))))

(assert (=> d!125421 (and (bvsle #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32045 (_keys!11540 thiss!1427)) (size!32045 lt!458052)))))

(assert (=> d!125421 (= (arrayCountValidKeys!0 lt!458052 #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))) lt!458105)))

(assert (= (and d!125421 c!105371) b!1039765))

(assert (= (and d!125421 (not c!105371)) b!1039763))

(assert (= (and b!1039763 c!105370) b!1039764))

(assert (= (and b!1039763 (not c!105370)) b!1039766))

(assert (= (or b!1039764 b!1039766) bm!43998))

(assert (=> b!1039763 m!958903))

(assert (=> b!1039763 m!958903))

(assert (=> b!1039763 m!958905))

(declare-fun m!958945 () Bool)

(assert (=> bm!43998 m!958945))

(assert (=> b!1039662 d!125421))

(declare-fun b!1039779 () Bool)

(declare-fun c!105380 () Bool)

(declare-fun lt!458117 () (_ BitVec 64))

(assert (=> b!1039779 (= c!105380 (= lt!458117 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588571 () SeekEntryResult!9783)

(declare-fun e!588570 () SeekEntryResult!9783)

(assert (=> b!1039779 (= e!588571 e!588570)))

(declare-fun b!1039780 () Bool)

(declare-fun e!588572 () SeekEntryResult!9783)

(assert (=> b!1039780 (= e!588572 e!588571)))

(declare-fun lt!458116 () SeekEntryResult!9783)

(assert (=> b!1039780 (= lt!458117 (select (arr!31512 (_keys!11540 thiss!1427)) (index!41505 lt!458116)))))

(declare-fun c!105379 () Bool)

(assert (=> b!1039780 (= c!105379 (= lt!458117 key!909))))

(declare-fun d!125423 () Bool)

(declare-fun lt!458114 () SeekEntryResult!9783)

(assert (=> d!125423 (and (or ((_ is MissingVacant!9783) lt!458114) (not ((_ is Found!9783) lt!458114)) (and (bvsge (index!41504 lt!458114) #b00000000000000000000000000000000) (bvslt (index!41504 lt!458114) (size!32045 (_keys!11540 thiss!1427))))) (not ((_ is MissingVacant!9783) lt!458114)) (or (not ((_ is Found!9783) lt!458114)) (= (select (arr!31512 (_keys!11540 thiss!1427)) (index!41504 lt!458114)) key!909)))))

(assert (=> d!125423 (= lt!458114 e!588572)))

(declare-fun c!105378 () Bool)

(assert (=> d!125423 (= c!105378 (and ((_ is Intermediate!9783) lt!458116) (undefined!10595 lt!458116)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65487 (_ BitVec 32)) SeekEntryResult!9783)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125423 (= lt!458116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30301 thiss!1427)) key!909 (_keys!11540 thiss!1427) (mask!30301 thiss!1427)))))

(assert (=> d!125423 (validMask!0 (mask!30301 thiss!1427))))

(assert (=> d!125423 (= (seekEntry!0 key!909 (_keys!11540 thiss!1427) (mask!30301 thiss!1427)) lt!458114)))

(declare-fun b!1039781 () Bool)

(assert (=> b!1039781 (= e!588572 Undefined!9783)))

(declare-fun b!1039782 () Bool)

(assert (=> b!1039782 (= e!588570 (MissingZero!9783 (index!41505 lt!458116)))))

(declare-fun b!1039783 () Bool)

(assert (=> b!1039783 (= e!588571 (Found!9783 (index!41505 lt!458116)))))

(declare-fun b!1039784 () Bool)

(declare-fun lt!458115 () SeekEntryResult!9783)

(assert (=> b!1039784 (= e!588570 (ite ((_ is MissingVacant!9783) lt!458115) (MissingZero!9783 (index!41506 lt!458115)) lt!458115))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65487 (_ BitVec 32)) SeekEntryResult!9783)

(assert (=> b!1039784 (= lt!458115 (seekKeyOrZeroReturnVacant!0 (x!92804 lt!458116) (index!41505 lt!458116) (index!41505 lt!458116) key!909 (_keys!11540 thiss!1427) (mask!30301 thiss!1427)))))

(assert (= (and d!125423 c!105378) b!1039781))

(assert (= (and d!125423 (not c!105378)) b!1039780))

(assert (= (and b!1039780 c!105379) b!1039783))

(assert (= (and b!1039780 (not c!105379)) b!1039779))

(assert (= (and b!1039779 c!105380) b!1039782))

(assert (= (and b!1039779 (not c!105380)) b!1039784))

(declare-fun m!958947 () Bool)

(assert (=> b!1039780 m!958947))

(declare-fun m!958949 () Bool)

(assert (=> d!125423 m!958949))

(declare-fun m!958951 () Bool)

(assert (=> d!125423 m!958951))

(assert (=> d!125423 m!958951))

(declare-fun m!958953 () Bool)

(assert (=> d!125423 m!958953))

(assert (=> d!125423 m!958913))

(declare-fun m!958955 () Bool)

(assert (=> b!1039784 m!958955))

(assert (=> b!1039659 d!125423))

(declare-fun d!125425 () Bool)

(assert (=> d!125425 (= (array_inv!24363 (_keys!11540 thiss!1427)) (bvsge (size!32045 (_keys!11540 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039658 d!125425))

(declare-fun d!125427 () Bool)

(assert (=> d!125427 (= (array_inv!24364 (_values!6353 thiss!1427)) (bvsge (size!32046 (_values!6353 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039658 d!125427))

(declare-fun d!125429 () Bool)

(declare-fun res!693361 () Bool)

(declare-fun e!588575 () Bool)

(assert (=> d!125429 (=> (not res!693361) (not e!588575))))

(declare-fun simpleValid!430 (LongMapFixedSize!5896) Bool)

(assert (=> d!125429 (= res!693361 (simpleValid!430 thiss!1427))))

(assert (=> d!125429 (= (valid!2206 thiss!1427) e!588575)))

(declare-fun b!1039791 () Bool)

(declare-fun res!693362 () Bool)

(assert (=> b!1039791 (=> (not res!693362) (not e!588575))))

(assert (=> b!1039791 (= res!693362 (= (arrayCountValidKeys!0 (_keys!11540 thiss!1427) #b00000000000000000000000000000000 (size!32045 (_keys!11540 thiss!1427))) (_size!3003 thiss!1427)))))

(declare-fun b!1039792 () Bool)

(declare-fun res!693363 () Bool)

(assert (=> b!1039792 (=> (not res!693363) (not e!588575))))

(assert (=> b!1039792 (= res!693363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11540 thiss!1427) (mask!30301 thiss!1427)))))

(declare-fun b!1039793 () Bool)

(assert (=> b!1039793 (= e!588575 (arrayNoDuplicates!0 (_keys!11540 thiss!1427) #b00000000000000000000000000000000 Nil!21983))))

(assert (= (and d!125429 res!693361) b!1039791))

(assert (= (and b!1039791 res!693362) b!1039792))

(assert (= (and b!1039792 res!693363) b!1039793))

(declare-fun m!958957 () Bool)

(assert (=> d!125429 m!958957))

(assert (=> b!1039791 m!958833))

(declare-fun m!958959 () Bool)

(assert (=> b!1039792 m!958959))

(declare-fun m!958961 () Bool)

(assert (=> b!1039793 m!958961))

(assert (=> start!91060 d!125429))

(declare-fun mapNonEmpty!38641 () Bool)

(declare-fun mapRes!38641 () Bool)

(declare-fun tp!74168 () Bool)

(declare-fun e!588581 () Bool)

(assert (=> mapNonEmpty!38641 (= mapRes!38641 (and tp!74168 e!588581))))

(declare-fun mapKey!38641 () (_ BitVec 32))

(declare-fun mapRest!38641 () (Array (_ BitVec 32) ValueCell!11651))

(declare-fun mapValue!38641 () ValueCell!11651)

(assert (=> mapNonEmpty!38641 (= mapRest!38632 (store mapRest!38641 mapKey!38641 mapValue!38641))))

(declare-fun b!1039800 () Bool)

(assert (=> b!1039800 (= e!588581 tp_is_empty!24709)))

(declare-fun mapIsEmpty!38641 () Bool)

(assert (=> mapIsEmpty!38641 mapRes!38641))

(declare-fun condMapEmpty!38641 () Bool)

(declare-fun mapDefault!38641 () ValueCell!11651)

(assert (=> mapNonEmpty!38632 (= condMapEmpty!38641 (= mapRest!38632 ((as const (Array (_ BitVec 32) ValueCell!11651)) mapDefault!38641)))))

(declare-fun e!588580 () Bool)

(assert (=> mapNonEmpty!38632 (= tp!74153 (and e!588580 mapRes!38641))))

(declare-fun b!1039801 () Bool)

(assert (=> b!1039801 (= e!588580 tp_is_empty!24709)))

(assert (= (and mapNonEmpty!38632 condMapEmpty!38641) mapIsEmpty!38641))

(assert (= (and mapNonEmpty!38632 (not condMapEmpty!38641)) mapNonEmpty!38641))

(assert (= (and mapNonEmpty!38641 ((_ is ValueCellFull!11651) mapValue!38641)) b!1039800))

(assert (= (and mapNonEmpty!38632 ((_ is ValueCellFull!11651) mapDefault!38641)) b!1039801))

(declare-fun m!958963 () Bool)

(assert (=> mapNonEmpty!38641 m!958963))

(check-sat (not b!1039733) (not d!125415) (not b!1039793) (not b!1039720) (not d!125411) (not bm!43998) (not bm!43994) (not d!125423) b_and!33495 (not b!1039791) (not bm!43997) (not b!1039716) (not b!1039784) (not b!1039759) (not d!125413) (not b!1039732) (not mapNonEmpty!38641) (not b!1039763) (not b!1039738) (not b!1039723) tp_is_empty!24709 (not b!1039747) (not b!1039762) (not bm!43991) (not d!125429) (not b!1039717) (not b_next!20989) (not b!1039735) (not b!1039792))
(check-sat b_and!33495 (not b_next!20989))
