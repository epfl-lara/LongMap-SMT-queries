; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99798 () Bool)

(assert start!99798)

(declare-fun b_free!25377 () Bool)

(declare-fun b_next!25377 () Bool)

(assert (=> start!99798 (= b_free!25377 (not b_next!25377))))

(declare-fun tp!88845 () Bool)

(declare-fun b_and!41621 () Bool)

(assert (=> start!99798 (= tp!88845 b_and!41621)))

(declare-fun b!1185973 () Bool)

(declare-fun res!788385 () Bool)

(declare-fun e!674323 () Bool)

(assert (=> b!1185973 (=> (not res!788385) (not e!674323))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185973 (= res!788385 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46688 () Bool)

(declare-fun mapRes!46688 () Bool)

(assert (=> mapIsEmpty!46688 mapRes!46688))

(declare-fun b!1185975 () Bool)

(declare-fun res!788391 () Bool)

(assert (=> b!1185975 (=> (not res!788391) (not e!674323))))

(declare-datatypes ((array!76611 0))(
  ( (array!76612 (arr!36955 (Array (_ BitVec 32) (_ BitVec 64))) (size!37491 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76611)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1185975 (= res!788391 (= (select (arr!36955 _keys!1208) i!673) k0!934))))

(declare-fun b!1185976 () Bool)

(declare-fun res!788393 () Bool)

(declare-fun e!674321 () Bool)

(assert (=> b!1185976 (=> (not res!788393) (not e!674321))))

(declare-fun lt!538504 () array!76611)

(declare-datatypes ((List!25999 0))(
  ( (Nil!25996) (Cons!25995 (h!27204 (_ BitVec 64)) (t!38368 List!25999)) )
))
(declare-fun arrayNoDuplicates!0 (array!76611 (_ BitVec 32) List!25999) Bool)

(assert (=> b!1185976 (= res!788393 (arrayNoDuplicates!0 lt!538504 #b00000000000000000000000000000000 Nil!25996))))

(declare-fun b!1185977 () Bool)

(declare-fun res!788395 () Bool)

(assert (=> b!1185977 (=> (not res!788395) (not e!674323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76611 (_ BitVec 32)) Bool)

(assert (=> b!1185977 (= res!788395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185978 () Bool)

(declare-fun e!674325 () Bool)

(assert (=> b!1185978 (= e!674321 (not e!674325))))

(declare-fun res!788387 () Bool)

(assert (=> b!1185978 (=> res!788387 e!674325)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1185978 (= res!788387 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185978 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39302 0))(
  ( (Unit!39303) )
))
(declare-fun lt!538513 () Unit!39302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76611 (_ BitVec 64) (_ BitVec 32)) Unit!39302)

(assert (=> b!1185978 (= lt!538513 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185979 () Bool)

(declare-fun e!674322 () Bool)

(declare-fun e!674317 () Bool)

(assert (=> b!1185979 (= e!674322 e!674317)))

(declare-fun res!788398 () Bool)

(assert (=> b!1185979 (=> res!788398 e!674317)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185979 (= res!788398 (not (validKeyInArray!0 (select (arr!36955 _keys!1208) from!1455))))))

(declare-datatypes ((V!45003 0))(
  ( (V!45004 (val!15010 Int)) )
))
(declare-datatypes ((tuple2!19258 0))(
  ( (tuple2!19259 (_1!9640 (_ BitVec 64)) (_2!9640 V!45003)) )
))
(declare-datatypes ((List!26000 0))(
  ( (Nil!25997) (Cons!25996 (h!27205 tuple2!19258) (t!38369 List!26000)) )
))
(declare-datatypes ((ListLongMap!17227 0))(
  ( (ListLongMap!17228 (toList!8629 List!26000)) )
))
(declare-fun lt!538515 () ListLongMap!17227)

(declare-fun lt!538509 () ListLongMap!17227)

(assert (=> b!1185979 (= lt!538515 lt!538509)))

(declare-fun lt!538497 () ListLongMap!17227)

(declare-fun -!1662 (ListLongMap!17227 (_ BitVec 64)) ListLongMap!17227)

(assert (=> b!1185979 (= lt!538509 (-!1662 lt!538497 k0!934))))

(declare-fun zeroValue!944 () V!45003)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14244 0))(
  ( (ValueCellFull!14244 (v!17648 V!45003)) (EmptyCell!14244) )
))
(declare-datatypes ((array!76613 0))(
  ( (array!76614 (arr!36956 (Array (_ BitVec 32) ValueCell!14244)) (size!37492 (_ BitVec 32))) )
))
(declare-fun lt!538498 () array!76613)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45003)

(declare-fun getCurrentListMapNoExtraKeys!5074 (array!76611 array!76613 (_ BitVec 32) (_ BitVec 32) V!45003 V!45003 (_ BitVec 32) Int) ListLongMap!17227)

(assert (=> b!1185979 (= lt!538515 (getCurrentListMapNoExtraKeys!5074 lt!538504 lt!538498 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76613)

(assert (=> b!1185979 (= lt!538497 (getCurrentListMapNoExtraKeys!5074 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538500 () Unit!39302)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!877 (array!76611 array!76613 (_ BitVec 32) (_ BitVec 32) V!45003 V!45003 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39302)

(assert (=> b!1185979 (= lt!538500 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!877 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185980 () Bool)

(declare-fun e!674324 () Unit!39302)

(declare-fun Unit!39304 () Unit!39302)

(assert (=> b!1185980 (= e!674324 Unit!39304)))

(declare-fun lt!538514 () Unit!39302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76611 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39302)

(assert (=> b!1185980 (= lt!538514 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185980 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538511 () Unit!39302)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76611 (_ BitVec 32) (_ BitVec 32)) Unit!39302)

(assert (=> b!1185980 (= lt!538511 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185980 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25996)))

(declare-fun lt!538510 () Unit!39302)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76611 (_ BitVec 64) (_ BitVec 32) List!25999) Unit!39302)

(assert (=> b!1185980 (= lt!538510 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25996))))

(assert (=> b!1185980 false))

(declare-fun b!1185981 () Bool)

(declare-fun res!788386 () Bool)

(assert (=> b!1185981 (=> (not res!788386) (not e!674323))))

(assert (=> b!1185981 (= res!788386 (and (= (size!37492 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37491 _keys!1208) (size!37492 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46688 () Bool)

(declare-fun tp!88844 () Bool)

(declare-fun e!674316 () Bool)

(assert (=> mapNonEmpty!46688 (= mapRes!46688 (and tp!88844 e!674316))))

(declare-fun mapRest!46688 () (Array (_ BitVec 32) ValueCell!14244))

(declare-fun mapValue!46688 () ValueCell!14244)

(declare-fun mapKey!46688 () (_ BitVec 32))

(assert (=> mapNonEmpty!46688 (= (arr!36956 _values!996) (store mapRest!46688 mapKey!46688 mapValue!46688))))

(declare-fun b!1185982 () Bool)

(declare-fun res!788394 () Bool)

(assert (=> b!1185982 (=> (not res!788394) (not e!674323))))

(assert (=> b!1185982 (= res!788394 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25996))))

(declare-fun b!1185974 () Bool)

(declare-fun e!674318 () Bool)

(declare-fun e!674320 () Bool)

(assert (=> b!1185974 (= e!674318 e!674320)))

(declare-fun res!788388 () Bool)

(assert (=> b!1185974 (=> res!788388 e!674320)))

(assert (=> b!1185974 (= res!788388 (not (= (select (arr!36955 _keys!1208) from!1455) k0!934)))))

(declare-fun res!788392 () Bool)

(assert (=> start!99798 (=> (not res!788392) (not e!674323))))

(assert (=> start!99798 (= res!788392 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37491 _keys!1208))))))

(assert (=> start!99798 e!674323))

(declare-fun tp_is_empty!29907 () Bool)

(assert (=> start!99798 tp_is_empty!29907))

(declare-fun array_inv!28202 (array!76611) Bool)

(assert (=> start!99798 (array_inv!28202 _keys!1208)))

(assert (=> start!99798 true))

(assert (=> start!99798 tp!88845))

(declare-fun e!674326 () Bool)

(declare-fun array_inv!28203 (array!76613) Bool)

(assert (=> start!99798 (and (array_inv!28203 _values!996) e!674326)))

(declare-fun b!1185983 () Bool)

(assert (=> b!1185983 (= e!674323 e!674321)))

(declare-fun res!788397 () Bool)

(assert (=> b!1185983 (=> (not res!788397) (not e!674321))))

(assert (=> b!1185983 (= res!788397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538504 mask!1564))))

(assert (=> b!1185983 (= lt!538504 (array!76612 (store (arr!36955 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37491 _keys!1208)))))

(declare-fun b!1185984 () Bool)

(assert (=> b!1185984 (= e!674325 e!674322)))

(declare-fun res!788384 () Bool)

(assert (=> b!1185984 (=> res!788384 e!674322)))

(assert (=> b!1185984 (= res!788384 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!538499 () ListLongMap!17227)

(assert (=> b!1185984 (= lt!538499 (getCurrentListMapNoExtraKeys!5074 lt!538504 lt!538498 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538508 () V!45003)

(assert (=> b!1185984 (= lt!538498 (array!76614 (store (arr!36956 _values!996) i!673 (ValueCellFull!14244 lt!538508)) (size!37492 _values!996)))))

(declare-fun dynLambda!3024 (Int (_ BitVec 64)) V!45003)

(assert (=> b!1185984 (= lt!538508 (dynLambda!3024 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538507 () ListLongMap!17227)

(assert (=> b!1185984 (= lt!538507 (getCurrentListMapNoExtraKeys!5074 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185985 () Bool)

(declare-fun res!788396 () Bool)

(assert (=> b!1185985 (=> (not res!788396) (not e!674323))))

(assert (=> b!1185985 (= res!788396 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37491 _keys!1208))))))

(declare-fun b!1185986 () Bool)

(declare-fun e!674315 () Bool)

(assert (=> b!1185986 (= e!674326 (and e!674315 mapRes!46688))))

(declare-fun condMapEmpty!46688 () Bool)

(declare-fun mapDefault!46688 () ValueCell!14244)

(assert (=> b!1185986 (= condMapEmpty!46688 (= (arr!36956 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14244)) mapDefault!46688)))))

(declare-fun b!1185987 () Bool)

(declare-fun res!788389 () Bool)

(assert (=> b!1185987 (=> (not res!788389) (not e!674323))))

(assert (=> b!1185987 (= res!788389 (validKeyInArray!0 k0!934))))

(declare-fun b!1185988 () Bool)

(assert (=> b!1185988 (= e!674316 tp_is_empty!29907)))

(declare-fun b!1185989 () Bool)

(assert (=> b!1185989 (= e!674315 tp_is_empty!29907)))

(declare-fun b!1185990 () Bool)

(declare-fun Unit!39305 () Unit!39302)

(assert (=> b!1185990 (= e!674324 Unit!39305)))

(declare-fun b!1185991 () Bool)

(assert (=> b!1185991 (= e!674317 true)))

(declare-fun lt!538501 () ListLongMap!17227)

(declare-fun lt!538502 () ListLongMap!17227)

(assert (=> b!1185991 (= (-!1662 lt!538501 k0!934) lt!538502)))

(declare-fun lt!538503 () Unit!39302)

(declare-fun lt!538506 () V!45003)

(declare-fun addRemoveCommutativeForDiffKeys!187 (ListLongMap!17227 (_ BitVec 64) V!45003 (_ BitVec 64)) Unit!39302)

(assert (=> b!1185991 (= lt!538503 (addRemoveCommutativeForDiffKeys!187 lt!538497 (select (arr!36955 _keys!1208) from!1455) lt!538506 k0!934))))

(assert (=> b!1185991 (and (= lt!538507 lt!538501) (= lt!538509 lt!538515))))

(declare-fun lt!538512 () tuple2!19258)

(declare-fun +!3924 (ListLongMap!17227 tuple2!19258) ListLongMap!17227)

(assert (=> b!1185991 (= lt!538501 (+!3924 lt!538497 lt!538512))))

(assert (=> b!1185991 (not (= (select (arr!36955 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538505 () Unit!39302)

(assert (=> b!1185991 (= lt!538505 e!674324)))

(declare-fun c!117189 () Bool)

(assert (=> b!1185991 (= c!117189 (= (select (arr!36955 _keys!1208) from!1455) k0!934))))

(assert (=> b!1185991 e!674318))

(declare-fun res!788390 () Bool)

(assert (=> b!1185991 (=> (not res!788390) (not e!674318))))

(assert (=> b!1185991 (= res!788390 (= lt!538499 lt!538502))))

(assert (=> b!1185991 (= lt!538502 (+!3924 lt!538509 lt!538512))))

(assert (=> b!1185991 (= lt!538512 (tuple2!19259 (select (arr!36955 _keys!1208) from!1455) lt!538506))))

(declare-fun get!18923 (ValueCell!14244 V!45003) V!45003)

(assert (=> b!1185991 (= lt!538506 (get!18923 (select (arr!36956 _values!996) from!1455) lt!538508))))

(declare-fun b!1185992 () Bool)

(assert (=> b!1185992 (= e!674320 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99798 res!788392) b!1185973))

(assert (= (and b!1185973 res!788385) b!1185981))

(assert (= (and b!1185981 res!788386) b!1185977))

(assert (= (and b!1185977 res!788395) b!1185982))

(assert (= (and b!1185982 res!788394) b!1185985))

(assert (= (and b!1185985 res!788396) b!1185987))

(assert (= (and b!1185987 res!788389) b!1185975))

(assert (= (and b!1185975 res!788391) b!1185983))

(assert (= (and b!1185983 res!788397) b!1185976))

(assert (= (and b!1185976 res!788393) b!1185978))

(assert (= (and b!1185978 (not res!788387)) b!1185984))

(assert (= (and b!1185984 (not res!788384)) b!1185979))

(assert (= (and b!1185979 (not res!788398)) b!1185991))

(assert (= (and b!1185991 res!788390) b!1185974))

(assert (= (and b!1185974 (not res!788388)) b!1185992))

(assert (= (and b!1185991 c!117189) b!1185980))

(assert (= (and b!1185991 (not c!117189)) b!1185990))

(assert (= (and b!1185986 condMapEmpty!46688) mapIsEmpty!46688))

(assert (= (and b!1185986 (not condMapEmpty!46688)) mapNonEmpty!46688))

(get-info :version)

(assert (= (and mapNonEmpty!46688 ((_ is ValueCellFull!14244) mapValue!46688)) b!1185988))

(assert (= (and b!1185986 ((_ is ValueCellFull!14244) mapDefault!46688)) b!1185989))

(assert (= start!99798 b!1185986))

(declare-fun b_lambda!20521 () Bool)

(assert (=> (not b_lambda!20521) (not b!1185984)))

(declare-fun t!38367 () Bool)

(declare-fun tb!10189 () Bool)

(assert (=> (and start!99798 (= defaultEntry!1004 defaultEntry!1004) t!38367) tb!10189))

(declare-fun result!20945 () Bool)

(assert (=> tb!10189 (= result!20945 tp_is_empty!29907)))

(assert (=> b!1185984 t!38367))

(declare-fun b_and!41623 () Bool)

(assert (= b_and!41621 (and (=> t!38367 result!20945) b_and!41623)))

(declare-fun m!1094455 () Bool)

(assert (=> b!1185982 m!1094455))

(declare-fun m!1094457 () Bool)

(assert (=> b!1185973 m!1094457))

(declare-fun m!1094459 () Bool)

(assert (=> b!1185975 m!1094459))

(declare-fun m!1094461 () Bool)

(assert (=> mapNonEmpty!46688 m!1094461))

(declare-fun m!1094463 () Bool)

(assert (=> b!1185977 m!1094463))

(declare-fun m!1094465 () Bool)

(assert (=> b!1185978 m!1094465))

(declare-fun m!1094467 () Bool)

(assert (=> b!1185978 m!1094467))

(declare-fun m!1094469 () Bool)

(assert (=> b!1185992 m!1094469))

(declare-fun m!1094471 () Bool)

(assert (=> b!1185983 m!1094471))

(declare-fun m!1094473 () Bool)

(assert (=> b!1185983 m!1094473))

(declare-fun m!1094475 () Bool)

(assert (=> b!1185987 m!1094475))

(declare-fun m!1094477 () Bool)

(assert (=> b!1185991 m!1094477))

(declare-fun m!1094479 () Bool)

(assert (=> b!1185991 m!1094479))

(declare-fun m!1094481 () Bool)

(assert (=> b!1185991 m!1094481))

(declare-fun m!1094483 () Bool)

(assert (=> b!1185991 m!1094483))

(declare-fun m!1094485 () Bool)

(assert (=> b!1185991 m!1094485))

(declare-fun m!1094487 () Bool)

(assert (=> b!1185991 m!1094487))

(assert (=> b!1185991 m!1094479))

(declare-fun m!1094489 () Bool)

(assert (=> b!1185991 m!1094489))

(assert (=> b!1185991 m!1094481))

(declare-fun m!1094491 () Bool)

(assert (=> start!99798 m!1094491))

(declare-fun m!1094493 () Bool)

(assert (=> start!99798 m!1094493))

(assert (=> b!1185974 m!1094481))

(declare-fun m!1094495 () Bool)

(assert (=> b!1185980 m!1094495))

(declare-fun m!1094497 () Bool)

(assert (=> b!1185980 m!1094497))

(declare-fun m!1094499 () Bool)

(assert (=> b!1185980 m!1094499))

(declare-fun m!1094501 () Bool)

(assert (=> b!1185980 m!1094501))

(declare-fun m!1094503 () Bool)

(assert (=> b!1185980 m!1094503))

(declare-fun m!1094505 () Bool)

(assert (=> b!1185976 m!1094505))

(declare-fun m!1094507 () Bool)

(assert (=> b!1185979 m!1094507))

(declare-fun m!1094509 () Bool)

(assert (=> b!1185979 m!1094509))

(declare-fun m!1094511 () Bool)

(assert (=> b!1185979 m!1094511))

(assert (=> b!1185979 m!1094481))

(declare-fun m!1094513 () Bool)

(assert (=> b!1185979 m!1094513))

(declare-fun m!1094515 () Bool)

(assert (=> b!1185979 m!1094515))

(assert (=> b!1185979 m!1094481))

(declare-fun m!1094517 () Bool)

(assert (=> b!1185984 m!1094517))

(declare-fun m!1094519 () Bool)

(assert (=> b!1185984 m!1094519))

(declare-fun m!1094521 () Bool)

(assert (=> b!1185984 m!1094521))

(declare-fun m!1094523 () Bool)

(assert (=> b!1185984 m!1094523))

(check-sat (not b!1185987) (not b!1185979) (not b!1185977) (not b!1185991) (not b!1185982) (not b!1185980) (not b!1185973) (not start!99798) tp_is_empty!29907 b_and!41623 (not b_lambda!20521) (not b!1185983) (not b!1185984) (not b!1185978) (not b_next!25377) (not b!1185976) (not mapNonEmpty!46688) (not b!1185992))
(check-sat b_and!41623 (not b_next!25377))
