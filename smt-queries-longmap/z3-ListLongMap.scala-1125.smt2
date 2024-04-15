; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23088 () Bool)

(assert start!23088)

(declare-fun b!241817 () Bool)

(declare-fun b_free!6499 () Bool)

(declare-fun b_next!6499 () Bool)

(assert (=> b!241817 (= b_free!6499 (not b_next!6499))))

(declare-fun tp!22708 () Bool)

(declare-fun b_and!13447 () Bool)

(assert (=> b!241817 (= tp!22708 b_and!13447)))

(declare-fun b!241812 () Bool)

(declare-datatypes ((Unit!7445 0))(
  ( (Unit!7446) )
))
(declare-fun e!156935 () Unit!7445)

(declare-fun Unit!7447 () Unit!7445)

(assert (=> b!241812 (= e!156935 Unit!7447)))

(declare-fun b!241813 () Bool)

(declare-fun e!156931 () Bool)

(declare-fun call!22505 () Bool)

(assert (=> b!241813 (= e!156931 (not call!22505))))

(declare-fun bm!22502 () Bool)

(declare-fun call!22506 () Bool)

(declare-fun c!40333 () Bool)

(declare-datatypes ((SeekEntryResult!1060 0))(
  ( (MissingZero!1060 (index!6410 (_ BitVec 32))) (Found!1060 (index!6411 (_ BitVec 32))) (Intermediate!1060 (undefined!1872 Bool) (index!6412 (_ BitVec 32)) (x!24247 (_ BitVec 32))) (Undefined!1060) (MissingVacant!1060 (index!6413 (_ BitVec 32))) )
))
(declare-fun lt!121397 () SeekEntryResult!1060)

(declare-datatypes ((V!8129 0))(
  ( (V!8130 (val!3225 Int)) )
))
(declare-datatypes ((ValueCell!2837 0))(
  ( (ValueCellFull!2837 (v!5259 V!8129)) (EmptyCell!2837) )
))
(declare-datatypes ((array!11997 0))(
  ( (array!11998 (arr!5697 (Array (_ BitVec 32) ValueCell!2837)) (size!6040 (_ BitVec 32))) )
))
(declare-datatypes ((array!11999 0))(
  ( (array!12000 (arr!5698 (Array (_ BitVec 32) (_ BitVec 64))) (size!6041 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3574 0))(
  ( (LongMapFixedSize!3575 (defaultEntry!4484 Int) (mask!10560 (_ BitVec 32)) (extraKeys!4221 (_ BitVec 32)) (zeroValue!4325 V!8129) (minValue!4325 V!8129) (_size!1836 (_ BitVec 32)) (_keys!6590 array!11999) (_values!4467 array!11997) (_vacant!1836 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3574)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22502 (= call!22506 (inRange!0 (ite c!40333 (index!6410 lt!121397) (index!6413 lt!121397)) (mask!10560 thiss!1504)))))

(declare-fun b!241814 () Bool)

(declare-fun e!156932 () Bool)

(declare-datatypes ((List!3616 0))(
  ( (Nil!3613) (Cons!3612 (h!4269 (_ BitVec 64)) (t!8606 List!3616)) )
))
(declare-fun noDuplicate!88 (List!3616) Bool)

(assert (=> b!241814 (= e!156932 (not (noDuplicate!88 Nil!3613)))))

(declare-fun b!241815 () Bool)

(declare-fun e!156929 () Unit!7445)

(declare-fun lt!121394 () Unit!7445)

(assert (=> b!241815 (= e!156929 lt!121394)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!357 (array!11999 array!11997 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) Int) Unit!7445)

(assert (=> b!241815 (= lt!121394 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!357 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)))))

(get-info :version)

(assert (=> b!241815 (= c!40333 ((_ is MissingZero!1060) lt!121397))))

(declare-fun e!156928 () Bool)

(assert (=> b!241815 e!156928))

(declare-fun b!241816 () Bool)

(declare-fun e!156941 () Bool)

(declare-fun e!156927 () Bool)

(assert (=> b!241816 (= e!156941 e!156927)))

(declare-fun res!118475 () Bool)

(assert (=> b!241816 (=> (not res!118475) (not e!156927))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!241816 (= res!118475 (or (= lt!121397 (MissingZero!1060 index!297)) (= lt!121397 (MissingVacant!1060 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11999 (_ BitVec 32)) SeekEntryResult!1060)

(assert (=> b!241816 (= lt!121397 (seekEntryOrOpen!0 key!932 (_keys!6590 thiss!1504) (mask!10560 thiss!1504)))))

(declare-fun e!156934 () Bool)

(declare-fun e!156936 () Bool)

(declare-fun tp_is_empty!6361 () Bool)

(declare-fun array_inv!3759 (array!11999) Bool)

(declare-fun array_inv!3760 (array!11997) Bool)

(assert (=> b!241817 (= e!156936 (and tp!22708 tp_is_empty!6361 (array_inv!3759 (_keys!6590 thiss!1504)) (array_inv!3760 (_values!4467 thiss!1504)) e!156934))))

(declare-fun b!241818 () Bool)

(declare-fun Unit!7448 () Unit!7445)

(assert (=> b!241818 (= e!156935 Unit!7448)))

(declare-fun lt!121395 () Unit!7445)

(declare-fun lemmaArrayContainsKeyThenInListMap!169 (array!11999 array!11997 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) (_ BitVec 32) Int) Unit!7445)

(assert (=> b!241818 (= lt!121395 (lemmaArrayContainsKeyThenInListMap!169 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(assert (=> b!241818 false))

(declare-fun b!241819 () Bool)

(declare-fun e!156930 () Bool)

(assert (=> b!241819 (= e!156930 e!156932)))

(declare-fun res!118476 () Bool)

(assert (=> b!241819 (=> (not res!118476) (not e!156932))))

(assert (=> b!241819 (= res!118476 (and (bvslt (size!6041 (_keys!6590 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6590 thiss!1504)))))))

(declare-fun lt!121399 () Unit!7445)

(assert (=> b!241819 (= lt!121399 e!156935)))

(declare-fun c!40336 () Bool)

(declare-fun arrayContainsKey!0 (array!11999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!241819 (= c!40336 (arrayContainsKey!0 (_keys!6590 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241820 () Bool)

(declare-fun e!156940 () Bool)

(assert (=> b!241820 (= e!156940 tp_is_empty!6361)))

(declare-fun mapNonEmpty!10780 () Bool)

(declare-fun mapRes!10780 () Bool)

(declare-fun tp!22707 () Bool)

(declare-fun e!156937 () Bool)

(assert (=> mapNonEmpty!10780 (= mapRes!10780 (and tp!22707 e!156937))))

(declare-fun mapRest!10780 () (Array (_ BitVec 32) ValueCell!2837))

(declare-fun mapValue!10780 () ValueCell!2837)

(declare-fun mapKey!10780 () (_ BitVec 32))

(assert (=> mapNonEmpty!10780 (= (arr!5697 (_values!4467 thiss!1504)) (store mapRest!10780 mapKey!10780 mapValue!10780))))

(declare-fun res!118479 () Bool)

(assert (=> start!23088 (=> (not res!118479) (not e!156941))))

(declare-fun valid!1409 (LongMapFixedSize!3574) Bool)

(assert (=> start!23088 (= res!118479 (valid!1409 thiss!1504))))

(assert (=> start!23088 e!156941))

(assert (=> start!23088 e!156936))

(assert (=> start!23088 true))

(declare-fun b!241821 () Bool)

(declare-fun res!118483 () Bool)

(assert (=> b!241821 (=> (not res!118483) (not e!156931))))

(assert (=> b!241821 (= res!118483 (= (select (arr!5698 (_keys!6590 thiss!1504)) (index!6410 lt!121397)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22503 () Bool)

(assert (=> bm!22503 (= call!22505 (arrayContainsKey!0 (_keys!6590 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241822 () Bool)

(declare-fun Unit!7449 () Unit!7445)

(assert (=> b!241822 (= e!156929 Unit!7449)))

(declare-fun lt!121396 () Unit!7445)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!356 (array!11999 array!11997 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) Int) Unit!7445)

(assert (=> b!241822 (= lt!121396 (lemmaInListMapThenSeekEntryOrOpenFindsIt!356 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)))))

(assert (=> b!241822 false))

(declare-fun b!241823 () Bool)

(declare-fun res!118482 () Bool)

(assert (=> b!241823 (=> (not res!118482) (not e!156941))))

(assert (=> b!241823 (= res!118482 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!241824 () Bool)

(declare-fun res!118478 () Bool)

(assert (=> b!241824 (= res!118478 (= (select (arr!5698 (_keys!6590 thiss!1504)) (index!6413 lt!121397)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156939 () Bool)

(assert (=> b!241824 (=> (not res!118478) (not e!156939))))

(declare-fun mapIsEmpty!10780 () Bool)

(assert (=> mapIsEmpty!10780 mapRes!10780))

(declare-fun b!241825 () Bool)

(assert (=> b!241825 (= e!156939 (not call!22505))))

(declare-fun b!241826 () Bool)

(assert (=> b!241826 (= e!156937 tp_is_empty!6361)))

(declare-fun b!241827 () Bool)

(declare-fun e!156933 () Bool)

(assert (=> b!241827 (= e!156933 e!156939)))

(declare-fun res!118480 () Bool)

(assert (=> b!241827 (= res!118480 call!22506)))

(assert (=> b!241827 (=> (not res!118480) (not e!156939))))

(declare-fun b!241828 () Bool)

(declare-fun c!40335 () Bool)

(assert (=> b!241828 (= c!40335 ((_ is MissingVacant!1060) lt!121397))))

(assert (=> b!241828 (= e!156928 e!156933)))

(declare-fun b!241829 () Bool)

(assert (=> b!241829 (= e!156934 (and e!156940 mapRes!10780))))

(declare-fun condMapEmpty!10780 () Bool)

(declare-fun mapDefault!10780 () ValueCell!2837)

(assert (=> b!241829 (= condMapEmpty!10780 (= (arr!5697 (_values!4467 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2837)) mapDefault!10780)))))

(declare-fun b!241830 () Bool)

(assert (=> b!241830 (= e!156933 ((_ is Undefined!1060) lt!121397))))

(declare-fun b!241831 () Bool)

(assert (=> b!241831 (= e!156927 e!156930)))

(declare-fun res!118481 () Bool)

(assert (=> b!241831 (=> (not res!118481) (not e!156930))))

(assert (=> b!241831 (= res!118481 (inRange!0 index!297 (mask!10560 thiss!1504)))))

(declare-fun lt!121398 () Unit!7445)

(assert (=> b!241831 (= lt!121398 e!156929)))

(declare-fun c!40334 () Bool)

(declare-datatypes ((tuple2!4720 0))(
  ( (tuple2!4721 (_1!2371 (_ BitVec 64)) (_2!2371 V!8129)) )
))
(declare-datatypes ((List!3617 0))(
  ( (Nil!3614) (Cons!3613 (h!4270 tuple2!4720) (t!8607 List!3617)) )
))
(declare-datatypes ((ListLongMap!3623 0))(
  ( (ListLongMap!3624 (toList!1827 List!3617)) )
))
(declare-fun contains!1720 (ListLongMap!3623 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1336 (array!11999 array!11997 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 32) Int) ListLongMap!3623)

(assert (=> b!241831 (= c!40334 (contains!1720 (getCurrentListMap!1336 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) key!932))))

(declare-fun b!241832 () Bool)

(declare-fun res!118477 () Bool)

(assert (=> b!241832 (=> (not res!118477) (not e!156931))))

(assert (=> b!241832 (= res!118477 call!22506)))

(assert (=> b!241832 (= e!156928 e!156931)))

(assert (= (and start!23088 res!118479) b!241823))

(assert (= (and b!241823 res!118482) b!241816))

(assert (= (and b!241816 res!118475) b!241831))

(assert (= (and b!241831 c!40334) b!241822))

(assert (= (and b!241831 (not c!40334)) b!241815))

(assert (= (and b!241815 c!40333) b!241832))

(assert (= (and b!241815 (not c!40333)) b!241828))

(assert (= (and b!241832 res!118477) b!241821))

(assert (= (and b!241821 res!118483) b!241813))

(assert (= (and b!241828 c!40335) b!241827))

(assert (= (and b!241828 (not c!40335)) b!241830))

(assert (= (and b!241827 res!118480) b!241824))

(assert (= (and b!241824 res!118478) b!241825))

(assert (= (or b!241832 b!241827) bm!22502))

(assert (= (or b!241813 b!241825) bm!22503))

(assert (= (and b!241831 res!118481) b!241819))

(assert (= (and b!241819 c!40336) b!241818))

(assert (= (and b!241819 (not c!40336)) b!241812))

(assert (= (and b!241819 res!118476) b!241814))

(assert (= (and b!241829 condMapEmpty!10780) mapIsEmpty!10780))

(assert (= (and b!241829 (not condMapEmpty!10780)) mapNonEmpty!10780))

(assert (= (and mapNonEmpty!10780 ((_ is ValueCellFull!2837) mapValue!10780)) b!241826))

(assert (= (and b!241829 ((_ is ValueCellFull!2837) mapDefault!10780)) b!241820))

(assert (= b!241817 b!241829))

(assert (= start!23088 b!241817))

(declare-fun m!260361 () Bool)

(assert (=> b!241816 m!260361))

(declare-fun m!260363 () Bool)

(assert (=> b!241824 m!260363))

(declare-fun m!260365 () Bool)

(assert (=> b!241831 m!260365))

(declare-fun m!260367 () Bool)

(assert (=> b!241831 m!260367))

(assert (=> b!241831 m!260367))

(declare-fun m!260369 () Bool)

(assert (=> b!241831 m!260369))

(declare-fun m!260371 () Bool)

(assert (=> bm!22503 m!260371))

(declare-fun m!260373 () Bool)

(assert (=> b!241815 m!260373))

(assert (=> b!241819 m!260371))

(declare-fun m!260375 () Bool)

(assert (=> b!241818 m!260375))

(declare-fun m!260377 () Bool)

(assert (=> b!241814 m!260377))

(declare-fun m!260379 () Bool)

(assert (=> b!241817 m!260379))

(declare-fun m!260381 () Bool)

(assert (=> b!241817 m!260381))

(declare-fun m!260383 () Bool)

(assert (=> start!23088 m!260383))

(declare-fun m!260385 () Bool)

(assert (=> bm!22502 m!260385))

(declare-fun m!260387 () Bool)

(assert (=> b!241822 m!260387))

(declare-fun m!260389 () Bool)

(assert (=> b!241821 m!260389))

(declare-fun m!260391 () Bool)

(assert (=> mapNonEmpty!10780 m!260391))

(check-sat (not b_next!6499) (not b!241831) (not b!241822) (not start!23088) (not b!241814) (not b!241815) b_and!13447 (not mapNonEmpty!10780) (not b!241817) (not b!241818) (not b!241819) (not bm!22502) tp_is_empty!6361 (not b!241816) (not bm!22503))
(check-sat b_and!13447 (not b_next!6499))
(get-model)

(declare-fun lt!121441 () SeekEntryResult!1060)

(declare-fun c!40366 () Bool)

(declare-fun call!22524 () Bool)

(declare-fun bm!22520 () Bool)

(assert (=> bm!22520 (= call!22524 (inRange!0 (ite c!40366 (index!6410 lt!121441) (index!6413 lt!121441)) (mask!10560 thiss!1504)))))

(declare-fun b!241975 () Bool)

(declare-fun e!157043 () Bool)

(declare-fun e!157042 () Bool)

(assert (=> b!241975 (= e!157043 e!157042)))

(declare-fun c!40365 () Bool)

(assert (=> b!241975 (= c!40365 ((_ is MissingVacant!1060) lt!121441))))

(declare-fun b!241976 () Bool)

(declare-fun res!118547 () Bool)

(declare-fun e!157040 () Bool)

(assert (=> b!241976 (=> (not res!118547) (not e!157040))))

(assert (=> b!241976 (= res!118547 call!22524)))

(assert (=> b!241976 (= e!157042 e!157040)))

(declare-fun bm!22521 () Bool)

(declare-fun call!22523 () Bool)

(assert (=> bm!22521 (= call!22523 (arrayContainsKey!0 (_keys!6590 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241977 () Bool)

(assert (=> b!241977 (= e!157042 ((_ is Undefined!1060) lt!121441))))

(declare-fun d!59791 () Bool)

(assert (=> d!59791 e!157043))

(assert (=> d!59791 (= c!40366 ((_ is MissingZero!1060) lt!121441))))

(assert (=> d!59791 (= lt!121441 (seekEntryOrOpen!0 key!932 (_keys!6590 thiss!1504) (mask!10560 thiss!1504)))))

(declare-fun lt!121440 () Unit!7445)

(declare-fun choose!1132 (array!11999 array!11997 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) Int) Unit!7445)

(assert (=> d!59791 (= lt!121440 (choose!1132 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59791 (validMask!0 (mask!10560 thiss!1504))))

(assert (=> d!59791 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!357 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)) lt!121440)))

(declare-fun b!241978 () Bool)

(declare-fun e!157041 () Bool)

(assert (=> b!241978 (= e!157043 e!157041)))

(declare-fun res!118546 () Bool)

(assert (=> b!241978 (= res!118546 call!22524)))

(assert (=> b!241978 (=> (not res!118546) (not e!157041))))

(declare-fun b!241979 () Bool)

(assert (=> b!241979 (= e!157040 (not call!22523))))

(declare-fun b!241980 () Bool)

(assert (=> b!241980 (and (bvsge (index!6410 lt!121441) #b00000000000000000000000000000000) (bvslt (index!6410 lt!121441) (size!6041 (_keys!6590 thiss!1504))))))

(declare-fun res!118549 () Bool)

(assert (=> b!241980 (= res!118549 (= (select (arr!5698 (_keys!6590 thiss!1504)) (index!6410 lt!121441)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241980 (=> (not res!118549) (not e!157041))))

(declare-fun b!241981 () Bool)

(declare-fun res!118548 () Bool)

(assert (=> b!241981 (=> (not res!118548) (not e!157040))))

(assert (=> b!241981 (= res!118548 (= (select (arr!5698 (_keys!6590 thiss!1504)) (index!6413 lt!121441)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241981 (and (bvsge (index!6413 lt!121441) #b00000000000000000000000000000000) (bvslt (index!6413 lt!121441) (size!6041 (_keys!6590 thiss!1504))))))

(declare-fun b!241982 () Bool)

(assert (=> b!241982 (= e!157041 (not call!22523))))

(assert (= (and d!59791 c!40366) b!241978))

(assert (= (and d!59791 (not c!40366)) b!241975))

(assert (= (and b!241978 res!118546) b!241980))

(assert (= (and b!241980 res!118549) b!241982))

(assert (= (and b!241975 c!40365) b!241976))

(assert (= (and b!241975 (not c!40365)) b!241977))

(assert (= (and b!241976 res!118547) b!241981))

(assert (= (and b!241981 res!118548) b!241979))

(assert (= (or b!241978 b!241976) bm!22520))

(assert (= (or b!241982 b!241979) bm!22521))

(assert (=> d!59791 m!260361))

(declare-fun m!260457 () Bool)

(assert (=> d!59791 m!260457))

(declare-fun m!260459 () Bool)

(assert (=> d!59791 m!260459))

(declare-fun m!260461 () Bool)

(assert (=> b!241980 m!260461))

(assert (=> bm!22521 m!260371))

(declare-fun m!260463 () Bool)

(assert (=> b!241981 m!260463))

(declare-fun m!260465 () Bool)

(assert (=> bm!22520 m!260465))

(assert (=> b!241815 d!59791))

(declare-fun b!241995 () Bool)

(declare-fun c!40374 () Bool)

(declare-fun lt!121449 () (_ BitVec 64))

(assert (=> b!241995 (= c!40374 (= lt!121449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157050 () SeekEntryResult!1060)

(declare-fun e!157052 () SeekEntryResult!1060)

(assert (=> b!241995 (= e!157050 e!157052)))

(declare-fun b!241996 () Bool)

(declare-fun lt!121450 () SeekEntryResult!1060)

(assert (=> b!241996 (= e!157050 (Found!1060 (index!6412 lt!121450)))))

(declare-fun b!241997 () Bool)

(declare-fun e!157051 () SeekEntryResult!1060)

(assert (=> b!241997 (= e!157051 Undefined!1060)))

(declare-fun b!241998 () Bool)

(assert (=> b!241998 (= e!157052 (MissingZero!1060 (index!6412 lt!121450)))))

(declare-fun d!59793 () Bool)

(declare-fun lt!121448 () SeekEntryResult!1060)

(assert (=> d!59793 (and (or ((_ is Undefined!1060) lt!121448) (not ((_ is Found!1060) lt!121448)) (and (bvsge (index!6411 lt!121448) #b00000000000000000000000000000000) (bvslt (index!6411 lt!121448) (size!6041 (_keys!6590 thiss!1504))))) (or ((_ is Undefined!1060) lt!121448) ((_ is Found!1060) lt!121448) (not ((_ is MissingZero!1060) lt!121448)) (and (bvsge (index!6410 lt!121448) #b00000000000000000000000000000000) (bvslt (index!6410 lt!121448) (size!6041 (_keys!6590 thiss!1504))))) (or ((_ is Undefined!1060) lt!121448) ((_ is Found!1060) lt!121448) ((_ is MissingZero!1060) lt!121448) (not ((_ is MissingVacant!1060) lt!121448)) (and (bvsge (index!6413 lt!121448) #b00000000000000000000000000000000) (bvslt (index!6413 lt!121448) (size!6041 (_keys!6590 thiss!1504))))) (or ((_ is Undefined!1060) lt!121448) (ite ((_ is Found!1060) lt!121448) (= (select (arr!5698 (_keys!6590 thiss!1504)) (index!6411 lt!121448)) key!932) (ite ((_ is MissingZero!1060) lt!121448) (= (select (arr!5698 (_keys!6590 thiss!1504)) (index!6410 lt!121448)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1060) lt!121448) (= (select (arr!5698 (_keys!6590 thiss!1504)) (index!6413 lt!121448)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59793 (= lt!121448 e!157051)))

(declare-fun c!40373 () Bool)

(assert (=> d!59793 (= c!40373 (and ((_ is Intermediate!1060) lt!121450) (undefined!1872 lt!121450)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11999 (_ BitVec 32)) SeekEntryResult!1060)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59793 (= lt!121450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10560 thiss!1504)) key!932 (_keys!6590 thiss!1504) (mask!10560 thiss!1504)))))

(assert (=> d!59793 (validMask!0 (mask!10560 thiss!1504))))

(assert (=> d!59793 (= (seekEntryOrOpen!0 key!932 (_keys!6590 thiss!1504) (mask!10560 thiss!1504)) lt!121448)))

(declare-fun b!241999 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11999 (_ BitVec 32)) SeekEntryResult!1060)

(assert (=> b!241999 (= e!157052 (seekKeyOrZeroReturnVacant!0 (x!24247 lt!121450) (index!6412 lt!121450) (index!6412 lt!121450) key!932 (_keys!6590 thiss!1504) (mask!10560 thiss!1504)))))

(declare-fun b!242000 () Bool)

(assert (=> b!242000 (= e!157051 e!157050)))

(assert (=> b!242000 (= lt!121449 (select (arr!5698 (_keys!6590 thiss!1504)) (index!6412 lt!121450)))))

(declare-fun c!40375 () Bool)

(assert (=> b!242000 (= c!40375 (= lt!121449 key!932))))

(assert (= (and d!59793 c!40373) b!241997))

(assert (= (and d!59793 (not c!40373)) b!242000))

(assert (= (and b!242000 c!40375) b!241996))

(assert (= (and b!242000 (not c!40375)) b!241995))

(assert (= (and b!241995 c!40374) b!241998))

(assert (= (and b!241995 (not c!40374)) b!241999))

(declare-fun m!260467 () Bool)

(assert (=> d!59793 m!260467))

(declare-fun m!260469 () Bool)

(assert (=> d!59793 m!260469))

(declare-fun m!260471 () Bool)

(assert (=> d!59793 m!260471))

(declare-fun m!260473 () Bool)

(assert (=> d!59793 m!260473))

(assert (=> d!59793 m!260471))

(assert (=> d!59793 m!260459))

(declare-fun m!260475 () Bool)

(assert (=> d!59793 m!260475))

(declare-fun m!260477 () Bool)

(assert (=> b!241999 m!260477))

(declare-fun m!260479 () Bool)

(assert (=> b!242000 m!260479))

(assert (=> b!241816 d!59793))

(declare-fun d!59795 () Bool)

(declare-fun res!118554 () Bool)

(declare-fun e!157057 () Bool)

(assert (=> d!59795 (=> res!118554 e!157057)))

(assert (=> d!59795 (= res!118554 (= (select (arr!5698 (_keys!6590 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59795 (= (arrayContainsKey!0 (_keys!6590 thiss!1504) key!932 #b00000000000000000000000000000000) e!157057)))

(declare-fun b!242005 () Bool)

(declare-fun e!157058 () Bool)

(assert (=> b!242005 (= e!157057 e!157058)))

(declare-fun res!118555 () Bool)

(assert (=> b!242005 (=> (not res!118555) (not e!157058))))

(assert (=> b!242005 (= res!118555 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6041 (_keys!6590 thiss!1504))))))

(declare-fun b!242006 () Bool)

(assert (=> b!242006 (= e!157058 (arrayContainsKey!0 (_keys!6590 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59795 (not res!118554)) b!242005))

(assert (= (and b!242005 res!118555) b!242006))

(declare-fun m!260481 () Bool)

(assert (=> d!59795 m!260481))

(declare-fun m!260483 () Bool)

(assert (=> b!242006 m!260483))

(assert (=> bm!22503 d!59795))

(declare-fun d!59797 () Bool)

(assert (=> d!59797 (= (inRange!0 index!297 (mask!10560 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10560 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!241831 d!59797))

(declare-fun d!59799 () Bool)

(declare-fun e!157063 () Bool)

(assert (=> d!59799 e!157063))

(declare-fun res!118558 () Bool)

(assert (=> d!59799 (=> res!118558 e!157063)))

(declare-fun lt!121461 () Bool)

(assert (=> d!59799 (= res!118558 (not lt!121461))))

(declare-fun lt!121459 () Bool)

(assert (=> d!59799 (= lt!121461 lt!121459)))

(declare-fun lt!121460 () Unit!7445)

(declare-fun e!157064 () Unit!7445)

(assert (=> d!59799 (= lt!121460 e!157064)))

(declare-fun c!40378 () Bool)

(assert (=> d!59799 (= c!40378 lt!121459)))

(declare-fun containsKey!271 (List!3617 (_ BitVec 64)) Bool)

(assert (=> d!59799 (= lt!121459 (containsKey!271 (toList!1827 (getCurrentListMap!1336 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504))) key!932))))

(assert (=> d!59799 (= (contains!1720 (getCurrentListMap!1336 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) key!932) lt!121461)))

(declare-fun b!242013 () Bool)

(declare-fun lt!121462 () Unit!7445)

(assert (=> b!242013 (= e!157064 lt!121462)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!220 (List!3617 (_ BitVec 64)) Unit!7445)

(assert (=> b!242013 (= lt!121462 (lemmaContainsKeyImpliesGetValueByKeyDefined!220 (toList!1827 (getCurrentListMap!1336 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504))) key!932))))

(declare-datatypes ((Option!285 0))(
  ( (Some!284 (v!5262 V!8129)) (None!283) )
))
(declare-fun isDefined!221 (Option!285) Bool)

(declare-fun getValueByKey!279 (List!3617 (_ BitVec 64)) Option!285)

(assert (=> b!242013 (isDefined!221 (getValueByKey!279 (toList!1827 (getCurrentListMap!1336 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504))) key!932))))

(declare-fun b!242014 () Bool)

(declare-fun Unit!7458 () Unit!7445)

(assert (=> b!242014 (= e!157064 Unit!7458)))

(declare-fun b!242015 () Bool)

(assert (=> b!242015 (= e!157063 (isDefined!221 (getValueByKey!279 (toList!1827 (getCurrentListMap!1336 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504))) key!932)))))

(assert (= (and d!59799 c!40378) b!242013))

(assert (= (and d!59799 (not c!40378)) b!242014))

(assert (= (and d!59799 (not res!118558)) b!242015))

(declare-fun m!260485 () Bool)

(assert (=> d!59799 m!260485))

(declare-fun m!260487 () Bool)

(assert (=> b!242013 m!260487))

(declare-fun m!260489 () Bool)

(assert (=> b!242013 m!260489))

(assert (=> b!242013 m!260489))

(declare-fun m!260491 () Bool)

(assert (=> b!242013 m!260491))

(assert (=> b!242015 m!260489))

(assert (=> b!242015 m!260489))

(assert (=> b!242015 m!260491))

(assert (=> b!241831 d!59799))

(declare-fun b!242058 () Bool)

(declare-fun e!157095 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!242058 (= e!157095 (validKeyInArray!0 (select (arr!5698 (_keys!6590 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59801 () Bool)

(declare-fun e!157091 () Bool)

(assert (=> d!59801 e!157091))

(declare-fun res!118578 () Bool)

(assert (=> d!59801 (=> (not res!118578) (not e!157091))))

(assert (=> d!59801 (= res!118578 (or (bvsge #b00000000000000000000000000000000 (size!6041 (_keys!6590 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6590 thiss!1504))))))))

(declare-fun lt!121515 () ListLongMap!3623)

(declare-fun lt!121507 () ListLongMap!3623)

(assert (=> d!59801 (= lt!121515 lt!121507)))

(declare-fun lt!121518 () Unit!7445)

(declare-fun e!157097 () Unit!7445)

(assert (=> d!59801 (= lt!121518 e!157097)))

(declare-fun c!40392 () Bool)

(assert (=> d!59801 (= c!40392 e!157095)))

(declare-fun res!118579 () Bool)

(assert (=> d!59801 (=> (not res!118579) (not e!157095))))

(assert (=> d!59801 (= res!118579 (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6590 thiss!1504))))))

(declare-fun e!157103 () ListLongMap!3623)

(assert (=> d!59801 (= lt!121507 e!157103)))

(declare-fun c!40395 () Bool)

(assert (=> d!59801 (= c!40395 (and (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59801 (validMask!0 (mask!10560 thiss!1504))))

(assert (=> d!59801 (= (getCurrentListMap!1336 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) lt!121515)))

(declare-fun bm!22536 () Bool)

(declare-fun call!22545 () ListLongMap!3623)

(declare-fun getCurrentListMapNoExtraKeys!539 (array!11999 array!11997 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 32) Int) ListLongMap!3623)

(assert (=> bm!22536 (= call!22545 (getCurrentListMapNoExtraKeys!539 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(declare-fun b!242059 () Bool)

(declare-fun e!157102 () Bool)

(declare-fun call!22543 () Bool)

(assert (=> b!242059 (= e!157102 (not call!22543))))

(declare-fun b!242060 () Bool)

(declare-fun e!157101 () ListLongMap!3623)

(declare-fun call!22539 () ListLongMap!3623)

(assert (=> b!242060 (= e!157101 call!22539)))

(declare-fun b!242061 () Bool)

(declare-fun res!118585 () Bool)

(assert (=> b!242061 (=> (not res!118585) (not e!157091))))

(declare-fun e!157098 () Bool)

(assert (=> b!242061 (= res!118585 e!157098)))

(declare-fun res!118582 () Bool)

(assert (=> b!242061 (=> res!118582 e!157098)))

(declare-fun e!157096 () Bool)

(assert (=> b!242061 (= res!118582 (not e!157096))))

(declare-fun res!118584 () Bool)

(assert (=> b!242061 (=> (not res!118584) (not e!157096))))

(assert (=> b!242061 (= res!118584 (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6590 thiss!1504))))))

(declare-fun bm!22537 () Bool)

(declare-fun call!22544 () ListLongMap!3623)

(assert (=> bm!22537 (= call!22539 call!22544)))

(declare-fun b!242062 () Bool)

(declare-fun lt!121524 () Unit!7445)

(assert (=> b!242062 (= e!157097 lt!121524)))

(declare-fun lt!121526 () ListLongMap!3623)

(assert (=> b!242062 (= lt!121526 (getCurrentListMapNoExtraKeys!539 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(declare-fun lt!121527 () (_ BitVec 64))

(assert (=> b!242062 (= lt!121527 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121514 () (_ BitVec 64))

(assert (=> b!242062 (= lt!121514 (select (arr!5698 (_keys!6590 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121528 () Unit!7445)

(declare-fun addStillContains!199 (ListLongMap!3623 (_ BitVec 64) V!8129 (_ BitVec 64)) Unit!7445)

(assert (=> b!242062 (= lt!121528 (addStillContains!199 lt!121526 lt!121527 (zeroValue!4325 thiss!1504) lt!121514))))

(declare-fun +!656 (ListLongMap!3623 tuple2!4720) ListLongMap!3623)

(assert (=> b!242062 (contains!1720 (+!656 lt!121526 (tuple2!4721 lt!121527 (zeroValue!4325 thiss!1504))) lt!121514)))

(declare-fun lt!121517 () Unit!7445)

(assert (=> b!242062 (= lt!121517 lt!121528)))

(declare-fun lt!121521 () ListLongMap!3623)

(assert (=> b!242062 (= lt!121521 (getCurrentListMapNoExtraKeys!539 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(declare-fun lt!121525 () (_ BitVec 64))

(assert (=> b!242062 (= lt!121525 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121520 () (_ BitVec 64))

(assert (=> b!242062 (= lt!121520 (select (arr!5698 (_keys!6590 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121522 () Unit!7445)

(declare-fun addApplyDifferent!199 (ListLongMap!3623 (_ BitVec 64) V!8129 (_ BitVec 64)) Unit!7445)

(assert (=> b!242062 (= lt!121522 (addApplyDifferent!199 lt!121521 lt!121525 (minValue!4325 thiss!1504) lt!121520))))

(declare-fun apply!223 (ListLongMap!3623 (_ BitVec 64)) V!8129)

(assert (=> b!242062 (= (apply!223 (+!656 lt!121521 (tuple2!4721 lt!121525 (minValue!4325 thiss!1504))) lt!121520) (apply!223 lt!121521 lt!121520))))

(declare-fun lt!121508 () Unit!7445)

(assert (=> b!242062 (= lt!121508 lt!121522)))

(declare-fun lt!121512 () ListLongMap!3623)

(assert (=> b!242062 (= lt!121512 (getCurrentListMapNoExtraKeys!539 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(declare-fun lt!121510 () (_ BitVec 64))

(assert (=> b!242062 (= lt!121510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121516 () (_ BitVec 64))

(assert (=> b!242062 (= lt!121516 (select (arr!5698 (_keys!6590 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121511 () Unit!7445)

(assert (=> b!242062 (= lt!121511 (addApplyDifferent!199 lt!121512 lt!121510 (zeroValue!4325 thiss!1504) lt!121516))))

(assert (=> b!242062 (= (apply!223 (+!656 lt!121512 (tuple2!4721 lt!121510 (zeroValue!4325 thiss!1504))) lt!121516) (apply!223 lt!121512 lt!121516))))

(declare-fun lt!121509 () Unit!7445)

(assert (=> b!242062 (= lt!121509 lt!121511)))

(declare-fun lt!121523 () ListLongMap!3623)

(assert (=> b!242062 (= lt!121523 (getCurrentListMapNoExtraKeys!539 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(declare-fun lt!121519 () (_ BitVec 64))

(assert (=> b!242062 (= lt!121519 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121513 () (_ BitVec 64))

(assert (=> b!242062 (= lt!121513 (select (arr!5698 (_keys!6590 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242062 (= lt!121524 (addApplyDifferent!199 lt!121523 lt!121519 (minValue!4325 thiss!1504) lt!121513))))

(assert (=> b!242062 (= (apply!223 (+!656 lt!121523 (tuple2!4721 lt!121519 (minValue!4325 thiss!1504))) lt!121513) (apply!223 lt!121523 lt!121513))))

(declare-fun b!242063 () Bool)

(declare-fun e!157099 () Bool)

(assert (=> b!242063 (= e!157098 e!157099)))

(declare-fun res!118581 () Bool)

(assert (=> b!242063 (=> (not res!118581) (not e!157099))))

(assert (=> b!242063 (= res!118581 (contains!1720 lt!121515 (select (arr!5698 (_keys!6590 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!242063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6590 thiss!1504))))))

(declare-fun b!242064 () Bool)

(declare-fun res!118583 () Bool)

(assert (=> b!242064 (=> (not res!118583) (not e!157091))))

(declare-fun e!157100 () Bool)

(assert (=> b!242064 (= res!118583 e!157100)))

(declare-fun c!40391 () Bool)

(assert (=> b!242064 (= c!40391 (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22538 () Bool)

(declare-fun call!22541 () ListLongMap!3623)

(assert (=> bm!22538 (= call!22541 call!22545)))

(declare-fun b!242065 () Bool)

(declare-fun e!157092 () Bool)

(assert (=> b!242065 (= e!157092 (= (apply!223 lt!121515 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4325 thiss!1504)))))

(declare-fun b!242066 () Bool)

(declare-fun call!22540 () ListLongMap!3623)

(assert (=> b!242066 (= e!157101 call!22540)))

(declare-fun b!242067 () Bool)

(declare-fun e!157094 () Bool)

(assert (=> b!242067 (= e!157102 e!157094)))

(declare-fun res!118577 () Bool)

(assert (=> b!242067 (= res!118577 call!22543)))

(assert (=> b!242067 (=> (not res!118577) (not e!157094))))

(declare-fun b!242068 () Bool)

(declare-fun e!157093 () ListLongMap!3623)

(assert (=> b!242068 (= e!157093 call!22539)))

(declare-fun bm!22539 () Bool)

(assert (=> bm!22539 (= call!22540 call!22541)))

(declare-fun b!242069 () Bool)

(assert (=> b!242069 (= e!157094 (= (apply!223 lt!121515 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4325 thiss!1504)))))

(declare-fun b!242070 () Bool)

(declare-fun get!2923 (ValueCell!2837 V!8129) V!8129)

(declare-fun dynLambda!557 (Int (_ BitVec 64)) V!8129)

(assert (=> b!242070 (= e!157099 (= (apply!223 lt!121515 (select (arr!5698 (_keys!6590 thiss!1504)) #b00000000000000000000000000000000)) (get!2923 (select (arr!5697 (_values!4467 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4484 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!242070 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6040 (_values!4467 thiss!1504))))))

(assert (=> b!242070 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6041 (_keys!6590 thiss!1504))))))

(declare-fun bm!22540 () Bool)

(assert (=> bm!22540 (= call!22543 (contains!1720 lt!121515 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242071 () Bool)

(declare-fun call!22542 () Bool)

(assert (=> b!242071 (= e!157100 (not call!22542))))

(declare-fun b!242072 () Bool)

(assert (=> b!242072 (= e!157091 e!157102)))

(declare-fun c!40393 () Bool)

(assert (=> b!242072 (= c!40393 (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!242073 () Bool)

(assert (=> b!242073 (= e!157103 (+!656 call!22544 (tuple2!4721 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4325 thiss!1504))))))

(declare-fun b!242074 () Bool)

(assert (=> b!242074 (= e!157100 e!157092)))

(declare-fun res!118580 () Bool)

(assert (=> b!242074 (= res!118580 call!22542)))

(assert (=> b!242074 (=> (not res!118580) (not e!157092))))

(declare-fun b!242075 () Bool)

(assert (=> b!242075 (= e!157103 e!157093)))

(declare-fun c!40396 () Bool)

(assert (=> b!242075 (= c!40396 (and (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22541 () Bool)

(assert (=> bm!22541 (= call!22544 (+!656 (ite c!40395 call!22545 (ite c!40396 call!22541 call!22540)) (ite (or c!40395 c!40396) (tuple2!4721 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4325 thiss!1504)) (tuple2!4721 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4325 thiss!1504)))))))

(declare-fun b!242076 () Bool)

(declare-fun c!40394 () Bool)

(assert (=> b!242076 (= c!40394 (and (not (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4221 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!242076 (= e!157093 e!157101)))

(declare-fun bm!22542 () Bool)

(assert (=> bm!22542 (= call!22542 (contains!1720 lt!121515 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242077 () Bool)

(declare-fun Unit!7459 () Unit!7445)

(assert (=> b!242077 (= e!157097 Unit!7459)))

(declare-fun b!242078 () Bool)

(assert (=> b!242078 (= e!157096 (validKeyInArray!0 (select (arr!5698 (_keys!6590 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59801 c!40395) b!242073))

(assert (= (and d!59801 (not c!40395)) b!242075))

(assert (= (and b!242075 c!40396) b!242068))

(assert (= (and b!242075 (not c!40396)) b!242076))

(assert (= (and b!242076 c!40394) b!242060))

(assert (= (and b!242076 (not c!40394)) b!242066))

(assert (= (or b!242060 b!242066) bm!22539))

(assert (= (or b!242068 bm!22539) bm!22538))

(assert (= (or b!242068 b!242060) bm!22537))

(assert (= (or b!242073 bm!22538) bm!22536))

(assert (= (or b!242073 bm!22537) bm!22541))

(assert (= (and d!59801 res!118579) b!242058))

(assert (= (and d!59801 c!40392) b!242062))

(assert (= (and d!59801 (not c!40392)) b!242077))

(assert (= (and d!59801 res!118578) b!242061))

(assert (= (and b!242061 res!118584) b!242078))

(assert (= (and b!242061 (not res!118582)) b!242063))

(assert (= (and b!242063 res!118581) b!242070))

(assert (= (and b!242061 res!118585) b!242064))

(assert (= (and b!242064 c!40391) b!242074))

(assert (= (and b!242064 (not c!40391)) b!242071))

(assert (= (and b!242074 res!118580) b!242065))

(assert (= (or b!242074 b!242071) bm!22542))

(assert (= (and b!242064 res!118583) b!242072))

(assert (= (and b!242072 c!40393) b!242067))

(assert (= (and b!242072 (not c!40393)) b!242059))

(assert (= (and b!242067 res!118577) b!242069))

(assert (= (or b!242067 b!242059) bm!22540))

(declare-fun b_lambda!7977 () Bool)

(assert (=> (not b_lambda!7977) (not b!242070)))

(declare-fun t!8611 () Bool)

(declare-fun tb!2951 () Bool)

(assert (=> (and b!241817 (= (defaultEntry!4484 thiss!1504) (defaultEntry!4484 thiss!1504)) t!8611) tb!2951))

(declare-fun result!5191 () Bool)

(assert (=> tb!2951 (= result!5191 tp_is_empty!6361)))

(assert (=> b!242070 t!8611))

(declare-fun b_and!13453 () Bool)

(assert (= b_and!13447 (and (=> t!8611 result!5191) b_and!13453)))

(declare-fun m!260493 () Bool)

(assert (=> bm!22541 m!260493))

(declare-fun m!260495 () Bool)

(assert (=> b!242073 m!260495))

(declare-fun m!260497 () Bool)

(assert (=> b!242065 m!260497))

(declare-fun m!260499 () Bool)

(assert (=> bm!22540 m!260499))

(declare-fun m!260501 () Bool)

(assert (=> bm!22536 m!260501))

(declare-fun m!260503 () Bool)

(assert (=> b!242069 m!260503))

(assert (=> b!242078 m!260481))

(assert (=> b!242078 m!260481))

(declare-fun m!260505 () Bool)

(assert (=> b!242078 m!260505))

(declare-fun m!260507 () Bool)

(assert (=> b!242070 m!260507))

(assert (=> b!242070 m!260481))

(declare-fun m!260509 () Bool)

(assert (=> b!242070 m!260509))

(declare-fun m!260511 () Bool)

(assert (=> b!242070 m!260511))

(assert (=> b!242070 m!260511))

(assert (=> b!242070 m!260507))

(declare-fun m!260513 () Bool)

(assert (=> b!242070 m!260513))

(assert (=> b!242070 m!260481))

(declare-fun m!260515 () Bool)

(assert (=> bm!22542 m!260515))

(assert (=> d!59801 m!260459))

(declare-fun m!260517 () Bool)

(assert (=> b!242062 m!260517))

(declare-fun m!260519 () Bool)

(assert (=> b!242062 m!260519))

(declare-fun m!260521 () Bool)

(assert (=> b!242062 m!260521))

(declare-fun m!260523 () Bool)

(assert (=> b!242062 m!260523))

(declare-fun m!260525 () Bool)

(assert (=> b!242062 m!260525))

(assert (=> b!242062 m!260525))

(declare-fun m!260527 () Bool)

(assert (=> b!242062 m!260527))

(declare-fun m!260529 () Bool)

(assert (=> b!242062 m!260529))

(declare-fun m!260531 () Bool)

(assert (=> b!242062 m!260531))

(declare-fun m!260533 () Bool)

(assert (=> b!242062 m!260533))

(assert (=> b!242062 m!260523))

(declare-fun m!260535 () Bool)

(assert (=> b!242062 m!260535))

(declare-fun m!260537 () Bool)

(assert (=> b!242062 m!260537))

(assert (=> b!242062 m!260517))

(declare-fun m!260539 () Bool)

(assert (=> b!242062 m!260539))

(declare-fun m!260541 () Bool)

(assert (=> b!242062 m!260541))

(assert (=> b!242062 m!260501))

(assert (=> b!242062 m!260531))

(assert (=> b!242062 m!260481))

(declare-fun m!260543 () Bool)

(assert (=> b!242062 m!260543))

(declare-fun m!260545 () Bool)

(assert (=> b!242062 m!260545))

(assert (=> b!242063 m!260481))

(assert (=> b!242063 m!260481))

(declare-fun m!260547 () Bool)

(assert (=> b!242063 m!260547))

(assert (=> b!242058 m!260481))

(assert (=> b!242058 m!260481))

(assert (=> b!242058 m!260505))

(assert (=> b!241831 d!59801))

(declare-fun d!59803 () Bool)

(assert (=> d!59803 (contains!1720 (getCurrentListMap!1336 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) key!932)))

(declare-fun lt!121531 () Unit!7445)

(declare-fun choose!1133 (array!11999 array!11997 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) (_ BitVec 32) Int) Unit!7445)

(assert (=> d!59803 (= lt!121531 (choose!1133 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)))))

(assert (=> d!59803 (validMask!0 (mask!10560 thiss!1504))))

(assert (=> d!59803 (= (lemmaArrayContainsKeyThenInListMap!169 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4484 thiss!1504)) lt!121531)))

(declare-fun bs!8832 () Bool)

(assert (= bs!8832 d!59803))

(assert (=> bs!8832 m!260367))

(assert (=> bs!8832 m!260367))

(assert (=> bs!8832 m!260369))

(declare-fun m!260549 () Bool)

(assert (=> bs!8832 m!260549))

(assert (=> bs!8832 m!260459))

(assert (=> b!241818 d!59803))

(declare-fun d!59805 () Bool)

(declare-fun res!118592 () Bool)

(declare-fun e!157106 () Bool)

(assert (=> d!59805 (=> (not res!118592) (not e!157106))))

(declare-fun simpleValid!246 (LongMapFixedSize!3574) Bool)

(assert (=> d!59805 (= res!118592 (simpleValid!246 thiss!1504))))

(assert (=> d!59805 (= (valid!1409 thiss!1504) e!157106)))

(declare-fun b!242087 () Bool)

(declare-fun res!118593 () Bool)

(assert (=> b!242087 (=> (not res!118593) (not e!157106))))

(declare-fun arrayCountValidKeys!0 (array!11999 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!242087 (= res!118593 (= (arrayCountValidKeys!0 (_keys!6590 thiss!1504) #b00000000000000000000000000000000 (size!6041 (_keys!6590 thiss!1504))) (_size!1836 thiss!1504)))))

(declare-fun b!242088 () Bool)

(declare-fun res!118594 () Bool)

(assert (=> b!242088 (=> (not res!118594) (not e!157106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11999 (_ BitVec 32)) Bool)

(assert (=> b!242088 (= res!118594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6590 thiss!1504) (mask!10560 thiss!1504)))))

(declare-fun b!242089 () Bool)

(declare-fun arrayNoDuplicates!0 (array!11999 (_ BitVec 32) List!3616) Bool)

(assert (=> b!242089 (= e!157106 (arrayNoDuplicates!0 (_keys!6590 thiss!1504) #b00000000000000000000000000000000 Nil!3613))))

(assert (= (and d!59805 res!118592) b!242087))

(assert (= (and b!242087 res!118593) b!242088))

(assert (= (and b!242088 res!118594) b!242089))

(declare-fun m!260551 () Bool)

(assert (=> d!59805 m!260551))

(declare-fun m!260553 () Bool)

(assert (=> b!242087 m!260553))

(declare-fun m!260555 () Bool)

(assert (=> b!242088 m!260555))

(declare-fun m!260557 () Bool)

(assert (=> b!242089 m!260557))

(assert (=> start!23088 d!59805))

(declare-fun d!59807 () Bool)

(assert (=> d!59807 (= (array_inv!3759 (_keys!6590 thiss!1504)) (bvsge (size!6041 (_keys!6590 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241817 d!59807))

(declare-fun d!59809 () Bool)

(assert (=> d!59809 (= (array_inv!3760 (_values!4467 thiss!1504)) (bvsge (size!6040 (_values!4467 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241817 d!59809))

(assert (=> b!241819 d!59795))

(declare-fun d!59811 () Bool)

(declare-fun res!118599 () Bool)

(declare-fun e!157111 () Bool)

(assert (=> d!59811 (=> res!118599 e!157111)))

(assert (=> d!59811 (= res!118599 ((_ is Nil!3613) Nil!3613))))

(assert (=> d!59811 (= (noDuplicate!88 Nil!3613) e!157111)))

(declare-fun b!242094 () Bool)

(declare-fun e!157112 () Bool)

(assert (=> b!242094 (= e!157111 e!157112)))

(declare-fun res!118600 () Bool)

(assert (=> b!242094 (=> (not res!118600) (not e!157112))))

(declare-fun contains!1722 (List!3616 (_ BitVec 64)) Bool)

(assert (=> b!242094 (= res!118600 (not (contains!1722 (t!8606 Nil!3613) (h!4269 Nil!3613))))))

(declare-fun b!242095 () Bool)

(assert (=> b!242095 (= e!157112 (noDuplicate!88 (t!8606 Nil!3613)))))

(assert (= (and d!59811 (not res!118599)) b!242094))

(assert (= (and b!242094 res!118600) b!242095))

(declare-fun m!260559 () Bool)

(assert (=> b!242094 m!260559))

(declare-fun m!260561 () Bool)

(assert (=> b!242095 m!260561))

(assert (=> b!241814 d!59811))

(declare-fun d!59813 () Bool)

(assert (=> d!59813 (= (inRange!0 (ite c!40333 (index!6410 lt!121397) (index!6413 lt!121397)) (mask!10560 thiss!1504)) (and (bvsge (ite c!40333 (index!6410 lt!121397) (index!6413 lt!121397)) #b00000000000000000000000000000000) (bvslt (ite c!40333 (index!6410 lt!121397) (index!6413 lt!121397)) (bvadd (mask!10560 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22502 d!59813))

(declare-fun d!59815 () Bool)

(declare-fun e!157115 () Bool)

(assert (=> d!59815 e!157115))

(declare-fun res!118606 () Bool)

(assert (=> d!59815 (=> (not res!118606) (not e!157115))))

(declare-fun lt!121536 () SeekEntryResult!1060)

(assert (=> d!59815 (= res!118606 ((_ is Found!1060) lt!121536))))

(assert (=> d!59815 (= lt!121536 (seekEntryOrOpen!0 key!932 (_keys!6590 thiss!1504) (mask!10560 thiss!1504)))))

(declare-fun lt!121537 () Unit!7445)

(declare-fun choose!1134 (array!11999 array!11997 (_ BitVec 32) (_ BitVec 32) V!8129 V!8129 (_ BitVec 64) Int) Unit!7445)

(assert (=> d!59815 (= lt!121537 (choose!1134 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)))))

(assert (=> d!59815 (validMask!0 (mask!10560 thiss!1504))))

(assert (=> d!59815 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!356 (_keys!6590 thiss!1504) (_values!4467 thiss!1504) (mask!10560 thiss!1504) (extraKeys!4221 thiss!1504) (zeroValue!4325 thiss!1504) (minValue!4325 thiss!1504) key!932 (defaultEntry!4484 thiss!1504)) lt!121537)))

(declare-fun b!242100 () Bool)

(declare-fun res!118605 () Bool)

(assert (=> b!242100 (=> (not res!118605) (not e!157115))))

(assert (=> b!242100 (= res!118605 (inRange!0 (index!6411 lt!121536) (mask!10560 thiss!1504)))))

(declare-fun b!242101 () Bool)

(assert (=> b!242101 (= e!157115 (= (select (arr!5698 (_keys!6590 thiss!1504)) (index!6411 lt!121536)) key!932))))

(assert (=> b!242101 (and (bvsge (index!6411 lt!121536) #b00000000000000000000000000000000) (bvslt (index!6411 lt!121536) (size!6041 (_keys!6590 thiss!1504))))))

(assert (= (and d!59815 res!118606) b!242100))

(assert (= (and b!242100 res!118605) b!242101))

(assert (=> d!59815 m!260361))

(declare-fun m!260563 () Bool)

(assert (=> d!59815 m!260563))

(assert (=> d!59815 m!260459))

(declare-fun m!260565 () Bool)

(assert (=> b!242100 m!260565))

(declare-fun m!260567 () Bool)

(assert (=> b!242101 m!260567))

(assert (=> b!241822 d!59815))

(declare-fun mapIsEmpty!10789 () Bool)

(declare-fun mapRes!10789 () Bool)

(assert (=> mapIsEmpty!10789 mapRes!10789))

(declare-fun b!242109 () Bool)

(declare-fun e!157120 () Bool)

(assert (=> b!242109 (= e!157120 tp_is_empty!6361)))

(declare-fun mapNonEmpty!10789 () Bool)

(declare-fun tp!22723 () Bool)

(declare-fun e!157121 () Bool)

(assert (=> mapNonEmpty!10789 (= mapRes!10789 (and tp!22723 e!157121))))

(declare-fun mapRest!10789 () (Array (_ BitVec 32) ValueCell!2837))

(declare-fun mapValue!10789 () ValueCell!2837)

(declare-fun mapKey!10789 () (_ BitVec 32))

(assert (=> mapNonEmpty!10789 (= mapRest!10780 (store mapRest!10789 mapKey!10789 mapValue!10789))))

(declare-fun b!242108 () Bool)

(assert (=> b!242108 (= e!157121 tp_is_empty!6361)))

(declare-fun condMapEmpty!10789 () Bool)

(declare-fun mapDefault!10789 () ValueCell!2837)

(assert (=> mapNonEmpty!10780 (= condMapEmpty!10789 (= mapRest!10780 ((as const (Array (_ BitVec 32) ValueCell!2837)) mapDefault!10789)))))

(assert (=> mapNonEmpty!10780 (= tp!22707 (and e!157120 mapRes!10789))))

(assert (= (and mapNonEmpty!10780 condMapEmpty!10789) mapIsEmpty!10789))

(assert (= (and mapNonEmpty!10780 (not condMapEmpty!10789)) mapNonEmpty!10789))

(assert (= (and mapNonEmpty!10789 ((_ is ValueCellFull!2837) mapValue!10789)) b!242108))

(assert (= (and mapNonEmpty!10780 ((_ is ValueCellFull!2837) mapDefault!10789)) b!242109))

(declare-fun m!260569 () Bool)

(assert (=> mapNonEmpty!10789 m!260569))

(declare-fun b_lambda!7979 () Bool)

(assert (= b_lambda!7977 (or (and b!241817 b_free!6499) b_lambda!7979)))

(check-sat (not b!242013) (not d!59799) (not d!59791) (not d!59801) (not b!242065) (not b!242087) tp_is_empty!6361 (not b!242058) (not b!242063) (not b!242069) (not bm!22520) (not b!242088) (not bm!22536) (not d!59815) (not bm!22521) (not b_next!6499) (not b!242094) (not mapNonEmpty!10789) (not b!242062) (not b_lambda!7979) (not d!59803) (not b!242070) (not b!242015) (not b!242078) (not b!242100) (not bm!22542) (not b!242073) (not d!59805) (not b!242095) (not bm!22541) (not d!59793) (not bm!22540) (not b!242006) (not b!241999) (not b!242089) b_and!13453)
(check-sat b_and!13453 (not b_next!6499))
