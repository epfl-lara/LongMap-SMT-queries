; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18482 () Bool)

(assert start!18482)

(declare-fun b!183316 () Bool)

(declare-fun b_free!4525 () Bool)

(declare-fun b_next!4525 () Bool)

(assert (=> b!183316 (= b_free!4525 (not b_next!4525))))

(declare-fun tp!16346 () Bool)

(declare-fun b_and!11095 () Bool)

(assert (=> b!183316 (= tp!16346 b_and!11095)))

(declare-fun b!183310 () Bool)

(declare-fun e!120687 () Bool)

(declare-fun tp_is_empty!4297 () Bool)

(assert (=> b!183310 (= e!120687 tp_is_empty!4297)))

(declare-fun b!183311 () Bool)

(declare-fun res!86770 () Bool)

(declare-fun e!120692 () Bool)

(assert (=> b!183311 (=> (not res!86770) (not e!120692))))

(declare-datatypes ((V!5377 0))(
  ( (V!5378 (val!2193 Int)) )
))
(declare-datatypes ((ValueCell!1805 0))(
  ( (ValueCellFull!1805 (v!4096 V!5377)) (EmptyCell!1805) )
))
(declare-datatypes ((array!7787 0))(
  ( (array!7788 (arr!3681 (Array (_ BitVec 32) (_ BitVec 64))) (size!3993 (_ BitVec 32))) )
))
(declare-datatypes ((array!7789 0))(
  ( (array!7790 (arr!3682 (Array (_ BitVec 32) ValueCell!1805)) (size!3994 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2518 0))(
  ( (LongMapFixedSize!2519 (defaultEntry!3749 Int) (mask!8811 (_ BitVec 32)) (extraKeys!3486 (_ BitVec 32)) (zeroValue!3590 V!5377) (minValue!3590 V!5377) (_size!1308 (_ BitVec 32)) (_keys!5667 array!7787) (_values!3732 array!7789) (_vacant!1308 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2518)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183311 (= res!86770 (validMask!0 (mask!8811 thiss!1248)))))

(declare-fun b!183313 () Bool)

(declare-fun e!120690 () Bool)

(assert (=> b!183313 (= e!120690 tp_is_empty!4297)))

(declare-fun b!183314 () Bool)

(declare-fun res!86769 () Bool)

(assert (=> b!183314 (=> (not res!86769) (not e!120692))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3418 0))(
  ( (tuple2!3419 (_1!1720 (_ BitVec 64)) (_2!1720 V!5377)) )
))
(declare-datatypes ((List!2336 0))(
  ( (Nil!2333) (Cons!2332 (h!2961 tuple2!3418) (t!7204 List!2336)) )
))
(declare-datatypes ((ListLongMap!2335 0))(
  ( (ListLongMap!2336 (toList!1183 List!2336)) )
))
(declare-fun contains!1269 (ListLongMap!2335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!831 (array!7787 array!7789 (_ BitVec 32) (_ BitVec 32) V!5377 V!5377 (_ BitVec 32) Int) ListLongMap!2335)

(assert (=> b!183314 (= res!86769 (not (contains!1269 (getCurrentListMap!831 (_keys!5667 thiss!1248) (_values!3732 thiss!1248) (mask!8811 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)) key!828)))))

(declare-fun b!183315 () Bool)

(declare-fun e!120688 () Bool)

(assert (=> b!183315 (= e!120688 e!120692)))

(declare-fun res!86768 () Bool)

(assert (=> b!183315 (=> (not res!86768) (not e!120692))))

(declare-datatypes ((SeekEntryResult!619 0))(
  ( (MissingZero!619 (index!4646 (_ BitVec 32))) (Found!619 (index!4647 (_ BitVec 32))) (Intermediate!619 (undefined!1431 Bool) (index!4648 (_ BitVec 32)) (x!19973 (_ BitVec 32))) (Undefined!619) (MissingVacant!619 (index!4649 (_ BitVec 32))) )
))
(declare-fun lt!90619 () SeekEntryResult!619)

(assert (=> b!183315 (= res!86768 (and (not (is-Undefined!619 lt!90619)) (not (is-MissingVacant!619 lt!90619)) (not (is-MissingZero!619 lt!90619)) (is-Found!619 lt!90619)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7787 (_ BitVec 32)) SeekEntryResult!619)

(assert (=> b!183315 (= lt!90619 (seekEntryOrOpen!0 key!828 (_keys!5667 thiss!1248) (mask!8811 thiss!1248)))))

(declare-fun e!120691 () Bool)

(declare-fun e!120689 () Bool)

(declare-fun array_inv!2379 (array!7787) Bool)

(declare-fun array_inv!2380 (array!7789) Bool)

(assert (=> b!183316 (= e!120691 (and tp!16346 tp_is_empty!4297 (array_inv!2379 (_keys!5667 thiss!1248)) (array_inv!2380 (_values!3732 thiss!1248)) e!120689))))

(declare-fun mapNonEmpty!7379 () Bool)

(declare-fun mapRes!7379 () Bool)

(declare-fun tp!16345 () Bool)

(assert (=> mapNonEmpty!7379 (= mapRes!7379 (and tp!16345 e!120687))))

(declare-fun mapRest!7379 () (Array (_ BitVec 32) ValueCell!1805))

(declare-fun mapValue!7379 () ValueCell!1805)

(declare-fun mapKey!7379 () (_ BitVec 32))

(assert (=> mapNonEmpty!7379 (= (arr!3682 (_values!3732 thiss!1248)) (store mapRest!7379 mapKey!7379 mapValue!7379))))

(declare-fun b!183317 () Bool)

(assert (=> b!183317 (= e!120689 (and e!120690 mapRes!7379))))

(declare-fun condMapEmpty!7379 () Bool)

(declare-fun mapDefault!7379 () ValueCell!1805)

