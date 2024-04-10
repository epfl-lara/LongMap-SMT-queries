; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22918 () Bool)

(assert start!22918)

(declare-fun b!239006 () Bool)

(declare-fun b_free!6421 () Bool)

(declare-fun b_next!6421 () Bool)

(assert (=> b!239006 (= b_free!6421 (not b_next!6421))))

(declare-fun tp!22467 () Bool)

(declare-fun b_and!13387 () Bool)

(assert (=> b!239006 (= tp!22467 b_and!13387)))

(declare-fun c!39846 () Bool)

(declare-fun call!22223 () Bool)

(declare-datatypes ((V!8025 0))(
  ( (V!8026 (val!3186 Int)) )
))
(declare-datatypes ((ValueCell!2798 0))(
  ( (ValueCellFull!2798 (v!5224 V!8025)) (EmptyCell!2798) )
))
(declare-datatypes ((array!11845 0))(
  ( (array!11846 (arr!5624 (Array (_ BitVec 32) ValueCell!2798)) (size!5965 (_ BitVec 32))) )
))
(declare-datatypes ((array!11847 0))(
  ( (array!11848 (arr!5625 (Array (_ BitVec 32) (_ BitVec 64))) (size!5966 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3496 0))(
  ( (LongMapFixedSize!3497 (defaultEntry!4433 Int) (mask!10475 (_ BitVec 32)) (extraKeys!4170 (_ BitVec 32)) (zeroValue!4274 V!8025) (minValue!4274 V!8025) (_size!1797 (_ BitVec 32)) (_keys!6535 array!11847) (_values!4416 array!11845) (_vacant!1797 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3496)

(declare-datatypes ((SeekEntryResult!1026 0))(
  ( (MissingZero!1026 (index!6274 (_ BitVec 32))) (Found!1026 (index!6275 (_ BitVec 32))) (Intermediate!1026 (undefined!1838 Bool) (index!6276 (_ BitVec 32)) (x!24082 (_ BitVec 32))) (Undefined!1026) (MissingVacant!1026 (index!6277 (_ BitVec 32))) )
))
(declare-fun lt!120705 () SeekEntryResult!1026)

(declare-fun bm!22220 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22220 (= call!22223 (inRange!0 (ite c!39846 (index!6274 lt!120705) (index!6277 lt!120705)) (mask!10475 thiss!1504)))))

(declare-fun b!239000 () Bool)

(declare-fun e!155176 () Bool)

(assert (=> b!239000 (= e!155176 (is-Undefined!1026 lt!120705))))

(declare-fun b!239001 () Bool)

(declare-fun e!155182 () Bool)

(declare-fun e!155187 () Bool)

(assert (=> b!239001 (= e!155182 e!155187)))

(declare-fun res!117136 () Bool)

(assert (=> b!239001 (=> (not res!117136) (not e!155187))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239001 (= res!117136 (inRange!0 index!297 (mask!10475 thiss!1504)))))

(declare-datatypes ((Unit!7333 0))(
  ( (Unit!7334) )
))
(declare-fun lt!120702 () Unit!7333)

(declare-fun e!155175 () Unit!7333)

(assert (=> b!239001 (= lt!120702 e!155175)))

(declare-fun c!39847 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4694 0))(
  ( (tuple2!4695 (_1!2358 (_ BitVec 64)) (_2!2358 V!8025)) )
))
(declare-datatypes ((List!3589 0))(
  ( (Nil!3586) (Cons!3585 (h!4241 tuple2!4694) (t!8584 List!3589)) )
))
(declare-datatypes ((ListLongMap!3607 0))(
  ( (ListLongMap!3608 (toList!1819 List!3589)) )
))
(declare-fun contains!1707 (ListLongMap!3607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1347 (array!11847 array!11845 (_ BitVec 32) (_ BitVec 32) V!8025 V!8025 (_ BitVec 32) Int) ListLongMap!3607)

(assert (=> b!239001 (= c!39847 (contains!1707 (getCurrentListMap!1347 (_keys!6535 thiss!1504) (_values!4416 thiss!1504) (mask!10475 thiss!1504) (extraKeys!4170 thiss!1504) (zeroValue!4274 thiss!1504) (minValue!4274 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4433 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10656 () Bool)

(declare-fun mapRes!10656 () Bool)

(assert (=> mapIsEmpty!10656 mapRes!10656))

(declare-fun b!239002 () Bool)

(declare-fun e!155178 () Bool)

(declare-fun tp_is_empty!6283 () Bool)

(assert (=> b!239002 (= e!155178 tp_is_empty!6283)))

(declare-fun b!239003 () Bool)

(declare-fun e!155181 () Bool)

(declare-fun call!22224 () Bool)

(assert (=> b!239003 (= e!155181 (not call!22224))))

(declare-fun mapNonEmpty!10656 () Bool)

(declare-fun tp!22466 () Bool)

(declare-fun e!155179 () Bool)

(assert (=> mapNonEmpty!10656 (= mapRes!10656 (and tp!22466 e!155179))))

(declare-fun mapRest!10656 () (Array (_ BitVec 32) ValueCell!2798))

(declare-fun mapValue!10656 () ValueCell!2798)

(declare-fun mapKey!10656 () (_ BitVec 32))

(assert (=> mapNonEmpty!10656 (= (arr!5624 (_values!4416 thiss!1504)) (store mapRest!10656 mapKey!10656 mapValue!10656))))

(declare-fun b!239004 () Bool)

(declare-fun Unit!7335 () Unit!7333)

(assert (=> b!239004 (= e!155175 Unit!7335)))

(declare-fun lt!120704 () Unit!7333)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!321 (array!11847 array!11845 (_ BitVec 32) (_ BitVec 32) V!8025 V!8025 (_ BitVec 64) Int) Unit!7333)

(assert (=> b!239004 (= lt!120704 (lemmaInListMapThenSeekEntryOrOpenFindsIt!321 (_keys!6535 thiss!1504) (_values!4416 thiss!1504) (mask!10475 thiss!1504) (extraKeys!4170 thiss!1504) (zeroValue!4274 thiss!1504) (minValue!4274 thiss!1504) key!932 (defaultEntry!4433 thiss!1504)))))

(assert (=> b!239004 false))

(declare-fun b!239005 () Bool)

(declare-fun res!117137 () Bool)

(assert (=> b!239005 (=> (not res!117137) (not e!155181))))

(assert (=> b!239005 (= res!117137 (= (select (arr!5625 (_keys!6535 thiss!1504)) (index!6274 lt!120705)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155186 () Bool)

(declare-fun e!155184 () Bool)

(declare-fun array_inv!3719 (array!11847) Bool)

(declare-fun array_inv!3720 (array!11845) Bool)

(assert (=> b!239006 (= e!155186 (and tp!22467 tp_is_empty!6283 (array_inv!3719 (_keys!6535 thiss!1504)) (array_inv!3720 (_values!4416 thiss!1504)) e!155184))))

(declare-fun b!239008 () Bool)

(declare-fun e!155183 () Bool)

(assert (=> b!239008 (= e!155183 e!155182)))

(declare-fun res!117132 () Bool)

(assert (=> b!239008 (=> (not res!117132) (not e!155182))))

(assert (=> b!239008 (= res!117132 (or (= lt!120705 (MissingZero!1026 index!297)) (= lt!120705 (MissingVacant!1026 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11847 (_ BitVec 32)) SeekEntryResult!1026)

(assert (=> b!239008 (= lt!120705 (seekEntryOrOpen!0 key!932 (_keys!6535 thiss!1504) (mask!10475 thiss!1504)))))

(declare-fun b!239009 () Bool)

(declare-fun res!117130 () Bool)

(assert (=> b!239009 (=> (not res!117130) (not e!155181))))

(assert (=> b!239009 (= res!117130 call!22223)))

(declare-fun e!155185 () Bool)

(assert (=> b!239009 (= e!155185 e!155181)))

(declare-fun b!239010 () Bool)

(declare-fun res!117131 () Bool)

(assert (=> b!239010 (= res!117131 (= (select (arr!5625 (_keys!6535 thiss!1504)) (index!6277 lt!120705)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155180 () Bool)

(assert (=> b!239010 (=> (not res!117131) (not e!155180))))

(declare-fun b!239011 () Bool)

(declare-fun res!117135 () Bool)

(assert (=> b!239011 (=> (not res!117135) (not e!155183))))

(assert (=> b!239011 (= res!117135 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!22221 () Bool)

(declare-fun arrayContainsKey!0 (array!11847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22221 (= call!22224 (arrayContainsKey!0 (_keys!6535 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239012 () Bool)

(declare-fun lt!120703 () Unit!7333)

(assert (=> b!239012 (= e!155175 lt!120703)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!337 (array!11847 array!11845 (_ BitVec 32) (_ BitVec 32) V!8025 V!8025 (_ BitVec 64) Int) Unit!7333)

(assert (=> b!239012 (= lt!120703 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!337 (_keys!6535 thiss!1504) (_values!4416 thiss!1504) (mask!10475 thiss!1504) (extraKeys!4170 thiss!1504) (zeroValue!4274 thiss!1504) (minValue!4274 thiss!1504) key!932 (defaultEntry!4433 thiss!1504)))))

(assert (=> b!239012 (= c!39846 (is-MissingZero!1026 lt!120705))))

(assert (=> b!239012 e!155185))

(declare-fun b!239013 () Bool)

(declare-fun res!117134 () Bool)

(assert (=> b!239013 (=> (not res!117134) (not e!155187))))

(assert (=> b!239013 (= res!117134 (arrayContainsKey!0 (_keys!6535 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239014 () Bool)

(assert (=> b!239014 (= e!155180 (not call!22224))))

(declare-fun b!239015 () Bool)

(declare-fun res!117128 () Bool)

(assert (=> b!239015 (=> (not res!117128) (not e!155187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239015 (= res!117128 (validMask!0 (mask!10475 thiss!1504)))))

(declare-fun b!239016 () Bool)

(declare-fun c!39848 () Bool)

(assert (=> b!239016 (= c!39848 (is-MissingVacant!1026 lt!120705))))

(assert (=> b!239016 (= e!155185 e!155176)))

(declare-fun b!239017 () Bool)

(assert (=> b!239017 (= e!155184 (and e!155178 mapRes!10656))))

(declare-fun condMapEmpty!10656 () Bool)

(declare-fun mapDefault!10656 () ValueCell!2798)

