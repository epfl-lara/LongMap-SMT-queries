; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16014 () Bool)

(assert start!16014)

(declare-fun b!158983 () Bool)

(declare-fun b_free!3503 () Bool)

(declare-fun b_next!3503 () Bool)

(assert (=> b!158983 (= b_free!3503 (not b_next!3503))))

(declare-fun tp!13073 () Bool)

(declare-fun b_and!9917 () Bool)

(assert (=> b!158983 (= tp!13073 b_and!9917)))

(declare-fun b!158976 () Bool)

(declare-fun res!75069 () Bool)

(declare-fun e!104099 () Bool)

(assert (=> b!158976 (=> (not res!75069) (not e!104099))))

(declare-datatypes ((V!4053 0))(
  ( (V!4054 (val!1697 Int)) )
))
(declare-datatypes ((ValueCell!1309 0))(
  ( (ValueCellFull!1309 (v!3562 V!4053)) (EmptyCell!1309) )
))
(declare-datatypes ((array!5685 0))(
  ( (array!5686 (arr!2689 (Array (_ BitVec 32) (_ BitVec 64))) (size!2973 (_ BitVec 32))) )
))
(declare-datatypes ((array!5687 0))(
  ( (array!5688 (arr!2690 (Array (_ BitVec 32) ValueCell!1309)) (size!2974 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1526 0))(
  ( (LongMapFixedSize!1527 (defaultEntry!3205 Int) (mask!7741 (_ BitVec 32)) (extraKeys!2946 (_ BitVec 32)) (zeroValue!3048 V!4053) (minValue!3048 V!4053) (_size!812 (_ BitVec 32)) (_keys!5002 array!5685) (_values!3188 array!5687) (_vacant!812 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1526)

(assert (=> b!158976 (= res!75069 (and (= (size!2974 (_values!3188 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7741 thiss!1248))) (= (size!2973 (_keys!5002 thiss!1248)) (size!2974 (_values!3188 thiss!1248))) (bvsge (mask!7741 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2946 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2946 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5639 () Bool)

(declare-fun mapRes!5639 () Bool)

(declare-fun tp!13072 () Bool)

(declare-fun e!104097 () Bool)

(assert (=> mapNonEmpty!5639 (= mapRes!5639 (and tp!13072 e!104097))))

(declare-fun mapRest!5639 () (Array (_ BitVec 32) ValueCell!1309))

(declare-fun mapValue!5639 () ValueCell!1309)

(declare-fun mapKey!5639 () (_ BitVec 32))

(assert (=> mapNonEmpty!5639 (= (arr!2690 (_values!3188 thiss!1248)) (store mapRest!5639 mapKey!5639 mapValue!5639))))

(declare-fun mapIsEmpty!5639 () Bool)

(assert (=> mapIsEmpty!5639 mapRes!5639))

(declare-fun b!158977 () Bool)

(declare-fun res!75070 () Bool)

(assert (=> b!158977 (=> (not res!75070) (not e!104099))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!304 0))(
  ( (MissingZero!304 (index!3384 (_ BitVec 32))) (Found!304 (index!3385 (_ BitVec 32))) (Intermediate!304 (undefined!1116 Bool) (index!3386 (_ BitVec 32)) (x!17552 (_ BitVec 32))) (Undefined!304) (MissingVacant!304 (index!3387 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5685 (_ BitVec 32)) SeekEntryResult!304)

(assert (=> b!158977 (= res!75070 (is-Undefined!304 (seekEntryOrOpen!0 key!828 (_keys!5002 thiss!1248) (mask!7741 thiss!1248))))))

(declare-fun b!158978 () Bool)

(declare-fun e!104095 () Bool)

(declare-fun e!104096 () Bool)

(assert (=> b!158978 (= e!104095 (and e!104096 mapRes!5639))))

(declare-fun condMapEmpty!5639 () Bool)

(declare-fun mapDefault!5639 () ValueCell!1309)

