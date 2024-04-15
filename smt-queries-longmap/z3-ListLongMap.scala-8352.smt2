; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101656 () Bool)

(assert start!101656)

(declare-fun b_free!26383 () Bool)

(declare-fun b_next!26383 () Bool)

(assert (=> start!101656 (= b_free!26383 (not b_next!26383))))

(declare-fun tp!92192 () Bool)

(declare-fun b_and!43991 () Bool)

(assert (=> start!101656 (= tp!92192 b_and!43991)))

(declare-fun b!1222991 () Bool)

(declare-fun e!694565 () Bool)

(declare-fun tp_is_empty!31087 () Bool)

(assert (=> b!1222991 (= e!694565 tp_is_empty!31087)))

(declare-fun b!1222992 () Bool)

(declare-fun res!812630 () Bool)

(declare-fun e!694556 () Bool)

(assert (=> b!1222992 (=> (not res!812630) (not e!694556))))

(declare-datatypes ((array!78878 0))(
  ( (array!78879 (arr!38067 (Array (_ BitVec 32) (_ BitVec 64))) (size!38605 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78878)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1222992 (= res!812630 (= (select (arr!38067 _keys!1208) i!673) k0!934))))

(declare-fun b!1222993 () Bool)

(declare-fun e!694558 () Bool)

(assert (=> b!1222993 (= e!694556 e!694558)))

(declare-fun res!812623 () Bool)

(assert (=> b!1222993 (=> (not res!812623) (not e!694558))))

(declare-fun lt!556448 () array!78878)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78878 (_ BitVec 32)) Bool)

(assert (=> b!1222993 (= res!812623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556448 mask!1564))))

(assert (=> b!1222993 (= lt!556448 (array!78879 (store (arr!38067 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38605 _keys!1208)))))

(declare-fun b!1222994 () Bool)

(declare-fun res!812626 () Bool)

(assert (=> b!1222994 (=> (not res!812626) (not e!694556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222994 (= res!812626 (validMask!0 mask!1564))))

(declare-fun b!1222995 () Bool)

(declare-fun e!694561 () Bool)

(assert (=> b!1222995 (= e!694561 tp_is_empty!31087)))

(declare-fun e!694562 () Bool)

(declare-datatypes ((V!46577 0))(
  ( (V!46578 (val!15600 Int)) )
))
(declare-datatypes ((tuple2!20176 0))(
  ( (tuple2!20177 (_1!10099 (_ BitVec 64)) (_2!10099 V!46577)) )
))
(declare-fun lt!556445 () tuple2!20176)

(declare-datatypes ((List!26957 0))(
  ( (Nil!26954) (Cons!26953 (h!28162 tuple2!20176) (t!40311 List!26957)) )
))
(declare-datatypes ((ListLongMap!18145 0))(
  ( (ListLongMap!18146 (toList!9088 List!26957)) )
))
(declare-fun lt!556441 () ListLongMap!18145)

(declare-fun b!1222996 () Bool)

(declare-fun lt!556439 () ListLongMap!18145)

(declare-fun +!4150 (ListLongMap!18145 tuple2!20176) ListLongMap!18145)

(assert (=> b!1222996 (= e!694562 (= lt!556441 (+!4150 lt!556439 lt!556445)))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1222996 (not (= (select (arr!38067 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!40358 0))(
  ( (Unit!40359) )
))
(declare-fun lt!556443 () Unit!40358)

(declare-fun e!694566 () Unit!40358)

(assert (=> b!1222996 (= lt!556443 e!694566)))

(declare-fun c!120335 () Bool)

(assert (=> b!1222996 (= c!120335 (= (select (arr!38067 _keys!1208) from!1455) k0!934))))

(declare-fun e!694557 () Bool)

(assert (=> b!1222996 e!694557))

(declare-fun res!812620 () Bool)

(assert (=> b!1222996 (=> (not res!812620) (not e!694557))))

(declare-fun lt!556451 () ListLongMap!18145)

(declare-fun lt!556447 () ListLongMap!18145)

(assert (=> b!1222996 (= res!812620 (= lt!556447 (+!4150 lt!556451 lt!556445)))))

(declare-fun lt!556449 () V!46577)

(declare-datatypes ((ValueCell!14834 0))(
  ( (ValueCellFull!14834 (v!18260 V!46577)) (EmptyCell!14834) )
))
(declare-datatypes ((array!78880 0))(
  ( (array!78881 (arr!38068 (Array (_ BitVec 32) ValueCell!14834)) (size!38606 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78880)

(declare-fun get!19451 (ValueCell!14834 V!46577) V!46577)

(assert (=> b!1222996 (= lt!556445 (tuple2!20177 (select (arr!38067 _keys!1208) from!1455) (get!19451 (select (arr!38068 _values!996) from!1455) lt!556449)))))

(declare-fun b!1222997 () Bool)

(declare-fun e!694564 () Bool)

(assert (=> b!1222997 (= e!694558 (not e!694564))))

(declare-fun res!812618 () Bool)

(assert (=> b!1222997 (=> res!812618 e!694564)))

(assert (=> b!1222997 (= res!812618 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222997 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556450 () Unit!40358)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78878 (_ BitVec 64) (_ BitVec 32)) Unit!40358)

(assert (=> b!1222997 (= lt!556450 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222998 () Bool)

(declare-fun Unit!40360 () Unit!40358)

(assert (=> b!1222998 (= e!694566 Unit!40360)))

(declare-fun lt!556440 () Unit!40358)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78878 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40358)

(assert (=> b!1222998 (= lt!556440 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222998 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556452 () Unit!40358)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78878 (_ BitVec 32) (_ BitVec 32)) Unit!40358)

(assert (=> b!1222998 (= lt!556452 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26958 0))(
  ( (Nil!26955) (Cons!26954 (h!28163 (_ BitVec 64)) (t!40312 List!26958)) )
))
(declare-fun arrayNoDuplicates!0 (array!78878 (_ BitVec 32) List!26958) Bool)

(assert (=> b!1222998 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26955)))

(declare-fun lt!556444 () Unit!40358)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78878 (_ BitVec 64) (_ BitVec 32) List!26958) Unit!40358)

(assert (=> b!1222998 (= lt!556444 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26955))))

(assert (=> b!1222998 false))

(declare-fun b!1222999 () Bool)

(declare-fun res!812632 () Bool)

(assert (=> b!1222999 (=> (not res!812632) (not e!694556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222999 (= res!812632 (validKeyInArray!0 k0!934))))

(declare-fun b!1223000 () Bool)

(declare-fun e!694560 () Bool)

(declare-fun mapRes!48526 () Bool)

(assert (=> b!1223000 (= e!694560 (and e!694561 mapRes!48526))))

(declare-fun condMapEmpty!48526 () Bool)

(declare-fun mapDefault!48526 () ValueCell!14834)

(assert (=> b!1223000 (= condMapEmpty!48526 (= (arr!38068 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14834)) mapDefault!48526)))))

(declare-fun mapNonEmpty!48526 () Bool)

(declare-fun tp!92191 () Bool)

(assert (=> mapNonEmpty!48526 (= mapRes!48526 (and tp!92191 e!694565))))

(declare-fun mapRest!48526 () (Array (_ BitVec 32) ValueCell!14834))

(declare-fun mapKey!48526 () (_ BitVec 32))

(declare-fun mapValue!48526 () ValueCell!14834)

(assert (=> mapNonEmpty!48526 (= (arr!38068 _values!996) (store mapRest!48526 mapKey!48526 mapValue!48526))))

(declare-fun res!812625 () Bool)

(assert (=> start!101656 (=> (not res!812625) (not e!694556))))

(assert (=> start!101656 (= res!812625 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38605 _keys!1208))))))

(assert (=> start!101656 e!694556))

(assert (=> start!101656 tp_is_empty!31087))

(declare-fun array_inv!29090 (array!78878) Bool)

(assert (=> start!101656 (array_inv!29090 _keys!1208)))

(assert (=> start!101656 true))

(assert (=> start!101656 tp!92192))

(declare-fun array_inv!29091 (array!78880) Bool)

(assert (=> start!101656 (and (array_inv!29091 _values!996) e!694560)))

(declare-fun b!1223001 () Bool)

(declare-fun e!694559 () Bool)

(assert (=> b!1223001 (= e!694557 e!694559)))

(declare-fun res!812631 () Bool)

(assert (=> b!1223001 (=> res!812631 e!694559)))

(assert (=> b!1223001 (= res!812631 (not (= (select (arr!38067 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223002 () Bool)

(declare-fun e!694555 () Bool)

(assert (=> b!1223002 (= e!694564 e!694555)))

(declare-fun res!812621 () Bool)

(assert (=> b!1223002 (=> res!812621 e!694555)))

(assert (=> b!1223002 (= res!812621 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46577)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!556442 () array!78880)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46577)

(declare-fun getCurrentListMapNoExtraKeys!5520 (array!78878 array!78880 (_ BitVec 32) (_ BitVec 32) V!46577 V!46577 (_ BitVec 32) Int) ListLongMap!18145)

(assert (=> b!1223002 (= lt!556447 (getCurrentListMapNoExtraKeys!5520 lt!556448 lt!556442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1223002 (= lt!556442 (array!78881 (store (arr!38068 _values!996) i!673 (ValueCellFull!14834 lt!556449)) (size!38606 _values!996)))))

(declare-fun dynLambda!3368 (Int (_ BitVec 64)) V!46577)

(assert (=> b!1223002 (= lt!556449 (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1223002 (= lt!556441 (getCurrentListMapNoExtraKeys!5520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223003 () Bool)

(declare-fun res!812628 () Bool)

(assert (=> b!1223003 (=> (not res!812628) (not e!694556))))

(assert (=> b!1223003 (= res!812628 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26955))))

(declare-fun mapIsEmpty!48526 () Bool)

(assert (=> mapIsEmpty!48526 mapRes!48526))

(declare-fun b!1223004 () Bool)

(declare-fun res!812622 () Bool)

(assert (=> b!1223004 (=> (not res!812622) (not e!694556))))

(assert (=> b!1223004 (= res!812622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223005 () Bool)

(declare-fun res!812629 () Bool)

(assert (=> b!1223005 (=> (not res!812629) (not e!694556))))

(assert (=> b!1223005 (= res!812629 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38605 _keys!1208))))))

(declare-fun b!1223006 () Bool)

(assert (=> b!1223006 (= e!694559 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223007 () Bool)

(declare-fun Unit!40361 () Unit!40358)

(assert (=> b!1223007 (= e!694566 Unit!40361)))

(declare-fun b!1223008 () Bool)

(declare-fun res!812627 () Bool)

(assert (=> b!1223008 (=> (not res!812627) (not e!694556))))

(assert (=> b!1223008 (= res!812627 (and (= (size!38606 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38605 _keys!1208) (size!38606 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223009 () Bool)

(declare-fun res!812619 () Bool)

(assert (=> b!1223009 (=> (not res!812619) (not e!694558))))

(assert (=> b!1223009 (= res!812619 (arrayNoDuplicates!0 lt!556448 #b00000000000000000000000000000000 Nil!26955))))

(declare-fun b!1223010 () Bool)

(assert (=> b!1223010 (= e!694555 e!694562)))

(declare-fun res!812624 () Bool)

(assert (=> b!1223010 (=> res!812624 e!694562)))

(assert (=> b!1223010 (= res!812624 (not (validKeyInArray!0 (select (arr!38067 _keys!1208) from!1455))))))

(declare-fun lt!556446 () ListLongMap!18145)

(assert (=> b!1223010 (= lt!556446 lt!556451)))

(declare-fun -!1911 (ListLongMap!18145 (_ BitVec 64)) ListLongMap!18145)

(assert (=> b!1223010 (= lt!556451 (-!1911 lt!556439 k0!934))))

(assert (=> b!1223010 (= lt!556446 (getCurrentListMapNoExtraKeys!5520 lt!556448 lt!556442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223010 (= lt!556439 (getCurrentListMapNoExtraKeys!5520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556438 () Unit!40358)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1146 (array!78878 array!78880 (_ BitVec 32) (_ BitVec 32) V!46577 V!46577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40358)

(assert (=> b!1223010 (= lt!556438 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1146 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101656 res!812625) b!1222994))

(assert (= (and b!1222994 res!812626) b!1223008))

(assert (= (and b!1223008 res!812627) b!1223004))

(assert (= (and b!1223004 res!812622) b!1223003))

(assert (= (and b!1223003 res!812628) b!1223005))

(assert (= (and b!1223005 res!812629) b!1222999))

(assert (= (and b!1222999 res!812632) b!1222992))

(assert (= (and b!1222992 res!812630) b!1222993))

(assert (= (and b!1222993 res!812623) b!1223009))

(assert (= (and b!1223009 res!812619) b!1222997))

(assert (= (and b!1222997 (not res!812618)) b!1223002))

(assert (= (and b!1223002 (not res!812621)) b!1223010))

(assert (= (and b!1223010 (not res!812624)) b!1222996))

(assert (= (and b!1222996 res!812620) b!1223001))

(assert (= (and b!1223001 (not res!812631)) b!1223006))

(assert (= (and b!1222996 c!120335) b!1222998))

(assert (= (and b!1222996 (not c!120335)) b!1223007))

(assert (= (and b!1223000 condMapEmpty!48526) mapIsEmpty!48526))

(assert (= (and b!1223000 (not condMapEmpty!48526)) mapNonEmpty!48526))

(get-info :version)

(assert (= (and mapNonEmpty!48526 ((_ is ValueCellFull!14834) mapValue!48526)) b!1222991))

(assert (= (and b!1223000 ((_ is ValueCellFull!14834) mapDefault!48526)) b!1222995))

(assert (= start!101656 b!1223000))

(declare-fun b_lambda!22315 () Bool)

(assert (=> (not b_lambda!22315) (not b!1223002)))

(declare-fun t!40310 () Bool)

(declare-fun tb!11175 () Bool)

(assert (=> (and start!101656 (= defaultEntry!1004 defaultEntry!1004) t!40310) tb!11175))

(declare-fun result!22969 () Bool)

(assert (=> tb!11175 (= result!22969 tp_is_empty!31087)))

(assert (=> b!1223002 t!40310))

(declare-fun b_and!43993 () Bool)

(assert (= b_and!43991 (and (=> t!40310 result!22969) b_and!43993)))

(declare-fun m!1127489 () Bool)

(assert (=> b!1222994 m!1127489))

(declare-fun m!1127491 () Bool)

(assert (=> b!1222993 m!1127491))

(declare-fun m!1127493 () Bool)

(assert (=> b!1222993 m!1127493))

(declare-fun m!1127495 () Bool)

(assert (=> b!1223004 m!1127495))

(declare-fun m!1127497 () Bool)

(assert (=> b!1223006 m!1127497))

(declare-fun m!1127499 () Bool)

(assert (=> b!1223003 m!1127499))

(declare-fun m!1127501 () Bool)

(assert (=> b!1222997 m!1127501))

(declare-fun m!1127503 () Bool)

(assert (=> b!1222997 m!1127503))

(declare-fun m!1127505 () Bool)

(assert (=> b!1222996 m!1127505))

(declare-fun m!1127507 () Bool)

(assert (=> b!1222996 m!1127507))

(declare-fun m!1127509 () Bool)

(assert (=> b!1222996 m!1127509))

(assert (=> b!1222996 m!1127505))

(declare-fun m!1127511 () Bool)

(assert (=> b!1222996 m!1127511))

(declare-fun m!1127513 () Bool)

(assert (=> b!1222996 m!1127513))

(assert (=> b!1223001 m!1127513))

(declare-fun m!1127515 () Bool)

(assert (=> b!1222998 m!1127515))

(declare-fun m!1127517 () Bool)

(assert (=> b!1222998 m!1127517))

(declare-fun m!1127519 () Bool)

(assert (=> b!1222998 m!1127519))

(declare-fun m!1127521 () Bool)

(assert (=> b!1222998 m!1127521))

(declare-fun m!1127523 () Bool)

(assert (=> b!1222998 m!1127523))

(declare-fun m!1127525 () Bool)

(assert (=> b!1222992 m!1127525))

(declare-fun m!1127527 () Bool)

(assert (=> start!101656 m!1127527))

(declare-fun m!1127529 () Bool)

(assert (=> start!101656 m!1127529))

(declare-fun m!1127531 () Bool)

(assert (=> b!1223009 m!1127531))

(declare-fun m!1127533 () Bool)

(assert (=> b!1222999 m!1127533))

(declare-fun m!1127535 () Bool)

(assert (=> b!1223010 m!1127535))

(declare-fun m!1127537 () Bool)

(assert (=> b!1223010 m!1127537))

(declare-fun m!1127539 () Bool)

(assert (=> b!1223010 m!1127539))

(assert (=> b!1223010 m!1127513))

(declare-fun m!1127541 () Bool)

(assert (=> b!1223010 m!1127541))

(declare-fun m!1127543 () Bool)

(assert (=> b!1223010 m!1127543))

(assert (=> b!1223010 m!1127513))

(declare-fun m!1127545 () Bool)

(assert (=> mapNonEmpty!48526 m!1127545))

(declare-fun m!1127547 () Bool)

(assert (=> b!1223002 m!1127547))

(declare-fun m!1127549 () Bool)

(assert (=> b!1223002 m!1127549))

(declare-fun m!1127551 () Bool)

(assert (=> b!1223002 m!1127551))

(declare-fun m!1127553 () Bool)

(assert (=> b!1223002 m!1127553))

(check-sat (not b_lambda!22315) (not b!1222999) (not start!101656) tp_is_empty!31087 (not b!1223002) (not b!1223003) (not mapNonEmpty!48526) (not b!1223004) b_and!43993 (not b!1223009) (not b!1223006) (not b!1222993) (not b!1222994) (not b!1222996) (not b_next!26383) (not b!1223010) (not b!1222997) (not b!1222998))
(check-sat b_and!43993 (not b_next!26383))
(get-model)

(declare-fun b_lambda!22321 () Bool)

(assert (= b_lambda!22315 (or (and start!101656 b_free!26383) b_lambda!22321)))

(check-sat (not b_lambda!22321) (not b!1222999) (not start!101656) tp_is_empty!31087 (not b!1223002) (not b!1223003) (not mapNonEmpty!48526) (not b!1223004) b_and!43993 (not b!1223009) (not b!1223006) (not b!1222993) (not b!1222994) (not b!1222996) (not b_next!26383) (not b!1223010) (not b!1222997) (not b!1222998))
(check-sat b_and!43993 (not b_next!26383))
(get-model)

(declare-fun d!133771 () Bool)

(assert (=> d!133771 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1222999 d!133771))

(declare-fun d!133773 () Bool)

(assert (=> d!133773 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26955)))

(declare-fun lt!556545 () Unit!40358)

(declare-fun choose!39 (array!78878 (_ BitVec 32) (_ BitVec 32)) Unit!40358)

(assert (=> d!133773 (= lt!556545 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133773 (bvslt (size!38605 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133773 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!556545)))

(declare-fun bs!34382 () Bool)

(assert (= bs!34382 d!133773))

(assert (=> bs!34382 m!1127523))

(declare-fun m!1127687 () Bool)

(assert (=> bs!34382 m!1127687))

(assert (=> b!1222998 d!133773))

(declare-fun d!133775 () Bool)

(assert (=> d!133775 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556548 () Unit!40358)

(declare-fun choose!114 (array!78878 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40358)

(assert (=> d!133775 (= lt!556548 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!133775 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133775 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!556548)))

(declare-fun bs!34383 () Bool)

(assert (= bs!34383 d!133775))

(assert (=> bs!34383 m!1127519))

(declare-fun m!1127689 () Bool)

(assert (=> bs!34383 m!1127689))

(assert (=> b!1222998 d!133775))

(declare-fun b!1223147 () Bool)

(declare-fun e!694648 () Bool)

(declare-fun call!60730 () Bool)

(assert (=> b!1223147 (= e!694648 call!60730)))

(declare-fun c!120344 () Bool)

(declare-fun bm!60727 () Bool)

(assert (=> bm!60727 (= call!60730 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120344 (Cons!26954 (select (arr!38067 _keys!1208) from!1455) Nil!26955) Nil!26955)))))

(declare-fun d!133777 () Bool)

(declare-fun res!812730 () Bool)

(declare-fun e!694649 () Bool)

(assert (=> d!133777 (=> res!812730 e!694649)))

(assert (=> d!133777 (= res!812730 (bvsge from!1455 (size!38605 _keys!1208)))))

(assert (=> d!133777 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26955) e!694649)))

(declare-fun b!1223148 () Bool)

(assert (=> b!1223148 (= e!694648 call!60730)))

(declare-fun b!1223149 () Bool)

(declare-fun e!694650 () Bool)

(assert (=> b!1223149 (= e!694650 e!694648)))

(assert (=> b!1223149 (= c!120344 (validKeyInArray!0 (select (arr!38067 _keys!1208) from!1455)))))

(declare-fun b!1223150 () Bool)

(assert (=> b!1223150 (= e!694649 e!694650)))

(declare-fun res!812731 () Bool)

(assert (=> b!1223150 (=> (not res!812731) (not e!694650))))

(declare-fun e!694647 () Bool)

(assert (=> b!1223150 (= res!812731 (not e!694647))))

(declare-fun res!812729 () Bool)

(assert (=> b!1223150 (=> (not res!812729) (not e!694647))))

(assert (=> b!1223150 (= res!812729 (validKeyInArray!0 (select (arr!38067 _keys!1208) from!1455)))))

(declare-fun b!1223151 () Bool)

(declare-fun contains!7006 (List!26958 (_ BitVec 64)) Bool)

(assert (=> b!1223151 (= e!694647 (contains!7006 Nil!26955 (select (arr!38067 _keys!1208) from!1455)))))

(assert (= (and d!133777 (not res!812730)) b!1223150))

(assert (= (and b!1223150 res!812729) b!1223151))

(assert (= (and b!1223150 res!812731) b!1223149))

(assert (= (and b!1223149 c!120344) b!1223147))

(assert (= (and b!1223149 (not c!120344)) b!1223148))

(assert (= (or b!1223147 b!1223148) bm!60727))

(assert (=> bm!60727 m!1127513))

(declare-fun m!1127691 () Bool)

(assert (=> bm!60727 m!1127691))

(assert (=> b!1223149 m!1127513))

(assert (=> b!1223149 m!1127513))

(assert (=> b!1223149 m!1127541))

(assert (=> b!1223150 m!1127513))

(assert (=> b!1223150 m!1127513))

(assert (=> b!1223150 m!1127541))

(assert (=> b!1223151 m!1127513))

(assert (=> b!1223151 m!1127513))

(declare-fun m!1127693 () Bool)

(assert (=> b!1223151 m!1127693))

(assert (=> b!1222998 d!133777))

(declare-fun d!133779 () Bool)

(declare-fun res!812736 () Bool)

(declare-fun e!694655 () Bool)

(assert (=> d!133779 (=> res!812736 e!694655)))

(assert (=> d!133779 (= res!812736 (= (select (arr!38067 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133779 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!694655)))

(declare-fun b!1223156 () Bool)

(declare-fun e!694656 () Bool)

(assert (=> b!1223156 (= e!694655 e!694656)))

(declare-fun res!812737 () Bool)

(assert (=> b!1223156 (=> (not res!812737) (not e!694656))))

(assert (=> b!1223156 (= res!812737 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38605 _keys!1208)))))

(declare-fun b!1223157 () Bool)

(assert (=> b!1223157 (= e!694656 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133779 (not res!812736)) b!1223156))

(assert (= (and b!1223156 res!812737) b!1223157))

(declare-fun m!1127695 () Bool)

(assert (=> d!133779 m!1127695))

(declare-fun m!1127697 () Bool)

(assert (=> b!1223157 m!1127697))

(assert (=> b!1222998 d!133779))

(declare-fun d!133781 () Bool)

(assert (=> d!133781 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38605 _keys!1208)) (not (= (select (arr!38067 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!556551 () Unit!40358)

(declare-fun choose!21 (array!78878 (_ BitVec 64) (_ BitVec 32) List!26958) Unit!40358)

(assert (=> d!133781 (= lt!556551 (choose!21 _keys!1208 k0!934 from!1455 Nil!26955))))

(assert (=> d!133781 (bvslt (size!38605 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133781 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26955) lt!556551)))

(declare-fun bs!34384 () Bool)

(assert (= bs!34384 d!133781))

(assert (=> bs!34384 m!1127513))

(declare-fun m!1127699 () Bool)

(assert (=> bs!34384 m!1127699))

(assert (=> b!1222998 d!133781))

(declare-fun d!133783 () Bool)

(declare-fun res!812738 () Bool)

(declare-fun e!694657 () Bool)

(assert (=> d!133783 (=> res!812738 e!694657)))

(assert (=> d!133783 (= res!812738 (= (select (arr!38067 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133783 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!694657)))

(declare-fun b!1223158 () Bool)

(declare-fun e!694658 () Bool)

(assert (=> b!1223158 (= e!694657 e!694658)))

(declare-fun res!812739 () Bool)

(assert (=> b!1223158 (=> (not res!812739) (not e!694658))))

(assert (=> b!1223158 (= res!812739 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38605 _keys!1208)))))

(declare-fun b!1223159 () Bool)

(assert (=> b!1223159 (= e!694658 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133783 (not res!812738)) b!1223158))

(assert (= (and b!1223158 res!812739) b!1223159))

(declare-fun m!1127701 () Bool)

(assert (=> d!133783 m!1127701))

(declare-fun m!1127703 () Bool)

(assert (=> b!1223159 m!1127703))

(assert (=> b!1222997 d!133783))

(declare-fun d!133785 () Bool)

(assert (=> d!133785 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556554 () Unit!40358)

(declare-fun choose!13 (array!78878 (_ BitVec 64) (_ BitVec 32)) Unit!40358)

(assert (=> d!133785 (= lt!556554 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133785 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133785 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!556554)))

(declare-fun bs!34385 () Bool)

(assert (= bs!34385 d!133785))

(assert (=> bs!34385 m!1127501))

(declare-fun m!1127705 () Bool)

(assert (=> bs!34385 m!1127705))

(assert (=> b!1222997 d!133785))

(declare-fun d!133787 () Bool)

(declare-fun res!812740 () Bool)

(declare-fun e!694659 () Bool)

(assert (=> d!133787 (=> res!812740 e!694659)))

(assert (=> d!133787 (= res!812740 (= (select (arr!38067 _keys!1208) i!673) k0!934))))

(assert (=> d!133787 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!694659)))

(declare-fun b!1223160 () Bool)

(declare-fun e!694660 () Bool)

(assert (=> b!1223160 (= e!694659 e!694660)))

(declare-fun res!812741 () Bool)

(assert (=> b!1223160 (=> (not res!812741) (not e!694660))))

(assert (=> b!1223160 (= res!812741 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38605 _keys!1208)))))

(declare-fun b!1223161 () Bool)

(assert (=> b!1223161 (= e!694660 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133787 (not res!812740)) b!1223160))

(assert (= (and b!1223160 res!812741) b!1223161))

(assert (=> d!133787 m!1127525))

(declare-fun m!1127707 () Bool)

(assert (=> b!1223161 m!1127707))

(assert (=> b!1223006 d!133787))

(declare-fun b!1223186 () Bool)

(declare-fun e!694677 () ListLongMap!18145)

(declare-fun e!694675 () ListLongMap!18145)

(assert (=> b!1223186 (= e!694677 e!694675)))

(declare-fun c!120355 () Bool)

(assert (=> b!1223186 (= c!120355 (validKeyInArray!0 (select (arr!38067 lt!556448) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1223187 () Bool)

(declare-fun e!694676 () Bool)

(declare-fun e!694680 () Bool)

(assert (=> b!1223187 (= e!694676 e!694680)))

(declare-fun c!120353 () Bool)

(declare-fun e!694678 () Bool)

(assert (=> b!1223187 (= c!120353 e!694678)))

(declare-fun res!812751 () Bool)

(assert (=> b!1223187 (=> (not res!812751) (not e!694678))))

(assert (=> b!1223187 (= res!812751 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 lt!556448)))))

(declare-fun bm!60730 () Bool)

(declare-fun call!60733 () ListLongMap!18145)

(assert (=> bm!60730 (= call!60733 (getCurrentListMapNoExtraKeys!5520 lt!556448 lt!556442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1223188 () Bool)

(assert (=> b!1223188 (= e!694677 (ListLongMap!18146 Nil!26954))))

(declare-fun e!694681 () Bool)

(declare-fun b!1223189 () Bool)

(declare-fun lt!556573 () ListLongMap!18145)

(assert (=> b!1223189 (= e!694681 (= lt!556573 (getCurrentListMapNoExtraKeys!5520 lt!556448 lt!556442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1223191 () Bool)

(declare-fun lt!556574 () Unit!40358)

(declare-fun lt!556569 () Unit!40358)

(assert (=> b!1223191 (= lt!556574 lt!556569)))

(declare-fun lt!556570 () (_ BitVec 64))

(declare-fun lt!556572 () ListLongMap!18145)

(declare-fun lt!556575 () (_ BitVec 64))

(declare-fun lt!556571 () V!46577)

(declare-fun contains!7007 (ListLongMap!18145 (_ BitVec 64)) Bool)

(assert (=> b!1223191 (not (contains!7007 (+!4150 lt!556572 (tuple2!20177 lt!556570 lt!556571)) lt!556575))))

(declare-fun addStillNotContains!306 (ListLongMap!18145 (_ BitVec 64) V!46577 (_ BitVec 64)) Unit!40358)

(assert (=> b!1223191 (= lt!556569 (addStillNotContains!306 lt!556572 lt!556570 lt!556571 lt!556575))))

(assert (=> b!1223191 (= lt!556575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1223191 (= lt!556571 (get!19451 (select (arr!38068 lt!556442) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1223191 (= lt!556570 (select (arr!38067 lt!556448) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223191 (= lt!556572 call!60733)))

(assert (=> b!1223191 (= e!694675 (+!4150 call!60733 (tuple2!20177 (select (arr!38067 lt!556448) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19451 (select (arr!38068 lt!556442) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1223192 () Bool)

(declare-fun isEmpty!1006 (ListLongMap!18145) Bool)

(assert (=> b!1223192 (= e!694681 (isEmpty!1006 lt!556573))))

(declare-fun b!1223193 () Bool)

(assert (=> b!1223193 (= e!694680 e!694681)))

(declare-fun c!120354 () Bool)

(assert (=> b!1223193 (= c!120354 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 lt!556448)))))

(declare-fun b!1223194 () Bool)

(assert (=> b!1223194 (= e!694678 (validKeyInArray!0 (select (arr!38067 lt!556448) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1223194 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1223190 () Bool)

(declare-fun e!694679 () Bool)

(assert (=> b!1223190 (= e!694680 e!694679)))

(assert (=> b!1223190 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 lt!556448)))))

(declare-fun res!812750 () Bool)

(assert (=> b!1223190 (= res!812750 (contains!7007 lt!556573 (select (arr!38067 lt!556448) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1223190 (=> (not res!812750) (not e!694679))))

(declare-fun d!133789 () Bool)

(assert (=> d!133789 e!694676))

(declare-fun res!812753 () Bool)

(assert (=> d!133789 (=> (not res!812753) (not e!694676))))

(assert (=> d!133789 (= res!812753 (not (contains!7007 lt!556573 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133789 (= lt!556573 e!694677)))

(declare-fun c!120356 () Bool)

(assert (=> d!133789 (= c!120356 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 lt!556448)))))

(assert (=> d!133789 (validMask!0 mask!1564)))

(assert (=> d!133789 (= (getCurrentListMapNoExtraKeys!5520 lt!556448 lt!556442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556573)))

(declare-fun b!1223195 () Bool)

(assert (=> b!1223195 (= e!694675 call!60733)))

(declare-fun b!1223196 () Bool)

(declare-fun res!812752 () Bool)

(assert (=> b!1223196 (=> (not res!812752) (not e!694676))))

(assert (=> b!1223196 (= res!812752 (not (contains!7007 lt!556573 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1223197 () Bool)

(assert (=> b!1223197 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 lt!556448)))))

(assert (=> b!1223197 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38606 lt!556442)))))

(declare-fun apply!970 (ListLongMap!18145 (_ BitVec 64)) V!46577)

(assert (=> b!1223197 (= e!694679 (= (apply!970 lt!556573 (select (arr!38067 lt!556448) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19451 (select (arr!38068 lt!556442) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133789 c!120356) b!1223188))

(assert (= (and d!133789 (not c!120356)) b!1223186))

(assert (= (and b!1223186 c!120355) b!1223191))

(assert (= (and b!1223186 (not c!120355)) b!1223195))

(assert (= (or b!1223191 b!1223195) bm!60730))

(assert (= (and d!133789 res!812753) b!1223196))

(assert (= (and b!1223196 res!812752) b!1223187))

(assert (= (and b!1223187 res!812751) b!1223194))

(assert (= (and b!1223187 c!120353) b!1223190))

(assert (= (and b!1223187 (not c!120353)) b!1223193))

(assert (= (and b!1223190 res!812750) b!1223197))

(assert (= (and b!1223193 c!120354) b!1223189))

(assert (= (and b!1223193 (not c!120354)) b!1223192))

(declare-fun b_lambda!22323 () Bool)

(assert (=> (not b_lambda!22323) (not b!1223191)))

(assert (=> b!1223191 t!40310))

(declare-fun b_and!44003 () Bool)

(assert (= b_and!43993 (and (=> t!40310 result!22969) b_and!44003)))

(declare-fun b_lambda!22325 () Bool)

(assert (=> (not b_lambda!22325) (not b!1223197)))

(assert (=> b!1223197 t!40310))

(declare-fun b_and!44005 () Bool)

(assert (= b_and!44003 (and (=> t!40310 result!22969) b_and!44005)))

(declare-fun m!1127709 () Bool)

(assert (=> bm!60730 m!1127709))

(declare-fun m!1127711 () Bool)

(assert (=> b!1223190 m!1127711))

(assert (=> b!1223190 m!1127711))

(declare-fun m!1127713 () Bool)

(assert (=> b!1223190 m!1127713))

(assert (=> b!1223197 m!1127711))

(assert (=> b!1223197 m!1127711))

(declare-fun m!1127715 () Bool)

(assert (=> b!1223197 m!1127715))

(declare-fun m!1127717 () Bool)

(assert (=> b!1223197 m!1127717))

(assert (=> b!1223197 m!1127551))

(declare-fun m!1127719 () Bool)

(assert (=> b!1223197 m!1127719))

(assert (=> b!1223197 m!1127717))

(assert (=> b!1223197 m!1127551))

(assert (=> b!1223194 m!1127711))

(assert (=> b!1223194 m!1127711))

(declare-fun m!1127721 () Bool)

(assert (=> b!1223194 m!1127721))

(assert (=> b!1223189 m!1127709))

(declare-fun m!1127723 () Bool)

(assert (=> b!1223196 m!1127723))

(assert (=> b!1223191 m!1127711))

(declare-fun m!1127725 () Bool)

(assert (=> b!1223191 m!1127725))

(declare-fun m!1127727 () Bool)

(assert (=> b!1223191 m!1127727))

(declare-fun m!1127729 () Bool)

(assert (=> b!1223191 m!1127729))

(assert (=> b!1223191 m!1127717))

(assert (=> b!1223191 m!1127551))

(assert (=> b!1223191 m!1127719))

(assert (=> b!1223191 m!1127727))

(assert (=> b!1223191 m!1127717))

(assert (=> b!1223191 m!1127551))

(declare-fun m!1127731 () Bool)

(assert (=> b!1223191 m!1127731))

(declare-fun m!1127733 () Bool)

(assert (=> d!133789 m!1127733))

(assert (=> d!133789 m!1127489))

(declare-fun m!1127735 () Bool)

(assert (=> b!1223192 m!1127735))

(assert (=> b!1223186 m!1127711))

(assert (=> b!1223186 m!1127711))

(assert (=> b!1223186 m!1127721))

(assert (=> b!1223010 d!133789))

(declare-fun d!133791 () Bool)

(assert (=> d!133791 (= (validKeyInArray!0 (select (arr!38067 _keys!1208) from!1455)) (and (not (= (select (arr!38067 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38067 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1223010 d!133791))

(declare-fun e!694686 () Bool)

(declare-fun call!60738 () ListLongMap!18145)

(declare-fun call!60739 () ListLongMap!18145)

(declare-fun b!1223204 () Bool)

(assert (=> b!1223204 (= e!694686 (= call!60739 (-!1911 call!60738 k0!934)))))

(assert (=> b!1223204 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38606 _values!996)))))

(declare-fun b!1223205 () Bool)

(assert (=> b!1223205 (= e!694686 (= call!60739 call!60738))))

(assert (=> b!1223205 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38606 _values!996)))))

(declare-fun bm!60736 () Bool)

(assert (=> bm!60736 (= call!60739 (getCurrentListMapNoExtraKeys!5520 (array!78879 (store (arr!38067 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38605 _keys!1208)) (array!78881 (store (arr!38068 _values!996) i!673 (ValueCellFull!14834 (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38606 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223206 () Bool)

(declare-fun e!694687 () Bool)

(assert (=> b!1223206 (= e!694687 e!694686)))

(declare-fun c!120359 () Bool)

(assert (=> b!1223206 (= c!120359 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!133793 () Bool)

(assert (=> d!133793 e!694687))

(declare-fun res!812756 () Bool)

(assert (=> d!133793 (=> (not res!812756) (not e!694687))))

(assert (=> d!133793 (= res!812756 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38605 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38605 _keys!1208))))))))

(declare-fun lt!556578 () Unit!40358)

(declare-fun choose!1836 (array!78878 array!78880 (_ BitVec 32) (_ BitVec 32) V!46577 V!46577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40358)

(assert (=> d!133793 (= lt!556578 (choose!1836 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133793 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 _keys!1208)))))

(assert (=> d!133793 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1146 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556578)))

(declare-fun bm!60735 () Bool)

(assert (=> bm!60735 (= call!60738 (getCurrentListMapNoExtraKeys!5520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133793 res!812756) b!1223206))

(assert (= (and b!1223206 c!120359) b!1223204))

(assert (= (and b!1223206 (not c!120359)) b!1223205))

(assert (= (or b!1223204 b!1223205) bm!60735))

(assert (= (or b!1223204 b!1223205) bm!60736))

(declare-fun b_lambda!22327 () Bool)

(assert (=> (not b_lambda!22327) (not bm!60736)))

(assert (=> bm!60736 t!40310))

(declare-fun b_and!44007 () Bool)

(assert (= b_and!44005 (and (=> t!40310 result!22969) b_and!44007)))

(declare-fun m!1127737 () Bool)

(assert (=> b!1223204 m!1127737))

(assert (=> bm!60736 m!1127493))

(assert (=> bm!60736 m!1127551))

(declare-fun m!1127739 () Bool)

(assert (=> bm!60736 m!1127739))

(declare-fun m!1127741 () Bool)

(assert (=> bm!60736 m!1127741))

(declare-fun m!1127743 () Bool)

(assert (=> d!133793 m!1127743))

(assert (=> bm!60735 m!1127535))

(assert (=> b!1223010 d!133793))

(declare-fun d!133795 () Bool)

(declare-fun lt!556581 () ListLongMap!18145)

(assert (=> d!133795 (not (contains!7007 lt!556581 k0!934))))

(declare-fun removeStrictlySorted!110 (List!26957 (_ BitVec 64)) List!26957)

(assert (=> d!133795 (= lt!556581 (ListLongMap!18146 (removeStrictlySorted!110 (toList!9088 lt!556439) k0!934)))))

(assert (=> d!133795 (= (-!1911 lt!556439 k0!934) lt!556581)))

(declare-fun bs!34386 () Bool)

(assert (= bs!34386 d!133795))

(declare-fun m!1127745 () Bool)

(assert (=> bs!34386 m!1127745))

(declare-fun m!1127747 () Bool)

(assert (=> bs!34386 m!1127747))

(assert (=> b!1223010 d!133795))

(declare-fun b!1223207 () Bool)

(declare-fun e!694690 () ListLongMap!18145)

(declare-fun e!694688 () ListLongMap!18145)

(assert (=> b!1223207 (= e!694690 e!694688)))

(declare-fun c!120362 () Bool)

(assert (=> b!1223207 (= c!120362 (validKeyInArray!0 (select (arr!38067 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1223208 () Bool)

(declare-fun e!694689 () Bool)

(declare-fun e!694693 () Bool)

(assert (=> b!1223208 (= e!694689 e!694693)))

(declare-fun c!120360 () Bool)

(declare-fun e!694691 () Bool)

(assert (=> b!1223208 (= c!120360 e!694691)))

(declare-fun res!812758 () Bool)

(assert (=> b!1223208 (=> (not res!812758) (not e!694691))))

(assert (=> b!1223208 (= res!812758 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 _keys!1208)))))

(declare-fun call!60740 () ListLongMap!18145)

(declare-fun bm!60737 () Bool)

(assert (=> bm!60737 (= call!60740 (getCurrentListMapNoExtraKeys!5520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1223209 () Bool)

(assert (=> b!1223209 (= e!694690 (ListLongMap!18146 Nil!26954))))

(declare-fun lt!556586 () ListLongMap!18145)

(declare-fun b!1223210 () Bool)

(declare-fun e!694694 () Bool)

(assert (=> b!1223210 (= e!694694 (= lt!556586 (getCurrentListMapNoExtraKeys!5520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1223212 () Bool)

(declare-fun lt!556587 () Unit!40358)

(declare-fun lt!556582 () Unit!40358)

(assert (=> b!1223212 (= lt!556587 lt!556582)))

(declare-fun lt!556584 () V!46577)

(declare-fun lt!556588 () (_ BitVec 64))

(declare-fun lt!556585 () ListLongMap!18145)

(declare-fun lt!556583 () (_ BitVec 64))

(assert (=> b!1223212 (not (contains!7007 (+!4150 lt!556585 (tuple2!20177 lt!556583 lt!556584)) lt!556588))))

(assert (=> b!1223212 (= lt!556582 (addStillNotContains!306 lt!556585 lt!556583 lt!556584 lt!556588))))

(assert (=> b!1223212 (= lt!556588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1223212 (= lt!556584 (get!19451 (select (arr!38068 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1223212 (= lt!556583 (select (arr!38067 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223212 (= lt!556585 call!60740)))

(assert (=> b!1223212 (= e!694688 (+!4150 call!60740 (tuple2!20177 (select (arr!38067 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19451 (select (arr!38068 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1223213 () Bool)

(assert (=> b!1223213 (= e!694694 (isEmpty!1006 lt!556586))))

(declare-fun b!1223214 () Bool)

(assert (=> b!1223214 (= e!694693 e!694694)))

(declare-fun c!120361 () Bool)

(assert (=> b!1223214 (= c!120361 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 _keys!1208)))))

(declare-fun b!1223215 () Bool)

(assert (=> b!1223215 (= e!694691 (validKeyInArray!0 (select (arr!38067 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1223215 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1223211 () Bool)

(declare-fun e!694692 () Bool)

(assert (=> b!1223211 (= e!694693 e!694692)))

(assert (=> b!1223211 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 _keys!1208)))))

(declare-fun res!812757 () Bool)

(assert (=> b!1223211 (= res!812757 (contains!7007 lt!556586 (select (arr!38067 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1223211 (=> (not res!812757) (not e!694692))))

(declare-fun d!133797 () Bool)

(assert (=> d!133797 e!694689))

(declare-fun res!812760 () Bool)

(assert (=> d!133797 (=> (not res!812760) (not e!694689))))

(assert (=> d!133797 (= res!812760 (not (contains!7007 lt!556586 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133797 (= lt!556586 e!694690)))

(declare-fun c!120363 () Bool)

(assert (=> d!133797 (= c!120363 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 _keys!1208)))))

(assert (=> d!133797 (validMask!0 mask!1564)))

(assert (=> d!133797 (= (getCurrentListMapNoExtraKeys!5520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!556586)))

(declare-fun b!1223216 () Bool)

(assert (=> b!1223216 (= e!694688 call!60740)))

(declare-fun b!1223217 () Bool)

(declare-fun res!812759 () Bool)

(assert (=> b!1223217 (=> (not res!812759) (not e!694689))))

(assert (=> b!1223217 (= res!812759 (not (contains!7007 lt!556586 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1223218 () Bool)

(assert (=> b!1223218 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38605 _keys!1208)))))

(assert (=> b!1223218 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38606 _values!996)))))

(assert (=> b!1223218 (= e!694692 (= (apply!970 lt!556586 (select (arr!38067 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19451 (select (arr!38068 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133797 c!120363) b!1223209))

(assert (= (and d!133797 (not c!120363)) b!1223207))

(assert (= (and b!1223207 c!120362) b!1223212))

(assert (= (and b!1223207 (not c!120362)) b!1223216))

(assert (= (or b!1223212 b!1223216) bm!60737))

(assert (= (and d!133797 res!812760) b!1223217))

(assert (= (and b!1223217 res!812759) b!1223208))

(assert (= (and b!1223208 res!812758) b!1223215))

(assert (= (and b!1223208 c!120360) b!1223211))

(assert (= (and b!1223208 (not c!120360)) b!1223214))

(assert (= (and b!1223211 res!812757) b!1223218))

(assert (= (and b!1223214 c!120361) b!1223210))

(assert (= (and b!1223214 (not c!120361)) b!1223213))

(declare-fun b_lambda!22329 () Bool)

(assert (=> (not b_lambda!22329) (not b!1223212)))

(assert (=> b!1223212 t!40310))

(declare-fun b_and!44009 () Bool)

(assert (= b_and!44007 (and (=> t!40310 result!22969) b_and!44009)))

(declare-fun b_lambda!22331 () Bool)

(assert (=> (not b_lambda!22331) (not b!1223218)))

(assert (=> b!1223218 t!40310))

(declare-fun b_and!44011 () Bool)

(assert (= b_and!44009 (and (=> t!40310 result!22969) b_and!44011)))

(declare-fun m!1127749 () Bool)

(assert (=> bm!60737 m!1127749))

(assert (=> b!1223211 m!1127695))

(assert (=> b!1223211 m!1127695))

(declare-fun m!1127751 () Bool)

(assert (=> b!1223211 m!1127751))

(assert (=> b!1223218 m!1127695))

(assert (=> b!1223218 m!1127695))

(declare-fun m!1127753 () Bool)

(assert (=> b!1223218 m!1127753))

(declare-fun m!1127755 () Bool)

(assert (=> b!1223218 m!1127755))

(assert (=> b!1223218 m!1127551))

(declare-fun m!1127757 () Bool)

(assert (=> b!1223218 m!1127757))

(assert (=> b!1223218 m!1127755))

(assert (=> b!1223218 m!1127551))

(assert (=> b!1223215 m!1127695))

(assert (=> b!1223215 m!1127695))

(declare-fun m!1127759 () Bool)

(assert (=> b!1223215 m!1127759))

(assert (=> b!1223210 m!1127749))

(declare-fun m!1127761 () Bool)

(assert (=> b!1223217 m!1127761))

(assert (=> b!1223212 m!1127695))

(declare-fun m!1127763 () Bool)

(assert (=> b!1223212 m!1127763))

(declare-fun m!1127765 () Bool)

(assert (=> b!1223212 m!1127765))

(declare-fun m!1127767 () Bool)

(assert (=> b!1223212 m!1127767))

(assert (=> b!1223212 m!1127755))

(assert (=> b!1223212 m!1127551))

(assert (=> b!1223212 m!1127757))

(assert (=> b!1223212 m!1127765))

(assert (=> b!1223212 m!1127755))

(assert (=> b!1223212 m!1127551))

(declare-fun m!1127769 () Bool)

(assert (=> b!1223212 m!1127769))

(declare-fun m!1127771 () Bool)

(assert (=> d!133797 m!1127771))

(assert (=> d!133797 m!1127489))

(declare-fun m!1127773 () Bool)

(assert (=> b!1223213 m!1127773))

(assert (=> b!1223207 m!1127695))

(assert (=> b!1223207 m!1127695))

(assert (=> b!1223207 m!1127759))

(assert (=> b!1223010 d!133797))

(declare-fun b!1223219 () Bool)

(declare-fun e!694696 () Bool)

(declare-fun call!60741 () Bool)

(assert (=> b!1223219 (= e!694696 call!60741)))

(declare-fun bm!60738 () Bool)

(declare-fun c!120364 () Bool)

(assert (=> bm!60738 (= call!60741 (arrayNoDuplicates!0 lt!556448 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120364 (Cons!26954 (select (arr!38067 lt!556448) #b00000000000000000000000000000000) Nil!26955) Nil!26955)))))

(declare-fun d!133799 () Bool)

(declare-fun res!812762 () Bool)

(declare-fun e!694697 () Bool)

(assert (=> d!133799 (=> res!812762 e!694697)))

(assert (=> d!133799 (= res!812762 (bvsge #b00000000000000000000000000000000 (size!38605 lt!556448)))))

(assert (=> d!133799 (= (arrayNoDuplicates!0 lt!556448 #b00000000000000000000000000000000 Nil!26955) e!694697)))

(declare-fun b!1223220 () Bool)

(assert (=> b!1223220 (= e!694696 call!60741)))

(declare-fun b!1223221 () Bool)

(declare-fun e!694698 () Bool)

(assert (=> b!1223221 (= e!694698 e!694696)))

(assert (=> b!1223221 (= c!120364 (validKeyInArray!0 (select (arr!38067 lt!556448) #b00000000000000000000000000000000)))))

(declare-fun b!1223222 () Bool)

(assert (=> b!1223222 (= e!694697 e!694698)))

(declare-fun res!812763 () Bool)

(assert (=> b!1223222 (=> (not res!812763) (not e!694698))))

(declare-fun e!694695 () Bool)

(assert (=> b!1223222 (= res!812763 (not e!694695))))

(declare-fun res!812761 () Bool)

(assert (=> b!1223222 (=> (not res!812761) (not e!694695))))

(assert (=> b!1223222 (= res!812761 (validKeyInArray!0 (select (arr!38067 lt!556448) #b00000000000000000000000000000000)))))

(declare-fun b!1223223 () Bool)

(assert (=> b!1223223 (= e!694695 (contains!7006 Nil!26955 (select (arr!38067 lt!556448) #b00000000000000000000000000000000)))))

(assert (= (and d!133799 (not res!812762)) b!1223222))

(assert (= (and b!1223222 res!812761) b!1223223))

(assert (= (and b!1223222 res!812763) b!1223221))

(assert (= (and b!1223221 c!120364) b!1223219))

(assert (= (and b!1223221 (not c!120364)) b!1223220))

(assert (= (or b!1223219 b!1223220) bm!60738))

(declare-fun m!1127775 () Bool)

(assert (=> bm!60738 m!1127775))

(declare-fun m!1127777 () Bool)

(assert (=> bm!60738 m!1127777))

(assert (=> b!1223221 m!1127775))

(assert (=> b!1223221 m!1127775))

(declare-fun m!1127779 () Bool)

(assert (=> b!1223221 m!1127779))

(assert (=> b!1223222 m!1127775))

(assert (=> b!1223222 m!1127775))

(assert (=> b!1223222 m!1127779))

(assert (=> b!1223223 m!1127775))

(assert (=> b!1223223 m!1127775))

(declare-fun m!1127781 () Bool)

(assert (=> b!1223223 m!1127781))

(assert (=> b!1223009 d!133799))

(declare-fun d!133801 () Bool)

(assert (=> d!133801 (= (array_inv!29090 _keys!1208) (bvsge (size!38605 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101656 d!133801))

(declare-fun d!133803 () Bool)

(assert (=> d!133803 (= (array_inv!29091 _values!996) (bvsge (size!38606 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101656 d!133803))

(declare-fun d!133805 () Bool)

(assert (=> d!133805 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1222994 d!133805))

(declare-fun b!1223232 () Bool)

(declare-fun e!694705 () Bool)

(declare-fun call!60744 () Bool)

(assert (=> b!1223232 (= e!694705 call!60744)))

(declare-fun b!1223234 () Bool)

(declare-fun e!694706 () Bool)

(assert (=> b!1223234 (= e!694706 call!60744)))

(declare-fun b!1223235 () Bool)

(declare-fun e!694707 () Bool)

(assert (=> b!1223235 (= e!694707 e!694706)))

(declare-fun c!120367 () Bool)

(assert (=> b!1223235 (= c!120367 (validKeyInArray!0 (select (arr!38067 lt!556448) #b00000000000000000000000000000000)))))

(declare-fun bm!60741 () Bool)

(assert (=> bm!60741 (= call!60744 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!556448 mask!1564))))

(declare-fun b!1223233 () Bool)

(assert (=> b!1223233 (= e!694706 e!694705)))

(declare-fun lt!556596 () (_ BitVec 64))

(assert (=> b!1223233 (= lt!556596 (select (arr!38067 lt!556448) #b00000000000000000000000000000000))))

(declare-fun lt!556595 () Unit!40358)

(assert (=> b!1223233 (= lt!556595 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!556448 lt!556596 #b00000000000000000000000000000000))))

(assert (=> b!1223233 (arrayContainsKey!0 lt!556448 lt!556596 #b00000000000000000000000000000000)))

(declare-fun lt!556597 () Unit!40358)

(assert (=> b!1223233 (= lt!556597 lt!556595)))

(declare-fun res!812768 () Bool)

(declare-datatypes ((SeekEntryResult!9949 0))(
  ( (MissingZero!9949 (index!42167 (_ BitVec 32))) (Found!9949 (index!42168 (_ BitVec 32))) (Intermediate!9949 (undefined!10761 Bool) (index!42169 (_ BitVec 32)) (x!107704 (_ BitVec 32))) (Undefined!9949) (MissingVacant!9949 (index!42170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78878 (_ BitVec 32)) SeekEntryResult!9949)

(assert (=> b!1223233 (= res!812768 (= (seekEntryOrOpen!0 (select (arr!38067 lt!556448) #b00000000000000000000000000000000) lt!556448 mask!1564) (Found!9949 #b00000000000000000000000000000000)))))

(assert (=> b!1223233 (=> (not res!812768) (not e!694705))))

(declare-fun d!133807 () Bool)

(declare-fun res!812769 () Bool)

(assert (=> d!133807 (=> res!812769 e!694707)))

(assert (=> d!133807 (= res!812769 (bvsge #b00000000000000000000000000000000 (size!38605 lt!556448)))))

(assert (=> d!133807 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556448 mask!1564) e!694707)))

(assert (= (and d!133807 (not res!812769)) b!1223235))

(assert (= (and b!1223235 c!120367) b!1223233))

(assert (= (and b!1223235 (not c!120367)) b!1223234))

(assert (= (and b!1223233 res!812768) b!1223232))

(assert (= (or b!1223232 b!1223234) bm!60741))

(assert (=> b!1223235 m!1127775))

(assert (=> b!1223235 m!1127775))

(assert (=> b!1223235 m!1127779))

(declare-fun m!1127783 () Bool)

(assert (=> bm!60741 m!1127783))

(assert (=> b!1223233 m!1127775))

(declare-fun m!1127785 () Bool)

(assert (=> b!1223233 m!1127785))

(declare-fun m!1127787 () Bool)

(assert (=> b!1223233 m!1127787))

(assert (=> b!1223233 m!1127775))

(declare-fun m!1127789 () Bool)

(assert (=> b!1223233 m!1127789))

(assert (=> b!1222993 d!133807))

(declare-fun b!1223236 () Bool)

(declare-fun e!694709 () Bool)

(declare-fun call!60745 () Bool)

(assert (=> b!1223236 (= e!694709 call!60745)))

(declare-fun bm!60742 () Bool)

(declare-fun c!120368 () Bool)

(assert (=> bm!60742 (= call!60745 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120368 (Cons!26954 (select (arr!38067 _keys!1208) #b00000000000000000000000000000000) Nil!26955) Nil!26955)))))

(declare-fun d!133809 () Bool)

(declare-fun res!812771 () Bool)

(declare-fun e!694710 () Bool)

(assert (=> d!133809 (=> res!812771 e!694710)))

(assert (=> d!133809 (= res!812771 (bvsge #b00000000000000000000000000000000 (size!38605 _keys!1208)))))

(assert (=> d!133809 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26955) e!694710)))

(declare-fun b!1223237 () Bool)

(assert (=> b!1223237 (= e!694709 call!60745)))

(declare-fun b!1223238 () Bool)

(declare-fun e!694711 () Bool)

(assert (=> b!1223238 (= e!694711 e!694709)))

(assert (=> b!1223238 (= c!120368 (validKeyInArray!0 (select (arr!38067 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1223239 () Bool)

(assert (=> b!1223239 (= e!694710 e!694711)))

(declare-fun res!812772 () Bool)

(assert (=> b!1223239 (=> (not res!812772) (not e!694711))))

(declare-fun e!694708 () Bool)

(assert (=> b!1223239 (= res!812772 (not e!694708))))

(declare-fun res!812770 () Bool)

(assert (=> b!1223239 (=> (not res!812770) (not e!694708))))

(assert (=> b!1223239 (= res!812770 (validKeyInArray!0 (select (arr!38067 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1223240 () Bool)

(assert (=> b!1223240 (= e!694708 (contains!7006 Nil!26955 (select (arr!38067 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133809 (not res!812771)) b!1223239))

(assert (= (and b!1223239 res!812770) b!1223240))

(assert (= (and b!1223239 res!812772) b!1223238))

(assert (= (and b!1223238 c!120368) b!1223236))

(assert (= (and b!1223238 (not c!120368)) b!1223237))

(assert (= (or b!1223236 b!1223237) bm!60742))

(assert (=> bm!60742 m!1127701))

(declare-fun m!1127791 () Bool)

(assert (=> bm!60742 m!1127791))

(assert (=> b!1223238 m!1127701))

(assert (=> b!1223238 m!1127701))

(declare-fun m!1127793 () Bool)

(assert (=> b!1223238 m!1127793))

(assert (=> b!1223239 m!1127701))

(assert (=> b!1223239 m!1127701))

(assert (=> b!1223239 m!1127793))

(assert (=> b!1223240 m!1127701))

(assert (=> b!1223240 m!1127701))

(declare-fun m!1127795 () Bool)

(assert (=> b!1223240 m!1127795))

(assert (=> b!1223003 d!133809))

(declare-fun b!1223241 () Bool)

(declare-fun e!694714 () ListLongMap!18145)

(declare-fun e!694712 () ListLongMap!18145)

(assert (=> b!1223241 (= e!694714 e!694712)))

(declare-fun c!120371 () Bool)

(assert (=> b!1223241 (= c!120371 (validKeyInArray!0 (select (arr!38067 lt!556448) from!1455)))))

(declare-fun b!1223242 () Bool)

(declare-fun e!694713 () Bool)

(declare-fun e!694717 () Bool)

(assert (=> b!1223242 (= e!694713 e!694717)))

(declare-fun c!120369 () Bool)

(declare-fun e!694715 () Bool)

(assert (=> b!1223242 (= c!120369 e!694715)))

(declare-fun res!812774 () Bool)

(assert (=> b!1223242 (=> (not res!812774) (not e!694715))))

(assert (=> b!1223242 (= res!812774 (bvslt from!1455 (size!38605 lt!556448)))))

(declare-fun bm!60743 () Bool)

(declare-fun call!60746 () ListLongMap!18145)

(assert (=> bm!60743 (= call!60746 (getCurrentListMapNoExtraKeys!5520 lt!556448 lt!556442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1223243 () Bool)

(assert (=> b!1223243 (= e!694714 (ListLongMap!18146 Nil!26954))))

(declare-fun b!1223244 () Bool)

(declare-fun e!694718 () Bool)

(declare-fun lt!556602 () ListLongMap!18145)

(assert (=> b!1223244 (= e!694718 (= lt!556602 (getCurrentListMapNoExtraKeys!5520 lt!556448 lt!556442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1223246 () Bool)

(declare-fun lt!556603 () Unit!40358)

(declare-fun lt!556598 () Unit!40358)

(assert (=> b!1223246 (= lt!556603 lt!556598)))

(declare-fun lt!556601 () ListLongMap!18145)

(declare-fun lt!556604 () (_ BitVec 64))

(declare-fun lt!556600 () V!46577)

(declare-fun lt!556599 () (_ BitVec 64))

(assert (=> b!1223246 (not (contains!7007 (+!4150 lt!556601 (tuple2!20177 lt!556599 lt!556600)) lt!556604))))

(assert (=> b!1223246 (= lt!556598 (addStillNotContains!306 lt!556601 lt!556599 lt!556600 lt!556604))))

(assert (=> b!1223246 (= lt!556604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1223246 (= lt!556600 (get!19451 (select (arr!38068 lt!556442) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1223246 (= lt!556599 (select (arr!38067 lt!556448) from!1455))))

(assert (=> b!1223246 (= lt!556601 call!60746)))

(assert (=> b!1223246 (= e!694712 (+!4150 call!60746 (tuple2!20177 (select (arr!38067 lt!556448) from!1455) (get!19451 (select (arr!38068 lt!556442) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1223247 () Bool)

(assert (=> b!1223247 (= e!694718 (isEmpty!1006 lt!556602))))

(declare-fun b!1223248 () Bool)

(assert (=> b!1223248 (= e!694717 e!694718)))

(declare-fun c!120370 () Bool)

(assert (=> b!1223248 (= c!120370 (bvslt from!1455 (size!38605 lt!556448)))))

(declare-fun b!1223249 () Bool)

(assert (=> b!1223249 (= e!694715 (validKeyInArray!0 (select (arr!38067 lt!556448) from!1455)))))

(assert (=> b!1223249 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1223245 () Bool)

(declare-fun e!694716 () Bool)

(assert (=> b!1223245 (= e!694717 e!694716)))

(assert (=> b!1223245 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38605 lt!556448)))))

(declare-fun res!812773 () Bool)

(assert (=> b!1223245 (= res!812773 (contains!7007 lt!556602 (select (arr!38067 lt!556448) from!1455)))))

(assert (=> b!1223245 (=> (not res!812773) (not e!694716))))

(declare-fun d!133811 () Bool)

(assert (=> d!133811 e!694713))

(declare-fun res!812776 () Bool)

(assert (=> d!133811 (=> (not res!812776) (not e!694713))))

(assert (=> d!133811 (= res!812776 (not (contains!7007 lt!556602 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133811 (= lt!556602 e!694714)))

(declare-fun c!120372 () Bool)

(assert (=> d!133811 (= c!120372 (bvsge from!1455 (size!38605 lt!556448)))))

(assert (=> d!133811 (validMask!0 mask!1564)))

(assert (=> d!133811 (= (getCurrentListMapNoExtraKeys!5520 lt!556448 lt!556442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!556602)))

(declare-fun b!1223250 () Bool)

(assert (=> b!1223250 (= e!694712 call!60746)))

(declare-fun b!1223251 () Bool)

(declare-fun res!812775 () Bool)

(assert (=> b!1223251 (=> (not res!812775) (not e!694713))))

(assert (=> b!1223251 (= res!812775 (not (contains!7007 lt!556602 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1223252 () Bool)

(assert (=> b!1223252 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38605 lt!556448)))))

(assert (=> b!1223252 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38606 lt!556442)))))

(assert (=> b!1223252 (= e!694716 (= (apply!970 lt!556602 (select (arr!38067 lt!556448) from!1455)) (get!19451 (select (arr!38068 lt!556442) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133811 c!120372) b!1223243))

(assert (= (and d!133811 (not c!120372)) b!1223241))

(assert (= (and b!1223241 c!120371) b!1223246))

(assert (= (and b!1223241 (not c!120371)) b!1223250))

(assert (= (or b!1223246 b!1223250) bm!60743))

(assert (= (and d!133811 res!812776) b!1223251))

(assert (= (and b!1223251 res!812775) b!1223242))

(assert (= (and b!1223242 res!812774) b!1223249))

(assert (= (and b!1223242 c!120369) b!1223245))

(assert (= (and b!1223242 (not c!120369)) b!1223248))

(assert (= (and b!1223245 res!812773) b!1223252))

(assert (= (and b!1223248 c!120370) b!1223244))

(assert (= (and b!1223248 (not c!120370)) b!1223247))

(declare-fun b_lambda!22333 () Bool)

(assert (=> (not b_lambda!22333) (not b!1223246)))

(assert (=> b!1223246 t!40310))

(declare-fun b_and!44013 () Bool)

(assert (= b_and!44011 (and (=> t!40310 result!22969) b_and!44013)))

(declare-fun b_lambda!22335 () Bool)

(assert (=> (not b_lambda!22335) (not b!1223252)))

(assert (=> b!1223252 t!40310))

(declare-fun b_and!44015 () Bool)

(assert (= b_and!44013 (and (=> t!40310 result!22969) b_and!44015)))

(declare-fun m!1127797 () Bool)

(assert (=> bm!60743 m!1127797))

(declare-fun m!1127799 () Bool)

(assert (=> b!1223245 m!1127799))

(assert (=> b!1223245 m!1127799))

(declare-fun m!1127801 () Bool)

(assert (=> b!1223245 m!1127801))

(assert (=> b!1223252 m!1127799))

(assert (=> b!1223252 m!1127799))

(declare-fun m!1127803 () Bool)

(assert (=> b!1223252 m!1127803))

(declare-fun m!1127805 () Bool)

(assert (=> b!1223252 m!1127805))

(assert (=> b!1223252 m!1127551))

(declare-fun m!1127807 () Bool)

(assert (=> b!1223252 m!1127807))

(assert (=> b!1223252 m!1127805))

(assert (=> b!1223252 m!1127551))

(assert (=> b!1223249 m!1127799))

(assert (=> b!1223249 m!1127799))

(declare-fun m!1127809 () Bool)

(assert (=> b!1223249 m!1127809))

(assert (=> b!1223244 m!1127797))

(declare-fun m!1127811 () Bool)

(assert (=> b!1223251 m!1127811))

(assert (=> b!1223246 m!1127799))

(declare-fun m!1127813 () Bool)

(assert (=> b!1223246 m!1127813))

(declare-fun m!1127815 () Bool)

(assert (=> b!1223246 m!1127815))

(declare-fun m!1127817 () Bool)

(assert (=> b!1223246 m!1127817))

(assert (=> b!1223246 m!1127805))

(assert (=> b!1223246 m!1127551))

(assert (=> b!1223246 m!1127807))

(assert (=> b!1223246 m!1127815))

(assert (=> b!1223246 m!1127805))

(assert (=> b!1223246 m!1127551))

(declare-fun m!1127819 () Bool)

(assert (=> b!1223246 m!1127819))

(declare-fun m!1127821 () Bool)

(assert (=> d!133811 m!1127821))

(assert (=> d!133811 m!1127489))

(declare-fun m!1127823 () Bool)

(assert (=> b!1223247 m!1127823))

(assert (=> b!1223241 m!1127799))

(assert (=> b!1223241 m!1127799))

(assert (=> b!1223241 m!1127809))

(assert (=> b!1223002 d!133811))

(declare-fun b!1223253 () Bool)

(declare-fun e!694721 () ListLongMap!18145)

(declare-fun e!694719 () ListLongMap!18145)

(assert (=> b!1223253 (= e!694721 e!694719)))

(declare-fun c!120375 () Bool)

(assert (=> b!1223253 (= c!120375 (validKeyInArray!0 (select (arr!38067 _keys!1208) from!1455)))))

(declare-fun b!1223254 () Bool)

(declare-fun e!694720 () Bool)

(declare-fun e!694724 () Bool)

(assert (=> b!1223254 (= e!694720 e!694724)))

(declare-fun c!120373 () Bool)

(declare-fun e!694722 () Bool)

(assert (=> b!1223254 (= c!120373 e!694722)))

(declare-fun res!812778 () Bool)

(assert (=> b!1223254 (=> (not res!812778) (not e!694722))))

(assert (=> b!1223254 (= res!812778 (bvslt from!1455 (size!38605 _keys!1208)))))

(declare-fun call!60747 () ListLongMap!18145)

(declare-fun bm!60744 () Bool)

(assert (=> bm!60744 (= call!60747 (getCurrentListMapNoExtraKeys!5520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1223255 () Bool)

(assert (=> b!1223255 (= e!694721 (ListLongMap!18146 Nil!26954))))

(declare-fun e!694725 () Bool)

(declare-fun b!1223256 () Bool)

(declare-fun lt!556609 () ListLongMap!18145)

(assert (=> b!1223256 (= e!694725 (= lt!556609 (getCurrentListMapNoExtraKeys!5520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1223258 () Bool)

(declare-fun lt!556610 () Unit!40358)

(declare-fun lt!556605 () Unit!40358)

(assert (=> b!1223258 (= lt!556610 lt!556605)))

(declare-fun lt!556606 () (_ BitVec 64))

(declare-fun lt!556611 () (_ BitVec 64))

(declare-fun lt!556608 () ListLongMap!18145)

(declare-fun lt!556607 () V!46577)

(assert (=> b!1223258 (not (contains!7007 (+!4150 lt!556608 (tuple2!20177 lt!556606 lt!556607)) lt!556611))))

(assert (=> b!1223258 (= lt!556605 (addStillNotContains!306 lt!556608 lt!556606 lt!556607 lt!556611))))

(assert (=> b!1223258 (= lt!556611 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1223258 (= lt!556607 (get!19451 (select (arr!38068 _values!996) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1223258 (= lt!556606 (select (arr!38067 _keys!1208) from!1455))))

(assert (=> b!1223258 (= lt!556608 call!60747)))

(assert (=> b!1223258 (= e!694719 (+!4150 call!60747 (tuple2!20177 (select (arr!38067 _keys!1208) from!1455) (get!19451 (select (arr!38068 _values!996) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1223259 () Bool)

(assert (=> b!1223259 (= e!694725 (isEmpty!1006 lt!556609))))

(declare-fun b!1223260 () Bool)

(assert (=> b!1223260 (= e!694724 e!694725)))

(declare-fun c!120374 () Bool)

(assert (=> b!1223260 (= c!120374 (bvslt from!1455 (size!38605 _keys!1208)))))

(declare-fun b!1223261 () Bool)

(assert (=> b!1223261 (= e!694722 (validKeyInArray!0 (select (arr!38067 _keys!1208) from!1455)))))

(assert (=> b!1223261 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1223257 () Bool)

(declare-fun e!694723 () Bool)

(assert (=> b!1223257 (= e!694724 e!694723)))

(assert (=> b!1223257 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38605 _keys!1208)))))

(declare-fun res!812777 () Bool)

(assert (=> b!1223257 (= res!812777 (contains!7007 lt!556609 (select (arr!38067 _keys!1208) from!1455)))))

(assert (=> b!1223257 (=> (not res!812777) (not e!694723))))

(declare-fun d!133813 () Bool)

(assert (=> d!133813 e!694720))

(declare-fun res!812780 () Bool)

(assert (=> d!133813 (=> (not res!812780) (not e!694720))))

(assert (=> d!133813 (= res!812780 (not (contains!7007 lt!556609 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133813 (= lt!556609 e!694721)))

(declare-fun c!120376 () Bool)

(assert (=> d!133813 (= c!120376 (bvsge from!1455 (size!38605 _keys!1208)))))

(assert (=> d!133813 (validMask!0 mask!1564)))

(assert (=> d!133813 (= (getCurrentListMapNoExtraKeys!5520 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!556609)))

(declare-fun b!1223262 () Bool)

(assert (=> b!1223262 (= e!694719 call!60747)))

(declare-fun b!1223263 () Bool)

(declare-fun res!812779 () Bool)

(assert (=> b!1223263 (=> (not res!812779) (not e!694720))))

(assert (=> b!1223263 (= res!812779 (not (contains!7007 lt!556609 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1223264 () Bool)

(assert (=> b!1223264 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38605 _keys!1208)))))

(assert (=> b!1223264 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38606 _values!996)))))

(assert (=> b!1223264 (= e!694723 (= (apply!970 lt!556609 (select (arr!38067 _keys!1208) from!1455)) (get!19451 (select (arr!38068 _values!996) from!1455) (dynLambda!3368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133813 c!120376) b!1223255))

(assert (= (and d!133813 (not c!120376)) b!1223253))

(assert (= (and b!1223253 c!120375) b!1223258))

(assert (= (and b!1223253 (not c!120375)) b!1223262))

(assert (= (or b!1223258 b!1223262) bm!60744))

(assert (= (and d!133813 res!812780) b!1223263))

(assert (= (and b!1223263 res!812779) b!1223254))

(assert (= (and b!1223254 res!812778) b!1223261))

(assert (= (and b!1223254 c!120373) b!1223257))

(assert (= (and b!1223254 (not c!120373)) b!1223260))

(assert (= (and b!1223257 res!812777) b!1223264))

(assert (= (and b!1223260 c!120374) b!1223256))

(assert (= (and b!1223260 (not c!120374)) b!1223259))

(declare-fun b_lambda!22337 () Bool)

(assert (=> (not b_lambda!22337) (not b!1223258)))

(assert (=> b!1223258 t!40310))

(declare-fun b_and!44017 () Bool)

(assert (= b_and!44015 (and (=> t!40310 result!22969) b_and!44017)))

(declare-fun b_lambda!22339 () Bool)

(assert (=> (not b_lambda!22339) (not b!1223264)))

(assert (=> b!1223264 t!40310))

(declare-fun b_and!44019 () Bool)

(assert (= b_and!44017 (and (=> t!40310 result!22969) b_and!44019)))

(declare-fun m!1127825 () Bool)

(assert (=> bm!60744 m!1127825))

(assert (=> b!1223257 m!1127513))

(assert (=> b!1223257 m!1127513))

(declare-fun m!1127827 () Bool)

(assert (=> b!1223257 m!1127827))

(assert (=> b!1223264 m!1127513))

(assert (=> b!1223264 m!1127513))

(declare-fun m!1127829 () Bool)

(assert (=> b!1223264 m!1127829))

(assert (=> b!1223264 m!1127505))

(assert (=> b!1223264 m!1127551))

(declare-fun m!1127831 () Bool)

(assert (=> b!1223264 m!1127831))

(assert (=> b!1223264 m!1127505))

(assert (=> b!1223264 m!1127551))

(assert (=> b!1223261 m!1127513))

(assert (=> b!1223261 m!1127513))

(assert (=> b!1223261 m!1127541))

(assert (=> b!1223256 m!1127825))

(declare-fun m!1127833 () Bool)

(assert (=> b!1223263 m!1127833))

(assert (=> b!1223258 m!1127513))

(declare-fun m!1127835 () Bool)

(assert (=> b!1223258 m!1127835))

(declare-fun m!1127837 () Bool)

(assert (=> b!1223258 m!1127837))

(declare-fun m!1127839 () Bool)

(assert (=> b!1223258 m!1127839))

(assert (=> b!1223258 m!1127505))

(assert (=> b!1223258 m!1127551))

(assert (=> b!1223258 m!1127831))

(assert (=> b!1223258 m!1127837))

(assert (=> b!1223258 m!1127505))

(assert (=> b!1223258 m!1127551))

(declare-fun m!1127841 () Bool)

(assert (=> b!1223258 m!1127841))

(declare-fun m!1127843 () Bool)

(assert (=> d!133813 m!1127843))

(assert (=> d!133813 m!1127489))

(declare-fun m!1127845 () Bool)

(assert (=> b!1223259 m!1127845))

(assert (=> b!1223253 m!1127513))

(assert (=> b!1223253 m!1127513))

(assert (=> b!1223253 m!1127541))

(assert (=> b!1223002 d!133813))

(declare-fun d!133815 () Bool)

(declare-fun e!694728 () Bool)

(assert (=> d!133815 e!694728))

(declare-fun res!812786 () Bool)

(assert (=> d!133815 (=> (not res!812786) (not e!694728))))

(declare-fun lt!556620 () ListLongMap!18145)

(assert (=> d!133815 (= res!812786 (contains!7007 lt!556620 (_1!10099 lt!556445)))))

(declare-fun lt!556623 () List!26957)

(assert (=> d!133815 (= lt!556620 (ListLongMap!18146 lt!556623))))

(declare-fun lt!556621 () Unit!40358)

(declare-fun lt!556622 () Unit!40358)

(assert (=> d!133815 (= lt!556621 lt!556622)))

(declare-datatypes ((Option!701 0))(
  ( (Some!700 (v!18263 V!46577)) (None!699) )
))
(declare-fun getValueByKey!650 (List!26957 (_ BitVec 64)) Option!701)

(assert (=> d!133815 (= (getValueByKey!650 lt!556623 (_1!10099 lt!556445)) (Some!700 (_2!10099 lt!556445)))))

(declare-fun lemmaContainsTupThenGetReturnValue!326 (List!26957 (_ BitVec 64) V!46577) Unit!40358)

(assert (=> d!133815 (= lt!556622 (lemmaContainsTupThenGetReturnValue!326 lt!556623 (_1!10099 lt!556445) (_2!10099 lt!556445)))))

(declare-fun insertStrictlySorted!419 (List!26957 (_ BitVec 64) V!46577) List!26957)

(assert (=> d!133815 (= lt!556623 (insertStrictlySorted!419 (toList!9088 lt!556439) (_1!10099 lt!556445) (_2!10099 lt!556445)))))

(assert (=> d!133815 (= (+!4150 lt!556439 lt!556445) lt!556620)))

(declare-fun b!1223269 () Bool)

(declare-fun res!812785 () Bool)

(assert (=> b!1223269 (=> (not res!812785) (not e!694728))))

(assert (=> b!1223269 (= res!812785 (= (getValueByKey!650 (toList!9088 lt!556620) (_1!10099 lt!556445)) (Some!700 (_2!10099 lt!556445))))))

(declare-fun b!1223270 () Bool)

(declare-fun contains!7008 (List!26957 tuple2!20176) Bool)

(assert (=> b!1223270 (= e!694728 (contains!7008 (toList!9088 lt!556620) lt!556445))))

(assert (= (and d!133815 res!812786) b!1223269))

(assert (= (and b!1223269 res!812785) b!1223270))

(declare-fun m!1127847 () Bool)

(assert (=> d!133815 m!1127847))

(declare-fun m!1127849 () Bool)

(assert (=> d!133815 m!1127849))

(declare-fun m!1127851 () Bool)

(assert (=> d!133815 m!1127851))

(declare-fun m!1127853 () Bool)

(assert (=> d!133815 m!1127853))

(declare-fun m!1127855 () Bool)

(assert (=> b!1223269 m!1127855))

(declare-fun m!1127857 () Bool)

(assert (=> b!1223270 m!1127857))

(assert (=> b!1222996 d!133815))

(declare-fun d!133817 () Bool)

(declare-fun e!694729 () Bool)

(assert (=> d!133817 e!694729))

(declare-fun res!812788 () Bool)

(assert (=> d!133817 (=> (not res!812788) (not e!694729))))

(declare-fun lt!556624 () ListLongMap!18145)

(assert (=> d!133817 (= res!812788 (contains!7007 lt!556624 (_1!10099 lt!556445)))))

(declare-fun lt!556627 () List!26957)

(assert (=> d!133817 (= lt!556624 (ListLongMap!18146 lt!556627))))

(declare-fun lt!556625 () Unit!40358)

(declare-fun lt!556626 () Unit!40358)

(assert (=> d!133817 (= lt!556625 lt!556626)))

(assert (=> d!133817 (= (getValueByKey!650 lt!556627 (_1!10099 lt!556445)) (Some!700 (_2!10099 lt!556445)))))

(assert (=> d!133817 (= lt!556626 (lemmaContainsTupThenGetReturnValue!326 lt!556627 (_1!10099 lt!556445) (_2!10099 lt!556445)))))

(assert (=> d!133817 (= lt!556627 (insertStrictlySorted!419 (toList!9088 lt!556451) (_1!10099 lt!556445) (_2!10099 lt!556445)))))

(assert (=> d!133817 (= (+!4150 lt!556451 lt!556445) lt!556624)))

(declare-fun b!1223271 () Bool)

(declare-fun res!812787 () Bool)

(assert (=> b!1223271 (=> (not res!812787) (not e!694729))))

(assert (=> b!1223271 (= res!812787 (= (getValueByKey!650 (toList!9088 lt!556624) (_1!10099 lt!556445)) (Some!700 (_2!10099 lt!556445))))))

(declare-fun b!1223272 () Bool)

(assert (=> b!1223272 (= e!694729 (contains!7008 (toList!9088 lt!556624) lt!556445))))

(assert (= (and d!133817 res!812788) b!1223271))

(assert (= (and b!1223271 res!812787) b!1223272))

(declare-fun m!1127859 () Bool)

(assert (=> d!133817 m!1127859))

(declare-fun m!1127861 () Bool)

(assert (=> d!133817 m!1127861))

(declare-fun m!1127863 () Bool)

(assert (=> d!133817 m!1127863))

(declare-fun m!1127865 () Bool)

(assert (=> d!133817 m!1127865))

(declare-fun m!1127867 () Bool)

(assert (=> b!1223271 m!1127867))

(declare-fun m!1127869 () Bool)

(assert (=> b!1223272 m!1127869))

(assert (=> b!1222996 d!133817))

(declare-fun d!133819 () Bool)

(declare-fun c!120379 () Bool)

(assert (=> d!133819 (= c!120379 ((_ is ValueCellFull!14834) (select (arr!38068 _values!996) from!1455)))))

(declare-fun e!694732 () V!46577)

(assert (=> d!133819 (= (get!19451 (select (arr!38068 _values!996) from!1455) lt!556449) e!694732)))

(declare-fun b!1223277 () Bool)

(declare-fun get!19454 (ValueCell!14834 V!46577) V!46577)

(assert (=> b!1223277 (= e!694732 (get!19454 (select (arr!38068 _values!996) from!1455) lt!556449))))

(declare-fun b!1223278 () Bool)

(declare-fun get!19455 (ValueCell!14834 V!46577) V!46577)

(assert (=> b!1223278 (= e!694732 (get!19455 (select (arr!38068 _values!996) from!1455) lt!556449))))

(assert (= (and d!133819 c!120379) b!1223277))

(assert (= (and d!133819 (not c!120379)) b!1223278))

(assert (=> b!1223277 m!1127505))

(declare-fun m!1127871 () Bool)

(assert (=> b!1223277 m!1127871))

(assert (=> b!1223278 m!1127505))

(declare-fun m!1127873 () Bool)

(assert (=> b!1223278 m!1127873))

(assert (=> b!1222996 d!133819))

(declare-fun b!1223279 () Bool)

(declare-fun e!694733 () Bool)

(declare-fun call!60748 () Bool)

(assert (=> b!1223279 (= e!694733 call!60748)))

(declare-fun b!1223281 () Bool)

(declare-fun e!694734 () Bool)

(assert (=> b!1223281 (= e!694734 call!60748)))

(declare-fun b!1223282 () Bool)

(declare-fun e!694735 () Bool)

(assert (=> b!1223282 (= e!694735 e!694734)))

(declare-fun c!120380 () Bool)

(assert (=> b!1223282 (= c!120380 (validKeyInArray!0 (select (arr!38067 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60745 () Bool)

(assert (=> bm!60745 (= call!60748 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1223280 () Bool)

(assert (=> b!1223280 (= e!694734 e!694733)))

(declare-fun lt!556629 () (_ BitVec 64))

(assert (=> b!1223280 (= lt!556629 (select (arr!38067 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!556628 () Unit!40358)

(assert (=> b!1223280 (= lt!556628 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!556629 #b00000000000000000000000000000000))))

(assert (=> b!1223280 (arrayContainsKey!0 _keys!1208 lt!556629 #b00000000000000000000000000000000)))

(declare-fun lt!556630 () Unit!40358)

(assert (=> b!1223280 (= lt!556630 lt!556628)))

(declare-fun res!812789 () Bool)

(assert (=> b!1223280 (= res!812789 (= (seekEntryOrOpen!0 (select (arr!38067 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9949 #b00000000000000000000000000000000)))))

(assert (=> b!1223280 (=> (not res!812789) (not e!694733))))

(declare-fun d!133821 () Bool)

(declare-fun res!812790 () Bool)

(assert (=> d!133821 (=> res!812790 e!694735)))

(assert (=> d!133821 (= res!812790 (bvsge #b00000000000000000000000000000000 (size!38605 _keys!1208)))))

(assert (=> d!133821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!694735)))

(assert (= (and d!133821 (not res!812790)) b!1223282))

(assert (= (and b!1223282 c!120380) b!1223280))

(assert (= (and b!1223282 (not c!120380)) b!1223281))

(assert (= (and b!1223280 res!812789) b!1223279))

(assert (= (or b!1223279 b!1223281) bm!60745))

(assert (=> b!1223282 m!1127701))

(assert (=> b!1223282 m!1127701))

(assert (=> b!1223282 m!1127793))

(declare-fun m!1127875 () Bool)

(assert (=> bm!60745 m!1127875))

(assert (=> b!1223280 m!1127701))

(declare-fun m!1127877 () Bool)

(assert (=> b!1223280 m!1127877))

(declare-fun m!1127879 () Bool)

(assert (=> b!1223280 m!1127879))

(assert (=> b!1223280 m!1127701))

(declare-fun m!1127881 () Bool)

(assert (=> b!1223280 m!1127881))

(assert (=> b!1223004 d!133821))

(declare-fun condMapEmpty!48535 () Bool)

(declare-fun mapDefault!48535 () ValueCell!14834)

(assert (=> mapNonEmpty!48526 (= condMapEmpty!48535 (= mapRest!48526 ((as const (Array (_ BitVec 32) ValueCell!14834)) mapDefault!48535)))))

(declare-fun e!694740 () Bool)

(declare-fun mapRes!48535 () Bool)

(assert (=> mapNonEmpty!48526 (= tp!92191 (and e!694740 mapRes!48535))))

(declare-fun b!1223290 () Bool)

(assert (=> b!1223290 (= e!694740 tp_is_empty!31087)))

(declare-fun mapIsEmpty!48535 () Bool)

(assert (=> mapIsEmpty!48535 mapRes!48535))

(declare-fun b!1223289 () Bool)

(declare-fun e!694741 () Bool)

(assert (=> b!1223289 (= e!694741 tp_is_empty!31087)))

(declare-fun mapNonEmpty!48535 () Bool)

(declare-fun tp!92207 () Bool)

(assert (=> mapNonEmpty!48535 (= mapRes!48535 (and tp!92207 e!694741))))

(declare-fun mapValue!48535 () ValueCell!14834)

(declare-fun mapKey!48535 () (_ BitVec 32))

(declare-fun mapRest!48535 () (Array (_ BitVec 32) ValueCell!14834))

(assert (=> mapNonEmpty!48535 (= mapRest!48526 (store mapRest!48535 mapKey!48535 mapValue!48535))))

(assert (= (and mapNonEmpty!48526 condMapEmpty!48535) mapIsEmpty!48535))

(assert (= (and mapNonEmpty!48526 (not condMapEmpty!48535)) mapNonEmpty!48535))

(assert (= (and mapNonEmpty!48535 ((_ is ValueCellFull!14834) mapValue!48535)) b!1223289))

(assert (= (and mapNonEmpty!48526 ((_ is ValueCellFull!14834) mapDefault!48535)) b!1223290))

(declare-fun m!1127883 () Bool)

(assert (=> mapNonEmpty!48535 m!1127883))

(declare-fun b_lambda!22341 () Bool)

(assert (= b_lambda!22331 (or (and start!101656 b_free!26383) b_lambda!22341)))

(declare-fun b_lambda!22343 () Bool)

(assert (= b_lambda!22329 (or (and start!101656 b_free!26383) b_lambda!22343)))

(declare-fun b_lambda!22345 () Bool)

(assert (= b_lambda!22327 (or (and start!101656 b_free!26383) b_lambda!22345)))

(declare-fun b_lambda!22347 () Bool)

(assert (= b_lambda!22323 (or (and start!101656 b_free!26383) b_lambda!22347)))

(declare-fun b_lambda!22349 () Bool)

(assert (= b_lambda!22339 (or (and start!101656 b_free!26383) b_lambda!22349)))

(declare-fun b_lambda!22351 () Bool)

(assert (= b_lambda!22337 (or (and start!101656 b_free!26383) b_lambda!22351)))

(declare-fun b_lambda!22353 () Bool)

(assert (= b_lambda!22333 (or (and start!101656 b_free!26383) b_lambda!22353)))

(declare-fun b_lambda!22355 () Bool)

(assert (= b_lambda!22335 (or (and start!101656 b_free!26383) b_lambda!22355)))

(declare-fun b_lambda!22357 () Bool)

(assert (= b_lambda!22325 (or (and start!101656 b_free!26383) b_lambda!22357)))

(check-sat (not b_lambda!22343) (not b!1223253) (not b!1223258) (not bm!60738) (not b!1223271) (not d!133795) (not b!1223150) (not b_lambda!22347) (not b!1223196) (not b!1223244) (not b!1223257) (not b_lambda!22355) (not b_lambda!22351) (not b!1223159) (not mapNonEmpty!48535) (not b_lambda!22349) (not d!133815) (not b!1223161) (not b!1223280) (not d!133789) (not bm!60727) (not bm!60743) (not b!1223261) (not bm!60736) (not b!1223264) (not b!1223210) (not b!1223251) (not b!1223272) (not b!1223192) (not d!133817) (not b!1223186) (not b!1223218) (not b!1223256) (not b!1223235) (not b!1223246) (not b!1223245) (not b_lambda!22321) (not b!1223233) (not b!1223151) (not b!1223223) (not b!1223194) (not b!1223197) (not d!133793) (not b!1223240) (not b_lambda!22341) (not b!1223252) (not b!1223259) (not b!1223247) (not d!133781) (not b!1223213) (not b_lambda!22357) (not b!1223191) (not b!1223221) tp_is_empty!31087 (not b!1223249) (not b!1223239) (not b!1223238) (not d!133813) (not d!133811) (not b!1223190) (not bm!60745) (not bm!60742) (not d!133797) (not b!1223282) (not b!1223157) (not b!1223241) (not b!1223207) (not b!1223269) (not d!133773) (not b_next!26383) (not b!1223270) (not b!1223189) (not b!1223211) b_and!44019 (not b!1223215) (not b!1223278) (not b_lambda!22353) (not bm!60737) (not bm!60741) (not d!133775) (not b!1223204) (not bm!60744) (not b_lambda!22345) (not d!133785) (not b!1223277) (not b!1223222) (not b!1223212) (not bm!60735) (not b!1223263) (not b!1223217) (not b!1223149) (not bm!60730))
(check-sat b_and!44019 (not b_next!26383))
