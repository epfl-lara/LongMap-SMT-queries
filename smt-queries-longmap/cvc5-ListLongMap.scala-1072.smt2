; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22114 () Bool)

(assert start!22114)

(declare-fun b!230116 () Bool)

(declare-fun b_free!6181 () Bool)

(declare-fun b_next!6181 () Bool)

(assert (=> b!230116 (= b_free!6181 (not b_next!6181))))

(declare-fun tp!21684 () Bool)

(declare-fun b_and!13079 () Bool)

(assert (=> b!230116 (= tp!21684 b_and!13079)))

(declare-fun b!230100 () Bool)

(declare-fun e!149313 () Bool)

(assert (=> b!230100 (= e!149313 (not true))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7705 0))(
  ( (V!7706 (val!3066 Int)) )
))
(declare-datatypes ((ValueCell!2678 0))(
  ( (ValueCellFull!2678 (v!5086 V!7705)) (EmptyCell!2678) )
))
(declare-datatypes ((array!11329 0))(
  ( (array!11330 (arr!5384 (Array (_ BitVec 32) ValueCell!2678)) (size!5717 (_ BitVec 32))) )
))
(declare-datatypes ((array!11331 0))(
  ( (array!11332 (arr!5385 (Array (_ BitVec 32) (_ BitVec 64))) (size!5718 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3256 0))(
  ( (LongMapFixedSize!3257 (defaultEntry!4287 Int) (mask!10175 (_ BitVec 32)) (extraKeys!4024 (_ BitVec 32)) (zeroValue!4128 V!7705) (minValue!4128 V!7705) (_size!1677 (_ BitVec 32)) (_keys!6341 array!11331) (_values!4270 array!11329) (_vacant!1677 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3256)

(declare-datatypes ((tuple2!4524 0))(
  ( (tuple2!4525 (_1!2273 (_ BitVec 64)) (_2!2273 V!7705)) )
))
(declare-datatypes ((List!3447 0))(
  ( (Nil!3444) (Cons!3443 (h!4091 tuple2!4524) (t!8406 List!3447)) )
))
(declare-datatypes ((ListLongMap!3437 0))(
  ( (ListLongMap!3438 (toList!1734 List!3447)) )
))
(declare-fun lt!115778 () ListLongMap!3437)

(declare-fun v!346 () V!7705)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lt!115771 () array!11331)

(declare-fun +!602 (ListLongMap!3437 tuple2!4524) ListLongMap!3437)

(declare-fun getCurrentListMap!1262 (array!11331 array!11329 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 32) Int) ListLongMap!3437)

(assert (=> b!230100 (= (+!602 lt!115778 (tuple2!4525 key!932 v!346)) (getCurrentListMap!1262 lt!115771 (array!11330 (store (arr!5384 (_values!4270 thiss!1504)) index!297 (ValueCellFull!2678 v!346)) (size!5717 (_values!4270 thiss!1504))) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4287 thiss!1504)))))

(declare-datatypes ((Unit!7036 0))(
  ( (Unit!7037) )
))
(declare-fun lt!115773 () Unit!7036)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!56 (array!11331 array!11329 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 32) (_ BitVec 64) V!7705 Int) Unit!7036)

(assert (=> b!230100 (= lt!115773 (lemmaAddValidKeyToArrayThenAddPairToListMap!56 (_keys!6341 thiss!1504) (_values!4270 thiss!1504) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) index!297 key!932 v!346 (defaultEntry!4287 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11331 (_ BitVec 32)) Bool)

(assert (=> b!230100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115771 (mask!10175 thiss!1504))))

(declare-fun lt!115772 () Unit!7036)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11331 (_ BitVec 32) (_ BitVec 32)) Unit!7036)

(assert (=> b!230100 (= lt!115772 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6341 thiss!1504) index!297 (mask!10175 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11331 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230100 (= (arrayCountValidKeys!0 lt!115771 #b00000000000000000000000000000000 (size!5718 (_keys!6341 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6341 thiss!1504) #b00000000000000000000000000000000 (size!5718 (_keys!6341 thiss!1504)))))))

(declare-fun lt!115777 () Unit!7036)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11331 (_ BitVec 32) (_ BitVec 64)) Unit!7036)

(assert (=> b!230100 (= lt!115777 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6341 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3448 0))(
  ( (Nil!3445) (Cons!3444 (h!4092 (_ BitVec 64)) (t!8407 List!3448)) )
))
(declare-fun arrayNoDuplicates!0 (array!11331 (_ BitVec 32) List!3448) Bool)

(assert (=> b!230100 (arrayNoDuplicates!0 lt!115771 #b00000000000000000000000000000000 Nil!3445)))

(assert (=> b!230100 (= lt!115771 (array!11332 (store (arr!5385 (_keys!6341 thiss!1504)) index!297 key!932) (size!5718 (_keys!6341 thiss!1504))))))

(declare-fun lt!115774 () Unit!7036)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11331 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3448) Unit!7036)

(assert (=> b!230100 (= lt!115774 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6341 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3445))))

(declare-fun lt!115775 () Unit!7036)

(declare-fun e!149307 () Unit!7036)

(assert (=> b!230100 (= lt!115775 e!149307)))

(declare-fun c!38183 () Bool)

(declare-fun arrayContainsKey!0 (array!11331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230100 (= c!38183 (arrayContainsKey!0 (_keys!6341 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230101 () Bool)

(declare-fun Unit!7038 () Unit!7036)

(assert (=> b!230101 (= e!149307 Unit!7038)))

(declare-fun lt!115781 () Unit!7036)

(declare-fun lemmaArrayContainsKeyThenInListMap!121 (array!11331 array!11329 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 64) (_ BitVec 32) Int) Unit!7036)

(assert (=> b!230101 (= lt!115781 (lemmaArrayContainsKeyThenInListMap!121 (_keys!6341 thiss!1504) (_values!4270 thiss!1504) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4287 thiss!1504)))))

(assert (=> b!230101 false))

(declare-fun b!230102 () Bool)

(declare-fun e!149310 () Unit!7036)

(declare-fun Unit!7039 () Unit!7036)

(assert (=> b!230102 (= e!149310 Unit!7039)))

(declare-fun lt!115770 () Unit!7036)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!287 (array!11331 array!11329 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 64) Int) Unit!7036)

(assert (=> b!230102 (= lt!115770 (lemmaInListMapThenSeekEntryOrOpenFindsIt!287 (_keys!6341 thiss!1504) (_values!4270 thiss!1504) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) key!932 (defaultEntry!4287 thiss!1504)))))

(assert (=> b!230102 false))

(declare-fun mapNonEmpty!10234 () Bool)

(declare-fun mapRes!10234 () Bool)

(declare-fun tp!21685 () Bool)

(declare-fun e!149309 () Bool)

(assert (=> mapNonEmpty!10234 (= mapRes!10234 (and tp!21685 e!149309))))

(declare-fun mapValue!10234 () ValueCell!2678)

(declare-fun mapKey!10234 () (_ BitVec 32))

(declare-fun mapRest!10234 () (Array (_ BitVec 32) ValueCell!2678))

(assert (=> mapNonEmpty!10234 (= (arr!5384 (_values!4270 thiss!1504)) (store mapRest!10234 mapKey!10234 mapValue!10234))))

(declare-fun b!230104 () Bool)

(declare-fun e!149318 () Bool)

(declare-fun e!149306 () Bool)

(assert (=> b!230104 (= e!149318 e!149306)))

(declare-fun res!113204 () Bool)

(declare-fun call!21378 () Bool)

(assert (=> b!230104 (= res!113204 call!21378)))

(assert (=> b!230104 (=> (not res!113204) (not e!149306))))

(declare-fun b!230105 () Bool)

(declare-fun Unit!7040 () Unit!7036)

(assert (=> b!230105 (= e!149307 Unit!7040)))

(declare-fun b!230106 () Bool)

(declare-fun lt!115780 () Unit!7036)

(assert (=> b!230106 (= e!149310 lt!115780)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!304 (array!11331 array!11329 (_ BitVec 32) (_ BitVec 32) V!7705 V!7705 (_ BitVec 64) Int) Unit!7036)

(assert (=> b!230106 (= lt!115780 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!304 (_keys!6341 thiss!1504) (_values!4270 thiss!1504) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) key!932 (defaultEntry!4287 thiss!1504)))))

(declare-fun c!38181 () Bool)

(declare-datatypes ((SeekEntryResult!932 0))(
  ( (MissingZero!932 (index!5898 (_ BitVec 32))) (Found!932 (index!5899 (_ BitVec 32))) (Intermediate!932 (undefined!1744 Bool) (index!5900 (_ BitVec 32)) (x!23424 (_ BitVec 32))) (Undefined!932) (MissingVacant!932 (index!5901 (_ BitVec 32))) )
))
(declare-fun lt!115776 () SeekEntryResult!932)

(assert (=> b!230106 (= c!38181 (is-MissingZero!932 lt!115776))))

(declare-fun e!149308 () Bool)

(assert (=> b!230106 e!149308))

(declare-fun b!230107 () Bool)

(declare-fun res!113203 () Bool)

(assert (=> b!230107 (= res!113203 (= (select (arr!5385 (_keys!6341 thiss!1504)) (index!5901 lt!115776)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230107 (=> (not res!113203) (not e!149306))))

(declare-fun mapIsEmpty!10234 () Bool)

(assert (=> mapIsEmpty!10234 mapRes!10234))

(declare-fun b!230108 () Bool)

(declare-fun tp_is_empty!6043 () Bool)

(assert (=> b!230108 (= e!149309 tp_is_empty!6043)))

(declare-fun b!230109 () Bool)

(declare-fun e!149314 () Bool)

(declare-fun e!149305 () Bool)

(assert (=> b!230109 (= e!149314 e!149305)))

(declare-fun res!113206 () Bool)

(assert (=> b!230109 (=> (not res!113206) (not e!149305))))

(assert (=> b!230109 (= res!113206 (or (= lt!115776 (MissingZero!932 index!297)) (= lt!115776 (MissingVacant!932 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11331 (_ BitVec 32)) SeekEntryResult!932)

(assert (=> b!230109 (= lt!115776 (seekEntryOrOpen!0 key!932 (_keys!6341 thiss!1504) (mask!10175 thiss!1504)))))

(declare-fun b!230110 () Bool)

(declare-fun res!113202 () Bool)

(assert (=> b!230110 (=> (not res!113202) (not e!149314))))

(assert (=> b!230110 (= res!113202 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230111 () Bool)

(declare-fun call!21377 () Bool)

(assert (=> b!230111 (= e!149306 (not call!21377))))

(declare-fun b!230112 () Bool)

(assert (=> b!230112 (= e!149318 (is-Undefined!932 lt!115776))))

(declare-fun b!230113 () Bool)

(declare-fun res!113208 () Bool)

(declare-fun e!149316 () Bool)

(assert (=> b!230113 (=> (not res!113208) (not e!149316))))

(assert (=> b!230113 (= res!113208 call!21378)))

(assert (=> b!230113 (= e!149308 e!149316)))

(declare-fun b!230114 () Bool)

(declare-fun c!38182 () Bool)

(assert (=> b!230114 (= c!38182 (is-MissingVacant!932 lt!115776))))

(assert (=> b!230114 (= e!149308 e!149318)))

(declare-fun b!230115 () Bool)

(assert (=> b!230115 (= e!149316 (not call!21377))))

(declare-fun b!230103 () Bool)

(declare-fun res!113205 () Bool)

(assert (=> b!230103 (=> (not res!113205) (not e!149316))))

(assert (=> b!230103 (= res!113205 (= (select (arr!5385 (_keys!6341 thiss!1504)) (index!5898 lt!115776)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!113207 () Bool)

(assert (=> start!22114 (=> (not res!113207) (not e!149314))))

(declare-fun valid!1298 (LongMapFixedSize!3256) Bool)

(assert (=> start!22114 (= res!113207 (valid!1298 thiss!1504))))

(assert (=> start!22114 e!149314))

(declare-fun e!149315 () Bool)

(assert (=> start!22114 e!149315))

(assert (=> start!22114 true))

(assert (=> start!22114 tp_is_empty!6043))

(declare-fun e!149311 () Bool)

(declare-fun array_inv!3553 (array!11331) Bool)

(declare-fun array_inv!3554 (array!11329) Bool)

(assert (=> b!230116 (= e!149315 (and tp!21684 tp_is_empty!6043 (array_inv!3553 (_keys!6341 thiss!1504)) (array_inv!3554 (_values!4270 thiss!1504)) e!149311))))

(declare-fun bm!21374 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21374 (= call!21378 (inRange!0 (ite c!38181 (index!5898 lt!115776) (index!5901 lt!115776)) (mask!10175 thiss!1504)))))

(declare-fun bm!21375 () Bool)

(assert (=> bm!21375 (= call!21377 (arrayContainsKey!0 (_keys!6341 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230117 () Bool)

(declare-fun e!149317 () Bool)

(assert (=> b!230117 (= e!149317 tp_is_empty!6043)))

(declare-fun b!230118 () Bool)

(assert (=> b!230118 (= e!149305 e!149313)))

(declare-fun res!113209 () Bool)

(assert (=> b!230118 (=> (not res!113209) (not e!149313))))

(assert (=> b!230118 (= res!113209 (inRange!0 index!297 (mask!10175 thiss!1504)))))

(declare-fun lt!115779 () Unit!7036)

(assert (=> b!230118 (= lt!115779 e!149310)))

(declare-fun c!38184 () Bool)

(declare-fun contains!1607 (ListLongMap!3437 (_ BitVec 64)) Bool)

(assert (=> b!230118 (= c!38184 (contains!1607 lt!115778 key!932))))

(assert (=> b!230118 (= lt!115778 (getCurrentListMap!1262 (_keys!6341 thiss!1504) (_values!4270 thiss!1504) (mask!10175 thiss!1504) (extraKeys!4024 thiss!1504) (zeroValue!4128 thiss!1504) (minValue!4128 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4287 thiss!1504)))))

(declare-fun b!230119 () Bool)

(assert (=> b!230119 (= e!149311 (and e!149317 mapRes!10234))))

(declare-fun condMapEmpty!10234 () Bool)

(declare-fun mapDefault!10234 () ValueCell!2678)

