; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21886 () Bool)

(assert start!21886)

(declare-fun b!221449 () Bool)

(declare-fun b_free!5953 () Bool)

(declare-fun b_next!5953 () Bool)

(assert (=> b!221449 (= b_free!5953 (not b_next!5953))))

(declare-fun tp!21001 () Bool)

(declare-fun b_and!12851 () Bool)

(assert (=> b!221449 (= tp!21001 b_and!12851)))

(declare-fun b!221446 () Bool)

(declare-fun e!143921 () Bool)

(declare-fun call!20694 () Bool)

(assert (=> b!221446 (= e!143921 (not call!20694))))

(declare-fun b!221447 () Bool)

(declare-fun res!108643 () Bool)

(declare-fun e!143929 () Bool)

(assert (=> b!221447 (=> (not res!108643) (not e!143929))))

(declare-datatypes ((V!7401 0))(
  ( (V!7402 (val!2952 Int)) )
))
(declare-datatypes ((ValueCell!2564 0))(
  ( (ValueCellFull!2564 (v!4972 V!7401)) (EmptyCell!2564) )
))
(declare-datatypes ((array!10873 0))(
  ( (array!10874 (arr!5156 (Array (_ BitVec 32) ValueCell!2564)) (size!5489 (_ BitVec 32))) )
))
(declare-datatypes ((array!10875 0))(
  ( (array!10876 (arr!5157 (Array (_ BitVec 32) (_ BitVec 64))) (size!5490 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3028 0))(
  ( (LongMapFixedSize!3029 (defaultEntry!4173 Int) (mask!9985 (_ BitVec 32)) (extraKeys!3910 (_ BitVec 32)) (zeroValue!4014 V!7401) (minValue!4014 V!7401) (_size!1563 (_ BitVec 32)) (_keys!6227 array!10875) (_values!4156 array!10873) (_vacant!1563 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3028)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221447 (= res!108643 (validMask!0 (mask!9985 thiss!1504)))))

(declare-fun c!36821 () Bool)

(declare-datatypes ((SeekEntryResult!825 0))(
  ( (MissingZero!825 (index!5470 (_ BitVec 32))) (Found!825 (index!5471 (_ BitVec 32))) (Intermediate!825 (undefined!1637 Bool) (index!5472 (_ BitVec 32)) (x!23013 (_ BitVec 32))) (Undefined!825) (MissingVacant!825 (index!5473 (_ BitVec 32))) )
))
(declare-fun lt!112410 () SeekEntryResult!825)

(declare-fun call!20693 () Bool)

(declare-fun bm!20690 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20690 (= call!20693 (inRange!0 (ite c!36821 (index!5470 lt!112410) (index!5473 lt!112410)) (mask!9985 thiss!1504)))))

(declare-fun b!221448 () Bool)

(declare-fun res!108645 () Bool)

(assert (=> b!221448 (=> (not res!108645) (not e!143929))))

(assert (=> b!221448 (= res!108645 (and (= (size!5489 (_values!4156 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9985 thiss!1504))) (= (size!5490 (_keys!6227 thiss!1504)) (size!5489 (_values!4156 thiss!1504))) (bvsge (mask!9985 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3910 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3910 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!108647 () Bool)

(declare-fun e!143923 () Bool)

(assert (=> start!21886 (=> (not res!108647) (not e!143923))))

(declare-fun valid!1222 (LongMapFixedSize!3028) Bool)

(assert (=> start!21886 (= res!108647 (valid!1222 thiss!1504))))

(assert (=> start!21886 e!143923))

(declare-fun e!143925 () Bool)

(assert (=> start!21886 e!143925))

(assert (=> start!21886 true))

(declare-fun tp_is_empty!5815 () Bool)

(declare-fun e!143924 () Bool)

(declare-fun array_inv!3413 (array!10875) Bool)

(declare-fun array_inv!3414 (array!10873) Bool)

(assert (=> b!221449 (= e!143925 (and tp!21001 tp_is_empty!5815 (array_inv!3413 (_keys!6227 thiss!1504)) (array_inv!3414 (_values!4156 thiss!1504)) e!143924))))

(declare-fun b!221450 () Bool)

(declare-datatypes ((Unit!6617 0))(
  ( (Unit!6618) )
))
(declare-fun e!143932 () Unit!6617)

(declare-fun lt!112412 () Unit!6617)

(assert (=> b!221450 (= e!143932 lt!112412)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!227 (array!10875 array!10873 (_ BitVec 32) (_ BitVec 32) V!7401 V!7401 (_ BitVec 64) Int) Unit!6617)

(assert (=> b!221450 (= lt!112412 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!227 (_keys!6227 thiss!1504) (_values!4156 thiss!1504) (mask!9985 thiss!1504) (extraKeys!3910 thiss!1504) (zeroValue!4014 thiss!1504) (minValue!4014 thiss!1504) key!932 (defaultEntry!4173 thiss!1504)))))

(assert (=> b!221450 (= c!36821 (is-MissingZero!825 lt!112410))))

(declare-fun e!143927 () Bool)

(assert (=> b!221450 e!143927))

(declare-fun b!221451 () Bool)

(declare-fun res!108649 () Bool)

(assert (=> b!221451 (= res!108649 (= (select (arr!5157 (_keys!6227 thiss!1504)) (index!5473 lt!112410)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!221451 (=> (not res!108649) (not e!143921))))

(declare-fun b!221452 () Bool)

(assert (=> b!221452 (= e!143929 false)))

(declare-fun lt!112409 () Bool)

(declare-datatypes ((List!3282 0))(
  ( (Nil!3279) (Cons!3278 (h!3926 (_ BitVec 64)) (t!8241 List!3282)) )
))
(declare-fun arrayNoDuplicates!0 (array!10875 (_ BitVec 32) List!3282) Bool)

(assert (=> b!221452 (= lt!112409 (arrayNoDuplicates!0 (_keys!6227 thiss!1504) #b00000000000000000000000000000000 Nil!3279))))

(declare-fun b!221453 () Bool)

(declare-fun e!143928 () Bool)

(assert (=> b!221453 (= e!143928 e!143929)))

(declare-fun res!108648 () Bool)

(assert (=> b!221453 (=> (not res!108648) (not e!143929))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221453 (= res!108648 (inRange!0 index!297 (mask!9985 thiss!1504)))))

(declare-fun lt!112411 () Unit!6617)

(assert (=> b!221453 (= lt!112411 e!143932)))

(declare-fun c!36822 () Bool)

(declare-datatypes ((tuple2!4380 0))(
  ( (tuple2!4381 (_1!2201 (_ BitVec 64)) (_2!2201 V!7401)) )
))
(declare-datatypes ((List!3283 0))(
  ( (Nil!3280) (Cons!3279 (h!3927 tuple2!4380) (t!8242 List!3283)) )
))
(declare-datatypes ((ListLongMap!3293 0))(
  ( (ListLongMap!3294 (toList!1662 List!3283)) )
))
(declare-fun contains!1505 (ListLongMap!3293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1190 (array!10875 array!10873 (_ BitVec 32) (_ BitVec 32) V!7401 V!7401 (_ BitVec 32) Int) ListLongMap!3293)

(assert (=> b!221453 (= c!36822 (contains!1505 (getCurrentListMap!1190 (_keys!6227 thiss!1504) (_values!4156 thiss!1504) (mask!9985 thiss!1504) (extraKeys!3910 thiss!1504) (zeroValue!4014 thiss!1504) (minValue!4014 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4173 thiss!1504)) key!932))))

(declare-fun b!221454 () Bool)

(declare-fun res!108642 () Bool)

(assert (=> b!221454 (=> (not res!108642) (not e!143929))))

(declare-fun arrayContainsKey!0 (array!10875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!221454 (= res!108642 (arrayContainsKey!0 (_keys!6227 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221455 () Bool)

(assert (=> b!221455 (= e!143923 e!143928)))

(declare-fun res!108641 () Bool)

(assert (=> b!221455 (=> (not res!108641) (not e!143928))))

(assert (=> b!221455 (= res!108641 (or (= lt!112410 (MissingZero!825 index!297)) (= lt!112410 (MissingVacant!825 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10875 (_ BitVec 32)) SeekEntryResult!825)

(assert (=> b!221455 (= lt!112410 (seekEntryOrOpen!0 key!932 (_keys!6227 thiss!1504) (mask!9985 thiss!1504)))))

(declare-fun b!221456 () Bool)

(declare-fun res!108640 () Bool)

(declare-fun e!143926 () Bool)

(assert (=> b!221456 (=> (not res!108640) (not e!143926))))

(assert (=> b!221456 (= res!108640 (= (select (arr!5157 (_keys!6227 thiss!1504)) (index!5470 lt!112410)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20691 () Bool)

(assert (=> bm!20691 (= call!20694 (arrayContainsKey!0 (_keys!6227 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221457 () Bool)

(declare-fun res!108646 () Bool)

(assert (=> b!221457 (=> (not res!108646) (not e!143929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10875 (_ BitVec 32)) Bool)

(assert (=> b!221457 (= res!108646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6227 thiss!1504) (mask!9985 thiss!1504)))))

(declare-fun b!221458 () Bool)

(declare-fun Unit!6619 () Unit!6617)

(assert (=> b!221458 (= e!143932 Unit!6619)))

(declare-fun lt!112408 () Unit!6617)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!216 (array!10875 array!10873 (_ BitVec 32) (_ BitVec 32) V!7401 V!7401 (_ BitVec 64) Int) Unit!6617)

(assert (=> b!221458 (= lt!112408 (lemmaInListMapThenSeekEntryOrOpenFindsIt!216 (_keys!6227 thiss!1504) (_values!4156 thiss!1504) (mask!9985 thiss!1504) (extraKeys!3910 thiss!1504) (zeroValue!4014 thiss!1504) (minValue!4014 thiss!1504) key!932 (defaultEntry!4173 thiss!1504)))))

(assert (=> b!221458 false))

(declare-fun b!221459 () Bool)

(declare-fun e!143931 () Bool)

(assert (=> b!221459 (= e!143931 (is-Undefined!825 lt!112410))))

(declare-fun b!221460 () Bool)

(declare-fun res!108644 () Bool)

(assert (=> b!221460 (=> (not res!108644) (not e!143923))))

(assert (=> b!221460 (= res!108644 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221461 () Bool)

(declare-fun e!143922 () Bool)

(declare-fun mapRes!9892 () Bool)

(assert (=> b!221461 (= e!143924 (and e!143922 mapRes!9892))))

(declare-fun condMapEmpty!9892 () Bool)

(declare-fun mapDefault!9892 () ValueCell!2564)

