; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3040 () Bool)

(assert start!3040)

(declare-fun b!18142 () Bool)

(declare-fun b_free!647 () Bool)

(declare-fun b_next!647 () Bool)

(assert (=> b!18142 (= b_free!647 (not b_next!647))))

(declare-fun tp!3132 () Bool)

(declare-fun b_and!1295 () Bool)

(assert (=> b!18142 (= tp!3132 b_and!1295)))

(declare-fun res!12736 () Bool)

(declare-fun e!11626 () Bool)

(assert (=> start!3040 (=> (not res!12736) (not e!11626))))

(declare-datatypes ((V!1039 0))(
  ( (V!1040 (val!482 Int)) )
))
(declare-datatypes ((ValueCell!256 0))(
  ( (ValueCellFull!256 (v!1468 V!1039)) (EmptyCell!256) )
))
(declare-datatypes ((array!1027 0))(
  ( (array!1028 (arr!495 (Array (_ BitVec 32) ValueCell!256)) (size!585 (_ BitVec 32))) )
))
(declare-datatypes ((array!1029 0))(
  ( (array!1030 (arr!496 (Array (_ BitVec 32) (_ BitVec 64))) (size!586 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!98 0))(
  ( (LongMapFixedSize!99 (defaultEntry!1660 Int) (mask!4591 (_ BitVec 32)) (extraKeys!1573 (_ BitVec 32)) (zeroValue!1596 V!1039) (minValue!1596 V!1039) (_size!81 (_ BitVec 32)) (_keys!3085 array!1029) (_values!1657 array!1027) (_vacant!81 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!98 0))(
  ( (Cell!99 (v!1469 LongMapFixedSize!98)) )
))
(declare-datatypes ((LongMap!98 0))(
  ( (LongMap!99 (underlying!60 Cell!98)) )
))
(declare-fun thiss!848 () LongMap!98)

(declare-fun valid!45 (LongMap!98) Bool)

(assert (=> start!3040 (= res!12736 (valid!45 thiss!848))))

(assert (=> start!3040 e!11626))

(declare-fun e!11622 () Bool)

(assert (=> start!3040 e!11622))

(declare-fun b!18138 () Bool)

(declare-fun e!11618 () Bool)

(assert (=> b!18138 (= e!11626 e!11618)))

(declare-fun res!12735 () Bool)

(assert (=> b!18138 (=> (not res!12735) (not e!11618))))

(declare-datatypes ((tuple2!784 0))(
  ( (tuple2!785 (_1!393 Bool) (_2!393 LongMap!98)) )
))
(declare-fun lt!4684 () tuple2!784)

(assert (=> b!18138 (= res!12735 (not (_1!393 lt!4684)))))

(declare-fun e!11619 () tuple2!784)

(assert (=> b!18138 (= lt!4684 e!11619)))

(declare-fun c!1819 () Bool)

(declare-fun imbalanced!27 (LongMap!98) Bool)

(assert (=> b!18138 (= c!1819 (imbalanced!27 thiss!848))))

(declare-fun b!18139 () Bool)

(declare-fun e!11623 () Bool)

(declare-fun tp_is_empty!911 () Bool)

(assert (=> b!18139 (= e!11623 tp_is_empty!911)))

(declare-fun mapIsEmpty!801 () Bool)

(declare-fun mapRes!801 () Bool)

(assert (=> mapIsEmpty!801 mapRes!801))

(declare-fun b!18140 () Bool)

(declare-fun e!11621 () Bool)

(assert (=> b!18140 (= e!11621 tp_is_empty!911)))

(declare-fun mapNonEmpty!801 () Bool)

(declare-fun tp!3131 () Bool)

(assert (=> mapNonEmpty!801 (= mapRes!801 (and tp!3131 e!11623))))

(declare-fun mapRest!801 () (Array (_ BitVec 32) ValueCell!256))

(declare-fun mapValue!801 () ValueCell!256)

(declare-fun mapKey!801 () (_ BitVec 32))

(assert (=> mapNonEmpty!801 (= (arr!495 (_values!1657 (v!1469 (underlying!60 thiss!848)))) (store mapRest!801 mapKey!801 mapValue!801))))

(declare-fun b!18141 () Bool)

(assert (=> b!18141 (= e!11619 (tuple2!785 true thiss!848))))

(declare-fun e!11625 () Bool)

(declare-fun e!11624 () Bool)

(declare-fun array_inv!341 (array!1029) Bool)

(declare-fun array_inv!342 (array!1027) Bool)

(assert (=> b!18142 (= e!11625 (and tp!3132 tp_is_empty!911 (array_inv!341 (_keys!3085 (v!1469 (underlying!60 thiss!848)))) (array_inv!342 (_values!1657 (v!1469 (underlying!60 thiss!848)))) e!11624))))

(declare-fun b!18143 () Bool)

(declare-fun repack!21 (LongMap!98) tuple2!784)

(assert (=> b!18143 (= e!11619 (repack!21 thiss!848))))

(declare-fun b!18144 () Bool)

(assert (=> b!18144 (= e!11624 (and e!11621 mapRes!801))))

(declare-fun condMapEmpty!801 () Bool)

(declare-fun mapDefault!801 () ValueCell!256)

