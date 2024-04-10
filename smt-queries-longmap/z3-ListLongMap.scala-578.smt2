; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15612 () Bool)

(assert start!15612)

(declare-fun b!155493 () Bool)

(declare-fun b_free!3279 () Bool)

(declare-fun b_next!3279 () Bool)

(assert (=> b!155493 (= b_free!3279 (not b_next!3279))))

(declare-fun tp!12361 () Bool)

(declare-fun b_and!9693 () Bool)

(assert (=> b!155493 (= tp!12361 b_and!9693)))

(declare-fun mapNonEmpty!5264 () Bool)

(declare-fun mapRes!5264 () Bool)

(declare-fun tp!12362 () Bool)

(declare-fun e!101589 () Bool)

(assert (=> mapNonEmpty!5264 (= mapRes!5264 (and tp!12362 e!101589))))

(declare-datatypes ((V!3755 0))(
  ( (V!3756 (val!1585 Int)) )
))
(declare-datatypes ((ValueCell!1197 0))(
  ( (ValueCellFull!1197 (v!3450 V!3755)) (EmptyCell!1197) )
))
(declare-fun mapValue!5264 () ValueCell!1197)

(declare-fun mapKey!5264 () (_ BitVec 32))

(declare-fun mapRest!5264 () (Array (_ BitVec 32) ValueCell!1197))

(declare-datatypes ((array!5215 0))(
  ( (array!5216 (arr!2465 (Array (_ BitVec 32) (_ BitVec 64))) (size!2743 (_ BitVec 32))) )
))
(declare-datatypes ((array!5217 0))(
  ( (array!5218 (arr!2466 (Array (_ BitVec 32) ValueCell!1197)) (size!2744 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1302 0))(
  ( (LongMapFixedSize!1303 (defaultEntry!3093 Int) (mask!7518 (_ BitVec 32)) (extraKeys!2834 (_ BitVec 32)) (zeroValue!2936 V!3755) (minValue!2936 V!3755) (_size!700 (_ BitVec 32)) (_keys!4868 array!5215) (_values!3076 array!5217) (_vacant!700 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1302)

(assert (=> mapNonEmpty!5264 (= (arr!2466 (_values!3076 thiss!1248)) (store mapRest!5264 mapKey!5264 mapValue!5264))))

(declare-fun b!155490 () Bool)

(declare-fun e!101584 () Bool)

(declare-fun e!101585 () Bool)

(assert (=> b!155490 (= e!101584 (and e!101585 mapRes!5264))))

(declare-fun condMapEmpty!5264 () Bool)

(declare-fun mapDefault!5264 () ValueCell!1197)

(assert (=> b!155490 (= condMapEmpty!5264 (= (arr!2466 (_values!3076 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1197)) mapDefault!5264)))))

(declare-fun b!155491 () Bool)

(declare-fun tp_is_empty!3081 () Bool)

(assert (=> b!155491 (= e!101585 tp_is_empty!3081)))

(declare-fun b!155492 () Bool)

(declare-fun res!73442 () Bool)

(declare-fun e!101586 () Bool)

(assert (=> b!155492 (=> (not res!73442) (not e!101586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5215 (_ BitVec 32)) Bool)

(assert (=> b!155492 (= res!73442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4868 thiss!1248) (mask!7518 thiss!1248)))))

(declare-fun e!101588 () Bool)

(declare-fun array_inv!1555 (array!5215) Bool)

(declare-fun array_inv!1556 (array!5217) Bool)

(assert (=> b!155493 (= e!101588 (and tp!12361 tp_is_empty!3081 (array_inv!1555 (_keys!4868 thiss!1248)) (array_inv!1556 (_values!3076 thiss!1248)) e!101584))))

(declare-fun b!155494 () Bool)

(declare-fun res!73441 () Bool)

(assert (=> b!155494 (=> (not res!73441) (not e!101586))))

(assert (=> b!155494 (= res!73441 (and (= (size!2744 (_values!3076 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7518 thiss!1248))) (= (size!2743 (_keys!4868 thiss!1248)) (size!2744 (_values!3076 thiss!1248))) (bvsge (mask!7518 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2834 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2834 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2834 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2834 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2834 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2834 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2834 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155495 () Bool)

(declare-fun res!73443 () Bool)

(assert (=> b!155495 (=> (not res!73443) (not e!101586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155495 (= res!73443 (validMask!0 (mask!7518 thiss!1248)))))

(declare-fun b!155496 () Bool)

(assert (=> b!155496 (= e!101589 tp_is_empty!3081)))

(declare-fun b!155497 () Bool)

(declare-fun res!73440 () Bool)

(assert (=> b!155497 (=> (not res!73440) (not e!101586))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155497 (= res!73440 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155498 () Bool)

(assert (=> b!155498 (= e!101586 false)))

(declare-fun lt!81370 () Bool)

(declare-datatypes ((List!1827 0))(
  ( (Nil!1824) (Cons!1823 (h!2432 (_ BitVec 64)) (t!6629 List!1827)) )
))
(declare-fun arrayNoDuplicates!0 (array!5215 (_ BitVec 32) List!1827) Bool)

(assert (=> b!155498 (= lt!81370 (arrayNoDuplicates!0 (_keys!4868 thiss!1248) #b00000000000000000000000000000000 Nil!1824))))

(declare-fun res!73444 () Bool)

(assert (=> start!15612 (=> (not res!73444) (not e!101586))))

(declare-fun valid!639 (LongMapFixedSize!1302) Bool)

(assert (=> start!15612 (= res!73444 (valid!639 thiss!1248))))

(assert (=> start!15612 e!101586))

(assert (=> start!15612 e!101588))

(assert (=> start!15612 true))

(declare-fun mapIsEmpty!5264 () Bool)

(assert (=> mapIsEmpty!5264 mapRes!5264))

(assert (= (and start!15612 res!73444) b!155497))

(assert (= (and b!155497 res!73440) b!155495))

(assert (= (and b!155495 res!73443) b!155494))

(assert (= (and b!155494 res!73441) b!155492))

(assert (= (and b!155492 res!73442) b!155498))

(assert (= (and b!155490 condMapEmpty!5264) mapIsEmpty!5264))

(assert (= (and b!155490 (not condMapEmpty!5264)) mapNonEmpty!5264))

(get-info :version)

(assert (= (and mapNonEmpty!5264 ((_ is ValueCellFull!1197) mapValue!5264)) b!155496))

(assert (= (and b!155490 ((_ is ValueCellFull!1197) mapDefault!5264)) b!155491))

(assert (= b!155493 b!155490))

(assert (= start!15612 b!155493))

(declare-fun m!189365 () Bool)

(assert (=> b!155492 m!189365))

(declare-fun m!189367 () Bool)

(assert (=> b!155498 m!189367))

(declare-fun m!189369 () Bool)

(assert (=> b!155495 m!189369))

(declare-fun m!189371 () Bool)

(assert (=> b!155493 m!189371))

(declare-fun m!189373 () Bool)

(assert (=> b!155493 m!189373))

(declare-fun m!189375 () Bool)

(assert (=> mapNonEmpty!5264 m!189375))

(declare-fun m!189377 () Bool)

(assert (=> start!15612 m!189377))

(check-sat (not b_next!3279) (not b!155492) (not b!155498) (not start!15612) b_and!9693 (not mapNonEmpty!5264) tp_is_empty!3081 (not b!155495) (not b!155493))
(check-sat b_and!9693 (not b_next!3279))
