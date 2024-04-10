; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75740 () Bool)

(assert start!75740)

(declare-fun b!890603 () Bool)

(declare-fun b_free!15711 () Bool)

(declare-fun b_next!15711 () Bool)

(assert (=> b!890603 (= b_free!15711 (not b_next!15711))))

(declare-fun tp!55102 () Bool)

(declare-fun b_and!25951 () Bool)

(assert (=> b!890603 (= tp!55102 b_and!25951)))

(declare-fun b!890597 () Bool)

(declare-fun res!603425 () Bool)

(declare-fun e!496761 () Bool)

(assert (=> b!890597 (=> (not res!603425) (not e!496761))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890597 (= res!603425 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28613 () Bool)

(declare-fun mapRes!28613 () Bool)

(declare-fun tp!55101 () Bool)

(declare-fun e!496760 () Bool)

(assert (=> mapNonEmpty!28613 (= mapRes!28613 (and tp!55101 e!496760))))

(declare-datatypes ((array!52058 0))(
  ( (array!52059 (arr!25035 (Array (_ BitVec 32) (_ BitVec 64))) (size!25479 (_ BitVec 32))) )
))
(declare-datatypes ((V!29017 0))(
  ( (V!29018 (val!9070 Int)) )
))
(declare-datatypes ((ValueCell!8538 0))(
  ( (ValueCellFull!8538 (v!11548 V!29017)) (EmptyCell!8538) )
))
(declare-datatypes ((array!52060 0))(
  ( (array!52061 (arr!25036 (Array (_ BitVec 32) ValueCell!8538)) (size!25480 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4092 0))(
  ( (LongMapFixedSize!4093 (defaultEntry!5243 Int) (mask!25720 (_ BitVec 32)) (extraKeys!4937 (_ BitVec 32)) (zeroValue!5041 V!29017) (minValue!5041 V!29017) (_size!2101 (_ BitVec 32)) (_keys!9926 array!52058) (_values!5228 array!52060) (_vacant!2101 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4092)

(declare-fun mapRest!28613 () (Array (_ BitVec 32) ValueCell!8538))

(declare-fun mapKey!28613 () (_ BitVec 32))

(declare-fun mapValue!28613 () ValueCell!8538)

(assert (=> mapNonEmpty!28613 (= (arr!25036 (_values!5228 thiss!1181)) (store mapRest!28613 mapKey!28613 mapValue!28613))))

(declare-fun res!603427 () Bool)

(assert (=> start!75740 (=> (not res!603427) (not e!496761))))

(declare-fun valid!1588 (LongMapFixedSize!4092) Bool)

(assert (=> start!75740 (= res!603427 (valid!1588 thiss!1181))))

(assert (=> start!75740 e!496761))

(declare-fun e!496764 () Bool)

(assert (=> start!75740 e!496764))

(assert (=> start!75740 true))

(declare-fun b!890598 () Bool)

(declare-fun tp_is_empty!18039 () Bool)

(assert (=> b!890598 (= e!496760 tp_is_empty!18039)))

(declare-fun b!890599 () Bool)

(declare-fun e!496759 () Bool)

(assert (=> b!890599 (= e!496761 (not e!496759))))

(declare-fun res!603422 () Bool)

(assert (=> b!890599 (=> res!603422 e!496759)))

(declare-datatypes ((SeekEntryResult!8804 0))(
  ( (MissingZero!8804 (index!37587 (_ BitVec 32))) (Found!8804 (index!37588 (_ BitVec 32))) (Intermediate!8804 (undefined!9616 Bool) (index!37589 (_ BitVec 32)) (x!75660 (_ BitVec 32))) (Undefined!8804) (MissingVacant!8804 (index!37590 (_ BitVec 32))) )
))
(declare-fun lt!402355 () SeekEntryResult!8804)

(get-info :version)

(assert (=> b!890599 (= res!603422 (not ((_ is Found!8804) lt!402355)))))

(declare-fun e!496756 () Bool)

(assert (=> b!890599 e!496756))

(declare-fun res!603424 () Bool)

(assert (=> b!890599 (=> res!603424 e!496756)))

(assert (=> b!890599 (= res!603424 (not ((_ is Found!8804) lt!402355)))))

(declare-datatypes ((Unit!30308 0))(
  ( (Unit!30309) )
))
(declare-fun lt!402357 () Unit!30308)

(declare-fun lemmaSeekEntryGivesInRangeIndex!14 (array!52058 array!52060 (_ BitVec 32) (_ BitVec 32) V!29017 V!29017 (_ BitVec 64)) Unit!30308)

(assert (=> b!890599 (= lt!402357 (lemmaSeekEntryGivesInRangeIndex!14 (_keys!9926 thiss!1181) (_values!5228 thiss!1181) (mask!25720 thiss!1181) (extraKeys!4937 thiss!1181) (zeroValue!5041 thiss!1181) (minValue!5041 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52058 (_ BitVec 32)) SeekEntryResult!8804)

(assert (=> b!890599 (= lt!402355 (seekEntry!0 key!785 (_keys!9926 thiss!1181) (mask!25720 thiss!1181)))))

(declare-fun b!890600 () Bool)

(declare-fun e!496762 () Bool)

(assert (=> b!890600 (= e!496759 e!496762)))

(declare-fun res!603426 () Bool)

(assert (=> b!890600 (=> res!603426 e!496762)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890600 (= res!603426 (not (validMask!0 (mask!25720 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890600 (arrayContainsKey!0 (_keys!9926 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402356 () Unit!30308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52058 (_ BitVec 64) (_ BitVec 32)) Unit!30308)

(assert (=> b!890600 (= lt!402356 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9926 thiss!1181) key!785 (index!37588 lt!402355)))))

(declare-fun b!890601 () Bool)

(declare-fun res!603428 () Bool)

(assert (=> b!890601 (=> res!603428 e!496762)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52058 (_ BitVec 32)) Bool)

(assert (=> b!890601 (= res!603428 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9926 thiss!1181) (mask!25720 thiss!1181))))))

(declare-fun b!890602 () Bool)

(assert (=> b!890602 (= e!496762 true)))

(declare-fun lt!402358 () Bool)

(declare-datatypes ((List!17722 0))(
  ( (Nil!17719) (Cons!17718 (h!18849 (_ BitVec 64)) (t!25021 List!17722)) )
))
(declare-fun arrayNoDuplicates!0 (array!52058 (_ BitVec 32) List!17722) Bool)

(assert (=> b!890602 (= lt!402358 (arrayNoDuplicates!0 (_keys!9926 thiss!1181) #b00000000000000000000000000000000 Nil!17719))))

(declare-fun e!496757 () Bool)

(declare-fun array_inv!19680 (array!52058) Bool)

(declare-fun array_inv!19681 (array!52060) Bool)

(assert (=> b!890603 (= e!496764 (and tp!55102 tp_is_empty!18039 (array_inv!19680 (_keys!9926 thiss!1181)) (array_inv!19681 (_values!5228 thiss!1181)) e!496757))))

(declare-fun b!890604 () Bool)

(declare-fun res!603423 () Bool)

(assert (=> b!890604 (=> res!603423 e!496762)))

(assert (=> b!890604 (= res!603423 (or (not (= (size!25480 (_values!5228 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25720 thiss!1181)))) (not (= (size!25479 (_keys!9926 thiss!1181)) (size!25480 (_values!5228 thiss!1181)))) (bvslt (mask!25720 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4937 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4937 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890605 () Bool)

(declare-fun e!496763 () Bool)

(assert (=> b!890605 (= e!496757 (and e!496763 mapRes!28613))))

(declare-fun condMapEmpty!28613 () Bool)

(declare-fun mapDefault!28613 () ValueCell!8538)

(assert (=> b!890605 (= condMapEmpty!28613 (= (arr!25036 (_values!5228 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8538)) mapDefault!28613)))))

(declare-fun b!890606 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890606 (= e!496756 (inRange!0 (index!37588 lt!402355) (mask!25720 thiss!1181)))))

(declare-fun b!890607 () Bool)

(assert (=> b!890607 (= e!496763 tp_is_empty!18039)))

(declare-fun mapIsEmpty!28613 () Bool)

(assert (=> mapIsEmpty!28613 mapRes!28613))

(assert (= (and start!75740 res!603427) b!890597))

(assert (= (and b!890597 res!603425) b!890599))

(assert (= (and b!890599 (not res!603424)) b!890606))

(assert (= (and b!890599 (not res!603422)) b!890600))

(assert (= (and b!890600 (not res!603426)) b!890604))

(assert (= (and b!890604 (not res!603423)) b!890601))

(assert (= (and b!890601 (not res!603428)) b!890602))

(assert (= (and b!890605 condMapEmpty!28613) mapIsEmpty!28613))

(assert (= (and b!890605 (not condMapEmpty!28613)) mapNonEmpty!28613))

(assert (= (and mapNonEmpty!28613 ((_ is ValueCellFull!8538) mapValue!28613)) b!890598))

(assert (= (and b!890605 ((_ is ValueCellFull!8538) mapDefault!28613)) b!890607))

(assert (= b!890603 b!890605))

(assert (= start!75740 b!890603))

(declare-fun m!829101 () Bool)

(assert (=> b!890602 m!829101))

(declare-fun m!829103 () Bool)

(assert (=> start!75740 m!829103))

(declare-fun m!829105 () Bool)

(assert (=> b!890599 m!829105))

(declare-fun m!829107 () Bool)

(assert (=> b!890599 m!829107))

(declare-fun m!829109 () Bool)

(assert (=> b!890600 m!829109))

(declare-fun m!829111 () Bool)

(assert (=> b!890600 m!829111))

(declare-fun m!829113 () Bool)

(assert (=> b!890600 m!829113))

(declare-fun m!829115 () Bool)

(assert (=> b!890606 m!829115))

(declare-fun m!829117 () Bool)

(assert (=> b!890603 m!829117))

(declare-fun m!829119 () Bool)

(assert (=> b!890603 m!829119))

(declare-fun m!829121 () Bool)

(assert (=> b!890601 m!829121))

(declare-fun m!829123 () Bool)

(assert (=> mapNonEmpty!28613 m!829123))

(check-sat (not b!890601) (not mapNonEmpty!28613) (not b_next!15711) (not b!890599) (not b!890603) (not b!890606) tp_is_empty!18039 b_and!25951 (not start!75740) (not b!890602) (not b!890600))
(check-sat b_and!25951 (not b_next!15711))
