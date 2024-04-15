; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99508 () Bool)

(assert start!99508)

(declare-fun b_free!25093 () Bool)

(declare-fun b_next!25093 () Bool)

(assert (=> start!99508 (= b_free!25093 (not b_next!25093))))

(declare-fun tp!87993 () Bool)

(declare-fun b_and!41031 () Bool)

(assert (=> start!99508 (= tp!87993 b_and!41031)))

(declare-fun b!1176741 () Bool)

(declare-fun res!781637 () Bool)

(declare-fun e!668913 () Bool)

(assert (=> b!1176741 (=> (not res!781637) (not e!668913))))

(declare-datatypes ((array!75984 0))(
  ( (array!75985 (arr!36642 (Array (_ BitVec 32) (_ BitVec 64))) (size!37180 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75984)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75984 (_ BitVec 32)) Bool)

(assert (=> b!1176741 (= res!781637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176742 () Bool)

(declare-fun e!668918 () Bool)

(declare-fun tp_is_empty!29623 () Bool)

(assert (=> b!1176742 (= e!668918 tp_is_empty!29623)))

(declare-fun b!1176743 () Bool)

(declare-fun res!781631 () Bool)

(assert (=> b!1176743 (=> (not res!781631) (not e!668913))))

(declare-datatypes ((List!25831 0))(
  ( (Nil!25828) (Cons!25827 (h!27036 (_ BitVec 64)) (t!37907 List!25831)) )
))
(declare-fun arrayNoDuplicates!0 (array!75984 (_ BitVec 32) List!25831) Bool)

(assert (=> b!1176743 (= res!781631 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25828))))

(declare-fun b!1176744 () Bool)

(declare-fun e!668922 () Bool)

(declare-fun e!668915 () Bool)

(assert (=> b!1176744 (= e!668922 e!668915)))

(declare-fun res!781628 () Bool)

(assert (=> b!1176744 (=> res!781628 e!668915)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1176744 (= res!781628 (not (= (select (arr!36642 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176745 () Bool)

(declare-fun e!668921 () Bool)

(assert (=> b!1176745 (= e!668921 tp_is_empty!29623)))

(declare-fun b!1176746 () Bool)

(declare-fun e!668923 () Bool)

(assert (=> b!1176746 (= e!668913 e!668923)))

(declare-fun res!781636 () Bool)

(assert (=> b!1176746 (=> (not res!781636) (not e!668923))))

(declare-fun lt!531078 () array!75984)

(assert (=> b!1176746 (= res!781636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531078 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1176746 (= lt!531078 (array!75985 (store (arr!36642 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37180 _keys!1208)))))

(declare-fun b!1176747 () Bool)

(declare-fun res!781632 () Bool)

(assert (=> b!1176747 (=> (not res!781632) (not e!668913))))

(assert (=> b!1176747 (= res!781632 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37180 _keys!1208))))))

(declare-fun mapNonEmpty!46262 () Bool)

(declare-fun mapRes!46262 () Bool)

(declare-fun tp!87992 () Bool)

(assert (=> mapNonEmpty!46262 (= mapRes!46262 (and tp!87992 e!668921))))

(declare-datatypes ((V!44625 0))(
  ( (V!44626 (val!14868 Int)) )
))
(declare-datatypes ((ValueCell!14102 0))(
  ( (ValueCellFull!14102 (v!17505 V!44625)) (EmptyCell!14102) )
))
(declare-fun mapValue!46262 () ValueCell!14102)

(declare-fun mapKey!46262 () (_ BitVec 32))

(declare-fun mapRest!46262 () (Array (_ BitVec 32) ValueCell!14102))

(declare-datatypes ((array!75986 0))(
  ( (array!75987 (arr!36643 (Array (_ BitVec 32) ValueCell!14102)) (size!37181 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75986)

(assert (=> mapNonEmpty!46262 (= (arr!36643 _values!996) (store mapRest!46262 mapKey!46262 mapValue!46262))))

(declare-fun b!1176748 () Bool)

(declare-fun e!668917 () Bool)

(declare-fun e!668919 () Bool)

(assert (=> b!1176748 (= e!668917 e!668919)))

(declare-fun res!781627 () Bool)

(assert (=> b!1176748 (=> res!781627 e!668919)))

(assert (=> b!1176748 (= res!781627 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44625)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19122 0))(
  ( (tuple2!19123 (_1!9572 (_ BitVec 64)) (_2!9572 V!44625)) )
))
(declare-datatypes ((List!25832 0))(
  ( (Nil!25829) (Cons!25828 (h!27037 tuple2!19122) (t!37908 List!25832)) )
))
(declare-datatypes ((ListLongMap!17091 0))(
  ( (ListLongMap!17092 (toList!8561 List!25832)) )
))
(declare-fun lt!531072 () ListLongMap!17091)

(declare-fun minValue!944 () V!44625)

(declare-fun lt!531074 () array!75986)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5028 (array!75984 array!75986 (_ BitVec 32) (_ BitVec 32) V!44625 V!44625 (_ BitVec 32) Int) ListLongMap!17091)

(assert (=> b!1176748 (= lt!531072 (getCurrentListMapNoExtraKeys!5028 lt!531078 lt!531074 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531071 () V!44625)

(assert (=> b!1176748 (= lt!531074 (array!75987 (store (arr!36643 _values!996) i!673 (ValueCellFull!14102 lt!531071)) (size!37181 _values!996)))))

(declare-fun dynLambda!2945 (Int (_ BitVec 64)) V!44625)

(assert (=> b!1176748 (= lt!531071 (dynLambda!2945 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531073 () ListLongMap!17091)

(assert (=> b!1176748 (= lt!531073 (getCurrentListMapNoExtraKeys!5028 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176749 () Bool)

(assert (=> b!1176749 (= e!668923 (not e!668917))))

(declare-fun res!781626 () Bool)

(assert (=> b!1176749 (=> res!781626 e!668917)))

(assert (=> b!1176749 (= res!781626 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176749 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38688 0))(
  ( (Unit!38689) )
))
(declare-fun lt!531070 () Unit!38688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75984 (_ BitVec 64) (_ BitVec 32)) Unit!38688)

(assert (=> b!1176749 (= lt!531070 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176750 () Bool)

(declare-fun res!781633 () Bool)

(assert (=> b!1176750 (=> (not res!781633) (not e!668913))))

(assert (=> b!1176750 (= res!781633 (= (select (arr!36642 _keys!1208) i!673) k0!934))))

(declare-fun b!1176751 () Bool)

(declare-fun res!781634 () Bool)

(assert (=> b!1176751 (=> (not res!781634) (not e!668913))))

(assert (=> b!1176751 (= res!781634 (and (= (size!37181 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37180 _keys!1208) (size!37181 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176752 () Bool)

(declare-fun e!668920 () Bool)

(assert (=> b!1176752 (= e!668919 e!668920)))

(declare-fun res!781638 () Bool)

(assert (=> b!1176752 (=> res!781638 e!668920)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176752 (= res!781638 (not (validKeyInArray!0 (select (arr!36642 _keys!1208) from!1455))))))

(declare-fun lt!531075 () ListLongMap!17091)

(declare-fun lt!531067 () ListLongMap!17091)

(assert (=> b!1176752 (= lt!531075 lt!531067)))

(declare-fun lt!531080 () ListLongMap!17091)

(declare-fun -!1537 (ListLongMap!17091 (_ BitVec 64)) ListLongMap!17091)

(assert (=> b!1176752 (= lt!531067 (-!1537 lt!531080 k0!934))))

(assert (=> b!1176752 (= lt!531075 (getCurrentListMapNoExtraKeys!5028 lt!531078 lt!531074 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176752 (= lt!531080 (getCurrentListMapNoExtraKeys!5028 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531069 () Unit!38688)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!801 (array!75984 array!75986 (_ BitVec 32) (_ BitVec 32) V!44625 V!44625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38688)

(assert (=> b!1176752 (= lt!531069 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!801 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176753 () Bool)

(declare-fun res!781624 () Bool)

(assert (=> b!1176753 (=> (not res!781624) (not e!668923))))

(assert (=> b!1176753 (= res!781624 (arrayNoDuplicates!0 lt!531078 #b00000000000000000000000000000000 Nil!25828))))

(declare-fun b!1176754 () Bool)

(assert (=> b!1176754 (= e!668915 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176755 () Bool)

(declare-fun e!668911 () Unit!38688)

(declare-fun Unit!38690 () Unit!38688)

(assert (=> b!1176755 (= e!668911 Unit!38690)))

(declare-fun b!1176756 () Bool)

(declare-fun e!668914 () Bool)

(assert (=> b!1176756 (= e!668914 (and e!668918 mapRes!46262))))

(declare-fun condMapEmpty!46262 () Bool)

(declare-fun mapDefault!46262 () ValueCell!14102)

(assert (=> b!1176756 (= condMapEmpty!46262 (= (arr!36643 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14102)) mapDefault!46262)))))

(declare-fun res!781629 () Bool)

(assert (=> start!99508 (=> (not res!781629) (not e!668913))))

(assert (=> start!99508 (= res!781629 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37180 _keys!1208))))))

(assert (=> start!99508 e!668913))

(assert (=> start!99508 tp_is_empty!29623))

(declare-fun array_inv!28092 (array!75984) Bool)

(assert (=> start!99508 (array_inv!28092 _keys!1208)))

(assert (=> start!99508 true))

(assert (=> start!99508 tp!87993))

(declare-fun array_inv!28093 (array!75986) Bool)

(assert (=> start!99508 (and (array_inv!28093 _values!996) e!668914)))

(declare-fun b!1176757 () Bool)

(declare-fun res!781639 () Bool)

(assert (=> b!1176757 (=> (not res!781639) (not e!668913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176757 (= res!781639 (validMask!0 mask!1564))))

(declare-fun b!1176758 () Bool)

(declare-fun res!781630 () Bool)

(assert (=> b!1176758 (=> (not res!781630) (not e!668913))))

(assert (=> b!1176758 (= res!781630 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46262 () Bool)

(assert (=> mapIsEmpty!46262 mapRes!46262))

(declare-fun b!1176759 () Bool)

(declare-fun Unit!38691 () Unit!38688)

(assert (=> b!1176759 (= e!668911 Unit!38691)))

(declare-fun lt!531079 () Unit!38688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75984 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38688)

(assert (=> b!1176759 (= lt!531079 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176759 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531077 () Unit!38688)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75984 (_ BitVec 32) (_ BitVec 32)) Unit!38688)

(assert (=> b!1176759 (= lt!531077 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1176759 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25828)))

(declare-fun lt!531068 () Unit!38688)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75984 (_ BitVec 64) (_ BitVec 32) List!25831) Unit!38688)

(assert (=> b!1176759 (= lt!531068 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25828))))

(assert (=> b!1176759 false))

(declare-fun b!1176760 () Bool)

(declare-fun lt!531076 () tuple2!19122)

(declare-fun e!668916 () Bool)

(declare-fun +!3864 (ListLongMap!17091 tuple2!19122) ListLongMap!17091)

(assert (=> b!1176760 (= e!668916 (= lt!531073 (+!3864 lt!531080 lt!531076)))))

(declare-fun b!1176761 () Bool)

(assert (=> b!1176761 (= e!668920 true)))

(assert (=> b!1176761 e!668916))

(declare-fun res!781635 () Bool)

(assert (=> b!1176761 (=> (not res!781635) (not e!668916))))

(assert (=> b!1176761 (= res!781635 (not (= (select (arr!36642 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531081 () Unit!38688)

(assert (=> b!1176761 (= lt!531081 e!668911)))

(declare-fun c!116737 () Bool)

(assert (=> b!1176761 (= c!116737 (= (select (arr!36642 _keys!1208) from!1455) k0!934))))

(assert (=> b!1176761 e!668922))

(declare-fun res!781625 () Bool)

(assert (=> b!1176761 (=> (not res!781625) (not e!668922))))

(assert (=> b!1176761 (= res!781625 (= lt!531072 (+!3864 lt!531067 lt!531076)))))

(declare-fun get!18725 (ValueCell!14102 V!44625) V!44625)

(assert (=> b!1176761 (= lt!531076 (tuple2!19123 (select (arr!36642 _keys!1208) from!1455) (get!18725 (select (arr!36643 _values!996) from!1455) lt!531071)))))

(assert (= (and start!99508 res!781629) b!1176757))

(assert (= (and b!1176757 res!781639) b!1176751))

(assert (= (and b!1176751 res!781634) b!1176741))

(assert (= (and b!1176741 res!781637) b!1176743))

(assert (= (and b!1176743 res!781631) b!1176747))

(assert (= (and b!1176747 res!781632) b!1176758))

(assert (= (and b!1176758 res!781630) b!1176750))

(assert (= (and b!1176750 res!781633) b!1176746))

(assert (= (and b!1176746 res!781636) b!1176753))

(assert (= (and b!1176753 res!781624) b!1176749))

(assert (= (and b!1176749 (not res!781626)) b!1176748))

(assert (= (and b!1176748 (not res!781627)) b!1176752))

(assert (= (and b!1176752 (not res!781638)) b!1176761))

(assert (= (and b!1176761 res!781625) b!1176744))

(assert (= (and b!1176744 (not res!781628)) b!1176754))

(assert (= (and b!1176761 c!116737) b!1176759))

(assert (= (and b!1176761 (not c!116737)) b!1176755))

(assert (= (and b!1176761 res!781635) b!1176760))

(assert (= (and b!1176756 condMapEmpty!46262) mapIsEmpty!46262))

(assert (= (and b!1176756 (not condMapEmpty!46262)) mapNonEmpty!46262))

(get-info :version)

(assert (= (and mapNonEmpty!46262 ((_ is ValueCellFull!14102) mapValue!46262)) b!1176745))

(assert (= (and b!1176756 ((_ is ValueCellFull!14102) mapDefault!46262)) b!1176742))

(assert (= start!99508 b!1176756))

(declare-fun b_lambda!20219 () Bool)

(assert (=> (not b_lambda!20219) (not b!1176748)))

(declare-fun t!37906 () Bool)

(declare-fun tb!9897 () Bool)

(assert (=> (and start!99508 (= defaultEntry!1004 defaultEntry!1004) t!37906) tb!9897))

(declare-fun result!20369 () Bool)

(assert (=> tb!9897 (= result!20369 tp_is_empty!29623)))

(assert (=> b!1176748 t!37906))

(declare-fun b_and!41033 () Bool)

(assert (= b_and!41031 (and (=> t!37906 result!20369) b_and!41033)))

(declare-fun m!1084193 () Bool)

(assert (=> b!1176744 m!1084193))

(declare-fun m!1084195 () Bool)

(assert (=> b!1176753 m!1084195))

(declare-fun m!1084197 () Bool)

(assert (=> b!1176746 m!1084197))

(declare-fun m!1084199 () Bool)

(assert (=> b!1176746 m!1084199))

(declare-fun m!1084201 () Bool)

(assert (=> b!1176750 m!1084201))

(declare-fun m!1084203 () Bool)

(assert (=> start!99508 m!1084203))

(declare-fun m!1084205 () Bool)

(assert (=> start!99508 m!1084205))

(assert (=> b!1176761 m!1084193))

(declare-fun m!1084207 () Bool)

(assert (=> b!1176761 m!1084207))

(declare-fun m!1084209 () Bool)

(assert (=> b!1176761 m!1084209))

(assert (=> b!1176761 m!1084209))

(declare-fun m!1084211 () Bool)

(assert (=> b!1176761 m!1084211))

(declare-fun m!1084213 () Bool)

(assert (=> b!1176758 m!1084213))

(declare-fun m!1084215 () Bool)

(assert (=> b!1176760 m!1084215))

(declare-fun m!1084217 () Bool)

(assert (=> b!1176757 m!1084217))

(declare-fun m!1084219 () Bool)

(assert (=> b!1176741 m!1084219))

(declare-fun m!1084221 () Bool)

(assert (=> b!1176752 m!1084221))

(declare-fun m!1084223 () Bool)

(assert (=> b!1176752 m!1084223))

(declare-fun m!1084225 () Bool)

(assert (=> b!1176752 m!1084225))

(declare-fun m!1084227 () Bool)

(assert (=> b!1176752 m!1084227))

(assert (=> b!1176752 m!1084193))

(declare-fun m!1084229 () Bool)

(assert (=> b!1176752 m!1084229))

(assert (=> b!1176752 m!1084193))

(declare-fun m!1084231 () Bool)

(assert (=> b!1176759 m!1084231))

(declare-fun m!1084233 () Bool)

(assert (=> b!1176759 m!1084233))

(declare-fun m!1084235 () Bool)

(assert (=> b!1176759 m!1084235))

(declare-fun m!1084237 () Bool)

(assert (=> b!1176759 m!1084237))

(declare-fun m!1084239 () Bool)

(assert (=> b!1176759 m!1084239))

(declare-fun m!1084241 () Bool)

(assert (=> b!1176754 m!1084241))

(declare-fun m!1084243 () Bool)

(assert (=> b!1176749 m!1084243))

(declare-fun m!1084245 () Bool)

(assert (=> b!1176749 m!1084245))

(declare-fun m!1084247 () Bool)

(assert (=> mapNonEmpty!46262 m!1084247))

(declare-fun m!1084249 () Bool)

(assert (=> b!1176743 m!1084249))

(declare-fun m!1084251 () Bool)

(assert (=> b!1176748 m!1084251))

(declare-fun m!1084253 () Bool)

(assert (=> b!1176748 m!1084253))

(declare-fun m!1084255 () Bool)

(assert (=> b!1176748 m!1084255))

(declare-fun m!1084257 () Bool)

(assert (=> b!1176748 m!1084257))

(check-sat (not start!99508) (not b!1176749) (not mapNonEmpty!46262) (not b!1176741) (not b_lambda!20219) (not b!1176753) (not b!1176761) (not b!1176754) (not b!1176758) b_and!41033 (not b!1176752) (not b_next!25093) (not b!1176759) (not b!1176743) (not b!1176757) (not b!1176748) (not b!1176746) tp_is_empty!29623 (not b!1176760))
(check-sat b_and!41033 (not b_next!25093))
