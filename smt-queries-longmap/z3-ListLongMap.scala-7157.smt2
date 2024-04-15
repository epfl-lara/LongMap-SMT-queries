; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91086 () Bool)

(assert start!91086)

(declare-fun b!1039819 () Bool)

(declare-fun b_free!20995 () Bool)

(declare-fun b_next!20995 () Bool)

(assert (=> b!1039819 (= b_free!20995 (not b_next!20995))))

(declare-fun tp!74174 () Bool)

(declare-fun b_and!33501 () Bool)

(assert (=> b!1039819 (= tp!74174 b_and!33501)))

(declare-fun mapIsEmpty!38644 () Bool)

(declare-fun mapRes!38644 () Bool)

(assert (=> mapIsEmpty!38644 mapRes!38644))

(declare-fun b!1039816 () Bool)

(declare-fun res!693370 () Bool)

(declare-fun e!588598 () Bool)

(assert (=> b!1039816 (=> (not res!693370) (not e!588598))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039816 (= res!693370 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039817 () Bool)

(declare-fun e!588599 () Bool)

(declare-fun tp_is_empty!24715 () Bool)

(assert (=> b!1039817 (= e!588599 tp_is_empty!24715)))

(declare-fun mapNonEmpty!38644 () Bool)

(declare-fun tp!74173 () Bool)

(assert (=> mapNonEmpty!38644 (= mapRes!38644 (and tp!74173 e!588599))))

(declare-datatypes ((V!37827 0))(
  ( (V!37828 (val!12408 Int)) )
))
(declare-datatypes ((ValueCell!11654 0))(
  ( (ValueCellFull!11654 (v!14994 V!37827)) (EmptyCell!11654) )
))
(declare-fun mapRest!38644 () (Array (_ BitVec 32) ValueCell!11654))

(declare-fun mapValue!38644 () ValueCell!11654)

(declare-fun mapKey!38644 () (_ BitVec 32))

(declare-datatypes ((array!65501 0))(
  ( (array!65502 (arr!31518 (Array (_ BitVec 32) (_ BitVec 64))) (size!32051 (_ BitVec 32))) )
))
(declare-datatypes ((array!65503 0))(
  ( (array!65504 (arr!31519 (Array (_ BitVec 32) ValueCell!11654)) (size!32052 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5902 0))(
  ( (LongMapFixedSize!5903 (defaultEntry!6333 Int) (mask!30309 (_ BitVec 32)) (extraKeys!6061 (_ BitVec 32)) (zeroValue!6167 V!37827) (minValue!6167 V!37827) (_size!3006 (_ BitVec 32)) (_keys!11545 array!65501) (_values!6356 array!65503) (_vacant!3006 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5902)

(assert (=> mapNonEmpty!38644 (= (arr!31519 (_values!6356 thiss!1427)) (store mapRest!38644 mapKey!38644 mapValue!38644))))

(declare-fun b!1039818 () Bool)

(declare-fun e!588596 () Bool)

(declare-datatypes ((SeekEntryResult!9785 0))(
  ( (MissingZero!9785 (index!41511 (_ BitVec 32))) (Found!9785 (index!41512 (_ BitVec 32))) (Intermediate!9785 (undefined!10597 Bool) (index!41513 (_ BitVec 32)) (x!92822 (_ BitVec 32))) (Undefined!9785) (MissingVacant!9785 (index!41514 (_ BitVec 32))) )
))
(declare-fun lt!458130 () SeekEntryResult!9785)

(assert (=> b!1039818 (= e!588596 (not (or (bvslt (index!41512 lt!458130) #b00000000000000000000000000000000) (bvsge (index!41512 lt!458130) (size!32051 (_keys!11545 thiss!1427))) (bvslt (size!32051 (_keys!11545 thiss!1427)) #b01111111111111111111111111111111))))))

(declare-fun lt!458128 () array!65501)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65501 (_ BitVec 32)) Bool)

(assert (=> b!1039818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458128 (mask!30309 thiss!1427))))

(declare-datatypes ((Unit!33887 0))(
  ( (Unit!33888) )
))
(declare-fun lt!458129 () Unit!33887)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65501 (_ BitVec 32) (_ BitVec 32)) Unit!33887)

(assert (=> b!1039818 (= lt!458129 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11545 thiss!1427) (index!41512 lt!458130) (mask!30309 thiss!1427)))))

(declare-datatypes ((List!21988 0))(
  ( (Nil!21985) (Cons!21984 (h!23188 (_ BitVec 64)) (t!31193 List!21988)) )
))
(declare-fun arrayNoDuplicates!0 (array!65501 (_ BitVec 32) List!21988) Bool)

(assert (=> b!1039818 (arrayNoDuplicates!0 lt!458128 #b00000000000000000000000000000000 Nil!21985)))

(declare-fun lt!458131 () Unit!33887)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65501 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21988) Unit!33887)

(assert (=> b!1039818 (= lt!458131 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11545 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41512 lt!458130) #b00000000000000000000000000000000 Nil!21985))))

(declare-fun arrayCountValidKeys!0 (array!65501 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039818 (= (arrayCountValidKeys!0 lt!458128 #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039818 (= lt!458128 (array!65502 (store (arr!31518 (_keys!11545 thiss!1427)) (index!41512 lt!458130) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32051 (_keys!11545 thiss!1427))))))

(declare-fun lt!458132 () Unit!33887)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65501 (_ BitVec 32) (_ BitVec 64)) Unit!33887)

(assert (=> b!1039818 (= lt!458132 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11545 thiss!1427) (index!41512 lt!458130) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588601 () Bool)

(declare-fun e!588597 () Bool)

(declare-fun array_inv!24365 (array!65501) Bool)

(declare-fun array_inv!24366 (array!65503) Bool)

(assert (=> b!1039819 (= e!588597 (and tp!74174 tp_is_empty!24715 (array_inv!24365 (_keys!11545 thiss!1427)) (array_inv!24366 (_values!6356 thiss!1427)) e!588601))))

(declare-fun b!1039820 () Bool)

(assert (=> b!1039820 (= e!588598 e!588596)))

(declare-fun res!693371 () Bool)

(assert (=> b!1039820 (=> (not res!693371) (not e!588596))))

(get-info :version)

(assert (=> b!1039820 (= res!693371 ((_ is Found!9785) lt!458130))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65501 (_ BitVec 32)) SeekEntryResult!9785)

(assert (=> b!1039820 (= lt!458130 (seekEntry!0 key!909 (_keys!11545 thiss!1427) (mask!30309 thiss!1427)))))

(declare-fun b!1039821 () Bool)

(declare-fun e!588600 () Bool)

(assert (=> b!1039821 (= e!588600 tp_is_empty!24715)))

(declare-fun res!693372 () Bool)

(assert (=> start!91086 (=> (not res!693372) (not e!588598))))

(declare-fun valid!2208 (LongMapFixedSize!5902) Bool)

(assert (=> start!91086 (= res!693372 (valid!2208 thiss!1427))))

(assert (=> start!91086 e!588598))

(assert (=> start!91086 e!588597))

(assert (=> start!91086 true))

(declare-fun b!1039822 () Bool)

(assert (=> b!1039822 (= e!588601 (and e!588600 mapRes!38644))))

(declare-fun condMapEmpty!38644 () Bool)

(declare-fun mapDefault!38644 () ValueCell!11654)

(assert (=> b!1039822 (= condMapEmpty!38644 (= (arr!31519 (_values!6356 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11654)) mapDefault!38644)))))

(assert (= (and start!91086 res!693372) b!1039816))

(assert (= (and b!1039816 res!693370) b!1039820))

(assert (= (and b!1039820 res!693371) b!1039818))

(assert (= (and b!1039822 condMapEmpty!38644) mapIsEmpty!38644))

(assert (= (and b!1039822 (not condMapEmpty!38644)) mapNonEmpty!38644))

(assert (= (and mapNonEmpty!38644 ((_ is ValueCellFull!11654) mapValue!38644)) b!1039817))

(assert (= (and b!1039822 ((_ is ValueCellFull!11654) mapDefault!38644)) b!1039821))

(assert (= b!1039819 b!1039822))

(assert (= start!91086 b!1039819))

(declare-fun m!958965 () Bool)

(assert (=> b!1039819 m!958965))

(declare-fun m!958967 () Bool)

(assert (=> b!1039819 m!958967))

(declare-fun m!958969 () Bool)

(assert (=> b!1039818 m!958969))

(declare-fun m!958971 () Bool)

(assert (=> b!1039818 m!958971))

(declare-fun m!958973 () Bool)

(assert (=> b!1039818 m!958973))

(declare-fun m!958975 () Bool)

(assert (=> b!1039818 m!958975))

(declare-fun m!958977 () Bool)

(assert (=> b!1039818 m!958977))

(declare-fun m!958979 () Bool)

(assert (=> b!1039818 m!958979))

(declare-fun m!958981 () Bool)

(assert (=> b!1039818 m!958981))

(declare-fun m!958983 () Bool)

(assert (=> b!1039818 m!958983))

(declare-fun m!958985 () Bool)

(assert (=> b!1039820 m!958985))

(declare-fun m!958987 () Bool)

(assert (=> start!91086 m!958987))

(declare-fun m!958989 () Bool)

(assert (=> mapNonEmpty!38644 m!958989))

(check-sat tp_is_empty!24715 (not b!1039819) (not b!1039818) (not start!91086) (not mapNonEmpty!38644) (not b_next!20995) (not b!1039820) b_and!33501)
(check-sat b_and!33501 (not b_next!20995))
(get-model)

(declare-fun b!1039878 () Bool)

(declare-fun c!105387 () Bool)

(declare-fun lt!458174 () (_ BitVec 64))

(assert (=> b!1039878 (= c!105387 (= lt!458174 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588651 () SeekEntryResult!9785)

(declare-fun e!588653 () SeekEntryResult!9785)

(assert (=> b!1039878 (= e!588651 e!588653)))

(declare-fun b!1039879 () Bool)

(declare-fun lt!458171 () SeekEntryResult!9785)

(assert (=> b!1039879 (= e!588651 (Found!9785 (index!41513 lt!458171)))))

(declare-fun b!1039880 () Bool)

(declare-fun e!588652 () SeekEntryResult!9785)

(assert (=> b!1039880 (= e!588652 e!588651)))

(assert (=> b!1039880 (= lt!458174 (select (arr!31518 (_keys!11545 thiss!1427)) (index!41513 lt!458171)))))

(declare-fun c!105389 () Bool)

(assert (=> b!1039880 (= c!105389 (= lt!458174 key!909))))

(declare-fun b!1039881 () Bool)

(assert (=> b!1039881 (= e!588652 Undefined!9785)))

(declare-fun b!1039882 () Bool)

(assert (=> b!1039882 (= e!588653 (MissingZero!9785 (index!41513 lt!458171)))))

(declare-fun d!125433 () Bool)

(declare-fun lt!458173 () SeekEntryResult!9785)

(assert (=> d!125433 (and (or ((_ is MissingVacant!9785) lt!458173) (not ((_ is Found!9785) lt!458173)) (and (bvsge (index!41512 lt!458173) #b00000000000000000000000000000000) (bvslt (index!41512 lt!458173) (size!32051 (_keys!11545 thiss!1427))))) (not ((_ is MissingVacant!9785) lt!458173)) (or (not ((_ is Found!9785) lt!458173)) (= (select (arr!31518 (_keys!11545 thiss!1427)) (index!41512 lt!458173)) key!909)))))

(assert (=> d!125433 (= lt!458173 e!588652)))

(declare-fun c!105388 () Bool)

(assert (=> d!125433 (= c!105388 (and ((_ is Intermediate!9785) lt!458171) (undefined!10597 lt!458171)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65501 (_ BitVec 32)) SeekEntryResult!9785)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125433 (= lt!458171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30309 thiss!1427)) key!909 (_keys!11545 thiss!1427) (mask!30309 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125433 (validMask!0 (mask!30309 thiss!1427))))

(assert (=> d!125433 (= (seekEntry!0 key!909 (_keys!11545 thiss!1427) (mask!30309 thiss!1427)) lt!458173)))

(declare-fun b!1039877 () Bool)

(declare-fun lt!458172 () SeekEntryResult!9785)

(assert (=> b!1039877 (= e!588653 (ite ((_ is MissingVacant!9785) lt!458172) (MissingZero!9785 (index!41514 lt!458172)) lt!458172))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65501 (_ BitVec 32)) SeekEntryResult!9785)

(assert (=> b!1039877 (= lt!458172 (seekKeyOrZeroReturnVacant!0 (x!92822 lt!458171) (index!41513 lt!458171) (index!41513 lt!458171) key!909 (_keys!11545 thiss!1427) (mask!30309 thiss!1427)))))

(assert (= (and d!125433 c!105388) b!1039881))

(assert (= (and d!125433 (not c!105388)) b!1039880))

(assert (= (and b!1039880 c!105389) b!1039879))

(assert (= (and b!1039880 (not c!105389)) b!1039878))

(assert (= (and b!1039878 c!105387) b!1039882))

(assert (= (and b!1039878 (not c!105387)) b!1039877))

(declare-fun m!959043 () Bool)

(assert (=> b!1039880 m!959043))

(declare-fun m!959045 () Bool)

(assert (=> d!125433 m!959045))

(declare-fun m!959047 () Bool)

(assert (=> d!125433 m!959047))

(assert (=> d!125433 m!959047))

(declare-fun m!959049 () Bool)

(assert (=> d!125433 m!959049))

(declare-fun m!959051 () Bool)

(assert (=> d!125433 m!959051))

(declare-fun m!959053 () Bool)

(assert (=> b!1039877 m!959053))

(assert (=> b!1039820 d!125433))

(declare-fun d!125435 () Bool)

(declare-fun res!693397 () Bool)

(declare-fun e!588656 () Bool)

(assert (=> d!125435 (=> (not res!693397) (not e!588656))))

(declare-fun simpleValid!431 (LongMapFixedSize!5902) Bool)

(assert (=> d!125435 (= res!693397 (simpleValid!431 thiss!1427))))

(assert (=> d!125435 (= (valid!2208 thiss!1427) e!588656)))

(declare-fun b!1039889 () Bool)

(declare-fun res!693398 () Bool)

(assert (=> b!1039889 (=> (not res!693398) (not e!588656))))

(assert (=> b!1039889 (= res!693398 (= (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))) (_size!3006 thiss!1427)))))

(declare-fun b!1039890 () Bool)

(declare-fun res!693399 () Bool)

(assert (=> b!1039890 (=> (not res!693399) (not e!588656))))

(assert (=> b!1039890 (= res!693399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11545 thiss!1427) (mask!30309 thiss!1427)))))

(declare-fun b!1039891 () Bool)

(assert (=> b!1039891 (= e!588656 (arrayNoDuplicates!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 Nil!21985))))

(assert (= (and d!125435 res!693397) b!1039889))

(assert (= (and b!1039889 res!693398) b!1039890))

(assert (= (and b!1039890 res!693399) b!1039891))

(declare-fun m!959055 () Bool)

(assert (=> d!125435 m!959055))

(assert (=> b!1039889 m!958975))

(declare-fun m!959057 () Bool)

(assert (=> b!1039890 m!959057))

(declare-fun m!959059 () Bool)

(assert (=> b!1039891 m!959059))

(assert (=> start!91086 d!125435))

(declare-fun b!1039902 () Bool)

(declare-fun e!588668 () Bool)

(declare-fun e!588667 () Bool)

(assert (=> b!1039902 (= e!588668 e!588667)))

(declare-fun c!105392 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039902 (= c!105392 (validKeyInArray!0 (select (arr!31518 lt!458128) #b00000000000000000000000000000000)))))

(declare-fun bm!44001 () Bool)

(declare-fun call!44004 () Bool)

(assert (=> bm!44001 (= call!44004 (arrayNoDuplicates!0 lt!458128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105392 (Cons!21984 (select (arr!31518 lt!458128) #b00000000000000000000000000000000) Nil!21985) Nil!21985)))))

(declare-fun b!1039903 () Bool)

(declare-fun e!588666 () Bool)

(declare-fun contains!6027 (List!21988 (_ BitVec 64)) Bool)

(assert (=> b!1039903 (= e!588666 (contains!6027 Nil!21985 (select (arr!31518 lt!458128) #b00000000000000000000000000000000)))))

(declare-fun d!125437 () Bool)

(declare-fun res!693408 () Bool)

(declare-fun e!588665 () Bool)

(assert (=> d!125437 (=> res!693408 e!588665)))

(assert (=> d!125437 (= res!693408 (bvsge #b00000000000000000000000000000000 (size!32051 lt!458128)))))

(assert (=> d!125437 (= (arrayNoDuplicates!0 lt!458128 #b00000000000000000000000000000000 Nil!21985) e!588665)))

(declare-fun b!1039904 () Bool)

(assert (=> b!1039904 (= e!588665 e!588668)))

(declare-fun res!693407 () Bool)

(assert (=> b!1039904 (=> (not res!693407) (not e!588668))))

(assert (=> b!1039904 (= res!693407 (not e!588666))))

(declare-fun res!693406 () Bool)

(assert (=> b!1039904 (=> (not res!693406) (not e!588666))))

(assert (=> b!1039904 (= res!693406 (validKeyInArray!0 (select (arr!31518 lt!458128) #b00000000000000000000000000000000)))))

(declare-fun b!1039905 () Bool)

(assert (=> b!1039905 (= e!588667 call!44004)))

(declare-fun b!1039906 () Bool)

(assert (=> b!1039906 (= e!588667 call!44004)))

(assert (= (and d!125437 (not res!693408)) b!1039904))

(assert (= (and b!1039904 res!693406) b!1039903))

(assert (= (and b!1039904 res!693407) b!1039902))

(assert (= (and b!1039902 c!105392) b!1039905))

(assert (= (and b!1039902 (not c!105392)) b!1039906))

(assert (= (or b!1039905 b!1039906) bm!44001))

(declare-fun m!959061 () Bool)

(assert (=> b!1039902 m!959061))

(assert (=> b!1039902 m!959061))

(declare-fun m!959063 () Bool)

(assert (=> b!1039902 m!959063))

(assert (=> bm!44001 m!959061))

(declare-fun m!959065 () Bool)

(assert (=> bm!44001 m!959065))

(assert (=> b!1039903 m!959061))

(assert (=> b!1039903 m!959061))

(declare-fun m!959067 () Bool)

(assert (=> b!1039903 m!959067))

(assert (=> b!1039904 m!959061))

(assert (=> b!1039904 m!959061))

(assert (=> b!1039904 m!959063))

(assert (=> b!1039818 d!125437))

(declare-fun b!1039915 () Bool)

(declare-fun e!588675 () Bool)

(declare-fun call!44007 () Bool)

(assert (=> b!1039915 (= e!588675 call!44007)))

(declare-fun d!125439 () Bool)

(declare-fun res!693414 () Bool)

(declare-fun e!588677 () Bool)

(assert (=> d!125439 (=> res!693414 e!588677)))

(assert (=> d!125439 (= res!693414 (bvsge #b00000000000000000000000000000000 (size!32051 lt!458128)))))

(assert (=> d!125439 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458128 (mask!30309 thiss!1427)) e!588677)))

(declare-fun b!1039916 () Bool)

(declare-fun e!588676 () Bool)

(assert (=> b!1039916 (= e!588677 e!588676)))

(declare-fun c!105395 () Bool)

(assert (=> b!1039916 (= c!105395 (validKeyInArray!0 (select (arr!31518 lt!458128) #b00000000000000000000000000000000)))))

(declare-fun b!1039917 () Bool)

(assert (=> b!1039917 (= e!588676 call!44007)))

(declare-fun bm!44004 () Bool)

(assert (=> bm!44004 (= call!44007 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458128 (mask!30309 thiss!1427)))))

(declare-fun b!1039918 () Bool)

(assert (=> b!1039918 (= e!588676 e!588675)))

(declare-fun lt!458181 () (_ BitVec 64))

(assert (=> b!1039918 (= lt!458181 (select (arr!31518 lt!458128) #b00000000000000000000000000000000))))

(declare-fun lt!458182 () Unit!33887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65501 (_ BitVec 64) (_ BitVec 32)) Unit!33887)

(assert (=> b!1039918 (= lt!458182 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458128 lt!458181 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1039918 (arrayContainsKey!0 lt!458128 lt!458181 #b00000000000000000000000000000000)))

(declare-fun lt!458183 () Unit!33887)

(assert (=> b!1039918 (= lt!458183 lt!458182)))

(declare-fun res!693413 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65501 (_ BitVec 32)) SeekEntryResult!9785)

(assert (=> b!1039918 (= res!693413 (= (seekEntryOrOpen!0 (select (arr!31518 lt!458128) #b00000000000000000000000000000000) lt!458128 (mask!30309 thiss!1427)) (Found!9785 #b00000000000000000000000000000000)))))

(assert (=> b!1039918 (=> (not res!693413) (not e!588675))))

(assert (= (and d!125439 (not res!693414)) b!1039916))

(assert (= (and b!1039916 c!105395) b!1039918))

(assert (= (and b!1039916 (not c!105395)) b!1039917))

(assert (= (and b!1039918 res!693413) b!1039915))

(assert (= (or b!1039915 b!1039917) bm!44004))

(assert (=> b!1039916 m!959061))

(assert (=> b!1039916 m!959061))

(assert (=> b!1039916 m!959063))

(declare-fun m!959069 () Bool)

(assert (=> bm!44004 m!959069))

(assert (=> b!1039918 m!959061))

(declare-fun m!959071 () Bool)

(assert (=> b!1039918 m!959071))

(declare-fun m!959073 () Bool)

(assert (=> b!1039918 m!959073))

(assert (=> b!1039918 m!959061))

(declare-fun m!959075 () Bool)

(assert (=> b!1039918 m!959075))

(assert (=> b!1039818 d!125439))

(declare-fun bm!44007 () Bool)

(declare-fun call!44010 () (_ BitVec 32))

(assert (=> bm!44007 (= call!44010 (arrayCountValidKeys!0 lt!458128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32051 (_keys!11545 thiss!1427))))))

(declare-fun b!1039927 () Bool)

(declare-fun e!588682 () (_ BitVec 32))

(assert (=> b!1039927 (= e!588682 (bvadd #b00000000000000000000000000000001 call!44010))))

(declare-fun b!1039929 () Bool)

(declare-fun e!588683 () (_ BitVec 32))

(assert (=> b!1039929 (= e!588683 e!588682)))

(declare-fun c!105401 () Bool)

(assert (=> b!1039929 (= c!105401 (validKeyInArray!0 (select (arr!31518 lt!458128) #b00000000000000000000000000000000)))))

(declare-fun b!1039930 () Bool)

(assert (=> b!1039930 (= e!588683 #b00000000000000000000000000000000)))

(declare-fun b!1039928 () Bool)

(assert (=> b!1039928 (= e!588682 call!44010)))

(declare-fun d!125441 () Bool)

(declare-fun lt!458186 () (_ BitVec 32))

(assert (=> d!125441 (and (bvsge lt!458186 #b00000000000000000000000000000000) (bvsle lt!458186 (bvsub (size!32051 lt!458128) #b00000000000000000000000000000000)))))

(assert (=> d!125441 (= lt!458186 e!588683)))

(declare-fun c!105400 () Bool)

(assert (=> d!125441 (= c!105400 (bvsge #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))))))

(assert (=> d!125441 (and (bvsle #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32051 (_keys!11545 thiss!1427)) (size!32051 lt!458128)))))

(assert (=> d!125441 (= (arrayCountValidKeys!0 lt!458128 #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))) lt!458186)))

(assert (= (and d!125441 c!105400) b!1039930))

(assert (= (and d!125441 (not c!105400)) b!1039929))

(assert (= (and b!1039929 c!105401) b!1039927))

(assert (= (and b!1039929 (not c!105401)) b!1039928))

(assert (= (or b!1039927 b!1039928) bm!44007))

(declare-fun m!959077 () Bool)

(assert (=> bm!44007 m!959077))

(assert (=> b!1039929 m!959061))

(assert (=> b!1039929 m!959061))

(assert (=> b!1039929 m!959063))

(assert (=> b!1039818 d!125441))

(declare-fun d!125443 () Bool)

(declare-fun e!588686 () Bool)

(assert (=> d!125443 e!588686))

(declare-fun res!693417 () Bool)

(assert (=> d!125443 (=> (not res!693417) (not e!588686))))

(assert (=> d!125443 (= res!693417 (and (bvsge (index!41512 lt!458130) #b00000000000000000000000000000000) (bvslt (index!41512 lt!458130) (size!32051 (_keys!11545 thiss!1427)))))))

(declare-fun lt!458189 () Unit!33887)

(declare-fun choose!53 (array!65501 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21988) Unit!33887)

(assert (=> d!125443 (= lt!458189 (choose!53 (_keys!11545 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41512 lt!458130) #b00000000000000000000000000000000 Nil!21985))))

(assert (=> d!125443 (bvslt (size!32051 (_keys!11545 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125443 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11545 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41512 lt!458130) #b00000000000000000000000000000000 Nil!21985) lt!458189)))

(declare-fun b!1039933 () Bool)

(assert (=> b!1039933 (= e!588686 (arrayNoDuplicates!0 (array!65502 (store (arr!31518 (_keys!11545 thiss!1427)) (index!41512 lt!458130) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32051 (_keys!11545 thiss!1427))) #b00000000000000000000000000000000 Nil!21985))))

(assert (= (and d!125443 res!693417) b!1039933))

(declare-fun m!959079 () Bool)

(assert (=> d!125443 m!959079))

(assert (=> b!1039933 m!958981))

(declare-fun m!959081 () Bool)

(assert (=> b!1039933 m!959081))

(assert (=> b!1039818 d!125443))

(declare-fun d!125445 () Bool)

(declare-fun e!588689 () Bool)

(assert (=> d!125445 e!588689))

(declare-fun res!693420 () Bool)

(assert (=> d!125445 (=> (not res!693420) (not e!588689))))

(assert (=> d!125445 (= res!693420 (and (bvsge (index!41512 lt!458130) #b00000000000000000000000000000000) (bvslt (index!41512 lt!458130) (size!32051 (_keys!11545 thiss!1427)))))))

(declare-fun lt!458192 () Unit!33887)

(declare-fun choose!25 (array!65501 (_ BitVec 32) (_ BitVec 32)) Unit!33887)

(assert (=> d!125445 (= lt!458192 (choose!25 (_keys!11545 thiss!1427) (index!41512 lt!458130) (mask!30309 thiss!1427)))))

(assert (=> d!125445 (validMask!0 (mask!30309 thiss!1427))))

(assert (=> d!125445 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11545 thiss!1427) (index!41512 lt!458130) (mask!30309 thiss!1427)) lt!458192)))

(declare-fun b!1039936 () Bool)

(assert (=> b!1039936 (= e!588689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65502 (store (arr!31518 (_keys!11545 thiss!1427)) (index!41512 lt!458130) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32051 (_keys!11545 thiss!1427))) (mask!30309 thiss!1427)))))

(assert (= (and d!125445 res!693420) b!1039936))

(declare-fun m!959083 () Bool)

(assert (=> d!125445 m!959083))

(assert (=> d!125445 m!959051))

(assert (=> b!1039936 m!958981))

(declare-fun m!959085 () Bool)

(assert (=> b!1039936 m!959085))

(assert (=> b!1039818 d!125445))

(declare-fun bm!44008 () Bool)

(declare-fun call!44011 () (_ BitVec 32))

(assert (=> bm!44008 (= call!44011 (arrayCountValidKeys!0 (_keys!11545 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32051 (_keys!11545 thiss!1427))))))

(declare-fun b!1039937 () Bool)

(declare-fun e!588690 () (_ BitVec 32))

(assert (=> b!1039937 (= e!588690 (bvadd #b00000000000000000000000000000001 call!44011))))

(declare-fun b!1039939 () Bool)

(declare-fun e!588691 () (_ BitVec 32))

(assert (=> b!1039939 (= e!588691 e!588690)))

(declare-fun c!105403 () Bool)

(assert (=> b!1039939 (= c!105403 (validKeyInArray!0 (select (arr!31518 (_keys!11545 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039940 () Bool)

(assert (=> b!1039940 (= e!588691 #b00000000000000000000000000000000)))

(declare-fun b!1039938 () Bool)

(assert (=> b!1039938 (= e!588690 call!44011)))

(declare-fun d!125447 () Bool)

(declare-fun lt!458193 () (_ BitVec 32))

(assert (=> d!125447 (and (bvsge lt!458193 #b00000000000000000000000000000000) (bvsle lt!458193 (bvsub (size!32051 (_keys!11545 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125447 (= lt!458193 e!588691)))

(declare-fun c!105402 () Bool)

(assert (=> d!125447 (= c!105402 (bvsge #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))))))

(assert (=> d!125447 (and (bvsle #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32051 (_keys!11545 thiss!1427)) (size!32051 (_keys!11545 thiss!1427))))))

(assert (=> d!125447 (= (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))) lt!458193)))

(assert (= (and d!125447 c!105402) b!1039940))

(assert (= (and d!125447 (not c!105402)) b!1039939))

(assert (= (and b!1039939 c!105403) b!1039937))

(assert (= (and b!1039939 (not c!105403)) b!1039938))

(assert (= (or b!1039937 b!1039938) bm!44008))

(declare-fun m!959087 () Bool)

(assert (=> bm!44008 m!959087))

(declare-fun m!959089 () Bool)

(assert (=> b!1039939 m!959089))

(assert (=> b!1039939 m!959089))

(declare-fun m!959091 () Bool)

(assert (=> b!1039939 m!959091))

(assert (=> b!1039818 d!125447))

(declare-fun b!1039952 () Bool)

(declare-fun e!588697 () Bool)

(assert (=> b!1039952 (= e!588697 (= (arrayCountValidKeys!0 (array!65502 (store (arr!31518 (_keys!11545 thiss!1427)) (index!41512 lt!458130) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32051 (_keys!11545 thiss!1427))) #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11545 thiss!1427) #b00000000000000000000000000000000 (size!32051 (_keys!11545 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039951 () Bool)

(declare-fun e!588696 () Bool)

(assert (=> b!1039951 (= e!588696 (bvslt (size!32051 (_keys!11545 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1039949 () Bool)

(declare-fun res!693432 () Bool)

(assert (=> b!1039949 (=> (not res!693432) (not e!588696))))

(assert (=> b!1039949 (= res!693432 (validKeyInArray!0 (select (arr!31518 (_keys!11545 thiss!1427)) (index!41512 lt!458130))))))

(declare-fun d!125449 () Bool)

(assert (=> d!125449 e!588697))

(declare-fun res!693430 () Bool)

(assert (=> d!125449 (=> (not res!693430) (not e!588697))))

(assert (=> d!125449 (= res!693430 (and (bvsge (index!41512 lt!458130) #b00000000000000000000000000000000) (bvslt (index!41512 lt!458130) (size!32051 (_keys!11545 thiss!1427)))))))

(declare-fun lt!458196 () Unit!33887)

(declare-fun choose!82 (array!65501 (_ BitVec 32) (_ BitVec 64)) Unit!33887)

(assert (=> d!125449 (= lt!458196 (choose!82 (_keys!11545 thiss!1427) (index!41512 lt!458130) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125449 e!588696))

(declare-fun res!693431 () Bool)

(assert (=> d!125449 (=> (not res!693431) (not e!588696))))

(assert (=> d!125449 (= res!693431 (and (bvsge (index!41512 lt!458130) #b00000000000000000000000000000000) (bvslt (index!41512 lt!458130) (size!32051 (_keys!11545 thiss!1427)))))))

(assert (=> d!125449 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11545 thiss!1427) (index!41512 lt!458130) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458196)))

(declare-fun b!1039950 () Bool)

(declare-fun res!693429 () Bool)

(assert (=> b!1039950 (=> (not res!693429) (not e!588696))))

(assert (=> b!1039950 (= res!693429 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125449 res!693431) b!1039949))

(assert (= (and b!1039949 res!693432) b!1039950))

(assert (= (and b!1039950 res!693429) b!1039951))

(assert (= (and d!125449 res!693430) b!1039952))

(assert (=> b!1039952 m!958981))

(declare-fun m!959093 () Bool)

(assert (=> b!1039952 m!959093))

(assert (=> b!1039952 m!958975))

(declare-fun m!959095 () Bool)

(assert (=> b!1039949 m!959095))

(assert (=> b!1039949 m!959095))

(declare-fun m!959097 () Bool)

(assert (=> b!1039949 m!959097))

(declare-fun m!959099 () Bool)

(assert (=> d!125449 m!959099))

(declare-fun m!959101 () Bool)

(assert (=> b!1039950 m!959101))

(assert (=> b!1039818 d!125449))

(declare-fun d!125451 () Bool)

(assert (=> d!125451 (= (array_inv!24365 (_keys!11545 thiss!1427)) (bvsge (size!32051 (_keys!11545 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039819 d!125451))

(declare-fun d!125453 () Bool)

(assert (=> d!125453 (= (array_inv!24366 (_values!6356 thiss!1427)) (bvsge (size!32052 (_values!6356 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039819 d!125453))

(declare-fun condMapEmpty!38653 () Bool)

(declare-fun mapDefault!38653 () ValueCell!11654)

(assert (=> mapNonEmpty!38644 (= condMapEmpty!38653 (= mapRest!38644 ((as const (Array (_ BitVec 32) ValueCell!11654)) mapDefault!38653)))))

(declare-fun e!588702 () Bool)

(declare-fun mapRes!38653 () Bool)

(assert (=> mapNonEmpty!38644 (= tp!74173 (and e!588702 mapRes!38653))))

(declare-fun b!1039959 () Bool)

(declare-fun e!588703 () Bool)

(assert (=> b!1039959 (= e!588703 tp_is_empty!24715)))

(declare-fun mapNonEmpty!38653 () Bool)

(declare-fun tp!74189 () Bool)

(assert (=> mapNonEmpty!38653 (= mapRes!38653 (and tp!74189 e!588703))))

(declare-fun mapRest!38653 () (Array (_ BitVec 32) ValueCell!11654))

(declare-fun mapValue!38653 () ValueCell!11654)

(declare-fun mapKey!38653 () (_ BitVec 32))

(assert (=> mapNonEmpty!38653 (= mapRest!38644 (store mapRest!38653 mapKey!38653 mapValue!38653))))

(declare-fun b!1039960 () Bool)

(assert (=> b!1039960 (= e!588702 tp_is_empty!24715)))

(declare-fun mapIsEmpty!38653 () Bool)

(assert (=> mapIsEmpty!38653 mapRes!38653))

(assert (= (and mapNonEmpty!38644 condMapEmpty!38653) mapIsEmpty!38653))

(assert (= (and mapNonEmpty!38644 (not condMapEmpty!38653)) mapNonEmpty!38653))

(assert (= (and mapNonEmpty!38653 ((_ is ValueCellFull!11654) mapValue!38653)) b!1039959))

(assert (= (and mapNonEmpty!38644 ((_ is ValueCellFull!11654) mapDefault!38653)) b!1039960))

(declare-fun m!959103 () Bool)

(assert (=> mapNonEmpty!38653 m!959103))

(check-sat (not b!1039904) (not b!1039902) (not mapNonEmpty!38653) (not b!1039918) (not b!1039903) (not b!1039877) (not bm!44008) (not d!125443) (not b!1039950) (not b!1039933) (not b!1039889) tp_is_empty!24715 (not b!1039916) (not d!125435) (not d!125433) (not b!1039952) (not b!1039949) (not b!1039929) (not b!1039936) (not d!125449) (not b!1039890) (not bm!44007) (not bm!44004) (not b!1039939) b_and!33501 (not b_next!20995) (not bm!44001) (not b!1039891) (not d!125445))
(check-sat b_and!33501 (not b_next!20995))
