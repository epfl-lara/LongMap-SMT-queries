; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91650 () Bool)

(assert start!91650)

(declare-fun b!1043340 () Bool)

(declare-fun b_free!21087 () Bool)

(declare-fun b_next!21087 () Bool)

(assert (=> b!1043340 (= b_free!21087 (not b_next!21087))))

(declare-fun tp!74498 () Bool)

(declare-fun b_and!33619 () Bool)

(assert (=> b!1043340 (= tp!74498 b_and!33619)))

(declare-fun b!1043333 () Bool)

(declare-fun e!591114 () Bool)

(declare-fun tp_is_empty!24807 () Bool)

(assert (=> b!1043333 (= e!591114 tp_is_empty!24807)))

(declare-fun b!1043334 () Bool)

(declare-fun res!695105 () Bool)

(declare-fun e!591115 () Bool)

(assert (=> b!1043334 (=> res!695105 e!591115)))

(declare-datatypes ((V!37949 0))(
  ( (V!37950 (val!12454 Int)) )
))
(declare-datatypes ((ValueCell!11700 0))(
  ( (ValueCellFull!11700 (v!15045 V!37949)) (EmptyCell!11700) )
))
(declare-datatypes ((array!65776 0))(
  ( (array!65777 (arr!31641 (Array (_ BitVec 32) (_ BitVec 64))) (size!32176 (_ BitVec 32))) )
))
(declare-datatypes ((array!65778 0))(
  ( (array!65779 (arr!31642 (Array (_ BitVec 32) ValueCell!11700)) (size!32177 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5994 0))(
  ( (LongMapFixedSize!5995 (defaultEntry!6379 Int) (mask!30466 (_ BitVec 32)) (extraKeys!6107 (_ BitVec 32)) (zeroValue!6213 V!37949) (minValue!6213 V!37949) (_size!3052 (_ BitVec 32)) (_keys!11637 array!65776) (_values!6402 array!65778) (_vacant!3052 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5994)

(assert (=> b!1043334 (= res!695105 (or (not (= (size!32177 (_values!6402 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30466 thiss!1427)))) (not (= (size!32176 (_keys!11637 thiss!1427)) (size!32177 (_values!6402 thiss!1427)))) (bvslt (mask!30466 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6107 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6107 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1043335 () Bool)

(declare-fun e!591113 () Bool)

(assert (=> b!1043335 (= e!591113 (not e!591115))))

(declare-fun res!695102 () Bool)

(assert (=> b!1043335 (=> res!695102 e!591115)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043335 (= res!695102 (not (validMask!0 (mask!30466 thiss!1427))))))

(declare-fun lt!459868 () array!65776)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043335 (not (arrayContainsKey!0 lt!459868 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34063 0))(
  ( (Unit!34064) )
))
(declare-fun lt!459867 () Unit!34063)

(declare-datatypes ((SeekEntryResult!9827 0))(
  ( (MissingZero!9827 (index!41679 (_ BitVec 32))) (Found!9827 (index!41680 (_ BitVec 32))) (Intermediate!9827 (undefined!10639 Bool) (index!41681 (_ BitVec 32)) (x!93143 (_ BitVec 32))) (Undefined!9827) (MissingVacant!9827 (index!41682 (_ BitVec 32))) )
))
(declare-fun lt!459865 () SeekEntryResult!9827)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65776 (_ BitVec 32) (_ BitVec 64)) Unit!34063)

(assert (=> b!1043335 (= lt!459867 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11637 thiss!1427) (index!41680 lt!459865) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65776 (_ BitVec 32)) Bool)

(assert (=> b!1043335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459868 (mask!30466 thiss!1427))))

(declare-fun lt!459871 () Unit!34063)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65776 (_ BitVec 32) (_ BitVec 32)) Unit!34063)

(assert (=> b!1043335 (= lt!459871 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11637 thiss!1427) (index!41680 lt!459865) (mask!30466 thiss!1427)))))

(declare-datatypes ((List!21985 0))(
  ( (Nil!21982) (Cons!21981 (h!23189 (_ BitVec 64)) (t!31199 List!21985)) )
))
(declare-fun arrayNoDuplicates!0 (array!65776 (_ BitVec 32) List!21985) Bool)

(assert (=> b!1043335 (arrayNoDuplicates!0 lt!459868 #b00000000000000000000000000000000 Nil!21982)))

(declare-fun lt!459866 () Unit!34063)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65776 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21985) Unit!34063)

(assert (=> b!1043335 (= lt!459866 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11637 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41680 lt!459865) #b00000000000000000000000000000000 Nil!21982))))

(declare-fun arrayCountValidKeys!0 (array!65776 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043335 (= (arrayCountValidKeys!0 lt!459868 #b00000000000000000000000000000000 (size!32176 (_keys!11637 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11637 thiss!1427) #b00000000000000000000000000000000 (size!32176 (_keys!11637 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043335 (= lt!459868 (array!65777 (store (arr!31641 (_keys!11637 thiss!1427)) (index!41680 lt!459865) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32176 (_keys!11637 thiss!1427))))))

(declare-fun lt!459870 () Unit!34063)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65776 (_ BitVec 32) (_ BitVec 64)) Unit!34063)

(assert (=> b!1043335 (= lt!459870 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11637 thiss!1427) (index!41680 lt!459865) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043336 () Bool)

(declare-fun res!695101 () Bool)

(declare-fun e!591112 () Bool)

(assert (=> b!1043336 (=> (not res!695101) (not e!591112))))

(assert (=> b!1043336 (= res!695101 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043337 () Bool)

(declare-fun e!591117 () Bool)

(declare-fun mapRes!38831 () Bool)

(assert (=> b!1043337 (= e!591117 (and e!591114 mapRes!38831))))

(declare-fun condMapEmpty!38831 () Bool)

(declare-fun mapDefault!38831 () ValueCell!11700)

(assert (=> b!1043337 (= condMapEmpty!38831 (= (arr!31642 (_values!6402 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11700)) mapDefault!38831)))))

(declare-fun b!1043338 () Bool)

(assert (=> b!1043338 (= e!591115 true)))

(declare-fun lt!459869 () Bool)

(assert (=> b!1043338 (= lt!459869 (arrayNoDuplicates!0 (_keys!11637 thiss!1427) #b00000000000000000000000000000000 Nil!21982))))

(declare-fun b!1043339 () Bool)

(assert (=> b!1043339 (= e!591112 e!591113)))

(declare-fun res!695106 () Bool)

(assert (=> b!1043339 (=> (not res!695106) (not e!591113))))

(get-info :version)

(assert (=> b!1043339 (= res!695106 ((_ is Found!9827) lt!459865))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65776 (_ BitVec 32)) SeekEntryResult!9827)

(assert (=> b!1043339 (= lt!459865 (seekEntry!0 key!909 (_keys!11637 thiss!1427) (mask!30466 thiss!1427)))))

(declare-fun mapNonEmpty!38831 () Bool)

(declare-fun tp!74499 () Bool)

(declare-fun e!591110 () Bool)

(assert (=> mapNonEmpty!38831 (= mapRes!38831 (and tp!74499 e!591110))))

(declare-fun mapKey!38831 () (_ BitVec 32))

(declare-fun mapValue!38831 () ValueCell!11700)

(declare-fun mapRest!38831 () (Array (_ BitVec 32) ValueCell!11700))

(assert (=> mapNonEmpty!38831 (= (arr!31642 (_values!6402 thiss!1427)) (store mapRest!38831 mapKey!38831 mapValue!38831))))

(declare-fun e!591111 () Bool)

(declare-fun array_inv!24445 (array!65776) Bool)

(declare-fun array_inv!24446 (array!65778) Bool)

(assert (=> b!1043340 (= e!591111 (and tp!74498 tp_is_empty!24807 (array_inv!24445 (_keys!11637 thiss!1427)) (array_inv!24446 (_values!6402 thiss!1427)) e!591117))))

(declare-fun res!695103 () Bool)

(assert (=> start!91650 (=> (not res!695103) (not e!591112))))

(declare-fun valid!2250 (LongMapFixedSize!5994) Bool)

(assert (=> start!91650 (= res!695103 (valid!2250 thiss!1427))))

(assert (=> start!91650 e!591112))

(assert (=> start!91650 e!591111))

(assert (=> start!91650 true))

(declare-fun mapIsEmpty!38831 () Bool)

(assert (=> mapIsEmpty!38831 mapRes!38831))

(declare-fun b!1043341 () Bool)

(assert (=> b!1043341 (= e!591110 tp_is_empty!24807)))

(declare-fun b!1043342 () Bool)

(declare-fun res!695104 () Bool)

(assert (=> b!1043342 (=> res!695104 e!591115)))

(assert (=> b!1043342 (= res!695104 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11637 thiss!1427) (mask!30466 thiss!1427))))))

(assert (= (and start!91650 res!695103) b!1043336))

(assert (= (and b!1043336 res!695101) b!1043339))

(assert (= (and b!1043339 res!695106) b!1043335))

(assert (= (and b!1043335 (not res!695102)) b!1043334))

(assert (= (and b!1043334 (not res!695105)) b!1043342))

(assert (= (and b!1043342 (not res!695104)) b!1043338))

(assert (= (and b!1043337 condMapEmpty!38831) mapIsEmpty!38831))

(assert (= (and b!1043337 (not condMapEmpty!38831)) mapNonEmpty!38831))

(assert (= (and mapNonEmpty!38831 ((_ is ValueCellFull!11700) mapValue!38831)) b!1043341))

(assert (= (and b!1043337 ((_ is ValueCellFull!11700) mapDefault!38831)) b!1043333))

(assert (= b!1043340 b!1043337))

(assert (= start!91650 b!1043340))

(declare-fun m!962519 () Bool)

(assert (=> b!1043340 m!962519))

(declare-fun m!962521 () Bool)

(assert (=> b!1043340 m!962521))

(declare-fun m!962523 () Bool)

(assert (=> start!91650 m!962523))

(declare-fun m!962525 () Bool)

(assert (=> b!1043342 m!962525))

(declare-fun m!962527 () Bool)

(assert (=> mapNonEmpty!38831 m!962527))

(declare-fun m!962529 () Bool)

(assert (=> b!1043339 m!962529))

(declare-fun m!962531 () Bool)

(assert (=> b!1043335 m!962531))

(declare-fun m!962533 () Bool)

(assert (=> b!1043335 m!962533))

(declare-fun m!962535 () Bool)

(assert (=> b!1043335 m!962535))

(declare-fun m!962537 () Bool)

(assert (=> b!1043335 m!962537))

(declare-fun m!962539 () Bool)

(assert (=> b!1043335 m!962539))

(declare-fun m!962541 () Bool)

(assert (=> b!1043335 m!962541))

(declare-fun m!962543 () Bool)

(assert (=> b!1043335 m!962543))

(declare-fun m!962545 () Bool)

(assert (=> b!1043335 m!962545))

(declare-fun m!962547 () Bool)

(assert (=> b!1043335 m!962547))

(declare-fun m!962549 () Bool)

(assert (=> b!1043335 m!962549))

(declare-fun m!962551 () Bool)

(assert (=> b!1043335 m!962551))

(declare-fun m!962553 () Bool)

(assert (=> b!1043338 m!962553))

(check-sat tp_is_empty!24807 (not b!1043338) (not start!91650) (not b!1043342) b_and!33619 (not b!1043339) (not b!1043340) (not b!1043335) (not mapNonEmpty!38831) (not b_next!21087))
(check-sat b_and!33619 (not b_next!21087))
