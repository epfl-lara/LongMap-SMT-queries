; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73542 () Bool)

(assert start!73542)

(declare-fun b_free!14457 () Bool)

(declare-fun b_next!14457 () Bool)

(assert (=> start!73542 (= b_free!14457 (not b_next!14457))))

(declare-fun tp!50874 () Bool)

(declare-fun b_and!23893 () Bool)

(assert (=> start!73542 (= tp!50874 b_and!23893)))

(declare-fun res!584156 () Bool)

(declare-fun e!479088 () Bool)

(assert (=> start!73542 (=> (not res!584156) (not e!479088))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49362 0))(
  ( (array!49363 (arr!23712 (Array (_ BitVec 32) (_ BitVec 64))) (size!24152 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49362)

(assert (=> start!73542 (= res!584156 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24152 _keys!868))))))

(assert (=> start!73542 e!479088))

(declare-fun tp_is_empty!16593 () Bool)

(assert (=> start!73542 tp_is_empty!16593))

(assert (=> start!73542 true))

(assert (=> start!73542 tp!50874))

(declare-fun array_inv!18772 (array!49362) Bool)

(assert (=> start!73542 (array_inv!18772 _keys!868)))

(declare-datatypes ((V!27171 0))(
  ( (V!27172 (val!8344 Int)) )
))
(declare-datatypes ((ValueCell!7857 0))(
  ( (ValueCellFull!7857 (v!10769 V!27171)) (EmptyCell!7857) )
))
(declare-datatypes ((array!49364 0))(
  ( (array!49365 (arr!23713 (Array (_ BitVec 32) ValueCell!7857)) (size!24153 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49364)

(declare-fun e!479090 () Bool)

(declare-fun array_inv!18773 (array!49364) Bool)

(assert (=> start!73542 (and (array_inv!18773 _values!688) e!479090)))

(declare-fun b!859707 () Bool)

(declare-fun e!479087 () Bool)

(declare-fun mapRes!26489 () Bool)

(assert (=> b!859707 (= e!479090 (and e!479087 mapRes!26489))))

(declare-fun condMapEmpty!26489 () Bool)

(declare-fun mapDefault!26489 () ValueCell!7857)

(assert (=> b!859707 (= condMapEmpty!26489 (= (arr!23713 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7857)) mapDefault!26489)))))

(declare-fun b!859708 () Bool)

(declare-fun e!479085 () Bool)

(declare-fun e!479091 () Bool)

(assert (=> b!859708 (= e!479085 e!479091)))

(declare-fun res!584159 () Bool)

(assert (=> b!859708 (=> res!584159 e!479091)))

(assert (=> b!859708 (= res!584159 (or (bvsge (size!24152 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24152 _keys!868)) (bvsge from!1053 (size!24152 _keys!868))))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!49362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859708 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29309 0))(
  ( (Unit!29310) )
))
(declare-fun lt!387415 () Unit!29309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49362 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29309)

(assert (=> b!859708 (= lt!387415 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!16829 0))(
  ( (Nil!16826) (Cons!16825 (h!17956 (_ BitVec 64)) (t!23552 List!16829)) )
))
(declare-fun arrayNoDuplicates!0 (array!49362 (_ BitVec 32) List!16829) Bool)

(assert (=> b!859708 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16826)))

(declare-fun lt!387418 () Unit!29309)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49362 (_ BitVec 32) (_ BitVec 32)) Unit!29309)

(assert (=> b!859708 (= lt!387418 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859709 () Bool)

(declare-fun res!584163 () Bool)

(assert (=> b!859709 (=> (not res!584163) (not e!479088))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!859709 (= res!584163 (and (= (size!24153 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24152 _keys!868) (size!24153 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859710 () Bool)

(declare-fun e!479084 () Bool)

(assert (=> b!859710 (= e!479084 tp_is_empty!16593)))

(declare-fun b!859711 () Bool)

(declare-fun res!584167 () Bool)

(assert (=> b!859711 (=> res!584167 e!479091)))

(declare-fun noDuplicate!1305 (List!16829) Bool)

(assert (=> b!859711 (= res!584167 (not (noDuplicate!1305 Nil!16826)))))

(declare-fun mapNonEmpty!26489 () Bool)

(declare-fun tp!50875 () Bool)

(assert (=> mapNonEmpty!26489 (= mapRes!26489 (and tp!50875 e!479084))))

(declare-fun mapKey!26489 () (_ BitVec 32))

(declare-fun mapRest!26489 () (Array (_ BitVec 32) ValueCell!7857))

(declare-fun mapValue!26489 () ValueCell!7857)

(assert (=> mapNonEmpty!26489 (= (arr!23713 _values!688) (store mapRest!26489 mapKey!26489 mapValue!26489))))

(declare-fun b!859712 () Bool)

(declare-fun res!584168 () Bool)

(assert (=> b!859712 (=> (not res!584168) (not e!479088))))

(assert (=> b!859712 (= res!584168 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24152 _keys!868))))))

(declare-fun b!859713 () Bool)

(declare-fun e!479086 () Bool)

(assert (=> b!859713 (= e!479086 e!479085)))

(declare-fun res!584162 () Bool)

(assert (=> b!859713 (=> res!584162 e!479085)))

(assert (=> b!859713 (= res!584162 (not (= (select (arr!23712 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!11020 0))(
  ( (tuple2!11021 (_1!5521 (_ BitVec 64)) (_2!5521 V!27171)) )
))
(declare-datatypes ((List!16830 0))(
  ( (Nil!16827) (Cons!16826 (h!17957 tuple2!11020) (t!23553 List!16830)) )
))
(declare-datatypes ((ListLongMap!9789 0))(
  ( (ListLongMap!9790 (toList!4910 List!16830)) )
))
(declare-fun lt!387421 () ListLongMap!9789)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387422 () ListLongMap!9789)

(declare-fun +!2263 (ListLongMap!9789 tuple2!11020) ListLongMap!9789)

(declare-fun get!12497 (ValueCell!7857 V!27171) V!27171)

(declare-fun dynLambda!1101 (Int (_ BitVec 64)) V!27171)

(assert (=> b!859713 (= lt!387422 (+!2263 lt!387421 (tuple2!11021 (select (arr!23712 _keys!868) from!1053) (get!12497 (select (arr!23713 _values!688) from!1053) (dynLambda!1101 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!26489 () Bool)

(assert (=> mapIsEmpty!26489 mapRes!26489))

(declare-fun b!859714 () Bool)

(declare-fun e!479089 () Bool)

(assert (=> b!859714 (= e!479089 (not e!479086))))

(declare-fun res!584157 () Bool)

(assert (=> b!859714 (=> res!584157 e!479086)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859714 (= res!584157 (not (validKeyInArray!0 (select (arr!23712 _keys!868) from!1053))))))

(declare-fun lt!387420 () ListLongMap!9789)

(assert (=> b!859714 (= lt!387420 lt!387421)))

(declare-fun lt!387424 () ListLongMap!9789)

(declare-fun v!557 () V!27171)

(assert (=> b!859714 (= lt!387421 (+!2263 lt!387424 (tuple2!11021 k0!854 v!557)))))

(declare-fun minValue!654 () V!27171)

(declare-fun lt!387423 () array!49364)

(declare-fun zeroValue!654 () V!27171)

(declare-fun getCurrentListMapNoExtraKeys!2888 (array!49362 array!49364 (_ BitVec 32) (_ BitVec 32) V!27171 V!27171 (_ BitVec 32) Int) ListLongMap!9789)

(assert (=> b!859714 (= lt!387420 (getCurrentListMapNoExtraKeys!2888 _keys!868 lt!387423 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859714 (= lt!387424 (getCurrentListMapNoExtraKeys!2888 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387416 () Unit!29309)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!478 (array!49362 array!49364 (_ BitVec 32) (_ BitVec 32) V!27171 V!27171 (_ BitVec 32) (_ BitVec 64) V!27171 (_ BitVec 32) Int) Unit!29309)

(assert (=> b!859714 (= lt!387416 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!478 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859715 () Bool)

(declare-fun res!584160 () Bool)

(assert (=> b!859715 (=> (not res!584160) (not e!479088))))

(assert (=> b!859715 (= res!584160 (validKeyInArray!0 k0!854))))

(declare-fun b!859716 () Bool)

(declare-fun res!584161 () Bool)

(assert (=> b!859716 (=> (not res!584161) (not e!479088))))

(assert (=> b!859716 (= res!584161 (and (= (select (arr!23712 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859717 () Bool)

(declare-fun res!584155 () Bool)

(assert (=> b!859717 (=> (not res!584155) (not e!479088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859717 (= res!584155 (validMask!0 mask!1196))))

(declare-fun b!859718 () Bool)

(declare-fun res!584165 () Bool)

(assert (=> b!859718 (=> (not res!584165) (not e!479088))))

(assert (=> b!859718 (= res!584165 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16826))))

(declare-fun b!859719 () Bool)

(assert (=> b!859719 (= e!479091 true)))

(declare-fun lt!387419 () Bool)

(declare-fun contains!4223 (List!16829 (_ BitVec 64)) Bool)

(assert (=> b!859719 (= lt!387419 (contains!4223 Nil!16826 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859720 () Bool)

(assert (=> b!859720 (= e!479087 tp_is_empty!16593)))

(declare-fun b!859721 () Bool)

(declare-fun res!584166 () Bool)

(assert (=> b!859721 (=> res!584166 e!479091)))

(assert (=> b!859721 (= res!584166 (contains!4223 Nil!16826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859722 () Bool)

(assert (=> b!859722 (= e!479088 e!479089)))

(declare-fun res!584164 () Bool)

(assert (=> b!859722 (=> (not res!584164) (not e!479089))))

(assert (=> b!859722 (= res!584164 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!859722 (= lt!387422 (getCurrentListMapNoExtraKeys!2888 _keys!868 lt!387423 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859722 (= lt!387423 (array!49365 (store (arr!23713 _values!688) i!612 (ValueCellFull!7857 v!557)) (size!24153 _values!688)))))

(declare-fun lt!387417 () ListLongMap!9789)

(assert (=> b!859722 (= lt!387417 (getCurrentListMapNoExtraKeys!2888 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859723 () Bool)

(declare-fun res!584158 () Bool)

(assert (=> b!859723 (=> (not res!584158) (not e!479088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49362 (_ BitVec 32)) Bool)

(assert (=> b!859723 (= res!584158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73542 res!584156) b!859717))

(assert (= (and b!859717 res!584155) b!859709))

(assert (= (and b!859709 res!584163) b!859723))

(assert (= (and b!859723 res!584158) b!859718))

(assert (= (and b!859718 res!584165) b!859712))

(assert (= (and b!859712 res!584168) b!859715))

(assert (= (and b!859715 res!584160) b!859716))

(assert (= (and b!859716 res!584161) b!859722))

(assert (= (and b!859722 res!584164) b!859714))

(assert (= (and b!859714 (not res!584157)) b!859713))

(assert (= (and b!859713 (not res!584162)) b!859708))

(assert (= (and b!859708 (not res!584159)) b!859711))

(assert (= (and b!859711 (not res!584167)) b!859721))

(assert (= (and b!859721 (not res!584166)) b!859719))

(assert (= (and b!859707 condMapEmpty!26489) mapIsEmpty!26489))

(assert (= (and b!859707 (not condMapEmpty!26489)) mapNonEmpty!26489))

(get-info :version)

(assert (= (and mapNonEmpty!26489 ((_ is ValueCellFull!7857) mapValue!26489)) b!859710))

(assert (= (and b!859707 ((_ is ValueCellFull!7857) mapDefault!26489)) b!859720))

(assert (= start!73542 b!859707))

(declare-fun b_lambda!11809 () Bool)

(assert (=> (not b_lambda!11809) (not b!859713)))

(declare-fun t!23551 () Bool)

(declare-fun tb!4579 () Bool)

(assert (=> (and start!73542 (= defaultEntry!696 defaultEntry!696) t!23551) tb!4579))

(declare-fun result!8769 () Bool)

(assert (=> tb!4579 (= result!8769 tp_is_empty!16593)))

(assert (=> b!859713 t!23551))

(declare-fun b_and!23895 () Bool)

(assert (= b_and!23893 (and (=> t!23551 result!8769) b_and!23895)))

(declare-fun m!800473 () Bool)

(assert (=> b!859723 m!800473))

(declare-fun m!800475 () Bool)

(assert (=> b!859718 m!800475))

(declare-fun m!800477 () Bool)

(assert (=> b!859716 m!800477))

(declare-fun m!800479 () Bool)

(assert (=> b!859719 m!800479))

(declare-fun m!800481 () Bool)

(assert (=> b!859722 m!800481))

(declare-fun m!800483 () Bool)

(assert (=> b!859722 m!800483))

(declare-fun m!800485 () Bool)

(assert (=> b!859722 m!800485))

(declare-fun m!800487 () Bool)

(assert (=> b!859714 m!800487))

(declare-fun m!800489 () Bool)

(assert (=> b!859714 m!800489))

(declare-fun m!800491 () Bool)

(assert (=> b!859714 m!800491))

(declare-fun m!800493 () Bool)

(assert (=> b!859714 m!800493))

(declare-fun m!800495 () Bool)

(assert (=> b!859714 m!800495))

(assert (=> b!859714 m!800491))

(declare-fun m!800497 () Bool)

(assert (=> b!859714 m!800497))

(declare-fun m!800499 () Bool)

(assert (=> b!859715 m!800499))

(declare-fun m!800501 () Bool)

(assert (=> b!859717 m!800501))

(declare-fun m!800503 () Bool)

(assert (=> b!859711 m!800503))

(declare-fun m!800505 () Bool)

(assert (=> b!859713 m!800505))

(declare-fun m!800507 () Bool)

(assert (=> b!859713 m!800507))

(declare-fun m!800509 () Bool)

(assert (=> b!859713 m!800509))

(declare-fun m!800511 () Bool)

(assert (=> b!859713 m!800511))

(assert (=> b!859713 m!800507))

(assert (=> b!859713 m!800491))

(assert (=> b!859713 m!800509))

(declare-fun m!800513 () Bool)

(assert (=> b!859721 m!800513))

(declare-fun m!800515 () Bool)

(assert (=> mapNonEmpty!26489 m!800515))

(declare-fun m!800517 () Bool)

(assert (=> b!859708 m!800517))

(declare-fun m!800519 () Bool)

(assert (=> b!859708 m!800519))

(declare-fun m!800521 () Bool)

(assert (=> b!859708 m!800521))

(declare-fun m!800523 () Bool)

(assert (=> b!859708 m!800523))

(declare-fun m!800525 () Bool)

(assert (=> start!73542 m!800525))

(declare-fun m!800527 () Bool)

(assert (=> start!73542 m!800527))

(check-sat b_and!23895 (not b!859719) (not b!859721) (not b!859714) (not b!859708) (not b_lambda!11809) (not b!859711) (not b_next!14457) (not mapNonEmpty!26489) (not b!859715) (not b!859717) (not b!859718) (not b!859713) (not b!859723) tp_is_empty!16593 (not start!73542) (not b!859722))
(check-sat b_and!23895 (not b_next!14457))
