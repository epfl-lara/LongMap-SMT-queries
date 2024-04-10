; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98062 () Bool)

(assert start!98062)

(declare-fun b_free!23763 () Bool)

(declare-fun b_next!23763 () Bool)

(assert (=> start!98062 (= b_free!23763 (not b_next!23763))))

(declare-fun tp!83992 () Bool)

(declare-fun b_and!38309 () Bool)

(assert (=> start!98062 (= tp!83992 b_and!38309)))

(declare-fun res!752383 () Bool)

(declare-fun e!640908 () Bool)

(assert (=> start!98062 (=> (not res!752383) (not e!640908))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73449 0))(
  ( (array!73450 (arr!35377 (Array (_ BitVec 32) (_ BitVec 64))) (size!35913 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73449)

(assert (=> start!98062 (= res!752383 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35913 _keys!1208))))))

(assert (=> start!98062 e!640908))

(declare-fun tp_is_empty!28293 () Bool)

(assert (=> start!98062 tp_is_empty!28293))

(declare-fun array_inv!27154 (array!73449) Bool)

(assert (=> start!98062 (array_inv!27154 _keys!1208)))

(assert (=> start!98062 true))

(assert (=> start!98062 tp!83992))

(declare-datatypes ((V!42851 0))(
  ( (V!42852 (val!14203 Int)) )
))
(declare-datatypes ((ValueCell!13437 0))(
  ( (ValueCellFull!13437 (v!16836 V!42851)) (EmptyCell!13437) )
))
(declare-datatypes ((array!73451 0))(
  ( (array!73452 (arr!35378 (Array (_ BitVec 32) ValueCell!13437)) (size!35914 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73451)

(declare-fun e!640909 () Bool)

(declare-fun array_inv!27155 (array!73451) Bool)

(assert (=> start!98062 (and (array_inv!27155 _values!996) e!640909)))

(declare-fun b!1125954 () Bool)

(declare-fun res!752382 () Bool)

(declare-fun e!640917 () Bool)

(assert (=> b!1125954 (=> (not res!752382) (not e!640917))))

(declare-fun lt!500046 () array!73449)

(declare-datatypes ((List!24632 0))(
  ( (Nil!24629) (Cons!24628 (h!25837 (_ BitVec 64)) (t!35387 List!24632)) )
))
(declare-fun arrayNoDuplicates!0 (array!73449 (_ BitVec 32) List!24632) Bool)

(assert (=> b!1125954 (= res!752382 (arrayNoDuplicates!0 lt!500046 #b00000000000000000000000000000000 Nil!24629))))

(declare-fun b!1125955 () Bool)

(declare-fun res!752381 () Bool)

(assert (=> b!1125955 (=> (not res!752381) (not e!640908))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1125955 (= res!752381 (and (= (size!35914 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35913 _keys!1208) (size!35914 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!17854 0))(
  ( (tuple2!17855 (_1!8938 (_ BitVec 64)) (_2!8938 V!42851)) )
))
(declare-datatypes ((List!24633 0))(
  ( (Nil!24630) (Cons!24629 (h!25838 tuple2!17854) (t!35388 List!24633)) )
))
(declare-datatypes ((ListLongMap!15823 0))(
  ( (ListLongMap!15824 (toList!7927 List!24633)) )
))
(declare-fun call!47571 () ListLongMap!15823)

(declare-fun b!1125956 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!640911 () Bool)

(declare-fun call!47572 () ListLongMap!15823)

(declare-fun -!1124 (ListLongMap!15823 (_ BitVec 64)) ListLongMap!15823)

(assert (=> b!1125956 (= e!640911 (= call!47572 (-!1124 call!47571 k0!934)))))

(declare-fun b!1125957 () Bool)

(declare-fun e!640913 () Bool)

(declare-fun mapRes!44257 () Bool)

(assert (=> b!1125957 (= e!640909 (and e!640913 mapRes!44257))))

(declare-fun condMapEmpty!44257 () Bool)

(declare-fun mapDefault!44257 () ValueCell!13437)

(assert (=> b!1125957 (= condMapEmpty!44257 (= (arr!35378 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13437)) mapDefault!44257)))))

(declare-fun b!1125958 () Bool)

(declare-fun res!752387 () Bool)

(assert (=> b!1125958 (=> (not res!752387) (not e!640908))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125958 (= res!752387 (= (select (arr!35377 _keys!1208) i!673) k0!934))))

(declare-fun zeroValue!944 () V!42851)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!500045 () array!73451)

(declare-fun minValue!944 () V!42851)

(declare-fun bm!47568 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4415 (array!73449 array!73451 (_ BitVec 32) (_ BitVec 32) V!42851 V!42851 (_ BitVec 32) Int) ListLongMap!15823)

(assert (=> bm!47568 (= call!47572 (getCurrentListMapNoExtraKeys!4415 lt!500046 lt!500045 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125959 () Bool)

(declare-fun e!640912 () Bool)

(assert (=> b!1125959 (= e!640912 true)))

(declare-fun lt!500043 () Bool)

(declare-fun contains!6462 (ListLongMap!15823 (_ BitVec 64)) Bool)

(assert (=> b!1125959 (= lt!500043 (contains!6462 (getCurrentListMapNoExtraKeys!4415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1125960 () Bool)

(declare-fun res!752392 () Bool)

(assert (=> b!1125960 (=> (not res!752392) (not e!640908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125960 (= res!752392 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44257 () Bool)

(assert (=> mapIsEmpty!44257 mapRes!44257))

(declare-fun b!1125961 () Bool)

(declare-fun res!752385 () Bool)

(assert (=> b!1125961 (=> (not res!752385) (not e!640908))))

(assert (=> b!1125961 (= res!752385 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24629))))

(declare-fun b!1125962 () Bool)

(assert (=> b!1125962 (= e!640911 (= call!47572 call!47571))))

(declare-fun b!1125963 () Bool)

(assert (=> b!1125963 (= e!640908 e!640917)))

(declare-fun res!752391 () Bool)

(assert (=> b!1125963 (=> (not res!752391) (not e!640917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73449 (_ BitVec 32)) Bool)

(assert (=> b!1125963 (= res!752391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500046 mask!1564))))

(assert (=> b!1125963 (= lt!500046 (array!73450 (store (arr!35377 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35913 _keys!1208)))))

(declare-fun bm!47569 () Bool)

(assert (=> bm!47569 (= call!47571 (getCurrentListMapNoExtraKeys!4415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125964 () Bool)

(declare-fun e!640916 () Bool)

(declare-fun e!640914 () Bool)

(assert (=> b!1125964 (= e!640916 e!640914)))

(declare-fun res!752390 () Bool)

(assert (=> b!1125964 (=> res!752390 e!640914)))

(assert (=> b!1125964 (= res!752390 (not (= from!1455 i!673)))))

(declare-fun lt!500047 () ListLongMap!15823)

(assert (=> b!1125964 (= lt!500047 (getCurrentListMapNoExtraKeys!4415 lt!500046 lt!500045 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2505 (Int (_ BitVec 64)) V!42851)

(assert (=> b!1125964 (= lt!500045 (array!73452 (store (arr!35378 _values!996) i!673 (ValueCellFull!13437 (dynLambda!2505 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35914 _values!996)))))

(declare-fun lt!500044 () ListLongMap!15823)

(assert (=> b!1125964 (= lt!500044 (getCurrentListMapNoExtraKeys!4415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125965 () Bool)

(assert (=> b!1125965 (= e!640917 (not e!640916))))

(declare-fun res!752384 () Bool)

(assert (=> b!1125965 (=> res!752384 e!640916)))

(assert (=> b!1125965 (= res!752384 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125965 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36902 0))(
  ( (Unit!36903) )
))
(declare-fun lt!500042 () Unit!36902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73449 (_ BitVec 64) (_ BitVec 32)) Unit!36902)

(assert (=> b!1125965 (= lt!500042 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44257 () Bool)

(declare-fun tp!83993 () Bool)

(declare-fun e!640915 () Bool)

(assert (=> mapNonEmpty!44257 (= mapRes!44257 (and tp!83993 e!640915))))

(declare-fun mapKey!44257 () (_ BitVec 32))

(declare-fun mapValue!44257 () ValueCell!13437)

(declare-fun mapRest!44257 () (Array (_ BitVec 32) ValueCell!13437))

(assert (=> mapNonEmpty!44257 (= (arr!35378 _values!996) (store mapRest!44257 mapKey!44257 mapValue!44257))))

(declare-fun b!1125966 () Bool)

(assert (=> b!1125966 (= e!640914 e!640912)))

(declare-fun res!752388 () Bool)

(assert (=> b!1125966 (=> res!752388 e!640912)))

(assert (=> b!1125966 (= res!752388 (not (= (select (arr!35377 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125966 e!640911))

(declare-fun c!109635 () Bool)

(assert (=> b!1125966 (= c!109635 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500048 () Unit!36902)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!372 (array!73449 array!73451 (_ BitVec 32) (_ BitVec 32) V!42851 V!42851 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36902)

(assert (=> b!1125966 (= lt!500048 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!372 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125967 () Bool)

(declare-fun res!752386 () Bool)

(assert (=> b!1125967 (=> (not res!752386) (not e!640908))))

(assert (=> b!1125967 (= res!752386 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35913 _keys!1208))))))

(declare-fun b!1125968 () Bool)

(declare-fun res!752380 () Bool)

(assert (=> b!1125968 (=> (not res!752380) (not e!640908))))

(assert (=> b!1125968 (= res!752380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125969 () Bool)

(assert (=> b!1125969 (= e!640913 tp_is_empty!28293)))

(declare-fun b!1125970 () Bool)

(assert (=> b!1125970 (= e!640915 tp_is_empty!28293)))

(declare-fun b!1125971 () Bool)

(declare-fun res!752389 () Bool)

(assert (=> b!1125971 (=> (not res!752389) (not e!640908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125971 (= res!752389 (validKeyInArray!0 k0!934))))

(assert (= (and start!98062 res!752383) b!1125960))

(assert (= (and b!1125960 res!752392) b!1125955))

(assert (= (and b!1125955 res!752381) b!1125968))

(assert (= (and b!1125968 res!752380) b!1125961))

(assert (= (and b!1125961 res!752385) b!1125967))

(assert (= (and b!1125967 res!752386) b!1125971))

(assert (= (and b!1125971 res!752389) b!1125958))

(assert (= (and b!1125958 res!752387) b!1125963))

(assert (= (and b!1125963 res!752391) b!1125954))

(assert (= (and b!1125954 res!752382) b!1125965))

(assert (= (and b!1125965 (not res!752384)) b!1125964))

(assert (= (and b!1125964 (not res!752390)) b!1125966))

(assert (= (and b!1125966 c!109635) b!1125956))

(assert (= (and b!1125966 (not c!109635)) b!1125962))

(assert (= (or b!1125956 b!1125962) bm!47568))

(assert (= (or b!1125956 b!1125962) bm!47569))

(assert (= (and b!1125966 (not res!752388)) b!1125959))

(assert (= (and b!1125957 condMapEmpty!44257) mapIsEmpty!44257))

(assert (= (and b!1125957 (not condMapEmpty!44257)) mapNonEmpty!44257))

(get-info :version)

(assert (= (and mapNonEmpty!44257 ((_ is ValueCellFull!13437) mapValue!44257)) b!1125970))

(assert (= (and b!1125957 ((_ is ValueCellFull!13437) mapDefault!44257)) b!1125969))

(assert (= start!98062 b!1125957))

(declare-fun b_lambda!18733 () Bool)

(assert (=> (not b_lambda!18733) (not b!1125964)))

(declare-fun t!35386 () Bool)

(declare-fun tb!8575 () Bool)

(assert (=> (and start!98062 (= defaultEntry!1004 defaultEntry!1004) t!35386) tb!8575))

(declare-fun result!17711 () Bool)

(assert (=> tb!8575 (= result!17711 tp_is_empty!28293)))

(assert (=> b!1125964 t!35386))

(declare-fun b_and!38311 () Bool)

(assert (= b_and!38309 (and (=> t!35386 result!17711) b_and!38311)))

(declare-fun m!1040005 () Bool)

(assert (=> b!1125958 m!1040005))

(declare-fun m!1040007 () Bool)

(assert (=> b!1125960 m!1040007))

(declare-fun m!1040009 () Bool)

(assert (=> b!1125963 m!1040009))

(declare-fun m!1040011 () Bool)

(assert (=> b!1125963 m!1040011))

(declare-fun m!1040013 () Bool)

(assert (=> b!1125964 m!1040013))

(declare-fun m!1040015 () Bool)

(assert (=> b!1125964 m!1040015))

(declare-fun m!1040017 () Bool)

(assert (=> b!1125964 m!1040017))

(declare-fun m!1040019 () Bool)

(assert (=> b!1125964 m!1040019))

(declare-fun m!1040021 () Bool)

(assert (=> bm!47569 m!1040021))

(declare-fun m!1040023 () Bool)

(assert (=> b!1125965 m!1040023))

(declare-fun m!1040025 () Bool)

(assert (=> b!1125965 m!1040025))

(declare-fun m!1040027 () Bool)

(assert (=> b!1125966 m!1040027))

(declare-fun m!1040029 () Bool)

(assert (=> b!1125966 m!1040029))

(declare-fun m!1040031 () Bool)

(assert (=> start!98062 m!1040031))

(declare-fun m!1040033 () Bool)

(assert (=> start!98062 m!1040033))

(declare-fun m!1040035 () Bool)

(assert (=> b!1125961 m!1040035))

(declare-fun m!1040037 () Bool)

(assert (=> mapNonEmpty!44257 m!1040037))

(assert (=> b!1125959 m!1040021))

(assert (=> b!1125959 m!1040021))

(declare-fun m!1040039 () Bool)

(assert (=> b!1125959 m!1040039))

(declare-fun m!1040041 () Bool)

(assert (=> b!1125968 m!1040041))

(declare-fun m!1040043 () Bool)

(assert (=> b!1125956 m!1040043))

(declare-fun m!1040045 () Bool)

(assert (=> b!1125971 m!1040045))

(declare-fun m!1040047 () Bool)

(assert (=> bm!47568 m!1040047))

(declare-fun m!1040049 () Bool)

(assert (=> b!1125954 m!1040049))

(check-sat (not mapNonEmpty!44257) (not b!1125966) (not b!1125971) (not b!1125954) (not b_next!23763) (not b!1125959) (not start!98062) (not b!1125963) (not b!1125968) (not b!1125961) (not b!1125960) (not bm!47568) (not b!1125965) (not b!1125956) (not b!1125964) tp_is_empty!28293 b_and!38311 (not b_lambda!18733) (not bm!47569))
(check-sat b_and!38311 (not b_next!23763))
