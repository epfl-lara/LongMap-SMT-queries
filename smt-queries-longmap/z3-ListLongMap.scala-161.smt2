; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3026 () Bool)

(assert start!3026)

(declare-fun b!18019 () Bool)

(declare-fun b_free!643 () Bool)

(declare-fun b_next!643 () Bool)

(assert (=> b!18019 (= b_free!643 (not b_next!643))))

(declare-fun tp!3119 () Bool)

(declare-fun b_and!1285 () Bool)

(assert (=> b!18019 (= tp!3119 b_and!1285)))

(declare-fun tp_is_empty!907 () Bool)

(declare-fun e!11516 () Bool)

(declare-datatypes ((V!1035 0))(
  ( (V!1036 (val!480 Int)) )
))
(declare-datatypes ((ValueCell!254 0))(
  ( (ValueCellFull!254 (v!1463 V!1035)) (EmptyCell!254) )
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
  ( (Cell!95 (v!1464 LongMapFixedSize!94)) )
))
(declare-datatypes ((LongMap!94 0))(
  ( (LongMap!95 (underlying!58 Cell!94)) )
))
(declare-fun thiss!848 () LongMap!94)

(declare-fun e!11519 () Bool)

(declare-fun array_inv!343 (array!1003) Bool)

(declare-fun array_inv!344 (array!1001) Bool)

(assert (=> b!18019 (= e!11519 (and tp!3119 tp_is_empty!907 (array_inv!343 (_keys!3083 (v!1464 (underlying!58 thiss!848)))) (array_inv!344 (_values!1655 (v!1464 (underlying!58 thiss!848)))) e!11516))))

(declare-fun b!18020 () Bool)

(declare-fun e!11520 () Bool)

(declare-fun mapRes!795 () Bool)

(assert (=> b!18020 (= e!11516 (and e!11520 mapRes!795))))

(declare-fun condMapEmpty!795 () Bool)

(declare-fun mapDefault!795 () ValueCell!254)

(assert (=> b!18020 (= condMapEmpty!795 (= (arr!482 (_values!1655 (v!1464 (underlying!58 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!254)) mapDefault!795)))))

(declare-fun b!18021 () Bool)

(assert (=> b!18021 (= e!11520 tp_is_empty!907)))

(declare-fun b!18022 () Bool)

(declare-fun e!11515 () Bool)

(assert (=> b!18022 (= e!11515 e!11519)))

(declare-fun b!18023 () Bool)

(declare-fun e!11518 () Bool)

(declare-fun e!11514 () Bool)

(assert (=> b!18023 (= e!11518 e!11514)))

(declare-fun res!12692 () Bool)

(assert (=> b!18023 (=> (not res!12692) (not e!11514))))

(declare-datatypes ((tuple2!784 0))(
  ( (tuple2!785 (_1!393 Bool) (_2!393 LongMap!94)) )
))
(declare-fun lt!4668 () tuple2!784)

(assert (=> b!18023 (= res!12692 (not (_1!393 lt!4668)))))

(declare-fun e!11517 () tuple2!784)

(assert (=> b!18023 (= lt!4668 e!11517)))

(declare-fun c!1799 () Bool)

(declare-fun imbalanced!24 (LongMap!94) Bool)

(assert (=> b!18023 (= c!1799 (imbalanced!24 thiss!848))))

(declare-fun mapNonEmpty!795 () Bool)

(declare-fun tp!3120 () Bool)

(declare-fun e!11513 () Bool)

(assert (=> mapNonEmpty!795 (= mapRes!795 (and tp!3120 e!11513))))

(declare-fun mapRest!795 () (Array (_ BitVec 32) ValueCell!254))

(declare-fun mapValue!795 () ValueCell!254)

(declare-fun mapKey!795 () (_ BitVec 32))

(assert (=> mapNonEmpty!795 (= (arr!482 (_values!1655 (v!1464 (underlying!58 thiss!848)))) (store mapRest!795 mapKey!795 mapValue!795))))

(declare-fun b!18024 () Bool)

(declare-fun e!11512 () Bool)

(assert (=> b!18024 (= e!11512 e!11515)))

(declare-fun b!18018 () Bool)

(declare-fun repack!25 (LongMap!94) tuple2!784)

(assert (=> b!18018 (= e!11517 (repack!25 thiss!848))))

(declare-fun res!12691 () Bool)

(assert (=> start!3026 (=> (not res!12691) (not e!11518))))

(declare-fun valid!53 (LongMap!94) Bool)

(assert (=> start!3026 (= res!12691 (valid!53 thiss!848))))

(assert (=> start!3026 e!11518))

(assert (=> start!3026 e!11512))

(declare-fun b!18025 () Bool)

(assert (=> b!18025 (= e!11514 false)))

(declare-fun lt!4667 () Bool)

(assert (=> b!18025 (= lt!4667 (valid!53 (_2!393 lt!4668)))))

(declare-fun b!18026 () Bool)

(assert (=> b!18026 (= e!11513 tp_is_empty!907)))

(declare-fun mapIsEmpty!795 () Bool)

(assert (=> mapIsEmpty!795 mapRes!795))

(declare-fun b!18027 () Bool)

(assert (=> b!18027 (= e!11517 (tuple2!785 true thiss!848))))

(assert (= (and start!3026 res!12691) b!18023))

(assert (= (and b!18023 c!1799) b!18018))

(assert (= (and b!18023 (not c!1799)) b!18027))

(assert (= (and b!18023 res!12692) b!18025))

(assert (= (and b!18020 condMapEmpty!795) mapIsEmpty!795))

(assert (= (and b!18020 (not condMapEmpty!795)) mapNonEmpty!795))

(get-info :version)

(assert (= (and mapNonEmpty!795 ((_ is ValueCellFull!254) mapValue!795)) b!18026))

(assert (= (and b!18020 ((_ is ValueCellFull!254) mapDefault!795)) b!18021))

(assert (= b!18019 b!18020))

(assert (= b!18022 b!18019))

(assert (= b!18024 b!18022))

(assert (= start!3026 b!18024))

(declare-fun m!12535 () Bool)

(assert (=> b!18019 m!12535))

(declare-fun m!12537 () Bool)

(assert (=> b!18019 m!12537))

(declare-fun m!12539 () Bool)

(assert (=> b!18018 m!12539))

(declare-fun m!12541 () Bool)

(assert (=> b!18023 m!12541))

(declare-fun m!12543 () Bool)

(assert (=> start!3026 m!12543))

(declare-fun m!12545 () Bool)

(assert (=> b!18025 m!12545))

(declare-fun m!12547 () Bool)

(assert (=> mapNonEmpty!795 m!12547))

(check-sat (not b!18025) (not b!18019) (not start!3026) b_and!1285 (not b!18023) (not b_next!643) (not b!18018) tp_is_empty!907 (not mapNonEmpty!795))
(check-sat b_and!1285 (not b_next!643))
