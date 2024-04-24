; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18256 () Bool)

(assert start!18256)

(declare-fun b!181432 () Bool)

(declare-fun b_free!4477 () Bool)

(declare-fun b_next!4477 () Bool)

(assert (=> b!181432 (= b_free!4477 (not b_next!4477))))

(declare-fun tp!16179 () Bool)

(declare-fun b_and!11039 () Bool)

(assert (=> b!181432 (= tp!16179 b_and!11039)))

(declare-fun b!181425 () Bool)

(declare-fun res!85892 () Bool)

(declare-fun e!119487 () Bool)

(assert (=> b!181425 (=> (not res!85892) (not e!119487))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!181425 (= res!85892 (not (= key!828 (bvneg key!828))))))

(declare-fun b!181426 () Bool)

(declare-fun res!85895 () Bool)

(declare-fun e!119484 () Bool)

(assert (=> b!181426 (=> (not res!85895) (not e!119484))))

(declare-datatypes ((V!5313 0))(
  ( (V!5314 (val!2169 Int)) )
))
(declare-datatypes ((ValueCell!1781 0))(
  ( (ValueCellFull!1781 (v!4066 V!5313)) (EmptyCell!1781) )
))
(declare-datatypes ((array!7663 0))(
  ( (array!7664 (arr!3626 (Array (_ BitVec 32) (_ BitVec 64))) (size!3936 (_ BitVec 32))) )
))
(declare-datatypes ((array!7665 0))(
  ( (array!7666 (arr!3627 (Array (_ BitVec 32) ValueCell!1781)) (size!3937 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2470 0))(
  ( (LongMapFixedSize!2471 (defaultEntry!3716 Int) (mask!8737 (_ BitVec 32)) (extraKeys!3453 (_ BitVec 32)) (zeroValue!3557 V!5313) (minValue!3557 V!5313) (_size!1284 (_ BitVec 32)) (_keys!5618 array!7663) (_values!3699 array!7665) (_vacant!1284 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2470)

(declare-datatypes ((tuple2!3334 0))(
  ( (tuple2!3335 (_1!1678 (_ BitVec 64)) (_2!1678 V!5313)) )
))
(declare-datatypes ((List!2276 0))(
  ( (Nil!2273) (Cons!2272 (h!2899 tuple2!3334) (t!7122 List!2276)) )
))
(declare-datatypes ((ListLongMap!2255 0))(
  ( (ListLongMap!2256 (toList!1143 List!2276)) )
))
(declare-fun contains!1235 (ListLongMap!2255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!795 (array!7663 array!7665 (_ BitVec 32) (_ BitVec 32) V!5313 V!5313 (_ BitVec 32) Int) ListLongMap!2255)

(assert (=> b!181426 (= res!85895 (contains!1235 (getCurrentListMap!795 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)) key!828))))

(declare-fun b!181427 () Bool)

(declare-fun res!85893 () Bool)

(assert (=> b!181427 (=> (not res!85893) (not e!119484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181427 (= res!85893 (validMask!0 (mask!8737 thiss!1248)))))

(declare-fun b!181428 () Bool)

(assert (=> b!181428 (= e!119484 (and (= (size!3937 (_values!3699 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8737 thiss!1248))) (= (size!3936 (_keys!5618 thiss!1248)) (size!3937 (_values!3699 thiss!1248))) (bvslt (mask!8737 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!7284 () Bool)

(declare-fun mapRes!7284 () Bool)

(assert (=> mapIsEmpty!7284 mapRes!7284))

(declare-fun mapNonEmpty!7284 () Bool)

(declare-fun tp!16178 () Bool)

(declare-fun e!119482 () Bool)

(assert (=> mapNonEmpty!7284 (= mapRes!7284 (and tp!16178 e!119482))))

(declare-fun mapValue!7284 () ValueCell!1781)

(declare-fun mapRest!7284 () (Array (_ BitVec 32) ValueCell!1781))

(declare-fun mapKey!7284 () (_ BitVec 32))

(assert (=> mapNonEmpty!7284 (= (arr!3627 (_values!3699 thiss!1248)) (store mapRest!7284 mapKey!7284 mapValue!7284))))

(declare-fun b!181429 () Bool)

(declare-fun e!119485 () Bool)

(declare-fun e!119488 () Bool)

(assert (=> b!181429 (= e!119485 (and e!119488 mapRes!7284))))

(declare-fun condMapEmpty!7284 () Bool)

(declare-fun mapDefault!7284 () ValueCell!1781)

(assert (=> b!181429 (= condMapEmpty!7284 (= (arr!3627 (_values!3699 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1781)) mapDefault!7284)))))

(declare-fun b!181431 () Bool)

(assert (=> b!181431 (= e!119487 e!119484)))

(declare-fun res!85894 () Bool)

(assert (=> b!181431 (=> (not res!85894) (not e!119484))))

(declare-datatypes ((SeekEntryResult!593 0))(
  ( (MissingZero!593 (index!4542 (_ BitVec 32))) (Found!593 (index!4543 (_ BitVec 32))) (Intermediate!593 (undefined!1405 Bool) (index!4544 (_ BitVec 32)) (x!19797 (_ BitVec 32))) (Undefined!593) (MissingVacant!593 (index!4545 (_ BitVec 32))) )
))
(declare-fun lt!89741 () SeekEntryResult!593)

(get-info :version)

(assert (=> b!181431 (= res!85894 (and (not ((_ is Undefined!593) lt!89741)) (not ((_ is MissingVacant!593) lt!89741)) (not ((_ is MissingZero!593) lt!89741)) ((_ is Found!593) lt!89741)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7663 (_ BitVec 32)) SeekEntryResult!593)

(assert (=> b!181431 (= lt!89741 (seekEntryOrOpen!0 key!828 (_keys!5618 thiss!1248) (mask!8737 thiss!1248)))))

(declare-fun e!119486 () Bool)

(declare-fun tp_is_empty!4249 () Bool)

(declare-fun array_inv!2343 (array!7663) Bool)

(declare-fun array_inv!2344 (array!7665) Bool)

(assert (=> b!181432 (= e!119486 (and tp!16179 tp_is_empty!4249 (array_inv!2343 (_keys!5618 thiss!1248)) (array_inv!2344 (_values!3699 thiss!1248)) e!119485))))

(declare-fun b!181433 () Bool)

(assert (=> b!181433 (= e!119488 tp_is_empty!4249)))

(declare-fun res!85891 () Bool)

(assert (=> start!18256 (=> (not res!85891) (not e!119487))))

(declare-fun valid!1049 (LongMapFixedSize!2470) Bool)

(assert (=> start!18256 (= res!85891 (valid!1049 thiss!1248))))

(assert (=> start!18256 e!119487))

(assert (=> start!18256 e!119486))

(assert (=> start!18256 true))

(declare-fun b!181430 () Bool)

(assert (=> b!181430 (= e!119482 tp_is_empty!4249)))

(assert (= (and start!18256 res!85891) b!181425))

(assert (= (and b!181425 res!85892) b!181431))

(assert (= (and b!181431 res!85894) b!181426))

(assert (= (and b!181426 res!85895) b!181427))

(assert (= (and b!181427 res!85893) b!181428))

(assert (= (and b!181429 condMapEmpty!7284) mapIsEmpty!7284))

(assert (= (and b!181429 (not condMapEmpty!7284)) mapNonEmpty!7284))

(assert (= (and mapNonEmpty!7284 ((_ is ValueCellFull!1781) mapValue!7284)) b!181430))

(assert (= (and b!181429 ((_ is ValueCellFull!1781) mapDefault!7284)) b!181433))

(assert (= b!181432 b!181429))

(assert (= start!18256 b!181432))

(declare-fun m!209493 () Bool)

(assert (=> b!181426 m!209493))

(assert (=> b!181426 m!209493))

(declare-fun m!209495 () Bool)

(assert (=> b!181426 m!209495))

(declare-fun m!209497 () Bool)

(assert (=> start!18256 m!209497))

(declare-fun m!209499 () Bool)

(assert (=> b!181427 m!209499))

(declare-fun m!209501 () Bool)

(assert (=> b!181431 m!209501))

(declare-fun m!209503 () Bool)

(assert (=> b!181432 m!209503))

(declare-fun m!209505 () Bool)

(assert (=> b!181432 m!209505))

(declare-fun m!209507 () Bool)

(assert (=> mapNonEmpty!7284 m!209507))

(check-sat (not mapNonEmpty!7284) (not b!181427) (not b_next!4477) tp_is_empty!4249 (not b!181432) (not start!18256) (not b!181426) b_and!11039 (not b!181431))
(check-sat b_and!11039 (not b_next!4477))
(get-model)

(declare-fun d!54503 () Bool)

(declare-fun e!119535 () Bool)

(assert (=> d!54503 e!119535))

(declare-fun res!85928 () Bool)

(assert (=> d!54503 (=> res!85928 e!119535)))

(declare-fun lt!89757 () Bool)

(assert (=> d!54503 (= res!85928 (not lt!89757))))

(declare-fun lt!89758 () Bool)

(assert (=> d!54503 (= lt!89757 lt!89758)))

(declare-datatypes ((Unit!5512 0))(
  ( (Unit!5513) )
))
(declare-fun lt!89756 () Unit!5512)

(declare-fun e!119536 () Unit!5512)

(assert (=> d!54503 (= lt!89756 e!119536)))

(declare-fun c!32528 () Bool)

(assert (=> d!54503 (= c!32528 lt!89758)))

(declare-fun containsKey!213 (List!2276 (_ BitVec 64)) Bool)

(assert (=> d!54503 (= lt!89758 (containsKey!213 (toList!1143 (getCurrentListMap!795 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248))) key!828))))

(assert (=> d!54503 (= (contains!1235 (getCurrentListMap!795 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)) key!828) lt!89757)))

(declare-fun b!181494 () Bool)

(declare-fun lt!89759 () Unit!5512)

(assert (=> b!181494 (= e!119536 lt!89759)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!161 (List!2276 (_ BitVec 64)) Unit!5512)

(assert (=> b!181494 (= lt!89759 (lemmaContainsKeyImpliesGetValueByKeyDefined!161 (toList!1143 (getCurrentListMap!795 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248))) key!828))))

(declare-datatypes ((Option!216 0))(
  ( (Some!215 (v!4069 V!5313)) (None!214) )
))
(declare-fun isDefined!162 (Option!216) Bool)

(declare-fun getValueByKey!210 (List!2276 (_ BitVec 64)) Option!216)

(assert (=> b!181494 (isDefined!162 (getValueByKey!210 (toList!1143 (getCurrentListMap!795 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248))) key!828))))

(declare-fun b!181495 () Bool)

(declare-fun Unit!5514 () Unit!5512)

(assert (=> b!181495 (= e!119536 Unit!5514)))

(declare-fun b!181496 () Bool)

(assert (=> b!181496 (= e!119535 (isDefined!162 (getValueByKey!210 (toList!1143 (getCurrentListMap!795 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248))) key!828)))))

(assert (= (and d!54503 c!32528) b!181494))

(assert (= (and d!54503 (not c!32528)) b!181495))

(assert (= (and d!54503 (not res!85928)) b!181496))

(declare-fun m!209541 () Bool)

(assert (=> d!54503 m!209541))

(declare-fun m!209543 () Bool)

(assert (=> b!181494 m!209543))

(declare-fun m!209545 () Bool)

(assert (=> b!181494 m!209545))

(assert (=> b!181494 m!209545))

(declare-fun m!209547 () Bool)

(assert (=> b!181494 m!209547))

(assert (=> b!181496 m!209545))

(assert (=> b!181496 m!209545))

(assert (=> b!181496 m!209547))

(assert (=> b!181426 d!54503))

(declare-fun b!181539 () Bool)

(declare-fun e!119573 () ListLongMap!2255)

(declare-fun call!18331 () ListLongMap!2255)

(declare-fun +!272 (ListLongMap!2255 tuple2!3334) ListLongMap!2255)

(assert (=> b!181539 (= e!119573 (+!272 call!18331 (tuple2!3335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3557 thiss!1248))))))

(declare-fun b!181540 () Bool)

(declare-fun e!119570 () ListLongMap!2255)

(declare-fun call!18328 () ListLongMap!2255)

(assert (=> b!181540 (= e!119570 call!18328)))

(declare-fun b!181541 () Bool)

(declare-fun e!119569 () Bool)

(declare-fun lt!89813 () ListLongMap!2255)

(declare-fun apply!152 (ListLongMap!2255 (_ BitVec 64)) V!5313)

(assert (=> b!181541 (= e!119569 (= (apply!152 lt!89813 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3557 thiss!1248)))))

(declare-fun b!181542 () Bool)

(declare-fun e!119571 () Bool)

(declare-fun call!18325 () Bool)

(assert (=> b!181542 (= e!119571 (not call!18325))))

(declare-fun b!181543 () Bool)

(declare-fun e!119566 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!181543 (= e!119566 (validKeyInArray!0 (select (arr!3626 (_keys!5618 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181544 () Bool)

(declare-fun e!119565 () Bool)

(assert (=> b!181544 (= e!119565 (validKeyInArray!0 (select (arr!3626 (_keys!5618 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18322 () Bool)

(declare-fun call!18329 () ListLongMap!2255)

(assert (=> bm!18322 (= call!18329 call!18331)))

(declare-fun b!181545 () Bool)

(declare-fun e!119567 () Bool)

(assert (=> b!181545 (= e!119567 e!119571)))

(declare-fun c!32546 () Bool)

(assert (=> b!181545 (= c!32546 (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181546 () Bool)

(declare-fun e!119574 () Bool)

(declare-fun call!18326 () Bool)

(assert (=> b!181546 (= e!119574 (not call!18326))))

(declare-fun b!181547 () Bool)

(declare-fun e!119564 () Unit!5512)

(declare-fun lt!89806 () Unit!5512)

(assert (=> b!181547 (= e!119564 lt!89806)))

(declare-fun lt!89808 () ListLongMap!2255)

(declare-fun getCurrentListMapNoExtraKeys!183 (array!7663 array!7665 (_ BitVec 32) (_ BitVec 32) V!5313 V!5313 (_ BitVec 32) Int) ListLongMap!2255)

(assert (=> b!181547 (= lt!89808 (getCurrentListMapNoExtraKeys!183 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)))))

(declare-fun lt!89823 () (_ BitVec 64))

(assert (=> b!181547 (= lt!89823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89807 () (_ BitVec 64))

(assert (=> b!181547 (= lt!89807 (select (arr!3626 (_keys!5618 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89810 () Unit!5512)

(declare-fun addStillContains!128 (ListLongMap!2255 (_ BitVec 64) V!5313 (_ BitVec 64)) Unit!5512)

(assert (=> b!181547 (= lt!89810 (addStillContains!128 lt!89808 lt!89823 (zeroValue!3557 thiss!1248) lt!89807))))

(assert (=> b!181547 (contains!1235 (+!272 lt!89808 (tuple2!3335 lt!89823 (zeroValue!3557 thiss!1248))) lt!89807)))

(declare-fun lt!89821 () Unit!5512)

(assert (=> b!181547 (= lt!89821 lt!89810)))

(declare-fun lt!89819 () ListLongMap!2255)

(assert (=> b!181547 (= lt!89819 (getCurrentListMapNoExtraKeys!183 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)))))

(declare-fun lt!89815 () (_ BitVec 64))

(assert (=> b!181547 (= lt!89815 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89814 () (_ BitVec 64))

(assert (=> b!181547 (= lt!89814 (select (arr!3626 (_keys!5618 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89805 () Unit!5512)

(declare-fun addApplyDifferent!128 (ListLongMap!2255 (_ BitVec 64) V!5313 (_ BitVec 64)) Unit!5512)

(assert (=> b!181547 (= lt!89805 (addApplyDifferent!128 lt!89819 lt!89815 (minValue!3557 thiss!1248) lt!89814))))

(assert (=> b!181547 (= (apply!152 (+!272 lt!89819 (tuple2!3335 lt!89815 (minValue!3557 thiss!1248))) lt!89814) (apply!152 lt!89819 lt!89814))))

(declare-fun lt!89822 () Unit!5512)

(assert (=> b!181547 (= lt!89822 lt!89805)))

(declare-fun lt!89817 () ListLongMap!2255)

(assert (=> b!181547 (= lt!89817 (getCurrentListMapNoExtraKeys!183 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)))))

(declare-fun lt!89816 () (_ BitVec 64))

(assert (=> b!181547 (= lt!89816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89809 () (_ BitVec 64))

(assert (=> b!181547 (= lt!89809 (select (arr!3626 (_keys!5618 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89812 () Unit!5512)

(assert (=> b!181547 (= lt!89812 (addApplyDifferent!128 lt!89817 lt!89816 (zeroValue!3557 thiss!1248) lt!89809))))

(assert (=> b!181547 (= (apply!152 (+!272 lt!89817 (tuple2!3335 lt!89816 (zeroValue!3557 thiss!1248))) lt!89809) (apply!152 lt!89817 lt!89809))))

(declare-fun lt!89804 () Unit!5512)

(assert (=> b!181547 (= lt!89804 lt!89812)))

(declare-fun lt!89811 () ListLongMap!2255)

(assert (=> b!181547 (= lt!89811 (getCurrentListMapNoExtraKeys!183 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)))))

(declare-fun lt!89825 () (_ BitVec 64))

(assert (=> b!181547 (= lt!89825 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89818 () (_ BitVec 64))

(assert (=> b!181547 (= lt!89818 (select (arr!3626 (_keys!5618 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181547 (= lt!89806 (addApplyDifferent!128 lt!89811 lt!89825 (minValue!3557 thiss!1248) lt!89818))))

(assert (=> b!181547 (= (apply!152 (+!272 lt!89811 (tuple2!3335 lt!89825 (minValue!3557 thiss!1248))) lt!89818) (apply!152 lt!89811 lt!89818))))

(declare-fun bm!18323 () Bool)

(declare-fun call!18327 () ListLongMap!2255)

(declare-fun call!18330 () ListLongMap!2255)

(assert (=> bm!18323 (= call!18327 call!18330)))

(declare-fun b!181549 () Bool)

(declare-fun e!119563 () Bool)

(declare-fun get!2085 (ValueCell!1781 V!5313) V!5313)

(declare-fun dynLambda!495 (Int (_ BitVec 64)) V!5313)

(assert (=> b!181549 (= e!119563 (= (apply!152 lt!89813 (select (arr!3626 (_keys!5618 thiss!1248)) #b00000000000000000000000000000000)) (get!2085 (select (arr!3627 (_values!3699 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!495 (defaultEntry!3716 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3937 (_values!3699 thiss!1248))))))

(assert (=> b!181549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3936 (_keys!5618 thiss!1248))))))

(declare-fun bm!18324 () Bool)

(assert (=> bm!18324 (= call!18328 call!18327)))

(declare-fun b!181550 () Bool)

(declare-fun e!119575 () Bool)

(assert (=> b!181550 (= e!119575 (= (apply!152 lt!89813 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3557 thiss!1248)))))

(declare-fun b!181551 () Bool)

(assert (=> b!181551 (= e!119570 call!18329)))

(declare-fun b!181552 () Bool)

(assert (=> b!181552 (= e!119571 e!119575)))

(declare-fun res!85950 () Bool)

(assert (=> b!181552 (= res!85950 call!18325)))

(assert (=> b!181552 (=> (not res!85950) (not e!119575))))

(declare-fun b!181553 () Bool)

(assert (=> b!181553 (= e!119574 e!119569)))

(declare-fun res!85953 () Bool)

(assert (=> b!181553 (= res!85953 call!18326)))

(assert (=> b!181553 (=> (not res!85953) (not e!119569))))

(declare-fun bm!18325 () Bool)

(assert (=> bm!18325 (= call!18330 (getCurrentListMapNoExtraKeys!183 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)))))

(declare-fun b!181554 () Bool)

(declare-fun res!85951 () Bool)

(assert (=> b!181554 (=> (not res!85951) (not e!119567))))

(assert (=> b!181554 (= res!85951 e!119574)))

(declare-fun c!32542 () Bool)

(assert (=> b!181554 (= c!32542 (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!181555 () Bool)

(declare-fun c!32544 () Bool)

(assert (=> b!181555 (= c!32544 (and (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!119572 () ListLongMap!2255)

(assert (=> b!181555 (= e!119572 e!119570)))

(declare-fun bm!18326 () Bool)

(assert (=> bm!18326 (= call!18325 (contains!1235 lt!89813 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181556 () Bool)

(assert (=> b!181556 (= e!119572 call!18329)))

(declare-fun b!181557 () Bool)

(assert (=> b!181557 (= e!119573 e!119572)))

(declare-fun c!32545 () Bool)

(assert (=> b!181557 (= c!32545 (and (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!54505 () Bool)

(assert (=> d!54505 e!119567))

(declare-fun res!85949 () Bool)

(assert (=> d!54505 (=> (not res!85949) (not e!119567))))

(assert (=> d!54505 (= res!85949 (or (bvsge #b00000000000000000000000000000000 (size!3936 (_keys!5618 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3936 (_keys!5618 thiss!1248))))))))

(declare-fun lt!89820 () ListLongMap!2255)

(assert (=> d!54505 (= lt!89813 lt!89820)))

(declare-fun lt!89824 () Unit!5512)

(assert (=> d!54505 (= lt!89824 e!119564)))

(declare-fun c!32541 () Bool)

(assert (=> d!54505 (= c!32541 e!119565)))

(declare-fun res!85954 () Bool)

(assert (=> d!54505 (=> (not res!85954) (not e!119565))))

(assert (=> d!54505 (= res!85954 (bvslt #b00000000000000000000000000000000 (size!3936 (_keys!5618 thiss!1248))))))

(assert (=> d!54505 (= lt!89820 e!119573)))

(declare-fun c!32543 () Bool)

(assert (=> d!54505 (= c!32543 (and (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54505 (validMask!0 (mask!8737 thiss!1248))))

(assert (=> d!54505 (= (getCurrentListMap!795 (_keys!5618 thiss!1248) (_values!3699 thiss!1248) (mask!8737 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)) lt!89813)))

(declare-fun b!181548 () Bool)

(declare-fun Unit!5515 () Unit!5512)

(assert (=> b!181548 (= e!119564 Unit!5515)))

(declare-fun bm!18327 () Bool)

(assert (=> bm!18327 (= call!18331 (+!272 (ite c!32543 call!18330 (ite c!32545 call!18327 call!18328)) (ite (or c!32543 c!32545) (tuple2!3335 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3557 thiss!1248)) (tuple2!3335 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3557 thiss!1248)))))))

(declare-fun b!181558 () Bool)

(declare-fun e!119568 () Bool)

(assert (=> b!181558 (= e!119568 e!119563)))

(declare-fun res!85952 () Bool)

(assert (=> b!181558 (=> (not res!85952) (not e!119563))))

(assert (=> b!181558 (= res!85952 (contains!1235 lt!89813 (select (arr!3626 (_keys!5618 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181558 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3936 (_keys!5618 thiss!1248))))))

(declare-fun bm!18328 () Bool)

(assert (=> bm!18328 (= call!18326 (contains!1235 lt!89813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181559 () Bool)

(declare-fun res!85948 () Bool)

(assert (=> b!181559 (=> (not res!85948) (not e!119567))))

(assert (=> b!181559 (= res!85948 e!119568)))

(declare-fun res!85947 () Bool)

(assert (=> b!181559 (=> res!85947 e!119568)))

(assert (=> b!181559 (= res!85947 (not e!119566))))

(declare-fun res!85955 () Bool)

(assert (=> b!181559 (=> (not res!85955) (not e!119566))))

(assert (=> b!181559 (= res!85955 (bvslt #b00000000000000000000000000000000 (size!3936 (_keys!5618 thiss!1248))))))

(assert (= (and d!54505 c!32543) b!181539))

(assert (= (and d!54505 (not c!32543)) b!181557))

(assert (= (and b!181557 c!32545) b!181556))

(assert (= (and b!181557 (not c!32545)) b!181555))

(assert (= (and b!181555 c!32544) b!181551))

(assert (= (and b!181555 (not c!32544)) b!181540))

(assert (= (or b!181551 b!181540) bm!18324))

(assert (= (or b!181556 bm!18324) bm!18323))

(assert (= (or b!181556 b!181551) bm!18322))

(assert (= (or b!181539 bm!18323) bm!18325))

(assert (= (or b!181539 bm!18322) bm!18327))

(assert (= (and d!54505 res!85954) b!181544))

(assert (= (and d!54505 c!32541) b!181547))

(assert (= (and d!54505 (not c!32541)) b!181548))

(assert (= (and d!54505 res!85949) b!181559))

(assert (= (and b!181559 res!85955) b!181543))

(assert (= (and b!181559 (not res!85947)) b!181558))

(assert (= (and b!181558 res!85952) b!181549))

(assert (= (and b!181559 res!85948) b!181554))

(assert (= (and b!181554 c!32542) b!181553))

(assert (= (and b!181554 (not c!32542)) b!181546))

(assert (= (and b!181553 res!85953) b!181541))

(assert (= (or b!181553 b!181546) bm!18328))

(assert (= (and b!181554 res!85951) b!181545))

(assert (= (and b!181545 c!32546) b!181552))

(assert (= (and b!181545 (not c!32546)) b!181542))

(assert (= (and b!181552 res!85950) b!181550))

(assert (= (or b!181552 b!181542) bm!18326))

(declare-fun b_lambda!7169 () Bool)

(assert (=> (not b_lambda!7169) (not b!181549)))

(declare-fun t!7125 () Bool)

(declare-fun tb!2807 () Bool)

(assert (=> (and b!181432 (= (defaultEntry!3716 thiss!1248) (defaultEntry!3716 thiss!1248)) t!7125) tb!2807))

(declare-fun result!4715 () Bool)

(assert (=> tb!2807 (= result!4715 tp_is_empty!4249)))

(assert (=> b!181549 t!7125))

(declare-fun b_and!11045 () Bool)

(assert (= b_and!11039 (and (=> t!7125 result!4715) b_and!11045)))

(declare-fun m!209549 () Bool)

(assert (=> bm!18328 m!209549))

(declare-fun m!209551 () Bool)

(assert (=> b!181539 m!209551))

(declare-fun m!209553 () Bool)

(assert (=> b!181547 m!209553))

(declare-fun m!209555 () Bool)

(assert (=> b!181547 m!209555))

(declare-fun m!209557 () Bool)

(assert (=> b!181547 m!209557))

(declare-fun m!209559 () Bool)

(assert (=> b!181547 m!209559))

(declare-fun m!209561 () Bool)

(assert (=> b!181547 m!209561))

(assert (=> b!181547 m!209555))

(declare-fun m!209563 () Bool)

(assert (=> b!181547 m!209563))

(declare-fun m!209565 () Bool)

(assert (=> b!181547 m!209565))

(declare-fun m!209567 () Bool)

(assert (=> b!181547 m!209567))

(declare-fun m!209569 () Bool)

(assert (=> b!181547 m!209569))

(declare-fun m!209571 () Bool)

(assert (=> b!181547 m!209571))

(assert (=> b!181547 m!209565))

(declare-fun m!209573 () Bool)

(assert (=> b!181547 m!209573))

(assert (=> b!181547 m!209561))

(declare-fun m!209575 () Bool)

(assert (=> b!181547 m!209575))

(declare-fun m!209577 () Bool)

(assert (=> b!181547 m!209577))

(declare-fun m!209579 () Bool)

(assert (=> b!181547 m!209579))

(declare-fun m!209581 () Bool)

(assert (=> b!181547 m!209581))

(declare-fun m!209583 () Bool)

(assert (=> b!181547 m!209583))

(declare-fun m!209585 () Bool)

(assert (=> b!181547 m!209585))

(assert (=> b!181547 m!209567))

(declare-fun m!209587 () Bool)

(assert (=> bm!18326 m!209587))

(assert (=> bm!18325 m!209585))

(declare-fun m!209589 () Bool)

(assert (=> b!181550 m!209589))

(declare-fun m!209591 () Bool)

(assert (=> b!181549 m!209591))

(declare-fun m!209593 () Bool)

(assert (=> b!181549 m!209593))

(assert (=> b!181549 m!209593))

(assert (=> b!181549 m!209591))

(declare-fun m!209595 () Bool)

(assert (=> b!181549 m!209595))

(assert (=> b!181549 m!209581))

(assert (=> b!181549 m!209581))

(declare-fun m!209597 () Bool)

(assert (=> b!181549 m!209597))

(declare-fun m!209599 () Bool)

(assert (=> b!181541 m!209599))

(declare-fun m!209601 () Bool)

(assert (=> bm!18327 m!209601))

(assert (=> b!181544 m!209581))

(assert (=> b!181544 m!209581))

(declare-fun m!209603 () Bool)

(assert (=> b!181544 m!209603))

(assert (=> b!181543 m!209581))

(assert (=> b!181543 m!209581))

(assert (=> b!181543 m!209603))

(assert (=> b!181558 m!209581))

(assert (=> b!181558 m!209581))

(declare-fun m!209605 () Bool)

(assert (=> b!181558 m!209605))

(assert (=> d!54505 m!209499))

(assert (=> b!181426 d!54505))

(declare-fun d!54507 () Bool)

(assert (=> d!54507 (= (validMask!0 (mask!8737 thiss!1248)) (and (or (= (mask!8737 thiss!1248) #b00000000000000000000000000000111) (= (mask!8737 thiss!1248) #b00000000000000000000000000001111) (= (mask!8737 thiss!1248) #b00000000000000000000000000011111) (= (mask!8737 thiss!1248) #b00000000000000000000000000111111) (= (mask!8737 thiss!1248) #b00000000000000000000000001111111) (= (mask!8737 thiss!1248) #b00000000000000000000000011111111) (= (mask!8737 thiss!1248) #b00000000000000000000000111111111) (= (mask!8737 thiss!1248) #b00000000000000000000001111111111) (= (mask!8737 thiss!1248) #b00000000000000000000011111111111) (= (mask!8737 thiss!1248) #b00000000000000000000111111111111) (= (mask!8737 thiss!1248) #b00000000000000000001111111111111) (= (mask!8737 thiss!1248) #b00000000000000000011111111111111) (= (mask!8737 thiss!1248) #b00000000000000000111111111111111) (= (mask!8737 thiss!1248) #b00000000000000001111111111111111) (= (mask!8737 thiss!1248) #b00000000000000011111111111111111) (= (mask!8737 thiss!1248) #b00000000000000111111111111111111) (= (mask!8737 thiss!1248) #b00000000000001111111111111111111) (= (mask!8737 thiss!1248) #b00000000000011111111111111111111) (= (mask!8737 thiss!1248) #b00000000000111111111111111111111) (= (mask!8737 thiss!1248) #b00000000001111111111111111111111) (= (mask!8737 thiss!1248) #b00000000011111111111111111111111) (= (mask!8737 thiss!1248) #b00000000111111111111111111111111) (= (mask!8737 thiss!1248) #b00000001111111111111111111111111) (= (mask!8737 thiss!1248) #b00000011111111111111111111111111) (= (mask!8737 thiss!1248) #b00000111111111111111111111111111) (= (mask!8737 thiss!1248) #b00001111111111111111111111111111) (= (mask!8737 thiss!1248) #b00011111111111111111111111111111) (= (mask!8737 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8737 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!181427 d!54507))

(declare-fun d!54509 () Bool)

(assert (=> d!54509 (= (array_inv!2343 (_keys!5618 thiss!1248)) (bvsge (size!3936 (_keys!5618 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181432 d!54509))

(declare-fun d!54511 () Bool)

(assert (=> d!54511 (= (array_inv!2344 (_values!3699 thiss!1248)) (bvsge (size!3937 (_values!3699 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181432 d!54511))

(declare-fun d!54513 () Bool)

(declare-fun lt!89834 () SeekEntryResult!593)

(assert (=> d!54513 (and (or ((_ is Undefined!593) lt!89834) (not ((_ is Found!593) lt!89834)) (and (bvsge (index!4543 lt!89834) #b00000000000000000000000000000000) (bvslt (index!4543 lt!89834) (size!3936 (_keys!5618 thiss!1248))))) (or ((_ is Undefined!593) lt!89834) ((_ is Found!593) lt!89834) (not ((_ is MissingZero!593) lt!89834)) (and (bvsge (index!4542 lt!89834) #b00000000000000000000000000000000) (bvslt (index!4542 lt!89834) (size!3936 (_keys!5618 thiss!1248))))) (or ((_ is Undefined!593) lt!89834) ((_ is Found!593) lt!89834) ((_ is MissingZero!593) lt!89834) (not ((_ is MissingVacant!593) lt!89834)) (and (bvsge (index!4545 lt!89834) #b00000000000000000000000000000000) (bvslt (index!4545 lt!89834) (size!3936 (_keys!5618 thiss!1248))))) (or ((_ is Undefined!593) lt!89834) (ite ((_ is Found!593) lt!89834) (= (select (arr!3626 (_keys!5618 thiss!1248)) (index!4543 lt!89834)) key!828) (ite ((_ is MissingZero!593) lt!89834) (= (select (arr!3626 (_keys!5618 thiss!1248)) (index!4542 lt!89834)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!593) lt!89834) (= (select (arr!3626 (_keys!5618 thiss!1248)) (index!4545 lt!89834)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!119583 () SeekEntryResult!593)

(assert (=> d!54513 (= lt!89834 e!119583)))

(declare-fun c!32555 () Bool)

(declare-fun lt!89832 () SeekEntryResult!593)

(assert (=> d!54513 (= c!32555 (and ((_ is Intermediate!593) lt!89832) (undefined!1405 lt!89832)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7663 (_ BitVec 32)) SeekEntryResult!593)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54513 (= lt!89832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8737 thiss!1248)) key!828 (_keys!5618 thiss!1248) (mask!8737 thiss!1248)))))

(assert (=> d!54513 (validMask!0 (mask!8737 thiss!1248))))

(assert (=> d!54513 (= (seekEntryOrOpen!0 key!828 (_keys!5618 thiss!1248) (mask!8737 thiss!1248)) lt!89834)))

(declare-fun b!181574 () Bool)

(assert (=> b!181574 (= e!119583 Undefined!593)))

(declare-fun b!181575 () Bool)

(declare-fun e!119584 () SeekEntryResult!593)

(assert (=> b!181575 (= e!119584 (Found!593 (index!4544 lt!89832)))))

(declare-fun b!181576 () Bool)

(declare-fun c!32554 () Bool)

(declare-fun lt!89833 () (_ BitVec 64))

(assert (=> b!181576 (= c!32554 (= lt!89833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119582 () SeekEntryResult!593)

(assert (=> b!181576 (= e!119584 e!119582)))

(declare-fun b!181577 () Bool)

(assert (=> b!181577 (= e!119582 (MissingZero!593 (index!4544 lt!89832)))))

(declare-fun b!181578 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7663 (_ BitVec 32)) SeekEntryResult!593)

(assert (=> b!181578 (= e!119582 (seekKeyOrZeroReturnVacant!0 (x!19797 lt!89832) (index!4544 lt!89832) (index!4544 lt!89832) key!828 (_keys!5618 thiss!1248) (mask!8737 thiss!1248)))))

(declare-fun b!181579 () Bool)

(assert (=> b!181579 (= e!119583 e!119584)))

(assert (=> b!181579 (= lt!89833 (select (arr!3626 (_keys!5618 thiss!1248)) (index!4544 lt!89832)))))

(declare-fun c!32553 () Bool)

(assert (=> b!181579 (= c!32553 (= lt!89833 key!828))))

(assert (= (and d!54513 c!32555) b!181574))

(assert (= (and d!54513 (not c!32555)) b!181579))

(assert (= (and b!181579 c!32553) b!181575))

(assert (= (and b!181579 (not c!32553)) b!181576))

(assert (= (and b!181576 c!32554) b!181577))

(assert (= (and b!181576 (not c!32554)) b!181578))

(declare-fun m!209607 () Bool)

(assert (=> d!54513 m!209607))

(assert (=> d!54513 m!209499))

(declare-fun m!209609 () Bool)

(assert (=> d!54513 m!209609))

(declare-fun m!209611 () Bool)

(assert (=> d!54513 m!209611))

(assert (=> d!54513 m!209611))

(declare-fun m!209613 () Bool)

(assert (=> d!54513 m!209613))

(declare-fun m!209615 () Bool)

(assert (=> d!54513 m!209615))

(declare-fun m!209617 () Bool)

(assert (=> b!181578 m!209617))

(declare-fun m!209619 () Bool)

(assert (=> b!181579 m!209619))

(assert (=> b!181431 d!54513))

(declare-fun d!54515 () Bool)

(declare-fun res!85962 () Bool)

(declare-fun e!119587 () Bool)

(assert (=> d!54515 (=> (not res!85962) (not e!119587))))

(declare-fun simpleValid!168 (LongMapFixedSize!2470) Bool)

(assert (=> d!54515 (= res!85962 (simpleValid!168 thiss!1248))))

(assert (=> d!54515 (= (valid!1049 thiss!1248) e!119587)))

(declare-fun b!181586 () Bool)

(declare-fun res!85963 () Bool)

(assert (=> b!181586 (=> (not res!85963) (not e!119587))))

(declare-fun arrayCountValidKeys!0 (array!7663 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181586 (= res!85963 (= (arrayCountValidKeys!0 (_keys!5618 thiss!1248) #b00000000000000000000000000000000 (size!3936 (_keys!5618 thiss!1248))) (_size!1284 thiss!1248)))))

(declare-fun b!181587 () Bool)

(declare-fun res!85964 () Bool)

(assert (=> b!181587 (=> (not res!85964) (not e!119587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7663 (_ BitVec 32)) Bool)

(assert (=> b!181587 (= res!85964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5618 thiss!1248) (mask!8737 thiss!1248)))))

(declare-fun b!181588 () Bool)

(declare-datatypes ((List!2278 0))(
  ( (Nil!2275) (Cons!2274 (h!2901 (_ BitVec 64)) (t!7126 List!2278)) )
))
(declare-fun arrayNoDuplicates!0 (array!7663 (_ BitVec 32) List!2278) Bool)

(assert (=> b!181588 (= e!119587 (arrayNoDuplicates!0 (_keys!5618 thiss!1248) #b00000000000000000000000000000000 Nil!2275))))

(assert (= (and d!54515 res!85962) b!181586))

(assert (= (and b!181586 res!85963) b!181587))

(assert (= (and b!181587 res!85964) b!181588))

(declare-fun m!209621 () Bool)

(assert (=> d!54515 m!209621))

(declare-fun m!209623 () Bool)

(assert (=> b!181586 m!209623))

(declare-fun m!209625 () Bool)

(assert (=> b!181587 m!209625))

(declare-fun m!209627 () Bool)

(assert (=> b!181588 m!209627))

(assert (=> start!18256 d!54515))

(declare-fun mapIsEmpty!7293 () Bool)

(declare-fun mapRes!7293 () Bool)

(assert (=> mapIsEmpty!7293 mapRes!7293))

(declare-fun condMapEmpty!7293 () Bool)

(declare-fun mapDefault!7293 () ValueCell!1781)

(assert (=> mapNonEmpty!7284 (= condMapEmpty!7293 (= mapRest!7284 ((as const (Array (_ BitVec 32) ValueCell!1781)) mapDefault!7293)))))

(declare-fun e!119593 () Bool)

(assert (=> mapNonEmpty!7284 (= tp!16178 (and e!119593 mapRes!7293))))

(declare-fun mapNonEmpty!7293 () Bool)

(declare-fun tp!16194 () Bool)

(declare-fun e!119592 () Bool)

(assert (=> mapNonEmpty!7293 (= mapRes!7293 (and tp!16194 e!119592))))

(declare-fun mapKey!7293 () (_ BitVec 32))

(declare-fun mapValue!7293 () ValueCell!1781)

(declare-fun mapRest!7293 () (Array (_ BitVec 32) ValueCell!1781))

(assert (=> mapNonEmpty!7293 (= mapRest!7284 (store mapRest!7293 mapKey!7293 mapValue!7293))))

(declare-fun b!181596 () Bool)

(assert (=> b!181596 (= e!119593 tp_is_empty!4249)))

(declare-fun b!181595 () Bool)

(assert (=> b!181595 (= e!119592 tp_is_empty!4249)))

(assert (= (and mapNonEmpty!7284 condMapEmpty!7293) mapIsEmpty!7293))

(assert (= (and mapNonEmpty!7284 (not condMapEmpty!7293)) mapNonEmpty!7293))

(assert (= (and mapNonEmpty!7293 ((_ is ValueCellFull!1781) mapValue!7293)) b!181595))

(assert (= (and mapNonEmpty!7284 ((_ is ValueCellFull!1781) mapDefault!7293)) b!181596))

(declare-fun m!209629 () Bool)

(assert (=> mapNonEmpty!7293 m!209629))

(declare-fun b_lambda!7171 () Bool)

(assert (= b_lambda!7169 (or (and b!181432 b_free!4477) b_lambda!7171)))

(check-sat (not b!181544) tp_is_empty!4249 (not b!181588) (not b!181539) (not bm!18327) (not b!181543) (not b!181550) (not b!181547) b_and!11045 (not b_lambda!7171) (not b!181586) (not bm!18326) (not b_next!4477) (not b!181578) (not b!181587) (not d!54513) (not b!181541) (not bm!18325) (not d!54515) (not b!181496) (not d!54503) (not b!181549) (not bm!18328) (not b!181558) (not mapNonEmpty!7293) (not b!181494) (not d!54505))
(check-sat b_and!11045 (not b_next!4477))
