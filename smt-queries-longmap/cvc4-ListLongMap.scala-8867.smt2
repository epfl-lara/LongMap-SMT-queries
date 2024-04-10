; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107614 () Bool)

(assert start!107614)

(declare-fun b!1273766 () Bool)

(declare-fun b_free!27749 () Bool)

(declare-fun b_next!27749 () Bool)

(assert (=> b!1273766 (= b_free!27749 (not b_next!27749))))

(declare-fun tp!97803 () Bool)

(declare-fun b_and!45805 () Bool)

(assert (=> b!1273766 (= tp!97803 b_and!45805)))

(declare-fun e!726825 () Bool)

(declare-fun e!726826 () Bool)

(declare-datatypes ((V!49351 0))(
  ( (V!49352 (val!16634 Int)) )
))
(declare-datatypes ((ValueCell!15706 0))(
  ( (ValueCellFull!15706 (v!19271 V!49351)) (EmptyCell!15706) )
))
(declare-datatypes ((array!83516 0))(
  ( (array!83517 (arr!40280 (Array (_ BitVec 32) ValueCell!15706)) (size!40825 (_ BitVec 32))) )
))
(declare-datatypes ((array!83518 0))(
  ( (array!83519 (arr!40281 (Array (_ BitVec 32) (_ BitVec 64))) (size!40826 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6176 0))(
  ( (LongMapFixedSize!6177 (defaultEntry!6734 Int) (mask!34526 (_ BitVec 32)) (extraKeys!6413 (_ BitVec 32)) (zeroValue!6519 V!49351) (minValue!6519 V!49351) (_size!3143 (_ BitVec 32)) (_keys!12148 array!83518) (_values!6757 array!83516) (_vacant!3143 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6176)

(declare-fun tp_is_empty!33119 () Bool)

(declare-fun array_inv!30621 (array!83518) Bool)

(declare-fun array_inv!30622 (array!83516) Bool)

(assert (=> b!1273766 (= e!726826 (and tp!97803 tp_is_empty!33119 (array_inv!30621 (_keys!12148 thiss!1551)) (array_inv!30622 (_values!6757 thiss!1551)) e!726825))))

(declare-fun b!1273767 () Bool)

(declare-fun e!726828 () Bool)

(assert (=> b!1273767 (= e!726828 tp_is_empty!33119)))

(declare-fun b!1273768 () Bool)

(declare-fun e!726829 () Bool)

(assert (=> b!1273768 (= e!726829 tp_is_empty!33119)))

(declare-fun b!1273769 () Bool)

(declare-fun res!846964 () Bool)

(declare-fun e!726827 () Bool)

(assert (=> b!1273769 (=> (not res!846964) (not e!726827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273769 (= res!846964 (validMask!0 (mask!34526 thiss!1551)))))

(declare-fun mapIsEmpty!51310 () Bool)

(declare-fun mapRes!51310 () Bool)

(assert (=> mapIsEmpty!51310 mapRes!51310))

(declare-fun mapNonEmpty!51310 () Bool)

(declare-fun tp!97804 () Bool)

(assert (=> mapNonEmpty!51310 (= mapRes!51310 (and tp!97804 e!726829))))

(declare-fun mapKey!51310 () (_ BitVec 32))

(declare-fun mapValue!51310 () ValueCell!15706)

(declare-fun mapRest!51310 () (Array (_ BitVec 32) ValueCell!15706))

(assert (=> mapNonEmpty!51310 (= (arr!40280 (_values!6757 thiss!1551)) (store mapRest!51310 mapKey!51310 mapValue!51310))))

(declare-fun res!846966 () Bool)

(assert (=> start!107614 (=> (not res!846966) (not e!726827))))

(declare-fun simpleValid!476 (LongMapFixedSize!6176) Bool)

(assert (=> start!107614 (= res!846966 (simpleValid!476 thiss!1551))))

(assert (=> start!107614 e!726827))

(assert (=> start!107614 e!726826))

(declare-fun b!1273770 () Bool)

(declare-fun res!846965 () Bool)

(assert (=> b!1273770 (=> (not res!846965) (not e!726827))))

(declare-fun arrayCountValidKeys!0 (array!83518 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273770 (= res!846965 (= (arrayCountValidKeys!0 (_keys!12148 thiss!1551) #b00000000000000000000000000000000 (size!40826 (_keys!12148 thiss!1551))) (_size!3143 thiss!1551)))))

(declare-fun b!1273771 () Bool)

(assert (=> b!1273771 (= e!726827 (and (= (size!40826 (_keys!12148 thiss!1551)) (bvadd #b00000000000000000000000000000001 (mask!34526 thiss!1551))) (bvsgt #b00000000000000000000000000000000 (size!40826 (_keys!12148 thiss!1551)))))))

(declare-fun b!1273772 () Bool)

(assert (=> b!1273772 (= e!726825 (and e!726828 mapRes!51310))))

(declare-fun condMapEmpty!51310 () Bool)

(declare-fun mapDefault!51310 () ValueCell!15706)

