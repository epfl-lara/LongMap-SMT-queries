; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73568 () Bool)

(assert start!73568)

(declare-fun b_free!14483 () Bool)

(declare-fun b_next!14483 () Bool)

(assert (=> start!73568 (= b_free!14483 (not b_next!14483))))

(declare-fun tp!50953 () Bool)

(declare-fun b_and!23945 () Bool)

(assert (=> start!73568 (= tp!50953 b_and!23945)))

(declare-fun b!860396 () Bool)

(declare-fun e!479435 () Bool)

(declare-fun e!479436 () Bool)

(assert (=> b!860396 (= e!479435 (not e!479436))))

(declare-fun res!584704 () Bool)

(assert (=> b!860396 (=> res!584704 e!479436)))

(declare-datatypes ((array!49414 0))(
  ( (array!49415 (arr!23738 (Array (_ BitVec 32) (_ BitVec 64))) (size!24178 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49414)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860396 (= res!584704 (not (validKeyInArray!0 (select (arr!23738 _keys!868) from!1053))))))

(declare-datatypes ((V!27205 0))(
  ( (V!27206 (val!8357 Int)) )
))
(declare-datatypes ((tuple2!11044 0))(
  ( (tuple2!11045 (_1!5533 (_ BitVec 64)) (_2!5533 V!27205)) )
))
(declare-datatypes ((List!16852 0))(
  ( (Nil!16849) (Cons!16848 (h!17979 tuple2!11044) (t!23601 List!16852)) )
))
(declare-datatypes ((ListLongMap!9813 0))(
  ( (ListLongMap!9814 (toList!4922 List!16852)) )
))
(declare-fun lt!387812 () ListLongMap!9813)

(declare-fun lt!387813 () ListLongMap!9813)

(assert (=> b!860396 (= lt!387812 lt!387813)))

(declare-fun v!557 () V!27205)

(declare-fun lt!387811 () ListLongMap!9813)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2274 (ListLongMap!9813 tuple2!11044) ListLongMap!9813)

(assert (=> b!860396 (= lt!387813 (+!2274 lt!387811 (tuple2!11045 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27205)

(declare-fun zeroValue!654 () V!27205)

(declare-datatypes ((ValueCell!7870 0))(
  ( (ValueCellFull!7870 (v!10782 V!27205)) (EmptyCell!7870) )
))
(declare-datatypes ((array!49416 0))(
  ( (array!49417 (arr!23739 (Array (_ BitVec 32) ValueCell!7870)) (size!24179 (_ BitVec 32))) )
))
(declare-fun lt!387807 () array!49416)

(declare-fun getCurrentListMapNoExtraKeys!2899 (array!49414 array!49416 (_ BitVec 32) (_ BitVec 32) V!27205 V!27205 (_ BitVec 32) Int) ListLongMap!9813)

(assert (=> b!860396 (= lt!387812 (getCurrentListMapNoExtraKeys!2899 _keys!868 lt!387807 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49416)

(assert (=> b!860396 (= lt!387811 (getCurrentListMapNoExtraKeys!2899 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29331 0))(
  ( (Unit!29332) )
))
(declare-fun lt!387814 () Unit!29331)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!487 (array!49414 array!49416 (_ BitVec 32) (_ BitVec 32) V!27205 V!27205 (_ BitVec 32) (_ BitVec 64) V!27205 (_ BitVec 32) Int) Unit!29331)

(assert (=> b!860396 (= lt!387814 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!487 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860397 () Bool)

(declare-fun res!584703 () Bool)

(declare-fun e!479442 () Bool)

(assert (=> b!860397 (=> (not res!584703) (not e!479442))))

(assert (=> b!860397 (= res!584703 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24178 _keys!868))))))

(declare-fun b!860398 () Bool)

(declare-fun res!584706 () Bool)

(assert (=> b!860398 (=> (not res!584706) (not e!479442))))

(assert (=> b!860398 (= res!584706 (and (= (select (arr!23738 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!860399 () Bool)

(declare-fun res!584708 () Bool)

(declare-fun e!479443 () Bool)

(assert (=> b!860399 (=> res!584708 e!479443)))

(declare-datatypes ((List!16853 0))(
  ( (Nil!16850) (Cons!16849 (h!17980 (_ BitVec 64)) (t!23602 List!16853)) )
))
(declare-fun noDuplicate!1315 (List!16853) Bool)

(assert (=> b!860399 (= res!584708 (not (noDuplicate!1315 Nil!16850)))))

(declare-fun mapIsEmpty!26528 () Bool)

(declare-fun mapRes!26528 () Bool)

(assert (=> mapIsEmpty!26528 mapRes!26528))

(declare-fun b!860400 () Bool)

(declare-fun e!479437 () Bool)

(declare-fun tp_is_empty!16619 () Bool)

(assert (=> b!860400 (= e!479437 tp_is_empty!16619)))

(declare-fun b!860401 () Bool)

(declare-fun e!479440 () Bool)

(assert (=> b!860401 (= e!479436 e!479440)))

(declare-fun res!584712 () Bool)

(assert (=> b!860401 (=> res!584712 e!479440)))

(assert (=> b!860401 (= res!584712 (not (= (select (arr!23738 _keys!868) from!1053) k!854)))))

(declare-fun lt!387806 () ListLongMap!9813)

(declare-fun get!12514 (ValueCell!7870 V!27205) V!27205)

(declare-fun dynLambda!1110 (Int (_ BitVec 64)) V!27205)

(assert (=> b!860401 (= lt!387806 (+!2274 lt!387813 (tuple2!11045 (select (arr!23738 _keys!868) from!1053) (get!12514 (select (arr!23739 _values!688) from!1053) (dynLambda!1110 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!26528 () Bool)

(declare-fun tp!50952 () Bool)

(declare-fun e!479441 () Bool)

(assert (=> mapNonEmpty!26528 (= mapRes!26528 (and tp!50952 e!479441))))

(declare-fun mapRest!26528 () (Array (_ BitVec 32) ValueCell!7870))

(declare-fun mapKey!26528 () (_ BitVec 32))

(declare-fun mapValue!26528 () ValueCell!7870)

(assert (=> mapNonEmpty!26528 (= (arr!23739 _values!688) (store mapRest!26528 mapKey!26528 mapValue!26528))))

(declare-fun res!584714 () Bool)

(assert (=> start!73568 (=> (not res!584714) (not e!479442))))

(assert (=> start!73568 (= res!584714 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24178 _keys!868))))))

(assert (=> start!73568 e!479442))

(assert (=> start!73568 tp_is_empty!16619))

(assert (=> start!73568 true))

(assert (=> start!73568 tp!50953))

(declare-fun array_inv!18792 (array!49414) Bool)

(assert (=> start!73568 (array_inv!18792 _keys!868)))

(declare-fun e!479438 () Bool)

(declare-fun array_inv!18793 (array!49416) Bool)

(assert (=> start!73568 (and (array_inv!18793 _values!688) e!479438)))

(declare-fun b!860402 () Bool)

(declare-fun res!584705 () Bool)

(assert (=> b!860402 (=> res!584705 e!479443)))

(declare-fun contains!4234 (List!16853 (_ BitVec 64)) Bool)

(assert (=> b!860402 (= res!584705 (contains!4234 Nil!16850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860403 () Bool)

(assert (=> b!860403 (= e!479440 e!479443)))

(declare-fun res!584710 () Bool)

(assert (=> b!860403 (=> res!584710 e!479443)))

(assert (=> b!860403 (= res!584710 (or (bvsge (size!24178 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24178 _keys!868)) (bvsge from!1053 (size!24178 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860403 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387809 () Unit!29331)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49414 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29331)

(assert (=> b!860403 (= lt!387809 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!49414 (_ BitVec 32) List!16853) Bool)

(assert (=> b!860403 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16850)))

(declare-fun lt!387805 () Unit!29331)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49414 (_ BitVec 32) (_ BitVec 32)) Unit!29331)

(assert (=> b!860403 (= lt!387805 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860404 () Bool)

(declare-fun res!584713 () Bool)

(assert (=> b!860404 (=> (not res!584713) (not e!479442))))

(assert (=> b!860404 (= res!584713 (validKeyInArray!0 k!854))))

(declare-fun b!860405 () Bool)

(declare-fun res!584709 () Bool)

(assert (=> b!860405 (=> (not res!584709) (not e!479442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860405 (= res!584709 (validMask!0 mask!1196))))

(declare-fun b!860406 () Bool)

(declare-fun res!584711 () Bool)

(assert (=> b!860406 (=> (not res!584711) (not e!479442))))

(assert (=> b!860406 (= res!584711 (and (= (size!24179 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24178 _keys!868) (size!24179 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860407 () Bool)

(declare-fun res!584701 () Bool)

(assert (=> b!860407 (=> (not res!584701) (not e!479442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49414 (_ BitVec 32)) Bool)

(assert (=> b!860407 (= res!584701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860408 () Bool)

(assert (=> b!860408 (= e!479443 true)))

(declare-fun lt!387810 () Bool)

(assert (=> b!860408 (= lt!387810 (contains!4234 Nil!16850 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860409 () Bool)

(assert (=> b!860409 (= e!479442 e!479435)))

(declare-fun res!584702 () Bool)

(assert (=> b!860409 (=> (not res!584702) (not e!479435))))

(assert (=> b!860409 (= res!584702 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!860409 (= lt!387806 (getCurrentListMapNoExtraKeys!2899 _keys!868 lt!387807 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!860409 (= lt!387807 (array!49417 (store (arr!23739 _values!688) i!612 (ValueCellFull!7870 v!557)) (size!24179 _values!688)))))

(declare-fun lt!387808 () ListLongMap!9813)

(assert (=> b!860409 (= lt!387808 (getCurrentListMapNoExtraKeys!2899 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860410 () Bool)

(assert (=> b!860410 (= e!479438 (and e!479437 mapRes!26528))))

(declare-fun condMapEmpty!26528 () Bool)

(declare-fun mapDefault!26528 () ValueCell!7870)

