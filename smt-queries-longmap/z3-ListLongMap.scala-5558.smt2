; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73114 () Bool)

(assert start!73114)

(declare-fun b_free!14047 () Bool)

(declare-fun b_next!14047 () Bool)

(assert (=> start!73114 (= b_free!14047 (not b_next!14047))))

(declare-fun tp!49645 () Bool)

(declare-fun b_and!23227 () Bool)

(assert (=> start!73114 (= tp!49645 b_and!23227)))

(declare-fun b!851020 () Bool)

(declare-fun e!474679 () Bool)

(declare-fun tp_is_empty!16183 () Bool)

(assert (=> b!851020 (= e!474679 tp_is_empty!16183)))

(declare-fun b!851021 () Bool)

(declare-fun e!474680 () Bool)

(declare-fun mapRes!25874 () Bool)

(assert (=> b!851021 (= e!474680 (and e!474679 mapRes!25874))))

(declare-fun condMapEmpty!25874 () Bool)

(declare-datatypes ((V!26625 0))(
  ( (V!26626 (val!8139 Int)) )
))
(declare-datatypes ((ValueCell!7652 0))(
  ( (ValueCellFull!7652 (v!10558 V!26625)) (EmptyCell!7652) )
))
(declare-datatypes ((array!48555 0))(
  ( (array!48556 (arr!23309 (Array (_ BitVec 32) ValueCell!7652)) (size!23751 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48555)

(declare-fun mapDefault!25874 () ValueCell!7652)

(assert (=> b!851021 (= condMapEmpty!25874 (= (arr!23309 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7652)) mapDefault!25874)))))

(declare-fun b!851022 () Bool)

(declare-fun res!578125 () Bool)

(declare-fun e!474682 () Bool)

(assert (=> b!851022 (=> (not res!578125) (not e!474682))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851022 (= res!578125 (validKeyInArray!0 k0!854))))

(declare-fun b!851023 () Bool)

(declare-fun e!474683 () Bool)

(assert (=> b!851023 (= e!474683 true)))

(declare-datatypes ((tuple2!10692 0))(
  ( (tuple2!10693 (_1!5357 (_ BitVec 64)) (_2!5357 V!26625)) )
))
(declare-fun lt!383117 () tuple2!10692)

(declare-fun lt!383113 () V!26625)

(declare-datatypes ((List!16528 0))(
  ( (Nil!16525) (Cons!16524 (h!17655 tuple2!10692) (t!23012 List!16528)) )
))
(declare-datatypes ((ListLongMap!9451 0))(
  ( (ListLongMap!9452 (toList!4741 List!16528)) )
))
(declare-fun lt!383109 () ListLongMap!9451)

(declare-fun +!2161 (ListLongMap!9451 tuple2!10692) ListLongMap!9451)

(assert (=> b!851023 (= (+!2161 lt!383109 lt!383117) (+!2161 (+!2161 lt!383109 (tuple2!10693 k0!854 lt!383113)) lt!383117))))

(declare-fun lt!383111 () V!26625)

(assert (=> b!851023 (= lt!383117 (tuple2!10693 k0!854 lt!383111))))

(declare-datatypes ((Unit!28995 0))(
  ( (Unit!28996) )
))
(declare-fun lt!383112 () Unit!28995)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!275 (ListLongMap!9451 (_ BitVec 64) V!26625 V!26625) Unit!28995)

(assert (=> b!851023 (= lt!383112 (addSameAsAddTwiceSameKeyDiffValues!275 lt!383109 k0!854 lt!383113 lt!383111))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!383115 () V!26625)

(declare-fun get!12288 (ValueCell!7652 V!26625) V!26625)

(assert (=> b!851023 (= lt!383113 (get!12288 (select (arr!23309 _values!688) from!1053) lt!383115))))

(declare-fun lt!383110 () ListLongMap!9451)

(declare-datatypes ((array!48557 0))(
  ( (array!48558 (arr!23310 (Array (_ BitVec 32) (_ BitVec 64))) (size!23752 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48557)

(assert (=> b!851023 (= lt!383110 (+!2161 lt!383109 (tuple2!10693 (select (arr!23310 _keys!868) from!1053) lt!383111)))))

(declare-fun v!557 () V!26625)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851023 (= lt!383111 (get!12288 (select (store (arr!23309 _values!688) i!612 (ValueCellFull!7652 v!557)) from!1053) lt!383115))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1025 (Int (_ BitVec 64)) V!26625)

(assert (=> b!851023 (= lt!383115 (dynLambda!1025 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26625)

(declare-fun zeroValue!654 () V!26625)

(declare-fun lt!383108 () array!48555)

(declare-fun getCurrentListMapNoExtraKeys!2749 (array!48557 array!48555 (_ BitVec 32) (_ BitVec 32) V!26625 V!26625 (_ BitVec 32) Int) ListLongMap!9451)

(assert (=> b!851023 (= lt!383109 (getCurrentListMapNoExtraKeys!2749 _keys!868 lt!383108 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25874 () Bool)

(declare-fun tp!49646 () Bool)

(declare-fun e!474678 () Bool)

(assert (=> mapNonEmpty!25874 (= mapRes!25874 (and tp!49646 e!474678))))

(declare-fun mapKey!25874 () (_ BitVec 32))

(declare-fun mapValue!25874 () ValueCell!7652)

(declare-fun mapRest!25874 () (Array (_ BitVec 32) ValueCell!7652))

(assert (=> mapNonEmpty!25874 (= (arr!23309 _values!688) (store mapRest!25874 mapKey!25874 mapValue!25874))))

(declare-fun b!851024 () Bool)

(declare-fun res!578119 () Bool)

(assert (=> b!851024 (=> (not res!578119) (not e!474682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851024 (= res!578119 (validMask!0 mask!1196))))

(declare-fun b!851025 () Bool)

(declare-fun e!474684 () Bool)

(declare-fun call!37970 () ListLongMap!9451)

(declare-fun call!37971 () ListLongMap!9451)

(assert (=> b!851025 (= e!474684 (= call!37970 call!37971))))

(declare-fun b!851026 () Bool)

(declare-fun res!578126 () Bool)

(assert (=> b!851026 (=> (not res!578126) (not e!474682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48557 (_ BitVec 32)) Bool)

(assert (=> b!851026 (= res!578126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851027 () Bool)

(declare-fun e!474677 () Bool)

(assert (=> b!851027 (= e!474682 e!474677)))

(declare-fun res!578123 () Bool)

(assert (=> b!851027 (=> (not res!578123) (not e!474677))))

(assert (=> b!851027 (= res!578123 (= from!1053 i!612))))

(assert (=> b!851027 (= lt!383110 (getCurrentListMapNoExtraKeys!2749 _keys!868 lt!383108 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851027 (= lt!383108 (array!48556 (store (arr!23309 _values!688) i!612 (ValueCellFull!7652 v!557)) (size!23751 _values!688)))))

(declare-fun lt!383114 () ListLongMap!9451)

(assert (=> b!851027 (= lt!383114 (getCurrentListMapNoExtraKeys!2749 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!578121 () Bool)

(assert (=> start!73114 (=> (not res!578121) (not e!474682))))

(assert (=> start!73114 (= res!578121 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23752 _keys!868))))))

(assert (=> start!73114 e!474682))

(assert (=> start!73114 tp_is_empty!16183))

(assert (=> start!73114 true))

(assert (=> start!73114 tp!49645))

(declare-fun array_inv!18570 (array!48557) Bool)

(assert (=> start!73114 (array_inv!18570 _keys!868)))

(declare-fun array_inv!18571 (array!48555) Bool)

(assert (=> start!73114 (and (array_inv!18571 _values!688) e!474680)))

(declare-fun bm!37967 () Bool)

(assert (=> bm!37967 (= call!37971 (getCurrentListMapNoExtraKeys!2749 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25874 () Bool)

(assert (=> mapIsEmpty!25874 mapRes!25874))

(declare-fun bm!37968 () Bool)

(assert (=> bm!37968 (= call!37970 (getCurrentListMapNoExtraKeys!2749 _keys!868 lt!383108 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851028 () Bool)

(assert (=> b!851028 (= e!474678 tp_is_empty!16183)))

(declare-fun b!851029 () Bool)

(declare-fun res!578120 () Bool)

(assert (=> b!851029 (=> (not res!578120) (not e!474682))))

(assert (=> b!851029 (= res!578120 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23752 _keys!868))))))

(declare-fun b!851030 () Bool)

(assert (=> b!851030 (= e!474684 (= call!37970 (+!2161 call!37971 (tuple2!10693 k0!854 v!557))))))

(declare-fun b!851031 () Bool)

(declare-fun res!578127 () Bool)

(assert (=> b!851031 (=> (not res!578127) (not e!474682))))

(assert (=> b!851031 (= res!578127 (and (= (select (arr!23310 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851032 () Bool)

(declare-fun res!578124 () Bool)

(assert (=> b!851032 (=> (not res!578124) (not e!474682))))

(assert (=> b!851032 (= res!578124 (and (= (size!23751 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23752 _keys!868) (size!23751 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851033 () Bool)

(declare-fun res!578118 () Bool)

(assert (=> b!851033 (=> (not res!578118) (not e!474682))))

(declare-datatypes ((List!16529 0))(
  ( (Nil!16526) (Cons!16525 (h!17656 (_ BitVec 64)) (t!23013 List!16529)) )
))
(declare-fun arrayNoDuplicates!0 (array!48557 (_ BitVec 32) List!16529) Bool)

(assert (=> b!851033 (= res!578118 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16526))))

(declare-fun b!851034 () Bool)

(assert (=> b!851034 (= e!474677 (not e!474683))))

(declare-fun res!578122 () Bool)

(assert (=> b!851034 (=> res!578122 e!474683)))

(assert (=> b!851034 (= res!578122 (not (validKeyInArray!0 (select (arr!23310 _keys!868) from!1053))))))

(assert (=> b!851034 e!474684))

(declare-fun c!91676 () Bool)

(assert (=> b!851034 (= c!91676 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383116 () Unit!28995)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!369 (array!48557 array!48555 (_ BitVec 32) (_ BitVec 32) V!26625 V!26625 (_ BitVec 32) (_ BitVec 64) V!26625 (_ BitVec 32) Int) Unit!28995)

(assert (=> b!851034 (= lt!383116 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!369 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73114 res!578121) b!851024))

(assert (= (and b!851024 res!578119) b!851032))

(assert (= (and b!851032 res!578124) b!851026))

(assert (= (and b!851026 res!578126) b!851033))

(assert (= (and b!851033 res!578118) b!851029))

(assert (= (and b!851029 res!578120) b!851022))

(assert (= (and b!851022 res!578125) b!851031))

(assert (= (and b!851031 res!578127) b!851027))

(assert (= (and b!851027 res!578123) b!851034))

(assert (= (and b!851034 c!91676) b!851030))

(assert (= (and b!851034 (not c!91676)) b!851025))

(assert (= (or b!851030 b!851025) bm!37967))

(assert (= (or b!851030 b!851025) bm!37968))

(assert (= (and b!851034 (not res!578122)) b!851023))

(assert (= (and b!851021 condMapEmpty!25874) mapIsEmpty!25874))

(assert (= (and b!851021 (not condMapEmpty!25874)) mapNonEmpty!25874))

(get-info :version)

(assert (= (and mapNonEmpty!25874 ((_ is ValueCellFull!7652) mapValue!25874)) b!851028))

(assert (= (and b!851021 ((_ is ValueCellFull!7652) mapDefault!25874)) b!851020))

(assert (= start!73114 b!851021))

(declare-fun b_lambda!11561 () Bool)

(assert (=> (not b_lambda!11561) (not b!851023)))

(declare-fun t!23011 () Bool)

(declare-fun tb!4341 () Bool)

(assert (=> (and start!73114 (= defaultEntry!696 defaultEntry!696) t!23011) tb!4341))

(declare-fun result!8301 () Bool)

(assert (=> tb!4341 (= result!8301 tp_is_empty!16183)))

(assert (=> b!851023 t!23011))

(declare-fun b_and!23229 () Bool)

(assert (= b_and!23227 (and (=> t!23011 result!8301) b_and!23229)))

(declare-fun m!791389 () Bool)

(assert (=> b!851027 m!791389))

(declare-fun m!791391 () Bool)

(assert (=> b!851027 m!791391))

(declare-fun m!791393 () Bool)

(assert (=> b!851027 m!791393))

(declare-fun m!791395 () Bool)

(assert (=> b!851022 m!791395))

(declare-fun m!791397 () Bool)

(assert (=> start!73114 m!791397))

(declare-fun m!791399 () Bool)

(assert (=> start!73114 m!791399))

(declare-fun m!791401 () Bool)

(assert (=> bm!37967 m!791401))

(declare-fun m!791403 () Bool)

(assert (=> b!851033 m!791403))

(declare-fun m!791405 () Bool)

(assert (=> b!851031 m!791405))

(declare-fun m!791407 () Bool)

(assert (=> b!851023 m!791407))

(declare-fun m!791409 () Bool)

(assert (=> b!851023 m!791409))

(declare-fun m!791411 () Bool)

(assert (=> b!851023 m!791411))

(declare-fun m!791413 () Bool)

(assert (=> b!851023 m!791413))

(declare-fun m!791415 () Bool)

(assert (=> b!851023 m!791415))

(declare-fun m!791417 () Bool)

(assert (=> b!851023 m!791417))

(declare-fun m!791419 () Bool)

(assert (=> b!851023 m!791419))

(assert (=> b!851023 m!791413))

(assert (=> b!851023 m!791417))

(assert (=> b!851023 m!791409))

(assert (=> b!851023 m!791391))

(declare-fun m!791421 () Bool)

(assert (=> b!851023 m!791421))

(declare-fun m!791423 () Bool)

(assert (=> b!851023 m!791423))

(declare-fun m!791425 () Bool)

(assert (=> b!851023 m!791425))

(declare-fun m!791427 () Bool)

(assert (=> b!851023 m!791427))

(declare-fun m!791429 () Bool)

(assert (=> b!851023 m!791429))

(declare-fun m!791431 () Bool)

(assert (=> b!851030 m!791431))

(assert (=> b!851034 m!791427))

(assert (=> b!851034 m!791427))

(declare-fun m!791433 () Bool)

(assert (=> b!851034 m!791433))

(declare-fun m!791435 () Bool)

(assert (=> b!851034 m!791435))

(declare-fun m!791437 () Bool)

(assert (=> mapNonEmpty!25874 m!791437))

(declare-fun m!791439 () Bool)

(assert (=> b!851024 m!791439))

(declare-fun m!791441 () Bool)

(assert (=> b!851026 m!791441))

(assert (=> bm!37968 m!791421))

(check-sat (not bm!37967) (not b_next!14047) (not b!851023) (not b!851024) (not b!851027) (not b!851033) (not b_lambda!11561) (not b!851034) b_and!23229 (not b!851022) (not mapNonEmpty!25874) (not b!851026) (not start!73114) tp_is_empty!16183 (not bm!37968) (not b!851030))
(check-sat b_and!23229 (not b_next!14047))
