; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99654 () Bool)

(assert start!99654)

(declare-fun b_free!25233 () Bool)

(declare-fun b_next!25233 () Bool)

(assert (=> start!99654 (= b_free!25233 (not b_next!25233))))

(declare-fun tp!88412 () Bool)

(declare-fun b_and!41333 () Bool)

(assert (=> start!99654 (= tp!88412 b_and!41333)))

(declare-fun b!1181501 () Bool)

(declare-fun res!785148 () Bool)

(declare-fun e!671723 () Bool)

(assert (=> b!1181501 (=> (not res!785148) (not e!671723))))

(declare-datatypes ((array!76329 0))(
  ( (array!76330 (arr!36814 (Array (_ BitVec 32) (_ BitVec 64))) (size!37350 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76329)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1181501 (= res!785148 (= (select (arr!36814 _keys!1208) i!673) k0!934))))

(declare-fun b!1181502 () Bool)

(declare-fun e!671724 () Bool)

(declare-fun e!671726 () Bool)

(declare-fun mapRes!46472 () Bool)

(assert (=> b!1181502 (= e!671724 (and e!671726 mapRes!46472))))

(declare-fun condMapEmpty!46472 () Bool)

(declare-datatypes ((V!44811 0))(
  ( (V!44812 (val!14938 Int)) )
))
(declare-datatypes ((ValueCell!14172 0))(
  ( (ValueCellFull!14172 (v!17576 V!44811)) (EmptyCell!14172) )
))
(declare-datatypes ((array!76331 0))(
  ( (array!76332 (arr!36815 (Array (_ BitVec 32) ValueCell!14172)) (size!37351 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76331)

(declare-fun mapDefault!46472 () ValueCell!14172)

(assert (=> b!1181502 (= condMapEmpty!46472 (= (arr!36815 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14172)) mapDefault!46472)))))

(declare-fun b!1181503 () Bool)

(declare-fun e!671727 () Bool)

(assert (=> b!1181503 (= e!671727 true)))

(declare-fun e!671720 () Bool)

(assert (=> b!1181503 e!671720))

(declare-fun res!785143 () Bool)

(assert (=> b!1181503 (=> (not res!785143) (not e!671720))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1181503 (= res!785143 (not (= (select (arr!36814 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!39071 0))(
  ( (Unit!39072) )
))
(declare-fun lt!534419 () Unit!39071)

(declare-fun e!671722 () Unit!39071)

(assert (=> b!1181503 (= lt!534419 e!671722)))

(declare-fun c!116973 () Bool)

(assert (=> b!1181503 (= c!116973 (= (select (arr!36814 _keys!1208) from!1455) k0!934))))

(declare-fun e!671731 () Bool)

(assert (=> b!1181503 e!671731))

(declare-fun res!785147 () Bool)

(assert (=> b!1181503 (=> (not res!785147) (not e!671731))))

(declare-datatypes ((tuple2!19136 0))(
  ( (tuple2!19137 (_1!9579 (_ BitVec 64)) (_2!9579 V!44811)) )
))
(declare-datatypes ((List!25876 0))(
  ( (Nil!25873) (Cons!25872 (h!27081 tuple2!19136) (t!38101 List!25876)) )
))
(declare-datatypes ((ListLongMap!17105 0))(
  ( (ListLongMap!17106 (toList!8568 List!25876)) )
))
(declare-fun lt!534409 () ListLongMap!17105)

(declare-fun lt!534422 () tuple2!19136)

(declare-fun lt!534412 () ListLongMap!17105)

(declare-fun +!3876 (ListLongMap!17105 tuple2!19136) ListLongMap!17105)

(assert (=> b!1181503 (= res!785147 (= lt!534412 (+!3876 lt!534409 lt!534422)))))

(declare-fun lt!534423 () V!44811)

(declare-fun get!18828 (ValueCell!14172 V!44811) V!44811)

(assert (=> b!1181503 (= lt!534422 (tuple2!19137 (select (arr!36814 _keys!1208) from!1455) (get!18828 (select (arr!36815 _values!996) from!1455) lt!534423)))))

(declare-fun b!1181505 () Bool)

(declare-fun Unit!39073 () Unit!39071)

(assert (=> b!1181505 (= e!671722 Unit!39073)))

(declare-fun lt!534415 () Unit!39071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76329 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39071)

(assert (=> b!1181505 (= lt!534415 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181505 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534417 () Unit!39071)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76329 (_ BitVec 32) (_ BitVec 32)) Unit!39071)

(assert (=> b!1181505 (= lt!534417 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25877 0))(
  ( (Nil!25874) (Cons!25873 (h!27082 (_ BitVec 64)) (t!38102 List!25877)) )
))
(declare-fun arrayNoDuplicates!0 (array!76329 (_ BitVec 32) List!25877) Bool)

(assert (=> b!1181505 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25874)))

(declare-fun lt!534421 () Unit!39071)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76329 (_ BitVec 64) (_ BitVec 32) List!25877) Unit!39071)

(assert (=> b!1181505 (= lt!534421 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25874))))

(assert (=> b!1181505 false))

(declare-fun b!1181506 () Bool)

(declare-fun res!785136 () Bool)

(assert (=> b!1181506 (=> (not res!785136) (not e!671723))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181506 (= res!785136 (validMask!0 mask!1564))))

(declare-fun b!1181507 () Bool)

(declare-fun tp_is_empty!29763 () Bool)

(assert (=> b!1181507 (= e!671726 tp_is_empty!29763)))

(declare-fun b!1181508 () Bool)

(declare-fun res!785150 () Bool)

(assert (=> b!1181508 (=> (not res!785150) (not e!671723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181508 (= res!785150 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46472 () Bool)

(declare-fun tp!88413 () Bool)

(declare-fun e!671725 () Bool)

(assert (=> mapNonEmpty!46472 (= mapRes!46472 (and tp!88413 e!671725))))

(declare-fun mapKey!46472 () (_ BitVec 32))

(declare-fun mapValue!46472 () ValueCell!14172)

(declare-fun mapRest!46472 () (Array (_ BitVec 32) ValueCell!14172))

(assert (=> mapNonEmpty!46472 (= (arr!36815 _values!996) (store mapRest!46472 mapKey!46472 mapValue!46472))))

(declare-fun b!1181509 () Bool)

(declare-fun res!785142 () Bool)

(declare-fun e!671721 () Bool)

(assert (=> b!1181509 (=> (not res!785142) (not e!671721))))

(declare-fun lt!534416 () array!76329)

(assert (=> b!1181509 (= res!785142 (arrayNoDuplicates!0 lt!534416 #b00000000000000000000000000000000 Nil!25874))))

(declare-fun b!1181510 () Bool)

(declare-fun Unit!39074 () Unit!39071)

(assert (=> b!1181510 (= e!671722 Unit!39074)))

(declare-fun b!1181511 () Bool)

(declare-fun e!671719 () Bool)

(assert (=> b!1181511 (= e!671719 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181512 () Bool)

(declare-fun res!785152 () Bool)

(assert (=> b!1181512 (=> (not res!785152) (not e!671723))))

(assert (=> b!1181512 (= res!785152 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37350 _keys!1208))))))

(declare-fun mapIsEmpty!46472 () Bool)

(assert (=> mapIsEmpty!46472 mapRes!46472))

(declare-fun b!1181513 () Bool)

(assert (=> b!1181513 (= e!671723 e!671721)))

(declare-fun res!785144 () Bool)

(assert (=> b!1181513 (=> (not res!785144) (not e!671721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76329 (_ BitVec 32)) Bool)

(assert (=> b!1181513 (= res!785144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534416 mask!1564))))

(assert (=> b!1181513 (= lt!534416 (array!76330 (store (arr!36814 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37350 _keys!1208)))))

(declare-fun b!1181514 () Bool)

(declare-fun res!785139 () Bool)

(assert (=> b!1181514 (=> (not res!785139) (not e!671723))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1181514 (= res!785139 (and (= (size!37351 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37350 _keys!1208) (size!37351 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181515 () Bool)

(declare-fun lt!534411 () ListLongMap!17105)

(assert (=> b!1181515 (= e!671720 (= lt!534409 lt!534411))))

(declare-fun b!1181516 () Bool)

(declare-fun e!671730 () Bool)

(assert (=> b!1181516 (= e!671730 e!671727)))

(declare-fun res!785145 () Bool)

(assert (=> b!1181516 (=> res!785145 e!671727)))

(assert (=> b!1181516 (= res!785145 (not (validKeyInArray!0 (select (arr!36814 _keys!1208) from!1455))))))

(assert (=> b!1181516 (= lt!534411 lt!534409)))

(declare-fun lt!534420 () ListLongMap!17105)

(declare-fun -!1607 (ListLongMap!17105 (_ BitVec 64)) ListLongMap!17105)

(assert (=> b!1181516 (= lt!534409 (-!1607 lt!534420 k0!934))))

(declare-fun zeroValue!944 () V!44811)

(declare-fun lt!534418 () array!76331)

(declare-fun minValue!944 () V!44811)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5021 (array!76329 array!76331 (_ BitVec 32) (_ BitVec 32) V!44811 V!44811 (_ BitVec 32) Int) ListLongMap!17105)

(assert (=> b!1181516 (= lt!534411 (getCurrentListMapNoExtraKeys!5021 lt!534416 lt!534418 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181516 (= lt!534420 (getCurrentListMapNoExtraKeys!5021 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534410 () Unit!39071)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!834 (array!76329 array!76331 (_ BitVec 32) (_ BitVec 32) V!44811 V!44811 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39071)

(assert (=> b!1181516 (= lt!534410 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!834 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181517 () Bool)

(declare-fun res!785141 () Bool)

(assert (=> b!1181517 (=> (not res!785141) (not e!671723))))

(assert (=> b!1181517 (= res!785141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181518 () Bool)

(assert (=> b!1181518 (= e!671731 e!671719)))

(declare-fun res!785137 () Bool)

(assert (=> b!1181518 (=> res!785137 e!671719)))

(assert (=> b!1181518 (= res!785137 (not (= (select (arr!36814 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181519 () Bool)

(declare-fun res!785146 () Bool)

(assert (=> b!1181519 (=> (not res!785146) (not e!671723))))

(assert (=> b!1181519 (= res!785146 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25874))))

(declare-fun b!1181520 () Bool)

(declare-fun res!785151 () Bool)

(assert (=> b!1181520 (=> (not res!785151) (not e!671720))))

(declare-fun lt!534413 () ListLongMap!17105)

(assert (=> b!1181520 (= res!785151 (= lt!534413 (+!3876 lt!534420 lt!534422)))))

(declare-fun b!1181504 () Bool)

(declare-fun e!671728 () Bool)

(assert (=> b!1181504 (= e!671728 e!671730)))

(declare-fun res!785138 () Bool)

(assert (=> b!1181504 (=> res!785138 e!671730)))

(assert (=> b!1181504 (= res!785138 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1181504 (= lt!534412 (getCurrentListMapNoExtraKeys!5021 lt!534416 lt!534418 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1181504 (= lt!534418 (array!76332 (store (arr!36815 _values!996) i!673 (ValueCellFull!14172 lt!534423)) (size!37351 _values!996)))))

(declare-fun dynLambda!2976 (Int (_ BitVec 64)) V!44811)

(assert (=> b!1181504 (= lt!534423 (dynLambda!2976 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1181504 (= lt!534413 (getCurrentListMapNoExtraKeys!5021 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!785140 () Bool)

(assert (=> start!99654 (=> (not res!785140) (not e!671723))))

(assert (=> start!99654 (= res!785140 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37350 _keys!1208))))))

(assert (=> start!99654 e!671723))

(assert (=> start!99654 tp_is_empty!29763))

(declare-fun array_inv!28108 (array!76329) Bool)

(assert (=> start!99654 (array_inv!28108 _keys!1208)))

(assert (=> start!99654 true))

(assert (=> start!99654 tp!88412))

(declare-fun array_inv!28109 (array!76331) Bool)

(assert (=> start!99654 (and (array_inv!28109 _values!996) e!671724)))

(declare-fun b!1181521 () Bool)

(assert (=> b!1181521 (= e!671721 (not e!671728))))

(declare-fun res!785149 () Bool)

(assert (=> b!1181521 (=> res!785149 e!671728)))

(assert (=> b!1181521 (= res!785149 (bvsgt from!1455 i!673))))

(assert (=> b!1181521 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534414 () Unit!39071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76329 (_ BitVec 64) (_ BitVec 32)) Unit!39071)

(assert (=> b!1181521 (= lt!534414 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181522 () Bool)

(assert (=> b!1181522 (= e!671725 tp_is_empty!29763)))

(assert (= (and start!99654 res!785140) b!1181506))

(assert (= (and b!1181506 res!785136) b!1181514))

(assert (= (and b!1181514 res!785139) b!1181517))

(assert (= (and b!1181517 res!785141) b!1181519))

(assert (= (and b!1181519 res!785146) b!1181512))

(assert (= (and b!1181512 res!785152) b!1181508))

(assert (= (and b!1181508 res!785150) b!1181501))

(assert (= (and b!1181501 res!785148) b!1181513))

(assert (= (and b!1181513 res!785144) b!1181509))

(assert (= (and b!1181509 res!785142) b!1181521))

(assert (= (and b!1181521 (not res!785149)) b!1181504))

(assert (= (and b!1181504 (not res!785138)) b!1181516))

(assert (= (and b!1181516 (not res!785145)) b!1181503))

(assert (= (and b!1181503 res!785147) b!1181518))

(assert (= (and b!1181518 (not res!785137)) b!1181511))

(assert (= (and b!1181503 c!116973) b!1181505))

(assert (= (and b!1181503 (not c!116973)) b!1181510))

(assert (= (and b!1181503 res!785143) b!1181520))

(assert (= (and b!1181520 res!785151) b!1181515))

(assert (= (and b!1181502 condMapEmpty!46472) mapIsEmpty!46472))

(assert (= (and b!1181502 (not condMapEmpty!46472)) mapNonEmpty!46472))

(get-info :version)

(assert (= (and mapNonEmpty!46472 ((_ is ValueCellFull!14172) mapValue!46472)) b!1181522))

(assert (= (and b!1181502 ((_ is ValueCellFull!14172) mapDefault!46472)) b!1181507))

(assert (= start!99654 b!1181502))

(declare-fun b_lambda!20377 () Bool)

(assert (=> (not b_lambda!20377) (not b!1181504)))

(declare-fun t!38100 () Bool)

(declare-fun tb!10045 () Bool)

(assert (=> (and start!99654 (= defaultEntry!1004 defaultEntry!1004) t!38100) tb!10045))

(declare-fun result!20657 () Bool)

(assert (=> tb!10045 (= result!20657 tp_is_empty!29763)))

(assert (=> b!1181504 t!38100))

(declare-fun b_and!41335 () Bool)

(assert (= b_and!41333 (and (=> t!38100 result!20657) b_and!41335)))

(declare-fun m!1089423 () Bool)

(assert (=> b!1181511 m!1089423))

(declare-fun m!1089425 () Bool)

(assert (=> b!1181517 m!1089425))

(declare-fun m!1089427 () Bool)

(assert (=> b!1181503 m!1089427))

(declare-fun m!1089429 () Bool)

(assert (=> b!1181503 m!1089429))

(declare-fun m!1089431 () Bool)

(assert (=> b!1181503 m!1089431))

(assert (=> b!1181503 m!1089431))

(declare-fun m!1089433 () Bool)

(assert (=> b!1181503 m!1089433))

(declare-fun m!1089435 () Bool)

(assert (=> b!1181519 m!1089435))

(declare-fun m!1089437 () Bool)

(assert (=> b!1181501 m!1089437))

(declare-fun m!1089439 () Bool)

(assert (=> b!1181505 m!1089439))

(declare-fun m!1089441 () Bool)

(assert (=> b!1181505 m!1089441))

(declare-fun m!1089443 () Bool)

(assert (=> b!1181505 m!1089443))

(declare-fun m!1089445 () Bool)

(assert (=> b!1181505 m!1089445))

(declare-fun m!1089447 () Bool)

(assert (=> b!1181505 m!1089447))

(declare-fun m!1089449 () Bool)

(assert (=> b!1181509 m!1089449))

(declare-fun m!1089451 () Bool)

(assert (=> b!1181516 m!1089451))

(declare-fun m!1089453 () Bool)

(assert (=> b!1181516 m!1089453))

(declare-fun m!1089455 () Bool)

(assert (=> b!1181516 m!1089455))

(assert (=> b!1181516 m!1089427))

(declare-fun m!1089457 () Bool)

(assert (=> b!1181516 m!1089457))

(declare-fun m!1089459 () Bool)

(assert (=> b!1181516 m!1089459))

(assert (=> b!1181516 m!1089427))

(declare-fun m!1089461 () Bool)

(assert (=> b!1181508 m!1089461))

(assert (=> b!1181518 m!1089427))

(declare-fun m!1089463 () Bool)

(assert (=> b!1181504 m!1089463))

(declare-fun m!1089465 () Bool)

(assert (=> b!1181504 m!1089465))

(declare-fun m!1089467 () Bool)

(assert (=> b!1181504 m!1089467))

(declare-fun m!1089469 () Bool)

(assert (=> b!1181504 m!1089469))

(declare-fun m!1089471 () Bool)

(assert (=> b!1181520 m!1089471))

(declare-fun m!1089473 () Bool)

(assert (=> start!99654 m!1089473))

(declare-fun m!1089475 () Bool)

(assert (=> start!99654 m!1089475))

(declare-fun m!1089477 () Bool)

(assert (=> b!1181521 m!1089477))

(declare-fun m!1089479 () Bool)

(assert (=> b!1181521 m!1089479))

(declare-fun m!1089481 () Bool)

(assert (=> b!1181513 m!1089481))

(declare-fun m!1089483 () Bool)

(assert (=> b!1181513 m!1089483))

(declare-fun m!1089485 () Bool)

(assert (=> b!1181506 m!1089485))

(declare-fun m!1089487 () Bool)

(assert (=> mapNonEmpty!46472 m!1089487))

(check-sat (not b!1181511) (not b!1181503) b_and!41335 tp_is_empty!29763 (not b!1181521) (not b!1181509) (not b!1181516) (not b!1181520) (not b!1181504) (not mapNonEmpty!46472) (not b_next!25233) (not b!1181517) (not start!99654) (not b!1181508) (not b!1181513) (not b!1181519) (not b_lambda!20377) (not b!1181505) (not b!1181506))
(check-sat b_and!41335 (not b_next!25233))
