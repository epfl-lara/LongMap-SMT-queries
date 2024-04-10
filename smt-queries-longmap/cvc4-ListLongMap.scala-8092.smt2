; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99422 () Bool)

(assert start!99422)

(declare-fun b_free!25001 () Bool)

(declare-fun b_next!25001 () Bool)

(assert (=> start!99422 (= b_free!25001 (not b_next!25001))))

(declare-fun tp!87716 () Bool)

(declare-fun b_and!40869 () Bool)

(assert (=> start!99422 (= tp!87716 b_and!40869)))

(declare-fun b!1173975 () Bool)

(declare-fun res!779584 () Bool)

(declare-fun e!667300 () Bool)

(assert (=> b!1173975 (=> (not res!779584) (not e!667300))))

(declare-datatypes ((array!75873 0))(
  ( (array!75874 (arr!36586 (Array (_ BitVec 32) (_ BitVec 64))) (size!37122 (_ BitVec 32))) )
))
(declare-fun lt!529295 () array!75873)

(declare-datatypes ((List!25682 0))(
  ( (Nil!25679) (Cons!25678 (h!26887 (_ BitVec 64)) (t!37675 List!25682)) )
))
(declare-fun arrayNoDuplicates!0 (array!75873 (_ BitVec 32) List!25682) Bool)

(assert (=> b!1173975 (= res!779584 (arrayNoDuplicates!0 lt!529295 #b00000000000000000000000000000000 Nil!25679))))

(declare-fun b!1173976 () Bool)

(declare-fun e!667296 () Bool)

(declare-fun e!667301 () Bool)

(assert (=> b!1173976 (= e!667296 e!667301)))

(declare-fun res!779585 () Bool)

(assert (=> b!1173976 (=> res!779585 e!667301)))

(declare-fun _keys!1208 () array!75873)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1173976 (= res!779585 (not (= (select (arr!36586 _keys!1208) from!1455) k!934)))))

(declare-fun b!1173977 () Bool)

(declare-fun res!779589 () Bool)

(declare-fun e!667298 () Bool)

(assert (=> b!1173977 (=> (not res!779589) (not e!667298))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75873 (_ BitVec 32)) Bool)

(assert (=> b!1173977 (= res!779589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173978 () Bool)

(assert (=> b!1173978 (= e!667298 e!667300)))

(declare-fun res!779586 () Bool)

(assert (=> b!1173978 (=> (not res!779586) (not e!667300))))

(assert (=> b!1173978 (= res!779586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529295 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173978 (= lt!529295 (array!75874 (store (arr!36586 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37122 _keys!1208)))))

(declare-fun mapNonEmpty!46124 () Bool)

(declare-fun mapRes!46124 () Bool)

(declare-fun tp!87717 () Bool)

(declare-fun e!667295 () Bool)

(assert (=> mapNonEmpty!46124 (= mapRes!46124 (and tp!87717 e!667295))))

(declare-fun mapKey!46124 () (_ BitVec 32))

(declare-datatypes ((V!44501 0))(
  ( (V!44502 (val!14822 Int)) )
))
(declare-datatypes ((ValueCell!14056 0))(
  ( (ValueCellFull!14056 (v!17460 V!44501)) (EmptyCell!14056) )
))
(declare-fun mapValue!46124 () ValueCell!14056)

(declare-fun mapRest!46124 () (Array (_ BitVec 32) ValueCell!14056))

(declare-datatypes ((array!75875 0))(
  ( (array!75876 (arr!36587 (Array (_ BitVec 32) ValueCell!14056)) (size!37123 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75875)

(assert (=> mapNonEmpty!46124 (= (arr!36587 _values!996) (store mapRest!46124 mapKey!46124 mapValue!46124))))

(declare-fun b!1173979 () Bool)

(declare-fun res!779583 () Bool)

(assert (=> b!1173979 (=> (not res!779583) (not e!667298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173979 (= res!779583 (validMask!0 mask!1564))))

(declare-fun b!1173980 () Bool)

(declare-fun tp_is_empty!29531 () Bool)

(assert (=> b!1173980 (= e!667295 tp_is_empty!29531)))

(declare-fun b!1173981 () Bool)

(declare-fun e!667297 () Bool)

(declare-fun e!667304 () Bool)

(assert (=> b!1173981 (= e!667297 e!667304)))

(declare-fun res!779592 () Bool)

(assert (=> b!1173981 (=> res!779592 e!667304)))

(assert (=> b!1173981 (= res!779592 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44501)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!529300 () array!75875)

(declare-datatypes ((tuple2!18944 0))(
  ( (tuple2!18945 (_1!9483 (_ BitVec 64)) (_2!9483 V!44501)) )
))
(declare-datatypes ((List!25683 0))(
  ( (Nil!25680) (Cons!25679 (h!26888 tuple2!18944) (t!37676 List!25683)) )
))
(declare-datatypes ((ListLongMap!16913 0))(
  ( (ListLongMap!16914 (toList!8472 List!25683)) )
))
(declare-fun lt!529298 () ListLongMap!16913)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44501)

(declare-fun getCurrentListMapNoExtraKeys!4933 (array!75873 array!75875 (_ BitVec 32) (_ BitVec 32) V!44501 V!44501 (_ BitVec 32) Int) ListLongMap!16913)

(assert (=> b!1173981 (= lt!529298 (getCurrentListMapNoExtraKeys!4933 lt!529295 lt!529300 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529293 () V!44501)

(assert (=> b!1173981 (= lt!529300 (array!75876 (store (arr!36587 _values!996) i!673 (ValueCellFull!14056 lt!529293)) (size!37123 _values!996)))))

(declare-fun dynLambda!2903 (Int (_ BitVec 64)) V!44501)

(assert (=> b!1173981 (= lt!529293 (dynLambda!2903 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529289 () ListLongMap!16913)

(assert (=> b!1173981 (= lt!529289 (getCurrentListMapNoExtraKeys!4933 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173982 () Bool)

(declare-datatypes ((Unit!38719 0))(
  ( (Unit!38720) )
))
(declare-fun e!667305 () Unit!38719)

(declare-fun Unit!38721 () Unit!38719)

(assert (=> b!1173982 (= e!667305 Unit!38721)))

(declare-fun b!1173983 () Bool)

(declare-fun res!779596 () Bool)

(assert (=> b!1173983 (=> (not res!779596) (not e!667298))))

(assert (=> b!1173983 (= res!779596 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37122 _keys!1208))))))

(declare-fun b!1173985 () Bool)

(declare-fun res!779591 () Bool)

(assert (=> b!1173985 (=> (not res!779591) (not e!667298))))

(assert (=> b!1173985 (= res!779591 (and (= (size!37123 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37122 _keys!1208) (size!37123 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173986 () Bool)

(declare-fun arrayContainsKey!0 (array!75873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173986 (= e!667301 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1173987 () Bool)

(declare-fun Unit!38722 () Unit!38719)

(assert (=> b!1173987 (= e!667305 Unit!38722)))

(declare-fun lt!529301 () Unit!38719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75873 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38719)

(assert (=> b!1173987 (= lt!529301 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1173987 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529290 () Unit!38719)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75873 (_ BitVec 32) (_ BitVec 32)) Unit!38719)

(assert (=> b!1173987 (= lt!529290 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173987 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25679)))

(declare-fun lt!529294 () Unit!38719)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75873 (_ BitVec 64) (_ BitVec 32) List!25682) Unit!38719)

(assert (=> b!1173987 (= lt!529294 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25679))))

(assert (=> b!1173987 false))

(declare-fun b!1173988 () Bool)

(declare-fun res!779587 () Bool)

(assert (=> b!1173988 (=> (not res!779587) (not e!667298))))

(assert (=> b!1173988 (= res!779587 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25679))))

(declare-fun b!1173989 () Bool)

(declare-fun res!779594 () Bool)

(assert (=> b!1173989 (=> (not res!779594) (not e!667298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173989 (= res!779594 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!46124 () Bool)

(assert (=> mapIsEmpty!46124 mapRes!46124))

(declare-fun b!1173990 () Bool)

(declare-fun e!667299 () Bool)

(assert (=> b!1173990 (= e!667304 e!667299)))

(declare-fun res!779582 () Bool)

(assert (=> b!1173990 (=> res!779582 e!667299)))

(assert (=> b!1173990 (= res!779582 (not (validKeyInArray!0 (select (arr!36586 _keys!1208) from!1455))))))

(declare-fun lt!529302 () ListLongMap!16913)

(declare-fun lt!529299 () ListLongMap!16913)

(assert (=> b!1173990 (= lt!529302 lt!529299)))

(declare-fun lt!529291 () ListLongMap!16913)

(declare-fun -!1533 (ListLongMap!16913 (_ BitVec 64)) ListLongMap!16913)

(assert (=> b!1173990 (= lt!529299 (-!1533 lt!529291 k!934))))

(assert (=> b!1173990 (= lt!529302 (getCurrentListMapNoExtraKeys!4933 lt!529295 lt!529300 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173990 (= lt!529291 (getCurrentListMapNoExtraKeys!4933 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529296 () Unit!38719)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!760 (array!75873 array!75875 (_ BitVec 32) (_ BitVec 32) V!44501 V!44501 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38719)

(assert (=> b!1173990 (= lt!529296 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!760 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173991 () Bool)

(assert (=> b!1173991 (= e!667300 (not e!667297))))

(declare-fun res!779595 () Bool)

(assert (=> b!1173991 (=> res!779595 e!667297)))

(assert (=> b!1173991 (= res!779595 (bvsgt from!1455 i!673))))

(assert (=> b!1173991 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!529297 () Unit!38719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75873 (_ BitVec 64) (_ BitVec 32)) Unit!38719)

(assert (=> b!1173991 (= lt!529297 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1173992 () Bool)

(declare-fun e!667306 () Bool)

(assert (=> b!1173992 (= e!667306 tp_is_empty!29531)))

(declare-fun res!779590 () Bool)

(assert (=> start!99422 (=> (not res!779590) (not e!667298))))

(assert (=> start!99422 (= res!779590 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37122 _keys!1208))))))

(assert (=> start!99422 e!667298))

(assert (=> start!99422 tp_is_empty!29531))

(declare-fun array_inv!27952 (array!75873) Bool)

(assert (=> start!99422 (array_inv!27952 _keys!1208)))

(assert (=> start!99422 true))

(assert (=> start!99422 tp!87716))

(declare-fun e!667302 () Bool)

(declare-fun array_inv!27953 (array!75875) Bool)

(assert (=> start!99422 (and (array_inv!27953 _values!996) e!667302)))

(declare-fun b!1173984 () Bool)

(assert (=> b!1173984 (= e!667299 true)))

(assert (=> b!1173984 (not (= (select (arr!36586 _keys!1208) from!1455) k!934))))

(declare-fun lt!529292 () Unit!38719)

(assert (=> b!1173984 (= lt!529292 e!667305)))

(declare-fun c!116625 () Bool)

(assert (=> b!1173984 (= c!116625 (= (select (arr!36586 _keys!1208) from!1455) k!934))))

(assert (=> b!1173984 e!667296))

(declare-fun res!779588 () Bool)

(assert (=> b!1173984 (=> (not res!779588) (not e!667296))))

(declare-fun +!3790 (ListLongMap!16913 tuple2!18944) ListLongMap!16913)

(declare-fun get!18670 (ValueCell!14056 V!44501) V!44501)

(assert (=> b!1173984 (= res!779588 (= lt!529298 (+!3790 lt!529299 (tuple2!18945 (select (arr!36586 _keys!1208) from!1455) (get!18670 (select (arr!36587 _values!996) from!1455) lt!529293)))))))

(declare-fun b!1173993 () Bool)

(declare-fun res!779593 () Bool)

(assert (=> b!1173993 (=> (not res!779593) (not e!667298))))

(assert (=> b!1173993 (= res!779593 (= (select (arr!36586 _keys!1208) i!673) k!934))))

(declare-fun b!1173994 () Bool)

(assert (=> b!1173994 (= e!667302 (and e!667306 mapRes!46124))))

(declare-fun condMapEmpty!46124 () Bool)

(declare-fun mapDefault!46124 () ValueCell!14056)

