; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23706 () Bool)

(assert start!23706)

(declare-fun b!249182 () Bool)

(declare-fun b_free!6617 () Bool)

(declare-fun b_next!6617 () Bool)

(assert (=> b!249182 (= b_free!6617 (not b_next!6617))))

(declare-fun tp!23108 () Bool)

(declare-fun b_and!13625 () Bool)

(assert (=> b!249182 (= tp!23108 b_and!13625)))

(declare-fun b!249166 () Bool)

(declare-fun res!122084 () Bool)

(declare-fun e!161629 () Bool)

(assert (=> b!249166 (=> (not res!122084) (not e!161629))))

(declare-datatypes ((V!8285 0))(
  ( (V!8286 (val!3284 Int)) )
))
(declare-datatypes ((ValueCell!2896 0))(
  ( (ValueCellFull!2896 (v!5345 V!8285)) (EmptyCell!2896) )
))
(declare-datatypes ((array!12271 0))(
  ( (array!12272 (arr!5820 (Array (_ BitVec 32) ValueCell!2896)) (size!6163 (_ BitVec 32))) )
))
(declare-datatypes ((array!12273 0))(
  ( (array!12274 (arr!5821 (Array (_ BitVec 32) (_ BitVec 64))) (size!6164 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3692 0))(
  ( (LongMapFixedSize!3693 (defaultEntry!4607 Int) (mask!10768 (_ BitVec 32)) (extraKeys!4344 (_ BitVec 32)) (zeroValue!4448 V!8285) (minValue!4448 V!8285) (_size!1895 (_ BitVec 32)) (_keys!6735 array!12273) (_values!4590 array!12271) (_vacant!1895 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3692)

(declare-datatypes ((SeekEntryResult!1117 0))(
  ( (MissingZero!1117 (index!6638 (_ BitVec 32))) (Found!1117 (index!6639 (_ BitVec 32))) (Intermediate!1117 (undefined!1929 Bool) (index!6640 (_ BitVec 32)) (x!24615 (_ BitVec 32))) (Undefined!1117) (MissingVacant!1117 (index!6641 (_ BitVec 32))) )
))
(declare-fun lt!124795 () SeekEntryResult!1117)

(assert (=> b!249166 (= res!122084 (= (select (arr!5821 (_keys!6735 thiss!1504)) (index!6638 lt!124795)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249167 () Bool)

(declare-fun res!122080 () Bool)

(declare-fun e!161626 () Bool)

(assert (=> b!249167 (=> (not res!122080) (not e!161626))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!249167 (= res!122080 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!249168 () Bool)

(declare-datatypes ((Unit!7719 0))(
  ( (Unit!7720) )
))
(declare-fun e!161622 () Unit!7719)

(declare-fun lt!124794 () Unit!7719)

(assert (=> b!249168 (= e!161622 lt!124794)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!397 (array!12273 array!12271 (_ BitVec 32) (_ BitVec 32) V!8285 V!8285 (_ BitVec 64) Int) Unit!7719)

(assert (=> b!249168 (= lt!124794 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!397 (_keys!6735 thiss!1504) (_values!4590 thiss!1504) (mask!10768 thiss!1504) (extraKeys!4344 thiss!1504) (zeroValue!4448 thiss!1504) (minValue!4448 thiss!1504) key!932 (defaultEntry!4607 thiss!1504)))))

(declare-fun c!41778 () Bool)

(assert (=> b!249168 (= c!41778 (is-MissingZero!1117 lt!124795))))

(declare-fun e!161631 () Bool)

(assert (=> b!249168 e!161631))

(declare-fun call!23384 () Bool)

(declare-fun bm!23381 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23381 (= call!23384 (inRange!0 (ite c!41778 (index!6638 lt!124795) (index!6641 lt!124795)) (mask!10768 thiss!1504)))))

(declare-fun b!249169 () Bool)

(declare-fun e!161620 () Bool)

(declare-fun e!161618 () Bool)

(assert (=> b!249169 (= e!161620 e!161618)))

(declare-fun res!122079 () Bool)

(assert (=> b!249169 (= res!122079 call!23384)))

(assert (=> b!249169 (=> (not res!122079) (not e!161618))))

(declare-fun b!249170 () Bool)

(declare-fun e!161623 () Bool)

(declare-fun tp_is_empty!6479 () Bool)

(assert (=> b!249170 (= e!161623 tp_is_empty!6479)))

(declare-fun b!249171 () Bool)

(declare-fun res!122086 () Bool)

(assert (=> b!249171 (=> (not res!122086) (not e!161629))))

(assert (=> b!249171 (= res!122086 call!23384)))

(assert (=> b!249171 (= e!161631 e!161629)))

(declare-fun b!249172 () Bool)

(declare-fun res!122082 () Bool)

(assert (=> b!249172 (= res!122082 (= (select (arr!5821 (_keys!6735 thiss!1504)) (index!6641 lt!124795)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249172 (=> (not res!122082) (not e!161618))))

(declare-fun b!249173 () Bool)

(declare-fun e!161625 () Unit!7719)

(declare-fun Unit!7721 () Unit!7719)

(assert (=> b!249173 (= e!161625 Unit!7721)))

(declare-fun lt!124792 () Unit!7719)

(declare-fun lemmaArrayContainsKeyThenInListMap!198 (array!12273 array!12271 (_ BitVec 32) (_ BitVec 32) V!8285 V!8285 (_ BitVec 64) (_ BitVec 32) Int) Unit!7719)

(assert (=> b!249173 (= lt!124792 (lemmaArrayContainsKeyThenInListMap!198 (_keys!6735 thiss!1504) (_values!4590 thiss!1504) (mask!10768 thiss!1504) (extraKeys!4344 thiss!1504) (zeroValue!4448 thiss!1504) (minValue!4448 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4607 thiss!1504)))))

(assert (=> b!249173 false))

(declare-fun b!249174 () Bool)

(declare-fun e!161619 () Bool)

(assert (=> b!249174 (= e!161619 (= (size!6163 (_values!4590 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10768 thiss!1504))))))

(declare-fun res!122085 () Bool)

(assert (=> start!23706 (=> (not res!122085) (not e!161626))))

(declare-fun valid!1445 (LongMapFixedSize!3692) Bool)

(assert (=> start!23706 (= res!122085 (valid!1445 thiss!1504))))

(assert (=> start!23706 e!161626))

(declare-fun e!161630 () Bool)

(assert (=> start!23706 e!161630))

(assert (=> start!23706 true))

(declare-fun mapIsEmpty!11003 () Bool)

(declare-fun mapRes!11003 () Bool)

(assert (=> mapIsEmpty!11003 mapRes!11003))

(declare-fun b!249175 () Bool)

(declare-fun Unit!7722 () Unit!7719)

(assert (=> b!249175 (= e!161622 Unit!7722)))

(declare-fun lt!124796 () Unit!7719)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!394 (array!12273 array!12271 (_ BitVec 32) (_ BitVec 32) V!8285 V!8285 (_ BitVec 64) Int) Unit!7719)

(assert (=> b!249175 (= lt!124796 (lemmaInListMapThenSeekEntryOrOpenFindsIt!394 (_keys!6735 thiss!1504) (_values!4590 thiss!1504) (mask!10768 thiss!1504) (extraKeys!4344 thiss!1504) (zeroValue!4448 thiss!1504) (minValue!4448 thiss!1504) key!932 (defaultEntry!4607 thiss!1504)))))

(assert (=> b!249175 false))

(declare-fun b!249176 () Bool)

(declare-fun c!41779 () Bool)

(assert (=> b!249176 (= c!41779 (is-MissingVacant!1117 lt!124795))))

(assert (=> b!249176 (= e!161631 e!161620)))

(declare-fun b!249177 () Bool)

(declare-fun e!161624 () Bool)

(assert (=> b!249177 (= e!161624 (not e!161619))))

(declare-fun res!122083 () Bool)

(assert (=> b!249177 (=> res!122083 e!161619)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!249177 (= res!122083 (not (validMask!0 (mask!10768 thiss!1504))))))

(declare-fun lt!124797 () array!12273)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12273 (_ BitVec 32)) Bool)

(assert (=> b!249177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124797 (mask!10768 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!124791 () Unit!7719)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12273 (_ BitVec 32) (_ BitVec 32)) Unit!7719)

(assert (=> b!249177 (= lt!124791 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6735 thiss!1504) index!297 (mask!10768 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12273 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249177 (= (arrayCountValidKeys!0 lt!124797 #b00000000000000000000000000000000 (size!6164 (_keys!6735 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6735 thiss!1504) #b00000000000000000000000000000000 (size!6164 (_keys!6735 thiss!1504)))))))

(declare-fun lt!124793 () Unit!7719)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12273 (_ BitVec 32) (_ BitVec 64)) Unit!7719)

(assert (=> b!249177 (= lt!124793 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6735 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3715 0))(
  ( (Nil!3712) (Cons!3711 (h!4369 (_ BitVec 64)) (t!8744 List!3715)) )
))
(declare-fun arrayNoDuplicates!0 (array!12273 (_ BitVec 32) List!3715) Bool)

(assert (=> b!249177 (arrayNoDuplicates!0 lt!124797 #b00000000000000000000000000000000 Nil!3712)))

(assert (=> b!249177 (= lt!124797 (array!12274 (store (arr!5821 (_keys!6735 thiss!1504)) index!297 key!932) (size!6164 (_keys!6735 thiss!1504))))))

(declare-fun lt!124790 () Unit!7719)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12273 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3715) Unit!7719)

(assert (=> b!249177 (= lt!124790 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6735 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3712))))

(declare-fun lt!124788 () Unit!7719)

(assert (=> b!249177 (= lt!124788 e!161625)))

(declare-fun c!41781 () Bool)

(declare-fun arrayContainsKey!0 (array!12273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!249177 (= c!41781 (arrayContainsKey!0 (_keys!6735 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249178 () Bool)

(declare-fun Unit!7723 () Unit!7719)

(assert (=> b!249178 (= e!161625 Unit!7723)))

(declare-fun b!249179 () Bool)

(declare-fun e!161621 () Bool)

(assert (=> b!249179 (= e!161626 e!161621)))

(declare-fun res!122081 () Bool)

(assert (=> b!249179 (=> (not res!122081) (not e!161621))))

(assert (=> b!249179 (= res!122081 (or (= lt!124795 (MissingZero!1117 index!297)) (= lt!124795 (MissingVacant!1117 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12273 (_ BitVec 32)) SeekEntryResult!1117)

(assert (=> b!249179 (= lt!124795 (seekEntryOrOpen!0 key!932 (_keys!6735 thiss!1504) (mask!10768 thiss!1504)))))

(declare-fun mapNonEmpty!11003 () Bool)

(declare-fun tp!23107 () Bool)

(assert (=> mapNonEmpty!11003 (= mapRes!11003 (and tp!23107 e!161623))))

(declare-fun mapValue!11003 () ValueCell!2896)

(declare-fun mapRest!11003 () (Array (_ BitVec 32) ValueCell!2896))

(declare-fun mapKey!11003 () (_ BitVec 32))

(assert (=> mapNonEmpty!11003 (= (arr!5820 (_values!4590 thiss!1504)) (store mapRest!11003 mapKey!11003 mapValue!11003))))

(declare-fun bm!23382 () Bool)

(declare-fun call!23385 () Bool)

(assert (=> bm!23382 (= call!23385 (arrayContainsKey!0 (_keys!6735 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249180 () Bool)

(assert (=> b!249180 (= e!161621 e!161624)))

(declare-fun res!122078 () Bool)

(assert (=> b!249180 (=> (not res!122078) (not e!161624))))

(assert (=> b!249180 (= res!122078 (inRange!0 index!297 (mask!10768 thiss!1504)))))

(declare-fun lt!124789 () Unit!7719)

(assert (=> b!249180 (= lt!124789 e!161622)))

(declare-fun c!41780 () Bool)

(declare-datatypes ((tuple2!4834 0))(
  ( (tuple2!4835 (_1!2428 (_ BitVec 64)) (_2!2428 V!8285)) )
))
(declare-datatypes ((List!3716 0))(
  ( (Nil!3713) (Cons!3712 (h!4370 tuple2!4834) (t!8745 List!3716)) )
))
(declare-datatypes ((ListLongMap!3747 0))(
  ( (ListLongMap!3748 (toList!1889 List!3716)) )
))
(declare-fun contains!1806 (ListLongMap!3747 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1417 (array!12273 array!12271 (_ BitVec 32) (_ BitVec 32) V!8285 V!8285 (_ BitVec 32) Int) ListLongMap!3747)

(assert (=> b!249180 (= c!41780 (contains!1806 (getCurrentListMap!1417 (_keys!6735 thiss!1504) (_values!4590 thiss!1504) (mask!10768 thiss!1504) (extraKeys!4344 thiss!1504) (zeroValue!4448 thiss!1504) (minValue!4448 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4607 thiss!1504)) key!932))))

(declare-fun b!249181 () Bool)

(assert (=> b!249181 (= e!161629 (not call!23385))))

(declare-fun e!161632 () Bool)

(declare-fun array_inv!3841 (array!12273) Bool)

(declare-fun array_inv!3842 (array!12271) Bool)

(assert (=> b!249182 (= e!161630 (and tp!23108 tp_is_empty!6479 (array_inv!3841 (_keys!6735 thiss!1504)) (array_inv!3842 (_values!4590 thiss!1504)) e!161632))))

(declare-fun b!249183 () Bool)

(declare-fun e!161627 () Bool)

(assert (=> b!249183 (= e!161632 (and e!161627 mapRes!11003))))

(declare-fun condMapEmpty!11003 () Bool)

(declare-fun mapDefault!11003 () ValueCell!2896)

