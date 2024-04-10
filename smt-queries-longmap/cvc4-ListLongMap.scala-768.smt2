; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18080 () Bool)

(assert start!18080)

(declare-fun b!180095 () Bool)

(declare-fun b_free!4451 () Bool)

(declare-fun b_next!4451 () Bool)

(assert (=> b!180095 (= b_free!4451 (not b_next!4451))))

(declare-fun tp!16084 () Bool)

(declare-fun b_and!10985 () Bool)

(assert (=> b!180095 (= tp!16084 b_and!10985)))

(declare-fun b!180089 () Bool)

(declare-fun e!118630 () Bool)

(declare-fun tp_is_empty!4223 () Bool)

(assert (=> b!180089 (= e!118630 tp_is_empty!4223)))

(declare-fun b!180090 () Bool)

(declare-fun e!118637 () Bool)

(declare-fun e!118634 () Bool)

(assert (=> b!180090 (= e!118637 e!118634)))

(declare-fun c!32255 () Bool)

(declare-datatypes ((V!5277 0))(
  ( (V!5278 (val!2156 Int)) )
))
(declare-datatypes ((ValueCell!1768 0))(
  ( (ValueCellFull!1768 (v!4045 V!5277)) (EmptyCell!1768) )
))
(declare-datatypes ((array!7615 0))(
  ( (array!7616 (arr!3607 (Array (_ BitVec 32) (_ BitVec 64))) (size!3915 (_ BitVec 32))) )
))
(declare-datatypes ((array!7617 0))(
  ( (array!7618 (arr!3608 (Array (_ BitVec 32) ValueCell!1768)) (size!3916 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2444 0))(
  ( (LongMapFixedSize!2445 (defaultEntry!3698 Int) (mask!8693 (_ BitVec 32)) (extraKeys!3435 (_ BitVec 32)) (zeroValue!3539 V!5277) (minValue!3539 V!5277) (_size!1271 (_ BitVec 32)) (_keys!5589 array!7615) (_values!3681 array!7617) (_vacant!1271 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3356 0))(
  ( (tuple2!3357 (_1!1689 Bool) (_2!1689 LongMapFixedSize!2444)) )
))
(declare-fun lt!88896 () tuple2!3356)

(assert (=> b!180090 (= c!32255 (_1!1689 lt!88896))))

(declare-fun b!180092 () Bool)

(declare-fun e!118632 () Bool)

(declare-fun e!118639 () Bool)

(assert (=> b!180092 (= e!118632 e!118639)))

(declare-fun res!85309 () Bool)

(assert (=> b!180092 (=> (not res!85309) (not e!118639))))

(declare-datatypes ((SeekEntryResult!590 0))(
  ( (MissingZero!590 (index!4528 (_ BitVec 32))) (Found!590 (index!4529 (_ BitVec 32))) (Intermediate!590 (undefined!1402 Bool) (index!4530 (_ BitVec 32)) (x!19680 (_ BitVec 32))) (Undefined!590) (MissingVacant!590 (index!4531 (_ BitVec 32))) )
))
(declare-fun lt!88897 () SeekEntryResult!590)

(assert (=> b!180092 (= res!85309 (and (not (is-Undefined!590 lt!88897)) (is-MissingVacant!590 lt!88897)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun thiss!1248 () LongMapFixedSize!2444)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7615 (_ BitVec 32)) SeekEntryResult!590)

(assert (=> b!180092 (= lt!88897 (seekEntryOrOpen!0 key!828 (_keys!5589 thiss!1248) (mask!8693 thiss!1248)))))

(declare-fun mapNonEmpty!7228 () Bool)

(declare-fun mapRes!7228 () Bool)

(declare-fun tp!16083 () Bool)

(assert (=> mapNonEmpty!7228 (= mapRes!7228 (and tp!16083 e!118630))))

(declare-fun mapKey!7228 () (_ BitVec 32))

(declare-fun mapValue!7228 () ValueCell!1768)

(declare-fun mapRest!7228 () (Array (_ BitVec 32) ValueCell!1768))

(assert (=> mapNonEmpty!7228 (= (arr!3608 (_values!3681 thiss!1248)) (store mapRest!7228 mapKey!7228 mapValue!7228))))

(declare-fun bm!18189 () Bool)

(declare-datatypes ((tuple2!3358 0))(
  ( (tuple2!3359 (_1!1690 (_ BitVec 64)) (_2!1690 V!5277)) )
))
(declare-datatypes ((List!2290 0))(
  ( (Nil!2287) (Cons!2286 (h!2911 tuple2!3358) (t!7138 List!2290)) )
))
(declare-datatypes ((ListLongMap!2279 0))(
  ( (ListLongMap!2280 (toList!1155 List!2290)) )
))
(declare-fun call!18193 () ListLongMap!2279)

(declare-fun map!1934 (LongMapFixedSize!2444) ListLongMap!2279)

(assert (=> bm!18189 (= call!18193 (map!1934 thiss!1248))))

(declare-fun b!180093 () Bool)

(declare-fun e!118633 () Bool)

(declare-fun e!118631 () Bool)

(assert (=> b!180093 (= e!118633 (and e!118631 mapRes!7228))))

(declare-fun condMapEmpty!7228 () Bool)

(declare-fun mapDefault!7228 () ValueCell!1768)

