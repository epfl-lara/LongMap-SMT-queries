; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98056 () Bool)

(assert start!98056)

(declare-fun b_free!23757 () Bool)

(declare-fun b_next!23757 () Bool)

(assert (=> start!98056 (= b_free!23757 (not b_next!23757))))

(declare-fun tp!83974 () Bool)

(declare-fun b_and!38297 () Bool)

(assert (=> start!98056 (= tp!83974 b_and!38297)))

(declare-fun b!1125786 () Bool)

(declare-fun res!752263 () Bool)

(declare-fun e!640820 () Bool)

(assert (=> b!1125786 (=> (not res!752263) (not e!640820))))

(declare-datatypes ((array!73437 0))(
  ( (array!73438 (arr!35371 (Array (_ BitVec 32) (_ BitVec 64))) (size!35907 (_ BitVec 32))) )
))
(declare-fun lt!499985 () array!73437)

(declare-datatypes ((List!24626 0))(
  ( (Nil!24623) (Cons!24622 (h!25831 (_ BitVec 64)) (t!35375 List!24626)) )
))
(declare-fun arrayNoDuplicates!0 (array!73437 (_ BitVec 32) List!24626) Bool)

(assert (=> b!1125786 (= res!752263 (arrayNoDuplicates!0 lt!499985 #b00000000000000000000000000000000 Nil!24623))))

(declare-fun b!1125787 () Bool)

(declare-fun res!752270 () Bool)

(declare-fun e!640827 () Bool)

(assert (=> b!1125787 (=> (not res!752270) (not e!640827))))

(declare-fun _keys!1208 () array!73437)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42843 0))(
  ( (V!42844 (val!14200 Int)) )
))
(declare-datatypes ((ValueCell!13434 0))(
  ( (ValueCellFull!13434 (v!16833 V!42843)) (EmptyCell!13434) )
))
(declare-datatypes ((array!73439 0))(
  ( (array!73440 (arr!35372 (Array (_ BitVec 32) ValueCell!13434)) (size!35908 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73439)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1125787 (= res!752270 (and (= (size!35908 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35907 _keys!1208) (size!35908 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44248 () Bool)

(declare-fun mapRes!44248 () Bool)

(assert (=> mapIsEmpty!44248 mapRes!44248))

(declare-fun res!752264 () Bool)

(assert (=> start!98056 (=> (not res!752264) (not e!640827))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98056 (= res!752264 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35907 _keys!1208))))))

(assert (=> start!98056 e!640827))

(declare-fun tp_is_empty!28287 () Bool)

(assert (=> start!98056 tp_is_empty!28287))

(declare-fun array_inv!27152 (array!73437) Bool)

(assert (=> start!98056 (array_inv!27152 _keys!1208)))

(assert (=> start!98056 true))

(assert (=> start!98056 tp!83974))

(declare-fun e!640818 () Bool)

(declare-fun array_inv!27153 (array!73439) Bool)

(assert (=> start!98056 (and (array_inv!27153 _values!996) e!640818)))

(declare-fun b!1125788 () Bool)

(declare-fun e!640826 () Bool)

(assert (=> b!1125788 (= e!640826 tp_is_empty!28287)))

(declare-fun b!1125789 () Bool)

(declare-fun e!640824 () Bool)

(assert (=> b!1125789 (= e!640824 tp_is_empty!28287)))

(declare-fun b!1125790 () Bool)

(declare-fun res!752265 () Bool)

(assert (=> b!1125790 (=> (not res!752265) (not e!640827))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125790 (= res!752265 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35907 _keys!1208))))))

(declare-fun b!1125791 () Bool)

(declare-fun e!640819 () Bool)

(assert (=> b!1125791 (= e!640819 true)))

(declare-fun zeroValue!944 () V!42843)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!42843)

(declare-fun lt!499984 () Bool)

(declare-datatypes ((tuple2!17848 0))(
  ( (tuple2!17849 (_1!8935 (_ BitVec 64)) (_2!8935 V!42843)) )
))
(declare-datatypes ((List!24627 0))(
  ( (Nil!24624) (Cons!24623 (h!25832 tuple2!17848) (t!35376 List!24627)) )
))
(declare-datatypes ((ListLongMap!15817 0))(
  ( (ListLongMap!15818 (toList!7924 List!24627)) )
))
(declare-fun contains!6459 (ListLongMap!15817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4412 (array!73437 array!73439 (_ BitVec 32) (_ BitVec 32) V!42843 V!42843 (_ BitVec 32) Int) ListLongMap!15817)

(assert (=> b!1125791 (= lt!499984 (contains!6459 (getCurrentListMapNoExtraKeys!4412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun mapNonEmpty!44248 () Bool)

(declare-fun tp!83975 () Bool)

(assert (=> mapNonEmpty!44248 (= mapRes!44248 (and tp!83975 e!640824))))

(declare-fun mapKey!44248 () (_ BitVec 32))

(declare-fun mapRest!44248 () (Array (_ BitVec 32) ValueCell!13434))

(declare-fun mapValue!44248 () ValueCell!13434)

(assert (=> mapNonEmpty!44248 (= (arr!35372 _values!996) (store mapRest!44248 mapKey!44248 mapValue!44248))))

(declare-fun b!1125792 () Bool)

(declare-fun res!752272 () Bool)

(assert (=> b!1125792 (=> (not res!752272) (not e!640827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73437 (_ BitVec 32)) Bool)

(assert (=> b!1125792 (= res!752272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125793 () Bool)

(assert (=> b!1125793 (= e!640827 e!640820)))

(declare-fun res!752267 () Bool)

(assert (=> b!1125793 (=> (not res!752267) (not e!640820))))

(assert (=> b!1125793 (= res!752267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499985 mask!1564))))

(assert (=> b!1125793 (= lt!499985 (array!73438 (store (arr!35371 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35907 _keys!1208)))))

(declare-fun b!1125794 () Bool)

(assert (=> b!1125794 (= e!640818 (and e!640826 mapRes!44248))))

(declare-fun condMapEmpty!44248 () Bool)

(declare-fun mapDefault!44248 () ValueCell!13434)

(assert (=> b!1125794 (= condMapEmpty!44248 (= (arr!35372 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13434)) mapDefault!44248)))))

(declare-fun b!1125795 () Bool)

(declare-fun res!752274 () Bool)

(assert (=> b!1125795 (=> (not res!752274) (not e!640827))))

(assert (=> b!1125795 (= res!752274 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24623))))

(declare-fun bm!47550 () Bool)

(declare-fun call!47553 () ListLongMap!15817)

(declare-fun lt!499980 () array!73439)

(assert (=> bm!47550 (= call!47553 (getCurrentListMapNoExtraKeys!4412 lt!499985 lt!499980 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125796 () Bool)

(declare-fun res!752269 () Bool)

(assert (=> b!1125796 (=> (not res!752269) (not e!640827))))

(assert (=> b!1125796 (= res!752269 (= (select (arr!35371 _keys!1208) i!673) k0!934))))

(declare-fun b!1125797 () Bool)

(declare-fun res!752271 () Bool)

(assert (=> b!1125797 (=> (not res!752271) (not e!640827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125797 (= res!752271 (validKeyInArray!0 k0!934))))

(declare-fun b!1125798 () Bool)

(declare-fun e!640825 () Bool)

(assert (=> b!1125798 (= e!640825 e!640819)))

(declare-fun res!752266 () Bool)

(assert (=> b!1125798 (=> res!752266 e!640819)))

(assert (=> b!1125798 (= res!752266 (not (= (select (arr!35371 _keys!1208) from!1455) k0!934)))))

(declare-fun e!640822 () Bool)

(assert (=> b!1125798 e!640822))

(declare-fun c!109626 () Bool)

(assert (=> b!1125798 (= c!109626 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36896 0))(
  ( (Unit!36897) )
))
(declare-fun lt!499981 () Unit!36896)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!369 (array!73437 array!73439 (_ BitVec 32) (_ BitVec 32) V!42843 V!42843 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36896)

(assert (=> b!1125798 (= lt!499981 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!369 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47551 () Bool)

(declare-fun call!47554 () ListLongMap!15817)

(assert (=> bm!47551 (= call!47554 (getCurrentListMapNoExtraKeys!4412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125799 () Bool)

(assert (=> b!1125799 (= e!640822 (= call!47553 call!47554))))

(declare-fun b!1125800 () Bool)

(declare-fun -!1122 (ListLongMap!15817 (_ BitVec 64)) ListLongMap!15817)

(assert (=> b!1125800 (= e!640822 (= call!47553 (-!1122 call!47554 k0!934)))))

(declare-fun b!1125801 () Bool)

(declare-fun e!640823 () Bool)

(assert (=> b!1125801 (= e!640820 (not e!640823))))

(declare-fun res!752268 () Bool)

(assert (=> b!1125801 (=> res!752268 e!640823)))

(assert (=> b!1125801 (= res!752268 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125801 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499982 () Unit!36896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73437 (_ BitVec 64) (_ BitVec 32)) Unit!36896)

(assert (=> b!1125801 (= lt!499982 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1125802 () Bool)

(assert (=> b!1125802 (= e!640823 e!640825)))

(declare-fun res!752273 () Bool)

(assert (=> b!1125802 (=> res!752273 e!640825)))

(assert (=> b!1125802 (= res!752273 (not (= from!1455 i!673)))))

(declare-fun lt!499983 () ListLongMap!15817)

(assert (=> b!1125802 (= lt!499983 (getCurrentListMapNoExtraKeys!4412 lt!499985 lt!499980 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2502 (Int (_ BitVec 64)) V!42843)

(assert (=> b!1125802 (= lt!499980 (array!73440 (store (arr!35372 _values!996) i!673 (ValueCellFull!13434 (dynLambda!2502 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35908 _values!996)))))

(declare-fun lt!499979 () ListLongMap!15817)

(assert (=> b!1125802 (= lt!499979 (getCurrentListMapNoExtraKeys!4412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125803 () Bool)

(declare-fun res!752275 () Bool)

(assert (=> b!1125803 (=> (not res!752275) (not e!640827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125803 (= res!752275 (validMask!0 mask!1564))))

(assert (= (and start!98056 res!752264) b!1125803))

(assert (= (and b!1125803 res!752275) b!1125787))

(assert (= (and b!1125787 res!752270) b!1125792))

(assert (= (and b!1125792 res!752272) b!1125795))

(assert (= (and b!1125795 res!752274) b!1125790))

(assert (= (and b!1125790 res!752265) b!1125797))

(assert (= (and b!1125797 res!752271) b!1125796))

(assert (= (and b!1125796 res!752269) b!1125793))

(assert (= (and b!1125793 res!752267) b!1125786))

(assert (= (and b!1125786 res!752263) b!1125801))

(assert (= (and b!1125801 (not res!752268)) b!1125802))

(assert (= (and b!1125802 (not res!752273)) b!1125798))

(assert (= (and b!1125798 c!109626) b!1125800))

(assert (= (and b!1125798 (not c!109626)) b!1125799))

(assert (= (or b!1125800 b!1125799) bm!47550))

(assert (= (or b!1125800 b!1125799) bm!47551))

(assert (= (and b!1125798 (not res!752266)) b!1125791))

(assert (= (and b!1125794 condMapEmpty!44248) mapIsEmpty!44248))

(assert (= (and b!1125794 (not condMapEmpty!44248)) mapNonEmpty!44248))

(get-info :version)

(assert (= (and mapNonEmpty!44248 ((_ is ValueCellFull!13434) mapValue!44248)) b!1125789))

(assert (= (and b!1125794 ((_ is ValueCellFull!13434) mapDefault!44248)) b!1125788))

(assert (= start!98056 b!1125794))

(declare-fun b_lambda!18727 () Bool)

(assert (=> (not b_lambda!18727) (not b!1125802)))

(declare-fun t!35374 () Bool)

(declare-fun tb!8569 () Bool)

(assert (=> (and start!98056 (= defaultEntry!1004 defaultEntry!1004) t!35374) tb!8569))

(declare-fun result!17699 () Bool)

(assert (=> tb!8569 (= result!17699 tp_is_empty!28287)))

(assert (=> b!1125802 t!35374))

(declare-fun b_and!38299 () Bool)

(assert (= b_and!38297 (and (=> t!35374 result!17699) b_and!38299)))

(declare-fun m!1039867 () Bool)

(assert (=> bm!47551 m!1039867))

(declare-fun m!1039869 () Bool)

(assert (=> b!1125798 m!1039869))

(declare-fun m!1039871 () Bool)

(assert (=> b!1125798 m!1039871))

(declare-fun m!1039873 () Bool)

(assert (=> b!1125801 m!1039873))

(declare-fun m!1039875 () Bool)

(assert (=> b!1125801 m!1039875))

(declare-fun m!1039877 () Bool)

(assert (=> b!1125802 m!1039877))

(declare-fun m!1039879 () Bool)

(assert (=> b!1125802 m!1039879))

(declare-fun m!1039881 () Bool)

(assert (=> b!1125802 m!1039881))

(declare-fun m!1039883 () Bool)

(assert (=> b!1125802 m!1039883))

(declare-fun m!1039885 () Bool)

(assert (=> bm!47550 m!1039885))

(declare-fun m!1039887 () Bool)

(assert (=> b!1125792 m!1039887))

(declare-fun m!1039889 () Bool)

(assert (=> start!98056 m!1039889))

(declare-fun m!1039891 () Bool)

(assert (=> start!98056 m!1039891))

(declare-fun m!1039893 () Bool)

(assert (=> b!1125800 m!1039893))

(assert (=> b!1125791 m!1039867))

(assert (=> b!1125791 m!1039867))

(declare-fun m!1039895 () Bool)

(assert (=> b!1125791 m!1039895))

(declare-fun m!1039897 () Bool)

(assert (=> mapNonEmpty!44248 m!1039897))

(declare-fun m!1039899 () Bool)

(assert (=> b!1125797 m!1039899))

(declare-fun m!1039901 () Bool)

(assert (=> b!1125803 m!1039901))

(declare-fun m!1039903 () Bool)

(assert (=> b!1125786 m!1039903))

(declare-fun m!1039905 () Bool)

(assert (=> b!1125793 m!1039905))

(declare-fun m!1039907 () Bool)

(assert (=> b!1125793 m!1039907))

(declare-fun m!1039909 () Bool)

(assert (=> b!1125796 m!1039909))

(declare-fun m!1039911 () Bool)

(assert (=> b!1125795 m!1039911))

(check-sat (not b!1125800) (not b!1125798) (not b!1125801) (not b!1125791) (not bm!47550) tp_is_empty!28287 (not b!1125797) (not b_lambda!18727) (not mapNonEmpty!44248) (not b!1125795) (not bm!47551) (not b!1125793) b_and!38299 (not b!1125786) (not b!1125792) (not b_next!23757) (not b!1125802) (not b!1125803) (not start!98056))
(check-sat b_and!38299 (not b_next!23757))
