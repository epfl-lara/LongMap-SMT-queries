; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99684 () Bool)

(assert start!99684)

(declare-fun b_free!25263 () Bool)

(declare-fun b_next!25263 () Bool)

(assert (=> start!99684 (= b_free!25263 (not b_next!25263))))

(declare-fun tp!88502 () Bool)

(declare-fun b_and!41393 () Bool)

(assert (=> start!99684 (= tp!88502 b_and!41393)))

(declare-fun b!1182439 () Bool)

(declare-fun res!785833 () Bool)

(declare-fun e!672273 () Bool)

(assert (=> b!1182439 (=> (not res!785833) (not e!672273))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182439 (= res!785833 (validMask!0 mask!1564))))

(declare-fun b!1182440 () Bool)

(declare-fun e!672266 () Bool)

(declare-fun tp_is_empty!29793 () Bool)

(assert (=> b!1182440 (= e!672266 tp_is_empty!29793)))

(declare-fun b!1182441 () Bool)

(declare-fun res!785827 () Bool)

(assert (=> b!1182441 (=> (not res!785827) (not e!672273))))

(declare-datatypes ((array!76389 0))(
  ( (array!76390 (arr!36844 (Array (_ BitVec 32) (_ BitVec 64))) (size!37380 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76389)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1182441 (= res!785827 (= (select (arr!36844 _keys!1208) i!673) k0!934))))

(declare-fun b!1182442 () Bool)

(declare-fun e!672265 () Bool)

(assert (=> b!1182442 (= e!672265 tp_is_empty!29793)))

(declare-fun b!1182443 () Bool)

(declare-fun e!672263 () Bool)

(declare-fun arrayContainsKey!0 (array!76389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182443 (= e!672263 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182445 () Bool)

(declare-fun res!785824 () Bool)

(assert (=> b!1182445 (=> (not res!785824) (not e!672273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76389 (_ BitVec 32)) Bool)

(assert (=> b!1182445 (= res!785824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182446 () Bool)

(declare-datatypes ((Unit!39121 0))(
  ( (Unit!39122) )
))
(declare-fun e!672268 () Unit!39121)

(declare-fun Unit!39123 () Unit!39121)

(assert (=> b!1182446 (= e!672268 Unit!39123)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!535263 () Unit!39121)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76389 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39121)

(assert (=> b!1182446 (= lt!535263 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182446 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535254 () Unit!39121)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76389 (_ BitVec 32) (_ BitVec 32)) Unit!39121)

(assert (=> b!1182446 (= lt!535254 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25905 0))(
  ( (Nil!25902) (Cons!25901 (h!27110 (_ BitVec 64)) (t!38160 List!25905)) )
))
(declare-fun arrayNoDuplicates!0 (array!76389 (_ BitVec 32) List!25905) Bool)

(assert (=> b!1182446 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25902)))

(declare-fun lt!535251 () Unit!39121)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76389 (_ BitVec 64) (_ BitVec 32) List!25905) Unit!39121)

(assert (=> b!1182446 (= lt!535251 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25902))))

(assert (=> b!1182446 false))

(declare-fun b!1182447 () Bool)

(declare-fun e!672270 () Bool)

(assert (=> b!1182447 (= e!672270 true)))

(declare-datatypes ((V!44851 0))(
  ( (V!44852 (val!14953 Int)) )
))
(declare-datatypes ((tuple2!19164 0))(
  ( (tuple2!19165 (_1!9593 (_ BitVec 64)) (_2!9593 V!44851)) )
))
(declare-datatypes ((List!25906 0))(
  ( (Nil!25903) (Cons!25902 (h!27111 tuple2!19164) (t!38161 List!25906)) )
))
(declare-datatypes ((ListLongMap!17133 0))(
  ( (ListLongMap!17134 (toList!8582 List!25906)) )
))
(declare-fun lt!535253 () ListLongMap!17133)

(declare-fun lt!535260 () ListLongMap!17133)

(declare-fun -!1620 (ListLongMap!17133 (_ BitVec 64)) ListLongMap!17133)

(assert (=> b!1182447 (= (-!1620 lt!535253 k0!934) lt!535260)))

(declare-fun lt!535257 () V!44851)

(declare-fun lt!535259 () ListLongMap!17133)

(declare-fun lt!535250 () Unit!39121)

(declare-fun addRemoveCommutativeForDiffKeys!149 (ListLongMap!17133 (_ BitVec 64) V!44851 (_ BitVec 64)) Unit!39121)

(assert (=> b!1182447 (= lt!535250 (addRemoveCommutativeForDiffKeys!149 lt!535259 (select (arr!36844 _keys!1208) from!1455) lt!535257 k0!934))))

(declare-fun lt!535248 () ListLongMap!17133)

(declare-fun lt!535261 () ListLongMap!17133)

(declare-fun lt!535262 () ListLongMap!17133)

(assert (=> b!1182447 (and (= lt!535262 lt!535253) (= lt!535248 lt!535261))))

(declare-fun lt!535252 () tuple2!19164)

(declare-fun +!3886 (ListLongMap!17133 tuple2!19164) ListLongMap!17133)

(assert (=> b!1182447 (= lt!535253 (+!3886 lt!535259 lt!535252))))

(assert (=> b!1182447 (not (= (select (arr!36844 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535255 () Unit!39121)

(assert (=> b!1182447 (= lt!535255 e!672268)))

(declare-fun c!117018 () Bool)

(assert (=> b!1182447 (= c!117018 (= (select (arr!36844 _keys!1208) from!1455) k0!934))))

(declare-fun e!672267 () Bool)

(assert (=> b!1182447 e!672267))

(declare-fun res!785831 () Bool)

(assert (=> b!1182447 (=> (not res!785831) (not e!672267))))

(declare-fun lt!535256 () ListLongMap!17133)

(assert (=> b!1182447 (= res!785831 (= lt!535256 lt!535260))))

(assert (=> b!1182447 (= lt!535260 (+!3886 lt!535248 lt!535252))))

(assert (=> b!1182447 (= lt!535252 (tuple2!19165 (select (arr!36844 _keys!1208) from!1455) lt!535257))))

(declare-fun lt!535258 () V!44851)

(declare-datatypes ((ValueCell!14187 0))(
  ( (ValueCellFull!14187 (v!17591 V!44851)) (EmptyCell!14187) )
))
(declare-datatypes ((array!76391 0))(
  ( (array!76392 (arr!36845 (Array (_ BitVec 32) ValueCell!14187)) (size!37381 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76391)

(declare-fun get!18847 (ValueCell!14187 V!44851) V!44851)

(assert (=> b!1182447 (= lt!535257 (get!18847 (select (arr!36845 _values!996) from!1455) lt!535258))))

(declare-fun b!1182448 () Bool)

(declare-fun e!672264 () Bool)

(declare-fun mapRes!46517 () Bool)

(assert (=> b!1182448 (= e!672264 (and e!672266 mapRes!46517))))

(declare-fun condMapEmpty!46517 () Bool)

(declare-fun mapDefault!46517 () ValueCell!14187)

(assert (=> b!1182448 (= condMapEmpty!46517 (= (arr!36845 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14187)) mapDefault!46517)))))

(declare-fun b!1182449 () Bool)

(declare-fun e!672271 () Bool)

(declare-fun e!672272 () Bool)

(assert (=> b!1182449 (= e!672271 (not e!672272))))

(declare-fun res!785830 () Bool)

(assert (=> b!1182449 (=> res!785830 e!672272)))

(assert (=> b!1182449 (= res!785830 (bvsgt from!1455 i!673))))

(assert (=> b!1182449 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535266 () Unit!39121)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76389 (_ BitVec 64) (_ BitVec 32)) Unit!39121)

(assert (=> b!1182449 (= lt!535266 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46517 () Bool)

(declare-fun tp!88503 () Bool)

(assert (=> mapNonEmpty!46517 (= mapRes!46517 (and tp!88503 e!672265))))

(declare-fun mapRest!46517 () (Array (_ BitVec 32) ValueCell!14187))

(declare-fun mapKey!46517 () (_ BitVec 32))

(declare-fun mapValue!46517 () ValueCell!14187)

(assert (=> mapNonEmpty!46517 (= (arr!36845 _values!996) (store mapRest!46517 mapKey!46517 mapValue!46517))))

(declare-fun b!1182450 () Bool)

(declare-fun Unit!39124 () Unit!39121)

(assert (=> b!1182450 (= e!672268 Unit!39124)))

(declare-fun b!1182451 () Bool)

(declare-fun res!785826 () Bool)

(assert (=> b!1182451 (=> (not res!785826) (not e!672273))))

(assert (=> b!1182451 (= res!785826 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37380 _keys!1208))))))

(declare-fun b!1182452 () Bool)

(declare-fun res!785825 () Bool)

(assert (=> b!1182452 (=> (not res!785825) (not e!672271))))

(declare-fun lt!535249 () array!76389)

(assert (=> b!1182452 (= res!785825 (arrayNoDuplicates!0 lt!535249 #b00000000000000000000000000000000 Nil!25902))))

(declare-fun b!1182453 () Bool)

(declare-fun res!785819 () Bool)

(assert (=> b!1182453 (=> (not res!785819) (not e!672273))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1182453 (= res!785819 (and (= (size!37381 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37380 _keys!1208) (size!37381 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46517 () Bool)

(assert (=> mapIsEmpty!46517 mapRes!46517))

(declare-fun b!1182454 () Bool)

(declare-fun e!672269 () Bool)

(assert (=> b!1182454 (= e!672269 e!672270)))

(declare-fun res!785832 () Bool)

(assert (=> b!1182454 (=> res!785832 e!672270)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182454 (= res!785832 (not (validKeyInArray!0 (select (arr!36844 _keys!1208) from!1455))))))

(assert (=> b!1182454 (= lt!535261 lt!535248)))

(assert (=> b!1182454 (= lt!535248 (-!1620 lt!535259 k0!934))))

(declare-fun zeroValue!944 () V!44851)

(declare-fun minValue!944 () V!44851)

(declare-fun lt!535264 () array!76391)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5033 (array!76389 array!76391 (_ BitVec 32) (_ BitVec 32) V!44851 V!44851 (_ BitVec 32) Int) ListLongMap!17133)

(assert (=> b!1182454 (= lt!535261 (getCurrentListMapNoExtraKeys!5033 lt!535249 lt!535264 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182454 (= lt!535259 (getCurrentListMapNoExtraKeys!5033 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535265 () Unit!39121)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!843 (array!76389 array!76391 (_ BitVec 32) (_ BitVec 32) V!44851 V!44851 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39121)

(assert (=> b!1182454 (= lt!535265 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!843 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182455 () Bool)

(assert (=> b!1182455 (= e!672272 e!672269)))

(declare-fun res!785823 () Bool)

(assert (=> b!1182455 (=> res!785823 e!672269)))

(assert (=> b!1182455 (= res!785823 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1182455 (= lt!535256 (getCurrentListMapNoExtraKeys!5033 lt!535249 lt!535264 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1182455 (= lt!535264 (array!76392 (store (arr!36845 _values!996) i!673 (ValueCellFull!14187 lt!535258)) (size!37381 _values!996)))))

(declare-fun dynLambda!2988 (Int (_ BitVec 64)) V!44851)

(assert (=> b!1182455 (= lt!535258 (dynLambda!2988 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1182455 (= lt!535262 (getCurrentListMapNoExtraKeys!5033 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182456 () Bool)

(assert (=> b!1182456 (= e!672273 e!672271)))

(declare-fun res!785829 () Bool)

(assert (=> b!1182456 (=> (not res!785829) (not e!672271))))

(assert (=> b!1182456 (= res!785829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535249 mask!1564))))

(assert (=> b!1182456 (= lt!535249 (array!76390 (store (arr!36844 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37380 _keys!1208)))))

(declare-fun b!1182457 () Bool)

(assert (=> b!1182457 (= e!672267 e!672263)))

(declare-fun res!785820 () Bool)

(assert (=> b!1182457 (=> res!785820 e!672263)))

(assert (=> b!1182457 (= res!785820 (not (= (select (arr!36844 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182458 () Bool)

(declare-fun res!785822 () Bool)

(assert (=> b!1182458 (=> (not res!785822) (not e!672273))))

(assert (=> b!1182458 (= res!785822 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25902))))

(declare-fun b!1182444 () Bool)

(declare-fun res!785821 () Bool)

(assert (=> b!1182444 (=> (not res!785821) (not e!672273))))

(assert (=> b!1182444 (= res!785821 (validKeyInArray!0 k0!934))))

(declare-fun res!785828 () Bool)

(assert (=> start!99684 (=> (not res!785828) (not e!672273))))

(assert (=> start!99684 (= res!785828 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37380 _keys!1208))))))

(assert (=> start!99684 e!672273))

(assert (=> start!99684 tp_is_empty!29793))

(declare-fun array_inv!28132 (array!76389) Bool)

(assert (=> start!99684 (array_inv!28132 _keys!1208)))

(assert (=> start!99684 true))

(assert (=> start!99684 tp!88502))

(declare-fun array_inv!28133 (array!76391) Bool)

(assert (=> start!99684 (and (array_inv!28133 _values!996) e!672264)))

(assert (= (and start!99684 res!785828) b!1182439))

(assert (= (and b!1182439 res!785833) b!1182453))

(assert (= (and b!1182453 res!785819) b!1182445))

(assert (= (and b!1182445 res!785824) b!1182458))

(assert (= (and b!1182458 res!785822) b!1182451))

(assert (= (and b!1182451 res!785826) b!1182444))

(assert (= (and b!1182444 res!785821) b!1182441))

(assert (= (and b!1182441 res!785827) b!1182456))

(assert (= (and b!1182456 res!785829) b!1182452))

(assert (= (and b!1182452 res!785825) b!1182449))

(assert (= (and b!1182449 (not res!785830)) b!1182455))

(assert (= (and b!1182455 (not res!785823)) b!1182454))

(assert (= (and b!1182454 (not res!785832)) b!1182447))

(assert (= (and b!1182447 res!785831) b!1182457))

(assert (= (and b!1182457 (not res!785820)) b!1182443))

(assert (= (and b!1182447 c!117018) b!1182446))

(assert (= (and b!1182447 (not c!117018)) b!1182450))

(assert (= (and b!1182448 condMapEmpty!46517) mapIsEmpty!46517))

(assert (= (and b!1182448 (not condMapEmpty!46517)) mapNonEmpty!46517))

(get-info :version)

(assert (= (and mapNonEmpty!46517 ((_ is ValueCellFull!14187) mapValue!46517)) b!1182442))

(assert (= (and b!1182448 ((_ is ValueCellFull!14187) mapDefault!46517)) b!1182440))

(assert (= start!99684 b!1182448))

(declare-fun b_lambda!20407 () Bool)

(assert (=> (not b_lambda!20407) (not b!1182455)))

(declare-fun t!38159 () Bool)

(declare-fun tb!10075 () Bool)

(assert (=> (and start!99684 (= defaultEntry!1004 defaultEntry!1004) t!38159) tb!10075))

(declare-fun result!20717 () Bool)

(assert (=> tb!10075 (= result!20717 tp_is_empty!29793)))

(assert (=> b!1182455 t!38159))

(declare-fun b_and!41395 () Bool)

(assert (= b_and!41393 (and (=> t!38159 result!20717) b_and!41395)))

(declare-fun m!1090465 () Bool)

(assert (=> b!1182458 m!1090465))

(declare-fun m!1090467 () Bool)

(assert (=> b!1182454 m!1090467))

(declare-fun m!1090469 () Bool)

(assert (=> b!1182454 m!1090469))

(declare-fun m!1090471 () Bool)

(assert (=> b!1182454 m!1090471))

(declare-fun m!1090473 () Bool)

(assert (=> b!1182454 m!1090473))

(declare-fun m!1090475 () Bool)

(assert (=> b!1182454 m!1090475))

(declare-fun m!1090477 () Bool)

(assert (=> b!1182454 m!1090477))

(assert (=> b!1182454 m!1090475))

(declare-fun m!1090479 () Bool)

(assert (=> mapNonEmpty!46517 m!1090479))

(declare-fun m!1090481 () Bool)

(assert (=> b!1182456 m!1090481))

(declare-fun m!1090483 () Bool)

(assert (=> b!1182456 m!1090483))

(declare-fun m!1090485 () Bool)

(assert (=> b!1182443 m!1090485))

(declare-fun m!1090487 () Bool)

(assert (=> b!1182447 m!1090487))

(declare-fun m!1090489 () Bool)

(assert (=> b!1182447 m!1090489))

(declare-fun m!1090491 () Bool)

(assert (=> b!1182447 m!1090491))

(assert (=> b!1182447 m!1090475))

(declare-fun m!1090493 () Bool)

(assert (=> b!1182447 m!1090493))

(assert (=> b!1182447 m!1090475))

(declare-fun m!1090495 () Bool)

(assert (=> b!1182447 m!1090495))

(assert (=> b!1182447 m!1090489))

(declare-fun m!1090497 () Bool)

(assert (=> b!1182447 m!1090497))

(declare-fun m!1090499 () Bool)

(assert (=> b!1182444 m!1090499))

(declare-fun m!1090501 () Bool)

(assert (=> b!1182445 m!1090501))

(declare-fun m!1090503 () Bool)

(assert (=> b!1182446 m!1090503))

(declare-fun m!1090505 () Bool)

(assert (=> b!1182446 m!1090505))

(declare-fun m!1090507 () Bool)

(assert (=> b!1182446 m!1090507))

(declare-fun m!1090509 () Bool)

(assert (=> b!1182446 m!1090509))

(declare-fun m!1090511 () Bool)

(assert (=> b!1182446 m!1090511))

(assert (=> b!1182457 m!1090475))

(declare-fun m!1090513 () Bool)

(assert (=> b!1182439 m!1090513))

(declare-fun m!1090515 () Bool)

(assert (=> b!1182449 m!1090515))

(declare-fun m!1090517 () Bool)

(assert (=> b!1182449 m!1090517))

(declare-fun m!1090519 () Bool)

(assert (=> b!1182455 m!1090519))

(declare-fun m!1090521 () Bool)

(assert (=> b!1182455 m!1090521))

(declare-fun m!1090523 () Bool)

(assert (=> b!1182455 m!1090523))

(declare-fun m!1090525 () Bool)

(assert (=> b!1182455 m!1090525))

(declare-fun m!1090527 () Bool)

(assert (=> start!99684 m!1090527))

(declare-fun m!1090529 () Bool)

(assert (=> start!99684 m!1090529))

(declare-fun m!1090531 () Bool)

(assert (=> b!1182452 m!1090531))

(declare-fun m!1090533 () Bool)

(assert (=> b!1182441 m!1090533))

(check-sat (not b!1182458) (not b!1182444) (not b_next!25263) (not b!1182439) (not b!1182449) (not b!1182454) (not mapNonEmpty!46517) (not b!1182456) (not b!1182446) tp_is_empty!29793 (not b!1182447) (not b_lambda!20407) (not b!1182445) b_and!41395 (not b!1182452) (not start!99684) (not b!1182455) (not b!1182443))
(check-sat b_and!41395 (not b_next!25263))
