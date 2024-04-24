; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99630 () Bool)

(assert start!99630)

(declare-fun b_free!24973 () Bool)

(declare-fun b_next!24973 () Bool)

(assert (=> start!99630 (= b_free!24973 (not b_next!24973))))

(declare-fun tp!87633 () Bool)

(declare-fun b_and!40815 () Bool)

(assert (=> start!99630 (= tp!87633 b_and!40815)))

(declare-fun b!1174396 () Bool)

(declare-datatypes ((Unit!38669 0))(
  ( (Unit!38670) )
))
(declare-fun e!667623 () Unit!38669)

(declare-fun Unit!38671 () Unit!38669)

(assert (=> b!1174396 (= e!667623 Unit!38671)))

(declare-fun b!1174397 () Bool)

(declare-fun res!779461 () Bool)

(declare-fun e!667633 () Bool)

(assert (=> b!1174397 (=> (not res!779461) (not e!667633))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174397 (= res!779461 (validKeyInArray!0 k0!934))))

(declare-fun b!1174398 () Bool)

(declare-fun res!779472 () Bool)

(declare-fun e!667634 () Bool)

(assert (=> b!1174398 (=> (not res!779472) (not e!667634))))

(declare-datatypes ((array!75873 0))(
  ( (array!75874 (arr!36580 (Array (_ BitVec 32) (_ BitVec 64))) (size!37117 (_ BitVec 32))) )
))
(declare-fun lt!529188 () array!75873)

(declare-datatypes ((List!25695 0))(
  ( (Nil!25692) (Cons!25691 (h!26909 (_ BitVec 64)) (t!37652 List!25695)) )
))
(declare-fun arrayNoDuplicates!0 (array!75873 (_ BitVec 32) List!25695) Bool)

(assert (=> b!1174398 (= res!779472 (arrayNoDuplicates!0 lt!529188 #b00000000000000000000000000000000 Nil!25692))))

(declare-fun b!1174399 () Bool)

(declare-fun e!667624 () Bool)

(declare-fun tp_is_empty!29503 () Bool)

(assert (=> b!1174399 (= e!667624 tp_is_empty!29503)))

(declare-fun b!1174400 () Bool)

(declare-fun res!779467 () Bool)

(assert (=> b!1174400 (=> (not res!779467) (not e!667633))))

(declare-fun _keys!1208 () array!75873)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1174400 (= res!779467 (= (select (arr!36580 _keys!1208) i!673) k0!934))))

(declare-fun b!1174401 () Bool)

(declare-fun e!667625 () Bool)

(declare-fun e!667632 () Bool)

(assert (=> b!1174401 (= e!667625 e!667632)))

(declare-fun res!779465 () Bool)

(assert (=> b!1174401 (=> res!779465 e!667632)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174401 (= res!779465 (not (validKeyInArray!0 (select (arr!36580 _keys!1208) from!1455))))))

(declare-datatypes ((V!44465 0))(
  ( (V!44466 (val!14808 Int)) )
))
(declare-datatypes ((tuple2!18958 0))(
  ( (tuple2!18959 (_1!9490 (_ BitVec 64)) (_2!9490 V!44465)) )
))
(declare-datatypes ((List!25696 0))(
  ( (Nil!25693) (Cons!25692 (h!26910 tuple2!18958) (t!37653 List!25696)) )
))
(declare-datatypes ((ListLongMap!16935 0))(
  ( (ListLongMap!16936 (toList!8483 List!25696)) )
))
(declare-fun lt!529193 () ListLongMap!16935)

(declare-fun lt!529191 () ListLongMap!16935)

(assert (=> b!1174401 (= lt!529193 lt!529191)))

(declare-fun lt!529189 () ListLongMap!16935)

(declare-fun -!1533 (ListLongMap!16935 (_ BitVec 64)) ListLongMap!16935)

(assert (=> b!1174401 (= lt!529191 (-!1533 lt!529189 k0!934))))

(declare-fun zeroValue!944 () V!44465)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14042 0))(
  ( (ValueCellFull!14042 (v!17442 V!44465)) (EmptyCell!14042) )
))
(declare-datatypes ((array!75875 0))(
  ( (array!75876 (arr!36581 (Array (_ BitVec 32) ValueCell!14042)) (size!37118 (_ BitVec 32))) )
))
(declare-fun lt!529198 () array!75875)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44465)

(declare-fun getCurrentListMapNoExtraKeys!4969 (array!75873 array!75875 (_ BitVec 32) (_ BitVec 32) V!44465 V!44465 (_ BitVec 32) Int) ListLongMap!16935)

(assert (=> b!1174401 (= lt!529193 (getCurrentListMapNoExtraKeys!4969 lt!529188 lt!529198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75875)

(assert (=> b!1174401 (= lt!529189 (getCurrentListMapNoExtraKeys!4969 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529196 () Unit!38669)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!758 (array!75873 array!75875 (_ BitVec 32) (_ BitVec 32) V!44465 V!44465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38669)

(assert (=> b!1174401 (= lt!529196 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174403 () Bool)

(declare-fun res!779471 () Bool)

(assert (=> b!1174403 (=> (not res!779471) (not e!667633))))

(assert (=> b!1174403 (= res!779471 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37117 _keys!1208))))))

(declare-fun b!1174404 () Bool)

(assert (=> b!1174404 (= e!667632 true)))

(assert (=> b!1174404 (not (= (select (arr!36580 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529194 () Unit!38669)

(assert (=> b!1174404 (= lt!529194 e!667623)))

(declare-fun c!116981 () Bool)

(assert (=> b!1174404 (= c!116981 (= (select (arr!36580 _keys!1208) from!1455) k0!934))))

(declare-fun e!667627 () Bool)

(assert (=> b!1174404 e!667627))

(declare-fun res!779464 () Bool)

(assert (=> b!1174404 (=> (not res!779464) (not e!667627))))

(declare-fun lt!529185 () V!44465)

(declare-fun lt!529186 () ListLongMap!16935)

(declare-fun +!3816 (ListLongMap!16935 tuple2!18958) ListLongMap!16935)

(declare-fun get!18692 (ValueCell!14042 V!44465) V!44465)

(assert (=> b!1174404 (= res!779464 (= lt!529186 (+!3816 lt!529191 (tuple2!18959 (select (arr!36580 _keys!1208) from!1455) (get!18692 (select (arr!36581 _values!996) from!1455) lt!529185)))))))

(declare-fun mapIsEmpty!46082 () Bool)

(declare-fun mapRes!46082 () Bool)

(assert (=> mapIsEmpty!46082 mapRes!46082))

(declare-fun b!1174405 () Bool)

(declare-fun res!779462 () Bool)

(assert (=> b!1174405 (=> (not res!779462) (not e!667633))))

(assert (=> b!1174405 (= res!779462 (and (= (size!37118 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37117 _keys!1208) (size!37118 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174406 () Bool)

(declare-fun res!779466 () Bool)

(assert (=> b!1174406 (=> (not res!779466) (not e!667633))))

(assert (=> b!1174406 (= res!779466 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25692))))

(declare-fun b!1174407 () Bool)

(declare-fun res!779460 () Bool)

(assert (=> b!1174407 (=> (not res!779460) (not e!667633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75873 (_ BitVec 32)) Bool)

(assert (=> b!1174407 (= res!779460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174408 () Bool)

(declare-fun e!667630 () Bool)

(assert (=> b!1174408 (= e!667630 e!667625)))

(declare-fun res!779463 () Bool)

(assert (=> b!1174408 (=> res!779463 e!667625)))

(assert (=> b!1174408 (= res!779463 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1174408 (= lt!529186 (getCurrentListMapNoExtraKeys!4969 lt!529188 lt!529198 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174408 (= lt!529198 (array!75876 (store (arr!36581 _values!996) i!673 (ValueCellFull!14042 lt!529185)) (size!37118 _values!996)))))

(declare-fun dynLambda!2947 (Int (_ BitVec 64)) V!44465)

(assert (=> b!1174408 (= lt!529185 (dynLambda!2947 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529192 () ListLongMap!16935)

(assert (=> b!1174408 (= lt!529192 (getCurrentListMapNoExtraKeys!4969 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46082 () Bool)

(declare-fun tp!87632 () Bool)

(declare-fun e!667628 () Bool)

(assert (=> mapNonEmpty!46082 (= mapRes!46082 (and tp!87632 e!667628))))

(declare-fun mapValue!46082 () ValueCell!14042)

(declare-fun mapKey!46082 () (_ BitVec 32))

(declare-fun mapRest!46082 () (Array (_ BitVec 32) ValueCell!14042))

(assert (=> mapNonEmpty!46082 (= (arr!36581 _values!996) (store mapRest!46082 mapKey!46082 mapValue!46082))))

(declare-fun e!667629 () Bool)

(declare-fun b!1174409 () Bool)

(declare-fun arrayContainsKey!0 (array!75873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174409 (= e!667629 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174410 () Bool)

(assert (=> b!1174410 (= e!667634 (not e!667630))))

(declare-fun res!779469 () Bool)

(assert (=> b!1174410 (=> res!779469 e!667630)))

(assert (=> b!1174410 (= res!779469 (bvsgt from!1455 i!673))))

(assert (=> b!1174410 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529187 () Unit!38669)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75873 (_ BitVec 64) (_ BitVec 32)) Unit!38669)

(assert (=> b!1174410 (= lt!529187 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174402 () Bool)

(declare-fun e!667626 () Bool)

(assert (=> b!1174402 (= e!667626 (and e!667624 mapRes!46082))))

(declare-fun condMapEmpty!46082 () Bool)

(declare-fun mapDefault!46082 () ValueCell!14042)

(assert (=> b!1174402 (= condMapEmpty!46082 (= (arr!36581 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14042)) mapDefault!46082)))))

(declare-fun res!779468 () Bool)

(assert (=> start!99630 (=> (not res!779468) (not e!667633))))

(assert (=> start!99630 (= res!779468 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37117 _keys!1208))))))

(assert (=> start!99630 e!667633))

(assert (=> start!99630 tp_is_empty!29503))

(declare-fun array_inv!28028 (array!75873) Bool)

(assert (=> start!99630 (array_inv!28028 _keys!1208)))

(assert (=> start!99630 true))

(assert (=> start!99630 tp!87633))

(declare-fun array_inv!28029 (array!75875) Bool)

(assert (=> start!99630 (and (array_inv!28029 _values!996) e!667626)))

(declare-fun b!1174411 () Bool)

(assert (=> b!1174411 (= e!667633 e!667634)))

(declare-fun res!779470 () Bool)

(assert (=> b!1174411 (=> (not res!779470) (not e!667634))))

(assert (=> b!1174411 (= res!779470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529188 mask!1564))))

(assert (=> b!1174411 (= lt!529188 (array!75874 (store (arr!36580 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37117 _keys!1208)))))

(declare-fun b!1174412 () Bool)

(assert (=> b!1174412 (= e!667627 e!667629)))

(declare-fun res!779473 () Bool)

(assert (=> b!1174412 (=> res!779473 e!667629)))

(assert (=> b!1174412 (= res!779473 (not (= (select (arr!36580 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174413 () Bool)

(declare-fun Unit!38672 () Unit!38669)

(assert (=> b!1174413 (= e!667623 Unit!38672)))

(declare-fun lt!529195 () Unit!38669)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75873 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38669)

(assert (=> b!1174413 (= lt!529195 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1174413 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529190 () Unit!38669)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75873 (_ BitVec 32) (_ BitVec 32)) Unit!38669)

(assert (=> b!1174413 (= lt!529190 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174413 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25692)))

(declare-fun lt!529197 () Unit!38669)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75873 (_ BitVec 64) (_ BitVec 32) List!25695) Unit!38669)

(assert (=> b!1174413 (= lt!529197 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25692))))

(assert (=> b!1174413 false))

(declare-fun b!1174414 () Bool)

(assert (=> b!1174414 (= e!667628 tp_is_empty!29503)))

(declare-fun b!1174415 () Bool)

(declare-fun res!779474 () Bool)

(assert (=> b!1174415 (=> (not res!779474) (not e!667633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174415 (= res!779474 (validMask!0 mask!1564))))

(assert (= (and start!99630 res!779468) b!1174415))

(assert (= (and b!1174415 res!779474) b!1174405))

(assert (= (and b!1174405 res!779462) b!1174407))

(assert (= (and b!1174407 res!779460) b!1174406))

(assert (= (and b!1174406 res!779466) b!1174403))

(assert (= (and b!1174403 res!779471) b!1174397))

(assert (= (and b!1174397 res!779461) b!1174400))

(assert (= (and b!1174400 res!779467) b!1174411))

(assert (= (and b!1174411 res!779470) b!1174398))

(assert (= (and b!1174398 res!779472) b!1174410))

(assert (= (and b!1174410 (not res!779469)) b!1174408))

(assert (= (and b!1174408 (not res!779463)) b!1174401))

(assert (= (and b!1174401 (not res!779465)) b!1174404))

(assert (= (and b!1174404 res!779464) b!1174412))

(assert (= (and b!1174412 (not res!779473)) b!1174409))

(assert (= (and b!1174404 c!116981) b!1174413))

(assert (= (and b!1174404 (not c!116981)) b!1174396))

(assert (= (and b!1174402 condMapEmpty!46082) mapIsEmpty!46082))

(assert (= (and b!1174402 (not condMapEmpty!46082)) mapNonEmpty!46082))

(get-info :version)

(assert (= (and mapNonEmpty!46082 ((_ is ValueCellFull!14042) mapValue!46082)) b!1174414))

(assert (= (and b!1174402 ((_ is ValueCellFull!14042) mapDefault!46082)) b!1174399))

(assert (= start!99630 b!1174402))

(declare-fun b_lambda!20111 () Bool)

(assert (=> (not b_lambda!20111) (not b!1174408)))

(declare-fun t!37651 () Bool)

(declare-fun tb!9777 () Bool)

(assert (=> (and start!99630 (= defaultEntry!1004 defaultEntry!1004) t!37651) tb!9777))

(declare-fun result!20129 () Bool)

(assert (=> tb!9777 (= result!20129 tp_is_empty!29503)))

(assert (=> b!1174408 t!37651))

(declare-fun b_and!40817 () Bool)

(assert (= b_and!40815 (and (=> t!37651 result!20129) b_and!40817)))

(declare-fun m!1082511 () Bool)

(assert (=> b!1174400 m!1082511))

(declare-fun m!1082513 () Bool)

(assert (=> b!1174397 m!1082513))

(declare-fun m!1082515 () Bool)

(assert (=> b!1174411 m!1082515))

(declare-fun m!1082517 () Bool)

(assert (=> b!1174411 m!1082517))

(declare-fun m!1082519 () Bool)

(assert (=> b!1174398 m!1082519))

(declare-fun m!1082521 () Bool)

(assert (=> start!99630 m!1082521))

(declare-fun m!1082523 () Bool)

(assert (=> start!99630 m!1082523))

(declare-fun m!1082525 () Bool)

(assert (=> b!1174413 m!1082525))

(declare-fun m!1082527 () Bool)

(assert (=> b!1174413 m!1082527))

(declare-fun m!1082529 () Bool)

(assert (=> b!1174413 m!1082529))

(declare-fun m!1082531 () Bool)

(assert (=> b!1174413 m!1082531))

(declare-fun m!1082533 () Bool)

(assert (=> b!1174413 m!1082533))

(declare-fun m!1082535 () Bool)

(assert (=> b!1174412 m!1082535))

(declare-fun m!1082537 () Bool)

(assert (=> b!1174401 m!1082537))

(declare-fun m!1082539 () Bool)

(assert (=> b!1174401 m!1082539))

(declare-fun m!1082541 () Bool)

(assert (=> b!1174401 m!1082541))

(declare-fun m!1082543 () Bool)

(assert (=> b!1174401 m!1082543))

(assert (=> b!1174401 m!1082535))

(declare-fun m!1082545 () Bool)

(assert (=> b!1174401 m!1082545))

(assert (=> b!1174401 m!1082535))

(declare-fun m!1082547 () Bool)

(assert (=> b!1174409 m!1082547))

(declare-fun m!1082549 () Bool)

(assert (=> b!1174410 m!1082549))

(declare-fun m!1082551 () Bool)

(assert (=> b!1174410 m!1082551))

(declare-fun m!1082553 () Bool)

(assert (=> b!1174415 m!1082553))

(assert (=> b!1174404 m!1082535))

(declare-fun m!1082555 () Bool)

(assert (=> b!1174404 m!1082555))

(assert (=> b!1174404 m!1082555))

(declare-fun m!1082557 () Bool)

(assert (=> b!1174404 m!1082557))

(declare-fun m!1082559 () Bool)

(assert (=> b!1174404 m!1082559))

(declare-fun m!1082561 () Bool)

(assert (=> mapNonEmpty!46082 m!1082561))

(declare-fun m!1082563 () Bool)

(assert (=> b!1174406 m!1082563))

(declare-fun m!1082565 () Bool)

(assert (=> b!1174407 m!1082565))

(declare-fun m!1082567 () Bool)

(assert (=> b!1174408 m!1082567))

(declare-fun m!1082569 () Bool)

(assert (=> b!1174408 m!1082569))

(declare-fun m!1082571 () Bool)

(assert (=> b!1174408 m!1082571))

(declare-fun m!1082573 () Bool)

(assert (=> b!1174408 m!1082573))

(check-sat (not b!1174398) (not start!99630) (not b!1174401) (not b_lambda!20111) (not b!1174397) tp_is_empty!29503 (not b!1174409) (not b!1174415) (not b!1174406) (not b!1174404) (not mapNonEmpty!46082) (not b!1174410) (not b!1174408) (not b!1174407) (not b!1174413) (not b_next!24973) (not b!1174411) b_and!40817)
(check-sat b_and!40817 (not b_next!24973))
