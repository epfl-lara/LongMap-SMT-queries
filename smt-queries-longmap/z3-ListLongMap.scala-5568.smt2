; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73194 () Bool)

(assert start!73194)

(declare-fun b_free!14109 () Bool)

(declare-fun b_next!14109 () Bool)

(assert (=> start!73194 (= b_free!14109 (not b_next!14109))))

(declare-fun tp!49830 () Bool)

(declare-fun b_and!23377 () Bool)

(assert (=> start!73194 (= tp!49830 b_and!23377)))

(declare-fun b!852716 () Bool)

(declare-fun res!579162 () Bool)

(declare-fun e!475571 () Bool)

(assert (=> b!852716 (=> (not res!579162) (not e!475571))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48688 0))(
  ( (array!48689 (arr!23375 (Array (_ BitVec 32) (_ BitVec 64))) (size!23815 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48688)

(assert (=> b!852716 (= res!579162 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23815 _keys!868))))))

(declare-fun b!852717 () Bool)

(declare-fun e!475574 () Bool)

(declare-fun tp_is_empty!16245 () Bool)

(assert (=> b!852717 (= e!475574 tp_is_empty!16245)))

(declare-fun res!579161 () Bool)

(assert (=> start!73194 (=> (not res!579161) (not e!475571))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73194 (= res!579161 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23815 _keys!868))))))

(assert (=> start!73194 e!475571))

(assert (=> start!73194 tp_is_empty!16245))

(assert (=> start!73194 true))

(assert (=> start!73194 tp!49830))

(declare-fun array_inv!18536 (array!48688) Bool)

(assert (=> start!73194 (array_inv!18536 _keys!868)))

(declare-datatypes ((V!26707 0))(
  ( (V!26708 (val!8170 Int)) )
))
(declare-datatypes ((ValueCell!7683 0))(
  ( (ValueCellFull!7683 (v!10595 V!26707)) (EmptyCell!7683) )
))
(declare-datatypes ((array!48690 0))(
  ( (array!48691 (arr!23376 (Array (_ BitVec 32) ValueCell!7683)) (size!23816 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48690)

(declare-fun e!475570 () Bool)

(declare-fun array_inv!18537 (array!48690) Bool)

(assert (=> start!73194 (and (array_inv!18537 _values!688) e!475570)))

(declare-fun b!852718 () Bool)

(declare-fun res!579164 () Bool)

(assert (=> b!852718 (=> (not res!579164) (not e!475571))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!852718 (= res!579164 (and (= (size!23816 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23815 _keys!868) (size!23816 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852719 () Bool)

(declare-fun e!475572 () Bool)

(assert (=> b!852719 (= e!475571 e!475572)))

(declare-fun res!579165 () Bool)

(assert (=> b!852719 (=> (not res!579165) (not e!475572))))

(assert (=> b!852719 (= res!579165 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10732 0))(
  ( (tuple2!10733 (_1!5377 (_ BitVec 64)) (_2!5377 V!26707)) )
))
(declare-datatypes ((List!16563 0))(
  ( (Nil!16560) (Cons!16559 (h!17690 tuple2!10732) (t!23118 List!16563)) )
))
(declare-datatypes ((ListLongMap!9501 0))(
  ( (ListLongMap!9502 (toList!4766 List!16563)) )
))
(declare-fun lt!384274 () ListLongMap!9501)

(declare-fun lt!384279 () array!48690)

(declare-fun minValue!654 () V!26707)

(declare-fun zeroValue!654 () V!26707)

(declare-fun getCurrentListMapNoExtraKeys!2747 (array!48688 array!48690 (_ BitVec 32) (_ BitVec 32) V!26707 V!26707 (_ BitVec 32) Int) ListLongMap!9501)

(assert (=> b!852719 (= lt!384274 (getCurrentListMapNoExtraKeys!2747 _keys!868 lt!384279 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26707)

(assert (=> b!852719 (= lt!384279 (array!48691 (store (arr!23376 _values!688) i!612 (ValueCellFull!7683 v!557)) (size!23816 _values!688)))))

(declare-fun lt!384283 () ListLongMap!9501)

(assert (=> b!852719 (= lt!384283 (getCurrentListMapNoExtraKeys!2747 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852720 () Bool)

(declare-fun e!475575 () Bool)

(assert (=> b!852720 (= e!475575 true)))

(declare-fun lt!384277 () V!26707)

(declare-fun lt!384282 () tuple2!10732)

(declare-fun lt!384278 () ListLongMap!9501)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2161 (ListLongMap!9501 tuple2!10732) ListLongMap!9501)

(assert (=> b!852720 (= (+!2161 lt!384278 lt!384282) (+!2161 (+!2161 lt!384278 (tuple2!10733 k0!854 lt!384277)) lt!384282))))

(declare-fun lt!384275 () V!26707)

(assert (=> b!852720 (= lt!384282 (tuple2!10733 k0!854 lt!384275))))

(declare-datatypes ((Unit!29107 0))(
  ( (Unit!29108) )
))
(declare-fun lt!384281 () Unit!29107)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!289 (ListLongMap!9501 (_ BitVec 64) V!26707 V!26707) Unit!29107)

(assert (=> b!852720 (= lt!384281 (addSameAsAddTwiceSameKeyDiffValues!289 lt!384278 k0!854 lt!384277 lt!384275))))

(declare-fun lt!384276 () V!26707)

(declare-fun get!12323 (ValueCell!7683 V!26707) V!26707)

(assert (=> b!852720 (= lt!384277 (get!12323 (select (arr!23376 _values!688) from!1053) lt!384276))))

(assert (=> b!852720 (= lt!384274 (+!2161 lt!384278 (tuple2!10733 (select (arr!23375 _keys!868) from!1053) lt!384275)))))

(assert (=> b!852720 (= lt!384275 (get!12323 (select (store (arr!23376 _values!688) i!612 (ValueCellFull!7683 v!557)) from!1053) lt!384276))))

(declare-fun dynLambda!1043 (Int (_ BitVec 64)) V!26707)

(assert (=> b!852720 (= lt!384276 (dynLambda!1043 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852720 (= lt!384278 (getCurrentListMapNoExtraKeys!2747 _keys!868 lt!384279 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852721 () Bool)

(assert (=> b!852721 (= e!475572 (not e!475575))))

(declare-fun res!579167 () Bool)

(assert (=> b!852721 (=> res!579167 e!475575)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852721 (= res!579167 (not (validKeyInArray!0 (select (arr!23375 _keys!868) from!1053))))))

(declare-fun e!475576 () Bool)

(assert (=> b!852721 e!475576))

(declare-fun c!91834 () Bool)

(assert (=> b!852721 (= c!91834 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384280 () Unit!29107)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!392 (array!48688 array!48690 (_ BitVec 32) (_ BitVec 32) V!26707 V!26707 (_ BitVec 32) (_ BitVec 64) V!26707 (_ BitVec 32) Int) Unit!29107)

(assert (=> b!852721 (= lt!384280 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!392 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852722 () Bool)

(declare-fun res!579163 () Bool)

(assert (=> b!852722 (=> (not res!579163) (not e!475571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48688 (_ BitVec 32)) Bool)

(assert (=> b!852722 (= res!579163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25967 () Bool)

(declare-fun mapRes!25967 () Bool)

(assert (=> mapIsEmpty!25967 mapRes!25967))

(declare-fun b!852723 () Bool)

(declare-fun e!475573 () Bool)

(assert (=> b!852723 (= e!475570 (and e!475573 mapRes!25967))))

(declare-fun condMapEmpty!25967 () Bool)

(declare-fun mapDefault!25967 () ValueCell!7683)

(assert (=> b!852723 (= condMapEmpty!25967 (= (arr!23376 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7683)) mapDefault!25967)))))

(declare-fun b!852724 () Bool)

(declare-fun call!38183 () ListLongMap!9501)

(declare-fun call!38182 () ListLongMap!9501)

(assert (=> b!852724 (= e!475576 (= call!38183 call!38182))))

(declare-fun b!852725 () Bool)

(declare-fun res!579158 () Bool)

(assert (=> b!852725 (=> (not res!579158) (not e!475571))))

(assert (=> b!852725 (= res!579158 (validKeyInArray!0 k0!854))))

(declare-fun b!852726 () Bool)

(declare-fun res!579160 () Bool)

(assert (=> b!852726 (=> (not res!579160) (not e!475571))))

(assert (=> b!852726 (= res!579160 (and (= (select (arr!23375 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852727 () Bool)

(assert (=> b!852727 (= e!475576 (= call!38183 (+!2161 call!38182 (tuple2!10733 k0!854 v!557))))))

(declare-fun b!852728 () Bool)

(assert (=> b!852728 (= e!475573 tp_is_empty!16245)))

(declare-fun mapNonEmpty!25967 () Bool)

(declare-fun tp!49831 () Bool)

(assert (=> mapNonEmpty!25967 (= mapRes!25967 (and tp!49831 e!475574))))

(declare-fun mapValue!25967 () ValueCell!7683)

(declare-fun mapKey!25967 () (_ BitVec 32))

(declare-fun mapRest!25967 () (Array (_ BitVec 32) ValueCell!7683))

(assert (=> mapNonEmpty!25967 (= (arr!23376 _values!688) (store mapRest!25967 mapKey!25967 mapValue!25967))))

(declare-fun b!852729 () Bool)

(declare-fun res!579166 () Bool)

(assert (=> b!852729 (=> (not res!579166) (not e!475571))))

(declare-datatypes ((List!16564 0))(
  ( (Nil!16561) (Cons!16560 (h!17691 (_ BitVec 64)) (t!23119 List!16564)) )
))
(declare-fun arrayNoDuplicates!0 (array!48688 (_ BitVec 32) List!16564) Bool)

(assert (=> b!852729 (= res!579166 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16561))))

(declare-fun bm!38179 () Bool)

(assert (=> bm!38179 (= call!38183 (getCurrentListMapNoExtraKeys!2747 _keys!868 lt!384279 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852730 () Bool)

(declare-fun res!579159 () Bool)

(assert (=> b!852730 (=> (not res!579159) (not e!475571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852730 (= res!579159 (validMask!0 mask!1196))))

(declare-fun bm!38180 () Bool)

(assert (=> bm!38180 (= call!38182 (getCurrentListMapNoExtraKeys!2747 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73194 res!579161) b!852730))

(assert (= (and b!852730 res!579159) b!852718))

(assert (= (and b!852718 res!579164) b!852722))

(assert (= (and b!852722 res!579163) b!852729))

(assert (= (and b!852729 res!579166) b!852716))

(assert (= (and b!852716 res!579162) b!852725))

(assert (= (and b!852725 res!579158) b!852726))

(assert (= (and b!852726 res!579160) b!852719))

(assert (= (and b!852719 res!579165) b!852721))

(assert (= (and b!852721 c!91834) b!852727))

(assert (= (and b!852721 (not c!91834)) b!852724))

(assert (= (or b!852727 b!852724) bm!38179))

(assert (= (or b!852727 b!852724) bm!38180))

(assert (= (and b!852721 (not res!579167)) b!852720))

(assert (= (and b!852723 condMapEmpty!25967) mapIsEmpty!25967))

(assert (= (and b!852723 (not condMapEmpty!25967)) mapNonEmpty!25967))

(get-info :version)

(assert (= (and mapNonEmpty!25967 ((_ is ValueCellFull!7683) mapValue!25967)) b!852717))

(assert (= (and b!852723 ((_ is ValueCellFull!7683) mapDefault!25967)) b!852728))

(assert (= start!73194 b!852723))

(declare-fun b_lambda!11641 () Bool)

(assert (=> (not b_lambda!11641) (not b!852720)))

(declare-fun t!23117 () Bool)

(declare-fun tb!4411 () Bool)

(assert (=> (and start!73194 (= defaultEntry!696 defaultEntry!696) t!23117) tb!4411))

(declare-fun result!8433 () Bool)

(assert (=> tb!4411 (= result!8433 tp_is_empty!16245)))

(assert (=> b!852720 t!23117))

(declare-fun b_and!23379 () Bool)

(assert (= b_and!23377 (and (=> t!23117 result!8433) b_and!23379)))

(declare-fun m!793819 () Bool)

(assert (=> b!852726 m!793819))

(declare-fun m!793821 () Bool)

(assert (=> b!852727 m!793821))

(declare-fun m!793823 () Bool)

(assert (=> b!852719 m!793823))

(declare-fun m!793825 () Bool)

(assert (=> b!852719 m!793825))

(declare-fun m!793827 () Bool)

(assert (=> b!852719 m!793827))

(declare-fun m!793829 () Bool)

(assert (=> bm!38179 m!793829))

(declare-fun m!793831 () Bool)

(assert (=> b!852722 m!793831))

(declare-fun m!793833 () Bool)

(assert (=> b!852721 m!793833))

(assert (=> b!852721 m!793833))

(declare-fun m!793835 () Bool)

(assert (=> b!852721 m!793835))

(declare-fun m!793837 () Bool)

(assert (=> b!852721 m!793837))

(declare-fun m!793839 () Bool)

(assert (=> b!852725 m!793839))

(declare-fun m!793841 () Bool)

(assert (=> b!852720 m!793841))

(declare-fun m!793843 () Bool)

(assert (=> b!852720 m!793843))

(declare-fun m!793845 () Bool)

(assert (=> b!852720 m!793845))

(assert (=> b!852720 m!793845))

(declare-fun m!793847 () Bool)

(assert (=> b!852720 m!793847))

(declare-fun m!793849 () Bool)

(assert (=> b!852720 m!793849))

(declare-fun m!793851 () Bool)

(assert (=> b!852720 m!793851))

(declare-fun m!793853 () Bool)

(assert (=> b!852720 m!793853))

(assert (=> b!852720 m!793829))

(declare-fun m!793855 () Bool)

(assert (=> b!852720 m!793855))

(assert (=> b!852720 m!793849))

(assert (=> b!852720 m!793825))

(declare-fun m!793857 () Bool)

(assert (=> b!852720 m!793857))

(assert (=> b!852720 m!793841))

(assert (=> b!852720 m!793833))

(declare-fun m!793859 () Bool)

(assert (=> b!852720 m!793859))

(declare-fun m!793861 () Bool)

(assert (=> b!852730 m!793861))

(declare-fun m!793863 () Bool)

(assert (=> bm!38180 m!793863))

(declare-fun m!793865 () Bool)

(assert (=> start!73194 m!793865))

(declare-fun m!793867 () Bool)

(assert (=> start!73194 m!793867))

(declare-fun m!793869 () Bool)

(assert (=> mapNonEmpty!25967 m!793869))

(declare-fun m!793871 () Bool)

(assert (=> b!852729 m!793871))

(check-sat (not b!852725) (not b!852721) b_and!23379 (not b!852719) (not b!852727) (not mapNonEmpty!25967) (not start!73194) (not b!852729) (not b_lambda!11641) (not b!852730) (not b_next!14109) (not b!852722) (not bm!38180) tp_is_empty!16245 (not b!852720) (not bm!38179))
(check-sat b_and!23379 (not b_next!14109))
