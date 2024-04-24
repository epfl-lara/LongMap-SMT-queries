; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73444 () Bool)

(assert start!73444)

(declare-fun b_free!14191 () Bool)

(declare-fun b_next!14191 () Bool)

(assert (=> start!73444 (= b_free!14191 (not b_next!14191))))

(declare-fun tp!50077 () Bool)

(declare-fun b_and!23551 () Bool)

(assert (=> start!73444 (= tp!50077 b_and!23551)))

(declare-fun b!855546 () Bool)

(declare-fun res!580736 () Bool)

(declare-fun e!477137 () Bool)

(assert (=> b!855546 (=> (not res!580736) (not e!477137))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48899 0))(
  ( (array!48900 (arr!23476 (Array (_ BitVec 32) (_ BitVec 64))) (size!23917 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48899)

(assert (=> b!855546 (= res!580736 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23917 _keys!868))))))

(declare-fun b!855547 () Bool)

(declare-fun e!477140 () Bool)

(declare-fun tp_is_empty!16327 () Bool)

(assert (=> b!855547 (= e!477140 tp_is_empty!16327)))

(declare-fun b!855548 () Bool)

(declare-fun e!477135 () Bool)

(assert (=> b!855548 (= e!477137 e!477135)))

(declare-fun res!580735 () Bool)

(assert (=> b!855548 (=> (not res!580735) (not e!477135))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855548 (= res!580735 (= from!1053 i!612))))

(declare-datatypes ((V!26817 0))(
  ( (V!26818 (val!8211 Int)) )
))
(declare-datatypes ((ValueCell!7724 0))(
  ( (ValueCellFull!7724 (v!10636 V!26817)) (EmptyCell!7724) )
))
(declare-datatypes ((array!48901 0))(
  ( (array!48902 (arr!23477 (Array (_ BitVec 32) ValueCell!7724)) (size!23918 (_ BitVec 32))) )
))
(declare-fun lt!385869 () array!48901)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10736 0))(
  ( (tuple2!10737 (_1!5379 (_ BitVec 64)) (_2!5379 V!26817)) )
))
(declare-datatypes ((List!16582 0))(
  ( (Nil!16579) (Cons!16578 (h!17715 tuple2!10736) (t!23211 List!16582)) )
))
(declare-datatypes ((ListLongMap!9507 0))(
  ( (ListLongMap!9508 (toList!4769 List!16582)) )
))
(declare-fun lt!385867 () ListLongMap!9507)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26817)

(declare-fun zeroValue!654 () V!26817)

(declare-fun getCurrentListMapNoExtraKeys!2825 (array!48899 array!48901 (_ BitVec 32) (_ BitVec 32) V!26817 V!26817 (_ BitVec 32) Int) ListLongMap!9507)

(assert (=> b!855548 (= lt!385867 (getCurrentListMapNoExtraKeys!2825 _keys!868 lt!385869 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26817)

(declare-fun _values!688 () array!48901)

(assert (=> b!855548 (= lt!385869 (array!48902 (store (arr!23477 _values!688) i!612 (ValueCellFull!7724 v!557)) (size!23918 _values!688)))))

(declare-fun lt!385868 () ListLongMap!9507)

(assert (=> b!855548 (= lt!385868 (getCurrentListMapNoExtraKeys!2825 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855549 () Bool)

(declare-fun e!477136 () Bool)

(declare-fun call!38473 () ListLongMap!9507)

(declare-fun call!38474 () ListLongMap!9507)

(assert (=> b!855549 (= e!477136 (= call!38473 call!38474))))

(declare-fun bm!38470 () Bool)

(assert (=> bm!38470 (= call!38473 (getCurrentListMapNoExtraKeys!2825 _keys!868 lt!385869 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26090 () Bool)

(declare-fun mapRes!26090 () Bool)

(declare-fun tp!50078 () Bool)

(assert (=> mapNonEmpty!26090 (= mapRes!26090 (and tp!50078 e!477140))))

(declare-fun mapRest!26090 () (Array (_ BitVec 32) ValueCell!7724))

(declare-fun mapKey!26090 () (_ BitVec 32))

(declare-fun mapValue!26090 () ValueCell!7724)

(assert (=> mapNonEmpty!26090 (= (arr!23477 _values!688) (store mapRest!26090 mapKey!26090 mapValue!26090))))

(declare-fun b!855550 () Bool)

(declare-fun res!580741 () Bool)

(assert (=> b!855550 (=> (not res!580741) (not e!477137))))

(assert (=> b!855550 (= res!580741 (and (= (size!23918 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23917 _keys!868) (size!23918 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38471 () Bool)

(assert (=> bm!38471 (= call!38474 (getCurrentListMapNoExtraKeys!2825 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855551 () Bool)

(declare-fun e!477138 () Bool)

(assert (=> b!855551 (= e!477138 tp_is_empty!16327)))

(declare-fun b!855552 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2211 (ListLongMap!9507 tuple2!10736) ListLongMap!9507)

(assert (=> b!855552 (= e!477136 (= call!38473 (+!2211 call!38474 (tuple2!10737 k0!854 v!557))))))

(declare-fun res!580740 () Bool)

(assert (=> start!73444 (=> (not res!580740) (not e!477137))))

(assert (=> start!73444 (= res!580740 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23917 _keys!868))))))

(assert (=> start!73444 e!477137))

(assert (=> start!73444 tp_is_empty!16327))

(assert (=> start!73444 true))

(assert (=> start!73444 tp!50077))

(declare-fun array_inv!18656 (array!48899) Bool)

(assert (=> start!73444 (array_inv!18656 _keys!868)))

(declare-fun e!477141 () Bool)

(declare-fun array_inv!18657 (array!48901) Bool)

(assert (=> start!73444 (and (array_inv!18657 _values!688) e!477141)))

(declare-fun b!855553 () Bool)

(declare-fun e!477142 () Bool)

(assert (=> b!855553 (= e!477135 (not e!477142))))

(declare-fun res!580737 () Bool)

(assert (=> b!855553 (=> res!580737 e!477142)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855553 (= res!580737 (not (validKeyInArray!0 (select (arr!23476 _keys!868) from!1053))))))

(assert (=> b!855553 e!477136))

(declare-fun c!92239 () Bool)

(assert (=> b!855553 (= c!92239 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29178 0))(
  ( (Unit!29179) )
))
(declare-fun lt!385872 () Unit!29178)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!410 (array!48899 array!48901 (_ BitVec 32) (_ BitVec 32) V!26817 V!26817 (_ BitVec 32) (_ BitVec 64) V!26817 (_ BitVec 32) Int) Unit!29178)

(assert (=> b!855553 (= lt!385872 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!410 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855554 () Bool)

(declare-fun res!580732 () Bool)

(assert (=> b!855554 (=> (not res!580732) (not e!477137))))

(declare-datatypes ((List!16583 0))(
  ( (Nil!16580) (Cons!16579 (h!17716 (_ BitVec 64)) (t!23212 List!16583)) )
))
(declare-fun arrayNoDuplicates!0 (array!48899 (_ BitVec 32) List!16583) Bool)

(assert (=> b!855554 (= res!580732 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16580))))

(declare-fun b!855555 () Bool)

(declare-fun res!580738 () Bool)

(assert (=> b!855555 (=> (not res!580738) (not e!477137))))

(assert (=> b!855555 (= res!580738 (and (= (select (arr!23476 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26090 () Bool)

(assert (=> mapIsEmpty!26090 mapRes!26090))

(declare-fun b!855556 () Bool)

(assert (=> b!855556 (= e!477142 true)))

(declare-fun lt!385874 () ListLongMap!9507)

(declare-fun lt!385870 () V!26817)

(declare-fun lt!385871 () tuple2!10736)

(assert (=> b!855556 (= (+!2211 lt!385874 lt!385871) (+!2211 (+!2211 lt!385874 (tuple2!10737 k0!854 lt!385870)) lt!385871))))

(declare-fun lt!385873 () V!26817)

(assert (=> b!855556 (= lt!385871 (tuple2!10737 k0!854 lt!385873))))

(declare-fun lt!385865 () Unit!29178)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!333 (ListLongMap!9507 (_ BitVec 64) V!26817 V!26817) Unit!29178)

(assert (=> b!855556 (= lt!385865 (addSameAsAddTwiceSameKeyDiffValues!333 lt!385874 k0!854 lt!385870 lt!385873))))

(declare-fun lt!385866 () V!26817)

(declare-fun get!12394 (ValueCell!7724 V!26817) V!26817)

(assert (=> b!855556 (= lt!385870 (get!12394 (select (arr!23477 _values!688) from!1053) lt!385866))))

(assert (=> b!855556 (= lt!385867 (+!2211 lt!385874 (tuple2!10737 (select (arr!23476 _keys!868) from!1053) lt!385873)))))

(assert (=> b!855556 (= lt!385873 (get!12394 (select (store (arr!23477 _values!688) i!612 (ValueCellFull!7724 v!557)) from!1053) lt!385866))))

(declare-fun dynLambda!1080 (Int (_ BitVec 64)) V!26817)

(assert (=> b!855556 (= lt!385866 (dynLambda!1080 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!855556 (= lt!385874 (getCurrentListMapNoExtraKeys!2825 _keys!868 lt!385869 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855557 () Bool)

(declare-fun res!580733 () Bool)

(assert (=> b!855557 (=> (not res!580733) (not e!477137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48899 (_ BitVec 32)) Bool)

(assert (=> b!855557 (= res!580733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855558 () Bool)

(assert (=> b!855558 (= e!477141 (and e!477138 mapRes!26090))))

(declare-fun condMapEmpty!26090 () Bool)

(declare-fun mapDefault!26090 () ValueCell!7724)

(assert (=> b!855558 (= condMapEmpty!26090 (= (arr!23477 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7724)) mapDefault!26090)))))

(declare-fun b!855559 () Bool)

(declare-fun res!580739 () Bool)

(assert (=> b!855559 (=> (not res!580739) (not e!477137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855559 (= res!580739 (validMask!0 mask!1196))))

(declare-fun b!855560 () Bool)

(declare-fun res!580734 () Bool)

(assert (=> b!855560 (=> (not res!580734) (not e!477137))))

(assert (=> b!855560 (= res!580734 (validKeyInArray!0 k0!854))))

(assert (= (and start!73444 res!580740) b!855559))

(assert (= (and b!855559 res!580739) b!855550))

(assert (= (and b!855550 res!580741) b!855557))

(assert (= (and b!855557 res!580733) b!855554))

(assert (= (and b!855554 res!580732) b!855546))

(assert (= (and b!855546 res!580736) b!855560))

(assert (= (and b!855560 res!580734) b!855555))

(assert (= (and b!855555 res!580738) b!855548))

(assert (= (and b!855548 res!580735) b!855553))

(assert (= (and b!855553 c!92239) b!855552))

(assert (= (and b!855553 (not c!92239)) b!855549))

(assert (= (or b!855552 b!855549) bm!38470))

(assert (= (or b!855552 b!855549) bm!38471))

(assert (= (and b!855553 (not res!580737)) b!855556))

(assert (= (and b!855558 condMapEmpty!26090) mapIsEmpty!26090))

(assert (= (and b!855558 (not condMapEmpty!26090)) mapNonEmpty!26090))

(get-info :version)

(assert (= (and mapNonEmpty!26090 ((_ is ValueCellFull!7724) mapValue!26090)) b!855547))

(assert (= (and b!855558 ((_ is ValueCellFull!7724) mapDefault!26090)) b!855551))

(assert (= start!73444 b!855558))

(declare-fun b_lambda!11737 () Bool)

(assert (=> (not b_lambda!11737) (not b!855556)))

(declare-fun t!23210 () Bool)

(declare-fun tb!4485 () Bool)

(assert (=> (and start!73444 (= defaultEntry!696 defaultEntry!696) t!23210) tb!4485))

(declare-fun result!8589 () Bool)

(assert (=> tb!4485 (= result!8589 tp_is_empty!16327)))

(assert (=> b!855556 t!23210))

(declare-fun b_and!23553 () Bool)

(assert (= b_and!23551 (and (=> t!23210 result!8589) b_and!23553)))

(declare-fun m!797327 () Bool)

(assert (=> b!855554 m!797327))

(declare-fun m!797329 () Bool)

(assert (=> b!855556 m!797329))

(declare-fun m!797331 () Bool)

(assert (=> b!855556 m!797331))

(declare-fun m!797333 () Bool)

(assert (=> b!855556 m!797333))

(declare-fun m!797335 () Bool)

(assert (=> b!855556 m!797335))

(declare-fun m!797337 () Bool)

(assert (=> b!855556 m!797337))

(assert (=> b!855556 m!797329))

(declare-fun m!797339 () Bool)

(assert (=> b!855556 m!797339))

(declare-fun m!797341 () Bool)

(assert (=> b!855556 m!797341))

(assert (=> b!855556 m!797331))

(declare-fun m!797343 () Bool)

(assert (=> b!855556 m!797343))

(declare-fun m!797345 () Bool)

(assert (=> b!855556 m!797345))

(declare-fun m!797347 () Bool)

(assert (=> b!855556 m!797347))

(declare-fun m!797349 () Bool)

(assert (=> b!855556 m!797349))

(assert (=> b!855556 m!797341))

(declare-fun m!797351 () Bool)

(assert (=> b!855556 m!797351))

(declare-fun m!797353 () Bool)

(assert (=> b!855556 m!797353))

(declare-fun m!797355 () Bool)

(assert (=> b!855557 m!797355))

(declare-fun m!797357 () Bool)

(assert (=> b!855559 m!797357))

(assert (=> b!855553 m!797347))

(assert (=> b!855553 m!797347))

(declare-fun m!797359 () Bool)

(assert (=> b!855553 m!797359))

(declare-fun m!797361 () Bool)

(assert (=> b!855553 m!797361))

(declare-fun m!797363 () Bool)

(assert (=> b!855555 m!797363))

(assert (=> bm!38470 m!797345))

(declare-fun m!797365 () Bool)

(assert (=> b!855548 m!797365))

(assert (=> b!855548 m!797353))

(declare-fun m!797367 () Bool)

(assert (=> b!855548 m!797367))

(declare-fun m!797369 () Bool)

(assert (=> bm!38471 m!797369))

(declare-fun m!797371 () Bool)

(assert (=> b!855552 m!797371))

(declare-fun m!797373 () Bool)

(assert (=> b!855560 m!797373))

(declare-fun m!797375 () Bool)

(assert (=> mapNonEmpty!26090 m!797375))

(declare-fun m!797377 () Bool)

(assert (=> start!73444 m!797377))

(declare-fun m!797379 () Bool)

(assert (=> start!73444 m!797379))

(check-sat (not b_lambda!11737) (not mapNonEmpty!26090) (not b!855557) b_and!23553 (not start!73444) (not b!855553) (not b!855560) tp_is_empty!16327 (not bm!38470) (not bm!38471) (not b!855554) (not b!855552) (not b!855548) (not b_next!14191) (not b!855556) (not b!855559))
(check-sat b_and!23553 (not b_next!14191))
