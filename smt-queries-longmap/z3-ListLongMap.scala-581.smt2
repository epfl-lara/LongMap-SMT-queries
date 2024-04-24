; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15632 () Bool)

(assert start!15632)

(declare-fun b!155757 () Bool)

(declare-fun b_free!3295 () Bool)

(declare-fun b_next!3295 () Bool)

(assert (=> b!155757 (= b_free!3295 (not b_next!3295))))

(declare-fun tp!12409 () Bool)

(declare-fun b_and!9723 () Bool)

(assert (=> b!155757 (= tp!12409 b_and!9723)))

(declare-fun b!155753 () Bool)

(declare-fun e!101752 () Bool)

(declare-fun tp_is_empty!3097 () Bool)

(assert (=> b!155753 (= e!101752 tp_is_empty!3097)))

(declare-fun res!73583 () Bool)

(declare-fun e!101757 () Bool)

(assert (=> start!15632 (=> (not res!73583) (not e!101757))))

(declare-datatypes ((V!3777 0))(
  ( (V!3778 (val!1593 Int)) )
))
(declare-datatypes ((ValueCell!1205 0))(
  ( (ValueCellFull!1205 (v!3459 V!3777)) (EmptyCell!1205) )
))
(declare-datatypes ((array!5233 0))(
  ( (array!5234 (arr!2474 (Array (_ BitVec 32) (_ BitVec 64))) (size!2752 (_ BitVec 32))) )
))
(declare-datatypes ((array!5235 0))(
  ( (array!5236 (arr!2475 (Array (_ BitVec 32) ValueCell!1205)) (size!2753 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1318 0))(
  ( (LongMapFixedSize!1319 (defaultEntry!3101 Int) (mask!7532 (_ BitVec 32)) (extraKeys!2842 (_ BitVec 32)) (zeroValue!2944 V!3777) (minValue!2944 V!3777) (_size!708 (_ BitVec 32)) (_keys!4876 array!5233) (_values!3084 array!5235) (_vacant!708 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1318)

(declare-fun valid!658 (LongMapFixedSize!1318) Bool)

(assert (=> start!15632 (= res!73583 (valid!658 thiss!1248))))

(assert (=> start!15632 e!101757))

(declare-fun e!101754 () Bool)

(assert (=> start!15632 e!101754))

(assert (=> start!15632 true))

(declare-fun b!155754 () Bool)

(declare-fun e!101755 () Bool)

(declare-fun mapRes!5288 () Bool)

(assert (=> b!155754 (= e!101755 (and e!101752 mapRes!5288))))

(declare-fun condMapEmpty!5288 () Bool)

(declare-fun mapDefault!5288 () ValueCell!1205)

(assert (=> b!155754 (= condMapEmpty!5288 (= (arr!2475 (_values!3084 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1205)) mapDefault!5288)))))

(declare-fun b!155755 () Bool)

(declare-fun res!73584 () Bool)

(assert (=> b!155755 (=> (not res!73584) (not e!101757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155755 (= res!73584 (validMask!0 (mask!7532 thiss!1248)))))

(declare-fun b!155756 () Bool)

(declare-fun res!73582 () Bool)

(assert (=> b!155756 (=> (not res!73582) (not e!101757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5233 (_ BitVec 32)) Bool)

(assert (=> b!155756 (= res!73582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4876 thiss!1248) (mask!7532 thiss!1248)))))

(declare-fun array_inv!1563 (array!5233) Bool)

(declare-fun array_inv!1564 (array!5235) Bool)

(assert (=> b!155757 (= e!101754 (and tp!12409 tp_is_empty!3097 (array_inv!1563 (_keys!4876 thiss!1248)) (array_inv!1564 (_values!3084 thiss!1248)) e!101755))))

(declare-fun b!155758 () Bool)

(declare-fun e!101756 () Bool)

(assert (=> b!155758 (= e!101756 tp_is_empty!3097)))

(declare-fun mapIsEmpty!5288 () Bool)

(assert (=> mapIsEmpty!5288 mapRes!5288))

(declare-fun mapNonEmpty!5288 () Bool)

(declare-fun tp!12410 () Bool)

(assert (=> mapNonEmpty!5288 (= mapRes!5288 (and tp!12410 e!101756))))

(declare-fun mapRest!5288 () (Array (_ BitVec 32) ValueCell!1205))

(declare-fun mapValue!5288 () ValueCell!1205)

(declare-fun mapKey!5288 () (_ BitVec 32))

(assert (=> mapNonEmpty!5288 (= (arr!2475 (_values!3084 thiss!1248)) (store mapRest!5288 mapKey!5288 mapValue!5288))))

(declare-fun b!155759 () Bool)

(declare-fun res!73585 () Bool)

(assert (=> b!155759 (=> (not res!73585) (not e!101757))))

(assert (=> b!155759 (= res!73585 (and (= (size!2753 (_values!3084 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7532 thiss!1248))) (= (size!2752 (_keys!4876 thiss!1248)) (size!2753 (_values!3084 thiss!1248))) (bvsge (mask!7532 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2842 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2842 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2842 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2842 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2842 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2842 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2842 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155760 () Bool)

(assert (=> b!155760 (= e!101757 false)))

(declare-fun lt!81453 () Bool)

(declare-datatypes ((List!1815 0))(
  ( (Nil!1812) (Cons!1811 (h!2420 (_ BitVec 64)) (t!6609 List!1815)) )
))
(declare-fun arrayNoDuplicates!0 (array!5233 (_ BitVec 32) List!1815) Bool)

(assert (=> b!155760 (= lt!81453 (arrayNoDuplicates!0 (_keys!4876 thiss!1248) #b00000000000000000000000000000000 Nil!1812))))

(declare-fun b!155761 () Bool)

(declare-fun res!73581 () Bool)

(assert (=> b!155761 (=> (not res!73581) (not e!101757))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155761 (= res!73581 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!15632 res!73583) b!155761))

(assert (= (and b!155761 res!73581) b!155755))

(assert (= (and b!155755 res!73584) b!155759))

(assert (= (and b!155759 res!73585) b!155756))

(assert (= (and b!155756 res!73582) b!155760))

(assert (= (and b!155754 condMapEmpty!5288) mapIsEmpty!5288))

(assert (= (and b!155754 (not condMapEmpty!5288)) mapNonEmpty!5288))

(get-info :version)

(assert (= (and mapNonEmpty!5288 ((_ is ValueCellFull!1205) mapValue!5288)) b!155758))

(assert (= (and b!155754 ((_ is ValueCellFull!1205) mapDefault!5288)) b!155753))

(assert (= b!155757 b!155754))

(assert (= start!15632 b!155757))

(declare-fun m!189659 () Bool)

(assert (=> b!155756 m!189659))

(declare-fun m!189661 () Bool)

(assert (=> b!155757 m!189661))

(declare-fun m!189663 () Bool)

(assert (=> b!155757 m!189663))

(declare-fun m!189665 () Bool)

(assert (=> b!155760 m!189665))

(declare-fun m!189667 () Bool)

(assert (=> b!155755 m!189667))

(declare-fun m!189669 () Bool)

(assert (=> start!15632 m!189669))

(declare-fun m!189671 () Bool)

(assert (=> mapNonEmpty!5288 m!189671))

(check-sat b_and!9723 (not b!155755) (not mapNonEmpty!5288) tp_is_empty!3097 (not start!15632) (not b!155757) (not b!155760) (not b!155756) (not b_next!3295))
(check-sat b_and!9723 (not b_next!3295))
