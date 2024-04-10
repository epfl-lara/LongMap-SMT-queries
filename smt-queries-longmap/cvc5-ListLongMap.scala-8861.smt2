; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107526 () Bool)

(assert start!107526)

(declare-fun b!1273245 () Bool)

(declare-fun b_free!27709 () Bool)

(declare-fun b_next!27709 () Bool)

(assert (=> b!1273245 (= b_free!27709 (not b_next!27709))))

(declare-fun tp!97668 () Bool)

(declare-fun b_and!45765 () Bool)

(assert (=> b!1273245 (= tp!97668 b_and!45765)))

(declare-fun tp_is_empty!33079 () Bool)

(declare-datatypes ((V!49299 0))(
  ( (V!49300 (val!16614 Int)) )
))
(declare-datatypes ((ValueCell!15686 0))(
  ( (ValueCellFull!15686 (v!19251 V!49299)) (EmptyCell!15686) )
))
(declare-datatypes ((array!83426 0))(
  ( (array!83427 (arr!40240 (Array (_ BitVec 32) ValueCell!15686)) (size!40781 (_ BitVec 32))) )
))
(declare-datatypes ((array!83428 0))(
  ( (array!83429 (arr!40241 (Array (_ BitVec 32) (_ BitVec 64))) (size!40782 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6136 0))(
  ( (LongMapFixedSize!6137 (defaultEntry!6714 Int) (mask!34489 (_ BitVec 32)) (extraKeys!6393 (_ BitVec 32)) (zeroValue!6499 V!49299) (minValue!6499 V!49299) (_size!3123 (_ BitVec 32)) (_keys!12127 array!83428) (_values!6737 array!83426) (_vacant!3123 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6136)

(declare-fun e!726384 () Bool)

(declare-fun e!726385 () Bool)

(declare-fun array_inv!30599 (array!83428) Bool)

(declare-fun array_inv!30600 (array!83426) Bool)

(assert (=> b!1273245 (= e!726385 (and tp!97668 tp_is_empty!33079 (array_inv!30599 (_keys!12127 thiss!1559)) (array_inv!30600 (_values!6737 thiss!1559)) e!726384))))

(declare-fun mapIsEmpty!51234 () Bool)

(declare-fun mapRes!51234 () Bool)

(assert (=> mapIsEmpty!51234 mapRes!51234))

(declare-fun b!1273246 () Bool)

(declare-fun e!726386 () Bool)

(assert (=> b!1273246 (= e!726386 tp_is_empty!33079)))

(declare-fun b!1273247 () Bool)

(declare-fun res!846763 () Bool)

(declare-fun e!726389 () Bool)

(assert (=> b!1273247 (=> (not res!846763) (not e!726389))))

(assert (=> b!1273247 (= res!846763 (and (= (size!40781 (_values!6737 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34489 thiss!1559))) (= (size!40782 (_keys!12127 thiss!1559)) (size!40781 (_values!6737 thiss!1559))) (bvsge (mask!34489 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6393 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6393 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1273248 () Bool)

(assert (=> b!1273248 (= e!726389 (bvsgt #b00000000000000000000000000000000 (size!40782 (_keys!12127 thiss!1559))))))

(declare-fun b!1273249 () Bool)

(declare-fun e!726388 () Bool)

(assert (=> b!1273249 (= e!726384 (and e!726388 mapRes!51234))))

(declare-fun condMapEmpty!51234 () Bool)

(declare-fun mapDefault!51234 () ValueCell!15686)

