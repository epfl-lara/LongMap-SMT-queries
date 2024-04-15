; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21352 () Bool)

(assert start!21352)

(declare-fun b!214530 () Bool)

(declare-fun b_free!5689 () Bool)

(declare-fun b_next!5689 () Bool)

(assert (=> b!214530 (= b_free!5689 (not b_next!5689))))

(declare-fun tp!20164 () Bool)

(declare-fun b_and!12553 () Bool)

(assert (=> b!214530 (= tp!20164 b_and!12553)))

(declare-fun b!214529 () Bool)

(declare-fun e!139530 () Bool)

(declare-datatypes ((V!7049 0))(
  ( (V!7050 (val!2820 Int)) )
))
(declare-datatypes ((ValueCell!2432 0))(
  ( (ValueCellFull!2432 (v!4832 V!7049)) (EmptyCell!2432) )
))
(declare-datatypes ((array!10311 0))(
  ( (array!10312 (arr!4887 (Array (_ BitVec 32) ValueCell!2432)) (size!5215 (_ BitVec 32))) )
))
(declare-datatypes ((array!10313 0))(
  ( (array!10314 (arr!4888 (Array (_ BitVec 32) (_ BitVec 64))) (size!5216 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2764 0))(
  ( (LongMapFixedSize!2765 (defaultEntry!4032 Int) (mask!9701 (_ BitVec 32)) (extraKeys!3769 (_ BitVec 32)) (zeroValue!3873 V!7049) (minValue!3873 V!7049) (_size!1431 (_ BitVec 32)) (_keys!6051 array!10313) (_values!4015 array!10311) (_vacant!1431 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2764)

(assert (=> b!214529 (= e!139530 (and (bvsge (mask!9701 thiss!1504) #b00000000000000000000000000000000) (not (= (size!5216 (_keys!6051 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9701 thiss!1504))))))))

(declare-fun tp_is_empty!5551 () Bool)

(declare-fun e!139531 () Bool)

(declare-fun e!139534 () Bool)

(declare-fun array_inv!3213 (array!10313) Bool)

(declare-fun array_inv!3214 (array!10311) Bool)

(assert (=> b!214530 (= e!139534 (and tp!20164 tp_is_empty!5551 (array_inv!3213 (_keys!6051 thiss!1504)) (array_inv!3214 (_values!4015 thiss!1504)) e!139531))))

(declare-fun b!214531 () Bool)

(declare-fun res!104984 () Bool)

(assert (=> b!214531 (=> (not res!104984) (not e!139530))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214531 (= res!104984 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214532 () Bool)

(declare-fun res!104982 () Bool)

(assert (=> b!214532 (=> (not res!104982) (not e!139530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214532 (= res!104982 (validMask!0 (mask!9701 thiss!1504)))))

(declare-fun res!104981 () Bool)

(assert (=> start!21352 (=> (not res!104981) (not e!139530))))

(declare-fun valid!1148 (LongMapFixedSize!2764) Bool)

(assert (=> start!21352 (= res!104981 (valid!1148 thiss!1504))))

(assert (=> start!21352 e!139530))

(assert (=> start!21352 e!139534))

(assert (=> start!21352 true))

(declare-fun mapIsEmpty!9451 () Bool)

(declare-fun mapRes!9451 () Bool)

(assert (=> mapIsEmpty!9451 mapRes!9451))

(declare-fun b!214533 () Bool)

(declare-fun e!139533 () Bool)

(assert (=> b!214533 (= e!139531 (and e!139533 mapRes!9451))))

(declare-fun condMapEmpty!9451 () Bool)

(declare-fun mapDefault!9451 () ValueCell!2432)

(assert (=> b!214533 (= condMapEmpty!9451 (= (arr!4887 (_values!4015 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2432)) mapDefault!9451)))))

(declare-fun b!214534 () Bool)

(assert (=> b!214534 (= e!139533 tp_is_empty!5551)))

(declare-fun b!214535 () Bool)

(declare-fun res!104983 () Bool)

(assert (=> b!214535 (=> (not res!104983) (not e!139530))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!721 0))(
  ( (MissingZero!721 (index!5054 (_ BitVec 32))) (Found!721 (index!5055 (_ BitVec 32))) (Intermediate!721 (undefined!1533 Bool) (index!5056 (_ BitVec 32)) (x!22395 (_ BitVec 32))) (Undefined!721) (MissingVacant!721 (index!5057 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10313 (_ BitVec 32)) SeekEntryResult!721)

(assert (=> b!214535 (= res!104983 (not (= (seekEntryOrOpen!0 key!932 (_keys!6051 thiss!1504) (mask!9701 thiss!1504)) (MissingZero!721 index!297))))))

(declare-fun b!214536 () Bool)

(declare-fun e!139529 () Bool)

(assert (=> b!214536 (= e!139529 tp_is_empty!5551)))

(declare-fun mapNonEmpty!9451 () Bool)

(declare-fun tp!20163 () Bool)

(assert (=> mapNonEmpty!9451 (= mapRes!9451 (and tp!20163 e!139529))))

(declare-fun mapKey!9451 () (_ BitVec 32))

(declare-fun mapValue!9451 () ValueCell!2432)

(declare-fun mapRest!9451 () (Array (_ BitVec 32) ValueCell!2432))

(assert (=> mapNonEmpty!9451 (= (arr!4887 (_values!4015 thiss!1504)) (store mapRest!9451 mapKey!9451 mapValue!9451))))

(assert (= (and start!21352 res!104981) b!214531))

(assert (= (and b!214531 res!104984) b!214535))

(assert (= (and b!214535 res!104983) b!214532))

(assert (= (and b!214532 res!104982) b!214529))

(assert (= (and b!214533 condMapEmpty!9451) mapIsEmpty!9451))

(assert (= (and b!214533 (not condMapEmpty!9451)) mapNonEmpty!9451))

(get-info :version)

(assert (= (and mapNonEmpty!9451 ((_ is ValueCellFull!2432) mapValue!9451)) b!214536))

(assert (= (and b!214533 ((_ is ValueCellFull!2432) mapDefault!9451)) b!214534))

(assert (= b!214530 b!214533))

(assert (= start!21352 b!214530))

(declare-fun m!241633 () Bool)

(assert (=> start!21352 m!241633))

(declare-fun m!241635 () Bool)

(assert (=> mapNonEmpty!9451 m!241635))

(declare-fun m!241637 () Bool)

(assert (=> b!214530 m!241637))

(declare-fun m!241639 () Bool)

(assert (=> b!214530 m!241639))

(declare-fun m!241641 () Bool)

(assert (=> b!214535 m!241641))

(declare-fun m!241643 () Bool)

(assert (=> b!214532 m!241643))

(check-sat (not b!214530) tp_is_empty!5551 b_and!12553 (not start!21352) (not b!214535) (not b_next!5689) (not mapNonEmpty!9451) (not b!214532))
(check-sat b_and!12553 (not b_next!5689))
(get-model)

(declare-fun d!58195 () Bool)

(assert (=> d!58195 (= (validMask!0 (mask!9701 thiss!1504)) (and (or (= (mask!9701 thiss!1504) #b00000000000000000000000000000111) (= (mask!9701 thiss!1504) #b00000000000000000000000000001111) (= (mask!9701 thiss!1504) #b00000000000000000000000000011111) (= (mask!9701 thiss!1504) #b00000000000000000000000000111111) (= (mask!9701 thiss!1504) #b00000000000000000000000001111111) (= (mask!9701 thiss!1504) #b00000000000000000000000011111111) (= (mask!9701 thiss!1504) #b00000000000000000000000111111111) (= (mask!9701 thiss!1504) #b00000000000000000000001111111111) (= (mask!9701 thiss!1504) #b00000000000000000000011111111111) (= (mask!9701 thiss!1504) #b00000000000000000000111111111111) (= (mask!9701 thiss!1504) #b00000000000000000001111111111111) (= (mask!9701 thiss!1504) #b00000000000000000011111111111111) (= (mask!9701 thiss!1504) #b00000000000000000111111111111111) (= (mask!9701 thiss!1504) #b00000000000000001111111111111111) (= (mask!9701 thiss!1504) #b00000000000000011111111111111111) (= (mask!9701 thiss!1504) #b00000000000000111111111111111111) (= (mask!9701 thiss!1504) #b00000000000001111111111111111111) (= (mask!9701 thiss!1504) #b00000000000011111111111111111111) (= (mask!9701 thiss!1504) #b00000000000111111111111111111111) (= (mask!9701 thiss!1504) #b00000000001111111111111111111111) (= (mask!9701 thiss!1504) #b00000000011111111111111111111111) (= (mask!9701 thiss!1504) #b00000000111111111111111111111111) (= (mask!9701 thiss!1504) #b00000001111111111111111111111111) (= (mask!9701 thiss!1504) #b00000011111111111111111111111111) (= (mask!9701 thiss!1504) #b00000111111111111111111111111111) (= (mask!9701 thiss!1504) #b00001111111111111111111111111111) (= (mask!9701 thiss!1504) #b00011111111111111111111111111111) (= (mask!9701 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9701 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214532 d!58195))

(declare-fun d!58197 () Bool)

(declare-fun res!105015 () Bool)

(declare-fun e!139573 () Bool)

(assert (=> d!58197 (=> (not res!105015) (not e!139573))))

(declare-fun simpleValid!213 (LongMapFixedSize!2764) Bool)

(assert (=> d!58197 (= res!105015 (simpleValid!213 thiss!1504))))

(assert (=> d!58197 (= (valid!1148 thiss!1504) e!139573)))

(declare-fun b!214591 () Bool)

(declare-fun res!105016 () Bool)

(assert (=> b!214591 (=> (not res!105016) (not e!139573))))

(declare-fun arrayCountValidKeys!0 (array!10313 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214591 (= res!105016 (= (arrayCountValidKeys!0 (_keys!6051 thiss!1504) #b00000000000000000000000000000000 (size!5216 (_keys!6051 thiss!1504))) (_size!1431 thiss!1504)))))

(declare-fun b!214592 () Bool)

(declare-fun res!105017 () Bool)

(assert (=> b!214592 (=> (not res!105017) (not e!139573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10313 (_ BitVec 32)) Bool)

(assert (=> b!214592 (= res!105017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6051 thiss!1504) (mask!9701 thiss!1504)))))

(declare-fun b!214593 () Bool)

(declare-datatypes ((List!3119 0))(
  ( (Nil!3116) (Cons!3115 (h!3757 (_ BitVec 64)) (t!8065 List!3119)) )
))
(declare-fun arrayNoDuplicates!0 (array!10313 (_ BitVec 32) List!3119) Bool)

(assert (=> b!214593 (= e!139573 (arrayNoDuplicates!0 (_keys!6051 thiss!1504) #b00000000000000000000000000000000 Nil!3116))))

(assert (= (and d!58197 res!105015) b!214591))

(assert (= (and b!214591 res!105016) b!214592))

(assert (= (and b!214592 res!105017) b!214593))

(declare-fun m!241669 () Bool)

(assert (=> d!58197 m!241669))

(declare-fun m!241671 () Bool)

(assert (=> b!214591 m!241671))

(declare-fun m!241673 () Bool)

(assert (=> b!214592 m!241673))

(declare-fun m!241675 () Bool)

(assert (=> b!214593 m!241675))

(assert (=> start!21352 d!58197))

(declare-fun d!58199 () Bool)

(assert (=> d!58199 (= (array_inv!3213 (_keys!6051 thiss!1504)) (bvsge (size!5216 (_keys!6051 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214530 d!58199))

(declare-fun d!58201 () Bool)

(assert (=> d!58201 (= (array_inv!3214 (_values!4015 thiss!1504)) (bvsge (size!5215 (_values!4015 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214530 d!58201))

(declare-fun b!214607 () Bool)

(declare-fun e!139580 () SeekEntryResult!721)

(assert (=> b!214607 (= e!139580 Undefined!721)))

(declare-fun b!214608 () Bool)

(declare-fun c!36046 () Bool)

(declare-fun lt!110635 () (_ BitVec 64))

(assert (=> b!214608 (= c!36046 (= lt!110635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139582 () SeekEntryResult!721)

(declare-fun e!139581 () SeekEntryResult!721)

(assert (=> b!214608 (= e!139582 e!139581)))

(declare-fun b!214609 () Bool)

(declare-fun lt!110634 () SeekEntryResult!721)

(assert (=> b!214609 (= e!139581 (MissingZero!721 (index!5056 lt!110634)))))

(declare-fun b!214610 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10313 (_ BitVec 32)) SeekEntryResult!721)

(assert (=> b!214610 (= e!139581 (seekKeyOrZeroReturnVacant!0 (x!22395 lt!110634) (index!5056 lt!110634) (index!5056 lt!110634) key!932 (_keys!6051 thiss!1504) (mask!9701 thiss!1504)))))

(declare-fun b!214611 () Bool)

(assert (=> b!214611 (= e!139582 (Found!721 (index!5056 lt!110634)))))

(declare-fun d!58203 () Bool)

(declare-fun lt!110636 () SeekEntryResult!721)

(assert (=> d!58203 (and (or ((_ is Undefined!721) lt!110636) (not ((_ is Found!721) lt!110636)) (and (bvsge (index!5055 lt!110636) #b00000000000000000000000000000000) (bvslt (index!5055 lt!110636) (size!5216 (_keys!6051 thiss!1504))))) (or ((_ is Undefined!721) lt!110636) ((_ is Found!721) lt!110636) (not ((_ is MissingZero!721) lt!110636)) (and (bvsge (index!5054 lt!110636) #b00000000000000000000000000000000) (bvslt (index!5054 lt!110636) (size!5216 (_keys!6051 thiss!1504))))) (or ((_ is Undefined!721) lt!110636) ((_ is Found!721) lt!110636) ((_ is MissingZero!721) lt!110636) (not ((_ is MissingVacant!721) lt!110636)) (and (bvsge (index!5057 lt!110636) #b00000000000000000000000000000000) (bvslt (index!5057 lt!110636) (size!5216 (_keys!6051 thiss!1504))))) (or ((_ is Undefined!721) lt!110636) (ite ((_ is Found!721) lt!110636) (= (select (arr!4888 (_keys!6051 thiss!1504)) (index!5055 lt!110636)) key!932) (ite ((_ is MissingZero!721) lt!110636) (= (select (arr!4888 (_keys!6051 thiss!1504)) (index!5054 lt!110636)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!721) lt!110636) (= (select (arr!4888 (_keys!6051 thiss!1504)) (index!5057 lt!110636)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58203 (= lt!110636 e!139580)))

(declare-fun c!36048 () Bool)

(assert (=> d!58203 (= c!36048 (and ((_ is Intermediate!721) lt!110634) (undefined!1533 lt!110634)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10313 (_ BitVec 32)) SeekEntryResult!721)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58203 (= lt!110634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9701 thiss!1504)) key!932 (_keys!6051 thiss!1504) (mask!9701 thiss!1504)))))

(assert (=> d!58203 (validMask!0 (mask!9701 thiss!1504))))

(assert (=> d!58203 (= (seekEntryOrOpen!0 key!932 (_keys!6051 thiss!1504) (mask!9701 thiss!1504)) lt!110636)))

(declare-fun b!214606 () Bool)

(assert (=> b!214606 (= e!139580 e!139582)))

(assert (=> b!214606 (= lt!110635 (select (arr!4888 (_keys!6051 thiss!1504)) (index!5056 lt!110634)))))

(declare-fun c!36047 () Bool)

(assert (=> b!214606 (= c!36047 (= lt!110635 key!932))))

(assert (= (and d!58203 c!36048) b!214607))

(assert (= (and d!58203 (not c!36048)) b!214606))

(assert (= (and b!214606 c!36047) b!214611))

(assert (= (and b!214606 (not c!36047)) b!214608))

(assert (= (and b!214608 c!36046) b!214609))

(assert (= (and b!214608 (not c!36046)) b!214610))

(declare-fun m!241677 () Bool)

(assert (=> b!214610 m!241677))

(declare-fun m!241679 () Bool)

(assert (=> d!58203 m!241679))

(declare-fun m!241681 () Bool)

(assert (=> d!58203 m!241681))

(assert (=> d!58203 m!241643))

(declare-fun m!241683 () Bool)

(assert (=> d!58203 m!241683))

(declare-fun m!241685 () Bool)

(assert (=> d!58203 m!241685))

(declare-fun m!241687 () Bool)

(assert (=> d!58203 m!241687))

(assert (=> d!58203 m!241679))

(declare-fun m!241689 () Bool)

(assert (=> b!214606 m!241689))

(assert (=> b!214535 d!58203))

(declare-fun mapNonEmpty!9460 () Bool)

(declare-fun mapRes!9460 () Bool)

(declare-fun tp!20179 () Bool)

(declare-fun e!139588 () Bool)

(assert (=> mapNonEmpty!9460 (= mapRes!9460 (and tp!20179 e!139588))))

(declare-fun mapRest!9460 () (Array (_ BitVec 32) ValueCell!2432))

(declare-fun mapKey!9460 () (_ BitVec 32))

(declare-fun mapValue!9460 () ValueCell!2432)

(assert (=> mapNonEmpty!9460 (= mapRest!9451 (store mapRest!9460 mapKey!9460 mapValue!9460))))

(declare-fun b!214618 () Bool)

(assert (=> b!214618 (= e!139588 tp_is_empty!5551)))

(declare-fun mapIsEmpty!9460 () Bool)

(assert (=> mapIsEmpty!9460 mapRes!9460))

(declare-fun b!214619 () Bool)

(declare-fun e!139587 () Bool)

(assert (=> b!214619 (= e!139587 tp_is_empty!5551)))

(declare-fun condMapEmpty!9460 () Bool)

(declare-fun mapDefault!9460 () ValueCell!2432)

(assert (=> mapNonEmpty!9451 (= condMapEmpty!9460 (= mapRest!9451 ((as const (Array (_ BitVec 32) ValueCell!2432)) mapDefault!9460)))))

(assert (=> mapNonEmpty!9451 (= tp!20163 (and e!139587 mapRes!9460))))

(assert (= (and mapNonEmpty!9451 condMapEmpty!9460) mapIsEmpty!9460))

(assert (= (and mapNonEmpty!9451 (not condMapEmpty!9460)) mapNonEmpty!9460))

(assert (= (and mapNonEmpty!9460 ((_ is ValueCellFull!2432) mapValue!9460)) b!214618))

(assert (= (and mapNonEmpty!9451 ((_ is ValueCellFull!2432) mapDefault!9460)) b!214619))

(declare-fun m!241691 () Bool)

(assert (=> mapNonEmpty!9460 m!241691))

(check-sat (not b!214592) tp_is_empty!5551 b_and!12553 (not d!58197) (not b!214591) (not d!58203) (not mapNonEmpty!9460) (not b_next!5689) (not b!214593) (not b!214610))
(check-sat b_and!12553 (not b_next!5689))
(get-model)

(declare-fun b!214628 () Bool)

(declare-fun e!139594 () (_ BitVec 32))

(declare-fun call!20301 () (_ BitVec 32))

(assert (=> b!214628 (= e!139594 call!20301)))

(declare-fun b!214629 () Bool)

(declare-fun e!139593 () (_ BitVec 32))

(assert (=> b!214629 (= e!139593 e!139594)))

(declare-fun c!36054 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214629 (= c!36054 (validKeyInArray!0 (select (arr!4888 (_keys!6051 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214630 () Bool)

(assert (=> b!214630 (= e!139593 #b00000000000000000000000000000000)))

(declare-fun d!58205 () Bool)

(declare-fun lt!110639 () (_ BitVec 32))

(assert (=> d!58205 (and (bvsge lt!110639 #b00000000000000000000000000000000) (bvsle lt!110639 (bvsub (size!5216 (_keys!6051 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58205 (= lt!110639 e!139593)))

(declare-fun c!36053 () Bool)

(assert (=> d!58205 (= c!36053 (bvsge #b00000000000000000000000000000000 (size!5216 (_keys!6051 thiss!1504))))))

(assert (=> d!58205 (and (bvsle #b00000000000000000000000000000000 (size!5216 (_keys!6051 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5216 (_keys!6051 thiss!1504)) (size!5216 (_keys!6051 thiss!1504))))))

(assert (=> d!58205 (= (arrayCountValidKeys!0 (_keys!6051 thiss!1504) #b00000000000000000000000000000000 (size!5216 (_keys!6051 thiss!1504))) lt!110639)))

(declare-fun bm!20298 () Bool)

(assert (=> bm!20298 (= call!20301 (arrayCountValidKeys!0 (_keys!6051 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5216 (_keys!6051 thiss!1504))))))

(declare-fun b!214631 () Bool)

(assert (=> b!214631 (= e!139594 (bvadd #b00000000000000000000000000000001 call!20301))))

(assert (= (and d!58205 c!36053) b!214630))

(assert (= (and d!58205 (not c!36053)) b!214629))

(assert (= (and b!214629 c!36054) b!214631))

(assert (= (and b!214629 (not c!36054)) b!214628))

(assert (= (or b!214631 b!214628) bm!20298))

(declare-fun m!241693 () Bool)

(assert (=> b!214629 m!241693))

(assert (=> b!214629 m!241693))

(declare-fun m!241695 () Bool)

(assert (=> b!214629 m!241695))

(declare-fun m!241697 () Bool)

(assert (=> bm!20298 m!241697))

(assert (=> b!214591 d!58205))

(declare-fun b!214642 () Bool)

(declare-fun res!105026 () Bool)

(declare-fun e!139597 () Bool)

(assert (=> b!214642 (=> (not res!105026) (not e!139597))))

(declare-fun size!5221 (LongMapFixedSize!2764) (_ BitVec 32))

(assert (=> b!214642 (= res!105026 (= (size!5221 thiss!1504) (bvadd (_size!1431 thiss!1504) (bvsdiv (bvadd (extraKeys!3769 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!58207 () Bool)

(declare-fun res!105027 () Bool)

(assert (=> d!58207 (=> (not res!105027) (not e!139597))))

(assert (=> d!58207 (= res!105027 (validMask!0 (mask!9701 thiss!1504)))))

(assert (=> d!58207 (= (simpleValid!213 thiss!1504) e!139597)))

(declare-fun b!214643 () Bool)

(assert (=> b!214643 (= e!139597 (and (bvsge (extraKeys!3769 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3769 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1431 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!214640 () Bool)

(declare-fun res!105028 () Bool)

(assert (=> b!214640 (=> (not res!105028) (not e!139597))))

(assert (=> b!214640 (= res!105028 (and (= (size!5215 (_values!4015 thiss!1504)) (bvadd (mask!9701 thiss!1504) #b00000000000000000000000000000001)) (= (size!5216 (_keys!6051 thiss!1504)) (size!5215 (_values!4015 thiss!1504))) (bvsge (_size!1431 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1431 thiss!1504) (bvadd (mask!9701 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!214641 () Bool)

(declare-fun res!105029 () Bool)

(assert (=> b!214641 (=> (not res!105029) (not e!139597))))

(assert (=> b!214641 (= res!105029 (bvsge (size!5221 thiss!1504) (_size!1431 thiss!1504)))))

(assert (= (and d!58207 res!105027) b!214640))

(assert (= (and b!214640 res!105028) b!214641))

(assert (= (and b!214641 res!105029) b!214642))

(assert (= (and b!214642 res!105026) b!214643))

(declare-fun m!241699 () Bool)

(assert (=> b!214642 m!241699))

(assert (=> d!58207 m!241643))

(assert (=> b!214641 m!241699))

(assert (=> d!58197 d!58207))

(declare-fun b!214656 () Bool)

(declare-fun e!139605 () SeekEntryResult!721)

(assert (=> b!214656 (= e!139605 (MissingVacant!721 (index!5056 lt!110634)))))

(declare-fun b!214657 () Bool)

(declare-fun e!139604 () SeekEntryResult!721)

(assert (=> b!214657 (= e!139604 Undefined!721)))

(declare-fun b!214658 () Bool)

(declare-fun c!36063 () Bool)

(declare-fun lt!110645 () (_ BitVec 64))

(assert (=> b!214658 (= c!36063 (= lt!110645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139606 () SeekEntryResult!721)

(assert (=> b!214658 (= e!139606 e!139605)))

(declare-fun d!58209 () Bool)

(declare-fun lt!110644 () SeekEntryResult!721)

(assert (=> d!58209 (and (or ((_ is Undefined!721) lt!110644) (not ((_ is Found!721) lt!110644)) (and (bvsge (index!5055 lt!110644) #b00000000000000000000000000000000) (bvslt (index!5055 lt!110644) (size!5216 (_keys!6051 thiss!1504))))) (or ((_ is Undefined!721) lt!110644) ((_ is Found!721) lt!110644) (not ((_ is MissingVacant!721) lt!110644)) (not (= (index!5057 lt!110644) (index!5056 lt!110634))) (and (bvsge (index!5057 lt!110644) #b00000000000000000000000000000000) (bvslt (index!5057 lt!110644) (size!5216 (_keys!6051 thiss!1504))))) (or ((_ is Undefined!721) lt!110644) (ite ((_ is Found!721) lt!110644) (= (select (arr!4888 (_keys!6051 thiss!1504)) (index!5055 lt!110644)) key!932) (and ((_ is MissingVacant!721) lt!110644) (= (index!5057 lt!110644) (index!5056 lt!110634)) (= (select (arr!4888 (_keys!6051 thiss!1504)) (index!5057 lt!110644)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58209 (= lt!110644 e!139604)))

(declare-fun c!36061 () Bool)

(assert (=> d!58209 (= c!36061 (bvsge (x!22395 lt!110634) #b01111111111111111111111111111110))))

(assert (=> d!58209 (= lt!110645 (select (arr!4888 (_keys!6051 thiss!1504)) (index!5056 lt!110634)))))

(assert (=> d!58209 (validMask!0 (mask!9701 thiss!1504))))

(assert (=> d!58209 (= (seekKeyOrZeroReturnVacant!0 (x!22395 lt!110634) (index!5056 lt!110634) (index!5056 lt!110634) key!932 (_keys!6051 thiss!1504) (mask!9701 thiss!1504)) lt!110644)))

(declare-fun b!214659 () Bool)

(assert (=> b!214659 (= e!139604 e!139606)))

(declare-fun c!36062 () Bool)

(assert (=> b!214659 (= c!36062 (= lt!110645 key!932))))

(declare-fun b!214660 () Bool)

(assert (=> b!214660 (= e!139606 (Found!721 (index!5056 lt!110634)))))

(declare-fun b!214661 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214661 (= e!139605 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22395 lt!110634) #b00000000000000000000000000000001) (nextIndex!0 (index!5056 lt!110634) (x!22395 lt!110634) (mask!9701 thiss!1504)) (index!5056 lt!110634) key!932 (_keys!6051 thiss!1504) (mask!9701 thiss!1504)))))

(assert (= (and d!58209 c!36061) b!214657))

(assert (= (and d!58209 (not c!36061)) b!214659))

(assert (= (and b!214659 c!36062) b!214660))

(assert (= (and b!214659 (not c!36062)) b!214658))

(assert (= (and b!214658 c!36063) b!214656))

(assert (= (and b!214658 (not c!36063)) b!214661))

(declare-fun m!241701 () Bool)

(assert (=> d!58209 m!241701))

(declare-fun m!241703 () Bool)

(assert (=> d!58209 m!241703))

(assert (=> d!58209 m!241689))

(assert (=> d!58209 m!241643))

(declare-fun m!241705 () Bool)

(assert (=> b!214661 m!241705))

(assert (=> b!214661 m!241705))

(declare-fun m!241707 () Bool)

(assert (=> b!214661 m!241707))

(assert (=> b!214610 d!58209))

(declare-fun b!214672 () Bool)

(declare-fun e!139615 () Bool)

(declare-fun e!139616 () Bool)

(assert (=> b!214672 (= e!139615 e!139616)))

(declare-fun c!36066 () Bool)

(assert (=> b!214672 (= c!36066 (validKeyInArray!0 (select (arr!4888 (_keys!6051 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214673 () Bool)

(declare-fun call!20304 () Bool)

(assert (=> b!214673 (= e!139616 call!20304)))

(declare-fun d!58211 () Bool)

(declare-fun res!105038 () Bool)

(declare-fun e!139617 () Bool)

(assert (=> d!58211 (=> res!105038 e!139617)))

(assert (=> d!58211 (= res!105038 (bvsge #b00000000000000000000000000000000 (size!5216 (_keys!6051 thiss!1504))))))

(assert (=> d!58211 (= (arrayNoDuplicates!0 (_keys!6051 thiss!1504) #b00000000000000000000000000000000 Nil!3116) e!139617)))

(declare-fun bm!20301 () Bool)

(assert (=> bm!20301 (= call!20304 (arrayNoDuplicates!0 (_keys!6051 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36066 (Cons!3115 (select (arr!4888 (_keys!6051 thiss!1504)) #b00000000000000000000000000000000) Nil!3116) Nil!3116)))))

(declare-fun b!214674 () Bool)

(assert (=> b!214674 (= e!139616 call!20304)))

(declare-fun b!214675 () Bool)

(assert (=> b!214675 (= e!139617 e!139615)))

(declare-fun res!105036 () Bool)

(assert (=> b!214675 (=> (not res!105036) (not e!139615))))

(declare-fun e!139618 () Bool)

(assert (=> b!214675 (= res!105036 (not e!139618))))

(declare-fun res!105037 () Bool)

(assert (=> b!214675 (=> (not res!105037) (not e!139618))))

(assert (=> b!214675 (= res!105037 (validKeyInArray!0 (select (arr!4888 (_keys!6051 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214676 () Bool)

(declare-fun contains!1405 (List!3119 (_ BitVec 64)) Bool)

(assert (=> b!214676 (= e!139618 (contains!1405 Nil!3116 (select (arr!4888 (_keys!6051 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58211 (not res!105038)) b!214675))

(assert (= (and b!214675 res!105037) b!214676))

(assert (= (and b!214675 res!105036) b!214672))

(assert (= (and b!214672 c!36066) b!214674))

(assert (= (and b!214672 (not c!36066)) b!214673))

(assert (= (or b!214674 b!214673) bm!20301))

(assert (=> b!214672 m!241693))

(assert (=> b!214672 m!241693))

(assert (=> b!214672 m!241695))

(assert (=> bm!20301 m!241693))

(declare-fun m!241709 () Bool)

(assert (=> bm!20301 m!241709))

(assert (=> b!214675 m!241693))

(assert (=> b!214675 m!241693))

(assert (=> b!214675 m!241695))

(assert (=> b!214676 m!241693))

(assert (=> b!214676 m!241693))

(declare-fun m!241711 () Bool)

(assert (=> b!214676 m!241711))

(assert (=> b!214593 d!58211))

(declare-fun b!214685 () Bool)

(declare-fun e!139627 () Bool)

(declare-fun e!139626 () Bool)

(assert (=> b!214685 (= e!139627 e!139626)))

(declare-fun lt!110654 () (_ BitVec 64))

(assert (=> b!214685 (= lt!110654 (select (arr!4888 (_keys!6051 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6450 0))(
  ( (Unit!6451) )
))
(declare-fun lt!110652 () Unit!6450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10313 (_ BitVec 64) (_ BitVec 32)) Unit!6450)

(assert (=> b!214685 (= lt!110652 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6051 thiss!1504) lt!110654 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!214685 (arrayContainsKey!0 (_keys!6051 thiss!1504) lt!110654 #b00000000000000000000000000000000)))

(declare-fun lt!110653 () Unit!6450)

(assert (=> b!214685 (= lt!110653 lt!110652)))

(declare-fun res!105044 () Bool)

(assert (=> b!214685 (= res!105044 (= (seekEntryOrOpen!0 (select (arr!4888 (_keys!6051 thiss!1504)) #b00000000000000000000000000000000) (_keys!6051 thiss!1504) (mask!9701 thiss!1504)) (Found!721 #b00000000000000000000000000000000)))))

(assert (=> b!214685 (=> (not res!105044) (not e!139626))))

(declare-fun b!214686 () Bool)

(declare-fun e!139625 () Bool)

(assert (=> b!214686 (= e!139625 e!139627)))

(declare-fun c!36069 () Bool)

(assert (=> b!214686 (= c!36069 (validKeyInArray!0 (select (arr!4888 (_keys!6051 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214687 () Bool)

(declare-fun call!20307 () Bool)

(assert (=> b!214687 (= e!139627 call!20307)))

(declare-fun bm!20304 () Bool)

(assert (=> bm!20304 (= call!20307 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6051 thiss!1504) (mask!9701 thiss!1504)))))

(declare-fun d!58213 () Bool)

(declare-fun res!105043 () Bool)

(assert (=> d!58213 (=> res!105043 e!139625)))

(assert (=> d!58213 (= res!105043 (bvsge #b00000000000000000000000000000000 (size!5216 (_keys!6051 thiss!1504))))))

(assert (=> d!58213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6051 thiss!1504) (mask!9701 thiss!1504)) e!139625)))

(declare-fun b!214688 () Bool)

(assert (=> b!214688 (= e!139626 call!20307)))

(assert (= (and d!58213 (not res!105043)) b!214686))

(assert (= (and b!214686 c!36069) b!214685))

(assert (= (and b!214686 (not c!36069)) b!214687))

(assert (= (and b!214685 res!105044) b!214688))

(assert (= (or b!214688 b!214687) bm!20304))

(assert (=> b!214685 m!241693))

(declare-fun m!241713 () Bool)

(assert (=> b!214685 m!241713))

(declare-fun m!241715 () Bool)

(assert (=> b!214685 m!241715))

(assert (=> b!214685 m!241693))

(declare-fun m!241717 () Bool)

(assert (=> b!214685 m!241717))

(assert (=> b!214686 m!241693))

(assert (=> b!214686 m!241693))

(assert (=> b!214686 m!241695))

(declare-fun m!241719 () Bool)

(assert (=> bm!20304 m!241719))

(assert (=> b!214592 d!58213))

(declare-fun d!58215 () Bool)

(declare-fun e!139639 () Bool)

(assert (=> d!58215 e!139639))

(declare-fun c!36078 () Bool)

(declare-fun lt!110660 () SeekEntryResult!721)

(assert (=> d!58215 (= c!36078 (and ((_ is Intermediate!721) lt!110660) (undefined!1533 lt!110660)))))

(declare-fun e!139638 () SeekEntryResult!721)

(assert (=> d!58215 (= lt!110660 e!139638)))

(declare-fun c!36077 () Bool)

(assert (=> d!58215 (= c!36077 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!110659 () (_ BitVec 64))

(assert (=> d!58215 (= lt!110659 (select (arr!4888 (_keys!6051 thiss!1504)) (toIndex!0 key!932 (mask!9701 thiss!1504))))))

(assert (=> d!58215 (validMask!0 (mask!9701 thiss!1504))))

(assert (=> d!58215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9701 thiss!1504)) key!932 (_keys!6051 thiss!1504) (mask!9701 thiss!1504)) lt!110660)))

(declare-fun b!214707 () Bool)

(declare-fun e!139640 () Bool)

(assert (=> b!214707 (= e!139639 e!139640)))

(declare-fun res!105052 () Bool)

(assert (=> b!214707 (= res!105052 (and ((_ is Intermediate!721) lt!110660) (not (undefined!1533 lt!110660)) (bvslt (x!22395 lt!110660) #b01111111111111111111111111111110) (bvsge (x!22395 lt!110660) #b00000000000000000000000000000000) (bvsge (x!22395 lt!110660) #b00000000000000000000000000000000)))))

(assert (=> b!214707 (=> (not res!105052) (not e!139640))))

(declare-fun b!214708 () Bool)

(assert (=> b!214708 (and (bvsge (index!5056 lt!110660) #b00000000000000000000000000000000) (bvslt (index!5056 lt!110660) (size!5216 (_keys!6051 thiss!1504))))))

(declare-fun res!105051 () Bool)

(assert (=> b!214708 (= res!105051 (= (select (arr!4888 (_keys!6051 thiss!1504)) (index!5056 lt!110660)) key!932))))

(declare-fun e!139641 () Bool)

(assert (=> b!214708 (=> res!105051 e!139641)))

(assert (=> b!214708 (= e!139640 e!139641)))

(declare-fun b!214709 () Bool)

(assert (=> b!214709 (and (bvsge (index!5056 lt!110660) #b00000000000000000000000000000000) (bvslt (index!5056 lt!110660) (size!5216 (_keys!6051 thiss!1504))))))

(declare-fun res!105053 () Bool)

(assert (=> b!214709 (= res!105053 (= (select (arr!4888 (_keys!6051 thiss!1504)) (index!5056 lt!110660)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!214709 (=> res!105053 e!139641)))

(declare-fun b!214710 () Bool)

(assert (=> b!214710 (= e!139638 (Intermediate!721 true (toIndex!0 key!932 (mask!9701 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!214711 () Bool)

(declare-fun e!139642 () SeekEntryResult!721)

(assert (=> b!214711 (= e!139638 e!139642)))

(declare-fun c!36076 () Bool)

(assert (=> b!214711 (= c!36076 (or (= lt!110659 key!932) (= (bvadd lt!110659 lt!110659) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!214712 () Bool)

(assert (=> b!214712 (= e!139642 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9701 thiss!1504)) #b00000000000000000000000000000000 (mask!9701 thiss!1504)) key!932 (_keys!6051 thiss!1504) (mask!9701 thiss!1504)))))

(declare-fun b!214713 () Bool)

(assert (=> b!214713 (= e!139642 (Intermediate!721 false (toIndex!0 key!932 (mask!9701 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!214714 () Bool)

(assert (=> b!214714 (and (bvsge (index!5056 lt!110660) #b00000000000000000000000000000000) (bvslt (index!5056 lt!110660) (size!5216 (_keys!6051 thiss!1504))))))

(assert (=> b!214714 (= e!139641 (= (select (arr!4888 (_keys!6051 thiss!1504)) (index!5056 lt!110660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!214715 () Bool)

(assert (=> b!214715 (= e!139639 (bvsge (x!22395 lt!110660) #b01111111111111111111111111111110))))

(assert (= (and d!58215 c!36077) b!214710))

(assert (= (and d!58215 (not c!36077)) b!214711))

(assert (= (and b!214711 c!36076) b!214713))

(assert (= (and b!214711 (not c!36076)) b!214712))

(assert (= (and d!58215 c!36078) b!214715))

(assert (= (and d!58215 (not c!36078)) b!214707))

(assert (= (and b!214707 res!105052) b!214708))

(assert (= (and b!214708 (not res!105051)) b!214709))

(assert (= (and b!214709 (not res!105053)) b!214714))

(assert (=> d!58215 m!241679))

(declare-fun m!241721 () Bool)

(assert (=> d!58215 m!241721))

(assert (=> d!58215 m!241643))

(declare-fun m!241723 () Bool)

(assert (=> b!214714 m!241723))

(assert (=> b!214709 m!241723))

(assert (=> b!214708 m!241723))

(assert (=> b!214712 m!241679))

(declare-fun m!241725 () Bool)

(assert (=> b!214712 m!241725))

(assert (=> b!214712 m!241725))

(declare-fun m!241727 () Bool)

(assert (=> b!214712 m!241727))

(assert (=> d!58203 d!58215))

(declare-fun d!58217 () Bool)

(declare-fun lt!110666 () (_ BitVec 32))

(declare-fun lt!110665 () (_ BitVec 32))

(assert (=> d!58217 (= lt!110666 (bvmul (bvxor lt!110665 (bvlshr lt!110665 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58217 (= lt!110665 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58217 (and (bvsge (mask!9701 thiss!1504) #b00000000000000000000000000000000) (let ((res!105054 (let ((h!3758 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22412 (bvmul (bvxor h!3758 (bvlshr h!3758 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22412 (bvlshr x!22412 #b00000000000000000000000000001101)) (mask!9701 thiss!1504)))))) (and (bvslt res!105054 (bvadd (mask!9701 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105054 #b00000000000000000000000000000000))))))

(assert (=> d!58217 (= (toIndex!0 key!932 (mask!9701 thiss!1504)) (bvand (bvxor lt!110666 (bvlshr lt!110666 #b00000000000000000000000000001101)) (mask!9701 thiss!1504)))))

(assert (=> d!58203 d!58217))

(assert (=> d!58203 d!58195))

(declare-fun mapNonEmpty!9461 () Bool)

(declare-fun mapRes!9461 () Bool)

(declare-fun tp!20180 () Bool)

(declare-fun e!139644 () Bool)

(assert (=> mapNonEmpty!9461 (= mapRes!9461 (and tp!20180 e!139644))))

(declare-fun mapKey!9461 () (_ BitVec 32))

(declare-fun mapValue!9461 () ValueCell!2432)

(declare-fun mapRest!9461 () (Array (_ BitVec 32) ValueCell!2432))

(assert (=> mapNonEmpty!9461 (= mapRest!9460 (store mapRest!9461 mapKey!9461 mapValue!9461))))

(declare-fun b!214716 () Bool)

(assert (=> b!214716 (= e!139644 tp_is_empty!5551)))

(declare-fun mapIsEmpty!9461 () Bool)

(assert (=> mapIsEmpty!9461 mapRes!9461))

(declare-fun b!214717 () Bool)

(declare-fun e!139643 () Bool)

(assert (=> b!214717 (= e!139643 tp_is_empty!5551)))

(declare-fun condMapEmpty!9461 () Bool)

(declare-fun mapDefault!9461 () ValueCell!2432)

(assert (=> mapNonEmpty!9460 (= condMapEmpty!9461 (= mapRest!9460 ((as const (Array (_ BitVec 32) ValueCell!2432)) mapDefault!9461)))))

(assert (=> mapNonEmpty!9460 (= tp!20179 (and e!139643 mapRes!9461))))

(assert (= (and mapNonEmpty!9460 condMapEmpty!9461) mapIsEmpty!9461))

(assert (= (and mapNonEmpty!9460 (not condMapEmpty!9461)) mapNonEmpty!9461))

(assert (= (and mapNonEmpty!9461 ((_ is ValueCellFull!2432) mapValue!9461)) b!214716))

(assert (= (and mapNonEmpty!9460 ((_ is ValueCellFull!2432) mapDefault!9461)) b!214717))

(declare-fun m!241729 () Bool)

(assert (=> mapNonEmpty!9461 m!241729))

(check-sat b_and!12553 (not b!214642) (not d!58209) (not b!214641) (not b_next!5689) (not b!214686) (not bm!20304) (not b!214676) (not b!214672) (not b!214675) (not d!58215) (not mapNonEmpty!9461) (not b!214629) tp_is_empty!5551 (not b!214712) (not b!214685) (not d!58207) (not bm!20301) (not bm!20298) (not b!214661))
(check-sat b_and!12553 (not b_next!5689))
