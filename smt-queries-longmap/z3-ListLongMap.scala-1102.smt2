; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22644 () Bool)

(assert start!22644)

(declare-fun b!236540 () Bool)

(declare-fun b_free!6361 () Bool)

(declare-fun b_next!6361 () Bool)

(assert (=> b!236540 (= b_free!6361 (not b_next!6361))))

(declare-fun tp!22263 () Bool)

(declare-fun b_and!13315 () Bool)

(assert (=> b!236540 (= tp!22263 b_and!13315)))

(declare-fun b!236537 () Bool)

(declare-fun e!153614 () Bool)

(declare-fun tp_is_empty!6223 () Bool)

(assert (=> b!236537 (= e!153614 tp_is_empty!6223)))

(declare-fun b!236538 () Bool)

(declare-fun e!153611 () Bool)

(declare-datatypes ((V!7945 0))(
  ( (V!7946 (val!3156 Int)) )
))
(declare-datatypes ((ValueCell!2768 0))(
  ( (ValueCellFull!2768 (v!5188 V!7945)) (EmptyCell!2768) )
))
(declare-datatypes ((array!11709 0))(
  ( (array!11710 (arr!5563 (Array (_ BitVec 32) ValueCell!2768)) (size!5901 (_ BitVec 32))) )
))
(declare-datatypes ((array!11711 0))(
  ( (array!11712 (arr!5564 (Array (_ BitVec 32) (_ BitVec 64))) (size!5902 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3436 0))(
  ( (LongMapFixedSize!3437 (defaultEntry!4393 Int) (mask!10386 (_ BitVec 32)) (extraKeys!4130 (_ BitVec 32)) (zeroValue!4234 V!7945) (minValue!4234 V!7945) (_size!1767 (_ BitVec 32)) (_keys!6476 array!11711) (_values!4376 array!11709) (_vacant!1767 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3436)

(assert (=> b!236538 (= e!153611 (and (= (size!5901 (_values!4376 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10386 thiss!1504))) (not (= (size!5902 (_keys!6476 thiss!1504)) (size!5901 (_values!4376 thiss!1504))))))))

(declare-fun b!236539 () Bool)

(declare-fun res!115982 () Bool)

(declare-fun e!153612 () Bool)

(assert (=> b!236539 (=> (not res!115982) (not e!153612))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!236539 (= res!115982 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10542 () Bool)

(declare-fun mapRes!10542 () Bool)

(declare-fun tp!22262 () Bool)

(assert (=> mapNonEmpty!10542 (= mapRes!10542 (and tp!22262 e!153614))))

(declare-fun mapRest!10542 () (Array (_ BitVec 32) ValueCell!2768))

(declare-fun mapKey!10542 () (_ BitVec 32))

(declare-fun mapValue!10542 () ValueCell!2768)

(assert (=> mapNonEmpty!10542 (= (arr!5563 (_values!4376 thiss!1504)) (store mapRest!10542 mapKey!10542 mapValue!10542))))

(declare-fun res!115981 () Bool)

(assert (=> start!22644 (=> (not res!115981) (not e!153612))))

(declare-fun valid!1371 (LongMapFixedSize!3436) Bool)

(assert (=> start!22644 (= res!115981 (valid!1371 thiss!1504))))

(assert (=> start!22644 e!153612))

(declare-fun e!153613 () Bool)

(assert (=> start!22644 e!153613))

(assert (=> start!22644 true))

(declare-fun e!153615 () Bool)

(declare-fun array_inv!3655 (array!11711) Bool)

(declare-fun array_inv!3656 (array!11709) Bool)

(assert (=> b!236540 (= e!153613 (and tp!22263 tp_is_empty!6223 (array_inv!3655 (_keys!6476 thiss!1504)) (array_inv!3656 (_values!4376 thiss!1504)) e!153615))))

(declare-fun b!236541 () Bool)

(declare-fun e!153609 () Bool)

(assert (=> b!236541 (= e!153615 (and e!153609 mapRes!10542))))

(declare-fun condMapEmpty!10542 () Bool)

(declare-fun mapDefault!10542 () ValueCell!2768)

(assert (=> b!236541 (= condMapEmpty!10542 (= (arr!5563 (_values!4376 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2768)) mapDefault!10542)))))

(declare-fun b!236542 () Bool)

(assert (=> b!236542 (= e!153612 e!153611)))

(declare-fun res!115980 () Bool)

(assert (=> b!236542 (=> (not res!115980) (not e!153611))))

(declare-datatypes ((SeekEntryResult!973 0))(
  ( (MissingZero!973 (index!6062 (_ BitVec 32))) (Found!973 (index!6063 (_ BitVec 32))) (Intermediate!973 (undefined!1785 Bool) (index!6064 (_ BitVec 32)) (x!23855 (_ BitVec 32))) (Undefined!973) (MissingVacant!973 (index!6065 (_ BitVec 32))) )
))
(declare-fun lt!119636 () SeekEntryResult!973)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236542 (= res!115980 (or (= lt!119636 (MissingZero!973 index!297)) (= lt!119636 (MissingVacant!973 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11711 (_ BitVec 32)) SeekEntryResult!973)

(assert (=> b!236542 (= lt!119636 (seekEntryOrOpen!0 key!932 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)))))

(declare-fun mapIsEmpty!10542 () Bool)

(assert (=> mapIsEmpty!10542 mapRes!10542))

(declare-fun b!236543 () Bool)

(declare-fun res!115979 () Bool)

(assert (=> b!236543 (=> (not res!115979) (not e!153611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236543 (= res!115979 (validMask!0 (mask!10386 thiss!1504)))))

(declare-fun b!236544 () Bool)

(assert (=> b!236544 (= e!153609 tp_is_empty!6223)))

(declare-fun b!236545 () Bool)

(declare-fun res!115978 () Bool)

(assert (=> b!236545 (=> (not res!115978) (not e!153611))))

(declare-datatypes ((tuple2!4576 0))(
  ( (tuple2!4577 (_1!2299 (_ BitVec 64)) (_2!2299 V!7945)) )
))
(declare-datatypes ((List!3475 0))(
  ( (Nil!3472) (Cons!3471 (h!4124 tuple2!4576) (t!8448 List!3475)) )
))
(declare-datatypes ((ListLongMap!3491 0))(
  ( (ListLongMap!3492 (toList!1761 List!3475)) )
))
(declare-fun contains!1655 (ListLongMap!3491 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1293 (array!11711 array!11709 (_ BitVec 32) (_ BitVec 32) V!7945 V!7945 (_ BitVec 32) Int) ListLongMap!3491)

(assert (=> b!236545 (= res!115978 (not (contains!1655 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)) key!932)))))

(assert (= (and start!22644 res!115981) b!236539))

(assert (= (and b!236539 res!115982) b!236542))

(assert (= (and b!236542 res!115980) b!236545))

(assert (= (and b!236545 res!115978) b!236543))

(assert (= (and b!236543 res!115979) b!236538))

(assert (= (and b!236541 condMapEmpty!10542) mapIsEmpty!10542))

(assert (= (and b!236541 (not condMapEmpty!10542)) mapNonEmpty!10542))

(get-info :version)

(assert (= (and mapNonEmpty!10542 ((_ is ValueCellFull!2768) mapValue!10542)) b!236537))

(assert (= (and b!236541 ((_ is ValueCellFull!2768) mapDefault!10542)) b!236544))

(assert (= b!236540 b!236541))

(assert (= start!22644 b!236540))

(declare-fun m!257553 () Bool)

(assert (=> b!236540 m!257553))

(declare-fun m!257555 () Bool)

(assert (=> b!236540 m!257555))

(declare-fun m!257557 () Bool)

(assert (=> mapNonEmpty!10542 m!257557))

(declare-fun m!257559 () Bool)

(assert (=> b!236545 m!257559))

(assert (=> b!236545 m!257559))

(declare-fun m!257561 () Bool)

(assert (=> b!236545 m!257561))

(declare-fun m!257563 () Bool)

(assert (=> b!236542 m!257563))

(declare-fun m!257565 () Bool)

(assert (=> b!236543 m!257565))

(declare-fun m!257567 () Bool)

(assert (=> start!22644 m!257567))

(check-sat (not mapNonEmpty!10542) (not b!236542) (not b_next!6361) (not start!22644) (not b!236543) (not b!236540) tp_is_empty!6223 b_and!13315 (not b!236545))
(check-sat b_and!13315 (not b_next!6361))
(get-model)

(declare-fun d!59499 () Bool)

(declare-fun lt!119649 () SeekEntryResult!973)

(assert (=> d!59499 (and (or ((_ is Undefined!973) lt!119649) (not ((_ is Found!973) lt!119649)) (and (bvsge (index!6063 lt!119649) #b00000000000000000000000000000000) (bvslt (index!6063 lt!119649) (size!5902 (_keys!6476 thiss!1504))))) (or ((_ is Undefined!973) lt!119649) ((_ is Found!973) lt!119649) (not ((_ is MissingZero!973) lt!119649)) (and (bvsge (index!6062 lt!119649) #b00000000000000000000000000000000) (bvslt (index!6062 lt!119649) (size!5902 (_keys!6476 thiss!1504))))) (or ((_ is Undefined!973) lt!119649) ((_ is Found!973) lt!119649) ((_ is MissingZero!973) lt!119649) (not ((_ is MissingVacant!973) lt!119649)) (and (bvsge (index!6065 lt!119649) #b00000000000000000000000000000000) (bvslt (index!6065 lt!119649) (size!5902 (_keys!6476 thiss!1504))))) (or ((_ is Undefined!973) lt!119649) (ite ((_ is Found!973) lt!119649) (= (select (arr!5564 (_keys!6476 thiss!1504)) (index!6063 lt!119649)) key!932) (ite ((_ is MissingZero!973) lt!119649) (= (select (arr!5564 (_keys!6476 thiss!1504)) (index!6062 lt!119649)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!973) lt!119649) (= (select (arr!5564 (_keys!6476 thiss!1504)) (index!6065 lt!119649)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!153666 () SeekEntryResult!973)

(assert (=> d!59499 (= lt!119649 e!153666)))

(declare-fun c!39416 () Bool)

(declare-fun lt!119650 () SeekEntryResult!973)

(assert (=> d!59499 (= c!39416 (and ((_ is Intermediate!973) lt!119650) (undefined!1785 lt!119650)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11711 (_ BitVec 32)) SeekEntryResult!973)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59499 (= lt!119650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10386 thiss!1504)) key!932 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)))))

(assert (=> d!59499 (validMask!0 (mask!10386 thiss!1504))))

(assert (=> d!59499 (= (seekEntryOrOpen!0 key!932 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)) lt!119649)))

(declare-fun b!236612 () Bool)

(declare-fun e!153665 () SeekEntryResult!973)

(assert (=> b!236612 (= e!153666 e!153665)))

(declare-fun lt!119651 () (_ BitVec 64))

(assert (=> b!236612 (= lt!119651 (select (arr!5564 (_keys!6476 thiss!1504)) (index!6064 lt!119650)))))

(declare-fun c!39417 () Bool)

(assert (=> b!236612 (= c!39417 (= lt!119651 key!932))))

(declare-fun b!236613 () Bool)

(assert (=> b!236613 (= e!153665 (Found!973 (index!6064 lt!119650)))))

(declare-fun b!236614 () Bool)

(assert (=> b!236614 (= e!153666 Undefined!973)))

(declare-fun b!236615 () Bool)

(declare-fun c!39415 () Bool)

(assert (=> b!236615 (= c!39415 (= lt!119651 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153664 () SeekEntryResult!973)

(assert (=> b!236615 (= e!153665 e!153664)))

(declare-fun b!236616 () Bool)

(assert (=> b!236616 (= e!153664 (MissingZero!973 (index!6064 lt!119650)))))

(declare-fun b!236617 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11711 (_ BitVec 32)) SeekEntryResult!973)

(assert (=> b!236617 (= e!153664 (seekKeyOrZeroReturnVacant!0 (x!23855 lt!119650) (index!6064 lt!119650) (index!6064 lt!119650) key!932 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)))))

(assert (= (and d!59499 c!39416) b!236614))

(assert (= (and d!59499 (not c!39416)) b!236612))

(assert (= (and b!236612 c!39417) b!236613))

(assert (= (and b!236612 (not c!39417)) b!236615))

(assert (= (and b!236615 c!39415) b!236616))

(assert (= (and b!236615 (not c!39415)) b!236617))

(declare-fun m!257601 () Bool)

(assert (=> d!59499 m!257601))

(assert (=> d!59499 m!257565))

(declare-fun m!257603 () Bool)

(assert (=> d!59499 m!257603))

(assert (=> d!59499 m!257603))

(declare-fun m!257605 () Bool)

(assert (=> d!59499 m!257605))

(declare-fun m!257607 () Bool)

(assert (=> d!59499 m!257607))

(declare-fun m!257609 () Bool)

(assert (=> d!59499 m!257609))

(declare-fun m!257611 () Bool)

(assert (=> b!236612 m!257611))

(declare-fun m!257613 () Bool)

(assert (=> b!236617 m!257613))

(assert (=> b!236542 d!59499))

(declare-fun d!59501 () Bool)

(declare-fun e!153671 () Bool)

(assert (=> d!59501 e!153671))

(declare-fun res!116015 () Bool)

(assert (=> d!59501 (=> res!116015 e!153671)))

(declare-fun lt!119663 () Bool)

(assert (=> d!59501 (= res!116015 (not lt!119663))))

(declare-fun lt!119662 () Bool)

(assert (=> d!59501 (= lt!119663 lt!119662)))

(declare-datatypes ((Unit!7267 0))(
  ( (Unit!7268) )
))
(declare-fun lt!119661 () Unit!7267)

(declare-fun e!153672 () Unit!7267)

(assert (=> d!59501 (= lt!119661 e!153672)))

(declare-fun c!39420 () Bool)

(assert (=> d!59501 (= c!39420 lt!119662)))

(declare-fun containsKey!264 (List!3475 (_ BitVec 64)) Bool)

(assert (=> d!59501 (= lt!119662 (containsKey!264 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(assert (=> d!59501 (= (contains!1655 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)) key!932) lt!119663)))

(declare-fun b!236624 () Bool)

(declare-fun lt!119660 () Unit!7267)

(assert (=> b!236624 (= e!153672 lt!119660)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!212 (List!3475 (_ BitVec 64)) Unit!7267)

(assert (=> b!236624 (= lt!119660 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(declare-datatypes ((Option!279 0))(
  ( (Some!278 (v!5191 V!7945)) (None!277) )
))
(declare-fun isDefined!213 (Option!279) Bool)

(declare-fun getValueByKey!273 (List!3475 (_ BitVec 64)) Option!279)

(assert (=> b!236624 (isDefined!213 (getValueByKey!273 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(declare-fun b!236625 () Bool)

(declare-fun Unit!7269 () Unit!7267)

(assert (=> b!236625 (= e!153672 Unit!7269)))

(declare-fun b!236626 () Bool)

(assert (=> b!236626 (= e!153671 (isDefined!213 (getValueByKey!273 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932)))))

(assert (= (and d!59501 c!39420) b!236624))

(assert (= (and d!59501 (not c!39420)) b!236625))

(assert (= (and d!59501 (not res!116015)) b!236626))

(declare-fun m!257615 () Bool)

(assert (=> d!59501 m!257615))

(declare-fun m!257617 () Bool)

(assert (=> b!236624 m!257617))

(declare-fun m!257619 () Bool)

(assert (=> b!236624 m!257619))

(assert (=> b!236624 m!257619))

(declare-fun m!257621 () Bool)

(assert (=> b!236624 m!257621))

(assert (=> b!236626 m!257619))

(assert (=> b!236626 m!257619))

(assert (=> b!236626 m!257621))

(assert (=> b!236545 d!59501))

(declare-fun bm!21984 () Bool)

(declare-fun call!21988 () Bool)

(declare-fun lt!119714 () ListLongMap!3491)

(assert (=> bm!21984 (= call!21988 (contains!1655 lt!119714 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21985 () Bool)

(declare-fun call!21991 () ListLongMap!3491)

(declare-fun getCurrentListMapNoExtraKeys!530 (array!11711 array!11709 (_ BitVec 32) (_ BitVec 32) V!7945 V!7945 (_ BitVec 32) Int) ListLongMap!3491)

(assert (=> bm!21985 (= call!21991 (getCurrentListMapNoExtraKeys!530 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))

(declare-fun b!236669 () Bool)

(declare-fun e!153702 () ListLongMap!3491)

(declare-fun call!21989 () ListLongMap!3491)

(declare-fun +!641 (ListLongMap!3491 tuple2!4576) ListLongMap!3491)

(assert (=> b!236669 (= e!153702 (+!641 call!21989 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))

(declare-fun b!236670 () Bool)

(declare-fun e!153705 () Bool)

(declare-fun e!153701 () Bool)

(assert (=> b!236670 (= e!153705 e!153701)))

(declare-fun c!39433 () Bool)

(assert (=> b!236670 (= c!39433 (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236671 () Bool)

(declare-fun e!153703 () Bool)

(declare-fun e!153709 () Bool)

(assert (=> b!236671 (= e!153703 e!153709)))

(declare-fun res!116035 () Bool)

(declare-fun call!21993 () Bool)

(assert (=> b!236671 (= res!116035 call!21993)))

(assert (=> b!236671 (=> (not res!116035) (not e!153709))))

(declare-fun bm!21986 () Bool)

(declare-fun call!21987 () ListLongMap!3491)

(assert (=> bm!21986 (= call!21987 call!21989)))

(declare-fun b!236672 () Bool)

(declare-fun e!153708 () ListLongMap!3491)

(assert (=> b!236672 (= e!153702 e!153708)))

(declare-fun c!39436 () Bool)

(assert (=> b!236672 (= c!39436 (and (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236674 () Bool)

(declare-fun e!153700 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!236674 (= e!153700 (validKeyInArray!0 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236675 () Bool)

(declare-fun e!153707 () Bool)

(declare-fun apply!214 (ListLongMap!3491 (_ BitVec 64)) V!7945)

(assert (=> b!236675 (= e!153707 (= (apply!214 lt!119714 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4234 thiss!1504)))))

(declare-fun b!236676 () Bool)

(declare-fun res!116037 () Bool)

(assert (=> b!236676 (=> (not res!116037) (not e!153705))))

(declare-fun e!153706 () Bool)

(assert (=> b!236676 (= res!116037 e!153706)))

(declare-fun res!116039 () Bool)

(assert (=> b!236676 (=> res!116039 e!153706)))

(assert (=> b!236676 (= res!116039 (not e!153700))))

(declare-fun res!116042 () Bool)

(assert (=> b!236676 (=> (not res!116042) (not e!153700))))

(assert (=> b!236676 (= res!116042 (bvslt #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(declare-fun bm!21987 () Bool)

(declare-fun call!21990 () ListLongMap!3491)

(assert (=> bm!21987 (= call!21990 call!21991)))

(declare-fun bm!21988 () Bool)

(declare-fun call!21992 () ListLongMap!3491)

(assert (=> bm!21988 (= call!21992 call!21990)))

(declare-fun b!236677 () Bool)

(declare-fun c!39435 () Bool)

(assert (=> b!236677 (= c!39435 (and (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!153704 () ListLongMap!3491)

(assert (=> b!236677 (= e!153708 e!153704)))

(declare-fun b!236678 () Bool)

(declare-fun e!153711 () Bool)

(assert (=> b!236678 (= e!153711 (validKeyInArray!0 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236679 () Bool)

(assert (=> b!236679 (= e!153703 (not call!21993))))

(declare-fun b!236680 () Bool)

(declare-fun e!153710 () Bool)

(assert (=> b!236680 (= e!153706 e!153710)))

(declare-fun res!116034 () Bool)

(assert (=> b!236680 (=> (not res!116034) (not e!153710))))

(assert (=> b!236680 (= res!116034 (contains!1655 lt!119714 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236680 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(declare-fun b!236681 () Bool)

(assert (=> b!236681 (= e!153701 (not call!21988))))

(declare-fun b!236682 () Bool)

(assert (=> b!236682 (= e!153701 e!153707)))

(declare-fun res!116041 () Bool)

(assert (=> b!236682 (= res!116041 call!21988)))

(assert (=> b!236682 (=> (not res!116041) (not e!153707))))

(declare-fun b!236673 () Bool)

(declare-fun res!116040 () Bool)

(assert (=> b!236673 (=> (not res!116040) (not e!153705))))

(assert (=> b!236673 (= res!116040 e!153703)))

(declare-fun c!39434 () Bool)

(assert (=> b!236673 (= c!39434 (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!59503 () Bool)

(assert (=> d!59503 e!153705))

(declare-fun res!116038 () Bool)

(assert (=> d!59503 (=> (not res!116038) (not e!153705))))

(assert (=> d!59503 (= res!116038 (or (bvsge #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))))

(declare-fun lt!119724 () ListLongMap!3491)

(assert (=> d!59503 (= lt!119714 lt!119724)))

(declare-fun lt!119722 () Unit!7267)

(declare-fun e!153699 () Unit!7267)

(assert (=> d!59503 (= lt!119722 e!153699)))

(declare-fun c!39437 () Bool)

(assert (=> d!59503 (= c!39437 e!153711)))

(declare-fun res!116036 () Bool)

(assert (=> d!59503 (=> (not res!116036) (not e!153711))))

(assert (=> d!59503 (= res!116036 (bvslt #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(assert (=> d!59503 (= lt!119724 e!153702)))

(declare-fun c!39438 () Bool)

(assert (=> d!59503 (= c!39438 (and (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4130 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59503 (validMask!0 (mask!10386 thiss!1504))))

(assert (=> d!59503 (= (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)) lt!119714)))

(declare-fun b!236683 () Bool)

(declare-fun get!2868 (ValueCell!2768 V!7945) V!7945)

(declare-fun dynLambda!557 (Int (_ BitVec 64)) V!7945)

(assert (=> b!236683 (= e!153710 (= (apply!214 lt!119714 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)) (get!2868 (select (arr!5563 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5901 (_values!4376 thiss!1504))))))

(assert (=> b!236683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(declare-fun b!236684 () Bool)

(assert (=> b!236684 (= e!153704 call!21992)))

(declare-fun b!236685 () Bool)

(declare-fun lt!119717 () Unit!7267)

(assert (=> b!236685 (= e!153699 lt!119717)))

(declare-fun lt!119711 () ListLongMap!3491)

(assert (=> b!236685 (= lt!119711 (getCurrentListMapNoExtraKeys!530 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))

(declare-fun lt!119729 () (_ BitVec 64))

(assert (=> b!236685 (= lt!119729 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119726 () (_ BitVec 64))

(assert (=> b!236685 (= lt!119726 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119710 () Unit!7267)

(declare-fun addStillContains!190 (ListLongMap!3491 (_ BitVec 64) V!7945 (_ BitVec 64)) Unit!7267)

(assert (=> b!236685 (= lt!119710 (addStillContains!190 lt!119711 lt!119729 (zeroValue!4234 thiss!1504) lt!119726))))

(assert (=> b!236685 (contains!1655 (+!641 lt!119711 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504))) lt!119726)))

(declare-fun lt!119712 () Unit!7267)

(assert (=> b!236685 (= lt!119712 lt!119710)))

(declare-fun lt!119708 () ListLongMap!3491)

(assert (=> b!236685 (= lt!119708 (getCurrentListMapNoExtraKeys!530 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))

(declare-fun lt!119719 () (_ BitVec 64))

(assert (=> b!236685 (= lt!119719 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119723 () (_ BitVec 64))

(assert (=> b!236685 (= lt!119723 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119709 () Unit!7267)

(declare-fun addApplyDifferent!190 (ListLongMap!3491 (_ BitVec 64) V!7945 (_ BitVec 64)) Unit!7267)

(assert (=> b!236685 (= lt!119709 (addApplyDifferent!190 lt!119708 lt!119719 (minValue!4234 thiss!1504) lt!119723))))

(assert (=> b!236685 (= (apply!214 (+!641 lt!119708 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504))) lt!119723) (apply!214 lt!119708 lt!119723))))

(declare-fun lt!119728 () Unit!7267)

(assert (=> b!236685 (= lt!119728 lt!119709)))

(declare-fun lt!119720 () ListLongMap!3491)

(assert (=> b!236685 (= lt!119720 (getCurrentListMapNoExtraKeys!530 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))

(declare-fun lt!119716 () (_ BitVec 64))

(assert (=> b!236685 (= lt!119716 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119718 () (_ BitVec 64))

(assert (=> b!236685 (= lt!119718 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119713 () Unit!7267)

(assert (=> b!236685 (= lt!119713 (addApplyDifferent!190 lt!119720 lt!119716 (zeroValue!4234 thiss!1504) lt!119718))))

(assert (=> b!236685 (= (apply!214 (+!641 lt!119720 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504))) lt!119718) (apply!214 lt!119720 lt!119718))))

(declare-fun lt!119715 () Unit!7267)

(assert (=> b!236685 (= lt!119715 lt!119713)))

(declare-fun lt!119725 () ListLongMap!3491)

(assert (=> b!236685 (= lt!119725 (getCurrentListMapNoExtraKeys!530 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))

(declare-fun lt!119721 () (_ BitVec 64))

(assert (=> b!236685 (= lt!119721 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119727 () (_ BitVec 64))

(assert (=> b!236685 (= lt!119727 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236685 (= lt!119717 (addApplyDifferent!190 lt!119725 lt!119721 (minValue!4234 thiss!1504) lt!119727))))

(assert (=> b!236685 (= (apply!214 (+!641 lt!119725 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504))) lt!119727) (apply!214 lt!119725 lt!119727))))

(declare-fun bm!21989 () Bool)

(assert (=> bm!21989 (= call!21989 (+!641 (ite c!39438 call!21991 (ite c!39436 call!21990 call!21992)) (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(declare-fun bm!21990 () Bool)

(assert (=> bm!21990 (= call!21993 (contains!1655 lt!119714 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236686 () Bool)

(assert (=> b!236686 (= e!153708 call!21987)))

(declare-fun b!236687 () Bool)

(declare-fun Unit!7270 () Unit!7267)

(assert (=> b!236687 (= e!153699 Unit!7270)))

(declare-fun b!236688 () Bool)

(assert (=> b!236688 (= e!153704 call!21987)))

(declare-fun b!236689 () Bool)

(assert (=> b!236689 (= e!153709 (= (apply!214 lt!119714 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4234 thiss!1504)))))

(assert (= (and d!59503 c!39438) b!236669))

(assert (= (and d!59503 (not c!39438)) b!236672))

(assert (= (and b!236672 c!39436) b!236686))

(assert (= (and b!236672 (not c!39436)) b!236677))

(assert (= (and b!236677 c!39435) b!236688))

(assert (= (and b!236677 (not c!39435)) b!236684))

(assert (= (or b!236688 b!236684) bm!21988))

(assert (= (or b!236686 bm!21988) bm!21987))

(assert (= (or b!236686 b!236688) bm!21986))

(assert (= (or b!236669 bm!21987) bm!21985))

(assert (= (or b!236669 bm!21986) bm!21989))

(assert (= (and d!59503 res!116036) b!236678))

(assert (= (and d!59503 c!39437) b!236685))

(assert (= (and d!59503 (not c!39437)) b!236687))

(assert (= (and d!59503 res!116038) b!236676))

(assert (= (and b!236676 res!116042) b!236674))

(assert (= (and b!236676 (not res!116039)) b!236680))

(assert (= (and b!236680 res!116034) b!236683))

(assert (= (and b!236676 res!116037) b!236673))

(assert (= (and b!236673 c!39434) b!236671))

(assert (= (and b!236673 (not c!39434)) b!236679))

(assert (= (and b!236671 res!116035) b!236689))

(assert (= (or b!236671 b!236679) bm!21990))

(assert (= (and b!236673 res!116040) b!236670))

(assert (= (and b!236670 c!39433) b!236682))

(assert (= (and b!236670 (not c!39433)) b!236681))

(assert (= (and b!236682 res!116041) b!236675))

(assert (= (or b!236682 b!236681) bm!21984))

(declare-fun b_lambda!7949 () Bool)

(assert (=> (not b_lambda!7949) (not b!236683)))

(declare-fun t!8451 () Bool)

(declare-fun tb!2933 () Bool)

(assert (=> (and b!236540 (= (defaultEntry!4393 thiss!1504) (defaultEntry!4393 thiss!1504)) t!8451) tb!2933))

(declare-fun result!5137 () Bool)

(assert (=> tb!2933 (= result!5137 tp_is_empty!6223)))

(assert (=> b!236683 t!8451))

(declare-fun b_and!13321 () Bool)

(assert (= b_and!13315 (and (=> t!8451 result!5137) b_and!13321)))

(declare-fun m!257623 () Bool)

(assert (=> bm!21984 m!257623))

(declare-fun m!257625 () Bool)

(assert (=> b!236669 m!257625))

(declare-fun m!257627 () Bool)

(assert (=> b!236685 m!257627))

(declare-fun m!257629 () Bool)

(assert (=> b!236685 m!257629))

(declare-fun m!257631 () Bool)

(assert (=> b!236685 m!257631))

(assert (=> b!236685 m!257629))

(declare-fun m!257633 () Bool)

(assert (=> b!236685 m!257633))

(declare-fun m!257635 () Bool)

(assert (=> b!236685 m!257635))

(declare-fun m!257637 () Bool)

(assert (=> b!236685 m!257637))

(declare-fun m!257639 () Bool)

(assert (=> b!236685 m!257639))

(declare-fun m!257641 () Bool)

(assert (=> b!236685 m!257641))

(declare-fun m!257643 () Bool)

(assert (=> b!236685 m!257643))

(declare-fun m!257645 () Bool)

(assert (=> b!236685 m!257645))

(assert (=> b!236685 m!257637))

(declare-fun m!257647 () Bool)

(assert (=> b!236685 m!257647))

(declare-fun m!257649 () Bool)

(assert (=> b!236685 m!257649))

(declare-fun m!257651 () Bool)

(assert (=> b!236685 m!257651))

(declare-fun m!257653 () Bool)

(assert (=> b!236685 m!257653))

(assert (=> b!236685 m!257649))

(declare-fun m!257655 () Bool)

(assert (=> b!236685 m!257655))

(assert (=> b!236685 m!257631))

(declare-fun m!257657 () Bool)

(assert (=> b!236685 m!257657))

(declare-fun m!257659 () Bool)

(assert (=> b!236685 m!257659))

(declare-fun m!257661 () Bool)

(assert (=> b!236675 m!257661))

(assert (=> b!236680 m!257651))

(assert (=> b!236680 m!257651))

(declare-fun m!257663 () Bool)

(assert (=> b!236680 m!257663))

(assert (=> bm!21985 m!257641))

(assert (=> d!59503 m!257565))

(declare-fun m!257665 () Bool)

(assert (=> bm!21989 m!257665))

(declare-fun m!257667 () Bool)

(assert (=> b!236683 m!257667))

(declare-fun m!257669 () Bool)

(assert (=> b!236683 m!257669))

(assert (=> b!236683 m!257651))

(declare-fun m!257671 () Bool)

(assert (=> b!236683 m!257671))

(assert (=> b!236683 m!257669))

(assert (=> b!236683 m!257667))

(declare-fun m!257673 () Bool)

(assert (=> b!236683 m!257673))

(assert (=> b!236683 m!257651))

(declare-fun m!257675 () Bool)

(assert (=> bm!21990 m!257675))

(assert (=> b!236674 m!257651))

(assert (=> b!236674 m!257651))

(declare-fun m!257677 () Bool)

(assert (=> b!236674 m!257677))

(assert (=> b!236678 m!257651))

(assert (=> b!236678 m!257651))

(assert (=> b!236678 m!257677))

(declare-fun m!257679 () Bool)

(assert (=> b!236689 m!257679))

(assert (=> b!236545 d!59503))

(declare-fun d!59505 () Bool)

(assert (=> d!59505 (= (array_inv!3655 (_keys!6476 thiss!1504)) (bvsge (size!5902 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236540 d!59505))

(declare-fun d!59507 () Bool)

(assert (=> d!59507 (= (array_inv!3656 (_values!4376 thiss!1504)) (bvsge (size!5901 (_values!4376 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236540 d!59507))

(declare-fun d!59509 () Bool)

(assert (=> d!59509 (= (validMask!0 (mask!10386 thiss!1504)) (and (or (= (mask!10386 thiss!1504) #b00000000000000000000000000000111) (= (mask!10386 thiss!1504) #b00000000000000000000000000001111) (= (mask!10386 thiss!1504) #b00000000000000000000000000011111) (= (mask!10386 thiss!1504) #b00000000000000000000000000111111) (= (mask!10386 thiss!1504) #b00000000000000000000000001111111) (= (mask!10386 thiss!1504) #b00000000000000000000000011111111) (= (mask!10386 thiss!1504) #b00000000000000000000000111111111) (= (mask!10386 thiss!1504) #b00000000000000000000001111111111) (= (mask!10386 thiss!1504) #b00000000000000000000011111111111) (= (mask!10386 thiss!1504) #b00000000000000000000111111111111) (= (mask!10386 thiss!1504) #b00000000000000000001111111111111) (= (mask!10386 thiss!1504) #b00000000000000000011111111111111) (= (mask!10386 thiss!1504) #b00000000000000000111111111111111) (= (mask!10386 thiss!1504) #b00000000000000001111111111111111) (= (mask!10386 thiss!1504) #b00000000000000011111111111111111) (= (mask!10386 thiss!1504) #b00000000000000111111111111111111) (= (mask!10386 thiss!1504) #b00000000000001111111111111111111) (= (mask!10386 thiss!1504) #b00000000000011111111111111111111) (= (mask!10386 thiss!1504) #b00000000000111111111111111111111) (= (mask!10386 thiss!1504) #b00000000001111111111111111111111) (= (mask!10386 thiss!1504) #b00000000011111111111111111111111) (= (mask!10386 thiss!1504) #b00000000111111111111111111111111) (= (mask!10386 thiss!1504) #b00000001111111111111111111111111) (= (mask!10386 thiss!1504) #b00000011111111111111111111111111) (= (mask!10386 thiss!1504) #b00000111111111111111111111111111) (= (mask!10386 thiss!1504) #b00001111111111111111111111111111) (= (mask!10386 thiss!1504) #b00011111111111111111111111111111) (= (mask!10386 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10386 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!236543 d!59509))

(declare-fun d!59511 () Bool)

(declare-fun res!116049 () Bool)

(declare-fun e!153714 () Bool)

(assert (=> d!59511 (=> (not res!116049) (not e!153714))))

(declare-fun simpleValid!237 (LongMapFixedSize!3436) Bool)

(assert (=> d!59511 (= res!116049 (simpleValid!237 thiss!1504))))

(assert (=> d!59511 (= (valid!1371 thiss!1504) e!153714)))

(declare-fun b!236698 () Bool)

(declare-fun res!116050 () Bool)

(assert (=> b!236698 (=> (not res!116050) (not e!153714))))

(declare-fun arrayCountValidKeys!0 (array!11711 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236698 (= res!116050 (= (arrayCountValidKeys!0 (_keys!6476 thiss!1504) #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))) (_size!1767 thiss!1504)))))

(declare-fun b!236699 () Bool)

(declare-fun res!116051 () Bool)

(assert (=> b!236699 (=> (not res!116051) (not e!153714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11711 (_ BitVec 32)) Bool)

(assert (=> b!236699 (= res!116051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)))))

(declare-fun b!236700 () Bool)

(declare-datatypes ((List!3477 0))(
  ( (Nil!3474) (Cons!3473 (h!4126 (_ BitVec 64)) (t!8452 List!3477)) )
))
(declare-fun arrayNoDuplicates!0 (array!11711 (_ BitVec 32) List!3477) Bool)

(assert (=> b!236700 (= e!153714 (arrayNoDuplicates!0 (_keys!6476 thiss!1504) #b00000000000000000000000000000000 Nil!3474))))

(assert (= (and d!59511 res!116049) b!236698))

(assert (= (and b!236698 res!116050) b!236699))

(assert (= (and b!236699 res!116051) b!236700))

(declare-fun m!257681 () Bool)

(assert (=> d!59511 m!257681))

(declare-fun m!257683 () Bool)

(assert (=> b!236698 m!257683))

(declare-fun m!257685 () Bool)

(assert (=> b!236699 m!257685))

(declare-fun m!257687 () Bool)

(assert (=> b!236700 m!257687))

(assert (=> start!22644 d!59511))

(declare-fun mapIsEmpty!10551 () Bool)

(declare-fun mapRes!10551 () Bool)

(assert (=> mapIsEmpty!10551 mapRes!10551))

(declare-fun b!236707 () Bool)

(declare-fun e!153719 () Bool)

(assert (=> b!236707 (= e!153719 tp_is_empty!6223)))

(declare-fun b!236708 () Bool)

(declare-fun e!153720 () Bool)

(assert (=> b!236708 (= e!153720 tp_is_empty!6223)))

(declare-fun mapNonEmpty!10551 () Bool)

(declare-fun tp!22278 () Bool)

(assert (=> mapNonEmpty!10551 (= mapRes!10551 (and tp!22278 e!153719))))

(declare-fun mapRest!10551 () (Array (_ BitVec 32) ValueCell!2768))

(declare-fun mapKey!10551 () (_ BitVec 32))

(declare-fun mapValue!10551 () ValueCell!2768)

(assert (=> mapNonEmpty!10551 (= mapRest!10542 (store mapRest!10551 mapKey!10551 mapValue!10551))))

(declare-fun condMapEmpty!10551 () Bool)

(declare-fun mapDefault!10551 () ValueCell!2768)

(assert (=> mapNonEmpty!10542 (= condMapEmpty!10551 (= mapRest!10542 ((as const (Array (_ BitVec 32) ValueCell!2768)) mapDefault!10551)))))

(assert (=> mapNonEmpty!10542 (= tp!22262 (and e!153720 mapRes!10551))))

(assert (= (and mapNonEmpty!10542 condMapEmpty!10551) mapIsEmpty!10551))

(assert (= (and mapNonEmpty!10542 (not condMapEmpty!10551)) mapNonEmpty!10551))

(assert (= (and mapNonEmpty!10551 ((_ is ValueCellFull!2768) mapValue!10551)) b!236707))

(assert (= (and mapNonEmpty!10542 ((_ is ValueCellFull!2768) mapDefault!10551)) b!236708))

(declare-fun m!257689 () Bool)

(assert (=> mapNonEmpty!10551 m!257689))

(declare-fun b_lambda!7951 () Bool)

(assert (= b_lambda!7949 (or (and b!236540 b_free!6361) b_lambda!7951)))

(check-sat (not b_lambda!7951) (not b!236685) (not b!236680) (not b!236683) (not d!59499) (not bm!21984) (not bm!21985) (not bm!21989) (not b!236617) b_and!13321 (not b!236700) (not b!236698) (not b!236689) (not mapNonEmpty!10551) (not b!236674) (not b!236675) (not b!236624) (not b!236669) (not b_next!6361) (not b!236699) tp_is_empty!6223 (not b!236626) (not d!59501) (not d!59511) (not b!236678) (not d!59503) (not bm!21990))
(check-sat b_and!13321 (not b_next!6361))
(get-model)

(declare-fun d!59513 () Bool)

(declare-fun e!153723 () Bool)

(assert (=> d!59513 e!153723))

(declare-fun res!116057 () Bool)

(assert (=> d!59513 (=> (not res!116057) (not e!153723))))

(declare-fun lt!119738 () ListLongMap!3491)

(assert (=> d!59513 (= res!116057 (contains!1655 lt!119738 (_1!2299 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(declare-fun lt!119740 () List!3475)

(assert (=> d!59513 (= lt!119738 (ListLongMap!3492 lt!119740))))

(declare-fun lt!119739 () Unit!7267)

(declare-fun lt!119741 () Unit!7267)

(assert (=> d!59513 (= lt!119739 lt!119741)))

(assert (=> d!59513 (= (getValueByKey!273 lt!119740 (_1!2299 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))) (Some!278 (_2!2299 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!153 (List!3475 (_ BitVec 64) V!7945) Unit!7267)

(assert (=> d!59513 (= lt!119741 (lemmaContainsTupThenGetReturnValue!153 lt!119740 (_1!2299 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))) (_2!2299 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(declare-fun insertStrictlySorted!156 (List!3475 (_ BitVec 64) V!7945) List!3475)

(assert (=> d!59513 (= lt!119740 (insertStrictlySorted!156 (toList!1761 call!21989) (_1!2299 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))) (_2!2299 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(assert (=> d!59513 (= (+!641 call!21989 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))) lt!119738)))

(declare-fun b!236713 () Bool)

(declare-fun res!116056 () Bool)

(assert (=> b!236713 (=> (not res!116056) (not e!153723))))

(assert (=> b!236713 (= res!116056 (= (getValueByKey!273 (toList!1761 lt!119738) (_1!2299 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))) (Some!278 (_2!2299 (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))))

(declare-fun b!236714 () Bool)

(declare-fun contains!1657 (List!3475 tuple2!4576) Bool)

(assert (=> b!236714 (= e!153723 (contains!1657 (toList!1761 lt!119738) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))

(assert (= (and d!59513 res!116057) b!236713))

(assert (= (and b!236713 res!116056) b!236714))

(declare-fun m!257691 () Bool)

(assert (=> d!59513 m!257691))

(declare-fun m!257693 () Bool)

(assert (=> d!59513 m!257693))

(declare-fun m!257695 () Bool)

(assert (=> d!59513 m!257695))

(declare-fun m!257697 () Bool)

(assert (=> d!59513 m!257697))

(declare-fun m!257699 () Bool)

(assert (=> b!236713 m!257699))

(declare-fun m!257701 () Bool)

(assert (=> b!236714 m!257701))

(assert (=> b!236669 d!59513))

(declare-fun d!59515 () Bool)

(declare-fun e!153724 () Bool)

(assert (=> d!59515 e!153724))

(declare-fun res!116058 () Bool)

(assert (=> d!59515 (=> res!116058 e!153724)))

(declare-fun lt!119745 () Bool)

(assert (=> d!59515 (= res!116058 (not lt!119745))))

(declare-fun lt!119744 () Bool)

(assert (=> d!59515 (= lt!119745 lt!119744)))

(declare-fun lt!119743 () Unit!7267)

(declare-fun e!153725 () Unit!7267)

(assert (=> d!59515 (= lt!119743 e!153725)))

(declare-fun c!39439 () Bool)

(assert (=> d!59515 (= c!39439 lt!119744)))

(assert (=> d!59515 (= lt!119744 (containsKey!264 (toList!1761 lt!119714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59515 (= (contains!1655 lt!119714 #b0000000000000000000000000000000000000000000000000000000000000000) lt!119745)))

(declare-fun b!236715 () Bool)

(declare-fun lt!119742 () Unit!7267)

(assert (=> b!236715 (= e!153725 lt!119742)))

(assert (=> b!236715 (= lt!119742 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1761 lt!119714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236715 (isDefined!213 (getValueByKey!273 (toList!1761 lt!119714) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236716 () Bool)

(declare-fun Unit!7271 () Unit!7267)

(assert (=> b!236716 (= e!153725 Unit!7271)))

(declare-fun b!236717 () Bool)

(assert (=> b!236717 (= e!153724 (isDefined!213 (getValueByKey!273 (toList!1761 lt!119714) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59515 c!39439) b!236715))

(assert (= (and d!59515 (not c!39439)) b!236716))

(assert (= (and d!59515 (not res!116058)) b!236717))

(declare-fun m!257703 () Bool)

(assert (=> d!59515 m!257703))

(declare-fun m!257705 () Bool)

(assert (=> b!236715 m!257705))

(declare-fun m!257707 () Bool)

(assert (=> b!236715 m!257707))

(assert (=> b!236715 m!257707))

(declare-fun m!257709 () Bool)

(assert (=> b!236715 m!257709))

(assert (=> b!236717 m!257707))

(assert (=> b!236717 m!257707))

(assert (=> b!236717 m!257709))

(assert (=> bm!21990 d!59515))

(declare-fun b!236726 () Bool)

(declare-fun e!153733 () Bool)

(declare-fun call!21996 () Bool)

(assert (=> b!236726 (= e!153733 call!21996)))

(declare-fun b!236727 () Bool)

(declare-fun e!153734 () Bool)

(assert (=> b!236727 (= e!153733 e!153734)))

(declare-fun lt!119752 () (_ BitVec 64))

(assert (=> b!236727 (= lt!119752 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119754 () Unit!7267)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11711 (_ BitVec 64) (_ BitVec 32)) Unit!7267)

(assert (=> b!236727 (= lt!119754 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6476 thiss!1504) lt!119752 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!236727 (arrayContainsKey!0 (_keys!6476 thiss!1504) lt!119752 #b00000000000000000000000000000000)))

(declare-fun lt!119753 () Unit!7267)

(assert (=> b!236727 (= lt!119753 lt!119754)))

(declare-fun res!116063 () Bool)

(assert (=> b!236727 (= res!116063 (= (seekEntryOrOpen!0 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000) (_keys!6476 thiss!1504) (mask!10386 thiss!1504)) (Found!973 #b00000000000000000000000000000000)))))

(assert (=> b!236727 (=> (not res!116063) (not e!153734))))

(declare-fun d!59517 () Bool)

(declare-fun res!116064 () Bool)

(declare-fun e!153732 () Bool)

(assert (=> d!59517 (=> res!116064 e!153732)))

(assert (=> d!59517 (= res!116064 (bvsge #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(assert (=> d!59517 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)) e!153732)))

(declare-fun b!236728 () Bool)

(assert (=> b!236728 (= e!153734 call!21996)))

(declare-fun bm!21993 () Bool)

(assert (=> bm!21993 (= call!21996 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6476 thiss!1504) (mask!10386 thiss!1504)))))

(declare-fun b!236729 () Bool)

(assert (=> b!236729 (= e!153732 e!153733)))

(declare-fun c!39442 () Bool)

(assert (=> b!236729 (= c!39442 (validKeyInArray!0 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59517 (not res!116064)) b!236729))

(assert (= (and b!236729 c!39442) b!236727))

(assert (= (and b!236729 (not c!39442)) b!236726))

(assert (= (and b!236727 res!116063) b!236728))

(assert (= (or b!236728 b!236726) bm!21993))

(assert (=> b!236727 m!257651))

(declare-fun m!257711 () Bool)

(assert (=> b!236727 m!257711))

(declare-fun m!257713 () Bool)

(assert (=> b!236727 m!257713))

(assert (=> b!236727 m!257651))

(declare-fun m!257715 () Bool)

(assert (=> b!236727 m!257715))

(declare-fun m!257717 () Bool)

(assert (=> bm!21993 m!257717))

(assert (=> b!236729 m!257651))

(assert (=> b!236729 m!257651))

(assert (=> b!236729 m!257677))

(assert (=> b!236699 d!59517))

(declare-fun d!59519 () Bool)

(declare-fun e!153735 () Bool)

(assert (=> d!59519 e!153735))

(declare-fun res!116066 () Bool)

(assert (=> d!59519 (=> (not res!116066) (not e!153735))))

(declare-fun lt!119755 () ListLongMap!3491)

(assert (=> d!59519 (= res!116066 (contains!1655 lt!119755 (_1!2299 (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))))

(declare-fun lt!119757 () List!3475)

(assert (=> d!59519 (= lt!119755 (ListLongMap!3492 lt!119757))))

(declare-fun lt!119756 () Unit!7267)

(declare-fun lt!119758 () Unit!7267)

(assert (=> d!59519 (= lt!119756 lt!119758)))

(assert (=> d!59519 (= (getValueByKey!273 lt!119757 (_1!2299 (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))) (Some!278 (_2!2299 (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))))

(assert (=> d!59519 (= lt!119758 (lemmaContainsTupThenGetReturnValue!153 lt!119757 (_1!2299 (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))) (_2!2299 (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))))

(assert (=> d!59519 (= lt!119757 (insertStrictlySorted!156 (toList!1761 (ite c!39438 call!21991 (ite c!39436 call!21990 call!21992))) (_1!2299 (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))) (_2!2299 (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))))))

(assert (=> d!59519 (= (+!641 (ite c!39438 call!21991 (ite c!39436 call!21990 call!21992)) (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))) lt!119755)))

(declare-fun b!236730 () Bool)

(declare-fun res!116065 () Bool)

(assert (=> b!236730 (=> (not res!116065) (not e!153735))))

(assert (=> b!236730 (= res!116065 (= (getValueByKey!273 (toList!1761 lt!119755) (_1!2299 (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504))))) (Some!278 (_2!2299 (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))))

(declare-fun b!236731 () Bool)

(assert (=> b!236731 (= e!153735 (contains!1657 (toList!1761 lt!119755) (ite (or c!39438 c!39436) (tuple2!4577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4234 thiss!1504)) (tuple2!4577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4234 thiss!1504)))))))

(assert (= (and d!59519 res!116066) b!236730))

(assert (= (and b!236730 res!116065) b!236731))

(declare-fun m!257719 () Bool)

(assert (=> d!59519 m!257719))

(declare-fun m!257721 () Bool)

(assert (=> d!59519 m!257721))

(declare-fun m!257723 () Bool)

(assert (=> d!59519 m!257723))

(declare-fun m!257725 () Bool)

(assert (=> d!59519 m!257725))

(declare-fun m!257727 () Bool)

(assert (=> b!236730 m!257727))

(declare-fun m!257729 () Bool)

(assert (=> b!236731 m!257729))

(assert (=> bm!21989 d!59519))

(declare-fun b!236743 () Bool)

(declare-fun e!153738 () Bool)

(assert (=> b!236743 (= e!153738 (and (bvsge (extraKeys!4130 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4130 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1767 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!236742 () Bool)

(declare-fun res!116077 () Bool)

(assert (=> b!236742 (=> (not res!116077) (not e!153738))))

(declare-fun size!5907 (LongMapFixedSize!3436) (_ BitVec 32))

(assert (=> b!236742 (= res!116077 (= (size!5907 thiss!1504) (bvadd (_size!1767 thiss!1504) (bvsdiv (bvadd (extraKeys!4130 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!59521 () Bool)

(declare-fun res!116078 () Bool)

(assert (=> d!59521 (=> (not res!116078) (not e!153738))))

(assert (=> d!59521 (= res!116078 (validMask!0 (mask!10386 thiss!1504)))))

(assert (=> d!59521 (= (simpleValid!237 thiss!1504) e!153738)))

(declare-fun b!236740 () Bool)

(declare-fun res!116075 () Bool)

(assert (=> b!236740 (=> (not res!116075) (not e!153738))))

(assert (=> b!236740 (= res!116075 (and (= (size!5901 (_values!4376 thiss!1504)) (bvadd (mask!10386 thiss!1504) #b00000000000000000000000000000001)) (= (size!5902 (_keys!6476 thiss!1504)) (size!5901 (_values!4376 thiss!1504))) (bvsge (_size!1767 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1767 thiss!1504) (bvadd (mask!10386 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!236741 () Bool)

(declare-fun res!116076 () Bool)

(assert (=> b!236741 (=> (not res!116076) (not e!153738))))

(assert (=> b!236741 (= res!116076 (bvsge (size!5907 thiss!1504) (_size!1767 thiss!1504)))))

(assert (= (and d!59521 res!116078) b!236740))

(assert (= (and b!236740 res!116075) b!236741))

(assert (= (and b!236741 res!116076) b!236742))

(assert (= (and b!236742 res!116077) b!236743))

(declare-fun m!257731 () Bool)

(assert (=> b!236742 m!257731))

(assert (=> d!59521 m!257565))

(assert (=> b!236741 m!257731))

(assert (=> d!59511 d!59521))

(declare-fun b!236752 () Bool)

(declare-fun e!153744 () (_ BitVec 32))

(declare-fun call!21999 () (_ BitVec 32))

(assert (=> b!236752 (= e!153744 call!21999)))

(declare-fun b!236753 () Bool)

(assert (=> b!236753 (= e!153744 (bvadd #b00000000000000000000000000000001 call!21999))))

(declare-fun b!236754 () Bool)

(declare-fun e!153743 () (_ BitVec 32))

(assert (=> b!236754 (= e!153743 #b00000000000000000000000000000000)))

(declare-fun b!236755 () Bool)

(assert (=> b!236755 (= e!153743 e!153744)))

(declare-fun c!39448 () Bool)

(assert (=> b!236755 (= c!39448 (validKeyInArray!0 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59523 () Bool)

(declare-fun lt!119761 () (_ BitVec 32))

(assert (=> d!59523 (and (bvsge lt!119761 #b00000000000000000000000000000000) (bvsle lt!119761 (bvsub (size!5902 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59523 (= lt!119761 e!153743)))

(declare-fun c!39447 () Bool)

(assert (=> d!59523 (= c!39447 (bvsge #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(assert (=> d!59523 (and (bvsle #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5902 (_keys!6476 thiss!1504)) (size!5902 (_keys!6476 thiss!1504))))))

(assert (=> d!59523 (= (arrayCountValidKeys!0 (_keys!6476 thiss!1504) #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))) lt!119761)))

(declare-fun bm!21996 () Bool)

(assert (=> bm!21996 (= call!21999 (arrayCountValidKeys!0 (_keys!6476 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5902 (_keys!6476 thiss!1504))))))

(assert (= (and d!59523 c!39447) b!236754))

(assert (= (and d!59523 (not c!39447)) b!236755))

(assert (= (and b!236755 c!39448) b!236753))

(assert (= (and b!236755 (not c!39448)) b!236752))

(assert (= (or b!236753 b!236752) bm!21996))

(assert (=> b!236755 m!257651))

(assert (=> b!236755 m!257651))

(assert (=> b!236755 m!257677))

(declare-fun m!257733 () Bool)

(assert (=> bm!21996 m!257733))

(assert (=> b!236698 d!59523))

(declare-fun b!236780 () Bool)

(declare-fun e!153759 () ListLongMap!3491)

(declare-fun e!153762 () ListLongMap!3491)

(assert (=> b!236780 (= e!153759 e!153762)))

(declare-fun c!39458 () Bool)

(assert (=> b!236780 (= c!39458 (validKeyInArray!0 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236781 () Bool)

(declare-fun call!22002 () ListLongMap!3491)

(assert (=> b!236781 (= e!153762 call!22002)))

(declare-fun b!236782 () Bool)

(declare-fun e!153760 () Bool)

(declare-fun lt!119779 () ListLongMap!3491)

(declare-fun isEmpty!520 (ListLongMap!3491) Bool)

(assert (=> b!236782 (= e!153760 (isEmpty!520 lt!119779))))

(declare-fun d!59525 () Bool)

(declare-fun e!153764 () Bool)

(assert (=> d!59525 e!153764))

(declare-fun res!116090 () Bool)

(assert (=> d!59525 (=> (not res!116090) (not e!153764))))

(assert (=> d!59525 (= res!116090 (not (contains!1655 lt!119779 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59525 (= lt!119779 e!153759)))

(declare-fun c!39459 () Bool)

(assert (=> d!59525 (= c!39459 (bvsge #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(assert (=> d!59525 (validMask!0 (mask!10386 thiss!1504))))

(assert (=> d!59525 (= (getCurrentListMapNoExtraKeys!530 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)) lt!119779)))

(declare-fun b!236783 () Bool)

(assert (=> b!236783 (= e!153760 (= lt!119779 (getCurrentListMapNoExtraKeys!530 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4393 thiss!1504))))))

(declare-fun b!236784 () Bool)

(declare-fun e!153763 () Bool)

(assert (=> b!236784 (= e!153763 e!153760)))

(declare-fun c!39460 () Bool)

(assert (=> b!236784 (= c!39460 (bvslt #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(declare-fun b!236785 () Bool)

(declare-fun lt!119781 () Unit!7267)

(declare-fun lt!119778 () Unit!7267)

(assert (=> b!236785 (= lt!119781 lt!119778)))

(declare-fun lt!119776 () (_ BitVec 64))

(declare-fun lt!119777 () ListLongMap!3491)

(declare-fun lt!119780 () (_ BitVec 64))

(declare-fun lt!119782 () V!7945)

(assert (=> b!236785 (not (contains!1655 (+!641 lt!119777 (tuple2!4577 lt!119780 lt!119782)) lt!119776))))

(declare-fun addStillNotContains!118 (ListLongMap!3491 (_ BitVec 64) V!7945 (_ BitVec 64)) Unit!7267)

(assert (=> b!236785 (= lt!119778 (addStillNotContains!118 lt!119777 lt!119780 lt!119782 lt!119776))))

(assert (=> b!236785 (= lt!119776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!236785 (= lt!119782 (get!2868 (select (arr!5563 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236785 (= lt!119780 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236785 (= lt!119777 call!22002)))

(assert (=> b!236785 (= e!153762 (+!641 call!22002 (tuple2!4577 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000) (get!2868 (select (arr!5563 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!236786 () Bool)

(declare-fun res!116087 () Bool)

(assert (=> b!236786 (=> (not res!116087) (not e!153764))))

(assert (=> b!236786 (= res!116087 (not (contains!1655 lt!119779 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236787 () Bool)

(declare-fun e!153765 () Bool)

(assert (=> b!236787 (= e!153763 e!153765)))

(assert (=> b!236787 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(declare-fun res!116089 () Bool)

(assert (=> b!236787 (= res!116089 (contains!1655 lt!119779 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236787 (=> (not res!116089) (not e!153765))))

(declare-fun bm!21999 () Bool)

(assert (=> bm!21999 (= call!22002 (getCurrentListMapNoExtraKeys!530 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4393 thiss!1504)))))

(declare-fun b!236788 () Bool)

(declare-fun e!153761 () Bool)

(assert (=> b!236788 (= e!153761 (validKeyInArray!0 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236788 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!236789 () Bool)

(assert (=> b!236789 (= e!153764 e!153763)))

(declare-fun c!39457 () Bool)

(assert (=> b!236789 (= c!39457 e!153761)))

(declare-fun res!116088 () Bool)

(assert (=> b!236789 (=> (not res!116088) (not e!153761))))

(assert (=> b!236789 (= res!116088 (bvslt #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(declare-fun b!236790 () Bool)

(assert (=> b!236790 (= e!153759 (ListLongMap!3492 Nil!3472))))

(declare-fun b!236791 () Bool)

(assert (=> b!236791 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(assert (=> b!236791 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5901 (_values!4376 thiss!1504))))))

(assert (=> b!236791 (= e!153765 (= (apply!214 lt!119779 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)) (get!2868 (select (arr!5563 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!59525 c!39459) b!236790))

(assert (= (and d!59525 (not c!39459)) b!236780))

(assert (= (and b!236780 c!39458) b!236785))

(assert (= (and b!236780 (not c!39458)) b!236781))

(assert (= (or b!236785 b!236781) bm!21999))

(assert (= (and d!59525 res!116090) b!236786))

(assert (= (and b!236786 res!116087) b!236789))

(assert (= (and b!236789 res!116088) b!236788))

(assert (= (and b!236789 c!39457) b!236787))

(assert (= (and b!236789 (not c!39457)) b!236784))

(assert (= (and b!236787 res!116089) b!236791))

(assert (= (and b!236784 c!39460) b!236783))

(assert (= (and b!236784 (not c!39460)) b!236782))

(declare-fun b_lambda!7953 () Bool)

(assert (=> (not b_lambda!7953) (not b!236785)))

(assert (=> b!236785 t!8451))

(declare-fun b_and!13323 () Bool)

(assert (= b_and!13321 (and (=> t!8451 result!5137) b_and!13323)))

(declare-fun b_lambda!7955 () Bool)

(assert (=> (not b_lambda!7955) (not b!236791)))

(assert (=> b!236791 t!8451))

(declare-fun b_and!13325 () Bool)

(assert (= b_and!13323 (and (=> t!8451 result!5137) b_and!13325)))

(declare-fun m!257735 () Bool)

(assert (=> b!236786 m!257735))

(assert (=> b!236791 m!257651))

(declare-fun m!257737 () Bool)

(assert (=> b!236791 m!257737))

(assert (=> b!236791 m!257669))

(assert (=> b!236791 m!257667))

(assert (=> b!236791 m!257673))

(assert (=> b!236791 m!257651))

(assert (=> b!236791 m!257667))

(assert (=> b!236791 m!257669))

(declare-fun m!257739 () Bool)

(assert (=> b!236785 m!257739))

(assert (=> b!236785 m!257669))

(assert (=> b!236785 m!257667))

(assert (=> b!236785 m!257673))

(assert (=> b!236785 m!257651))

(declare-fun m!257741 () Bool)

(assert (=> b!236785 m!257741))

(assert (=> b!236785 m!257667))

(declare-fun m!257743 () Bool)

(assert (=> b!236785 m!257743))

(assert (=> b!236785 m!257669))

(assert (=> b!236785 m!257741))

(declare-fun m!257745 () Bool)

(assert (=> b!236785 m!257745))

(assert (=> b!236780 m!257651))

(assert (=> b!236780 m!257651))

(assert (=> b!236780 m!257677))

(declare-fun m!257747 () Bool)

(assert (=> bm!21999 m!257747))

(declare-fun m!257749 () Bool)

(assert (=> b!236782 m!257749))

(assert (=> b!236787 m!257651))

(assert (=> b!236787 m!257651))

(declare-fun m!257751 () Bool)

(assert (=> b!236787 m!257751))

(assert (=> b!236788 m!257651))

(assert (=> b!236788 m!257651))

(assert (=> b!236788 m!257677))

(declare-fun m!257753 () Bool)

(assert (=> d!59525 m!257753))

(assert (=> d!59525 m!257565))

(assert (=> b!236783 m!257747))

(assert (=> bm!21985 d!59525))

(declare-fun d!59527 () Bool)

(declare-fun e!153766 () Bool)

(assert (=> d!59527 e!153766))

(declare-fun res!116091 () Bool)

(assert (=> d!59527 (=> res!116091 e!153766)))

(declare-fun lt!119786 () Bool)

(assert (=> d!59527 (= res!116091 (not lt!119786))))

(declare-fun lt!119785 () Bool)

(assert (=> d!59527 (= lt!119786 lt!119785)))

(declare-fun lt!119784 () Unit!7267)

(declare-fun e!153767 () Unit!7267)

(assert (=> d!59527 (= lt!119784 e!153767)))

(declare-fun c!39461 () Bool)

(assert (=> d!59527 (= c!39461 lt!119785)))

(assert (=> d!59527 (= lt!119785 (containsKey!264 (toList!1761 lt!119714) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59527 (= (contains!1655 lt!119714 #b1000000000000000000000000000000000000000000000000000000000000000) lt!119786)))

(declare-fun b!236792 () Bool)

(declare-fun lt!119783 () Unit!7267)

(assert (=> b!236792 (= e!153767 lt!119783)))

(assert (=> b!236792 (= lt!119783 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1761 lt!119714) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236792 (isDefined!213 (getValueByKey!273 (toList!1761 lt!119714) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236793 () Bool)

(declare-fun Unit!7272 () Unit!7267)

(assert (=> b!236793 (= e!153767 Unit!7272)))

(declare-fun b!236794 () Bool)

(assert (=> b!236794 (= e!153766 (isDefined!213 (getValueByKey!273 (toList!1761 lt!119714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59527 c!39461) b!236792))

(assert (= (and d!59527 (not c!39461)) b!236793))

(assert (= (and d!59527 (not res!116091)) b!236794))

(declare-fun m!257755 () Bool)

(assert (=> d!59527 m!257755))

(declare-fun m!257757 () Bool)

(assert (=> b!236792 m!257757))

(declare-fun m!257759 () Bool)

(assert (=> b!236792 m!257759))

(assert (=> b!236792 m!257759))

(declare-fun m!257761 () Bool)

(assert (=> b!236792 m!257761))

(assert (=> b!236794 m!257759))

(assert (=> b!236794 m!257759))

(assert (=> b!236794 m!257761))

(assert (=> bm!21984 d!59527))

(declare-fun d!59529 () Bool)

(declare-fun get!2869 (Option!279) V!7945)

(assert (=> d!59529 (= (apply!214 (+!641 lt!119725 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504))) lt!119727) (get!2869 (getValueByKey!273 (toList!1761 (+!641 lt!119725 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504)))) lt!119727)))))

(declare-fun bs!8760 () Bool)

(assert (= bs!8760 d!59529))

(declare-fun m!257763 () Bool)

(assert (=> bs!8760 m!257763))

(assert (=> bs!8760 m!257763))

(declare-fun m!257765 () Bool)

(assert (=> bs!8760 m!257765))

(assert (=> b!236685 d!59529))

(declare-fun d!59531 () Bool)

(assert (=> d!59531 (= (apply!214 lt!119708 lt!119723) (get!2869 (getValueByKey!273 (toList!1761 lt!119708) lt!119723)))))

(declare-fun bs!8761 () Bool)

(assert (= bs!8761 d!59531))

(declare-fun m!257767 () Bool)

(assert (=> bs!8761 m!257767))

(assert (=> bs!8761 m!257767))

(declare-fun m!257769 () Bool)

(assert (=> bs!8761 m!257769))

(assert (=> b!236685 d!59531))

(declare-fun d!59533 () Bool)

(declare-fun e!153768 () Bool)

(assert (=> d!59533 e!153768))

(declare-fun res!116093 () Bool)

(assert (=> d!59533 (=> (not res!116093) (not e!153768))))

(declare-fun lt!119787 () ListLongMap!3491)

(assert (=> d!59533 (= res!116093 (contains!1655 lt!119787 (_1!2299 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504)))))))

(declare-fun lt!119789 () List!3475)

(assert (=> d!59533 (= lt!119787 (ListLongMap!3492 lt!119789))))

(declare-fun lt!119788 () Unit!7267)

(declare-fun lt!119790 () Unit!7267)

(assert (=> d!59533 (= lt!119788 lt!119790)))

(assert (=> d!59533 (= (getValueByKey!273 lt!119789 (_1!2299 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504)))) (Some!278 (_2!2299 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59533 (= lt!119790 (lemmaContainsTupThenGetReturnValue!153 lt!119789 (_1!2299 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504))) (_2!2299 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59533 (= lt!119789 (insertStrictlySorted!156 (toList!1761 lt!119711) (_1!2299 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504))) (_2!2299 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59533 (= (+!641 lt!119711 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504))) lt!119787)))

(declare-fun b!236795 () Bool)

(declare-fun res!116092 () Bool)

(assert (=> b!236795 (=> (not res!116092) (not e!153768))))

(assert (=> b!236795 (= res!116092 (= (getValueByKey!273 (toList!1761 lt!119787) (_1!2299 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504)))) (Some!278 (_2!2299 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504))))))))

(declare-fun b!236796 () Bool)

(assert (=> b!236796 (= e!153768 (contains!1657 (toList!1761 lt!119787) (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504))))))

(assert (= (and d!59533 res!116093) b!236795))

(assert (= (and b!236795 res!116092) b!236796))

(declare-fun m!257771 () Bool)

(assert (=> d!59533 m!257771))

(declare-fun m!257773 () Bool)

(assert (=> d!59533 m!257773))

(declare-fun m!257775 () Bool)

(assert (=> d!59533 m!257775))

(declare-fun m!257777 () Bool)

(assert (=> d!59533 m!257777))

(declare-fun m!257779 () Bool)

(assert (=> b!236795 m!257779))

(declare-fun m!257781 () Bool)

(assert (=> b!236796 m!257781))

(assert (=> b!236685 d!59533))

(declare-fun d!59535 () Bool)

(declare-fun e!153769 () Bool)

(assert (=> d!59535 e!153769))

(declare-fun res!116094 () Bool)

(assert (=> d!59535 (=> res!116094 e!153769)))

(declare-fun lt!119794 () Bool)

(assert (=> d!59535 (= res!116094 (not lt!119794))))

(declare-fun lt!119793 () Bool)

(assert (=> d!59535 (= lt!119794 lt!119793)))

(declare-fun lt!119792 () Unit!7267)

(declare-fun e!153770 () Unit!7267)

(assert (=> d!59535 (= lt!119792 e!153770)))

(declare-fun c!39462 () Bool)

(assert (=> d!59535 (= c!39462 lt!119793)))

(assert (=> d!59535 (= lt!119793 (containsKey!264 (toList!1761 (+!641 lt!119711 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504)))) lt!119726))))

(assert (=> d!59535 (= (contains!1655 (+!641 lt!119711 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504))) lt!119726) lt!119794)))

(declare-fun b!236797 () Bool)

(declare-fun lt!119791 () Unit!7267)

(assert (=> b!236797 (= e!153770 lt!119791)))

(assert (=> b!236797 (= lt!119791 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1761 (+!641 lt!119711 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504)))) lt!119726))))

(assert (=> b!236797 (isDefined!213 (getValueByKey!273 (toList!1761 (+!641 lt!119711 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504)))) lt!119726))))

(declare-fun b!236798 () Bool)

(declare-fun Unit!7273 () Unit!7267)

(assert (=> b!236798 (= e!153770 Unit!7273)))

(declare-fun b!236799 () Bool)

(assert (=> b!236799 (= e!153769 (isDefined!213 (getValueByKey!273 (toList!1761 (+!641 lt!119711 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504)))) lt!119726)))))

(assert (= (and d!59535 c!39462) b!236797))

(assert (= (and d!59535 (not c!39462)) b!236798))

(assert (= (and d!59535 (not res!116094)) b!236799))

(declare-fun m!257783 () Bool)

(assert (=> d!59535 m!257783))

(declare-fun m!257785 () Bool)

(assert (=> b!236797 m!257785))

(declare-fun m!257787 () Bool)

(assert (=> b!236797 m!257787))

(assert (=> b!236797 m!257787))

(declare-fun m!257789 () Bool)

(assert (=> b!236797 m!257789))

(assert (=> b!236799 m!257787))

(assert (=> b!236799 m!257787))

(assert (=> b!236799 m!257789))

(assert (=> b!236685 d!59535))

(declare-fun d!59537 () Bool)

(assert (=> d!59537 (= (apply!214 (+!641 lt!119708 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504))) lt!119723) (get!2869 (getValueByKey!273 (toList!1761 (+!641 lt!119708 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504)))) lt!119723)))))

(declare-fun bs!8762 () Bool)

(assert (= bs!8762 d!59537))

(declare-fun m!257791 () Bool)

(assert (=> bs!8762 m!257791))

(assert (=> bs!8762 m!257791))

(declare-fun m!257793 () Bool)

(assert (=> bs!8762 m!257793))

(assert (=> b!236685 d!59537))

(declare-fun d!59539 () Bool)

(assert (=> d!59539 (contains!1655 (+!641 lt!119711 (tuple2!4577 lt!119729 (zeroValue!4234 thiss!1504))) lt!119726)))

(declare-fun lt!119797 () Unit!7267)

(declare-fun choose!1114 (ListLongMap!3491 (_ BitVec 64) V!7945 (_ BitVec 64)) Unit!7267)

(assert (=> d!59539 (= lt!119797 (choose!1114 lt!119711 lt!119729 (zeroValue!4234 thiss!1504) lt!119726))))

(assert (=> d!59539 (contains!1655 lt!119711 lt!119726)))

(assert (=> d!59539 (= (addStillContains!190 lt!119711 lt!119729 (zeroValue!4234 thiss!1504) lt!119726) lt!119797)))

(declare-fun bs!8763 () Bool)

(assert (= bs!8763 d!59539))

(assert (=> bs!8763 m!257631))

(assert (=> bs!8763 m!257631))

(assert (=> bs!8763 m!257657))

(declare-fun m!257795 () Bool)

(assert (=> bs!8763 m!257795))

(declare-fun m!257797 () Bool)

(assert (=> bs!8763 m!257797))

(assert (=> b!236685 d!59539))

(declare-fun d!59541 () Bool)

(declare-fun e!153771 () Bool)

(assert (=> d!59541 e!153771))

(declare-fun res!116096 () Bool)

(assert (=> d!59541 (=> (not res!116096) (not e!153771))))

(declare-fun lt!119798 () ListLongMap!3491)

(assert (=> d!59541 (= res!116096 (contains!1655 lt!119798 (_1!2299 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504)))))))

(declare-fun lt!119800 () List!3475)

(assert (=> d!59541 (= lt!119798 (ListLongMap!3492 lt!119800))))

(declare-fun lt!119799 () Unit!7267)

(declare-fun lt!119801 () Unit!7267)

(assert (=> d!59541 (= lt!119799 lt!119801)))

(assert (=> d!59541 (= (getValueByKey!273 lt!119800 (_1!2299 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504)))) (Some!278 (_2!2299 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59541 (= lt!119801 (lemmaContainsTupThenGetReturnValue!153 lt!119800 (_1!2299 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504))) (_2!2299 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59541 (= lt!119800 (insertStrictlySorted!156 (toList!1761 lt!119720) (_1!2299 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504))) (_2!2299 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504)))))))

(assert (=> d!59541 (= (+!641 lt!119720 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504))) lt!119798)))

(declare-fun b!236801 () Bool)

(declare-fun res!116095 () Bool)

(assert (=> b!236801 (=> (not res!116095) (not e!153771))))

(assert (=> b!236801 (= res!116095 (= (getValueByKey!273 (toList!1761 lt!119798) (_1!2299 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504)))) (Some!278 (_2!2299 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504))))))))

(declare-fun b!236802 () Bool)

(assert (=> b!236802 (= e!153771 (contains!1657 (toList!1761 lt!119798) (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504))))))

(assert (= (and d!59541 res!116096) b!236801))

(assert (= (and b!236801 res!116095) b!236802))

(declare-fun m!257799 () Bool)

(assert (=> d!59541 m!257799))

(declare-fun m!257801 () Bool)

(assert (=> d!59541 m!257801))

(declare-fun m!257803 () Bool)

(assert (=> d!59541 m!257803))

(declare-fun m!257805 () Bool)

(assert (=> d!59541 m!257805))

(declare-fun m!257807 () Bool)

(assert (=> b!236801 m!257807))

(declare-fun m!257809 () Bool)

(assert (=> b!236802 m!257809))

(assert (=> b!236685 d!59541))

(assert (=> b!236685 d!59525))

(declare-fun d!59543 () Bool)

(assert (=> d!59543 (= (apply!214 (+!641 lt!119720 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504))) lt!119718) (get!2869 (getValueByKey!273 (toList!1761 (+!641 lt!119720 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504)))) lt!119718)))))

(declare-fun bs!8764 () Bool)

(assert (= bs!8764 d!59543))

(declare-fun m!257811 () Bool)

(assert (=> bs!8764 m!257811))

(assert (=> bs!8764 m!257811))

(declare-fun m!257813 () Bool)

(assert (=> bs!8764 m!257813))

(assert (=> b!236685 d!59543))

(declare-fun d!59545 () Bool)

(assert (=> d!59545 (= (apply!214 (+!641 lt!119708 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504))) lt!119723) (apply!214 lt!119708 lt!119723))))

(declare-fun lt!119804 () Unit!7267)

(declare-fun choose!1115 (ListLongMap!3491 (_ BitVec 64) V!7945 (_ BitVec 64)) Unit!7267)

(assert (=> d!59545 (= lt!119804 (choose!1115 lt!119708 lt!119719 (minValue!4234 thiss!1504) lt!119723))))

(declare-fun e!153774 () Bool)

(assert (=> d!59545 e!153774))

(declare-fun res!116099 () Bool)

(assert (=> d!59545 (=> (not res!116099) (not e!153774))))

(assert (=> d!59545 (= res!116099 (contains!1655 lt!119708 lt!119723))))

(assert (=> d!59545 (= (addApplyDifferent!190 lt!119708 lt!119719 (minValue!4234 thiss!1504) lt!119723) lt!119804)))

(declare-fun b!236806 () Bool)

(assert (=> b!236806 (= e!153774 (not (= lt!119723 lt!119719)))))

(assert (= (and d!59545 res!116099) b!236806))

(assert (=> d!59545 m!257645))

(assert (=> d!59545 m!257637))

(declare-fun m!257815 () Bool)

(assert (=> d!59545 m!257815))

(declare-fun m!257817 () Bool)

(assert (=> d!59545 m!257817))

(assert (=> d!59545 m!257637))

(assert (=> d!59545 m!257639))

(assert (=> b!236685 d!59545))

(declare-fun d!59547 () Bool)

(assert (=> d!59547 (= (apply!214 (+!641 lt!119720 (tuple2!4577 lt!119716 (zeroValue!4234 thiss!1504))) lt!119718) (apply!214 lt!119720 lt!119718))))

(declare-fun lt!119805 () Unit!7267)

(assert (=> d!59547 (= lt!119805 (choose!1115 lt!119720 lt!119716 (zeroValue!4234 thiss!1504) lt!119718))))

(declare-fun e!153775 () Bool)

(assert (=> d!59547 e!153775))

(declare-fun res!116100 () Bool)

(assert (=> d!59547 (=> (not res!116100) (not e!153775))))

(assert (=> d!59547 (= res!116100 (contains!1655 lt!119720 lt!119718))))

(assert (=> d!59547 (= (addApplyDifferent!190 lt!119720 lt!119716 (zeroValue!4234 thiss!1504) lt!119718) lt!119805)))

(declare-fun b!236807 () Bool)

(assert (=> b!236807 (= e!153775 (not (= lt!119718 lt!119716)))))

(assert (= (and d!59547 res!116100) b!236807))

(assert (=> d!59547 m!257635))

(assert (=> d!59547 m!257629))

(declare-fun m!257819 () Bool)

(assert (=> d!59547 m!257819))

(declare-fun m!257821 () Bool)

(assert (=> d!59547 m!257821))

(assert (=> d!59547 m!257629))

(assert (=> d!59547 m!257633))

(assert (=> b!236685 d!59547))

(declare-fun d!59549 () Bool)

(assert (=> d!59549 (= (apply!214 (+!641 lt!119725 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504))) lt!119727) (apply!214 lt!119725 lt!119727))))

(declare-fun lt!119806 () Unit!7267)

(assert (=> d!59549 (= lt!119806 (choose!1115 lt!119725 lt!119721 (minValue!4234 thiss!1504) lt!119727))))

(declare-fun e!153776 () Bool)

(assert (=> d!59549 e!153776))

(declare-fun res!116101 () Bool)

(assert (=> d!59549 (=> (not res!116101) (not e!153776))))

(assert (=> d!59549 (= res!116101 (contains!1655 lt!119725 lt!119727))))

(assert (=> d!59549 (= (addApplyDifferent!190 lt!119725 lt!119721 (minValue!4234 thiss!1504) lt!119727) lt!119806)))

(declare-fun b!236808 () Bool)

(assert (=> b!236808 (= e!153776 (not (= lt!119727 lt!119721)))))

(assert (= (and d!59549 res!116101) b!236808))

(assert (=> d!59549 m!257643))

(assert (=> d!59549 m!257649))

(declare-fun m!257823 () Bool)

(assert (=> d!59549 m!257823))

(declare-fun m!257825 () Bool)

(assert (=> d!59549 m!257825))

(assert (=> d!59549 m!257649))

(assert (=> d!59549 m!257655))

(assert (=> b!236685 d!59549))

(declare-fun d!59551 () Bool)

(declare-fun e!153777 () Bool)

(assert (=> d!59551 e!153777))

(declare-fun res!116103 () Bool)

(assert (=> d!59551 (=> (not res!116103) (not e!153777))))

(declare-fun lt!119807 () ListLongMap!3491)

(assert (=> d!59551 (= res!116103 (contains!1655 lt!119807 (_1!2299 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504)))))))

(declare-fun lt!119809 () List!3475)

(assert (=> d!59551 (= lt!119807 (ListLongMap!3492 lt!119809))))

(declare-fun lt!119808 () Unit!7267)

(declare-fun lt!119810 () Unit!7267)

(assert (=> d!59551 (= lt!119808 lt!119810)))

(assert (=> d!59551 (= (getValueByKey!273 lt!119809 (_1!2299 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504)))) (Some!278 (_2!2299 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504)))))))

(assert (=> d!59551 (= lt!119810 (lemmaContainsTupThenGetReturnValue!153 lt!119809 (_1!2299 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504))) (_2!2299 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504)))))))

(assert (=> d!59551 (= lt!119809 (insertStrictlySorted!156 (toList!1761 lt!119708) (_1!2299 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504))) (_2!2299 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504)))))))

(assert (=> d!59551 (= (+!641 lt!119708 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504))) lt!119807)))

(declare-fun b!236809 () Bool)

(declare-fun res!116102 () Bool)

(assert (=> b!236809 (=> (not res!116102) (not e!153777))))

(assert (=> b!236809 (= res!116102 (= (getValueByKey!273 (toList!1761 lt!119807) (_1!2299 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504)))) (Some!278 (_2!2299 (tuple2!4577 lt!119719 (minValue!4234 thiss!1504))))))))

(declare-fun b!236810 () Bool)

(assert (=> b!236810 (= e!153777 (contains!1657 (toList!1761 lt!119807) (tuple2!4577 lt!119719 (minValue!4234 thiss!1504))))))

(assert (= (and d!59551 res!116103) b!236809))

(assert (= (and b!236809 res!116102) b!236810))

(declare-fun m!257827 () Bool)

(assert (=> d!59551 m!257827))

(declare-fun m!257829 () Bool)

(assert (=> d!59551 m!257829))

(declare-fun m!257831 () Bool)

(assert (=> d!59551 m!257831))

(declare-fun m!257833 () Bool)

(assert (=> d!59551 m!257833))

(declare-fun m!257835 () Bool)

(assert (=> b!236809 m!257835))

(declare-fun m!257837 () Bool)

(assert (=> b!236810 m!257837))

(assert (=> b!236685 d!59551))

(declare-fun d!59553 () Bool)

(declare-fun e!153778 () Bool)

(assert (=> d!59553 e!153778))

(declare-fun res!116105 () Bool)

(assert (=> d!59553 (=> (not res!116105) (not e!153778))))

(declare-fun lt!119811 () ListLongMap!3491)

(assert (=> d!59553 (= res!116105 (contains!1655 lt!119811 (_1!2299 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504)))))))

(declare-fun lt!119813 () List!3475)

(assert (=> d!59553 (= lt!119811 (ListLongMap!3492 lt!119813))))

(declare-fun lt!119812 () Unit!7267)

(declare-fun lt!119814 () Unit!7267)

(assert (=> d!59553 (= lt!119812 lt!119814)))

(assert (=> d!59553 (= (getValueByKey!273 lt!119813 (_1!2299 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504)))) (Some!278 (_2!2299 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504)))))))

(assert (=> d!59553 (= lt!119814 (lemmaContainsTupThenGetReturnValue!153 lt!119813 (_1!2299 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504))) (_2!2299 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504)))))))

(assert (=> d!59553 (= lt!119813 (insertStrictlySorted!156 (toList!1761 lt!119725) (_1!2299 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504))) (_2!2299 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504)))))))

(assert (=> d!59553 (= (+!641 lt!119725 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504))) lt!119811)))

(declare-fun b!236811 () Bool)

(declare-fun res!116104 () Bool)

(assert (=> b!236811 (=> (not res!116104) (not e!153778))))

(assert (=> b!236811 (= res!116104 (= (getValueByKey!273 (toList!1761 lt!119811) (_1!2299 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504)))) (Some!278 (_2!2299 (tuple2!4577 lt!119721 (minValue!4234 thiss!1504))))))))

(declare-fun b!236812 () Bool)

(assert (=> b!236812 (= e!153778 (contains!1657 (toList!1761 lt!119811) (tuple2!4577 lt!119721 (minValue!4234 thiss!1504))))))

(assert (= (and d!59553 res!116105) b!236811))

(assert (= (and b!236811 res!116104) b!236812))

(declare-fun m!257839 () Bool)

(assert (=> d!59553 m!257839))

(declare-fun m!257841 () Bool)

(assert (=> d!59553 m!257841))

(declare-fun m!257843 () Bool)

(assert (=> d!59553 m!257843))

(declare-fun m!257845 () Bool)

(assert (=> d!59553 m!257845))

(declare-fun m!257847 () Bool)

(assert (=> b!236811 m!257847))

(declare-fun m!257849 () Bool)

(assert (=> b!236812 m!257849))

(assert (=> b!236685 d!59553))

(declare-fun d!59555 () Bool)

(assert (=> d!59555 (= (apply!214 lt!119725 lt!119727) (get!2869 (getValueByKey!273 (toList!1761 lt!119725) lt!119727)))))

(declare-fun bs!8765 () Bool)

(assert (= bs!8765 d!59555))

(declare-fun m!257851 () Bool)

(assert (=> bs!8765 m!257851))

(assert (=> bs!8765 m!257851))

(declare-fun m!257853 () Bool)

(assert (=> bs!8765 m!257853))

(assert (=> b!236685 d!59555))

(declare-fun d!59557 () Bool)

(assert (=> d!59557 (= (apply!214 lt!119720 lt!119718) (get!2869 (getValueByKey!273 (toList!1761 lt!119720) lt!119718)))))

(declare-fun bs!8766 () Bool)

(assert (= bs!8766 d!59557))

(declare-fun m!257855 () Bool)

(assert (=> bs!8766 m!257855))

(assert (=> bs!8766 m!257855))

(declare-fun m!257857 () Bool)

(assert (=> bs!8766 m!257857))

(assert (=> b!236685 d!59557))

(declare-fun d!59559 () Bool)

(declare-fun e!153789 () Bool)

(assert (=> d!59559 e!153789))

(declare-fun c!39470 () Bool)

(declare-fun lt!119819 () SeekEntryResult!973)

(assert (=> d!59559 (= c!39470 (and ((_ is Intermediate!973) lt!119819) (undefined!1785 lt!119819)))))

(declare-fun e!153790 () SeekEntryResult!973)

(assert (=> d!59559 (= lt!119819 e!153790)))

(declare-fun c!39471 () Bool)

(assert (=> d!59559 (= c!39471 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!119820 () (_ BitVec 64))

(assert (=> d!59559 (= lt!119820 (select (arr!5564 (_keys!6476 thiss!1504)) (toIndex!0 key!932 (mask!10386 thiss!1504))))))

(assert (=> d!59559 (validMask!0 (mask!10386 thiss!1504))))

(assert (=> d!59559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10386 thiss!1504)) key!932 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)) lt!119819)))

(declare-fun b!236831 () Bool)

(assert (=> b!236831 (and (bvsge (index!6064 lt!119819) #b00000000000000000000000000000000) (bvslt (index!6064 lt!119819) (size!5902 (_keys!6476 thiss!1504))))))

(declare-fun res!116112 () Bool)

(assert (=> b!236831 (= res!116112 (= (select (arr!5564 (_keys!6476 thiss!1504)) (index!6064 lt!119819)) key!932))))

(declare-fun e!153791 () Bool)

(assert (=> b!236831 (=> res!116112 e!153791)))

(declare-fun e!153793 () Bool)

(assert (=> b!236831 (= e!153793 e!153791)))

(declare-fun b!236832 () Bool)

(declare-fun e!153792 () SeekEntryResult!973)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236832 (= e!153792 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10386 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10386 thiss!1504)) key!932 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)))))

(declare-fun b!236833 () Bool)

(assert (=> b!236833 (= e!153789 e!153793)))

(declare-fun res!116114 () Bool)

(assert (=> b!236833 (= res!116114 (and ((_ is Intermediate!973) lt!119819) (not (undefined!1785 lt!119819)) (bvslt (x!23855 lt!119819) #b01111111111111111111111111111110) (bvsge (x!23855 lt!119819) #b00000000000000000000000000000000) (bvsge (x!23855 lt!119819) #b00000000000000000000000000000000)))))

(assert (=> b!236833 (=> (not res!116114) (not e!153793))))

(declare-fun b!236834 () Bool)

(assert (=> b!236834 (= e!153792 (Intermediate!973 false (toIndex!0 key!932 (mask!10386 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236835 () Bool)

(assert (=> b!236835 (= e!153789 (bvsge (x!23855 lt!119819) #b01111111111111111111111111111110))))

(declare-fun b!236836 () Bool)

(assert (=> b!236836 (and (bvsge (index!6064 lt!119819) #b00000000000000000000000000000000) (bvslt (index!6064 lt!119819) (size!5902 (_keys!6476 thiss!1504))))))

(assert (=> b!236836 (= e!153791 (= (select (arr!5564 (_keys!6476 thiss!1504)) (index!6064 lt!119819)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236837 () Bool)

(assert (=> b!236837 (= e!153790 e!153792)))

(declare-fun c!39469 () Bool)

(assert (=> b!236837 (= c!39469 (or (= lt!119820 key!932) (= (bvadd lt!119820 lt!119820) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236838 () Bool)

(assert (=> b!236838 (= e!153790 (Intermediate!973 true (toIndex!0 key!932 (mask!10386 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236839 () Bool)

(assert (=> b!236839 (and (bvsge (index!6064 lt!119819) #b00000000000000000000000000000000) (bvslt (index!6064 lt!119819) (size!5902 (_keys!6476 thiss!1504))))))

(declare-fun res!116113 () Bool)

(assert (=> b!236839 (= res!116113 (= (select (arr!5564 (_keys!6476 thiss!1504)) (index!6064 lt!119819)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236839 (=> res!116113 e!153791)))

(assert (= (and d!59559 c!39471) b!236838))

(assert (= (and d!59559 (not c!39471)) b!236837))

(assert (= (and b!236837 c!39469) b!236834))

(assert (= (and b!236837 (not c!39469)) b!236832))

(assert (= (and d!59559 c!39470) b!236835))

(assert (= (and d!59559 (not c!39470)) b!236833))

(assert (= (and b!236833 res!116114) b!236831))

(assert (= (and b!236831 (not res!116112)) b!236839))

(assert (= (and b!236839 (not res!116113)) b!236836))

(declare-fun m!257859 () Bool)

(assert (=> b!236839 m!257859))

(assert (=> b!236836 m!257859))

(assert (=> b!236832 m!257603))

(declare-fun m!257861 () Bool)

(assert (=> b!236832 m!257861))

(assert (=> b!236832 m!257861))

(declare-fun m!257863 () Bool)

(assert (=> b!236832 m!257863))

(assert (=> d!59559 m!257603))

(declare-fun m!257865 () Bool)

(assert (=> d!59559 m!257865))

(assert (=> d!59559 m!257565))

(assert (=> b!236831 m!257859))

(assert (=> d!59499 d!59559))

(declare-fun d!59561 () Bool)

(declare-fun lt!119826 () (_ BitVec 32))

(declare-fun lt!119825 () (_ BitVec 32))

(assert (=> d!59561 (= lt!119826 (bvmul (bvxor lt!119825 (bvlshr lt!119825 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59561 (= lt!119825 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59561 (and (bvsge (mask!10386 thiss!1504) #b00000000000000000000000000000000) (let ((res!116115 (let ((h!4127 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23874 (bvmul (bvxor h!4127 (bvlshr h!4127 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23874 (bvlshr x!23874 #b00000000000000000000000000001101)) (mask!10386 thiss!1504)))))) (and (bvslt res!116115 (bvadd (mask!10386 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!116115 #b00000000000000000000000000000000))))))

(assert (=> d!59561 (= (toIndex!0 key!932 (mask!10386 thiss!1504)) (bvand (bvxor lt!119826 (bvlshr lt!119826 #b00000000000000000000000000001101)) (mask!10386 thiss!1504)))))

(assert (=> d!59499 d!59561))

(assert (=> d!59499 d!59509))

(declare-fun d!59563 () Bool)

(assert (=> d!59563 (= (apply!214 lt!119714 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)) (get!2869 (getValueByKey!273 (toList!1761 lt!119714) (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8767 () Bool)

(assert (= bs!8767 d!59563))

(assert (=> bs!8767 m!257651))

(declare-fun m!257867 () Bool)

(assert (=> bs!8767 m!257867))

(assert (=> bs!8767 m!257867))

(declare-fun m!257869 () Bool)

(assert (=> bs!8767 m!257869))

(assert (=> b!236683 d!59563))

(declare-fun d!59565 () Bool)

(declare-fun c!39474 () Bool)

(assert (=> d!59565 (= c!39474 ((_ is ValueCellFull!2768) (select (arr!5563 (_values!4376 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!153796 () V!7945)

(assert (=> d!59565 (= (get!2868 (select (arr!5563 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!153796)))

(declare-fun b!236844 () Bool)

(declare-fun get!2870 (ValueCell!2768 V!7945) V!7945)

(assert (=> b!236844 (= e!153796 (get!2870 (select (arr!5563 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236845 () Bool)

(declare-fun get!2871 (ValueCell!2768 V!7945) V!7945)

(assert (=> b!236845 (= e!153796 (get!2871 (select (arr!5563 (_values!4376 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4393 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59565 c!39474) b!236844))

(assert (= (and d!59565 (not c!39474)) b!236845))

(assert (=> b!236844 m!257669))

(assert (=> b!236844 m!257667))

(declare-fun m!257871 () Bool)

(assert (=> b!236844 m!257871))

(assert (=> b!236845 m!257669))

(assert (=> b!236845 m!257667))

(declare-fun m!257873 () Bool)

(assert (=> b!236845 m!257873))

(assert (=> b!236683 d!59565))

(declare-fun b!236858 () Bool)

(declare-fun c!39483 () Bool)

(declare-fun lt!119831 () (_ BitVec 64))

(assert (=> b!236858 (= c!39483 (= lt!119831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153803 () SeekEntryResult!973)

(declare-fun e!153804 () SeekEntryResult!973)

(assert (=> b!236858 (= e!153803 e!153804)))

(declare-fun b!236859 () Bool)

(assert (=> b!236859 (= e!153804 (MissingVacant!973 (index!6064 lt!119650)))))

(declare-fun b!236860 () Bool)

(assert (=> b!236860 (= e!153803 (Found!973 (index!6064 lt!119650)))))

(declare-fun lt!119832 () SeekEntryResult!973)

(declare-fun d!59567 () Bool)

(assert (=> d!59567 (and (or ((_ is Undefined!973) lt!119832) (not ((_ is Found!973) lt!119832)) (and (bvsge (index!6063 lt!119832) #b00000000000000000000000000000000) (bvslt (index!6063 lt!119832) (size!5902 (_keys!6476 thiss!1504))))) (or ((_ is Undefined!973) lt!119832) ((_ is Found!973) lt!119832) (not ((_ is MissingVacant!973) lt!119832)) (not (= (index!6065 lt!119832) (index!6064 lt!119650))) (and (bvsge (index!6065 lt!119832) #b00000000000000000000000000000000) (bvslt (index!6065 lt!119832) (size!5902 (_keys!6476 thiss!1504))))) (or ((_ is Undefined!973) lt!119832) (ite ((_ is Found!973) lt!119832) (= (select (arr!5564 (_keys!6476 thiss!1504)) (index!6063 lt!119832)) key!932) (and ((_ is MissingVacant!973) lt!119832) (= (index!6065 lt!119832) (index!6064 lt!119650)) (= (select (arr!5564 (_keys!6476 thiss!1504)) (index!6065 lt!119832)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!153805 () SeekEntryResult!973)

(assert (=> d!59567 (= lt!119832 e!153805)))

(declare-fun c!39481 () Bool)

(assert (=> d!59567 (= c!39481 (bvsge (x!23855 lt!119650) #b01111111111111111111111111111110))))

(assert (=> d!59567 (= lt!119831 (select (arr!5564 (_keys!6476 thiss!1504)) (index!6064 lt!119650)))))

(assert (=> d!59567 (validMask!0 (mask!10386 thiss!1504))))

(assert (=> d!59567 (= (seekKeyOrZeroReturnVacant!0 (x!23855 lt!119650) (index!6064 lt!119650) (index!6064 lt!119650) key!932 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)) lt!119832)))

(declare-fun b!236861 () Bool)

(assert (=> b!236861 (= e!153805 Undefined!973)))

(declare-fun b!236862 () Bool)

(assert (=> b!236862 (= e!153804 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23855 lt!119650) #b00000000000000000000000000000001) (nextIndex!0 (index!6064 lt!119650) (bvadd (x!23855 lt!119650) #b00000000000000000000000000000001) (mask!10386 thiss!1504)) (index!6064 lt!119650) key!932 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)))))

(declare-fun b!236863 () Bool)

(assert (=> b!236863 (= e!153805 e!153803)))

(declare-fun c!39482 () Bool)

(assert (=> b!236863 (= c!39482 (= lt!119831 key!932))))

(assert (= (and d!59567 c!39481) b!236861))

(assert (= (and d!59567 (not c!39481)) b!236863))

(assert (= (and b!236863 c!39482) b!236860))

(assert (= (and b!236863 (not c!39482)) b!236858))

(assert (= (and b!236858 c!39483) b!236859))

(assert (= (and b!236858 (not c!39483)) b!236862))

(declare-fun m!257875 () Bool)

(assert (=> d!59567 m!257875))

(declare-fun m!257877 () Bool)

(assert (=> d!59567 m!257877))

(assert (=> d!59567 m!257611))

(assert (=> d!59567 m!257565))

(declare-fun m!257879 () Bool)

(assert (=> b!236862 m!257879))

(assert (=> b!236862 m!257879))

(declare-fun m!257881 () Bool)

(assert (=> b!236862 m!257881))

(assert (=> b!236617 d!59567))

(declare-fun d!59569 () Bool)

(assert (=> d!59569 (= (apply!214 lt!119714 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2869 (getValueByKey!273 (toList!1761 lt!119714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8768 () Bool)

(assert (= bs!8768 d!59569))

(assert (=> bs!8768 m!257759))

(assert (=> bs!8768 m!257759))

(declare-fun m!257883 () Bool)

(assert (=> bs!8768 m!257883))

(assert (=> b!236675 d!59569))

(assert (=> d!59503 d!59509))

(declare-fun d!59571 () Bool)

(assert (=> d!59571 (= (validKeyInArray!0 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236674 d!59571))

(declare-fun d!59573 () Bool)

(declare-fun isEmpty!521 (Option!279) Bool)

(assert (=> d!59573 (= (isDefined!213 (getValueByKey!273 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932)) (not (isEmpty!521 (getValueByKey!273 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))))

(declare-fun bs!8769 () Bool)

(assert (= bs!8769 d!59573))

(assert (=> bs!8769 m!257619))

(declare-fun m!257885 () Bool)

(assert (=> bs!8769 m!257885))

(assert (=> b!236626 d!59573))

(declare-fun b!236873 () Bool)

(declare-fun e!153810 () Option!279)

(declare-fun e!153811 () Option!279)

(assert (=> b!236873 (= e!153810 e!153811)))

(declare-fun c!39489 () Bool)

(assert (=> b!236873 (= c!39489 (and ((_ is Cons!3471) (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) (not (= (_1!2299 (h!4124 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) key!932))))))

(declare-fun b!236875 () Bool)

(assert (=> b!236875 (= e!153811 None!277)))

(declare-fun b!236874 () Bool)

(assert (=> b!236874 (= e!153811 (getValueByKey!273 (t!8448 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) key!932))))

(declare-fun b!236872 () Bool)

(assert (=> b!236872 (= e!153810 (Some!278 (_2!2299 (h!4124 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))))))

(declare-fun d!59575 () Bool)

(declare-fun c!39488 () Bool)

(assert (=> d!59575 (= c!39488 (and ((_ is Cons!3471) (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) (= (_1!2299 (h!4124 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) key!932)))))

(assert (=> d!59575 (= (getValueByKey!273 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932) e!153810)))

(assert (= (and d!59575 c!39488) b!236872))

(assert (= (and d!59575 (not c!39488)) b!236873))

(assert (= (and b!236873 c!39489) b!236874))

(assert (= (and b!236873 (not c!39489)) b!236875))

(declare-fun m!257887 () Bool)

(assert (=> b!236874 m!257887))

(assert (=> b!236626 d!59575))

(declare-fun d!59577 () Bool)

(assert (=> d!59577 (isDefined!213 (getValueByKey!273 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(declare-fun lt!119835 () Unit!7267)

(declare-fun choose!1116 (List!3475 (_ BitVec 64)) Unit!7267)

(assert (=> d!59577 (= lt!119835 (choose!1116 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(declare-fun e!153814 () Bool)

(assert (=> d!59577 e!153814))

(declare-fun res!116118 () Bool)

(assert (=> d!59577 (=> (not res!116118) (not e!153814))))

(declare-fun isStrictlySorted!351 (List!3475) Bool)

(assert (=> d!59577 (= res!116118 (isStrictlySorted!351 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))))))

(assert (=> d!59577 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932) lt!119835)))

(declare-fun b!236878 () Bool)

(assert (=> b!236878 (= e!153814 (containsKey!264 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932))))

(assert (= (and d!59577 res!116118) b!236878))

(assert (=> d!59577 m!257619))

(assert (=> d!59577 m!257619))

(assert (=> d!59577 m!257621))

(declare-fun m!257889 () Bool)

(assert (=> d!59577 m!257889))

(declare-fun m!257891 () Bool)

(assert (=> d!59577 m!257891))

(assert (=> b!236878 m!257615))

(assert (=> b!236624 d!59577))

(assert (=> b!236624 d!59573))

(assert (=> b!236624 d!59575))

(declare-fun d!59579 () Bool)

(assert (=> d!59579 (= (apply!214 lt!119714 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2869 (getValueByKey!273 (toList!1761 lt!119714) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8770 () Bool)

(assert (= bs!8770 d!59579))

(assert (=> bs!8770 m!257707))

(assert (=> bs!8770 m!257707))

(declare-fun m!257893 () Bool)

(assert (=> bs!8770 m!257893))

(assert (=> b!236689 d!59579))

(declare-fun d!59581 () Bool)

(declare-fun e!153815 () Bool)

(assert (=> d!59581 e!153815))

(declare-fun res!116119 () Bool)

(assert (=> d!59581 (=> res!116119 e!153815)))

(declare-fun lt!119839 () Bool)

(assert (=> d!59581 (= res!116119 (not lt!119839))))

(declare-fun lt!119838 () Bool)

(assert (=> d!59581 (= lt!119839 lt!119838)))

(declare-fun lt!119837 () Unit!7267)

(declare-fun e!153816 () Unit!7267)

(assert (=> d!59581 (= lt!119837 e!153816)))

(declare-fun c!39490 () Bool)

(assert (=> d!59581 (= c!39490 lt!119838)))

(assert (=> d!59581 (= lt!119838 (containsKey!264 (toList!1761 lt!119714) (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59581 (= (contains!1655 lt!119714 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)) lt!119839)))

(declare-fun b!236879 () Bool)

(declare-fun lt!119836 () Unit!7267)

(assert (=> b!236879 (= e!153816 lt!119836)))

(assert (=> b!236879 (= lt!119836 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1761 lt!119714) (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236879 (isDefined!213 (getValueByKey!273 (toList!1761 lt!119714) (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236880 () Bool)

(declare-fun Unit!7274 () Unit!7267)

(assert (=> b!236880 (= e!153816 Unit!7274)))

(declare-fun b!236881 () Bool)

(assert (=> b!236881 (= e!153815 (isDefined!213 (getValueByKey!273 (toList!1761 lt!119714) (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59581 c!39490) b!236879))

(assert (= (and d!59581 (not c!39490)) b!236880))

(assert (= (and d!59581 (not res!116119)) b!236881))

(assert (=> d!59581 m!257651))

(declare-fun m!257895 () Bool)

(assert (=> d!59581 m!257895))

(assert (=> b!236879 m!257651))

(declare-fun m!257897 () Bool)

(assert (=> b!236879 m!257897))

(assert (=> b!236879 m!257651))

(assert (=> b!236879 m!257867))

(assert (=> b!236879 m!257867))

(declare-fun m!257899 () Bool)

(assert (=> b!236879 m!257899))

(assert (=> b!236881 m!257651))

(assert (=> b!236881 m!257867))

(assert (=> b!236881 m!257867))

(assert (=> b!236881 m!257899))

(assert (=> b!236680 d!59581))

(declare-fun b!236892 () Bool)

(declare-fun e!153827 () Bool)

(declare-fun call!22005 () Bool)

(assert (=> b!236892 (= e!153827 call!22005)))

(declare-fun bm!22002 () Bool)

(declare-fun c!39493 () Bool)

(assert (=> bm!22002 (= call!22005 (arrayNoDuplicates!0 (_keys!6476 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39493 (Cons!3473 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000) Nil!3474) Nil!3474)))))

(declare-fun b!236893 () Bool)

(declare-fun e!153828 () Bool)

(assert (=> b!236893 (= e!153828 e!153827)))

(assert (=> b!236893 (= c!39493 (validKeyInArray!0 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236894 () Bool)

(declare-fun e!153825 () Bool)

(assert (=> b!236894 (= e!153825 e!153828)))

(declare-fun res!116127 () Bool)

(assert (=> b!236894 (=> (not res!116127) (not e!153828))))

(declare-fun e!153826 () Bool)

(assert (=> b!236894 (= res!116127 (not e!153826))))

(declare-fun res!116128 () Bool)

(assert (=> b!236894 (=> (not res!116128) (not e!153826))))

(assert (=> b!236894 (= res!116128 (validKeyInArray!0 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236895 () Bool)

(assert (=> b!236895 (= e!153827 call!22005)))

(declare-fun b!236896 () Bool)

(declare-fun contains!1658 (List!3477 (_ BitVec 64)) Bool)

(assert (=> b!236896 (= e!153826 (contains!1658 Nil!3474 (select (arr!5564 (_keys!6476 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59583 () Bool)

(declare-fun res!116126 () Bool)

(assert (=> d!59583 (=> res!116126 e!153825)))

(assert (=> d!59583 (= res!116126 (bvsge #b00000000000000000000000000000000 (size!5902 (_keys!6476 thiss!1504))))))

(assert (=> d!59583 (= (arrayNoDuplicates!0 (_keys!6476 thiss!1504) #b00000000000000000000000000000000 Nil!3474) e!153825)))

(assert (= (and d!59583 (not res!116126)) b!236894))

(assert (= (and b!236894 res!116128) b!236896))

(assert (= (and b!236894 res!116127) b!236893))

(assert (= (and b!236893 c!39493) b!236895))

(assert (= (and b!236893 (not c!39493)) b!236892))

(assert (= (or b!236895 b!236892) bm!22002))

(assert (=> bm!22002 m!257651))

(declare-fun m!257901 () Bool)

(assert (=> bm!22002 m!257901))

(assert (=> b!236893 m!257651))

(assert (=> b!236893 m!257651))

(assert (=> b!236893 m!257677))

(assert (=> b!236894 m!257651))

(assert (=> b!236894 m!257651))

(assert (=> b!236894 m!257677))

(assert (=> b!236896 m!257651))

(assert (=> b!236896 m!257651))

(declare-fun m!257903 () Bool)

(assert (=> b!236896 m!257903))

(assert (=> b!236700 d!59583))

(assert (=> b!236678 d!59571))

(declare-fun d!59585 () Bool)

(declare-fun res!116133 () Bool)

(declare-fun e!153833 () Bool)

(assert (=> d!59585 (=> res!116133 e!153833)))

(assert (=> d!59585 (= res!116133 (and ((_ is Cons!3471) (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) (= (_1!2299 (h!4124 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) key!932)))))

(assert (=> d!59585 (= (containsKey!264 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))) key!932) e!153833)))

(declare-fun b!236901 () Bool)

(declare-fun e!153834 () Bool)

(assert (=> b!236901 (= e!153833 e!153834)))

(declare-fun res!116134 () Bool)

(assert (=> b!236901 (=> (not res!116134) (not e!153834))))

(assert (=> b!236901 (= res!116134 (and (or (not ((_ is Cons!3471) (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) (bvsle (_1!2299 (h!4124 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) key!932)) ((_ is Cons!3471) (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) (bvslt (_1!2299 (h!4124 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504))))) key!932)))))

(declare-fun b!236902 () Bool)

(assert (=> b!236902 (= e!153834 (containsKey!264 (t!8448 (toList!1761 (getCurrentListMap!1293 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)))) key!932))))

(assert (= (and d!59585 (not res!116133)) b!236901))

(assert (= (and b!236901 res!116134) b!236902))

(declare-fun m!257905 () Bool)

(assert (=> b!236902 m!257905))

(assert (=> d!59501 d!59585))

(declare-fun mapIsEmpty!10552 () Bool)

(declare-fun mapRes!10552 () Bool)

(assert (=> mapIsEmpty!10552 mapRes!10552))

(declare-fun b!236903 () Bool)

(declare-fun e!153835 () Bool)

(assert (=> b!236903 (= e!153835 tp_is_empty!6223)))

(declare-fun b!236904 () Bool)

(declare-fun e!153836 () Bool)

(assert (=> b!236904 (= e!153836 tp_is_empty!6223)))

(declare-fun mapNonEmpty!10552 () Bool)

(declare-fun tp!22279 () Bool)

(assert (=> mapNonEmpty!10552 (= mapRes!10552 (and tp!22279 e!153835))))

(declare-fun mapKey!10552 () (_ BitVec 32))

(declare-fun mapRest!10552 () (Array (_ BitVec 32) ValueCell!2768))

(declare-fun mapValue!10552 () ValueCell!2768)

(assert (=> mapNonEmpty!10552 (= mapRest!10551 (store mapRest!10552 mapKey!10552 mapValue!10552))))

(declare-fun condMapEmpty!10552 () Bool)

(declare-fun mapDefault!10552 () ValueCell!2768)

(assert (=> mapNonEmpty!10551 (= condMapEmpty!10552 (= mapRest!10551 ((as const (Array (_ BitVec 32) ValueCell!2768)) mapDefault!10552)))))

(assert (=> mapNonEmpty!10551 (= tp!22278 (and e!153836 mapRes!10552))))

(assert (= (and mapNonEmpty!10551 condMapEmpty!10552) mapIsEmpty!10552))

(assert (= (and mapNonEmpty!10551 (not condMapEmpty!10552)) mapNonEmpty!10552))

(assert (= (and mapNonEmpty!10552 ((_ is ValueCellFull!2768) mapValue!10552)) b!236903))

(assert (= (and mapNonEmpty!10551 ((_ is ValueCellFull!2768) mapDefault!10552)) b!236904))

(declare-fun m!257907 () Bool)

(assert (=> mapNonEmpty!10552 m!257907))

(declare-fun b_lambda!7957 () Bool)

(assert (= b_lambda!7953 (or (and b!236540 b_free!6361) b_lambda!7957)))

(declare-fun b_lambda!7959 () Bool)

(assert (= b_lambda!7955 (or (and b!236540 b_free!6361) b_lambda!7959)))

(check-sat (not b!236786) (not b_lambda!7957) (not d!59547) (not b!236713) (not bm!21993) (not d!59545) (not b!236879) (not b_lambda!7951) (not b!236801) (not b!236741) (not d!59531) (not d!59533) (not d!59515) (not b!236845) (not b!236809) (not b!236717) (not b!236780) (not d!59555) (not bm!21996) (not d!59541) (not mapNonEmpty!10552) (not b!236894) (not b!236727) (not b!236878) (not b!236799) (not b!236802) (not b!236874) (not d!59551) (not b!236902) (not d!59567) (not b!236792) (not d!59539) (not d!59549) (not d!59557) (not b!236782) (not b!236893) (not b!236742) (not b!236714) (not d!59543) (not b!236844) (not d!59581) (not b!236783) (not d!59579) (not d!59563) (not b!236812) (not b_next!6361) (not b!236796) (not d!59535) (not b!236729) (not bm!22002) (not d!59553) b_and!13325 (not d!59559) (not d!59573) (not d!59569) (not b!236811) (not d!59527) (not b!236788) (not b!236715) (not b!236755) (not b!236731) (not b!236797) (not b!236862) (not d!59537) (not b!236881) (not b!236832) tp_is_empty!6223 (not b!236896) (not b!236785) (not b!236810) (not b!236794) (not d!59521) (not bm!21999) (not b!236787) (not d!59513) (not b_lambda!7959) (not b!236791) (not d!59519) (not d!59525) (not b!236795) (not d!59529) (not b!236730) (not d!59577))
(check-sat b_and!13325 (not b_next!6361))
