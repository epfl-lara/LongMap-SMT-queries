; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99530 () Bool)

(assert start!99530)

(declare-fun b_free!25109 () Bool)

(declare-fun b_next!25109 () Bool)

(assert (=> start!99530 (= b_free!25109 (not b_next!25109))))

(declare-fun tp!88040 () Bool)

(declare-fun b_and!41085 () Bool)

(assert (=> start!99530 (= tp!88040 b_and!41085)))

(declare-fun res!782077 () Bool)

(declare-fun e!669308 () Bool)

(assert (=> start!99530 (=> (not res!782077) (not e!669308))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76085 0))(
  ( (array!76086 (arr!36692 (Array (_ BitVec 32) (_ BitVec 64))) (size!37228 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76085)

(assert (=> start!99530 (= res!782077 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37228 _keys!1208))))))

(assert (=> start!99530 e!669308))

(declare-fun tp_is_empty!29639 () Bool)

(assert (=> start!99530 tp_is_empty!29639))

(declare-fun array_inv!28020 (array!76085) Bool)

(assert (=> start!99530 (array_inv!28020 _keys!1208)))

(assert (=> start!99530 true))

(assert (=> start!99530 tp!88040))

(declare-datatypes ((V!44645 0))(
  ( (V!44646 (val!14876 Int)) )
))
(declare-datatypes ((ValueCell!14110 0))(
  ( (ValueCellFull!14110 (v!17514 V!44645)) (EmptyCell!14110) )
))
(declare-datatypes ((array!76087 0))(
  ( (array!76088 (arr!36693 (Array (_ BitVec 32) ValueCell!14110)) (size!37229 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76087)

(declare-fun e!669302 () Bool)

(declare-fun array_inv!28021 (array!76087) Bool)

(assert (=> start!99530 (and (array_inv!28021 _values!996) e!669302)))

(declare-fun b!1177385 () Bool)

(declare-datatypes ((Unit!38881 0))(
  ( (Unit!38882) )
))
(declare-fun e!669307 () Unit!38881)

(declare-fun Unit!38883 () Unit!38881)

(assert (=> b!1177385 (= e!669307 Unit!38883)))

(declare-fun b!1177386 () Bool)

(declare-fun e!669306 () Bool)

(declare-fun e!669312 () Bool)

(assert (=> b!1177386 (= e!669306 (not e!669312))))

(declare-fun res!782086 () Bool)

(assert (=> b!1177386 (=> res!782086 e!669312)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177386 (= res!782086 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177386 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!531625 () Unit!38881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76085 (_ BitVec 64) (_ BitVec 32)) Unit!38881)

(assert (=> b!1177386 (= lt!531625 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun e!669310 () Bool)

(declare-datatypes ((tuple2!19032 0))(
  ( (tuple2!19033 (_1!9527 (_ BitVec 64)) (_2!9527 V!44645)) )
))
(declare-datatypes ((List!25769 0))(
  ( (Nil!25766) (Cons!25765 (h!26974 tuple2!19032) (t!37870 List!25769)) )
))
(declare-datatypes ((ListLongMap!17001 0))(
  ( (ListLongMap!17002 (toList!8516 List!25769)) )
))
(declare-fun lt!531621 () ListLongMap!17001)

(declare-fun lt!531624 () tuple2!19032)

(declare-fun lt!531629 () ListLongMap!17001)

(declare-fun b!1177387 () Bool)

(declare-fun +!3831 (ListLongMap!17001 tuple2!19032) ListLongMap!17001)

(assert (=> b!1177387 (= e!669310 (= lt!531621 (+!3831 lt!531629 lt!531624)))))

(declare-fun b!1177388 () Bool)

(declare-fun e!669311 () Bool)

(assert (=> b!1177388 (= e!669311 tp_is_empty!29639)))

(declare-fun b!1177389 () Bool)

(declare-fun res!782083 () Bool)

(assert (=> b!1177389 (=> (not res!782083) (not e!669308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177389 (= res!782083 (validKeyInArray!0 k!934))))

(declare-fun b!1177390 () Bool)

(declare-fun e!669301 () Bool)

(declare-fun e!669304 () Bool)

(assert (=> b!1177390 (= e!669301 e!669304)))

(declare-fun res!782084 () Bool)

(assert (=> b!1177390 (=> res!782084 e!669304)))

(assert (=> b!1177390 (= res!782084 (not (= (select (arr!36692 _keys!1208) from!1455) k!934)))))

(declare-fun b!1177391 () Bool)

(declare-fun Unit!38884 () Unit!38881)

(assert (=> b!1177391 (= e!669307 Unit!38884)))

(declare-fun lt!531627 () Unit!38881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76085 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38881)

(assert (=> b!1177391 (= lt!531627 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177391 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531620 () Unit!38881)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76085 (_ BitVec 32) (_ BitVec 32)) Unit!38881)

(assert (=> b!1177391 (= lt!531620 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25770 0))(
  ( (Nil!25767) (Cons!25766 (h!26975 (_ BitVec 64)) (t!37871 List!25770)) )
))
(declare-fun arrayNoDuplicates!0 (array!76085 (_ BitVec 32) List!25770) Bool)

(assert (=> b!1177391 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25767)))

(declare-fun lt!531623 () Unit!38881)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76085 (_ BitVec 64) (_ BitVec 32) List!25770) Unit!38881)

(assert (=> b!1177391 (= lt!531623 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25767))))

(assert (=> b!1177391 false))

(declare-fun b!1177392 () Bool)

(declare-fun res!782076 () Bool)

(assert (=> b!1177392 (=> (not res!782076) (not e!669306))))

(declare-fun lt!531631 () array!76085)

(assert (=> b!1177392 (= res!782076 (arrayNoDuplicates!0 lt!531631 #b00000000000000000000000000000000 Nil!25767))))

(declare-fun mapNonEmpty!46286 () Bool)

(declare-fun mapRes!46286 () Bool)

(declare-fun tp!88041 () Bool)

(declare-fun e!669309 () Bool)

(assert (=> mapNonEmpty!46286 (= mapRes!46286 (and tp!88041 e!669309))))

(declare-fun mapRest!46286 () (Array (_ BitVec 32) ValueCell!14110))

(declare-fun mapKey!46286 () (_ BitVec 32))

(declare-fun mapValue!46286 () ValueCell!14110)

(assert (=> mapNonEmpty!46286 (= (arr!36693 _values!996) (store mapRest!46286 mapKey!46286 mapValue!46286))))

(declare-fun b!1177393 () Bool)

(declare-fun res!782088 () Bool)

(assert (=> b!1177393 (=> (not res!782088) (not e!669308))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177393 (= res!782088 (validMask!0 mask!1564))))

(declare-fun b!1177394 () Bool)

(declare-fun e!669313 () Bool)

(declare-fun e!669303 () Bool)

(assert (=> b!1177394 (= e!669313 e!669303)))

(declare-fun res!782075 () Bool)

(assert (=> b!1177394 (=> res!782075 e!669303)))

(assert (=> b!1177394 (= res!782075 (not (validKeyInArray!0 (select (arr!36692 _keys!1208) from!1455))))))

(declare-fun lt!531619 () ListLongMap!17001)

(declare-fun lt!531633 () ListLongMap!17001)

(assert (=> b!1177394 (= lt!531619 lt!531633)))

(declare-fun -!1565 (ListLongMap!17001 (_ BitVec 64)) ListLongMap!17001)

(assert (=> b!1177394 (= lt!531633 (-!1565 lt!531629 k!934))))

(declare-fun zeroValue!944 () V!44645)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!531626 () array!76087)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44645)

(declare-fun getCurrentListMapNoExtraKeys!4973 (array!76085 array!76087 (_ BitVec 32) (_ BitVec 32) V!44645 V!44645 (_ BitVec 32) Int) ListLongMap!17001)

(assert (=> b!1177394 (= lt!531619 (getCurrentListMapNoExtraKeys!4973 lt!531631 lt!531626 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177394 (= lt!531629 (getCurrentListMapNoExtraKeys!4973 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531622 () Unit!38881)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!792 (array!76085 array!76087 (_ BitVec 32) (_ BitVec 32) V!44645 V!44645 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38881)

(assert (=> b!1177394 (= lt!531622 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!792 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177395 () Bool)

(declare-fun res!782079 () Bool)

(assert (=> b!1177395 (=> (not res!782079) (not e!669308))))

(assert (=> b!1177395 (= res!782079 (= (select (arr!36692 _keys!1208) i!673) k!934))))

(declare-fun b!1177396 () Bool)

(assert (=> b!1177396 (= e!669312 e!669313)))

(declare-fun res!782087 () Bool)

(assert (=> b!1177396 (=> res!782087 e!669313)))

(assert (=> b!1177396 (= res!782087 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!531628 () ListLongMap!17001)

(assert (=> b!1177396 (= lt!531628 (getCurrentListMapNoExtraKeys!4973 lt!531631 lt!531626 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531632 () V!44645)

(assert (=> b!1177396 (= lt!531626 (array!76088 (store (arr!36693 _values!996) i!673 (ValueCellFull!14110 lt!531632)) (size!37229 _values!996)))))

(declare-fun dynLambda!2936 (Int (_ BitVec 64)) V!44645)

(assert (=> b!1177396 (= lt!531632 (dynLambda!2936 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177396 (= lt!531621 (getCurrentListMapNoExtraKeys!4973 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46286 () Bool)

(assert (=> mapIsEmpty!46286 mapRes!46286))

(declare-fun b!1177397 () Bool)

(assert (=> b!1177397 (= e!669309 tp_is_empty!29639)))

(declare-fun b!1177398 () Bool)

(declare-fun res!782078 () Bool)

(assert (=> b!1177398 (=> (not res!782078) (not e!669308))))

(assert (=> b!1177398 (= res!782078 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37228 _keys!1208))))))

(declare-fun b!1177399 () Bool)

(assert (=> b!1177399 (= e!669303 true)))

(assert (=> b!1177399 e!669310))

(declare-fun res!782085 () Bool)

(assert (=> b!1177399 (=> (not res!782085) (not e!669310))))

(assert (=> b!1177399 (= res!782085 (not (= (select (arr!36692 _keys!1208) from!1455) k!934)))))

(declare-fun lt!531630 () Unit!38881)

(assert (=> b!1177399 (= lt!531630 e!669307)))

(declare-fun c!116787 () Bool)

(assert (=> b!1177399 (= c!116787 (= (select (arr!36692 _keys!1208) from!1455) k!934))))

(assert (=> b!1177399 e!669301))

(declare-fun res!782089 () Bool)

(assert (=> b!1177399 (=> (not res!782089) (not e!669301))))

(assert (=> b!1177399 (= res!782089 (= lt!531628 (+!3831 lt!531633 lt!531624)))))

(declare-fun get!18747 (ValueCell!14110 V!44645) V!44645)

(assert (=> b!1177399 (= lt!531624 (tuple2!19033 (select (arr!36692 _keys!1208) from!1455) (get!18747 (select (arr!36693 _values!996) from!1455) lt!531632)))))

(declare-fun b!1177400 () Bool)

(assert (=> b!1177400 (= e!669302 (and e!669311 mapRes!46286))))

(declare-fun condMapEmpty!46286 () Bool)

(declare-fun mapDefault!46286 () ValueCell!14110)

