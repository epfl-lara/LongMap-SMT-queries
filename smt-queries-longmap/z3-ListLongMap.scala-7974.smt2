; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98678 () Bool)

(assert start!98678)

(declare-fun b_free!24289 () Bool)

(declare-fun b_next!24289 () Bool)

(assert (=> start!98678 (= b_free!24289 (not b_next!24289))))

(declare-fun tp!85578 () Bool)

(declare-fun b_and!39405 () Bool)

(assert (=> start!98678 (= tp!85578 b_and!39405)))

(declare-fun b!1148182 () Bool)

(declare-datatypes ((Unit!37576 0))(
  ( (Unit!37577) )
))
(declare-fun e!653085 () Unit!37576)

(declare-fun Unit!37578 () Unit!37576)

(assert (=> b!1148182 (= e!653085 Unit!37578)))

(declare-fun bm!52984 () Bool)

(declare-fun call!52992 () Unit!37576)

(declare-fun call!52993 () Unit!37576)

(assert (=> bm!52984 (= call!52992 call!52993)))

(declare-fun b!1148183 () Bool)

(declare-fun res!764103 () Bool)

(declare-fun e!653078 () Bool)

(assert (=> b!1148183 (=> (not res!764103) (not e!653078))))

(declare-datatypes ((array!74408 0))(
  ( (array!74409 (arr!35855 (Array (_ BitVec 32) (_ BitVec 64))) (size!36393 (_ BitVec 32))) )
))
(declare-fun lt!513110 () array!74408)

(declare-datatypes ((List!25161 0))(
  ( (Nil!25158) (Cons!25157 (h!26366 (_ BitVec 64)) (t!36433 List!25161)) )
))
(declare-fun arrayNoDuplicates!0 (array!74408 (_ BitVec 32) List!25161) Bool)

(assert (=> b!1148183 (= res!764103 (arrayNoDuplicates!0 lt!513110 #b00000000000000000000000000000000 Nil!25158))))

(declare-fun b!1148184 () Bool)

(declare-fun e!653081 () Bool)

(assert (=> b!1148184 (= e!653081 e!653078)))

(declare-fun res!764111 () Bool)

(assert (=> b!1148184 (=> (not res!764111) (not e!653078))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74408 (_ BitVec 32)) Bool)

(assert (=> b!1148184 (= res!764111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513110 mask!1564))))

(declare-fun _keys!1208 () array!74408)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148184 (= lt!513110 (array!74409 (store (arr!35855 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36393 _keys!1208)))))

(declare-fun b!1148185 () Bool)

(declare-fun c!113434 () Bool)

(declare-fun lt!513118 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1148185 (= c!113434 (and (not lt!513118) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653082 () Unit!37576)

(declare-fun e!653079 () Unit!37576)

(assert (=> b!1148185 (= e!653082 e!653079)))

(declare-fun b!1148186 () Bool)

(declare-fun e!653080 () Bool)

(declare-fun tp_is_empty!28819 () Bool)

(assert (=> b!1148186 (= e!653080 tp_is_empty!28819)))

(declare-fun b!1148187 () Bool)

(declare-datatypes ((V!43553 0))(
  ( (V!43554 (val!14466 Int)) )
))
(declare-datatypes ((tuple2!18424 0))(
  ( (tuple2!18425 (_1!9223 (_ BitVec 64)) (_2!9223 V!43553)) )
))
(declare-datatypes ((List!25162 0))(
  ( (Nil!25159) (Cons!25158 (h!26367 tuple2!18424) (t!36434 List!25162)) )
))
(declare-datatypes ((ListLongMap!16393 0))(
  ( (ListLongMap!16394 (toList!8212 List!25162)) )
))
(declare-fun lt!513112 () ListLongMap!16393)

(declare-fun minValue!944 () V!43553)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6673 (ListLongMap!16393 (_ BitVec 64)) Bool)

(declare-fun +!3630 (ListLongMap!16393 tuple2!18424) ListLongMap!16393)

(assert (=> b!1148187 (contains!6673 (+!3630 lt!513112 (tuple2!18425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!513114 () Unit!37576)

(assert (=> b!1148187 (= lt!513114 call!52993)))

(declare-fun call!52994 () Bool)

(assert (=> b!1148187 call!52994))

(declare-fun call!52988 () ListLongMap!16393)

(assert (=> b!1148187 (= lt!513112 call!52988)))

(declare-fun zeroValue!944 () V!43553)

(declare-fun lt!513120 () ListLongMap!16393)

(declare-fun lt!513119 () Unit!37576)

(declare-fun addStillContains!842 (ListLongMap!16393 (_ BitVec 64) V!43553 (_ BitVec 64)) Unit!37576)

(assert (=> b!1148187 (= lt!513119 (addStillContains!842 lt!513120 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1148187 (= e!653082 lt!513114)))

(declare-fun b!1148188 () Bool)

(declare-fun lt!513123 () Unit!37576)

(assert (=> b!1148188 (= e!653079 lt!513123)))

(assert (=> b!1148188 (= lt!513123 call!52992)))

(declare-fun call!52989 () Bool)

(assert (=> b!1148188 call!52989))

(declare-fun b!1148189 () Bool)

(declare-fun e!653087 () Bool)

(assert (=> b!1148189 (= e!653087 tp_is_empty!28819)))

(declare-fun b!1148190 () Bool)

(declare-fun e!653083 () Bool)

(assert (=> b!1148190 (= e!653083 true)))

(declare-fun e!653088 () Bool)

(assert (=> b!1148190 e!653088))

(declare-fun res!764117 () Bool)

(assert (=> b!1148190 (=> (not res!764117) (not e!653088))))

(declare-fun lt!513122 () V!43553)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun -!1283 (ListLongMap!16393 (_ BitVec 64)) ListLongMap!16393)

(assert (=> b!1148190 (= res!764117 (= (-!1283 (+!3630 lt!513120 (tuple2!18425 (select (arr!35855 _keys!1208) from!1455) lt!513122)) (select (arr!35855 _keys!1208) from!1455)) lt!513120))))

(declare-fun lt!513117 () Unit!37576)

(declare-fun addThenRemoveForNewKeyIsSame!144 (ListLongMap!16393 (_ BitVec 64) V!43553) Unit!37576)

(assert (=> b!1148190 (= lt!513117 (addThenRemoveForNewKeyIsSame!144 lt!513120 (select (arr!35855 _keys!1208) from!1455) lt!513122))))

(declare-fun lt!513115 () V!43553)

(declare-datatypes ((ValueCell!13700 0))(
  ( (ValueCellFull!13700 (v!17102 V!43553)) (EmptyCell!13700) )
))
(declare-datatypes ((array!74410 0))(
  ( (array!74411 (arr!35856 (Array (_ BitVec 32) ValueCell!13700)) (size!36394 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74410)

(declare-fun get!18254 (ValueCell!13700 V!43553) V!43553)

(assert (=> b!1148190 (= lt!513122 (get!18254 (select (arr!35856 _values!996) from!1455) lt!513115))))

(declare-fun lt!513105 () Unit!37576)

(assert (=> b!1148190 (= lt!513105 e!653085)))

(declare-fun c!113433 () Bool)

(assert (=> b!1148190 (= c!113433 (contains!6673 lt!513120 k0!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4697 (array!74408 array!74410 (_ BitVec 32) (_ BitVec 32) V!43553 V!43553 (_ BitVec 32) Int) ListLongMap!16393)

(assert (=> b!1148190 (= lt!513120 (getCurrentListMapNoExtraKeys!4697 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148191 () Bool)

(declare-fun e!653075 () Bool)

(assert (=> b!1148191 (= e!653075 e!653083)))

(declare-fun res!764110 () Bool)

(assert (=> b!1148191 (=> res!764110 e!653083)))

(assert (=> b!1148191 (= res!764110 (not (= (select (arr!35855 _keys!1208) from!1455) k0!934)))))

(declare-fun e!653089 () Bool)

(assert (=> b!1148191 e!653089))

(declare-fun c!113436 () Bool)

(assert (=> b!1148191 (= c!113436 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513106 () Unit!37576)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!560 (array!74408 array!74410 (_ BitVec 32) (_ BitVec 32) V!43553 V!43553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37576)

(assert (=> b!1148191 (= lt!513106 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!560 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148192 () Bool)

(declare-fun e!653077 () Bool)

(assert (=> b!1148192 (= e!653078 (not e!653077))))

(declare-fun res!764113 () Bool)

(assert (=> b!1148192 (=> res!764113 e!653077)))

(assert (=> b!1148192 (= res!764113 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148192 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513108 () Unit!37576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74408 (_ BitVec 64) (_ BitVec 32)) Unit!37576)

(assert (=> b!1148192 (= lt!513108 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1148193 () Bool)

(declare-fun res!764108 () Bool)

(assert (=> b!1148193 (=> (not res!764108) (not e!653081))))

(assert (=> b!1148193 (= res!764108 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25158))))

(declare-fun b!1148194 () Bool)

(declare-fun lt!513111 () ListLongMap!16393)

(assert (=> b!1148194 (= e!653088 (= (-!1283 lt!513111 k0!934) lt!513120))))

(declare-fun call!52990 () ListLongMap!16393)

(declare-fun c!113437 () Bool)

(declare-fun bm!52985 () Bool)

(assert (=> bm!52985 (= call!52994 (contains!6673 (ite c!113437 lt!513112 call!52990) k0!934))))

(declare-fun bm!52986 () Bool)

(assert (=> bm!52986 (= call!52989 call!52994)))

(declare-fun b!1148195 () Bool)

(declare-fun e!653090 () Unit!37576)

(assert (=> b!1148195 (= e!653079 e!653090)))

(declare-fun c!113438 () Bool)

(assert (=> b!1148195 (= c!113438 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513118))))

(declare-fun b!1148196 () Bool)

(declare-fun res!764104 () Bool)

(assert (=> b!1148196 (=> (not res!764104) (not e!653081))))

(assert (=> b!1148196 (= res!764104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52987 () Bool)

(assert (=> bm!52987 (= call!52988 (+!3630 lt!513120 (ite (or c!113437 c!113434) (tuple2!18425 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18425 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun e!653076 () Bool)

(declare-fun b!1148197 () Bool)

(assert (=> b!1148197 (= e!653076 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148198 () Bool)

(assert (=> b!1148198 (= e!653077 e!653075)))

(declare-fun res!764107 () Bool)

(assert (=> b!1148198 (=> res!764107 e!653075)))

(assert (=> b!1148198 (= res!764107 (not (= from!1455 i!673)))))

(declare-fun lt!513104 () ListLongMap!16393)

(declare-fun lt!513103 () array!74410)

(assert (=> b!1148198 (= lt!513104 (getCurrentListMapNoExtraKeys!4697 lt!513110 lt!513103 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1148198 (= lt!513103 (array!74411 (store (arr!35856 _values!996) i!673 (ValueCellFull!13700 lt!513115)) (size!36394 _values!996)))))

(declare-fun dynLambda!2666 (Int (_ BitVec 64)) V!43553)

(assert (=> b!1148198 (= lt!513115 (dynLambda!2666 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1148198 (= lt!513111 (getCurrentListMapNoExtraKeys!4697 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1148199 () Bool)

(declare-fun call!52991 () ListLongMap!16393)

(declare-fun call!52987 () ListLongMap!16393)

(assert (=> b!1148199 (= e!653089 (= call!52991 call!52987))))

(declare-fun b!1148200 () Bool)

(declare-fun res!764109 () Bool)

(assert (=> b!1148200 (=> (not res!764109) (not e!653081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148200 (= res!764109 (validMask!0 mask!1564))))

(declare-fun b!1148201 () Bool)

(declare-fun res!764116 () Bool)

(assert (=> b!1148201 (=> (not res!764116) (not e!653081))))

(assert (=> b!1148201 (= res!764116 (= (select (arr!35855 _keys!1208) i!673) k0!934))))

(declare-fun b!1148202 () Bool)

(declare-fun res!764112 () Bool)

(assert (=> b!1148202 (=> (not res!764112) (not e!653081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148202 (= res!764112 (validKeyInArray!0 k0!934))))

(declare-fun b!1148203 () Bool)

(assert (=> b!1148203 call!52989))

(declare-fun lt!513109 () Unit!37576)

(assert (=> b!1148203 (= lt!513109 call!52992)))

(assert (=> b!1148203 (= e!653090 lt!513109)))

(declare-fun b!1148204 () Bool)

(declare-fun e!653084 () Bool)

(declare-fun mapRes!45053 () Bool)

(assert (=> b!1148204 (= e!653084 (and e!653087 mapRes!45053))))

(declare-fun condMapEmpty!45053 () Bool)

(declare-fun mapDefault!45053 () ValueCell!13700)

(assert (=> b!1148204 (= condMapEmpty!45053 (= (arr!35856 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13700)) mapDefault!45053)))))

(declare-fun bm!52988 () Bool)

(assert (=> bm!52988 (= call!52987 (getCurrentListMapNoExtraKeys!4697 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!764115 () Bool)

(assert (=> start!98678 (=> (not res!764115) (not e!653081))))

(assert (=> start!98678 (= res!764115 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36393 _keys!1208))))))

(assert (=> start!98678 e!653081))

(assert (=> start!98678 tp_is_empty!28819))

(declare-fun array_inv!27552 (array!74408) Bool)

(assert (=> start!98678 (array_inv!27552 _keys!1208)))

(assert (=> start!98678 true))

(assert (=> start!98678 tp!85578))

(declare-fun array_inv!27553 (array!74410) Bool)

(assert (=> start!98678 (and (array_inv!27553 _values!996) e!653084)))

(declare-fun b!1148205 () Bool)

(declare-fun Unit!37579 () Unit!37576)

(assert (=> b!1148205 (= e!653085 Unit!37579)))

(assert (=> b!1148205 (= lt!513118 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148205 (= c!113437 (and (not lt!513118) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513113 () Unit!37576)

(assert (=> b!1148205 (= lt!513113 e!653082)))

(declare-fun lt!513121 () Unit!37576)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!435 (array!74408 array!74410 (_ BitVec 32) (_ BitVec 32) V!43553 V!43553 (_ BitVec 64) (_ BitVec 32) Int) Unit!37576)

(assert (=> b!1148205 (= lt!513121 (lemmaListMapContainsThenArrayContainsFrom!435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113435 () Bool)

(assert (=> b!1148205 (= c!113435 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764114 () Bool)

(assert (=> b!1148205 (= res!764114 e!653076)))

(declare-fun e!653091 () Bool)

(assert (=> b!1148205 (=> (not res!764114) (not e!653091))))

(assert (=> b!1148205 e!653091))

(declare-fun lt!513107 () Unit!37576)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74408 (_ BitVec 32) (_ BitVec 32)) Unit!37576)

(assert (=> b!1148205 (= lt!513107 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148205 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25158)))

(declare-fun lt!513116 () Unit!37576)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74408 (_ BitVec 64) (_ BitVec 32) List!25161) Unit!37576)

(assert (=> b!1148205 (= lt!513116 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25158))))

(assert (=> b!1148205 false))

(declare-fun mapNonEmpty!45053 () Bool)

(declare-fun tp!85577 () Bool)

(assert (=> mapNonEmpty!45053 (= mapRes!45053 (and tp!85577 e!653080))))

(declare-fun mapKey!45053 () (_ BitVec 32))

(declare-fun mapValue!45053 () ValueCell!13700)

(declare-fun mapRest!45053 () (Array (_ BitVec 32) ValueCell!13700))

(assert (=> mapNonEmpty!45053 (= (arr!35856 _values!996) (store mapRest!45053 mapKey!45053 mapValue!45053))))

(declare-fun b!1148206 () Bool)

(assert (=> b!1148206 (= e!653089 (= call!52991 (-!1283 call!52987 k0!934)))))

(declare-fun b!1148207 () Bool)

(declare-fun res!764105 () Bool)

(assert (=> b!1148207 (=> (not res!764105) (not e!653081))))

(assert (=> b!1148207 (= res!764105 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36393 _keys!1208))))))

(declare-fun b!1148208 () Bool)

(assert (=> b!1148208 (= e!653091 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148209 () Bool)

(declare-fun res!764106 () Bool)

(assert (=> b!1148209 (=> (not res!764106) (not e!653081))))

(assert (=> b!1148209 (= res!764106 (and (= (size!36394 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36393 _keys!1208) (size!36394 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148210 () Bool)

(declare-fun Unit!37580 () Unit!37576)

(assert (=> b!1148210 (= e!653090 Unit!37580)))

(declare-fun bm!52989 () Bool)

(assert (=> bm!52989 (= call!52990 call!52988)))

(declare-fun mapIsEmpty!45053 () Bool)

(assert (=> mapIsEmpty!45053 mapRes!45053))

(declare-fun bm!52990 () Bool)

(assert (=> bm!52990 (= call!52993 (addStillContains!842 (ite c!113437 lt!513112 lt!513120) (ite c!113437 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113434 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113437 minValue!944 (ite c!113434 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!52991 () Bool)

(assert (=> bm!52991 (= call!52991 (getCurrentListMapNoExtraKeys!4697 lt!513110 lt!513103 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148211 () Bool)

(assert (=> b!1148211 (= e!653076 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513118) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!98678 res!764115) b!1148200))

(assert (= (and b!1148200 res!764109) b!1148209))

(assert (= (and b!1148209 res!764106) b!1148196))

(assert (= (and b!1148196 res!764104) b!1148193))

(assert (= (and b!1148193 res!764108) b!1148207))

(assert (= (and b!1148207 res!764105) b!1148202))

(assert (= (and b!1148202 res!764112) b!1148201))

(assert (= (and b!1148201 res!764116) b!1148184))

(assert (= (and b!1148184 res!764111) b!1148183))

(assert (= (and b!1148183 res!764103) b!1148192))

(assert (= (and b!1148192 (not res!764113)) b!1148198))

(assert (= (and b!1148198 (not res!764107)) b!1148191))

(assert (= (and b!1148191 c!113436) b!1148206))

(assert (= (and b!1148191 (not c!113436)) b!1148199))

(assert (= (or b!1148206 b!1148199) bm!52991))

(assert (= (or b!1148206 b!1148199) bm!52988))

(assert (= (and b!1148191 (not res!764110)) b!1148190))

(assert (= (and b!1148190 c!113433) b!1148205))

(assert (= (and b!1148190 (not c!113433)) b!1148182))

(assert (= (and b!1148205 c!113437) b!1148187))

(assert (= (and b!1148205 (not c!113437)) b!1148185))

(assert (= (and b!1148185 c!113434) b!1148188))

(assert (= (and b!1148185 (not c!113434)) b!1148195))

(assert (= (and b!1148195 c!113438) b!1148203))

(assert (= (and b!1148195 (not c!113438)) b!1148210))

(assert (= (or b!1148188 b!1148203) bm!52984))

(assert (= (or b!1148188 b!1148203) bm!52989))

(assert (= (or b!1148188 b!1148203) bm!52986))

(assert (= (or b!1148187 bm!52986) bm!52985))

(assert (= (or b!1148187 bm!52984) bm!52990))

(assert (= (or b!1148187 bm!52989) bm!52987))

(assert (= (and b!1148205 c!113435) b!1148197))

(assert (= (and b!1148205 (not c!113435)) b!1148211))

(assert (= (and b!1148205 res!764114) b!1148208))

(assert (= (and b!1148190 res!764117) b!1148194))

(assert (= (and b!1148204 condMapEmpty!45053) mapIsEmpty!45053))

(assert (= (and b!1148204 (not condMapEmpty!45053)) mapNonEmpty!45053))

(get-info :version)

(assert (= (and mapNonEmpty!45053 ((_ is ValueCellFull!13700) mapValue!45053)) b!1148186))

(assert (= (and b!1148204 ((_ is ValueCellFull!13700) mapDefault!45053)) b!1148189))

(assert (= start!98678 b!1148204))

(declare-fun b_lambda!19377 () Bool)

(assert (=> (not b_lambda!19377) (not b!1148198)))

(declare-fun t!36432 () Bool)

(declare-fun tb!9093 () Bool)

(assert (=> (and start!98678 (= defaultEntry!1004 defaultEntry!1004) t!36432) tb!9093))

(declare-fun result!18759 () Bool)

(assert (=> tb!9093 (= result!18759 tp_is_empty!28819)))

(assert (=> b!1148198 t!36432))

(declare-fun b_and!39407 () Bool)

(assert (= b_and!39405 (and (=> t!36432 result!18759) b_and!39407)))

(declare-fun m!1058223 () Bool)

(assert (=> b!1148197 m!1058223))

(declare-fun m!1058225 () Bool)

(assert (=> start!98678 m!1058225))

(declare-fun m!1058227 () Bool)

(assert (=> start!98678 m!1058227))

(declare-fun m!1058229 () Bool)

(assert (=> b!1148202 m!1058229))

(declare-fun m!1058231 () Bool)

(assert (=> bm!52991 m!1058231))

(declare-fun m!1058233 () Bool)

(assert (=> b!1148190 m!1058233))

(declare-fun m!1058235 () Bool)

(assert (=> b!1148190 m!1058235))

(assert (=> b!1148190 m!1058235))

(declare-fun m!1058237 () Bool)

(assert (=> b!1148190 m!1058237))

(declare-fun m!1058239 () Bool)

(assert (=> b!1148190 m!1058239))

(declare-fun m!1058241 () Bool)

(assert (=> b!1148190 m!1058241))

(declare-fun m!1058243 () Bool)

(assert (=> b!1148190 m!1058243))

(declare-fun m!1058245 () Bool)

(assert (=> b!1148190 m!1058245))

(assert (=> b!1148190 m!1058243))

(assert (=> b!1148190 m!1058239))

(assert (=> b!1148190 m!1058243))

(declare-fun m!1058247 () Bool)

(assert (=> b!1148190 m!1058247))

(declare-fun m!1058249 () Bool)

(assert (=> mapNonEmpty!45053 m!1058249))

(declare-fun m!1058251 () Bool)

(assert (=> b!1148193 m!1058251))

(assert (=> b!1148208 m!1058223))

(declare-fun m!1058253 () Bool)

(assert (=> b!1148192 m!1058253))

(declare-fun m!1058255 () Bool)

(assert (=> b!1148192 m!1058255))

(declare-fun m!1058257 () Bool)

(assert (=> b!1148184 m!1058257))

(declare-fun m!1058259 () Bool)

(assert (=> b!1148184 m!1058259))

(declare-fun m!1058261 () Bool)

(assert (=> b!1148205 m!1058261))

(declare-fun m!1058263 () Bool)

(assert (=> b!1148205 m!1058263))

(declare-fun m!1058265 () Bool)

(assert (=> b!1148205 m!1058265))

(declare-fun m!1058267 () Bool)

(assert (=> b!1148205 m!1058267))

(declare-fun m!1058269 () Bool)

(assert (=> b!1148206 m!1058269))

(declare-fun m!1058271 () Bool)

(assert (=> bm!52985 m!1058271))

(declare-fun m!1058273 () Bool)

(assert (=> b!1148183 m!1058273))

(declare-fun m!1058275 () Bool)

(assert (=> b!1148201 m!1058275))

(assert (=> bm!52988 m!1058233))

(declare-fun m!1058277 () Bool)

(assert (=> b!1148196 m!1058277))

(declare-fun m!1058279 () Bool)

(assert (=> b!1148187 m!1058279))

(assert (=> b!1148187 m!1058279))

(declare-fun m!1058281 () Bool)

(assert (=> b!1148187 m!1058281))

(declare-fun m!1058283 () Bool)

(assert (=> b!1148187 m!1058283))

(declare-fun m!1058285 () Bool)

(assert (=> b!1148194 m!1058285))

(assert (=> b!1148191 m!1058243))

(declare-fun m!1058287 () Bool)

(assert (=> b!1148191 m!1058287))

(declare-fun m!1058289 () Bool)

(assert (=> bm!52987 m!1058289))

(declare-fun m!1058291 () Bool)

(assert (=> b!1148200 m!1058291))

(declare-fun m!1058293 () Bool)

(assert (=> b!1148198 m!1058293))

(declare-fun m!1058295 () Bool)

(assert (=> b!1148198 m!1058295))

(declare-fun m!1058297 () Bool)

(assert (=> b!1148198 m!1058297))

(declare-fun m!1058299 () Bool)

(assert (=> b!1148198 m!1058299))

(declare-fun m!1058301 () Bool)

(assert (=> bm!52990 m!1058301))

(check-sat (not b!1148202) (not bm!52988) (not b!1148192) tp_is_empty!28819 (not start!98678) (not mapNonEmpty!45053) (not b!1148205) (not bm!52985) (not b!1148191) (not b!1148187) (not b!1148183) b_and!39407 (not b!1148194) (not b!1148197) (not b!1148206) (not b_next!24289) (not b!1148184) (not bm!52990) (not b_lambda!19377) (not b!1148198) (not b!1148196) (not bm!52987) (not b!1148193) (not b!1148190) (not bm!52991) (not b!1148208) (not b!1148200))
(check-sat b_and!39407 (not b_next!24289))
