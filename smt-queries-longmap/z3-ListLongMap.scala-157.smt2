; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3002 () Bool)

(assert start!3002)

(declare-fun b!17660 () Bool)

(declare-fun b_free!619 () Bool)

(declare-fun b_next!619 () Bool)

(assert (=> b!17660 (= b_free!619 (not b_next!619))))

(declare-fun tp!3047 () Bool)

(declare-fun b_and!1261 () Bool)

(assert (=> b!17660 (= tp!3047 b_and!1261)))

(declare-fun b!17658 () Bool)

(declare-fun e!11153 () Bool)

(declare-fun tp_is_empty!883 () Bool)

(assert (=> b!17658 (= e!11153 tp_is_empty!883)))

(declare-fun b!17659 () Bool)

(declare-fun e!11159 () Bool)

(declare-fun e!11155 () Bool)

(assert (=> b!17659 (= e!11159 e!11155)))

(declare-fun e!11151 () Bool)

(declare-datatypes ((V!1003 0))(
  ( (V!1004 (val!468 Int)) )
))
(declare-datatypes ((ValueCell!242 0))(
  ( (ValueCellFull!242 (v!1439 V!1003)) (EmptyCell!242) )
))
(declare-datatypes ((array!953 0))(
  ( (array!954 (arr!458 (Array (_ BitVec 32) ValueCell!242)) (size!548 (_ BitVec 32))) )
))
(declare-datatypes ((array!955 0))(
  ( (array!956 (arr!459 (Array (_ BitVec 32) (_ BitVec 64))) (size!549 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!70 0))(
  ( (LongMapFixedSize!71 (defaultEntry!1646 Int) (mask!4569 (_ BitVec 32)) (extraKeys!1559 (_ BitVec 32)) (zeroValue!1582 V!1003) (minValue!1582 V!1003) (_size!67 (_ BitVec 32)) (_keys!3071 array!955) (_values!1643 array!953) (_vacant!67 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!70 0))(
  ( (Cell!71 (v!1440 LongMapFixedSize!70)) )
))
(declare-datatypes ((LongMap!70 0))(
  ( (LongMap!71 (underlying!46 Cell!70)) )
))
(declare-fun thiss!848 () LongMap!70)

(declare-fun e!11157 () Bool)

(declare-fun array_inv!329 (array!955) Bool)

(declare-fun array_inv!330 (array!953) Bool)

(assert (=> b!17660 (= e!11157 (and tp!3047 tp_is_empty!883 (array_inv!329 (_keys!3071 (v!1440 (underlying!46 thiss!848)))) (array_inv!330 (_values!1643 (v!1440 (underlying!46 thiss!848)))) e!11151))))

(declare-fun b!17661 () Bool)

(declare-fun e!11160 () Bool)

(assert (=> b!17661 (= e!11160 tp_is_empty!883)))

(declare-fun mapNonEmpty!759 () Bool)

(declare-fun mapRes!759 () Bool)

(declare-fun tp!3048 () Bool)

(assert (=> mapNonEmpty!759 (= mapRes!759 (and tp!3048 e!11153))))

(declare-fun mapKey!759 () (_ BitVec 32))

(declare-fun mapValue!759 () ValueCell!242)

(declare-fun mapRest!759 () (Array (_ BitVec 32) ValueCell!242))

(assert (=> mapNonEmpty!759 (= (arr!458 (_values!1643 (v!1440 (underlying!46 thiss!848)))) (store mapRest!759 mapKey!759 mapValue!759))))

(declare-fun res!12619 () Bool)

(declare-fun e!11156 () Bool)

(assert (=> start!3002 (=> (not res!12619) (not e!11156))))

(declare-fun valid!42 (LongMap!70) Bool)

(assert (=> start!3002 (= res!12619 (valid!42 thiss!848))))

(assert (=> start!3002 e!11156))

(assert (=> start!3002 e!11159))

(declare-fun mapIsEmpty!759 () Bool)

(assert (=> mapIsEmpty!759 mapRes!759))

(declare-fun b!17662 () Bool)

(declare-fun e!11154 () Bool)

(assert (=> b!17662 (= e!11154 false)))

(declare-fun lt!4595 () Bool)

(declare-datatypes ((tuple2!762 0))(
  ( (tuple2!763 (_1!382 Bool) (_2!382 LongMap!70)) )
))
(declare-fun lt!4596 () tuple2!762)

(assert (=> b!17662 (= lt!4595 (valid!42 (_2!382 lt!4596)))))

(declare-fun b!17663 () Bool)

(assert (=> b!17663 (= e!11156 e!11154)))

(declare-fun res!12620 () Bool)

(assert (=> b!17663 (=> (not res!12620) (not e!11154))))

(assert (=> b!17663 (= res!12620 (not (_1!382 lt!4596)))))

(declare-fun e!11158 () tuple2!762)

(assert (=> b!17663 (= lt!4596 e!11158)))

(declare-fun c!1763 () Bool)

(declare-fun imbalanced!15 (LongMap!70) Bool)

(assert (=> b!17663 (= c!1763 (imbalanced!15 thiss!848))))

(declare-fun b!17664 () Bool)

(assert (=> b!17664 (= e!11151 (and e!11160 mapRes!759))))

(declare-fun condMapEmpty!759 () Bool)

(declare-fun mapDefault!759 () ValueCell!242)

(assert (=> b!17664 (= condMapEmpty!759 (= (arr!458 (_values!1643 (v!1440 (underlying!46 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!242)) mapDefault!759)))))

(declare-fun b!17665 () Bool)

(assert (=> b!17665 (= e!11158 (tuple2!763 true thiss!848))))

(declare-fun b!17666 () Bool)

(assert (=> b!17666 (= e!11155 e!11157)))

(declare-fun b!17667 () Bool)

(declare-fun repack!15 (LongMap!70) tuple2!762)

(assert (=> b!17667 (= e!11158 (repack!15 thiss!848))))

(assert (= (and start!3002 res!12619) b!17663))

(assert (= (and b!17663 c!1763) b!17667))

(assert (= (and b!17663 (not c!1763)) b!17665))

(assert (= (and b!17663 res!12620) b!17662))

(assert (= (and b!17664 condMapEmpty!759) mapIsEmpty!759))

(assert (= (and b!17664 (not condMapEmpty!759)) mapNonEmpty!759))

(get-info :version)

(assert (= (and mapNonEmpty!759 ((_ is ValueCellFull!242) mapValue!759)) b!17658))

(assert (= (and b!17664 ((_ is ValueCellFull!242) mapDefault!759)) b!17661))

(assert (= b!17660 b!17664))

(assert (= b!17666 b!17660))

(assert (= b!17659 b!17666))

(assert (= start!3002 b!17659))

(declare-fun m!12367 () Bool)

(assert (=> b!17663 m!12367))

(declare-fun m!12369 () Bool)

(assert (=> mapNonEmpty!759 m!12369))

(declare-fun m!12371 () Bool)

(assert (=> b!17667 m!12371))

(declare-fun m!12373 () Bool)

(assert (=> b!17662 m!12373))

(declare-fun m!12375 () Bool)

(assert (=> start!3002 m!12375))

(declare-fun m!12377 () Bool)

(assert (=> b!17660 m!12377))

(declare-fun m!12379 () Bool)

(assert (=> b!17660 m!12379))

(check-sat (not mapNonEmpty!759) (not start!3002) (not b!17663) (not b_next!619) (not b!17660) (not b!17662) tp_is_empty!883 b_and!1261 (not b!17667))
(check-sat b_and!1261 (not b_next!619))
