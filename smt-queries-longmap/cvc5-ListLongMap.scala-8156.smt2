; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99802 () Bool)

(assert start!99802)

(declare-fun b_free!25381 () Bool)

(declare-fun b_next!25381 () Bool)

(assert (=> start!99802 (= b_free!25381 (not b_next!25381))))

(declare-fun tp!88856 () Bool)

(declare-fun b_and!41629 () Bool)

(assert (=> start!99802 (= tp!88856 b_and!41629)))

(declare-fun b!1186097 () Bool)

(declare-fun e!674393 () Bool)

(assert (=> b!1186097 (= e!674393 true)))

(declare-datatypes ((V!45009 0))(
  ( (V!45010 (val!15012 Int)) )
))
(declare-datatypes ((tuple2!19262 0))(
  ( (tuple2!19263 (_1!9642 (_ BitVec 64)) (_2!9642 V!45009)) )
))
(declare-datatypes ((List!26003 0))(
  ( (Nil!26000) (Cons!25999 (h!27208 tuple2!19262) (t!38376 List!26003)) )
))
(declare-datatypes ((ListLongMap!17231 0))(
  ( (ListLongMap!17232 (toList!8631 List!26003)) )
))
(declare-fun lt!538619 () ListLongMap!17231)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!538618 () ListLongMap!17231)

(declare-fun -!1663 (ListLongMap!17231 (_ BitVec 64)) ListLongMap!17231)

(assert (=> b!1186097 (= (-!1663 lt!538619 k!934) lt!538618)))

(declare-datatypes ((array!76619 0))(
  ( (array!76620 (arr!36959 (Array (_ BitVec 32) (_ BitVec 64))) (size!37495 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76619)

(declare-fun lt!538615 () V!45009)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!538629 () ListLongMap!17231)

(declare-datatypes ((Unit!39310 0))(
  ( (Unit!39311) )
))
(declare-fun lt!538617 () Unit!39310)

(declare-fun addRemoveCommutativeForDiffKeys!188 (ListLongMap!17231 (_ BitVec 64) V!45009 (_ BitVec 64)) Unit!39310)

(assert (=> b!1186097 (= lt!538617 (addRemoveCommutativeForDiffKeys!188 lt!538629 (select (arr!36959 _keys!1208) from!1455) lt!538615 k!934))))

(declare-fun lt!538613 () ListLongMap!17231)

(declare-fun lt!538627 () ListLongMap!17231)

(declare-fun lt!538621 () ListLongMap!17231)

(assert (=> b!1186097 (and (= lt!538627 lt!538619) (= lt!538613 lt!538621))))

(declare-fun lt!538626 () tuple2!19262)

(declare-fun +!3925 (ListLongMap!17231 tuple2!19262) ListLongMap!17231)

(assert (=> b!1186097 (= lt!538619 (+!3925 lt!538629 lt!538626))))

(assert (=> b!1186097 (not (= (select (arr!36959 _keys!1208) from!1455) k!934))))

(declare-fun lt!538620 () Unit!39310)

(declare-fun e!674387 () Unit!39310)

(assert (=> b!1186097 (= lt!538620 e!674387)))

(declare-fun c!117195 () Bool)

(assert (=> b!1186097 (= c!117195 (= (select (arr!36959 _keys!1208) from!1455) k!934))))

(declare-fun e!674397 () Bool)

(assert (=> b!1186097 e!674397))

(declare-fun res!788477 () Bool)

(assert (=> b!1186097 (=> (not res!788477) (not e!674397))))

(declare-fun lt!538623 () ListLongMap!17231)

(assert (=> b!1186097 (= res!788477 (= lt!538623 lt!538618))))

(assert (=> b!1186097 (= lt!538618 (+!3925 lt!538613 lt!538626))))

(assert (=> b!1186097 (= lt!538626 (tuple2!19263 (select (arr!36959 _keys!1208) from!1455) lt!538615))))

(declare-fun lt!538624 () V!45009)

(declare-datatypes ((ValueCell!14246 0))(
  ( (ValueCellFull!14246 (v!17650 V!45009)) (EmptyCell!14246) )
))
(declare-datatypes ((array!76621 0))(
  ( (array!76622 (arr!36960 (Array (_ BitVec 32) ValueCell!14246)) (size!37496 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76621)

(declare-fun get!18926 (ValueCell!14246 V!45009) V!45009)

(assert (=> b!1186097 (= lt!538615 (get!18926 (select (arr!36960 _values!996) from!1455) lt!538624))))

(declare-fun b!1186098 () Bool)

(declare-fun e!674392 () Bool)

(assert (=> b!1186098 (= e!674392 e!674393)))

(declare-fun res!788476 () Bool)

(assert (=> b!1186098 (=> res!788476 e!674393)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186098 (= res!788476 (not (validKeyInArray!0 (select (arr!36959 _keys!1208) from!1455))))))

(assert (=> b!1186098 (= lt!538621 lt!538613)))

(assert (=> b!1186098 (= lt!538613 (-!1663 lt!538629 k!934))))

(declare-fun zeroValue!944 () V!45009)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!538628 () array!76621)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!538616 () array!76619)

(declare-fun minValue!944 () V!45009)

(declare-fun getCurrentListMapNoExtraKeys!5076 (array!76619 array!76621 (_ BitVec 32) (_ BitVec 32) V!45009 V!45009 (_ BitVec 32) Int) ListLongMap!17231)

(assert (=> b!1186098 (= lt!538621 (getCurrentListMapNoExtraKeys!5076 lt!538616 lt!538628 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186098 (= lt!538629 (getCurrentListMapNoExtraKeys!5076 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!538611 () Unit!39310)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!878 (array!76619 array!76621 (_ BitVec 32) (_ BitVec 32) V!45009 V!45009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39310)

(assert (=> b!1186098 (= lt!538611 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!878 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186099 () Bool)

(declare-fun res!788483 () Bool)

(declare-fun e!674389 () Bool)

(assert (=> b!1186099 (=> (not res!788483) (not e!674389))))

(assert (=> b!1186099 (= res!788483 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37495 _keys!1208))))))

(declare-fun b!1186100 () Bool)

(declare-fun e!674395 () Bool)

(assert (=> b!1186100 (= e!674389 e!674395)))

(declare-fun res!788478 () Bool)

(assert (=> b!1186100 (=> (not res!788478) (not e!674395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76619 (_ BitVec 32)) Bool)

(assert (=> b!1186100 (= res!788478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538616 mask!1564))))

(assert (=> b!1186100 (= lt!538616 (array!76620 (store (arr!36959 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37495 _keys!1208)))))

(declare-fun b!1186101 () Bool)

(declare-fun e!674396 () Bool)

(declare-fun tp_is_empty!29911 () Bool)

(assert (=> b!1186101 (= e!674396 tp_is_empty!29911)))

(declare-fun b!1186102 () Bool)

(declare-fun Unit!39312 () Unit!39310)

(assert (=> b!1186102 (= e!674387 Unit!39312)))

(declare-fun b!1186103 () Bool)

(declare-fun e!674398 () Bool)

(assert (=> b!1186103 (= e!674398 tp_is_empty!29911)))

(declare-fun b!1186104 () Bool)

(declare-fun res!788474 () Bool)

(assert (=> b!1186104 (=> (not res!788474) (not e!674389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186104 (= res!788474 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46694 () Bool)

(declare-fun mapRes!46694 () Bool)

(declare-fun tp!88857 () Bool)

(assert (=> mapNonEmpty!46694 (= mapRes!46694 (and tp!88857 e!674396))))

(declare-fun mapValue!46694 () ValueCell!14246)

(declare-fun mapRest!46694 () (Array (_ BitVec 32) ValueCell!14246))

(declare-fun mapKey!46694 () (_ BitVec 32))

(assert (=> mapNonEmpty!46694 (= (arr!36960 _values!996) (store mapRest!46694 mapKey!46694 mapValue!46694))))

(declare-fun b!1186105 () Bool)

(declare-fun res!788480 () Bool)

(assert (=> b!1186105 (=> (not res!788480) (not e!674389))))

(assert (=> b!1186105 (= res!788480 (= (select (arr!36959 _keys!1208) i!673) k!934))))

(declare-fun res!788479 () Bool)

(assert (=> start!99802 (=> (not res!788479) (not e!674389))))

(assert (=> start!99802 (= res!788479 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37495 _keys!1208))))))

(assert (=> start!99802 e!674389))

(assert (=> start!99802 tp_is_empty!29911))

(declare-fun array_inv!28206 (array!76619) Bool)

(assert (=> start!99802 (array_inv!28206 _keys!1208)))

(assert (=> start!99802 true))

(assert (=> start!99802 tp!88856))

(declare-fun e!674394 () Bool)

(declare-fun array_inv!28207 (array!76621) Bool)

(assert (=> start!99802 (and (array_inv!28207 _values!996) e!674394)))

(declare-fun b!1186106 () Bool)

(declare-fun e!674390 () Bool)

(assert (=> b!1186106 (= e!674395 (not e!674390))))

(declare-fun res!788482 () Bool)

(assert (=> b!1186106 (=> res!788482 e!674390)))

(assert (=> b!1186106 (= res!788482 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186106 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!538625 () Unit!39310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76619 (_ BitVec 64) (_ BitVec 32)) Unit!39310)

(assert (=> b!1186106 (= lt!538625 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186107 () Bool)

(declare-fun res!788488 () Bool)

(assert (=> b!1186107 (=> (not res!788488) (not e!674389))))

(declare-datatypes ((List!26004 0))(
  ( (Nil!26001) (Cons!26000 (h!27209 (_ BitVec 64)) (t!38377 List!26004)) )
))
(declare-fun arrayNoDuplicates!0 (array!76619 (_ BitVec 32) List!26004) Bool)

(assert (=> b!1186107 (= res!788488 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26001))))

(declare-fun b!1186108 () Bool)

(declare-fun Unit!39313 () Unit!39310)

(assert (=> b!1186108 (= e!674387 Unit!39313)))

(declare-fun lt!538614 () Unit!39310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76619 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39310)

(assert (=> b!1186108 (= lt!538614 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186108 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538622 () Unit!39310)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76619 (_ BitVec 32) (_ BitVec 32)) Unit!39310)

(assert (=> b!1186108 (= lt!538622 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186108 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26001)))

(declare-fun lt!538612 () Unit!39310)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76619 (_ BitVec 64) (_ BitVec 32) List!26004) Unit!39310)

(assert (=> b!1186108 (= lt!538612 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26001))))

(assert (=> b!1186108 false))

(declare-fun b!1186109 () Bool)

(declare-fun res!788486 () Bool)

(assert (=> b!1186109 (=> (not res!788486) (not e!674389))))

(assert (=> b!1186109 (= res!788486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!674388 () Bool)

(declare-fun b!1186110 () Bool)

(assert (=> b!1186110 (= e!674388 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186111 () Bool)

(assert (=> b!1186111 (= e!674394 (and e!674398 mapRes!46694))))

(declare-fun condMapEmpty!46694 () Bool)

(declare-fun mapDefault!46694 () ValueCell!14246)

