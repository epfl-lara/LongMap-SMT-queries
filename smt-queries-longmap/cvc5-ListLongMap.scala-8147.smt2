; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99748 () Bool)

(assert start!99748)

(declare-fun b_free!25327 () Bool)

(declare-fun b_next!25327 () Bool)

(assert (=> start!99748 (= b_free!25327 (not b_next!25327))))

(declare-fun tp!88694 () Bool)

(declare-fun b_and!41521 () Bool)

(assert (=> start!99748 (= tp!88694 b_and!41521)))

(declare-fun res!787262 () Bool)

(declare-fun e!673426 () Bool)

(assert (=> start!99748 (=> (not res!787262) (not e!673426))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76513 0))(
  ( (array!76514 (arr!36906 (Array (_ BitVec 32) (_ BitVec 64))) (size!37442 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76513)

(assert (=> start!99748 (= res!787262 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37442 _keys!1208))))))

(assert (=> start!99748 e!673426))

(declare-fun tp_is_empty!29857 () Bool)

(assert (=> start!99748 tp_is_empty!29857))

(declare-fun array_inv!28168 (array!76513) Bool)

(assert (=> start!99748 (array_inv!28168 _keys!1208)))

(assert (=> start!99748 true))

(assert (=> start!99748 tp!88694))

(declare-datatypes ((V!44937 0))(
  ( (V!44938 (val!14985 Int)) )
))
(declare-datatypes ((ValueCell!14219 0))(
  ( (ValueCellFull!14219 (v!17623 V!44937)) (EmptyCell!14219) )
))
(declare-datatypes ((array!76515 0))(
  ( (array!76516 (arr!36907 (Array (_ BitVec 32) ValueCell!14219)) (size!37443 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76515)

(declare-fun e!673421 () Bool)

(declare-fun array_inv!28169 (array!76515) Bool)

(assert (=> start!99748 (and (array_inv!28169 _values!996) e!673421)))

(declare-fun b!1184423 () Bool)

(declare-fun e!673419 () Bool)

(declare-fun e!673422 () Bool)

(assert (=> b!1184423 (= e!673419 e!673422)))

(declare-fun res!787270 () Bool)

(assert (=> b!1184423 (=> res!787270 e!673422)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1184423 (= res!787270 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44937)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537090 () array!76513)

(declare-datatypes ((tuple2!19214 0))(
  ( (tuple2!19215 (_1!9618 (_ BitVec 64)) (_2!9618 V!44937)) )
))
(declare-datatypes ((List!25954 0))(
  ( (Nil!25951) (Cons!25950 (h!27159 tuple2!19214) (t!38273 List!25954)) )
))
(declare-datatypes ((ListLongMap!17183 0))(
  ( (ListLongMap!17184 (toList!8607 List!25954)) )
))
(declare-fun lt!537088 () ListLongMap!17183)

(declare-fun lt!537072 () array!76515)

(declare-fun minValue!944 () V!44937)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5057 (array!76513 array!76515 (_ BitVec 32) (_ BitVec 32) V!44937 V!44937 (_ BitVec 32) Int) ListLongMap!17183)

(assert (=> b!1184423 (= lt!537088 (getCurrentListMapNoExtraKeys!5057 lt!537090 lt!537072 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!537083 () V!44937)

(assert (=> b!1184423 (= lt!537072 (array!76516 (store (arr!36907 _values!996) i!673 (ValueCellFull!14219 lt!537083)) (size!37443 _values!996)))))

(declare-fun dynLambda!3008 (Int (_ BitVec 64)) V!44937)

(assert (=> b!1184423 (= lt!537083 (dynLambda!3008 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!537089 () ListLongMap!17183)

(assert (=> b!1184423 (= lt!537089 (getCurrentListMapNoExtraKeys!5057 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184424 () Bool)

(declare-fun res!787273 () Bool)

(assert (=> b!1184424 (=> (not res!787273) (not e!673426))))

(assert (=> b!1184424 (= res!787273 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37442 _keys!1208))))))

(declare-fun b!1184425 () Bool)

(declare-fun e!673417 () Bool)

(assert (=> b!1184425 (= e!673417 tp_is_empty!29857)))

(declare-fun b!1184426 () Bool)

(declare-fun res!787267 () Bool)

(assert (=> b!1184426 (=> (not res!787267) (not e!673426))))

(declare-datatypes ((List!25955 0))(
  ( (Nil!25952) (Cons!25951 (h!27160 (_ BitVec 64)) (t!38274 List!25955)) )
))
(declare-fun arrayNoDuplicates!0 (array!76513 (_ BitVec 32) List!25955) Bool)

(assert (=> b!1184426 (= res!787267 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25952))))

(declare-fun b!1184427 () Bool)

(declare-fun e!673425 () Bool)

(assert (=> b!1184427 (= e!673425 (not e!673419))))

(declare-fun res!787261 () Bool)

(assert (=> b!1184427 (=> res!787261 e!673419)))

(assert (=> b!1184427 (= res!787261 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184427 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39215 0))(
  ( (Unit!39216) )
))
(declare-fun lt!537077 () Unit!39215)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76513 (_ BitVec 64) (_ BitVec 32)) Unit!39215)

(assert (=> b!1184427 (= lt!537077 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1184428 () Bool)

(declare-fun e!673415 () Unit!39215)

(declare-fun Unit!39217 () Unit!39215)

(assert (=> b!1184428 (= e!673415 Unit!39217)))

(declare-fun lt!537086 () Unit!39215)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76513 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39215)

(assert (=> b!1184428 (= lt!537086 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184428 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537075 () Unit!39215)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76513 (_ BitVec 32) (_ BitVec 32)) Unit!39215)

(assert (=> b!1184428 (= lt!537075 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184428 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25952)))

(declare-fun lt!537081 () Unit!39215)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76513 (_ BitVec 64) (_ BitVec 32) List!25955) Unit!39215)

(assert (=> b!1184428 (= lt!537081 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25952))))

(assert (=> b!1184428 false))

(declare-fun b!1184429 () Bool)

(declare-fun res!787264 () Bool)

(assert (=> b!1184429 (=> (not res!787264) (not e!673425))))

(assert (=> b!1184429 (= res!787264 (arrayNoDuplicates!0 lt!537090 #b00000000000000000000000000000000 Nil!25952))))

(declare-fun b!1184430 () Bool)

(assert (=> b!1184430 (= e!673426 e!673425)))

(declare-fun res!787271 () Bool)

(assert (=> b!1184430 (=> (not res!787271) (not e!673425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76513 (_ BitVec 32)) Bool)

(assert (=> b!1184430 (= res!787271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537090 mask!1564))))

(assert (=> b!1184430 (= lt!537090 (array!76514 (store (arr!36906 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37442 _keys!1208)))))

(declare-fun b!1184431 () Bool)

(declare-fun res!787268 () Bool)

(assert (=> b!1184431 (=> (not res!787268) (not e!673426))))

(assert (=> b!1184431 (= res!787268 (and (= (size!37443 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37442 _keys!1208) (size!37443 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184432 () Bool)

(declare-fun res!787259 () Bool)

(assert (=> b!1184432 (=> (not res!787259) (not e!673426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184432 (= res!787259 (validKeyInArray!0 k!934))))

(declare-fun b!1184433 () Bool)

(declare-fun res!787260 () Bool)

(assert (=> b!1184433 (=> (not res!787260) (not e!673426))))

(assert (=> b!1184433 (= res!787260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184434 () Bool)

(declare-fun e!673420 () Bool)

(assert (=> b!1184434 (= e!673420 true)))

(declare-fun lt!537087 () ListLongMap!17183)

(declare-fun lt!537076 () ListLongMap!17183)

(declare-fun -!1642 (ListLongMap!17183 (_ BitVec 64)) ListLongMap!17183)

(assert (=> b!1184434 (= (-!1642 lt!537087 k!934) lt!537076)))

(declare-fun lt!537079 () ListLongMap!17183)

(declare-fun lt!537084 () V!44937)

(declare-fun lt!537078 () Unit!39215)

(declare-fun addRemoveCommutativeForDiffKeys!167 (ListLongMap!17183 (_ BitVec 64) V!44937 (_ BitVec 64)) Unit!39215)

(assert (=> b!1184434 (= lt!537078 (addRemoveCommutativeForDiffKeys!167 lt!537079 (select (arr!36906 _keys!1208) from!1455) lt!537084 k!934))))

(declare-fun lt!537074 () ListLongMap!17183)

(declare-fun lt!537082 () ListLongMap!17183)

(assert (=> b!1184434 (and (= lt!537089 lt!537087) (= lt!537074 lt!537082))))

(declare-fun lt!537080 () tuple2!19214)

(declare-fun +!3904 (ListLongMap!17183 tuple2!19214) ListLongMap!17183)

(assert (=> b!1184434 (= lt!537087 (+!3904 lt!537079 lt!537080))))

(assert (=> b!1184434 (not (= (select (arr!36906 _keys!1208) from!1455) k!934))))

(declare-fun lt!537073 () Unit!39215)

(assert (=> b!1184434 (= lt!537073 e!673415)))

(declare-fun c!117114 () Bool)

(assert (=> b!1184434 (= c!117114 (= (select (arr!36906 _keys!1208) from!1455) k!934))))

(declare-fun e!673423 () Bool)

(assert (=> b!1184434 e!673423))

(declare-fun res!787272 () Bool)

(assert (=> b!1184434 (=> (not res!787272) (not e!673423))))

(assert (=> b!1184434 (= res!787272 (= lt!537088 lt!537076))))

(assert (=> b!1184434 (= lt!537076 (+!3904 lt!537074 lt!537080))))

(assert (=> b!1184434 (= lt!537080 (tuple2!19215 (select (arr!36906 _keys!1208) from!1455) lt!537084))))

(declare-fun get!18887 (ValueCell!14219 V!44937) V!44937)

(assert (=> b!1184434 (= lt!537084 (get!18887 (select (arr!36907 _values!996) from!1455) lt!537083))))

(declare-fun b!1184435 () Bool)

(declare-fun e!673424 () Bool)

(assert (=> b!1184435 (= e!673423 e!673424)))

(declare-fun res!787266 () Bool)

(assert (=> b!1184435 (=> res!787266 e!673424)))

(assert (=> b!1184435 (= res!787266 (not (= (select (arr!36906 _keys!1208) from!1455) k!934)))))

(declare-fun mapNonEmpty!46613 () Bool)

(declare-fun mapRes!46613 () Bool)

(declare-fun tp!88695 () Bool)

(declare-fun e!673416 () Bool)

(assert (=> mapNonEmpty!46613 (= mapRes!46613 (and tp!88695 e!673416))))

(declare-fun mapValue!46613 () ValueCell!14219)

(declare-fun mapRest!46613 () (Array (_ BitVec 32) ValueCell!14219))

(declare-fun mapKey!46613 () (_ BitVec 32))

(assert (=> mapNonEmpty!46613 (= (arr!36907 _values!996) (store mapRest!46613 mapKey!46613 mapValue!46613))))

(declare-fun b!1184436 () Bool)

(declare-fun res!787269 () Bool)

(assert (=> b!1184436 (=> (not res!787269) (not e!673426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184436 (= res!787269 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46613 () Bool)

(assert (=> mapIsEmpty!46613 mapRes!46613))

(declare-fun b!1184437 () Bool)

(declare-fun Unit!39218 () Unit!39215)

(assert (=> b!1184437 (= e!673415 Unit!39218)))

(declare-fun b!1184438 () Bool)

(assert (=> b!1184438 (= e!673416 tp_is_empty!29857)))

(declare-fun b!1184439 () Bool)

(declare-fun res!787265 () Bool)

(assert (=> b!1184439 (=> (not res!787265) (not e!673426))))

(assert (=> b!1184439 (= res!787265 (= (select (arr!36906 _keys!1208) i!673) k!934))))

(declare-fun b!1184440 () Bool)

(assert (=> b!1184440 (= e!673422 e!673420)))

(declare-fun res!787263 () Bool)

(assert (=> b!1184440 (=> res!787263 e!673420)))

(assert (=> b!1184440 (= res!787263 (not (validKeyInArray!0 (select (arr!36906 _keys!1208) from!1455))))))

(assert (=> b!1184440 (= lt!537082 lt!537074)))

(assert (=> b!1184440 (= lt!537074 (-!1642 lt!537079 k!934))))

(assert (=> b!1184440 (= lt!537082 (getCurrentListMapNoExtraKeys!5057 lt!537090 lt!537072 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184440 (= lt!537079 (getCurrentListMapNoExtraKeys!5057 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537085 () Unit!39215)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!862 (array!76513 array!76515 (_ BitVec 32) (_ BitVec 32) V!44937 V!44937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39215)

(assert (=> b!1184440 (= lt!537085 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!862 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184441 () Bool)

(assert (=> b!1184441 (= e!673421 (and e!673417 mapRes!46613))))

(declare-fun condMapEmpty!46613 () Bool)

(declare-fun mapDefault!46613 () ValueCell!14219)

