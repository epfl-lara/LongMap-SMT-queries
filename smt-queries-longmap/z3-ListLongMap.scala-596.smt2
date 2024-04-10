; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15720 () Bool)

(assert start!15720)

(declare-fun b!156838 () Bool)

(declare-fun b_free!3387 () Bool)

(declare-fun b_next!3387 () Bool)

(assert (=> b!156838 (= b_free!3387 (not b_next!3387))))

(declare-fun tp!12686 () Bool)

(declare-fun b_and!9801 () Bool)

(assert (=> b!156838 (= tp!12686 b_and!9801)))

(declare-fun b!156831 () Bool)

(declare-fun res!74133 () Bool)

(declare-fun e!102579 () Bool)

(assert (=> b!156831 (=> (not res!74133) (not e!102579))))

(declare-datatypes ((V!3899 0))(
  ( (V!3900 (val!1639 Int)) )
))
(declare-datatypes ((ValueCell!1251 0))(
  ( (ValueCellFull!1251 (v!3504 V!3899)) (EmptyCell!1251) )
))
(declare-datatypes ((array!5431 0))(
  ( (array!5432 (arr!2573 (Array (_ BitVec 32) (_ BitVec 64))) (size!2851 (_ BitVec 32))) )
))
(declare-datatypes ((array!5433 0))(
  ( (array!5434 (arr!2574 (Array (_ BitVec 32) ValueCell!1251)) (size!2852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1410 0))(
  ( (LongMapFixedSize!1411 (defaultEntry!3147 Int) (mask!7608 (_ BitVec 32)) (extraKeys!2888 (_ BitVec 32)) (zeroValue!2990 V!3899) (minValue!2990 V!3899) (_size!754 (_ BitVec 32)) (_keys!4922 array!5431) (_values!3130 array!5433) (_vacant!754 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1410)

(assert (=> b!156831 (= res!74133 (and (= (size!2852 (_values!3130 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7608 thiss!1248))) (= (size!2851 (_keys!4922 thiss!1248)) (size!2852 (_values!3130 thiss!1248))) (bvsge (mask!7608 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2888 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2888 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2888 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2888 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2888 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2888 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2888 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156832 () Bool)

(declare-fun res!74136 () Bool)

(assert (=> b!156832 (=> (not res!74136) (not e!102579))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156832 (= res!74136 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156833 () Bool)

(declare-fun e!102578 () Bool)

(declare-fun tp_is_empty!3189 () Bool)

(assert (=> b!156833 (= e!102578 tp_is_empty!3189)))

(declare-fun b!156834 () Bool)

(declare-fun e!102574 () Bool)

(assert (=> b!156834 (= e!102574 tp_is_empty!3189)))

(declare-fun b!156835 () Bool)

(declare-fun res!74135 () Bool)

(assert (=> b!156835 (=> (not res!74135) (not e!102579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5431 (_ BitVec 32)) Bool)

(assert (=> b!156835 (= res!74135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4922 thiss!1248) (mask!7608 thiss!1248)))))

(declare-fun b!156836 () Bool)

(declare-fun res!74137 () Bool)

(assert (=> b!156836 (=> (not res!74137) (not e!102579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156836 (= res!74137 (validMask!0 (mask!7608 thiss!1248)))))

(declare-fun res!74134 () Bool)

(assert (=> start!15720 (=> (not res!74134) (not e!102579))))

(declare-fun valid!674 (LongMapFixedSize!1410) Bool)

(assert (=> start!15720 (= res!74134 (valid!674 thiss!1248))))

(assert (=> start!15720 e!102579))

(declare-fun e!102576 () Bool)

(assert (=> start!15720 e!102576))

(assert (=> start!15720 true))

(declare-fun b!156837 () Bool)

(declare-fun e!102577 () Bool)

(declare-fun mapRes!5426 () Bool)

(assert (=> b!156837 (= e!102577 (and e!102574 mapRes!5426))))

(declare-fun condMapEmpty!5426 () Bool)

(declare-fun mapDefault!5426 () ValueCell!1251)

(assert (=> b!156837 (= condMapEmpty!5426 (= (arr!2574 (_values!3130 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1251)) mapDefault!5426)))))

(declare-fun mapNonEmpty!5426 () Bool)

(declare-fun tp!12685 () Bool)

(assert (=> mapNonEmpty!5426 (= mapRes!5426 (and tp!12685 e!102578))))

(declare-fun mapRest!5426 () (Array (_ BitVec 32) ValueCell!1251))

(declare-fun mapKey!5426 () (_ BitVec 32))

(declare-fun mapValue!5426 () ValueCell!1251)

(assert (=> mapNonEmpty!5426 (= (arr!2574 (_values!3130 thiss!1248)) (store mapRest!5426 mapKey!5426 mapValue!5426))))

(declare-fun mapIsEmpty!5426 () Bool)

(assert (=> mapIsEmpty!5426 mapRes!5426))

(declare-fun array_inv!1625 (array!5431) Bool)

(declare-fun array_inv!1626 (array!5433) Bool)

(assert (=> b!156838 (= e!102576 (and tp!12686 tp_is_empty!3189 (array_inv!1625 (_keys!4922 thiss!1248)) (array_inv!1626 (_values!3130 thiss!1248)) e!102577))))

(declare-fun b!156839 () Bool)

(assert (=> b!156839 (= e!102579 false)))

(declare-fun lt!81595 () Bool)

(declare-datatypes ((List!1863 0))(
  ( (Nil!1860) (Cons!1859 (h!2468 (_ BitVec 64)) (t!6665 List!1863)) )
))
(declare-fun arrayNoDuplicates!0 (array!5431 (_ BitVec 32) List!1863) Bool)

(assert (=> b!156839 (= lt!81595 (arrayNoDuplicates!0 (_keys!4922 thiss!1248) #b00000000000000000000000000000000 Nil!1860))))

(assert (= (and start!15720 res!74134) b!156832))

(assert (= (and b!156832 res!74136) b!156836))

(assert (= (and b!156836 res!74137) b!156831))

(assert (= (and b!156831 res!74133) b!156835))

(assert (= (and b!156835 res!74135) b!156839))

(assert (= (and b!156837 condMapEmpty!5426) mapIsEmpty!5426))

(assert (= (and b!156837 (not condMapEmpty!5426)) mapNonEmpty!5426))

(get-info :version)

(assert (= (and mapNonEmpty!5426 ((_ is ValueCellFull!1251) mapValue!5426)) b!156833))

(assert (= (and b!156837 ((_ is ValueCellFull!1251) mapDefault!5426)) b!156834))

(assert (= b!156838 b!156837))

(assert (= start!15720 b!156838))

(declare-fun m!190205 () Bool)

(assert (=> b!156838 m!190205))

(declare-fun m!190207 () Bool)

(assert (=> b!156838 m!190207))

(declare-fun m!190209 () Bool)

(assert (=> b!156836 m!190209))

(declare-fun m!190211 () Bool)

(assert (=> mapNonEmpty!5426 m!190211))

(declare-fun m!190213 () Bool)

(assert (=> start!15720 m!190213))

(declare-fun m!190215 () Bool)

(assert (=> b!156835 m!190215))

(declare-fun m!190217 () Bool)

(assert (=> b!156839 m!190217))

(check-sat (not b!156839) (not b!156836) (not mapNonEmpty!5426) (not b!156835) b_and!9801 (not b!156838) (not start!15720) tp_is_empty!3189 (not b_next!3387))
(check-sat b_and!9801 (not b_next!3387))
