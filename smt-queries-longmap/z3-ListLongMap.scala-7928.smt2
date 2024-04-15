; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98402 () Bool)

(assert start!98402)

(declare-fun b_free!24013 () Bool)

(declare-fun b_next!24013 () Bool)

(assert (=> start!98402 (= b_free!24013 (not b_next!24013))))

(declare-fun tp!84750 () Bool)

(declare-fun b_and!38853 () Bool)

(assert (=> start!98402 (= tp!84750 b_and!38853)))

(declare-datatypes ((V!43185 0))(
  ( (V!43186 (val!14328 Int)) )
))
(declare-fun zeroValue!944 () V!43185)

(declare-fun c!110975 () Bool)

(declare-datatypes ((tuple2!18172 0))(
  ( (tuple2!18173 (_1!9097 (_ BitVec 64)) (_2!9097 V!43185)) )
))
(declare-datatypes ((List!24918 0))(
  ( (Nil!24915) (Cons!24914 (h!26123 tuple2!18172) (t!35914 List!24918)) )
))
(declare-datatypes ((ListLongMap!16141 0))(
  ( (ListLongMap!16142 (toList!8086 List!24918)) )
))
(declare-fun call!49677 () ListLongMap!16141)

(declare-fun bm!49672 () Bool)

(declare-fun c!110977 () Bool)

(declare-fun minValue!944 () V!43185)

(declare-fun lt!504782 () ListLongMap!16141)

(declare-fun +!3518 (ListLongMap!16141 tuple2!18172) ListLongMap!16141)

(assert (=> bm!49672 (= call!49677 (+!3518 lt!504782 (ite (or c!110975 c!110977) (tuple2!18173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-datatypes ((array!73870 0))(
  ( (array!73871 (arr!35586 (Array (_ BitVec 32) (_ BitVec 64))) (size!36124 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73870)

(declare-fun b!1135713 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!646292 () Bool)

(declare-fun arrayContainsKey!0 (array!73870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135713 (= e!646292 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135714 () Bool)

(declare-fun res!758080 () Bool)

(declare-fun e!646289 () Bool)

(assert (=> b!1135714 (=> (not res!758080) (not e!646289))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135714 (= res!758080 (= (select (arr!35586 _keys!1208) i!673) k0!934))))

(declare-datatypes ((Unit!37050 0))(
  ( (Unit!37051) )
))
(declare-fun call!49675 () Unit!37050)

(declare-fun bm!49673 () Bool)

(declare-fun lt!504786 () ListLongMap!16141)

(declare-fun addStillContains!735 (ListLongMap!16141 (_ BitVec 64) V!43185 (_ BitVec 64)) Unit!37050)

(assert (=> bm!49673 (= call!49675 (addStillContains!735 (ite c!110975 lt!504786 lt!504782) (ite c!110975 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110977 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110975 minValue!944 (ite c!110977 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!49674 () Bool)

(declare-fun call!49679 () Unit!37050)

(assert (=> bm!49674 (= call!49679 call!49675)))

(declare-fun b!1135715 () Bool)

(declare-fun e!646290 () Bool)

(declare-fun e!646301 () Bool)

(declare-fun mapRes!44639 () Bool)

(assert (=> b!1135715 (= e!646290 (and e!646301 mapRes!44639))))

(declare-fun condMapEmpty!44639 () Bool)

(declare-datatypes ((ValueCell!13562 0))(
  ( (ValueCellFull!13562 (v!16964 V!43185)) (EmptyCell!13562) )
))
(declare-datatypes ((array!73872 0))(
  ( (array!73873 (arr!35587 (Array (_ BitVec 32) ValueCell!13562)) (size!36125 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73872)

(declare-fun mapDefault!44639 () ValueCell!13562)

(assert (=> b!1135715 (= condMapEmpty!44639 (= (arr!35587 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13562)) mapDefault!44639)))))

(declare-fun b!1135716 () Bool)

(declare-fun e!646304 () Unit!37050)

(declare-fun Unit!37052 () Unit!37050)

(assert (=> b!1135716 (= e!646304 Unit!37052)))

(declare-fun b!1135717 () Bool)

(declare-fun e!646294 () Unit!37050)

(declare-fun e!646296 () Unit!37050)

(assert (=> b!1135717 (= e!646294 e!646296)))

(declare-fun lt!504774 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1135717 (= c!110977 (and (not lt!504774) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1135718 () Bool)

(declare-fun e!646297 () Bool)

(assert (=> b!1135718 (= e!646297 true)))

(declare-fun lt!504778 () Bool)

(declare-datatypes ((List!24919 0))(
  ( (Nil!24916) (Cons!24915 (h!26124 (_ BitVec 64)) (t!35915 List!24919)) )
))
(declare-fun contains!6555 (List!24919 (_ BitVec 64)) Bool)

(assert (=> b!1135718 (= lt!504778 (contains!6555 Nil!24916 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!758070 () Bool)

(assert (=> start!98402 (=> (not res!758070) (not e!646289))))

(assert (=> start!98402 (= res!758070 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36124 _keys!1208))))))

(assert (=> start!98402 e!646289))

(declare-fun tp_is_empty!28543 () Bool)

(assert (=> start!98402 tp_is_empty!28543))

(declare-fun array_inv!27362 (array!73870) Bool)

(assert (=> start!98402 (array_inv!27362 _keys!1208)))

(assert (=> start!98402 true))

(assert (=> start!98402 tp!84750))

(declare-fun array_inv!27363 (array!73872) Bool)

(assert (=> start!98402 (and (array_inv!27363 _values!996) e!646290)))

(declare-fun b!1135719 () Bool)

(declare-fun call!49681 () Bool)

(assert (=> b!1135719 call!49681))

(declare-fun lt!504776 () Unit!37050)

(assert (=> b!1135719 (= lt!504776 call!49679)))

(assert (=> b!1135719 (= e!646296 lt!504776)))

(declare-fun mapNonEmpty!44639 () Bool)

(declare-fun tp!84749 () Bool)

(declare-fun e!646300 () Bool)

(assert (=> mapNonEmpty!44639 (= mapRes!44639 (and tp!84749 e!646300))))

(declare-fun mapValue!44639 () ValueCell!13562)

(declare-fun mapRest!44639 () (Array (_ BitVec 32) ValueCell!13562))

(declare-fun mapKey!44639 () (_ BitVec 32))

(assert (=> mapNonEmpty!44639 (= (arr!35587 _values!996) (store mapRest!44639 mapKey!44639 mapValue!44639))))

(declare-fun b!1135720 () Bool)

(declare-fun lt!504772 () Unit!37050)

(assert (=> b!1135720 (= e!646294 lt!504772)))

(declare-fun lt!504779 () Unit!37050)

(assert (=> b!1135720 (= lt!504779 (addStillContains!735 lt!504782 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1135720 (= lt!504786 call!49677)))

(declare-fun call!49680 () Bool)

(assert (=> b!1135720 call!49680))

(assert (=> b!1135720 (= lt!504772 call!49675)))

(declare-fun contains!6556 (ListLongMap!16141 (_ BitVec 64)) Bool)

(assert (=> b!1135720 (contains!6556 (+!3518 lt!504786 (tuple2!18173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1135721 () Bool)

(declare-fun e!646291 () Bool)

(assert (=> b!1135721 (= e!646291 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135722 () Bool)

(declare-fun res!758082 () Bool)

(assert (=> b!1135722 (=> res!758082 e!646297)))

(declare-fun noDuplicate!1614 (List!24919) Bool)

(assert (=> b!1135722 (= res!758082 (not (noDuplicate!1614 Nil!24916)))))

(declare-fun b!1135723 () Bool)

(declare-fun e!646305 () Bool)

(assert (=> b!1135723 (= e!646305 e!646297)))

(declare-fun res!758076 () Bool)

(assert (=> b!1135723 (=> res!758076 e!646297)))

(assert (=> b!1135723 (= res!758076 (or (bvsge (size!36124 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36124 _keys!1208)) (bvsge from!1455 (size!36124 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!73870 (_ BitVec 32) List!24919) Bool)

(assert (=> b!1135723 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24916)))

(declare-fun lt!504775 () Unit!37050)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73870 (_ BitVec 32) (_ BitVec 32)) Unit!37050)

(assert (=> b!1135723 (= lt!504775 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1135723 e!646292))

(declare-fun res!758083 () Bool)

(assert (=> b!1135723 (=> (not res!758083) (not e!646292))))

(assert (=> b!1135723 (= res!758083 e!646291)))

(declare-fun c!110978 () Bool)

(assert (=> b!1135723 (= c!110978 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504773 () Unit!37050)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!348 (array!73870 array!73872 (_ BitVec 32) (_ BitVec 32) V!43185 V!43185 (_ BitVec 64) (_ BitVec 32) Int) Unit!37050)

(assert (=> b!1135723 (= lt!504773 (lemmaListMapContainsThenArrayContainsFrom!348 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504770 () Unit!37050)

(assert (=> b!1135723 (= lt!504770 e!646294)))

(assert (=> b!1135723 (= c!110975 (and (not lt!504774) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135723 (= lt!504774 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!49675 () Bool)

(declare-fun call!49678 () ListLongMap!16141)

(assert (=> bm!49675 (= call!49678 call!49677)))

(declare-fun mapIsEmpty!44639 () Bool)

(assert (=> mapIsEmpty!44639 mapRes!44639))

(declare-fun b!1135724 () Bool)

(declare-fun e!646303 () Bool)

(declare-fun call!49676 () ListLongMap!16141)

(declare-fun call!49682 () ListLongMap!16141)

(assert (=> b!1135724 (= e!646303 (= call!49676 call!49682))))

(declare-fun b!1135725 () Bool)

(declare-fun e!646299 () Bool)

(declare-fun e!646302 () Bool)

(assert (=> b!1135725 (= e!646299 e!646302)))

(declare-fun res!758085 () Bool)

(assert (=> b!1135725 (=> res!758085 e!646302)))

(assert (=> b!1135725 (= res!758085 (not (= (select (arr!35586 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1135725 e!646303))

(declare-fun c!110976 () Bool)

(assert (=> b!1135725 (= c!110976 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504780 () Unit!37050)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!468 (array!73870 array!73872 (_ BitVec 32) (_ BitVec 32) V!43185 V!43185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37050)

(assert (=> b!1135725 (= lt!504780 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49676 () Bool)

(assert (=> bm!49676 (= call!49680 (contains!6556 (ite c!110975 lt!504786 call!49678) k0!934))))

(declare-fun b!1135726 () Bool)

(declare-fun res!758079 () Bool)

(declare-fun e!646295 () Bool)

(assert (=> b!1135726 (=> (not res!758079) (not e!646295))))

(declare-fun lt!504777 () array!73870)

(assert (=> b!1135726 (= res!758079 (arrayNoDuplicates!0 lt!504777 #b00000000000000000000000000000000 Nil!24916))))

(declare-fun b!1135727 () Bool)

(assert (=> b!1135727 (= e!646301 tp_is_empty!28543)))

(declare-fun b!1135728 () Bool)

(declare-fun c!110974 () Bool)

(assert (=> b!1135728 (= c!110974 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504774))))

(assert (=> b!1135728 (= e!646296 e!646304)))

(declare-fun b!1135729 () Bool)

(assert (=> b!1135729 (= e!646289 e!646295)))

(declare-fun res!758073 () Bool)

(assert (=> b!1135729 (=> (not res!758073) (not e!646295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73870 (_ BitVec 32)) Bool)

(assert (=> b!1135729 (= res!758073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504777 mask!1564))))

(assert (=> b!1135729 (= lt!504777 (array!73871 (store (arr!35586 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36124 _keys!1208)))))

(declare-fun bm!49677 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4584 (array!73870 array!73872 (_ BitVec 32) (_ BitVec 32) V!43185 V!43185 (_ BitVec 32) Int) ListLongMap!16141)

(assert (=> bm!49677 (= call!49682 (getCurrentListMapNoExtraKeys!4584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135730 () Bool)

(declare-fun e!646293 () Bool)

(assert (=> b!1135730 (= e!646293 e!646299)))

(declare-fun res!758081 () Bool)

(assert (=> b!1135730 (=> res!758081 e!646299)))

(assert (=> b!1135730 (= res!758081 (not (= from!1455 i!673)))))

(declare-fun lt!504783 () array!73872)

(declare-fun lt!504785 () ListLongMap!16141)

(assert (=> b!1135730 (= lt!504785 (getCurrentListMapNoExtraKeys!4584 lt!504777 lt!504783 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2578 (Int (_ BitVec 64)) V!43185)

(assert (=> b!1135730 (= lt!504783 (array!73873 (store (arr!35587 _values!996) i!673 (ValueCellFull!13562 (dynLambda!2578 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36125 _values!996)))))

(declare-fun lt!504781 () ListLongMap!16141)

(assert (=> b!1135730 (= lt!504781 (getCurrentListMapNoExtraKeys!4584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1135731 () Bool)

(declare-fun res!758077 () Bool)

(assert (=> b!1135731 (=> (not res!758077) (not e!646289))))

(assert (=> b!1135731 (= res!758077 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24916))))

(declare-fun bm!49678 () Bool)

(assert (=> bm!49678 (= call!49681 call!49680)))

(declare-fun b!1135732 () Bool)

(declare-fun res!758086 () Bool)

(assert (=> b!1135732 (=> (not res!758086) (not e!646289))))

(assert (=> b!1135732 (= res!758086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1135733 () Bool)

(assert (=> b!1135733 (= e!646300 tp_is_empty!28543)))

(declare-fun b!1135734 () Bool)

(declare-fun res!758087 () Bool)

(assert (=> b!1135734 (=> (not res!758087) (not e!646289))))

(assert (=> b!1135734 (= res!758087 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36124 _keys!1208))))))

(declare-fun b!1135735 () Bool)

(declare-fun res!758071 () Bool)

(assert (=> b!1135735 (=> (not res!758071) (not e!646289))))

(assert (=> b!1135735 (= res!758071 (and (= (size!36125 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36124 _keys!1208) (size!36125 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1135736 () Bool)

(assert (=> b!1135736 (= e!646295 (not e!646293))))

(declare-fun res!758075 () Bool)

(assert (=> b!1135736 (=> res!758075 e!646293)))

(assert (=> b!1135736 (= res!758075 (bvsgt from!1455 i!673))))

(assert (=> b!1135736 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504784 () Unit!37050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73870 (_ BitVec 64) (_ BitVec 32)) Unit!37050)

(assert (=> b!1135736 (= lt!504784 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1135737 () Bool)

(declare-fun res!758078 () Bool)

(assert (=> b!1135737 (=> res!758078 e!646297)))

(assert (=> b!1135737 (= res!758078 (contains!6555 Nil!24916 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135738 () Bool)

(declare-fun -!1183 (ListLongMap!16141 (_ BitVec 64)) ListLongMap!16141)

(assert (=> b!1135738 (= e!646303 (= call!49676 (-!1183 call!49682 k0!934)))))

(declare-fun b!1135739 () Bool)

(assert (=> b!1135739 (= e!646302 e!646305)))

(declare-fun res!758084 () Bool)

(assert (=> b!1135739 (=> res!758084 e!646305)))

(assert (=> b!1135739 (= res!758084 (not (contains!6556 lt!504782 k0!934)))))

(assert (=> b!1135739 (= lt!504782 (getCurrentListMapNoExtraKeys!4584 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135740 () Bool)

(assert (=> b!1135740 (= e!646291 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504774) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49679 () Bool)

(assert (=> bm!49679 (= call!49676 (getCurrentListMapNoExtraKeys!4584 lt!504777 lt!504783 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135741 () Bool)

(declare-fun res!758072 () Bool)

(assert (=> b!1135741 (=> (not res!758072) (not e!646289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135741 (= res!758072 (validKeyInArray!0 k0!934))))

(declare-fun b!1135742 () Bool)

(declare-fun lt!504771 () Unit!37050)

(assert (=> b!1135742 (= e!646304 lt!504771)))

(assert (=> b!1135742 (= lt!504771 call!49679)))

(assert (=> b!1135742 call!49681))

(declare-fun b!1135743 () Bool)

(declare-fun res!758074 () Bool)

(assert (=> b!1135743 (=> (not res!758074) (not e!646289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135743 (= res!758074 (validMask!0 mask!1564))))

(assert (= (and start!98402 res!758070) b!1135743))

(assert (= (and b!1135743 res!758074) b!1135735))

(assert (= (and b!1135735 res!758071) b!1135732))

(assert (= (and b!1135732 res!758086) b!1135731))

(assert (= (and b!1135731 res!758077) b!1135734))

(assert (= (and b!1135734 res!758087) b!1135741))

(assert (= (and b!1135741 res!758072) b!1135714))

(assert (= (and b!1135714 res!758080) b!1135729))

(assert (= (and b!1135729 res!758073) b!1135726))

(assert (= (and b!1135726 res!758079) b!1135736))

(assert (= (and b!1135736 (not res!758075)) b!1135730))

(assert (= (and b!1135730 (not res!758081)) b!1135725))

(assert (= (and b!1135725 c!110976) b!1135738))

(assert (= (and b!1135725 (not c!110976)) b!1135724))

(assert (= (or b!1135738 b!1135724) bm!49679))

(assert (= (or b!1135738 b!1135724) bm!49677))

(assert (= (and b!1135725 (not res!758085)) b!1135739))

(assert (= (and b!1135739 (not res!758084)) b!1135723))

(assert (= (and b!1135723 c!110975) b!1135720))

(assert (= (and b!1135723 (not c!110975)) b!1135717))

(assert (= (and b!1135717 c!110977) b!1135719))

(assert (= (and b!1135717 (not c!110977)) b!1135728))

(assert (= (and b!1135728 c!110974) b!1135742))

(assert (= (and b!1135728 (not c!110974)) b!1135716))

(assert (= (or b!1135719 b!1135742) bm!49674))

(assert (= (or b!1135719 b!1135742) bm!49675))

(assert (= (or b!1135719 b!1135742) bm!49678))

(assert (= (or b!1135720 bm!49678) bm!49676))

(assert (= (or b!1135720 bm!49674) bm!49673))

(assert (= (or b!1135720 bm!49675) bm!49672))

(assert (= (and b!1135723 c!110978) b!1135721))

(assert (= (and b!1135723 (not c!110978)) b!1135740))

(assert (= (and b!1135723 res!758083) b!1135713))

(assert (= (and b!1135723 (not res!758076)) b!1135722))

(assert (= (and b!1135722 (not res!758082)) b!1135737))

(assert (= (and b!1135737 (not res!758078)) b!1135718))

(assert (= (and b!1135715 condMapEmpty!44639) mapIsEmpty!44639))

(assert (= (and b!1135715 (not condMapEmpty!44639)) mapNonEmpty!44639))

(get-info :version)

(assert (= (and mapNonEmpty!44639 ((_ is ValueCellFull!13562) mapValue!44639)) b!1135733))

(assert (= (and b!1135715 ((_ is ValueCellFull!13562) mapDefault!44639)) b!1135727))

(assert (= start!98402 b!1135715))

(declare-fun b_lambda!19101 () Bool)

(assert (=> (not b_lambda!19101) (not b!1135730)))

(declare-fun t!35913 () Bool)

(declare-fun tb!8817 () Bool)

(assert (=> (and start!98402 (= defaultEntry!1004 defaultEntry!1004) t!35913) tb!8817))

(declare-fun result!18207 () Bool)

(assert (=> tb!8817 (= result!18207 tp_is_empty!28543)))

(assert (=> b!1135730 t!35913))

(declare-fun b_and!38855 () Bool)

(assert (= b_and!38853 (and (=> t!35913 result!18207) b_and!38855)))

(declare-fun m!1047705 () Bool)

(assert (=> bm!49672 m!1047705))

(declare-fun m!1047707 () Bool)

(assert (=> b!1135723 m!1047707))

(declare-fun m!1047709 () Bool)

(assert (=> b!1135723 m!1047709))

(declare-fun m!1047711 () Bool)

(assert (=> b!1135723 m!1047711))

(declare-fun m!1047713 () Bool)

(assert (=> bm!49673 m!1047713))

(declare-fun m!1047715 () Bool)

(assert (=> b!1135725 m!1047715))

(declare-fun m!1047717 () Bool)

(assert (=> b!1135725 m!1047717))

(declare-fun m!1047719 () Bool)

(assert (=> b!1135714 m!1047719))

(declare-fun m!1047721 () Bool)

(assert (=> b!1135739 m!1047721))

(declare-fun m!1047723 () Bool)

(assert (=> b!1135739 m!1047723))

(declare-fun m!1047725 () Bool)

(assert (=> b!1135726 m!1047725))

(declare-fun m!1047727 () Bool)

(assert (=> b!1135720 m!1047727))

(declare-fun m!1047729 () Bool)

(assert (=> b!1135720 m!1047729))

(assert (=> b!1135720 m!1047729))

(declare-fun m!1047731 () Bool)

(assert (=> b!1135720 m!1047731))

(declare-fun m!1047733 () Bool)

(assert (=> b!1135730 m!1047733))

(declare-fun m!1047735 () Bool)

(assert (=> b!1135730 m!1047735))

(declare-fun m!1047737 () Bool)

(assert (=> b!1135730 m!1047737))

(declare-fun m!1047739 () Bool)

(assert (=> b!1135730 m!1047739))

(declare-fun m!1047741 () Bool)

(assert (=> bm!49676 m!1047741))

(declare-fun m!1047743 () Bool)

(assert (=> b!1135738 m!1047743))

(declare-fun m!1047745 () Bool)

(assert (=> b!1135729 m!1047745))

(declare-fun m!1047747 () Bool)

(assert (=> b!1135729 m!1047747))

(declare-fun m!1047749 () Bool)

(assert (=> b!1135732 m!1047749))

(declare-fun m!1047751 () Bool)

(assert (=> mapNonEmpty!44639 m!1047751))

(declare-fun m!1047753 () Bool)

(assert (=> bm!49679 m!1047753))

(declare-fun m!1047755 () Bool)

(assert (=> start!98402 m!1047755))

(declare-fun m!1047757 () Bool)

(assert (=> start!98402 m!1047757))

(declare-fun m!1047759 () Bool)

(assert (=> b!1135721 m!1047759))

(assert (=> bm!49677 m!1047723))

(declare-fun m!1047761 () Bool)

(assert (=> b!1135743 m!1047761))

(assert (=> b!1135713 m!1047759))

(declare-fun m!1047763 () Bool)

(assert (=> b!1135722 m!1047763))

(declare-fun m!1047765 () Bool)

(assert (=> b!1135741 m!1047765))

(declare-fun m!1047767 () Bool)

(assert (=> b!1135731 m!1047767))

(declare-fun m!1047769 () Bool)

(assert (=> b!1135737 m!1047769))

(declare-fun m!1047771 () Bool)

(assert (=> b!1135718 m!1047771))

(declare-fun m!1047773 () Bool)

(assert (=> b!1135736 m!1047773))

(declare-fun m!1047775 () Bool)

(assert (=> b!1135736 m!1047775))

(check-sat (not b!1135737) (not b!1135713) (not bm!49677) b_and!38855 (not b!1135720) (not b!1135725) (not b_lambda!19101) (not b_next!24013) (not bm!49679) (not b!1135722) (not b!1135730) (not bm!49676) (not b!1135731) (not b!1135736) (not b!1135729) (not b!1135718) (not mapNonEmpty!44639) (not b!1135738) (not bm!49672) (not b!1135743) (not b!1135721) (not b!1135732) (not b!1135741) tp_is_empty!28543 (not start!98402) (not b!1135739) (not b!1135723) (not b!1135726) (not bm!49673))
(check-sat b_and!38855 (not b_next!24013))
