; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99594 () Bool)

(assert start!99594)

(declare-fun b_free!25173 () Bool)

(declare-fun b_next!25173 () Bool)

(assert (=> start!99594 (= b_free!25173 (not b_next!25173))))

(declare-fun tp!88233 () Bool)

(declare-fun b_and!41213 () Bool)

(assert (=> start!99594 (= tp!88233 b_and!41213)))

(declare-fun b!1179465 () Bool)

(declare-fun e!670556 () Bool)

(declare-fun tp_is_empty!29703 () Bool)

(assert (=> b!1179465 (= e!670556 tp_is_empty!29703)))

(declare-fun b!1179466 () Bool)

(declare-fun res!783617 () Bool)

(declare-fun e!670554 () Bool)

(assert (=> b!1179466 (=> (not res!783617) (not e!670554))))

(declare-datatypes ((array!76209 0))(
  ( (array!76210 (arr!36754 (Array (_ BitVec 32) (_ BitVec 64))) (size!37290 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76209)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1179466 (= res!783617 (= (select (arr!36754 _keys!1208) i!673) k0!934))))

(declare-fun b!1179467 () Bool)

(declare-datatypes ((Unit!38974 0))(
  ( (Unit!38975) )
))
(declare-fun e!670551 () Unit!38974)

(declare-fun Unit!38976 () Unit!38974)

(assert (=> b!1179467 (= e!670551 Unit!38976)))

(declare-fun b!1179468 () Bool)

(declare-fun e!670561 () Bool)

(declare-fun arrayContainsKey!0 (array!76209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179468 (= e!670561 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179469 () Bool)

(declare-fun e!670559 () Bool)

(declare-fun mapRes!46382 () Bool)

(assert (=> b!1179469 (= e!670559 (and e!670556 mapRes!46382))))

(declare-fun condMapEmpty!46382 () Bool)

(declare-datatypes ((V!44731 0))(
  ( (V!44732 (val!14908 Int)) )
))
(declare-datatypes ((ValueCell!14142 0))(
  ( (ValueCellFull!14142 (v!17546 V!44731)) (EmptyCell!14142) )
))
(declare-datatypes ((array!76211 0))(
  ( (array!76212 (arr!36755 (Array (_ BitVec 32) ValueCell!14142)) (size!37291 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76211)

(declare-fun mapDefault!46382 () ValueCell!14142)

(assert (=> b!1179469 (= condMapEmpty!46382 (= (arr!36755 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14142)) mapDefault!46382)))))

(declare-fun b!1179470 () Bool)

(declare-fun res!783611 () Bool)

(assert (=> b!1179470 (=> (not res!783611) (not e!670554))))

(assert (=> b!1179470 (= res!783611 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37290 _keys!1208))))))

(declare-fun mapIsEmpty!46382 () Bool)

(assert (=> mapIsEmpty!46382 mapRes!46382))

(declare-fun b!1179471 () Bool)

(declare-fun e!670558 () Bool)

(assert (=> b!1179471 (= e!670558 tp_is_empty!29703)))

(declare-fun b!1179472 () Bool)

(declare-fun Unit!38977 () Unit!38974)

(assert (=> b!1179472 (= e!670551 Unit!38977)))

(declare-fun lt!533068 () Unit!38974)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76209 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38974)

(assert (=> b!1179472 (= lt!533068 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179472 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533066 () Unit!38974)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76209 (_ BitVec 32) (_ BitVec 32)) Unit!38974)

(assert (=> b!1179472 (= lt!533066 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25821 0))(
  ( (Nil!25818) (Cons!25817 (h!27026 (_ BitVec 64)) (t!37986 List!25821)) )
))
(declare-fun arrayNoDuplicates!0 (array!76209 (_ BitVec 32) List!25821) Bool)

(assert (=> b!1179472 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25818)))

(declare-fun lt!533063 () Unit!38974)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76209 (_ BitVec 64) (_ BitVec 32) List!25821) Unit!38974)

(assert (=> b!1179472 (= lt!533063 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25818))))

(assert (=> b!1179472 false))

(declare-fun b!1179474 () Bool)

(declare-fun e!670549 () Bool)

(assert (=> b!1179474 (= e!670549 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37290 _keys!1208))))))

(declare-fun e!670553 () Bool)

(assert (=> b!1179474 e!670553))

(declare-fun res!783616 () Bool)

(assert (=> b!1179474 (=> (not res!783616) (not e!670553))))

(assert (=> b!1179474 (= res!783616 (not (= (select (arr!36754 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533070 () Unit!38974)

(assert (=> b!1179474 (= lt!533070 e!670551)))

(declare-fun c!116883 () Bool)

(assert (=> b!1179474 (= c!116883 (= (select (arr!36754 _keys!1208) from!1455) k0!934))))

(declare-fun e!670552 () Bool)

(assert (=> b!1179474 e!670552))

(declare-fun res!783615 () Bool)

(assert (=> b!1179474 (=> (not res!783615) (not e!670552))))

(declare-datatypes ((tuple2!19084 0))(
  ( (tuple2!19085 (_1!9553 (_ BitVec 64)) (_2!9553 V!44731)) )
))
(declare-datatypes ((List!25822 0))(
  ( (Nil!25819) (Cons!25818 (h!27027 tuple2!19084) (t!37987 List!25822)) )
))
(declare-datatypes ((ListLongMap!17053 0))(
  ( (ListLongMap!17054 (toList!8542 List!25822)) )
))
(declare-fun lt!533064 () ListLongMap!17053)

(declare-fun lt!533071 () ListLongMap!17053)

(declare-fun lt!533072 () tuple2!19084)

(declare-fun +!3854 (ListLongMap!17053 tuple2!19084) ListLongMap!17053)

(assert (=> b!1179474 (= res!783615 (= lt!533064 (+!3854 lt!533071 lt!533072)))))

(declare-fun lt!533069 () V!44731)

(declare-fun get!18790 (ValueCell!14142 V!44731) V!44731)

(assert (=> b!1179474 (= lt!533072 (tuple2!19085 (select (arr!36754 _keys!1208) from!1455) (get!18790 (select (arr!36755 _values!996) from!1455) lt!533069)))))

(declare-fun b!1179475 () Bool)

(declare-fun res!783622 () Bool)

(declare-fun e!670555 () Bool)

(assert (=> b!1179475 (=> (not res!783622) (not e!670555))))

(declare-fun lt!533060 () array!76209)

(assert (=> b!1179475 (= res!783622 (arrayNoDuplicates!0 lt!533060 #b00000000000000000000000000000000 Nil!25818))))

(declare-fun b!1179476 () Bool)

(declare-fun res!783614 () Bool)

(assert (=> b!1179476 (=> (not res!783614) (not e!670554))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1179476 (= res!783614 (and (= (size!37291 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37290 _keys!1208) (size!37291 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179477 () Bool)

(declare-fun res!783620 () Bool)

(assert (=> b!1179477 (=> (not res!783620) (not e!670554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179477 (= res!783620 (validMask!0 mask!1564))))

(declare-fun b!1179478 () Bool)

(declare-fun e!670560 () Bool)

(assert (=> b!1179478 (= e!670560 e!670549)))

(declare-fun res!783619 () Bool)

(assert (=> b!1179478 (=> res!783619 e!670549)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179478 (= res!783619 (not (validKeyInArray!0 (select (arr!36754 _keys!1208) from!1455))))))

(declare-fun lt!533065 () ListLongMap!17053)

(assert (=> b!1179478 (= lt!533065 lt!533071)))

(declare-fun lt!533073 () ListLongMap!17053)

(declare-fun -!1585 (ListLongMap!17053 (_ BitVec 64)) ListLongMap!17053)

(assert (=> b!1179478 (= lt!533071 (-!1585 lt!533073 k0!934))))

(declare-fun minValue!944 () V!44731)

(declare-fun zeroValue!944 () V!44731)

(declare-fun lt!533062 () array!76211)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4997 (array!76209 array!76211 (_ BitVec 32) (_ BitVec 32) V!44731 V!44731 (_ BitVec 32) Int) ListLongMap!17053)

(assert (=> b!1179478 (= lt!533065 (getCurrentListMapNoExtraKeys!4997 lt!533060 lt!533062 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179478 (= lt!533073 (getCurrentListMapNoExtraKeys!4997 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533061 () Unit!38974)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!812 (array!76209 array!76211 (_ BitVec 32) (_ BitVec 32) V!44731 V!44731 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38974)

(assert (=> b!1179478 (= lt!533061 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!812 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46382 () Bool)

(declare-fun tp!88232 () Bool)

(assert (=> mapNonEmpty!46382 (= mapRes!46382 (and tp!88232 e!670558))))

(declare-fun mapRest!46382 () (Array (_ BitVec 32) ValueCell!14142))

(declare-fun mapValue!46382 () ValueCell!14142)

(declare-fun mapKey!46382 () (_ BitVec 32))

(assert (=> mapNonEmpty!46382 (= (arr!36755 _values!996) (store mapRest!46382 mapKey!46382 mapValue!46382))))

(declare-fun b!1179479 () Bool)

(assert (=> b!1179479 (= e!670552 e!670561)))

(declare-fun res!783612 () Bool)

(assert (=> b!1179479 (=> res!783612 e!670561)))

(assert (=> b!1179479 (= res!783612 (not (= (select (arr!36754 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179480 () Bool)

(declare-fun e!670550 () Bool)

(assert (=> b!1179480 (= e!670555 (not e!670550))))

(declare-fun res!783621 () Bool)

(assert (=> b!1179480 (=> res!783621 e!670550)))

(assert (=> b!1179480 (= res!783621 (bvsgt from!1455 i!673))))

(assert (=> b!1179480 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533059 () Unit!38974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76209 (_ BitVec 64) (_ BitVec 32)) Unit!38974)

(assert (=> b!1179480 (= lt!533059 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179481 () Bool)

(declare-fun res!783625 () Bool)

(assert (=> b!1179481 (=> (not res!783625) (not e!670554))))

(assert (=> b!1179481 (= res!783625 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25818))))

(declare-fun b!1179482 () Bool)

(assert (=> b!1179482 (= e!670550 e!670560)))

(declare-fun res!783624 () Bool)

(assert (=> b!1179482 (=> res!783624 e!670560)))

(assert (=> b!1179482 (= res!783624 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1179482 (= lt!533064 (getCurrentListMapNoExtraKeys!4997 lt!533060 lt!533062 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179482 (= lt!533062 (array!76212 (store (arr!36755 _values!996) i!673 (ValueCellFull!14142 lt!533069)) (size!37291 _values!996)))))

(declare-fun dynLambda!2957 (Int (_ BitVec 64)) V!44731)

(assert (=> b!1179482 (= lt!533069 (dynLambda!2957 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533067 () ListLongMap!17053)

(assert (=> b!1179482 (= lt!533067 (getCurrentListMapNoExtraKeys!4997 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179483 () Bool)

(declare-fun res!783610 () Bool)

(assert (=> b!1179483 (=> (not res!783610) (not e!670554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76209 (_ BitVec 32)) Bool)

(assert (=> b!1179483 (= res!783610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179484 () Bool)

(declare-fun res!783613 () Bool)

(assert (=> b!1179484 (=> (not res!783613) (not e!670554))))

(assert (=> b!1179484 (= res!783613 (validKeyInArray!0 k0!934))))

(declare-fun b!1179485 () Bool)

(assert (=> b!1179485 (= e!670554 e!670555)))

(declare-fun res!783623 () Bool)

(assert (=> b!1179485 (=> (not res!783623) (not e!670555))))

(assert (=> b!1179485 (= res!783623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533060 mask!1564))))

(assert (=> b!1179485 (= lt!533060 (array!76210 (store (arr!36754 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37290 _keys!1208)))))

(declare-fun b!1179473 () Bool)

(assert (=> b!1179473 (= e!670553 (= lt!533067 (+!3854 lt!533073 lt!533072)))))

(declare-fun res!783618 () Bool)

(assert (=> start!99594 (=> (not res!783618) (not e!670554))))

(assert (=> start!99594 (= res!783618 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37290 _keys!1208))))))

(assert (=> start!99594 e!670554))

(assert (=> start!99594 tp_is_empty!29703))

(declare-fun array_inv!28062 (array!76209) Bool)

(assert (=> start!99594 (array_inv!28062 _keys!1208)))

(assert (=> start!99594 true))

(assert (=> start!99594 tp!88233))

(declare-fun array_inv!28063 (array!76211) Bool)

(assert (=> start!99594 (and (array_inv!28063 _values!996) e!670559)))

(assert (= (and start!99594 res!783618) b!1179477))

(assert (= (and b!1179477 res!783620) b!1179476))

(assert (= (and b!1179476 res!783614) b!1179483))

(assert (= (and b!1179483 res!783610) b!1179481))

(assert (= (and b!1179481 res!783625) b!1179470))

(assert (= (and b!1179470 res!783611) b!1179484))

(assert (= (and b!1179484 res!783613) b!1179466))

(assert (= (and b!1179466 res!783617) b!1179485))

(assert (= (and b!1179485 res!783623) b!1179475))

(assert (= (and b!1179475 res!783622) b!1179480))

(assert (= (and b!1179480 (not res!783621)) b!1179482))

(assert (= (and b!1179482 (not res!783624)) b!1179478))

(assert (= (and b!1179478 (not res!783619)) b!1179474))

(assert (= (and b!1179474 res!783615) b!1179479))

(assert (= (and b!1179479 (not res!783612)) b!1179468))

(assert (= (and b!1179474 c!116883) b!1179472))

(assert (= (and b!1179474 (not c!116883)) b!1179467))

(assert (= (and b!1179474 res!783616) b!1179473))

(assert (= (and b!1179469 condMapEmpty!46382) mapIsEmpty!46382))

(assert (= (and b!1179469 (not condMapEmpty!46382)) mapNonEmpty!46382))

(get-info :version)

(assert (= (and mapNonEmpty!46382 ((_ is ValueCellFull!14142) mapValue!46382)) b!1179471))

(assert (= (and b!1179469 ((_ is ValueCellFull!14142) mapDefault!46382)) b!1179465))

(assert (= start!99594 b!1179469))

(declare-fun b_lambda!20317 () Bool)

(assert (=> (not b_lambda!20317) (not b!1179482)))

(declare-fun t!37985 () Bool)

(declare-fun tb!9985 () Bool)

(assert (=> (and start!99594 (= defaultEntry!1004 defaultEntry!1004) t!37985) tb!9985))

(declare-fun result!20537 () Bool)

(assert (=> tb!9985 (= result!20537 tp_is_empty!29703)))

(assert (=> b!1179482 t!37985))

(declare-fun b_and!41215 () Bool)

(assert (= b_and!41213 (and (=> t!37985 result!20537) b_and!41215)))

(declare-fun m!1087443 () Bool)

(assert (=> start!99594 m!1087443))

(declare-fun m!1087445 () Bool)

(assert (=> start!99594 m!1087445))

(declare-fun m!1087447 () Bool)

(assert (=> b!1179484 m!1087447))

(declare-fun m!1087449 () Bool)

(assert (=> b!1179468 m!1087449))

(declare-fun m!1087451 () Bool)

(assert (=> b!1179466 m!1087451))

(declare-fun m!1087453 () Bool)

(assert (=> b!1179480 m!1087453))

(declare-fun m!1087455 () Bool)

(assert (=> b!1179480 m!1087455))

(declare-fun m!1087457 () Bool)

(assert (=> mapNonEmpty!46382 m!1087457))

(declare-fun m!1087459 () Bool)

(assert (=> b!1179478 m!1087459))

(declare-fun m!1087461 () Bool)

(assert (=> b!1179478 m!1087461))

(declare-fun m!1087463 () Bool)

(assert (=> b!1179478 m!1087463))

(declare-fun m!1087465 () Bool)

(assert (=> b!1179478 m!1087465))

(declare-fun m!1087467 () Bool)

(assert (=> b!1179478 m!1087467))

(declare-fun m!1087469 () Bool)

(assert (=> b!1179478 m!1087469))

(assert (=> b!1179478 m!1087467))

(declare-fun m!1087471 () Bool)

(assert (=> b!1179482 m!1087471))

(declare-fun m!1087473 () Bool)

(assert (=> b!1179482 m!1087473))

(declare-fun m!1087475 () Bool)

(assert (=> b!1179482 m!1087475))

(declare-fun m!1087477 () Bool)

(assert (=> b!1179482 m!1087477))

(assert (=> b!1179474 m!1087467))

(declare-fun m!1087479 () Bool)

(assert (=> b!1179474 m!1087479))

(declare-fun m!1087481 () Bool)

(assert (=> b!1179474 m!1087481))

(assert (=> b!1179474 m!1087481))

(declare-fun m!1087483 () Bool)

(assert (=> b!1179474 m!1087483))

(declare-fun m!1087485 () Bool)

(assert (=> b!1179483 m!1087485))

(declare-fun m!1087487 () Bool)

(assert (=> b!1179473 m!1087487))

(declare-fun m!1087489 () Bool)

(assert (=> b!1179472 m!1087489))

(declare-fun m!1087491 () Bool)

(assert (=> b!1179472 m!1087491))

(declare-fun m!1087493 () Bool)

(assert (=> b!1179472 m!1087493))

(declare-fun m!1087495 () Bool)

(assert (=> b!1179472 m!1087495))

(declare-fun m!1087497 () Bool)

(assert (=> b!1179472 m!1087497))

(declare-fun m!1087499 () Bool)

(assert (=> b!1179475 m!1087499))

(declare-fun m!1087501 () Bool)

(assert (=> b!1179481 m!1087501))

(declare-fun m!1087503 () Bool)

(assert (=> b!1179477 m!1087503))

(declare-fun m!1087505 () Bool)

(assert (=> b!1179485 m!1087505))

(declare-fun m!1087507 () Bool)

(assert (=> b!1179485 m!1087507))

(assert (=> b!1179479 m!1087467))

(check-sat (not b!1179478) (not b!1179480) (not b!1179482) (not b!1179484) (not b!1179481) (not b!1179485) (not mapNonEmpty!46382) (not start!99594) b_and!41215 (not b!1179472) tp_is_empty!29703 (not b!1179483) (not b_next!25173) (not b_lambda!20317) (not b!1179473) (not b!1179477) (not b!1179475) (not b!1179474) (not b!1179468))
(check-sat b_and!41215 (not b_next!25173))
