; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15734 () Bool)

(assert start!15734)

(declare-fun b!157020 () Bool)

(declare-fun b_free!3397 () Bool)

(declare-fun b_next!3397 () Bool)

(assert (=> b!157020 (= b_free!3397 (not b_next!3397))))

(declare-fun tp!12716 () Bool)

(declare-fun b_and!9825 () Bool)

(assert (=> b!157020 (= tp!12716 b_and!9825)))

(declare-fun b!157013 () Bool)

(declare-fun res!74231 () Bool)

(declare-fun e!102693 () Bool)

(assert (=> b!157013 (=> (not res!74231) (not e!102693))))

(declare-datatypes ((V!3913 0))(
  ( (V!3914 (val!1644 Int)) )
))
(declare-datatypes ((ValueCell!1256 0))(
  ( (ValueCellFull!1256 (v!3510 V!3913)) (EmptyCell!1256) )
))
(declare-datatypes ((array!5437 0))(
  ( (array!5438 (arr!2576 (Array (_ BitVec 32) (_ BitVec 64))) (size!2854 (_ BitVec 32))) )
))
(declare-datatypes ((array!5439 0))(
  ( (array!5440 (arr!2577 (Array (_ BitVec 32) ValueCell!1256)) (size!2855 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1420 0))(
  ( (LongMapFixedSize!1421 (defaultEntry!3152 Int) (mask!7617 (_ BitVec 32)) (extraKeys!2893 (_ BitVec 32)) (zeroValue!2995 V!3913) (minValue!2995 V!3913) (_size!759 (_ BitVec 32)) (_keys!4927 array!5437) (_values!3135 array!5439) (_vacant!759 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1420)

(assert (=> b!157013 (= res!74231 (and (= (size!2855 (_values!3135 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7617 thiss!1248))) (= (size!2854 (_keys!4927 thiss!1248)) (size!2855 (_values!3135 thiss!1248))) (bvsge (mask!7617 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2893 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2893 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2893 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2893 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2893 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2893 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2893 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5441 () Bool)

(declare-fun mapRes!5441 () Bool)

(declare-fun tp!12715 () Bool)

(declare-fun e!102691 () Bool)

(assert (=> mapNonEmpty!5441 (= mapRes!5441 (and tp!12715 e!102691))))

(declare-fun mapKey!5441 () (_ BitVec 32))

(declare-fun mapRest!5441 () (Array (_ BitVec 32) ValueCell!1256))

(declare-fun mapValue!5441 () ValueCell!1256)

(assert (=> mapNonEmpty!5441 (= (arr!2577 (_values!3135 thiss!1248)) (store mapRest!5441 mapKey!5441 mapValue!5441))))

(declare-fun res!74233 () Bool)

(assert (=> start!15734 (=> (not res!74233) (not e!102693))))

(declare-fun valid!696 (LongMapFixedSize!1420) Bool)

(assert (=> start!15734 (= res!74233 (valid!696 thiss!1248))))

(assert (=> start!15734 e!102693))

(declare-fun e!102688 () Bool)

(assert (=> start!15734 e!102688))

(assert (=> start!15734 true))

(declare-fun mapIsEmpty!5441 () Bool)

(assert (=> mapIsEmpty!5441 mapRes!5441))

(declare-fun b!157014 () Bool)

(declare-fun e!102690 () Bool)

(declare-fun e!102692 () Bool)

(assert (=> b!157014 (= e!102690 (and e!102692 mapRes!5441))))

(declare-fun condMapEmpty!5441 () Bool)

(declare-fun mapDefault!5441 () ValueCell!1256)

(assert (=> b!157014 (= condMapEmpty!5441 (= (arr!2577 (_values!3135 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1256)) mapDefault!5441)))))

(declare-fun b!157015 () Bool)

(declare-fun tp_is_empty!3199 () Bool)

(assert (=> b!157015 (= e!102691 tp_is_empty!3199)))

(declare-fun b!157016 () Bool)

(declare-fun res!74229 () Bool)

(assert (=> b!157016 (=> (not res!74229) (not e!102693))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157016 (= res!74229 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!157017 () Bool)

(assert (=> b!157017 (= e!102692 tp_is_empty!3199)))

(declare-fun b!157018 () Bool)

(declare-fun res!74232 () Bool)

(assert (=> b!157018 (=> (not res!74232) (not e!102693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5437 (_ BitVec 32)) Bool)

(assert (=> b!157018 (= res!74232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4927 thiss!1248) (mask!7617 thiss!1248)))))

(declare-fun b!157019 () Bool)

(assert (=> b!157019 (= e!102693 false)))

(declare-fun lt!81669 () Bool)

(declare-datatypes ((List!1854 0))(
  ( (Nil!1851) (Cons!1850 (h!2459 (_ BitVec 64)) (t!6648 List!1854)) )
))
(declare-fun arrayNoDuplicates!0 (array!5437 (_ BitVec 32) List!1854) Bool)

(assert (=> b!157019 (= lt!81669 (arrayNoDuplicates!0 (_keys!4927 thiss!1248) #b00000000000000000000000000000000 Nil!1851))))

(declare-fun array_inv!1633 (array!5437) Bool)

(declare-fun array_inv!1634 (array!5439) Bool)

(assert (=> b!157020 (= e!102688 (and tp!12716 tp_is_empty!3199 (array_inv!1633 (_keys!4927 thiss!1248)) (array_inv!1634 (_values!3135 thiss!1248)) e!102690))))

(declare-fun b!157021 () Bool)

(declare-fun res!74230 () Bool)

(assert (=> b!157021 (=> (not res!74230) (not e!102693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157021 (= res!74230 (validMask!0 (mask!7617 thiss!1248)))))

(assert (= (and start!15734 res!74233) b!157016))

(assert (= (and b!157016 res!74229) b!157021))

(assert (= (and b!157021 res!74230) b!157013))

(assert (= (and b!157013 res!74231) b!157018))

(assert (= (and b!157018 res!74232) b!157019))

(assert (= (and b!157014 condMapEmpty!5441) mapIsEmpty!5441))

(assert (= (and b!157014 (not condMapEmpty!5441)) mapNonEmpty!5441))

(get-info :version)

(assert (= (and mapNonEmpty!5441 ((_ is ValueCellFull!1256) mapValue!5441)) b!157015))

(assert (= (and b!157014 ((_ is ValueCellFull!1256) mapDefault!5441)) b!157017))

(assert (= b!157020 b!157014))

(assert (= start!15734 b!157020))

(declare-fun m!190457 () Bool)

(assert (=> b!157018 m!190457))

(declare-fun m!190459 () Bool)

(assert (=> mapNonEmpty!5441 m!190459))

(declare-fun m!190461 () Bool)

(assert (=> b!157021 m!190461))

(declare-fun m!190463 () Bool)

(assert (=> start!15734 m!190463))

(declare-fun m!190465 () Bool)

(assert (=> b!157020 m!190465))

(declare-fun m!190467 () Bool)

(assert (=> b!157020 m!190467))

(declare-fun m!190469 () Bool)

(assert (=> b!157019 m!190469))

(check-sat (not b!157019) (not mapNonEmpty!5441) (not b!157020) (not b_next!3397) (not b!157018) b_and!9825 (not start!15734) (not b!157021) tp_is_empty!3199)
(check-sat b_and!9825 (not b_next!3397))
