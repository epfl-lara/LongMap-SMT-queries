; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97966 () Bool)

(assert start!97966)

(declare-fun b_free!23667 () Bool)

(declare-fun b_next!23667 () Bool)

(assert (=> start!97966 (= b_free!23667 (not b_next!23667))))

(declare-fun tp!83704 () Bool)

(declare-fun b_and!38117 () Bool)

(assert (=> start!97966 (= tp!83704 b_and!38117)))

(declare-fun b!1123077 () Bool)

(declare-fun e!639382 () Bool)

(assert (=> b!1123077 (= e!639382 true)))

(declare-datatypes ((V!42723 0))(
  ( (V!42724 (val!14155 Int)) )
))
(declare-fun zeroValue!944 () V!42723)

(declare-datatypes ((array!73267 0))(
  ( (array!73268 (arr!35286 (Array (_ BitVec 32) (_ BitVec 64))) (size!35822 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73267)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!498953 () Bool)

(declare-datatypes ((ValueCell!13389 0))(
  ( (ValueCellFull!13389 (v!16788 V!42723)) (EmptyCell!13389) )
))
(declare-datatypes ((array!73269 0))(
  ( (array!73270 (arr!35287 (Array (_ BitVec 32) ValueCell!13389)) (size!35823 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73269)

(declare-fun minValue!944 () V!42723)

(declare-datatypes ((tuple2!17778 0))(
  ( (tuple2!17779 (_1!8900 (_ BitVec 64)) (_2!8900 V!42723)) )
))
(declare-datatypes ((List!24557 0))(
  ( (Nil!24554) (Cons!24553 (h!25762 tuple2!17778) (t!35216 List!24557)) )
))
(declare-datatypes ((ListLongMap!15747 0))(
  ( (ListLongMap!15748 (toList!7889 List!24557)) )
))
(declare-fun contains!6430 (ListLongMap!15747 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4377 (array!73267 array!73269 (_ BitVec 32) (_ BitVec 32) V!42723 V!42723 (_ BitVec 32) Int) ListLongMap!15747)

(assert (=> b!1123077 (= lt!498953 (contains!6430 (getCurrentListMapNoExtraKeys!4377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1123078 () Bool)

(declare-fun e!639384 () Bool)

(declare-fun tp_is_empty!28197 () Bool)

(assert (=> b!1123078 (= e!639384 tp_is_empty!28197)))

(declare-fun b!1123079 () Bool)

(declare-fun res!750326 () Bool)

(declare-fun e!639386 () Bool)

(assert (=> b!1123079 (=> (not res!750326) (not e!639386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123079 (= res!750326 (validMask!0 mask!1564))))

(declare-fun b!1123080 () Bool)

(declare-fun res!750319 () Bool)

(assert (=> b!1123080 (=> (not res!750319) (not e!639386))))

(declare-datatypes ((List!24558 0))(
  ( (Nil!24555) (Cons!24554 (h!25763 (_ BitVec 64)) (t!35217 List!24558)) )
))
(declare-fun arrayNoDuplicates!0 (array!73267 (_ BitVec 32) List!24558) Bool)

(assert (=> b!1123080 (= res!750319 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24555))))

(declare-fun call!47283 () ListLongMap!15747)

(declare-fun bm!47280 () Bool)

(assert (=> bm!47280 (= call!47283 (getCurrentListMapNoExtraKeys!4377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123081 () Bool)

(declare-fun e!639385 () Bool)

(declare-fun e!639383 () Bool)

(assert (=> b!1123081 (= e!639385 e!639383)))

(declare-fun res!750323 () Bool)

(assert (=> b!1123081 (=> res!750323 e!639383)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123081 (= res!750323 (not (= from!1455 i!673)))))

(declare-fun lt!498957 () array!73269)

(declare-fun lt!498956 () ListLongMap!15747)

(declare-fun lt!498955 () array!73267)

(assert (=> b!1123081 (= lt!498956 (getCurrentListMapNoExtraKeys!4377 lt!498955 lt!498957 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2473 (Int (_ BitVec 64)) V!42723)

(assert (=> b!1123081 (= lt!498957 (array!73270 (store (arr!35287 _values!996) i!673 (ValueCellFull!13389 (dynLambda!2473 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35823 _values!996)))))

(declare-fun lt!498958 () ListLongMap!15747)

(assert (=> b!1123081 (= lt!498958 (getCurrentListMapNoExtraKeys!4377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123082 () Bool)

(declare-fun res!750331 () Bool)

(assert (=> b!1123082 (=> (not res!750331) (not e!639386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123082 (= res!750331 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44113 () Bool)

(declare-fun mapRes!44113 () Bool)

(declare-fun tp!83705 () Bool)

(assert (=> mapNonEmpty!44113 (= mapRes!44113 (and tp!83705 e!639384))))

(declare-fun mapRest!44113 () (Array (_ BitVec 32) ValueCell!13389))

(declare-fun mapKey!44113 () (_ BitVec 32))

(declare-fun mapValue!44113 () ValueCell!13389)

(assert (=> mapNonEmpty!44113 (= (arr!35287 _values!996) (store mapRest!44113 mapKey!44113 mapValue!44113))))

(declare-fun res!750328 () Bool)

(assert (=> start!97966 (=> (not res!750328) (not e!639386))))

(assert (=> start!97966 (= res!750328 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35822 _keys!1208))))))

(assert (=> start!97966 e!639386))

(assert (=> start!97966 tp_is_empty!28197))

(declare-fun array_inv!27092 (array!73267) Bool)

(assert (=> start!97966 (array_inv!27092 _keys!1208)))

(assert (=> start!97966 true))

(assert (=> start!97966 tp!83704))

(declare-fun e!639380 () Bool)

(declare-fun array_inv!27093 (array!73269) Bool)

(assert (=> start!97966 (and (array_inv!27093 _values!996) e!639380)))

(declare-fun b!1123083 () Bool)

(declare-fun e!639381 () Bool)

(declare-fun call!47284 () ListLongMap!15747)

(assert (=> b!1123083 (= e!639381 (= call!47284 call!47283))))

(declare-fun b!1123084 () Bool)

(declare-fun res!750324 () Bool)

(assert (=> b!1123084 (=> (not res!750324) (not e!639386))))

(assert (=> b!1123084 (= res!750324 (= (select (arr!35286 _keys!1208) i!673) k0!934))))

(declare-fun b!1123085 () Bool)

(declare-fun e!639387 () Bool)

(assert (=> b!1123085 (= e!639386 e!639387)))

(declare-fun res!750329 () Bool)

(assert (=> b!1123085 (=> (not res!750329) (not e!639387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73267 (_ BitVec 32)) Bool)

(assert (=> b!1123085 (= res!750329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498955 mask!1564))))

(assert (=> b!1123085 (= lt!498955 (array!73268 (store (arr!35286 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35822 _keys!1208)))))

(declare-fun b!1123086 () Bool)

(declare-fun res!750330 () Bool)

(assert (=> b!1123086 (=> (not res!750330) (not e!639387))))

(assert (=> b!1123086 (= res!750330 (arrayNoDuplicates!0 lt!498955 #b00000000000000000000000000000000 Nil!24555))))

(declare-fun b!1123087 () Bool)

(declare-fun res!750321 () Bool)

(assert (=> b!1123087 (=> (not res!750321) (not e!639386))))

(assert (=> b!1123087 (= res!750321 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35822 _keys!1208))))))

(declare-fun b!1123088 () Bool)

(declare-fun e!639379 () Bool)

(assert (=> b!1123088 (= e!639379 tp_is_empty!28197)))

(declare-fun b!1123089 () Bool)

(assert (=> b!1123089 (= e!639380 (and e!639379 mapRes!44113))))

(declare-fun condMapEmpty!44113 () Bool)

(declare-fun mapDefault!44113 () ValueCell!13389)

(assert (=> b!1123089 (= condMapEmpty!44113 (= (arr!35287 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13389)) mapDefault!44113)))))

(declare-fun mapIsEmpty!44113 () Bool)

(assert (=> mapIsEmpty!44113 mapRes!44113))

(declare-fun b!1123090 () Bool)

(declare-fun res!750320 () Bool)

(assert (=> b!1123090 (=> (not res!750320) (not e!639386))))

(assert (=> b!1123090 (= res!750320 (and (= (size!35823 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35822 _keys!1208) (size!35823 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123091 () Bool)

(assert (=> b!1123091 (= e!639383 e!639382)))

(declare-fun res!750325 () Bool)

(assert (=> b!1123091 (=> res!750325 e!639382)))

(assert (=> b!1123091 (= res!750325 (not (= (select (arr!35286 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123091 e!639381))

(declare-fun c!109491 () Bool)

(assert (=> b!1123091 (= c!109491 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36834 0))(
  ( (Unit!36835) )
))
(declare-fun lt!498959 () Unit!36834)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!342 (array!73267 array!73269 (_ BitVec 32) (_ BitVec 32) V!42723 V!42723 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36834)

(assert (=> b!1123091 (= lt!498959 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123092 () Bool)

(declare-fun res!750322 () Bool)

(assert (=> b!1123092 (=> (not res!750322) (not e!639386))))

(assert (=> b!1123092 (= res!750322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47281 () Bool)

(assert (=> bm!47281 (= call!47284 (getCurrentListMapNoExtraKeys!4377 lt!498955 lt!498957 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123093 () Bool)

(assert (=> b!1123093 (= e!639387 (not e!639385))))

(declare-fun res!750327 () Bool)

(assert (=> b!1123093 (=> res!750327 e!639385)))

(assert (=> b!1123093 (= res!750327 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123093 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498954 () Unit!36834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73267 (_ BitVec 64) (_ BitVec 32)) Unit!36834)

(assert (=> b!1123093 (= lt!498954 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123094 () Bool)

(declare-fun -!1095 (ListLongMap!15747 (_ BitVec 64)) ListLongMap!15747)

(assert (=> b!1123094 (= e!639381 (= call!47284 (-!1095 call!47283 k0!934)))))

(assert (= (and start!97966 res!750328) b!1123079))

(assert (= (and b!1123079 res!750326) b!1123090))

(assert (= (and b!1123090 res!750320) b!1123092))

(assert (= (and b!1123092 res!750322) b!1123080))

(assert (= (and b!1123080 res!750319) b!1123087))

(assert (= (and b!1123087 res!750321) b!1123082))

(assert (= (and b!1123082 res!750331) b!1123084))

(assert (= (and b!1123084 res!750324) b!1123085))

(assert (= (and b!1123085 res!750329) b!1123086))

(assert (= (and b!1123086 res!750330) b!1123093))

(assert (= (and b!1123093 (not res!750327)) b!1123081))

(assert (= (and b!1123081 (not res!750323)) b!1123091))

(assert (= (and b!1123091 c!109491) b!1123094))

(assert (= (and b!1123091 (not c!109491)) b!1123083))

(assert (= (or b!1123094 b!1123083) bm!47281))

(assert (= (or b!1123094 b!1123083) bm!47280))

(assert (= (and b!1123091 (not res!750325)) b!1123077))

(assert (= (and b!1123089 condMapEmpty!44113) mapIsEmpty!44113))

(assert (= (and b!1123089 (not condMapEmpty!44113)) mapNonEmpty!44113))

(get-info :version)

(assert (= (and mapNonEmpty!44113 ((_ is ValueCellFull!13389) mapValue!44113)) b!1123078))

(assert (= (and b!1123089 ((_ is ValueCellFull!13389) mapDefault!44113)) b!1123088))

(assert (= start!97966 b!1123089))

(declare-fun b_lambda!18637 () Bool)

(assert (=> (not b_lambda!18637) (not b!1123081)))

(declare-fun t!35215 () Bool)

(declare-fun tb!8479 () Bool)

(assert (=> (and start!97966 (= defaultEntry!1004 defaultEntry!1004) t!35215) tb!8479))

(declare-fun result!17519 () Bool)

(assert (=> tb!8479 (= result!17519 tp_is_empty!28197)))

(assert (=> b!1123081 t!35215))

(declare-fun b_and!38119 () Bool)

(assert (= b_and!38117 (and (=> t!35215 result!17519) b_and!38119)))

(declare-fun m!1037615 () Bool)

(assert (=> bm!47281 m!1037615))

(declare-fun m!1037617 () Bool)

(assert (=> b!1123094 m!1037617))

(declare-fun m!1037619 () Bool)

(assert (=> b!1123092 m!1037619))

(declare-fun m!1037621 () Bool)

(assert (=> b!1123084 m!1037621))

(declare-fun m!1037623 () Bool)

(assert (=> b!1123080 m!1037623))

(declare-fun m!1037625 () Bool)

(assert (=> b!1123079 m!1037625))

(declare-fun m!1037627 () Bool)

(assert (=> b!1123093 m!1037627))

(declare-fun m!1037629 () Bool)

(assert (=> b!1123093 m!1037629))

(declare-fun m!1037631 () Bool)

(assert (=> b!1123082 m!1037631))

(declare-fun m!1037633 () Bool)

(assert (=> start!97966 m!1037633))

(declare-fun m!1037635 () Bool)

(assert (=> start!97966 m!1037635))

(declare-fun m!1037637 () Bool)

(assert (=> bm!47280 m!1037637))

(declare-fun m!1037639 () Bool)

(assert (=> b!1123081 m!1037639))

(declare-fun m!1037641 () Bool)

(assert (=> b!1123081 m!1037641))

(declare-fun m!1037643 () Bool)

(assert (=> b!1123081 m!1037643))

(declare-fun m!1037645 () Bool)

(assert (=> b!1123081 m!1037645))

(declare-fun m!1037647 () Bool)

(assert (=> b!1123086 m!1037647))

(declare-fun m!1037649 () Bool)

(assert (=> b!1123091 m!1037649))

(declare-fun m!1037651 () Bool)

(assert (=> b!1123091 m!1037651))

(assert (=> b!1123077 m!1037637))

(assert (=> b!1123077 m!1037637))

(declare-fun m!1037653 () Bool)

(assert (=> b!1123077 m!1037653))

(declare-fun m!1037655 () Bool)

(assert (=> b!1123085 m!1037655))

(declare-fun m!1037657 () Bool)

(assert (=> b!1123085 m!1037657))

(declare-fun m!1037659 () Bool)

(assert (=> mapNonEmpty!44113 m!1037659))

(check-sat (not b!1123081) (not b!1123080) (not b!1123079) (not b!1123091) (not b!1123086) (not bm!47281) (not b!1123077) (not b!1123085) tp_is_empty!28197 (not b!1123092) (not b_lambda!18637) (not b!1123093) (not mapNonEmpty!44113) (not b!1123082) (not start!97966) (not b!1123094) b_and!38119 (not b_next!23667) (not bm!47280))
(check-sat b_and!38119 (not b_next!23667))
