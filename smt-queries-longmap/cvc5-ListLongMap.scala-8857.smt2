; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107448 () Bool)

(assert start!107448)

(declare-fun b!1272785 () Bool)

(declare-fun b_free!27685 () Bool)

(declare-fun b_next!27685 () Bool)

(assert (=> b!1272785 (= b_free!27685 (not b_next!27685))))

(declare-fun tp!97581 () Bool)

(declare-fun b_and!45741 () Bool)

(assert (=> b!1272785 (= tp!97581 b_and!45741)))

(declare-fun b!1272783 () Bool)

(declare-fun res!846545 () Bool)

(declare-fun e!726042 () Bool)

(assert (=> b!1272783 (=> (not res!846545) (not e!726042))))

(declare-datatypes ((V!49267 0))(
  ( (V!49268 (val!16602 Int)) )
))
(declare-datatypes ((ValueCell!15674 0))(
  ( (ValueCellFull!15674 (v!19239 V!49267)) (EmptyCell!15674) )
))
(declare-datatypes ((array!83370 0))(
  ( (array!83371 (arr!40216 (Array (_ BitVec 32) ValueCell!15674)) (size!40755 (_ BitVec 32))) )
))
(declare-datatypes ((array!83372 0))(
  ( (array!83373 (arr!40217 (Array (_ BitVec 32) (_ BitVec 64))) (size!40756 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6112 0))(
  ( (LongMapFixedSize!6113 (defaultEntry!6702 Int) (mask!34461 (_ BitVec 32)) (extraKeys!6381 (_ BitVec 32)) (zeroValue!6487 V!49267) (minValue!6487 V!49267) (_size!3111 (_ BitVec 32)) (_keys!12111 array!83372) (_values!6725 array!83370) (_vacant!3111 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6112)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272783 (= res!846545 (validMask!0 (mask!34461 thiss!1559)))))

(declare-fun b!1272784 () Bool)

(declare-fun e!726039 () Bool)

(declare-fun tp_is_empty!33055 () Bool)

(assert (=> b!1272784 (= e!726039 tp_is_empty!33055)))

(declare-fun res!846546 () Bool)

(assert (=> start!107448 (=> (not res!846546) (not e!726042))))

(declare-fun valid!2293 (LongMapFixedSize!6112) Bool)

(assert (=> start!107448 (= res!846546 (valid!2293 thiss!1559))))

(assert (=> start!107448 e!726042))

(declare-fun e!726041 () Bool)

(assert (=> start!107448 e!726041))

(declare-fun e!726043 () Bool)

(declare-fun array_inv!30585 (array!83372) Bool)

(declare-fun array_inv!30586 (array!83370) Bool)

(assert (=> b!1272785 (= e!726041 (and tp!97581 tp_is_empty!33055 (array_inv!30585 (_keys!12111 thiss!1559)) (array_inv!30586 (_values!6725 thiss!1559)) e!726043))))

(declare-fun b!1272786 () Bool)

(declare-fun e!726038 () Bool)

(assert (=> b!1272786 (= e!726038 tp_is_empty!33055)))

(declare-fun b!1272787 () Bool)

(assert (=> b!1272787 (= e!726042 (and (= (size!40755 (_values!6725 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34461 thiss!1559))) (= (size!40756 (_keys!12111 thiss!1559)) (size!40755 (_values!6725 thiss!1559))) (bvsge (mask!34461 thiss!1559) #b00000000000000000000000000000000) (bvslt (extraKeys!6381 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!51184 () Bool)

(declare-fun mapRes!51184 () Bool)

(assert (=> mapIsEmpty!51184 mapRes!51184))

(declare-fun mapNonEmpty!51184 () Bool)

(declare-fun tp!97582 () Bool)

(assert (=> mapNonEmpty!51184 (= mapRes!51184 (and tp!97582 e!726038))))

(declare-fun mapKey!51184 () (_ BitVec 32))

(declare-fun mapValue!51184 () ValueCell!15674)

(declare-fun mapRest!51184 () (Array (_ BitVec 32) ValueCell!15674))

(assert (=> mapNonEmpty!51184 (= (arr!40216 (_values!6725 thiss!1559)) (store mapRest!51184 mapKey!51184 mapValue!51184))))

(declare-fun b!1272788 () Bool)

(assert (=> b!1272788 (= e!726043 (and e!726039 mapRes!51184))))

(declare-fun condMapEmpty!51184 () Bool)

(declare-fun mapDefault!51184 () ValueCell!15674)

