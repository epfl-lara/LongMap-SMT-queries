; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15790 () Bool)

(assert start!15790)

(declare-fun b!157476 () Bool)

(declare-fun b_free!3441 () Bool)

(declare-fun b_next!3441 () Bool)

(assert (=> b!157476 (= b_free!3441 (not b_next!3441))))

(declare-fun tp!12851 () Bool)

(declare-fun b_and!9855 () Bool)

(assert (=> b!157476 (= tp!12851 b_and!9855)))

(declare-fun e!103124 () Bool)

(declare-fun tp_is_empty!3243 () Bool)

(declare-datatypes ((V!3971 0))(
  ( (V!3972 (val!1666 Int)) )
))
(declare-datatypes ((ValueCell!1278 0))(
  ( (ValueCellFull!1278 (v!3531 V!3971)) (EmptyCell!1278) )
))
(declare-datatypes ((array!5541 0))(
  ( (array!5542 (arr!2627 (Array (_ BitVec 32) (_ BitVec 64))) (size!2906 (_ BitVec 32))) )
))
(declare-datatypes ((array!5543 0))(
  ( (array!5544 (arr!2628 (Array (_ BitVec 32) ValueCell!1278)) (size!2907 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1464 0))(
  ( (LongMapFixedSize!1465 (defaultEntry!3174 Int) (mask!7655 (_ BitVec 32)) (extraKeys!2915 (_ BitVec 32)) (zeroValue!3017 V!3971) (minValue!3017 V!3971) (_size!781 (_ BitVec 32)) (_keys!4950 array!5541) (_values!3157 array!5543) (_vacant!781 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1464)

(declare-fun e!103119 () Bool)

(declare-fun array_inv!1667 (array!5541) Bool)

(declare-fun array_inv!1668 (array!5543) Bool)

(assert (=> b!157476 (= e!103119 (and tp!12851 tp_is_empty!3243 (array_inv!1667 (_keys!4950 thiss!1248)) (array_inv!1668 (_values!3157 thiss!1248)) e!103124))))

(declare-fun b!157477 () Bool)

(declare-fun res!74421 () Bool)

(declare-fun e!103122 () Bool)

(assert (=> b!157477 (=> (not res!74421) (not e!103122))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157477 (= res!74421 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5511 () Bool)

(declare-fun mapRes!5511 () Bool)

(assert (=> mapIsEmpty!5511 mapRes!5511))

(declare-fun b!157479 () Bool)

(declare-fun e!103123 () Bool)

(assert (=> b!157479 (= e!103124 (and e!103123 mapRes!5511))))

(declare-fun condMapEmpty!5511 () Bool)

(declare-fun mapDefault!5511 () ValueCell!1278)

(assert (=> b!157479 (= condMapEmpty!5511 (= (arr!2628 (_values!3157 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1278)) mapDefault!5511)))))

(declare-fun mapNonEmpty!5511 () Bool)

(declare-fun tp!12852 () Bool)

(declare-fun e!103120 () Bool)

(assert (=> mapNonEmpty!5511 (= mapRes!5511 (and tp!12852 e!103120))))

(declare-fun mapKey!5511 () (_ BitVec 32))

(declare-fun mapValue!5511 () ValueCell!1278)

(declare-fun mapRest!5511 () (Array (_ BitVec 32) ValueCell!1278))

(assert (=> mapNonEmpty!5511 (= (arr!2628 (_values!3157 thiss!1248)) (store mapRest!5511 mapKey!5511 mapValue!5511))))

(declare-fun b!157480 () Bool)

(assert (=> b!157480 (= e!103122 (bvslt (mask!7655 thiss!1248) #b00000000000000000000000000000000))))

(declare-fun res!74420 () Bool)

(assert (=> start!15790 (=> (not res!74420) (not e!103122))))

(declare-fun valid!695 (LongMapFixedSize!1464) Bool)

(assert (=> start!15790 (= res!74420 (valid!695 thiss!1248))))

(assert (=> start!15790 e!103122))

(assert (=> start!15790 e!103119))

(assert (=> start!15790 true))

(declare-fun b!157478 () Bool)

(assert (=> b!157478 (= e!103123 tp_is_empty!3243)))

(declare-fun b!157481 () Bool)

(assert (=> b!157481 (= e!103120 tp_is_empty!3243)))

(declare-fun b!157482 () Bool)

(declare-fun res!74422 () Bool)

(assert (=> b!157482 (=> (not res!74422) (not e!103122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157482 (= res!74422 (validMask!0 (mask!7655 thiss!1248)))))

(assert (= (and start!15790 res!74420) b!157477))

(assert (= (and b!157477 res!74421) b!157482))

(assert (= (and b!157482 res!74422) b!157480))

(assert (= (and b!157479 condMapEmpty!5511) mapIsEmpty!5511))

(assert (= (and b!157479 (not condMapEmpty!5511)) mapNonEmpty!5511))

(get-info :version)

(assert (= (and mapNonEmpty!5511 ((_ is ValueCellFull!1278) mapValue!5511)) b!157481))

(assert (= (and b!157479 ((_ is ValueCellFull!1278) mapDefault!5511)) b!157478))

(assert (= b!157476 b!157479))

(assert (= start!15790 b!157476))

(declare-fun m!190683 () Bool)

(assert (=> b!157476 m!190683))

(declare-fun m!190685 () Bool)

(assert (=> b!157476 m!190685))

(declare-fun m!190687 () Bool)

(assert (=> mapNonEmpty!5511 m!190687))

(declare-fun m!190689 () Bool)

(assert (=> start!15790 m!190689))

(declare-fun m!190691 () Bool)

(assert (=> b!157482 m!190691))

(check-sat (not start!15790) b_and!9855 (not b!157482) tp_is_empty!3243 (not b_next!3441) (not mapNonEmpty!5511) (not b!157476))
(check-sat b_and!9855 (not b_next!3441))
(get-model)

(declare-fun d!51057 () Bool)

(assert (=> d!51057 (= (array_inv!1667 (_keys!4950 thiss!1248)) (bvsge (size!2906 (_keys!4950 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157476 d!51057))

(declare-fun d!51059 () Bool)

(assert (=> d!51059 (= (array_inv!1668 (_values!3157 thiss!1248)) (bvsge (size!2907 (_values!3157 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157476 d!51059))

(declare-fun d!51061 () Bool)

(declare-fun res!74438 () Bool)

(declare-fun e!103145 () Bool)

(assert (=> d!51061 (=> (not res!74438) (not e!103145))))

(declare-fun simpleValid!106 (LongMapFixedSize!1464) Bool)

(assert (=> d!51061 (= res!74438 (simpleValid!106 thiss!1248))))

(assert (=> d!51061 (= (valid!695 thiss!1248) e!103145)))

(declare-fun b!157510 () Bool)

(declare-fun res!74439 () Bool)

(assert (=> b!157510 (=> (not res!74439) (not e!103145))))

(declare-fun arrayCountValidKeys!0 (array!5541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157510 (= res!74439 (= (arrayCountValidKeys!0 (_keys!4950 thiss!1248) #b00000000000000000000000000000000 (size!2906 (_keys!4950 thiss!1248))) (_size!781 thiss!1248)))))

(declare-fun b!157511 () Bool)

(declare-fun res!74440 () Bool)

(assert (=> b!157511 (=> (not res!74440) (not e!103145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5541 (_ BitVec 32)) Bool)

(assert (=> b!157511 (= res!74440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4950 thiss!1248) (mask!7655 thiss!1248)))))

(declare-fun b!157512 () Bool)

(declare-datatypes ((List!1883 0))(
  ( (Nil!1880) (Cons!1879 (h!2488 (_ BitVec 64)) (t!6685 List!1883)) )
))
(declare-fun arrayNoDuplicates!0 (array!5541 (_ BitVec 32) List!1883) Bool)

(assert (=> b!157512 (= e!103145 (arrayNoDuplicates!0 (_keys!4950 thiss!1248) #b00000000000000000000000000000000 Nil!1880))))

(assert (= (and d!51061 res!74438) b!157510))

(assert (= (and b!157510 res!74439) b!157511))

(assert (= (and b!157511 res!74440) b!157512))

(declare-fun m!190703 () Bool)

(assert (=> d!51061 m!190703))

(declare-fun m!190705 () Bool)

(assert (=> b!157510 m!190705))

(declare-fun m!190707 () Bool)

(assert (=> b!157511 m!190707))

(declare-fun m!190709 () Bool)

(assert (=> b!157512 m!190709))

(assert (=> start!15790 d!51061))

(declare-fun d!51063 () Bool)

(assert (=> d!51063 (= (validMask!0 (mask!7655 thiss!1248)) (and (or (= (mask!7655 thiss!1248) #b00000000000000000000000000000111) (= (mask!7655 thiss!1248) #b00000000000000000000000000001111) (= (mask!7655 thiss!1248) #b00000000000000000000000000011111) (= (mask!7655 thiss!1248) #b00000000000000000000000000111111) (= (mask!7655 thiss!1248) #b00000000000000000000000001111111) (= (mask!7655 thiss!1248) #b00000000000000000000000011111111) (= (mask!7655 thiss!1248) #b00000000000000000000000111111111) (= (mask!7655 thiss!1248) #b00000000000000000000001111111111) (= (mask!7655 thiss!1248) #b00000000000000000000011111111111) (= (mask!7655 thiss!1248) #b00000000000000000000111111111111) (= (mask!7655 thiss!1248) #b00000000000000000001111111111111) (= (mask!7655 thiss!1248) #b00000000000000000011111111111111) (= (mask!7655 thiss!1248) #b00000000000000000111111111111111) (= (mask!7655 thiss!1248) #b00000000000000001111111111111111) (= (mask!7655 thiss!1248) #b00000000000000011111111111111111) (= (mask!7655 thiss!1248) #b00000000000000111111111111111111) (= (mask!7655 thiss!1248) #b00000000000001111111111111111111) (= (mask!7655 thiss!1248) #b00000000000011111111111111111111) (= (mask!7655 thiss!1248) #b00000000000111111111111111111111) (= (mask!7655 thiss!1248) #b00000000001111111111111111111111) (= (mask!7655 thiss!1248) #b00000000011111111111111111111111) (= (mask!7655 thiss!1248) #b00000000111111111111111111111111) (= (mask!7655 thiss!1248) #b00000001111111111111111111111111) (= (mask!7655 thiss!1248) #b00000011111111111111111111111111) (= (mask!7655 thiss!1248) #b00000111111111111111111111111111) (= (mask!7655 thiss!1248) #b00001111111111111111111111111111) (= (mask!7655 thiss!1248) #b00011111111111111111111111111111) (= (mask!7655 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7655 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157482 d!51063))

(declare-fun b!157519 () Bool)

(declare-fun e!103150 () Bool)

(assert (=> b!157519 (= e!103150 tp_is_empty!3243)))

(declare-fun condMapEmpty!5517 () Bool)

(declare-fun mapDefault!5517 () ValueCell!1278)

(assert (=> mapNonEmpty!5511 (= condMapEmpty!5517 (= mapRest!5511 ((as const (Array (_ BitVec 32) ValueCell!1278)) mapDefault!5517)))))

(declare-fun e!103151 () Bool)

(declare-fun mapRes!5517 () Bool)

(assert (=> mapNonEmpty!5511 (= tp!12852 (and e!103151 mapRes!5517))))

(declare-fun mapIsEmpty!5517 () Bool)

(assert (=> mapIsEmpty!5517 mapRes!5517))

(declare-fun mapNonEmpty!5517 () Bool)

(declare-fun tp!12861 () Bool)

(assert (=> mapNonEmpty!5517 (= mapRes!5517 (and tp!12861 e!103150))))

(declare-fun mapKey!5517 () (_ BitVec 32))

(declare-fun mapRest!5517 () (Array (_ BitVec 32) ValueCell!1278))

(declare-fun mapValue!5517 () ValueCell!1278)

(assert (=> mapNonEmpty!5517 (= mapRest!5511 (store mapRest!5517 mapKey!5517 mapValue!5517))))

(declare-fun b!157520 () Bool)

(assert (=> b!157520 (= e!103151 tp_is_empty!3243)))

(assert (= (and mapNonEmpty!5511 condMapEmpty!5517) mapIsEmpty!5517))

(assert (= (and mapNonEmpty!5511 (not condMapEmpty!5517)) mapNonEmpty!5517))

(assert (= (and mapNonEmpty!5517 ((_ is ValueCellFull!1278) mapValue!5517)) b!157519))

(assert (= (and mapNonEmpty!5511 ((_ is ValueCellFull!1278) mapDefault!5517)) b!157520))

(declare-fun m!190711 () Bool)

(assert (=> mapNonEmpty!5517 m!190711))

(check-sat (not b!157510) (not b!157512) b_and!9855 (not b_next!3441) (not b!157511) (not mapNonEmpty!5517) (not d!51061) tp_is_empty!3243)
(check-sat b_and!9855 (not b_next!3441))
