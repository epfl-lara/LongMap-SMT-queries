; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98402 () Bool)

(assert start!98402)

(declare-fun b_free!24007 () Bool)

(declare-fun b_next!24007 () Bool)

(assert (=> start!98402 (= b_free!24007 (not b_next!24007))))

(declare-fun tp!84732 () Bool)

(declare-fun b_and!38863 () Bool)

(assert (=> start!98402 (= tp!84732 b_and!38863)))

(declare-fun b!1135552 () Bool)

(declare-fun c!110956 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!504825 () Bool)

(assert (=> b!1135552 (= c!110956 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504825))))

(declare-datatypes ((Unit!37196 0))(
  ( (Unit!37197) )
))
(declare-fun e!646221 () Unit!37196)

(declare-fun e!646228 () Unit!37196)

(assert (=> b!1135552 (= e!646221 e!646228)))

(declare-fun b!1135553 () Bool)

(declare-fun res!757988 () Bool)

(declare-fun e!646219 () Bool)

(assert (=> b!1135553 (=> res!757988 e!646219)))

(declare-datatypes ((List!24838 0))(
  ( (Nil!24835) (Cons!24834 (h!26043 (_ BitVec 64)) (t!35837 List!24838)) )
))
(declare-fun noDuplicate!1598 (List!24838) Bool)

(assert (=> b!1135553 (= res!757988 (not (noDuplicate!1598 Nil!24835)))))

(declare-fun b!1135554 () Bool)

(declare-fun e!646220 () Unit!37196)

(assert (=> b!1135554 (= e!646220 e!646221)))

(declare-fun c!110958 () Bool)

(assert (=> b!1135554 (= c!110958 (and (not lt!504825) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!44630 () Bool)

(declare-fun mapRes!44630 () Bool)

(assert (=> mapIsEmpty!44630 mapRes!44630))

(declare-fun mapNonEmpty!44630 () Bool)

(declare-fun tp!84731 () Bool)

(declare-fun e!646222 () Bool)

(assert (=> mapNonEmpty!44630 (= mapRes!44630 (and tp!84731 e!646222))))

(declare-datatypes ((V!43177 0))(
  ( (V!43178 (val!14325 Int)) )
))
(declare-datatypes ((ValueCell!13559 0))(
  ( (ValueCellFull!13559 (v!16962 V!43177)) (EmptyCell!13559) )
))
(declare-fun mapRest!44630 () (Array (_ BitVec 32) ValueCell!13559))

(declare-fun mapKey!44630 () (_ BitVec 32))

(declare-datatypes ((array!73935 0))(
  ( (array!73936 (arr!35618 (Array (_ BitVec 32) ValueCell!13559)) (size!36154 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73935)

(declare-fun mapValue!44630 () ValueCell!13559)

(assert (=> mapNonEmpty!44630 (= (arr!35618 _values!996) (store mapRest!44630 mapKey!44630 mapValue!44630))))

(declare-fun res!757980 () Bool)

(declare-fun e!646229 () Bool)

(assert (=> start!98402 (=> (not res!757980) (not e!646229))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73937 0))(
  ( (array!73938 (arr!35619 (Array (_ BitVec 32) (_ BitVec 64))) (size!36155 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73937)

(assert (=> start!98402 (= res!757980 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36155 _keys!1208))))))

(assert (=> start!98402 e!646229))

(declare-fun tp_is_empty!28537 () Bool)

(assert (=> start!98402 tp_is_empty!28537))

(declare-fun array_inv!27312 (array!73937) Bool)

(assert (=> start!98402 (array_inv!27312 _keys!1208)))

(assert (=> start!98402 true))

(assert (=> start!98402 tp!84732))

(declare-fun e!646226 () Bool)

(declare-fun array_inv!27313 (array!73935) Bool)

(assert (=> start!98402 (and (array_inv!27313 _values!996) e!646226)))

(declare-fun bm!49623 () Bool)

(declare-fun call!49626 () Unit!37196)

(declare-fun call!49628 () Unit!37196)

(assert (=> bm!49623 (= call!49626 call!49628)))

(declare-fun b!1135555 () Bool)

(declare-fun res!757977 () Bool)

(declare-fun e!646216 () Bool)

(assert (=> b!1135555 (=> (not res!757977) (not e!646216))))

(declare-fun lt!504815 () array!73937)

(declare-fun arrayNoDuplicates!0 (array!73937 (_ BitVec 32) List!24838) Bool)

(assert (=> b!1135555 (= res!757977 (arrayNoDuplicates!0 lt!504815 #b00000000000000000000000000000000 Nil!24835))))

(declare-datatypes ((tuple2!18080 0))(
  ( (tuple2!18081 (_1!9051 (_ BitVec 64)) (_2!9051 V!43177)) )
))
(declare-datatypes ((List!24839 0))(
  ( (Nil!24836) (Cons!24835 (h!26044 tuple2!18080) (t!35838 List!24839)) )
))
(declare-datatypes ((ListLongMap!16049 0))(
  ( (ListLongMap!16050 (toList!8040 List!24839)) )
))
(declare-fun call!49631 () ListLongMap!16049)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!646230 () Bool)

(declare-fun call!49632 () ListLongMap!16049)

(declare-fun b!1135556 () Bool)

(declare-fun -!1202 (ListLongMap!16049 (_ BitVec 64)) ListLongMap!16049)

(assert (=> b!1135556 (= e!646230 (= call!49632 (-!1202 call!49631 k!934)))))

(declare-fun bm!49624 () Bool)

(declare-fun call!49629 () ListLongMap!16049)

(declare-fun call!49630 () ListLongMap!16049)

(assert (=> bm!49624 (= call!49629 call!49630)))

(declare-fun b!1135557 () Bool)

(declare-fun e!646218 () Bool)

(declare-fun e!646225 () Bool)

(assert (=> b!1135557 (= e!646218 e!646225)))

(declare-fun res!757979 () Bool)

(assert (=> b!1135557 (=> res!757979 e!646225)))

(assert (=> b!1135557 (= res!757979 (not (= (select (arr!35619 _keys!1208) from!1455) k!934)))))

(assert (=> b!1135557 e!646230))

(declare-fun c!110957 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135557 (= c!110957 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43177)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!504811 () Unit!37196)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43177)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!452 (array!73937 array!73935 (_ BitVec 32) (_ BitVec 32) V!43177 V!43177 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37196)

(assert (=> b!1135557 (= lt!504811 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!452 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135558 () Bool)

(declare-fun e!646224 () Bool)

(assert (=> b!1135558 (= e!646226 (and e!646224 mapRes!44630))))

(declare-fun condMapEmpty!44630 () Bool)

(declare-fun mapDefault!44630 () ValueCell!13559)

