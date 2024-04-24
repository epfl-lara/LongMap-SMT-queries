; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15698 () Bool)

(assert start!15698)

(declare-fun b!156533 () Bool)

(declare-fun b_free!3361 () Bool)

(declare-fun b_next!3361 () Bool)

(assert (=> b!156533 (= b_free!3361 (not b_next!3361))))

(declare-fun tp!12608 () Bool)

(declare-fun b_and!9789 () Bool)

(assert (=> b!156533 (= tp!12608 b_and!9789)))

(declare-fun b!156527 () Bool)

(declare-fun res!73959 () Bool)

(declare-fun e!102366 () Bool)

(assert (=> b!156527 (=> (not res!73959) (not e!102366))))

(declare-datatypes ((V!3865 0))(
  ( (V!3866 (val!1626 Int)) )
))
(declare-datatypes ((ValueCell!1238 0))(
  ( (ValueCellFull!1238 (v!3492 V!3865)) (EmptyCell!1238) )
))
(declare-datatypes ((array!5365 0))(
  ( (array!5366 (arr!2540 (Array (_ BitVec 32) (_ BitVec 64))) (size!2818 (_ BitVec 32))) )
))
(declare-datatypes ((array!5367 0))(
  ( (array!5368 (arr!2541 (Array (_ BitVec 32) ValueCell!1238)) (size!2819 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1384 0))(
  ( (LongMapFixedSize!1385 (defaultEntry!3134 Int) (mask!7587 (_ BitVec 32)) (extraKeys!2875 (_ BitVec 32)) (zeroValue!2977 V!3865) (minValue!2977 V!3865) (_size!741 (_ BitVec 32)) (_keys!4909 array!5365) (_values!3117 array!5367) (_vacant!741 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1384)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5365 (_ BitVec 32)) Bool)

(assert (=> b!156527 (= res!73959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4909 thiss!1248) (mask!7587 thiss!1248)))))

(declare-fun b!156528 () Bool)

(assert (=> b!156528 (= e!102366 false)))

(declare-fun lt!81615 () Bool)

(declare-datatypes ((List!1841 0))(
  ( (Nil!1838) (Cons!1837 (h!2446 (_ BitVec 64)) (t!6635 List!1841)) )
))
(declare-fun arrayNoDuplicates!0 (array!5365 (_ BitVec 32) List!1841) Bool)

(assert (=> b!156528 (= lt!81615 (arrayNoDuplicates!0 (_keys!4909 thiss!1248) #b00000000000000000000000000000000 Nil!1838))))

(declare-fun b!156529 () Bool)

(declare-fun e!102365 () Bool)

(declare-fun tp_is_empty!3163 () Bool)

(assert (=> b!156529 (= e!102365 tp_is_empty!3163)))

(declare-fun b!156530 () Bool)

(declare-fun res!73960 () Bool)

(assert (=> b!156530 (=> (not res!73960) (not e!102366))))

(assert (=> b!156530 (= res!73960 (and (= (size!2819 (_values!3117 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7587 thiss!1248))) (= (size!2818 (_keys!4909 thiss!1248)) (size!2819 (_values!3117 thiss!1248))) (bvsge (mask!7587 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2875 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2875 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2875 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2875 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2875 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2875 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2875 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156531 () Bool)

(declare-fun e!102364 () Bool)

(assert (=> b!156531 (= e!102364 tp_is_empty!3163)))

(declare-fun b!156532 () Bool)

(declare-fun res!73961 () Bool)

(assert (=> b!156532 (=> (not res!73961) (not e!102366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156532 (= res!73961 (validMask!0 (mask!7587 thiss!1248)))))

(declare-fun mapNonEmpty!5387 () Bool)

(declare-fun mapRes!5387 () Bool)

(declare-fun tp!12607 () Bool)

(assert (=> mapNonEmpty!5387 (= mapRes!5387 (and tp!12607 e!102364))))

(declare-fun mapKey!5387 () (_ BitVec 32))

(declare-fun mapValue!5387 () ValueCell!1238)

(declare-fun mapRest!5387 () (Array (_ BitVec 32) ValueCell!1238))

(assert (=> mapNonEmpty!5387 (= (arr!2541 (_values!3117 thiss!1248)) (store mapRest!5387 mapKey!5387 mapValue!5387))))

(declare-fun e!102369 () Bool)

(declare-fun e!102368 () Bool)

(declare-fun array_inv!1607 (array!5365) Bool)

(declare-fun array_inv!1608 (array!5367) Bool)

(assert (=> b!156533 (= e!102369 (and tp!12608 tp_is_empty!3163 (array_inv!1607 (_keys!4909 thiss!1248)) (array_inv!1608 (_values!3117 thiss!1248)) e!102368))))

(declare-fun res!73963 () Bool)

(assert (=> start!15698 (=> (not res!73963) (not e!102366))))

(declare-fun valid!683 (LongMapFixedSize!1384) Bool)

(assert (=> start!15698 (= res!73963 (valid!683 thiss!1248))))

(assert (=> start!15698 e!102366))

(assert (=> start!15698 e!102369))

(assert (=> start!15698 true))

(declare-fun mapIsEmpty!5387 () Bool)

(assert (=> mapIsEmpty!5387 mapRes!5387))

(declare-fun b!156534 () Bool)

(declare-fun res!73962 () Bool)

(assert (=> b!156534 (=> (not res!73962) (not e!102366))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156534 (= res!73962 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156535 () Bool)

(assert (=> b!156535 (= e!102368 (and e!102365 mapRes!5387))))

(declare-fun condMapEmpty!5387 () Bool)

(declare-fun mapDefault!5387 () ValueCell!1238)

(assert (=> b!156535 (= condMapEmpty!5387 (= (arr!2541 (_values!3117 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1238)) mapDefault!5387)))))

(assert (= (and start!15698 res!73963) b!156534))

(assert (= (and b!156534 res!73962) b!156532))

(assert (= (and b!156532 res!73961) b!156530))

(assert (= (and b!156530 res!73960) b!156527))

(assert (= (and b!156527 res!73959) b!156528))

(assert (= (and b!156535 condMapEmpty!5387) mapIsEmpty!5387))

(assert (= (and b!156535 (not condMapEmpty!5387)) mapNonEmpty!5387))

(get-info :version)

(assert (= (and mapNonEmpty!5387 ((_ is ValueCellFull!1238) mapValue!5387)) b!156531))

(assert (= (and b!156535 ((_ is ValueCellFull!1238) mapDefault!5387)) b!156529))

(assert (= b!156533 b!156535))

(assert (= start!15698 b!156533))

(declare-fun m!190205 () Bool)

(assert (=> b!156532 m!190205))

(declare-fun m!190207 () Bool)

(assert (=> start!15698 m!190207))

(declare-fun m!190209 () Bool)

(assert (=> mapNonEmpty!5387 m!190209))

(declare-fun m!190211 () Bool)

(assert (=> b!156533 m!190211))

(declare-fun m!190213 () Bool)

(assert (=> b!156533 m!190213))

(declare-fun m!190215 () Bool)

(assert (=> b!156527 m!190215))

(declare-fun m!190217 () Bool)

(assert (=> b!156528 m!190217))

(check-sat (not start!15698) b_and!9789 (not mapNonEmpty!5387) (not b!156533) (not b!156527) (not b_next!3361) (not b!156532) tp_is_empty!3163 (not b!156528))
(check-sat b_and!9789 (not b_next!3361))
