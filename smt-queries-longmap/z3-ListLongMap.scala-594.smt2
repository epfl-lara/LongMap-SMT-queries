; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15710 () Bool)

(assert start!15710)

(declare-fun b!156695 () Bool)

(declare-fun b_free!3373 () Bool)

(declare-fun b_next!3373 () Bool)

(assert (=> b!156695 (= b_free!3373 (not b_next!3373))))

(declare-fun tp!12643 () Bool)

(declare-fun b_and!9801 () Bool)

(assert (=> b!156695 (= tp!12643 b_and!9801)))

(declare-fun b!156689 () Bool)

(declare-fun res!74052 () Bool)

(declare-fun e!102477 () Bool)

(assert (=> b!156689 (=> (not res!74052) (not e!102477))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156689 (= res!74052 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156690 () Bool)

(declare-fun res!74049 () Bool)

(assert (=> b!156690 (=> (not res!74049) (not e!102477))))

(declare-datatypes ((V!3881 0))(
  ( (V!3882 (val!1632 Int)) )
))
(declare-datatypes ((ValueCell!1244 0))(
  ( (ValueCellFull!1244 (v!3498 V!3881)) (EmptyCell!1244) )
))
(declare-datatypes ((array!5389 0))(
  ( (array!5390 (arr!2552 (Array (_ BitVec 32) (_ BitVec 64))) (size!2830 (_ BitVec 32))) )
))
(declare-datatypes ((array!5391 0))(
  ( (array!5392 (arr!2553 (Array (_ BitVec 32) ValueCell!1244)) (size!2831 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1396 0))(
  ( (LongMapFixedSize!1397 (defaultEntry!3140 Int) (mask!7597 (_ BitVec 32)) (extraKeys!2881 (_ BitVec 32)) (zeroValue!2983 V!3881) (minValue!2983 V!3881) (_size!747 (_ BitVec 32)) (_keys!4915 array!5389) (_values!3123 array!5391) (_vacant!747 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1396)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5389 (_ BitVec 32)) Bool)

(assert (=> b!156690 (= res!74049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4915 thiss!1248) (mask!7597 thiss!1248)))))

(declare-fun b!156692 () Bool)

(declare-fun e!102472 () Bool)

(declare-fun tp_is_empty!3175 () Bool)

(assert (=> b!156692 (= e!102472 tp_is_empty!3175)))

(declare-fun mapNonEmpty!5405 () Bool)

(declare-fun mapRes!5405 () Bool)

(declare-fun tp!12644 () Bool)

(declare-fun e!102475 () Bool)

(assert (=> mapNonEmpty!5405 (= mapRes!5405 (and tp!12644 e!102475))))

(declare-fun mapKey!5405 () (_ BitVec 32))

(declare-fun mapValue!5405 () ValueCell!1244)

(declare-fun mapRest!5405 () (Array (_ BitVec 32) ValueCell!1244))

(assert (=> mapNonEmpty!5405 (= (arr!2553 (_values!3123 thiss!1248)) (store mapRest!5405 mapKey!5405 mapValue!5405))))

(declare-fun b!156693 () Bool)

(declare-fun e!102473 () Bool)

(assert (=> b!156693 (= e!102473 (and e!102472 mapRes!5405))))

(declare-fun condMapEmpty!5405 () Bool)

(declare-fun mapDefault!5405 () ValueCell!1244)

(assert (=> b!156693 (= condMapEmpty!5405 (= (arr!2553 (_values!3123 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1244)) mapDefault!5405)))))

(declare-fun b!156694 () Bool)

(declare-fun res!74050 () Bool)

(assert (=> b!156694 (=> (not res!74050) (not e!102477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156694 (= res!74050 (validMask!0 (mask!7597 thiss!1248)))))

(declare-fun mapIsEmpty!5405 () Bool)

(assert (=> mapIsEmpty!5405 mapRes!5405))

(declare-fun e!102474 () Bool)

(declare-fun array_inv!1619 (array!5389) Bool)

(declare-fun array_inv!1620 (array!5391) Bool)

(assert (=> b!156695 (= e!102474 (and tp!12643 tp_is_empty!3175 (array_inv!1619 (_keys!4915 thiss!1248)) (array_inv!1620 (_values!3123 thiss!1248)) e!102473))))

(declare-fun b!156691 () Bool)

(assert (=> b!156691 (= e!102477 false)))

(declare-fun lt!81633 () Bool)

(declare-datatypes ((List!1845 0))(
  ( (Nil!1842) (Cons!1841 (h!2450 (_ BitVec 64)) (t!6639 List!1845)) )
))
(declare-fun arrayNoDuplicates!0 (array!5389 (_ BitVec 32) List!1845) Bool)

(assert (=> b!156691 (= lt!81633 (arrayNoDuplicates!0 (_keys!4915 thiss!1248) #b00000000000000000000000000000000 Nil!1842))))

(declare-fun res!74053 () Bool)

(assert (=> start!15710 (=> (not res!74053) (not e!102477))))

(declare-fun valid!688 (LongMapFixedSize!1396) Bool)

(assert (=> start!15710 (= res!74053 (valid!688 thiss!1248))))

(assert (=> start!15710 e!102477))

(assert (=> start!15710 e!102474))

(assert (=> start!15710 true))

(declare-fun b!156696 () Bool)

(assert (=> b!156696 (= e!102475 tp_is_empty!3175)))

(declare-fun b!156697 () Bool)

(declare-fun res!74051 () Bool)

(assert (=> b!156697 (=> (not res!74051) (not e!102477))))

(assert (=> b!156697 (= res!74051 (and (= (size!2831 (_values!3123 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7597 thiss!1248))) (= (size!2830 (_keys!4915 thiss!1248)) (size!2831 (_values!3123 thiss!1248))) (bvsge (mask!7597 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2881 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2881 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2881 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2881 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!15710 res!74053) b!156689))

(assert (= (and b!156689 res!74052) b!156694))

(assert (= (and b!156694 res!74050) b!156697))

(assert (= (and b!156697 res!74051) b!156690))

(assert (= (and b!156690 res!74049) b!156691))

(assert (= (and b!156693 condMapEmpty!5405) mapIsEmpty!5405))

(assert (= (and b!156693 (not condMapEmpty!5405)) mapNonEmpty!5405))

(get-info :version)

(assert (= (and mapNonEmpty!5405 ((_ is ValueCellFull!1244) mapValue!5405)) b!156696))

(assert (= (and b!156693 ((_ is ValueCellFull!1244) mapDefault!5405)) b!156692))

(assert (= b!156695 b!156693))

(assert (= start!15710 b!156695))

(declare-fun m!190289 () Bool)

(assert (=> mapNonEmpty!5405 m!190289))

(declare-fun m!190291 () Bool)

(assert (=> b!156694 m!190291))

(declare-fun m!190293 () Bool)

(assert (=> b!156695 m!190293))

(declare-fun m!190295 () Bool)

(assert (=> b!156695 m!190295))

(declare-fun m!190297 () Bool)

(assert (=> b!156691 m!190297))

(declare-fun m!190299 () Bool)

(assert (=> b!156690 m!190299))

(declare-fun m!190301 () Bool)

(assert (=> start!15710 m!190301))

(check-sat (not b!156691) (not mapNonEmpty!5405) (not b!156695) (not b!156690) tp_is_empty!3175 b_and!9801 (not b!156694) (not start!15710) (not b_next!3373))
(check-sat b_and!9801 (not b_next!3373))
