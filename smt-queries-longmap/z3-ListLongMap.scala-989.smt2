; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21334 () Bool)

(assert start!21334)

(declare-fun b!214596 () Bool)

(declare-fun b_free!5685 () Bool)

(declare-fun b_next!5685 () Bool)

(assert (=> b!214596 (= b_free!5685 (not b_next!5685))))

(declare-fun tp!20149 () Bool)

(declare-fun b_and!12575 () Bool)

(assert (=> b!214596 (= tp!20149 b_and!12575)))

(declare-fun b!214593 () Bool)

(declare-fun res!105043 () Bool)

(declare-fun e!139578 () Bool)

(assert (=> b!214593 (=> (not res!105043) (not e!139578))))

(declare-datatypes ((V!7043 0))(
  ( (V!7044 (val!2818 Int)) )
))
(declare-datatypes ((ValueCell!2430 0))(
  ( (ValueCellFull!2430 (v!4836 V!7043)) (EmptyCell!2430) )
))
(declare-datatypes ((array!10309 0))(
  ( (array!10310 (arr!4888 (Array (_ BitVec 32) ValueCell!2430)) (size!5215 (_ BitVec 32))) )
))
(declare-datatypes ((array!10311 0))(
  ( (array!10312 (arr!4889 (Array (_ BitVec 32) (_ BitVec 64))) (size!5216 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2760 0))(
  ( (LongMapFixedSize!2761 (defaultEntry!4030 Int) (mask!9696 (_ BitVec 32)) (extraKeys!3767 (_ BitVec 32)) (zeroValue!3871 V!7043) (minValue!3871 V!7043) (_size!1429 (_ BitVec 32)) (_keys!6049 array!10311) (_values!4013 array!10309) (_vacant!1429 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2760)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214593 (= res!105043 (validMask!0 (mask!9696 thiss!1504)))))

(declare-fun b!214594 () Bool)

(declare-fun res!105045 () Bool)

(assert (=> b!214594 (=> (not res!105045) (not e!139578))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214594 (= res!105045 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214595 () Bool)

(assert (=> b!214595 (= e!139578 (bvslt (mask!9696 thiss!1504) #b00000000000000000000000000000000))))

(declare-fun e!139580 () Bool)

(declare-fun e!139577 () Bool)

(declare-fun tp_is_empty!5547 () Bool)

(declare-fun array_inv!3233 (array!10311) Bool)

(declare-fun array_inv!3234 (array!10309) Bool)

(assert (=> b!214596 (= e!139580 (and tp!20149 tp_is_empty!5547 (array_inv!3233 (_keys!6049 thiss!1504)) (array_inv!3234 (_values!4013 thiss!1504)) e!139577))))

(declare-fun b!214597 () Bool)

(declare-fun e!139579 () Bool)

(assert (=> b!214597 (= e!139579 tp_is_empty!5547)))

(declare-fun b!214598 () Bool)

(declare-fun e!139576 () Bool)

(assert (=> b!214598 (= e!139576 tp_is_empty!5547)))

(declare-fun res!105044 () Bool)

(assert (=> start!21334 (=> (not res!105044) (not e!139578))))

(declare-fun valid!1129 (LongMapFixedSize!2760) Bool)

(assert (=> start!21334 (= res!105044 (valid!1129 thiss!1504))))

(assert (=> start!21334 e!139578))

(assert (=> start!21334 e!139580))

(assert (=> start!21334 true))

(declare-fun mapNonEmpty!9442 () Bool)

(declare-fun mapRes!9442 () Bool)

(declare-fun tp!20148 () Bool)

(assert (=> mapNonEmpty!9442 (= mapRes!9442 (and tp!20148 e!139576))))

(declare-fun mapKey!9442 () (_ BitVec 32))

(declare-fun mapRest!9442 () (Array (_ BitVec 32) ValueCell!2430))

(declare-fun mapValue!9442 () ValueCell!2430)

(assert (=> mapNonEmpty!9442 (= (arr!4888 (_values!4013 thiss!1504)) (store mapRest!9442 mapKey!9442 mapValue!9442))))

(declare-fun b!214599 () Bool)

(declare-fun res!105046 () Bool)

(assert (=> b!214599 (=> (not res!105046) (not e!139578))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!720 0))(
  ( (MissingZero!720 (index!5050 (_ BitVec 32))) (Found!720 (index!5051 (_ BitVec 32))) (Intermediate!720 (undefined!1532 Bool) (index!5052 (_ BitVec 32)) (x!22379 (_ BitVec 32))) (Undefined!720) (MissingVacant!720 (index!5053 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10311 (_ BitVec 32)) SeekEntryResult!720)

(assert (=> b!214599 (= res!105046 (not (= (seekEntryOrOpen!0 key!932 (_keys!6049 thiss!1504) (mask!9696 thiss!1504)) (MissingZero!720 index!297))))))

(declare-fun b!214600 () Bool)

(assert (=> b!214600 (= e!139577 (and e!139579 mapRes!9442))))

(declare-fun condMapEmpty!9442 () Bool)

(declare-fun mapDefault!9442 () ValueCell!2430)

(assert (=> b!214600 (= condMapEmpty!9442 (= (arr!4888 (_values!4013 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2430)) mapDefault!9442)))))

(declare-fun mapIsEmpty!9442 () Bool)

(assert (=> mapIsEmpty!9442 mapRes!9442))

(assert (= (and start!21334 res!105044) b!214594))

(assert (= (and b!214594 res!105045) b!214599))

(assert (= (and b!214599 res!105046) b!214593))

(assert (= (and b!214593 res!105043) b!214595))

(assert (= (and b!214600 condMapEmpty!9442) mapIsEmpty!9442))

(assert (= (and b!214600 (not condMapEmpty!9442)) mapNonEmpty!9442))

(get-info :version)

(assert (= (and mapNonEmpty!9442 ((_ is ValueCellFull!2430) mapValue!9442)) b!214598))

(assert (= (and b!214600 ((_ is ValueCellFull!2430) mapDefault!9442)) b!214597))

(assert (= b!214596 b!214600))

(assert (= start!21334 b!214596))

(declare-fun m!242201 () Bool)

(assert (=> b!214599 m!242201))

(declare-fun m!242203 () Bool)

(assert (=> start!21334 m!242203))

(declare-fun m!242205 () Bool)

(assert (=> b!214596 m!242205))

(declare-fun m!242207 () Bool)

(assert (=> b!214596 m!242207))

(declare-fun m!242209 () Bool)

(assert (=> b!214593 m!242209))

(declare-fun m!242211 () Bool)

(assert (=> mapNonEmpty!9442 m!242211))

(check-sat tp_is_empty!5547 (not mapNonEmpty!9442) (not b_next!5685) (not b!214599) (not b!214593) (not start!21334) b_and!12575 (not b!214596))
(check-sat b_and!12575 (not b_next!5685))
(get-model)

(declare-fun d!58331 () Bool)

(declare-fun res!105065 () Bool)

(declare-fun e!139602 () Bool)

(assert (=> d!58331 (=> (not res!105065) (not e!139602))))

(declare-fun simpleValid!212 (LongMapFixedSize!2760) Bool)

(assert (=> d!58331 (= res!105065 (simpleValid!212 thiss!1504))))

(assert (=> d!58331 (= (valid!1129 thiss!1504) e!139602)))

(declare-fun b!214631 () Bool)

(declare-fun res!105066 () Bool)

(assert (=> b!214631 (=> (not res!105066) (not e!139602))))

(declare-fun arrayCountValidKeys!0 (array!10311 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214631 (= res!105066 (= (arrayCountValidKeys!0 (_keys!6049 thiss!1504) #b00000000000000000000000000000000 (size!5216 (_keys!6049 thiss!1504))) (_size!1429 thiss!1504)))))

(declare-fun b!214632 () Bool)

(declare-fun res!105067 () Bool)

(assert (=> b!214632 (=> (not res!105067) (not e!139602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10311 (_ BitVec 32)) Bool)

(assert (=> b!214632 (= res!105067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6049 thiss!1504) (mask!9696 thiss!1504)))))

(declare-fun b!214633 () Bool)

(declare-datatypes ((List!3131 0))(
  ( (Nil!3128) (Cons!3127 (h!3769 (_ BitVec 64)) (t!8086 List!3131)) )
))
(declare-fun arrayNoDuplicates!0 (array!10311 (_ BitVec 32) List!3131) Bool)

(assert (=> b!214633 (= e!139602 (arrayNoDuplicates!0 (_keys!6049 thiss!1504) #b00000000000000000000000000000000 Nil!3128))))

(assert (= (and d!58331 res!105065) b!214631))

(assert (= (and b!214631 res!105066) b!214632))

(assert (= (and b!214632 res!105067) b!214633))

(declare-fun m!242225 () Bool)

(assert (=> d!58331 m!242225))

(declare-fun m!242227 () Bool)

(assert (=> b!214631 m!242227))

(declare-fun m!242229 () Bool)

(assert (=> b!214632 m!242229))

(declare-fun m!242231 () Bool)

(assert (=> b!214633 m!242231))

(assert (=> start!21334 d!58331))

(declare-fun d!58333 () Bool)

(assert (=> d!58333 (= (array_inv!3233 (_keys!6049 thiss!1504)) (bvsge (size!5216 (_keys!6049 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214596 d!58333))

(declare-fun d!58335 () Bool)

(assert (=> d!58335 (= (array_inv!3234 (_values!4013 thiss!1504)) (bvsge (size!5215 (_values!4013 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214596 d!58335))

(declare-fun b!214646 () Bool)

(declare-fun c!36065 () Bool)

(declare-fun lt!110806 () (_ BitVec 64))

(assert (=> b!214646 (= c!36065 (= lt!110806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139611 () SeekEntryResult!720)

(declare-fun e!139609 () SeekEntryResult!720)

(assert (=> b!214646 (= e!139611 e!139609)))

(declare-fun b!214647 () Bool)

(declare-fun lt!110807 () SeekEntryResult!720)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10311 (_ BitVec 32)) SeekEntryResult!720)

(assert (=> b!214647 (= e!139609 (seekKeyOrZeroReturnVacant!0 (x!22379 lt!110807) (index!5052 lt!110807) (index!5052 lt!110807) key!932 (_keys!6049 thiss!1504) (mask!9696 thiss!1504)))))

(declare-fun b!214648 () Bool)

(declare-fun e!139610 () SeekEntryResult!720)

(assert (=> b!214648 (= e!139610 e!139611)))

(assert (=> b!214648 (= lt!110806 (select (arr!4889 (_keys!6049 thiss!1504)) (index!5052 lt!110807)))))

(declare-fun c!36064 () Bool)

(assert (=> b!214648 (= c!36064 (= lt!110806 key!932))))

(declare-fun b!214649 () Bool)

(assert (=> b!214649 (= e!139610 Undefined!720)))

(declare-fun d!58337 () Bool)

(declare-fun lt!110808 () SeekEntryResult!720)

(assert (=> d!58337 (and (or ((_ is Undefined!720) lt!110808) (not ((_ is Found!720) lt!110808)) (and (bvsge (index!5051 lt!110808) #b00000000000000000000000000000000) (bvslt (index!5051 lt!110808) (size!5216 (_keys!6049 thiss!1504))))) (or ((_ is Undefined!720) lt!110808) ((_ is Found!720) lt!110808) (not ((_ is MissingZero!720) lt!110808)) (and (bvsge (index!5050 lt!110808) #b00000000000000000000000000000000) (bvslt (index!5050 lt!110808) (size!5216 (_keys!6049 thiss!1504))))) (or ((_ is Undefined!720) lt!110808) ((_ is Found!720) lt!110808) ((_ is MissingZero!720) lt!110808) (not ((_ is MissingVacant!720) lt!110808)) (and (bvsge (index!5053 lt!110808) #b00000000000000000000000000000000) (bvslt (index!5053 lt!110808) (size!5216 (_keys!6049 thiss!1504))))) (or ((_ is Undefined!720) lt!110808) (ite ((_ is Found!720) lt!110808) (= (select (arr!4889 (_keys!6049 thiss!1504)) (index!5051 lt!110808)) key!932) (ite ((_ is MissingZero!720) lt!110808) (= (select (arr!4889 (_keys!6049 thiss!1504)) (index!5050 lt!110808)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!720) lt!110808) (= (select (arr!4889 (_keys!6049 thiss!1504)) (index!5053 lt!110808)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58337 (= lt!110808 e!139610)))

(declare-fun c!36063 () Bool)

(assert (=> d!58337 (= c!36063 (and ((_ is Intermediate!720) lt!110807) (undefined!1532 lt!110807)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10311 (_ BitVec 32)) SeekEntryResult!720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58337 (= lt!110807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9696 thiss!1504)) key!932 (_keys!6049 thiss!1504) (mask!9696 thiss!1504)))))

(assert (=> d!58337 (validMask!0 (mask!9696 thiss!1504))))

(assert (=> d!58337 (= (seekEntryOrOpen!0 key!932 (_keys!6049 thiss!1504) (mask!9696 thiss!1504)) lt!110808)))

(declare-fun b!214650 () Bool)

(assert (=> b!214650 (= e!139609 (MissingZero!720 (index!5052 lt!110807)))))

(declare-fun b!214651 () Bool)

(assert (=> b!214651 (= e!139611 (Found!720 (index!5052 lt!110807)))))

(assert (= (and d!58337 c!36063) b!214649))

(assert (= (and d!58337 (not c!36063)) b!214648))

(assert (= (and b!214648 c!36064) b!214651))

(assert (= (and b!214648 (not c!36064)) b!214646))

(assert (= (and b!214646 c!36065) b!214650))

(assert (= (and b!214646 (not c!36065)) b!214647))

(declare-fun m!242233 () Bool)

(assert (=> b!214647 m!242233))

(declare-fun m!242235 () Bool)

(assert (=> b!214648 m!242235))

(declare-fun m!242237 () Bool)

(assert (=> d!58337 m!242237))

(declare-fun m!242239 () Bool)

(assert (=> d!58337 m!242239))

(declare-fun m!242241 () Bool)

(assert (=> d!58337 m!242241))

(assert (=> d!58337 m!242209))

(assert (=> d!58337 m!242237))

(declare-fun m!242243 () Bool)

(assert (=> d!58337 m!242243))

(declare-fun m!242245 () Bool)

(assert (=> d!58337 m!242245))

(assert (=> b!214599 d!58337))

(declare-fun d!58339 () Bool)

(assert (=> d!58339 (= (validMask!0 (mask!9696 thiss!1504)) (and (or (= (mask!9696 thiss!1504) #b00000000000000000000000000000111) (= (mask!9696 thiss!1504) #b00000000000000000000000000001111) (= (mask!9696 thiss!1504) #b00000000000000000000000000011111) (= (mask!9696 thiss!1504) #b00000000000000000000000000111111) (= (mask!9696 thiss!1504) #b00000000000000000000000001111111) (= (mask!9696 thiss!1504) #b00000000000000000000000011111111) (= (mask!9696 thiss!1504) #b00000000000000000000000111111111) (= (mask!9696 thiss!1504) #b00000000000000000000001111111111) (= (mask!9696 thiss!1504) #b00000000000000000000011111111111) (= (mask!9696 thiss!1504) #b00000000000000000000111111111111) (= (mask!9696 thiss!1504) #b00000000000000000001111111111111) (= (mask!9696 thiss!1504) #b00000000000000000011111111111111) (= (mask!9696 thiss!1504) #b00000000000000000111111111111111) (= (mask!9696 thiss!1504) #b00000000000000001111111111111111) (= (mask!9696 thiss!1504) #b00000000000000011111111111111111) (= (mask!9696 thiss!1504) #b00000000000000111111111111111111) (= (mask!9696 thiss!1504) #b00000000000001111111111111111111) (= (mask!9696 thiss!1504) #b00000000000011111111111111111111) (= (mask!9696 thiss!1504) #b00000000000111111111111111111111) (= (mask!9696 thiss!1504) #b00000000001111111111111111111111) (= (mask!9696 thiss!1504) #b00000000011111111111111111111111) (= (mask!9696 thiss!1504) #b00000000111111111111111111111111) (= (mask!9696 thiss!1504) #b00000001111111111111111111111111) (= (mask!9696 thiss!1504) #b00000011111111111111111111111111) (= (mask!9696 thiss!1504) #b00000111111111111111111111111111) (= (mask!9696 thiss!1504) #b00001111111111111111111111111111) (= (mask!9696 thiss!1504) #b00011111111111111111111111111111) (= (mask!9696 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9696 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214593 d!58339))

(declare-fun mapIsEmpty!9448 () Bool)

(declare-fun mapRes!9448 () Bool)

(assert (=> mapIsEmpty!9448 mapRes!9448))

(declare-fun condMapEmpty!9448 () Bool)

(declare-fun mapDefault!9448 () ValueCell!2430)

(assert (=> mapNonEmpty!9442 (= condMapEmpty!9448 (= mapRest!9442 ((as const (Array (_ BitVec 32) ValueCell!2430)) mapDefault!9448)))))

(declare-fun e!139617 () Bool)

(assert (=> mapNonEmpty!9442 (= tp!20148 (and e!139617 mapRes!9448))))

(declare-fun b!214658 () Bool)

(declare-fun e!139616 () Bool)

(assert (=> b!214658 (= e!139616 tp_is_empty!5547)))

(declare-fun mapNonEmpty!9448 () Bool)

(declare-fun tp!20158 () Bool)

(assert (=> mapNonEmpty!9448 (= mapRes!9448 (and tp!20158 e!139616))))

(declare-fun mapRest!9448 () (Array (_ BitVec 32) ValueCell!2430))

(declare-fun mapValue!9448 () ValueCell!2430)

(declare-fun mapKey!9448 () (_ BitVec 32))

(assert (=> mapNonEmpty!9448 (= mapRest!9442 (store mapRest!9448 mapKey!9448 mapValue!9448))))

(declare-fun b!214659 () Bool)

(assert (=> b!214659 (= e!139617 tp_is_empty!5547)))

(assert (= (and mapNonEmpty!9442 condMapEmpty!9448) mapIsEmpty!9448))

(assert (= (and mapNonEmpty!9442 (not condMapEmpty!9448)) mapNonEmpty!9448))

(assert (= (and mapNonEmpty!9448 ((_ is ValueCellFull!2430) mapValue!9448)) b!214658))

(assert (= (and mapNonEmpty!9442 ((_ is ValueCellFull!2430) mapDefault!9448)) b!214659))

(declare-fun m!242247 () Bool)

(assert (=> mapNonEmpty!9448 m!242247))

(check-sat (not d!58337) b_and!12575 (not b!214647) (not b_next!5685) (not b!214632) (not d!58331) tp_is_empty!5547 (not b!214631) (not b!214633) (not mapNonEmpty!9448))
(check-sat b_and!12575 (not b_next!5685))
