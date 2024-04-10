; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2982 () Bool)

(assert start!2982)

(declare-fun b!17241 () Bool)

(declare-fun b_free!589 () Bool)

(declare-fun b_next!589 () Bool)

(assert (=> b!17241 (= b_free!589 (not b_next!589))))

(declare-fun tp!2957 () Bool)

(declare-fun b_and!1237 () Bool)

(assert (=> b!17241 (= tp!2957 b_and!1237)))

(declare-fun mapNonEmpty!714 () Bool)

(declare-fun mapRes!714 () Bool)

(declare-fun tp!2958 () Bool)

(declare-fun e!10730 () Bool)

(assert (=> mapNonEmpty!714 (= mapRes!714 (and tp!2958 e!10730))))

(declare-datatypes ((V!963 0))(
  ( (V!964 (val!453 Int)) )
))
(declare-datatypes ((ValueCell!227 0))(
  ( (ValueCellFull!227 (v!1410 V!963)) (EmptyCell!227) )
))
(declare-datatypes ((array!911 0))(
  ( (array!912 (arr!437 (Array (_ BitVec 32) ValueCell!227)) (size!527 (_ BitVec 32))) )
))
(declare-datatypes ((array!913 0))(
  ( (array!914 (arr!438 (Array (_ BitVec 32) (_ BitVec 64))) (size!528 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!40 0))(
  ( (LongMapFixedSize!41 (defaultEntry!1631 Int) (mask!4544 (_ BitVec 32)) (extraKeys!1544 (_ BitVec 32)) (zeroValue!1567 V!963) (minValue!1567 V!963) (_size!52 (_ BitVec 32)) (_keys!3056 array!913) (_values!1628 array!911) (_vacant!52 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!40 0))(
  ( (Cell!41 (v!1411 LongMapFixedSize!40)) )
))
(declare-datatypes ((LongMap!40 0))(
  ( (LongMap!41 (underlying!31 Cell!40)) )
))
(declare-fun thiss!848 () LongMap!40)

(declare-fun mapKey!714 () (_ BitVec 32))

(declare-fun mapRest!714 () (Array (_ BitVec 32) ValueCell!227))

(declare-fun mapValue!714 () ValueCell!227)

(assert (=> mapNonEmpty!714 (= (arr!437 (_values!1628 (v!1411 (underlying!31 thiss!848)))) (store mapRest!714 mapKey!714 mapValue!714))))

(declare-fun b!17232 () Bool)

(declare-fun e!10735 () Bool)

(declare-fun e!10729 () Bool)

(assert (=> b!17232 (= e!10735 e!10729)))

(declare-fun b!17233 () Bool)

(declare-fun e!10734 () Bool)

(declare-fun tp_is_empty!853 () Bool)

(assert (=> b!17233 (= e!10734 tp_is_empty!853)))

(declare-fun b!17234 () Bool)

(declare-datatypes ((tuple2!706 0))(
  ( (tuple2!707 (_1!354 Bool) (_2!354 LongMap!40)) )
))
(declare-fun e!10733 () tuple2!706)

(assert (=> b!17234 (= e!10733 (tuple2!707 true thiss!848))))

(declare-fun mapIsEmpty!714 () Bool)

(assert (=> mapIsEmpty!714 mapRes!714))

(declare-fun b!17235 () Bool)

(declare-fun e!10731 () Bool)

(declare-fun e!10737 () Bool)

(assert (=> b!17235 (= e!10731 e!10737)))

(declare-fun res!12526 () Bool)

(assert (=> b!17235 (=> (not res!12526) (not e!10737))))

(declare-fun lt!4474 () tuple2!706)

(assert (=> b!17235 (= res!12526 (_1!354 lt!4474))))

(assert (=> b!17235 (= lt!4474 e!10733)))

(declare-fun c!1732 () Bool)

(declare-fun imbalanced!4 (LongMap!40) Bool)

(assert (=> b!17235 (= c!1732 (imbalanced!4 thiss!848))))

(declare-fun b!17236 () Bool)

(assert (=> b!17236 (= e!10730 tp_is_empty!853)))

(declare-fun b!17237 () Bool)

(declare-fun e!10736 () Bool)

(assert (=> b!17237 (= e!10729 e!10736)))

(declare-fun b!17238 () Bool)

(declare-fun e!10738 () Bool)

(assert (=> b!17238 (= e!10738 (and e!10734 mapRes!714))))

(declare-fun condMapEmpty!714 () Bool)

(declare-fun mapDefault!714 () ValueCell!227)

