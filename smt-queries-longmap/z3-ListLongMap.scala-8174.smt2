; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99904 () Bool)

(assert start!99904)

(declare-fun b_free!25489 () Bool)

(declare-fun b_next!25489 () Bool)

(assert (=> start!99904 (= b_free!25489 (not b_next!25489))))

(declare-fun tp!89180 () Bool)

(declare-fun b_and!41823 () Bool)

(assert (=> start!99904 (= tp!89180 b_and!41823)))

(declare-fun b!1189041 () Bool)

(declare-fun e!676036 () Bool)

(declare-fun tp_is_empty!30019 () Bool)

(assert (=> b!1189041 (= e!676036 tp_is_empty!30019)))

(declare-fun b!1189042 () Bool)

(declare-fun e!676035 () Bool)

(declare-fun e!676030 () Bool)

(assert (=> b!1189042 (= e!676035 (not e!676030))))

(declare-fun res!790673 () Bool)

(assert (=> b!1189042 (=> res!790673 e!676030)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189042 (= res!790673 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76766 0))(
  ( (array!76767 (arr!37033 (Array (_ BitVec 32) (_ BitVec 64))) (size!37571 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76766)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189042 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39323 0))(
  ( (Unit!39324) )
))
(declare-fun lt!540771 () Unit!39323)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76766 (_ BitVec 64) (_ BitVec 32)) Unit!39323)

(assert (=> b!1189042 (= lt!540771 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189043 () Bool)

(declare-fun e!676031 () Bool)

(assert (=> b!1189043 (= e!676031 e!676035)))

(declare-fun res!790680 () Bool)

(assert (=> b!1189043 (=> (not res!790680) (not e!676035))))

(declare-fun lt!540773 () array!76766)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76766 (_ BitVec 32)) Bool)

(assert (=> b!1189043 (= res!790680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540773 mask!1564))))

(assert (=> b!1189043 (= lt!540773 (array!76767 (store (arr!37033 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37571 _keys!1208)))))

(declare-fun mapNonEmpty!46856 () Bool)

(declare-fun mapRes!46856 () Bool)

(declare-fun tp!89181 () Bool)

(declare-fun e!676032 () Bool)

(assert (=> mapNonEmpty!46856 (= mapRes!46856 (and tp!89181 e!676032))))

(declare-datatypes ((V!45153 0))(
  ( (V!45154 (val!15066 Int)) )
))
(declare-datatypes ((ValueCell!14300 0))(
  ( (ValueCellFull!14300 (v!17703 V!45153)) (EmptyCell!14300) )
))
(declare-fun mapRest!46856 () (Array (_ BitVec 32) ValueCell!14300))

(declare-fun mapKey!46856 () (_ BitVec 32))

(declare-datatypes ((array!76768 0))(
  ( (array!76769 (arr!37034 (Array (_ BitVec 32) ValueCell!14300)) (size!37572 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76768)

(declare-fun mapValue!46856 () ValueCell!14300)

(assert (=> mapNonEmpty!46856 (= (arr!37034 _values!996) (store mapRest!46856 mapKey!46856 mapValue!46856))))

(declare-fun b!1189044 () Bool)

(declare-fun e!676033 () Bool)

(assert (=> b!1189044 (= e!676030 e!676033)))

(declare-fun res!790681 () Bool)

(assert (=> b!1189044 (=> res!790681 e!676033)))

(assert (=> b!1189044 (= res!790681 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45153)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540770 () array!76768)

(declare-fun minValue!944 () V!45153)

(declare-datatypes ((tuple2!19466 0))(
  ( (tuple2!19467 (_1!9744 (_ BitVec 64)) (_2!9744 V!45153)) )
))
(declare-datatypes ((List!26178 0))(
  ( (Nil!26175) (Cons!26174 (h!27383 tuple2!19466) (t!38650 List!26178)) )
))
(declare-datatypes ((ListLongMap!17435 0))(
  ( (ListLongMap!17436 (toList!8733 List!26178)) )
))
(declare-fun lt!540774 () ListLongMap!17435)

(declare-fun getCurrentListMapNoExtraKeys!5183 (array!76766 array!76768 (_ BitVec 32) (_ BitVec 32) V!45153 V!45153 (_ BitVec 32) Int) ListLongMap!17435)

(assert (=> b!1189044 (= lt!540774 (getCurrentListMapNoExtraKeys!5183 lt!540773 lt!540770 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3078 (Int (_ BitVec 64)) V!45153)

(assert (=> b!1189044 (= lt!540770 (array!76769 (store (arr!37034 _values!996) i!673 (ValueCellFull!14300 (dynLambda!3078 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37572 _values!996)))))

(declare-fun lt!540769 () ListLongMap!17435)

(assert (=> b!1189044 (= lt!540769 (getCurrentListMapNoExtraKeys!5183 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189045 () Bool)

(declare-fun res!790672 () Bool)

(assert (=> b!1189045 (=> (not res!790672) (not e!676031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189045 (= res!790672 (validMask!0 mask!1564))))

(declare-fun res!790670 () Bool)

(assert (=> start!99904 (=> (not res!790670) (not e!676031))))

(assert (=> start!99904 (= res!790670 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37571 _keys!1208))))))

(assert (=> start!99904 e!676031))

(assert (=> start!99904 tp_is_empty!30019))

(declare-fun array_inv!28366 (array!76766) Bool)

(assert (=> start!99904 (array_inv!28366 _keys!1208)))

(assert (=> start!99904 true))

(assert (=> start!99904 tp!89180))

(declare-fun e!676029 () Bool)

(declare-fun array_inv!28367 (array!76768) Bool)

(assert (=> start!99904 (and (array_inv!28367 _values!996) e!676029)))

(declare-fun b!1189046 () Bool)

(declare-fun res!790674 () Bool)

(assert (=> b!1189046 (=> (not res!790674) (not e!676031))))

(assert (=> b!1189046 (= res!790674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189047 () Bool)

(declare-fun res!790677 () Bool)

(assert (=> b!1189047 (=> (not res!790677) (not e!676031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189047 (= res!790677 (validKeyInArray!0 k0!934))))

(declare-fun b!1189048 () Bool)

(declare-fun res!790676 () Bool)

(assert (=> b!1189048 (=> (not res!790676) (not e!676031))))

(assert (=> b!1189048 (= res!790676 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37571 _keys!1208))))))

(declare-fun b!1189049 () Bool)

(assert (=> b!1189049 (= e!676029 (and e!676036 mapRes!46856))))

(declare-fun condMapEmpty!46856 () Bool)

(declare-fun mapDefault!46856 () ValueCell!14300)

(assert (=> b!1189049 (= condMapEmpty!46856 (= (arr!37034 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14300)) mapDefault!46856)))))

(declare-fun b!1189050 () Bool)

(declare-fun res!790675 () Bool)

(assert (=> b!1189050 (=> (not res!790675) (not e!676031))))

(declare-datatypes ((List!26179 0))(
  ( (Nil!26176) (Cons!26175 (h!27384 (_ BitVec 64)) (t!38651 List!26179)) )
))
(declare-fun arrayNoDuplicates!0 (array!76766 (_ BitVec 32) List!26179) Bool)

(assert (=> b!1189050 (= res!790675 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26176))))

(declare-fun b!1189051 () Bool)

(assert (=> b!1189051 (= e!676032 tp_is_empty!30019)))

(declare-fun b!1189052 () Bool)

(assert (=> b!1189052 (= e!676033 true)))

(declare-fun -!1680 (ListLongMap!17435 (_ BitVec 64)) ListLongMap!17435)

(assert (=> b!1189052 (= (getCurrentListMapNoExtraKeys!5183 lt!540773 lt!540770 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1680 (getCurrentListMapNoExtraKeys!5183 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!540772 () Unit!39323)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!930 (array!76766 array!76768 (_ BitVec 32) (_ BitVec 32) V!45153 V!45153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39323)

(assert (=> b!1189052 (= lt!540772 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!930 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189053 () Bool)

(declare-fun res!790671 () Bool)

(assert (=> b!1189053 (=> (not res!790671) (not e!676031))))

(assert (=> b!1189053 (= res!790671 (= (select (arr!37033 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46856 () Bool)

(assert (=> mapIsEmpty!46856 mapRes!46856))

(declare-fun b!1189054 () Bool)

(declare-fun res!790678 () Bool)

(assert (=> b!1189054 (=> (not res!790678) (not e!676035))))

(assert (=> b!1189054 (= res!790678 (arrayNoDuplicates!0 lt!540773 #b00000000000000000000000000000000 Nil!26176))))

(declare-fun b!1189055 () Bool)

(declare-fun res!790679 () Bool)

(assert (=> b!1189055 (=> (not res!790679) (not e!676031))))

(assert (=> b!1189055 (= res!790679 (and (= (size!37572 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37571 _keys!1208) (size!37572 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99904 res!790670) b!1189045))

(assert (= (and b!1189045 res!790672) b!1189055))

(assert (= (and b!1189055 res!790679) b!1189046))

(assert (= (and b!1189046 res!790674) b!1189050))

(assert (= (and b!1189050 res!790675) b!1189048))

(assert (= (and b!1189048 res!790676) b!1189047))

(assert (= (and b!1189047 res!790677) b!1189053))

(assert (= (and b!1189053 res!790671) b!1189043))

(assert (= (and b!1189043 res!790680) b!1189054))

(assert (= (and b!1189054 res!790678) b!1189042))

(assert (= (and b!1189042 (not res!790673)) b!1189044))

(assert (= (and b!1189044 (not res!790681)) b!1189052))

(assert (= (and b!1189049 condMapEmpty!46856) mapIsEmpty!46856))

(assert (= (and b!1189049 (not condMapEmpty!46856)) mapNonEmpty!46856))

(get-info :version)

(assert (= (and mapNonEmpty!46856 ((_ is ValueCellFull!14300) mapValue!46856)) b!1189051))

(assert (= (and b!1189049 ((_ is ValueCellFull!14300) mapDefault!46856)) b!1189041))

(assert (= start!99904 b!1189049))

(declare-fun b_lambda!20615 () Bool)

(assert (=> (not b_lambda!20615) (not b!1189044)))

(declare-fun t!38649 () Bool)

(declare-fun tb!10293 () Bool)

(assert (=> (and start!99904 (= defaultEntry!1004 defaultEntry!1004) t!38649) tb!10293))

(declare-fun result!21161 () Bool)

(assert (=> tb!10293 (= result!21161 tp_is_empty!30019)))

(assert (=> b!1189044 t!38649))

(declare-fun b_and!41825 () Bool)

(assert (= b_and!41823 (and (=> t!38649 result!21161) b_and!41825)))

(declare-fun m!1097261 () Bool)

(assert (=> b!1189054 m!1097261))

(declare-fun m!1097263 () Bool)

(assert (=> b!1189042 m!1097263))

(declare-fun m!1097265 () Bool)

(assert (=> b!1189042 m!1097265))

(declare-fun m!1097267 () Bool)

(assert (=> b!1189043 m!1097267))

(declare-fun m!1097269 () Bool)

(assert (=> b!1189043 m!1097269))

(declare-fun m!1097271 () Bool)

(assert (=> b!1189045 m!1097271))

(declare-fun m!1097273 () Bool)

(assert (=> b!1189053 m!1097273))

(declare-fun m!1097275 () Bool)

(assert (=> mapNonEmpty!46856 m!1097275))

(declare-fun m!1097277 () Bool)

(assert (=> b!1189047 m!1097277))

(declare-fun m!1097279 () Bool)

(assert (=> b!1189050 m!1097279))

(declare-fun m!1097281 () Bool)

(assert (=> b!1189052 m!1097281))

(declare-fun m!1097283 () Bool)

(assert (=> b!1189052 m!1097283))

(assert (=> b!1189052 m!1097283))

(declare-fun m!1097285 () Bool)

(assert (=> b!1189052 m!1097285))

(declare-fun m!1097287 () Bool)

(assert (=> b!1189052 m!1097287))

(declare-fun m!1097289 () Bool)

(assert (=> b!1189044 m!1097289))

(declare-fun m!1097291 () Bool)

(assert (=> b!1189044 m!1097291))

(declare-fun m!1097293 () Bool)

(assert (=> b!1189044 m!1097293))

(declare-fun m!1097295 () Bool)

(assert (=> b!1189044 m!1097295))

(declare-fun m!1097297 () Bool)

(assert (=> b!1189046 m!1097297))

(declare-fun m!1097299 () Bool)

(assert (=> start!99904 m!1097299))

(declare-fun m!1097301 () Bool)

(assert (=> start!99904 m!1097301))

(check-sat tp_is_empty!30019 (not b_lambda!20615) (not b!1189052) (not start!99904) (not mapNonEmpty!46856) (not b!1189054) (not b!1189045) (not b!1189046) (not b!1189043) (not b!1189042) (not b!1189047) (not b_next!25489) b_and!41825 (not b!1189044) (not b!1189050))
(check-sat b_and!41825 (not b_next!25489))
