; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99116 () Bool)

(assert start!99116)

(declare-fun b_free!24727 () Bool)

(declare-fun b_next!24727 () Bool)

(assert (=> start!99116 (= b_free!24727 (not b_next!24727))))

(declare-fun tp!86892 () Bool)

(declare-fun b_and!40281 () Bool)

(assert (=> start!99116 (= tp!86892 b_and!40281)))

(declare-fun b!1166014 () Bool)

(declare-fun e!662804 () Bool)

(assert (=> b!1166014 (= e!662804 true)))

(declare-datatypes ((V!44137 0))(
  ( (V!44138 (val!14685 Int)) )
))
(declare-fun zeroValue!944 () V!44137)

(declare-datatypes ((array!75266 0))(
  ( (array!75267 (arr!36284 (Array (_ BitVec 32) (_ BitVec 64))) (size!36822 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75266)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!524949 () array!75266)

(declare-datatypes ((ValueCell!13919 0))(
  ( (ValueCellFull!13919 (v!17321 V!44137)) (EmptyCell!13919) )
))
(declare-datatypes ((array!75268 0))(
  ( (array!75269 (arr!36285 (Array (_ BitVec 32) ValueCell!13919)) (size!36823 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75268)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!524946 () array!75268)

(declare-fun minValue!944 () V!44137)

(declare-datatypes ((tuple2!18818 0))(
  ( (tuple2!18819 (_1!9420 (_ BitVec 64)) (_2!9420 V!44137)) )
))
(declare-datatypes ((List!25534 0))(
  ( (Nil!25531) (Cons!25530 (h!26739 tuple2!18818) (t!37244 List!25534)) )
))
(declare-datatypes ((ListLongMap!16787 0))(
  ( (ListLongMap!16788 (toList!8409 List!25534)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4885 (array!75266 array!75268 (_ BitVec 32) (_ BitVec 32) V!44137 V!44137 (_ BitVec 32) Int) ListLongMap!16787)

(declare-fun -!1423 (ListLongMap!16787 (_ BitVec 64)) ListLongMap!16787)

(assert (=> b!1166014 (= (getCurrentListMapNoExtraKeys!4885 lt!524949 lt!524946 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1423 (getCurrentListMapNoExtraKeys!4885 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38309 0))(
  ( (Unit!38310) )
))
(declare-fun lt!524948 () Unit!38309)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!687 (array!75266 array!75268 (_ BitVec 32) (_ BitVec 32) V!44137 V!44137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38309)

(assert (=> b!1166014 (= lt!524948 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!687 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166015 () Bool)

(declare-fun e!662805 () Bool)

(declare-fun e!662807 () Bool)

(assert (=> b!1166015 (= e!662805 e!662807)))

(declare-fun res!773396 () Bool)

(assert (=> b!1166015 (=> (not res!773396) (not e!662807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75266 (_ BitVec 32)) Bool)

(assert (=> b!1166015 (= res!773396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524949 mask!1564))))

(assert (=> b!1166015 (= lt!524949 (array!75267 (store (arr!36284 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36822 _keys!1208)))))

(declare-fun mapNonEmpty!45710 () Bool)

(declare-fun mapRes!45710 () Bool)

(declare-fun tp!86891 () Bool)

(declare-fun e!662810 () Bool)

(assert (=> mapNonEmpty!45710 (= mapRes!45710 (and tp!86891 e!662810))))

(declare-fun mapRest!45710 () (Array (_ BitVec 32) ValueCell!13919))

(declare-fun mapValue!45710 () ValueCell!13919)

(declare-fun mapKey!45710 () (_ BitVec 32))

(assert (=> mapNonEmpty!45710 (= (arr!36285 _values!996) (store mapRest!45710 mapKey!45710 mapValue!45710))))

(declare-fun b!1166016 () Bool)

(declare-fun res!773403 () Bool)

(assert (=> b!1166016 (=> (not res!773403) (not e!662805))))

(declare-datatypes ((List!25535 0))(
  ( (Nil!25532) (Cons!25531 (h!26740 (_ BitVec 64)) (t!37245 List!25535)) )
))
(declare-fun arrayNoDuplicates!0 (array!75266 (_ BitVec 32) List!25535) Bool)

(assert (=> b!1166016 (= res!773403 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25532))))

(declare-fun b!1166017 () Bool)

(declare-fun e!662809 () Bool)

(declare-fun e!662808 () Bool)

(assert (=> b!1166017 (= e!662809 (and e!662808 mapRes!45710))))

(declare-fun condMapEmpty!45710 () Bool)

(declare-fun mapDefault!45710 () ValueCell!13919)

(assert (=> b!1166017 (= condMapEmpty!45710 (= (arr!36285 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13919)) mapDefault!45710)))))

(declare-fun b!1166018 () Bool)

(declare-fun res!773401 () Bool)

(assert (=> b!1166018 (=> (not res!773401) (not e!662805))))

(assert (=> b!1166018 (= res!773401 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36822 _keys!1208))))))

(declare-fun b!1166019 () Bool)

(declare-fun tp_is_empty!29257 () Bool)

(assert (=> b!1166019 (= e!662810 tp_is_empty!29257)))

(declare-fun b!1166020 () Bool)

(declare-fun res!773394 () Bool)

(assert (=> b!1166020 (=> (not res!773394) (not e!662807))))

(assert (=> b!1166020 (= res!773394 (arrayNoDuplicates!0 lt!524949 #b00000000000000000000000000000000 Nil!25532))))

(declare-fun b!1166021 () Bool)

(declare-fun e!662806 () Bool)

(assert (=> b!1166021 (= e!662807 (not e!662806))))

(declare-fun res!773402 () Bool)

(assert (=> b!1166021 (=> res!773402 e!662806)))

(assert (=> b!1166021 (= res!773402 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166021 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!524947 () Unit!38309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75266 (_ BitVec 64) (_ BitVec 32)) Unit!38309)

(assert (=> b!1166021 (= lt!524947 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166022 () Bool)

(declare-fun res!773405 () Bool)

(assert (=> b!1166022 (=> (not res!773405) (not e!662805))))

(assert (=> b!1166022 (= res!773405 (= (select (arr!36284 _keys!1208) i!673) k0!934))))

(declare-fun res!773399 () Bool)

(assert (=> start!99116 (=> (not res!773399) (not e!662805))))

(assert (=> start!99116 (= res!773399 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36822 _keys!1208))))))

(assert (=> start!99116 e!662805))

(assert (=> start!99116 tp_is_empty!29257))

(declare-fun array_inv!27848 (array!75266) Bool)

(assert (=> start!99116 (array_inv!27848 _keys!1208)))

(assert (=> start!99116 true))

(assert (=> start!99116 tp!86892))

(declare-fun array_inv!27849 (array!75268) Bool)

(assert (=> start!99116 (and (array_inv!27849 _values!996) e!662809)))

(declare-fun b!1166023 () Bool)

(declare-fun res!773397 () Bool)

(assert (=> b!1166023 (=> (not res!773397) (not e!662805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166023 (= res!773397 (validKeyInArray!0 k0!934))))

(declare-fun b!1166024 () Bool)

(assert (=> b!1166024 (= e!662808 tp_is_empty!29257)))

(declare-fun mapIsEmpty!45710 () Bool)

(assert (=> mapIsEmpty!45710 mapRes!45710))

(declare-fun b!1166025 () Bool)

(declare-fun res!773404 () Bool)

(assert (=> b!1166025 (=> (not res!773404) (not e!662805))))

(assert (=> b!1166025 (= res!773404 (and (= (size!36823 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36822 _keys!1208) (size!36823 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166026 () Bool)

(declare-fun res!773395 () Bool)

(assert (=> b!1166026 (=> (not res!773395) (not e!662805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166026 (= res!773395 (validMask!0 mask!1564))))

(declare-fun b!1166027 () Bool)

(assert (=> b!1166027 (= e!662806 e!662804)))

(declare-fun res!773400 () Bool)

(assert (=> b!1166027 (=> res!773400 e!662804)))

(assert (=> b!1166027 (= res!773400 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!524944 () ListLongMap!16787)

(assert (=> b!1166027 (= lt!524944 (getCurrentListMapNoExtraKeys!4885 lt!524949 lt!524946 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2818 (Int (_ BitVec 64)) V!44137)

(assert (=> b!1166027 (= lt!524946 (array!75269 (store (arr!36285 _values!996) i!673 (ValueCellFull!13919 (dynLambda!2818 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36823 _values!996)))))

(declare-fun lt!524945 () ListLongMap!16787)

(assert (=> b!1166027 (= lt!524945 (getCurrentListMapNoExtraKeys!4885 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166028 () Bool)

(declare-fun res!773398 () Bool)

(assert (=> b!1166028 (=> (not res!773398) (not e!662805))))

(assert (=> b!1166028 (= res!773398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99116 res!773399) b!1166026))

(assert (= (and b!1166026 res!773395) b!1166025))

(assert (= (and b!1166025 res!773404) b!1166028))

(assert (= (and b!1166028 res!773398) b!1166016))

(assert (= (and b!1166016 res!773403) b!1166018))

(assert (= (and b!1166018 res!773401) b!1166023))

(assert (= (and b!1166023 res!773397) b!1166022))

(assert (= (and b!1166022 res!773405) b!1166015))

(assert (= (and b!1166015 res!773396) b!1166020))

(assert (= (and b!1166020 res!773394) b!1166021))

(assert (= (and b!1166021 (not res!773402)) b!1166027))

(assert (= (and b!1166027 (not res!773400)) b!1166014))

(assert (= (and b!1166017 condMapEmpty!45710) mapIsEmpty!45710))

(assert (= (and b!1166017 (not condMapEmpty!45710)) mapNonEmpty!45710))

(get-info :version)

(assert (= (and mapNonEmpty!45710 ((_ is ValueCellFull!13919) mapValue!45710)) b!1166019))

(assert (= (and b!1166017 ((_ is ValueCellFull!13919) mapDefault!45710)) b!1166024))

(assert (= start!99116 b!1166017))

(declare-fun b_lambda!19815 () Bool)

(assert (=> (not b_lambda!19815) (not b!1166027)))

(declare-fun t!37243 () Bool)

(declare-fun tb!9531 () Bool)

(assert (=> (and start!99116 (= defaultEntry!1004 defaultEntry!1004) t!37243) tb!9531))

(declare-fun result!19635 () Bool)

(assert (=> tb!9531 (= result!19635 tp_is_empty!29257)))

(assert (=> b!1166027 t!37243))

(declare-fun b_and!40283 () Bool)

(assert (= b_and!40281 (and (=> t!37243 result!19635) b_and!40283)))

(declare-fun m!1073599 () Bool)

(assert (=> b!1166027 m!1073599))

(declare-fun m!1073601 () Bool)

(assert (=> b!1166027 m!1073601))

(declare-fun m!1073603 () Bool)

(assert (=> b!1166027 m!1073603))

(declare-fun m!1073605 () Bool)

(assert (=> b!1166027 m!1073605))

(declare-fun m!1073607 () Bool)

(assert (=> b!1166026 m!1073607))

(declare-fun m!1073609 () Bool)

(assert (=> start!99116 m!1073609))

(declare-fun m!1073611 () Bool)

(assert (=> start!99116 m!1073611))

(declare-fun m!1073613 () Bool)

(assert (=> b!1166028 m!1073613))

(declare-fun m!1073615 () Bool)

(assert (=> b!1166022 m!1073615))

(declare-fun m!1073617 () Bool)

(assert (=> mapNonEmpty!45710 m!1073617))

(declare-fun m!1073619 () Bool)

(assert (=> b!1166021 m!1073619))

(declare-fun m!1073621 () Bool)

(assert (=> b!1166021 m!1073621))

(declare-fun m!1073623 () Bool)

(assert (=> b!1166023 m!1073623))

(declare-fun m!1073625 () Bool)

(assert (=> b!1166020 m!1073625))

(declare-fun m!1073627 () Bool)

(assert (=> b!1166016 m!1073627))

(declare-fun m!1073629 () Bool)

(assert (=> b!1166014 m!1073629))

(declare-fun m!1073631 () Bool)

(assert (=> b!1166014 m!1073631))

(assert (=> b!1166014 m!1073631))

(declare-fun m!1073633 () Bool)

(assert (=> b!1166014 m!1073633))

(declare-fun m!1073635 () Bool)

(assert (=> b!1166014 m!1073635))

(declare-fun m!1073637 () Bool)

(assert (=> b!1166015 m!1073637))

(declare-fun m!1073639 () Bool)

(assert (=> b!1166015 m!1073639))

(check-sat (not b!1166021) (not b!1166015) (not b!1166026) (not b_next!24727) (not b!1166023) (not b!1166027) (not start!99116) (not b_lambda!19815) tp_is_empty!29257 b_and!40283 (not mapNonEmpty!45710) (not b!1166016) (not b!1166028) (not b!1166014) (not b!1166020))
(check-sat b_and!40283 (not b_next!24727))
