; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75738 () Bool)

(assert start!75738)

(declare-fun b!890626 () Bool)

(declare-fun b_free!15727 () Bool)

(declare-fun b_next!15727 () Bool)

(assert (=> b!890626 (= b_free!15727 (not b_next!15727))))

(declare-fun tp!55150 () Bool)

(declare-fun b_and!25941 () Bool)

(assert (=> b!890626 (= tp!55150 b_and!25941)))

(declare-fun b!890623 () Bool)

(declare-fun e!496826 () Bool)

(declare-fun e!496832 () Bool)

(declare-fun mapRes!28637 () Bool)

(assert (=> b!890623 (= e!496826 (and e!496832 mapRes!28637))))

(declare-fun condMapEmpty!28637 () Bool)

(declare-datatypes ((array!52073 0))(
  ( (array!52074 (arr!25043 (Array (_ BitVec 32) (_ BitVec 64))) (size!25489 (_ BitVec 32))) )
))
(declare-datatypes ((V!29039 0))(
  ( (V!29040 (val!9078 Int)) )
))
(declare-datatypes ((ValueCell!8546 0))(
  ( (ValueCellFull!8546 (v!11550 V!29039)) (EmptyCell!8546) )
))
(declare-datatypes ((array!52075 0))(
  ( (array!52076 (arr!25044 (Array (_ BitVec 32) ValueCell!8546)) (size!25490 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4108 0))(
  ( (LongMapFixedSize!4109 (defaultEntry!5251 Int) (mask!25727 (_ BitVec 32)) (extraKeys!4945 (_ BitVec 32)) (zeroValue!5049 V!29039) (minValue!5049 V!29039) (_size!2109 (_ BitVec 32)) (_keys!9929 array!52073) (_values!5236 array!52075) (_vacant!2109 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4108)

(declare-fun mapDefault!28637 () ValueCell!8546)

(assert (=> b!890623 (= condMapEmpty!28637 (= (arr!25044 (_values!5236 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8546)) mapDefault!28637)))))

(declare-fun b!890624 () Bool)

(declare-fun e!496831 () Bool)

(declare-fun e!496825 () Bool)

(assert (=> b!890624 (= e!496831 (not e!496825))))

(declare-fun res!603485 () Bool)

(assert (=> b!890624 (=> res!603485 e!496825)))

(declare-datatypes ((SeekEntryResult!8813 0))(
  ( (MissingZero!8813 (index!37623 (_ BitVec 32))) (Found!8813 (index!37624 (_ BitVec 32))) (Intermediate!8813 (undefined!9625 Bool) (index!37625 (_ BitVec 32)) (x!75688 (_ BitVec 32))) (Undefined!8813) (MissingVacant!8813 (index!37626 (_ BitVec 32))) )
))
(declare-fun lt!402217 () SeekEntryResult!8813)

(get-info :version)

(assert (=> b!890624 (= res!603485 (not ((_ is Found!8813) lt!402217)))))

(declare-fun e!496829 () Bool)

(assert (=> b!890624 e!496829))

(declare-fun res!603484 () Bool)

(assert (=> b!890624 (=> res!603484 e!496829)))

(assert (=> b!890624 (= res!603484 (not ((_ is Found!8813) lt!402217)))))

(declare-datatypes ((Unit!30264 0))(
  ( (Unit!30265) )
))
(declare-fun lt!402216 () Unit!30264)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!22 (array!52073 array!52075 (_ BitVec 32) (_ BitVec 32) V!29039 V!29039 (_ BitVec 64)) Unit!30264)

(assert (=> b!890624 (= lt!402216 (lemmaSeekEntryGivesInRangeIndex!22 (_keys!9929 thiss!1181) (_values!5236 thiss!1181) (mask!25727 thiss!1181) (extraKeys!4945 thiss!1181) (zeroValue!5049 thiss!1181) (minValue!5049 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52073 (_ BitVec 32)) SeekEntryResult!8813)

(assert (=> b!890624 (= lt!402217 (seekEntry!0 key!785 (_keys!9929 thiss!1181) (mask!25727 thiss!1181)))))

(declare-fun b!890625 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890625 (= e!496829 (inRange!0 (index!37624 lt!402217) (mask!25727 thiss!1181)))))

(declare-fun e!496830 () Bool)

(declare-fun tp_is_empty!18055 () Bool)

(declare-fun array_inv!19732 (array!52073) Bool)

(declare-fun array_inv!19733 (array!52075) Bool)

(assert (=> b!890626 (= e!496830 (and tp!55150 tp_is_empty!18055 (array_inv!19732 (_keys!9929 thiss!1181)) (array_inv!19733 (_values!5236 thiss!1181)) e!496826))))

(declare-fun mapNonEmpty!28637 () Bool)

(declare-fun tp!55151 () Bool)

(declare-fun e!496824 () Bool)

(assert (=> mapNonEmpty!28637 (= mapRes!28637 (and tp!55151 e!496824))))

(declare-fun mapKey!28637 () (_ BitVec 32))

(declare-fun mapValue!28637 () ValueCell!8546)

(declare-fun mapRest!28637 () (Array (_ BitVec 32) ValueCell!8546))

(assert (=> mapNonEmpty!28637 (= (arr!25044 (_values!5236 thiss!1181)) (store mapRest!28637 mapKey!28637 mapValue!28637))))

(declare-fun b!890627 () Bool)

(declare-fun res!603483 () Bool)

(declare-fun e!496828 () Bool)

(assert (=> b!890627 (=> res!603483 e!496828)))

(assert (=> b!890627 (= res!603483 (or (not (= (size!25490 (_values!5236 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25727 thiss!1181)))) (not (= (size!25489 (_keys!9929 thiss!1181)) (size!25490 (_values!5236 thiss!1181)))) (bvslt (mask!25727 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4945 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4945 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890628 () Bool)

(assert (=> b!890628 (= e!496832 tp_is_empty!18055)))

(declare-fun mapIsEmpty!28637 () Bool)

(assert (=> mapIsEmpty!28637 mapRes!28637))

(declare-fun res!603480 () Bool)

(assert (=> start!75738 (=> (not res!603480) (not e!496831))))

(declare-fun valid!1600 (LongMapFixedSize!4108) Bool)

(assert (=> start!75738 (= res!603480 (valid!1600 thiss!1181))))

(assert (=> start!75738 e!496831))

(assert (=> start!75738 e!496830))

(assert (=> start!75738 true))

(declare-fun b!890622 () Bool)

(assert (=> b!890622 (= e!496825 e!496828)))

(declare-fun res!603481 () Bool)

(assert (=> b!890622 (=> res!603481 e!496828)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890622 (= res!603481 (not (validMask!0 (mask!25727 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890622 (arrayContainsKey!0 (_keys!9929 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402215 () Unit!30264)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52073 (_ BitVec 64) (_ BitVec 32)) Unit!30264)

(assert (=> b!890622 (= lt!402215 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9929 thiss!1181) key!785 (index!37624 lt!402217)))))

(declare-fun b!890629 () Bool)

(assert (=> b!890629 (= e!496828 true)))

(declare-fun lt!402218 () Bool)

(declare-datatypes ((List!17738 0))(
  ( (Nil!17735) (Cons!17734 (h!18865 (_ BitVec 64)) (t!25028 List!17738)) )
))
(declare-fun arrayNoDuplicates!0 (array!52073 (_ BitVec 32) List!17738) Bool)

(assert (=> b!890629 (= lt!402218 (arrayNoDuplicates!0 (_keys!9929 thiss!1181) #b00000000000000000000000000000000 Nil!17735))))

(declare-fun b!890630 () Bool)

(assert (=> b!890630 (= e!496824 tp_is_empty!18055)))

(declare-fun b!890631 () Bool)

(declare-fun res!603482 () Bool)

(assert (=> b!890631 (=> (not res!603482) (not e!496831))))

(assert (=> b!890631 (= res!603482 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890632 () Bool)

(declare-fun res!603486 () Bool)

(assert (=> b!890632 (=> res!603486 e!496828)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52073 (_ BitVec 32)) Bool)

(assert (=> b!890632 (= res!603486 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9929 thiss!1181) (mask!25727 thiss!1181))))))

(assert (= (and start!75738 res!603480) b!890631))

(assert (= (and b!890631 res!603482) b!890624))

(assert (= (and b!890624 (not res!603484)) b!890625))

(assert (= (and b!890624 (not res!603485)) b!890622))

(assert (= (and b!890622 (not res!603481)) b!890627))

(assert (= (and b!890627 (not res!603483)) b!890632))

(assert (= (and b!890632 (not res!603486)) b!890629))

(assert (= (and b!890623 condMapEmpty!28637) mapIsEmpty!28637))

(assert (= (and b!890623 (not condMapEmpty!28637)) mapNonEmpty!28637))

(assert (= (and mapNonEmpty!28637 ((_ is ValueCellFull!8546) mapValue!28637)) b!890630))

(assert (= (and b!890623 ((_ is ValueCellFull!8546) mapDefault!28637)) b!890628))

(assert (= b!890626 b!890623))

(assert (= start!75738 b!890626))

(declare-fun m!828535 () Bool)

(assert (=> b!890622 m!828535))

(declare-fun m!828537 () Bool)

(assert (=> b!890622 m!828537))

(declare-fun m!828539 () Bool)

(assert (=> b!890622 m!828539))

(declare-fun m!828541 () Bool)

(assert (=> b!890632 m!828541))

(declare-fun m!828543 () Bool)

(assert (=> b!890629 m!828543))

(declare-fun m!828545 () Bool)

(assert (=> b!890624 m!828545))

(declare-fun m!828547 () Bool)

(assert (=> b!890624 m!828547))

(declare-fun m!828549 () Bool)

(assert (=> b!890625 m!828549))

(declare-fun m!828551 () Bool)

(assert (=> b!890626 m!828551))

(declare-fun m!828553 () Bool)

(assert (=> b!890626 m!828553))

(declare-fun m!828555 () Bool)

(assert (=> start!75738 m!828555))

(declare-fun m!828557 () Bool)

(assert (=> mapNonEmpty!28637 m!828557))

(check-sat (not b!890622) (not b!890632) (not b!890624) (not b_next!15727) (not b!890629) (not b!890625) (not b!890626) b_and!25941 tp_is_empty!18055 (not mapNonEmpty!28637) (not start!75738))
(check-sat b_and!25941 (not b_next!15727))
