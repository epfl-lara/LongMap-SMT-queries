; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72994 () Bool)

(assert start!72994)

(declare-fun b_free!13927 () Bool)

(declare-fun b_next!13927 () Bool)

(assert (=> start!72994 (= b_free!13927 (not b_next!13927))))

(declare-fun tp!49285 () Bool)

(declare-fun b_and!22987 () Bool)

(assert (=> start!72994 (= tp!49285 b_and!22987)))

(declare-fun b!848200 () Bool)

(declare-fun e!473243 () Bool)

(assert (=> b!848200 (= e!473243 true)))

(declare-datatypes ((V!26465 0))(
  ( (V!26466 (val!8079 Int)) )
))
(declare-datatypes ((tuple2!10594 0))(
  ( (tuple2!10595 (_1!5308 (_ BitVec 64)) (_2!5308 V!26465)) )
))
(declare-datatypes ((List!16445 0))(
  ( (Nil!16442) (Cons!16441 (h!17572 tuple2!10594) (t!22809 List!16445)) )
))
(declare-datatypes ((ListLongMap!9353 0))(
  ( (ListLongMap!9354 (toList!4692 List!16445)) )
))
(declare-fun lt!381785 () ListLongMap!9353)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7592 0))(
  ( (ValueCellFull!7592 (v!10498 V!26465)) (EmptyCell!7592) )
))
(declare-datatypes ((array!48333 0))(
  ( (array!48334 (arr!23198 (Array (_ BitVec 32) ValueCell!7592)) (size!23640 (_ BitVec 32))) )
))
(declare-fun lt!381784 () array!48333)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48335 0))(
  ( (array!48336 (arr!23199 (Array (_ BitVec 32) (_ BitVec 64))) (size!23641 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48335)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26465)

(declare-fun zeroValue!654 () V!26465)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun +!2121 (ListLongMap!9353 tuple2!10594) ListLongMap!9353)

(declare-fun getCurrentListMapNoExtraKeys!2703 (array!48335 array!48333 (_ BitVec 32) (_ BitVec 32) V!26465 V!26465 (_ BitVec 32) Int) ListLongMap!9353)

(declare-fun get!12211 (ValueCell!7592 V!26465) V!26465)

(declare-fun dynLambda!988 (Int (_ BitVec 64)) V!26465)

(assert (=> b!848200 (= lt!381785 (+!2121 (getCurrentListMapNoExtraKeys!2703 _keys!868 lt!381784 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10595 (select (arr!23199 _keys!868) from!1053) (get!12211 (select (arr!23198 lt!381784) from!1053) (dynLambda!988 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!473238 () Bool)

(declare-fun v!557 () V!26465)

(declare-fun call!37611 () ListLongMap!9353)

(declare-fun call!37610 () ListLongMap!9353)

(declare-fun b!848201 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!848201 (= e!473238 (= call!37610 (+!2121 call!37611 (tuple2!10595 k0!854 v!557))))))

(declare-fun b!848202 () Bool)

(declare-fun res!576318 () Bool)

(declare-fun e!473242 () Bool)

(assert (=> b!848202 (=> (not res!576318) (not e!473242))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848202 (= res!576318 (and (= (select (arr!23199 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!25694 () Bool)

(declare-fun mapRes!25694 () Bool)

(declare-fun tp!49286 () Bool)

(declare-fun e!473237 () Bool)

(assert (=> mapNonEmpty!25694 (= mapRes!25694 (and tp!49286 e!473237))))

(declare-fun mapRest!25694 () (Array (_ BitVec 32) ValueCell!7592))

(declare-fun mapKey!25694 () (_ BitVec 32))

(declare-fun mapValue!25694 () ValueCell!7592)

(declare-fun _values!688 () array!48333)

(assert (=> mapNonEmpty!25694 (= (arr!23198 _values!688) (store mapRest!25694 mapKey!25694 mapValue!25694))))

(declare-fun b!848203 () Bool)

(declare-fun res!576325 () Bool)

(assert (=> b!848203 (=> (not res!576325) (not e!473242))))

(assert (=> b!848203 (= res!576325 (and (= (size!23640 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23641 _keys!868) (size!23640 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848204 () Bool)

(declare-fun res!576326 () Bool)

(assert (=> b!848204 (=> (not res!576326) (not e!473242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48335 (_ BitVec 32)) Bool)

(assert (=> b!848204 (= res!576326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848205 () Bool)

(declare-fun e!473240 () Bool)

(assert (=> b!848205 (= e!473242 e!473240)))

(declare-fun res!576327 () Bool)

(assert (=> b!848205 (=> (not res!576327) (not e!473240))))

(assert (=> b!848205 (= res!576327 (= from!1053 i!612))))

(assert (=> b!848205 (= lt!381785 (getCurrentListMapNoExtraKeys!2703 _keys!868 lt!381784 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848205 (= lt!381784 (array!48334 (store (arr!23198 _values!688) i!612 (ValueCellFull!7592 v!557)) (size!23640 _values!688)))))

(declare-fun lt!381782 () ListLongMap!9353)

(assert (=> b!848205 (= lt!381782 (getCurrentListMapNoExtraKeys!2703 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848206 () Bool)

(declare-fun res!576322 () Bool)

(assert (=> b!848206 (=> (not res!576322) (not e!473242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848206 (= res!576322 (validMask!0 mask!1196))))

(declare-fun bm!37607 () Bool)

(assert (=> bm!37607 (= call!37611 (getCurrentListMapNoExtraKeys!2703 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848207 () Bool)

(declare-fun e!473241 () Bool)

(declare-fun tp_is_empty!16063 () Bool)

(assert (=> b!848207 (= e!473241 tp_is_empty!16063)))

(declare-fun b!848208 () Bool)

(declare-fun res!576320 () Bool)

(assert (=> b!848208 (=> (not res!576320) (not e!473242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848208 (= res!576320 (validKeyInArray!0 k0!854))))

(declare-fun b!848209 () Bool)

(declare-fun e!473239 () Bool)

(assert (=> b!848209 (= e!473239 (and e!473241 mapRes!25694))))

(declare-fun condMapEmpty!25694 () Bool)

(declare-fun mapDefault!25694 () ValueCell!7592)

(assert (=> b!848209 (= condMapEmpty!25694 (= (arr!23198 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7592)) mapDefault!25694)))))

(declare-fun b!848210 () Bool)

(declare-fun res!576324 () Bool)

(assert (=> b!848210 (=> (not res!576324) (not e!473242))))

(assert (=> b!848210 (= res!576324 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23641 _keys!868))))))

(declare-fun mapIsEmpty!25694 () Bool)

(assert (=> mapIsEmpty!25694 mapRes!25694))

(declare-fun b!848211 () Bool)

(assert (=> b!848211 (= e!473240 (not e!473243))))

(declare-fun res!576319 () Bool)

(assert (=> b!848211 (=> res!576319 e!473243)))

(assert (=> b!848211 (= res!576319 (not (validKeyInArray!0 (select (arr!23199 _keys!868) from!1053))))))

(assert (=> b!848211 e!473238))

(declare-fun c!91496 () Bool)

(assert (=> b!848211 (= c!91496 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28919 0))(
  ( (Unit!28920) )
))
(declare-fun lt!381783 () Unit!28919)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!334 (array!48335 array!48333 (_ BitVec 32) (_ BitVec 32) V!26465 V!26465 (_ BitVec 32) (_ BitVec 64) V!26465 (_ BitVec 32) Int) Unit!28919)

(assert (=> b!848211 (= lt!381783 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!334 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848212 () Bool)

(assert (=> b!848212 (= e!473237 tp_is_empty!16063)))

(declare-fun b!848213 () Bool)

(assert (=> b!848213 (= e!473238 (= call!37610 call!37611))))

(declare-fun b!848214 () Bool)

(declare-fun res!576323 () Bool)

(assert (=> b!848214 (=> (not res!576323) (not e!473242))))

(declare-datatypes ((List!16446 0))(
  ( (Nil!16443) (Cons!16442 (h!17573 (_ BitVec 64)) (t!22810 List!16446)) )
))
(declare-fun arrayNoDuplicates!0 (array!48335 (_ BitVec 32) List!16446) Bool)

(assert (=> b!848214 (= res!576323 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16443))))

(declare-fun res!576321 () Bool)

(assert (=> start!72994 (=> (not res!576321) (not e!473242))))

(assert (=> start!72994 (= res!576321 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23641 _keys!868))))))

(assert (=> start!72994 e!473242))

(assert (=> start!72994 tp_is_empty!16063))

(assert (=> start!72994 true))

(assert (=> start!72994 tp!49285))

(declare-fun array_inv!18498 (array!48335) Bool)

(assert (=> start!72994 (array_inv!18498 _keys!868)))

(declare-fun array_inv!18499 (array!48333) Bool)

(assert (=> start!72994 (and (array_inv!18499 _values!688) e!473239)))

(declare-fun bm!37608 () Bool)

(assert (=> bm!37608 (= call!37610 (getCurrentListMapNoExtraKeys!2703 _keys!868 lt!381784 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72994 res!576321) b!848206))

(assert (= (and b!848206 res!576322) b!848203))

(assert (= (and b!848203 res!576325) b!848204))

(assert (= (and b!848204 res!576326) b!848214))

(assert (= (and b!848214 res!576323) b!848210))

(assert (= (and b!848210 res!576324) b!848208))

(assert (= (and b!848208 res!576320) b!848202))

(assert (= (and b!848202 res!576318) b!848205))

(assert (= (and b!848205 res!576327) b!848211))

(assert (= (and b!848211 c!91496) b!848201))

(assert (= (and b!848211 (not c!91496)) b!848213))

(assert (= (or b!848201 b!848213) bm!37608))

(assert (= (or b!848201 b!848213) bm!37607))

(assert (= (and b!848211 (not res!576319)) b!848200))

(assert (= (and b!848209 condMapEmpty!25694) mapIsEmpty!25694))

(assert (= (and b!848209 (not condMapEmpty!25694)) mapNonEmpty!25694))

(get-info :version)

(assert (= (and mapNonEmpty!25694 ((_ is ValueCellFull!7592) mapValue!25694)) b!848212))

(assert (= (and b!848209 ((_ is ValueCellFull!7592) mapDefault!25694)) b!848207))

(assert (= start!72994 b!848209))

(declare-fun b_lambda!11441 () Bool)

(assert (=> (not b_lambda!11441) (not b!848200)))

(declare-fun t!22808 () Bool)

(declare-fun tb!4221 () Bool)

(assert (=> (and start!72994 (= defaultEntry!696 defaultEntry!696) t!22808) tb!4221))

(declare-fun result!8061 () Bool)

(assert (=> tb!4221 (= result!8061 tp_is_empty!16063)))

(assert (=> b!848200 t!22808))

(declare-fun b_and!22989 () Bool)

(assert (= b_and!22987 (and (=> t!22808 result!8061) b_and!22989)))

(declare-fun m!788471 () Bool)

(assert (=> mapNonEmpty!25694 m!788471))

(declare-fun m!788473 () Bool)

(assert (=> bm!37608 m!788473))

(declare-fun m!788475 () Bool)

(assert (=> bm!37607 m!788475))

(declare-fun m!788477 () Bool)

(assert (=> b!848204 m!788477))

(assert (=> b!848200 m!788473))

(declare-fun m!788479 () Bool)

(assert (=> b!848200 m!788479))

(declare-fun m!788481 () Bool)

(assert (=> b!848200 m!788481))

(declare-fun m!788483 () Bool)

(assert (=> b!848200 m!788483))

(assert (=> b!848200 m!788473))

(declare-fun m!788485 () Bool)

(assert (=> b!848200 m!788485))

(assert (=> b!848200 m!788479))

(declare-fun m!788487 () Bool)

(assert (=> b!848200 m!788487))

(assert (=> b!848200 m!788481))

(declare-fun m!788489 () Bool)

(assert (=> b!848201 m!788489))

(assert (=> b!848211 m!788487))

(assert (=> b!848211 m!788487))

(declare-fun m!788491 () Bool)

(assert (=> b!848211 m!788491))

(declare-fun m!788493 () Bool)

(assert (=> b!848211 m!788493))

(declare-fun m!788495 () Bool)

(assert (=> b!848206 m!788495))

(declare-fun m!788497 () Bool)

(assert (=> b!848208 m!788497))

(declare-fun m!788499 () Bool)

(assert (=> b!848202 m!788499))

(declare-fun m!788501 () Bool)

(assert (=> start!72994 m!788501))

(declare-fun m!788503 () Bool)

(assert (=> start!72994 m!788503))

(declare-fun m!788505 () Bool)

(assert (=> b!848214 m!788505))

(declare-fun m!788507 () Bool)

(assert (=> b!848205 m!788507))

(declare-fun m!788509 () Bool)

(assert (=> b!848205 m!788509))

(declare-fun m!788511 () Bool)

(assert (=> b!848205 m!788511))

(check-sat (not b_next!13927) (not b!848208) (not mapNonEmpty!25694) (not b!848214) tp_is_empty!16063 (not b!848205) (not bm!37608) (not b!848211) (not start!72994) (not b!848200) b_and!22989 (not b!848204) (not b!848201) (not b!848206) (not b_lambda!11441) (not bm!37607))
(check-sat b_and!22989 (not b_next!13927))
