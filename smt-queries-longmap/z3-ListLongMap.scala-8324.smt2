; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101528 () Bool)

(assert start!101528)

(declare-fun b_free!26215 () Bool)

(declare-fun b_next!26215 () Bool)

(assert (=> start!101528 (= b_free!26215 (not b_next!26215))))

(declare-fun tp!91666 () Bool)

(declare-fun b_and!43549 () Bool)

(assert (=> start!101528 (= tp!91666 b_and!43549)))

(declare-fun b!1218367 () Bool)

(declare-fun res!808765 () Bool)

(declare-fun e!691803 () Bool)

(assert (=> b!1218367 (=> (not res!808765) (not e!691803))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78651 0))(
  ( (array!78652 (arr!37954 (Array (_ BitVec 32) (_ BitVec 64))) (size!38491 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78651)

(assert (=> b!1218367 (= res!808765 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38491 _keys!1208))))))

(declare-fun b!1218368 () Bool)

(declare-fun res!808769 () Bool)

(declare-fun e!691801 () Bool)

(assert (=> b!1218368 (=> (not res!808769) (not e!691801))))

(declare-fun lt!553625 () array!78651)

(declare-datatypes ((List!26773 0))(
  ( (Nil!26770) (Cons!26769 (h!27987 (_ BitVec 64)) (t!39960 List!26773)) )
))
(declare-fun arrayNoDuplicates!0 (array!78651 (_ BitVec 32) List!26773) Bool)

(assert (=> b!1218368 (= res!808769 (arrayNoDuplicates!0 lt!553625 #b00000000000000000000000000000000 Nil!26770))))

(declare-fun b!1218370 () Bool)

(assert (=> b!1218370 (= e!691803 e!691801)))

(declare-fun res!808771 () Bool)

(assert (=> b!1218370 (=> (not res!808771) (not e!691801))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78651 (_ BitVec 32)) Bool)

(assert (=> b!1218370 (= res!808771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553625 mask!1564))))

(assert (=> b!1218370 (= lt!553625 (array!78652 (store (arr!37954 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38491 _keys!1208)))))

(declare-fun b!1218371 () Bool)

(declare-fun e!691797 () Bool)

(declare-fun tp_is_empty!30919 () Bool)

(assert (=> b!1218371 (= e!691797 tp_is_empty!30919)))

(declare-fun b!1218372 () Bool)

(declare-fun res!808763 () Bool)

(assert (=> b!1218372 (=> (not res!808763) (not e!691803))))

(assert (=> b!1218372 (= res!808763 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26770))))

(declare-fun b!1218373 () Bool)

(declare-fun e!691802 () Bool)

(declare-fun e!691796 () Bool)

(assert (=> b!1218373 (= e!691802 e!691796)))

(declare-fun res!808764 () Bool)

(assert (=> b!1218373 (=> res!808764 e!691796)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218373 (= res!808764 (not (validKeyInArray!0 (select (arr!37954 _keys!1208) from!1455))))))

(declare-datatypes ((V!46353 0))(
  ( (V!46354 (val!15516 Int)) )
))
(declare-datatypes ((tuple2!19964 0))(
  ( (tuple2!19965 (_1!9993 (_ BitVec 64)) (_2!9993 V!46353)) )
))
(declare-datatypes ((List!26774 0))(
  ( (Nil!26771) (Cons!26770 (h!27988 tuple2!19964) (t!39961 List!26774)) )
))
(declare-datatypes ((ListLongMap!17941 0))(
  ( (ListLongMap!17942 (toList!8986 List!26774)) )
))
(declare-fun lt!553626 () ListLongMap!17941)

(declare-fun lt!553629 () ListLongMap!17941)

(assert (=> b!1218373 (= lt!553626 lt!553629)))

(declare-fun lt!553628 () ListLongMap!17941)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1877 (ListLongMap!17941 (_ BitVec 64)) ListLongMap!17941)

(assert (=> b!1218373 (= lt!553629 (-!1877 lt!553628 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46353)

(declare-fun zeroValue!944 () V!46353)

(declare-datatypes ((ValueCell!14750 0))(
  ( (ValueCellFull!14750 (v!18165 V!46353)) (EmptyCell!14750) )
))
(declare-datatypes ((array!78653 0))(
  ( (array!78654 (arr!37955 (Array (_ BitVec 32) ValueCell!14750)) (size!38492 (_ BitVec 32))) )
))
(declare-fun lt!553627 () array!78653)

(declare-fun getCurrentListMapNoExtraKeys!5443 (array!78651 array!78653 (_ BitVec 32) (_ BitVec 32) V!46353 V!46353 (_ BitVec 32) Int) ListLongMap!17941)

(assert (=> b!1218373 (= lt!553626 (getCurrentListMapNoExtraKeys!5443 lt!553625 lt!553627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78653)

(assert (=> b!1218373 (= lt!553628 (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40328 0))(
  ( (Unit!40329) )
))
(declare-fun lt!553623 () Unit!40328)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1092 (array!78651 array!78653 (_ BitVec 32) (_ BitVec 32) V!46353 V!46353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40328)

(assert (=> b!1218373 (= lt!553623 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1092 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!48253 () Bool)

(declare-fun mapRes!48253 () Bool)

(assert (=> mapIsEmpty!48253 mapRes!48253))

(declare-fun b!1218374 () Bool)

(declare-fun e!691800 () Bool)

(assert (=> b!1218374 (= e!691801 (not e!691800))))

(declare-fun res!808770 () Bool)

(assert (=> b!1218374 (=> res!808770 e!691800)))

(assert (=> b!1218374 (= res!808770 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218374 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553631 () Unit!40328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78651 (_ BitVec 64) (_ BitVec 32)) Unit!40328)

(assert (=> b!1218374 (= lt!553631 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218375 () Bool)

(declare-fun res!808760 () Bool)

(assert (=> b!1218375 (=> (not res!808760) (not e!691803))))

(assert (=> b!1218375 (= res!808760 (validKeyInArray!0 k0!934))))

(declare-fun b!1218376 () Bool)

(declare-fun res!808766 () Bool)

(assert (=> b!1218376 (=> (not res!808766) (not e!691803))))

(assert (=> b!1218376 (= res!808766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218377 () Bool)

(declare-fun e!691798 () Bool)

(assert (=> b!1218377 (= e!691798 tp_is_empty!30919)))

(declare-fun lt!553630 () V!46353)

(declare-fun lt!553624 () ListLongMap!17941)

(declare-fun b!1218378 () Bool)

(declare-fun +!4102 (ListLongMap!17941 tuple2!19964) ListLongMap!17941)

(declare-fun get!19378 (ValueCell!14750 V!46353) V!46353)

(assert (=> b!1218378 (= e!691796 (= lt!553624 (+!4102 lt!553629 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630)))))))

(declare-fun b!1218379 () Bool)

(declare-fun res!808768 () Bool)

(assert (=> b!1218379 (=> (not res!808768) (not e!691803))))

(assert (=> b!1218379 (= res!808768 (and (= (size!38492 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38491 _keys!1208) (size!38492 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!808762 () Bool)

(assert (=> start!101528 (=> (not res!808762) (not e!691803))))

(assert (=> start!101528 (= res!808762 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38491 _keys!1208))))))

(assert (=> start!101528 e!691803))

(assert (=> start!101528 tp_is_empty!30919))

(declare-fun array_inv!28960 (array!78651) Bool)

(assert (=> start!101528 (array_inv!28960 _keys!1208)))

(assert (=> start!101528 true))

(assert (=> start!101528 tp!91666))

(declare-fun e!691799 () Bool)

(declare-fun array_inv!28961 (array!78653) Bool)

(assert (=> start!101528 (and (array_inv!28961 _values!996) e!691799)))

(declare-fun b!1218369 () Bool)

(declare-fun res!808759 () Bool)

(assert (=> b!1218369 (=> (not res!808759) (not e!691803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218369 (= res!808759 (validMask!0 mask!1564))))

(declare-fun b!1218380 () Bool)

(assert (=> b!1218380 (= e!691800 e!691802)))

(declare-fun res!808761 () Bool)

(assert (=> b!1218380 (=> res!808761 e!691802)))

(assert (=> b!1218380 (= res!808761 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1218380 (= lt!553624 (getCurrentListMapNoExtraKeys!5443 lt!553625 lt!553627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1218380 (= lt!553627 (array!78654 (store (arr!37955 _values!996) i!673 (ValueCellFull!14750 lt!553630)) (size!38492 _values!996)))))

(declare-fun dynLambda!3352 (Int (_ BitVec 64)) V!46353)

(assert (=> b!1218380 (= lt!553630 (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553632 () ListLongMap!17941)

(assert (=> b!1218380 (= lt!553632 (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218381 () Bool)

(assert (=> b!1218381 (= e!691799 (and e!691798 mapRes!48253))))

(declare-fun condMapEmpty!48253 () Bool)

(declare-fun mapDefault!48253 () ValueCell!14750)

(assert (=> b!1218381 (= condMapEmpty!48253 (= (arr!37955 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14750)) mapDefault!48253)))))

(declare-fun mapNonEmpty!48253 () Bool)

(declare-fun tp!91667 () Bool)

(assert (=> mapNonEmpty!48253 (= mapRes!48253 (and tp!91667 e!691797))))

(declare-fun mapKey!48253 () (_ BitVec 32))

(declare-fun mapValue!48253 () ValueCell!14750)

(declare-fun mapRest!48253 () (Array (_ BitVec 32) ValueCell!14750))

(assert (=> mapNonEmpty!48253 (= (arr!37955 _values!996) (store mapRest!48253 mapKey!48253 mapValue!48253))))

(declare-fun b!1218382 () Bool)

(declare-fun res!808767 () Bool)

(assert (=> b!1218382 (=> (not res!808767) (not e!691803))))

(assert (=> b!1218382 (= res!808767 (= (select (arr!37954 _keys!1208) i!673) k0!934))))

(assert (= (and start!101528 res!808762) b!1218369))

(assert (= (and b!1218369 res!808759) b!1218379))

(assert (= (and b!1218379 res!808768) b!1218376))

(assert (= (and b!1218376 res!808766) b!1218372))

(assert (= (and b!1218372 res!808763) b!1218367))

(assert (= (and b!1218367 res!808765) b!1218375))

(assert (= (and b!1218375 res!808760) b!1218382))

(assert (= (and b!1218382 res!808767) b!1218370))

(assert (= (and b!1218370 res!808771) b!1218368))

(assert (= (and b!1218368 res!808769) b!1218374))

(assert (= (and b!1218374 (not res!808770)) b!1218380))

(assert (= (and b!1218380 (not res!808761)) b!1218373))

(assert (= (and b!1218373 (not res!808764)) b!1218378))

(assert (= (and b!1218381 condMapEmpty!48253) mapIsEmpty!48253))

(assert (= (and b!1218381 (not condMapEmpty!48253)) mapNonEmpty!48253))

(get-info :version)

(assert (= (and mapNonEmpty!48253 ((_ is ValueCellFull!14750) mapValue!48253)) b!1218371))

(assert (= (and b!1218381 ((_ is ValueCellFull!14750) mapDefault!48253)) b!1218377))

(assert (= start!101528 b!1218381))

(declare-fun b_lambda!21885 () Bool)

(assert (=> (not b_lambda!21885) (not b!1218380)))

(declare-fun t!39959 () Bool)

(declare-fun tb!11007 () Bool)

(assert (=> (and start!101528 (= defaultEntry!1004 defaultEntry!1004) t!39959) tb!11007))

(declare-fun result!22619 () Bool)

(assert (=> tb!11007 (= result!22619 tp_is_empty!30919)))

(assert (=> b!1218380 t!39959))

(declare-fun b_and!43551 () Bool)

(assert (= b_and!43549 (and (=> t!39959 result!22619) b_and!43551)))

(declare-fun m!1123365 () Bool)

(assert (=> b!1218372 m!1123365))

(declare-fun m!1123367 () Bool)

(assert (=> b!1218368 m!1123367))

(declare-fun m!1123369 () Bool)

(assert (=> b!1218376 m!1123369))

(declare-fun m!1123371 () Bool)

(assert (=> b!1218370 m!1123371))

(declare-fun m!1123373 () Bool)

(assert (=> b!1218370 m!1123373))

(declare-fun m!1123375 () Bool)

(assert (=> b!1218382 m!1123375))

(declare-fun m!1123377 () Bool)

(assert (=> b!1218373 m!1123377))

(declare-fun m!1123379 () Bool)

(assert (=> b!1218373 m!1123379))

(declare-fun m!1123381 () Bool)

(assert (=> b!1218373 m!1123381))

(declare-fun m!1123383 () Bool)

(assert (=> b!1218373 m!1123383))

(declare-fun m!1123385 () Bool)

(assert (=> b!1218373 m!1123385))

(declare-fun m!1123387 () Bool)

(assert (=> b!1218373 m!1123387))

(assert (=> b!1218373 m!1123385))

(declare-fun m!1123389 () Bool)

(assert (=> b!1218369 m!1123389))

(declare-fun m!1123391 () Bool)

(assert (=> start!101528 m!1123391))

(declare-fun m!1123393 () Bool)

(assert (=> start!101528 m!1123393))

(assert (=> b!1218378 m!1123385))

(declare-fun m!1123395 () Bool)

(assert (=> b!1218378 m!1123395))

(assert (=> b!1218378 m!1123395))

(declare-fun m!1123397 () Bool)

(assert (=> b!1218378 m!1123397))

(declare-fun m!1123399 () Bool)

(assert (=> b!1218378 m!1123399))

(declare-fun m!1123401 () Bool)

(assert (=> mapNonEmpty!48253 m!1123401))

(declare-fun m!1123403 () Bool)

(assert (=> b!1218380 m!1123403))

(declare-fun m!1123405 () Bool)

(assert (=> b!1218380 m!1123405))

(declare-fun m!1123407 () Bool)

(assert (=> b!1218380 m!1123407))

(declare-fun m!1123409 () Bool)

(assert (=> b!1218380 m!1123409))

(declare-fun m!1123411 () Bool)

(assert (=> b!1218374 m!1123411))

(declare-fun m!1123413 () Bool)

(assert (=> b!1218374 m!1123413))

(declare-fun m!1123415 () Bool)

(assert (=> b!1218375 m!1123415))

(check-sat (not b_lambda!21885) (not b!1218369) (not b!1218373) b_and!43551 (not b_next!26215) tp_is_empty!30919 (not b!1218368) (not b!1218380) (not start!101528) (not b!1218370) (not b!1218374) (not b!1218375) (not b!1218372) (not b!1218376) (not mapNonEmpty!48253) (not b!1218378))
(check-sat b_and!43551 (not b_next!26215))
(get-model)

(declare-fun b_lambda!21891 () Bool)

(assert (= b_lambda!21885 (or (and start!101528 b_free!26215) b_lambda!21891)))

(check-sat (not b!1218369) (not b!1218373) b_and!43551 (not b_next!26215) tp_is_empty!30919 (not b!1218368) (not b!1218380) (not start!101528) (not b!1218374) (not b!1218375) (not b!1218372) (not b!1218376) (not b!1218370) (not b_lambda!21891) (not mapNonEmpty!48253) (not b!1218378))
(check-sat b_and!43551 (not b_next!26215))
(get-model)

(declare-fun d!133989 () Bool)

(declare-fun res!808854 () Bool)

(declare-fun e!691863 () Bool)

(assert (=> d!133989 (=> res!808854 e!691863)))

(assert (=> d!133989 (= res!808854 (= (select (arr!37954 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133989 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!691863)))

(declare-fun b!1218489 () Bool)

(declare-fun e!691864 () Bool)

(assert (=> b!1218489 (= e!691863 e!691864)))

(declare-fun res!808855 () Bool)

(assert (=> b!1218489 (=> (not res!808855) (not e!691864))))

(assert (=> b!1218489 (= res!808855 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38491 _keys!1208)))))

(declare-fun b!1218490 () Bool)

(assert (=> b!1218490 (= e!691864 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133989 (not res!808854)) b!1218489))

(assert (= (and b!1218489 res!808855) b!1218490))

(declare-fun m!1123521 () Bool)

(assert (=> d!133989 m!1123521))

(declare-fun m!1123523 () Bool)

(assert (=> b!1218490 m!1123523))

(assert (=> b!1218374 d!133989))

(declare-fun d!133991 () Bool)

(assert (=> d!133991 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553695 () Unit!40328)

(declare-fun choose!13 (array!78651 (_ BitVec 64) (_ BitVec 32)) Unit!40328)

(assert (=> d!133991 (= lt!553695 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133991 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133991 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!553695)))

(declare-fun bs!34324 () Bool)

(assert (= bs!34324 d!133991))

(assert (=> bs!34324 m!1123411))

(declare-fun m!1123525 () Bool)

(assert (=> bs!34324 m!1123525))

(assert (=> b!1218374 d!133991))

(declare-fun b!1218499 () Bool)

(declare-fun e!691873 () Bool)

(declare-fun e!691872 () Bool)

(assert (=> b!1218499 (= e!691873 e!691872)))

(declare-fun lt!553704 () (_ BitVec 64))

(assert (=> b!1218499 (= lt!553704 (select (arr!37954 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!553702 () Unit!40328)

(assert (=> b!1218499 (= lt!553702 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!553704 #b00000000000000000000000000000000))))

(assert (=> b!1218499 (arrayContainsKey!0 _keys!1208 lt!553704 #b00000000000000000000000000000000)))

(declare-fun lt!553703 () Unit!40328)

(assert (=> b!1218499 (= lt!553703 lt!553702)))

(declare-fun res!808860 () Bool)

(declare-datatypes ((SeekEntryResult!9899 0))(
  ( (MissingZero!9899 (index!41967 (_ BitVec 32))) (Found!9899 (index!41968 (_ BitVec 32))) (Intermediate!9899 (undefined!10711 Bool) (index!41969 (_ BitVec 32)) (x!107210 (_ BitVec 32))) (Undefined!9899) (MissingVacant!9899 (index!41970 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78651 (_ BitVec 32)) SeekEntryResult!9899)

(assert (=> b!1218499 (= res!808860 (= (seekEntryOrOpen!0 (select (arr!37954 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9899 #b00000000000000000000000000000000)))))

(assert (=> b!1218499 (=> (not res!808860) (not e!691872))))

(declare-fun b!1218500 () Bool)

(declare-fun call!60674 () Bool)

(assert (=> b!1218500 (= e!691872 call!60674)))

(declare-fun b!1218501 () Bool)

(assert (=> b!1218501 (= e!691873 call!60674)))

(declare-fun d!133993 () Bool)

(declare-fun res!808861 () Bool)

(declare-fun e!691871 () Bool)

(assert (=> d!133993 (=> res!808861 e!691871)))

(assert (=> d!133993 (= res!808861 (bvsge #b00000000000000000000000000000000 (size!38491 _keys!1208)))))

(assert (=> d!133993 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!691871)))

(declare-fun b!1218502 () Bool)

(assert (=> b!1218502 (= e!691871 e!691873)))

(declare-fun c!120449 () Bool)

(assert (=> b!1218502 (= c!120449 (validKeyInArray!0 (select (arr!37954 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60671 () Bool)

(assert (=> bm!60671 (= call!60674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!133993 (not res!808861)) b!1218502))

(assert (= (and b!1218502 c!120449) b!1218499))

(assert (= (and b!1218502 (not c!120449)) b!1218501))

(assert (= (and b!1218499 res!808860) b!1218500))

(assert (= (or b!1218500 b!1218501) bm!60671))

(assert (=> b!1218499 m!1123521))

(declare-fun m!1123527 () Bool)

(assert (=> b!1218499 m!1123527))

(declare-fun m!1123529 () Bool)

(assert (=> b!1218499 m!1123529))

(assert (=> b!1218499 m!1123521))

(declare-fun m!1123531 () Bool)

(assert (=> b!1218499 m!1123531))

(assert (=> b!1218502 m!1123521))

(assert (=> b!1218502 m!1123521))

(declare-fun m!1123533 () Bool)

(assert (=> b!1218502 m!1123533))

(declare-fun m!1123535 () Bool)

(assert (=> bm!60671 m!1123535))

(assert (=> b!1218376 d!133993))

(declare-fun d!133995 () Bool)

(assert (=> d!133995 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1218375 d!133995))

(declare-fun d!133997 () Bool)

(assert (=> d!133997 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1218369 d!133997))

(declare-fun bm!60674 () Bool)

(declare-fun call!60677 () Bool)

(declare-fun c!120452 () Bool)

(assert (=> bm!60674 (= call!60677 (arrayNoDuplicates!0 lt!553625 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120452 (Cons!26769 (select (arr!37954 lt!553625) #b00000000000000000000000000000000) Nil!26770) Nil!26770)))))

(declare-fun b!1218513 () Bool)

(declare-fun e!691882 () Bool)

(declare-fun contains!7040 (List!26773 (_ BitVec 64)) Bool)

(assert (=> b!1218513 (= e!691882 (contains!7040 Nil!26770 (select (arr!37954 lt!553625) #b00000000000000000000000000000000)))))

(declare-fun b!1218514 () Bool)

(declare-fun e!691883 () Bool)

(assert (=> b!1218514 (= e!691883 call!60677)))

(declare-fun b!1218515 () Bool)

(declare-fun e!691885 () Bool)

(declare-fun e!691884 () Bool)

(assert (=> b!1218515 (= e!691885 e!691884)))

(declare-fun res!808870 () Bool)

(assert (=> b!1218515 (=> (not res!808870) (not e!691884))))

(assert (=> b!1218515 (= res!808870 (not e!691882))))

(declare-fun res!808868 () Bool)

(assert (=> b!1218515 (=> (not res!808868) (not e!691882))))

(assert (=> b!1218515 (= res!808868 (validKeyInArray!0 (select (arr!37954 lt!553625) #b00000000000000000000000000000000)))))

(declare-fun d!133999 () Bool)

(declare-fun res!808869 () Bool)

(assert (=> d!133999 (=> res!808869 e!691885)))

(assert (=> d!133999 (= res!808869 (bvsge #b00000000000000000000000000000000 (size!38491 lt!553625)))))

(assert (=> d!133999 (= (arrayNoDuplicates!0 lt!553625 #b00000000000000000000000000000000 Nil!26770) e!691885)))

(declare-fun b!1218516 () Bool)

(assert (=> b!1218516 (= e!691883 call!60677)))

(declare-fun b!1218517 () Bool)

(assert (=> b!1218517 (= e!691884 e!691883)))

(assert (=> b!1218517 (= c!120452 (validKeyInArray!0 (select (arr!37954 lt!553625) #b00000000000000000000000000000000)))))

(assert (= (and d!133999 (not res!808869)) b!1218515))

(assert (= (and b!1218515 res!808868) b!1218513))

(assert (= (and b!1218515 res!808870) b!1218517))

(assert (= (and b!1218517 c!120452) b!1218516))

(assert (= (and b!1218517 (not c!120452)) b!1218514))

(assert (= (or b!1218516 b!1218514) bm!60674))

(declare-fun m!1123537 () Bool)

(assert (=> bm!60674 m!1123537))

(declare-fun m!1123539 () Bool)

(assert (=> bm!60674 m!1123539))

(assert (=> b!1218513 m!1123537))

(assert (=> b!1218513 m!1123537))

(declare-fun m!1123541 () Bool)

(assert (=> b!1218513 m!1123541))

(assert (=> b!1218515 m!1123537))

(assert (=> b!1218515 m!1123537))

(declare-fun m!1123543 () Bool)

(assert (=> b!1218515 m!1123543))

(assert (=> b!1218517 m!1123537))

(assert (=> b!1218517 m!1123537))

(assert (=> b!1218517 m!1123543))

(assert (=> b!1218368 d!133999))

(declare-fun d!134001 () Bool)

(assert (=> d!134001 (= (array_inv!28960 _keys!1208) (bvsge (size!38491 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101528 d!134001))

(declare-fun d!134003 () Bool)

(assert (=> d!134003 (= (array_inv!28961 _values!996) (bvsge (size!38492 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101528 d!134003))

(declare-fun d!134005 () Bool)

(declare-fun e!691888 () Bool)

(assert (=> d!134005 e!691888))

(declare-fun res!808875 () Bool)

(assert (=> d!134005 (=> (not res!808875) (not e!691888))))

(declare-fun lt!553713 () ListLongMap!17941)

(declare-fun contains!7041 (ListLongMap!17941 (_ BitVec 64)) Bool)

(assert (=> d!134005 (= res!808875 (contains!7041 lt!553713 (_1!9993 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630)))))))

(declare-fun lt!553715 () List!26774)

(assert (=> d!134005 (= lt!553713 (ListLongMap!17942 lt!553715))))

(declare-fun lt!553714 () Unit!40328)

(declare-fun lt!553716 () Unit!40328)

(assert (=> d!134005 (= lt!553714 lt!553716)))

(declare-datatypes ((Option!688 0))(
  ( (Some!687 (v!18168 V!46353)) (None!686) )
))
(declare-fun getValueByKey!637 (List!26774 (_ BitVec 64)) Option!688)

(assert (=> d!134005 (= (getValueByKey!637 lt!553715 (_1!9993 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630)))) (Some!687 (_2!9993 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!319 (List!26774 (_ BitVec 64) V!46353) Unit!40328)

(assert (=> d!134005 (= lt!553716 (lemmaContainsTupThenGetReturnValue!319 lt!553715 (_1!9993 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630))) (_2!9993 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630)))))))

(declare-fun insertStrictlySorted!412 (List!26774 (_ BitVec 64) V!46353) List!26774)

(assert (=> d!134005 (= lt!553715 (insertStrictlySorted!412 (toList!8986 lt!553629) (_1!9993 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630))) (_2!9993 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630)))))))

(assert (=> d!134005 (= (+!4102 lt!553629 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630))) lt!553713)))

(declare-fun b!1218522 () Bool)

(declare-fun res!808876 () Bool)

(assert (=> b!1218522 (=> (not res!808876) (not e!691888))))

(assert (=> b!1218522 (= res!808876 (= (getValueByKey!637 (toList!8986 lt!553713) (_1!9993 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630)))) (Some!687 (_2!9993 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630))))))))

(declare-fun b!1218523 () Bool)

(declare-fun contains!7042 (List!26774 tuple2!19964) Bool)

(assert (=> b!1218523 (= e!691888 (contains!7042 (toList!8986 lt!553713) (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630))))))

(assert (= (and d!134005 res!808875) b!1218522))

(assert (= (and b!1218522 res!808876) b!1218523))

(declare-fun m!1123545 () Bool)

(assert (=> d!134005 m!1123545))

(declare-fun m!1123547 () Bool)

(assert (=> d!134005 m!1123547))

(declare-fun m!1123549 () Bool)

(assert (=> d!134005 m!1123549))

(declare-fun m!1123551 () Bool)

(assert (=> d!134005 m!1123551))

(declare-fun m!1123553 () Bool)

(assert (=> b!1218522 m!1123553))

(declare-fun m!1123555 () Bool)

(assert (=> b!1218523 m!1123555))

(assert (=> b!1218378 d!134005))

(declare-fun d!134007 () Bool)

(declare-fun c!120455 () Bool)

(assert (=> d!134007 (= c!120455 ((_ is ValueCellFull!14750) (select (arr!37955 _values!996) from!1455)))))

(declare-fun e!691891 () V!46353)

(assert (=> d!134007 (= (get!19378 (select (arr!37955 _values!996) from!1455) lt!553630) e!691891)))

(declare-fun b!1218528 () Bool)

(declare-fun get!19379 (ValueCell!14750 V!46353) V!46353)

(assert (=> b!1218528 (= e!691891 (get!19379 (select (arr!37955 _values!996) from!1455) lt!553630))))

(declare-fun b!1218529 () Bool)

(declare-fun get!19380 (ValueCell!14750 V!46353) V!46353)

(assert (=> b!1218529 (= e!691891 (get!19380 (select (arr!37955 _values!996) from!1455) lt!553630))))

(assert (= (and d!134007 c!120455) b!1218528))

(assert (= (and d!134007 (not c!120455)) b!1218529))

(assert (=> b!1218528 m!1123395))

(declare-fun m!1123557 () Bool)

(assert (=> b!1218528 m!1123557))

(assert (=> b!1218529 m!1123395))

(declare-fun m!1123559 () Bool)

(assert (=> b!1218529 m!1123559))

(assert (=> b!1218378 d!134007))

(declare-fun b!1218530 () Bool)

(declare-fun e!691894 () Bool)

(declare-fun e!691893 () Bool)

(assert (=> b!1218530 (= e!691894 e!691893)))

(declare-fun lt!553719 () (_ BitVec 64))

(assert (=> b!1218530 (= lt!553719 (select (arr!37954 lt!553625) #b00000000000000000000000000000000))))

(declare-fun lt!553717 () Unit!40328)

(assert (=> b!1218530 (= lt!553717 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!553625 lt!553719 #b00000000000000000000000000000000))))

(assert (=> b!1218530 (arrayContainsKey!0 lt!553625 lt!553719 #b00000000000000000000000000000000)))

(declare-fun lt!553718 () Unit!40328)

(assert (=> b!1218530 (= lt!553718 lt!553717)))

(declare-fun res!808877 () Bool)

(assert (=> b!1218530 (= res!808877 (= (seekEntryOrOpen!0 (select (arr!37954 lt!553625) #b00000000000000000000000000000000) lt!553625 mask!1564) (Found!9899 #b00000000000000000000000000000000)))))

(assert (=> b!1218530 (=> (not res!808877) (not e!691893))))

(declare-fun b!1218531 () Bool)

(declare-fun call!60678 () Bool)

(assert (=> b!1218531 (= e!691893 call!60678)))

(declare-fun b!1218532 () Bool)

(assert (=> b!1218532 (= e!691894 call!60678)))

(declare-fun d!134009 () Bool)

(declare-fun res!808878 () Bool)

(declare-fun e!691892 () Bool)

(assert (=> d!134009 (=> res!808878 e!691892)))

(assert (=> d!134009 (= res!808878 (bvsge #b00000000000000000000000000000000 (size!38491 lt!553625)))))

(assert (=> d!134009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553625 mask!1564) e!691892)))

(declare-fun b!1218533 () Bool)

(assert (=> b!1218533 (= e!691892 e!691894)))

(declare-fun c!120456 () Bool)

(assert (=> b!1218533 (= c!120456 (validKeyInArray!0 (select (arr!37954 lt!553625) #b00000000000000000000000000000000)))))

(declare-fun bm!60675 () Bool)

(assert (=> bm!60675 (= call!60678 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!553625 mask!1564))))

(assert (= (and d!134009 (not res!808878)) b!1218533))

(assert (= (and b!1218533 c!120456) b!1218530))

(assert (= (and b!1218533 (not c!120456)) b!1218532))

(assert (= (and b!1218530 res!808877) b!1218531))

(assert (= (or b!1218531 b!1218532) bm!60675))

(assert (=> b!1218530 m!1123537))

(declare-fun m!1123561 () Bool)

(assert (=> b!1218530 m!1123561))

(declare-fun m!1123563 () Bool)

(assert (=> b!1218530 m!1123563))

(assert (=> b!1218530 m!1123537))

(declare-fun m!1123565 () Bool)

(assert (=> b!1218530 m!1123565))

(assert (=> b!1218533 m!1123537))

(assert (=> b!1218533 m!1123537))

(assert (=> b!1218533 m!1123543))

(declare-fun m!1123567 () Bool)

(assert (=> bm!60675 m!1123567))

(assert (=> b!1218370 d!134009))

(declare-fun b!1218558 () Bool)

(declare-fun e!691910 () ListLongMap!17941)

(declare-fun call!60681 () ListLongMap!17941)

(assert (=> b!1218558 (= e!691910 call!60681)))

(declare-fun b!1218559 () Bool)

(declare-fun res!808888 () Bool)

(declare-fun e!691915 () Bool)

(assert (=> b!1218559 (=> (not res!808888) (not e!691915))))

(declare-fun lt!553738 () ListLongMap!17941)

(assert (=> b!1218559 (= res!808888 (not (contains!7041 lt!553738 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218560 () Bool)

(declare-fun e!691911 () Bool)

(assert (=> b!1218560 (= e!691915 e!691911)))

(declare-fun c!120465 () Bool)

(declare-fun e!691913 () Bool)

(assert (=> b!1218560 (= c!120465 e!691913)))

(declare-fun res!808887 () Bool)

(assert (=> b!1218560 (=> (not res!808887) (not e!691913))))

(assert (=> b!1218560 (= res!808887 (bvslt from!1455 (size!38491 lt!553625)))))

(declare-fun b!1218561 () Bool)

(declare-fun e!691912 () ListLongMap!17941)

(assert (=> b!1218561 (= e!691912 (ListLongMap!17942 Nil!26771))))

(declare-fun d!134011 () Bool)

(assert (=> d!134011 e!691915))

(declare-fun res!808889 () Bool)

(assert (=> d!134011 (=> (not res!808889) (not e!691915))))

(assert (=> d!134011 (= res!808889 (not (contains!7041 lt!553738 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134011 (= lt!553738 e!691912)))

(declare-fun c!120466 () Bool)

(assert (=> d!134011 (= c!120466 (bvsge from!1455 (size!38491 lt!553625)))))

(assert (=> d!134011 (validMask!0 mask!1564)))

(assert (=> d!134011 (= (getCurrentListMapNoExtraKeys!5443 lt!553625 lt!553627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553738)))

(declare-fun b!1218562 () Bool)

(declare-fun lt!553740 () Unit!40328)

(declare-fun lt!553735 () Unit!40328)

(assert (=> b!1218562 (= lt!553740 lt!553735)))

(declare-fun lt!553739 () ListLongMap!17941)

(declare-fun lt!553736 () (_ BitVec 64))

(declare-fun lt!553734 () V!46353)

(declare-fun lt!553737 () (_ BitVec 64))

(assert (=> b!1218562 (not (contains!7041 (+!4102 lt!553739 (tuple2!19965 lt!553737 lt!553734)) lt!553736))))

(declare-fun addStillNotContains!300 (ListLongMap!17941 (_ BitVec 64) V!46353 (_ BitVec 64)) Unit!40328)

(assert (=> b!1218562 (= lt!553735 (addStillNotContains!300 lt!553739 lt!553737 lt!553734 lt!553736))))

(assert (=> b!1218562 (= lt!553736 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218562 (= lt!553734 (get!19378 (select (arr!37955 lt!553627) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218562 (= lt!553737 (select (arr!37954 lt!553625) from!1455))))

(assert (=> b!1218562 (= lt!553739 call!60681)))

(assert (=> b!1218562 (= e!691910 (+!4102 call!60681 (tuple2!19965 (select (arr!37954 lt!553625) from!1455) (get!19378 (select (arr!37955 lt!553627) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1218563 () Bool)

(declare-fun e!691909 () Bool)

(assert (=> b!1218563 (= e!691909 (= lt!553738 (getCurrentListMapNoExtraKeys!5443 lt!553625 lt!553627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218564 () Bool)

(assert (=> b!1218564 (= e!691913 (validKeyInArray!0 (select (arr!37954 lt!553625) from!1455)))))

(assert (=> b!1218564 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!60678 () Bool)

(assert (=> bm!60678 (= call!60681 (getCurrentListMapNoExtraKeys!5443 lt!553625 lt!553627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218565 () Bool)

(declare-fun isEmpty!998 (ListLongMap!17941) Bool)

(assert (=> b!1218565 (= e!691909 (isEmpty!998 lt!553738))))

(declare-fun b!1218566 () Bool)

(declare-fun e!691914 () Bool)

(assert (=> b!1218566 (= e!691911 e!691914)))

(assert (=> b!1218566 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38491 lt!553625)))))

(declare-fun res!808890 () Bool)

(assert (=> b!1218566 (= res!808890 (contains!7041 lt!553738 (select (arr!37954 lt!553625) from!1455)))))

(assert (=> b!1218566 (=> (not res!808890) (not e!691914))))

(declare-fun b!1218567 () Bool)

(assert (=> b!1218567 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38491 lt!553625)))))

(assert (=> b!1218567 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38492 lt!553627)))))

(declare-fun apply!979 (ListLongMap!17941 (_ BitVec 64)) V!46353)

(assert (=> b!1218567 (= e!691914 (= (apply!979 lt!553738 (select (arr!37954 lt!553625) from!1455)) (get!19378 (select (arr!37955 lt!553627) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218568 () Bool)

(assert (=> b!1218568 (= e!691911 e!691909)))

(declare-fun c!120467 () Bool)

(assert (=> b!1218568 (= c!120467 (bvslt from!1455 (size!38491 lt!553625)))))

(declare-fun b!1218569 () Bool)

(assert (=> b!1218569 (= e!691912 e!691910)))

(declare-fun c!120468 () Bool)

(assert (=> b!1218569 (= c!120468 (validKeyInArray!0 (select (arr!37954 lt!553625) from!1455)))))

(assert (= (and d!134011 c!120466) b!1218561))

(assert (= (and d!134011 (not c!120466)) b!1218569))

(assert (= (and b!1218569 c!120468) b!1218562))

(assert (= (and b!1218569 (not c!120468)) b!1218558))

(assert (= (or b!1218562 b!1218558) bm!60678))

(assert (= (and d!134011 res!808889) b!1218559))

(assert (= (and b!1218559 res!808888) b!1218560))

(assert (= (and b!1218560 res!808887) b!1218564))

(assert (= (and b!1218560 c!120465) b!1218566))

(assert (= (and b!1218560 (not c!120465)) b!1218568))

(assert (= (and b!1218566 res!808890) b!1218567))

(assert (= (and b!1218568 c!120467) b!1218563))

(assert (= (and b!1218568 (not c!120467)) b!1218565))

(declare-fun b_lambda!21893 () Bool)

(assert (=> (not b_lambda!21893) (not b!1218562)))

(assert (=> b!1218562 t!39959))

(declare-fun b_and!43561 () Bool)

(assert (= b_and!43551 (and (=> t!39959 result!22619) b_and!43561)))

(declare-fun b_lambda!21895 () Bool)

(assert (=> (not b_lambda!21895) (not b!1218567)))

(assert (=> b!1218567 t!39959))

(declare-fun b_and!43563 () Bool)

(assert (= b_and!43561 (and (=> t!39959 result!22619) b_and!43563)))

(declare-fun m!1123569 () Bool)

(assert (=> b!1218563 m!1123569))

(declare-fun m!1123571 () Bool)

(assert (=> b!1218566 m!1123571))

(assert (=> b!1218566 m!1123571))

(declare-fun m!1123573 () Bool)

(assert (=> b!1218566 m!1123573))

(declare-fun m!1123575 () Bool)

(assert (=> b!1218559 m!1123575))

(assert (=> b!1218569 m!1123571))

(assert (=> b!1218569 m!1123571))

(declare-fun m!1123577 () Bool)

(assert (=> b!1218569 m!1123577))

(declare-fun m!1123579 () Bool)

(assert (=> b!1218565 m!1123579))

(declare-fun m!1123581 () Bool)

(assert (=> d!134011 m!1123581))

(assert (=> d!134011 m!1123389))

(assert (=> bm!60678 m!1123569))

(assert (=> b!1218567 m!1123571))

(assert (=> b!1218567 m!1123571))

(declare-fun m!1123583 () Bool)

(assert (=> b!1218567 m!1123583))

(declare-fun m!1123585 () Bool)

(assert (=> b!1218567 m!1123585))

(assert (=> b!1218567 m!1123407))

(declare-fun m!1123587 () Bool)

(assert (=> b!1218567 m!1123587))

(assert (=> b!1218567 m!1123585))

(assert (=> b!1218567 m!1123407))

(assert (=> b!1218562 m!1123571))

(declare-fun m!1123589 () Bool)

(assert (=> b!1218562 m!1123589))

(assert (=> b!1218562 m!1123585))

(assert (=> b!1218562 m!1123407))

(assert (=> b!1218562 m!1123587))

(assert (=> b!1218562 m!1123589))

(declare-fun m!1123591 () Bool)

(assert (=> b!1218562 m!1123591))

(assert (=> b!1218562 m!1123585))

(assert (=> b!1218562 m!1123407))

(declare-fun m!1123593 () Bool)

(assert (=> b!1218562 m!1123593))

(declare-fun m!1123595 () Bool)

(assert (=> b!1218562 m!1123595))

(assert (=> b!1218564 m!1123571))

(assert (=> b!1218564 m!1123571))

(assert (=> b!1218564 m!1123577))

(assert (=> b!1218380 d!134011))

(declare-fun b!1218570 () Bool)

(declare-fun e!691917 () ListLongMap!17941)

(declare-fun call!60682 () ListLongMap!17941)

(assert (=> b!1218570 (= e!691917 call!60682)))

(declare-fun b!1218571 () Bool)

(declare-fun res!808892 () Bool)

(declare-fun e!691922 () Bool)

(assert (=> b!1218571 (=> (not res!808892) (not e!691922))))

(declare-fun lt!553745 () ListLongMap!17941)

(assert (=> b!1218571 (= res!808892 (not (contains!7041 lt!553745 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218572 () Bool)

(declare-fun e!691918 () Bool)

(assert (=> b!1218572 (= e!691922 e!691918)))

(declare-fun c!120469 () Bool)

(declare-fun e!691920 () Bool)

(assert (=> b!1218572 (= c!120469 e!691920)))

(declare-fun res!808891 () Bool)

(assert (=> b!1218572 (=> (not res!808891) (not e!691920))))

(assert (=> b!1218572 (= res!808891 (bvslt from!1455 (size!38491 _keys!1208)))))

(declare-fun b!1218573 () Bool)

(declare-fun e!691919 () ListLongMap!17941)

(assert (=> b!1218573 (= e!691919 (ListLongMap!17942 Nil!26771))))

(declare-fun d!134013 () Bool)

(assert (=> d!134013 e!691922))

(declare-fun res!808893 () Bool)

(assert (=> d!134013 (=> (not res!808893) (not e!691922))))

(assert (=> d!134013 (= res!808893 (not (contains!7041 lt!553745 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134013 (= lt!553745 e!691919)))

(declare-fun c!120470 () Bool)

(assert (=> d!134013 (= c!120470 (bvsge from!1455 (size!38491 _keys!1208)))))

(assert (=> d!134013 (validMask!0 mask!1564)))

(assert (=> d!134013 (= (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!553745)))

(declare-fun b!1218574 () Bool)

(declare-fun lt!553747 () Unit!40328)

(declare-fun lt!553742 () Unit!40328)

(assert (=> b!1218574 (= lt!553747 lt!553742)))

(declare-fun lt!553744 () (_ BitVec 64))

(declare-fun lt!553746 () ListLongMap!17941)

(declare-fun lt!553741 () V!46353)

(declare-fun lt!553743 () (_ BitVec 64))

(assert (=> b!1218574 (not (contains!7041 (+!4102 lt!553746 (tuple2!19965 lt!553744 lt!553741)) lt!553743))))

(assert (=> b!1218574 (= lt!553742 (addStillNotContains!300 lt!553746 lt!553744 lt!553741 lt!553743))))

(assert (=> b!1218574 (= lt!553743 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218574 (= lt!553741 (get!19378 (select (arr!37955 _values!996) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218574 (= lt!553744 (select (arr!37954 _keys!1208) from!1455))))

(assert (=> b!1218574 (= lt!553746 call!60682)))

(assert (=> b!1218574 (= e!691917 (+!4102 call!60682 (tuple2!19965 (select (arr!37954 _keys!1208) from!1455) (get!19378 (select (arr!37955 _values!996) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!691916 () Bool)

(declare-fun b!1218575 () Bool)

(assert (=> b!1218575 (= e!691916 (= lt!553745 (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218576 () Bool)

(assert (=> b!1218576 (= e!691920 (validKeyInArray!0 (select (arr!37954 _keys!1208) from!1455)))))

(assert (=> b!1218576 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun bm!60679 () Bool)

(assert (=> bm!60679 (= call!60682 (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218577 () Bool)

(assert (=> b!1218577 (= e!691916 (isEmpty!998 lt!553745))))

(declare-fun b!1218578 () Bool)

(declare-fun e!691921 () Bool)

(assert (=> b!1218578 (= e!691918 e!691921)))

(assert (=> b!1218578 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38491 _keys!1208)))))

(declare-fun res!808894 () Bool)

(assert (=> b!1218578 (= res!808894 (contains!7041 lt!553745 (select (arr!37954 _keys!1208) from!1455)))))

(assert (=> b!1218578 (=> (not res!808894) (not e!691921))))

(declare-fun b!1218579 () Bool)

(assert (=> b!1218579 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38491 _keys!1208)))))

(assert (=> b!1218579 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38492 _values!996)))))

(assert (=> b!1218579 (= e!691921 (= (apply!979 lt!553745 (select (arr!37954 _keys!1208) from!1455)) (get!19378 (select (arr!37955 _values!996) from!1455) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218580 () Bool)

(assert (=> b!1218580 (= e!691918 e!691916)))

(declare-fun c!120471 () Bool)

(assert (=> b!1218580 (= c!120471 (bvslt from!1455 (size!38491 _keys!1208)))))

(declare-fun b!1218581 () Bool)

(assert (=> b!1218581 (= e!691919 e!691917)))

(declare-fun c!120472 () Bool)

(assert (=> b!1218581 (= c!120472 (validKeyInArray!0 (select (arr!37954 _keys!1208) from!1455)))))

(assert (= (and d!134013 c!120470) b!1218573))

(assert (= (and d!134013 (not c!120470)) b!1218581))

(assert (= (and b!1218581 c!120472) b!1218574))

(assert (= (and b!1218581 (not c!120472)) b!1218570))

(assert (= (or b!1218574 b!1218570) bm!60679))

(assert (= (and d!134013 res!808893) b!1218571))

(assert (= (and b!1218571 res!808892) b!1218572))

(assert (= (and b!1218572 res!808891) b!1218576))

(assert (= (and b!1218572 c!120469) b!1218578))

(assert (= (and b!1218572 (not c!120469)) b!1218580))

(assert (= (and b!1218578 res!808894) b!1218579))

(assert (= (and b!1218580 c!120471) b!1218575))

(assert (= (and b!1218580 (not c!120471)) b!1218577))

(declare-fun b_lambda!21897 () Bool)

(assert (=> (not b_lambda!21897) (not b!1218574)))

(assert (=> b!1218574 t!39959))

(declare-fun b_and!43565 () Bool)

(assert (= b_and!43563 (and (=> t!39959 result!22619) b_and!43565)))

(declare-fun b_lambda!21899 () Bool)

(assert (=> (not b_lambda!21899) (not b!1218579)))

(assert (=> b!1218579 t!39959))

(declare-fun b_and!43567 () Bool)

(assert (= b_and!43565 (and (=> t!39959 result!22619) b_and!43567)))

(declare-fun m!1123597 () Bool)

(assert (=> b!1218575 m!1123597))

(assert (=> b!1218578 m!1123385))

(assert (=> b!1218578 m!1123385))

(declare-fun m!1123599 () Bool)

(assert (=> b!1218578 m!1123599))

(declare-fun m!1123601 () Bool)

(assert (=> b!1218571 m!1123601))

(assert (=> b!1218581 m!1123385))

(assert (=> b!1218581 m!1123385))

(assert (=> b!1218581 m!1123387))

(declare-fun m!1123603 () Bool)

(assert (=> b!1218577 m!1123603))

(declare-fun m!1123605 () Bool)

(assert (=> d!134013 m!1123605))

(assert (=> d!134013 m!1123389))

(assert (=> bm!60679 m!1123597))

(assert (=> b!1218579 m!1123385))

(assert (=> b!1218579 m!1123385))

(declare-fun m!1123607 () Bool)

(assert (=> b!1218579 m!1123607))

(assert (=> b!1218579 m!1123395))

(assert (=> b!1218579 m!1123407))

(declare-fun m!1123609 () Bool)

(assert (=> b!1218579 m!1123609))

(assert (=> b!1218579 m!1123395))

(assert (=> b!1218579 m!1123407))

(assert (=> b!1218574 m!1123385))

(declare-fun m!1123611 () Bool)

(assert (=> b!1218574 m!1123611))

(assert (=> b!1218574 m!1123395))

(assert (=> b!1218574 m!1123407))

(assert (=> b!1218574 m!1123609))

(assert (=> b!1218574 m!1123611))

(declare-fun m!1123613 () Bool)

(assert (=> b!1218574 m!1123613))

(assert (=> b!1218574 m!1123395))

(assert (=> b!1218574 m!1123407))

(declare-fun m!1123615 () Bool)

(assert (=> b!1218574 m!1123615))

(declare-fun m!1123617 () Bool)

(assert (=> b!1218574 m!1123617))

(assert (=> b!1218576 m!1123385))

(assert (=> b!1218576 m!1123385))

(assert (=> b!1218576 m!1123387))

(assert (=> b!1218380 d!134013))

(declare-fun d!134015 () Bool)

(assert (=> d!134015 (= (validKeyInArray!0 (select (arr!37954 _keys!1208) from!1455)) (and (not (= (select (arr!37954 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37954 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1218373 d!134015))

(declare-fun b!1218582 () Bool)

(declare-fun e!691924 () ListLongMap!17941)

(declare-fun call!60683 () ListLongMap!17941)

(assert (=> b!1218582 (= e!691924 call!60683)))

(declare-fun b!1218583 () Bool)

(declare-fun res!808896 () Bool)

(declare-fun e!691929 () Bool)

(assert (=> b!1218583 (=> (not res!808896) (not e!691929))))

(declare-fun lt!553752 () ListLongMap!17941)

(assert (=> b!1218583 (= res!808896 (not (contains!7041 lt!553752 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218584 () Bool)

(declare-fun e!691925 () Bool)

(assert (=> b!1218584 (= e!691929 e!691925)))

(declare-fun c!120473 () Bool)

(declare-fun e!691927 () Bool)

(assert (=> b!1218584 (= c!120473 e!691927)))

(declare-fun res!808895 () Bool)

(assert (=> b!1218584 (=> (not res!808895) (not e!691927))))

(assert (=> b!1218584 (= res!808895 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(declare-fun b!1218585 () Bool)

(declare-fun e!691926 () ListLongMap!17941)

(assert (=> b!1218585 (= e!691926 (ListLongMap!17942 Nil!26771))))

(declare-fun d!134017 () Bool)

(assert (=> d!134017 e!691929))

(declare-fun res!808897 () Bool)

(assert (=> d!134017 (=> (not res!808897) (not e!691929))))

(assert (=> d!134017 (= res!808897 (not (contains!7041 lt!553752 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134017 (= lt!553752 e!691926)))

(declare-fun c!120474 () Bool)

(assert (=> d!134017 (= c!120474 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(assert (=> d!134017 (validMask!0 mask!1564)))

(assert (=> d!134017 (= (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553752)))

(declare-fun b!1218586 () Bool)

(declare-fun lt!553754 () Unit!40328)

(declare-fun lt!553749 () Unit!40328)

(assert (=> b!1218586 (= lt!553754 lt!553749)))

(declare-fun lt!553751 () (_ BitVec 64))

(declare-fun lt!553748 () V!46353)

(declare-fun lt!553753 () ListLongMap!17941)

(declare-fun lt!553750 () (_ BitVec 64))

(assert (=> b!1218586 (not (contains!7041 (+!4102 lt!553753 (tuple2!19965 lt!553751 lt!553748)) lt!553750))))

(assert (=> b!1218586 (= lt!553749 (addStillNotContains!300 lt!553753 lt!553751 lt!553748 lt!553750))))

(assert (=> b!1218586 (= lt!553750 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218586 (= lt!553748 (get!19378 (select (arr!37955 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218586 (= lt!553751 (select (arr!37954 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1218586 (= lt!553753 call!60683)))

(assert (=> b!1218586 (= e!691924 (+!4102 call!60683 (tuple2!19965 (select (arr!37954 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19378 (select (arr!37955 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1218587 () Bool)

(declare-fun e!691923 () Bool)

(assert (=> b!1218587 (= e!691923 (= lt!553752 (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218588 () Bool)

(assert (=> b!1218588 (= e!691927 (validKeyInArray!0 (select (arr!37954 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218588 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60680 () Bool)

(assert (=> bm!60680 (= call!60683 (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218589 () Bool)

(assert (=> b!1218589 (= e!691923 (isEmpty!998 lt!553752))))

(declare-fun b!1218590 () Bool)

(declare-fun e!691928 () Bool)

(assert (=> b!1218590 (= e!691925 e!691928)))

(assert (=> b!1218590 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(declare-fun res!808898 () Bool)

(assert (=> b!1218590 (= res!808898 (contains!7041 lt!553752 (select (arr!37954 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218590 (=> (not res!808898) (not e!691928))))

(declare-fun b!1218591 () Bool)

(assert (=> b!1218591 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(assert (=> b!1218591 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38492 _values!996)))))

(assert (=> b!1218591 (= e!691928 (= (apply!979 lt!553752 (select (arr!37954 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19378 (select (arr!37955 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218592 () Bool)

(assert (=> b!1218592 (= e!691925 e!691923)))

(declare-fun c!120475 () Bool)

(assert (=> b!1218592 (= c!120475 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(declare-fun b!1218593 () Bool)

(assert (=> b!1218593 (= e!691926 e!691924)))

(declare-fun c!120476 () Bool)

(assert (=> b!1218593 (= c!120476 (validKeyInArray!0 (select (arr!37954 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!134017 c!120474) b!1218585))

(assert (= (and d!134017 (not c!120474)) b!1218593))

(assert (= (and b!1218593 c!120476) b!1218586))

(assert (= (and b!1218593 (not c!120476)) b!1218582))

(assert (= (or b!1218586 b!1218582) bm!60680))

(assert (= (and d!134017 res!808897) b!1218583))

(assert (= (and b!1218583 res!808896) b!1218584))

(assert (= (and b!1218584 res!808895) b!1218588))

(assert (= (and b!1218584 c!120473) b!1218590))

(assert (= (and b!1218584 (not c!120473)) b!1218592))

(assert (= (and b!1218590 res!808898) b!1218591))

(assert (= (and b!1218592 c!120475) b!1218587))

(assert (= (and b!1218592 (not c!120475)) b!1218589))

(declare-fun b_lambda!21901 () Bool)

(assert (=> (not b_lambda!21901) (not b!1218586)))

(assert (=> b!1218586 t!39959))

(declare-fun b_and!43569 () Bool)

(assert (= b_and!43567 (and (=> t!39959 result!22619) b_and!43569)))

(declare-fun b_lambda!21903 () Bool)

(assert (=> (not b_lambda!21903) (not b!1218591)))

(assert (=> b!1218591 t!39959))

(declare-fun b_and!43571 () Bool)

(assert (= b_and!43569 (and (=> t!39959 result!22619) b_and!43571)))

(declare-fun m!1123619 () Bool)

(assert (=> b!1218587 m!1123619))

(declare-fun m!1123621 () Bool)

(assert (=> b!1218590 m!1123621))

(assert (=> b!1218590 m!1123621))

(declare-fun m!1123623 () Bool)

(assert (=> b!1218590 m!1123623))

(declare-fun m!1123625 () Bool)

(assert (=> b!1218583 m!1123625))

(assert (=> b!1218593 m!1123621))

(assert (=> b!1218593 m!1123621))

(declare-fun m!1123627 () Bool)

(assert (=> b!1218593 m!1123627))

(declare-fun m!1123629 () Bool)

(assert (=> b!1218589 m!1123629))

(declare-fun m!1123631 () Bool)

(assert (=> d!134017 m!1123631))

(assert (=> d!134017 m!1123389))

(assert (=> bm!60680 m!1123619))

(assert (=> b!1218591 m!1123621))

(assert (=> b!1218591 m!1123621))

(declare-fun m!1123633 () Bool)

(assert (=> b!1218591 m!1123633))

(declare-fun m!1123635 () Bool)

(assert (=> b!1218591 m!1123635))

(assert (=> b!1218591 m!1123407))

(declare-fun m!1123637 () Bool)

(assert (=> b!1218591 m!1123637))

(assert (=> b!1218591 m!1123635))

(assert (=> b!1218591 m!1123407))

(assert (=> b!1218586 m!1123621))

(declare-fun m!1123639 () Bool)

(assert (=> b!1218586 m!1123639))

(assert (=> b!1218586 m!1123635))

(assert (=> b!1218586 m!1123407))

(assert (=> b!1218586 m!1123637))

(assert (=> b!1218586 m!1123639))

(declare-fun m!1123641 () Bool)

(assert (=> b!1218586 m!1123641))

(assert (=> b!1218586 m!1123635))

(assert (=> b!1218586 m!1123407))

(declare-fun m!1123643 () Bool)

(assert (=> b!1218586 m!1123643))

(declare-fun m!1123645 () Bool)

(assert (=> b!1218586 m!1123645))

(assert (=> b!1218588 m!1123621))

(assert (=> b!1218588 m!1123621))

(assert (=> b!1218588 m!1123627))

(assert (=> b!1218373 d!134017))

(declare-fun b!1218594 () Bool)

(declare-fun e!691931 () ListLongMap!17941)

(declare-fun call!60684 () ListLongMap!17941)

(assert (=> b!1218594 (= e!691931 call!60684)))

(declare-fun b!1218595 () Bool)

(declare-fun res!808900 () Bool)

(declare-fun e!691936 () Bool)

(assert (=> b!1218595 (=> (not res!808900) (not e!691936))))

(declare-fun lt!553759 () ListLongMap!17941)

(assert (=> b!1218595 (= res!808900 (not (contains!7041 lt!553759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1218596 () Bool)

(declare-fun e!691932 () Bool)

(assert (=> b!1218596 (= e!691936 e!691932)))

(declare-fun c!120477 () Bool)

(declare-fun e!691934 () Bool)

(assert (=> b!1218596 (= c!120477 e!691934)))

(declare-fun res!808899 () Bool)

(assert (=> b!1218596 (=> (not res!808899) (not e!691934))))

(assert (=> b!1218596 (= res!808899 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 lt!553625)))))

(declare-fun b!1218597 () Bool)

(declare-fun e!691933 () ListLongMap!17941)

(assert (=> b!1218597 (= e!691933 (ListLongMap!17942 Nil!26771))))

(declare-fun d!134019 () Bool)

(assert (=> d!134019 e!691936))

(declare-fun res!808901 () Bool)

(assert (=> d!134019 (=> (not res!808901) (not e!691936))))

(assert (=> d!134019 (= res!808901 (not (contains!7041 lt!553759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134019 (= lt!553759 e!691933)))

(declare-fun c!120478 () Bool)

(assert (=> d!134019 (= c!120478 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 lt!553625)))))

(assert (=> d!134019 (validMask!0 mask!1564)))

(assert (=> d!134019 (= (getCurrentListMapNoExtraKeys!5443 lt!553625 lt!553627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553759)))

(declare-fun b!1218598 () Bool)

(declare-fun lt!553761 () Unit!40328)

(declare-fun lt!553756 () Unit!40328)

(assert (=> b!1218598 (= lt!553761 lt!553756)))

(declare-fun lt!553760 () ListLongMap!17941)

(declare-fun lt!553755 () V!46353)

(declare-fun lt!553758 () (_ BitVec 64))

(declare-fun lt!553757 () (_ BitVec 64))

(assert (=> b!1218598 (not (contains!7041 (+!4102 lt!553760 (tuple2!19965 lt!553758 lt!553755)) lt!553757))))

(assert (=> b!1218598 (= lt!553756 (addStillNotContains!300 lt!553760 lt!553758 lt!553755 lt!553757))))

(assert (=> b!1218598 (= lt!553757 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1218598 (= lt!553755 (get!19378 (select (arr!37955 lt!553627) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1218598 (= lt!553758 (select (arr!37954 lt!553625) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1218598 (= lt!553760 call!60684)))

(assert (=> b!1218598 (= e!691931 (+!4102 call!60684 (tuple2!19965 (select (arr!37954 lt!553625) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19378 (select (arr!37955 lt!553627) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!691930 () Bool)

(declare-fun b!1218599 () Bool)

(assert (=> b!1218599 (= e!691930 (= lt!553759 (getCurrentListMapNoExtraKeys!5443 lt!553625 lt!553627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1218600 () Bool)

(assert (=> b!1218600 (= e!691934 (validKeyInArray!0 (select (arr!37954 lt!553625) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218600 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun bm!60681 () Bool)

(assert (=> bm!60681 (= call!60684 (getCurrentListMapNoExtraKeys!5443 lt!553625 lt!553627 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1218601 () Bool)

(assert (=> b!1218601 (= e!691930 (isEmpty!998 lt!553759))))

(declare-fun b!1218602 () Bool)

(declare-fun e!691935 () Bool)

(assert (=> b!1218602 (= e!691932 e!691935)))

(assert (=> b!1218602 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 lt!553625)))))

(declare-fun res!808902 () Bool)

(assert (=> b!1218602 (= res!808902 (contains!7041 lt!553759 (select (arr!37954 lt!553625) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1218602 (=> (not res!808902) (not e!691935))))

(declare-fun b!1218603 () Bool)

(assert (=> b!1218603 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 lt!553625)))))

(assert (=> b!1218603 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38492 lt!553627)))))

(assert (=> b!1218603 (= e!691935 (= (apply!979 lt!553759 (select (arr!37954 lt!553625) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19378 (select (arr!37955 lt!553627) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1218604 () Bool)

(assert (=> b!1218604 (= e!691932 e!691930)))

(declare-fun c!120479 () Bool)

(assert (=> b!1218604 (= c!120479 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 lt!553625)))))

(declare-fun b!1218605 () Bool)

(assert (=> b!1218605 (= e!691933 e!691931)))

(declare-fun c!120480 () Bool)

(assert (=> b!1218605 (= c!120480 (validKeyInArray!0 (select (arr!37954 lt!553625) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!134019 c!120478) b!1218597))

(assert (= (and d!134019 (not c!120478)) b!1218605))

(assert (= (and b!1218605 c!120480) b!1218598))

(assert (= (and b!1218605 (not c!120480)) b!1218594))

(assert (= (or b!1218598 b!1218594) bm!60681))

(assert (= (and d!134019 res!808901) b!1218595))

(assert (= (and b!1218595 res!808900) b!1218596))

(assert (= (and b!1218596 res!808899) b!1218600))

(assert (= (and b!1218596 c!120477) b!1218602))

(assert (= (and b!1218596 (not c!120477)) b!1218604))

(assert (= (and b!1218602 res!808902) b!1218603))

(assert (= (and b!1218604 c!120479) b!1218599))

(assert (= (and b!1218604 (not c!120479)) b!1218601))

(declare-fun b_lambda!21905 () Bool)

(assert (=> (not b_lambda!21905) (not b!1218598)))

(assert (=> b!1218598 t!39959))

(declare-fun b_and!43573 () Bool)

(assert (= b_and!43571 (and (=> t!39959 result!22619) b_and!43573)))

(declare-fun b_lambda!21907 () Bool)

(assert (=> (not b_lambda!21907) (not b!1218603)))

(assert (=> b!1218603 t!39959))

(declare-fun b_and!43575 () Bool)

(assert (= b_and!43573 (and (=> t!39959 result!22619) b_and!43575)))

(declare-fun m!1123647 () Bool)

(assert (=> b!1218599 m!1123647))

(declare-fun m!1123649 () Bool)

(assert (=> b!1218602 m!1123649))

(assert (=> b!1218602 m!1123649))

(declare-fun m!1123651 () Bool)

(assert (=> b!1218602 m!1123651))

(declare-fun m!1123653 () Bool)

(assert (=> b!1218595 m!1123653))

(assert (=> b!1218605 m!1123649))

(assert (=> b!1218605 m!1123649))

(declare-fun m!1123655 () Bool)

(assert (=> b!1218605 m!1123655))

(declare-fun m!1123657 () Bool)

(assert (=> b!1218601 m!1123657))

(declare-fun m!1123659 () Bool)

(assert (=> d!134019 m!1123659))

(assert (=> d!134019 m!1123389))

(assert (=> bm!60681 m!1123647))

(assert (=> b!1218603 m!1123649))

(assert (=> b!1218603 m!1123649))

(declare-fun m!1123661 () Bool)

(assert (=> b!1218603 m!1123661))

(declare-fun m!1123663 () Bool)

(assert (=> b!1218603 m!1123663))

(assert (=> b!1218603 m!1123407))

(declare-fun m!1123665 () Bool)

(assert (=> b!1218603 m!1123665))

(assert (=> b!1218603 m!1123663))

(assert (=> b!1218603 m!1123407))

(assert (=> b!1218598 m!1123649))

(declare-fun m!1123667 () Bool)

(assert (=> b!1218598 m!1123667))

(assert (=> b!1218598 m!1123663))

(assert (=> b!1218598 m!1123407))

(assert (=> b!1218598 m!1123665))

(assert (=> b!1218598 m!1123667))

(declare-fun m!1123669 () Bool)

(assert (=> b!1218598 m!1123669))

(assert (=> b!1218598 m!1123663))

(assert (=> b!1218598 m!1123407))

(declare-fun m!1123671 () Bool)

(assert (=> b!1218598 m!1123671))

(declare-fun m!1123673 () Bool)

(assert (=> b!1218598 m!1123673))

(assert (=> b!1218600 m!1123649))

(assert (=> b!1218600 m!1123649))

(assert (=> b!1218600 m!1123655))

(assert (=> b!1218373 d!134019))

(declare-fun call!60689 () ListLongMap!17941)

(declare-fun e!691942 () Bool)

(declare-fun call!60690 () ListLongMap!17941)

(declare-fun b!1218612 () Bool)

(assert (=> b!1218612 (= e!691942 (= call!60690 (-!1877 call!60689 k0!934)))))

(assert (=> b!1218612 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38492 _values!996)))))

(declare-fun bm!60686 () Bool)

(assert (=> bm!60686 (= call!60689 (getCurrentListMapNoExtraKeys!5443 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218613 () Bool)

(declare-fun e!691941 () Bool)

(assert (=> b!1218613 (= e!691941 e!691942)))

(declare-fun c!120483 () Bool)

(assert (=> b!1218613 (= c!120483 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!60687 () Bool)

(assert (=> bm!60687 (= call!60690 (getCurrentListMapNoExtraKeys!5443 (array!78652 (store (arr!37954 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38491 _keys!1208)) (array!78654 (store (arr!37955 _values!996) i!673 (ValueCellFull!14750 (dynLambda!3352 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38492 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218614 () Bool)

(assert (=> b!1218614 (= e!691942 (= call!60690 call!60689))))

(assert (=> b!1218614 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38492 _values!996)))))

(declare-fun d!134021 () Bool)

(assert (=> d!134021 e!691941))

(declare-fun res!808905 () Bool)

(assert (=> d!134021 (=> (not res!808905) (not e!691941))))

(assert (=> d!134021 (= res!808905 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38491 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38491 _keys!1208))))))))

(declare-fun lt!553764 () Unit!40328)

(declare-fun choose!1826 (array!78651 array!78653 (_ BitVec 32) (_ BitVec 32) V!46353 V!46353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40328)

(assert (=> d!134021 (= lt!553764 (choose!1826 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!134021 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38491 _keys!1208)))))

(assert (=> d!134021 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1092 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!553764)))

(assert (= (and d!134021 res!808905) b!1218613))

(assert (= (and b!1218613 c!120483) b!1218612))

(assert (= (and b!1218613 (not c!120483)) b!1218614))

(assert (= (or b!1218612 b!1218614) bm!60686))

(assert (= (or b!1218612 b!1218614) bm!60687))

(declare-fun b_lambda!21909 () Bool)

(assert (=> (not b_lambda!21909) (not bm!60687)))

(assert (=> bm!60687 t!39959))

(declare-fun b_and!43577 () Bool)

(assert (= b_and!43575 (and (=> t!39959 result!22619) b_and!43577)))

(declare-fun m!1123675 () Bool)

(assert (=> b!1218612 m!1123675))

(assert (=> bm!60686 m!1123377))

(assert (=> bm!60687 m!1123373))

(assert (=> bm!60687 m!1123407))

(declare-fun m!1123677 () Bool)

(assert (=> bm!60687 m!1123677))

(declare-fun m!1123679 () Bool)

(assert (=> bm!60687 m!1123679))

(declare-fun m!1123681 () Bool)

(assert (=> d!134021 m!1123681))

(assert (=> b!1218373 d!134021))

(declare-fun d!134023 () Bool)

(declare-fun lt!553767 () ListLongMap!17941)

(assert (=> d!134023 (not (contains!7041 lt!553767 k0!934))))

(declare-fun removeStrictlySorted!102 (List!26774 (_ BitVec 64)) List!26774)

(assert (=> d!134023 (= lt!553767 (ListLongMap!17942 (removeStrictlySorted!102 (toList!8986 lt!553628) k0!934)))))

(assert (=> d!134023 (= (-!1877 lt!553628 k0!934) lt!553767)))

(declare-fun bs!34325 () Bool)

(assert (= bs!34325 d!134023))

(declare-fun m!1123683 () Bool)

(assert (=> bs!34325 m!1123683))

(declare-fun m!1123685 () Bool)

(assert (=> bs!34325 m!1123685))

(assert (=> b!1218373 d!134023))

(declare-fun bm!60688 () Bool)

(declare-fun call!60691 () Bool)

(declare-fun c!120484 () Bool)

(assert (=> bm!60688 (= call!60691 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120484 (Cons!26769 (select (arr!37954 _keys!1208) #b00000000000000000000000000000000) Nil!26770) Nil!26770)))))

(declare-fun b!1218615 () Bool)

(declare-fun e!691943 () Bool)

(assert (=> b!1218615 (= e!691943 (contains!7040 Nil!26770 (select (arr!37954 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1218616 () Bool)

(declare-fun e!691944 () Bool)

(assert (=> b!1218616 (= e!691944 call!60691)))

(declare-fun b!1218617 () Bool)

(declare-fun e!691946 () Bool)

(declare-fun e!691945 () Bool)

(assert (=> b!1218617 (= e!691946 e!691945)))

(declare-fun res!808908 () Bool)

(assert (=> b!1218617 (=> (not res!808908) (not e!691945))))

(assert (=> b!1218617 (= res!808908 (not e!691943))))

(declare-fun res!808906 () Bool)

(assert (=> b!1218617 (=> (not res!808906) (not e!691943))))

(assert (=> b!1218617 (= res!808906 (validKeyInArray!0 (select (arr!37954 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!134025 () Bool)

(declare-fun res!808907 () Bool)

(assert (=> d!134025 (=> res!808907 e!691946)))

(assert (=> d!134025 (= res!808907 (bvsge #b00000000000000000000000000000000 (size!38491 _keys!1208)))))

(assert (=> d!134025 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26770) e!691946)))

(declare-fun b!1218618 () Bool)

(assert (=> b!1218618 (= e!691944 call!60691)))

(declare-fun b!1218619 () Bool)

(assert (=> b!1218619 (= e!691945 e!691944)))

(assert (=> b!1218619 (= c!120484 (validKeyInArray!0 (select (arr!37954 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!134025 (not res!808907)) b!1218617))

(assert (= (and b!1218617 res!808906) b!1218615))

(assert (= (and b!1218617 res!808908) b!1218619))

(assert (= (and b!1218619 c!120484) b!1218618))

(assert (= (and b!1218619 (not c!120484)) b!1218616))

(assert (= (or b!1218618 b!1218616) bm!60688))

(assert (=> bm!60688 m!1123521))

(declare-fun m!1123687 () Bool)

(assert (=> bm!60688 m!1123687))

(assert (=> b!1218615 m!1123521))

(assert (=> b!1218615 m!1123521))

(declare-fun m!1123689 () Bool)

(assert (=> b!1218615 m!1123689))

(assert (=> b!1218617 m!1123521))

(assert (=> b!1218617 m!1123521))

(assert (=> b!1218617 m!1123533))

(assert (=> b!1218619 m!1123521))

(assert (=> b!1218619 m!1123521))

(assert (=> b!1218619 m!1123533))

(assert (=> b!1218372 d!134025))

(declare-fun mapNonEmpty!48262 () Bool)

(declare-fun mapRes!48262 () Bool)

(declare-fun tp!91682 () Bool)

(declare-fun e!691951 () Bool)

(assert (=> mapNonEmpty!48262 (= mapRes!48262 (and tp!91682 e!691951))))

(declare-fun mapRest!48262 () (Array (_ BitVec 32) ValueCell!14750))

(declare-fun mapKey!48262 () (_ BitVec 32))

(declare-fun mapValue!48262 () ValueCell!14750)

(assert (=> mapNonEmpty!48262 (= mapRest!48253 (store mapRest!48262 mapKey!48262 mapValue!48262))))

(declare-fun b!1218626 () Bool)

(assert (=> b!1218626 (= e!691951 tp_is_empty!30919)))

(declare-fun mapIsEmpty!48262 () Bool)

(assert (=> mapIsEmpty!48262 mapRes!48262))

(declare-fun b!1218627 () Bool)

(declare-fun e!691952 () Bool)

(assert (=> b!1218627 (= e!691952 tp_is_empty!30919)))

(declare-fun condMapEmpty!48262 () Bool)

(declare-fun mapDefault!48262 () ValueCell!14750)

(assert (=> mapNonEmpty!48253 (= condMapEmpty!48262 (= mapRest!48253 ((as const (Array (_ BitVec 32) ValueCell!14750)) mapDefault!48262)))))

(assert (=> mapNonEmpty!48253 (= tp!91667 (and e!691952 mapRes!48262))))

(assert (= (and mapNonEmpty!48253 condMapEmpty!48262) mapIsEmpty!48262))

(assert (= (and mapNonEmpty!48253 (not condMapEmpty!48262)) mapNonEmpty!48262))

(assert (= (and mapNonEmpty!48262 ((_ is ValueCellFull!14750) mapValue!48262)) b!1218626))

(assert (= (and mapNonEmpty!48253 ((_ is ValueCellFull!14750) mapDefault!48262)) b!1218627))

(declare-fun m!1123691 () Bool)

(assert (=> mapNonEmpty!48262 m!1123691))

(declare-fun b_lambda!21911 () Bool)

(assert (= b_lambda!21907 (or (and start!101528 b_free!26215) b_lambda!21911)))

(declare-fun b_lambda!21913 () Bool)

(assert (= b_lambda!21905 (or (and start!101528 b_free!26215) b_lambda!21913)))

(declare-fun b_lambda!21915 () Bool)

(assert (= b_lambda!21903 (or (and start!101528 b_free!26215) b_lambda!21915)))

(declare-fun b_lambda!21917 () Bool)

(assert (= b_lambda!21909 (or (and start!101528 b_free!26215) b_lambda!21917)))

(declare-fun b_lambda!21919 () Bool)

(assert (= b_lambda!21895 (or (and start!101528 b_free!26215) b_lambda!21919)))

(declare-fun b_lambda!21921 () Bool)

(assert (= b_lambda!21897 (or (and start!101528 b_free!26215) b_lambda!21921)))

(declare-fun b_lambda!21923 () Bool)

(assert (= b_lambda!21899 (or (and start!101528 b_free!26215) b_lambda!21923)))

(declare-fun b_lambda!21925 () Bool)

(assert (= b_lambda!21893 (or (and start!101528 b_free!26215) b_lambda!21925)))

(declare-fun b_lambda!21927 () Bool)

(assert (= b_lambda!21901 (or (and start!101528 b_free!26215) b_lambda!21927)))

(check-sat (not b!1218571) (not b!1218588) (not bm!60686) (not b_next!26215) (not b!1218576) tp_is_empty!30919 (not b!1218522) (not bm!60675) (not b!1218528) (not b!1218502) (not b!1218599) (not b!1218513) (not b!1218569) (not b!1218530) (not mapNonEmpty!48262) (not b!1218574) (not b!1218615) (not bm!60678) (not b!1218600) (not b!1218595) (not b!1218565) (not b!1218490) (not b!1218579) (not b_lambda!21919) (not b!1218603) (not b!1218581) (not d!134013) (not b!1218587) (not b!1218533) (not b!1218591) (not b!1218515) (not b!1218567) (not bm!60680) (not b!1218529) (not b!1218562) (not b!1218523) (not b_lambda!21921) (not b_lambda!21915) (not b!1218564) (not d!134005) (not b_lambda!21927) (not b!1218589) (not d!134017) (not d!134019) (not b!1218602) (not b!1218577) (not b!1218583) (not b!1218575) (not bm!60687) (not b!1218598) (not b!1218605) (not d!133991) (not b!1218578) (not d!134011) (not b!1218590) (not b!1218612) (not bm!60679) (not b_lambda!21923) (not b!1218499) (not bm!60671) (not b_lambda!21891) (not b!1218559) (not b_lambda!21917) (not bm!60681) (not b!1218617) (not b_lambda!21913) (not b_lambda!21911) (not b!1218601) (not b!1218563) (not bm!60688) (not b!1218586) (not b!1218517) b_and!43577 (not b!1218619) (not bm!60674) (not b_lambda!21925) (not b!1218566) (not d!134023) (not b!1218593) (not d!134021))
(check-sat b_and!43577 (not b_next!26215))
