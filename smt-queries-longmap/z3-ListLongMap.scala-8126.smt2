; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99624 () Bool)

(assert start!99624)

(declare-fun b_free!25203 () Bool)

(declare-fun b_next!25203 () Bool)

(assert (=> start!99624 (= b_free!25203 (not b_next!25203))))

(declare-fun tp!88322 () Bool)

(declare-fun b_and!41273 () Bool)

(assert (=> start!99624 (= tp!88322 b_and!41273)))

(declare-fun b!1180481 () Bool)

(declare-datatypes ((Unit!39023 0))(
  ( (Unit!39024) )
))
(declare-fun e!671142 () Unit!39023)

(declare-fun Unit!39025 () Unit!39023)

(assert (=> b!1180481 (= e!671142 Unit!39025)))

(declare-fun b!1180482 () Bool)

(declare-fun e!671140 () Bool)

(declare-fun tp_is_empty!29733 () Bool)

(assert (=> b!1180482 (= e!671140 tp_is_empty!29733)))

(declare-fun b!1180483 () Bool)

(declare-fun res!784384 () Bool)

(declare-fun e!671145 () Bool)

(assert (=> b!1180483 (=> (not res!784384) (not e!671145))))

(declare-datatypes ((array!76269 0))(
  ( (array!76270 (arr!36784 (Array (_ BitVec 32) (_ BitVec 64))) (size!37320 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76269)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76269 (_ BitVec 32)) Bool)

(assert (=> b!1180483 (= res!784384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!784374 () Bool)

(assert (=> start!99624 (=> (not res!784374) (not e!671145))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99624 (= res!784374 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37320 _keys!1208))))))

(assert (=> start!99624 e!671145))

(assert (=> start!99624 tp_is_empty!29733))

(declare-fun array_inv!28086 (array!76269) Bool)

(assert (=> start!99624 (array_inv!28086 _keys!1208)))

(assert (=> start!99624 true))

(assert (=> start!99624 tp!88322))

(declare-datatypes ((V!44771 0))(
  ( (V!44772 (val!14923 Int)) )
))
(declare-datatypes ((ValueCell!14157 0))(
  ( (ValueCellFull!14157 (v!17561 V!44771)) (EmptyCell!14157) )
))
(declare-datatypes ((array!76271 0))(
  ( (array!76272 (arr!36785 (Array (_ BitVec 32) ValueCell!14157)) (size!37321 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76271)

(declare-fun e!671146 () Bool)

(declare-fun array_inv!28087 (array!76271) Bool)

(assert (=> start!99624 (and (array_inv!28087 _values!996) e!671146)))

(declare-fun mapIsEmpty!46427 () Bool)

(declare-fun mapRes!46427 () Bool)

(assert (=> mapIsEmpty!46427 mapRes!46427))

(declare-fun b!1180484 () Bool)

(declare-fun Unit!39026 () Unit!39023)

(assert (=> b!1180484 (= e!671142 Unit!39026)))

(declare-fun lt!533736 () Unit!39023)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76269 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39023)

(assert (=> b!1180484 (= lt!533736 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180484 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533734 () Unit!39023)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76269 (_ BitVec 32) (_ BitVec 32)) Unit!39023)

(assert (=> b!1180484 (= lt!533734 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25850 0))(
  ( (Nil!25847) (Cons!25846 (h!27055 (_ BitVec 64)) (t!38045 List!25850)) )
))
(declare-fun arrayNoDuplicates!0 (array!76269 (_ BitVec 32) List!25850) Bool)

(assert (=> b!1180484 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25847)))

(declare-fun lt!533748 () Unit!39023)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76269 (_ BitVec 64) (_ BitVec 32) List!25850) Unit!39023)

(assert (=> b!1180484 (= lt!533748 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25847))))

(assert (=> b!1180484 false))

(declare-fun mapNonEmpty!46427 () Bool)

(declare-fun tp!88323 () Bool)

(declare-fun e!671144 () Bool)

(assert (=> mapNonEmpty!46427 (= mapRes!46427 (and tp!88323 e!671144))))

(declare-fun mapValue!46427 () ValueCell!14157)

(declare-fun mapKey!46427 () (_ BitVec 32))

(declare-fun mapRest!46427 () (Array (_ BitVec 32) ValueCell!14157))

(assert (=> mapNonEmpty!46427 (= (arr!36785 _values!996) (store mapRest!46427 mapKey!46427 mapValue!46427))))

(declare-fun b!1180485 () Bool)

(declare-fun res!784381 () Bool)

(assert (=> b!1180485 (=> (not res!784381) (not e!671145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180485 (= res!784381 (validKeyInArray!0 k0!934))))

(declare-fun b!1180486 () Bool)

(declare-fun e!671143 () Bool)

(declare-datatypes ((tuple2!19112 0))(
  ( (tuple2!19113 (_1!9567 (_ BitVec 64)) (_2!9567 V!44771)) )
))
(declare-datatypes ((List!25851 0))(
  ( (Nil!25848) (Cons!25847 (h!27056 tuple2!19112) (t!38046 List!25851)) )
))
(declare-datatypes ((ListLongMap!17081 0))(
  ( (ListLongMap!17082 (toList!8556 List!25851)) )
))
(declare-fun lt!533743 () ListLongMap!17081)

(declare-fun lt!533740 () ListLongMap!17081)

(assert (=> b!1180486 (= e!671143 (= lt!533743 lt!533740))))

(declare-fun b!1180487 () Bool)

(declare-fun res!784372 () Bool)

(assert (=> b!1180487 (=> (not res!784372) (not e!671145))))

(assert (=> b!1180487 (= res!784372 (= (select (arr!36784 _keys!1208) i!673) k0!934))))

(declare-fun b!1180488 () Bool)

(declare-fun res!784387 () Bool)

(assert (=> b!1180488 (=> (not res!784387) (not e!671145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180488 (= res!784387 (validMask!0 mask!1564))))

(declare-fun b!1180489 () Bool)

(declare-fun e!671135 () Bool)

(assert (=> b!1180489 (= e!671135 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180490 () Bool)

(declare-fun res!784383 () Bool)

(assert (=> b!1180490 (=> (not res!784383) (not e!671145))))

(assert (=> b!1180490 (= res!784383 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25847))))

(declare-fun b!1180491 () Bool)

(declare-fun res!784375 () Bool)

(assert (=> b!1180491 (=> (not res!784375) (not e!671145))))

(assert (=> b!1180491 (= res!784375 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37320 _keys!1208))))))

(declare-fun b!1180492 () Bool)

(declare-fun e!671136 () Bool)

(declare-fun e!671141 () Bool)

(assert (=> b!1180492 (= e!671136 e!671141)))

(declare-fun res!784386 () Bool)

(assert (=> b!1180492 (=> res!784386 e!671141)))

(assert (=> b!1180492 (= res!784386 (not (validKeyInArray!0 (select (arr!36784 _keys!1208) from!1455))))))

(assert (=> b!1180492 (= lt!533740 lt!533743)))

(declare-fun lt!533735 () ListLongMap!17081)

(declare-fun -!1598 (ListLongMap!17081 (_ BitVec 64)) ListLongMap!17081)

(assert (=> b!1180492 (= lt!533743 (-!1598 lt!533735 k0!934))))

(declare-fun zeroValue!944 () V!44771)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533747 () array!76271)

(declare-fun minValue!944 () V!44771)

(declare-fun lt!533741 () array!76269)

(declare-fun getCurrentListMapNoExtraKeys!5010 (array!76269 array!76271 (_ BitVec 32) (_ BitVec 32) V!44771 V!44771 (_ BitVec 32) Int) ListLongMap!17081)

(assert (=> b!1180492 (= lt!533740 (getCurrentListMapNoExtraKeys!5010 lt!533741 lt!533747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180492 (= lt!533735 (getCurrentListMapNoExtraKeys!5010 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533742 () Unit!39023)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!825 (array!76269 array!76271 (_ BitVec 32) (_ BitVec 32) V!44771 V!44771 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39023)

(assert (=> b!1180492 (= lt!533742 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!825 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1180493 () Bool)

(declare-fun e!671138 () Bool)

(declare-fun e!671137 () Bool)

(assert (=> b!1180493 (= e!671138 (not e!671137))))

(declare-fun res!784378 () Bool)

(assert (=> b!1180493 (=> res!784378 e!671137)))

(assert (=> b!1180493 (= res!784378 (bvsgt from!1455 i!673))))

(assert (=> b!1180493 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533737 () Unit!39023)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76269 (_ BitVec 64) (_ BitVec 32)) Unit!39023)

(assert (=> b!1180493 (= lt!533737 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180494 () Bool)

(declare-fun res!784379 () Bool)

(assert (=> b!1180494 (=> (not res!784379) (not e!671145))))

(assert (=> b!1180494 (= res!784379 (and (= (size!37321 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37320 _keys!1208) (size!37321 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180495 () Bool)

(assert (=> b!1180495 (= e!671146 (and e!671140 mapRes!46427))))

(declare-fun condMapEmpty!46427 () Bool)

(declare-fun mapDefault!46427 () ValueCell!14157)

(assert (=> b!1180495 (= condMapEmpty!46427 (= (arr!36785 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14157)) mapDefault!46427)))))

(declare-fun b!1180496 () Bool)

(declare-fun res!784376 () Bool)

(assert (=> b!1180496 (=> (not res!784376) (not e!671138))))

(assert (=> b!1180496 (= res!784376 (arrayNoDuplicates!0 lt!533741 #b00000000000000000000000000000000 Nil!25847))))

(declare-fun b!1180497 () Bool)

(assert (=> b!1180497 (= e!671144 tp_is_empty!29733)))

(declare-fun b!1180498 () Bool)

(declare-fun e!671134 () Bool)

(assert (=> b!1180498 (= e!671134 e!671135)))

(declare-fun res!784382 () Bool)

(assert (=> b!1180498 (=> res!784382 e!671135)))

(assert (=> b!1180498 (= res!784382 (not (= (select (arr!36784 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180499 () Bool)

(declare-fun res!784380 () Bool)

(assert (=> b!1180499 (=> (not res!784380) (not e!671143))))

(declare-fun lt!533739 () ListLongMap!17081)

(declare-fun lt!533738 () tuple2!19112)

(declare-fun +!3865 (ListLongMap!17081 tuple2!19112) ListLongMap!17081)

(assert (=> b!1180499 (= res!784380 (= lt!533739 (+!3865 lt!533735 lt!533738)))))

(declare-fun b!1180500 () Bool)

(assert (=> b!1180500 (= e!671141 true)))

(assert (=> b!1180500 e!671143))

(declare-fun res!784371 () Bool)

(assert (=> b!1180500 (=> (not res!784371) (not e!671143))))

(assert (=> b!1180500 (= res!784371 (not (= (select (arr!36784 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533744 () Unit!39023)

(assert (=> b!1180500 (= lt!533744 e!671142)))

(declare-fun c!116928 () Bool)

(assert (=> b!1180500 (= c!116928 (= (select (arr!36784 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180500 e!671134))

(declare-fun res!784373 () Bool)

(assert (=> b!1180500 (=> (not res!784373) (not e!671134))))

(declare-fun lt!533746 () ListLongMap!17081)

(assert (=> b!1180500 (= res!784373 (= lt!533746 (+!3865 lt!533743 lt!533738)))))

(declare-fun lt!533745 () V!44771)

(declare-fun get!18810 (ValueCell!14157 V!44771) V!44771)

(assert (=> b!1180500 (= lt!533738 (tuple2!19113 (select (arr!36784 _keys!1208) from!1455) (get!18810 (select (arr!36785 _values!996) from!1455) lt!533745)))))

(declare-fun b!1180501 () Bool)

(assert (=> b!1180501 (= e!671145 e!671138)))

(declare-fun res!784377 () Bool)

(assert (=> b!1180501 (=> (not res!784377) (not e!671138))))

(assert (=> b!1180501 (= res!784377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533741 mask!1564))))

(assert (=> b!1180501 (= lt!533741 (array!76270 (store (arr!36784 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37320 _keys!1208)))))

(declare-fun b!1180502 () Bool)

(assert (=> b!1180502 (= e!671137 e!671136)))

(declare-fun res!784385 () Bool)

(assert (=> b!1180502 (=> res!784385 e!671136)))

(assert (=> b!1180502 (= res!784385 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1180502 (= lt!533746 (getCurrentListMapNoExtraKeys!5010 lt!533741 lt!533747 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1180502 (= lt!533747 (array!76272 (store (arr!36785 _values!996) i!673 (ValueCellFull!14157 lt!533745)) (size!37321 _values!996)))))

(declare-fun dynLambda!2967 (Int (_ BitVec 64)) V!44771)

(assert (=> b!1180502 (= lt!533745 (dynLambda!2967 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1180502 (= lt!533739 (getCurrentListMapNoExtraKeys!5010 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99624 res!784374) b!1180488))

(assert (= (and b!1180488 res!784387) b!1180494))

(assert (= (and b!1180494 res!784379) b!1180483))

(assert (= (and b!1180483 res!784384) b!1180490))

(assert (= (and b!1180490 res!784383) b!1180491))

(assert (= (and b!1180491 res!784375) b!1180485))

(assert (= (and b!1180485 res!784381) b!1180487))

(assert (= (and b!1180487 res!784372) b!1180501))

(assert (= (and b!1180501 res!784377) b!1180496))

(assert (= (and b!1180496 res!784376) b!1180493))

(assert (= (and b!1180493 (not res!784378)) b!1180502))

(assert (= (and b!1180502 (not res!784385)) b!1180492))

(assert (= (and b!1180492 (not res!784386)) b!1180500))

(assert (= (and b!1180500 res!784373) b!1180498))

(assert (= (and b!1180498 (not res!784382)) b!1180489))

(assert (= (and b!1180500 c!116928) b!1180484))

(assert (= (and b!1180500 (not c!116928)) b!1180481))

(assert (= (and b!1180500 res!784371) b!1180499))

(assert (= (and b!1180499 res!784380) b!1180486))

(assert (= (and b!1180495 condMapEmpty!46427) mapIsEmpty!46427))

(assert (= (and b!1180495 (not condMapEmpty!46427)) mapNonEmpty!46427))

(get-info :version)

(assert (= (and mapNonEmpty!46427 ((_ is ValueCellFull!14157) mapValue!46427)) b!1180497))

(assert (= (and b!1180495 ((_ is ValueCellFull!14157) mapDefault!46427)) b!1180482))

(assert (= start!99624 b!1180495))

(declare-fun b_lambda!20347 () Bool)

(assert (=> (not b_lambda!20347) (not b!1180502)))

(declare-fun t!38044 () Bool)

(declare-fun tb!10015 () Bool)

(assert (=> (and start!99624 (= defaultEntry!1004 defaultEntry!1004) t!38044) tb!10015))

(declare-fun result!20597 () Bool)

(assert (=> tb!10015 (= result!20597 tp_is_empty!29733)))

(assert (=> b!1180502 t!38044))

(declare-fun b_and!41275 () Bool)

(assert (= b_and!41273 (and (=> t!38044 result!20597) b_and!41275)))

(declare-fun m!1088433 () Bool)

(assert (=> b!1180487 m!1088433))

(declare-fun m!1088435 () Bool)

(assert (=> b!1180498 m!1088435))

(declare-fun m!1088437 () Bool)

(assert (=> b!1180488 m!1088437))

(declare-fun m!1088439 () Bool)

(assert (=> b!1180502 m!1088439))

(declare-fun m!1088441 () Bool)

(assert (=> b!1180502 m!1088441))

(declare-fun m!1088443 () Bool)

(assert (=> b!1180502 m!1088443))

(declare-fun m!1088445 () Bool)

(assert (=> b!1180502 m!1088445))

(declare-fun m!1088447 () Bool)

(assert (=> b!1180501 m!1088447))

(declare-fun m!1088449 () Bool)

(assert (=> b!1180501 m!1088449))

(declare-fun m!1088451 () Bool)

(assert (=> b!1180489 m!1088451))

(declare-fun m!1088453 () Bool)

(assert (=> b!1180492 m!1088453))

(declare-fun m!1088455 () Bool)

(assert (=> b!1180492 m!1088455))

(assert (=> b!1180492 m!1088435))

(declare-fun m!1088457 () Bool)

(assert (=> b!1180492 m!1088457))

(assert (=> b!1180492 m!1088435))

(declare-fun m!1088459 () Bool)

(assert (=> b!1180492 m!1088459))

(declare-fun m!1088461 () Bool)

(assert (=> b!1180492 m!1088461))

(declare-fun m!1088463 () Bool)

(assert (=> b!1180485 m!1088463))

(declare-fun m!1088465 () Bool)

(assert (=> b!1180483 m!1088465))

(declare-fun m!1088467 () Bool)

(assert (=> b!1180493 m!1088467))

(declare-fun m!1088469 () Bool)

(assert (=> b!1180493 m!1088469))

(declare-fun m!1088471 () Bool)

(assert (=> b!1180499 m!1088471))

(assert (=> b!1180500 m!1088435))

(declare-fun m!1088473 () Bool)

(assert (=> b!1180500 m!1088473))

(declare-fun m!1088475 () Bool)

(assert (=> b!1180500 m!1088475))

(assert (=> b!1180500 m!1088475))

(declare-fun m!1088477 () Bool)

(assert (=> b!1180500 m!1088477))

(declare-fun m!1088479 () Bool)

(assert (=> b!1180490 m!1088479))

(declare-fun m!1088481 () Bool)

(assert (=> mapNonEmpty!46427 m!1088481))

(declare-fun m!1088483 () Bool)

(assert (=> start!99624 m!1088483))

(declare-fun m!1088485 () Bool)

(assert (=> start!99624 m!1088485))

(declare-fun m!1088487 () Bool)

(assert (=> b!1180484 m!1088487))

(declare-fun m!1088489 () Bool)

(assert (=> b!1180484 m!1088489))

(declare-fun m!1088491 () Bool)

(assert (=> b!1180484 m!1088491))

(declare-fun m!1088493 () Bool)

(assert (=> b!1180484 m!1088493))

(declare-fun m!1088495 () Bool)

(assert (=> b!1180484 m!1088495))

(declare-fun m!1088497 () Bool)

(assert (=> b!1180496 m!1088497))

(check-sat b_and!41275 (not b!1180489) (not b!1180496) (not b!1180499) (not b!1180500) (not b!1180492) (not b!1180493) (not b!1180483) (not b!1180490) (not b!1180501) tp_is_empty!29733 (not b!1180488) (not b!1180485) (not b_next!25203) (not b!1180502) (not start!99624) (not mapNonEmpty!46427) (not b!1180484) (not b_lambda!20347))
(check-sat b_and!41275 (not b_next!25203))
