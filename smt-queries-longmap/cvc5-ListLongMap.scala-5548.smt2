; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73072 () Bool)

(assert start!73072)

(declare-fun b_free!13987 () Bool)

(declare-fun b_next!13987 () Bool)

(assert (=> start!73072 (= b_free!13987 (not b_next!13987))))

(declare-fun tp!49465 () Bool)

(declare-fun b_and!23133 () Bool)

(assert (=> start!73072 (= tp!49465 b_and!23133)))

(declare-fun b!849849 () Bool)

(declare-fun res!577330 () Bool)

(declare-fun e!474106 () Bool)

(assert (=> b!849849 (=> (not res!577330) (not e!474106))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48452 0))(
  ( (array!48453 (arr!23257 (Array (_ BitVec 32) (_ BitVec 64))) (size!23697 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48452)

(declare-datatypes ((V!26545 0))(
  ( (V!26546 (val!8109 Int)) )
))
(declare-datatypes ((ValueCell!7622 0))(
  ( (ValueCellFull!7622 (v!10534 V!26545)) (EmptyCell!7622) )
))
(declare-datatypes ((array!48454 0))(
  ( (array!48455 (arr!23258 (Array (_ BitVec 32) ValueCell!7622)) (size!23698 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48454)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!849849 (= res!577330 (and (= (size!23698 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23697 _keys!868) (size!23698 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849850 () Bool)

(declare-fun e!474112 () Bool)

(declare-fun tp_is_empty!16123 () Bool)

(assert (=> b!849850 (= e!474112 tp_is_empty!16123)))

(declare-fun b!849851 () Bool)

(declare-fun res!577336 () Bool)

(assert (=> b!849851 (=> (not res!577336) (not e!474106))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849851 (= res!577336 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!25784 () Bool)

(declare-fun mapRes!25784 () Bool)

(declare-fun tp!49464 () Bool)

(assert (=> mapNonEmpty!25784 (= mapRes!25784 (and tp!49464 e!474112))))

(declare-fun mapKey!25784 () (_ BitVec 32))

(declare-fun mapRest!25784 () (Array (_ BitVec 32) ValueCell!7622))

(declare-fun mapValue!25784 () ValueCell!7622)

(assert (=> mapNonEmpty!25784 (= (arr!23258 _values!688) (store mapRest!25784 mapKey!25784 mapValue!25784))))

(declare-fun b!849852 () Bool)

(declare-fun e!474108 () Bool)

(assert (=> b!849852 (= e!474108 tp_is_empty!16123)))

(declare-fun b!849853 () Bool)

(declare-fun res!577334 () Bool)

(assert (=> b!849853 (=> (not res!577334) (not e!474106))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!849853 (= res!577334 (and (= (select (arr!23257 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!577337 () Bool)

(assert (=> start!73072 (=> (not res!577337) (not e!474106))))

(assert (=> start!73072 (= res!577337 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23697 _keys!868))))))

(assert (=> start!73072 e!474106))

(assert (=> start!73072 tp_is_empty!16123))

(assert (=> start!73072 true))

(assert (=> start!73072 tp!49465))

(declare-fun array_inv!18456 (array!48452) Bool)

(assert (=> start!73072 (array_inv!18456 _keys!868)))

(declare-fun e!474107 () Bool)

(declare-fun array_inv!18457 (array!48454) Bool)

(assert (=> start!73072 (and (array_inv!18457 _values!688) e!474107)))

(declare-fun e!474109 () Bool)

(declare-datatypes ((tuple2!10622 0))(
  ( (tuple2!10623 (_1!5322 (_ BitVec 64)) (_2!5322 V!26545)) )
))
(declare-datatypes ((List!16469 0))(
  ( (Nil!16466) (Cons!16465 (h!17596 tuple2!10622) (t!22902 List!16469)) )
))
(declare-datatypes ((ListLongMap!9391 0))(
  ( (ListLongMap!9392 (toList!4711 List!16469)) )
))
(declare-fun call!37817 () ListLongMap!9391)

(declare-fun v!557 () V!26545)

(declare-fun b!849854 () Bool)

(declare-fun call!37816 () ListLongMap!9391)

(declare-fun +!2114 (ListLongMap!9391 tuple2!10622) ListLongMap!9391)

(assert (=> b!849854 (= e!474109 (= call!37816 (+!2114 call!37817 (tuple2!10623 k!854 v!557))))))

(declare-fun b!849855 () Bool)

(declare-fun e!474110 () Bool)

(assert (=> b!849855 (= e!474110 true)))

(declare-fun lt!382450 () V!26545)

(declare-fun lt!382452 () tuple2!10622)

(declare-fun lt!382453 () ListLongMap!9391)

(assert (=> b!849855 (= (+!2114 lt!382453 lt!382452) (+!2114 (+!2114 lt!382453 (tuple2!10623 k!854 lt!382450)) lt!382452))))

(declare-fun lt!382449 () V!26545)

(assert (=> b!849855 (= lt!382452 (tuple2!10623 k!854 lt!382449))))

(declare-datatypes ((Unit!29017 0))(
  ( (Unit!29018) )
))
(declare-fun lt!382451 () Unit!29017)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!251 (ListLongMap!9391 (_ BitVec 64) V!26545 V!26545) Unit!29017)

(assert (=> b!849855 (= lt!382451 (addSameAsAddTwiceSameKeyDiffValues!251 lt!382453 k!854 lt!382450 lt!382449))))

(declare-fun lt!382444 () V!26545)

(declare-fun get!12245 (ValueCell!7622 V!26545) V!26545)

(assert (=> b!849855 (= lt!382450 (get!12245 (select (arr!23258 _values!688) from!1053) lt!382444))))

(declare-fun lt!382447 () ListLongMap!9391)

(assert (=> b!849855 (= lt!382447 (+!2114 lt!382453 (tuple2!10623 (select (arr!23257 _keys!868) from!1053) lt!382449)))))

(assert (=> b!849855 (= lt!382449 (get!12245 (select (store (arr!23258 _values!688) i!612 (ValueCellFull!7622 v!557)) from!1053) lt!382444))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1005 (Int (_ BitVec 64)) V!26545)

(assert (=> b!849855 (= lt!382444 (dynLambda!1005 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!382448 () array!48454)

(declare-fun minValue!654 () V!26545)

(declare-fun zeroValue!654 () V!26545)

(declare-fun getCurrentListMapNoExtraKeys!2693 (array!48452 array!48454 (_ BitVec 32) (_ BitVec 32) V!26545 V!26545 (_ BitVec 32) Int) ListLongMap!9391)

(assert (=> b!849855 (= lt!382453 (getCurrentListMapNoExtraKeys!2693 _keys!868 lt!382448 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37813 () Bool)

(assert (=> bm!37813 (= call!37817 (getCurrentListMapNoExtraKeys!2693 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849856 () Bool)

(declare-fun e!474111 () Bool)

(assert (=> b!849856 (= e!474106 e!474111)))

(declare-fun res!577335 () Bool)

(assert (=> b!849856 (=> (not res!577335) (not e!474111))))

(assert (=> b!849856 (= res!577335 (= from!1053 i!612))))

(assert (=> b!849856 (= lt!382447 (getCurrentListMapNoExtraKeys!2693 _keys!868 lt!382448 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849856 (= lt!382448 (array!48455 (store (arr!23258 _values!688) i!612 (ValueCellFull!7622 v!557)) (size!23698 _values!688)))))

(declare-fun lt!382446 () ListLongMap!9391)

(assert (=> b!849856 (= lt!382446 (getCurrentListMapNoExtraKeys!2693 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849857 () Bool)

(declare-fun res!577328 () Bool)

(assert (=> b!849857 (=> (not res!577328) (not e!474106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849857 (= res!577328 (validMask!0 mask!1196))))

(declare-fun b!849858 () Bool)

(assert (=> b!849858 (= e!474107 (and e!474108 mapRes!25784))))

(declare-fun condMapEmpty!25784 () Bool)

(declare-fun mapDefault!25784 () ValueCell!7622)

