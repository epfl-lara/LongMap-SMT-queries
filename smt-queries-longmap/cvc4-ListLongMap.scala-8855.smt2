; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107416 () Bool)

(assert start!107416)

(declare-fun b!1272629 () Bool)

(declare-fun b_free!27677 () Bool)

(declare-fun b_next!27677 () Bool)

(assert (=> b!1272629 (= b_free!27677 (not b_next!27677))))

(declare-fun tp!97551 () Bool)

(declare-fun b_and!45733 () Bool)

(assert (=> b!1272629 (= tp!97551 b_and!45733)))

(declare-fun b!1272624 () Bool)

(declare-fun e!725921 () Bool)

(declare-fun tp_is_empty!33047 () Bool)

(assert (=> b!1272624 (= e!725921 tp_is_empty!33047)))

(declare-fun b!1272625 () Bool)

(declare-fun e!725917 () Bool)

(declare-datatypes ((V!49255 0))(
  ( (V!49256 (val!16598 Int)) )
))
(declare-datatypes ((ValueCell!15670 0))(
  ( (ValueCellFull!15670 (v!19235 V!49255)) (EmptyCell!15670) )
))
(declare-datatypes ((array!83350 0))(
  ( (array!83351 (arr!40208 (Array (_ BitVec 32) ValueCell!15670)) (size!40746 (_ BitVec 32))) )
))
(declare-datatypes ((array!83352 0))(
  ( (array!83353 (arr!40209 (Array (_ BitVec 32) (_ BitVec 64))) (size!40747 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6104 0))(
  ( (LongMapFixedSize!6105 (defaultEntry!6698 Int) (mask!34450 (_ BitVec 32)) (extraKeys!6377 (_ BitVec 32)) (zeroValue!6483 V!49255) (minValue!6483 V!49255) (_size!3107 (_ BitVec 32)) (_keys!12106 array!83352) (_values!6721 array!83350) (_vacant!3107 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6104)

(assert (=> b!1272625 (= e!725917 (and (= (size!40746 (_values!6721 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34450 thiss!1559))) (not (= (size!40747 (_keys!12106 thiss!1559)) (size!40746 (_values!6721 thiss!1559))))))))

(declare-fun b!1272626 () Bool)

(declare-fun res!846477 () Bool)

(assert (=> b!1272626 (=> (not res!846477) (not e!725917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272626 (= res!846477 (validMask!0 (mask!34450 thiss!1559)))))

(declare-fun res!846476 () Bool)

(assert (=> start!107416 (=> (not res!846476) (not e!725917))))

(declare-fun valid!2290 (LongMapFixedSize!6104) Bool)

(assert (=> start!107416 (= res!846476 (valid!2290 thiss!1559))))

(assert (=> start!107416 e!725917))

(declare-fun e!725919 () Bool)

(assert (=> start!107416 e!725919))

(declare-fun b!1272627 () Bool)

(declare-fun e!725920 () Bool)

(assert (=> b!1272627 (= e!725920 tp_is_empty!33047)))

(declare-fun b!1272628 () Bool)

(declare-fun e!725916 () Bool)

(declare-fun mapRes!51165 () Bool)

(assert (=> b!1272628 (= e!725916 (and e!725921 mapRes!51165))))

(declare-fun condMapEmpty!51165 () Bool)

(declare-fun mapDefault!51165 () ValueCell!15670)

