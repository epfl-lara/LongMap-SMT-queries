; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73552 () Bool)

(assert start!73552)

(declare-fun b_free!14299 () Bool)

(declare-fun b_next!14299 () Bool)

(assert (=> start!73552 (= b_free!14299 (not b_next!14299))))

(declare-fun tp!50402 () Bool)

(declare-fun b_and!23665 () Bool)

(assert (=> start!73552 (= tp!50402 b_and!23665)))

(declare-fun b!857409 () Bool)

(declare-fun e!478014 () Bool)

(declare-fun tp_is_empty!16435 () Bool)

(assert (=> b!857409 (= e!478014 tp_is_empty!16435)))

(declare-fun b!857410 () Bool)

(declare-fun res!582095 () Bool)

(declare-fun e!478017 () Bool)

(assert (=> b!857410 (=> (not res!582095) (not e!478017))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857410 (= res!582095 (validMask!0 mask!1196))))

(declare-fun b!857411 () Bool)

(declare-fun res!582093 () Bool)

(assert (=> b!857411 (=> (not res!582093) (not e!478017))))

(declare-datatypes ((array!49109 0))(
  ( (array!49110 (arr!23581 (Array (_ BitVec 32) (_ BitVec 64))) (size!24022 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49109)

(declare-datatypes ((List!16663 0))(
  ( (Nil!16660) (Cons!16659 (h!17796 (_ BitVec 64)) (t!23296 List!16663)) )
))
(declare-fun arrayNoDuplicates!0 (array!49109 (_ BitVec 32) List!16663) Bool)

(assert (=> b!857411 (= res!582093 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16660))))

(declare-fun mapIsEmpty!26252 () Bool)

(declare-fun mapRes!26252 () Bool)

(assert (=> mapIsEmpty!26252 mapRes!26252))

(declare-fun b!857412 () Bool)

(declare-fun res!582094 () Bool)

(assert (=> b!857412 (=> (not res!582094) (not e!478017))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857412 (= res!582094 (and (= (select (arr!23581 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857413 () Bool)

(declare-fun e!478015 () Bool)

(assert (=> b!857413 (= e!478015 tp_is_empty!16435)))

(declare-fun b!857414 () Bool)

(declare-fun res!582089 () Bool)

(assert (=> b!857414 (=> (not res!582089) (not e!478017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49109 (_ BitVec 32)) Bool)

(assert (=> b!857414 (= res!582089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!582096 () Bool)

(assert (=> start!73552 (=> (not res!582096) (not e!478017))))

(assert (=> start!73552 (= res!582096 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24022 _keys!868))))))

(assert (=> start!73552 e!478017))

(assert (=> start!73552 tp_is_empty!16435))

(assert (=> start!73552 true))

(assert (=> start!73552 tp!50402))

(declare-fun array_inv!18734 (array!49109) Bool)

(assert (=> start!73552 (array_inv!18734 _keys!868)))

(declare-datatypes ((V!26961 0))(
  ( (V!26962 (val!8265 Int)) )
))
(declare-datatypes ((ValueCell!7778 0))(
  ( (ValueCellFull!7778 (v!10690 V!26961)) (EmptyCell!7778) )
))
(declare-datatypes ((array!49111 0))(
  ( (array!49112 (arr!23582 (Array (_ BitVec 32) ValueCell!7778)) (size!24023 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49111)

(declare-fun e!478018 () Bool)

(declare-fun array_inv!18735 (array!49111) Bool)

(assert (=> start!73552 (and (array_inv!18735 _values!688) e!478018)))

(declare-fun b!857415 () Bool)

(declare-fun res!582097 () Bool)

(assert (=> b!857415 (=> (not res!582097) (not e!478017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857415 (= res!582097 (validKeyInArray!0 k0!854))))

(declare-fun b!857416 () Bool)

(assert (=> b!857416 (= e!478018 (and e!478014 mapRes!26252))))

(declare-fun condMapEmpty!26252 () Bool)

(declare-fun mapDefault!26252 () ValueCell!7778)

(assert (=> b!857416 (= condMapEmpty!26252 (= (arr!23582 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7778)) mapDefault!26252)))))

(declare-fun b!857417 () Bool)

(declare-fun e!478016 () Bool)

(assert (=> b!857417 (= e!478016 (not true))))

(declare-fun v!557 () V!26961)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386340 () array!49111)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26961)

(declare-fun zeroValue!654 () V!26961)

(declare-datatypes ((tuple2!10818 0))(
  ( (tuple2!10819 (_1!5420 (_ BitVec 64)) (_2!5420 V!26961)) )
))
(declare-datatypes ((List!16664 0))(
  ( (Nil!16661) (Cons!16660 (h!17797 tuple2!10818) (t!23297 List!16664)) )
))
(declare-datatypes ((ListLongMap!9589 0))(
  ( (ListLongMap!9590 (toList!4810 List!16664)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2866 (array!49109 array!49111 (_ BitVec 32) (_ BitVec 32) V!26961 V!26961 (_ BitVec 32) Int) ListLongMap!9589)

(declare-fun +!2223 (ListLongMap!9589 tuple2!10818) ListLongMap!9589)

(assert (=> b!857417 (= (getCurrentListMapNoExtraKeys!2866 _keys!868 lt!386340 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2223 (getCurrentListMapNoExtraKeys!2866 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10819 k0!854 v!557)))))

(declare-datatypes ((Unit!29202 0))(
  ( (Unit!29203) )
))
(declare-fun lt!386339 () Unit!29202)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!421 (array!49109 array!49111 (_ BitVec 32) (_ BitVec 32) V!26961 V!26961 (_ BitVec 32) (_ BitVec 64) V!26961 (_ BitVec 32) Int) Unit!29202)

(assert (=> b!857417 (= lt!386339 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!421 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26252 () Bool)

(declare-fun tp!50401 () Bool)

(assert (=> mapNonEmpty!26252 (= mapRes!26252 (and tp!50401 e!478015))))

(declare-fun mapKey!26252 () (_ BitVec 32))

(declare-fun mapRest!26252 () (Array (_ BitVec 32) ValueCell!7778))

(declare-fun mapValue!26252 () ValueCell!7778)

(assert (=> mapNonEmpty!26252 (= (arr!23582 _values!688) (store mapRest!26252 mapKey!26252 mapValue!26252))))

(declare-fun b!857418 () Bool)

(assert (=> b!857418 (= e!478017 e!478016)))

(declare-fun res!582091 () Bool)

(assert (=> b!857418 (=> (not res!582091) (not e!478016))))

(assert (=> b!857418 (= res!582091 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386342 () ListLongMap!9589)

(assert (=> b!857418 (= lt!386342 (getCurrentListMapNoExtraKeys!2866 _keys!868 lt!386340 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857418 (= lt!386340 (array!49112 (store (arr!23582 _values!688) i!612 (ValueCellFull!7778 v!557)) (size!24023 _values!688)))))

(declare-fun lt!386341 () ListLongMap!9589)

(assert (=> b!857418 (= lt!386341 (getCurrentListMapNoExtraKeys!2866 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857419 () Bool)

(declare-fun res!582092 () Bool)

(assert (=> b!857419 (=> (not res!582092) (not e!478017))))

(assert (=> b!857419 (= res!582092 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24022 _keys!868))))))

(declare-fun b!857420 () Bool)

(declare-fun res!582090 () Bool)

(assert (=> b!857420 (=> (not res!582090) (not e!478017))))

(assert (=> b!857420 (= res!582090 (and (= (size!24023 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24022 _keys!868) (size!24023 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73552 res!582096) b!857410))

(assert (= (and b!857410 res!582095) b!857420))

(assert (= (and b!857420 res!582090) b!857414))

(assert (= (and b!857414 res!582089) b!857411))

(assert (= (and b!857411 res!582093) b!857419))

(assert (= (and b!857419 res!582092) b!857415))

(assert (= (and b!857415 res!582097) b!857412))

(assert (= (and b!857412 res!582094) b!857418))

(assert (= (and b!857418 res!582091) b!857417))

(assert (= (and b!857416 condMapEmpty!26252) mapIsEmpty!26252))

(assert (= (and b!857416 (not condMapEmpty!26252)) mapNonEmpty!26252))

(get-info :version)

(assert (= (and mapNonEmpty!26252 ((_ is ValueCellFull!7778) mapValue!26252)) b!857413))

(assert (= (and b!857416 ((_ is ValueCellFull!7778) mapDefault!26252)) b!857409))

(assert (= start!73552 b!857416))

(declare-fun m!798731 () Bool)

(assert (=> b!857411 m!798731))

(declare-fun m!798733 () Bool)

(assert (=> start!73552 m!798733))

(declare-fun m!798735 () Bool)

(assert (=> start!73552 m!798735))

(declare-fun m!798737 () Bool)

(assert (=> b!857418 m!798737))

(declare-fun m!798739 () Bool)

(assert (=> b!857418 m!798739))

(declare-fun m!798741 () Bool)

(assert (=> b!857418 m!798741))

(declare-fun m!798743 () Bool)

(assert (=> b!857415 m!798743))

(declare-fun m!798745 () Bool)

(assert (=> b!857412 m!798745))

(declare-fun m!798747 () Bool)

(assert (=> b!857410 m!798747))

(declare-fun m!798749 () Bool)

(assert (=> mapNonEmpty!26252 m!798749))

(declare-fun m!798751 () Bool)

(assert (=> b!857414 m!798751))

(declare-fun m!798753 () Bool)

(assert (=> b!857417 m!798753))

(declare-fun m!798755 () Bool)

(assert (=> b!857417 m!798755))

(assert (=> b!857417 m!798755))

(declare-fun m!798757 () Bool)

(assert (=> b!857417 m!798757))

(declare-fun m!798759 () Bool)

(assert (=> b!857417 m!798759))

(check-sat b_and!23665 (not start!73552) (not b_next!14299) (not b!857411) (not mapNonEmpty!26252) (not b!857417) (not b!857418) (not b!857414) (not b!857410) (not b!857415) tp_is_empty!16435)
(check-sat b_and!23665 (not b_next!14299))
