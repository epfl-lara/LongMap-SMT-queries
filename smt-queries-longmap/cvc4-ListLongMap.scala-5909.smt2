; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76474 () Bool)

(assert start!76474)

(declare-fun b!896573 () Bool)

(declare-fun b_free!15959 () Bool)

(declare-fun b_next!15959 () Bool)

(assert (=> b!896573 (= b_free!15959 (not b_next!15959))))

(declare-fun tp!55912 () Bool)

(declare-fun b_and!26251 () Bool)

(assert (=> b!896573 (= tp!55912 b_and!26251)))

(declare-fun tp_is_empty!18287 () Bool)

(declare-fun e!501187 () Bool)

(declare-datatypes ((array!52592 0))(
  ( (array!52593 (arr!25283 (Array (_ BitVec 32) (_ BitVec 64))) (size!25734 (_ BitVec 32))) )
))
(declare-datatypes ((V!29347 0))(
  ( (V!29348 (val!9194 Int)) )
))
(declare-datatypes ((ValueCell!8662 0))(
  ( (ValueCellFull!8662 (v!11684 V!29347)) (EmptyCell!8662) )
))
(declare-datatypes ((array!52594 0))(
  ( (array!52595 (arr!25284 (Array (_ BitVec 32) ValueCell!8662)) (size!25735 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4340 0))(
  ( (LongMapFixedSize!4341 (defaultEntry!5382 Int) (mask!26028 (_ BitVec 32)) (extraKeys!5084 (_ BitVec 32)) (zeroValue!5188 V!29347) (minValue!5188 V!29347) (_size!2225 (_ BitVec 32)) (_keys!10117 array!52592) (_values!5375 array!52594) (_vacant!2225 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4340)

(declare-fun e!501192 () Bool)

(declare-fun array_inv!19846 (array!52592) Bool)

(declare-fun array_inv!19847 (array!52594) Bool)

(assert (=> b!896573 (= e!501187 (and tp!55912 tp_is_empty!18287 (array_inv!19846 (_keys!10117 thiss!1181)) (array_inv!19847 (_values!5375 thiss!1181)) e!501192))))

(declare-fun mapIsEmpty!29051 () Bool)

(declare-fun mapRes!29051 () Bool)

(assert (=> mapIsEmpty!29051 mapRes!29051))

(declare-fun b!896574 () Bool)

(declare-fun e!501186 () Bool)

(assert (=> b!896574 (= e!501192 (and e!501186 mapRes!29051))))

(declare-fun condMapEmpty!29051 () Bool)

(declare-fun mapDefault!29051 () ValueCell!8662)

