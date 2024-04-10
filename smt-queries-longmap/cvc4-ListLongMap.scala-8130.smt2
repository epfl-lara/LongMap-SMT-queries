; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99650 () Bool)

(assert start!99650)

(declare-fun b_free!25229 () Bool)

(declare-fun b_next!25229 () Bool)

(assert (=> start!99650 (= b_free!25229 (not b_next!25229))))

(declare-fun tp!88400 () Bool)

(declare-fun b_and!41325 () Bool)

(assert (=> start!99650 (= tp!88400 b_and!41325)))

(declare-fun b!1181365 () Bool)

(declare-fun e!671650 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76321 0))(
  ( (array!76322 (arr!36810 (Array (_ BitVec 32) (_ BitVec 64))) (size!37346 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76321)

(assert (=> b!1181365 (= e!671650 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37346 _keys!1208))))))

(declare-fun e!671653 () Bool)

(assert (=> b!1181365 e!671653))

(declare-fun res!785041 () Bool)

(assert (=> b!1181365 (=> (not res!785041) (not e!671653))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1181365 (= res!785041 (not (= (select (arr!36810 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!39066 0))(
  ( (Unit!39067) )
))
(declare-fun lt!534330 () Unit!39066)

(declare-fun e!671648 () Unit!39066)

(assert (=> b!1181365 (= lt!534330 e!671648)))

(declare-fun c!116967 () Bool)

(assert (=> b!1181365 (= c!116967 (= (select (arr!36810 _keys!1208) from!1455) k!934))))

(declare-fun e!671642 () Bool)

(assert (=> b!1181365 e!671642))

(declare-fun res!785050 () Bool)

(assert (=> b!1181365 (=> (not res!785050) (not e!671642))))

(declare-datatypes ((V!44805 0))(
  ( (V!44806 (val!14936 Int)) )
))
(declare-datatypes ((tuple2!19132 0))(
  ( (tuple2!19133 (_1!9577 (_ BitVec 64)) (_2!9577 V!44805)) )
))
(declare-fun lt!534333 () tuple2!19132)

(declare-datatypes ((List!25873 0))(
  ( (Nil!25870) (Cons!25869 (h!27078 tuple2!19132) (t!38094 List!25873)) )
))
(declare-datatypes ((ListLongMap!17101 0))(
  ( (ListLongMap!17102 (toList!8566 List!25873)) )
))
(declare-fun lt!534326 () ListLongMap!17101)

(declare-fun lt!534331 () ListLongMap!17101)

(declare-fun +!3874 (ListLongMap!17101 tuple2!19132) ListLongMap!17101)

(assert (=> b!1181365 (= res!785050 (= lt!534326 (+!3874 lt!534331 lt!534333)))))

(declare-datatypes ((ValueCell!14170 0))(
  ( (ValueCellFull!14170 (v!17574 V!44805)) (EmptyCell!14170) )
))
(declare-datatypes ((array!76323 0))(
  ( (array!76324 (arr!36811 (Array (_ BitVec 32) ValueCell!14170)) (size!37347 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76323)

(declare-fun lt!534328 () V!44805)

(declare-fun get!18825 (ValueCell!14170 V!44805) V!44805)

(assert (=> b!1181365 (= lt!534333 (tuple2!19133 (select (arr!36810 _keys!1208) from!1455) (get!18825 (select (arr!36811 _values!996) from!1455) lt!534328)))))

(declare-fun b!1181366 () Bool)

(declare-fun e!671641 () Bool)

(assert (=> b!1181366 (= e!671641 e!671650)))

(declare-fun res!785046 () Bool)

(assert (=> b!1181366 (=> res!785046 e!671650)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181366 (= res!785046 (not (validKeyInArray!0 (select (arr!36810 _keys!1208) from!1455))))))

(declare-fun lt!534323 () ListLongMap!17101)

(assert (=> b!1181366 (= lt!534323 lt!534331)))

(declare-fun lt!534329 () ListLongMap!17101)

(declare-fun -!1606 (ListLongMap!17101 (_ BitVec 64)) ListLongMap!17101)

(assert (=> b!1181366 (= lt!534331 (-!1606 lt!534329 k!934))))

(declare-fun zeroValue!944 () V!44805)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!534319 () array!76323)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!534327 () array!76321)

(declare-fun minValue!944 () V!44805)

(declare-fun getCurrentListMapNoExtraKeys!5019 (array!76321 array!76323 (_ BitVec 32) (_ BitVec 32) V!44805 V!44805 (_ BitVec 32) Int) ListLongMap!17101)

(assert (=> b!1181366 (= lt!534323 (getCurrentListMapNoExtraKeys!5019 lt!534327 lt!534319 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181366 (= lt!534329 (getCurrentListMapNoExtraKeys!5019 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!534321 () Unit!39066)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!833 (array!76321 array!76323 (_ BitVec 32) (_ BitVec 32) V!44805 V!44805 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39066)

(assert (=> b!1181366 (= lt!534321 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!833 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46466 () Bool)

(declare-fun mapRes!46466 () Bool)

(declare-fun tp!88401 () Bool)

(declare-fun e!671651 () Bool)

(assert (=> mapNonEmpty!46466 (= mapRes!46466 (and tp!88401 e!671651))))

(declare-fun mapValue!46466 () ValueCell!14170)

(declare-fun mapKey!46466 () (_ BitVec 32))

(declare-fun mapRest!46466 () (Array (_ BitVec 32) ValueCell!14170))

(assert (=> mapNonEmpty!46466 (= (arr!36811 _values!996) (store mapRest!46466 mapKey!46466 mapValue!46466))))

(declare-fun b!1181368 () Bool)

(declare-fun e!671646 () Bool)

(assert (=> b!1181368 (= e!671642 e!671646)))

(declare-fun res!785048 () Bool)

(assert (=> b!1181368 (=> res!785048 e!671646)))

(assert (=> b!1181368 (= res!785048 (not (= (select (arr!36810 _keys!1208) from!1455) k!934)))))

(declare-fun b!1181369 () Bool)

(declare-fun e!671647 () Bool)

(declare-fun e!671645 () Bool)

(assert (=> b!1181369 (= e!671647 (and e!671645 mapRes!46466))))

(declare-fun condMapEmpty!46466 () Bool)

(declare-fun mapDefault!46466 () ValueCell!14170)

