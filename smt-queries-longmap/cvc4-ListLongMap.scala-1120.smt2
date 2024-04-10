; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22970 () Bool)

(assert start!22970)

(declare-fun b!240676 () Bool)

(declare-fun b_free!6473 () Bool)

(declare-fun b_next!6473 () Bool)

(assert (=> b!240676 (= b_free!6473 (not b_next!6473))))

(declare-fun tp!22623 () Bool)

(declare-fun b_and!13439 () Bool)

(assert (=> b!240676 (= tp!22623 b_and!13439)))

(declare-fun b!240666 () Bool)

(declare-fun e!156191 () Bool)

(declare-fun e!156198 () Bool)

(assert (=> b!240666 (= e!156191 e!156198)))

(declare-fun res!118022 () Bool)

(assert (=> b!240666 (=> (not res!118022) (not e!156198))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8093 0))(
  ( (V!8094 (val!3212 Int)) )
))
(declare-datatypes ((ValueCell!2824 0))(
  ( (ValueCellFull!2824 (v!5250 V!8093)) (EmptyCell!2824) )
))
(declare-datatypes ((array!11949 0))(
  ( (array!11950 (arr!5676 (Array (_ BitVec 32) ValueCell!2824)) (size!6017 (_ BitVec 32))) )
))
(declare-datatypes ((array!11951 0))(
  ( (array!11952 (arr!5677 (Array (_ BitVec 32) (_ BitVec 64))) (size!6018 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3548 0))(
  ( (LongMapFixedSize!3549 (defaultEntry!4459 Int) (mask!10517 (_ BitVec 32)) (extraKeys!4196 (_ BitVec 32)) (zeroValue!4300 V!8093) (minValue!4300 V!8093) (_size!1823 (_ BitVec 32)) (_keys!6561 array!11951) (_values!4442 array!11949) (_vacant!1823 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3548)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240666 (= res!118022 (inRange!0 index!297 (mask!10517 thiss!1504)))))

(declare-datatypes ((Unit!7405 0))(
  ( (Unit!7406) )
))
(declare-fun lt!121026 () Unit!7405)

(declare-fun e!156189 () Unit!7405)

(assert (=> b!240666 (= lt!121026 e!156189)))

(declare-fun c!40080 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4732 0))(
  ( (tuple2!4733 (_1!2377 (_ BitVec 64)) (_2!2377 V!8093)) )
))
(declare-datatypes ((List!3616 0))(
  ( (Nil!3613) (Cons!3612 (h!4268 tuple2!4732) (t!8611 List!3616)) )
))
(declare-datatypes ((ListLongMap!3645 0))(
  ( (ListLongMap!3646 (toList!1838 List!3616)) )
))
(declare-fun contains!1726 (ListLongMap!3645 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1366 (array!11951 array!11949 (_ BitVec 32) (_ BitVec 32) V!8093 V!8093 (_ BitVec 32) Int) ListLongMap!3645)

(assert (=> b!240666 (= c!40080 (contains!1726 (getCurrentListMap!1366 (_keys!6561 thiss!1504) (_values!4442 thiss!1504) (mask!10517 thiss!1504) (extraKeys!4196 thiss!1504) (zeroValue!4300 thiss!1504) (minValue!4300 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4459 thiss!1504)) key!932))))

(declare-fun b!240667 () Bool)

(declare-fun res!118020 () Bool)

(declare-datatypes ((SeekEntryResult!1049 0))(
  ( (MissingZero!1049 (index!6366 (_ BitVec 32))) (Found!1049 (index!6367 (_ BitVec 32))) (Intermediate!1049 (undefined!1861 Bool) (index!6368 (_ BitVec 32)) (x!24169 (_ BitVec 32))) (Undefined!1049) (MissingVacant!1049 (index!6369 (_ BitVec 32))) )
))
(declare-fun lt!121025 () SeekEntryResult!1049)

(assert (=> b!240667 (= res!118020 (= (select (arr!5677 (_keys!6561 thiss!1504)) (index!6369 lt!121025)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156193 () Bool)

(assert (=> b!240667 (=> (not res!118020) (not e!156193))))

(declare-fun b!240668 () Bool)

(declare-fun e!156194 () Bool)

(assert (=> b!240668 (= e!156194 (is-Undefined!1049 lt!121025))))

(declare-fun bm!22376 () Bool)

(declare-fun call!22380 () Bool)

(declare-fun arrayContainsKey!0 (array!11951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22376 (= call!22380 (arrayContainsKey!0 (_keys!6561 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240669 () Bool)

(declare-fun res!118019 () Bool)

(declare-fun e!156199 () Bool)

(assert (=> b!240669 (=> (not res!118019) (not e!156199))))

(assert (=> b!240669 (= res!118019 (= (select (arr!5677 (_keys!6561 thiss!1504)) (index!6366 lt!121025)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240670 () Bool)

(declare-fun res!118025 () Bool)

(declare-fun e!156200 () Bool)

(assert (=> b!240670 (=> (not res!118025) (not e!156200))))

(assert (=> b!240670 (= res!118025 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240672 () Bool)

(assert (=> b!240672 (= e!156194 e!156193)))

(declare-fun res!118018 () Bool)

(declare-fun call!22379 () Bool)

(assert (=> b!240672 (= res!118018 call!22379)))

(assert (=> b!240672 (=> (not res!118018) (not e!156193))))

(declare-fun b!240673 () Bool)

(assert (=> b!240673 (= e!156198 false)))

(declare-fun lt!121024 () Bool)

(declare-datatypes ((List!3617 0))(
  ( (Nil!3614) (Cons!3613 (h!4269 (_ BitVec 64)) (t!8612 List!3617)) )
))
(declare-fun arrayNoDuplicates!0 (array!11951 (_ BitVec 32) List!3617) Bool)

(assert (=> b!240673 (= lt!121024 (arrayNoDuplicates!0 (_keys!6561 thiss!1504) #b00000000000000000000000000000000 Nil!3614))))

(declare-fun b!240674 () Bool)

(declare-fun c!40082 () Bool)

(assert (=> b!240674 (= c!40082 (is-MissingVacant!1049 lt!121025))))

(declare-fun e!156192 () Bool)

(assert (=> b!240674 (= e!156192 e!156194)))

(declare-fun b!240675 () Bool)

(declare-fun res!118014 () Bool)

(assert (=> b!240675 (=> (not res!118014) (not e!156198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11951 (_ BitVec 32)) Bool)

(assert (=> b!240675 (= res!118014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6561 thiss!1504) (mask!10517 thiss!1504)))))

(declare-fun e!156196 () Bool)

(declare-fun tp_is_empty!6335 () Bool)

(declare-fun e!156197 () Bool)

(declare-fun array_inv!3755 (array!11951) Bool)

(declare-fun array_inv!3756 (array!11949) Bool)

(assert (=> b!240676 (= e!156196 (and tp!22623 tp_is_empty!6335 (array_inv!3755 (_keys!6561 thiss!1504)) (array_inv!3756 (_values!4442 thiss!1504)) e!156197))))

(declare-fun c!40081 () Bool)

(declare-fun bm!22377 () Bool)

(assert (=> bm!22377 (= call!22379 (inRange!0 (ite c!40081 (index!6366 lt!121025) (index!6369 lt!121025)) (mask!10517 thiss!1504)))))

(declare-fun b!240677 () Bool)

(declare-fun e!156201 () Bool)

(assert (=> b!240677 (= e!156201 tp_is_empty!6335)))

(declare-fun b!240678 () Bool)

(assert (=> b!240678 (= e!156199 (not call!22380))))

(declare-fun mapNonEmpty!10734 () Bool)

(declare-fun mapRes!10734 () Bool)

(declare-fun tp!22622 () Bool)

(declare-fun e!156190 () Bool)

(assert (=> mapNonEmpty!10734 (= mapRes!10734 (and tp!22622 e!156190))))

(declare-fun mapValue!10734 () ValueCell!2824)

(declare-fun mapKey!10734 () (_ BitVec 32))

(declare-fun mapRest!10734 () (Array (_ BitVec 32) ValueCell!2824))

(assert (=> mapNonEmpty!10734 (= (arr!5676 (_values!4442 thiss!1504)) (store mapRest!10734 mapKey!10734 mapValue!10734))))

(declare-fun b!240679 () Bool)

(assert (=> b!240679 (= e!156190 tp_is_empty!6335)))

(declare-fun b!240680 () Bool)

(assert (=> b!240680 (= e!156197 (and e!156201 mapRes!10734))))

(declare-fun condMapEmpty!10734 () Bool)

(declare-fun mapDefault!10734 () ValueCell!2824)

