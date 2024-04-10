; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98784 () Bool)

(assert start!98784)

(declare-fun b_free!24389 () Bool)

(declare-fun b_next!24389 () Bool)

(assert (=> start!98784 (= b_free!24389 (not b_next!24389))))

(declare-fun tp!85878 () Bool)

(declare-fun b_and!39627 () Bool)

(assert (=> start!98784 (= tp!85878 b_and!39627)))

(declare-fun b!1152906 () Bool)

(declare-datatypes ((Unit!37942 0))(
  ( (Unit!37943) )
))
(declare-fun e!655703 () Unit!37942)

(declare-fun Unit!37944 () Unit!37942)

(assert (=> b!1152906 (= e!655703 Unit!37944)))

(declare-fun b!1152907 () Bool)

(declare-fun e!655712 () Unit!37942)

(declare-fun Unit!37945 () Unit!37942)

(assert (=> b!1152907 (= e!655712 Unit!37945)))

(declare-fun lt!516591 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1152907 (= lt!516591 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114364 () Bool)

(assert (=> b!1152907 (= c!114364 (and (not lt!516591) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516570 () Unit!37942)

(declare-fun e!655714 () Unit!37942)

(assert (=> b!1152907 (= lt!516570 e!655714)))

(declare-datatypes ((V!43685 0))(
  ( (V!43686 (val!14516 Int)) )
))
(declare-fun zeroValue!944 () V!43685)

(declare-datatypes ((array!74685 0))(
  ( (array!74686 (arr!35993 (Array (_ BitVec 32) (_ BitVec 64))) (size!36529 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74685)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!516584 () Unit!37942)

(declare-datatypes ((ValueCell!13750 0))(
  ( (ValueCellFull!13750 (v!17153 V!43685)) (EmptyCell!13750) )
))
(declare-datatypes ((array!74687 0))(
  ( (array!74688 (arr!35994 (Array (_ BitVec 32) ValueCell!13750)) (size!36530 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74687)

(declare-fun minValue!944 () V!43685)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!477 (array!74685 array!74687 (_ BitVec 32) (_ BitVec 32) V!43685 V!43685 (_ BitVec 64) (_ BitVec 32) Int) Unit!37942)

(assert (=> b!1152907 (= lt!516584 (lemmaListMapContainsThenArrayContainsFrom!477 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114361 () Bool)

(assert (=> b!1152907 (= c!114361 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766429 () Bool)

(declare-fun e!655705 () Bool)

(assert (=> b!1152907 (= res!766429 e!655705)))

(declare-fun e!655715 () Bool)

(assert (=> b!1152907 (=> (not res!766429) (not e!655715))))

(assert (=> b!1152907 e!655715))

(declare-fun lt!516571 () Unit!37942)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74685 (_ BitVec 32) (_ BitVec 32)) Unit!37942)

(assert (=> b!1152907 (= lt!516571 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25187 0))(
  ( (Nil!25184) (Cons!25183 (h!26392 (_ BitVec 64)) (t!36568 List!25187)) )
))
(declare-fun arrayNoDuplicates!0 (array!74685 (_ BitVec 32) List!25187) Bool)

(assert (=> b!1152907 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25184)))

(declare-fun lt!516580 () Unit!37942)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74685 (_ BitVec 64) (_ BitVec 32) List!25187) Unit!37942)

(assert (=> b!1152907 (= lt!516580 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25184))))

(assert (=> b!1152907 false))

(declare-fun b!1152908 () Bool)

(declare-fun res!766420 () Bool)

(declare-fun e!655709 () Bool)

(assert (=> b!1152908 (=> (not res!766420) (not e!655709))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152908 (= res!766420 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36529 _keys!1208))))))

(declare-fun b!1152909 () Bool)

(declare-fun e!655704 () Bool)

(declare-datatypes ((tuple2!18440 0))(
  ( (tuple2!18441 (_1!9231 (_ BitVec 64)) (_2!9231 V!43685)) )
))
(declare-datatypes ((List!25188 0))(
  ( (Nil!25185) (Cons!25184 (h!26393 tuple2!18440) (t!36569 List!25188)) )
))
(declare-datatypes ((ListLongMap!16409 0))(
  ( (ListLongMap!16410 (toList!8220 List!25188)) )
))
(declare-fun call!54212 () ListLongMap!16409)

(declare-fun call!54217 () ListLongMap!16409)

(assert (=> b!1152909 (= e!655704 (= call!54212 call!54217))))

(declare-fun b!1152910 () Bool)

(declare-fun res!766432 () Bool)

(assert (=> b!1152910 (=> (not res!766432) (not e!655709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152910 (= res!766432 (validMask!0 mask!1564))))

(declare-fun lt!516576 () ListLongMap!16409)

(declare-fun call!54214 () ListLongMap!16409)

(declare-fun call!54211 () Bool)

(declare-fun bm!54207 () Bool)

(declare-fun contains!6738 (ListLongMap!16409 (_ BitVec 64)) Bool)

(assert (=> bm!54207 (= call!54211 (contains!6738 (ite c!114364 lt!516576 call!54214) k!934))))

(declare-fun b!1152911 () Bool)

(declare-fun e!655708 () Unit!37942)

(declare-fun lt!516573 () Unit!37942)

(assert (=> b!1152911 (= e!655708 lt!516573)))

(declare-fun call!54213 () Unit!37942)

(assert (=> b!1152911 (= lt!516573 call!54213)))

(declare-fun call!54215 () Bool)

(assert (=> b!1152911 call!54215))

(declare-fun b!1152912 () Bool)

(assert (=> b!1152912 (= e!655708 e!655703)))

(declare-fun c!114359 () Bool)

(assert (=> b!1152912 (= c!114359 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516591))))

(declare-fun b!1152913 () Bool)

(declare-fun e!655718 () Bool)

(declare-fun e!655719 () Bool)

(declare-fun mapRes!45203 () Bool)

(assert (=> b!1152913 (= e!655718 (and e!655719 mapRes!45203))))

(declare-fun condMapEmpty!45203 () Bool)

(declare-fun mapDefault!45203 () ValueCell!13750)

