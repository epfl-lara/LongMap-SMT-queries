; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98658 () Bool)

(assert start!98658)

(declare-fun b_free!24263 () Bool)

(declare-fun b_next!24263 () Bool)

(assert (=> start!98658 (= b_free!24263 (not b_next!24263))))

(declare-fun tp!85500 () Bool)

(declare-fun b_and!39375 () Bool)

(assert (=> start!98658 (= tp!85500 b_and!39375)))

(declare-fun b!1147110 () Bool)

(declare-fun e!652490 () Bool)

(declare-datatypes ((V!43517 0))(
  ( (V!43518 (val!14453 Int)) )
))
(declare-datatypes ((tuple2!18318 0))(
  ( (tuple2!18319 (_1!9170 (_ BitVec 64)) (_2!9170 V!43517)) )
))
(declare-datatypes ((List!25069 0))(
  ( (Nil!25066) (Cons!25065 (h!26274 tuple2!18318) (t!36324 List!25069)) )
))
(declare-datatypes ((ListLongMap!16287 0))(
  ( (ListLongMap!16288 (toList!8159 List!25069)) )
))
(declare-fun call!52700 () ListLongMap!16287)

(declare-fun call!52705 () ListLongMap!16287)

(assert (=> b!1147110 (= e!652490 (= call!52700 call!52705))))

(declare-fun b!1147111 () Bool)

(declare-fun e!652497 () Bool)

(declare-fun tp_is_empty!28793 () Bool)

(assert (=> b!1147111 (= e!652497 tp_is_empty!28793)))

(declare-fun b!1147112 () Bool)

(declare-datatypes ((Unit!37675 0))(
  ( (Unit!37676) )
))
(declare-fun e!652491 () Unit!37675)

(declare-fun Unit!37677 () Unit!37675)

(assert (=> b!1147112 (= e!652491 Unit!37677)))

(declare-fun lt!512484 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1147112 (= lt!512484 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113225 () Bool)

(assert (=> b!1147112 (= c!113225 (and (not lt!512484) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512496 () Unit!37675)

(declare-fun e!652504 () Unit!37675)

(assert (=> b!1147112 (= lt!512496 e!652504)))

(declare-fun zeroValue!944 () V!43517)

(declare-datatypes ((array!74433 0))(
  ( (array!74434 (arr!35867 (Array (_ BitVec 32) (_ BitVec 64))) (size!36403 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74433)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!512480 () Unit!37675)

(declare-datatypes ((ValueCell!13687 0))(
  ( (ValueCellFull!13687 (v!17090 V!43517)) (EmptyCell!13687) )
))
(declare-datatypes ((array!74435 0))(
  ( (array!74436 (arr!35868 (Array (_ BitVec 32) ValueCell!13687)) (size!36404 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74435)

(declare-fun minValue!944 () V!43517)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!428 (array!74433 array!74435 (_ BitVec 32) (_ BitVec 32) V!43517 V!43517 (_ BitVec 64) (_ BitVec 32) Int) Unit!37675)

(assert (=> b!1147112 (= lt!512480 (lemmaListMapContainsThenArrayContainsFrom!428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113226 () Bool)

(assert (=> b!1147112 (= c!113226 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763590 () Bool)

(declare-fun e!652498 () Bool)

(assert (=> b!1147112 (= res!763590 e!652498)))

(declare-fun e!652501 () Bool)

(assert (=> b!1147112 (=> (not res!763590) (not e!652501))))

(assert (=> b!1147112 e!652501))

(declare-fun lt!512489 () Unit!37675)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74433 (_ BitVec 32) (_ BitVec 32)) Unit!37675)

(assert (=> b!1147112 (= lt!512489 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25070 0))(
  ( (Nil!25067) (Cons!25066 (h!26275 (_ BitVec 64)) (t!36325 List!25070)) )
))
(declare-fun arrayNoDuplicates!0 (array!74433 (_ BitVec 32) List!25070) Bool)

(assert (=> b!1147112 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25067)))

(declare-fun lt!512490 () Unit!37675)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74433 (_ BitVec 64) (_ BitVec 32) List!25070) Unit!37675)

(assert (=> b!1147112 (= lt!512490 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25067))))

(assert (=> b!1147112 false))

(declare-fun bm!52695 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4633 (array!74433 array!74435 (_ BitVec 32) (_ BitVec 32) V!43517 V!43517 (_ BitVec 32) Int) ListLongMap!16287)

(assert (=> bm!52695 (= call!52705 (getCurrentListMapNoExtraKeys!4633 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147113 () Bool)

(assert (=> b!1147113 (= e!652498 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512484) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!52696 () Bool)

(declare-fun call!52699 () Unit!37675)

(declare-fun call!52701 () Unit!37675)

(assert (=> bm!52696 (= call!52699 call!52701)))

(declare-fun b!1147114 () Bool)

(declare-fun e!652502 () Bool)

(declare-fun e!652505 () Bool)

(declare-fun mapRes!45014 () Bool)

(assert (=> b!1147114 (= e!652502 (and e!652505 mapRes!45014))))

(declare-fun condMapEmpty!45014 () Bool)

(declare-fun mapDefault!45014 () ValueCell!13687)

