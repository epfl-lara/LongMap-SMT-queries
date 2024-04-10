; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21858 () Bool)

(assert start!21858)

(declare-fun b!220532 () Bool)

(declare-fun b_free!5925 () Bool)

(declare-fun b_next!5925 () Bool)

(assert (=> b!220532 (= b_free!5925 (not b_next!5925))))

(declare-fun tp!20916 () Bool)

(declare-fun b_and!12823 () Bool)

(assert (=> b!220532 (= tp!20916 b_and!12823)))

(declare-fun bm!20606 () Bool)

(declare-datatypes ((SeekEntryResult!813 0))(
  ( (MissingZero!813 (index!5422 (_ BitVec 32))) (Found!813 (index!5423 (_ BitVec 32))) (Intermediate!813 (undefined!1625 Bool) (index!5424 (_ BitVec 32)) (x!22961 (_ BitVec 32))) (Undefined!813) (MissingVacant!813 (index!5425 (_ BitVec 32))) )
))
(declare-fun lt!112199 () SeekEntryResult!813)

(declare-datatypes ((V!7363 0))(
  ( (V!7364 (val!2938 Int)) )
))
(declare-datatypes ((ValueCell!2550 0))(
  ( (ValueCellFull!2550 (v!4958 V!7363)) (EmptyCell!2550) )
))
(declare-datatypes ((array!10817 0))(
  ( (array!10818 (arr!5128 (Array (_ BitVec 32) ValueCell!2550)) (size!5461 (_ BitVec 32))) )
))
(declare-datatypes ((array!10819 0))(
  ( (array!10820 (arr!5129 (Array (_ BitVec 32) (_ BitVec 64))) (size!5462 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3000 0))(
  ( (LongMapFixedSize!3001 (defaultEntry!4159 Int) (mask!9961 (_ BitVec 32)) (extraKeys!3896 (_ BitVec 32)) (zeroValue!4000 V!7363) (minValue!4000 V!7363) (_size!1549 (_ BitVec 32)) (_keys!6213 array!10819) (_values!4142 array!10817) (_vacant!1549 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3000)

(declare-fun call!20609 () Bool)

(declare-fun c!36696 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20606 (= call!20609 (inRange!0 (ite c!36696 (index!5422 lt!112199) (index!5425 lt!112199)) (mask!9961 thiss!1504)))))

(declare-fun b!220522 () Bool)

(declare-fun res!108144 () Bool)

(assert (=> b!220522 (= res!108144 (= (select (arr!5129 (_keys!6213 thiss!1504)) (index!5425 lt!112199)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143386 () Bool)

(assert (=> b!220522 (=> (not res!108144) (not e!143386))))

(declare-fun b!220523 () Bool)

(declare-fun e!143376 () Bool)

(declare-fun e!143385 () Bool)

(assert (=> b!220523 (= e!143376 e!143385)))

(declare-fun res!108134 () Bool)

(assert (=> b!220523 (=> (not res!108134) (not e!143385))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220523 (= res!108134 (inRange!0 index!297 (mask!9961 thiss!1504)))))

(declare-datatypes ((Unit!6576 0))(
  ( (Unit!6577) )
))
(declare-fun lt!112200 () Unit!6576)

(declare-fun e!143383 () Unit!6576)

(assert (=> b!220523 (= lt!112200 e!143383)))

(declare-fun c!36694 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4360 0))(
  ( (tuple2!4361 (_1!2191 (_ BitVec 64)) (_2!2191 V!7363)) )
))
(declare-datatypes ((List!3262 0))(
  ( (Nil!3259) (Cons!3258 (h!3906 tuple2!4360) (t!8221 List!3262)) )
))
(declare-datatypes ((ListLongMap!3273 0))(
  ( (ListLongMap!3274 (toList!1652 List!3262)) )
))
(declare-fun contains!1495 (ListLongMap!3273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1180 (array!10819 array!10817 (_ BitVec 32) (_ BitVec 32) V!7363 V!7363 (_ BitVec 32) Int) ListLongMap!3273)

(assert (=> b!220523 (= c!36694 (contains!1495 (getCurrentListMap!1180 (_keys!6213 thiss!1504) (_values!4142 thiss!1504) (mask!9961 thiss!1504) (extraKeys!3896 thiss!1504) (zeroValue!4000 thiss!1504) (minValue!4000 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4159 thiss!1504)) key!932))))

(declare-fun b!220524 () Bool)

(declare-fun res!108142 () Bool)

(declare-fun e!143379 () Bool)

(assert (=> b!220524 (=> (not res!108142) (not e!143379))))

(assert (=> b!220524 (= res!108142 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220525 () Bool)

(declare-fun res!108135 () Bool)

(declare-fun e!143377 () Bool)

(assert (=> b!220525 (=> (not res!108135) (not e!143377))))

(assert (=> b!220525 (= res!108135 (= (select (arr!5129 (_keys!6213 thiss!1504)) (index!5422 lt!112199)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220526 () Bool)

(declare-fun e!143378 () Bool)

(assert (=> b!220526 (= e!143378 e!143386)))

(declare-fun res!108138 () Bool)

(assert (=> b!220526 (= res!108138 call!20609)))

(assert (=> b!220526 (=> (not res!108138) (not e!143386))))

(declare-fun b!220527 () Bool)

(declare-fun res!108136 () Bool)

(assert (=> b!220527 (=> (not res!108136) (not e!143385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10819 (_ BitVec 32)) Bool)

(assert (=> b!220527 (= res!108136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6213 thiss!1504) (mask!9961 thiss!1504)))))

(declare-fun b!220528 () Bool)

(declare-fun res!108140 () Bool)

(assert (=> b!220528 (=> (not res!108140) (not e!143377))))

(assert (=> b!220528 (= res!108140 call!20609)))

(declare-fun e!143384 () Bool)

(assert (=> b!220528 (= e!143384 e!143377)))

(declare-fun b!220529 () Bool)

(get-info :version)

(assert (=> b!220529 (= e!143378 ((_ is Undefined!813) lt!112199))))

(declare-fun b!220530 () Bool)

(declare-fun res!108141 () Bool)

(assert (=> b!220530 (=> (not res!108141) (not e!143385))))

(assert (=> b!220530 (= res!108141 (and (= (size!5461 (_values!4142 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9961 thiss!1504))) (= (size!5462 (_keys!6213 thiss!1504)) (size!5461 (_values!4142 thiss!1504))) (bvsge (mask!9961 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3896 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3896 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220531 () Bool)

(declare-fun e!143387 () Bool)

(declare-fun tp_is_empty!5787 () Bool)

(assert (=> b!220531 (= e!143387 tp_is_empty!5787)))

(declare-fun e!143381 () Bool)

(declare-fun e!143375 () Bool)

(declare-fun array_inv!3393 (array!10819) Bool)

(declare-fun array_inv!3394 (array!10817) Bool)

(assert (=> b!220532 (= e!143375 (and tp!20916 tp_is_empty!5787 (array_inv!3393 (_keys!6213 thiss!1504)) (array_inv!3394 (_values!4142 thiss!1504)) e!143381))))

(declare-fun b!220533 () Bool)

(assert (=> b!220533 (= e!143385 false)))

(declare-fun lt!112201 () Bool)

(declare-datatypes ((List!3263 0))(
  ( (Nil!3260) (Cons!3259 (h!3907 (_ BitVec 64)) (t!8222 List!3263)) )
))
(declare-fun arrayNoDuplicates!0 (array!10819 (_ BitVec 32) List!3263) Bool)

(assert (=> b!220533 (= lt!112201 (arrayNoDuplicates!0 (_keys!6213 thiss!1504) #b00000000000000000000000000000000 Nil!3260))))

(declare-fun mapIsEmpty!9850 () Bool)

(declare-fun mapRes!9850 () Bool)

(assert (=> mapIsEmpty!9850 mapRes!9850))

(declare-fun b!220534 () Bool)

(declare-fun lt!112198 () Unit!6576)

(assert (=> b!220534 (= e!143383 lt!112198)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!216 (array!10819 array!10817 (_ BitVec 32) (_ BitVec 32) V!7363 V!7363 (_ BitVec 64) Int) Unit!6576)

(assert (=> b!220534 (= lt!112198 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!216 (_keys!6213 thiss!1504) (_values!4142 thiss!1504) (mask!9961 thiss!1504) (extraKeys!3896 thiss!1504) (zeroValue!4000 thiss!1504) (minValue!4000 thiss!1504) key!932 (defaultEntry!4159 thiss!1504)))))

(assert (=> b!220534 (= c!36696 ((_ is MissingZero!813) lt!112199))))

(assert (=> b!220534 e!143384))

(declare-fun b!220535 () Bool)

(declare-fun Unit!6578 () Unit!6576)

(assert (=> b!220535 (= e!143383 Unit!6578)))

(declare-fun lt!112202 () Unit!6576)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!203 (array!10819 array!10817 (_ BitVec 32) (_ BitVec 32) V!7363 V!7363 (_ BitVec 64) Int) Unit!6576)

(assert (=> b!220535 (= lt!112202 (lemmaInListMapThenSeekEntryOrOpenFindsIt!203 (_keys!6213 thiss!1504) (_values!4142 thiss!1504) (mask!9961 thiss!1504) (extraKeys!3896 thiss!1504) (zeroValue!4000 thiss!1504) (minValue!4000 thiss!1504) key!932 (defaultEntry!4159 thiss!1504)))))

(assert (=> b!220535 false))

(declare-fun b!220536 () Bool)

(declare-fun call!20610 () Bool)

(assert (=> b!220536 (= e!143386 (not call!20610))))

(declare-fun b!220537 () Bool)

(declare-fun e!143380 () Bool)

(assert (=> b!220537 (= e!143380 tp_is_empty!5787)))

(declare-fun b!220538 () Bool)

(declare-fun c!36695 () Bool)

(assert (=> b!220538 (= c!36695 ((_ is MissingVacant!813) lt!112199))))

(assert (=> b!220538 (= e!143384 e!143378)))

(declare-fun b!220539 () Bool)

(assert (=> b!220539 (= e!143381 (and e!143380 mapRes!9850))))

(declare-fun condMapEmpty!9850 () Bool)

(declare-fun mapDefault!9850 () ValueCell!2550)

(assert (=> b!220539 (= condMapEmpty!9850 (= (arr!5128 (_values!4142 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2550)) mapDefault!9850)))))

(declare-fun b!220540 () Bool)

(assert (=> b!220540 (= e!143379 e!143376)))

(declare-fun res!108137 () Bool)

(assert (=> b!220540 (=> (not res!108137) (not e!143376))))

(assert (=> b!220540 (= res!108137 (or (= lt!112199 (MissingZero!813 index!297)) (= lt!112199 (MissingVacant!813 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10819 (_ BitVec 32)) SeekEntryResult!813)

(assert (=> b!220540 (= lt!112199 (seekEntryOrOpen!0 key!932 (_keys!6213 thiss!1504) (mask!9961 thiss!1504)))))

(declare-fun b!220541 () Bool)

(declare-fun res!108145 () Bool)

(assert (=> b!220541 (=> (not res!108145) (not e!143385))))

(declare-fun arrayContainsKey!0 (array!10819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220541 (= res!108145 (arrayContainsKey!0 (_keys!6213 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20607 () Bool)

(assert (=> bm!20607 (= call!20610 (arrayContainsKey!0 (_keys!6213 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9850 () Bool)

(declare-fun tp!20917 () Bool)

(assert (=> mapNonEmpty!9850 (= mapRes!9850 (and tp!20917 e!143387))))

(declare-fun mapKey!9850 () (_ BitVec 32))

(declare-fun mapRest!9850 () (Array (_ BitVec 32) ValueCell!2550))

(declare-fun mapValue!9850 () ValueCell!2550)

(assert (=> mapNonEmpty!9850 (= (arr!5128 (_values!4142 thiss!1504)) (store mapRest!9850 mapKey!9850 mapValue!9850))))

(declare-fun res!108139 () Bool)

(assert (=> start!21858 (=> (not res!108139) (not e!143379))))

(declare-fun valid!1210 (LongMapFixedSize!3000) Bool)

(assert (=> start!21858 (= res!108139 (valid!1210 thiss!1504))))

(assert (=> start!21858 e!143379))

(assert (=> start!21858 e!143375))

(assert (=> start!21858 true))

(declare-fun b!220542 () Bool)

(assert (=> b!220542 (= e!143377 (not call!20610))))

(declare-fun b!220543 () Bool)

(declare-fun res!108143 () Bool)

(assert (=> b!220543 (=> (not res!108143) (not e!143385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220543 (= res!108143 (validMask!0 (mask!9961 thiss!1504)))))

(assert (= (and start!21858 res!108139) b!220524))

(assert (= (and b!220524 res!108142) b!220540))

(assert (= (and b!220540 res!108137) b!220523))

(assert (= (and b!220523 c!36694) b!220535))

(assert (= (and b!220523 (not c!36694)) b!220534))

(assert (= (and b!220534 c!36696) b!220528))

(assert (= (and b!220534 (not c!36696)) b!220538))

(assert (= (and b!220528 res!108140) b!220525))

(assert (= (and b!220525 res!108135) b!220542))

(assert (= (and b!220538 c!36695) b!220526))

(assert (= (and b!220538 (not c!36695)) b!220529))

(assert (= (and b!220526 res!108138) b!220522))

(assert (= (and b!220522 res!108144) b!220536))

(assert (= (or b!220528 b!220526) bm!20606))

(assert (= (or b!220542 b!220536) bm!20607))

(assert (= (and b!220523 res!108134) b!220541))

(assert (= (and b!220541 res!108145) b!220543))

(assert (= (and b!220543 res!108143) b!220530))

(assert (= (and b!220530 res!108141) b!220527))

(assert (= (and b!220527 res!108136) b!220533))

(assert (= (and b!220539 condMapEmpty!9850) mapIsEmpty!9850))

(assert (= (and b!220539 (not condMapEmpty!9850)) mapNonEmpty!9850))

(assert (= (and mapNonEmpty!9850 ((_ is ValueCellFull!2550) mapValue!9850)) b!220531))

(assert (= (and b!220539 ((_ is ValueCellFull!2550) mapDefault!9850)) b!220537))

(assert (= b!220532 b!220539))

(assert (= start!21858 b!220532))

(declare-fun m!245607 () Bool)

(assert (=> b!220543 m!245607))

(declare-fun m!245609 () Bool)

(assert (=> bm!20607 m!245609))

(declare-fun m!245611 () Bool)

(assert (=> b!220535 m!245611))

(declare-fun m!245613 () Bool)

(assert (=> b!220525 m!245613))

(declare-fun m!245615 () Bool)

(assert (=> b!220522 m!245615))

(declare-fun m!245617 () Bool)

(assert (=> b!220533 m!245617))

(declare-fun m!245619 () Bool)

(assert (=> start!21858 m!245619))

(declare-fun m!245621 () Bool)

(assert (=> mapNonEmpty!9850 m!245621))

(declare-fun m!245623 () Bool)

(assert (=> b!220540 m!245623))

(declare-fun m!245625 () Bool)

(assert (=> b!220534 m!245625))

(declare-fun m!245627 () Bool)

(assert (=> b!220523 m!245627))

(declare-fun m!245629 () Bool)

(assert (=> b!220523 m!245629))

(assert (=> b!220523 m!245629))

(declare-fun m!245631 () Bool)

(assert (=> b!220523 m!245631))

(declare-fun m!245633 () Bool)

(assert (=> bm!20606 m!245633))

(declare-fun m!245635 () Bool)

(assert (=> b!220532 m!245635))

(declare-fun m!245637 () Bool)

(assert (=> b!220532 m!245637))

(declare-fun m!245639 () Bool)

(assert (=> b!220527 m!245639))

(assert (=> b!220541 m!245609))

(check-sat (not b!220532) (not b!220535) b_and!12823 (not bm!20606) (not b!220533) (not b!220543) (not b!220541) (not b!220527) tp_is_empty!5787 (not bm!20607) (not b_next!5925) (not b!220534) (not start!21858) (not b!220540) (not mapNonEmpty!9850) (not b!220523))
(check-sat b_and!12823 (not b_next!5925))
