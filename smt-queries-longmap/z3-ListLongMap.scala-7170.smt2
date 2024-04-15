; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91578 () Bool)

(assert start!91578)

(declare-fun b!1042710 () Bool)

(declare-fun b_free!21073 () Bool)

(declare-fun b_next!21073 () Bool)

(assert (=> b!1042710 (= b_free!21073 (not b_next!21073))))

(declare-fun tp!74450 () Bool)

(declare-fun b_and!33579 () Bool)

(assert (=> b!1042710 (= tp!74450 b_and!33579)))

(declare-fun mapNonEmpty!38804 () Bool)

(declare-fun mapRes!38804 () Bool)

(declare-fun tp!74451 () Bool)

(declare-fun e!590705 () Bool)

(assert (=> mapNonEmpty!38804 (= mapRes!38804 (and tp!74451 e!590705))))

(declare-fun mapKey!38804 () (_ BitVec 32))

(declare-datatypes ((V!37931 0))(
  ( (V!37932 (val!12447 Int)) )
))
(declare-datatypes ((ValueCell!11693 0))(
  ( (ValueCellFull!11693 (v!15037 V!37931)) (EmptyCell!11693) )
))
(declare-fun mapValue!38804 () ValueCell!11693)

(declare-fun mapRest!38804 () (Array (_ BitVec 32) ValueCell!11693))

(declare-datatypes ((array!65683 0))(
  ( (array!65684 (arr!31596 (Array (_ BitVec 32) (_ BitVec 64))) (size!32133 (_ BitVec 32))) )
))
(declare-datatypes ((array!65685 0))(
  ( (array!65686 (arr!31597 (Array (_ BitVec 32) ValueCell!11693)) (size!32134 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5980 0))(
  ( (LongMapFixedSize!5981 (defaultEntry!6372 Int) (mask!30442 (_ BitVec 32)) (extraKeys!6100 (_ BitVec 32)) (zeroValue!6206 V!37931) (minValue!6206 V!37931) (_size!3045 (_ BitVec 32)) (_keys!11622 array!65683) (_values!6395 array!65685) (_vacant!3045 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5980)

(assert (=> mapNonEmpty!38804 (= (arr!31597 (_values!6395 thiss!1427)) (store mapRest!38804 mapKey!38804 mapValue!38804))))

(declare-fun b!1042703 () Bool)

(declare-fun res!694761 () Bool)

(declare-fun e!590703 () Bool)

(assert (=> b!1042703 (=> res!694761 e!590703)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65683 (_ BitVec 32)) Bool)

(assert (=> b!1042703 (= res!694761 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11622 thiss!1427) (mask!30442 thiss!1427))))))

(declare-fun b!1042704 () Bool)

(declare-fun res!694758 () Bool)

(assert (=> b!1042704 (=> res!694758 e!590703)))

(declare-datatypes ((List!22018 0))(
  ( (Nil!22015) (Cons!22014 (h!23222 (_ BitVec 64)) (t!31223 List!22018)) )
))
(declare-fun arrayNoDuplicates!0 (array!65683 (_ BitVec 32) List!22018) Bool)

(assert (=> b!1042704 (= res!694758 (not (arrayNoDuplicates!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 Nil!22015)))))

(declare-fun b!1042705 () Bool)

(declare-fun e!590702 () Bool)

(declare-fun e!590706 () Bool)

(assert (=> b!1042705 (= e!590702 e!590706)))

(declare-fun res!694756 () Bool)

(assert (=> b!1042705 (=> (not res!694756) (not e!590706))))

(declare-datatypes ((SeekEntryResult!9821 0))(
  ( (MissingZero!9821 (index!41655 (_ BitVec 32))) (Found!9821 (index!41656 (_ BitVec 32))) (Intermediate!9821 (undefined!10633 Bool) (index!41657 (_ BitVec 32)) (x!93102 (_ BitVec 32))) (Undefined!9821) (MissingVacant!9821 (index!41658 (_ BitVec 32))) )
))
(declare-fun lt!459458 () SeekEntryResult!9821)

(get-info :version)

(assert (=> b!1042705 (= res!694756 ((_ is Found!9821) lt!459458))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65683 (_ BitVec 32)) SeekEntryResult!9821)

(assert (=> b!1042705 (= lt!459458 (seekEntry!0 key!909 (_keys!11622 thiss!1427) (mask!30442 thiss!1427)))))

(declare-fun b!1042706 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042706 (= e!590703 (validKeyInArray!0 key!909))))

(declare-fun b!1042707 () Bool)

(declare-fun e!590707 () Bool)

(declare-fun e!590704 () Bool)

(assert (=> b!1042707 (= e!590707 (and e!590704 mapRes!38804))))

(declare-fun condMapEmpty!38804 () Bool)

(declare-fun mapDefault!38804 () ValueCell!11693)

(assert (=> b!1042707 (= condMapEmpty!38804 (= (arr!31597 (_values!6395 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11693)) mapDefault!38804)))))

(declare-fun b!1042708 () Bool)

(declare-fun tp_is_empty!24793 () Bool)

(assert (=> b!1042708 (= e!590704 tp_is_empty!24793)))

(declare-fun b!1042709 () Bool)

(assert (=> b!1042709 (= e!590706 (not e!590703))))

(declare-fun res!694757 () Bool)

(assert (=> b!1042709 (=> res!694757 e!590703)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042709 (= res!694757 (not (validMask!0 (mask!30442 thiss!1427))))))

(declare-fun lt!459454 () array!65683)

(declare-fun arrayContainsKey!0 (array!65683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042709 (not (arrayContainsKey!0 lt!459454 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33943 0))(
  ( (Unit!33944) )
))
(declare-fun lt!459457 () Unit!33943)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65683 (_ BitVec 32) (_ BitVec 64)) Unit!33943)

(assert (=> b!1042709 (= lt!459457 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11622 thiss!1427) (index!41656 lt!459458) key!909))))

(assert (=> b!1042709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459454 (mask!30442 thiss!1427))))

(declare-fun lt!459455 () Unit!33943)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65683 (_ BitVec 32) (_ BitVec 32)) Unit!33943)

(assert (=> b!1042709 (= lt!459455 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11622 thiss!1427) (index!41656 lt!459458) (mask!30442 thiss!1427)))))

(assert (=> b!1042709 (arrayNoDuplicates!0 lt!459454 #b00000000000000000000000000000000 Nil!22015)))

(declare-fun lt!459456 () Unit!33943)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65683 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22018) Unit!33943)

(assert (=> b!1042709 (= lt!459456 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11622 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41656 lt!459458) #b00000000000000000000000000000000 Nil!22015))))

(declare-fun arrayCountValidKeys!0 (array!65683 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042709 (= (arrayCountValidKeys!0 lt!459454 #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042709 (= lt!459454 (array!65684 (store (arr!31596 (_keys!11622 thiss!1427)) (index!41656 lt!459458) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32133 (_keys!11622 thiss!1427))))))

(declare-fun lt!459459 () Unit!33943)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65683 (_ BitVec 32) (_ BitVec 64)) Unit!33943)

(assert (=> b!1042709 (= lt!459459 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11622 thiss!1427) (index!41656 lt!459458) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!694762 () Bool)

(assert (=> start!91578 (=> (not res!694762) (not e!590702))))

(declare-fun valid!2237 (LongMapFixedSize!5980) Bool)

(assert (=> start!91578 (= res!694762 (valid!2237 thiss!1427))))

(assert (=> start!91578 e!590702))

(declare-fun e!590708 () Bool)

(assert (=> start!91578 e!590708))

(assert (=> start!91578 true))

(declare-fun array_inv!24417 (array!65683) Bool)

(declare-fun array_inv!24418 (array!65685) Bool)

(assert (=> b!1042710 (= e!590708 (and tp!74450 tp_is_empty!24793 (array_inv!24417 (_keys!11622 thiss!1427)) (array_inv!24418 (_values!6395 thiss!1427)) e!590707))))

(declare-fun b!1042711 () Bool)

(declare-fun res!694759 () Bool)

(assert (=> b!1042711 (=> res!694759 e!590703)))

(assert (=> b!1042711 (= res!694759 (or (bvslt (index!41656 lt!459458) #b00000000000000000000000000000000) (bvsge (index!41656 lt!459458) (size!32133 (_keys!11622 thiss!1427)))))))

(declare-fun b!1042712 () Bool)

(declare-fun res!694760 () Bool)

(assert (=> b!1042712 (=> (not res!694760) (not e!590702))))

(assert (=> b!1042712 (= res!694760 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1042713 () Bool)

(assert (=> b!1042713 (= e!590705 tp_is_empty!24793)))

(declare-fun mapIsEmpty!38804 () Bool)

(assert (=> mapIsEmpty!38804 mapRes!38804))

(declare-fun b!1042714 () Bool)

(declare-fun res!694755 () Bool)

(assert (=> b!1042714 (=> res!694755 e!590703)))

(assert (=> b!1042714 (= res!694755 (or (not (= (size!32134 (_values!6395 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30442 thiss!1427)))) (not (= (size!32133 (_keys!11622 thiss!1427)) (size!32134 (_values!6395 thiss!1427)))) (bvslt (mask!30442 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6100 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6100 thiss!1427) #b00000000000000000000000000000011)))))

(assert (= (and start!91578 res!694762) b!1042712))

(assert (= (and b!1042712 res!694760) b!1042705))

(assert (= (and b!1042705 res!694756) b!1042709))

(assert (= (and b!1042709 (not res!694757)) b!1042714))

(assert (= (and b!1042714 (not res!694755)) b!1042703))

(assert (= (and b!1042703 (not res!694761)) b!1042704))

(assert (= (and b!1042704 (not res!694758)) b!1042711))

(assert (= (and b!1042711 (not res!694759)) b!1042706))

(assert (= (and b!1042707 condMapEmpty!38804) mapIsEmpty!38804))

(assert (= (and b!1042707 (not condMapEmpty!38804)) mapNonEmpty!38804))

(assert (= (and mapNonEmpty!38804 ((_ is ValueCellFull!11693) mapValue!38804)) b!1042713))

(assert (= (and b!1042707 ((_ is ValueCellFull!11693) mapDefault!38804)) b!1042708))

(assert (= b!1042710 b!1042707))

(assert (= start!91578 b!1042710))

(declare-fun m!961483 () Bool)

(assert (=> b!1042709 m!961483))

(declare-fun m!961485 () Bool)

(assert (=> b!1042709 m!961485))

(declare-fun m!961487 () Bool)

(assert (=> b!1042709 m!961487))

(declare-fun m!961489 () Bool)

(assert (=> b!1042709 m!961489))

(declare-fun m!961491 () Bool)

(assert (=> b!1042709 m!961491))

(declare-fun m!961493 () Bool)

(assert (=> b!1042709 m!961493))

(declare-fun m!961495 () Bool)

(assert (=> b!1042709 m!961495))

(declare-fun m!961497 () Bool)

(assert (=> b!1042709 m!961497))

(declare-fun m!961499 () Bool)

(assert (=> b!1042709 m!961499))

(declare-fun m!961501 () Bool)

(assert (=> b!1042709 m!961501))

(declare-fun m!961503 () Bool)

(assert (=> b!1042709 m!961503))

(declare-fun m!961505 () Bool)

(assert (=> b!1042706 m!961505))

(declare-fun m!961507 () Bool)

(assert (=> mapNonEmpty!38804 m!961507))

(declare-fun m!961509 () Bool)

(assert (=> b!1042703 m!961509))

(declare-fun m!961511 () Bool)

(assert (=> b!1042710 m!961511))

(declare-fun m!961513 () Bool)

(assert (=> b!1042710 m!961513))

(declare-fun m!961515 () Bool)

(assert (=> b!1042704 m!961515))

(declare-fun m!961517 () Bool)

(assert (=> b!1042705 m!961517))

(declare-fun m!961519 () Bool)

(assert (=> start!91578 m!961519))

(check-sat tp_is_empty!24793 (not b!1042706) (not b_next!21073) (not mapNonEmpty!38804) b_and!33579 (not b!1042703) (not b!1042704) (not b!1042709) (not b!1042705) (not start!91578) (not b!1042710))
(check-sat b_and!33579 (not b_next!21073))
(get-model)

(declare-fun d!126035 () Bool)

(assert (=> d!126035 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1042706 d!126035))

(declare-fun b!1042799 () Bool)

(declare-fun e!590765 () SeekEntryResult!9821)

(declare-fun lt!459507 () SeekEntryResult!9821)

(assert (=> b!1042799 (= e!590765 (ite ((_ is MissingVacant!9821) lt!459507) (MissingZero!9821 (index!41658 lt!459507)) lt!459507))))

(declare-fun lt!459506 () SeekEntryResult!9821)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65683 (_ BitVec 32)) SeekEntryResult!9821)

(assert (=> b!1042799 (= lt!459507 (seekKeyOrZeroReturnVacant!0 (x!93102 lt!459506) (index!41657 lt!459506) (index!41657 lt!459506) key!909 (_keys!11622 thiss!1427) (mask!30442 thiss!1427)))))

(declare-fun d!126037 () Bool)

(declare-fun lt!459504 () SeekEntryResult!9821)

(assert (=> d!126037 (and (or ((_ is MissingVacant!9821) lt!459504) (not ((_ is Found!9821) lt!459504)) (and (bvsge (index!41656 lt!459504) #b00000000000000000000000000000000) (bvslt (index!41656 lt!459504) (size!32133 (_keys!11622 thiss!1427))))) (not ((_ is MissingVacant!9821) lt!459504)) (or (not ((_ is Found!9821) lt!459504)) (= (select (arr!31596 (_keys!11622 thiss!1427)) (index!41656 lt!459504)) key!909)))))

(declare-fun e!590764 () SeekEntryResult!9821)

(assert (=> d!126037 (= lt!459504 e!590764)))

(declare-fun c!105850 () Bool)

(assert (=> d!126037 (= c!105850 (and ((_ is Intermediate!9821) lt!459506) (undefined!10633 lt!459506)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65683 (_ BitVec 32)) SeekEntryResult!9821)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126037 (= lt!459506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30442 thiss!1427)) key!909 (_keys!11622 thiss!1427) (mask!30442 thiss!1427)))))

(assert (=> d!126037 (validMask!0 (mask!30442 thiss!1427))))

(assert (=> d!126037 (= (seekEntry!0 key!909 (_keys!11622 thiss!1427) (mask!30442 thiss!1427)) lt!459504)))

(declare-fun b!1042800 () Bool)

(declare-fun e!590763 () SeekEntryResult!9821)

(assert (=> b!1042800 (= e!590763 (Found!9821 (index!41657 lt!459506)))))

(declare-fun b!1042801 () Bool)

(assert (=> b!1042801 (= e!590764 e!590763)))

(declare-fun lt!459505 () (_ BitVec 64))

(assert (=> b!1042801 (= lt!459505 (select (arr!31596 (_keys!11622 thiss!1427)) (index!41657 lt!459506)))))

(declare-fun c!105852 () Bool)

(assert (=> b!1042801 (= c!105852 (= lt!459505 key!909))))

(declare-fun b!1042802 () Bool)

(assert (=> b!1042802 (= e!590765 (MissingZero!9821 (index!41657 lt!459506)))))

(declare-fun b!1042803 () Bool)

(assert (=> b!1042803 (= e!590764 Undefined!9821)))

(declare-fun b!1042804 () Bool)

(declare-fun c!105851 () Bool)

(assert (=> b!1042804 (= c!105851 (= lt!459505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1042804 (= e!590763 e!590765)))

(assert (= (and d!126037 c!105850) b!1042803))

(assert (= (and d!126037 (not c!105850)) b!1042801))

(assert (= (and b!1042801 c!105852) b!1042800))

(assert (= (and b!1042801 (not c!105852)) b!1042804))

(assert (= (and b!1042804 c!105851) b!1042802))

(assert (= (and b!1042804 (not c!105851)) b!1042799))

(declare-fun m!961597 () Bool)

(assert (=> b!1042799 m!961597))

(declare-fun m!961599 () Bool)

(assert (=> d!126037 m!961599))

(declare-fun m!961601 () Bool)

(assert (=> d!126037 m!961601))

(assert (=> d!126037 m!961601))

(declare-fun m!961603 () Bool)

(assert (=> d!126037 m!961603))

(assert (=> d!126037 m!961483))

(declare-fun m!961605 () Bool)

(assert (=> b!1042801 m!961605))

(assert (=> b!1042705 d!126037))

(declare-fun d!126039 () Bool)

(assert (=> d!126039 (= (array_inv!24417 (_keys!11622 thiss!1427)) (bvsge (size!32133 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042710 d!126039))

(declare-fun d!126041 () Bool)

(assert (=> d!126041 (= (array_inv!24418 (_values!6395 thiss!1427)) (bvsge (size!32134 (_values!6395 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042710 d!126041))

(declare-fun b!1042815 () Bool)

(declare-fun e!590776 () Bool)

(declare-fun call!44178 () Bool)

(assert (=> b!1042815 (= e!590776 call!44178)))

(declare-fun b!1042816 () Bool)

(declare-fun e!590775 () Bool)

(assert (=> b!1042816 (= e!590775 e!590776)))

(declare-fun c!105855 () Bool)

(assert (=> b!1042816 (= c!105855 (validKeyInArray!0 (select (arr!31596 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042817 () Bool)

(declare-fun e!590774 () Bool)

(assert (=> b!1042817 (= e!590774 e!590775)))

(declare-fun res!694818 () Bool)

(assert (=> b!1042817 (=> (not res!694818) (not e!590775))))

(declare-fun e!590777 () Bool)

(assert (=> b!1042817 (= res!694818 (not e!590777))))

(declare-fun res!694819 () Bool)

(assert (=> b!1042817 (=> (not res!694819) (not e!590777))))

(assert (=> b!1042817 (= res!694819 (validKeyInArray!0 (select (arr!31596 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042818 () Bool)

(declare-fun contains!6040 (List!22018 (_ BitVec 64)) Bool)

(assert (=> b!1042818 (= e!590777 (contains!6040 Nil!22015 (select (arr!31596 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042819 () Bool)

(assert (=> b!1042819 (= e!590776 call!44178)))

(declare-fun bm!44175 () Bool)

(assert (=> bm!44175 (= call!44178 (arrayNoDuplicates!0 (_keys!11622 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105855 (Cons!22014 (select (arr!31596 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000) Nil!22015) Nil!22015)))))

(declare-fun d!126043 () Bool)

(declare-fun res!694817 () Bool)

(assert (=> d!126043 (=> res!694817 e!590774)))

(assert (=> d!126043 (= res!694817 (bvsge #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))))))

(assert (=> d!126043 (= (arrayNoDuplicates!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 Nil!22015) e!590774)))

(assert (= (and d!126043 (not res!694817)) b!1042817))

(assert (= (and b!1042817 res!694819) b!1042818))

(assert (= (and b!1042817 res!694818) b!1042816))

(assert (= (and b!1042816 c!105855) b!1042815))

(assert (= (and b!1042816 (not c!105855)) b!1042819))

(assert (= (or b!1042815 b!1042819) bm!44175))

(declare-fun m!961607 () Bool)

(assert (=> b!1042816 m!961607))

(assert (=> b!1042816 m!961607))

(declare-fun m!961609 () Bool)

(assert (=> b!1042816 m!961609))

(assert (=> b!1042817 m!961607))

(assert (=> b!1042817 m!961607))

(assert (=> b!1042817 m!961609))

(assert (=> b!1042818 m!961607))

(assert (=> b!1042818 m!961607))

(declare-fun m!961611 () Bool)

(assert (=> b!1042818 m!961611))

(assert (=> bm!44175 m!961607))

(declare-fun m!961613 () Bool)

(assert (=> bm!44175 m!961613))

(assert (=> b!1042704 d!126043))

(declare-fun b!1042828 () Bool)

(declare-fun e!590783 () (_ BitVec 32))

(declare-fun call!44181 () (_ BitVec 32))

(assert (=> b!1042828 (= e!590783 call!44181)))

(declare-fun bm!44178 () Bool)

(assert (=> bm!44178 (= call!44181 (arrayCountValidKeys!0 lt!459454 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32133 (_keys!11622 thiss!1427))))))

(declare-fun d!126045 () Bool)

(declare-fun lt!459510 () (_ BitVec 32))

(assert (=> d!126045 (and (bvsge lt!459510 #b00000000000000000000000000000000) (bvsle lt!459510 (bvsub (size!32133 lt!459454) #b00000000000000000000000000000000)))))

(declare-fun e!590782 () (_ BitVec 32))

(assert (=> d!126045 (= lt!459510 e!590782)))

(declare-fun c!105861 () Bool)

(assert (=> d!126045 (= c!105861 (bvsge #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))))))

(assert (=> d!126045 (and (bvsle #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32133 (_keys!11622 thiss!1427)) (size!32133 lt!459454)))))

(assert (=> d!126045 (= (arrayCountValidKeys!0 lt!459454 #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))) lt!459510)))

(declare-fun b!1042829 () Bool)

(assert (=> b!1042829 (= e!590783 (bvadd #b00000000000000000000000000000001 call!44181))))

(declare-fun b!1042830 () Bool)

(assert (=> b!1042830 (= e!590782 e!590783)))

(declare-fun c!105860 () Bool)

(assert (=> b!1042830 (= c!105860 (validKeyInArray!0 (select (arr!31596 lt!459454) #b00000000000000000000000000000000)))))

(declare-fun b!1042831 () Bool)

(assert (=> b!1042831 (= e!590782 #b00000000000000000000000000000000)))

(assert (= (and d!126045 c!105861) b!1042831))

(assert (= (and d!126045 (not c!105861)) b!1042830))

(assert (= (and b!1042830 c!105860) b!1042829))

(assert (= (and b!1042830 (not c!105860)) b!1042828))

(assert (= (or b!1042829 b!1042828) bm!44178))

(declare-fun m!961615 () Bool)

(assert (=> bm!44178 m!961615))

(declare-fun m!961617 () Bool)

(assert (=> b!1042830 m!961617))

(assert (=> b!1042830 m!961617))

(declare-fun m!961619 () Bool)

(assert (=> b!1042830 m!961619))

(assert (=> b!1042709 d!126045))

(declare-fun d!126047 () Bool)

(declare-fun res!694824 () Bool)

(declare-fun e!590788 () Bool)

(assert (=> d!126047 (=> res!694824 e!590788)))

(assert (=> d!126047 (= res!694824 (= (select (arr!31596 lt!459454) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126047 (= (arrayContainsKey!0 lt!459454 key!909 #b00000000000000000000000000000000) e!590788)))

(declare-fun b!1042836 () Bool)

(declare-fun e!590789 () Bool)

(assert (=> b!1042836 (= e!590788 e!590789)))

(declare-fun res!694825 () Bool)

(assert (=> b!1042836 (=> (not res!694825) (not e!590789))))

(assert (=> b!1042836 (= res!694825 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32133 lt!459454)))))

(declare-fun b!1042837 () Bool)

(assert (=> b!1042837 (= e!590789 (arrayContainsKey!0 lt!459454 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126047 (not res!694824)) b!1042836))

(assert (= (and b!1042836 res!694825) b!1042837))

(assert (=> d!126047 m!961617))

(declare-fun m!961621 () Bool)

(assert (=> b!1042837 m!961621))

(assert (=> b!1042709 d!126047))

(declare-fun d!126049 () Bool)

(declare-fun e!590792 () Bool)

(assert (=> d!126049 e!590792))

(declare-fun res!694828 () Bool)

(assert (=> d!126049 (=> (not res!694828) (not e!590792))))

(assert (=> d!126049 (= res!694828 (and (bvsge (index!41656 lt!459458) #b00000000000000000000000000000000) (bvslt (index!41656 lt!459458) (size!32133 (_keys!11622 thiss!1427)))))))

(declare-fun lt!459513 () Unit!33943)

(declare-fun choose!25 (array!65683 (_ BitVec 32) (_ BitVec 32)) Unit!33943)

(assert (=> d!126049 (= lt!459513 (choose!25 (_keys!11622 thiss!1427) (index!41656 lt!459458) (mask!30442 thiss!1427)))))

(assert (=> d!126049 (validMask!0 (mask!30442 thiss!1427))))

(assert (=> d!126049 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11622 thiss!1427) (index!41656 lt!459458) (mask!30442 thiss!1427)) lt!459513)))

(declare-fun b!1042840 () Bool)

(assert (=> b!1042840 (= e!590792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65684 (store (arr!31596 (_keys!11622 thiss!1427)) (index!41656 lt!459458) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32133 (_keys!11622 thiss!1427))) (mask!30442 thiss!1427)))))

(assert (= (and d!126049 res!694828) b!1042840))

(declare-fun m!961623 () Bool)

(assert (=> d!126049 m!961623))

(assert (=> d!126049 m!961483))

(assert (=> b!1042840 m!961491))

(declare-fun m!961625 () Bool)

(assert (=> b!1042840 m!961625))

(assert (=> b!1042709 d!126049))

(declare-fun d!126051 () Bool)

(declare-fun e!590795 () Bool)

(assert (=> d!126051 e!590795))

(declare-fun res!694831 () Bool)

(assert (=> d!126051 (=> (not res!694831) (not e!590795))))

(assert (=> d!126051 (= res!694831 (bvslt (index!41656 lt!459458) (size!32133 (_keys!11622 thiss!1427))))))

(declare-fun lt!459516 () Unit!33943)

(declare-fun choose!121 (array!65683 (_ BitVec 32) (_ BitVec 64)) Unit!33943)

(assert (=> d!126051 (= lt!459516 (choose!121 (_keys!11622 thiss!1427) (index!41656 lt!459458) key!909))))

(assert (=> d!126051 (bvsge (index!41656 lt!459458) #b00000000000000000000000000000000)))

(assert (=> d!126051 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11622 thiss!1427) (index!41656 lt!459458) key!909) lt!459516)))

(declare-fun b!1042843 () Bool)

(assert (=> b!1042843 (= e!590795 (not (arrayContainsKey!0 (array!65684 (store (arr!31596 (_keys!11622 thiss!1427)) (index!41656 lt!459458) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32133 (_keys!11622 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126051 res!694831) b!1042843))

(declare-fun m!961627 () Bool)

(assert (=> d!126051 m!961627))

(assert (=> b!1042843 m!961491))

(declare-fun m!961629 () Bool)

(assert (=> b!1042843 m!961629))

(assert (=> b!1042709 d!126051))

(declare-fun b!1042844 () Bool)

(declare-fun e!590797 () (_ BitVec 32))

(declare-fun call!44182 () (_ BitVec 32))

(assert (=> b!1042844 (= e!590797 call!44182)))

(declare-fun bm!44179 () Bool)

(assert (=> bm!44179 (= call!44182 (arrayCountValidKeys!0 (_keys!11622 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32133 (_keys!11622 thiss!1427))))))

(declare-fun d!126053 () Bool)

(declare-fun lt!459517 () (_ BitVec 32))

(assert (=> d!126053 (and (bvsge lt!459517 #b00000000000000000000000000000000) (bvsle lt!459517 (bvsub (size!32133 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!590796 () (_ BitVec 32))

(assert (=> d!126053 (= lt!459517 e!590796)))

(declare-fun c!105863 () Bool)

(assert (=> d!126053 (= c!105863 (bvsge #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))))))

(assert (=> d!126053 (and (bvsle #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32133 (_keys!11622 thiss!1427)) (size!32133 (_keys!11622 thiss!1427))))))

(assert (=> d!126053 (= (arrayCountValidKeys!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))) lt!459517)))

(declare-fun b!1042845 () Bool)

(assert (=> b!1042845 (= e!590797 (bvadd #b00000000000000000000000000000001 call!44182))))

(declare-fun b!1042846 () Bool)

(assert (=> b!1042846 (= e!590796 e!590797)))

(declare-fun c!105862 () Bool)

(assert (=> b!1042846 (= c!105862 (validKeyInArray!0 (select (arr!31596 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042847 () Bool)

(assert (=> b!1042847 (= e!590796 #b00000000000000000000000000000000)))

(assert (= (and d!126053 c!105863) b!1042847))

(assert (= (and d!126053 (not c!105863)) b!1042846))

(assert (= (and b!1042846 c!105862) b!1042845))

(assert (= (and b!1042846 (not c!105862)) b!1042844))

(assert (= (or b!1042845 b!1042844) bm!44179))

(declare-fun m!961631 () Bool)

(assert (=> bm!44179 m!961631))

(assert (=> b!1042846 m!961607))

(assert (=> b!1042846 m!961607))

(assert (=> b!1042846 m!961609))

(assert (=> b!1042709 d!126053))

(declare-fun b!1042859 () Bool)

(declare-fun e!590802 () Bool)

(assert (=> b!1042859 (= e!590802 (= (arrayCountValidKeys!0 (array!65684 (store (arr!31596 (_keys!11622 thiss!1427)) (index!41656 lt!459458) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32133 (_keys!11622 thiss!1427))) #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1042856 () Bool)

(declare-fun res!694840 () Bool)

(declare-fun e!590803 () Bool)

(assert (=> b!1042856 (=> (not res!694840) (not e!590803))))

(assert (=> b!1042856 (= res!694840 (validKeyInArray!0 (select (arr!31596 (_keys!11622 thiss!1427)) (index!41656 lt!459458))))))

(declare-fun b!1042858 () Bool)

(assert (=> b!1042858 (= e!590803 (bvslt (size!32133 (_keys!11622 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!126055 () Bool)

(assert (=> d!126055 e!590802))

(declare-fun res!694842 () Bool)

(assert (=> d!126055 (=> (not res!694842) (not e!590802))))

(assert (=> d!126055 (= res!694842 (and (bvsge (index!41656 lt!459458) #b00000000000000000000000000000000) (bvslt (index!41656 lt!459458) (size!32133 (_keys!11622 thiss!1427)))))))

(declare-fun lt!459520 () Unit!33943)

(declare-fun choose!82 (array!65683 (_ BitVec 32) (_ BitVec 64)) Unit!33943)

(assert (=> d!126055 (= lt!459520 (choose!82 (_keys!11622 thiss!1427) (index!41656 lt!459458) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126055 e!590803))

(declare-fun res!694841 () Bool)

(assert (=> d!126055 (=> (not res!694841) (not e!590803))))

(assert (=> d!126055 (= res!694841 (and (bvsge (index!41656 lt!459458) #b00000000000000000000000000000000) (bvslt (index!41656 lt!459458) (size!32133 (_keys!11622 thiss!1427)))))))

(assert (=> d!126055 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11622 thiss!1427) (index!41656 lt!459458) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459520)))

(declare-fun b!1042857 () Bool)

(declare-fun res!694843 () Bool)

(assert (=> b!1042857 (=> (not res!694843) (not e!590803))))

(assert (=> b!1042857 (= res!694843 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!126055 res!694841) b!1042856))

(assert (= (and b!1042856 res!694840) b!1042857))

(assert (= (and b!1042857 res!694843) b!1042858))

(assert (= (and d!126055 res!694842) b!1042859))

(assert (=> b!1042859 m!961491))

(declare-fun m!961633 () Bool)

(assert (=> b!1042859 m!961633))

(assert (=> b!1042859 m!961493))

(declare-fun m!961635 () Bool)

(assert (=> b!1042856 m!961635))

(assert (=> b!1042856 m!961635))

(declare-fun m!961637 () Bool)

(assert (=> b!1042856 m!961637))

(declare-fun m!961639 () Bool)

(assert (=> d!126055 m!961639))

(declare-fun m!961641 () Bool)

(assert (=> b!1042857 m!961641))

(assert (=> b!1042709 d!126055))

(declare-fun b!1042868 () Bool)

(declare-fun e!590811 () Bool)

(declare-fun e!590810 () Bool)

(assert (=> b!1042868 (= e!590811 e!590810)))

(declare-fun lt!459527 () (_ BitVec 64))

(assert (=> b!1042868 (= lt!459527 (select (arr!31596 lt!459454) #b00000000000000000000000000000000))))

(declare-fun lt!459529 () Unit!33943)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65683 (_ BitVec 64) (_ BitVec 32)) Unit!33943)

(assert (=> b!1042868 (= lt!459529 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459454 lt!459527 #b00000000000000000000000000000000))))

(assert (=> b!1042868 (arrayContainsKey!0 lt!459454 lt!459527 #b00000000000000000000000000000000)))

(declare-fun lt!459528 () Unit!33943)

(assert (=> b!1042868 (= lt!459528 lt!459529)))

(declare-fun res!694849 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65683 (_ BitVec 32)) SeekEntryResult!9821)

(assert (=> b!1042868 (= res!694849 (= (seekEntryOrOpen!0 (select (arr!31596 lt!459454) #b00000000000000000000000000000000) lt!459454 (mask!30442 thiss!1427)) (Found!9821 #b00000000000000000000000000000000)))))

(assert (=> b!1042868 (=> (not res!694849) (not e!590810))))

(declare-fun b!1042869 () Bool)

(declare-fun call!44185 () Bool)

(assert (=> b!1042869 (= e!590811 call!44185)))

(declare-fun d!126057 () Bool)

(declare-fun res!694848 () Bool)

(declare-fun e!590812 () Bool)

(assert (=> d!126057 (=> res!694848 e!590812)))

(assert (=> d!126057 (= res!694848 (bvsge #b00000000000000000000000000000000 (size!32133 lt!459454)))))

(assert (=> d!126057 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459454 (mask!30442 thiss!1427)) e!590812)))

(declare-fun b!1042870 () Bool)

(assert (=> b!1042870 (= e!590810 call!44185)))

(declare-fun b!1042871 () Bool)

(assert (=> b!1042871 (= e!590812 e!590811)))

(declare-fun c!105866 () Bool)

(assert (=> b!1042871 (= c!105866 (validKeyInArray!0 (select (arr!31596 lt!459454) #b00000000000000000000000000000000)))))

(declare-fun bm!44182 () Bool)

(assert (=> bm!44182 (= call!44185 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459454 (mask!30442 thiss!1427)))))

(assert (= (and d!126057 (not res!694848)) b!1042871))

(assert (= (and b!1042871 c!105866) b!1042868))

(assert (= (and b!1042871 (not c!105866)) b!1042869))

(assert (= (and b!1042868 res!694849) b!1042870))

(assert (= (or b!1042870 b!1042869) bm!44182))

(assert (=> b!1042868 m!961617))

(declare-fun m!961643 () Bool)

(assert (=> b!1042868 m!961643))

(declare-fun m!961645 () Bool)

(assert (=> b!1042868 m!961645))

(assert (=> b!1042868 m!961617))

(declare-fun m!961647 () Bool)

(assert (=> b!1042868 m!961647))

(assert (=> b!1042871 m!961617))

(assert (=> b!1042871 m!961617))

(assert (=> b!1042871 m!961619))

(declare-fun m!961649 () Bool)

(assert (=> bm!44182 m!961649))

(assert (=> b!1042709 d!126057))

(declare-fun d!126059 () Bool)

(declare-fun e!590815 () Bool)

(assert (=> d!126059 e!590815))

(declare-fun res!694852 () Bool)

(assert (=> d!126059 (=> (not res!694852) (not e!590815))))

(assert (=> d!126059 (= res!694852 (and (bvsge (index!41656 lt!459458) #b00000000000000000000000000000000) (bvslt (index!41656 lt!459458) (size!32133 (_keys!11622 thiss!1427)))))))

(declare-fun lt!459532 () Unit!33943)

(declare-fun choose!53 (array!65683 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22018) Unit!33943)

(assert (=> d!126059 (= lt!459532 (choose!53 (_keys!11622 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41656 lt!459458) #b00000000000000000000000000000000 Nil!22015))))

(assert (=> d!126059 (bvslt (size!32133 (_keys!11622 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126059 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11622 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41656 lt!459458) #b00000000000000000000000000000000 Nil!22015) lt!459532)))

(declare-fun b!1042874 () Bool)

(assert (=> b!1042874 (= e!590815 (arrayNoDuplicates!0 (array!65684 (store (arr!31596 (_keys!11622 thiss!1427)) (index!41656 lt!459458) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32133 (_keys!11622 thiss!1427))) #b00000000000000000000000000000000 Nil!22015))))

(assert (= (and d!126059 res!694852) b!1042874))

(declare-fun m!961651 () Bool)

(assert (=> d!126059 m!961651))

(assert (=> b!1042874 m!961491))

(declare-fun m!961653 () Bool)

(assert (=> b!1042874 m!961653))

(assert (=> b!1042709 d!126059))

(declare-fun b!1042875 () Bool)

(declare-fun e!590818 () Bool)

(declare-fun call!44186 () Bool)

(assert (=> b!1042875 (= e!590818 call!44186)))

(declare-fun b!1042876 () Bool)

(declare-fun e!590817 () Bool)

(assert (=> b!1042876 (= e!590817 e!590818)))

(declare-fun c!105867 () Bool)

(assert (=> b!1042876 (= c!105867 (validKeyInArray!0 (select (arr!31596 lt!459454) #b00000000000000000000000000000000)))))

(declare-fun b!1042877 () Bool)

(declare-fun e!590816 () Bool)

(assert (=> b!1042877 (= e!590816 e!590817)))

(declare-fun res!694854 () Bool)

(assert (=> b!1042877 (=> (not res!694854) (not e!590817))))

(declare-fun e!590819 () Bool)

(assert (=> b!1042877 (= res!694854 (not e!590819))))

(declare-fun res!694855 () Bool)

(assert (=> b!1042877 (=> (not res!694855) (not e!590819))))

(assert (=> b!1042877 (= res!694855 (validKeyInArray!0 (select (arr!31596 lt!459454) #b00000000000000000000000000000000)))))

(declare-fun b!1042878 () Bool)

(assert (=> b!1042878 (= e!590819 (contains!6040 Nil!22015 (select (arr!31596 lt!459454) #b00000000000000000000000000000000)))))

(declare-fun b!1042879 () Bool)

(assert (=> b!1042879 (= e!590818 call!44186)))

(declare-fun bm!44183 () Bool)

(assert (=> bm!44183 (= call!44186 (arrayNoDuplicates!0 lt!459454 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105867 (Cons!22014 (select (arr!31596 lt!459454) #b00000000000000000000000000000000) Nil!22015) Nil!22015)))))

(declare-fun d!126061 () Bool)

(declare-fun res!694853 () Bool)

(assert (=> d!126061 (=> res!694853 e!590816)))

(assert (=> d!126061 (= res!694853 (bvsge #b00000000000000000000000000000000 (size!32133 lt!459454)))))

(assert (=> d!126061 (= (arrayNoDuplicates!0 lt!459454 #b00000000000000000000000000000000 Nil!22015) e!590816)))

(assert (= (and d!126061 (not res!694853)) b!1042877))

(assert (= (and b!1042877 res!694855) b!1042878))

(assert (= (and b!1042877 res!694854) b!1042876))

(assert (= (and b!1042876 c!105867) b!1042875))

(assert (= (and b!1042876 (not c!105867)) b!1042879))

(assert (= (or b!1042875 b!1042879) bm!44183))

(assert (=> b!1042876 m!961617))

(assert (=> b!1042876 m!961617))

(assert (=> b!1042876 m!961619))

(assert (=> b!1042877 m!961617))

(assert (=> b!1042877 m!961617))

(assert (=> b!1042877 m!961619))

(assert (=> b!1042878 m!961617))

(assert (=> b!1042878 m!961617))

(declare-fun m!961655 () Bool)

(assert (=> b!1042878 m!961655))

(assert (=> bm!44183 m!961617))

(declare-fun m!961657 () Bool)

(assert (=> bm!44183 m!961657))

(assert (=> b!1042709 d!126061))

(declare-fun d!126063 () Bool)

(assert (=> d!126063 (= (validMask!0 (mask!30442 thiss!1427)) (and (or (= (mask!30442 thiss!1427) #b00000000000000000000000000000111) (= (mask!30442 thiss!1427) #b00000000000000000000000000001111) (= (mask!30442 thiss!1427) #b00000000000000000000000000011111) (= (mask!30442 thiss!1427) #b00000000000000000000000000111111) (= (mask!30442 thiss!1427) #b00000000000000000000000001111111) (= (mask!30442 thiss!1427) #b00000000000000000000000011111111) (= (mask!30442 thiss!1427) #b00000000000000000000000111111111) (= (mask!30442 thiss!1427) #b00000000000000000000001111111111) (= (mask!30442 thiss!1427) #b00000000000000000000011111111111) (= (mask!30442 thiss!1427) #b00000000000000000000111111111111) (= (mask!30442 thiss!1427) #b00000000000000000001111111111111) (= (mask!30442 thiss!1427) #b00000000000000000011111111111111) (= (mask!30442 thiss!1427) #b00000000000000000111111111111111) (= (mask!30442 thiss!1427) #b00000000000000001111111111111111) (= (mask!30442 thiss!1427) #b00000000000000011111111111111111) (= (mask!30442 thiss!1427) #b00000000000000111111111111111111) (= (mask!30442 thiss!1427) #b00000000000001111111111111111111) (= (mask!30442 thiss!1427) #b00000000000011111111111111111111) (= (mask!30442 thiss!1427) #b00000000000111111111111111111111) (= (mask!30442 thiss!1427) #b00000000001111111111111111111111) (= (mask!30442 thiss!1427) #b00000000011111111111111111111111) (= (mask!30442 thiss!1427) #b00000000111111111111111111111111) (= (mask!30442 thiss!1427) #b00000001111111111111111111111111) (= (mask!30442 thiss!1427) #b00000011111111111111111111111111) (= (mask!30442 thiss!1427) #b00000111111111111111111111111111) (= (mask!30442 thiss!1427) #b00001111111111111111111111111111) (= (mask!30442 thiss!1427) #b00011111111111111111111111111111) (= (mask!30442 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30442 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042709 d!126063))

(declare-fun d!126065 () Bool)

(declare-fun res!694862 () Bool)

(declare-fun e!590822 () Bool)

(assert (=> d!126065 (=> (not res!694862) (not e!590822))))

(declare-fun simpleValid!444 (LongMapFixedSize!5980) Bool)

(assert (=> d!126065 (= res!694862 (simpleValid!444 thiss!1427))))

(assert (=> d!126065 (= (valid!2237 thiss!1427) e!590822)))

(declare-fun b!1042886 () Bool)

(declare-fun res!694863 () Bool)

(assert (=> b!1042886 (=> (not res!694863) (not e!590822))))

(assert (=> b!1042886 (= res!694863 (= (arrayCountValidKeys!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))) (_size!3045 thiss!1427)))))

(declare-fun b!1042887 () Bool)

(declare-fun res!694864 () Bool)

(assert (=> b!1042887 (=> (not res!694864) (not e!590822))))

(assert (=> b!1042887 (= res!694864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11622 thiss!1427) (mask!30442 thiss!1427)))))

(declare-fun b!1042888 () Bool)

(assert (=> b!1042888 (= e!590822 (arrayNoDuplicates!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 Nil!22015))))

(assert (= (and d!126065 res!694862) b!1042886))

(assert (= (and b!1042886 res!694863) b!1042887))

(assert (= (and b!1042887 res!694864) b!1042888))

(declare-fun m!961659 () Bool)

(assert (=> d!126065 m!961659))

(assert (=> b!1042886 m!961493))

(assert (=> b!1042887 m!961509))

(assert (=> b!1042888 m!961515))

(assert (=> start!91578 d!126065))

(declare-fun b!1042889 () Bool)

(declare-fun e!590824 () Bool)

(declare-fun e!590823 () Bool)

(assert (=> b!1042889 (= e!590824 e!590823)))

(declare-fun lt!459533 () (_ BitVec 64))

(assert (=> b!1042889 (= lt!459533 (select (arr!31596 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459535 () Unit!33943)

(assert (=> b!1042889 (= lt!459535 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11622 thiss!1427) lt!459533 #b00000000000000000000000000000000))))

(assert (=> b!1042889 (arrayContainsKey!0 (_keys!11622 thiss!1427) lt!459533 #b00000000000000000000000000000000)))

(declare-fun lt!459534 () Unit!33943)

(assert (=> b!1042889 (= lt!459534 lt!459535)))

(declare-fun res!694866 () Bool)

(assert (=> b!1042889 (= res!694866 (= (seekEntryOrOpen!0 (select (arr!31596 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000) (_keys!11622 thiss!1427) (mask!30442 thiss!1427)) (Found!9821 #b00000000000000000000000000000000)))))

(assert (=> b!1042889 (=> (not res!694866) (not e!590823))))

(declare-fun b!1042890 () Bool)

(declare-fun call!44187 () Bool)

(assert (=> b!1042890 (= e!590824 call!44187)))

(declare-fun d!126067 () Bool)

(declare-fun res!694865 () Bool)

(declare-fun e!590825 () Bool)

(assert (=> d!126067 (=> res!694865 e!590825)))

(assert (=> d!126067 (= res!694865 (bvsge #b00000000000000000000000000000000 (size!32133 (_keys!11622 thiss!1427))))))

(assert (=> d!126067 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11622 thiss!1427) (mask!30442 thiss!1427)) e!590825)))

(declare-fun b!1042891 () Bool)

(assert (=> b!1042891 (= e!590823 call!44187)))

(declare-fun b!1042892 () Bool)

(assert (=> b!1042892 (= e!590825 e!590824)))

(declare-fun c!105868 () Bool)

(assert (=> b!1042892 (= c!105868 (validKeyInArray!0 (select (arr!31596 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44184 () Bool)

(assert (=> bm!44184 (= call!44187 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11622 thiss!1427) (mask!30442 thiss!1427)))))

(assert (= (and d!126067 (not res!694865)) b!1042892))

(assert (= (and b!1042892 c!105868) b!1042889))

(assert (= (and b!1042892 (not c!105868)) b!1042890))

(assert (= (and b!1042889 res!694866) b!1042891))

(assert (= (or b!1042891 b!1042890) bm!44184))

(assert (=> b!1042889 m!961607))

(declare-fun m!961661 () Bool)

(assert (=> b!1042889 m!961661))

(declare-fun m!961663 () Bool)

(assert (=> b!1042889 m!961663))

(assert (=> b!1042889 m!961607))

(declare-fun m!961665 () Bool)

(assert (=> b!1042889 m!961665))

(assert (=> b!1042892 m!961607))

(assert (=> b!1042892 m!961607))

(assert (=> b!1042892 m!961609))

(declare-fun m!961667 () Bool)

(assert (=> bm!44184 m!961667))

(assert (=> b!1042703 d!126067))

(declare-fun b!1042899 () Bool)

(declare-fun e!590830 () Bool)

(assert (=> b!1042899 (= e!590830 tp_is_empty!24793)))

(declare-fun b!1042900 () Bool)

(declare-fun e!590831 () Bool)

(assert (=> b!1042900 (= e!590831 tp_is_empty!24793)))

(declare-fun condMapEmpty!38813 () Bool)

(declare-fun mapDefault!38813 () ValueCell!11693)

(assert (=> mapNonEmpty!38804 (= condMapEmpty!38813 (= mapRest!38804 ((as const (Array (_ BitVec 32) ValueCell!11693)) mapDefault!38813)))))

(declare-fun mapRes!38813 () Bool)

(assert (=> mapNonEmpty!38804 (= tp!74451 (and e!590831 mapRes!38813))))

(declare-fun mapIsEmpty!38813 () Bool)

(assert (=> mapIsEmpty!38813 mapRes!38813))

(declare-fun mapNonEmpty!38813 () Bool)

(declare-fun tp!74466 () Bool)

(assert (=> mapNonEmpty!38813 (= mapRes!38813 (and tp!74466 e!590830))))

(declare-fun mapRest!38813 () (Array (_ BitVec 32) ValueCell!11693))

(declare-fun mapKey!38813 () (_ BitVec 32))

(declare-fun mapValue!38813 () ValueCell!11693)

(assert (=> mapNonEmpty!38813 (= mapRest!38804 (store mapRest!38813 mapKey!38813 mapValue!38813))))

(assert (= (and mapNonEmpty!38804 condMapEmpty!38813) mapIsEmpty!38813))

(assert (= (and mapNonEmpty!38804 (not condMapEmpty!38813)) mapNonEmpty!38813))

(assert (= (and mapNonEmpty!38813 ((_ is ValueCellFull!11693) mapValue!38813)) b!1042899))

(assert (= (and mapNonEmpty!38804 ((_ is ValueCellFull!11693) mapDefault!38813)) b!1042900))

(declare-fun m!961669 () Bool)

(assert (=> mapNonEmpty!38813 m!961669))

(check-sat tp_is_empty!24793 (not b!1042843) (not b!1042868) (not b!1042857) (not d!126065) (not bm!44178) (not bm!44183) (not b!1042817) (not d!126055) (not b!1042846) (not b!1042830) (not b!1042878) (not b!1042876) (not b!1042840) (not b!1042816) (not b!1042892) (not b_next!21073) (not b!1042877) (not bm!44184) (not d!126037) (not b!1042887) (not b!1042886) b_and!33579 (not bm!44175) (not bm!44182) (not bm!44179) (not b!1042874) (not d!126049) (not b!1042856) (not b!1042837) (not b!1042871) (not d!126051) (not b!1042818) (not b!1042889) (not d!126059) (not b!1042799) (not mapNonEmpty!38813) (not b!1042859) (not b!1042888))
(check-sat b_and!33579 (not b_next!21073))
