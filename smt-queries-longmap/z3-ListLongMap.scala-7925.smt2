; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98384 () Bool)

(assert start!98384)

(declare-fun b_free!23995 () Bool)

(declare-fun b_next!23995 () Bool)

(assert (=> start!98384 (= b_free!23995 (not b_next!23995))))

(declare-fun tp!84696 () Bool)

(declare-fun b_and!38817 () Bool)

(assert (=> start!98384 (= tp!84696 b_and!38817)))

(declare-fun b!1134858 () Bool)

(declare-fun res!757590 () Bool)

(declare-fun e!645845 () Bool)

(assert (=> b!1134858 (=> (not res!757590) (not e!645845))))

(declare-datatypes ((array!73834 0))(
  ( (array!73835 (arr!35568 (Array (_ BitVec 32) (_ BitVec 64))) (size!36106 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73834)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73834 (_ BitVec 32)) Bool)

(assert (=> b!1134858 (= res!757590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134859 () Bool)

(declare-datatypes ((Unit!37025 0))(
  ( (Unit!37026) )
))
(declare-fun e!645839 () Unit!37025)

(declare-fun Unit!37027 () Unit!37025)

(assert (=> b!1134859 (= e!645839 Unit!37027)))

(declare-fun b!1134860 () Bool)

(declare-fun e!645841 () Bool)

(declare-fun e!645834 () Bool)

(assert (=> b!1134860 (= e!645841 (not e!645834))))

(declare-fun res!757594 () Bool)

(assert (=> b!1134860 (=> res!757594 e!645834)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134860 (= res!757594 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134860 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504327 () Unit!37025)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73834 (_ BitVec 64) (_ BitVec 32)) Unit!37025)

(assert (=> b!1134860 (= lt!504327 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!757584 () Bool)

(assert (=> start!98384 (=> (not res!757584) (not e!645845))))

(assert (=> start!98384 (= res!757584 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36106 _keys!1208))))))

(assert (=> start!98384 e!645845))

(declare-fun tp_is_empty!28525 () Bool)

(assert (=> start!98384 tp_is_empty!28525))

(declare-fun array_inv!27348 (array!73834) Bool)

(assert (=> start!98384 (array_inv!27348 _keys!1208)))

(assert (=> start!98384 true))

(assert (=> start!98384 tp!84696))

(declare-datatypes ((V!43161 0))(
  ( (V!43162 (val!14319 Int)) )
))
(declare-datatypes ((ValueCell!13553 0))(
  ( (ValueCellFull!13553 (v!16955 V!43161)) (EmptyCell!13553) )
))
(declare-datatypes ((array!73836 0))(
  ( (array!73837 (arr!35569 (Array (_ BitVec 32) ValueCell!13553)) (size!36107 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73836)

(declare-fun e!645832 () Bool)

(declare-fun array_inv!27349 (array!73836) Bool)

(assert (=> start!98384 (and (array_inv!27349 _values!996) e!645832)))

(declare-fun bm!49456 () Bool)

(declare-datatypes ((tuple2!18154 0))(
  ( (tuple2!18155 (_1!9088 (_ BitVec 64)) (_2!9088 V!43161)) )
))
(declare-datatypes ((List!24900 0))(
  ( (Nil!24897) (Cons!24896 (h!26105 tuple2!18154) (t!35878 List!24900)) )
))
(declare-datatypes ((ListLongMap!16123 0))(
  ( (ListLongMap!16124 (toList!8077 List!24900)) )
))
(declare-fun call!49466 () ListLongMap!16123)

(declare-fun call!49465 () ListLongMap!16123)

(assert (=> bm!49456 (= call!49466 call!49465)))

(declare-fun lt!504313 () ListLongMap!16123)

(declare-fun call!49459 () Bool)

(declare-fun c!110842 () Bool)

(declare-fun bm!49457 () Bool)

(declare-fun contains!6538 (ListLongMap!16123 (_ BitVec 64)) Bool)

(assert (=> bm!49457 (= call!49459 (contains!6538 (ite c!110842 lt!504313 call!49466) k0!934))))

(declare-fun b!1134861 () Bool)

(declare-fun res!757601 () Bool)

(assert (=> b!1134861 (=> (not res!757601) (not e!645845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134861 (= res!757601 (validKeyInArray!0 k0!934))))

(declare-fun b!1134862 () Bool)

(declare-fun e!645843 () Unit!37025)

(declare-fun e!645840 () Unit!37025)

(assert (=> b!1134862 (= e!645843 e!645840)))

(declare-fun c!110843 () Bool)

(declare-fun lt!504324 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1134862 (= c!110843 (and (not lt!504324) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!49464 () ListLongMap!16123)

(declare-fun e!645838 () Bool)

(declare-fun call!49463 () ListLongMap!16123)

(declare-fun b!1134863 () Bool)

(declare-fun -!1176 (ListLongMap!16123 (_ BitVec 64)) ListLongMap!16123)

(assert (=> b!1134863 (= e!645838 (= call!49464 (-!1176 call!49463 k0!934)))))

(declare-fun b!1134864 () Bool)

(declare-fun c!110840 () Bool)

(assert (=> b!1134864 (= c!110840 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504324))))

(assert (=> b!1134864 (= e!645840 e!645839)))

(declare-fun b!1134865 () Bool)

(declare-fun res!757585 () Bool)

(assert (=> b!1134865 (=> (not res!757585) (not e!645845))))

(declare-datatypes ((List!24901 0))(
  ( (Nil!24898) (Cons!24897 (h!26106 (_ BitVec 64)) (t!35879 List!24901)) )
))
(declare-fun arrayNoDuplicates!0 (array!73834 (_ BitVec 32) List!24901) Bool)

(assert (=> b!1134865 (= res!757585 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24898))))

(declare-fun zeroValue!944 () V!43161)

(declare-fun bm!49458 () Bool)

(declare-fun call!49461 () Unit!37025)

(declare-fun minValue!944 () V!43161)

(declare-fun lt!504315 () ListLongMap!16123)

(declare-fun addStillContains!727 (ListLongMap!16123 (_ BitVec 64) V!43161 (_ BitVec 64)) Unit!37025)

(assert (=> bm!49458 (= call!49461 (addStillContains!727 (ite c!110842 lt!504313 lt!504315) (ite c!110842 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110843 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110842 minValue!944 (ite c!110843 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1134866 () Bool)

(declare-fun res!757598 () Bool)

(assert (=> b!1134866 (=> (not res!757598) (not e!645845))))

(assert (=> b!1134866 (= res!757598 (and (= (size!36107 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36106 _keys!1208) (size!36107 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!49459 () Bool)

(declare-fun call!49460 () Bool)

(assert (=> bm!49459 (= call!49460 call!49459)))

(declare-fun b!1134867 () Bool)

(declare-fun e!645835 () Bool)

(declare-fun e!645837 () Bool)

(assert (=> b!1134867 (= e!645835 e!645837)))

(declare-fun res!757595 () Bool)

(assert (=> b!1134867 (=> res!757595 e!645837)))

(assert (=> b!1134867 (= res!757595 (not (contains!6538 lt!504315 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4575 (array!73834 array!73836 (_ BitVec 32) (_ BitVec 32) V!43161 V!43161 (_ BitVec 32) Int) ListLongMap!16123)

(assert (=> b!1134867 (= lt!504315 (getCurrentListMapNoExtraKeys!4575 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504316 () array!73834)

(declare-fun bm!49460 () Bool)

(declare-fun lt!504320 () array!73836)

(assert (=> bm!49460 (= call!49464 (getCurrentListMapNoExtraKeys!4575 lt!504316 lt!504320 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44612 () Bool)

(declare-fun mapRes!44612 () Bool)

(assert (=> mapIsEmpty!44612 mapRes!44612))

(declare-fun b!1134868 () Bool)

(assert (=> b!1134868 (= e!645838 (= call!49464 call!49463))))

(declare-fun mapNonEmpty!44612 () Bool)

(declare-fun tp!84695 () Bool)

(declare-fun e!645836 () Bool)

(assert (=> mapNonEmpty!44612 (= mapRes!44612 (and tp!84695 e!645836))))

(declare-fun mapValue!44612 () ValueCell!13553)

(declare-fun mapRest!44612 () (Array (_ BitVec 32) ValueCell!13553))

(declare-fun mapKey!44612 () (_ BitVec 32))

(assert (=> mapNonEmpty!44612 (= (arr!35569 _values!996) (store mapRest!44612 mapKey!44612 mapValue!44612))))

(declare-fun e!645830 () Bool)

(declare-fun b!1134869 () Bool)

(assert (=> b!1134869 (= e!645830 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504324) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134870 () Bool)

(assert (=> b!1134870 call!49460))

(declare-fun lt!504326 () Unit!37025)

(declare-fun call!49462 () Unit!37025)

(assert (=> b!1134870 (= lt!504326 call!49462)))

(assert (=> b!1134870 (= e!645840 lt!504326)))

(declare-fun b!1134871 () Bool)

(declare-fun e!645833 () Bool)

(assert (=> b!1134871 (= e!645833 true)))

(declare-fun lt!504311 () Bool)

(declare-fun contains!6539 (List!24901 (_ BitVec 64)) Bool)

(assert (=> b!1134871 (= lt!504311 (contains!6539 Nil!24898 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!49461 () Bool)

(assert (=> bm!49461 (= call!49463 (getCurrentListMapNoExtraKeys!4575 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134872 () Bool)

(declare-fun e!645831 () Bool)

(assert (=> b!1134872 (= e!645832 (and e!645831 mapRes!44612))))

(declare-fun condMapEmpty!44612 () Bool)

(declare-fun mapDefault!44612 () ValueCell!13553)

(assert (=> b!1134872 (= condMapEmpty!44612 (= (arr!35569 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13553)) mapDefault!44612)))))

(declare-fun bm!49462 () Bool)

(assert (=> bm!49462 (= call!49462 call!49461)))

(declare-fun b!1134873 () Bool)

(declare-fun res!757587 () Bool)

(assert (=> b!1134873 (=> (not res!757587) (not e!645845))))

(assert (=> b!1134873 (= res!757587 (= (select (arr!35568 _keys!1208) i!673) k0!934))))

(declare-fun b!1134874 () Bool)

(declare-fun lt!504312 () Unit!37025)

(assert (=> b!1134874 (= e!645843 lt!504312)))

(declare-fun lt!504321 () Unit!37025)

(assert (=> b!1134874 (= lt!504321 (addStillContains!727 lt!504315 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun +!3510 (ListLongMap!16123 tuple2!18154) ListLongMap!16123)

(assert (=> b!1134874 (= lt!504313 (+!3510 lt!504315 (tuple2!18155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1134874 call!49459))

(assert (=> b!1134874 (= lt!504312 call!49461)))

(assert (=> b!1134874 (contains!6538 call!49465 k0!934)))

(declare-fun b!1134875 () Bool)

(assert (=> b!1134875 (= e!645831 tp_is_empty!28525)))

(declare-fun b!1134876 () Bool)

(declare-fun res!757588 () Bool)

(assert (=> b!1134876 (=> res!757588 e!645833)))

(declare-fun noDuplicate!1607 (List!24901) Bool)

(assert (=> b!1134876 (= res!757588 (not (noDuplicate!1607 Nil!24898)))))

(declare-fun b!1134877 () Bool)

(assert (=> b!1134877 (= e!645830 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134878 () Bool)

(declare-fun res!757586 () Bool)

(assert (=> b!1134878 (=> (not res!757586) (not e!645845))))

(assert (=> b!1134878 (= res!757586 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36106 _keys!1208))))))

(declare-fun b!1134879 () Bool)

(declare-fun res!757600 () Bool)

(assert (=> b!1134879 (=> (not res!757600) (not e!645841))))

(assert (=> b!1134879 (= res!757600 (arrayNoDuplicates!0 lt!504316 #b00000000000000000000000000000000 Nil!24898))))

(declare-fun b!1134880 () Bool)

(declare-fun lt!504318 () Unit!37025)

(assert (=> b!1134880 (= e!645839 lt!504318)))

(assert (=> b!1134880 (= lt!504318 call!49462)))

(assert (=> b!1134880 call!49460))

(declare-fun b!1134881 () Bool)

(assert (=> b!1134881 (= e!645845 e!645841)))

(declare-fun res!757599 () Bool)

(assert (=> b!1134881 (=> (not res!757599) (not e!645841))))

(assert (=> b!1134881 (= res!757599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504316 mask!1564))))

(assert (=> b!1134881 (= lt!504316 (array!73835 (store (arr!35568 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36106 _keys!1208)))))

(declare-fun e!645842 () Bool)

(declare-fun b!1134882 () Bool)

(assert (=> b!1134882 (= e!645842 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134883 () Bool)

(declare-fun e!645846 () Bool)

(assert (=> b!1134883 (= e!645834 e!645846)))

(declare-fun res!757596 () Bool)

(assert (=> b!1134883 (=> res!757596 e!645846)))

(assert (=> b!1134883 (= res!757596 (not (= from!1455 i!673)))))

(declare-fun lt!504314 () ListLongMap!16123)

(assert (=> b!1134883 (= lt!504314 (getCurrentListMapNoExtraKeys!4575 lt!504316 lt!504320 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2570 (Int (_ BitVec 64)) V!43161)

(assert (=> b!1134883 (= lt!504320 (array!73837 (store (arr!35569 _values!996) i!673 (ValueCellFull!13553 (dynLambda!2570 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36107 _values!996)))))

(declare-fun lt!504323 () ListLongMap!16123)

(assert (=> b!1134883 (= lt!504323 (getCurrentListMapNoExtraKeys!4575 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1134884 () Bool)

(assert (=> b!1134884 (= e!645846 e!645835)))

(declare-fun res!757589 () Bool)

(assert (=> b!1134884 (=> res!757589 e!645835)))

(assert (=> b!1134884 (= res!757589 (not (= (select (arr!35568 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1134884 e!645838))

(declare-fun c!110841 () Bool)

(assert (=> b!1134884 (= c!110841 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504325 () Unit!37025)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!460 (array!73834 array!73836 (_ BitVec 32) (_ BitVec 32) V!43161 V!43161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37025)

(assert (=> b!1134884 (= lt!504325 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!460 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49463 () Bool)

(assert (=> bm!49463 (= call!49465 (+!3510 (ite c!110842 lt!504313 lt!504315) (ite c!110842 (tuple2!18155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110843 (tuple2!18155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1134885 () Bool)

(declare-fun res!757593 () Bool)

(assert (=> b!1134885 (=> (not res!757593) (not e!645845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134885 (= res!757593 (validMask!0 mask!1564))))

(declare-fun b!1134886 () Bool)

(assert (=> b!1134886 (= e!645837 e!645833)))

(declare-fun res!757591 () Bool)

(assert (=> b!1134886 (=> res!757591 e!645833)))

(assert (=> b!1134886 (= res!757591 (or (bvsge (size!36106 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36106 _keys!1208)) (bvsge from!1455 (size!36106 _keys!1208))))))

(assert (=> b!1134886 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24898)))

(declare-fun lt!504317 () Unit!37025)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73834 (_ BitVec 32) (_ BitVec 32)) Unit!37025)

(assert (=> b!1134886 (= lt!504317 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1134886 e!645842))

(declare-fun res!757597 () Bool)

(assert (=> b!1134886 (=> (not res!757597) (not e!645842))))

(assert (=> b!1134886 (= res!757597 e!645830)))

(declare-fun c!110839 () Bool)

(assert (=> b!1134886 (= c!110839 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504322 () Unit!37025)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!340 (array!73834 array!73836 (_ BitVec 32) (_ BitVec 32) V!43161 V!43161 (_ BitVec 64) (_ BitVec 32) Int) Unit!37025)

(assert (=> b!1134886 (= lt!504322 (lemmaListMapContainsThenArrayContainsFrom!340 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504319 () Unit!37025)

(assert (=> b!1134886 (= lt!504319 e!645843)))

(assert (=> b!1134886 (= c!110842 (and (not lt!504324) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134886 (= lt!504324 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1134887 () Bool)

(assert (=> b!1134887 (= e!645836 tp_is_empty!28525)))

(declare-fun b!1134888 () Bool)

(declare-fun res!757592 () Bool)

(assert (=> b!1134888 (=> res!757592 e!645833)))

(assert (=> b!1134888 (= res!757592 (contains!6539 Nil!24898 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!98384 res!757584) b!1134885))

(assert (= (and b!1134885 res!757593) b!1134866))

(assert (= (and b!1134866 res!757598) b!1134858))

(assert (= (and b!1134858 res!757590) b!1134865))

(assert (= (and b!1134865 res!757585) b!1134878))

(assert (= (and b!1134878 res!757586) b!1134861))

(assert (= (and b!1134861 res!757601) b!1134873))

(assert (= (and b!1134873 res!757587) b!1134881))

(assert (= (and b!1134881 res!757599) b!1134879))

(assert (= (and b!1134879 res!757600) b!1134860))

(assert (= (and b!1134860 (not res!757594)) b!1134883))

(assert (= (and b!1134883 (not res!757596)) b!1134884))

(assert (= (and b!1134884 c!110841) b!1134863))

(assert (= (and b!1134884 (not c!110841)) b!1134868))

(assert (= (or b!1134863 b!1134868) bm!49460))

(assert (= (or b!1134863 b!1134868) bm!49461))

(assert (= (and b!1134884 (not res!757589)) b!1134867))

(assert (= (and b!1134867 (not res!757595)) b!1134886))

(assert (= (and b!1134886 c!110842) b!1134874))

(assert (= (and b!1134886 (not c!110842)) b!1134862))

(assert (= (and b!1134862 c!110843) b!1134870))

(assert (= (and b!1134862 (not c!110843)) b!1134864))

(assert (= (and b!1134864 c!110840) b!1134880))

(assert (= (and b!1134864 (not c!110840)) b!1134859))

(assert (= (or b!1134870 b!1134880) bm!49462))

(assert (= (or b!1134870 b!1134880) bm!49456))

(assert (= (or b!1134870 b!1134880) bm!49459))

(assert (= (or b!1134874 bm!49459) bm!49457))

(assert (= (or b!1134874 bm!49462) bm!49458))

(assert (= (or b!1134874 bm!49456) bm!49463))

(assert (= (and b!1134886 c!110839) b!1134877))

(assert (= (and b!1134886 (not c!110839)) b!1134869))

(assert (= (and b!1134886 res!757597) b!1134882))

(assert (= (and b!1134886 (not res!757591)) b!1134876))

(assert (= (and b!1134876 (not res!757588)) b!1134888))

(assert (= (and b!1134888 (not res!757592)) b!1134871))

(assert (= (and b!1134872 condMapEmpty!44612) mapIsEmpty!44612))

(assert (= (and b!1134872 (not condMapEmpty!44612)) mapNonEmpty!44612))

(get-info :version)

(assert (= (and mapNonEmpty!44612 ((_ is ValueCellFull!13553) mapValue!44612)) b!1134887))

(assert (= (and b!1134872 ((_ is ValueCellFull!13553) mapDefault!44612)) b!1134875))

(assert (= start!98384 b!1134872))

(declare-fun b_lambda!19083 () Bool)

(assert (=> (not b_lambda!19083) (not b!1134883)))

(declare-fun t!35877 () Bool)

(declare-fun tb!8799 () Bool)

(assert (=> (and start!98384 (= defaultEntry!1004 defaultEntry!1004) t!35877) tb!8799))

(declare-fun result!18171 () Bool)

(assert (=> tb!8799 (= result!18171 tp_is_empty!28525)))

(assert (=> b!1134883 t!35877))

(declare-fun b_and!38819 () Bool)

(assert (= b_and!38817 (and (=> t!35877 result!18171) b_and!38819)))

(declare-fun m!1047055 () Bool)

(assert (=> b!1134860 m!1047055))

(declare-fun m!1047057 () Bool)

(assert (=> b!1134860 m!1047057))

(declare-fun m!1047059 () Bool)

(assert (=> b!1134886 m!1047059))

(declare-fun m!1047061 () Bool)

(assert (=> b!1134886 m!1047061))

(declare-fun m!1047063 () Bool)

(assert (=> b!1134886 m!1047063))

(declare-fun m!1047065 () Bool)

(assert (=> b!1134871 m!1047065))

(declare-fun m!1047067 () Bool)

(assert (=> b!1134881 m!1047067))

(declare-fun m!1047069 () Bool)

(assert (=> b!1134881 m!1047069))

(declare-fun m!1047071 () Bool)

(assert (=> b!1134867 m!1047071))

(declare-fun m!1047073 () Bool)

(assert (=> b!1134867 m!1047073))

(declare-fun m!1047075 () Bool)

(assert (=> b!1134883 m!1047075))

(declare-fun m!1047077 () Bool)

(assert (=> b!1134883 m!1047077))

(declare-fun m!1047079 () Bool)

(assert (=> b!1134883 m!1047079))

(declare-fun m!1047081 () Bool)

(assert (=> b!1134883 m!1047081))

(declare-fun m!1047083 () Bool)

(assert (=> b!1134877 m!1047083))

(declare-fun m!1047085 () Bool)

(assert (=> mapNonEmpty!44612 m!1047085))

(declare-fun m!1047087 () Bool)

(assert (=> bm!49457 m!1047087))

(declare-fun m!1047089 () Bool)

(assert (=> b!1134873 m!1047089))

(declare-fun m!1047091 () Bool)

(assert (=> b!1134874 m!1047091))

(declare-fun m!1047093 () Bool)

(assert (=> b!1134874 m!1047093))

(declare-fun m!1047095 () Bool)

(assert (=> b!1134874 m!1047095))

(declare-fun m!1047097 () Bool)

(assert (=> b!1134865 m!1047097))

(assert (=> b!1134882 m!1047083))

(declare-fun m!1047099 () Bool)

(assert (=> bm!49458 m!1047099))

(declare-fun m!1047101 () Bool)

(assert (=> start!98384 m!1047101))

(declare-fun m!1047103 () Bool)

(assert (=> start!98384 m!1047103))

(assert (=> bm!49461 m!1047073))

(declare-fun m!1047105 () Bool)

(assert (=> b!1134858 m!1047105))

(declare-fun m!1047107 () Bool)

(assert (=> bm!49460 m!1047107))

(declare-fun m!1047109 () Bool)

(assert (=> b!1134888 m!1047109))

(declare-fun m!1047111 () Bool)

(assert (=> b!1134861 m!1047111))

(declare-fun m!1047113 () Bool)

(assert (=> b!1134876 m!1047113))

(declare-fun m!1047115 () Bool)

(assert (=> b!1134863 m!1047115))

(declare-fun m!1047117 () Bool)

(assert (=> b!1134884 m!1047117))

(declare-fun m!1047119 () Bool)

(assert (=> b!1134884 m!1047119))

(declare-fun m!1047121 () Bool)

(assert (=> bm!49463 m!1047121))

(declare-fun m!1047123 () Bool)

(assert (=> b!1134879 m!1047123))

(declare-fun m!1047125 () Bool)

(assert (=> b!1134885 m!1047125))

(check-sat (not b_lambda!19083) (not start!98384) (not b!1134858) (not b!1134883) (not b!1134879) (not mapNonEmpty!44612) (not b!1134881) (not b!1134867) (not b_next!23995) (not b!1134882) (not b!1134871) (not b!1134861) (not bm!49457) (not b!1134860) (not b!1134863) (not bm!49460) (not b!1134865) (not b!1134885) (not bm!49458) b_and!38819 (not b!1134886) (not b!1134877) (not b!1134884) (not b!1134876) (not bm!49461) (not bm!49463) tp_is_empty!28525 (not b!1134888) (not b!1134874))
(check-sat b_and!38819 (not b_next!23995))
