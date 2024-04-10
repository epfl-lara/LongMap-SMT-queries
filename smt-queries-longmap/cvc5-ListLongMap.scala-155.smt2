; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3000 () Bool)

(assert start!3000)

(declare-fun b!17539 () Bool)

(declare-fun b_free!607 () Bool)

(declare-fun b_next!607 () Bool)

(assert (=> b!17539 (= b_free!607 (not b_next!607))))

(declare-fun tp!3011 () Bool)

(declare-fun b_and!1255 () Bool)

(assert (=> b!17539 (= tp!3011 b_and!1255)))

(declare-fun b!17538 () Bool)

(declare-fun e!11023 () Bool)

(declare-fun e!11021 () Bool)

(assert (=> b!17538 (= e!11023 e!11021)))

(declare-fun e!11019 () Bool)

(declare-fun tp_is_empty!871 () Bool)

(declare-datatypes ((V!987 0))(
  ( (V!988 (val!462 Int)) )
))
(declare-datatypes ((ValueCell!236 0))(
  ( (ValueCellFull!236 (v!1428 V!987)) (EmptyCell!236) )
))
(declare-datatypes ((array!947 0))(
  ( (array!948 (arr!455 (Array (_ BitVec 32) ValueCell!236)) (size!545 (_ BitVec 32))) )
))
(declare-datatypes ((array!949 0))(
  ( (array!950 (arr!456 (Array (_ BitVec 32) (_ BitVec 64))) (size!546 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!58 0))(
  ( (LongMapFixedSize!59 (defaultEntry!1640 Int) (mask!4559 (_ BitVec 32)) (extraKeys!1553 (_ BitVec 32)) (zeroValue!1576 V!987) (minValue!1576 V!987) (_size!61 (_ BitVec 32)) (_keys!3065 array!949) (_values!1637 array!947) (_vacant!61 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!58 0))(
  ( (Cell!59 (v!1429 LongMapFixedSize!58)) )
))
(declare-datatypes ((LongMap!58 0))(
  ( (LongMap!59 (underlying!40 Cell!58)) )
))
(declare-fun thiss!848 () LongMap!58)

(declare-fun e!11018 () Bool)

(declare-fun array_inv!315 (array!949) Bool)

(declare-fun array_inv!316 (array!947) Bool)

(assert (=> b!17539 (= e!11018 (and tp!3011 tp_is_empty!871 (array_inv!315 (_keys!3065 (v!1429 (underlying!40 thiss!848)))) (array_inv!316 (_values!1637 (v!1429 (underlying!40 thiss!848)))) e!11019))))

(declare-fun b!17540 () Bool)

(declare-datatypes ((tuple2!746 0))(
  ( (tuple2!747 (_1!374 Bool) (_2!374 LongMap!58)) )
))
(declare-fun e!11017 () tuple2!746)

(declare-fun repack!9 (LongMap!58) tuple2!746)

(assert (=> b!17540 (= e!11017 (repack!9 thiss!848))))

(declare-fun b!17541 () Bool)

(declare-fun e!11024 () Bool)

(declare-fun e!11025 () Bool)

(assert (=> b!17541 (= e!11024 e!11025)))

(declare-fun res!12615 () Bool)

(assert (=> b!17541 (=> (not res!12615) (not e!11025))))

(declare-fun lt!4564 () tuple2!746)

(assert (=> b!17541 (= res!12615 (_1!374 lt!4564))))

(assert (=> b!17541 (= lt!4564 e!11017)))

(declare-fun c!1759 () Bool)

(declare-fun imbalanced!13 (LongMap!58) Bool)

(assert (=> b!17541 (= c!1759 (imbalanced!13 thiss!848))))

(declare-fun b!17542 () Bool)

(declare-fun e!11020 () Bool)

(assert (=> b!17542 (= e!11020 tp_is_empty!871)))

(declare-fun mapIsEmpty!741 () Bool)

(declare-fun mapRes!741 () Bool)

(assert (=> mapIsEmpty!741 mapRes!741))

(declare-fun b!17543 () Bool)

(declare-fun e!11022 () Bool)

(assert (=> b!17543 (= e!11022 tp_is_empty!871)))

(declare-fun res!12616 () Bool)

(assert (=> start!3000 (=> (not res!12616) (not e!11024))))

(declare-fun valid!30 (LongMap!58) Bool)

(assert (=> start!3000 (= res!12616 (valid!30 thiss!848))))

(assert (=> start!3000 e!11024))

(assert (=> start!3000 e!11023))

(assert (=> start!3000 true))

(assert (=> start!3000 tp_is_empty!871))

(declare-fun mapNonEmpty!741 () Bool)

(declare-fun tp!3012 () Bool)

(assert (=> mapNonEmpty!741 (= mapRes!741 (and tp!3012 e!11020))))

(declare-fun mapKey!741 () (_ BitVec 32))

(declare-fun mapValue!741 () ValueCell!236)

(declare-fun mapRest!741 () (Array (_ BitVec 32) ValueCell!236))

(assert (=> mapNonEmpty!741 (= (arr!455 (_values!1637 (v!1429 (underlying!40 thiss!848)))) (store mapRest!741 mapKey!741 mapValue!741))))

(declare-fun b!17544 () Bool)

(assert (=> b!17544 (= e!11019 (and e!11022 mapRes!741))))

(declare-fun condMapEmpty!741 () Bool)

(declare-fun mapDefault!741 () ValueCell!236)

