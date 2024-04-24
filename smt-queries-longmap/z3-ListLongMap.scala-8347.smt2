; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101868 () Bool)

(assert start!101868)

(declare-fun b_free!26353 () Bool)

(declare-fun b_next!26353 () Bool)

(assert (=> start!101868 (= b_free!26353 (not b_next!26353))))

(declare-fun tp!92102 () Bool)

(declare-fun b_and!43951 () Bool)

(assert (=> start!101868 (= tp!92102 b_and!43951)))

(declare-fun b!1223464 () Bool)

(declare-fun res!812518 () Bool)

(declare-fun e!694915 () Bool)

(assert (=> b!1223464 (=> (not res!812518) (not e!694915))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223464 (= res!812518 (validKeyInArray!0 k0!934))))

(declare-fun b!1223465 () Bool)

(declare-fun e!694916 () Bool)

(declare-fun e!694917 () Bool)

(assert (=> b!1223465 (= e!694916 e!694917)))

(declare-fun res!812511 () Bool)

(assert (=> b!1223465 (=> res!812511 e!694917)))

(declare-datatypes ((array!78935 0))(
  ( (array!78936 (arr!38089 (Array (_ BitVec 32) (_ BitVec 64))) (size!38626 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78935)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1223465 (= res!812511 (not (validKeyInArray!0 (select (arr!38089 _keys!1208) from!1455))))))

(declare-datatypes ((V!46537 0))(
  ( (V!46538 (val!15585 Int)) )
))
(declare-datatypes ((tuple2!20086 0))(
  ( (tuple2!20087 (_1!10054 (_ BitVec 64)) (_2!10054 V!46537)) )
))
(declare-datatypes ((List!26897 0))(
  ( (Nil!26894) (Cons!26893 (h!28111 tuple2!20086) (t!40222 List!26897)) )
))
(declare-datatypes ((ListLongMap!18063 0))(
  ( (ListLongMap!18064 (toList!9047 List!26897)) )
))
(declare-fun lt!556479 () ListLongMap!18063)

(declare-fun lt!556483 () ListLongMap!18063)

(assert (=> b!1223465 (= lt!556479 lt!556483)))

(declare-fun lt!556480 () ListLongMap!18063)

(declare-fun -!1928 (ListLongMap!18063 (_ BitVec 64)) ListLongMap!18063)

(assert (=> b!1223465 (= lt!556483 (-!1928 lt!556480 k0!934))))

(declare-fun zeroValue!944 () V!46537)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14819 0))(
  ( (ValueCellFull!14819 (v!18242 V!46537)) (EmptyCell!14819) )
))
(declare-datatypes ((array!78937 0))(
  ( (array!78938 (arr!38090 (Array (_ BitVec 32) ValueCell!14819)) (size!38627 (_ BitVec 32))) )
))
(declare-fun lt!556474 () array!78937)

(declare-fun minValue!944 () V!46537)

(declare-fun lt!556485 () array!78935)

(declare-fun getCurrentListMapNoExtraKeys!5500 (array!78935 array!78937 (_ BitVec 32) (_ BitVec 32) V!46537 V!46537 (_ BitVec 32) Int) ListLongMap!18063)

(assert (=> b!1223465 (= lt!556479 (getCurrentListMapNoExtraKeys!5500 lt!556485 lt!556474 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78937)

(assert (=> b!1223465 (= lt!556480 (getCurrentListMapNoExtraKeys!5500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40448 0))(
  ( (Unit!40449) )
))
(declare-fun lt!556486 () Unit!40448)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1143 (array!78935 array!78937 (_ BitVec 32) (_ BitVec 32) V!46537 V!46537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40448)

(assert (=> b!1223465 (= lt!556486 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1143 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!812514 () Bool)

(assert (=> start!101868 (=> (not res!812514) (not e!694915))))

(assert (=> start!101868 (= res!812514 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38626 _keys!1208))))))

(assert (=> start!101868 e!694915))

(declare-fun tp_is_empty!31057 () Bool)

(assert (=> start!101868 tp_is_empty!31057))

(declare-fun array_inv!29062 (array!78935) Bool)

(assert (=> start!101868 (array_inv!29062 _keys!1208)))

(assert (=> start!101868 true))

(assert (=> start!101868 tp!92102))

(declare-fun e!694925 () Bool)

(declare-fun array_inv!29063 (array!78937) Bool)

(assert (=> start!101868 (and (array_inv!29063 _values!996) e!694925)))

(declare-fun b!1223466 () Bool)

(declare-fun e!694919 () Bool)

(assert (=> b!1223466 (= e!694919 true)))

(assert (=> b!1223466 false))

(declare-fun lt!556475 () Unit!40448)

(declare-datatypes ((List!26898 0))(
  ( (Nil!26895) (Cons!26894 (h!28112 (_ BitVec 64)) (t!40223 List!26898)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78935 (_ BitVec 64) (_ BitVec 32) List!26898) Unit!40448)

(assert (=> b!1223466 (= lt!556475 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26895))))

(declare-fun arrayNoDuplicates!0 (array!78935 (_ BitVec 32) List!26898) Bool)

(assert (=> b!1223466 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26895)))

(declare-fun lt!556478 () Unit!40448)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78935 (_ BitVec 32) (_ BitVec 32)) Unit!40448)

(assert (=> b!1223466 (= lt!556478 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!78935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223466 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556477 () Unit!40448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78935 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40448)

(assert (=> b!1223466 (= lt!556477 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1223467 () Bool)

(declare-fun e!694923 () Bool)

(assert (=> b!1223467 (= e!694923 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223468 () Bool)

(declare-fun res!812504 () Bool)

(assert (=> b!1223468 (=> (not res!812504) (not e!694915))))

(assert (=> b!1223468 (= res!812504 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38626 _keys!1208))))))

(declare-fun b!1223469 () Bool)

(declare-fun e!694922 () Bool)

(assert (=> b!1223469 (= e!694922 e!694916)))

(declare-fun res!812508 () Bool)

(assert (=> b!1223469 (=> res!812508 e!694916)))

(assert (=> b!1223469 (= res!812508 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!556476 () ListLongMap!18063)

(assert (=> b!1223469 (= lt!556476 (getCurrentListMapNoExtraKeys!5500 lt!556485 lt!556474 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556484 () V!46537)

(assert (=> b!1223469 (= lt!556474 (array!78938 (store (arr!38090 _values!996) i!673 (ValueCellFull!14819 lt!556484)) (size!38627 _values!996)))))

(declare-fun dynLambda!3401 (Int (_ BitVec 64)) V!46537)

(assert (=> b!1223469 (= lt!556484 (dynLambda!3401 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556481 () ListLongMap!18063)

(assert (=> b!1223469 (= lt!556481 (getCurrentListMapNoExtraKeys!5500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223470 () Bool)

(declare-fun res!812503 () Bool)

(assert (=> b!1223470 (=> (not res!812503) (not e!694915))))

(assert (=> b!1223470 (= res!812503 (and (= (size!38627 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38626 _keys!1208) (size!38627 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223471 () Bool)

(declare-fun res!812510 () Bool)

(assert (=> b!1223471 (=> (not res!812510) (not e!694915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78935 (_ BitVec 32)) Bool)

(assert (=> b!1223471 (= res!812510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223472 () Bool)

(declare-fun e!694920 () Bool)

(assert (=> b!1223472 (= e!694920 (not e!694922))))

(declare-fun res!812517 () Bool)

(assert (=> b!1223472 (=> res!812517 e!694922)))

(assert (=> b!1223472 (= res!812517 (bvsgt from!1455 i!673))))

(assert (=> b!1223472 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556482 () Unit!40448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78935 (_ BitVec 64) (_ BitVec 32)) Unit!40448)

(assert (=> b!1223472 (= lt!556482 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223473 () Bool)

(declare-fun res!812513 () Bool)

(assert (=> b!1223473 (=> (not res!812513) (not e!694920))))

(assert (=> b!1223473 (= res!812513 (arrayNoDuplicates!0 lt!556485 #b00000000000000000000000000000000 Nil!26895))))

(declare-fun mapNonEmpty!48481 () Bool)

(declare-fun mapRes!48481 () Bool)

(declare-fun tp!92101 () Bool)

(declare-fun e!694924 () Bool)

(assert (=> mapNonEmpty!48481 (= mapRes!48481 (and tp!92101 e!694924))))

(declare-fun mapKey!48481 () (_ BitVec 32))

(declare-fun mapValue!48481 () ValueCell!14819)

(declare-fun mapRest!48481 () (Array (_ BitVec 32) ValueCell!14819))

(assert (=> mapNonEmpty!48481 (= (arr!38090 _values!996) (store mapRest!48481 mapKey!48481 mapValue!48481))))

(declare-fun b!1223474 () Bool)

(declare-fun res!812507 () Bool)

(assert (=> b!1223474 (=> (not res!812507) (not e!694915))))

(assert (=> b!1223474 (= res!812507 (= (select (arr!38089 _keys!1208) i!673) k0!934))))

(declare-fun b!1223475 () Bool)

(declare-fun e!694921 () Bool)

(assert (=> b!1223475 (= e!694925 (and e!694921 mapRes!48481))))

(declare-fun condMapEmpty!48481 () Bool)

(declare-fun mapDefault!48481 () ValueCell!14819)

(assert (=> b!1223475 (= condMapEmpty!48481 (= (arr!38090 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14819)) mapDefault!48481)))))

(declare-fun b!1223476 () Bool)

(assert (=> b!1223476 (= e!694921 tp_is_empty!31057)))

(declare-fun b!1223477 () Bool)

(assert (=> b!1223477 (= e!694924 tp_is_empty!31057)))

(declare-fun b!1223478 () Bool)

(declare-fun res!812516 () Bool)

(assert (=> b!1223478 (=> (not res!812516) (not e!694915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223478 (= res!812516 (validMask!0 mask!1564))))

(declare-fun b!1223479 () Bool)

(declare-fun e!694926 () Bool)

(assert (=> b!1223479 (= e!694926 e!694923)))

(declare-fun res!812506 () Bool)

(assert (=> b!1223479 (=> res!812506 e!694923)))

(assert (=> b!1223479 (= res!812506 (not (= (select (arr!38089 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!48481 () Bool)

(assert (=> mapIsEmpty!48481 mapRes!48481))

(declare-fun b!1223480 () Bool)

(assert (=> b!1223480 (= e!694917 e!694919)))

(declare-fun res!812512 () Bool)

(assert (=> b!1223480 (=> res!812512 e!694919)))

(assert (=> b!1223480 (= res!812512 (not (= (select (arr!38089 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1223480 e!694926))

(declare-fun res!812515 () Bool)

(assert (=> b!1223480 (=> (not res!812515) (not e!694926))))

(declare-fun +!4151 (ListLongMap!18063 tuple2!20086) ListLongMap!18063)

(declare-fun get!19487 (ValueCell!14819 V!46537) V!46537)

(assert (=> b!1223480 (= res!812515 (= lt!556476 (+!4151 lt!556483 (tuple2!20087 (select (arr!38089 _keys!1208) from!1455) (get!19487 (select (arr!38090 _values!996) from!1455) lt!556484)))))))

(declare-fun b!1223481 () Bool)

(declare-fun res!812509 () Bool)

(assert (=> b!1223481 (=> (not res!812509) (not e!694915))))

(assert (=> b!1223481 (= res!812509 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26895))))

(declare-fun b!1223482 () Bool)

(assert (=> b!1223482 (= e!694915 e!694920)))

(declare-fun res!812505 () Bool)

(assert (=> b!1223482 (=> (not res!812505) (not e!694920))))

(assert (=> b!1223482 (= res!812505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556485 mask!1564))))

(assert (=> b!1223482 (= lt!556485 (array!78936 (store (arr!38089 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38626 _keys!1208)))))

(assert (= (and start!101868 res!812514) b!1223478))

(assert (= (and b!1223478 res!812516) b!1223470))

(assert (= (and b!1223470 res!812503) b!1223471))

(assert (= (and b!1223471 res!812510) b!1223481))

(assert (= (and b!1223481 res!812509) b!1223468))

(assert (= (and b!1223468 res!812504) b!1223464))

(assert (= (and b!1223464 res!812518) b!1223474))

(assert (= (and b!1223474 res!812507) b!1223482))

(assert (= (and b!1223482 res!812505) b!1223473))

(assert (= (and b!1223473 res!812513) b!1223472))

(assert (= (and b!1223472 (not res!812517)) b!1223469))

(assert (= (and b!1223469 (not res!812508)) b!1223465))

(assert (= (and b!1223465 (not res!812511)) b!1223480))

(assert (= (and b!1223480 res!812515) b!1223479))

(assert (= (and b!1223479 (not res!812506)) b!1223467))

(assert (= (and b!1223480 (not res!812512)) b!1223466))

(assert (= (and b!1223475 condMapEmpty!48481) mapIsEmpty!48481))

(assert (= (and b!1223475 (not condMapEmpty!48481)) mapNonEmpty!48481))

(get-info :version)

(assert (= (and mapNonEmpty!48481 ((_ is ValueCellFull!14819) mapValue!48481)) b!1223477))

(assert (= (and b!1223475 ((_ is ValueCellFull!14819) mapDefault!48481)) b!1223476))

(assert (= start!101868 b!1223475))

(declare-fun b_lambda!22289 () Bool)

(assert (=> (not b_lambda!22289) (not b!1223469)))

(declare-fun t!40221 () Bool)

(declare-fun tb!11145 () Bool)

(assert (=> (and start!101868 (= defaultEntry!1004 defaultEntry!1004) t!40221) tb!11145))

(declare-fun result!22909 () Bool)

(assert (=> tb!11145 (= result!22909 tp_is_empty!31057)))

(assert (=> b!1223469 t!40221))

(declare-fun b_and!43953 () Bool)

(assert (= b_and!43951 (and (=> t!40221 result!22909) b_and!43953)))

(declare-fun m!1128683 () Bool)

(assert (=> b!1223474 m!1128683))

(declare-fun m!1128685 () Bool)

(assert (=> b!1223480 m!1128685))

(declare-fun m!1128687 () Bool)

(assert (=> b!1223480 m!1128687))

(assert (=> b!1223480 m!1128687))

(declare-fun m!1128689 () Bool)

(assert (=> b!1223480 m!1128689))

(declare-fun m!1128691 () Bool)

(assert (=> b!1223480 m!1128691))

(declare-fun m!1128693 () Bool)

(assert (=> mapNonEmpty!48481 m!1128693))

(declare-fun m!1128695 () Bool)

(assert (=> b!1223464 m!1128695))

(declare-fun m!1128697 () Bool)

(assert (=> b!1223472 m!1128697))

(declare-fun m!1128699 () Bool)

(assert (=> b!1223472 m!1128699))

(declare-fun m!1128701 () Bool)

(assert (=> b!1223466 m!1128701))

(declare-fun m!1128703 () Bool)

(assert (=> b!1223466 m!1128703))

(declare-fun m!1128705 () Bool)

(assert (=> b!1223466 m!1128705))

(declare-fun m!1128707 () Bool)

(assert (=> b!1223466 m!1128707))

(declare-fun m!1128709 () Bool)

(assert (=> b!1223466 m!1128709))

(declare-fun m!1128711 () Bool)

(assert (=> b!1223465 m!1128711))

(declare-fun m!1128713 () Bool)

(assert (=> b!1223465 m!1128713))

(declare-fun m!1128715 () Bool)

(assert (=> b!1223465 m!1128715))

(declare-fun m!1128717 () Bool)

(assert (=> b!1223465 m!1128717))

(assert (=> b!1223465 m!1128685))

(declare-fun m!1128719 () Bool)

(assert (=> b!1223465 m!1128719))

(assert (=> b!1223465 m!1128685))

(declare-fun m!1128721 () Bool)

(assert (=> start!101868 m!1128721))

(declare-fun m!1128723 () Bool)

(assert (=> start!101868 m!1128723))

(declare-fun m!1128725 () Bool)

(assert (=> b!1223469 m!1128725))

(declare-fun m!1128727 () Bool)

(assert (=> b!1223469 m!1128727))

(declare-fun m!1128729 () Bool)

(assert (=> b!1223469 m!1128729))

(declare-fun m!1128731 () Bool)

(assert (=> b!1223469 m!1128731))

(declare-fun m!1128733 () Bool)

(assert (=> b!1223473 m!1128733))

(declare-fun m!1128735 () Bool)

(assert (=> b!1223471 m!1128735))

(declare-fun m!1128737 () Bool)

(assert (=> b!1223467 m!1128737))

(declare-fun m!1128739 () Bool)

(assert (=> b!1223478 m!1128739))

(declare-fun m!1128741 () Bool)

(assert (=> b!1223482 m!1128741))

(declare-fun m!1128743 () Bool)

(assert (=> b!1223482 m!1128743))

(assert (=> b!1223479 m!1128685))

(declare-fun m!1128745 () Bool)

(assert (=> b!1223481 m!1128745))

(check-sat (not b!1223466) (not b!1223473) (not b!1223472) (not b_lambda!22289) (not b!1223478) (not b!1223464) (not b_next!26353) (not start!101868) (not b!1223469) (not b!1223465) b_and!43953 tp_is_empty!31057 (not mapNonEmpty!48481) (not b!1223482) (not b!1223471) (not b!1223481) (not b!1223480) (not b!1223467))
(check-sat b_and!43953 (not b_next!26353))
