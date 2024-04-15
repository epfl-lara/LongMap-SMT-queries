; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101730 () Bool)

(assert start!101730)

(declare-fun b_free!26425 () Bool)

(declare-fun b_next!26425 () Bool)

(assert (=> start!101730 (= b_free!26425 (not b_next!26425))))

(declare-fun tp!92320 () Bool)

(declare-fun b_and!44093 () Bool)

(assert (=> start!101730 (= tp!92320 b_and!44093)))

(declare-fun b!1224528 () Bool)

(declare-datatypes ((Unit!40421 0))(
  ( (Unit!40422) )
))
(declare-fun e!695477 () Unit!40421)

(declare-fun Unit!40423 () Unit!40421)

(assert (=> b!1224528 (= e!695477 Unit!40423)))

(declare-fun b!1224529 () Bool)

(declare-fun e!695476 () Bool)

(declare-fun e!695468 () Bool)

(declare-fun mapRes!48592 () Bool)

(assert (=> b!1224529 (= e!695476 (and e!695468 mapRes!48592))))

(declare-fun condMapEmpty!48592 () Bool)

(declare-datatypes ((V!46633 0))(
  ( (V!46634 (val!15621 Int)) )
))
(declare-datatypes ((ValueCell!14855 0))(
  ( (ValueCellFull!14855 (v!18282 V!46633)) (EmptyCell!14855) )
))
(declare-datatypes ((array!78962 0))(
  ( (array!78963 (arr!38108 (Array (_ BitVec 32) ValueCell!14855)) (size!38646 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78962)

(declare-fun mapDefault!48592 () ValueCell!14855)

(assert (=> b!1224529 (= condMapEmpty!48592 (= (arr!38108 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14855)) mapDefault!48592)))))

(declare-fun mapNonEmpty!48592 () Bool)

(declare-fun tp!92321 () Bool)

(declare-fun e!695472 () Bool)

(assert (=> mapNonEmpty!48592 (= mapRes!48592 (and tp!92321 e!695472))))

(declare-fun mapRest!48592 () (Array (_ BitVec 32) ValueCell!14855))

(declare-fun mapValue!48592 () ValueCell!14855)

(declare-fun mapKey!48592 () (_ BitVec 32))

(assert (=> mapNonEmpty!48592 (= (arr!38108 _values!996) (store mapRest!48592 mapKey!48592 mapValue!48592))))

(declare-fun b!1224530 () Bool)

(declare-fun Unit!40424 () Unit!40421)

(assert (=> b!1224530 (= e!695477 Unit!40424)))

(declare-datatypes ((array!78964 0))(
  ( (array!78965 (arr!38109 (Array (_ BitVec 32) (_ BitVec 64))) (size!38647 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78964)

(declare-fun lt!557497 () Unit!40421)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78964 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40421)

(assert (=> b!1224530 (= lt!557497 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!78964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224530 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557482 () Unit!40421)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78964 (_ BitVec 32) (_ BitVec 32)) Unit!40421)

(assert (=> b!1224530 (= lt!557482 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26994 0))(
  ( (Nil!26991) (Cons!26990 (h!28199 (_ BitVec 64)) (t!40390 List!26994)) )
))
(declare-fun arrayNoDuplicates!0 (array!78964 (_ BitVec 32) List!26994) Bool)

(assert (=> b!1224530 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26991)))

(declare-fun lt!557493 () Unit!40421)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78964 (_ BitVec 64) (_ BitVec 32) List!26994) Unit!40421)

(assert (=> b!1224530 (= lt!557493 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26991))))

(assert (=> b!1224530 false))

(declare-fun b!1224531 () Bool)

(declare-fun e!695470 () Bool)

(declare-fun e!695473 () Bool)

(assert (=> b!1224531 (= e!695470 e!695473)))

(declare-fun res!813713 () Bool)

(assert (=> b!1224531 (=> res!813713 e!695473)))

(assert (=> b!1224531 (= res!813713 (not (= (select (arr!38109 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224532 () Bool)

(declare-fun e!695474 () Bool)

(declare-fun e!695469 () Bool)

(assert (=> b!1224532 (= e!695474 e!695469)))

(declare-fun res!813725 () Bool)

(assert (=> b!1224532 (=> res!813725 e!695469)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224532 (= res!813725 (not (validKeyInArray!0 (select (arr!38109 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20214 0))(
  ( (tuple2!20215 (_1!10118 (_ BitVec 64)) (_2!10118 V!46633)) )
))
(declare-datatypes ((List!26995 0))(
  ( (Nil!26992) (Cons!26991 (h!28200 tuple2!20214) (t!40391 List!26995)) )
))
(declare-datatypes ((ListLongMap!18183 0))(
  ( (ListLongMap!18184 (toList!9107 List!26995)) )
))
(declare-fun lt!557496 () ListLongMap!18183)

(declare-fun lt!557483 () ListLongMap!18183)

(assert (=> b!1224532 (= lt!557496 lt!557483)))

(declare-fun lt!557486 () ListLongMap!18183)

(declare-fun -!1924 (ListLongMap!18183 (_ BitVec 64)) ListLongMap!18183)

(assert (=> b!1224532 (= lt!557483 (-!1924 lt!557486 k0!934))))

(declare-fun zeroValue!944 () V!46633)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!557491 () array!78964)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46633)

(declare-fun lt!557479 () array!78962)

(declare-fun getCurrentListMapNoExtraKeys!5538 (array!78964 array!78962 (_ BitVec 32) (_ BitVec 32) V!46633 V!46633 (_ BitVec 32) Int) ListLongMap!18183)

(assert (=> b!1224532 (= lt!557496 (getCurrentListMapNoExtraKeys!5538 lt!557491 lt!557479 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224532 (= lt!557486 (getCurrentListMapNoExtraKeys!5538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557485 () Unit!40421)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1159 (array!78964 array!78962 (_ BitVec 32) (_ BitVec 32) V!46633 V!46633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40421)

(assert (=> b!1224532 (= lt!557485 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1159 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224533 () Bool)

(declare-fun res!813718 () Bool)

(declare-fun e!695475 () Bool)

(assert (=> b!1224533 (=> (not res!813718) (not e!695475))))

(assert (=> b!1224533 (= res!813718 (and (= (size!38646 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38647 _keys!1208) (size!38646 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224534 () Bool)

(assert (=> b!1224534 (= e!695469 true)))

(declare-fun lt!557484 () ListLongMap!18183)

(declare-fun lt!557480 () ListLongMap!18183)

(assert (=> b!1224534 (= (-!1924 lt!557484 k0!934) lt!557480)))

(declare-fun lt!557490 () Unit!40421)

(declare-fun lt!557481 () V!46633)

(declare-fun addRemoveCommutativeForDiffKeys!210 (ListLongMap!18183 (_ BitVec 64) V!46633 (_ BitVec 64)) Unit!40421)

(assert (=> b!1224534 (= lt!557490 (addRemoveCommutativeForDiffKeys!210 lt!557486 (select (arr!38109 _keys!1208) from!1455) lt!557481 k0!934))))

(declare-fun lt!557492 () ListLongMap!18183)

(assert (=> b!1224534 (and (= lt!557492 lt!557484) (= lt!557483 lt!557496))))

(declare-fun lt!557488 () tuple2!20214)

(declare-fun +!4168 (ListLongMap!18183 tuple2!20214) ListLongMap!18183)

(assert (=> b!1224534 (= lt!557484 (+!4168 lt!557486 lt!557488))))

(assert (=> b!1224534 (not (= (select (arr!38109 _keys!1208) from!1455) k0!934))))

(declare-fun lt!557495 () Unit!40421)

(assert (=> b!1224534 (= lt!557495 e!695477)))

(declare-fun c!120437 () Bool)

(assert (=> b!1224534 (= c!120437 (= (select (arr!38109 _keys!1208) from!1455) k0!934))))

(assert (=> b!1224534 e!695470))

(declare-fun res!813712 () Bool)

(assert (=> b!1224534 (=> (not res!813712) (not e!695470))))

(declare-fun lt!557487 () ListLongMap!18183)

(assert (=> b!1224534 (= res!813712 (= lt!557487 lt!557480))))

(assert (=> b!1224534 (= lt!557480 (+!4168 lt!557483 lt!557488))))

(assert (=> b!1224534 (= lt!557488 (tuple2!20215 (select (arr!38109 _keys!1208) from!1455) lt!557481))))

(declare-fun lt!557489 () V!46633)

(declare-fun get!19483 (ValueCell!14855 V!46633) V!46633)

(assert (=> b!1224534 (= lt!557481 (get!19483 (select (arr!38108 _values!996) from!1455) lt!557489))))

(declare-fun mapIsEmpty!48592 () Bool)

(assert (=> mapIsEmpty!48592 mapRes!48592))

(declare-fun b!1224535 () Bool)

(declare-fun res!813717 () Bool)

(assert (=> b!1224535 (=> (not res!813717) (not e!695475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78964 (_ BitVec 32)) Bool)

(assert (=> b!1224535 (= res!813717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224536 () Bool)

(declare-fun res!813721 () Bool)

(assert (=> b!1224536 (=> (not res!813721) (not e!695475))))

(assert (=> b!1224536 (= res!813721 (= (select (arr!38109 _keys!1208) i!673) k0!934))))

(declare-fun res!813715 () Bool)

(assert (=> start!101730 (=> (not res!813715) (not e!695475))))

(assert (=> start!101730 (= res!813715 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38647 _keys!1208))))))

(assert (=> start!101730 e!695475))

(declare-fun tp_is_empty!31129 () Bool)

(assert (=> start!101730 tp_is_empty!31129))

(declare-fun array_inv!29110 (array!78964) Bool)

(assert (=> start!101730 (array_inv!29110 _keys!1208)))

(assert (=> start!101730 true))

(assert (=> start!101730 tp!92320))

(declare-fun array_inv!29111 (array!78962) Bool)

(assert (=> start!101730 (and (array_inv!29111 _values!996) e!695476)))

(declare-fun b!1224537 () Bool)

(declare-fun e!695478 () Bool)

(assert (=> b!1224537 (= e!695475 e!695478)))

(declare-fun res!813723 () Bool)

(assert (=> b!1224537 (=> (not res!813723) (not e!695478))))

(assert (=> b!1224537 (= res!813723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557491 mask!1564))))

(assert (=> b!1224537 (= lt!557491 (array!78965 (store (arr!38109 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38647 _keys!1208)))))

(declare-fun b!1224538 () Bool)

(declare-fun e!695479 () Bool)

(assert (=> b!1224538 (= e!695478 (not e!695479))))

(declare-fun res!813716 () Bool)

(assert (=> b!1224538 (=> res!813716 e!695479)))

(assert (=> b!1224538 (= res!813716 (bvsgt from!1455 i!673))))

(assert (=> b!1224538 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557494 () Unit!40421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78964 (_ BitVec 64) (_ BitVec 32)) Unit!40421)

(assert (=> b!1224538 (= lt!557494 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224539 () Bool)

(declare-fun res!813724 () Bool)

(assert (=> b!1224539 (=> (not res!813724) (not e!695475))))

(assert (=> b!1224539 (= res!813724 (validKeyInArray!0 k0!934))))

(declare-fun b!1224540 () Bool)

(declare-fun res!813726 () Bool)

(assert (=> b!1224540 (=> (not res!813726) (not e!695478))))

(assert (=> b!1224540 (= res!813726 (arrayNoDuplicates!0 lt!557491 #b00000000000000000000000000000000 Nil!26991))))

(declare-fun b!1224541 () Bool)

(declare-fun res!813722 () Bool)

(assert (=> b!1224541 (=> (not res!813722) (not e!695475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224541 (= res!813722 (validMask!0 mask!1564))))

(declare-fun b!1224542 () Bool)

(declare-fun res!813714 () Bool)

(assert (=> b!1224542 (=> (not res!813714) (not e!695475))))

(assert (=> b!1224542 (= res!813714 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26991))))

(declare-fun b!1224543 () Bool)

(assert (=> b!1224543 (= e!695468 tp_is_empty!31129)))

(declare-fun b!1224544 () Bool)

(assert (=> b!1224544 (= e!695479 e!695474)))

(declare-fun res!813719 () Bool)

(assert (=> b!1224544 (=> res!813719 e!695474)))

(assert (=> b!1224544 (= res!813719 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1224544 (= lt!557487 (getCurrentListMapNoExtraKeys!5538 lt!557491 lt!557479 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1224544 (= lt!557479 (array!78963 (store (arr!38108 _values!996) i!673 (ValueCellFull!14855 lt!557489)) (size!38646 _values!996)))))

(declare-fun dynLambda!3383 (Int (_ BitVec 64)) V!46633)

(assert (=> b!1224544 (= lt!557489 (dynLambda!3383 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1224544 (= lt!557492 (getCurrentListMapNoExtraKeys!5538 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224545 () Bool)

(assert (=> b!1224545 (= e!695473 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224546 () Bool)

(assert (=> b!1224546 (= e!695472 tp_is_empty!31129)))

(declare-fun b!1224547 () Bool)

(declare-fun res!813720 () Bool)

(assert (=> b!1224547 (=> (not res!813720) (not e!695475))))

(assert (=> b!1224547 (= res!813720 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38647 _keys!1208))))))

(assert (= (and start!101730 res!813715) b!1224541))

(assert (= (and b!1224541 res!813722) b!1224533))

(assert (= (and b!1224533 res!813718) b!1224535))

(assert (= (and b!1224535 res!813717) b!1224542))

(assert (= (and b!1224542 res!813714) b!1224547))

(assert (= (and b!1224547 res!813720) b!1224539))

(assert (= (and b!1224539 res!813724) b!1224536))

(assert (= (and b!1224536 res!813721) b!1224537))

(assert (= (and b!1224537 res!813723) b!1224540))

(assert (= (and b!1224540 res!813726) b!1224538))

(assert (= (and b!1224538 (not res!813716)) b!1224544))

(assert (= (and b!1224544 (not res!813719)) b!1224532))

(assert (= (and b!1224532 (not res!813725)) b!1224534))

(assert (= (and b!1224534 res!813712) b!1224531))

(assert (= (and b!1224531 (not res!813713)) b!1224545))

(assert (= (and b!1224534 c!120437) b!1224530))

(assert (= (and b!1224534 (not c!120437)) b!1224528))

(assert (= (and b!1224529 condMapEmpty!48592) mapIsEmpty!48592))

(assert (= (and b!1224529 (not condMapEmpty!48592)) mapNonEmpty!48592))

(get-info :version)

(assert (= (and mapNonEmpty!48592 ((_ is ValueCellFull!14855) mapValue!48592)) b!1224546))

(assert (= (and b!1224529 ((_ is ValueCellFull!14855) mapDefault!48592)) b!1224543))

(assert (= start!101730 b!1224529))

(declare-fun b_lambda!22395 () Bool)

(assert (=> (not b_lambda!22395) (not b!1224544)))

(declare-fun t!40389 () Bool)

(declare-fun tb!11217 () Bool)

(assert (=> (and start!101730 (= defaultEntry!1004 defaultEntry!1004) t!40389) tb!11217))

(declare-fun result!23055 () Bool)

(assert (=> tb!11217 (= result!23055 tp_is_empty!31129)))

(assert (=> b!1224544 t!40389))

(declare-fun b_and!44095 () Bool)

(assert (= b_and!44093 (and (=> t!40389 result!23055) b_and!44095)))

(declare-fun m!1129073 () Bool)

(assert (=> b!1224539 m!1129073))

(declare-fun m!1129075 () Bool)

(assert (=> b!1224536 m!1129075))

(declare-fun m!1129077 () Bool)

(assert (=> b!1224530 m!1129077))

(declare-fun m!1129079 () Bool)

(assert (=> b!1224530 m!1129079))

(declare-fun m!1129081 () Bool)

(assert (=> b!1224530 m!1129081))

(declare-fun m!1129083 () Bool)

(assert (=> b!1224530 m!1129083))

(declare-fun m!1129085 () Bool)

(assert (=> b!1224530 m!1129085))

(declare-fun m!1129087 () Bool)

(assert (=> b!1224542 m!1129087))

(declare-fun m!1129089 () Bool)

(assert (=> b!1224541 m!1129089))

(declare-fun m!1129091 () Bool)

(assert (=> b!1224538 m!1129091))

(declare-fun m!1129093 () Bool)

(assert (=> b!1224538 m!1129093))

(declare-fun m!1129095 () Bool)

(assert (=> b!1224545 m!1129095))

(declare-fun m!1129097 () Bool)

(assert (=> b!1224540 m!1129097))

(declare-fun m!1129099 () Bool)

(assert (=> mapNonEmpty!48592 m!1129099))

(declare-fun m!1129101 () Bool)

(assert (=> b!1224537 m!1129101))

(declare-fun m!1129103 () Bool)

(assert (=> b!1224537 m!1129103))

(declare-fun m!1129105 () Bool)

(assert (=> b!1224535 m!1129105))

(declare-fun m!1129107 () Bool)

(assert (=> b!1224531 m!1129107))

(declare-fun m!1129109 () Bool)

(assert (=> b!1224544 m!1129109))

(declare-fun m!1129111 () Bool)

(assert (=> b!1224544 m!1129111))

(declare-fun m!1129113 () Bool)

(assert (=> b!1224544 m!1129113))

(declare-fun m!1129115 () Bool)

(assert (=> b!1224544 m!1129115))

(declare-fun m!1129117 () Bool)

(assert (=> start!101730 m!1129117))

(declare-fun m!1129119 () Bool)

(assert (=> start!101730 m!1129119))

(declare-fun m!1129121 () Bool)

(assert (=> b!1224532 m!1129121))

(declare-fun m!1129123 () Bool)

(assert (=> b!1224532 m!1129123))

(declare-fun m!1129125 () Bool)

(assert (=> b!1224532 m!1129125))

(assert (=> b!1224532 m!1129107))

(declare-fun m!1129127 () Bool)

(assert (=> b!1224532 m!1129127))

(declare-fun m!1129129 () Bool)

(assert (=> b!1224532 m!1129129))

(assert (=> b!1224532 m!1129107))

(declare-fun m!1129131 () Bool)

(assert (=> b!1224534 m!1129131))

(declare-fun m!1129133 () Bool)

(assert (=> b!1224534 m!1129133))

(declare-fun m!1129135 () Bool)

(assert (=> b!1224534 m!1129135))

(assert (=> b!1224534 m!1129133))

(declare-fun m!1129137 () Bool)

(assert (=> b!1224534 m!1129137))

(declare-fun m!1129139 () Bool)

(assert (=> b!1224534 m!1129139))

(assert (=> b!1224534 m!1129107))

(declare-fun m!1129141 () Bool)

(assert (=> b!1224534 m!1129141))

(assert (=> b!1224534 m!1129107))

(check-sat (not b!1224538) (not b!1224542) (not b!1224544) (not start!101730) (not b!1224530) (not b!1224532) tp_is_empty!31129 (not b!1224545) b_and!44095 (not mapNonEmpty!48592) (not b_next!26425) (not b_lambda!22395) (not b!1224537) (not b!1224541) (not b!1224539) (not b!1224540) (not b!1224535) (not b!1224534))
(check-sat b_and!44095 (not b_next!26425))
