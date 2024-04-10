; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98736 () Bool)

(assert start!98736)

(declare-fun b_free!24341 () Bool)

(declare-fun b_next!24341 () Bool)

(assert (=> start!98736 (= b_free!24341 (not b_next!24341))))

(declare-fun tp!85734 () Bool)

(declare-fun b_and!39531 () Bool)

(assert (=> start!98736 (= tp!85734 b_and!39531)))

(declare-fun mapIsEmpty!45131 () Bool)

(declare-fun mapRes!45131 () Bool)

(assert (=> mapIsEmpty!45131 mapRes!45131))

(declare-fun b!1150698 () Bool)

(declare-fun e!654492 () Bool)

(declare-fun e!654481 () Bool)

(assert (=> b!1150698 (= e!654492 e!654481)))

(declare-fun res!765351 () Bool)

(assert (=> b!1150698 (=> res!765351 e!654481)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150698 (= res!765351 (not (= from!1455 i!673)))))

(declare-datatypes ((array!74589 0))(
  ( (array!74590 (arr!35945 (Array (_ BitVec 32) (_ BitVec 64))) (size!36481 (_ BitVec 32))) )
))
(declare-fun lt!515001 () array!74589)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43621 0))(
  ( (V!43622 (val!14492 Int)) )
))
(declare-fun minValue!944 () V!43621)

(declare-fun zeroValue!944 () V!43621)

(declare-datatypes ((ValueCell!13726 0))(
  ( (ValueCellFull!13726 (v!17129 V!43621)) (EmptyCell!13726) )
))
(declare-datatypes ((array!74591 0))(
  ( (array!74592 (arr!35946 (Array (_ BitVec 32) ValueCell!13726)) (size!36482 (_ BitVec 32))) )
))
(declare-fun lt!514998 () array!74591)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18396 0))(
  ( (tuple2!18397 (_1!9209 (_ BitVec 64)) (_2!9209 V!43621)) )
))
(declare-datatypes ((List!25145 0))(
  ( (Nil!25142) (Cons!25141 (h!26350 tuple2!18396) (t!36478 List!25145)) )
))
(declare-datatypes ((ListLongMap!16365 0))(
  ( (ListLongMap!16366 (toList!8198 List!25145)) )
))
(declare-fun lt!514992 () ListLongMap!16365)

(declare-fun getCurrentListMapNoExtraKeys!4670 (array!74589 array!74591 (_ BitVec 32) (_ BitVec 32) V!43621 V!43621 (_ BitVec 32) Int) ListLongMap!16365)

(assert (=> b!1150698 (= lt!514992 (getCurrentListMapNoExtraKeys!4670 lt!515001 lt!514998 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515002 () V!43621)

(declare-fun _values!996 () array!74591)

(assert (=> b!1150698 (= lt!514998 (array!74592 (store (arr!35946 _values!996) i!673 (ValueCellFull!13726 lt!515002)) (size!36482 _values!996)))))

(declare-fun dynLambda!2693 (Int (_ BitVec 64)) V!43621)

(assert (=> b!1150698 (= lt!515002 (dynLambda!2693 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74589)

(declare-fun lt!515003 () ListLongMap!16365)

(assert (=> b!1150698 (= lt!515003 (getCurrentListMapNoExtraKeys!4670 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1150699 () Bool)

(declare-fun res!765349 () Bool)

(declare-fun e!654486 () Bool)

(assert (=> b!1150699 (=> (not res!765349) (not e!654486))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1150699 (= res!765349 (= (select (arr!35945 _keys!1208) i!673) k!934))))

(declare-fun b!1150700 () Bool)

(declare-fun call!53640 () Bool)

(assert (=> b!1150700 call!53640))

(declare-datatypes ((Unit!37844 0))(
  ( (Unit!37845) )
))
(declare-fun lt!514986 () Unit!37844)

(declare-fun call!53636 () Unit!37844)

(assert (=> b!1150700 (= lt!514986 call!53636)))

(declare-fun e!654483 () Unit!37844)

(assert (=> b!1150700 (= e!654483 lt!514986)))

(declare-fun b!1150701 () Bool)

(declare-fun e!654490 () Bool)

(assert (=> b!1150701 (= e!654486 e!654490)))

(declare-fun res!765344 () Bool)

(assert (=> b!1150701 (=> (not res!765344) (not e!654490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74589 (_ BitVec 32)) Bool)

(assert (=> b!1150701 (= res!765344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515001 mask!1564))))

(assert (=> b!1150701 (= lt!515001 (array!74590 (store (arr!35945 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36481 _keys!1208)))))

(declare-fun b!1150702 () Bool)

(declare-fun c!113932 () Bool)

(declare-fun lt!514996 () Bool)

(assert (=> b!1150702 (= c!113932 (and (not lt!514996) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654482 () Unit!37844)

(declare-fun e!654494 () Unit!37844)

(assert (=> b!1150702 (= e!654482 e!654494)))

(declare-fun b!1150703 () Bool)

(declare-fun e!654489 () Bool)

(declare-fun call!53638 () ListLongMap!16365)

(declare-fun call!53637 () ListLongMap!16365)

(assert (=> b!1150703 (= e!654489 (= call!53638 call!53637))))

(declare-fun b!1150704 () Bool)

(declare-fun e!654491 () Bool)

(assert (=> b!1150704 (= e!654481 e!654491)))

(declare-fun res!765341 () Bool)

(assert (=> b!1150704 (=> res!765341 e!654491)))

(assert (=> b!1150704 (= res!765341 (not (= (select (arr!35945 _keys!1208) from!1455) k!934)))))

(assert (=> b!1150704 e!654489))

(declare-fun c!113929 () Bool)

(assert (=> b!1150704 (= c!113929 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514993 () Unit!37844)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!566 (array!74589 array!74591 (_ BitVec 32) (_ BitVec 32) V!43621 V!43621 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37844)

(assert (=> b!1150704 (= lt!514993 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!566 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150705 () Bool)

(declare-fun res!765346 () Bool)

(assert (=> b!1150705 (=> (not res!765346) (not e!654486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150705 (= res!765346 (validMask!0 mask!1564))))

(declare-fun bm!53631 () Bool)

(declare-fun call!53635 () Unit!37844)

(assert (=> bm!53631 (= call!53636 call!53635)))

(declare-fun b!1150706 () Bool)

(declare-fun res!765340 () Bool)

(assert (=> b!1150706 (=> (not res!765340) (not e!654486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150706 (= res!765340 (validKeyInArray!0 k!934))))

(declare-fun b!1150707 () Bool)

(declare-fun Unit!37846 () Unit!37844)

(assert (=> b!1150707 (= e!654483 Unit!37846)))

(declare-fun bm!53632 () Bool)

(assert (=> bm!53632 (= call!53637 (getCurrentListMapNoExtraKeys!4670 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!654484 () Bool)

(declare-fun b!1150708 () Bool)

(declare-fun arrayContainsKey!0 (array!74589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150708 (= e!654484 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150709 () Bool)

(declare-fun res!765345 () Bool)

(assert (=> b!1150709 (=> (not res!765345) (not e!654486))))

(assert (=> b!1150709 (= res!765345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150710 () Bool)

(assert (=> b!1150710 (= e!654494 e!654483)))

(declare-fun c!113928 () Bool)

(assert (=> b!1150710 (= c!113928 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514996))))

(declare-fun bm!53633 () Bool)

(declare-fun call!53641 () Bool)

(assert (=> bm!53633 (= call!53640 call!53641)))

(declare-fun b!1150711 () Bool)

(declare-fun e!654487 () Bool)

(declare-fun e!654495 () Bool)

(assert (=> b!1150711 (= e!654487 (and e!654495 mapRes!45131))))

(declare-fun condMapEmpty!45131 () Bool)

(declare-fun mapDefault!45131 () ValueCell!13726)

