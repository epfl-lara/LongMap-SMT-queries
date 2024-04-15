; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15716 () Bool)

(assert start!15716)

(declare-fun b!156578 () Bool)

(declare-fun b_free!3379 () Bool)

(declare-fun b_next!3379 () Bool)

(assert (=> b!156578 (= b_free!3379 (not b_next!3379))))

(declare-fun tp!12661 () Bool)

(declare-fun b_and!9767 () Bool)

(assert (=> b!156578 (= tp!12661 b_and!9767)))

(declare-fun mapNonEmpty!5414 () Bool)

(declare-fun mapRes!5414 () Bool)

(declare-fun tp!12662 () Bool)

(declare-fun e!102403 () Bool)

(assert (=> mapNonEmpty!5414 (= mapRes!5414 (and tp!12662 e!102403))))

(declare-datatypes ((V!3889 0))(
  ( (V!3890 (val!1635 Int)) )
))
(declare-datatypes ((ValueCell!1247 0))(
  ( (ValueCellFull!1247 (v!3494 V!3889)) (EmptyCell!1247) )
))
(declare-fun mapValue!5414 () ValueCell!1247)

(declare-fun mapRest!5414 () (Array (_ BitVec 32) ValueCell!1247))

(declare-fun mapKey!5414 () (_ BitVec 32))

(declare-datatypes ((array!5395 0))(
  ( (array!5396 (arr!2554 (Array (_ BitVec 32) (_ BitVec 64))) (size!2833 (_ BitVec 32))) )
))
(declare-datatypes ((array!5397 0))(
  ( (array!5398 (arr!2555 (Array (_ BitVec 32) ValueCell!1247)) (size!2834 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1402 0))(
  ( (LongMapFixedSize!1403 (defaultEntry!3143 Int) (mask!7601 (_ BitVec 32)) (extraKeys!2884 (_ BitVec 32)) (zeroValue!2986 V!3889) (minValue!2986 V!3889) (_size!750 (_ BitVec 32)) (_keys!4917 array!5395) (_values!3126 array!5397) (_vacant!750 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1402)

(assert (=> mapNonEmpty!5414 (= (arr!2555 (_values!3126 thiss!1248)) (store mapRest!5414 mapKey!5414 mapValue!5414))))

(declare-fun res!73978 () Bool)

(declare-fun e!102402 () Bool)

(assert (=> start!15716 (=> (not res!73978) (not e!102402))))

(declare-fun valid!678 (LongMapFixedSize!1402) Bool)

(assert (=> start!15716 (= res!73978 (valid!678 thiss!1248))))

(assert (=> start!15716 e!102402))

(declare-fun e!102401 () Bool)

(assert (=> start!15716 e!102401))

(assert (=> start!15716 true))

(declare-fun mapIsEmpty!5414 () Bool)

(assert (=> mapIsEmpty!5414 mapRes!5414))

(declare-fun b!156576 () Bool)

(declare-fun e!102405 () Bool)

(declare-fun e!102406 () Bool)

(assert (=> b!156576 (= e!102405 (and e!102406 mapRes!5414))))

(declare-fun condMapEmpty!5414 () Bool)

(declare-fun mapDefault!5414 () ValueCell!1247)

(assert (=> b!156576 (= condMapEmpty!5414 (= (arr!2555 (_values!3126 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1247)) mapDefault!5414)))))

(declare-fun b!156577 () Bool)

(declare-fun res!73981 () Bool)

(assert (=> b!156577 (=> (not res!73981) (not e!102402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5395 (_ BitVec 32)) Bool)

(assert (=> b!156577 (= res!73981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4917 thiss!1248) (mask!7601 thiss!1248)))))

(declare-fun tp_is_empty!3181 () Bool)

(declare-fun array_inv!1647 (array!5395) Bool)

(declare-fun array_inv!1648 (array!5397) Bool)

(assert (=> b!156578 (= e!102401 (and tp!12661 tp_is_empty!3181 (array_inv!1647 (_keys!4917 thiss!1248)) (array_inv!1648 (_values!3126 thiss!1248)) e!102405))))

(declare-fun b!156579 () Bool)

(assert (=> b!156579 (= e!102406 tp_is_empty!3181)))

(declare-fun b!156580 () Bool)

(declare-fun res!73982 () Bool)

(assert (=> b!156580 (=> (not res!73982) (not e!102402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156580 (= res!73982 (validMask!0 (mask!7601 thiss!1248)))))

(declare-fun b!156581 () Bool)

(declare-fun res!73980 () Bool)

(assert (=> b!156581 (=> (not res!73980) (not e!102402))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156581 (= res!73980 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156582 () Bool)

(declare-fun res!73979 () Bool)

(assert (=> b!156582 (=> (not res!73979) (not e!102402))))

(assert (=> b!156582 (= res!73979 (and (= (size!2834 (_values!3126 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7601 thiss!1248))) (= (size!2833 (_keys!4917 thiss!1248)) (size!2834 (_values!3126 thiss!1248))) (bvsge (mask!7601 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2884 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2884 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2884 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2884 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2884 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2884 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2884 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156583 () Bool)

(assert (=> b!156583 (= e!102403 tp_is_empty!3181)))

(declare-fun b!156584 () Bool)

(assert (=> b!156584 (= e!102402 false)))

(declare-fun lt!81402 () Bool)

(declare-datatypes ((List!1861 0))(
  ( (Nil!1858) (Cons!1857 (h!2466 (_ BitVec 64)) (t!6654 List!1861)) )
))
(declare-fun arrayNoDuplicates!0 (array!5395 (_ BitVec 32) List!1861) Bool)

(assert (=> b!156584 (= lt!81402 (arrayNoDuplicates!0 (_keys!4917 thiss!1248) #b00000000000000000000000000000000 Nil!1858))))

(assert (= (and start!15716 res!73978) b!156581))

(assert (= (and b!156581 res!73980) b!156580))

(assert (= (and b!156580 res!73982) b!156582))

(assert (= (and b!156582 res!73979) b!156577))

(assert (= (and b!156577 res!73981) b!156584))

(assert (= (and b!156576 condMapEmpty!5414) mapIsEmpty!5414))

(assert (= (and b!156576 (not condMapEmpty!5414)) mapNonEmpty!5414))

(get-info :version)

(assert (= (and mapNonEmpty!5414 ((_ is ValueCellFull!1247) mapValue!5414)) b!156583))

(assert (= (and b!156576 ((_ is ValueCellFull!1247) mapDefault!5414)) b!156579))

(assert (= b!156578 b!156576))

(assert (= start!15716 b!156578))

(declare-fun m!189529 () Bool)

(assert (=> b!156578 m!189529))

(declare-fun m!189531 () Bool)

(assert (=> b!156578 m!189531))

(declare-fun m!189533 () Bool)

(assert (=> b!156584 m!189533))

(declare-fun m!189535 () Bool)

(assert (=> mapNonEmpty!5414 m!189535))

(declare-fun m!189537 () Bool)

(assert (=> b!156577 m!189537))

(declare-fun m!189539 () Bool)

(assert (=> start!15716 m!189539))

(declare-fun m!189541 () Bool)

(assert (=> b!156580 m!189541))

(check-sat b_and!9767 tp_is_empty!3181 (not mapNonEmpty!5414) (not b!156580) (not b!156584) (not b!156578) (not b_next!3379) (not start!15716) (not b!156577))
(check-sat b_and!9767 (not b_next!3379))
