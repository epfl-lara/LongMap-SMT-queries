; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17666 () Bool)

(assert start!17666)

(declare-fun b!176595 () Bool)

(declare-fun b_free!4357 () Bool)

(declare-fun b_next!4357 () Bool)

(assert (=> b!176595 (= b_free!4357 (not b_next!4357))))

(declare-fun tp!15765 () Bool)

(declare-fun b_and!10853 () Bool)

(assert (=> b!176595 (= tp!15765 b_and!10853)))

(declare-fun b!176588 () Bool)

(declare-fun res!83680 () Bool)

(declare-fun e!116493 () Bool)

(assert (=> b!176588 (=> (not res!83680) (not e!116493))))

(declare-datatypes ((V!5153 0))(
  ( (V!5154 (val!2109 Int)) )
))
(declare-datatypes ((ValueCell!1721 0))(
  ( (ValueCellFull!1721 (v!3987 V!5153)) (EmptyCell!1721) )
))
(declare-datatypes ((array!7405 0))(
  ( (array!7406 (arr!3513 (Array (_ BitVec 32) (_ BitVec 64))) (size!3817 (_ BitVec 32))) )
))
(declare-datatypes ((array!7407 0))(
  ( (array!7408 (arr!3514 (Array (_ BitVec 32) ValueCell!1721)) (size!3818 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2350 0))(
  ( (LongMapFixedSize!2351 (defaultEntry!3636 Int) (mask!8558 (_ BitVec 32)) (extraKeys!3373 (_ BitVec 32)) (zeroValue!3477 V!5153) (minValue!3477 V!5153) (_size!1224 (_ BitVec 32)) (_keys!5499 array!7405) (_values!3619 array!7407) (_vacant!1224 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2350)

(assert (=> b!176588 (= res!83680 (and (= (size!3818 (_values!3619 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8558 thiss!1248))) (= (size!3817 (_keys!5499 thiss!1248)) (size!3818 (_values!3619 thiss!1248))) (bvsge (mask!8558 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3373 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3373 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!176589 () Bool)

(declare-fun res!83679 () Bool)

(assert (=> b!176589 (=> (not res!83679) (not e!116493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7405 (_ BitVec 32)) Bool)

(assert (=> b!176589 (= res!83679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5499 thiss!1248) (mask!8558 thiss!1248)))))

(declare-fun b!176590 () Bool)

(declare-fun res!83682 () Bool)

(assert (=> b!176590 (=> (not res!83682) (not e!116493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176590 (= res!83682 (validMask!0 (mask!8558 thiss!1248)))))

(declare-fun b!176591 () Bool)

(declare-datatypes ((List!2235 0))(
  ( (Nil!2232) (Cons!2231 (h!2852 (_ BitVec 64)) (t!7061 List!2235)) )
))
(declare-fun arrayNoDuplicates!0 (array!7405 (_ BitVec 32) List!2235) Bool)

(assert (=> b!176591 (= e!116493 (not (arrayNoDuplicates!0 (_keys!5499 thiss!1248) #b00000000000000000000000000000000 Nil!2232)))))

(declare-fun b!176592 () Bool)

(declare-fun e!116495 () Bool)

(declare-fun tp_is_empty!4129 () Bool)

(assert (=> b!176592 (= e!116495 tp_is_empty!4129)))

(declare-fun b!176593 () Bool)

(declare-fun res!83684 () Bool)

(assert (=> b!176593 (=> (not res!83684) (not e!116493))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!555 0))(
  ( (MissingZero!555 (index!4388 (_ BitVec 32))) (Found!555 (index!4389 (_ BitVec 32))) (Intermediate!555 (undefined!1367 Bool) (index!4390 (_ BitVec 32)) (x!19383 (_ BitVec 32))) (Undefined!555) (MissingVacant!555 (index!4391 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7405 (_ BitVec 32)) SeekEntryResult!555)

(assert (=> b!176593 (= res!83684 (is-Undefined!555 (seekEntryOrOpen!0 key!828 (_keys!5499 thiss!1248) (mask!8558 thiss!1248))))))

(declare-fun b!176594 () Bool)

(declare-fun e!116494 () Bool)

(assert (=> b!176594 (= e!116494 tp_is_empty!4129)))

(declare-fun e!116498 () Bool)

(declare-fun e!116497 () Bool)

(declare-fun array_inv!2249 (array!7405) Bool)

(declare-fun array_inv!2250 (array!7407) Bool)

(assert (=> b!176595 (= e!116497 (and tp!15765 tp_is_empty!4129 (array_inv!2249 (_keys!5499 thiss!1248)) (array_inv!2250 (_values!3619 thiss!1248)) e!116498))))

(declare-fun mapIsEmpty!7050 () Bool)

(declare-fun mapRes!7050 () Bool)

(assert (=> mapIsEmpty!7050 mapRes!7050))

(declare-fun b!176596 () Bool)

(declare-fun res!83678 () Bool)

(assert (=> b!176596 (=> (not res!83678) (not e!116493))))

(declare-datatypes ((tuple2!3282 0))(
  ( (tuple2!3283 (_1!1652 (_ BitVec 64)) (_2!1652 V!5153)) )
))
(declare-datatypes ((List!2236 0))(
  ( (Nil!2233) (Cons!2232 (h!2853 tuple2!3282) (t!7062 List!2236)) )
))
(declare-datatypes ((ListLongMap!2209 0))(
  ( (ListLongMap!2210 (toList!1120 List!2236)) )
))
(declare-fun contains!1184 (ListLongMap!2209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!772 (array!7405 array!7407 (_ BitVec 32) (_ BitVec 32) V!5153 V!5153 (_ BitVec 32) Int) ListLongMap!2209)

(assert (=> b!176596 (= res!83678 (contains!1184 (getCurrentListMap!772 (_keys!5499 thiss!1248) (_values!3619 thiss!1248) (mask!8558 thiss!1248) (extraKeys!3373 thiss!1248) (zeroValue!3477 thiss!1248) (minValue!3477 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3636 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7050 () Bool)

(declare-fun tp!15764 () Bool)

(assert (=> mapNonEmpty!7050 (= mapRes!7050 (and tp!15764 e!116494))))

(declare-fun mapValue!7050 () ValueCell!1721)

(declare-fun mapRest!7050 () (Array (_ BitVec 32) ValueCell!1721))

(declare-fun mapKey!7050 () (_ BitVec 32))

(assert (=> mapNonEmpty!7050 (= (arr!3514 (_values!3619 thiss!1248)) (store mapRest!7050 mapKey!7050 mapValue!7050))))

(declare-fun b!176597 () Bool)

(assert (=> b!176597 (= e!116498 (and e!116495 mapRes!7050))))

(declare-fun condMapEmpty!7050 () Bool)

(declare-fun mapDefault!7050 () ValueCell!1721)

