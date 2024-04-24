; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15674 () Bool)

(assert start!15674)

(declare-fun b!156209 () Bool)

(declare-fun b_free!3337 () Bool)

(declare-fun b_next!3337 () Bool)

(assert (=> b!156209 (= b_free!3337 (not b_next!3337))))

(declare-fun tp!12536 () Bool)

(declare-fun b_and!9765 () Bool)

(assert (=> b!156209 (= tp!12536 b_and!9765)))

(declare-fun b!156203 () Bool)

(declare-fun e!102150 () Bool)

(declare-fun e!102148 () Bool)

(declare-fun mapRes!5351 () Bool)

(assert (=> b!156203 (= e!102150 (and e!102148 mapRes!5351))))

(declare-fun condMapEmpty!5351 () Bool)

(declare-datatypes ((V!3833 0))(
  ( (V!3834 (val!1614 Int)) )
))
(declare-datatypes ((ValueCell!1226 0))(
  ( (ValueCellFull!1226 (v!3480 V!3833)) (EmptyCell!1226) )
))
(declare-datatypes ((array!5317 0))(
  ( (array!5318 (arr!2516 (Array (_ BitVec 32) (_ BitVec 64))) (size!2794 (_ BitVec 32))) )
))
(declare-datatypes ((array!5319 0))(
  ( (array!5320 (arr!2517 (Array (_ BitVec 32) ValueCell!1226)) (size!2795 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1360 0))(
  ( (LongMapFixedSize!1361 (defaultEntry!3122 Int) (mask!7567 (_ BitVec 32)) (extraKeys!2863 (_ BitVec 32)) (zeroValue!2965 V!3833) (minValue!2965 V!3833) (_size!729 (_ BitVec 32)) (_keys!4897 array!5317) (_values!3105 array!5319) (_vacant!729 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1360)

(declare-fun mapDefault!5351 () ValueCell!1226)

(assert (=> b!156203 (= condMapEmpty!5351 (= (arr!2517 (_values!3105 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1226)) mapDefault!5351)))))

(declare-fun b!156204 () Bool)

(declare-fun res!73781 () Bool)

(declare-fun e!102152 () Bool)

(assert (=> b!156204 (=> (not res!73781) (not e!102152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156204 (= res!73781 (validMask!0 (mask!7567 thiss!1248)))))

(declare-fun b!156205 () Bool)

(declare-fun e!102153 () Bool)

(declare-fun tp_is_empty!3139 () Bool)

(assert (=> b!156205 (= e!102153 tp_is_empty!3139)))

(declare-fun b!156206 () Bool)

(declare-fun res!73783 () Bool)

(assert (=> b!156206 (=> (not res!73783) (not e!102152))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156206 (= res!73783 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156207 () Bool)

(assert (=> b!156207 (= e!102148 tp_is_empty!3139)))

(declare-fun b!156208 () Bool)

(declare-fun res!73780 () Bool)

(assert (=> b!156208 (=> (not res!73780) (not e!102152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5317 (_ BitVec 32)) Bool)

(assert (=> b!156208 (= res!73780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4897 thiss!1248) (mask!7567 thiss!1248)))))

(declare-fun res!73782 () Bool)

(assert (=> start!15674 (=> (not res!73782) (not e!102152))))

(declare-fun valid!676 (LongMapFixedSize!1360) Bool)

(assert (=> start!15674 (= res!73782 (valid!676 thiss!1248))))

(assert (=> start!15674 e!102152))

(declare-fun e!102151 () Bool)

(assert (=> start!15674 e!102151))

(assert (=> start!15674 true))

(declare-fun mapNonEmpty!5351 () Bool)

(declare-fun tp!12535 () Bool)

(assert (=> mapNonEmpty!5351 (= mapRes!5351 (and tp!12535 e!102153))))

(declare-fun mapValue!5351 () ValueCell!1226)

(declare-fun mapRest!5351 () (Array (_ BitVec 32) ValueCell!1226))

(declare-fun mapKey!5351 () (_ BitVec 32))

(assert (=> mapNonEmpty!5351 (= (arr!2517 (_values!3105 thiss!1248)) (store mapRest!5351 mapKey!5351 mapValue!5351))))

(declare-fun mapIsEmpty!5351 () Bool)

(assert (=> mapIsEmpty!5351 mapRes!5351))

(declare-fun array_inv!1589 (array!5317) Bool)

(declare-fun array_inv!1590 (array!5319) Bool)

(assert (=> b!156209 (= e!102151 (and tp!12536 tp_is_empty!3139 (array_inv!1589 (_keys!4897 thiss!1248)) (array_inv!1590 (_values!3105 thiss!1248)) e!102150))))

(declare-fun b!156210 () Bool)

(declare-fun res!73779 () Bool)

(assert (=> b!156210 (=> (not res!73779) (not e!102152))))

(assert (=> b!156210 (= res!73779 (and (= (size!2795 (_values!3105 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7567 thiss!1248))) (= (size!2794 (_keys!4897 thiss!1248)) (size!2795 (_values!3105 thiss!1248))) (bvsge (mask!7567 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2863 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2863 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2863 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2863 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2863 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2863 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2863 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156211 () Bool)

(assert (=> b!156211 (= e!102152 false)))

(declare-fun lt!81579 () Bool)

(declare-datatypes ((List!1832 0))(
  ( (Nil!1829) (Cons!1828 (h!2437 (_ BitVec 64)) (t!6626 List!1832)) )
))
(declare-fun arrayNoDuplicates!0 (array!5317 (_ BitVec 32) List!1832) Bool)

(assert (=> b!156211 (= lt!81579 (arrayNoDuplicates!0 (_keys!4897 thiss!1248) #b00000000000000000000000000000000 Nil!1829))))

(assert (= (and start!15674 res!73782) b!156206))

(assert (= (and b!156206 res!73783) b!156204))

(assert (= (and b!156204 res!73781) b!156210))

(assert (= (and b!156210 res!73779) b!156208))

(assert (= (and b!156208 res!73780) b!156211))

(assert (= (and b!156203 condMapEmpty!5351) mapIsEmpty!5351))

(assert (= (and b!156203 (not condMapEmpty!5351)) mapNonEmpty!5351))

(get-info :version)

(assert (= (and mapNonEmpty!5351 ((_ is ValueCellFull!1226) mapValue!5351)) b!156205))

(assert (= (and b!156203 ((_ is ValueCellFull!1226) mapDefault!5351)) b!156207))

(assert (= b!156209 b!156203))

(assert (= start!15674 b!156209))

(declare-fun m!190037 () Bool)

(assert (=> b!156204 m!190037))

(declare-fun m!190039 () Bool)

(assert (=> b!156211 m!190039))

(declare-fun m!190041 () Bool)

(assert (=> b!156209 m!190041))

(declare-fun m!190043 () Bool)

(assert (=> b!156209 m!190043))

(declare-fun m!190045 () Bool)

(assert (=> b!156208 m!190045))

(declare-fun m!190047 () Bool)

(assert (=> mapNonEmpty!5351 m!190047))

(declare-fun m!190049 () Bool)

(assert (=> start!15674 m!190049))

(check-sat (not b!156204) (not b_next!3337) b_and!9765 (not b!156209) (not b!156211) (not b!156208) tp_is_empty!3139 (not start!15674) (not mapNonEmpty!5351))
(check-sat b_and!9765 (not b_next!3337))
