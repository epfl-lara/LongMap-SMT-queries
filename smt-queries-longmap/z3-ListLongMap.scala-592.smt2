; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15698 () Bool)

(assert start!15698)

(declare-fun b!156339 () Bool)

(declare-fun b_free!3361 () Bool)

(declare-fun b_next!3361 () Bool)

(assert (=> b!156339 (= b_free!3361 (not b_next!3361))))

(declare-fun tp!12608 () Bool)

(declare-fun b_and!9749 () Bool)

(assert (=> b!156339 (= tp!12608 b_and!9749)))

(declare-fun mapIsEmpty!5387 () Bool)

(declare-fun mapRes!5387 () Bool)

(assert (=> mapIsEmpty!5387 mapRes!5387))

(declare-fun b!156333 () Bool)

(declare-fun e!102239 () Bool)

(declare-fun tp_is_empty!3163 () Bool)

(assert (=> b!156333 (= e!102239 tp_is_empty!3163)))

(declare-fun b!156334 () Bool)

(declare-fun res!73846 () Bool)

(declare-fun e!102242 () Bool)

(assert (=> b!156334 (=> (not res!73846) (not e!102242))))

(declare-datatypes ((V!3865 0))(
  ( (V!3866 (val!1626 Int)) )
))
(declare-datatypes ((ValueCell!1238 0))(
  ( (ValueCellFull!1238 (v!3485 V!3865)) (EmptyCell!1238) )
))
(declare-datatypes ((array!5359 0))(
  ( (array!5360 (arr!2536 (Array (_ BitVec 32) (_ BitVec 64))) (size!2815 (_ BitVec 32))) )
))
(declare-datatypes ((array!5361 0))(
  ( (array!5362 (arr!2537 (Array (_ BitVec 32) ValueCell!1238)) (size!2816 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1384 0))(
  ( (LongMapFixedSize!1385 (defaultEntry!3134 Int) (mask!7586 (_ BitVec 32)) (extraKeys!2875 (_ BitVec 32)) (zeroValue!2977 V!3865) (minValue!2977 V!3865) (_size!741 (_ BitVec 32)) (_keys!4908 array!5359) (_values!3117 array!5361) (_vacant!741 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1384)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156334 (= res!73846 (validMask!0 (mask!7586 thiss!1248)))))

(declare-fun b!156335 () Bool)

(declare-fun res!73843 () Bool)

(assert (=> b!156335 (=> (not res!73843) (not e!102242))))

(assert (=> b!156335 (= res!73843 (and (= (size!2816 (_values!3117 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7586 thiss!1248))) (= (size!2815 (_keys!4908 thiss!1248)) (size!2816 (_values!3117 thiss!1248))) (bvsge (mask!7586 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2875 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2875 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2875 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2875 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2875 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2875 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2875 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!156336 () Bool)

(assert (=> b!156336 (= e!102242 false)))

(declare-fun lt!81375 () Bool)

(declare-datatypes ((List!1855 0))(
  ( (Nil!1852) (Cons!1851 (h!2460 (_ BitVec 64)) (t!6648 List!1855)) )
))
(declare-fun arrayNoDuplicates!0 (array!5359 (_ BitVec 32) List!1855) Bool)

(assert (=> b!156336 (= lt!81375 (arrayNoDuplicates!0 (_keys!4908 thiss!1248) #b00000000000000000000000000000000 Nil!1852))))

(declare-fun b!156337 () Bool)

(declare-fun e!102243 () Bool)

(assert (=> b!156337 (= e!102243 tp_is_empty!3163)))

(declare-fun b!156338 () Bool)

(declare-fun res!73845 () Bool)

(assert (=> b!156338 (=> (not res!73845) (not e!102242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5359 (_ BitVec 32)) Bool)

(assert (=> b!156338 (= res!73845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4908 thiss!1248) (mask!7586 thiss!1248)))))

(declare-fun res!73844 () Bool)

(assert (=> start!15698 (=> (not res!73844) (not e!102242))))

(declare-fun valid!672 (LongMapFixedSize!1384) Bool)

(assert (=> start!15698 (= res!73844 (valid!672 thiss!1248))))

(assert (=> start!15698 e!102242))

(declare-fun e!102240 () Bool)

(assert (=> start!15698 e!102240))

(assert (=> start!15698 true))

(declare-fun e!102241 () Bool)

(declare-fun array_inv!1635 (array!5359) Bool)

(declare-fun array_inv!1636 (array!5361) Bool)

(assert (=> b!156339 (= e!102240 (and tp!12608 tp_is_empty!3163 (array_inv!1635 (_keys!4908 thiss!1248)) (array_inv!1636 (_values!3117 thiss!1248)) e!102241))))

(declare-fun b!156340 () Bool)

(assert (=> b!156340 (= e!102241 (and e!102239 mapRes!5387))))

(declare-fun condMapEmpty!5387 () Bool)

(declare-fun mapDefault!5387 () ValueCell!1238)

(assert (=> b!156340 (= condMapEmpty!5387 (= (arr!2537 (_values!3117 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1238)) mapDefault!5387)))))

(declare-fun b!156341 () Bool)

(declare-fun res!73847 () Bool)

(assert (=> b!156341 (=> (not res!73847) (not e!102242))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156341 (= res!73847 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!5387 () Bool)

(declare-fun tp!12607 () Bool)

(assert (=> mapNonEmpty!5387 (= mapRes!5387 (and tp!12607 e!102243))))

(declare-fun mapKey!5387 () (_ BitVec 32))

(declare-fun mapRest!5387 () (Array (_ BitVec 32) ValueCell!1238))

(declare-fun mapValue!5387 () ValueCell!1238)

(assert (=> mapNonEmpty!5387 (= (arr!2537 (_values!3117 thiss!1248)) (store mapRest!5387 mapKey!5387 mapValue!5387))))

(assert (= (and start!15698 res!73844) b!156341))

(assert (= (and b!156341 res!73847) b!156334))

(assert (= (and b!156334 res!73846) b!156335))

(assert (= (and b!156335 res!73843) b!156338))

(assert (= (and b!156338 res!73845) b!156336))

(assert (= (and b!156340 condMapEmpty!5387) mapIsEmpty!5387))

(assert (= (and b!156340 (not condMapEmpty!5387)) mapNonEmpty!5387))

(get-info :version)

(assert (= (and mapNonEmpty!5387 ((_ is ValueCellFull!1238) mapValue!5387)) b!156337))

(assert (= (and b!156340 ((_ is ValueCellFull!1238) mapDefault!5387)) b!156333))

(assert (= b!156339 b!156340))

(assert (= start!15698 b!156339))

(declare-fun m!189403 () Bool)

(assert (=> b!156338 m!189403))

(declare-fun m!189405 () Bool)

(assert (=> mapNonEmpty!5387 m!189405))

(declare-fun m!189407 () Bool)

(assert (=> start!15698 m!189407))

(declare-fun m!189409 () Bool)

(assert (=> b!156339 m!189409))

(declare-fun m!189411 () Bool)

(assert (=> b!156339 m!189411))

(declare-fun m!189413 () Bool)

(assert (=> b!156336 m!189413))

(declare-fun m!189415 () Bool)

(assert (=> b!156334 m!189415))

(check-sat (not b!156339) (not start!15698) (not mapNonEmpty!5387) (not b!156334) (not b!156336) (not b!156338) (not b_next!3361) tp_is_empty!3163 b_and!9749)
(check-sat b_and!9749 (not b_next!3361))
