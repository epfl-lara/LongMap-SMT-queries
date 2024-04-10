; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73248 () Bool)

(assert start!73248)

(declare-fun b_free!14163 () Bool)

(declare-fun b_next!14163 () Bool)

(assert (=> start!73248 (= b_free!14163 (not b_next!14163))))

(declare-fun tp!49993 () Bool)

(declare-fun b_and!23485 () Bool)

(assert (=> start!73248 (= tp!49993 b_and!23485)))

(declare-fun b!853985 () Bool)

(declare-fun res!579977 () Bool)

(declare-fun e!476220 () Bool)

(assert (=> b!853985 (=> (not res!579977) (not e!476220))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48796 0))(
  ( (array!48797 (arr!23429 (Array (_ BitVec 32) (_ BitVec 64))) (size!23869 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48796)

(declare-datatypes ((V!26779 0))(
  ( (V!26780 (val!8197 Int)) )
))
(declare-datatypes ((ValueCell!7710 0))(
  ( (ValueCellFull!7710 (v!10622 V!26779)) (EmptyCell!7710) )
))
(declare-datatypes ((array!48798 0))(
  ( (array!48799 (arr!23430 (Array (_ BitVec 32) ValueCell!7710)) (size!23870 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48798)

(assert (=> b!853985 (= res!579977 (and (= (size!23870 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23869 _keys!868) (size!23870 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853986 () Bool)

(declare-fun e!476221 () Bool)

(assert (=> b!853986 (= e!476220 e!476221)))

(declare-fun res!579968 () Bool)

(assert (=> b!853986 (=> (not res!579968) (not e!476221))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853986 (= res!579968 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!385093 () array!48798)

(declare-datatypes ((tuple2!10784 0))(
  ( (tuple2!10785 (_1!5403 (_ BitVec 64)) (_2!5403 V!26779)) )
))
(declare-datatypes ((List!16604 0))(
  ( (Nil!16601) (Cons!16600 (h!17731 tuple2!10784) (t!23213 List!16604)) )
))
(declare-datatypes ((ListLongMap!9553 0))(
  ( (ListLongMap!9554 (toList!4792 List!16604)) )
))
(declare-fun lt!385084 () ListLongMap!9553)

(declare-fun minValue!654 () V!26779)

(declare-fun zeroValue!654 () V!26779)

(declare-fun getCurrentListMapNoExtraKeys!2773 (array!48796 array!48798 (_ BitVec 32) (_ BitVec 32) V!26779 V!26779 (_ BitVec 32) Int) ListLongMap!9553)

(assert (=> b!853986 (= lt!385084 (getCurrentListMapNoExtraKeys!2773 _keys!868 lt!385093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26779)

(assert (=> b!853986 (= lt!385093 (array!48799 (store (arr!23430 _values!688) i!612 (ValueCellFull!7710 v!557)) (size!23870 _values!688)))))

(declare-fun lt!385085 () ListLongMap!9553)

(assert (=> b!853986 (= lt!385085 (getCurrentListMapNoExtraKeys!2773 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853987 () Bool)

(declare-fun res!579975 () Bool)

(assert (=> b!853987 (=> (not res!579975) (not e!476220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48796 (_ BitVec 32)) Bool)

(assert (=> b!853987 (= res!579975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853988 () Bool)

(declare-fun e!476219 () Bool)

(assert (=> b!853988 (= e!476221 (not e!476219))))

(declare-fun res!579969 () Bool)

(assert (=> b!853988 (=> res!579969 e!476219)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853988 (= res!579969 (not (validKeyInArray!0 (select (arr!23429 _keys!868) from!1053))))))

(declare-fun e!476218 () Bool)

(assert (=> b!853988 e!476218))

(declare-fun c!91915 () Bool)

(assert (=> b!853988 (= c!91915 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!29149 0))(
  ( (Unit!29150) )
))
(declare-fun lt!385088 () Unit!29149)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!406 (array!48796 array!48798 (_ BitVec 32) (_ BitVec 32) V!26779 V!26779 (_ BitVec 32) (_ BitVec 64) V!26779 (_ BitVec 32) Int) Unit!29149)

(assert (=> b!853988 (= lt!385088 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!406 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853989 () Bool)

(declare-fun res!579974 () Bool)

(assert (=> b!853989 (=> (not res!579974) (not e!476220))))

(declare-datatypes ((List!16605 0))(
  ( (Nil!16602) (Cons!16601 (h!17732 (_ BitVec 64)) (t!23214 List!16605)) )
))
(declare-fun arrayNoDuplicates!0 (array!48796 (_ BitVec 32) List!16605) Bool)

(assert (=> b!853989 (= res!579974 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16602))))

(declare-fun b!853990 () Bool)

(declare-fun call!38345 () ListLongMap!9553)

(declare-fun call!38344 () ListLongMap!9553)

(declare-fun +!2182 (ListLongMap!9553 tuple2!10784) ListLongMap!9553)

(assert (=> b!853990 (= e!476218 (= call!38344 (+!2182 call!38345 (tuple2!10785 k0!854 v!557))))))

(declare-fun bm!38341 () Bool)

(assert (=> bm!38341 (= call!38345 (getCurrentListMapNoExtraKeys!2773 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38342 () Bool)

(assert (=> bm!38342 (= call!38344 (getCurrentListMapNoExtraKeys!2773 _keys!868 lt!385093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853991 () Bool)

(declare-fun res!579972 () Bool)

(assert (=> b!853991 (=> (not res!579972) (not e!476220))))

(assert (=> b!853991 (= res!579972 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23869 _keys!868))))))

(declare-fun b!853992 () Bool)

(declare-fun res!579970 () Bool)

(assert (=> b!853992 (=> (not res!579970) (not e!476220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853992 (= res!579970 (validMask!0 mask!1196))))

(declare-fun b!853993 () Bool)

(assert (=> b!853993 (= e!476219 true)))

(declare-fun lt!385089 () ListLongMap!9553)

(declare-fun lt!385091 () V!26779)

(declare-fun lt!385086 () tuple2!10784)

(assert (=> b!853993 (= (+!2182 lt!385089 lt!385086) (+!2182 (+!2182 lt!385089 (tuple2!10785 k0!854 lt!385091)) lt!385086))))

(declare-fun lt!385090 () V!26779)

(assert (=> b!853993 (= lt!385086 (tuple2!10785 k0!854 lt!385090))))

(declare-fun lt!385087 () Unit!29149)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!307 (ListLongMap!9553 (_ BitVec 64) V!26779 V!26779) Unit!29149)

(assert (=> b!853993 (= lt!385087 (addSameAsAddTwiceSameKeyDiffValues!307 lt!385089 k0!854 lt!385091 lt!385090))))

(declare-fun lt!385092 () V!26779)

(declare-fun get!12359 (ValueCell!7710 V!26779) V!26779)

(assert (=> b!853993 (= lt!385091 (get!12359 (select (arr!23430 _values!688) from!1053) lt!385092))))

(assert (=> b!853993 (= lt!385084 (+!2182 lt!385089 (tuple2!10785 (select (arr!23429 _keys!868) from!1053) lt!385090)))))

(assert (=> b!853993 (= lt!385090 (get!12359 (select (store (arr!23430 _values!688) i!612 (ValueCellFull!7710 v!557)) from!1053) lt!385092))))

(declare-fun dynLambda!1061 (Int (_ BitVec 64)) V!26779)

(assert (=> b!853993 (= lt!385092 (dynLambda!1061 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853993 (= lt!385089 (getCurrentListMapNoExtraKeys!2773 _keys!868 lt!385093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853994 () Bool)

(declare-fun e!476217 () Bool)

(declare-fun tp_is_empty!16299 () Bool)

(assert (=> b!853994 (= e!476217 tp_is_empty!16299)))

(declare-fun mapNonEmpty!26048 () Bool)

(declare-fun mapRes!26048 () Bool)

(declare-fun tp!49992 () Bool)

(assert (=> mapNonEmpty!26048 (= mapRes!26048 (and tp!49992 e!476217))))

(declare-fun mapKey!26048 () (_ BitVec 32))

(declare-fun mapRest!26048 () (Array (_ BitVec 32) ValueCell!7710))

(declare-fun mapValue!26048 () ValueCell!7710)

(assert (=> mapNonEmpty!26048 (= (arr!23430 _values!688) (store mapRest!26048 mapKey!26048 mapValue!26048))))

(declare-fun b!853995 () Bool)

(assert (=> b!853995 (= e!476218 (= call!38344 call!38345))))

(declare-fun res!579976 () Bool)

(assert (=> start!73248 (=> (not res!579976) (not e!476220))))

(assert (=> start!73248 (= res!579976 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23869 _keys!868))))))

(assert (=> start!73248 e!476220))

(assert (=> start!73248 tp_is_empty!16299))

(assert (=> start!73248 true))

(assert (=> start!73248 tp!49993))

(declare-fun array_inv!18574 (array!48796) Bool)

(assert (=> start!73248 (array_inv!18574 _keys!868)))

(declare-fun e!476223 () Bool)

(declare-fun array_inv!18575 (array!48798) Bool)

(assert (=> start!73248 (and (array_inv!18575 _values!688) e!476223)))

(declare-fun b!853996 () Bool)

(declare-fun res!579971 () Bool)

(assert (=> b!853996 (=> (not res!579971) (not e!476220))))

(assert (=> b!853996 (= res!579971 (and (= (select (arr!23429 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26048 () Bool)

(assert (=> mapIsEmpty!26048 mapRes!26048))

(declare-fun b!853997 () Bool)

(declare-fun e!476222 () Bool)

(assert (=> b!853997 (= e!476223 (and e!476222 mapRes!26048))))

(declare-fun condMapEmpty!26048 () Bool)

(declare-fun mapDefault!26048 () ValueCell!7710)

(assert (=> b!853997 (= condMapEmpty!26048 (= (arr!23430 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7710)) mapDefault!26048)))))

(declare-fun b!853998 () Bool)

(declare-fun res!579973 () Bool)

(assert (=> b!853998 (=> (not res!579973) (not e!476220))))

(assert (=> b!853998 (= res!579973 (validKeyInArray!0 k0!854))))

(declare-fun b!853999 () Bool)

(assert (=> b!853999 (= e!476222 tp_is_empty!16299)))

(assert (= (and start!73248 res!579976) b!853992))

(assert (= (and b!853992 res!579970) b!853985))

(assert (= (and b!853985 res!579977) b!853987))

(assert (= (and b!853987 res!579975) b!853989))

(assert (= (and b!853989 res!579974) b!853991))

(assert (= (and b!853991 res!579972) b!853998))

(assert (= (and b!853998 res!579973) b!853996))

(assert (= (and b!853996 res!579971) b!853986))

(assert (= (and b!853986 res!579968) b!853988))

(assert (= (and b!853988 c!91915) b!853990))

(assert (= (and b!853988 (not c!91915)) b!853995))

(assert (= (or b!853990 b!853995) bm!38342))

(assert (= (or b!853990 b!853995) bm!38341))

(assert (= (and b!853988 (not res!579969)) b!853993))

(assert (= (and b!853997 condMapEmpty!26048) mapIsEmpty!26048))

(assert (= (and b!853997 (not condMapEmpty!26048)) mapNonEmpty!26048))

(get-info :version)

(assert (= (and mapNonEmpty!26048 ((_ is ValueCellFull!7710) mapValue!26048)) b!853994))

(assert (= (and b!853997 ((_ is ValueCellFull!7710) mapDefault!26048)) b!853999))

(assert (= start!73248 b!853997))

(declare-fun b_lambda!11695 () Bool)

(assert (=> (not b_lambda!11695) (not b!853993)))

(declare-fun t!23212 () Bool)

(declare-fun tb!4465 () Bool)

(assert (=> (and start!73248 (= defaultEntry!696 defaultEntry!696) t!23212) tb!4465))

(declare-fun result!8541 () Bool)

(assert (=> tb!4465 (= result!8541 tp_is_empty!16299)))

(assert (=> b!853993 t!23212))

(declare-fun b_and!23487 () Bool)

(assert (= b_and!23485 (and (=> t!23212 result!8541) b_and!23487)))

(declare-fun m!795281 () Bool)

(assert (=> start!73248 m!795281))

(declare-fun m!795283 () Bool)

(assert (=> start!73248 m!795283))

(declare-fun m!795285 () Bool)

(assert (=> b!853988 m!795285))

(assert (=> b!853988 m!795285))

(declare-fun m!795287 () Bool)

(assert (=> b!853988 m!795287))

(declare-fun m!795289 () Bool)

(assert (=> b!853988 m!795289))

(declare-fun m!795291 () Bool)

(assert (=> b!853993 m!795291))

(declare-fun m!795293 () Bool)

(assert (=> b!853993 m!795293))

(declare-fun m!795295 () Bool)

(assert (=> b!853993 m!795295))

(declare-fun m!795297 () Bool)

(assert (=> b!853993 m!795297))

(declare-fun m!795299 () Bool)

(assert (=> b!853993 m!795299))

(declare-fun m!795301 () Bool)

(assert (=> b!853993 m!795301))

(assert (=> b!853993 m!795299))

(assert (=> b!853993 m!795293))

(declare-fun m!795303 () Bool)

(assert (=> b!853993 m!795303))

(declare-fun m!795305 () Bool)

(assert (=> b!853993 m!795305))

(declare-fun m!795307 () Bool)

(assert (=> b!853993 m!795307))

(declare-fun m!795309 () Bool)

(assert (=> b!853993 m!795309))

(assert (=> b!853993 m!795307))

(assert (=> b!853993 m!795285))

(declare-fun m!795311 () Bool)

(assert (=> b!853993 m!795311))

(declare-fun m!795313 () Bool)

(assert (=> b!853993 m!795313))

(declare-fun m!795315 () Bool)

(assert (=> b!853992 m!795315))

(declare-fun m!795317 () Bool)

(assert (=> b!853996 m!795317))

(declare-fun m!795319 () Bool)

(assert (=> b!853998 m!795319))

(declare-fun m!795321 () Bool)

(assert (=> b!853990 m!795321))

(assert (=> bm!38342 m!795291))

(declare-fun m!795323 () Bool)

(assert (=> bm!38341 m!795323))

(declare-fun m!795325 () Bool)

(assert (=> b!853987 m!795325))

(declare-fun m!795327 () Bool)

(assert (=> b!853986 m!795327))

(assert (=> b!853986 m!795303))

(declare-fun m!795329 () Bool)

(assert (=> b!853986 m!795329))

(declare-fun m!795331 () Bool)

(assert (=> mapNonEmpty!26048 m!795331))

(declare-fun m!795333 () Bool)

(assert (=> b!853989 m!795333))

(check-sat (not b_lambda!11695) b_and!23487 (not b!853986) (not b!853998) (not b!853989) tp_is_empty!16299 (not b!853987) (not b!853993) (not bm!38342) (not mapNonEmpty!26048) (not b!853992) (not bm!38341) (not b!853990) (not start!73248) (not b!853988) (not b_next!14163))
(check-sat b_and!23487 (not b_next!14163))
