; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73726 () Bool)

(assert start!73726)

(declare-fun b_free!14473 () Bool)

(declare-fun b_next!14473 () Bool)

(assert (=> start!73726 (= b_free!14473 (not b_next!14473))))

(declare-fun tp!50924 () Bool)

(declare-fun b_and!23935 () Bool)

(assert (=> start!73726 (= tp!50924 b_and!23935)))

(declare-fun b!861034 () Bool)

(declare-fun res!584848 () Bool)

(declare-fun e!479884 () Bool)

(assert (=> b!861034 (=> res!584848 e!479884)))

(declare-datatypes ((List!16799 0))(
  ( (Nil!16796) (Cons!16795 (h!17932 (_ BitVec 64)) (t!23530 List!16799)) )
))
(declare-fun contains!4207 (List!16799 (_ BitVec 64)) Bool)

(assert (=> b!861034 (= res!584848 (contains!4207 Nil!16796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!861035 () Bool)

(declare-fun e!479886 () Bool)

(declare-fun e!479883 () Bool)

(declare-fun mapRes!26513 () Bool)

(assert (=> b!861035 (= e!479886 (and e!479883 mapRes!26513))))

(declare-fun condMapEmpty!26513 () Bool)

(declare-datatypes ((V!27193 0))(
  ( (V!27194 (val!8352 Int)) )
))
(declare-datatypes ((ValueCell!7865 0))(
  ( (ValueCellFull!7865 (v!10777 V!27193)) (EmptyCell!7865) )
))
(declare-datatypes ((array!49445 0))(
  ( (array!49446 (arr!23749 (Array (_ BitVec 32) ValueCell!7865)) (size!24190 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49445)

(declare-fun mapDefault!26513 () ValueCell!7865)

(assert (=> b!861035 (= condMapEmpty!26513 (= (arr!23749 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7865)) mapDefault!26513)))))

(declare-fun mapIsEmpty!26513 () Bool)

(assert (=> mapIsEmpty!26513 mapRes!26513))

(declare-fun b!861036 () Bool)

(declare-fun e!479890 () Bool)

(assert (=> b!861036 (= e!479890 e!479884)))

(declare-fun res!584836 () Bool)

(assert (=> b!861036 (=> res!584836 e!479884)))

(declare-datatypes ((array!49447 0))(
  ( (array!49448 (arr!23750 (Array (_ BitVec 32) (_ BitVec 64))) (size!24191 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49447)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861036 (= res!584836 (or (bvsge (size!24191 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24191 _keys!868)) (bvsge from!1053 (size!24191 _keys!868))))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!49447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861036 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29322 0))(
  ( (Unit!29323) )
))
(declare-fun lt!388023 () Unit!29322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49447 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29322)

(assert (=> b!861036 (= lt!388023 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!49447 (_ BitVec 32) List!16799) Bool)

(assert (=> b!861036 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16796)))

(declare-fun lt!388016 () Unit!29322)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49447 (_ BitVec 32) (_ BitVec 32)) Unit!29322)

(assert (=> b!861036 (= lt!388016 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!861037 () Bool)

(declare-fun res!584839 () Bool)

(declare-fun e!479882 () Bool)

(assert (=> b!861037 (=> (not res!584839) (not e!479882))))

(assert (=> b!861037 (= res!584839 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24191 _keys!868))))))

(declare-fun b!861038 () Bool)

(declare-fun res!584844 () Bool)

(assert (=> b!861038 (=> res!584844 e!479884)))

(declare-fun noDuplicate!1312 (List!16799) Bool)

(assert (=> b!861038 (= res!584844 (not (noDuplicate!1312 Nil!16796)))))

(declare-fun b!861039 () Bool)

(declare-fun e!479887 () Bool)

(declare-fun tp_is_empty!16609 () Bool)

(assert (=> b!861039 (= e!479887 tp_is_empty!16609)))

(declare-fun b!861040 () Bool)

(assert (=> b!861040 (= e!479884 true)))

(declare-fun lt!388021 () Bool)

(assert (=> b!861040 (= lt!388021 (contains!4207 Nil!16796 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!26513 () Bool)

(declare-fun tp!50923 () Bool)

(assert (=> mapNonEmpty!26513 (= mapRes!26513 (and tp!50923 e!479887))))

(declare-fun mapKey!26513 () (_ BitVec 32))

(declare-fun mapValue!26513 () ValueCell!7865)

(declare-fun mapRest!26513 () (Array (_ BitVec 32) ValueCell!7865))

(assert (=> mapNonEmpty!26513 (= (arr!23749 _values!688) (store mapRest!26513 mapKey!26513 mapValue!26513))))

(declare-fun res!584842 () Bool)

(assert (=> start!73726 (=> (not res!584842) (not e!479882))))

(assert (=> start!73726 (= res!584842 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24191 _keys!868))))))

(assert (=> start!73726 e!479882))

(assert (=> start!73726 tp_is_empty!16609))

(assert (=> start!73726 true))

(assert (=> start!73726 tp!50924))

(declare-fun array_inv!18850 (array!49447) Bool)

(assert (=> start!73726 (array_inv!18850 _keys!868)))

(declare-fun array_inv!18851 (array!49445) Bool)

(assert (=> start!73726 (and (array_inv!18851 _values!688) e!479886)))

(declare-fun b!861041 () Bool)

(declare-fun res!584841 () Bool)

(assert (=> b!861041 (=> (not res!584841) (not e!479882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861041 (= res!584841 (validKeyInArray!0 k0!854))))

(declare-fun b!861042 () Bool)

(declare-fun res!584845 () Bool)

(assert (=> b!861042 (=> (not res!584845) (not e!479882))))

(assert (=> b!861042 (= res!584845 (and (= (select (arr!23750 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861043 () Bool)

(declare-fun res!584837 () Bool)

(assert (=> b!861043 (=> (not res!584837) (not e!479882))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861043 (= res!584837 (validMask!0 mask!1196))))

(declare-fun b!861044 () Bool)

(declare-fun e!479885 () Bool)

(declare-fun e!479889 () Bool)

(assert (=> b!861044 (= e!479885 (not e!479889))))

(declare-fun res!584838 () Bool)

(assert (=> b!861044 (=> res!584838 e!479889)))

(assert (=> b!861044 (= res!584838 (not (validKeyInArray!0 (select (arr!23750 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!10960 0))(
  ( (tuple2!10961 (_1!5491 (_ BitVec 64)) (_2!5491 V!27193)) )
))
(declare-datatypes ((List!16800 0))(
  ( (Nil!16797) (Cons!16796 (h!17933 tuple2!10960) (t!23531 List!16800)) )
))
(declare-datatypes ((ListLongMap!9731 0))(
  ( (ListLongMap!9732 (toList!4881 List!16800)) )
))
(declare-fun lt!388020 () ListLongMap!9731)

(declare-fun lt!388022 () ListLongMap!9731)

(assert (=> b!861044 (= lt!388020 lt!388022)))

(declare-fun lt!388017 () ListLongMap!9731)

(declare-fun v!557 () V!27193)

(declare-fun +!2285 (ListLongMap!9731 tuple2!10960) ListLongMap!9731)

(assert (=> b!861044 (= lt!388022 (+!2285 lt!388017 (tuple2!10961 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388019 () array!49445)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27193)

(declare-fun zeroValue!654 () V!27193)

(declare-fun getCurrentListMapNoExtraKeys!2934 (array!49447 array!49445 (_ BitVec 32) (_ BitVec 32) V!27193 V!27193 (_ BitVec 32) Int) ListLongMap!9731)

(assert (=> b!861044 (= lt!388020 (getCurrentListMapNoExtraKeys!2934 _keys!868 lt!388019 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861044 (= lt!388017 (getCurrentListMapNoExtraKeys!2934 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388025 () Unit!29322)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!477 (array!49447 array!49445 (_ BitVec 32) (_ BitVec 32) V!27193 V!27193 (_ BitVec 32) (_ BitVec 64) V!27193 (_ BitVec 32) Int) Unit!29322)

(assert (=> b!861044 (= lt!388025 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!477 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861045 () Bool)

(declare-fun res!584843 () Bool)

(assert (=> b!861045 (=> (not res!584843) (not e!479882))))

(assert (=> b!861045 (= res!584843 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16796))))

(declare-fun b!861046 () Bool)

(assert (=> b!861046 (= e!479889 e!479890)))

(declare-fun res!584835 () Bool)

(assert (=> b!861046 (=> res!584835 e!479890)))

(assert (=> b!861046 (= res!584835 (not (= (select (arr!23750 _keys!868) from!1053) k0!854)))))

(declare-fun lt!388018 () ListLongMap!9731)

(declare-fun get!12526 (ValueCell!7865 V!27193) V!27193)

(declare-fun dynLambda!1118 (Int (_ BitVec 64)) V!27193)

(assert (=> b!861046 (= lt!388018 (+!2285 lt!388022 (tuple2!10961 (select (arr!23750 _keys!868) from!1053) (get!12526 (select (arr!23749 _values!688) from!1053) (dynLambda!1118 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861047 () Bool)

(declare-fun res!584840 () Bool)

(assert (=> b!861047 (=> (not res!584840) (not e!479882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49447 (_ BitVec 32)) Bool)

(assert (=> b!861047 (= res!584840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861048 () Bool)

(assert (=> b!861048 (= e!479883 tp_is_empty!16609)))

(declare-fun b!861049 () Bool)

(declare-fun res!584846 () Bool)

(assert (=> b!861049 (=> (not res!584846) (not e!479882))))

(assert (=> b!861049 (= res!584846 (and (= (size!24190 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24191 _keys!868) (size!24190 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861050 () Bool)

(assert (=> b!861050 (= e!479882 e!479885)))

(declare-fun res!584847 () Bool)

(assert (=> b!861050 (=> (not res!584847) (not e!479885))))

(assert (=> b!861050 (= res!584847 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!861050 (= lt!388018 (getCurrentListMapNoExtraKeys!2934 _keys!868 lt!388019 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861050 (= lt!388019 (array!49446 (store (arr!23749 _values!688) i!612 (ValueCellFull!7865 v!557)) (size!24190 _values!688)))))

(declare-fun lt!388024 () ListLongMap!9731)

(assert (=> b!861050 (= lt!388024 (getCurrentListMapNoExtraKeys!2934 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73726 res!584842) b!861043))

(assert (= (and b!861043 res!584837) b!861049))

(assert (= (and b!861049 res!584846) b!861047))

(assert (= (and b!861047 res!584840) b!861045))

(assert (= (and b!861045 res!584843) b!861037))

(assert (= (and b!861037 res!584839) b!861041))

(assert (= (and b!861041 res!584841) b!861042))

(assert (= (and b!861042 res!584845) b!861050))

(assert (= (and b!861050 res!584847) b!861044))

(assert (= (and b!861044 (not res!584838)) b!861046))

(assert (= (and b!861046 (not res!584835)) b!861036))

(assert (= (and b!861036 (not res!584836)) b!861038))

(assert (= (and b!861038 (not res!584844)) b!861034))

(assert (= (and b!861034 (not res!584848)) b!861040))

(assert (= (and b!861035 condMapEmpty!26513) mapIsEmpty!26513))

(assert (= (and b!861035 (not condMapEmpty!26513)) mapNonEmpty!26513))

(get-info :version)

(assert (= (and mapNonEmpty!26513 ((_ is ValueCellFull!7865) mapValue!26513)) b!861039))

(assert (= (and b!861035 ((_ is ValueCellFull!7865) mapDefault!26513)) b!861048))

(assert (= start!73726 b!861035))

(declare-fun b_lambda!11839 () Bool)

(assert (=> (not b_lambda!11839) (not b!861046)))

(declare-fun t!23529 () Bool)

(declare-fun tb!4587 () Bool)

(assert (=> (and start!73726 (= defaultEntry!696 defaultEntry!696) t!23529) tb!4587))

(declare-fun result!8793 () Bool)

(assert (=> tb!4587 (= result!8793 tp_is_empty!16609)))

(assert (=> b!861046 t!23529))

(declare-fun b_and!23937 () Bool)

(assert (= b_and!23935 (and (=> t!23529 result!8793) b_and!23937)))

(declare-fun m!802211 () Bool)

(assert (=> b!861050 m!802211))

(declare-fun m!802213 () Bool)

(assert (=> b!861050 m!802213))

(declare-fun m!802215 () Bool)

(assert (=> b!861050 m!802215))

(declare-fun m!802217 () Bool)

(assert (=> b!861042 m!802217))

(declare-fun m!802219 () Bool)

(assert (=> b!861044 m!802219))

(declare-fun m!802221 () Bool)

(assert (=> b!861044 m!802221))

(declare-fun m!802223 () Bool)

(assert (=> b!861044 m!802223))

(declare-fun m!802225 () Bool)

(assert (=> b!861044 m!802225))

(assert (=> b!861044 m!802223))

(declare-fun m!802227 () Bool)

(assert (=> b!861044 m!802227))

(declare-fun m!802229 () Bool)

(assert (=> b!861044 m!802229))

(declare-fun m!802231 () Bool)

(assert (=> b!861034 m!802231))

(declare-fun m!802233 () Bool)

(assert (=> mapNonEmpty!26513 m!802233))

(declare-fun m!802235 () Bool)

(assert (=> b!861040 m!802235))

(declare-fun m!802237 () Bool)

(assert (=> b!861045 m!802237))

(declare-fun m!802239 () Bool)

(assert (=> start!73726 m!802239))

(declare-fun m!802241 () Bool)

(assert (=> start!73726 m!802241))

(declare-fun m!802243 () Bool)

(assert (=> b!861046 m!802243))

(declare-fun m!802245 () Bool)

(assert (=> b!861046 m!802245))

(declare-fun m!802247 () Bool)

(assert (=> b!861046 m!802247))

(declare-fun m!802249 () Bool)

(assert (=> b!861046 m!802249))

(assert (=> b!861046 m!802245))

(assert (=> b!861046 m!802223))

(assert (=> b!861046 m!802247))

(declare-fun m!802251 () Bool)

(assert (=> b!861038 m!802251))

(declare-fun m!802253 () Bool)

(assert (=> b!861043 m!802253))

(declare-fun m!802255 () Bool)

(assert (=> b!861041 m!802255))

(declare-fun m!802257 () Bool)

(assert (=> b!861047 m!802257))

(declare-fun m!802259 () Bool)

(assert (=> b!861036 m!802259))

(declare-fun m!802261 () Bool)

(assert (=> b!861036 m!802261))

(declare-fun m!802263 () Bool)

(assert (=> b!861036 m!802263))

(declare-fun m!802265 () Bool)

(assert (=> b!861036 m!802265))

(check-sat b_and!23937 (not start!73726) (not b!861043) (not b!861046) (not b!861036) (not b!861044) (not b!861041) (not b!861034) (not b!861040) (not b!861045) (not b_lambda!11839) (not b!861050) (not b!861038) (not b_next!14473) tp_is_empty!16609 (not b!861047) (not mapNonEmpty!26513))
(check-sat b_and!23937 (not b_next!14473))
