; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16128 () Bool)

(assert start!16128)

(declare-fun b!160526 () Bool)

(declare-fun b_free!3589 () Bool)

(declare-fun b_next!3589 () Bool)

(assert (=> b!160526 (= b_free!3589 (not b_next!3589))))

(declare-fun tp!13336 () Bool)

(declare-fun b_and!10003 () Bool)

(assert (=> b!160526 (= tp!13336 b_and!10003)))

(declare-fun b!160518 () Bool)

(declare-fun res!76017 () Bool)

(declare-fun e!104951 () Bool)

(assert (=> b!160518 (=> (not res!76017) (not e!104951))))

(declare-datatypes ((V!4169 0))(
  ( (V!4170 (val!1740 Int)) )
))
(declare-datatypes ((ValueCell!1352 0))(
  ( (ValueCellFull!1352 (v!3605 V!4169)) (EmptyCell!1352) )
))
(declare-datatypes ((array!5861 0))(
  ( (array!5862 (arr!2775 (Array (_ BitVec 32) (_ BitVec 64))) (size!3059 (_ BitVec 32))) )
))
(declare-datatypes ((array!5863 0))(
  ( (array!5864 (arr!2776 (Array (_ BitVec 32) ValueCell!1352)) (size!3060 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1612 0))(
  ( (LongMapFixedSize!1613 (defaultEntry!3248 Int) (mask!7820 (_ BitVec 32)) (extraKeys!2989 (_ BitVec 32)) (zeroValue!3091 V!4169) (minValue!3091 V!4169) (_size!855 (_ BitVec 32)) (_keys!5049 array!5861) (_values!3231 array!5863) (_vacant!855 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1612)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2924 0))(
  ( (tuple2!2925 (_1!1473 (_ BitVec 64)) (_2!1473 V!4169)) )
))
(declare-datatypes ((List!1946 0))(
  ( (Nil!1943) (Cons!1942 (h!2555 tuple2!2924) (t!6748 List!1946)) )
))
(declare-datatypes ((ListLongMap!1911 0))(
  ( (ListLongMap!1912 (toList!971 List!1946)) )
))
(declare-fun contains!1007 (ListLongMap!1911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!635 (array!5861 array!5863 (_ BitVec 32) (_ BitVec 32) V!4169 V!4169 (_ BitVec 32) Int) ListLongMap!1911)

(assert (=> b!160518 (= res!76017 (not (contains!1007 (getCurrentListMap!635 (_keys!5049 thiss!1248) (_values!3231 thiss!1248) (mask!7820 thiss!1248) (extraKeys!2989 thiss!1248) (zeroValue!3091 thiss!1248) (minValue!3091 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3248 thiss!1248)) key!828)))))

(declare-fun b!160519 () Bool)

(declare-fun e!104950 () Bool)

(declare-fun tp_is_empty!3391 () Bool)

(assert (=> b!160519 (= e!104950 tp_is_empty!3391)))

(declare-fun b!160520 () Bool)

(assert (=> b!160520 (= e!104951 false)))

(declare-fun lt!82096 () Bool)

(declare-datatypes ((List!1947 0))(
  ( (Nil!1944) (Cons!1943 (h!2556 (_ BitVec 64)) (t!6749 List!1947)) )
))
(declare-fun arrayNoDuplicates!0 (array!5861 (_ BitVec 32) List!1947) Bool)

(assert (=> b!160520 (= lt!82096 (arrayNoDuplicates!0 (_keys!5049 thiss!1248) #b00000000000000000000000000000000 Nil!1944))))

(declare-fun b!160521 () Bool)

(declare-fun res!76019 () Bool)

(assert (=> b!160521 (=> (not res!76019) (not e!104951))))

(assert (=> b!160521 (= res!76019 (and (= (size!3060 (_values!3231 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7820 thiss!1248))) (= (size!3059 (_keys!5049 thiss!1248)) (size!3060 (_values!3231 thiss!1248))) (bvsge (mask!7820 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2989 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2989 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160522 () Bool)

(declare-fun res!76021 () Bool)

(assert (=> b!160522 (=> (not res!76021) (not e!104951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160522 (= res!76021 (validMask!0 (mask!7820 thiss!1248)))))

(declare-fun mapNonEmpty!5774 () Bool)

(declare-fun mapRes!5774 () Bool)

(declare-fun tp!13337 () Bool)

(declare-fun e!104952 () Bool)

(assert (=> mapNonEmpty!5774 (= mapRes!5774 (and tp!13337 e!104952))))

(declare-fun mapRest!5774 () (Array (_ BitVec 32) ValueCell!1352))

(declare-fun mapValue!5774 () ValueCell!1352)

(declare-fun mapKey!5774 () (_ BitVec 32))

(assert (=> mapNonEmpty!5774 (= (arr!2776 (_values!3231 thiss!1248)) (store mapRest!5774 mapKey!5774 mapValue!5774))))

(declare-fun b!160523 () Bool)

(declare-fun res!76022 () Bool)

(assert (=> b!160523 (=> (not res!76022) (not e!104951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5861 (_ BitVec 32)) Bool)

(assert (=> b!160523 (= res!76022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5049 thiss!1248) (mask!7820 thiss!1248)))))

(declare-fun b!160524 () Bool)

(assert (=> b!160524 (= e!104952 tp_is_empty!3391)))

(declare-fun res!76020 () Bool)

(assert (=> start!16128 (=> (not res!76020) (not e!104951))))

(declare-fun valid!747 (LongMapFixedSize!1612) Bool)

(assert (=> start!16128 (= res!76020 (valid!747 thiss!1248))))

(assert (=> start!16128 e!104951))

(declare-fun e!104949 () Bool)

(assert (=> start!16128 e!104949))

(assert (=> start!16128 true))

(declare-fun mapIsEmpty!5774 () Bool)

(assert (=> mapIsEmpty!5774 mapRes!5774))

(declare-fun b!160525 () Bool)

(declare-fun res!76016 () Bool)

(assert (=> b!160525 (=> (not res!76016) (not e!104951))))

(declare-datatypes ((SeekEntryResult!334 0))(
  ( (MissingZero!334 (index!3504 (_ BitVec 32))) (Found!334 (index!3505 (_ BitVec 32))) (Intermediate!334 (undefined!1146 Bool) (index!3506 (_ BitVec 32)) (x!17718 (_ BitVec 32))) (Undefined!334) (MissingVacant!334 (index!3507 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5861 (_ BitVec 32)) SeekEntryResult!334)

(assert (=> b!160525 (= res!76016 (is-Undefined!334 (seekEntryOrOpen!0 key!828 (_keys!5049 thiss!1248) (mask!7820 thiss!1248))))))

(declare-fun e!104947 () Bool)

(declare-fun array_inv!1771 (array!5861) Bool)

(declare-fun array_inv!1772 (array!5863) Bool)

(assert (=> b!160526 (= e!104949 (and tp!13336 tp_is_empty!3391 (array_inv!1771 (_keys!5049 thiss!1248)) (array_inv!1772 (_values!3231 thiss!1248)) e!104947))))

(declare-fun b!160527 () Bool)

(assert (=> b!160527 (= e!104947 (and e!104950 mapRes!5774))))

(declare-fun condMapEmpty!5774 () Bool)

(declare-fun mapDefault!5774 () ValueCell!1352)

