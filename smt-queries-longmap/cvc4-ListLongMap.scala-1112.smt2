; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22922 () Bool)

(assert start!22922)

(declare-fun b!239126 () Bool)

(declare-fun b_free!6425 () Bool)

(declare-fun b_next!6425 () Bool)

(assert (=> b!239126 (= b_free!6425 (not b_next!6425))))

(declare-fun tp!22479 () Bool)

(declare-fun b_and!13391 () Bool)

(assert (=> b!239126 (= tp!22479 b_and!13391)))

(declare-fun res!117195 () Bool)

(declare-fun e!155254 () Bool)

(assert (=> start!22922 (=> (not res!117195) (not e!155254))))

(declare-datatypes ((V!8029 0))(
  ( (V!8030 (val!3188 Int)) )
))
(declare-datatypes ((ValueCell!2800 0))(
  ( (ValueCellFull!2800 (v!5226 V!8029)) (EmptyCell!2800) )
))
(declare-datatypes ((array!11853 0))(
  ( (array!11854 (arr!5628 (Array (_ BitVec 32) ValueCell!2800)) (size!5969 (_ BitVec 32))) )
))
(declare-datatypes ((array!11855 0))(
  ( (array!11856 (arr!5629 (Array (_ BitVec 32) (_ BitVec 64))) (size!5970 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3500 0))(
  ( (LongMapFixedSize!3501 (defaultEntry!4435 Int) (mask!10477 (_ BitVec 32)) (extraKeys!4172 (_ BitVec 32)) (zeroValue!4276 V!8029) (minValue!4276 V!8029) (_size!1799 (_ BitVec 32)) (_keys!6537 array!11855) (_values!4418 array!11853) (_vacant!1799 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3500)

(declare-fun valid!1380 (LongMapFixedSize!3500) Bool)

(assert (=> start!22922 (= res!117195 (valid!1380 thiss!1504))))

(assert (=> start!22922 e!155254))

(declare-fun e!155258 () Bool)

(assert (=> start!22922 e!155258))

(assert (=> start!22922 true))

(declare-fun b!239120 () Bool)

(declare-fun res!117194 () Bool)

(declare-fun e!155263 () Bool)

(assert (=> b!239120 (=> (not res!117194) (not e!155263))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!239120 (= res!117194 (arrayContainsKey!0 (_keys!6537 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239121 () Bool)

(declare-fun e!155255 () Bool)

(assert (=> b!239121 (= e!155254 e!155255)))

(declare-fun res!117191 () Bool)

(assert (=> b!239121 (=> (not res!117191) (not e!155255))))

(declare-datatypes ((SeekEntryResult!1028 0))(
  ( (MissingZero!1028 (index!6282 (_ BitVec 32))) (Found!1028 (index!6283 (_ BitVec 32))) (Intermediate!1028 (undefined!1840 Bool) (index!6284 (_ BitVec 32)) (x!24084 (_ BitVec 32))) (Undefined!1028) (MissingVacant!1028 (index!6285 (_ BitVec 32))) )
))
(declare-fun lt!120727 () SeekEntryResult!1028)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239121 (= res!117191 (or (= lt!120727 (MissingZero!1028 index!297)) (= lt!120727 (MissingVacant!1028 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11855 (_ BitVec 32)) SeekEntryResult!1028)

(assert (=> b!239121 (= lt!120727 (seekEntryOrOpen!0 key!932 (_keys!6537 thiss!1504) (mask!10477 thiss!1504)))))

(declare-fun b!239122 () Bool)

(assert (=> b!239122 (= e!155255 e!155263)))

(declare-fun res!117188 () Bool)

(assert (=> b!239122 (=> (not res!117188) (not e!155263))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239122 (= res!117188 (inRange!0 index!297 (mask!10477 thiss!1504)))))

(declare-datatypes ((Unit!7339 0))(
  ( (Unit!7340) )
))
(declare-fun lt!120728 () Unit!7339)

(declare-fun e!155260 () Unit!7339)

(assert (=> b!239122 (= lt!120728 e!155260)))

(declare-fun c!39865 () Bool)

(declare-datatypes ((tuple2!4698 0))(
  ( (tuple2!4699 (_1!2360 (_ BitVec 64)) (_2!2360 V!8029)) )
))
(declare-datatypes ((List!3591 0))(
  ( (Nil!3588) (Cons!3587 (h!4243 tuple2!4698) (t!8586 List!3591)) )
))
(declare-datatypes ((ListLongMap!3611 0))(
  ( (ListLongMap!3612 (toList!1821 List!3591)) )
))
(declare-fun contains!1709 (ListLongMap!3611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1349 (array!11855 array!11853 (_ BitVec 32) (_ BitVec 32) V!8029 V!8029 (_ BitVec 32) Int) ListLongMap!3611)

(assert (=> b!239122 (= c!39865 (contains!1709 (getCurrentListMap!1349 (_keys!6537 thiss!1504) (_values!4418 thiss!1504) (mask!10477 thiss!1504) (extraKeys!4172 thiss!1504) (zeroValue!4276 thiss!1504) (minValue!4276 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4435 thiss!1504)) key!932))))

(declare-fun bm!22232 () Bool)

(declare-fun call!22235 () Bool)

(assert (=> bm!22232 (= call!22235 (arrayContainsKey!0 (_keys!6537 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239123 () Bool)

(declare-fun res!117196 () Bool)

(assert (=> b!239123 (=> (not res!117196) (not e!155263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239123 (= res!117196 (validMask!0 (mask!10477 thiss!1504)))))

(declare-fun b!239124 () Bool)

(declare-fun e!155259 () Bool)

(declare-fun tp_is_empty!6287 () Bool)

(assert (=> b!239124 (= e!155259 tp_is_empty!6287)))

(declare-fun b!239125 () Bool)

(assert (=> b!239125 (= e!155263 (and (= (size!5969 (_values!4418 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10477 thiss!1504))) (not (= (size!5970 (_keys!6537 thiss!1504)) (size!5969 (_values!4418 thiss!1504))))))))

(declare-fun e!155261 () Bool)

(declare-fun array_inv!3723 (array!11855) Bool)

(declare-fun array_inv!3724 (array!11853) Bool)

(assert (=> b!239126 (= e!155258 (and tp!22479 tp_is_empty!6287 (array_inv!3723 (_keys!6537 thiss!1504)) (array_inv!3724 (_values!4418 thiss!1504)) e!155261))))

(declare-fun b!239127 () Bool)

(declare-fun res!117189 () Bool)

(assert (=> b!239127 (=> (not res!117189) (not e!155254))))

(assert (=> b!239127 (= res!117189 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239128 () Bool)

(declare-fun lt!120729 () Unit!7339)

(assert (=> b!239128 (= e!155260 lt!120729)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!339 (array!11855 array!11853 (_ BitVec 32) (_ BitVec 32) V!8029 V!8029 (_ BitVec 64) Int) Unit!7339)

(assert (=> b!239128 (= lt!120729 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!339 (_keys!6537 thiss!1504) (_values!4418 thiss!1504) (mask!10477 thiss!1504) (extraKeys!4172 thiss!1504) (zeroValue!4276 thiss!1504) (minValue!4276 thiss!1504) key!932 (defaultEntry!4435 thiss!1504)))))

(declare-fun c!39866 () Bool)

(assert (=> b!239128 (= c!39866 (is-MissingZero!1028 lt!120727))))

(declare-fun e!155264 () Bool)

(assert (=> b!239128 e!155264))

(declare-fun mapIsEmpty!10662 () Bool)

(declare-fun mapRes!10662 () Bool)

(assert (=> mapIsEmpty!10662 mapRes!10662))

(declare-fun b!239129 () Bool)

(declare-fun e!155253 () Bool)

(assert (=> b!239129 (= e!155253 (not call!22235))))

(declare-fun b!239130 () Bool)

(declare-fun res!117197 () Bool)

(declare-fun e!155265 () Bool)

(assert (=> b!239130 (=> (not res!117197) (not e!155265))))

(declare-fun call!22236 () Bool)

(assert (=> b!239130 (= res!117197 call!22236)))

(assert (=> b!239130 (= e!155264 e!155265)))

(declare-fun b!239131 () Bool)

(assert (=> b!239131 (= e!155265 (not call!22235))))

(declare-fun b!239132 () Bool)

(declare-fun Unit!7341 () Unit!7339)

(assert (=> b!239132 (= e!155260 Unit!7341)))

(declare-fun lt!120726 () Unit!7339)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!323 (array!11855 array!11853 (_ BitVec 32) (_ BitVec 32) V!8029 V!8029 (_ BitVec 64) Int) Unit!7339)

(assert (=> b!239132 (= lt!120726 (lemmaInListMapThenSeekEntryOrOpenFindsIt!323 (_keys!6537 thiss!1504) (_values!4418 thiss!1504) (mask!10477 thiss!1504) (extraKeys!4172 thiss!1504) (zeroValue!4276 thiss!1504) (minValue!4276 thiss!1504) key!932 (defaultEntry!4435 thiss!1504)))))

(assert (=> b!239132 false))

(declare-fun b!239133 () Bool)

(declare-fun e!155257 () Bool)

(assert (=> b!239133 (= e!155257 (is-Undefined!1028 lt!120727))))

(declare-fun b!239134 () Bool)

(declare-fun e!155256 () Bool)

(assert (=> b!239134 (= e!155256 tp_is_empty!6287)))

(declare-fun mapNonEmpty!10662 () Bool)

(declare-fun tp!22478 () Bool)

(assert (=> mapNonEmpty!10662 (= mapRes!10662 (and tp!22478 e!155259))))

(declare-fun mapValue!10662 () ValueCell!2800)

(declare-fun mapKey!10662 () (_ BitVec 32))

(declare-fun mapRest!10662 () (Array (_ BitVec 32) ValueCell!2800))

(assert (=> mapNonEmpty!10662 (= (arr!5628 (_values!4418 thiss!1504)) (store mapRest!10662 mapKey!10662 mapValue!10662))))

(declare-fun b!239135 () Bool)

(declare-fun res!117193 () Bool)

(assert (=> b!239135 (= res!117193 (= (select (arr!5629 (_keys!6537 thiss!1504)) (index!6285 lt!120727)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239135 (=> (not res!117193) (not e!155253))))

(declare-fun b!239136 () Bool)

(assert (=> b!239136 (= e!155257 e!155253)))

(declare-fun res!117192 () Bool)

(assert (=> b!239136 (= res!117192 call!22236)))

(assert (=> b!239136 (=> (not res!117192) (not e!155253))))

(declare-fun b!239137 () Bool)

(assert (=> b!239137 (= e!155261 (and e!155256 mapRes!10662))))

(declare-fun condMapEmpty!10662 () Bool)

(declare-fun mapDefault!10662 () ValueCell!2800)

