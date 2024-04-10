; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72996 () Bool)

(assert start!72996)

(declare-fun b_free!13911 () Bool)

(declare-fun b_next!13911 () Bool)

(assert (=> start!72996 (= b_free!13911 (not b_next!13911))))

(declare-fun tp!49237 () Bool)

(declare-fun b_and!22997 () Bool)

(assert (=> start!72996 (= tp!49237 b_and!22997)))

(declare-fun b!848092 () Bool)

(declare-fun e!473208 () Bool)

(declare-fun tp_is_empty!16047 () Bool)

(assert (=> b!848092 (= e!473208 tp_is_empty!16047)))

(declare-fun mapIsEmpty!25670 () Bool)

(declare-fun mapRes!25670 () Bool)

(assert (=> mapIsEmpty!25670 mapRes!25670))

(declare-fun b!848093 () Bool)

(declare-fun e!473206 () Bool)

(declare-fun e!473207 () Bool)

(assert (=> b!848093 (= e!473206 e!473207)))

(declare-fun res!576202 () Bool)

(assert (=> b!848093 (=> (not res!576202) (not e!473207))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848093 (= res!576202 (= from!1053 i!612))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26443 0))(
  ( (V!26444 (val!8071 Int)) )
))
(declare-datatypes ((ValueCell!7584 0))(
  ( (ValueCellFull!7584 (v!10496 V!26443)) (EmptyCell!7584) )
))
(declare-datatypes ((array!48304 0))(
  ( (array!48305 (arr!23183 (Array (_ BitVec 32) ValueCell!7584)) (size!23623 (_ BitVec 32))) )
))
(declare-fun lt!381922 () array!48304)

(declare-datatypes ((array!48306 0))(
  ( (array!48307 (arr!23184 (Array (_ BitVec 32) (_ BitVec 64))) (size!23624 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48306)

(declare-fun minValue!654 () V!26443)

(declare-fun zeroValue!654 () V!26443)

(declare-datatypes ((tuple2!10552 0))(
  ( (tuple2!10553 (_1!5287 (_ BitVec 64)) (_2!5287 V!26443)) )
))
(declare-datatypes ((List!16409 0))(
  ( (Nil!16406) (Cons!16405 (h!17536 tuple2!10552) (t!22780 List!16409)) )
))
(declare-datatypes ((ListLongMap!9321 0))(
  ( (ListLongMap!9322 (toList!4676 List!16409)) )
))
(declare-fun lt!381923 () ListLongMap!9321)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2660 (array!48306 array!48304 (_ BitVec 32) (_ BitVec 32) V!26443 V!26443 (_ BitVec 32) Int) ListLongMap!9321)

(assert (=> b!848093 (= lt!381923 (getCurrentListMapNoExtraKeys!2660 _keys!868 lt!381922 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26443)

(declare-fun _values!688 () array!48304)

(assert (=> b!848093 (= lt!381922 (array!48305 (store (arr!23183 _values!688) i!612 (ValueCellFull!7584 v!557)) (size!23623 _values!688)))))

(declare-fun lt!381925 () ListLongMap!9321)

(assert (=> b!848093 (= lt!381925 (getCurrentListMapNoExtraKeys!2660 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848094 () Bool)

(declare-fun e!473211 () Bool)

(declare-fun e!473210 () Bool)

(assert (=> b!848094 (= e!473211 (and e!473210 mapRes!25670))))

(declare-fun condMapEmpty!25670 () Bool)

(declare-fun mapDefault!25670 () ValueCell!7584)

(assert (=> b!848094 (= condMapEmpty!25670 (= (arr!23183 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7584)) mapDefault!25670)))))

(declare-fun res!576204 () Bool)

(assert (=> start!72996 (=> (not res!576204) (not e!473206))))

(assert (=> start!72996 (= res!576204 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23624 _keys!868))))))

(assert (=> start!72996 e!473206))

(assert (=> start!72996 tp_is_empty!16047))

(assert (=> start!72996 true))

(assert (=> start!72996 tp!49237))

(declare-fun array_inv!18410 (array!48306) Bool)

(assert (=> start!72996 (array_inv!18410 _keys!868)))

(declare-fun array_inv!18411 (array!48304) Bool)

(assert (=> start!72996 (and (array_inv!18411 _values!688) e!473211)))

(declare-fun b!848095 () Bool)

(declare-fun e!473212 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!37588 () ListLongMap!9321)

(declare-fun call!37589 () ListLongMap!9321)

(declare-fun +!2089 (ListLongMap!9321 tuple2!10552) ListLongMap!9321)

(assert (=> b!848095 (= e!473212 (= call!37589 (+!2089 call!37588 (tuple2!10553 k0!854 v!557))))))

(declare-fun b!848096 () Bool)

(declare-fun res!576206 () Bool)

(assert (=> b!848096 (=> (not res!576206) (not e!473206))))

(declare-datatypes ((List!16410 0))(
  ( (Nil!16407) (Cons!16406 (h!17537 (_ BitVec 64)) (t!22781 List!16410)) )
))
(declare-fun arrayNoDuplicates!0 (array!48306 (_ BitVec 32) List!16410) Bool)

(assert (=> b!848096 (= res!576206 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16407))))

(declare-fun b!848097 () Bool)

(declare-fun res!576205 () Bool)

(assert (=> b!848097 (=> (not res!576205) (not e!473206))))

(assert (=> b!848097 (= res!576205 (and (= (size!23623 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23624 _keys!868) (size!23623 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37585 () Bool)

(assert (=> bm!37585 (= call!37589 (getCurrentListMapNoExtraKeys!2660 _keys!868 lt!381922 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848098 () Bool)

(declare-fun res!576208 () Bool)

(assert (=> b!848098 (=> (not res!576208) (not e!473206))))

(assert (=> b!848098 (= res!576208 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23624 _keys!868))))))

(declare-fun b!848099 () Bool)

(declare-fun res!576203 () Bool)

(assert (=> b!848099 (=> (not res!576203) (not e!473206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848099 (= res!576203 (validKeyInArray!0 k0!854))))

(declare-fun b!848100 () Bool)

(assert (=> b!848100 (= e!473210 tp_is_empty!16047)))

(declare-fun bm!37586 () Bool)

(assert (=> bm!37586 (= call!37588 (getCurrentListMapNoExtraKeys!2660 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25670 () Bool)

(declare-fun tp!49236 () Bool)

(assert (=> mapNonEmpty!25670 (= mapRes!25670 (and tp!49236 e!473208))))

(declare-fun mapRest!25670 () (Array (_ BitVec 32) ValueCell!7584))

(declare-fun mapKey!25670 () (_ BitVec 32))

(declare-fun mapValue!25670 () ValueCell!7584)

(assert (=> mapNonEmpty!25670 (= (arr!23183 _values!688) (store mapRest!25670 mapKey!25670 mapValue!25670))))

(declare-fun b!848101 () Bool)

(declare-fun res!576207 () Bool)

(assert (=> b!848101 (=> (not res!576207) (not e!473206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48306 (_ BitVec 32)) Bool)

(assert (=> b!848101 (= res!576207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848102 () Bool)

(assert (=> b!848102 (= e!473207 (not true))))

(assert (=> b!848102 e!473212))

(declare-fun c!91537 () Bool)

(assert (=> b!848102 (= c!91537 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28965 0))(
  ( (Unit!28966) )
))
(declare-fun lt!381924 () Unit!28965)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!328 (array!48306 array!48304 (_ BitVec 32) (_ BitVec 32) V!26443 V!26443 (_ BitVec 32) (_ BitVec 64) V!26443 (_ BitVec 32) Int) Unit!28965)

(assert (=> b!848102 (= lt!381924 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!328 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848103 () Bool)

(assert (=> b!848103 (= e!473212 (= call!37589 call!37588))))

(declare-fun b!848104 () Bool)

(declare-fun res!576201 () Bool)

(assert (=> b!848104 (=> (not res!576201) (not e!473206))))

(assert (=> b!848104 (= res!576201 (and (= (select (arr!23184 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848105 () Bool)

(declare-fun res!576209 () Bool)

(assert (=> b!848105 (=> (not res!576209) (not e!473206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848105 (= res!576209 (validMask!0 mask!1196))))

(assert (= (and start!72996 res!576204) b!848105))

(assert (= (and b!848105 res!576209) b!848097))

(assert (= (and b!848097 res!576205) b!848101))

(assert (= (and b!848101 res!576207) b!848096))

(assert (= (and b!848096 res!576206) b!848098))

(assert (= (and b!848098 res!576208) b!848099))

(assert (= (and b!848099 res!576203) b!848104))

(assert (= (and b!848104 res!576201) b!848093))

(assert (= (and b!848093 res!576202) b!848102))

(assert (= (and b!848102 c!91537) b!848095))

(assert (= (and b!848102 (not c!91537)) b!848103))

(assert (= (or b!848095 b!848103) bm!37585))

(assert (= (or b!848095 b!848103) bm!37586))

(assert (= (and b!848094 condMapEmpty!25670) mapIsEmpty!25670))

(assert (= (and b!848094 (not condMapEmpty!25670)) mapNonEmpty!25670))

(get-info :version)

(assert (= (and mapNonEmpty!25670 ((_ is ValueCellFull!7584) mapValue!25670)) b!848092))

(assert (= (and b!848094 ((_ is ValueCellFull!7584) mapDefault!25670)) b!848100))

(assert (= start!72996 b!848094))

(declare-fun m!788973 () Bool)

(assert (=> b!848096 m!788973))

(declare-fun m!788975 () Bool)

(assert (=> mapNonEmpty!25670 m!788975))

(declare-fun m!788977 () Bool)

(assert (=> b!848095 m!788977))

(declare-fun m!788979 () Bool)

(assert (=> b!848099 m!788979))

(declare-fun m!788981 () Bool)

(assert (=> b!848104 m!788981))

(declare-fun m!788983 () Bool)

(assert (=> b!848105 m!788983))

(declare-fun m!788985 () Bool)

(assert (=> bm!37585 m!788985))

(declare-fun m!788987 () Bool)

(assert (=> b!848101 m!788987))

(declare-fun m!788989 () Bool)

(assert (=> b!848093 m!788989))

(declare-fun m!788991 () Bool)

(assert (=> b!848093 m!788991))

(declare-fun m!788993 () Bool)

(assert (=> b!848093 m!788993))

(declare-fun m!788995 () Bool)

(assert (=> bm!37586 m!788995))

(declare-fun m!788997 () Bool)

(assert (=> start!72996 m!788997))

(declare-fun m!788999 () Bool)

(assert (=> start!72996 m!788999))

(declare-fun m!789001 () Bool)

(assert (=> b!848102 m!789001))

(check-sat (not start!72996) (not b!848095) (not b!848102) (not bm!37586) (not bm!37585) (not b_next!13911) (not b!848101) (not b!848099) tp_is_empty!16047 (not b!848096) (not b!848105) (not b!848093) (not mapNonEmpty!25670) b_and!22997)
(check-sat b_and!22997 (not b_next!13911))
