; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89466 () Bool)

(assert start!89466)

(declare-fun b!1025871 () Bool)

(declare-fun b_free!20467 () Bool)

(declare-fun b_next!20467 () Bool)

(assert (=> b!1025871 (= b_free!20467 (not b_next!20467))))

(declare-fun tp!72446 () Bool)

(declare-fun b_and!32687 () Bool)

(assert (=> b!1025871 (= tp!72446 b_and!32687)))

(declare-fun mapNonEmpty!37709 () Bool)

(declare-fun mapRes!37709 () Bool)

(declare-fun tp!72447 () Bool)

(declare-fun e!578568 () Bool)

(assert (=> mapNonEmpty!37709 (= mapRes!37709 (and tp!72447 e!578568))))

(declare-datatypes ((V!37123 0))(
  ( (V!37124 (val!12144 Int)) )
))
(declare-datatypes ((ValueCell!11390 0))(
  ( (ValueCellFull!11390 (v!14712 V!37123)) (EmptyCell!11390) )
))
(declare-fun mapValue!37709 () ValueCell!11390)

(declare-datatypes ((array!64363 0))(
  ( (array!64364 (arr!30990 (Array (_ BitVec 32) (_ BitVec 64))) (size!31505 (_ BitVec 32))) )
))
(declare-datatypes ((array!64365 0))(
  ( (array!64366 (arr!30991 (Array (_ BitVec 32) ValueCell!11390)) (size!31506 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5374 0))(
  ( (LongMapFixedSize!5375 (defaultEntry!6039 Int) (mask!29718 (_ BitVec 32)) (extraKeys!5771 (_ BitVec 32)) (zeroValue!5875 V!37123) (minValue!5875 V!37123) (_size!2742 (_ BitVec 32)) (_keys!11182 array!64363) (_values!6062 array!64365) (_vacant!2742 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5374)

(declare-fun mapRest!37709 () (Array (_ BitVec 32) ValueCell!11390))

(declare-fun mapKey!37709 () (_ BitVec 32))

(assert (=> mapNonEmpty!37709 (= (arr!30991 (_values!6062 thiss!1427)) (store mapRest!37709 mapKey!37709 mapValue!37709))))

(declare-fun b!1025868 () Bool)

(declare-fun e!578570 () Bool)

(declare-fun e!578569 () Bool)

(assert (=> b!1025868 (= e!578570 e!578569)))

(declare-fun res!686813 () Bool)

(assert (=> b!1025868 (=> (not res!686813) (not e!578569))))

(declare-datatypes ((SeekEntryResult!9631 0))(
  ( (MissingZero!9631 (index!40895 (_ BitVec 32))) (Found!9631 (index!40896 (_ BitVec 32))) (Intermediate!9631 (undefined!10443 Bool) (index!40897 (_ BitVec 32)) (x!91250 (_ BitVec 32))) (Undefined!9631) (MissingVacant!9631 (index!40898 (_ BitVec 32))) )
))
(declare-fun lt!451054 () SeekEntryResult!9631)

(get-info :version)

(assert (=> b!1025868 (= res!686813 ((_ is Found!9631) lt!451054))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64363 (_ BitVec 32)) SeekEntryResult!9631)

(assert (=> b!1025868 (= lt!451054 (seekEntry!0 key!909 (_keys!11182 thiss!1427) (mask!29718 thiss!1427)))))

(declare-fun b!1025869 () Bool)

(declare-fun res!686815 () Bool)

(assert (=> b!1025869 (=> (not res!686815) (not e!578570))))

(assert (=> b!1025869 (= res!686815 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025870 () Bool)

(declare-fun e!578566 () Bool)

(assert (=> b!1025870 (= e!578566 true)))

(declare-fun lt!451052 () Bool)

(declare-datatypes ((List!21803 0))(
  ( (Nil!21800) (Cons!21799 (h!22997 (_ BitVec 64)) (t!30856 List!21803)) )
))
(declare-fun arrayNoDuplicates!0 (array!64363 (_ BitVec 32) List!21803) Bool)

(assert (=> b!1025870 (= lt!451052 (arrayNoDuplicates!0 (_keys!11182 thiss!1427) #b00000000000000000000000000000000 Nil!21800))))

(declare-fun e!578567 () Bool)

(declare-fun tp_is_empty!24187 () Bool)

(declare-fun e!578564 () Bool)

(declare-fun array_inv!24015 (array!64363) Bool)

(declare-fun array_inv!24016 (array!64365) Bool)

(assert (=> b!1025871 (= e!578564 (and tp!72446 tp_is_empty!24187 (array_inv!24015 (_keys!11182 thiss!1427)) (array_inv!24016 (_values!6062 thiss!1427)) e!578567))))

(declare-fun b!1025872 () Bool)

(assert (=> b!1025872 (= e!578568 tp_is_empty!24187)))

(declare-fun b!1025873 () Bool)

(declare-fun e!578571 () Bool)

(assert (=> b!1025873 (= e!578567 (and e!578571 mapRes!37709))))

(declare-fun condMapEmpty!37709 () Bool)

(declare-fun mapDefault!37709 () ValueCell!11390)

(assert (=> b!1025873 (= condMapEmpty!37709 (= (arr!30991 (_values!6062 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11390)) mapDefault!37709)))))

(declare-fun mapIsEmpty!37709 () Bool)

(assert (=> mapIsEmpty!37709 mapRes!37709))

(declare-fun res!686814 () Bool)

(assert (=> start!89466 (=> (not res!686814) (not e!578570))))

(declare-fun valid!2038 (LongMapFixedSize!5374) Bool)

(assert (=> start!89466 (= res!686814 (valid!2038 thiss!1427))))

(assert (=> start!89466 e!578570))

(assert (=> start!89466 e!578564))

(assert (=> start!89466 true))

(declare-fun b!1025874 () Bool)

(assert (=> b!1025874 (= e!578569 (not e!578566))))

(declare-fun res!686812 () Bool)

(assert (=> b!1025874 (=> res!686812 e!578566)))

(assert (=> b!1025874 (= res!686812 (or (bvslt (index!40896 lt!451054) #b00000000000000000000000000000000) (bvsge (index!40896 lt!451054) (size!31505 (_keys!11182 thiss!1427))) (bvsge (size!31505 (_keys!11182 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451049 () array!64363)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64363 (_ BitVec 32)) Bool)

(assert (=> b!1025874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451049 (mask!29718 thiss!1427))))

(declare-datatypes ((Unit!33317 0))(
  ( (Unit!33318) )
))
(declare-fun lt!451053 () Unit!33317)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64363 (_ BitVec 32) (_ BitVec 32)) Unit!33317)

(assert (=> b!1025874 (= lt!451053 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11182 thiss!1427) (index!40896 lt!451054) (mask!29718 thiss!1427)))))

(assert (=> b!1025874 (arrayNoDuplicates!0 lt!451049 #b00000000000000000000000000000000 Nil!21800)))

(declare-fun lt!451050 () Unit!33317)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64363 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21803) Unit!33317)

(assert (=> b!1025874 (= lt!451050 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11182 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40896 lt!451054) #b00000000000000000000000000000000 Nil!21800))))

(declare-fun arrayCountValidKeys!0 (array!64363 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025874 (= (arrayCountValidKeys!0 lt!451049 #b00000000000000000000000000000000 (size!31505 (_keys!11182 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11182 thiss!1427) #b00000000000000000000000000000000 (size!31505 (_keys!11182 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025874 (= lt!451049 (array!64364 (store (arr!30990 (_keys!11182 thiss!1427)) (index!40896 lt!451054) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31505 (_keys!11182 thiss!1427))))))

(declare-fun lt!451051 () Unit!33317)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64363 (_ BitVec 32) (_ BitVec 64)) Unit!33317)

(assert (=> b!1025874 (= lt!451051 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11182 thiss!1427) (index!40896 lt!451054) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025875 () Bool)

(assert (=> b!1025875 (= e!578571 tp_is_empty!24187)))

(assert (= (and start!89466 res!686814) b!1025869))

(assert (= (and b!1025869 res!686815) b!1025868))

(assert (= (and b!1025868 res!686813) b!1025874))

(assert (= (and b!1025874 (not res!686812)) b!1025870))

(assert (= (and b!1025873 condMapEmpty!37709) mapIsEmpty!37709))

(assert (= (and b!1025873 (not condMapEmpty!37709)) mapNonEmpty!37709))

(assert (= (and mapNonEmpty!37709 ((_ is ValueCellFull!11390) mapValue!37709)) b!1025872))

(assert (= (and b!1025873 ((_ is ValueCellFull!11390) mapDefault!37709)) b!1025875))

(assert (= b!1025871 b!1025873))

(assert (= start!89466 b!1025871))

(declare-fun m!943595 () Bool)

(assert (=> start!89466 m!943595))

(declare-fun m!943597 () Bool)

(assert (=> b!1025870 m!943597))

(declare-fun m!943599 () Bool)

(assert (=> b!1025874 m!943599))

(declare-fun m!943601 () Bool)

(assert (=> b!1025874 m!943601))

(declare-fun m!943603 () Bool)

(assert (=> b!1025874 m!943603))

(declare-fun m!943605 () Bool)

(assert (=> b!1025874 m!943605))

(declare-fun m!943607 () Bool)

(assert (=> b!1025874 m!943607))

(declare-fun m!943609 () Bool)

(assert (=> b!1025874 m!943609))

(declare-fun m!943611 () Bool)

(assert (=> b!1025874 m!943611))

(declare-fun m!943613 () Bool)

(assert (=> b!1025874 m!943613))

(declare-fun m!943615 () Bool)

(assert (=> b!1025868 m!943615))

(declare-fun m!943617 () Bool)

(assert (=> mapNonEmpty!37709 m!943617))

(declare-fun m!943619 () Bool)

(assert (=> b!1025871 m!943619))

(declare-fun m!943621 () Bool)

(assert (=> b!1025871 m!943621))

(check-sat (not start!89466) tp_is_empty!24187 (not b!1025871) (not b!1025870) (not b_next!20467) b_and!32687 (not mapNonEmpty!37709) (not b!1025874) (not b!1025868))
(check-sat b_and!32687 (not b_next!20467))
