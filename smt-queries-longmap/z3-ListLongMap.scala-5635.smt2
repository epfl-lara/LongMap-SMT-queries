; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73576 () Bool)

(assert start!73576)

(declare-fun b_free!14509 () Bool)

(declare-fun b_next!14509 () Bool)

(assert (=> start!73576 (= b_free!14509 (not b_next!14509))))

(declare-fun tp!51032 () Bool)

(declare-fun b_and!23971 () Bool)

(assert (=> start!73576 (= tp!51032 b_and!23971)))

(declare-fun b!860806 () Bool)

(declare-datatypes ((Unit!29283 0))(
  ( (Unit!29284) )
))
(declare-fun e!479625 () Unit!29283)

(declare-fun Unit!29285 () Unit!29283)

(assert (=> b!860806 (= e!479625 Unit!29285)))

(declare-fun lt!387988 () Unit!29283)

(declare-datatypes ((array!49447 0))(
  ( (array!49448 (arr!23755 (Array (_ BitVec 32) (_ BitVec 64))) (size!24197 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49447)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49447 (_ BitVec 32) (_ BitVec 32)) Unit!29283)

(assert (=> b!860806 (= lt!387988 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16869 0))(
  ( (Nil!16866) (Cons!16865 (h!17996 (_ BitVec 64)) (t!23635 List!16869)) )
))
(declare-fun arrayNoDuplicates!0 (array!49447 (_ BitVec 32) List!16869) Bool)

(assert (=> b!860806 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16866)))

(declare-fun lt!387987 () Unit!29283)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49447 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29283)

(assert (=> b!860806 (= lt!387987 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860806 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387980 () Unit!29283)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49447 (_ BitVec 64) (_ BitVec 32) List!16869) Unit!29283)

(assert (=> b!860806 (= lt!387980 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16866))))

(assert (=> b!860806 false))

(declare-fun b!860807 () Bool)

(declare-fun e!479622 () Bool)

(declare-fun e!479621 () Bool)

(assert (=> b!860807 (= e!479622 e!479621)))

(declare-fun res!585059 () Bool)

(assert (=> b!860807 (=> (not res!585059) (not e!479621))))

(assert (=> b!860807 (= res!585059 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27241 0))(
  ( (V!27242 (val!8370 Int)) )
))
(declare-datatypes ((ValueCell!7883 0))(
  ( (ValueCellFull!7883 (v!10789 V!27241)) (EmptyCell!7883) )
))
(declare-datatypes ((array!49449 0))(
  ( (array!49450 (arr!23756 (Array (_ BitVec 32) ValueCell!7883)) (size!24198 (_ BitVec 32))) )
))
(declare-fun lt!387984 () array!49449)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11070 0))(
  ( (tuple2!11071 (_1!5546 (_ BitVec 64)) (_2!5546 V!27241)) )
))
(declare-datatypes ((List!16870 0))(
  ( (Nil!16867) (Cons!16866 (h!17997 tuple2!11070) (t!23636 List!16870)) )
))
(declare-datatypes ((ListLongMap!9829 0))(
  ( (ListLongMap!9830 (toList!4930 List!16870)) )
))
(declare-fun lt!387983 () ListLongMap!9829)

(declare-fun minValue!654 () V!27241)

(declare-fun zeroValue!654 () V!27241)

(declare-fun getCurrentListMapNoExtraKeys!2933 (array!49447 array!49449 (_ BitVec 32) (_ BitVec 32) V!27241 V!27241 (_ BitVec 32) Int) ListLongMap!9829)

(assert (=> b!860807 (= lt!387983 (getCurrentListMapNoExtraKeys!2933 _keys!868 lt!387984 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27241)

(declare-fun _values!688 () array!49449)

(assert (=> b!860807 (= lt!387984 (array!49450 (store (arr!23756 _values!688) i!612 (ValueCellFull!7883 v!557)) (size!24198 _values!688)))))

(declare-fun lt!387985 () ListLongMap!9829)

(assert (=> b!860807 (= lt!387985 (getCurrentListMapNoExtraKeys!2933 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860808 () Bool)

(declare-fun res!585063 () Bool)

(assert (=> b!860808 (=> (not res!585063) (not e!479622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860808 (= res!585063 (validMask!0 mask!1196))))

(declare-fun b!860809 () Bool)

(declare-fun res!585065 () Bool)

(assert (=> b!860809 (=> (not res!585065) (not e!479622))))

(assert (=> b!860809 (= res!585065 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16866))))

(declare-fun b!860810 () Bool)

(declare-fun e!479623 () Bool)

(declare-fun tp_is_empty!16645 () Bool)

(assert (=> b!860810 (= e!479623 tp_is_empty!16645)))

(declare-fun b!860811 () Bool)

(declare-fun res!585064 () Bool)

(assert (=> b!860811 (=> (not res!585064) (not e!479622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860811 (= res!585064 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26567 () Bool)

(declare-fun mapRes!26567 () Bool)

(declare-fun tp!51031 () Bool)

(assert (=> mapNonEmpty!26567 (= mapRes!26567 (and tp!51031 e!479623))))

(declare-fun mapValue!26567 () ValueCell!7883)

(declare-fun mapRest!26567 () (Array (_ BitVec 32) ValueCell!7883))

(declare-fun mapKey!26567 () (_ BitVec 32))

(assert (=> mapNonEmpty!26567 (= (arr!23756 _values!688) (store mapRest!26567 mapKey!26567 mapValue!26567))))

(declare-fun b!860812 () Bool)

(declare-fun res!585057 () Bool)

(assert (=> b!860812 (=> (not res!585057) (not e!479622))))

(assert (=> b!860812 (= res!585057 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24197 _keys!868))))))

(declare-fun b!860813 () Bool)

(declare-fun e!479620 () Bool)

(declare-fun e!479624 () Bool)

(assert (=> b!860813 (= e!479620 (and e!479624 mapRes!26567))))

(declare-fun condMapEmpty!26567 () Bool)

(declare-fun mapDefault!26567 () ValueCell!7883)

(assert (=> b!860813 (= condMapEmpty!26567 (= (arr!23756 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7883)) mapDefault!26567)))))

(declare-fun b!860814 () Bool)

(declare-fun Unit!29286 () Unit!29283)

(assert (=> b!860814 (= e!479625 Unit!29286)))

(declare-fun b!860815 () Bool)

(declare-fun e!479618 () Bool)

(assert (=> b!860815 (= e!479621 (not e!479618))))

(declare-fun res!585061 () Bool)

(assert (=> b!860815 (=> res!585061 e!479618)))

(assert (=> b!860815 (= res!585061 (not (validKeyInArray!0 (select (arr!23755 _keys!868) from!1053))))))

(declare-fun lt!387989 () ListLongMap!9829)

(declare-fun lt!387982 () ListLongMap!9829)

(assert (=> b!860815 (= lt!387989 lt!387982)))

(declare-fun lt!387986 () ListLongMap!9829)

(declare-fun +!2303 (ListLongMap!9829 tuple2!11070) ListLongMap!9829)

(assert (=> b!860815 (= lt!387982 (+!2303 lt!387986 (tuple2!11071 k0!854 v!557)))))

(assert (=> b!860815 (= lt!387989 (getCurrentListMapNoExtraKeys!2933 _keys!868 lt!387984 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860815 (= lt!387986 (getCurrentListMapNoExtraKeys!2933 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387981 () Unit!29283)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!494 (array!49447 array!49449 (_ BitVec 32) (_ BitVec 32) V!27241 V!27241 (_ BitVec 32) (_ BitVec 64) V!27241 (_ BitVec 32) Int) Unit!29283)

(assert (=> b!860815 (= lt!387981 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!494 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860816 () Bool)

(assert (=> b!860816 (= e!479618 true)))

(assert (=> b!860816 (not (= (select (arr!23755 _keys!868) from!1053) k0!854))))

(declare-fun lt!387979 () Unit!29283)

(assert (=> b!860816 (= lt!387979 e!479625)))

(declare-fun c!91919 () Bool)

(assert (=> b!860816 (= c!91919 (= (select (arr!23755 _keys!868) from!1053) k0!854))))

(declare-fun get!12531 (ValueCell!7883 V!27241) V!27241)

(declare-fun dynLambda!1114 (Int (_ BitVec 64)) V!27241)

(assert (=> b!860816 (= lt!387983 (+!2303 lt!387982 (tuple2!11071 (select (arr!23755 _keys!868) from!1053) (get!12531 (select (arr!23756 _values!688) from!1053) (dynLambda!1114 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!26567 () Bool)

(assert (=> mapIsEmpty!26567 mapRes!26567))

(declare-fun res!585062 () Bool)

(assert (=> start!73576 (=> (not res!585062) (not e!479622))))

(assert (=> start!73576 (= res!585062 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24197 _keys!868))))))

(assert (=> start!73576 e!479622))

(assert (=> start!73576 tp_is_empty!16645))

(assert (=> start!73576 true))

(assert (=> start!73576 tp!51032))

(declare-fun array_inv!18870 (array!49447) Bool)

(assert (=> start!73576 (array_inv!18870 _keys!868)))

(declare-fun array_inv!18871 (array!49449) Bool)

(assert (=> start!73576 (and (array_inv!18871 _values!688) e!479620)))

(declare-fun b!860817 () Bool)

(declare-fun res!585060 () Bool)

(assert (=> b!860817 (=> (not res!585060) (not e!479622))))

(assert (=> b!860817 (= res!585060 (and (= (select (arr!23755 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860818 () Bool)

(declare-fun res!585066 () Bool)

(assert (=> b!860818 (=> (not res!585066) (not e!479622))))

(assert (=> b!860818 (= res!585066 (and (= (size!24198 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24197 _keys!868) (size!24198 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860819 () Bool)

(declare-fun res!585058 () Bool)

(assert (=> b!860819 (=> (not res!585058) (not e!479622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49447 (_ BitVec 32)) Bool)

(assert (=> b!860819 (= res!585058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860820 () Bool)

(assert (=> b!860820 (= e!479624 tp_is_empty!16645)))

(assert (= (and start!73576 res!585062) b!860808))

(assert (= (and b!860808 res!585063) b!860818))

(assert (= (and b!860818 res!585066) b!860819))

(assert (= (and b!860819 res!585058) b!860809))

(assert (= (and b!860809 res!585065) b!860812))

(assert (= (and b!860812 res!585057) b!860811))

(assert (= (and b!860811 res!585064) b!860817))

(assert (= (and b!860817 res!585060) b!860807))

(assert (= (and b!860807 res!585059) b!860815))

(assert (= (and b!860815 (not res!585061)) b!860816))

(assert (= (and b!860816 c!91919) b!860806))

(assert (= (and b!860816 (not c!91919)) b!860814))

(assert (= (and b!860813 condMapEmpty!26567) mapIsEmpty!26567))

(assert (= (and b!860813 (not condMapEmpty!26567)) mapNonEmpty!26567))

(get-info :version)

(assert (= (and mapNonEmpty!26567 ((_ is ValueCellFull!7883) mapValue!26567)) b!860810))

(assert (= (and b!860813 ((_ is ValueCellFull!7883) mapDefault!26567)) b!860820))

(assert (= start!73576 b!860813))

(declare-fun b_lambda!11843 () Bool)

(assert (=> (not b_lambda!11843) (not b!860816)))

(declare-fun t!23634 () Bool)

(declare-fun tb!4623 () Bool)

(assert (=> (and start!73576 (= defaultEntry!696 defaultEntry!696) t!23634) tb!4623))

(declare-fun result!8865 () Bool)

(assert (=> tb!4623 (= result!8865 tp_is_empty!16645)))

(assert (=> b!860816 t!23634))

(declare-fun b_and!23973 () Bool)

(assert (= b_and!23971 (and (=> t!23634 result!8865) b_and!23973)))

(declare-fun m!801147 () Bool)

(assert (=> b!860817 m!801147))

(declare-fun m!801149 () Bool)

(assert (=> b!860808 m!801149))

(declare-fun m!801151 () Bool)

(assert (=> mapNonEmpty!26567 m!801151))

(declare-fun m!801153 () Bool)

(assert (=> b!860806 m!801153))

(declare-fun m!801155 () Bool)

(assert (=> b!860806 m!801155))

(declare-fun m!801157 () Bool)

(assert (=> b!860806 m!801157))

(declare-fun m!801159 () Bool)

(assert (=> b!860806 m!801159))

(declare-fun m!801161 () Bool)

(assert (=> b!860806 m!801161))

(declare-fun m!801163 () Bool)

(assert (=> b!860811 m!801163))

(declare-fun m!801165 () Bool)

(assert (=> b!860816 m!801165))

(declare-fun m!801167 () Bool)

(assert (=> b!860816 m!801167))

(declare-fun m!801169 () Bool)

(assert (=> b!860816 m!801169))

(declare-fun m!801171 () Bool)

(assert (=> b!860816 m!801171))

(assert (=> b!860816 m!801167))

(declare-fun m!801173 () Bool)

(assert (=> b!860816 m!801173))

(assert (=> b!860816 m!801169))

(declare-fun m!801175 () Bool)

(assert (=> b!860819 m!801175))

(declare-fun m!801177 () Bool)

(assert (=> b!860807 m!801177))

(declare-fun m!801179 () Bool)

(assert (=> b!860807 m!801179))

(declare-fun m!801181 () Bool)

(assert (=> b!860807 m!801181))

(declare-fun m!801183 () Bool)

(assert (=> b!860815 m!801183))

(declare-fun m!801185 () Bool)

(assert (=> b!860815 m!801185))

(assert (=> b!860815 m!801173))

(declare-fun m!801187 () Bool)

(assert (=> b!860815 m!801187))

(assert (=> b!860815 m!801173))

(declare-fun m!801189 () Bool)

(assert (=> b!860815 m!801189))

(declare-fun m!801191 () Bool)

(assert (=> b!860815 m!801191))

(declare-fun m!801193 () Bool)

(assert (=> start!73576 m!801193))

(declare-fun m!801195 () Bool)

(assert (=> start!73576 m!801195))

(declare-fun m!801197 () Bool)

(assert (=> b!860809 m!801197))

(check-sat (not b!860806) (not b!860819) (not b!860816) (not mapNonEmpty!26567) b_and!23973 (not b!860807) (not b_next!14509) (not b!860815) tp_is_empty!16645 (not b!860808) (not start!73576) (not b_lambda!11843) (not b!860811) (not b!860809))
(check-sat b_and!23973 (not b_next!14509))
