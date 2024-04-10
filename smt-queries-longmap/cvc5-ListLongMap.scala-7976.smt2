; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98696 () Bool)

(assert start!98696)

(declare-fun b_free!24301 () Bool)

(declare-fun b_next!24301 () Bool)

(assert (=> start!98696 (= b_free!24301 (not b_next!24301))))

(declare-fun tp!85614 () Bool)

(declare-fun b_and!39451 () Bool)

(assert (=> start!98696 (= tp!85614 b_and!39451)))

(declare-fun b!1148858 () Bool)

(declare-fun e!653464 () Bool)

(declare-fun e!653472 () Bool)

(assert (=> b!1148858 (= e!653464 e!653472)))

(declare-fun res!764446 () Bool)

(assert (=> b!1148858 (=> (not res!764446) (not e!653472))))

(declare-datatypes ((array!74509 0))(
  ( (array!74510 (arr!35905 (Array (_ BitVec 32) (_ BitVec 64))) (size!36441 (_ BitVec 32))) )
))
(declare-fun lt!513686 () array!74509)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74509 (_ BitVec 32)) Bool)

(assert (=> b!1148858 (= res!764446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513686 mask!1564))))

(declare-fun _keys!1208 () array!74509)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148858 (= lt!513686 (array!74510 (store (arr!35905 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36441 _keys!1208)))))

(declare-fun b!1148859 () Bool)

(declare-fun c!113570 () Bool)

(declare-fun lt!513693 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1148859 (= c!113570 (and (not lt!513693) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37759 0))(
  ( (Unit!37760) )
))
(declare-fun e!653475 () Unit!37759)

(declare-fun e!653466 () Unit!37759)

(assert (=> b!1148859 (= e!653475 e!653466)))

(declare-fun b!1148860 () Bool)

(declare-fun e!653471 () Unit!37759)

(declare-fun Unit!37761 () Unit!37759)

(assert (=> b!1148860 (= e!653471 Unit!37761)))

(declare-fun b!1148861 () Bool)

(declare-fun e!653469 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1148861 (= e!653469 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36441 _keys!1208))))))

(declare-fun e!653460 () Bool)

(assert (=> b!1148861 e!653460))

(declare-fun res!764448 () Bool)

(assert (=> b!1148861 (=> (not res!764448) (not e!653460))))

(declare-datatypes ((V!43569 0))(
  ( (V!43570 (val!14472 Int)) )
))
(declare-datatypes ((tuple2!18356 0))(
  ( (tuple2!18357 (_1!9189 (_ BitVec 64)) (_2!9189 V!43569)) )
))
(declare-datatypes ((List!25107 0))(
  ( (Nil!25104) (Cons!25103 (h!26312 tuple2!18356) (t!36400 List!25107)) )
))
(declare-datatypes ((ListLongMap!16325 0))(
  ( (ListLongMap!16326 (toList!8178 List!25107)) )
))
(declare-fun lt!513688 () ListLongMap!16325)

(declare-fun lt!513683 () V!43569)

(declare-fun -!1313 (ListLongMap!16325 (_ BitVec 64)) ListLongMap!16325)

(declare-fun +!3600 (ListLongMap!16325 tuple2!18356) ListLongMap!16325)

(assert (=> b!1148861 (= res!764448 (= (-!1313 (+!3600 lt!513688 (tuple2!18357 (select (arr!35905 _keys!1208) from!1455) lt!513683)) (select (arr!35905 _keys!1208) from!1455)) lt!513688))))

(declare-fun lt!513680 () Unit!37759)

(declare-fun addThenRemoveForNewKeyIsSame!158 (ListLongMap!16325 (_ BitVec 64) V!43569) Unit!37759)

(assert (=> b!1148861 (= lt!513680 (addThenRemoveForNewKeyIsSame!158 lt!513688 (select (arr!35905 _keys!1208) from!1455) lt!513683))))

(declare-fun lt!513676 () V!43569)

(declare-datatypes ((ValueCell!13706 0))(
  ( (ValueCellFull!13706 (v!17109 V!43569)) (EmptyCell!13706) )
))
(declare-datatypes ((array!74511 0))(
  ( (array!74512 (arr!35906 (Array (_ BitVec 32) ValueCell!13706)) (size!36442 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74511)

(declare-fun get!18272 (ValueCell!13706 V!43569) V!43569)

(assert (=> b!1148861 (= lt!513683 (get!18272 (select (arr!35906 _values!996) from!1455) lt!513676))))

(declare-fun lt!513687 () Unit!37759)

(declare-fun e!653465 () Unit!37759)

(assert (=> b!1148861 (= lt!513687 e!653465)))

(declare-fun c!113567 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6701 (ListLongMap!16325 (_ BitVec 64)) Bool)

(assert (=> b!1148861 (= c!113567 (contains!6701 lt!513688 k!934))))

(declare-fun zeroValue!944 () V!43569)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43569)

(declare-fun getCurrentListMapNoExtraKeys!4651 (array!74509 array!74511 (_ BitVec 32) (_ BitVec 32) V!43569 V!43569 (_ BitVec 32) Int) ListLongMap!16325)

(assert (=> b!1148861 (= lt!513688 (getCurrentListMapNoExtraKeys!4651 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53151 () Bool)

(declare-fun lt!513690 () ListLongMap!16325)

(declare-fun c!113572 () Bool)

(declare-fun call!53158 () ListLongMap!16325)

(declare-fun call!53157 () Bool)

(assert (=> bm!53151 (= call!53157 (contains!6701 (ite c!113572 lt!513690 call!53158) k!934))))

(declare-fun lt!513691 () array!74511)

(declare-fun call!53159 () ListLongMap!16325)

(declare-fun bm!53152 () Bool)

(assert (=> bm!53152 (= call!53159 (getCurrentListMapNoExtraKeys!4651 lt!513686 lt!513691 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!53155 () ListLongMap!16325)

(declare-fun bm!53153 () Bool)

(assert (=> bm!53153 (= call!53155 (+!3600 lt!513688 (ite (or c!113572 c!113570) (tuple2!18357 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun call!53154 () ListLongMap!16325)

(declare-fun bm!53154 () Bool)

(assert (=> bm!53154 (= call!53154 (getCurrentListMapNoExtraKeys!4651 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148862 () Bool)

(declare-fun lt!513679 () Unit!37759)

(assert (=> b!1148862 (= e!653466 lt!513679)))

(declare-fun call!53160 () Unit!37759)

(assert (=> b!1148862 (= lt!513679 call!53160)))

(declare-fun call!53156 () Bool)

(assert (=> b!1148862 call!53156))

(declare-fun b!1148863 () Bool)

(declare-fun res!764449 () Bool)

(assert (=> b!1148863 (=> (not res!764449) (not e!653464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148863 (= res!764449 (validKeyInArray!0 k!934))))

(declare-fun bm!53155 () Bool)

(assert (=> bm!53155 (= call!53158 call!53155)))

(declare-fun b!1148864 () Bool)

(declare-fun res!764441 () Bool)

(assert (=> b!1148864 (=> (not res!764441) (not e!653464))))

(assert (=> b!1148864 (= res!764441 (= (select (arr!35905 _keys!1208) i!673) k!934))))

(declare-fun res!764451 () Bool)

(assert (=> start!98696 (=> (not res!764451) (not e!653464))))

(assert (=> start!98696 (= res!764451 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36441 _keys!1208))))))

(assert (=> start!98696 e!653464))

(declare-fun tp_is_empty!28831 () Bool)

(assert (=> start!98696 tp_is_empty!28831))

(declare-fun array_inv!27500 (array!74509) Bool)

(assert (=> start!98696 (array_inv!27500 _keys!1208)))

(assert (=> start!98696 true))

(assert (=> start!98696 tp!85614))

(declare-fun e!653463 () Bool)

(declare-fun array_inv!27501 (array!74511) Bool)

(assert (=> start!98696 (and (array_inv!27501 _values!996) e!653463)))

(declare-fun mapIsEmpty!45071 () Bool)

(declare-fun mapRes!45071 () Bool)

(assert (=> mapIsEmpty!45071 mapRes!45071))

(declare-fun b!1148865 () Bool)

(declare-fun res!764453 () Bool)

(assert (=> b!1148865 (=> (not res!764453) (not e!653464))))

(assert (=> b!1148865 (= res!764453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1148866 () Bool)

(declare-fun lt!513678 () ListLongMap!16325)

(assert (=> b!1148866 (= e!653460 (= (-!1313 lt!513678 k!934) lt!513688))))

(declare-fun e!653474 () Bool)

(declare-fun b!1148867 () Bool)

(assert (=> b!1148867 (= e!653474 (= call!53159 (-!1313 call!53154 k!934)))))

(declare-fun b!1148868 () Bool)

(declare-fun res!764447 () Bool)

(assert (=> b!1148868 (=> (not res!764447) (not e!653472))))

(declare-datatypes ((List!25108 0))(
  ( (Nil!25105) (Cons!25104 (h!26313 (_ BitVec 64)) (t!36401 List!25108)) )
))
(declare-fun arrayNoDuplicates!0 (array!74509 (_ BitVec 32) List!25108) Bool)

(assert (=> b!1148868 (= res!764447 (arrayNoDuplicates!0 lt!513686 #b00000000000000000000000000000000 Nil!25105))))

(declare-fun bm!53156 () Bool)

(assert (=> bm!53156 (= call!53156 call!53157)))

(declare-fun b!1148869 () Bool)

(assert (=> b!1148869 (= e!653466 e!653471)))

(declare-fun c!113571 () Bool)

(assert (=> b!1148869 (= c!113571 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513693))))

(declare-fun b!1148870 () Bool)

(declare-fun e!653468 () Bool)

(assert (=> b!1148870 (= e!653468 tp_is_empty!28831)))

(declare-fun b!1148871 () Bool)

(assert (=> b!1148871 call!53156))

(declare-fun lt!513681 () Unit!37759)

(assert (=> b!1148871 (= lt!513681 call!53160)))

(assert (=> b!1148871 (= e!653471 lt!513681)))

(declare-fun b!1148872 () Bool)

(declare-fun res!764442 () Bool)

(assert (=> b!1148872 (=> (not res!764442) (not e!653464))))

(assert (=> b!1148872 (= res!764442 (and (= (size!36442 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36441 _keys!1208) (size!36442 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148873 () Bool)

(declare-fun res!764440 () Bool)

(assert (=> b!1148873 (=> (not res!764440) (not e!653464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148873 (= res!764440 (validMask!0 mask!1564))))

(declare-fun b!1148874 () Bool)

(declare-fun res!764445 () Bool)

(assert (=> b!1148874 (=> (not res!764445) (not e!653464))))

(assert (=> b!1148874 (= res!764445 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25105))))

(declare-fun b!1148875 () Bool)

(declare-fun e!653470 () Bool)

(declare-fun e!653467 () Bool)

(assert (=> b!1148875 (= e!653470 e!653467)))

(declare-fun res!764444 () Bool)

(assert (=> b!1148875 (=> res!764444 e!653467)))

(assert (=> b!1148875 (= res!764444 (not (= from!1455 i!673)))))

(declare-fun lt!513689 () ListLongMap!16325)

(assert (=> b!1148875 (= lt!513689 (getCurrentListMapNoExtraKeys!4651 lt!513686 lt!513691 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1148875 (= lt!513691 (array!74512 (store (arr!35906 _values!996) i!673 (ValueCellFull!13706 lt!513676)) (size!36442 _values!996)))))

(declare-fun dynLambda!2678 (Int (_ BitVec 64)) V!43569)

(assert (=> b!1148875 (= lt!513676 (dynLambda!2678 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1148875 (= lt!513678 (getCurrentListMapNoExtraKeys!4651 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1148876 () Bool)

(declare-fun Unit!37762 () Unit!37759)

(assert (=> b!1148876 (= e!653465 Unit!37762)))

(declare-fun b!1148877 () Bool)

(declare-fun res!764443 () Bool)

(assert (=> b!1148877 (=> (not res!764443) (not e!653464))))

(assert (=> b!1148877 (= res!764443 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36441 _keys!1208))))))

(declare-fun b!1148878 () Bool)

(assert (=> b!1148878 (contains!6701 (+!3600 lt!513690 (tuple2!18357 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!513674 () Unit!37759)

(declare-fun call!53161 () Unit!37759)

(assert (=> b!1148878 (= lt!513674 call!53161)))

(assert (=> b!1148878 call!53157))

(assert (=> b!1148878 (= lt!513690 call!53155)))

(declare-fun lt!513685 () Unit!37759)

(declare-fun addStillContains!850 (ListLongMap!16325 (_ BitVec 64) V!43569 (_ BitVec 64)) Unit!37759)

(assert (=> b!1148878 (= lt!513685 (addStillContains!850 lt!513688 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1148878 (= e!653475 lt!513674)))

(declare-fun b!1148879 () Bool)

(declare-fun e!653473 () Bool)

(declare-fun arrayContainsKey!0 (array!74509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148879 (= e!653473 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!653461 () Bool)

(declare-fun b!1148880 () Bool)

(assert (=> b!1148880 (= e!653461 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148881 () Bool)

(assert (=> b!1148881 (= e!653474 (= call!53159 call!53154))))

(declare-fun b!1148882 () Bool)

(declare-fun Unit!37763 () Unit!37759)

(assert (=> b!1148882 (= e!653465 Unit!37763)))

(assert (=> b!1148882 (= lt!513693 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148882 (= c!113572 (and (not lt!513693) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513673 () Unit!37759)

(assert (=> b!1148882 (= lt!513673 e!653475)))

(declare-fun lt!513682 () Unit!37759)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!445 (array!74509 array!74511 (_ BitVec 32) (_ BitVec 32) V!43569 V!43569 (_ BitVec 64) (_ BitVec 32) Int) Unit!37759)

(assert (=> b!1148882 (= lt!513682 (lemmaListMapContainsThenArrayContainsFrom!445 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113569 () Bool)

(assert (=> b!1148882 (= c!113569 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764450 () Bool)

(assert (=> b!1148882 (= res!764450 e!653473)))

(assert (=> b!1148882 (=> (not res!764450) (not e!653461))))

(assert (=> b!1148882 e!653461))

(declare-fun lt!513675 () Unit!37759)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74509 (_ BitVec 32) (_ BitVec 32)) Unit!37759)

(assert (=> b!1148882 (= lt!513675 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148882 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25105)))

(declare-fun lt!513677 () Unit!37759)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74509 (_ BitVec 64) (_ BitVec 32) List!25108) Unit!37759)

(assert (=> b!1148882 (= lt!513677 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25105))))

(assert (=> b!1148882 false))

(declare-fun b!1148883 () Bool)

(assert (=> b!1148883 (= e!653472 (not e!653470))))

(declare-fun res!764452 () Bool)

(assert (=> b!1148883 (=> res!764452 e!653470)))

(assert (=> b!1148883 (= res!764452 (bvsgt from!1455 i!673))))

(assert (=> b!1148883 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!513684 () Unit!37759)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74509 (_ BitVec 64) (_ BitVec 32)) Unit!37759)

(assert (=> b!1148883 (= lt!513684 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1148884 () Bool)

(assert (=> b!1148884 (= e!653463 (and e!653468 mapRes!45071))))

(declare-fun condMapEmpty!45071 () Bool)

(declare-fun mapDefault!45071 () ValueCell!13706)

