; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99808 () Bool)

(assert start!99808)

(declare-fun b_free!25393 () Bool)

(declare-fun b_next!25393 () Bool)

(assert (=> start!99808 (= b_free!25393 (not b_next!25393))))

(declare-fun tp!88892 () Bool)

(declare-fun b_and!41631 () Bool)

(assert (=> start!99808 (= tp!88892 b_and!41631)))

(declare-fun mapIsEmpty!46712 () Bool)

(declare-fun mapRes!46712 () Bool)

(assert (=> mapIsEmpty!46712 mapRes!46712))

(declare-fun b!1186345 () Bool)

(declare-fun res!788679 () Bool)

(declare-fun e!674529 () Bool)

(assert (=> b!1186345 (=> (not res!788679) (not e!674529))))

(declare-datatypes ((array!76580 0))(
  ( (array!76581 (arr!36940 (Array (_ BitVec 32) (_ BitVec 64))) (size!37478 (_ BitVec 32))) )
))
(declare-fun lt!538762 () array!76580)

(declare-datatypes ((List!26098 0))(
  ( (Nil!26095) (Cons!26094 (h!27303 (_ BitVec 64)) (t!38474 List!26098)) )
))
(declare-fun arrayNoDuplicates!0 (array!76580 (_ BitVec 32) List!26098) Bool)

(assert (=> b!1186345 (= res!788679 (arrayNoDuplicates!0 lt!538762 #b00000000000000000000000000000000 Nil!26095))))

(declare-fun b!1186346 () Bool)

(declare-fun res!788686 () Bool)

(declare-fun e!674530 () Bool)

(assert (=> b!1186346 (=> (not res!788686) (not e!674530))))

(declare-fun _keys!1208 () array!76580)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1186346 (= res!788686 (= (select (arr!36940 _keys!1208) i!673) k0!934))))

(declare-fun b!1186347 () Bool)

(declare-fun res!788683 () Bool)

(assert (=> b!1186347 (=> (not res!788683) (not e!674530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186347 (= res!788683 (validKeyInArray!0 k0!934))))

(declare-fun b!1186348 () Bool)

(declare-fun e!674536 () Bool)

(declare-fun e!674528 () Bool)

(assert (=> b!1186348 (= e!674536 e!674528)))

(declare-fun res!788689 () Bool)

(assert (=> b!1186348 (=> res!788689 e!674528)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1186348 (= res!788689 (not (validKeyInArray!0 (select (arr!36940 _keys!1208) from!1455))))))

(declare-datatypes ((V!45025 0))(
  ( (V!45026 (val!15018 Int)) )
))
(declare-datatypes ((tuple2!19384 0))(
  ( (tuple2!19385 (_1!9703 (_ BitVec 64)) (_2!9703 V!45025)) )
))
(declare-datatypes ((List!26099 0))(
  ( (Nil!26096) (Cons!26095 (h!27304 tuple2!19384) (t!38475 List!26099)) )
))
(declare-datatypes ((ListLongMap!17353 0))(
  ( (ListLongMap!17354 (toList!8692 List!26099)) )
))
(declare-fun lt!538778 () ListLongMap!17353)

(declare-fun lt!538765 () ListLongMap!17353)

(assert (=> b!1186348 (= lt!538778 lt!538765)))

(declare-fun lt!538766 () ListLongMap!17353)

(declare-fun -!1643 (ListLongMap!17353 (_ BitVec 64)) ListLongMap!17353)

(assert (=> b!1186348 (= lt!538765 (-!1643 lt!538766 k0!934))))

(declare-fun zeroValue!944 () V!45025)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14252 0))(
  ( (ValueCellFull!14252 (v!17655 V!45025)) (EmptyCell!14252) )
))
(declare-datatypes ((array!76582 0))(
  ( (array!76583 (arr!36941 (Array (_ BitVec 32) ValueCell!14252)) (size!37479 (_ BitVec 32))) )
))
(declare-fun lt!538772 () array!76582)

(declare-fun minValue!944 () V!45025)

(declare-fun getCurrentListMapNoExtraKeys!5144 (array!76580 array!76582 (_ BitVec 32) (_ BitVec 32) V!45025 V!45025 (_ BitVec 32) Int) ListLongMap!17353)

(assert (=> b!1186348 (= lt!538778 (getCurrentListMapNoExtraKeys!5144 lt!538762 lt!538772 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76582)

(assert (=> b!1186348 (= lt!538766 (getCurrentListMapNoExtraKeys!5144 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39199 0))(
  ( (Unit!39200) )
))
(declare-fun lt!538763 () Unit!39199)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!899 (array!76580 array!76582 (_ BitVec 32) (_ BitVec 32) V!45025 V!45025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39199)

(assert (=> b!1186348 (= lt!538763 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!899 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186349 () Bool)

(declare-fun res!788692 () Bool)

(assert (=> b!1186349 (=> (not res!788692) (not e!674530))))

(assert (=> b!1186349 (= res!788692 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26095))))

(declare-fun b!1186350 () Bool)

(declare-fun e!674531 () Bool)

(assert (=> b!1186350 (= e!674529 (not e!674531))))

(declare-fun res!788682 () Bool)

(assert (=> b!1186350 (=> res!788682 e!674531)))

(assert (=> b!1186350 (= res!788682 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186350 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538761 () Unit!39199)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76580 (_ BitVec 64) (_ BitVec 32)) Unit!39199)

(assert (=> b!1186350 (= lt!538761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186351 () Bool)

(declare-fun e!674533 () Bool)

(declare-fun e!674527 () Bool)

(assert (=> b!1186351 (= e!674533 e!674527)))

(declare-fun res!788678 () Bool)

(assert (=> b!1186351 (=> res!788678 e!674527)))

(assert (=> b!1186351 (= res!788678 (not (= (select (arr!36940 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186352 () Bool)

(assert (=> b!1186352 (= e!674527 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186353 () Bool)

(assert (=> b!1186353 (= e!674530 e!674529)))

(declare-fun res!788680 () Bool)

(assert (=> b!1186353 (=> (not res!788680) (not e!674529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76580 (_ BitVec 32)) Bool)

(assert (=> b!1186353 (= res!788680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538762 mask!1564))))

(assert (=> b!1186353 (= lt!538762 (array!76581 (store (arr!36940 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37478 _keys!1208)))))

(declare-fun b!1186354 () Bool)

(declare-fun e!674525 () Bool)

(declare-fun tp_is_empty!29923 () Bool)

(assert (=> b!1186354 (= e!674525 tp_is_empty!29923)))

(declare-fun b!1186355 () Bool)

(declare-fun e!674532 () Unit!39199)

(declare-fun Unit!39201 () Unit!39199)

(assert (=> b!1186355 (= e!674532 Unit!39201)))

(declare-fun b!1186356 () Bool)

(declare-fun res!788681 () Bool)

(assert (=> b!1186356 (=> (not res!788681) (not e!674530))))

(assert (=> b!1186356 (= res!788681 (and (= (size!37479 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37478 _keys!1208) (size!37479 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186357 () Bool)

(declare-fun e!674526 () Bool)

(assert (=> b!1186357 (= e!674526 (and e!674525 mapRes!46712))))

(declare-fun condMapEmpty!46712 () Bool)

(declare-fun mapDefault!46712 () ValueCell!14252)

(assert (=> b!1186357 (= condMapEmpty!46712 (= (arr!36941 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14252)) mapDefault!46712)))))

(declare-fun b!1186358 () Bool)

(declare-fun res!788691 () Bool)

(assert (=> b!1186358 (=> (not res!788691) (not e!674530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186358 (= res!788691 (validMask!0 mask!1564))))

(declare-fun b!1186359 () Bool)

(declare-fun e!674534 () Bool)

(assert (=> b!1186359 (= e!674534 tp_is_empty!29923)))

(declare-fun b!1186360 () Bool)

(declare-fun Unit!39202 () Unit!39199)

(assert (=> b!1186360 (= e!674532 Unit!39202)))

(declare-fun lt!538768 () Unit!39199)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39199)

(assert (=> b!1186360 (= lt!538768 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186360 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538764 () Unit!39199)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76580 (_ BitVec 32) (_ BitVec 32)) Unit!39199)

(assert (=> b!1186360 (= lt!538764 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186360 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26095)))

(declare-fun lt!538779 () Unit!39199)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76580 (_ BitVec 64) (_ BitVec 32) List!26098) Unit!39199)

(assert (=> b!1186360 (= lt!538779 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26095))))

(assert (=> b!1186360 false))

(declare-fun b!1186361 () Bool)

(assert (=> b!1186361 (= e!674528 true)))

(declare-fun lt!538774 () ListLongMap!17353)

(declare-fun lt!538767 () ListLongMap!17353)

(assert (=> b!1186361 (= (-!1643 lt!538774 k0!934) lt!538767)))

(declare-fun lt!538777 () V!45025)

(declare-fun lt!538775 () Unit!39199)

(declare-fun addRemoveCommutativeForDiffKeys!186 (ListLongMap!17353 (_ BitVec 64) V!45025 (_ BitVec 64)) Unit!39199)

(assert (=> b!1186361 (= lt!538775 (addRemoveCommutativeForDiffKeys!186 lt!538766 (select (arr!36940 _keys!1208) from!1455) lt!538777 k0!934))))

(declare-fun lt!538771 () ListLongMap!17353)

(assert (=> b!1186361 (and (= lt!538771 lt!538774) (= lt!538765 lt!538778))))

(declare-fun lt!538769 () tuple2!19384)

(declare-fun +!3972 (ListLongMap!17353 tuple2!19384) ListLongMap!17353)

(assert (=> b!1186361 (= lt!538774 (+!3972 lt!538766 lt!538769))))

(assert (=> b!1186361 (not (= (select (arr!36940 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538773 () Unit!39199)

(assert (=> b!1186361 (= lt!538773 e!674532)))

(declare-fun c!117187 () Bool)

(assert (=> b!1186361 (= c!117187 (= (select (arr!36940 _keys!1208) from!1455) k0!934))))

(assert (=> b!1186361 e!674533))

(declare-fun res!788688 () Bool)

(assert (=> b!1186361 (=> (not res!788688) (not e!674533))))

(declare-fun lt!538770 () ListLongMap!17353)

(assert (=> b!1186361 (= res!788688 (= lt!538770 lt!538767))))

(assert (=> b!1186361 (= lt!538767 (+!3972 lt!538765 lt!538769))))

(assert (=> b!1186361 (= lt!538769 (tuple2!19385 (select (arr!36940 _keys!1208) from!1455) lt!538777))))

(declare-fun lt!538776 () V!45025)

(declare-fun get!18925 (ValueCell!14252 V!45025) V!45025)

(assert (=> b!1186361 (= lt!538777 (get!18925 (select (arr!36941 _values!996) from!1455) lt!538776))))

(declare-fun b!1186362 () Bool)

(declare-fun res!788685 () Bool)

(assert (=> b!1186362 (=> (not res!788685) (not e!674530))))

(assert (=> b!1186362 (= res!788685 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37478 _keys!1208))))))

(declare-fun b!1186363 () Bool)

(assert (=> b!1186363 (= e!674531 e!674536)))

(declare-fun res!788687 () Bool)

(assert (=> b!1186363 (=> res!788687 e!674536)))

(assert (=> b!1186363 (= res!788687 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1186363 (= lt!538770 (getCurrentListMapNoExtraKeys!5144 lt!538762 lt!538772 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1186363 (= lt!538772 (array!76583 (store (arr!36941 _values!996) i!673 (ValueCellFull!14252 lt!538776)) (size!37479 _values!996)))))

(declare-fun dynLambda!3044 (Int (_ BitVec 64)) V!45025)

(assert (=> b!1186363 (= lt!538776 (dynLambda!3044 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1186363 (= lt!538771 (getCurrentListMapNoExtraKeys!5144 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!788684 () Bool)

(assert (=> start!99808 (=> (not res!788684) (not e!674530))))

(assert (=> start!99808 (= res!788684 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37478 _keys!1208))))))

(assert (=> start!99808 e!674530))

(assert (=> start!99808 tp_is_empty!29923))

(declare-fun array_inv!28300 (array!76580) Bool)

(assert (=> start!99808 (array_inv!28300 _keys!1208)))

(assert (=> start!99808 true))

(assert (=> start!99808 tp!88892))

(declare-fun array_inv!28301 (array!76582) Bool)

(assert (=> start!99808 (and (array_inv!28301 _values!996) e!674526)))

(declare-fun b!1186364 () Bool)

(declare-fun res!788690 () Bool)

(assert (=> b!1186364 (=> (not res!788690) (not e!674530))))

(assert (=> b!1186364 (= res!788690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46712 () Bool)

(declare-fun tp!88893 () Bool)

(assert (=> mapNonEmpty!46712 (= mapRes!46712 (and tp!88893 e!674534))))

(declare-fun mapRest!46712 () (Array (_ BitVec 32) ValueCell!14252))

(declare-fun mapValue!46712 () ValueCell!14252)

(declare-fun mapKey!46712 () (_ BitVec 32))

(assert (=> mapNonEmpty!46712 (= (arr!36941 _values!996) (store mapRest!46712 mapKey!46712 mapValue!46712))))

(assert (= (and start!99808 res!788684) b!1186358))

(assert (= (and b!1186358 res!788691) b!1186356))

(assert (= (and b!1186356 res!788681) b!1186364))

(assert (= (and b!1186364 res!788690) b!1186349))

(assert (= (and b!1186349 res!788692) b!1186362))

(assert (= (and b!1186362 res!788685) b!1186347))

(assert (= (and b!1186347 res!788683) b!1186346))

(assert (= (and b!1186346 res!788686) b!1186353))

(assert (= (and b!1186353 res!788680) b!1186345))

(assert (= (and b!1186345 res!788679) b!1186350))

(assert (= (and b!1186350 (not res!788682)) b!1186363))

(assert (= (and b!1186363 (not res!788687)) b!1186348))

(assert (= (and b!1186348 (not res!788689)) b!1186361))

(assert (= (and b!1186361 res!788688) b!1186351))

(assert (= (and b!1186351 (not res!788678)) b!1186352))

(assert (= (and b!1186361 c!117187) b!1186360))

(assert (= (and b!1186361 (not c!117187)) b!1186355))

(assert (= (and b!1186357 condMapEmpty!46712) mapIsEmpty!46712))

(assert (= (and b!1186357 (not condMapEmpty!46712)) mapNonEmpty!46712))

(get-info :version)

(assert (= (and mapNonEmpty!46712 ((_ is ValueCellFull!14252) mapValue!46712)) b!1186359))

(assert (= (and b!1186357 ((_ is ValueCellFull!14252) mapDefault!46712)) b!1186354))

(assert (= start!99808 b!1186357))

(declare-fun b_lambda!20519 () Bool)

(assert (=> (not b_lambda!20519) (not b!1186363)))

(declare-fun t!38473 () Bool)

(declare-fun tb!10197 () Bool)

(assert (=> (and start!99808 (= defaultEntry!1004 defaultEntry!1004) t!38473) tb!10197))

(declare-fun result!20969 () Bool)

(assert (=> tb!10197 (= result!20969 tp_is_empty!29923)))

(assert (=> b!1186363 t!38473))

(declare-fun b_and!41633 () Bool)

(assert (= b_and!41631 (and (=> t!38473 result!20969) b_and!41633)))

(declare-fun m!1094405 () Bool)

(assert (=> b!1186363 m!1094405))

(declare-fun m!1094407 () Bool)

(assert (=> b!1186363 m!1094407))

(declare-fun m!1094409 () Bool)

(assert (=> b!1186363 m!1094409))

(declare-fun m!1094411 () Bool)

(assert (=> b!1186363 m!1094411))

(declare-fun m!1094413 () Bool)

(assert (=> mapNonEmpty!46712 m!1094413))

(declare-fun m!1094415 () Bool)

(assert (=> b!1186361 m!1094415))

(assert (=> b!1186361 m!1094415))

(declare-fun m!1094417 () Bool)

(assert (=> b!1186361 m!1094417))

(declare-fun m!1094419 () Bool)

(assert (=> b!1186361 m!1094419))

(declare-fun m!1094421 () Bool)

(assert (=> b!1186361 m!1094421))

(declare-fun m!1094423 () Bool)

(assert (=> b!1186361 m!1094423))

(assert (=> b!1186361 m!1094419))

(declare-fun m!1094425 () Bool)

(assert (=> b!1186361 m!1094425))

(declare-fun m!1094427 () Bool)

(assert (=> b!1186361 m!1094427))

(declare-fun m!1094429 () Bool)

(assert (=> b!1186360 m!1094429))

(declare-fun m!1094431 () Bool)

(assert (=> b!1186360 m!1094431))

(declare-fun m!1094433 () Bool)

(assert (=> b!1186360 m!1094433))

(declare-fun m!1094435 () Bool)

(assert (=> b!1186360 m!1094435))

(declare-fun m!1094437 () Bool)

(assert (=> b!1186360 m!1094437))

(assert (=> b!1186351 m!1094419))

(declare-fun m!1094439 () Bool)

(assert (=> b!1186353 m!1094439))

(declare-fun m!1094441 () Bool)

(assert (=> b!1186353 m!1094441))

(declare-fun m!1094443 () Bool)

(assert (=> b!1186349 m!1094443))

(declare-fun m!1094445 () Bool)

(assert (=> start!99808 m!1094445))

(declare-fun m!1094447 () Bool)

(assert (=> start!99808 m!1094447))

(declare-fun m!1094449 () Bool)

(assert (=> b!1186345 m!1094449))

(declare-fun m!1094451 () Bool)

(assert (=> b!1186347 m!1094451))

(declare-fun m!1094453 () Bool)

(assert (=> b!1186358 m!1094453))

(declare-fun m!1094455 () Bool)

(assert (=> b!1186364 m!1094455))

(declare-fun m!1094457 () Bool)

(assert (=> b!1186352 m!1094457))

(declare-fun m!1094459 () Bool)

(assert (=> b!1186346 m!1094459))

(declare-fun m!1094461 () Bool)

(assert (=> b!1186350 m!1094461))

(declare-fun m!1094463 () Bool)

(assert (=> b!1186350 m!1094463))

(declare-fun m!1094465 () Bool)

(assert (=> b!1186348 m!1094465))

(declare-fun m!1094467 () Bool)

(assert (=> b!1186348 m!1094467))

(declare-fun m!1094469 () Bool)

(assert (=> b!1186348 m!1094469))

(assert (=> b!1186348 m!1094419))

(declare-fun m!1094471 () Bool)

(assert (=> b!1186348 m!1094471))

(declare-fun m!1094473 () Bool)

(assert (=> b!1186348 m!1094473))

(assert (=> b!1186348 m!1094419))

(check-sat (not b_lambda!20519) (not b!1186364) (not b!1186347) (not b!1186360) (not b!1186363) (not b!1186350) (not b_next!25393) (not b!1186352) (not b!1186348) (not b!1186361) (not b!1186349) (not b!1186353) (not start!99808) tp_is_empty!29923 (not b!1186358) b_and!41633 (not mapNonEmpty!46712) (not b!1186345))
(check-sat b_and!41633 (not b_next!25393))
