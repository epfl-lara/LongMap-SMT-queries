; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98772 () Bool)

(assert start!98772)

(declare-fun b_free!24377 () Bool)

(declare-fun b_next!24377 () Bool)

(assert (=> start!98772 (= b_free!24377 (not b_next!24377))))

(declare-fun tp!85841 () Bool)

(declare-fun b_and!39603 () Bool)

(assert (=> start!98772 (= tp!85841 b_and!39603)))

(declare-fun b!1152354 () Bool)

(declare-datatypes ((Unit!37919 0))(
  ( (Unit!37920) )
))
(declare-fun e!655400 () Unit!37919)

(declare-fun e!655413 () Unit!37919)

(assert (=> b!1152354 (= e!655400 e!655413)))

(declare-fun c!114253 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!516185 () Bool)

(assert (=> b!1152354 (= c!114253 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516185))))

(declare-fun e!655405 () Bool)

(declare-datatypes ((array!74661 0))(
  ( (array!74662 (arr!35981 (Array (_ BitVec 32) (_ BitVec 64))) (size!36517 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74661)

(declare-fun b!1152356 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152356 (= e!655405 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1152357 () Bool)

(declare-fun Unit!37921 () Unit!37919)

(assert (=> b!1152357 (= e!655413 Unit!37921)))

(declare-fun b!1152358 () Bool)

(declare-fun e!655404 () Bool)

(declare-fun e!655399 () Bool)

(assert (=> b!1152358 (= e!655404 e!655399)))

(declare-fun res!766158 () Bool)

(assert (=> b!1152358 (=> res!766158 e!655399)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152358 (= res!766158 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43669 0))(
  ( (V!43670 (val!14510 Int)) )
))
(declare-fun zeroValue!944 () V!43669)

(declare-datatypes ((ValueCell!13744 0))(
  ( (ValueCellFull!13744 (v!17147 V!43669)) (EmptyCell!13744) )
))
(declare-datatypes ((array!74663 0))(
  ( (array!74664 (arr!35982 (Array (_ BitVec 32) ValueCell!13744)) (size!36518 (_ BitVec 32))) )
))
(declare-fun lt!516174 () array!74663)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18428 0))(
  ( (tuple2!18429 (_1!9225 (_ BitVec 64)) (_2!9225 V!43669)) )
))
(declare-datatypes ((List!25176 0))(
  ( (Nil!25173) (Cons!25172 (h!26381 tuple2!18428) (t!36545 List!25176)) )
))
(declare-datatypes ((ListLongMap!16397 0))(
  ( (ListLongMap!16398 (toList!8214 List!25176)) )
))
(declare-fun lt!516187 () ListLongMap!16397)

(declare-fun lt!516176 () array!74661)

(declare-fun minValue!944 () V!43669)

(declare-fun getCurrentListMapNoExtraKeys!4686 (array!74661 array!74663 (_ BitVec 32) (_ BitVec 32) V!43669 V!43669 (_ BitVec 32) Int) ListLongMap!16397)

(assert (=> b!1152358 (= lt!516187 (getCurrentListMapNoExtraKeys!4686 lt!516176 lt!516174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!516175 () V!43669)

(declare-fun _values!996 () array!74663)

(assert (=> b!1152358 (= lt!516174 (array!74664 (store (arr!35982 _values!996) i!673 (ValueCellFull!13744 lt!516175)) (size!36518 _values!996)))))

(declare-fun dynLambda!2707 (Int (_ BitVec 64)) V!43669)

(assert (=> b!1152358 (= lt!516175 (dynLambda!2707 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!516195 () ListLongMap!16397)

(assert (=> b!1152358 (= lt!516195 (getCurrentListMapNoExtraKeys!4686 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!54063 () Bool)

(declare-fun call!54072 () ListLongMap!16397)

(assert (=> bm!54063 (= call!54072 (getCurrentListMapNoExtraKeys!4686 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152359 () Bool)

(declare-fun call!54073 () ListLongMap!16397)

(declare-fun contains!6732 (ListLongMap!16397 (_ BitVec 64)) Bool)

(assert (=> b!1152359 (contains!6732 call!54073 k!934)))

(declare-fun lt!516178 () ListLongMap!16397)

(declare-fun lt!516180 () Unit!37919)

(declare-fun addStillContains!880 (ListLongMap!16397 (_ BitVec 64) V!43669 (_ BitVec 64)) Unit!37919)

(assert (=> b!1152359 (= lt!516180 (addStillContains!880 lt!516178 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!54069 () Bool)

(assert (=> b!1152359 call!54069))

(declare-fun lt!516190 () ListLongMap!16397)

(declare-fun +!3632 (ListLongMap!16397 tuple2!18428) ListLongMap!16397)

(assert (=> b!1152359 (= lt!516178 (+!3632 lt!516190 (tuple2!18429 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!516193 () Unit!37919)

(declare-fun call!54066 () Unit!37919)

(assert (=> b!1152359 (= lt!516193 call!54066)))

(declare-fun e!655411 () Unit!37919)

(assert (=> b!1152359 (= e!655411 lt!516180)))

(declare-fun bm!54064 () Bool)

(declare-fun call!54068 () Bool)

(assert (=> bm!54064 (= call!54068 call!54069)))

(declare-fun b!1152360 () Bool)

(declare-fun lt!516194 () ListLongMap!16397)

(declare-fun e!655409 () Bool)

(assert (=> b!1152360 (= e!655409 (= lt!516194 (getCurrentListMapNoExtraKeys!4686 lt!516176 lt!516174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1152361 () Bool)

(declare-fun e!655406 () Unit!37919)

(declare-fun Unit!37922 () Unit!37919)

(assert (=> b!1152361 (= e!655406 Unit!37922)))

(assert (=> b!1152361 (= lt!516185 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114254 () Bool)

(assert (=> b!1152361 (= c!114254 (and (not lt!516185) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516191 () Unit!37919)

(assert (=> b!1152361 (= lt!516191 e!655411)))

(declare-fun lt!516189 () Unit!37919)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!473 (array!74661 array!74663 (_ BitVec 32) (_ BitVec 32) V!43669 V!43669 (_ BitVec 64) (_ BitVec 32) Int) Unit!37919)

(assert (=> b!1152361 (= lt!516189 (lemmaListMapContainsThenArrayContainsFrom!473 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114255 () Bool)

(assert (=> b!1152361 (= c!114255 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766149 () Bool)

(assert (=> b!1152361 (= res!766149 e!655405)))

(declare-fun e!655408 () Bool)

(assert (=> b!1152361 (=> (not res!766149) (not e!655408))))

(assert (=> b!1152361 e!655408))

(declare-fun lt!516186 () Unit!37919)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74661 (_ BitVec 32) (_ BitVec 32)) Unit!37919)

(assert (=> b!1152361 (= lt!516186 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25177 0))(
  ( (Nil!25174) (Cons!25173 (h!26382 (_ BitVec 64)) (t!36546 List!25177)) )
))
(declare-fun arrayNoDuplicates!0 (array!74661 (_ BitVec 32) List!25177) Bool)

(assert (=> b!1152361 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25174)))

(declare-fun lt!516184 () Unit!37919)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74661 (_ BitVec 64) (_ BitVec 32) List!25177) Unit!37919)

(assert (=> b!1152361 (= lt!516184 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25174))))

(assert (=> b!1152361 false))

(declare-fun b!1152362 () Bool)

(declare-fun e!655401 () Bool)

(assert (=> b!1152362 (= e!655399 e!655401)))

(declare-fun res!766155 () Bool)

(assert (=> b!1152362 (=> res!766155 e!655401)))

(assert (=> b!1152362 (= res!766155 (not (= (select (arr!35981 _keys!1208) from!1455) k!934)))))

(declare-fun e!655410 () Bool)

(assert (=> b!1152362 e!655410))

(declare-fun c!114256 () Bool)

(assert (=> b!1152362 (= c!114256 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516183 () Unit!37919)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!580 (array!74661 array!74663 (_ BitVec 32) (_ BitVec 32) V!43669 V!43669 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37919)

(assert (=> b!1152362 (= lt!516183 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!580 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152363 () Bool)

(declare-fun res!766159 () Bool)

(declare-fun e!655402 () Bool)

(assert (=> b!1152363 (=> (not res!766159) (not e!655402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152363 (= res!766159 (validMask!0 mask!1564))))

(declare-fun b!1152355 () Bool)

(declare-fun Unit!37923 () Unit!37919)

(assert (=> b!1152355 (= e!655406 Unit!37923)))

(declare-fun res!766162 () Bool)

(assert (=> start!98772 (=> (not res!766162) (not e!655402))))

(assert (=> start!98772 (= res!766162 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36517 _keys!1208))))))

(assert (=> start!98772 e!655402))

(declare-fun tp_is_empty!28907 () Bool)

(assert (=> start!98772 tp_is_empty!28907))

(declare-fun array_inv!27554 (array!74661) Bool)

(assert (=> start!98772 (array_inv!27554 _keys!1208)))

(assert (=> start!98772 true))

(assert (=> start!98772 tp!85841))

(declare-fun e!655398 () Bool)

(declare-fun array_inv!27555 (array!74663) Bool)

(assert (=> start!98772 (and (array_inv!27555 _values!996) e!655398)))

(declare-fun b!1152364 () Bool)

(declare-fun res!766152 () Bool)

(assert (=> b!1152364 (=> (not res!766152) (not e!655402))))

(assert (=> b!1152364 (= res!766152 (and (= (size!36518 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36517 _keys!1208) (size!36518 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1152365 () Bool)

(declare-fun e!655412 () Bool)

(assert (=> b!1152365 (= e!655412 tp_is_empty!28907)))

(declare-fun b!1152366 () Bool)

(declare-fun res!766163 () Bool)

(assert (=> b!1152366 (=> (not res!766163) (not e!655402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74661 (_ BitVec 32)) Bool)

(assert (=> b!1152366 (= res!766163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1152367 () Bool)

(declare-fun res!766156 () Bool)

(assert (=> b!1152367 (=> (not res!766156) (not e!655402))))

(assert (=> b!1152367 (= res!766156 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25174))))

(declare-fun b!1152368 () Bool)

(declare-fun res!766160 () Bool)

(assert (=> b!1152368 (=> (not res!766160) (not e!655402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1152368 (= res!766160 (validKeyInArray!0 k!934))))

(declare-fun call!54071 () ListLongMap!16397)

(declare-fun bm!54065 () Bool)

(assert (=> bm!54065 (= call!54071 (getCurrentListMapNoExtraKeys!4686 lt!516176 lt!516174 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152369 () Bool)

(declare-fun e!655407 () Bool)

(assert (=> b!1152369 (= e!655407 tp_is_empty!28907)))

(declare-fun b!1152370 () Bool)

(declare-fun res!766154 () Bool)

(assert (=> b!1152370 (=> (not res!766154) (not e!655402))))

(assert (=> b!1152370 (= res!766154 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36517 _keys!1208))))))

(declare-fun b!1152371 () Bool)

(declare-fun -!1345 (ListLongMap!16397 (_ BitVec 64)) ListLongMap!16397)

(assert (=> b!1152371 (= e!655410 (= call!54071 (-!1345 call!54072 k!934)))))

(declare-fun b!1152372 () Bool)

(declare-fun c!114252 () Bool)

(assert (=> b!1152372 (= c!114252 (and (not lt!516185) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1152372 (= e!655411 e!655400)))

(declare-fun bm!54066 () Bool)

(declare-fun call!54070 () Unit!37919)

(assert (=> bm!54066 (= call!54070 call!54066)))

(declare-fun b!1152373 () Bool)

(declare-fun mapRes!45185 () Bool)

(assert (=> b!1152373 (= e!655398 (and e!655412 mapRes!45185))))

(declare-fun condMapEmpty!45185 () Bool)

(declare-fun mapDefault!45185 () ValueCell!13744)

