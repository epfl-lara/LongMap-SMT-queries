; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99682 () Bool)

(assert start!99682)

(declare-fun b_free!25267 () Bool)

(declare-fun b_next!25267 () Bool)

(assert (=> start!99682 (= b_free!25267 (not b_next!25267))))

(declare-fun tp!88514 () Bool)

(declare-fun b_and!41379 () Bool)

(assert (=> start!99682 (= tp!88514 b_and!41379)))

(declare-fun mapIsEmpty!46523 () Bool)

(declare-fun mapRes!46523 () Bool)

(assert (=> mapIsEmpty!46523 mapRes!46523))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1182439 () Bool)

(declare-fun e!672261 () Bool)

(declare-datatypes ((array!76328 0))(
  ( (array!76329 (arr!36814 (Array (_ BitVec 32) (_ BitVec 64))) (size!37352 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76328)

(declare-fun arrayContainsKey!0 (array!76328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182439 (= e!672261 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182440 () Bool)

(declare-fun e!672260 () Bool)

(assert (=> b!1182440 (= e!672260 true)))

(declare-datatypes ((V!44857 0))(
  ( (V!44858 (val!14955 Int)) )
))
(declare-datatypes ((tuple2!19276 0))(
  ( (tuple2!19277 (_1!9649 (_ BitVec 64)) (_2!9649 V!44857)) )
))
(declare-datatypes ((List!25982 0))(
  ( (Nil!25979) (Cons!25978 (h!27187 tuple2!19276) (t!38232 List!25982)) )
))
(declare-datatypes ((ListLongMap!17245 0))(
  ( (ListLongMap!17246 (toList!8638 List!25982)) )
))
(declare-fun lt!535186 () ListLongMap!17245)

(declare-fun lt!535180 () ListLongMap!17245)

(declare-fun -!1596 (ListLongMap!17245 (_ BitVec 64)) ListLongMap!17245)

(assert (=> b!1182440 (= (-!1596 lt!535186 k0!934) lt!535180)))

(declare-fun lt!535177 () V!44857)

(declare-datatypes ((Unit!38973 0))(
  ( (Unit!38974) )
))
(declare-fun lt!535183 () Unit!38973)

(declare-fun lt!535188 () ListLongMap!17245)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun addRemoveCommutativeForDiffKeys!144 (ListLongMap!17245 (_ BitVec 64) V!44857 (_ BitVec 64)) Unit!38973)

(assert (=> b!1182440 (= lt!535183 (addRemoveCommutativeForDiffKeys!144 lt!535188 (select (arr!36814 _keys!1208) from!1455) lt!535177 k0!934))))

(declare-fun lt!535170 () ListLongMap!17245)

(declare-fun lt!535178 () ListLongMap!17245)

(declare-fun lt!535173 () ListLongMap!17245)

(assert (=> b!1182440 (and (= lt!535170 lt!535186) (= lt!535178 lt!535173))))

(declare-fun lt!535181 () tuple2!19276)

(declare-fun +!3930 (ListLongMap!17245 tuple2!19276) ListLongMap!17245)

(assert (=> b!1182440 (= lt!535186 (+!3930 lt!535188 lt!535181))))

(assert (=> b!1182440 (not (= (select (arr!36814 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535176 () Unit!38973)

(declare-fun e!672262 () Unit!38973)

(assert (=> b!1182440 (= lt!535176 e!672262)))

(declare-fun c!116998 () Bool)

(assert (=> b!1182440 (= c!116998 (= (select (arr!36814 _keys!1208) from!1455) k0!934))))

(declare-fun e!672263 () Bool)

(assert (=> b!1182440 e!672263))

(declare-fun res!785856 () Bool)

(assert (=> b!1182440 (=> (not res!785856) (not e!672263))))

(declare-fun lt!535184 () ListLongMap!17245)

(assert (=> b!1182440 (= res!785856 (= lt!535184 lt!535180))))

(assert (=> b!1182440 (= lt!535180 (+!3930 lt!535178 lt!535181))))

(assert (=> b!1182440 (= lt!535181 (tuple2!19277 (select (arr!36814 _keys!1208) from!1455) lt!535177))))

(declare-fun lt!535175 () V!44857)

(declare-datatypes ((ValueCell!14189 0))(
  ( (ValueCellFull!14189 (v!17592 V!44857)) (EmptyCell!14189) )
))
(declare-datatypes ((array!76330 0))(
  ( (array!76331 (arr!36815 (Array (_ BitVec 32) ValueCell!14189)) (size!37353 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76330)

(declare-fun get!18841 (ValueCell!14189 V!44857) V!44857)

(assert (=> b!1182440 (= lt!535177 (get!18841 (select (arr!36815 _values!996) from!1455) lt!535175))))

(declare-fun b!1182441 () Bool)

(declare-fun Unit!38975 () Unit!38973)

(assert (=> b!1182441 (= e!672262 Unit!38975)))

(declare-fun b!1182442 () Bool)

(declare-fun res!785852 () Bool)

(declare-fun e!672264 () Bool)

(assert (=> b!1182442 (=> (not res!785852) (not e!672264))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1182442 (= res!785852 (and (= (size!37353 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37352 _keys!1208) (size!37353 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182443 () Bool)

(declare-fun e!672267 () Bool)

(declare-fun tp_is_empty!29797 () Bool)

(assert (=> b!1182443 (= e!672267 tp_is_empty!29797)))

(declare-fun b!1182444 () Bool)

(declare-fun res!785857 () Bool)

(assert (=> b!1182444 (=> (not res!785857) (not e!672264))))

(assert (=> b!1182444 (= res!785857 (= (select (arr!36814 _keys!1208) i!673) k0!934))))

(declare-fun b!1182445 () Bool)

(declare-fun res!785848 () Bool)

(declare-fun e!672268 () Bool)

(assert (=> b!1182445 (=> (not res!785848) (not e!672268))))

(declare-fun lt!535179 () array!76328)

(declare-datatypes ((List!25983 0))(
  ( (Nil!25980) (Cons!25979 (h!27188 (_ BitVec 64)) (t!38233 List!25983)) )
))
(declare-fun arrayNoDuplicates!0 (array!76328 (_ BitVec 32) List!25983) Bool)

(assert (=> b!1182445 (= res!785848 (arrayNoDuplicates!0 lt!535179 #b00000000000000000000000000000000 Nil!25980))))

(declare-fun b!1182446 () Bool)

(declare-fun e!672259 () Bool)

(assert (=> b!1182446 (= e!672268 (not e!672259))))

(declare-fun res!785851 () Bool)

(assert (=> b!1182446 (=> res!785851 e!672259)))

(assert (=> b!1182446 (= res!785851 (bvsgt from!1455 i!673))))

(assert (=> b!1182446 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535171 () Unit!38973)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76328 (_ BitVec 64) (_ BitVec 32)) Unit!38973)

(assert (=> b!1182446 (= lt!535171 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182447 () Bool)

(declare-fun res!785853 () Bool)

(assert (=> b!1182447 (=> (not res!785853) (not e!672264))))

(assert (=> b!1182447 (= res!785853 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37352 _keys!1208))))))

(declare-fun b!1182448 () Bool)

(declare-fun e!672265 () Bool)

(assert (=> b!1182448 (= e!672265 tp_is_empty!29797)))

(declare-fun b!1182449 () Bool)

(declare-fun Unit!38976 () Unit!38973)

(assert (=> b!1182449 (= e!672262 Unit!38976)))

(declare-fun lt!535174 () Unit!38973)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76328 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38973)

(assert (=> b!1182449 (= lt!535174 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182449 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535172 () Unit!38973)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76328 (_ BitVec 32) (_ BitVec 32)) Unit!38973)

(assert (=> b!1182449 (= lt!535172 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182449 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25980)))

(declare-fun lt!535185 () Unit!38973)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76328 (_ BitVec 64) (_ BitVec 32) List!25983) Unit!38973)

(assert (=> b!1182449 (= lt!535185 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25980))))

(assert (=> b!1182449 false))

(declare-fun mapNonEmpty!46523 () Bool)

(declare-fun tp!88515 () Bool)

(assert (=> mapNonEmpty!46523 (= mapRes!46523 (and tp!88515 e!672265))))

(declare-fun mapValue!46523 () ValueCell!14189)

(declare-fun mapRest!46523 () (Array (_ BitVec 32) ValueCell!14189))

(declare-fun mapKey!46523 () (_ BitVec 32))

(assert (=> mapNonEmpty!46523 (= (arr!36815 _values!996) (store mapRest!46523 mapKey!46523 mapValue!46523))))

(declare-fun res!785844 () Bool)

(assert (=> start!99682 (=> (not res!785844) (not e!672264))))

(assert (=> start!99682 (= res!785844 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37352 _keys!1208))))))

(assert (=> start!99682 e!672264))

(assert (=> start!99682 tp_is_empty!29797))

(declare-fun array_inv!28212 (array!76328) Bool)

(assert (=> start!99682 (array_inv!28212 _keys!1208)))

(assert (=> start!99682 true))

(assert (=> start!99682 tp!88514))

(declare-fun e!672257 () Bool)

(declare-fun array_inv!28213 (array!76330) Bool)

(assert (=> start!99682 (and (array_inv!28213 _values!996) e!672257)))

(declare-fun b!1182450 () Bool)

(declare-fun res!785849 () Bool)

(assert (=> b!1182450 (=> (not res!785849) (not e!672264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182450 (= res!785849 (validKeyInArray!0 k0!934))))

(declare-fun b!1182451 () Bool)

(assert (=> b!1182451 (= e!672257 (and e!672267 mapRes!46523))))

(declare-fun condMapEmpty!46523 () Bool)

(declare-fun mapDefault!46523 () ValueCell!14189)

(assert (=> b!1182451 (= condMapEmpty!46523 (= (arr!36815 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14189)) mapDefault!46523)))))

(declare-fun b!1182452 () Bool)

(assert (=> b!1182452 (= e!672264 e!672268)))

(declare-fun res!785847 () Bool)

(assert (=> b!1182452 (=> (not res!785847) (not e!672268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76328 (_ BitVec 32)) Bool)

(assert (=> b!1182452 (= res!785847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535179 mask!1564))))

(assert (=> b!1182452 (= lt!535179 (array!76329 (store (arr!36814 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37352 _keys!1208)))))

(declare-fun b!1182453 () Bool)

(declare-fun e!672258 () Bool)

(assert (=> b!1182453 (= e!672258 e!672260)))

(declare-fun res!785843 () Bool)

(assert (=> b!1182453 (=> res!785843 e!672260)))

(assert (=> b!1182453 (= res!785843 (not (validKeyInArray!0 (select (arr!36814 _keys!1208) from!1455))))))

(assert (=> b!1182453 (= lt!535173 lt!535178)))

(assert (=> b!1182453 (= lt!535178 (-!1596 lt!535188 k0!934))))

(declare-fun zeroValue!944 () V!44857)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!535182 () array!76330)

(declare-fun minValue!944 () V!44857)

(declare-fun getCurrentListMapNoExtraKeys!5093 (array!76328 array!76330 (_ BitVec 32) (_ BitVec 32) V!44857 V!44857 (_ BitVec 32) Int) ListLongMap!17245)

(assert (=> b!1182453 (= lt!535173 (getCurrentListMapNoExtraKeys!5093 lt!535179 lt!535182 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182453 (= lt!535188 (getCurrentListMapNoExtraKeys!5093 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535187 () Unit!38973)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!859 (array!76328 array!76330 (_ BitVec 32) (_ BitVec 32) V!44857 V!44857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38973)

(assert (=> b!1182453 (= lt!535187 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!859 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182454 () Bool)

(assert (=> b!1182454 (= e!672259 e!672258)))

(declare-fun res!785855 () Bool)

(assert (=> b!1182454 (=> res!785855 e!672258)))

(assert (=> b!1182454 (= res!785855 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1182454 (= lt!535184 (getCurrentListMapNoExtraKeys!5093 lt!535179 lt!535182 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1182454 (= lt!535182 (array!76331 (store (arr!36815 _values!996) i!673 (ValueCellFull!14189 lt!535175)) (size!37353 _values!996)))))

(declare-fun dynLambda!2999 (Int (_ BitVec 64)) V!44857)

(assert (=> b!1182454 (= lt!535175 (dynLambda!2999 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1182454 (= lt!535170 (getCurrentListMapNoExtraKeys!5093 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182455 () Bool)

(declare-fun res!785850 () Bool)

(assert (=> b!1182455 (=> (not res!785850) (not e!672264))))

(assert (=> b!1182455 (= res!785850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182456 () Bool)

(assert (=> b!1182456 (= e!672263 e!672261)))

(declare-fun res!785846 () Bool)

(assert (=> b!1182456 (=> res!785846 e!672261)))

(assert (=> b!1182456 (= res!785846 (not (= (select (arr!36814 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182457 () Bool)

(declare-fun res!785854 () Bool)

(assert (=> b!1182457 (=> (not res!785854) (not e!672264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182457 (= res!785854 (validMask!0 mask!1564))))

(declare-fun b!1182458 () Bool)

(declare-fun res!785845 () Bool)

(assert (=> b!1182458 (=> (not res!785845) (not e!672264))))

(assert (=> b!1182458 (= res!785845 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25980))))

(assert (= (and start!99682 res!785844) b!1182457))

(assert (= (and b!1182457 res!785854) b!1182442))

(assert (= (and b!1182442 res!785852) b!1182455))

(assert (= (and b!1182455 res!785850) b!1182458))

(assert (= (and b!1182458 res!785845) b!1182447))

(assert (= (and b!1182447 res!785853) b!1182450))

(assert (= (and b!1182450 res!785849) b!1182444))

(assert (= (and b!1182444 res!785857) b!1182452))

(assert (= (and b!1182452 res!785847) b!1182445))

(assert (= (and b!1182445 res!785848) b!1182446))

(assert (= (and b!1182446 (not res!785851)) b!1182454))

(assert (= (and b!1182454 (not res!785855)) b!1182453))

(assert (= (and b!1182453 (not res!785843)) b!1182440))

(assert (= (and b!1182440 res!785856) b!1182456))

(assert (= (and b!1182456 (not res!785846)) b!1182439))

(assert (= (and b!1182440 c!116998) b!1182449))

(assert (= (and b!1182440 (not c!116998)) b!1182441))

(assert (= (and b!1182451 condMapEmpty!46523) mapIsEmpty!46523))

(assert (= (and b!1182451 (not condMapEmpty!46523)) mapNonEmpty!46523))

(get-info :version)

(assert (= (and mapNonEmpty!46523 ((_ is ValueCellFull!14189) mapValue!46523)) b!1182448))

(assert (= (and b!1182451 ((_ is ValueCellFull!14189) mapDefault!46523)) b!1182443))

(assert (= start!99682 b!1182451))

(declare-fun b_lambda!20393 () Bool)

(assert (=> (not b_lambda!20393) (not b!1182454)))

(declare-fun t!38231 () Bool)

(declare-fun tb!10071 () Bool)

(assert (=> (and start!99682 (= defaultEntry!1004 defaultEntry!1004) t!38231) tb!10071))

(declare-fun result!20717 () Bool)

(assert (=> tb!10071 (= result!20717 tp_is_empty!29797)))

(assert (=> b!1182454 t!38231))

(declare-fun b_and!41381 () Bool)

(assert (= b_and!41379 (and (=> t!38231 result!20717) b_and!41381)))

(declare-fun m!1089995 () Bool)

(assert (=> start!99682 m!1089995))

(declare-fun m!1089997 () Bool)

(assert (=> start!99682 m!1089997))

(declare-fun m!1089999 () Bool)

(assert (=> b!1182440 m!1089999))

(declare-fun m!1090001 () Bool)

(assert (=> b!1182440 m!1090001))

(declare-fun m!1090003 () Bool)

(assert (=> b!1182440 m!1090003))

(declare-fun m!1090005 () Bool)

(assert (=> b!1182440 m!1090005))

(declare-fun m!1090007 () Bool)

(assert (=> b!1182440 m!1090007))

(assert (=> b!1182440 m!1090003))

(declare-fun m!1090009 () Bool)

(assert (=> b!1182440 m!1090009))

(declare-fun m!1090011 () Bool)

(assert (=> b!1182440 m!1090011))

(assert (=> b!1182440 m!1089999))

(declare-fun m!1090013 () Bool)

(assert (=> b!1182452 m!1090013))

(declare-fun m!1090015 () Bool)

(assert (=> b!1182452 m!1090015))

(declare-fun m!1090017 () Bool)

(assert (=> mapNonEmpty!46523 m!1090017))

(assert (=> b!1182456 m!1089999))

(declare-fun m!1090019 () Bool)

(assert (=> b!1182449 m!1090019))

(declare-fun m!1090021 () Bool)

(assert (=> b!1182449 m!1090021))

(declare-fun m!1090023 () Bool)

(assert (=> b!1182449 m!1090023))

(declare-fun m!1090025 () Bool)

(assert (=> b!1182449 m!1090025))

(declare-fun m!1090027 () Bool)

(assert (=> b!1182449 m!1090027))

(declare-fun m!1090029 () Bool)

(assert (=> b!1182445 m!1090029))

(declare-fun m!1090031 () Bool)

(assert (=> b!1182446 m!1090031))

(declare-fun m!1090033 () Bool)

(assert (=> b!1182446 m!1090033))

(declare-fun m!1090035 () Bool)

(assert (=> b!1182455 m!1090035))

(declare-fun m!1090037 () Bool)

(assert (=> b!1182450 m!1090037))

(declare-fun m!1090039 () Bool)

(assert (=> b!1182444 m!1090039))

(declare-fun m!1090041 () Bool)

(assert (=> b!1182457 m!1090041))

(declare-fun m!1090043 () Bool)

(assert (=> b!1182454 m!1090043))

(declare-fun m!1090045 () Bool)

(assert (=> b!1182454 m!1090045))

(declare-fun m!1090047 () Bool)

(assert (=> b!1182454 m!1090047))

(declare-fun m!1090049 () Bool)

(assert (=> b!1182454 m!1090049))

(declare-fun m!1090051 () Bool)

(assert (=> b!1182458 m!1090051))

(declare-fun m!1090053 () Bool)

(assert (=> b!1182439 m!1090053))

(declare-fun m!1090055 () Bool)

(assert (=> b!1182453 m!1090055))

(declare-fun m!1090057 () Bool)

(assert (=> b!1182453 m!1090057))

(declare-fun m!1090059 () Bool)

(assert (=> b!1182453 m!1090059))

(assert (=> b!1182453 m!1089999))

(declare-fun m!1090061 () Bool)

(assert (=> b!1182453 m!1090061))

(declare-fun m!1090063 () Bool)

(assert (=> b!1182453 m!1090063))

(assert (=> b!1182453 m!1089999))

(check-sat (not b_lambda!20393) (not start!99682) (not b!1182449) b_and!41381 tp_is_empty!29797 (not b!1182450) (not b!1182457) (not b!1182453) (not b!1182439) (not b_next!25267) (not b!1182445) (not b!1182440) (not b!1182454) (not b!1182458) (not mapNonEmpty!46523) (not b!1182446) (not b!1182455) (not b!1182452))
(check-sat b_and!41381 (not b_next!25267))
