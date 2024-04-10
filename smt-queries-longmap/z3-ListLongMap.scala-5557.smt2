; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73128 () Bool)

(assert start!73128)

(declare-fun b_free!14043 () Bool)

(declare-fun b_next!14043 () Bool)

(assert (=> start!73128 (= b_free!14043 (not b_next!14043))))

(declare-fun tp!49632 () Bool)

(declare-fun b_and!23245 () Bool)

(assert (=> start!73128 (= tp!49632 b_and!23245)))

(declare-fun b!851165 () Bool)

(declare-fun e!474784 () Bool)

(declare-fun e!474779 () Bool)

(assert (=> b!851165 (= e!474784 (not e!474779))))

(declare-fun res!578168 () Bool)

(assert (=> b!851165 (=> res!578168 e!474779)))

(declare-datatypes ((array!48560 0))(
  ( (array!48561 (arr!23311 (Array (_ BitVec 32) (_ BitVec 64))) (size!23751 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48560)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851165 (= res!578168 (not (validKeyInArray!0 (select (arr!23311 _keys!868) from!1053))))))

(declare-fun e!474781 () Bool)

(assert (=> b!851165 e!474781))

(declare-fun c!91735 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851165 (= c!91735 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26619 0))(
  ( (V!26620 (val!8137 Int)) )
))
(declare-fun v!557 () V!26619)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!29065 0))(
  ( (Unit!29066) )
))
(declare-fun lt!383290 () Unit!29065)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7650 0))(
  ( (ValueCellFull!7650 (v!10562 V!26619)) (EmptyCell!7650) )
))
(declare-datatypes ((array!48562 0))(
  ( (array!48563 (arr!23312 (Array (_ BitVec 32) ValueCell!7650)) (size!23752 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48562)

(declare-fun minValue!654 () V!26619)

(declare-fun zeroValue!654 () V!26619)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!374 (array!48560 array!48562 (_ BitVec 32) (_ BitVec 32) V!26619 V!26619 (_ BitVec 32) (_ BitVec 64) V!26619 (_ BitVec 32) Int) Unit!29065)

(assert (=> b!851165 (= lt!383290 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!374 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851166 () Bool)

(declare-fun e!474778 () Bool)

(declare-fun tp_is_empty!16179 () Bool)

(assert (=> b!851166 (= e!474778 tp_is_empty!16179)))

(declare-fun res!578177 () Bool)

(declare-fun e!474783 () Bool)

(assert (=> start!73128 (=> (not res!578177) (not e!474783))))

(assert (=> start!73128 (= res!578177 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23751 _keys!868))))))

(assert (=> start!73128 e!474783))

(assert (=> start!73128 tp_is_empty!16179))

(assert (=> start!73128 true))

(assert (=> start!73128 tp!49632))

(declare-fun array_inv!18496 (array!48560) Bool)

(assert (=> start!73128 (array_inv!18496 _keys!868)))

(declare-fun e!474782 () Bool)

(declare-fun array_inv!18497 (array!48562) Bool)

(assert (=> start!73128 (and (array_inv!18497 _values!688) e!474782)))

(declare-fun b!851167 () Bool)

(assert (=> b!851167 (= e!474779 true)))

(declare-datatypes ((tuple2!10674 0))(
  ( (tuple2!10675 (_1!5348 (_ BitVec 64)) (_2!5348 V!26619)) )
))
(declare-datatypes ((List!16513 0))(
  ( (Nil!16510) (Cons!16509 (h!17640 tuple2!10674) (t!23002 List!16513)) )
))
(declare-datatypes ((ListLongMap!9443 0))(
  ( (ListLongMap!9444 (toList!4737 List!16513)) )
))
(declare-fun lt!383288 () ListLongMap!9443)

(declare-fun lt!383284 () V!26619)

(declare-fun lt!383285 () tuple2!10674)

(declare-fun +!2137 (ListLongMap!9443 tuple2!10674) ListLongMap!9443)

(assert (=> b!851167 (= (+!2137 lt!383288 lt!383285) (+!2137 (+!2137 lt!383288 (tuple2!10675 k0!854 lt!383284)) lt!383285))))

(declare-fun lt!383292 () V!26619)

(assert (=> b!851167 (= lt!383285 (tuple2!10675 k0!854 lt!383292))))

(declare-fun lt!383291 () Unit!29065)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!271 (ListLongMap!9443 (_ BitVec 64) V!26619 V!26619) Unit!29065)

(assert (=> b!851167 (= lt!383291 (addSameAsAddTwiceSameKeyDiffValues!271 lt!383288 k0!854 lt!383284 lt!383292))))

(declare-fun lt!383287 () V!26619)

(declare-fun get!12283 (ValueCell!7650 V!26619) V!26619)

(assert (=> b!851167 (= lt!383284 (get!12283 (select (arr!23312 _values!688) from!1053) lt!383287))))

(declare-fun lt!383286 () ListLongMap!9443)

(assert (=> b!851167 (= lt!383286 (+!2137 lt!383288 (tuple2!10675 (select (arr!23311 _keys!868) from!1053) lt!383292)))))

(assert (=> b!851167 (= lt!383292 (get!12283 (select (store (arr!23312 _values!688) i!612 (ValueCellFull!7650 v!557)) from!1053) lt!383287))))

(declare-fun dynLambda!1025 (Int (_ BitVec 64)) V!26619)

(assert (=> b!851167 (= lt!383287 (dynLambda!1025 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!383289 () array!48562)

(declare-fun getCurrentListMapNoExtraKeys!2719 (array!48560 array!48562 (_ BitVec 32) (_ BitVec 32) V!26619 V!26619 (_ BitVec 32) Int) ListLongMap!9443)

(assert (=> b!851167 (= lt!383288 (getCurrentListMapNoExtraKeys!2719 _keys!868 lt!383289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37984 () ListLongMap!9443)

(declare-fun bm!37981 () Bool)

(assert (=> bm!37981 (= call!37984 (getCurrentListMapNoExtraKeys!2719 _keys!868 lt!383289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851168 () Bool)

(declare-fun res!578171 () Bool)

(assert (=> b!851168 (=> (not res!578171) (not e!474783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48560 (_ BitVec 32)) Bool)

(assert (=> b!851168 (= res!578171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851169 () Bool)

(declare-fun call!37985 () ListLongMap!9443)

(assert (=> b!851169 (= e!474781 (= call!37984 (+!2137 call!37985 (tuple2!10675 k0!854 v!557))))))

(declare-fun mapNonEmpty!25868 () Bool)

(declare-fun mapRes!25868 () Bool)

(declare-fun tp!49633 () Bool)

(assert (=> mapNonEmpty!25868 (= mapRes!25868 (and tp!49633 e!474778))))

(declare-fun mapKey!25868 () (_ BitVec 32))

(declare-fun mapValue!25868 () ValueCell!7650)

(declare-fun mapRest!25868 () (Array (_ BitVec 32) ValueCell!7650))

(assert (=> mapNonEmpty!25868 (= (arr!23312 _values!688) (store mapRest!25868 mapKey!25868 mapValue!25868))))

(declare-fun b!851170 () Bool)

(assert (=> b!851170 (= e!474781 (= call!37984 call!37985))))

(declare-fun b!851171 () Bool)

(declare-fun res!578176 () Bool)

(assert (=> b!851171 (=> (not res!578176) (not e!474783))))

(assert (=> b!851171 (= res!578176 (and (= (size!23752 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23751 _keys!868) (size!23752 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851172 () Bool)

(declare-fun res!578170 () Bool)

(assert (=> b!851172 (=> (not res!578170) (not e!474783))))

(assert (=> b!851172 (= res!578170 (and (= (select (arr!23311 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!37982 () Bool)

(assert (=> bm!37982 (= call!37985 (getCurrentListMapNoExtraKeys!2719 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25868 () Bool)

(assert (=> mapIsEmpty!25868 mapRes!25868))

(declare-fun b!851173 () Bool)

(declare-fun res!578169 () Bool)

(assert (=> b!851173 (=> (not res!578169) (not e!474783))))

(assert (=> b!851173 (= res!578169 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23751 _keys!868))))))

(declare-fun b!851174 () Bool)

(declare-fun e!474780 () Bool)

(assert (=> b!851174 (= e!474780 tp_is_empty!16179)))

(declare-fun b!851175 () Bool)

(declare-fun res!578175 () Bool)

(assert (=> b!851175 (=> (not res!578175) (not e!474783))))

(declare-datatypes ((List!16514 0))(
  ( (Nil!16511) (Cons!16510 (h!17641 (_ BitVec 64)) (t!23003 List!16514)) )
))
(declare-fun arrayNoDuplicates!0 (array!48560 (_ BitVec 32) List!16514) Bool)

(assert (=> b!851175 (= res!578175 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16511))))

(declare-fun b!851176 () Bool)

(declare-fun res!578174 () Bool)

(assert (=> b!851176 (=> (not res!578174) (not e!474783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851176 (= res!578174 (validMask!0 mask!1196))))

(declare-fun b!851177 () Bool)

(declare-fun res!578173 () Bool)

(assert (=> b!851177 (=> (not res!578173) (not e!474783))))

(assert (=> b!851177 (= res!578173 (validKeyInArray!0 k0!854))))

(declare-fun b!851178 () Bool)

(assert (=> b!851178 (= e!474783 e!474784)))

(declare-fun res!578172 () Bool)

(assert (=> b!851178 (=> (not res!578172) (not e!474784))))

(assert (=> b!851178 (= res!578172 (= from!1053 i!612))))

(assert (=> b!851178 (= lt!383286 (getCurrentListMapNoExtraKeys!2719 _keys!868 lt!383289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851178 (= lt!383289 (array!48563 (store (arr!23312 _values!688) i!612 (ValueCellFull!7650 v!557)) (size!23752 _values!688)))))

(declare-fun lt!383293 () ListLongMap!9443)

(assert (=> b!851178 (= lt!383293 (getCurrentListMapNoExtraKeys!2719 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851179 () Bool)

(assert (=> b!851179 (= e!474782 (and e!474780 mapRes!25868))))

(declare-fun condMapEmpty!25868 () Bool)

(declare-fun mapDefault!25868 () ValueCell!7650)

(assert (=> b!851179 (= condMapEmpty!25868 (= (arr!23312 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7650)) mapDefault!25868)))))

(assert (= (and start!73128 res!578177) b!851176))

(assert (= (and b!851176 res!578174) b!851171))

(assert (= (and b!851171 res!578176) b!851168))

(assert (= (and b!851168 res!578171) b!851175))

(assert (= (and b!851175 res!578175) b!851173))

(assert (= (and b!851173 res!578169) b!851177))

(assert (= (and b!851177 res!578173) b!851172))

(assert (= (and b!851172 res!578170) b!851178))

(assert (= (and b!851178 res!578172) b!851165))

(assert (= (and b!851165 c!91735) b!851169))

(assert (= (and b!851165 (not c!91735)) b!851170))

(assert (= (or b!851169 b!851170) bm!37982))

(assert (= (or b!851169 b!851170) bm!37981))

(assert (= (and b!851165 (not res!578168)) b!851167))

(assert (= (and b!851179 condMapEmpty!25868) mapIsEmpty!25868))

(assert (= (and b!851179 (not condMapEmpty!25868)) mapNonEmpty!25868))

(get-info :version)

(assert (= (and mapNonEmpty!25868 ((_ is ValueCellFull!7650) mapValue!25868)) b!851166))

(assert (= (and b!851179 ((_ is ValueCellFull!7650) mapDefault!25868)) b!851174))

(assert (= start!73128 b!851179))

(declare-fun b_lambda!11575 () Bool)

(assert (=> (not b_lambda!11575) (not b!851167)))

(declare-fun t!23001 () Bool)

(declare-fun tb!4345 () Bool)

(assert (=> (and start!73128 (= defaultEntry!696 defaultEntry!696) t!23001) tb!4345))

(declare-fun result!8301 () Bool)

(assert (=> tb!4345 (= result!8301 tp_is_empty!16179)))

(assert (=> b!851167 t!23001))

(declare-fun b_and!23247 () Bool)

(assert (= b_and!23245 (and (=> t!23001 result!8301) b_and!23247)))

(declare-fun m!792033 () Bool)

(assert (=> b!851165 m!792033))

(assert (=> b!851165 m!792033))

(declare-fun m!792035 () Bool)

(assert (=> b!851165 m!792035))

(declare-fun m!792037 () Bool)

(assert (=> b!851165 m!792037))

(declare-fun m!792039 () Bool)

(assert (=> b!851172 m!792039))

(declare-fun m!792041 () Bool)

(assert (=> b!851176 m!792041))

(declare-fun m!792043 () Bool)

(assert (=> start!73128 m!792043))

(declare-fun m!792045 () Bool)

(assert (=> start!73128 m!792045))

(declare-fun m!792047 () Bool)

(assert (=> mapNonEmpty!25868 m!792047))

(declare-fun m!792049 () Bool)

(assert (=> b!851178 m!792049))

(declare-fun m!792051 () Bool)

(assert (=> b!851178 m!792051))

(declare-fun m!792053 () Bool)

(assert (=> b!851178 m!792053))

(declare-fun m!792055 () Bool)

(assert (=> b!851177 m!792055))

(declare-fun m!792057 () Bool)

(assert (=> bm!37981 m!792057))

(declare-fun m!792059 () Bool)

(assert (=> b!851169 m!792059))

(declare-fun m!792061 () Bool)

(assert (=> bm!37982 m!792061))

(declare-fun m!792063 () Bool)

(assert (=> b!851175 m!792063))

(declare-fun m!792065 () Bool)

(assert (=> b!851167 m!792065))

(declare-fun m!792067 () Bool)

(assert (=> b!851167 m!792067))

(declare-fun m!792069 () Bool)

(assert (=> b!851167 m!792069))

(declare-fun m!792071 () Bool)

(assert (=> b!851167 m!792071))

(declare-fun m!792073 () Bool)

(assert (=> b!851167 m!792073))

(declare-fun m!792075 () Bool)

(assert (=> b!851167 m!792075))

(assert (=> b!851167 m!792069))

(declare-fun m!792077 () Bool)

(assert (=> b!851167 m!792077))

(assert (=> b!851167 m!792057))

(declare-fun m!792079 () Bool)

(assert (=> b!851167 m!792079))

(assert (=> b!851167 m!792071))

(assert (=> b!851167 m!792051))

(assert (=> b!851167 m!792075))

(declare-fun m!792081 () Bool)

(assert (=> b!851167 m!792081))

(assert (=> b!851167 m!792033))

(declare-fun m!792083 () Bool)

(assert (=> b!851167 m!792083))

(declare-fun m!792085 () Bool)

(assert (=> b!851168 m!792085))

(check-sat (not b_lambda!11575) (not bm!37981) (not b!851165) (not b!851168) (not b!851169) (not b!851167) (not start!73128) b_and!23247 (not b_next!14043) (not mapNonEmpty!25868) (not b!851175) (not b!851177) (not b!851176) (not bm!37982) (not b!851178) tp_is_empty!16179)
(check-sat b_and!23247 (not b_next!14043))
