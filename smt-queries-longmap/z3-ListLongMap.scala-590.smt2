; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15684 () Bool)

(assert start!15684)

(declare-fun b!156348 () Bool)

(declare-fun b_free!3351 () Bool)

(declare-fun b_next!3351 () Bool)

(assert (=> b!156348 (= b_free!3351 (not b_next!3351))))

(declare-fun tp!12577 () Bool)

(declare-fun b_and!9765 () Bool)

(assert (=> b!156348 (= tp!12577 b_and!9765)))

(declare-fun b!156345 () Bool)

(declare-fun e!102255 () Bool)

(declare-fun tp_is_empty!3153 () Bool)

(assert (=> b!156345 (= e!102255 tp_is_empty!3153)))

(declare-fun b!156346 () Bool)

(declare-fun e!102252 () Bool)

(assert (=> b!156346 (= e!102252 tp_is_empty!3153)))

(declare-fun mapNonEmpty!5372 () Bool)

(declare-fun mapRes!5372 () Bool)

(declare-fun tp!12578 () Bool)

(assert (=> mapNonEmpty!5372 (= mapRes!5372 (and tp!12578 e!102252))))

(declare-datatypes ((V!3851 0))(
  ( (V!3852 (val!1621 Int)) )
))
(declare-datatypes ((ValueCell!1233 0))(
  ( (ValueCellFull!1233 (v!3486 V!3851)) (EmptyCell!1233) )
))
(declare-fun mapRest!5372 () (Array (_ BitVec 32) ValueCell!1233))

(declare-fun mapKey!5372 () (_ BitVec 32))

(declare-datatypes ((array!5359 0))(
  ( (array!5360 (arr!2537 (Array (_ BitVec 32) (_ BitVec 64))) (size!2815 (_ BitVec 32))) )
))
(declare-datatypes ((array!5361 0))(
  ( (array!5362 (arr!2538 (Array (_ BitVec 32) ValueCell!1233)) (size!2816 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1374 0))(
  ( (LongMapFixedSize!1375 (defaultEntry!3129 Int) (mask!7578 (_ BitVec 32)) (extraKeys!2870 (_ BitVec 32)) (zeroValue!2972 V!3851) (minValue!2972 V!3851) (_size!736 (_ BitVec 32)) (_keys!4904 array!5359) (_values!3112 array!5361) (_vacant!736 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1374)

(declare-fun mapValue!5372 () ValueCell!1233)

(assert (=> mapNonEmpty!5372 (= (arr!2538 (_values!3112 thiss!1248)) (store mapRest!5372 mapKey!5372 mapValue!5372))))

(declare-fun b!156347 () Bool)

(declare-fun res!73866 () Bool)

(declare-fun e!102251 () Bool)

(assert (=> b!156347 (=> (not res!73866) (not e!102251))))

(assert (=> b!156347 (= res!73866 (and (= (size!2816 (_values!3112 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7578 thiss!1248))) (= (size!2815 (_keys!4904 thiss!1248)) (size!2816 (_values!3112 thiss!1248))) (bvsge (mask!7578 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2870 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2870 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2870 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2870 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2870 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2870 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2870 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!102253 () Bool)

(declare-fun e!102254 () Bool)

(declare-fun array_inv!1603 (array!5359) Bool)

(declare-fun array_inv!1604 (array!5361) Bool)

(assert (=> b!156348 (= e!102254 (and tp!12577 tp_is_empty!3153 (array_inv!1603 (_keys!4904 thiss!1248)) (array_inv!1604 (_values!3112 thiss!1248)) e!102253))))

(declare-fun mapIsEmpty!5372 () Bool)

(assert (=> mapIsEmpty!5372 mapRes!5372))

(declare-fun b!156350 () Bool)

(declare-fun res!73863 () Bool)

(assert (=> b!156350 (=> (not res!73863) (not e!102251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5359 (_ BitVec 32)) Bool)

(assert (=> b!156350 (= res!73863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4904 thiss!1248) (mask!7578 thiss!1248)))))

(declare-fun b!156351 () Bool)

(assert (=> b!156351 (= e!102251 false)))

(declare-fun lt!81541 () Bool)

(declare-datatypes ((List!1853 0))(
  ( (Nil!1850) (Cons!1849 (h!2458 (_ BitVec 64)) (t!6655 List!1853)) )
))
(declare-fun arrayNoDuplicates!0 (array!5359 (_ BitVec 32) List!1853) Bool)

(assert (=> b!156351 (= lt!81541 (arrayNoDuplicates!0 (_keys!4904 thiss!1248) #b00000000000000000000000000000000 Nil!1850))))

(declare-fun res!73864 () Bool)

(assert (=> start!15684 (=> (not res!73864) (not e!102251))))

(declare-fun valid!666 (LongMapFixedSize!1374) Bool)

(assert (=> start!15684 (= res!73864 (valid!666 thiss!1248))))

(assert (=> start!15684 e!102251))

(assert (=> start!15684 e!102254))

(assert (=> start!15684 true))

(declare-fun b!156349 () Bool)

(assert (=> b!156349 (= e!102253 (and e!102255 mapRes!5372))))

(declare-fun condMapEmpty!5372 () Bool)

(declare-fun mapDefault!5372 () ValueCell!1233)

(assert (=> b!156349 (= condMapEmpty!5372 (= (arr!2538 (_values!3112 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1233)) mapDefault!5372)))))

(declare-fun b!156352 () Bool)

(declare-fun res!73865 () Bool)

(assert (=> b!156352 (=> (not res!73865) (not e!102251))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156352 (= res!73865 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156353 () Bool)

(declare-fun res!73867 () Bool)

(assert (=> b!156353 (=> (not res!73867) (not e!102251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156353 (= res!73867 (validMask!0 (mask!7578 thiss!1248)))))

(assert (= (and start!15684 res!73864) b!156352))

(assert (= (and b!156352 res!73865) b!156353))

(assert (= (and b!156353 res!73867) b!156347))

(assert (= (and b!156347 res!73866) b!156350))

(assert (= (and b!156350 res!73863) b!156351))

(assert (= (and b!156349 condMapEmpty!5372) mapIsEmpty!5372))

(assert (= (and b!156349 (not condMapEmpty!5372)) mapNonEmpty!5372))

(get-info :version)

(assert (= (and mapNonEmpty!5372 ((_ is ValueCellFull!1233) mapValue!5372)) b!156346))

(assert (= (and b!156349 ((_ is ValueCellFull!1233) mapDefault!5372)) b!156345))

(assert (= b!156348 b!156349))

(assert (= start!15684 b!156348))

(declare-fun m!189953 () Bool)

(assert (=> b!156351 m!189953))

(declare-fun m!189955 () Bool)

(assert (=> b!156353 m!189955))

(declare-fun m!189957 () Bool)

(assert (=> start!15684 m!189957))

(declare-fun m!189959 () Bool)

(assert (=> b!156350 m!189959))

(declare-fun m!189961 () Bool)

(assert (=> mapNonEmpty!5372 m!189961))

(declare-fun m!189963 () Bool)

(assert (=> b!156348 m!189963))

(declare-fun m!189965 () Bool)

(assert (=> b!156348 m!189965))

(check-sat (not b!156350) (not b_next!3351) tp_is_empty!3153 (not start!15684) (not b!156348) b_and!9765 (not b!156351) (not b!156353) (not mapNonEmpty!5372))
(check-sat b_and!9765 (not b_next!3351))
