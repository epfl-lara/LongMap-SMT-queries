; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101716 () Bool)

(assert start!101716)

(declare-fun b_free!26405 () Bool)

(declare-fun b_next!26405 () Bool)

(assert (=> start!101716 (= b_free!26405 (not b_next!26405))))

(declare-fun tp!92260 () Bool)

(declare-fun b_and!44071 () Bool)

(assert (=> start!101716 (= tp!92260 b_and!44071)))

(declare-fun b!1223962 () Bool)

(declare-fun res!813273 () Bool)

(declare-fun e!695150 () Bool)

(assert (=> b!1223962 (=> (not res!813273) (not e!695150))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223962 (= res!813273 (validMask!0 mask!1564))))

(declare-fun b!1223963 () Bool)

(declare-fun e!695152 () Bool)

(declare-fun e!695154 () Bool)

(assert (=> b!1223963 (= e!695152 (not e!695154))))

(declare-fun res!813280 () Bool)

(assert (=> b!1223963 (=> res!813280 e!695154)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1223963 (= res!813280 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!79001 0))(
  ( (array!79002 (arr!38127 (Array (_ BitVec 32) (_ BitVec 64))) (size!38663 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79001)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223963 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40553 0))(
  ( (Unit!40554) )
))
(declare-fun lt!557207 () Unit!40553)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79001 (_ BitVec 64) (_ BitVec 32)) Unit!40553)

(assert (=> b!1223963 (= lt!557207 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1223964 () Bool)

(assert (=> b!1223964 (= e!695150 e!695152)))

(declare-fun res!813281 () Bool)

(assert (=> b!1223964 (=> (not res!813281) (not e!695152))))

(declare-fun lt!557213 () array!79001)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79001 (_ BitVec 32)) Bool)

(assert (=> b!1223964 (= res!813281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557213 mask!1564))))

(assert (=> b!1223964 (= lt!557213 (array!79002 (store (arr!38127 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38663 _keys!1208)))))

(declare-fun b!1223966 () Bool)

(declare-fun e!695161 () Unit!40553)

(declare-fun Unit!40555 () Unit!40553)

(assert (=> b!1223966 (= e!695161 Unit!40555)))

(declare-fun b!1223967 () Bool)

(declare-fun res!813274 () Bool)

(assert (=> b!1223967 (=> (not res!813274) (not e!695150))))

(assert (=> b!1223967 (= res!813274 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38663 _keys!1208))))))

(declare-fun b!1223968 () Bool)

(declare-fun e!695151 () Bool)

(declare-fun tp_is_empty!31109 () Bool)

(assert (=> b!1223968 (= e!695151 tp_is_empty!31109)))

(declare-fun b!1223969 () Bool)

(declare-fun e!695160 () Bool)

(assert (=> b!1223969 (= e!695160 tp_is_empty!31109)))

(declare-fun b!1223970 () Bool)

(declare-fun e!695155 () Bool)

(declare-datatypes ((V!46605 0))(
  ( (V!46606 (val!15611 Int)) )
))
(declare-datatypes ((tuple2!20118 0))(
  ( (tuple2!20119 (_1!10070 (_ BitVec 64)) (_2!10070 V!46605)) )
))
(declare-datatypes ((List!26918 0))(
  ( (Nil!26915) (Cons!26914 (h!28123 tuple2!20118) (t!40303 List!26918)) )
))
(declare-datatypes ((ListLongMap!18087 0))(
  ( (ListLongMap!18088 (toList!9059 List!26918)) )
))
(declare-fun lt!557205 () ListLongMap!18087)

(declare-fun lt!557214 () ListLongMap!18087)

(assert (=> b!1223970 (= e!695155 (= lt!557205 lt!557214))))

(declare-fun e!695153 () Bool)

(assert (=> b!1223970 e!695153))

(declare-fun res!813268 () Bool)

(assert (=> b!1223970 (=> (not res!813268) (not e!695153))))

(assert (=> b!1223970 (= res!813268 (not (= (select (arr!38127 _keys!1208) from!1455) k!934)))))

(declare-fun lt!557209 () Unit!40553)

(assert (=> b!1223970 (= lt!557209 e!695161)))

(declare-fun c!120428 () Bool)

(assert (=> b!1223970 (= c!120428 (= (select (arr!38127 _keys!1208) from!1455) k!934))))

(declare-fun e!695158 () Bool)

(assert (=> b!1223970 e!695158))

(declare-fun res!813271 () Bool)

(assert (=> b!1223970 (=> (not res!813271) (not e!695158))))

(declare-fun lt!557215 () tuple2!20118)

(declare-fun lt!557206 () ListLongMap!18087)

(declare-fun +!4116 (ListLongMap!18087 tuple2!20118) ListLongMap!18087)

(assert (=> b!1223970 (= res!813271 (= lt!557206 (+!4116 lt!557205 lt!557215)))))

(declare-fun lt!557204 () V!46605)

(declare-datatypes ((ValueCell!14845 0))(
  ( (ValueCellFull!14845 (v!18273 V!46605)) (EmptyCell!14845) )
))
(declare-datatypes ((array!79003 0))(
  ( (array!79004 (arr!38128 (Array (_ BitVec 32) ValueCell!14845)) (size!38664 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79003)

(declare-fun get!19471 (ValueCell!14845 V!46605) V!46605)

(assert (=> b!1223970 (= lt!557215 (tuple2!20119 (select (arr!38127 _keys!1208) from!1455) (get!19471 (select (arr!38128 _values!996) from!1455) lt!557204)))))

(declare-fun mapIsEmpty!48562 () Bool)

(declare-fun mapRes!48562 () Bool)

(assert (=> mapIsEmpty!48562 mapRes!48562))

(declare-fun b!1223971 () Bool)

(declare-fun res!813279 () Bool)

(assert (=> b!1223971 (=> (not res!813279) (not e!695150))))

(assert (=> b!1223971 (= res!813279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223972 () Bool)

(declare-fun e!695156 () Bool)

(assert (=> b!1223972 (= e!695154 e!695156)))

(declare-fun res!813270 () Bool)

(assert (=> b!1223972 (=> res!813270 e!695156)))

(assert (=> b!1223972 (= res!813270 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46605)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46605)

(declare-fun lt!557211 () array!79003)

(declare-fun getCurrentListMapNoExtraKeys!5481 (array!79001 array!79003 (_ BitVec 32) (_ BitVec 32) V!46605 V!46605 (_ BitVec 32) Int) ListLongMap!18087)

(assert (=> b!1223972 (= lt!557206 (getCurrentListMapNoExtraKeys!5481 lt!557213 lt!557211 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1223972 (= lt!557211 (array!79004 (store (arr!38128 _values!996) i!673 (ValueCellFull!14845 lt!557204)) (size!38664 _values!996)))))

(declare-fun dynLambda!3354 (Int (_ BitVec 64)) V!46605)

(assert (=> b!1223972 (= lt!557204 (dynLambda!3354 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557210 () ListLongMap!18087)

(assert (=> b!1223972 (= lt!557210 (getCurrentListMapNoExtraKeys!5481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223973 () Bool)

(declare-fun e!695157 () Bool)

(assert (=> b!1223973 (= e!695157 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1223974 () Bool)

(assert (=> b!1223974 (= e!695156 e!695155)))

(declare-fun res!813277 () Bool)

(assert (=> b!1223974 (=> res!813277 e!695155)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223974 (= res!813277 (not (validKeyInArray!0 (select (arr!38127 _keys!1208) from!1455))))))

(assert (=> b!1223974 (= lt!557214 lt!557205)))

(declare-fun lt!557203 () ListLongMap!18087)

(declare-fun -!1961 (ListLongMap!18087 (_ BitVec 64)) ListLongMap!18087)

(assert (=> b!1223974 (= lt!557205 (-!1961 lt!557203 k!934))))

(assert (=> b!1223974 (= lt!557214 (getCurrentListMapNoExtraKeys!5481 lt!557213 lt!557211 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1223974 (= lt!557203 (getCurrentListMapNoExtraKeys!5481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557202 () Unit!40553)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1168 (array!79001 array!79003 (_ BitVec 32) (_ BitVec 32) V!46605 V!46605 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40553)

(assert (=> b!1223974 (= lt!557202 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1168 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223975 () Bool)

(declare-fun Unit!40556 () Unit!40553)

(assert (=> b!1223975 (= e!695161 Unit!40556)))

(declare-fun lt!557216 () Unit!40553)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79001 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40553)

(assert (=> b!1223975 (= lt!557216 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223975 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557212 () Unit!40553)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79001 (_ BitVec 32) (_ BitVec 32)) Unit!40553)

(assert (=> b!1223975 (= lt!557212 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26919 0))(
  ( (Nil!26916) (Cons!26915 (h!28124 (_ BitVec 64)) (t!40304 List!26919)) )
))
(declare-fun arrayNoDuplicates!0 (array!79001 (_ BitVec 32) List!26919) Bool)

(assert (=> b!1223975 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26916)))

(declare-fun lt!557208 () Unit!40553)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79001 (_ BitVec 64) (_ BitVec 32) List!26919) Unit!40553)

(assert (=> b!1223975 (= lt!557208 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26916))))

(assert (=> b!1223975 false))

(declare-fun b!1223976 () Bool)

(declare-fun res!813272 () Bool)

(assert (=> b!1223976 (=> (not res!813272) (not e!695150))))

(assert (=> b!1223976 (= res!813272 (validKeyInArray!0 k!934))))

(declare-fun b!1223977 () Bool)

(assert (=> b!1223977 (= e!695153 (= lt!557210 (+!4116 lt!557203 lt!557215)))))

(declare-fun mapNonEmpty!48562 () Bool)

(declare-fun tp!92261 () Bool)

(assert (=> mapNonEmpty!48562 (= mapRes!48562 (and tp!92261 e!695151))))

(declare-fun mapValue!48562 () ValueCell!14845)

(declare-fun mapRest!48562 () (Array (_ BitVec 32) ValueCell!14845))

(declare-fun mapKey!48562 () (_ BitVec 32))

(assert (=> mapNonEmpty!48562 (= (arr!38128 _values!996) (store mapRest!48562 mapKey!48562 mapValue!48562))))

(declare-fun b!1223965 () Bool)

(declare-fun res!813278 () Bool)

(assert (=> b!1223965 (=> (not res!813278) (not e!695150))))

(assert (=> b!1223965 (= res!813278 (= (select (arr!38127 _keys!1208) i!673) k!934))))

(declare-fun res!813282 () Bool)

(assert (=> start!101716 (=> (not res!813282) (not e!695150))))

(assert (=> start!101716 (= res!813282 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38663 _keys!1208))))))

(assert (=> start!101716 e!695150))

(assert (=> start!101716 tp_is_empty!31109))

(declare-fun array_inv!29006 (array!79001) Bool)

(assert (=> start!101716 (array_inv!29006 _keys!1208)))

(assert (=> start!101716 true))

(assert (=> start!101716 tp!92260))

(declare-fun e!695159 () Bool)

(declare-fun array_inv!29007 (array!79003) Bool)

(assert (=> start!101716 (and (array_inv!29007 _values!996) e!695159)))

(declare-fun b!1223978 () Bool)

(assert (=> b!1223978 (= e!695158 e!695157)))

(declare-fun res!813283 () Bool)

(assert (=> b!1223978 (=> res!813283 e!695157)))

(assert (=> b!1223978 (= res!813283 (not (= (select (arr!38127 _keys!1208) from!1455) k!934)))))

(declare-fun b!1223979 () Bool)

(declare-fun res!813269 () Bool)

(assert (=> b!1223979 (=> (not res!813269) (not e!695150))))

(assert (=> b!1223979 (= res!813269 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26916))))

(declare-fun b!1223980 () Bool)

(declare-fun res!813276 () Bool)

(assert (=> b!1223980 (=> (not res!813276) (not e!695152))))

(assert (=> b!1223980 (= res!813276 (arrayNoDuplicates!0 lt!557213 #b00000000000000000000000000000000 Nil!26916))))

(declare-fun b!1223981 () Bool)

(declare-fun res!813275 () Bool)

(assert (=> b!1223981 (=> (not res!813275) (not e!695150))))

(assert (=> b!1223981 (= res!813275 (and (= (size!38664 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38663 _keys!1208) (size!38664 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223982 () Bool)

(assert (=> b!1223982 (= e!695159 (and e!695160 mapRes!48562))))

(declare-fun condMapEmpty!48562 () Bool)

(declare-fun mapDefault!48562 () ValueCell!14845)

