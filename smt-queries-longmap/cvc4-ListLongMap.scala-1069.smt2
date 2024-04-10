; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22100 () Bool)

(assert start!22100)

(declare-fun b!229691 () Bool)

(declare-fun b_free!6167 () Bool)

(declare-fun b_next!6167 () Bool)

(assert (=> b!229691 (= b_free!6167 (not b_next!6167))))

(declare-fun tp!21642 () Bool)

(declare-fun b_and!13065 () Bool)

(assert (=> b!229691 (= tp!21642 b_and!13065)))

(declare-fun b!229677 () Bool)

(declare-datatypes ((Unit!7010 0))(
  ( (Unit!7011) )
))
(declare-fun e!149021 () Unit!7010)

(declare-fun Unit!7012 () Unit!7010)

(assert (=> b!229677 (= e!149021 Unit!7012)))

(declare-fun lt!115525 () Unit!7010)

(declare-datatypes ((V!7685 0))(
  ( (V!7686 (val!3059 Int)) )
))
(declare-datatypes ((ValueCell!2671 0))(
  ( (ValueCellFull!2671 (v!5079 V!7685)) (EmptyCell!2671) )
))
(declare-datatypes ((array!11301 0))(
  ( (array!11302 (arr!5370 (Array (_ BitVec 32) ValueCell!2671)) (size!5703 (_ BitVec 32))) )
))
(declare-datatypes ((array!11303 0))(
  ( (array!11304 (arr!5371 (Array (_ BitVec 32) (_ BitVec 64))) (size!5704 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3242 0))(
  ( (LongMapFixedSize!3243 (defaultEntry!4280 Int) (mask!10162 (_ BitVec 32)) (extraKeys!4017 (_ BitVec 32)) (zeroValue!4121 V!7685) (minValue!4121 V!7685) (_size!1670 (_ BitVec 32)) (_keys!6334 array!11303) (_values!4263 array!11301) (_vacant!1670 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3242)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!283 (array!11303 array!11301 (_ BitVec 32) (_ BitVec 32) V!7685 V!7685 (_ BitVec 64) Int) Unit!7010)

(assert (=> b!229677 (= lt!115525 (lemmaInListMapThenSeekEntryOrOpenFindsIt!283 (_keys!6334 thiss!1504) (_values!4263 thiss!1504) (mask!10162 thiss!1504) (extraKeys!4017 thiss!1504) (zeroValue!4121 thiss!1504) (minValue!4121 thiss!1504) key!932 (defaultEntry!4280 thiss!1504)))))

(assert (=> b!229677 false))

(declare-fun b!229678 () Bool)

(declare-fun e!149016 () Unit!7010)

(declare-fun Unit!7013 () Unit!7010)

(assert (=> b!229678 (= e!149016 Unit!7013)))

(declare-fun b!229679 () Bool)

(declare-fun res!113034 () Bool)

(declare-fun e!149023 () Bool)

(assert (=> b!229679 (=> (not res!113034) (not e!149023))))

(declare-fun call!21336 () Bool)

(assert (=> b!229679 (= res!113034 call!21336)))

(declare-fun e!149011 () Bool)

(assert (=> b!229679 (= e!149011 e!149023)))

(declare-fun b!229680 () Bool)

(declare-fun e!149012 () Bool)

(declare-fun call!21335 () Bool)

(assert (=> b!229680 (= e!149012 (not call!21335))))

(declare-fun bm!21332 () Bool)

(declare-fun arrayContainsKey!0 (array!11303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21332 (= call!21335 (arrayContainsKey!0 (_keys!6334 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10213 () Bool)

(declare-fun mapRes!10213 () Bool)

(assert (=> mapIsEmpty!10213 mapRes!10213))

(declare-fun b!229681 () Bool)

(declare-fun e!149010 () Bool)

(assert (=> b!229681 (= e!149010 e!149012)))

(declare-fun res!113033 () Bool)

(assert (=> b!229681 (= res!113033 call!21336)))

(assert (=> b!229681 (=> (not res!113033) (not e!149012))))

(declare-fun b!229682 () Bool)

(declare-fun e!149015 () Bool)

(declare-fun e!149022 () Bool)

(assert (=> b!229682 (= e!149015 e!149022)))

(declare-fun res!113040 () Bool)

(assert (=> b!229682 (=> (not res!113040) (not e!149022))))

(declare-datatypes ((SeekEntryResult!925 0))(
  ( (MissingZero!925 (index!5870 (_ BitVec 32))) (Found!925 (index!5871 (_ BitVec 32))) (Intermediate!925 (undefined!1737 Bool) (index!5872 (_ BitVec 32)) (x!23393 (_ BitVec 32))) (Undefined!925) (MissingVacant!925 (index!5873 (_ BitVec 32))) )
))
(declare-fun lt!115524 () SeekEntryResult!925)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!229682 (= res!113040 (or (= lt!115524 (MissingZero!925 index!297)) (= lt!115524 (MissingVacant!925 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11303 (_ BitVec 32)) SeekEntryResult!925)

(assert (=> b!229682 (= lt!115524 (seekEntryOrOpen!0 key!932 (_keys!6334 thiss!1504) (mask!10162 thiss!1504)))))

(declare-fun res!113035 () Bool)

(assert (=> start!22100 (=> (not res!113035) (not e!149015))))

(declare-fun valid!1293 (LongMapFixedSize!3242) Bool)

(assert (=> start!22100 (= res!113035 (valid!1293 thiss!1504))))

(assert (=> start!22100 e!149015))

(declare-fun e!149020 () Bool)

(assert (=> start!22100 e!149020))

(assert (=> start!22100 true))

(declare-fun bm!21333 () Bool)

(declare-fun c!38100 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21333 (= call!21336 (inRange!0 (ite c!38100 (index!5870 lt!115524) (index!5873 lt!115524)) (mask!10162 thiss!1504)))))

(declare-fun b!229683 () Bool)

(declare-fun e!149018 () Bool)

(declare-fun tp_is_empty!6029 () Bool)

(assert (=> b!229683 (= e!149018 tp_is_empty!6029)))

(declare-fun b!229684 () Bool)

(declare-fun lt!115519 () Unit!7010)

(assert (=> b!229684 (= e!149021 lt!115519)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!300 (array!11303 array!11301 (_ BitVec 32) (_ BitVec 32) V!7685 V!7685 (_ BitVec 64) Int) Unit!7010)

(assert (=> b!229684 (= lt!115519 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!300 (_keys!6334 thiss!1504) (_values!4263 thiss!1504) (mask!10162 thiss!1504) (extraKeys!4017 thiss!1504) (zeroValue!4121 thiss!1504) (minValue!4121 thiss!1504) key!932 (defaultEntry!4280 thiss!1504)))))

(assert (=> b!229684 (= c!38100 (is-MissingZero!925 lt!115524))))

(assert (=> b!229684 e!149011))

(declare-fun b!229685 () Bool)

(declare-fun e!149013 () Bool)

(declare-fun e!149017 () Bool)

(assert (=> b!229685 (= e!149013 (and e!149017 mapRes!10213))))

(declare-fun condMapEmpty!10213 () Bool)

(declare-fun mapDefault!10213 () ValueCell!2671)

