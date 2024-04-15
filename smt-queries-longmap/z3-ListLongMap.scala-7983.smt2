; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98732 () Bool)

(assert start!98732)

(declare-fun b_free!24343 () Bool)

(declare-fun b_next!24343 () Bool)

(assert (=> start!98732 (= b_free!24343 (not b_next!24343))))

(declare-fun tp!85739 () Bool)

(declare-fun b_and!39513 () Bool)

(assert (=> start!98732 (= tp!85739 b_and!39513)))

(declare-fun b!1150666 () Bool)

(declare-fun e!654452 () Bool)

(declare-fun tp_is_empty!28873 () Bool)

(assert (=> b!1150666 (= e!654452 tp_is_empty!28873)))

(declare-fun e!654460 () Bool)

(declare-datatypes ((V!43625 0))(
  ( (V!43626 (val!14493 Int)) )
))
(declare-datatypes ((tuple2!18470 0))(
  ( (tuple2!18471 (_1!9246 (_ BitVec 64)) (_2!9246 V!43625)) )
))
(declare-datatypes ((List!25205 0))(
  ( (Nil!25202) (Cons!25201 (h!26410 tuple2!18470) (t!36531 List!25205)) )
))
(declare-datatypes ((ListLongMap!16439 0))(
  ( (ListLongMap!16440 (toList!8235 List!25205)) )
))
(declare-fun call!53638 () ListLongMap!16439)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1150667 () Bool)

(declare-fun call!53637 () ListLongMap!16439)

(declare-fun -!1303 (ListLongMap!16439 (_ BitVec 64)) ListLongMap!16439)

(assert (=> b!1150667 (= e!654460 (= call!53638 (-!1303 call!53637 k0!934)))))

(declare-fun mapNonEmpty!45134 () Bool)

(declare-fun mapRes!45134 () Bool)

(declare-fun tp!85740 () Bool)

(assert (=> mapNonEmpty!45134 (= mapRes!45134 (and tp!85740 e!654452))))

(declare-fun mapKey!45134 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13727 0))(
  ( (ValueCellFull!13727 (v!17129 V!43625)) (EmptyCell!13727) )
))
(declare-fun mapValue!45134 () ValueCell!13727)

(declare-fun mapRest!45134 () (Array (_ BitVec 32) ValueCell!13727))

(declare-datatypes ((array!74510 0))(
  ( (array!74511 (arr!35906 (Array (_ BitVec 32) ValueCell!13727)) (size!36444 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74510)

(assert (=> mapNonEmpty!45134 (= (arr!35906 _values!996) (store mapRest!45134 mapKey!45134 mapValue!45134))))

(declare-fun zeroValue!944 () V!43625)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43625)

(declare-datatypes ((array!74512 0))(
  ( (array!74513 (arr!35907 (Array (_ BitVec 32) (_ BitVec 64))) (size!36445 (_ BitVec 32))) )
))
(declare-fun lt!514871 () array!74512)

(declare-fun bm!53632 () Bool)

(declare-fun lt!514874 () array!74510)

(declare-fun getCurrentListMapNoExtraKeys!4719 (array!74512 array!74510 (_ BitVec 32) (_ BitVec 32) V!43625 V!43625 (_ BitVec 32) Int) ListLongMap!16439)

(assert (=> bm!53632 (= call!53638 (getCurrentListMapNoExtraKeys!4719 lt!514871 lt!514874 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150668 () Bool)

(declare-datatypes ((Unit!37672 0))(
  ( (Unit!37673) )
))
(declare-fun e!654453 () Unit!37672)

(declare-fun Unit!37674 () Unit!37672)

(assert (=> b!1150668 (= e!654453 Unit!37674)))

(declare-fun bm!53633 () Bool)

(declare-fun call!53642 () Unit!37672)

(declare-fun call!53639 () Unit!37672)

(assert (=> bm!53633 (= call!53642 call!53639)))

(declare-fun b!1150669 () Bool)

(declare-fun e!654463 () Unit!37672)

(assert (=> b!1150669 (= e!654463 e!654453)))

(declare-fun c!113924 () Bool)

(declare-fun lt!514877 () Bool)

(assert (=> b!1150669 (= c!113924 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514877))))

(declare-fun b!1150670 () Bool)

(declare-fun res!765332 () Bool)

(declare-fun e!654467 () Bool)

(assert (=> b!1150670 (=> (not res!765332) (not e!654467))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!74512)

(assert (=> b!1150670 (= res!765332 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36445 _keys!1208))))))

(declare-fun b!1150671 () Bool)

(declare-fun e!654457 () Bool)

(declare-fun e!654454 () Bool)

(assert (=> b!1150671 (= e!654457 (not e!654454))))

(declare-fun res!765318 () Bool)

(assert (=> b!1150671 (=> res!765318 e!654454)))

(assert (=> b!1150671 (= res!765318 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150671 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514872 () Unit!37672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74512 (_ BitVec 64) (_ BitVec 32)) Unit!37672)

(assert (=> b!1150671 (= lt!514872 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150672 () Bool)

(declare-fun e!654464 () Bool)

(declare-fun e!654466 () Bool)

(assert (=> b!1150672 (= e!654464 e!654466)))

(declare-fun res!765324 () Bool)

(assert (=> b!1150672 (=> res!765324 e!654466)))

(assert (=> b!1150672 (= res!765324 (not (= (select (arr!35907 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1150672 e!654460))

(declare-fun c!113923 () Bool)

(assert (=> b!1150672 (= c!113923 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514860 () Unit!37672)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!578 (array!74512 array!74510 (_ BitVec 32) (_ BitVec 32) V!43625 V!43625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37672)

(assert (=> b!1150672 (= lt!514860 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150673 () Bool)

(declare-fun e!654459 () Bool)

(assert (=> b!1150673 (= e!654459 tp_is_empty!28873)))

(declare-fun mapIsEmpty!45134 () Bool)

(assert (=> mapIsEmpty!45134 mapRes!45134))

(declare-fun b!1150674 () Bool)

(declare-fun res!765322 () Bool)

(assert (=> b!1150674 (=> (not res!765322) (not e!654467))))

(assert (=> b!1150674 (= res!765322 (= (select (arr!35907 _keys!1208) i!673) k0!934))))

(declare-fun b!1150675 () Bool)

(declare-fun res!765325 () Bool)

(assert (=> b!1150675 (=> (not res!765325) (not e!654467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150675 (= res!765325 (validKeyInArray!0 k0!934))))

(declare-fun e!654468 () Bool)

(declare-fun b!1150676 () Bool)

(assert (=> b!1150676 (= e!654468 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150677 () Bool)

(declare-fun e!654461 () Bool)

(assert (=> b!1150677 (= e!654461 (and e!654459 mapRes!45134))))

(declare-fun condMapEmpty!45134 () Bool)

(declare-fun mapDefault!45134 () ValueCell!13727)

(assert (=> b!1150677 (= condMapEmpty!45134 (= (arr!35906 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13727)) mapDefault!45134)))))

(declare-fun b!1150678 () Bool)

(declare-fun res!765319 () Bool)

(assert (=> b!1150678 (=> (not res!765319) (not e!654467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74512 (_ BitVec 32)) Bool)

(assert (=> b!1150678 (= res!765319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!654456 () Bool)

(declare-fun b!1150679 () Bool)

(declare-fun lt!514879 () ListLongMap!16439)

(assert (=> b!1150679 (= e!654456 (= lt!514879 (getCurrentListMapNoExtraKeys!4719 lt!514871 lt!514874 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1150680 () Bool)

(declare-fun c!113919 () Bool)

(assert (=> b!1150680 (= c!113919 (and (not lt!514877) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654458 () Unit!37672)

(assert (=> b!1150680 (= e!654458 e!654463)))

(declare-fun lt!514868 () ListLongMap!16439)

(declare-fun c!113920 () Bool)

(declare-fun bm!53634 () Bool)

(declare-fun lt!514870 () ListLongMap!16439)

(declare-fun addStillContains!861 (ListLongMap!16439 (_ BitVec 64) V!43625 (_ BitVec 64)) Unit!37672)

(assert (=> bm!53634 (= call!53639 (addStillContains!861 (ite c!113920 lt!514868 lt!514870) (ite c!113920 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113919 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113920 minValue!944 (ite c!113919 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1150681 () Bool)

(declare-fun res!765326 () Bool)

(assert (=> b!1150681 (=> (not res!765326) (not e!654467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150681 (= res!765326 (validMask!0 mask!1564))))

(declare-fun res!765329 () Bool)

(assert (=> start!98732 (=> (not res!765329) (not e!654467))))

(assert (=> start!98732 (= res!765329 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36445 _keys!1208))))))

(assert (=> start!98732 e!654467))

(assert (=> start!98732 tp_is_empty!28873))

(declare-fun array_inv!27588 (array!74512) Bool)

(assert (=> start!98732 (array_inv!27588 _keys!1208)))

(assert (=> start!98732 true))

(assert (=> start!98732 tp!85739))

(declare-fun array_inv!27589 (array!74510) Bool)

(assert (=> start!98732 (and (array_inv!27589 _values!996) e!654461)))

(declare-fun b!1150682 () Bool)

(assert (=> b!1150682 (= e!654460 (= call!53638 call!53637))))

(declare-fun b!1150683 () Bool)

(declare-fun e!654462 () Unit!37672)

(declare-fun Unit!37675 () Unit!37672)

(assert (=> b!1150683 (= e!654462 Unit!37675)))

(declare-fun bm!53635 () Bool)

(declare-fun call!53640 () ListLongMap!16439)

(declare-fun call!53636 () ListLongMap!16439)

(assert (=> bm!53635 (= call!53640 call!53636)))

(declare-fun b!1150684 () Bool)

(declare-fun Unit!37676 () Unit!37672)

(assert (=> b!1150684 (= e!654462 Unit!37676)))

(assert (=> b!1150684 (= lt!514877 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150684 (= c!113920 (and (not lt!514877) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514880 () Unit!37672)

(assert (=> b!1150684 (= lt!514880 e!654458)))

(declare-fun lt!514875 () Unit!37672)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!453 (array!74512 array!74510 (_ BitVec 32) (_ BitVec 32) V!43625 V!43625 (_ BitVec 64) (_ BitVec 32) Int) Unit!37672)

(assert (=> b!1150684 (= lt!514875 (lemmaListMapContainsThenArrayContainsFrom!453 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113921 () Bool)

(assert (=> b!1150684 (= c!113921 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765321 () Bool)

(assert (=> b!1150684 (= res!765321 e!654468)))

(declare-fun e!654465 () Bool)

(assert (=> b!1150684 (=> (not res!765321) (not e!654465))))

(assert (=> b!1150684 e!654465))

(declare-fun lt!514861 () Unit!37672)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74512 (_ BitVec 32) (_ BitVec 32)) Unit!37672)

(assert (=> b!1150684 (= lt!514861 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25206 0))(
  ( (Nil!25203) (Cons!25202 (h!26411 (_ BitVec 64)) (t!36532 List!25206)) )
))
(declare-fun arrayNoDuplicates!0 (array!74512 (_ BitVec 32) List!25206) Bool)

(assert (=> b!1150684 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25203)))

(declare-fun lt!514878 () Unit!37672)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74512 (_ BitVec 64) (_ BitVec 32) List!25206) Unit!37672)

(assert (=> b!1150684 (= lt!514878 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25203))))

(assert (=> b!1150684 false))

(declare-fun b!1150685 () Bool)

(assert (=> b!1150685 (= e!654465 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150686 () Bool)

(declare-fun contains!6691 (ListLongMap!16439 (_ BitVec 64)) Bool)

(assert (=> b!1150686 (contains!6691 call!53636 k0!934)))

(declare-fun lt!514876 () Unit!37672)

(assert (=> b!1150686 (= lt!514876 call!53639)))

(declare-fun call!53641 () Bool)

(assert (=> b!1150686 call!53641))

(declare-fun +!3651 (ListLongMap!16439 tuple2!18470) ListLongMap!16439)

(assert (=> b!1150686 (= lt!514868 (+!3651 lt!514870 (tuple2!18471 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514862 () Unit!37672)

(assert (=> b!1150686 (= lt!514862 (addStillContains!861 lt!514870 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1150686 (= e!654458 lt!514876)))

(declare-fun b!1150687 () Bool)

(declare-fun res!765320 () Bool)

(assert (=> b!1150687 (=> (not res!765320) (not e!654467))))

(assert (=> b!1150687 (= res!765320 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25203))))

(declare-fun b!1150688 () Bool)

(assert (=> b!1150688 (= e!654454 e!654464)))

(declare-fun res!765328 () Bool)

(assert (=> b!1150688 (=> res!765328 e!654464)))

(assert (=> b!1150688 (= res!765328 (not (= from!1455 i!673)))))

(declare-fun lt!514867 () ListLongMap!16439)

(assert (=> b!1150688 (= lt!514867 (getCurrentListMapNoExtraKeys!4719 lt!514871 lt!514874 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!514881 () V!43625)

(assert (=> b!1150688 (= lt!514874 (array!74511 (store (arr!35906 _values!996) i!673 (ValueCellFull!13727 lt!514881)) (size!36444 _values!996)))))

(declare-fun dynLambda!2682 (Int (_ BitVec 64)) V!43625)

(assert (=> b!1150688 (= lt!514881 (dynLambda!2682 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!514865 () ListLongMap!16439)

(assert (=> b!1150688 (= lt!514865 (getCurrentListMapNoExtraKeys!4719 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!53636 () Bool)

(assert (=> bm!53636 (= call!53636 (+!3651 (ite c!113920 lt!514868 lt!514870) (ite c!113920 (tuple2!18471 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113919 (tuple2!18471 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18471 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1150689 () Bool)

(assert (=> b!1150689 (= e!654466 true)))

(assert (=> b!1150689 e!654456))

(declare-fun res!765323 () Bool)

(assert (=> b!1150689 (=> (not res!765323) (not e!654456))))

(assert (=> b!1150689 (= res!765323 (= lt!514879 lt!514870))))

(assert (=> b!1150689 (= lt!514879 (-!1303 lt!514865 k0!934))))

(declare-fun lt!514863 () V!43625)

(assert (=> b!1150689 (= (-!1303 (+!3651 lt!514870 (tuple2!18471 (select (arr!35907 _keys!1208) from!1455) lt!514863)) (select (arr!35907 _keys!1208) from!1455)) lt!514870)))

(declare-fun lt!514864 () Unit!37672)

(declare-fun addThenRemoveForNewKeyIsSame!160 (ListLongMap!16439 (_ BitVec 64) V!43625) Unit!37672)

(assert (=> b!1150689 (= lt!514864 (addThenRemoveForNewKeyIsSame!160 lt!514870 (select (arr!35907 _keys!1208) from!1455) lt!514863))))

(declare-fun get!18288 (ValueCell!13727 V!43625) V!43625)

(assert (=> b!1150689 (= lt!514863 (get!18288 (select (arr!35906 _values!996) from!1455) lt!514881))))

(declare-fun lt!514869 () Unit!37672)

(assert (=> b!1150689 (= lt!514869 e!654462)))

(declare-fun c!113922 () Bool)

(assert (=> b!1150689 (= c!113922 (contains!6691 lt!514870 k0!934))))

(assert (=> b!1150689 (= lt!514870 (getCurrentListMapNoExtraKeys!4719 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150690 () Bool)

(assert (=> b!1150690 (= e!654468 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514877) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150691 () Bool)

(declare-fun call!53635 () Bool)

(assert (=> b!1150691 call!53635))

(declare-fun lt!514866 () Unit!37672)

(assert (=> b!1150691 (= lt!514866 call!53642)))

(assert (=> b!1150691 (= e!654453 lt!514866)))

(declare-fun bm!53637 () Bool)

(assert (=> bm!53637 (= call!53641 (contains!6691 (ite c!113920 lt!514868 call!53640) k0!934))))

(declare-fun b!1150692 () Bool)

(declare-fun res!765327 () Bool)

(assert (=> b!1150692 (=> (not res!765327) (not e!654467))))

(assert (=> b!1150692 (= res!765327 (and (= (size!36444 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36445 _keys!1208) (size!36444 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150693 () Bool)

(assert (=> b!1150693 (= e!654467 e!654457)))

(declare-fun res!765331 () Bool)

(assert (=> b!1150693 (=> (not res!765331) (not e!654457))))

(assert (=> b!1150693 (= res!765331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514871 mask!1564))))

(assert (=> b!1150693 (= lt!514871 (array!74513 (store (arr!35907 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36445 _keys!1208)))))

(declare-fun bm!53638 () Bool)

(assert (=> bm!53638 (= call!53635 call!53641)))

(declare-fun b!1150694 () Bool)

(declare-fun res!765330 () Bool)

(assert (=> b!1150694 (=> (not res!765330) (not e!654457))))

(assert (=> b!1150694 (= res!765330 (arrayNoDuplicates!0 lt!514871 #b00000000000000000000000000000000 Nil!25203))))

(declare-fun bm!53639 () Bool)

(assert (=> bm!53639 (= call!53637 (getCurrentListMapNoExtraKeys!4719 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150695 () Bool)

(declare-fun lt!514873 () Unit!37672)

(assert (=> b!1150695 (= e!654463 lt!514873)))

(assert (=> b!1150695 (= lt!514873 call!53642)))

(assert (=> b!1150695 call!53635))

(assert (= (and start!98732 res!765329) b!1150681))

(assert (= (and b!1150681 res!765326) b!1150692))

(assert (= (and b!1150692 res!765327) b!1150678))

(assert (= (and b!1150678 res!765319) b!1150687))

(assert (= (and b!1150687 res!765320) b!1150670))

(assert (= (and b!1150670 res!765332) b!1150675))

(assert (= (and b!1150675 res!765325) b!1150674))

(assert (= (and b!1150674 res!765322) b!1150693))

(assert (= (and b!1150693 res!765331) b!1150694))

(assert (= (and b!1150694 res!765330) b!1150671))

(assert (= (and b!1150671 (not res!765318)) b!1150688))

(assert (= (and b!1150688 (not res!765328)) b!1150672))

(assert (= (and b!1150672 c!113923) b!1150667))

(assert (= (and b!1150672 (not c!113923)) b!1150682))

(assert (= (or b!1150667 b!1150682) bm!53632))

(assert (= (or b!1150667 b!1150682) bm!53639))

(assert (= (and b!1150672 (not res!765324)) b!1150689))

(assert (= (and b!1150689 c!113922) b!1150684))

(assert (= (and b!1150689 (not c!113922)) b!1150683))

(assert (= (and b!1150684 c!113920) b!1150686))

(assert (= (and b!1150684 (not c!113920)) b!1150680))

(assert (= (and b!1150680 c!113919) b!1150695))

(assert (= (and b!1150680 (not c!113919)) b!1150669))

(assert (= (and b!1150669 c!113924) b!1150691))

(assert (= (and b!1150669 (not c!113924)) b!1150668))

(assert (= (or b!1150695 b!1150691) bm!53633))

(assert (= (or b!1150695 b!1150691) bm!53635))

(assert (= (or b!1150695 b!1150691) bm!53638))

(assert (= (or b!1150686 bm!53638) bm!53637))

(assert (= (or b!1150686 bm!53633) bm!53634))

(assert (= (or b!1150686 bm!53635) bm!53636))

(assert (= (and b!1150684 c!113921) b!1150676))

(assert (= (and b!1150684 (not c!113921)) b!1150690))

(assert (= (and b!1150684 res!765321) b!1150685))

(assert (= (and b!1150689 res!765323) b!1150679))

(assert (= (and b!1150677 condMapEmpty!45134) mapIsEmpty!45134))

(assert (= (and b!1150677 (not condMapEmpty!45134)) mapNonEmpty!45134))

(get-info :version)

(assert (= (and mapNonEmpty!45134 ((_ is ValueCellFull!13727) mapValue!45134)) b!1150666))

(assert (= (and b!1150677 ((_ is ValueCellFull!13727) mapDefault!45134)) b!1150673))

(assert (= start!98732 b!1150677))

(declare-fun b_lambda!19431 () Bool)

(assert (=> (not b_lambda!19431) (not b!1150688)))

(declare-fun t!36530 () Bool)

(declare-fun tb!9147 () Bool)

(assert (=> (and start!98732 (= defaultEntry!1004 defaultEntry!1004) t!36530) tb!9147))

(declare-fun result!18867 () Bool)

(assert (=> tb!9147 (= result!18867 tp_is_empty!28873)))

(assert (=> b!1150688 t!36530))

(declare-fun b_and!39515 () Bool)

(assert (= b_and!39513 (and (=> t!36530 result!18867) b_and!39515)))

(declare-fun m!1060383 () Bool)

(assert (=> b!1150674 m!1060383))

(declare-fun m!1060385 () Bool)

(assert (=> b!1150684 m!1060385))

(declare-fun m!1060387 () Bool)

(assert (=> b!1150684 m!1060387))

(declare-fun m!1060389 () Bool)

(assert (=> b!1150684 m!1060389))

(declare-fun m!1060391 () Bool)

(assert (=> b!1150684 m!1060391))

(declare-fun m!1060393 () Bool)

(assert (=> b!1150689 m!1060393))

(declare-fun m!1060395 () Bool)

(assert (=> b!1150689 m!1060395))

(declare-fun m!1060397 () Bool)

(assert (=> b!1150689 m!1060397))

(declare-fun m!1060399 () Bool)

(assert (=> b!1150689 m!1060399))

(declare-fun m!1060401 () Bool)

(assert (=> b!1150689 m!1060401))

(assert (=> b!1150689 m!1060395))

(declare-fun m!1060403 () Bool)

(assert (=> b!1150689 m!1060403))

(assert (=> b!1150689 m!1060393))

(assert (=> b!1150689 m!1060395))

(declare-fun m!1060405 () Bool)

(assert (=> b!1150689 m!1060405))

(declare-fun m!1060407 () Bool)

(assert (=> b!1150689 m!1060407))

(assert (=> b!1150689 m!1060401))

(declare-fun m!1060409 () Bool)

(assert (=> b!1150689 m!1060409))

(declare-fun m!1060411 () Bool)

(assert (=> bm!53632 m!1060411))

(declare-fun m!1060413 () Bool)

(assert (=> b!1150693 m!1060413))

(declare-fun m!1060415 () Bool)

(assert (=> b!1150693 m!1060415))

(assert (=> b!1150672 m!1060395))

(declare-fun m!1060417 () Bool)

(assert (=> b!1150672 m!1060417))

(declare-fun m!1060419 () Bool)

(assert (=> b!1150667 m!1060419))

(declare-fun m!1060421 () Bool)

(assert (=> bm!53634 m!1060421))

(declare-fun m!1060423 () Bool)

(assert (=> bm!53636 m!1060423))

(declare-fun m!1060425 () Bool)

(assert (=> b!1150685 m!1060425))

(assert (=> b!1150676 m!1060425))

(assert (=> b!1150679 m!1060411))

(declare-fun m!1060427 () Bool)

(assert (=> b!1150687 m!1060427))

(declare-fun m!1060429 () Bool)

(assert (=> b!1150688 m!1060429))

(declare-fun m!1060431 () Bool)

(assert (=> b!1150688 m!1060431))

(declare-fun m!1060433 () Bool)

(assert (=> b!1150688 m!1060433))

(declare-fun m!1060435 () Bool)

(assert (=> b!1150688 m!1060435))

(declare-fun m!1060437 () Bool)

(assert (=> b!1150686 m!1060437))

(declare-fun m!1060439 () Bool)

(assert (=> b!1150686 m!1060439))

(declare-fun m!1060441 () Bool)

(assert (=> b!1150686 m!1060441))

(declare-fun m!1060443 () Bool)

(assert (=> bm!53637 m!1060443))

(declare-fun m!1060445 () Bool)

(assert (=> b!1150675 m!1060445))

(declare-fun m!1060447 () Bool)

(assert (=> b!1150694 m!1060447))

(declare-fun m!1060449 () Bool)

(assert (=> start!98732 m!1060449))

(declare-fun m!1060451 () Bool)

(assert (=> start!98732 m!1060451))

(declare-fun m!1060453 () Bool)

(assert (=> b!1150671 m!1060453))

(declare-fun m!1060455 () Bool)

(assert (=> b!1150671 m!1060455))

(declare-fun m!1060457 () Bool)

(assert (=> b!1150678 m!1060457))

(declare-fun m!1060459 () Bool)

(assert (=> mapNonEmpty!45134 m!1060459))

(declare-fun m!1060461 () Bool)

(assert (=> b!1150681 m!1060461))

(assert (=> bm!53639 m!1060405))

(check-sat (not mapNonEmpty!45134) (not b!1150671) (not b!1150676) (not b!1150694) (not bm!53636) (not b_next!24343) (not b!1150678) (not b!1150679) (not b!1150688) b_and!39515 (not b!1150687) (not bm!53637) (not b!1150675) (not b!1150689) (not bm!53634) (not b!1150681) (not b!1150672) (not b!1150685) (not b_lambda!19431) (not b!1150684) (not b!1150693) (not start!98732) (not bm!53639) tp_is_empty!28873 (not b!1150686) (not bm!53632) (not b!1150667))
(check-sat b_and!39515 (not b_next!24343))
