; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98886 () Bool)

(assert start!98886)

(declare-fun b_free!24491 () Bool)

(declare-fun b_next!24491 () Bool)

(assert (=> start!98886 (= b_free!24491 (not b_next!24491))))

(declare-fun tp!86184 () Bool)

(declare-fun b_and!39831 () Bool)

(assert (=> start!98886 (= tp!86184 b_and!39831)))

(declare-datatypes ((array!74885 0))(
  ( (array!74886 (arr!36093 (Array (_ BitVec 32) (_ BitVec 64))) (size!36629 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74885)

(declare-fun b!1157598 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!658312 () Bool)

(declare-fun arrayContainsKey!0 (array!74885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157598 (= e!658312 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157599 () Bool)

(declare-datatypes ((Unit!38139 0))(
  ( (Unit!38140) )
))
(declare-fun e!658318 () Unit!38139)

(declare-fun Unit!38141 () Unit!38139)

(assert (=> b!1157599 (= e!658318 Unit!38141)))

(declare-fun lt!519943 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1157599 (= lt!519943 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!115280 () Bool)

(assert (=> b!1157599 (= c!115280 (and (not lt!519943) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519951 () Unit!38139)

(declare-fun e!658309 () Unit!38139)

(assert (=> b!1157599 (= lt!519951 e!658309)))

(declare-datatypes ((V!43821 0))(
  ( (V!43822 (val!14567 Int)) )
))
(declare-fun zeroValue!944 () V!43821)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13801 0))(
  ( (ValueCellFull!13801 (v!17204 V!43821)) (EmptyCell!13801) )
))
(declare-datatypes ((array!74887 0))(
  ( (array!74888 (arr!36094 (Array (_ BitVec 32) ValueCell!13801)) (size!36630 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74887)

(declare-fun lt!519945 () Unit!38139)

(declare-fun minValue!944 () V!43821)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!508 (array!74885 array!74887 (_ BitVec 32) (_ BitVec 32) V!43821 V!43821 (_ BitVec 64) (_ BitVec 32) Int) Unit!38139)

(assert (=> b!1157599 (= lt!519945 (lemmaListMapContainsThenArrayContainsFrom!508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115277 () Bool)

(assert (=> b!1157599 (= c!115277 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768727 () Bool)

(assert (=> b!1157599 (= res!768727 e!658312)))

(declare-fun e!658305 () Bool)

(assert (=> b!1157599 (=> (not res!768727) (not e!658305))))

(assert (=> b!1157599 e!658305))

(declare-fun lt!519936 () Unit!38139)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74885 (_ BitVec 32) (_ BitVec 32)) Unit!38139)

(assert (=> b!1157599 (= lt!519936 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25277 0))(
  ( (Nil!25274) (Cons!25273 (h!26482 (_ BitVec 64)) (t!36760 List!25277)) )
))
(declare-fun arrayNoDuplicates!0 (array!74885 (_ BitVec 32) List!25277) Bool)

(assert (=> b!1157599 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25274)))

(declare-fun lt!519957 () Unit!38139)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74885 (_ BitVec 64) (_ BitVec 32) List!25277) Unit!38139)

(assert (=> b!1157599 (= lt!519957 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25274))))

(assert (=> b!1157599 false))

(declare-fun b!1157600 () Bool)

(assert (=> b!1157600 (= e!658305 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157601 () Bool)

(declare-fun e!658320 () Bool)

(assert (=> b!1157601 (= e!658320 true)))

(declare-fun e!658317 () Bool)

(assert (=> b!1157601 e!658317))

(declare-fun res!768719 () Bool)

(assert (=> b!1157601 (=> (not res!768719) (not e!658317))))

(declare-datatypes ((tuple2!18536 0))(
  ( (tuple2!18537 (_1!9279 (_ BitVec 64)) (_2!9279 V!43821)) )
))
(declare-datatypes ((List!25278 0))(
  ( (Nil!25275) (Cons!25274 (h!26483 tuple2!18536) (t!36761 List!25278)) )
))
(declare-datatypes ((ListLongMap!16505 0))(
  ( (ListLongMap!16506 (toList!8268 List!25278)) )
))
(declare-fun lt!519952 () ListLongMap!16505)

(declare-fun lt!519950 () ListLongMap!16505)

(assert (=> b!1157601 (= res!768719 (= lt!519952 lt!519950))))

(declare-fun lt!519956 () ListLongMap!16505)

(declare-fun -!1382 (ListLongMap!16505 (_ BitVec 64)) ListLongMap!16505)

(assert (=> b!1157601 (= lt!519952 (-!1382 lt!519956 k!934))))

(declare-fun lt!519955 () V!43821)

(declare-fun +!3679 (ListLongMap!16505 tuple2!18536) ListLongMap!16505)

(assert (=> b!1157601 (= (-!1382 (+!3679 lt!519950 (tuple2!18537 (select (arr!36093 _keys!1208) from!1455) lt!519955)) (select (arr!36093 _keys!1208) from!1455)) lt!519950)))

(declare-fun lt!519940 () Unit!38139)

(declare-fun addThenRemoveForNewKeyIsSame!221 (ListLongMap!16505 (_ BitVec 64) V!43821) Unit!38139)

(assert (=> b!1157601 (= lt!519940 (addThenRemoveForNewKeyIsSame!221 lt!519950 (select (arr!36093 _keys!1208) from!1455) lt!519955))))

(declare-fun lt!519939 () V!43821)

(declare-fun get!18397 (ValueCell!13801 V!43821) V!43821)

(assert (=> b!1157601 (= lt!519955 (get!18397 (select (arr!36094 _values!996) from!1455) lt!519939))))

(declare-fun lt!519938 () Unit!38139)

(assert (=> b!1157601 (= lt!519938 e!658318)))

(declare-fun c!115279 () Bool)

(declare-fun contains!6779 (ListLongMap!16505 (_ BitVec 64)) Bool)

(assert (=> b!1157601 (= c!115279 (contains!6779 lt!519950 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4735 (array!74885 array!74887 (_ BitVec 32) (_ BitVec 32) V!43821 V!43821 (_ BitVec 32) Int) ListLongMap!16505)

(assert (=> b!1157601 (= lt!519950 (getCurrentListMapNoExtraKeys!4735 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157602 () Bool)

(assert (=> b!1157602 (= e!658312 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519943) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157603 () Bool)

(declare-fun call!55434 () ListLongMap!16505)

(declare-fun call!55441 () ListLongMap!16505)

(declare-fun e!658311 () Bool)

(assert (=> b!1157603 (= e!658311 (= call!55441 (-!1382 call!55434 k!934)))))

(declare-fun b!1157604 () Bool)

(declare-fun e!658310 () Bool)

(assert (=> b!1157604 (= e!658310 e!658320)))

(declare-fun res!768717 () Bool)

(assert (=> b!1157604 (=> res!768717 e!658320)))

(assert (=> b!1157604 (= res!768717 (not (= (select (arr!36093 _keys!1208) from!1455) k!934)))))

(assert (=> b!1157604 e!658311))

(declare-fun c!115278 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157604 (= c!115278 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519949 () Unit!38139)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!615 (array!74885 array!74887 (_ BitVec 32) (_ BitVec 32) V!43821 V!43821 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38139)

(assert (=> b!1157604 (= lt!519949 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!615 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157605 () Bool)

(declare-fun call!55440 () ListLongMap!16505)

(assert (=> b!1157605 (contains!6779 call!55440 k!934)))

(declare-fun lt!519953 () ListLongMap!16505)

(declare-fun lt!519937 () Unit!38139)

(declare-fun addStillContains!921 (ListLongMap!16505 (_ BitVec 64) V!43821 (_ BitVec 64)) Unit!38139)

(assert (=> b!1157605 (= lt!519937 (addStillContains!921 lt!519953 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!55439 () Bool)

(assert (=> b!1157605 call!55439))

(assert (=> b!1157605 (= lt!519953 (+!3679 lt!519950 (tuple2!18537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!519944 () Unit!38139)

(declare-fun call!55435 () Unit!38139)

(assert (=> b!1157605 (= lt!519944 call!55435)))

(assert (=> b!1157605 (= e!658309 lt!519937)))

(declare-fun b!1157606 () Bool)

(declare-fun call!55438 () Bool)

(assert (=> b!1157606 call!55438))

(declare-fun lt!519941 () Unit!38139)

(declare-fun call!55437 () Unit!38139)

(assert (=> b!1157606 (= lt!519941 call!55437)))

(declare-fun e!658315 () Unit!38139)

(assert (=> b!1157606 (= e!658315 lt!519941)))

(declare-fun b!1157607 () Bool)

(declare-fun e!658304 () Bool)

(declare-fun e!658313 () Bool)

(assert (=> b!1157607 (= e!658304 e!658313)))

(declare-fun res!768723 () Bool)

(assert (=> b!1157607 (=> (not res!768723) (not e!658313))))

(declare-fun lt!519946 () array!74885)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74885 (_ BitVec 32)) Bool)

(assert (=> b!1157607 (= res!768723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519946 mask!1564))))

(assert (=> b!1157607 (= lt!519946 (array!74886 (store (arr!36093 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36629 _keys!1208)))))

(declare-fun b!1157608 () Bool)

(declare-fun e!658306 () Bool)

(declare-fun e!658308 () Bool)

(declare-fun mapRes!45356 () Bool)

(assert (=> b!1157608 (= e!658306 (and e!658308 mapRes!45356))))

(declare-fun condMapEmpty!45356 () Bool)

(declare-fun mapDefault!45356 () ValueCell!13801)

