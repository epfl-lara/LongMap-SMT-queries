; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15828 () Bool)

(assert start!15828)

(declare-fun b!157524 () Bool)

(declare-fun b_free!3451 () Bool)

(declare-fun b_next!3451 () Bool)

(assert (=> b!157524 (= b_free!3451 (not b_next!3451))))

(declare-fun tp!12888 () Bool)

(declare-fun b_and!9839 () Bool)

(assert (=> b!157524 (= tp!12888 b_and!9839)))

(declare-fun b!157523 () Bool)

(declare-fun res!74420 () Bool)

(declare-fun e!103160 () Bool)

(assert (=> b!157523 (=> (not res!74420) (not e!103160))))

(declare-datatypes ((V!3985 0))(
  ( (V!3986 (val!1671 Int)) )
))
(declare-datatypes ((ValueCell!1283 0))(
  ( (ValueCellFull!1283 (v!3530 V!3985)) (EmptyCell!1283) )
))
(declare-datatypes ((array!5545 0))(
  ( (array!5546 (arr!2626 (Array (_ BitVec 32) (_ BitVec 64))) (size!2907 (_ BitVec 32))) )
))
(declare-datatypes ((array!5547 0))(
  ( (array!5548 (arr!2627 (Array (_ BitVec 32) ValueCell!1283)) (size!2908 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1474 0))(
  ( (LongMapFixedSize!1475 (defaultEntry!3179 Int) (mask!7666 (_ BitVec 32)) (extraKeys!2920 (_ BitVec 32)) (zeroValue!3022 V!3985) (minValue!3022 V!3985) (_size!786 (_ BitVec 32)) (_keys!4955 array!5545) (_values!3162 array!5547) (_vacant!786 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1474)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157523 (= res!74420 (validMask!0 (mask!7666 thiss!1248)))))

(declare-fun e!103159 () Bool)

(declare-fun e!103162 () Bool)

(declare-fun tp_is_empty!3253 () Bool)

(declare-fun array_inv!1689 (array!5545) Bool)

(declare-fun array_inv!1690 (array!5547) Bool)

(assert (=> b!157524 (= e!103159 (and tp!12888 tp_is_empty!3253 (array_inv!1689 (_keys!4955 thiss!1248)) (array_inv!1690 (_values!3162 thiss!1248)) e!103162))))

(declare-fun res!74418 () Bool)

(assert (=> start!15828 (=> (not res!74418) (not e!103160))))

(declare-fun valid!704 (LongMapFixedSize!1474) Bool)

(assert (=> start!15828 (= res!74418 (valid!704 thiss!1248))))

(assert (=> start!15828 e!103160))

(assert (=> start!15828 e!103159))

(assert (=> start!15828 true))

(declare-fun b!157525 () Bool)

(declare-fun e!103163 () Bool)

(assert (=> b!157525 (= e!103163 tp_is_empty!3253)))

(declare-fun b!157526 () Bool)

(declare-fun e!103158 () Bool)

(declare-fun mapRes!5533 () Bool)

(assert (=> b!157526 (= e!103162 (and e!103158 mapRes!5533))))

(declare-fun condMapEmpty!5533 () Bool)

(declare-fun mapDefault!5533 () ValueCell!1283)

(assert (=> b!157526 (= condMapEmpty!5533 (= (arr!2627 (_values!3162 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1283)) mapDefault!5533)))))

(declare-fun mapIsEmpty!5533 () Bool)

(assert (=> mapIsEmpty!5533 mapRes!5533))

(declare-fun mapNonEmpty!5533 () Bool)

(declare-fun tp!12889 () Bool)

(assert (=> mapNonEmpty!5533 (= mapRes!5533 (and tp!12889 e!103163))))

(declare-fun mapRest!5533 () (Array (_ BitVec 32) ValueCell!1283))

(declare-fun mapValue!5533 () ValueCell!1283)

(declare-fun mapKey!5533 () (_ BitVec 32))

(assert (=> mapNonEmpty!5533 (= (arr!2627 (_values!3162 thiss!1248)) (store mapRest!5533 mapKey!5533 mapValue!5533))))

(declare-fun b!157527 () Bool)

(assert (=> b!157527 (= e!103158 tp_is_empty!3253)))

(declare-fun b!157528 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157528 (= e!103160 (not (validKeyInArray!0 key!828)))))

(declare-fun b!157529 () Bool)

(declare-fun res!74419 () Bool)

(assert (=> b!157529 (=> (not res!74419) (not e!103160))))

(assert (=> b!157529 (= res!74419 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157530 () Bool)

(declare-fun res!74417 () Bool)

(assert (=> b!157530 (=> (not res!74417) (not e!103160))))

(assert (=> b!157530 (= res!74417 (and (bvsge (mask!7666 thiss!1248) #b00000000000000000000000000000000) (= (size!2907 (_keys!4955 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7666 thiss!1248)))))))

(assert (= (and start!15828 res!74418) b!157529))

(assert (= (and b!157529 res!74419) b!157523))

(assert (= (and b!157523 res!74420) b!157530))

(assert (= (and b!157530 res!74417) b!157528))

(assert (= (and b!157526 condMapEmpty!5533) mapIsEmpty!5533))

(assert (= (and b!157526 (not condMapEmpty!5533)) mapNonEmpty!5533))

(get-info :version)

(assert (= (and mapNonEmpty!5533 ((_ is ValueCellFull!1283) mapValue!5533)) b!157525))

(assert (= (and b!157526 ((_ is ValueCellFull!1283) mapDefault!5533)) b!157527))

(assert (= b!157524 b!157526))

(assert (= start!15828 b!157524))

(declare-fun m!190155 () Bool)

(assert (=> b!157528 m!190155))

(declare-fun m!190157 () Bool)

(assert (=> b!157524 m!190157))

(declare-fun m!190159 () Bool)

(assert (=> b!157524 m!190159))

(declare-fun m!190161 () Bool)

(assert (=> start!15828 m!190161))

(declare-fun m!190163 () Bool)

(assert (=> mapNonEmpty!5533 m!190163))

(declare-fun m!190165 () Bool)

(assert (=> b!157523 m!190165))

(check-sat (not b!157523) (not b!157528) (not mapNonEmpty!5533) tp_is_empty!3253 (not start!15828) (not b!157524) b_and!9839 (not b_next!3451))
(check-sat b_and!9839 (not b_next!3451))
(get-model)

(declare-fun d!50937 () Bool)

(assert (=> d!50937 (= (validMask!0 (mask!7666 thiss!1248)) (and (or (= (mask!7666 thiss!1248) #b00000000000000000000000000000111) (= (mask!7666 thiss!1248) #b00000000000000000000000000001111) (= (mask!7666 thiss!1248) #b00000000000000000000000000011111) (= (mask!7666 thiss!1248) #b00000000000000000000000000111111) (= (mask!7666 thiss!1248) #b00000000000000000000000001111111) (= (mask!7666 thiss!1248) #b00000000000000000000000011111111) (= (mask!7666 thiss!1248) #b00000000000000000000000111111111) (= (mask!7666 thiss!1248) #b00000000000000000000001111111111) (= (mask!7666 thiss!1248) #b00000000000000000000011111111111) (= (mask!7666 thiss!1248) #b00000000000000000000111111111111) (= (mask!7666 thiss!1248) #b00000000000000000001111111111111) (= (mask!7666 thiss!1248) #b00000000000000000011111111111111) (= (mask!7666 thiss!1248) #b00000000000000000111111111111111) (= (mask!7666 thiss!1248) #b00000000000000001111111111111111) (= (mask!7666 thiss!1248) #b00000000000000011111111111111111) (= (mask!7666 thiss!1248) #b00000000000000111111111111111111) (= (mask!7666 thiss!1248) #b00000000000001111111111111111111) (= (mask!7666 thiss!1248) #b00000000000011111111111111111111) (= (mask!7666 thiss!1248) #b00000000000111111111111111111111) (= (mask!7666 thiss!1248) #b00000000001111111111111111111111) (= (mask!7666 thiss!1248) #b00000000011111111111111111111111) (= (mask!7666 thiss!1248) #b00000000111111111111111111111111) (= (mask!7666 thiss!1248) #b00000001111111111111111111111111) (= (mask!7666 thiss!1248) #b00000011111111111111111111111111) (= (mask!7666 thiss!1248) #b00000111111111111111111111111111) (= (mask!7666 thiss!1248) #b00001111111111111111111111111111) (= (mask!7666 thiss!1248) #b00011111111111111111111111111111) (= (mask!7666 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7666 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157523 d!50937))

(declare-fun d!50939 () Bool)

(assert (=> d!50939 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!157528 d!50939))

(declare-fun d!50941 () Bool)

(assert (=> d!50941 (= (array_inv!1689 (_keys!4955 thiss!1248)) (bvsge (size!2907 (_keys!4955 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157524 d!50941))

(declare-fun d!50943 () Bool)

(assert (=> d!50943 (= (array_inv!1690 (_values!3162 thiss!1248)) (bvsge (size!2908 (_values!3162 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157524 d!50943))

(declare-fun d!50945 () Bool)

(declare-fun res!74451 () Bool)

(declare-fun e!103202 () Bool)

(assert (=> d!50945 (=> (not res!74451) (not e!103202))))

(declare-fun simpleValid!108 (LongMapFixedSize!1474) Bool)

(assert (=> d!50945 (= res!74451 (simpleValid!108 thiss!1248))))

(assert (=> d!50945 (= (valid!704 thiss!1248) e!103202)))

(declare-fun b!157585 () Bool)

(declare-fun res!74452 () Bool)

(assert (=> b!157585 (=> (not res!74452) (not e!103202))))

(declare-fun arrayCountValidKeys!0 (array!5545 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157585 (= res!74452 (= (arrayCountValidKeys!0 (_keys!4955 thiss!1248) #b00000000000000000000000000000000 (size!2907 (_keys!4955 thiss!1248))) (_size!786 thiss!1248)))))

(declare-fun b!157586 () Bool)

(declare-fun res!74453 () Bool)

(assert (=> b!157586 (=> (not res!74453) (not e!103202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5545 (_ BitVec 32)) Bool)

(assert (=> b!157586 (= res!74453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4955 thiss!1248) (mask!7666 thiss!1248)))))

(declare-fun b!157587 () Bool)

(declare-datatypes ((List!1882 0))(
  ( (Nil!1879) (Cons!1878 (h!2487 (_ BitVec 64)) (t!6675 List!1882)) )
))
(declare-fun arrayNoDuplicates!0 (array!5545 (_ BitVec 32) List!1882) Bool)

(assert (=> b!157587 (= e!103202 (arrayNoDuplicates!0 (_keys!4955 thiss!1248) #b00000000000000000000000000000000 Nil!1879))))

(assert (= (and d!50945 res!74451) b!157585))

(assert (= (and b!157585 res!74452) b!157586))

(assert (= (and b!157586 res!74453) b!157587))

(declare-fun m!190191 () Bool)

(assert (=> d!50945 m!190191))

(declare-fun m!190193 () Bool)

(assert (=> b!157585 m!190193))

(declare-fun m!190195 () Bool)

(assert (=> b!157586 m!190195))

(declare-fun m!190197 () Bool)

(assert (=> b!157587 m!190197))

(assert (=> start!15828 d!50945))

(declare-fun condMapEmpty!5542 () Bool)

(declare-fun mapDefault!5542 () ValueCell!1283)

(assert (=> mapNonEmpty!5533 (= condMapEmpty!5542 (= mapRest!5533 ((as const (Array (_ BitVec 32) ValueCell!1283)) mapDefault!5542)))))

(declare-fun e!103208 () Bool)

(declare-fun mapRes!5542 () Bool)

(assert (=> mapNonEmpty!5533 (= tp!12889 (and e!103208 mapRes!5542))))

(declare-fun mapIsEmpty!5542 () Bool)

(assert (=> mapIsEmpty!5542 mapRes!5542))

(declare-fun mapNonEmpty!5542 () Bool)

(declare-fun tp!12904 () Bool)

(declare-fun e!103207 () Bool)

(assert (=> mapNonEmpty!5542 (= mapRes!5542 (and tp!12904 e!103207))))

(declare-fun mapKey!5542 () (_ BitVec 32))

(declare-fun mapValue!5542 () ValueCell!1283)

(declare-fun mapRest!5542 () (Array (_ BitVec 32) ValueCell!1283))

(assert (=> mapNonEmpty!5542 (= mapRest!5533 (store mapRest!5542 mapKey!5542 mapValue!5542))))

(declare-fun b!157595 () Bool)

(assert (=> b!157595 (= e!103208 tp_is_empty!3253)))

(declare-fun b!157594 () Bool)

(assert (=> b!157594 (= e!103207 tp_is_empty!3253)))

(assert (= (and mapNonEmpty!5533 condMapEmpty!5542) mapIsEmpty!5542))

(assert (= (and mapNonEmpty!5533 (not condMapEmpty!5542)) mapNonEmpty!5542))

(assert (= (and mapNonEmpty!5542 ((_ is ValueCellFull!1283) mapValue!5542)) b!157594))

(assert (= (and mapNonEmpty!5533 ((_ is ValueCellFull!1283) mapDefault!5542)) b!157595))

(declare-fun m!190199 () Bool)

(assert (=> mapNonEmpty!5542 m!190199))

(check-sat (not mapNonEmpty!5542) (not b!157585) (not b!157587) (not b!157586) (not d!50945) tp_is_empty!3253 b_and!9839 (not b_next!3451))
(check-sat b_and!9839 (not b_next!3451))
