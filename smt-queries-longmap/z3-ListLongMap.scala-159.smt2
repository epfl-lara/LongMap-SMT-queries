; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3026 () Bool)

(assert start!3026)

(declare-fun b!17934 () Bool)

(declare-fun b_free!633 () Bool)

(declare-fun b_next!633 () Bool)

(assert (=> b!17934 (= b_free!633 (not b_next!633))))

(declare-fun tp!3090 () Bool)

(declare-fun b_and!1281 () Bool)

(assert (=> b!17934 (= tp!3090 b_and!1281)))

(declare-fun b!17928 () Bool)

(declare-fun e!11412 () Bool)

(declare-fun e!11413 () Bool)

(assert (=> b!17928 (= e!11412 e!11413)))

(declare-fun res!12694 () Bool)

(assert (=> b!17928 (=> (not res!12694) (not e!11413))))

(declare-datatypes ((V!1021 0))(
  ( (V!1022 (val!475 Int)) )
))
(declare-datatypes ((ValueCell!249 0))(
  ( (ValueCellFull!249 (v!1454 V!1021)) (EmptyCell!249) )
))
(declare-datatypes ((array!999 0))(
  ( (array!1000 (arr!481 (Array (_ BitVec 32) ValueCell!249)) (size!571 (_ BitVec 32))) )
))
(declare-datatypes ((array!1001 0))(
  ( (array!1002 (arr!482 (Array (_ BitVec 32) (_ BitVec 64))) (size!572 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!84 0))(
  ( (LongMapFixedSize!85 (defaultEntry!1653 Int) (mask!4580 (_ BitVec 32)) (extraKeys!1566 (_ BitVec 32)) (zeroValue!1589 V!1021) (minValue!1589 V!1021) (_size!74 (_ BitVec 32)) (_keys!3078 array!1001) (_values!1650 array!999) (_vacant!74 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!84 0))(
  ( (Cell!85 (v!1455 LongMapFixedSize!84)) )
))
(declare-datatypes ((LongMap!84 0))(
  ( (LongMap!85 (underlying!53 Cell!84)) )
))
(declare-datatypes ((tuple2!774 0))(
  ( (tuple2!775 (_1!388 Bool) (_2!388 LongMap!84)) )
))
(declare-fun lt!4641 () tuple2!774)

(assert (=> b!17928 (= res!12694 (not (_1!388 lt!4641)))))

(declare-fun e!11414 () tuple2!774)

(assert (=> b!17928 (= lt!4641 e!11414)))

(declare-fun c!1798 () Bool)

(declare-fun thiss!848 () LongMap!84)

(declare-fun imbalanced!23 (LongMap!84) Bool)

(assert (=> b!17928 (= c!1798 (imbalanced!23 thiss!848))))

(declare-fun b!17929 () Bool)

(assert (=> b!17929 (= e!11414 (tuple2!775 true thiss!848))))

(declare-fun mapIsEmpty!780 () Bool)

(declare-fun mapRes!780 () Bool)

(assert (=> mapIsEmpty!780 mapRes!780))

(declare-fun b!17930 () Bool)

(assert (=> b!17930 (= e!11413 false)))

(declare-fun lt!4642 () Bool)

(declare-fun valid!41 (LongMap!84) Bool)

(assert (=> b!17930 (= lt!4642 (valid!41 (_2!388 lt!4641)))))

(declare-fun b!17931 () Bool)

(declare-fun e!11408 () Bool)

(declare-fun tp_is_empty!897 () Bool)

(assert (=> b!17931 (= e!11408 tp_is_empty!897)))

(declare-fun b!17932 () Bool)

(declare-fun e!11411 () Bool)

(declare-fun e!11407 () Bool)

(assert (=> b!17932 (= e!11411 e!11407)))

(declare-fun b!17933 () Bool)

(declare-fun e!11410 () Bool)

(assert (=> b!17933 (= e!11410 tp_is_empty!897)))

(declare-fun e!11416 () Bool)

(declare-fun array_inv!331 (array!1001) Bool)

(declare-fun array_inv!332 (array!999) Bool)

(assert (=> b!17934 (= e!11407 (and tp!3090 tp_is_empty!897 (array_inv!331 (_keys!3078 (v!1455 (underlying!53 thiss!848)))) (array_inv!332 (_values!1650 (v!1455 (underlying!53 thiss!848)))) e!11416))))

(declare-fun b!17935 () Bool)

(assert (=> b!17935 (= e!11416 (and e!11410 mapRes!780))))

(declare-fun condMapEmpty!780 () Bool)

(declare-fun mapDefault!780 () ValueCell!249)

(assert (=> b!17935 (= condMapEmpty!780 (= (arr!481 (_values!1650 (v!1455 (underlying!53 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!249)) mapDefault!780)))))

(declare-fun res!12693 () Bool)

(assert (=> start!3026 (=> (not res!12693) (not e!11412))))

(assert (=> start!3026 (= res!12693 (valid!41 thiss!848))))

(assert (=> start!3026 e!11412))

(declare-fun e!11415 () Bool)

(assert (=> start!3026 e!11415))

(declare-fun mapNonEmpty!780 () Bool)

(declare-fun tp!3089 () Bool)

(assert (=> mapNonEmpty!780 (= mapRes!780 (and tp!3089 e!11408))))

(declare-fun mapKey!780 () (_ BitVec 32))

(declare-fun mapValue!780 () ValueCell!249)

(declare-fun mapRest!780 () (Array (_ BitVec 32) ValueCell!249))

(assert (=> mapNonEmpty!780 (= (arr!481 (_values!1650 (v!1455 (underlying!53 thiss!848)))) (store mapRest!780 mapKey!780 mapValue!780))))

(declare-fun b!17936 () Bool)

(declare-fun repack!17 (LongMap!84) tuple2!774)

(assert (=> b!17936 (= e!11414 (repack!17 thiss!848))))

(declare-fun b!17937 () Bool)

(assert (=> b!17937 (= e!11415 e!11411)))

(assert (= (and start!3026 res!12693) b!17928))

(assert (= (and b!17928 c!1798) b!17936))

(assert (= (and b!17928 (not c!1798)) b!17929))

(assert (= (and b!17928 res!12694) b!17930))

(assert (= (and b!17935 condMapEmpty!780) mapIsEmpty!780))

(assert (= (and b!17935 (not condMapEmpty!780)) mapNonEmpty!780))

(get-info :version)

(assert (= (and mapNonEmpty!780 ((_ is ValueCellFull!249) mapValue!780)) b!17931))

(assert (= (and b!17935 ((_ is ValueCellFull!249) mapDefault!780)) b!17933))

(assert (= b!17934 b!17935))

(assert (= b!17932 b!17934))

(assert (= b!17937 b!17932))

(assert (= start!3026 b!17937))

(declare-fun m!12527 () Bool)

(assert (=> start!3026 m!12527))

(declare-fun m!12529 () Bool)

(assert (=> b!17928 m!12529))

(declare-fun m!12531 () Bool)

(assert (=> b!17934 m!12531))

(declare-fun m!12533 () Bool)

(assert (=> b!17934 m!12533))

(declare-fun m!12535 () Bool)

(assert (=> b!17930 m!12535))

(declare-fun m!12537 () Bool)

(assert (=> b!17936 m!12537))

(declare-fun m!12539 () Bool)

(assert (=> mapNonEmpty!780 m!12539))

(check-sat tp_is_empty!897 (not b!17928) (not b!17936) (not b!17934) (not b!17930) b_and!1281 (not mapNonEmpty!780) (not start!3026) (not b_next!633))
(check-sat b_and!1281 (not b_next!633))
