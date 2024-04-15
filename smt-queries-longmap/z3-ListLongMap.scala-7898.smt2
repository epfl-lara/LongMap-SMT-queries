; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98126 () Bool)

(assert start!98126)

(declare-fun b_free!23833 () Bool)

(declare-fun b_next!23833 () Bool)

(assert (=> start!98126 (= b_free!23833 (not b_next!23833))))

(declare-fun tp!84202 () Bool)

(declare-fun b_and!38427 () Bool)

(assert (=> start!98126 (= tp!84202 b_and!38427)))

(declare-fun res!753693 () Bool)

(declare-fun e!641878 () Bool)

(assert (=> start!98126 (=> (not res!753693) (not e!641878))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73512 0))(
  ( (array!73513 (arr!35409 (Array (_ BitVec 32) (_ BitVec 64))) (size!35947 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73512)

(assert (=> start!98126 (= res!753693 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35947 _keys!1208))))))

(assert (=> start!98126 e!641878))

(declare-fun tp_is_empty!28363 () Bool)

(assert (=> start!98126 tp_is_empty!28363))

(declare-fun array_inv!27250 (array!73512) Bool)

(assert (=> start!98126 (array_inv!27250 _keys!1208)))

(assert (=> start!98126 true))

(assert (=> start!98126 tp!84202))

(declare-datatypes ((V!42945 0))(
  ( (V!42946 (val!14238 Int)) )
))
(declare-datatypes ((ValueCell!13472 0))(
  ( (ValueCellFull!13472 (v!16870 V!42945)) (EmptyCell!13472) )
))
(declare-datatypes ((array!73514 0))(
  ( (array!73515 (arr!35410 (Array (_ BitVec 32) ValueCell!13472)) (size!35948 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73514)

(declare-fun e!641885 () Bool)

(declare-fun array_inv!27251 (array!73514) Bool)

(assert (=> start!98126 (and (array_inv!27251 _values!996) e!641885)))

(declare-fun b!1127794 () Bool)

(declare-fun e!641883 () Bool)

(declare-fun e!641882 () Bool)

(assert (=> b!1127794 (= e!641883 (not e!641882))))

(declare-fun res!753685 () Bool)

(assert (=> b!1127794 (=> res!753685 e!641882)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127794 (= res!753685 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127794 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36805 0))(
  ( (Unit!36806) )
))
(declare-fun lt!500569 () Unit!36805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73512 (_ BitVec 64) (_ BitVec 32)) Unit!36805)

(assert (=> b!1127794 (= lt!500569 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!42945)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18010 0))(
  ( (tuple2!18011 (_1!9016 (_ BitVec 64)) (_2!9016 V!42945)) )
))
(declare-datatypes ((List!24764 0))(
  ( (Nil!24761) (Cons!24760 (h!25969 tuple2!18010) (t!35580 List!24764)) )
))
(declare-datatypes ((ListLongMap!15979 0))(
  ( (ListLongMap!15980 (toList!8005 List!24764)) )
))
(declare-fun call!47758 () ListLongMap!15979)

(declare-fun bm!47755 () Bool)

(declare-fun minValue!944 () V!42945)

(declare-fun getCurrentListMapNoExtraKeys!4505 (array!73512 array!73514 (_ BitVec 32) (_ BitVec 32) V!42945 V!42945 (_ BitVec 32) Int) ListLongMap!15979)

(assert (=> bm!47755 (= call!47758 (getCurrentListMapNoExtraKeys!4505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127795 () Bool)

(declare-fun res!753690 () Bool)

(assert (=> b!1127795 (=> (not res!753690) (not e!641878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73512 (_ BitVec 32)) Bool)

(assert (=> b!1127795 (= res!753690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!47759 () ListLongMap!15979)

(declare-fun lt!500572 () array!73514)

(declare-fun bm!47756 () Bool)

(declare-fun lt!500571 () array!73512)

(assert (=> bm!47756 (= call!47759 (getCurrentListMapNoExtraKeys!4505 lt!500571 lt!500572 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127796 () Bool)

(declare-fun e!641880 () Bool)

(assert (=> b!1127796 (= e!641880 true)))

(declare-fun lt!500573 () Bool)

(declare-fun contains!6461 (ListLongMap!15979 (_ BitVec 64)) Bool)

(assert (=> b!1127796 (= lt!500573 (contains!6461 (getCurrentListMapNoExtraKeys!4505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127797 () Bool)

(declare-fun e!641877 () Bool)

(assert (=> b!1127797 (= e!641877 tp_is_empty!28363)))

(declare-fun e!641884 () Bool)

(declare-fun b!1127798 () Bool)

(declare-fun -!1126 (ListLongMap!15979 (_ BitVec 64)) ListLongMap!15979)

(assert (=> b!1127798 (= e!641884 (= call!47759 (-!1126 call!47758 k0!934)))))

(declare-fun b!1127799 () Bool)

(declare-fun res!753689 () Bool)

(assert (=> b!1127799 (=> (not res!753689) (not e!641878))))

(assert (=> b!1127799 (= res!753689 (and (= (size!35948 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35947 _keys!1208) (size!35948 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127800 () Bool)

(declare-fun e!641879 () Bool)

(declare-fun mapRes!44362 () Bool)

(assert (=> b!1127800 (= e!641885 (and e!641879 mapRes!44362))))

(declare-fun condMapEmpty!44362 () Bool)

(declare-fun mapDefault!44362 () ValueCell!13472)

(assert (=> b!1127800 (= condMapEmpty!44362 (= (arr!35410 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13472)) mapDefault!44362)))))

(declare-fun b!1127801 () Bool)

(declare-fun res!753695 () Bool)

(assert (=> b!1127801 (=> (not res!753695) (not e!641883))))

(declare-datatypes ((List!24765 0))(
  ( (Nil!24762) (Cons!24761 (h!25970 (_ BitVec 64)) (t!35581 List!24765)) )
))
(declare-fun arrayNoDuplicates!0 (array!73512 (_ BitVec 32) List!24765) Bool)

(assert (=> b!1127801 (= res!753695 (arrayNoDuplicates!0 lt!500571 #b00000000000000000000000000000000 Nil!24762))))

(declare-fun b!1127802 () Bool)

(declare-fun res!753694 () Bool)

(assert (=> b!1127802 (=> (not res!753694) (not e!641878))))

(assert (=> b!1127802 (= res!753694 (= (select (arr!35409 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!44362 () Bool)

(declare-fun tp!84203 () Bool)

(assert (=> mapNonEmpty!44362 (= mapRes!44362 (and tp!84203 e!641877))))

(declare-fun mapKey!44362 () (_ BitVec 32))

(declare-fun mapRest!44362 () (Array (_ BitVec 32) ValueCell!13472))

(declare-fun mapValue!44362 () ValueCell!13472)

(assert (=> mapNonEmpty!44362 (= (arr!35410 _values!996) (store mapRest!44362 mapKey!44362 mapValue!44362))))

(declare-fun b!1127803 () Bool)

(declare-fun res!753687 () Bool)

(assert (=> b!1127803 (=> (not res!753687) (not e!641878))))

(assert (=> b!1127803 (= res!753687 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35947 _keys!1208))))))

(declare-fun b!1127804 () Bool)

(declare-fun res!753691 () Bool)

(assert (=> b!1127804 (=> (not res!753691) (not e!641878))))

(assert (=> b!1127804 (= res!753691 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24762))))

(declare-fun b!1127805 () Bool)

(assert (=> b!1127805 (= e!641879 tp_is_empty!28363)))

(declare-fun mapIsEmpty!44362 () Bool)

(assert (=> mapIsEmpty!44362 mapRes!44362))

(declare-fun b!1127806 () Bool)

(declare-fun res!753692 () Bool)

(assert (=> b!1127806 (=> (not res!753692) (not e!641878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127806 (= res!753692 (validKeyInArray!0 k0!934))))

(declare-fun b!1127807 () Bool)

(declare-fun e!641881 () Bool)

(assert (=> b!1127807 (= e!641882 e!641881)))

(declare-fun res!753697 () Bool)

(assert (=> b!1127807 (=> res!753697 e!641881)))

(assert (=> b!1127807 (= res!753697 (not (= from!1455 i!673)))))

(declare-fun lt!500568 () ListLongMap!15979)

(assert (=> b!1127807 (= lt!500568 (getCurrentListMapNoExtraKeys!4505 lt!500571 lt!500572 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2516 (Int (_ BitVec 64)) V!42945)

(assert (=> b!1127807 (= lt!500572 (array!73515 (store (arr!35410 _values!996) i!673 (ValueCellFull!13472 (dynLambda!2516 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35948 _values!996)))))

(declare-fun lt!500574 () ListLongMap!15979)

(assert (=> b!1127807 (= lt!500574 (getCurrentListMapNoExtraKeys!4505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127808 () Bool)

(assert (=> b!1127808 (= e!641878 e!641883)))

(declare-fun res!753696 () Bool)

(assert (=> b!1127808 (=> (not res!753696) (not e!641883))))

(assert (=> b!1127808 (= res!753696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500571 mask!1564))))

(assert (=> b!1127808 (= lt!500571 (array!73513 (store (arr!35409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35947 _keys!1208)))))

(declare-fun b!1127809 () Bool)

(assert (=> b!1127809 (= e!641884 (= call!47759 call!47758))))

(declare-fun b!1127810 () Bool)

(declare-fun res!753686 () Bool)

(assert (=> b!1127810 (=> (not res!753686) (not e!641878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127810 (= res!753686 (validMask!0 mask!1564))))

(declare-fun b!1127811 () Bool)

(assert (=> b!1127811 (= e!641881 e!641880)))

(declare-fun res!753688 () Bool)

(assert (=> b!1127811 (=> res!753688 e!641880)))

(assert (=> b!1127811 (= res!753688 (not (= (select (arr!35409 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127811 e!641884))

(declare-fun c!109713 () Bool)

(assert (=> b!1127811 (= c!109713 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500570 () Unit!36805)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!406 (array!73512 array!73514 (_ BitVec 32) (_ BitVec 32) V!42945 V!42945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36805)

(assert (=> b!1127811 (= lt!500570 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98126 res!753693) b!1127810))

(assert (= (and b!1127810 res!753686) b!1127799))

(assert (= (and b!1127799 res!753689) b!1127795))

(assert (= (and b!1127795 res!753690) b!1127804))

(assert (= (and b!1127804 res!753691) b!1127803))

(assert (= (and b!1127803 res!753687) b!1127806))

(assert (= (and b!1127806 res!753692) b!1127802))

(assert (= (and b!1127802 res!753694) b!1127808))

(assert (= (and b!1127808 res!753696) b!1127801))

(assert (= (and b!1127801 res!753695) b!1127794))

(assert (= (and b!1127794 (not res!753685)) b!1127807))

(assert (= (and b!1127807 (not res!753697)) b!1127811))

(assert (= (and b!1127811 c!109713) b!1127798))

(assert (= (and b!1127811 (not c!109713)) b!1127809))

(assert (= (or b!1127798 b!1127809) bm!47756))

(assert (= (or b!1127798 b!1127809) bm!47755))

(assert (= (and b!1127811 (not res!753688)) b!1127796))

(assert (= (and b!1127800 condMapEmpty!44362) mapIsEmpty!44362))

(assert (= (and b!1127800 (not condMapEmpty!44362)) mapNonEmpty!44362))

(get-info :version)

(assert (= (and mapNonEmpty!44362 ((_ is ValueCellFull!13472) mapValue!44362)) b!1127797))

(assert (= (and b!1127800 ((_ is ValueCellFull!13472) mapDefault!44362)) b!1127805))

(assert (= start!98126 b!1127800))

(declare-fun b_lambda!18785 () Bool)

(assert (=> (not b_lambda!18785) (not b!1127807)))

(declare-fun t!35579 () Bool)

(declare-fun tb!8637 () Bool)

(assert (=> (and start!98126 (= defaultEntry!1004 defaultEntry!1004) t!35579) tb!8637))

(declare-fun result!17843 () Bool)

(assert (=> tb!8637 (= result!17843 tp_is_empty!28363)))

(assert (=> b!1127807 t!35579))

(declare-fun b_and!38429 () Bool)

(assert (= b_and!38427 (and (=> t!35579 result!17843) b_and!38429)))

(declare-fun m!1040985 () Bool)

(assert (=> b!1127804 m!1040985))

(declare-fun m!1040987 () Bool)

(assert (=> b!1127801 m!1040987))

(declare-fun m!1040989 () Bool)

(assert (=> bm!47756 m!1040989))

(declare-fun m!1040991 () Bool)

(assert (=> b!1127806 m!1040991))

(declare-fun m!1040993 () Bool)

(assert (=> b!1127795 m!1040993))

(declare-fun m!1040995 () Bool)

(assert (=> b!1127802 m!1040995))

(declare-fun m!1040997 () Bool)

(assert (=> b!1127807 m!1040997))

(declare-fun m!1040999 () Bool)

(assert (=> b!1127807 m!1040999))

(declare-fun m!1041001 () Bool)

(assert (=> b!1127807 m!1041001))

(declare-fun m!1041003 () Bool)

(assert (=> b!1127807 m!1041003))

(declare-fun m!1041005 () Bool)

(assert (=> b!1127808 m!1041005))

(declare-fun m!1041007 () Bool)

(assert (=> b!1127808 m!1041007))

(declare-fun m!1041009 () Bool)

(assert (=> b!1127798 m!1041009))

(declare-fun m!1041011 () Bool)

(assert (=> mapNonEmpty!44362 m!1041011))

(declare-fun m!1041013 () Bool)

(assert (=> b!1127796 m!1041013))

(assert (=> b!1127796 m!1041013))

(declare-fun m!1041015 () Bool)

(assert (=> b!1127796 m!1041015))

(declare-fun m!1041017 () Bool)

(assert (=> b!1127794 m!1041017))

(declare-fun m!1041019 () Bool)

(assert (=> b!1127794 m!1041019))

(assert (=> bm!47755 m!1041013))

(declare-fun m!1041021 () Bool)

(assert (=> b!1127811 m!1041021))

(declare-fun m!1041023 () Bool)

(assert (=> b!1127811 m!1041023))

(declare-fun m!1041025 () Bool)

(assert (=> b!1127810 m!1041025))

(declare-fun m!1041027 () Bool)

(assert (=> start!98126 m!1041027))

(declare-fun m!1041029 () Bool)

(assert (=> start!98126 m!1041029))

(check-sat (not start!98126) (not b!1127795) (not b!1127804) (not b!1127811) (not b!1127807) (not b!1127801) (not b!1127798) (not b_next!23833) tp_is_empty!28363 (not bm!47755) (not b_lambda!18785) (not b!1127810) (not bm!47756) b_and!38429 (not b!1127794) (not b!1127796) (not b!1127806) (not mapNonEmpty!44362) (not b!1127808))
(check-sat b_and!38429 (not b_next!23833))
