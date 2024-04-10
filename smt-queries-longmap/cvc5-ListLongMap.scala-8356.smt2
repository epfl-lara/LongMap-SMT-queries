; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101718 () Bool)

(assert start!101718)

(declare-fun b_free!26407 () Bool)

(declare-fun b_next!26407 () Bool)

(assert (=> start!101718 (= b_free!26407 (not b_next!26407))))

(declare-fun tp!92266 () Bool)

(declare-fun b_and!44075 () Bool)

(assert (=> start!101718 (= tp!92266 b_and!44075)))

(declare-fun b!1224029 () Bool)

(declare-fun e!695199 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!79005 0))(
  ( (array!79006 (arr!38129 (Array (_ BitVec 32) (_ BitVec 64))) (size!38665 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79005)

(assert (=> b!1224029 (= e!695199 (bvslt from!1455 (size!38665 _keys!1208)))))

(declare-fun e!695200 () Bool)

(assert (=> b!1224029 e!695200))

(declare-fun res!813320 () Bool)

(assert (=> b!1224029 (=> (not res!813320) (not e!695200))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1224029 (= res!813320 (not (= (select (arr!38129 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!40557 0))(
  ( (Unit!40558) )
))
(declare-fun lt!557252 () Unit!40557)

(declare-fun e!695197 () Unit!40557)

(assert (=> b!1224029 (= lt!557252 e!695197)))

(declare-fun c!120431 () Bool)

(assert (=> b!1224029 (= c!120431 (= (select (arr!38129 _keys!1208) from!1455) k!934))))

(declare-fun e!695191 () Bool)

(assert (=> b!1224029 e!695191))

(declare-fun res!813334 () Bool)

(assert (=> b!1224029 (=> (not res!813334) (not e!695191))))

(declare-datatypes ((V!46609 0))(
  ( (V!46610 (val!15612 Int)) )
))
(declare-datatypes ((tuple2!20120 0))(
  ( (tuple2!20121 (_1!10071 (_ BitVec 64)) (_2!10071 V!46609)) )
))
(declare-datatypes ((List!26920 0))(
  ( (Nil!26917) (Cons!26916 (h!28125 tuple2!20120) (t!40307 List!26920)) )
))
(declare-datatypes ((ListLongMap!18089 0))(
  ( (ListLongMap!18090 (toList!9060 List!26920)) )
))
(declare-fun lt!557256 () ListLongMap!18089)

(declare-fun lt!557261 () ListLongMap!18089)

(declare-fun lt!557249 () tuple2!20120)

(declare-fun +!4117 (ListLongMap!18089 tuple2!20120) ListLongMap!18089)

(assert (=> b!1224029 (= res!813334 (= lt!557256 (+!4117 lt!557261 lt!557249)))))

(declare-fun lt!557251 () V!46609)

(declare-datatypes ((ValueCell!14846 0))(
  ( (ValueCellFull!14846 (v!18274 V!46609)) (EmptyCell!14846) )
))
(declare-datatypes ((array!79007 0))(
  ( (array!79008 (arr!38130 (Array (_ BitVec 32) ValueCell!14846)) (size!38666 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79007)

(declare-fun get!19474 (ValueCell!14846 V!46609) V!46609)

(assert (=> b!1224029 (= lt!557249 (tuple2!20121 (select (arr!38129 _keys!1208) from!1455) (get!19474 (select (arr!38130 _values!996) from!1455) lt!557251)))))

(declare-fun b!1224030 () Bool)

(declare-fun Unit!40559 () Unit!40557)

(assert (=> b!1224030 (= e!695197 Unit!40559)))

(declare-fun b!1224031 () Bool)

(declare-fun res!813327 () Bool)

(assert (=> b!1224031 (=> (not res!813327) (not e!695200))))

(declare-fun lt!557255 () ListLongMap!18089)

(declare-fun lt!557257 () ListLongMap!18089)

(assert (=> b!1224031 (= res!813327 (= lt!557255 (+!4117 lt!557257 lt!557249)))))

(declare-fun b!1224032 () Bool)

(declare-fun res!813319 () Bool)

(declare-fun e!695194 () Bool)

(assert (=> b!1224032 (=> (not res!813319) (not e!695194))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224032 (= res!813319 (validMask!0 mask!1564))))

(declare-fun b!1224033 () Bool)

(declare-fun res!813321 () Bool)

(declare-fun e!695192 () Bool)

(assert (=> b!1224033 (=> (not res!813321) (not e!695192))))

(declare-fun lt!557258 () array!79005)

(declare-datatypes ((List!26921 0))(
  ( (Nil!26918) (Cons!26917 (h!28126 (_ BitVec 64)) (t!40308 List!26921)) )
))
(declare-fun arrayNoDuplicates!0 (array!79005 (_ BitVec 32) List!26921) Bool)

(assert (=> b!1224033 (= res!813321 (arrayNoDuplicates!0 lt!557258 #b00000000000000000000000000000000 Nil!26918))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1224034 () Bool)

(declare-fun e!695190 () Bool)

(declare-fun arrayContainsKey!0 (array!79005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224034 (= e!695190 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1224035 () Bool)

(declare-fun res!813325 () Bool)

(assert (=> b!1224035 (=> (not res!813325) (not e!695194))))

(assert (=> b!1224035 (= res!813325 (= (select (arr!38129 _keys!1208) i!673) k!934))))

(declare-fun b!1224036 () Bool)

(declare-fun e!695195 () Bool)

(declare-fun e!695189 () Bool)

(assert (=> b!1224036 (= e!695195 e!695189)))

(declare-fun res!813329 () Bool)

(assert (=> b!1224036 (=> res!813329 e!695189)))

(assert (=> b!1224036 (= res!813329 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!557248 () array!79007)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46609)

(declare-fun getCurrentListMapNoExtraKeys!5482 (array!79005 array!79007 (_ BitVec 32) (_ BitVec 32) V!46609 V!46609 (_ BitVec 32) Int) ListLongMap!18089)

(assert (=> b!1224036 (= lt!557256 (getCurrentListMapNoExtraKeys!5482 lt!557258 lt!557248 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1224036 (= lt!557248 (array!79008 (store (arr!38130 _values!996) i!673 (ValueCellFull!14846 lt!557251)) (size!38666 _values!996)))))

(declare-fun dynLambda!3355 (Int (_ BitVec 64)) V!46609)

(assert (=> b!1224036 (= lt!557251 (dynLambda!3355 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1224036 (= lt!557255 (getCurrentListMapNoExtraKeys!5482 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224038 () Bool)

(assert (=> b!1224038 (= e!695191 e!695190)))

(declare-fun res!813333 () Bool)

(assert (=> b!1224038 (=> res!813333 e!695190)))

(assert (=> b!1224038 (= res!813333 (not (= (select (arr!38129 _keys!1208) from!1455) k!934)))))

(declare-fun b!1224039 () Bool)

(declare-fun lt!557247 () ListLongMap!18089)

(assert (=> b!1224039 (= e!695200 (= lt!557261 lt!557247))))

(declare-fun b!1224040 () Bool)

(declare-fun Unit!40560 () Unit!40557)

(assert (=> b!1224040 (= e!695197 Unit!40560)))

(declare-fun lt!557260 () Unit!40557)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79005 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40557)

(assert (=> b!1224040 (= lt!557260 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224040 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557253 () Unit!40557)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79005 (_ BitVec 32) (_ BitVec 32)) Unit!40557)

(assert (=> b!1224040 (= lt!557253 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224040 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26918)))

(declare-fun lt!557254 () Unit!40557)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79005 (_ BitVec 64) (_ BitVec 32) List!26921) Unit!40557)

(assert (=> b!1224040 (= lt!557254 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26918))))

(assert (=> b!1224040 false))

(declare-fun b!1224041 () Bool)

(declare-fun res!813326 () Bool)

(assert (=> b!1224041 (=> (not res!813326) (not e!695194))))

(assert (=> b!1224041 (= res!813326 (and (= (size!38666 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38665 _keys!1208) (size!38666 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!48565 () Bool)

(declare-fun mapRes!48565 () Bool)

(declare-fun tp!92267 () Bool)

(declare-fun e!695196 () Bool)

(assert (=> mapNonEmpty!48565 (= mapRes!48565 (and tp!92267 e!695196))))

(declare-fun mapValue!48565 () ValueCell!14846)

(declare-fun mapKey!48565 () (_ BitVec 32))

(declare-fun mapRest!48565 () (Array (_ BitVec 32) ValueCell!14846))

(assert (=> mapNonEmpty!48565 (= (arr!38130 _values!996) (store mapRest!48565 mapKey!48565 mapValue!48565))))

(declare-fun b!1224042 () Bool)

(assert (=> b!1224042 (= e!695192 (not e!695195))))

(declare-fun res!813323 () Bool)

(assert (=> b!1224042 (=> res!813323 e!695195)))

(assert (=> b!1224042 (= res!813323 (bvsgt from!1455 i!673))))

(assert (=> b!1224042 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!557250 () Unit!40557)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79005 (_ BitVec 64) (_ BitVec 32)) Unit!40557)

(assert (=> b!1224042 (= lt!557250 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1224043 () Bool)

(declare-fun res!813328 () Bool)

(assert (=> b!1224043 (=> (not res!813328) (not e!695194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79005 (_ BitVec 32)) Bool)

(assert (=> b!1224043 (= res!813328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!48565 () Bool)

(assert (=> mapIsEmpty!48565 mapRes!48565))

(declare-fun b!1224044 () Bool)

(assert (=> b!1224044 (= e!695189 e!695199)))

(declare-fun res!813318 () Bool)

(assert (=> b!1224044 (=> res!813318 e!695199)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224044 (= res!813318 (not (validKeyInArray!0 (select (arr!38129 _keys!1208) from!1455))))))

(assert (=> b!1224044 (= lt!557247 lt!557261)))

(declare-fun -!1962 (ListLongMap!18089 (_ BitVec 64)) ListLongMap!18089)

(assert (=> b!1224044 (= lt!557261 (-!1962 lt!557257 k!934))))

(assert (=> b!1224044 (= lt!557247 (getCurrentListMapNoExtraKeys!5482 lt!557258 lt!557248 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224044 (= lt!557257 (getCurrentListMapNoExtraKeys!5482 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557259 () Unit!40557)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1169 (array!79005 array!79007 (_ BitVec 32) (_ BitVec 32) V!46609 V!46609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40557)

(assert (=> b!1224044 (= lt!557259 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1169 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224045 () Bool)

(declare-fun res!813322 () Bool)

(assert (=> b!1224045 (=> (not res!813322) (not e!695194))))

(assert (=> b!1224045 (= res!813322 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38665 _keys!1208))))))

(declare-fun b!1224046 () Bool)

(declare-fun e!695193 () Bool)

(declare-fun tp_is_empty!31111 () Bool)

(assert (=> b!1224046 (= e!695193 tp_is_empty!31111)))

(declare-fun b!1224047 () Bool)

(declare-fun res!813330 () Bool)

(assert (=> b!1224047 (=> (not res!813330) (not e!695194))))

(assert (=> b!1224047 (= res!813330 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26918))))

(declare-fun b!1224048 () Bool)

(declare-fun e!695188 () Bool)

(assert (=> b!1224048 (= e!695188 (and e!695193 mapRes!48565))))

(declare-fun condMapEmpty!48565 () Bool)

(declare-fun mapDefault!48565 () ValueCell!14846)

