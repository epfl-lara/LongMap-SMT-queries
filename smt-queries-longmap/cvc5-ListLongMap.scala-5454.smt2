; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72508 () Bool)

(assert start!72508)

(declare-fun b_free!13693 () Bool)

(declare-fun b_next!13693 () Bool)

(assert (=> start!72508 (= b_free!13693 (not b_next!13693))))

(declare-fun tp!48177 () Bool)

(declare-fun b_and!22779 () Bool)

(assert (=> start!72508 (= tp!48177 b_and!22779)))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47396 0))(
  ( (array!47397 (arr!22729 (Array (_ BitVec 32) (_ BitVec 64))) (size!23169 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47396)

(declare-fun bm!37309 () Bool)

(declare-datatypes ((V!25793 0))(
  ( (V!25794 (val!7827 Int)) )
))
(declare-datatypes ((ValueCell!7340 0))(
  ( (ValueCellFull!7340 (v!10252 V!25793)) (EmptyCell!7340) )
))
(declare-datatypes ((array!47398 0))(
  ( (array!47399 (arr!22730 (Array (_ BitVec 32) ValueCell!7340)) (size!23170 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47398)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25793)

(declare-fun zeroValue!654 () V!25793)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10386 0))(
  ( (tuple2!10387 (_1!5204 (_ BitVec 64)) (_2!5204 V!25793)) )
))
(declare-datatypes ((List!16168 0))(
  ( (Nil!16165) (Cons!16164 (h!17295 tuple2!10386) (t!22539 List!16168)) )
))
(declare-datatypes ((ListLongMap!9155 0))(
  ( (ListLongMap!9156 (toList!4593 List!16168)) )
))
(declare-fun call!37313 () ListLongMap!9155)

(declare-fun getCurrentListMapNoExtraKeys!2579 (array!47396 array!47398 (_ BitVec 32) (_ BitVec 32) V!25793 V!25793 (_ BitVec 32) Int) ListLongMap!9155)

(assert (=> bm!37309 (= call!37313 (getCurrentListMapNoExtraKeys!2579 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841325 () Bool)

(declare-fun res!571908 () Bool)

(declare-fun e!469354 () Bool)

(assert (=> b!841325 (=> (not res!571908) (not e!469354))))

(declare-datatypes ((List!16169 0))(
  ( (Nil!16166) (Cons!16165 (h!17296 (_ BitVec 64)) (t!22540 List!16169)) )
))
(declare-fun arrayNoDuplicates!0 (array!47396 (_ BitVec 32) List!16169) Bool)

(assert (=> b!841325 (= res!571908 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16166))))

(declare-fun b!841326 () Bool)

(declare-fun e!469353 () Bool)

(declare-fun call!37312 () ListLongMap!9155)

(assert (=> b!841326 (= e!469353 (= call!37312 call!37313))))

(declare-fun res!571909 () Bool)

(assert (=> start!72508 (=> (not res!571909) (not e!469354))))

(assert (=> start!72508 (= res!571909 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23169 _keys!868))))))

(assert (=> start!72508 e!469354))

(declare-fun tp_is_empty!15559 () Bool)

(assert (=> start!72508 tp_is_empty!15559))

(assert (=> start!72508 true))

(assert (=> start!72508 tp!48177))

(declare-fun array_inv!18086 (array!47396) Bool)

(assert (=> start!72508 (array_inv!18086 _keys!868)))

(declare-fun e!469349 () Bool)

(declare-fun array_inv!18087 (array!47398) Bool)

(assert (=> start!72508 (and (array_inv!18087 _values!688) e!469349)))

(declare-fun b!841327 () Bool)

(declare-fun res!571912 () Bool)

(assert (=> b!841327 (=> (not res!571912) (not e!469354))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841327 (= res!571912 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23169 _keys!868))))))

(declare-fun v!557 () V!25793)

(declare-fun bm!37310 () Bool)

(assert (=> bm!37310 (= call!37312 (getCurrentListMapNoExtraKeys!2579 _keys!868 (array!47399 (store (arr!22730 _values!688) i!612 (ValueCellFull!7340 v!557)) (size!23170 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841328 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2060 (ListLongMap!9155 tuple2!10386) ListLongMap!9155)

(assert (=> b!841328 (= e!469353 (= call!37312 (+!2060 call!37313 (tuple2!10387 k!854 v!557))))))

(declare-fun b!841329 () Bool)

(declare-fun res!571913 () Bool)

(assert (=> b!841329 (=> (not res!571913) (not e!469354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841329 (= res!571913 (validKeyInArray!0 k!854))))

(declare-fun b!841330 () Bool)

(declare-fun res!571910 () Bool)

(assert (=> b!841330 (=> (not res!571910) (not e!469354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47396 (_ BitVec 32)) Bool)

(assert (=> b!841330 (= res!571910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841331 () Bool)

(declare-fun e!469351 () Bool)

(assert (=> b!841331 (= e!469351 tp_is_empty!15559)))

(declare-fun b!841332 () Bool)

(declare-fun res!571911 () Bool)

(assert (=> b!841332 (=> (not res!571911) (not e!469354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841332 (= res!571911 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24938 () Bool)

(declare-fun mapRes!24938 () Bool)

(declare-fun tp!48178 () Bool)

(assert (=> mapNonEmpty!24938 (= mapRes!24938 (and tp!48178 e!469351))))

(declare-fun mapValue!24938 () ValueCell!7340)

(declare-fun mapRest!24938 () (Array (_ BitVec 32) ValueCell!7340))

(declare-fun mapKey!24938 () (_ BitVec 32))

(assert (=> mapNonEmpty!24938 (= (arr!22730 _values!688) (store mapRest!24938 mapKey!24938 mapValue!24938))))

(declare-fun b!841333 () Bool)

(declare-fun res!571906 () Bool)

(assert (=> b!841333 (=> (not res!571906) (not e!469354))))

(assert (=> b!841333 (= res!571906 (and (= (size!23170 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23169 _keys!868) (size!23170 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24938 () Bool)

(assert (=> mapIsEmpty!24938 mapRes!24938))

(declare-fun b!841334 () Bool)

(declare-fun e!469352 () Bool)

(assert (=> b!841334 (= e!469349 (and e!469352 mapRes!24938))))

(declare-fun condMapEmpty!24938 () Bool)

(declare-fun mapDefault!24938 () ValueCell!7340)

