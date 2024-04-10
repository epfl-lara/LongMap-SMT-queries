; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98522 () Bool)

(assert start!98522)

(declare-fun b_free!24127 () Bool)

(declare-fun b_next!24127 () Bool)

(assert (=> start!98522 (= b_free!24127 (not b_next!24127))))

(declare-fun tp!85091 () Bool)

(declare-fun b_and!39103 () Bool)

(assert (=> start!98522 (= tp!85091 b_and!39103)))

(declare-datatypes ((array!74171 0))(
  ( (array!74172 (arr!35736 (Array (_ BitVec 32) (_ BitVec 64))) (size!36272 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74171)

(declare-fun e!649139 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1140960 () Bool)

(declare-fun arrayContainsKey!0 (array!74171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140960 (= e!649139 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140961 () Bool)

(declare-fun res!760630 () Bool)

(declare-fun e!649131 () Bool)

(assert (=> b!1140961 (=> (not res!760630) (not e!649131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140961 (= res!760630 (validKeyInArray!0 k!934))))

(declare-fun b!1140962 () Bool)

(declare-fun res!760635 () Bool)

(assert (=> b!1140962 (=> (not res!760635) (not e!649131))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140962 (= res!760635 (validMask!0 mask!1564))))

(declare-fun b!1140963 () Bool)

(declare-datatypes ((Unit!37419 0))(
  ( (Unit!37420) )
))
(declare-fun e!649136 () Unit!37419)

(declare-fun e!649132 () Unit!37419)

(assert (=> b!1140963 (= e!649136 e!649132)))

(declare-fun c!112002 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!508208 () Bool)

(assert (=> b!1140963 (= c!112002 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508208))))

(declare-fun b!1140964 () Bool)

(declare-fun res!760634 () Bool)

(assert (=> b!1140964 (=> (not res!760634) (not e!649131))))

(declare-datatypes ((V!43337 0))(
  ( (V!43338 (val!14385 Int)) )
))
(declare-datatypes ((ValueCell!13619 0))(
  ( (ValueCellFull!13619 (v!17022 V!43337)) (EmptyCell!13619) )
))
(declare-datatypes ((array!74173 0))(
  ( (array!74174 (arr!35737 (Array (_ BitVec 32) ValueCell!13619)) (size!36273 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74173)

(assert (=> b!1140964 (= res!760634 (and (= (size!36273 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36272 _keys!1208) (size!36273 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140966 () Bool)

(declare-fun e!649140 () Bool)

(declare-fun e!649143 () Bool)

(assert (=> b!1140966 (= e!649140 (not e!649143))))

(declare-fun res!760637 () Bool)

(assert (=> b!1140966 (=> res!760637 e!649143)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140966 (= res!760637 (bvsgt from!1455 i!673))))

(assert (=> b!1140966 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!508193 () Unit!37419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74171 (_ BitVec 64) (_ BitVec 32)) Unit!37419)

(assert (=> b!1140966 (= lt!508193 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1140967 () Bool)

(assert (=> b!1140967 (= e!649131 e!649140)))

(declare-fun res!760633 () Bool)

(assert (=> b!1140967 (=> (not res!760633) (not e!649140))))

(declare-fun lt!508207 () array!74171)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74171 (_ BitVec 32)) Bool)

(assert (=> b!1140967 (= res!760633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508207 mask!1564))))

(assert (=> b!1140967 (= lt!508207 (array!74172 (store (arr!35736 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36272 _keys!1208)))))

(declare-fun b!1140968 () Bool)

(declare-fun e!649135 () Bool)

(declare-fun e!649142 () Bool)

(assert (=> b!1140968 (= e!649135 e!649142)))

(declare-fun res!760643 () Bool)

(assert (=> b!1140968 (=> res!760643 e!649142)))

(assert (=> b!1140968 (= res!760643 (not (= (select (arr!35736 _keys!1208) from!1455) k!934)))))

(declare-fun e!649141 () Bool)

(assert (=> b!1140968 e!649141))

(declare-fun c!112004 () Bool)

(assert (=> b!1140968 (= c!112004 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43337)

(declare-fun lt!508201 () Unit!37419)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43337)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!492 (array!74171 array!74173 (_ BitVec 32) (_ BitVec 32) V!43337 V!43337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37419)

(assert (=> b!1140968 (= lt!508201 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140969 () Bool)

(declare-fun Unit!37421 () Unit!37419)

(assert (=> b!1140969 (= e!649132 Unit!37421)))

(declare-fun b!1140970 () Bool)

(declare-fun res!760632 () Bool)

(assert (=> b!1140970 (=> (not res!760632) (not e!649140))))

(declare-datatypes ((List!24949 0))(
  ( (Nil!24946) (Cons!24945 (h!26154 (_ BitVec 64)) (t!36068 List!24949)) )
))
(declare-fun arrayNoDuplicates!0 (array!74171 (_ BitVec 32) List!24949) Bool)

(assert (=> b!1140970 (= res!760632 (arrayNoDuplicates!0 lt!508207 #b00000000000000000000000000000000 Nil!24946))))

(declare-fun b!1140971 () Bool)

(declare-fun res!760640 () Bool)

(assert (=> b!1140971 (=> (not res!760640) (not e!649131))))

(assert (=> b!1140971 (= res!760640 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24946))))

(declare-fun bm!51063 () Bool)

(declare-datatypes ((tuple2!18194 0))(
  ( (tuple2!18195 (_1!9108 (_ BitVec 64)) (_2!9108 V!43337)) )
))
(declare-datatypes ((List!24950 0))(
  ( (Nil!24947) (Cons!24946 (h!26155 tuple2!18194) (t!36069 List!24950)) )
))
(declare-datatypes ((ListLongMap!16163 0))(
  ( (ListLongMap!16164 (toList!8097 List!24950)) )
))
(declare-fun call!51067 () ListLongMap!16163)

(declare-fun lt!508210 () array!74173)

(declare-fun getCurrentListMapNoExtraKeys!4579 (array!74171 array!74173 (_ BitVec 32) (_ BitVec 32) V!43337 V!43337 (_ BitVec 32) Int) ListLongMap!16163)

(assert (=> bm!51063 (= call!51067 (getCurrentListMapNoExtraKeys!4579 lt!508207 lt!508210 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140972 () Bool)

(assert (=> b!1140972 (= e!649139 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508208) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140973 () Bool)

(declare-fun e!649130 () Bool)

(assert (=> b!1140973 (= e!649130 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51064 () Bool)

(declare-fun call!51072 () ListLongMap!16163)

(declare-fun call!51071 () ListLongMap!16163)

(assert (=> bm!51064 (= call!51072 call!51071)))

(declare-fun call!51069 () ListLongMap!16163)

(declare-fun b!1140974 () Bool)

(declare-fun -!1247 (ListLongMap!16163 (_ BitVec 64)) ListLongMap!16163)

(assert (=> b!1140974 (= e!649141 (= call!51067 (-!1247 call!51069 k!934)))))

(declare-fun b!1140975 () Bool)

(assert (=> b!1140975 (= e!649141 (= call!51067 call!51069))))

(declare-fun b!1140976 () Bool)

(declare-fun e!649133 () Unit!37419)

(declare-fun Unit!37422 () Unit!37419)

(assert (=> b!1140976 (= e!649133 Unit!37422)))

(declare-fun b!1140977 () Bool)

(declare-fun res!760639 () Bool)

(assert (=> b!1140977 (=> (not res!760639) (not e!649131))))

(assert (=> b!1140977 (= res!760639 (= (select (arr!35736 _keys!1208) i!673) k!934))))

(declare-fun b!1140978 () Bool)

(declare-fun lt!508196 () Unit!37419)

(assert (=> b!1140978 (= e!649136 lt!508196)))

(declare-fun call!51070 () Unit!37419)

(assert (=> b!1140978 (= lt!508196 call!51070)))

(declare-fun call!51073 () Bool)

(assert (=> b!1140978 call!51073))

(declare-fun b!1140979 () Bool)

(declare-fun c!112001 () Bool)

(assert (=> b!1140979 (= c!112001 (and (not lt!508208) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649128 () Unit!37419)

(assert (=> b!1140979 (= e!649128 e!649136)))

(declare-fun call!51066 () Bool)

(declare-fun c!112006 () Bool)

(declare-fun bm!51065 () Bool)

(declare-fun lt!508199 () ListLongMap!16163)

(declare-fun contains!6632 (ListLongMap!16163 (_ BitVec 64)) Bool)

(assert (=> bm!51065 (= call!51066 (contains!6632 (ite c!112006 lt!508199 call!51072) k!934))))

(declare-fun b!1140980 () Bool)

(declare-fun e!649137 () Bool)

(declare-fun e!649129 () Bool)

(declare-fun mapRes!44810 () Bool)

(assert (=> b!1140980 (= e!649137 (and e!649129 mapRes!44810))))

(declare-fun condMapEmpty!44810 () Bool)

(declare-fun mapDefault!44810 () ValueCell!13619)

