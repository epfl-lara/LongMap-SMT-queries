; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23060 () Bool)

(assert start!23060)

(declare-fun b!241762 () Bool)

(declare-fun b_free!6497 () Bool)

(declare-fun b_next!6497 () Bool)

(assert (=> b!241762 (= b_free!6497 (not b_next!6497))))

(declare-fun tp!22698 () Bool)

(declare-fun b_and!13469 () Bool)

(assert (=> b!241762 (= tp!22698 b_and!13469)))

(declare-fun b!241752 () Bool)

(declare-fun c!40313 () Bool)

(declare-datatypes ((SeekEntryResult!1060 0))(
  ( (MissingZero!1060 (index!6410 (_ BitVec 32))) (Found!1060 (index!6411 (_ BitVec 32))) (Intermediate!1060 (undefined!1872 Bool) (index!6412 (_ BitVec 32)) (x!24230 (_ BitVec 32))) (Undefined!1060) (MissingVacant!1060 (index!6413 (_ BitVec 32))) )
))
(declare-fun lt!121458 () SeekEntryResult!1060)

(assert (=> b!241752 (= c!40313 (is-MissingVacant!1060 lt!121458))))

(declare-fun e!156908 () Bool)

(declare-fun e!156909 () Bool)

(assert (=> b!241752 (= e!156908 e!156909)))

(declare-fun b!241753 () Bool)

(assert (=> b!241753 (= e!156909 (is-Undefined!1060 lt!121458))))

(declare-fun b!241754 () Bool)

(declare-fun e!156904 () Bool)

(declare-fun tp_is_empty!6359 () Bool)

(assert (=> b!241754 (= e!156904 tp_is_empty!6359)))

(declare-fun res!118487 () Bool)

(declare-fun e!156902 () Bool)

(assert (=> start!23060 (=> (not res!118487) (not e!156902))))

(declare-datatypes ((V!8125 0))(
  ( (V!8126 (val!3224 Int)) )
))
(declare-datatypes ((ValueCell!2836 0))(
  ( (ValueCellFull!2836 (v!5263 V!8125)) (EmptyCell!2836) )
))
(declare-datatypes ((array!11999 0))(
  ( (array!12000 (arr!5700 (Array (_ BitVec 32) ValueCell!2836)) (size!6042 (_ BitVec 32))) )
))
(declare-datatypes ((array!12001 0))(
  ( (array!12002 (arr!5701 (Array (_ BitVec 32) (_ BitVec 64))) (size!6043 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3572 0))(
  ( (LongMapFixedSize!3573 (defaultEntry!4479 Int) (mask!10552 (_ BitVec 32)) (extraKeys!4216 (_ BitVec 32)) (zeroValue!4320 V!8125) (minValue!4320 V!8125) (_size!1835 (_ BitVec 32)) (_keys!6585 array!12001) (_values!4462 array!11999) (_vacant!1835 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3572)

(declare-fun valid!1403 (LongMapFixedSize!3572) Bool)

(assert (=> start!23060 (= res!118487 (valid!1403 thiss!1504))))

(assert (=> start!23060 e!156902))

(declare-fun e!156911 () Bool)

(assert (=> start!23060 e!156911))

(assert (=> start!23060 true))

(declare-fun b!241755 () Bool)

(declare-datatypes ((Unit!7449 0))(
  ( (Unit!7450) )
))
(declare-fun e!156906 () Unit!7449)

(declare-fun Unit!7451 () Unit!7449)

(assert (=> b!241755 (= e!156906 Unit!7451)))

(declare-fun lt!121460 () Unit!7449)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!155 (array!12001 array!11999 (_ BitVec 32) (_ BitVec 32) V!8125 V!8125 (_ BitVec 64) (_ BitVec 32) Int) Unit!7449)

(assert (=> b!241755 (= lt!121460 (lemmaArrayContainsKeyThenInListMap!155 (_keys!6585 thiss!1504) (_values!4462 thiss!1504) (mask!10552 thiss!1504) (extraKeys!4216 thiss!1504) (zeroValue!4320 thiss!1504) (minValue!4320 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4479 thiss!1504)))))

(assert (=> b!241755 false))

(declare-fun b!241756 () Bool)

(declare-fun Unit!7452 () Unit!7449)

(assert (=> b!241756 (= e!156906 Unit!7452)))

(declare-fun b!241757 () Bool)

(declare-fun e!156903 () Unit!7449)

(declare-fun lt!121457 () Unit!7449)

(assert (=> b!241757 (= e!156903 lt!121457)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!360 (array!12001 array!11999 (_ BitVec 32) (_ BitVec 32) V!8125 V!8125 (_ BitVec 64) Int) Unit!7449)

(assert (=> b!241757 (= lt!121457 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!360 (_keys!6585 thiss!1504) (_values!4462 thiss!1504) (mask!10552 thiss!1504) (extraKeys!4216 thiss!1504) (zeroValue!4320 thiss!1504) (minValue!4320 thiss!1504) key!932 (defaultEntry!4479 thiss!1504)))))

(declare-fun c!40314 () Bool)

(assert (=> b!241757 (= c!40314 (is-MissingZero!1060 lt!121458))))

(assert (=> b!241757 e!156908))

(declare-fun b!241758 () Bool)

(declare-fun e!156910 () Bool)

(assert (=> b!241758 (= e!156909 e!156910)))

(declare-fun res!118484 () Bool)

(declare-fun call!22497 () Bool)

(assert (=> b!241758 (= res!118484 call!22497)))

(assert (=> b!241758 (=> (not res!118484) (not e!156910))))

(declare-fun b!241759 () Bool)

(declare-fun Unit!7453 () Unit!7449)

(assert (=> b!241759 (= e!156903 Unit!7453)))

(declare-fun lt!121459 () Unit!7449)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!351 (array!12001 array!11999 (_ BitVec 32) (_ BitVec 32) V!8125 V!8125 (_ BitVec 64) Int) Unit!7449)

(assert (=> b!241759 (= lt!121459 (lemmaInListMapThenSeekEntryOrOpenFindsIt!351 (_keys!6585 thiss!1504) (_values!4462 thiss!1504) (mask!10552 thiss!1504) (extraKeys!4216 thiss!1504) (zeroValue!4320 thiss!1504) (minValue!4320 thiss!1504) key!932 (defaultEntry!4479 thiss!1504)))))

(assert (=> b!241759 false))

(declare-fun b!241760 () Bool)

(declare-fun e!156900 () Bool)

(declare-fun e!156912 () Bool)

(assert (=> b!241760 (= e!156900 e!156912)))

(declare-fun res!118485 () Bool)

(assert (=> b!241760 (=> (not res!118485) (not e!156912))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241760 (= res!118485 (inRange!0 index!297 (mask!10552 thiss!1504)))))

(declare-fun lt!121455 () Unit!7449)

(assert (=> b!241760 (= lt!121455 e!156903)))

(declare-fun c!40312 () Bool)

(declare-datatypes ((tuple2!4748 0))(
  ( (tuple2!4749 (_1!2385 (_ BitVec 64)) (_2!2385 V!8125)) )
))
(declare-datatypes ((List!3626 0))(
  ( (Nil!3623) (Cons!3622 (h!4279 tuple2!4748) (t!8623 List!3626)) )
))
(declare-datatypes ((ListLongMap!3661 0))(
  ( (ListLongMap!3662 (toList!1846 List!3626)) )
))
(declare-fun contains!1736 (ListLongMap!3661 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1374 (array!12001 array!11999 (_ BitVec 32) (_ BitVec 32) V!8125 V!8125 (_ BitVec 32) Int) ListLongMap!3661)

(assert (=> b!241760 (= c!40312 (contains!1736 (getCurrentListMap!1374 (_keys!6585 thiss!1504) (_values!4462 thiss!1504) (mask!10552 thiss!1504) (extraKeys!4216 thiss!1504) (zeroValue!4320 thiss!1504) (minValue!4320 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4479 thiss!1504)) key!932))))

(declare-fun bm!22493 () Bool)

(declare-fun call!22496 () Bool)

(declare-fun arrayContainsKey!0 (array!12001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22493 (= call!22496 (arrayContainsKey!0 (_keys!6585 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22494 () Bool)

(assert (=> bm!22494 (= call!22497 (inRange!0 (ite c!40314 (index!6410 lt!121458) (index!6413 lt!121458)) (mask!10552 thiss!1504)))))

(declare-fun b!241761 () Bool)

(declare-fun e!156907 () Bool)

(declare-fun mapRes!10774 () Bool)

(assert (=> b!241761 (= e!156907 (and e!156904 mapRes!10774))))

(declare-fun condMapEmpty!10774 () Bool)

(declare-fun mapDefault!10774 () ValueCell!2836)

