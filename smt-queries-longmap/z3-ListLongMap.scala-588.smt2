; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15672 () Bool)

(assert start!15672)

(declare-fun b!156190 () Bool)

(declare-fun b_free!3339 () Bool)

(declare-fun b_next!3339 () Bool)

(assert (=> b!156190 (= b_free!3339 (not b_next!3339))))

(declare-fun tp!12541 () Bool)

(declare-fun b_and!9753 () Bool)

(assert (=> b!156190 (= tp!12541 b_and!9753)))

(declare-fun b!156183 () Bool)

(declare-fun res!73776 () Bool)

(declare-fun e!102143 () Bool)

(assert (=> b!156183 (=> (not res!73776) (not e!102143))))

(declare-datatypes ((V!3835 0))(
  ( (V!3836 (val!1615 Int)) )
))
(declare-datatypes ((ValueCell!1227 0))(
  ( (ValueCellFull!1227 (v!3480 V!3835)) (EmptyCell!1227) )
))
(declare-datatypes ((array!5335 0))(
  ( (array!5336 (arr!2525 (Array (_ BitVec 32) (_ BitVec 64))) (size!2803 (_ BitVec 32))) )
))
(declare-datatypes ((array!5337 0))(
  ( (array!5338 (arr!2526 (Array (_ BitVec 32) ValueCell!1227)) (size!2804 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1362 0))(
  ( (LongMapFixedSize!1363 (defaultEntry!3123 Int) (mask!7568 (_ BitVec 32)) (extraKeys!2864 (_ BitVec 32)) (zeroValue!2966 V!3835) (minValue!2966 V!3835) (_size!730 (_ BitVec 32)) (_keys!4898 array!5335) (_values!3106 array!5337) (_vacant!730 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1362)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5335 (_ BitVec 32)) Bool)

(assert (=> b!156183 (= res!73776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4898 thiss!1248) (mask!7568 thiss!1248)))))

(declare-fun res!73774 () Bool)

(assert (=> start!15672 (=> (not res!73774) (not e!102143))))

(declare-fun valid!661 (LongMapFixedSize!1362) Bool)

(assert (=> start!15672 (= res!73774 (valid!661 thiss!1248))))

(assert (=> start!15672 e!102143))

(declare-fun e!102147 () Bool)

(assert (=> start!15672 e!102147))

(assert (=> start!15672 true))

(declare-fun b!156184 () Bool)

(assert (=> b!156184 (= e!102143 false)))

(declare-fun lt!81523 () Bool)

(declare-datatypes ((List!1849 0))(
  ( (Nil!1846) (Cons!1845 (h!2454 (_ BitVec 64)) (t!6651 List!1849)) )
))
(declare-fun arrayNoDuplicates!0 (array!5335 (_ BitVec 32) List!1849) Bool)

(assert (=> b!156184 (= lt!81523 (arrayNoDuplicates!0 (_keys!4898 thiss!1248) #b00000000000000000000000000000000 Nil!1846))))

(declare-fun b!156185 () Bool)

(declare-fun e!102145 () Bool)

(declare-fun tp_is_empty!3141 () Bool)

(assert (=> b!156185 (= e!102145 tp_is_empty!3141)))

(declare-fun mapIsEmpty!5354 () Bool)

(declare-fun mapRes!5354 () Bool)

(assert (=> mapIsEmpty!5354 mapRes!5354))

(declare-fun b!156186 () Bool)

(declare-fun res!73775 () Bool)

(assert (=> b!156186 (=> (not res!73775) (not e!102143))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156186 (= res!73775 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156187 () Bool)

(declare-fun res!73773 () Bool)

(assert (=> b!156187 (=> (not res!73773) (not e!102143))))

(assert (=> b!156187 (= res!73773 (and (= (size!2804 (_values!3106 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7568 thiss!1248))) (= (size!2803 (_keys!4898 thiss!1248)) (size!2804 (_values!3106 thiss!1248))) (bvsge (mask!7568 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2864 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2864 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2864 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2864 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2864 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2864 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2864 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156188 () Bool)

(declare-fun e!102144 () Bool)

(declare-fun e!102146 () Bool)

(assert (=> b!156188 (= e!102144 (and e!102146 mapRes!5354))))

(declare-fun condMapEmpty!5354 () Bool)

(declare-fun mapDefault!5354 () ValueCell!1227)

(assert (=> b!156188 (= condMapEmpty!5354 (= (arr!2526 (_values!3106 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1227)) mapDefault!5354)))))

(declare-fun b!156189 () Bool)

(assert (=> b!156189 (= e!102146 tp_is_empty!3141)))

(declare-fun array_inv!1595 (array!5335) Bool)

(declare-fun array_inv!1596 (array!5337) Bool)

(assert (=> b!156190 (= e!102147 (and tp!12541 tp_is_empty!3141 (array_inv!1595 (_keys!4898 thiss!1248)) (array_inv!1596 (_values!3106 thiss!1248)) e!102144))))

(declare-fun b!156191 () Bool)

(declare-fun res!73777 () Bool)

(assert (=> b!156191 (=> (not res!73777) (not e!102143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156191 (= res!73777 (validMask!0 (mask!7568 thiss!1248)))))

(declare-fun mapNonEmpty!5354 () Bool)

(declare-fun tp!12542 () Bool)

(assert (=> mapNonEmpty!5354 (= mapRes!5354 (and tp!12542 e!102145))))

(declare-fun mapRest!5354 () (Array (_ BitVec 32) ValueCell!1227))

(declare-fun mapKey!5354 () (_ BitVec 32))

(declare-fun mapValue!5354 () ValueCell!1227)

(assert (=> mapNonEmpty!5354 (= (arr!2526 (_values!3106 thiss!1248)) (store mapRest!5354 mapKey!5354 mapValue!5354))))

(assert (= (and start!15672 res!73774) b!156186))

(assert (= (and b!156186 res!73775) b!156191))

(assert (= (and b!156191 res!73777) b!156187))

(assert (= (and b!156187 res!73773) b!156183))

(assert (= (and b!156183 res!73776) b!156184))

(assert (= (and b!156188 condMapEmpty!5354) mapIsEmpty!5354))

(assert (= (and b!156188 (not condMapEmpty!5354)) mapNonEmpty!5354))

(get-info :version)

(assert (= (and mapNonEmpty!5354 ((_ is ValueCellFull!1227) mapValue!5354)) b!156185))

(assert (= (and b!156188 ((_ is ValueCellFull!1227) mapDefault!5354)) b!156189))

(assert (= b!156190 b!156188))

(assert (= start!15672 b!156190))

(declare-fun m!189869 () Bool)

(assert (=> b!156183 m!189869))

(declare-fun m!189871 () Bool)

(assert (=> mapNonEmpty!5354 m!189871))

(declare-fun m!189873 () Bool)

(assert (=> b!156184 m!189873))

(declare-fun m!189875 () Bool)

(assert (=> b!156191 m!189875))

(declare-fun m!189877 () Bool)

(assert (=> b!156190 m!189877))

(declare-fun m!189879 () Bool)

(assert (=> b!156190 m!189879))

(declare-fun m!189881 () Bool)

(assert (=> start!15672 m!189881))

(check-sat (not b!156191) (not mapNonEmpty!5354) tp_is_empty!3141 (not b_next!3339) (not b!156190) (not b!156184) (not b!156183) (not start!15672) b_and!9753)
(check-sat b_and!9753 (not b_next!3339))
