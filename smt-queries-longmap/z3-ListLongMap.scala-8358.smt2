; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101732 () Bool)

(assert start!101732)

(declare-fun b_free!26421 () Bool)

(declare-fun b_next!26421 () Bool)

(assert (=> start!101732 (= b_free!26421 (not b_next!26421))))

(declare-fun tp!92309 () Bool)

(declare-fun b_and!44103 () Bool)

(assert (=> start!101732 (= tp!92309 b_and!44103)))

(declare-fun e!695461 () Bool)

(declare-datatypes ((array!79033 0))(
  ( (array!79034 (arr!38143 (Array (_ BitVec 32) (_ BitVec 64))) (size!38679 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79033)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1224505 () Bool)

(declare-fun arrayContainsKey!0 (array!79033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224505 (= e!695461 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224506 () Bool)

(declare-fun e!695466 () Bool)

(declare-fun e!695473 () Bool)

(assert (=> b!1224506 (= e!695466 e!695473)))

(declare-fun res!813687 () Bool)

(assert (=> b!1224506 (=> res!813687 e!695473)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224506 (= res!813687 (not (validKeyInArray!0 (select (arr!38143 _keys!1208) from!1455))))))

(declare-datatypes ((V!46627 0))(
  ( (V!46628 (val!15619 Int)) )
))
(declare-datatypes ((tuple2!20128 0))(
  ( (tuple2!20129 (_1!10075 (_ BitVec 64)) (_2!10075 V!46627)) )
))
(declare-datatypes ((List!26928 0))(
  ( (Nil!26925) (Cons!26924 (h!28133 tuple2!20128) (t!40329 List!26928)) )
))
(declare-datatypes ((ListLongMap!18097 0))(
  ( (ListLongMap!18098 (toList!9064 List!26928)) )
))
(declare-fun lt!557569 () ListLongMap!18097)

(declare-fun lt!557565 () ListLongMap!18097)

(assert (=> b!1224506 (= lt!557569 lt!557565)))

(declare-fun lt!557567 () ListLongMap!18097)

(declare-fun -!1965 (ListLongMap!18097 (_ BitVec 64)) ListLongMap!18097)

(assert (=> b!1224506 (= lt!557565 (-!1965 lt!557567 k0!934))))

(declare-fun zeroValue!944 () V!46627)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14853 0))(
  ( (ValueCellFull!14853 (v!18281 V!46627)) (EmptyCell!14853) )
))
(declare-datatypes ((array!79035 0))(
  ( (array!79036 (arr!38144 (Array (_ BitVec 32) ValueCell!14853)) (size!38680 (_ BitVec 32))) )
))
(declare-fun lt!557575 () array!79035)

(declare-fun lt!557571 () array!79033)

(declare-fun minValue!944 () V!46627)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5485 (array!79033 array!79035 (_ BitVec 32) (_ BitVec 32) V!46627 V!46627 (_ BitVec 32) Int) ListLongMap!18097)

(assert (=> b!1224506 (= lt!557569 (getCurrentListMapNoExtraKeys!5485 lt!557571 lt!557575 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!79035)

(assert (=> b!1224506 (= lt!557567 (getCurrentListMapNoExtraKeys!5485 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40572 0))(
  ( (Unit!40573) )
))
(declare-fun lt!557562 () Unit!40572)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1172 (array!79033 array!79035 (_ BitVec 32) (_ BitVec 32) V!46627 V!46627 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40572)

(assert (=> b!1224506 (= lt!557562 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1172 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224507 () Bool)

(declare-fun res!813676 () Bool)

(declare-fun e!695472 () Bool)

(assert (=> b!1224507 (=> (not res!813676) (not e!695472))))

(assert (=> b!1224507 (= res!813676 (validKeyInArray!0 k0!934))))

(declare-fun b!1224508 () Bool)

(declare-fun e!695470 () Bool)

(declare-fun tp_is_empty!31125 () Bool)

(assert (=> b!1224508 (= e!695470 tp_is_empty!31125)))

(declare-fun b!1224509 () Bool)

(declare-fun res!813682 () Bool)

(assert (=> b!1224509 (=> (not res!813682) (not e!695472))))

(assert (=> b!1224509 (= res!813682 (= (select (arr!38143 _keys!1208) i!673) k0!934))))

(declare-fun b!1224510 () Bool)

(declare-fun res!813680 () Bool)

(declare-fun e!695471 () Bool)

(assert (=> b!1224510 (=> (not res!813680) (not e!695471))))

(declare-fun lt!557566 () tuple2!20128)

(declare-fun lt!557564 () ListLongMap!18097)

(declare-fun +!4121 (ListLongMap!18097 tuple2!20128) ListLongMap!18097)

(assert (=> b!1224510 (= res!813680 (= lt!557564 (+!4121 lt!557567 lt!557566)))))

(declare-fun b!1224511 () Bool)

(declare-fun res!813683 () Bool)

(declare-fun e!695467 () Bool)

(assert (=> b!1224511 (=> (not res!813683) (not e!695467))))

(declare-datatypes ((List!26929 0))(
  ( (Nil!26926) (Cons!26925 (h!28134 (_ BitVec 64)) (t!40330 List!26929)) )
))
(declare-fun arrayNoDuplicates!0 (array!79033 (_ BitVec 32) List!26929) Bool)

(assert (=> b!1224511 (= res!813683 (arrayNoDuplicates!0 lt!557571 #b00000000000000000000000000000000 Nil!26926))))

(declare-fun b!1224512 () Bool)

(assert (=> b!1224512 (= e!695472 e!695467)))

(declare-fun res!813681 () Bool)

(assert (=> b!1224512 (=> (not res!813681) (not e!695467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79033 (_ BitVec 32)) Bool)

(assert (=> b!1224512 (= res!813681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557571 mask!1564))))

(assert (=> b!1224512 (= lt!557571 (array!79034 (store (arr!38143 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38679 _keys!1208)))))

(declare-fun b!1224513 () Bool)

(declare-fun res!813678 () Bool)

(assert (=> b!1224513 (=> (not res!813678) (not e!695472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224513 (= res!813678 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!48586 () Bool)

(declare-fun mapRes!48586 () Bool)

(assert (=> mapIsEmpty!48586 mapRes!48586))

(declare-fun mapNonEmpty!48586 () Bool)

(declare-fun tp!92308 () Bool)

(assert (=> mapNonEmpty!48586 (= mapRes!48586 (and tp!92308 e!695470))))

(declare-fun mapKey!48586 () (_ BitVec 32))

(declare-fun mapRest!48586 () (Array (_ BitVec 32) ValueCell!14853))

(declare-fun mapValue!48586 () ValueCell!14853)

(assert (=> mapNonEmpty!48586 (= (arr!38144 _values!996) (store mapRest!48586 mapKey!48586 mapValue!48586))))

(declare-fun b!1224514 () Bool)

(declare-fun e!695464 () Bool)

(assert (=> b!1224514 (= e!695467 (not e!695464))))

(declare-fun res!813675 () Bool)

(assert (=> b!1224514 (=> res!813675 e!695464)))

(assert (=> b!1224514 (= res!813675 (bvsgt from!1455 i!673))))

(assert (=> b!1224514 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557568 () Unit!40572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79033 (_ BitVec 64) (_ BitVec 32)) Unit!40572)

(assert (=> b!1224514 (= lt!557568 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224515 () Bool)

(declare-fun res!813686 () Bool)

(assert (=> b!1224515 (=> (not res!813686) (not e!695472))))

(assert (=> b!1224515 (= res!813686 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26926))))

(declare-fun res!813685 () Bool)

(assert (=> start!101732 (=> (not res!813685) (not e!695472))))

(assert (=> start!101732 (= res!813685 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38679 _keys!1208))))))

(assert (=> start!101732 e!695472))

(assert (=> start!101732 tp_is_empty!31125))

(declare-fun array_inv!29014 (array!79033) Bool)

(assert (=> start!101732 (array_inv!29014 _keys!1208)))

(assert (=> start!101732 true))

(assert (=> start!101732 tp!92309))

(declare-fun e!695462 () Bool)

(declare-fun array_inv!29015 (array!79035) Bool)

(assert (=> start!101732 (and (array_inv!29015 _values!996) e!695462)))

(declare-fun b!1224516 () Bool)

(declare-fun e!695468 () Bool)

(assert (=> b!1224516 (= e!695468 e!695461)))

(declare-fun res!813684 () Bool)

(assert (=> b!1224516 (=> res!813684 e!695461)))

(assert (=> b!1224516 (= res!813684 (not (= (select (arr!38143 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224517 () Bool)

(declare-fun e!695465 () Unit!40572)

(declare-fun Unit!40574 () Unit!40572)

(assert (=> b!1224517 (= e!695465 Unit!40574)))

(declare-fun b!1224518 () Bool)

(declare-fun e!695463 () Bool)

(assert (=> b!1224518 (= e!695463 tp_is_empty!31125)))

(declare-fun b!1224519 () Bool)

(assert (=> b!1224519 (= e!695473 true)))

(assert (=> b!1224519 e!695471))

(declare-fun res!813679 () Bool)

(assert (=> b!1224519 (=> (not res!813679) (not e!695471))))

(assert (=> b!1224519 (= res!813679 (not (= (select (arr!38143 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557576 () Unit!40572)

(assert (=> b!1224519 (= lt!557576 e!695465)))

(declare-fun c!120452 () Bool)

(assert (=> b!1224519 (= c!120452 (= (select (arr!38143 _keys!1208) from!1455) k0!934))))

(assert (=> b!1224519 e!695468))

(declare-fun res!813689 () Bool)

(assert (=> b!1224519 (=> (not res!813689) (not e!695468))))

(declare-fun lt!557574 () ListLongMap!18097)

(assert (=> b!1224519 (= res!813689 (= lt!557574 (+!4121 lt!557565 lt!557566)))))

(declare-fun lt!557572 () V!46627)

(declare-fun get!19481 (ValueCell!14853 V!46627) V!46627)

(assert (=> b!1224519 (= lt!557566 (tuple2!20129 (select (arr!38143 _keys!1208) from!1455) (get!19481 (select (arr!38144 _values!996) from!1455) lt!557572)))))

(declare-fun b!1224520 () Bool)

(declare-fun Unit!40575 () Unit!40572)

(assert (=> b!1224520 (= e!695465 Unit!40575)))

(declare-fun lt!557563 () Unit!40572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79033 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40572)

(assert (=> b!1224520 (= lt!557563 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224520 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557573 () Unit!40572)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79033 (_ BitVec 32) (_ BitVec 32)) Unit!40572)

(assert (=> b!1224520 (= lt!557573 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224520 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26926)))

(declare-fun lt!557570 () Unit!40572)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79033 (_ BitVec 64) (_ BitVec 32) List!26929) Unit!40572)

(assert (=> b!1224520 (= lt!557570 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26926))))

(assert (=> b!1224520 false))

(declare-fun b!1224521 () Bool)

(declare-fun res!813677 () Bool)

(assert (=> b!1224521 (=> (not res!813677) (not e!695472))))

(assert (=> b!1224521 (= res!813677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224522 () Bool)

(assert (=> b!1224522 (= e!695462 (and e!695463 mapRes!48586))))

(declare-fun condMapEmpty!48586 () Bool)

(declare-fun mapDefault!48586 () ValueCell!14853)

(assert (=> b!1224522 (= condMapEmpty!48586 (= (arr!38144 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14853)) mapDefault!48586)))))

(declare-fun b!1224523 () Bool)

(declare-fun res!813688 () Bool)

(assert (=> b!1224523 (=> (not res!813688) (not e!695472))))

(assert (=> b!1224523 (= res!813688 (and (= (size!38680 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38679 _keys!1208) (size!38680 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224524 () Bool)

(declare-fun res!813690 () Bool)

(assert (=> b!1224524 (=> (not res!813690) (not e!695472))))

(assert (=> b!1224524 (= res!813690 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38679 _keys!1208))))))

(declare-fun b!1224525 () Bool)

(assert (=> b!1224525 (= e!695471 (= lt!557565 lt!557569))))

(declare-fun b!1224526 () Bool)

(assert (=> b!1224526 (= e!695464 e!695466)))

(declare-fun res!813691 () Bool)

(assert (=> b!1224526 (=> res!813691 e!695466)))

(assert (=> b!1224526 (= res!813691 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1224526 (= lt!557574 (getCurrentListMapNoExtraKeys!5485 lt!557571 lt!557575 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1224526 (= lt!557575 (array!79036 (store (arr!38144 _values!996) i!673 (ValueCellFull!14853 lt!557572)) (size!38680 _values!996)))))

(declare-fun dynLambda!3358 (Int (_ BitVec 64)) V!46627)

(assert (=> b!1224526 (= lt!557572 (dynLambda!3358 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1224526 (= lt!557564 (getCurrentListMapNoExtraKeys!5485 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101732 res!813685) b!1224513))

(assert (= (and b!1224513 res!813678) b!1224523))

(assert (= (and b!1224523 res!813688) b!1224521))

(assert (= (and b!1224521 res!813677) b!1224515))

(assert (= (and b!1224515 res!813686) b!1224524))

(assert (= (and b!1224524 res!813690) b!1224507))

(assert (= (and b!1224507 res!813676) b!1224509))

(assert (= (and b!1224509 res!813682) b!1224512))

(assert (= (and b!1224512 res!813681) b!1224511))

(assert (= (and b!1224511 res!813683) b!1224514))

(assert (= (and b!1224514 (not res!813675)) b!1224526))

(assert (= (and b!1224526 (not res!813691)) b!1224506))

(assert (= (and b!1224506 (not res!813687)) b!1224519))

(assert (= (and b!1224519 res!813689) b!1224516))

(assert (= (and b!1224516 (not res!813684)) b!1224505))

(assert (= (and b!1224519 c!120452) b!1224520))

(assert (= (and b!1224519 (not c!120452)) b!1224517))

(assert (= (and b!1224519 res!813679) b!1224510))

(assert (= (and b!1224510 res!813680) b!1224525))

(assert (= (and b!1224522 condMapEmpty!48586) mapIsEmpty!48586))

(assert (= (and b!1224522 (not condMapEmpty!48586)) mapNonEmpty!48586))

(get-info :version)

(assert (= (and mapNonEmpty!48586 ((_ is ValueCellFull!14853) mapValue!48586)) b!1224508))

(assert (= (and b!1224522 ((_ is ValueCellFull!14853) mapDefault!48586)) b!1224518))

(assert (= start!101732 b!1224522))

(declare-fun b_lambda!22401 () Bool)

(assert (=> (not b_lambda!22401) (not b!1224526)))

(declare-fun t!40328 () Bool)

(declare-fun tb!11221 () Bool)

(assert (=> (and start!101732 (= defaultEntry!1004 defaultEntry!1004) t!40328) tb!11221))

(declare-fun result!23055 () Bool)

(assert (=> tb!11221 (= result!23055 tp_is_empty!31125)))

(assert (=> b!1224526 t!40328))

(declare-fun b_and!44105 () Bool)

(assert (= b_and!44103 (and (=> t!40328 result!23055) b_and!44105)))

(declare-fun m!1129505 () Bool)

(assert (=> b!1224521 m!1129505))

(declare-fun m!1129507 () Bool)

(assert (=> b!1224514 m!1129507))

(declare-fun m!1129509 () Bool)

(assert (=> b!1224514 m!1129509))

(declare-fun m!1129511 () Bool)

(assert (=> b!1224510 m!1129511))

(declare-fun m!1129513 () Bool)

(assert (=> b!1224511 m!1129513))

(declare-fun m!1129515 () Bool)

(assert (=> b!1224526 m!1129515))

(declare-fun m!1129517 () Bool)

(assert (=> b!1224526 m!1129517))

(declare-fun m!1129519 () Bool)

(assert (=> b!1224526 m!1129519))

(declare-fun m!1129521 () Bool)

(assert (=> b!1224526 m!1129521))

(declare-fun m!1129523 () Bool)

(assert (=> b!1224505 m!1129523))

(declare-fun m!1129525 () Bool)

(assert (=> b!1224509 m!1129525))

(declare-fun m!1129527 () Bool)

(assert (=> b!1224507 m!1129527))

(declare-fun m!1129529 () Bool)

(assert (=> b!1224516 m!1129529))

(declare-fun m!1129531 () Bool)

(assert (=> b!1224513 m!1129531))

(assert (=> b!1224519 m!1129529))

(declare-fun m!1129533 () Bool)

(assert (=> b!1224519 m!1129533))

(declare-fun m!1129535 () Bool)

(assert (=> b!1224519 m!1129535))

(assert (=> b!1224519 m!1129535))

(declare-fun m!1129537 () Bool)

(assert (=> b!1224519 m!1129537))

(declare-fun m!1129539 () Bool)

(assert (=> b!1224515 m!1129539))

(declare-fun m!1129541 () Bool)

(assert (=> mapNonEmpty!48586 m!1129541))

(declare-fun m!1129543 () Bool)

(assert (=> b!1224520 m!1129543))

(declare-fun m!1129545 () Bool)

(assert (=> b!1224520 m!1129545))

(declare-fun m!1129547 () Bool)

(assert (=> b!1224520 m!1129547))

(declare-fun m!1129549 () Bool)

(assert (=> b!1224520 m!1129549))

(declare-fun m!1129551 () Bool)

(assert (=> b!1224520 m!1129551))

(declare-fun m!1129553 () Bool)

(assert (=> b!1224512 m!1129553))

(declare-fun m!1129555 () Bool)

(assert (=> b!1224512 m!1129555))

(declare-fun m!1129557 () Bool)

(assert (=> start!101732 m!1129557))

(declare-fun m!1129559 () Bool)

(assert (=> start!101732 m!1129559))

(declare-fun m!1129561 () Bool)

(assert (=> b!1224506 m!1129561))

(declare-fun m!1129563 () Bool)

(assert (=> b!1224506 m!1129563))

(declare-fun m!1129565 () Bool)

(assert (=> b!1224506 m!1129565))

(declare-fun m!1129567 () Bool)

(assert (=> b!1224506 m!1129567))

(assert (=> b!1224506 m!1129529))

(declare-fun m!1129569 () Bool)

(assert (=> b!1224506 m!1129569))

(assert (=> b!1224506 m!1129529))

(check-sat (not mapNonEmpty!48586) (not b!1224512) (not b!1224519) (not b!1224510) (not b!1224513) (not b!1224506) (not b!1224526) (not b_lambda!22401) (not b!1224515) (not b!1224507) (not start!101732) (not b!1224511) (not b!1224505) (not b!1224520) (not b!1224521) tp_is_empty!31125 (not b!1224514) (not b_next!26421) b_and!44105)
(check-sat b_and!44105 (not b_next!26421))
