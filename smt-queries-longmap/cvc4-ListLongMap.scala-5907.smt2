; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76430 () Bool)

(assert start!76430)

(declare-fun b!896338 () Bool)

(declare-fun b_free!15947 () Bool)

(declare-fun b_next!15947 () Bool)

(assert (=> b!896338 (= b_free!15947 (not b_next!15947))))

(declare-fun tp!55869 () Bool)

(declare-fun b_and!26239 () Bool)

(assert (=> b!896338 (= tp!55869 b_and!26239)))

(declare-datatypes ((SeekEntryResult!8895 0))(
  ( (MissingZero!8895 (index!37951 (_ BitVec 32))) (Found!8895 (index!37952 (_ BitVec 32))) (Intermediate!8895 (undefined!9707 Bool) (index!37953 (_ BitVec 32)) (x!76312 (_ BitVec 32))) (Undefined!8895) (MissingVacant!8895 (index!37954 (_ BitVec 32))) )
))
(declare-fun lt!404778 () SeekEntryResult!8895)

(declare-datatypes ((array!52564 0))(
  ( (array!52565 (arr!25271 (Array (_ BitVec 32) (_ BitVec 64))) (size!25722 (_ BitVec 32))) )
))
(declare-datatypes ((V!29331 0))(
  ( (V!29332 (val!9188 Int)) )
))
(declare-datatypes ((ValueCell!8656 0))(
  ( (ValueCellFull!8656 (v!11678 V!29331)) (EmptyCell!8656) )
))
(declare-datatypes ((array!52566 0))(
  ( (array!52567 (arr!25272 (Array (_ BitVec 32) ValueCell!8656)) (size!25723 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4328 0))(
  ( (LongMapFixedSize!4329 (defaultEntry!5376 Int) (mask!26011 (_ BitVec 32)) (extraKeys!5076 (_ BitVec 32)) (zeroValue!5180 V!29331) (minValue!5180 V!29331) (_size!2219 (_ BitVec 32)) (_keys!10107 array!52564) (_values!5367 array!52566) (_vacant!2219 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4328)

(declare-fun e!500984 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun b!896333 () Bool)

(declare-fun arrayContainsKey!0 (array!52564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896333 (= e!500984 (arrayContainsKey!0 (_keys!10107 thiss!1181) key!785 (index!37952 lt!404778)))))

(declare-fun b!896334 () Bool)

(declare-fun e!500986 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896334 (= e!500986 (inRange!0 (index!37952 lt!404778) (mask!26011 thiss!1181)))))

(declare-fun res!606102 () Bool)

(declare-fun e!500983 () Bool)

(assert (=> start!76430 (=> (not res!606102) (not e!500983))))

(declare-fun valid!1670 (LongMapFixedSize!4328) Bool)

(assert (=> start!76430 (= res!606102 (valid!1670 thiss!1181))))

(assert (=> start!76430 e!500983))

(declare-fun e!500980 () Bool)

(assert (=> start!76430 e!500980))

(assert (=> start!76430 true))

(declare-fun b!896335 () Bool)

(declare-fun e!500985 () Bool)

(declare-fun e!500982 () Bool)

(declare-fun mapRes!29027 () Bool)

(assert (=> b!896335 (= e!500985 (and e!500982 mapRes!29027))))

(declare-fun condMapEmpty!29027 () Bool)

(declare-fun mapDefault!29027 () ValueCell!8656)

