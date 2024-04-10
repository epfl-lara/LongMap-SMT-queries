; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72412 () Bool)

(assert start!72412)

(declare-fun b_free!13597 () Bool)

(declare-fun b_next!13597 () Bool)

(assert (=> start!72412 (= b_free!13597 (not b_next!13597))))

(declare-fun tp!47890 () Bool)

(declare-fun b_and!22683 () Bool)

(assert (=> start!72412 (= tp!47890 b_and!22683)))

(declare-datatypes ((V!25665 0))(
  ( (V!25666 (val!7779 Int)) )
))
(declare-datatypes ((tuple2!10298 0))(
  ( (tuple2!10299 (_1!5160 (_ BitVec 64)) (_2!5160 V!25665)) )
))
(declare-datatypes ((List!16097 0))(
  ( (Nil!16094) (Cons!16093 (h!17224 tuple2!10298) (t!22468 List!16097)) )
))
(declare-datatypes ((ListLongMap!9067 0))(
  ( (ListLongMap!9068 (toList!4549 List!16097)) )
))
(declare-fun call!37025 () ListLongMap!9067)

(declare-fun v!557 () V!25665)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7292 0))(
  ( (ValueCellFull!7292 (v!10204 V!25665)) (EmptyCell!7292) )
))
(declare-datatypes ((array!47208 0))(
  ( (array!47209 (arr!22635 (Array (_ BitVec 32) ValueCell!7292)) (size!23075 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47208)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25665)

(declare-fun zeroValue!654 () V!25665)

(declare-datatypes ((array!47210 0))(
  ( (array!47211 (arr!22636 (Array (_ BitVec 32) (_ BitVec 64))) (size!23076 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47210)

(declare-fun bm!37021 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2539 (array!47210 array!47208 (_ BitVec 32) (_ BitVec 32) V!25665 V!25665 (_ BitVec 32) Int) ListLongMap!9067)

(assert (=> bm!37021 (= call!37025 (getCurrentListMapNoExtraKeys!2539 _keys!868 (array!47209 (store (arr!22635 _values!688) i!612 (ValueCellFull!7292 v!557)) (size!23075 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839453 () Bool)

(declare-fun e!468488 () Bool)

(declare-fun e!468489 () Bool)

(declare-fun mapRes!24794 () Bool)

(assert (=> b!839453 (= e!468488 (and e!468489 mapRes!24794))))

(declare-fun condMapEmpty!24794 () Bool)

(declare-fun mapDefault!24794 () ValueCell!7292)

