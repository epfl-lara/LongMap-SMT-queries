; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3038 () Bool)

(assert start!3038)

(declare-fun b!18113 () Bool)

(declare-fun b_free!645 () Bool)

(declare-fun b_next!645 () Bool)

(assert (=> b!18113 (= b_free!645 (not b_next!645))))

(declare-fun tp!3125 () Bool)

(declare-fun b_and!1293 () Bool)

(assert (=> b!18113 (= tp!3125 b_and!1293)))

(declare-fun res!12729 () Bool)

(declare-fun e!11593 () Bool)

(assert (=> start!3038 (=> (not res!12729) (not e!11593))))

(declare-datatypes ((V!1037 0))(
  ( (V!1038 (val!481 Int)) )
))
(declare-datatypes ((ValueCell!255 0))(
  ( (ValueCellFull!255 (v!1466 V!1037)) (EmptyCell!255) )
))
(declare-datatypes ((array!1023 0))(
  ( (array!1024 (arr!493 (Array (_ BitVec 32) ValueCell!255)) (size!583 (_ BitVec 32))) )
))
(declare-datatypes ((array!1025 0))(
  ( (array!1026 (arr!494 (Array (_ BitVec 32) (_ BitVec 64))) (size!584 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!96 0))(
  ( (LongMapFixedSize!97 (defaultEntry!1659 Int) (mask!4590 (_ BitVec 32)) (extraKeys!1572 (_ BitVec 32)) (zeroValue!1595 V!1037) (minValue!1595 V!1037) (_size!80 (_ BitVec 32)) (_keys!3084 array!1025) (_values!1656 array!1023) (_vacant!80 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!96 0))(
  ( (Cell!97 (v!1467 LongMapFixedSize!96)) )
))
(declare-datatypes ((LongMap!96 0))(
  ( (LongMap!97 (underlying!59 Cell!96)) )
))
(declare-fun thiss!848 () LongMap!96)

(declare-fun valid!44 (LongMap!96) Bool)

(assert (=> start!3038 (= res!12729 (valid!44 thiss!848))))

(assert (=> start!3038 e!11593))

(declare-fun e!11594 () Bool)

(assert (=> start!3038 e!11594))

(declare-fun mapIsEmpty!798 () Bool)

(declare-fun mapRes!798 () Bool)

(assert (=> mapIsEmpty!798 mapRes!798))

(declare-fun mapNonEmpty!798 () Bool)

(declare-fun tp!3126 () Bool)

(declare-fun e!11592 () Bool)

(assert (=> mapNonEmpty!798 (= mapRes!798 (and tp!3126 e!11592))))

(declare-fun mapRest!798 () (Array (_ BitVec 32) ValueCell!255))

(declare-fun mapKey!798 () (_ BitVec 32))

(declare-fun mapValue!798 () ValueCell!255)

(assert (=> mapNonEmpty!798 (= (arr!493 (_values!1656 (v!1467 (underlying!59 thiss!848)))) (store mapRest!798 mapKey!798 mapValue!798))))

(declare-fun b!18108 () Bool)

(declare-fun e!11589 () Bool)

(assert (=> b!18108 (= e!11593 e!11589)))

(declare-fun res!12730 () Bool)

(assert (=> b!18108 (=> (not res!12730) (not e!11589))))

(declare-datatypes ((tuple2!782 0))(
  ( (tuple2!783 (_1!392 Bool) (_2!392 LongMap!96)) )
))
(declare-fun lt!4678 () tuple2!782)

(assert (=> b!18108 (= res!12730 (not (_1!392 lt!4678)))))

(declare-fun e!11591 () tuple2!782)

(assert (=> b!18108 (= lt!4678 e!11591)))

(declare-fun c!1816 () Bool)

(declare-fun imbalanced!26 (LongMap!96) Bool)

(assert (=> b!18108 (= c!1816 (imbalanced!26 thiss!848))))

(declare-fun b!18109 () Bool)

(declare-fun e!11590 () Bool)

(declare-fun tp_is_empty!909 () Bool)

(assert (=> b!18109 (= e!11590 tp_is_empty!909)))

(declare-fun b!18110 () Bool)

(declare-fun repack!20 (LongMap!96) tuple2!782)

(assert (=> b!18110 (= e!11591 (repack!20 thiss!848))))

(declare-fun b!18111 () Bool)

(declare-fun e!11596 () Bool)

(assert (=> b!18111 (= e!11596 (and e!11590 mapRes!798))))

(declare-fun condMapEmpty!798 () Bool)

(declare-fun mapDefault!798 () ValueCell!255)

(assert (=> b!18111 (= condMapEmpty!798 (= (arr!493 (_values!1656 (v!1467 (underlying!59 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!255)) mapDefault!798)))))

(declare-fun b!18112 () Bool)

(assert (=> b!18112 (= e!11589 false)))

(declare-fun lt!4677 () Bool)

(assert (=> b!18112 (= lt!4677 (valid!44 (_2!392 lt!4678)))))

(declare-fun e!11587 () Bool)

(declare-fun array_inv!339 (array!1025) Bool)

(declare-fun array_inv!340 (array!1023) Bool)

(assert (=> b!18113 (= e!11587 (and tp!3125 tp_is_empty!909 (array_inv!339 (_keys!3084 (v!1467 (underlying!59 thiss!848)))) (array_inv!340 (_values!1656 (v!1467 (underlying!59 thiss!848)))) e!11596))))

(declare-fun b!18114 () Bool)

(declare-fun e!11588 () Bool)

(assert (=> b!18114 (= e!11588 e!11587)))

(declare-fun b!18115 () Bool)

(assert (=> b!18115 (= e!11592 tp_is_empty!909)))

(declare-fun b!18116 () Bool)

(assert (=> b!18116 (= e!11591 (tuple2!783 true thiss!848))))

(declare-fun b!18117 () Bool)

(assert (=> b!18117 (= e!11594 e!11588)))

(assert (= (and start!3038 res!12729) b!18108))

(assert (= (and b!18108 c!1816) b!18110))

(assert (= (and b!18108 (not c!1816)) b!18116))

(assert (= (and b!18108 res!12730) b!18112))

(assert (= (and b!18111 condMapEmpty!798) mapIsEmpty!798))

(assert (= (and b!18111 (not condMapEmpty!798)) mapNonEmpty!798))

(get-info :version)

(assert (= (and mapNonEmpty!798 ((_ is ValueCellFull!255) mapValue!798)) b!18115))

(assert (= (and b!18111 ((_ is ValueCellFull!255) mapDefault!798)) b!18109))

(assert (= b!18113 b!18111))

(assert (= b!18114 b!18113))

(assert (= b!18117 b!18114))

(assert (= start!3038 b!18117))

(declare-fun m!12611 () Bool)

(assert (=> b!18112 m!12611))

(declare-fun m!12613 () Bool)

(assert (=> b!18108 m!12613))

(declare-fun m!12615 () Bool)

(assert (=> b!18110 m!12615))

(declare-fun m!12617 () Bool)

(assert (=> start!3038 m!12617))

(declare-fun m!12619 () Bool)

(assert (=> b!18113 m!12619))

(declare-fun m!12621 () Bool)

(assert (=> b!18113 m!12621))

(declare-fun m!12623 () Bool)

(assert (=> mapNonEmpty!798 m!12623))

(check-sat (not b!18113) (not b!18112) (not b_next!645) (not mapNonEmpty!798) (not b!18108) (not b!18110) b_and!1293 (not start!3038) tp_is_empty!909)
(check-sat b_and!1293 (not b_next!645))
