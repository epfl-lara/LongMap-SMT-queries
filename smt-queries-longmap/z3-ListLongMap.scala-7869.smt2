; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97960 () Bool)

(assert start!97960)

(declare-fun b_free!23661 () Bool)

(declare-fun b_next!23661 () Bool)

(assert (=> start!97960 (= b_free!23661 (not b_next!23661))))

(declare-fun tp!83687 () Bool)

(declare-fun b_and!38105 () Bool)

(assert (=> start!97960 (= tp!83687 b_and!38105)))

(declare-datatypes ((V!42715 0))(
  ( (V!42716 (val!14152 Int)) )
))
(declare-datatypes ((tuple2!17772 0))(
  ( (tuple2!17773 (_1!8897 (_ BitVec 64)) (_2!8897 V!42715)) )
))
(declare-datatypes ((List!24551 0))(
  ( (Nil!24548) (Cons!24547 (h!25756 tuple2!17772) (t!35204 List!24551)) )
))
(declare-datatypes ((ListLongMap!15741 0))(
  ( (ListLongMap!15742 (toList!7886 List!24551)) )
))
(declare-fun call!47265 () ListLongMap!15741)

(declare-fun b!1122909 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!639294 () Bool)

(declare-fun call!47266 () ListLongMap!15741)

(declare-fun -!1092 (ListLongMap!15741 (_ BitVec 64)) ListLongMap!15741)

(assert (=> b!1122909 (= e!639294 (= call!47266 (-!1092 call!47265 k0!934)))))

(declare-fun b!1122910 () Bool)

(declare-fun res!750207 () Bool)

(declare-fun e!639295 () Bool)

(assert (=> b!1122910 (=> (not res!750207) (not e!639295))))

(declare-datatypes ((array!73255 0))(
  ( (array!73256 (arr!35280 (Array (_ BitVec 32) (_ BitVec 64))) (size!35816 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73255)

(declare-datatypes ((List!24552 0))(
  ( (Nil!24549) (Cons!24548 (h!25757 (_ BitVec 64)) (t!35205 List!24552)) )
))
(declare-fun arrayNoDuplicates!0 (array!73255 (_ BitVec 32) List!24552) Bool)

(assert (=> b!1122910 (= res!750207 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24549))))

(declare-fun zeroValue!944 () V!42715)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47262 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13386 0))(
  ( (ValueCellFull!13386 (v!16785 V!42715)) (EmptyCell!13386) )
))
(declare-datatypes ((array!73257 0))(
  ( (array!73258 (arr!35281 (Array (_ BitVec 32) ValueCell!13386)) (size!35817 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73257)

(declare-fun minValue!944 () V!42715)

(declare-fun getCurrentListMapNoExtraKeys!4374 (array!73255 array!73257 (_ BitVec 32) (_ BitVec 32) V!42715 V!42715 (_ BitVec 32) Int) ListLongMap!15741)

(assert (=> bm!47262 (= call!47265 (getCurrentListMapNoExtraKeys!4374 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122912 () Bool)

(declare-fun res!750213 () Bool)

(assert (=> b!1122912 (=> (not res!750213) (not e!639295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122912 (= res!750213 (validKeyInArray!0 k0!934))))

(declare-fun b!1122913 () Bool)

(declare-fun res!750210 () Bool)

(assert (=> b!1122913 (=> (not res!750210) (not e!639295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122913 (= res!750210 (validMask!0 mask!1564))))

(declare-fun b!1122914 () Bool)

(declare-fun e!639297 () Bool)

(declare-fun e!639293 () Bool)

(assert (=> b!1122914 (= e!639297 e!639293)))

(declare-fun res!750205 () Bool)

(assert (=> b!1122914 (=> res!750205 e!639293)))

(assert (=> b!1122914 (= res!750205 (not (= (select (arr!35280 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1122914 e!639294))

(declare-fun c!109482 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122914 (= c!109482 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36828 0))(
  ( (Unit!36829) )
))
(declare-fun lt!498896 () Unit!36828)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!341 (array!73255 array!73257 (_ BitVec 32) (_ BitVec 32) V!42715 V!42715 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36828)

(assert (=> b!1122914 (= lt!498896 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44104 () Bool)

(declare-fun mapRes!44104 () Bool)

(assert (=> mapIsEmpty!44104 mapRes!44104))

(declare-fun b!1122915 () Bool)

(declare-fun res!750202 () Bool)

(declare-fun e!639291 () Bool)

(assert (=> b!1122915 (=> (not res!750202) (not e!639291))))

(declare-fun lt!498894 () array!73255)

(assert (=> b!1122915 (= res!750202 (arrayNoDuplicates!0 lt!498894 #b00000000000000000000000000000000 Nil!24549))))

(declare-fun bm!47263 () Bool)

(declare-fun lt!498895 () array!73257)

(assert (=> bm!47263 (= call!47266 (getCurrentListMapNoExtraKeys!4374 lt!498894 lt!498895 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122916 () Bool)

(declare-fun res!750206 () Bool)

(assert (=> b!1122916 (=> (not res!750206) (not e!639295))))

(assert (=> b!1122916 (= res!750206 (= (select (arr!35280 _keys!1208) i!673) k0!934))))

(declare-fun b!1122917 () Bool)

(assert (=> b!1122917 (= e!639293 true)))

(declare-fun lt!498890 () Bool)

(declare-fun contains!6427 (ListLongMap!15741 (_ BitVec 64)) Bool)

(assert (=> b!1122917 (= lt!498890 (contains!6427 (getCurrentListMapNoExtraKeys!4374 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1122918 () Bool)

(declare-fun res!750214 () Bool)

(assert (=> b!1122918 (=> (not res!750214) (not e!639295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73255 (_ BitVec 32)) Bool)

(assert (=> b!1122918 (= res!750214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1122919 () Bool)

(declare-fun e!639288 () Bool)

(declare-fun tp_is_empty!28191 () Bool)

(assert (=> b!1122919 (= e!639288 tp_is_empty!28191)))

(declare-fun b!1122920 () Bool)

(declare-fun res!750209 () Bool)

(assert (=> b!1122920 (=> (not res!750209) (not e!639295))))

(assert (=> b!1122920 (= res!750209 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35816 _keys!1208))))))

(declare-fun b!1122911 () Bool)

(assert (=> b!1122911 (= e!639295 e!639291)))

(declare-fun res!750212 () Bool)

(assert (=> b!1122911 (=> (not res!750212) (not e!639291))))

(assert (=> b!1122911 (= res!750212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498894 mask!1564))))

(assert (=> b!1122911 (= lt!498894 (array!73256 (store (arr!35280 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35816 _keys!1208)))))

(declare-fun res!750211 () Bool)

(assert (=> start!97960 (=> (not res!750211) (not e!639295))))

(assert (=> start!97960 (= res!750211 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35816 _keys!1208))))))

(assert (=> start!97960 e!639295))

(assert (=> start!97960 tp_is_empty!28191))

(declare-fun array_inv!27086 (array!73255) Bool)

(assert (=> start!97960 (array_inv!27086 _keys!1208)))

(assert (=> start!97960 true))

(assert (=> start!97960 tp!83687))

(declare-fun e!639289 () Bool)

(declare-fun array_inv!27087 (array!73257) Bool)

(assert (=> start!97960 (and (array_inv!27087 _values!996) e!639289)))

(declare-fun b!1122921 () Bool)

(declare-fun e!639296 () Bool)

(assert (=> b!1122921 (= e!639289 (and e!639296 mapRes!44104))))

(declare-fun condMapEmpty!44104 () Bool)

(declare-fun mapDefault!44104 () ValueCell!13386)

(assert (=> b!1122921 (= condMapEmpty!44104 (= (arr!35281 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13386)) mapDefault!44104)))))

(declare-fun b!1122922 () Bool)

(declare-fun e!639292 () Bool)

(assert (=> b!1122922 (= e!639292 e!639297)))

(declare-fun res!750203 () Bool)

(assert (=> b!1122922 (=> res!750203 e!639297)))

(assert (=> b!1122922 (= res!750203 (not (= from!1455 i!673)))))

(declare-fun lt!498893 () ListLongMap!15741)

(assert (=> b!1122922 (= lt!498893 (getCurrentListMapNoExtraKeys!4374 lt!498894 lt!498895 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2470 (Int (_ BitVec 64)) V!42715)

(assert (=> b!1122922 (= lt!498895 (array!73258 (store (arr!35281 _values!996) i!673 (ValueCellFull!13386 (dynLambda!2470 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35817 _values!996)))))

(declare-fun lt!498892 () ListLongMap!15741)

(assert (=> b!1122922 (= lt!498892 (getCurrentListMapNoExtraKeys!4374 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1122923 () Bool)

(declare-fun res!750204 () Bool)

(assert (=> b!1122923 (=> (not res!750204) (not e!639295))))

(assert (=> b!1122923 (= res!750204 (and (= (size!35817 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35816 _keys!1208) (size!35817 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122924 () Bool)

(assert (=> b!1122924 (= e!639294 (= call!47266 call!47265))))

(declare-fun mapNonEmpty!44104 () Bool)

(declare-fun tp!83686 () Bool)

(assert (=> mapNonEmpty!44104 (= mapRes!44104 (and tp!83686 e!639288))))

(declare-fun mapValue!44104 () ValueCell!13386)

(declare-fun mapRest!44104 () (Array (_ BitVec 32) ValueCell!13386))

(declare-fun mapKey!44104 () (_ BitVec 32))

(assert (=> mapNonEmpty!44104 (= (arr!35281 _values!996) (store mapRest!44104 mapKey!44104 mapValue!44104))))

(declare-fun b!1122925 () Bool)

(assert (=> b!1122925 (= e!639291 (not e!639292))))

(declare-fun res!750208 () Bool)

(assert (=> b!1122925 (=> res!750208 e!639292)))

(assert (=> b!1122925 (= res!750208 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122925 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498891 () Unit!36828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73255 (_ BitVec 64) (_ BitVec 32)) Unit!36828)

(assert (=> b!1122925 (= lt!498891 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122926 () Bool)

(assert (=> b!1122926 (= e!639296 tp_is_empty!28191)))

(assert (= (and start!97960 res!750211) b!1122913))

(assert (= (and b!1122913 res!750210) b!1122923))

(assert (= (and b!1122923 res!750204) b!1122918))

(assert (= (and b!1122918 res!750214) b!1122910))

(assert (= (and b!1122910 res!750207) b!1122920))

(assert (= (and b!1122920 res!750209) b!1122912))

(assert (= (and b!1122912 res!750213) b!1122916))

(assert (= (and b!1122916 res!750206) b!1122911))

(assert (= (and b!1122911 res!750212) b!1122915))

(assert (= (and b!1122915 res!750202) b!1122925))

(assert (= (and b!1122925 (not res!750208)) b!1122922))

(assert (= (and b!1122922 (not res!750203)) b!1122914))

(assert (= (and b!1122914 c!109482) b!1122909))

(assert (= (and b!1122914 (not c!109482)) b!1122924))

(assert (= (or b!1122909 b!1122924) bm!47263))

(assert (= (or b!1122909 b!1122924) bm!47262))

(assert (= (and b!1122914 (not res!750205)) b!1122917))

(assert (= (and b!1122921 condMapEmpty!44104) mapIsEmpty!44104))

(assert (= (and b!1122921 (not condMapEmpty!44104)) mapNonEmpty!44104))

(get-info :version)

(assert (= (and mapNonEmpty!44104 ((_ is ValueCellFull!13386) mapValue!44104)) b!1122919))

(assert (= (and b!1122921 ((_ is ValueCellFull!13386) mapDefault!44104)) b!1122926))

(assert (= start!97960 b!1122921))

(declare-fun b_lambda!18631 () Bool)

(assert (=> (not b_lambda!18631) (not b!1122922)))

(declare-fun t!35203 () Bool)

(declare-fun tb!8473 () Bool)

(assert (=> (and start!97960 (= defaultEntry!1004 defaultEntry!1004) t!35203) tb!8473))

(declare-fun result!17507 () Bool)

(assert (=> tb!8473 (= result!17507 tp_is_empty!28191)))

(assert (=> b!1122922 t!35203))

(declare-fun b_and!38107 () Bool)

(assert (= b_and!38105 (and (=> t!35203 result!17507) b_and!38107)))

(declare-fun m!1037477 () Bool)

(assert (=> bm!47263 m!1037477))

(declare-fun m!1037479 () Bool)

(assert (=> mapNonEmpty!44104 m!1037479))

(declare-fun m!1037481 () Bool)

(assert (=> b!1122909 m!1037481))

(declare-fun m!1037483 () Bool)

(assert (=> b!1122912 m!1037483))

(declare-fun m!1037485 () Bool)

(assert (=> b!1122922 m!1037485))

(declare-fun m!1037487 () Bool)

(assert (=> b!1122922 m!1037487))

(declare-fun m!1037489 () Bool)

(assert (=> b!1122922 m!1037489))

(declare-fun m!1037491 () Bool)

(assert (=> b!1122922 m!1037491))

(declare-fun m!1037493 () Bool)

(assert (=> b!1122913 m!1037493))

(declare-fun m!1037495 () Bool)

(assert (=> b!1122917 m!1037495))

(assert (=> b!1122917 m!1037495))

(declare-fun m!1037497 () Bool)

(assert (=> b!1122917 m!1037497))

(declare-fun m!1037499 () Bool)

(assert (=> start!97960 m!1037499))

(declare-fun m!1037501 () Bool)

(assert (=> start!97960 m!1037501))

(declare-fun m!1037503 () Bool)

(assert (=> b!1122911 m!1037503))

(declare-fun m!1037505 () Bool)

(assert (=> b!1122911 m!1037505))

(declare-fun m!1037507 () Bool)

(assert (=> b!1122918 m!1037507))

(assert (=> bm!47262 m!1037495))

(declare-fun m!1037509 () Bool)

(assert (=> b!1122914 m!1037509))

(declare-fun m!1037511 () Bool)

(assert (=> b!1122914 m!1037511))

(declare-fun m!1037513 () Bool)

(assert (=> b!1122910 m!1037513))

(declare-fun m!1037515 () Bool)

(assert (=> b!1122916 m!1037515))

(declare-fun m!1037517 () Bool)

(assert (=> b!1122915 m!1037517))

(declare-fun m!1037519 () Bool)

(assert (=> b!1122925 m!1037519))

(declare-fun m!1037521 () Bool)

(assert (=> b!1122925 m!1037521))

(check-sat (not b!1122912) (not start!97960) (not b_lambda!18631) (not bm!47262) (not b!1122909) (not bm!47263) (not b!1122914) tp_is_empty!28191 (not b!1122917) (not b!1122910) (not b!1122918) (not b!1122913) (not b!1122911) (not b!1122922) (not b!1122925) (not b!1122915) (not mapNonEmpty!44104) (not b_next!23661) b_and!38107)
(check-sat b_and!38107 (not b_next!23661))
