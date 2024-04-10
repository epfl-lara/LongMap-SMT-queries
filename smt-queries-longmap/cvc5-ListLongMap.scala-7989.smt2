; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98774 () Bool)

(assert start!98774)

(declare-fun b_free!24379 () Bool)

(declare-fun b_next!24379 () Bool)

(assert (=> start!98774 (= b_free!24379 (not b_next!24379))))

(declare-fun tp!85847 () Bool)

(declare-fun b_and!39607 () Bool)

(assert (=> start!98774 (= tp!85847 b_and!39607)))

(declare-datatypes ((V!43673 0))(
  ( (V!43674 (val!14511 Int)) )
))
(declare-fun zeroValue!944 () V!43673)

(declare-datatypes ((Unit!37924 0))(
  ( (Unit!37925) )
))
(declare-fun call!54090 () Unit!37924)

(declare-datatypes ((tuple2!18430 0))(
  ( (tuple2!18431 (_1!9226 (_ BitVec 64)) (_2!9226 V!43673)) )
))
(declare-datatypes ((List!25178 0))(
  ( (Nil!25175) (Cons!25174 (h!26383 tuple2!18430) (t!36549 List!25178)) )
))
(declare-datatypes ((ListLongMap!16399 0))(
  ( (ListLongMap!16400 (toList!8215 List!25178)) )
))
(declare-fun lt!516241 () ListLongMap!16399)

(declare-fun minValue!944 () V!43673)

(declare-fun bm!54087 () Bool)

(declare-fun c!114273 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!114272 () Bool)

(declare-fun addStillContains!881 (ListLongMap!16399 (_ BitVec 64) V!43673 (_ BitVec 64)) Unit!37924)

(assert (=> bm!54087 (= call!54090 (addStillContains!881 lt!516241 (ite (or c!114272 c!114273) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114272 c!114273) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1152446 () Bool)

(declare-fun e!655448 () Bool)

(declare-fun call!54095 () ListLongMap!16399)

(declare-fun call!54097 () ListLongMap!16399)

(assert (=> b!1152446 (= e!655448 (= call!54095 call!54097))))

(declare-fun b!1152447 () Bool)

(declare-fun e!655453 () Unit!37924)

(declare-fun e!655457 () Unit!37924)

(assert (=> b!1152447 (= e!655453 e!655457)))

(declare-fun c!114274 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!516254 () Bool)

(assert (=> b!1152447 (= c!114274 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516254))))

(declare-fun call!54093 () ListLongMap!16399)

(declare-fun bm!54088 () Bool)

(declare-fun lt!516248 () ListLongMap!16399)

(declare-fun +!3633 (ListLongMap!16399 tuple2!18430) ListLongMap!16399)

(assert (=> bm!54088 (= call!54093 (+!3633 (ite c!114272 lt!516248 lt!516241) (ite c!114272 (tuple2!18431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114273 (tuple2!18431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1152448 () Bool)

(declare-fun Unit!37926 () Unit!37924)

(assert (=> b!1152448 (= e!655457 Unit!37926)))

(declare-fun mapIsEmpty!45188 () Bool)

(declare-fun mapRes!45188 () Bool)

(assert (=> mapIsEmpty!45188 mapRes!45188))

(declare-fun b!1152450 () Bool)

(declare-fun res!766197 () Bool)

(declare-fun e!655449 () Bool)

(assert (=> b!1152450 (=> (not res!766197) (not e!655449))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1152450 (= res!766197 (validMask!0 mask!1564))))

(declare-fun b!1152451 () Bool)

(declare-fun call!54094 () Bool)

(assert (=> b!1152451 call!54094))

(declare-fun lt!516251 () Unit!37924)

(declare-fun call!54091 () Unit!37924)

(assert (=> b!1152451 (= lt!516251 call!54091)))

(assert (=> b!1152451 (= e!655457 lt!516251)))

(declare-fun b!1152452 () Bool)

(declare-fun e!655459 () Bool)

(declare-fun e!655456 () Bool)

(assert (=> b!1152452 (= e!655459 e!655456)))

(declare-fun res!766195 () Bool)

(assert (=> b!1152452 (=> res!766195 e!655456)))

(declare-datatypes ((array!74665 0))(
  ( (array!74666 (arr!35983 (Array (_ BitVec 32) (_ BitVec 64))) (size!36519 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74665)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1152452 (= res!766195 (not (= (select (arr!35983 _keys!1208) from!1455) k!934)))))

(assert (=> b!1152452 e!655448))

(declare-fun c!114270 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1152452 (= c!114270 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!516257 () Unit!37924)

(declare-datatypes ((ValueCell!13745 0))(
  ( (ValueCellFull!13745 (v!17148 V!43673)) (EmptyCell!13745) )
))
(declare-datatypes ((array!74667 0))(
  ( (array!74668 (arr!35984 (Array (_ BitVec 32) ValueCell!13745)) (size!36520 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74667)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!581 (array!74665 array!74667 (_ BitVec 32) (_ BitVec 32) V!43673 V!43673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37924)

(assert (=> b!1152452 (= lt!516257 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!581 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!516256 () array!74665)

(declare-fun bm!54089 () Bool)

(declare-fun lt!516255 () array!74667)

(declare-fun getCurrentListMapNoExtraKeys!4687 (array!74665 array!74667 (_ BitVec 32) (_ BitVec 32) V!43673 V!43673 (_ BitVec 32) Int) ListLongMap!16399)

(assert (=> bm!54089 (= call!54095 (getCurrentListMapNoExtraKeys!4687 lt!516256 lt!516255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1152453 () Bool)

(declare-fun res!766206 () Bool)

(assert (=> b!1152453 (=> (not res!766206) (not e!655449))))

(assert (=> b!1152453 (= res!766206 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36519 _keys!1208))))))

(declare-fun call!54096 () ListLongMap!16399)

(declare-fun call!54092 () Bool)

(declare-fun bm!54090 () Bool)

(declare-fun contains!6733 (ListLongMap!16399 (_ BitVec 64)) Bool)

(assert (=> bm!54090 (= call!54092 (contains!6733 (ite c!114272 lt!516248 call!54096) k!934))))

(declare-fun bm!54091 () Bool)

(assert (=> bm!54091 (= call!54096 call!54093)))

(declare-fun b!1152454 () Bool)

(declare-fun e!655450 () Bool)

(declare-fun e!655462 () Bool)

(assert (=> b!1152454 (= e!655450 (not e!655462))))

(declare-fun res!766198 () Bool)

(assert (=> b!1152454 (=> res!766198 e!655462)))

(assert (=> b!1152454 (= res!766198 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1152454 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!516252 () Unit!37924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74665 (_ BitVec 64) (_ BitVec 32)) Unit!37924)

(assert (=> b!1152454 (= lt!516252 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1152455 () Bool)

(declare-fun e!655460 () Bool)

(declare-fun e!655452 () Bool)

(assert (=> b!1152455 (= e!655460 (and e!655452 mapRes!45188))))

(declare-fun condMapEmpty!45188 () Bool)

(declare-fun mapDefault!45188 () ValueCell!13745)

