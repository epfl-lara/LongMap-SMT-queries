; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15710 () Bool)

(assert start!15710)

(declare-fun b!156502 () Bool)

(declare-fun b_free!3373 () Bool)

(declare-fun b_next!3373 () Bool)

(assert (=> b!156502 (= b_free!3373 (not b_next!3373))))

(declare-fun tp!12643 () Bool)

(declare-fun b_and!9761 () Bool)

(assert (=> b!156502 (= tp!12643 b_and!9761)))

(declare-fun b!156495 () Bool)

(declare-fun e!102347 () Bool)

(declare-fun tp_is_empty!3175 () Bool)

(assert (=> b!156495 (= e!102347 tp_is_empty!3175)))

(declare-fun b!156496 () Bool)

(declare-fun res!73934 () Bool)

(declare-fun e!102349 () Bool)

(assert (=> b!156496 (=> (not res!73934) (not e!102349))))

(declare-datatypes ((V!3881 0))(
  ( (V!3882 (val!1632 Int)) )
))
(declare-datatypes ((ValueCell!1244 0))(
  ( (ValueCellFull!1244 (v!3491 V!3881)) (EmptyCell!1244) )
))
(declare-datatypes ((array!5383 0))(
  ( (array!5384 (arr!2548 (Array (_ BitVec 32) (_ BitVec 64))) (size!2827 (_ BitVec 32))) )
))
(declare-datatypes ((array!5385 0))(
  ( (array!5386 (arr!2549 (Array (_ BitVec 32) ValueCell!1244)) (size!2828 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1396 0))(
  ( (LongMapFixedSize!1397 (defaultEntry!3140 Int) (mask!7596 (_ BitVec 32)) (extraKeys!2881 (_ BitVec 32)) (zeroValue!2983 V!3881) (minValue!2983 V!3881) (_size!747 (_ BitVec 32)) (_keys!4914 array!5383) (_values!3123 array!5385) (_vacant!747 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1396)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5383 (_ BitVec 32)) Bool)

(assert (=> b!156496 (= res!73934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4914 thiss!1248) (mask!7596 thiss!1248)))))

(declare-fun b!156497 () Bool)

(declare-fun res!73935 () Bool)

(assert (=> b!156497 (=> (not res!73935) (not e!102349))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156497 (= res!73935 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156498 () Bool)

(declare-fun e!102350 () Bool)

(assert (=> b!156498 (= e!102350 tp_is_empty!3175)))

(declare-fun b!156499 () Bool)

(assert (=> b!156499 (= e!102349 false)))

(declare-fun lt!81393 () Bool)

(declare-datatypes ((List!1858 0))(
  ( (Nil!1855) (Cons!1854 (h!2463 (_ BitVec 64)) (t!6651 List!1858)) )
))
(declare-fun arrayNoDuplicates!0 (array!5383 (_ BitVec 32) List!1858) Bool)

(assert (=> b!156499 (= lt!81393 (arrayNoDuplicates!0 (_keys!4914 thiss!1248) #b00000000000000000000000000000000 Nil!1855))))

(declare-fun mapIsEmpty!5405 () Bool)

(declare-fun mapRes!5405 () Bool)

(assert (=> mapIsEmpty!5405 mapRes!5405))

(declare-fun mapNonEmpty!5405 () Bool)

(declare-fun tp!12644 () Bool)

(assert (=> mapNonEmpty!5405 (= mapRes!5405 (and tp!12644 e!102347))))

(declare-fun mapValue!5405 () ValueCell!1244)

(declare-fun mapRest!5405 () (Array (_ BitVec 32) ValueCell!1244))

(declare-fun mapKey!5405 () (_ BitVec 32))

(assert (=> mapNonEmpty!5405 (= (arr!2549 (_values!3123 thiss!1248)) (store mapRest!5405 mapKey!5405 mapValue!5405))))

(declare-fun b!156500 () Bool)

(declare-fun res!73936 () Bool)

(assert (=> b!156500 (=> (not res!73936) (not e!102349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156500 (= res!73936 (validMask!0 (mask!7596 thiss!1248)))))

(declare-fun b!156501 () Bool)

(declare-fun e!102352 () Bool)

(assert (=> b!156501 (= e!102352 (and e!102350 mapRes!5405))))

(declare-fun condMapEmpty!5405 () Bool)

(declare-fun mapDefault!5405 () ValueCell!1244)

(assert (=> b!156501 (= condMapEmpty!5405 (= (arr!2549 (_values!3123 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1244)) mapDefault!5405)))))

(declare-fun res!73937 () Bool)

(assert (=> start!15710 (=> (not res!73937) (not e!102349))))

(declare-fun valid!676 (LongMapFixedSize!1396) Bool)

(assert (=> start!15710 (= res!73937 (valid!676 thiss!1248))))

(assert (=> start!15710 e!102349))

(declare-fun e!102351 () Bool)

(assert (=> start!15710 e!102351))

(assert (=> start!15710 true))

(declare-fun array_inv!1643 (array!5383) Bool)

(declare-fun array_inv!1644 (array!5385) Bool)

(assert (=> b!156502 (= e!102351 (and tp!12643 tp_is_empty!3175 (array_inv!1643 (_keys!4914 thiss!1248)) (array_inv!1644 (_values!3123 thiss!1248)) e!102352))))

(declare-fun b!156503 () Bool)

(declare-fun res!73933 () Bool)

(assert (=> b!156503 (=> (not res!73933) (not e!102349))))

(assert (=> b!156503 (= res!73933 (and (= (size!2828 (_values!3123 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7596 thiss!1248))) (= (size!2827 (_keys!4914 thiss!1248)) (size!2828 (_values!3123 thiss!1248))) (bvsge (mask!7596 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2881 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2881 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2881 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!15710 res!73937) b!156497))

(assert (= (and b!156497 res!73935) b!156500))

(assert (= (and b!156500 res!73936) b!156503))

(assert (= (and b!156503 res!73933) b!156496))

(assert (= (and b!156496 res!73934) b!156499))

(assert (= (and b!156501 condMapEmpty!5405) mapIsEmpty!5405))

(assert (= (and b!156501 (not condMapEmpty!5405)) mapNonEmpty!5405))

(get-info :version)

(assert (= (and mapNonEmpty!5405 ((_ is ValueCellFull!1244) mapValue!5405)) b!156495))

(assert (= (and b!156501 ((_ is ValueCellFull!1244) mapDefault!5405)) b!156498))

(assert (= b!156502 b!156501))

(assert (= start!15710 b!156502))

(declare-fun m!189487 () Bool)

(assert (=> start!15710 m!189487))

(declare-fun m!189489 () Bool)

(assert (=> b!156496 m!189489))

(declare-fun m!189491 () Bool)

(assert (=> mapNonEmpty!5405 m!189491))

(declare-fun m!189493 () Bool)

(assert (=> b!156500 m!189493))

(declare-fun m!189495 () Bool)

(assert (=> b!156499 m!189495))

(declare-fun m!189497 () Bool)

(assert (=> b!156502 m!189497))

(declare-fun m!189499 () Bool)

(assert (=> b!156502 m!189499))

(check-sat (not b_next!3373) (not b!156502) (not start!15710) (not b!156496) (not b!156499) (not mapNonEmpty!5405) (not b!156500) tp_is_empty!3175 b_and!9761)
(check-sat b_and!9761 (not b_next!3373))
