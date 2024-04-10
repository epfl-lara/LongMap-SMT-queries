; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99762 () Bool)

(assert start!99762)

(declare-fun b_free!25341 () Bool)

(declare-fun b_next!25341 () Bool)

(assert (=> start!99762 (= b_free!25341 (not b_next!25341))))

(declare-fun tp!88737 () Bool)

(declare-fun b_and!41549 () Bool)

(assert (=> start!99762 (= tp!88737 b_and!41549)))

(declare-fun b!1184857 () Bool)

(declare-fun res!787579 () Bool)

(declare-fun e!673668 () Bool)

(assert (=> b!1184857 (=> (not res!787579) (not e!673668))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76541 0))(
  ( (array!76542 (arr!36920 (Array (_ BitVec 32) (_ BitVec 64))) (size!37456 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76541)

(assert (=> b!1184857 (= res!787579 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37456 _keys!1208))))))

(declare-fun res!787587 () Bool)

(assert (=> start!99762 (=> (not res!787587) (not e!673668))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99762 (= res!787587 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37456 _keys!1208))))))

(assert (=> start!99762 e!673668))

(declare-fun tp_is_empty!29871 () Bool)

(assert (=> start!99762 tp_is_empty!29871))

(declare-fun array_inv!28176 (array!76541) Bool)

(assert (=> start!99762 (array_inv!28176 _keys!1208)))

(assert (=> start!99762 true))

(assert (=> start!99762 tp!88737))

(declare-datatypes ((V!44955 0))(
  ( (V!44956 (val!14992 Int)) )
))
(declare-datatypes ((ValueCell!14226 0))(
  ( (ValueCellFull!14226 (v!17630 V!44955)) (EmptyCell!14226) )
))
(declare-datatypes ((array!76543 0))(
  ( (array!76544 (arr!36921 (Array (_ BitVec 32) ValueCell!14226)) (size!37457 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76543)

(declare-fun e!673667 () Bool)

(declare-fun array_inv!28177 (array!76543) Bool)

(assert (=> start!99762 (and (array_inv!28177 _values!996) e!673667)))

(declare-fun b!1184858 () Bool)

(declare-fun res!787581 () Bool)

(assert (=> b!1184858 (=> (not res!787581) (not e!673668))))

(declare-datatypes ((List!25966 0))(
  ( (Nil!25963) (Cons!25962 (h!27171 (_ BitVec 64)) (t!38299 List!25966)) )
))
(declare-fun arrayNoDuplicates!0 (array!76541 (_ BitVec 32) List!25966) Bool)

(assert (=> b!1184858 (= res!787581 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25963))))

(declare-fun b!1184859 () Bool)

(declare-fun e!673672 () Bool)

(assert (=> b!1184859 (= e!673672 tp_is_empty!29871)))

(declare-fun b!1184860 () Bool)

(declare-fun res!787584 () Bool)

(assert (=> b!1184860 (=> (not res!787584) (not e!673668))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184860 (= res!787584 (validMask!0 mask!1564))))

(declare-fun b!1184861 () Bool)

(declare-fun e!673674 () Bool)

(declare-fun e!673673 () Bool)

(assert (=> b!1184861 (= e!673674 e!673673)))

(declare-fun res!787575 () Bool)

(assert (=> b!1184861 (=> res!787575 e!673673)))

(assert (=> b!1184861 (= res!787575 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44955)

(declare-datatypes ((tuple2!19226 0))(
  ( (tuple2!19227 (_1!9624 (_ BitVec 64)) (_2!9624 V!44955)) )
))
(declare-datatypes ((List!25967 0))(
  ( (Nil!25964) (Cons!25963 (h!27172 tuple2!19226) (t!38300 List!25967)) )
))
(declare-datatypes ((ListLongMap!17195 0))(
  ( (ListLongMap!17196 (toList!8613 List!25967)) )
))
(declare-fun lt!537477 () ListLongMap!17195)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537489 () array!76543)

(declare-fun lt!537486 () array!76541)

(declare-fun minValue!944 () V!44955)

(declare-fun getCurrentListMapNoExtraKeys!5061 (array!76541 array!76543 (_ BitVec 32) (_ BitVec 32) V!44955 V!44955 (_ BitVec 32) Int) ListLongMap!17195)

(assert (=> b!1184861 (= lt!537477 (getCurrentListMapNoExtraKeys!5061 lt!537486 lt!537489 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!537483 () V!44955)

(assert (=> b!1184861 (= lt!537489 (array!76544 (store (arr!36921 _values!996) i!673 (ValueCellFull!14226 lt!537483)) (size!37457 _values!996)))))

(declare-fun dynLambda!3012 (Int (_ BitVec 64)) V!44955)

(assert (=> b!1184861 (= lt!537483 (dynLambda!3012 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!537478 () ListLongMap!17195)

(assert (=> b!1184861 (= lt!537478 (getCurrentListMapNoExtraKeys!5061 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184862 () Bool)

(declare-fun res!787580 () Bool)

(declare-fun e!673677 () Bool)

(assert (=> b!1184862 (=> (not res!787580) (not e!673677))))

(assert (=> b!1184862 (= res!787580 (arrayNoDuplicates!0 lt!537486 #b00000000000000000000000000000000 Nil!25963))))

(declare-fun b!1184863 () Bool)

(assert (=> b!1184863 (= e!673668 e!673677)))

(declare-fun res!787586 () Bool)

(assert (=> b!1184863 (=> (not res!787586) (not e!673677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76541 (_ BitVec 32)) Bool)

(assert (=> b!1184863 (= res!787586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537486 mask!1564))))

(assert (=> b!1184863 (= lt!537486 (array!76542 (store (arr!36920 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37456 _keys!1208)))))

(declare-fun mapIsEmpty!46634 () Bool)

(declare-fun mapRes!46634 () Bool)

(assert (=> mapIsEmpty!46634 mapRes!46634))

(declare-fun b!1184864 () Bool)

(declare-fun e!673678 () Bool)

(assert (=> b!1184864 (= e!673667 (and e!673678 mapRes!46634))))

(declare-fun condMapEmpty!46634 () Bool)

(declare-fun mapDefault!46634 () ValueCell!14226)

(assert (=> b!1184864 (= condMapEmpty!46634 (= (arr!36921 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14226)) mapDefault!46634)))))

(declare-fun b!1184865 () Bool)

(declare-fun e!673676 () Bool)

(declare-fun e!673669 () Bool)

(assert (=> b!1184865 (= e!673676 e!673669)))

(declare-fun res!787578 () Bool)

(assert (=> b!1184865 (=> res!787578 e!673669)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1184865 (= res!787578 (not (= (select (arr!36920 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184866 () Bool)

(declare-fun res!787582 () Bool)

(assert (=> b!1184866 (=> (not res!787582) (not e!673668))))

(assert (=> b!1184866 (= res!787582 (and (= (size!37457 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37456 _keys!1208) (size!37457 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184867 () Bool)

(declare-fun e!673671 () Bool)

(assert (=> b!1184867 (= e!673671 true)))

(declare-fun lt!537471 () ListLongMap!17195)

(declare-fun lt!537479 () ListLongMap!17195)

(declare-fun -!1648 (ListLongMap!17195 (_ BitVec 64)) ListLongMap!17195)

(assert (=> b!1184867 (= (-!1648 lt!537471 k0!934) lt!537479)))

(declare-fun lt!537473 () V!44955)

(declare-fun lt!537488 () ListLongMap!17195)

(declare-datatypes ((Unit!39238 0))(
  ( (Unit!39239) )
))
(declare-fun lt!537475 () Unit!39238)

(declare-fun addRemoveCommutativeForDiffKeys!173 (ListLongMap!17195 (_ BitVec 64) V!44955 (_ BitVec 64)) Unit!39238)

(assert (=> b!1184867 (= lt!537475 (addRemoveCommutativeForDiffKeys!173 lt!537488 (select (arr!36920 _keys!1208) from!1455) lt!537473 k0!934))))

(declare-fun lt!537480 () ListLongMap!17195)

(declare-fun lt!537482 () ListLongMap!17195)

(assert (=> b!1184867 (and (= lt!537478 lt!537471) (= lt!537480 lt!537482))))

(declare-fun lt!537476 () tuple2!19226)

(declare-fun +!3910 (ListLongMap!17195 tuple2!19226) ListLongMap!17195)

(assert (=> b!1184867 (= lt!537471 (+!3910 lt!537488 lt!537476))))

(assert (=> b!1184867 (not (= (select (arr!36920 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537487 () Unit!39238)

(declare-fun e!673675 () Unit!39238)

(assert (=> b!1184867 (= lt!537487 e!673675)))

(declare-fun c!117135 () Bool)

(assert (=> b!1184867 (= c!117135 (= (select (arr!36920 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184867 e!673676))

(declare-fun res!787588 () Bool)

(assert (=> b!1184867 (=> (not res!787588) (not e!673676))))

(assert (=> b!1184867 (= res!787588 (= lt!537477 lt!537479))))

(assert (=> b!1184867 (= lt!537479 (+!3910 lt!537480 lt!537476))))

(assert (=> b!1184867 (= lt!537476 (tuple2!19227 (select (arr!36920 _keys!1208) from!1455) lt!537473))))

(declare-fun get!18897 (ValueCell!14226 V!44955) V!44955)

(assert (=> b!1184867 (= lt!537473 (get!18897 (select (arr!36921 _values!996) from!1455) lt!537483))))

(declare-fun mapNonEmpty!46634 () Bool)

(declare-fun tp!88736 () Bool)

(assert (=> mapNonEmpty!46634 (= mapRes!46634 (and tp!88736 e!673672))))

(declare-fun mapRest!46634 () (Array (_ BitVec 32) ValueCell!14226))

(declare-fun mapValue!46634 () ValueCell!14226)

(declare-fun mapKey!46634 () (_ BitVec 32))

(assert (=> mapNonEmpty!46634 (= (arr!36921 _values!996) (store mapRest!46634 mapKey!46634 mapValue!46634))))

(declare-fun b!1184868 () Bool)

(assert (=> b!1184868 (= e!673678 tp_is_empty!29871)))

(declare-fun b!1184869 () Bool)

(declare-fun res!787574 () Bool)

(assert (=> b!1184869 (=> (not res!787574) (not e!673668))))

(assert (=> b!1184869 (= res!787574 (= (select (arr!36920 _keys!1208) i!673) k0!934))))

(declare-fun b!1184870 () Bool)

(declare-fun arrayContainsKey!0 (array!76541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184870 (= e!673669 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184871 () Bool)

(declare-fun Unit!39240 () Unit!39238)

(assert (=> b!1184871 (= e!673675 Unit!39240)))

(declare-fun lt!537485 () Unit!39238)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76541 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39238)

(assert (=> b!1184871 (= lt!537485 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184871 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537481 () Unit!39238)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76541 (_ BitVec 32) (_ BitVec 32)) Unit!39238)

(assert (=> b!1184871 (= lt!537481 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184871 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25963)))

(declare-fun lt!537484 () Unit!39238)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76541 (_ BitVec 64) (_ BitVec 32) List!25966) Unit!39238)

(assert (=> b!1184871 (= lt!537484 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25963))))

(assert (=> b!1184871 false))

(declare-fun b!1184872 () Bool)

(declare-fun res!787576 () Bool)

(assert (=> b!1184872 (=> (not res!787576) (not e!673668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184872 (= res!787576 (validKeyInArray!0 k0!934))))

(declare-fun b!1184873 () Bool)

(assert (=> b!1184873 (= e!673673 e!673671)))

(declare-fun res!787585 () Bool)

(assert (=> b!1184873 (=> res!787585 e!673671)))

(assert (=> b!1184873 (= res!787585 (not (validKeyInArray!0 (select (arr!36920 _keys!1208) from!1455))))))

(assert (=> b!1184873 (= lt!537482 lt!537480)))

(assert (=> b!1184873 (= lt!537480 (-!1648 lt!537488 k0!934))))

(assert (=> b!1184873 (= lt!537482 (getCurrentListMapNoExtraKeys!5061 lt!537486 lt!537489 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184873 (= lt!537488 (getCurrentListMapNoExtraKeys!5061 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537474 () Unit!39238)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!866 (array!76541 array!76543 (_ BitVec 32) (_ BitVec 32) V!44955 V!44955 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39238)

(assert (=> b!1184873 (= lt!537474 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!866 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184874 () Bool)

(assert (=> b!1184874 (= e!673677 (not e!673674))))

(declare-fun res!787577 () Bool)

(assert (=> b!1184874 (=> res!787577 e!673674)))

(assert (=> b!1184874 (= res!787577 (bvsgt from!1455 i!673))))

(assert (=> b!1184874 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537472 () Unit!39238)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76541 (_ BitVec 64) (_ BitVec 32)) Unit!39238)

(assert (=> b!1184874 (= lt!537472 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184875 () Bool)

(declare-fun Unit!39241 () Unit!39238)

(assert (=> b!1184875 (= e!673675 Unit!39241)))

(declare-fun b!1184876 () Bool)

(declare-fun res!787583 () Bool)

(assert (=> b!1184876 (=> (not res!787583) (not e!673668))))

(assert (=> b!1184876 (= res!787583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99762 res!787587) b!1184860))

(assert (= (and b!1184860 res!787584) b!1184866))

(assert (= (and b!1184866 res!787582) b!1184876))

(assert (= (and b!1184876 res!787583) b!1184858))

(assert (= (and b!1184858 res!787581) b!1184857))

(assert (= (and b!1184857 res!787579) b!1184872))

(assert (= (and b!1184872 res!787576) b!1184869))

(assert (= (and b!1184869 res!787574) b!1184863))

(assert (= (and b!1184863 res!787586) b!1184862))

(assert (= (and b!1184862 res!787580) b!1184874))

(assert (= (and b!1184874 (not res!787577)) b!1184861))

(assert (= (and b!1184861 (not res!787575)) b!1184873))

(assert (= (and b!1184873 (not res!787585)) b!1184867))

(assert (= (and b!1184867 res!787588) b!1184865))

(assert (= (and b!1184865 (not res!787578)) b!1184870))

(assert (= (and b!1184867 c!117135) b!1184871))

(assert (= (and b!1184867 (not c!117135)) b!1184875))

(assert (= (and b!1184864 condMapEmpty!46634) mapIsEmpty!46634))

(assert (= (and b!1184864 (not condMapEmpty!46634)) mapNonEmpty!46634))

(get-info :version)

(assert (= (and mapNonEmpty!46634 ((_ is ValueCellFull!14226) mapValue!46634)) b!1184859))

(assert (= (and b!1184864 ((_ is ValueCellFull!14226) mapDefault!46634)) b!1184868))

(assert (= start!99762 b!1184864))

(declare-fun b_lambda!20485 () Bool)

(assert (=> (not b_lambda!20485) (not b!1184861)))

(declare-fun t!38298 () Bool)

(declare-fun tb!10153 () Bool)

(assert (=> (and start!99762 (= defaultEntry!1004 defaultEntry!1004) t!38298) tb!10153))

(declare-fun result!20873 () Bool)

(assert (=> tb!10153 (= result!20873 tp_is_empty!29871)))

(assert (=> b!1184861 t!38298))

(declare-fun b_and!41551 () Bool)

(assert (= b_and!41549 (and (=> t!38298 result!20873) b_and!41551)))

(declare-fun m!1093195 () Bool)

(assert (=> b!1184872 m!1093195))

(declare-fun m!1093197 () Bool)

(assert (=> b!1184869 m!1093197))

(declare-fun m!1093199 () Bool)

(assert (=> b!1184874 m!1093199))

(declare-fun m!1093201 () Bool)

(assert (=> b!1184874 m!1093201))

(declare-fun m!1093203 () Bool)

(assert (=> b!1184873 m!1093203))

(declare-fun m!1093205 () Bool)

(assert (=> b!1184873 m!1093205))

(declare-fun m!1093207 () Bool)

(assert (=> b!1184873 m!1093207))

(declare-fun m!1093209 () Bool)

(assert (=> b!1184873 m!1093209))

(declare-fun m!1093211 () Bool)

(assert (=> b!1184873 m!1093211))

(declare-fun m!1093213 () Bool)

(assert (=> b!1184873 m!1093213))

(assert (=> b!1184873 m!1093211))

(declare-fun m!1093215 () Bool)

(assert (=> b!1184860 m!1093215))

(declare-fun m!1093217 () Bool)

(assert (=> b!1184867 m!1093217))

(declare-fun m!1093219 () Bool)

(assert (=> b!1184867 m!1093219))

(assert (=> b!1184867 m!1093211))

(declare-fun m!1093221 () Bool)

(assert (=> b!1184867 m!1093221))

(declare-fun m!1093223 () Bool)

(assert (=> b!1184867 m!1093223))

(assert (=> b!1184867 m!1093219))

(declare-fun m!1093225 () Bool)

(assert (=> b!1184867 m!1093225))

(declare-fun m!1093227 () Bool)

(assert (=> b!1184867 m!1093227))

(assert (=> b!1184867 m!1093211))

(declare-fun m!1093229 () Bool)

(assert (=> b!1184876 m!1093229))

(declare-fun m!1093231 () Bool)

(assert (=> b!1184861 m!1093231))

(declare-fun m!1093233 () Bool)

(assert (=> b!1184861 m!1093233))

(declare-fun m!1093235 () Bool)

(assert (=> b!1184861 m!1093235))

(declare-fun m!1093237 () Bool)

(assert (=> b!1184861 m!1093237))

(assert (=> b!1184865 m!1093211))

(declare-fun m!1093239 () Bool)

(assert (=> mapNonEmpty!46634 m!1093239))

(declare-fun m!1093241 () Bool)

(assert (=> b!1184862 m!1093241))

(declare-fun m!1093243 () Bool)

(assert (=> b!1184870 m!1093243))

(declare-fun m!1093245 () Bool)

(assert (=> b!1184871 m!1093245))

(declare-fun m!1093247 () Bool)

(assert (=> b!1184871 m!1093247))

(declare-fun m!1093249 () Bool)

(assert (=> b!1184871 m!1093249))

(declare-fun m!1093251 () Bool)

(assert (=> b!1184871 m!1093251))

(declare-fun m!1093253 () Bool)

(assert (=> b!1184871 m!1093253))

(declare-fun m!1093255 () Bool)

(assert (=> start!99762 m!1093255))

(declare-fun m!1093257 () Bool)

(assert (=> start!99762 m!1093257))

(declare-fun m!1093259 () Bool)

(assert (=> b!1184858 m!1093259))

(declare-fun m!1093261 () Bool)

(assert (=> b!1184863 m!1093261))

(declare-fun m!1093263 () Bool)

(assert (=> b!1184863 m!1093263))

(check-sat (not b!1184858) (not start!99762) (not b_next!25341) b_and!41551 (not b!1184860) (not b!1184874) (not b!1184873) (not b!1184876) (not b!1184863) (not b!1184861) (not mapNonEmpty!46634) (not b!1184872) (not b!1184871) tp_is_empty!29871 (not b!1184862) (not b_lambda!20485) (not b!1184867) (not b!1184870))
(check-sat b_and!41551 (not b_next!25341))
