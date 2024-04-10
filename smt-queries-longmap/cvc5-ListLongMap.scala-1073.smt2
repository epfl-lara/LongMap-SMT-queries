; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22120 () Bool)

(assert start!22120)

(declare-fun b!230286 () Bool)

(declare-fun b_free!6187 () Bool)

(declare-fun b_next!6187 () Bool)

(assert (=> b!230286 (= b_free!6187 (not b_next!6187))))

(declare-fun tp!21703 () Bool)

(declare-fun b_and!13085 () Bool)

(assert (=> b!230286 (= tp!21703 b_and!13085)))

(declare-fun mapIsEmpty!10243 () Bool)

(declare-fun mapRes!10243 () Bool)

(assert (=> mapIsEmpty!10243 mapRes!10243))

(declare-fun b!230280 () Bool)

(declare-fun e!149438 () Bool)

(declare-fun tp_is_empty!6049 () Bool)

(assert (=> b!230280 (= e!149438 tp_is_empty!6049)))

(declare-fun b!230281 () Bool)

(declare-fun e!149443 () Bool)

(declare-fun e!149437 () Bool)

(assert (=> b!230281 (= e!149443 e!149437)))

(declare-fun res!113281 () Bool)

(assert (=> b!230281 (=> (not res!113281) (not e!149437))))

(declare-datatypes ((SeekEntryResult!935 0))(
  ( (MissingZero!935 (index!5910 (_ BitVec 32))) (Found!935 (index!5911 (_ BitVec 32))) (Intermediate!935 (undefined!1747 Bool) (index!5912 (_ BitVec 32)) (x!23435 (_ BitVec 32))) (Undefined!935) (MissingVacant!935 (index!5913 (_ BitVec 32))) )
))
(declare-fun lt!115878 () SeekEntryResult!935)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230281 (= res!113281 (or (= lt!115878 (MissingZero!935 index!297)) (= lt!115878 (MissingVacant!935 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7713 0))(
  ( (V!7714 (val!3069 Int)) )
))
(declare-datatypes ((ValueCell!2681 0))(
  ( (ValueCellFull!2681 (v!5089 V!7713)) (EmptyCell!2681) )
))
(declare-datatypes ((array!11341 0))(
  ( (array!11342 (arr!5390 (Array (_ BitVec 32) ValueCell!2681)) (size!5723 (_ BitVec 32))) )
))
(declare-datatypes ((array!11343 0))(
  ( (array!11344 (arr!5391 (Array (_ BitVec 32) (_ BitVec 64))) (size!5724 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3262 0))(
  ( (LongMapFixedSize!3263 (defaultEntry!4290 Int) (mask!10180 (_ BitVec 32)) (extraKeys!4027 (_ BitVec 32)) (zeroValue!4131 V!7713) (minValue!4131 V!7713) (_size!1680 (_ BitVec 32)) (_keys!6344 array!11343) (_values!4273 array!11341) (_vacant!1680 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3262)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11343 (_ BitVec 32)) SeekEntryResult!935)

(assert (=> b!230281 (= lt!115878 (seekEntryOrOpen!0 key!932 (_keys!6344 thiss!1504) (mask!10180 thiss!1504)))))

(declare-fun b!230282 () Bool)

(declare-fun e!149433 () Bool)

(declare-fun e!149441 () Bool)

(assert (=> b!230282 (= e!149433 (and e!149441 mapRes!10243))))

(declare-fun condMapEmpty!10243 () Bool)

(declare-fun mapDefault!10243 () ValueCell!2681)

