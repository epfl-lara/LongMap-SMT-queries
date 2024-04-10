; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98778 () Bool)

(assert start!98778)

(declare-fun b_free!24383 () Bool)

(declare-fun b_next!24383 () Bool)

(assert (=> start!98778 (= b_free!24383 (not b_next!24383))))

(declare-fun tp!85860 () Bool)

(declare-fun b_and!39615 () Bool)

(assert (=> start!98778 (= tp!85860 b_and!39615)))

(declare-fun b!1152630 () Bool)

(declare-fun res!766293 () Bool)

(declare-fun e!655566 () Bool)

(assert (=> b!1152630 (=> (not res!766293) (not e!655566))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152630 (= res!766293 (validKeyInArray!0 k!934))))

(declare-datatypes ((V!43677 0))(
  ( (V!43678 (val!14513 Int)) )
))
(declare-fun zeroValue!944 () V!43677)

(declare-datatypes ((tuple2!18434 0))(
  ( (tuple2!18435 (_1!9228 (_ BitVec 64)) (_2!9228 V!43677)) )
))
(declare-datatypes ((List!25181 0))(
  ( (Nil!25178) (Cons!25177 (h!26386 tuple2!18434) (t!36556 List!25181)) )
))
(declare-datatypes ((ListLongMap!16403 0))(
  ( (ListLongMap!16404 (toList!8217 List!25181)) )
))
(declare-fun call!54141 () ListLongMap!16403)

(declare-fun lt!516377 () ListLongMap!16403)

(declare-fun c!114307 () Bool)

(declare-fun bm!54135 () Bool)

(declare-fun c!114306 () Bool)

(declare-fun minValue!944 () V!43677)

(declare-fun +!3635 (ListLongMap!16403 tuple2!18434) ListLongMap!16403)

(assert (=> bm!54135 (= call!54141 (+!3635 lt!516377 (ite (or c!114306 c!114307) (tuple2!18435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18435 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1152631 () Bool)

(declare-fun res!766284 () Bool)

(assert (=> b!1152631 (=> (not res!766284) (not e!655566))))

(declare-datatypes ((array!74673 0))(
  ( (array!74674 (arr!35987 (Array (_ BitVec 32) (_ BitVec 64))) (size!36523 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74673)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152631 (= res!766284 (= (select (arr!35987 _keys!1208) i!673) k!934))))

(declare-fun lt!516376 () ListLongMap!16403)

(declare-fun bm!54136 () Bool)

(declare-fun call!54139 () ListLongMap!16403)

(declare-fun call!54140 () Bool)

(declare-fun contains!6735 (ListLongMap!16403 (_ BitVec 64)) Bool)

(assert (=> bm!54136 (= call!54140 (contains!6735 (ite c!114306 lt!516376 call!54139) k!934))))

(declare-fun b!1152632 () Bool)

(declare-datatypes ((Unit!37932 0))(
  ( (Unit!37933) )
))
(declare-fun e!655559 () Unit!37932)

(declare-fun Unit!37934 () Unit!37932)

(assert (=> b!1152632 (= e!655559 Unit!37934)))

(declare-fun lt!516384 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1152632 (= lt!516384 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1152632 (= c!114306 (and (not lt!516384) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516374 () Unit!37932)

(declare-fun e!655565 () Unit!37932)

(assert (=> b!1152632 (= lt!516374 e!655565)))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13747 0))(
  ( (ValueCellFull!13747 (v!17150 V!43677)) (EmptyCell!13747) )
))
(declare-datatypes ((array!74675 0))(
  ( (array!74676 (arr!35988 (Array (_ BitVec 32) ValueCell!13747)) (size!36524 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74675)

(declare-fun lt!516381 () Unit!37932)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!475 (array!74673 array!74675 (_ BitVec 32) (_ BitVec 32) V!43677 V!43677 (_ BitVec 64) (_ BitVec 32) Int) Unit!37932)

(assert (=> b!1152632 (= lt!516381 (lemmaListMapContainsThenArrayContainsFrom!475 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114309 () Bool)

(assert (=> b!1152632 (= c!114309 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766290 () Bool)

(declare-fun e!655553 () Bool)

(assert (=> b!1152632 (= res!766290 e!655553)))

(declare-fun e!655552 () Bool)

(assert (=> b!1152632 (=> (not res!766290) (not e!655552))))

(assert (=> b!1152632 e!655552))

(declare-fun lt!516387 () Unit!37932)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74673 (_ BitVec 32) (_ BitVec 32)) Unit!37932)

(assert (=> b!1152632 (= lt!516387 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25182 0))(
  ( (Nil!25179) (Cons!25178 (h!26387 (_ BitVec 64)) (t!36557 List!25182)) )
))
(declare-fun arrayNoDuplicates!0 (array!74673 (_ BitVec 32) List!25182) Bool)

(assert (=> b!1152632 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25179)))

(declare-fun lt!516390 () Unit!37932)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74673 (_ BitVec 64) (_ BitVec 32) List!25182) Unit!37932)

(assert (=> b!1152632 (= lt!516390 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25179))))

(assert (=> b!1152632 false))

(declare-fun b!1152633 () Bool)

(declare-fun res!766296 () Bool)

(assert (=> b!1152633 (=> (not res!766296) (not e!655566))))

(assert (=> b!1152633 (= res!766296 (and (= (size!36524 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36523 _keys!1208) (size!36524 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!54137 () Bool)

(assert (=> bm!54137 (= call!54139 call!54141)))

(declare-fun e!655558 () Bool)

(declare-fun lt!516378 () array!74673)

(declare-fun b!1152634 () Bool)

(declare-fun lt!516389 () array!74675)

(declare-fun lt!516383 () ListLongMap!16403)

(declare-fun getCurrentListMapNoExtraKeys!4689 (array!74673 array!74675 (_ BitVec 32) (_ BitVec 32) V!43677 V!43677 (_ BitVec 32) Int) ListLongMap!16403)

(assert (=> b!1152634 (= e!655558 (= lt!516383 (getCurrentListMapNoExtraKeys!4689 lt!516378 lt!516389 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1152635 () Bool)

(declare-fun res!766286 () Bool)

(assert (=> b!1152635 (=> (not res!766286) (not e!655566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74673 (_ BitVec 32)) Bool)

(assert (=> b!1152635 (= res!766286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1152636 () Bool)

(assert (=> b!1152636 (= c!114307 (and (not lt!516384) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655555 () Unit!37932)

(assert (=> b!1152636 (= e!655565 e!655555)))

(declare-fun b!1152637 () Bool)

(declare-fun e!655551 () Bool)

(declare-fun e!655561 () Bool)

(declare-fun mapRes!45194 () Bool)

(assert (=> b!1152637 (= e!655551 (and e!655561 mapRes!45194))))

(declare-fun condMapEmpty!45194 () Bool)

(declare-fun mapDefault!45194 () ValueCell!13747)

