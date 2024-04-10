; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73170 () Bool)

(assert start!73170)

(declare-fun b_free!14085 () Bool)

(declare-fun b_next!14085 () Bool)

(assert (=> start!73170 (= b_free!14085 (not b_next!14085))))

(declare-fun tp!49758 () Bool)

(declare-fun b_and!23329 () Bool)

(assert (=> start!73170 (= tp!49758 b_and!23329)))

(declare-fun bm!38107 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26675 0))(
  ( (V!26676 (val!8158 Int)) )
))
(declare-datatypes ((ValueCell!7671 0))(
  ( (ValueCellFull!7671 (v!10583 V!26675)) (EmptyCell!7671) )
))
(declare-datatypes ((array!48640 0))(
  ( (array!48641 (arr!23351 (Array (_ BitVec 32) ValueCell!7671)) (size!23791 (_ BitVec 32))) )
))
(declare-fun lt!383921 () array!48640)

(declare-datatypes ((array!48642 0))(
  ( (array!48643 (arr!23352 (Array (_ BitVec 32) (_ BitVec 64))) (size!23792 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48642)

(declare-datatypes ((tuple2!10710 0))(
  ( (tuple2!10711 (_1!5366 (_ BitVec 64)) (_2!5366 V!26675)) )
))
(declare-datatypes ((List!16545 0))(
  ( (Nil!16542) (Cons!16541 (h!17672 tuple2!10710) (t!23076 List!16545)) )
))
(declare-datatypes ((ListLongMap!9479 0))(
  ( (ListLongMap!9480 (toList!4755 List!16545)) )
))
(declare-fun call!38111 () ListLongMap!9479)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26675)

(declare-fun zeroValue!654 () V!26675)

(declare-fun getCurrentListMapNoExtraKeys!2737 (array!48642 array!48640 (_ BitVec 32) (_ BitVec 32) V!26675 V!26675 (_ BitVec 32) Int) ListLongMap!9479)

(assert (=> bm!38107 (= call!38111 (getCurrentListMapNoExtraKeys!2737 _keys!868 lt!383921 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578802 () Bool)

(declare-fun e!475281 () Bool)

(assert (=> start!73170 (=> (not res!578802) (not e!475281))))

(assert (=> start!73170 (= res!578802 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23792 _keys!868))))))

(assert (=> start!73170 e!475281))

(declare-fun tp_is_empty!16221 () Bool)

(assert (=> start!73170 tp_is_empty!16221))

(assert (=> start!73170 true))

(assert (=> start!73170 tp!49758))

(declare-fun array_inv!18520 (array!48642) Bool)

(assert (=> start!73170 (array_inv!18520 _keys!868)))

(declare-fun _values!688 () array!48640)

(declare-fun e!475285 () Bool)

(declare-fun array_inv!18521 (array!48640) Bool)

(assert (=> start!73170 (and (array_inv!18521 _values!688) e!475285)))

(declare-fun b!852152 () Bool)

(declare-fun e!475286 () Bool)

(assert (=> b!852152 (= e!475286 tp_is_empty!16221)))

(declare-fun b!852153 () Bool)

(declare-fun e!475284 () Bool)

(assert (=> b!852153 (= e!475281 e!475284)))

(declare-fun res!578800 () Bool)

(assert (=> b!852153 (=> (not res!578800) (not e!475284))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852153 (= res!578800 (= from!1053 i!612))))

(declare-fun lt!383916 () ListLongMap!9479)

(assert (=> b!852153 (= lt!383916 (getCurrentListMapNoExtraKeys!2737 _keys!868 lt!383921 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26675)

(assert (=> b!852153 (= lt!383921 (array!48641 (store (arr!23351 _values!688) i!612 (ValueCellFull!7671 v!557)) (size!23791 _values!688)))))

(declare-fun lt!383917 () ListLongMap!9479)

(assert (=> b!852153 (= lt!383917 (getCurrentListMapNoExtraKeys!2737 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25931 () Bool)

(declare-fun mapRes!25931 () Bool)

(declare-fun tp!49759 () Bool)

(declare-fun e!475288 () Bool)

(assert (=> mapNonEmpty!25931 (= mapRes!25931 (and tp!49759 e!475288))))

(declare-fun mapValue!25931 () ValueCell!7671)

(declare-fun mapKey!25931 () (_ BitVec 32))

(declare-fun mapRest!25931 () (Array (_ BitVec 32) ValueCell!7671))

(assert (=> mapNonEmpty!25931 (= (arr!23351 _values!688) (store mapRest!25931 mapKey!25931 mapValue!25931))))

(declare-fun call!38110 () ListLongMap!9479)

(declare-fun e!475287 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!852154 () Bool)

(declare-fun +!2153 (ListLongMap!9479 tuple2!10710) ListLongMap!9479)

(assert (=> b!852154 (= e!475287 (= call!38111 (+!2153 call!38110 (tuple2!10711 k0!854 v!557))))))

(declare-fun b!852155 () Bool)

(declare-fun res!578805 () Bool)

(assert (=> b!852155 (=> (not res!578805) (not e!475281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852155 (= res!578805 (validMask!0 mask!1196))))

(declare-fun b!852156 () Bool)

(declare-fun e!475283 () Bool)

(assert (=> b!852156 (= e!475283 true)))

(declare-fun lt!383919 () V!26675)

(declare-fun lt!383918 () tuple2!10710)

(declare-fun lt!383922 () ListLongMap!9479)

(assert (=> b!852156 (= (+!2153 lt!383922 lt!383918) (+!2153 (+!2153 lt!383922 (tuple2!10711 k0!854 lt!383919)) lt!383918))))

(declare-fun lt!383920 () V!26675)

(assert (=> b!852156 (= lt!383918 (tuple2!10711 k0!854 lt!383920))))

(declare-datatypes ((Unit!29089 0))(
  ( (Unit!29090) )
))
(declare-fun lt!383915 () Unit!29089)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!282 (ListLongMap!9479 (_ BitVec 64) V!26675 V!26675) Unit!29089)

(assert (=> b!852156 (= lt!383915 (addSameAsAddTwiceSameKeyDiffValues!282 lt!383922 k0!854 lt!383919 lt!383920))))

(declare-fun lt!383914 () V!26675)

(declare-fun get!12308 (ValueCell!7671 V!26675) V!26675)

(assert (=> b!852156 (= lt!383919 (get!12308 (select (arr!23351 _values!688) from!1053) lt!383914))))

(assert (=> b!852156 (= lt!383916 (+!2153 lt!383922 (tuple2!10711 (select (arr!23352 _keys!868) from!1053) lt!383920)))))

(assert (=> b!852156 (= lt!383920 (get!12308 (select (store (arr!23351 _values!688) i!612 (ValueCellFull!7671 v!557)) from!1053) lt!383914))))

(declare-fun dynLambda!1036 (Int (_ BitVec 64)) V!26675)

(assert (=> b!852156 (= lt!383914 (dynLambda!1036 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852156 (= lt!383922 (getCurrentListMapNoExtraKeys!2737 _keys!868 lt!383921 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38108 () Bool)

(assert (=> bm!38108 (= call!38110 (getCurrentListMapNoExtraKeys!2737 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852157 () Bool)

(declare-fun res!578806 () Bool)

(assert (=> b!852157 (=> (not res!578806) (not e!475281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48642 (_ BitVec 32)) Bool)

(assert (=> b!852157 (= res!578806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852158 () Bool)

(assert (=> b!852158 (= e!475288 tp_is_empty!16221)))

(declare-fun b!852159 () Bool)

(declare-fun res!578801 () Bool)

(assert (=> b!852159 (=> (not res!578801) (not e!475281))))

(assert (=> b!852159 (= res!578801 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23792 _keys!868))))))

(declare-fun mapIsEmpty!25931 () Bool)

(assert (=> mapIsEmpty!25931 mapRes!25931))

(declare-fun b!852160 () Bool)

(assert (=> b!852160 (= e!475285 (and e!475286 mapRes!25931))))

(declare-fun condMapEmpty!25931 () Bool)

(declare-fun mapDefault!25931 () ValueCell!7671)

(assert (=> b!852160 (= condMapEmpty!25931 (= (arr!23351 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7671)) mapDefault!25931)))))

(declare-fun b!852161 () Bool)

(assert (=> b!852161 (= e!475284 (not e!475283))))

(declare-fun res!578798 () Bool)

(assert (=> b!852161 (=> res!578798 e!475283)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852161 (= res!578798 (not (validKeyInArray!0 (select (arr!23352 _keys!868) from!1053))))))

(assert (=> b!852161 e!475287))

(declare-fun c!91798 () Bool)

(assert (=> b!852161 (= c!91798 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383923 () Unit!29089)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!385 (array!48642 array!48640 (_ BitVec 32) (_ BitVec 32) V!26675 V!26675 (_ BitVec 32) (_ BitVec 64) V!26675 (_ BitVec 32) Int) Unit!29089)

(assert (=> b!852161 (= lt!383923 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!385 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852162 () Bool)

(declare-fun res!578799 () Bool)

(assert (=> b!852162 (=> (not res!578799) (not e!475281))))

(assert (=> b!852162 (= res!578799 (validKeyInArray!0 k0!854))))

(declare-fun b!852163 () Bool)

(declare-fun res!578807 () Bool)

(assert (=> b!852163 (=> (not res!578807) (not e!475281))))

(declare-datatypes ((List!16546 0))(
  ( (Nil!16543) (Cons!16542 (h!17673 (_ BitVec 64)) (t!23077 List!16546)) )
))
(declare-fun arrayNoDuplicates!0 (array!48642 (_ BitVec 32) List!16546) Bool)

(assert (=> b!852163 (= res!578807 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16543))))

(declare-fun b!852164 () Bool)

(declare-fun res!578804 () Bool)

(assert (=> b!852164 (=> (not res!578804) (not e!475281))))

(assert (=> b!852164 (= res!578804 (and (= (select (arr!23352 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852165 () Bool)

(assert (=> b!852165 (= e!475287 (= call!38111 call!38110))))

(declare-fun b!852166 () Bool)

(declare-fun res!578803 () Bool)

(assert (=> b!852166 (=> (not res!578803) (not e!475281))))

(assert (=> b!852166 (= res!578803 (and (= (size!23791 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23792 _keys!868) (size!23791 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73170 res!578802) b!852155))

(assert (= (and b!852155 res!578805) b!852166))

(assert (= (and b!852166 res!578803) b!852157))

(assert (= (and b!852157 res!578806) b!852163))

(assert (= (and b!852163 res!578807) b!852159))

(assert (= (and b!852159 res!578801) b!852162))

(assert (= (and b!852162 res!578799) b!852164))

(assert (= (and b!852164 res!578804) b!852153))

(assert (= (and b!852153 res!578800) b!852161))

(assert (= (and b!852161 c!91798) b!852154))

(assert (= (and b!852161 (not c!91798)) b!852165))

(assert (= (or b!852154 b!852165) bm!38107))

(assert (= (or b!852154 b!852165) bm!38108))

(assert (= (and b!852161 (not res!578798)) b!852156))

(assert (= (and b!852160 condMapEmpty!25931) mapIsEmpty!25931))

(assert (= (and b!852160 (not condMapEmpty!25931)) mapNonEmpty!25931))

(get-info :version)

(assert (= (and mapNonEmpty!25931 ((_ is ValueCellFull!7671) mapValue!25931)) b!852158))

(assert (= (and b!852160 ((_ is ValueCellFull!7671) mapDefault!25931)) b!852152))

(assert (= start!73170 b!852160))

(declare-fun b_lambda!11617 () Bool)

(assert (=> (not b_lambda!11617) (not b!852156)))

(declare-fun t!23075 () Bool)

(declare-fun tb!4387 () Bool)

(assert (=> (and start!73170 (= defaultEntry!696 defaultEntry!696) t!23075) tb!4387))

(declare-fun result!8385 () Bool)

(assert (=> tb!4387 (= result!8385 tp_is_empty!16221)))

(assert (=> b!852156 t!23075))

(declare-fun b_and!23331 () Bool)

(assert (= b_and!23329 (and (=> t!23075 result!8385) b_and!23331)))

(declare-fun m!793171 () Bool)

(assert (=> bm!38107 m!793171))

(declare-fun m!793173 () Bool)

(assert (=> b!852163 m!793173))

(declare-fun m!793175 () Bool)

(assert (=> b!852155 m!793175))

(declare-fun m!793177 () Bool)

(assert (=> b!852157 m!793177))

(declare-fun m!793179 () Bool)

(assert (=> b!852161 m!793179))

(assert (=> b!852161 m!793179))

(declare-fun m!793181 () Bool)

(assert (=> b!852161 m!793181))

(declare-fun m!793183 () Bool)

(assert (=> b!852161 m!793183))

(declare-fun m!793185 () Bool)

(assert (=> start!73170 m!793185))

(declare-fun m!793187 () Bool)

(assert (=> start!73170 m!793187))

(declare-fun m!793189 () Bool)

(assert (=> b!852154 m!793189))

(declare-fun m!793191 () Bool)

(assert (=> b!852164 m!793191))

(declare-fun m!793193 () Bool)

(assert (=> mapNonEmpty!25931 m!793193))

(declare-fun m!793195 () Bool)

(assert (=> b!852153 m!793195))

(declare-fun m!793197 () Bool)

(assert (=> b!852153 m!793197))

(declare-fun m!793199 () Bool)

(assert (=> b!852153 m!793199))

(declare-fun m!793201 () Bool)

(assert (=> b!852156 m!793201))

(declare-fun m!793203 () Bool)

(assert (=> b!852156 m!793203))

(assert (=> b!852156 m!793171))

(assert (=> b!852156 m!793201))

(declare-fun m!793205 () Bool)

(assert (=> b!852156 m!793205))

(declare-fun m!793207 () Bool)

(assert (=> b!852156 m!793207))

(declare-fun m!793209 () Bool)

(assert (=> b!852156 m!793209))

(declare-fun m!793211 () Bool)

(assert (=> b!852156 m!793211))

(declare-fun m!793213 () Bool)

(assert (=> b!852156 m!793213))

(assert (=> b!852156 m!793179))

(declare-fun m!793215 () Bool)

(assert (=> b!852156 m!793215))

(declare-fun m!793217 () Bool)

(assert (=> b!852156 m!793217))

(assert (=> b!852156 m!793207))

(declare-fun m!793219 () Bool)

(assert (=> b!852156 m!793219))

(assert (=> b!852156 m!793209))

(assert (=> b!852156 m!793197))

(declare-fun m!793221 () Bool)

(assert (=> b!852162 m!793221))

(declare-fun m!793223 () Bool)

(assert (=> bm!38108 m!793223))

(check-sat (not bm!38107) (not start!73170) (not b_next!14085) (not b!852154) (not b!852163) tp_is_empty!16221 (not b!852156) (not mapNonEmpty!25931) (not b!852162) (not bm!38108) b_and!23331 (not b!852157) (not b!852155) (not b!852161) (not b!852153) (not b_lambda!11617))
(check-sat b_and!23331 (not b_next!14085))
