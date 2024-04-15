; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73090 () Bool)

(assert start!73090)

(declare-fun b_free!14023 () Bool)

(declare-fun b_next!14023 () Bool)

(assert (=> start!73090 (= b_free!14023 (not b_next!14023))))

(declare-fun tp!49574 () Bool)

(declare-fun b_and!23179 () Bool)

(assert (=> start!73090 (= tp!49574 b_and!23179)))

(declare-fun b!850456 () Bool)

(declare-fun res!577758 () Bool)

(declare-fun e!474391 () Bool)

(assert (=> b!850456 (=> (not res!577758) (not e!474391))))

(declare-datatypes ((array!48513 0))(
  ( (array!48514 (arr!23288 (Array (_ BitVec 32) (_ BitVec 64))) (size!23730 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48513)

(declare-datatypes ((List!16514 0))(
  ( (Nil!16511) (Cons!16510 (h!17641 (_ BitVec 64)) (t!22974 List!16514)) )
))
(declare-fun arrayNoDuplicates!0 (array!48513 (_ BitVec 32) List!16514) Bool)

(assert (=> b!850456 (= res!577758 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16511))))

(declare-fun res!577759 () Bool)

(assert (=> start!73090 (=> (not res!577759) (not e!474391))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73090 (= res!577759 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23730 _keys!868))))))

(assert (=> start!73090 e!474391))

(declare-fun tp_is_empty!16159 () Bool)

(assert (=> start!73090 tp_is_empty!16159))

(assert (=> start!73090 true))

(assert (=> start!73090 tp!49574))

(declare-fun array_inv!18558 (array!48513) Bool)

(assert (=> start!73090 (array_inv!18558 _keys!868)))

(declare-datatypes ((V!26593 0))(
  ( (V!26594 (val!8127 Int)) )
))
(declare-datatypes ((ValueCell!7640 0))(
  ( (ValueCellFull!7640 (v!10546 V!26593)) (EmptyCell!7640) )
))
(declare-datatypes ((array!48515 0))(
  ( (array!48516 (arr!23289 (Array (_ BitVec 32) ValueCell!7640)) (size!23731 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48515)

(declare-fun e!474393 () Bool)

(declare-fun array_inv!18559 (array!48515) Bool)

(assert (=> start!73090 (and (array_inv!18559 _values!688) e!474393)))

(declare-fun b!850457 () Bool)

(declare-fun e!474394 () Bool)

(declare-fun mapRes!25838 () Bool)

(assert (=> b!850457 (= e!474393 (and e!474394 mapRes!25838))))

(declare-fun condMapEmpty!25838 () Bool)

(declare-fun mapDefault!25838 () ValueCell!7640)

(assert (=> b!850457 (= condMapEmpty!25838 (= (arr!23289 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7640)) mapDefault!25838)))))

(declare-fun b!850458 () Bool)

(declare-fun e!474396 () Bool)

(assert (=> b!850458 (= e!474396 true)))

(declare-fun lt!382749 () V!26593)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!10674 0))(
  ( (tuple2!10675 (_1!5348 (_ BitVec 64)) (_2!5348 V!26593)) )
))
(declare-datatypes ((List!16515 0))(
  ( (Nil!16512) (Cons!16511 (h!17642 tuple2!10674) (t!22975 List!16515)) )
))
(declare-datatypes ((ListLongMap!9433 0))(
  ( (ListLongMap!9434 (toList!4732 List!16515)) )
))
(declare-fun lt!382756 () ListLongMap!9433)

(declare-fun lt!382757 () tuple2!10674)

(declare-fun +!2154 (ListLongMap!9433 tuple2!10674) ListLongMap!9433)

(assert (=> b!850458 (= (+!2154 lt!382756 lt!382757) (+!2154 (+!2154 lt!382756 (tuple2!10675 k0!854 lt!382749)) lt!382757))))

(declare-fun lt!382754 () V!26593)

(assert (=> b!850458 (= lt!382757 (tuple2!10675 k0!854 lt!382754))))

(declare-datatypes ((Unit!28981 0))(
  ( (Unit!28982) )
))
(declare-fun lt!382752 () Unit!28981)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!268 (ListLongMap!9433 (_ BitVec 64) V!26593 V!26593) Unit!28981)

(assert (=> b!850458 (= lt!382752 (addSameAsAddTwiceSameKeyDiffValues!268 lt!382756 k0!854 lt!382749 lt!382754))))

(declare-fun lt!382748 () V!26593)

(declare-fun get!12273 (ValueCell!7640 V!26593) V!26593)

(assert (=> b!850458 (= lt!382749 (get!12273 (select (arr!23289 _values!688) from!1053) lt!382748))))

(declare-fun lt!382755 () ListLongMap!9433)

(assert (=> b!850458 (= lt!382755 (+!2154 lt!382756 (tuple2!10675 (select (arr!23288 _keys!868) from!1053) lt!382754)))))

(declare-fun v!557 () V!26593)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850458 (= lt!382754 (get!12273 (select (store (arr!23289 _values!688) i!612 (ValueCellFull!7640 v!557)) from!1053) lt!382748))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1018 (Int (_ BitVec 64)) V!26593)

(assert (=> b!850458 (= lt!382748 (dynLambda!1018 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!382751 () array!48515)

(declare-fun minValue!654 () V!26593)

(declare-fun zeroValue!654 () V!26593)

(declare-fun getCurrentListMapNoExtraKeys!2740 (array!48513 array!48515 (_ BitVec 32) (_ BitVec 32) V!26593 V!26593 (_ BitVec 32) Int) ListLongMap!9433)

(assert (=> b!850458 (= lt!382756 (getCurrentListMapNoExtraKeys!2740 _keys!868 lt!382751 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850459 () Bool)

(declare-fun res!577763 () Bool)

(assert (=> b!850459 (=> (not res!577763) (not e!474391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850459 (= res!577763 (validMask!0 mask!1196))))

(declare-fun b!850460 () Bool)

(declare-fun res!577764 () Bool)

(assert (=> b!850460 (=> (not res!577764) (not e!474391))))

(assert (=> b!850460 (= res!577764 (and (= (select (arr!23288 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!25838 () Bool)

(declare-fun tp!49573 () Bool)

(declare-fun e!474389 () Bool)

(assert (=> mapNonEmpty!25838 (= mapRes!25838 (and tp!49573 e!474389))))

(declare-fun mapKey!25838 () (_ BitVec 32))

(declare-fun mapRest!25838 () (Array (_ BitVec 32) ValueCell!7640))

(declare-fun mapValue!25838 () ValueCell!7640)

(assert (=> mapNonEmpty!25838 (= (arr!23289 _values!688) (store mapRest!25838 mapKey!25838 mapValue!25838))))

(declare-fun mapIsEmpty!25838 () Bool)

(assert (=> mapIsEmpty!25838 mapRes!25838))

(declare-fun call!37899 () ListLongMap!9433)

(declare-fun e!474390 () Bool)

(declare-fun call!37898 () ListLongMap!9433)

(declare-fun b!850461 () Bool)

(assert (=> b!850461 (= e!474390 (= call!37899 (+!2154 call!37898 (tuple2!10675 k0!854 v!557))))))

(declare-fun b!850462 () Bool)

(declare-fun res!577767 () Bool)

(assert (=> b!850462 (=> (not res!577767) (not e!474391))))

(assert (=> b!850462 (= res!577767 (and (= (size!23731 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23730 _keys!868) (size!23731 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37895 () Bool)

(assert (=> bm!37895 (= call!37899 (getCurrentListMapNoExtraKeys!2740 _keys!868 lt!382751 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850463 () Bool)

(declare-fun res!577766 () Bool)

(assert (=> b!850463 (=> (not res!577766) (not e!474391))))

(assert (=> b!850463 (= res!577766 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23730 _keys!868))))))

(declare-fun b!850464 () Bool)

(declare-fun e!474392 () Bool)

(assert (=> b!850464 (= e!474392 (not e!474396))))

(declare-fun res!577762 () Bool)

(assert (=> b!850464 (=> res!577762 e!474396)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850464 (= res!577762 (not (validKeyInArray!0 (select (arr!23288 _keys!868) from!1053))))))

(assert (=> b!850464 e!474390))

(declare-fun c!91640 () Bool)

(assert (=> b!850464 (= c!91640 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382750 () Unit!28981)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!363 (array!48513 array!48515 (_ BitVec 32) (_ BitVec 32) V!26593 V!26593 (_ BitVec 32) (_ BitVec 64) V!26593 (_ BitVec 32) Int) Unit!28981)

(assert (=> b!850464 (= lt!382750 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!363 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37896 () Bool)

(assert (=> bm!37896 (= call!37898 (getCurrentListMapNoExtraKeys!2740 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850465 () Bool)

(assert (=> b!850465 (= e!474394 tp_is_empty!16159)))

(declare-fun b!850466 () Bool)

(assert (=> b!850466 (= e!474390 (= call!37899 call!37898))))

(declare-fun b!850467 () Bool)

(assert (=> b!850467 (= e!474389 tp_is_empty!16159)))

(declare-fun b!850468 () Bool)

(declare-fun res!577761 () Bool)

(assert (=> b!850468 (=> (not res!577761) (not e!474391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48513 (_ BitVec 32)) Bool)

(assert (=> b!850468 (= res!577761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850469 () Bool)

(assert (=> b!850469 (= e!474391 e!474392)))

(declare-fun res!577765 () Bool)

(assert (=> b!850469 (=> (not res!577765) (not e!474392))))

(assert (=> b!850469 (= res!577765 (= from!1053 i!612))))

(assert (=> b!850469 (= lt!382755 (getCurrentListMapNoExtraKeys!2740 _keys!868 lt!382751 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850469 (= lt!382751 (array!48516 (store (arr!23289 _values!688) i!612 (ValueCellFull!7640 v!557)) (size!23731 _values!688)))))

(declare-fun lt!382753 () ListLongMap!9433)

(assert (=> b!850469 (= lt!382753 (getCurrentListMapNoExtraKeys!2740 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850470 () Bool)

(declare-fun res!577760 () Bool)

(assert (=> b!850470 (=> (not res!577760) (not e!474391))))

(assert (=> b!850470 (= res!577760 (validKeyInArray!0 k0!854))))

(assert (= (and start!73090 res!577759) b!850459))

(assert (= (and b!850459 res!577763) b!850462))

(assert (= (and b!850462 res!577767) b!850468))

(assert (= (and b!850468 res!577761) b!850456))

(assert (= (and b!850456 res!577758) b!850463))

(assert (= (and b!850463 res!577766) b!850470))

(assert (= (and b!850470 res!577760) b!850460))

(assert (= (and b!850460 res!577764) b!850469))

(assert (= (and b!850469 res!577765) b!850464))

(assert (= (and b!850464 c!91640) b!850461))

(assert (= (and b!850464 (not c!91640)) b!850466))

(assert (= (or b!850461 b!850466) bm!37895))

(assert (= (or b!850461 b!850466) bm!37896))

(assert (= (and b!850464 (not res!577762)) b!850458))

(assert (= (and b!850457 condMapEmpty!25838) mapIsEmpty!25838))

(assert (= (and b!850457 (not condMapEmpty!25838)) mapNonEmpty!25838))

(get-info :version)

(assert (= (and mapNonEmpty!25838 ((_ is ValueCellFull!7640) mapValue!25838)) b!850467))

(assert (= (and b!850457 ((_ is ValueCellFull!7640) mapDefault!25838)) b!850465))

(assert (= start!73090 b!850457))

(declare-fun b_lambda!11537 () Bool)

(assert (=> (not b_lambda!11537) (not b!850458)))

(declare-fun t!22973 () Bool)

(declare-fun tb!4317 () Bool)

(assert (=> (and start!73090 (= defaultEntry!696 defaultEntry!696) t!22973) tb!4317))

(declare-fun result!8253 () Bool)

(assert (=> tb!4317 (= result!8253 tp_is_empty!16159)))

(assert (=> b!850458 t!22973))

(declare-fun b_and!23181 () Bool)

(assert (= b_and!23179 (and (=> t!22973 result!8253) b_and!23181)))

(declare-fun m!790741 () Bool)

(assert (=> mapNonEmpty!25838 m!790741))

(declare-fun m!790743 () Bool)

(assert (=> b!850460 m!790743))

(declare-fun m!790745 () Bool)

(assert (=> bm!37895 m!790745))

(declare-fun m!790747 () Bool)

(assert (=> bm!37896 m!790747))

(declare-fun m!790749 () Bool)

(assert (=> b!850461 m!790749))

(declare-fun m!790751 () Bool)

(assert (=> b!850456 m!790751))

(declare-fun m!790753 () Bool)

(assert (=> b!850459 m!790753))

(declare-fun m!790755 () Bool)

(assert (=> b!850468 m!790755))

(declare-fun m!790757 () Bool)

(assert (=> start!73090 m!790757))

(declare-fun m!790759 () Bool)

(assert (=> start!73090 m!790759))

(declare-fun m!790761 () Bool)

(assert (=> b!850458 m!790761))

(declare-fun m!790763 () Bool)

(assert (=> b!850458 m!790763))

(declare-fun m!790765 () Bool)

(assert (=> b!850458 m!790765))

(declare-fun m!790767 () Bool)

(assert (=> b!850458 m!790767))

(declare-fun m!790769 () Bool)

(assert (=> b!850458 m!790769))

(assert (=> b!850458 m!790765))

(declare-fun m!790771 () Bool)

(assert (=> b!850458 m!790771))

(assert (=> b!850458 m!790767))

(assert (=> b!850458 m!790745))

(declare-fun m!790773 () Bool)

(assert (=> b!850458 m!790773))

(declare-fun m!790775 () Bool)

(assert (=> b!850458 m!790775))

(declare-fun m!790777 () Bool)

(assert (=> b!850458 m!790777))

(declare-fun m!790779 () Bool)

(assert (=> b!850458 m!790779))

(assert (=> b!850458 m!790761))

(declare-fun m!790781 () Bool)

(assert (=> b!850458 m!790781))

(declare-fun m!790783 () Bool)

(assert (=> b!850458 m!790783))

(declare-fun m!790785 () Bool)

(assert (=> b!850469 m!790785))

(assert (=> b!850469 m!790783))

(declare-fun m!790787 () Bool)

(assert (=> b!850469 m!790787))

(declare-fun m!790789 () Bool)

(assert (=> b!850470 m!790789))

(assert (=> b!850464 m!790775))

(assert (=> b!850464 m!790775))

(declare-fun m!790791 () Bool)

(assert (=> b!850464 m!790791))

(declare-fun m!790793 () Bool)

(assert (=> b!850464 m!790793))

(check-sat tp_is_empty!16159 b_and!23181 (not start!73090) (not b!850456) (not mapNonEmpty!25838) (not b_next!14023) (not b!850458) (not bm!37895) (not b_lambda!11537) (not bm!37896) (not b!850461) (not b!850464) (not b!850459) (not b!850469) (not b!850470) (not b!850468))
(check-sat b_and!23181 (not b_next!14023))
