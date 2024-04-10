; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22640 () Bool)

(assert start!22640)

(declare-fun b!236490 () Bool)

(declare-fun b_free!6361 () Bool)

(declare-fun b_next!6361 () Bool)

(assert (=> b!236490 (= b_free!6361 (not b_next!6361))))

(declare-fun tp!22263 () Bool)

(declare-fun b_and!13301 () Bool)

(assert (=> b!236490 (= tp!22263 b_and!13301)))

(declare-fun b!236491 () Bool)

(declare-fun e!153591 () Bool)

(declare-fun tp_is_empty!6223 () Bool)

(assert (=> b!236491 (= e!153591 tp_is_empty!6223)))

(declare-fun b!236492 () Bool)

(declare-fun e!153588 () Bool)

(declare-fun e!153586 () Bool)

(assert (=> b!236492 (= e!153588 e!153586)))

(declare-fun res!115958 () Bool)

(assert (=> b!236492 (=> (not res!115958) (not e!153586))))

(declare-datatypes ((SeekEntryResult!1001 0))(
  ( (MissingZero!1001 (index!6174 (_ BitVec 32))) (Found!1001 (index!6175 (_ BitVec 32))) (Intermediate!1001 (undefined!1813 Bool) (index!6176 (_ BitVec 32)) (x!23883 (_ BitVec 32))) (Undefined!1001) (MissingVacant!1001 (index!6177 (_ BitVec 32))) )
))
(declare-fun lt!119577 () SeekEntryResult!1001)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236492 (= res!115958 (or (= lt!119577 (MissingZero!1001 index!297)) (= lt!119577 (MissingVacant!1001 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7945 0))(
  ( (V!7946 (val!3156 Int)) )
))
(declare-datatypes ((ValueCell!2768 0))(
  ( (ValueCellFull!2768 (v!5187 V!7945)) (EmptyCell!2768) )
))
(declare-datatypes ((array!11711 0))(
  ( (array!11712 (arr!5564 (Array (_ BitVec 32) ValueCell!2768)) (size!5902 (_ BitVec 32))) )
))
(declare-datatypes ((array!11713 0))(
  ( (array!11714 (arr!5565 (Array (_ BitVec 32) (_ BitVec 64))) (size!5903 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3436 0))(
  ( (LongMapFixedSize!3437 (defaultEntry!4393 Int) (mask!10386 (_ BitVec 32)) (extraKeys!4130 (_ BitVec 32)) (zeroValue!4234 V!7945) (minValue!4234 V!7945) (_size!1767 (_ BitVec 32)) (_keys!6476 array!11713) (_values!4376 array!11711) (_vacant!1767 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3436)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11713 (_ BitVec 32)) SeekEntryResult!1001)

(assert (=> b!236492 (= lt!119577 (seekEntryOrOpen!0 key!932 (_keys!6476 thiss!1504) (mask!10386 thiss!1504)))))

(declare-fun mapNonEmpty!10542 () Bool)

(declare-fun mapRes!10542 () Bool)

(declare-fun tp!22262 () Bool)

(assert (=> mapNonEmpty!10542 (= mapRes!10542 (and tp!22262 e!153591))))

(declare-fun mapValue!10542 () ValueCell!2768)

(declare-fun mapKey!10542 () (_ BitVec 32))

(declare-fun mapRest!10542 () (Array (_ BitVec 32) ValueCell!2768))

(assert (=> mapNonEmpty!10542 (= (arr!5564 (_values!4376 thiss!1504)) (store mapRest!10542 mapKey!10542 mapValue!10542))))

(declare-fun b!236493 () Bool)

(declare-fun res!115961 () Bool)

(assert (=> b!236493 (=> (not res!115961) (not e!153586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236493 (= res!115961 (validMask!0 (mask!10386 thiss!1504)))))

(declare-fun b!236494 () Bool)

(declare-fun res!115959 () Bool)

(assert (=> b!236494 (=> (not res!115959) (not e!153586))))

(declare-datatypes ((tuple2!4652 0))(
  ( (tuple2!4653 (_1!2337 (_ BitVec 64)) (_2!2337 V!7945)) )
))
(declare-datatypes ((List!3556 0))(
  ( (Nil!3553) (Cons!3552 (h!4205 tuple2!4652) (t!8537 List!3556)) )
))
(declare-datatypes ((ListLongMap!3565 0))(
  ( (ListLongMap!3566 (toList!1798 List!3556)) )
))
(declare-fun contains!1678 (ListLongMap!3565 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1326 (array!11713 array!11711 (_ BitVec 32) (_ BitVec 32) V!7945 V!7945 (_ BitVec 32) Int) ListLongMap!3565)

(assert (=> b!236494 (= res!115959 (not (contains!1678 (getCurrentListMap!1326 (_keys!6476 thiss!1504) (_values!4376 thiss!1504) (mask!10386 thiss!1504) (extraKeys!4130 thiss!1504) (zeroValue!4234 thiss!1504) (minValue!4234 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4393 thiss!1504)) key!932)))))

(declare-fun b!236495 () Bool)

(declare-fun e!153587 () Bool)

(declare-fun e!153585 () Bool)

(assert (=> b!236495 (= e!153587 (and e!153585 mapRes!10542))))

(declare-fun condMapEmpty!10542 () Bool)

(declare-fun mapDefault!10542 () ValueCell!2768)

