; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98480 () Bool)

(assert start!98480)

(declare-fun b_free!24085 () Bool)

(declare-fun b_next!24085 () Bool)

(assert (=> start!98480 (= b_free!24085 (not b_next!24085))))

(declare-fun tp!84965 () Bool)

(declare-fun b_and!39019 () Bool)

(assert (=> start!98480 (= tp!84965 b_and!39019)))

(declare-fun b!1139091 () Bool)

(declare-fun res!759754 () Bool)

(declare-fun e!648133 () Bool)

(assert (=> b!1139091 (=> (not res!759754) (not e!648133))))

(declare-datatypes ((array!74089 0))(
  ( (array!74090 (arr!35695 (Array (_ BitVec 32) (_ BitVec 64))) (size!36231 (_ BitVec 32))) )
))
(declare-fun lt!506897 () array!74089)

(declare-datatypes ((List!24910 0))(
  ( (Nil!24907) (Cons!24906 (h!26115 (_ BitVec 64)) (t!35987 List!24910)) )
))
(declare-fun arrayNoDuplicates!0 (array!74089 (_ BitVec 32) List!24910) Bool)

(assert (=> b!1139091 (= res!759754 (arrayNoDuplicates!0 lt!506897 #b00000000000000000000000000000000 Nil!24907))))

(declare-datatypes ((V!43281 0))(
  ( (V!43282 (val!14364 Int)) )
))
(declare-fun zeroValue!944 () V!43281)

(declare-datatypes ((tuple2!18154 0))(
  ( (tuple2!18155 (_1!9088 (_ BitVec 64)) (_2!9088 V!43281)) )
))
(declare-datatypes ((List!24911 0))(
  ( (Nil!24908) (Cons!24907 (h!26116 tuple2!18154) (t!35988 List!24911)) )
))
(declare-datatypes ((ListLongMap!16123 0))(
  ( (ListLongMap!16124 (toList!8077 List!24911)) )
))
(declare-fun call!50566 () ListLongMap!16123)

(declare-fun bm!50559 () Bool)

(declare-fun c!111623 () Bool)

(declare-fun lt!506883 () ListLongMap!16123)

(declare-fun c!111628 () Bool)

(declare-fun minValue!944 () V!43281)

(declare-fun +!3509 (ListLongMap!16123 tuple2!18154) ListLongMap!16123)

(assert (=> bm!50559 (= call!50566 (+!3509 lt!506883 (ite (or c!111623 c!111628) (tuple2!18155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1139092 () Bool)

(declare-datatypes ((Unit!37329 0))(
  ( (Unit!37330) )
))
(declare-fun e!648128 () Unit!37329)

(declare-fun Unit!37331 () Unit!37329)

(assert (=> b!1139092 (= e!648128 Unit!37331)))

(declare-fun b!1139093 () Bool)

(declare-fun e!648130 () Bool)

(declare-fun call!50567 () ListLongMap!16123)

(declare-fun call!50568 () ListLongMap!16123)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1228 (ListLongMap!16123 (_ BitVec 64)) ListLongMap!16123)

(assert (=> b!1139093 (= e!648130 (= call!50567 (-!1228 call!50568 k!934)))))

(declare-fun b!1139094 () Bool)

(declare-fun e!648121 () Bool)

(assert (=> b!1139094 (= e!648121 e!648133)))

(declare-fun res!759759 () Bool)

(assert (=> b!1139094 (=> (not res!759759) (not e!648133))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74089 (_ BitVec 32)) Bool)

(assert (=> b!1139094 (= res!759759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506897 mask!1564))))

(declare-fun _keys!1208 () array!74089)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139094 (= lt!506897 (array!74090 (store (arr!35695 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36231 _keys!1208)))))

(declare-fun b!1139095 () Bool)

(declare-fun res!759749 () Bool)

(assert (=> b!1139095 (=> (not res!759749) (not e!648121))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13598 0))(
  ( (ValueCellFull!13598 (v!17001 V!43281)) (EmptyCell!13598) )
))
(declare-datatypes ((array!74091 0))(
  ( (array!74092 (arr!35696 (Array (_ BitVec 32) ValueCell!13598)) (size!36232 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74091)

(assert (=> b!1139095 (= res!759749 (and (= (size!36232 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36231 _keys!1208) (size!36232 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139097 () Bool)

(declare-fun e!648129 () Bool)

(assert (=> b!1139097 (= e!648133 (not e!648129))))

(declare-fun res!759757 () Bool)

(assert (=> b!1139097 (=> res!759757 e!648129)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1139097 (= res!759757 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139097 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!506900 () Unit!37329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74089 (_ BitVec 64) (_ BitVec 32)) Unit!37329)

(assert (=> b!1139097 (= lt!506900 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1139098 () Bool)

(declare-fun res!759755 () Bool)

(assert (=> b!1139098 (=> (not res!759755) (not e!648121))))

(assert (=> b!1139098 (= res!759755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139099 () Bool)

(declare-fun e!648125 () Bool)

(declare-fun e!648135 () Bool)

(declare-fun mapRes!44747 () Bool)

(assert (=> b!1139099 (= e!648125 (and e!648135 mapRes!44747))))

(declare-fun condMapEmpty!44747 () Bool)

(declare-fun mapDefault!44747 () ValueCell!13598)

