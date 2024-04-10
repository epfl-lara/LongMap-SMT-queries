; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3222 () Bool)

(assert start!3222)

(declare-fun b!19612 () Bool)

(declare-fun b_free!689 () Bool)

(declare-fun b_next!689 () Bool)

(assert (=> b!19612 (= b_free!689 (not b_next!689))))

(declare-fun tp!3282 () Bool)

(declare-fun b_and!1349 () Bool)

(assert (=> b!19612 (= tp!3282 b_and!1349)))

(declare-fun mapNonEmpty!889 () Bool)

(declare-fun mapRes!889 () Bool)

(declare-fun tp!3283 () Bool)

(declare-fun e!12720 () Bool)

(assert (=> mapNonEmpty!889 (= mapRes!889 (and tp!3283 e!12720))))

(declare-fun mapKey!889 () (_ BitVec 32))

(declare-datatypes ((V!1095 0))(
  ( (V!1096 (val!503 Int)) )
))
(declare-datatypes ((ValueCell!277 0))(
  ( (ValueCellFull!277 (v!1522 V!1095)) (EmptyCell!277) )
))
(declare-fun mapRest!889 () (Array (_ BitVec 32) ValueCell!277))

(declare-datatypes ((array!1123 0))(
  ( (array!1124 (arr!537 (Array (_ BitVec 32) ValueCell!277)) (size!630 (_ BitVec 32))) )
))
(declare-datatypes ((array!1125 0))(
  ( (array!1126 (arr!538 (Array (_ BitVec 32) (_ BitVec 64))) (size!631 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!140 0))(
  ( (LongMapFixedSize!141 (defaultEntry!1689 Int) (mask!4643 (_ BitVec 32)) (extraKeys!1599 (_ BitVec 32)) (zeroValue!1623 V!1095) (minValue!1623 V!1095) (_size!104 (_ BitVec 32)) (_keys!3117 array!1125) (_values!1685 array!1123) (_vacant!104 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!140 0))(
  ( (Cell!141 (v!1523 LongMapFixedSize!140)) )
))
(declare-datatypes ((LongMap!140 0))(
  ( (LongMap!141 (underlying!81 Cell!140)) )
))
(declare-fun thiss!938 () LongMap!140)

(declare-fun mapValue!889 () ValueCell!277)

(assert (=> mapNonEmpty!889 (= (arr!537 (_values!1685 (v!1523 (underlying!81 thiss!938)))) (store mapRest!889 mapKey!889 mapValue!889))))

(declare-fun b!19609 () Bool)

(declare-fun e!12724 () Bool)

(declare-fun e!12728 () Bool)

(assert (=> b!19609 (= e!12724 e!12728)))

(declare-fun b!19610 () Bool)

(declare-fun e!12721 () Bool)

(assert (=> b!19610 (= e!12728 e!12721)))

(declare-fun res!13237 () Bool)

(declare-fun e!12722 () Bool)

(assert (=> start!3222 (=> (not res!13237) (not e!12722))))

(declare-fun valid!67 (LongMap!140) Bool)

(assert (=> start!3222 (= res!13237 (valid!67 thiss!938))))

(assert (=> start!3222 e!12722))

(assert (=> start!3222 e!12724))

(declare-fun mapIsEmpty!889 () Bool)

(assert (=> mapIsEmpty!889 mapRes!889))

(declare-fun b!19611 () Bool)

(declare-fun tp_is_empty!953 () Bool)

(assert (=> b!19611 (= e!12720 tp_is_empty!953)))

(declare-fun e!12726 () Bool)

(declare-fun array_inv!365 (array!1125) Bool)

(declare-fun array_inv!366 (array!1123) Bool)

(assert (=> b!19612 (= e!12721 (and tp!3282 tp_is_empty!953 (array_inv!365 (_keys!3117 (v!1523 (underlying!81 thiss!938)))) (array_inv!366 (_values!1685 (v!1523 (underlying!81 thiss!938)))) e!12726))))

(declare-fun b!19613 () Bool)

(declare-fun e!12723 () Bool)

(declare-fun lt!5439 () LongMapFixedSize!140)

(declare-fun valid!68 (LongMapFixedSize!140) Bool)

(assert (=> b!19613 (= e!12723 (not (valid!68 lt!5439)))))

(declare-fun b!19614 () Bool)

(declare-fun e!12727 () Bool)

(assert (=> b!19614 (= e!12727 tp_is_empty!953)))

(declare-fun b!19615 () Bool)

(assert (=> b!19615 (= e!12722 e!12723)))

(declare-fun res!13236 () Bool)

(assert (=> b!19615 (=> (not res!13236) (not e!12723))))

(assert (=> b!19615 (= res!13236 (and (not (= (bvand (extraKeys!1599 (v!1523 (underlying!81 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1599 (v!1523 (underlying!81 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun getNewLongMapFixedSize!11 ((_ BitVec 32) Int) LongMapFixedSize!140)

(declare-fun computeNewMask!7 (LongMap!140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19615 (= lt!5439 (getNewLongMapFixedSize!11 (computeNewMask!7 thiss!938 (mask!4643 (v!1523 (underlying!81 thiss!938))) (_vacant!104 (v!1523 (underlying!81 thiss!938))) (_size!104 (v!1523 (underlying!81 thiss!938)))) (defaultEntry!1689 (v!1523 (underlying!81 thiss!938)))))))

(declare-fun b!19616 () Bool)

(assert (=> b!19616 (= e!12726 (and e!12727 mapRes!889))))

(declare-fun condMapEmpty!889 () Bool)

(declare-fun mapDefault!889 () ValueCell!277)

