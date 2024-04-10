; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16034 () Bool)

(assert start!16034)

(declare-fun b!159145 () Bool)

(declare-fun b_free!3509 () Bool)

(declare-fun b_next!3509 () Bool)

(assert (=> b!159145 (= b_free!3509 (not b_next!3509))))

(declare-fun tp!13094 () Bool)

(declare-fun b_and!9923 () Bool)

(assert (=> b!159145 (= tp!13094 b_and!9923)))

(declare-fun b!159136 () Bool)

(declare-fun e!104190 () Bool)

(declare-fun tp_is_empty!3311 () Bool)

(assert (=> b!159136 (= e!104190 tp_is_empty!3311)))

(declare-fun b!159137 () Bool)

(declare-fun e!104189 () Bool)

(declare-datatypes ((V!4061 0))(
  ( (V!4062 (val!1700 Int)) )
))
(declare-datatypes ((ValueCell!1312 0))(
  ( (ValueCellFull!1312 (v!3565 V!4061)) (EmptyCell!1312) )
))
(declare-datatypes ((array!5699 0))(
  ( (array!5700 (arr!2695 (Array (_ BitVec 32) (_ BitVec 64))) (size!2979 (_ BitVec 32))) )
))
(declare-datatypes ((array!5701 0))(
  ( (array!5702 (arr!2696 (Array (_ BitVec 32) ValueCell!1312)) (size!2980 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1532 0))(
  ( (LongMapFixedSize!1533 (defaultEntry!3208 Int) (mask!7749 (_ BitVec 32)) (extraKeys!2949 (_ BitVec 32)) (zeroValue!3051 V!4061) (minValue!3051 V!4061) (_size!815 (_ BitVec 32)) (_keys!5007 array!5699) (_values!3191 array!5701) (_vacant!815 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1532)

(assert (=> b!159137 (= e!104189 (bvsgt #b00000000000000000000000000000000 (size!2979 (_keys!5007 thiss!1248))))))

(declare-fun b!159138 () Bool)

(declare-fun res!75156 () Bool)

(assert (=> b!159138 (=> (not res!75156) (not e!104189))))

(declare-datatypes ((List!1897 0))(
  ( (Nil!1894) (Cons!1893 (h!2506 (_ BitVec 64)) (t!6699 List!1897)) )
))
(declare-fun arrayNoDuplicates!0 (array!5699 (_ BitVec 32) List!1897) Bool)

(assert (=> b!159138 (= res!75156 (arrayNoDuplicates!0 (_keys!5007 thiss!1248) #b00000000000000000000000000000000 Nil!1894))))

(declare-fun b!159139 () Bool)

(declare-fun res!75155 () Bool)

(assert (=> b!159139 (=> (not res!75155) (not e!104189))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!307 0))(
  ( (MissingZero!307 (index!3396 (_ BitVec 32))) (Found!307 (index!3397 (_ BitVec 32))) (Intermediate!307 (undefined!1119 Bool) (index!3398 (_ BitVec 32)) (x!17571 (_ BitVec 32))) (Undefined!307) (MissingVacant!307 (index!3399 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5699 (_ BitVec 32)) SeekEntryResult!307)

(assert (=> b!159139 (= res!75155 (is-Undefined!307 (seekEntryOrOpen!0 key!828 (_keys!5007 thiss!1248) (mask!7749 thiss!1248))))))

(declare-fun b!159140 () Bool)

(declare-fun e!104193 () Bool)

(assert (=> b!159140 (= e!104193 tp_is_empty!3311)))

(declare-fun b!159141 () Bool)

(declare-fun res!75158 () Bool)

(assert (=> b!159141 (=> (not res!75158) (not e!104189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159141 (= res!75158 (validMask!0 (mask!7749 thiss!1248)))))

(declare-fun b!159142 () Bool)

(declare-fun res!75153 () Bool)

(assert (=> b!159142 (=> (not res!75153) (not e!104189))))

(assert (=> b!159142 (= res!75153 (and (= (size!2980 (_values!3191 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7749 thiss!1248))) (= (size!2979 (_keys!5007 thiss!1248)) (size!2980 (_values!3191 thiss!1248))) (bvsge (mask!7749 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2949 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2949 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159143 () Bool)

(declare-fun res!75152 () Bool)

(assert (=> b!159143 (=> (not res!75152) (not e!104189))))

(assert (=> b!159143 (= res!75152 (not (= key!828 (bvneg key!828))))))

(declare-fun res!75157 () Bool)

(assert (=> start!16034 (=> (not res!75157) (not e!104189))))

(declare-fun valid!719 (LongMapFixedSize!1532) Bool)

(assert (=> start!16034 (= res!75157 (valid!719 thiss!1248))))

(assert (=> start!16034 e!104189))

(declare-fun e!104192 () Bool)

(assert (=> start!16034 e!104192))

(assert (=> start!16034 true))

(declare-fun b!159144 () Bool)

(declare-fun e!104188 () Bool)

(declare-fun mapRes!5651 () Bool)

(assert (=> b!159144 (= e!104188 (and e!104193 mapRes!5651))))

(declare-fun condMapEmpty!5651 () Bool)

(declare-fun mapDefault!5651 () ValueCell!1312)

