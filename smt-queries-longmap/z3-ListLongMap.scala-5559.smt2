; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73120 () Bool)

(assert start!73120)

(declare-fun b_free!14053 () Bool)

(declare-fun b_next!14053 () Bool)

(assert (=> start!73120 (= b_free!14053 (not b_next!14053))))

(declare-fun tp!49663 () Bool)

(declare-fun b_and!23239 () Bool)

(assert (=> start!73120 (= tp!49663 b_and!23239)))

(declare-fun mapNonEmpty!25883 () Bool)

(declare-fun mapRes!25883 () Bool)

(declare-fun tp!49664 () Bool)

(declare-fun e!474751 () Bool)

(assert (=> mapNonEmpty!25883 (= mapRes!25883 (and tp!49664 e!474751))))

(declare-datatypes ((V!26633 0))(
  ( (V!26634 (val!8142 Int)) )
))
(declare-datatypes ((ValueCell!7655 0))(
  ( (ValueCellFull!7655 (v!10561 V!26633)) (EmptyCell!7655) )
))
(declare-fun mapValue!25883 () ValueCell!7655)

(declare-fun mapRest!25883 () (Array (_ BitVec 32) ValueCell!7655))

(declare-fun mapKey!25883 () (_ BitVec 32))

(declare-datatypes ((array!48567 0))(
  ( (array!48568 (arr!23315 (Array (_ BitVec 32) ValueCell!7655)) (size!23757 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48567)

(assert (=> mapNonEmpty!25883 (= (arr!23315 _values!688) (store mapRest!25883 mapKey!25883 mapValue!25883))))

(declare-fun b!851161 () Bool)

(declare-fun res!578212 () Bool)

(declare-fun e!474752 () Bool)

(assert (=> b!851161 (=> (not res!578212) (not e!474752))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48569 0))(
  ( (array!48570 (arr!23316 (Array (_ BitVec 32) (_ BitVec 64))) (size!23758 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48569)

(assert (=> b!851161 (= res!578212 (and (= (size!23757 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23758 _keys!868) (size!23757 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851162 () Bool)

(declare-fun res!578209 () Bool)

(assert (=> b!851162 (=> (not res!578209) (not e!474752))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851162 (= res!578209 (validKeyInArray!0 k0!854))))

(declare-fun b!851163 () Bool)

(declare-fun e!474753 () Bool)

(declare-fun e!474749 () Bool)

(assert (=> b!851163 (= e!474753 (and e!474749 mapRes!25883))))

(declare-fun condMapEmpty!25883 () Bool)

(declare-fun mapDefault!25883 () ValueCell!7655)

(assert (=> b!851163 (= condMapEmpty!25883 (= (arr!23315 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7655)) mapDefault!25883)))))

(declare-fun b!851164 () Bool)

(declare-fun e!474750 () Bool)

(assert (=> b!851164 (= e!474750 true)))

(declare-datatypes ((tuple2!10698 0))(
  ( (tuple2!10699 (_1!5360 (_ BitVec 64)) (_2!5360 V!26633)) )
))
(declare-datatypes ((List!16532 0))(
  ( (Nil!16529) (Cons!16528 (h!17659 tuple2!10698) (t!23022 List!16532)) )
))
(declare-datatypes ((ListLongMap!9457 0))(
  ( (ListLongMap!9458 (toList!4744 List!16532)) )
))
(declare-fun lt!383199 () ListLongMap!9457)

(declare-fun lt!383204 () tuple2!10698)

(declare-fun lt!383201 () V!26633)

(declare-fun +!2163 (ListLongMap!9457 tuple2!10698) ListLongMap!9457)

(assert (=> b!851164 (= (+!2163 lt!383199 lt!383204) (+!2163 (+!2163 lt!383199 (tuple2!10699 k0!854 lt!383201)) lt!383204))))

(declare-fun lt!383203 () V!26633)

(assert (=> b!851164 (= lt!383204 (tuple2!10699 k0!854 lt!383203))))

(declare-datatypes ((Unit!28999 0))(
  ( (Unit!29000) )
))
(declare-fun lt!383206 () Unit!28999)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!277 (ListLongMap!9457 (_ BitVec 64) V!26633 V!26633) Unit!28999)

(assert (=> b!851164 (= lt!383206 (addSameAsAddTwiceSameKeyDiffValues!277 lt!383199 k0!854 lt!383201 lt!383203))))

(declare-fun lt!383202 () V!26633)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12292 (ValueCell!7655 V!26633) V!26633)

(assert (=> b!851164 (= lt!383201 (get!12292 (select (arr!23315 _values!688) from!1053) lt!383202))))

(declare-fun lt!383207 () ListLongMap!9457)

(assert (=> b!851164 (= lt!383207 (+!2163 lt!383199 (tuple2!10699 (select (arr!23316 _keys!868) from!1053) lt!383203)))))

(declare-fun v!557 () V!26633)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851164 (= lt!383203 (get!12292 (select (store (arr!23315 _values!688) i!612 (ValueCellFull!7655 v!557)) from!1053) lt!383202))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1027 (Int (_ BitVec 64)) V!26633)

(assert (=> b!851164 (= lt!383202 (dynLambda!1027 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!383205 () array!48567)

(declare-fun minValue!654 () V!26633)

(declare-fun zeroValue!654 () V!26633)

(declare-fun getCurrentListMapNoExtraKeys!2752 (array!48569 array!48567 (_ BitVec 32) (_ BitVec 32) V!26633 V!26633 (_ BitVec 32) Int) ListLongMap!9457)

(assert (=> b!851164 (= lt!383199 (getCurrentListMapNoExtraKeys!2752 _keys!868 lt!383205 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37988 () ListLongMap!9457)

(declare-fun bm!37985 () Bool)

(assert (=> bm!37985 (= call!37988 (getCurrentListMapNoExtraKeys!2752 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578210 () Bool)

(assert (=> start!73120 (=> (not res!578210) (not e!474752))))

(assert (=> start!73120 (= res!578210 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23758 _keys!868))))))

(assert (=> start!73120 e!474752))

(declare-fun tp_is_empty!16189 () Bool)

(assert (=> start!73120 tp_is_empty!16189))

(assert (=> start!73120 true))

(assert (=> start!73120 tp!49663))

(declare-fun array_inv!18572 (array!48569) Bool)

(assert (=> start!73120 (array_inv!18572 _keys!868)))

(declare-fun array_inv!18573 (array!48567) Bool)

(assert (=> start!73120 (and (array_inv!18573 _values!688) e!474753)))

(declare-fun mapIsEmpty!25883 () Bool)

(assert (=> mapIsEmpty!25883 mapRes!25883))

(declare-fun b!851165 () Bool)

(declare-fun res!578214 () Bool)

(assert (=> b!851165 (=> (not res!578214) (not e!474752))))

(assert (=> b!851165 (= res!578214 (and (= (select (arr!23316 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851166 () Bool)

(declare-fun e!474756 () Bool)

(assert (=> b!851166 (= e!474756 (not e!474750))))

(declare-fun res!578217 () Bool)

(assert (=> b!851166 (=> res!578217 e!474750)))

(assert (=> b!851166 (= res!578217 (not (validKeyInArray!0 (select (arr!23316 _keys!868) from!1053))))))

(declare-fun e!474754 () Bool)

(assert (=> b!851166 e!474754))

(declare-fun c!91685 () Bool)

(assert (=> b!851166 (= c!91685 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383198 () Unit!28999)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!370 (array!48569 array!48567 (_ BitVec 32) (_ BitVec 32) V!26633 V!26633 (_ BitVec 32) (_ BitVec 64) V!26633 (_ BitVec 32) Int) Unit!28999)

(assert (=> b!851166 (= lt!383198 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!370 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851167 () Bool)

(declare-fun res!578208 () Bool)

(assert (=> b!851167 (=> (not res!578208) (not e!474752))))

(assert (=> b!851167 (= res!578208 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23758 _keys!868))))))

(declare-fun b!851168 () Bool)

(declare-fun call!37989 () ListLongMap!9457)

(assert (=> b!851168 (= e!474754 (= call!37989 call!37988))))

(declare-fun b!851169 () Bool)

(assert (=> b!851169 (= e!474754 (= call!37989 (+!2163 call!37988 (tuple2!10699 k0!854 v!557))))))

(declare-fun b!851170 () Bool)

(declare-fun res!578215 () Bool)

(assert (=> b!851170 (=> (not res!578215) (not e!474752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851170 (= res!578215 (validMask!0 mask!1196))))

(declare-fun bm!37986 () Bool)

(assert (=> bm!37986 (= call!37989 (getCurrentListMapNoExtraKeys!2752 _keys!868 lt!383205 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851171 () Bool)

(assert (=> b!851171 (= e!474752 e!474756)))

(declare-fun res!578216 () Bool)

(assert (=> b!851171 (=> (not res!578216) (not e!474756))))

(assert (=> b!851171 (= res!578216 (= from!1053 i!612))))

(assert (=> b!851171 (= lt!383207 (getCurrentListMapNoExtraKeys!2752 _keys!868 lt!383205 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851171 (= lt!383205 (array!48568 (store (arr!23315 _values!688) i!612 (ValueCellFull!7655 v!557)) (size!23757 _values!688)))))

(declare-fun lt!383200 () ListLongMap!9457)

(assert (=> b!851171 (= lt!383200 (getCurrentListMapNoExtraKeys!2752 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851172 () Bool)

(declare-fun res!578211 () Bool)

(assert (=> b!851172 (=> (not res!578211) (not e!474752))))

(declare-datatypes ((List!16533 0))(
  ( (Nil!16530) (Cons!16529 (h!17660 (_ BitVec 64)) (t!23023 List!16533)) )
))
(declare-fun arrayNoDuplicates!0 (array!48569 (_ BitVec 32) List!16533) Bool)

(assert (=> b!851172 (= res!578211 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16530))))

(declare-fun b!851173 () Bool)

(assert (=> b!851173 (= e!474749 tp_is_empty!16189)))

(declare-fun b!851174 () Bool)

(assert (=> b!851174 (= e!474751 tp_is_empty!16189)))

(declare-fun b!851175 () Bool)

(declare-fun res!578213 () Bool)

(assert (=> b!851175 (=> (not res!578213) (not e!474752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48569 (_ BitVec 32)) Bool)

(assert (=> b!851175 (= res!578213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73120 res!578210) b!851170))

(assert (= (and b!851170 res!578215) b!851161))

(assert (= (and b!851161 res!578212) b!851175))

(assert (= (and b!851175 res!578213) b!851172))

(assert (= (and b!851172 res!578211) b!851167))

(assert (= (and b!851167 res!578208) b!851162))

(assert (= (and b!851162 res!578209) b!851165))

(assert (= (and b!851165 res!578214) b!851171))

(assert (= (and b!851171 res!578216) b!851166))

(assert (= (and b!851166 c!91685) b!851169))

(assert (= (and b!851166 (not c!91685)) b!851168))

(assert (= (or b!851169 b!851168) bm!37986))

(assert (= (or b!851169 b!851168) bm!37985))

(assert (= (and b!851166 (not res!578217)) b!851164))

(assert (= (and b!851163 condMapEmpty!25883) mapIsEmpty!25883))

(assert (= (and b!851163 (not condMapEmpty!25883)) mapNonEmpty!25883))

(get-info :version)

(assert (= (and mapNonEmpty!25883 ((_ is ValueCellFull!7655) mapValue!25883)) b!851174))

(assert (= (and b!851163 ((_ is ValueCellFull!7655) mapDefault!25883)) b!851173))

(assert (= start!73120 b!851163))

(declare-fun b_lambda!11567 () Bool)

(assert (=> (not b_lambda!11567) (not b!851164)))

(declare-fun t!23021 () Bool)

(declare-fun tb!4347 () Bool)

(assert (=> (and start!73120 (= defaultEntry!696 defaultEntry!696) t!23021) tb!4347))

(declare-fun result!8313 () Bool)

(assert (=> tb!4347 (= result!8313 tp_is_empty!16189)))

(assert (=> b!851164 t!23021))

(declare-fun b_and!23241 () Bool)

(assert (= b_and!23239 (and (=> t!23021 result!8313) b_and!23241)))

(declare-fun m!791551 () Bool)

(assert (=> b!851165 m!791551))

(declare-fun m!791553 () Bool)

(assert (=> b!851170 m!791553))

(declare-fun m!791555 () Bool)

(assert (=> b!851169 m!791555))

(declare-fun m!791557 () Bool)

(assert (=> b!851172 m!791557))

(declare-fun m!791559 () Bool)

(assert (=> b!851164 m!791559))

(declare-fun m!791561 () Bool)

(assert (=> b!851164 m!791561))

(declare-fun m!791563 () Bool)

(assert (=> b!851164 m!791563))

(declare-fun m!791565 () Bool)

(assert (=> b!851164 m!791565))

(declare-fun m!791567 () Bool)

(assert (=> b!851164 m!791567))

(declare-fun m!791569 () Bool)

(assert (=> b!851164 m!791569))

(declare-fun m!791571 () Bool)

(assert (=> b!851164 m!791571))

(declare-fun m!791573 () Bool)

(assert (=> b!851164 m!791573))

(declare-fun m!791575 () Bool)

(assert (=> b!851164 m!791575))

(assert (=> b!851164 m!791573))

(declare-fun m!791577 () Bool)

(assert (=> b!851164 m!791577))

(declare-fun m!791579 () Bool)

(assert (=> b!851164 m!791579))

(assert (=> b!851164 m!791567))

(declare-fun m!791581 () Bool)

(assert (=> b!851164 m!791581))

(assert (=> b!851164 m!791561))

(declare-fun m!791583 () Bool)

(assert (=> b!851164 m!791583))

(declare-fun m!791585 () Bool)

(assert (=> b!851175 m!791585))

(assert (=> b!851166 m!791577))

(assert (=> b!851166 m!791577))

(declare-fun m!791587 () Bool)

(assert (=> b!851166 m!791587))

(declare-fun m!791589 () Bool)

(assert (=> b!851166 m!791589))

(declare-fun m!791591 () Bool)

(assert (=> mapNonEmpty!25883 m!791591))

(assert (=> bm!37986 m!791571))

(declare-fun m!791593 () Bool)

(assert (=> bm!37985 m!791593))

(declare-fun m!791595 () Bool)

(assert (=> b!851171 m!791595))

(assert (=> b!851171 m!791569))

(declare-fun m!791597 () Bool)

(assert (=> b!851171 m!791597))

(declare-fun m!791599 () Bool)

(assert (=> start!73120 m!791599))

(declare-fun m!791601 () Bool)

(assert (=> start!73120 m!791601))

(declare-fun m!791603 () Bool)

(assert (=> b!851162 m!791603))

(check-sat (not bm!37986) (not b!851175) (not b_next!14053) (not start!73120) (not b!851169) (not b!851170) b_and!23241 (not b!851162) (not bm!37985) (not b!851171) (not b!851164) tp_is_empty!16189 (not b!851166) (not b_lambda!11567) (not mapNonEmpty!25883) (not b!851172))
(check-sat b_and!23241 (not b_next!14053))
