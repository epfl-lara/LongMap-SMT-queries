; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99430 () Bool)

(assert start!99430)

(declare-fun b_free!25009 () Bool)

(declare-fun b_next!25009 () Bool)

(assert (=> start!99430 (= b_free!25009 (not b_next!25009))))

(declare-fun tp!87741 () Bool)

(declare-fun b_and!40885 () Bool)

(assert (=> start!99430 (= tp!87741 b_and!40885)))

(declare-fun b!1174223 () Bool)

(declare-datatypes ((Unit!38734 0))(
  ( (Unit!38735) )
))
(declare-fun e!667448 () Unit!38734)

(declare-fun Unit!38736 () Unit!38734)

(assert (=> b!1174223 (= e!667448 Unit!38736)))

(declare-fun b!1174224 () Bool)

(declare-fun e!667449 () Bool)

(declare-fun e!667444 () Bool)

(assert (=> b!1174224 (= e!667449 e!667444)))

(declare-fun res!779768 () Bool)

(assert (=> b!1174224 (=> res!779768 e!667444)))

(declare-datatypes ((array!75889 0))(
  ( (array!75890 (arr!36594 (Array (_ BitVec 32) (_ BitVec 64))) (size!37130 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75889)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174224 (= res!779768 (not (validKeyInArray!0 (select (arr!36594 _keys!1208) from!1455))))))

(declare-datatypes ((V!44513 0))(
  ( (V!44514 (val!14826 Int)) )
))
(declare-datatypes ((tuple2!18950 0))(
  ( (tuple2!18951 (_1!9486 (_ BitVec 64)) (_2!9486 V!44513)) )
))
(declare-datatypes ((List!25688 0))(
  ( (Nil!25685) (Cons!25684 (h!26893 tuple2!18950) (t!37689 List!25688)) )
))
(declare-datatypes ((ListLongMap!16919 0))(
  ( (ListLongMap!16920 (toList!8475 List!25688)) )
))
(declare-fun lt!529463 () ListLongMap!16919)

(declare-fun lt!529465 () ListLongMap!16919)

(assert (=> b!1174224 (= lt!529463 lt!529465)))

(declare-fun lt!529467 () ListLongMap!16919)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1536 (ListLongMap!16919 (_ BitVec 64)) ListLongMap!16919)

(assert (=> b!1174224 (= lt!529465 (-!1536 lt!529467 k!934))))

(declare-fun zeroValue!944 () V!44513)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14060 0))(
  ( (ValueCellFull!14060 (v!17464 V!44513)) (EmptyCell!14060) )
))
(declare-datatypes ((array!75891 0))(
  ( (array!75892 (arr!36595 (Array (_ BitVec 32) ValueCell!14060)) (size!37131 (_ BitVec 32))) )
))
(declare-fun lt!529458 () array!75891)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529466 () array!75889)

(declare-fun minValue!944 () V!44513)

(declare-fun getCurrentListMapNoExtraKeys!4936 (array!75889 array!75891 (_ BitVec 32) (_ BitVec 32) V!44513 V!44513 (_ BitVec 32) Int) ListLongMap!16919)

(assert (=> b!1174224 (= lt!529463 (getCurrentListMapNoExtraKeys!4936 lt!529466 lt!529458 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75891)

(assert (=> b!1174224 (= lt!529467 (getCurrentListMapNoExtraKeys!4936 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!529468 () Unit!38734)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!763 (array!75889 array!75891 (_ BitVec 32) (_ BitVec 32) V!44513 V!44513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38734)

(assert (=> b!1174224 (= lt!529468 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!763 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174225 () Bool)

(declare-fun res!779764 () Bool)

(declare-fun e!667450 () Bool)

(assert (=> b!1174225 (=> (not res!779764) (not e!667450))))

(declare-datatypes ((List!25689 0))(
  ( (Nil!25686) (Cons!25685 (h!26894 (_ BitVec 64)) (t!37690 List!25689)) )
))
(declare-fun arrayNoDuplicates!0 (array!75889 (_ BitVec 32) List!25689) Bool)

(assert (=> b!1174225 (= res!779764 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25686))))

(declare-fun b!1174226 () Bool)

(assert (=> b!1174226 (= e!667444 true)))

(assert (=> b!1174226 (not (= (select (arr!36594 _keys!1208) from!1455) k!934))))

(declare-fun lt!529461 () Unit!38734)

(assert (=> b!1174226 (= lt!529461 e!667448)))

(declare-fun c!116637 () Bool)

(assert (=> b!1174226 (= c!116637 (= (select (arr!36594 _keys!1208) from!1455) k!934))))

(declare-fun e!667441 () Bool)

(assert (=> b!1174226 e!667441))

(declare-fun res!779772 () Bool)

(assert (=> b!1174226 (=> (not res!779772) (not e!667441))))

(declare-fun lt!529469 () V!44513)

(declare-fun lt!529460 () ListLongMap!16919)

(declare-fun +!3793 (ListLongMap!16919 tuple2!18950) ListLongMap!16919)

(declare-fun get!18677 (ValueCell!14060 V!44513) V!44513)

(assert (=> b!1174226 (= res!779772 (= lt!529460 (+!3793 lt!529465 (tuple2!18951 (select (arr!36594 _keys!1208) from!1455) (get!18677 (select (arr!36595 _values!996) from!1455) lt!529469)))))))

(declare-fun b!1174227 () Bool)

(declare-fun res!779776 () Bool)

(assert (=> b!1174227 (=> (not res!779776) (not e!667450))))

(assert (=> b!1174227 (= res!779776 (and (= (size!37131 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37130 _keys!1208) (size!37131 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174228 () Bool)

(declare-fun Unit!38737 () Unit!38734)

(assert (=> b!1174228 (= e!667448 Unit!38737)))

(declare-fun lt!529457 () Unit!38734)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75889 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38734)

(assert (=> b!1174228 (= lt!529457 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174228 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529459 () Unit!38734)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75889 (_ BitVec 32) (_ BitVec 32)) Unit!38734)

(assert (=> b!1174228 (= lt!529459 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174228 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25686)))

(declare-fun lt!529462 () Unit!38734)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75889 (_ BitVec 64) (_ BitVec 32) List!25689) Unit!38734)

(assert (=> b!1174228 (= lt!529462 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25686))))

(assert (=> b!1174228 false))

(declare-fun b!1174229 () Bool)

(declare-fun e!667445 () Bool)

(declare-fun tp_is_empty!29539 () Bool)

(assert (=> b!1174229 (= e!667445 tp_is_empty!29539)))

(declare-fun b!1174230 () Bool)

(declare-fun res!779773 () Bool)

(assert (=> b!1174230 (=> (not res!779773) (not e!667450))))

(assert (=> b!1174230 (= res!779773 (validKeyInArray!0 k!934))))

(declare-fun b!1174231 () Bool)

(declare-fun res!779775 () Bool)

(declare-fun e!667442 () Bool)

(assert (=> b!1174231 (=> (not res!779775) (not e!667442))))

(assert (=> b!1174231 (= res!779775 (arrayNoDuplicates!0 lt!529466 #b00000000000000000000000000000000 Nil!25686))))

(declare-fun b!1174232 () Bool)

(declare-fun e!667447 () Bool)

(declare-fun e!667443 () Bool)

(declare-fun mapRes!46136 () Bool)

(assert (=> b!1174232 (= e!667447 (and e!667443 mapRes!46136))))

(declare-fun condMapEmpty!46136 () Bool)

(declare-fun mapDefault!46136 () ValueCell!14060)

