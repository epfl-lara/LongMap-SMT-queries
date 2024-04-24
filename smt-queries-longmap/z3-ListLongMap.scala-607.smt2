; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15828 () Bool)

(assert start!15828)

(declare-fun b!157721 () Bool)

(declare-fun b_free!3451 () Bool)

(declare-fun b_next!3451 () Bool)

(assert (=> b!157721 (= b_free!3451 (not b_next!3451))))

(declare-fun tp!12889 () Bool)

(declare-fun b_and!9879 () Bool)

(assert (=> b!157721 (= tp!12889 b_and!9879)))

(declare-fun b!157717 () Bool)

(declare-fun res!74534 () Bool)

(declare-fun e!103285 () Bool)

(assert (=> b!157717 (=> (not res!74534) (not e!103285))))

(declare-datatypes ((V!3985 0))(
  ( (V!3986 (val!1671 Int)) )
))
(declare-datatypes ((ValueCell!1283 0))(
  ( (ValueCellFull!1283 (v!3537 V!3985)) (EmptyCell!1283) )
))
(declare-datatypes ((array!5551 0))(
  ( (array!5552 (arr!2630 (Array (_ BitVec 32) (_ BitVec 64))) (size!2910 (_ BitVec 32))) )
))
(declare-datatypes ((array!5553 0))(
  ( (array!5554 (arr!2631 (Array (_ BitVec 32) ValueCell!1283)) (size!2911 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1474 0))(
  ( (LongMapFixedSize!1475 (defaultEntry!3179 Int) (mask!7667 (_ BitVec 32)) (extraKeys!2920 (_ BitVec 32)) (zeroValue!3022 V!3985) (minValue!3022 V!3985) (_size!786 (_ BitVec 32)) (_keys!4956 array!5551) (_values!3162 array!5553) (_vacant!786 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1474)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157717 (= res!74534 (validMask!0 (mask!7667 thiss!1248)))))

(declare-fun b!157718 () Bool)

(declare-fun e!103286 () Bool)

(declare-fun tp_is_empty!3253 () Bool)

(assert (=> b!157718 (= e!103286 tp_is_empty!3253)))

(declare-fun b!157720 () Bool)

(declare-fun res!74536 () Bool)

(assert (=> b!157720 (=> (not res!74536) (not e!103285))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157720 (= res!74536 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5533 () Bool)

(declare-fun mapRes!5533 () Bool)

(assert (=> mapIsEmpty!5533 mapRes!5533))

(declare-fun e!103283 () Bool)

(declare-fun e!103287 () Bool)

(declare-fun array_inv!1677 (array!5551) Bool)

(declare-fun array_inv!1678 (array!5553) Bool)

(assert (=> b!157721 (= e!103283 (and tp!12889 tp_is_empty!3253 (array_inv!1677 (_keys!4956 thiss!1248)) (array_inv!1678 (_values!3162 thiss!1248)) e!103287))))

(declare-fun mapNonEmpty!5533 () Bool)

(declare-fun tp!12888 () Bool)

(declare-fun e!103288 () Bool)

(assert (=> mapNonEmpty!5533 (= mapRes!5533 (and tp!12888 e!103288))))

(declare-fun mapValue!5533 () ValueCell!1283)

(declare-fun mapRest!5533 () (Array (_ BitVec 32) ValueCell!1283))

(declare-fun mapKey!5533 () (_ BitVec 32))

(assert (=> mapNonEmpty!5533 (= (arr!2631 (_values!3162 thiss!1248)) (store mapRest!5533 mapKey!5533 mapValue!5533))))

(declare-fun b!157722 () Bool)

(declare-fun res!74535 () Bool)

(assert (=> b!157722 (=> (not res!74535) (not e!103285))))

(assert (=> b!157722 (= res!74535 (and (bvsge (mask!7667 thiss!1248) #b00000000000000000000000000000000) (= (size!2910 (_keys!4956 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7667 thiss!1248)))))))

(declare-fun b!157719 () Bool)

(assert (=> b!157719 (= e!103288 tp_is_empty!3253)))

(declare-fun res!74533 () Bool)

(assert (=> start!15828 (=> (not res!74533) (not e!103285))))

(declare-fun valid!718 (LongMapFixedSize!1474) Bool)

(assert (=> start!15828 (= res!74533 (valid!718 thiss!1248))))

(assert (=> start!15828 e!103285))

(assert (=> start!15828 e!103283))

(assert (=> start!15828 true))

(declare-fun b!157723 () Bool)

(assert (=> b!157723 (= e!103287 (and e!103286 mapRes!5533))))

(declare-fun condMapEmpty!5533 () Bool)

(declare-fun mapDefault!5533 () ValueCell!1283)

(assert (=> b!157723 (= condMapEmpty!5533 (= (arr!2631 (_values!3162 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1283)) mapDefault!5533)))))

(declare-fun b!157724 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157724 (= e!103285 (not (validKeyInArray!0 key!828)))))

(assert (= (and start!15828 res!74533) b!157720))

(assert (= (and b!157720 res!74536) b!157717))

(assert (= (and b!157717 res!74534) b!157722))

(assert (= (and b!157722 res!74535) b!157724))

(assert (= (and b!157723 condMapEmpty!5533) mapIsEmpty!5533))

(assert (= (and b!157723 (not condMapEmpty!5533)) mapNonEmpty!5533))

(get-info :version)

(assert (= (and mapNonEmpty!5533 ((_ is ValueCellFull!1283) mapValue!5533)) b!157719))

(assert (= (and b!157723 ((_ is ValueCellFull!1283) mapDefault!5533)) b!157718))

(assert (= b!157721 b!157723))

(assert (= start!15828 b!157721))

(declare-fun m!190957 () Bool)

(assert (=> b!157724 m!190957))

(declare-fun m!190959 () Bool)

(assert (=> b!157717 m!190959))

(declare-fun m!190961 () Bool)

(assert (=> mapNonEmpty!5533 m!190961))

(declare-fun m!190963 () Bool)

(assert (=> start!15828 m!190963))

(declare-fun m!190965 () Bool)

(assert (=> b!157721 m!190965))

(declare-fun m!190967 () Bool)

(assert (=> b!157721 m!190967))

(check-sat (not b_next!3451) (not mapNonEmpty!5533) (not start!15828) (not b!157717) b_and!9879 (not b!157724) tp_is_empty!3253 (not b!157721))
(check-sat b_and!9879 (not b_next!3451))
(get-model)

(declare-fun d!51159 () Bool)

(declare-fun res!74567 () Bool)

(declare-fun e!103327 () Bool)

(assert (=> d!51159 (=> (not res!74567) (not e!103327))))

(declare-fun simpleValid!108 (LongMapFixedSize!1474) Bool)

(assert (=> d!51159 (= res!74567 (simpleValid!108 thiss!1248))))

(assert (=> d!51159 (= (valid!718 thiss!1248) e!103327)))

(declare-fun b!157779 () Bool)

(declare-fun res!74568 () Bool)

(assert (=> b!157779 (=> (not res!74568) (not e!103327))))

(declare-fun arrayCountValidKeys!0 (array!5551 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157779 (= res!74568 (= (arrayCountValidKeys!0 (_keys!4956 thiss!1248) #b00000000000000000000000000000000 (size!2910 (_keys!4956 thiss!1248))) (_size!786 thiss!1248)))))

(declare-fun b!157780 () Bool)

(declare-fun res!74569 () Bool)

(assert (=> b!157780 (=> (not res!74569) (not e!103327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5551 (_ BitVec 32)) Bool)

(assert (=> b!157780 (= res!74569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4956 thiss!1248) (mask!7667 thiss!1248)))))

(declare-fun b!157781 () Bool)

(declare-datatypes ((List!1869 0))(
  ( (Nil!1866) (Cons!1865 (h!2474 (_ BitVec 64)) (t!6663 List!1869)) )
))
(declare-fun arrayNoDuplicates!0 (array!5551 (_ BitVec 32) List!1869) Bool)

(assert (=> b!157781 (= e!103327 (arrayNoDuplicates!0 (_keys!4956 thiss!1248) #b00000000000000000000000000000000 Nil!1866))))

(assert (= (and d!51159 res!74567) b!157779))

(assert (= (and b!157779 res!74568) b!157780))

(assert (= (and b!157780 res!74569) b!157781))

(declare-fun m!190993 () Bool)

(assert (=> d!51159 m!190993))

(declare-fun m!190995 () Bool)

(assert (=> b!157779 m!190995))

(declare-fun m!190997 () Bool)

(assert (=> b!157780 m!190997))

(declare-fun m!190999 () Bool)

(assert (=> b!157781 m!190999))

(assert (=> start!15828 d!51159))

(declare-fun d!51161 () Bool)

(assert (=> d!51161 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!157724 d!51161))

(declare-fun d!51163 () Bool)

(assert (=> d!51163 (= (array_inv!1677 (_keys!4956 thiss!1248)) (bvsge (size!2910 (_keys!4956 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157721 d!51163))

(declare-fun d!51165 () Bool)

(assert (=> d!51165 (= (array_inv!1678 (_values!3162 thiss!1248)) (bvsge (size!2911 (_values!3162 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157721 d!51165))

(declare-fun d!51167 () Bool)

(assert (=> d!51167 (= (validMask!0 (mask!7667 thiss!1248)) (and (or (= (mask!7667 thiss!1248) #b00000000000000000000000000000111) (= (mask!7667 thiss!1248) #b00000000000000000000000000001111) (= (mask!7667 thiss!1248) #b00000000000000000000000000011111) (= (mask!7667 thiss!1248) #b00000000000000000000000000111111) (= (mask!7667 thiss!1248) #b00000000000000000000000001111111) (= (mask!7667 thiss!1248) #b00000000000000000000000011111111) (= (mask!7667 thiss!1248) #b00000000000000000000000111111111) (= (mask!7667 thiss!1248) #b00000000000000000000001111111111) (= (mask!7667 thiss!1248) #b00000000000000000000011111111111) (= (mask!7667 thiss!1248) #b00000000000000000000111111111111) (= (mask!7667 thiss!1248) #b00000000000000000001111111111111) (= (mask!7667 thiss!1248) #b00000000000000000011111111111111) (= (mask!7667 thiss!1248) #b00000000000000000111111111111111) (= (mask!7667 thiss!1248) #b00000000000000001111111111111111) (= (mask!7667 thiss!1248) #b00000000000000011111111111111111) (= (mask!7667 thiss!1248) #b00000000000000111111111111111111) (= (mask!7667 thiss!1248) #b00000000000001111111111111111111) (= (mask!7667 thiss!1248) #b00000000000011111111111111111111) (= (mask!7667 thiss!1248) #b00000000000111111111111111111111) (= (mask!7667 thiss!1248) #b00000000001111111111111111111111) (= (mask!7667 thiss!1248) #b00000000011111111111111111111111) (= (mask!7667 thiss!1248) #b00000000111111111111111111111111) (= (mask!7667 thiss!1248) #b00000001111111111111111111111111) (= (mask!7667 thiss!1248) #b00000011111111111111111111111111) (= (mask!7667 thiss!1248) #b00000111111111111111111111111111) (= (mask!7667 thiss!1248) #b00001111111111111111111111111111) (= (mask!7667 thiss!1248) #b00011111111111111111111111111111) (= (mask!7667 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7667 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157717 d!51167))

(declare-fun b!157788 () Bool)

(declare-fun e!103332 () Bool)

(assert (=> b!157788 (= e!103332 tp_is_empty!3253)))

(declare-fun mapNonEmpty!5542 () Bool)

(declare-fun mapRes!5542 () Bool)

(declare-fun tp!12904 () Bool)

(assert (=> mapNonEmpty!5542 (= mapRes!5542 (and tp!12904 e!103332))))

(declare-fun mapRest!5542 () (Array (_ BitVec 32) ValueCell!1283))

(declare-fun mapKey!5542 () (_ BitVec 32))

(declare-fun mapValue!5542 () ValueCell!1283)

(assert (=> mapNonEmpty!5542 (= mapRest!5533 (store mapRest!5542 mapKey!5542 mapValue!5542))))

(declare-fun b!157789 () Bool)

(declare-fun e!103333 () Bool)

(assert (=> b!157789 (= e!103333 tp_is_empty!3253)))

(declare-fun mapIsEmpty!5542 () Bool)

(assert (=> mapIsEmpty!5542 mapRes!5542))

(declare-fun condMapEmpty!5542 () Bool)

(declare-fun mapDefault!5542 () ValueCell!1283)

(assert (=> mapNonEmpty!5533 (= condMapEmpty!5542 (= mapRest!5533 ((as const (Array (_ BitVec 32) ValueCell!1283)) mapDefault!5542)))))

(assert (=> mapNonEmpty!5533 (= tp!12888 (and e!103333 mapRes!5542))))

(assert (= (and mapNonEmpty!5533 condMapEmpty!5542) mapIsEmpty!5542))

(assert (= (and mapNonEmpty!5533 (not condMapEmpty!5542)) mapNonEmpty!5542))

(assert (= (and mapNonEmpty!5542 ((_ is ValueCellFull!1283) mapValue!5542)) b!157788))

(assert (= (and mapNonEmpty!5533 ((_ is ValueCellFull!1283) mapDefault!5542)) b!157789))

(declare-fun m!191001 () Bool)

(assert (=> mapNonEmpty!5542 m!191001))

(check-sat (not b_next!3451) (not d!51159) (not b!157779) b_and!9879 tp_is_empty!3253 (not b!157781) (not mapNonEmpty!5542) (not b!157780))
(check-sat b_and!9879 (not b_next!3451))
