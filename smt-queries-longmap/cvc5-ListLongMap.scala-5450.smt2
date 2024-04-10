; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72484 () Bool)

(assert start!72484)

(declare-fun b_free!13669 () Bool)

(declare-fun b_next!13669 () Bool)

(assert (=> start!72484 (= b_free!13669 (not b_next!13669))))

(declare-fun tp!48106 () Bool)

(declare-fun b_and!22755 () Bool)

(assert (=> start!72484 (= tp!48106 b_and!22755)))

(declare-fun mapNonEmpty!24902 () Bool)

(declare-fun mapRes!24902 () Bool)

(declare-fun tp!48105 () Bool)

(declare-fun e!469135 () Bool)

(assert (=> mapNonEmpty!24902 (= mapRes!24902 (and tp!48105 e!469135))))

(declare-datatypes ((V!25761 0))(
  ( (V!25762 (val!7815 Int)) )
))
(declare-datatypes ((ValueCell!7328 0))(
  ( (ValueCellFull!7328 (v!10240 V!25761)) (EmptyCell!7328) )
))
(declare-fun mapValue!24902 () ValueCell!7328)

(declare-fun mapRest!24902 () (Array (_ BitVec 32) ValueCell!7328))

(declare-fun mapKey!24902 () (_ BitVec 32))

(declare-datatypes ((array!47348 0))(
  ( (array!47349 (arr!22705 (Array (_ BitVec 32) ValueCell!7328)) (size!23145 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47348)

(assert (=> mapNonEmpty!24902 (= (arr!22705 _values!688) (store mapRest!24902 mapKey!24902 mapValue!24902))))

(declare-fun b!840857 () Bool)

(declare-fun e!469138 () Bool)

(declare-fun tp_is_empty!15535 () Bool)

(assert (=> b!840857 (= e!469138 tp_is_empty!15535)))

(declare-fun b!840858 () Bool)

(assert (=> b!840858 (= e!469135 tp_is_empty!15535)))

(declare-fun b!840859 () Bool)

(declare-fun res!571622 () Bool)

(declare-fun e!469136 () Bool)

(assert (=> b!840859 (=> (not res!571622) (not e!469136))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47350 0))(
  ( (array!47351 (arr!22706 (Array (_ BitVec 32) (_ BitVec 64))) (size!23146 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47350)

(assert (=> b!840859 (= res!571622 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23146 _keys!868))))))

(declare-fun bm!37237 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25761)

(declare-fun zeroValue!654 () V!25761)

(declare-datatypes ((tuple2!10362 0))(
  ( (tuple2!10363 (_1!5192 (_ BitVec 64)) (_2!5192 V!25761)) )
))
(declare-datatypes ((List!16149 0))(
  ( (Nil!16146) (Cons!16145 (h!17276 tuple2!10362) (t!22520 List!16149)) )
))
(declare-datatypes ((ListLongMap!9131 0))(
  ( (ListLongMap!9132 (toList!4581 List!16149)) )
))
(declare-fun call!37241 () ListLongMap!9131)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2568 (array!47350 array!47348 (_ BitVec 32) (_ BitVec 32) V!25761 V!25761 (_ BitVec 32) Int) ListLongMap!9131)

(assert (=> bm!37237 (= call!37241 (getCurrentListMapNoExtraKeys!2568 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840860 () Bool)

(declare-fun res!571624 () Bool)

(assert (=> b!840860 (=> (not res!571624) (not e!469136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840860 (= res!571624 (validMask!0 mask!1196))))

(declare-fun e!469134 () Bool)

(declare-fun v!557 () V!25761)

(declare-fun b!840861 () Bool)

(declare-fun call!37240 () ListLongMap!9131)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2050 (ListLongMap!9131 tuple2!10362) ListLongMap!9131)

(assert (=> b!840861 (= e!469134 (= call!37240 (+!2050 call!37241 (tuple2!10363 k!854 v!557))))))

(declare-fun b!840862 () Bool)

(declare-fun e!469137 () Bool)

(assert (=> b!840862 (= e!469137 (and e!469138 mapRes!24902))))

(declare-fun condMapEmpty!24902 () Bool)

(declare-fun mapDefault!24902 () ValueCell!7328)

