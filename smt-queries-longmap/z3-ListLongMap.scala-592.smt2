; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15696 () Bool)

(assert start!15696)

(declare-fun b!156511 () Bool)

(declare-fun b_free!3363 () Bool)

(declare-fun b_next!3363 () Bool)

(assert (=> b!156511 (= b_free!3363 (not b_next!3363))))

(declare-fun tp!12614 () Bool)

(declare-fun b_and!9777 () Bool)

(assert (=> b!156511 (= tp!12614 b_and!9777)))

(declare-fun b!156508 () Bool)

(declare-fun res!73954 () Bool)

(declare-fun e!102358 () Bool)

(assert (=> b!156508 (=> (not res!73954) (not e!102358))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156508 (= res!73954 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156509 () Bool)

(declare-fun e!102361 () Bool)

(declare-fun e!102362 () Bool)

(declare-fun mapRes!5390 () Bool)

(assert (=> b!156509 (= e!102361 (and e!102362 mapRes!5390))))

(declare-fun condMapEmpty!5390 () Bool)

(declare-datatypes ((V!3867 0))(
  ( (V!3868 (val!1627 Int)) )
))
(declare-datatypes ((ValueCell!1239 0))(
  ( (ValueCellFull!1239 (v!3492 V!3867)) (EmptyCell!1239) )
))
(declare-datatypes ((array!5383 0))(
  ( (array!5384 (arr!2549 (Array (_ BitVec 32) (_ BitVec 64))) (size!2827 (_ BitVec 32))) )
))
(declare-datatypes ((array!5385 0))(
  ( (array!5386 (arr!2550 (Array (_ BitVec 32) ValueCell!1239)) (size!2828 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1386 0))(
  ( (LongMapFixedSize!1387 (defaultEntry!3135 Int) (mask!7588 (_ BitVec 32)) (extraKeys!2876 (_ BitVec 32)) (zeroValue!2978 V!3867) (minValue!2978 V!3867) (_size!742 (_ BitVec 32)) (_keys!4910 array!5383) (_values!3118 array!5385) (_vacant!742 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1386)

(declare-fun mapDefault!5390 () ValueCell!1239)

(assert (=> b!156509 (= condMapEmpty!5390 (= (arr!2550 (_values!3118 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1239)) mapDefault!5390)))))

(declare-fun b!156510 () Bool)

(declare-fun res!73956 () Bool)

(assert (=> b!156510 (=> (not res!73956) (not e!102358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156510 (= res!73956 (validMask!0 (mask!7588 thiss!1248)))))

(declare-fun mapNonEmpty!5390 () Bool)

(declare-fun tp!12613 () Bool)

(declare-fun e!102363 () Bool)

(assert (=> mapNonEmpty!5390 (= mapRes!5390 (and tp!12613 e!102363))))

(declare-fun mapKey!5390 () (_ BitVec 32))

(declare-fun mapValue!5390 () ValueCell!1239)

(declare-fun mapRest!5390 () (Array (_ BitVec 32) ValueCell!1239))

(assert (=> mapNonEmpty!5390 (= (arr!2550 (_values!3118 thiss!1248)) (store mapRest!5390 mapKey!5390 mapValue!5390))))

(declare-fun mapIsEmpty!5390 () Bool)

(assert (=> mapIsEmpty!5390 mapRes!5390))

(declare-fun e!102360 () Bool)

(declare-fun tp_is_empty!3165 () Bool)

(declare-fun array_inv!1609 (array!5383) Bool)

(declare-fun array_inv!1610 (array!5385) Bool)

(assert (=> b!156511 (= e!102360 (and tp!12614 tp_is_empty!3165 (array_inv!1609 (_keys!4910 thiss!1248)) (array_inv!1610 (_values!3118 thiss!1248)) e!102361))))

(declare-fun b!156512 () Bool)

(declare-fun res!73953 () Bool)

(assert (=> b!156512 (=> (not res!73953) (not e!102358))))

(assert (=> b!156512 (= res!73953 (and (= (size!2828 (_values!3118 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7588 thiss!1248))) (= (size!2827 (_keys!4910 thiss!1248)) (size!2828 (_values!3118 thiss!1248))) (bvsge (mask!7588 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2876 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2876 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2876 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2876 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2876 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2876 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2876 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156507 () Bool)

(assert (=> b!156507 (= e!102362 tp_is_empty!3165)))

(declare-fun res!73957 () Bool)

(assert (=> start!15696 (=> (not res!73957) (not e!102358))))

(declare-fun valid!669 (LongMapFixedSize!1386) Bool)

(assert (=> start!15696 (= res!73957 (valid!669 thiss!1248))))

(assert (=> start!15696 e!102358))

(assert (=> start!15696 e!102360))

(assert (=> start!15696 true))

(declare-fun b!156513 () Bool)

(assert (=> b!156513 (= e!102358 false)))

(declare-fun lt!81559 () Bool)

(declare-datatypes ((List!1857 0))(
  ( (Nil!1854) (Cons!1853 (h!2462 (_ BitVec 64)) (t!6659 List!1857)) )
))
(declare-fun arrayNoDuplicates!0 (array!5383 (_ BitVec 32) List!1857) Bool)

(assert (=> b!156513 (= lt!81559 (arrayNoDuplicates!0 (_keys!4910 thiss!1248) #b00000000000000000000000000000000 Nil!1854))))

(declare-fun b!156514 () Bool)

(assert (=> b!156514 (= e!102363 tp_is_empty!3165)))

(declare-fun b!156515 () Bool)

(declare-fun res!73955 () Bool)

(assert (=> b!156515 (=> (not res!73955) (not e!102358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5383 (_ BitVec 32)) Bool)

(assert (=> b!156515 (= res!73955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4910 thiss!1248) (mask!7588 thiss!1248)))))

(assert (= (and start!15696 res!73957) b!156508))

(assert (= (and b!156508 res!73954) b!156510))

(assert (= (and b!156510 res!73956) b!156512))

(assert (= (and b!156512 res!73953) b!156515))

(assert (= (and b!156515 res!73955) b!156513))

(assert (= (and b!156509 condMapEmpty!5390) mapIsEmpty!5390))

(assert (= (and b!156509 (not condMapEmpty!5390)) mapNonEmpty!5390))

(get-info :version)

(assert (= (and mapNonEmpty!5390 ((_ is ValueCellFull!1239) mapValue!5390)) b!156514))

(assert (= (and b!156509 ((_ is ValueCellFull!1239) mapDefault!5390)) b!156507))

(assert (= b!156511 b!156509))

(assert (= start!15696 b!156511))

(declare-fun m!190037 () Bool)

(assert (=> b!156511 m!190037))

(declare-fun m!190039 () Bool)

(assert (=> b!156511 m!190039))

(declare-fun m!190041 () Bool)

(assert (=> start!15696 m!190041))

(declare-fun m!190043 () Bool)

(assert (=> b!156513 m!190043))

(declare-fun m!190045 () Bool)

(assert (=> b!156510 m!190045))

(declare-fun m!190047 () Bool)

(assert (=> b!156515 m!190047))

(declare-fun m!190049 () Bool)

(assert (=> mapNonEmpty!5390 m!190049))

(check-sat (not mapNonEmpty!5390) (not b!156513) (not start!15696) b_and!9777 (not b!156511) (not b!156515) (not b!156510) (not b_next!3363) tp_is_empty!3165)
(check-sat b_and!9777 (not b_next!3363))
