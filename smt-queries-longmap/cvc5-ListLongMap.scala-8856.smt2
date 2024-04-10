; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107434 () Bool)

(assert start!107434)

(declare-fun b!1272715 () Bool)

(declare-fun b_free!27679 () Bool)

(declare-fun b_next!27679 () Bool)

(assert (=> b!1272715 (= b_free!27679 (not b_next!27679))))

(declare-fun tp!97561 () Bool)

(declare-fun b_and!45735 () Bool)

(assert (=> b!1272715 (= tp!97561 b_and!45735)))

(declare-fun b!1272712 () Bool)

(declare-fun e!725976 () Bool)

(declare-datatypes ((V!49259 0))(
  ( (V!49260 (val!16599 Int)) )
))
(declare-datatypes ((ValueCell!15671 0))(
  ( (ValueCellFull!15671 (v!19236 V!49259)) (EmptyCell!15671) )
))
(declare-datatypes ((array!83356 0))(
  ( (array!83357 (arr!40210 (Array (_ BitVec 32) ValueCell!15671)) (size!40749 (_ BitVec 32))) )
))
(declare-datatypes ((array!83358 0))(
  ( (array!83359 (arr!40211 (Array (_ BitVec 32) (_ BitVec 64))) (size!40750 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6106 0))(
  ( (LongMapFixedSize!6107 (defaultEntry!6699 Int) (mask!34455 (_ BitVec 32)) (extraKeys!6378 (_ BitVec 32)) (zeroValue!6484 V!49259) (minValue!6484 V!49259) (_size!3108 (_ BitVec 32)) (_keys!12108 array!83358) (_values!6722 array!83356) (_vacant!3108 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6106)

(assert (=> b!1272712 (= e!725976 (and (= (size!40749 (_values!6722 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34455 thiss!1559))) (= (size!40750 (_keys!12108 thiss!1559)) (size!40749 (_values!6722 thiss!1559))) (bvslt (mask!34455 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1272713 () Bool)

(declare-fun e!725980 () Bool)

(declare-fun tp_is_empty!33049 () Bool)

(assert (=> b!1272713 (= e!725980 tp_is_empty!33049)))

(declare-fun b!1272714 () Bool)

(declare-fun e!725978 () Bool)

(assert (=> b!1272714 (= e!725978 tp_is_empty!33049)))

(declare-fun e!725979 () Bool)

(declare-fun e!725977 () Bool)

(declare-fun array_inv!30581 (array!83358) Bool)

(declare-fun array_inv!30582 (array!83356) Bool)

(assert (=> b!1272715 (= e!725979 (and tp!97561 tp_is_empty!33049 (array_inv!30581 (_keys!12108 thiss!1559)) (array_inv!30582 (_values!6722 thiss!1559)) e!725977))))

(declare-fun mapNonEmpty!51172 () Bool)

(declare-fun mapRes!51172 () Bool)

(declare-fun tp!97560 () Bool)

(assert (=> mapNonEmpty!51172 (= mapRes!51172 (and tp!97560 e!725980))))

(declare-fun mapRest!51172 () (Array (_ BitVec 32) ValueCell!15671))

(declare-fun mapValue!51172 () ValueCell!15671)

(declare-fun mapKey!51172 () (_ BitVec 32))

(assert (=> mapNonEmpty!51172 (= (arr!40210 (_values!6722 thiss!1559)) (store mapRest!51172 mapKey!51172 mapValue!51172))))

(declare-fun res!846518 () Bool)

(assert (=> start!107434 (=> (not res!846518) (not e!725976))))

(declare-fun valid!2291 (LongMapFixedSize!6106) Bool)

(assert (=> start!107434 (= res!846518 (valid!2291 thiss!1559))))

(assert (=> start!107434 e!725976))

(assert (=> start!107434 e!725979))

(declare-fun b!1272716 () Bool)

(assert (=> b!1272716 (= e!725977 (and e!725978 mapRes!51172))))

(declare-fun condMapEmpty!51172 () Bool)

(declare-fun mapDefault!51172 () ValueCell!15671)

