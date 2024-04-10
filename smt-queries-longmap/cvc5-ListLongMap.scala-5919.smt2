; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76804 () Bool)

(assert start!76804)

(declare-fun b!898440 () Bool)

(declare-fun b_free!16015 () Bool)

(declare-fun b_next!16015 () Bool)

(assert (=> b!898440 (= b_free!16015 (not b_next!16015))))

(declare-fun tp!56114 () Bool)

(declare-fun b_and!26309 () Bool)

(assert (=> b!898440 (= tp!56114 b_and!26309)))

(declare-fun b!898432 () Bool)

(declare-fun e!502566 () Bool)

(declare-datatypes ((SeekEntryResult!8925 0))(
  ( (MissingZero!8925 (index!38071 (_ BitVec 32))) (Found!8925 (index!38072 (_ BitVec 32))) (Intermediate!8925 (undefined!9737 Bool) (index!38073 (_ BitVec 32)) (x!76572 (_ BitVec 32))) (Undefined!8925) (MissingVacant!8925 (index!38074 (_ BitVec 32))) )
))
(declare-fun lt!405594 () SeekEntryResult!8925)

(declare-datatypes ((array!52724 0))(
  ( (array!52725 (arr!25339 (Array (_ BitVec 32) (_ BitVec 64))) (size!25794 (_ BitVec 32))) )
))
(declare-datatypes ((V!29423 0))(
  ( (V!29424 (val!9222 Int)) )
))
(declare-datatypes ((ValueCell!8690 0))(
  ( (ValueCellFull!8690 (v!11713 V!29423)) (EmptyCell!8690) )
))
(declare-datatypes ((array!52726 0))(
  ( (array!52727 (arr!25340 (Array (_ BitVec 32) ValueCell!8690)) (size!25795 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4396 0))(
  ( (LongMapFixedSize!4397 (defaultEntry!5412 Int) (mask!26142 (_ BitVec 32)) (extraKeys!5128 (_ BitVec 32)) (zeroValue!5232 V!29423) (minValue!5232 V!29423) (_size!2253 (_ BitVec 32)) (_keys!10187 array!52724) (_values!5419 array!52726) (_vacant!2253 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4396)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898432 (= e!502566 (inRange!0 (index!38072 lt!405594) (mask!26142 thiss!1181)))))

(declare-fun mapIsEmpty!29169 () Bool)

(declare-fun mapRes!29169 () Bool)

(assert (=> mapIsEmpty!29169 mapRes!29169))

(declare-fun b!898433 () Bool)

(declare-fun e!502569 () Bool)

(declare-fun e!502572 () Bool)

(assert (=> b!898433 (= e!502569 (and e!502572 mapRes!29169))))

(declare-fun condMapEmpty!29169 () Bool)

(declare-fun mapDefault!29169 () ValueCell!8690)

