; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98730 () Bool)

(assert start!98730)

(declare-fun b_free!24335 () Bool)

(declare-fun b_next!24335 () Bool)

(assert (=> start!98730 (= b_free!24335 (not b_next!24335))))

(declare-fun tp!85715 () Bool)

(declare-fun b_and!39519 () Bool)

(assert (=> start!98730 (= tp!85715 b_and!39519)))

(declare-fun b!1150422 () Bool)

(declare-fun res!765216 () Bool)

(declare-fun e!654342 () Bool)

(assert (=> b!1150422 (=> (not res!765216) (not e!654342))))

(declare-datatypes ((array!74577 0))(
  ( (array!74578 (arr!35939 (Array (_ BitVec 32) (_ BitVec 64))) (size!36475 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74577)

(declare-datatypes ((List!25139 0))(
  ( (Nil!25136) (Cons!25135 (h!26344 (_ BitVec 64)) (t!36466 List!25139)) )
))
(declare-fun arrayNoDuplicates!0 (array!74577 (_ BitVec 32) List!25139) Bool)

(assert (=> b!1150422 (= res!765216 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25136))))

(declare-fun b!1150423 () Bool)

(declare-fun res!765213 () Bool)

(assert (=> b!1150423 (=> (not res!765213) (not e!654342))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43613 0))(
  ( (V!43614 (val!14489 Int)) )
))
(declare-datatypes ((ValueCell!13723 0))(
  ( (ValueCellFull!13723 (v!17126 V!43613)) (EmptyCell!13723) )
))
(declare-datatypes ((array!74579 0))(
  ( (array!74580 (arr!35940 (Array (_ BitVec 32) ValueCell!13723)) (size!36476 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74579)

(assert (=> b!1150423 (= res!765213 (and (= (size!36476 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36475 _keys!1208) (size!36476 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!43613)

(declare-fun lt!514800 () array!74577)

(declare-fun bm!53559 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43613)

(declare-fun lt!514801 () array!74579)

(declare-datatypes ((tuple2!18390 0))(
  ( (tuple2!18391 (_1!9206 (_ BitVec 64)) (_2!9206 V!43613)) )
))
(declare-datatypes ((List!25140 0))(
  ( (Nil!25137) (Cons!25136 (h!26345 tuple2!18390) (t!36467 List!25140)) )
))
(declare-datatypes ((ListLongMap!16359 0))(
  ( (ListLongMap!16360 (toList!8195 List!25140)) )
))
(declare-fun call!53567 () ListLongMap!16359)

(declare-fun getCurrentListMapNoExtraKeys!4667 (array!74577 array!74579 (_ BitVec 32) (_ BitVec 32) V!43613 V!43613 (_ BitVec 32) Int) ListLongMap!16359)

(assert (=> bm!53559 (= call!53567 (getCurrentListMapNoExtraKeys!4667 lt!514800 lt!514801 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!53568 () ListLongMap!16359)

(declare-fun b!1150424 () Bool)

(declare-fun e!654332 () Bool)

(declare-fun -!1327 (ListLongMap!16359 (_ BitVec 64)) ListLongMap!16359)

(assert (=> b!1150424 (= e!654332 (= call!53567 (-!1327 call!53568 k!934)))))

(declare-fun mapNonEmpty!45122 () Bool)

(declare-fun mapRes!45122 () Bool)

(declare-fun tp!85716 () Bool)

(declare-fun e!654336 () Bool)

(assert (=> mapNonEmpty!45122 (= mapRes!45122 (and tp!85716 e!654336))))

(declare-fun mapKey!45122 () (_ BitVec 32))

(declare-fun mapRest!45122 () (Array (_ BitVec 32) ValueCell!13723))

(declare-fun mapValue!45122 () ValueCell!13723)

(assert (=> mapNonEmpty!45122 (= (arr!35940 _values!996) (store mapRest!45122 mapKey!45122 mapValue!45122))))

(declare-fun b!1150425 () Bool)

(declare-datatypes ((Unit!37831 0))(
  ( (Unit!37832) )
))
(declare-fun e!654337 () Unit!37831)

(declare-fun Unit!37833 () Unit!37831)

(assert (=> b!1150425 (= e!654337 Unit!37833)))

(declare-fun b!1150427 () Bool)

(declare-fun e!654327 () Unit!37831)

(declare-fun Unit!37834 () Unit!37831)

(assert (=> b!1150427 (= e!654327 Unit!37834)))

(declare-fun lt!514791 () Bool)

(assert (=> b!1150427 (= lt!514791 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113874 () Bool)

(assert (=> b!1150427 (= c!113874 (and (not lt!514791) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514804 () Unit!37831)

(declare-fun e!654330 () Unit!37831)

(assert (=> b!1150427 (= lt!514804 e!654330)))

(declare-fun lt!514805 () Unit!37831)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!457 (array!74577 array!74579 (_ BitVec 32) (_ BitVec 32) V!43613 V!43613 (_ BitVec 64) (_ BitVec 32) Int) Unit!37831)

(assert (=> b!1150427 (= lt!514805 (lemmaListMapContainsThenArrayContainsFrom!457 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113875 () Bool)

(assert (=> b!1150427 (= c!113875 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765214 () Bool)

(declare-fun e!654326 () Bool)

(assert (=> b!1150427 (= res!765214 e!654326)))

(declare-fun e!654340 () Bool)

(assert (=> b!1150427 (=> (not res!765214) (not e!654340))))

(assert (=> b!1150427 e!654340))

(declare-fun lt!514790 () Unit!37831)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74577 (_ BitVec 32) (_ BitVec 32)) Unit!37831)

(assert (=> b!1150427 (= lt!514790 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150427 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25136)))

(declare-fun lt!514795 () Unit!37831)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74577 (_ BitVec 64) (_ BitVec 32) List!25139) Unit!37831)

(assert (=> b!1150427 (= lt!514795 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25136))))

(assert (=> b!1150427 false))

(declare-fun b!1150428 () Bool)

(declare-fun c!113876 () Bool)

(assert (=> b!1150428 (= c!113876 (and (not lt!514791) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654331 () Unit!37831)

(assert (=> b!1150428 (= e!654330 e!654331)))

(declare-fun b!1150429 () Bool)

(declare-fun res!765217 () Bool)

(declare-fun e!654339 () Bool)

(assert (=> b!1150429 (=> (not res!765217) (not e!654339))))

(assert (=> b!1150429 (= res!765217 (arrayNoDuplicates!0 lt!514800 #b00000000000000000000000000000000 Nil!25136))))

(declare-fun b!1150430 () Bool)

(declare-fun res!765209 () Bool)

(assert (=> b!1150430 (=> (not res!765209) (not e!654342))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150430 (= res!765209 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36475 _keys!1208))))))

(declare-fun b!1150431 () Bool)

(declare-fun res!765210 () Bool)

(assert (=> b!1150431 (=> (not res!765210) (not e!654342))))

(assert (=> b!1150431 (= res!765210 (= (select (arr!35939 _keys!1208) i!673) k!934))))

(declare-fun b!1150432 () Bool)

(assert (=> b!1150432 (= e!654331 e!654337)))

(declare-fun c!113878 () Bool)

(assert (=> b!1150432 (= c!113878 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514791))))

(declare-fun bm!53560 () Bool)

(declare-fun call!53562 () Unit!37831)

(declare-fun call!53564 () Unit!37831)

(assert (=> bm!53560 (= call!53562 call!53564)))

(declare-fun b!1150433 () Bool)

(declare-fun e!654328 () Bool)

(declare-fun e!654341 () Bool)

(assert (=> b!1150433 (= e!654328 (and e!654341 mapRes!45122))))

(declare-fun condMapEmpty!45122 () Bool)

(declare-fun mapDefault!45122 () ValueCell!13723)

