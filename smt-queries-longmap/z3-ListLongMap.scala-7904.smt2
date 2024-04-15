; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98162 () Bool)

(assert start!98162)

(declare-fun b_free!23869 () Bool)

(declare-fun b_next!23869 () Bool)

(assert (=> start!98162 (= b_free!23869 (not b_next!23869))))

(declare-fun tp!84310 () Bool)

(declare-fun b_and!38499 () Bool)

(assert (=> start!98162 (= tp!84310 b_and!38499)))

(declare-fun b!1128827 () Bool)

(declare-datatypes ((Unit!36831 0))(
  ( (Unit!36832) )
))
(declare-fun e!642439 () Unit!36831)

(declare-fun lt!500960 () Unit!36831)

(assert (=> b!1128827 (= e!642439 lt!500960)))

(declare-fun call!47880 () Unit!36831)

(assert (=> b!1128827 (= lt!500960 call!47880)))

(declare-fun call!47881 () Bool)

(assert (=> b!1128827 call!47881))

(declare-fun b!1128828 () Bool)

(declare-fun Unit!36833 () Unit!36831)

(assert (=> b!1128828 (= e!642439 Unit!36833)))

(declare-fun e!642437 () Bool)

(declare-datatypes ((V!42993 0))(
  ( (V!42994 (val!14256 Int)) )
))
(declare-datatypes ((tuple2!18038 0))(
  ( (tuple2!18039 (_1!9030 (_ BitVec 64)) (_2!9030 V!42993)) )
))
(declare-datatypes ((List!24791 0))(
  ( (Nil!24788) (Cons!24787 (h!25996 tuple2!18038) (t!35643 List!24791)) )
))
(declare-datatypes ((ListLongMap!16007 0))(
  ( (ListLongMap!16008 (toList!8019 List!24791)) )
))
(declare-fun call!47879 () ListLongMap!16007)

(declare-fun b!1128829 () Bool)

(declare-fun call!47883 () ListLongMap!16007)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1134 (ListLongMap!16007 (_ BitVec 64)) ListLongMap!16007)

(assert (=> b!1128829 (= e!642437 (= call!47883 (-!1134 call!47879 k0!934)))))

(declare-fun b!1128830 () Bool)

(declare-fun e!642431 () Bool)

(declare-fun e!642429 () Bool)

(declare-fun mapRes!44416 () Bool)

(assert (=> b!1128830 (= e!642431 (and e!642429 mapRes!44416))))

(declare-fun condMapEmpty!44416 () Bool)

(declare-datatypes ((ValueCell!13490 0))(
  ( (ValueCellFull!13490 (v!16888 V!42993)) (EmptyCell!13490) )
))
(declare-datatypes ((array!73580 0))(
  ( (array!73581 (arr!35443 (Array (_ BitVec 32) ValueCell!13490)) (size!35981 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73580)

(declare-fun mapDefault!44416 () ValueCell!13490)

(assert (=> b!1128830 (= condMapEmpty!44416 (= (arr!35443 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13490)) mapDefault!44416)))))

(declare-fun b!1128831 () Bool)

(declare-fun e!642432 () Unit!36831)

(declare-fun e!642433 () Unit!36831)

(assert (=> b!1128831 (= e!642432 e!642433)))

(declare-fun c!109775 () Bool)

(declare-fun lt!500958 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1128831 (= c!109775 (and (not lt!500958) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!944 () V!42993)

(declare-datatypes ((array!73582 0))(
  ( (array!73583 (arr!35444 (Array (_ BitVec 32) (_ BitVec 64))) (size!35982 (_ BitVec 32))) )
))
(declare-fun lt!500959 () array!73582)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!47875 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!500963 () array!73580)

(declare-fun minValue!944 () V!42993)

(declare-fun getCurrentListMapNoExtraKeys!4519 (array!73582 array!73580 (_ BitVec 32) (_ BitVec 32) V!42993 V!42993 (_ BitVec 32) Int) ListLongMap!16007)

(assert (=> bm!47875 (= call!47883 (getCurrentListMapNoExtraKeys!4519 lt!500959 lt!500963 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128832 () Bool)

(declare-fun res!754414 () Bool)

(declare-fun e!642438 () Bool)

(assert (=> b!1128832 (=> (not res!754414) (not e!642438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128832 (= res!754414 (validKeyInArray!0 k0!934))))

(declare-fun b!1128833 () Bool)

(declare-fun res!754408 () Bool)

(assert (=> b!1128833 (=> (not res!754408) (not e!642438))))

(declare-fun _keys!1208 () array!73582)

(assert (=> b!1128833 (= res!754408 (and (= (size!35981 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35982 _keys!1208) (size!35981 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128834 () Bool)

(declare-fun e!642430 () Bool)

(assert (=> b!1128834 (= e!642438 e!642430)))

(declare-fun res!754406 () Bool)

(assert (=> b!1128834 (=> (not res!754406) (not e!642430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73582 (_ BitVec 32)) Bool)

(assert (=> b!1128834 (= res!754406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500959 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128834 (= lt!500959 (array!73583 (store (arr!35444 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35982 _keys!1208)))))

(declare-fun b!1128835 () Bool)

(assert (=> b!1128835 (= e!642437 (= call!47883 call!47879))))

(declare-fun b!1128836 () Bool)

(declare-fun e!642441 () Bool)

(declare-fun e!642428 () Bool)

(assert (=> b!1128836 (= e!642441 e!642428)))

(declare-fun res!754410 () Bool)

(assert (=> b!1128836 (=> res!754410 e!642428)))

(assert (=> b!1128836 (= res!754410 (not (= (select (arr!35444 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128836 e!642437))

(declare-fun c!109774 () Bool)

(assert (=> b!1128836 (= c!109774 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500964 () Unit!36831)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!417 (array!73582 array!73580 (_ BitVec 32) (_ BitVec 32) V!42993 V!42993 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36831)

(assert (=> b!1128836 (= lt!500964 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!417 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128837 () Bool)

(declare-fun res!754409 () Bool)

(assert (=> b!1128837 (=> (not res!754409) (not e!642438))))

(assert (=> b!1128837 (= res!754409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128838 () Bool)

(declare-fun res!754407 () Bool)

(assert (=> b!1128838 (=> (not res!754407) (not e!642438))))

(assert (=> b!1128838 (= res!754407 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35982 _keys!1208))))))

(declare-fun call!47885 () ListLongMap!16007)

(declare-fun call!47882 () Bool)

(declare-fun lt!500953 () ListLongMap!16007)

(declare-fun c!109776 () Bool)

(declare-fun bm!47876 () Bool)

(declare-fun contains!6471 (ListLongMap!16007 (_ BitVec 64)) Bool)

(assert (=> bm!47876 (= call!47882 (contains!6471 (ite c!109776 lt!500953 call!47885) k0!934))))

(declare-fun b!1128840 () Bool)

(declare-fun e!642434 () Bool)

(assert (=> b!1128840 (= e!642434 e!642441)))

(declare-fun res!754401 () Bool)

(assert (=> b!1128840 (=> res!754401 e!642441)))

(assert (=> b!1128840 (= res!754401 (not (= from!1455 i!673)))))

(declare-fun lt!500962 () ListLongMap!16007)

(assert (=> b!1128840 (= lt!500962 (getCurrentListMapNoExtraKeys!4519 lt!500959 lt!500963 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2525 (Int (_ BitVec 64)) V!42993)

(assert (=> b!1128840 (= lt!500963 (array!73581 (store (arr!35443 _values!996) i!673 (ValueCellFull!13490 (dynLambda!2525 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35981 _values!996)))))

(declare-fun lt!500965 () ListLongMap!16007)

(assert (=> b!1128840 (= lt!500965 (getCurrentListMapNoExtraKeys!4519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128841 () Bool)

(declare-fun res!754403 () Bool)

(assert (=> b!1128841 (=> (not res!754403) (not e!642438))))

(assert (=> b!1128841 (= res!754403 (= (select (arr!35444 _keys!1208) i!673) k0!934))))

(declare-fun bm!47877 () Bool)

(assert (=> bm!47877 (= call!47879 (getCurrentListMapNoExtraKeys!4519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128842 () Bool)

(declare-fun tp_is_empty!28399 () Bool)

(assert (=> b!1128842 (= e!642429 tp_is_empty!28399)))

(declare-fun b!1128843 () Bool)

(declare-fun c!109773 () Bool)

(assert (=> b!1128843 (= c!109773 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!500958))))

(assert (=> b!1128843 (= e!642433 e!642439)))

(declare-fun b!1128844 () Bool)

(declare-fun res!754404 () Bool)

(assert (=> b!1128844 (=> (not res!754404) (not e!642438))))

(declare-datatypes ((List!24792 0))(
  ( (Nil!24789) (Cons!24788 (h!25997 (_ BitVec 64)) (t!35644 List!24792)) )
))
(declare-fun arrayNoDuplicates!0 (array!73582 (_ BitVec 32) List!24792) Bool)

(assert (=> b!1128844 (= res!754404 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24789))))

(declare-fun b!1128845 () Bool)

(declare-fun e!642427 () Bool)

(assert (=> b!1128845 (= e!642427 tp_is_empty!28399)))

(declare-fun b!1128846 () Bool)

(declare-fun e!642440 () Bool)

(assert (=> b!1128846 (= e!642440 true)))

(declare-fun lt!500957 () Bool)

(declare-fun getCurrentListMap!4350 (array!73582 array!73580 (_ BitVec 32) (_ BitVec 32) V!42993 V!42993 (_ BitVec 32) Int) ListLongMap!16007)

(assert (=> b!1128846 (= lt!500957 (contains!6471 (getCurrentListMap!4350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun call!47884 () ListLongMap!16007)

(declare-fun lt!500961 () ListLongMap!16007)

(declare-fun bm!47878 () Bool)

(declare-fun +!3463 (ListLongMap!16007 tuple2!18038) ListLongMap!16007)

(assert (=> bm!47878 (= call!47884 (+!3463 lt!500961 (ite (or c!109776 c!109775) (tuple2!18039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18039 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1128847 () Bool)

(declare-fun e!642435 () Bool)

(assert (=> b!1128847 (= e!642435 e!642440)))

(declare-fun res!754413 () Bool)

(assert (=> b!1128847 (=> res!754413 e!642440)))

(assert (=> b!1128847 (= res!754413 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!35982 _keys!1208))))))

(declare-fun lt!500967 () Unit!36831)

(assert (=> b!1128847 (= lt!500967 e!642432)))

(assert (=> b!1128847 (= c!109776 (and (not lt!500958) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1128847 (= lt!500958 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!47878 () Unit!36831)

(declare-fun bm!47879 () Bool)

(declare-fun addStillContains!681 (ListLongMap!16007 (_ BitVec 64) V!42993 (_ BitVec 64)) Unit!36831)

(assert (=> bm!47879 (= call!47878 (addStillContains!681 lt!500961 (ite (or c!109776 c!109775) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!109776 c!109775) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!47880 () Bool)

(assert (=> bm!47880 (= call!47885 call!47884)))

(declare-fun b!1128848 () Bool)

(declare-fun lt!500956 () Unit!36831)

(assert (=> b!1128848 (= e!642432 lt!500956)))

(declare-fun lt!500955 () Unit!36831)

(assert (=> b!1128848 (= lt!500955 call!47878)))

(assert (=> b!1128848 (= lt!500953 call!47884)))

(assert (=> b!1128848 call!47882))

(assert (=> b!1128848 (= lt!500956 (addStillContains!681 lt!500953 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1128848 (contains!6471 (+!3463 lt!500953 (tuple2!18039 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1128849 () Bool)

(declare-fun res!754402 () Bool)

(assert (=> b!1128849 (=> (not res!754402) (not e!642430))))

(assert (=> b!1128849 (= res!754402 (arrayNoDuplicates!0 lt!500959 #b00000000000000000000000000000000 Nil!24789))))

(declare-fun b!1128850 () Bool)

(assert (=> b!1128850 (= e!642428 e!642435)))

(declare-fun res!754400 () Bool)

(assert (=> b!1128850 (=> res!754400 e!642435)))

(assert (=> b!1128850 (= res!754400 (not (contains!6471 lt!500961 k0!934)))))

(assert (=> b!1128850 (= lt!500961 (getCurrentListMapNoExtraKeys!4519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44416 () Bool)

(assert (=> mapIsEmpty!44416 mapRes!44416))

(declare-fun bm!47881 () Bool)

(assert (=> bm!47881 (= call!47881 call!47882)))

(declare-fun bm!47882 () Bool)

(assert (=> bm!47882 (= call!47880 call!47878)))

(declare-fun b!1128851 () Bool)

(assert (=> b!1128851 (= e!642430 (not e!642434))))

(declare-fun res!754405 () Bool)

(assert (=> b!1128851 (=> res!754405 e!642434)))

(assert (=> b!1128851 (= res!754405 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128851 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500954 () Unit!36831)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73582 (_ BitVec 64) (_ BitVec 32)) Unit!36831)

(assert (=> b!1128851 (= lt!500954 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44416 () Bool)

(declare-fun tp!84311 () Bool)

(assert (=> mapNonEmpty!44416 (= mapRes!44416 (and tp!84311 e!642427))))

(declare-fun mapRest!44416 () (Array (_ BitVec 32) ValueCell!13490))

(declare-fun mapValue!44416 () ValueCell!13490)

(declare-fun mapKey!44416 () (_ BitVec 32))

(assert (=> mapNonEmpty!44416 (= (arr!35443 _values!996) (store mapRest!44416 mapKey!44416 mapValue!44416))))

(declare-fun b!1128852 () Bool)

(assert (=> b!1128852 call!47881))

(declare-fun lt!500966 () Unit!36831)

(assert (=> b!1128852 (= lt!500966 call!47880)))

(assert (=> b!1128852 (= e!642433 lt!500966)))

(declare-fun b!1128839 () Bool)

(declare-fun res!754411 () Bool)

(assert (=> b!1128839 (=> (not res!754411) (not e!642438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128839 (= res!754411 (validMask!0 mask!1564))))

(declare-fun res!754412 () Bool)

(assert (=> start!98162 (=> (not res!754412) (not e!642438))))

(assert (=> start!98162 (= res!754412 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35982 _keys!1208))))))

(assert (=> start!98162 e!642438))

(assert (=> start!98162 tp_is_empty!28399))

(declare-fun array_inv!27270 (array!73582) Bool)

(assert (=> start!98162 (array_inv!27270 _keys!1208)))

(assert (=> start!98162 true))

(assert (=> start!98162 tp!84310))

(declare-fun array_inv!27271 (array!73580) Bool)

(assert (=> start!98162 (and (array_inv!27271 _values!996) e!642431)))

(assert (= (and start!98162 res!754412) b!1128839))

(assert (= (and b!1128839 res!754411) b!1128833))

(assert (= (and b!1128833 res!754408) b!1128837))

(assert (= (and b!1128837 res!754409) b!1128844))

(assert (= (and b!1128844 res!754404) b!1128838))

(assert (= (and b!1128838 res!754407) b!1128832))

(assert (= (and b!1128832 res!754414) b!1128841))

(assert (= (and b!1128841 res!754403) b!1128834))

(assert (= (and b!1128834 res!754406) b!1128849))

(assert (= (and b!1128849 res!754402) b!1128851))

(assert (= (and b!1128851 (not res!754405)) b!1128840))

(assert (= (and b!1128840 (not res!754401)) b!1128836))

(assert (= (and b!1128836 c!109774) b!1128829))

(assert (= (and b!1128836 (not c!109774)) b!1128835))

(assert (= (or b!1128829 b!1128835) bm!47875))

(assert (= (or b!1128829 b!1128835) bm!47877))

(assert (= (and b!1128836 (not res!754410)) b!1128850))

(assert (= (and b!1128850 (not res!754400)) b!1128847))

(assert (= (and b!1128847 c!109776) b!1128848))

(assert (= (and b!1128847 (not c!109776)) b!1128831))

(assert (= (and b!1128831 c!109775) b!1128852))

(assert (= (and b!1128831 (not c!109775)) b!1128843))

(assert (= (and b!1128843 c!109773) b!1128827))

(assert (= (and b!1128843 (not c!109773)) b!1128828))

(assert (= (or b!1128852 b!1128827) bm!47882))

(assert (= (or b!1128852 b!1128827) bm!47880))

(assert (= (or b!1128852 b!1128827) bm!47881))

(assert (= (or b!1128848 bm!47881) bm!47876))

(assert (= (or b!1128848 bm!47882) bm!47879))

(assert (= (or b!1128848 bm!47880) bm!47878))

(assert (= (and b!1128847 (not res!754413)) b!1128846))

(assert (= (and b!1128830 condMapEmpty!44416) mapIsEmpty!44416))

(assert (= (and b!1128830 (not condMapEmpty!44416)) mapNonEmpty!44416))

(get-info :version)

(assert (= (and mapNonEmpty!44416 ((_ is ValueCellFull!13490) mapValue!44416)) b!1128845))

(assert (= (and b!1128830 ((_ is ValueCellFull!13490) mapDefault!44416)) b!1128842))

(assert (= start!98162 b!1128830))

(declare-fun b_lambda!18821 () Bool)

(assert (=> (not b_lambda!18821) (not b!1128840)))

(declare-fun t!35642 () Bool)

(declare-fun tb!8673 () Bool)

(assert (=> (and start!98162 (= defaultEntry!1004 defaultEntry!1004) t!35642) tb!8673))

(declare-fun result!17915 () Bool)

(assert (=> tb!8673 (= result!17915 tp_is_empty!28399)))

(assert (=> b!1128840 t!35642))

(declare-fun b_and!38501 () Bool)

(assert (= b_and!38499 (and (=> t!35642 result!17915) b_and!38501)))

(declare-fun m!1041813 () Bool)

(assert (=> bm!47878 m!1041813))

(declare-fun m!1041815 () Bool)

(assert (=> bm!47877 m!1041815))

(declare-fun m!1041817 () Bool)

(assert (=> b!1128840 m!1041817))

(declare-fun m!1041819 () Bool)

(assert (=> b!1128840 m!1041819))

(declare-fun m!1041821 () Bool)

(assert (=> b!1128840 m!1041821))

(declare-fun m!1041823 () Bool)

(assert (=> b!1128840 m!1041823))

(declare-fun m!1041825 () Bool)

(assert (=> b!1128841 m!1041825))

(declare-fun m!1041827 () Bool)

(assert (=> start!98162 m!1041827))

(declare-fun m!1041829 () Bool)

(assert (=> start!98162 m!1041829))

(declare-fun m!1041831 () Bool)

(assert (=> b!1128850 m!1041831))

(assert (=> b!1128850 m!1041815))

(declare-fun m!1041833 () Bool)

(assert (=> b!1128832 m!1041833))

(declare-fun m!1041835 () Bool)

(assert (=> bm!47875 m!1041835))

(declare-fun m!1041837 () Bool)

(assert (=> b!1128846 m!1041837))

(assert (=> b!1128846 m!1041837))

(declare-fun m!1041839 () Bool)

(assert (=> b!1128846 m!1041839))

(declare-fun m!1041841 () Bool)

(assert (=> b!1128848 m!1041841))

(declare-fun m!1041843 () Bool)

(assert (=> b!1128848 m!1041843))

(assert (=> b!1128848 m!1041843))

(declare-fun m!1041845 () Bool)

(assert (=> b!1128848 m!1041845))

(declare-fun m!1041847 () Bool)

(assert (=> b!1128844 m!1041847))

(declare-fun m!1041849 () Bool)

(assert (=> b!1128834 m!1041849))

(declare-fun m!1041851 () Bool)

(assert (=> b!1128834 m!1041851))

(declare-fun m!1041853 () Bool)

(assert (=> b!1128851 m!1041853))

(declare-fun m!1041855 () Bool)

(assert (=> b!1128851 m!1041855))

(declare-fun m!1041857 () Bool)

(assert (=> b!1128836 m!1041857))

(declare-fun m!1041859 () Bool)

(assert (=> b!1128836 m!1041859))

(declare-fun m!1041861 () Bool)

(assert (=> bm!47876 m!1041861))

(declare-fun m!1041863 () Bool)

(assert (=> b!1128839 m!1041863))

(declare-fun m!1041865 () Bool)

(assert (=> mapNonEmpty!44416 m!1041865))

(declare-fun m!1041867 () Bool)

(assert (=> b!1128829 m!1041867))

(declare-fun m!1041869 () Bool)

(assert (=> b!1128837 m!1041869))

(declare-fun m!1041871 () Bool)

(assert (=> b!1128849 m!1041871))

(declare-fun m!1041873 () Bool)

(assert (=> bm!47879 m!1041873))

(check-sat (not bm!47878) (not b!1128851) (not b!1128848) (not b!1128839) (not b!1128840) (not b!1128837) (not b!1128846) (not bm!47876) (not bm!47877) (not b!1128850) (not b_lambda!18821) tp_is_empty!28399 (not b!1128836) (not b_next!23869) (not start!98162) (not b!1128844) (not b!1128832) (not b!1128849) (not b!1128834) b_and!38501 (not bm!47875) (not b!1128829) (not bm!47879) (not mapNonEmpty!44416))
(check-sat b_and!38501 (not b_next!23869))
