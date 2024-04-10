; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98060 () Bool)

(assert start!98060)

(declare-fun b_free!23761 () Bool)

(declare-fun b_next!23761 () Bool)

(assert (=> start!98060 (= b_free!23761 (not b_next!23761))))

(declare-fun tp!83986 () Bool)

(declare-fun b_and!38305 () Bool)

(assert (=> start!98060 (= tp!83986 b_and!38305)))

(declare-fun b!1125898 () Bool)

(declare-fun e!640887 () Bool)

(declare-fun e!640881 () Bool)

(assert (=> b!1125898 (= e!640887 (not e!640881))))

(declare-fun res!752343 () Bool)

(assert (=> b!1125898 (=> res!752343 e!640881)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125898 (= res!752343 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73445 0))(
  ( (array!73446 (arr!35375 (Array (_ BitVec 32) (_ BitVec 64))) (size!35911 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73445)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125898 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36900 0))(
  ( (Unit!36901) )
))
(declare-fun lt!500025 () Unit!36900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73445 (_ BitVec 64) (_ BitVec 32)) Unit!36900)

(assert (=> b!1125898 (= lt!500025 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1125899 () Bool)

(declare-fun e!640886 () Bool)

(assert (=> b!1125899 (= e!640881 e!640886)))

(declare-fun res!752351 () Bool)

(assert (=> b!1125899 (=> res!752351 e!640886)))

(assert (=> b!1125899 (= res!752351 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42849 0))(
  ( (V!42850 (val!14202 Int)) )
))
(declare-fun zeroValue!944 () V!42849)

(declare-fun lt!500021 () array!73445)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42849)

(declare-datatypes ((ValueCell!13436 0))(
  ( (ValueCellFull!13436 (v!16835 V!42849)) (EmptyCell!13436) )
))
(declare-datatypes ((array!73447 0))(
  ( (array!73448 (arr!35376 (Array (_ BitVec 32) ValueCell!13436)) (size!35912 (_ BitVec 32))) )
))
(declare-fun lt!500023 () array!73447)

(declare-datatypes ((tuple2!17852 0))(
  ( (tuple2!17853 (_1!8937 (_ BitVec 64)) (_2!8937 V!42849)) )
))
(declare-datatypes ((List!24630 0))(
  ( (Nil!24627) (Cons!24626 (h!25835 tuple2!17852) (t!35383 List!24630)) )
))
(declare-datatypes ((ListLongMap!15821 0))(
  ( (ListLongMap!15822 (toList!7926 List!24630)) )
))
(declare-fun lt!500026 () ListLongMap!15821)

(declare-fun getCurrentListMapNoExtraKeys!4414 (array!73445 array!73447 (_ BitVec 32) (_ BitVec 32) V!42849 V!42849 (_ BitVec 32) Int) ListLongMap!15821)

(assert (=> b!1125899 (= lt!500026 (getCurrentListMapNoExtraKeys!4414 lt!500021 lt!500023 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73447)

(declare-fun dynLambda!2504 (Int (_ BitVec 64)) V!42849)

(assert (=> b!1125899 (= lt!500023 (array!73448 (store (arr!35376 _values!996) i!673 (ValueCellFull!13436 (dynLambda!2504 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35912 _values!996)))))

(declare-fun lt!500024 () ListLongMap!15821)

(assert (=> b!1125899 (= lt!500024 (getCurrentListMapNoExtraKeys!4414 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44254 () Bool)

(declare-fun mapRes!44254 () Bool)

(declare-fun tp!83987 () Bool)

(declare-fun e!640880 () Bool)

(assert (=> mapNonEmpty!44254 (= mapRes!44254 (and tp!83987 e!640880))))

(declare-fun mapValue!44254 () ValueCell!13436)

(declare-fun mapRest!44254 () (Array (_ BitVec 32) ValueCell!13436))

(declare-fun mapKey!44254 () (_ BitVec 32))

(assert (=> mapNonEmpty!44254 (= (arr!35376 _values!996) (store mapRest!44254 mapKey!44254 mapValue!44254))))

(declare-fun b!1125900 () Bool)

(declare-fun tp_is_empty!28291 () Bool)

(assert (=> b!1125900 (= e!640880 tp_is_empty!28291)))

(declare-fun b!1125901 () Bool)

(declare-fun res!752347 () Bool)

(declare-fun e!640885 () Bool)

(assert (=> b!1125901 (=> (not res!752347) (not e!640885))))

(assert (=> b!1125901 (= res!752347 (and (= (size!35912 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35911 _keys!1208) (size!35912 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125902 () Bool)

(declare-fun e!640884 () Bool)

(assert (=> b!1125902 (= e!640884 tp_is_empty!28291)))

(declare-fun b!1125903 () Bool)

(declare-fun res!752353 () Bool)

(assert (=> b!1125903 (=> (not res!752353) (not e!640885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125903 (= res!752353 (validKeyInArray!0 k!934))))

(declare-fun b!1125904 () Bool)

(declare-fun res!752349 () Bool)

(assert (=> b!1125904 (=> (not res!752349) (not e!640885))))

(declare-datatypes ((List!24631 0))(
  ( (Nil!24628) (Cons!24627 (h!25836 (_ BitVec 64)) (t!35384 List!24631)) )
))
(declare-fun arrayNoDuplicates!0 (array!73445 (_ BitVec 32) List!24631) Bool)

(assert (=> b!1125904 (= res!752349 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24628))))

(declare-fun b!1125905 () Bool)

(declare-fun e!640882 () Bool)

(declare-fun call!47566 () ListLongMap!15821)

(declare-fun call!47565 () ListLongMap!15821)

(assert (=> b!1125905 (= e!640882 (= call!47566 call!47565))))

(declare-fun b!1125907 () Bool)

(declare-fun res!752352 () Bool)

(assert (=> b!1125907 (=> (not res!752352) (not e!640885))))

(assert (=> b!1125907 (= res!752352 (= (select (arr!35375 _keys!1208) i!673) k!934))))

(declare-fun bm!47562 () Bool)

(assert (=> bm!47562 (= call!47565 (getCurrentListMapNoExtraKeys!4414 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125908 () Bool)

(declare-fun e!640883 () Bool)

(assert (=> b!1125908 (= e!640883 true)))

(declare-fun lt!500022 () Bool)

(declare-fun contains!6461 (ListLongMap!15821 (_ BitVec 64)) Bool)

(assert (=> b!1125908 (= lt!500022 (contains!6461 (getCurrentListMapNoExtraKeys!4414 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun mapIsEmpty!44254 () Bool)

(assert (=> mapIsEmpty!44254 mapRes!44254))

(declare-fun b!1125909 () Bool)

(declare-fun res!752346 () Bool)

(assert (=> b!1125909 (=> (not res!752346) (not e!640887))))

(assert (=> b!1125909 (= res!752346 (arrayNoDuplicates!0 lt!500021 #b00000000000000000000000000000000 Nil!24628))))

(declare-fun b!1125910 () Bool)

(declare-fun res!752341 () Bool)

(assert (=> b!1125910 (=> (not res!752341) (not e!640885))))

(assert (=> b!1125910 (= res!752341 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35911 _keys!1208))))))

(declare-fun b!1125911 () Bool)

(assert (=> b!1125911 (= e!640886 e!640883)))

(declare-fun res!752342 () Bool)

(assert (=> b!1125911 (=> res!752342 e!640883)))

(assert (=> b!1125911 (= res!752342 (not (= (select (arr!35375 _keys!1208) from!1455) k!934)))))

(assert (=> b!1125911 e!640882))

(declare-fun c!109632 () Bool)

(assert (=> b!1125911 (= c!109632 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500027 () Unit!36900)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!371 (array!73445 array!73447 (_ BitVec 32) (_ BitVec 32) V!42849 V!42849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36900)

(assert (=> b!1125911 (= lt!500027 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125912 () Bool)

(declare-fun res!752345 () Bool)

(assert (=> b!1125912 (=> (not res!752345) (not e!640885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73445 (_ BitVec 32)) Bool)

(assert (=> b!1125912 (= res!752345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125913 () Bool)

(declare-fun res!752348 () Bool)

(assert (=> b!1125913 (=> (not res!752348) (not e!640885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125913 (= res!752348 (validMask!0 mask!1564))))

(declare-fun bm!47563 () Bool)

(assert (=> bm!47563 (= call!47566 (getCurrentListMapNoExtraKeys!4414 lt!500021 lt!500023 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125906 () Bool)

(declare-fun e!640878 () Bool)

(assert (=> b!1125906 (= e!640878 (and e!640884 mapRes!44254))))

(declare-fun condMapEmpty!44254 () Bool)

(declare-fun mapDefault!44254 () ValueCell!13436)

