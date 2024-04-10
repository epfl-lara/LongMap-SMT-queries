; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98484 () Bool)

(assert start!98484)

(declare-fun b_free!24089 () Bool)

(declare-fun b_next!24089 () Bool)

(assert (=> start!98484 (= b_free!24089 (not b_next!24089))))

(declare-fun tp!84977 () Bool)

(declare-fun b_and!39027 () Bool)

(assert (=> start!98484 (= tp!84977 b_and!39027)))

(declare-fun b!1139269 () Bool)

(declare-fun res!759845 () Bool)

(declare-fun e!648231 () Bool)

(assert (=> b!1139269 (=> (not res!759845) (not e!648231))))

(declare-datatypes ((array!74097 0))(
  ( (array!74098 (arr!35699 (Array (_ BitVec 32) (_ BitVec 64))) (size!36235 (_ BitVec 32))) )
))
(declare-fun lt!507007 () array!74097)

(declare-datatypes ((List!24914 0))(
  ( (Nil!24911) (Cons!24910 (h!26119 (_ BitVec 64)) (t!35995 List!24914)) )
))
(declare-fun arrayNoDuplicates!0 (array!74097 (_ BitVec 32) List!24914) Bool)

(assert (=> b!1139269 (= res!759845 (arrayNoDuplicates!0 lt!507007 #b00000000000000000000000000000000 Nil!24911))))

(declare-datatypes ((V!43285 0))(
  ( (V!43286 (val!14366 Int)) )
))
(declare-fun zeroValue!944 () V!43285)

(declare-fun c!111662 () Bool)

(declare-datatypes ((tuple2!18158 0))(
  ( (tuple2!18159 (_1!9090 (_ BitVec 64)) (_2!9090 V!43285)) )
))
(declare-datatypes ((List!24915 0))(
  ( (Nil!24912) (Cons!24911 (h!26120 tuple2!18158) (t!35996 List!24915)) )
))
(declare-datatypes ((ListLongMap!16127 0))(
  ( (ListLongMap!16128 (toList!8079 List!24915)) )
))
(declare-fun call!50613 () ListLongMap!16127)

(declare-fun c!111659 () Bool)

(declare-fun lt!507011 () ListLongMap!16127)

(declare-fun bm!50607 () Bool)

(declare-fun minValue!944 () V!43285)

(declare-fun +!3511 (ListLongMap!16127 tuple2!18158) ListLongMap!16127)

(assert (=> bm!50607 (= call!50613 (+!3511 lt!507011 (ite (or c!111659 c!111662) (tuple2!18159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1139270 () Bool)

(declare-fun e!648229 () Bool)

(declare-fun e!648218 () Bool)

(assert (=> b!1139270 (= e!648229 e!648218)))

(declare-fun res!759840 () Bool)

(assert (=> b!1139270 (=> res!759840 e!648218)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139270 (= res!759840 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13600 0))(
  ( (ValueCellFull!13600 (v!17003 V!43285)) (EmptyCell!13600) )
))
(declare-datatypes ((array!74099 0))(
  ( (array!74100 (arr!35700 (Array (_ BitVec 32) ValueCell!13600)) (size!36236 (_ BitVec 32))) )
))
(declare-fun lt!507015 () array!74099)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!507010 () ListLongMap!16127)

(declare-fun getCurrentListMapNoExtraKeys!4562 (array!74097 array!74099 (_ BitVec 32) (_ BitVec 32) V!43285 V!43285 (_ BitVec 32) Int) ListLongMap!16127)

(assert (=> b!1139270 (= lt!507010 (getCurrentListMapNoExtraKeys!4562 lt!507007 lt!507015 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74099)

(declare-fun dynLambda!2611 (Int (_ BitVec 64)) V!43285)

(assert (=> b!1139270 (= lt!507015 (array!74100 (store (arr!35700 _values!996) i!673 (ValueCellFull!13600 (dynLambda!2611 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36236 _values!996)))))

(declare-fun _keys!1208 () array!74097)

(declare-fun lt!507002 () ListLongMap!16127)

(assert (=> b!1139270 (= lt!507002 (getCurrentListMapNoExtraKeys!4562 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139272 () Bool)

(declare-datatypes ((Unit!37337 0))(
  ( (Unit!37338) )
))
(declare-fun e!648223 () Unit!37337)

(declare-fun lt!507008 () Unit!37337)

(assert (=> b!1139272 (= e!648223 lt!507008)))

(declare-fun call!50612 () Unit!37337)

(assert (=> b!1139272 (= lt!507008 call!50612)))

(declare-fun call!50617 () Bool)

(assert (=> b!1139272 call!50617))

(declare-fun b!1139273 () Bool)

(declare-fun e!648224 () Bool)

(assert (=> b!1139273 (= e!648224 e!648231)))

(declare-fun res!759839 () Bool)

(assert (=> b!1139273 (=> (not res!759839) (not e!648231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74097 (_ BitVec 32)) Bool)

(assert (=> b!1139273 (= res!759839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507007 mask!1564))))

(assert (=> b!1139273 (= lt!507007 (array!74098 (store (arr!35699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36235 _keys!1208)))))

(declare-fun e!648216 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1139274 () Bool)

(declare-fun arrayContainsKey!0 (array!74097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139274 (= e!648216 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139275 () Bool)

(declare-fun e!648220 () Bool)

(assert (=> b!1139275 (= e!648220 true)))

(declare-fun lt!507013 () Bool)

(declare-fun contains!6614 (ListLongMap!16127 (_ BitVec 64)) Bool)

(assert (=> b!1139275 (= lt!507013 (contains!6614 lt!507011 (select (arr!35699 _keys!1208) from!1455)))))

(declare-fun lt!507004 () Unit!37337)

(declare-fun e!648221 () Unit!37337)

(assert (=> b!1139275 (= lt!507004 e!648221)))

(declare-fun c!111664 () Bool)

(assert (=> b!1139275 (= c!111664 (contains!6614 lt!507011 k!934))))

(assert (=> b!1139275 (= lt!507011 (getCurrentListMapNoExtraKeys!4562 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139276 () Bool)

(declare-fun res!759844 () Bool)

(assert (=> b!1139276 (=> (not res!759844) (not e!648224))))

(assert (=> b!1139276 (= res!759844 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36235 _keys!1208))))))

(declare-fun b!1139277 () Bool)

(declare-fun res!759835 () Bool)

(assert (=> b!1139277 (=> (not res!759835) (not e!648224))))

(assert (=> b!1139277 (= res!759835 (and (= (size!36236 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36235 _keys!1208) (size!36236 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50608 () Bool)

(declare-fun call!50610 () Bool)

(assert (=> bm!50608 (= call!50617 call!50610)))

(declare-fun b!1139278 () Bool)

(declare-fun res!759843 () Bool)

(assert (=> b!1139278 (=> (not res!759843) (not e!648224))))

(assert (=> b!1139278 (= res!759843 (= (select (arr!35699 _keys!1208) i!673) k!934))))

(declare-fun b!1139279 () Bool)

(declare-fun res!759838 () Bool)

(assert (=> b!1139279 (=> (not res!759838) (not e!648224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139279 (= res!759838 (validMask!0 mask!1564))))

(declare-fun b!1139280 () Bool)

(declare-fun e!648219 () Unit!37337)

(declare-fun Unit!37339 () Unit!37337)

(assert (=> b!1139280 (= e!648219 Unit!37339)))

(declare-fun call!50614 () ListLongMap!16127)

(declare-fun e!648230 () Bool)

(declare-fun call!50616 () ListLongMap!16127)

(declare-fun b!1139281 () Bool)

(declare-fun -!1230 (ListLongMap!16127 (_ BitVec 64)) ListLongMap!16127)

(assert (=> b!1139281 (= e!648230 (= call!50616 (-!1230 call!50614 k!934)))))

(declare-fun bm!50609 () Bool)

(declare-fun call!50611 () ListLongMap!16127)

(assert (=> bm!50609 (= call!50611 call!50613)))

(declare-fun b!1139282 () Bool)

(assert (=> b!1139282 (= e!648223 e!648219)))

(declare-fun c!111663 () Bool)

(declare-fun lt!507006 () Bool)

(assert (=> b!1139282 (= c!111663 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507006))))

(declare-fun b!1139283 () Bool)

(assert (=> b!1139283 (= c!111662 (and (not lt!507006) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648222 () Unit!37337)

(assert (=> b!1139283 (= e!648222 e!648223)))

(declare-fun bm!50610 () Bool)

(declare-fun lt!507005 () ListLongMap!16127)

(assert (=> bm!50610 (= call!50610 (contains!6614 (ite c!111659 lt!507005 call!50611) k!934))))

(declare-fun b!1139284 () Bool)

(declare-fun e!648227 () Bool)

(declare-fun e!648228 () Bool)

(declare-fun mapRes!44753 () Bool)

(assert (=> b!1139284 (= e!648227 (and e!648228 mapRes!44753))))

(declare-fun condMapEmpty!44753 () Bool)

(declare-fun mapDefault!44753 () ValueCell!13600)

