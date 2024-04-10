; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3182 () Bool)

(assert start!3182)

(declare-fun b!19390 () Bool)

(declare-fun b_free!677 () Bool)

(declare-fun b_next!677 () Bool)

(assert (=> b!19390 (= b_free!677 (not b_next!677))))

(declare-fun tp!3238 () Bool)

(declare-fun b_and!1337 () Bool)

(assert (=> b!19390 (= tp!3238 b_and!1337)))

(declare-fun b!19385 () Bool)

(declare-fun e!12519 () Bool)

(declare-fun e!12515 () Bool)

(assert (=> b!19385 (= e!12519 e!12515)))

(declare-fun mapNonEmpty!863 () Bool)

(declare-fun mapRes!863 () Bool)

(declare-fun tp!3239 () Bool)

(declare-fun e!12517 () Bool)

(assert (=> mapNonEmpty!863 (= mapRes!863 (and tp!3239 e!12517))))

(declare-datatypes ((V!1079 0))(
  ( (V!1080 (val!497 Int)) )
))
(declare-datatypes ((ValueCell!271 0))(
  ( (ValueCellFull!271 (v!1510 V!1079)) (EmptyCell!271) )
))
(declare-fun mapRest!863 () (Array (_ BitVec 32) ValueCell!271))

(declare-fun mapValue!863 () ValueCell!271)

(declare-datatypes ((array!1095 0))(
  ( (array!1096 (arr!525 (Array (_ BitVec 32) ValueCell!271)) (size!617 (_ BitVec 32))) )
))
(declare-datatypes ((array!1097 0))(
  ( (array!1098 (arr!526 (Array (_ BitVec 32) (_ BitVec 64))) (size!618 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!128 0))(
  ( (LongMapFixedSize!129 (defaultEntry!1683 Int) (mask!4630 (_ BitVec 32)) (extraKeys!1593 (_ BitVec 32)) (zeroValue!1617 V!1079) (minValue!1617 V!1079) (_size!97 (_ BitVec 32)) (_keys!3110 array!1097) (_values!1679 array!1095) (_vacant!97 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!128 0))(
  ( (Cell!129 (v!1511 LongMapFixedSize!128)) )
))
(declare-datatypes ((LongMap!128 0))(
  ( (LongMap!129 (underlying!75 Cell!128)) )
))
(declare-fun thiss!938 () LongMap!128)

(declare-fun mapKey!863 () (_ BitVec 32))

(assert (=> mapNonEmpty!863 (= (arr!525 (_values!1679 (v!1511 (underlying!75 thiss!938)))) (store mapRest!863 mapKey!863 mapValue!863))))

(declare-fun b!19386 () Bool)

(declare-fun e!12514 () Bool)

(declare-fun e!12513 () Bool)

(assert (=> b!19386 (= e!12514 (and e!12513 mapRes!863))))

(declare-fun condMapEmpty!863 () Bool)

(declare-fun mapDefault!863 () ValueCell!271)

