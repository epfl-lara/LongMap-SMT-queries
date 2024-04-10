; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18076 () Bool)

(assert start!18076)

(declare-fun b!180027 () Bool)

(declare-fun b_free!4447 () Bool)

(declare-fun b_next!4447 () Bool)

(assert (=> b!180027 (= b_free!4447 (not b_next!4447))))

(declare-fun tp!16071 () Bool)

(declare-fun b_and!10981 () Bool)

(assert (=> b!180027 (= tp!16071 b_and!10981)))

(declare-fun bm!18177 () Bool)

(declare-datatypes ((V!5273 0))(
  ( (V!5274 (val!2154 Int)) )
))
(declare-datatypes ((tuple2!3348 0))(
  ( (tuple2!3349 (_1!1685 (_ BitVec 64)) (_2!1685 V!5273)) )
))
(declare-datatypes ((List!2288 0))(
  ( (Nil!2285) (Cons!2284 (h!2909 tuple2!3348) (t!7136 List!2288)) )
))
(declare-datatypes ((ListLongMap!2275 0))(
  ( (ListLongMap!2276 (toList!1153 List!2288)) )
))
(declare-fun call!18180 () ListLongMap!2275)

(declare-datatypes ((ValueCell!1766 0))(
  ( (ValueCellFull!1766 (v!4043 V!5273)) (EmptyCell!1766) )
))
(declare-datatypes ((array!7607 0))(
  ( (array!7608 (arr!3603 (Array (_ BitVec 32) (_ BitVec 64))) (size!3911 (_ BitVec 32))) )
))
(declare-datatypes ((array!7609 0))(
  ( (array!7610 (arr!3604 (Array (_ BitVec 32) ValueCell!1766)) (size!3912 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2440 0))(
  ( (LongMapFixedSize!2441 (defaultEntry!3696 Int) (mask!8691 (_ BitVec 32)) (extraKeys!3433 (_ BitVec 32)) (zeroValue!3537 V!5273) (minValue!3537 V!5273) (_size!1269 (_ BitVec 32)) (_keys!5587 array!7607) (_values!3679 array!7609) (_vacant!1269 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3350 0))(
  ( (tuple2!3351 (_1!1686 Bool) (_2!1686 LongMapFixedSize!2440)) )
))
(declare-fun lt!88879 () tuple2!3350)

(declare-fun map!1932 (LongMapFixedSize!2440) ListLongMap!2275)

(assert (=> bm!18177 (= call!18180 (map!1932 (_2!1686 lt!88879)))))

(declare-fun b!180023 () Bool)

(declare-fun e!118573 () Bool)

(declare-fun e!118574 () Bool)

(declare-fun mapRes!7222 () Bool)

(assert (=> b!180023 (= e!118573 (and e!118574 mapRes!7222))))

(declare-fun condMapEmpty!7222 () Bool)

(declare-fun thiss!1248 () LongMapFixedSize!2440)

(declare-fun mapDefault!7222 () ValueCell!1766)

