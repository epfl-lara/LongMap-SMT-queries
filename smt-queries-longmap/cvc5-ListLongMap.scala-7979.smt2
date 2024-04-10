; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98714 () Bool)

(assert start!98714)

(declare-fun b_free!24319 () Bool)

(declare-fun b_next!24319 () Bool)

(assert (=> start!98714 (= b_free!24319 (not b_next!24319))))

(declare-fun tp!85668 () Bool)

(declare-fun b_and!39487 () Bool)

(assert (=> start!98714 (= tp!85668 b_and!39487)))

(declare-fun bm!53367 () Bool)

(declare-datatypes ((Unit!37797 0))(
  ( (Unit!37798) )
))
(declare-fun call!53377 () Unit!37797)

(declare-fun call!53370 () Unit!37797)

(assert (=> bm!53367 (= call!53377 call!53370)))

(declare-fun b!1149686 () Bool)

(declare-fun res!764853 () Bool)

(declare-fun e!653927 () Bool)

(assert (=> b!1149686 (=> (not res!764853) (not e!653927))))

(declare-datatypes ((array!74545 0))(
  ( (array!74546 (arr!35923 (Array (_ BitVec 32) (_ BitVec 64))) (size!36459 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74545)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74545 (_ BitVec 32)) Bool)

(assert (=> b!1149686 (= res!764853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149687 () Bool)

(declare-fun res!764845 () Bool)

(assert (=> b!1149687 (=> (not res!764845) (not e!653927))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1149687 (= res!764845 (= (select (arr!35923 _keys!1208) i!673) k!934))))

(declare-fun b!1149689 () Bool)

(declare-fun res!764855 () Bool)

(assert (=> b!1149689 (=> (not res!764855) (not e!653927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149689 (= res!764855 (validMask!0 mask!1564))))

(declare-fun b!1149690 () Bool)

(declare-fun e!653933 () Bool)

(declare-fun e!653923 () Bool)

(assert (=> b!1149690 (= e!653933 (not e!653923))))

(declare-fun res!764844 () Bool)

(assert (=> b!1149690 (=> res!764844 e!653923)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1149690 (= res!764844 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149690 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!514275 () Unit!37797)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74545 (_ BitVec 64) (_ BitVec 32)) Unit!37797)

(assert (=> b!1149690 (= lt!514275 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1149691 () Bool)

(declare-fun res!764846 () Bool)

(assert (=> b!1149691 (=> (not res!764846) (not e!653927))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!43593 0))(
  ( (V!43594 (val!14481 Int)) )
))
(declare-datatypes ((ValueCell!13715 0))(
  ( (ValueCellFull!13715 (v!17118 V!43593)) (EmptyCell!13715) )
))
(declare-datatypes ((array!74547 0))(
  ( (array!74548 (arr!35924 (Array (_ BitVec 32) ValueCell!13715)) (size!36460 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74547)

(assert (=> b!1149691 (= res!764846 (and (= (size!36460 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36459 _keys!1208) (size!36460 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149692 () Bool)

(declare-fun e!653920 () Unit!37797)

(declare-fun Unit!37799 () Unit!37797)

(assert (=> b!1149692 (= e!653920 Unit!37799)))

(declare-fun lt!514272 () Bool)

(assert (=> b!1149692 (= lt!514272 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113733 () Bool)

(assert (=> b!1149692 (= c!113733 (and (not lt!514272) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514270 () Unit!37797)

(declare-fun e!653934 () Unit!37797)

(assert (=> b!1149692 (= lt!514270 e!653934)))

(declare-fun zeroValue!944 () V!43593)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!514278 () Unit!37797)

(declare-fun minValue!944 () V!43593)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!450 (array!74545 array!74547 (_ BitVec 32) (_ BitVec 32) V!43593 V!43593 (_ BitVec 64) (_ BitVec 32) Int) Unit!37797)

(assert (=> b!1149692 (= lt!514278 (lemmaListMapContainsThenArrayContainsFrom!450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113732 () Bool)

(assert (=> b!1149692 (= c!113732 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764850 () Bool)

(declare-fun e!653929 () Bool)

(assert (=> b!1149692 (= res!764850 e!653929)))

(declare-fun e!653924 () Bool)

(assert (=> b!1149692 (=> (not res!764850) (not e!653924))))

(assert (=> b!1149692 e!653924))

(declare-fun lt!514266 () Unit!37797)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74545 (_ BitVec 32) (_ BitVec 32)) Unit!37797)

(assert (=> b!1149692 (= lt!514266 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25123 0))(
  ( (Nil!25120) (Cons!25119 (h!26328 (_ BitVec 64)) (t!36434 List!25123)) )
))
(declare-fun arrayNoDuplicates!0 (array!74545 (_ BitVec 32) List!25123) Bool)

(assert (=> b!1149692 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25120)))

(declare-fun lt!514274 () Unit!37797)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74545 (_ BitVec 64) (_ BitVec 32) List!25123) Unit!37797)

(assert (=> b!1149692 (= lt!514274 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25120))))

(assert (=> b!1149692 false))

(declare-fun b!1149693 () Bool)

(declare-fun e!653932 () Bool)

(assert (=> b!1149693 (= e!653923 e!653932)))

(declare-fun res!764856 () Bool)

(assert (=> b!1149693 (=> res!764856 e!653932)))

(assert (=> b!1149693 (= res!764856 (not (= from!1455 i!673)))))

(declare-fun lt!514281 () array!74545)

(declare-datatypes ((tuple2!18374 0))(
  ( (tuple2!18375 (_1!9198 (_ BitVec 64)) (_2!9198 V!43593)) )
))
(declare-datatypes ((List!25124 0))(
  ( (Nil!25121) (Cons!25120 (h!26329 tuple2!18374) (t!36435 List!25124)) )
))
(declare-datatypes ((ListLongMap!16343 0))(
  ( (ListLongMap!16344 (toList!8187 List!25124)) )
))
(declare-fun lt!514268 () ListLongMap!16343)

(declare-fun lt!514279 () array!74547)

(declare-fun getCurrentListMapNoExtraKeys!4660 (array!74545 array!74547 (_ BitVec 32) (_ BitVec 32) V!43593 V!43593 (_ BitVec 32) Int) ListLongMap!16343)

(assert (=> b!1149693 (= lt!514268 (getCurrentListMapNoExtraKeys!4660 lt!514281 lt!514279 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!514264 () V!43593)

(assert (=> b!1149693 (= lt!514279 (array!74548 (store (arr!35924 _values!996) i!673 (ValueCellFull!13715 lt!514264)) (size!36460 _values!996)))))

(declare-fun dynLambda!2685 (Int (_ BitVec 64)) V!43593)

(assert (=> b!1149693 (= lt!514264 (dynLambda!2685 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!514273 () ListLongMap!16343)

(assert (=> b!1149693 (= lt!514273 (getCurrentListMapNoExtraKeys!4660 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1149694 () Bool)

(assert (=> b!1149694 (= e!653929 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149695 () Bool)

(declare-fun e!653926 () Unit!37797)

(declare-fun e!653922 () Unit!37797)

(assert (=> b!1149695 (= e!653926 e!653922)))

(declare-fun c!113734 () Bool)

(assert (=> b!1149695 (= c!113734 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514272))))

(declare-fun mapIsEmpty!45098 () Bool)

(declare-fun mapRes!45098 () Bool)

(assert (=> mapIsEmpty!45098 mapRes!45098))

(declare-fun b!1149696 () Bool)

(declare-fun Unit!37800 () Unit!37797)

(assert (=> b!1149696 (= e!653922 Unit!37800)))

(declare-fun mapNonEmpty!45098 () Bool)

(declare-fun tp!85667 () Bool)

(declare-fun e!653919 () Bool)

(assert (=> mapNonEmpty!45098 (= mapRes!45098 (and tp!85667 e!653919))))

(declare-fun mapRest!45098 () (Array (_ BitVec 32) ValueCell!13715))

(declare-fun mapValue!45098 () ValueCell!13715)

(declare-fun mapKey!45098 () (_ BitVec 32))

(assert (=> mapNonEmpty!45098 (= (arr!35924 _values!996) (store mapRest!45098 mapKey!45098 mapValue!45098))))

(declare-fun b!1149697 () Bool)

(declare-fun res!764847 () Bool)

(assert (=> b!1149697 (=> (not res!764847) (not e!653927))))

(assert (=> b!1149697 (= res!764847 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25120))))

(declare-fun call!53376 () ListLongMap!16343)

(declare-fun bm!53368 () Bool)

(assert (=> bm!53368 (= call!53376 (getCurrentListMapNoExtraKeys!4660 lt!514281 lt!514279 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149698 () Bool)

(declare-fun e!653921 () Bool)

(assert (=> b!1149698 (= e!653932 e!653921)))

(declare-fun res!764854 () Bool)

(assert (=> b!1149698 (=> res!764854 e!653921)))

(assert (=> b!1149698 (= res!764854 (not (= (select (arr!35923 _keys!1208) from!1455) k!934)))))

(declare-fun e!653928 () Bool)

(assert (=> b!1149698 e!653928))

(declare-fun c!113729 () Bool)

(assert (=> b!1149698 (= c!113729 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514260 () Unit!37797)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!557 (array!74545 array!74547 (_ BitVec 32) (_ BitVec 32) V!43593 V!43593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37797)

(assert (=> b!1149698 (= lt!514260 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!557 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149699 () Bool)

(declare-fun call!53374 () ListLongMap!16343)

(declare-fun contains!6708 (ListLongMap!16343 (_ BitVec 64)) Bool)

(assert (=> b!1149699 (contains!6708 call!53374 k!934)))

(declare-fun lt!514269 () ListLongMap!16343)

(declare-fun lt!514271 () Unit!37797)

(declare-fun addStillContains!858 (ListLongMap!16343 (_ BitVec 64) V!43593 (_ BitVec 64)) Unit!37797)

(assert (=> b!1149699 (= lt!514271 (addStillContains!858 lt!514269 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!53375 () Bool)

(assert (=> b!1149699 call!53375))

(declare-fun lt!514276 () ListLongMap!16343)

(declare-fun +!3608 (ListLongMap!16343 tuple2!18374) ListLongMap!16343)

(assert (=> b!1149699 (= lt!514269 (+!3608 lt!514276 (tuple2!18375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514265 () Unit!37797)

(assert (=> b!1149699 (= lt!514265 call!53370)))

(assert (=> b!1149699 (= e!653934 lt!514271)))

(declare-fun b!1149700 () Bool)

(declare-fun c!113730 () Bool)

(assert (=> b!1149700 (= c!113730 (and (not lt!514272) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149700 (= e!653934 e!653926)))

(declare-fun bm!53369 () Bool)

(declare-fun call!53373 () ListLongMap!16343)

(assert (=> bm!53369 (= call!53373 call!53374)))

(declare-fun call!53372 () ListLongMap!16343)

(declare-fun bm!53370 () Bool)

(assert (=> bm!53370 (= call!53372 (getCurrentListMapNoExtraKeys!4660 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53371 () Bool)

(assert (=> bm!53371 (= call!53374 (+!3608 (ite c!113733 lt!514269 lt!514276) (ite c!113733 (tuple2!18375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113730 (tuple2!18375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!53372 () Bool)

(declare-fun call!53371 () Bool)

(assert (=> bm!53372 (= call!53371 call!53375)))

(declare-fun b!1149701 () Bool)

(declare-fun e!653918 () Bool)

(declare-fun e!653925 () Bool)

(assert (=> b!1149701 (= e!653918 (and e!653925 mapRes!45098))))

(declare-fun condMapEmpty!45098 () Bool)

(declare-fun mapDefault!45098 () ValueCell!13715)

