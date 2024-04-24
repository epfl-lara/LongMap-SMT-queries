; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99960 () Bool)

(assert start!99960)

(declare-fun b_free!25303 () Bool)

(declare-fun b_next!25303 () Bool)

(assert (=> start!99960 (= b_free!25303 (not b_next!25303))))

(declare-fun tp!88623 () Bool)

(declare-fun b_and!41475 () Bool)

(assert (=> start!99960 (= tp!88623 b_and!41475)))

(declare-fun b!1184968 () Bool)

(declare-fun e!673822 () Bool)

(declare-fun e!673815 () Bool)

(assert (=> b!1184968 (= e!673822 e!673815)))

(declare-fun res!787238 () Bool)

(assert (=> b!1184968 (=> res!787238 e!673815)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1184968 (= res!787238 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44905 0))(
  ( (V!44906 (val!14973 Int)) )
))
(declare-fun zeroValue!944 () V!44905)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!76511 0))(
  ( (array!76512 (arr!36899 (Array (_ BitVec 32) (_ BitVec 64))) (size!37436 (_ BitVec 32))) )
))
(declare-fun lt!536876 () array!76511)

(declare-datatypes ((ValueCell!14207 0))(
  ( (ValueCellFull!14207 (v!17607 V!44905)) (EmptyCell!14207) )
))
(declare-datatypes ((array!76513 0))(
  ( (array!76514 (arr!36900 (Array (_ BitVec 32) ValueCell!14207)) (size!37437 (_ BitVec 32))) )
))
(declare-fun lt!536890 () array!76513)

(declare-fun minValue!944 () V!44905)

(declare-datatypes ((tuple2!19240 0))(
  ( (tuple2!19241 (_1!9631 (_ BitVec 64)) (_2!9631 V!44905)) )
))
(declare-datatypes ((List!25971 0))(
  ( (Nil!25968) (Cons!25967 (h!27185 tuple2!19240) (t!38258 List!25971)) )
))
(declare-datatypes ((ListLongMap!17217 0))(
  ( (ListLongMap!17218 (toList!8624 List!25971)) )
))
(declare-fun lt!536884 () ListLongMap!17217)

(declare-fun getCurrentListMapNoExtraKeys!5095 (array!76511 array!76513 (_ BitVec 32) (_ BitVec 32) V!44905 V!44905 (_ BitVec 32) Int) ListLongMap!17217)

(assert (=> b!1184968 (= lt!536884 (getCurrentListMapNoExtraKeys!5095 lt!536876 lt!536890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76513)

(declare-fun lt!536882 () V!44905)

(assert (=> b!1184968 (= lt!536890 (array!76514 (store (arr!36900 _values!996) i!673 (ValueCellFull!14207 lt!536882)) (size!37437 _values!996)))))

(declare-fun dynLambda!3058 (Int (_ BitVec 64)) V!44905)

(assert (=> b!1184968 (= lt!536882 (dynLambda!3058 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76511)

(declare-fun lt!536873 () ListLongMap!17217)

(assert (=> b!1184968 (= lt!536873 (getCurrentListMapNoExtraKeys!5095 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184969 () Bool)

(declare-fun e!673817 () Bool)

(declare-fun e!673819 () Bool)

(declare-fun mapRes!46577 () Bool)

(assert (=> b!1184969 (= e!673817 (and e!673819 mapRes!46577))))

(declare-fun condMapEmpty!46577 () Bool)

(declare-fun mapDefault!46577 () ValueCell!14207)

(assert (=> b!1184969 (= condMapEmpty!46577 (= (arr!36900 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14207)) mapDefault!46577)))))

(declare-fun b!1184970 () Bool)

(declare-datatypes ((Unit!39181 0))(
  ( (Unit!39182) )
))
(declare-fun e!673823 () Unit!39181)

(declare-fun Unit!39183 () Unit!39181)

(assert (=> b!1184970 (= e!673823 Unit!39183)))

(declare-fun lt!536874 () Unit!39181)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76511 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39181)

(assert (=> b!1184970 (= lt!536874 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184970 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536886 () Unit!39181)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76511 (_ BitVec 32) (_ BitVec 32)) Unit!39181)

(assert (=> b!1184970 (= lt!536886 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25972 0))(
  ( (Nil!25969) (Cons!25968 (h!27186 (_ BitVec 64)) (t!38259 List!25972)) )
))
(declare-fun arrayNoDuplicates!0 (array!76511 (_ BitVec 32) List!25972) Bool)

(assert (=> b!1184970 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25969)))

(declare-fun lt!536883 () Unit!39181)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76511 (_ BitVec 64) (_ BitVec 32) List!25972) Unit!39181)

(assert (=> b!1184970 (= lt!536883 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25969))))

(assert (=> b!1184970 false))

(declare-fun b!1184971 () Bool)

(declare-fun res!787228 () Bool)

(declare-fun e!673818 () Bool)

(assert (=> b!1184971 (=> (not res!787228) (not e!673818))))

(assert (=> b!1184971 (= res!787228 (arrayNoDuplicates!0 lt!536876 #b00000000000000000000000000000000 Nil!25969))))

(declare-fun b!1184972 () Bool)

(assert (=> b!1184972 (= e!673818 (not e!673822))))

(declare-fun res!787231 () Bool)

(assert (=> b!1184972 (=> res!787231 e!673822)))

(assert (=> b!1184972 (= res!787231 (bvsgt from!1455 i!673))))

(assert (=> b!1184972 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536887 () Unit!39181)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76511 (_ BitVec 64) (_ BitVec 32)) Unit!39181)

(assert (=> b!1184972 (= lt!536887 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184973 () Bool)

(declare-fun res!787241 () Bool)

(declare-fun e!673816 () Bool)

(assert (=> b!1184973 (=> (not res!787241) (not e!673816))))

(assert (=> b!1184973 (= res!787241 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25969))))

(declare-fun b!1184974 () Bool)

(declare-fun res!787230 () Bool)

(assert (=> b!1184974 (=> (not res!787230) (not e!673816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184974 (= res!787230 (validMask!0 mask!1564))))

(declare-fun b!1184975 () Bool)

(declare-fun e!673820 () Bool)

(assert (=> b!1184975 (= e!673820 true)))

(declare-fun lt!536880 () ListLongMap!17217)

(declare-fun lt!536872 () ListLongMap!17217)

(declare-fun -!1645 (ListLongMap!17217 (_ BitVec 64)) ListLongMap!17217)

(assert (=> b!1184975 (= (-!1645 lt!536880 k0!934) lt!536872)))

(declare-fun lt!536875 () Unit!39181)

(declare-fun lt!536879 () ListLongMap!17217)

(declare-fun lt!536888 () V!44905)

(declare-fun addRemoveCommutativeForDiffKeys!159 (ListLongMap!17217 (_ BitVec 64) V!44905 (_ BitVec 64)) Unit!39181)

(assert (=> b!1184975 (= lt!536875 (addRemoveCommutativeForDiffKeys!159 lt!536879 (select (arr!36899 _keys!1208) from!1455) lt!536888 k0!934))))

(declare-fun lt!536885 () ListLongMap!17217)

(declare-fun lt!536881 () ListLongMap!17217)

(assert (=> b!1184975 (and (= lt!536873 lt!536880) (= lt!536885 lt!536881))))

(declare-fun lt!536878 () tuple2!19240)

(declare-fun +!3943 (ListLongMap!17217 tuple2!19240) ListLongMap!17217)

(assert (=> b!1184975 (= lt!536880 (+!3943 lt!536879 lt!536878))))

(assert (=> b!1184975 (not (= (select (arr!36899 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536889 () Unit!39181)

(assert (=> b!1184975 (= lt!536889 e!673823)))

(declare-fun c!117476 () Bool)

(assert (=> b!1184975 (= c!117476 (= (select (arr!36899 _keys!1208) from!1455) k0!934))))

(declare-fun e!673824 () Bool)

(assert (=> b!1184975 e!673824))

(declare-fun res!787240 () Bool)

(assert (=> b!1184975 (=> (not res!787240) (not e!673824))))

(assert (=> b!1184975 (= res!787240 (= lt!536884 lt!536872))))

(assert (=> b!1184975 (= lt!536872 (+!3943 lt!536885 lt!536878))))

(assert (=> b!1184975 (= lt!536878 (tuple2!19241 (select (arr!36899 _keys!1208) from!1455) lt!536888))))

(declare-fun get!18922 (ValueCell!14207 V!44905) V!44905)

(assert (=> b!1184975 (= lt!536888 (get!18922 (select (arr!36900 _values!996) from!1455) lt!536882))))

(declare-fun b!1184976 () Bool)

(declare-fun res!787236 () Bool)

(assert (=> b!1184976 (=> (not res!787236) (not e!673816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184976 (= res!787236 (validKeyInArray!0 k0!934))))

(declare-fun b!1184977 () Bool)

(assert (=> b!1184977 (= e!673816 e!673818)))

(declare-fun res!787227 () Bool)

(assert (=> b!1184977 (=> (not res!787227) (not e!673818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76511 (_ BitVec 32)) Bool)

(assert (=> b!1184977 (= res!787227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536876 mask!1564))))

(assert (=> b!1184977 (= lt!536876 (array!76512 (store (arr!36899 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37436 _keys!1208)))))

(declare-fun mapIsEmpty!46577 () Bool)

(assert (=> mapIsEmpty!46577 mapRes!46577))

(declare-fun b!1184978 () Bool)

(declare-fun res!787235 () Bool)

(assert (=> b!1184978 (=> (not res!787235) (not e!673816))))

(assert (=> b!1184978 (= res!787235 (and (= (size!37437 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37436 _keys!1208) (size!37437 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184979 () Bool)

(declare-fun e!673825 () Bool)

(declare-fun tp_is_empty!29833 () Bool)

(assert (=> b!1184979 (= e!673825 tp_is_empty!29833)))

(declare-fun res!787234 () Bool)

(assert (=> start!99960 (=> (not res!787234) (not e!673816))))

(assert (=> start!99960 (= res!787234 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37436 _keys!1208))))))

(assert (=> start!99960 e!673816))

(assert (=> start!99960 tp_is_empty!29833))

(declare-fun array_inv!28240 (array!76511) Bool)

(assert (=> start!99960 (array_inv!28240 _keys!1208)))

(assert (=> start!99960 true))

(assert (=> start!99960 tp!88623))

(declare-fun array_inv!28241 (array!76513) Bool)

(assert (=> start!99960 (and (array_inv!28241 _values!996) e!673817)))

(declare-fun b!1184980 () Bool)

(declare-fun res!787239 () Bool)

(assert (=> b!1184980 (=> (not res!787239) (not e!673816))))

(assert (=> b!1184980 (= res!787239 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37436 _keys!1208))))))

(declare-fun b!1184981 () Bool)

(declare-fun Unit!39184 () Unit!39181)

(assert (=> b!1184981 (= e!673823 Unit!39184)))

(declare-fun b!1184982 () Bool)

(declare-fun e!673826 () Bool)

(assert (=> b!1184982 (= e!673826 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184983 () Bool)

(assert (=> b!1184983 (= e!673824 e!673826)))

(declare-fun res!787229 () Bool)

(assert (=> b!1184983 (=> res!787229 e!673826)))

(assert (=> b!1184983 (= res!787229 (not (= (select (arr!36899 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184984 () Bool)

(declare-fun res!787233 () Bool)

(assert (=> b!1184984 (=> (not res!787233) (not e!673816))))

(assert (=> b!1184984 (= res!787233 (= (select (arr!36899 _keys!1208) i!673) k0!934))))

(declare-fun b!1184985 () Bool)

(assert (=> b!1184985 (= e!673819 tp_is_empty!29833)))

(declare-fun b!1184986 () Bool)

(declare-fun res!787237 () Bool)

(assert (=> b!1184986 (=> (not res!787237) (not e!673816))))

(assert (=> b!1184986 (= res!787237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184987 () Bool)

(assert (=> b!1184987 (= e!673815 e!673820)))

(declare-fun res!787232 () Bool)

(assert (=> b!1184987 (=> res!787232 e!673820)))

(assert (=> b!1184987 (= res!787232 (not (validKeyInArray!0 (select (arr!36899 _keys!1208) from!1455))))))

(assert (=> b!1184987 (= lt!536881 lt!536885)))

(assert (=> b!1184987 (= lt!536885 (-!1645 lt!536879 k0!934))))

(assert (=> b!1184987 (= lt!536881 (getCurrentListMapNoExtraKeys!5095 lt!536876 lt!536890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184987 (= lt!536879 (getCurrentListMapNoExtraKeys!5095 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536877 () Unit!39181)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!867 (array!76511 array!76513 (_ BitVec 32) (_ BitVec 32) V!44905 V!44905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39181)

(assert (=> b!1184987 (= lt!536877 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!867 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46577 () Bool)

(declare-fun tp!88622 () Bool)

(assert (=> mapNonEmpty!46577 (= mapRes!46577 (and tp!88622 e!673825))))

(declare-fun mapRest!46577 () (Array (_ BitVec 32) ValueCell!14207))

(declare-fun mapKey!46577 () (_ BitVec 32))

(declare-fun mapValue!46577 () ValueCell!14207)

(assert (=> mapNonEmpty!46577 (= (arr!36900 _values!996) (store mapRest!46577 mapKey!46577 mapValue!46577))))

(assert (= (and start!99960 res!787234) b!1184974))

(assert (= (and b!1184974 res!787230) b!1184978))

(assert (= (and b!1184978 res!787235) b!1184986))

(assert (= (and b!1184986 res!787237) b!1184973))

(assert (= (and b!1184973 res!787241) b!1184980))

(assert (= (and b!1184980 res!787239) b!1184976))

(assert (= (and b!1184976 res!787236) b!1184984))

(assert (= (and b!1184984 res!787233) b!1184977))

(assert (= (and b!1184977 res!787227) b!1184971))

(assert (= (and b!1184971 res!787228) b!1184972))

(assert (= (and b!1184972 (not res!787231)) b!1184968))

(assert (= (and b!1184968 (not res!787238)) b!1184987))

(assert (= (and b!1184987 (not res!787232)) b!1184975))

(assert (= (and b!1184975 res!787240) b!1184983))

(assert (= (and b!1184983 (not res!787229)) b!1184982))

(assert (= (and b!1184975 c!117476) b!1184970))

(assert (= (and b!1184975 (not c!117476)) b!1184981))

(assert (= (and b!1184969 condMapEmpty!46577) mapIsEmpty!46577))

(assert (= (and b!1184969 (not condMapEmpty!46577)) mapNonEmpty!46577))

(get-info :version)

(assert (= (and mapNonEmpty!46577 ((_ is ValueCellFull!14207) mapValue!46577)) b!1184979))

(assert (= (and b!1184969 ((_ is ValueCellFull!14207) mapDefault!46577)) b!1184985))

(assert (= start!99960 b!1184969))

(declare-fun b_lambda!20441 () Bool)

(assert (=> (not b_lambda!20441) (not b!1184968)))

(declare-fun t!38257 () Bool)

(declare-fun tb!10107 () Bool)

(assert (=> (and start!99960 (= defaultEntry!1004 defaultEntry!1004) t!38257) tb!10107))

(declare-fun result!20789 () Bool)

(assert (=> tb!10107 (= result!20789 tp_is_empty!29833)))

(assert (=> b!1184968 t!38257))

(declare-fun b_and!41477 () Bool)

(assert (= b_and!41475 (and (=> t!38257 result!20789) b_and!41477)))

(declare-fun m!1093437 () Bool)

(assert (=> b!1184984 m!1093437))

(declare-fun m!1093439 () Bool)

(assert (=> start!99960 m!1093439))

(declare-fun m!1093441 () Bool)

(assert (=> start!99960 m!1093441))

(declare-fun m!1093443 () Bool)

(assert (=> b!1184970 m!1093443))

(declare-fun m!1093445 () Bool)

(assert (=> b!1184970 m!1093445))

(declare-fun m!1093447 () Bool)

(assert (=> b!1184970 m!1093447))

(declare-fun m!1093449 () Bool)

(assert (=> b!1184970 m!1093449))

(declare-fun m!1093451 () Bool)

(assert (=> b!1184970 m!1093451))

(declare-fun m!1093453 () Bool)

(assert (=> b!1184968 m!1093453))

(declare-fun m!1093455 () Bool)

(assert (=> b!1184968 m!1093455))

(declare-fun m!1093457 () Bool)

(assert (=> b!1184968 m!1093457))

(declare-fun m!1093459 () Bool)

(assert (=> b!1184968 m!1093459))

(declare-fun m!1093461 () Bool)

(assert (=> b!1184987 m!1093461))

(declare-fun m!1093463 () Bool)

(assert (=> b!1184987 m!1093463))

(declare-fun m!1093465 () Bool)

(assert (=> b!1184987 m!1093465))

(declare-fun m!1093467 () Bool)

(assert (=> b!1184987 m!1093467))

(declare-fun m!1093469 () Bool)

(assert (=> b!1184987 m!1093469))

(declare-fun m!1093471 () Bool)

(assert (=> b!1184987 m!1093471))

(assert (=> b!1184987 m!1093467))

(declare-fun m!1093473 () Bool)

(assert (=> b!1184977 m!1093473))

(declare-fun m!1093475 () Bool)

(assert (=> b!1184977 m!1093475))

(declare-fun m!1093477 () Bool)

(assert (=> b!1184976 m!1093477))

(assert (=> b!1184983 m!1093467))

(declare-fun m!1093479 () Bool)

(assert (=> b!1184971 m!1093479))

(declare-fun m!1093481 () Bool)

(assert (=> b!1184974 m!1093481))

(declare-fun m!1093483 () Bool)

(assert (=> b!1184986 m!1093483))

(declare-fun m!1093485 () Bool)

(assert (=> b!1184972 m!1093485))

(declare-fun m!1093487 () Bool)

(assert (=> b!1184972 m!1093487))

(declare-fun m!1093489 () Bool)

(assert (=> mapNonEmpty!46577 m!1093489))

(declare-fun m!1093491 () Bool)

(assert (=> b!1184982 m!1093491))

(declare-fun m!1093493 () Bool)

(assert (=> b!1184973 m!1093493))

(assert (=> b!1184975 m!1093467))

(declare-fun m!1093495 () Bool)

(assert (=> b!1184975 m!1093495))

(declare-fun m!1093497 () Bool)

(assert (=> b!1184975 m!1093497))

(assert (=> b!1184975 m!1093497))

(declare-fun m!1093499 () Bool)

(assert (=> b!1184975 m!1093499))

(declare-fun m!1093501 () Bool)

(assert (=> b!1184975 m!1093501))

(declare-fun m!1093503 () Bool)

(assert (=> b!1184975 m!1093503))

(declare-fun m!1093505 () Bool)

(assert (=> b!1184975 m!1093505))

(assert (=> b!1184975 m!1093467))

(check-sat (not b!1184972) b_and!41477 (not b_lambda!20441) (not b!1184986) (not b!1184971) (not b!1184976) (not b!1184974) tp_is_empty!29833 (not b!1184982) (not b!1184970) (not start!99960) (not b!1184968) (not b!1184975) (not b_next!25303) (not b!1184977) (not b!1184973) (not b!1184987) (not mapNonEmpty!46577))
(check-sat b_and!41477 (not b_next!25303))
