; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77154 () Bool)

(assert start!77154)

(declare-fun b!900476 () Bool)

(declare-fun b_free!16051 () Bool)

(declare-fun b_next!16051 () Bool)

(assert (=> b!900476 (= b_free!16051 (not b_next!16051))))

(declare-fun tp!56243 () Bool)

(declare-fun b_and!26373 () Bool)

(assert (=> b!900476 (= tp!56243 b_and!26373)))

(declare-fun b!900473 () Bool)

(declare-fun e!503999 () Bool)

(declare-datatypes ((SeekEntryResult!8939 0))(
  ( (MissingZero!8939 (index!38127 (_ BitVec 32))) (Found!8939 (index!38128 (_ BitVec 32))) (Intermediate!8939 (undefined!9751 Bool) (index!38129 (_ BitVec 32)) (x!76726 (_ BitVec 32))) (Undefined!8939) (MissingVacant!8939 (index!38130 (_ BitVec 32))) )
))
(declare-fun lt!406881 () SeekEntryResult!8939)

(declare-datatypes ((array!52808 0))(
  ( (array!52809 (arr!25375 (Array (_ BitVec 32) (_ BitVec 64))) (size!25834 (_ BitVec 32))) )
))
(declare-datatypes ((V!29471 0))(
  ( (V!29472 (val!9240 Int)) )
))
(declare-datatypes ((ValueCell!8708 0))(
  ( (ValueCellFull!8708 (v!11737 V!29471)) (EmptyCell!8708) )
))
(declare-datatypes ((array!52810 0))(
  ( (array!52811 (arr!25376 (Array (_ BitVec 32) ValueCell!8708)) (size!25835 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4432 0))(
  ( (LongMapFixedSize!4433 (defaultEntry!5450 Int) (mask!26237 (_ BitVec 32)) (extraKeys!5176 (_ BitVec 32)) (zeroValue!5280 V!29471) (minValue!5280 V!29471) (_size!2271 (_ BitVec 32)) (_keys!10254 array!52808) (_values!5467 array!52810) (_vacant!2271 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4432)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900473 (= e!503999 (inRange!0 (index!38128 lt!406881) (mask!26237 thiss!1181)))))

(declare-fun b!900474 () Bool)

(declare-fun e!504002 () Bool)

(declare-fun tp_is_empty!18379 () Bool)

(assert (=> b!900474 (= e!504002 tp_is_empty!18379)))

(declare-fun b!900475 () Bool)

(declare-fun e!504001 () Bool)

(declare-fun e!503998 () Bool)

(declare-fun mapRes!29245 () Bool)

(assert (=> b!900475 (= e!504001 (and e!503998 mapRes!29245))))

(declare-fun condMapEmpty!29245 () Bool)

(declare-fun mapDefault!29245 () ValueCell!8708)

