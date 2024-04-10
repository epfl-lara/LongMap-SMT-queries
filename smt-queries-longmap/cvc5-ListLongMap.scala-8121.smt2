; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99592 () Bool)

(assert start!99592)

(declare-fun b_free!25171 () Bool)

(declare-fun b_next!25171 () Bool)

(assert (=> start!99592 (= b_free!25171 (not b_next!25171))))

(declare-fun tp!88227 () Bool)

(declare-fun b_and!41209 () Bool)

(assert (=> start!99592 (= tp!88227 b_and!41209)))

(declare-fun b!1179400 () Bool)

(declare-fun res!783576 () Bool)

(declare-fun e!670513 () Bool)

(assert (=> b!1179400 (=> (not res!783576) (not e!670513))))

(declare-datatypes ((array!76205 0))(
  ( (array!76206 (arr!36752 (Array (_ BitVec 32) (_ BitVec 64))) (size!37288 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76205)

(declare-datatypes ((List!25819 0))(
  ( (Nil!25816) (Cons!25815 (h!27024 (_ BitVec 64)) (t!37982 List!25819)) )
))
(declare-fun arrayNoDuplicates!0 (array!76205 (_ BitVec 32) List!25819) Bool)

(assert (=> b!1179400 (= res!783576 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25816))))

(declare-fun b!1179401 () Bool)

(declare-fun e!670518 () Bool)

(declare-fun e!670512 () Bool)

(assert (=> b!1179401 (= e!670518 e!670512)))

(declare-fun res!783577 () Bool)

(assert (=> b!1179401 (=> res!783577 e!670512)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179401 (= res!783577 (not (= (select (arr!36752 _keys!1208) from!1455) k!934)))))

(declare-fun mapNonEmpty!46379 () Bool)

(declare-fun mapRes!46379 () Bool)

(declare-fun tp!88226 () Bool)

(declare-fun e!670514 () Bool)

(assert (=> mapNonEmpty!46379 (= mapRes!46379 (and tp!88226 e!670514))))

(declare-datatypes ((V!44729 0))(
  ( (V!44730 (val!14907 Int)) )
))
(declare-datatypes ((ValueCell!14141 0))(
  ( (ValueCellFull!14141 (v!17545 V!44729)) (EmptyCell!14141) )
))
(declare-fun mapValue!46379 () ValueCell!14141)

(declare-datatypes ((array!76207 0))(
  ( (array!76208 (arr!36753 (Array (_ BitVec 32) ValueCell!14141)) (size!37289 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76207)

(declare-fun mapRest!46379 () (Array (_ BitVec 32) ValueCell!14141))

(declare-fun mapKey!46379 () (_ BitVec 32))

(assert (=> mapNonEmpty!46379 (= (arr!36753 _values!996) (store mapRest!46379 mapKey!46379 mapValue!46379))))

(declare-fun b!1179402 () Bool)

(declare-fun res!783575 () Bool)

(assert (=> b!1179402 (=> (not res!783575) (not e!670513))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179402 (= res!783575 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46379 () Bool)

(assert (=> mapIsEmpty!46379 mapRes!46379))

(declare-fun b!1179404 () Bool)

(declare-fun e!670517 () Bool)

(assert (=> b!1179404 (= e!670517 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37288 _keys!1208))))))

(declare-fun e!670522 () Bool)

(assert (=> b!1179404 e!670522))

(declare-fun res!783568 () Bool)

(assert (=> b!1179404 (=> (not res!783568) (not e!670522))))

(assert (=> b!1179404 (= res!783568 (not (= (select (arr!36752 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38970 0))(
  ( (Unit!38971) )
))
(declare-fun lt!533019 () Unit!38970)

(declare-fun e!670521 () Unit!38970)

(assert (=> b!1179404 (= lt!533019 e!670521)))

(declare-fun c!116880 () Bool)

(assert (=> b!1179404 (= c!116880 (= (select (arr!36752 _keys!1208) from!1455) k!934))))

(assert (=> b!1179404 e!670518))

(declare-fun res!783571 () Bool)

(assert (=> b!1179404 (=> (not res!783571) (not e!670518))))

(declare-datatypes ((tuple2!19082 0))(
  ( (tuple2!19083 (_1!9552 (_ BitVec 64)) (_2!9552 V!44729)) )
))
(declare-datatypes ((List!25820 0))(
  ( (Nil!25817) (Cons!25816 (h!27025 tuple2!19082) (t!37983 List!25820)) )
))
(declare-datatypes ((ListLongMap!17051 0))(
  ( (ListLongMap!17052 (toList!8541 List!25820)) )
))
(declare-fun lt!533023 () ListLongMap!17051)

(declare-fun lt!533015 () ListLongMap!17051)

(declare-fun lt!533014 () tuple2!19082)

(declare-fun +!3853 (ListLongMap!17051 tuple2!19082) ListLongMap!17051)

(assert (=> b!1179404 (= res!783571 (= lt!533023 (+!3853 lt!533015 lt!533014)))))

(declare-fun lt!533024 () V!44729)

(declare-fun get!18789 (ValueCell!14141 V!44729) V!44729)

(assert (=> b!1179404 (= lt!533014 (tuple2!19083 (select (arr!36752 _keys!1208) from!1455) (get!18789 (select (arr!36753 _values!996) from!1455) lt!533024)))))

(declare-fun b!1179405 () Bool)

(declare-fun e!670519 () Bool)

(assert (=> b!1179405 (= e!670513 e!670519)))

(declare-fun res!783562 () Bool)

(assert (=> b!1179405 (=> (not res!783562) (not e!670519))))

(declare-fun lt!533016 () array!76205)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76205 (_ BitVec 32)) Bool)

(assert (=> b!1179405 (= res!783562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533016 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179405 (= lt!533016 (array!76206 (store (arr!36752 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37288 _keys!1208)))))

(declare-fun b!1179406 () Bool)

(declare-fun e!670511 () Bool)

(assert (=> b!1179406 (= e!670519 (not e!670511))))

(declare-fun res!783572 () Bool)

(assert (=> b!1179406 (=> res!783572 e!670511)))

(assert (=> b!1179406 (= res!783572 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179406 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!533020 () Unit!38970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76205 (_ BitVec 64) (_ BitVec 32)) Unit!38970)

(assert (=> b!1179406 (= lt!533020 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179407 () Bool)

(declare-fun res!783574 () Bool)

(assert (=> b!1179407 (=> (not res!783574) (not e!670513))))

(assert (=> b!1179407 (= res!783574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179408 () Bool)

(declare-fun res!783565 () Bool)

(assert (=> b!1179408 (=> (not res!783565) (not e!670513))))

(assert (=> b!1179408 (= res!783565 (= (select (arr!36752 _keys!1208) i!673) k!934))))

(declare-fun b!1179409 () Bool)

(declare-fun Unit!38972 () Unit!38970)

(assert (=> b!1179409 (= e!670521 Unit!38972)))

(declare-fun b!1179410 () Bool)

(declare-fun e!670516 () Bool)

(assert (=> b!1179410 (= e!670516 e!670517)))

(declare-fun res!783567 () Bool)

(assert (=> b!1179410 (=> res!783567 e!670517)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179410 (= res!783567 (not (validKeyInArray!0 (select (arr!36752 _keys!1208) from!1455))))))

(declare-fun lt!533021 () ListLongMap!17051)

(assert (=> b!1179410 (= lt!533021 lt!533015)))

(declare-fun lt!533027 () ListLongMap!17051)

(declare-fun -!1584 (ListLongMap!17051 (_ BitVec 64)) ListLongMap!17051)

(assert (=> b!1179410 (= lt!533015 (-!1584 lt!533027 k!934))))

(declare-fun zeroValue!944 () V!44729)

(declare-fun lt!533026 () array!76207)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44729)

(declare-fun getCurrentListMapNoExtraKeys!4996 (array!76205 array!76207 (_ BitVec 32) (_ BitVec 32) V!44729 V!44729 (_ BitVec 32) Int) ListLongMap!17051)

(assert (=> b!1179410 (= lt!533021 (getCurrentListMapNoExtraKeys!4996 lt!533016 lt!533026 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179410 (= lt!533027 (getCurrentListMapNoExtraKeys!4996 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533028 () Unit!38970)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!811 (array!76205 array!76207 (_ BitVec 32) (_ BitVec 32) V!44729 V!44729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38970)

(assert (=> b!1179410 (= lt!533028 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!811 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179411 () Bool)

(declare-fun res!783570 () Bool)

(assert (=> b!1179411 (=> (not res!783570) (not e!670513))))

(assert (=> b!1179411 (= res!783570 (validKeyInArray!0 k!934))))

(declare-fun b!1179412 () Bool)

(declare-fun Unit!38973 () Unit!38970)

(assert (=> b!1179412 (= e!670521 Unit!38973)))

(declare-fun lt!533017 () Unit!38970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76205 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38970)

(assert (=> b!1179412 (= lt!533017 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179412 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533025 () Unit!38970)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76205 (_ BitVec 32) (_ BitVec 32)) Unit!38970)

(assert (=> b!1179412 (= lt!533025 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179412 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25816)))

(declare-fun lt!533022 () Unit!38970)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76205 (_ BitVec 64) (_ BitVec 32) List!25819) Unit!38970)

(assert (=> b!1179412 (= lt!533022 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25816))))

(assert (=> b!1179412 false))

(declare-fun b!1179413 () Bool)

(declare-fun lt!533018 () ListLongMap!17051)

(assert (=> b!1179413 (= e!670522 (= lt!533018 (+!3853 lt!533027 lt!533014)))))

(declare-fun b!1179414 () Bool)

(assert (=> b!1179414 (= e!670511 e!670516)))

(declare-fun res!783573 () Bool)

(assert (=> b!1179414 (=> res!783573 e!670516)))

(assert (=> b!1179414 (= res!783573 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1179414 (= lt!533023 (getCurrentListMapNoExtraKeys!4996 lt!533016 lt!533026 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179414 (= lt!533026 (array!76208 (store (arr!36753 _values!996) i!673 (ValueCellFull!14141 lt!533024)) (size!37289 _values!996)))))

(declare-fun dynLambda!2956 (Int (_ BitVec 64)) V!44729)

(assert (=> b!1179414 (= lt!533024 (dynLambda!2956 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1179414 (= lt!533018 (getCurrentListMapNoExtraKeys!4996 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179415 () Bool)

(declare-fun res!783563 () Bool)

(assert (=> b!1179415 (=> (not res!783563) (not e!670519))))

(assert (=> b!1179415 (= res!783563 (arrayNoDuplicates!0 lt!533016 #b00000000000000000000000000000000 Nil!25816))))

(declare-fun b!1179416 () Bool)

(declare-fun e!670510 () Bool)

(declare-fun e!670520 () Bool)

(assert (=> b!1179416 (= e!670510 (and e!670520 mapRes!46379))))

(declare-fun condMapEmpty!46379 () Bool)

(declare-fun mapDefault!46379 () ValueCell!14141)

