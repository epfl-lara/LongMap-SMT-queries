; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91606 () Bool)

(assert start!91606)

(declare-fun b!1042951 () Bool)

(declare-fun b_free!21043 () Bool)

(declare-fun b_next!21043 () Bool)

(assert (=> b!1042951 (= b_free!21043 (not b_next!21043))))

(declare-fun tp!74344 () Bool)

(declare-fun b_and!33585 () Bool)

(assert (=> b!1042951 (= tp!74344 b_and!33585)))

(declare-fun b!1042944 () Bool)

(declare-fun res!694728 () Bool)

(declare-fun e!590769 () Bool)

(assert (=> b!1042944 (=> (not res!694728) (not e!590769))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1042944 (= res!694728 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1042945 () Bool)

(declare-fun e!590771 () Bool)

(declare-datatypes ((V!37891 0))(
  ( (V!37892 (val!12432 Int)) )
))
(declare-datatypes ((ValueCell!11678 0))(
  ( (ValueCellFull!11678 (v!15017 V!37891)) (EmptyCell!11678) )
))
(declare-datatypes ((array!65723 0))(
  ( (array!65724 (arr!31615 (Array (_ BitVec 32) (_ BitVec 64))) (size!32149 (_ BitVec 32))) )
))
(declare-datatypes ((array!65725 0))(
  ( (array!65726 (arr!31616 (Array (_ BitVec 32) ValueCell!11678)) (size!32150 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5950 0))(
  ( (LongMapFixedSize!5951 (defaultEntry!6357 Int) (mask!30452 (_ BitVec 32)) (extraKeys!6085 (_ BitVec 32)) (zeroValue!6191 V!37891) (minValue!6191 V!37891) (_size!3030 (_ BitVec 32)) (_keys!11633 array!65723) (_values!6380 array!65725) (_vacant!3030 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5950)

(assert (=> b!1042945 (= e!590771 (or (not (= (size!32150 (_values!6380 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30452 thiss!1427)))) (not (= (size!32149 (_keys!11633 thiss!1427)) (size!32150 (_values!6380 thiss!1427)))) (bvslt (mask!30452 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!6085 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun res!694726 () Bool)

(assert (=> start!91606 (=> (not res!694726) (not e!590769))))

(declare-fun valid!2241 (LongMapFixedSize!5950) Bool)

(assert (=> start!91606 (= res!694726 (valid!2241 thiss!1427))))

(assert (=> start!91606 e!590769))

(declare-fun e!590770 () Bool)

(assert (=> start!91606 e!590770))

(assert (=> start!91606 true))

(declare-fun b!1042946 () Bool)

(declare-fun e!590765 () Bool)

(declare-fun tp_is_empty!24763 () Bool)

(assert (=> b!1042946 (= e!590765 tp_is_empty!24763)))

(declare-fun mapNonEmpty!38742 () Bool)

(declare-fun mapRes!38742 () Bool)

(declare-fun tp!74343 () Bool)

(assert (=> mapNonEmpty!38742 (= mapRes!38742 (and tp!74343 e!590765))))

(declare-fun mapValue!38742 () ValueCell!11678)

(declare-fun mapRest!38742 () (Array (_ BitVec 32) ValueCell!11678))

(declare-fun mapKey!38742 () (_ BitVec 32))

(assert (=> mapNonEmpty!38742 (= (arr!31616 (_values!6380 thiss!1427)) (store mapRest!38742 mapKey!38742 mapValue!38742))))

(declare-fun b!1042947 () Bool)

(declare-fun e!590768 () Bool)

(assert (=> b!1042947 (= e!590769 e!590768)))

(declare-fun res!694725 () Bool)

(assert (=> b!1042947 (=> (not res!694725) (not e!590768))))

(declare-datatypes ((SeekEntryResult!9765 0))(
  ( (MissingZero!9765 (index!41431 (_ BitVec 32))) (Found!9765 (index!41432 (_ BitVec 32))) (Intermediate!9765 (undefined!10577 Bool) (index!41433 (_ BitVec 32)) (x!92973 (_ BitVec 32))) (Undefined!9765) (MissingVacant!9765 (index!41434 (_ BitVec 32))) )
))
(declare-fun lt!459617 () SeekEntryResult!9765)

(get-info :version)

(assert (=> b!1042947 (= res!694725 ((_ is Found!9765) lt!459617))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65723 (_ BitVec 32)) SeekEntryResult!9765)

(assert (=> b!1042947 (= lt!459617 (seekEntry!0 key!909 (_keys!11633 thiss!1427) (mask!30452 thiss!1427)))))

(declare-fun b!1042948 () Bool)

(declare-fun e!590764 () Bool)

(declare-fun e!590767 () Bool)

(assert (=> b!1042948 (= e!590764 (and e!590767 mapRes!38742))))

(declare-fun condMapEmpty!38742 () Bool)

(declare-fun mapDefault!38742 () ValueCell!11678)

(assert (=> b!1042948 (= condMapEmpty!38742 (= (arr!31616 (_values!6380 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11678)) mapDefault!38742)))))

(declare-fun b!1042949 () Bool)

(assert (=> b!1042949 (= e!590768 (not e!590771))))

(declare-fun res!694727 () Bool)

(assert (=> b!1042949 (=> res!694727 e!590771)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042949 (= res!694727 (not (validMask!0 (mask!30452 thiss!1427))))))

(declare-fun lt!459616 () array!65723)

(declare-fun arrayContainsKey!0 (array!65723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042949 (not (arrayContainsKey!0 lt!459616 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34043 0))(
  ( (Unit!34044) )
))
(declare-fun lt!459615 () Unit!34043)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65723 (_ BitVec 32) (_ BitVec 64)) Unit!34043)

(assert (=> b!1042949 (= lt!459615 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11633 thiss!1427) (index!41432 lt!459617) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65723 (_ BitVec 32)) Bool)

(assert (=> b!1042949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459616 (mask!30452 thiss!1427))))

(declare-fun lt!459619 () Unit!34043)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65723 (_ BitVec 32) (_ BitVec 32)) Unit!34043)

(assert (=> b!1042949 (= lt!459619 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11633 thiss!1427) (index!41432 lt!459617) (mask!30452 thiss!1427)))))

(declare-datatypes ((List!21959 0))(
  ( (Nil!21956) (Cons!21955 (h!23170 (_ BitVec 64)) (t!31165 List!21959)) )
))
(declare-fun arrayNoDuplicates!0 (array!65723 (_ BitVec 32) List!21959) Bool)

(assert (=> b!1042949 (arrayNoDuplicates!0 lt!459616 #b00000000000000000000000000000000 Nil!21956)))

(declare-fun lt!459618 () Unit!34043)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65723 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21959) Unit!34043)

(assert (=> b!1042949 (= lt!459618 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11633 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41432 lt!459617) #b00000000000000000000000000000000 Nil!21956))))

(declare-fun arrayCountValidKeys!0 (array!65723 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042949 (= (arrayCountValidKeys!0 lt!459616 #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11633 thiss!1427) #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042949 (= lt!459616 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))))))

(declare-fun lt!459620 () Unit!34043)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65723 (_ BitVec 32) (_ BitVec 64)) Unit!34043)

(assert (=> b!1042949 (= lt!459620 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11633 thiss!1427) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38742 () Bool)

(assert (=> mapIsEmpty!38742 mapRes!38742))

(declare-fun b!1042950 () Bool)

(assert (=> b!1042950 (= e!590767 tp_is_empty!24763)))

(declare-fun array_inv!24443 (array!65723) Bool)

(declare-fun array_inv!24444 (array!65725) Bool)

(assert (=> b!1042951 (= e!590770 (and tp!74344 tp_is_empty!24763 (array_inv!24443 (_keys!11633 thiss!1427)) (array_inv!24444 (_values!6380 thiss!1427)) e!590764))))

(assert (= (and start!91606 res!694726) b!1042944))

(assert (= (and b!1042944 res!694728) b!1042947))

(assert (= (and b!1042947 res!694725) b!1042949))

(assert (= (and b!1042949 (not res!694727)) b!1042945))

(assert (= (and b!1042948 condMapEmpty!38742) mapIsEmpty!38742))

(assert (= (and b!1042948 (not condMapEmpty!38742)) mapNonEmpty!38742))

(assert (= (and mapNonEmpty!38742 ((_ is ValueCellFull!11678) mapValue!38742)) b!1042946))

(assert (= (and b!1042948 ((_ is ValueCellFull!11678) mapDefault!38742)) b!1042950))

(assert (= b!1042951 b!1042948))

(assert (= start!91606 b!1042951))

(declare-fun m!962701 () Bool)

(assert (=> b!1042947 m!962701))

(declare-fun m!962703 () Bool)

(assert (=> start!91606 m!962703))

(declare-fun m!962705 () Bool)

(assert (=> b!1042951 m!962705))

(declare-fun m!962707 () Bool)

(assert (=> b!1042951 m!962707))

(declare-fun m!962709 () Bool)

(assert (=> b!1042949 m!962709))

(declare-fun m!962711 () Bool)

(assert (=> b!1042949 m!962711))

(declare-fun m!962713 () Bool)

(assert (=> b!1042949 m!962713))

(declare-fun m!962715 () Bool)

(assert (=> b!1042949 m!962715))

(declare-fun m!962717 () Bool)

(assert (=> b!1042949 m!962717))

(declare-fun m!962719 () Bool)

(assert (=> b!1042949 m!962719))

(declare-fun m!962721 () Bool)

(assert (=> b!1042949 m!962721))

(declare-fun m!962723 () Bool)

(assert (=> b!1042949 m!962723))

(declare-fun m!962725 () Bool)

(assert (=> b!1042949 m!962725))

(declare-fun m!962727 () Bool)

(assert (=> b!1042949 m!962727))

(declare-fun m!962729 () Bool)

(assert (=> b!1042949 m!962729))

(declare-fun m!962731 () Bool)

(assert (=> mapNonEmpty!38742 m!962731))

(check-sat (not b_next!21043) (not b!1042947) (not b!1042949) b_and!33585 (not b!1042951) (not start!91606) (not mapNonEmpty!38742) tp_is_empty!24763)
(check-sat b_and!33585 (not b_next!21043))
(get-model)

(declare-fun d!126379 () Bool)

(declare-fun e!590822 () Bool)

(assert (=> d!126379 e!590822))

(declare-fun res!694755 () Bool)

(assert (=> d!126379 (=> (not res!694755) (not e!590822))))

(assert (=> d!126379 (= res!694755 (and (bvsge (index!41432 lt!459617) #b00000000000000000000000000000000) (bvslt (index!41432 lt!459617) (size!32149 (_keys!11633 thiss!1427)))))))

(declare-fun lt!459659 () Unit!34043)

(declare-fun choose!53 (array!65723 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21959) Unit!34043)

(assert (=> d!126379 (= lt!459659 (choose!53 (_keys!11633 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41432 lt!459617) #b00000000000000000000000000000000 Nil!21956))))

(assert (=> d!126379 (bvslt (size!32149 (_keys!11633 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126379 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11633 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41432 lt!459617) #b00000000000000000000000000000000 Nil!21956) lt!459659)))

(declare-fun b!1043002 () Bool)

(assert (=> b!1043002 (= e!590822 (arrayNoDuplicates!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) #b00000000000000000000000000000000 Nil!21956))))

(assert (= (and d!126379 res!694755) b!1043002))

(declare-fun m!962797 () Bool)

(assert (=> d!126379 m!962797))

(assert (=> b!1043002 m!962721))

(declare-fun m!962799 () Bool)

(assert (=> b!1043002 m!962799))

(assert (=> b!1042949 d!126379))

(declare-fun b!1043013 () Bool)

(declare-fun e!590827 () Bool)

(assert (=> b!1043013 (= e!590827 (bvslt (size!32149 (_keys!11633 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1043012 () Bool)

(declare-fun res!694764 () Bool)

(assert (=> b!1043012 (=> (not res!694764) (not e!590827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043012 (= res!694764 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1043014 () Bool)

(declare-fun e!590828 () Bool)

(assert (=> b!1043014 (= e!590828 (= (arrayCountValidKeys!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11633 thiss!1427) #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1043011 () Bool)

(declare-fun res!694767 () Bool)

(assert (=> b!1043011 (=> (not res!694767) (not e!590827))))

(assert (=> b!1043011 (= res!694767 (validKeyInArray!0 (select (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617))))))

(declare-fun d!126381 () Bool)

(assert (=> d!126381 e!590828))

(declare-fun res!694765 () Bool)

(assert (=> d!126381 (=> (not res!694765) (not e!590828))))

(assert (=> d!126381 (= res!694765 (and (bvsge (index!41432 lt!459617) #b00000000000000000000000000000000) (bvslt (index!41432 lt!459617) (size!32149 (_keys!11633 thiss!1427)))))))

(declare-fun lt!459662 () Unit!34043)

(declare-fun choose!82 (array!65723 (_ BitVec 32) (_ BitVec 64)) Unit!34043)

(assert (=> d!126381 (= lt!459662 (choose!82 (_keys!11633 thiss!1427) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126381 e!590827))

(declare-fun res!694766 () Bool)

(assert (=> d!126381 (=> (not res!694766) (not e!590827))))

(assert (=> d!126381 (= res!694766 (and (bvsge (index!41432 lt!459617) #b00000000000000000000000000000000) (bvslt (index!41432 lt!459617) (size!32149 (_keys!11633 thiss!1427)))))))

(assert (=> d!126381 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11633 thiss!1427) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459662)))

(assert (= (and d!126381 res!694766) b!1043011))

(assert (= (and b!1043011 res!694767) b!1043012))

(assert (= (and b!1043012 res!694764) b!1043013))

(assert (= (and d!126381 res!694765) b!1043014))

(declare-fun m!962801 () Bool)

(assert (=> b!1043012 m!962801))

(assert (=> b!1043014 m!962721))

(declare-fun m!962803 () Bool)

(assert (=> b!1043014 m!962803))

(assert (=> b!1043014 m!962727))

(declare-fun m!962805 () Bool)

(assert (=> b!1043011 m!962805))

(assert (=> b!1043011 m!962805))

(declare-fun m!962807 () Bool)

(assert (=> b!1043011 m!962807))

(declare-fun m!962809 () Bool)

(assert (=> d!126381 m!962809))

(assert (=> b!1042949 d!126381))

(declare-fun d!126383 () Bool)

(assert (=> d!126383 (= (validMask!0 (mask!30452 thiss!1427)) (and (or (= (mask!30452 thiss!1427) #b00000000000000000000000000000111) (= (mask!30452 thiss!1427) #b00000000000000000000000000001111) (= (mask!30452 thiss!1427) #b00000000000000000000000000011111) (= (mask!30452 thiss!1427) #b00000000000000000000000000111111) (= (mask!30452 thiss!1427) #b00000000000000000000000001111111) (= (mask!30452 thiss!1427) #b00000000000000000000000011111111) (= (mask!30452 thiss!1427) #b00000000000000000000000111111111) (= (mask!30452 thiss!1427) #b00000000000000000000001111111111) (= (mask!30452 thiss!1427) #b00000000000000000000011111111111) (= (mask!30452 thiss!1427) #b00000000000000000000111111111111) (= (mask!30452 thiss!1427) #b00000000000000000001111111111111) (= (mask!30452 thiss!1427) #b00000000000000000011111111111111) (= (mask!30452 thiss!1427) #b00000000000000000111111111111111) (= (mask!30452 thiss!1427) #b00000000000000001111111111111111) (= (mask!30452 thiss!1427) #b00000000000000011111111111111111) (= (mask!30452 thiss!1427) #b00000000000000111111111111111111) (= (mask!30452 thiss!1427) #b00000000000001111111111111111111) (= (mask!30452 thiss!1427) #b00000000000011111111111111111111) (= (mask!30452 thiss!1427) #b00000000000111111111111111111111) (= (mask!30452 thiss!1427) #b00000000001111111111111111111111) (= (mask!30452 thiss!1427) #b00000000011111111111111111111111) (= (mask!30452 thiss!1427) #b00000000111111111111111111111111) (= (mask!30452 thiss!1427) #b00000001111111111111111111111111) (= (mask!30452 thiss!1427) #b00000011111111111111111111111111) (= (mask!30452 thiss!1427) #b00000111111111111111111111111111) (= (mask!30452 thiss!1427) #b00001111111111111111111111111111) (= (mask!30452 thiss!1427) #b00011111111111111111111111111111) (= (mask!30452 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30452 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042949 d!126383))

(declare-fun b!1043023 () Bool)

(declare-fun e!590835 () Bool)

(declare-fun call!44195 () Bool)

(assert (=> b!1043023 (= e!590835 call!44195)))

(declare-fun b!1043024 () Bool)

(declare-fun e!590837 () Bool)

(assert (=> b!1043024 (= e!590837 call!44195)))

(declare-fun bm!44192 () Bool)

(assert (=> bm!44192 (= call!44195 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459616 (mask!30452 thiss!1427)))))

(declare-fun b!1043025 () Bool)

(declare-fun e!590836 () Bool)

(assert (=> b!1043025 (= e!590836 e!590835)))

(declare-fun c!106097 () Bool)

(assert (=> b!1043025 (= c!106097 (validKeyInArray!0 (select (arr!31615 lt!459616) #b00000000000000000000000000000000)))))

(declare-fun b!1043026 () Bool)

(assert (=> b!1043026 (= e!590835 e!590837)))

(declare-fun lt!459671 () (_ BitVec 64))

(assert (=> b!1043026 (= lt!459671 (select (arr!31615 lt!459616) #b00000000000000000000000000000000))))

(declare-fun lt!459670 () Unit!34043)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65723 (_ BitVec 64) (_ BitVec 32)) Unit!34043)

(assert (=> b!1043026 (= lt!459670 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459616 lt!459671 #b00000000000000000000000000000000))))

(assert (=> b!1043026 (arrayContainsKey!0 lt!459616 lt!459671 #b00000000000000000000000000000000)))

(declare-fun lt!459669 () Unit!34043)

(assert (=> b!1043026 (= lt!459669 lt!459670)))

(declare-fun res!694773 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65723 (_ BitVec 32)) SeekEntryResult!9765)

(assert (=> b!1043026 (= res!694773 (= (seekEntryOrOpen!0 (select (arr!31615 lt!459616) #b00000000000000000000000000000000) lt!459616 (mask!30452 thiss!1427)) (Found!9765 #b00000000000000000000000000000000)))))

(assert (=> b!1043026 (=> (not res!694773) (not e!590837))))

(declare-fun d!126385 () Bool)

(declare-fun res!694772 () Bool)

(assert (=> d!126385 (=> res!694772 e!590836)))

(assert (=> d!126385 (= res!694772 (bvsge #b00000000000000000000000000000000 (size!32149 lt!459616)))))

(assert (=> d!126385 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459616 (mask!30452 thiss!1427)) e!590836)))

(assert (= (and d!126385 (not res!694772)) b!1043025))

(assert (= (and b!1043025 c!106097) b!1043026))

(assert (= (and b!1043025 (not c!106097)) b!1043023))

(assert (= (and b!1043026 res!694773) b!1043024))

(assert (= (or b!1043024 b!1043023) bm!44192))

(declare-fun m!962811 () Bool)

(assert (=> bm!44192 m!962811))

(declare-fun m!962813 () Bool)

(assert (=> b!1043025 m!962813))

(assert (=> b!1043025 m!962813))

(declare-fun m!962815 () Bool)

(assert (=> b!1043025 m!962815))

(assert (=> b!1043026 m!962813))

(declare-fun m!962817 () Bool)

(assert (=> b!1043026 m!962817))

(declare-fun m!962819 () Bool)

(assert (=> b!1043026 m!962819))

(assert (=> b!1043026 m!962813))

(declare-fun m!962821 () Bool)

(assert (=> b!1043026 m!962821))

(assert (=> b!1042949 d!126385))

(declare-fun b!1043035 () Bool)

(declare-fun e!590842 () (_ BitVec 32))

(declare-fun e!590843 () (_ BitVec 32))

(assert (=> b!1043035 (= e!590842 e!590843)))

(declare-fun c!106102 () Bool)

(assert (=> b!1043035 (= c!106102 (validKeyInArray!0 (select (arr!31615 lt!459616) #b00000000000000000000000000000000)))))

(declare-fun b!1043036 () Bool)

(declare-fun call!44198 () (_ BitVec 32))

(assert (=> b!1043036 (= e!590843 call!44198)))

(declare-fun b!1043037 () Bool)

(assert (=> b!1043037 (= e!590843 (bvadd #b00000000000000000000000000000001 call!44198))))

(declare-fun bm!44195 () Bool)

(assert (=> bm!44195 (= call!44198 (arrayCountValidKeys!0 lt!459616 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))))))

(declare-fun d!126387 () Bool)

(declare-fun lt!459674 () (_ BitVec 32))

(assert (=> d!126387 (and (bvsge lt!459674 #b00000000000000000000000000000000) (bvsle lt!459674 (bvsub (size!32149 lt!459616) #b00000000000000000000000000000000)))))

(assert (=> d!126387 (= lt!459674 e!590842)))

(declare-fun c!106103 () Bool)

(assert (=> d!126387 (= c!106103 (bvsge #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))))))

(assert (=> d!126387 (and (bvsle #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32149 (_keys!11633 thiss!1427)) (size!32149 lt!459616)))))

(assert (=> d!126387 (= (arrayCountValidKeys!0 lt!459616 #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) lt!459674)))

(declare-fun b!1043038 () Bool)

(assert (=> b!1043038 (= e!590842 #b00000000000000000000000000000000)))

(assert (= (and d!126387 c!106103) b!1043038))

(assert (= (and d!126387 (not c!106103)) b!1043035))

(assert (= (and b!1043035 c!106102) b!1043037))

(assert (= (and b!1043035 (not c!106102)) b!1043036))

(assert (= (or b!1043037 b!1043036) bm!44195))

(assert (=> b!1043035 m!962813))

(assert (=> b!1043035 m!962813))

(assert (=> b!1043035 m!962815))

(declare-fun m!962823 () Bool)

(assert (=> bm!44195 m!962823))

(assert (=> b!1042949 d!126387))

(declare-fun b!1043049 () Bool)

(declare-fun e!590852 () Bool)

(declare-fun call!44201 () Bool)

(assert (=> b!1043049 (= e!590852 call!44201)))

(declare-fun d!126389 () Bool)

(declare-fun res!694782 () Bool)

(declare-fun e!590855 () Bool)

(assert (=> d!126389 (=> res!694782 e!590855)))

(assert (=> d!126389 (= res!694782 (bvsge #b00000000000000000000000000000000 (size!32149 lt!459616)))))

(assert (=> d!126389 (= (arrayNoDuplicates!0 lt!459616 #b00000000000000000000000000000000 Nil!21956) e!590855)))

(declare-fun bm!44198 () Bool)

(declare-fun c!106106 () Bool)

(assert (=> bm!44198 (= call!44201 (arrayNoDuplicates!0 lt!459616 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106106 (Cons!21955 (select (arr!31615 lt!459616) #b00000000000000000000000000000000) Nil!21956) Nil!21956)))))

(declare-fun b!1043050 () Bool)

(assert (=> b!1043050 (= e!590852 call!44201)))

(declare-fun b!1043051 () Bool)

(declare-fun e!590854 () Bool)

(assert (=> b!1043051 (= e!590854 e!590852)))

(assert (=> b!1043051 (= c!106106 (validKeyInArray!0 (select (arr!31615 lt!459616) #b00000000000000000000000000000000)))))

(declare-fun b!1043052 () Bool)

(declare-fun e!590853 () Bool)

(declare-fun contains!6081 (List!21959 (_ BitVec 64)) Bool)

(assert (=> b!1043052 (= e!590853 (contains!6081 Nil!21956 (select (arr!31615 lt!459616) #b00000000000000000000000000000000)))))

(declare-fun b!1043053 () Bool)

(assert (=> b!1043053 (= e!590855 e!590854)))

(declare-fun res!694780 () Bool)

(assert (=> b!1043053 (=> (not res!694780) (not e!590854))))

(assert (=> b!1043053 (= res!694780 (not e!590853))))

(declare-fun res!694781 () Bool)

(assert (=> b!1043053 (=> (not res!694781) (not e!590853))))

(assert (=> b!1043053 (= res!694781 (validKeyInArray!0 (select (arr!31615 lt!459616) #b00000000000000000000000000000000)))))

(assert (= (and d!126389 (not res!694782)) b!1043053))

(assert (= (and b!1043053 res!694781) b!1043052))

(assert (= (and b!1043053 res!694780) b!1043051))

(assert (= (and b!1043051 c!106106) b!1043050))

(assert (= (and b!1043051 (not c!106106)) b!1043049))

(assert (= (or b!1043050 b!1043049) bm!44198))

(assert (=> bm!44198 m!962813))

(declare-fun m!962825 () Bool)

(assert (=> bm!44198 m!962825))

(assert (=> b!1043051 m!962813))

(assert (=> b!1043051 m!962813))

(assert (=> b!1043051 m!962815))

(assert (=> b!1043052 m!962813))

(assert (=> b!1043052 m!962813))

(declare-fun m!962827 () Bool)

(assert (=> b!1043052 m!962827))

(assert (=> b!1043053 m!962813))

(assert (=> b!1043053 m!962813))

(assert (=> b!1043053 m!962815))

(assert (=> b!1042949 d!126389))

(declare-fun d!126391 () Bool)

(declare-fun res!694787 () Bool)

(declare-fun e!590860 () Bool)

(assert (=> d!126391 (=> res!694787 e!590860)))

(assert (=> d!126391 (= res!694787 (= (select (arr!31615 lt!459616) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126391 (= (arrayContainsKey!0 lt!459616 key!909 #b00000000000000000000000000000000) e!590860)))

(declare-fun b!1043058 () Bool)

(declare-fun e!590861 () Bool)

(assert (=> b!1043058 (= e!590860 e!590861)))

(declare-fun res!694788 () Bool)

(assert (=> b!1043058 (=> (not res!694788) (not e!590861))))

(assert (=> b!1043058 (= res!694788 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 lt!459616)))))

(declare-fun b!1043059 () Bool)

(assert (=> b!1043059 (= e!590861 (arrayContainsKey!0 lt!459616 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126391 (not res!694787)) b!1043058))

(assert (= (and b!1043058 res!694788) b!1043059))

(assert (=> d!126391 m!962813))

(declare-fun m!962829 () Bool)

(assert (=> b!1043059 m!962829))

(assert (=> b!1042949 d!126391))

(declare-fun d!126393 () Bool)

(declare-fun e!590864 () Bool)

(assert (=> d!126393 e!590864))

(declare-fun res!694791 () Bool)

(assert (=> d!126393 (=> (not res!694791) (not e!590864))))

(assert (=> d!126393 (= res!694791 (bvslt (index!41432 lt!459617) (size!32149 (_keys!11633 thiss!1427))))))

(declare-fun lt!459677 () Unit!34043)

(declare-fun choose!121 (array!65723 (_ BitVec 32) (_ BitVec 64)) Unit!34043)

(assert (=> d!126393 (= lt!459677 (choose!121 (_keys!11633 thiss!1427) (index!41432 lt!459617) key!909))))

(assert (=> d!126393 (bvsge (index!41432 lt!459617) #b00000000000000000000000000000000)))

(assert (=> d!126393 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11633 thiss!1427) (index!41432 lt!459617) key!909) lt!459677)))

(declare-fun b!1043062 () Bool)

(assert (=> b!1043062 (= e!590864 (not (arrayContainsKey!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126393 res!694791) b!1043062))

(declare-fun m!962831 () Bool)

(assert (=> d!126393 m!962831))

(assert (=> b!1043062 m!962721))

(declare-fun m!962833 () Bool)

(assert (=> b!1043062 m!962833))

(assert (=> b!1042949 d!126393))

(declare-fun b!1043063 () Bool)

(declare-fun e!590865 () (_ BitVec 32))

(declare-fun e!590866 () (_ BitVec 32))

(assert (=> b!1043063 (= e!590865 e!590866)))

(declare-fun c!106107 () Bool)

(assert (=> b!1043063 (= c!106107 (validKeyInArray!0 (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043064 () Bool)

(declare-fun call!44202 () (_ BitVec 32))

(assert (=> b!1043064 (= e!590866 call!44202)))

(declare-fun b!1043065 () Bool)

(assert (=> b!1043065 (= e!590866 (bvadd #b00000000000000000000000000000001 call!44202))))

(declare-fun bm!44199 () Bool)

(assert (=> bm!44199 (= call!44202 (arrayCountValidKeys!0 (_keys!11633 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))))))

(declare-fun d!126395 () Bool)

(declare-fun lt!459678 () (_ BitVec 32))

(assert (=> d!126395 (and (bvsge lt!459678 #b00000000000000000000000000000000) (bvsle lt!459678 (bvsub (size!32149 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126395 (= lt!459678 e!590865)))

(declare-fun c!106108 () Bool)

(assert (=> d!126395 (= c!106108 (bvsge #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))))))

(assert (=> d!126395 (and (bvsle #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32149 (_keys!11633 thiss!1427)) (size!32149 (_keys!11633 thiss!1427))))))

(assert (=> d!126395 (= (arrayCountValidKeys!0 (_keys!11633 thiss!1427) #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) lt!459678)))

(declare-fun b!1043066 () Bool)

(assert (=> b!1043066 (= e!590865 #b00000000000000000000000000000000)))

(assert (= (and d!126395 c!106108) b!1043066))

(assert (= (and d!126395 (not c!106108)) b!1043063))

(assert (= (and b!1043063 c!106107) b!1043065))

(assert (= (and b!1043063 (not c!106107)) b!1043064))

(assert (= (or b!1043065 b!1043064) bm!44199))

(declare-fun m!962835 () Bool)

(assert (=> b!1043063 m!962835))

(assert (=> b!1043063 m!962835))

(declare-fun m!962837 () Bool)

(assert (=> b!1043063 m!962837))

(declare-fun m!962839 () Bool)

(assert (=> bm!44199 m!962839))

(assert (=> b!1042949 d!126395))

(declare-fun d!126397 () Bool)

(declare-fun e!590869 () Bool)

(assert (=> d!126397 e!590869))

(declare-fun res!694794 () Bool)

(assert (=> d!126397 (=> (not res!694794) (not e!590869))))

(assert (=> d!126397 (= res!694794 (and (bvsge (index!41432 lt!459617) #b00000000000000000000000000000000) (bvslt (index!41432 lt!459617) (size!32149 (_keys!11633 thiss!1427)))))))

(declare-fun lt!459681 () Unit!34043)

(declare-fun choose!25 (array!65723 (_ BitVec 32) (_ BitVec 32)) Unit!34043)

(assert (=> d!126397 (= lt!459681 (choose!25 (_keys!11633 thiss!1427) (index!41432 lt!459617) (mask!30452 thiss!1427)))))

(assert (=> d!126397 (validMask!0 (mask!30452 thiss!1427))))

(assert (=> d!126397 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11633 thiss!1427) (index!41432 lt!459617) (mask!30452 thiss!1427)) lt!459681)))

(declare-fun b!1043069 () Bool)

(assert (=> b!1043069 (= e!590869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) (mask!30452 thiss!1427)))))

(assert (= (and d!126397 res!694794) b!1043069))

(declare-fun m!962841 () Bool)

(assert (=> d!126397 m!962841))

(assert (=> d!126397 m!962713))

(assert (=> b!1043069 m!962721))

(declare-fun m!962843 () Bool)

(assert (=> b!1043069 m!962843))

(assert (=> b!1042949 d!126397))

(declare-fun d!126399 () Bool)

(declare-fun res!694801 () Bool)

(declare-fun e!590872 () Bool)

(assert (=> d!126399 (=> (not res!694801) (not e!590872))))

(declare-fun simpleValid!439 (LongMapFixedSize!5950) Bool)

(assert (=> d!126399 (= res!694801 (simpleValid!439 thiss!1427))))

(assert (=> d!126399 (= (valid!2241 thiss!1427) e!590872)))

(declare-fun b!1043076 () Bool)

(declare-fun res!694802 () Bool)

(assert (=> b!1043076 (=> (not res!694802) (not e!590872))))

(assert (=> b!1043076 (= res!694802 (= (arrayCountValidKeys!0 (_keys!11633 thiss!1427) #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) (_size!3030 thiss!1427)))))

(declare-fun b!1043077 () Bool)

(declare-fun res!694803 () Bool)

(assert (=> b!1043077 (=> (not res!694803) (not e!590872))))

(assert (=> b!1043077 (= res!694803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11633 thiss!1427) (mask!30452 thiss!1427)))))

(declare-fun b!1043078 () Bool)

(assert (=> b!1043078 (= e!590872 (arrayNoDuplicates!0 (_keys!11633 thiss!1427) #b00000000000000000000000000000000 Nil!21956))))

(assert (= (and d!126399 res!694801) b!1043076))

(assert (= (and b!1043076 res!694802) b!1043077))

(assert (= (and b!1043077 res!694803) b!1043078))

(declare-fun m!962845 () Bool)

(assert (=> d!126399 m!962845))

(assert (=> b!1043076 m!962727))

(declare-fun m!962847 () Bool)

(assert (=> b!1043077 m!962847))

(declare-fun m!962849 () Bool)

(assert (=> b!1043078 m!962849))

(assert (=> start!91606 d!126399))

(declare-fun b!1043091 () Bool)

(declare-fun e!590880 () SeekEntryResult!9765)

(declare-fun lt!459690 () SeekEntryResult!9765)

(assert (=> b!1043091 (= e!590880 (MissingZero!9765 (index!41433 lt!459690)))))

(declare-fun b!1043092 () Bool)

(declare-fun c!106115 () Bool)

(declare-fun lt!459691 () (_ BitVec 64))

(assert (=> b!1043092 (= c!106115 (= lt!459691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590881 () SeekEntryResult!9765)

(assert (=> b!1043092 (= e!590881 e!590880)))

(declare-fun b!1043093 () Bool)

(declare-fun lt!459692 () SeekEntryResult!9765)

(assert (=> b!1043093 (= e!590880 (ite ((_ is MissingVacant!9765) lt!459692) (MissingZero!9765 (index!41434 lt!459692)) lt!459692))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65723 (_ BitVec 32)) SeekEntryResult!9765)

(assert (=> b!1043093 (= lt!459692 (seekKeyOrZeroReturnVacant!0 (x!92973 lt!459690) (index!41433 lt!459690) (index!41433 lt!459690) key!909 (_keys!11633 thiss!1427) (mask!30452 thiss!1427)))))

(declare-fun b!1043094 () Bool)

(declare-fun e!590879 () SeekEntryResult!9765)

(assert (=> b!1043094 (= e!590879 Undefined!9765)))

(declare-fun b!1043095 () Bool)

(assert (=> b!1043095 (= e!590879 e!590881)))

(assert (=> b!1043095 (= lt!459691 (select (arr!31615 (_keys!11633 thiss!1427)) (index!41433 lt!459690)))))

(declare-fun c!106116 () Bool)

(assert (=> b!1043095 (= c!106116 (= lt!459691 key!909))))

(declare-fun b!1043096 () Bool)

(assert (=> b!1043096 (= e!590881 (Found!9765 (index!41433 lt!459690)))))

(declare-fun d!126401 () Bool)

(declare-fun lt!459693 () SeekEntryResult!9765)

(assert (=> d!126401 (and (or ((_ is MissingVacant!9765) lt!459693) (not ((_ is Found!9765) lt!459693)) (and (bvsge (index!41432 lt!459693) #b00000000000000000000000000000000) (bvslt (index!41432 lt!459693) (size!32149 (_keys!11633 thiss!1427))))) (not ((_ is MissingVacant!9765) lt!459693)) (or (not ((_ is Found!9765) lt!459693)) (= (select (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459693)) key!909)))))

(assert (=> d!126401 (= lt!459693 e!590879)))

(declare-fun c!106117 () Bool)

(assert (=> d!126401 (= c!106117 (and ((_ is Intermediate!9765) lt!459690) (undefined!10577 lt!459690)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65723 (_ BitVec 32)) SeekEntryResult!9765)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126401 (= lt!459690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30452 thiss!1427)) key!909 (_keys!11633 thiss!1427) (mask!30452 thiss!1427)))))

(assert (=> d!126401 (validMask!0 (mask!30452 thiss!1427))))

(assert (=> d!126401 (= (seekEntry!0 key!909 (_keys!11633 thiss!1427) (mask!30452 thiss!1427)) lt!459693)))

(assert (= (and d!126401 c!106117) b!1043094))

(assert (= (and d!126401 (not c!106117)) b!1043095))

(assert (= (and b!1043095 c!106116) b!1043096))

(assert (= (and b!1043095 (not c!106116)) b!1043092))

(assert (= (and b!1043092 c!106115) b!1043091))

(assert (= (and b!1043092 (not c!106115)) b!1043093))

(declare-fun m!962851 () Bool)

(assert (=> b!1043093 m!962851))

(declare-fun m!962853 () Bool)

(assert (=> b!1043095 m!962853))

(declare-fun m!962855 () Bool)

(assert (=> d!126401 m!962855))

(declare-fun m!962857 () Bool)

(assert (=> d!126401 m!962857))

(assert (=> d!126401 m!962857))

(declare-fun m!962859 () Bool)

(assert (=> d!126401 m!962859))

(assert (=> d!126401 m!962713))

(assert (=> b!1042947 d!126401))

(declare-fun d!126403 () Bool)

(assert (=> d!126403 (= (array_inv!24443 (_keys!11633 thiss!1427)) (bvsge (size!32149 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042951 d!126403))

(declare-fun d!126405 () Bool)

(assert (=> d!126405 (= (array_inv!24444 (_values!6380 thiss!1427)) (bvsge (size!32150 (_values!6380 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042951 d!126405))

(declare-fun mapNonEmpty!38751 () Bool)

(declare-fun mapRes!38751 () Bool)

(declare-fun tp!74359 () Bool)

(declare-fun e!590886 () Bool)

(assert (=> mapNonEmpty!38751 (= mapRes!38751 (and tp!74359 e!590886))))

(declare-fun mapValue!38751 () ValueCell!11678)

(declare-fun mapRest!38751 () (Array (_ BitVec 32) ValueCell!11678))

(declare-fun mapKey!38751 () (_ BitVec 32))

(assert (=> mapNonEmpty!38751 (= mapRest!38742 (store mapRest!38751 mapKey!38751 mapValue!38751))))

(declare-fun b!1043103 () Bool)

(assert (=> b!1043103 (= e!590886 tp_is_empty!24763)))

(declare-fun condMapEmpty!38751 () Bool)

(declare-fun mapDefault!38751 () ValueCell!11678)

(assert (=> mapNonEmpty!38742 (= condMapEmpty!38751 (= mapRest!38742 ((as const (Array (_ BitVec 32) ValueCell!11678)) mapDefault!38751)))))

(declare-fun e!590887 () Bool)

(assert (=> mapNonEmpty!38742 (= tp!74343 (and e!590887 mapRes!38751))))

(declare-fun b!1043104 () Bool)

(assert (=> b!1043104 (= e!590887 tp_is_empty!24763)))

(declare-fun mapIsEmpty!38751 () Bool)

(assert (=> mapIsEmpty!38751 mapRes!38751))

(assert (= (and mapNonEmpty!38742 condMapEmpty!38751) mapIsEmpty!38751))

(assert (= (and mapNonEmpty!38742 (not condMapEmpty!38751)) mapNonEmpty!38751))

(assert (= (and mapNonEmpty!38751 ((_ is ValueCellFull!11678) mapValue!38751)) b!1043103))

(assert (= (and mapNonEmpty!38742 ((_ is ValueCellFull!11678) mapDefault!38751)) b!1043104))

(declare-fun m!962861 () Bool)

(assert (=> mapNonEmpty!38751 m!962861))

(check-sat (not b!1043078) (not b!1043035) (not b_next!21043) (not bm!44199) (not b!1043069) (not b!1043052) b_and!33585 (not mapNonEmpty!38751) (not d!126401) (not bm!44195) (not b!1043025) tp_is_empty!24763 (not b!1043093) (not b!1043012) (not d!126381) (not b!1043076) (not d!126379) (not b!1043062) (not b!1043059) (not d!126399) (not d!126393) (not b!1043051) (not b!1043011) (not d!126397) (not b!1043063) (not bm!44192) (not b!1043014) (not b!1043002) (not b!1043026) (not bm!44198) (not b!1043053) (not b!1043077))
(check-sat b_and!33585 (not b_next!21043))
(get-model)

(declare-fun b!1043105 () Bool)

(declare-fun e!590888 () Bool)

(declare-fun call!44203 () Bool)

(assert (=> b!1043105 (= e!590888 call!44203)))

(declare-fun d!126407 () Bool)

(declare-fun res!694806 () Bool)

(declare-fun e!590891 () Bool)

(assert (=> d!126407 (=> res!694806 e!590891)))

(assert (=> d!126407 (= res!694806 (bvsge #b00000000000000000000000000000000 (size!32149 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))))))))

(assert (=> d!126407 (= (arrayNoDuplicates!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) #b00000000000000000000000000000000 Nil!21956) e!590891)))

(declare-fun bm!44200 () Bool)

(declare-fun c!106118 () Bool)

(assert (=> bm!44200 (= call!44203 (arrayNoDuplicates!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106118 (Cons!21955 (select (arr!31615 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427)))) #b00000000000000000000000000000000) Nil!21956) Nil!21956)))))

(declare-fun b!1043106 () Bool)

(assert (=> b!1043106 (= e!590888 call!44203)))

(declare-fun b!1043107 () Bool)

(declare-fun e!590890 () Bool)

(assert (=> b!1043107 (= e!590890 e!590888)))

(assert (=> b!1043107 (= c!106118 (validKeyInArray!0 (select (arr!31615 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1043108 () Bool)

(declare-fun e!590889 () Bool)

(assert (=> b!1043108 (= e!590889 (contains!6081 Nil!21956 (select (arr!31615 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1043109 () Bool)

(assert (=> b!1043109 (= e!590891 e!590890)))

(declare-fun res!694804 () Bool)

(assert (=> b!1043109 (=> (not res!694804) (not e!590890))))

(assert (=> b!1043109 (= res!694804 (not e!590889))))

(declare-fun res!694805 () Bool)

(assert (=> b!1043109 (=> (not res!694805) (not e!590889))))

(assert (=> b!1043109 (= res!694805 (validKeyInArray!0 (select (arr!31615 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!126407 (not res!694806)) b!1043109))

(assert (= (and b!1043109 res!694805) b!1043108))

(assert (= (and b!1043109 res!694804) b!1043107))

(assert (= (and b!1043107 c!106118) b!1043106))

(assert (= (and b!1043107 (not c!106118)) b!1043105))

(assert (= (or b!1043106 b!1043105) bm!44200))

(declare-fun m!962863 () Bool)

(assert (=> bm!44200 m!962863))

(declare-fun m!962865 () Bool)

(assert (=> bm!44200 m!962865))

(assert (=> b!1043107 m!962863))

(assert (=> b!1043107 m!962863))

(declare-fun m!962867 () Bool)

(assert (=> b!1043107 m!962867))

(assert (=> b!1043108 m!962863))

(assert (=> b!1043108 m!962863))

(declare-fun m!962869 () Bool)

(assert (=> b!1043108 m!962869))

(assert (=> b!1043109 m!962863))

(assert (=> b!1043109 m!962863))

(assert (=> b!1043109 m!962867))

(assert (=> b!1043002 d!126407))

(declare-fun d!126409 () Bool)

(assert (=> d!126409 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1043012 d!126409))

(declare-fun b!1043110 () Bool)

(declare-fun e!590892 () Bool)

(declare-fun call!44204 () Bool)

(assert (=> b!1043110 (= e!590892 call!44204)))

(declare-fun d!126411 () Bool)

(declare-fun res!694809 () Bool)

(declare-fun e!590895 () Bool)

(assert (=> d!126411 (=> res!694809 e!590895)))

(assert (=> d!126411 (= res!694809 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 lt!459616)))))

(assert (=> d!126411 (= (arrayNoDuplicates!0 lt!459616 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106106 (Cons!21955 (select (arr!31615 lt!459616) #b00000000000000000000000000000000) Nil!21956) Nil!21956)) e!590895)))

(declare-fun bm!44201 () Bool)

(declare-fun c!106119 () Bool)

(assert (=> bm!44201 (= call!44204 (arrayNoDuplicates!0 lt!459616 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!106119 (Cons!21955 (select (arr!31615 lt!459616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!106106 (Cons!21955 (select (arr!31615 lt!459616) #b00000000000000000000000000000000) Nil!21956) Nil!21956)) (ite c!106106 (Cons!21955 (select (arr!31615 lt!459616) #b00000000000000000000000000000000) Nil!21956) Nil!21956))))))

(declare-fun b!1043111 () Bool)

(assert (=> b!1043111 (= e!590892 call!44204)))

(declare-fun b!1043112 () Bool)

(declare-fun e!590894 () Bool)

(assert (=> b!1043112 (= e!590894 e!590892)))

(assert (=> b!1043112 (= c!106119 (validKeyInArray!0 (select (arr!31615 lt!459616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1043113 () Bool)

(declare-fun e!590893 () Bool)

(assert (=> b!1043113 (= e!590893 (contains!6081 (ite c!106106 (Cons!21955 (select (arr!31615 lt!459616) #b00000000000000000000000000000000) Nil!21956) Nil!21956) (select (arr!31615 lt!459616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1043114 () Bool)

(assert (=> b!1043114 (= e!590895 e!590894)))

(declare-fun res!694807 () Bool)

(assert (=> b!1043114 (=> (not res!694807) (not e!590894))))

(assert (=> b!1043114 (= res!694807 (not e!590893))))

(declare-fun res!694808 () Bool)

(assert (=> b!1043114 (=> (not res!694808) (not e!590893))))

(assert (=> b!1043114 (= res!694808 (validKeyInArray!0 (select (arr!31615 lt!459616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!126411 (not res!694809)) b!1043114))

(assert (= (and b!1043114 res!694808) b!1043113))

(assert (= (and b!1043114 res!694807) b!1043112))

(assert (= (and b!1043112 c!106119) b!1043111))

(assert (= (and b!1043112 (not c!106119)) b!1043110))

(assert (= (or b!1043111 b!1043110) bm!44201))

(declare-fun m!962871 () Bool)

(assert (=> bm!44201 m!962871))

(declare-fun m!962873 () Bool)

(assert (=> bm!44201 m!962873))

(assert (=> b!1043112 m!962871))

(assert (=> b!1043112 m!962871))

(declare-fun m!962875 () Bool)

(assert (=> b!1043112 m!962875))

(assert (=> b!1043113 m!962871))

(assert (=> b!1043113 m!962871))

(declare-fun m!962877 () Bool)

(assert (=> b!1043113 m!962877))

(assert (=> b!1043114 m!962871))

(assert (=> b!1043114 m!962871))

(assert (=> b!1043114 m!962875))

(assert (=> bm!44198 d!126411))

(declare-fun d!126413 () Bool)

(assert (=> d!126413 (= (validKeyInArray!0 (select (arr!31615 lt!459616) #b00000000000000000000000000000000)) (and (not (= (select (arr!31615 lt!459616) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31615 lt!459616) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043025 d!126413))

(assert (=> b!1043053 d!126413))

(declare-fun d!126415 () Bool)

(assert (=> d!126415 (= (validKeyInArray!0 (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043063 d!126415))

(declare-fun d!126417 () Bool)

(declare-fun lt!459696 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!525 (List!21959) (InoxSet (_ BitVec 64)))

(assert (=> d!126417 (= lt!459696 (select (content!525 Nil!21956) (select (arr!31615 lt!459616) #b00000000000000000000000000000000)))))

(declare-fun e!590901 () Bool)

(assert (=> d!126417 (= lt!459696 e!590901)))

(declare-fun res!694814 () Bool)

(assert (=> d!126417 (=> (not res!694814) (not e!590901))))

(assert (=> d!126417 (= res!694814 ((_ is Cons!21955) Nil!21956))))

(assert (=> d!126417 (= (contains!6081 Nil!21956 (select (arr!31615 lt!459616) #b00000000000000000000000000000000)) lt!459696)))

(declare-fun b!1043119 () Bool)

(declare-fun e!590900 () Bool)

(assert (=> b!1043119 (= e!590901 e!590900)))

(declare-fun res!694815 () Bool)

(assert (=> b!1043119 (=> res!694815 e!590900)))

(assert (=> b!1043119 (= res!694815 (= (h!23170 Nil!21956) (select (arr!31615 lt!459616) #b00000000000000000000000000000000)))))

(declare-fun b!1043120 () Bool)

(assert (=> b!1043120 (= e!590900 (contains!6081 (t!31165 Nil!21956) (select (arr!31615 lt!459616) #b00000000000000000000000000000000)))))

(assert (= (and d!126417 res!694814) b!1043119))

(assert (= (and b!1043119 (not res!694815)) b!1043120))

(declare-fun m!962879 () Bool)

(assert (=> d!126417 m!962879))

(assert (=> d!126417 m!962813))

(declare-fun m!962881 () Bool)

(assert (=> d!126417 m!962881))

(assert (=> b!1043120 m!962813))

(declare-fun m!962883 () Bool)

(assert (=> b!1043120 m!962883))

(assert (=> b!1043052 d!126417))

(declare-fun b!1043121 () Bool)

(declare-fun e!590902 () Bool)

(declare-fun call!44205 () Bool)

(assert (=> b!1043121 (= e!590902 call!44205)))

(declare-fun b!1043122 () Bool)

(declare-fun e!590904 () Bool)

(assert (=> b!1043122 (= e!590904 call!44205)))

(declare-fun bm!44202 () Bool)

(assert (=> bm!44202 (= call!44205 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!459616 (mask!30452 thiss!1427)))))

(declare-fun b!1043123 () Bool)

(declare-fun e!590903 () Bool)

(assert (=> b!1043123 (= e!590903 e!590902)))

(declare-fun c!106120 () Bool)

(assert (=> b!1043123 (= c!106120 (validKeyInArray!0 (select (arr!31615 lt!459616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1043124 () Bool)

(assert (=> b!1043124 (= e!590902 e!590904)))

(declare-fun lt!459699 () (_ BitVec 64))

(assert (=> b!1043124 (= lt!459699 (select (arr!31615 lt!459616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!459698 () Unit!34043)

(assert (=> b!1043124 (= lt!459698 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459616 lt!459699 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1043124 (arrayContainsKey!0 lt!459616 lt!459699 #b00000000000000000000000000000000)))

(declare-fun lt!459697 () Unit!34043)

(assert (=> b!1043124 (= lt!459697 lt!459698)))

(declare-fun res!694817 () Bool)

(assert (=> b!1043124 (= res!694817 (= (seekEntryOrOpen!0 (select (arr!31615 lt!459616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!459616 (mask!30452 thiss!1427)) (Found!9765 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1043124 (=> (not res!694817) (not e!590904))))

(declare-fun d!126419 () Bool)

(declare-fun res!694816 () Bool)

(assert (=> d!126419 (=> res!694816 e!590903)))

(assert (=> d!126419 (= res!694816 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 lt!459616)))))

(assert (=> d!126419 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459616 (mask!30452 thiss!1427)) e!590903)))

(assert (= (and d!126419 (not res!694816)) b!1043123))

(assert (= (and b!1043123 c!106120) b!1043124))

(assert (= (and b!1043123 (not c!106120)) b!1043121))

(assert (= (and b!1043124 res!694817) b!1043122))

(assert (= (or b!1043122 b!1043121) bm!44202))

(declare-fun m!962885 () Bool)

(assert (=> bm!44202 m!962885))

(assert (=> b!1043123 m!962871))

(assert (=> b!1043123 m!962871))

(assert (=> b!1043123 m!962875))

(assert (=> b!1043124 m!962871))

(declare-fun m!962887 () Bool)

(assert (=> b!1043124 m!962887))

(declare-fun m!962889 () Bool)

(assert (=> b!1043124 m!962889))

(assert (=> b!1043124 m!962871))

(declare-fun m!962891 () Bool)

(assert (=> b!1043124 m!962891))

(assert (=> bm!44192 d!126419))

(declare-fun d!126421 () Bool)

(assert (=> d!126421 (arrayNoDuplicates!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) #b00000000000000000000000000000000 Nil!21956)))

(assert (=> d!126421 true))

(declare-fun _$66!53 () Unit!34043)

(assert (=> d!126421 (= (choose!53 (_keys!11633 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41432 lt!459617) #b00000000000000000000000000000000 Nil!21956) _$66!53)))

(declare-fun bs!30486 () Bool)

(assert (= bs!30486 d!126421))

(assert (=> bs!30486 m!962721))

(assert (=> bs!30486 m!962799))

(assert (=> d!126379 d!126421))

(declare-fun b!1043125 () Bool)

(declare-fun e!590905 () (_ BitVec 32))

(declare-fun e!590906 () (_ BitVec 32))

(assert (=> b!1043125 (= e!590905 e!590906)))

(declare-fun c!106121 () Bool)

(assert (=> b!1043125 (= c!106121 (validKeyInArray!0 (select (arr!31615 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1043126 () Bool)

(declare-fun call!44206 () (_ BitVec 32))

(assert (=> b!1043126 (= e!590906 call!44206)))

(declare-fun b!1043127 () Bool)

(assert (=> b!1043127 (= e!590906 (bvadd #b00000000000000000000000000000001 call!44206))))

(declare-fun bm!44203 () Bool)

(assert (=> bm!44203 (= call!44206 (arrayCountValidKeys!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))))))

(declare-fun d!126423 () Bool)

(declare-fun lt!459700 () (_ BitVec 32))

(assert (=> d!126423 (and (bvsge lt!459700 #b00000000000000000000000000000000) (bvsle lt!459700 (bvsub (size!32149 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!126423 (= lt!459700 e!590905)))

(declare-fun c!106122 () Bool)

(assert (=> d!126423 (= c!106122 (bvsge #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))))))

(assert (=> d!126423 (and (bvsle #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32149 (_keys!11633 thiss!1427)) (size!32149 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))))))))

(assert (=> d!126423 (= (arrayCountValidKeys!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) lt!459700)))

(declare-fun b!1043128 () Bool)

(assert (=> b!1043128 (= e!590905 #b00000000000000000000000000000000)))

(assert (= (and d!126423 c!106122) b!1043128))

(assert (= (and d!126423 (not c!106122)) b!1043125))

(assert (= (and b!1043125 c!106121) b!1043127))

(assert (= (and b!1043125 (not c!106121)) b!1043126))

(assert (= (or b!1043127 b!1043126) bm!44203))

(assert (=> b!1043125 m!962863))

(assert (=> b!1043125 m!962863))

(assert (=> b!1043125 m!962867))

(declare-fun m!962893 () Bool)

(assert (=> bm!44203 m!962893))

(assert (=> b!1043014 d!126423))

(assert (=> b!1043014 d!126395))

(assert (=> b!1043051 d!126413))

(declare-fun d!126425 () Bool)

(assert (=> d!126425 (= (arrayCountValidKeys!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11633 thiss!1427) #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!126425 true))

(declare-fun _$79!29 () Unit!34043)

(assert (=> d!126425 (= (choose!82 (_keys!11633 thiss!1427) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!29)))

(declare-fun bs!30487 () Bool)

(assert (= bs!30487 d!126425))

(assert (=> bs!30487 m!962721))

(assert (=> bs!30487 m!962803))

(assert (=> bs!30487 m!962727))

(assert (=> d!126381 d!126425))

(declare-fun b!1043147 () Bool)

(declare-fun lt!459705 () SeekEntryResult!9765)

(assert (=> b!1043147 (and (bvsge (index!41433 lt!459705) #b00000000000000000000000000000000) (bvslt (index!41433 lt!459705) (size!32149 (_keys!11633 thiss!1427))))))

(declare-fun e!590917 () Bool)

(assert (=> b!1043147 (= e!590917 (= (select (arr!31615 (_keys!11633 thiss!1427)) (index!41433 lt!459705)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043148 () Bool)

(declare-fun e!590921 () SeekEntryResult!9765)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043148 (= e!590921 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30452 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!30452 thiss!1427)) key!909 (_keys!11633 thiss!1427) (mask!30452 thiss!1427)))))

(declare-fun b!1043149 () Bool)

(declare-fun e!590920 () Bool)

(assert (=> b!1043149 (= e!590920 (bvsge (x!92973 lt!459705) #b01111111111111111111111111111110))))

(declare-fun b!1043151 () Bool)

(declare-fun e!590918 () Bool)

(assert (=> b!1043151 (= e!590920 e!590918)))

(declare-fun res!694825 () Bool)

(assert (=> b!1043151 (= res!694825 (and ((_ is Intermediate!9765) lt!459705) (not (undefined!10577 lt!459705)) (bvslt (x!92973 lt!459705) #b01111111111111111111111111111110) (bvsge (x!92973 lt!459705) #b00000000000000000000000000000000) (bvsge (x!92973 lt!459705) #b00000000000000000000000000000000)))))

(assert (=> b!1043151 (=> (not res!694825) (not e!590918))))

(declare-fun b!1043152 () Bool)

(declare-fun e!590919 () SeekEntryResult!9765)

(assert (=> b!1043152 (= e!590919 (Intermediate!9765 true (toIndex!0 key!909 (mask!30452 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1043153 () Bool)

(assert (=> b!1043153 (= e!590921 (Intermediate!9765 false (toIndex!0 key!909 (mask!30452 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1043154 () Bool)

(assert (=> b!1043154 (= e!590919 e!590921)))

(declare-fun c!106130 () Bool)

(declare-fun lt!459706 () (_ BitVec 64))

(assert (=> b!1043154 (= c!106130 (or (= lt!459706 key!909) (= (bvadd lt!459706 lt!459706) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1043155 () Bool)

(assert (=> b!1043155 (and (bvsge (index!41433 lt!459705) #b00000000000000000000000000000000) (bvslt (index!41433 lt!459705) (size!32149 (_keys!11633 thiss!1427))))))

(declare-fun res!694824 () Bool)

(assert (=> b!1043155 (= res!694824 (= (select (arr!31615 (_keys!11633 thiss!1427)) (index!41433 lt!459705)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043155 (=> res!694824 e!590917)))

(declare-fun b!1043150 () Bool)

(assert (=> b!1043150 (and (bvsge (index!41433 lt!459705) #b00000000000000000000000000000000) (bvslt (index!41433 lt!459705) (size!32149 (_keys!11633 thiss!1427))))))

(declare-fun res!694826 () Bool)

(assert (=> b!1043150 (= res!694826 (= (select (arr!31615 (_keys!11633 thiss!1427)) (index!41433 lt!459705)) key!909))))

(assert (=> b!1043150 (=> res!694826 e!590917)))

(assert (=> b!1043150 (= e!590918 e!590917)))

(declare-fun d!126427 () Bool)

(assert (=> d!126427 e!590920))

(declare-fun c!106129 () Bool)

(assert (=> d!126427 (= c!106129 (and ((_ is Intermediate!9765) lt!459705) (undefined!10577 lt!459705)))))

(assert (=> d!126427 (= lt!459705 e!590919)))

(declare-fun c!106131 () Bool)

(assert (=> d!126427 (= c!106131 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!126427 (= lt!459706 (select (arr!31615 (_keys!11633 thiss!1427)) (toIndex!0 key!909 (mask!30452 thiss!1427))))))

(assert (=> d!126427 (validMask!0 (mask!30452 thiss!1427))))

(assert (=> d!126427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30452 thiss!1427)) key!909 (_keys!11633 thiss!1427) (mask!30452 thiss!1427)) lt!459705)))

(assert (= (and d!126427 c!106131) b!1043152))

(assert (= (and d!126427 (not c!106131)) b!1043154))

(assert (= (and b!1043154 c!106130) b!1043153))

(assert (= (and b!1043154 (not c!106130)) b!1043148))

(assert (= (and d!126427 c!106129) b!1043149))

(assert (= (and d!126427 (not c!106129)) b!1043151))

(assert (= (and b!1043151 res!694825) b!1043150))

(assert (= (and b!1043150 (not res!694826)) b!1043155))

(assert (= (and b!1043155 (not res!694824)) b!1043147))

(declare-fun m!962895 () Bool)

(assert (=> b!1043150 m!962895))

(assert (=> d!126427 m!962857))

(declare-fun m!962897 () Bool)

(assert (=> d!126427 m!962897))

(assert (=> d!126427 m!962713))

(assert (=> b!1043155 m!962895))

(assert (=> b!1043147 m!962895))

(assert (=> b!1043148 m!962857))

(declare-fun m!962899 () Bool)

(assert (=> b!1043148 m!962899))

(assert (=> b!1043148 m!962899))

(declare-fun m!962901 () Bool)

(assert (=> b!1043148 m!962901))

(assert (=> d!126401 d!126427))

(declare-fun d!126429 () Bool)

(declare-fun lt!459712 () (_ BitVec 32))

(declare-fun lt!459711 () (_ BitVec 32))

(assert (=> d!126429 (= lt!459712 (bvmul (bvxor lt!459711 (bvlshr lt!459711 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!126429 (= lt!459711 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!126429 (and (bvsge (mask!30452 thiss!1427) #b00000000000000000000000000000000) (let ((res!694827 (let ((h!23173 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92991 (bvmul (bvxor h!23173 (bvlshr h!23173 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92991 (bvlshr x!92991 #b00000000000000000000000000001101)) (mask!30452 thiss!1427)))))) (and (bvslt res!694827 (bvadd (mask!30452 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!694827 #b00000000000000000000000000000000))))))

(assert (=> d!126429 (= (toIndex!0 key!909 (mask!30452 thiss!1427)) (bvand (bvxor lt!459712 (bvlshr lt!459712 #b00000000000000000000000000001101)) (mask!30452 thiss!1427)))))

(assert (=> d!126401 d!126429))

(assert (=> d!126401 d!126383))

(declare-fun b!1043156 () Bool)

(declare-fun e!590922 () (_ BitVec 32))

(declare-fun e!590923 () (_ BitVec 32))

(assert (=> b!1043156 (= e!590922 e!590923)))

(declare-fun c!106132 () Bool)

(assert (=> b!1043156 (= c!106132 (validKeyInArray!0 (select (arr!31615 (_keys!11633 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1043157 () Bool)

(declare-fun call!44207 () (_ BitVec 32))

(assert (=> b!1043157 (= e!590923 call!44207)))

(declare-fun b!1043158 () Bool)

(assert (=> b!1043158 (= e!590923 (bvadd #b00000000000000000000000000000001 call!44207))))

(declare-fun bm!44204 () Bool)

(assert (=> bm!44204 (= call!44207 (arrayCountValidKeys!0 (_keys!11633 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))))))

(declare-fun d!126431 () Bool)

(declare-fun lt!459713 () (_ BitVec 32))

(assert (=> d!126431 (and (bvsge lt!459713 #b00000000000000000000000000000000) (bvsle lt!459713 (bvsub (size!32149 (_keys!11633 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!126431 (= lt!459713 e!590922)))

(declare-fun c!106133 () Bool)

(assert (=> d!126431 (= c!106133 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))))))

(assert (=> d!126431 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32149 (_keys!11633 thiss!1427)) (size!32149 (_keys!11633 thiss!1427))))))

(assert (=> d!126431 (= (arrayCountValidKeys!0 (_keys!11633 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))) lt!459713)))

(declare-fun b!1043159 () Bool)

(assert (=> b!1043159 (= e!590922 #b00000000000000000000000000000000)))

(assert (= (and d!126431 c!106133) b!1043159))

(assert (= (and d!126431 (not c!106133)) b!1043156))

(assert (= (and b!1043156 c!106132) b!1043158))

(assert (= (and b!1043156 (not c!106132)) b!1043157))

(assert (= (or b!1043158 b!1043157) bm!44204))

(declare-fun m!962903 () Bool)

(assert (=> b!1043156 m!962903))

(assert (=> b!1043156 m!962903))

(declare-fun m!962905 () Bool)

(assert (=> b!1043156 m!962905))

(declare-fun m!962907 () Bool)

(assert (=> bm!44204 m!962907))

(assert (=> bm!44199 d!126431))

(declare-fun d!126433 () Bool)

(assert (=> d!126433 (arrayContainsKey!0 lt!459616 lt!459671 #b00000000000000000000000000000000)))

(declare-fun lt!459716 () Unit!34043)

(declare-fun choose!13 (array!65723 (_ BitVec 64) (_ BitVec 32)) Unit!34043)

(assert (=> d!126433 (= lt!459716 (choose!13 lt!459616 lt!459671 #b00000000000000000000000000000000))))

(assert (=> d!126433 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!126433 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459616 lt!459671 #b00000000000000000000000000000000) lt!459716)))

(declare-fun bs!30488 () Bool)

(assert (= bs!30488 d!126433))

(assert (=> bs!30488 m!962819))

(declare-fun m!962909 () Bool)

(assert (=> bs!30488 m!962909))

(assert (=> b!1043026 d!126433))

(declare-fun d!126435 () Bool)

(declare-fun res!694828 () Bool)

(declare-fun e!590924 () Bool)

(assert (=> d!126435 (=> res!694828 e!590924)))

(assert (=> d!126435 (= res!694828 (= (select (arr!31615 lt!459616) #b00000000000000000000000000000000) lt!459671))))

(assert (=> d!126435 (= (arrayContainsKey!0 lt!459616 lt!459671 #b00000000000000000000000000000000) e!590924)))

(declare-fun b!1043160 () Bool)

(declare-fun e!590925 () Bool)

(assert (=> b!1043160 (= e!590924 e!590925)))

(declare-fun res!694829 () Bool)

(assert (=> b!1043160 (=> (not res!694829) (not e!590925))))

(assert (=> b!1043160 (= res!694829 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 lt!459616)))))

(declare-fun b!1043161 () Bool)

(assert (=> b!1043161 (= e!590925 (arrayContainsKey!0 lt!459616 lt!459671 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126435 (not res!694828)) b!1043160))

(assert (= (and b!1043160 res!694829) b!1043161))

(assert (=> d!126435 m!962813))

(declare-fun m!962911 () Bool)

(assert (=> b!1043161 m!962911))

(assert (=> b!1043026 d!126435))

(declare-fun b!1043174 () Bool)

(declare-fun c!106141 () Bool)

(declare-fun lt!459723 () (_ BitVec 64))

(assert (=> b!1043174 (= c!106141 (= lt!459723 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590934 () SeekEntryResult!9765)

(declare-fun e!590933 () SeekEntryResult!9765)

(assert (=> b!1043174 (= e!590934 e!590933)))

(declare-fun b!1043175 () Bool)

(declare-fun e!590932 () SeekEntryResult!9765)

(assert (=> b!1043175 (= e!590932 e!590934)))

(declare-fun lt!459725 () SeekEntryResult!9765)

(assert (=> b!1043175 (= lt!459723 (select (arr!31615 lt!459616) (index!41433 lt!459725)))))

(declare-fun c!106142 () Bool)

(assert (=> b!1043175 (= c!106142 (= lt!459723 (select (arr!31615 lt!459616) #b00000000000000000000000000000000)))))

(declare-fun b!1043176 () Bool)

(assert (=> b!1043176 (= e!590933 (MissingZero!9765 (index!41433 lt!459725)))))

(declare-fun b!1043177 () Bool)

(assert (=> b!1043177 (= e!590932 Undefined!9765)))

(declare-fun b!1043179 () Bool)

(assert (=> b!1043179 (= e!590934 (Found!9765 (index!41433 lt!459725)))))

(declare-fun b!1043178 () Bool)

(assert (=> b!1043178 (= e!590933 (seekKeyOrZeroReturnVacant!0 (x!92973 lt!459725) (index!41433 lt!459725) (index!41433 lt!459725) (select (arr!31615 lt!459616) #b00000000000000000000000000000000) lt!459616 (mask!30452 thiss!1427)))))

(declare-fun d!126437 () Bool)

(declare-fun lt!459724 () SeekEntryResult!9765)

(assert (=> d!126437 (and (or ((_ is Undefined!9765) lt!459724) (not ((_ is Found!9765) lt!459724)) (and (bvsge (index!41432 lt!459724) #b00000000000000000000000000000000) (bvslt (index!41432 lt!459724) (size!32149 lt!459616)))) (or ((_ is Undefined!9765) lt!459724) ((_ is Found!9765) lt!459724) (not ((_ is MissingZero!9765) lt!459724)) (and (bvsge (index!41431 lt!459724) #b00000000000000000000000000000000) (bvslt (index!41431 lt!459724) (size!32149 lt!459616)))) (or ((_ is Undefined!9765) lt!459724) ((_ is Found!9765) lt!459724) ((_ is MissingZero!9765) lt!459724) (not ((_ is MissingVacant!9765) lt!459724)) (and (bvsge (index!41434 lt!459724) #b00000000000000000000000000000000) (bvslt (index!41434 lt!459724) (size!32149 lt!459616)))) (or ((_ is Undefined!9765) lt!459724) (ite ((_ is Found!9765) lt!459724) (= (select (arr!31615 lt!459616) (index!41432 lt!459724)) (select (arr!31615 lt!459616) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9765) lt!459724) (= (select (arr!31615 lt!459616) (index!41431 lt!459724)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9765) lt!459724) (= (select (arr!31615 lt!459616) (index!41434 lt!459724)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!126437 (= lt!459724 e!590932)))

(declare-fun c!106140 () Bool)

(assert (=> d!126437 (= c!106140 (and ((_ is Intermediate!9765) lt!459725) (undefined!10577 lt!459725)))))

(assert (=> d!126437 (= lt!459725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31615 lt!459616) #b00000000000000000000000000000000) (mask!30452 thiss!1427)) (select (arr!31615 lt!459616) #b00000000000000000000000000000000) lt!459616 (mask!30452 thiss!1427)))))

(assert (=> d!126437 (validMask!0 (mask!30452 thiss!1427))))

(assert (=> d!126437 (= (seekEntryOrOpen!0 (select (arr!31615 lt!459616) #b00000000000000000000000000000000) lt!459616 (mask!30452 thiss!1427)) lt!459724)))

(assert (= (and d!126437 c!106140) b!1043177))

(assert (= (and d!126437 (not c!106140)) b!1043175))

(assert (= (and b!1043175 c!106142) b!1043179))

(assert (= (and b!1043175 (not c!106142)) b!1043174))

(assert (= (and b!1043174 c!106141) b!1043176))

(assert (= (and b!1043174 (not c!106141)) b!1043178))

(declare-fun m!962913 () Bool)

(assert (=> b!1043175 m!962913))

(assert (=> b!1043178 m!962813))

(declare-fun m!962915 () Bool)

(assert (=> b!1043178 m!962915))

(declare-fun m!962917 () Bool)

(assert (=> d!126437 m!962917))

(declare-fun m!962919 () Bool)

(assert (=> d!126437 m!962919))

(assert (=> d!126437 m!962713))

(declare-fun m!962921 () Bool)

(assert (=> d!126437 m!962921))

(assert (=> d!126437 m!962813))

(declare-fun m!962923 () Bool)

(assert (=> d!126437 m!962923))

(assert (=> d!126437 m!962813))

(assert (=> d!126437 m!962921))

(declare-fun m!962925 () Bool)

(assert (=> d!126437 m!962925))

(assert (=> b!1043026 d!126437))

(declare-fun d!126439 () Bool)

(declare-fun res!694830 () Bool)

(declare-fun e!590935 () Bool)

(assert (=> d!126439 (=> res!694830 e!590935)))

(assert (=> d!126439 (= res!694830 (= (select (arr!31615 lt!459616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!126439 (= (arrayContainsKey!0 lt!459616 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!590935)))

(declare-fun b!1043180 () Bool)

(declare-fun e!590936 () Bool)

(assert (=> b!1043180 (= e!590935 e!590936)))

(declare-fun res!694831 () Bool)

(assert (=> b!1043180 (=> (not res!694831) (not e!590936))))

(assert (=> b!1043180 (= res!694831 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32149 lt!459616)))))

(declare-fun b!1043181 () Bool)

(assert (=> b!1043181 (= e!590936 (arrayContainsKey!0 lt!459616 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!126439 (not res!694830)) b!1043180))

(assert (= (and b!1043180 res!694831) b!1043181))

(assert (=> d!126439 m!962871))

(declare-fun m!962927 () Bool)

(assert (=> b!1043181 m!962927))

(assert (=> b!1043059 d!126439))

(declare-fun d!126441 () Bool)

(declare-fun res!694832 () Bool)

(declare-fun e!590937 () Bool)

(assert (=> d!126441 (=> res!694832 e!590937)))

(assert (=> d!126441 (= res!694832 (= (select (arr!31615 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126441 (= (arrayContainsKey!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) key!909 #b00000000000000000000000000000000) e!590937)))

(declare-fun b!1043182 () Bool)

(declare-fun e!590938 () Bool)

(assert (=> b!1043182 (= e!590937 e!590938)))

(declare-fun res!694833 () Bool)

(assert (=> b!1043182 (=> (not res!694833) (not e!590938))))

(assert (=> b!1043182 (= res!694833 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))))))))

(declare-fun b!1043183 () Bool)

(assert (=> b!1043183 (= e!590938 (arrayContainsKey!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126441 (not res!694832)) b!1043182))

(assert (= (and b!1043182 res!694833) b!1043183))

(assert (=> d!126441 m!962863))

(declare-fun m!962929 () Bool)

(assert (=> b!1043183 m!962929))

(assert (=> b!1043062 d!126441))

(declare-fun b!1043184 () Bool)

(declare-fun e!590939 () Bool)

(declare-fun call!44208 () Bool)

(assert (=> b!1043184 (= e!590939 call!44208)))

(declare-fun b!1043185 () Bool)

(declare-fun e!590941 () Bool)

(assert (=> b!1043185 (= e!590941 call!44208)))

(declare-fun bm!44205 () Bool)

(assert (=> bm!44205 (= call!44208 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) (mask!30452 thiss!1427)))))

(declare-fun b!1043186 () Bool)

(declare-fun e!590940 () Bool)

(assert (=> b!1043186 (= e!590940 e!590939)))

(declare-fun c!106143 () Bool)

(assert (=> b!1043186 (= c!106143 (validKeyInArray!0 (select (arr!31615 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1043187 () Bool)

(assert (=> b!1043187 (= e!590939 e!590941)))

(declare-fun lt!459728 () (_ BitVec 64))

(assert (=> b!1043187 (= lt!459728 (select (arr!31615 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!459727 () Unit!34043)

(assert (=> b!1043187 (= lt!459727 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) lt!459728 #b00000000000000000000000000000000))))

(assert (=> b!1043187 (arrayContainsKey!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) lt!459728 #b00000000000000000000000000000000)))

(declare-fun lt!459726 () Unit!34043)

(assert (=> b!1043187 (= lt!459726 lt!459727)))

(declare-fun res!694835 () Bool)

(assert (=> b!1043187 (= res!694835 (= (seekEntryOrOpen!0 (select (arr!31615 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427)))) #b00000000000000000000000000000000) (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) (mask!30452 thiss!1427)) (Found!9765 #b00000000000000000000000000000000)))))

(assert (=> b!1043187 (=> (not res!694835) (not e!590941))))

(declare-fun d!126443 () Bool)

(declare-fun res!694834 () Bool)

(assert (=> d!126443 (=> res!694834 e!590940)))

(assert (=> d!126443 (= res!694834 (bvsge #b00000000000000000000000000000000 (size!32149 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))))))))

(assert (=> d!126443 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) (mask!30452 thiss!1427)) e!590940)))

(assert (= (and d!126443 (not res!694834)) b!1043186))

(assert (= (and b!1043186 c!106143) b!1043187))

(assert (= (and b!1043186 (not c!106143)) b!1043184))

(assert (= (and b!1043187 res!694835) b!1043185))

(assert (= (or b!1043185 b!1043184) bm!44205))

(declare-fun m!962931 () Bool)

(assert (=> bm!44205 m!962931))

(assert (=> b!1043186 m!962863))

(assert (=> b!1043186 m!962863))

(assert (=> b!1043186 m!962867))

(assert (=> b!1043187 m!962863))

(declare-fun m!962933 () Bool)

(assert (=> b!1043187 m!962933))

(declare-fun m!962935 () Bool)

(assert (=> b!1043187 m!962935))

(assert (=> b!1043187 m!962863))

(declare-fun m!962937 () Bool)

(assert (=> b!1043187 m!962937))

(assert (=> b!1043069 d!126443))

(assert (=> b!1043035 d!126413))

(declare-fun b!1043200 () Bool)

(declare-fun e!590950 () SeekEntryResult!9765)

(assert (=> b!1043200 (= e!590950 (Found!9765 (index!41433 lt!459690)))))

(declare-fun b!1043202 () Bool)

(declare-fun e!590948 () SeekEntryResult!9765)

(assert (=> b!1043202 (= e!590948 e!590950)))

(declare-fun c!106152 () Bool)

(declare-fun lt!459733 () (_ BitVec 64))

(assert (=> b!1043202 (= c!106152 (= lt!459733 key!909))))

(declare-fun b!1043203 () Bool)

(declare-fun e!590949 () SeekEntryResult!9765)

(assert (=> b!1043203 (= e!590949 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92973 lt!459690) #b00000000000000000000000000000001) (nextIndex!0 (index!41433 lt!459690) (bvadd (x!92973 lt!459690) #b00000000000000000000000000000001) (mask!30452 thiss!1427)) (index!41433 lt!459690) key!909 (_keys!11633 thiss!1427) (mask!30452 thiss!1427)))))

(declare-fun b!1043201 () Bool)

(assert (=> b!1043201 (= e!590948 Undefined!9765)))

(declare-fun lt!459734 () SeekEntryResult!9765)

(declare-fun d!126445 () Bool)

(assert (=> d!126445 (and (or ((_ is Undefined!9765) lt!459734) (not ((_ is Found!9765) lt!459734)) (and (bvsge (index!41432 lt!459734) #b00000000000000000000000000000000) (bvslt (index!41432 lt!459734) (size!32149 (_keys!11633 thiss!1427))))) (or ((_ is Undefined!9765) lt!459734) ((_ is Found!9765) lt!459734) (not ((_ is MissingVacant!9765) lt!459734)) (not (= (index!41434 lt!459734) (index!41433 lt!459690))) (and (bvsge (index!41434 lt!459734) #b00000000000000000000000000000000) (bvslt (index!41434 lt!459734) (size!32149 (_keys!11633 thiss!1427))))) (or ((_ is Undefined!9765) lt!459734) (ite ((_ is Found!9765) lt!459734) (= (select (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459734)) key!909) (and ((_ is MissingVacant!9765) lt!459734) (= (index!41434 lt!459734) (index!41433 lt!459690)) (= (select (arr!31615 (_keys!11633 thiss!1427)) (index!41434 lt!459734)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!126445 (= lt!459734 e!590948)))

(declare-fun c!106151 () Bool)

(assert (=> d!126445 (= c!106151 (bvsge (x!92973 lt!459690) #b01111111111111111111111111111110))))

(assert (=> d!126445 (= lt!459733 (select (arr!31615 (_keys!11633 thiss!1427)) (index!41433 lt!459690)))))

(assert (=> d!126445 (validMask!0 (mask!30452 thiss!1427))))

(assert (=> d!126445 (= (seekKeyOrZeroReturnVacant!0 (x!92973 lt!459690) (index!41433 lt!459690) (index!41433 lt!459690) key!909 (_keys!11633 thiss!1427) (mask!30452 thiss!1427)) lt!459734)))

(declare-fun b!1043204 () Bool)

(declare-fun c!106150 () Bool)

(assert (=> b!1043204 (= c!106150 (= lt!459733 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043204 (= e!590950 e!590949)))

(declare-fun b!1043205 () Bool)

(assert (=> b!1043205 (= e!590949 (MissingVacant!9765 (index!41433 lt!459690)))))

(assert (= (and d!126445 c!106151) b!1043201))

(assert (= (and d!126445 (not c!106151)) b!1043202))

(assert (= (and b!1043202 c!106152) b!1043200))

(assert (= (and b!1043202 (not c!106152)) b!1043204))

(assert (= (and b!1043204 c!106150) b!1043205))

(assert (= (and b!1043204 (not c!106150)) b!1043203))

(declare-fun m!962939 () Bool)

(assert (=> b!1043203 m!962939))

(assert (=> b!1043203 m!962939))

(declare-fun m!962941 () Bool)

(assert (=> b!1043203 m!962941))

(declare-fun m!962943 () Bool)

(assert (=> d!126445 m!962943))

(declare-fun m!962945 () Bool)

(assert (=> d!126445 m!962945))

(assert (=> d!126445 m!962853))

(assert (=> d!126445 m!962713))

(assert (=> b!1043093 d!126445))

(declare-fun b!1043206 () Bool)

(declare-fun e!590951 () (_ BitVec 32))

(declare-fun e!590952 () (_ BitVec 32))

(assert (=> b!1043206 (= e!590951 e!590952)))

(declare-fun c!106153 () Bool)

(assert (=> b!1043206 (= c!106153 (validKeyInArray!0 (select (arr!31615 lt!459616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1043207 () Bool)

(declare-fun call!44209 () (_ BitVec 32))

(assert (=> b!1043207 (= e!590952 call!44209)))

(declare-fun b!1043208 () Bool)

(assert (=> b!1043208 (= e!590952 (bvadd #b00000000000000000000000000000001 call!44209))))

(declare-fun bm!44206 () Bool)

(assert (=> bm!44206 (= call!44209 (arrayCountValidKeys!0 lt!459616 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))))))

(declare-fun d!126447 () Bool)

(declare-fun lt!459735 () (_ BitVec 32))

(assert (=> d!126447 (and (bvsge lt!459735 #b00000000000000000000000000000000) (bvsle lt!459735 (bvsub (size!32149 lt!459616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!126447 (= lt!459735 e!590951)))

(declare-fun c!106154 () Bool)

(assert (=> d!126447 (= c!106154 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))))))

(assert (=> d!126447 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32149 (_keys!11633 thiss!1427)) (size!32149 lt!459616)))))

(assert (=> d!126447 (= (arrayCountValidKeys!0 lt!459616 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32149 (_keys!11633 thiss!1427))) lt!459735)))

(declare-fun b!1043209 () Bool)

(assert (=> b!1043209 (= e!590951 #b00000000000000000000000000000000)))

(assert (= (and d!126447 c!106154) b!1043209))

(assert (= (and d!126447 (not c!106154)) b!1043206))

(assert (= (and b!1043206 c!106153) b!1043208))

(assert (= (and b!1043206 (not c!106153)) b!1043207))

(assert (= (or b!1043208 b!1043207) bm!44206))

(assert (=> b!1043206 m!962871))

(assert (=> b!1043206 m!962871))

(assert (=> b!1043206 m!962875))

(declare-fun m!962947 () Bool)

(assert (=> bm!44206 m!962947))

(assert (=> bm!44195 d!126447))

(assert (=> b!1043076 d!126395))

(declare-fun b!1043219 () Bool)

(declare-fun res!694844 () Bool)

(declare-fun e!590955 () Bool)

(assert (=> b!1043219 (=> (not res!694844) (not e!590955))))

(declare-fun size!32155 (LongMapFixedSize!5950) (_ BitVec 32))

(assert (=> b!1043219 (= res!694844 (bvsge (size!32155 thiss!1427) (_size!3030 thiss!1427)))))

(declare-fun b!1043221 () Bool)

(assert (=> b!1043221 (= e!590955 (and (bvsge (extraKeys!6085 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6085 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3030 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1043220 () Bool)

(declare-fun res!694847 () Bool)

(assert (=> b!1043220 (=> (not res!694847) (not e!590955))))

(assert (=> b!1043220 (= res!694847 (= (size!32155 thiss!1427) (bvadd (_size!3030 thiss!1427) (bvsdiv (bvadd (extraKeys!6085 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!126449 () Bool)

(declare-fun res!694845 () Bool)

(assert (=> d!126449 (=> (not res!694845) (not e!590955))))

(assert (=> d!126449 (= res!694845 (validMask!0 (mask!30452 thiss!1427)))))

(assert (=> d!126449 (= (simpleValid!439 thiss!1427) e!590955)))

(declare-fun b!1043218 () Bool)

(declare-fun res!694846 () Bool)

(assert (=> b!1043218 (=> (not res!694846) (not e!590955))))

(assert (=> b!1043218 (= res!694846 (and (= (size!32150 (_values!6380 thiss!1427)) (bvadd (mask!30452 thiss!1427) #b00000000000000000000000000000001)) (= (size!32149 (_keys!11633 thiss!1427)) (size!32150 (_values!6380 thiss!1427))) (bvsge (_size!3030 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3030 thiss!1427) (bvadd (mask!30452 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!126449 res!694845) b!1043218))

(assert (= (and b!1043218 res!694846) b!1043219))

(assert (= (and b!1043219 res!694844) b!1043220))

(assert (= (and b!1043220 res!694847) b!1043221))

(declare-fun m!962949 () Bool)

(assert (=> b!1043219 m!962949))

(assert (=> b!1043220 m!962949))

(assert (=> d!126449 m!962713))

(assert (=> d!126399 d!126449))

(declare-fun d!126451 () Bool)

(assert (=> d!126451 (not (arrayContainsKey!0 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!126451 true))

(declare-fun _$59!29 () Unit!34043)

(assert (=> d!126451 (= (choose!121 (_keys!11633 thiss!1427) (index!41432 lt!459617) key!909) _$59!29)))

(declare-fun bs!30489 () Bool)

(assert (= bs!30489 d!126451))

(assert (=> bs!30489 m!962721))

(assert (=> bs!30489 m!962833))

(assert (=> d!126393 d!126451))

(declare-fun d!126453 () Bool)

(assert (=> d!126453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65724 (store (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32149 (_keys!11633 thiss!1427))) (mask!30452 thiss!1427))))

(assert (=> d!126453 true))

(declare-fun _$44!27 () Unit!34043)

(assert (=> d!126453 (= (choose!25 (_keys!11633 thiss!1427) (index!41432 lt!459617) (mask!30452 thiss!1427)) _$44!27)))

(declare-fun bs!30490 () Bool)

(assert (= bs!30490 d!126453))

(assert (=> bs!30490 m!962721))

(assert (=> bs!30490 m!962843))

(assert (=> d!126397 d!126453))

(assert (=> d!126397 d!126383))

(declare-fun d!126455 () Bool)

(assert (=> d!126455 (= (validKeyInArray!0 (select (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617))) (and (not (= (select (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31615 (_keys!11633 thiss!1427)) (index!41432 lt!459617)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043011 d!126455))

(declare-fun b!1043222 () Bool)

(declare-fun e!590956 () Bool)

(declare-fun call!44210 () Bool)

(assert (=> b!1043222 (= e!590956 call!44210)))

(declare-fun d!126457 () Bool)

(declare-fun res!694850 () Bool)

(declare-fun e!590959 () Bool)

(assert (=> d!126457 (=> res!694850 e!590959)))

(assert (=> d!126457 (= res!694850 (bvsge #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))))))

(assert (=> d!126457 (= (arrayNoDuplicates!0 (_keys!11633 thiss!1427) #b00000000000000000000000000000000 Nil!21956) e!590959)))

(declare-fun bm!44207 () Bool)

(declare-fun c!106155 () Bool)

(assert (=> bm!44207 (= call!44210 (arrayNoDuplicates!0 (_keys!11633 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106155 (Cons!21955 (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000) Nil!21956) Nil!21956)))))

(declare-fun b!1043223 () Bool)

(assert (=> b!1043223 (= e!590956 call!44210)))

(declare-fun b!1043224 () Bool)

(declare-fun e!590958 () Bool)

(assert (=> b!1043224 (= e!590958 e!590956)))

(assert (=> b!1043224 (= c!106155 (validKeyInArray!0 (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043225 () Bool)

(declare-fun e!590957 () Bool)

(assert (=> b!1043225 (= e!590957 (contains!6081 Nil!21956 (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043226 () Bool)

(assert (=> b!1043226 (= e!590959 e!590958)))

(declare-fun res!694848 () Bool)

(assert (=> b!1043226 (=> (not res!694848) (not e!590958))))

(assert (=> b!1043226 (= res!694848 (not e!590957))))

(declare-fun res!694849 () Bool)

(assert (=> b!1043226 (=> (not res!694849) (not e!590957))))

(assert (=> b!1043226 (= res!694849 (validKeyInArray!0 (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126457 (not res!694850)) b!1043226))

(assert (= (and b!1043226 res!694849) b!1043225))

(assert (= (and b!1043226 res!694848) b!1043224))

(assert (= (and b!1043224 c!106155) b!1043223))

(assert (= (and b!1043224 (not c!106155)) b!1043222))

(assert (= (or b!1043223 b!1043222) bm!44207))

(assert (=> bm!44207 m!962835))

(declare-fun m!962951 () Bool)

(assert (=> bm!44207 m!962951))

(assert (=> b!1043224 m!962835))

(assert (=> b!1043224 m!962835))

(assert (=> b!1043224 m!962837))

(assert (=> b!1043225 m!962835))

(assert (=> b!1043225 m!962835))

(declare-fun m!962953 () Bool)

(assert (=> b!1043225 m!962953))

(assert (=> b!1043226 m!962835))

(assert (=> b!1043226 m!962835))

(assert (=> b!1043226 m!962837))

(assert (=> b!1043078 d!126457))

(declare-fun b!1043227 () Bool)

(declare-fun e!590960 () Bool)

(declare-fun call!44211 () Bool)

(assert (=> b!1043227 (= e!590960 call!44211)))

(declare-fun b!1043228 () Bool)

(declare-fun e!590962 () Bool)

(assert (=> b!1043228 (= e!590962 call!44211)))

(declare-fun bm!44208 () Bool)

(assert (=> bm!44208 (= call!44211 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11633 thiss!1427) (mask!30452 thiss!1427)))))

(declare-fun b!1043229 () Bool)

(declare-fun e!590961 () Bool)

(assert (=> b!1043229 (= e!590961 e!590960)))

(declare-fun c!106156 () Bool)

(assert (=> b!1043229 (= c!106156 (validKeyInArray!0 (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043230 () Bool)

(assert (=> b!1043230 (= e!590960 e!590962)))

(declare-fun lt!459738 () (_ BitVec 64))

(assert (=> b!1043230 (= lt!459738 (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459737 () Unit!34043)

(assert (=> b!1043230 (= lt!459737 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11633 thiss!1427) lt!459738 #b00000000000000000000000000000000))))

(assert (=> b!1043230 (arrayContainsKey!0 (_keys!11633 thiss!1427) lt!459738 #b00000000000000000000000000000000)))

(declare-fun lt!459736 () Unit!34043)

(assert (=> b!1043230 (= lt!459736 lt!459737)))

(declare-fun res!694852 () Bool)

(assert (=> b!1043230 (= res!694852 (= (seekEntryOrOpen!0 (select (arr!31615 (_keys!11633 thiss!1427)) #b00000000000000000000000000000000) (_keys!11633 thiss!1427) (mask!30452 thiss!1427)) (Found!9765 #b00000000000000000000000000000000)))))

(assert (=> b!1043230 (=> (not res!694852) (not e!590962))))

(declare-fun d!126459 () Bool)

(declare-fun res!694851 () Bool)

(assert (=> d!126459 (=> res!694851 e!590961)))

(assert (=> d!126459 (= res!694851 (bvsge #b00000000000000000000000000000000 (size!32149 (_keys!11633 thiss!1427))))))

(assert (=> d!126459 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11633 thiss!1427) (mask!30452 thiss!1427)) e!590961)))

(assert (= (and d!126459 (not res!694851)) b!1043229))

(assert (= (and b!1043229 c!106156) b!1043230))

(assert (= (and b!1043229 (not c!106156)) b!1043227))

(assert (= (and b!1043230 res!694852) b!1043228))

(assert (= (or b!1043228 b!1043227) bm!44208))

(declare-fun m!962955 () Bool)

(assert (=> bm!44208 m!962955))

(assert (=> b!1043229 m!962835))

(assert (=> b!1043229 m!962835))

(assert (=> b!1043229 m!962837))

(assert (=> b!1043230 m!962835))

(declare-fun m!962957 () Bool)

(assert (=> b!1043230 m!962957))

(declare-fun m!962959 () Bool)

(assert (=> b!1043230 m!962959))

(assert (=> b!1043230 m!962835))

(declare-fun m!962961 () Bool)

(assert (=> b!1043230 m!962961))

(assert (=> b!1043077 d!126459))

(declare-fun mapNonEmpty!38752 () Bool)

(declare-fun mapRes!38752 () Bool)

(declare-fun tp!74360 () Bool)

(declare-fun e!590963 () Bool)

(assert (=> mapNonEmpty!38752 (= mapRes!38752 (and tp!74360 e!590963))))

(declare-fun mapValue!38752 () ValueCell!11678)

(declare-fun mapKey!38752 () (_ BitVec 32))

(declare-fun mapRest!38752 () (Array (_ BitVec 32) ValueCell!11678))

(assert (=> mapNonEmpty!38752 (= mapRest!38751 (store mapRest!38752 mapKey!38752 mapValue!38752))))

(declare-fun b!1043231 () Bool)

(assert (=> b!1043231 (= e!590963 tp_is_empty!24763)))

(declare-fun condMapEmpty!38752 () Bool)

(declare-fun mapDefault!38752 () ValueCell!11678)

(assert (=> mapNonEmpty!38751 (= condMapEmpty!38752 (= mapRest!38751 ((as const (Array (_ BitVec 32) ValueCell!11678)) mapDefault!38752)))))

(declare-fun e!590964 () Bool)

(assert (=> mapNonEmpty!38751 (= tp!74359 (and e!590964 mapRes!38752))))

(declare-fun b!1043232 () Bool)

(assert (=> b!1043232 (= e!590964 tp_is_empty!24763)))

(declare-fun mapIsEmpty!38752 () Bool)

(assert (=> mapIsEmpty!38752 mapRes!38752))

(assert (= (and mapNonEmpty!38751 condMapEmpty!38752) mapIsEmpty!38752))

(assert (= (and mapNonEmpty!38751 (not condMapEmpty!38752)) mapNonEmpty!38752))

(assert (= (and mapNonEmpty!38752 ((_ is ValueCellFull!11678) mapValue!38752)) b!1043231))

(assert (= (and mapNonEmpty!38751 ((_ is ValueCellFull!11678) mapDefault!38752)) b!1043232))

(declare-fun m!962963 () Bool)

(assert (=> mapNonEmpty!38752 m!962963))

(check-sat (not b!1043224) (not b_next!21043) (not d!126453) (not b!1043219) (not b!1043186) (not b!1043206) (not d!126417) (not b!1043178) (not b!1043229) (not d!126445) (not b!1043120) (not b!1043183) (not b!1043108) tp_is_empty!24763 (not bm!44205) (not b!1043109) (not b!1043230) (not d!126421) (not d!126451) (not b!1043148) (not b!1043107) (not bm!44204) (not b!1043226) (not mapNonEmpty!38752) (not d!126433) (not b!1043220) (not b!1043124) (not d!126427) (not b!1043181) (not d!126449) (not bm!44203) (not bm!44207) (not bm!44202) (not b!1043125) (not bm!44208) (not b!1043225) (not b!1043114) (not b!1043156) b_and!33585 (not b!1043113) (not b!1043161) (not b!1043203) (not bm!44201) (not b!1043112) (not b!1043187) (not bm!44206) (not d!126437) (not b!1043123) (not bm!44200) (not d!126425))
(check-sat b_and!33585 (not b_next!21043))
