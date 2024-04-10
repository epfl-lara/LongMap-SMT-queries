; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15708 () Bool)

(assert start!15708)

(declare-fun b!156672 () Bool)

(declare-fun b_free!3375 () Bool)

(declare-fun b_next!3375 () Bool)

(assert (=> b!156672 (= b_free!3375 (not b_next!3375))))

(declare-fun tp!12650 () Bool)

(declare-fun b_and!9789 () Bool)

(assert (=> b!156672 (= tp!12650 b_and!9789)))

(declare-fun b!156669 () Bool)

(declare-fun res!74045 () Bool)

(declare-fun e!102471 () Bool)

(assert (=> b!156669 (=> (not res!74045) (not e!102471))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156669 (= res!74045 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156670 () Bool)

(declare-fun res!74047 () Bool)

(assert (=> b!156670 (=> (not res!74047) (not e!102471))))

(declare-datatypes ((V!3883 0))(
  ( (V!3884 (val!1633 Int)) )
))
(declare-datatypes ((ValueCell!1245 0))(
  ( (ValueCellFull!1245 (v!3498 V!3883)) (EmptyCell!1245) )
))
(declare-datatypes ((array!5407 0))(
  ( (array!5408 (arr!2561 (Array (_ BitVec 32) (_ BitVec 64))) (size!2839 (_ BitVec 32))) )
))
(declare-datatypes ((array!5409 0))(
  ( (array!5410 (arr!2562 (Array (_ BitVec 32) ValueCell!1245)) (size!2840 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1398 0))(
  ( (LongMapFixedSize!1399 (defaultEntry!3141 Int) (mask!7598 (_ BitVec 32)) (extraKeys!2882 (_ BitVec 32)) (zeroValue!2984 V!3883) (minValue!2984 V!3883) (_size!748 (_ BitVec 32)) (_keys!4916 array!5407) (_values!3124 array!5409) (_vacant!748 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1398)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5407 (_ BitVec 32)) Bool)

(assert (=> b!156670 (= res!74047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4916 thiss!1248) (mask!7598 thiss!1248)))))

(declare-fun res!74044 () Bool)

(assert (=> start!15708 (=> (not res!74044) (not e!102471))))

(declare-fun valid!672 (LongMapFixedSize!1398) Bool)

(assert (=> start!15708 (= res!74044 (valid!672 thiss!1248))))

(assert (=> start!15708 e!102471))

(declare-fun e!102466 () Bool)

(assert (=> start!15708 e!102466))

(assert (=> start!15708 true))

(declare-fun b!156671 () Bool)

(declare-fun e!102469 () Bool)

(declare-fun tp_is_empty!3177 () Bool)

(assert (=> b!156671 (= e!102469 tp_is_empty!3177)))

(declare-fun e!102470 () Bool)

(declare-fun array_inv!1617 (array!5407) Bool)

(declare-fun array_inv!1618 (array!5409) Bool)

(assert (=> b!156672 (= e!102466 (and tp!12650 tp_is_empty!3177 (array_inv!1617 (_keys!4916 thiss!1248)) (array_inv!1618 (_values!3124 thiss!1248)) e!102470))))

(declare-fun mapIsEmpty!5408 () Bool)

(declare-fun mapRes!5408 () Bool)

(assert (=> mapIsEmpty!5408 mapRes!5408))

(declare-fun b!156673 () Bool)

(declare-fun e!102467 () Bool)

(assert (=> b!156673 (= e!102467 tp_is_empty!3177)))

(declare-fun b!156674 () Bool)

(declare-fun res!74046 () Bool)

(assert (=> b!156674 (=> (not res!74046) (not e!102471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156674 (= res!74046 (validMask!0 (mask!7598 thiss!1248)))))

(declare-fun mapNonEmpty!5408 () Bool)

(declare-fun tp!12649 () Bool)

(assert (=> mapNonEmpty!5408 (= mapRes!5408 (and tp!12649 e!102469))))

(declare-fun mapValue!5408 () ValueCell!1245)

(declare-fun mapRest!5408 () (Array (_ BitVec 32) ValueCell!1245))

(declare-fun mapKey!5408 () (_ BitVec 32))

(assert (=> mapNonEmpty!5408 (= (arr!2562 (_values!3124 thiss!1248)) (store mapRest!5408 mapKey!5408 mapValue!5408))))

(declare-fun b!156675 () Bool)

(assert (=> b!156675 (= e!102470 (and e!102467 mapRes!5408))))

(declare-fun condMapEmpty!5408 () Bool)

(declare-fun mapDefault!5408 () ValueCell!1245)

(assert (=> b!156675 (= condMapEmpty!5408 (= (arr!2562 (_values!3124 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1245)) mapDefault!5408)))))

(declare-fun b!156676 () Bool)

(assert (=> b!156676 (= e!102471 false)))

(declare-fun lt!81577 () Bool)

(declare-datatypes ((List!1860 0))(
  ( (Nil!1857) (Cons!1856 (h!2465 (_ BitVec 64)) (t!6662 List!1860)) )
))
(declare-fun arrayNoDuplicates!0 (array!5407 (_ BitVec 32) List!1860) Bool)

(assert (=> b!156676 (= lt!81577 (arrayNoDuplicates!0 (_keys!4916 thiss!1248) #b00000000000000000000000000000000 Nil!1857))))

(declare-fun b!156677 () Bool)

(declare-fun res!74043 () Bool)

(assert (=> b!156677 (=> (not res!74043) (not e!102471))))

(assert (=> b!156677 (= res!74043 (and (= (size!2840 (_values!3124 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7598 thiss!1248))) (= (size!2839 (_keys!4916 thiss!1248)) (size!2840 (_values!3124 thiss!1248))) (bvsge (mask!7598 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2882 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2882 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2882 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2882 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2882 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2882 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2882 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!15708 res!74044) b!156669))

(assert (= (and b!156669 res!74045) b!156674))

(assert (= (and b!156674 res!74046) b!156677))

(assert (= (and b!156677 res!74043) b!156670))

(assert (= (and b!156670 res!74047) b!156676))

(assert (= (and b!156675 condMapEmpty!5408) mapIsEmpty!5408))

(assert (= (and b!156675 (not condMapEmpty!5408)) mapNonEmpty!5408))

(get-info :version)

(assert (= (and mapNonEmpty!5408 ((_ is ValueCellFull!1245) mapValue!5408)) b!156671))

(assert (= (and b!156675 ((_ is ValueCellFull!1245) mapDefault!5408)) b!156673))

(assert (= b!156672 b!156675))

(assert (= start!15708 b!156672))

(declare-fun m!190121 () Bool)

(assert (=> b!156672 m!190121))

(declare-fun m!190123 () Bool)

(assert (=> b!156672 m!190123))

(declare-fun m!190125 () Bool)

(assert (=> b!156670 m!190125))

(declare-fun m!190127 () Bool)

(assert (=> start!15708 m!190127))

(declare-fun m!190129 () Bool)

(assert (=> b!156674 m!190129))

(declare-fun m!190131 () Bool)

(assert (=> b!156676 m!190131))

(declare-fun m!190133 () Bool)

(assert (=> mapNonEmpty!5408 m!190133))

(check-sat (not b_next!3375) b_and!9789 (not b!156674) (not mapNonEmpty!5408) (not start!15708) (not b!156670) (not b!156676) tp_is_empty!3177 (not b!156672))
(check-sat b_and!9789 (not b_next!3375))
