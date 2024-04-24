; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3032 () Bool)

(assert start!3032)

(declare-fun b!18036 () Bool)

(declare-fun b_free!643 () Bool)

(declare-fun b_next!643 () Bool)

(assert (=> b!18036 (= b_free!643 (not b_next!643))))

(declare-fun tp!3119 () Bool)

(declare-fun b_and!1285 () Bool)

(assert (=> b!18036 (= tp!3119 b_and!1285)))

(declare-datatypes ((V!1035 0))(
  ( (V!1036 (val!480 Int)) )
))
(declare-datatypes ((ValueCell!254 0))(
  ( (ValueCellFull!254 (v!1464 V!1035)) (EmptyCell!254) )
))
(declare-datatypes ((array!1001 0))(
  ( (array!1002 (arr!482 (Array (_ BitVec 32) ValueCell!254)) (size!572 (_ BitVec 32))) )
))
(declare-datatypes ((array!1003 0))(
  ( (array!1004 (arr!483 (Array (_ BitVec 32) (_ BitVec 64))) (size!573 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!94 0))(
  ( (LongMapFixedSize!95 (defaultEntry!1658 Int) (mask!4589 (_ BitVec 32)) (extraKeys!1571 (_ BitVec 32)) (zeroValue!1594 V!1035) (minValue!1594 V!1035) (_size!79 (_ BitVec 32)) (_keys!3083 array!1003) (_values!1655 array!1001) (_vacant!79 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!94 0))(
  ( (Cell!95 (v!1465 LongMapFixedSize!94)) )
))
(declare-datatypes ((LongMap!94 0))(
  ( (LongMap!95 (underlying!58 Cell!94)) )
))
(declare-fun thiss!848 () LongMap!94)

(declare-fun e!11525 () Bool)

(declare-fun e!11533 () Bool)

(declare-fun tp_is_empty!907 () Bool)

(declare-fun array_inv!349 (array!1003) Bool)

(declare-fun array_inv!350 (array!1001) Bool)

(assert (=> b!18036 (= e!11525 (and tp!3119 tp_is_empty!907 (array_inv!349 (_keys!3083 (v!1465 (underlying!58 thiss!848)))) (array_inv!350 (_values!1655 (v!1465 (underlying!58 thiss!848)))) e!11533))))

(declare-fun b!18037 () Bool)

(declare-datatypes ((tuple2!784 0))(
  ( (tuple2!785 (_1!393 Bool) (_2!393 LongMap!94)) )
))
(declare-fun e!11530 () tuple2!784)

(declare-fun repack!22 (LongMap!94) tuple2!784)

(assert (=> b!18037 (= e!11530 (repack!22 thiss!848))))

(declare-fun b!18038 () Bool)

(assert (=> b!18038 (= e!11530 (tuple2!785 true thiss!848))))

(declare-fun mapNonEmpty!795 () Bool)

(declare-fun mapRes!795 () Bool)

(declare-fun tp!3120 () Bool)

(declare-fun e!11526 () Bool)

(assert (=> mapNonEmpty!795 (= mapRes!795 (and tp!3120 e!11526))))

(declare-fun mapRest!795 () (Array (_ BitVec 32) ValueCell!254))

(declare-fun mapKey!795 () (_ BitVec 32))

(declare-fun mapValue!795 () ValueCell!254)

(assert (=> mapNonEmpty!795 (= (arr!482 (_values!1655 (v!1465 (underlying!58 thiss!848)))) (store mapRest!795 mapKey!795 mapValue!795))))

(declare-fun b!18040 () Bool)

(declare-fun e!11532 () Bool)

(assert (=> b!18040 (= e!11532 e!11525)))

(declare-fun b!18041 () Bool)

(declare-fun e!11528 () Bool)

(assert (=> b!18041 (= e!11528 tp_is_empty!907)))

(declare-fun b!18042 () Bool)

(declare-fun e!11531 () Bool)

(assert (=> b!18042 (= e!11531 false)))

(declare-fun lt!4671 () Bool)

(declare-fun lt!4672 () tuple2!784)

(declare-fun valid!52 (LongMap!94) Bool)

(assert (=> b!18042 (= lt!4671 (valid!52 (_2!393 lt!4672)))))

(declare-fun b!18043 () Bool)

(declare-fun e!11529 () Bool)

(assert (=> b!18043 (= e!11529 e!11531)))

(declare-fun res!12702 () Bool)

(assert (=> b!18043 (=> (not res!12702) (not e!11531))))

(assert (=> b!18043 (= res!12702 (not (_1!393 lt!4672)))))

(assert (=> b!18043 (= lt!4672 e!11530)))

(declare-fun c!1803 () Bool)

(declare-fun imbalanced!26 (LongMap!94) Bool)

(assert (=> b!18043 (= c!1803 (imbalanced!26 thiss!848))))

(declare-fun mapIsEmpty!795 () Bool)

(assert (=> mapIsEmpty!795 mapRes!795))

(declare-fun b!18044 () Bool)

(assert (=> b!18044 (= e!11526 tp_is_empty!907)))

(declare-fun b!18045 () Bool)

(assert (=> b!18045 (= e!11533 (and e!11528 mapRes!795))))

(declare-fun condMapEmpty!795 () Bool)

(declare-fun mapDefault!795 () ValueCell!254)

(assert (=> b!18045 (= condMapEmpty!795 (= (arr!482 (_values!1655 (v!1465 (underlying!58 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!254)) mapDefault!795)))))

(declare-fun b!18039 () Bool)

(declare-fun e!11534 () Bool)

(assert (=> b!18039 (= e!11534 e!11532)))

(declare-fun res!12701 () Bool)

(assert (=> start!3032 (=> (not res!12701) (not e!11529))))

(assert (=> start!3032 (= res!12701 (valid!52 thiss!848))))

(assert (=> start!3032 e!11529))

(assert (=> start!3032 e!11534))

(assert (= (and start!3032 res!12701) b!18043))

(assert (= (and b!18043 c!1803) b!18037))

(assert (= (and b!18043 (not c!1803)) b!18038))

(assert (= (and b!18043 res!12702) b!18042))

(assert (= (and b!18045 condMapEmpty!795) mapIsEmpty!795))

(assert (= (and b!18045 (not condMapEmpty!795)) mapNonEmpty!795))

(get-info :version)

(assert (= (and mapNonEmpty!795 ((_ is ValueCellFull!254) mapValue!795)) b!18044))

(assert (= (and b!18045 ((_ is ValueCellFull!254) mapDefault!795)) b!18041))

(assert (= b!18036 b!18045))

(assert (= b!18040 b!18036))

(assert (= b!18039 b!18040))

(assert (= start!3032 b!18039))

(declare-fun m!12549 () Bool)

(assert (=> b!18042 m!12549))

(declare-fun m!12551 () Bool)

(assert (=> start!3032 m!12551))

(declare-fun m!12553 () Bool)

(assert (=> b!18036 m!12553))

(declare-fun m!12555 () Bool)

(assert (=> b!18036 m!12555))

(declare-fun m!12557 () Bool)

(assert (=> b!18043 m!12557))

(declare-fun m!12559 () Bool)

(assert (=> b!18037 m!12559))

(declare-fun m!12561 () Bool)

(assert (=> mapNonEmpty!795 m!12561))

(check-sat (not b!18043) (not mapNonEmpty!795) b_and!1285 (not b!18037) (not b!18036) (not start!3032) (not b_next!643) tp_is_empty!907 (not b!18042))
(check-sat b_and!1285 (not b_next!643))
