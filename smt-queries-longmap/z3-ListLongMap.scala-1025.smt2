; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21836 () Bool)

(assert start!21836)

(declare-fun b!219533 () Bool)

(declare-fun b_free!5899 () Bool)

(declare-fun b_next!5899 () Bool)

(assert (=> b!219533 (= b_free!5899 (not b_next!5899))))

(declare-fun tp!20838 () Bool)

(declare-fun b_and!12771 () Bool)

(assert (=> b!219533 (= tp!20838 b_and!12771)))

(declare-fun b!219517 () Bool)

(declare-fun res!107576 () Bool)

(declare-fun e!142776 () Bool)

(assert (=> b!219517 (=> (not res!107576) (not e!142776))))

(declare-datatypes ((V!7329 0))(
  ( (V!7330 (val!2925 Int)) )
))
(declare-datatypes ((ValueCell!2537 0))(
  ( (ValueCellFull!2537 (v!4939 V!7329)) (EmptyCell!2537) )
))
(declare-datatypes ((array!10757 0))(
  ( (array!10758 (arr!5097 (Array (_ BitVec 32) ValueCell!2537)) (size!5431 (_ BitVec 32))) )
))
(declare-datatypes ((array!10759 0))(
  ( (array!10760 (arr!5098 (Array (_ BitVec 32) (_ BitVec 64))) (size!5432 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2974 0))(
  ( (LongMapFixedSize!2975 (defaultEntry!4146 Int) (mask!9939 (_ BitVec 32)) (extraKeys!3883 (_ BitVec 32)) (zeroValue!3987 V!7329) (minValue!3987 V!7329) (_size!1536 (_ BitVec 32)) (_keys!6199 array!10759) (_values!4129 array!10757) (_vacant!1536 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2974)

(declare-datatypes ((SeekEntryResult!795 0))(
  ( (MissingZero!795 (index!5350 (_ BitVec 32))) (Found!795 (index!5351 (_ BitVec 32))) (Intermediate!795 (undefined!1607 Bool) (index!5352 (_ BitVec 32)) (x!22910 (_ BitVec 32))) (Undefined!795) (MissingVacant!795 (index!5353 (_ BitVec 32))) )
))
(declare-fun lt!111823 () SeekEntryResult!795)

(assert (=> b!219517 (= res!107576 (= (select (arr!5098 (_keys!6199 thiss!1504)) (index!5350 lt!111823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219518 () Bool)

(declare-fun e!142774 () Bool)

(assert (=> b!219518 (= e!142774 false)))

(declare-fun lt!111825 () Bool)

(declare-datatypes ((List!3223 0))(
  ( (Nil!3220) (Cons!3219 (h!3867 (_ BitVec 64)) (t!8173 List!3223)) )
))
(declare-fun arrayNoDuplicates!0 (array!10759 (_ BitVec 32) List!3223) Bool)

(assert (=> b!219518 (= lt!111825 (arrayNoDuplicates!0 (_keys!6199 thiss!1504) #b00000000000000000000000000000000 Nil!3220))))

(declare-fun b!219519 () Bool)

(declare-fun c!36553 () Bool)

(get-info :version)

(assert (=> b!219519 (= c!36553 ((_ is MissingVacant!795) lt!111823))))

(declare-fun e!142777 () Bool)

(declare-fun e!142775 () Bool)

(assert (=> b!219519 (= e!142777 e!142775)))

(declare-fun b!219520 () Bool)

(declare-fun res!107578 () Bool)

(assert (=> b!219520 (=> (not res!107578) (not e!142774))))

(assert (=> b!219520 (= res!107578 (and (= (size!5431 (_values!4129 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9939 thiss!1504))) (= (size!5432 (_keys!6199 thiss!1504)) (size!5431 (_values!4129 thiss!1504))) (bvsge (mask!9939 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3883 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3883 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!219521 () Bool)

(declare-fun e!142768 () Bool)

(declare-fun tp_is_empty!5761 () Bool)

(assert (=> b!219521 (= e!142768 tp_is_empty!5761)))

(declare-fun b!219522 () Bool)

(declare-fun call!20508 () Bool)

(assert (=> b!219522 (= e!142776 (not call!20508))))

(declare-fun b!219523 () Bool)

(declare-fun res!107579 () Bool)

(assert (=> b!219523 (=> (not res!107579) (not e!142774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10759 (_ BitVec 32)) Bool)

(assert (=> b!219523 (= res!107579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6199 thiss!1504) (mask!9939 thiss!1504)))))

(declare-fun b!219524 () Bool)

(declare-fun e!142771 () Bool)

(assert (=> b!219524 (= e!142771 tp_is_empty!5761)))

(declare-fun b!219525 () Bool)

(declare-fun res!107572 () Bool)

(assert (=> b!219525 (=> (not res!107572) (not e!142774))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!219525 (= res!107572 (arrayContainsKey!0 (_keys!6199 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219526 () Bool)

(declare-fun e!142779 () Bool)

(declare-fun mapRes!9811 () Bool)

(assert (=> b!219526 (= e!142779 (and e!142768 mapRes!9811))))

(declare-fun condMapEmpty!9811 () Bool)

(declare-fun mapDefault!9811 () ValueCell!2537)

(assert (=> b!219526 (= condMapEmpty!9811 (= (arr!5097 (_values!4129 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2537)) mapDefault!9811)))))

(declare-fun b!219527 () Bool)

(declare-fun res!107573 () Bool)

(assert (=> b!219527 (=> (not res!107573) (not e!142776))))

(declare-fun call!20507 () Bool)

(assert (=> b!219527 (= res!107573 call!20507)))

(assert (=> b!219527 (= e!142777 e!142776)))

(declare-fun b!219528 () Bool)

(assert (=> b!219528 (= e!142775 ((_ is Undefined!795) lt!111823))))

(declare-fun b!219529 () Bool)

(declare-fun res!107582 () Bool)

(assert (=> b!219529 (=> (not res!107582) (not e!142774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219529 (= res!107582 (validMask!0 (mask!9939 thiss!1504)))))

(declare-fun bm!20504 () Bool)

(assert (=> bm!20504 (= call!20508 (arrayContainsKey!0 (_keys!6199 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219530 () Bool)

(declare-fun e!142773 () Bool)

(assert (=> b!219530 (= e!142773 e!142774)))

(declare-fun res!107580 () Bool)

(assert (=> b!219530 (=> (not res!107580) (not e!142774))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219530 (= res!107580 (inRange!0 index!297 (mask!9939 thiss!1504)))))

(declare-datatypes ((Unit!6501 0))(
  ( (Unit!6502) )
))
(declare-fun lt!111824 () Unit!6501)

(declare-fun e!142769 () Unit!6501)

(assert (=> b!219530 (= lt!111824 e!142769)))

(declare-fun c!36551 () Bool)

(declare-datatypes ((tuple2!4302 0))(
  ( (tuple2!4303 (_1!2162 (_ BitVec 64)) (_2!2162 V!7329)) )
))
(declare-datatypes ((List!3224 0))(
  ( (Nil!3221) (Cons!3220 (h!3868 tuple2!4302) (t!8174 List!3224)) )
))
(declare-datatypes ((ListLongMap!3205 0))(
  ( (ListLongMap!3206 (toList!1618 List!3224)) )
))
(declare-fun contains!1461 (ListLongMap!3205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1127 (array!10759 array!10757 (_ BitVec 32) (_ BitVec 32) V!7329 V!7329 (_ BitVec 32) Int) ListLongMap!3205)

(assert (=> b!219530 (= c!36551 (contains!1461 (getCurrentListMap!1127 (_keys!6199 thiss!1504) (_values!4129 thiss!1504) (mask!9939 thiss!1504) (extraKeys!3883 thiss!1504) (zeroValue!3987 thiss!1504) (minValue!3987 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4146 thiss!1504)) key!932))))

(declare-fun b!219531 () Bool)

(declare-fun res!107581 () Bool)

(declare-fun e!142778 () Bool)

(assert (=> b!219531 (=> (not res!107581) (not e!142778))))

(assert (=> b!219531 (= res!107581 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219532 () Bool)

(assert (=> b!219532 (= e!142778 e!142773)))

(declare-fun res!107574 () Bool)

(assert (=> b!219532 (=> (not res!107574) (not e!142773))))

(assert (=> b!219532 (= res!107574 (or (= lt!111823 (MissingZero!795 index!297)) (= lt!111823 (MissingVacant!795 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10759 (_ BitVec 32)) SeekEntryResult!795)

(assert (=> b!219532 (= lt!111823 (seekEntryOrOpen!0 key!932 (_keys!6199 thiss!1504) (mask!9939 thiss!1504)))))

(declare-fun e!142767 () Bool)

(declare-fun array_inv!3355 (array!10759) Bool)

(declare-fun array_inv!3356 (array!10757) Bool)

(assert (=> b!219533 (= e!142767 (and tp!20838 tp_is_empty!5761 (array_inv!3355 (_keys!6199 thiss!1504)) (array_inv!3356 (_values!4129 thiss!1504)) e!142779))))

(declare-fun bm!20505 () Bool)

(declare-fun c!36552 () Bool)

(assert (=> bm!20505 (= call!20507 (inRange!0 (ite c!36552 (index!5350 lt!111823) (index!5353 lt!111823)) (mask!9939 thiss!1504)))))

(declare-fun b!219534 () Bool)

(declare-fun lt!111826 () Unit!6501)

(assert (=> b!219534 (= e!142769 lt!111826)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!191 (array!10759 array!10757 (_ BitVec 32) (_ BitVec 32) V!7329 V!7329 (_ BitVec 64) Int) Unit!6501)

(assert (=> b!219534 (= lt!111826 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!191 (_keys!6199 thiss!1504) (_values!4129 thiss!1504) (mask!9939 thiss!1504) (extraKeys!3883 thiss!1504) (zeroValue!3987 thiss!1504) (minValue!3987 thiss!1504) key!932 (defaultEntry!4146 thiss!1504)))))

(assert (=> b!219534 (= c!36552 ((_ is MissingZero!795) lt!111823))))

(assert (=> b!219534 e!142777))

(declare-fun b!219535 () Bool)

(declare-fun e!142772 () Bool)

(assert (=> b!219535 (= e!142775 e!142772)))

(declare-fun res!107575 () Bool)

(assert (=> b!219535 (= res!107575 call!20507)))

(assert (=> b!219535 (=> (not res!107575) (not e!142772))))

(declare-fun mapIsEmpty!9811 () Bool)

(assert (=> mapIsEmpty!9811 mapRes!9811))

(declare-fun b!219536 () Bool)

(assert (=> b!219536 (= e!142772 (not call!20508))))

(declare-fun b!219537 () Bool)

(declare-fun Unit!6503 () Unit!6501)

(assert (=> b!219537 (= e!142769 Unit!6503)))

(declare-fun lt!111822 () Unit!6501)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!193 (array!10759 array!10757 (_ BitVec 32) (_ BitVec 32) V!7329 V!7329 (_ BitVec 64) Int) Unit!6501)

(assert (=> b!219537 (= lt!111822 (lemmaInListMapThenSeekEntryOrOpenFindsIt!193 (_keys!6199 thiss!1504) (_values!4129 thiss!1504) (mask!9939 thiss!1504) (extraKeys!3883 thiss!1504) (zeroValue!3987 thiss!1504) (minValue!3987 thiss!1504) key!932 (defaultEntry!4146 thiss!1504)))))

(assert (=> b!219537 false))

(declare-fun res!107577 () Bool)

(assert (=> start!21836 (=> (not res!107577) (not e!142778))))

(declare-fun valid!1217 (LongMapFixedSize!2974) Bool)

(assert (=> start!21836 (= res!107577 (valid!1217 thiss!1504))))

(assert (=> start!21836 e!142778))

(assert (=> start!21836 e!142767))

(assert (=> start!21836 true))

(declare-fun b!219538 () Bool)

(declare-fun res!107571 () Bool)

(assert (=> b!219538 (= res!107571 (= (select (arr!5098 (_keys!6199 thiss!1504)) (index!5353 lt!111823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219538 (=> (not res!107571) (not e!142772))))

(declare-fun mapNonEmpty!9811 () Bool)

(declare-fun tp!20839 () Bool)

(assert (=> mapNonEmpty!9811 (= mapRes!9811 (and tp!20839 e!142771))))

(declare-fun mapValue!9811 () ValueCell!2537)

(declare-fun mapKey!9811 () (_ BitVec 32))

(declare-fun mapRest!9811 () (Array (_ BitVec 32) ValueCell!2537))

(assert (=> mapNonEmpty!9811 (= (arr!5097 (_values!4129 thiss!1504)) (store mapRest!9811 mapKey!9811 mapValue!9811))))

(assert (= (and start!21836 res!107577) b!219531))

(assert (= (and b!219531 res!107581) b!219532))

(assert (= (and b!219532 res!107574) b!219530))

(assert (= (and b!219530 c!36551) b!219537))

(assert (= (and b!219530 (not c!36551)) b!219534))

(assert (= (and b!219534 c!36552) b!219527))

(assert (= (and b!219534 (not c!36552)) b!219519))

(assert (= (and b!219527 res!107573) b!219517))

(assert (= (and b!219517 res!107576) b!219522))

(assert (= (and b!219519 c!36553) b!219535))

(assert (= (and b!219519 (not c!36553)) b!219528))

(assert (= (and b!219535 res!107575) b!219538))

(assert (= (and b!219538 res!107571) b!219536))

(assert (= (or b!219527 b!219535) bm!20505))

(assert (= (or b!219522 b!219536) bm!20504))

(assert (= (and b!219530 res!107580) b!219525))

(assert (= (and b!219525 res!107572) b!219529))

(assert (= (and b!219529 res!107582) b!219520))

(assert (= (and b!219520 res!107578) b!219523))

(assert (= (and b!219523 res!107579) b!219518))

(assert (= (and b!219526 condMapEmpty!9811) mapIsEmpty!9811))

(assert (= (and b!219526 (not condMapEmpty!9811)) mapNonEmpty!9811))

(assert (= (and mapNonEmpty!9811 ((_ is ValueCellFull!2537) mapValue!9811)) b!219524))

(assert (= (and b!219526 ((_ is ValueCellFull!2537) mapDefault!9811)) b!219521))

(assert (= b!219533 b!219526))

(assert (= start!21836 b!219533))

(declare-fun m!244549 () Bool)

(assert (=> b!219538 m!244549))

(declare-fun m!244551 () Bool)

(assert (=> bm!20505 m!244551))

(declare-fun m!244553 () Bool)

(assert (=> bm!20504 m!244553))

(declare-fun m!244555 () Bool)

(assert (=> b!219534 m!244555))

(declare-fun m!244557 () Bool)

(assert (=> b!219529 m!244557))

(declare-fun m!244559 () Bool)

(assert (=> b!219518 m!244559))

(declare-fun m!244561 () Bool)

(assert (=> b!219523 m!244561))

(declare-fun m!244563 () Bool)

(assert (=> b!219530 m!244563))

(declare-fun m!244565 () Bool)

(assert (=> b!219530 m!244565))

(assert (=> b!219530 m!244565))

(declare-fun m!244567 () Bool)

(assert (=> b!219530 m!244567))

(declare-fun m!244569 () Bool)

(assert (=> mapNonEmpty!9811 m!244569))

(declare-fun m!244571 () Bool)

(assert (=> b!219533 m!244571))

(declare-fun m!244573 () Bool)

(assert (=> b!219533 m!244573))

(declare-fun m!244575 () Bool)

(assert (=> b!219537 m!244575))

(declare-fun m!244577 () Bool)

(assert (=> b!219532 m!244577))

(declare-fun m!244579 () Bool)

(assert (=> b!219517 m!244579))

(assert (=> b!219525 m!244553))

(declare-fun m!244581 () Bool)

(assert (=> start!21836 m!244581))

(check-sat (not b!219530) (not mapNonEmpty!9811) (not b!219534) (not b!219523) (not bm!20504) tp_is_empty!5761 b_and!12771 (not b!219537) (not b!219532) (not b_next!5899) (not b!219529) (not b!219525) (not bm!20505) (not start!21836) (not b!219533) (not b!219518))
(check-sat b_and!12771 (not b_next!5899))
