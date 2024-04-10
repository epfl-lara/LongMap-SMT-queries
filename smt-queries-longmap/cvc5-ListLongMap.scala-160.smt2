; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3030 () Bool)

(assert start!3030)

(declare-fun b!17989 () Bool)

(declare-fun b_free!637 () Bool)

(declare-fun b_next!637 () Bool)

(assert (=> b!17989 (= b_free!637 (not b_next!637))))

(declare-fun tp!3101 () Bool)

(declare-fun b_and!1285 () Bool)

(assert (=> b!17989 (= tp!3101 b_and!1285)))

(declare-fun b!17988 () Bool)

(declare-fun e!11468 () Bool)

(declare-fun e!11473 () Bool)

(assert (=> b!17988 (= e!11468 e!11473)))

(declare-fun e!11472 () Bool)

(declare-fun tp_is_empty!901 () Bool)

(declare-fun e!11471 () Bool)

(declare-datatypes ((V!1027 0))(
  ( (V!1028 (val!477 Int)) )
))
(declare-datatypes ((ValueCell!251 0))(
  ( (ValueCellFull!251 (v!1458 V!1027)) (EmptyCell!251) )
))
(declare-datatypes ((array!1007 0))(
  ( (array!1008 (arr!485 (Array (_ BitVec 32) ValueCell!251)) (size!575 (_ BitVec 32))) )
))
(declare-datatypes ((array!1009 0))(
  ( (array!1010 (arr!486 (Array (_ BitVec 32) (_ BitVec 64))) (size!576 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!88 0))(
  ( (LongMapFixedSize!89 (defaultEntry!1655 Int) (mask!4584 (_ BitVec 32)) (extraKeys!1568 (_ BitVec 32)) (zeroValue!1591 V!1027) (minValue!1591 V!1027) (_size!76 (_ BitVec 32)) (_keys!3080 array!1009) (_values!1652 array!1007) (_vacant!76 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!88 0))(
  ( (Cell!89 (v!1459 LongMapFixedSize!88)) )
))
(declare-datatypes ((LongMap!88 0))(
  ( (LongMap!89 (underlying!55 Cell!88)) )
))
(declare-fun thiss!848 () LongMap!88)

(declare-fun array_inv!335 (array!1009) Bool)

(declare-fun array_inv!336 (array!1007) Bool)

(assert (=> b!17989 (= e!11472 (and tp!3101 tp_is_empty!901 (array_inv!335 (_keys!3080 (v!1459 (underlying!55 thiss!848)))) (array_inv!336 (_values!1652 (v!1459 (underlying!55 thiss!848)))) e!11471))))

(declare-fun b!17991 () Bool)

(declare-fun e!11469 () Bool)

(assert (=> b!17991 (= e!11469 tp_is_empty!901)))

(declare-fun b!17992 () Bool)

(declare-fun e!11475 () Bool)

(declare-fun e!11470 () Bool)

(assert (=> b!17992 (= e!11475 e!11470)))

(declare-fun res!12705 () Bool)

(assert (=> b!17992 (=> (not res!12705) (not e!11470))))

(declare-datatypes ((tuple2!778 0))(
  ( (tuple2!779 (_1!390 Bool) (_2!390 LongMap!88)) )
))
(declare-fun lt!4654 () tuple2!778)

(assert (=> b!17992 (= res!12705 (not (_1!390 lt!4654)))))

(declare-fun e!11467 () tuple2!778)

(assert (=> b!17992 (= lt!4654 e!11467)))

(declare-fun c!1804 () Bool)

(declare-fun imbalanced!24 (LongMap!88) Bool)

(assert (=> b!17992 (= c!1804 (imbalanced!24 thiss!848))))

(declare-fun b!17993 () Bool)

(declare-fun e!11474 () Bool)

(assert (=> b!17993 (= e!11474 tp_is_empty!901)))

(declare-fun b!17994 () Bool)

(assert (=> b!17994 (= e!11467 (tuple2!779 true thiss!848))))

(declare-fun mapIsEmpty!786 () Bool)

(declare-fun mapRes!786 () Bool)

(assert (=> mapIsEmpty!786 mapRes!786))

(declare-fun mapNonEmpty!786 () Bool)

(declare-fun tp!3102 () Bool)

(assert (=> mapNonEmpty!786 (= mapRes!786 (and tp!3102 e!11469))))

(declare-fun mapKey!786 () (_ BitVec 32))

(declare-fun mapValue!786 () ValueCell!251)

(declare-fun mapRest!786 () (Array (_ BitVec 32) ValueCell!251))

(assert (=> mapNonEmpty!786 (= (arr!485 (_values!1652 (v!1459 (underlying!55 thiss!848)))) (store mapRest!786 mapKey!786 mapValue!786))))

(declare-fun b!17995 () Bool)

(assert (=> b!17995 (= e!11471 (and e!11474 mapRes!786))))

(declare-fun condMapEmpty!786 () Bool)

(declare-fun mapDefault!786 () ValueCell!251)

