; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15734 () Bool)

(assert start!15734)

(declare-fun b!157023 () Bool)

(declare-fun b_free!3401 () Bool)

(declare-fun b_next!3401 () Bool)

(assert (=> b!157023 (= b_free!3401 (not b_next!3401))))

(declare-fun tp!12728 () Bool)

(declare-fun b_and!9815 () Bool)

(assert (=> b!157023 (= tp!12728 b_and!9815)))

(declare-fun b!157020 () Bool)

(declare-fun e!102702 () Bool)

(declare-fun tp_is_empty!3203 () Bool)

(assert (=> b!157020 (= e!102702 tp_is_empty!3203)))

(declare-fun b!157021 () Bool)

(declare-fun e!102704 () Bool)

(assert (=> b!157021 (= e!102704 false)))

(declare-fun lt!81616 () Bool)

(declare-datatypes ((V!3917 0))(
  ( (V!3918 (val!1646 Int)) )
))
(declare-datatypes ((ValueCell!1258 0))(
  ( (ValueCellFull!1258 (v!3511 V!3917)) (EmptyCell!1258) )
))
(declare-datatypes ((array!5459 0))(
  ( (array!5460 (arr!2587 (Array (_ BitVec 32) (_ BitVec 64))) (size!2865 (_ BitVec 32))) )
))
(declare-datatypes ((array!5461 0))(
  ( (array!5462 (arr!2588 (Array (_ BitVec 32) ValueCell!1258)) (size!2866 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1424 0))(
  ( (LongMapFixedSize!1425 (defaultEntry!3154 Int) (mask!7619 (_ BitVec 32)) (extraKeys!2895 (_ BitVec 32)) (zeroValue!2997 V!3917) (minValue!2997 V!3917) (_size!761 (_ BitVec 32)) (_keys!4929 array!5459) (_values!3137 array!5461) (_vacant!761 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1424)

(declare-datatypes ((List!1868 0))(
  ( (Nil!1865) (Cons!1864 (h!2473 (_ BitVec 64)) (t!6670 List!1868)) )
))
(declare-fun arrayNoDuplicates!0 (array!5459 (_ BitVec 32) List!1868) Bool)

(assert (=> b!157021 (= lt!81616 (arrayNoDuplicates!0 (_keys!4929 thiss!1248) #b00000000000000000000000000000000 Nil!1865))))

(declare-fun b!157022 () Bool)

(declare-fun res!74240 () Bool)

(assert (=> b!157022 (=> (not res!74240) (not e!102704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5459 (_ BitVec 32)) Bool)

(assert (=> b!157022 (= res!74240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4929 thiss!1248) (mask!7619 thiss!1248)))))

(declare-fun res!74238 () Bool)

(assert (=> start!15734 (=> (not res!74238) (not e!102704))))

(declare-fun valid!678 (LongMapFixedSize!1424) Bool)

(assert (=> start!15734 (= res!74238 (valid!678 thiss!1248))))

(assert (=> start!15734 e!102704))

(declare-fun e!102705 () Bool)

(assert (=> start!15734 e!102705))

(assert (=> start!15734 true))

(declare-fun e!102701 () Bool)

(declare-fun array_inv!1635 (array!5459) Bool)

(declare-fun array_inv!1636 (array!5461) Bool)

(assert (=> b!157023 (= e!102705 (and tp!12728 tp_is_empty!3203 (array_inv!1635 (_keys!4929 thiss!1248)) (array_inv!1636 (_values!3137 thiss!1248)) e!102701))))

(declare-fun b!157024 () Bool)

(declare-fun res!74239 () Bool)

(assert (=> b!157024 (=> (not res!74239) (not e!102704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157024 (= res!74239 (validMask!0 (mask!7619 thiss!1248)))))

(declare-fun mapNonEmpty!5447 () Bool)

(declare-fun mapRes!5447 () Bool)

(declare-fun tp!12727 () Bool)

(declare-fun e!102703 () Bool)

(assert (=> mapNonEmpty!5447 (= mapRes!5447 (and tp!12727 e!102703))))

(declare-fun mapValue!5447 () ValueCell!1258)

(declare-fun mapRest!5447 () (Array (_ BitVec 32) ValueCell!1258))

(declare-fun mapKey!5447 () (_ BitVec 32))

(assert (=> mapNonEmpty!5447 (= (arr!2588 (_values!3137 thiss!1248)) (store mapRest!5447 mapKey!5447 mapValue!5447))))

(declare-fun b!157025 () Bool)

(declare-fun res!74241 () Bool)

(assert (=> b!157025 (=> (not res!74241) (not e!102704))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157025 (= res!74241 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5447 () Bool)

(assert (=> mapIsEmpty!5447 mapRes!5447))

(declare-fun b!157026 () Bool)

(declare-fun res!74242 () Bool)

(assert (=> b!157026 (=> (not res!74242) (not e!102704))))

(assert (=> b!157026 (= res!74242 (and (= (size!2866 (_values!3137 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7619 thiss!1248))) (= (size!2865 (_keys!4929 thiss!1248)) (size!2866 (_values!3137 thiss!1248))) (bvsge (mask!7619 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2895 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2895 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2895 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2895 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2895 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2895 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2895 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!157027 () Bool)

(assert (=> b!157027 (= e!102701 (and e!102702 mapRes!5447))))

(declare-fun condMapEmpty!5447 () Bool)

(declare-fun mapDefault!5447 () ValueCell!1258)

