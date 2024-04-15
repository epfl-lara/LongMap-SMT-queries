; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23118 () Bool)

(assert start!23118)

(declare-fun b!242163 () Bool)

(declare-fun b_free!6505 () Bool)

(declare-fun b_next!6505 () Bool)

(assert (=> b!242163 (= b_free!6505 (not b_next!6505))))

(declare-fun tp!22728 () Bool)

(declare-fun b_and!13455 () Bool)

(assert (=> b!242163 (= tp!22728 b_and!13455)))

(declare-fun bm!22547 () Bool)

(declare-fun call!22551 () Bool)

(declare-datatypes ((V!8137 0))(
  ( (V!8138 (val!3228 Int)) )
))
(declare-datatypes ((ValueCell!2840 0))(
  ( (ValueCellFull!2840 (v!5263 V!8137)) (EmptyCell!2840) )
))
(declare-datatypes ((array!12011 0))(
  ( (array!12012 (arr!5703 (Array (_ BitVec 32) ValueCell!2840)) (size!6046 (_ BitVec 32))) )
))
(declare-datatypes ((array!12013 0))(
  ( (array!12014 (arr!5704 (Array (_ BitVec 32) (_ BitVec 64))) (size!6047 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3580 0))(
  ( (LongMapFixedSize!3581 (defaultEntry!4491 Int) (mask!10571 (_ BitVec 32)) (extraKeys!4228 (_ BitVec 32)) (zeroValue!4332 V!8137) (minValue!4332 V!8137) (_size!1839 (_ BitVec 32)) (_keys!6598 array!12013) (_values!4474 array!12011) (_vacant!1839 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3580)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22547 (= call!22551 (arrayContainsKey!0 (_keys!6598 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!118639 () Bool)

(declare-fun e!157157 () Bool)

(assert (=> start!23118 (=> (not res!118639) (not e!157157))))

(declare-fun valid!1412 (LongMapFixedSize!3580) Bool)

(assert (=> start!23118 (= res!118639 (valid!1412 thiss!1504))))

(assert (=> start!23118 e!157157))

(declare-fun e!157156 () Bool)

(assert (=> start!23118 e!157156))

(assert (=> start!23118 true))

(declare-fun b!242156 () Bool)

(declare-fun res!118631 () Bool)

(assert (=> b!242156 (=> (not res!118631) (not e!157157))))

(assert (=> b!242156 (= res!118631 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!242157 () Bool)

(declare-datatypes ((Unit!7460 0))(
  ( (Unit!7461) )
))
(declare-fun e!157163 () Unit!7460)

(declare-fun lt!121553 () Unit!7460)

(assert (=> b!242157 (= e!157163 lt!121553)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!359 (array!12013 array!12011 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) Int) Unit!7460)

(assert (=> b!242157 (= lt!121553 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!359 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)))))

(declare-fun c!40406 () Bool)

(declare-datatypes ((SeekEntryResult!1063 0))(
  ( (MissingZero!1063 (index!6422 (_ BitVec 32))) (Found!1063 (index!6423 (_ BitVec 32))) (Intermediate!1063 (undefined!1875 Bool) (index!6424 (_ BitVec 32)) (x!24268 (_ BitVec 32))) (Undefined!1063) (MissingVacant!1063 (index!6425 (_ BitVec 32))) )
))
(declare-fun lt!121555 () SeekEntryResult!1063)

(get-info :version)

(assert (=> b!242157 (= c!40406 ((_ is MissingZero!1063) lt!121555))))

(declare-fun e!157162 () Bool)

(assert (=> b!242157 e!157162))

(declare-fun mapNonEmpty!10792 () Bool)

(declare-fun mapRes!10792 () Bool)

(declare-fun tp!22729 () Bool)

(declare-fun e!157161 () Bool)

(assert (=> mapNonEmpty!10792 (= mapRes!10792 (and tp!22729 e!157161))))

(declare-fun mapRest!10792 () (Array (_ BitVec 32) ValueCell!2840))

(declare-fun mapKey!10792 () (_ BitVec 32))

(declare-fun mapValue!10792 () ValueCell!2840)

(assert (=> mapNonEmpty!10792 (= (arr!5703 (_values!4474 thiss!1504)) (store mapRest!10792 mapKey!10792 mapValue!10792))))

(declare-fun b!242158 () Bool)

(declare-fun e!157155 () Bool)

(declare-fun e!157166 () Bool)

(assert (=> b!242158 (= e!157155 e!157166)))

(declare-fun res!118636 () Bool)

(assert (=> b!242158 (=> res!118636 e!157166)))

(declare-datatypes ((List!3620 0))(
  ( (Nil!3617) (Cons!3616 (h!4273 (_ BitVec 64)) (t!8612 List!3620)) )
))
(declare-fun contains!1723 (List!3620 (_ BitVec 64)) Bool)

(assert (=> b!242158 (= res!118636 (contains!1723 Nil!3617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242159 () Bool)

(declare-fun tp_is_empty!6367 () Bool)

(assert (=> b!242159 (= e!157161 tp_is_empty!6367)))

(declare-fun b!242160 () Bool)

(declare-fun e!157168 () Bool)

(assert (=> b!242160 (= e!157168 (not call!22551))))

(declare-fun b!242161 () Bool)

(assert (=> b!242161 (= e!157166 (contains!1723 Nil!3617 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242162 () Bool)

(declare-fun e!157159 () Bool)

(assert (=> b!242162 (= e!157159 ((_ is Undefined!1063) lt!121555))))

(declare-fun e!157154 () Bool)

(declare-fun array_inv!3765 (array!12013) Bool)

(declare-fun array_inv!3766 (array!12011) Bool)

(assert (=> b!242163 (= e!157156 (and tp!22728 tp_is_empty!6367 (array_inv!3765 (_keys!6598 thiss!1504)) (array_inv!3766 (_values!4474 thiss!1504)) e!157154))))

(declare-fun b!242164 () Bool)

(declare-fun e!157160 () Unit!7460)

(declare-fun Unit!7462 () Unit!7460)

(assert (=> b!242164 (= e!157160 Unit!7462)))

(declare-fun b!242165 () Bool)

(declare-fun res!118632 () Bool)

(assert (=> b!242165 (=> (not res!118632) (not e!157155))))

(declare-fun noDuplicate!90 (List!3620) Bool)

(assert (=> b!242165 (= res!118632 (noDuplicate!90 Nil!3617))))

(declare-fun b!242166 () Bool)

(declare-fun c!40408 () Bool)

(assert (=> b!242166 (= c!40408 ((_ is MissingVacant!1063) lt!121555))))

(assert (=> b!242166 (= e!157162 e!157159)))

(declare-fun bm!22548 () Bool)

(declare-fun call!22550 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22548 (= call!22550 (inRange!0 (ite c!40406 (index!6422 lt!121555) (index!6425 lt!121555)) (mask!10571 thiss!1504)))))

(declare-fun b!242167 () Bool)

(declare-fun res!118630 () Bool)

(assert (=> b!242167 (=> (not res!118630) (not e!157168))))

(assert (=> b!242167 (= res!118630 (= (select (arr!5704 (_keys!6598 thiss!1504)) (index!6422 lt!121555)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242168 () Bool)

(declare-fun res!118638 () Bool)

(assert (=> b!242168 (= res!118638 (= (select (arr!5704 (_keys!6598 thiss!1504)) (index!6425 lt!121555)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157158 () Bool)

(assert (=> b!242168 (=> (not res!118638) (not e!157158))))

(declare-fun b!242169 () Bool)

(assert (=> b!242169 (= e!157158 (not call!22551))))

(declare-fun b!242170 () Bool)

(declare-fun Unit!7463 () Unit!7460)

(assert (=> b!242170 (= e!157163 Unit!7463)))

(declare-fun lt!121554 () Unit!7460)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!359 (array!12013 array!12011 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) Int) Unit!7460)

(assert (=> b!242170 (= lt!121554 (lemmaInListMapThenSeekEntryOrOpenFindsIt!359 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)))))

(assert (=> b!242170 false))

(declare-fun b!242171 () Bool)

(declare-fun e!157165 () Bool)

(assert (=> b!242171 (= e!157154 (and e!157165 mapRes!10792))))

(declare-fun condMapEmpty!10792 () Bool)

(declare-fun mapDefault!10792 () ValueCell!2840)

(assert (=> b!242171 (= condMapEmpty!10792 (= (arr!5703 (_values!4474 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2840)) mapDefault!10792)))))

(declare-fun b!242172 () Bool)

(declare-fun e!157164 () Bool)

(assert (=> b!242172 (= e!157164 e!157155)))

(declare-fun res!118629 () Bool)

(assert (=> b!242172 (=> (not res!118629) (not e!157155))))

(assert (=> b!242172 (= res!118629 (and (bvslt (size!6047 (_keys!6598 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6598 thiss!1504)))))))

(declare-fun lt!121552 () Unit!7460)

(assert (=> b!242172 (= lt!121552 e!157160)))

(declare-fun c!40405 () Bool)

(assert (=> b!242172 (= c!40405 (arrayContainsKey!0 (_keys!6598 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10792 () Bool)

(assert (=> mapIsEmpty!10792 mapRes!10792))

(declare-fun b!242173 () Bool)

(declare-fun res!118637 () Bool)

(assert (=> b!242173 (=> (not res!118637) (not e!157168))))

(assert (=> b!242173 (= res!118637 call!22550)))

(assert (=> b!242173 (= e!157162 e!157168)))

(declare-fun b!242174 () Bool)

(assert (=> b!242174 (= e!157159 e!157158)))

(declare-fun res!118633 () Bool)

(assert (=> b!242174 (= res!118633 call!22550)))

(assert (=> b!242174 (=> (not res!118633) (not e!157158))))

(declare-fun b!242175 () Bool)

(assert (=> b!242175 (= e!157165 tp_is_empty!6367)))

(declare-fun b!242176 () Bool)

(declare-fun e!157169 () Bool)

(assert (=> b!242176 (= e!157169 e!157164)))

(declare-fun res!118634 () Bool)

(assert (=> b!242176 (=> (not res!118634) (not e!157164))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!242176 (= res!118634 (inRange!0 index!297 (mask!10571 thiss!1504)))))

(declare-fun lt!121551 () Unit!7460)

(assert (=> b!242176 (= lt!121551 e!157163)))

(declare-fun c!40407 () Bool)

(declare-datatypes ((tuple2!4724 0))(
  ( (tuple2!4725 (_1!2373 (_ BitVec 64)) (_2!2373 V!8137)) )
))
(declare-datatypes ((List!3621 0))(
  ( (Nil!3618) (Cons!3617 (h!4274 tuple2!4724) (t!8613 List!3621)) )
))
(declare-datatypes ((ListLongMap!3627 0))(
  ( (ListLongMap!3628 (toList!1829 List!3621)) )
))
(declare-fun contains!1724 (ListLongMap!3627 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1338 (array!12013 array!12011 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 32) Int) ListLongMap!3627)

(assert (=> b!242176 (= c!40407 (contains!1724 (getCurrentListMap!1338 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) key!932))))

(declare-fun b!242177 () Bool)

(declare-fun Unit!7464 () Unit!7460)

(assert (=> b!242177 (= e!157160 Unit!7464)))

(declare-fun lt!121550 () Unit!7460)

(declare-fun lemmaArrayContainsKeyThenInListMap!171 (array!12013 array!12011 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) (_ BitVec 32) Int) Unit!7460)

(assert (=> b!242177 (= lt!121550 (lemmaArrayContainsKeyThenInListMap!171 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(assert (=> b!242177 false))

(declare-fun b!242178 () Bool)

(assert (=> b!242178 (= e!157157 e!157169)))

(declare-fun res!118635 () Bool)

(assert (=> b!242178 (=> (not res!118635) (not e!157169))))

(assert (=> b!242178 (= res!118635 (or (= lt!121555 (MissingZero!1063 index!297)) (= lt!121555 (MissingVacant!1063 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12013 (_ BitVec 32)) SeekEntryResult!1063)

(assert (=> b!242178 (= lt!121555 (seekEntryOrOpen!0 key!932 (_keys!6598 thiss!1504) (mask!10571 thiss!1504)))))

(assert (= (and start!23118 res!118639) b!242156))

(assert (= (and b!242156 res!118631) b!242178))

(assert (= (and b!242178 res!118635) b!242176))

(assert (= (and b!242176 c!40407) b!242170))

(assert (= (and b!242176 (not c!40407)) b!242157))

(assert (= (and b!242157 c!40406) b!242173))

(assert (= (and b!242157 (not c!40406)) b!242166))

(assert (= (and b!242173 res!118637) b!242167))

(assert (= (and b!242167 res!118630) b!242160))

(assert (= (and b!242166 c!40408) b!242174))

(assert (= (and b!242166 (not c!40408)) b!242162))

(assert (= (and b!242174 res!118633) b!242168))

(assert (= (and b!242168 res!118638) b!242169))

(assert (= (or b!242173 b!242174) bm!22548))

(assert (= (or b!242160 b!242169) bm!22547))

(assert (= (and b!242176 res!118634) b!242172))

(assert (= (and b!242172 c!40405) b!242177))

(assert (= (and b!242172 (not c!40405)) b!242164))

(assert (= (and b!242172 res!118629) b!242165))

(assert (= (and b!242165 res!118632) b!242158))

(assert (= (and b!242158 (not res!118636)) b!242161))

(assert (= (and b!242171 condMapEmpty!10792) mapIsEmpty!10792))

(assert (= (and b!242171 (not condMapEmpty!10792)) mapNonEmpty!10792))

(assert (= (and mapNonEmpty!10792 ((_ is ValueCellFull!2840) mapValue!10792)) b!242159))

(assert (= (and b!242171 ((_ is ValueCellFull!2840) mapDefault!10792)) b!242175))

(assert (= b!242163 b!242171))

(assert (= start!23118 b!242163))

(declare-fun m!260571 () Bool)

(assert (=> mapNonEmpty!10792 m!260571))

(declare-fun m!260573 () Bool)

(assert (=> b!242172 m!260573))

(declare-fun m!260575 () Bool)

(assert (=> bm!22548 m!260575))

(declare-fun m!260577 () Bool)

(assert (=> start!23118 m!260577))

(declare-fun m!260579 () Bool)

(assert (=> b!242177 m!260579))

(declare-fun m!260581 () Bool)

(assert (=> b!242168 m!260581))

(declare-fun m!260583 () Bool)

(assert (=> b!242170 m!260583))

(declare-fun m!260585 () Bool)

(assert (=> b!242157 m!260585))

(declare-fun m!260587 () Bool)

(assert (=> b!242161 m!260587))

(assert (=> bm!22547 m!260573))

(declare-fun m!260589 () Bool)

(assert (=> b!242158 m!260589))

(declare-fun m!260591 () Bool)

(assert (=> b!242176 m!260591))

(declare-fun m!260593 () Bool)

(assert (=> b!242176 m!260593))

(assert (=> b!242176 m!260593))

(declare-fun m!260595 () Bool)

(assert (=> b!242176 m!260595))

(declare-fun m!260597 () Bool)

(assert (=> b!242167 m!260597))

(declare-fun m!260599 () Bool)

(assert (=> b!242178 m!260599))

(declare-fun m!260601 () Bool)

(assert (=> b!242163 m!260601))

(declare-fun m!260603 () Bool)

(assert (=> b!242163 m!260603))

(declare-fun m!260605 () Bool)

(assert (=> b!242165 m!260605))

(check-sat (not b!242176) b_and!13455 (not b!242163) (not b!242172) tp_is_empty!6367 (not bm!22548) (not b!242158) (not b!242165) (not b_next!6505) (not b!242178) (not start!23118) (not mapNonEmpty!10792) (not b!242157) (not b!242170) (not b!242177) (not bm!22547) (not b!242161))
(check-sat b_and!13455 (not b_next!6505))
(get-model)

(declare-fun d!59819 () Bool)

(declare-fun e!157268 () Bool)

(assert (=> d!59819 e!157268))

(declare-fun res!118710 () Bool)

(assert (=> d!59819 (=> (not res!118710) (not e!157268))))

(declare-fun lt!121597 () SeekEntryResult!1063)

(assert (=> d!59819 (= res!118710 ((_ is Found!1063) lt!121597))))

(assert (=> d!59819 (= lt!121597 (seekEntryOrOpen!0 key!932 (_keys!6598 thiss!1504) (mask!10571 thiss!1504)))))

(declare-fun lt!121596 () Unit!7460)

(declare-fun choose!1135 (array!12013 array!12011 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) Int) Unit!7460)

(assert (=> d!59819 (= lt!121596 (choose!1135 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59819 (validMask!0 (mask!10571 thiss!1504))))

(assert (=> d!59819 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!359 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)) lt!121596)))

(declare-fun b!242321 () Bool)

(declare-fun res!118711 () Bool)

(assert (=> b!242321 (=> (not res!118711) (not e!157268))))

(assert (=> b!242321 (= res!118711 (inRange!0 (index!6423 lt!121597) (mask!10571 thiss!1504)))))

(declare-fun b!242322 () Bool)

(assert (=> b!242322 (= e!157268 (= (select (arr!5704 (_keys!6598 thiss!1504)) (index!6423 lt!121597)) key!932))))

(assert (=> b!242322 (and (bvsge (index!6423 lt!121597) #b00000000000000000000000000000000) (bvslt (index!6423 lt!121597) (size!6047 (_keys!6598 thiss!1504))))))

(assert (= (and d!59819 res!118710) b!242321))

(assert (= (and b!242321 res!118711) b!242322))

(assert (=> d!59819 m!260599))

(declare-fun m!260679 () Bool)

(assert (=> d!59819 m!260679))

(declare-fun m!260681 () Bool)

(assert (=> d!59819 m!260681))

(declare-fun m!260683 () Bool)

(assert (=> b!242321 m!260683))

(declare-fun m!260685 () Bool)

(assert (=> b!242322 m!260685))

(assert (=> b!242170 d!59819))

(declare-fun d!59821 () Bool)

(declare-fun lt!121600 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!158 (List!3620) (InoxSet (_ BitVec 64)))

(assert (=> d!59821 (= lt!121600 (select (content!158 Nil!3617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157274 () Bool)

(assert (=> d!59821 (= lt!121600 e!157274)))

(declare-fun res!118716 () Bool)

(assert (=> d!59821 (=> (not res!118716) (not e!157274))))

(assert (=> d!59821 (= res!118716 ((_ is Cons!3616) Nil!3617))))

(assert (=> d!59821 (= (contains!1723 Nil!3617 #b1000000000000000000000000000000000000000000000000000000000000000) lt!121600)))

(declare-fun b!242327 () Bool)

(declare-fun e!157273 () Bool)

(assert (=> b!242327 (= e!157274 e!157273)))

(declare-fun res!118717 () Bool)

(assert (=> b!242327 (=> res!118717 e!157273)))

(assert (=> b!242327 (= res!118717 (= (h!4273 Nil!3617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242328 () Bool)

(assert (=> b!242328 (= e!157273 (contains!1723 (t!8612 Nil!3617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59821 res!118716) b!242327))

(assert (= (and b!242327 (not res!118717)) b!242328))

(declare-fun m!260687 () Bool)

(assert (=> d!59821 m!260687))

(declare-fun m!260689 () Bool)

(assert (=> d!59821 m!260689))

(declare-fun m!260691 () Bool)

(assert (=> b!242328 m!260691))

(assert (=> b!242161 d!59821))

(declare-fun d!59823 () Bool)

(declare-fun res!118722 () Bool)

(declare-fun e!157279 () Bool)

(assert (=> d!59823 (=> res!118722 e!157279)))

(assert (=> d!59823 (= res!118722 (= (select (arr!5704 (_keys!6598 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59823 (= (arrayContainsKey!0 (_keys!6598 thiss!1504) key!932 #b00000000000000000000000000000000) e!157279)))

(declare-fun b!242333 () Bool)

(declare-fun e!157280 () Bool)

(assert (=> b!242333 (= e!157279 e!157280)))

(declare-fun res!118723 () Bool)

(assert (=> b!242333 (=> (not res!118723) (not e!157280))))

(assert (=> b!242333 (= res!118723 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6047 (_keys!6598 thiss!1504))))))

(declare-fun b!242334 () Bool)

(assert (=> b!242334 (= e!157280 (arrayContainsKey!0 (_keys!6598 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59823 (not res!118722)) b!242333))

(assert (= (and b!242333 res!118723) b!242334))

(declare-fun m!260693 () Bool)

(assert (=> d!59823 m!260693))

(declare-fun m!260695 () Bool)

(assert (=> b!242334 m!260695))

(assert (=> b!242172 d!59823))

(declare-fun d!59825 () Bool)

(assert (=> d!59825 (= (array_inv!3765 (_keys!6598 thiss!1504)) (bvsge (size!6047 (_keys!6598 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242163 d!59825))

(declare-fun d!59827 () Bool)

(assert (=> d!59827 (= (array_inv!3766 (_values!4474 thiss!1504)) (bvsge (size!6046 (_values!4474 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242163 d!59827))

(assert (=> bm!22547 d!59823))

(declare-fun d!59829 () Bool)

(declare-fun res!118728 () Bool)

(declare-fun e!157285 () Bool)

(assert (=> d!59829 (=> res!118728 e!157285)))

(assert (=> d!59829 (= res!118728 ((_ is Nil!3617) Nil!3617))))

(assert (=> d!59829 (= (noDuplicate!90 Nil!3617) e!157285)))

(declare-fun b!242339 () Bool)

(declare-fun e!157286 () Bool)

(assert (=> b!242339 (= e!157285 e!157286)))

(declare-fun res!118729 () Bool)

(assert (=> b!242339 (=> (not res!118729) (not e!157286))))

(assert (=> b!242339 (= res!118729 (not (contains!1723 (t!8612 Nil!3617) (h!4273 Nil!3617))))))

(declare-fun b!242340 () Bool)

(assert (=> b!242340 (= e!157286 (noDuplicate!90 (t!8612 Nil!3617)))))

(assert (= (and d!59829 (not res!118728)) b!242339))

(assert (= (and b!242339 res!118729) b!242340))

(declare-fun m!260697 () Bool)

(assert (=> b!242339 m!260697))

(declare-fun m!260699 () Bool)

(assert (=> b!242340 m!260699))

(assert (=> b!242165 d!59829))

(declare-fun b!242357 () Bool)

(declare-fun e!157295 () Bool)

(declare-fun call!22568 () Bool)

(assert (=> b!242357 (= e!157295 (not call!22568))))

(declare-fun bm!22565 () Bool)

(assert (=> bm!22565 (= call!22568 (arrayContainsKey!0 (_keys!6598 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun c!40437 () Bool)

(declare-fun lt!121606 () SeekEntryResult!1063)

(declare-fun bm!22566 () Bool)

(declare-fun call!22569 () Bool)

(assert (=> bm!22566 (= call!22569 (inRange!0 (ite c!40437 (index!6422 lt!121606) (index!6425 lt!121606)) (mask!10571 thiss!1504)))))

(declare-fun b!242358 () Bool)

(declare-fun e!157296 () Bool)

(declare-fun e!157298 () Bool)

(assert (=> b!242358 (= e!157296 e!157298)))

(declare-fun c!40438 () Bool)

(assert (=> b!242358 (= c!40438 ((_ is MissingVacant!1063) lt!121606))))

(declare-fun b!242359 () Bool)

(assert (=> b!242359 (= e!157298 ((_ is Undefined!1063) lt!121606))))

(declare-fun b!242360 () Bool)

(declare-fun e!157297 () Bool)

(assert (=> b!242360 (= e!157296 e!157297)))

(declare-fun res!118740 () Bool)

(assert (=> b!242360 (= res!118740 call!22569)))

(assert (=> b!242360 (=> (not res!118740) (not e!157297))))

(declare-fun b!242361 () Bool)

(assert (=> b!242361 (and (bvsge (index!6422 lt!121606) #b00000000000000000000000000000000) (bvslt (index!6422 lt!121606) (size!6047 (_keys!6598 thiss!1504))))))

(declare-fun res!118741 () Bool)

(assert (=> b!242361 (= res!118741 (= (select (arr!5704 (_keys!6598 thiss!1504)) (index!6422 lt!121606)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242361 (=> (not res!118741) (not e!157297))))

(declare-fun b!242362 () Bool)

(declare-fun res!118739 () Bool)

(assert (=> b!242362 (=> (not res!118739) (not e!157295))))

(assert (=> b!242362 (= res!118739 call!22569)))

(assert (=> b!242362 (= e!157298 e!157295)))

(declare-fun d!59831 () Bool)

(assert (=> d!59831 e!157296))

(assert (=> d!59831 (= c!40437 ((_ is MissingZero!1063) lt!121606))))

(assert (=> d!59831 (= lt!121606 (seekEntryOrOpen!0 key!932 (_keys!6598 thiss!1504) (mask!10571 thiss!1504)))))

(declare-fun lt!121605 () Unit!7460)

(declare-fun choose!1136 (array!12013 array!12011 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) Int) Unit!7460)

(assert (=> d!59831 (= lt!121605 (choose!1136 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)))))

(assert (=> d!59831 (validMask!0 (mask!10571 thiss!1504))))

(assert (=> d!59831 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!359 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 (defaultEntry!4491 thiss!1504)) lt!121605)))

(declare-fun b!242363 () Bool)

(assert (=> b!242363 (= e!157297 (not call!22568))))

(declare-fun b!242364 () Bool)

(declare-fun res!118738 () Bool)

(assert (=> b!242364 (=> (not res!118738) (not e!157295))))

(assert (=> b!242364 (= res!118738 (= (select (arr!5704 (_keys!6598 thiss!1504)) (index!6425 lt!121606)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!242364 (and (bvsge (index!6425 lt!121606) #b00000000000000000000000000000000) (bvslt (index!6425 lt!121606) (size!6047 (_keys!6598 thiss!1504))))))

(assert (= (and d!59831 c!40437) b!242360))

(assert (= (and d!59831 (not c!40437)) b!242358))

(assert (= (and b!242360 res!118740) b!242361))

(assert (= (and b!242361 res!118741) b!242363))

(assert (= (and b!242358 c!40438) b!242362))

(assert (= (and b!242358 (not c!40438)) b!242359))

(assert (= (and b!242362 res!118739) b!242364))

(assert (= (and b!242364 res!118738) b!242357))

(assert (= (or b!242360 b!242362) bm!22566))

(assert (= (or b!242363 b!242357) bm!22565))

(declare-fun m!260701 () Bool)

(assert (=> b!242361 m!260701))

(declare-fun m!260703 () Bool)

(assert (=> b!242364 m!260703))

(assert (=> d!59831 m!260599))

(declare-fun m!260705 () Bool)

(assert (=> d!59831 m!260705))

(assert (=> d!59831 m!260681))

(assert (=> bm!22565 m!260573))

(declare-fun m!260707 () Bool)

(assert (=> bm!22566 m!260707))

(assert (=> b!242157 d!59831))

(declare-fun d!59833 () Bool)

(assert (=> d!59833 (= (inRange!0 (ite c!40406 (index!6422 lt!121555) (index!6425 lt!121555)) (mask!10571 thiss!1504)) (and (bvsge (ite c!40406 (index!6422 lt!121555) (index!6425 lt!121555)) #b00000000000000000000000000000000) (bvslt (ite c!40406 (index!6422 lt!121555) (index!6425 lt!121555)) (bvadd (mask!10571 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22548 d!59833))

(declare-fun d!59835 () Bool)

(assert (=> d!59835 (= (inRange!0 index!297 (mask!10571 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10571 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!242176 d!59835))

(declare-fun d!59837 () Bool)

(declare-fun e!157303 () Bool)

(assert (=> d!59837 e!157303))

(declare-fun res!118744 () Bool)

(assert (=> d!59837 (=> res!118744 e!157303)))

(declare-fun lt!121615 () Bool)

(assert (=> d!59837 (= res!118744 (not lt!121615))))

(declare-fun lt!121616 () Bool)

(assert (=> d!59837 (= lt!121615 lt!121616)))

(declare-fun lt!121617 () Unit!7460)

(declare-fun e!157304 () Unit!7460)

(assert (=> d!59837 (= lt!121617 e!157304)))

(declare-fun c!40441 () Bool)

(assert (=> d!59837 (= c!40441 lt!121616)))

(declare-fun containsKey!272 (List!3621 (_ BitVec 64)) Bool)

(assert (=> d!59837 (= lt!121616 (containsKey!272 (toList!1829 (getCurrentListMap!1338 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504))) key!932))))

(assert (=> d!59837 (= (contains!1724 (getCurrentListMap!1338 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) key!932) lt!121615)))

(declare-fun b!242371 () Bool)

(declare-fun lt!121618 () Unit!7460)

(assert (=> b!242371 (= e!157304 lt!121618)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!221 (List!3621 (_ BitVec 64)) Unit!7460)

(assert (=> b!242371 (= lt!121618 (lemmaContainsKeyImpliesGetValueByKeyDefined!221 (toList!1829 (getCurrentListMap!1338 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504))) key!932))))

(declare-datatypes ((Option!286 0))(
  ( (Some!285 (v!5267 V!8137)) (None!284) )
))
(declare-fun isDefined!222 (Option!286) Bool)

(declare-fun getValueByKey!280 (List!3621 (_ BitVec 64)) Option!286)

(assert (=> b!242371 (isDefined!222 (getValueByKey!280 (toList!1829 (getCurrentListMap!1338 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504))) key!932))))

(declare-fun b!242372 () Bool)

(declare-fun Unit!7473 () Unit!7460)

(assert (=> b!242372 (= e!157304 Unit!7473)))

(declare-fun b!242373 () Bool)

(assert (=> b!242373 (= e!157303 (isDefined!222 (getValueByKey!280 (toList!1829 (getCurrentListMap!1338 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504))) key!932)))))

(assert (= (and d!59837 c!40441) b!242371))

(assert (= (and d!59837 (not c!40441)) b!242372))

(assert (= (and d!59837 (not res!118744)) b!242373))

(declare-fun m!260709 () Bool)

(assert (=> d!59837 m!260709))

(declare-fun m!260711 () Bool)

(assert (=> b!242371 m!260711))

(declare-fun m!260713 () Bool)

(assert (=> b!242371 m!260713))

(assert (=> b!242371 m!260713))

(declare-fun m!260715 () Bool)

(assert (=> b!242371 m!260715))

(assert (=> b!242373 m!260713))

(assert (=> b!242373 m!260713))

(assert (=> b!242373 m!260715))

(assert (=> b!242176 d!59837))

(declare-fun b!242416 () Bool)

(declare-fun e!157341 () Bool)

(declare-fun lt!121677 () ListLongMap!3627)

(declare-fun apply!224 (ListLongMap!3627 (_ BitVec 64)) V!8137)

(assert (=> b!242416 (= e!157341 (= (apply!224 lt!121677 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4332 thiss!1504)))))

(declare-fun b!242417 () Bool)

(declare-fun e!157342 () Bool)

(declare-fun call!22587 () Bool)

(assert (=> b!242417 (= e!157342 (not call!22587))))

(declare-fun b!242418 () Bool)

(declare-fun e!157332 () Bool)

(assert (=> b!242418 (= e!157332 e!157342)))

(declare-fun c!40459 () Bool)

(assert (=> b!242418 (= c!40459 (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22581 () Bool)

(declare-fun call!22589 () ListLongMap!3627)

(declare-fun getCurrentListMapNoExtraKeys!540 (array!12013 array!12011 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 32) Int) ListLongMap!3627)

(assert (=> bm!22581 (= call!22589 (getCurrentListMapNoExtraKeys!540 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(declare-fun bm!22582 () Bool)

(declare-fun call!22588 () ListLongMap!3627)

(declare-fun call!22585 () ListLongMap!3627)

(assert (=> bm!22582 (= call!22588 call!22585)))

(declare-fun b!242419 () Bool)

(declare-fun e!157334 () Bool)

(declare-fun call!22584 () Bool)

(assert (=> b!242419 (= e!157334 (not call!22584))))

(declare-fun bm!22583 () Bool)

(declare-fun call!22590 () ListLongMap!3627)

(declare-fun call!22586 () ListLongMap!3627)

(assert (=> bm!22583 (= call!22590 call!22586)))

(declare-fun b!242420 () Bool)

(declare-fun e!157337 () ListLongMap!3627)

(declare-fun e!157335 () ListLongMap!3627)

(assert (=> b!242420 (= e!157337 e!157335)))

(declare-fun c!40455 () Bool)

(assert (=> b!242420 (= c!40455 (and (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!59839 () Bool)

(assert (=> d!59839 e!157332))

(declare-fun res!118767 () Bool)

(assert (=> d!59839 (=> (not res!118767) (not e!157332))))

(assert (=> d!59839 (= res!118767 (or (bvsge #b00000000000000000000000000000000 (size!6047 (_keys!6598 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6598 thiss!1504))))))))

(declare-fun lt!121678 () ListLongMap!3627)

(assert (=> d!59839 (= lt!121677 lt!121678)))

(declare-fun lt!121665 () Unit!7460)

(declare-fun e!157338 () Unit!7460)

(assert (=> d!59839 (= lt!121665 e!157338)))

(declare-fun c!40454 () Bool)

(declare-fun e!157340 () Bool)

(assert (=> d!59839 (= c!40454 e!157340)))

(declare-fun res!118771 () Bool)

(assert (=> d!59839 (=> (not res!118771) (not e!157340))))

(assert (=> d!59839 (= res!118771 (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6598 thiss!1504))))))

(assert (=> d!59839 (= lt!121678 e!157337)))

(declare-fun c!40458 () Bool)

(assert (=> d!59839 (= c!40458 (and (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59839 (validMask!0 (mask!10571 thiss!1504))))

(assert (=> d!59839 (= (getCurrentListMap!1338 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) lt!121677)))

(declare-fun b!242421 () Bool)

(declare-fun res!118769 () Bool)

(assert (=> b!242421 (=> (not res!118769) (not e!157332))))

(assert (=> b!242421 (= res!118769 e!157334)))

(declare-fun c!40457 () Bool)

(assert (=> b!242421 (= c!40457 (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!242422 () Bool)

(declare-fun e!157343 () Bool)

(declare-fun e!157339 () Bool)

(assert (=> b!242422 (= e!157343 e!157339)))

(declare-fun res!118765 () Bool)

(assert (=> b!242422 (=> (not res!118765) (not e!157339))))

(assert (=> b!242422 (= res!118765 (contains!1724 lt!121677 (select (arr!5704 (_keys!6598 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!242422 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6598 thiss!1504))))))

(declare-fun b!242423 () Bool)

(assert (=> b!242423 (= e!157335 call!22590)))

(declare-fun b!242424 () Bool)

(declare-fun e!157333 () ListLongMap!3627)

(assert (=> b!242424 (= e!157333 call!22590)))

(declare-fun b!242425 () Bool)

(declare-fun c!40456 () Bool)

(assert (=> b!242425 (= c!40456 (and (not (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4228 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!242425 (= e!157335 e!157333)))

(declare-fun b!242426 () Bool)

(assert (=> b!242426 (= e!157334 e!157341)))

(declare-fun res!118763 () Bool)

(assert (=> b!242426 (= res!118763 call!22584)))

(assert (=> b!242426 (=> (not res!118763) (not e!157341))))

(declare-fun b!242427 () Bool)

(declare-fun +!657 (ListLongMap!3627 tuple2!4724) ListLongMap!3627)

(assert (=> b!242427 (= e!157337 (+!657 call!22586 (tuple2!4725 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4332 thiss!1504))))))

(declare-fun b!242428 () Bool)

(declare-fun e!157331 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!242428 (= e!157331 (validKeyInArray!0 (select (arr!5704 (_keys!6598 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!242429 () Bool)

(declare-fun Unit!7474 () Unit!7460)

(assert (=> b!242429 (= e!157338 Unit!7474)))

(declare-fun b!242430 () Bool)

(declare-fun lt!121675 () Unit!7460)

(assert (=> b!242430 (= e!157338 lt!121675)))

(declare-fun lt!121683 () ListLongMap!3627)

(assert (=> b!242430 (= lt!121683 (getCurrentListMapNoExtraKeys!540 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(declare-fun lt!121679 () (_ BitVec 64))

(assert (=> b!242430 (= lt!121679 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121674 () (_ BitVec 64))

(assert (=> b!242430 (= lt!121674 (select (arr!5704 (_keys!6598 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121684 () Unit!7460)

(declare-fun addStillContains!200 (ListLongMap!3627 (_ BitVec 64) V!8137 (_ BitVec 64)) Unit!7460)

(assert (=> b!242430 (= lt!121684 (addStillContains!200 lt!121683 lt!121679 (zeroValue!4332 thiss!1504) lt!121674))))

(assert (=> b!242430 (contains!1724 (+!657 lt!121683 (tuple2!4725 lt!121679 (zeroValue!4332 thiss!1504))) lt!121674)))

(declare-fun lt!121673 () Unit!7460)

(assert (=> b!242430 (= lt!121673 lt!121684)))

(declare-fun lt!121664 () ListLongMap!3627)

(assert (=> b!242430 (= lt!121664 (getCurrentListMapNoExtraKeys!540 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(declare-fun lt!121680 () (_ BitVec 64))

(assert (=> b!242430 (= lt!121680 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121682 () (_ BitVec 64))

(assert (=> b!242430 (= lt!121682 (select (arr!5704 (_keys!6598 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121669 () Unit!7460)

(declare-fun addApplyDifferent!200 (ListLongMap!3627 (_ BitVec 64) V!8137 (_ BitVec 64)) Unit!7460)

(assert (=> b!242430 (= lt!121669 (addApplyDifferent!200 lt!121664 lt!121680 (minValue!4332 thiss!1504) lt!121682))))

(assert (=> b!242430 (= (apply!224 (+!657 lt!121664 (tuple2!4725 lt!121680 (minValue!4332 thiss!1504))) lt!121682) (apply!224 lt!121664 lt!121682))))

(declare-fun lt!121667 () Unit!7460)

(assert (=> b!242430 (= lt!121667 lt!121669)))

(declare-fun lt!121670 () ListLongMap!3627)

(assert (=> b!242430 (= lt!121670 (getCurrentListMapNoExtraKeys!540 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(declare-fun lt!121672 () (_ BitVec 64))

(assert (=> b!242430 (= lt!121672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121666 () (_ BitVec 64))

(assert (=> b!242430 (= lt!121666 (select (arr!5704 (_keys!6598 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121681 () Unit!7460)

(assert (=> b!242430 (= lt!121681 (addApplyDifferent!200 lt!121670 lt!121672 (zeroValue!4332 thiss!1504) lt!121666))))

(assert (=> b!242430 (= (apply!224 (+!657 lt!121670 (tuple2!4725 lt!121672 (zeroValue!4332 thiss!1504))) lt!121666) (apply!224 lt!121670 lt!121666))))

(declare-fun lt!121663 () Unit!7460)

(assert (=> b!242430 (= lt!121663 lt!121681)))

(declare-fun lt!121668 () ListLongMap!3627)

(assert (=> b!242430 (= lt!121668 (getCurrentListMapNoExtraKeys!540 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(declare-fun lt!121676 () (_ BitVec 64))

(assert (=> b!242430 (= lt!121676 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121671 () (_ BitVec 64))

(assert (=> b!242430 (= lt!121671 (select (arr!5704 (_keys!6598 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!242430 (= lt!121675 (addApplyDifferent!200 lt!121668 lt!121676 (minValue!4332 thiss!1504) lt!121671))))

(assert (=> b!242430 (= (apply!224 (+!657 lt!121668 (tuple2!4725 lt!121676 (minValue!4332 thiss!1504))) lt!121671) (apply!224 lt!121668 lt!121671))))

(declare-fun b!242431 () Bool)

(declare-fun e!157336 () Bool)

(assert (=> b!242431 (= e!157342 e!157336)))

(declare-fun res!118768 () Bool)

(assert (=> b!242431 (= res!118768 call!22587)))

(assert (=> b!242431 (=> (not res!118768) (not e!157336))))

(declare-fun b!242432 () Bool)

(assert (=> b!242432 (= e!157333 call!22588)))

(declare-fun b!242433 () Bool)

(declare-fun get!2926 (ValueCell!2840 V!8137) V!8137)

(declare-fun dynLambda!558 (Int (_ BitVec 64)) V!8137)

(assert (=> b!242433 (= e!157339 (= (apply!224 lt!121677 (select (arr!5704 (_keys!6598 thiss!1504)) #b00000000000000000000000000000000)) (get!2926 (select (arr!5703 (_values!4474 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!558 (defaultEntry!4491 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!242433 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6046 (_values!4474 thiss!1504))))))

(assert (=> b!242433 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6598 thiss!1504))))))

(declare-fun bm!22584 () Bool)

(assert (=> bm!22584 (= call!22585 call!22589)))

(declare-fun b!242434 () Bool)

(assert (=> b!242434 (= e!157340 (validKeyInArray!0 (select (arr!5704 (_keys!6598 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22585 () Bool)

(assert (=> bm!22585 (= call!22587 (contains!1724 lt!121677 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242435 () Bool)

(declare-fun res!118766 () Bool)

(assert (=> b!242435 (=> (not res!118766) (not e!157332))))

(assert (=> b!242435 (= res!118766 e!157343)))

(declare-fun res!118770 () Bool)

(assert (=> b!242435 (=> res!118770 e!157343)))

(assert (=> b!242435 (= res!118770 (not e!157331))))

(declare-fun res!118764 () Bool)

(assert (=> b!242435 (=> (not res!118764) (not e!157331))))

(assert (=> b!242435 (= res!118764 (bvslt #b00000000000000000000000000000000 (size!6047 (_keys!6598 thiss!1504))))))

(declare-fun bm!22586 () Bool)

(assert (=> bm!22586 (= call!22586 (+!657 (ite c!40458 call!22589 (ite c!40455 call!22585 call!22588)) (ite (or c!40458 c!40455) (tuple2!4725 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4332 thiss!1504)) (tuple2!4725 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4332 thiss!1504)))))))

(declare-fun bm!22587 () Bool)

(assert (=> bm!22587 (= call!22584 (contains!1724 lt!121677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242436 () Bool)

(assert (=> b!242436 (= e!157336 (= (apply!224 lt!121677 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4332 thiss!1504)))))

(assert (= (and d!59839 c!40458) b!242427))

(assert (= (and d!59839 (not c!40458)) b!242420))

(assert (= (and b!242420 c!40455) b!242423))

(assert (= (and b!242420 (not c!40455)) b!242425))

(assert (= (and b!242425 c!40456) b!242424))

(assert (= (and b!242425 (not c!40456)) b!242432))

(assert (= (or b!242424 b!242432) bm!22582))

(assert (= (or b!242423 bm!22582) bm!22584))

(assert (= (or b!242423 b!242424) bm!22583))

(assert (= (or b!242427 bm!22584) bm!22581))

(assert (= (or b!242427 bm!22583) bm!22586))

(assert (= (and d!59839 res!118771) b!242434))

(assert (= (and d!59839 c!40454) b!242430))

(assert (= (and d!59839 (not c!40454)) b!242429))

(assert (= (and d!59839 res!118767) b!242435))

(assert (= (and b!242435 res!118764) b!242428))

(assert (= (and b!242435 (not res!118770)) b!242422))

(assert (= (and b!242422 res!118765) b!242433))

(assert (= (and b!242435 res!118766) b!242421))

(assert (= (and b!242421 c!40457) b!242426))

(assert (= (and b!242421 (not c!40457)) b!242419))

(assert (= (and b!242426 res!118763) b!242416))

(assert (= (or b!242426 b!242419) bm!22587))

(assert (= (and b!242421 res!118769) b!242418))

(assert (= (and b!242418 c!40459) b!242431))

(assert (= (and b!242418 (not c!40459)) b!242417))

(assert (= (and b!242431 res!118768) b!242436))

(assert (= (or b!242431 b!242417) bm!22585))

(declare-fun b_lambda!7981 () Bool)

(assert (=> (not b_lambda!7981) (not b!242433)))

(declare-fun t!8617 () Bool)

(declare-fun tb!2953 () Bool)

(assert (=> (and b!242163 (= (defaultEntry!4491 thiss!1504) (defaultEntry!4491 thiss!1504)) t!8617) tb!2953))

(declare-fun result!5197 () Bool)

(assert (=> tb!2953 (= result!5197 tp_is_empty!6367)))

(assert (=> b!242433 t!8617))

(declare-fun b_and!13461 () Bool)

(assert (= b_and!13455 (and (=> t!8617 result!5197) b_and!13461)))

(declare-fun m!260717 () Bool)

(assert (=> b!242430 m!260717))

(declare-fun m!260719 () Bool)

(assert (=> b!242430 m!260719))

(declare-fun m!260721 () Bool)

(assert (=> b!242430 m!260721))

(declare-fun m!260723 () Bool)

(assert (=> b!242430 m!260723))

(declare-fun m!260725 () Bool)

(assert (=> b!242430 m!260725))

(declare-fun m!260727 () Bool)

(assert (=> b!242430 m!260727))

(declare-fun m!260729 () Bool)

(assert (=> b!242430 m!260729))

(declare-fun m!260731 () Bool)

(assert (=> b!242430 m!260731))

(declare-fun m!260733 () Bool)

(assert (=> b!242430 m!260733))

(declare-fun m!260735 () Bool)

(assert (=> b!242430 m!260735))

(declare-fun m!260737 () Bool)

(assert (=> b!242430 m!260737))

(declare-fun m!260739 () Bool)

(assert (=> b!242430 m!260739))

(assert (=> b!242430 m!260729))

(assert (=> b!242430 m!260725))

(declare-fun m!260741 () Bool)

(assert (=> b!242430 m!260741))

(assert (=> b!242430 m!260721))

(declare-fun m!260743 () Bool)

(assert (=> b!242430 m!260743))

(assert (=> b!242430 m!260693))

(assert (=> b!242430 m!260735))

(declare-fun m!260745 () Bool)

(assert (=> b!242430 m!260745))

(declare-fun m!260747 () Bool)

(assert (=> b!242430 m!260747))

(declare-fun m!260749 () Bool)

(assert (=> b!242416 m!260749))

(assert (=> b!242433 m!260693))

(assert (=> b!242433 m!260693))

(declare-fun m!260751 () Bool)

(assert (=> b!242433 m!260751))

(declare-fun m!260753 () Bool)

(assert (=> b!242433 m!260753))

(declare-fun m!260755 () Bool)

(assert (=> b!242433 m!260755))

(assert (=> b!242433 m!260753))

(declare-fun m!260757 () Bool)

(assert (=> b!242433 m!260757))

(assert (=> b!242433 m!260755))

(assert (=> b!242434 m!260693))

(assert (=> b!242434 m!260693))

(declare-fun m!260759 () Bool)

(assert (=> b!242434 m!260759))

(assert (=> d!59839 m!260681))

(declare-fun m!260761 () Bool)

(assert (=> b!242427 m!260761))

(declare-fun m!260763 () Bool)

(assert (=> b!242436 m!260763))

(assert (=> b!242428 m!260693))

(assert (=> b!242428 m!260693))

(assert (=> b!242428 m!260759))

(declare-fun m!260765 () Bool)

(assert (=> bm!22585 m!260765))

(declare-fun m!260767 () Bool)

(assert (=> bm!22586 m!260767))

(declare-fun m!260769 () Bool)

(assert (=> bm!22587 m!260769))

(assert (=> bm!22581 m!260719))

(assert (=> b!242422 m!260693))

(assert (=> b!242422 m!260693))

(declare-fun m!260771 () Bool)

(assert (=> b!242422 m!260771))

(assert (=> b!242176 d!59839))

(declare-fun d!59841 () Bool)

(assert (=> d!59841 (contains!1724 (getCurrentListMap!1338 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) key!932)))

(declare-fun lt!121687 () Unit!7460)

(declare-fun choose!1137 (array!12013 array!12011 (_ BitVec 32) (_ BitVec 32) V!8137 V!8137 (_ BitVec 64) (_ BitVec 32) Int) Unit!7460)

(assert (=> d!59841 (= lt!121687 (choose!1137 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)))))

(assert (=> d!59841 (validMask!0 (mask!10571 thiss!1504))))

(assert (=> d!59841 (= (lemmaArrayContainsKeyThenInListMap!171 (_keys!6598 thiss!1504) (_values!4474 thiss!1504) (mask!10571 thiss!1504) (extraKeys!4228 thiss!1504) (zeroValue!4332 thiss!1504) (minValue!4332 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4491 thiss!1504)) lt!121687)))

(declare-fun bs!8836 () Bool)

(assert (= bs!8836 d!59841))

(assert (=> bs!8836 m!260593))

(assert (=> bs!8836 m!260593))

(assert (=> bs!8836 m!260595))

(declare-fun m!260773 () Bool)

(assert (=> bs!8836 m!260773))

(assert (=> bs!8836 m!260681))

(assert (=> b!242177 d!59841))

(declare-fun d!59843 () Bool)

(declare-fun lt!121688 () Bool)

(assert (=> d!59843 (= lt!121688 (select (content!158 Nil!3617) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157345 () Bool)

(assert (=> d!59843 (= lt!121688 e!157345)))

(declare-fun res!118772 () Bool)

(assert (=> d!59843 (=> (not res!118772) (not e!157345))))

(assert (=> d!59843 (= res!118772 ((_ is Cons!3616) Nil!3617))))

(assert (=> d!59843 (= (contains!1723 Nil!3617 #b0000000000000000000000000000000000000000000000000000000000000000) lt!121688)))

(declare-fun b!242439 () Bool)

(declare-fun e!157344 () Bool)

(assert (=> b!242439 (= e!157345 e!157344)))

(declare-fun res!118773 () Bool)

(assert (=> b!242439 (=> res!118773 e!157344)))

(assert (=> b!242439 (= res!118773 (= (h!4273 Nil!3617) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242440 () Bool)

(assert (=> b!242440 (= e!157344 (contains!1723 (t!8612 Nil!3617) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59843 res!118772) b!242439))

(assert (= (and b!242439 (not res!118773)) b!242440))

(assert (=> d!59843 m!260687))

(declare-fun m!260775 () Bool)

(assert (=> d!59843 m!260775))

(declare-fun m!260777 () Bool)

(assert (=> b!242440 m!260777))

(assert (=> b!242158 d!59843))

(declare-fun b!242453 () Bool)

(declare-fun c!40466 () Bool)

(declare-fun lt!121695 () (_ BitVec 64))

(assert (=> b!242453 (= c!40466 (= lt!121695 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157354 () SeekEntryResult!1063)

(declare-fun e!157352 () SeekEntryResult!1063)

(assert (=> b!242453 (= e!157354 e!157352)))

(declare-fun b!242454 () Bool)

(declare-fun lt!121697 () SeekEntryResult!1063)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12013 (_ BitVec 32)) SeekEntryResult!1063)

(assert (=> b!242454 (= e!157352 (seekKeyOrZeroReturnVacant!0 (x!24268 lt!121697) (index!6424 lt!121697) (index!6424 lt!121697) key!932 (_keys!6598 thiss!1504) (mask!10571 thiss!1504)))))

(declare-fun b!242456 () Bool)

(assert (=> b!242456 (= e!157354 (Found!1063 (index!6424 lt!121697)))))

(declare-fun b!242457 () Bool)

(declare-fun e!157353 () SeekEntryResult!1063)

(assert (=> b!242457 (= e!157353 e!157354)))

(assert (=> b!242457 (= lt!121695 (select (arr!5704 (_keys!6598 thiss!1504)) (index!6424 lt!121697)))))

(declare-fun c!40467 () Bool)

(assert (=> b!242457 (= c!40467 (= lt!121695 key!932))))

(declare-fun b!242458 () Bool)

(assert (=> b!242458 (= e!157352 (MissingZero!1063 (index!6424 lt!121697)))))

(declare-fun d!59845 () Bool)

(declare-fun lt!121696 () SeekEntryResult!1063)

(assert (=> d!59845 (and (or ((_ is Undefined!1063) lt!121696) (not ((_ is Found!1063) lt!121696)) (and (bvsge (index!6423 lt!121696) #b00000000000000000000000000000000) (bvslt (index!6423 lt!121696) (size!6047 (_keys!6598 thiss!1504))))) (or ((_ is Undefined!1063) lt!121696) ((_ is Found!1063) lt!121696) (not ((_ is MissingZero!1063) lt!121696)) (and (bvsge (index!6422 lt!121696) #b00000000000000000000000000000000) (bvslt (index!6422 lt!121696) (size!6047 (_keys!6598 thiss!1504))))) (or ((_ is Undefined!1063) lt!121696) ((_ is Found!1063) lt!121696) ((_ is MissingZero!1063) lt!121696) (not ((_ is MissingVacant!1063) lt!121696)) (and (bvsge (index!6425 lt!121696) #b00000000000000000000000000000000) (bvslt (index!6425 lt!121696) (size!6047 (_keys!6598 thiss!1504))))) (or ((_ is Undefined!1063) lt!121696) (ite ((_ is Found!1063) lt!121696) (= (select (arr!5704 (_keys!6598 thiss!1504)) (index!6423 lt!121696)) key!932) (ite ((_ is MissingZero!1063) lt!121696) (= (select (arr!5704 (_keys!6598 thiss!1504)) (index!6422 lt!121696)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1063) lt!121696) (= (select (arr!5704 (_keys!6598 thiss!1504)) (index!6425 lt!121696)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59845 (= lt!121696 e!157353)))

(declare-fun c!40468 () Bool)

(assert (=> d!59845 (= c!40468 (and ((_ is Intermediate!1063) lt!121697) (undefined!1875 lt!121697)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12013 (_ BitVec 32)) SeekEntryResult!1063)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59845 (= lt!121697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10571 thiss!1504)) key!932 (_keys!6598 thiss!1504) (mask!10571 thiss!1504)))))

(assert (=> d!59845 (validMask!0 (mask!10571 thiss!1504))))

(assert (=> d!59845 (= (seekEntryOrOpen!0 key!932 (_keys!6598 thiss!1504) (mask!10571 thiss!1504)) lt!121696)))

(declare-fun b!242455 () Bool)

(assert (=> b!242455 (= e!157353 Undefined!1063)))

(assert (= (and d!59845 c!40468) b!242455))

(assert (= (and d!59845 (not c!40468)) b!242457))

(assert (= (and b!242457 c!40467) b!242456))

(assert (= (and b!242457 (not c!40467)) b!242453))

(assert (= (and b!242453 c!40466) b!242458))

(assert (= (and b!242453 (not c!40466)) b!242454))

(declare-fun m!260779 () Bool)

(assert (=> b!242454 m!260779))

(declare-fun m!260781 () Bool)

(assert (=> b!242457 m!260781))

(assert (=> d!59845 m!260681))

(declare-fun m!260783 () Bool)

(assert (=> d!59845 m!260783))

(declare-fun m!260785 () Bool)

(assert (=> d!59845 m!260785))

(declare-fun m!260787 () Bool)

(assert (=> d!59845 m!260787))

(declare-fun m!260789 () Bool)

(assert (=> d!59845 m!260789))

(assert (=> d!59845 m!260785))

(declare-fun m!260791 () Bool)

(assert (=> d!59845 m!260791))

(assert (=> b!242178 d!59845))

(declare-fun d!59847 () Bool)

(declare-fun res!118780 () Bool)

(declare-fun e!157357 () Bool)

(assert (=> d!59847 (=> (not res!118780) (not e!157357))))

(declare-fun simpleValid!247 (LongMapFixedSize!3580) Bool)

(assert (=> d!59847 (= res!118780 (simpleValid!247 thiss!1504))))

(assert (=> d!59847 (= (valid!1412 thiss!1504) e!157357)))

(declare-fun b!242465 () Bool)

(declare-fun res!118781 () Bool)

(assert (=> b!242465 (=> (not res!118781) (not e!157357))))

(declare-fun arrayCountValidKeys!0 (array!12013 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!242465 (= res!118781 (= (arrayCountValidKeys!0 (_keys!6598 thiss!1504) #b00000000000000000000000000000000 (size!6047 (_keys!6598 thiss!1504))) (_size!1839 thiss!1504)))))

(declare-fun b!242466 () Bool)

(declare-fun res!118782 () Bool)

(assert (=> b!242466 (=> (not res!118782) (not e!157357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12013 (_ BitVec 32)) Bool)

(assert (=> b!242466 (= res!118782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6598 thiss!1504) (mask!10571 thiss!1504)))))

(declare-fun b!242467 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12013 (_ BitVec 32) List!3620) Bool)

(assert (=> b!242467 (= e!157357 (arrayNoDuplicates!0 (_keys!6598 thiss!1504) #b00000000000000000000000000000000 Nil!3617))))

(assert (= (and d!59847 res!118780) b!242465))

(assert (= (and b!242465 res!118781) b!242466))

(assert (= (and b!242466 res!118782) b!242467))

(declare-fun m!260793 () Bool)

(assert (=> d!59847 m!260793))

(declare-fun m!260795 () Bool)

(assert (=> b!242465 m!260795))

(declare-fun m!260797 () Bool)

(assert (=> b!242466 m!260797))

(declare-fun m!260799 () Bool)

(assert (=> b!242467 m!260799))

(assert (=> start!23118 d!59847))

(declare-fun b!242475 () Bool)

(declare-fun e!157363 () Bool)

(assert (=> b!242475 (= e!157363 tp_is_empty!6367)))

(declare-fun mapNonEmpty!10801 () Bool)

(declare-fun mapRes!10801 () Bool)

(declare-fun tp!22744 () Bool)

(declare-fun e!157362 () Bool)

(assert (=> mapNonEmpty!10801 (= mapRes!10801 (and tp!22744 e!157362))))

(declare-fun mapRest!10801 () (Array (_ BitVec 32) ValueCell!2840))

(declare-fun mapValue!10801 () ValueCell!2840)

(declare-fun mapKey!10801 () (_ BitVec 32))

(assert (=> mapNonEmpty!10801 (= mapRest!10792 (store mapRest!10801 mapKey!10801 mapValue!10801))))

(declare-fun mapIsEmpty!10801 () Bool)

(assert (=> mapIsEmpty!10801 mapRes!10801))

(declare-fun b!242474 () Bool)

(assert (=> b!242474 (= e!157362 tp_is_empty!6367)))

(declare-fun condMapEmpty!10801 () Bool)

(declare-fun mapDefault!10801 () ValueCell!2840)

(assert (=> mapNonEmpty!10792 (= condMapEmpty!10801 (= mapRest!10792 ((as const (Array (_ BitVec 32) ValueCell!2840)) mapDefault!10801)))))

(assert (=> mapNonEmpty!10792 (= tp!22729 (and e!157363 mapRes!10801))))

(assert (= (and mapNonEmpty!10792 condMapEmpty!10801) mapIsEmpty!10801))

(assert (= (and mapNonEmpty!10792 (not condMapEmpty!10801)) mapNonEmpty!10801))

(assert (= (and mapNonEmpty!10801 ((_ is ValueCellFull!2840) mapValue!10801)) b!242474))

(assert (= (and mapNonEmpty!10792 ((_ is ValueCellFull!2840) mapDefault!10801)) b!242475))

(declare-fun m!260801 () Bool)

(assert (=> mapNonEmpty!10801 m!260801))

(declare-fun b_lambda!7983 () Bool)

(assert (= b_lambda!7981 (or (and b!242163 b_free!6505) b_lambda!7983)))

(check-sat (not bm!22585) (not b_lambda!7983) (not d!59819) (not bm!22586) (not d!59831) (not b!242467) (not b!242434) (not bm!22587) (not b!242373) (not b!242440) (not b!242321) (not b!242428) (not b!242422) (not b!242436) (not b!242433) (not d!59847) (not b!242334) (not d!59839) b_and!13461 (not bm!22565) (not d!59841) (not d!59845) (not d!59837) (not b!242416) tp_is_empty!6367 (not b!242465) (not bm!22566) (not b!242427) (not b!242466) (not b!242371) (not d!59843) (not mapNonEmpty!10801) (not bm!22581) (not b!242340) (not d!59821) (not b!242328) (not b!242454) (not b_next!6505) (not b!242430) (not b!242339))
(check-sat b_and!13461 (not b_next!6505))
