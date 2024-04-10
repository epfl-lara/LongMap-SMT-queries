; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98594 () Bool)

(assert start!98594)

(declare-fun b_free!24199 () Bool)

(declare-fun b_next!24199 () Bool)

(assert (=> start!98594 (= b_free!24199 (not b_next!24199))))

(declare-fun tp!85307 () Bool)

(declare-fun b_and!39247 () Bool)

(assert (=> start!98594 (= tp!85307 b_and!39247)))

(declare-fun b!1144166 () Bool)

(declare-datatypes ((Unit!37551 0))(
  ( (Unit!37552) )
))
(declare-fun e!650872 () Unit!37551)

(declare-fun Unit!37553 () Unit!37551)

(assert (=> b!1144166 (= e!650872 Unit!37553)))

(declare-datatypes ((array!74311 0))(
  ( (array!74312 (arr!35806 (Array (_ BitVec 32) (_ BitVec 64))) (size!36342 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74311)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1144167 () Bool)

(declare-fun e!650869 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144167 (= e!650869 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-datatypes ((V!43433 0))(
  ( (V!43434 (val!14421 Int)) )
))
(declare-datatypes ((tuple2!18262 0))(
  ( (tuple2!18263 (_1!9142 (_ BitVec 64)) (_2!9142 V!43433)) )
))
(declare-datatypes ((List!25014 0))(
  ( (Nil!25011) (Cons!25010 (h!26219 tuple2!18262) (t!36205 List!25014)) )
))
(declare-datatypes ((ListLongMap!16231 0))(
  ( (ListLongMap!16232 (toList!8131 List!25014)) )
))
(declare-fun lt!510472 () ListLongMap!16231)

(declare-fun b!1144168 () Bool)

(declare-fun lt!510460 () ListLongMap!16231)

(declare-fun e!650868 () Bool)

(declare-fun -!1274 (ListLongMap!16231 (_ BitVec 64)) ListLongMap!16231)

(assert (=> b!1144168 (= e!650868 (= (-!1274 lt!510472 k!934) lt!510460))))

(declare-fun b!1144169 () Bool)

(declare-fun e!650864 () Bool)

(assert (=> b!1144169 (= e!650864 true)))

(assert (=> b!1144169 e!650868))

(declare-fun res!762158 () Bool)

(assert (=> b!1144169 (=> (not res!762158) (not e!650868))))

(declare-fun lt!510475 () V!43433)

(declare-fun +!3558 (ListLongMap!16231 tuple2!18262) ListLongMap!16231)

(assert (=> b!1144169 (= res!762158 (= (-!1274 (+!3558 lt!510460 (tuple2!18263 (select (arr!35806 _keys!1208) from!1455) lt!510475)) (select (arr!35806 _keys!1208) from!1455)) lt!510460))))

(declare-fun lt!510470 () Unit!37551)

(declare-fun addThenRemoveForNewKeyIsSame!125 (ListLongMap!16231 (_ BitVec 64) V!43433) Unit!37551)

(assert (=> b!1144169 (= lt!510470 (addThenRemoveForNewKeyIsSame!125 lt!510460 (select (arr!35806 _keys!1208) from!1455) lt!510475))))

(declare-datatypes ((ValueCell!13655 0))(
  ( (ValueCellFull!13655 (v!17058 V!43433)) (EmptyCell!13655) )
))
(declare-datatypes ((array!74313 0))(
  ( (array!74314 (arr!35807 (Array (_ BitVec 32) ValueCell!13655)) (size!36343 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74313)

(declare-fun lt!510479 () V!43433)

(declare-fun get!18205 (ValueCell!13655 V!43433) V!43433)

(assert (=> b!1144169 (= lt!510475 (get!18205 (select (arr!35807 _values!996) from!1455) lt!510479))))

(declare-fun lt!510466 () Unit!37551)

(assert (=> b!1144169 (= lt!510466 e!650872)))

(declare-fun c!112652 () Bool)

(declare-fun contains!6660 (ListLongMap!16231 (_ BitVec 64)) Bool)

(assert (=> b!1144169 (= c!112652 (contains!6660 lt!510460 k!934))))

(declare-fun zeroValue!944 () V!43433)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!43433)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4609 (array!74311 array!74313 (_ BitVec 32) (_ BitVec 32) V!43433 V!43433 (_ BitVec 32) Int) ListLongMap!16231)

(assert (=> b!1144169 (= lt!510460 (getCurrentListMapNoExtraKeys!4609 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144170 () Bool)

(declare-fun e!650874 () Bool)

(declare-fun call!51933 () ListLongMap!16231)

(declare-fun call!51936 () ListLongMap!16231)

(assert (=> b!1144170 (= e!650874 (= call!51933 call!51936))))

(declare-fun b!1144171 () Bool)

(declare-fun res!762149 () Bool)

(declare-fun e!650871 () Bool)

(assert (=> b!1144171 (=> (not res!762149) (not e!650871))))

(assert (=> b!1144171 (= res!762149 (and (= (size!36343 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36342 _keys!1208) (size!36343 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!51927 () Bool)

(declare-fun call!51934 () Bool)

(declare-fun call!51937 () Bool)

(assert (=> bm!51927 (= call!51934 call!51937)))

(declare-fun bm!51928 () Bool)

(declare-fun lt!510467 () array!74313)

(declare-fun lt!510471 () array!74311)

(assert (=> bm!51928 (= call!51933 (getCurrentListMapNoExtraKeys!4609 lt!510471 lt!510467 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144172 () Bool)

(declare-fun res!762146 () Bool)

(declare-fun e!650862 () Bool)

(assert (=> b!1144172 (=> (not res!762146) (not e!650862))))

(declare-datatypes ((List!25015 0))(
  ( (Nil!25012) (Cons!25011 (h!26220 (_ BitVec 64)) (t!36206 List!25015)) )
))
(declare-fun arrayNoDuplicates!0 (array!74311 (_ BitVec 32) List!25015) Bool)

(assert (=> b!1144172 (= res!762146 (arrayNoDuplicates!0 lt!510471 #b00000000000000000000000000000000 Nil!25012))))

(declare-fun b!1144173 () Bool)

(assert (=> b!1144173 (= e!650874 (= call!51933 (-!1274 call!51936 k!934)))))

(declare-fun b!1144174 () Bool)

(declare-fun e!650860 () Bool)

(assert (=> b!1144174 (= e!650862 (not e!650860))))

(declare-fun res!762156 () Bool)

(assert (=> b!1144174 (=> res!762156 e!650860)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144174 (= res!762156 (bvsgt from!1455 i!673))))

(assert (=> b!1144174 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!510469 () Unit!37551)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74311 (_ BitVec 64) (_ BitVec 32)) Unit!37551)

(assert (=> b!1144174 (= lt!510469 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1144175 () Bool)

(declare-fun e!650859 () Bool)

(declare-fun e!650863 () Bool)

(declare-fun mapRes!44918 () Bool)

(assert (=> b!1144175 (= e!650859 (and e!650863 mapRes!44918))))

(declare-fun condMapEmpty!44918 () Bool)

(declare-fun mapDefault!44918 () ValueCell!13655)

