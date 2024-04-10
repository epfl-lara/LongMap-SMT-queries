; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24338 () Bool)

(assert start!24338)

(declare-fun b!255115 () Bool)

(declare-fun b_free!6701 () Bool)

(declare-fun b_next!6701 () Bool)

(assert (=> b!255115 (= b_free!6701 (not b_next!6701))))

(declare-fun tp!23394 () Bool)

(declare-fun b_and!13747 () Bool)

(assert (=> b!255115 (= tp!23394 b_and!13747)))

(declare-fun b!255100 () Bool)

(declare-datatypes ((Unit!7919 0))(
  ( (Unit!7920) )
))
(declare-fun e!165369 () Unit!7919)

(declare-fun lt!127903 () Unit!7919)

(assert (=> b!255100 (= e!165369 lt!127903)))

(declare-datatypes ((V!8397 0))(
  ( (V!8398 (val!3326 Int)) )
))
(declare-datatypes ((ValueCell!2938 0))(
  ( (ValueCellFull!2938 (v!5403 V!8397)) (EmptyCell!2938) )
))
(declare-datatypes ((array!12459 0))(
  ( (array!12460 (arr!5904 (Array (_ BitVec 32) ValueCell!2938)) (size!6251 (_ BitVec 32))) )
))
(declare-datatypes ((array!12461 0))(
  ( (array!12462 (arr!5905 (Array (_ BitVec 32) (_ BitVec 64))) (size!6252 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3776 0))(
  ( (LongMapFixedSize!3777 (defaultEntry!4706 Int) (mask!10960 (_ BitVec 32)) (extraKeys!4443 (_ BitVec 32)) (zeroValue!4547 V!8397) (minValue!4547 V!8397) (_size!1937 (_ BitVec 32)) (_keys!6862 array!12461) (_values!4689 array!12459) (_vacant!1937 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3776)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!426 (array!12461 array!12459 (_ BitVec 32) (_ BitVec 32) V!8397 V!8397 (_ BitVec 64) Int) Unit!7919)

(assert (=> b!255100 (= lt!127903 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!426 (_keys!6862 thiss!1504) (_values!4689 thiss!1504) (mask!10960 thiss!1504) (extraKeys!4443 thiss!1504) (zeroValue!4547 thiss!1504) (minValue!4547 thiss!1504) key!932 (defaultEntry!4706 thiss!1504)))))

(declare-fun c!43052 () Bool)

(declare-datatypes ((SeekEntryResult!1156 0))(
  ( (MissingZero!1156 (index!6794 (_ BitVec 32))) (Found!1156 (index!6795 (_ BitVec 32))) (Intermediate!1156 (undefined!1968 Bool) (index!6796 (_ BitVec 32)) (x!24898 (_ BitVec 32))) (Undefined!1156) (MissingVacant!1156 (index!6797 (_ BitVec 32))) )
))
(declare-fun lt!127905 () SeekEntryResult!1156)

(assert (=> b!255100 (= c!43052 (is-MissingZero!1156 lt!127905))))

(declare-fun e!165363 () Bool)

(assert (=> b!255100 e!165363))

(declare-fun b!255101 () Bool)

(declare-fun e!165364 () Bool)

(assert (=> b!255101 (= e!165364 (is-Undefined!1156 lt!127905))))

(declare-fun b!255102 () Bool)

(declare-fun res!124854 () Bool)

(assert (=> b!255102 (= res!124854 (= (select (arr!5905 (_keys!6862 thiss!1504)) (index!6797 lt!127905)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!165360 () Bool)

(assert (=> b!255102 (=> (not res!124854) (not e!165360))))

(declare-fun b!255103 () Bool)

(declare-fun e!165367 () Bool)

(declare-fun e!165368 () Bool)

(assert (=> b!255103 (= e!165367 e!165368)))

(declare-fun res!124851 () Bool)

(assert (=> b!255103 (=> (not res!124851) (not e!165368))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255103 (= res!124851 (inRange!0 index!297 (mask!10960 thiss!1504)))))

(declare-fun lt!127908 () Unit!7919)

(assert (=> b!255103 (= lt!127908 e!165369)))

(declare-fun c!43054 () Bool)

(declare-datatypes ((tuple2!4898 0))(
  ( (tuple2!4899 (_1!2460 (_ BitVec 64)) (_2!2460 V!8397)) )
))
(declare-datatypes ((List!3779 0))(
  ( (Nil!3776) (Cons!3775 (h!4437 tuple2!4898) (t!8828 List!3779)) )
))
(declare-datatypes ((ListLongMap!3811 0))(
  ( (ListLongMap!3812 (toList!1921 List!3779)) )
))
(declare-fun lt!127901 () ListLongMap!3811)

(declare-fun contains!1853 (ListLongMap!3811 (_ BitVec 64)) Bool)

(assert (=> b!255103 (= c!43054 (contains!1853 lt!127901 key!932))))

(declare-fun getCurrentListMap!1449 (array!12461 array!12459 (_ BitVec 32) (_ BitVec 32) V!8397 V!8397 (_ BitVec 32) Int) ListLongMap!3811)

(assert (=> b!255103 (= lt!127901 (getCurrentListMap!1449 (_keys!6862 thiss!1504) (_values!4689 thiss!1504) (mask!10960 thiss!1504) (extraKeys!4443 thiss!1504) (zeroValue!4547 thiss!1504) (minValue!4547 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4706 thiss!1504)))))

(declare-fun mapIsEmpty!11163 () Bool)

(declare-fun mapRes!11163 () Bool)

(assert (=> mapIsEmpty!11163 mapRes!11163))

(declare-fun res!124853 () Bool)

(declare-fun e!165366 () Bool)

(assert (=> start!24338 (=> (not res!124853) (not e!165366))))

(declare-fun valid!1476 (LongMapFixedSize!3776) Bool)

(assert (=> start!24338 (= res!124853 (valid!1476 thiss!1504))))

(assert (=> start!24338 e!165366))

(declare-fun e!165370 () Bool)

(assert (=> start!24338 e!165370))

(assert (=> start!24338 true))

(declare-fun tp_is_empty!6563 () Bool)

(assert (=> start!24338 tp_is_empty!6563))

(declare-fun b!255104 () Bool)

(declare-fun e!165371 () Bool)

(declare-fun call!24093 () Bool)

(assert (=> b!255104 (= e!165371 (not call!24093))))

(declare-fun b!255105 () Bool)

(declare-fun e!165373 () Bool)

(assert (=> b!255105 (= e!165373 tp_is_empty!6563)))

(declare-fun b!255106 () Bool)

(declare-fun e!165361 () Bool)

(assert (=> b!255106 (= e!165361 tp_is_empty!6563)))

(declare-fun b!255107 () Bool)

(assert (=> b!255107 (= e!165366 e!165367)))

(declare-fun res!124857 () Bool)

(assert (=> b!255107 (=> (not res!124857) (not e!165367))))

(assert (=> b!255107 (= res!124857 (or (= lt!127905 (MissingZero!1156 index!297)) (= lt!127905 (MissingVacant!1156 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12461 (_ BitVec 32)) SeekEntryResult!1156)

(assert (=> b!255107 (= lt!127905 (seekEntryOrOpen!0 key!932 (_keys!6862 thiss!1504) (mask!10960 thiss!1504)))))

(declare-fun mapNonEmpty!11163 () Bool)

(declare-fun tp!23393 () Bool)

(assert (=> mapNonEmpty!11163 (= mapRes!11163 (and tp!23393 e!165373))))

(declare-fun mapKey!11163 () (_ BitVec 32))

(declare-fun mapValue!11163 () ValueCell!2938)

(declare-fun mapRest!11163 () (Array (_ BitVec 32) ValueCell!2938))

(assert (=> mapNonEmpty!11163 (= (arr!5904 (_values!4689 thiss!1504)) (store mapRest!11163 mapKey!11163 mapValue!11163))))

(declare-fun b!255108 () Bool)

(declare-fun e!165372 () Unit!7919)

(declare-fun Unit!7921 () Unit!7919)

(assert (=> b!255108 (= e!165372 Unit!7921)))

(declare-fun lt!127899 () Unit!7919)

(declare-fun lemmaArrayContainsKeyThenInListMap!229 (array!12461 array!12459 (_ BitVec 32) (_ BitVec 32) V!8397 V!8397 (_ BitVec 64) (_ BitVec 32) Int) Unit!7919)

(assert (=> b!255108 (= lt!127899 (lemmaArrayContainsKeyThenInListMap!229 (_keys!6862 thiss!1504) (_values!4689 thiss!1504) (mask!10960 thiss!1504) (extraKeys!4443 thiss!1504) (zeroValue!4547 thiss!1504) (minValue!4547 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4706 thiss!1504)))))

(assert (=> b!255108 false))

(declare-fun bm!24089 () Bool)

(declare-fun call!24092 () Bool)

(assert (=> bm!24089 (= call!24092 (inRange!0 (ite c!43052 (index!6794 lt!127905) (index!6797 lt!127905)) (mask!10960 thiss!1504)))))

(declare-fun b!255109 () Bool)

(declare-fun res!124852 () Bool)

(assert (=> b!255109 (=> (not res!124852) (not e!165371))))

(assert (=> b!255109 (= res!124852 call!24092)))

(assert (=> b!255109 (= e!165363 e!165371)))

(declare-fun b!255110 () Bool)

(declare-fun c!43053 () Bool)

(assert (=> b!255110 (= c!43053 (is-MissingVacant!1156 lt!127905))))

(assert (=> b!255110 (= e!165363 e!165364)))

(declare-fun b!255111 () Bool)

(assert (=> b!255111 (= e!165364 e!165360)))

(declare-fun res!124850 () Bool)

(assert (=> b!255111 (= res!124850 call!24092)))

(assert (=> b!255111 (=> (not res!124850) (not e!165360))))

(declare-fun b!255112 () Bool)

(declare-fun e!165365 () Bool)

(assert (=> b!255112 (= e!165365 (and e!165361 mapRes!11163))))

(declare-fun condMapEmpty!11163 () Bool)

(declare-fun mapDefault!11163 () ValueCell!2938)

