; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21490 () Bool)

(assert start!21490)

(declare-fun b!215638 () Bool)

(declare-fun b_free!5727 () Bool)

(declare-fun b_next!5727 () Bool)

(assert (=> b!215638 (= b_free!5727 (not b_next!5727))))

(declare-fun tp!20299 () Bool)

(declare-fun b_and!12617 () Bool)

(assert (=> b!215638 (= tp!20299 b_and!12617)))

(declare-fun b!215636 () Bool)

(declare-fun e!140293 () Bool)

(declare-fun tp_is_empty!5589 () Bool)

(assert (=> b!215636 (= e!140293 tp_is_empty!5589)))

(declare-fun b!215637 () Bool)

(declare-fun e!140295 () Bool)

(assert (=> b!215637 (= e!140295 tp_is_empty!5589)))

(declare-fun e!140294 () Bool)

(declare-datatypes ((V!7099 0))(
  ( (V!7100 (val!2839 Int)) )
))
(declare-datatypes ((ValueCell!2451 0))(
  ( (ValueCellFull!2451 (v!4857 V!7099)) (EmptyCell!2451) )
))
(declare-datatypes ((array!10407 0))(
  ( (array!10408 (arr!4930 (Array (_ BitVec 32) ValueCell!2451)) (size!5260 (_ BitVec 32))) )
))
(declare-datatypes ((array!10409 0))(
  ( (array!10410 (arr!4931 (Array (_ BitVec 32) (_ BitVec 64))) (size!5261 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2802 0))(
  ( (LongMapFixedSize!2803 (defaultEntry!4051 Int) (mask!9757 (_ BitVec 32)) (extraKeys!3788 (_ BitVec 32)) (zeroValue!3892 V!7099) (minValue!3892 V!7099) (_size!1450 (_ BitVec 32)) (_keys!6086 array!10409) (_values!4034 array!10407) (_vacant!1450 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2802)

(declare-fun e!140291 () Bool)

(declare-fun array_inv!3263 (array!10409) Bool)

(declare-fun array_inv!3264 (array!10407) Bool)

(assert (=> b!215638 (= e!140291 (and tp!20299 tp_is_empty!5589 (array_inv!3263 (_keys!6086 thiss!1504)) (array_inv!3264 (_values!4034 thiss!1504)) e!140294))))

(declare-fun res!105470 () Bool)

(declare-fun e!140290 () Bool)

(assert (=> start!21490 (=> (not res!105470) (not e!140290))))

(declare-fun valid!1141 (LongMapFixedSize!2802) Bool)

(assert (=> start!21490 (= res!105470 (valid!1141 thiss!1504))))

(assert (=> start!21490 e!140290))

(assert (=> start!21490 e!140291))

(assert (=> start!21490 true))

(declare-fun b!215639 () Bool)

(declare-fun res!105472 () Bool)

(assert (=> b!215639 (=> (not res!105472) (not e!140290))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215639 (= res!105472 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!215640 () Bool)

(declare-fun mapRes!9529 () Bool)

(assert (=> b!215640 (= e!140294 (and e!140293 mapRes!9529))))

(declare-fun condMapEmpty!9529 () Bool)

(declare-fun mapDefault!9529 () ValueCell!2451)

(assert (=> b!215640 (= condMapEmpty!9529 (= (arr!4930 (_values!4034 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2451)) mapDefault!9529)))))

(declare-fun mapNonEmpty!9529 () Bool)

(declare-fun tp!20298 () Bool)

(assert (=> mapNonEmpty!9529 (= mapRes!9529 (and tp!20298 e!140295))))

(declare-fun mapValue!9529 () ValueCell!2451)

(declare-fun mapRest!9529 () (Array (_ BitVec 32) ValueCell!2451))

(declare-fun mapKey!9529 () (_ BitVec 32))

(assert (=> mapNonEmpty!9529 (= (arr!4930 (_values!4034 thiss!1504)) (store mapRest!9529 mapKey!9529 mapValue!9529))))

(declare-fun mapIsEmpty!9529 () Bool)

(assert (=> mapIsEmpty!9529 mapRes!9529))

(declare-fun b!215641 () Bool)

(declare-fun e!140292 () Bool)

(assert (=> b!215641 (= e!140290 e!140292)))

(declare-fun res!105471 () Bool)

(assert (=> b!215641 (=> (not res!105471) (not e!140292))))

(declare-datatypes ((SeekEntryResult!734 0))(
  ( (MissingZero!734 (index!5106 (_ BitVec 32))) (Found!734 (index!5107 (_ BitVec 32))) (Intermediate!734 (undefined!1546 Bool) (index!5108 (_ BitVec 32)) (x!22532 (_ BitVec 32))) (Undefined!734) (MissingVacant!734 (index!5109 (_ BitVec 32))) )
))
(declare-fun lt!110994 () SeekEntryResult!734)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215641 (= res!105471 (or (= lt!110994 (MissingZero!734 index!297)) (= lt!110994 (MissingVacant!734 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10409 (_ BitVec 32)) SeekEntryResult!734)

(assert (=> b!215641 (= lt!110994 (seekEntryOrOpen!0 key!932 (_keys!6086 thiss!1504) (mask!9757 thiss!1504)))))

(declare-fun b!215642 () Bool)

(assert (=> b!215642 (= e!140292 (and (= (size!5260 (_values!4034 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9757 thiss!1504))) (= (size!5261 (_keys!6086 thiss!1504)) (size!5260 (_values!4034 thiss!1504))) (bvsge (mask!9757 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3788 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215643 () Bool)

(declare-fun res!105469 () Bool)

(assert (=> b!215643 (=> (not res!105469) (not e!140292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215643 (= res!105469 (validMask!0 (mask!9757 thiss!1504)))))

(assert (= (and start!21490 res!105470) b!215639))

(assert (= (and b!215639 res!105472) b!215641))

(assert (= (and b!215641 res!105471) b!215643))

(assert (= (and b!215643 res!105469) b!215642))

(assert (= (and b!215640 condMapEmpty!9529) mapIsEmpty!9529))

(assert (= (and b!215640 (not condMapEmpty!9529)) mapNonEmpty!9529))

(get-info :version)

(assert (= (and mapNonEmpty!9529 ((_ is ValueCellFull!2451) mapValue!9529)) b!215637))

(assert (= (and b!215640 ((_ is ValueCellFull!2451) mapDefault!9529)) b!215636))

(assert (= b!215638 b!215640))

(assert (= start!21490 b!215638))

(declare-fun m!242741 () Bool)

(assert (=> mapNonEmpty!9529 m!242741))

(declare-fun m!242743 () Bool)

(assert (=> b!215643 m!242743))

(declare-fun m!242745 () Bool)

(assert (=> start!21490 m!242745))

(declare-fun m!242747 () Bool)

(assert (=> b!215641 m!242747))

(declare-fun m!242749 () Bool)

(assert (=> b!215638 m!242749))

(declare-fun m!242751 () Bool)

(assert (=> b!215638 m!242751))

(check-sat b_and!12617 (not b!215638) (not b!215643) (not b!215641) (not b_next!5727) tp_is_empty!5589 (not start!21490) (not mapNonEmpty!9529))
(check-sat b_and!12617 (not b_next!5727))
(get-model)

(declare-fun d!58459 () Bool)

(assert (=> d!58459 (= (array_inv!3263 (_keys!6086 thiss!1504)) (bvsge (size!5261 (_keys!6086 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215638 d!58459))

(declare-fun d!58461 () Bool)

(assert (=> d!58461 (= (array_inv!3264 (_values!4034 thiss!1504)) (bvsge (size!5260 (_values!4034 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215638 d!58461))

(declare-fun b!215680 () Bool)

(declare-fun e!140324 () SeekEntryResult!734)

(assert (=> b!215680 (= e!140324 Undefined!734)))

(declare-fun b!215681 () Bool)

(declare-fun c!36218 () Bool)

(declare-fun lt!111005 () (_ BitVec 64))

(assert (=> b!215681 (= c!36218 (= lt!111005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140325 () SeekEntryResult!734)

(declare-fun e!140323 () SeekEntryResult!734)

(assert (=> b!215681 (= e!140325 e!140323)))

(declare-fun b!215682 () Bool)

(declare-fun lt!111004 () SeekEntryResult!734)

(assert (=> b!215682 (= e!140323 (MissingZero!734 (index!5108 lt!111004)))))

(declare-fun b!215683 () Bool)

(assert (=> b!215683 (= e!140325 (Found!734 (index!5108 lt!111004)))))

(declare-fun d!58463 () Bool)

(declare-fun lt!111006 () SeekEntryResult!734)

(assert (=> d!58463 (and (or ((_ is Undefined!734) lt!111006) (not ((_ is Found!734) lt!111006)) (and (bvsge (index!5107 lt!111006) #b00000000000000000000000000000000) (bvslt (index!5107 lt!111006) (size!5261 (_keys!6086 thiss!1504))))) (or ((_ is Undefined!734) lt!111006) ((_ is Found!734) lt!111006) (not ((_ is MissingZero!734) lt!111006)) (and (bvsge (index!5106 lt!111006) #b00000000000000000000000000000000) (bvslt (index!5106 lt!111006) (size!5261 (_keys!6086 thiss!1504))))) (or ((_ is Undefined!734) lt!111006) ((_ is Found!734) lt!111006) ((_ is MissingZero!734) lt!111006) (not ((_ is MissingVacant!734) lt!111006)) (and (bvsge (index!5109 lt!111006) #b00000000000000000000000000000000) (bvslt (index!5109 lt!111006) (size!5261 (_keys!6086 thiss!1504))))) (or ((_ is Undefined!734) lt!111006) (ite ((_ is Found!734) lt!111006) (= (select (arr!4931 (_keys!6086 thiss!1504)) (index!5107 lt!111006)) key!932) (ite ((_ is MissingZero!734) lt!111006) (= (select (arr!4931 (_keys!6086 thiss!1504)) (index!5106 lt!111006)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!734) lt!111006) (= (select (arr!4931 (_keys!6086 thiss!1504)) (index!5109 lt!111006)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58463 (= lt!111006 e!140324)))

(declare-fun c!36216 () Bool)

(assert (=> d!58463 (= c!36216 (and ((_ is Intermediate!734) lt!111004) (undefined!1546 lt!111004)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10409 (_ BitVec 32)) SeekEntryResult!734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58463 (= lt!111004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9757 thiss!1504)) key!932 (_keys!6086 thiss!1504) (mask!9757 thiss!1504)))))

(assert (=> d!58463 (validMask!0 (mask!9757 thiss!1504))))

(assert (=> d!58463 (= (seekEntryOrOpen!0 key!932 (_keys!6086 thiss!1504) (mask!9757 thiss!1504)) lt!111006)))

(declare-fun b!215684 () Bool)

(assert (=> b!215684 (= e!140324 e!140325)))

(assert (=> b!215684 (= lt!111005 (select (arr!4931 (_keys!6086 thiss!1504)) (index!5108 lt!111004)))))

(declare-fun c!36217 () Bool)

(assert (=> b!215684 (= c!36217 (= lt!111005 key!932))))

(declare-fun b!215685 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10409 (_ BitVec 32)) SeekEntryResult!734)

(assert (=> b!215685 (= e!140323 (seekKeyOrZeroReturnVacant!0 (x!22532 lt!111004) (index!5108 lt!111004) (index!5108 lt!111004) key!932 (_keys!6086 thiss!1504) (mask!9757 thiss!1504)))))

(assert (= (and d!58463 c!36216) b!215680))

(assert (= (and d!58463 (not c!36216)) b!215684))

(assert (= (and b!215684 c!36217) b!215683))

(assert (= (and b!215684 (not c!36217)) b!215681))

(assert (= (and b!215681 c!36218) b!215682))

(assert (= (and b!215681 (not c!36218)) b!215685))

(declare-fun m!242765 () Bool)

(assert (=> d!58463 m!242765))

(declare-fun m!242767 () Bool)

(assert (=> d!58463 m!242767))

(assert (=> d!58463 m!242743))

(declare-fun m!242769 () Bool)

(assert (=> d!58463 m!242769))

(assert (=> d!58463 m!242765))

(declare-fun m!242771 () Bool)

(assert (=> d!58463 m!242771))

(declare-fun m!242773 () Bool)

(assert (=> d!58463 m!242773))

(declare-fun m!242775 () Bool)

(assert (=> b!215684 m!242775))

(declare-fun m!242777 () Bool)

(assert (=> b!215685 m!242777))

(assert (=> b!215641 d!58463))

(declare-fun d!58465 () Bool)

(declare-fun res!105491 () Bool)

(declare-fun e!140328 () Bool)

(assert (=> d!58465 (=> (not res!105491) (not e!140328))))

(declare-fun simpleValid!219 (LongMapFixedSize!2802) Bool)

(assert (=> d!58465 (= res!105491 (simpleValid!219 thiss!1504))))

(assert (=> d!58465 (= (valid!1141 thiss!1504) e!140328)))

(declare-fun b!215692 () Bool)

(declare-fun res!105492 () Bool)

(assert (=> b!215692 (=> (not res!105492) (not e!140328))))

(declare-fun arrayCountValidKeys!0 (array!10409 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215692 (= res!105492 (= (arrayCountValidKeys!0 (_keys!6086 thiss!1504) #b00000000000000000000000000000000 (size!5261 (_keys!6086 thiss!1504))) (_size!1450 thiss!1504)))))

(declare-fun b!215693 () Bool)

(declare-fun res!105493 () Bool)

(assert (=> b!215693 (=> (not res!105493) (not e!140328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10409 (_ BitVec 32)) Bool)

(assert (=> b!215693 (= res!105493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6086 thiss!1504) (mask!9757 thiss!1504)))))

(declare-fun b!215694 () Bool)

(declare-datatypes ((List!3138 0))(
  ( (Nil!3135) (Cons!3134 (h!3779 (_ BitVec 64)) (t!8093 List!3138)) )
))
(declare-fun arrayNoDuplicates!0 (array!10409 (_ BitVec 32) List!3138) Bool)

(assert (=> b!215694 (= e!140328 (arrayNoDuplicates!0 (_keys!6086 thiss!1504) #b00000000000000000000000000000000 Nil!3135))))

(assert (= (and d!58465 res!105491) b!215692))

(assert (= (and b!215692 res!105492) b!215693))

(assert (= (and b!215693 res!105493) b!215694))

(declare-fun m!242779 () Bool)

(assert (=> d!58465 m!242779))

(declare-fun m!242781 () Bool)

(assert (=> b!215692 m!242781))

(declare-fun m!242783 () Bool)

(assert (=> b!215693 m!242783))

(declare-fun m!242785 () Bool)

(assert (=> b!215694 m!242785))

(assert (=> start!21490 d!58465))

(declare-fun d!58467 () Bool)

(assert (=> d!58467 (= (validMask!0 (mask!9757 thiss!1504)) (and (or (= (mask!9757 thiss!1504) #b00000000000000000000000000000111) (= (mask!9757 thiss!1504) #b00000000000000000000000000001111) (= (mask!9757 thiss!1504) #b00000000000000000000000000011111) (= (mask!9757 thiss!1504) #b00000000000000000000000000111111) (= (mask!9757 thiss!1504) #b00000000000000000000000001111111) (= (mask!9757 thiss!1504) #b00000000000000000000000011111111) (= (mask!9757 thiss!1504) #b00000000000000000000000111111111) (= (mask!9757 thiss!1504) #b00000000000000000000001111111111) (= (mask!9757 thiss!1504) #b00000000000000000000011111111111) (= (mask!9757 thiss!1504) #b00000000000000000000111111111111) (= (mask!9757 thiss!1504) #b00000000000000000001111111111111) (= (mask!9757 thiss!1504) #b00000000000000000011111111111111) (= (mask!9757 thiss!1504) #b00000000000000000111111111111111) (= (mask!9757 thiss!1504) #b00000000000000001111111111111111) (= (mask!9757 thiss!1504) #b00000000000000011111111111111111) (= (mask!9757 thiss!1504) #b00000000000000111111111111111111) (= (mask!9757 thiss!1504) #b00000000000001111111111111111111) (= (mask!9757 thiss!1504) #b00000000000011111111111111111111) (= (mask!9757 thiss!1504) #b00000000000111111111111111111111) (= (mask!9757 thiss!1504) #b00000000001111111111111111111111) (= (mask!9757 thiss!1504) #b00000000011111111111111111111111) (= (mask!9757 thiss!1504) #b00000000111111111111111111111111) (= (mask!9757 thiss!1504) #b00000001111111111111111111111111) (= (mask!9757 thiss!1504) #b00000011111111111111111111111111) (= (mask!9757 thiss!1504) #b00000111111111111111111111111111) (= (mask!9757 thiss!1504) #b00001111111111111111111111111111) (= (mask!9757 thiss!1504) #b00011111111111111111111111111111) (= (mask!9757 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9757 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215643 d!58467))

(declare-fun b!215702 () Bool)

(declare-fun e!140334 () Bool)

(assert (=> b!215702 (= e!140334 tp_is_empty!5589)))

(declare-fun mapNonEmpty!9535 () Bool)

(declare-fun mapRes!9535 () Bool)

(declare-fun tp!20308 () Bool)

(declare-fun e!140333 () Bool)

(assert (=> mapNonEmpty!9535 (= mapRes!9535 (and tp!20308 e!140333))))

(declare-fun mapKey!9535 () (_ BitVec 32))

(declare-fun mapRest!9535 () (Array (_ BitVec 32) ValueCell!2451))

(declare-fun mapValue!9535 () ValueCell!2451)

(assert (=> mapNonEmpty!9535 (= mapRest!9529 (store mapRest!9535 mapKey!9535 mapValue!9535))))

(declare-fun b!215701 () Bool)

(assert (=> b!215701 (= e!140333 tp_is_empty!5589)))

(declare-fun mapIsEmpty!9535 () Bool)

(assert (=> mapIsEmpty!9535 mapRes!9535))

(declare-fun condMapEmpty!9535 () Bool)

(declare-fun mapDefault!9535 () ValueCell!2451)

(assert (=> mapNonEmpty!9529 (= condMapEmpty!9535 (= mapRest!9529 ((as const (Array (_ BitVec 32) ValueCell!2451)) mapDefault!9535)))))

(assert (=> mapNonEmpty!9529 (= tp!20298 (and e!140334 mapRes!9535))))

(assert (= (and mapNonEmpty!9529 condMapEmpty!9535) mapIsEmpty!9535))

(assert (= (and mapNonEmpty!9529 (not condMapEmpty!9535)) mapNonEmpty!9535))

(assert (= (and mapNonEmpty!9535 ((_ is ValueCellFull!2451) mapValue!9535)) b!215701))

(assert (= (and mapNonEmpty!9529 ((_ is ValueCellFull!2451) mapDefault!9535)) b!215702))

(declare-fun m!242787 () Bool)

(assert (=> mapNonEmpty!9535 m!242787))

(check-sat (not b!215694) b_and!12617 (not b!215693) (not mapNonEmpty!9535) (not d!58463) (not d!58465) (not b!215692) (not b_next!5727) (not b!215685) tp_is_empty!5589)
(check-sat b_and!12617 (not b_next!5727))
(get-model)

(declare-fun b!215713 () Bool)

(declare-fun e!140345 () Bool)

(declare-fun call!20352 () Bool)

(assert (=> b!215713 (= e!140345 call!20352)))

(declare-fun b!215714 () Bool)

(declare-fun e!140346 () Bool)

(declare-fun e!140344 () Bool)

(assert (=> b!215714 (= e!140346 e!140344)))

(declare-fun res!105500 () Bool)

(assert (=> b!215714 (=> (not res!105500) (not e!140344))))

(declare-fun e!140343 () Bool)

(assert (=> b!215714 (= res!105500 (not e!140343))))

(declare-fun res!105501 () Bool)

(assert (=> b!215714 (=> (not res!105501) (not e!140343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215714 (= res!105501 (validKeyInArray!0 (select (arr!4931 (_keys!6086 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58469 () Bool)

(declare-fun res!105502 () Bool)

(assert (=> d!58469 (=> res!105502 e!140346)))

(assert (=> d!58469 (= res!105502 (bvsge #b00000000000000000000000000000000 (size!5261 (_keys!6086 thiss!1504))))))

(assert (=> d!58469 (= (arrayNoDuplicates!0 (_keys!6086 thiss!1504) #b00000000000000000000000000000000 Nil!3135) e!140346)))

(declare-fun b!215715 () Bool)

(declare-fun contains!1430 (List!3138 (_ BitVec 64)) Bool)

(assert (=> b!215715 (= e!140343 (contains!1430 Nil!3135 (select (arr!4931 (_keys!6086 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215716 () Bool)

(assert (=> b!215716 (= e!140345 call!20352)))

(declare-fun bm!20349 () Bool)

(declare-fun c!36221 () Bool)

(assert (=> bm!20349 (= call!20352 (arrayNoDuplicates!0 (_keys!6086 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36221 (Cons!3134 (select (arr!4931 (_keys!6086 thiss!1504)) #b00000000000000000000000000000000) Nil!3135) Nil!3135)))))

(declare-fun b!215717 () Bool)

(assert (=> b!215717 (= e!140344 e!140345)))

(assert (=> b!215717 (= c!36221 (validKeyInArray!0 (select (arr!4931 (_keys!6086 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58469 (not res!105502)) b!215714))

(assert (= (and b!215714 res!105501) b!215715))

(assert (= (and b!215714 res!105500) b!215717))

(assert (= (and b!215717 c!36221) b!215716))

(assert (= (and b!215717 (not c!36221)) b!215713))

(assert (= (or b!215716 b!215713) bm!20349))

(declare-fun m!242789 () Bool)

(assert (=> b!215714 m!242789))

(assert (=> b!215714 m!242789))

(declare-fun m!242791 () Bool)

(assert (=> b!215714 m!242791))

(assert (=> b!215715 m!242789))

(assert (=> b!215715 m!242789))

(declare-fun m!242793 () Bool)

(assert (=> b!215715 m!242793))

(assert (=> bm!20349 m!242789))

(declare-fun m!242795 () Bool)

(assert (=> bm!20349 m!242795))

(assert (=> b!215717 m!242789))

(assert (=> b!215717 m!242789))

(assert (=> b!215717 m!242791))

(assert (=> b!215694 d!58469))

(declare-fun d!58471 () Bool)

(declare-fun res!105514 () Bool)

(declare-fun e!140349 () Bool)

(assert (=> d!58471 (=> (not res!105514) (not e!140349))))

(assert (=> d!58471 (= res!105514 (validMask!0 (mask!9757 thiss!1504)))))

(assert (=> d!58471 (= (simpleValid!219 thiss!1504) e!140349)))

(declare-fun b!215727 () Bool)

(declare-fun res!105513 () Bool)

(assert (=> b!215727 (=> (not res!105513) (not e!140349))))

(declare-fun size!5264 (LongMapFixedSize!2802) (_ BitVec 32))

(assert (=> b!215727 (= res!105513 (bvsge (size!5264 thiss!1504) (_size!1450 thiss!1504)))))

(declare-fun b!215729 () Bool)

(assert (=> b!215729 (= e!140349 (and (bvsge (extraKeys!3788 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3788 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1450 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215726 () Bool)

(declare-fun res!105512 () Bool)

(assert (=> b!215726 (=> (not res!105512) (not e!140349))))

(assert (=> b!215726 (= res!105512 (and (= (size!5260 (_values!4034 thiss!1504)) (bvadd (mask!9757 thiss!1504) #b00000000000000000000000000000001)) (= (size!5261 (_keys!6086 thiss!1504)) (size!5260 (_values!4034 thiss!1504))) (bvsge (_size!1450 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1450 thiss!1504) (bvadd (mask!9757 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!215728 () Bool)

(declare-fun res!105511 () Bool)

(assert (=> b!215728 (=> (not res!105511) (not e!140349))))

(assert (=> b!215728 (= res!105511 (= (size!5264 thiss!1504) (bvadd (_size!1450 thiss!1504) (bvsdiv (bvadd (extraKeys!3788 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!58471 res!105514) b!215726))

(assert (= (and b!215726 res!105512) b!215727))

(assert (= (and b!215727 res!105513) b!215728))

(assert (= (and b!215728 res!105511) b!215729))

(assert (=> d!58471 m!242743))

(declare-fun m!242797 () Bool)

(assert (=> b!215727 m!242797))

(assert (=> b!215728 m!242797))

(assert (=> d!58465 d!58471))

(declare-fun b!215742 () Bool)

(declare-fun c!36228 () Bool)

(declare-fun lt!111011 () (_ BitVec 64))

(assert (=> b!215742 (= c!36228 (= lt!111011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140357 () SeekEntryResult!734)

(declare-fun e!140358 () SeekEntryResult!734)

(assert (=> b!215742 (= e!140357 e!140358)))

(declare-fun b!215743 () Bool)

(declare-fun e!140356 () SeekEntryResult!734)

(assert (=> b!215743 (= e!140356 Undefined!734)))

(declare-fun b!215744 () Bool)

(assert (=> b!215744 (= e!140356 e!140357)))

(declare-fun c!36229 () Bool)

(assert (=> b!215744 (= c!36229 (= lt!111011 key!932))))

(declare-fun b!215745 () Bool)

(assert (=> b!215745 (= e!140358 (MissingVacant!734 (index!5108 lt!111004)))))

(declare-fun b!215746 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215746 (= e!140358 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22532 lt!111004) #b00000000000000000000000000000001) (nextIndex!0 (index!5108 lt!111004) (x!22532 lt!111004) (mask!9757 thiss!1504)) (index!5108 lt!111004) key!932 (_keys!6086 thiss!1504) (mask!9757 thiss!1504)))))

(declare-fun lt!111012 () SeekEntryResult!734)

(declare-fun d!58473 () Bool)

(assert (=> d!58473 (and (or ((_ is Undefined!734) lt!111012) (not ((_ is Found!734) lt!111012)) (and (bvsge (index!5107 lt!111012) #b00000000000000000000000000000000) (bvslt (index!5107 lt!111012) (size!5261 (_keys!6086 thiss!1504))))) (or ((_ is Undefined!734) lt!111012) ((_ is Found!734) lt!111012) (not ((_ is MissingVacant!734) lt!111012)) (not (= (index!5109 lt!111012) (index!5108 lt!111004))) (and (bvsge (index!5109 lt!111012) #b00000000000000000000000000000000) (bvslt (index!5109 lt!111012) (size!5261 (_keys!6086 thiss!1504))))) (or ((_ is Undefined!734) lt!111012) (ite ((_ is Found!734) lt!111012) (= (select (arr!4931 (_keys!6086 thiss!1504)) (index!5107 lt!111012)) key!932) (and ((_ is MissingVacant!734) lt!111012) (= (index!5109 lt!111012) (index!5108 lt!111004)) (= (select (arr!4931 (_keys!6086 thiss!1504)) (index!5109 lt!111012)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58473 (= lt!111012 e!140356)))

(declare-fun c!36230 () Bool)

(assert (=> d!58473 (= c!36230 (bvsge (x!22532 lt!111004) #b01111111111111111111111111111110))))

(assert (=> d!58473 (= lt!111011 (select (arr!4931 (_keys!6086 thiss!1504)) (index!5108 lt!111004)))))

(assert (=> d!58473 (validMask!0 (mask!9757 thiss!1504))))

(assert (=> d!58473 (= (seekKeyOrZeroReturnVacant!0 (x!22532 lt!111004) (index!5108 lt!111004) (index!5108 lt!111004) key!932 (_keys!6086 thiss!1504) (mask!9757 thiss!1504)) lt!111012)))

(declare-fun b!215747 () Bool)

(assert (=> b!215747 (= e!140357 (Found!734 (index!5108 lt!111004)))))

(assert (= (and d!58473 c!36230) b!215743))

(assert (= (and d!58473 (not c!36230)) b!215744))

(assert (= (and b!215744 c!36229) b!215747))

(assert (= (and b!215744 (not c!36229)) b!215742))

(assert (= (and b!215742 c!36228) b!215745))

(assert (= (and b!215742 (not c!36228)) b!215746))

(declare-fun m!242799 () Bool)

(assert (=> b!215746 m!242799))

(assert (=> b!215746 m!242799))

(declare-fun m!242801 () Bool)

(assert (=> b!215746 m!242801))

(declare-fun m!242803 () Bool)

(assert (=> d!58473 m!242803))

(declare-fun m!242805 () Bool)

(assert (=> d!58473 m!242805))

(assert (=> d!58473 m!242775))

(assert (=> d!58473 m!242743))

(assert (=> b!215685 d!58473))

(declare-fun b!215766 () Bool)

(declare-fun lt!111018 () SeekEntryResult!734)

(assert (=> b!215766 (and (bvsge (index!5108 lt!111018) #b00000000000000000000000000000000) (bvslt (index!5108 lt!111018) (size!5261 (_keys!6086 thiss!1504))))))

(declare-fun res!105523 () Bool)

(assert (=> b!215766 (= res!105523 (= (select (arr!4931 (_keys!6086 thiss!1504)) (index!5108 lt!111018)) key!932))))

(declare-fun e!140372 () Bool)

(assert (=> b!215766 (=> res!105523 e!140372)))

(declare-fun e!140370 () Bool)

(assert (=> b!215766 (= e!140370 e!140372)))

(declare-fun b!215767 () Bool)

(declare-fun e!140371 () SeekEntryResult!734)

(assert (=> b!215767 (= e!140371 (Intermediate!734 false (toIndex!0 key!932 (mask!9757 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215768 () Bool)

(declare-fun e!140373 () SeekEntryResult!734)

(assert (=> b!215768 (= e!140373 e!140371)))

(declare-fun c!36238 () Bool)

(declare-fun lt!111017 () (_ BitVec 64))

(assert (=> b!215768 (= c!36238 (or (= lt!111017 key!932) (= (bvadd lt!111017 lt!111017) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215769 () Bool)

(assert (=> b!215769 (= e!140371 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9757 thiss!1504)) #b00000000000000000000000000000000 (mask!9757 thiss!1504)) key!932 (_keys!6086 thiss!1504) (mask!9757 thiss!1504)))))

(declare-fun b!215770 () Bool)

(assert (=> b!215770 (and (bvsge (index!5108 lt!111018) #b00000000000000000000000000000000) (bvslt (index!5108 lt!111018) (size!5261 (_keys!6086 thiss!1504))))))

(assert (=> b!215770 (= e!140372 (= (select (arr!4931 (_keys!6086 thiss!1504)) (index!5108 lt!111018)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!215771 () Bool)

(assert (=> b!215771 (and (bvsge (index!5108 lt!111018) #b00000000000000000000000000000000) (bvslt (index!5108 lt!111018) (size!5261 (_keys!6086 thiss!1504))))))

(declare-fun res!105521 () Bool)

(assert (=> b!215771 (= res!105521 (= (select (arr!4931 (_keys!6086 thiss!1504)) (index!5108 lt!111018)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215771 (=> res!105521 e!140372)))

(declare-fun b!215773 () Bool)

(declare-fun e!140369 () Bool)

(assert (=> b!215773 (= e!140369 e!140370)))

(declare-fun res!105522 () Bool)

(assert (=> b!215773 (= res!105522 (and ((_ is Intermediate!734) lt!111018) (not (undefined!1546 lt!111018)) (bvslt (x!22532 lt!111018) #b01111111111111111111111111111110) (bvsge (x!22532 lt!111018) #b00000000000000000000000000000000) (bvsge (x!22532 lt!111018) #b00000000000000000000000000000000)))))

(assert (=> b!215773 (=> (not res!105522) (not e!140370))))

(declare-fun b!215774 () Bool)

(assert (=> b!215774 (= e!140369 (bvsge (x!22532 lt!111018) #b01111111111111111111111111111110))))

(declare-fun b!215772 () Bool)

(assert (=> b!215772 (= e!140373 (Intermediate!734 true (toIndex!0 key!932 (mask!9757 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!58475 () Bool)

(assert (=> d!58475 e!140369))

(declare-fun c!36237 () Bool)

(assert (=> d!58475 (= c!36237 (and ((_ is Intermediate!734) lt!111018) (undefined!1546 lt!111018)))))

(assert (=> d!58475 (= lt!111018 e!140373)))

(declare-fun c!36239 () Bool)

(assert (=> d!58475 (= c!36239 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!58475 (= lt!111017 (select (arr!4931 (_keys!6086 thiss!1504)) (toIndex!0 key!932 (mask!9757 thiss!1504))))))

(assert (=> d!58475 (validMask!0 (mask!9757 thiss!1504))))

(assert (=> d!58475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9757 thiss!1504)) key!932 (_keys!6086 thiss!1504) (mask!9757 thiss!1504)) lt!111018)))

(assert (= (and d!58475 c!36239) b!215772))

(assert (= (and d!58475 (not c!36239)) b!215768))

(assert (= (and b!215768 c!36238) b!215767))

(assert (= (and b!215768 (not c!36238)) b!215769))

(assert (= (and d!58475 c!36237) b!215774))

(assert (= (and d!58475 (not c!36237)) b!215773))

(assert (= (and b!215773 res!105522) b!215766))

(assert (= (and b!215766 (not res!105523)) b!215771))

(assert (= (and b!215771 (not res!105521)) b!215770))

(declare-fun m!242807 () Bool)

(assert (=> b!215771 m!242807))

(assert (=> d!58475 m!242765))

(declare-fun m!242809 () Bool)

(assert (=> d!58475 m!242809))

(assert (=> d!58475 m!242743))

(assert (=> b!215769 m!242765))

(declare-fun m!242811 () Bool)

(assert (=> b!215769 m!242811))

(assert (=> b!215769 m!242811))

(declare-fun m!242813 () Bool)

(assert (=> b!215769 m!242813))

(assert (=> b!215766 m!242807))

(assert (=> b!215770 m!242807))

(assert (=> d!58463 d!58475))

(declare-fun d!58477 () Bool)

(declare-fun lt!111024 () (_ BitVec 32))

(declare-fun lt!111023 () (_ BitVec 32))

(assert (=> d!58477 (= lt!111024 (bvmul (bvxor lt!111023 (bvlshr lt!111023 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58477 (= lt!111023 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58477 (and (bvsge (mask!9757 thiss!1504) #b00000000000000000000000000000000) (let ((res!105524 (let ((h!3780 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22550 (bvmul (bvxor h!3780 (bvlshr h!3780 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22550 (bvlshr x!22550 #b00000000000000000000000000001101)) (mask!9757 thiss!1504)))))) (and (bvslt res!105524 (bvadd (mask!9757 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105524 #b00000000000000000000000000000000))))))

(assert (=> d!58477 (= (toIndex!0 key!932 (mask!9757 thiss!1504)) (bvand (bvxor lt!111024 (bvlshr lt!111024 #b00000000000000000000000000001101)) (mask!9757 thiss!1504)))))

(assert (=> d!58463 d!58477))

(assert (=> d!58463 d!58467))

(declare-fun b!215783 () Bool)

(declare-fun e!140379 () (_ BitVec 32))

(assert (=> b!215783 (= e!140379 #b00000000000000000000000000000000)))

(declare-fun b!215785 () Bool)

(declare-fun e!140378 () (_ BitVec 32))

(declare-fun call!20355 () (_ BitVec 32))

(assert (=> b!215785 (= e!140378 (bvadd #b00000000000000000000000000000001 call!20355))))

(declare-fun b!215784 () Bool)

(assert (=> b!215784 (= e!140378 call!20355)))

(declare-fun d!58479 () Bool)

(declare-fun lt!111027 () (_ BitVec 32))

(assert (=> d!58479 (and (bvsge lt!111027 #b00000000000000000000000000000000) (bvsle lt!111027 (bvsub (size!5261 (_keys!6086 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58479 (= lt!111027 e!140379)))

(declare-fun c!36244 () Bool)

(assert (=> d!58479 (= c!36244 (bvsge #b00000000000000000000000000000000 (size!5261 (_keys!6086 thiss!1504))))))

(assert (=> d!58479 (and (bvsle #b00000000000000000000000000000000 (size!5261 (_keys!6086 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5261 (_keys!6086 thiss!1504)) (size!5261 (_keys!6086 thiss!1504))))))

(assert (=> d!58479 (= (arrayCountValidKeys!0 (_keys!6086 thiss!1504) #b00000000000000000000000000000000 (size!5261 (_keys!6086 thiss!1504))) lt!111027)))

(declare-fun b!215786 () Bool)

(assert (=> b!215786 (= e!140379 e!140378)))

(declare-fun c!36245 () Bool)

(assert (=> b!215786 (= c!36245 (validKeyInArray!0 (select (arr!4931 (_keys!6086 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20352 () Bool)

(assert (=> bm!20352 (= call!20355 (arrayCountValidKeys!0 (_keys!6086 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5261 (_keys!6086 thiss!1504))))))

(assert (= (and d!58479 c!36244) b!215783))

(assert (= (and d!58479 (not c!36244)) b!215786))

(assert (= (and b!215786 c!36245) b!215785))

(assert (= (and b!215786 (not c!36245)) b!215784))

(assert (= (or b!215785 b!215784) bm!20352))

(assert (=> b!215786 m!242789))

(assert (=> b!215786 m!242789))

(assert (=> b!215786 m!242791))

(declare-fun m!242815 () Bool)

(assert (=> bm!20352 m!242815))

(assert (=> b!215692 d!58479))

(declare-fun d!58481 () Bool)

(declare-fun res!105530 () Bool)

(declare-fun e!140387 () Bool)

(assert (=> d!58481 (=> res!105530 e!140387)))

(assert (=> d!58481 (= res!105530 (bvsge #b00000000000000000000000000000000 (size!5261 (_keys!6086 thiss!1504))))))

(assert (=> d!58481 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6086 thiss!1504) (mask!9757 thiss!1504)) e!140387)))

(declare-fun b!215795 () Bool)

(declare-fun e!140386 () Bool)

(declare-fun call!20358 () Bool)

(assert (=> b!215795 (= e!140386 call!20358)))

(declare-fun b!215796 () Bool)

(declare-fun e!140388 () Bool)

(assert (=> b!215796 (= e!140388 e!140386)))

(declare-fun lt!111036 () (_ BitVec 64))

(assert (=> b!215796 (= lt!111036 (select (arr!4931 (_keys!6086 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6498 0))(
  ( (Unit!6499) )
))
(declare-fun lt!111034 () Unit!6498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10409 (_ BitVec 64) (_ BitVec 32)) Unit!6498)

(assert (=> b!215796 (= lt!111034 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6086 thiss!1504) lt!111036 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215796 (arrayContainsKey!0 (_keys!6086 thiss!1504) lt!111036 #b00000000000000000000000000000000)))

(declare-fun lt!111035 () Unit!6498)

(assert (=> b!215796 (= lt!111035 lt!111034)))

(declare-fun res!105529 () Bool)

(assert (=> b!215796 (= res!105529 (= (seekEntryOrOpen!0 (select (arr!4931 (_keys!6086 thiss!1504)) #b00000000000000000000000000000000) (_keys!6086 thiss!1504) (mask!9757 thiss!1504)) (Found!734 #b00000000000000000000000000000000)))))

(assert (=> b!215796 (=> (not res!105529) (not e!140386))))

(declare-fun b!215797 () Bool)

(assert (=> b!215797 (= e!140388 call!20358)))

(declare-fun bm!20355 () Bool)

(assert (=> bm!20355 (= call!20358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6086 thiss!1504) (mask!9757 thiss!1504)))))

(declare-fun b!215798 () Bool)

(assert (=> b!215798 (= e!140387 e!140388)))

(declare-fun c!36248 () Bool)

(assert (=> b!215798 (= c!36248 (validKeyInArray!0 (select (arr!4931 (_keys!6086 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58481 (not res!105530)) b!215798))

(assert (= (and b!215798 c!36248) b!215796))

(assert (= (and b!215798 (not c!36248)) b!215797))

(assert (= (and b!215796 res!105529) b!215795))

(assert (= (or b!215795 b!215797) bm!20355))

(assert (=> b!215796 m!242789))

(declare-fun m!242817 () Bool)

(assert (=> b!215796 m!242817))

(declare-fun m!242819 () Bool)

(assert (=> b!215796 m!242819))

(assert (=> b!215796 m!242789))

(declare-fun m!242821 () Bool)

(assert (=> b!215796 m!242821))

(declare-fun m!242823 () Bool)

(assert (=> bm!20355 m!242823))

(assert (=> b!215798 m!242789))

(assert (=> b!215798 m!242789))

(assert (=> b!215798 m!242791))

(assert (=> b!215693 d!58481))

(declare-fun b!215800 () Bool)

(declare-fun e!140390 () Bool)

(assert (=> b!215800 (= e!140390 tp_is_empty!5589)))

(declare-fun mapNonEmpty!9536 () Bool)

(declare-fun mapRes!9536 () Bool)

(declare-fun tp!20309 () Bool)

(declare-fun e!140389 () Bool)

(assert (=> mapNonEmpty!9536 (= mapRes!9536 (and tp!20309 e!140389))))

(declare-fun mapRest!9536 () (Array (_ BitVec 32) ValueCell!2451))

(declare-fun mapValue!9536 () ValueCell!2451)

(declare-fun mapKey!9536 () (_ BitVec 32))

(assert (=> mapNonEmpty!9536 (= mapRest!9535 (store mapRest!9536 mapKey!9536 mapValue!9536))))

(declare-fun b!215799 () Bool)

(assert (=> b!215799 (= e!140389 tp_is_empty!5589)))

(declare-fun mapIsEmpty!9536 () Bool)

(assert (=> mapIsEmpty!9536 mapRes!9536))

(declare-fun condMapEmpty!9536 () Bool)

(declare-fun mapDefault!9536 () ValueCell!2451)

(assert (=> mapNonEmpty!9535 (= condMapEmpty!9536 (= mapRest!9535 ((as const (Array (_ BitVec 32) ValueCell!2451)) mapDefault!9536)))))

(assert (=> mapNonEmpty!9535 (= tp!20308 (and e!140390 mapRes!9536))))

(assert (= (and mapNonEmpty!9535 condMapEmpty!9536) mapIsEmpty!9536))

(assert (= (and mapNonEmpty!9535 (not condMapEmpty!9536)) mapNonEmpty!9536))

(assert (= (and mapNonEmpty!9536 ((_ is ValueCellFull!2451) mapValue!9536)) b!215799))

(assert (= (and mapNonEmpty!9535 ((_ is ValueCellFull!2451) mapDefault!9536)) b!215800))

(declare-fun m!242825 () Bool)

(assert (=> mapNonEmpty!9536 m!242825))

(check-sat (not bm!20349) (not b!215714) (not b!215796) (not b!215798) (not b!215786) (not b!215769) (not b_next!5727) (not b!215727) (not b!215715) (not d!58473) (not bm!20352) b_and!12617 (not d!58471) (not b!215746) (not mapNonEmpty!9536) (not bm!20355) (not b!215717) tp_is_empty!5589 (not b!215728) (not d!58475))
(check-sat b_and!12617 (not b_next!5727))
