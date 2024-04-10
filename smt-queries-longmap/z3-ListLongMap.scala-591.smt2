; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15690 () Bool)

(assert start!15690)

(declare-fun b!156431 () Bool)

(declare-fun b_free!3357 () Bool)

(declare-fun b_next!3357 () Bool)

(assert (=> b!156431 (= b_free!3357 (not b_next!3357))))

(declare-fun tp!12595 () Bool)

(declare-fun b_and!9771 () Bool)

(assert (=> b!156431 (= tp!12595 b_and!9771)))

(declare-fun b!156426 () Bool)

(declare-fun res!73909 () Bool)

(declare-fun e!102309 () Bool)

(assert (=> b!156426 (=> (not res!73909) (not e!102309))))

(declare-datatypes ((V!3859 0))(
  ( (V!3860 (val!1624 Int)) )
))
(declare-datatypes ((ValueCell!1236 0))(
  ( (ValueCellFull!1236 (v!3489 V!3859)) (EmptyCell!1236) )
))
(declare-datatypes ((array!5371 0))(
  ( (array!5372 (arr!2543 (Array (_ BitVec 32) (_ BitVec 64))) (size!2821 (_ BitVec 32))) )
))
(declare-datatypes ((array!5373 0))(
  ( (array!5374 (arr!2544 (Array (_ BitVec 32) ValueCell!1236)) (size!2822 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1380 0))(
  ( (LongMapFixedSize!1381 (defaultEntry!3132 Int) (mask!7583 (_ BitVec 32)) (extraKeys!2873 (_ BitVec 32)) (zeroValue!2975 V!3859) (minValue!2975 V!3859) (_size!739 (_ BitVec 32)) (_keys!4907 array!5371) (_values!3115 array!5373) (_vacant!739 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1380)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5371 (_ BitVec 32)) Bool)

(assert (=> b!156426 (= res!73909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4907 thiss!1248) (mask!7583 thiss!1248)))))

(declare-fun mapNonEmpty!5381 () Bool)

(declare-fun mapRes!5381 () Bool)

(declare-fun tp!12596 () Bool)

(declare-fun e!102306 () Bool)

(assert (=> mapNonEmpty!5381 (= mapRes!5381 (and tp!12596 e!102306))))

(declare-fun mapRest!5381 () (Array (_ BitVec 32) ValueCell!1236))

(declare-fun mapKey!5381 () (_ BitVec 32))

(declare-fun mapValue!5381 () ValueCell!1236)

(assert (=> mapNonEmpty!5381 (= (arr!2544 (_values!3115 thiss!1248)) (store mapRest!5381 mapKey!5381 mapValue!5381))))

(declare-fun b!156428 () Bool)

(assert (=> b!156428 (= e!102309 false)))

(declare-fun lt!81550 () Bool)

(declare-datatypes ((List!1855 0))(
  ( (Nil!1852) (Cons!1851 (h!2460 (_ BitVec 64)) (t!6657 List!1855)) )
))
(declare-fun arrayNoDuplicates!0 (array!5371 (_ BitVec 32) List!1855) Bool)

(assert (=> b!156428 (= lt!81550 (arrayNoDuplicates!0 (_keys!4907 thiss!1248) #b00000000000000000000000000000000 Nil!1852))))

(declare-fun b!156429 () Bool)

(declare-fun e!102307 () Bool)

(declare-fun tp_is_empty!3159 () Bool)

(assert (=> b!156429 (= e!102307 tp_is_empty!3159)))

(declare-fun b!156430 () Bool)

(assert (=> b!156430 (= e!102306 tp_is_empty!3159)))

(declare-fun e!102304 () Bool)

(declare-fun e!102305 () Bool)

(declare-fun array_inv!1607 (array!5371) Bool)

(declare-fun array_inv!1608 (array!5373) Bool)

(assert (=> b!156431 (= e!102305 (and tp!12595 tp_is_empty!3159 (array_inv!1607 (_keys!4907 thiss!1248)) (array_inv!1608 (_values!3115 thiss!1248)) e!102304))))

(declare-fun b!156432 () Bool)

(declare-fun res!73911 () Bool)

(assert (=> b!156432 (=> (not res!73911) (not e!102309))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156432 (= res!73911 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156433 () Bool)

(declare-fun res!73910 () Bool)

(assert (=> b!156433 (=> (not res!73910) (not e!102309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156433 (= res!73910 (validMask!0 (mask!7583 thiss!1248)))))

(declare-fun res!73908 () Bool)

(assert (=> start!15690 (=> (not res!73908) (not e!102309))))

(declare-fun valid!667 (LongMapFixedSize!1380) Bool)

(assert (=> start!15690 (= res!73908 (valid!667 thiss!1248))))

(assert (=> start!15690 e!102309))

(assert (=> start!15690 e!102305))

(assert (=> start!15690 true))

(declare-fun b!156427 () Bool)

(declare-fun res!73912 () Bool)

(assert (=> b!156427 (=> (not res!73912) (not e!102309))))

(assert (=> b!156427 (= res!73912 (and (= (size!2822 (_values!3115 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7583 thiss!1248))) (= (size!2821 (_keys!4907 thiss!1248)) (size!2822 (_values!3115 thiss!1248))) (bvsge (mask!7583 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2873 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2873 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2873 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2873 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2873 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2873 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2873 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156434 () Bool)

(assert (=> b!156434 (= e!102304 (and e!102307 mapRes!5381))))

(declare-fun condMapEmpty!5381 () Bool)

(declare-fun mapDefault!5381 () ValueCell!1236)

(assert (=> b!156434 (= condMapEmpty!5381 (= (arr!2544 (_values!3115 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1236)) mapDefault!5381)))))

(declare-fun mapIsEmpty!5381 () Bool)

(assert (=> mapIsEmpty!5381 mapRes!5381))

(assert (= (and start!15690 res!73908) b!156432))

(assert (= (and b!156432 res!73911) b!156433))

(assert (= (and b!156433 res!73910) b!156427))

(assert (= (and b!156427 res!73912) b!156426))

(assert (= (and b!156426 res!73909) b!156428))

(assert (= (and b!156434 condMapEmpty!5381) mapIsEmpty!5381))

(assert (= (and b!156434 (not condMapEmpty!5381)) mapNonEmpty!5381))

(get-info :version)

(assert (= (and mapNonEmpty!5381 ((_ is ValueCellFull!1236) mapValue!5381)) b!156430))

(assert (= (and b!156434 ((_ is ValueCellFull!1236) mapDefault!5381)) b!156429))

(assert (= b!156431 b!156434))

(assert (= start!15690 b!156431))

(declare-fun m!189995 () Bool)

(assert (=> b!156433 m!189995))

(declare-fun m!189997 () Bool)

(assert (=> mapNonEmpty!5381 m!189997))

(declare-fun m!189999 () Bool)

(assert (=> b!156428 m!189999))

(declare-fun m!190001 () Bool)

(assert (=> start!15690 m!190001))

(declare-fun m!190003 () Bool)

(assert (=> b!156431 m!190003))

(declare-fun m!190005 () Bool)

(assert (=> b!156431 m!190005))

(declare-fun m!190007 () Bool)

(assert (=> b!156426 m!190007))

(check-sat (not b_next!3357) b_and!9771 (not mapNonEmpty!5381) tp_is_empty!3159 (not b!156426) (not b!156428) (not b!156433) (not start!15690) (not b!156431))
(check-sat b_and!9771 (not b_next!3357))
