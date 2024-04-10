; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101774 () Bool)

(assert start!101774)

(declare-fun b_free!26463 () Bool)

(declare-fun b_next!26463 () Bool)

(assert (=> start!101774 (= b_free!26463 (not b_next!26463))))

(declare-fun tp!92435 () Bool)

(declare-fun b_and!44187 () Bool)

(assert (=> start!101774 (= tp!92435 b_and!44187)))

(declare-fun b!1225750 () Bool)

(declare-fun res!814603 () Bool)

(declare-fun e!696174 () Bool)

(assert (=> b!1225750 (=> (not res!814603) (not e!696174))))

(declare-datatypes ((array!79113 0))(
  ( (array!79114 (arr!38183 (Array (_ BitVec 32) (_ BitVec 64))) (size!38719 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79113)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46683 0))(
  ( (V!46684 (val!15640 Int)) )
))
(declare-datatypes ((ValueCell!14874 0))(
  ( (ValueCellFull!14874 (v!18302 V!46683)) (EmptyCell!14874) )
))
(declare-datatypes ((array!79115 0))(
  ( (array!79116 (arr!38184 (Array (_ BitVec 32) ValueCell!14874)) (size!38720 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79115)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1225750 (= res!814603 (and (= (size!38720 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38719 _keys!1208) (size!38720 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48649 () Bool)

(declare-fun mapRes!48649 () Bool)

(assert (=> mapIsEmpty!48649 mapRes!48649))

(declare-fun b!1225751 () Bool)

(declare-fun res!814597 () Bool)

(assert (=> b!1225751 (=> (not res!814597) (not e!696174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79113 (_ BitVec 32)) Bool)

(assert (=> b!1225751 (= res!814597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225752 () Bool)

(declare-fun e!696176 () Bool)

(assert (=> b!1225752 (= e!696174 e!696176)))

(declare-fun res!814600 () Bool)

(assert (=> b!1225752 (=> (not res!814600) (not e!696176))))

(declare-fun lt!558566 () array!79113)

(assert (=> b!1225752 (= res!814600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558566 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225752 (= lt!558566 (array!79114 (store (arr!38183 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38719 _keys!1208)))))

(declare-fun b!1225753 () Bool)

(declare-fun res!814592 () Bool)

(assert (=> b!1225753 (=> (not res!814592) (not e!696174))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1225753 (= res!814592 (= (select (arr!38183 _keys!1208) i!673) k0!934))))

(declare-fun b!1225754 () Bool)

(declare-fun res!814602 () Bool)

(assert (=> b!1225754 (=> (not res!814602) (not e!696174))))

(assert (=> b!1225754 (= res!814602 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38719 _keys!1208))))))

(declare-fun b!1225755 () Bool)

(declare-fun e!696173 () Bool)

(declare-fun tp_is_empty!31167 () Bool)

(assert (=> b!1225755 (= e!696173 tp_is_empty!31167)))

(declare-fun b!1225756 () Bool)

(declare-fun res!814596 () Bool)

(assert (=> b!1225756 (=> (not res!814596) (not e!696176))))

(declare-datatypes ((List!26961 0))(
  ( (Nil!26958) (Cons!26957 (h!28166 (_ BitVec 64)) (t!40404 List!26961)) )
))
(declare-fun arrayNoDuplicates!0 (array!79113 (_ BitVec 32) List!26961) Bool)

(assert (=> b!1225756 (= res!814596 (arrayNoDuplicates!0 lt!558566 #b00000000000000000000000000000000 Nil!26958))))

(declare-fun res!814595 () Bool)

(assert (=> start!101774 (=> (not res!814595) (not e!696174))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101774 (= res!814595 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38719 _keys!1208))))))

(assert (=> start!101774 e!696174))

(assert (=> start!101774 tp_is_empty!31167))

(declare-fun array_inv!29036 (array!79113) Bool)

(assert (=> start!101774 (array_inv!29036 _keys!1208)))

(assert (=> start!101774 true))

(assert (=> start!101774 tp!92435))

(declare-fun e!696178 () Bool)

(declare-fun array_inv!29037 (array!79115) Bool)

(assert (=> start!101774 (and (array_inv!29037 _values!996) e!696178)))

(declare-fun b!1225757 () Bool)

(declare-fun e!696177 () Bool)

(assert (=> b!1225757 (= e!696177 (bvslt i!673 (size!38720 _values!996)))))

(declare-fun b!1225758 () Bool)

(declare-fun e!696171 () Bool)

(assert (=> b!1225758 (= e!696171 tp_is_empty!31167)))

(declare-fun b!1225759 () Bool)

(declare-fun res!814598 () Bool)

(assert (=> b!1225759 (=> (not res!814598) (not e!696174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225759 (= res!814598 (validKeyInArray!0 k0!934))))

(declare-fun b!1225760 () Bool)

(declare-fun e!696175 () Bool)

(declare-fun e!696172 () Bool)

(assert (=> b!1225760 (= e!696175 e!696172)))

(declare-fun res!814599 () Bool)

(assert (=> b!1225760 (=> res!814599 e!696172)))

(assert (=> b!1225760 (= res!814599 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46683)

(declare-datatypes ((tuple2!20160 0))(
  ( (tuple2!20161 (_1!10091 (_ BitVec 64)) (_2!10091 V!46683)) )
))
(declare-datatypes ((List!26962 0))(
  ( (Nil!26959) (Cons!26958 (h!28167 tuple2!20160) (t!40405 List!26962)) )
))
(declare-datatypes ((ListLongMap!18129 0))(
  ( (ListLongMap!18130 (toList!9080 List!26962)) )
))
(declare-fun lt!558563 () ListLongMap!18129)

(declare-fun minValue!944 () V!46683)

(declare-fun lt!558565 () array!79115)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5499 (array!79113 array!79115 (_ BitVec 32) (_ BitVec 32) V!46683 V!46683 (_ BitVec 32) Int) ListLongMap!18129)

(assert (=> b!1225760 (= lt!558563 (getCurrentListMapNoExtraKeys!5499 lt!558566 lt!558565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3370 (Int (_ BitVec 64)) V!46683)

(assert (=> b!1225760 (= lt!558565 (array!79116 (store (arr!38184 _values!996) i!673 (ValueCellFull!14874 (dynLambda!3370 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38720 _values!996)))))

(declare-fun lt!558562 () ListLongMap!18129)

(assert (=> b!1225760 (= lt!558562 (getCurrentListMapNoExtraKeys!5499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225761 () Bool)

(declare-fun res!814593 () Bool)

(assert (=> b!1225761 (=> (not res!814593) (not e!696174))))

(assert (=> b!1225761 (= res!814593 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26958))))

(declare-fun mapNonEmpty!48649 () Bool)

(declare-fun tp!92434 () Bool)

(assert (=> mapNonEmpty!48649 (= mapRes!48649 (and tp!92434 e!696171))))

(declare-fun mapValue!48649 () ValueCell!14874)

(declare-fun mapRest!48649 () (Array (_ BitVec 32) ValueCell!14874))

(declare-fun mapKey!48649 () (_ BitVec 32))

(assert (=> mapNonEmpty!48649 (= (arr!38184 _values!996) (store mapRest!48649 mapKey!48649 mapValue!48649))))

(declare-fun b!1225762 () Bool)

(assert (=> b!1225762 (= e!696176 (not e!696175))))

(declare-fun res!814601 () Bool)

(assert (=> b!1225762 (=> res!814601 e!696175)))

(assert (=> b!1225762 (= res!814601 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225762 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40626 0))(
  ( (Unit!40627) )
))
(declare-fun lt!558561 () Unit!40626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79113 (_ BitVec 64) (_ BitVec 32)) Unit!40626)

(assert (=> b!1225762 (= lt!558561 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225763 () Bool)

(declare-fun res!814594 () Bool)

(assert (=> b!1225763 (=> (not res!814594) (not e!696174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225763 (= res!814594 (validMask!0 mask!1564))))

(declare-fun b!1225764 () Bool)

(assert (=> b!1225764 (= e!696172 e!696177)))

(declare-fun res!814591 () Bool)

(assert (=> b!1225764 (=> res!814591 e!696177)))

(assert (=> b!1225764 (= res!814591 (validKeyInArray!0 (select (arr!38183 _keys!1208) from!1455)))))

(declare-fun -!1979 (ListLongMap!18129 (_ BitVec 64)) ListLongMap!18129)

(assert (=> b!1225764 (= (getCurrentListMapNoExtraKeys!5499 lt!558566 lt!558565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1979 (getCurrentListMapNoExtraKeys!5499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!558564 () Unit!40626)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1185 (array!79113 array!79115 (_ BitVec 32) (_ BitVec 32) V!46683 V!46683 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40626)

(assert (=> b!1225764 (= lt!558564 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1185 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225765 () Bool)

(assert (=> b!1225765 (= e!696178 (and e!696173 mapRes!48649))))

(declare-fun condMapEmpty!48649 () Bool)

(declare-fun mapDefault!48649 () ValueCell!14874)

(assert (=> b!1225765 (= condMapEmpty!48649 (= (arr!38184 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14874)) mapDefault!48649)))))

(assert (= (and start!101774 res!814595) b!1225763))

(assert (= (and b!1225763 res!814594) b!1225750))

(assert (= (and b!1225750 res!814603) b!1225751))

(assert (= (and b!1225751 res!814597) b!1225761))

(assert (= (and b!1225761 res!814593) b!1225754))

(assert (= (and b!1225754 res!814602) b!1225759))

(assert (= (and b!1225759 res!814598) b!1225753))

(assert (= (and b!1225753 res!814592) b!1225752))

(assert (= (and b!1225752 res!814600) b!1225756))

(assert (= (and b!1225756 res!814596) b!1225762))

(assert (= (and b!1225762 (not res!814601)) b!1225760))

(assert (= (and b!1225760 (not res!814599)) b!1225764))

(assert (= (and b!1225764 (not res!814591)) b!1225757))

(assert (= (and b!1225765 condMapEmpty!48649) mapIsEmpty!48649))

(assert (= (and b!1225765 (not condMapEmpty!48649)) mapNonEmpty!48649))

(get-info :version)

(assert (= (and mapNonEmpty!48649 ((_ is ValueCellFull!14874) mapValue!48649)) b!1225758))

(assert (= (and b!1225765 ((_ is ValueCellFull!14874) mapDefault!48649)) b!1225755))

(assert (= start!101774 b!1225765))

(declare-fun b_lambda!22443 () Bool)

(assert (=> (not b_lambda!22443) (not b!1225760)))

(declare-fun t!40403 () Bool)

(declare-fun tb!11263 () Bool)

(assert (=> (and start!101774 (= defaultEntry!1004 defaultEntry!1004) t!40403) tb!11263))

(declare-fun result!23139 () Bool)

(assert (=> tb!11263 (= result!23139 tp_is_empty!31167)))

(assert (=> b!1225760 t!40403))

(declare-fun b_and!44189 () Bool)

(assert (= b_and!44187 (and (=> t!40403 result!23139) b_and!44189)))

(declare-fun m!1130865 () Bool)

(assert (=> mapNonEmpty!48649 m!1130865))

(declare-fun m!1130867 () Bool)

(assert (=> b!1225764 m!1130867))

(declare-fun m!1130869 () Bool)

(assert (=> b!1225764 m!1130869))

(declare-fun m!1130871 () Bool)

(assert (=> b!1225764 m!1130871))

(assert (=> b!1225764 m!1130867))

(declare-fun m!1130873 () Bool)

(assert (=> b!1225764 m!1130873))

(declare-fun m!1130875 () Bool)

(assert (=> b!1225764 m!1130875))

(declare-fun m!1130877 () Bool)

(assert (=> b!1225764 m!1130877))

(assert (=> b!1225764 m!1130875))

(declare-fun m!1130879 () Bool)

(assert (=> b!1225763 m!1130879))

(declare-fun m!1130881 () Bool)

(assert (=> b!1225759 m!1130881))

(declare-fun m!1130883 () Bool)

(assert (=> b!1225761 m!1130883))

(declare-fun m!1130885 () Bool)

(assert (=> b!1225753 m!1130885))

(declare-fun m!1130887 () Bool)

(assert (=> b!1225762 m!1130887))

(declare-fun m!1130889 () Bool)

(assert (=> b!1225762 m!1130889))

(declare-fun m!1130891 () Bool)

(assert (=> b!1225756 m!1130891))

(declare-fun m!1130893 () Bool)

(assert (=> b!1225751 m!1130893))

(declare-fun m!1130895 () Bool)

(assert (=> b!1225760 m!1130895))

(declare-fun m!1130897 () Bool)

(assert (=> b!1225760 m!1130897))

(declare-fun m!1130899 () Bool)

(assert (=> b!1225760 m!1130899))

(declare-fun m!1130901 () Bool)

(assert (=> b!1225760 m!1130901))

(declare-fun m!1130903 () Bool)

(assert (=> start!101774 m!1130903))

(declare-fun m!1130905 () Bool)

(assert (=> start!101774 m!1130905))

(declare-fun m!1130907 () Bool)

(assert (=> b!1225752 m!1130907))

(declare-fun m!1130909 () Bool)

(assert (=> b!1225752 m!1130909))

(check-sat (not b!1225751) (not b!1225761) (not start!101774) (not mapNonEmpty!48649) (not b!1225752) (not b!1225762) (not b!1225764) (not b!1225760) (not b_next!26463) (not b!1225759) (not b!1225756) (not b!1225763) (not b_lambda!22443) b_and!44189 tp_is_empty!31167)
(check-sat b_and!44189 (not b_next!26463))
