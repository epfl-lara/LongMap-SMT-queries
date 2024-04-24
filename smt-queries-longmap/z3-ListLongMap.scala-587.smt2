; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15668 () Bool)

(assert start!15668)

(declare-fun b!156125 () Bool)

(declare-fun b_free!3331 () Bool)

(declare-fun b_next!3331 () Bool)

(assert (=> b!156125 (= b_free!3331 (not b_next!3331))))

(declare-fun tp!12517 () Bool)

(declare-fun b_and!9759 () Bool)

(assert (=> b!156125 (= tp!12517 b_and!9759)))

(declare-fun res!73736 () Bool)

(declare-fun e!102097 () Bool)

(assert (=> start!15668 (=> (not res!73736) (not e!102097))))

(declare-datatypes ((V!3825 0))(
  ( (V!3826 (val!1611 Int)) )
))
(declare-datatypes ((ValueCell!1223 0))(
  ( (ValueCellFull!1223 (v!3477 V!3825)) (EmptyCell!1223) )
))
(declare-datatypes ((array!5305 0))(
  ( (array!5306 (arr!2510 (Array (_ BitVec 32) (_ BitVec 64))) (size!2788 (_ BitVec 32))) )
))
(declare-datatypes ((array!5307 0))(
  ( (array!5308 (arr!2511 (Array (_ BitVec 32) ValueCell!1223)) (size!2789 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1354 0))(
  ( (LongMapFixedSize!1355 (defaultEntry!3119 Int) (mask!7562 (_ BitVec 32)) (extraKeys!2860 (_ BitVec 32)) (zeroValue!2962 V!3825) (minValue!2962 V!3825) (_size!726 (_ BitVec 32)) (_keys!4894 array!5305) (_values!3102 array!5307) (_vacant!726 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1354)

(declare-fun valid!674 (LongMapFixedSize!1354) Bool)

(assert (=> start!15668 (= res!73736 (valid!674 thiss!1248))))

(assert (=> start!15668 e!102097))

(declare-fun e!102098 () Bool)

(assert (=> start!15668 e!102098))

(assert (=> start!15668 true))

(declare-fun b!156122 () Bool)

(declare-fun e!102099 () Bool)

(declare-fun tp_is_empty!3133 () Bool)

(assert (=> b!156122 (= e!102099 tp_is_empty!3133)))

(declare-fun b!156123 () Bool)

(declare-fun e!102095 () Bool)

(assert (=> b!156123 (= e!102095 tp_is_empty!3133)))

(declare-fun b!156124 () Bool)

(declare-fun res!73737 () Bool)

(assert (=> b!156124 (=> (not res!73737) (not e!102097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156124 (= res!73737 (validMask!0 (mask!7562 thiss!1248)))))

(declare-fun e!102094 () Bool)

(declare-fun array_inv!1585 (array!5305) Bool)

(declare-fun array_inv!1586 (array!5307) Bool)

(assert (=> b!156125 (= e!102098 (and tp!12517 tp_is_empty!3133 (array_inv!1585 (_keys!4894 thiss!1248)) (array_inv!1586 (_values!3102 thiss!1248)) e!102094))))

(declare-fun b!156126 () Bool)

(declare-fun res!73735 () Bool)

(assert (=> b!156126 (=> (not res!73735) (not e!102097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5305 (_ BitVec 32)) Bool)

(assert (=> b!156126 (= res!73735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4894 thiss!1248) (mask!7562 thiss!1248)))))

(declare-fun mapIsEmpty!5342 () Bool)

(declare-fun mapRes!5342 () Bool)

(assert (=> mapIsEmpty!5342 mapRes!5342))

(declare-fun mapNonEmpty!5342 () Bool)

(declare-fun tp!12518 () Bool)

(assert (=> mapNonEmpty!5342 (= mapRes!5342 (and tp!12518 e!102095))))

(declare-fun mapRest!5342 () (Array (_ BitVec 32) ValueCell!1223))

(declare-fun mapValue!5342 () ValueCell!1223)

(declare-fun mapKey!5342 () (_ BitVec 32))

(assert (=> mapNonEmpty!5342 (= (arr!2511 (_values!3102 thiss!1248)) (store mapRest!5342 mapKey!5342 mapValue!5342))))

(declare-fun b!156127 () Bool)

(assert (=> b!156127 (= e!102097 false)))

(declare-fun lt!81570 () Bool)

(declare-datatypes ((List!1831 0))(
  ( (Nil!1828) (Cons!1827 (h!2436 (_ BitVec 64)) (t!6625 List!1831)) )
))
(declare-fun arrayNoDuplicates!0 (array!5305 (_ BitVec 32) List!1831) Bool)

(assert (=> b!156127 (= lt!81570 (arrayNoDuplicates!0 (_keys!4894 thiss!1248) #b00000000000000000000000000000000 Nil!1828))))

(declare-fun b!156128 () Bool)

(assert (=> b!156128 (= e!102094 (and e!102099 mapRes!5342))))

(declare-fun condMapEmpty!5342 () Bool)

(declare-fun mapDefault!5342 () ValueCell!1223)

(assert (=> b!156128 (= condMapEmpty!5342 (= (arr!2511 (_values!3102 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1223)) mapDefault!5342)))))

(declare-fun b!156129 () Bool)

(declare-fun res!73734 () Bool)

(assert (=> b!156129 (=> (not res!73734) (not e!102097))))

(assert (=> b!156129 (= res!73734 (and (= (size!2789 (_values!3102 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7562 thiss!1248))) (= (size!2788 (_keys!4894 thiss!1248)) (size!2789 (_values!3102 thiss!1248))) (bvsge (mask!7562 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2860 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2860 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2860 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2860 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156130 () Bool)

(declare-fun res!73738 () Bool)

(assert (=> b!156130 (=> (not res!73738) (not e!102097))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156130 (= res!73738 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!15668 res!73736) b!156130))

(assert (= (and b!156130 res!73738) b!156124))

(assert (= (and b!156124 res!73737) b!156129))

(assert (= (and b!156129 res!73734) b!156126))

(assert (= (and b!156126 res!73735) b!156127))

(assert (= (and b!156128 condMapEmpty!5342) mapIsEmpty!5342))

(assert (= (and b!156128 (not condMapEmpty!5342)) mapNonEmpty!5342))

(get-info :version)

(assert (= (and mapNonEmpty!5342 ((_ is ValueCellFull!1223) mapValue!5342)) b!156123))

(assert (= (and b!156128 ((_ is ValueCellFull!1223) mapDefault!5342)) b!156122))

(assert (= b!156125 b!156128))

(assert (= start!15668 b!156125))

(declare-fun m!189995 () Bool)

(assert (=> b!156124 m!189995))

(declare-fun m!189997 () Bool)

(assert (=> start!15668 m!189997))

(declare-fun m!189999 () Bool)

(assert (=> mapNonEmpty!5342 m!189999))

(declare-fun m!190001 () Bool)

(assert (=> b!156127 m!190001))

(declare-fun m!190003 () Bool)

(assert (=> b!156126 m!190003))

(declare-fun m!190005 () Bool)

(assert (=> b!156125 m!190005))

(declare-fun m!190007 () Bool)

(assert (=> b!156125 m!190007))

(check-sat (not b!156125) (not mapNonEmpty!5342) b_and!9759 (not b_next!3331) (not start!15668) (not b!156126) (not b!156127) tp_is_empty!3133 (not b!156124))
(check-sat b_and!9759 (not b_next!3331))
