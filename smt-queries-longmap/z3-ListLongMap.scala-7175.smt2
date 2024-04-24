; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91930 () Bool)

(assert start!91930)

(declare-fun b!1045054 () Bool)

(declare-fun b_free!21103 () Bool)

(declare-fun b_next!21103 () Bool)

(assert (=> b!1045054 (= b_free!21103 (not b_next!21103))))

(declare-fun tp!74549 () Bool)

(declare-fun b_and!33657 () Bool)

(assert (=> b!1045054 (= tp!74549 b_and!33657)))

(declare-fun b!1045053 () Bool)

(declare-fun e!592263 () Bool)

(declare-fun e!592257 () Bool)

(declare-fun mapRes!38858 () Bool)

(assert (=> b!1045053 (= e!592263 (and e!592257 mapRes!38858))))

(declare-fun condMapEmpty!38858 () Bool)

(declare-datatypes ((V!37971 0))(
  ( (V!37972 (val!12462 Int)) )
))
(declare-datatypes ((ValueCell!11708 0))(
  ( (ValueCellFull!11708 (v!15049 V!37971)) (EmptyCell!11708) )
))
(declare-datatypes ((array!65859 0))(
  ( (array!65860 (arr!31675 (Array (_ BitVec 32) (_ BitVec 64))) (size!32211 (_ BitVec 32))) )
))
(declare-datatypes ((array!65861 0))(
  ( (array!65862 (arr!31676 (Array (_ BitVec 32) ValueCell!11708)) (size!32212 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6010 0))(
  ( (LongMapFixedSize!6011 (defaultEntry!6389 Int) (mask!30545 (_ BitVec 32)) (extraKeys!6117 (_ BitVec 32)) (zeroValue!6223 V!37971) (minValue!6223 V!37971) (_size!3060 (_ BitVec 32)) (_keys!11687 array!65859) (_values!6412 array!65861) (_vacant!3060 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6010)

(declare-fun mapDefault!38858 () ValueCell!11708)

(assert (=> b!1045053 (= condMapEmpty!38858 (= (arr!31676 (_values!6412 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11708)) mapDefault!38858)))))

(declare-fun mapNonEmpty!38858 () Bool)

(declare-fun tp!74550 () Bool)

(declare-fun e!592258 () Bool)

(assert (=> mapNonEmpty!38858 (= mapRes!38858 (and tp!74550 e!592258))))

(declare-fun mapKey!38858 () (_ BitVec 32))

(declare-fun mapValue!38858 () ValueCell!11708)

(declare-fun mapRest!38858 () (Array (_ BitVec 32) ValueCell!11708))

(assert (=> mapNonEmpty!38858 (= (arr!31676 (_values!6412 thiss!1427)) (store mapRest!38858 mapKey!38858 mapValue!38858))))

(declare-fun e!592259 () Bool)

(declare-fun tp_is_empty!24823 () Bool)

(declare-fun array_inv!24479 (array!65859) Bool)

(declare-fun array_inv!24480 (array!65861) Bool)

(assert (=> b!1045054 (= e!592259 (and tp!74549 tp_is_empty!24823 (array_inv!24479 (_keys!11687 thiss!1427)) (array_inv!24480 (_values!6412 thiss!1427)) e!592263))))

(declare-fun b!1045055 () Bool)

(assert (=> b!1045055 (= e!592257 tp_is_empty!24823)))

(declare-fun mapIsEmpty!38858 () Bool)

(assert (=> mapIsEmpty!38858 mapRes!38858))

(declare-fun res!695813 () Bool)

(declare-fun e!592260 () Bool)

(assert (=> start!91930 (=> (not res!695813) (not e!592260))))

(declare-fun valid!2260 (LongMapFixedSize!6010) Bool)

(assert (=> start!91930 (= res!695813 (valid!2260 thiss!1427))))

(assert (=> start!91930 e!592260))

(assert (=> start!91930 e!592259))

(assert (=> start!91930 true))

(declare-fun b!1045056 () Bool)

(assert (=> b!1045056 (= e!592258 tp_is_empty!24823)))

(declare-fun b!1045057 () Bool)

(declare-fun e!592262 () Bool)

(assert (=> b!1045057 (= e!592260 e!592262)))

(declare-fun res!695812 () Bool)

(assert (=> b!1045057 (=> (not res!695812) (not e!592262))))

(declare-datatypes ((SeekEntryResult!9791 0))(
  ( (MissingZero!9791 (index!41535 (_ BitVec 32))) (Found!9791 (index!41536 (_ BitVec 32))) (Intermediate!9791 (undefined!10603 Bool) (index!41537 (_ BitVec 32)) (x!93171 (_ BitVec 32))) (Undefined!9791) (MissingVacant!9791 (index!41538 (_ BitVec 32))) )
))
(declare-fun lt!460682 () SeekEntryResult!9791)

(get-info :version)

(assert (=> b!1045057 (= res!695812 ((_ is Found!9791) lt!460682))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65859 (_ BitVec 32)) SeekEntryResult!9791)

(assert (=> b!1045057 (= lt!460682 (seekEntry!0 key!909 (_keys!11687 thiss!1427) (mask!30545 thiss!1427)))))

(declare-fun b!1045058 () Bool)

(declare-fun res!695814 () Bool)

(assert (=> b!1045058 (=> (not res!695814) (not e!592260))))

(assert (=> b!1045058 (= res!695814 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1045059 () Bool)

(assert (=> b!1045059 (= e!592262 (not (and (bvsge (index!41536 lt!460682) #b00000000000000000000000000000000) (bvslt (index!41536 lt!460682) (size!32212 (_values!6412 thiss!1427))))))))

(declare-fun lt!460684 () array!65859)

(declare-datatypes ((tuple2!15738 0))(
  ( (tuple2!15739 (_1!7880 (_ BitVec 64)) (_2!7880 V!37971)) )
))
(declare-datatypes ((List!21985 0))(
  ( (Nil!21982) (Cons!21981 (h!23198 tuple2!15738) (t!31199 List!21985)) )
))
(declare-datatypes ((ListLongMap!13773 0))(
  ( (ListLongMap!13774 (toList!6902 List!21985)) )
))
(declare-fun -!525 (ListLongMap!13773 (_ BitVec 64)) ListLongMap!13773)

(declare-fun getCurrentListMap!3946 (array!65859 array!65861 (_ BitVec 32) (_ BitVec 32) V!37971 V!37971 (_ BitVec 32) Int) ListLongMap!13773)

(declare-fun dynLambda!2017 (Int (_ BitVec 64)) V!37971)

(assert (=> b!1045059 (= (-!525 (getCurrentListMap!3946 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) key!909) (getCurrentListMap!3946 lt!460684 (array!65862 (store (arr!31676 (_values!6412 thiss!1427)) (index!41536 lt!460682) (ValueCellFull!11708 (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6412 thiss!1427))) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-datatypes ((Unit!34091 0))(
  ( (Unit!34092) )
))
(declare-fun lt!460683 () Unit!34091)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!47 (array!65859 array!65861 (_ BitVec 32) (_ BitVec 32) V!37971 V!37971 (_ BitVec 32) (_ BitVec 64) Int) Unit!34091)

(assert (=> b!1045059 (= lt!460683 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!47 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) (index!41536 lt!460682) key!909 (defaultEntry!6389 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045059 (not (arrayContainsKey!0 lt!460684 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460680 () Unit!34091)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65859 (_ BitVec 32) (_ BitVec 64)) Unit!34091)

(assert (=> b!1045059 (= lt!460680 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11687 thiss!1427) (index!41536 lt!460682) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65859 (_ BitVec 32)) Bool)

(assert (=> b!1045059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460684 (mask!30545 thiss!1427))))

(declare-fun lt!460681 () Unit!34091)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65859 (_ BitVec 32) (_ BitVec 32)) Unit!34091)

(assert (=> b!1045059 (= lt!460681 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11687 thiss!1427) (index!41536 lt!460682) (mask!30545 thiss!1427)))))

(declare-datatypes ((List!21986 0))(
  ( (Nil!21983) (Cons!21982 (h!23199 (_ BitVec 64)) (t!31200 List!21986)) )
))
(declare-fun arrayNoDuplicates!0 (array!65859 (_ BitVec 32) List!21986) Bool)

(assert (=> b!1045059 (arrayNoDuplicates!0 lt!460684 #b00000000000000000000000000000000 Nil!21983)))

(declare-fun lt!460679 () Unit!34091)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65859 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21986) Unit!34091)

(assert (=> b!1045059 (= lt!460679 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11687 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41536 lt!460682) #b00000000000000000000000000000000 Nil!21983))))

(declare-fun arrayCountValidKeys!0 (array!65859 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045059 (= (arrayCountValidKeys!0 lt!460684 #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11687 thiss!1427) #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045059 (= lt!460684 (array!65860 (store (arr!31675 (_keys!11687 thiss!1427)) (index!41536 lt!460682) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32211 (_keys!11687 thiss!1427))))))

(declare-fun lt!460685 () Unit!34091)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65859 (_ BitVec 32) (_ BitVec 64)) Unit!34091)

(assert (=> b!1045059 (= lt!460685 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11687 thiss!1427) (index!41536 lt!460682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!91930 res!695813) b!1045058))

(assert (= (and b!1045058 res!695814) b!1045057))

(assert (= (and b!1045057 res!695812) b!1045059))

(assert (= (and b!1045053 condMapEmpty!38858) mapIsEmpty!38858))

(assert (= (and b!1045053 (not condMapEmpty!38858)) mapNonEmpty!38858))

(assert (= (and mapNonEmpty!38858 ((_ is ValueCellFull!11708) mapValue!38858)) b!1045056))

(assert (= (and b!1045053 ((_ is ValueCellFull!11708) mapDefault!38858)) b!1045055))

(assert (= b!1045054 b!1045053))

(assert (= start!91930 b!1045054))

(declare-fun b_lambda!16187 () Bool)

(assert (=> (not b_lambda!16187) (not b!1045059)))

(declare-fun t!31198 () Bool)

(declare-fun tb!7035 () Bool)

(assert (=> (and b!1045054 (= (defaultEntry!6389 thiss!1427) (defaultEntry!6389 thiss!1427)) t!31198) tb!7035))

(declare-fun result!14501 () Bool)

(assert (=> tb!7035 (= result!14501 tp_is_empty!24823)))

(assert (=> b!1045059 t!31198))

(declare-fun b_and!33659 () Bool)

(assert (= b_and!33657 (and (=> t!31198 result!14501) b_and!33659)))

(declare-fun m!964669 () Bool)

(assert (=> b!1045054 m!964669))

(declare-fun m!964671 () Bool)

(assert (=> b!1045054 m!964671))

(declare-fun m!964673 () Bool)

(assert (=> start!91930 m!964673))

(declare-fun m!964675 () Bool)

(assert (=> mapNonEmpty!38858 m!964675))

(declare-fun m!964677 () Bool)

(assert (=> b!1045057 m!964677))

(declare-fun m!964679 () Bool)

(assert (=> b!1045059 m!964679))

(declare-fun m!964681 () Bool)

(assert (=> b!1045059 m!964681))

(declare-fun m!964683 () Bool)

(assert (=> b!1045059 m!964683))

(declare-fun m!964685 () Bool)

(assert (=> b!1045059 m!964685))

(declare-fun m!964687 () Bool)

(assert (=> b!1045059 m!964687))

(declare-fun m!964689 () Bool)

(assert (=> b!1045059 m!964689))

(declare-fun m!964691 () Bool)

(assert (=> b!1045059 m!964691))

(declare-fun m!964693 () Bool)

(assert (=> b!1045059 m!964693))

(declare-fun m!964695 () Bool)

(assert (=> b!1045059 m!964695))

(declare-fun m!964697 () Bool)

(assert (=> b!1045059 m!964697))

(declare-fun m!964699 () Bool)

(assert (=> b!1045059 m!964699))

(assert (=> b!1045059 m!964695))

(declare-fun m!964701 () Bool)

(assert (=> b!1045059 m!964701))

(declare-fun m!964703 () Bool)

(assert (=> b!1045059 m!964703))

(declare-fun m!964705 () Bool)

(assert (=> b!1045059 m!964705))

(declare-fun m!964707 () Bool)

(assert (=> b!1045059 m!964707))

(declare-fun m!964709 () Bool)

(assert (=> b!1045059 m!964709))

(check-sat (not mapNonEmpty!38858) (not start!91930) (not b!1045059) (not b_lambda!16187) tp_is_empty!24823 (not b_next!21103) (not b!1045057) b_and!33659 (not b!1045054))
(check-sat b_and!33659 (not b_next!21103))
(get-model)

(declare-fun b_lambda!16193 () Bool)

(assert (= b_lambda!16187 (or (and b!1045054 b_free!21103) b_lambda!16193)))

(check-sat (not mapNonEmpty!38858) (not b_lambda!16193) (not start!91930) (not b!1045059) tp_is_empty!24823 (not b_next!21103) (not b!1045057) b_and!33659 (not b!1045054))
(check-sat b_and!33659 (not b_next!21103))
(get-model)

(declare-fun d!126759 () Bool)

(declare-fun res!695839 () Bool)

(declare-fun e!592308 () Bool)

(assert (=> d!126759 (=> (not res!695839) (not e!592308))))

(declare-fun simpleValid!447 (LongMapFixedSize!6010) Bool)

(assert (=> d!126759 (= res!695839 (simpleValid!447 thiss!1427))))

(assert (=> d!126759 (= (valid!2260 thiss!1427) e!592308)))

(declare-fun b!1045114 () Bool)

(declare-fun res!695840 () Bool)

(assert (=> b!1045114 (=> (not res!695840) (not e!592308))))

(assert (=> b!1045114 (= res!695840 (= (arrayCountValidKeys!0 (_keys!11687 thiss!1427) #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))) (_size!3060 thiss!1427)))))

(declare-fun b!1045115 () Bool)

(declare-fun res!695841 () Bool)

(assert (=> b!1045115 (=> (not res!695841) (not e!592308))))

(assert (=> b!1045115 (= res!695841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11687 thiss!1427) (mask!30545 thiss!1427)))))

(declare-fun b!1045116 () Bool)

(assert (=> b!1045116 (= e!592308 (arrayNoDuplicates!0 (_keys!11687 thiss!1427) #b00000000000000000000000000000000 Nil!21983))))

(assert (= (and d!126759 res!695839) b!1045114))

(assert (= (and b!1045114 res!695840) b!1045115))

(assert (= (and b!1045115 res!695841) b!1045116))

(declare-fun m!964795 () Bool)

(assert (=> d!126759 m!964795))

(assert (=> b!1045114 m!964691))

(declare-fun m!964797 () Bool)

(assert (=> b!1045115 m!964797))

(declare-fun m!964799 () Bool)

(assert (=> b!1045116 m!964799))

(assert (=> start!91930 d!126759))

(declare-fun b!1045129 () Bool)

(declare-fun e!592315 () SeekEntryResult!9791)

(declare-fun lt!460737 () SeekEntryResult!9791)

(assert (=> b!1045129 (= e!592315 (Found!9791 (index!41537 lt!460737)))))

(declare-fun b!1045130 () Bool)

(declare-fun e!592316 () SeekEntryResult!9791)

(assert (=> b!1045130 (= e!592316 Undefined!9791)))

(declare-fun b!1045131 () Bool)

(declare-fun c!106397 () Bool)

(declare-fun lt!460736 () (_ BitVec 64))

(assert (=> b!1045131 (= c!106397 (= lt!460736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!592317 () SeekEntryResult!9791)

(assert (=> b!1045131 (= e!592315 e!592317)))

(declare-fun b!1045132 () Bool)

(assert (=> b!1045132 (= e!592316 e!592315)))

(assert (=> b!1045132 (= lt!460736 (select (arr!31675 (_keys!11687 thiss!1427)) (index!41537 lt!460737)))))

(declare-fun c!106398 () Bool)

(assert (=> b!1045132 (= c!106398 (= lt!460736 key!909))))

(declare-fun b!1045133 () Bool)

(assert (=> b!1045133 (= e!592317 (MissingZero!9791 (index!41537 lt!460737)))))

(declare-fun b!1045134 () Bool)

(declare-fun lt!460739 () SeekEntryResult!9791)

(assert (=> b!1045134 (= e!592317 (ite ((_ is MissingVacant!9791) lt!460739) (MissingZero!9791 (index!41538 lt!460739)) lt!460739))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65859 (_ BitVec 32)) SeekEntryResult!9791)

(assert (=> b!1045134 (= lt!460739 (seekKeyOrZeroReturnVacant!0 (x!93171 lt!460737) (index!41537 lt!460737) (index!41537 lt!460737) key!909 (_keys!11687 thiss!1427) (mask!30545 thiss!1427)))))

(declare-fun d!126761 () Bool)

(declare-fun lt!460738 () SeekEntryResult!9791)

(assert (=> d!126761 (and (or ((_ is MissingVacant!9791) lt!460738) (not ((_ is Found!9791) lt!460738)) (and (bvsge (index!41536 lt!460738) #b00000000000000000000000000000000) (bvslt (index!41536 lt!460738) (size!32211 (_keys!11687 thiss!1427))))) (not ((_ is MissingVacant!9791) lt!460738)) (or (not ((_ is Found!9791) lt!460738)) (= (select (arr!31675 (_keys!11687 thiss!1427)) (index!41536 lt!460738)) key!909)))))

(assert (=> d!126761 (= lt!460738 e!592316)))

(declare-fun c!106396 () Bool)

(assert (=> d!126761 (= c!106396 (and ((_ is Intermediate!9791) lt!460737) (undefined!10603 lt!460737)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65859 (_ BitVec 32)) SeekEntryResult!9791)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126761 (= lt!460737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30545 thiss!1427)) key!909 (_keys!11687 thiss!1427) (mask!30545 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126761 (validMask!0 (mask!30545 thiss!1427))))

(assert (=> d!126761 (= (seekEntry!0 key!909 (_keys!11687 thiss!1427) (mask!30545 thiss!1427)) lt!460738)))

(assert (= (and d!126761 c!106396) b!1045130))

(assert (= (and d!126761 (not c!106396)) b!1045132))

(assert (= (and b!1045132 c!106398) b!1045129))

(assert (= (and b!1045132 (not c!106398)) b!1045131))

(assert (= (and b!1045131 c!106397) b!1045133))

(assert (= (and b!1045131 (not c!106397)) b!1045134))

(declare-fun m!964801 () Bool)

(assert (=> b!1045132 m!964801))

(declare-fun m!964803 () Bool)

(assert (=> b!1045134 m!964803))

(declare-fun m!964805 () Bool)

(assert (=> d!126761 m!964805))

(declare-fun m!964807 () Bool)

(assert (=> d!126761 m!964807))

(assert (=> d!126761 m!964807))

(declare-fun m!964809 () Bool)

(assert (=> d!126761 m!964809))

(declare-fun m!964811 () Bool)

(assert (=> d!126761 m!964811))

(assert (=> b!1045057 d!126761))

(declare-fun b!1045143 () Bool)

(declare-fun e!592323 () (_ BitVec 32))

(assert (=> b!1045143 (= e!592323 #b00000000000000000000000000000000)))

(declare-fun b!1045144 () Bool)

(declare-fun e!592322 () (_ BitVec 32))

(declare-fun call!44330 () (_ BitVec 32))

(assert (=> b!1045144 (= e!592322 call!44330)))

(declare-fun bm!44327 () Bool)

(assert (=> bm!44327 (= call!44330 (arrayCountValidKeys!0 lt!460684 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32211 (_keys!11687 thiss!1427))))))

(declare-fun b!1045145 () Bool)

(assert (=> b!1045145 (= e!592322 (bvadd #b00000000000000000000000000000001 call!44330))))

(declare-fun d!126763 () Bool)

(declare-fun lt!460742 () (_ BitVec 32))

(assert (=> d!126763 (and (bvsge lt!460742 #b00000000000000000000000000000000) (bvsle lt!460742 (bvsub (size!32211 lt!460684) #b00000000000000000000000000000000)))))

(assert (=> d!126763 (= lt!460742 e!592323)))

(declare-fun c!106403 () Bool)

(assert (=> d!126763 (= c!106403 (bvsge #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))))))

(assert (=> d!126763 (and (bvsle #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32211 (_keys!11687 thiss!1427)) (size!32211 lt!460684)))))

(assert (=> d!126763 (= (arrayCountValidKeys!0 lt!460684 #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))) lt!460742)))

(declare-fun b!1045146 () Bool)

(assert (=> b!1045146 (= e!592323 e!592322)))

(declare-fun c!106404 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1045146 (= c!106404 (validKeyInArray!0 (select (arr!31675 lt!460684) #b00000000000000000000000000000000)))))

(assert (= (and d!126763 c!106403) b!1045143))

(assert (= (and d!126763 (not c!106403)) b!1045146))

(assert (= (and b!1045146 c!106404) b!1045145))

(assert (= (and b!1045146 (not c!106404)) b!1045144))

(assert (= (or b!1045145 b!1045144) bm!44327))

(declare-fun m!964813 () Bool)

(assert (=> bm!44327 m!964813))

(declare-fun m!964815 () Bool)

(assert (=> b!1045146 m!964815))

(assert (=> b!1045146 m!964815))

(declare-fun m!964817 () Bool)

(assert (=> b!1045146 m!964817))

(assert (=> b!1045059 d!126763))

(declare-fun d!126765 () Bool)

(declare-fun e!592326 () Bool)

(assert (=> d!126765 e!592326))

(declare-fun res!695844 () Bool)

(assert (=> d!126765 (=> (not res!695844) (not e!592326))))

(assert (=> d!126765 (= res!695844 (and (bvsge (index!41536 lt!460682) #b00000000000000000000000000000000) (bvslt (index!41536 lt!460682) (size!32211 (_keys!11687 thiss!1427)))))))

(declare-fun lt!460745 () Unit!34091)

(declare-fun choose!1713 (array!65859 array!65861 (_ BitVec 32) (_ BitVec 32) V!37971 V!37971 (_ BitVec 32) (_ BitVec 64) Int) Unit!34091)

(assert (=> d!126765 (= lt!460745 (choose!1713 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) (index!41536 lt!460682) key!909 (defaultEntry!6389 thiss!1427)))))

(assert (=> d!126765 (validMask!0 (mask!30545 thiss!1427))))

(assert (=> d!126765 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!47 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) (index!41536 lt!460682) key!909 (defaultEntry!6389 thiss!1427)) lt!460745)))

(declare-fun b!1045149 () Bool)

(assert (=> b!1045149 (= e!592326 (= (-!525 (getCurrentListMap!3946 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) key!909) (getCurrentListMap!3946 (array!65860 (store (arr!31675 (_keys!11687 thiss!1427)) (index!41536 lt!460682) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32211 (_keys!11687 thiss!1427))) (array!65862 (store (arr!31676 (_values!6412 thiss!1427)) (index!41536 lt!460682) (ValueCellFull!11708 (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6412 thiss!1427))) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427))))))

(assert (=> b!1045149 (bvslt (index!41536 lt!460682) (size!32212 (_values!6412 thiss!1427)))))

(assert (= (and d!126765 res!695844) b!1045149))

(declare-fun b_lambda!16195 () Bool)

(assert (=> (not b_lambda!16195) (not b!1045149)))

(assert (=> b!1045149 t!31198))

(declare-fun b_and!33669 () Bool)

(assert (= b_and!33659 (and (=> t!31198 result!14501) b_and!33669)))

(declare-fun m!964819 () Bool)

(assert (=> d!126765 m!964819))

(assert (=> d!126765 m!964811))

(assert (=> b!1045149 m!964683))

(assert (=> b!1045149 m!964695))

(assert (=> b!1045149 m!964697))

(assert (=> b!1045149 m!964701))

(declare-fun m!964821 () Bool)

(assert (=> b!1045149 m!964821))

(assert (=> b!1045149 m!964695))

(assert (=> b!1045149 m!964689))

(assert (=> b!1045059 d!126765))

(declare-fun bm!44342 () Bool)

(declare-fun call!44346 () ListLongMap!13773)

(declare-fun call!44351 () ListLongMap!13773)

(assert (=> bm!44342 (= call!44346 call!44351)))

(declare-fun b!1045193 () Bool)

(declare-fun e!592364 () Bool)

(declare-fun e!592353 () Bool)

(assert (=> b!1045193 (= e!592364 e!592353)))

(declare-fun c!106418 () Bool)

(assert (=> b!1045193 (= c!106418 (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045194 () Bool)

(declare-fun res!695866 () Bool)

(assert (=> b!1045194 (=> (not res!695866) (not e!592364))))

(declare-fun e!592358 () Bool)

(assert (=> b!1045194 (= res!695866 e!592358)))

(declare-fun c!106419 () Bool)

(assert (=> b!1045194 (= c!106419 (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44343 () Bool)

(declare-fun call!44345 () ListLongMap!13773)

(declare-fun getCurrentListMapNoExtraKeys!3569 (array!65859 array!65861 (_ BitVec 32) (_ BitVec 32) V!37971 V!37971 (_ BitVec 32) Int) ListLongMap!13773)

(assert (=> bm!44343 (= call!44345 (getCurrentListMapNoExtraKeys!3569 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun b!1045195 () Bool)

(declare-fun e!592361 () Bool)

(assert (=> b!1045195 (= e!592353 e!592361)))

(declare-fun res!695868 () Bool)

(declare-fun call!44347 () Bool)

(assert (=> b!1045195 (= res!695868 call!44347)))

(assert (=> b!1045195 (=> (not res!695868) (not e!592361))))

(declare-fun b!1045196 () Bool)

(declare-fun e!592359 () ListLongMap!13773)

(assert (=> b!1045196 (= e!592359 call!44346)))

(declare-fun b!1045197 () Bool)

(declare-fun e!592365 () Unit!34091)

(declare-fun Unit!34093 () Unit!34091)

(assert (=> b!1045197 (= e!592365 Unit!34093)))

(declare-fun b!1045198 () Bool)

(declare-fun c!106420 () Bool)

(assert (=> b!1045198 (= c!106420 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592354 () ListLongMap!13773)

(assert (=> b!1045198 (= e!592354 e!592359)))

(declare-fun b!1045199 () Bool)

(declare-fun e!592357 () Bool)

(assert (=> b!1045199 (= e!592358 e!592357)))

(declare-fun res!695869 () Bool)

(declare-fun call!44348 () Bool)

(assert (=> b!1045199 (= res!695869 call!44348)))

(assert (=> b!1045199 (=> (not res!695869) (not e!592357))))

(declare-fun b!1045200 () Bool)

(declare-fun lt!460811 () Unit!34091)

(assert (=> b!1045200 (= e!592365 lt!460811)))

(declare-fun lt!460794 () ListLongMap!13773)

(assert (=> b!1045200 (= lt!460794 (getCurrentListMapNoExtraKeys!3569 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460797 () (_ BitVec 64))

(assert (=> b!1045200 (= lt!460797 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460801 () (_ BitVec 64))

(assert (=> b!1045200 (= lt!460801 (select (arr!31675 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460805 () Unit!34091)

(declare-fun addStillContains!628 (ListLongMap!13773 (_ BitVec 64) V!37971 (_ BitVec 64)) Unit!34091)

(assert (=> b!1045200 (= lt!460805 (addStillContains!628 lt!460794 lt!460797 (zeroValue!6223 thiss!1427) lt!460801))))

(declare-fun contains!6090 (ListLongMap!13773 (_ BitVec 64)) Bool)

(declare-fun +!3129 (ListLongMap!13773 tuple2!15738) ListLongMap!13773)

(assert (=> b!1045200 (contains!6090 (+!3129 lt!460794 (tuple2!15739 lt!460797 (zeroValue!6223 thiss!1427))) lt!460801)))

(declare-fun lt!460807 () Unit!34091)

(assert (=> b!1045200 (= lt!460807 lt!460805)))

(declare-fun lt!460792 () ListLongMap!13773)

(assert (=> b!1045200 (= lt!460792 (getCurrentListMapNoExtraKeys!3569 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460802 () (_ BitVec 64))

(assert (=> b!1045200 (= lt!460802 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460791 () (_ BitVec 64))

(assert (=> b!1045200 (= lt!460791 (select (arr!31675 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460809 () Unit!34091)

(declare-fun addApplyDifferent!484 (ListLongMap!13773 (_ BitVec 64) V!37971 (_ BitVec 64)) Unit!34091)

(assert (=> b!1045200 (= lt!460809 (addApplyDifferent!484 lt!460792 lt!460802 (minValue!6223 thiss!1427) lt!460791))))

(declare-fun apply!918 (ListLongMap!13773 (_ BitVec 64)) V!37971)

(assert (=> b!1045200 (= (apply!918 (+!3129 lt!460792 (tuple2!15739 lt!460802 (minValue!6223 thiss!1427))) lt!460791) (apply!918 lt!460792 lt!460791))))

(declare-fun lt!460810 () Unit!34091)

(assert (=> b!1045200 (= lt!460810 lt!460809)))

(declare-fun lt!460790 () ListLongMap!13773)

(assert (=> b!1045200 (= lt!460790 (getCurrentListMapNoExtraKeys!3569 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460796 () (_ BitVec 64))

(assert (=> b!1045200 (= lt!460796 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460806 () (_ BitVec 64))

(assert (=> b!1045200 (= lt!460806 (select (arr!31675 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460795 () Unit!34091)

(assert (=> b!1045200 (= lt!460795 (addApplyDifferent!484 lt!460790 lt!460796 (zeroValue!6223 thiss!1427) lt!460806))))

(assert (=> b!1045200 (= (apply!918 (+!3129 lt!460790 (tuple2!15739 lt!460796 (zeroValue!6223 thiss!1427))) lt!460806) (apply!918 lt!460790 lt!460806))))

(declare-fun lt!460804 () Unit!34091)

(assert (=> b!1045200 (= lt!460804 lt!460795)))

(declare-fun lt!460803 () ListLongMap!13773)

(assert (=> b!1045200 (= lt!460803 (getCurrentListMapNoExtraKeys!3569 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460808 () (_ BitVec 64))

(assert (=> b!1045200 (= lt!460808 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460800 () (_ BitVec 64))

(assert (=> b!1045200 (= lt!460800 (select (arr!31675 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045200 (= lt!460811 (addApplyDifferent!484 lt!460803 lt!460808 (minValue!6223 thiss!1427) lt!460800))))

(assert (=> b!1045200 (= (apply!918 (+!3129 lt!460803 (tuple2!15739 lt!460808 (minValue!6223 thiss!1427))) lt!460800) (apply!918 lt!460803 lt!460800))))

(declare-fun b!1045201 () Bool)

(declare-fun res!695865 () Bool)

(assert (=> b!1045201 (=> (not res!695865) (not e!592364))))

(declare-fun e!592356 () Bool)

(assert (=> b!1045201 (= res!695865 e!592356)))

(declare-fun res!695863 () Bool)

(assert (=> b!1045201 (=> res!695863 e!592356)))

(declare-fun e!592363 () Bool)

(assert (=> b!1045201 (= res!695863 (not e!592363))))

(declare-fun res!695870 () Bool)

(assert (=> b!1045201 (=> (not res!695870) (not e!592363))))

(assert (=> b!1045201 (= res!695870 (bvslt #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))))))

(declare-fun b!1045202 () Bool)

(declare-fun e!592355 () Bool)

(declare-fun lt!460793 () ListLongMap!13773)

(declare-fun get!16573 (ValueCell!11708 V!37971) V!37971)

(assert (=> b!1045202 (= e!592355 (= (apply!918 lt!460793 (select (arr!31675 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)) (get!16573 (select (arr!31676 (_values!6412 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045202 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 (_values!6412 thiss!1427))))))

(assert (=> b!1045202 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))))))

(declare-fun b!1045203 () Bool)

(assert (=> b!1045203 (= e!592363 (validKeyInArray!0 (select (arr!31675 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045204 () Bool)

(declare-fun e!592362 () ListLongMap!13773)

(assert (=> b!1045204 (= e!592362 e!592354)))

(declare-fun c!106422 () Bool)

(assert (=> b!1045204 (= c!106422 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045192 () Bool)

(assert (=> b!1045192 (= e!592357 (= (apply!918 lt!460793 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6223 thiss!1427)))))

(declare-fun d!126767 () Bool)

(assert (=> d!126767 e!592364))

(declare-fun res!695871 () Bool)

(assert (=> d!126767 (=> (not res!695871) (not e!592364))))

(assert (=> d!126767 (= res!695871 (or (bvsge #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))))))))

(declare-fun lt!460798 () ListLongMap!13773)

(assert (=> d!126767 (= lt!460793 lt!460798)))

(declare-fun lt!460799 () Unit!34091)

(assert (=> d!126767 (= lt!460799 e!592365)))

(declare-fun c!106421 () Bool)

(declare-fun e!592360 () Bool)

(assert (=> d!126767 (= c!106421 e!592360)))

(declare-fun res!695867 () Bool)

(assert (=> d!126767 (=> (not res!695867) (not e!592360))))

(assert (=> d!126767 (= res!695867 (bvslt #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))))))

(assert (=> d!126767 (= lt!460798 e!592362)))

(declare-fun c!106417 () Bool)

(assert (=> d!126767 (= c!106417 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126767 (validMask!0 (mask!30545 thiss!1427))))

(assert (=> d!126767 (= (getCurrentListMap!3946 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) lt!460793)))

(declare-fun b!1045205 () Bool)

(assert (=> b!1045205 (= e!592353 (not call!44347))))

(declare-fun b!1045206 () Bool)

(assert (=> b!1045206 (= e!592362 (+!3129 call!44351 (tuple2!15739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6223 thiss!1427))))))

(declare-fun bm!44344 () Bool)

(assert (=> bm!44344 (= call!44348 (contains!6090 lt!460793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44345 () Bool)

(assert (=> bm!44345 (= call!44347 (contains!6090 lt!460793 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045207 () Bool)

(assert (=> b!1045207 (= e!592358 (not call!44348))))

(declare-fun b!1045208 () Bool)

(assert (=> b!1045208 (= e!592356 e!592355)))

(declare-fun res!695864 () Bool)

(assert (=> b!1045208 (=> (not res!695864) (not e!592355))))

(assert (=> b!1045208 (= res!695864 (contains!6090 lt!460793 (select (arr!31675 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1045208 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))))))

(declare-fun b!1045209 () Bool)

(declare-fun call!44349 () ListLongMap!13773)

(assert (=> b!1045209 (= e!592359 call!44349)))

(declare-fun bm!44346 () Bool)

(declare-fun call!44350 () ListLongMap!13773)

(assert (=> bm!44346 (= call!44350 call!44345)))

(declare-fun b!1045210 () Bool)

(assert (=> b!1045210 (= e!592361 (= (apply!918 lt!460793 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6223 thiss!1427)))))

(declare-fun b!1045211 () Bool)

(assert (=> b!1045211 (= e!592354 call!44346)))

(declare-fun bm!44347 () Bool)

(assert (=> bm!44347 (= call!44351 (+!3129 (ite c!106417 call!44345 (ite c!106422 call!44350 call!44349)) (ite (or c!106417 c!106422) (tuple2!15739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6223 thiss!1427)) (tuple2!15739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6223 thiss!1427)))))))

(declare-fun bm!44348 () Bool)

(assert (=> bm!44348 (= call!44349 call!44350)))

(declare-fun b!1045212 () Bool)

(assert (=> b!1045212 (= e!592360 (validKeyInArray!0 (select (arr!31675 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126767 c!106417) b!1045206))

(assert (= (and d!126767 (not c!106417)) b!1045204))

(assert (= (and b!1045204 c!106422) b!1045211))

(assert (= (and b!1045204 (not c!106422)) b!1045198))

(assert (= (and b!1045198 c!106420) b!1045196))

(assert (= (and b!1045198 (not c!106420)) b!1045209))

(assert (= (or b!1045196 b!1045209) bm!44348))

(assert (= (or b!1045211 bm!44348) bm!44346))

(assert (= (or b!1045211 b!1045196) bm!44342))

(assert (= (or b!1045206 bm!44346) bm!44343))

(assert (= (or b!1045206 bm!44342) bm!44347))

(assert (= (and d!126767 res!695867) b!1045212))

(assert (= (and d!126767 c!106421) b!1045200))

(assert (= (and d!126767 (not c!106421)) b!1045197))

(assert (= (and d!126767 res!695871) b!1045201))

(assert (= (and b!1045201 res!695870) b!1045203))

(assert (= (and b!1045201 (not res!695863)) b!1045208))

(assert (= (and b!1045208 res!695864) b!1045202))

(assert (= (and b!1045201 res!695865) b!1045194))

(assert (= (and b!1045194 c!106419) b!1045199))

(assert (= (and b!1045194 (not c!106419)) b!1045207))

(assert (= (and b!1045199 res!695869) b!1045192))

(assert (= (or b!1045199 b!1045207) bm!44344))

(assert (= (and b!1045194 res!695866) b!1045193))

(assert (= (and b!1045193 c!106418) b!1045195))

(assert (= (and b!1045193 (not c!106418)) b!1045205))

(assert (= (and b!1045195 res!695868) b!1045210))

(assert (= (or b!1045195 b!1045205) bm!44345))

(declare-fun b_lambda!16197 () Bool)

(assert (=> (not b_lambda!16197) (not b!1045202)))

(assert (=> b!1045202 t!31198))

(declare-fun b_and!33671 () Bool)

(assert (= b_and!33669 (and (=> t!31198 result!14501) b_and!33671)))

(declare-fun m!964823 () Bool)

(assert (=> bm!44343 m!964823))

(declare-fun m!964825 () Bool)

(assert (=> b!1045210 m!964825))

(assert (=> d!126767 m!964811))

(declare-fun m!964827 () Bool)

(assert (=> bm!44347 m!964827))

(declare-fun m!964829 () Bool)

(assert (=> b!1045200 m!964829))

(declare-fun m!964831 () Bool)

(assert (=> b!1045200 m!964831))

(declare-fun m!964833 () Bool)

(assert (=> b!1045200 m!964833))

(declare-fun m!964835 () Bool)

(assert (=> b!1045200 m!964835))

(assert (=> b!1045200 m!964823))

(assert (=> b!1045200 m!964829))

(declare-fun m!964837 () Bool)

(assert (=> b!1045200 m!964837))

(assert (=> b!1045200 m!964835))

(declare-fun m!964839 () Bool)

(assert (=> b!1045200 m!964839))

(declare-fun m!964841 () Bool)

(assert (=> b!1045200 m!964841))

(declare-fun m!964843 () Bool)

(assert (=> b!1045200 m!964843))

(declare-fun m!964845 () Bool)

(assert (=> b!1045200 m!964845))

(declare-fun m!964847 () Bool)

(assert (=> b!1045200 m!964847))

(declare-fun m!964849 () Bool)

(assert (=> b!1045200 m!964849))

(declare-fun m!964851 () Bool)

(assert (=> b!1045200 m!964851))

(declare-fun m!964853 () Bool)

(assert (=> b!1045200 m!964853))

(declare-fun m!964855 () Bool)

(assert (=> b!1045200 m!964855))

(assert (=> b!1045200 m!964843))

(declare-fun m!964857 () Bool)

(assert (=> b!1045200 m!964857))

(declare-fun m!964859 () Bool)

(assert (=> b!1045200 m!964859))

(assert (=> b!1045200 m!964851))

(declare-fun m!964861 () Bool)

(assert (=> bm!44344 m!964861))

(declare-fun m!964863 () Bool)

(assert (=> b!1045192 m!964863))

(assert (=> b!1045203 m!964849))

(assert (=> b!1045203 m!964849))

(declare-fun m!964865 () Bool)

(assert (=> b!1045203 m!964865))

(assert (=> b!1045212 m!964849))

(assert (=> b!1045212 m!964849))

(assert (=> b!1045212 m!964865))

(assert (=> b!1045202 m!964849))

(declare-fun m!964867 () Bool)

(assert (=> b!1045202 m!964867))

(assert (=> b!1045202 m!964849))

(declare-fun m!964869 () Bool)

(assert (=> b!1045202 m!964869))

(assert (=> b!1045202 m!964867))

(assert (=> b!1045202 m!964701))

(declare-fun m!964871 () Bool)

(assert (=> b!1045202 m!964871))

(assert (=> b!1045202 m!964701))

(declare-fun m!964873 () Bool)

(assert (=> bm!44345 m!964873))

(assert (=> b!1045208 m!964849))

(assert (=> b!1045208 m!964849))

(declare-fun m!964875 () Bool)

(assert (=> b!1045208 m!964875))

(declare-fun m!964877 () Bool)

(assert (=> b!1045206 m!964877))

(assert (=> b!1045059 d!126767))

(declare-fun d!126769 () Bool)

(declare-fun lt!460814 () ListLongMap!13773)

(assert (=> d!126769 (not (contains!6090 lt!460814 key!909))))

(declare-fun removeStrictlySorted!58 (List!21985 (_ BitVec 64)) List!21985)

(assert (=> d!126769 (= lt!460814 (ListLongMap!13774 (removeStrictlySorted!58 (toList!6902 (getCurrentListMap!3946 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427))) key!909)))))

(assert (=> d!126769 (= (-!525 (getCurrentListMap!3946 (_keys!11687 thiss!1427) (_values!6412 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) key!909) lt!460814)))

(declare-fun bs!30527 () Bool)

(assert (= bs!30527 d!126769))

(declare-fun m!964879 () Bool)

(assert (=> bs!30527 m!964879))

(declare-fun m!964881 () Bool)

(assert (=> bs!30527 m!964881))

(assert (=> b!1045059 d!126769))

(declare-fun d!126771 () Bool)

(declare-fun res!695878 () Bool)

(declare-fun e!592376 () Bool)

(assert (=> d!126771 (=> res!695878 e!592376)))

(assert (=> d!126771 (= res!695878 (bvsge #b00000000000000000000000000000000 (size!32211 lt!460684)))))

(assert (=> d!126771 (= (arrayNoDuplicates!0 lt!460684 #b00000000000000000000000000000000 Nil!21983) e!592376)))

(declare-fun bm!44351 () Bool)

(declare-fun call!44354 () Bool)

(declare-fun c!106425 () Bool)

(assert (=> bm!44351 (= call!44354 (arrayNoDuplicates!0 lt!460684 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106425 (Cons!21982 (select (arr!31675 lt!460684) #b00000000000000000000000000000000) Nil!21983) Nil!21983)))))

(declare-fun b!1045223 () Bool)

(declare-fun e!592374 () Bool)

(declare-fun e!592375 () Bool)

(assert (=> b!1045223 (= e!592374 e!592375)))

(assert (=> b!1045223 (= c!106425 (validKeyInArray!0 (select (arr!31675 lt!460684) #b00000000000000000000000000000000)))))

(declare-fun b!1045224 () Bool)

(declare-fun e!592377 () Bool)

(declare-fun contains!6091 (List!21986 (_ BitVec 64)) Bool)

(assert (=> b!1045224 (= e!592377 (contains!6091 Nil!21983 (select (arr!31675 lt!460684) #b00000000000000000000000000000000)))))

(declare-fun b!1045225 () Bool)

(assert (=> b!1045225 (= e!592376 e!592374)))

(declare-fun res!695879 () Bool)

(assert (=> b!1045225 (=> (not res!695879) (not e!592374))))

(assert (=> b!1045225 (= res!695879 (not e!592377))))

(declare-fun res!695880 () Bool)

(assert (=> b!1045225 (=> (not res!695880) (not e!592377))))

(assert (=> b!1045225 (= res!695880 (validKeyInArray!0 (select (arr!31675 lt!460684) #b00000000000000000000000000000000)))))

(declare-fun b!1045226 () Bool)

(assert (=> b!1045226 (= e!592375 call!44354)))

(declare-fun b!1045227 () Bool)

(assert (=> b!1045227 (= e!592375 call!44354)))

(assert (= (and d!126771 (not res!695878)) b!1045225))

(assert (= (and b!1045225 res!695880) b!1045224))

(assert (= (and b!1045225 res!695879) b!1045223))

(assert (= (and b!1045223 c!106425) b!1045226))

(assert (= (and b!1045223 (not c!106425)) b!1045227))

(assert (= (or b!1045226 b!1045227) bm!44351))

(assert (=> bm!44351 m!964815))

(declare-fun m!964883 () Bool)

(assert (=> bm!44351 m!964883))

(assert (=> b!1045223 m!964815))

(assert (=> b!1045223 m!964815))

(assert (=> b!1045223 m!964817))

(assert (=> b!1045224 m!964815))

(assert (=> b!1045224 m!964815))

(declare-fun m!964885 () Bool)

(assert (=> b!1045224 m!964885))

(assert (=> b!1045225 m!964815))

(assert (=> b!1045225 m!964815))

(assert (=> b!1045225 m!964817))

(assert (=> b!1045059 d!126771))

(declare-fun d!126773 () Bool)

(declare-fun res!695886 () Bool)

(declare-fun e!592384 () Bool)

(assert (=> d!126773 (=> res!695886 e!592384)))

(assert (=> d!126773 (= res!695886 (bvsge #b00000000000000000000000000000000 (size!32211 lt!460684)))))

(assert (=> d!126773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460684 (mask!30545 thiss!1427)) e!592384)))

(declare-fun b!1045236 () Bool)

(declare-fun e!592386 () Bool)

(declare-fun call!44357 () Bool)

(assert (=> b!1045236 (= e!592386 call!44357)))

(declare-fun b!1045237 () Bool)

(declare-fun e!592385 () Bool)

(assert (=> b!1045237 (= e!592385 call!44357)))

(declare-fun b!1045238 () Bool)

(assert (=> b!1045238 (= e!592385 e!592386)))

(declare-fun lt!460821 () (_ BitVec 64))

(assert (=> b!1045238 (= lt!460821 (select (arr!31675 lt!460684) #b00000000000000000000000000000000))))

(declare-fun lt!460822 () Unit!34091)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65859 (_ BitVec 64) (_ BitVec 32)) Unit!34091)

(assert (=> b!1045238 (= lt!460822 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460684 lt!460821 #b00000000000000000000000000000000))))

(assert (=> b!1045238 (arrayContainsKey!0 lt!460684 lt!460821 #b00000000000000000000000000000000)))

(declare-fun lt!460823 () Unit!34091)

(assert (=> b!1045238 (= lt!460823 lt!460822)))

(declare-fun res!695885 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65859 (_ BitVec 32)) SeekEntryResult!9791)

(assert (=> b!1045238 (= res!695885 (= (seekEntryOrOpen!0 (select (arr!31675 lt!460684) #b00000000000000000000000000000000) lt!460684 (mask!30545 thiss!1427)) (Found!9791 #b00000000000000000000000000000000)))))

(assert (=> b!1045238 (=> (not res!695885) (not e!592386))))

(declare-fun bm!44354 () Bool)

(assert (=> bm!44354 (= call!44357 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460684 (mask!30545 thiss!1427)))))

(declare-fun b!1045239 () Bool)

(assert (=> b!1045239 (= e!592384 e!592385)))

(declare-fun c!106428 () Bool)

(assert (=> b!1045239 (= c!106428 (validKeyInArray!0 (select (arr!31675 lt!460684) #b00000000000000000000000000000000)))))

(assert (= (and d!126773 (not res!695886)) b!1045239))

(assert (= (and b!1045239 c!106428) b!1045238))

(assert (= (and b!1045239 (not c!106428)) b!1045237))

(assert (= (and b!1045238 res!695885) b!1045236))

(assert (= (or b!1045236 b!1045237) bm!44354))

(assert (=> b!1045238 m!964815))

(declare-fun m!964887 () Bool)

(assert (=> b!1045238 m!964887))

(declare-fun m!964889 () Bool)

(assert (=> b!1045238 m!964889))

(assert (=> b!1045238 m!964815))

(declare-fun m!964891 () Bool)

(assert (=> b!1045238 m!964891))

(declare-fun m!964893 () Bool)

(assert (=> bm!44354 m!964893))

(assert (=> b!1045239 m!964815))

(assert (=> b!1045239 m!964815))

(assert (=> b!1045239 m!964817))

(assert (=> b!1045059 d!126773))

(declare-fun b!1045240 () Bool)

(declare-fun e!592388 () (_ BitVec 32))

(assert (=> b!1045240 (= e!592388 #b00000000000000000000000000000000)))

(declare-fun b!1045241 () Bool)

(declare-fun e!592387 () (_ BitVec 32))

(declare-fun call!44358 () (_ BitVec 32))

(assert (=> b!1045241 (= e!592387 call!44358)))

(declare-fun bm!44355 () Bool)

(assert (=> bm!44355 (= call!44358 (arrayCountValidKeys!0 (_keys!11687 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32211 (_keys!11687 thiss!1427))))))

(declare-fun b!1045242 () Bool)

(assert (=> b!1045242 (= e!592387 (bvadd #b00000000000000000000000000000001 call!44358))))

(declare-fun d!126775 () Bool)

(declare-fun lt!460824 () (_ BitVec 32))

(assert (=> d!126775 (and (bvsge lt!460824 #b00000000000000000000000000000000) (bvsle lt!460824 (bvsub (size!32211 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126775 (= lt!460824 e!592388)))

(declare-fun c!106429 () Bool)

(assert (=> d!126775 (= c!106429 (bvsge #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))))))

(assert (=> d!126775 (and (bvsle #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32211 (_keys!11687 thiss!1427)) (size!32211 (_keys!11687 thiss!1427))))))

(assert (=> d!126775 (= (arrayCountValidKeys!0 (_keys!11687 thiss!1427) #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))) lt!460824)))

(declare-fun b!1045243 () Bool)

(assert (=> b!1045243 (= e!592388 e!592387)))

(declare-fun c!106430 () Bool)

(assert (=> b!1045243 (= c!106430 (validKeyInArray!0 (select (arr!31675 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126775 c!106429) b!1045240))

(assert (= (and d!126775 (not c!106429)) b!1045243))

(assert (= (and b!1045243 c!106430) b!1045242))

(assert (= (and b!1045243 (not c!106430)) b!1045241))

(assert (= (or b!1045242 b!1045241) bm!44355))

(declare-fun m!964895 () Bool)

(assert (=> bm!44355 m!964895))

(assert (=> b!1045243 m!964849))

(assert (=> b!1045243 m!964849))

(assert (=> b!1045243 m!964865))

(assert (=> b!1045059 d!126775))

(declare-fun bm!44356 () Bool)

(declare-fun call!44360 () ListLongMap!13773)

(declare-fun call!44365 () ListLongMap!13773)

(assert (=> bm!44356 (= call!44360 call!44365)))

(declare-fun b!1045245 () Bool)

(declare-fun e!592400 () Bool)

(declare-fun e!592389 () Bool)

(assert (=> b!1045245 (= e!592400 e!592389)))

(declare-fun c!106432 () Bool)

(assert (=> b!1045245 (= c!106432 (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045246 () Bool)

(declare-fun res!695890 () Bool)

(assert (=> b!1045246 (=> (not res!695890) (not e!592400))))

(declare-fun e!592394 () Bool)

(assert (=> b!1045246 (= res!695890 e!592394)))

(declare-fun c!106433 () Bool)

(assert (=> b!1045246 (= c!106433 (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44357 () Bool)

(declare-fun call!44359 () ListLongMap!13773)

(assert (=> bm!44357 (= call!44359 (getCurrentListMapNoExtraKeys!3569 lt!460684 (array!65862 (store (arr!31676 (_values!6412 thiss!1427)) (index!41536 lt!460682) (ValueCellFull!11708 (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6412 thiss!1427))) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun b!1045247 () Bool)

(declare-fun e!592397 () Bool)

(assert (=> b!1045247 (= e!592389 e!592397)))

(declare-fun res!695892 () Bool)

(declare-fun call!44361 () Bool)

(assert (=> b!1045247 (= res!695892 call!44361)))

(assert (=> b!1045247 (=> (not res!695892) (not e!592397))))

(declare-fun b!1045248 () Bool)

(declare-fun e!592395 () ListLongMap!13773)

(assert (=> b!1045248 (= e!592395 call!44360)))

(declare-fun b!1045249 () Bool)

(declare-fun e!592401 () Unit!34091)

(declare-fun Unit!34094 () Unit!34091)

(assert (=> b!1045249 (= e!592401 Unit!34094)))

(declare-fun b!1045250 () Bool)

(declare-fun c!106434 () Bool)

(assert (=> b!1045250 (= c!106434 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592390 () ListLongMap!13773)

(assert (=> b!1045250 (= e!592390 e!592395)))

(declare-fun b!1045251 () Bool)

(declare-fun e!592393 () Bool)

(assert (=> b!1045251 (= e!592394 e!592393)))

(declare-fun res!695893 () Bool)

(declare-fun call!44362 () Bool)

(assert (=> b!1045251 (= res!695893 call!44362)))

(assert (=> b!1045251 (=> (not res!695893) (not e!592393))))

(declare-fun b!1045252 () Bool)

(declare-fun lt!460846 () Unit!34091)

(assert (=> b!1045252 (= e!592401 lt!460846)))

(declare-fun lt!460829 () ListLongMap!13773)

(assert (=> b!1045252 (= lt!460829 (getCurrentListMapNoExtraKeys!3569 lt!460684 (array!65862 (store (arr!31676 (_values!6412 thiss!1427)) (index!41536 lt!460682) (ValueCellFull!11708 (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6412 thiss!1427))) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460832 () (_ BitVec 64))

(assert (=> b!1045252 (= lt!460832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460836 () (_ BitVec 64))

(assert (=> b!1045252 (= lt!460836 (select (arr!31675 lt!460684) #b00000000000000000000000000000000))))

(declare-fun lt!460840 () Unit!34091)

(assert (=> b!1045252 (= lt!460840 (addStillContains!628 lt!460829 lt!460832 (zeroValue!6223 thiss!1427) lt!460836))))

(assert (=> b!1045252 (contains!6090 (+!3129 lt!460829 (tuple2!15739 lt!460832 (zeroValue!6223 thiss!1427))) lt!460836)))

(declare-fun lt!460842 () Unit!34091)

(assert (=> b!1045252 (= lt!460842 lt!460840)))

(declare-fun lt!460827 () ListLongMap!13773)

(assert (=> b!1045252 (= lt!460827 (getCurrentListMapNoExtraKeys!3569 lt!460684 (array!65862 (store (arr!31676 (_values!6412 thiss!1427)) (index!41536 lt!460682) (ValueCellFull!11708 (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6412 thiss!1427))) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460837 () (_ BitVec 64))

(assert (=> b!1045252 (= lt!460837 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460826 () (_ BitVec 64))

(assert (=> b!1045252 (= lt!460826 (select (arr!31675 lt!460684) #b00000000000000000000000000000000))))

(declare-fun lt!460844 () Unit!34091)

(assert (=> b!1045252 (= lt!460844 (addApplyDifferent!484 lt!460827 lt!460837 (minValue!6223 thiss!1427) lt!460826))))

(assert (=> b!1045252 (= (apply!918 (+!3129 lt!460827 (tuple2!15739 lt!460837 (minValue!6223 thiss!1427))) lt!460826) (apply!918 lt!460827 lt!460826))))

(declare-fun lt!460845 () Unit!34091)

(assert (=> b!1045252 (= lt!460845 lt!460844)))

(declare-fun lt!460825 () ListLongMap!13773)

(assert (=> b!1045252 (= lt!460825 (getCurrentListMapNoExtraKeys!3569 lt!460684 (array!65862 (store (arr!31676 (_values!6412 thiss!1427)) (index!41536 lt!460682) (ValueCellFull!11708 (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6412 thiss!1427))) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460831 () (_ BitVec 64))

(assert (=> b!1045252 (= lt!460831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460841 () (_ BitVec 64))

(assert (=> b!1045252 (= lt!460841 (select (arr!31675 lt!460684) #b00000000000000000000000000000000))))

(declare-fun lt!460830 () Unit!34091)

(assert (=> b!1045252 (= lt!460830 (addApplyDifferent!484 lt!460825 lt!460831 (zeroValue!6223 thiss!1427) lt!460841))))

(assert (=> b!1045252 (= (apply!918 (+!3129 lt!460825 (tuple2!15739 lt!460831 (zeroValue!6223 thiss!1427))) lt!460841) (apply!918 lt!460825 lt!460841))))

(declare-fun lt!460839 () Unit!34091)

(assert (=> b!1045252 (= lt!460839 lt!460830)))

(declare-fun lt!460838 () ListLongMap!13773)

(assert (=> b!1045252 (= lt!460838 (getCurrentListMapNoExtraKeys!3569 lt!460684 (array!65862 (store (arr!31676 (_values!6412 thiss!1427)) (index!41536 lt!460682) (ValueCellFull!11708 (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6412 thiss!1427))) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460843 () (_ BitVec 64))

(assert (=> b!1045252 (= lt!460843 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460835 () (_ BitVec 64))

(assert (=> b!1045252 (= lt!460835 (select (arr!31675 lt!460684) #b00000000000000000000000000000000))))

(assert (=> b!1045252 (= lt!460846 (addApplyDifferent!484 lt!460838 lt!460843 (minValue!6223 thiss!1427) lt!460835))))

(assert (=> b!1045252 (= (apply!918 (+!3129 lt!460838 (tuple2!15739 lt!460843 (minValue!6223 thiss!1427))) lt!460835) (apply!918 lt!460838 lt!460835))))

(declare-fun b!1045253 () Bool)

(declare-fun res!695889 () Bool)

(assert (=> b!1045253 (=> (not res!695889) (not e!592400))))

(declare-fun e!592392 () Bool)

(assert (=> b!1045253 (= res!695889 e!592392)))

(declare-fun res!695887 () Bool)

(assert (=> b!1045253 (=> res!695887 e!592392)))

(declare-fun e!592399 () Bool)

(assert (=> b!1045253 (= res!695887 (not e!592399))))

(declare-fun res!695894 () Bool)

(assert (=> b!1045253 (=> (not res!695894) (not e!592399))))

(assert (=> b!1045253 (= res!695894 (bvslt #b00000000000000000000000000000000 (size!32211 lt!460684)))))

(declare-fun b!1045254 () Bool)

(declare-fun lt!460828 () ListLongMap!13773)

(declare-fun e!592391 () Bool)

(assert (=> b!1045254 (= e!592391 (= (apply!918 lt!460828 (select (arr!31675 lt!460684) #b00000000000000000000000000000000)) (get!16573 (select (arr!31676 (array!65862 (store (arr!31676 (_values!6412 thiss!1427)) (index!41536 lt!460682) (ValueCellFull!11708 (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6412 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32212 (array!65862 (store (arr!31676 (_values!6412 thiss!1427)) (index!41536 lt!460682) (ValueCellFull!11708 (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6412 thiss!1427))))))))

(assert (=> b!1045254 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32211 lt!460684)))))

(declare-fun b!1045255 () Bool)

(assert (=> b!1045255 (= e!592399 (validKeyInArray!0 (select (arr!31675 lt!460684) #b00000000000000000000000000000000)))))

(declare-fun b!1045256 () Bool)

(declare-fun e!592398 () ListLongMap!13773)

(assert (=> b!1045256 (= e!592398 e!592390)))

(declare-fun c!106436 () Bool)

(assert (=> b!1045256 (= c!106436 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045244 () Bool)

(assert (=> b!1045244 (= e!592393 (= (apply!918 lt!460828 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6223 thiss!1427)))))

(declare-fun d!126777 () Bool)

(assert (=> d!126777 e!592400))

(declare-fun res!695895 () Bool)

(assert (=> d!126777 (=> (not res!695895) (not e!592400))))

(assert (=> d!126777 (= res!695895 (or (bvsge #b00000000000000000000000000000000 (size!32211 lt!460684)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32211 lt!460684)))))))

(declare-fun lt!460833 () ListLongMap!13773)

(assert (=> d!126777 (= lt!460828 lt!460833)))

(declare-fun lt!460834 () Unit!34091)

(assert (=> d!126777 (= lt!460834 e!592401)))

(declare-fun c!106435 () Bool)

(declare-fun e!592396 () Bool)

(assert (=> d!126777 (= c!106435 e!592396)))

(declare-fun res!695891 () Bool)

(assert (=> d!126777 (=> (not res!695891) (not e!592396))))

(assert (=> d!126777 (= res!695891 (bvslt #b00000000000000000000000000000000 (size!32211 lt!460684)))))

(assert (=> d!126777 (= lt!460833 e!592398)))

(declare-fun c!106431 () Bool)

(assert (=> d!126777 (= c!106431 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126777 (validMask!0 (mask!30545 thiss!1427))))

(assert (=> d!126777 (= (getCurrentListMap!3946 lt!460684 (array!65862 (store (arr!31676 (_values!6412 thiss!1427)) (index!41536 lt!460682) (ValueCellFull!11708 (dynLambda!2017 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32212 (_values!6412 thiss!1427))) (mask!30545 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) lt!460828)))

(declare-fun b!1045257 () Bool)

(assert (=> b!1045257 (= e!592389 (not call!44361))))

(declare-fun b!1045258 () Bool)

(assert (=> b!1045258 (= e!592398 (+!3129 call!44365 (tuple2!15739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6223 thiss!1427))))))

(declare-fun bm!44358 () Bool)

(assert (=> bm!44358 (= call!44362 (contains!6090 lt!460828 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44359 () Bool)

(assert (=> bm!44359 (= call!44361 (contains!6090 lt!460828 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045259 () Bool)

(assert (=> b!1045259 (= e!592394 (not call!44362))))

(declare-fun b!1045260 () Bool)

(assert (=> b!1045260 (= e!592392 e!592391)))

(declare-fun res!695888 () Bool)

(assert (=> b!1045260 (=> (not res!695888) (not e!592391))))

(assert (=> b!1045260 (= res!695888 (contains!6090 lt!460828 (select (arr!31675 lt!460684) #b00000000000000000000000000000000)))))

(assert (=> b!1045260 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32211 lt!460684)))))

(declare-fun b!1045261 () Bool)

(declare-fun call!44363 () ListLongMap!13773)

(assert (=> b!1045261 (= e!592395 call!44363)))

(declare-fun bm!44360 () Bool)

(declare-fun call!44364 () ListLongMap!13773)

(assert (=> bm!44360 (= call!44364 call!44359)))

(declare-fun b!1045262 () Bool)

(assert (=> b!1045262 (= e!592397 (= (apply!918 lt!460828 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6223 thiss!1427)))))

(declare-fun b!1045263 () Bool)

(assert (=> b!1045263 (= e!592390 call!44360)))

(declare-fun bm!44361 () Bool)

(assert (=> bm!44361 (= call!44365 (+!3129 (ite c!106431 call!44359 (ite c!106436 call!44364 call!44363)) (ite (or c!106431 c!106436) (tuple2!15739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6223 thiss!1427)) (tuple2!15739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6223 thiss!1427)))))))

(declare-fun bm!44362 () Bool)

(assert (=> bm!44362 (= call!44363 call!44364)))

(declare-fun b!1045264 () Bool)

(assert (=> b!1045264 (= e!592396 (validKeyInArray!0 (select (arr!31675 lt!460684) #b00000000000000000000000000000000)))))

(assert (= (and d!126777 c!106431) b!1045258))

(assert (= (and d!126777 (not c!106431)) b!1045256))

(assert (= (and b!1045256 c!106436) b!1045263))

(assert (= (and b!1045256 (not c!106436)) b!1045250))

(assert (= (and b!1045250 c!106434) b!1045248))

(assert (= (and b!1045250 (not c!106434)) b!1045261))

(assert (= (or b!1045248 b!1045261) bm!44362))

(assert (= (or b!1045263 bm!44362) bm!44360))

(assert (= (or b!1045263 b!1045248) bm!44356))

(assert (= (or b!1045258 bm!44360) bm!44357))

(assert (= (or b!1045258 bm!44356) bm!44361))

(assert (= (and d!126777 res!695891) b!1045264))

(assert (= (and d!126777 c!106435) b!1045252))

(assert (= (and d!126777 (not c!106435)) b!1045249))

(assert (= (and d!126777 res!695895) b!1045253))

(assert (= (and b!1045253 res!695894) b!1045255))

(assert (= (and b!1045253 (not res!695887)) b!1045260))

(assert (= (and b!1045260 res!695888) b!1045254))

(assert (= (and b!1045253 res!695889) b!1045246))

(assert (= (and b!1045246 c!106433) b!1045251))

(assert (= (and b!1045246 (not c!106433)) b!1045259))

(assert (= (and b!1045251 res!695893) b!1045244))

(assert (= (or b!1045251 b!1045259) bm!44358))

(assert (= (and b!1045246 res!695890) b!1045245))

(assert (= (and b!1045245 c!106432) b!1045247))

(assert (= (and b!1045245 (not c!106432)) b!1045257))

(assert (= (and b!1045247 res!695892) b!1045262))

(assert (= (or b!1045247 b!1045257) bm!44359))

(declare-fun b_lambda!16199 () Bool)

(assert (=> (not b_lambda!16199) (not b!1045254)))

(assert (=> b!1045254 t!31198))

(declare-fun b_and!33673 () Bool)

(assert (= b_and!33671 (and (=> t!31198 result!14501) b_and!33673)))

(declare-fun m!964897 () Bool)

(assert (=> bm!44357 m!964897))

(declare-fun m!964899 () Bool)

(assert (=> b!1045262 m!964899))

(assert (=> d!126777 m!964811))

(declare-fun m!964901 () Bool)

(assert (=> bm!44361 m!964901))

(declare-fun m!964903 () Bool)

(assert (=> b!1045252 m!964903))

(declare-fun m!964905 () Bool)

(assert (=> b!1045252 m!964905))

(declare-fun m!964907 () Bool)

(assert (=> b!1045252 m!964907))

(declare-fun m!964909 () Bool)

(assert (=> b!1045252 m!964909))

(assert (=> b!1045252 m!964897))

(assert (=> b!1045252 m!964903))

(declare-fun m!964911 () Bool)

(assert (=> b!1045252 m!964911))

(assert (=> b!1045252 m!964909))

(declare-fun m!964913 () Bool)

(assert (=> b!1045252 m!964913))

(declare-fun m!964915 () Bool)

(assert (=> b!1045252 m!964915))

(declare-fun m!964917 () Bool)

(assert (=> b!1045252 m!964917))

(declare-fun m!964919 () Bool)

(assert (=> b!1045252 m!964919))

(declare-fun m!964921 () Bool)

(assert (=> b!1045252 m!964921))

(assert (=> b!1045252 m!964815))

(declare-fun m!964923 () Bool)

(assert (=> b!1045252 m!964923))

(declare-fun m!964925 () Bool)

(assert (=> b!1045252 m!964925))

(declare-fun m!964927 () Bool)

(assert (=> b!1045252 m!964927))

(assert (=> b!1045252 m!964917))

(declare-fun m!964929 () Bool)

(assert (=> b!1045252 m!964929))

(declare-fun m!964931 () Bool)

(assert (=> b!1045252 m!964931))

(assert (=> b!1045252 m!964923))

(declare-fun m!964933 () Bool)

(assert (=> bm!44358 m!964933))

(declare-fun m!964935 () Bool)

(assert (=> b!1045244 m!964935))

(assert (=> b!1045255 m!964815))

(assert (=> b!1045255 m!964815))

(assert (=> b!1045255 m!964817))

(assert (=> b!1045264 m!964815))

(assert (=> b!1045264 m!964815))

(assert (=> b!1045264 m!964817))

(assert (=> b!1045254 m!964815))

(declare-fun m!964937 () Bool)

(assert (=> b!1045254 m!964937))

(assert (=> b!1045254 m!964815))

(declare-fun m!964939 () Bool)

(assert (=> b!1045254 m!964939))

(assert (=> b!1045254 m!964937))

(assert (=> b!1045254 m!964701))

(declare-fun m!964941 () Bool)

(assert (=> b!1045254 m!964941))

(assert (=> b!1045254 m!964701))

(declare-fun m!964943 () Bool)

(assert (=> bm!44359 m!964943))

(assert (=> b!1045260 m!964815))

(assert (=> b!1045260 m!964815))

(declare-fun m!964945 () Bool)

(assert (=> b!1045260 m!964945))

(declare-fun m!964947 () Bool)

(assert (=> b!1045258 m!964947))

(assert (=> b!1045059 d!126777))

(declare-fun d!126779 () Bool)

(declare-fun res!695900 () Bool)

(declare-fun e!592406 () Bool)

(assert (=> d!126779 (=> res!695900 e!592406)))

(assert (=> d!126779 (= res!695900 (= (select (arr!31675 lt!460684) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126779 (= (arrayContainsKey!0 lt!460684 key!909 #b00000000000000000000000000000000) e!592406)))

(declare-fun b!1045269 () Bool)

(declare-fun e!592407 () Bool)

(assert (=> b!1045269 (= e!592406 e!592407)))

(declare-fun res!695901 () Bool)

(assert (=> b!1045269 (=> (not res!695901) (not e!592407))))

(assert (=> b!1045269 (= res!695901 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32211 lt!460684)))))

(declare-fun b!1045270 () Bool)

(assert (=> b!1045270 (= e!592407 (arrayContainsKey!0 lt!460684 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126779 (not res!695900)) b!1045269))

(assert (= (and b!1045269 res!695901) b!1045270))

(assert (=> d!126779 m!964815))

(declare-fun m!964949 () Bool)

(assert (=> b!1045270 m!964949))

(assert (=> b!1045059 d!126779))

(declare-fun d!126781 () Bool)

(declare-fun e!592412 () Bool)

(assert (=> d!126781 e!592412))

(declare-fun res!695911 () Bool)

(assert (=> d!126781 (=> (not res!695911) (not e!592412))))

(assert (=> d!126781 (= res!695911 (and (bvsge (index!41536 lt!460682) #b00000000000000000000000000000000) (bvslt (index!41536 lt!460682) (size!32211 (_keys!11687 thiss!1427)))))))

(declare-fun lt!460849 () Unit!34091)

(declare-fun choose!82 (array!65859 (_ BitVec 32) (_ BitVec 64)) Unit!34091)

(assert (=> d!126781 (= lt!460849 (choose!82 (_keys!11687 thiss!1427) (index!41536 lt!460682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!592413 () Bool)

(assert (=> d!126781 e!592413))

(declare-fun res!695910 () Bool)

(assert (=> d!126781 (=> (not res!695910) (not e!592413))))

(assert (=> d!126781 (= res!695910 (and (bvsge (index!41536 lt!460682) #b00000000000000000000000000000000) (bvslt (index!41536 lt!460682) (size!32211 (_keys!11687 thiss!1427)))))))

(assert (=> d!126781 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11687 thiss!1427) (index!41536 lt!460682) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460849)))

(declare-fun b!1045280 () Bool)

(declare-fun res!695913 () Bool)

(assert (=> b!1045280 (=> (not res!695913) (not e!592413))))

(assert (=> b!1045280 (= res!695913 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1045281 () Bool)

(assert (=> b!1045281 (= e!592413 (bvslt (size!32211 (_keys!11687 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1045282 () Bool)

(assert (=> b!1045282 (= e!592412 (= (arrayCountValidKeys!0 (array!65860 (store (arr!31675 (_keys!11687 thiss!1427)) (index!41536 lt!460682) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32211 (_keys!11687 thiss!1427))) #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11687 thiss!1427) #b00000000000000000000000000000000 (size!32211 (_keys!11687 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1045279 () Bool)

(declare-fun res!695912 () Bool)

(assert (=> b!1045279 (=> (not res!695912) (not e!592413))))

(assert (=> b!1045279 (= res!695912 (validKeyInArray!0 (select (arr!31675 (_keys!11687 thiss!1427)) (index!41536 lt!460682))))))

(assert (= (and d!126781 res!695910) b!1045279))

(assert (= (and b!1045279 res!695912) b!1045280))

(assert (= (and b!1045280 res!695913) b!1045281))

(assert (= (and d!126781 res!695911) b!1045282))

(declare-fun m!964951 () Bool)

(assert (=> d!126781 m!964951))

(declare-fun m!964953 () Bool)

(assert (=> b!1045280 m!964953))

(assert (=> b!1045282 m!964689))

(declare-fun m!964955 () Bool)

(assert (=> b!1045282 m!964955))

(assert (=> b!1045282 m!964691))

(declare-fun m!964957 () Bool)

(assert (=> b!1045279 m!964957))

(assert (=> b!1045279 m!964957))

(declare-fun m!964959 () Bool)

(assert (=> b!1045279 m!964959))

(assert (=> b!1045059 d!126781))

(declare-fun d!126783 () Bool)

(declare-fun e!592416 () Bool)

(assert (=> d!126783 e!592416))

(declare-fun res!695916 () Bool)

(assert (=> d!126783 (=> (not res!695916) (not e!592416))))

(assert (=> d!126783 (= res!695916 (bvslt (index!41536 lt!460682) (size!32211 (_keys!11687 thiss!1427))))))

(declare-fun lt!460852 () Unit!34091)

(declare-fun choose!121 (array!65859 (_ BitVec 32) (_ BitVec 64)) Unit!34091)

(assert (=> d!126783 (= lt!460852 (choose!121 (_keys!11687 thiss!1427) (index!41536 lt!460682) key!909))))

(assert (=> d!126783 (bvsge (index!41536 lt!460682) #b00000000000000000000000000000000)))

(assert (=> d!126783 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11687 thiss!1427) (index!41536 lt!460682) key!909) lt!460852)))

(declare-fun b!1045285 () Bool)

(assert (=> b!1045285 (= e!592416 (not (arrayContainsKey!0 (array!65860 (store (arr!31675 (_keys!11687 thiss!1427)) (index!41536 lt!460682) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32211 (_keys!11687 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126783 res!695916) b!1045285))

(declare-fun m!964961 () Bool)

(assert (=> d!126783 m!964961))

(assert (=> b!1045285 m!964689))

(declare-fun m!964963 () Bool)

(assert (=> b!1045285 m!964963))

(assert (=> b!1045059 d!126783))

(declare-fun d!126785 () Bool)

(declare-fun e!592419 () Bool)

(assert (=> d!126785 e!592419))

(declare-fun res!695919 () Bool)

(assert (=> d!126785 (=> (not res!695919) (not e!592419))))

(assert (=> d!126785 (= res!695919 (and (bvsge (index!41536 lt!460682) #b00000000000000000000000000000000) (bvslt (index!41536 lt!460682) (size!32211 (_keys!11687 thiss!1427)))))))

(declare-fun lt!460855 () Unit!34091)

(declare-fun choose!25 (array!65859 (_ BitVec 32) (_ BitVec 32)) Unit!34091)

(assert (=> d!126785 (= lt!460855 (choose!25 (_keys!11687 thiss!1427) (index!41536 lt!460682) (mask!30545 thiss!1427)))))

(assert (=> d!126785 (validMask!0 (mask!30545 thiss!1427))))

(assert (=> d!126785 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11687 thiss!1427) (index!41536 lt!460682) (mask!30545 thiss!1427)) lt!460855)))

(declare-fun b!1045288 () Bool)

(assert (=> b!1045288 (= e!592419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65860 (store (arr!31675 (_keys!11687 thiss!1427)) (index!41536 lt!460682) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32211 (_keys!11687 thiss!1427))) (mask!30545 thiss!1427)))))

(assert (= (and d!126785 res!695919) b!1045288))

(declare-fun m!964965 () Bool)

(assert (=> d!126785 m!964965))

(assert (=> d!126785 m!964811))

(assert (=> b!1045288 m!964689))

(declare-fun m!964967 () Bool)

(assert (=> b!1045288 m!964967))

(assert (=> b!1045059 d!126785))

(declare-fun d!126787 () Bool)

(declare-fun e!592422 () Bool)

(assert (=> d!126787 e!592422))

(declare-fun res!695922 () Bool)

(assert (=> d!126787 (=> (not res!695922) (not e!592422))))

(assert (=> d!126787 (= res!695922 (and (bvsge (index!41536 lt!460682) #b00000000000000000000000000000000) (bvslt (index!41536 lt!460682) (size!32211 (_keys!11687 thiss!1427)))))))

(declare-fun lt!460858 () Unit!34091)

(declare-fun choose!53 (array!65859 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21986) Unit!34091)

(assert (=> d!126787 (= lt!460858 (choose!53 (_keys!11687 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41536 lt!460682) #b00000000000000000000000000000000 Nil!21983))))

(assert (=> d!126787 (bvslt (size!32211 (_keys!11687 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126787 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11687 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41536 lt!460682) #b00000000000000000000000000000000 Nil!21983) lt!460858)))

(declare-fun b!1045291 () Bool)

(assert (=> b!1045291 (= e!592422 (arrayNoDuplicates!0 (array!65860 (store (arr!31675 (_keys!11687 thiss!1427)) (index!41536 lt!460682) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32211 (_keys!11687 thiss!1427))) #b00000000000000000000000000000000 Nil!21983))))

(assert (= (and d!126787 res!695922) b!1045291))

(declare-fun m!964969 () Bool)

(assert (=> d!126787 m!964969))

(assert (=> b!1045291 m!964689))

(declare-fun m!964971 () Bool)

(assert (=> b!1045291 m!964971))

(assert (=> b!1045059 d!126787))

(declare-fun d!126789 () Bool)

(assert (=> d!126789 (= (array_inv!24479 (_keys!11687 thiss!1427)) (bvsge (size!32211 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045054 d!126789))

(declare-fun d!126791 () Bool)

(assert (=> d!126791 (= (array_inv!24480 (_values!6412 thiss!1427)) (bvsge (size!32212 (_values!6412 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045054 d!126791))

(declare-fun condMapEmpty!38867 () Bool)

(declare-fun mapDefault!38867 () ValueCell!11708)

(assert (=> mapNonEmpty!38858 (= condMapEmpty!38867 (= mapRest!38858 ((as const (Array (_ BitVec 32) ValueCell!11708)) mapDefault!38867)))))

(declare-fun e!592427 () Bool)

(declare-fun mapRes!38867 () Bool)

(assert (=> mapNonEmpty!38858 (= tp!74550 (and e!592427 mapRes!38867))))

(declare-fun b!1045298 () Bool)

(declare-fun e!592428 () Bool)

(assert (=> b!1045298 (= e!592428 tp_is_empty!24823)))

(declare-fun mapIsEmpty!38867 () Bool)

(assert (=> mapIsEmpty!38867 mapRes!38867))

(declare-fun b!1045299 () Bool)

(assert (=> b!1045299 (= e!592427 tp_is_empty!24823)))

(declare-fun mapNonEmpty!38867 () Bool)

(declare-fun tp!74565 () Bool)

(assert (=> mapNonEmpty!38867 (= mapRes!38867 (and tp!74565 e!592428))))

(declare-fun mapValue!38867 () ValueCell!11708)

(declare-fun mapKey!38867 () (_ BitVec 32))

(declare-fun mapRest!38867 () (Array (_ BitVec 32) ValueCell!11708))

(assert (=> mapNonEmpty!38867 (= mapRest!38858 (store mapRest!38867 mapKey!38867 mapValue!38867))))

(assert (= (and mapNonEmpty!38858 condMapEmpty!38867) mapIsEmpty!38867))

(assert (= (and mapNonEmpty!38858 (not condMapEmpty!38867)) mapNonEmpty!38867))

(assert (= (and mapNonEmpty!38867 ((_ is ValueCellFull!11708) mapValue!38867)) b!1045298))

(assert (= (and mapNonEmpty!38858 ((_ is ValueCellFull!11708) mapDefault!38867)) b!1045299))

(declare-fun m!964973 () Bool)

(assert (=> mapNonEmpty!38867 m!964973))

(declare-fun b_lambda!16201 () Bool)

(assert (= b_lambda!16197 (or (and b!1045054 b_free!21103) b_lambda!16201)))

(declare-fun b_lambda!16203 () Bool)

(assert (= b_lambda!16195 (or (and b!1045054 b_free!21103) b_lambda!16203)))

(declare-fun b_lambda!16205 () Bool)

(assert (= b_lambda!16199 (or (and b!1045054 b_free!21103) b_lambda!16205)))

(check-sat (not b!1045223) (not bm!44358) (not b!1045270) (not bm!44344) (not b!1045192) (not b!1045244) (not mapNonEmpty!38867) (not d!126787) (not b!1045202) (not bm!44359) (not d!126761) (not b!1045134) (not d!126759) (not d!126769) (not b!1045208) (not b!1045225) (not bm!44351) (not bm!44327) (not b_lambda!16193) (not b!1045258) (not bm!44361) (not d!126777) (not b!1045262) b_and!33673 (not b!1045279) (not d!126765) (not b!1045280) (not b!1045212) (not bm!44347) (not b!1045260) (not b!1045210) (not b!1045115) (not b_lambda!16201) (not b!1045255) (not b!1045146) (not d!126767) (not b!1045243) (not b!1045149) (not bm!44354) (not b!1045252) (not b!1045264) (not b!1045288) (not b!1045203) (not b_lambda!16205) (not b!1045238) (not b!1045224) (not b!1045285) tp_is_empty!24823 (not bm!44345) (not b!1045116) (not d!126783) (not bm!44357) (not b!1045200) (not b_next!21103) (not b!1045239) (not d!126785) (not d!126781) (not b!1045206) (not bm!44355) (not bm!44343) (not b!1045114) (not b!1045291) (not b!1045282) (not b_lambda!16203) (not b!1045254))
(check-sat b_and!33673 (not b_next!21103))
