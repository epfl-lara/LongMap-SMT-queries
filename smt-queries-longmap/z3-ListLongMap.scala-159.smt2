; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3020 () Bool)

(assert start!3020)

(declare-fun b!17861 () Bool)

(declare-fun b_free!631 () Bool)

(declare-fun b_next!631 () Bool)

(assert (=> b!17861 (= b_free!631 (not b_next!631))))

(declare-fun tp!3084 () Bool)

(declare-fun b_and!1273 () Bool)

(assert (=> b!17861 (= tp!3084 b_and!1273)))

(declare-fun b!17856 () Bool)

(declare-fun e!11345 () Bool)

(assert (=> b!17856 (= e!11345 false)))

(declare-fun lt!4636 () Bool)

(declare-datatypes ((V!1019 0))(
  ( (V!1020 (val!474 Int)) )
))
(declare-datatypes ((ValueCell!248 0))(
  ( (ValueCellFull!248 (v!1452 V!1019)) (EmptyCell!248) )
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
  ( (Cell!83 (v!1453 LongMapFixedSize!82)) )
))
(declare-datatypes ((LongMap!82 0))(
  ( (LongMap!83 (underlying!52 Cell!82)) )
))
(declare-datatypes ((tuple2!774 0))(
  ( (tuple2!775 (_1!388 Bool) (_2!388 LongMap!82)) )
))
(declare-fun lt!4635 () tuple2!774)

(declare-fun valid!47 (LongMap!82) Bool)

(assert (=> b!17856 (= lt!4636 (valid!47 (_2!388 lt!4635)))))

(declare-fun b!17857 () Bool)

(declare-fun e!11349 () Bool)

(declare-fun e!11353 () Bool)

(declare-fun mapRes!777 () Bool)

(assert (=> b!17857 (= e!11349 (and e!11353 mapRes!777))))

(declare-fun condMapEmpty!777 () Bool)

(declare-fun thiss!848 () LongMap!82)

(declare-fun mapDefault!777 () ValueCell!248)

(assert (=> b!17857 (= condMapEmpty!777 (= (arr!470 (_values!1649 (v!1453 (underlying!52 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!248)) mapDefault!777)))))

(declare-fun b!17858 () Bool)

(declare-fun tp_is_empty!895 () Bool)

(assert (=> b!17858 (= e!11353 tp_is_empty!895)))

(declare-fun mapNonEmpty!777 () Bool)

(declare-fun tp!3083 () Bool)

(declare-fun e!11348 () Bool)

(assert (=> mapNonEmpty!777 (= mapRes!777 (and tp!3083 e!11348))))

(declare-fun mapRest!777 () (Array (_ BitVec 32) ValueCell!248))

(declare-fun mapKey!777 () (_ BitVec 32))

(declare-fun mapValue!777 () ValueCell!248)

(assert (=> mapNonEmpty!777 (= (arr!470 (_values!1649 (v!1453 (underlying!52 thiss!848)))) (store mapRest!777 mapKey!777 mapValue!777))))

(declare-fun res!12665 () Bool)

(declare-fun e!11354 () Bool)

(assert (=> start!3020 (=> (not res!12665) (not e!11354))))

(assert (=> start!3020 (= res!12665 (valid!47 thiss!848))))

(assert (=> start!3020 e!11354))

(declare-fun e!11350 () Bool)

(assert (=> start!3020 e!11350))

(declare-fun b!17859 () Bool)

(declare-fun e!11351 () Bool)

(assert (=> b!17859 (= e!11350 e!11351)))

(declare-fun b!17860 () Bool)

(assert (=> b!17860 (= e!11354 e!11345)))

(declare-fun res!12666 () Bool)

(assert (=> b!17860 (=> (not res!12666) (not e!11345))))

(assert (=> b!17860 (= res!12666 (not (_1!388 lt!4635)))))

(declare-fun e!11352 () tuple2!774)

(assert (=> b!17860 (= lt!4635 e!11352)))

(declare-fun c!1785 () Bool)

(declare-fun imbalanced!21 (LongMap!82) Bool)

(assert (=> b!17860 (= c!1785 (imbalanced!21 thiss!848))))

(declare-fun e!11347 () Bool)

(declare-fun array_inv!339 (array!979) Bool)

(declare-fun array_inv!340 (array!977) Bool)

(assert (=> b!17861 (= e!11347 (and tp!3084 tp_is_empty!895 (array_inv!339 (_keys!3077 (v!1453 (underlying!52 thiss!848)))) (array_inv!340 (_values!1649 (v!1453 (underlying!52 thiss!848)))) e!11349))))

(declare-fun b!17862 () Bool)

(assert (=> b!17862 (= e!11348 tp_is_empty!895)))

(declare-fun b!17863 () Bool)

(declare-fun repack!17 (LongMap!82) tuple2!774)

(assert (=> b!17863 (= e!11352 (repack!17 thiss!848))))

(declare-fun b!17864 () Bool)

(assert (=> b!17864 (= e!11352 (tuple2!775 true thiss!848))))

(declare-fun mapIsEmpty!777 () Bool)

(assert (=> mapIsEmpty!777 mapRes!777))

(declare-fun b!17865 () Bool)

(assert (=> b!17865 (= e!11351 e!11347)))

(assert (= (and start!3020 res!12665) b!17860))

(assert (= (and b!17860 c!1785) b!17863))

(assert (= (and b!17860 (not c!1785)) b!17864))

(assert (= (and b!17860 res!12666) b!17856))

(assert (= (and b!17857 condMapEmpty!777) mapIsEmpty!777))

(assert (= (and b!17857 (not condMapEmpty!777)) mapNonEmpty!777))

(get-info :version)

(assert (= (and mapNonEmpty!777 ((_ is ValueCellFull!248) mapValue!777)) b!17862))

(assert (= (and b!17857 ((_ is ValueCellFull!248) mapDefault!777)) b!17858))

(assert (= b!17861 b!17857))

(assert (= b!17865 b!17861))

(assert (= b!17859 b!17865))

(assert (= start!3020 b!17859))

(declare-fun m!12465 () Bool)

(assert (=> start!3020 m!12465))

(declare-fun m!12467 () Bool)

(assert (=> b!17856 m!12467))

(declare-fun m!12469 () Bool)

(assert (=> mapNonEmpty!777 m!12469))

(declare-fun m!12471 () Bool)

(assert (=> b!17863 m!12471))

(declare-fun m!12473 () Bool)

(assert (=> b!17861 m!12473))

(declare-fun m!12475 () Bool)

(assert (=> b!17861 m!12475))

(declare-fun m!12477 () Bool)

(assert (=> b!17860 m!12477))

(check-sat (not b!17863) (not mapNonEmpty!777) (not b_next!631) b_and!1273 (not b!17861) tp_is_empty!895 (not b!17856) (not start!3020) (not b!17860))
(check-sat b_and!1273 (not b_next!631))
