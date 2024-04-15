; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3014 () Bool)

(assert start!3014)

(declare-fun b!17839 () Bool)

(declare-fun b_free!631 () Bool)

(declare-fun b_next!631 () Bool)

(assert (=> b!17839 (= b_free!631 (not b_next!631))))

(declare-fun tp!3083 () Bool)

(declare-fun b_and!1273 () Bool)

(assert (=> b!17839 (= tp!3083 b_and!1273)))

(declare-fun b!17838 () Bool)

(declare-fun e!11339 () Bool)

(declare-fun e!11332 () Bool)

(declare-fun mapRes!777 () Bool)

(assert (=> b!17838 (= e!11339 (and e!11332 mapRes!777))))

(declare-fun condMapEmpty!777 () Bool)

(declare-datatypes ((V!1019 0))(
  ( (V!1020 (val!474 Int)) )
))
(declare-datatypes ((ValueCell!248 0))(
  ( (ValueCellFull!248 (v!1451 V!1019)) (EmptyCell!248) )
))
(declare-datatypes ((array!977 0))(
  ( (array!978 (arr!470 (Array (_ BitVec 32) ValueCell!248)) (size!560 (_ BitVec 32))) )
))
(declare-datatypes ((array!979 0))(
  ( (array!980 (arr!471 (Array (_ BitVec 32) (_ BitVec 64))) (size!561 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!82 0))(
  ( (LongMapFixedSize!83 (defaultEntry!1652 Int) (mask!4579 (_ BitVec 32)) (extraKeys!1565 (_ BitVec 32)) (zeroValue!1588 V!1019) (minValue!1588 V!1019) (_size!73 (_ BitVec 32)) (_keys!3077 array!979) (_values!1649 array!977) (_vacant!73 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!82 0))(
  ( (Cell!83 (v!1452 LongMapFixedSize!82)) )
))
(declare-datatypes ((LongMap!82 0))(
  ( (LongMap!83 (underlying!52 Cell!82)) )
))
(declare-fun thiss!848 () LongMap!82)

(declare-fun mapDefault!777 () ValueCell!248)

(assert (=> b!17838 (= condMapEmpty!777 (= (arr!470 (_values!1649 (v!1452 (underlying!52 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!248)) mapDefault!777)))))

(declare-fun res!12655 () Bool)

(declare-fun e!11336 () Bool)

(assert (=> start!3014 (=> (not res!12655) (not e!11336))))

(declare-fun valid!47 (LongMap!82) Bool)

(assert (=> start!3014 (= res!12655 (valid!47 thiss!848))))

(assert (=> start!3014 e!11336))

(declare-fun e!11334 () Bool)

(assert (=> start!3014 e!11334))

(declare-fun e!11340 () Bool)

(declare-fun tp_is_empty!895 () Bool)

(declare-fun array_inv!335 (array!979) Bool)

(declare-fun array_inv!336 (array!977) Bool)

(assert (=> b!17839 (= e!11340 (and tp!3083 tp_is_empty!895 (array_inv!335 (_keys!3077 (v!1452 (underlying!52 thiss!848)))) (array_inv!336 (_values!1649 (v!1452 (underlying!52 thiss!848)))) e!11339))))

(declare-fun b!17840 () Bool)

(declare-datatypes ((tuple2!772 0))(
  ( (tuple2!773 (_1!387 Bool) (_2!387 LongMap!82)) )
))
(declare-fun e!11331 () tuple2!772)

(assert (=> b!17840 (= e!11331 (tuple2!773 true thiss!848))))

(declare-fun b!17841 () Bool)

(declare-fun repack!19 (LongMap!82) tuple2!772)

(assert (=> b!17841 (= e!11331 (repack!19 thiss!848))))

(declare-fun mapIsEmpty!777 () Bool)

(assert (=> mapIsEmpty!777 mapRes!777))

(declare-fun mapNonEmpty!777 () Bool)

(declare-fun tp!3084 () Bool)

(declare-fun e!11338 () Bool)

(assert (=> mapNonEmpty!777 (= mapRes!777 (and tp!3084 e!11338))))

(declare-fun mapRest!777 () (Array (_ BitVec 32) ValueCell!248))

(declare-fun mapKey!777 () (_ BitVec 32))

(declare-fun mapValue!777 () ValueCell!248)

(assert (=> mapNonEmpty!777 (= (arr!470 (_values!1649 (v!1452 (underlying!52 thiss!848)))) (store mapRest!777 mapKey!777 mapValue!777))))

(declare-fun b!17842 () Bool)

(declare-fun e!11337 () Bool)

(assert (=> b!17842 (= e!11334 e!11337)))

(declare-fun b!17843 () Bool)

(declare-fun e!11335 () Bool)

(assert (=> b!17843 (= e!11336 e!11335)))

(declare-fun res!12656 () Bool)

(assert (=> b!17843 (=> (not res!12656) (not e!11335))))

(declare-fun lt!4631 () tuple2!772)

(assert (=> b!17843 (= res!12656 (not (_1!387 lt!4631)))))

(assert (=> b!17843 (= lt!4631 e!11331)))

(declare-fun c!1781 () Bool)

(declare-fun imbalanced!19 (LongMap!82) Bool)

(assert (=> b!17843 (= c!1781 (imbalanced!19 thiss!848))))

(declare-fun b!17844 () Bool)

(assert (=> b!17844 (= e!11338 tp_is_empty!895)))

(declare-fun b!17845 () Bool)

(assert (=> b!17845 (= e!11337 e!11340)))

(declare-fun b!17846 () Bool)

(assert (=> b!17846 (= e!11332 tp_is_empty!895)))

(declare-fun b!17847 () Bool)

(assert (=> b!17847 (= e!11335 false)))

(declare-fun lt!4632 () Bool)

(assert (=> b!17847 (= lt!4632 (valid!47 (_2!387 lt!4631)))))

(assert (= (and start!3014 res!12655) b!17843))

(assert (= (and b!17843 c!1781) b!17841))

(assert (= (and b!17843 (not c!1781)) b!17840))

(assert (= (and b!17843 res!12656) b!17847))

(assert (= (and b!17838 condMapEmpty!777) mapIsEmpty!777))

(assert (= (and b!17838 (not condMapEmpty!777)) mapNonEmpty!777))

(get-info :version)

(assert (= (and mapNonEmpty!777 ((_ is ValueCellFull!248) mapValue!777)) b!17844))

(assert (= (and b!17838 ((_ is ValueCellFull!248) mapDefault!777)) b!17846))

(assert (= b!17839 b!17838))

(assert (= b!17845 b!17839))

(assert (= b!17842 b!17845))

(assert (= start!3014 b!17842))

(declare-fun m!12451 () Bool)

(assert (=> mapNonEmpty!777 m!12451))

(declare-fun m!12453 () Bool)

(assert (=> b!17841 m!12453))

(declare-fun m!12455 () Bool)

(assert (=> start!3014 m!12455))

(declare-fun m!12457 () Bool)

(assert (=> b!17847 m!12457))

(declare-fun m!12459 () Bool)

(assert (=> b!17843 m!12459))

(declare-fun m!12461 () Bool)

(assert (=> b!17839 m!12461))

(declare-fun m!12463 () Bool)

(assert (=> b!17839 m!12463))

(check-sat (not b_next!631) (not b!17847) (not b!17843) (not mapNonEmpty!777) b_and!1273 tp_is_empty!895 (not start!3014) (not b!17841) (not b!17839))
(check-sat b_and!1273 (not b_next!631))
