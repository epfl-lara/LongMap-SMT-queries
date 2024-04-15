; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73612 () Bool)

(assert start!73612)

(declare-fun b_free!14545 () Bool)

(declare-fun b_next!14545 () Bool)

(assert (=> start!73612 (= b_free!14545 (not b_next!14545))))

(declare-fun tp!51140 () Bool)

(declare-fun b_and!24043 () Bool)

(assert (=> start!73612 (= tp!51140 b_and!24043)))

(declare-fun b!861652 () Bool)

(declare-fun e!480050 () Bool)

(declare-fun tp_is_empty!16681 () Bool)

(assert (=> b!861652 (= e!480050 tp_is_empty!16681)))

(declare-fun b!861653 () Bool)

(declare-fun res!585597 () Bool)

(declare-fun e!480053 () Bool)

(assert (=> b!861653 (=> (not res!585597) (not e!480053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49517 0))(
  ( (array!49518 (arr!23790 (Array (_ BitVec 32) (_ BitVec 64))) (size!24232 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49517)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861653 (= res!585597 (and (= (select (arr!23790 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861654 () Bool)

(declare-fun e!480052 () Bool)

(declare-fun e!480056 () Bool)

(assert (=> b!861654 (= e!480052 (not e!480056))))

(declare-fun res!585601 () Bool)

(assert (=> b!861654 (=> res!585601 e!480056)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861654 (= res!585601 (not (validKeyInArray!0 (select (arr!23790 _keys!868) from!1053))))))

(declare-datatypes ((V!27289 0))(
  ( (V!27290 (val!8388 Int)) )
))
(declare-datatypes ((tuple2!11102 0))(
  ( (tuple2!11103 (_1!5562 (_ BitVec 64)) (_2!5562 V!27289)) )
))
(declare-datatypes ((List!16899 0))(
  ( (Nil!16896) (Cons!16895 (h!18026 tuple2!11102) (t!23701 List!16899)) )
))
(declare-datatypes ((ListLongMap!9861 0))(
  ( (ListLongMap!9862 (toList!4946 List!16899)) )
))
(declare-fun lt!388578 () ListLongMap!9861)

(declare-fun lt!388576 () ListLongMap!9861)

(assert (=> b!861654 (= lt!388578 lt!388576)))

(declare-fun v!557 () V!27289)

(declare-fun lt!388573 () ListLongMap!9861)

(declare-fun +!2315 (ListLongMap!9861 tuple2!11102) ListLongMap!9861)

(assert (=> b!861654 (= lt!388576 (+!2315 lt!388573 (tuple2!11103 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7901 0))(
  ( (ValueCellFull!7901 (v!10807 V!27289)) (EmptyCell!7901) )
))
(declare-datatypes ((array!49519 0))(
  ( (array!49520 (arr!23791 (Array (_ BitVec 32) ValueCell!7901)) (size!24233 (_ BitVec 32))) )
))
(declare-fun lt!388579 () array!49519)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27289)

(declare-fun zeroValue!654 () V!27289)

(declare-fun getCurrentListMapNoExtraKeys!2949 (array!49517 array!49519 (_ BitVec 32) (_ BitVec 32) V!27289 V!27289 (_ BitVec 32) Int) ListLongMap!9861)

(assert (=> b!861654 (= lt!388578 (getCurrentListMapNoExtraKeys!2949 _keys!868 lt!388579 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49519)

(assert (=> b!861654 (= lt!388573 (getCurrentListMapNoExtraKeys!2949 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29338 0))(
  ( (Unit!29339) )
))
(declare-fun lt!388580 () Unit!29338)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!504 (array!49517 array!49519 (_ BitVec 32) (_ BitVec 32) V!27289 V!27289 (_ BitVec 32) (_ BitVec 64) V!27289 (_ BitVec 32) Int) Unit!29338)

(assert (=> b!861654 (= lt!388580 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!504 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!585604 () Bool)

(assert (=> start!73612 (=> (not res!585604) (not e!480053))))

(assert (=> start!73612 (= res!585604 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24232 _keys!868))))))

(assert (=> start!73612 e!480053))

(assert (=> start!73612 tp_is_empty!16681))

(assert (=> start!73612 true))

(assert (=> start!73612 tp!51140))

(declare-fun array_inv!18898 (array!49517) Bool)

(assert (=> start!73612 (array_inv!18898 _keys!868)))

(declare-fun e!480055 () Bool)

(declare-fun array_inv!18899 (array!49519) Bool)

(assert (=> start!73612 (and (array_inv!18899 _values!688) e!480055)))

(declare-fun b!861655 () Bool)

(declare-fun res!585606 () Bool)

(assert (=> b!861655 (=> (not res!585606) (not e!480053))))

(assert (=> b!861655 (= res!585606 (validKeyInArray!0 k0!854))))

(declare-fun b!861656 () Bool)

(declare-fun res!585598 () Bool)

(assert (=> b!861656 (=> (not res!585598) (not e!480053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49517 (_ BitVec 32)) Bool)

(assert (=> b!861656 (= res!585598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861657 () Bool)

(assert (=> b!861657 (= e!480053 e!480052)))

(declare-fun res!585599 () Bool)

(assert (=> b!861657 (=> (not res!585599) (not e!480052))))

(assert (=> b!861657 (= res!585599 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388577 () ListLongMap!9861)

(assert (=> b!861657 (= lt!388577 (getCurrentListMapNoExtraKeys!2949 _keys!868 lt!388579 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861657 (= lt!388579 (array!49520 (store (arr!23791 _values!688) i!612 (ValueCellFull!7901 v!557)) (size!24233 _values!688)))))

(declare-fun lt!388582 () ListLongMap!9861)

(assert (=> b!861657 (= lt!388582 (getCurrentListMapNoExtraKeys!2949 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861658 () Bool)

(declare-fun e!480051 () Bool)

(assert (=> b!861658 (= e!480051 tp_is_empty!16681)))

(declare-fun mapNonEmpty!26621 () Bool)

(declare-fun mapRes!26621 () Bool)

(declare-fun tp!51139 () Bool)

(assert (=> mapNonEmpty!26621 (= mapRes!26621 (and tp!51139 e!480050))))

(declare-fun mapKey!26621 () (_ BitVec 32))

(declare-fun mapValue!26621 () ValueCell!7901)

(declare-fun mapRest!26621 () (Array (_ BitVec 32) ValueCell!7901))

(assert (=> mapNonEmpty!26621 (= (arr!23791 _values!688) (store mapRest!26621 mapKey!26621 mapValue!26621))))

(declare-fun b!861659 () Bool)

(declare-fun res!585605 () Bool)

(assert (=> b!861659 (=> (not res!585605) (not e!480053))))

(assert (=> b!861659 (= res!585605 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24232 _keys!868))))))

(declare-fun b!861660 () Bool)

(declare-fun e!480057 () Unit!29338)

(declare-fun Unit!29340 () Unit!29338)

(assert (=> b!861660 (= e!480057 Unit!29340)))

(declare-fun lt!388574 () Unit!29338)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49517 (_ BitVec 32) (_ BitVec 32)) Unit!29338)

(assert (=> b!861660 (= lt!388574 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16900 0))(
  ( (Nil!16897) (Cons!16896 (h!18027 (_ BitVec 64)) (t!23702 List!16900)) )
))
(declare-fun arrayNoDuplicates!0 (array!49517 (_ BitVec 32) List!16900) Bool)

(assert (=> b!861660 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16897)))

(declare-fun lt!388581 () Unit!29338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49517 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29338)

(assert (=> b!861660 (= lt!388581 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861660 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388575 () Unit!29338)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49517 (_ BitVec 64) (_ BitVec 32) List!16900) Unit!29338)

(assert (=> b!861660 (= lt!388575 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16897))))

(assert (=> b!861660 false))

(declare-fun b!861661 () Bool)

(declare-fun Unit!29341 () Unit!29338)

(assert (=> b!861661 (= e!480057 Unit!29341)))

(declare-fun b!861662 () Bool)

(declare-fun res!585600 () Bool)

(assert (=> b!861662 (=> (not res!585600) (not e!480053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861662 (= res!585600 (validMask!0 mask!1196))))

(declare-fun b!861663 () Bool)

(declare-fun res!585602 () Bool)

(assert (=> b!861663 (=> (not res!585602) (not e!480053))))

(assert (=> b!861663 (= res!585602 (and (= (size!24233 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24232 _keys!868) (size!24233 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861664 () Bool)

(assert (=> b!861664 (= e!480056 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24232 _keys!868))))))

(assert (=> b!861664 (not (= (select (arr!23790 _keys!868) from!1053) k0!854))))

(declare-fun lt!388583 () Unit!29338)

(assert (=> b!861664 (= lt!388583 e!480057)))

(declare-fun c!91973 () Bool)

(assert (=> b!861664 (= c!91973 (= (select (arr!23790 _keys!868) from!1053) k0!854))))

(declare-fun get!12552 (ValueCell!7901 V!27289) V!27289)

(declare-fun dynLambda!1123 (Int (_ BitVec 64)) V!27289)

(assert (=> b!861664 (= lt!388577 (+!2315 lt!388576 (tuple2!11103 (select (arr!23790 _keys!868) from!1053) (get!12552 (select (arr!23791 _values!688) from!1053) (dynLambda!1123 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861665 () Bool)

(declare-fun res!585603 () Bool)

(assert (=> b!861665 (=> (not res!585603) (not e!480053))))

(assert (=> b!861665 (= res!585603 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16897))))

(declare-fun mapIsEmpty!26621 () Bool)

(assert (=> mapIsEmpty!26621 mapRes!26621))

(declare-fun b!861666 () Bool)

(assert (=> b!861666 (= e!480055 (and e!480051 mapRes!26621))))

(declare-fun condMapEmpty!26621 () Bool)

(declare-fun mapDefault!26621 () ValueCell!7901)

(assert (=> b!861666 (= condMapEmpty!26621 (= (arr!23791 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7901)) mapDefault!26621)))))

(assert (= (and start!73612 res!585604) b!861662))

(assert (= (and b!861662 res!585600) b!861663))

(assert (= (and b!861663 res!585602) b!861656))

(assert (= (and b!861656 res!585598) b!861665))

(assert (= (and b!861665 res!585603) b!861659))

(assert (= (and b!861659 res!585605) b!861655))

(assert (= (and b!861655 res!585606) b!861653))

(assert (= (and b!861653 res!585597) b!861657))

(assert (= (and b!861657 res!585599) b!861654))

(assert (= (and b!861654 (not res!585601)) b!861664))

(assert (= (and b!861664 c!91973) b!861660))

(assert (= (and b!861664 (not c!91973)) b!861661))

(assert (= (and b!861666 condMapEmpty!26621) mapIsEmpty!26621))

(assert (= (and b!861666 (not condMapEmpty!26621)) mapNonEmpty!26621))

(get-info :version)

(assert (= (and mapNonEmpty!26621 ((_ is ValueCellFull!7901) mapValue!26621)) b!861652))

(assert (= (and b!861666 ((_ is ValueCellFull!7901) mapDefault!26621)) b!861658))

(assert (= start!73612 b!861666))

(declare-fun b_lambda!11879 () Bool)

(assert (=> (not b_lambda!11879) (not b!861664)))

(declare-fun t!23700 () Bool)

(declare-fun tb!4659 () Bool)

(assert (=> (and start!73612 (= defaultEntry!696 defaultEntry!696) t!23700) tb!4659))

(declare-fun result!8937 () Bool)

(assert (=> tb!4659 (= result!8937 tp_is_empty!16681)))

(assert (=> b!861664 t!23700))

(declare-fun b_and!24045 () Bool)

(assert (= b_and!24043 (and (=> t!23700 result!8937) b_and!24045)))

(declare-fun m!802083 () Bool)

(assert (=> b!861662 m!802083))

(declare-fun m!802085 () Bool)

(assert (=> b!861660 m!802085))

(declare-fun m!802087 () Bool)

(assert (=> b!861660 m!802087))

(declare-fun m!802089 () Bool)

(assert (=> b!861660 m!802089))

(declare-fun m!802091 () Bool)

(assert (=> b!861660 m!802091))

(declare-fun m!802093 () Bool)

(assert (=> b!861660 m!802093))

(declare-fun m!802095 () Bool)

(assert (=> b!861664 m!802095))

(declare-fun m!802097 () Bool)

(assert (=> b!861664 m!802097))

(declare-fun m!802099 () Bool)

(assert (=> b!861664 m!802099))

(declare-fun m!802101 () Bool)

(assert (=> b!861664 m!802101))

(assert (=> b!861664 m!802097))

(declare-fun m!802103 () Bool)

(assert (=> b!861664 m!802103))

(assert (=> b!861664 m!802099))

(declare-fun m!802105 () Bool)

(assert (=> b!861653 m!802105))

(declare-fun m!802107 () Bool)

(assert (=> mapNonEmpty!26621 m!802107))

(declare-fun m!802109 () Bool)

(assert (=> b!861655 m!802109))

(declare-fun m!802111 () Bool)

(assert (=> b!861657 m!802111))

(declare-fun m!802113 () Bool)

(assert (=> b!861657 m!802113))

(declare-fun m!802115 () Bool)

(assert (=> b!861657 m!802115))

(declare-fun m!802117 () Bool)

(assert (=> b!861665 m!802117))

(declare-fun m!802119 () Bool)

(assert (=> b!861654 m!802119))

(declare-fun m!802121 () Bool)

(assert (=> b!861654 m!802121))

(assert (=> b!861654 m!802103))

(declare-fun m!802123 () Bool)

(assert (=> b!861654 m!802123))

(assert (=> b!861654 m!802103))

(declare-fun m!802125 () Bool)

(assert (=> b!861654 m!802125))

(declare-fun m!802127 () Bool)

(assert (=> b!861654 m!802127))

(declare-fun m!802129 () Bool)

(assert (=> b!861656 m!802129))

(declare-fun m!802131 () Bool)

(assert (=> start!73612 m!802131))

(declare-fun m!802133 () Bool)

(assert (=> start!73612 m!802133))

(check-sat (not b_lambda!11879) (not b!861662) (not start!73612) b_and!24045 (not b!861654) (not b!861664) (not b!861665) (not b_next!14545) (not b!861656) (not b!861660) (not b!861655) (not mapNonEmpty!26621) tp_is_empty!16681 (not b!861657))
(check-sat b_and!24045 (not b_next!14545))
