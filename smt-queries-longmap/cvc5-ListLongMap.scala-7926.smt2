; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98396 () Bool)

(assert start!98396)

(declare-fun b_free!24001 () Bool)

(declare-fun b_next!24001 () Bool)

(assert (=> start!98396 (= b_free!24001 (not b_next!24001))))

(declare-fun tp!84714 () Bool)

(declare-fun b_and!38851 () Bool)

(assert (=> start!98396 (= tp!84714 b_and!38851)))

(declare-fun bm!49551 () Bool)

(declare-datatypes ((Unit!37191 0))(
  ( (Unit!37192) )
))
(declare-fun call!49557 () Unit!37191)

(declare-fun call!49558 () Unit!37191)

(assert (=> bm!49551 (= call!49557 call!49558)))

(declare-fun mapIsEmpty!44621 () Bool)

(declare-fun mapRes!44621 () Bool)

(assert (=> mapIsEmpty!44621 mapRes!44621))

(declare-fun bm!49552 () Bool)

(declare-datatypes ((V!43169 0))(
  ( (V!43170 (val!14322 Int)) )
))
(declare-datatypes ((tuple2!18074 0))(
  ( (tuple2!18075 (_1!9048 (_ BitVec 64)) (_2!9048 V!43169)) )
))
(declare-datatypes ((List!24832 0))(
  ( (Nil!24829) (Cons!24828 (h!26037 tuple2!18074) (t!35825 List!24832)) )
))
(declare-datatypes ((ListLongMap!16043 0))(
  ( (ListLongMap!16044 (toList!8037 List!24832)) )
))
(declare-fun call!49561 () ListLongMap!16043)

(declare-fun call!49559 () ListLongMap!16043)

(assert (=> bm!49552 (= call!49561 call!49559)))

(declare-fun b!1135268 () Bool)

(declare-fun res!757819 () Bool)

(declare-fun e!646068 () Bool)

(assert (=> b!1135268 (=> (not res!757819) (not e!646068))))

(declare-datatypes ((array!73923 0))(
  ( (array!73924 (arr!35612 (Array (_ BitVec 32) (_ BitVec 64))) (size!36148 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73923)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13556 0))(
  ( (ValueCellFull!13556 (v!16959 V!43169)) (EmptyCell!13556) )
))
(declare-datatypes ((array!73925 0))(
  ( (array!73926 (arr!35613 (Array (_ BitVec 32) ValueCell!13556)) (size!36149 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73925)

(assert (=> b!1135268 (= res!757819 (and (= (size!36149 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36148 _keys!1208) (size!36149 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!43169)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!49553 () Bool)

(declare-fun call!49555 () ListLongMap!16043)

(declare-fun minValue!944 () V!43169)

(declare-fun getCurrentListMapNoExtraKeys!4523 (array!73923 array!73925 (_ BitVec 32) (_ BitVec 32) V!43169 V!43169 (_ BitVec 32) Int) ListLongMap!16043)

(assert (=> bm!49553 (= call!49555 (getCurrentListMapNoExtraKeys!4523 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135269 () Bool)

(declare-fun e!646066 () Unit!37191)

(declare-fun lt!504656 () Unit!37191)

(assert (=> b!1135269 (= e!646066 lt!504656)))

(declare-fun lt!504662 () Unit!37191)

(declare-fun lt!504667 () ListLongMap!16043)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun addStillContains!737 (ListLongMap!16043 (_ BitVec 64) V!43169 (_ BitVec 64)) Unit!37191)

(assert (=> b!1135269 (= lt!504662 (addStillContains!737 lt!504667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun lt!504672 () ListLongMap!16043)

(assert (=> b!1135269 (= lt!504672 call!49559)))

(declare-fun call!49560 () Bool)

(assert (=> b!1135269 call!49560))

(assert (=> b!1135269 (= lt!504656 call!49558)))

(declare-fun contains!6567 (ListLongMap!16043 (_ BitVec 64)) Bool)

(declare-fun +!3474 (ListLongMap!16043 tuple2!18074) ListLongMap!16043)

(assert (=> b!1135269 (contains!6567 (+!3474 lt!504672 (tuple2!18075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1135270 () Bool)

(declare-fun res!757815 () Bool)

(declare-fun e!646065 () Bool)

(assert (=> b!1135270 (=> res!757815 e!646065)))

(declare-datatypes ((List!24833 0))(
  ( (Nil!24830) (Cons!24829 (h!26038 (_ BitVec 64)) (t!35826 List!24833)) )
))
(declare-fun contains!6568 (List!24833 (_ BitVec 64)) Bool)

(assert (=> b!1135270 (= res!757815 (contains!6568 Nil!24830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!49554 () ListLongMap!16043)

(declare-fun b!1135271 () Bool)

(declare-fun e!646071 () Bool)

(declare-fun -!1200 (ListLongMap!16043 (_ BitVec 64)) ListLongMap!16043)

(assert (=> b!1135271 (= e!646071 (= call!49554 (-!1200 call!49555 k!934)))))

(declare-fun b!1135272 () Bool)

(declare-fun res!757813 () Bool)

(assert (=> b!1135272 (=> (not res!757813) (not e!646068))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135272 (= res!757813 (= (select (arr!35612 _keys!1208) i!673) k!934))))

(declare-fun e!646061 () Bool)

(declare-fun b!1135273 () Bool)

(declare-fun arrayContainsKey!0 (array!73923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135273 (= e!646061 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135274 () Bool)

(declare-fun res!757825 () Bool)

(assert (=> b!1135274 (=> (not res!757825) (not e!646068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135274 (= res!757825 (validMask!0 mask!1564))))

(declare-fun b!1135275 () Bool)

(declare-fun e!646072 () Bool)

(declare-fun e!646069 () Bool)

(assert (=> b!1135275 (= e!646072 (and e!646069 mapRes!44621))))

(declare-fun condMapEmpty!44621 () Bool)

(declare-fun mapDefault!44621 () ValueCell!13556)

