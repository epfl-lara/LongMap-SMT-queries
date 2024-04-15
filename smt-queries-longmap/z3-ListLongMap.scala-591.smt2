; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15692 () Bool)

(assert start!15692)

(declare-fun b!156252 () Bool)

(declare-fun b_free!3355 () Bool)

(declare-fun b_next!3355 () Bool)

(assert (=> b!156252 (= b_free!3355 (not b_next!3355))))

(declare-fun tp!12589 () Bool)

(declare-fun b_and!9743 () Bool)

(assert (=> b!156252 (= tp!12589 b_and!9743)))

(declare-fun e!102189 () Bool)

(declare-fun e!102186 () Bool)

(declare-datatypes ((V!3857 0))(
  ( (V!3858 (val!1623 Int)) )
))
(declare-datatypes ((ValueCell!1235 0))(
  ( (ValueCellFull!1235 (v!3482 V!3857)) (EmptyCell!1235) )
))
(declare-datatypes ((array!5347 0))(
  ( (array!5348 (arr!2530 (Array (_ BitVec 32) (_ BitVec 64))) (size!2809 (_ BitVec 32))) )
))
(declare-datatypes ((array!5349 0))(
  ( (array!5350 (arr!2531 (Array (_ BitVec 32) ValueCell!1235)) (size!2810 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1378 0))(
  ( (LongMapFixedSize!1379 (defaultEntry!3131 Int) (mask!7581 (_ BitVec 32)) (extraKeys!2872 (_ BitVec 32)) (zeroValue!2974 V!3857) (minValue!2974 V!3857) (_size!738 (_ BitVec 32)) (_keys!4905 array!5347) (_values!3114 array!5349) (_vacant!738 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1378)

(declare-fun tp_is_empty!3157 () Bool)

(declare-fun array_inv!1631 (array!5347) Bool)

(declare-fun array_inv!1632 (array!5349) Bool)

(assert (=> b!156252 (= e!102189 (and tp!12589 tp_is_empty!3157 (array_inv!1631 (_keys!4905 thiss!1248)) (array_inv!1632 (_values!3114 thiss!1248)) e!102186))))

(declare-fun b!156253 () Bool)

(declare-fun e!102188 () Bool)

(declare-fun mapRes!5378 () Bool)

(assert (=> b!156253 (= e!102186 (and e!102188 mapRes!5378))))

(declare-fun condMapEmpty!5378 () Bool)

(declare-fun mapDefault!5378 () ValueCell!1235)

(assert (=> b!156253 (= condMapEmpty!5378 (= (arr!2531 (_values!3114 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1235)) mapDefault!5378)))))

(declare-fun b!156254 () Bool)

(declare-fun res!73801 () Bool)

(declare-fun e!102185 () Bool)

(assert (=> b!156254 (=> (not res!73801) (not e!102185))))

(assert (=> b!156254 (= res!73801 (and (= (size!2810 (_values!3114 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7581 thiss!1248))) (= (size!2809 (_keys!4905 thiss!1248)) (size!2810 (_values!3114 thiss!1248))) (bvsge (mask!7581 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2872 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2872 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2872 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2872 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2872 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2872 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2872 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156255 () Bool)

(declare-fun res!73799 () Bool)

(assert (=> b!156255 (=> (not res!73799) (not e!102185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5347 (_ BitVec 32)) Bool)

(assert (=> b!156255 (= res!73799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4905 thiss!1248) (mask!7581 thiss!1248)))))

(declare-fun b!156256 () Bool)

(declare-fun res!73798 () Bool)

(assert (=> b!156256 (=> (not res!73798) (not e!102185))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156256 (= res!73798 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5378 () Bool)

(declare-fun tp!12590 () Bool)

(declare-fun e!102190 () Bool)

(assert (=> mapNonEmpty!5378 (= mapRes!5378 (and tp!12590 e!102190))))

(declare-fun mapValue!5378 () ValueCell!1235)

(declare-fun mapKey!5378 () (_ BitVec 32))

(declare-fun mapRest!5378 () (Array (_ BitVec 32) ValueCell!1235))

(assert (=> mapNonEmpty!5378 (= (arr!2531 (_values!3114 thiss!1248)) (store mapRest!5378 mapKey!5378 mapValue!5378))))

(declare-fun b!156257 () Bool)

(declare-fun res!73802 () Bool)

(assert (=> b!156257 (=> (not res!73802) (not e!102185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156257 (= res!73802 (validMask!0 (mask!7581 thiss!1248)))))

(declare-fun res!73800 () Bool)

(assert (=> start!15692 (=> (not res!73800) (not e!102185))))

(declare-fun valid!670 (LongMapFixedSize!1378) Bool)

(assert (=> start!15692 (= res!73800 (valid!670 thiss!1248))))

(assert (=> start!15692 e!102185))

(assert (=> start!15692 e!102189))

(assert (=> start!15692 true))

(declare-fun b!156258 () Bool)

(assert (=> b!156258 (= e!102190 tp_is_empty!3157)))

(declare-fun b!156259 () Bool)

(assert (=> b!156259 (= e!102185 false)))

(declare-fun lt!81366 () Bool)

(declare-datatypes ((List!1852 0))(
  ( (Nil!1849) (Cons!1848 (h!2457 (_ BitVec 64)) (t!6645 List!1852)) )
))
(declare-fun arrayNoDuplicates!0 (array!5347 (_ BitVec 32) List!1852) Bool)

(assert (=> b!156259 (= lt!81366 (arrayNoDuplicates!0 (_keys!4905 thiss!1248) #b00000000000000000000000000000000 Nil!1849))))

(declare-fun b!156260 () Bool)

(assert (=> b!156260 (= e!102188 tp_is_empty!3157)))

(declare-fun mapIsEmpty!5378 () Bool)

(assert (=> mapIsEmpty!5378 mapRes!5378))

(assert (= (and start!15692 res!73800) b!156256))

(assert (= (and b!156256 res!73798) b!156257))

(assert (= (and b!156257 res!73802) b!156254))

(assert (= (and b!156254 res!73801) b!156255))

(assert (= (and b!156255 res!73799) b!156259))

(assert (= (and b!156253 condMapEmpty!5378) mapIsEmpty!5378))

(assert (= (and b!156253 (not condMapEmpty!5378)) mapNonEmpty!5378))

(get-info :version)

(assert (= (and mapNonEmpty!5378 ((_ is ValueCellFull!1235) mapValue!5378)) b!156258))

(assert (= (and b!156253 ((_ is ValueCellFull!1235) mapDefault!5378)) b!156260))

(assert (= b!156252 b!156253))

(assert (= start!15692 b!156252))

(declare-fun m!189361 () Bool)

(assert (=> mapNonEmpty!5378 m!189361))

(declare-fun m!189363 () Bool)

(assert (=> b!156257 m!189363))

(declare-fun m!189365 () Bool)

(assert (=> b!156259 m!189365))

(declare-fun m!189367 () Bool)

(assert (=> b!156255 m!189367))

(declare-fun m!189369 () Bool)

(assert (=> b!156252 m!189369))

(declare-fun m!189371 () Bool)

(assert (=> b!156252 m!189371))

(declare-fun m!189373 () Bool)

(assert (=> start!15692 m!189373))

(check-sat (not start!15692) (not mapNonEmpty!5378) (not b!156255) (not b!156252) b_and!9743 (not b!156257) (not b!156259) tp_is_empty!3157 (not b_next!3355))
(check-sat b_and!9743 (not b_next!3355))
