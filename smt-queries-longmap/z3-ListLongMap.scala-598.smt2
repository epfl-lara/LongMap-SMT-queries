; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15734 () Bool)

(assert start!15734)

(declare-fun b!156824 () Bool)

(declare-fun b_free!3397 () Bool)

(declare-fun b_next!3397 () Bool)

(assert (=> b!156824 (= b_free!3397 (not b_next!3397))))

(declare-fun tp!12715 () Bool)

(declare-fun b_and!9785 () Bool)

(assert (=> b!156824 (= tp!12715 b_and!9785)))

(declare-fun b!156819 () Bool)

(declare-fun res!74117 () Bool)

(declare-fun e!102564 () Bool)

(assert (=> b!156819 (=> (not res!74117) (not e!102564))))

(declare-datatypes ((V!3913 0))(
  ( (V!3914 (val!1644 Int)) )
))
(declare-datatypes ((ValueCell!1256 0))(
  ( (ValueCellFull!1256 (v!3503 V!3913)) (EmptyCell!1256) )
))
(declare-datatypes ((array!5431 0))(
  ( (array!5432 (arr!2572 (Array (_ BitVec 32) (_ BitVec 64))) (size!2851 (_ BitVec 32))) )
))
(declare-datatypes ((array!5433 0))(
  ( (array!5434 (arr!2573 (Array (_ BitVec 32) ValueCell!1256)) (size!2852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1420 0))(
  ( (LongMapFixedSize!1421 (defaultEntry!3152 Int) (mask!7616 (_ BitVec 32)) (extraKeys!2893 (_ BitVec 32)) (zeroValue!2995 V!3913) (minValue!2995 V!3913) (_size!759 (_ BitVec 32)) (_keys!4926 array!5431) (_values!3135 array!5433) (_vacant!759 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1420)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156819 (= res!74117 (validMask!0 (mask!7616 thiss!1248)))))

(declare-fun mapIsEmpty!5441 () Bool)

(declare-fun mapRes!5441 () Bool)

(assert (=> mapIsEmpty!5441 mapRes!5441))

(declare-fun b!156820 () Bool)

(assert (=> b!156820 (= e!102564 false)))

(declare-fun lt!81429 () Bool)

(declare-datatypes ((List!1867 0))(
  ( (Nil!1864) (Cons!1863 (h!2472 (_ BitVec 64)) (t!6660 List!1867)) )
))
(declare-fun arrayNoDuplicates!0 (array!5431 (_ BitVec 32) List!1867) Bool)

(assert (=> b!156820 (= lt!81429 (arrayNoDuplicates!0 (_keys!4926 thiss!1248) #b00000000000000000000000000000000 Nil!1864))))

(declare-fun b!156821 () Bool)

(declare-fun e!102563 () Bool)

(declare-fun tp_is_empty!3199 () Bool)

(assert (=> b!156821 (= e!102563 tp_is_empty!3199)))

(declare-fun res!74116 () Bool)

(assert (=> start!15734 (=> (not res!74116) (not e!102564))))

(declare-fun valid!684 (LongMapFixedSize!1420) Bool)

(assert (=> start!15734 (= res!74116 (valid!684 thiss!1248))))

(assert (=> start!15734 e!102564))

(declare-fun e!102568 () Bool)

(assert (=> start!15734 e!102568))

(assert (=> start!15734 true))

(declare-fun b!156822 () Bool)

(declare-fun e!102565 () Bool)

(assert (=> b!156822 (= e!102565 (and e!102563 mapRes!5441))))

(declare-fun condMapEmpty!5441 () Bool)

(declare-fun mapDefault!5441 () ValueCell!1256)

(assert (=> b!156822 (= condMapEmpty!5441 (= (arr!2573 (_values!3135 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1256)) mapDefault!5441)))))

(declare-fun b!156823 () Bool)

(declare-fun res!74115 () Bool)

(assert (=> b!156823 (=> (not res!74115) (not e!102564))))

(assert (=> b!156823 (= res!74115 (and (= (size!2852 (_values!3135 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7616 thiss!1248))) (= (size!2851 (_keys!4926 thiss!1248)) (size!2852 (_values!3135 thiss!1248))) (bvsge (mask!7616 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2893 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2893 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2893 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2893 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2893 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2893 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2893 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun array_inv!1659 (array!5431) Bool)

(declare-fun array_inv!1660 (array!5433) Bool)

(assert (=> b!156824 (= e!102568 (and tp!12715 tp_is_empty!3199 (array_inv!1659 (_keys!4926 thiss!1248)) (array_inv!1660 (_values!3135 thiss!1248)) e!102565))))

(declare-fun b!156825 () Bool)

(declare-fun res!74113 () Bool)

(assert (=> b!156825 (=> (not res!74113) (not e!102564))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156825 (= res!74113 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5441 () Bool)

(declare-fun tp!12716 () Bool)

(declare-fun e!102567 () Bool)

(assert (=> mapNonEmpty!5441 (= mapRes!5441 (and tp!12716 e!102567))))

(declare-fun mapValue!5441 () ValueCell!1256)

(declare-fun mapRest!5441 () (Array (_ BitVec 32) ValueCell!1256))

(declare-fun mapKey!5441 () (_ BitVec 32))

(assert (=> mapNonEmpty!5441 (= (arr!2573 (_values!3135 thiss!1248)) (store mapRest!5441 mapKey!5441 mapValue!5441))))

(declare-fun b!156826 () Bool)

(declare-fun res!74114 () Bool)

(assert (=> b!156826 (=> (not res!74114) (not e!102564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5431 (_ BitVec 32)) Bool)

(assert (=> b!156826 (= res!74114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4926 thiss!1248) (mask!7616 thiss!1248)))))

(declare-fun b!156827 () Bool)

(assert (=> b!156827 (= e!102567 tp_is_empty!3199)))

(assert (= (and start!15734 res!74116) b!156825))

(assert (= (and b!156825 res!74113) b!156819))

(assert (= (and b!156819 res!74117) b!156823))

(assert (= (and b!156823 res!74115) b!156826))

(assert (= (and b!156826 res!74114) b!156820))

(assert (= (and b!156822 condMapEmpty!5441) mapIsEmpty!5441))

(assert (= (and b!156822 (not condMapEmpty!5441)) mapNonEmpty!5441))

(get-info :version)

(assert (= (and mapNonEmpty!5441 ((_ is ValueCellFull!1256) mapValue!5441)) b!156827))

(assert (= (and b!156822 ((_ is ValueCellFull!1256) mapDefault!5441)) b!156821))

(assert (= b!156824 b!156822))

(assert (= start!15734 b!156824))

(declare-fun m!189655 () Bool)

(assert (=> mapNonEmpty!5441 m!189655))

(declare-fun m!189657 () Bool)

(assert (=> start!15734 m!189657))

(declare-fun m!189659 () Bool)

(assert (=> b!156824 m!189659))

(declare-fun m!189661 () Bool)

(assert (=> b!156824 m!189661))

(declare-fun m!189663 () Bool)

(assert (=> b!156819 m!189663))

(declare-fun m!189665 () Bool)

(assert (=> b!156820 m!189665))

(declare-fun m!189667 () Bool)

(assert (=> b!156826 m!189667))

(check-sat (not b!156826) b_and!9785 (not mapNonEmpty!5441) (not start!15734) (not b!156820) tp_is_empty!3199 (not b_next!3397) (not b!156824) (not b!156819))
(check-sat b_and!9785 (not b_next!3397))
