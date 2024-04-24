; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101898 () Bool)

(assert start!101898)

(declare-fun b_free!26383 () Bool)

(declare-fun b_next!26383 () Bool)

(assert (=> start!101898 (= b_free!26383 (not b_next!26383))))

(declare-fun tp!92191 () Bool)

(declare-fun b_and!44011 () Bool)

(assert (=> start!101898 (= tp!92191 b_and!44011)))

(declare-fun b!1224387 () Bool)

(declare-fun res!813189 () Bool)

(declare-fun e!695457 () Bool)

(assert (=> b!1224387 (=> (not res!813189) (not e!695457))))

(declare-datatypes ((array!78993 0))(
  ( (array!78994 (arr!38118 (Array (_ BitVec 32) (_ BitVec 64))) (size!38655 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78993)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78993 (_ BitVec 32)) Bool)

(assert (=> b!1224387 (= res!813189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224388 () Bool)

(declare-fun res!813190 () Bool)

(assert (=> b!1224388 (=> (not res!813190) (not e!695457))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1224388 (= res!813190 (= (select (arr!38118 _keys!1208) i!673) k0!934))))

(declare-fun b!1224389 () Bool)

(declare-fun e!695461 () Bool)

(declare-fun e!695458 () Bool)

(assert (=> b!1224389 (= e!695461 e!695458)))

(declare-fun res!813191 () Bool)

(assert (=> b!1224389 (=> res!813191 e!695458)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1224389 (= res!813191 (not (= (select (arr!38118 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224390 () Bool)

(declare-fun e!695456 () Bool)

(declare-fun e!695459 () Bool)

(declare-fun mapRes!48526 () Bool)

(assert (=> b!1224390 (= e!695456 (and e!695459 mapRes!48526))))

(declare-fun condMapEmpty!48526 () Bool)

(declare-datatypes ((V!46577 0))(
  ( (V!46578 (val!15600 Int)) )
))
(declare-datatypes ((ValueCell!14834 0))(
  ( (ValueCellFull!14834 (v!18257 V!46577)) (EmptyCell!14834) )
))
(declare-datatypes ((array!78995 0))(
  ( (array!78996 (arr!38119 (Array (_ BitVec 32) ValueCell!14834)) (size!38656 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78995)

(declare-fun mapDefault!48526 () ValueCell!14834)

(assert (=> b!1224390 (= condMapEmpty!48526 (= (arr!38119 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14834)) mapDefault!48526)))))

(declare-fun b!1224391 () Bool)

(declare-fun arrayContainsKey!0 (array!78993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224391 (= e!695458 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224392 () Bool)

(declare-fun e!695462 () Bool)

(assert (=> b!1224392 (= e!695457 e!695462)))

(declare-fun res!813193 () Bool)

(assert (=> b!1224392 (=> (not res!813193) (not e!695462))))

(declare-fun lt!557103 () array!78993)

(assert (=> b!1224392 (= res!813193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557103 mask!1564))))

(assert (=> b!1224392 (= lt!557103 (array!78994 (store (arr!38118 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38655 _keys!1208)))))

(declare-fun mapNonEmpty!48526 () Bool)

(declare-fun tp!92192 () Bool)

(declare-fun e!695464 () Bool)

(assert (=> mapNonEmpty!48526 (= mapRes!48526 (and tp!92192 e!695464))))

(declare-fun mapValue!48526 () ValueCell!14834)

(declare-fun mapRest!48526 () (Array (_ BitVec 32) ValueCell!14834))

(declare-fun mapKey!48526 () (_ BitVec 32))

(assert (=> mapNonEmpty!48526 (= (arr!38119 _values!996) (store mapRest!48526 mapKey!48526 mapValue!48526))))

(declare-fun b!1224393 () Bool)

(declare-fun res!813187 () Bool)

(assert (=> b!1224393 (=> (not res!813187) (not e!695457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224393 (= res!813187 (validKeyInArray!0 k0!934))))

(declare-fun b!1224394 () Bool)

(declare-fun tp_is_empty!31087 () Bool)

(assert (=> b!1224394 (= e!695464 tp_is_empty!31087)))

(declare-fun b!1224395 () Bool)

(declare-fun e!695455 () Bool)

(declare-fun e!695466 () Bool)

(assert (=> b!1224395 (= e!695455 e!695466)))

(declare-fun res!813195 () Bool)

(assert (=> b!1224395 (=> res!813195 e!695466)))

(assert (=> b!1224395 (= res!813195 (not (validKeyInArray!0 (select (arr!38118 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20106 0))(
  ( (tuple2!20107 (_1!10064 (_ BitVec 64)) (_2!10064 V!46577)) )
))
(declare-datatypes ((List!26919 0))(
  ( (Nil!26916) (Cons!26915 (h!28133 tuple2!20106) (t!40274 List!26919)) )
))
(declare-datatypes ((ListLongMap!18083 0))(
  ( (ListLongMap!18084 (toList!9057 List!26919)) )
))
(declare-fun lt!557109 () ListLongMap!18083)

(declare-fun lt!557105 () ListLongMap!18083)

(assert (=> b!1224395 (= lt!557109 lt!557105)))

(declare-fun lt!557100 () ListLongMap!18083)

(declare-fun -!1935 (ListLongMap!18083 (_ BitVec 64)) ListLongMap!18083)

(assert (=> b!1224395 (= lt!557105 (-!1935 lt!557100 k0!934))))

(declare-fun zeroValue!944 () V!46577)

(declare-fun lt!557106 () array!78995)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46577)

(declare-fun getCurrentListMapNoExtraKeys!5509 (array!78993 array!78995 (_ BitVec 32) (_ BitVec 32) V!46577 V!46577 (_ BitVec 32) Int) ListLongMap!18083)

(assert (=> b!1224395 (= lt!557109 (getCurrentListMapNoExtraKeys!5509 lt!557103 lt!557106 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224395 (= lt!557100 (getCurrentListMapNoExtraKeys!5509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40482 0))(
  ( (Unit!40483) )
))
(declare-fun lt!557111 () Unit!40482)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1150 (array!78993 array!78995 (_ BitVec 32) (_ BitVec 32) V!46577 V!46577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40482)

(assert (=> b!1224395 (= lt!557111 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1150 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224396 () Bool)

(declare-fun res!813186 () Bool)

(assert (=> b!1224396 (=> (not res!813186) (not e!695462))))

(declare-datatypes ((List!26920 0))(
  ( (Nil!26917) (Cons!26916 (h!28134 (_ BitVec 64)) (t!40275 List!26920)) )
))
(declare-fun arrayNoDuplicates!0 (array!78993 (_ BitVec 32) List!26920) Bool)

(assert (=> b!1224396 (= res!813186 (arrayNoDuplicates!0 lt!557103 #b00000000000000000000000000000000 Nil!26917))))

(declare-fun b!1224397 () Bool)

(declare-fun res!813196 () Bool)

(assert (=> b!1224397 (=> (not res!813196) (not e!695457))))

(assert (=> b!1224397 (= res!813196 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38655 _keys!1208))))))

(declare-fun b!1224398 () Bool)

(declare-fun res!813197 () Bool)

(assert (=> b!1224398 (=> (not res!813197) (not e!695457))))

(assert (=> b!1224398 (= res!813197 (and (= (size!38656 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38655 _keys!1208) (size!38656 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224399 () Bool)

(declare-fun e!695465 () Unit!40482)

(declare-fun Unit!40484 () Unit!40482)

(assert (=> b!1224399 (= e!695465 Unit!40484)))

(declare-fun b!1224400 () Bool)

(declare-fun res!813198 () Bool)

(assert (=> b!1224400 (=> (not res!813198) (not e!695457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224400 (= res!813198 (validMask!0 mask!1564))))

(declare-fun lt!557099 () tuple2!20106)

(declare-fun lt!557104 () ListLongMap!18083)

(declare-fun b!1224401 () Bool)

(declare-fun +!4159 (ListLongMap!18083 tuple2!20106) ListLongMap!18083)

(assert (=> b!1224401 (= e!695466 (= lt!557104 (+!4159 lt!557100 lt!557099)))))

(assert (=> b!1224401 (not (= (select (arr!38118 _keys!1208) from!1455) k0!934))))

(declare-fun lt!557110 () Unit!40482)

(assert (=> b!1224401 (= lt!557110 e!695465)))

(declare-fun c!120754 () Bool)

(assert (=> b!1224401 (= c!120754 (= (select (arr!38118 _keys!1208) from!1455) k0!934))))

(assert (=> b!1224401 e!695461))

(declare-fun res!813199 () Bool)

(assert (=> b!1224401 (=> (not res!813199) (not e!695461))))

(declare-fun lt!557112 () ListLongMap!18083)

(assert (=> b!1224401 (= res!813199 (= lt!557112 (+!4159 lt!557105 lt!557099)))))

(declare-fun lt!557108 () V!46577)

(declare-fun get!19505 (ValueCell!14834 V!46577) V!46577)

(assert (=> b!1224401 (= lt!557099 (tuple2!20107 (select (arr!38118 _keys!1208) from!1455) (get!19505 (select (arr!38119 _values!996) from!1455) lt!557108)))))

(declare-fun b!1224402 () Bool)

(assert (=> b!1224402 (= e!695459 tp_is_empty!31087)))

(declare-fun b!1224403 () Bool)

(declare-fun e!695460 () Bool)

(assert (=> b!1224403 (= e!695460 e!695455)))

(declare-fun res!813192 () Bool)

(assert (=> b!1224403 (=> res!813192 e!695455)))

(assert (=> b!1224403 (= res!813192 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1224403 (= lt!557112 (getCurrentListMapNoExtraKeys!5509 lt!557103 lt!557106 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1224403 (= lt!557106 (array!78996 (store (arr!38119 _values!996) i!673 (ValueCellFull!14834 lt!557108)) (size!38656 _values!996)))))

(declare-fun dynLambda!3408 (Int (_ BitVec 64)) V!46577)

(assert (=> b!1224403 (= lt!557108 (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1224403 (= lt!557104 (getCurrentListMapNoExtraKeys!5509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224404 () Bool)

(declare-fun res!813188 () Bool)

(assert (=> b!1224404 (=> (not res!813188) (not e!695457))))

(assert (=> b!1224404 (= res!813188 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26917))))

(declare-fun res!813194 () Bool)

(assert (=> start!101898 (=> (not res!813194) (not e!695457))))

(assert (=> start!101898 (= res!813194 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38655 _keys!1208))))))

(assert (=> start!101898 e!695457))

(assert (=> start!101898 tp_is_empty!31087))

(declare-fun array_inv!29078 (array!78993) Bool)

(assert (=> start!101898 (array_inv!29078 _keys!1208)))

(assert (=> start!101898 true))

(assert (=> start!101898 tp!92191))

(declare-fun array_inv!29079 (array!78995) Bool)

(assert (=> start!101898 (and (array_inv!29079 _values!996) e!695456)))

(declare-fun mapIsEmpty!48526 () Bool)

(assert (=> mapIsEmpty!48526 mapRes!48526))

(declare-fun b!1224405 () Bool)

(declare-fun Unit!40485 () Unit!40482)

(assert (=> b!1224405 (= e!695465 Unit!40485)))

(declare-fun lt!557102 () Unit!40482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78993 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40482)

(assert (=> b!1224405 (= lt!557102 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224405 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557107 () Unit!40482)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78993 (_ BitVec 32) (_ BitVec 32)) Unit!40482)

(assert (=> b!1224405 (= lt!557107 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224405 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26917)))

(declare-fun lt!557101 () Unit!40482)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78993 (_ BitVec 64) (_ BitVec 32) List!26920) Unit!40482)

(assert (=> b!1224405 (= lt!557101 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26917))))

(assert (=> b!1224405 false))

(declare-fun b!1224406 () Bool)

(assert (=> b!1224406 (= e!695462 (not e!695460))))

(declare-fun res!813185 () Bool)

(assert (=> b!1224406 (=> res!813185 e!695460)))

(assert (=> b!1224406 (= res!813185 (bvsgt from!1455 i!673))))

(assert (=> b!1224406 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557113 () Unit!40482)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78993 (_ BitVec 64) (_ BitVec 32)) Unit!40482)

(assert (=> b!1224406 (= lt!557113 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101898 res!813194) b!1224400))

(assert (= (and b!1224400 res!813198) b!1224398))

(assert (= (and b!1224398 res!813197) b!1224387))

(assert (= (and b!1224387 res!813189) b!1224404))

(assert (= (and b!1224404 res!813188) b!1224397))

(assert (= (and b!1224397 res!813196) b!1224393))

(assert (= (and b!1224393 res!813187) b!1224388))

(assert (= (and b!1224388 res!813190) b!1224392))

(assert (= (and b!1224392 res!813193) b!1224396))

(assert (= (and b!1224396 res!813186) b!1224406))

(assert (= (and b!1224406 (not res!813185)) b!1224403))

(assert (= (and b!1224403 (not res!813192)) b!1224395))

(assert (= (and b!1224395 (not res!813195)) b!1224401))

(assert (= (and b!1224401 res!813199) b!1224389))

(assert (= (and b!1224389 (not res!813191)) b!1224391))

(assert (= (and b!1224401 c!120754) b!1224405))

(assert (= (and b!1224401 (not c!120754)) b!1224399))

(assert (= (and b!1224390 condMapEmpty!48526) mapIsEmpty!48526))

(assert (= (and b!1224390 (not condMapEmpty!48526)) mapNonEmpty!48526))

(get-info :version)

(assert (= (and mapNonEmpty!48526 ((_ is ValueCellFull!14834) mapValue!48526)) b!1224394))

(assert (= (and b!1224390 ((_ is ValueCellFull!14834) mapDefault!48526)) b!1224402))

(assert (= start!101898 b!1224390))

(declare-fun b_lambda!22319 () Bool)

(assert (=> (not b_lambda!22319) (not b!1224403)))

(declare-fun t!40273 () Bool)

(declare-fun tb!11175 () Bool)

(assert (=> (and start!101898 (= defaultEntry!1004 defaultEntry!1004) t!40273) tb!11175))

(declare-fun result!22969 () Bool)

(assert (=> tb!11175 (= result!22969 tp_is_empty!31087)))

(assert (=> b!1224403 t!40273))

(declare-fun b_and!44013 () Bool)

(assert (= b_and!44011 (and (=> t!40273 result!22969) b_and!44013)))

(declare-fun m!1129643 () Bool)

(assert (=> b!1224393 m!1129643))

(declare-fun m!1129645 () Bool)

(assert (=> b!1224401 m!1129645))

(assert (=> b!1224401 m!1129645))

(declare-fun m!1129647 () Bool)

(assert (=> b!1224401 m!1129647))

(declare-fun m!1129649 () Bool)

(assert (=> b!1224401 m!1129649))

(declare-fun m!1129651 () Bool)

(assert (=> b!1224401 m!1129651))

(declare-fun m!1129653 () Bool)

(assert (=> b!1224401 m!1129653))

(declare-fun m!1129655 () Bool)

(assert (=> b!1224405 m!1129655))

(declare-fun m!1129657 () Bool)

(assert (=> b!1224405 m!1129657))

(declare-fun m!1129659 () Bool)

(assert (=> b!1224405 m!1129659))

(declare-fun m!1129661 () Bool)

(assert (=> b!1224405 m!1129661))

(declare-fun m!1129663 () Bool)

(assert (=> b!1224405 m!1129663))

(declare-fun m!1129665 () Bool)

(assert (=> start!101898 m!1129665))

(declare-fun m!1129667 () Bool)

(assert (=> start!101898 m!1129667))

(declare-fun m!1129669 () Bool)

(assert (=> b!1224406 m!1129669))

(declare-fun m!1129671 () Bool)

(assert (=> b!1224406 m!1129671))

(declare-fun m!1129673 () Bool)

(assert (=> b!1224395 m!1129673))

(declare-fun m!1129675 () Bool)

(assert (=> b!1224395 m!1129675))

(declare-fun m!1129677 () Bool)

(assert (=> b!1224395 m!1129677))

(assert (=> b!1224395 m!1129649))

(declare-fun m!1129679 () Bool)

(assert (=> b!1224395 m!1129679))

(declare-fun m!1129681 () Bool)

(assert (=> b!1224395 m!1129681))

(assert (=> b!1224395 m!1129649))

(declare-fun m!1129683 () Bool)

(assert (=> b!1224400 m!1129683))

(assert (=> b!1224389 m!1129649))

(declare-fun m!1129685 () Bool)

(assert (=> mapNonEmpty!48526 m!1129685))

(declare-fun m!1129687 () Bool)

(assert (=> b!1224403 m!1129687))

(declare-fun m!1129689 () Bool)

(assert (=> b!1224403 m!1129689))

(declare-fun m!1129691 () Bool)

(assert (=> b!1224403 m!1129691))

(declare-fun m!1129693 () Bool)

(assert (=> b!1224403 m!1129693))

(declare-fun m!1129695 () Bool)

(assert (=> b!1224392 m!1129695))

(declare-fun m!1129697 () Bool)

(assert (=> b!1224392 m!1129697))

(declare-fun m!1129699 () Bool)

(assert (=> b!1224388 m!1129699))

(declare-fun m!1129701 () Bool)

(assert (=> b!1224404 m!1129701))

(declare-fun m!1129703 () Bool)

(assert (=> b!1224387 m!1129703))

(declare-fun m!1129705 () Bool)

(assert (=> b!1224391 m!1129705))

(declare-fun m!1129707 () Bool)

(assert (=> b!1224396 m!1129707))

(check-sat (not b!1224404) (not start!101898) (not b!1224391) (not b_next!26383) (not b!1224393) (not b!1224406) (not b!1224396) (not b!1224401) (not b!1224403) tp_is_empty!31087 (not b!1224405) b_and!44013 (not mapNonEmpty!48526) (not b!1224387) (not b!1224392) (not b!1224400) (not b_lambda!22319) (not b!1224395))
(check-sat b_and!44013 (not b_next!26383))
(get-model)

(declare-fun b_lambda!22325 () Bool)

(assert (= b_lambda!22319 (or (and start!101898 b_free!26383) b_lambda!22325)))

(check-sat (not b!1224404) (not start!101898) (not b!1224395) (not b_next!26383) (not b!1224393) (not b!1224406) (not b!1224396) (not b!1224401) (not b!1224403) tp_is_empty!31087 (not b!1224405) b_and!44013 (not mapNonEmpty!48526) (not b!1224387) (not b!1224392) (not b!1224400) (not b!1224391) (not b_lambda!22325))
(check-sat b_and!44013 (not b_next!26383))
(get-model)

(declare-fun b!1224541 () Bool)

(declare-fun e!695547 () Bool)

(declare-fun call!60817 () Bool)

(assert (=> b!1224541 (= e!695547 call!60817)))

(declare-fun b!1224542 () Bool)

(declare-fun e!695545 () Bool)

(assert (=> b!1224542 (= e!695547 e!695545)))

(declare-fun lt!557210 () (_ BitVec 64))

(assert (=> b!1224542 (= lt!557210 (select (arr!38118 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!557212 () Unit!40482)

(assert (=> b!1224542 (= lt!557212 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!557210 #b00000000000000000000000000000000))))

(assert (=> b!1224542 (arrayContainsKey!0 _keys!1208 lt!557210 #b00000000000000000000000000000000)))

(declare-fun lt!557211 () Unit!40482)

(assert (=> b!1224542 (= lt!557211 lt!557212)))

(declare-fun res!813294 () Bool)

(declare-datatypes ((SeekEntryResult!9906 0))(
  ( (MissingZero!9906 (index!41995 (_ BitVec 32))) (Found!9906 (index!41996 (_ BitVec 32))) (Intermediate!9906 (undefined!10718 Bool) (index!41997 (_ BitVec 32)) (x!107686 (_ BitVec 32))) (Undefined!9906) (MissingVacant!9906 (index!41998 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78993 (_ BitVec 32)) SeekEntryResult!9906)

(assert (=> b!1224542 (= res!813294 (= (seekEntryOrOpen!0 (select (arr!38118 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9906 #b00000000000000000000000000000000)))))

(assert (=> b!1224542 (=> (not res!813294) (not e!695545))))

(declare-fun d!134359 () Bool)

(declare-fun res!813295 () Bool)

(declare-fun e!695546 () Bool)

(assert (=> d!134359 (=> res!813295 e!695546)))

(assert (=> d!134359 (= res!813295 (bvsge #b00000000000000000000000000000000 (size!38655 _keys!1208)))))

(assert (=> d!134359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!695546)))

(declare-fun b!1224543 () Bool)

(assert (=> b!1224543 (= e!695545 call!60817)))

(declare-fun b!1224544 () Bool)

(assert (=> b!1224544 (= e!695546 e!695547)))

(declare-fun c!120763 () Bool)

(assert (=> b!1224544 (= c!120763 (validKeyInArray!0 (select (arr!38118 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60814 () Bool)

(assert (=> bm!60814 (= call!60817 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!134359 (not res!813295)) b!1224544))

(assert (= (and b!1224544 c!120763) b!1224542))

(assert (= (and b!1224544 (not c!120763)) b!1224541))

(assert (= (and b!1224542 res!813294) b!1224543))

(assert (= (or b!1224543 b!1224541) bm!60814))

(declare-fun m!1129841 () Bool)

(assert (=> b!1224542 m!1129841))

(declare-fun m!1129843 () Bool)

(assert (=> b!1224542 m!1129843))

(declare-fun m!1129845 () Bool)

(assert (=> b!1224542 m!1129845))

(assert (=> b!1224542 m!1129841))

(declare-fun m!1129847 () Bool)

(assert (=> b!1224542 m!1129847))

(assert (=> b!1224544 m!1129841))

(assert (=> b!1224544 m!1129841))

(declare-fun m!1129849 () Bool)

(assert (=> b!1224544 m!1129849))

(declare-fun m!1129851 () Bool)

(assert (=> bm!60814 m!1129851))

(assert (=> b!1224387 d!134359))

(declare-fun d!134361 () Bool)

(declare-fun res!813300 () Bool)

(declare-fun e!695552 () Bool)

(assert (=> d!134361 (=> res!813300 e!695552)))

(assert (=> d!134361 (= res!813300 (= (select (arr!38118 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!134361 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!695552)))

(declare-fun b!1224549 () Bool)

(declare-fun e!695553 () Bool)

(assert (=> b!1224549 (= e!695552 e!695553)))

(declare-fun res!813301 () Bool)

(assert (=> b!1224549 (=> (not res!813301) (not e!695553))))

(assert (=> b!1224549 (= res!813301 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38655 _keys!1208)))))

(declare-fun b!1224550 () Bool)

(assert (=> b!1224550 (= e!695553 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!134361 (not res!813300)) b!1224549))

(assert (= (and b!1224549 res!813301) b!1224550))

(assert (=> d!134361 m!1129841))

(declare-fun m!1129853 () Bool)

(assert (=> b!1224550 m!1129853))

(assert (=> b!1224406 d!134361))

(declare-fun d!134363 () Bool)

(assert (=> d!134363 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557215 () Unit!40482)

(declare-fun choose!13 (array!78993 (_ BitVec 64) (_ BitVec 32)) Unit!40482)

(assert (=> d!134363 (= lt!557215 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!134363 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134363 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!557215)))

(declare-fun bs!34429 () Bool)

(assert (= bs!34429 d!134363))

(assert (=> bs!34429 m!1129669))

(declare-fun m!1129855 () Bool)

(assert (=> bs!34429 m!1129855))

(assert (=> b!1224406 d!134363))

(declare-fun b!1224561 () Bool)

(declare-fun e!695564 () Bool)

(declare-fun call!60820 () Bool)

(assert (=> b!1224561 (= e!695564 call!60820)))

(declare-fun d!134365 () Bool)

(declare-fun res!813309 () Bool)

(declare-fun e!695562 () Bool)

(assert (=> d!134365 (=> res!813309 e!695562)))

(assert (=> d!134365 (= res!813309 (bvsge #b00000000000000000000000000000000 (size!38655 lt!557103)))))

(assert (=> d!134365 (= (arrayNoDuplicates!0 lt!557103 #b00000000000000000000000000000000 Nil!26917) e!695562)))

(declare-fun b!1224562 () Bool)

(declare-fun e!695565 () Bool)

(assert (=> b!1224562 (= e!695565 e!695564)))

(declare-fun c!120766 () Bool)

(assert (=> b!1224562 (= c!120766 (validKeyInArray!0 (select (arr!38118 lt!557103) #b00000000000000000000000000000000)))))

(declare-fun b!1224563 () Bool)

(declare-fun e!695563 () Bool)

(declare-fun contains!7068 (List!26920 (_ BitVec 64)) Bool)

(assert (=> b!1224563 (= e!695563 (contains!7068 Nil!26917 (select (arr!38118 lt!557103) #b00000000000000000000000000000000)))))

(declare-fun b!1224564 () Bool)

(assert (=> b!1224564 (= e!695564 call!60820)))

(declare-fun b!1224565 () Bool)

(assert (=> b!1224565 (= e!695562 e!695565)))

(declare-fun res!813308 () Bool)

(assert (=> b!1224565 (=> (not res!813308) (not e!695565))))

(assert (=> b!1224565 (= res!813308 (not e!695563))))

(declare-fun res!813310 () Bool)

(assert (=> b!1224565 (=> (not res!813310) (not e!695563))))

(assert (=> b!1224565 (= res!813310 (validKeyInArray!0 (select (arr!38118 lt!557103) #b00000000000000000000000000000000)))))

(declare-fun bm!60817 () Bool)

(assert (=> bm!60817 (= call!60820 (arrayNoDuplicates!0 lt!557103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120766 (Cons!26916 (select (arr!38118 lt!557103) #b00000000000000000000000000000000) Nil!26917) Nil!26917)))))

(assert (= (and d!134365 (not res!813309)) b!1224565))

(assert (= (and b!1224565 res!813310) b!1224563))

(assert (= (and b!1224565 res!813308) b!1224562))

(assert (= (and b!1224562 c!120766) b!1224561))

(assert (= (and b!1224562 (not c!120766)) b!1224564))

(assert (= (or b!1224561 b!1224564) bm!60817))

(declare-fun m!1129857 () Bool)

(assert (=> b!1224562 m!1129857))

(assert (=> b!1224562 m!1129857))

(declare-fun m!1129859 () Bool)

(assert (=> b!1224562 m!1129859))

(assert (=> b!1224563 m!1129857))

(assert (=> b!1224563 m!1129857))

(declare-fun m!1129861 () Bool)

(assert (=> b!1224563 m!1129861))

(assert (=> b!1224565 m!1129857))

(assert (=> b!1224565 m!1129857))

(assert (=> b!1224565 m!1129859))

(assert (=> bm!60817 m!1129857))

(declare-fun m!1129863 () Bool)

(assert (=> bm!60817 m!1129863))

(assert (=> b!1224396 d!134365))

(declare-fun d!134367 () Bool)

(assert (=> d!134367 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26917)))

(declare-fun lt!557218 () Unit!40482)

(declare-fun choose!39 (array!78993 (_ BitVec 32) (_ BitVec 32)) Unit!40482)

(assert (=> d!134367 (= lt!557218 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!134367 (bvslt (size!38655 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!134367 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!557218)))

(declare-fun bs!34430 () Bool)

(assert (= bs!34430 d!134367))

(assert (=> bs!34430 m!1129663))

(declare-fun m!1129865 () Bool)

(assert (=> bs!34430 m!1129865))

(assert (=> b!1224405 d!134367))

(declare-fun d!134369 () Bool)

(assert (=> d!134369 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557221 () Unit!40482)

(declare-fun choose!114 (array!78993 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40482)

(assert (=> d!134369 (= lt!557221 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!134369 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134369 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!557221)))

(declare-fun bs!34431 () Bool)

(assert (= bs!34431 d!134369))

(assert (=> bs!34431 m!1129659))

(declare-fun m!1129867 () Bool)

(assert (=> bs!34431 m!1129867))

(assert (=> b!1224405 d!134369))

(declare-fun b!1224566 () Bool)

(declare-fun e!695568 () Bool)

(declare-fun call!60821 () Bool)

(assert (=> b!1224566 (= e!695568 call!60821)))

(declare-fun d!134371 () Bool)

(declare-fun res!813312 () Bool)

(declare-fun e!695566 () Bool)

(assert (=> d!134371 (=> res!813312 e!695566)))

(assert (=> d!134371 (= res!813312 (bvsge from!1455 (size!38655 _keys!1208)))))

(assert (=> d!134371 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26917) e!695566)))

(declare-fun b!1224567 () Bool)

(declare-fun e!695569 () Bool)

(assert (=> b!1224567 (= e!695569 e!695568)))

(declare-fun c!120767 () Bool)

(assert (=> b!1224567 (= c!120767 (validKeyInArray!0 (select (arr!38118 _keys!1208) from!1455)))))

(declare-fun b!1224568 () Bool)

(declare-fun e!695567 () Bool)

(assert (=> b!1224568 (= e!695567 (contains!7068 Nil!26917 (select (arr!38118 _keys!1208) from!1455)))))

(declare-fun b!1224569 () Bool)

(assert (=> b!1224569 (= e!695568 call!60821)))

(declare-fun b!1224570 () Bool)

(assert (=> b!1224570 (= e!695566 e!695569)))

(declare-fun res!813311 () Bool)

(assert (=> b!1224570 (=> (not res!813311) (not e!695569))))

(assert (=> b!1224570 (= res!813311 (not e!695567))))

(declare-fun res!813313 () Bool)

(assert (=> b!1224570 (=> (not res!813313) (not e!695567))))

(assert (=> b!1224570 (= res!813313 (validKeyInArray!0 (select (arr!38118 _keys!1208) from!1455)))))

(declare-fun bm!60818 () Bool)

(assert (=> bm!60818 (= call!60821 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120767 (Cons!26916 (select (arr!38118 _keys!1208) from!1455) Nil!26917) Nil!26917)))))

(assert (= (and d!134371 (not res!813312)) b!1224570))

(assert (= (and b!1224570 res!813313) b!1224568))

(assert (= (and b!1224570 res!813311) b!1224567))

(assert (= (and b!1224567 c!120767) b!1224566))

(assert (= (and b!1224567 (not c!120767)) b!1224569))

(assert (= (or b!1224566 b!1224569) bm!60818))

(assert (=> b!1224567 m!1129649))

(assert (=> b!1224567 m!1129649))

(assert (=> b!1224567 m!1129679))

(assert (=> b!1224568 m!1129649))

(assert (=> b!1224568 m!1129649))

(declare-fun m!1129869 () Bool)

(assert (=> b!1224568 m!1129869))

(assert (=> b!1224570 m!1129649))

(assert (=> b!1224570 m!1129649))

(assert (=> b!1224570 m!1129679))

(assert (=> bm!60818 m!1129649))

(declare-fun m!1129871 () Bool)

(assert (=> bm!60818 m!1129871))

(assert (=> b!1224405 d!134371))

(declare-fun d!134373 () Bool)

(declare-fun res!813314 () Bool)

(declare-fun e!695570 () Bool)

(assert (=> d!134373 (=> res!813314 e!695570)))

(assert (=> d!134373 (= res!813314 (= (select (arr!38118 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!134373 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!695570)))

(declare-fun b!1224571 () Bool)

(declare-fun e!695571 () Bool)

(assert (=> b!1224571 (= e!695570 e!695571)))

(declare-fun res!813315 () Bool)

(assert (=> b!1224571 (=> (not res!813315) (not e!695571))))

(assert (=> b!1224571 (= res!813315 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38655 _keys!1208)))))

(declare-fun b!1224572 () Bool)

(assert (=> b!1224572 (= e!695571 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!134373 (not res!813314)) b!1224571))

(assert (= (and b!1224571 res!813315) b!1224572))

(declare-fun m!1129873 () Bool)

(assert (=> d!134373 m!1129873))

(declare-fun m!1129875 () Bool)

(assert (=> b!1224572 m!1129875))

(assert (=> b!1224405 d!134373))

(declare-fun d!134375 () Bool)

(assert (=> d!134375 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38655 _keys!1208)) (not (= (select (arr!38118 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557224 () Unit!40482)

(declare-fun choose!21 (array!78993 (_ BitVec 64) (_ BitVec 32) List!26920) Unit!40482)

(assert (=> d!134375 (= lt!557224 (choose!21 _keys!1208 k0!934 from!1455 Nil!26917))))

(assert (=> d!134375 (bvslt (size!38655 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!134375 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26917) lt!557224)))

(declare-fun bs!34432 () Bool)

(assert (= bs!34432 d!134375))

(assert (=> bs!34432 m!1129649))

(declare-fun m!1129877 () Bool)

(assert (=> bs!34432 m!1129877))

(assert (=> b!1224405 d!134375))

(declare-fun d!134377 () Bool)

(declare-fun lt!557227 () ListLongMap!18083)

(declare-fun contains!7069 (ListLongMap!18083 (_ BitVec 64)) Bool)

(assert (=> d!134377 (not (contains!7069 lt!557227 k0!934))))

(declare-fun removeStrictlySorted!109 (List!26919 (_ BitVec 64)) List!26919)

(assert (=> d!134377 (= lt!557227 (ListLongMap!18084 (removeStrictlySorted!109 (toList!9057 lt!557100) k0!934)))))

(assert (=> d!134377 (= (-!1935 lt!557100 k0!934) lt!557227)))

(declare-fun bs!34433 () Bool)

(assert (= bs!34433 d!134377))

(declare-fun m!1129879 () Bool)

(assert (=> bs!34433 m!1129879))

(declare-fun m!1129881 () Bool)

(assert (=> bs!34433 m!1129881))

(assert (=> b!1224395 d!134377))

(declare-fun d!134379 () Bool)

(assert (=> d!134379 (= (validKeyInArray!0 (select (arr!38118 _keys!1208) from!1455)) (and (not (= (select (arr!38118 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38118 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1224395 d!134379))

(declare-fun b!1224579 () Bool)

(declare-fun e!695576 () Bool)

(declare-fun e!695577 () Bool)

(assert (=> b!1224579 (= e!695576 e!695577)))

(declare-fun c!120770 () Bool)

(assert (=> b!1224579 (= c!120770 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!134381 () Bool)

(assert (=> d!134381 e!695576))

(declare-fun res!813318 () Bool)

(assert (=> d!134381 (=> (not res!813318) (not e!695576))))

(assert (=> d!134381 (= res!813318 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38655 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38655 _keys!1208))))))))

(declare-fun lt!557230 () Unit!40482)

(declare-fun choose!1833 (array!78993 array!78995 (_ BitVec 32) (_ BitVec 32) V!46577 V!46577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40482)

(assert (=> d!134381 (= lt!557230 (choose!1833 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!134381 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 _keys!1208)))))

(assert (=> d!134381 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1150 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!557230)))

(declare-fun call!60827 () ListLongMap!18083)

(declare-fun bm!60823 () Bool)

(assert (=> bm!60823 (= call!60827 (getCurrentListMapNoExtraKeys!5509 (array!78994 (store (arr!38118 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38655 _keys!1208)) (array!78996 (store (arr!38119 _values!996) i!673 (ValueCellFull!14834 (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38656 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224580 () Bool)

(declare-fun call!60826 () ListLongMap!18083)

(assert (=> b!1224580 (= e!695577 (= call!60827 call!60826))))

(assert (=> b!1224580 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38656 _values!996)))))

(declare-fun bm!60824 () Bool)

(assert (=> bm!60824 (= call!60826 (getCurrentListMapNoExtraKeys!5509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224581 () Bool)

(assert (=> b!1224581 (= e!695577 (= call!60827 (-!1935 call!60826 k0!934)))))

(assert (=> b!1224581 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38656 _values!996)))))

(assert (= (and d!134381 res!813318) b!1224579))

(assert (= (and b!1224579 c!120770) b!1224581))

(assert (= (and b!1224579 (not c!120770)) b!1224580))

(assert (= (or b!1224581 b!1224580) bm!60824))

(assert (= (or b!1224581 b!1224580) bm!60823))

(declare-fun b_lambda!22327 () Bool)

(assert (=> (not b_lambda!22327) (not bm!60823)))

(assert (=> bm!60823 t!40273))

(declare-fun b_and!44023 () Bool)

(assert (= b_and!44013 (and (=> t!40273 result!22969) b_and!44023)))

(declare-fun m!1129883 () Bool)

(assert (=> d!134381 m!1129883))

(assert (=> bm!60823 m!1129697))

(assert (=> bm!60823 m!1129691))

(declare-fun m!1129885 () Bool)

(assert (=> bm!60823 m!1129885))

(declare-fun m!1129887 () Bool)

(assert (=> bm!60823 m!1129887))

(assert (=> bm!60824 m!1129673))

(declare-fun m!1129889 () Bool)

(assert (=> b!1224581 m!1129889))

(assert (=> b!1224395 d!134381))

(declare-fun b!1224606 () Bool)

(declare-fun e!695596 () ListLongMap!18083)

(declare-fun call!60830 () ListLongMap!18083)

(assert (=> b!1224606 (= e!695596 call!60830)))

(declare-fun lt!557250 () ListLongMap!18083)

(declare-fun b!1224607 () Bool)

(declare-fun e!695594 () Bool)

(assert (=> b!1224607 (= e!695594 (= lt!557250 (getCurrentListMapNoExtraKeys!5509 lt!557103 lt!557106 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!134383 () Bool)

(declare-fun e!695595 () Bool)

(assert (=> d!134383 e!695595))

(declare-fun res!813330 () Bool)

(assert (=> d!134383 (=> (not res!813330) (not e!695595))))

(assert (=> d!134383 (= res!813330 (not (contains!7069 lt!557250 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!695598 () ListLongMap!18083)

(assert (=> d!134383 (= lt!557250 e!695598)))

(declare-fun c!120779 () Bool)

(assert (=> d!134383 (= c!120779 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 lt!557103)))))

(assert (=> d!134383 (validMask!0 mask!1564)))

(assert (=> d!134383 (= (getCurrentListMapNoExtraKeys!5509 lt!557103 lt!557106 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!557250)))

(declare-fun b!1224608 () Bool)

(declare-fun isEmpty!1005 (ListLongMap!18083) Bool)

(assert (=> b!1224608 (= e!695594 (isEmpty!1005 lt!557250))))

(declare-fun b!1224609 () Bool)

(declare-fun e!695597 () Bool)

(assert (=> b!1224609 (= e!695597 e!695594)))

(declare-fun c!120782 () Bool)

(assert (=> b!1224609 (= c!120782 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 lt!557103)))))

(declare-fun b!1224610 () Bool)

(assert (=> b!1224610 (= e!695598 e!695596)))

(declare-fun c!120780 () Bool)

(assert (=> b!1224610 (= c!120780 (validKeyInArray!0 (select (arr!38118 lt!557103) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1224611 () Bool)

(assert (=> b!1224611 (= e!695595 e!695597)))

(declare-fun c!120781 () Bool)

(declare-fun e!695592 () Bool)

(assert (=> b!1224611 (= c!120781 e!695592)))

(declare-fun res!813328 () Bool)

(assert (=> b!1224611 (=> (not res!813328) (not e!695592))))

(assert (=> b!1224611 (= res!813328 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 lt!557103)))))

(declare-fun b!1224612 () Bool)

(assert (=> b!1224612 (= e!695592 (validKeyInArray!0 (select (arr!38118 lt!557103) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1224612 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1224613 () Bool)

(assert (=> b!1224613 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 lt!557103)))))

(assert (=> b!1224613 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38656 lt!557106)))))

(declare-fun e!695593 () Bool)

(declare-fun apply!986 (ListLongMap!18083 (_ BitVec 64)) V!46577)

(assert (=> b!1224613 (= e!695593 (= (apply!986 lt!557250 (select (arr!38118 lt!557103) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19505 (select (arr!38119 lt!557106) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1224614 () Bool)

(assert (=> b!1224614 (= e!695598 (ListLongMap!18084 Nil!26916))))

(declare-fun b!1224615 () Bool)

(declare-fun lt!557251 () Unit!40482)

(declare-fun lt!557249 () Unit!40482)

(assert (=> b!1224615 (= lt!557251 lt!557249)))

(declare-fun lt!557246 () V!46577)

(declare-fun lt!557247 () ListLongMap!18083)

(declare-fun lt!557248 () (_ BitVec 64))

(declare-fun lt!557245 () (_ BitVec 64))

(assert (=> b!1224615 (not (contains!7069 (+!4159 lt!557247 (tuple2!20107 lt!557245 lt!557246)) lt!557248))))

(declare-fun addStillNotContains!307 (ListLongMap!18083 (_ BitVec 64) V!46577 (_ BitVec 64)) Unit!40482)

(assert (=> b!1224615 (= lt!557249 (addStillNotContains!307 lt!557247 lt!557245 lt!557246 lt!557248))))

(assert (=> b!1224615 (= lt!557248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1224615 (= lt!557246 (get!19505 (select (arr!38119 lt!557106) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1224615 (= lt!557245 (select (arr!38118 lt!557103) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224615 (= lt!557247 call!60830)))

(assert (=> b!1224615 (= e!695596 (+!4159 call!60830 (tuple2!20107 (select (arr!38118 lt!557103) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19505 (select (arr!38119 lt!557106) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60827 () Bool)

(assert (=> bm!60827 (= call!60830 (getCurrentListMapNoExtraKeys!5509 lt!557103 lt!557106 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1224616 () Bool)

(assert (=> b!1224616 (= e!695597 e!695593)))

(assert (=> b!1224616 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 lt!557103)))))

(declare-fun res!813329 () Bool)

(assert (=> b!1224616 (= res!813329 (contains!7069 lt!557250 (select (arr!38118 lt!557103) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1224616 (=> (not res!813329) (not e!695593))))

(declare-fun b!1224617 () Bool)

(declare-fun res!813327 () Bool)

(assert (=> b!1224617 (=> (not res!813327) (not e!695595))))

(assert (=> b!1224617 (= res!813327 (not (contains!7069 lt!557250 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!134383 c!120779) b!1224614))

(assert (= (and d!134383 (not c!120779)) b!1224610))

(assert (= (and b!1224610 c!120780) b!1224615))

(assert (= (and b!1224610 (not c!120780)) b!1224606))

(assert (= (or b!1224615 b!1224606) bm!60827))

(assert (= (and d!134383 res!813330) b!1224617))

(assert (= (and b!1224617 res!813327) b!1224611))

(assert (= (and b!1224611 res!813328) b!1224612))

(assert (= (and b!1224611 c!120781) b!1224616))

(assert (= (and b!1224611 (not c!120781)) b!1224609))

(assert (= (and b!1224616 res!813329) b!1224613))

(assert (= (and b!1224609 c!120782) b!1224607))

(assert (= (and b!1224609 (not c!120782)) b!1224608))

(declare-fun b_lambda!22329 () Bool)

(assert (=> (not b_lambda!22329) (not b!1224613)))

(assert (=> b!1224613 t!40273))

(declare-fun b_and!44025 () Bool)

(assert (= b_and!44023 (and (=> t!40273 result!22969) b_and!44025)))

(declare-fun b_lambda!22331 () Bool)

(assert (=> (not b_lambda!22331) (not b!1224615)))

(assert (=> b!1224615 t!40273))

(declare-fun b_and!44027 () Bool)

(assert (= b_and!44025 (and (=> t!40273 result!22969) b_and!44027)))

(declare-fun m!1129891 () Bool)

(assert (=> b!1224612 m!1129891))

(assert (=> b!1224612 m!1129891))

(declare-fun m!1129893 () Bool)

(assert (=> b!1224612 m!1129893))

(declare-fun m!1129895 () Bool)

(assert (=> bm!60827 m!1129895))

(declare-fun m!1129897 () Bool)

(assert (=> b!1224617 m!1129897))

(assert (=> b!1224613 m!1129891))

(declare-fun m!1129899 () Bool)

(assert (=> b!1224613 m!1129899))

(declare-fun m!1129901 () Bool)

(assert (=> b!1224613 m!1129901))

(assert (=> b!1224613 m!1129691))

(declare-fun m!1129903 () Bool)

(assert (=> b!1224613 m!1129903))

(assert (=> b!1224613 m!1129691))

(assert (=> b!1224613 m!1129901))

(assert (=> b!1224613 m!1129891))

(declare-fun m!1129905 () Bool)

(assert (=> d!134383 m!1129905))

(assert (=> d!134383 m!1129683))

(assert (=> b!1224610 m!1129891))

(assert (=> b!1224610 m!1129891))

(assert (=> b!1224610 m!1129893))

(assert (=> b!1224616 m!1129891))

(assert (=> b!1224616 m!1129891))

(declare-fun m!1129907 () Bool)

(assert (=> b!1224616 m!1129907))

(declare-fun m!1129909 () Bool)

(assert (=> b!1224608 m!1129909))

(assert (=> b!1224607 m!1129895))

(assert (=> b!1224615 m!1129901))

(assert (=> b!1224615 m!1129691))

(assert (=> b!1224615 m!1129903))

(declare-fun m!1129911 () Bool)

(assert (=> b!1224615 m!1129911))

(assert (=> b!1224615 m!1129691))

(declare-fun m!1129913 () Bool)

(assert (=> b!1224615 m!1129913))

(assert (=> b!1224615 m!1129901))

(assert (=> b!1224615 m!1129891))

(declare-fun m!1129915 () Bool)

(assert (=> b!1224615 m!1129915))

(declare-fun m!1129917 () Bool)

(assert (=> b!1224615 m!1129917))

(assert (=> b!1224615 m!1129915))

(assert (=> b!1224395 d!134383))

(declare-fun b!1224618 () Bool)

(declare-fun e!695603 () ListLongMap!18083)

(declare-fun call!60831 () ListLongMap!18083)

(assert (=> b!1224618 (= e!695603 call!60831)))

(declare-fun b!1224619 () Bool)

(declare-fun e!695601 () Bool)

(declare-fun lt!557257 () ListLongMap!18083)

(assert (=> b!1224619 (= e!695601 (= lt!557257 (getCurrentListMapNoExtraKeys!5509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!134385 () Bool)

(declare-fun e!695602 () Bool)

(assert (=> d!134385 e!695602))

(declare-fun res!813334 () Bool)

(assert (=> d!134385 (=> (not res!813334) (not e!695602))))

(assert (=> d!134385 (= res!813334 (not (contains!7069 lt!557257 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!695605 () ListLongMap!18083)

(assert (=> d!134385 (= lt!557257 e!695605)))

(declare-fun c!120783 () Bool)

(assert (=> d!134385 (= c!120783 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 _keys!1208)))))

(assert (=> d!134385 (validMask!0 mask!1564)))

(assert (=> d!134385 (= (getCurrentListMapNoExtraKeys!5509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!557257)))

(declare-fun b!1224620 () Bool)

(assert (=> b!1224620 (= e!695601 (isEmpty!1005 lt!557257))))

(declare-fun b!1224621 () Bool)

(declare-fun e!695604 () Bool)

(assert (=> b!1224621 (= e!695604 e!695601)))

(declare-fun c!120786 () Bool)

(assert (=> b!1224621 (= c!120786 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 _keys!1208)))))

(declare-fun b!1224622 () Bool)

(assert (=> b!1224622 (= e!695605 e!695603)))

(declare-fun c!120784 () Bool)

(assert (=> b!1224622 (= c!120784 (validKeyInArray!0 (select (arr!38118 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1224623 () Bool)

(assert (=> b!1224623 (= e!695602 e!695604)))

(declare-fun c!120785 () Bool)

(declare-fun e!695599 () Bool)

(assert (=> b!1224623 (= c!120785 e!695599)))

(declare-fun res!813332 () Bool)

(assert (=> b!1224623 (=> (not res!813332) (not e!695599))))

(assert (=> b!1224623 (= res!813332 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 _keys!1208)))))

(declare-fun b!1224624 () Bool)

(assert (=> b!1224624 (= e!695599 (validKeyInArray!0 (select (arr!38118 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1224624 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1224625 () Bool)

(assert (=> b!1224625 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 _keys!1208)))))

(assert (=> b!1224625 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38656 _values!996)))))

(declare-fun e!695600 () Bool)

(assert (=> b!1224625 (= e!695600 (= (apply!986 lt!557257 (select (arr!38118 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19505 (select (arr!38119 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1224626 () Bool)

(assert (=> b!1224626 (= e!695605 (ListLongMap!18084 Nil!26916))))

(declare-fun b!1224627 () Bool)

(declare-fun lt!557258 () Unit!40482)

(declare-fun lt!557256 () Unit!40482)

(assert (=> b!1224627 (= lt!557258 lt!557256)))

(declare-fun lt!557253 () V!46577)

(declare-fun lt!557252 () (_ BitVec 64))

(declare-fun lt!557254 () ListLongMap!18083)

(declare-fun lt!557255 () (_ BitVec 64))

(assert (=> b!1224627 (not (contains!7069 (+!4159 lt!557254 (tuple2!20107 lt!557252 lt!557253)) lt!557255))))

(assert (=> b!1224627 (= lt!557256 (addStillNotContains!307 lt!557254 lt!557252 lt!557253 lt!557255))))

(assert (=> b!1224627 (= lt!557255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1224627 (= lt!557253 (get!19505 (select (arr!38119 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1224627 (= lt!557252 (select (arr!38118 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224627 (= lt!557254 call!60831)))

(assert (=> b!1224627 (= e!695603 (+!4159 call!60831 (tuple2!20107 (select (arr!38118 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19505 (select (arr!38119 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60828 () Bool)

(assert (=> bm!60828 (= call!60831 (getCurrentListMapNoExtraKeys!5509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1224628 () Bool)

(assert (=> b!1224628 (= e!695604 e!695600)))

(assert (=> b!1224628 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38655 _keys!1208)))))

(declare-fun res!813333 () Bool)

(assert (=> b!1224628 (= res!813333 (contains!7069 lt!557257 (select (arr!38118 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1224628 (=> (not res!813333) (not e!695600))))

(declare-fun b!1224629 () Bool)

(declare-fun res!813331 () Bool)

(assert (=> b!1224629 (=> (not res!813331) (not e!695602))))

(assert (=> b!1224629 (= res!813331 (not (contains!7069 lt!557257 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!134385 c!120783) b!1224626))

(assert (= (and d!134385 (not c!120783)) b!1224622))

(assert (= (and b!1224622 c!120784) b!1224627))

(assert (= (and b!1224622 (not c!120784)) b!1224618))

(assert (= (or b!1224627 b!1224618) bm!60828))

(assert (= (and d!134385 res!813334) b!1224629))

(assert (= (and b!1224629 res!813331) b!1224623))

(assert (= (and b!1224623 res!813332) b!1224624))

(assert (= (and b!1224623 c!120785) b!1224628))

(assert (= (and b!1224623 (not c!120785)) b!1224621))

(assert (= (and b!1224628 res!813333) b!1224625))

(assert (= (and b!1224621 c!120786) b!1224619))

(assert (= (and b!1224621 (not c!120786)) b!1224620))

(declare-fun b_lambda!22333 () Bool)

(assert (=> (not b_lambda!22333) (not b!1224625)))

(assert (=> b!1224625 t!40273))

(declare-fun b_and!44029 () Bool)

(assert (= b_and!44027 (and (=> t!40273 result!22969) b_and!44029)))

(declare-fun b_lambda!22335 () Bool)

(assert (=> (not b_lambda!22335) (not b!1224627)))

(assert (=> b!1224627 t!40273))

(declare-fun b_and!44031 () Bool)

(assert (= b_and!44029 (and (=> t!40273 result!22969) b_and!44031)))

(assert (=> b!1224624 m!1129873))

(assert (=> b!1224624 m!1129873))

(declare-fun m!1129919 () Bool)

(assert (=> b!1224624 m!1129919))

(declare-fun m!1129921 () Bool)

(assert (=> bm!60828 m!1129921))

(declare-fun m!1129923 () Bool)

(assert (=> b!1224629 m!1129923))

(assert (=> b!1224625 m!1129873))

(declare-fun m!1129925 () Bool)

(assert (=> b!1224625 m!1129925))

(declare-fun m!1129927 () Bool)

(assert (=> b!1224625 m!1129927))

(assert (=> b!1224625 m!1129691))

(declare-fun m!1129929 () Bool)

(assert (=> b!1224625 m!1129929))

(assert (=> b!1224625 m!1129691))

(assert (=> b!1224625 m!1129927))

(assert (=> b!1224625 m!1129873))

(declare-fun m!1129931 () Bool)

(assert (=> d!134385 m!1129931))

(assert (=> d!134385 m!1129683))

(assert (=> b!1224622 m!1129873))

(assert (=> b!1224622 m!1129873))

(assert (=> b!1224622 m!1129919))

(assert (=> b!1224628 m!1129873))

(assert (=> b!1224628 m!1129873))

(declare-fun m!1129933 () Bool)

(assert (=> b!1224628 m!1129933))

(declare-fun m!1129935 () Bool)

(assert (=> b!1224620 m!1129935))

(assert (=> b!1224619 m!1129921))

(assert (=> b!1224627 m!1129927))

(assert (=> b!1224627 m!1129691))

(assert (=> b!1224627 m!1129929))

(declare-fun m!1129937 () Bool)

(assert (=> b!1224627 m!1129937))

(assert (=> b!1224627 m!1129691))

(declare-fun m!1129939 () Bool)

(assert (=> b!1224627 m!1129939))

(assert (=> b!1224627 m!1129927))

(assert (=> b!1224627 m!1129873))

(declare-fun m!1129941 () Bool)

(assert (=> b!1224627 m!1129941))

(declare-fun m!1129943 () Bool)

(assert (=> b!1224627 m!1129943))

(assert (=> b!1224627 m!1129941))

(assert (=> b!1224395 d!134385))

(declare-fun b!1224630 () Bool)

(declare-fun e!695608 () Bool)

(declare-fun call!60832 () Bool)

(assert (=> b!1224630 (= e!695608 call!60832)))

(declare-fun d!134387 () Bool)

(declare-fun res!813336 () Bool)

(declare-fun e!695606 () Bool)

(assert (=> d!134387 (=> res!813336 e!695606)))

(assert (=> d!134387 (= res!813336 (bvsge #b00000000000000000000000000000000 (size!38655 _keys!1208)))))

(assert (=> d!134387 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26917) e!695606)))

(declare-fun b!1224631 () Bool)

(declare-fun e!695609 () Bool)

(assert (=> b!1224631 (= e!695609 e!695608)))

(declare-fun c!120787 () Bool)

(assert (=> b!1224631 (= c!120787 (validKeyInArray!0 (select (arr!38118 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1224632 () Bool)

(declare-fun e!695607 () Bool)

(assert (=> b!1224632 (= e!695607 (contains!7068 Nil!26917 (select (arr!38118 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1224633 () Bool)

(assert (=> b!1224633 (= e!695608 call!60832)))

(declare-fun b!1224634 () Bool)

(assert (=> b!1224634 (= e!695606 e!695609)))

(declare-fun res!813335 () Bool)

(assert (=> b!1224634 (=> (not res!813335) (not e!695609))))

(assert (=> b!1224634 (= res!813335 (not e!695607))))

(declare-fun res!813337 () Bool)

(assert (=> b!1224634 (=> (not res!813337) (not e!695607))))

(assert (=> b!1224634 (= res!813337 (validKeyInArray!0 (select (arr!38118 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60829 () Bool)

(assert (=> bm!60829 (= call!60832 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120787 (Cons!26916 (select (arr!38118 _keys!1208) #b00000000000000000000000000000000) Nil!26917) Nil!26917)))))

(assert (= (and d!134387 (not res!813336)) b!1224634))

(assert (= (and b!1224634 res!813337) b!1224632))

(assert (= (and b!1224634 res!813335) b!1224631))

(assert (= (and b!1224631 c!120787) b!1224630))

(assert (= (and b!1224631 (not c!120787)) b!1224633))

(assert (= (or b!1224630 b!1224633) bm!60829))

(assert (=> b!1224631 m!1129841))

(assert (=> b!1224631 m!1129841))

(assert (=> b!1224631 m!1129849))

(assert (=> b!1224632 m!1129841))

(assert (=> b!1224632 m!1129841))

(declare-fun m!1129945 () Bool)

(assert (=> b!1224632 m!1129945))

(assert (=> b!1224634 m!1129841))

(assert (=> b!1224634 m!1129841))

(assert (=> b!1224634 m!1129849))

(assert (=> bm!60829 m!1129841))

(declare-fun m!1129947 () Bool)

(assert (=> bm!60829 m!1129947))

(assert (=> b!1224404 d!134387))

(declare-fun d!134389 () Bool)

(assert (=> d!134389 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1224393 d!134389))

(declare-fun b!1224635 () Bool)

(declare-fun e!695614 () ListLongMap!18083)

(declare-fun call!60833 () ListLongMap!18083)

(assert (=> b!1224635 (= e!695614 call!60833)))

(declare-fun e!695612 () Bool)

(declare-fun lt!557264 () ListLongMap!18083)

(declare-fun b!1224636 () Bool)

(assert (=> b!1224636 (= e!695612 (= lt!557264 (getCurrentListMapNoExtraKeys!5509 lt!557103 lt!557106 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!134391 () Bool)

(declare-fun e!695613 () Bool)

(assert (=> d!134391 e!695613))

(declare-fun res!813341 () Bool)

(assert (=> d!134391 (=> (not res!813341) (not e!695613))))

(assert (=> d!134391 (= res!813341 (not (contains!7069 lt!557264 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!695616 () ListLongMap!18083)

(assert (=> d!134391 (= lt!557264 e!695616)))

(declare-fun c!120788 () Bool)

(assert (=> d!134391 (= c!120788 (bvsge from!1455 (size!38655 lt!557103)))))

(assert (=> d!134391 (validMask!0 mask!1564)))

(assert (=> d!134391 (= (getCurrentListMapNoExtraKeys!5509 lt!557103 lt!557106 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!557264)))

(declare-fun b!1224637 () Bool)

(assert (=> b!1224637 (= e!695612 (isEmpty!1005 lt!557264))))

(declare-fun b!1224638 () Bool)

(declare-fun e!695615 () Bool)

(assert (=> b!1224638 (= e!695615 e!695612)))

(declare-fun c!120791 () Bool)

(assert (=> b!1224638 (= c!120791 (bvslt from!1455 (size!38655 lt!557103)))))

(declare-fun b!1224639 () Bool)

(assert (=> b!1224639 (= e!695616 e!695614)))

(declare-fun c!120789 () Bool)

(assert (=> b!1224639 (= c!120789 (validKeyInArray!0 (select (arr!38118 lt!557103) from!1455)))))

(declare-fun b!1224640 () Bool)

(assert (=> b!1224640 (= e!695613 e!695615)))

(declare-fun c!120790 () Bool)

(declare-fun e!695610 () Bool)

(assert (=> b!1224640 (= c!120790 e!695610)))

(declare-fun res!813339 () Bool)

(assert (=> b!1224640 (=> (not res!813339) (not e!695610))))

(assert (=> b!1224640 (= res!813339 (bvslt from!1455 (size!38655 lt!557103)))))

(declare-fun b!1224641 () Bool)

(assert (=> b!1224641 (= e!695610 (validKeyInArray!0 (select (arr!38118 lt!557103) from!1455)))))

(assert (=> b!1224641 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1224642 () Bool)

(assert (=> b!1224642 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38655 lt!557103)))))

(assert (=> b!1224642 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38656 lt!557106)))))

(declare-fun e!695611 () Bool)

(assert (=> b!1224642 (= e!695611 (= (apply!986 lt!557264 (select (arr!38118 lt!557103) from!1455)) (get!19505 (select (arr!38119 lt!557106) from!1455) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1224643 () Bool)

(assert (=> b!1224643 (= e!695616 (ListLongMap!18084 Nil!26916))))

(declare-fun b!1224644 () Bool)

(declare-fun lt!557265 () Unit!40482)

(declare-fun lt!557263 () Unit!40482)

(assert (=> b!1224644 (= lt!557265 lt!557263)))

(declare-fun lt!557260 () V!46577)

(declare-fun lt!557262 () (_ BitVec 64))

(declare-fun lt!557261 () ListLongMap!18083)

(declare-fun lt!557259 () (_ BitVec 64))

(assert (=> b!1224644 (not (contains!7069 (+!4159 lt!557261 (tuple2!20107 lt!557259 lt!557260)) lt!557262))))

(assert (=> b!1224644 (= lt!557263 (addStillNotContains!307 lt!557261 lt!557259 lt!557260 lt!557262))))

(assert (=> b!1224644 (= lt!557262 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1224644 (= lt!557260 (get!19505 (select (arr!38119 lt!557106) from!1455) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1224644 (= lt!557259 (select (arr!38118 lt!557103) from!1455))))

(assert (=> b!1224644 (= lt!557261 call!60833)))

(assert (=> b!1224644 (= e!695614 (+!4159 call!60833 (tuple2!20107 (select (arr!38118 lt!557103) from!1455) (get!19505 (select (arr!38119 lt!557106) from!1455) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60830 () Bool)

(assert (=> bm!60830 (= call!60833 (getCurrentListMapNoExtraKeys!5509 lt!557103 lt!557106 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1224645 () Bool)

(assert (=> b!1224645 (= e!695615 e!695611)))

(assert (=> b!1224645 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38655 lt!557103)))))

(declare-fun res!813340 () Bool)

(assert (=> b!1224645 (= res!813340 (contains!7069 lt!557264 (select (arr!38118 lt!557103) from!1455)))))

(assert (=> b!1224645 (=> (not res!813340) (not e!695611))))

(declare-fun b!1224646 () Bool)

(declare-fun res!813338 () Bool)

(assert (=> b!1224646 (=> (not res!813338) (not e!695613))))

(assert (=> b!1224646 (= res!813338 (not (contains!7069 lt!557264 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!134391 c!120788) b!1224643))

(assert (= (and d!134391 (not c!120788)) b!1224639))

(assert (= (and b!1224639 c!120789) b!1224644))

(assert (= (and b!1224639 (not c!120789)) b!1224635))

(assert (= (or b!1224644 b!1224635) bm!60830))

(assert (= (and d!134391 res!813341) b!1224646))

(assert (= (and b!1224646 res!813338) b!1224640))

(assert (= (and b!1224640 res!813339) b!1224641))

(assert (= (and b!1224640 c!120790) b!1224645))

(assert (= (and b!1224640 (not c!120790)) b!1224638))

(assert (= (and b!1224645 res!813340) b!1224642))

(assert (= (and b!1224638 c!120791) b!1224636))

(assert (= (and b!1224638 (not c!120791)) b!1224637))

(declare-fun b_lambda!22337 () Bool)

(assert (=> (not b_lambda!22337) (not b!1224642)))

(assert (=> b!1224642 t!40273))

(declare-fun b_and!44033 () Bool)

(assert (= b_and!44031 (and (=> t!40273 result!22969) b_and!44033)))

(declare-fun b_lambda!22339 () Bool)

(assert (=> (not b_lambda!22339) (not b!1224644)))

(assert (=> b!1224644 t!40273))

(declare-fun b_and!44035 () Bool)

(assert (= b_and!44033 (and (=> t!40273 result!22969) b_and!44035)))

(declare-fun m!1129949 () Bool)

(assert (=> b!1224641 m!1129949))

(assert (=> b!1224641 m!1129949))

(declare-fun m!1129951 () Bool)

(assert (=> b!1224641 m!1129951))

(declare-fun m!1129953 () Bool)

(assert (=> bm!60830 m!1129953))

(declare-fun m!1129955 () Bool)

(assert (=> b!1224646 m!1129955))

(assert (=> b!1224642 m!1129949))

(declare-fun m!1129957 () Bool)

(assert (=> b!1224642 m!1129957))

(declare-fun m!1129959 () Bool)

(assert (=> b!1224642 m!1129959))

(assert (=> b!1224642 m!1129691))

(declare-fun m!1129961 () Bool)

(assert (=> b!1224642 m!1129961))

(assert (=> b!1224642 m!1129691))

(assert (=> b!1224642 m!1129959))

(assert (=> b!1224642 m!1129949))

(declare-fun m!1129963 () Bool)

(assert (=> d!134391 m!1129963))

(assert (=> d!134391 m!1129683))

(assert (=> b!1224639 m!1129949))

(assert (=> b!1224639 m!1129949))

(assert (=> b!1224639 m!1129951))

(assert (=> b!1224645 m!1129949))

(assert (=> b!1224645 m!1129949))

(declare-fun m!1129965 () Bool)

(assert (=> b!1224645 m!1129965))

(declare-fun m!1129967 () Bool)

(assert (=> b!1224637 m!1129967))

(assert (=> b!1224636 m!1129953))

(assert (=> b!1224644 m!1129959))

(assert (=> b!1224644 m!1129691))

(assert (=> b!1224644 m!1129961))

(declare-fun m!1129969 () Bool)

(assert (=> b!1224644 m!1129969))

(assert (=> b!1224644 m!1129691))

(declare-fun m!1129971 () Bool)

(assert (=> b!1224644 m!1129971))

(assert (=> b!1224644 m!1129959))

(assert (=> b!1224644 m!1129949))

(declare-fun m!1129973 () Bool)

(assert (=> b!1224644 m!1129973))

(declare-fun m!1129975 () Bool)

(assert (=> b!1224644 m!1129975))

(assert (=> b!1224644 m!1129973))

(assert (=> b!1224403 d!134391))

(declare-fun b!1224647 () Bool)

(declare-fun e!695621 () ListLongMap!18083)

(declare-fun call!60834 () ListLongMap!18083)

(assert (=> b!1224647 (= e!695621 call!60834)))

(declare-fun lt!557271 () ListLongMap!18083)

(declare-fun b!1224648 () Bool)

(declare-fun e!695619 () Bool)

(assert (=> b!1224648 (= e!695619 (= lt!557271 (getCurrentListMapNoExtraKeys!5509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun d!134393 () Bool)

(declare-fun e!695620 () Bool)

(assert (=> d!134393 e!695620))

(declare-fun res!813345 () Bool)

(assert (=> d!134393 (=> (not res!813345) (not e!695620))))

(assert (=> d!134393 (= res!813345 (not (contains!7069 lt!557271 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!695623 () ListLongMap!18083)

(assert (=> d!134393 (= lt!557271 e!695623)))

(declare-fun c!120792 () Bool)

(assert (=> d!134393 (= c!120792 (bvsge from!1455 (size!38655 _keys!1208)))))

(assert (=> d!134393 (validMask!0 mask!1564)))

(assert (=> d!134393 (= (getCurrentListMapNoExtraKeys!5509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!557271)))

(declare-fun b!1224649 () Bool)

(assert (=> b!1224649 (= e!695619 (isEmpty!1005 lt!557271))))

(declare-fun b!1224650 () Bool)

(declare-fun e!695622 () Bool)

(assert (=> b!1224650 (= e!695622 e!695619)))

(declare-fun c!120795 () Bool)

(assert (=> b!1224650 (= c!120795 (bvslt from!1455 (size!38655 _keys!1208)))))

(declare-fun b!1224651 () Bool)

(assert (=> b!1224651 (= e!695623 e!695621)))

(declare-fun c!120793 () Bool)

(assert (=> b!1224651 (= c!120793 (validKeyInArray!0 (select (arr!38118 _keys!1208) from!1455)))))

(declare-fun b!1224652 () Bool)

(assert (=> b!1224652 (= e!695620 e!695622)))

(declare-fun c!120794 () Bool)

(declare-fun e!695617 () Bool)

(assert (=> b!1224652 (= c!120794 e!695617)))

(declare-fun res!813343 () Bool)

(assert (=> b!1224652 (=> (not res!813343) (not e!695617))))

(assert (=> b!1224652 (= res!813343 (bvslt from!1455 (size!38655 _keys!1208)))))

(declare-fun b!1224653 () Bool)

(assert (=> b!1224653 (= e!695617 (validKeyInArray!0 (select (arr!38118 _keys!1208) from!1455)))))

(assert (=> b!1224653 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1224654 () Bool)

(assert (=> b!1224654 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38655 _keys!1208)))))

(assert (=> b!1224654 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38656 _values!996)))))

(declare-fun e!695618 () Bool)

(assert (=> b!1224654 (= e!695618 (= (apply!986 lt!557271 (select (arr!38118 _keys!1208) from!1455)) (get!19505 (select (arr!38119 _values!996) from!1455) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1224655 () Bool)

(assert (=> b!1224655 (= e!695623 (ListLongMap!18084 Nil!26916))))

(declare-fun b!1224656 () Bool)

(declare-fun lt!557272 () Unit!40482)

(declare-fun lt!557270 () Unit!40482)

(assert (=> b!1224656 (= lt!557272 lt!557270)))

(declare-fun lt!557267 () V!46577)

(declare-fun lt!557268 () ListLongMap!18083)

(declare-fun lt!557269 () (_ BitVec 64))

(declare-fun lt!557266 () (_ BitVec 64))

(assert (=> b!1224656 (not (contains!7069 (+!4159 lt!557268 (tuple2!20107 lt!557266 lt!557267)) lt!557269))))

(assert (=> b!1224656 (= lt!557270 (addStillNotContains!307 lt!557268 lt!557266 lt!557267 lt!557269))))

(assert (=> b!1224656 (= lt!557269 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1224656 (= lt!557267 (get!19505 (select (arr!38119 _values!996) from!1455) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1224656 (= lt!557266 (select (arr!38118 _keys!1208) from!1455))))

(assert (=> b!1224656 (= lt!557268 call!60834)))

(assert (=> b!1224656 (= e!695621 (+!4159 call!60834 (tuple2!20107 (select (arr!38118 _keys!1208) from!1455) (get!19505 (select (arr!38119 _values!996) from!1455) (dynLambda!3408 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!60831 () Bool)

(assert (=> bm!60831 (= call!60834 (getCurrentListMapNoExtraKeys!5509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1224657 () Bool)

(assert (=> b!1224657 (= e!695622 e!695618)))

(assert (=> b!1224657 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38655 _keys!1208)))))

(declare-fun res!813344 () Bool)

(assert (=> b!1224657 (= res!813344 (contains!7069 lt!557271 (select (arr!38118 _keys!1208) from!1455)))))

(assert (=> b!1224657 (=> (not res!813344) (not e!695618))))

(declare-fun b!1224658 () Bool)

(declare-fun res!813342 () Bool)

(assert (=> b!1224658 (=> (not res!813342) (not e!695620))))

(assert (=> b!1224658 (= res!813342 (not (contains!7069 lt!557271 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!134393 c!120792) b!1224655))

(assert (= (and d!134393 (not c!120792)) b!1224651))

(assert (= (and b!1224651 c!120793) b!1224656))

(assert (= (and b!1224651 (not c!120793)) b!1224647))

(assert (= (or b!1224656 b!1224647) bm!60831))

(assert (= (and d!134393 res!813345) b!1224658))

(assert (= (and b!1224658 res!813342) b!1224652))

(assert (= (and b!1224652 res!813343) b!1224653))

(assert (= (and b!1224652 c!120794) b!1224657))

(assert (= (and b!1224652 (not c!120794)) b!1224650))

(assert (= (and b!1224657 res!813344) b!1224654))

(assert (= (and b!1224650 c!120795) b!1224648))

(assert (= (and b!1224650 (not c!120795)) b!1224649))

(declare-fun b_lambda!22341 () Bool)

(assert (=> (not b_lambda!22341) (not b!1224654)))

(assert (=> b!1224654 t!40273))

(declare-fun b_and!44037 () Bool)

(assert (= b_and!44035 (and (=> t!40273 result!22969) b_and!44037)))

(declare-fun b_lambda!22343 () Bool)

(assert (=> (not b_lambda!22343) (not b!1224656)))

(assert (=> b!1224656 t!40273))

(declare-fun b_and!44039 () Bool)

(assert (= b_and!44037 (and (=> t!40273 result!22969) b_and!44039)))

(assert (=> b!1224653 m!1129649))

(assert (=> b!1224653 m!1129649))

(assert (=> b!1224653 m!1129679))

(declare-fun m!1129977 () Bool)

(assert (=> bm!60831 m!1129977))

(declare-fun m!1129979 () Bool)

(assert (=> b!1224658 m!1129979))

(assert (=> b!1224654 m!1129649))

(declare-fun m!1129981 () Bool)

(assert (=> b!1224654 m!1129981))

(assert (=> b!1224654 m!1129645))

(assert (=> b!1224654 m!1129691))

(declare-fun m!1129983 () Bool)

(assert (=> b!1224654 m!1129983))

(assert (=> b!1224654 m!1129691))

(assert (=> b!1224654 m!1129645))

(assert (=> b!1224654 m!1129649))

(declare-fun m!1129985 () Bool)

(assert (=> d!134393 m!1129985))

(assert (=> d!134393 m!1129683))

(assert (=> b!1224651 m!1129649))

(assert (=> b!1224651 m!1129649))

(assert (=> b!1224651 m!1129679))

(assert (=> b!1224657 m!1129649))

(assert (=> b!1224657 m!1129649))

(declare-fun m!1129987 () Bool)

(assert (=> b!1224657 m!1129987))

(declare-fun m!1129989 () Bool)

(assert (=> b!1224649 m!1129989))

(assert (=> b!1224648 m!1129977))

(assert (=> b!1224656 m!1129645))

(assert (=> b!1224656 m!1129691))

(assert (=> b!1224656 m!1129983))

(declare-fun m!1129991 () Bool)

(assert (=> b!1224656 m!1129991))

(assert (=> b!1224656 m!1129691))

(declare-fun m!1129993 () Bool)

(assert (=> b!1224656 m!1129993))

(assert (=> b!1224656 m!1129645))

(assert (=> b!1224656 m!1129649))

(declare-fun m!1129995 () Bool)

(assert (=> b!1224656 m!1129995))

(declare-fun m!1129997 () Bool)

(assert (=> b!1224656 m!1129997))

(assert (=> b!1224656 m!1129995))

(assert (=> b!1224403 d!134393))

(declare-fun b!1224659 () Bool)

(declare-fun e!695626 () Bool)

(declare-fun call!60835 () Bool)

(assert (=> b!1224659 (= e!695626 call!60835)))

(declare-fun b!1224660 () Bool)

(declare-fun e!695624 () Bool)

(assert (=> b!1224660 (= e!695626 e!695624)))

(declare-fun lt!557273 () (_ BitVec 64))

(assert (=> b!1224660 (= lt!557273 (select (arr!38118 lt!557103) #b00000000000000000000000000000000))))

(declare-fun lt!557275 () Unit!40482)

(assert (=> b!1224660 (= lt!557275 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!557103 lt!557273 #b00000000000000000000000000000000))))

(assert (=> b!1224660 (arrayContainsKey!0 lt!557103 lt!557273 #b00000000000000000000000000000000)))

(declare-fun lt!557274 () Unit!40482)

(assert (=> b!1224660 (= lt!557274 lt!557275)))

(declare-fun res!813346 () Bool)

(assert (=> b!1224660 (= res!813346 (= (seekEntryOrOpen!0 (select (arr!38118 lt!557103) #b00000000000000000000000000000000) lt!557103 mask!1564) (Found!9906 #b00000000000000000000000000000000)))))

(assert (=> b!1224660 (=> (not res!813346) (not e!695624))))

(declare-fun d!134395 () Bool)

(declare-fun res!813347 () Bool)

(declare-fun e!695625 () Bool)

(assert (=> d!134395 (=> res!813347 e!695625)))

(assert (=> d!134395 (= res!813347 (bvsge #b00000000000000000000000000000000 (size!38655 lt!557103)))))

(assert (=> d!134395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557103 mask!1564) e!695625)))

(declare-fun b!1224661 () Bool)

(assert (=> b!1224661 (= e!695624 call!60835)))

(declare-fun b!1224662 () Bool)

(assert (=> b!1224662 (= e!695625 e!695626)))

(declare-fun c!120796 () Bool)

(assert (=> b!1224662 (= c!120796 (validKeyInArray!0 (select (arr!38118 lt!557103) #b00000000000000000000000000000000)))))

(declare-fun bm!60832 () Bool)

(assert (=> bm!60832 (= call!60835 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!557103 mask!1564))))

(assert (= (and d!134395 (not res!813347)) b!1224662))

(assert (= (and b!1224662 c!120796) b!1224660))

(assert (= (and b!1224662 (not c!120796)) b!1224659))

(assert (= (and b!1224660 res!813346) b!1224661))

(assert (= (or b!1224661 b!1224659) bm!60832))

(assert (=> b!1224660 m!1129857))

(declare-fun m!1129999 () Bool)

(assert (=> b!1224660 m!1129999))

(declare-fun m!1130001 () Bool)

(assert (=> b!1224660 m!1130001))

(assert (=> b!1224660 m!1129857))

(declare-fun m!1130003 () Bool)

(assert (=> b!1224660 m!1130003))

(assert (=> b!1224662 m!1129857))

(assert (=> b!1224662 m!1129857))

(assert (=> b!1224662 m!1129859))

(declare-fun m!1130005 () Bool)

(assert (=> bm!60832 m!1130005))

(assert (=> b!1224392 d!134395))

(declare-fun d!134397 () Bool)

(declare-fun e!695629 () Bool)

(assert (=> d!134397 e!695629))

(declare-fun res!813353 () Bool)

(assert (=> d!134397 (=> (not res!813353) (not e!695629))))

(declare-fun lt!557286 () ListLongMap!18083)

(assert (=> d!134397 (= res!813353 (contains!7069 lt!557286 (_1!10064 lt!557099)))))

(declare-fun lt!557285 () List!26919)

(assert (=> d!134397 (= lt!557286 (ListLongMap!18084 lt!557285))))

(declare-fun lt!557287 () Unit!40482)

(declare-fun lt!557284 () Unit!40482)

(assert (=> d!134397 (= lt!557287 lt!557284)))

(declare-datatypes ((Option!695 0))(
  ( (Some!694 (v!18260 V!46577)) (None!693) )
))
(declare-fun getValueByKey!644 (List!26919 (_ BitVec 64)) Option!695)

(assert (=> d!134397 (= (getValueByKey!644 lt!557285 (_1!10064 lt!557099)) (Some!694 (_2!10064 lt!557099)))))

(declare-fun lemmaContainsTupThenGetReturnValue!326 (List!26919 (_ BitVec 64) V!46577) Unit!40482)

(assert (=> d!134397 (= lt!557284 (lemmaContainsTupThenGetReturnValue!326 lt!557285 (_1!10064 lt!557099) (_2!10064 lt!557099)))))

(declare-fun insertStrictlySorted!419 (List!26919 (_ BitVec 64) V!46577) List!26919)

(assert (=> d!134397 (= lt!557285 (insertStrictlySorted!419 (toList!9057 lt!557100) (_1!10064 lt!557099) (_2!10064 lt!557099)))))

(assert (=> d!134397 (= (+!4159 lt!557100 lt!557099) lt!557286)))

(declare-fun b!1224667 () Bool)

(declare-fun res!813352 () Bool)

(assert (=> b!1224667 (=> (not res!813352) (not e!695629))))

(assert (=> b!1224667 (= res!813352 (= (getValueByKey!644 (toList!9057 lt!557286) (_1!10064 lt!557099)) (Some!694 (_2!10064 lt!557099))))))

(declare-fun b!1224668 () Bool)

(declare-fun contains!7070 (List!26919 tuple2!20106) Bool)

(assert (=> b!1224668 (= e!695629 (contains!7070 (toList!9057 lt!557286) lt!557099))))

(assert (= (and d!134397 res!813353) b!1224667))

(assert (= (and b!1224667 res!813352) b!1224668))

(declare-fun m!1130007 () Bool)

(assert (=> d!134397 m!1130007))

(declare-fun m!1130009 () Bool)

(assert (=> d!134397 m!1130009))

(declare-fun m!1130011 () Bool)

(assert (=> d!134397 m!1130011))

(declare-fun m!1130013 () Bool)

(assert (=> d!134397 m!1130013))

(declare-fun m!1130015 () Bool)

(assert (=> b!1224667 m!1130015))

(declare-fun m!1130017 () Bool)

(assert (=> b!1224668 m!1130017))

(assert (=> b!1224401 d!134397))

(declare-fun d!134399 () Bool)

(declare-fun e!695630 () Bool)

(assert (=> d!134399 e!695630))

(declare-fun res!813355 () Bool)

(assert (=> d!134399 (=> (not res!813355) (not e!695630))))

(declare-fun lt!557290 () ListLongMap!18083)

(assert (=> d!134399 (= res!813355 (contains!7069 lt!557290 (_1!10064 lt!557099)))))

(declare-fun lt!557289 () List!26919)

(assert (=> d!134399 (= lt!557290 (ListLongMap!18084 lt!557289))))

(declare-fun lt!557291 () Unit!40482)

(declare-fun lt!557288 () Unit!40482)

(assert (=> d!134399 (= lt!557291 lt!557288)))

(assert (=> d!134399 (= (getValueByKey!644 lt!557289 (_1!10064 lt!557099)) (Some!694 (_2!10064 lt!557099)))))

(assert (=> d!134399 (= lt!557288 (lemmaContainsTupThenGetReturnValue!326 lt!557289 (_1!10064 lt!557099) (_2!10064 lt!557099)))))

(assert (=> d!134399 (= lt!557289 (insertStrictlySorted!419 (toList!9057 lt!557105) (_1!10064 lt!557099) (_2!10064 lt!557099)))))

(assert (=> d!134399 (= (+!4159 lt!557105 lt!557099) lt!557290)))

(declare-fun b!1224669 () Bool)

(declare-fun res!813354 () Bool)

(assert (=> b!1224669 (=> (not res!813354) (not e!695630))))

(assert (=> b!1224669 (= res!813354 (= (getValueByKey!644 (toList!9057 lt!557290) (_1!10064 lt!557099)) (Some!694 (_2!10064 lt!557099))))))

(declare-fun b!1224670 () Bool)

(assert (=> b!1224670 (= e!695630 (contains!7070 (toList!9057 lt!557290) lt!557099))))

(assert (= (and d!134399 res!813355) b!1224669))

(assert (= (and b!1224669 res!813354) b!1224670))

(declare-fun m!1130019 () Bool)

(assert (=> d!134399 m!1130019))

(declare-fun m!1130021 () Bool)

(assert (=> d!134399 m!1130021))

(declare-fun m!1130023 () Bool)

(assert (=> d!134399 m!1130023))

(declare-fun m!1130025 () Bool)

(assert (=> d!134399 m!1130025))

(declare-fun m!1130027 () Bool)

(assert (=> b!1224669 m!1130027))

(declare-fun m!1130029 () Bool)

(assert (=> b!1224670 m!1130029))

(assert (=> b!1224401 d!134399))

(declare-fun d!134401 () Bool)

(declare-fun c!120799 () Bool)

(assert (=> d!134401 (= c!120799 ((_ is ValueCellFull!14834) (select (arr!38119 _values!996) from!1455)))))

(declare-fun e!695633 () V!46577)

(assert (=> d!134401 (= (get!19505 (select (arr!38119 _values!996) from!1455) lt!557108) e!695633)))

(declare-fun b!1224675 () Bool)

(declare-fun get!19506 (ValueCell!14834 V!46577) V!46577)

(assert (=> b!1224675 (= e!695633 (get!19506 (select (arr!38119 _values!996) from!1455) lt!557108))))

(declare-fun b!1224676 () Bool)

(declare-fun get!19507 (ValueCell!14834 V!46577) V!46577)

(assert (=> b!1224676 (= e!695633 (get!19507 (select (arr!38119 _values!996) from!1455) lt!557108))))

(assert (= (and d!134401 c!120799) b!1224675))

(assert (= (and d!134401 (not c!120799)) b!1224676))

(assert (=> b!1224675 m!1129645))

(declare-fun m!1130031 () Bool)

(assert (=> b!1224675 m!1130031))

(assert (=> b!1224676 m!1129645))

(declare-fun m!1130033 () Bool)

(assert (=> b!1224676 m!1130033))

(assert (=> b!1224401 d!134401))

(declare-fun d!134403 () Bool)

(declare-fun res!813356 () Bool)

(declare-fun e!695634 () Bool)

(assert (=> d!134403 (=> res!813356 e!695634)))

(assert (=> d!134403 (= res!813356 (= (select (arr!38118 _keys!1208) i!673) k0!934))))

(assert (=> d!134403 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!695634)))

(declare-fun b!1224677 () Bool)

(declare-fun e!695635 () Bool)

(assert (=> b!1224677 (= e!695634 e!695635)))

(declare-fun res!813357 () Bool)

(assert (=> b!1224677 (=> (not res!813357) (not e!695635))))

(assert (=> b!1224677 (= res!813357 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38655 _keys!1208)))))

(declare-fun b!1224678 () Bool)

(assert (=> b!1224678 (= e!695635 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!134403 (not res!813356)) b!1224677))

(assert (= (and b!1224677 res!813357) b!1224678))

(assert (=> d!134403 m!1129699))

(declare-fun m!1130035 () Bool)

(assert (=> b!1224678 m!1130035))

(assert (=> b!1224391 d!134403))

(declare-fun d!134405 () Bool)

(assert (=> d!134405 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1224400 d!134405))

(declare-fun d!134407 () Bool)

(assert (=> d!134407 (= (array_inv!29078 _keys!1208) (bvsge (size!38655 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101898 d!134407))

(declare-fun d!134409 () Bool)

(assert (=> d!134409 (= (array_inv!29079 _values!996) (bvsge (size!38656 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101898 d!134409))

(declare-fun mapIsEmpty!48535 () Bool)

(declare-fun mapRes!48535 () Bool)

(assert (=> mapIsEmpty!48535 mapRes!48535))

(declare-fun condMapEmpty!48535 () Bool)

(declare-fun mapDefault!48535 () ValueCell!14834)

(assert (=> mapNonEmpty!48526 (= condMapEmpty!48535 (= mapRest!48526 ((as const (Array (_ BitVec 32) ValueCell!14834)) mapDefault!48535)))))

(declare-fun e!695641 () Bool)

(assert (=> mapNonEmpty!48526 (= tp!92192 (and e!695641 mapRes!48535))))

(declare-fun b!1224685 () Bool)

(declare-fun e!695640 () Bool)

(assert (=> b!1224685 (= e!695640 tp_is_empty!31087)))

(declare-fun b!1224686 () Bool)

(assert (=> b!1224686 (= e!695641 tp_is_empty!31087)))

(declare-fun mapNonEmpty!48535 () Bool)

(declare-fun tp!92207 () Bool)

(assert (=> mapNonEmpty!48535 (= mapRes!48535 (and tp!92207 e!695640))))

(declare-fun mapValue!48535 () ValueCell!14834)

(declare-fun mapKey!48535 () (_ BitVec 32))

(declare-fun mapRest!48535 () (Array (_ BitVec 32) ValueCell!14834))

(assert (=> mapNonEmpty!48535 (= mapRest!48526 (store mapRest!48535 mapKey!48535 mapValue!48535))))

(assert (= (and mapNonEmpty!48526 condMapEmpty!48535) mapIsEmpty!48535))

(assert (= (and mapNonEmpty!48526 (not condMapEmpty!48535)) mapNonEmpty!48535))

(assert (= (and mapNonEmpty!48535 ((_ is ValueCellFull!14834) mapValue!48535)) b!1224685))

(assert (= (and mapNonEmpty!48526 ((_ is ValueCellFull!14834) mapDefault!48535)) b!1224686))

(declare-fun m!1130037 () Bool)

(assert (=> mapNonEmpty!48535 m!1130037))

(declare-fun b_lambda!22345 () Bool)

(assert (= b_lambda!22327 (or (and start!101898 b_free!26383) b_lambda!22345)))

(declare-fun b_lambda!22347 () Bool)

(assert (= b_lambda!22339 (or (and start!101898 b_free!26383) b_lambda!22347)))

(declare-fun b_lambda!22349 () Bool)

(assert (= b_lambda!22341 (or (and start!101898 b_free!26383) b_lambda!22349)))

(declare-fun b_lambda!22351 () Bool)

(assert (= b_lambda!22331 (or (and start!101898 b_free!26383) b_lambda!22351)))

(declare-fun b_lambda!22353 () Bool)

(assert (= b_lambda!22329 (or (and start!101898 b_free!26383) b_lambda!22353)))

(declare-fun b_lambda!22355 () Bool)

(assert (= b_lambda!22337 (or (and start!101898 b_free!26383) b_lambda!22355)))

(declare-fun b_lambda!22357 () Bool)

(assert (= b_lambda!22343 (or (and start!101898 b_free!26383) b_lambda!22357)))

(declare-fun b_lambda!22359 () Bool)

(assert (= b_lambda!22335 (or (and start!101898 b_free!26383) b_lambda!22359)))

(declare-fun b_lambda!22361 () Bool)

(assert (= b_lambda!22333 (or (and start!101898 b_free!26383) b_lambda!22361)))

(check-sat (not b_lambda!22361) (not b!1224645) (not b!1224562) (not b!1224624) (not b!1224634) (not b!1224642) (not b!1224544) (not bm!60823) (not b!1224644) (not b!1224625) (not b!1224581) (not b!1224632) (not b!1224627) (not b_lambda!22355) (not d!134381) (not b!1224658) (not b!1224667) (not b!1224637) (not b!1224660) (not bm!60830) (not b!1224646) (not b_lambda!22351) (not b!1224678) (not d!134383) (not b!1224636) (not mapNonEmpty!48535) (not bm!60824) (not b!1224648) (not b!1224612) (not b!1224608) (not b!1224563) (not d!134363) (not b_lambda!22325) (not d!134377) (not b!1224653) (not b!1224542) (not b!1224675) (not b!1224613) (not bm!60817) (not d!134391) (not bm!60832) (not b!1224550) (not b!1224617) (not b!1224649) (not d!134397) (not b!1224641) (not b_next!26383) (not bm!60814) (not bm!60831) (not b!1224615) (not b!1224631) (not d!134367) (not d!134369) (not b!1224565) (not b_lambda!22349) (not b_lambda!22353) (not b!1224628) b_and!44039 (not b_lambda!22347) (not b!1224570) (not d!134385) (not b!1224670) (not b!1224662) (not b!1224572) (not d!134393) (not b_lambda!22345) (not b!1224639) (not d!134375) (not b!1224610) (not b!1224676) (not b_lambda!22357) (not b!1224568) (not b!1224620) (not b!1224616) (not b!1224654) (not b!1224629) (not bm!60828) (not b!1224651) (not b!1224619) (not b!1224607) (not b!1224656) (not d!134399) (not bm!60829) (not bm!60818) (not b!1224668) (not b!1224657) (not b!1224567) (not b!1224622) (not b!1224669) (not bm!60827) (not b_lambda!22359) tp_is_empty!31087)
(check-sat b_and!44039 (not b_next!26383))
