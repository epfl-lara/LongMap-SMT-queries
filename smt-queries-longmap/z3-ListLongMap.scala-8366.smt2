; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101780 () Bool)

(assert start!101780)

(declare-fun b_free!26469 () Bool)

(declare-fun b_next!26469 () Bool)

(assert (=> start!101780 (= b_free!26469 (not b_next!26469))))

(declare-fun tp!92453 () Bool)

(declare-fun b_and!44199 () Bool)

(assert (=> start!101780 (= tp!92453 b_and!44199)))

(declare-fun b!1225895 () Bool)

(declare-fun e!696248 () Bool)

(declare-fun e!696249 () Bool)

(assert (=> b!1225895 (= e!696248 (not e!696249))))

(declare-fun res!814711 () Bool)

(assert (=> b!1225895 (=> res!814711 e!696249)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225895 (= res!814711 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!79123 0))(
  ( (array!79124 (arr!38188 (Array (_ BitVec 32) (_ BitVec 64))) (size!38724 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79123)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225895 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40628 0))(
  ( (Unit!40629) )
))
(declare-fun lt!558615 () Unit!40628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79123 (_ BitVec 64) (_ BitVec 32)) Unit!40628)

(assert (=> b!1225895 (= lt!558615 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225896 () Bool)

(declare-fun res!814709 () Bool)

(declare-fun e!696246 () Bool)

(assert (=> b!1225896 (=> (not res!814709) (not e!696246))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46691 0))(
  ( (V!46692 (val!15643 Int)) )
))
(declare-datatypes ((ValueCell!14877 0))(
  ( (ValueCellFull!14877 (v!18305 V!46691)) (EmptyCell!14877) )
))
(declare-datatypes ((array!79125 0))(
  ( (array!79126 (arr!38189 (Array (_ BitVec 32) ValueCell!14877)) (size!38725 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79125)

(assert (=> b!1225896 (= res!814709 (and (= (size!38725 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38724 _keys!1208) (size!38725 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225897 () Bool)

(declare-fun e!696252 () Bool)

(assert (=> b!1225897 (= e!696249 e!696252)))

(declare-fun res!814703 () Bool)

(assert (=> b!1225897 (=> res!814703 e!696252)))

(assert (=> b!1225897 (= res!814703 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46691)

(declare-fun lt!558618 () array!79123)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!558619 () array!79125)

(declare-fun minValue!944 () V!46691)

(declare-datatypes ((tuple2!20162 0))(
  ( (tuple2!20163 (_1!10092 (_ BitVec 64)) (_2!10092 V!46691)) )
))
(declare-datatypes ((List!26964 0))(
  ( (Nil!26961) (Cons!26960 (h!28169 tuple2!20162) (t!40413 List!26964)) )
))
(declare-datatypes ((ListLongMap!18131 0))(
  ( (ListLongMap!18132 (toList!9081 List!26964)) )
))
(declare-fun lt!558620 () ListLongMap!18131)

(declare-fun getCurrentListMapNoExtraKeys!5500 (array!79123 array!79125 (_ BitVec 32) (_ BitVec 32) V!46691 V!46691 (_ BitVec 32) Int) ListLongMap!18131)

(assert (=> b!1225897 (= lt!558620 (getCurrentListMapNoExtraKeys!5500 lt!558618 lt!558619 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3371 (Int (_ BitVec 64)) V!46691)

(assert (=> b!1225897 (= lt!558619 (array!79126 (store (arr!38189 _values!996) i!673 (ValueCellFull!14877 (dynLambda!3371 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38725 _values!996)))))

(declare-fun lt!558616 () ListLongMap!18131)

(assert (=> b!1225897 (= lt!558616 (getCurrentListMapNoExtraKeys!5500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!48658 () Bool)

(declare-fun mapRes!48658 () Bool)

(assert (=> mapIsEmpty!48658 mapRes!48658))

(declare-fun b!1225898 () Bool)

(declare-fun res!814712 () Bool)

(assert (=> b!1225898 (=> (not res!814712) (not e!696246))))

(assert (=> b!1225898 (= res!814712 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38724 _keys!1208))))))

(declare-fun b!1225899 () Bool)

(assert (=> b!1225899 (= e!696252 true)))

(declare-fun -!1980 (ListLongMap!18131 (_ BitVec 64)) ListLongMap!18131)

(assert (=> b!1225899 (= (getCurrentListMapNoExtraKeys!5500 lt!558618 lt!558619 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1980 (getCurrentListMapNoExtraKeys!5500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!558617 () Unit!40628)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1186 (array!79123 array!79125 (_ BitVec 32) (_ BitVec 32) V!46691 V!46691 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40628)

(assert (=> b!1225899 (= lt!558617 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1186 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225900 () Bool)

(declare-fun res!814707 () Bool)

(assert (=> b!1225900 (=> (not res!814707) (not e!696246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225900 (= res!814707 (validMask!0 mask!1564))))

(declare-fun b!1225901 () Bool)

(declare-fun res!814708 () Bool)

(assert (=> b!1225901 (=> (not res!814708) (not e!696248))))

(declare-datatypes ((List!26965 0))(
  ( (Nil!26962) (Cons!26961 (h!28170 (_ BitVec 64)) (t!40414 List!26965)) )
))
(declare-fun arrayNoDuplicates!0 (array!79123 (_ BitVec 32) List!26965) Bool)

(assert (=> b!1225901 (= res!814708 (arrayNoDuplicates!0 lt!558618 #b00000000000000000000000000000000 Nil!26962))))

(declare-fun res!814704 () Bool)

(assert (=> start!101780 (=> (not res!814704) (not e!696246))))

(assert (=> start!101780 (= res!814704 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38724 _keys!1208))))))

(assert (=> start!101780 e!696246))

(declare-fun tp_is_empty!31173 () Bool)

(assert (=> start!101780 tp_is_empty!31173))

(declare-fun array_inv!29038 (array!79123) Bool)

(assert (=> start!101780 (array_inv!29038 _keys!1208)))

(assert (=> start!101780 true))

(assert (=> start!101780 tp!92453))

(declare-fun e!696247 () Bool)

(declare-fun array_inv!29039 (array!79125) Bool)

(assert (=> start!101780 (and (array_inv!29039 _values!996) e!696247)))

(declare-fun b!1225902 () Bool)

(declare-fun res!814713 () Bool)

(assert (=> b!1225902 (=> (not res!814713) (not e!696246))))

(assert (=> b!1225902 (= res!814713 (= (select (arr!38188 _keys!1208) i!673) k0!934))))

(declare-fun b!1225903 () Bool)

(assert (=> b!1225903 (= e!696246 e!696248)))

(declare-fun res!814710 () Bool)

(assert (=> b!1225903 (=> (not res!814710) (not e!696248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79123 (_ BitVec 32)) Bool)

(assert (=> b!1225903 (= res!814710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558618 mask!1564))))

(assert (=> b!1225903 (= lt!558618 (array!79124 (store (arr!38188 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38724 _keys!1208)))))

(declare-fun b!1225904 () Bool)

(declare-fun e!696250 () Bool)

(assert (=> b!1225904 (= e!696247 (and e!696250 mapRes!48658))))

(declare-fun condMapEmpty!48658 () Bool)

(declare-fun mapDefault!48658 () ValueCell!14877)

(assert (=> b!1225904 (= condMapEmpty!48658 (= (arr!38189 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14877)) mapDefault!48658)))))

(declare-fun b!1225905 () Bool)

(assert (=> b!1225905 (= e!696250 tp_is_empty!31173)))

(declare-fun b!1225906 () Bool)

(declare-fun res!814714 () Bool)

(assert (=> b!1225906 (=> (not res!814714) (not e!696246))))

(assert (=> b!1225906 (= res!814714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225907 () Bool)

(declare-fun res!814706 () Bool)

(assert (=> b!1225907 (=> (not res!814706) (not e!696246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225907 (= res!814706 (validKeyInArray!0 k0!934))))

(declare-fun b!1225908 () Bool)

(declare-fun res!814705 () Bool)

(assert (=> b!1225908 (=> (not res!814705) (not e!696246))))

(assert (=> b!1225908 (= res!814705 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26962))))

(declare-fun b!1225909 () Bool)

(declare-fun e!696251 () Bool)

(assert (=> b!1225909 (= e!696251 tp_is_empty!31173)))

(declare-fun mapNonEmpty!48658 () Bool)

(declare-fun tp!92452 () Bool)

(assert (=> mapNonEmpty!48658 (= mapRes!48658 (and tp!92452 e!696251))))

(declare-fun mapRest!48658 () (Array (_ BitVec 32) ValueCell!14877))

(declare-fun mapValue!48658 () ValueCell!14877)

(declare-fun mapKey!48658 () (_ BitVec 32))

(assert (=> mapNonEmpty!48658 (= (arr!38189 _values!996) (store mapRest!48658 mapKey!48658 mapValue!48658))))

(assert (= (and start!101780 res!814704) b!1225900))

(assert (= (and b!1225900 res!814707) b!1225896))

(assert (= (and b!1225896 res!814709) b!1225906))

(assert (= (and b!1225906 res!814714) b!1225908))

(assert (= (and b!1225908 res!814705) b!1225898))

(assert (= (and b!1225898 res!814712) b!1225907))

(assert (= (and b!1225907 res!814706) b!1225902))

(assert (= (and b!1225902 res!814713) b!1225903))

(assert (= (and b!1225903 res!814710) b!1225901))

(assert (= (and b!1225901 res!814708) b!1225895))

(assert (= (and b!1225895 (not res!814711)) b!1225897))

(assert (= (and b!1225897 (not res!814703)) b!1225899))

(assert (= (and b!1225904 condMapEmpty!48658) mapIsEmpty!48658))

(assert (= (and b!1225904 (not condMapEmpty!48658)) mapNonEmpty!48658))

(get-info :version)

(assert (= (and mapNonEmpty!48658 ((_ is ValueCellFull!14877) mapValue!48658)) b!1225909))

(assert (= (and b!1225904 ((_ is ValueCellFull!14877) mapDefault!48658)) b!1225905))

(assert (= start!101780 b!1225904))

(declare-fun b_lambda!22449 () Bool)

(assert (=> (not b_lambda!22449) (not b!1225897)))

(declare-fun t!40412 () Bool)

(declare-fun tb!11269 () Bool)

(assert (=> (and start!101780 (= defaultEntry!1004 defaultEntry!1004) t!40412) tb!11269))

(declare-fun result!23151 () Bool)

(assert (=> tb!11269 (= result!23151 tp_is_empty!31173)))

(assert (=> b!1225897 t!40412))

(declare-fun b_and!44201 () Bool)

(assert (= b_and!44199 (and (=> t!40412 result!23151) b_and!44201)))

(declare-fun m!1130999 () Bool)

(assert (=> b!1225907 m!1130999))

(declare-fun m!1131001 () Bool)

(assert (=> b!1225899 m!1131001))

(declare-fun m!1131003 () Bool)

(assert (=> b!1225899 m!1131003))

(assert (=> b!1225899 m!1131003))

(declare-fun m!1131005 () Bool)

(assert (=> b!1225899 m!1131005))

(declare-fun m!1131007 () Bool)

(assert (=> b!1225899 m!1131007))

(declare-fun m!1131009 () Bool)

(assert (=> b!1225895 m!1131009))

(declare-fun m!1131011 () Bool)

(assert (=> b!1225895 m!1131011))

(declare-fun m!1131013 () Bool)

(assert (=> mapNonEmpty!48658 m!1131013))

(declare-fun m!1131015 () Bool)

(assert (=> b!1225900 m!1131015))

(declare-fun m!1131017 () Bool)

(assert (=> b!1225897 m!1131017))

(declare-fun m!1131019 () Bool)

(assert (=> b!1225897 m!1131019))

(declare-fun m!1131021 () Bool)

(assert (=> b!1225897 m!1131021))

(declare-fun m!1131023 () Bool)

(assert (=> b!1225897 m!1131023))

(declare-fun m!1131025 () Bool)

(assert (=> b!1225901 m!1131025))

(declare-fun m!1131027 () Bool)

(assert (=> start!101780 m!1131027))

(declare-fun m!1131029 () Bool)

(assert (=> start!101780 m!1131029))

(declare-fun m!1131031 () Bool)

(assert (=> b!1225903 m!1131031))

(declare-fun m!1131033 () Bool)

(assert (=> b!1225903 m!1131033))

(declare-fun m!1131035 () Bool)

(assert (=> b!1225906 m!1131035))

(declare-fun m!1131037 () Bool)

(assert (=> b!1225902 m!1131037))

(declare-fun m!1131039 () Bool)

(assert (=> b!1225908 m!1131039))

(check-sat (not b!1225907) (not mapNonEmpty!48658) (not b!1225899) (not b!1225908) (not b!1225900) (not b!1225901) (not b!1225906) b_and!44201 (not b!1225903) (not b!1225897) tp_is_empty!31173 (not start!101780) (not b_lambda!22449) (not b_next!26469) (not b!1225895))
(check-sat b_and!44201 (not b_next!26469))
