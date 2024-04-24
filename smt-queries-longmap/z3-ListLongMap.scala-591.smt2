; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15692 () Bool)

(assert start!15692)

(declare-fun b!156451 () Bool)

(declare-fun b_free!3355 () Bool)

(declare-fun b_next!3355 () Bool)

(assert (=> b!156451 (= b_free!3355 (not b_next!3355))))

(declare-fun tp!12590 () Bool)

(declare-fun b_and!9783 () Bool)

(assert (=> b!156451 (= tp!12590 b_and!9783)))

(declare-fun b!156446 () Bool)

(declare-fun e!102314 () Bool)

(declare-fun e!102313 () Bool)

(declare-fun mapRes!5378 () Bool)

(assert (=> b!156446 (= e!102314 (and e!102313 mapRes!5378))))

(declare-fun condMapEmpty!5378 () Bool)

(declare-datatypes ((V!3857 0))(
  ( (V!3858 (val!1623 Int)) )
))
(declare-datatypes ((ValueCell!1235 0))(
  ( (ValueCellFull!1235 (v!3489 V!3857)) (EmptyCell!1235) )
))
(declare-datatypes ((array!5353 0))(
  ( (array!5354 (arr!2534 (Array (_ BitVec 32) (_ BitVec 64))) (size!2812 (_ BitVec 32))) )
))
(declare-datatypes ((array!5355 0))(
  ( (array!5356 (arr!2535 (Array (_ BitVec 32) ValueCell!1235)) (size!2813 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1378 0))(
  ( (LongMapFixedSize!1379 (defaultEntry!3131 Int) (mask!7582 (_ BitVec 32)) (extraKeys!2872 (_ BitVec 32)) (zeroValue!2974 V!3857) (minValue!2974 V!3857) (_size!738 (_ BitVec 32)) (_keys!4906 array!5353) (_values!3114 array!5355) (_vacant!738 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1378)

(declare-fun mapDefault!5378 () ValueCell!1235)

(assert (=> b!156446 (= condMapEmpty!5378 (= (arr!2535 (_values!3114 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1235)) mapDefault!5378)))))

(declare-fun res!73918 () Bool)

(declare-fun e!102315 () Bool)

(assert (=> start!15692 (=> (not res!73918) (not e!102315))))

(declare-fun valid!682 (LongMapFixedSize!1378) Bool)

(assert (=> start!15692 (= res!73918 (valid!682 thiss!1248))))

(assert (=> start!15692 e!102315))

(declare-fun e!102310 () Bool)

(assert (=> start!15692 e!102310))

(assert (=> start!15692 true))

(declare-fun b!156447 () Bool)

(declare-fun tp_is_empty!3157 () Bool)

(assert (=> b!156447 (= e!102313 tp_is_empty!3157)))

(declare-fun b!156448 () Bool)

(declare-fun res!73914 () Bool)

(assert (=> b!156448 (=> (not res!73914) (not e!102315))))

(assert (=> b!156448 (= res!73914 (and (= (size!2813 (_values!3114 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7582 thiss!1248))) (= (size!2812 (_keys!4906 thiss!1248)) (size!2813 (_values!3114 thiss!1248))) (bvsge (mask!7582 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2872 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2872 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2872 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2872 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2872 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2872 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2872 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156449 () Bool)

(declare-fun res!73916 () Bool)

(assert (=> b!156449 (=> (not res!73916) (not e!102315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5353 (_ BitVec 32)) Bool)

(assert (=> b!156449 (= res!73916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4906 thiss!1248) (mask!7582 thiss!1248)))))

(declare-fun b!156450 () Bool)

(assert (=> b!156450 (= e!102315 false)))

(declare-fun lt!81606 () Bool)

(declare-datatypes ((List!1839 0))(
  ( (Nil!1836) (Cons!1835 (h!2444 (_ BitVec 64)) (t!6633 List!1839)) )
))
(declare-fun arrayNoDuplicates!0 (array!5353 (_ BitVec 32) List!1839) Bool)

(assert (=> b!156450 (= lt!81606 (arrayNoDuplicates!0 (_keys!4906 thiss!1248) #b00000000000000000000000000000000 Nil!1836))))

(declare-fun array_inv!1605 (array!5353) Bool)

(declare-fun array_inv!1606 (array!5355) Bool)

(assert (=> b!156451 (= e!102310 (and tp!12590 tp_is_empty!3157 (array_inv!1605 (_keys!4906 thiss!1248)) (array_inv!1606 (_values!3114 thiss!1248)) e!102314))))

(declare-fun b!156452 () Bool)

(declare-fun res!73915 () Bool)

(assert (=> b!156452 (=> (not res!73915) (not e!102315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156452 (= res!73915 (validMask!0 (mask!7582 thiss!1248)))))

(declare-fun mapNonEmpty!5378 () Bool)

(declare-fun tp!12589 () Bool)

(declare-fun e!102312 () Bool)

(assert (=> mapNonEmpty!5378 (= mapRes!5378 (and tp!12589 e!102312))))

(declare-fun mapValue!5378 () ValueCell!1235)

(declare-fun mapRest!5378 () (Array (_ BitVec 32) ValueCell!1235))

(declare-fun mapKey!5378 () (_ BitVec 32))

(assert (=> mapNonEmpty!5378 (= (arr!2535 (_values!3114 thiss!1248)) (store mapRest!5378 mapKey!5378 mapValue!5378))))

(declare-fun b!156453 () Bool)

(declare-fun res!73917 () Bool)

(assert (=> b!156453 (=> (not res!73917) (not e!102315))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156453 (= res!73917 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5378 () Bool)

(assert (=> mapIsEmpty!5378 mapRes!5378))

(declare-fun b!156454 () Bool)

(assert (=> b!156454 (= e!102312 tp_is_empty!3157)))

(assert (= (and start!15692 res!73918) b!156453))

(assert (= (and b!156453 res!73917) b!156452))

(assert (= (and b!156452 res!73915) b!156448))

(assert (= (and b!156448 res!73914) b!156449))

(assert (= (and b!156449 res!73916) b!156450))

(assert (= (and b!156446 condMapEmpty!5378) mapIsEmpty!5378))

(assert (= (and b!156446 (not condMapEmpty!5378)) mapNonEmpty!5378))

(get-info :version)

(assert (= (and mapNonEmpty!5378 ((_ is ValueCellFull!1235) mapValue!5378)) b!156454))

(assert (= (and b!156446 ((_ is ValueCellFull!1235) mapDefault!5378)) b!156447))

(assert (= b!156451 b!156446))

(assert (= start!15692 b!156451))

(declare-fun m!190163 () Bool)

(assert (=> b!156451 m!190163))

(declare-fun m!190165 () Bool)

(assert (=> b!156451 m!190165))

(declare-fun m!190167 () Bool)

(assert (=> b!156449 m!190167))

(declare-fun m!190169 () Bool)

(assert (=> b!156452 m!190169))

(declare-fun m!190171 () Bool)

(assert (=> start!15692 m!190171))

(declare-fun m!190173 () Bool)

(assert (=> mapNonEmpty!5378 m!190173))

(declare-fun m!190175 () Bool)

(assert (=> b!156450 m!190175))

(check-sat (not b!156451) (not b!156450) (not mapNonEmpty!5378) (not start!15692) (not b_next!3355) b_and!9783 (not b!156449) tp_is_empty!3157 (not b!156452))
(check-sat b_and!9783 (not b_next!3355))
