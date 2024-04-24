; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73138 () Bool)

(assert start!73138)

(declare-fun b_free!13885 () Bool)

(declare-fun b_next!13885 () Bool)

(assert (=> start!73138 (= b_free!13885 (not b_next!13885))))

(declare-fun tp!49159 () Bool)

(declare-fun b_and!22981 () Bool)

(assert (=> start!73138 (= tp!49159 b_and!22981)))

(declare-fun b!848449 () Bool)

(declare-fun res!576196 () Bool)

(declare-fun e!473518 () Bool)

(assert (=> b!848449 (=> (not res!576196) (not e!473518))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48305 0))(
  ( (array!48306 (arr!23179 (Array (_ BitVec 32) (_ BitVec 64))) (size!23620 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48305)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!848449 (= res!576196 (and (= (select (arr!23179 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25631 () Bool)

(declare-fun mapRes!25631 () Bool)

(assert (=> mapIsEmpty!25631 mapRes!25631))

(declare-fun b!848450 () Bool)

(declare-fun res!576194 () Bool)

(assert (=> b!848450 (=> (not res!576194) (not e!473518))))

(declare-datatypes ((List!16325 0))(
  ( (Nil!16322) (Cons!16321 (h!17458 (_ BitVec 64)) (t!22688 List!16325)) )
))
(declare-fun arrayNoDuplicates!0 (array!48305 (_ BitVec 32) List!16325) Bool)

(assert (=> b!848450 (= res!576194 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16322))))

(declare-fun b!848451 () Bool)

(declare-fun res!576199 () Bool)

(assert (=> b!848451 (=> (not res!576199) (not e!473518))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26409 0))(
  ( (V!26410 (val!8058 Int)) )
))
(declare-datatypes ((ValueCell!7571 0))(
  ( (ValueCellFull!7571 (v!10483 V!26409)) (EmptyCell!7571) )
))
(declare-datatypes ((array!48307 0))(
  ( (array!48308 (arr!23180 (Array (_ BitVec 32) ValueCell!7571)) (size!23621 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48307)

(assert (=> b!848451 (= res!576199 (and (= (size!23621 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23620 _keys!868) (size!23621 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848452 () Bool)

(declare-fun e!473515 () Bool)

(declare-datatypes ((tuple2!10454 0))(
  ( (tuple2!10455 (_1!5238 (_ BitVec 64)) (_2!5238 V!26409)) )
))
(declare-datatypes ((List!16326 0))(
  ( (Nil!16323) (Cons!16322 (h!17459 tuple2!10454) (t!22689 List!16326)) )
))
(declare-datatypes ((ListLongMap!9225 0))(
  ( (ListLongMap!9226 (toList!4628 List!16326)) )
))
(declare-fun call!37556 () ListLongMap!9225)

(declare-fun call!37555 () ListLongMap!9225)

(assert (=> b!848452 (= e!473515 (= call!37556 call!37555))))

(declare-fun v!557 () V!26409)

(declare-fun b!848453 () Bool)

(declare-fun +!2089 (ListLongMap!9225 tuple2!10454) ListLongMap!9225)

(assert (=> b!848453 (= e!473515 (= call!37556 (+!2089 call!37555 (tuple2!10455 k0!854 v!557))))))

(declare-fun mapNonEmpty!25631 () Bool)

(declare-fun tp!49160 () Bool)

(declare-fun e!473521 () Bool)

(assert (=> mapNonEmpty!25631 (= mapRes!25631 (and tp!49160 e!473521))))

(declare-fun mapRest!25631 () (Array (_ BitVec 32) ValueCell!7571))

(declare-fun mapKey!25631 () (_ BitVec 32))

(declare-fun mapValue!25631 () ValueCell!7571)

(assert (=> mapNonEmpty!25631 (= (arr!23180 _values!688) (store mapRest!25631 mapKey!25631 mapValue!25631))))

(declare-fun b!848454 () Bool)

(declare-fun e!473517 () Bool)

(declare-fun e!473520 () Bool)

(assert (=> b!848454 (= e!473517 (and e!473520 mapRes!25631))))

(declare-fun condMapEmpty!25631 () Bool)

(declare-fun mapDefault!25631 () ValueCell!7571)

(assert (=> b!848454 (= condMapEmpty!25631 (= (arr!23180 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7571)) mapDefault!25631)))))

(declare-fun b!848455 () Bool)

(declare-fun res!576198 () Bool)

(assert (=> b!848455 (=> (not res!576198) (not e!473518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848455 (= res!576198 (validMask!0 mask!1196))))

(declare-fun b!848456 () Bool)

(declare-fun tp_is_empty!16021 () Bool)

(assert (=> b!848456 (= e!473521 tp_is_empty!16021)))

(declare-fun b!848457 () Bool)

(declare-fun res!576201 () Bool)

(assert (=> b!848457 (=> (not res!576201) (not e!473518))))

(assert (=> b!848457 (= res!576201 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23620 _keys!868))))))

(declare-fun b!848458 () Bool)

(declare-fun res!576197 () Bool)

(assert (=> b!848458 (=> (not res!576197) (not e!473518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848458 (= res!576197 (validKeyInArray!0 k0!854))))

(declare-fun res!576200 () Bool)

(assert (=> start!73138 (=> (not res!576200) (not e!473518))))

(assert (=> start!73138 (= res!576200 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23620 _keys!868))))))

(assert (=> start!73138 e!473518))

(assert (=> start!73138 tp_is_empty!16021))

(assert (=> start!73138 true))

(assert (=> start!73138 tp!49159))

(declare-fun array_inv!18458 (array!48305) Bool)

(assert (=> start!73138 (array_inv!18458 _keys!868)))

(declare-fun array_inv!18459 (array!48307) Bool)

(assert (=> start!73138 (and (array_inv!18459 _values!688) e!473517)))

(declare-fun b!848459 () Bool)

(declare-fun e!473519 () Bool)

(assert (=> b!848459 (= e!473519 (not true))))

(assert (=> b!848459 e!473515))

(declare-fun c!91780 () Bool)

(assert (=> b!848459 (= c!91780 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26409)

(declare-fun zeroValue!654 () V!26409)

(declare-datatypes ((Unit!28958 0))(
  ( (Unit!28959) )
))
(declare-fun lt!382129 () Unit!28958)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!315 (array!48305 array!48307 (_ BitVec 32) (_ BitVec 32) V!26409 V!26409 (_ BitVec 32) (_ BitVec 64) V!26409 (_ BitVec 32) Int) Unit!28958)

(assert (=> b!848459 (= lt!382129 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!315 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848460 () Bool)

(assert (=> b!848460 (= e!473518 e!473519)))

(declare-fun res!576195 () Bool)

(assert (=> b!848460 (=> (not res!576195) (not e!473519))))

(assert (=> b!848460 (= res!576195 (= from!1053 i!612))))

(declare-fun lt!382128 () array!48307)

(declare-fun lt!382130 () ListLongMap!9225)

(declare-fun getCurrentListMapNoExtraKeys!2686 (array!48305 array!48307 (_ BitVec 32) (_ BitVec 32) V!26409 V!26409 (_ BitVec 32) Int) ListLongMap!9225)

(assert (=> b!848460 (= lt!382130 (getCurrentListMapNoExtraKeys!2686 _keys!868 lt!382128 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848460 (= lt!382128 (array!48308 (store (arr!23180 _values!688) i!612 (ValueCellFull!7571 v!557)) (size!23621 _values!688)))))

(declare-fun lt!382127 () ListLongMap!9225)

(assert (=> b!848460 (= lt!382127 (getCurrentListMapNoExtraKeys!2686 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848461 () Bool)

(assert (=> b!848461 (= e!473520 tp_is_empty!16021)))

(declare-fun bm!37552 () Bool)

(assert (=> bm!37552 (= call!37555 (getCurrentListMapNoExtraKeys!2686 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37553 () Bool)

(assert (=> bm!37553 (= call!37556 (getCurrentListMapNoExtraKeys!2686 _keys!868 lt!382128 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848462 () Bool)

(declare-fun res!576202 () Bool)

(assert (=> b!848462 (=> (not res!576202) (not e!473518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48305 (_ BitVec 32)) Bool)

(assert (=> b!848462 (= res!576202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73138 res!576200) b!848455))

(assert (= (and b!848455 res!576198) b!848451))

(assert (= (and b!848451 res!576199) b!848462))

(assert (= (and b!848462 res!576202) b!848450))

(assert (= (and b!848450 res!576194) b!848457))

(assert (= (and b!848457 res!576201) b!848458))

(assert (= (and b!848458 res!576197) b!848449))

(assert (= (and b!848449 res!576196) b!848460))

(assert (= (and b!848460 res!576195) b!848459))

(assert (= (and b!848459 c!91780) b!848453))

(assert (= (and b!848459 (not c!91780)) b!848452))

(assert (= (or b!848453 b!848452) bm!37553))

(assert (= (or b!848453 b!848452) bm!37552))

(assert (= (and b!848454 condMapEmpty!25631) mapIsEmpty!25631))

(assert (= (and b!848454 (not condMapEmpty!25631)) mapNonEmpty!25631))

(get-info :version)

(assert (= (and mapNonEmpty!25631 ((_ is ValueCellFull!7571) mapValue!25631)) b!848456))

(assert (= (and b!848454 ((_ is ValueCellFull!7571) mapDefault!25631)) b!848461))

(assert (= start!73138 b!848454))

(declare-fun m!789875 () Bool)

(assert (=> start!73138 m!789875))

(declare-fun m!789877 () Bool)

(assert (=> start!73138 m!789877))

(declare-fun m!789879 () Bool)

(assert (=> b!848455 m!789879))

(declare-fun m!789881 () Bool)

(assert (=> bm!37552 m!789881))

(declare-fun m!789883 () Bool)

(assert (=> b!848462 m!789883))

(declare-fun m!789885 () Bool)

(assert (=> b!848449 m!789885))

(declare-fun m!789887 () Bool)

(assert (=> bm!37553 m!789887))

(declare-fun m!789889 () Bool)

(assert (=> b!848460 m!789889))

(declare-fun m!789891 () Bool)

(assert (=> b!848460 m!789891))

(declare-fun m!789893 () Bool)

(assert (=> b!848460 m!789893))

(declare-fun m!789895 () Bool)

(assert (=> b!848453 m!789895))

(declare-fun m!789897 () Bool)

(assert (=> mapNonEmpty!25631 m!789897))

(declare-fun m!789899 () Bool)

(assert (=> b!848459 m!789899))

(declare-fun m!789901 () Bool)

(assert (=> b!848450 m!789901))

(declare-fun m!789903 () Bool)

(assert (=> b!848458 m!789903))

(check-sat (not bm!37553) tp_is_empty!16021 (not b!848453) b_and!22981 (not b!848459) (not b!848458) (not b_next!13885) (not bm!37552) (not b!848450) (not b!848455) (not b!848460) (not mapNonEmpty!25631) (not start!73138) (not b!848462))
(check-sat b_and!22981 (not b_next!13885))
