; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99532 () Bool)

(assert start!99532)

(declare-fun b_free!25111 () Bool)

(declare-fun b_next!25111 () Bool)

(assert (=> start!99532 (= b_free!25111 (not b_next!25111))))

(declare-fun tp!88047 () Bool)

(declare-fun b_and!41089 () Bool)

(assert (=> start!99532 (= tp!88047 b_and!41089)))

(declare-fun b!1177450 () Bool)

(declare-fun e!669340 () Bool)

(declare-fun e!669352 () Bool)

(assert (=> b!1177450 (= e!669340 e!669352)))

(declare-fun res!782127 () Bool)

(assert (=> b!1177450 (=> res!782127 e!669352)))

(declare-datatypes ((array!76089 0))(
  ( (array!76090 (arr!36694 (Array (_ BitVec 32) (_ BitVec 64))) (size!37230 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76089)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177450 (= res!782127 (not (validKeyInArray!0 (select (arr!36694 _keys!1208) from!1455))))))

(declare-datatypes ((V!44649 0))(
  ( (V!44650 (val!14877 Int)) )
))
(declare-datatypes ((tuple2!19034 0))(
  ( (tuple2!19035 (_1!9528 (_ BitVec 64)) (_2!9528 V!44649)) )
))
(declare-datatypes ((List!25771 0))(
  ( (Nil!25768) (Cons!25767 (h!26976 tuple2!19034) (t!37874 List!25771)) )
))
(declare-datatypes ((ListLongMap!17003 0))(
  ( (ListLongMap!17004 (toList!8517 List!25771)) )
))
(declare-fun lt!531668 () ListLongMap!17003)

(declare-fun lt!531671 () ListLongMap!17003)

(assert (=> b!1177450 (= lt!531668 lt!531671)))

(declare-fun lt!531665 () ListLongMap!17003)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1566 (ListLongMap!17003 (_ BitVec 64)) ListLongMap!17003)

(assert (=> b!1177450 (= lt!531671 (-!1566 lt!531665 k!934))))

(declare-fun zeroValue!944 () V!44649)

(declare-datatypes ((ValueCell!14111 0))(
  ( (ValueCellFull!14111 (v!17515 V!44649)) (EmptyCell!14111) )
))
(declare-datatypes ((array!76091 0))(
  ( (array!76092 (arr!36695 (Array (_ BitVec 32) ValueCell!14111)) (size!37231 (_ BitVec 32))) )
))
(declare-fun lt!531672 () array!76091)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44649)

(declare-fun lt!531669 () array!76089)

(declare-fun getCurrentListMapNoExtraKeys!4974 (array!76089 array!76091 (_ BitVec 32) (_ BitVec 32) V!44649 V!44649 (_ BitVec 32) Int) ListLongMap!17003)

(assert (=> b!1177450 (= lt!531668 (getCurrentListMapNoExtraKeys!4974 lt!531669 lt!531672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76091)

(assert (=> b!1177450 (= lt!531665 (getCurrentListMapNoExtraKeys!4974 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38885 0))(
  ( (Unit!38886) )
))
(declare-fun lt!531673 () Unit!38885)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!793 (array!76089 array!76091 (_ BitVec 32) (_ BitVec 32) V!44649 V!44649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38885)

(assert (=> b!1177450 (= lt!531673 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!793 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177451 () Bool)

(assert (=> b!1177451 (= e!669352 true)))

(declare-fun e!669348 () Bool)

(assert (=> b!1177451 e!669348))

(declare-fun res!782131 () Bool)

(assert (=> b!1177451 (=> (not res!782131) (not e!669348))))

(assert (=> b!1177451 (= res!782131 (not (= (select (arr!36694 _keys!1208) from!1455) k!934)))))

(declare-fun lt!531667 () Unit!38885)

(declare-fun e!669341 () Unit!38885)

(assert (=> b!1177451 (= lt!531667 e!669341)))

(declare-fun c!116790 () Bool)

(assert (=> b!1177451 (= c!116790 (= (select (arr!36694 _keys!1208) from!1455) k!934))))

(declare-fun e!669349 () Bool)

(assert (=> b!1177451 e!669349))

(declare-fun res!782130 () Bool)

(assert (=> b!1177451 (=> (not res!782130) (not e!669349))))

(declare-fun lt!531674 () ListLongMap!17003)

(declare-fun lt!531678 () tuple2!19034)

(declare-fun +!3832 (ListLongMap!17003 tuple2!19034) ListLongMap!17003)

(assert (=> b!1177451 (= res!782130 (= lt!531674 (+!3832 lt!531671 lt!531678)))))

(declare-fun lt!531677 () V!44649)

(declare-fun get!18750 (ValueCell!14111 V!44649) V!44649)

(assert (=> b!1177451 (= lt!531678 (tuple2!19035 (select (arr!36694 _keys!1208) from!1455) (get!18750 (select (arr!36695 _values!996) from!1455) lt!531677)))))

(declare-fun b!1177452 () Bool)

(declare-fun Unit!38887 () Unit!38885)

(assert (=> b!1177452 (= e!669341 Unit!38887)))

(declare-fun lt!531676 () Unit!38885)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76089 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38885)

(assert (=> b!1177452 (= lt!531676 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177452 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531670 () Unit!38885)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76089 (_ BitVec 32) (_ BitVec 32)) Unit!38885)

(assert (=> b!1177452 (= lt!531670 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25772 0))(
  ( (Nil!25769) (Cons!25768 (h!26977 (_ BitVec 64)) (t!37875 List!25772)) )
))
(declare-fun arrayNoDuplicates!0 (array!76089 (_ BitVec 32) List!25772) Bool)

(assert (=> b!1177452 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25769)))

(declare-fun lt!531666 () Unit!38885)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76089 (_ BitVec 64) (_ BitVec 32) List!25772) Unit!38885)

(assert (=> b!1177452 (= lt!531666 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25769))))

(assert (=> b!1177452 false))

(declare-fun b!1177453 () Bool)

(declare-fun Unit!38888 () Unit!38885)

(assert (=> b!1177453 (= e!669341 Unit!38888)))

(declare-fun b!1177454 () Bool)

(declare-fun res!782134 () Bool)

(declare-fun e!669344 () Bool)

(assert (=> b!1177454 (=> (not res!782134) (not e!669344))))

(assert (=> b!1177454 (= res!782134 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25769))))

(declare-fun b!1177455 () Bool)

(declare-fun res!782129 () Bool)

(assert (=> b!1177455 (=> (not res!782129) (not e!669344))))

(assert (=> b!1177455 (= res!782129 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37230 _keys!1208))))))

(declare-fun b!1177456 () Bool)

(declare-fun res!782124 () Bool)

(assert (=> b!1177456 (=> (not res!782124) (not e!669344))))

(assert (=> b!1177456 (= res!782124 (validKeyInArray!0 k!934))))

(declare-fun b!1177457 () Bool)

(declare-fun e!669347 () Bool)

(assert (=> b!1177457 (= e!669347 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1177458 () Bool)

(declare-fun res!782135 () Bool)

(assert (=> b!1177458 (=> (not res!782135) (not e!669344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76089 (_ BitVec 32)) Bool)

(assert (=> b!1177458 (= res!782135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177459 () Bool)

(declare-fun res!782137 () Bool)

(assert (=> b!1177459 (=> (not res!782137) (not e!669344))))

(assert (=> b!1177459 (= res!782137 (and (= (size!37231 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37230 _keys!1208) (size!37231 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!782128 () Bool)

(assert (=> start!99532 (=> (not res!782128) (not e!669344))))

(assert (=> start!99532 (= res!782128 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37230 _keys!1208))))))

(assert (=> start!99532 e!669344))

(declare-fun tp_is_empty!29641 () Bool)

(assert (=> start!99532 tp_is_empty!29641))

(declare-fun array_inv!28022 (array!76089) Bool)

(assert (=> start!99532 (array_inv!28022 _keys!1208)))

(assert (=> start!99532 true))

(assert (=> start!99532 tp!88047))

(declare-fun e!669342 () Bool)

(declare-fun array_inv!28023 (array!76091) Bool)

(assert (=> start!99532 (and (array_inv!28023 _values!996) e!669342)))

(declare-fun mapNonEmpty!46289 () Bool)

(declare-fun mapRes!46289 () Bool)

(declare-fun tp!88046 () Bool)

(declare-fun e!669345 () Bool)

(assert (=> mapNonEmpty!46289 (= mapRes!46289 (and tp!88046 e!669345))))

(declare-fun mapValue!46289 () ValueCell!14111)

(declare-fun mapRest!46289 () (Array (_ BitVec 32) ValueCell!14111))

(declare-fun mapKey!46289 () (_ BitVec 32))

(assert (=> mapNonEmpty!46289 (= (arr!36695 _values!996) (store mapRest!46289 mapKey!46289 mapValue!46289))))

(declare-fun b!1177460 () Bool)

(assert (=> b!1177460 (= e!669349 e!669347)))

(declare-fun res!782132 () Bool)

(assert (=> b!1177460 (=> res!782132 e!669347)))

(assert (=> b!1177460 (= res!782132 (not (= (select (arr!36694 _keys!1208) from!1455) k!934)))))

(declare-fun b!1177461 () Bool)

(declare-fun res!782125 () Bool)

(assert (=> b!1177461 (=> (not res!782125) (not e!669344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177461 (= res!782125 (validMask!0 mask!1564))))

(declare-fun b!1177462 () Bool)

(declare-fun e!669343 () Bool)

(assert (=> b!1177462 (= e!669343 e!669340)))

(declare-fun res!782123 () Bool)

(assert (=> b!1177462 (=> res!782123 e!669340)))

(assert (=> b!1177462 (= res!782123 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1177462 (= lt!531674 (getCurrentListMapNoExtraKeys!4974 lt!531669 lt!531672 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177462 (= lt!531672 (array!76092 (store (arr!36695 _values!996) i!673 (ValueCellFull!14111 lt!531677)) (size!37231 _values!996)))))

(declare-fun dynLambda!2937 (Int (_ BitVec 64)) V!44649)

(assert (=> b!1177462 (= lt!531677 (dynLambda!2937 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531675 () ListLongMap!17003)

(assert (=> b!1177462 (= lt!531675 (getCurrentListMapNoExtraKeys!4974 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177463 () Bool)

(declare-fun e!669346 () Bool)

(assert (=> b!1177463 (= e!669346 (not e!669343))))

(declare-fun res!782122 () Bool)

(assert (=> b!1177463 (=> res!782122 e!669343)))

(assert (=> b!1177463 (= res!782122 (bvsgt from!1455 i!673))))

(assert (=> b!1177463 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!531664 () Unit!38885)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76089 (_ BitVec 64) (_ BitVec 32)) Unit!38885)

(assert (=> b!1177463 (= lt!531664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1177464 () Bool)

(assert (=> b!1177464 (= e!669344 e!669346)))

(declare-fun res!782126 () Bool)

(assert (=> b!1177464 (=> (not res!782126) (not e!669346))))

(assert (=> b!1177464 (= res!782126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531669 mask!1564))))

(assert (=> b!1177464 (= lt!531669 (array!76090 (store (arr!36694 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37230 _keys!1208)))))

(declare-fun b!1177465 () Bool)

(declare-fun res!782136 () Bool)

(assert (=> b!1177465 (=> (not res!782136) (not e!669346))))

(assert (=> b!1177465 (= res!782136 (arrayNoDuplicates!0 lt!531669 #b00000000000000000000000000000000 Nil!25769))))

(declare-fun b!1177466 () Bool)

(declare-fun res!782133 () Bool)

(assert (=> b!1177466 (=> (not res!782133) (not e!669344))))

(assert (=> b!1177466 (= res!782133 (= (select (arr!36694 _keys!1208) i!673) k!934))))

(declare-fun b!1177467 () Bool)

(declare-fun e!669351 () Bool)

(assert (=> b!1177467 (= e!669351 tp_is_empty!29641)))

(declare-fun b!1177468 () Bool)

(assert (=> b!1177468 (= e!669345 tp_is_empty!29641)))

(declare-fun mapIsEmpty!46289 () Bool)

(assert (=> mapIsEmpty!46289 mapRes!46289))

(declare-fun b!1177469 () Bool)

(assert (=> b!1177469 (= e!669342 (and e!669351 mapRes!46289))))

(declare-fun condMapEmpty!46289 () Bool)

(declare-fun mapDefault!46289 () ValueCell!14111)

