; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18098 () Bool)

(assert start!18098)

(declare-fun b!180228 () Bool)

(declare-fun b_free!4453 () Bool)

(declare-fun b_next!4453 () Bool)

(assert (=> b!180228 (= b_free!4453 (not b_next!4453))))

(declare-fun tp!16093 () Bool)

(declare-fun b_and!10987 () Bool)

(assert (=> b!180228 (= tp!16093 b_and!10987)))

(declare-fun b!180226 () Bool)

(declare-fun e!118719 () Bool)

(declare-fun tp_is_empty!4225 () Bool)

(assert (=> b!180226 (= e!118719 tp_is_empty!4225)))

(declare-fun b!180227 () Bool)

(declare-fun e!118713 () Bool)

(declare-fun e!118721 () Bool)

(assert (=> b!180227 (= e!118713 e!118721)))

(declare-datatypes ((V!5281 0))(
  ( (V!5282 (val!2157 Int)) )
))
(declare-datatypes ((tuple2!3360 0))(
  ( (tuple2!3361 (_1!1691 (_ BitVec 64)) (_2!1691 V!5281)) )
))
(declare-datatypes ((List!2292 0))(
  ( (Nil!2289) (Cons!2288 (h!2913 tuple2!3360) (t!7140 List!2292)) )
))
(declare-datatypes ((ListLongMap!2281 0))(
  ( (ListLongMap!2282 (toList!1156 List!2292)) )
))
(declare-fun lt!89028 () ListLongMap!2281)

(declare-fun call!18211 () ListLongMap!2281)

(assert (=> b!180227 (= lt!89028 call!18211)))

(declare-fun res!85368 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1231 (ListLongMap!2281 (_ BitVec 64)) Bool)

(assert (=> b!180227 (= res!85368 (not (contains!1231 lt!89028 key!828)))))

(assert (=> b!180227 (=> res!85368 e!118721)))

(declare-datatypes ((ValueCell!1769 0))(
  ( (ValueCellFull!1769 (v!4048 V!5281)) (EmptyCell!1769) )
))
(declare-datatypes ((array!7621 0))(
  ( (array!7622 (arr!3609 (Array (_ BitVec 32) (_ BitVec 64))) (size!3917 (_ BitVec 32))) )
))
(declare-datatypes ((array!7623 0))(
  ( (array!7624 (arr!3610 (Array (_ BitVec 32) ValueCell!1769)) (size!3918 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2446 0))(
  ( (LongMapFixedSize!2447 (defaultEntry!3699 Int) (mask!8697 (_ BitVec 32)) (extraKeys!3436 (_ BitVec 32)) (zeroValue!3540 V!5281) (minValue!3540 V!5281) (_size!1272 (_ BitVec 32)) (_keys!5591 array!7621) (_values!3682 array!7623) (_vacant!1272 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2446)

(declare-fun e!118715 () Bool)

(declare-fun e!118718 () Bool)

(declare-fun array_inv!2323 (array!7621) Bool)

(declare-fun array_inv!2324 (array!7623) Bool)

(assert (=> b!180228 (= e!118715 (and tp!16093 tp_is_empty!4225 (array_inv!2323 (_keys!5591 thiss!1248)) (array_inv!2324 (_values!3682 thiss!1248)) e!118718))))

(declare-fun bm!18207 () Bool)

(declare-fun call!18210 () ListLongMap!2281)

(declare-fun map!1937 (LongMapFixedSize!2446) ListLongMap!2281)

(assert (=> bm!18207 (= call!18210 (map!1937 thiss!1248))))

(declare-fun b!180229 () Bool)

(declare-fun mapRes!7234 () Bool)

(assert (=> b!180229 (= e!118718 (and e!118719 mapRes!7234))))

(declare-fun condMapEmpty!7234 () Bool)

(declare-fun mapDefault!7234 () ValueCell!1769)

