; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18466 () Bool)

(assert start!18466)

(declare-fun b!183181 () Bool)

(declare-fun b_free!4523 () Bool)

(declare-fun b_next!4523 () Bool)

(assert (=> b!183181 (= b_free!4523 (not b_next!4523))))

(declare-fun tp!16336 () Bool)

(declare-fun b_and!11091 () Bool)

(assert (=> b!183181 (= tp!16336 b_and!11091)))

(declare-fun b!183175 () Bool)

(declare-fun res!86717 () Bool)

(declare-fun e!120608 () Bool)

(assert (=> b!183175 (=> (not res!86717) (not e!120608))))

(declare-datatypes ((V!5373 0))(
  ( (V!5374 (val!2192 Int)) )
))
(declare-datatypes ((ValueCell!1804 0))(
  ( (ValueCellFull!1804 (v!4094 V!5373)) (EmptyCell!1804) )
))
(declare-datatypes ((array!7781 0))(
  ( (array!7782 (arr!3679 (Array (_ BitVec 32) (_ BitVec 64))) (size!3991 (_ BitVec 32))) )
))
(declare-datatypes ((array!7783 0))(
  ( (array!7784 (arr!3680 (Array (_ BitVec 32) ValueCell!1804)) (size!3992 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2516 0))(
  ( (LongMapFixedSize!2517 (defaultEntry!3747 Int) (mask!8805 (_ BitVec 32)) (extraKeys!3484 (_ BitVec 32)) (zeroValue!3588 V!5373) (minValue!3588 V!5373) (_size!1307 (_ BitVec 32)) (_keys!5664 array!7781) (_values!3730 array!7783) (_vacant!1307 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2516)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3416 0))(
  ( (tuple2!3417 (_1!1719 (_ BitVec 64)) (_2!1719 V!5373)) )
))
(declare-datatypes ((List!2334 0))(
  ( (Nil!2331) (Cons!2330 (h!2959 tuple2!3416) (t!7200 List!2334)) )
))
(declare-datatypes ((ListLongMap!2333 0))(
  ( (ListLongMap!2334 (toList!1182 List!2334)) )
))
(declare-fun contains!1268 (ListLongMap!2333 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!830 (array!7781 array!7783 (_ BitVec 32) (_ BitVec 32) V!5373 V!5373 (_ BitVec 32) Int) ListLongMap!2333)

(assert (=> b!183175 (= res!86717 (not (contains!1268 (getCurrentListMap!830 (_keys!5664 thiss!1248) (_values!3730 thiss!1248) (mask!8805 thiss!1248) (extraKeys!3484 thiss!1248) (zeroValue!3588 thiss!1248) (minValue!3588 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3747 thiss!1248)) key!828)))))

(declare-fun b!183176 () Bool)

(declare-fun e!120607 () Bool)

(assert (=> b!183176 (= e!120607 e!120608)))

(declare-fun res!86718 () Bool)

(assert (=> b!183176 (=> (not res!86718) (not e!120608))))

(declare-datatypes ((SeekEntryResult!618 0))(
  ( (MissingZero!618 (index!4642 (_ BitVec 32))) (Found!618 (index!4643 (_ BitVec 32))) (Intermediate!618 (undefined!1430 Bool) (index!4644 (_ BitVec 32)) (x!19954 (_ BitVec 32))) (Undefined!618) (MissingVacant!618 (index!4645 (_ BitVec 32))) )
))
(declare-fun lt!90529 () SeekEntryResult!618)

(assert (=> b!183176 (= res!86718 (and (not (is-Undefined!618 lt!90529)) (not (is-MissingVacant!618 lt!90529)) (not (is-MissingZero!618 lt!90529)) (is-Found!618 lt!90529)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7781 (_ BitVec 32)) SeekEntryResult!618)

(assert (=> b!183176 (= lt!90529 (seekEntryOrOpen!0 key!828 (_keys!5664 thiss!1248) (mask!8805 thiss!1248)))))

(declare-fun b!183177 () Bool)

(declare-fun res!86715 () Bool)

(assert (=> b!183177 (=> (not res!86715) (not e!120607))))

(assert (=> b!183177 (= res!86715 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7373 () Bool)

(declare-fun mapRes!7373 () Bool)

(declare-fun tp!16337 () Bool)

(declare-fun e!120606 () Bool)

(assert (=> mapNonEmpty!7373 (= mapRes!7373 (and tp!16337 e!120606))))

(declare-fun mapRest!7373 () (Array (_ BitVec 32) ValueCell!1804))

(declare-fun mapValue!7373 () ValueCell!1804)

(declare-fun mapKey!7373 () (_ BitVec 32))

(assert (=> mapNonEmpty!7373 (= (arr!3680 (_values!3730 thiss!1248)) (store mapRest!7373 mapKey!7373 mapValue!7373))))

(declare-fun b!183179 () Bool)

(declare-fun e!120602 () Bool)

(declare-fun e!120604 () Bool)

(assert (=> b!183179 (= e!120602 (and e!120604 mapRes!7373))))

(declare-fun condMapEmpty!7373 () Bool)

(declare-fun mapDefault!7373 () ValueCell!1804)

