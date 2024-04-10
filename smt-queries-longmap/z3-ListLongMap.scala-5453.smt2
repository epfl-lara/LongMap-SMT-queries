; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72504 () Bool)

(assert start!72504)

(declare-fun b_free!13689 () Bool)

(declare-fun b_next!13689 () Bool)

(assert (=> start!72504 (= b_free!13689 (not b_next!13689))))

(declare-fun tp!48165 () Bool)

(declare-fun b_and!22775 () Bool)

(assert (=> start!72504 (= tp!48165 b_and!22775)))

(declare-fun b!841247 () Bool)

(declare-fun res!571861 () Bool)

(declare-fun e!469313 () Bool)

(assert (=> b!841247 (=> (not res!571861) (not e!469313))))

(declare-datatypes ((array!47388 0))(
  ( (array!47389 (arr!22725 (Array (_ BitVec 32) (_ BitVec 64))) (size!23165 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47388)

(declare-datatypes ((List!16165 0))(
  ( (Nil!16162) (Cons!16161 (h!17292 (_ BitVec 64)) (t!22536 List!16165)) )
))
(declare-fun arrayNoDuplicates!0 (array!47388 (_ BitVec 32) List!16165) Bool)

(assert (=> b!841247 (= res!571861 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16162))))

(declare-datatypes ((V!25787 0))(
  ( (V!25788 (val!7825 Int)) )
))
(declare-fun v!557 () V!25787)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!37297 () Bool)

(declare-datatypes ((ValueCell!7338 0))(
  ( (ValueCellFull!7338 (v!10250 V!25787)) (EmptyCell!7338) )
))
(declare-datatypes ((array!47390 0))(
  ( (array!47391 (arr!22726 (Array (_ BitVec 32) ValueCell!7338)) (size!23166 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47390)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25787)

(declare-fun zeroValue!654 () V!25787)

(declare-datatypes ((tuple2!10382 0))(
  ( (tuple2!10383 (_1!5202 (_ BitVec 64)) (_2!5202 V!25787)) )
))
(declare-datatypes ((List!16166 0))(
  ( (Nil!16163) (Cons!16162 (h!17293 tuple2!10382) (t!22537 List!16166)) )
))
(declare-datatypes ((ListLongMap!9151 0))(
  ( (ListLongMap!9152 (toList!4591 List!16166)) )
))
(declare-fun call!37301 () ListLongMap!9151)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2577 (array!47388 array!47390 (_ BitVec 32) (_ BitVec 32) V!25787 V!25787 (_ BitVec 32) Int) ListLongMap!9151)

(assert (=> bm!37297 (= call!37301 (getCurrentListMapNoExtraKeys!2577 _keys!868 (array!47391 (store (arr!22726 _values!688) i!612 (ValueCellFull!7338 v!557)) (size!23166 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841248 () Bool)

(declare-fun res!571858 () Bool)

(assert (=> b!841248 (=> (not res!571858) (not e!469313))))

(assert (=> b!841248 (= res!571858 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23165 _keys!868))))))

(declare-fun b!841249 () Bool)

(declare-fun res!571863 () Bool)

(assert (=> b!841249 (=> (not res!571863) (not e!469313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47388 (_ BitVec 32)) Bool)

(assert (=> b!841249 (= res!571863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841250 () Bool)

(declare-fun e!469315 () Bool)

(declare-fun call!37300 () ListLongMap!9151)

(assert (=> b!841250 (= e!469315 (= call!37301 call!37300))))

(declare-fun mapNonEmpty!24932 () Bool)

(declare-fun mapRes!24932 () Bool)

(declare-fun tp!48166 () Bool)

(declare-fun e!469318 () Bool)

(assert (=> mapNonEmpty!24932 (= mapRes!24932 (and tp!48166 e!469318))))

(declare-fun mapRest!24932 () (Array (_ BitVec 32) ValueCell!7338))

(declare-fun mapKey!24932 () (_ BitVec 32))

(declare-fun mapValue!24932 () ValueCell!7338)

(assert (=> mapNonEmpty!24932 (= (arr!22726 _values!688) (store mapRest!24932 mapKey!24932 mapValue!24932))))

(declare-fun mapIsEmpty!24932 () Bool)

(assert (=> mapIsEmpty!24932 mapRes!24932))

(declare-fun b!841251 () Bool)

(declare-fun res!571860 () Bool)

(assert (=> b!841251 (=> (not res!571860) (not e!469313))))

(assert (=> b!841251 (= res!571860 (and (= (size!23166 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23165 _keys!868) (size!23166 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841252 () Bool)

(declare-fun res!571865 () Bool)

(assert (=> b!841252 (=> (not res!571865) (not e!469313))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841252 (= res!571865 (validKeyInArray!0 k0!854))))

(declare-fun b!841253 () Bool)

(declare-fun tp_is_empty!15555 () Bool)

(assert (=> b!841253 (= e!469318 tp_is_empty!15555)))

(declare-fun bm!37298 () Bool)

(assert (=> bm!37298 (= call!37300 (getCurrentListMapNoExtraKeys!2577 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841254 () Bool)

(assert (=> b!841254 (= e!469313 (not true))))

(assert (=> b!841254 e!469315))

(declare-fun c!91393 () Bool)

(assert (=> b!841254 (= c!91393 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28897 0))(
  ( (Unit!28898) )
))
(declare-fun lt!380899 () Unit!28897)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!294 (array!47388 array!47390 (_ BitVec 32) (_ BitVec 32) V!25787 V!25787 (_ BitVec 32) (_ BitVec 64) V!25787 (_ BitVec 32) Int) Unit!28897)

(assert (=> b!841254 (= lt!380899 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!294 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841255 () Bool)

(declare-fun res!571864 () Bool)

(assert (=> b!841255 (=> (not res!571864) (not e!469313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841255 (= res!571864 (validMask!0 mask!1196))))

(declare-fun b!841256 () Bool)

(declare-fun +!2058 (ListLongMap!9151 tuple2!10382) ListLongMap!9151)

(assert (=> b!841256 (= e!469315 (= call!37301 (+!2058 call!37300 (tuple2!10383 k0!854 v!557))))))

(declare-fun b!841257 () Bool)

(declare-fun e!469316 () Bool)

(declare-fun e!469317 () Bool)

(assert (=> b!841257 (= e!469316 (and e!469317 mapRes!24932))))

(declare-fun condMapEmpty!24932 () Bool)

(declare-fun mapDefault!24932 () ValueCell!7338)

(assert (=> b!841257 (= condMapEmpty!24932 (= (arr!22726 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7338)) mapDefault!24932)))))

(declare-fun b!841258 () Bool)

(assert (=> b!841258 (= e!469317 tp_is_empty!15555)))

(declare-fun res!571862 () Bool)

(assert (=> start!72504 (=> (not res!571862) (not e!469313))))

(assert (=> start!72504 (= res!571862 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23165 _keys!868))))))

(assert (=> start!72504 e!469313))

(assert (=> start!72504 tp_is_empty!15555))

(assert (=> start!72504 true))

(assert (=> start!72504 tp!48165))

(declare-fun array_inv!18084 (array!47388) Bool)

(assert (=> start!72504 (array_inv!18084 _keys!868)))

(declare-fun array_inv!18085 (array!47390) Bool)

(assert (=> start!72504 (and (array_inv!18085 _values!688) e!469316)))

(declare-fun b!841259 () Bool)

(declare-fun res!571859 () Bool)

(assert (=> b!841259 (=> (not res!571859) (not e!469313))))

(assert (=> b!841259 (= res!571859 (and (= (select (arr!22725 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23165 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!72504 res!571862) b!841255))

(assert (= (and b!841255 res!571864) b!841251))

(assert (= (and b!841251 res!571860) b!841249))

(assert (= (and b!841249 res!571863) b!841247))

(assert (= (and b!841247 res!571861) b!841248))

(assert (= (and b!841248 res!571858) b!841252))

(assert (= (and b!841252 res!571865) b!841259))

(assert (= (and b!841259 res!571859) b!841254))

(assert (= (and b!841254 c!91393) b!841256))

(assert (= (and b!841254 (not c!91393)) b!841250))

(assert (= (or b!841256 b!841250) bm!37297))

(assert (= (or b!841256 b!841250) bm!37298))

(assert (= (and b!841257 condMapEmpty!24932) mapIsEmpty!24932))

(assert (= (and b!841257 (not condMapEmpty!24932)) mapNonEmpty!24932))

(get-info :version)

(assert (= (and mapNonEmpty!24932 ((_ is ValueCellFull!7338) mapValue!24932)) b!841253))

(assert (= (and b!841257 ((_ is ValueCellFull!7338) mapDefault!24932)) b!841258))

(assert (= start!72504 b!841257))

(declare-fun m!784751 () Bool)

(assert (=> b!841259 m!784751))

(declare-fun m!784753 () Bool)

(assert (=> b!841255 m!784753))

(declare-fun m!784755 () Bool)

(assert (=> b!841252 m!784755))

(declare-fun m!784757 () Bool)

(assert (=> b!841254 m!784757))

(declare-fun m!784759 () Bool)

(assert (=> b!841247 m!784759))

(declare-fun m!784761 () Bool)

(assert (=> mapNonEmpty!24932 m!784761))

(declare-fun m!784763 () Bool)

(assert (=> b!841256 m!784763))

(declare-fun m!784765 () Bool)

(assert (=> b!841249 m!784765))

(declare-fun m!784767 () Bool)

(assert (=> bm!37298 m!784767))

(declare-fun m!784769 () Bool)

(assert (=> bm!37297 m!784769))

(declare-fun m!784771 () Bool)

(assert (=> bm!37297 m!784771))

(declare-fun m!784773 () Bool)

(assert (=> start!72504 m!784773))

(declare-fun m!784775 () Bool)

(assert (=> start!72504 m!784775))

(check-sat (not mapNonEmpty!24932) (not b!841255) (not b!841249) b_and!22775 (not bm!37298) (not b!841254) (not bm!37297) (not b_next!13689) (not start!72504) (not b!841247) (not b!841252) tp_is_empty!15555 (not b!841256))
(check-sat b_and!22775 (not b_next!13689))
