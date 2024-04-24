; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98704 () Bool)

(assert start!98704)

(declare-fun b_free!24073 () Bool)

(declare-fun b_next!24073 () Bool)

(assert (=> start!98704 (= b_free!24073 (not b_next!24073))))

(declare-fun tp!84930 () Bool)

(declare-fun b_and!38997 () Bool)

(assert (=> start!98704 (= tp!84930 b_and!38997)))

(declare-datatypes ((V!43265 0))(
  ( (V!43266 (val!14358 Int)) )
))
(declare-fun zeroValue!944 () V!43265)

(declare-fun bm!50480 () Bool)

(declare-datatypes ((ValueCell!13592 0))(
  ( (ValueCellFull!13592 (v!16991 V!43265)) (EmptyCell!13592) )
))
(declare-datatypes ((array!74107 0))(
  ( (array!74108 (arr!35698 (Array (_ BitVec 32) ValueCell!13592)) (size!36235 (_ BitVec 32))) )
))
(declare-fun lt!507044 () array!74107)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74109 0))(
  ( (array!74110 (arr!35699 (Array (_ BitVec 32) (_ BitVec 64))) (size!36236 (_ BitVec 32))) )
))
(declare-fun lt!507055 () array!74109)

(declare-datatypes ((tuple2!18154 0))(
  ( (tuple2!18155 (_1!9088 (_ BitVec 64)) (_2!9088 V!43265)) )
))
(declare-datatypes ((List!24918 0))(
  ( (Nil!24915) (Cons!24914 (h!26132 tuple2!18154) (t!35975 List!24918)) )
))
(declare-datatypes ((ListLongMap!16131 0))(
  ( (ListLongMap!16132 (toList!8081 List!24918)) )
))
(declare-fun call!50488 () ListLongMap!16131)

(declare-fun minValue!944 () V!43265)

(declare-fun getCurrentListMapNoExtraKeys!4591 (array!74109 array!74107 (_ BitVec 32) (_ BitVec 32) V!43265 V!43265 (_ BitVec 32) Int) ListLongMap!16131)

(assert (=> bm!50480 (= call!50488 (getCurrentListMapNoExtraKeys!4591 lt!507055 lt!507044 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139846 () Bool)

(declare-fun e!648667 () Bool)

(declare-fun e!648674 () Bool)

(assert (=> b!1139846 (= e!648667 e!648674)))

(declare-fun res!760017 () Bool)

(assert (=> b!1139846 (=> (not res!760017) (not e!648674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74109 (_ BitVec 32)) Bool)

(assert (=> b!1139846 (= res!760017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507055 mask!1564))))

(declare-fun _keys!1208 () array!74109)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139846 (= lt!507055 (array!74110 (store (arr!35699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36236 _keys!1208)))))

(declare-fun b!1139847 () Bool)

(declare-fun e!648665 () Bool)

(declare-fun tp_is_empty!28603 () Bool)

(assert (=> b!1139847 (= e!648665 tp_is_empty!28603)))

(declare-fun b!1139848 () Bool)

(declare-fun res!760007 () Bool)

(assert (=> b!1139848 (=> (not res!760007) (not e!648667))))

(declare-fun _values!996 () array!74107)

(assert (=> b!1139848 (= res!760007 (and (= (size!36235 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36236 _keys!1208) (size!36235 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!648668 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1139849 () Bool)

(declare-fun lt!507042 () Bool)

(assert (=> b!1139849 (= e!648668 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507042) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1139850 () Bool)

(declare-datatypes ((Unit!37286 0))(
  ( (Unit!37287) )
))
(declare-fun e!648677 () Unit!37286)

(declare-fun lt!507049 () Unit!37286)

(assert (=> b!1139850 (= e!648677 lt!507049)))

(declare-fun call!50487 () Unit!37286)

(assert (=> b!1139850 (= lt!507049 call!50487)))

(declare-fun call!50489 () Bool)

(assert (=> b!1139850 call!50489))

(declare-fun lt!507046 () ListLongMap!16131)

(declare-fun call!50485 () ListLongMap!16131)

(declare-fun c!111917 () Bool)

(declare-fun call!50483 () Bool)

(declare-fun bm!50481 () Bool)

(declare-fun contains!6631 (ListLongMap!16131 (_ BitVec 64)) Bool)

(assert (=> bm!50481 (= call!50483 (contains!6631 (ite c!111917 lt!507046 call!50485) k0!934))))

(declare-fun b!1139851 () Bool)

(declare-fun call!50490 () ListLongMap!16131)

(assert (=> b!1139851 (contains!6631 call!50490 k0!934)))

(declare-fun lt!507041 () Unit!37286)

(declare-fun call!50486 () Unit!37286)

(assert (=> b!1139851 (= lt!507041 call!50486)))

(assert (=> b!1139851 call!50483))

(declare-fun lt!507056 () ListLongMap!16131)

(declare-fun +!3533 (ListLongMap!16131 tuple2!18154) ListLongMap!16131)

(assert (=> b!1139851 (= lt!507046 (+!3533 lt!507056 (tuple2!18155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507058 () Unit!37286)

(declare-fun addStillContains!760 (ListLongMap!16131 (_ BitVec 64) V!43265 (_ BitVec 64)) Unit!37286)

(assert (=> b!1139851 (= lt!507058 (addStillContains!760 lt!507056 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!648666 () Unit!37286)

(assert (=> b!1139851 (= e!648666 lt!507041)))

(declare-fun b!1139852 () Bool)

(declare-fun e!648675 () Bool)

(declare-fun e!648673 () Bool)

(assert (=> b!1139852 (= e!648675 e!648673)))

(declare-fun res!760012 () Bool)

(assert (=> b!1139852 (=> res!760012 e!648673)))

(assert (=> b!1139852 (= res!760012 (not (= (select (arr!35699 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648671 () Bool)

(assert (=> b!1139852 e!648671))

(declare-fun c!111916 () Bool)

(assert (=> b!1139852 (= c!111916 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507052 () Unit!37286)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!476 (array!74109 array!74107 (_ BitVec 32) (_ BitVec 32) V!43265 V!43265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37286)

(assert (=> b!1139852 (= lt!507052 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139853 () Bool)

(declare-fun res!760004 () Bool)

(assert (=> b!1139853 (=> (not res!760004) (not e!648667))))

(assert (=> b!1139853 (= res!760004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139854 () Bool)

(assert (=> b!1139854 (= e!648673 true)))

(declare-fun lt!507053 () Unit!37286)

(declare-fun e!648664 () Unit!37286)

(assert (=> b!1139854 (= lt!507053 e!648664)))

(declare-fun c!111915 () Bool)

(assert (=> b!1139854 (= c!111915 (contains!6631 lt!507056 k0!934))))

(assert (=> b!1139854 (= lt!507056 (getCurrentListMapNoExtraKeys!4591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!760016 () Bool)

(assert (=> start!98704 (=> (not res!760016) (not e!648667))))

(assert (=> start!98704 (= res!760016 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36236 _keys!1208))))))

(assert (=> start!98704 e!648667))

(assert (=> start!98704 tp_is_empty!28603))

(declare-fun array_inv!27414 (array!74109) Bool)

(assert (=> start!98704 (array_inv!27414 _keys!1208)))

(assert (=> start!98704 true))

(assert (=> start!98704 tp!84930))

(declare-fun e!648679 () Bool)

(declare-fun array_inv!27415 (array!74107) Bool)

(assert (=> start!98704 (and (array_inv!27415 _values!996) e!648679)))

(declare-fun bm!50482 () Bool)

(declare-fun c!111913 () Bool)

(assert (=> bm!50482 (= call!50490 (+!3533 (ite c!111917 lt!507046 lt!507056) (ite c!111917 (tuple2!18155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111913 (tuple2!18155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!648676 () Bool)

(declare-fun b!1139855 () Bool)

(declare-fun arrayContainsKey!0 (array!74109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139855 (= e!648676 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139856 () Bool)

(declare-fun res!760008 () Bool)

(assert (=> b!1139856 (=> (not res!760008) (not e!648674))))

(declare-datatypes ((List!24919 0))(
  ( (Nil!24916) (Cons!24915 (h!26133 (_ BitVec 64)) (t!35976 List!24919)) )
))
(declare-fun arrayNoDuplicates!0 (array!74109 (_ BitVec 32) List!24919) Bool)

(assert (=> b!1139856 (= res!760008 (arrayNoDuplicates!0 lt!507055 #b00000000000000000000000000000000 Nil!24916))))

(declare-fun b!1139857 () Bool)

(declare-fun res!760014 () Bool)

(assert (=> b!1139857 (=> (not res!760014) (not e!648667))))

(assert (=> b!1139857 (= res!760014 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24916))))

(declare-fun mapNonEmpty!44729 () Bool)

(declare-fun mapRes!44729 () Bool)

(declare-fun tp!84929 () Bool)

(assert (=> mapNonEmpty!44729 (= mapRes!44729 (and tp!84929 e!648665))))

(declare-fun mapRest!44729 () (Array (_ BitVec 32) ValueCell!13592))

(declare-fun mapKey!44729 () (_ BitVec 32))

(declare-fun mapValue!44729 () ValueCell!13592)

(assert (=> mapNonEmpty!44729 (= (arr!35698 _values!996) (store mapRest!44729 mapKey!44729 mapValue!44729))))

(declare-fun b!1139858 () Bool)

(declare-fun e!648672 () Unit!37286)

(assert (=> b!1139858 (= e!648677 e!648672)))

(declare-fun c!111918 () Bool)

(assert (=> b!1139858 (= c!111918 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507042))))

(declare-fun b!1139859 () Bool)

(declare-fun e!648670 () Bool)

(assert (=> b!1139859 (= e!648670 e!648675)))

(declare-fun res!760015 () Bool)

(assert (=> b!1139859 (=> res!760015 e!648675)))

(assert (=> b!1139859 (= res!760015 (not (= from!1455 i!673)))))

(declare-fun lt!507051 () ListLongMap!16131)

(assert (=> b!1139859 (= lt!507051 (getCurrentListMapNoExtraKeys!4591 lt!507055 lt!507044 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2638 (Int (_ BitVec 64)) V!43265)

(assert (=> b!1139859 (= lt!507044 (array!74108 (store (arr!35698 _values!996) i!673 (ValueCellFull!13592 (dynLambda!2638 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36235 _values!996)))))

(declare-fun lt!507047 () ListLongMap!16131)

(assert (=> b!1139859 (= lt!507047 (getCurrentListMapNoExtraKeys!4591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!50483 () Bool)

(assert (=> bm!50483 (= call!50487 call!50486)))

(declare-fun b!1139860 () Bool)

(declare-fun e!648678 () Bool)

(assert (=> b!1139860 (= e!648678 tp_is_empty!28603)))

(declare-fun mapIsEmpty!44729 () Bool)

(assert (=> mapIsEmpty!44729 mapRes!44729))

(declare-fun b!1139861 () Bool)

(declare-fun Unit!37288 () Unit!37286)

(assert (=> b!1139861 (= e!648672 Unit!37288)))

(declare-fun bm!50484 () Bool)

(declare-fun call!50484 () ListLongMap!16131)

(assert (=> bm!50484 (= call!50484 (getCurrentListMapNoExtraKeys!4591 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139862 () Bool)

(assert (=> b!1139862 (= e!648671 (= call!50488 call!50484))))

(declare-fun b!1139863 () Bool)

(declare-fun res!760013 () Bool)

(assert (=> b!1139863 (=> (not res!760013) (not e!648667))))

(assert (=> b!1139863 (= res!760013 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36236 _keys!1208))))))

(declare-fun bm!50485 () Bool)

(assert (=> bm!50485 (= call!50485 call!50490)))

(declare-fun b!1139864 () Bool)

(assert (=> b!1139864 (= c!111913 (and (not lt!507042) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139864 (= e!648666 e!648677)))

(declare-fun bm!50486 () Bool)

(assert (=> bm!50486 (= call!50486 (addStillContains!760 (ite c!111917 lt!507046 lt!507056) (ite c!111917 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111913 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111917 minValue!944 (ite c!111913 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1139865 () Bool)

(declare-fun res!760006 () Bool)

(assert (=> b!1139865 (=> (not res!760006) (not e!648667))))

(assert (=> b!1139865 (= res!760006 (= (select (arr!35699 _keys!1208) i!673) k0!934))))

(declare-fun b!1139866 () Bool)

(assert (=> b!1139866 (= e!648679 (and e!648678 mapRes!44729))))

(declare-fun condMapEmpty!44729 () Bool)

(declare-fun mapDefault!44729 () ValueCell!13592)

(assert (=> b!1139866 (= condMapEmpty!44729 (= (arr!35698 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13592)) mapDefault!44729)))))

(declare-fun b!1139867 () Bool)

(declare-fun res!760005 () Bool)

(assert (=> b!1139867 (=> (not res!760005) (not e!648667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139867 (= res!760005 (validMask!0 mask!1564))))

(declare-fun b!1139868 () Bool)

(assert (=> b!1139868 (= e!648668 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139869 () Bool)

(assert (=> b!1139869 (= e!648674 (not e!648670))))

(declare-fun res!760010 () Bool)

(assert (=> b!1139869 (=> res!760010 e!648670)))

(assert (=> b!1139869 (= res!760010 (bvsgt from!1455 i!673))))

(assert (=> b!1139869 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507057 () Unit!37286)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74109 (_ BitVec 64) (_ BitVec 32)) Unit!37286)

(assert (=> b!1139869 (= lt!507057 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1139870 () Bool)

(declare-fun -!1218 (ListLongMap!16131 (_ BitVec 64)) ListLongMap!16131)

(assert (=> b!1139870 (= e!648671 (= call!50488 (-!1218 call!50484 k0!934)))))

(declare-fun b!1139871 () Bool)

(declare-fun Unit!37289 () Unit!37286)

(assert (=> b!1139871 (= e!648664 Unit!37289)))

(assert (=> b!1139871 (= lt!507042 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139871 (= c!111917 (and (not lt!507042) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507048 () Unit!37286)

(assert (=> b!1139871 (= lt!507048 e!648666)))

(declare-fun lt!507054 () Unit!37286)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!367 (array!74109 array!74107 (_ BitVec 32) (_ BitVec 32) V!43265 V!43265 (_ BitVec 64) (_ BitVec 32) Int) Unit!37286)

(assert (=> b!1139871 (= lt!507054 (lemmaListMapContainsThenArrayContainsFrom!367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111914 () Bool)

(assert (=> b!1139871 (= c!111914 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760011 () Bool)

(assert (=> b!1139871 (= res!760011 e!648668)))

(assert (=> b!1139871 (=> (not res!760011) (not e!648676))))

(assert (=> b!1139871 e!648676))

(declare-fun lt!507043 () Unit!37286)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74109 (_ BitVec 32) (_ BitVec 32)) Unit!37286)

(assert (=> b!1139871 (= lt!507043 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139871 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24916)))

(declare-fun lt!507045 () Unit!37286)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74109 (_ BitVec 64) (_ BitVec 32) List!24919) Unit!37286)

(assert (=> b!1139871 (= lt!507045 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24916))))

(assert (=> b!1139871 false))

(declare-fun bm!50487 () Bool)

(assert (=> bm!50487 (= call!50489 call!50483)))

(declare-fun b!1139872 () Bool)

(declare-fun res!760009 () Bool)

(assert (=> b!1139872 (=> (not res!760009) (not e!648667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139872 (= res!760009 (validKeyInArray!0 k0!934))))

(declare-fun b!1139873 () Bool)

(declare-fun Unit!37290 () Unit!37286)

(assert (=> b!1139873 (= e!648664 Unit!37290)))

(declare-fun b!1139874 () Bool)

(assert (=> b!1139874 call!50489))

(declare-fun lt!507050 () Unit!37286)

(assert (=> b!1139874 (= lt!507050 call!50487)))

(assert (=> b!1139874 (= e!648672 lt!507050)))

(assert (= (and start!98704 res!760016) b!1139867))

(assert (= (and b!1139867 res!760005) b!1139848))

(assert (= (and b!1139848 res!760007) b!1139853))

(assert (= (and b!1139853 res!760004) b!1139857))

(assert (= (and b!1139857 res!760014) b!1139863))

(assert (= (and b!1139863 res!760013) b!1139872))

(assert (= (and b!1139872 res!760009) b!1139865))

(assert (= (and b!1139865 res!760006) b!1139846))

(assert (= (and b!1139846 res!760017) b!1139856))

(assert (= (and b!1139856 res!760008) b!1139869))

(assert (= (and b!1139869 (not res!760010)) b!1139859))

(assert (= (and b!1139859 (not res!760015)) b!1139852))

(assert (= (and b!1139852 c!111916) b!1139870))

(assert (= (and b!1139852 (not c!111916)) b!1139862))

(assert (= (or b!1139870 b!1139862) bm!50480))

(assert (= (or b!1139870 b!1139862) bm!50484))

(assert (= (and b!1139852 (not res!760012)) b!1139854))

(assert (= (and b!1139854 c!111915) b!1139871))

(assert (= (and b!1139854 (not c!111915)) b!1139873))

(assert (= (and b!1139871 c!111917) b!1139851))

(assert (= (and b!1139871 (not c!111917)) b!1139864))

(assert (= (and b!1139864 c!111913) b!1139850))

(assert (= (and b!1139864 (not c!111913)) b!1139858))

(assert (= (and b!1139858 c!111918) b!1139874))

(assert (= (and b!1139858 (not c!111918)) b!1139861))

(assert (= (or b!1139850 b!1139874) bm!50483))

(assert (= (or b!1139850 b!1139874) bm!50485))

(assert (= (or b!1139850 b!1139874) bm!50487))

(assert (= (or b!1139851 bm!50487) bm!50481))

(assert (= (or b!1139851 bm!50483) bm!50486))

(assert (= (or b!1139851 bm!50485) bm!50482))

(assert (= (and b!1139871 c!111914) b!1139868))

(assert (= (and b!1139871 (not c!111914)) b!1139849))

(assert (= (and b!1139871 res!760011) b!1139855))

(assert (= (and b!1139866 condMapEmpty!44729) mapIsEmpty!44729))

(assert (= (and b!1139866 (not condMapEmpty!44729)) mapNonEmpty!44729))

(get-info :version)

(assert (= (and mapNonEmpty!44729 ((_ is ValueCellFull!13592) mapValue!44729)) b!1139847))

(assert (= (and b!1139866 ((_ is ValueCellFull!13592) mapDefault!44729)) b!1139860))

(assert (= start!98704 b!1139866))

(declare-fun b_lambda!19173 () Bool)

(assert (=> (not b_lambda!19173) (not b!1139859)))

(declare-fun t!35974 () Bool)

(declare-fun tb!8877 () Bool)

(assert (=> (and start!98704 (= defaultEntry!1004 defaultEntry!1004) t!35974) tb!8877))

(declare-fun result!18327 () Bool)

(assert (=> tb!8877 (= result!18327 tp_is_empty!28603)))

(assert (=> b!1139859 t!35974))

(declare-fun b_and!38999 () Bool)

(assert (= b_and!38997 (and (=> t!35974 result!18327) b_and!38999)))

(declare-fun m!1051959 () Bool)

(assert (=> b!1139856 m!1051959))

(declare-fun m!1051961 () Bool)

(assert (=> b!1139867 m!1051961))

(declare-fun m!1051963 () Bool)

(assert (=> b!1139852 m!1051963))

(declare-fun m!1051965 () Bool)

(assert (=> b!1139852 m!1051965))

(declare-fun m!1051967 () Bool)

(assert (=> start!98704 m!1051967))

(declare-fun m!1051969 () Bool)

(assert (=> start!98704 m!1051969))

(declare-fun m!1051971 () Bool)

(assert (=> bm!50482 m!1051971))

(declare-fun m!1051973 () Bool)

(assert (=> b!1139868 m!1051973))

(declare-fun m!1051975 () Bool)

(assert (=> bm!50486 m!1051975))

(declare-fun m!1051977 () Bool)

(assert (=> b!1139851 m!1051977))

(declare-fun m!1051979 () Bool)

(assert (=> b!1139851 m!1051979))

(declare-fun m!1051981 () Bool)

(assert (=> b!1139851 m!1051981))

(declare-fun m!1051983 () Bool)

(assert (=> b!1139857 m!1051983))

(declare-fun m!1051985 () Bool)

(assert (=> b!1139846 m!1051985))

(declare-fun m!1051987 () Bool)

(assert (=> b!1139846 m!1051987))

(declare-fun m!1051989 () Bool)

(assert (=> b!1139853 m!1051989))

(declare-fun m!1051991 () Bool)

(assert (=> b!1139870 m!1051991))

(assert (=> b!1139855 m!1051973))

(declare-fun m!1051993 () Bool)

(assert (=> b!1139872 m!1051993))

(declare-fun m!1051995 () Bool)

(assert (=> bm!50481 m!1051995))

(declare-fun m!1051997 () Bool)

(assert (=> b!1139869 m!1051997))

(declare-fun m!1051999 () Bool)

(assert (=> b!1139869 m!1051999))

(declare-fun m!1052001 () Bool)

(assert (=> b!1139865 m!1052001))

(declare-fun m!1052003 () Bool)

(assert (=> bm!50480 m!1052003))

(declare-fun m!1052005 () Bool)

(assert (=> b!1139854 m!1052005))

(declare-fun m!1052007 () Bool)

(assert (=> b!1139854 m!1052007))

(declare-fun m!1052009 () Bool)

(assert (=> mapNonEmpty!44729 m!1052009))

(declare-fun m!1052011 () Bool)

(assert (=> b!1139871 m!1052011))

(declare-fun m!1052013 () Bool)

(assert (=> b!1139871 m!1052013))

(declare-fun m!1052015 () Bool)

(assert (=> b!1139871 m!1052015))

(declare-fun m!1052017 () Bool)

(assert (=> b!1139871 m!1052017))

(assert (=> bm!50484 m!1052007))

(declare-fun m!1052019 () Bool)

(assert (=> b!1139859 m!1052019))

(declare-fun m!1052021 () Bool)

(assert (=> b!1139859 m!1052021))

(declare-fun m!1052023 () Bool)

(assert (=> b!1139859 m!1052023))

(declare-fun m!1052025 () Bool)

(assert (=> b!1139859 m!1052025))

(check-sat (not b!1139868) (not b!1139855) (not b!1139846) (not b!1139871) (not bm!50482) (not b!1139852) (not bm!50486) (not b!1139857) (not b!1139859) (not b!1139872) (not bm!50484) (not b!1139870) (not b_lambda!19173) (not start!98704) (not bm!50481) (not bm!50480) (not b_next!24073) (not b!1139853) (not b!1139856) (not mapNonEmpty!44729) (not b!1139851) (not b!1139867) (not b!1139854) (not b!1139869) tp_is_empty!28603 b_and!38999)
(check-sat b_and!38999 (not b_next!24073))
