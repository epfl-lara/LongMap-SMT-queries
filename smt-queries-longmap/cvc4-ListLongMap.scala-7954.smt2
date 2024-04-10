; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98568 () Bool)

(assert start!98568)

(declare-fun b_free!24173 () Bool)

(declare-fun b_next!24173 () Bool)

(assert (=> start!98568 (= b_free!24173 (not b_next!24173))))

(declare-fun tp!85230 () Bool)

(declare-fun b_and!39195 () Bool)

(assert (=> start!98568 (= tp!85230 b_and!39195)))

(declare-fun b!1143007 () Bool)

(declare-fun res!761601 () Bool)

(declare-fun e!650245 () Bool)

(assert (=> b!1143007 (=> (not res!761601) (not e!650245))))

(declare-datatypes ((array!74259 0))(
  ( (array!74260 (arr!35780 (Array (_ BitVec 32) (_ BitVec 64))) (size!36316 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74259)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74259 (_ BitVec 32)) Bool)

(assert (=> b!1143007 (= res!761601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143008 () Bool)

(declare-fun e!650244 () Bool)

(declare-fun tp_is_empty!28703 () Bool)

(assert (=> b!1143008 (= e!650244 tp_is_empty!28703)))

(declare-fun b!1143009 () Bool)

(declare-fun c!112419 () Bool)

(declare-fun lt!509651 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1143009 (= c!112419 (and (not lt!509651) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37503 0))(
  ( (Unit!37504) )
))
(declare-fun e!650233 () Unit!37503)

(declare-fun e!650238 () Unit!37503)

(assert (=> b!1143009 (= e!650233 e!650238)))

(declare-fun b!1143010 () Bool)

(declare-fun e!650246 () Bool)

(declare-fun e!650235 () Bool)

(assert (=> b!1143010 (= e!650246 (not e!650235))))

(declare-fun res!761600 () Bool)

(assert (=> b!1143010 (=> res!761600 e!650235)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143010 (= res!761600 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143010 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!509660 () Unit!37503)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74259 (_ BitVec 64) (_ BitVec 32)) Unit!37503)

(assert (=> b!1143010 (= lt!509660 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1143011 () Bool)

(assert (=> b!1143011 (= e!650245 e!650246)))

(declare-fun res!761607 () Bool)

(assert (=> b!1143011 (=> (not res!761607) (not e!650246))))

(declare-fun lt!509656 () array!74259)

(assert (=> b!1143011 (= res!761607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509656 mask!1564))))

(assert (=> b!1143011 (= lt!509656 (array!74260 (store (arr!35780 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36316 _keys!1208)))))

(declare-fun b!1143012 () Bool)

(declare-fun e!650237 () Bool)

(assert (=> b!1143012 (= e!650237 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51615 () Bool)

(declare-datatypes ((V!43397 0))(
  ( (V!43398 (val!14408 Int)) )
))
(declare-datatypes ((tuple2!18236 0))(
  ( (tuple2!18237 (_1!9129 (_ BitVec 64)) (_2!9129 V!43397)) )
))
(declare-datatypes ((List!24989 0))(
  ( (Nil!24986) (Cons!24985 (h!26194 tuple2!18236) (t!36154 List!24989)) )
))
(declare-datatypes ((ListLongMap!16205 0))(
  ( (ListLongMap!16206 (toList!8118 List!24989)) )
))
(declare-fun call!51621 () ListLongMap!16205)

(declare-fun call!51624 () ListLongMap!16205)

(assert (=> bm!51615 (= call!51621 call!51624)))

(declare-fun b!1143014 () Bool)

(declare-fun e!650247 () Bool)

(declare-fun e!650243 () Bool)

(assert (=> b!1143014 (= e!650247 e!650243)))

(declare-fun res!761599 () Bool)

(assert (=> b!1143014 (=> res!761599 e!650243)))

(assert (=> b!1143014 (= res!761599 (not (= (select (arr!35780 _keys!1208) from!1455) k!934)))))

(declare-fun e!650232 () Bool)

(assert (=> b!1143014 e!650232))

(declare-fun c!112420 () Bool)

(assert (=> b!1143014 (= c!112420 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43397)

(declare-fun lt!509649 () Unit!37503)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13642 0))(
  ( (ValueCellFull!13642 (v!17045 V!43397)) (EmptyCell!13642) )
))
(declare-datatypes ((array!74261 0))(
  ( (array!74262 (arr!35781 (Array (_ BitVec 32) ValueCell!13642)) (size!36317 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74261)

(declare-fun minValue!944 () V!43397)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!506 (array!74259 array!74261 (_ BitVec 32) (_ BitVec 32) V!43397 V!43397 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37503)

(assert (=> b!1143014 (= lt!509649 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!506 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143015 () Bool)

(declare-fun res!761603 () Bool)

(assert (=> b!1143015 (=> (not res!761603) (not e!650245))))

(assert (=> b!1143015 (= res!761603 (and (= (size!36317 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36316 _keys!1208) (size!36317 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1143016 () Bool)

(declare-fun e!650236 () Unit!37503)

(assert (=> b!1143016 (= e!650238 e!650236)))

(declare-fun c!112417 () Bool)

(assert (=> b!1143016 (= c!112417 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509651))))

(declare-fun b!1143017 () Bool)

(declare-fun lt!509652 () ListLongMap!16205)

(declare-fun contains!6650 (ListLongMap!16205 (_ BitVec 64)) Bool)

(declare-fun +!3547 (ListLongMap!16205 tuple2!18236) ListLongMap!16205)

(assert (=> b!1143017 (contains!6650 (+!3547 lt!509652 (tuple2!18237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!509655 () Unit!37503)

(declare-fun addStillContains!803 (ListLongMap!16205 (_ BitVec 64) V!43397 (_ BitVec 64)) Unit!37503)

(assert (=> b!1143017 (= lt!509655 (addStillContains!803 lt!509652 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!51625 () Bool)

(assert (=> b!1143017 call!51625))

(assert (=> b!1143017 (= lt!509652 call!51624)))

(declare-fun lt!509653 () Unit!37503)

(declare-fun call!51623 () Unit!37503)

(assert (=> b!1143017 (= lt!509653 call!51623)))

(assert (=> b!1143017 (= e!650233 lt!509655)))

(declare-fun b!1143018 () Bool)

(declare-fun res!761608 () Bool)

(assert (=> b!1143018 (=> (not res!761608) (not e!650245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143018 (= res!761608 (validKeyInArray!0 k!934))))

(declare-fun bm!51616 () Bool)

(declare-fun lt!509643 () ListLongMap!16205)

(declare-fun c!112418 () Bool)

(assert (=> bm!51616 (= call!51623 (addStillContains!803 lt!509643 (ite (or c!112418 c!112419) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112418 c!112419) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1143019 () Bool)

(assert (=> b!1143019 (= e!650243 true)))

(declare-fun lt!509659 () V!43397)

(declare-fun -!1264 (ListLongMap!16205 (_ BitVec 64)) ListLongMap!16205)

(assert (=> b!1143019 (= (-!1264 (+!3547 lt!509643 (tuple2!18237 (select (arr!35780 _keys!1208) from!1455) lt!509659)) (select (arr!35780 _keys!1208) from!1455)) lt!509643)))

(declare-fun lt!509644 () Unit!37503)

(declare-fun addThenRemoveForNewKeyIsSame!116 (ListLongMap!16205 (_ BitVec 64) V!43397) Unit!37503)

(assert (=> b!1143019 (= lt!509644 (addThenRemoveForNewKeyIsSame!116 lt!509643 (select (arr!35780 _keys!1208) from!1455) lt!509659))))

(declare-fun lt!509657 () V!43397)

(declare-fun get!18186 (ValueCell!13642 V!43397) V!43397)

(assert (=> b!1143019 (= lt!509659 (get!18186 (select (arr!35781 _values!996) from!1455) lt!509657))))

(declare-fun lt!509642 () Unit!37503)

(declare-fun e!650240 () Unit!37503)

(assert (=> b!1143019 (= lt!509642 e!650240)))

(declare-fun c!112416 () Bool)

(assert (=> b!1143019 (= c!112416 (contains!6650 lt!509643 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4598 (array!74259 array!74261 (_ BitVec 32) (_ BitVec 32) V!43397 V!43397 (_ BitVec 32) Int) ListLongMap!16205)

(assert (=> b!1143019 (= lt!509643 (getCurrentListMapNoExtraKeys!4598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143020 () Bool)

(declare-fun res!761596 () Bool)

(assert (=> b!1143020 (=> (not res!761596) (not e!650245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143020 (= res!761596 (validMask!0 mask!1564))))

(declare-fun b!1143021 () Bool)

(declare-fun res!761602 () Bool)

(assert (=> b!1143021 (=> (not res!761602) (not e!650245))))

(declare-datatypes ((List!24990 0))(
  ( (Nil!24987) (Cons!24986 (h!26195 (_ BitVec 64)) (t!36155 List!24990)) )
))
(declare-fun arrayNoDuplicates!0 (array!74259 (_ BitVec 32) List!24990) Bool)

(assert (=> b!1143021 (= res!761602 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24987))))

(declare-fun mapIsEmpty!44879 () Bool)

(declare-fun mapRes!44879 () Bool)

(assert (=> mapIsEmpty!44879 mapRes!44879))

(declare-fun bm!51617 () Bool)

(assert (=> bm!51617 (= call!51624 (+!3547 lt!509643 (ite (or c!112418 c!112419) (tuple2!18237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!51618 () Bool)

(assert (=> bm!51618 (= call!51625 (contains!6650 (ite c!112418 lt!509652 call!51621) k!934))))

(declare-fun lt!509648 () array!74261)

(declare-fun bm!51619 () Bool)

(declare-fun call!51618 () ListLongMap!16205)

(assert (=> bm!51619 (= call!51618 (getCurrentListMapNoExtraKeys!4598 lt!509656 lt!509648 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143022 () Bool)

(declare-fun call!51622 () ListLongMap!16205)

(assert (=> b!1143022 (= e!650232 (= call!51618 call!51622))))

(declare-fun bm!51620 () Bool)

(assert (=> bm!51620 (= call!51622 (getCurrentListMapNoExtraKeys!4598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143023 () Bool)

(declare-fun e!650239 () Bool)

(declare-fun e!650241 () Bool)

(assert (=> b!1143023 (= e!650239 (and e!650241 mapRes!44879))))

(declare-fun condMapEmpty!44879 () Bool)

(declare-fun mapDefault!44879 () ValueCell!13642)

