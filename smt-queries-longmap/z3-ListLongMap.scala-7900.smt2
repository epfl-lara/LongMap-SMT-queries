; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98146 () Bool)

(assert start!98146)

(declare-fun b_free!23847 () Bool)

(declare-fun b_next!23847 () Bool)

(assert (=> start!98146 (= b_free!23847 (not b_next!23847))))

(declare-fun tp!84245 () Bool)

(declare-fun b_and!38477 () Bool)

(assert (=> start!98146 (= tp!84245 b_and!38477)))

(declare-fun b!1128315 () Bool)

(declare-fun e!642172 () Bool)

(declare-fun tp_is_empty!28377 () Bool)

(assert (=> b!1128315 (= e!642172 tp_is_empty!28377)))

(declare-fun mapIsEmpty!44383 () Bool)

(declare-fun mapRes!44383 () Bool)

(assert (=> mapIsEmpty!44383 mapRes!44383))

(declare-fun b!1128316 () Bool)

(declare-fun res!754032 () Bool)

(declare-fun e!642171 () Bool)

(assert (=> b!1128316 (=> (not res!754032) (not e!642171))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73613 0))(
  ( (array!73614 (arr!35459 (Array (_ BitVec 32) (_ BitVec 64))) (size!35995 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73613)

(assert (=> b!1128316 (= res!754032 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35995 _keys!1208))))))

(declare-fun b!1128317 () Bool)

(declare-fun e!642176 () Bool)

(assert (=> b!1128317 (= e!642176 tp_is_empty!28377)))

(declare-fun b!1128318 () Bool)

(declare-fun e!642175 () Bool)

(declare-fun e!642169 () Bool)

(assert (=> b!1128318 (= e!642175 e!642169)))

(declare-fun res!754034 () Bool)

(assert (=> b!1128318 (=> res!754034 e!642169)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1128318 (= res!754034 (not (= (select (arr!35459 _keys!1208) from!1455) k0!934)))))

(declare-fun e!642174 () Bool)

(assert (=> b!1128318 e!642174))

(declare-fun c!109761 () Bool)

(assert (=> b!1128318 (= c!109761 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42963 0))(
  ( (V!42964 (val!14245 Int)) )
))
(declare-fun zeroValue!944 () V!42963)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36966 0))(
  ( (Unit!36967) )
))
(declare-fun lt!500917 () Unit!36966)

(declare-datatypes ((ValueCell!13479 0))(
  ( (ValueCellFull!13479 (v!16878 V!42963)) (EmptyCell!13479) )
))
(declare-datatypes ((array!73615 0))(
  ( (array!73616 (arr!35460 (Array (_ BitVec 32) ValueCell!13479)) (size!35996 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73615)

(declare-fun minValue!944 () V!42963)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!401 (array!73613 array!73615 (_ BitVec 32) (_ BitVec 32) V!42963 V!42963 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36966)

(assert (=> b!1128318 (= lt!500917 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128319 () Bool)

(declare-fun e!642170 () Bool)

(assert (=> b!1128319 (= e!642170 e!642175)))

(declare-fun res!754035 () Bool)

(assert (=> b!1128319 (=> res!754035 e!642175)))

(assert (=> b!1128319 (= res!754035 (not (= from!1455 i!673)))))

(declare-fun lt!500921 () array!73613)

(declare-datatypes ((tuple2!17926 0))(
  ( (tuple2!17927 (_1!8974 (_ BitVec 64)) (_2!8974 V!42963)) )
))
(declare-datatypes ((List!24695 0))(
  ( (Nil!24692) (Cons!24691 (h!25900 tuple2!17926) (t!35534 List!24695)) )
))
(declare-datatypes ((ListLongMap!15895 0))(
  ( (ListLongMap!15896 (toList!7963 List!24695)) )
))
(declare-fun lt!500916 () ListLongMap!15895)

(declare-fun lt!500915 () array!73615)

(declare-fun getCurrentListMapNoExtraKeys!4450 (array!73613 array!73615 (_ BitVec 32) (_ BitVec 32) V!42963 V!42963 (_ BitVec 32) Int) ListLongMap!15895)

(assert (=> b!1128319 (= lt!500916 (getCurrentListMapNoExtraKeys!4450 lt!500921 lt!500915 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2533 (Int (_ BitVec 64)) V!42963)

(assert (=> b!1128319 (= lt!500915 (array!73616 (store (arr!35460 _values!996) i!673 (ValueCellFull!13479 (dynLambda!2533 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35996 _values!996)))))

(declare-fun lt!500919 () ListLongMap!15895)

(assert (=> b!1128319 (= lt!500919 (getCurrentListMapNoExtraKeys!4450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47820 () Bool)

(declare-fun call!47824 () ListLongMap!15895)

(assert (=> bm!47820 (= call!47824 (getCurrentListMapNoExtraKeys!4450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44383 () Bool)

(declare-fun tp!84244 () Bool)

(assert (=> mapNonEmpty!44383 (= mapRes!44383 (and tp!84244 e!642176))))

(declare-fun mapValue!44383 () ValueCell!13479)

(declare-fun mapKey!44383 () (_ BitVec 32))

(declare-fun mapRest!44383 () (Array (_ BitVec 32) ValueCell!13479))

(assert (=> mapNonEmpty!44383 (= (arr!35460 _values!996) (store mapRest!44383 mapKey!44383 mapValue!44383))))

(declare-fun b!1128320 () Bool)

(declare-fun res!754036 () Bool)

(assert (=> b!1128320 (=> (not res!754036) (not e!642171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73613 (_ BitVec 32)) Bool)

(assert (=> b!1128320 (= res!754036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128321 () Bool)

(declare-fun res!754037 () Bool)

(declare-fun e!642173 () Bool)

(assert (=> b!1128321 (=> (not res!754037) (not e!642173))))

(declare-datatypes ((List!24696 0))(
  ( (Nil!24693) (Cons!24692 (h!25901 (_ BitVec 64)) (t!35535 List!24696)) )
))
(declare-fun arrayNoDuplicates!0 (array!73613 (_ BitVec 32) List!24696) Bool)

(assert (=> b!1128321 (= res!754037 (arrayNoDuplicates!0 lt!500921 #b00000000000000000000000000000000 Nil!24693))))

(declare-fun b!1128322 () Bool)

(declare-fun e!642168 () Bool)

(assert (=> b!1128322 (= e!642168 (and e!642172 mapRes!44383))))

(declare-fun condMapEmpty!44383 () Bool)

(declare-fun mapDefault!44383 () ValueCell!13479)

(assert (=> b!1128322 (= condMapEmpty!44383 (= (arr!35460 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13479)) mapDefault!44383)))))

(declare-fun b!1128323 () Bool)

(declare-fun call!47823 () ListLongMap!15895)

(assert (=> b!1128323 (= e!642174 (= call!47823 call!47824))))

(declare-fun res!754038 () Bool)

(assert (=> start!98146 (=> (not res!754038) (not e!642171))))

(assert (=> start!98146 (= res!754038 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35995 _keys!1208))))))

(assert (=> start!98146 e!642171))

(assert (=> start!98146 tp_is_empty!28377))

(declare-fun array_inv!27208 (array!73613) Bool)

(assert (=> start!98146 (array_inv!27208 _keys!1208)))

(assert (=> start!98146 true))

(assert (=> start!98146 tp!84245))

(declare-fun array_inv!27209 (array!73615) Bool)

(assert (=> start!98146 (and (array_inv!27209 _values!996) e!642168)))

(declare-fun b!1128324 () Bool)

(assert (=> b!1128324 (= e!642169 true)))

(declare-fun lt!500920 () Bool)

(declare-fun contains!6488 (ListLongMap!15895 (_ BitVec 64)) Bool)

(assert (=> b!1128324 (= lt!500920 (contains!6488 (getCurrentListMapNoExtraKeys!4450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1128325 () Bool)

(declare-fun res!754030 () Bool)

(assert (=> b!1128325 (=> (not res!754030) (not e!642171))))

(assert (=> b!1128325 (= res!754030 (= (select (arr!35459 _keys!1208) i!673) k0!934))))

(declare-fun b!1128326 () Bool)

(declare-fun res!754031 () Bool)

(assert (=> b!1128326 (=> (not res!754031) (not e!642171))))

(assert (=> b!1128326 (= res!754031 (and (= (size!35996 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35995 _keys!1208) (size!35996 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128327 () Bool)

(declare-fun res!754027 () Bool)

(assert (=> b!1128327 (=> (not res!754027) (not e!642171))))

(assert (=> b!1128327 (= res!754027 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24693))))

(declare-fun b!1128328 () Bool)

(declare-fun res!754028 () Bool)

(assert (=> b!1128328 (=> (not res!754028) (not e!642171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128328 (= res!754028 (validMask!0 mask!1564))))

(declare-fun b!1128329 () Bool)

(declare-fun res!754039 () Bool)

(assert (=> b!1128329 (=> (not res!754039) (not e!642171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128329 (= res!754039 (validKeyInArray!0 k0!934))))

(declare-fun bm!47821 () Bool)

(assert (=> bm!47821 (= call!47823 (getCurrentListMapNoExtraKeys!4450 lt!500921 lt!500915 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128330 () Bool)

(declare-fun -!1148 (ListLongMap!15895 (_ BitVec 64)) ListLongMap!15895)

(assert (=> b!1128330 (= e!642174 (= call!47823 (-!1148 call!47824 k0!934)))))

(declare-fun b!1128331 () Bool)

(assert (=> b!1128331 (= e!642173 (not e!642170))))

(declare-fun res!754033 () Bool)

(assert (=> b!1128331 (=> res!754033 e!642170)))

(assert (=> b!1128331 (= res!754033 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128331 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500918 () Unit!36966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73613 (_ BitVec 64) (_ BitVec 32)) Unit!36966)

(assert (=> b!1128331 (= lt!500918 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128332 () Bool)

(assert (=> b!1128332 (= e!642171 e!642173)))

(declare-fun res!754029 () Bool)

(assert (=> b!1128332 (=> (not res!754029) (not e!642173))))

(assert (=> b!1128332 (= res!754029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500921 mask!1564))))

(assert (=> b!1128332 (= lt!500921 (array!73614 (store (arr!35459 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35995 _keys!1208)))))

(assert (= (and start!98146 res!754038) b!1128328))

(assert (= (and b!1128328 res!754028) b!1128326))

(assert (= (and b!1128326 res!754031) b!1128320))

(assert (= (and b!1128320 res!754036) b!1128327))

(assert (= (and b!1128327 res!754027) b!1128316))

(assert (= (and b!1128316 res!754032) b!1128329))

(assert (= (and b!1128329 res!754039) b!1128325))

(assert (= (and b!1128325 res!754030) b!1128332))

(assert (= (and b!1128332 res!754029) b!1128321))

(assert (= (and b!1128321 res!754037) b!1128331))

(assert (= (and b!1128331 (not res!754033)) b!1128319))

(assert (= (and b!1128319 (not res!754035)) b!1128318))

(assert (= (and b!1128318 c!109761) b!1128330))

(assert (= (and b!1128318 (not c!109761)) b!1128323))

(assert (= (or b!1128330 b!1128323) bm!47821))

(assert (= (or b!1128330 b!1128323) bm!47820))

(assert (= (and b!1128318 (not res!754034)) b!1128324))

(assert (= (and b!1128322 condMapEmpty!44383) mapIsEmpty!44383))

(assert (= (and b!1128322 (not condMapEmpty!44383)) mapNonEmpty!44383))

(get-info :version)

(assert (= (and mapNonEmpty!44383 ((_ is ValueCellFull!13479) mapValue!44383)) b!1128317))

(assert (= (and b!1128322 ((_ is ValueCellFull!13479) mapDefault!44383)) b!1128315))

(assert (= start!98146 b!1128322))

(declare-fun b_lambda!18817 () Bool)

(assert (=> (not b_lambda!18817) (not b!1128319)))

(declare-fun t!35533 () Bool)

(declare-fun tb!8659 () Bool)

(assert (=> (and start!98146 (= defaultEntry!1004 defaultEntry!1004) t!35533) tb!8659))

(declare-fun result!17879 () Bool)

(assert (=> tb!8659 (= result!17879 tp_is_empty!28377)))

(assert (=> b!1128319 t!35533))

(declare-fun b_and!38479 () Bool)

(assert (= b_and!38477 (and (=> t!35533 result!17879) b_and!38479)))

(declare-fun m!1041937 () Bool)

(assert (=> b!1128325 m!1041937))

(declare-fun m!1041939 () Bool)

(assert (=> bm!47821 m!1041939))

(declare-fun m!1041941 () Bool)

(assert (=> b!1128321 m!1041941))

(declare-fun m!1041943 () Bool)

(assert (=> bm!47820 m!1041943))

(declare-fun m!1041945 () Bool)

(assert (=> b!1128319 m!1041945))

(declare-fun m!1041947 () Bool)

(assert (=> b!1128319 m!1041947))

(declare-fun m!1041949 () Bool)

(assert (=> b!1128319 m!1041949))

(declare-fun m!1041951 () Bool)

(assert (=> b!1128319 m!1041951))

(declare-fun m!1041953 () Bool)

(assert (=> b!1128329 m!1041953))

(declare-fun m!1041955 () Bool)

(assert (=> mapNonEmpty!44383 m!1041955))

(declare-fun m!1041957 () Bool)

(assert (=> b!1128330 m!1041957))

(declare-fun m!1041959 () Bool)

(assert (=> b!1128320 m!1041959))

(declare-fun m!1041961 () Bool)

(assert (=> b!1128328 m!1041961))

(assert (=> b!1128324 m!1041943))

(assert (=> b!1128324 m!1041943))

(declare-fun m!1041963 () Bool)

(assert (=> b!1128324 m!1041963))

(declare-fun m!1041965 () Bool)

(assert (=> b!1128332 m!1041965))

(declare-fun m!1041967 () Bool)

(assert (=> b!1128332 m!1041967))

(declare-fun m!1041969 () Bool)

(assert (=> b!1128318 m!1041969))

(declare-fun m!1041971 () Bool)

(assert (=> b!1128318 m!1041971))

(declare-fun m!1041973 () Bool)

(assert (=> b!1128327 m!1041973))

(declare-fun m!1041975 () Bool)

(assert (=> b!1128331 m!1041975))

(declare-fun m!1041977 () Bool)

(assert (=> b!1128331 m!1041977))

(declare-fun m!1041979 () Bool)

(assert (=> start!98146 m!1041979))

(declare-fun m!1041981 () Bool)

(assert (=> start!98146 m!1041981))

(check-sat (not b!1128331) (not b_lambda!18817) (not bm!47821) (not b!1128329) (not b!1128327) (not b!1128321) (not b!1128318) (not b!1128332) (not bm!47820) (not b!1128324) (not start!98146) b_and!38479 tp_is_empty!28377 (not mapNonEmpty!44383) (not b_next!23847) (not b!1128330) (not b!1128319) (not b!1128320) (not b!1128328))
(check-sat b_and!38479 (not b_next!23847))
