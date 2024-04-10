; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15666 () Bool)

(assert start!15666)

(declare-fun b!156105 () Bool)

(declare-fun b_free!3333 () Bool)

(declare-fun b_next!3333 () Bool)

(assert (=> b!156105 (= b_free!3333 (not b_next!3333))))

(declare-fun tp!12523 () Bool)

(declare-fun b_and!9747 () Bool)

(assert (=> b!156105 (= tp!12523 b_and!9747)))

(declare-fun b!156102 () Bool)

(declare-fun res!73731 () Bool)

(declare-fun e!102089 () Bool)

(assert (=> b!156102 (=> (not res!73731) (not e!102089))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156102 (= res!73731 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156103 () Bool)

(declare-fun e!102088 () Bool)

(declare-fun tp_is_empty!3135 () Bool)

(assert (=> b!156103 (= e!102088 tp_is_empty!3135)))

(declare-fun b!156104 () Bool)

(declare-fun res!73730 () Bool)

(assert (=> b!156104 (=> (not res!73730) (not e!102089))))

(declare-datatypes ((V!3827 0))(
  ( (V!3828 (val!1612 Int)) )
))
(declare-datatypes ((ValueCell!1224 0))(
  ( (ValueCellFull!1224 (v!3477 V!3827)) (EmptyCell!1224) )
))
(declare-datatypes ((array!5323 0))(
  ( (array!5324 (arr!2519 (Array (_ BitVec 32) (_ BitVec 64))) (size!2797 (_ BitVec 32))) )
))
(declare-datatypes ((array!5325 0))(
  ( (array!5326 (arr!2520 (Array (_ BitVec 32) ValueCell!1224)) (size!2798 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1356 0))(
  ( (LongMapFixedSize!1357 (defaultEntry!3120 Int) (mask!7563 (_ BitVec 32)) (extraKeys!2861 (_ BitVec 32)) (zeroValue!2963 V!3827) (minValue!2963 V!3827) (_size!727 (_ BitVec 32)) (_keys!4895 array!5323) (_values!3103 array!5325) (_vacant!727 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1356)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5323 (_ BitVec 32)) Bool)

(assert (=> b!156104 (= res!73730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4895 thiss!1248) (mask!7563 thiss!1248)))))

(declare-fun res!73729 () Bool)

(assert (=> start!15666 (=> (not res!73729) (not e!102089))))

(declare-fun valid!659 (LongMapFixedSize!1356) Bool)

(assert (=> start!15666 (= res!73729 (valid!659 thiss!1248))))

(assert (=> start!15666 e!102089))

(declare-fun e!102092 () Bool)

(assert (=> start!15666 e!102092))

(assert (=> start!15666 true))

(declare-fun e!102093 () Bool)

(declare-fun array_inv!1589 (array!5323) Bool)

(declare-fun array_inv!1590 (array!5325) Bool)

(assert (=> b!156105 (= e!102092 (and tp!12523 tp_is_empty!3135 (array_inv!1589 (_keys!4895 thiss!1248)) (array_inv!1590 (_values!3103 thiss!1248)) e!102093))))

(declare-fun b!156106 () Bool)

(declare-fun e!102090 () Bool)

(assert (=> b!156106 (= e!102090 tp_is_empty!3135)))

(declare-fun b!156107 () Bool)

(declare-fun res!73728 () Bool)

(assert (=> b!156107 (=> (not res!73728) (not e!102089))))

(assert (=> b!156107 (= res!73728 (and (= (size!2798 (_values!3103 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7563 thiss!1248))) (= (size!2797 (_keys!4895 thiss!1248)) (size!2798 (_values!3103 thiss!1248))) (bvsge (mask!7563 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2861 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2861 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2861 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2861 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2861 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2861 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2861 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156108 () Bool)

(assert (=> b!156108 (= e!102089 false)))

(declare-fun lt!81514 () Bool)

(declare-datatypes ((List!1846 0))(
  ( (Nil!1843) (Cons!1842 (h!2451 (_ BitVec 64)) (t!6648 List!1846)) )
))
(declare-fun arrayNoDuplicates!0 (array!5323 (_ BitVec 32) List!1846) Bool)

(assert (=> b!156108 (= lt!81514 (arrayNoDuplicates!0 (_keys!4895 thiss!1248) #b00000000000000000000000000000000 Nil!1843))))

(declare-fun mapNonEmpty!5345 () Bool)

(declare-fun mapRes!5345 () Bool)

(declare-fun tp!12524 () Bool)

(assert (=> mapNonEmpty!5345 (= mapRes!5345 (and tp!12524 e!102090))))

(declare-fun mapValue!5345 () ValueCell!1224)

(declare-fun mapRest!5345 () (Array (_ BitVec 32) ValueCell!1224))

(declare-fun mapKey!5345 () (_ BitVec 32))

(assert (=> mapNonEmpty!5345 (= (arr!2520 (_values!3103 thiss!1248)) (store mapRest!5345 mapKey!5345 mapValue!5345))))

(declare-fun mapIsEmpty!5345 () Bool)

(assert (=> mapIsEmpty!5345 mapRes!5345))

(declare-fun b!156109 () Bool)

(assert (=> b!156109 (= e!102093 (and e!102088 mapRes!5345))))

(declare-fun condMapEmpty!5345 () Bool)

(declare-fun mapDefault!5345 () ValueCell!1224)

(assert (=> b!156109 (= condMapEmpty!5345 (= (arr!2520 (_values!3103 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1224)) mapDefault!5345)))))

(declare-fun b!156110 () Bool)

(declare-fun res!73732 () Bool)

(assert (=> b!156110 (=> (not res!73732) (not e!102089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156110 (= res!73732 (validMask!0 (mask!7563 thiss!1248)))))

(assert (= (and start!15666 res!73729) b!156102))

(assert (= (and b!156102 res!73731) b!156110))

(assert (= (and b!156110 res!73732) b!156107))

(assert (= (and b!156107 res!73728) b!156104))

(assert (= (and b!156104 res!73730) b!156108))

(assert (= (and b!156109 condMapEmpty!5345) mapIsEmpty!5345))

(assert (= (and b!156109 (not condMapEmpty!5345)) mapNonEmpty!5345))

(get-info :version)

(assert (= (and mapNonEmpty!5345 ((_ is ValueCellFull!1224) mapValue!5345)) b!156106))

(assert (= (and b!156109 ((_ is ValueCellFull!1224) mapDefault!5345)) b!156103))

(assert (= b!156105 b!156109))

(assert (= start!15666 b!156105))

(declare-fun m!189827 () Bool)

(assert (=> mapNonEmpty!5345 m!189827))

(declare-fun m!189829 () Bool)

(assert (=> b!156105 m!189829))

(declare-fun m!189831 () Bool)

(assert (=> b!156105 m!189831))

(declare-fun m!189833 () Bool)

(assert (=> start!15666 m!189833))

(declare-fun m!189835 () Bool)

(assert (=> b!156108 m!189835))

(declare-fun m!189837 () Bool)

(assert (=> b!156110 m!189837))

(declare-fun m!189839 () Bool)

(assert (=> b!156104 m!189839))

(check-sat (not mapNonEmpty!5345) (not b_next!3333) tp_is_empty!3135 (not b!156108) (not start!15666) (not b!156110) (not b!156105) b_and!9747 (not b!156104))
(check-sat b_and!9747 (not b_next!3333))
