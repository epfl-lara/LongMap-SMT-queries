; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89440 () Bool)

(assert start!89440)

(declare-fun b!1025623 () Bool)

(declare-fun b_free!20439 () Bool)

(declare-fun b_next!20439 () Bool)

(assert (=> b!1025623 (= b_free!20439 (not b_next!20439))))

(declare-fun tp!72362 () Bool)

(declare-fun b_and!32685 () Bool)

(assert (=> b!1025623 (= tp!72362 b_and!32685)))

(declare-fun b!1025617 () Bool)

(declare-fun e!578322 () Bool)

(declare-fun e!578320 () Bool)

(declare-fun mapRes!37667 () Bool)

(assert (=> b!1025617 (= e!578322 (and e!578320 mapRes!37667))))

(declare-fun condMapEmpty!37667 () Bool)

(declare-datatypes ((V!37085 0))(
  ( (V!37086 (val!12130 Int)) )
))
(declare-datatypes ((ValueCell!11376 0))(
  ( (ValueCellFull!11376 (v!14699 V!37085)) (EmptyCell!11376) )
))
(declare-datatypes ((array!64368 0))(
  ( (array!64369 (arr!30993 (Array (_ BitVec 32) (_ BitVec 64))) (size!31506 (_ BitVec 32))) )
))
(declare-datatypes ((array!64370 0))(
  ( (array!64371 (arr!30994 (Array (_ BitVec 32) ValueCell!11376)) (size!31507 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5346 0))(
  ( (LongMapFixedSize!5347 (defaultEntry!6025 Int) (mask!29699 (_ BitVec 32)) (extraKeys!5757 (_ BitVec 32)) (zeroValue!5861 V!37085) (minValue!5861 V!37085) (_size!2728 (_ BitVec 32)) (_keys!11172 array!64368) (_values!6048 array!64370) (_vacant!2728 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5346)

(declare-fun mapDefault!37667 () ValueCell!11376)

(assert (=> b!1025617 (= condMapEmpty!37667 (= (arr!30994 (_values!6048 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11376)) mapDefault!37667)))))

(declare-fun mapNonEmpty!37667 () Bool)

(declare-fun tp!72363 () Bool)

(declare-fun e!578324 () Bool)

(assert (=> mapNonEmpty!37667 (= mapRes!37667 (and tp!72363 e!578324))))

(declare-fun mapValue!37667 () ValueCell!11376)

(declare-fun mapRest!37667 () (Array (_ BitVec 32) ValueCell!11376))

(declare-fun mapKey!37667 () (_ BitVec 32))

(assert (=> mapNonEmpty!37667 (= (arr!30994 (_values!6048 thiss!1427)) (store mapRest!37667 mapKey!37667 mapValue!37667))))

(declare-fun b!1025618 () Bool)

(declare-fun res!686649 () Bool)

(declare-fun e!578319 () Bool)

(assert (=> b!1025618 (=> res!686649 e!578319)))

(declare-datatypes ((SeekEntryResult!9624 0))(
  ( (MissingZero!9624 (index!40867 (_ BitVec 32))) (Found!9624 (index!40868 (_ BitVec 32))) (Intermediate!9624 (undefined!10436 Bool) (index!40869 (_ BitVec 32)) (x!91206 (_ BitVec 32))) (Undefined!9624) (MissingVacant!9624 (index!40870 (_ BitVec 32))) )
))
(declare-fun lt!451021 () SeekEntryResult!9624)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025618 (= res!686649 (not (validKeyInArray!0 (select (arr!30993 (_keys!11172 thiss!1427)) (index!40868 lt!451021)))))))

(declare-fun b!1025619 () Bool)

(declare-fun res!686650 () Bool)

(assert (=> b!1025619 (=> res!686650 e!578319)))

(assert (=> b!1025619 (= res!686650 (or (not (= (size!31506 (_keys!11172 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29699 thiss!1427)))) (bvslt (index!40868 lt!451021) #b00000000000000000000000000000000) (bvsge (index!40868 lt!451021) (size!31506 (_keys!11172 thiss!1427)))))))

(declare-fun mapIsEmpty!37667 () Bool)

(assert (=> mapIsEmpty!37667 mapRes!37667))

(declare-fun b!1025620 () Bool)

(declare-fun tp_is_empty!24159 () Bool)

(assert (=> b!1025620 (= e!578320 tp_is_empty!24159)))

(declare-fun b!1025621 () Bool)

(declare-fun e!578325 () Bool)

(declare-fun e!578323 () Bool)

(assert (=> b!1025621 (= e!578325 e!578323)))

(declare-fun res!686646 () Bool)

(assert (=> b!1025621 (=> (not res!686646) (not e!578323))))

(get-info :version)

(assert (=> b!1025621 (= res!686646 ((_ is Found!9624) lt!451021))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64368 (_ BitVec 32)) SeekEntryResult!9624)

(assert (=> b!1025621 (= lt!451021 (seekEntry!0 key!909 (_keys!11172 thiss!1427) (mask!29699 thiss!1427)))))

(declare-fun b!1025622 () Bool)

(assert (=> b!1025622 (= e!578324 tp_is_empty!24159)))

(declare-fun e!578326 () Bool)

(declare-fun array_inv!24003 (array!64368) Bool)

(declare-fun array_inv!24004 (array!64370) Bool)

(assert (=> b!1025623 (= e!578326 (and tp!72362 tp_is_empty!24159 (array_inv!24003 (_keys!11172 thiss!1427)) (array_inv!24004 (_values!6048 thiss!1427)) e!578322))))

(declare-fun b!1025624 () Bool)

(declare-fun res!686647 () Bool)

(assert (=> b!1025624 (=> res!686647 e!578319)))

(declare-datatypes ((List!21756 0))(
  ( (Nil!21753) (Cons!21752 (h!22950 (_ BitVec 64)) (t!30818 List!21756)) )
))
(declare-fun arrayNoDuplicates!0 (array!64368 (_ BitVec 32) List!21756) Bool)

(assert (=> b!1025624 (= res!686647 (not (arrayNoDuplicates!0 (_keys!11172 thiss!1427) #b00000000000000000000000000000000 Nil!21753)))))

(declare-fun b!1025625 () Bool)

(declare-fun res!686645 () Bool)

(assert (=> b!1025625 (=> (not res!686645) (not e!578325))))

(assert (=> b!1025625 (= res!686645 (not (= key!909 (bvneg key!909))))))

(declare-fun res!686651 () Bool)

(assert (=> start!89440 (=> (not res!686651) (not e!578325))))

(declare-fun valid!2031 (LongMapFixedSize!5346) Bool)

(assert (=> start!89440 (= res!686651 (valid!2031 thiss!1427))))

(assert (=> start!89440 e!578325))

(assert (=> start!89440 e!578326))

(assert (=> start!89440 true))

(declare-fun b!1025626 () Bool)

(assert (=> b!1025626 (= e!578323 (not e!578319))))

(declare-fun res!686648 () Bool)

(assert (=> b!1025626 (=> res!686648 e!578319)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025626 (= res!686648 (not (validMask!0 (mask!29699 thiss!1427))))))

(declare-fun lt!451020 () array!64368)

(assert (=> b!1025626 (arrayNoDuplicates!0 lt!451020 #b00000000000000000000000000000000 Nil!21753)))

(declare-datatypes ((Unit!33397 0))(
  ( (Unit!33398) )
))
(declare-fun lt!451019 () Unit!33397)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64368 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21756) Unit!33397)

(assert (=> b!1025626 (= lt!451019 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11172 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40868 lt!451021) #b00000000000000000000000000000000 Nil!21753))))

(declare-fun arrayCountValidKeys!0 (array!64368 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025626 (= (arrayCountValidKeys!0 lt!451020 #b00000000000000000000000000000000 (size!31506 (_keys!11172 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11172 thiss!1427) #b00000000000000000000000000000000 (size!31506 (_keys!11172 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025626 (= lt!451020 (array!64369 (store (arr!30993 (_keys!11172 thiss!1427)) (index!40868 lt!451021) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31506 (_keys!11172 thiss!1427))))))

(declare-fun lt!451022 () Unit!33397)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64368 (_ BitVec 32) (_ BitVec 64)) Unit!33397)

(assert (=> b!1025626 (= lt!451022 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11172 thiss!1427) (index!40868 lt!451021) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025627 () Bool)

(assert (=> b!1025627 (= e!578319 true)))

(declare-fun lt!451023 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64368 (_ BitVec 32)) Bool)

(assert (=> b!1025627 (= lt!451023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11172 thiss!1427) (mask!29699 thiss!1427)))))

(assert (= (and start!89440 res!686651) b!1025625))

(assert (= (and b!1025625 res!686645) b!1025621))

(assert (= (and b!1025621 res!686646) b!1025626))

(assert (= (and b!1025626 (not res!686648)) b!1025619))

(assert (= (and b!1025619 (not res!686650)) b!1025618))

(assert (= (and b!1025618 (not res!686649)) b!1025624))

(assert (= (and b!1025624 (not res!686647)) b!1025627))

(assert (= (and b!1025617 condMapEmpty!37667) mapIsEmpty!37667))

(assert (= (and b!1025617 (not condMapEmpty!37667)) mapNonEmpty!37667))

(assert (= (and mapNonEmpty!37667 ((_ is ValueCellFull!11376) mapValue!37667)) b!1025622))

(assert (= (and b!1025617 ((_ is ValueCellFull!11376) mapDefault!37667)) b!1025620))

(assert (= b!1025623 b!1025617))

(assert (= start!89440 b!1025623))

(declare-fun m!943791 () Bool)

(assert (=> b!1025618 m!943791))

(assert (=> b!1025618 m!943791))

(declare-fun m!943793 () Bool)

(assert (=> b!1025618 m!943793))

(declare-fun m!943795 () Bool)

(assert (=> b!1025627 m!943795))

(declare-fun m!943797 () Bool)

(assert (=> b!1025621 m!943797))

(declare-fun m!943799 () Bool)

(assert (=> b!1025624 m!943799))

(declare-fun m!943801 () Bool)

(assert (=> b!1025626 m!943801))

(declare-fun m!943803 () Bool)

(assert (=> b!1025626 m!943803))

(declare-fun m!943805 () Bool)

(assert (=> b!1025626 m!943805))

(declare-fun m!943807 () Bool)

(assert (=> b!1025626 m!943807))

(declare-fun m!943809 () Bool)

(assert (=> b!1025626 m!943809))

(declare-fun m!943811 () Bool)

(assert (=> b!1025626 m!943811))

(declare-fun m!943813 () Bool)

(assert (=> b!1025626 m!943813))

(declare-fun m!943815 () Bool)

(assert (=> b!1025623 m!943815))

(declare-fun m!943817 () Bool)

(assert (=> b!1025623 m!943817))

(declare-fun m!943819 () Bool)

(assert (=> start!89440 m!943819))

(declare-fun m!943821 () Bool)

(assert (=> mapNonEmpty!37667 m!943821))

(check-sat (not b!1025621) (not b!1025618) (not b!1025626) (not start!89440) (not mapNonEmpty!37667) (not b!1025623) (not b!1025624) b_and!32685 (not b_next!20439) tp_is_empty!24159 (not b!1025627))
(check-sat b_and!32685 (not b_next!20439))
