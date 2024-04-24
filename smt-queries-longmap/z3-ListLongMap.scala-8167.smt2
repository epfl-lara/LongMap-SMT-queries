; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100104 () Bool)

(assert start!100104)

(declare-fun b_free!25447 () Bool)

(declare-fun b_next!25447 () Bool)

(assert (=> start!100104 (= b_free!25447 (not b_next!25447))))

(declare-fun tp!89055 () Bool)

(declare-fun b_and!41763 () Bool)

(assert (=> start!100104 (= tp!89055 b_and!41763)))

(declare-fun res!790475 () Bool)

(declare-fun e!676414 () Bool)

(assert (=> start!100104 (=> (not res!790475) (not e!676414))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76795 0))(
  ( (array!76796 (arr!37041 (Array (_ BitVec 32) (_ BitVec 64))) (size!37578 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76795)

(assert (=> start!100104 (= res!790475 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37578 _keys!1208))))))

(assert (=> start!100104 e!676414))

(declare-fun tp_is_empty!29977 () Bool)

(assert (=> start!100104 tp_is_empty!29977))

(declare-fun array_inv!28330 (array!76795) Bool)

(assert (=> start!100104 (array_inv!28330 _keys!1208)))

(assert (=> start!100104 true))

(assert (=> start!100104 tp!89055))

(declare-datatypes ((V!45097 0))(
  ( (V!45098 (val!15045 Int)) )
))
(declare-datatypes ((ValueCell!14279 0))(
  ( (ValueCellFull!14279 (v!17679 V!45097)) (EmptyCell!14279) )
))
(declare-datatypes ((array!76797 0))(
  ( (array!76798 (arr!37042 (Array (_ BitVec 32) ValueCell!14279)) (size!37579 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76797)

(declare-fun e!676415 () Bool)

(declare-fun array_inv!28331 (array!76797) Bool)

(assert (=> start!100104 (and (array_inv!28331 _values!996) e!676415)))

(declare-fun b!1189432 () Bool)

(declare-fun e!676418 () Bool)

(declare-fun e!676416 () Bool)

(assert (=> b!1189432 (= e!676418 e!676416)))

(declare-fun res!790479 () Bool)

(assert (=> b!1189432 (=> res!790479 e!676416)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189432 (= res!790479 (not (validKeyInArray!0 (select (arr!37041 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19354 0))(
  ( (tuple2!19355 (_1!9688 (_ BitVec 64)) (_2!9688 V!45097)) )
))
(declare-datatypes ((List!26094 0))(
  ( (Nil!26091) (Cons!26090 (h!27308 tuple2!19354) (t!38525 List!26094)) )
))
(declare-datatypes ((ListLongMap!17331 0))(
  ( (ListLongMap!17332 (toList!8681 List!26094)) )
))
(declare-fun lt!540980 () ListLongMap!17331)

(declare-fun lt!540976 () ListLongMap!17331)

(assert (=> b!1189432 (= lt!540980 lt!540976)))

(declare-fun lt!540983 () ListLongMap!17331)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1700 (ListLongMap!17331 (_ BitVec 64)) ListLongMap!17331)

(assert (=> b!1189432 (= lt!540976 (-!1700 lt!540983 k0!934))))

(declare-fun zeroValue!944 () V!45097)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540988 () array!76797)

(declare-fun minValue!944 () V!45097)

(declare-fun lt!540991 () array!76795)

(declare-fun getCurrentListMapNoExtraKeys!5149 (array!76795 array!76797 (_ BitVec 32) (_ BitVec 32) V!45097 V!45097 (_ BitVec 32) Int) ListLongMap!17331)

(assert (=> b!1189432 (= lt!540980 (getCurrentListMapNoExtraKeys!5149 lt!540991 lt!540988 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1189432 (= lt!540983 (getCurrentListMapNoExtraKeys!5149 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39397 0))(
  ( (Unit!39398) )
))
(declare-fun lt!540987 () Unit!39397)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!915 (array!76795 array!76797 (_ BitVec 32) (_ BitVec 32) V!45097 V!45097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39397)

(assert (=> b!1189432 (= lt!540987 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!915 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189433 () Bool)

(declare-fun res!790472 () Bool)

(assert (=> b!1189433 (=> (not res!790472) (not e!676414))))

(assert (=> b!1189433 (= res!790472 (= (select (arr!37041 _keys!1208) i!673) k0!934))))

(declare-fun b!1189434 () Bool)

(declare-fun e!676408 () Bool)

(declare-fun mapRes!46793 () Bool)

(assert (=> b!1189434 (= e!676415 (and e!676408 mapRes!46793))))

(declare-fun condMapEmpty!46793 () Bool)

(declare-fun mapDefault!46793 () ValueCell!14279)

(assert (=> b!1189434 (= condMapEmpty!46793 (= (arr!37042 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14279)) mapDefault!46793)))))

(declare-fun b!1189435 () Bool)

(declare-fun res!790467 () Bool)

(assert (=> b!1189435 (=> (not res!790467) (not e!676414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189435 (= res!790467 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46793 () Bool)

(assert (=> mapIsEmpty!46793 mapRes!46793))

(declare-fun b!1189436 () Bool)

(declare-fun res!790478 () Bool)

(assert (=> b!1189436 (=> (not res!790478) (not e!676414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76795 (_ BitVec 32)) Bool)

(assert (=> b!1189436 (= res!790478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189437 () Bool)

(declare-fun e!676410 () Bool)

(declare-fun e!676411 () Bool)

(assert (=> b!1189437 (= e!676410 (not e!676411))))

(declare-fun res!790471 () Bool)

(assert (=> b!1189437 (=> res!790471 e!676411)))

(assert (=> b!1189437 (= res!790471 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189437 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!540993 () Unit!39397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76795 (_ BitVec 64) (_ BitVec 32)) Unit!39397)

(assert (=> b!1189437 (= lt!540993 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189438 () Bool)

(declare-fun res!790481 () Bool)

(assert (=> b!1189438 (=> (not res!790481) (not e!676414))))

(assert (=> b!1189438 (= res!790481 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37578 _keys!1208))))))

(declare-fun b!1189439 () Bool)

(declare-fun res!790468 () Bool)

(assert (=> b!1189439 (=> (not res!790468) (not e!676414))))

(declare-datatypes ((List!26095 0))(
  ( (Nil!26092) (Cons!26091 (h!27309 (_ BitVec 64)) (t!38526 List!26095)) )
))
(declare-fun arrayNoDuplicates!0 (array!76795 (_ BitVec 32) List!26095) Bool)

(assert (=> b!1189439 (= res!790468 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26092))))

(declare-fun b!1189440 () Bool)

(declare-fun e!676413 () Unit!39397)

(declare-fun Unit!39399 () Unit!39397)

(assert (=> b!1189440 (= e!676413 Unit!39399)))

(declare-fun lt!540989 () Unit!39397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76795 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39397)

(assert (=> b!1189440 (= lt!540989 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1189440 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540990 () Unit!39397)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76795 (_ BitVec 32) (_ BitVec 32)) Unit!39397)

(assert (=> b!1189440 (= lt!540990 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1189440 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26092)))

(declare-fun lt!540981 () Unit!39397)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76795 (_ BitVec 64) (_ BitVec 32) List!26095) Unit!39397)

(assert (=> b!1189440 (= lt!540981 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26092))))

(assert (=> b!1189440 false))

(declare-fun b!1189441 () Bool)

(declare-fun res!790476 () Bool)

(assert (=> b!1189441 (=> (not res!790476) (not e!676414))))

(assert (=> b!1189441 (= res!790476 (and (= (size!37579 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37578 _keys!1208) (size!37579 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189442 () Bool)

(declare-fun Unit!39400 () Unit!39397)

(assert (=> b!1189442 (= e!676413 Unit!39400)))

(declare-fun b!1189443 () Bool)

(assert (=> b!1189443 (= e!676408 tp_is_empty!29977)))

(declare-fun b!1189444 () Bool)

(assert (=> b!1189444 (= e!676414 e!676410)))

(declare-fun res!790474 () Bool)

(assert (=> b!1189444 (=> (not res!790474) (not e!676410))))

(assert (=> b!1189444 (= res!790474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540991 mask!1564))))

(assert (=> b!1189444 (= lt!540991 (array!76796 (store (arr!37041 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37578 _keys!1208)))))

(declare-fun b!1189445 () Bool)

(declare-fun e!676417 () Bool)

(declare-fun e!676407 () Bool)

(assert (=> b!1189445 (= e!676417 e!676407)))

(declare-fun res!790477 () Bool)

(assert (=> b!1189445 (=> res!790477 e!676407)))

(assert (=> b!1189445 (= res!790477 (not (= (select (arr!37041 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1189446 () Bool)

(assert (=> b!1189446 (= e!676407 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46793 () Bool)

(declare-fun tp!89054 () Bool)

(declare-fun e!676412 () Bool)

(assert (=> mapNonEmpty!46793 (= mapRes!46793 (and tp!89054 e!676412))))

(declare-fun mapRest!46793 () (Array (_ BitVec 32) ValueCell!14279))

(declare-fun mapKey!46793 () (_ BitVec 32))

(declare-fun mapValue!46793 () ValueCell!14279)

(assert (=> mapNonEmpty!46793 (= (arr!37042 _values!996) (store mapRest!46793 mapKey!46793 mapValue!46793))))

(declare-fun b!1189447 () Bool)

(assert (=> b!1189447 (= e!676416 true)))

(declare-fun lt!540992 () ListLongMap!17331)

(declare-fun lt!540978 () ListLongMap!17331)

(assert (=> b!1189447 (= (-!1700 lt!540992 k0!934) lt!540978)))

(declare-fun lt!540984 () V!45097)

(declare-fun lt!540985 () Unit!39397)

(declare-fun addRemoveCommutativeForDiffKeys!210 (ListLongMap!17331 (_ BitVec 64) V!45097 (_ BitVec 64)) Unit!39397)

(assert (=> b!1189447 (= lt!540985 (addRemoveCommutativeForDiffKeys!210 lt!540983 (select (arr!37041 _keys!1208) from!1455) lt!540984 k0!934))))

(declare-fun lt!540986 () ListLongMap!17331)

(assert (=> b!1189447 (and (= lt!540986 lt!540992) (= lt!540976 lt!540980))))

(declare-fun lt!540994 () tuple2!19354)

(declare-fun +!3994 (ListLongMap!17331 tuple2!19354) ListLongMap!17331)

(assert (=> b!1189447 (= lt!540992 (+!3994 lt!540983 lt!540994))))

(assert (=> b!1189447 (not (= (select (arr!37041 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540979 () Unit!39397)

(assert (=> b!1189447 (= lt!540979 e!676413)))

(declare-fun c!117692 () Bool)

(assert (=> b!1189447 (= c!117692 (= (select (arr!37041 _keys!1208) from!1455) k0!934))))

(assert (=> b!1189447 e!676417))

(declare-fun res!790473 () Bool)

(assert (=> b!1189447 (=> (not res!790473) (not e!676417))))

(declare-fun lt!540977 () ListLongMap!17331)

(assert (=> b!1189447 (= res!790473 (= lt!540977 lt!540978))))

(assert (=> b!1189447 (= lt!540978 (+!3994 lt!540976 lt!540994))))

(assert (=> b!1189447 (= lt!540994 (tuple2!19355 (select (arr!37041 _keys!1208) from!1455) lt!540984))))

(declare-fun lt!540982 () V!45097)

(declare-fun get!19021 (ValueCell!14279 V!45097) V!45097)

(assert (=> b!1189447 (= lt!540984 (get!19021 (select (arr!37042 _values!996) from!1455) lt!540982))))

(declare-fun b!1189448 () Bool)

(declare-fun res!790469 () Bool)

(assert (=> b!1189448 (=> (not res!790469) (not e!676410))))

(assert (=> b!1189448 (= res!790469 (arrayNoDuplicates!0 lt!540991 #b00000000000000000000000000000000 Nil!26092))))

(declare-fun b!1189449 () Bool)

(assert (=> b!1189449 (= e!676412 tp_is_empty!29977)))

(declare-fun b!1189450 () Bool)

(declare-fun res!790470 () Bool)

(assert (=> b!1189450 (=> (not res!790470) (not e!676414))))

(assert (=> b!1189450 (= res!790470 (validKeyInArray!0 k0!934))))

(declare-fun b!1189451 () Bool)

(assert (=> b!1189451 (= e!676411 e!676418)))

(declare-fun res!790480 () Bool)

(assert (=> b!1189451 (=> res!790480 e!676418)))

(assert (=> b!1189451 (= res!790480 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1189451 (= lt!540977 (getCurrentListMapNoExtraKeys!5149 lt!540991 lt!540988 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1189451 (= lt!540988 (array!76798 (store (arr!37042 _values!996) i!673 (ValueCellFull!14279 lt!540982)) (size!37579 _values!996)))))

(declare-fun dynLambda!3108 (Int (_ BitVec 64)) V!45097)

(assert (=> b!1189451 (= lt!540982 (dynLambda!3108 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1189451 (= lt!540986 (getCurrentListMapNoExtraKeys!5149 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100104 res!790475) b!1189435))

(assert (= (and b!1189435 res!790467) b!1189441))

(assert (= (and b!1189441 res!790476) b!1189436))

(assert (= (and b!1189436 res!790478) b!1189439))

(assert (= (and b!1189439 res!790468) b!1189438))

(assert (= (and b!1189438 res!790481) b!1189450))

(assert (= (and b!1189450 res!790470) b!1189433))

(assert (= (and b!1189433 res!790472) b!1189444))

(assert (= (and b!1189444 res!790474) b!1189448))

(assert (= (and b!1189448 res!790469) b!1189437))

(assert (= (and b!1189437 (not res!790471)) b!1189451))

(assert (= (and b!1189451 (not res!790480)) b!1189432))

(assert (= (and b!1189432 (not res!790479)) b!1189447))

(assert (= (and b!1189447 res!790473) b!1189445))

(assert (= (and b!1189445 (not res!790477)) b!1189446))

(assert (= (and b!1189447 c!117692) b!1189440))

(assert (= (and b!1189447 (not c!117692)) b!1189442))

(assert (= (and b!1189434 condMapEmpty!46793) mapIsEmpty!46793))

(assert (= (and b!1189434 (not condMapEmpty!46793)) mapNonEmpty!46793))

(get-info :version)

(assert (= (and mapNonEmpty!46793 ((_ is ValueCellFull!14279) mapValue!46793)) b!1189449))

(assert (= (and b!1189434 ((_ is ValueCellFull!14279) mapDefault!46793)) b!1189443))

(assert (= start!100104 b!1189434))

(declare-fun b_lambda!20585 () Bool)

(assert (=> (not b_lambda!20585) (not b!1189451)))

(declare-fun t!38524 () Bool)

(declare-fun tb!10251 () Bool)

(assert (=> (and start!100104 (= defaultEntry!1004 defaultEntry!1004) t!38524) tb!10251))

(declare-fun result!21077 () Bool)

(assert (=> tb!10251 (= result!21077 tp_is_empty!29977)))

(assert (=> b!1189451 t!38524))

(declare-fun b_and!41765 () Bool)

(assert (= b_and!41763 (and (=> t!38524 result!21077) b_and!41765)))

(declare-fun m!1098477 () Bool)

(assert (=> b!1189440 m!1098477))

(declare-fun m!1098479 () Bool)

(assert (=> b!1189440 m!1098479))

(declare-fun m!1098481 () Bool)

(assert (=> b!1189440 m!1098481))

(declare-fun m!1098483 () Bool)

(assert (=> b!1189440 m!1098483))

(declare-fun m!1098485 () Bool)

(assert (=> b!1189440 m!1098485))

(declare-fun m!1098487 () Bool)

(assert (=> b!1189432 m!1098487))

(declare-fun m!1098489 () Bool)

(assert (=> b!1189432 m!1098489))

(declare-fun m!1098491 () Bool)

(assert (=> b!1189432 m!1098491))

(declare-fun m!1098493 () Bool)

(assert (=> b!1189432 m!1098493))

(assert (=> b!1189432 m!1098489))

(declare-fun m!1098495 () Bool)

(assert (=> b!1189432 m!1098495))

(declare-fun m!1098497 () Bool)

(assert (=> b!1189432 m!1098497))

(declare-fun m!1098499 () Bool)

(assert (=> b!1189448 m!1098499))

(declare-fun m!1098501 () Bool)

(assert (=> b!1189435 m!1098501))

(declare-fun m!1098503 () Bool)

(assert (=> b!1189436 m!1098503))

(declare-fun m!1098505 () Bool)

(assert (=> b!1189451 m!1098505))

(declare-fun m!1098507 () Bool)

(assert (=> b!1189451 m!1098507))

(declare-fun m!1098509 () Bool)

(assert (=> b!1189451 m!1098509))

(declare-fun m!1098511 () Bool)

(assert (=> b!1189451 m!1098511))

(assert (=> b!1189445 m!1098489))

(declare-fun m!1098513 () Bool)

(assert (=> b!1189444 m!1098513))

(declare-fun m!1098515 () Bool)

(assert (=> b!1189444 m!1098515))

(declare-fun m!1098517 () Bool)

(assert (=> mapNonEmpty!46793 m!1098517))

(declare-fun m!1098519 () Bool)

(assert (=> b!1189437 m!1098519))

(declare-fun m!1098521 () Bool)

(assert (=> b!1189437 m!1098521))

(declare-fun m!1098523 () Bool)

(assert (=> b!1189439 m!1098523))

(declare-fun m!1098525 () Bool)

(assert (=> b!1189450 m!1098525))

(declare-fun m!1098527 () Bool)

(assert (=> b!1189446 m!1098527))

(declare-fun m!1098529 () Bool)

(assert (=> b!1189433 m!1098529))

(declare-fun m!1098531 () Bool)

(assert (=> start!100104 m!1098531))

(declare-fun m!1098533 () Bool)

(assert (=> start!100104 m!1098533))

(assert (=> b!1189447 m!1098489))

(declare-fun m!1098535 () Bool)

(assert (=> b!1189447 m!1098535))

(declare-fun m!1098537 () Bool)

(assert (=> b!1189447 m!1098537))

(declare-fun m!1098539 () Bool)

(assert (=> b!1189447 m!1098539))

(declare-fun m!1098541 () Bool)

(assert (=> b!1189447 m!1098541))

(assert (=> b!1189447 m!1098539))

(declare-fun m!1098543 () Bool)

(assert (=> b!1189447 m!1098543))

(declare-fun m!1098545 () Bool)

(assert (=> b!1189447 m!1098545))

(assert (=> b!1189447 m!1098489))

(check-sat (not b!1189436) (not b!1189447) (not b!1189439) (not b!1189450) (not b!1189444) (not b!1189451) (not b!1189432) (not b_next!25447) (not b!1189437) (not b!1189446) tp_is_empty!29977 (not b!1189448) (not b!1189440) (not mapNonEmpty!46793) b_and!41765 (not b!1189435) (not b_lambda!20585) (not start!100104))
(check-sat b_and!41765 (not b_next!25447))
