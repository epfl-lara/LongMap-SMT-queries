; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107572 () Bool)

(assert start!107572)

(declare-fun b!1273496 () Bool)

(declare-fun b_free!27727 () Bool)

(declare-fun b_next!27727 () Bool)

(assert (=> b!1273496 (= b_free!27727 (not b_next!27727))))

(declare-fun tp!97732 () Bool)

(declare-fun b_and!45783 () Bool)

(assert (=> b!1273496 (= tp!97732 b_and!45783)))

(declare-fun res!846866 () Bool)

(declare-fun e!726598 () Bool)

(assert (=> start!107572 (=> (not res!846866) (not e!726598))))

(declare-datatypes ((V!49323 0))(
  ( (V!49324 (val!16623 Int)) )
))
(declare-datatypes ((ValueCell!15695 0))(
  ( (ValueCellFull!15695 (v!19260 V!49323)) (EmptyCell!15695) )
))
(declare-datatypes ((array!83468 0))(
  ( (array!83469 (arr!40258 (Array (_ BitVec 32) ValueCell!15695)) (size!40801 (_ BitVec 32))) )
))
(declare-datatypes ((array!83470 0))(
  ( (array!83471 (arr!40259 (Array (_ BitVec 32) (_ BitVec 64))) (size!40802 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6154 0))(
  ( (LongMapFixedSize!6155 (defaultEntry!6723 Int) (mask!34507 (_ BitVec 32)) (extraKeys!6402 (_ BitVec 32)) (zeroValue!6508 V!49323) (minValue!6508 V!49323) (_size!3132 (_ BitVec 32)) (_keys!12137 array!83470) (_values!6746 array!83468) (_vacant!3132 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6154)

(declare-fun simpleValid!467 (LongMapFixedSize!6154) Bool)

(assert (=> start!107572 (= res!846866 (simpleValid!467 thiss!1551))))

(assert (=> start!107572 e!726598))

(declare-fun e!726597 () Bool)

(assert (=> start!107572 e!726597))

(declare-fun mapNonEmpty!51271 () Bool)

(declare-fun mapRes!51271 () Bool)

(declare-fun tp!97731 () Bool)

(declare-fun e!726599 () Bool)

(assert (=> mapNonEmpty!51271 (= mapRes!51271 (and tp!97731 e!726599))))

(declare-fun mapValue!51271 () ValueCell!15695)

(declare-fun mapRest!51271 () (Array (_ BitVec 32) ValueCell!15695))

(declare-fun mapKey!51271 () (_ BitVec 32))

(assert (=> mapNonEmpty!51271 (= (arr!40258 (_values!6746 thiss!1551)) (store mapRest!51271 mapKey!51271 mapValue!51271))))

(declare-fun mapIsEmpty!51271 () Bool)

(assert (=> mapIsEmpty!51271 mapRes!51271))

(declare-fun e!726600 () Bool)

(declare-fun tp_is_empty!33097 () Bool)

(declare-fun array_inv!30609 (array!83470) Bool)

(declare-fun array_inv!30610 (array!83468) Bool)

(assert (=> b!1273496 (= e!726597 (and tp!97732 tp_is_empty!33097 (array_inv!30609 (_keys!12137 thiss!1551)) (array_inv!30610 (_values!6746 thiss!1551)) e!726600))))

(declare-fun b!1273497 () Bool)

(assert (=> b!1273497 (= e!726599 tp_is_empty!33097)))

(declare-fun b!1273498 () Bool)

(declare-fun e!726596 () Bool)

(assert (=> b!1273498 (= e!726596 tp_is_empty!33097)))

(declare-fun b!1273499 () Bool)

(declare-fun res!846867 () Bool)

(assert (=> b!1273499 (=> (not res!846867) (not e!726598))))

(declare-fun arrayCountValidKeys!0 (array!83470 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273499 (= res!846867 (= (arrayCountValidKeys!0 (_keys!12137 thiss!1551) #b00000000000000000000000000000000 (size!40802 (_keys!12137 thiss!1551))) (_size!3132 thiss!1551)))))

(declare-fun b!1273500 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273500 (= e!726598 (not (validMask!0 (mask!34507 thiss!1551))))))

(declare-fun b!1273501 () Bool)

(assert (=> b!1273501 (= e!726600 (and e!726596 mapRes!51271))))

(declare-fun condMapEmpty!51271 () Bool)

(declare-fun mapDefault!51271 () ValueCell!15695)

