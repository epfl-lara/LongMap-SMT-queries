; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21880 () Bool)

(assert start!21880)

(declare-fun b!221258 () Bool)

(declare-fun b_free!5947 () Bool)

(declare-fun b_next!5947 () Bool)

(assert (=> b!221258 (= b_free!5947 (not b_next!5947))))

(declare-fun tp!20982 () Bool)

(declare-fun b_and!12845 () Bool)

(assert (=> b!221258 (= tp!20982 b_and!12845)))

(declare-fun mapIsEmpty!9883 () Bool)

(declare-fun mapRes!9883 () Bool)

(assert (=> mapIsEmpty!9883 mapRes!9883))

(declare-fun b!221248 () Bool)

(declare-fun res!108536 () Bool)

(declare-fun e!143813 () Bool)

(assert (=> b!221248 (=> (not res!108536) (not e!143813))))

(declare-datatypes ((V!7393 0))(
  ( (V!7394 (val!2949 Int)) )
))
(declare-datatypes ((ValueCell!2561 0))(
  ( (ValueCellFull!2561 (v!4969 V!7393)) (EmptyCell!2561) )
))
(declare-datatypes ((array!10861 0))(
  ( (array!10862 (arr!5150 (Array (_ BitVec 32) ValueCell!2561)) (size!5483 (_ BitVec 32))) )
))
(declare-datatypes ((array!10863 0))(
  ( (array!10864 (arr!5151 (Array (_ BitVec 32) (_ BitVec 64))) (size!5484 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3022 0))(
  ( (LongMapFixedSize!3023 (defaultEntry!4170 Int) (mask!9980 (_ BitVec 32)) (extraKeys!3907 (_ BitVec 32)) (zeroValue!4011 V!7393) (minValue!4011 V!7393) (_size!1560 (_ BitVec 32)) (_keys!6224 array!10863) (_values!4153 array!10861) (_vacant!1560 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3022)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10863 (_ BitVec 32)) Bool)

(assert (=> b!221248 (= res!108536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6224 thiss!1504) (mask!9980 thiss!1504)))))

(declare-fun b!221249 () Bool)

(declare-datatypes ((Unit!6608 0))(
  ( (Unit!6609) )
))
(declare-fun e!143810 () Unit!6608)

(declare-fun Unit!6610 () Unit!6608)

(assert (=> b!221249 (= e!143810 Unit!6610)))

(declare-fun lt!112364 () Unit!6608)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!213 (array!10863 array!10861 (_ BitVec 32) (_ BitVec 32) V!7393 V!7393 (_ BitVec 64) Int) Unit!6608)

(assert (=> b!221249 (= lt!112364 (lemmaInListMapThenSeekEntryOrOpenFindsIt!213 (_keys!6224 thiss!1504) (_values!4153 thiss!1504) (mask!9980 thiss!1504) (extraKeys!3907 thiss!1504) (zeroValue!4011 thiss!1504) (minValue!4011 thiss!1504) key!932 (defaultEntry!4170 thiss!1504)))))

(assert (=> b!221249 false))

(declare-fun b!221250 () Bool)

(declare-fun e!143811 () Bool)

(assert (=> b!221250 (= e!143811 e!143813)))

(declare-fun res!108533 () Bool)

(assert (=> b!221250 (=> (not res!108533) (not e!143813))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!221250 (= res!108533 (inRange!0 index!297 (mask!9980 thiss!1504)))))

(declare-fun lt!112365 () Unit!6608)

(assert (=> b!221250 (= lt!112365 e!143810)))

(declare-fun c!36793 () Bool)

(declare-datatypes ((tuple2!4374 0))(
  ( (tuple2!4375 (_1!2198 (_ BitVec 64)) (_2!2198 V!7393)) )
))
(declare-datatypes ((List!3277 0))(
  ( (Nil!3274) (Cons!3273 (h!3921 tuple2!4374) (t!8236 List!3277)) )
))
(declare-datatypes ((ListLongMap!3287 0))(
  ( (ListLongMap!3288 (toList!1659 List!3277)) )
))
(declare-fun contains!1502 (ListLongMap!3287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1187 (array!10863 array!10861 (_ BitVec 32) (_ BitVec 32) V!7393 V!7393 (_ BitVec 32) Int) ListLongMap!3287)

(assert (=> b!221250 (= c!36793 (contains!1502 (getCurrentListMap!1187 (_keys!6224 thiss!1504) (_values!4153 thiss!1504) (mask!9980 thiss!1504) (extraKeys!3907 thiss!1504) (zeroValue!4011 thiss!1504) (minValue!4011 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4170 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!9883 () Bool)

(declare-fun tp!20983 () Bool)

(declare-fun e!143816 () Bool)

(assert (=> mapNonEmpty!9883 (= mapRes!9883 (and tp!20983 e!143816))))

(declare-fun mapKey!9883 () (_ BitVec 32))

(declare-fun mapValue!9883 () ValueCell!2561)

(declare-fun mapRest!9883 () (Array (_ BitVec 32) ValueCell!2561))

(assert (=> mapNonEmpty!9883 (= (arr!5150 (_values!4153 thiss!1504)) (store mapRest!9883 mapKey!9883 mapValue!9883))))

(declare-fun bm!20672 () Bool)

(declare-fun call!20676 () Bool)

(declare-fun arrayContainsKey!0 (array!10863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20672 (= call!20676 (arrayContainsKey!0 (_keys!6224 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221251 () Bool)

(declare-fun tp_is_empty!5809 () Bool)

(assert (=> b!221251 (= e!143816 tp_is_empty!5809)))

(declare-fun b!221252 () Bool)

(declare-fun res!108534 () Bool)

(assert (=> b!221252 (=> (not res!108534) (not e!143813))))

(assert (=> b!221252 (= res!108534 (and (= (size!5483 (_values!4153 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9980 thiss!1504))) (= (size!5484 (_keys!6224 thiss!1504)) (size!5483 (_values!4153 thiss!1504))) (bvsge (mask!9980 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3907 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3907 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!221253 () Bool)

(declare-fun c!36794 () Bool)

(declare-datatypes ((SeekEntryResult!822 0))(
  ( (MissingZero!822 (index!5458 (_ BitVec 32))) (Found!822 (index!5459 (_ BitVec 32))) (Intermediate!822 (undefined!1634 Bool) (index!5460 (_ BitVec 32)) (x!23002 (_ BitVec 32))) (Undefined!822) (MissingVacant!822 (index!5461 (_ BitVec 32))) )
))
(declare-fun lt!112363 () SeekEntryResult!822)

(assert (=> b!221253 (= c!36794 (is-MissingVacant!822 lt!112363))))

(declare-fun e!143808 () Bool)

(declare-fun e!143814 () Bool)

(assert (=> b!221253 (= e!143808 e!143814)))

(declare-fun b!221254 () Bool)

(declare-fun res!108531 () Bool)

(assert (=> b!221254 (= res!108531 (= (select (arr!5151 (_keys!6224 thiss!1504)) (index!5461 lt!112363)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143815 () Bool)

(assert (=> b!221254 (=> (not res!108531) (not e!143815))))

(declare-fun bm!20673 () Bool)

(declare-fun call!20675 () Bool)

(declare-fun c!36795 () Bool)

(assert (=> bm!20673 (= call!20675 (inRange!0 (ite c!36795 (index!5458 lt!112363) (index!5461 lt!112363)) (mask!9980 thiss!1504)))))

(declare-fun b!221256 () Bool)

(assert (=> b!221256 (= e!143814 (is-Undefined!822 lt!112363))))

(declare-fun b!221257 () Bool)

(assert (=> b!221257 (= e!143814 e!143815)))

(declare-fun res!108541 () Bool)

(assert (=> b!221257 (= res!108541 call!20675)))

(assert (=> b!221257 (=> (not res!108541) (not e!143815))))

(declare-fun e!143807 () Bool)

(declare-fun e!143805 () Bool)

(declare-fun array_inv!3409 (array!10863) Bool)

(declare-fun array_inv!3410 (array!10861) Bool)

(assert (=> b!221258 (= e!143805 (and tp!20982 tp_is_empty!5809 (array_inv!3409 (_keys!6224 thiss!1504)) (array_inv!3410 (_values!4153 thiss!1504)) e!143807))))

(declare-fun b!221259 () Bool)

(declare-fun lt!112367 () Unit!6608)

(assert (=> b!221259 (= e!143810 lt!112367)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!224 (array!10863 array!10861 (_ BitVec 32) (_ BitVec 32) V!7393 V!7393 (_ BitVec 64) Int) Unit!6608)

(assert (=> b!221259 (= lt!112367 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!224 (_keys!6224 thiss!1504) (_values!4153 thiss!1504) (mask!9980 thiss!1504) (extraKeys!3907 thiss!1504) (zeroValue!4011 thiss!1504) (minValue!4011 thiss!1504) key!932 (defaultEntry!4170 thiss!1504)))))

(assert (=> b!221259 (= c!36795 (is-MissingZero!822 lt!112363))))

(assert (=> b!221259 e!143808))

(declare-fun b!221260 () Bool)

(declare-fun res!108535 () Bool)

(declare-fun e!143804 () Bool)

(assert (=> b!221260 (=> (not res!108535) (not e!143804))))

(assert (=> b!221260 (= res!108535 call!20675)))

(assert (=> b!221260 (= e!143808 e!143804)))

(declare-fun b!221261 () Bool)

(declare-fun res!108530 () Bool)

(declare-fun e!143812 () Bool)

(assert (=> b!221261 (=> (not res!108530) (not e!143812))))

(assert (=> b!221261 (= res!108530 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221262 () Bool)

(declare-fun e!143809 () Bool)

(assert (=> b!221262 (= e!143807 (and e!143809 mapRes!9883))))

(declare-fun condMapEmpty!9883 () Bool)

(declare-fun mapDefault!9883 () ValueCell!2561)

