; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72356 () Bool)

(assert start!72356)

(declare-fun b_free!13541 () Bool)

(declare-fun b_next!13541 () Bool)

(assert (=> start!72356 (= b_free!13541 (not b_next!13541))))

(declare-fun tp!47721 () Bool)

(declare-fun b_and!22627 () Bool)

(assert (=> start!72356 (= tp!47721 b_and!22627)))

(declare-fun b!838361 () Bool)

(declare-fun res!570089 () Bool)

(declare-fun e!467981 () Bool)

(assert (=> b!838361 (=> (not res!570089) (not e!467981))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47104 0))(
  ( (array!47105 (arr!22583 (Array (_ BitVec 32) (_ BitVec 64))) (size!23023 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47104)

(assert (=> b!838361 (= res!570089 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23023 _keys!868))))))

(declare-fun b!838362 () Bool)

(declare-fun res!570084 () Bool)

(assert (=> b!838362 (=> (not res!570084) (not e!467981))))

(declare-datatypes ((List!16056 0))(
  ( (Nil!16053) (Cons!16052 (h!17183 (_ BitVec 64)) (t!22427 List!16056)) )
))
(declare-fun arrayNoDuplicates!0 (array!47104 (_ BitVec 32) List!16056) Bool)

(assert (=> b!838362 (= res!570084 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16053))))

(declare-fun bm!36853 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25589 0))(
  ( (V!25590 (val!7751 Int)) )
))
(declare-datatypes ((tuple2!10252 0))(
  ( (tuple2!10253 (_1!5137 (_ BitVec 64)) (_2!5137 V!25589)) )
))
(declare-datatypes ((List!16057 0))(
  ( (Nil!16054) (Cons!16053 (h!17184 tuple2!10252) (t!22428 List!16057)) )
))
(declare-datatypes ((ListLongMap!9021 0))(
  ( (ListLongMap!9022 (toList!4526 List!16057)) )
))
(declare-fun call!36856 () ListLongMap!9021)

(declare-datatypes ((ValueCell!7264 0))(
  ( (ValueCellFull!7264 (v!10176 V!25589)) (EmptyCell!7264) )
))
(declare-datatypes ((array!47106 0))(
  ( (array!47107 (arr!22584 (Array (_ BitVec 32) ValueCell!7264)) (size!23024 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47106)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25589)

(declare-fun zeroValue!654 () V!25589)

(declare-fun getCurrentListMapNoExtraKeys!2518 (array!47104 array!47106 (_ BitVec 32) (_ BitVec 32) V!25589 V!25589 (_ BitVec 32) Int) ListLongMap!9021)

(assert (=> bm!36853 (= call!36856 (getCurrentListMapNoExtraKeys!2518 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838363 () Bool)

(declare-fun e!467982 () Bool)

(declare-fun tp_is_empty!15407 () Bool)

(assert (=> b!838363 (= e!467982 tp_is_empty!15407)))

(declare-fun b!838364 () Bool)

(assert (=> b!838364 (= e!467981 (not true))))

(declare-fun e!467983 () Bool)

(assert (=> b!838364 e!467983))

(declare-fun c!91171 () Bool)

(assert (=> b!838364 (= c!91171 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25589)

(declare-datatypes ((Unit!28793 0))(
  ( (Unit!28794) )
))
(declare-fun lt!380677 () Unit!28793)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!242 (array!47104 array!47106 (_ BitVec 32) (_ BitVec 32) V!25589 V!25589 (_ BitVec 32) (_ BitVec 64) V!25589 (_ BitVec 32) Int) Unit!28793)

(assert (=> b!838364 (= lt!380677 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!242 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838365 () Bool)

(declare-fun res!570082 () Bool)

(assert (=> b!838365 (=> (not res!570082) (not e!467981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838365 (= res!570082 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24710 () Bool)

(declare-fun mapRes!24710 () Bool)

(declare-fun tp!47722 () Bool)

(assert (=> mapNonEmpty!24710 (= mapRes!24710 (and tp!47722 e!467982))))

(declare-fun mapValue!24710 () ValueCell!7264)

(declare-fun mapRest!24710 () (Array (_ BitVec 32) ValueCell!7264))

(declare-fun mapKey!24710 () (_ BitVec 32))

(assert (=> mapNonEmpty!24710 (= (arr!22584 _values!688) (store mapRest!24710 mapKey!24710 mapValue!24710))))

(declare-fun b!838366 () Bool)

(declare-fun res!570088 () Bool)

(assert (=> b!838366 (=> (not res!570088) (not e!467981))))

(assert (=> b!838366 (= res!570088 (and (= (size!23024 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23023 _keys!868) (size!23024 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!570083 () Bool)

(assert (=> start!72356 (=> (not res!570083) (not e!467981))))

(assert (=> start!72356 (= res!570083 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23023 _keys!868))))))

(assert (=> start!72356 e!467981))

(assert (=> start!72356 tp_is_empty!15407))

(assert (=> start!72356 true))

(assert (=> start!72356 tp!47721))

(declare-fun array_inv!17996 (array!47104) Bool)

(assert (=> start!72356 (array_inv!17996 _keys!868)))

(declare-fun e!467986 () Bool)

(declare-fun array_inv!17997 (array!47106) Bool)

(assert (=> start!72356 (and (array_inv!17997 _values!688) e!467986)))

(declare-fun b!838367 () Bool)

(declare-fun e!467984 () Bool)

(assert (=> b!838367 (= e!467984 tp_is_empty!15407)))

(declare-fun call!36857 () ListLongMap!9021)

(declare-fun bm!36854 () Bool)

(assert (=> bm!36854 (= call!36857 (getCurrentListMapNoExtraKeys!2518 _keys!868 (array!47107 (store (arr!22584 _values!688) i!612 (ValueCellFull!7264 v!557)) (size!23024 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838368 () Bool)

(assert (=> b!838368 (= e!467983 (= call!36857 call!36856))))

(declare-fun b!838369 () Bool)

(assert (=> b!838369 (= e!467986 (and e!467984 mapRes!24710))))

(declare-fun condMapEmpty!24710 () Bool)

(declare-fun mapDefault!24710 () ValueCell!7264)

