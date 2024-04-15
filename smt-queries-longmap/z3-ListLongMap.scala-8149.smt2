; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99754 () Bool)

(assert start!99754)

(declare-fun b_free!25339 () Bool)

(declare-fun b_next!25339 () Bool)

(assert (=> start!99754 (= b_free!25339 (not b_next!25339))))

(declare-fun tp!88731 () Bool)

(declare-fun b_and!41523 () Bool)

(assert (=> start!99754 (= tp!88731 b_and!41523)))

(declare-fun b!1184671 () Bool)

(declare-fun res!787477 () Bool)

(declare-fun e!673560 () Bool)

(assert (=> b!1184671 (=> (not res!787477) (not e!673560))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184671 (= res!787477 (validMask!0 mask!1564))))

(declare-fun b!1184672 () Bool)

(declare-fun res!787474 () Bool)

(assert (=> b!1184672 (=> (not res!787474) (not e!673560))))

(declare-datatypes ((array!76472 0))(
  ( (array!76473 (arr!36886 (Array (_ BitVec 32) (_ BitVec 64))) (size!37424 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76472)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44953 0))(
  ( (V!44954 (val!14991 Int)) )
))
(declare-datatypes ((ValueCell!14225 0))(
  ( (ValueCellFull!14225 (v!17628 V!44953)) (EmptyCell!14225) )
))
(declare-datatypes ((array!76474 0))(
  ( (array!76475 (arr!36887 (Array (_ BitVec 32) ValueCell!14225)) (size!37425 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76474)

(assert (=> b!1184672 (= res!787474 (and (= (size!37425 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37424 _keys!1208) (size!37425 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184673 () Bool)

(declare-fun e!673564 () Bool)

(declare-fun e!673554 () Bool)

(assert (=> b!1184673 (= e!673564 (not e!673554))))

(declare-fun res!787473 () Bool)

(assert (=> b!1184673 (=> res!787473 e!673554)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1184673 (= res!787473 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184673 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39105 0))(
  ( (Unit!39106) )
))
(declare-fun lt!537237 () Unit!39105)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76472 (_ BitVec 64) (_ BitVec 32)) Unit!39105)

(assert (=> b!1184673 (= lt!537237 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184674 () Bool)

(declare-fun e!673557 () Bool)

(declare-fun e!673553 () Bool)

(assert (=> b!1184674 (= e!673557 e!673553)))

(declare-fun res!787469 () Bool)

(assert (=> b!1184674 (=> res!787469 e!673553)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184674 (= res!787469 (not (validKeyInArray!0 (select (arr!36886 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19340 0))(
  ( (tuple2!19341 (_1!9681 (_ BitVec 64)) (_2!9681 V!44953)) )
))
(declare-datatypes ((List!26050 0))(
  ( (Nil!26047) (Cons!26046 (h!27255 tuple2!19340) (t!38372 List!26050)) )
))
(declare-datatypes ((ListLongMap!17309 0))(
  ( (ListLongMap!17310 (toList!8670 List!26050)) )
))
(declare-fun lt!537229 () ListLongMap!17309)

(declare-fun lt!537225 () ListLongMap!17309)

(assert (=> b!1184674 (= lt!537229 lt!537225)))

(declare-fun lt!537230 () ListLongMap!17309)

(declare-fun -!1624 (ListLongMap!17309 (_ BitVec 64)) ListLongMap!17309)

(assert (=> b!1184674 (= lt!537225 (-!1624 lt!537230 k0!934))))

(declare-fun zeroValue!944 () V!44953)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537224 () array!76472)

(declare-fun minValue!944 () V!44953)

(declare-fun lt!537228 () array!76474)

(declare-fun getCurrentListMapNoExtraKeys!5123 (array!76472 array!76474 (_ BitVec 32) (_ BitVec 32) V!44953 V!44953 (_ BitVec 32) Int) ListLongMap!17309)

(assert (=> b!1184674 (= lt!537229 (getCurrentListMapNoExtraKeys!5123 lt!537224 lt!537228 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184674 (= lt!537230 (getCurrentListMapNoExtraKeys!5123 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537222 () Unit!39105)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!882 (array!76472 array!76474 (_ BitVec 32) (_ BitVec 32) V!44953 V!44953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39105)

(assert (=> b!1184674 (= lt!537222 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!882 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184675 () Bool)

(assert (=> b!1184675 (= e!673554 e!673557)))

(declare-fun res!787463 () Bool)

(assert (=> b!1184675 (=> res!787463 e!673557)))

(assert (=> b!1184675 (= res!787463 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!537235 () ListLongMap!17309)

(assert (=> b!1184675 (= lt!537235 (getCurrentListMapNoExtraKeys!5123 lt!537224 lt!537228 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!537231 () V!44953)

(assert (=> b!1184675 (= lt!537228 (array!76475 (store (arr!36887 _values!996) i!673 (ValueCellFull!14225 lt!537231)) (size!37425 _values!996)))))

(declare-fun dynLambda!3025 (Int (_ BitVec 64)) V!44953)

(assert (=> b!1184675 (= lt!537231 (dynLambda!3025 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!537223 () ListLongMap!17309)

(assert (=> b!1184675 (= lt!537223 (getCurrentListMapNoExtraKeys!5123 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184676 () Bool)

(declare-fun res!787468 () Bool)

(assert (=> b!1184676 (=> (not res!787468) (not e!673560))))

(assert (=> b!1184676 (= res!787468 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37424 _keys!1208))))))

(declare-fun res!787471 () Bool)

(assert (=> start!99754 (=> (not res!787471) (not e!673560))))

(assert (=> start!99754 (= res!787471 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37424 _keys!1208))))))

(assert (=> start!99754 e!673560))

(declare-fun tp_is_empty!29869 () Bool)

(assert (=> start!99754 tp_is_empty!29869))

(declare-fun array_inv!28264 (array!76472) Bool)

(assert (=> start!99754 (array_inv!28264 _keys!1208)))

(assert (=> start!99754 true))

(assert (=> start!99754 tp!88731))

(declare-fun e!673558 () Bool)

(declare-fun array_inv!28265 (array!76474) Bool)

(assert (=> start!99754 (and (array_inv!28265 _values!996) e!673558)))

(declare-fun b!1184677 () Bool)

(declare-fun res!787475 () Bool)

(assert (=> b!1184677 (=> (not res!787475) (not e!673560))))

(assert (=> b!1184677 (= res!787475 (= (select (arr!36886 _keys!1208) i!673) k0!934))))

(declare-fun b!1184678 () Bool)

(declare-fun e!673556 () Bool)

(assert (=> b!1184678 (= e!673556 tp_is_empty!29869)))

(declare-fun b!1184679 () Bool)

(declare-fun res!787467 () Bool)

(assert (=> b!1184679 (=> (not res!787467) (not e!673560))))

(assert (=> b!1184679 (= res!787467 (validKeyInArray!0 k0!934))))

(declare-fun b!1184680 () Bool)

(declare-fun res!787476 () Bool)

(assert (=> b!1184680 (=> (not res!787476) (not e!673560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76472 (_ BitVec 32)) Bool)

(assert (=> b!1184680 (= res!787476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184681 () Bool)

(declare-fun e!673562 () Bool)

(assert (=> b!1184681 (= e!673562 tp_is_empty!29869)))

(declare-fun b!1184682 () Bool)

(assert (=> b!1184682 (= e!673553 true)))

(declare-fun lt!537238 () ListLongMap!17309)

(declare-fun lt!537232 () ListLongMap!17309)

(assert (=> b!1184682 (= (-!1624 lt!537238 k0!934) lt!537232)))

(declare-fun lt!537226 () Unit!39105)

(declare-fun lt!537227 () V!44953)

(declare-fun addRemoveCommutativeForDiffKeys!168 (ListLongMap!17309 (_ BitVec 64) V!44953 (_ BitVec 64)) Unit!39105)

(assert (=> b!1184682 (= lt!537226 (addRemoveCommutativeForDiffKeys!168 lt!537230 (select (arr!36886 _keys!1208) from!1455) lt!537227 k0!934))))

(assert (=> b!1184682 (and (= lt!537223 lt!537238) (= lt!537225 lt!537229))))

(declare-fun lt!537236 () tuple2!19340)

(declare-fun +!3954 (ListLongMap!17309 tuple2!19340) ListLongMap!17309)

(assert (=> b!1184682 (= lt!537238 (+!3954 lt!537230 lt!537236))))

(assert (=> b!1184682 (not (= (select (arr!36886 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537233 () Unit!39105)

(declare-fun e!673559 () Unit!39105)

(assert (=> b!1184682 (= lt!537233 e!673559)))

(declare-fun c!117106 () Bool)

(assert (=> b!1184682 (= c!117106 (= (select (arr!36886 _keys!1208) from!1455) k0!934))))

(declare-fun e!673561 () Bool)

(assert (=> b!1184682 e!673561))

(declare-fun res!787472 () Bool)

(assert (=> b!1184682 (=> (not res!787472) (not e!673561))))

(assert (=> b!1184682 (= res!787472 (= lt!537235 lt!537232))))

(assert (=> b!1184682 (= lt!537232 (+!3954 lt!537225 lt!537236))))

(assert (=> b!1184682 (= lt!537236 (tuple2!19341 (select (arr!36886 _keys!1208) from!1455) lt!537227))))

(declare-fun get!18889 (ValueCell!14225 V!44953) V!44953)

(assert (=> b!1184682 (= lt!537227 (get!18889 (select (arr!36887 _values!996) from!1455) lt!537231))))

(declare-fun mapNonEmpty!46631 () Bool)

(declare-fun mapRes!46631 () Bool)

(declare-fun tp!88730 () Bool)

(assert (=> mapNonEmpty!46631 (= mapRes!46631 (and tp!88730 e!673556))))

(declare-fun mapKey!46631 () (_ BitVec 32))

(declare-fun mapRest!46631 () (Array (_ BitVec 32) ValueCell!14225))

(declare-fun mapValue!46631 () ValueCell!14225)

(assert (=> mapNonEmpty!46631 (= (arr!36887 _values!996) (store mapRest!46631 mapKey!46631 mapValue!46631))))

(declare-fun b!1184683 () Bool)

(declare-fun res!787470 () Bool)

(assert (=> b!1184683 (=> (not res!787470) (not e!673564))))

(declare-datatypes ((List!26051 0))(
  ( (Nil!26048) (Cons!26047 (h!27256 (_ BitVec 64)) (t!38373 List!26051)) )
))
(declare-fun arrayNoDuplicates!0 (array!76472 (_ BitVec 32) List!26051) Bool)

(assert (=> b!1184683 (= res!787470 (arrayNoDuplicates!0 lt!537224 #b00000000000000000000000000000000 Nil!26048))))

(declare-fun b!1184684 () Bool)

(declare-fun Unit!39107 () Unit!39105)

(assert (=> b!1184684 (= e!673559 Unit!39107)))

(declare-fun lt!537239 () Unit!39105)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76472 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39105)

(assert (=> b!1184684 (= lt!537239 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184684 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537240 () Unit!39105)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76472 (_ BitVec 32) (_ BitVec 32)) Unit!39105)

(assert (=> b!1184684 (= lt!537240 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184684 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26048)))

(declare-fun lt!537234 () Unit!39105)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76472 (_ BitVec 64) (_ BitVec 32) List!26051) Unit!39105)

(assert (=> b!1184684 (= lt!537234 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26048))))

(assert (=> b!1184684 false))

(declare-fun b!1184685 () Bool)

(declare-fun e!673563 () Bool)

(assert (=> b!1184685 (= e!673563 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46631 () Bool)

(assert (=> mapIsEmpty!46631 mapRes!46631))

(declare-fun b!1184686 () Bool)

(assert (=> b!1184686 (= e!673560 e!673564)))

(declare-fun res!787464 () Bool)

(assert (=> b!1184686 (=> (not res!787464) (not e!673564))))

(assert (=> b!1184686 (= res!787464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537224 mask!1564))))

(assert (=> b!1184686 (= lt!537224 (array!76473 (store (arr!36886 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37424 _keys!1208)))))

(declare-fun b!1184687 () Bool)

(declare-fun Unit!39108 () Unit!39105)

(assert (=> b!1184687 (= e!673559 Unit!39108)))

(declare-fun b!1184688 () Bool)

(assert (=> b!1184688 (= e!673558 (and e!673562 mapRes!46631))))

(declare-fun condMapEmpty!46631 () Bool)

(declare-fun mapDefault!46631 () ValueCell!14225)

(assert (=> b!1184688 (= condMapEmpty!46631 (= (arr!36887 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14225)) mapDefault!46631)))))

(declare-fun b!1184689 () Bool)

(assert (=> b!1184689 (= e!673561 e!673563)))

(declare-fun res!787465 () Bool)

(assert (=> b!1184689 (=> res!787465 e!673563)))

(assert (=> b!1184689 (= res!787465 (not (= (select (arr!36886 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184690 () Bool)

(declare-fun res!787466 () Bool)

(assert (=> b!1184690 (=> (not res!787466) (not e!673560))))

(assert (=> b!1184690 (= res!787466 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26048))))

(assert (= (and start!99754 res!787471) b!1184671))

(assert (= (and b!1184671 res!787477) b!1184672))

(assert (= (and b!1184672 res!787474) b!1184680))

(assert (= (and b!1184680 res!787476) b!1184690))

(assert (= (and b!1184690 res!787466) b!1184676))

(assert (= (and b!1184676 res!787468) b!1184679))

(assert (= (and b!1184679 res!787467) b!1184677))

(assert (= (and b!1184677 res!787475) b!1184686))

(assert (= (and b!1184686 res!787464) b!1184683))

(assert (= (and b!1184683 res!787470) b!1184673))

(assert (= (and b!1184673 (not res!787473)) b!1184675))

(assert (= (and b!1184675 (not res!787463)) b!1184674))

(assert (= (and b!1184674 (not res!787469)) b!1184682))

(assert (= (and b!1184682 res!787472) b!1184689))

(assert (= (and b!1184689 (not res!787465)) b!1184685))

(assert (= (and b!1184682 c!117106) b!1184684))

(assert (= (and b!1184682 (not c!117106)) b!1184687))

(assert (= (and b!1184688 condMapEmpty!46631) mapIsEmpty!46631))

(assert (= (and b!1184688 (not condMapEmpty!46631)) mapNonEmpty!46631))

(get-info :version)

(assert (= (and mapNonEmpty!46631 ((_ is ValueCellFull!14225) mapValue!46631)) b!1184678))

(assert (= (and b!1184688 ((_ is ValueCellFull!14225) mapDefault!46631)) b!1184681))

(assert (= start!99754 b!1184688))

(declare-fun b_lambda!20465 () Bool)

(assert (=> (not b_lambda!20465) (not b!1184675)))

(declare-fun t!38371 () Bool)

(declare-fun tb!10143 () Bool)

(assert (=> (and start!99754 (= defaultEntry!1004 defaultEntry!1004) t!38371) tb!10143))

(declare-fun result!20861 () Bool)

(assert (=> tb!10143 (= result!20861 tp_is_empty!29869)))

(assert (=> b!1184675 t!38371))

(declare-fun b_and!41525 () Bool)

(assert (= b_and!41523 (and (=> t!38371 result!20861) b_and!41525)))

(declare-fun m!1092515 () Bool)

(assert (=> b!1184686 m!1092515))

(declare-fun m!1092517 () Bool)

(assert (=> b!1184686 m!1092517))

(declare-fun m!1092519 () Bool)

(assert (=> start!99754 m!1092519))

(declare-fun m!1092521 () Bool)

(assert (=> start!99754 m!1092521))

(declare-fun m!1092523 () Bool)

(assert (=> b!1184689 m!1092523))

(declare-fun m!1092525 () Bool)

(assert (=> b!1184674 m!1092525))

(declare-fun m!1092527 () Bool)

(assert (=> b!1184674 m!1092527))

(declare-fun m!1092529 () Bool)

(assert (=> b!1184674 m!1092529))

(declare-fun m!1092531 () Bool)

(assert (=> b!1184674 m!1092531))

(assert (=> b!1184674 m!1092523))

(declare-fun m!1092533 () Bool)

(assert (=> b!1184674 m!1092533))

(assert (=> b!1184674 m!1092523))

(declare-fun m!1092535 () Bool)

(assert (=> b!1184677 m!1092535))

(declare-fun m!1092537 () Bool)

(assert (=> mapNonEmpty!46631 m!1092537))

(declare-fun m!1092539 () Bool)

(assert (=> b!1184679 m!1092539))

(declare-fun m!1092541 () Bool)

(assert (=> b!1184671 m!1092541))

(declare-fun m!1092543 () Bool)

(assert (=> b!1184673 m!1092543))

(declare-fun m!1092545 () Bool)

(assert (=> b!1184673 m!1092545))

(declare-fun m!1092547 () Bool)

(assert (=> b!1184684 m!1092547))

(declare-fun m!1092549 () Bool)

(assert (=> b!1184684 m!1092549))

(declare-fun m!1092551 () Bool)

(assert (=> b!1184684 m!1092551))

(declare-fun m!1092553 () Bool)

(assert (=> b!1184684 m!1092553))

(declare-fun m!1092555 () Bool)

(assert (=> b!1184684 m!1092555))

(declare-fun m!1092557 () Bool)

(assert (=> b!1184682 m!1092557))

(declare-fun m!1092559 () Bool)

(assert (=> b!1184682 m!1092559))

(declare-fun m!1092561 () Bool)

(assert (=> b!1184682 m!1092561))

(assert (=> b!1184682 m!1092561))

(declare-fun m!1092563 () Bool)

(assert (=> b!1184682 m!1092563))

(assert (=> b!1184682 m!1092523))

(declare-fun m!1092565 () Bool)

(assert (=> b!1184682 m!1092565))

(declare-fun m!1092567 () Bool)

(assert (=> b!1184682 m!1092567))

(assert (=> b!1184682 m!1092523))

(declare-fun m!1092569 () Bool)

(assert (=> b!1184690 m!1092569))

(declare-fun m!1092571 () Bool)

(assert (=> b!1184680 m!1092571))

(declare-fun m!1092573 () Bool)

(assert (=> b!1184675 m!1092573))

(declare-fun m!1092575 () Bool)

(assert (=> b!1184675 m!1092575))

(declare-fun m!1092577 () Bool)

(assert (=> b!1184675 m!1092577))

(declare-fun m!1092579 () Bool)

(assert (=> b!1184675 m!1092579))

(declare-fun m!1092581 () Bool)

(assert (=> b!1184683 m!1092581))

(declare-fun m!1092583 () Bool)

(assert (=> b!1184685 m!1092583))

(check-sat (not b!1184683) (not b!1184685) (not b!1184675) (not b!1184679) (not start!99754) (not b!1184684) (not b!1184673) (not b_next!25339) (not mapNonEmpty!46631) (not b!1184682) (not b!1184671) (not b!1184674) (not b!1184690) tp_is_empty!29869 (not b!1184680) (not b!1184686) (not b_lambda!20465) b_and!41525)
(check-sat b_and!41525 (not b_next!25339))
