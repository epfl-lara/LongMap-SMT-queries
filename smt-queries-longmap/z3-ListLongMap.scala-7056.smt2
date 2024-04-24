; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89624 () Bool)

(assert start!89624)

(declare-fun b!1026113 () Bool)

(declare-fun b_free!20389 () Bool)

(declare-fun b_next!20389 () Bool)

(assert (=> b!1026113 (= b_free!20389 (not b_next!20389))))

(declare-fun tp!72212 () Bool)

(declare-fun b_and!32645 () Bool)

(assert (=> b!1026113 (= tp!72212 b_and!32645)))

(declare-fun b!1026107 () Bool)

(declare-fun e!578564 () Bool)

(declare-fun e!578567 () Bool)

(declare-fun mapRes!37592 () Bool)

(assert (=> b!1026107 (= e!578564 (and e!578567 mapRes!37592))))

(declare-fun condMapEmpty!37592 () Bool)

(declare-datatypes ((V!37019 0))(
  ( (V!37020 (val!12105 Int)) )
))
(declare-datatypes ((ValueCell!11351 0))(
  ( (ValueCellFull!11351 (v!14670 V!37019)) (EmptyCell!11351) )
))
(declare-datatypes ((array!64317 0))(
  ( (array!64318 (arr!30961 (Array (_ BitVec 32) (_ BitVec 64))) (size!31475 (_ BitVec 32))) )
))
(declare-datatypes ((array!64319 0))(
  ( (array!64320 (arr!30962 (Array (_ BitVec 32) ValueCell!11351)) (size!31476 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5296 0))(
  ( (LongMapFixedSize!5297 (defaultEntry!6000 Int) (mask!29718 (_ BitVec 32)) (extraKeys!5732 (_ BitVec 32)) (zeroValue!5836 V!37019) (minValue!5836 V!37019) (_size!2703 (_ BitVec 32)) (_keys!11185 array!64317) (_values!6023 array!64319) (_vacant!2703 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5296)

(declare-fun mapDefault!37592 () ValueCell!11351)

(assert (=> b!1026107 (= condMapEmpty!37592 (= (arr!30962 (_values!6023 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11351)) mapDefault!37592)))))

(declare-fun b!1026108 () Bool)

(declare-fun res!686631 () Bool)

(declare-fun e!578568 () Bool)

(assert (=> b!1026108 (=> res!686631 e!578568)))

(declare-datatypes ((List!21726 0))(
  ( (Nil!21723) (Cons!21722 (h!22929 (_ BitVec 64)) (t!30780 List!21726)) )
))
(declare-fun contains!5979 (List!21726 (_ BitVec 64)) Bool)

(assert (=> b!1026108 (= res!686631 (contains!5979 Nil!21723 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026109 () Bool)

(declare-fun e!578562 () Bool)

(declare-fun e!578563 () Bool)

(assert (=> b!1026109 (= e!578562 e!578563)))

(declare-fun res!686632 () Bool)

(assert (=> b!1026109 (=> (not res!686632) (not e!578563))))

(declare-datatypes ((SeekEntryResult!9560 0))(
  ( (MissingZero!9560 (index!40611 (_ BitVec 32))) (Found!9560 (index!40612 (_ BitVec 32))) (Intermediate!9560 (undefined!10372 Bool) (index!40613 (_ BitVec 32)) (x!91100 (_ BitVec 32))) (Undefined!9560) (MissingVacant!9560 (index!40614 (_ BitVec 32))) )
))
(declare-fun lt!451229 () SeekEntryResult!9560)

(get-info :version)

(assert (=> b!1026109 (= res!686632 ((_ is Found!9560) lt!451229))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64317 (_ BitVec 32)) SeekEntryResult!9560)

(assert (=> b!1026109 (= lt!451229 (seekEntry!0 key!909 (_keys!11185 thiss!1427) (mask!29718 thiss!1427)))))

(declare-fun b!1026110 () Bool)

(assert (=> b!1026110 (= e!578568 true)))

(declare-fun lt!451228 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64317 (_ BitVec 32) List!21726) Bool)

(assert (=> b!1026110 (= lt!451228 (arrayNoDuplicates!0 (_keys!11185 thiss!1427) #b00000000000000000000000000000000 Nil!21723))))

(declare-fun b!1026111 () Bool)

(declare-fun res!686633 () Bool)

(assert (=> b!1026111 (=> res!686633 e!578568)))

(assert (=> b!1026111 (= res!686633 (contains!5979 Nil!21723 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026112 () Bool)

(declare-fun tp_is_empty!24109 () Bool)

(assert (=> b!1026112 (= e!578567 tp_is_empty!24109)))

(declare-fun e!578569 () Bool)

(declare-fun array_inv!24003 (array!64317) Bool)

(declare-fun array_inv!24004 (array!64319) Bool)

(assert (=> b!1026113 (= e!578569 (and tp!72212 tp_is_empty!24109 (array_inv!24003 (_keys!11185 thiss!1427)) (array_inv!24004 (_values!6023 thiss!1427)) e!578564))))

(declare-fun b!1026114 () Bool)

(assert (=> b!1026114 (= e!578563 (not e!578568))))

(declare-fun res!686635 () Bool)

(assert (=> b!1026114 (=> res!686635 e!578568)))

(assert (=> b!1026114 (= res!686635 (or (bvsge (size!31475 (_keys!11185 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31475 (_keys!11185 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64317 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026114 (= (arrayCountValidKeys!0 (array!64318 (store (arr!30961 (_keys!11185 thiss!1427)) (index!40612 lt!451229) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31475 (_keys!11185 thiss!1427))) #b00000000000000000000000000000000 (size!31475 (_keys!11185 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11185 thiss!1427) #b00000000000000000000000000000000 (size!31475 (_keys!11185 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33374 0))(
  ( (Unit!33375) )
))
(declare-fun lt!451227 () Unit!33374)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64317 (_ BitVec 32) (_ BitVec 64)) Unit!33374)

(assert (=> b!1026114 (= lt!451227 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11185 thiss!1427) (index!40612 lt!451229) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37592 () Bool)

(assert (=> mapIsEmpty!37592 mapRes!37592))

(declare-fun b!1026115 () Bool)

(declare-fun e!578566 () Bool)

(assert (=> b!1026115 (= e!578566 tp_is_empty!24109)))

(declare-fun res!686634 () Bool)

(assert (=> start!89624 (=> (not res!686634) (not e!578562))))

(declare-fun valid!2022 (LongMapFixedSize!5296) Bool)

(assert (=> start!89624 (= res!686634 (valid!2022 thiss!1427))))

(assert (=> start!89624 e!578562))

(assert (=> start!89624 e!578569))

(assert (=> start!89624 true))

(declare-fun b!1026116 () Bool)

(declare-fun res!686630 () Bool)

(assert (=> b!1026116 (=> (not res!686630) (not e!578562))))

(assert (=> b!1026116 (= res!686630 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026117 () Bool)

(declare-fun res!686636 () Bool)

(assert (=> b!1026117 (=> res!686636 e!578568)))

(declare-fun noDuplicate!1481 (List!21726) Bool)

(assert (=> b!1026117 (= res!686636 (not (noDuplicate!1481 Nil!21723)))))

(declare-fun mapNonEmpty!37592 () Bool)

(declare-fun tp!72213 () Bool)

(assert (=> mapNonEmpty!37592 (= mapRes!37592 (and tp!72213 e!578566))))

(declare-fun mapKey!37592 () (_ BitVec 32))

(declare-fun mapValue!37592 () ValueCell!11351)

(declare-fun mapRest!37592 () (Array (_ BitVec 32) ValueCell!11351))

(assert (=> mapNonEmpty!37592 (= (arr!30962 (_values!6023 thiss!1427)) (store mapRest!37592 mapKey!37592 mapValue!37592))))

(assert (= (and start!89624 res!686634) b!1026116))

(assert (= (and b!1026116 res!686630) b!1026109))

(assert (= (and b!1026109 res!686632) b!1026114))

(assert (= (and b!1026114 (not res!686635)) b!1026117))

(assert (= (and b!1026117 (not res!686636)) b!1026111))

(assert (= (and b!1026111 (not res!686633)) b!1026108))

(assert (= (and b!1026108 (not res!686631)) b!1026110))

(assert (= (and b!1026107 condMapEmpty!37592) mapIsEmpty!37592))

(assert (= (and b!1026107 (not condMapEmpty!37592)) mapNonEmpty!37592))

(assert (= (and mapNonEmpty!37592 ((_ is ValueCellFull!11351) mapValue!37592)) b!1026115))

(assert (= (and b!1026107 ((_ is ValueCellFull!11351) mapDefault!37592)) b!1026112))

(assert (= b!1026113 b!1026107))

(assert (= start!89624 b!1026113))

(declare-fun m!944727 () Bool)

(assert (=> b!1026110 m!944727))

(declare-fun m!944729 () Bool)

(assert (=> start!89624 m!944729))

(declare-fun m!944731 () Bool)

(assert (=> mapNonEmpty!37592 m!944731))

(declare-fun m!944733 () Bool)

(assert (=> b!1026108 m!944733))

(declare-fun m!944735 () Bool)

(assert (=> b!1026111 m!944735))

(declare-fun m!944737 () Bool)

(assert (=> b!1026113 m!944737))

(declare-fun m!944739 () Bool)

(assert (=> b!1026113 m!944739))

(declare-fun m!944741 () Bool)

(assert (=> b!1026117 m!944741))

(declare-fun m!944743 () Bool)

(assert (=> b!1026114 m!944743))

(declare-fun m!944745 () Bool)

(assert (=> b!1026114 m!944745))

(declare-fun m!944747 () Bool)

(assert (=> b!1026114 m!944747))

(declare-fun m!944749 () Bool)

(assert (=> b!1026114 m!944749))

(declare-fun m!944751 () Bool)

(assert (=> b!1026109 m!944751))

(check-sat (not b!1026113) (not b!1026110) (not b!1026109) (not b_next!20389) (not b!1026111) (not b!1026114) (not b!1026108) b_and!32645 tp_is_empty!24109 (not start!89624) (not b!1026117) (not mapNonEmpty!37592))
(check-sat b_and!32645 (not b_next!20389))
