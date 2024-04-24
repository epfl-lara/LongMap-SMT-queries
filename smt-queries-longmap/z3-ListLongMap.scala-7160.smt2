; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91402 () Bool)

(assert start!91402)

(declare-fun b!1041807 () Bool)

(declare-fun b_free!21013 () Bool)

(declare-fun b_next!21013 () Bool)

(assert (=> b!1041807 (= b_free!21013 (not b_next!21013))))

(declare-fun tp!74236 () Bool)

(declare-fun b_and!33555 () Bool)

(assert (=> b!1041807 (= tp!74236 b_and!33555)))

(declare-fun b!1041802 () Bool)

(declare-fun res!694195 () Bool)

(declare-fun e!589926 () Bool)

(assert (=> b!1041802 (=> res!694195 e!589926)))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041802 (= res!694195 (not (validKeyInArray!0 key!909)))))

(declare-fun mapIsEmpty!38680 () Bool)

(declare-fun mapRes!38680 () Bool)

(assert (=> mapIsEmpty!38680 mapRes!38680))

(declare-fun b!1041803 () Bool)

(declare-fun e!589927 () Bool)

(declare-fun e!589931 () Bool)

(assert (=> b!1041803 (= e!589927 e!589931)))

(declare-fun res!694194 () Bool)

(assert (=> b!1041803 (=> (not res!694194) (not e!589931))))

(declare-datatypes ((SeekEntryResult!9753 0))(
  ( (MissingZero!9753 (index!41383 (_ BitVec 32))) (Found!9753 (index!41384 (_ BitVec 32))) (Intermediate!9753 (undefined!10565 Bool) (index!41385 (_ BitVec 32)) (x!92863 (_ BitVec 32))) (Undefined!9753) (MissingVacant!9753 (index!41386 (_ BitVec 32))) )
))
(declare-fun lt!459081 () SeekEntryResult!9753)

(get-info :version)

(assert (=> b!1041803 (= res!694194 ((_ is Found!9753) lt!459081))))

(declare-datatypes ((V!37851 0))(
  ( (V!37852 (val!12417 Int)) )
))
(declare-datatypes ((ValueCell!11663 0))(
  ( (ValueCellFull!11663 (v!15000 V!37851)) (EmptyCell!11663) )
))
(declare-datatypes ((array!65653 0))(
  ( (array!65654 (arr!31585 (Array (_ BitVec 32) (_ BitVec 64))) (size!32117 (_ BitVec 32))) )
))
(declare-datatypes ((array!65655 0))(
  ( (array!65656 (arr!31586 (Array (_ BitVec 32) ValueCell!11663)) (size!32118 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5920 0))(
  ( (LongMapFixedSize!5921 (defaultEntry!6342 Int) (mask!30398 (_ BitVec 32)) (extraKeys!6070 (_ BitVec 32)) (zeroValue!6176 V!37851) (minValue!6176 V!37851) (_size!3015 (_ BitVec 32)) (_keys!11602 array!65653) (_values!6365 array!65655) (_vacant!3015 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5920)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65653 (_ BitVec 32)) SeekEntryResult!9753)

(assert (=> b!1041803 (= lt!459081 (seekEntry!0 key!909 (_keys!11602 thiss!1427) (mask!30398 thiss!1427)))))

(declare-fun b!1041804 () Bool)

(declare-fun res!694196 () Bool)

(assert (=> b!1041804 (=> (not res!694196) (not e!589927))))

(assert (=> b!1041804 (= res!694196 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1041805 () Bool)

(declare-fun e!589924 () Bool)

(declare-fun tp_is_empty!24733 () Bool)

(assert (=> b!1041805 (= e!589924 tp_is_empty!24733)))

(declare-fun b!1041806 () Bool)

(assert (=> b!1041806 (= e!589931 (not e!589926))))

(declare-fun res!694193 () Bool)

(assert (=> b!1041806 (=> res!694193 e!589926)))

(assert (=> b!1041806 (= res!694193 (or (bvslt (index!41384 lt!459081) #b00000000000000000000000000000000) (bvsge (index!41384 lt!459081) (size!32117 (_keys!11602 thiss!1427))) (bvsge (size!32117 (_keys!11602 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!459080 () array!65653)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65653 (_ BitVec 32)) Bool)

(assert (=> b!1041806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459080 (mask!30398 thiss!1427))))

(declare-datatypes ((Unit!34023 0))(
  ( (Unit!34024) )
))
(declare-fun lt!459083 () Unit!34023)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65653 (_ BitVec 32) (_ BitVec 32)) Unit!34023)

(assert (=> b!1041806 (= lt!459083 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11602 thiss!1427) (index!41384 lt!459081) (mask!30398 thiss!1427)))))

(declare-datatypes ((List!21949 0))(
  ( (Nil!21946) (Cons!21945 (h!23158 (_ BitVec 64)) (t!31155 List!21949)) )
))
(declare-fun arrayNoDuplicates!0 (array!65653 (_ BitVec 32) List!21949) Bool)

(assert (=> b!1041806 (arrayNoDuplicates!0 lt!459080 #b00000000000000000000000000000000 Nil!21946)))

(declare-fun lt!459082 () Unit!34023)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65653 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21949) Unit!34023)

(assert (=> b!1041806 (= lt!459082 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11602 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41384 lt!459081) #b00000000000000000000000000000000 Nil!21946))))

(declare-fun arrayCountValidKeys!0 (array!65653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041806 (= (arrayCountValidKeys!0 lt!459080 #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11602 thiss!1427) #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041806 (= lt!459080 (array!65654 (store (arr!31585 (_keys!11602 thiss!1427)) (index!41384 lt!459081) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32117 (_keys!11602 thiss!1427))))))

(declare-fun lt!459084 () Unit!34023)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65653 (_ BitVec 32) (_ BitVec 64)) Unit!34023)

(assert (=> b!1041806 (= lt!459084 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11602 thiss!1427) (index!41384 lt!459081) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589925 () Bool)

(declare-fun e!589928 () Bool)

(declare-fun array_inv!24423 (array!65653) Bool)

(declare-fun array_inv!24424 (array!65655) Bool)

(assert (=> b!1041807 (= e!589928 (and tp!74236 tp_is_empty!24733 (array_inv!24423 (_keys!11602 thiss!1427)) (array_inv!24424 (_values!6365 thiss!1427)) e!589925))))

(declare-fun b!1041809 () Bool)

(declare-fun res!694197 () Bool)

(assert (=> b!1041809 (=> res!694197 e!589926)))

(assert (=> b!1041809 (= res!694197 (not (arrayNoDuplicates!0 (_keys!11602 thiss!1427) #b00000000000000000000000000000000 Nil!21946)))))

(declare-fun b!1041810 () Bool)

(assert (=> b!1041810 (= e!589926 (= (select (arr!31585 (_keys!11602 thiss!1427)) (index!41384 lt!459081)) key!909))))

(declare-fun mapNonEmpty!38680 () Bool)

(declare-fun tp!74237 () Bool)

(assert (=> mapNonEmpty!38680 (= mapRes!38680 (and tp!74237 e!589924))))

(declare-fun mapKey!38680 () (_ BitVec 32))

(declare-fun mapRest!38680 () (Array (_ BitVec 32) ValueCell!11663))

(declare-fun mapValue!38680 () ValueCell!11663)

(assert (=> mapNonEmpty!38680 (= (arr!31586 (_values!6365 thiss!1427)) (store mapRest!38680 mapKey!38680 mapValue!38680))))

(declare-fun b!1041811 () Bool)

(declare-fun e!589930 () Bool)

(assert (=> b!1041811 (= e!589925 (and e!589930 mapRes!38680))))

(declare-fun condMapEmpty!38680 () Bool)

(declare-fun mapDefault!38680 () ValueCell!11663)

(assert (=> b!1041811 (= condMapEmpty!38680 (= (arr!31586 (_values!6365 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11663)) mapDefault!38680)))))

(declare-fun b!1041808 () Bool)

(assert (=> b!1041808 (= e!589930 tp_is_empty!24733)))

(declare-fun res!694198 () Bool)

(assert (=> start!91402 (=> (not res!694198) (not e!589927))))

(declare-fun valid!2232 (LongMapFixedSize!5920) Bool)

(assert (=> start!91402 (= res!694198 (valid!2232 thiss!1427))))

(assert (=> start!91402 e!589927))

(assert (=> start!91402 e!589928))

(assert (=> start!91402 true))

(assert (= (and start!91402 res!694198) b!1041804))

(assert (= (and b!1041804 res!694196) b!1041803))

(assert (= (and b!1041803 res!694194) b!1041806))

(assert (= (and b!1041806 (not res!694193)) b!1041809))

(assert (= (and b!1041809 (not res!694197)) b!1041802))

(assert (= (and b!1041802 (not res!694195)) b!1041810))

(assert (= (and b!1041811 condMapEmpty!38680) mapIsEmpty!38680))

(assert (= (and b!1041811 (not condMapEmpty!38680)) mapNonEmpty!38680))

(assert (= (and mapNonEmpty!38680 ((_ is ValueCellFull!11663) mapValue!38680)) b!1041805))

(assert (= (and b!1041811 ((_ is ValueCellFull!11663) mapDefault!38680)) b!1041808))

(assert (= b!1041807 b!1041811))

(assert (= start!91402 b!1041807))

(declare-fun m!961691 () Bool)

(assert (=> b!1041803 m!961691))

(declare-fun m!961693 () Bool)

(assert (=> b!1041810 m!961693))

(declare-fun m!961695 () Bool)

(assert (=> b!1041806 m!961695))

(declare-fun m!961697 () Bool)

(assert (=> b!1041806 m!961697))

(declare-fun m!961699 () Bool)

(assert (=> b!1041806 m!961699))

(declare-fun m!961701 () Bool)

(assert (=> b!1041806 m!961701))

(declare-fun m!961703 () Bool)

(assert (=> b!1041806 m!961703))

(declare-fun m!961705 () Bool)

(assert (=> b!1041806 m!961705))

(declare-fun m!961707 () Bool)

(assert (=> b!1041806 m!961707))

(declare-fun m!961709 () Bool)

(assert (=> b!1041806 m!961709))

(declare-fun m!961711 () Bool)

(assert (=> b!1041809 m!961711))

(declare-fun m!961713 () Bool)

(assert (=> mapNonEmpty!38680 m!961713))

(declare-fun m!961715 () Bool)

(assert (=> start!91402 m!961715))

(declare-fun m!961717 () Bool)

(assert (=> b!1041802 m!961717))

(declare-fun m!961719 () Bool)

(assert (=> b!1041807 m!961719))

(declare-fun m!961721 () Bool)

(assert (=> b!1041807 m!961721))

(check-sat (not b!1041803) (not b!1041807) b_and!33555 (not b!1041809) (not start!91402) tp_is_empty!24733 (not b_next!21013) (not b!1041802) (not mapNonEmpty!38680) (not b!1041806))
(check-sat b_and!33555 (not b_next!21013))
(get-model)

(declare-fun b!1041882 () Bool)

(declare-fun e!589988 () Bool)

(declare-fun call!44126 () Bool)

(assert (=> b!1041882 (= e!589988 call!44126)))

(declare-fun b!1041884 () Bool)

(declare-fun e!589990 () Bool)

(assert (=> b!1041884 (= e!589990 e!589988)))

(declare-fun c!105903 () Bool)

(assert (=> b!1041884 (= c!105903 (validKeyInArray!0 (select (arr!31585 (_keys!11602 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44123 () Bool)

(assert (=> bm!44123 (= call!44126 (arrayNoDuplicates!0 (_keys!11602 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105903 (Cons!21945 (select (arr!31585 (_keys!11602 thiss!1427)) #b00000000000000000000000000000000) Nil!21946) Nil!21946)))))

(declare-fun b!1041885 () Bool)

(declare-fun e!589991 () Bool)

(declare-fun contains!6076 (List!21949 (_ BitVec 64)) Bool)

(assert (=> b!1041885 (= e!589991 (contains!6076 Nil!21946 (select (arr!31585 (_keys!11602 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041886 () Bool)

(assert (=> b!1041886 (= e!589988 call!44126)))

(declare-fun d!126123 () Bool)

(declare-fun res!694243 () Bool)

(declare-fun e!589989 () Bool)

(assert (=> d!126123 (=> res!694243 e!589989)))

(assert (=> d!126123 (= res!694243 (bvsge #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))))))

(assert (=> d!126123 (= (arrayNoDuplicates!0 (_keys!11602 thiss!1427) #b00000000000000000000000000000000 Nil!21946) e!589989)))

(declare-fun b!1041883 () Bool)

(assert (=> b!1041883 (= e!589989 e!589990)))

(declare-fun res!694241 () Bool)

(assert (=> b!1041883 (=> (not res!694241) (not e!589990))))

(assert (=> b!1041883 (= res!694241 (not e!589991))))

(declare-fun res!694242 () Bool)

(assert (=> b!1041883 (=> (not res!694242) (not e!589991))))

(assert (=> b!1041883 (= res!694242 (validKeyInArray!0 (select (arr!31585 (_keys!11602 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126123 (not res!694243)) b!1041883))

(assert (= (and b!1041883 res!694242) b!1041885))

(assert (= (and b!1041883 res!694241) b!1041884))

(assert (= (and b!1041884 c!105903) b!1041882))

(assert (= (and b!1041884 (not c!105903)) b!1041886))

(assert (= (or b!1041882 b!1041886) bm!44123))

(declare-fun m!961787 () Bool)

(assert (=> b!1041884 m!961787))

(assert (=> b!1041884 m!961787))

(declare-fun m!961789 () Bool)

(assert (=> b!1041884 m!961789))

(assert (=> bm!44123 m!961787))

(declare-fun m!961791 () Bool)

(assert (=> bm!44123 m!961791))

(assert (=> b!1041885 m!961787))

(assert (=> b!1041885 m!961787))

(declare-fun m!961793 () Bool)

(assert (=> b!1041885 m!961793))

(assert (=> b!1041883 m!961787))

(assert (=> b!1041883 m!961787))

(assert (=> b!1041883 m!961789))

(assert (=> b!1041809 d!126123))

(declare-fun b!1041899 () Bool)

(declare-fun e!589999 () SeekEntryResult!9753)

(assert (=> b!1041899 (= e!589999 Undefined!9753)))

(declare-fun b!1041900 () Bool)

(declare-fun e!590000 () SeekEntryResult!9753)

(assert (=> b!1041900 (= e!589999 e!590000)))

(declare-fun lt!459126 () (_ BitVec 64))

(declare-fun lt!459125 () SeekEntryResult!9753)

(assert (=> b!1041900 (= lt!459126 (select (arr!31585 (_keys!11602 thiss!1427)) (index!41385 lt!459125)))))

(declare-fun c!105910 () Bool)

(assert (=> b!1041900 (= c!105910 (= lt!459126 key!909))))

(declare-fun d!126125 () Bool)

(declare-fun lt!459123 () SeekEntryResult!9753)

(assert (=> d!126125 (and (or ((_ is MissingVacant!9753) lt!459123) (not ((_ is Found!9753) lt!459123)) (and (bvsge (index!41384 lt!459123) #b00000000000000000000000000000000) (bvslt (index!41384 lt!459123) (size!32117 (_keys!11602 thiss!1427))))) (not ((_ is MissingVacant!9753) lt!459123)) (or (not ((_ is Found!9753) lt!459123)) (= (select (arr!31585 (_keys!11602 thiss!1427)) (index!41384 lt!459123)) key!909)))))

(assert (=> d!126125 (= lt!459123 e!589999)))

(declare-fun c!105912 () Bool)

(assert (=> d!126125 (= c!105912 (and ((_ is Intermediate!9753) lt!459125) (undefined!10565 lt!459125)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65653 (_ BitVec 32)) SeekEntryResult!9753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126125 (= lt!459125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30398 thiss!1427)) key!909 (_keys!11602 thiss!1427) (mask!30398 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126125 (validMask!0 (mask!30398 thiss!1427))))

(assert (=> d!126125 (= (seekEntry!0 key!909 (_keys!11602 thiss!1427) (mask!30398 thiss!1427)) lt!459123)))

(declare-fun b!1041901 () Bool)

(declare-fun e!589998 () SeekEntryResult!9753)

(declare-fun lt!459124 () SeekEntryResult!9753)

(assert (=> b!1041901 (= e!589998 (ite ((_ is MissingVacant!9753) lt!459124) (MissingZero!9753 (index!41386 lt!459124)) lt!459124))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65653 (_ BitVec 32)) SeekEntryResult!9753)

(assert (=> b!1041901 (= lt!459124 (seekKeyOrZeroReturnVacant!0 (x!92863 lt!459125) (index!41385 lt!459125) (index!41385 lt!459125) key!909 (_keys!11602 thiss!1427) (mask!30398 thiss!1427)))))

(declare-fun b!1041902 () Bool)

(assert (=> b!1041902 (= e!590000 (Found!9753 (index!41385 lt!459125)))))

(declare-fun b!1041903 () Bool)

(declare-fun c!105911 () Bool)

(assert (=> b!1041903 (= c!105911 (= lt!459126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041903 (= e!590000 e!589998)))

(declare-fun b!1041904 () Bool)

(assert (=> b!1041904 (= e!589998 (MissingZero!9753 (index!41385 lt!459125)))))

(assert (= (and d!126125 c!105912) b!1041899))

(assert (= (and d!126125 (not c!105912)) b!1041900))

(assert (= (and b!1041900 c!105910) b!1041902))

(assert (= (and b!1041900 (not c!105910)) b!1041903))

(assert (= (and b!1041903 c!105911) b!1041904))

(assert (= (and b!1041903 (not c!105911)) b!1041901))

(declare-fun m!961795 () Bool)

(assert (=> b!1041900 m!961795))

(declare-fun m!961797 () Bool)

(assert (=> d!126125 m!961797))

(declare-fun m!961799 () Bool)

(assert (=> d!126125 m!961799))

(assert (=> d!126125 m!961799))

(declare-fun m!961801 () Bool)

(assert (=> d!126125 m!961801))

(declare-fun m!961803 () Bool)

(assert (=> d!126125 m!961803))

(declare-fun m!961805 () Bool)

(assert (=> b!1041901 m!961805))

(assert (=> b!1041803 d!126125))

(declare-fun d!126127 () Bool)

(assert (=> d!126127 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041802 d!126127))

(declare-fun d!126129 () Bool)

(assert (=> d!126129 (= (array_inv!24423 (_keys!11602 thiss!1427)) (bvsge (size!32117 (_keys!11602 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041807 d!126129))

(declare-fun d!126131 () Bool)

(assert (=> d!126131 (= (array_inv!24424 (_values!6365 thiss!1427)) (bvsge (size!32118 (_values!6365 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041807 d!126131))

(declare-fun d!126133 () Bool)

(declare-fun res!694250 () Bool)

(declare-fun e!590003 () Bool)

(assert (=> d!126133 (=> (not res!694250) (not e!590003))))

(declare-fun simpleValid!434 (LongMapFixedSize!5920) Bool)

(assert (=> d!126133 (= res!694250 (simpleValid!434 thiss!1427))))

(assert (=> d!126133 (= (valid!2232 thiss!1427) e!590003)))

(declare-fun b!1041911 () Bool)

(declare-fun res!694251 () Bool)

(assert (=> b!1041911 (=> (not res!694251) (not e!590003))))

(assert (=> b!1041911 (= res!694251 (= (arrayCountValidKeys!0 (_keys!11602 thiss!1427) #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))) (_size!3015 thiss!1427)))))

(declare-fun b!1041912 () Bool)

(declare-fun res!694252 () Bool)

(assert (=> b!1041912 (=> (not res!694252) (not e!590003))))

(assert (=> b!1041912 (= res!694252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11602 thiss!1427) (mask!30398 thiss!1427)))))

(declare-fun b!1041913 () Bool)

(assert (=> b!1041913 (= e!590003 (arrayNoDuplicates!0 (_keys!11602 thiss!1427) #b00000000000000000000000000000000 Nil!21946))))

(assert (= (and d!126133 res!694250) b!1041911))

(assert (= (and b!1041911 res!694251) b!1041912))

(assert (= (and b!1041912 res!694252) b!1041913))

(declare-fun m!961807 () Bool)

(assert (=> d!126133 m!961807))

(assert (=> b!1041911 m!961701))

(declare-fun m!961809 () Bool)

(assert (=> b!1041912 m!961809))

(assert (=> b!1041913 m!961711))

(assert (=> start!91402 d!126133))

(declare-fun d!126135 () Bool)

(declare-fun e!590006 () Bool)

(assert (=> d!126135 e!590006))

(declare-fun res!694255 () Bool)

(assert (=> d!126135 (=> (not res!694255) (not e!590006))))

(assert (=> d!126135 (= res!694255 (and (bvsge (index!41384 lt!459081) #b00000000000000000000000000000000) (bvslt (index!41384 lt!459081) (size!32117 (_keys!11602 thiss!1427)))))))

(declare-fun lt!459129 () Unit!34023)

(declare-fun choose!53 (array!65653 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21949) Unit!34023)

(assert (=> d!126135 (= lt!459129 (choose!53 (_keys!11602 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41384 lt!459081) #b00000000000000000000000000000000 Nil!21946))))

(assert (=> d!126135 (bvslt (size!32117 (_keys!11602 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126135 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11602 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41384 lt!459081) #b00000000000000000000000000000000 Nil!21946) lt!459129)))

(declare-fun b!1041916 () Bool)

(assert (=> b!1041916 (= e!590006 (arrayNoDuplicates!0 (array!65654 (store (arr!31585 (_keys!11602 thiss!1427)) (index!41384 lt!459081) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32117 (_keys!11602 thiss!1427))) #b00000000000000000000000000000000 Nil!21946))))

(assert (= (and d!126135 res!694255) b!1041916))

(declare-fun m!961811 () Bool)

(assert (=> d!126135 m!961811))

(assert (=> b!1041916 m!961697))

(declare-fun m!961813 () Bool)

(assert (=> b!1041916 m!961813))

(assert (=> b!1041806 d!126135))

(declare-fun d!126137 () Bool)

(declare-fun lt!459132 () (_ BitVec 32))

(assert (=> d!126137 (and (bvsge lt!459132 #b00000000000000000000000000000000) (bvsle lt!459132 (bvsub (size!32117 lt!459080) #b00000000000000000000000000000000)))))

(declare-fun e!590011 () (_ BitVec 32))

(assert (=> d!126137 (= lt!459132 e!590011)))

(declare-fun c!105918 () Bool)

(assert (=> d!126137 (= c!105918 (bvsge #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))))))

(assert (=> d!126137 (and (bvsle #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32117 (_keys!11602 thiss!1427)) (size!32117 lt!459080)))))

(assert (=> d!126137 (= (arrayCountValidKeys!0 lt!459080 #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))) lt!459132)))

(declare-fun b!1041925 () Bool)

(declare-fun e!590012 () (_ BitVec 32))

(assert (=> b!1041925 (= e!590011 e!590012)))

(declare-fun c!105917 () Bool)

(assert (=> b!1041925 (= c!105917 (validKeyInArray!0 (select (arr!31585 lt!459080) #b00000000000000000000000000000000)))))

(declare-fun bm!44126 () Bool)

(declare-fun call!44129 () (_ BitVec 32))

(assert (=> bm!44126 (= call!44129 (arrayCountValidKeys!0 lt!459080 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32117 (_keys!11602 thiss!1427))))))

(declare-fun b!1041926 () Bool)

(assert (=> b!1041926 (= e!590011 #b00000000000000000000000000000000)))

(declare-fun b!1041927 () Bool)

(assert (=> b!1041927 (= e!590012 call!44129)))

(declare-fun b!1041928 () Bool)

(assert (=> b!1041928 (= e!590012 (bvadd #b00000000000000000000000000000001 call!44129))))

(assert (= (and d!126137 c!105918) b!1041926))

(assert (= (and d!126137 (not c!105918)) b!1041925))

(assert (= (and b!1041925 c!105917) b!1041928))

(assert (= (and b!1041925 (not c!105917)) b!1041927))

(assert (= (or b!1041928 b!1041927) bm!44126))

(declare-fun m!961815 () Bool)

(assert (=> b!1041925 m!961815))

(assert (=> b!1041925 m!961815))

(declare-fun m!961817 () Bool)

(assert (=> b!1041925 m!961817))

(declare-fun m!961819 () Bool)

(assert (=> bm!44126 m!961819))

(assert (=> b!1041806 d!126137))

(declare-fun b!1041937 () Bool)

(declare-fun e!590019 () Bool)

(declare-fun e!590020 () Bool)

(assert (=> b!1041937 (= e!590019 e!590020)))

(declare-fun c!105921 () Bool)

(assert (=> b!1041937 (= c!105921 (validKeyInArray!0 (select (arr!31585 lt!459080) #b00000000000000000000000000000000)))))

(declare-fun d!126139 () Bool)

(declare-fun res!694260 () Bool)

(assert (=> d!126139 (=> res!694260 e!590019)))

(assert (=> d!126139 (= res!694260 (bvsge #b00000000000000000000000000000000 (size!32117 lt!459080)))))

(assert (=> d!126139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459080 (mask!30398 thiss!1427)) e!590019)))

(declare-fun b!1041938 () Bool)

(declare-fun call!44132 () Bool)

(assert (=> b!1041938 (= e!590020 call!44132)))

(declare-fun b!1041939 () Bool)

(declare-fun e!590021 () Bool)

(assert (=> b!1041939 (= e!590021 call!44132)))

(declare-fun b!1041940 () Bool)

(assert (=> b!1041940 (= e!590020 e!590021)))

(declare-fun lt!459140 () (_ BitVec 64))

(assert (=> b!1041940 (= lt!459140 (select (arr!31585 lt!459080) #b00000000000000000000000000000000))))

(declare-fun lt!459139 () Unit!34023)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65653 (_ BitVec 64) (_ BitVec 32)) Unit!34023)

(assert (=> b!1041940 (= lt!459139 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459080 lt!459140 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041940 (arrayContainsKey!0 lt!459080 lt!459140 #b00000000000000000000000000000000)))

(declare-fun lt!459141 () Unit!34023)

(assert (=> b!1041940 (= lt!459141 lt!459139)))

(declare-fun res!694261 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65653 (_ BitVec 32)) SeekEntryResult!9753)

(assert (=> b!1041940 (= res!694261 (= (seekEntryOrOpen!0 (select (arr!31585 lt!459080) #b00000000000000000000000000000000) lt!459080 (mask!30398 thiss!1427)) (Found!9753 #b00000000000000000000000000000000)))))

(assert (=> b!1041940 (=> (not res!694261) (not e!590021))))

(declare-fun bm!44129 () Bool)

(assert (=> bm!44129 (= call!44132 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459080 (mask!30398 thiss!1427)))))

(assert (= (and d!126139 (not res!694260)) b!1041937))

(assert (= (and b!1041937 c!105921) b!1041940))

(assert (= (and b!1041937 (not c!105921)) b!1041938))

(assert (= (and b!1041940 res!694261) b!1041939))

(assert (= (or b!1041939 b!1041938) bm!44129))

(assert (=> b!1041937 m!961815))

(assert (=> b!1041937 m!961815))

(assert (=> b!1041937 m!961817))

(assert (=> b!1041940 m!961815))

(declare-fun m!961821 () Bool)

(assert (=> b!1041940 m!961821))

(declare-fun m!961823 () Bool)

(assert (=> b!1041940 m!961823))

(assert (=> b!1041940 m!961815))

(declare-fun m!961825 () Bool)

(assert (=> b!1041940 m!961825))

(declare-fun m!961827 () Bool)

(assert (=> bm!44129 m!961827))

(assert (=> b!1041806 d!126139))

(declare-fun d!126141 () Bool)

(declare-fun e!590024 () Bool)

(assert (=> d!126141 e!590024))

(declare-fun res!694264 () Bool)

(assert (=> d!126141 (=> (not res!694264) (not e!590024))))

(assert (=> d!126141 (= res!694264 (and (bvsge (index!41384 lt!459081) #b00000000000000000000000000000000) (bvslt (index!41384 lt!459081) (size!32117 (_keys!11602 thiss!1427)))))))

(declare-fun lt!459144 () Unit!34023)

(declare-fun choose!25 (array!65653 (_ BitVec 32) (_ BitVec 32)) Unit!34023)

(assert (=> d!126141 (= lt!459144 (choose!25 (_keys!11602 thiss!1427) (index!41384 lt!459081) (mask!30398 thiss!1427)))))

(assert (=> d!126141 (validMask!0 (mask!30398 thiss!1427))))

(assert (=> d!126141 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11602 thiss!1427) (index!41384 lt!459081) (mask!30398 thiss!1427)) lt!459144)))

(declare-fun b!1041943 () Bool)

(assert (=> b!1041943 (= e!590024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65654 (store (arr!31585 (_keys!11602 thiss!1427)) (index!41384 lt!459081) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32117 (_keys!11602 thiss!1427))) (mask!30398 thiss!1427)))))

(assert (= (and d!126141 res!694264) b!1041943))

(declare-fun m!961829 () Bool)

(assert (=> d!126141 m!961829))

(assert (=> d!126141 m!961803))

(assert (=> b!1041943 m!961697))

(declare-fun m!961831 () Bool)

(assert (=> b!1041943 m!961831))

(assert (=> b!1041806 d!126141))

(declare-fun b!1041955 () Bool)

(declare-fun e!590029 () Bool)

(assert (=> b!1041955 (= e!590029 (= (arrayCountValidKeys!0 (array!65654 (store (arr!31585 (_keys!11602 thiss!1427)) (index!41384 lt!459081) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32117 (_keys!11602 thiss!1427))) #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11602 thiss!1427) #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1041954 () Bool)

(declare-fun e!590030 () Bool)

(assert (=> b!1041954 (= e!590030 (bvslt (size!32117 (_keys!11602 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1041953 () Bool)

(declare-fun res!694273 () Bool)

(assert (=> b!1041953 (=> (not res!694273) (not e!590030))))

(assert (=> b!1041953 (= res!694273 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041952 () Bool)

(declare-fun res!694274 () Bool)

(assert (=> b!1041952 (=> (not res!694274) (not e!590030))))

(assert (=> b!1041952 (= res!694274 (validKeyInArray!0 (select (arr!31585 (_keys!11602 thiss!1427)) (index!41384 lt!459081))))))

(declare-fun d!126143 () Bool)

(assert (=> d!126143 e!590029))

(declare-fun res!694276 () Bool)

(assert (=> d!126143 (=> (not res!694276) (not e!590029))))

(assert (=> d!126143 (= res!694276 (and (bvsge (index!41384 lt!459081) #b00000000000000000000000000000000) (bvslt (index!41384 lt!459081) (size!32117 (_keys!11602 thiss!1427)))))))

(declare-fun lt!459147 () Unit!34023)

(declare-fun choose!82 (array!65653 (_ BitVec 32) (_ BitVec 64)) Unit!34023)

(assert (=> d!126143 (= lt!459147 (choose!82 (_keys!11602 thiss!1427) (index!41384 lt!459081) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126143 e!590030))

(declare-fun res!694275 () Bool)

(assert (=> d!126143 (=> (not res!694275) (not e!590030))))

(assert (=> d!126143 (= res!694275 (and (bvsge (index!41384 lt!459081) #b00000000000000000000000000000000) (bvslt (index!41384 lt!459081) (size!32117 (_keys!11602 thiss!1427)))))))

(assert (=> d!126143 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11602 thiss!1427) (index!41384 lt!459081) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459147)))

(assert (= (and d!126143 res!694275) b!1041952))

(assert (= (and b!1041952 res!694274) b!1041953))

(assert (= (and b!1041953 res!694273) b!1041954))

(assert (= (and d!126143 res!694276) b!1041955))

(assert (=> b!1041955 m!961697))

(declare-fun m!961833 () Bool)

(assert (=> b!1041955 m!961833))

(assert (=> b!1041955 m!961701))

(declare-fun m!961835 () Bool)

(assert (=> b!1041953 m!961835))

(assert (=> b!1041952 m!961693))

(assert (=> b!1041952 m!961693))

(declare-fun m!961837 () Bool)

(assert (=> b!1041952 m!961837))

(declare-fun m!961839 () Bool)

(assert (=> d!126143 m!961839))

(assert (=> b!1041806 d!126143))

(declare-fun d!126145 () Bool)

(declare-fun lt!459148 () (_ BitVec 32))

(assert (=> d!126145 (and (bvsge lt!459148 #b00000000000000000000000000000000) (bvsle lt!459148 (bvsub (size!32117 (_keys!11602 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!590031 () (_ BitVec 32))

(assert (=> d!126145 (= lt!459148 e!590031)))

(declare-fun c!105923 () Bool)

(assert (=> d!126145 (= c!105923 (bvsge #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))))))

(assert (=> d!126145 (and (bvsle #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32117 (_keys!11602 thiss!1427)) (size!32117 (_keys!11602 thiss!1427))))))

(assert (=> d!126145 (= (arrayCountValidKeys!0 (_keys!11602 thiss!1427) #b00000000000000000000000000000000 (size!32117 (_keys!11602 thiss!1427))) lt!459148)))

(declare-fun b!1041956 () Bool)

(declare-fun e!590032 () (_ BitVec 32))

(assert (=> b!1041956 (= e!590031 e!590032)))

(declare-fun c!105922 () Bool)

(assert (=> b!1041956 (= c!105922 (validKeyInArray!0 (select (arr!31585 (_keys!11602 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44130 () Bool)

(declare-fun call!44133 () (_ BitVec 32))

(assert (=> bm!44130 (= call!44133 (arrayCountValidKeys!0 (_keys!11602 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32117 (_keys!11602 thiss!1427))))))

(declare-fun b!1041957 () Bool)

(assert (=> b!1041957 (= e!590031 #b00000000000000000000000000000000)))

(declare-fun b!1041958 () Bool)

(assert (=> b!1041958 (= e!590032 call!44133)))

(declare-fun b!1041959 () Bool)

(assert (=> b!1041959 (= e!590032 (bvadd #b00000000000000000000000000000001 call!44133))))

(assert (= (and d!126145 c!105923) b!1041957))

(assert (= (and d!126145 (not c!105923)) b!1041956))

(assert (= (and b!1041956 c!105922) b!1041959))

(assert (= (and b!1041956 (not c!105922)) b!1041958))

(assert (= (or b!1041959 b!1041958) bm!44130))

(assert (=> b!1041956 m!961787))

(assert (=> b!1041956 m!961787))

(assert (=> b!1041956 m!961789))

(declare-fun m!961841 () Bool)

(assert (=> bm!44130 m!961841))

(assert (=> b!1041806 d!126145))

(declare-fun b!1041960 () Bool)

(declare-fun e!590033 () Bool)

(declare-fun call!44134 () Bool)

(assert (=> b!1041960 (= e!590033 call!44134)))

(declare-fun b!1041962 () Bool)

(declare-fun e!590035 () Bool)

(assert (=> b!1041962 (= e!590035 e!590033)))

(declare-fun c!105924 () Bool)

(assert (=> b!1041962 (= c!105924 (validKeyInArray!0 (select (arr!31585 lt!459080) #b00000000000000000000000000000000)))))

(declare-fun bm!44131 () Bool)

(assert (=> bm!44131 (= call!44134 (arrayNoDuplicates!0 lt!459080 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105924 (Cons!21945 (select (arr!31585 lt!459080) #b00000000000000000000000000000000) Nil!21946) Nil!21946)))))

(declare-fun b!1041963 () Bool)

(declare-fun e!590036 () Bool)

(assert (=> b!1041963 (= e!590036 (contains!6076 Nil!21946 (select (arr!31585 lt!459080) #b00000000000000000000000000000000)))))

(declare-fun b!1041964 () Bool)

(assert (=> b!1041964 (= e!590033 call!44134)))

(declare-fun d!126147 () Bool)

(declare-fun res!694279 () Bool)

(declare-fun e!590034 () Bool)

(assert (=> d!126147 (=> res!694279 e!590034)))

(assert (=> d!126147 (= res!694279 (bvsge #b00000000000000000000000000000000 (size!32117 lt!459080)))))

(assert (=> d!126147 (= (arrayNoDuplicates!0 lt!459080 #b00000000000000000000000000000000 Nil!21946) e!590034)))

(declare-fun b!1041961 () Bool)

(assert (=> b!1041961 (= e!590034 e!590035)))

(declare-fun res!694277 () Bool)

(assert (=> b!1041961 (=> (not res!694277) (not e!590035))))

(assert (=> b!1041961 (= res!694277 (not e!590036))))

(declare-fun res!694278 () Bool)

(assert (=> b!1041961 (=> (not res!694278) (not e!590036))))

(assert (=> b!1041961 (= res!694278 (validKeyInArray!0 (select (arr!31585 lt!459080) #b00000000000000000000000000000000)))))

(assert (= (and d!126147 (not res!694279)) b!1041961))

(assert (= (and b!1041961 res!694278) b!1041963))

(assert (= (and b!1041961 res!694277) b!1041962))

(assert (= (and b!1041962 c!105924) b!1041960))

(assert (= (and b!1041962 (not c!105924)) b!1041964))

(assert (= (or b!1041960 b!1041964) bm!44131))

(assert (=> b!1041962 m!961815))

(assert (=> b!1041962 m!961815))

(assert (=> b!1041962 m!961817))

(assert (=> bm!44131 m!961815))

(declare-fun m!961843 () Bool)

(assert (=> bm!44131 m!961843))

(assert (=> b!1041963 m!961815))

(assert (=> b!1041963 m!961815))

(declare-fun m!961845 () Bool)

(assert (=> b!1041963 m!961845))

(assert (=> b!1041961 m!961815))

(assert (=> b!1041961 m!961815))

(assert (=> b!1041961 m!961817))

(assert (=> b!1041806 d!126147))

(declare-fun mapNonEmpty!38689 () Bool)

(declare-fun mapRes!38689 () Bool)

(declare-fun tp!74252 () Bool)

(declare-fun e!590042 () Bool)

(assert (=> mapNonEmpty!38689 (= mapRes!38689 (and tp!74252 e!590042))))

(declare-fun mapValue!38689 () ValueCell!11663)

(declare-fun mapKey!38689 () (_ BitVec 32))

(declare-fun mapRest!38689 () (Array (_ BitVec 32) ValueCell!11663))

(assert (=> mapNonEmpty!38689 (= mapRest!38680 (store mapRest!38689 mapKey!38689 mapValue!38689))))

(declare-fun condMapEmpty!38689 () Bool)

(declare-fun mapDefault!38689 () ValueCell!11663)

(assert (=> mapNonEmpty!38680 (= condMapEmpty!38689 (= mapRest!38680 ((as const (Array (_ BitVec 32) ValueCell!11663)) mapDefault!38689)))))

(declare-fun e!590041 () Bool)

(assert (=> mapNonEmpty!38680 (= tp!74237 (and e!590041 mapRes!38689))))

(declare-fun mapIsEmpty!38689 () Bool)

(assert (=> mapIsEmpty!38689 mapRes!38689))

(declare-fun b!1041972 () Bool)

(assert (=> b!1041972 (= e!590041 tp_is_empty!24733)))

(declare-fun b!1041971 () Bool)

(assert (=> b!1041971 (= e!590042 tp_is_empty!24733)))

(assert (= (and mapNonEmpty!38680 condMapEmpty!38689) mapIsEmpty!38689))

(assert (= (and mapNonEmpty!38680 (not condMapEmpty!38689)) mapNonEmpty!38689))

(assert (= (and mapNonEmpty!38689 ((_ is ValueCellFull!11663) mapValue!38689)) b!1041971))

(assert (= (and mapNonEmpty!38680 ((_ is ValueCellFull!11663) mapDefault!38689)) b!1041972))

(declare-fun m!961847 () Bool)

(assert (=> mapNonEmpty!38689 m!961847))

(check-sat (not b!1041913) (not bm!44131) (not b!1041962) (not d!126135) (not b!1041953) (not b!1041884) (not b!1041925) (not b!1041955) (not bm!44126) (not b!1041961) (not b!1041952) (not bm!44123) (not bm!44129) (not b_next!21013) (not d!126133) b_and!33555 (not b!1041885) (not b!1041916) (not mapNonEmpty!38689) (not d!126143) (not b!1041912) (not b!1041956) (not b!1041943) (not b!1041911) (not d!126125) (not d!126141) (not b!1041901) (not bm!44130) (not b!1041963) (not b!1041940) (not b!1041937) tp_is_empty!24733 (not b!1041883))
(check-sat b_and!33555 (not b_next!21013))
