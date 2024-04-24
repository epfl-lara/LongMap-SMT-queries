; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21830 () Bool)

(assert start!21830)

(declare-fun b!219524 () Bool)

(declare-fun b_free!5893 () Bool)

(declare-fun b_next!5893 () Bool)

(assert (=> b!219524 (= b_free!5893 (not b_next!5893))))

(declare-fun tp!20820 () Bool)

(declare-fun b_and!12805 () Bool)

(assert (=> b!219524 (= tp!20820 b_and!12805)))

(declare-fun b!219513 () Bool)

(declare-fun e!142780 () Bool)

(declare-fun tp_is_empty!5755 () Bool)

(assert (=> b!219513 (= e!142780 tp_is_empty!5755)))

(declare-fun mapIsEmpty!9802 () Bool)

(declare-fun mapRes!9802 () Bool)

(assert (=> mapIsEmpty!9802 mapRes!9802))

(declare-fun b!219514 () Bool)

(declare-fun res!107583 () Bool)

(declare-fun e!142777 () Bool)

(assert (=> b!219514 (=> (not res!107583) (not e!142777))))

(declare-datatypes ((V!7321 0))(
  ( (V!7322 (val!2922 Int)) )
))
(declare-datatypes ((ValueCell!2534 0))(
  ( (ValueCellFull!2534 (v!4943 V!7321)) (EmptyCell!2534) )
))
(declare-datatypes ((array!10751 0))(
  ( (array!10752 (arr!5095 (Array (_ BitVec 32) ValueCell!2534)) (size!5428 (_ BitVec 32))) )
))
(declare-datatypes ((array!10753 0))(
  ( (array!10754 (arr!5096 (Array (_ BitVec 32) (_ BitVec 64))) (size!5429 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2968 0))(
  ( (LongMapFixedSize!2969 (defaultEntry!4143 Int) (mask!9935 (_ BitVec 32)) (extraKeys!3880 (_ BitVec 32)) (zeroValue!3984 V!7321) (minValue!3984 V!7321) (_size!1533 (_ BitVec 32)) (_keys!6197 array!10753) (_values!4126 array!10751) (_vacant!1533 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2968)

(declare-datatypes ((SeekEntryResult!773 0))(
  ( (MissingZero!773 (index!5262 (_ BitVec 32))) (Found!773 (index!5263 (_ BitVec 32))) (Intermediate!773 (undefined!1585 Bool) (index!5264 (_ BitVec 32)) (x!22881 (_ BitVec 32))) (Undefined!773) (MissingVacant!773 (index!5265 (_ BitVec 32))) )
))
(declare-fun lt!112018 () SeekEntryResult!773)

(assert (=> b!219514 (= res!107583 (= (select (arr!5096 (_keys!6197 thiss!1504)) (index!5262 lt!112018)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219515 () Bool)

(declare-fun res!107587 () Bool)

(declare-fun e!142787 () Bool)

(assert (=> b!219515 (=> (not res!107587) (not e!142787))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!219515 (= res!107587 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219516 () Bool)

(declare-fun res!107585 () Bool)

(declare-fun e!142785 () Bool)

(assert (=> b!219516 (=> (not res!107585) (not e!142785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219516 (= res!107585 (validMask!0 (mask!9935 thiss!1504)))))

(declare-fun b!219517 () Bool)

(declare-fun res!107581 () Bool)

(assert (=> b!219517 (=> (not res!107581) (not e!142785))))

(declare-fun arrayContainsKey!0 (array!10753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!219517 (= res!107581 (arrayContainsKey!0 (_keys!6197 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219518 () Bool)

(declare-fun e!142781 () Bool)

(get-info :version)

(assert (=> b!219518 (= e!142781 ((_ is Undefined!773) lt!112018))))

(declare-fun b!219519 () Bool)

(declare-datatypes ((Unit!6525 0))(
  ( (Unit!6526) )
))
(declare-fun e!142784 () Unit!6525)

(declare-fun Unit!6527 () Unit!6525)

(assert (=> b!219519 (= e!142784 Unit!6527)))

(declare-fun lt!112020 () Unit!6525)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!191 (array!10753 array!10751 (_ BitVec 32) (_ BitVec 32) V!7321 V!7321 (_ BitVec 64) Int) Unit!6525)

(assert (=> b!219519 (= lt!112020 (lemmaInListMapThenSeekEntryOrOpenFindsIt!191 (_keys!6197 thiss!1504) (_values!4126 thiss!1504) (mask!9935 thiss!1504) (extraKeys!3880 thiss!1504) (zeroValue!3984 thiss!1504) (minValue!3984 thiss!1504) key!932 (defaultEntry!4143 thiss!1504)))))

(assert (=> b!219519 false))

(declare-fun b!219521 () Bool)

(declare-fun lt!112021 () Unit!6525)

(assert (=> b!219521 (= e!142784 lt!112021)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!188 (array!10753 array!10751 (_ BitVec 32) (_ BitVec 32) V!7321 V!7321 (_ BitVec 64) Int) Unit!6525)

(assert (=> b!219521 (= lt!112021 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!188 (_keys!6197 thiss!1504) (_values!4126 thiss!1504) (mask!9935 thiss!1504) (extraKeys!3880 thiss!1504) (zeroValue!3984 thiss!1504) (minValue!3984 thiss!1504) key!932 (defaultEntry!4143 thiss!1504)))))

(declare-fun c!36563 () Bool)

(assert (=> b!219521 (= c!36563 ((_ is MissingZero!773) lt!112018))))

(declare-fun e!142786 () Bool)

(assert (=> b!219521 e!142786))

(declare-fun b!219522 () Bool)

(declare-fun call!20502 () Bool)

(assert (=> b!219522 (= e!142777 (not call!20502))))

(declare-fun b!219523 () Bool)

(declare-fun e!142783 () Bool)

(declare-fun e!142776 () Bool)

(assert (=> b!219523 (= e!142783 (and e!142776 mapRes!9802))))

(declare-fun condMapEmpty!9802 () Bool)

(declare-fun mapDefault!9802 () ValueCell!2534)

(assert (=> b!219523 (= condMapEmpty!9802 (= (arr!5095 (_values!4126 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2534)) mapDefault!9802)))))

(declare-fun e!142782 () Bool)

(declare-fun array_inv!3349 (array!10753) Bool)

(declare-fun array_inv!3350 (array!10751) Bool)

(assert (=> b!219524 (= e!142782 (and tp!20820 tp_is_empty!5755 (array_inv!3349 (_keys!6197 thiss!1504)) (array_inv!3350 (_values!4126 thiss!1504)) e!142783))))

(declare-fun b!219525 () Bool)

(declare-fun c!36565 () Bool)

(assert (=> b!219525 (= c!36565 ((_ is MissingVacant!773) lt!112018))))

(assert (=> b!219525 (= e!142786 e!142781)))

(declare-fun b!219526 () Bool)

(declare-fun e!142778 () Bool)

(assert (=> b!219526 (= e!142787 e!142778)))

(declare-fun res!107582 () Bool)

(assert (=> b!219526 (=> (not res!107582) (not e!142778))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!219526 (= res!107582 (or (= lt!112018 (MissingZero!773 index!297)) (= lt!112018 (MissingVacant!773 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10753 (_ BitVec 32)) SeekEntryResult!773)

(assert (=> b!219526 (= lt!112018 (seekEntryOrOpen!0 key!932 (_keys!6197 thiss!1504) (mask!9935 thiss!1504)))))

(declare-fun b!219527 () Bool)

(declare-fun e!142779 () Bool)

(assert (=> b!219527 (= e!142781 e!142779)))

(declare-fun res!107586 () Bool)

(declare-fun call!20501 () Bool)

(assert (=> b!219527 (= res!107586 call!20501)))

(assert (=> b!219527 (=> (not res!107586) (not e!142779))))

(declare-fun b!219528 () Bool)

(assert (=> b!219528 (= e!142779 (not call!20502))))

(declare-fun b!219529 () Bool)

(assert (=> b!219529 (= e!142776 tp_is_empty!5755)))

(declare-fun b!219520 () Bool)

(assert (=> b!219520 (= e!142778 e!142785)))

(declare-fun res!107588 () Bool)

(assert (=> b!219520 (=> (not res!107588) (not e!142785))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219520 (= res!107588 (inRange!0 index!297 (mask!9935 thiss!1504)))))

(declare-fun lt!112019 () Unit!6525)

(assert (=> b!219520 (= lt!112019 e!142784)))

(declare-fun c!36564 () Bool)

(declare-datatypes ((tuple2!4262 0))(
  ( (tuple2!4263 (_1!2142 (_ BitVec 64)) (_2!2142 V!7321)) )
))
(declare-datatypes ((List!3157 0))(
  ( (Nil!3154) (Cons!3153 (h!3801 tuple2!4262) (t!8108 List!3157)) )
))
(declare-datatypes ((ListLongMap!3177 0))(
  ( (ListLongMap!3178 (toList!1604 List!3157)) )
))
(declare-fun contains!1461 (ListLongMap!3177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1136 (array!10753 array!10751 (_ BitVec 32) (_ BitVec 32) V!7321 V!7321 (_ BitVec 32) Int) ListLongMap!3177)

(assert (=> b!219520 (= c!36564 (contains!1461 (getCurrentListMap!1136 (_keys!6197 thiss!1504) (_values!4126 thiss!1504) (mask!9935 thiss!1504) (extraKeys!3880 thiss!1504) (zeroValue!3984 thiss!1504) (minValue!3984 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4143 thiss!1504)) key!932))))

(declare-fun res!107580 () Bool)

(assert (=> start!21830 (=> (not res!107580) (not e!142787))))

(declare-fun valid!1213 (LongMapFixedSize!2968) Bool)

(assert (=> start!21830 (= res!107580 (valid!1213 thiss!1504))))

(assert (=> start!21830 e!142787))

(assert (=> start!21830 e!142782))

(assert (=> start!21830 true))

(declare-fun b!219530 () Bool)

(assert (=> b!219530 (= e!142785 false)))

(declare-fun lt!112017 () Bool)

(declare-datatypes ((List!3158 0))(
  ( (Nil!3155) (Cons!3154 (h!3802 (_ BitVec 64)) (t!8109 List!3158)) )
))
(declare-fun arrayNoDuplicates!0 (array!10753 (_ BitVec 32) List!3158) Bool)

(assert (=> b!219530 (= lt!112017 (arrayNoDuplicates!0 (_keys!6197 thiss!1504) #b00000000000000000000000000000000 Nil!3155))))

(declare-fun b!219531 () Bool)

(declare-fun res!107590 () Bool)

(assert (=> b!219531 (= res!107590 (= (select (arr!5096 (_keys!6197 thiss!1504)) (index!5265 lt!112018)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219531 (=> (not res!107590) (not e!142779))))

(declare-fun b!219532 () Bool)

(declare-fun res!107584 () Bool)

(assert (=> b!219532 (=> (not res!107584) (not e!142777))))

(assert (=> b!219532 (= res!107584 call!20501)))

(assert (=> b!219532 (= e!142786 e!142777)))

(declare-fun b!219533 () Bool)

(declare-fun res!107579 () Bool)

(assert (=> b!219533 (=> (not res!107579) (not e!142785))))

(assert (=> b!219533 (= res!107579 (and (= (size!5428 (_values!4126 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9935 thiss!1504))) (= (size!5429 (_keys!6197 thiss!1504)) (size!5428 (_values!4126 thiss!1504))) (bvsge (mask!9935 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3880 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3880 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun bm!20498 () Bool)

(assert (=> bm!20498 (= call!20502 (arrayContainsKey!0 (_keys!6197 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9802 () Bool)

(declare-fun tp!20821 () Bool)

(assert (=> mapNonEmpty!9802 (= mapRes!9802 (and tp!20821 e!142780))))

(declare-fun mapKey!9802 () (_ BitVec 32))

(declare-fun mapValue!9802 () ValueCell!2534)

(declare-fun mapRest!9802 () (Array (_ BitVec 32) ValueCell!2534))

(assert (=> mapNonEmpty!9802 (= (arr!5095 (_values!4126 thiss!1504)) (store mapRest!9802 mapKey!9802 mapValue!9802))))

(declare-fun bm!20499 () Bool)

(assert (=> bm!20499 (= call!20501 (inRange!0 (ite c!36563 (index!5262 lt!112018) (index!5265 lt!112018)) (mask!9935 thiss!1504)))))

(declare-fun b!219534 () Bool)

(declare-fun res!107589 () Bool)

(assert (=> b!219534 (=> (not res!107589) (not e!142785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10753 (_ BitVec 32)) Bool)

(assert (=> b!219534 (= res!107589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6197 thiss!1504) (mask!9935 thiss!1504)))))

(assert (= (and start!21830 res!107580) b!219515))

(assert (= (and b!219515 res!107587) b!219526))

(assert (= (and b!219526 res!107582) b!219520))

(assert (= (and b!219520 c!36564) b!219519))

(assert (= (and b!219520 (not c!36564)) b!219521))

(assert (= (and b!219521 c!36563) b!219532))

(assert (= (and b!219521 (not c!36563)) b!219525))

(assert (= (and b!219532 res!107584) b!219514))

(assert (= (and b!219514 res!107583) b!219522))

(assert (= (and b!219525 c!36565) b!219527))

(assert (= (and b!219525 (not c!36565)) b!219518))

(assert (= (and b!219527 res!107586) b!219531))

(assert (= (and b!219531 res!107590) b!219528))

(assert (= (or b!219532 b!219527) bm!20499))

(assert (= (or b!219522 b!219528) bm!20498))

(assert (= (and b!219520 res!107588) b!219517))

(assert (= (and b!219517 res!107581) b!219516))

(assert (= (and b!219516 res!107585) b!219533))

(assert (= (and b!219533 res!107579) b!219534))

(assert (= (and b!219534 res!107589) b!219530))

(assert (= (and b!219523 condMapEmpty!9802) mapIsEmpty!9802))

(assert (= (and b!219523 (not condMapEmpty!9802)) mapNonEmpty!9802))

(assert (= (and mapNonEmpty!9802 ((_ is ValueCellFull!2534) mapValue!9802)) b!219513))

(assert (= (and b!219523 ((_ is ValueCellFull!2534) mapDefault!9802)) b!219529))

(assert (= b!219524 b!219523))

(assert (= start!21830 b!219524))

(declare-fun m!245245 () Bool)

(assert (=> start!21830 m!245245))

(declare-fun m!245247 () Bool)

(assert (=> b!219520 m!245247))

(declare-fun m!245249 () Bool)

(assert (=> b!219520 m!245249))

(assert (=> b!219520 m!245249))

(declare-fun m!245251 () Bool)

(assert (=> b!219520 m!245251))

(declare-fun m!245253 () Bool)

(assert (=> b!219519 m!245253))

(declare-fun m!245255 () Bool)

(assert (=> b!219524 m!245255))

(declare-fun m!245257 () Bool)

(assert (=> b!219524 m!245257))

(declare-fun m!245259 () Bool)

(assert (=> bm!20498 m!245259))

(declare-fun m!245261 () Bool)

(assert (=> b!219534 m!245261))

(declare-fun m!245263 () Bool)

(assert (=> bm!20499 m!245263))

(declare-fun m!245265 () Bool)

(assert (=> b!219531 m!245265))

(declare-fun m!245267 () Bool)

(assert (=> b!219516 m!245267))

(assert (=> b!219517 m!245259))

(declare-fun m!245269 () Bool)

(assert (=> mapNonEmpty!9802 m!245269))

(declare-fun m!245271 () Bool)

(assert (=> b!219530 m!245271))

(declare-fun m!245273 () Bool)

(assert (=> b!219514 m!245273))

(declare-fun m!245275 () Bool)

(assert (=> b!219521 m!245275))

(declare-fun m!245277 () Bool)

(assert (=> b!219526 m!245277))

(check-sat (not bm!20499) (not b!219517) (not b_next!5893) (not start!21830) (not b!219516) (not b!219534) (not bm!20498) b_and!12805 (not b!219520) tp_is_empty!5755 (not b!219519) (not b!219526) (not mapNonEmpty!9802) (not b!219524) (not b!219521) (not b!219530))
(check-sat b_and!12805 (not b_next!5893))
