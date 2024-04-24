; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18124 () Bool)

(assert start!18124)

(declare-fun b!180471 () Bool)

(declare-fun b_free!4459 () Bool)

(declare-fun b_next!4459 () Bool)

(assert (=> b!180471 (= b_free!4459 (not b_next!4459))))

(declare-fun tp!16113 () Bool)

(declare-fun b_and!11007 () Bool)

(assert (=> b!180471 (= tp!16113 b_and!11007)))

(declare-fun e!118876 () Bool)

(declare-fun e!118874 () Bool)

(declare-datatypes ((V!5289 0))(
  ( (V!5290 (val!2160 Int)) )
))
(declare-datatypes ((ValueCell!1772 0))(
  ( (ValueCellFull!1772 (v!4054 V!5289)) (EmptyCell!1772) )
))
(declare-datatypes ((array!7621 0))(
  ( (array!7622 (arr!3608 (Array (_ BitVec 32) (_ BitVec 64))) (size!3916 (_ BitVec 32))) )
))
(declare-datatypes ((array!7623 0))(
  ( (array!7624 (arr!3609 (Array (_ BitVec 32) ValueCell!1772)) (size!3917 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2452 0))(
  ( (LongMapFixedSize!2453 (defaultEntry!3702 Int) (mask!8703 (_ BitVec 32)) (extraKeys!3439 (_ BitVec 32)) (zeroValue!3543 V!5289) (minValue!3543 V!5289) (_size!1275 (_ BitVec 32)) (_keys!5595 array!7621) (_values!3685 array!7623) (_vacant!1275 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2452)

(declare-fun tp_is_empty!4231 () Bool)

(declare-fun array_inv!2329 (array!7621) Bool)

(declare-fun array_inv!2330 (array!7623) Bool)

(assert (=> b!180471 (= e!118876 (and tp!16113 tp_is_empty!4231 (array_inv!2329 (_keys!5595 thiss!1248)) (array_inv!2330 (_values!3685 thiss!1248)) e!118874))))

(declare-fun b!180472 () Bool)

(declare-fun e!118877 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!180472 (= e!118877 (not (validMask!0 (mask!8703 thiss!1248))))))

(declare-fun b!180473 () Bool)

(declare-fun e!118878 () Bool)

(declare-fun mapRes!7246 () Bool)

(assert (=> b!180473 (= e!118874 (and e!118878 mapRes!7246))))

(declare-fun condMapEmpty!7246 () Bool)

(declare-fun mapDefault!7246 () ValueCell!1772)

(assert (=> b!180473 (= condMapEmpty!7246 (= (arr!3609 (_values!3685 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1772)) mapDefault!7246)))))

(declare-fun mapIsEmpty!7246 () Bool)

(assert (=> mapIsEmpty!7246 mapRes!7246))

(declare-fun b!180474 () Bool)

(declare-fun res!85481 () Bool)

(assert (=> b!180474 (=> (not res!85481) (not e!118877))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3320 0))(
  ( (tuple2!3321 (_1!1671 (_ BitVec 64)) (_2!1671 V!5289)) )
))
(declare-datatypes ((List!2266 0))(
  ( (Nil!2263) (Cons!2262 (h!2887 tuple2!3320) (t!7106 List!2266)) )
))
(declare-datatypes ((ListLongMap!2241 0))(
  ( (ListLongMap!2242 (toList!1136 List!2266)) )
))
(declare-fun contains!1224 (ListLongMap!2241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!788 (array!7621 array!7623 (_ BitVec 32) (_ BitVec 32) V!5289 V!5289 (_ BitVec 32) Int) ListLongMap!2241)

(assert (=> b!180474 (= res!85481 (contains!1224 (getCurrentListMap!788 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)) key!828))))

(declare-fun b!180475 () Bool)

(declare-fun res!85483 () Bool)

(declare-fun e!118875 () Bool)

(assert (=> b!180475 (=> (not res!85483) (not e!118875))))

(assert (=> b!180475 (= res!85483 (not (= key!828 (bvneg key!828))))))

(declare-fun b!180476 () Bool)

(assert (=> b!180476 (= e!118875 e!118877)))

(declare-fun res!85480 () Bool)

(assert (=> b!180476 (=> (not res!85480) (not e!118877))))

(declare-datatypes ((SeekEntryResult!587 0))(
  ( (MissingZero!587 (index!4518 (_ BitVec 32))) (Found!587 (index!4519 (_ BitVec 32))) (Intermediate!587 (undefined!1399 Bool) (index!4520 (_ BitVec 32)) (x!19721 (_ BitVec 32))) (Undefined!587) (MissingVacant!587 (index!4521 (_ BitVec 32))) )
))
(declare-fun lt!89233 () SeekEntryResult!587)

(get-info :version)

(assert (=> b!180476 (= res!85480 (and (not ((_ is Undefined!587) lt!89233)) (not ((_ is MissingVacant!587) lt!89233)) (not ((_ is MissingZero!587) lt!89233)) ((_ is Found!587) lt!89233)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7621 (_ BitVec 32)) SeekEntryResult!587)

(assert (=> b!180476 (= lt!89233 (seekEntryOrOpen!0 key!828 (_keys!5595 thiss!1248) (mask!8703 thiss!1248)))))

(declare-fun b!180477 () Bool)

(declare-fun e!118873 () Bool)

(assert (=> b!180477 (= e!118873 tp_is_empty!4231)))

(declare-fun mapNonEmpty!7246 () Bool)

(declare-fun tp!16114 () Bool)

(assert (=> mapNonEmpty!7246 (= mapRes!7246 (and tp!16114 e!118873))))

(declare-fun mapValue!7246 () ValueCell!1772)

(declare-fun mapRest!7246 () (Array (_ BitVec 32) ValueCell!1772))

(declare-fun mapKey!7246 () (_ BitVec 32))

(assert (=> mapNonEmpty!7246 (= (arr!3609 (_values!3685 thiss!1248)) (store mapRest!7246 mapKey!7246 mapValue!7246))))

(declare-fun b!180470 () Bool)

(assert (=> b!180470 (= e!118878 tp_is_empty!4231)))

(declare-fun res!85482 () Bool)

(assert (=> start!18124 (=> (not res!85482) (not e!118875))))

(declare-fun valid!1045 (LongMapFixedSize!2452) Bool)

(assert (=> start!18124 (= res!85482 (valid!1045 thiss!1248))))

(assert (=> start!18124 e!118875))

(assert (=> start!18124 e!118876))

(assert (=> start!18124 true))

(assert (= (and start!18124 res!85482) b!180475))

(assert (= (and b!180475 res!85483) b!180476))

(assert (= (and b!180476 res!85480) b!180474))

(assert (= (and b!180474 res!85481) b!180472))

(assert (= (and b!180473 condMapEmpty!7246) mapIsEmpty!7246))

(assert (= (and b!180473 (not condMapEmpty!7246)) mapNonEmpty!7246))

(assert (= (and mapNonEmpty!7246 ((_ is ValueCellFull!1772) mapValue!7246)) b!180477))

(assert (= (and b!180473 ((_ is ValueCellFull!1772) mapDefault!7246)) b!180470))

(assert (= b!180471 b!180473))

(assert (= start!18124 b!180471))

(declare-fun m!208643 () Bool)

(assert (=> mapNonEmpty!7246 m!208643))

(declare-fun m!208645 () Bool)

(assert (=> b!180476 m!208645))

(declare-fun m!208647 () Bool)

(assert (=> b!180472 m!208647))

(declare-fun m!208649 () Bool)

(assert (=> b!180471 m!208649))

(declare-fun m!208651 () Bool)

(assert (=> b!180471 m!208651))

(declare-fun m!208653 () Bool)

(assert (=> start!18124 m!208653))

(declare-fun m!208655 () Bool)

(assert (=> b!180474 m!208655))

(assert (=> b!180474 m!208655))

(declare-fun m!208657 () Bool)

(assert (=> b!180474 m!208657))

(check-sat (not mapNonEmpty!7246) b_and!11007 (not b!180471) (not b!180472) (not b!180474) tp_is_empty!4231 (not start!18124) (not b!180476) (not b_next!4459))
(check-sat b_and!11007 (not b_next!4459))
(get-model)

(declare-fun b!180538 () Bool)

(declare-fun e!118929 () SeekEntryResult!587)

(declare-fun lt!89246 () SeekEntryResult!587)

(assert (=> b!180538 (= e!118929 (MissingZero!587 (index!4520 lt!89246)))))

(declare-fun b!180539 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7621 (_ BitVec 32)) SeekEntryResult!587)

(assert (=> b!180539 (= e!118929 (seekKeyOrZeroReturnVacant!0 (x!19721 lt!89246) (index!4520 lt!89246) (index!4520 lt!89246) key!828 (_keys!5595 thiss!1248) (mask!8703 thiss!1248)))))

(declare-fun d!54307 () Bool)

(declare-fun lt!89248 () SeekEntryResult!587)

(assert (=> d!54307 (and (or ((_ is Undefined!587) lt!89248) (not ((_ is Found!587) lt!89248)) (and (bvsge (index!4519 lt!89248) #b00000000000000000000000000000000) (bvslt (index!4519 lt!89248) (size!3916 (_keys!5595 thiss!1248))))) (or ((_ is Undefined!587) lt!89248) ((_ is Found!587) lt!89248) (not ((_ is MissingZero!587) lt!89248)) (and (bvsge (index!4518 lt!89248) #b00000000000000000000000000000000) (bvslt (index!4518 lt!89248) (size!3916 (_keys!5595 thiss!1248))))) (or ((_ is Undefined!587) lt!89248) ((_ is Found!587) lt!89248) ((_ is MissingZero!587) lt!89248) (not ((_ is MissingVacant!587) lt!89248)) (and (bvsge (index!4521 lt!89248) #b00000000000000000000000000000000) (bvslt (index!4521 lt!89248) (size!3916 (_keys!5595 thiss!1248))))) (or ((_ is Undefined!587) lt!89248) (ite ((_ is Found!587) lt!89248) (= (select (arr!3608 (_keys!5595 thiss!1248)) (index!4519 lt!89248)) key!828) (ite ((_ is MissingZero!587) lt!89248) (= (select (arr!3608 (_keys!5595 thiss!1248)) (index!4518 lt!89248)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!587) lt!89248) (= (select (arr!3608 (_keys!5595 thiss!1248)) (index!4521 lt!89248)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!118928 () SeekEntryResult!587)

(assert (=> d!54307 (= lt!89248 e!118928)))

(declare-fun c!32333 () Bool)

(assert (=> d!54307 (= c!32333 (and ((_ is Intermediate!587) lt!89246) (undefined!1399 lt!89246)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7621 (_ BitVec 32)) SeekEntryResult!587)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54307 (= lt!89246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8703 thiss!1248)) key!828 (_keys!5595 thiss!1248) (mask!8703 thiss!1248)))))

(assert (=> d!54307 (validMask!0 (mask!8703 thiss!1248))))

(assert (=> d!54307 (= (seekEntryOrOpen!0 key!828 (_keys!5595 thiss!1248) (mask!8703 thiss!1248)) lt!89248)))

(declare-fun b!180540 () Bool)

(assert (=> b!180540 (= e!118928 Undefined!587)))

(declare-fun b!180541 () Bool)

(declare-fun e!118927 () SeekEntryResult!587)

(assert (=> b!180541 (= e!118928 e!118927)))

(declare-fun lt!89247 () (_ BitVec 64))

(assert (=> b!180541 (= lt!89247 (select (arr!3608 (_keys!5595 thiss!1248)) (index!4520 lt!89246)))))

(declare-fun c!32332 () Bool)

(assert (=> b!180541 (= c!32332 (= lt!89247 key!828))))

(declare-fun b!180542 () Bool)

(assert (=> b!180542 (= e!118927 (Found!587 (index!4520 lt!89246)))))

(declare-fun b!180543 () Bool)

(declare-fun c!32334 () Bool)

(assert (=> b!180543 (= c!32334 (= lt!89247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180543 (= e!118927 e!118929)))

(assert (= (and d!54307 c!32333) b!180540))

(assert (= (and d!54307 (not c!32333)) b!180541))

(assert (= (and b!180541 c!32332) b!180542))

(assert (= (and b!180541 (not c!32332)) b!180543))

(assert (= (and b!180543 c!32334) b!180538))

(assert (= (and b!180543 (not c!32334)) b!180539))

(declare-fun m!208691 () Bool)

(assert (=> b!180539 m!208691))

(declare-fun m!208693 () Bool)

(assert (=> d!54307 m!208693))

(assert (=> d!54307 m!208647))

(declare-fun m!208695 () Bool)

(assert (=> d!54307 m!208695))

(declare-fun m!208697 () Bool)

(assert (=> d!54307 m!208697))

(assert (=> d!54307 m!208695))

(declare-fun m!208699 () Bool)

(assert (=> d!54307 m!208699))

(declare-fun m!208701 () Bool)

(assert (=> d!54307 m!208701))

(declare-fun m!208703 () Bool)

(assert (=> b!180541 m!208703))

(assert (=> b!180476 d!54307))

(declare-fun d!54309 () Bool)

(assert (=> d!54309 (= (validMask!0 (mask!8703 thiss!1248)) (and (or (= (mask!8703 thiss!1248) #b00000000000000000000000000000111) (= (mask!8703 thiss!1248) #b00000000000000000000000000001111) (= (mask!8703 thiss!1248) #b00000000000000000000000000011111) (= (mask!8703 thiss!1248) #b00000000000000000000000000111111) (= (mask!8703 thiss!1248) #b00000000000000000000000001111111) (= (mask!8703 thiss!1248) #b00000000000000000000000011111111) (= (mask!8703 thiss!1248) #b00000000000000000000000111111111) (= (mask!8703 thiss!1248) #b00000000000000000000001111111111) (= (mask!8703 thiss!1248) #b00000000000000000000011111111111) (= (mask!8703 thiss!1248) #b00000000000000000000111111111111) (= (mask!8703 thiss!1248) #b00000000000000000001111111111111) (= (mask!8703 thiss!1248) #b00000000000000000011111111111111) (= (mask!8703 thiss!1248) #b00000000000000000111111111111111) (= (mask!8703 thiss!1248) #b00000000000000001111111111111111) (= (mask!8703 thiss!1248) #b00000000000000011111111111111111) (= (mask!8703 thiss!1248) #b00000000000000111111111111111111) (= (mask!8703 thiss!1248) #b00000000000001111111111111111111) (= (mask!8703 thiss!1248) #b00000000000011111111111111111111) (= (mask!8703 thiss!1248) #b00000000000111111111111111111111) (= (mask!8703 thiss!1248) #b00000000001111111111111111111111) (= (mask!8703 thiss!1248) #b00000000011111111111111111111111) (= (mask!8703 thiss!1248) #b00000000111111111111111111111111) (= (mask!8703 thiss!1248) #b00000001111111111111111111111111) (= (mask!8703 thiss!1248) #b00000011111111111111111111111111) (= (mask!8703 thiss!1248) #b00000111111111111111111111111111) (= (mask!8703 thiss!1248) #b00001111111111111111111111111111) (= (mask!8703 thiss!1248) #b00011111111111111111111111111111) (= (mask!8703 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8703 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!180472 d!54309))

(declare-fun d!54311 () Bool)

(declare-fun res!85514 () Bool)

(declare-fun e!118932 () Bool)

(assert (=> d!54311 (=> (not res!85514) (not e!118932))))

(declare-fun simpleValid!165 (LongMapFixedSize!2452) Bool)

(assert (=> d!54311 (= res!85514 (simpleValid!165 thiss!1248))))

(assert (=> d!54311 (= (valid!1045 thiss!1248) e!118932)))

(declare-fun b!180550 () Bool)

(declare-fun res!85515 () Bool)

(assert (=> b!180550 (=> (not res!85515) (not e!118932))))

(declare-fun arrayCountValidKeys!0 (array!7621 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180550 (= res!85515 (= (arrayCountValidKeys!0 (_keys!5595 thiss!1248) #b00000000000000000000000000000000 (size!3916 (_keys!5595 thiss!1248))) (_size!1275 thiss!1248)))))

(declare-fun b!180551 () Bool)

(declare-fun res!85516 () Bool)

(assert (=> b!180551 (=> (not res!85516) (not e!118932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7621 (_ BitVec 32)) Bool)

(assert (=> b!180551 (= res!85516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5595 thiss!1248) (mask!8703 thiss!1248)))))

(declare-fun b!180552 () Bool)

(declare-datatypes ((List!2268 0))(
  ( (Nil!2265) (Cons!2264 (h!2889 (_ BitVec 64)) (t!7110 List!2268)) )
))
(declare-fun arrayNoDuplicates!0 (array!7621 (_ BitVec 32) List!2268) Bool)

(assert (=> b!180552 (= e!118932 (arrayNoDuplicates!0 (_keys!5595 thiss!1248) #b00000000000000000000000000000000 Nil!2265))))

(assert (= (and d!54311 res!85514) b!180550))

(assert (= (and b!180550 res!85515) b!180551))

(assert (= (and b!180551 res!85516) b!180552))

(declare-fun m!208705 () Bool)

(assert (=> d!54311 m!208705))

(declare-fun m!208707 () Bool)

(assert (=> b!180550 m!208707))

(declare-fun m!208709 () Bool)

(assert (=> b!180551 m!208709))

(declare-fun m!208711 () Bool)

(assert (=> b!180552 m!208711))

(assert (=> start!18124 d!54311))

(declare-fun d!54313 () Bool)

(declare-fun e!118937 () Bool)

(assert (=> d!54313 e!118937))

(declare-fun res!85519 () Bool)

(assert (=> d!54313 (=> res!85519 e!118937)))

(declare-fun lt!89259 () Bool)

(assert (=> d!54313 (= res!85519 (not lt!89259))))

(declare-fun lt!89260 () Bool)

(assert (=> d!54313 (= lt!89259 lt!89260)))

(declare-datatypes ((Unit!5492 0))(
  ( (Unit!5493) )
))
(declare-fun lt!89258 () Unit!5492)

(declare-fun e!118938 () Unit!5492)

(assert (=> d!54313 (= lt!89258 e!118938)))

(declare-fun c!32337 () Bool)

(assert (=> d!54313 (= c!32337 lt!89260)))

(declare-fun containsKey!210 (List!2266 (_ BitVec 64)) Bool)

(assert (=> d!54313 (= lt!89260 (containsKey!210 (toList!1136 (getCurrentListMap!788 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248))) key!828))))

(assert (=> d!54313 (= (contains!1224 (getCurrentListMap!788 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)) key!828) lt!89259)))

(declare-fun b!180559 () Bool)

(declare-fun lt!89257 () Unit!5492)

(assert (=> b!180559 (= e!118938 lt!89257)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!158 (List!2266 (_ BitVec 64)) Unit!5492)

(assert (=> b!180559 (= lt!89257 (lemmaContainsKeyImpliesGetValueByKeyDefined!158 (toList!1136 (getCurrentListMap!788 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248))) key!828))))

(declare-datatypes ((Option!213 0))(
  ( (Some!212 (v!4057 V!5289)) (None!211) )
))
(declare-fun isDefined!159 (Option!213) Bool)

(declare-fun getValueByKey!207 (List!2266 (_ BitVec 64)) Option!213)

(assert (=> b!180559 (isDefined!159 (getValueByKey!207 (toList!1136 (getCurrentListMap!788 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248))) key!828))))

(declare-fun b!180560 () Bool)

(declare-fun Unit!5494 () Unit!5492)

(assert (=> b!180560 (= e!118938 Unit!5494)))

(declare-fun b!180561 () Bool)

(assert (=> b!180561 (= e!118937 (isDefined!159 (getValueByKey!207 (toList!1136 (getCurrentListMap!788 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248))) key!828)))))

(assert (= (and d!54313 c!32337) b!180559))

(assert (= (and d!54313 (not c!32337)) b!180560))

(assert (= (and d!54313 (not res!85519)) b!180561))

(declare-fun m!208713 () Bool)

(assert (=> d!54313 m!208713))

(declare-fun m!208715 () Bool)

(assert (=> b!180559 m!208715))

(declare-fun m!208717 () Bool)

(assert (=> b!180559 m!208717))

(assert (=> b!180559 m!208717))

(declare-fun m!208719 () Bool)

(assert (=> b!180559 m!208719))

(assert (=> b!180561 m!208717))

(assert (=> b!180561 m!208717))

(assert (=> b!180561 m!208719))

(assert (=> b!180474 d!54313))

(declare-fun b!180604 () Bool)

(declare-fun e!118969 () Bool)

(declare-fun lt!89305 () ListLongMap!2241)

(declare-fun apply!149 (ListLongMap!2241 (_ BitVec 64)) V!5289)

(declare-fun get!2070 (ValueCell!1772 V!5289) V!5289)

(declare-fun dynLambda!492 (Int (_ BitVec 64)) V!5289)

(assert (=> b!180604 (= e!118969 (= (apply!149 lt!89305 (select (arr!3608 (_keys!5595 thiss!1248)) #b00000000000000000000000000000000)) (get!2070 (select (arr!3609 (_values!3685 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!492 (defaultEntry!3702 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3917 (_values!3685 thiss!1248))))))

(assert (=> b!180604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3916 (_keys!5595 thiss!1248))))))

(declare-fun b!180605 () Bool)

(declare-fun e!118974 () Bool)

(declare-fun call!18244 () Bool)

(assert (=> b!180605 (= e!118974 (not call!18244))))

(declare-fun b!180606 () Bool)

(declare-fun e!118968 () Bool)

(assert (=> b!180606 (= e!118968 e!118974)))

(declare-fun c!32350 () Bool)

(assert (=> b!180606 (= c!32350 (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18235 () Bool)

(declare-fun call!18243 () ListLongMap!2241)

(declare-fun call!18241 () ListLongMap!2241)

(assert (=> bm!18235 (= call!18243 call!18241)))

(declare-fun b!180607 () Bool)

(declare-fun e!118965 () ListLongMap!2241)

(assert (=> b!180607 (= e!118965 call!18243)))

(declare-fun b!180608 () Bool)

(declare-fun e!118966 () ListLongMap!2241)

(assert (=> b!180608 (= e!118966 e!118965)))

(declare-fun c!32351 () Bool)

(assert (=> b!180608 (= c!32351 (and (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!180609 () Bool)

(declare-fun res!85546 () Bool)

(assert (=> b!180609 (=> (not res!85546) (not e!118968))))

(declare-fun e!118977 () Bool)

(assert (=> b!180609 (= res!85546 e!118977)))

(declare-fun c!32355 () Bool)

(assert (=> b!180609 (= c!32355 (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!180610 () Bool)

(declare-fun e!118971 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!180610 (= e!118971 (validKeyInArray!0 (select (arr!3608 (_keys!5595 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18236 () Bool)

(declare-fun call!18238 () Bool)

(assert (=> bm!18236 (= call!18238 (contains!1224 lt!89305 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180611 () Bool)

(declare-fun e!118976 () Bool)

(assert (=> b!180611 (= e!118976 (= (apply!149 lt!89305 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3543 thiss!1248)))))

(declare-fun bm!18238 () Bool)

(assert (=> bm!18238 (= call!18244 (contains!1224 lt!89305 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180612 () Bool)

(declare-fun +!269 (ListLongMap!2241 tuple2!3320) ListLongMap!2241)

(assert (=> b!180612 (= e!118966 (+!269 call!18241 (tuple2!3321 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3543 thiss!1248))))))

(declare-fun bm!18239 () Bool)

(declare-fun call!18242 () ListLongMap!2241)

(declare-fun call!18240 () ListLongMap!2241)

(assert (=> bm!18239 (= call!18242 call!18240)))

(declare-fun b!180613 () Bool)

(declare-fun e!118973 () Bool)

(assert (=> b!180613 (= e!118973 e!118969)))

(declare-fun res!85539 () Bool)

(assert (=> b!180613 (=> (not res!85539) (not e!118969))))

(assert (=> b!180613 (= res!85539 (contains!1224 lt!89305 (select (arr!3608 (_keys!5595 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180613 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3916 (_keys!5595 thiss!1248))))))

(declare-fun b!180614 () Bool)

(declare-fun e!118975 () Unit!5492)

(declare-fun Unit!5495 () Unit!5492)

(assert (=> b!180614 (= e!118975 Unit!5495)))

(declare-fun b!180615 () Bool)

(declare-fun e!118970 () ListLongMap!2241)

(declare-fun call!18239 () ListLongMap!2241)

(assert (=> b!180615 (= e!118970 call!18239)))

(declare-fun b!180616 () Bool)

(declare-fun c!32353 () Bool)

(assert (=> b!180616 (= c!32353 (and (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!180616 (= e!118965 e!118970)))

(declare-fun b!180617 () Bool)

(assert (=> b!180617 (= e!118977 (not call!18238))))

(declare-fun bm!18237 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!180 (array!7621 array!7623 (_ BitVec 32) (_ BitVec 32) V!5289 V!5289 (_ BitVec 32) Int) ListLongMap!2241)

(assert (=> bm!18237 (= call!18240 (getCurrentListMapNoExtraKeys!180 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)))))

(declare-fun d!54315 () Bool)

(assert (=> d!54315 e!118968))

(declare-fun res!85540 () Bool)

(assert (=> d!54315 (=> (not res!85540) (not e!118968))))

(assert (=> d!54315 (= res!85540 (or (bvsge #b00000000000000000000000000000000 (size!3916 (_keys!5595 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3916 (_keys!5595 thiss!1248))))))))

(declare-fun lt!89322 () ListLongMap!2241)

(assert (=> d!54315 (= lt!89305 lt!89322)))

(declare-fun lt!89309 () Unit!5492)

(assert (=> d!54315 (= lt!89309 e!118975)))

(declare-fun c!32352 () Bool)

(assert (=> d!54315 (= c!32352 e!118971)))

(declare-fun res!85543 () Bool)

(assert (=> d!54315 (=> (not res!85543) (not e!118971))))

(assert (=> d!54315 (= res!85543 (bvslt #b00000000000000000000000000000000 (size!3916 (_keys!5595 thiss!1248))))))

(assert (=> d!54315 (= lt!89322 e!118966)))

(declare-fun c!32354 () Bool)

(assert (=> d!54315 (= c!32354 (and (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54315 (validMask!0 (mask!8703 thiss!1248))))

(assert (=> d!54315 (= (getCurrentListMap!788 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)) lt!89305)))

(declare-fun b!180618 () Bool)

(declare-fun e!118967 () Bool)

(assert (=> b!180618 (= e!118967 (validKeyInArray!0 (select (arr!3608 (_keys!5595 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180619 () Bool)

(declare-fun e!118972 () Bool)

(assert (=> b!180619 (= e!118974 e!118972)))

(declare-fun res!85538 () Bool)

(assert (=> b!180619 (= res!85538 call!18244)))

(assert (=> b!180619 (=> (not res!85538) (not e!118972))))

(declare-fun b!180620 () Bool)

(assert (=> b!180620 (= e!118972 (= (apply!149 lt!89305 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3543 thiss!1248)))))

(declare-fun bm!18240 () Bool)

(assert (=> bm!18240 (= call!18239 call!18242)))

(declare-fun b!180621 () Bool)

(declare-fun res!85544 () Bool)

(assert (=> b!180621 (=> (not res!85544) (not e!118968))))

(assert (=> b!180621 (= res!85544 e!118973)))

(declare-fun res!85545 () Bool)

(assert (=> b!180621 (=> res!85545 e!118973)))

(assert (=> b!180621 (= res!85545 (not e!118967))))

(declare-fun res!85542 () Bool)

(assert (=> b!180621 (=> (not res!85542) (not e!118967))))

(assert (=> b!180621 (= res!85542 (bvslt #b00000000000000000000000000000000 (size!3916 (_keys!5595 thiss!1248))))))

(declare-fun b!180622 () Bool)

(assert (=> b!180622 (= e!118970 call!18243)))

(declare-fun b!180623 () Bool)

(assert (=> b!180623 (= e!118977 e!118976)))

(declare-fun res!85541 () Bool)

(assert (=> b!180623 (= res!85541 call!18238)))

(assert (=> b!180623 (=> (not res!85541) (not e!118976))))

(declare-fun bm!18241 () Bool)

(assert (=> bm!18241 (= call!18241 (+!269 (ite c!32354 call!18240 (ite c!32351 call!18242 call!18239)) (ite (or c!32354 c!32351) (tuple2!3321 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3543 thiss!1248)) (tuple2!3321 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3543 thiss!1248)))))))

(declare-fun b!180624 () Bool)

(declare-fun lt!89317 () Unit!5492)

(assert (=> b!180624 (= e!118975 lt!89317)))

(declare-fun lt!89310 () ListLongMap!2241)

(assert (=> b!180624 (= lt!89310 (getCurrentListMapNoExtraKeys!180 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)))))

(declare-fun lt!89307 () (_ BitVec 64))

(assert (=> b!180624 (= lt!89307 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89315 () (_ BitVec 64))

(assert (=> b!180624 (= lt!89315 (select (arr!3608 (_keys!5595 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89313 () Unit!5492)

(declare-fun addStillContains!125 (ListLongMap!2241 (_ BitVec 64) V!5289 (_ BitVec 64)) Unit!5492)

(assert (=> b!180624 (= lt!89313 (addStillContains!125 lt!89310 lt!89307 (zeroValue!3543 thiss!1248) lt!89315))))

(assert (=> b!180624 (contains!1224 (+!269 lt!89310 (tuple2!3321 lt!89307 (zeroValue!3543 thiss!1248))) lt!89315)))

(declare-fun lt!89318 () Unit!5492)

(assert (=> b!180624 (= lt!89318 lt!89313)))

(declare-fun lt!89319 () ListLongMap!2241)

(assert (=> b!180624 (= lt!89319 (getCurrentListMapNoExtraKeys!180 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)))))

(declare-fun lt!89308 () (_ BitVec 64))

(assert (=> b!180624 (= lt!89308 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89324 () (_ BitVec 64))

(assert (=> b!180624 (= lt!89324 (select (arr!3608 (_keys!5595 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89325 () Unit!5492)

(declare-fun addApplyDifferent!125 (ListLongMap!2241 (_ BitVec 64) V!5289 (_ BitVec 64)) Unit!5492)

(assert (=> b!180624 (= lt!89325 (addApplyDifferent!125 lt!89319 lt!89308 (minValue!3543 thiss!1248) lt!89324))))

(assert (=> b!180624 (= (apply!149 (+!269 lt!89319 (tuple2!3321 lt!89308 (minValue!3543 thiss!1248))) lt!89324) (apply!149 lt!89319 lt!89324))))

(declare-fun lt!89306 () Unit!5492)

(assert (=> b!180624 (= lt!89306 lt!89325)))

(declare-fun lt!89320 () ListLongMap!2241)

(assert (=> b!180624 (= lt!89320 (getCurrentListMapNoExtraKeys!180 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)))))

(declare-fun lt!89314 () (_ BitVec 64))

(assert (=> b!180624 (= lt!89314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89316 () (_ BitVec 64))

(assert (=> b!180624 (= lt!89316 (select (arr!3608 (_keys!5595 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89311 () Unit!5492)

(assert (=> b!180624 (= lt!89311 (addApplyDifferent!125 lt!89320 lt!89314 (zeroValue!3543 thiss!1248) lt!89316))))

(assert (=> b!180624 (= (apply!149 (+!269 lt!89320 (tuple2!3321 lt!89314 (zeroValue!3543 thiss!1248))) lt!89316) (apply!149 lt!89320 lt!89316))))

(declare-fun lt!89312 () Unit!5492)

(assert (=> b!180624 (= lt!89312 lt!89311)))

(declare-fun lt!89323 () ListLongMap!2241)

(assert (=> b!180624 (= lt!89323 (getCurrentListMapNoExtraKeys!180 (_keys!5595 thiss!1248) (_values!3685 thiss!1248) (mask!8703 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)))))

(declare-fun lt!89326 () (_ BitVec 64))

(assert (=> b!180624 (= lt!89326 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89321 () (_ BitVec 64))

(assert (=> b!180624 (= lt!89321 (select (arr!3608 (_keys!5595 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180624 (= lt!89317 (addApplyDifferent!125 lt!89323 lt!89326 (minValue!3543 thiss!1248) lt!89321))))

(assert (=> b!180624 (= (apply!149 (+!269 lt!89323 (tuple2!3321 lt!89326 (minValue!3543 thiss!1248))) lt!89321) (apply!149 lt!89323 lt!89321))))

(assert (= (and d!54315 c!32354) b!180612))

(assert (= (and d!54315 (not c!32354)) b!180608))

(assert (= (and b!180608 c!32351) b!180607))

(assert (= (and b!180608 (not c!32351)) b!180616))

(assert (= (and b!180616 c!32353) b!180622))

(assert (= (and b!180616 (not c!32353)) b!180615))

(assert (= (or b!180622 b!180615) bm!18240))

(assert (= (or b!180607 bm!18240) bm!18239))

(assert (= (or b!180607 b!180622) bm!18235))

(assert (= (or b!180612 bm!18239) bm!18237))

(assert (= (or b!180612 bm!18235) bm!18241))

(assert (= (and d!54315 res!85543) b!180610))

(assert (= (and d!54315 c!32352) b!180624))

(assert (= (and d!54315 (not c!32352)) b!180614))

(assert (= (and d!54315 res!85540) b!180621))

(assert (= (and b!180621 res!85542) b!180618))

(assert (= (and b!180621 (not res!85545)) b!180613))

(assert (= (and b!180613 res!85539) b!180604))

(assert (= (and b!180621 res!85544) b!180609))

(assert (= (and b!180609 c!32355) b!180623))

(assert (= (and b!180609 (not c!32355)) b!180617))

(assert (= (and b!180623 res!85541) b!180611))

(assert (= (or b!180623 b!180617) bm!18236))

(assert (= (and b!180609 res!85546) b!180606))

(assert (= (and b!180606 c!32350) b!180619))

(assert (= (and b!180606 (not c!32350)) b!180605))

(assert (= (and b!180619 res!85538) b!180620))

(assert (= (or b!180619 b!180605) bm!18238))

(declare-fun b_lambda!7141 () Bool)

(assert (=> (not b_lambda!7141) (not b!180604)))

(declare-fun t!7109 () Bool)

(declare-fun tb!2801 () Bool)

(assert (=> (and b!180471 (= (defaultEntry!3702 thiss!1248) (defaultEntry!3702 thiss!1248)) t!7109) tb!2801))

(declare-fun result!4697 () Bool)

(assert (=> tb!2801 (= result!4697 tp_is_empty!4231)))

(assert (=> b!180604 t!7109))

(declare-fun b_and!11013 () Bool)

(assert (= b_and!11007 (and (=> t!7109 result!4697) b_and!11013)))

(assert (=> d!54315 m!208647))

(declare-fun m!208721 () Bool)

(assert (=> b!180604 m!208721))

(assert (=> b!180604 m!208721))

(declare-fun m!208723 () Bool)

(assert (=> b!180604 m!208723))

(declare-fun m!208725 () Bool)

(assert (=> b!180604 m!208725))

(declare-fun m!208727 () Bool)

(assert (=> b!180604 m!208727))

(assert (=> b!180604 m!208727))

(assert (=> b!180604 m!208725))

(declare-fun m!208729 () Bool)

(assert (=> b!180604 m!208729))

(declare-fun m!208731 () Bool)

(assert (=> b!180620 m!208731))

(assert (=> b!180610 m!208721))

(assert (=> b!180610 m!208721))

(declare-fun m!208733 () Bool)

(assert (=> b!180610 m!208733))

(declare-fun m!208735 () Bool)

(assert (=> bm!18241 m!208735))

(assert (=> b!180613 m!208721))

(assert (=> b!180613 m!208721))

(declare-fun m!208737 () Bool)

(assert (=> b!180613 m!208737))

(declare-fun m!208739 () Bool)

(assert (=> b!180611 m!208739))

(declare-fun m!208741 () Bool)

(assert (=> bm!18237 m!208741))

(declare-fun m!208743 () Bool)

(assert (=> b!180612 m!208743))

(declare-fun m!208745 () Bool)

(assert (=> b!180624 m!208745))

(declare-fun m!208747 () Bool)

(assert (=> b!180624 m!208747))

(declare-fun m!208749 () Bool)

(assert (=> b!180624 m!208749))

(declare-fun m!208751 () Bool)

(assert (=> b!180624 m!208751))

(declare-fun m!208753 () Bool)

(assert (=> b!180624 m!208753))

(declare-fun m!208755 () Bool)

(assert (=> b!180624 m!208755))

(declare-fun m!208757 () Bool)

(assert (=> b!180624 m!208757))

(declare-fun m!208759 () Bool)

(assert (=> b!180624 m!208759))

(declare-fun m!208761 () Bool)

(assert (=> b!180624 m!208761))

(declare-fun m!208763 () Bool)

(assert (=> b!180624 m!208763))

(assert (=> b!180624 m!208721))

(assert (=> b!180624 m!208763))

(declare-fun m!208765 () Bool)

(assert (=> b!180624 m!208765))

(declare-fun m!208767 () Bool)

(assert (=> b!180624 m!208767))

(declare-fun m!208769 () Bool)

(assert (=> b!180624 m!208769))

(assert (=> b!180624 m!208749))

(assert (=> b!180624 m!208761))

(declare-fun m!208771 () Bool)

(assert (=> b!180624 m!208771))

(assert (=> b!180624 m!208745))

(declare-fun m!208773 () Bool)

(assert (=> b!180624 m!208773))

(assert (=> b!180624 m!208741))

(declare-fun m!208775 () Bool)

(assert (=> bm!18238 m!208775))

(assert (=> b!180618 m!208721))

(assert (=> b!180618 m!208721))

(assert (=> b!180618 m!208733))

(declare-fun m!208777 () Bool)

(assert (=> bm!18236 m!208777))

(assert (=> b!180474 d!54315))

(declare-fun d!54317 () Bool)

(assert (=> d!54317 (= (array_inv!2329 (_keys!5595 thiss!1248)) (bvsge (size!3916 (_keys!5595 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180471 d!54317))

(declare-fun d!54319 () Bool)

(assert (=> d!54319 (= (array_inv!2330 (_values!3685 thiss!1248)) (bvsge (size!3917 (_values!3685 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180471 d!54319))

(declare-fun condMapEmpty!7255 () Bool)

(declare-fun mapDefault!7255 () ValueCell!1772)

(assert (=> mapNonEmpty!7246 (= condMapEmpty!7255 (= mapRest!7246 ((as const (Array (_ BitVec 32) ValueCell!1772)) mapDefault!7255)))))

(declare-fun e!118982 () Bool)

(declare-fun mapRes!7255 () Bool)

(assert (=> mapNonEmpty!7246 (= tp!16114 (and e!118982 mapRes!7255))))

(declare-fun b!180633 () Bool)

(declare-fun e!118983 () Bool)

(assert (=> b!180633 (= e!118983 tp_is_empty!4231)))

(declare-fun b!180634 () Bool)

(assert (=> b!180634 (= e!118982 tp_is_empty!4231)))

(declare-fun mapNonEmpty!7255 () Bool)

(declare-fun tp!16129 () Bool)

(assert (=> mapNonEmpty!7255 (= mapRes!7255 (and tp!16129 e!118983))))

(declare-fun mapRest!7255 () (Array (_ BitVec 32) ValueCell!1772))

(declare-fun mapKey!7255 () (_ BitVec 32))

(declare-fun mapValue!7255 () ValueCell!1772)

(assert (=> mapNonEmpty!7255 (= mapRest!7246 (store mapRest!7255 mapKey!7255 mapValue!7255))))

(declare-fun mapIsEmpty!7255 () Bool)

(assert (=> mapIsEmpty!7255 mapRes!7255))

(assert (= (and mapNonEmpty!7246 condMapEmpty!7255) mapIsEmpty!7255))

(assert (= (and mapNonEmpty!7246 (not condMapEmpty!7255)) mapNonEmpty!7255))

(assert (= (and mapNonEmpty!7255 ((_ is ValueCellFull!1772) mapValue!7255)) b!180633))

(assert (= (and mapNonEmpty!7246 ((_ is ValueCellFull!1772) mapDefault!7255)) b!180634))

(declare-fun m!208779 () Bool)

(assert (=> mapNonEmpty!7255 m!208779))

(declare-fun b_lambda!7143 () Bool)

(assert (= b_lambda!7141 (or (and b!180471 b_free!4459) b_lambda!7143)))

(check-sat (not b!180550) (not b!180551) (not b!180604) (not bm!18238) (not b!180620) (not b_lambda!7143) b_and!11013 (not b!180552) (not d!54313) (not b!180618) (not b!180611) (not b_next!4459) (not b!180539) (not b!180613) (not bm!18241) (not b!180624) (not d!54315) (not b!180610) (not b!180612) (not d!54307) (not b!180561) (not bm!18236) (not d!54311) (not mapNonEmpty!7255) tp_is_empty!4231 (not b!180559) (not bm!18237))
(check-sat b_and!11013 (not b_next!4459))
