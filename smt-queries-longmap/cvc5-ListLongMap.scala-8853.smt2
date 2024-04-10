; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107368 () Bool)

(assert start!107368)

(declare-fun b!1272348 () Bool)

(declare-fun b_free!27661 () Bool)

(declare-fun b_next!27661 () Bool)

(assert (=> b!1272348 (= b_free!27661 (not b_next!27661))))

(declare-fun tp!97494 () Bool)

(declare-fun b_and!45717 () Bool)

(assert (=> b!1272348 (= tp!97494 b_and!45717)))

(declare-fun mapIsEmpty!51133 () Bool)

(declare-fun mapRes!51133 () Bool)

(assert (=> mapIsEmpty!51133 mapRes!51133))

(declare-fun mapNonEmpty!51133 () Bool)

(declare-fun tp!97495 () Bool)

(declare-fun e!725690 () Bool)

(assert (=> mapNonEmpty!51133 (= mapRes!51133 (and tp!97495 e!725690))))

(declare-datatypes ((V!49235 0))(
  ( (V!49236 (val!16590 Int)) )
))
(declare-datatypes ((ValueCell!15662 0))(
  ( (ValueCellFull!15662 (v!19227 V!49235)) (EmptyCell!15662) )
))
(declare-datatypes ((array!83314 0))(
  ( (array!83315 (arr!40192 (Array (_ BitVec 32) ValueCell!15662)) (size!40728 (_ BitVec 32))) )
))
(declare-datatypes ((array!83316 0))(
  ( (array!83317 (arr!40193 (Array (_ BitVec 32) (_ BitVec 64))) (size!40729 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6088 0))(
  ( (LongMapFixedSize!6089 (defaultEntry!6690 Int) (mask!34434 (_ BitVec 32)) (extraKeys!6369 (_ BitVec 32)) (zeroValue!6475 V!49235) (minValue!6475 V!49235) (_size!3099 (_ BitVec 32)) (_keys!12096 array!83316) (_values!6713 array!83314) (_vacant!3099 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6088)

(declare-fun mapRest!51133 () (Array (_ BitVec 32) ValueCell!15662))

(declare-fun mapValue!51133 () ValueCell!15662)

(declare-fun mapKey!51133 () (_ BitVec 32))

(assert (=> mapNonEmpty!51133 (= (arr!40192 (_values!6713 thiss!1559)) (store mapRest!51133 mapKey!51133 mapValue!51133))))

(declare-fun b!1272347 () Bool)

(declare-fun tp_is_empty!33031 () Bool)

(assert (=> b!1272347 (= e!725690 tp_is_empty!33031)))

(declare-fun e!725695 () Bool)

(declare-fun e!725691 () Bool)

(declare-fun array_inv!30573 (array!83316) Bool)

(declare-fun array_inv!30574 (array!83314) Bool)

(assert (=> b!1272348 (= e!725695 (and tp!97494 tp_is_empty!33031 (array_inv!30573 (_keys!12096 thiss!1559)) (array_inv!30574 (_values!6713 thiss!1559)) e!725691))))

(declare-fun b!1272349 () Bool)

(declare-fun e!725692 () Bool)

(assert (=> b!1272349 (= e!725691 (and e!725692 mapRes!51133))))

(declare-fun condMapEmpty!51133 () Bool)

(declare-fun mapDefault!51133 () ValueCell!15662)

