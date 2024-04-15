; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99556 () Bool)

(assert start!99556)

(declare-fun b_free!25141 () Bool)

(declare-fun b_next!25141 () Bool)

(assert (=> start!99556 (= b_free!25141 (not b_next!25141))))

(declare-fun tp!88137 () Bool)

(declare-fun b_and!41127 () Bool)

(assert (=> start!99556 (= tp!88137 b_and!41127)))

(declare-fun mapNonEmpty!46334 () Bool)

(declare-fun mapRes!46334 () Bool)

(declare-fun tp!88136 () Bool)

(declare-fun e!669849 () Bool)

(assert (=> mapNonEmpty!46334 (= mapRes!46334 (and tp!88136 e!669849))))

(declare-datatypes ((V!44689 0))(
  ( (V!44690 (val!14892 Int)) )
))
(declare-datatypes ((ValueCell!14126 0))(
  ( (ValueCellFull!14126 (v!17529 V!44689)) (EmptyCell!14126) )
))
(declare-fun mapValue!46334 () ValueCell!14126)

(declare-fun mapRest!46334 () (Array (_ BitVec 32) ValueCell!14126))

(declare-fun mapKey!46334 () (_ BitVec 32))

(declare-datatypes ((array!76080 0))(
  ( (array!76081 (arr!36690 (Array (_ BitVec 32) ValueCell!14126)) (size!37228 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76080)

(assert (=> mapNonEmpty!46334 (= (arr!36690 _values!996) (store mapRest!46334 mapKey!46334 mapValue!46334))))

(declare-fun b!1178301 () Bool)

(declare-fun res!782784 () Bool)

(declare-fun e!669858 () Bool)

(assert (=> b!1178301 (=> (not res!782784) (not e!669858))))

(declare-datatypes ((array!76082 0))(
  ( (array!76083 (arr!36691 (Array (_ BitVec 32) (_ BitVec 64))) (size!37229 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76082)

(declare-datatypes ((List!25872 0))(
  ( (Nil!25869) (Cons!25868 (h!27077 (_ BitVec 64)) (t!37996 List!25872)) )
))
(declare-fun arrayNoDuplicates!0 (array!76082 (_ BitVec 32) List!25872) Bool)

(assert (=> b!1178301 (= res!782784 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25869))))

(declare-fun b!1178302 () Bool)

(declare-fun res!782785 () Bool)

(assert (=> b!1178302 (=> (not res!782785) (not e!669858))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178302 (= res!782785 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46334 () Bool)

(assert (=> mapIsEmpty!46334 mapRes!46334))

(declare-fun b!1178303 () Bool)

(declare-fun e!669850 () Bool)

(assert (=> b!1178303 (= e!669850 true)))

(declare-fun e!669856 () Bool)

(assert (=> b!1178303 e!669856))

(declare-fun res!782789 () Bool)

(assert (=> b!1178303 (=> (not res!782789) (not e!669856))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1178303 (= res!782789 (not (= (select (arr!36691 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38770 0))(
  ( (Unit!38771) )
))
(declare-fun lt!532147 () Unit!38770)

(declare-fun e!669859 () Unit!38770)

(assert (=> b!1178303 (= lt!532147 e!669859)))

(declare-fun c!116809 () Bool)

(assert (=> b!1178303 (= c!116809 (= (select (arr!36691 _keys!1208) from!1455) k0!934))))

(declare-fun e!669852 () Bool)

(assert (=> b!1178303 e!669852))

(declare-fun res!782791 () Bool)

(assert (=> b!1178303 (=> (not res!782791) (not e!669852))))

(declare-datatypes ((tuple2!19166 0))(
  ( (tuple2!19167 (_1!9594 (_ BitVec 64)) (_2!9594 V!44689)) )
))
(declare-datatypes ((List!25873 0))(
  ( (Nil!25870) (Cons!25869 (h!27078 tuple2!19166) (t!37997 List!25873)) )
))
(declare-datatypes ((ListLongMap!17135 0))(
  ( (ListLongMap!17136 (toList!8583 List!25873)) )
))
(declare-fun lt!532155 () ListLongMap!17135)

(declare-fun lt!532152 () ListLongMap!17135)

(declare-fun lt!532161 () tuple2!19166)

(declare-fun +!3884 (ListLongMap!17135 tuple2!19166) ListLongMap!17135)

(assert (=> b!1178303 (= res!782791 (= lt!532152 (+!3884 lt!532155 lt!532161)))))

(declare-fun lt!532160 () V!44689)

(declare-fun get!18757 (ValueCell!14126 V!44689) V!44689)

(assert (=> b!1178303 (= lt!532161 (tuple2!19167 (select (arr!36691 _keys!1208) from!1455) (get!18757 (select (arr!36690 _values!996) from!1455) lt!532160)))))

(declare-fun e!669854 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1178304 () Bool)

(declare-fun arrayContainsKey!0 (array!76082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178304 (= e!669854 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178305 () Bool)

(declare-fun Unit!38772 () Unit!38770)

(assert (=> b!1178305 (= e!669859 Unit!38772)))

(declare-fun lt!532151 () Unit!38770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76082 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38770)

(assert (=> b!1178305 (= lt!532151 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178305 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532154 () Unit!38770)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76082 (_ BitVec 32) (_ BitVec 32)) Unit!38770)

(assert (=> b!1178305 (= lt!532154 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178305 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25869)))

(declare-fun lt!532157 () Unit!38770)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76082 (_ BitVec 64) (_ BitVec 32) List!25872) Unit!38770)

(assert (=> b!1178305 (= lt!532157 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25869))))

(assert (=> b!1178305 false))

(declare-fun res!782788 () Bool)

(assert (=> start!99556 (=> (not res!782788) (not e!669858))))

(assert (=> start!99556 (= res!782788 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37229 _keys!1208))))))

(assert (=> start!99556 e!669858))

(declare-fun tp_is_empty!29671 () Bool)

(assert (=> start!99556 tp_is_empty!29671))

(declare-fun array_inv!28126 (array!76082) Bool)

(assert (=> start!99556 (array_inv!28126 _keys!1208)))

(assert (=> start!99556 true))

(assert (=> start!99556 tp!88137))

(declare-fun e!669855 () Bool)

(declare-fun array_inv!28127 (array!76080) Bool)

(assert (=> start!99556 (and (array_inv!28127 _values!996) e!669855)))

(declare-fun b!1178306 () Bool)

(declare-fun res!782783 () Bool)

(assert (=> b!1178306 (=> (not res!782783) (not e!669858))))

(assert (=> b!1178306 (= res!782783 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37229 _keys!1208))))))

(declare-fun b!1178307 () Bool)

(declare-fun res!782778 () Bool)

(declare-fun e!669848 () Bool)

(assert (=> b!1178307 (=> (not res!782778) (not e!669848))))

(declare-fun lt!532153 () array!76082)

(assert (=> b!1178307 (= res!782778 (arrayNoDuplicates!0 lt!532153 #b00000000000000000000000000000000 Nil!25869))))

(declare-fun b!1178308 () Bool)

(declare-fun res!782780 () Bool)

(assert (=> b!1178308 (=> (not res!782780) (not e!669858))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76082 (_ BitVec 32)) Bool)

(assert (=> b!1178308 (= res!782780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178309 () Bool)

(assert (=> b!1178309 (= e!669858 e!669848)))

(declare-fun res!782790 () Bool)

(assert (=> b!1178309 (=> (not res!782790) (not e!669848))))

(assert (=> b!1178309 (= res!782790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532153 mask!1564))))

(assert (=> b!1178309 (= lt!532153 (array!76083 (store (arr!36691 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37229 _keys!1208)))))

(declare-fun b!1178310 () Bool)

(declare-fun res!782787 () Bool)

(assert (=> b!1178310 (=> (not res!782787) (not e!669858))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1178310 (= res!782787 (and (= (size!37228 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37229 _keys!1208) (size!37228 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178311 () Bool)

(declare-fun e!669847 () Bool)

(declare-fun e!669857 () Bool)

(assert (=> b!1178311 (= e!669847 e!669857)))

(declare-fun res!782786 () Bool)

(assert (=> b!1178311 (=> res!782786 e!669857)))

(assert (=> b!1178311 (= res!782786 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44689)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532159 () array!76080)

(declare-fun minValue!944 () V!44689)

(declare-fun getCurrentListMapNoExtraKeys!5044 (array!76082 array!76080 (_ BitVec 32) (_ BitVec 32) V!44689 V!44689 (_ BitVec 32) Int) ListLongMap!17135)

(assert (=> b!1178311 (= lt!532152 (getCurrentListMapNoExtraKeys!5044 lt!532153 lt!532159 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1178311 (= lt!532159 (array!76081 (store (arr!36690 _values!996) i!673 (ValueCellFull!14126 lt!532160)) (size!37228 _values!996)))))

(declare-fun dynLambda!2957 (Int (_ BitVec 64)) V!44689)

(assert (=> b!1178311 (= lt!532160 (dynLambda!2957 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532158 () ListLongMap!17135)

(assert (=> b!1178311 (= lt!532158 (getCurrentListMapNoExtraKeys!5044 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178312 () Bool)

(declare-fun e!669853 () Bool)

(assert (=> b!1178312 (= e!669853 tp_is_empty!29671)))

(declare-fun b!1178313 () Bool)

(assert (=> b!1178313 (= e!669855 (and e!669853 mapRes!46334))))

(declare-fun condMapEmpty!46334 () Bool)

(declare-fun mapDefault!46334 () ValueCell!14126)

(assert (=> b!1178313 (= condMapEmpty!46334 (= (arr!36690 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14126)) mapDefault!46334)))))

(declare-fun b!1178314 () Bool)

(assert (=> b!1178314 (= e!669852 e!669854)))

(declare-fun res!782779 () Bool)

(assert (=> b!1178314 (=> res!782779 e!669854)))

(assert (=> b!1178314 (= res!782779 (not (= (select (arr!36691 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178315 () Bool)

(assert (=> b!1178315 (= e!669857 e!669850)))

(declare-fun res!782777 () Bool)

(assert (=> b!1178315 (=> res!782777 e!669850)))

(assert (=> b!1178315 (= res!782777 (not (validKeyInArray!0 (select (arr!36691 _keys!1208) from!1455))))))

(declare-fun lt!532156 () ListLongMap!17135)

(assert (=> b!1178315 (= lt!532156 lt!532155)))

(declare-fun lt!532148 () ListLongMap!17135)

(declare-fun -!1551 (ListLongMap!17135 (_ BitVec 64)) ListLongMap!17135)

(assert (=> b!1178315 (= lt!532155 (-!1551 lt!532148 k0!934))))

(assert (=> b!1178315 (= lt!532156 (getCurrentListMapNoExtraKeys!5044 lt!532153 lt!532159 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178315 (= lt!532148 (getCurrentListMapNoExtraKeys!5044 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532149 () Unit!38770)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!815 (array!76082 array!76080 (_ BitVec 32) (_ BitVec 32) V!44689 V!44689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38770)

(assert (=> b!1178315 (= lt!532149 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!815 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178316 () Bool)

(declare-fun Unit!38773 () Unit!38770)

(assert (=> b!1178316 (= e!669859 Unit!38773)))

(declare-fun b!1178317 () Bool)

(declare-fun res!782776 () Bool)

(assert (=> b!1178317 (=> (not res!782776) (not e!669858))))

(assert (=> b!1178317 (= res!782776 (= (select (arr!36691 _keys!1208) i!673) k0!934))))

(declare-fun b!1178318 () Bool)

(assert (=> b!1178318 (= e!669848 (not e!669847))))

(declare-fun res!782781 () Bool)

(assert (=> b!1178318 (=> res!782781 e!669847)))

(assert (=> b!1178318 (= res!782781 (bvsgt from!1455 i!673))))

(assert (=> b!1178318 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532150 () Unit!38770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76082 (_ BitVec 64) (_ BitVec 32)) Unit!38770)

(assert (=> b!1178318 (= lt!532150 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178319 () Bool)

(assert (=> b!1178319 (= e!669856 (= lt!532158 (+!3884 lt!532148 lt!532161)))))

(declare-fun b!1178320 () Bool)

(assert (=> b!1178320 (= e!669849 tp_is_empty!29671)))

(declare-fun b!1178321 () Bool)

(declare-fun res!782782 () Bool)

(assert (=> b!1178321 (=> (not res!782782) (not e!669858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178321 (= res!782782 (validMask!0 mask!1564))))

(assert (= (and start!99556 res!782788) b!1178321))

(assert (= (and b!1178321 res!782782) b!1178310))

(assert (= (and b!1178310 res!782787) b!1178308))

(assert (= (and b!1178308 res!782780) b!1178301))

(assert (= (and b!1178301 res!782784) b!1178306))

(assert (= (and b!1178306 res!782783) b!1178302))

(assert (= (and b!1178302 res!782785) b!1178317))

(assert (= (and b!1178317 res!782776) b!1178309))

(assert (= (and b!1178309 res!782790) b!1178307))

(assert (= (and b!1178307 res!782778) b!1178318))

(assert (= (and b!1178318 (not res!782781)) b!1178311))

(assert (= (and b!1178311 (not res!782786)) b!1178315))

(assert (= (and b!1178315 (not res!782777)) b!1178303))

(assert (= (and b!1178303 res!782791) b!1178314))

(assert (= (and b!1178314 (not res!782779)) b!1178304))

(assert (= (and b!1178303 c!116809) b!1178305))

(assert (= (and b!1178303 (not c!116809)) b!1178316))

(assert (= (and b!1178303 res!782789) b!1178319))

(assert (= (and b!1178313 condMapEmpty!46334) mapIsEmpty!46334))

(assert (= (and b!1178313 (not condMapEmpty!46334)) mapNonEmpty!46334))

(get-info :version)

(assert (= (and mapNonEmpty!46334 ((_ is ValueCellFull!14126) mapValue!46334)) b!1178320))

(assert (= (and b!1178313 ((_ is ValueCellFull!14126) mapDefault!46334)) b!1178312))

(assert (= start!99556 b!1178313))

(declare-fun b_lambda!20267 () Bool)

(assert (=> (not b_lambda!20267) (not b!1178311)))

(declare-fun t!37995 () Bool)

(declare-fun tb!9945 () Bool)

(assert (=> (and start!99556 (= defaultEntry!1004 defaultEntry!1004) t!37995) tb!9945))

(declare-fun result!20465 () Bool)

(assert (=> tb!9945 (= result!20465 tp_is_empty!29671)))

(assert (=> b!1178311 t!37995))

(declare-fun b_and!41129 () Bool)

(assert (= b_and!41127 (and (=> t!37995 result!20465) b_and!41129)))

(declare-fun m!1085777 () Bool)

(assert (=> b!1178311 m!1085777))

(declare-fun m!1085779 () Bool)

(assert (=> b!1178311 m!1085779))

(declare-fun m!1085781 () Bool)

(assert (=> b!1178311 m!1085781))

(declare-fun m!1085783 () Bool)

(assert (=> b!1178311 m!1085783))

(declare-fun m!1085785 () Bool)

(assert (=> b!1178307 m!1085785))

(declare-fun m!1085787 () Bool)

(assert (=> b!1178314 m!1085787))

(declare-fun m!1085789 () Bool)

(assert (=> b!1178305 m!1085789))

(declare-fun m!1085791 () Bool)

(assert (=> b!1178305 m!1085791))

(declare-fun m!1085793 () Bool)

(assert (=> b!1178305 m!1085793))

(declare-fun m!1085795 () Bool)

(assert (=> b!1178305 m!1085795))

(declare-fun m!1085797 () Bool)

(assert (=> b!1178305 m!1085797))

(declare-fun m!1085799 () Bool)

(assert (=> b!1178308 m!1085799))

(assert (=> b!1178303 m!1085787))

(declare-fun m!1085801 () Bool)

(assert (=> b!1178303 m!1085801))

(declare-fun m!1085803 () Bool)

(assert (=> b!1178303 m!1085803))

(assert (=> b!1178303 m!1085803))

(declare-fun m!1085805 () Bool)

(assert (=> b!1178303 m!1085805))

(declare-fun m!1085807 () Bool)

(assert (=> b!1178309 m!1085807))

(declare-fun m!1085809 () Bool)

(assert (=> b!1178309 m!1085809))

(declare-fun m!1085811 () Bool)

(assert (=> mapNonEmpty!46334 m!1085811))

(declare-fun m!1085813 () Bool)

(assert (=> b!1178301 m!1085813))

(declare-fun m!1085815 () Bool)

(assert (=> b!1178304 m!1085815))

(declare-fun m!1085817 () Bool)

(assert (=> b!1178321 m!1085817))

(declare-fun m!1085819 () Bool)

(assert (=> b!1178319 m!1085819))

(declare-fun m!1085821 () Bool)

(assert (=> start!99556 m!1085821))

(declare-fun m!1085823 () Bool)

(assert (=> start!99556 m!1085823))

(declare-fun m!1085825 () Bool)

(assert (=> b!1178317 m!1085825))

(declare-fun m!1085827 () Bool)

(assert (=> b!1178315 m!1085827))

(declare-fun m!1085829 () Bool)

(assert (=> b!1178315 m!1085829))

(declare-fun m!1085831 () Bool)

(assert (=> b!1178315 m!1085831))

(declare-fun m!1085833 () Bool)

(assert (=> b!1178315 m!1085833))

(assert (=> b!1178315 m!1085787))

(declare-fun m!1085835 () Bool)

(assert (=> b!1178315 m!1085835))

(assert (=> b!1178315 m!1085787))

(declare-fun m!1085837 () Bool)

(assert (=> b!1178302 m!1085837))

(declare-fun m!1085839 () Bool)

(assert (=> b!1178318 m!1085839))

(declare-fun m!1085841 () Bool)

(assert (=> b!1178318 m!1085841))

(check-sat (not b!1178307) (not b!1178304) (not b!1178311) tp_is_empty!29671 (not b!1178303) (not start!99556) (not b_lambda!20267) (not b!1178305) (not b!1178315) (not b!1178308) (not b_next!25141) (not b!1178301) (not b!1178319) (not mapNonEmpty!46334) (not b!1178309) b_and!41129 (not b!1178318) (not b!1178321) (not b!1178302))
(check-sat b_and!41129 (not b_next!25141))
