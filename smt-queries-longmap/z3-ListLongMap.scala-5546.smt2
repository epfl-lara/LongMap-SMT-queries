; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73042 () Bool)

(assert start!73042)

(declare-fun b_free!13975 () Bool)

(declare-fun b_next!13975 () Bool)

(assert (=> start!73042 (= b_free!13975 (not b_next!13975))))

(declare-fun tp!49429 () Bool)

(declare-fun b_and!23083 () Bool)

(assert (=> start!73042 (= tp!49429 b_and!23083)))

(declare-fun b!849328 () Bool)

(declare-fun res!577039 () Bool)

(declare-fun e!473814 () Bool)

(assert (=> b!849328 (=> (not res!577039) (not e!473814))))

(declare-datatypes ((array!48421 0))(
  ( (array!48422 (arr!23242 (Array (_ BitVec 32) (_ BitVec 64))) (size!23684 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48421)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48421 (_ BitVec 32)) Bool)

(assert (=> b!849328 (= res!577039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-datatypes ((V!26529 0))(
  ( (V!26530 (val!8103 Int)) )
))
(declare-datatypes ((tuple2!10634 0))(
  ( (tuple2!10635 (_1!5328 (_ BitVec 64)) (_2!5328 V!26529)) )
))
(declare-datatypes ((List!16479 0))(
  ( (Nil!16476) (Cons!16475 (h!17606 tuple2!10634) (t!22891 List!16479)) )
))
(declare-datatypes ((ListLongMap!9393 0))(
  ( (ListLongMap!9394 (toList!4712 List!16479)) )
))
(declare-fun call!37754 () ListLongMap!9393)

(declare-fun v!557 () V!26529)

(declare-fun b!849329 () Bool)

(declare-fun e!473820 () Bool)

(declare-fun call!37755 () ListLongMap!9393)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2139 (ListLongMap!9393 tuple2!10634) ListLongMap!9393)

(assert (=> b!849329 (= e!473820 (= call!37755 (+!2139 call!37754 (tuple2!10635 k0!854 v!557))))))

(declare-fun b!849330 () Bool)

(declare-fun res!577046 () Bool)

(assert (=> b!849330 (=> (not res!577046) (not e!473814))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7616 0))(
  ( (ValueCellFull!7616 (v!10522 V!26529)) (EmptyCell!7616) )
))
(declare-datatypes ((array!48423 0))(
  ( (array!48424 (arr!23243 (Array (_ BitVec 32) ValueCell!7616)) (size!23685 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48423)

(assert (=> b!849330 (= res!577046 (and (= (size!23685 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23684 _keys!868) (size!23685 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849331 () Bool)

(declare-fun e!473817 () Bool)

(declare-fun e!473819 () Bool)

(assert (=> b!849331 (= e!473817 (not e!473819))))

(declare-fun res!577047 () Bool)

(assert (=> b!849331 (=> res!577047 e!473819)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849331 (= res!577047 (not (validKeyInArray!0 (select (arr!23242 _keys!868) from!1053))))))

(assert (=> b!849331 e!473820))

(declare-fun c!91568 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849331 (= c!91568 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28951 0))(
  ( (Unit!28952) )
))
(declare-fun lt!382073 () Unit!28951)

(declare-fun minValue!654 () V!26529)

(declare-fun zeroValue!654 () V!26529)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!350 (array!48421 array!48423 (_ BitVec 32) (_ BitVec 32) V!26529 V!26529 (_ BitVec 32) (_ BitVec 64) V!26529 (_ BitVec 32) Int) Unit!28951)

(assert (=> b!849331 (= lt!382073 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!350 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!577041 () Bool)

(assert (=> start!73042 (=> (not res!577041) (not e!473814))))

(assert (=> start!73042 (= res!577041 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23684 _keys!868))))))

(assert (=> start!73042 e!473814))

(declare-fun tp_is_empty!16111 () Bool)

(assert (=> start!73042 tp_is_empty!16111))

(assert (=> start!73042 true))

(assert (=> start!73042 tp!49429))

(declare-fun array_inv!18530 (array!48421) Bool)

(assert (=> start!73042 (array_inv!18530 _keys!868)))

(declare-fun e!473813 () Bool)

(declare-fun array_inv!18531 (array!48423) Bool)

(assert (=> start!73042 (and (array_inv!18531 _values!688) e!473813)))

(declare-fun mapIsEmpty!25766 () Bool)

(declare-fun mapRes!25766 () Bool)

(assert (=> mapIsEmpty!25766 mapRes!25766))

(declare-fun b!849332 () Bool)

(assert (=> b!849332 (= e!473820 (= call!37755 call!37754))))

(declare-fun b!849333 () Bool)

(assert (=> b!849333 (= e!473819 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23684 _keys!868))))))

(declare-fun lt!382070 () array!48423)

(declare-fun lt!382071 () ListLongMap!9393)

(declare-fun getCurrentListMapNoExtraKeys!2721 (array!48421 array!48423 (_ BitVec 32) (_ BitVec 32) V!26529 V!26529 (_ BitVec 32) Int) ListLongMap!9393)

(declare-fun get!12242 (ValueCell!7616 V!26529) V!26529)

(declare-fun dynLambda!1003 (Int (_ BitVec 64)) V!26529)

(assert (=> b!849333 (= lt!382071 (+!2139 (getCurrentListMapNoExtraKeys!2721 _keys!868 lt!382070 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10635 (select (arr!23242 _keys!868) from!1053) (get!12242 (select (arr!23243 lt!382070) from!1053) (dynLambda!1003 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849334 () Bool)

(declare-fun res!577038 () Bool)

(assert (=> b!849334 (=> (not res!577038) (not e!473814))))

(assert (=> b!849334 (= res!577038 (validKeyInArray!0 k0!854))))

(declare-fun b!849335 () Bool)

(declare-fun e!473818 () Bool)

(assert (=> b!849335 (= e!473818 tp_is_empty!16111)))

(declare-fun mapNonEmpty!25766 () Bool)

(declare-fun tp!49430 () Bool)

(assert (=> mapNonEmpty!25766 (= mapRes!25766 (and tp!49430 e!473818))))

(declare-fun mapRest!25766 () (Array (_ BitVec 32) ValueCell!7616))

(declare-fun mapValue!25766 () ValueCell!7616)

(declare-fun mapKey!25766 () (_ BitVec 32))

(assert (=> mapNonEmpty!25766 (= (arr!23243 _values!688) (store mapRest!25766 mapKey!25766 mapValue!25766))))

(declare-fun b!849336 () Bool)

(declare-fun res!577045 () Bool)

(assert (=> b!849336 (=> (not res!577045) (not e!473814))))

(declare-datatypes ((List!16480 0))(
  ( (Nil!16477) (Cons!16476 (h!17607 (_ BitVec 64)) (t!22892 List!16480)) )
))
(declare-fun arrayNoDuplicates!0 (array!48421 (_ BitVec 32) List!16480) Bool)

(assert (=> b!849336 (= res!577045 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16477))))

(declare-fun b!849337 () Bool)

(assert (=> b!849337 (= e!473814 e!473817)))

(declare-fun res!577042 () Bool)

(assert (=> b!849337 (=> (not res!577042) (not e!473817))))

(assert (=> b!849337 (= res!577042 (= from!1053 i!612))))

(assert (=> b!849337 (= lt!382071 (getCurrentListMapNoExtraKeys!2721 _keys!868 lt!382070 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849337 (= lt!382070 (array!48424 (store (arr!23243 _values!688) i!612 (ValueCellFull!7616 v!557)) (size!23685 _values!688)))))

(declare-fun lt!382072 () ListLongMap!9393)

(assert (=> b!849337 (= lt!382072 (getCurrentListMapNoExtraKeys!2721 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849338 () Bool)

(declare-fun e!473815 () Bool)

(assert (=> b!849338 (= e!473813 (and e!473815 mapRes!25766))))

(declare-fun condMapEmpty!25766 () Bool)

(declare-fun mapDefault!25766 () ValueCell!7616)

(assert (=> b!849338 (= condMapEmpty!25766 (= (arr!23243 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7616)) mapDefault!25766)))))

(declare-fun bm!37751 () Bool)

(assert (=> bm!37751 (= call!37754 (getCurrentListMapNoExtraKeys!2721 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849339 () Bool)

(declare-fun res!577040 () Bool)

(assert (=> b!849339 (=> (not res!577040) (not e!473814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849339 (= res!577040 (validMask!0 mask!1196))))

(declare-fun b!849340 () Bool)

(declare-fun res!577043 () Bool)

(assert (=> b!849340 (=> (not res!577043) (not e!473814))))

(assert (=> b!849340 (= res!577043 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23684 _keys!868))))))

(declare-fun bm!37752 () Bool)

(assert (=> bm!37752 (= call!37755 (getCurrentListMapNoExtraKeys!2721 _keys!868 lt!382070 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849341 () Bool)

(assert (=> b!849341 (= e!473815 tp_is_empty!16111)))

(declare-fun b!849342 () Bool)

(declare-fun res!577044 () Bool)

(assert (=> b!849342 (=> (not res!577044) (not e!473814))))

(assert (=> b!849342 (= res!577044 (and (= (select (arr!23242 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73042 res!577041) b!849339))

(assert (= (and b!849339 res!577040) b!849330))

(assert (= (and b!849330 res!577046) b!849328))

(assert (= (and b!849328 res!577039) b!849336))

(assert (= (and b!849336 res!577045) b!849340))

(assert (= (and b!849340 res!577043) b!849334))

(assert (= (and b!849334 res!577038) b!849342))

(assert (= (and b!849342 res!577044) b!849337))

(assert (= (and b!849337 res!577042) b!849331))

(assert (= (and b!849331 c!91568) b!849329))

(assert (= (and b!849331 (not c!91568)) b!849332))

(assert (= (or b!849329 b!849332) bm!37751))

(assert (= (or b!849329 b!849332) bm!37752))

(assert (= (and b!849331 (not res!577047)) b!849333))

(assert (= (and b!849338 condMapEmpty!25766) mapIsEmpty!25766))

(assert (= (and b!849338 (not condMapEmpty!25766)) mapNonEmpty!25766))

(get-info :version)

(assert (= (and mapNonEmpty!25766 ((_ is ValueCellFull!7616) mapValue!25766)) b!849335))

(assert (= (and b!849338 ((_ is ValueCellFull!7616) mapDefault!25766)) b!849341))

(assert (= start!73042 b!849338))

(declare-fun b_lambda!11489 () Bool)

(assert (=> (not b_lambda!11489) (not b!849333)))

(declare-fun t!22890 () Bool)

(declare-fun tb!4269 () Bool)

(assert (=> (and start!73042 (= defaultEntry!696 defaultEntry!696) t!22890) tb!4269))

(declare-fun result!8157 () Bool)

(assert (=> tb!4269 (= result!8157 tp_is_empty!16111)))

(assert (=> b!849333 t!22890))

(declare-fun b_and!23085 () Bool)

(assert (= b_and!23083 (and (=> t!22890 result!8157) b_and!23085)))

(declare-fun m!789479 () Bool)

(assert (=> b!849328 m!789479))

(declare-fun m!789481 () Bool)

(assert (=> b!849336 m!789481))

(declare-fun m!789483 () Bool)

(assert (=> b!849329 m!789483))

(declare-fun m!789485 () Bool)

(assert (=> b!849334 m!789485))

(declare-fun m!789487 () Bool)

(assert (=> b!849339 m!789487))

(declare-fun m!789489 () Bool)

(assert (=> bm!37752 m!789489))

(declare-fun m!789491 () Bool)

(assert (=> bm!37751 m!789491))

(declare-fun m!789493 () Bool)

(assert (=> b!849331 m!789493))

(assert (=> b!849331 m!789493))

(declare-fun m!789495 () Bool)

(assert (=> b!849331 m!789495))

(declare-fun m!789497 () Bool)

(assert (=> b!849331 m!789497))

(declare-fun m!789499 () Bool)

(assert (=> b!849337 m!789499))

(declare-fun m!789501 () Bool)

(assert (=> b!849337 m!789501))

(declare-fun m!789503 () Bool)

(assert (=> b!849337 m!789503))

(declare-fun m!789505 () Bool)

(assert (=> mapNonEmpty!25766 m!789505))

(declare-fun m!789507 () Bool)

(assert (=> b!849333 m!789507))

(assert (=> b!849333 m!789489))

(assert (=> b!849333 m!789489))

(declare-fun m!789509 () Bool)

(assert (=> b!849333 m!789509))

(assert (=> b!849333 m!789493))

(declare-fun m!789511 () Bool)

(assert (=> b!849333 m!789511))

(assert (=> b!849333 m!789507))

(assert (=> b!849333 m!789511))

(declare-fun m!789513 () Bool)

(assert (=> b!849333 m!789513))

(declare-fun m!789515 () Bool)

(assert (=> b!849342 m!789515))

(declare-fun m!789517 () Bool)

(assert (=> start!73042 m!789517))

(declare-fun m!789519 () Bool)

(assert (=> start!73042 m!789519))

(check-sat (not b!849331) (not b!849333) (not bm!37752) (not b!849336) (not b!849328) (not b_next!13975) b_and!23085 (not b!849334) (not bm!37751) (not mapNonEmpty!25766) (not start!73042) (not b!849329) (not b_lambda!11489) (not b!849337) (not b!849339) tp_is_empty!16111)
(check-sat b_and!23085 (not b_next!13975))
