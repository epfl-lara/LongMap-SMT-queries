; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107576 () Bool)

(assert start!107576)

(declare-fun b!1273537 () Bool)

(declare-fun b_free!27731 () Bool)

(declare-fun b_next!27731 () Bool)

(assert (=> b!1273537 (= b_free!27731 (not b_next!27731))))

(declare-fun tp!97744 () Bool)

(declare-fun b_and!45787 () Bool)

(assert (=> b!1273537 (= tp!97744 b_and!45787)))

(declare-fun b!1273532 () Bool)

(declare-fun e!726637 () Bool)

(declare-fun tp_is_empty!33101 () Bool)

(assert (=> b!1273532 (= e!726637 tp_is_empty!33101)))

(declare-fun b!1273533 () Bool)

(declare-fun e!726636 () Bool)

(declare-datatypes ((V!49327 0))(
  ( (V!49328 (val!16625 Int)) )
))
(declare-datatypes ((ValueCell!15697 0))(
  ( (ValueCellFull!15697 (v!19262 V!49327)) (EmptyCell!15697) )
))
(declare-datatypes ((array!83476 0))(
  ( (array!83477 (arr!40262 (Array (_ BitVec 32) ValueCell!15697)) (size!40805 (_ BitVec 32))) )
))
(declare-datatypes ((array!83478 0))(
  ( (array!83479 (arr!40263 (Array (_ BitVec 32) (_ BitVec 64))) (size!40806 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6158 0))(
  ( (LongMapFixedSize!6159 (defaultEntry!6725 Int) (mask!34509 (_ BitVec 32)) (extraKeys!6404 (_ BitVec 32)) (zeroValue!6510 V!49327) (minValue!6510 V!49327) (_size!3134 (_ BitVec 32)) (_keys!12139 array!83478) (_values!6748 array!83476) (_vacant!3134 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6158)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273533 (= e!726636 (not (validMask!0 (mask!34509 thiss!1551))))))

(declare-fun b!1273534 () Bool)

(declare-fun res!846878 () Bool)

(assert (=> b!1273534 (=> (not res!846878) (not e!726636))))

(declare-fun arrayCountValidKeys!0 (array!83478 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273534 (= res!846878 (= (arrayCountValidKeys!0 (_keys!12139 thiss!1551) #b00000000000000000000000000000000 (size!40806 (_keys!12139 thiss!1551))) (_size!3134 thiss!1551)))))

(declare-fun b!1273535 () Bool)

(declare-fun e!726632 () Bool)

(assert (=> b!1273535 (= e!726632 tp_is_empty!33101)))

(declare-fun mapNonEmpty!51277 () Bool)

(declare-fun mapRes!51277 () Bool)

(declare-fun tp!97743 () Bool)

(assert (=> mapNonEmpty!51277 (= mapRes!51277 (and tp!97743 e!726632))))

(declare-fun mapKey!51277 () (_ BitVec 32))

(declare-fun mapRest!51277 () (Array (_ BitVec 32) ValueCell!15697))

(declare-fun mapValue!51277 () ValueCell!15697)

(assert (=> mapNonEmpty!51277 (= (arr!40262 (_values!6748 thiss!1551)) (store mapRest!51277 mapKey!51277 mapValue!51277))))

(declare-fun mapIsEmpty!51277 () Bool)

(assert (=> mapIsEmpty!51277 mapRes!51277))

(declare-fun b!1273536 () Bool)

(declare-fun e!726635 () Bool)

(assert (=> b!1273536 (= e!726635 (and e!726637 mapRes!51277))))

(declare-fun condMapEmpty!51277 () Bool)

(declare-fun mapDefault!51277 () ValueCell!15697)

