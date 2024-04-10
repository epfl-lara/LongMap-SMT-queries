; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98102 () Bool)

(assert start!98102)

(declare-fun b_free!23803 () Bool)

(declare-fun b_next!23803 () Bool)

(assert (=> start!98102 (= b_free!23803 (not b_next!23803))))

(declare-fun tp!84113 () Bool)

(declare-fun b_and!38389 () Bool)

(assert (=> start!98102 (= tp!84113 b_and!38389)))

(declare-fun b!1127083 () Bool)

(declare-fun res!753178 () Bool)

(declare-fun e!641517 () Bool)

(assert (=> b!1127083 (=> (not res!753178) (not e!641517))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73527 0))(
  ( (array!73528 (arr!35416 (Array (_ BitVec 32) (_ BitVec 64))) (size!35952 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73527)

(assert (=> b!1127083 (= res!753178 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35952 _keys!1208))))))

(declare-fun b!1127084 () Bool)

(declare-fun res!753179 () Bool)

(assert (=> b!1127084 (=> (not res!753179) (not e!641517))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73527 (_ BitVec 32)) Bool)

(assert (=> b!1127084 (= res!753179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!42905 0))(
  ( (V!42906 (val!14223 Int)) )
))
(declare-fun zeroValue!944 () V!42905)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17886 0))(
  ( (tuple2!17887 (_1!8954 (_ BitVec 64)) (_2!8954 V!42905)) )
))
(declare-datatypes ((List!24659 0))(
  ( (Nil!24656) (Cons!24655 (h!25864 tuple2!17886) (t!35454 List!24659)) )
))
(declare-datatypes ((ListLongMap!15855 0))(
  ( (ListLongMap!15856 (toList!7943 List!24659)) )
))
(declare-fun call!47692 () ListLongMap!15855)

(declare-datatypes ((ValueCell!13457 0))(
  ( (ValueCellFull!13457 (v!16856 V!42905)) (EmptyCell!13457) )
))
(declare-datatypes ((array!73529 0))(
  ( (array!73530 (arr!35417 (Array (_ BitVec 32) ValueCell!13457)) (size!35953 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73529)

(declare-fun bm!47688 () Bool)

(declare-fun minValue!944 () V!42905)

(declare-fun getCurrentListMapNoExtraKeys!4431 (array!73527 array!73529 (_ BitVec 32) (_ BitVec 32) V!42905 V!42905 (_ BitVec 32) Int) ListLongMap!15855)

(assert (=> bm!47688 (= call!47692 (getCurrentListMapNoExtraKeys!4431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127085 () Bool)

(declare-fun e!641513 () Bool)

(declare-fun e!641512 () Bool)

(assert (=> b!1127085 (= e!641513 (not e!641512))))

(declare-fun res!753180 () Bool)

(assert (=> b!1127085 (=> res!753180 e!641512)))

(assert (=> b!1127085 (= res!753180 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127085 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36932 0))(
  ( (Unit!36933) )
))
(declare-fun lt!500457 () Unit!36932)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73527 (_ BitVec 64) (_ BitVec 32)) Unit!36932)

(assert (=> b!1127085 (= lt!500457 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1127086 () Bool)

(declare-fun e!641515 () Bool)

(assert (=> b!1127086 (= e!641512 e!641515)))

(declare-fun res!753173 () Bool)

(assert (=> b!1127086 (=> res!753173 e!641515)))

(assert (=> b!1127086 (= res!753173 (not (= from!1455 i!673)))))

(declare-fun lt!500453 () ListLongMap!15855)

(declare-fun lt!500459 () array!73529)

(declare-fun lt!500458 () array!73527)

(assert (=> b!1127086 (= lt!500453 (getCurrentListMapNoExtraKeys!4431 lt!500458 lt!500459 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2518 (Int (_ BitVec 64)) V!42905)

(assert (=> b!1127086 (= lt!500459 (array!73530 (store (arr!35417 _values!996) i!673 (ValueCellFull!13457 (dynLambda!2518 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35953 _values!996)))))

(declare-fun lt!500455 () ListLongMap!15855)

(assert (=> b!1127086 (= lt!500455 (getCurrentListMapNoExtraKeys!4431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47689 () Bool)

(declare-fun call!47691 () ListLongMap!15855)

(assert (=> bm!47689 (= call!47691 (getCurrentListMapNoExtraKeys!4431 lt!500458 lt!500459 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127087 () Bool)

(declare-fun e!641508 () Bool)

(declare-fun tp_is_empty!28333 () Bool)

(assert (=> b!1127087 (= e!641508 tp_is_empty!28333)))

(declare-fun b!1127088 () Bool)

(declare-fun e!641509 () Bool)

(assert (=> b!1127088 (= e!641515 e!641509)))

(declare-fun res!753170 () Bool)

(assert (=> b!1127088 (=> res!753170 e!641509)))

(assert (=> b!1127088 (= res!753170 (not (= (select (arr!35416 _keys!1208) from!1455) k!934)))))

(declare-fun e!641511 () Bool)

(assert (=> b!1127088 e!641511))

(declare-fun c!109695 () Bool)

(assert (=> b!1127088 (= c!109695 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500456 () Unit!36932)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!386 (array!73527 array!73529 (_ BitVec 32) (_ BitVec 32) V!42905 V!42905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36932)

(assert (=> b!1127088 (= lt!500456 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127089 () Bool)

(declare-fun e!641514 () Bool)

(assert (=> b!1127089 (= e!641514 tp_is_empty!28333)))

(declare-fun b!1127090 () Bool)

(declare-fun e!641516 () Bool)

(declare-fun mapRes!44317 () Bool)

(assert (=> b!1127090 (= e!641516 (and e!641508 mapRes!44317))))

(declare-fun condMapEmpty!44317 () Bool)

(declare-fun mapDefault!44317 () ValueCell!13457)

