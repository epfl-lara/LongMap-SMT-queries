; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3008 () Bool)

(assert start!3008)

(declare-fun b!17658 () Bool)

(declare-fun b_free!615 () Bool)

(declare-fun b_next!615 () Bool)

(assert (=> b!17658 (= b_free!615 (not b_next!615))))

(declare-fun tp!3036 () Bool)

(declare-fun b_and!1263 () Bool)

(assert (=> b!17658 (= tp!3036 b_and!1263)))

(declare-fun e!11137 () Bool)

(declare-fun e!11139 () Bool)

(declare-datatypes ((V!997 0))(
  ( (V!998 (val!466 Int)) )
))
(declare-datatypes ((ValueCell!240 0))(
  ( (ValueCellFull!240 (v!1436 V!997)) (EmptyCell!240) )
))
(declare-datatypes ((array!963 0))(
  ( (array!964 (arr!463 (Array (_ BitVec 32) ValueCell!240)) (size!553 (_ BitVec 32))) )
))
(declare-datatypes ((array!965 0))(
  ( (array!966 (arr!464 (Array (_ BitVec 32) (_ BitVec 64))) (size!554 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!66 0))(
  ( (LongMapFixedSize!67 (defaultEntry!1644 Int) (mask!4565 (_ BitVec 32)) (extraKeys!1557 (_ BitVec 32)) (zeroValue!1580 V!997) (minValue!1580 V!997) (_size!65 (_ BitVec 32)) (_keys!3069 array!965) (_values!1641 array!963) (_vacant!65 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!66 0))(
  ( (Cell!67 (v!1437 LongMapFixedSize!66)) )
))
(declare-datatypes ((LongMap!66 0))(
  ( (LongMap!67 (underlying!44 Cell!66)) )
))
(declare-fun thiss!848 () LongMap!66)

(declare-fun tp_is_empty!879 () Bool)

(declare-fun array_inv!321 (array!965) Bool)

(declare-fun array_inv!322 (array!963) Bool)

(assert (=> b!17658 (= e!11139 (and tp!3036 tp_is_empty!879 (array_inv!321 (_keys!3069 (v!1437 (underlying!44 thiss!848)))) (array_inv!322 (_values!1641 (v!1437 (underlying!44 thiss!848)))) e!11137))))

(declare-fun b!17659 () Bool)

(declare-fun e!11141 () Bool)

(declare-fun mapRes!753 () Bool)

(assert (=> b!17659 (= e!11137 (and e!11141 mapRes!753))))

(declare-fun condMapEmpty!753 () Bool)

(declare-fun mapDefault!753 () ValueCell!240)

(assert (=> b!17659 (= condMapEmpty!753 (= (arr!463 (_values!1641 (v!1437 (underlying!44 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!240)) mapDefault!753)))))

(declare-fun mapNonEmpty!753 () Bool)

(declare-fun tp!3035 () Bool)

(declare-fun e!11146 () Bool)

(assert (=> mapNonEmpty!753 (= mapRes!753 (and tp!3035 e!11146))))

(declare-fun mapKey!753 () (_ BitVec 32))

(declare-fun mapRest!753 () (Array (_ BitVec 32) ValueCell!240))

(declare-fun mapValue!753 () ValueCell!240)

(assert (=> mapNonEmpty!753 (= (arr!463 (_values!1641 (v!1437 (underlying!44 thiss!848)))) (store mapRest!753 mapKey!753 mapValue!753))))

(declare-fun b!17661 () Bool)

(declare-fun e!11145 () Bool)

(assert (=> b!17661 (= e!11145 e!11139)))

(declare-fun b!17662 () Bool)

(declare-datatypes ((tuple2!756 0))(
  ( (tuple2!757 (_1!379 Bool) (_2!379 LongMap!66)) )
))
(declare-fun e!11138 () tuple2!756)

(assert (=> b!17662 (= e!11138 (tuple2!757 true thiss!848))))

(declare-fun b!17663 () Bool)

(declare-fun repack!11 (LongMap!66) tuple2!756)

(assert (=> b!17663 (= e!11138 (repack!11 thiss!848))))

(declare-fun b!17664 () Bool)

(declare-fun e!11142 () Bool)

(assert (=> b!17664 (= e!11142 e!11145)))

(declare-fun res!12639 () Bool)

(declare-fun e!11144 () Bool)

(assert (=> start!3008 (=> (not res!12639) (not e!11144))))

(declare-fun valid!34 (LongMap!66) Bool)

(assert (=> start!3008 (= res!12639 (valid!34 thiss!848))))

(assert (=> start!3008 e!11144))

(assert (=> start!3008 e!11142))

(assert (=> start!3008 true))

(assert (=> start!3008 tp_is_empty!879))

(declare-fun b!17660 () Bool)

(assert (=> b!17660 (= e!11146 tp_is_empty!879)))

(declare-fun b!17665 () Bool)

(assert (=> b!17665 (= e!11141 tp_is_empty!879)))

(declare-fun mapIsEmpty!753 () Bool)

(assert (=> mapIsEmpty!753 mapRes!753))

(declare-fun b!17666 () Bool)

(declare-fun e!11143 () Bool)

(assert (=> b!17666 (= e!11144 e!11143)))

(declare-fun res!12640 () Bool)

(assert (=> b!17666 (=> (not res!12640) (not e!11143))))

(declare-fun lt!4587 () tuple2!756)

(assert (=> b!17666 (= res!12640 (_1!379 lt!4587))))

(assert (=> b!17666 (= lt!4587 e!11138)))

(declare-fun c!1771 () Bool)

(declare-fun imbalanced!16 (LongMap!66) Bool)

(assert (=> b!17666 (= c!1771 (imbalanced!16 thiss!848))))

(declare-fun b!17667 () Bool)

(assert (=> b!17667 (= e!11143 false)))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun lt!4588 () Bool)

(declare-fun v!259 () V!997)

(declare-datatypes ((tuple2!758 0))(
  ( (tuple2!759 (_1!380 Bool) (_2!380 LongMapFixedSize!66)) )
))
(declare-fun update!11 (LongMapFixedSize!66 (_ BitVec 64) V!997) tuple2!758)

(assert (=> b!17667 (= lt!4588 (valid!34 (LongMap!67 (Cell!67 (_2!380 (update!11 (v!1437 (underlying!44 (_2!379 lt!4587))) key!682 v!259))))))))

(assert (= (and start!3008 res!12639) b!17666))

(assert (= (and b!17666 c!1771) b!17663))

(assert (= (and b!17666 (not c!1771)) b!17662))

(assert (= (and b!17666 res!12640) b!17667))

(assert (= (and b!17659 condMapEmpty!753) mapIsEmpty!753))

(assert (= (and b!17659 (not condMapEmpty!753)) mapNonEmpty!753))

(get-info :version)

(assert (= (and mapNonEmpty!753 ((_ is ValueCellFull!240) mapValue!753)) b!17660))

(assert (= (and b!17659 ((_ is ValueCellFull!240) mapDefault!753)) b!17665))

(assert (= b!17658 b!17659))

(assert (= b!17661 b!17658))

(assert (= b!17664 b!17661))

(assert (= start!3008 b!17664))

(declare-fun m!12397 () Bool)

(assert (=> b!17666 m!12397))

(declare-fun m!12399 () Bool)

(assert (=> mapNonEmpty!753 m!12399))

(declare-fun m!12401 () Bool)

(assert (=> b!17667 m!12401))

(declare-fun m!12403 () Bool)

(assert (=> b!17667 m!12403))

(declare-fun m!12405 () Bool)

(assert (=> b!17658 m!12405))

(declare-fun m!12407 () Bool)

(assert (=> b!17658 m!12407))

(declare-fun m!12409 () Bool)

(assert (=> start!3008 m!12409))

(declare-fun m!12411 () Bool)

(assert (=> b!17663 m!12411))

(check-sat (not b!17667) b_and!1263 (not b!17666) (not b_next!615) (not start!3008) (not mapNonEmpty!753) tp_is_empty!879 (not b!17658) (not b!17663))
(check-sat b_and!1263 (not b_next!615))
