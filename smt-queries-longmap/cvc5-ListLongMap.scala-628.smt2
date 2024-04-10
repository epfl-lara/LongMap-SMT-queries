; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16116 () Bool)

(assert start!16116)

(declare-fun b!160328 () Bool)

(declare-fun b_free!3577 () Bool)

(declare-fun b_next!3577 () Bool)

(assert (=> b!160328 (= b_free!3577 (not b_next!3577))))

(declare-fun tp!13301 () Bool)

(declare-fun b_and!9991 () Bool)

(assert (=> b!160328 (= tp!13301 b_and!9991)))

(declare-fun b!160320 () Bool)

(declare-fun res!75896 () Bool)

(declare-fun e!104842 () Bool)

(assert (=> b!160320 (=> (not res!75896) (not e!104842))))

(declare-datatypes ((V!4153 0))(
  ( (V!4154 (val!1734 Int)) )
))
(declare-datatypes ((ValueCell!1346 0))(
  ( (ValueCellFull!1346 (v!3599 V!4153)) (EmptyCell!1346) )
))
(declare-datatypes ((array!5837 0))(
  ( (array!5838 (arr!2763 (Array (_ BitVec 32) (_ BitVec 64))) (size!3047 (_ BitVec 32))) )
))
(declare-datatypes ((array!5839 0))(
  ( (array!5840 (arr!2764 (Array (_ BitVec 32) ValueCell!1346)) (size!3048 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1600 0))(
  ( (LongMapFixedSize!1601 (defaultEntry!3242 Int) (mask!7810 (_ BitVec 32)) (extraKeys!2983 (_ BitVec 32)) (zeroValue!3085 V!4153) (minValue!3085 V!4153) (_size!849 (_ BitVec 32)) (_keys!5043 array!5837) (_values!3225 array!5839) (_vacant!849 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1600)

(assert (=> b!160320 (= res!75896 (and (= (size!3048 (_values!3225 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7810 thiss!1248))) (= (size!3047 (_keys!5043 thiss!1248)) (size!3048 (_values!3225 thiss!1248))) (bvsge (mask!7810 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2983 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2983 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160321 () Bool)

(declare-fun e!104844 () Bool)

(declare-fun tp_is_empty!3379 () Bool)

(assert (=> b!160321 (= e!104844 tp_is_empty!3379)))

(declare-fun b!160322 () Bool)

(declare-fun res!75894 () Bool)

(assert (=> b!160322 (=> (not res!75894) (not e!104842))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!328 0))(
  ( (MissingZero!328 (index!3480 (_ BitVec 32))) (Found!328 (index!3481 (_ BitVec 32))) (Intermediate!328 (undefined!1140 Bool) (index!3482 (_ BitVec 32)) (x!17696 (_ BitVec 32))) (Undefined!328) (MissingVacant!328 (index!3483 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5837 (_ BitVec 32)) SeekEntryResult!328)

(assert (=> b!160322 (= res!75894 (is-Undefined!328 (seekEntryOrOpen!0 key!828 (_keys!5043 thiss!1248) (mask!7810 thiss!1248))))))

(declare-fun b!160323 () Bool)

(declare-fun e!104843 () Bool)

(declare-fun e!104839 () Bool)

(declare-fun mapRes!5756 () Bool)

(assert (=> b!160323 (= e!104843 (and e!104839 mapRes!5756))))

(declare-fun condMapEmpty!5756 () Bool)

(declare-fun mapDefault!5756 () ValueCell!1346)

