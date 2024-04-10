; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80136 () Bool)

(assert start!80136)

(declare-fun b!941756 () Bool)

(declare-fun b_free!17923 () Bool)

(declare-fun b_next!17923 () Bool)

(assert (=> b!941756 (= b_free!17923 (not b_next!17923))))

(declare-fun tp!62258 () Bool)

(declare-fun b_and!29335 () Bool)

(assert (=> b!941756 (= tp!62258 b_and!29335)))

(declare-fun mapNonEmpty!32451 () Bool)

(declare-fun mapRes!32451 () Bool)

(declare-fun tp!62257 () Bool)

(declare-fun e!529468 () Bool)

(assert (=> mapNonEmpty!32451 (= mapRes!32451 (and tp!62257 e!529468))))

(declare-datatypes ((V!32207 0))(
  ( (V!32208 (val!10266 Int)) )
))
(declare-datatypes ((ValueCell!9734 0))(
  ( (ValueCellFull!9734 (v!12797 V!32207)) (EmptyCell!9734) )
))
(declare-fun mapRest!32451 () (Array (_ BitVec 32) ValueCell!9734))

(declare-datatypes ((array!56818 0))(
  ( (array!56819 (arr!27340 (Array (_ BitVec 32) ValueCell!9734)) (size!27803 (_ BitVec 32))) )
))
(declare-datatypes ((array!56820 0))(
  ( (array!56821 (arr!27341 (Array (_ BitVec 32) (_ BitVec 64))) (size!27804 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4618 0))(
  ( (LongMapFixedSize!4619 (defaultEntry!5600 Int) (mask!27181 (_ BitVec 32)) (extraKeys!5332 (_ BitVec 32)) (zeroValue!5436 V!32207) (minValue!5436 V!32207) (_size!2364 (_ BitVec 32)) (_keys!10460 array!56820) (_values!5623 array!56818) (_vacant!2364 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4618)

(declare-fun mapKey!32451 () (_ BitVec 32))

(declare-fun mapValue!32451 () ValueCell!9734)

(assert (=> mapNonEmpty!32451 (= (arr!27340 (_values!5623 thiss!1141)) (store mapRest!32451 mapKey!32451 mapValue!32451))))

(declare-fun mapIsEmpty!32451 () Bool)

(assert (=> mapIsEmpty!32451 mapRes!32451))

(declare-fun b!941750 () Bool)

(declare-fun e!529465 () Bool)

(declare-fun e!529469 () Bool)

(assert (=> b!941750 (= e!529465 (and e!529469 mapRes!32451))))

(declare-fun condMapEmpty!32451 () Bool)

(declare-fun mapDefault!32451 () ValueCell!9734)

