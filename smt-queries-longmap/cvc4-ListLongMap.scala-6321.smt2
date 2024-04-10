; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81236 () Bool)

(assert start!81236)

(declare-fun b!950542 () Bool)

(declare-fun b_free!18251 () Bool)

(declare-fun b_next!18251 () Bool)

(assert (=> b!950542 (= b_free!18251 (not b_next!18251))))

(declare-fun tp!63352 () Bool)

(declare-fun b_and!29709 () Bool)

(assert (=> b!950542 (= tp!63352 b_and!29709)))

(declare-fun res!637256 () Bool)

(declare-fun e!535191 () Bool)

(assert (=> start!81236 (=> (not res!637256) (not e!535191))))

(declare-datatypes ((V!32643 0))(
  ( (V!32644 (val!10430 Int)) )
))
(declare-datatypes ((ValueCell!9898 0))(
  ( (ValueCellFull!9898 (v!12974 V!32643)) (EmptyCell!9898) )
))
(declare-datatypes ((array!57538 0))(
  ( (array!57539 (arr!27668 (Array (_ BitVec 32) ValueCell!9898)) (size!28145 (_ BitVec 32))) )
))
(declare-datatypes ((array!57540 0))(
  ( (array!57541 (arr!27669 (Array (_ BitVec 32) (_ BitVec 64))) (size!28146 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4946 0))(
  ( (LongMapFixedSize!4947 (defaultEntry!5786 Int) (mask!27590 (_ BitVec 32)) (extraKeys!5518 (_ BitVec 32)) (zeroValue!5622 V!32643) (minValue!5622 V!32643) (_size!2528 (_ BitVec 32)) (_keys!10723 array!57540) (_values!5809 array!57538) (_vacant!2528 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4946)

(declare-fun valid!1880 (LongMapFixedSize!4946) Bool)

(assert (=> start!81236 (= res!637256 (valid!1880 thiss!1141))))

(assert (=> start!81236 e!535191))

(declare-fun e!535186 () Bool)

(assert (=> start!81236 e!535186))

(assert (=> start!81236 true))

(declare-fun tp_is_empty!20759 () Bool)

(declare-fun e!535189 () Bool)

(declare-fun array_inv!21476 (array!57540) Bool)

(declare-fun array_inv!21477 (array!57538) Bool)

(assert (=> b!950542 (= e!535186 (and tp!63352 tp_is_empty!20759 (array_inv!21476 (_keys!10723 thiss!1141)) (array_inv!21477 (_values!5809 thiss!1141)) e!535189))))

(declare-fun mapNonEmpty!33053 () Bool)

(declare-fun mapRes!33053 () Bool)

(declare-fun tp!63351 () Bool)

(declare-fun e!535187 () Bool)

(assert (=> mapNonEmpty!33053 (= mapRes!33053 (and tp!63351 e!535187))))

(declare-fun mapKey!33053 () (_ BitVec 32))

(declare-fun mapValue!33053 () ValueCell!9898)

(declare-fun mapRest!33053 () (Array (_ BitVec 32) ValueCell!9898))

(assert (=> mapNonEmpty!33053 (= (arr!27668 (_values!5809 thiss!1141)) (store mapRest!33053 mapKey!33053 mapValue!33053))))

(declare-fun mapIsEmpty!33053 () Bool)

(assert (=> mapIsEmpty!33053 mapRes!33053))

(declare-fun b!950543 () Bool)

(declare-fun res!637255 () Bool)

(assert (=> b!950543 (=> (not res!637255) (not e!535191))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9145 0))(
  ( (MissingZero!9145 (index!38951 (_ BitVec 32))) (Found!9145 (index!38952 (_ BitVec 32))) (Intermediate!9145 (undefined!9957 Bool) (index!38953 (_ BitVec 32)) (x!81781 (_ BitVec 32))) (Undefined!9145) (MissingVacant!9145 (index!38954 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57540 (_ BitVec 32)) SeekEntryResult!9145)

(assert (=> b!950543 (= res!637255 (not (is-Found!9145 (seekEntry!0 key!756 (_keys!10723 thiss!1141) (mask!27590 thiss!1141)))))))

(declare-fun b!950544 () Bool)

(declare-fun e!535185 () Bool)

(assert (=> b!950544 (= e!535189 (and e!535185 mapRes!33053))))

(declare-fun condMapEmpty!33053 () Bool)

(declare-fun mapDefault!33053 () ValueCell!9898)

