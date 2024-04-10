; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3002 () Bool)

(assert start!3002)

(declare-fun b!17576 () Bool)

(declare-fun b_free!609 () Bool)

(declare-fun b_next!609 () Bool)

(assert (=> b!17576 (= b_free!609 (not b_next!609))))

(declare-fun tp!3017 () Bool)

(declare-fun b_and!1257 () Bool)

(assert (=> b!17576 (= tp!3017 b_and!1257)))

(declare-fun b!17568 () Bool)

(declare-fun e!11051 () Bool)

(declare-fun e!11055 () Bool)

(assert (=> b!17568 (= e!11051 e!11055)))

(declare-fun res!12622 () Bool)

(assert (=> b!17568 (=> (not res!12622) (not e!11055))))

(declare-datatypes ((V!989 0))(
  ( (V!990 (val!463 Int)) )
))
(declare-datatypes ((ValueCell!237 0))(
  ( (ValueCellFull!237 (v!1430 V!989)) (EmptyCell!237) )
))
(declare-datatypes ((array!951 0))(
  ( (array!952 (arr!457 (Array (_ BitVec 32) ValueCell!237)) (size!547 (_ BitVec 32))) )
))
(declare-datatypes ((array!953 0))(
  ( (array!954 (arr!458 (Array (_ BitVec 32) (_ BitVec 64))) (size!548 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!60 0))(
  ( (LongMapFixedSize!61 (defaultEntry!1641 Int) (mask!4560 (_ BitVec 32)) (extraKeys!1554 (_ BitVec 32)) (zeroValue!1577 V!989) (minValue!1577 V!989) (_size!62 (_ BitVec 32)) (_keys!3066 array!953) (_values!1638 array!951) (_vacant!62 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!60 0))(
  ( (Cell!61 (v!1431 LongMapFixedSize!60)) )
))
(declare-datatypes ((LongMap!60 0))(
  ( (LongMap!61 (underlying!41 Cell!60)) )
))
(declare-datatypes ((tuple2!748 0))(
  ( (tuple2!749 (_1!375 Bool) (_2!375 LongMap!60)) )
))
(declare-fun lt!4569 () tuple2!748)

(assert (=> b!17568 (= res!12622 (_1!375 lt!4569))))

(declare-fun e!11048 () tuple2!748)

(assert (=> b!17568 (= lt!4569 e!11048)))

(declare-fun c!1762 () Bool)

(declare-fun thiss!848 () LongMap!60)

(declare-fun imbalanced!14 (LongMap!60) Bool)

(assert (=> b!17568 (= c!1762 (imbalanced!14 thiss!848))))

(declare-fun res!12621 () Bool)

(assert (=> start!3002 (=> (not res!12621) (not e!11051))))

(declare-fun valid!31 (LongMap!60) Bool)

(assert (=> start!3002 (= res!12621 (valid!31 thiss!848))))

(assert (=> start!3002 e!11051))

(declare-fun e!11052 () Bool)

(assert (=> start!3002 e!11052))

(assert (=> start!3002 true))

(declare-fun tp_is_empty!873 () Bool)

(assert (=> start!3002 tp_is_empty!873))

(declare-fun b!17569 () Bool)

(assert (=> b!17569 (= e!11048 (tuple2!749 true thiss!848))))

(declare-fun b!17570 () Bool)

(declare-fun e!11056 () Bool)

(assert (=> b!17570 (= e!11056 tp_is_empty!873)))

(declare-fun b!17571 () Bool)

(declare-fun e!11050 () Bool)

(declare-fun e!11054 () Bool)

(assert (=> b!17571 (= e!11050 e!11054)))

(declare-fun b!17572 () Bool)

(assert (=> b!17572 (= e!11052 e!11050)))

(declare-fun b!17573 () Bool)

(assert (=> b!17573 (= e!11055 false)))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun lt!4570 () Bool)

(declare-fun v!259 () V!989)

(declare-datatypes ((tuple2!750 0))(
  ( (tuple2!751 (_1!376 Bool) (_2!376 LongMapFixedSize!60)) )
))
(declare-fun update!10 (LongMapFixedSize!60 (_ BitVec 64) V!989) tuple2!750)

(assert (=> b!17573 (= lt!4570 (valid!31 (LongMap!61 (Cell!61 (_2!376 (update!10 (v!1431 (underlying!41 (_2!375 lt!4569))) key!682 v!259))))))))

(declare-fun mapNonEmpty!744 () Bool)

(declare-fun mapRes!744 () Bool)

(declare-fun tp!3018 () Bool)

(declare-fun e!11049 () Bool)

(assert (=> mapNonEmpty!744 (= mapRes!744 (and tp!3018 e!11049))))

(declare-fun mapValue!744 () ValueCell!237)

(declare-fun mapRest!744 () (Array (_ BitVec 32) ValueCell!237))

(declare-fun mapKey!744 () (_ BitVec 32))

(assert (=> mapNonEmpty!744 (= (arr!457 (_values!1638 (v!1431 (underlying!41 thiss!848)))) (store mapRest!744 mapKey!744 mapValue!744))))

(declare-fun b!17574 () Bool)

(declare-fun repack!10 (LongMap!60) tuple2!748)

(assert (=> b!17574 (= e!11048 (repack!10 thiss!848))))

(declare-fun b!17575 () Bool)

(assert (=> b!17575 (= e!11049 tp_is_empty!873)))

(declare-fun e!11053 () Bool)

(declare-fun array_inv!317 (array!953) Bool)

(declare-fun array_inv!318 (array!951) Bool)

(assert (=> b!17576 (= e!11054 (and tp!3017 tp_is_empty!873 (array_inv!317 (_keys!3066 (v!1431 (underlying!41 thiss!848)))) (array_inv!318 (_values!1638 (v!1431 (underlying!41 thiss!848)))) e!11053))))

(declare-fun mapIsEmpty!744 () Bool)

(assert (=> mapIsEmpty!744 mapRes!744))

(declare-fun b!17577 () Bool)

(assert (=> b!17577 (= e!11053 (and e!11056 mapRes!744))))

(declare-fun condMapEmpty!744 () Bool)

(declare-fun mapDefault!744 () ValueCell!237)

(assert (=> b!17577 (= condMapEmpty!744 (= (arr!457 (_values!1638 (v!1431 (underlying!41 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!237)) mapDefault!744)))))

(assert (= (and start!3002 res!12621) b!17568))

(assert (= (and b!17568 c!1762) b!17574))

(assert (= (and b!17568 (not c!1762)) b!17569))

(assert (= (and b!17568 res!12622) b!17573))

(assert (= (and b!17577 condMapEmpty!744) mapIsEmpty!744))

(assert (= (and b!17577 (not condMapEmpty!744)) mapNonEmpty!744))

(get-info :version)

(assert (= (and mapNonEmpty!744 ((_ is ValueCellFull!237) mapValue!744)) b!17575))

(assert (= (and b!17577 ((_ is ValueCellFull!237) mapDefault!744)) b!17570))

(assert (= b!17576 b!17577))

(assert (= b!17571 b!17576))

(assert (= b!17572 b!17571))

(assert (= start!3002 b!17572))

(declare-fun m!12349 () Bool)

(assert (=> mapNonEmpty!744 m!12349))

(declare-fun m!12351 () Bool)

(assert (=> start!3002 m!12351))

(declare-fun m!12353 () Bool)

(assert (=> b!17573 m!12353))

(declare-fun m!12355 () Bool)

(assert (=> b!17573 m!12355))

(declare-fun m!12357 () Bool)

(assert (=> b!17568 m!12357))

(declare-fun m!12359 () Bool)

(assert (=> b!17574 m!12359))

(declare-fun m!12361 () Bool)

(assert (=> b!17576 m!12361))

(declare-fun m!12363 () Bool)

(assert (=> b!17576 m!12363))

(check-sat tp_is_empty!873 (not b_next!609) (not start!3002) (not b!17568) (not b!17574) (not mapNonEmpty!744) (not b!17576) (not b!17573) b_and!1257)
(check-sat b_and!1257 (not b_next!609))
