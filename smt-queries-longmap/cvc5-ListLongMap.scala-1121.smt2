; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22972 () Bool)

(assert start!22972)

(declare-fun b!240727 () Bool)

(declare-fun b_free!6475 () Bool)

(declare-fun b_next!6475 () Bool)

(assert (=> b!240727 (= b_free!6475 (not b_next!6475))))

(declare-fun tp!22629 () Bool)

(declare-fun b_and!13441 () Bool)

(assert (=> b!240727 (= tp!22629 b_and!13441)))

(declare-fun b!240726 () Bool)

(declare-fun res!118045 () Bool)

(declare-datatypes ((V!8097 0))(
  ( (V!8098 (val!3213 Int)) )
))
(declare-datatypes ((ValueCell!2825 0))(
  ( (ValueCellFull!2825 (v!5251 V!8097)) (EmptyCell!2825) )
))
(declare-datatypes ((array!11953 0))(
  ( (array!11954 (arr!5678 (Array (_ BitVec 32) ValueCell!2825)) (size!6019 (_ BitVec 32))) )
))
(declare-datatypes ((array!11955 0))(
  ( (array!11956 (arr!5679 (Array (_ BitVec 32) (_ BitVec 64))) (size!6020 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3550 0))(
  ( (LongMapFixedSize!3551 (defaultEntry!4460 Int) (mask!10520 (_ BitVec 32)) (extraKeys!4197 (_ BitVec 32)) (zeroValue!4301 V!8097) (minValue!4301 V!8097) (_size!1824 (_ BitVec 32)) (_keys!6562 array!11955) (_values!4443 array!11953) (_vacant!1824 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3550)

(declare-datatypes ((SeekEntryResult!1050 0))(
  ( (MissingZero!1050 (index!6370 (_ BitVec 32))) (Found!1050 (index!6371 (_ BitVec 32))) (Intermediate!1050 (undefined!1862 Bool) (index!6372 (_ BitVec 32)) (x!24178 (_ BitVec 32))) (Undefined!1050) (MissingVacant!1050 (index!6373 (_ BitVec 32))) )
))
(declare-fun lt!121042 () SeekEntryResult!1050)

(assert (=> b!240726 (= res!118045 (= (select (arr!5679 (_keys!6562 thiss!1504)) (index!6373 lt!121042)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156233 () Bool)

(assert (=> b!240726 (=> (not res!118045) (not e!156233))))

(declare-fun e!156231 () Bool)

(declare-fun tp_is_empty!6337 () Bool)

(declare-fun e!156229 () Bool)

(declare-fun array_inv!3757 (array!11955) Bool)

(declare-fun array_inv!3758 (array!11953) Bool)

(assert (=> b!240727 (= e!156229 (and tp!22629 tp_is_empty!6337 (array_inv!3757 (_keys!6562 thiss!1504)) (array_inv!3758 (_values!4443 thiss!1504)) e!156231))))

(declare-fun b!240728 () Bool)

(declare-fun e!156230 () Bool)

(assert (=> b!240728 (= e!156230 e!156233)))

(declare-fun res!118052 () Bool)

(declare-fun call!22386 () Bool)

(assert (=> b!240728 (= res!118052 call!22386)))

(assert (=> b!240728 (=> (not res!118052) (not e!156233))))

(declare-fun b!240729 () Bool)

(declare-fun e!156236 () Bool)

(assert (=> b!240729 (= e!156236 (not false))))

(declare-fun lt!121040 () Bool)

(assert (=> b!240729 lt!121040))

(declare-datatypes ((Unit!7407 0))(
  ( (Unit!7408) )
))
(declare-fun lt!121044 () Unit!7407)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!149 (array!11955 array!11953 (_ BitVec 32) (_ BitVec 32) V!8097 V!8097 (_ BitVec 64) (_ BitVec 32) Int) Unit!7407)

(assert (=> b!240729 (= lt!121044 (lemmaArrayContainsKeyThenInListMap!149 (_keys!6562 thiss!1504) (_values!4443 thiss!1504) (mask!10520 thiss!1504) (extraKeys!4197 thiss!1504) (zeroValue!4301 thiss!1504) (minValue!4301 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4460 thiss!1504)))))

(declare-fun b!240730 () Bool)

(declare-fun e!156232 () Bool)

(assert (=> b!240730 (= e!156232 tp_is_empty!6337)))

(declare-fun b!240731 () Bool)

(assert (=> b!240731 (= e!156230 (is-Undefined!1050 lt!121042))))

(declare-fun b!240732 () Bool)

(declare-fun e!156235 () Bool)

(declare-fun call!22385 () Bool)

(assert (=> b!240732 (= e!156235 (not call!22385))))

(declare-fun b!240733 () Bool)

(declare-fun res!118049 () Bool)

(assert (=> b!240733 (=> (not res!118049) (not e!156235))))

(assert (=> b!240733 (= res!118049 (= (select (arr!5679 (_keys!6562 thiss!1504)) (index!6370 lt!121042)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240734 () Bool)

(declare-fun res!118044 () Bool)

(assert (=> b!240734 (=> (not res!118044) (not e!156235))))

(assert (=> b!240734 (= res!118044 call!22386)))

(declare-fun e!156237 () Bool)

(assert (=> b!240734 (= e!156237 e!156235)))

(declare-fun res!118050 () Bool)

(declare-fun e!156228 () Bool)

(assert (=> start!22972 (=> (not res!118050) (not e!156228))))

(declare-fun valid!1396 (LongMapFixedSize!3550) Bool)

(assert (=> start!22972 (= res!118050 (valid!1396 thiss!1504))))

(assert (=> start!22972 e!156228))

(assert (=> start!22972 e!156229))

(assert (=> start!22972 true))

(declare-fun mapIsEmpty!10737 () Bool)

(declare-fun mapRes!10737 () Bool)

(assert (=> mapIsEmpty!10737 mapRes!10737))

(declare-fun b!240735 () Bool)

(declare-fun e!156234 () Bool)

(assert (=> b!240735 (= e!156234 e!156236)))

(declare-fun res!118048 () Bool)

(assert (=> b!240735 (=> (not res!118048) (not e!156236))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240735 (= res!118048 (inRange!0 index!297 (mask!10520 thiss!1504)))))

(declare-fun lt!121043 () Unit!7407)

(declare-fun e!156240 () Unit!7407)

(assert (=> b!240735 (= lt!121043 e!156240)))

(declare-fun c!40091 () Bool)

(assert (=> b!240735 (= c!40091 lt!121040)))

(declare-datatypes ((tuple2!4734 0))(
  ( (tuple2!4735 (_1!2378 (_ BitVec 64)) (_2!2378 V!8097)) )
))
(declare-datatypes ((List!3618 0))(
  ( (Nil!3615) (Cons!3614 (h!4270 tuple2!4734) (t!8613 List!3618)) )
))
(declare-datatypes ((ListLongMap!3647 0))(
  ( (ListLongMap!3648 (toList!1839 List!3618)) )
))
(declare-fun contains!1727 (ListLongMap!3647 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1367 (array!11955 array!11953 (_ BitVec 32) (_ BitVec 32) V!8097 V!8097 (_ BitVec 32) Int) ListLongMap!3647)

(assert (=> b!240735 (= lt!121040 (contains!1727 (getCurrentListMap!1367 (_keys!6562 thiss!1504) (_values!4443 thiss!1504) (mask!10520 thiss!1504) (extraKeys!4197 thiss!1504) (zeroValue!4301 thiss!1504) (minValue!4301 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4460 thiss!1504)) key!932))))

(declare-fun b!240736 () Bool)

(declare-fun e!156239 () Bool)

(assert (=> b!240736 (= e!156231 (and e!156239 mapRes!10737))))

(declare-fun condMapEmpty!10737 () Bool)

(declare-fun mapDefault!10737 () ValueCell!2825)

