; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17284 () Bool)

(assert start!17284)

(declare-fun b!173270 () Bool)

(declare-fun b_free!4309 () Bool)

(declare-fun b_next!4309 () Bool)

(assert (=> b!173270 (= b_free!4309 (not b_next!4309))))

(declare-fun tp!15591 () Bool)

(declare-fun b_and!10749 () Bool)

(assert (=> b!173270 (= tp!15591 b_and!10749)))

(declare-fun b!173265 () Bool)

(declare-fun e!114453 () Bool)

(declare-fun tp_is_empty!4081 () Bool)

(assert (=> b!173265 (= e!114453 tp_is_empty!4081)))

(declare-fun b!173266 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5089 0))(
  ( (V!5090 (val!2085 Int)) )
))
(declare-datatypes ((tuple2!3238 0))(
  ( (tuple2!3239 (_1!1630 (_ BitVec 64)) (_2!1630 V!5089)) )
))
(declare-datatypes ((List!2205 0))(
  ( (Nil!2202) (Cons!2201 (h!2818 tuple2!3238) (t!7012 List!2205)) )
))
(declare-datatypes ((ListLongMap!2165 0))(
  ( (ListLongMap!2166 (toList!1098 List!2205)) )
))
(declare-fun lt!85720 () ListLongMap!2165)

(declare-fun v!309 () V!5089)

(declare-datatypes ((ValueCell!1697 0))(
  ( (ValueCellFull!1697 (v!3953 V!5089)) (EmptyCell!1697) )
))
(declare-datatypes ((array!7293 0))(
  ( (array!7294 (arr!3465 (Array (_ BitVec 32) (_ BitVec 64))) (size!3764 (_ BitVec 32))) )
))
(declare-datatypes ((array!7295 0))(
  ( (array!7296 (arr!3466 (Array (_ BitVec 32) ValueCell!1697)) (size!3765 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2302 0))(
  ( (LongMapFixedSize!2303 (defaultEntry!3597 Int) (mask!8469 (_ BitVec 32)) (extraKeys!3336 (_ BitVec 32)) (zeroValue!3438 V!5089) (minValue!3440 V!5089) (_size!1200 (_ BitVec 32)) (_keys!5438 array!7293) (_values!3580 array!7295) (_vacant!1200 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2302)

(declare-fun e!114454 () Bool)

(declare-fun +!245 (ListLongMap!2165 tuple2!3238) ListLongMap!2165)

(declare-fun map!1881 (LongMapFixedSize!2302) ListLongMap!2165)

(assert (=> b!173266 (= e!114454 (= lt!85720 (+!245 (map!1881 thiss!1248) (tuple2!3239 key!828 v!309))))))

(declare-fun mapIsEmpty!6948 () Bool)

(declare-fun mapRes!6948 () Bool)

(assert (=> mapIsEmpty!6948 mapRes!6948))

(declare-fun b!173267 () Bool)

(declare-fun e!114451 () Bool)

(assert (=> b!173267 (= e!114451 (and e!114453 mapRes!6948))))

(declare-fun condMapEmpty!6948 () Bool)

(declare-fun mapDefault!6948 () ValueCell!1697)

