; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99862 () Bool)

(assert start!99862)

(declare-fun b_free!25441 () Bool)

(declare-fun b_next!25441 () Bool)

(assert (=> start!99862 (= b_free!25441 (not b_next!25441))))

(declare-fun tp!89037 () Bool)

(declare-fun b_and!41749 () Bool)

(assert (=> start!99862 (= tp!89037 b_and!41749)))

(declare-fun b!1187957 () Bool)

(declare-fun e!675467 () Bool)

(declare-fun e!675471 () Bool)

(assert (=> b!1187957 (= e!675467 (not e!675471))))

(declare-fun res!789829 () Bool)

(assert (=> b!1187957 (=> res!789829 e!675471)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187957 (= res!789829 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76737 0))(
  ( (array!76738 (arr!37018 (Array (_ BitVec 32) (_ BitVec 64))) (size!37554 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76737)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187957 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39405 0))(
  ( (Unit!39406) )
))
(declare-fun lt!540332 () Unit!39405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76737 (_ BitVec 64) (_ BitVec 32)) Unit!39405)

(assert (=> b!1187957 (= lt!540332 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1187958 () Bool)

(declare-fun res!789827 () Bool)

(declare-fun e!675469 () Bool)

(assert (=> b!1187958 (=> (not res!789827) (not e!675469))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76737 (_ BitVec 32)) Bool)

(assert (=> b!1187958 (= res!789827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187959 () Bool)

(declare-fun e!675474 () Bool)

(assert (=> b!1187959 (= e!675474 true)))

(declare-datatypes ((V!45089 0))(
  ( (V!45090 (val!15042 Int)) )
))
(declare-datatypes ((tuple2!19314 0))(
  ( (tuple2!19315 (_1!9668 (_ BitVec 64)) (_2!9668 V!45089)) )
))
(declare-datatypes ((List!26054 0))(
  ( (Nil!26051) (Cons!26050 (h!27259 tuple2!19314) (t!38487 List!26054)) )
))
(declare-datatypes ((ListLongMap!17283 0))(
  ( (ListLongMap!17284 (toList!8657 List!26054)) )
))
(declare-fun lt!540326 () ListLongMap!17283)

(declare-fun lt!540330 () ListLongMap!17283)

(declare-fun -!1687 (ListLongMap!17283 (_ BitVec 64)) ListLongMap!17283)

(assert (=> b!1187959 (= (-!1687 lt!540326 k!934) lt!540330)))

(declare-fun lt!540331 () ListLongMap!17283)

(declare-fun lt!540321 () V!45089)

(declare-fun lt!540324 () Unit!39405)

(declare-fun addRemoveCommutativeForDiffKeys!206 (ListLongMap!17283 (_ BitVec 64) V!45089 (_ BitVec 64)) Unit!39405)

(assert (=> b!1187959 (= lt!540324 (addRemoveCommutativeForDiffKeys!206 lt!540331 (select (arr!37018 _keys!1208) from!1455) lt!540321 k!934))))

(declare-fun lt!540327 () ListLongMap!17283)

(declare-fun lt!540334 () ListLongMap!17283)

(declare-fun lt!540328 () ListLongMap!17283)

(assert (=> b!1187959 (and (= lt!540334 lt!540326) (= lt!540327 lt!540328))))

(declare-fun lt!540329 () tuple2!19314)

(declare-fun +!3943 (ListLongMap!17283 tuple2!19314) ListLongMap!17283)

(assert (=> b!1187959 (= lt!540326 (+!3943 lt!540331 lt!540329))))

(assert (=> b!1187959 (not (= (select (arr!37018 _keys!1208) from!1455) k!934))))

(declare-fun lt!540322 () Unit!39405)

(declare-fun e!675476 () Unit!39405)

(assert (=> b!1187959 (= lt!540322 e!675476)))

(declare-fun c!117285 () Bool)

(assert (=> b!1187959 (= c!117285 (= (select (arr!37018 _keys!1208) from!1455) k!934))))

(declare-fun e!675477 () Bool)

(assert (=> b!1187959 e!675477))

(declare-fun res!789831 () Bool)

(assert (=> b!1187959 (=> (not res!789831) (not e!675477))))

(declare-fun lt!540337 () ListLongMap!17283)

(assert (=> b!1187959 (= res!789831 (= lt!540337 lt!540330))))

(assert (=> b!1187959 (= lt!540330 (+!3943 lt!540327 lt!540329))))

(assert (=> b!1187959 (= lt!540329 (tuple2!19315 (select (arr!37018 _keys!1208) from!1455) lt!540321))))

(declare-fun lt!540339 () V!45089)

(declare-datatypes ((ValueCell!14276 0))(
  ( (ValueCellFull!14276 (v!17680 V!45089)) (EmptyCell!14276) )
))
(declare-datatypes ((array!76739 0))(
  ( (array!76740 (arr!37019 (Array (_ BitVec 32) ValueCell!14276)) (size!37555 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76739)

(declare-fun get!18964 (ValueCell!14276 V!45089) V!45089)

(assert (=> b!1187959 (= lt!540321 (get!18964 (select (arr!37019 _values!996) from!1455) lt!540339))))

(declare-fun b!1187960 () Bool)

(declare-fun res!789835 () Bool)

(assert (=> b!1187960 (=> (not res!789835) (not e!675469))))

(assert (=> b!1187960 (= res!789835 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37554 _keys!1208))))))

(declare-fun mapNonEmpty!46784 () Bool)

(declare-fun mapRes!46784 () Bool)

(declare-fun tp!89036 () Bool)

(declare-fun e!675475 () Bool)

(assert (=> mapNonEmpty!46784 (= mapRes!46784 (and tp!89036 e!675475))))

(declare-fun mapValue!46784 () ValueCell!14276)

(declare-fun mapRest!46784 () (Array (_ BitVec 32) ValueCell!14276))

(declare-fun mapKey!46784 () (_ BitVec 32))

(assert (=> mapNonEmpty!46784 (= (arr!37019 _values!996) (store mapRest!46784 mapKey!46784 mapValue!46784))))

(declare-fun b!1187961 () Bool)

(declare-fun res!789828 () Bool)

(assert (=> b!1187961 (=> (not res!789828) (not e!675469))))

(declare-datatypes ((List!26055 0))(
  ( (Nil!26052) (Cons!26051 (h!27260 (_ BitVec 64)) (t!38488 List!26055)) )
))
(declare-fun arrayNoDuplicates!0 (array!76737 (_ BitVec 32) List!26055) Bool)

(assert (=> b!1187961 (= res!789828 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26052))))

(declare-fun b!1187962 () Bool)

(declare-fun res!789825 () Bool)

(assert (=> b!1187962 (=> (not res!789825) (not e!675469))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1187962 (= res!789825 (and (= (size!37555 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37554 _keys!1208) (size!37555 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187963 () Bool)

(declare-fun tp_is_empty!29971 () Bool)

(assert (=> b!1187963 (= e!675475 tp_is_empty!29971)))

(declare-fun b!1187964 () Bool)

(declare-fun e!675478 () Bool)

(assert (=> b!1187964 (= e!675471 e!675478)))

(declare-fun res!789834 () Bool)

(assert (=> b!1187964 (=> res!789834 e!675478)))

(assert (=> b!1187964 (= res!789834 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45089)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!540335 () array!76739)

(declare-fun minValue!944 () V!45089)

(declare-fun lt!540323 () array!76737)

(declare-fun getCurrentListMapNoExtraKeys!5098 (array!76737 array!76739 (_ BitVec 32) (_ BitVec 32) V!45089 V!45089 (_ BitVec 32) Int) ListLongMap!17283)

(assert (=> b!1187964 (= lt!540337 (getCurrentListMapNoExtraKeys!5098 lt!540323 lt!540335 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187964 (= lt!540335 (array!76740 (store (arr!37019 _values!996) i!673 (ValueCellFull!14276 lt!540339)) (size!37555 _values!996)))))

(declare-fun dynLambda!3044 (Int (_ BitVec 64)) V!45089)

(assert (=> b!1187964 (= lt!540339 (dynLambda!3044 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187964 (= lt!540334 (getCurrentListMapNoExtraKeys!5098 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187965 () Bool)

(declare-fun e!675472 () Bool)

(assert (=> b!1187965 (= e!675472 tp_is_empty!29971)))

(declare-fun res!789833 () Bool)

(assert (=> start!99862 (=> (not res!789833) (not e!675469))))

(assert (=> start!99862 (= res!789833 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37554 _keys!1208))))))

(assert (=> start!99862 e!675469))

(assert (=> start!99862 tp_is_empty!29971))

(declare-fun array_inv!28242 (array!76737) Bool)

(assert (=> start!99862 (array_inv!28242 _keys!1208)))

(assert (=> start!99862 true))

(assert (=> start!99862 tp!89037))

(declare-fun e!675473 () Bool)

(declare-fun array_inv!28243 (array!76739) Bool)

(assert (=> start!99862 (and (array_inv!28243 _values!996) e!675473)))

(declare-fun b!1187966 () Bool)

(declare-fun res!789836 () Bool)

(assert (=> b!1187966 (=> (not res!789836) (not e!675469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187966 (= res!789836 (validMask!0 mask!1564))))

(declare-fun b!1187967 () Bool)

(declare-fun res!789832 () Bool)

(assert (=> b!1187967 (=> (not res!789832) (not e!675467))))

(assert (=> b!1187967 (= res!789832 (arrayNoDuplicates!0 lt!540323 #b00000000000000000000000000000000 Nil!26052))))

(declare-fun b!1187968 () Bool)

(declare-fun Unit!39407 () Unit!39405)

(assert (=> b!1187968 (= e!675476 Unit!39407)))

(declare-fun lt!540336 () Unit!39405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76737 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39405)

(assert (=> b!1187968 (= lt!540336 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187968 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540333 () Unit!39405)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76737 (_ BitVec 32) (_ BitVec 32)) Unit!39405)

(assert (=> b!1187968 (= lt!540333 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187968 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26052)))

(declare-fun lt!540338 () Unit!39405)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76737 (_ BitVec 64) (_ BitVec 32) List!26055) Unit!39405)

(assert (=> b!1187968 (= lt!540338 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26052))))

(assert (=> b!1187968 false))

(declare-fun b!1187969 () Bool)

(declare-fun Unit!39408 () Unit!39405)

(assert (=> b!1187969 (= e!675476 Unit!39408)))

(declare-fun b!1187970 () Bool)

(assert (=> b!1187970 (= e!675478 e!675474)))

(declare-fun res!789826 () Bool)

(assert (=> b!1187970 (=> res!789826 e!675474)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187970 (= res!789826 (not (validKeyInArray!0 (select (arr!37018 _keys!1208) from!1455))))))

(assert (=> b!1187970 (= lt!540328 lt!540327)))

(assert (=> b!1187970 (= lt!540327 (-!1687 lt!540331 k!934))))

(assert (=> b!1187970 (= lt!540328 (getCurrentListMapNoExtraKeys!5098 lt!540323 lt!540335 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187970 (= lt!540331 (getCurrentListMapNoExtraKeys!5098 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540325 () Unit!39405)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!897 (array!76737 array!76739 (_ BitVec 32) (_ BitVec 32) V!45089 V!45089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39405)

(assert (=> b!1187970 (= lt!540325 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!897 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187971 () Bool)

(assert (=> b!1187971 (= e!675469 e!675467)))

(declare-fun res!789824 () Bool)

(assert (=> b!1187971 (=> (not res!789824) (not e!675467))))

(assert (=> b!1187971 (= res!789824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540323 mask!1564))))

(assert (=> b!1187971 (= lt!540323 (array!76738 (store (arr!37018 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37554 _keys!1208)))))

(declare-fun b!1187972 () Bool)

(assert (=> b!1187972 (= e!675473 (and e!675472 mapRes!46784))))

(declare-fun condMapEmpty!46784 () Bool)

(declare-fun mapDefault!46784 () ValueCell!14276)

