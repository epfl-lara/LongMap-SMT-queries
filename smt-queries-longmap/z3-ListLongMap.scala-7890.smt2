; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98078 () Bool)

(assert start!98078)

(declare-fun b_free!23785 () Bool)

(declare-fun b_next!23785 () Bool)

(assert (=> start!98078 (= b_free!23785 (not b_next!23785))))

(declare-fun tp!84058 () Bool)

(declare-fun b_and!38331 () Bool)

(assert (=> start!98078 (= tp!84058 b_and!38331)))

(declare-fun b!1126441 () Bool)

(declare-fun e!641161 () Bool)

(assert (=> b!1126441 (= e!641161 true)))

(declare-datatypes ((V!42881 0))(
  ( (V!42882 (val!14214 Int)) )
))
(declare-fun zeroValue!944 () V!42881)

(declare-datatypes ((array!73418 0))(
  ( (array!73419 (arr!35362 (Array (_ BitVec 32) (_ BitVec 64))) (size!35900 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73418)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13448 0))(
  ( (ValueCellFull!13448 (v!16846 V!42881)) (EmptyCell!13448) )
))
(declare-datatypes ((array!73420 0))(
  ( (array!73421 (arr!35363 (Array (_ BitVec 32) ValueCell!13448)) (size!35901 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73420)

(declare-fun lt!500078 () Bool)

(declare-fun minValue!944 () V!42881)

(declare-datatypes ((tuple2!17966 0))(
  ( (tuple2!17967 (_1!8994 (_ BitVec 64)) (_2!8994 V!42881)) )
))
(declare-datatypes ((List!24723 0))(
  ( (Nil!24720) (Cons!24719 (h!25928 tuple2!17966) (t!35491 List!24723)) )
))
(declare-datatypes ((ListLongMap!15935 0))(
  ( (ListLongMap!15936 (toList!7983 List!24723)) )
))
(declare-fun contains!6446 (ListLongMap!15935 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4484 (array!73418 array!73420 (_ BitVec 32) (_ BitVec 32) V!42881 V!42881 (_ BitVec 32) Int) ListLongMap!15935)

(assert (=> b!1126441 (= lt!500078 (contains!6446 (getCurrentListMapNoExtraKeys!4484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun mapIsEmpty!44290 () Bool)

(declare-fun mapRes!44290 () Bool)

(assert (=> mapIsEmpty!44290 mapRes!44290))

(declare-fun b!1126442 () Bool)

(declare-fun e!641165 () Bool)

(declare-fun tp_is_empty!28315 () Bool)

(assert (=> b!1126442 (= e!641165 tp_is_empty!28315)))

(declare-fun b!1126443 () Bool)

(declare-fun res!752747 () Bool)

(declare-fun e!641163 () Bool)

(assert (=> b!1126443 (=> (not res!752747) (not e!641163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126443 (= res!752747 (validKeyInArray!0 k0!934))))

(declare-fun b!1126445 () Bool)

(declare-fun res!752748 () Bool)

(declare-fun e!641160 () Bool)

(assert (=> b!1126445 (=> (not res!752748) (not e!641160))))

(declare-fun lt!500079 () array!73418)

(declare-datatypes ((List!24724 0))(
  ( (Nil!24721) (Cons!24720 (h!25929 (_ BitVec 64)) (t!35492 List!24724)) )
))
(declare-fun arrayNoDuplicates!0 (array!73418 (_ BitVec 32) List!24724) Bool)

(assert (=> b!1126445 (= res!752748 (arrayNoDuplicates!0 lt!500079 #b00000000000000000000000000000000 Nil!24721))))

(declare-fun b!1126446 () Bool)

(declare-fun res!752742 () Bool)

(assert (=> b!1126446 (=> (not res!752742) (not e!641163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73418 (_ BitVec 32)) Bool)

(assert (=> b!1126446 (= res!752742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126447 () Bool)

(declare-fun res!752744 () Bool)

(assert (=> b!1126447 (=> (not res!752744) (not e!641163))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126447 (= res!752744 (= (select (arr!35362 _keys!1208) i!673) k0!934))))

(declare-fun b!1126448 () Bool)

(declare-fun e!641166 () Bool)

(assert (=> b!1126448 (= e!641166 e!641161)))

(declare-fun res!752752 () Bool)

(assert (=> b!1126448 (=> res!752752 e!641161)))

(assert (=> b!1126448 (= res!752752 (not (= (select (arr!35362 _keys!1208) from!1455) k0!934)))))

(declare-fun e!641158 () Bool)

(assert (=> b!1126448 e!641158))

(declare-fun c!109641 () Bool)

(assert (=> b!1126448 (= c!109641 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36769 0))(
  ( (Unit!36770) )
))
(declare-fun lt!500076 () Unit!36769)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!390 (array!73418 array!73420 (_ BitVec 32) (_ BitVec 32) V!42881 V!42881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36769)

(assert (=> b!1126448 (= lt!500076 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!390 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126449 () Bool)

(declare-fun e!641162 () Bool)

(assert (=> b!1126449 (= e!641162 tp_is_empty!28315)))

(declare-fun bm!47611 () Bool)

(declare-fun call!47615 () ListLongMap!15935)

(declare-fun lt!500073 () array!73420)

(assert (=> bm!47611 (= call!47615 (getCurrentListMapNoExtraKeys!4484 lt!500079 lt!500073 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47612 () Bool)

(declare-fun call!47614 () ListLongMap!15935)

(assert (=> bm!47612 (= call!47614 (getCurrentListMapNoExtraKeys!4484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126450 () Bool)

(assert (=> b!1126450 (= e!641163 e!641160)))

(declare-fun res!752746 () Bool)

(assert (=> b!1126450 (=> (not res!752746) (not e!641160))))

(assert (=> b!1126450 (= res!752746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500079 mask!1564))))

(assert (=> b!1126450 (= lt!500079 (array!73419 (store (arr!35362 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35900 _keys!1208)))))

(declare-fun b!1126451 () Bool)

(declare-fun -!1110 (ListLongMap!15935 (_ BitVec 64)) ListLongMap!15935)

(assert (=> b!1126451 (= e!641158 (= call!47615 (-!1110 call!47614 k0!934)))))

(declare-fun b!1126452 () Bool)

(declare-fun res!752749 () Bool)

(assert (=> b!1126452 (=> (not res!752749) (not e!641163))))

(assert (=> b!1126452 (= res!752749 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35900 _keys!1208))))))

(declare-fun b!1126453 () Bool)

(declare-fun e!641157 () Bool)

(assert (=> b!1126453 (= e!641157 (and e!641165 mapRes!44290))))

(declare-fun condMapEmpty!44290 () Bool)

(declare-fun mapDefault!44290 () ValueCell!13448)

(assert (=> b!1126453 (= condMapEmpty!44290 (= (arr!35363 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13448)) mapDefault!44290)))))

(declare-fun b!1126454 () Bool)

(declare-fun res!752750 () Bool)

(assert (=> b!1126454 (=> (not res!752750) (not e!641163))))

(assert (=> b!1126454 (= res!752750 (and (= (size!35901 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35900 _keys!1208) (size!35901 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126455 () Bool)

(declare-fun e!641164 () Bool)

(assert (=> b!1126455 (= e!641160 (not e!641164))))

(declare-fun res!752741 () Bool)

(assert (=> b!1126455 (=> res!752741 e!641164)))

(assert (=> b!1126455 (= res!752741 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126455 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500074 () Unit!36769)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73418 (_ BitVec 64) (_ BitVec 32)) Unit!36769)

(assert (=> b!1126455 (= lt!500074 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!752745 () Bool)

(assert (=> start!98078 (=> (not res!752745) (not e!641163))))

(assert (=> start!98078 (= res!752745 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35900 _keys!1208))))))

(assert (=> start!98078 e!641163))

(assert (=> start!98078 tp_is_empty!28315))

(declare-fun array_inv!27214 (array!73418) Bool)

(assert (=> start!98078 (array_inv!27214 _keys!1208)))

(assert (=> start!98078 true))

(assert (=> start!98078 tp!84058))

(declare-fun array_inv!27215 (array!73420) Bool)

(assert (=> start!98078 (and (array_inv!27215 _values!996) e!641157)))

(declare-fun b!1126444 () Bool)

(declare-fun res!752751 () Bool)

(assert (=> b!1126444 (=> (not res!752751) (not e!641163))))

(assert (=> b!1126444 (= res!752751 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24721))))

(declare-fun mapNonEmpty!44290 () Bool)

(declare-fun tp!84059 () Bool)

(assert (=> mapNonEmpty!44290 (= mapRes!44290 (and tp!84059 e!641162))))

(declare-fun mapValue!44290 () ValueCell!13448)

(declare-fun mapRest!44290 () (Array (_ BitVec 32) ValueCell!13448))

(declare-fun mapKey!44290 () (_ BitVec 32))

(assert (=> mapNonEmpty!44290 (= (arr!35363 _values!996) (store mapRest!44290 mapKey!44290 mapValue!44290))))

(declare-fun b!1126456 () Bool)

(declare-fun res!752743 () Bool)

(assert (=> b!1126456 (=> (not res!752743) (not e!641163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126456 (= res!752743 (validMask!0 mask!1564))))

(declare-fun b!1126457 () Bool)

(assert (=> b!1126457 (= e!641158 (= call!47615 call!47614))))

(declare-fun b!1126458 () Bool)

(assert (=> b!1126458 (= e!641164 e!641166)))

(declare-fun res!752740 () Bool)

(assert (=> b!1126458 (=> res!752740 e!641166)))

(assert (=> b!1126458 (= res!752740 (not (= from!1455 i!673)))))

(declare-fun lt!500077 () ListLongMap!15935)

(assert (=> b!1126458 (= lt!500077 (getCurrentListMapNoExtraKeys!4484 lt!500079 lt!500073 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2500 (Int (_ BitVec 64)) V!42881)

(assert (=> b!1126458 (= lt!500073 (array!73421 (store (arr!35363 _values!996) i!673 (ValueCellFull!13448 (dynLambda!2500 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35901 _values!996)))))

(declare-fun lt!500075 () ListLongMap!15935)

(assert (=> b!1126458 (= lt!500075 (getCurrentListMapNoExtraKeys!4484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98078 res!752745) b!1126456))

(assert (= (and b!1126456 res!752743) b!1126454))

(assert (= (and b!1126454 res!752750) b!1126446))

(assert (= (and b!1126446 res!752742) b!1126444))

(assert (= (and b!1126444 res!752751) b!1126452))

(assert (= (and b!1126452 res!752749) b!1126443))

(assert (= (and b!1126443 res!752747) b!1126447))

(assert (= (and b!1126447 res!752744) b!1126450))

(assert (= (and b!1126450 res!752746) b!1126445))

(assert (= (and b!1126445 res!752748) b!1126455))

(assert (= (and b!1126455 (not res!752741)) b!1126458))

(assert (= (and b!1126458 (not res!752740)) b!1126448))

(assert (= (and b!1126448 c!109641) b!1126451))

(assert (= (and b!1126448 (not c!109641)) b!1126457))

(assert (= (or b!1126451 b!1126457) bm!47611))

(assert (= (or b!1126451 b!1126457) bm!47612))

(assert (= (and b!1126448 (not res!752752)) b!1126441))

(assert (= (and b!1126453 condMapEmpty!44290) mapIsEmpty!44290))

(assert (= (and b!1126453 (not condMapEmpty!44290)) mapNonEmpty!44290))

(get-info :version)

(assert (= (and mapNonEmpty!44290 ((_ is ValueCellFull!13448) mapValue!44290)) b!1126449))

(assert (= (and b!1126453 ((_ is ValueCellFull!13448) mapDefault!44290)) b!1126442))

(assert (= start!98078 b!1126453))

(declare-fun b_lambda!18737 () Bool)

(assert (=> (not b_lambda!18737) (not b!1126458)))

(declare-fun t!35490 () Bool)

(declare-fun tb!8589 () Bool)

(assert (=> (and start!98078 (= defaultEntry!1004 defaultEntry!1004) t!35490) tb!8589))

(declare-fun result!17747 () Bool)

(assert (=> tb!8589 (= result!17747 tp_is_empty!28315)))

(assert (=> b!1126458 t!35490))

(declare-fun b_and!38333 () Bool)

(assert (= b_and!38331 (and (=> t!35490 result!17747) b_and!38333)))

(declare-fun m!1039881 () Bool)

(assert (=> mapNonEmpty!44290 m!1039881))

(declare-fun m!1039883 () Bool)

(assert (=> b!1126458 m!1039883))

(declare-fun m!1039885 () Bool)

(assert (=> b!1126458 m!1039885))

(declare-fun m!1039887 () Bool)

(assert (=> b!1126458 m!1039887))

(declare-fun m!1039889 () Bool)

(assert (=> b!1126458 m!1039889))

(declare-fun m!1039891 () Bool)

(assert (=> b!1126448 m!1039891))

(declare-fun m!1039893 () Bool)

(assert (=> b!1126448 m!1039893))

(declare-fun m!1039895 () Bool)

(assert (=> b!1126444 m!1039895))

(declare-fun m!1039897 () Bool)

(assert (=> start!98078 m!1039897))

(declare-fun m!1039899 () Bool)

(assert (=> start!98078 m!1039899))

(declare-fun m!1039901 () Bool)

(assert (=> b!1126445 m!1039901))

(declare-fun m!1039903 () Bool)

(assert (=> b!1126451 m!1039903))

(declare-fun m!1039905 () Bool)

(assert (=> b!1126447 m!1039905))

(declare-fun m!1039907 () Bool)

(assert (=> bm!47612 m!1039907))

(assert (=> b!1126441 m!1039907))

(assert (=> b!1126441 m!1039907))

(declare-fun m!1039909 () Bool)

(assert (=> b!1126441 m!1039909))

(declare-fun m!1039911 () Bool)

(assert (=> b!1126450 m!1039911))

(declare-fun m!1039913 () Bool)

(assert (=> b!1126450 m!1039913))

(declare-fun m!1039915 () Bool)

(assert (=> b!1126446 m!1039915))

(declare-fun m!1039917 () Bool)

(assert (=> b!1126455 m!1039917))

(declare-fun m!1039919 () Bool)

(assert (=> b!1126455 m!1039919))

(declare-fun m!1039921 () Bool)

(assert (=> b!1126456 m!1039921))

(declare-fun m!1039923 () Bool)

(assert (=> bm!47611 m!1039923))

(declare-fun m!1039925 () Bool)

(assert (=> b!1126443 m!1039925))

(check-sat b_and!38333 tp_is_empty!28315 (not b!1126443) (not b!1126458) (not b!1126444) (not b!1126456) (not b!1126441) (not b!1126455) (not bm!47611) (not mapNonEmpty!44290) (not b!1126445) (not b!1126446) (not b_next!23785) (not b!1126450) (not bm!47612) (not b!1126448) (not b!1126451) (not start!98078) (not b_lambda!18737))
(check-sat b_and!38333 (not b_next!23785))
