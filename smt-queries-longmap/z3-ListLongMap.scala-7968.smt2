; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98642 () Bool)

(assert start!98642)

(declare-fun b_free!24253 () Bool)

(declare-fun b_next!24253 () Bool)

(assert (=> start!98642 (= b_free!24253 (not b_next!24253))))

(declare-fun tp!85470 () Bool)

(declare-fun b_and!39333 () Bool)

(assert (=> start!98642 (= tp!85470 b_and!39333)))

(declare-fun b!1146526 () Bool)

(declare-datatypes ((Unit!37514 0))(
  ( (Unit!37515) )
))
(declare-fun e!652169 () Unit!37514)

(declare-fun e!652157 () Unit!37514)

(assert (=> b!1146526 (= e!652169 e!652157)))

(declare-fun c!113111 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!511987 () Bool)

(assert (=> b!1146526 (= c!113111 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511987))))

(declare-fun mapIsEmpty!44999 () Bool)

(declare-fun mapRes!44999 () Bool)

(assert (=> mapIsEmpty!44999 mapRes!44999))

(declare-fun b!1146527 () Bool)

(declare-fun e!652160 () Unit!37514)

(declare-fun Unit!37516 () Unit!37514)

(assert (=> b!1146527 (= e!652160 Unit!37516)))

(assert (=> b!1146527 (= lt!511987 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113114 () Bool)

(assert (=> b!1146527 (= c!113114 (and (not lt!511987) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511969 () Unit!37514)

(declare-fun e!652171 () Unit!37514)

(assert (=> b!1146527 (= lt!511969 e!652171)))

(declare-datatypes ((V!43505 0))(
  ( (V!43506 (val!14448 Int)) )
))
(declare-fun zeroValue!944 () V!43505)

(declare-datatypes ((array!74338 0))(
  ( (array!74339 (arr!35820 (Array (_ BitVec 32) (_ BitVec 64))) (size!36358 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74338)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!511989 () Unit!37514)

(declare-datatypes ((ValueCell!13682 0))(
  ( (ValueCellFull!13682 (v!17084 V!43505)) (EmptyCell!13682) )
))
(declare-datatypes ((array!74340 0))(
  ( (array!74341 (arr!35821 (Array (_ BitVec 32) ValueCell!13682)) (size!36359 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74340)

(declare-fun minValue!944 () V!43505)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!427 (array!74338 array!74340 (_ BitVec 32) (_ BitVec 32) V!43505 V!43505 (_ BitVec 64) (_ BitVec 32) Int) Unit!37514)

(assert (=> b!1146527 (= lt!511989 (lemmaListMapContainsThenArrayContainsFrom!427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113113 () Bool)

(assert (=> b!1146527 (= c!113113 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763296 () Bool)

(declare-fun e!652164 () Bool)

(assert (=> b!1146527 (= res!763296 e!652164)))

(declare-fun e!652159 () Bool)

(assert (=> b!1146527 (=> (not res!763296) (not e!652159))))

(assert (=> b!1146527 e!652159))

(declare-fun lt!511971 () Unit!37514)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74338 (_ BitVec 32) (_ BitVec 32)) Unit!37514)

(assert (=> b!1146527 (= lt!511971 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25133 0))(
  ( (Nil!25130) (Cons!25129 (h!26338 (_ BitVec 64)) (t!36369 List!25133)) )
))
(declare-fun arrayNoDuplicates!0 (array!74338 (_ BitVec 32) List!25133) Bool)

(assert (=> b!1146527 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25130)))

(declare-fun lt!511985 () Unit!37514)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74338 (_ BitVec 64) (_ BitVec 32) List!25133) Unit!37514)

(assert (=> b!1146527 (= lt!511985 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25130))))

(assert (=> b!1146527 false))

(declare-fun b!1146528 () Bool)

(declare-fun res!763305 () Bool)

(declare-fun e!652167 () Bool)

(assert (=> b!1146528 (=> (not res!763305) (not e!652167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146528 (= res!763305 (validKeyInArray!0 k0!934))))

(declare-fun b!1146529 () Bool)

(declare-fun e!652170 () Bool)

(declare-fun tp_is_empty!28783 () Bool)

(assert (=> b!1146529 (= e!652170 tp_is_empty!28783)))

(declare-fun b!1146530 () Bool)

(declare-fun arrayContainsKey!0 (array!74338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146530 (= e!652159 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146531 () Bool)

(declare-fun res!763302 () Bool)

(assert (=> b!1146531 (=> (not res!763302) (not e!652167))))

(assert (=> b!1146531 (= res!763302 (and (= (size!36359 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36358 _keys!1208) (size!36359 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146532 () Bool)

(declare-fun e!652163 () Bool)

(declare-datatypes ((tuple2!18396 0))(
  ( (tuple2!18397 (_1!9209 (_ BitVec 64)) (_2!9209 V!43505)) )
))
(declare-datatypes ((List!25134 0))(
  ( (Nil!25131) (Cons!25130 (h!26339 tuple2!18396) (t!36370 List!25134)) )
))
(declare-datatypes ((ListLongMap!16365 0))(
  ( (ListLongMap!16366 (toList!8198 List!25134)) )
))
(declare-fun call!52561 () ListLongMap!16365)

(declare-fun call!52557 () ListLongMap!16365)

(assert (=> b!1146532 (= e!652163 (= call!52561 call!52557))))

(declare-fun b!1146533 () Bool)

(declare-fun lt!511972 () Unit!37514)

(assert (=> b!1146533 (= e!652169 lt!511972)))

(declare-fun call!52556 () Unit!37514)

(assert (=> b!1146533 (= lt!511972 call!52556)))

(declare-fun call!52560 () Bool)

(assert (=> b!1146533 call!52560))

(declare-fun b!1146534 () Bool)

(declare-fun Unit!37517 () Unit!37514)

(assert (=> b!1146534 (= e!652160 Unit!37517)))

(declare-fun mapNonEmpty!44999 () Bool)

(declare-fun tp!85469 () Bool)

(declare-fun e!652165 () Bool)

(assert (=> mapNonEmpty!44999 (= mapRes!44999 (and tp!85469 e!652165))))

(declare-fun mapKey!44999 () (_ BitVec 32))

(declare-fun mapRest!44999 () (Array (_ BitVec 32) ValueCell!13682))

(declare-fun mapValue!44999 () ValueCell!13682)

(assert (=> mapNonEmpty!44999 (= (arr!35821 _values!996) (store mapRest!44999 mapKey!44999 mapValue!44999))))

(declare-fun b!1146535 () Bool)

(declare-fun res!763307 () Bool)

(assert (=> b!1146535 (=> (not res!763307) (not e!652167))))

(assert (=> b!1146535 (= res!763307 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25130))))

(declare-fun b!1146536 () Bool)

(assert (=> b!1146536 (= e!652164 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52552 () Bool)

(declare-fun call!52558 () Bool)

(assert (=> bm!52552 (= call!52560 call!52558)))

(declare-fun lt!511973 () ListLongMap!16365)

(declare-fun e!652162 () Bool)

(declare-fun b!1146537 () Bool)

(declare-fun lt!511979 () ListLongMap!16365)

(declare-fun -!1272 (ListLongMap!16365 (_ BitVec 64)) ListLongMap!16365)

(assert (=> b!1146537 (= e!652162 (= (-!1272 lt!511979 k0!934) lt!511973))))

(declare-fun bm!52553 () Bool)

(declare-fun c!113109 () Bool)

(declare-fun call!52555 () Unit!37514)

(declare-fun lt!511970 () ListLongMap!16365)

(declare-fun addStillContains!831 (ListLongMap!16365 (_ BitVec 64) V!43505 (_ BitVec 64)) Unit!37514)

(assert (=> bm!52553 (= call!52555 (addStillContains!831 (ite c!113114 lt!511970 lt!511973) (ite c!113114 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113109 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113114 minValue!944 (ite c!113109 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1146538 () Bool)

(declare-fun e!652168 () Bool)

(assert (=> b!1146538 (= e!652168 (and e!652170 mapRes!44999))))

(declare-fun condMapEmpty!44999 () Bool)

(declare-fun mapDefault!44999 () ValueCell!13682)

(assert (=> b!1146538 (= condMapEmpty!44999 (= (arr!35821 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13682)) mapDefault!44999)))))

(declare-fun b!1146539 () Bool)

(declare-fun res!763304 () Bool)

(assert (=> b!1146539 (=> (not res!763304) (not e!652167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146539 (= res!763304 (validMask!0 mask!1564))))

(declare-fun bm!52554 () Bool)

(assert (=> bm!52554 (= call!52556 call!52555)))

(declare-fun b!1146540 () Bool)

(declare-fun res!763303 () Bool)

(declare-fun e!652161 () Bool)

(assert (=> b!1146540 (=> (not res!763303) (not e!652161))))

(declare-fun lt!511981 () array!74338)

(assert (=> b!1146540 (= res!763303 (arrayNoDuplicates!0 lt!511981 #b00000000000000000000000000000000 Nil!25130))))

(declare-fun b!1146541 () Bool)

(assert (=> b!1146541 (= e!652163 (= call!52561 (-!1272 call!52557 k0!934)))))

(declare-fun b!1146542 () Bool)

(declare-fun res!763306 () Bool)

(assert (=> b!1146542 (=> (not res!763306) (not e!652167))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146542 (= res!763306 (= (select (arr!35820 _keys!1208) i!673) k0!934))))

(declare-fun res!763295 () Bool)

(assert (=> start!98642 (=> (not res!763295) (not e!652167))))

(assert (=> start!98642 (= res!763295 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36358 _keys!1208))))))

(assert (=> start!98642 e!652167))

(assert (=> start!98642 tp_is_empty!28783))

(declare-fun array_inv!27528 (array!74338) Bool)

(assert (=> start!98642 (array_inv!27528 _keys!1208)))

(assert (=> start!98642 true))

(assert (=> start!98642 tp!85470))

(declare-fun array_inv!27529 (array!74340) Bool)

(assert (=> start!98642 (and (array_inv!27529 _values!996) e!652168)))

(declare-fun b!1146543 () Bool)

(declare-fun e!652166 () Bool)

(assert (=> b!1146543 (= e!652166 true)))

(assert (=> b!1146543 e!652162))

(declare-fun res!763299 () Bool)

(assert (=> b!1146543 (=> (not res!763299) (not e!652162))))

(declare-fun lt!511984 () V!43505)

(declare-fun +!3618 (ListLongMap!16365 tuple2!18396) ListLongMap!16365)

(assert (=> b!1146543 (= res!763299 (= (-!1272 (+!3618 lt!511973 (tuple2!18397 (select (arr!35820 _keys!1208) from!1455) lt!511984)) (select (arr!35820 _keys!1208) from!1455)) lt!511973))))

(declare-fun lt!511988 () Unit!37514)

(declare-fun addThenRemoveForNewKeyIsSame!135 (ListLongMap!16365 (_ BitVec 64) V!43505) Unit!37514)

(assert (=> b!1146543 (= lt!511988 (addThenRemoveForNewKeyIsSame!135 lt!511973 (select (arr!35820 _keys!1208) from!1455) lt!511984))))

(declare-fun lt!511983 () V!43505)

(declare-fun get!18233 (ValueCell!13682 V!43505) V!43505)

(assert (=> b!1146543 (= lt!511984 (get!18233 (select (arr!35821 _values!996) from!1455) lt!511983))))

(declare-fun lt!511978 () Unit!37514)

(assert (=> b!1146543 (= lt!511978 e!652160)))

(declare-fun c!113112 () Bool)

(declare-fun contains!6662 (ListLongMap!16365 (_ BitVec 64)) Bool)

(assert (=> b!1146543 (= c!113112 (contains!6662 lt!511973 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4684 (array!74338 array!74340 (_ BitVec 32) (_ BitVec 32) V!43505 V!43505 (_ BitVec 32) Int) ListLongMap!16365)

(assert (=> b!1146543 (= lt!511973 (getCurrentListMapNoExtraKeys!4684 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146544 () Bool)

(declare-fun e!652172 () Bool)

(assert (=> b!1146544 (= e!652161 (not e!652172))))

(declare-fun res!763298 () Bool)

(assert (=> b!1146544 (=> res!763298 e!652172)))

(assert (=> b!1146544 (= res!763298 (bvsgt from!1455 i!673))))

(assert (=> b!1146544 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511986 () Unit!37514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74338 (_ BitVec 64) (_ BitVec 32)) Unit!37514)

(assert (=> b!1146544 (= lt!511986 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1146545 () Bool)

(declare-fun e!652158 () Bool)

(assert (=> b!1146545 (= e!652158 e!652166)))

(declare-fun res!763301 () Bool)

(assert (=> b!1146545 (=> res!763301 e!652166)))

(assert (=> b!1146545 (= res!763301 (not (= (select (arr!35820 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1146545 e!652163))

(declare-fun c!113110 () Bool)

(assert (=> b!1146545 (= c!113110 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511975 () Unit!37514)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!551 (array!74338 array!74340 (_ BitVec 32) (_ BitVec 32) V!43505 V!43505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37514)

(assert (=> b!1146545 (= lt!511975 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!551 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52555 () Bool)

(declare-fun call!52562 () ListLongMap!16365)

(assert (=> bm!52555 (= call!52558 (contains!6662 (ite c!113114 lt!511970 call!52562) k0!934))))

(declare-fun b!1146546 () Bool)

(declare-fun Unit!37518 () Unit!37514)

(assert (=> b!1146546 (= e!652157 Unit!37518)))

(declare-fun b!1146547 () Bool)

(assert (=> b!1146547 (= e!652167 e!652161)))

(declare-fun res!763300 () Bool)

(assert (=> b!1146547 (=> (not res!763300) (not e!652161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74338 (_ BitVec 32)) Bool)

(assert (=> b!1146547 (= res!763300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511981 mask!1564))))

(assert (=> b!1146547 (= lt!511981 (array!74339 (store (arr!35820 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36358 _keys!1208)))))

(declare-fun b!1146548 () Bool)

(assert (=> b!1146548 (= e!652164 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511987) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!52559 () ListLongMap!16365)

(declare-fun bm!52556 () Bool)

(assert (=> bm!52556 (= call!52559 (+!3618 (ite c!113114 lt!511970 lt!511973) (ite c!113114 (tuple2!18397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113109 (tuple2!18397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1146549 () Bool)

(assert (=> b!1146549 (= e!652165 tp_is_empty!28783)))

(declare-fun bm!52557 () Bool)

(assert (=> bm!52557 (= call!52557 (getCurrentListMapNoExtraKeys!4684 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146550 () Bool)

(assert (=> b!1146550 (= c!113109 (and (not lt!511987) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1146550 (= e!652171 e!652169)))

(declare-fun bm!52558 () Bool)

(assert (=> bm!52558 (= call!52562 call!52559)))

(declare-fun b!1146551 () Bool)

(assert (=> b!1146551 (= e!652172 e!652158)))

(declare-fun res!763294 () Bool)

(assert (=> b!1146551 (=> res!763294 e!652158)))

(assert (=> b!1146551 (= res!763294 (not (= from!1455 i!673)))))

(declare-fun lt!511974 () ListLongMap!16365)

(declare-fun lt!511977 () array!74340)

(assert (=> b!1146551 (= lt!511974 (getCurrentListMapNoExtraKeys!4684 lt!511981 lt!511977 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1146551 (= lt!511977 (array!74341 (store (arr!35821 _values!996) i!673 (ValueCellFull!13682 lt!511983)) (size!36359 _values!996)))))

(declare-fun dynLambda!2654 (Int (_ BitVec 64)) V!43505)

(assert (=> b!1146551 (= lt!511983 (dynLambda!2654 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1146551 (= lt!511979 (getCurrentListMapNoExtraKeys!4684 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1146552 () Bool)

(declare-fun res!763297 () Bool)

(assert (=> b!1146552 (=> (not res!763297) (not e!652167))))

(assert (=> b!1146552 (= res!763297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52559 () Bool)

(assert (=> bm!52559 (= call!52561 (getCurrentListMapNoExtraKeys!4684 lt!511981 lt!511977 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146553 () Bool)

(assert (=> b!1146553 call!52560))

(declare-fun lt!511976 () Unit!37514)

(assert (=> b!1146553 (= lt!511976 call!52556)))

(assert (=> b!1146553 (= e!652157 lt!511976)))

(declare-fun b!1146554 () Bool)

(declare-fun res!763293 () Bool)

(assert (=> b!1146554 (=> (not res!763293) (not e!652167))))

(assert (=> b!1146554 (= res!763293 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36358 _keys!1208))))))

(declare-fun b!1146555 () Bool)

(assert (=> b!1146555 (contains!6662 call!52559 k0!934)))

(declare-fun lt!511980 () Unit!37514)

(assert (=> b!1146555 (= lt!511980 call!52555)))

(assert (=> b!1146555 call!52558))

(assert (=> b!1146555 (= lt!511970 (+!3618 lt!511973 (tuple2!18397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511982 () Unit!37514)

(assert (=> b!1146555 (= lt!511982 (addStillContains!831 lt!511973 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1146555 (= e!652171 lt!511980)))

(assert (= (and start!98642 res!763295) b!1146539))

(assert (= (and b!1146539 res!763304) b!1146531))

(assert (= (and b!1146531 res!763302) b!1146552))

(assert (= (and b!1146552 res!763297) b!1146535))

(assert (= (and b!1146535 res!763307) b!1146554))

(assert (= (and b!1146554 res!763293) b!1146528))

(assert (= (and b!1146528 res!763305) b!1146542))

(assert (= (and b!1146542 res!763306) b!1146547))

(assert (= (and b!1146547 res!763300) b!1146540))

(assert (= (and b!1146540 res!763303) b!1146544))

(assert (= (and b!1146544 (not res!763298)) b!1146551))

(assert (= (and b!1146551 (not res!763294)) b!1146545))

(assert (= (and b!1146545 c!113110) b!1146541))

(assert (= (and b!1146545 (not c!113110)) b!1146532))

(assert (= (or b!1146541 b!1146532) bm!52557))

(assert (= (or b!1146541 b!1146532) bm!52559))

(assert (= (and b!1146545 (not res!763301)) b!1146543))

(assert (= (and b!1146543 c!113112) b!1146527))

(assert (= (and b!1146543 (not c!113112)) b!1146534))

(assert (= (and b!1146527 c!113114) b!1146555))

(assert (= (and b!1146527 (not c!113114)) b!1146550))

(assert (= (and b!1146550 c!113109) b!1146533))

(assert (= (and b!1146550 (not c!113109)) b!1146526))

(assert (= (and b!1146526 c!113111) b!1146553))

(assert (= (and b!1146526 (not c!113111)) b!1146546))

(assert (= (or b!1146533 b!1146553) bm!52554))

(assert (= (or b!1146533 b!1146553) bm!52558))

(assert (= (or b!1146533 b!1146553) bm!52552))

(assert (= (or b!1146555 bm!52552) bm!52555))

(assert (= (or b!1146555 bm!52554) bm!52553))

(assert (= (or b!1146555 bm!52558) bm!52556))

(assert (= (and b!1146527 c!113113) b!1146536))

(assert (= (and b!1146527 (not c!113113)) b!1146548))

(assert (= (and b!1146527 res!763296) b!1146530))

(assert (= (and b!1146543 res!763299) b!1146537))

(assert (= (and b!1146538 condMapEmpty!44999) mapIsEmpty!44999))

(assert (= (and b!1146538 (not condMapEmpty!44999)) mapNonEmpty!44999))

(get-info :version)

(assert (= (and mapNonEmpty!44999 ((_ is ValueCellFull!13682) mapValue!44999)) b!1146549))

(assert (= (and b!1146538 ((_ is ValueCellFull!13682) mapDefault!44999)) b!1146529))

(assert (= start!98642 b!1146538))

(declare-fun b_lambda!19341 () Bool)

(assert (=> (not b_lambda!19341) (not b!1146551)))

(declare-fun t!36368 () Bool)

(declare-fun tb!9057 () Bool)

(assert (=> (and start!98642 (= defaultEntry!1004 defaultEntry!1004) t!36368) tb!9057))

(declare-fun result!18687 () Bool)

(assert (=> tb!9057 (= result!18687 tp_is_empty!28783)))

(assert (=> b!1146551 t!36368))

(declare-fun b_and!39335 () Bool)

(assert (= b_and!39333 (and (=> t!36368 result!18687) b_and!39335)))

(declare-fun m!1056779 () Bool)

(assert (=> b!1146543 m!1056779))

(declare-fun m!1056781 () Bool)

(assert (=> b!1146543 m!1056781))

(assert (=> b!1146543 m!1056781))

(declare-fun m!1056783 () Bool)

(assert (=> b!1146543 m!1056783))

(declare-fun m!1056785 () Bool)

(assert (=> b!1146543 m!1056785))

(declare-fun m!1056787 () Bool)

(assert (=> b!1146543 m!1056787))

(declare-fun m!1056789 () Bool)

(assert (=> b!1146543 m!1056789))

(assert (=> b!1146543 m!1056785))

(assert (=> b!1146543 m!1056789))

(declare-fun m!1056791 () Bool)

(assert (=> b!1146543 m!1056791))

(assert (=> b!1146543 m!1056789))

(declare-fun m!1056793 () Bool)

(assert (=> b!1146543 m!1056793))

(declare-fun m!1056795 () Bool)

(assert (=> b!1146551 m!1056795))

(declare-fun m!1056797 () Bool)

(assert (=> b!1146551 m!1056797))

(declare-fun m!1056799 () Bool)

(assert (=> b!1146551 m!1056799))

(declare-fun m!1056801 () Bool)

(assert (=> b!1146551 m!1056801))

(assert (=> bm!52557 m!1056779))

(declare-fun m!1056803 () Bool)

(assert (=> b!1146527 m!1056803))

(declare-fun m!1056805 () Bool)

(assert (=> b!1146527 m!1056805))

(declare-fun m!1056807 () Bool)

(assert (=> b!1146527 m!1056807))

(declare-fun m!1056809 () Bool)

(assert (=> b!1146527 m!1056809))

(declare-fun m!1056811 () Bool)

(assert (=> b!1146555 m!1056811))

(declare-fun m!1056813 () Bool)

(assert (=> b!1146555 m!1056813))

(declare-fun m!1056815 () Bool)

(assert (=> b!1146555 m!1056815))

(declare-fun m!1056817 () Bool)

(assert (=> b!1146547 m!1056817))

(declare-fun m!1056819 () Bool)

(assert (=> b!1146547 m!1056819))

(declare-fun m!1056821 () Bool)

(assert (=> bm!52559 m!1056821))

(declare-fun m!1056823 () Bool)

(assert (=> mapNonEmpty!44999 m!1056823))

(declare-fun m!1056825 () Bool)

(assert (=> bm!52553 m!1056825))

(declare-fun m!1056827 () Bool)

(assert (=> start!98642 m!1056827))

(declare-fun m!1056829 () Bool)

(assert (=> start!98642 m!1056829))

(declare-fun m!1056831 () Bool)

(assert (=> b!1146530 m!1056831))

(declare-fun m!1056833 () Bool)

(assert (=> b!1146542 m!1056833))

(assert (=> b!1146545 m!1056789))

(declare-fun m!1056835 () Bool)

(assert (=> b!1146545 m!1056835))

(declare-fun m!1056837 () Bool)

(assert (=> bm!52555 m!1056837))

(declare-fun m!1056839 () Bool)

(assert (=> b!1146541 m!1056839))

(assert (=> b!1146536 m!1056831))

(declare-fun m!1056841 () Bool)

(assert (=> b!1146539 m!1056841))

(declare-fun m!1056843 () Bool)

(assert (=> b!1146540 m!1056843))

(declare-fun m!1056845 () Bool)

(assert (=> b!1146544 m!1056845))

(declare-fun m!1056847 () Bool)

(assert (=> b!1146544 m!1056847))

(declare-fun m!1056849 () Bool)

(assert (=> b!1146537 m!1056849))

(declare-fun m!1056851 () Bool)

(assert (=> b!1146528 m!1056851))

(declare-fun m!1056853 () Bool)

(assert (=> b!1146552 m!1056853))

(declare-fun m!1056855 () Bool)

(assert (=> bm!52556 m!1056855))

(declare-fun m!1056857 () Bool)

(assert (=> b!1146535 m!1056857))

(check-sat (not b!1146537) (not start!98642) (not b!1146551) (not b!1146541) (not b!1146545) (not b!1146527) (not b!1146536) (not b_lambda!19341) (not bm!52557) (not mapNonEmpty!44999) (not b!1146540) (not b!1146547) (not b_next!24253) (not b!1146555) (not bm!52559) b_and!39335 (not bm!52555) (not bm!52553) tp_is_empty!28783 (not b!1146552) (not b!1146535) (not b!1146544) (not b!1146528) (not b!1146530) (not b!1146543) (not bm!52556) (not b!1146539))
(check-sat b_and!39335 (not b_next!24253))
