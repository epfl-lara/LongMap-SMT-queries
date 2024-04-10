; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107548 () Bool)

(assert start!107548)

(declare-fun b!1273394 () Bool)

(declare-fun b_free!27719 () Bool)

(declare-fun b_next!27719 () Bool)

(assert (=> b!1273394 (= b_free!27719 (not b_next!27719))))

(declare-fun tp!97701 () Bool)

(declare-fun b_and!45775 () Bool)

(assert (=> b!1273394 (= tp!97701 b_and!45775)))

(declare-fun mapNonEmpty!51252 () Bool)

(declare-fun mapRes!51252 () Bool)

(declare-fun tp!97700 () Bool)

(declare-fun e!726507 () Bool)

(assert (=> mapNonEmpty!51252 (= mapRes!51252 (and tp!97700 e!726507))))

(declare-fun mapKey!51252 () (_ BitVec 32))

(declare-datatypes ((V!49311 0))(
  ( (V!49312 (val!16619 Int)) )
))
(declare-datatypes ((ValueCell!15691 0))(
  ( (ValueCellFull!15691 (v!19256 V!49311)) (EmptyCell!15691) )
))
(declare-fun mapRest!51252 () (Array (_ BitVec 32) ValueCell!15691))

(declare-datatypes ((array!83448 0))(
  ( (array!83449 (arr!40250 (Array (_ BitVec 32) ValueCell!15691)) (size!40791 (_ BitVec 32))) )
))
(declare-datatypes ((array!83450 0))(
  ( (array!83451 (arr!40251 (Array (_ BitVec 32) (_ BitVec 64))) (size!40792 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6146 0))(
  ( (LongMapFixedSize!6147 (defaultEntry!6719 Int) (mask!34498 (_ BitVec 32)) (extraKeys!6398 (_ BitVec 32)) (zeroValue!6504 V!49311) (minValue!6504 V!49311) (_size!3128 (_ BitVec 32)) (_keys!12133 array!83450) (_values!6742 array!83448) (_vacant!3128 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6146)

(declare-fun mapValue!51252 () ValueCell!15691)

(assert (=> mapNonEmpty!51252 (= (arr!40250 (_values!6742 thiss!1551)) (store mapRest!51252 mapKey!51252 mapValue!51252))))

(declare-fun b!1273392 () Bool)

(declare-fun e!726509 () Bool)

(assert (=> b!1273392 (= e!726509 (bvsgt #b00000000000000000000000000000000 (size!40792 (_keys!12133 thiss!1551))))))

(declare-fun b!1273393 () Bool)

(declare-fun e!726506 () Bool)

(declare-fun e!726505 () Bool)

(assert (=> b!1273393 (= e!726506 (and e!726505 mapRes!51252))))

(declare-fun condMapEmpty!51252 () Bool)

(declare-fun mapDefault!51252 () ValueCell!15691)

