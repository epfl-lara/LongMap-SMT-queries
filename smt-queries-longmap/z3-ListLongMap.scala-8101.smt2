; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99708 () Bool)

(assert start!99708)

(declare-fun b_free!25051 () Bool)

(declare-fun b_next!25051 () Bool)

(assert (=> start!99708 (= b_free!25051 (not b_next!25051))))

(declare-fun tp!87866 () Bool)

(declare-fun b_and!40971 () Bool)

(assert (=> start!99708 (= tp!87866 b_and!40971)))

(declare-datatypes ((array!76023 0))(
  ( (array!76024 (arr!36655 (Array (_ BitVec 32) (_ BitVec 64))) (size!37192 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76023)

(declare-fun e!669031 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1176814 () Bool)

(declare-fun arrayContainsKey!0 (array!76023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176814 (= e!669031 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176815 () Bool)

(declare-fun res!781218 () Bool)

(declare-fun e!669028 () Bool)

(assert (=> b!1176815 (=> (not res!781218) (not e!669028))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176815 (= res!781218 (validMask!0 mask!1564))))

(declare-fun b!1176816 () Bool)

(declare-fun e!669027 () Bool)

(assert (=> b!1176816 (= e!669028 e!669027)))

(declare-fun res!781221 () Bool)

(assert (=> b!1176816 (=> (not res!781221) (not e!669027))))

(declare-fun lt!530829 () array!76023)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76023 (_ BitVec 32)) Bool)

(assert (=> b!1176816 (= res!781221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530829 mask!1564))))

(assert (=> b!1176816 (= lt!530829 (array!76024 (store (arr!36655 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37192 _keys!1208)))))

(declare-fun b!1176817 () Bool)

(declare-fun res!781220 () Bool)

(assert (=> b!1176817 (=> (not res!781220) (not e!669028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176817 (= res!781220 (validKeyInArray!0 k0!934))))

(declare-fun res!781224 () Bool)

(assert (=> start!99708 (=> (not res!781224) (not e!669028))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99708 (= res!781224 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37192 _keys!1208))))))

(assert (=> start!99708 e!669028))

(declare-fun tp_is_empty!29581 () Bool)

(assert (=> start!99708 tp_is_empty!29581))

(declare-fun array_inv!28078 (array!76023) Bool)

(assert (=> start!99708 (array_inv!28078 _keys!1208)))

(assert (=> start!99708 true))

(assert (=> start!99708 tp!87866))

(declare-datatypes ((V!44569 0))(
  ( (V!44570 (val!14847 Int)) )
))
(declare-datatypes ((ValueCell!14081 0))(
  ( (ValueCellFull!14081 (v!17481 V!44569)) (EmptyCell!14081) )
))
(declare-datatypes ((array!76025 0))(
  ( (array!76026 (arr!36656 (Array (_ BitVec 32) ValueCell!14081)) (size!37193 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76025)

(declare-fun e!669030 () Bool)

(declare-fun array_inv!28079 (array!76025) Bool)

(assert (=> start!99708 (and (array_inv!28079 _values!996) e!669030)))

(declare-fun b!1176818 () Bool)

(declare-fun res!781229 () Bool)

(assert (=> b!1176818 (=> (not res!781229) (not e!669027))))

(declare-datatypes ((List!25761 0))(
  ( (Nil!25758) (Cons!25757 (h!26975 (_ BitVec 64)) (t!37796 List!25761)) )
))
(declare-fun arrayNoDuplicates!0 (array!76023 (_ BitVec 32) List!25761) Bool)

(assert (=> b!1176818 (= res!781229 (arrayNoDuplicates!0 lt!530829 #b00000000000000000000000000000000 Nil!25758))))

(declare-fun b!1176819 () Bool)

(declare-fun e!669037 () Bool)

(declare-fun e!669032 () Bool)

(assert (=> b!1176819 (= e!669037 e!669032)))

(declare-fun res!781227 () Bool)

(assert (=> b!1176819 (=> res!781227 e!669032)))

(assert (=> b!1176819 (= res!781227 (not (validKeyInArray!0 (select (arr!36655 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19028 0))(
  ( (tuple2!19029 (_1!9525 (_ BitVec 64)) (_2!9525 V!44569)) )
))
(declare-datatypes ((List!25762 0))(
  ( (Nil!25759) (Cons!25758 (h!26976 tuple2!19028) (t!37797 List!25762)) )
))
(declare-datatypes ((ListLongMap!17005 0))(
  ( (ListLongMap!17006 (toList!8518 List!25762)) )
))
(declare-fun lt!530835 () ListLongMap!17005)

(declare-fun lt!530826 () ListLongMap!17005)

(assert (=> b!1176819 (= lt!530835 lt!530826)))

(declare-fun lt!530836 () ListLongMap!17005)

(declare-fun -!1559 (ListLongMap!17005 (_ BitVec 64)) ListLongMap!17005)

(assert (=> b!1176819 (= lt!530826 (-!1559 lt!530836 k0!934))))

(declare-fun zeroValue!944 () V!44569)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530828 () array!76025)

(declare-fun minValue!944 () V!44569)

(declare-fun getCurrentListMapNoExtraKeys!5000 (array!76023 array!76025 (_ BitVec 32) (_ BitVec 32) V!44569 V!44569 (_ BitVec 32) Int) ListLongMap!17005)

(assert (=> b!1176819 (= lt!530835 (getCurrentListMapNoExtraKeys!5000 lt!530829 lt!530828 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176819 (= lt!530836 (getCurrentListMapNoExtraKeys!5000 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38791 0))(
  ( (Unit!38792) )
))
(declare-fun lt!530832 () Unit!38791)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!784 (array!76023 array!76025 (_ BitVec 32) (_ BitVec 32) V!44569 V!44569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38791)

(assert (=> b!1176819 (= lt!530832 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176820 () Bool)

(declare-fun e!669035 () Unit!38791)

(declare-fun Unit!38793 () Unit!38791)

(assert (=> b!1176820 (= e!669035 Unit!38793)))

(declare-fun lt!530831 () Unit!38791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76023 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38791)

(assert (=> b!1176820 (= lt!530831 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176820 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530825 () Unit!38791)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76023 (_ BitVec 32) (_ BitVec 32)) Unit!38791)

(assert (=> b!1176820 (= lt!530825 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1176820 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25758)))

(declare-fun lt!530834 () Unit!38791)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76023 (_ BitVec 64) (_ BitVec 32) List!25761) Unit!38791)

(assert (=> b!1176820 (= lt!530834 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25758))))

(assert (=> b!1176820 false))

(declare-fun b!1176821 () Bool)

(assert (=> b!1176821 (= e!669032 true)))

(assert (=> b!1176821 (not (= (select (arr!36655 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530833 () Unit!38791)

(assert (=> b!1176821 (= lt!530833 e!669035)))

(declare-fun c!117098 () Bool)

(assert (=> b!1176821 (= c!117098 (= (select (arr!36655 _keys!1208) from!1455) k0!934))))

(declare-fun e!669038 () Bool)

(assert (=> b!1176821 e!669038))

(declare-fun res!781215 () Bool)

(assert (=> b!1176821 (=> (not res!781215) (not e!669038))))

(declare-fun lt!530827 () ListLongMap!17005)

(declare-fun lt!530823 () V!44569)

(declare-fun +!3850 (ListLongMap!17005 tuple2!19028) ListLongMap!17005)

(declare-fun get!18752 (ValueCell!14081 V!44569) V!44569)

(assert (=> b!1176821 (= res!781215 (= lt!530827 (+!3850 lt!530826 (tuple2!19029 (select (arr!36655 _keys!1208) from!1455) (get!18752 (select (arr!36656 _values!996) from!1455) lt!530823)))))))

(declare-fun b!1176822 () Bool)

(declare-fun res!781219 () Bool)

(assert (=> b!1176822 (=> (not res!781219) (not e!669028))))

(assert (=> b!1176822 (= res!781219 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25758))))

(declare-fun b!1176823 () Bool)

(declare-fun Unit!38794 () Unit!38791)

(assert (=> b!1176823 (= e!669035 Unit!38794)))

(declare-fun b!1176824 () Bool)

(declare-fun e!669036 () Bool)

(assert (=> b!1176824 (= e!669027 (not e!669036))))

(declare-fun res!781217 () Bool)

(assert (=> b!1176824 (=> res!781217 e!669036)))

(assert (=> b!1176824 (= res!781217 (bvsgt from!1455 i!673))))

(assert (=> b!1176824 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530824 () Unit!38791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76023 (_ BitVec 64) (_ BitVec 32)) Unit!38791)

(assert (=> b!1176824 (= lt!530824 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46199 () Bool)

(declare-fun mapRes!46199 () Bool)

(declare-fun tp!87867 () Bool)

(declare-fun e!669033 () Bool)

(assert (=> mapNonEmpty!46199 (= mapRes!46199 (and tp!87867 e!669033))))

(declare-fun mapKey!46199 () (_ BitVec 32))

(declare-fun mapValue!46199 () ValueCell!14081)

(declare-fun mapRest!46199 () (Array (_ BitVec 32) ValueCell!14081))

(assert (=> mapNonEmpty!46199 (= (arr!36656 _values!996) (store mapRest!46199 mapKey!46199 mapValue!46199))))

(declare-fun b!1176825 () Bool)

(assert (=> b!1176825 (= e!669038 e!669031)))

(declare-fun res!781216 () Bool)

(assert (=> b!1176825 (=> res!781216 e!669031)))

(assert (=> b!1176825 (= res!781216 (not (= (select (arr!36655 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176826 () Bool)

(declare-fun res!781228 () Bool)

(assert (=> b!1176826 (=> (not res!781228) (not e!669028))))

(assert (=> b!1176826 (= res!781228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176827 () Bool)

(declare-fun e!669029 () Bool)

(assert (=> b!1176827 (= e!669030 (and e!669029 mapRes!46199))))

(declare-fun condMapEmpty!46199 () Bool)

(declare-fun mapDefault!46199 () ValueCell!14081)

(assert (=> b!1176827 (= condMapEmpty!46199 (= (arr!36656 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14081)) mapDefault!46199)))))

(declare-fun b!1176828 () Bool)

(assert (=> b!1176828 (= e!669036 e!669037)))

(declare-fun res!781225 () Bool)

(assert (=> b!1176828 (=> res!781225 e!669037)))

(assert (=> b!1176828 (= res!781225 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1176828 (= lt!530827 (getCurrentListMapNoExtraKeys!5000 lt!530829 lt!530828 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1176828 (= lt!530828 (array!76026 (store (arr!36656 _values!996) i!673 (ValueCellFull!14081 lt!530823)) (size!37193 _values!996)))))

(declare-fun dynLambda!2977 (Int (_ BitVec 64)) V!44569)

(assert (=> b!1176828 (= lt!530823 (dynLambda!2977 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530830 () ListLongMap!17005)

(assert (=> b!1176828 (= lt!530830 (getCurrentListMapNoExtraKeys!5000 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46199 () Bool)

(assert (=> mapIsEmpty!46199 mapRes!46199))

(declare-fun b!1176829 () Bool)

(declare-fun res!781226 () Bool)

(assert (=> b!1176829 (=> (not res!781226) (not e!669028))))

(assert (=> b!1176829 (= res!781226 (= (select (arr!36655 _keys!1208) i!673) k0!934))))

(declare-fun b!1176830 () Bool)

(declare-fun res!781222 () Bool)

(assert (=> b!1176830 (=> (not res!781222) (not e!669028))))

(assert (=> b!1176830 (= res!781222 (and (= (size!37193 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37192 _keys!1208) (size!37193 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176831 () Bool)

(assert (=> b!1176831 (= e!669029 tp_is_empty!29581)))

(declare-fun b!1176832 () Bool)

(assert (=> b!1176832 (= e!669033 tp_is_empty!29581)))

(declare-fun b!1176833 () Bool)

(declare-fun res!781223 () Bool)

(assert (=> b!1176833 (=> (not res!781223) (not e!669028))))

(assert (=> b!1176833 (= res!781223 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37192 _keys!1208))))))

(assert (= (and start!99708 res!781224) b!1176815))

(assert (= (and b!1176815 res!781218) b!1176830))

(assert (= (and b!1176830 res!781222) b!1176826))

(assert (= (and b!1176826 res!781228) b!1176822))

(assert (= (and b!1176822 res!781219) b!1176833))

(assert (= (and b!1176833 res!781223) b!1176817))

(assert (= (and b!1176817 res!781220) b!1176829))

(assert (= (and b!1176829 res!781226) b!1176816))

(assert (= (and b!1176816 res!781221) b!1176818))

(assert (= (and b!1176818 res!781229) b!1176824))

(assert (= (and b!1176824 (not res!781217)) b!1176828))

(assert (= (and b!1176828 (not res!781225)) b!1176819))

(assert (= (and b!1176819 (not res!781227)) b!1176821))

(assert (= (and b!1176821 res!781215) b!1176825))

(assert (= (and b!1176825 (not res!781216)) b!1176814))

(assert (= (and b!1176821 c!117098) b!1176820))

(assert (= (and b!1176821 (not c!117098)) b!1176823))

(assert (= (and b!1176827 condMapEmpty!46199) mapIsEmpty!46199))

(assert (= (and b!1176827 (not condMapEmpty!46199)) mapNonEmpty!46199))

(get-info :version)

(assert (= (and mapNonEmpty!46199 ((_ is ValueCellFull!14081) mapValue!46199)) b!1176832))

(assert (= (and b!1176827 ((_ is ValueCellFull!14081) mapDefault!46199)) b!1176831))

(assert (= start!99708 b!1176827))

(declare-fun b_lambda!20189 () Bool)

(assert (=> (not b_lambda!20189) (not b!1176828)))

(declare-fun t!37795 () Bool)

(declare-fun tb!9855 () Bool)

(assert (=> (and start!99708 (= defaultEntry!1004 defaultEntry!1004) t!37795) tb!9855))

(declare-fun result!20285 () Bool)

(assert (=> tb!9855 (= result!20285 tp_is_empty!29581)))

(assert (=> b!1176828 t!37795))

(declare-fun b_and!40973 () Bool)

(assert (= b_and!40971 (and (=> t!37795 result!20285) b_and!40973)))

(declare-fun m!1085007 () Bool)

(assert (=> b!1176816 m!1085007))

(declare-fun m!1085009 () Bool)

(assert (=> b!1176816 m!1085009))

(declare-fun m!1085011 () Bool)

(assert (=> mapNonEmpty!46199 m!1085011))

(declare-fun m!1085013 () Bool)

(assert (=> b!1176822 m!1085013))

(declare-fun m!1085015 () Bool)

(assert (=> b!1176824 m!1085015))

(declare-fun m!1085017 () Bool)

(assert (=> b!1176824 m!1085017))

(declare-fun m!1085019 () Bool)

(assert (=> b!1176820 m!1085019))

(declare-fun m!1085021 () Bool)

(assert (=> b!1176820 m!1085021))

(declare-fun m!1085023 () Bool)

(assert (=> b!1176820 m!1085023))

(declare-fun m!1085025 () Bool)

(assert (=> b!1176820 m!1085025))

(declare-fun m!1085027 () Bool)

(assert (=> b!1176820 m!1085027))

(declare-fun m!1085029 () Bool)

(assert (=> start!99708 m!1085029))

(declare-fun m!1085031 () Bool)

(assert (=> start!99708 m!1085031))

(declare-fun m!1085033 () Bool)

(assert (=> b!1176818 m!1085033))

(declare-fun m!1085035 () Bool)

(assert (=> b!1176826 m!1085035))

(declare-fun m!1085037 () Bool)

(assert (=> b!1176821 m!1085037))

(declare-fun m!1085039 () Bool)

(assert (=> b!1176821 m!1085039))

(assert (=> b!1176821 m!1085039))

(declare-fun m!1085041 () Bool)

(assert (=> b!1176821 m!1085041))

(declare-fun m!1085043 () Bool)

(assert (=> b!1176821 m!1085043))

(declare-fun m!1085045 () Bool)

(assert (=> b!1176814 m!1085045))

(declare-fun m!1085047 () Bool)

(assert (=> b!1176815 m!1085047))

(declare-fun m!1085049 () Bool)

(assert (=> b!1176817 m!1085049))

(assert (=> b!1176825 m!1085037))

(declare-fun m!1085051 () Bool)

(assert (=> b!1176829 m!1085051))

(declare-fun m!1085053 () Bool)

(assert (=> b!1176819 m!1085053))

(declare-fun m!1085055 () Bool)

(assert (=> b!1176819 m!1085055))

(declare-fun m!1085057 () Bool)

(assert (=> b!1176819 m!1085057))

(declare-fun m!1085059 () Bool)

(assert (=> b!1176819 m!1085059))

(assert (=> b!1176819 m!1085037))

(declare-fun m!1085061 () Bool)

(assert (=> b!1176819 m!1085061))

(assert (=> b!1176819 m!1085037))

(declare-fun m!1085063 () Bool)

(assert (=> b!1176828 m!1085063))

(declare-fun m!1085065 () Bool)

(assert (=> b!1176828 m!1085065))

(declare-fun m!1085067 () Bool)

(assert (=> b!1176828 m!1085067))

(declare-fun m!1085069 () Bool)

(assert (=> b!1176828 m!1085069))

(check-sat (not b!1176820) (not b!1176816) (not b!1176822) (not b!1176819) (not b_lambda!20189) (not b!1176817) tp_is_empty!29581 (not b!1176826) (not mapNonEmpty!46199) (not b!1176818) (not b!1176828) (not start!99708) (not b!1176821) (not b!1176824) (not b!1176814) (not b!1176815) (not b_next!25051) b_and!40973)
(check-sat b_and!40973 (not b_next!25051))
