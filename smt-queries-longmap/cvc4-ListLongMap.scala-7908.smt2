; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98196 () Bool)

(assert start!98196)

(declare-fun b_free!23897 () Bool)

(declare-fun b_next!23897 () Bool)

(assert (=> start!98196 (= b_free!23897 (not b_next!23897))))

(declare-fun tp!84395 () Bool)

(declare-fun b_and!38577 () Bool)

(assert (=> start!98196 (= tp!84395 b_and!38577)))

(declare-fun b!1130076 () Bool)

(declare-datatypes ((Unit!37020 0))(
  ( (Unit!37021) )
))
(declare-fun e!643146 () Unit!37020)

(declare-fun lt!501791 () Unit!37020)

(assert (=> b!1130076 (= e!643146 lt!501791)))

(declare-datatypes ((V!43029 0))(
  ( (V!43030 (val!14270 Int)) )
))
(declare-fun zeroValue!944 () V!43029)

(declare-datatypes ((tuple2!17974 0))(
  ( (tuple2!17975 (_1!8998 (_ BitVec 64)) (_2!8998 V!43029)) )
))
(declare-datatypes ((List!24738 0))(
  ( (Nil!24735) (Cons!24734 (h!25943 tuple2!17974) (t!35627 List!24738)) )
))
(declare-datatypes ((ListLongMap!15943 0))(
  ( (ListLongMap!15944 (toList!7987 List!24738)) )
))
(declare-fun lt!501795 () ListLongMap!15943)

(declare-fun lt!501796 () Unit!37020)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun addStillContains!699 (ListLongMap!15943 (_ BitVec 64) V!43029 (_ BitVec 64)) Unit!37020)

(assert (=> b!1130076 (= lt!501796 (addStillContains!699 lt!501795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun lt!501792 () ListLongMap!15943)

(declare-fun +!3437 (ListLongMap!15943 tuple2!17974) ListLongMap!15943)

(assert (=> b!1130076 (= lt!501792 (+!3437 lt!501795 (tuple2!17975 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!48239 () Bool)

(assert (=> b!1130076 call!48239))

(declare-fun call!48238 () Unit!37020)

(assert (=> b!1130076 (= lt!501791 call!48238)))

(declare-fun call!48237 () ListLongMap!15943)

(declare-fun contains!6510 (ListLongMap!15943 (_ BitVec 64)) Bool)

(assert (=> b!1130076 (contains!6510 call!48237 k!934)))

(declare-fun bm!48234 () Bool)

(declare-fun call!48243 () ListLongMap!15943)

(assert (=> bm!48234 (= call!48243 call!48237)))

(declare-fun b!1130077 () Bool)

(declare-fun e!643144 () Bool)

(declare-fun e!643138 () Bool)

(assert (=> b!1130077 (= e!643144 e!643138)))

(declare-fun res!755113 () Bool)

(assert (=> b!1130077 (=> (not res!755113) (not e!643138))))

(declare-datatypes ((array!73711 0))(
  ( (array!73712 (arr!35508 (Array (_ BitVec 32) (_ BitVec 64))) (size!36044 (_ BitVec 32))) )
))
(declare-fun lt!501789 () array!73711)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73711 (_ BitVec 32)) Bool)

(assert (=> b!1130077 (= res!755113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501789 mask!1564))))

(declare-fun _keys!1208 () array!73711)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130077 (= lt!501789 (array!73712 (store (arr!35508 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36044 _keys!1208)))))

(declare-fun mapNonEmpty!44458 () Bool)

(declare-fun mapRes!44458 () Bool)

(declare-fun tp!84394 () Bool)

(declare-fun e!643142 () Bool)

(assert (=> mapNonEmpty!44458 (= mapRes!44458 (and tp!84394 e!643142))))

(declare-fun mapKey!44458 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13504 0))(
  ( (ValueCellFull!13504 (v!16903 V!43029)) (EmptyCell!13504) )
))
(declare-fun mapValue!44458 () ValueCell!13504)

(declare-datatypes ((array!73713 0))(
  ( (array!73714 (arr!35509 (Array (_ BitVec 32) ValueCell!13504)) (size!36045 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73713)

(declare-fun mapRest!44458 () (Array (_ BitVec 32) ValueCell!13504))

(assert (=> mapNonEmpty!44458 (= (arr!35509 _values!996) (store mapRest!44458 mapKey!44458 mapValue!44458))))

(declare-fun c!109968 () Bool)

(declare-fun bm!48235 () Bool)

(declare-fun c!109970 () Bool)

(declare-fun minValue!944 () V!43029)

(assert (=> bm!48235 (= call!48237 (+!3437 (ite c!109970 lt!501792 lt!501795) (ite c!109970 (tuple2!17975 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!109968 (tuple2!17975 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17975 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1130078 () Bool)

(declare-fun res!755112 () Bool)

(assert (=> b!1130078 (=> (not res!755112) (not e!643144))))

(assert (=> b!1130078 (= res!755112 (= (select (arr!35508 _keys!1208) i!673) k!934))))

(declare-fun b!1130079 () Bool)

(declare-fun e!643151 () Unit!37020)

(assert (=> b!1130079 (= e!643146 e!643151)))

(declare-fun lt!501783 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1130079 (= c!109968 (and (not lt!501783) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!48240 () ListLongMap!15943)

(declare-fun e!643141 () Bool)

(declare-fun call!48242 () ListLongMap!15943)

(declare-fun b!1130080 () Bool)

(declare-fun -!1166 (ListLongMap!15943 (_ BitVec 64)) ListLongMap!15943)

(assert (=> b!1130080 (= e!643141 (= call!48240 (-!1166 call!48242 k!934)))))

(declare-fun b!1130081 () Bool)

(declare-fun e!643150 () Bool)

(declare-fun e!643140 () Bool)

(assert (=> b!1130081 (= e!643150 e!643140)))

(declare-fun res!755103 () Bool)

(assert (=> b!1130081 (=> res!755103 e!643140)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1130081 (= res!755103 (not (= (select (arr!35508 _keys!1208) from!1455) k!934)))))

(assert (=> b!1130081 e!643141))

(declare-fun c!109971 () Bool)

(assert (=> b!1130081 (= c!109971 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!501787 () Unit!37020)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!419 (array!73711 array!73713 (_ BitVec 32) (_ BitVec 32) V!43029 V!43029 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37020)

(assert (=> b!1130081 (= lt!501787 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!419 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!755106 () Bool)

(assert (=> start!98196 (=> (not res!755106) (not e!643144))))

(assert (=> start!98196 (= res!755106 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36044 _keys!1208))))))

(assert (=> start!98196 e!643144))

(declare-fun tp_is_empty!28427 () Bool)

(assert (=> start!98196 tp_is_empty!28427))

(declare-fun array_inv!27238 (array!73711) Bool)

(assert (=> start!98196 (array_inv!27238 _keys!1208)))

(assert (=> start!98196 true))

(assert (=> start!98196 tp!84395))

(declare-fun e!643147 () Bool)

(declare-fun array_inv!27239 (array!73713) Bool)

(assert (=> start!98196 (and (array_inv!27239 _values!996) e!643147)))

(declare-fun b!1130082 () Bool)

(declare-fun res!755099 () Bool)

(assert (=> b!1130082 (=> (not res!755099) (not e!643138))))

(declare-datatypes ((List!24739 0))(
  ( (Nil!24736) (Cons!24735 (h!25944 (_ BitVec 64)) (t!35628 List!24739)) )
))
(declare-fun arrayNoDuplicates!0 (array!73711 (_ BitVec 32) List!24739) Bool)

(assert (=> b!1130082 (= res!755099 (arrayNoDuplicates!0 lt!501789 #b00000000000000000000000000000000 Nil!24736))))

(declare-fun b!1130083 () Bool)

(declare-fun e!643149 () Bool)

(assert (=> b!1130083 (= e!643140 e!643149)))

(declare-fun res!755107 () Bool)

(assert (=> b!1130083 (=> res!755107 e!643149)))

(assert (=> b!1130083 (= res!755107 (not (contains!6510 lt!501795 k!934)))))

(declare-fun getCurrentListMapNoExtraKeys!4474 (array!73711 array!73713 (_ BitVec 32) (_ BitVec 32) V!43029 V!43029 (_ BitVec 32) Int) ListLongMap!15943)

(assert (=> b!1130083 (= lt!501795 (getCurrentListMapNoExtraKeys!4474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130084 () Bool)

(declare-fun call!48244 () Bool)

(assert (=> b!1130084 call!48244))

(declare-fun lt!501785 () Unit!37020)

(declare-fun call!48241 () Unit!37020)

(assert (=> b!1130084 (= lt!501785 call!48241)))

(assert (=> b!1130084 (= e!643151 lt!501785)))

(declare-fun b!1130085 () Bool)

(declare-fun res!755110 () Bool)

(assert (=> b!1130085 (=> (not res!755110) (not e!643144))))

(assert (=> b!1130085 (= res!755110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130086 () Bool)

(declare-fun e!643143 () Bool)

(assert (=> b!1130086 (= e!643143 true)))

(declare-fun lt!501788 () Bool)

(declare-fun getCurrentListMap!4420 (array!73711 array!73713 (_ BitVec 32) (_ BitVec 32) V!43029 V!43029 (_ BitVec 32) Int) ListLongMap!15943)

(assert (=> b!1130086 (= lt!501788 (contains!6510 (getCurrentListMap!4420 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun bm!48236 () Bool)

(assert (=> bm!48236 (= call!48241 call!48238)))

(declare-fun b!1130087 () Bool)

(declare-fun e!643139 () Unit!37020)

(declare-fun Unit!37022 () Unit!37020)

(assert (=> b!1130087 (= e!643139 Unit!37022)))

(declare-fun b!1130088 () Bool)

(assert (=> b!1130088 (= e!643149 e!643143)))

(declare-fun res!755104 () Bool)

(assert (=> b!1130088 (=> res!755104 e!643143)))

(assert (=> b!1130088 (= res!755104 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36044 _keys!1208))))))

(declare-fun lt!501786 () Unit!37020)

(assert (=> b!1130088 (= lt!501786 e!643146)))

(assert (=> b!1130088 (= c!109970 (and (not lt!501783) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130088 (= lt!501783 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!44458 () Bool)

(assert (=> mapIsEmpty!44458 mapRes!44458))

(declare-fun bm!48237 () Bool)

(assert (=> bm!48237 (= call!48244 call!48239)))

(declare-fun bm!48238 () Bool)

(assert (=> bm!48238 (= call!48242 (getCurrentListMapNoExtraKeys!4474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130089 () Bool)

(declare-fun res!755101 () Bool)

(assert (=> b!1130089 (=> (not res!755101) (not e!643144))))

(assert (=> b!1130089 (= res!755101 (and (= (size!36045 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36044 _keys!1208) (size!36045 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130090 () Bool)

(declare-fun e!643148 () Bool)

(assert (=> b!1130090 (= e!643138 (not e!643148))))

(declare-fun res!755102 () Bool)

(assert (=> b!1130090 (=> res!755102 e!643148)))

(assert (=> b!1130090 (= res!755102 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130090 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501793 () Unit!37020)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73711 (_ BitVec 64) (_ BitVec 32)) Unit!37020)

(assert (=> b!1130090 (= lt!501793 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!48239 () Bool)

(assert (=> bm!48239 (= call!48239 (contains!6510 (ite c!109970 lt!501792 call!48243) k!934))))

(declare-fun b!1130091 () Bool)

(declare-fun e!643152 () Bool)

(assert (=> b!1130091 (= e!643152 tp_is_empty!28427)))

(declare-fun b!1130092 () Bool)

(declare-fun res!755105 () Bool)

(assert (=> b!1130092 (=> (not res!755105) (not e!643144))))

(assert (=> b!1130092 (= res!755105 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24736))))

(declare-fun b!1130093 () Bool)

(assert (=> b!1130093 (= e!643147 (and e!643152 mapRes!44458))))

(declare-fun condMapEmpty!44458 () Bool)

(declare-fun mapDefault!44458 () ValueCell!13504)

