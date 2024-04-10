; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73476 () Bool)

(assert start!73476)

(declare-fun b_free!14391 () Bool)

(declare-fun b_next!14391 () Bool)

(assert (=> start!73476 (= b_free!14391 (not b_next!14391))))

(declare-fun tp!50677 () Bool)

(declare-fun b_and!23761 () Bool)

(assert (=> start!73476 (= tp!50677 b_and!23761)))

(declare-fun b!858208 () Bool)

(declare-fun res!583019 () Bool)

(declare-fun e!478294 () Bool)

(assert (=> b!858208 (=> (not res!583019) (not e!478294))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858208 (= res!583019 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26390 () Bool)

(declare-fun mapRes!26390 () Bool)

(assert (=> mapIsEmpty!26390 mapRes!26390))

(declare-fun res!583021 () Bool)

(assert (=> start!73476 (=> (not res!583021) (not e!478294))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49242 0))(
  ( (array!49243 (arr!23652 (Array (_ BitVec 32) (_ BitVec 64))) (size!24092 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49242)

(assert (=> start!73476 (= res!583021 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24092 _keys!868))))))

(assert (=> start!73476 e!478294))

(declare-fun tp_is_empty!16527 () Bool)

(assert (=> start!73476 tp_is_empty!16527))

(assert (=> start!73476 true))

(assert (=> start!73476 tp!50677))

(declare-fun array_inv!18734 (array!49242) Bool)

(assert (=> start!73476 (array_inv!18734 _keys!868)))

(declare-datatypes ((V!27083 0))(
  ( (V!27084 (val!8311 Int)) )
))
(declare-datatypes ((ValueCell!7824 0))(
  ( (ValueCellFull!7824 (v!10736 V!27083)) (EmptyCell!7824) )
))
(declare-datatypes ((array!49244 0))(
  ( (array!49245 (arr!23653 (Array (_ BitVec 32) ValueCell!7824)) (size!24093 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49244)

(declare-fun e!478295 () Bool)

(declare-fun array_inv!18735 (array!49244) Bool)

(assert (=> start!73476 (and (array_inv!18735 _values!688) e!478295)))

(declare-fun b!858209 () Bool)

(declare-fun e!478292 () Bool)

(assert (=> b!858209 (= e!478295 (and e!478292 mapRes!26390))))

(declare-fun condMapEmpty!26390 () Bool)

(declare-fun mapDefault!26390 () ValueCell!7824)

(assert (=> b!858209 (= condMapEmpty!26390 (= (arr!23653 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7824)) mapDefault!26390)))))

(declare-fun mapNonEmpty!26390 () Bool)

(declare-fun tp!50676 () Bool)

(declare-fun e!478291 () Bool)

(assert (=> mapNonEmpty!26390 (= mapRes!26390 (and tp!50676 e!478291))))

(declare-fun mapRest!26390 () (Array (_ BitVec 32) ValueCell!7824))

(declare-fun mapKey!26390 () (_ BitVec 32))

(declare-fun mapValue!26390 () ValueCell!7824)

(assert (=> mapNonEmpty!26390 (= (arr!23653 _values!688) (store mapRest!26390 mapKey!26390 mapValue!26390))))

(declare-fun b!858210 () Bool)

(assert (=> b!858210 (= e!478291 tp_is_empty!16527)))

(declare-fun b!858211 () Bool)

(declare-fun res!583027 () Bool)

(assert (=> b!858211 (=> (not res!583027) (not e!478294))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858211 (= res!583027 (validKeyInArray!0 k0!854))))

(declare-fun b!858212 () Bool)

(declare-fun e!478293 () Bool)

(assert (=> b!858212 (= e!478293 true)))

(declare-datatypes ((tuple2!10972 0))(
  ( (tuple2!10973 (_1!5497 (_ BitVec 64)) (_2!5497 V!27083)) )
))
(declare-datatypes ((List!16779 0))(
  ( (Nil!16776) (Cons!16775 (h!17906 tuple2!10972) (t!23436 List!16779)) )
))
(declare-datatypes ((ListLongMap!9741 0))(
  ( (ListLongMap!9742 (toList!4886 List!16779)) )
))
(declare-fun lt!386604 () ListLongMap!9741)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386603 () ListLongMap!9741)

(declare-fun +!2239 (ListLongMap!9741 tuple2!10972) ListLongMap!9741)

(declare-fun get!12453 (ValueCell!7824 V!27083) V!27083)

(declare-fun dynLambda!1079 (Int (_ BitVec 64)) V!27083)

(assert (=> b!858212 (= lt!386604 (+!2239 lt!386603 (tuple2!10973 (select (arr!23652 _keys!868) from!1053) (get!12453 (select (arr!23653 _values!688) from!1053) (dynLambda!1079 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858213 () Bool)

(declare-fun res!583023 () Bool)

(assert (=> b!858213 (=> (not res!583023) (not e!478294))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!858213 (= res!583023 (and (= (size!24093 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24092 _keys!868) (size!24093 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858214 () Bool)

(declare-fun e!478296 () Bool)

(assert (=> b!858214 (= e!478294 e!478296)))

(declare-fun res!583022 () Bool)

(assert (=> b!858214 (=> (not res!583022) (not e!478296))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858214 (= res!583022 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386599 () array!49244)

(declare-fun minValue!654 () V!27083)

(declare-fun zeroValue!654 () V!27083)

(declare-fun getCurrentListMapNoExtraKeys!2867 (array!49242 array!49244 (_ BitVec 32) (_ BitVec 32) V!27083 V!27083 (_ BitVec 32) Int) ListLongMap!9741)

(assert (=> b!858214 (= lt!386604 (getCurrentListMapNoExtraKeys!2867 _keys!868 lt!386599 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27083)

(assert (=> b!858214 (= lt!386599 (array!49245 (store (arr!23653 _values!688) i!612 (ValueCellFull!7824 v!557)) (size!24093 _values!688)))))

(declare-fun lt!386601 () ListLongMap!9741)

(assert (=> b!858214 (= lt!386601 (getCurrentListMapNoExtraKeys!2867 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858215 () Bool)

(assert (=> b!858215 (= e!478296 (not e!478293))))

(declare-fun res!583020 () Bool)

(assert (=> b!858215 (=> res!583020 e!478293)))

(assert (=> b!858215 (= res!583020 (not (validKeyInArray!0 (select (arr!23652 _keys!868) from!1053))))))

(declare-fun lt!386600 () ListLongMap!9741)

(assert (=> b!858215 (= lt!386600 lt!386603)))

(declare-fun lt!386605 () ListLongMap!9741)

(assert (=> b!858215 (= lt!386603 (+!2239 lt!386605 (tuple2!10973 k0!854 v!557)))))

(assert (=> b!858215 (= lt!386600 (getCurrentListMapNoExtraKeys!2867 _keys!868 lt!386599 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858215 (= lt!386605 (getCurrentListMapNoExtraKeys!2867 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29263 0))(
  ( (Unit!29264) )
))
(declare-fun lt!386602 () Unit!29263)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!459 (array!49242 array!49244 (_ BitVec 32) (_ BitVec 32) V!27083 V!27083 (_ BitVec 32) (_ BitVec 64) V!27083 (_ BitVec 32) Int) Unit!29263)

(assert (=> b!858215 (= lt!386602 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!459 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858216 () Bool)

(declare-fun res!583026 () Bool)

(assert (=> b!858216 (=> (not res!583026) (not e!478294))))

(assert (=> b!858216 (= res!583026 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24092 _keys!868))))))

(declare-fun b!858217 () Bool)

(declare-fun res!583025 () Bool)

(assert (=> b!858217 (=> (not res!583025) (not e!478294))))

(assert (=> b!858217 (= res!583025 (and (= (select (arr!23652 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858218 () Bool)

(declare-fun res!583024 () Bool)

(assert (=> b!858218 (=> (not res!583024) (not e!478294))))

(declare-datatypes ((List!16780 0))(
  ( (Nil!16777) (Cons!16776 (h!17907 (_ BitVec 64)) (t!23437 List!16780)) )
))
(declare-fun arrayNoDuplicates!0 (array!49242 (_ BitVec 32) List!16780) Bool)

(assert (=> b!858218 (= res!583024 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16777))))

(declare-fun b!858219 () Bool)

(declare-fun res!583028 () Bool)

(assert (=> b!858219 (=> (not res!583028) (not e!478294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49242 (_ BitVec 32)) Bool)

(assert (=> b!858219 (= res!583028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858220 () Bool)

(assert (=> b!858220 (= e!478292 tp_is_empty!16527)))

(assert (= (and start!73476 res!583021) b!858208))

(assert (= (and b!858208 res!583019) b!858213))

(assert (= (and b!858213 res!583023) b!858219))

(assert (= (and b!858219 res!583028) b!858218))

(assert (= (and b!858218 res!583024) b!858216))

(assert (= (and b!858216 res!583026) b!858211))

(assert (= (and b!858211 res!583027) b!858217))

(assert (= (and b!858217 res!583025) b!858214))

(assert (= (and b!858214 res!583022) b!858215))

(assert (= (and b!858215 (not res!583020)) b!858212))

(assert (= (and b!858209 condMapEmpty!26390) mapIsEmpty!26390))

(assert (= (and b!858209 (not condMapEmpty!26390)) mapNonEmpty!26390))

(get-info :version)

(assert (= (and mapNonEmpty!26390 ((_ is ValueCellFull!7824) mapValue!26390)) b!858210))

(assert (= (and b!858209 ((_ is ValueCellFull!7824) mapDefault!26390)) b!858220))

(assert (= start!73476 b!858209))

(declare-fun b_lambda!11743 () Bool)

(assert (=> (not b_lambda!11743) (not b!858212)))

(declare-fun t!23435 () Bool)

(declare-fun tb!4513 () Bool)

(assert (=> (and start!73476 (= defaultEntry!696 defaultEntry!696) t!23435) tb!4513))

(declare-fun result!8637 () Bool)

(assert (=> tb!4513 (= result!8637 tp_is_empty!16527)))

(assert (=> b!858212 t!23435))

(declare-fun b_and!23763 () Bool)

(assert (= b_and!23761 (and (=> t!23435 result!8637) b_and!23763)))

(declare-fun m!798917 () Bool)

(assert (=> b!858208 m!798917))

(declare-fun m!798919 () Bool)

(assert (=> b!858219 m!798919))

(declare-fun m!798921 () Bool)

(assert (=> b!858215 m!798921))

(declare-fun m!798923 () Bool)

(assert (=> b!858215 m!798923))

(declare-fun m!798925 () Bool)

(assert (=> b!858215 m!798925))

(assert (=> b!858215 m!798923))

(declare-fun m!798927 () Bool)

(assert (=> b!858215 m!798927))

(declare-fun m!798929 () Bool)

(assert (=> b!858215 m!798929))

(declare-fun m!798931 () Bool)

(assert (=> b!858215 m!798931))

(declare-fun m!798933 () Bool)

(assert (=> b!858217 m!798933))

(declare-fun m!798935 () Bool)

(assert (=> b!858218 m!798935))

(declare-fun m!798937 () Bool)

(assert (=> start!73476 m!798937))

(declare-fun m!798939 () Bool)

(assert (=> start!73476 m!798939))

(declare-fun m!798941 () Bool)

(assert (=> b!858211 m!798941))

(declare-fun m!798943 () Bool)

(assert (=> b!858212 m!798943))

(declare-fun m!798945 () Bool)

(assert (=> b!858212 m!798945))

(declare-fun m!798947 () Bool)

(assert (=> b!858212 m!798947))

(declare-fun m!798949 () Bool)

(assert (=> b!858212 m!798949))

(assert (=> b!858212 m!798945))

(assert (=> b!858212 m!798923))

(assert (=> b!858212 m!798947))

(declare-fun m!798951 () Bool)

(assert (=> b!858214 m!798951))

(declare-fun m!798953 () Bool)

(assert (=> b!858214 m!798953))

(declare-fun m!798955 () Bool)

(assert (=> b!858214 m!798955))

(declare-fun m!798957 () Bool)

(assert (=> mapNonEmpty!26390 m!798957))

(check-sat b_and!23763 (not b!858214) (not b!858212) (not b!858219) (not mapNonEmpty!26390) (not b!858218) (not start!73476) (not b_lambda!11743) tp_is_empty!16527 (not b_next!14391) (not b!858211) (not b!858208) (not b!858215))
(check-sat b_and!23763 (not b_next!14391))
