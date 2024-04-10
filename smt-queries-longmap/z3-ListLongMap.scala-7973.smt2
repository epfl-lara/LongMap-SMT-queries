; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98680 () Bool)

(assert start!98680)

(declare-fun b_free!24285 () Bool)

(declare-fun b_next!24285 () Bool)

(assert (=> start!98680 (= b_free!24285 (not b_next!24285))))

(declare-fun tp!85566 () Bool)

(declare-fun b_and!39419 () Bool)

(assert (=> start!98680 (= tp!85566 b_and!39419)))

(declare-fun b!1148122 () Bool)

(declare-fun res!764081 () Bool)

(declare-fun e!653060 () Bool)

(assert (=> b!1148122 (=> (not res!764081) (not e!653060))))

(declare-datatypes ((array!74477 0))(
  ( (array!74478 (arr!35889 (Array (_ BitVec 32) (_ BitVec 64))) (size!36425 (_ BitVec 32))) )
))
(declare-fun lt!513169 () array!74477)

(declare-datatypes ((List!25091 0))(
  ( (Nil!25088) (Cons!25087 (h!26296 (_ BitVec 64)) (t!36368 List!25091)) )
))
(declare-fun arrayNoDuplicates!0 (array!74477 (_ BitVec 32) List!25091) Bool)

(assert (=> b!1148122 (= res!764081 (arrayNoDuplicates!0 lt!513169 #b00000000000000000000000000000000 Nil!25088))))

(declare-fun b!1148123 () Bool)

(declare-datatypes ((Unit!37722 0))(
  ( (Unit!37723) )
))
(declare-fun e!653056 () Unit!37722)

(declare-fun Unit!37724 () Unit!37722)

(assert (=> b!1148123 (= e!653056 Unit!37724)))

(declare-fun _keys!1208 () array!74477)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1148124 () Bool)

(declare-fun e!653052 () Bool)

(declare-fun arrayContainsKey!0 (array!74477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148124 (= e!653052 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52959 () Bool)

(declare-fun call!52968 () Unit!37722)

(declare-fun call!52965 () Unit!37722)

(assert (=> bm!52959 (= call!52968 call!52965)))

(declare-fun b!1148125 () Bool)

(declare-fun res!764084 () Bool)

(declare-fun e!653064 () Bool)

(assert (=> b!1148125 (=> (not res!764084) (not e!653064))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43547 0))(
  ( (V!43548 (val!14464 Int)) )
))
(declare-datatypes ((ValueCell!13698 0))(
  ( (ValueCellFull!13698 (v!17101 V!43547)) (EmptyCell!13698) )
))
(declare-datatypes ((array!74479 0))(
  ( (array!74480 (arr!35890 (Array (_ BitVec 32) ValueCell!13698)) (size!36426 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74479)

(assert (=> b!1148125 (= res!764084 (and (= (size!36426 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36425 _keys!1208) (size!36426 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148126 () Bool)

(declare-fun e!653062 () Bool)

(declare-fun tp_is_empty!28815 () Bool)

(assert (=> b!1148126 (= e!653062 tp_is_empty!28815)))

(declare-fun b!1148127 () Bool)

(declare-fun e!653061 () Bool)

(declare-fun e!653057 () Bool)

(assert (=> b!1148127 (= e!653061 e!653057)))

(declare-fun res!764093 () Bool)

(assert (=> b!1148127 (=> res!764093 e!653057)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148127 (= res!764093 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43547)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!513171 () array!74479)

(declare-datatypes ((tuple2!18340 0))(
  ( (tuple2!18341 (_1!9181 (_ BitVec 64)) (_2!9181 V!43547)) )
))
(declare-datatypes ((List!25092 0))(
  ( (Nil!25089) (Cons!25088 (h!26297 tuple2!18340) (t!36369 List!25092)) )
))
(declare-datatypes ((ListLongMap!16309 0))(
  ( (ListLongMap!16310 (toList!8170 List!25092)) )
))
(declare-fun lt!513174 () ListLongMap!16309)

(declare-fun minValue!944 () V!43547)

(declare-fun getCurrentListMapNoExtraKeys!4644 (array!74477 array!74479 (_ BitVec 32) (_ BitVec 32) V!43547 V!43547 (_ BitVec 32) Int) ListLongMap!16309)

(assert (=> b!1148127 (= lt!513174 (getCurrentListMapNoExtraKeys!4644 lt!513169 lt!513171 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!513176 () V!43547)

(assert (=> b!1148127 (= lt!513171 (array!74480 (store (arr!35890 _values!996) i!673 (ValueCellFull!13698 lt!513176)) (size!36426 _values!996)))))

(declare-fun dynLambda!2673 (Int (_ BitVec 64)) V!43547)

(assert (=> b!1148127 (= lt!513176 (dynLambda!2673 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!513180 () ListLongMap!16309)

(assert (=> b!1148127 (= lt!513180 (getCurrentListMapNoExtraKeys!4644 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1148128 () Bool)

(declare-fun e!653059 () Bool)

(assert (=> b!1148128 (= e!653059 tp_is_empty!28815)))

(declare-fun b!1148129 () Bool)

(declare-fun e!653054 () Bool)

(declare-fun call!52967 () ListLongMap!16309)

(declare-fun call!52964 () ListLongMap!16309)

(assert (=> b!1148129 (= e!653054 (= call!52967 call!52964))))

(declare-fun b!1148130 () Bool)

(assert (=> b!1148130 (= e!653064 e!653060)))

(declare-fun res!764079 () Bool)

(assert (=> b!1148130 (=> (not res!764079) (not e!653060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74477 (_ BitVec 32)) Bool)

(assert (=> b!1148130 (= res!764079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513169 mask!1564))))

(assert (=> b!1148130 (= lt!513169 (array!74478 (store (arr!35889 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36425 _keys!1208)))))

(declare-fun b!1148131 () Bool)

(assert (=> b!1148131 (= e!653060 (not e!653061))))

(declare-fun res!764086 () Bool)

(assert (=> b!1148131 (=> res!764086 e!653061)))

(assert (=> b!1148131 (= res!764086 (bvsgt from!1455 i!673))))

(assert (=> b!1148131 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513189 () Unit!37722)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74477 (_ BitVec 64) (_ BitVec 32)) Unit!37722)

(assert (=> b!1148131 (= lt!513189 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1148132 () Bool)

(declare-fun res!764088 () Bool)

(assert (=> b!1148132 (=> (not res!764088) (not e!653064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148132 (= res!764088 (validKeyInArray!0 k0!934))))

(declare-fun b!1148133 () Bool)

(declare-fun e!653058 () Bool)

(assert (=> b!1148133 (= e!653058 true)))

(declare-fun e!653067 () Bool)

(assert (=> b!1148133 e!653067))

(declare-fun res!764083 () Bool)

(assert (=> b!1148133 (=> (not res!764083) (not e!653067))))

(declare-fun lt!513181 () ListLongMap!16309)

(declare-fun lt!513182 () V!43547)

(declare-fun -!1305 (ListLongMap!16309 (_ BitVec 64)) ListLongMap!16309)

(declare-fun +!3593 (ListLongMap!16309 tuple2!18340) ListLongMap!16309)

(assert (=> b!1148133 (= res!764083 (= (-!1305 (+!3593 lt!513181 (tuple2!18341 (select (arr!35889 _keys!1208) from!1455) lt!513182)) (select (arr!35889 _keys!1208) from!1455)) lt!513181))))

(declare-fun lt!513172 () Unit!37722)

(declare-fun addThenRemoveForNewKeyIsSame!151 (ListLongMap!16309 (_ BitVec 64) V!43547) Unit!37722)

(assert (=> b!1148133 (= lt!513172 (addThenRemoveForNewKeyIsSame!151 lt!513181 (select (arr!35889 _keys!1208) from!1455) lt!513182))))

(declare-fun get!18259 (ValueCell!13698 V!43547) V!43547)

(assert (=> b!1148133 (= lt!513182 (get!18259 (select (arr!35890 _values!996) from!1455) lt!513176))))

(declare-fun lt!513185 () Unit!37722)

(assert (=> b!1148133 (= lt!513185 e!653056)))

(declare-fun c!113423 () Bool)

(declare-fun contains!6693 (ListLongMap!16309 (_ BitVec 64)) Bool)

(assert (=> b!1148133 (= c!113423 (contains!6693 lt!513181 k0!934))))

(assert (=> b!1148133 (= lt!513181 (getCurrentListMapNoExtraKeys!4644 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148134 () Bool)

(declare-fun e!653055 () Bool)

(declare-fun mapRes!45047 () Bool)

(assert (=> b!1148134 (= e!653055 (and e!653062 mapRes!45047))))

(declare-fun condMapEmpty!45047 () Bool)

(declare-fun mapDefault!45047 () ValueCell!13698)

(assert (=> b!1148134 (= condMapEmpty!45047 (= (arr!35890 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13698)) mapDefault!45047)))))

(declare-fun b!1148135 () Bool)

(declare-fun res!764082 () Bool)

(assert (=> b!1148135 (=> (not res!764082) (not e!653064))))

(assert (=> b!1148135 (= res!764082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1148136 () Bool)

(declare-fun e!653065 () Unit!37722)

(declare-fun e!653053 () Unit!37722)

(assert (=> b!1148136 (= e!653065 e!653053)))

(declare-fun c!113424 () Bool)

(declare-fun lt!513188 () Bool)

(assert (=> b!1148136 (= c!113424 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513188))))

(declare-fun c!113425 () Bool)

(declare-fun c!113427 () Bool)

(declare-fun bm!52960 () Bool)

(declare-fun addStillContains!844 (ListLongMap!16309 (_ BitVec 64) V!43547 (_ BitVec 64)) Unit!37722)

(assert (=> bm!52960 (= call!52965 (addStillContains!844 lt!513181 (ite (or c!113425 c!113427) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113425 c!113427) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1148137 () Bool)

(assert (=> b!1148137 (= e!653067 (= (-!1305 lt!513180 k0!934) lt!513181))))

(declare-fun mapNonEmpty!45047 () Bool)

(declare-fun tp!85565 () Bool)

(assert (=> mapNonEmpty!45047 (= mapRes!45047 (and tp!85565 e!653059))))

(declare-fun mapKey!45047 () (_ BitVec 32))

(declare-fun mapValue!45047 () ValueCell!13698)

(declare-fun mapRest!45047 () (Array (_ BitVec 32) ValueCell!13698))

(assert (=> mapNonEmpty!45047 (= (arr!35890 _values!996) (store mapRest!45047 mapKey!45047 mapValue!45047))))

(declare-fun b!1148138 () Bool)

(declare-fun res!764089 () Bool)

(assert (=> b!1148138 (=> (not res!764089) (not e!653064))))

(assert (=> b!1148138 (= res!764089 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36425 _keys!1208))))))

(declare-fun res!764087 () Bool)

(assert (=> start!98680 (=> (not res!764087) (not e!653064))))

(assert (=> start!98680 (= res!764087 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36425 _keys!1208))))))

(assert (=> start!98680 e!653064))

(assert (=> start!98680 tp_is_empty!28815))

(declare-fun array_inv!27490 (array!74477) Bool)

(assert (=> start!98680 (array_inv!27490 _keys!1208)))

(assert (=> start!98680 true))

(assert (=> start!98680 tp!85566))

(declare-fun array_inv!27491 (array!74479) Bool)

(assert (=> start!98680 (and (array_inv!27491 _values!996) e!653055)))

(declare-fun lt!513170 () ListLongMap!16309)

(declare-fun call!52962 () ListLongMap!16309)

(declare-fun bm!52961 () Bool)

(assert (=> bm!52961 (= call!52962 (+!3593 (ite c!113425 lt!513170 lt!513181) (ite c!113425 (tuple2!18341 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113427 (tuple2!18341 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18341 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!52962 () Bool)

(assert (=> bm!52962 (= call!52967 (getCurrentListMapNoExtraKeys!4644 lt!513169 lt!513171 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52963 () Bool)

(assert (=> bm!52963 (= call!52964 (getCurrentListMapNoExtraKeys!4644 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45047 () Bool)

(assert (=> mapIsEmpty!45047 mapRes!45047))

(declare-fun b!1148139 () Bool)

(assert (=> b!1148139 (= e!653057 e!653058)))

(declare-fun res!764080 () Bool)

(assert (=> b!1148139 (=> res!764080 e!653058)))

(assert (=> b!1148139 (= res!764080 (not (= (select (arr!35889 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1148139 e!653054))

(declare-fun c!113428 () Bool)

(assert (=> b!1148139 (= c!113428 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513177 () Unit!37722)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!543 (array!74477 array!74479 (_ BitVec 32) (_ BitVec 32) V!43547 V!43547 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37722)

(assert (=> b!1148139 (= lt!513177 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!543 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148140 () Bool)

(assert (=> b!1148140 (= e!653052 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513188) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!653063 () Bool)

(declare-fun b!1148141 () Bool)

(assert (=> b!1148141 (= e!653063 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52964 () Bool)

(declare-fun call!52969 () ListLongMap!16309)

(assert (=> bm!52964 (= call!52969 call!52962)))

(declare-fun bm!52965 () Bool)

(declare-fun call!52963 () Bool)

(assert (=> bm!52965 (= call!52963 (contains!6693 (ite c!113425 lt!513170 call!52969) k0!934))))

(declare-fun b!1148142 () Bool)

(declare-fun call!52966 () Bool)

(assert (=> b!1148142 call!52966))

(declare-fun lt!513187 () Unit!37722)

(assert (=> b!1148142 (= lt!513187 call!52968)))

(assert (=> b!1148142 (= e!653053 lt!513187)))

(declare-fun b!1148143 () Bool)

(declare-fun res!764090 () Bool)

(assert (=> b!1148143 (=> (not res!764090) (not e!653064))))

(assert (=> b!1148143 (= res!764090 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25088))))

(declare-fun b!1148144 () Bool)

(assert (=> b!1148144 (= c!113427 (and (not lt!513188) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653066 () Unit!37722)

(assert (=> b!1148144 (= e!653066 e!653065)))

(declare-fun b!1148145 () Bool)

(declare-fun res!764092 () Bool)

(assert (=> b!1148145 (=> (not res!764092) (not e!653064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148145 (= res!764092 (validMask!0 mask!1564))))

(declare-fun b!1148146 () Bool)

(declare-fun Unit!37725 () Unit!37722)

(assert (=> b!1148146 (= e!653053 Unit!37725)))

(declare-fun b!1148147 () Bool)

(assert (=> b!1148147 (contains!6693 call!52962 k0!934)))

(declare-fun lt!513173 () Unit!37722)

(assert (=> b!1148147 (= lt!513173 (addStillContains!844 lt!513170 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1148147 call!52963))

(assert (=> b!1148147 (= lt!513170 (+!3593 lt!513181 (tuple2!18341 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!513186 () Unit!37722)

(assert (=> b!1148147 (= lt!513186 call!52965)))

(assert (=> b!1148147 (= e!653066 lt!513173)))

(declare-fun b!1148148 () Bool)

(assert (=> b!1148148 (= e!653054 (= call!52967 (-!1305 call!52964 k0!934)))))

(declare-fun bm!52966 () Bool)

(assert (=> bm!52966 (= call!52966 call!52963)))

(declare-fun b!1148149 () Bool)

(declare-fun res!764091 () Bool)

(assert (=> b!1148149 (=> (not res!764091) (not e!653064))))

(assert (=> b!1148149 (= res!764091 (= (select (arr!35889 _keys!1208) i!673) k0!934))))

(declare-fun b!1148150 () Bool)

(declare-fun lt!513179 () Unit!37722)

(assert (=> b!1148150 (= e!653065 lt!513179)))

(assert (=> b!1148150 (= lt!513179 call!52968)))

(assert (=> b!1148150 call!52966))

(declare-fun b!1148151 () Bool)

(declare-fun Unit!37726 () Unit!37722)

(assert (=> b!1148151 (= e!653056 Unit!37726)))

(assert (=> b!1148151 (= lt!513188 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148151 (= c!113425 (and (not lt!513188) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513183 () Unit!37722)

(assert (=> b!1148151 (= lt!513183 e!653066)))

(declare-fun lt!513178 () Unit!37722)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!438 (array!74477 array!74479 (_ BitVec 32) (_ BitVec 32) V!43547 V!43547 (_ BitVec 64) (_ BitVec 32) Int) Unit!37722)

(assert (=> b!1148151 (= lt!513178 (lemmaListMapContainsThenArrayContainsFrom!438 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113426 () Bool)

(assert (=> b!1148151 (= c!113426 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764085 () Bool)

(assert (=> b!1148151 (= res!764085 e!653052)))

(assert (=> b!1148151 (=> (not res!764085) (not e!653063))))

(assert (=> b!1148151 e!653063))

(declare-fun lt!513184 () Unit!37722)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74477 (_ BitVec 32) (_ BitVec 32)) Unit!37722)

(assert (=> b!1148151 (= lt!513184 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148151 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25088)))

(declare-fun lt!513175 () Unit!37722)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74477 (_ BitVec 64) (_ BitVec 32) List!25091) Unit!37722)

(assert (=> b!1148151 (= lt!513175 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25088))))

(assert (=> b!1148151 false))

(assert (= (and start!98680 res!764087) b!1148145))

(assert (= (and b!1148145 res!764092) b!1148125))

(assert (= (and b!1148125 res!764084) b!1148135))

(assert (= (and b!1148135 res!764082) b!1148143))

(assert (= (and b!1148143 res!764090) b!1148138))

(assert (= (and b!1148138 res!764089) b!1148132))

(assert (= (and b!1148132 res!764088) b!1148149))

(assert (= (and b!1148149 res!764091) b!1148130))

(assert (= (and b!1148130 res!764079) b!1148122))

(assert (= (and b!1148122 res!764081) b!1148131))

(assert (= (and b!1148131 (not res!764086)) b!1148127))

(assert (= (and b!1148127 (not res!764093)) b!1148139))

(assert (= (and b!1148139 c!113428) b!1148148))

(assert (= (and b!1148139 (not c!113428)) b!1148129))

(assert (= (or b!1148148 b!1148129) bm!52962))

(assert (= (or b!1148148 b!1148129) bm!52963))

(assert (= (and b!1148139 (not res!764080)) b!1148133))

(assert (= (and b!1148133 c!113423) b!1148151))

(assert (= (and b!1148133 (not c!113423)) b!1148123))

(assert (= (and b!1148151 c!113425) b!1148147))

(assert (= (and b!1148151 (not c!113425)) b!1148144))

(assert (= (and b!1148144 c!113427) b!1148150))

(assert (= (and b!1148144 (not c!113427)) b!1148136))

(assert (= (and b!1148136 c!113424) b!1148142))

(assert (= (and b!1148136 (not c!113424)) b!1148146))

(assert (= (or b!1148150 b!1148142) bm!52959))

(assert (= (or b!1148150 b!1148142) bm!52964))

(assert (= (or b!1148150 b!1148142) bm!52966))

(assert (= (or b!1148147 bm!52966) bm!52965))

(assert (= (or b!1148147 bm!52959) bm!52960))

(assert (= (or b!1148147 bm!52964) bm!52961))

(assert (= (and b!1148151 c!113426) b!1148124))

(assert (= (and b!1148151 (not c!113426)) b!1148140))

(assert (= (and b!1148151 res!764085) b!1148141))

(assert (= (and b!1148133 res!764083) b!1148137))

(assert (= (and b!1148134 condMapEmpty!45047) mapIsEmpty!45047))

(assert (= (and b!1148134 (not condMapEmpty!45047)) mapNonEmpty!45047))

(get-info :version)

(assert (= (and mapNonEmpty!45047 ((_ is ValueCellFull!13698) mapValue!45047)) b!1148128))

(assert (= (and b!1148134 ((_ is ValueCellFull!13698) mapDefault!45047)) b!1148126))

(assert (= start!98680 b!1148134))

(declare-fun b_lambda!19391 () Bool)

(assert (=> (not b_lambda!19391) (not b!1148127)))

(declare-fun t!36367 () Bool)

(declare-fun tb!9097 () Bool)

(assert (=> (and start!98680 (= defaultEntry!1004 defaultEntry!1004) t!36367) tb!9097))

(declare-fun result!18759 () Bool)

(assert (=> tb!9097 (= result!18759 tp_is_empty!28815)))

(assert (=> b!1148127 t!36367))

(declare-fun b_and!39421 () Bool)

(assert (= b_and!39419 (and (=> t!36367 result!18759) b_and!39421)))

(declare-fun m!1058661 () Bool)

(assert (=> b!1148141 m!1058661))

(declare-fun m!1058663 () Bool)

(assert (=> b!1148127 m!1058663))

(declare-fun m!1058665 () Bool)

(assert (=> b!1148127 m!1058665))

(declare-fun m!1058667 () Bool)

(assert (=> b!1148127 m!1058667))

(declare-fun m!1058669 () Bool)

(assert (=> b!1148127 m!1058669))

(declare-fun m!1058671 () Bool)

(assert (=> bm!52960 m!1058671))

(declare-fun m!1058673 () Bool)

(assert (=> b!1148151 m!1058673))

(declare-fun m!1058675 () Bool)

(assert (=> b!1148151 m!1058675))

(declare-fun m!1058677 () Bool)

(assert (=> b!1148151 m!1058677))

(declare-fun m!1058679 () Bool)

(assert (=> b!1148151 m!1058679))

(declare-fun m!1058681 () Bool)

(assert (=> b!1148137 m!1058681))

(declare-fun m!1058683 () Bool)

(assert (=> bm!52963 m!1058683))

(declare-fun m!1058685 () Bool)

(assert (=> b!1148149 m!1058685))

(declare-fun m!1058687 () Bool)

(assert (=> b!1148148 m!1058687))

(assert (=> b!1148124 m!1058661))

(declare-fun m!1058689 () Bool)

(assert (=> start!98680 m!1058689))

(declare-fun m!1058691 () Bool)

(assert (=> start!98680 m!1058691))

(declare-fun m!1058693 () Bool)

(assert (=> bm!52961 m!1058693))

(declare-fun m!1058695 () Bool)

(assert (=> b!1148132 m!1058695))

(declare-fun m!1058697 () Bool)

(assert (=> b!1148135 m!1058697))

(declare-fun m!1058699 () Bool)

(assert (=> b!1148143 m!1058699))

(declare-fun m!1058701 () Bool)

(assert (=> bm!52962 m!1058701))

(declare-fun m!1058703 () Bool)

(assert (=> b!1148131 m!1058703))

(declare-fun m!1058705 () Bool)

(assert (=> b!1148131 m!1058705))

(declare-fun m!1058707 () Bool)

(assert (=> b!1148145 m!1058707))

(declare-fun m!1058709 () Bool)

(assert (=> b!1148130 m!1058709))

(declare-fun m!1058711 () Bool)

(assert (=> b!1148130 m!1058711))

(declare-fun m!1058713 () Bool)

(assert (=> b!1148147 m!1058713))

(declare-fun m!1058715 () Bool)

(assert (=> b!1148147 m!1058715))

(declare-fun m!1058717 () Bool)

(assert (=> b!1148147 m!1058717))

(declare-fun m!1058719 () Bool)

(assert (=> b!1148139 m!1058719))

(declare-fun m!1058721 () Bool)

(assert (=> b!1148139 m!1058721))

(declare-fun m!1058723 () Bool)

(assert (=> bm!52965 m!1058723))

(declare-fun m!1058725 () Bool)

(assert (=> b!1148122 m!1058725))

(declare-fun m!1058727 () Bool)

(assert (=> mapNonEmpty!45047 m!1058727))

(assert (=> b!1148133 m!1058683))

(declare-fun m!1058729 () Bool)

(assert (=> b!1148133 m!1058729))

(declare-fun m!1058731 () Bool)

(assert (=> b!1148133 m!1058731))

(declare-fun m!1058733 () Bool)

(assert (=> b!1148133 m!1058733))

(assert (=> b!1148133 m!1058729))

(declare-fun m!1058735 () Bool)

(assert (=> b!1148133 m!1058735))

(assert (=> b!1148133 m!1058719))

(declare-fun m!1058737 () Bool)

(assert (=> b!1148133 m!1058737))

(assert (=> b!1148133 m!1058731))

(assert (=> b!1148133 m!1058719))

(declare-fun m!1058739 () Bool)

(assert (=> b!1148133 m!1058739))

(assert (=> b!1148133 m!1058719))

(check-sat (not bm!52965) tp_is_empty!28815 (not b!1148127) (not bm!52963) (not b!1148139) (not b!1148145) (not b!1148135) (not b!1148141) (not b!1148133) (not b!1148122) (not b_next!24285) (not b!1148151) (not start!98680) (not b!1148132) (not b!1148137) b_and!39421 (not b!1148148) (not bm!52962) (not b!1148130) (not mapNonEmpty!45047) (not b_lambda!19391) (not b!1148147) (not b!1148124) (not bm!52960) (not b!1148131) (not b!1148143) (not bm!52961))
(check-sat b_and!39421 (not b_next!24285))
