; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100576 () Bool)

(assert start!100576)

(declare-fun b_free!25899 () Bool)

(declare-fun b_next!25899 () Bool)

(assert (=> start!100576 (= b_free!25899 (not b_next!25899))))

(declare-fun tp!90687 () Bool)

(declare-fun b_and!42685 () Bool)

(assert (=> start!100576 (= tp!90687 b_and!42685)))

(declare-fun c!117794 () Bool)

(declare-datatypes ((V!45931 0))(
  ( (V!45932 (val!15358 Int)) )
))
(declare-datatypes ((tuple2!19688 0))(
  ( (tuple2!19689 (_1!9855 (_ BitVec 64)) (_2!9855 V!45931)) )
))
(declare-datatypes ((List!26498 0))(
  ( (Nil!26495) (Cons!26494 (h!27703 tuple2!19688) (t!39377 List!26498)) )
))
(declare-datatypes ((ListLongMap!17657 0))(
  ( (ListLongMap!17658 (toList!8844 List!26498)) )
))
(declare-fun lt!545433 () ListLongMap!17657)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!57993 () Bool)

(declare-fun call!57992 () ListLongMap!17657)

(declare-fun bm!57985 () Bool)

(declare-fun contains!6898 (ListLongMap!17657 (_ BitVec 64)) Bool)

(assert (=> bm!57985 (= call!57993 (contains!6898 (ite c!117794 lt!545433 call!57992) k0!934))))

(declare-fun b!1203216 () Bool)

(declare-fun e!683239 () Bool)

(declare-fun e!683230 () Bool)

(assert (=> b!1203216 (= e!683239 (not e!683230))))

(declare-fun res!800752 () Bool)

(assert (=> b!1203216 (=> res!800752 e!683230)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203216 (= res!800752 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77979 0))(
  ( (array!77980 (arr!37634 (Array (_ BitVec 32) (_ BitVec 64))) (size!38170 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77979)

(declare-fun arrayContainsKey!0 (array!77979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203216 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39889 0))(
  ( (Unit!39890) )
))
(declare-fun lt!545421 () Unit!39889)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77979 (_ BitVec 64) (_ BitVec 32)) Unit!39889)

(assert (=> b!1203216 (= lt!545421 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1203217 () Bool)

(declare-fun e!683227 () Bool)

(declare-fun e!683235 () Bool)

(declare-fun mapRes!47747 () Bool)

(assert (=> b!1203217 (= e!683227 (and e!683235 mapRes!47747))))

(declare-fun condMapEmpty!47747 () Bool)

(declare-datatypes ((ValueCell!14592 0))(
  ( (ValueCellFull!14592 (v!17996 V!45931)) (EmptyCell!14592) )
))
(declare-datatypes ((array!77981 0))(
  ( (array!77982 (arr!37635 (Array (_ BitVec 32) ValueCell!14592)) (size!38171 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77981)

(declare-fun mapDefault!47747 () ValueCell!14592)

(assert (=> b!1203217 (= condMapEmpty!47747 (= (arr!37635 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14592)) mapDefault!47747)))))

(declare-fun zeroValue!944 () V!45931)

(declare-fun c!117793 () Bool)

(declare-fun call!57991 () ListLongMap!17657)

(declare-fun minValue!944 () V!45931)

(declare-fun bm!57986 () Bool)

(declare-fun lt!545425 () ListLongMap!17657)

(declare-fun +!3970 (ListLongMap!17657 tuple2!19688) ListLongMap!17657)

(assert (=> bm!57986 (= call!57991 (+!3970 (ite c!117794 lt!545433 lt!545425) (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1203218 () Bool)

(declare-fun res!800743 () Bool)

(declare-fun e!683226 () Bool)

(assert (=> b!1203218 (=> (not res!800743) (not e!683226))))

(assert (=> b!1203218 (= res!800743 (= (select (arr!37634 _keys!1208) i!673) k0!934))))

(declare-fun b!1203219 () Bool)

(declare-fun res!800742 () Bool)

(assert (=> b!1203219 (=> (not res!800742) (not e!683226))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203219 (= res!800742 (validMask!0 mask!1564))))

(declare-fun b!1203220 () Bool)

(declare-fun e!683236 () Bool)

(assert (=> b!1203220 (= e!683236 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 _keys!1208))))))

(declare-fun lt!545431 () Unit!39889)

(declare-fun e!683238 () Unit!39889)

(assert (=> b!1203220 (= lt!545431 e!683238)))

(declare-fun lt!545430 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1203220 (= c!117794 (and (not lt!545430) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203220 (= lt!545430 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1203221 () Bool)

(declare-fun res!800746 () Bool)

(assert (=> b!1203221 (=> (not res!800746) (not e!683226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77979 (_ BitVec 32)) Bool)

(assert (=> b!1203221 (= res!800746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1203222 () Bool)

(declare-fun e!683231 () Bool)

(declare-fun e!683237 () Bool)

(assert (=> b!1203222 (= e!683231 e!683237)))

(declare-fun res!800753 () Bool)

(assert (=> b!1203222 (=> res!800753 e!683237)))

(assert (=> b!1203222 (= res!800753 (not (= (select (arr!37634 _keys!1208) from!1455) k0!934)))))

(declare-fun e!683234 () Bool)

(assert (=> b!1203222 e!683234))

(declare-fun c!117792 () Bool)

(assert (=> b!1203222 (= c!117792 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!545426 () Unit!39889)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1016 (array!77979 array!77981 (_ BitVec 32) (_ BitVec 32) V!45931 V!45931 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39889)

(assert (=> b!1203222 (= lt!545426 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1016 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47747 () Bool)

(declare-fun tp!90686 () Bool)

(declare-fun e!683232 () Bool)

(assert (=> mapNonEmpty!47747 (= mapRes!47747 (and tp!90686 e!683232))))

(declare-fun mapValue!47747 () ValueCell!14592)

(declare-fun mapKey!47747 () (_ BitVec 32))

(declare-fun mapRest!47747 () (Array (_ BitVec 32) ValueCell!14592))

(assert (=> mapNonEmpty!47747 (= (arr!37635 _values!996) (store mapRest!47747 mapKey!47747 mapValue!47747))))

(declare-fun b!1203223 () Bool)

(declare-fun tp_is_empty!30603 () Bool)

(assert (=> b!1203223 (= e!683235 tp_is_empty!30603)))

(declare-fun b!1203224 () Bool)

(declare-fun e!683233 () Unit!39889)

(declare-fun Unit!39891 () Unit!39889)

(assert (=> b!1203224 (= e!683233 Unit!39891)))

(declare-fun b!1203225 () Bool)

(declare-fun res!800741 () Bool)

(assert (=> b!1203225 (=> (not res!800741) (not e!683226))))

(declare-datatypes ((List!26499 0))(
  ( (Nil!26496) (Cons!26495 (h!27704 (_ BitVec 64)) (t!39378 List!26499)) )
))
(declare-fun arrayNoDuplicates!0 (array!77979 (_ BitVec 32) List!26499) Bool)

(assert (=> b!1203225 (= res!800741 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26496))))

(declare-fun b!1203226 () Bool)

(assert (=> b!1203226 (= e!683232 tp_is_empty!30603)))

(declare-fun b!1203227 () Bool)

(declare-fun res!800751 () Bool)

(assert (=> b!1203227 (=> (not res!800751) (not e!683239))))

(declare-fun lt!545424 () array!77979)

(assert (=> b!1203227 (= res!800751 (arrayNoDuplicates!0 lt!545424 #b00000000000000000000000000000000 Nil!26496))))

(declare-fun bm!57987 () Bool)

(declare-fun call!57990 () Unit!39889)

(declare-fun addStillContains!999 (ListLongMap!17657 (_ BitVec 64) V!45931 (_ BitVec 64)) Unit!39889)

(assert (=> bm!57987 (= call!57990 (addStillContains!999 lt!545425 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!57988 () Bool)

(assert (=> bm!57988 (= call!57992 call!57991)))

(declare-fun b!1203228 () Bool)

(assert (=> b!1203228 (= e!683226 e!683239)))

(declare-fun res!800750 () Bool)

(assert (=> b!1203228 (=> (not res!800750) (not e!683239))))

(assert (=> b!1203228 (= res!800750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545424 mask!1564))))

(assert (=> b!1203228 (= lt!545424 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)))))

(declare-fun b!1203229 () Bool)

(declare-fun call!57994 () ListLongMap!17657)

(declare-fun call!57995 () ListLongMap!17657)

(assert (=> b!1203229 (= e!683234 (= call!57994 call!57995))))

(declare-fun b!1203230 () Bool)

(declare-fun res!800744 () Bool)

(assert (=> b!1203230 (=> (not res!800744) (not e!683226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203230 (= res!800744 (validKeyInArray!0 k0!934))))

(declare-fun b!1203231 () Bool)

(declare-fun lt!545423 () Unit!39889)

(assert (=> b!1203231 (= e!683238 lt!545423)))

(declare-fun lt!545432 () Unit!39889)

(assert (=> b!1203231 (= lt!545432 call!57990)))

(assert (=> b!1203231 (= lt!545433 (+!3970 lt!545425 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1203231 call!57993))

(assert (=> b!1203231 (= lt!545423 (addStillContains!999 lt!545433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1203231 (contains!6898 call!57991 k0!934)))

(declare-fun bm!57989 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5280 (array!77979 array!77981 (_ BitVec 32) (_ BitVec 32) V!45931 V!45931 (_ BitVec 32) Int) ListLongMap!17657)

(assert (=> bm!57989 (= call!57995 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203232 () Bool)

(assert (=> b!1203232 (= e!683230 e!683231)))

(declare-fun res!800747 () Bool)

(assert (=> b!1203232 (=> res!800747 e!683231)))

(assert (=> b!1203232 (= res!800747 (not (= from!1455 i!673)))))

(declare-fun lt!545429 () ListLongMap!17657)

(declare-fun lt!545434 () array!77981)

(assert (=> b!1203232 (= lt!545429 (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3192 (Int (_ BitVec 64)) V!45931)

(assert (=> b!1203232 (= lt!545434 (array!77982 (store (arr!37635 _values!996) i!673 (ValueCellFull!14592 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38171 _values!996)))))

(declare-fun lt!545427 () ListLongMap!17657)

(assert (=> b!1203232 (= lt!545427 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1203233 () Bool)

(declare-fun lt!545422 () Unit!39889)

(assert (=> b!1203233 (= e!683233 lt!545422)))

(declare-fun call!57989 () Unit!39889)

(assert (=> b!1203233 (= lt!545422 call!57989)))

(declare-fun call!57988 () Bool)

(assert (=> b!1203233 call!57988))

(declare-fun b!1203234 () Bool)

(declare-fun e!683228 () Unit!39889)

(assert (=> b!1203234 (= e!683238 e!683228)))

(assert (=> b!1203234 (= c!117793 (and (not lt!545430) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!57990 () Bool)

(assert (=> bm!57990 (= call!57989 call!57990)))

(declare-fun b!1203235 () Bool)

(declare-fun res!800754 () Bool)

(assert (=> b!1203235 (=> (not res!800754) (not e!683226))))

(assert (=> b!1203235 (= res!800754 (and (= (size!38171 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38170 _keys!1208) (size!38171 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1203236 () Bool)

(declare-fun -!1810 (ListLongMap!17657 (_ BitVec 64)) ListLongMap!17657)

(assert (=> b!1203236 (= e!683234 (= call!57994 (-!1810 call!57995 k0!934)))))

(declare-fun b!1203237 () Bool)

(assert (=> b!1203237 call!57988))

(declare-fun lt!545428 () Unit!39889)

(assert (=> b!1203237 (= lt!545428 call!57989)))

(assert (=> b!1203237 (= e!683228 lt!545428)))

(declare-fun bm!57991 () Bool)

(assert (=> bm!57991 (= call!57994 (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203238 () Bool)

(declare-fun res!800748 () Bool)

(assert (=> b!1203238 (=> (not res!800748) (not e!683226))))

(assert (=> b!1203238 (= res!800748 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38170 _keys!1208))))))

(declare-fun mapIsEmpty!47747 () Bool)

(assert (=> mapIsEmpty!47747 mapRes!47747))

(declare-fun b!1203239 () Bool)

(declare-fun c!117791 () Bool)

(assert (=> b!1203239 (= c!117791 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545430))))

(assert (=> b!1203239 (= e!683228 e!683233)))

(declare-fun res!800749 () Bool)

(assert (=> start!100576 (=> (not res!800749) (not e!683226))))

(assert (=> start!100576 (= res!800749 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38170 _keys!1208))))))

(assert (=> start!100576 e!683226))

(assert (=> start!100576 tp_is_empty!30603))

(declare-fun array_inv!28674 (array!77979) Bool)

(assert (=> start!100576 (array_inv!28674 _keys!1208)))

(assert (=> start!100576 true))

(assert (=> start!100576 tp!90687))

(declare-fun array_inv!28675 (array!77981) Bool)

(assert (=> start!100576 (and (array_inv!28675 _values!996) e!683227)))

(declare-fun b!1203240 () Bool)

(assert (=> b!1203240 (= e!683237 e!683236)))

(declare-fun res!800745 () Bool)

(assert (=> b!1203240 (=> res!800745 e!683236)))

(assert (=> b!1203240 (= res!800745 (not (contains!6898 lt!545425 k0!934)))))

(assert (=> b!1203240 (= lt!545425 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57992 () Bool)

(assert (=> bm!57992 (= call!57988 call!57993)))

(assert (= (and start!100576 res!800749) b!1203219))

(assert (= (and b!1203219 res!800742) b!1203235))

(assert (= (and b!1203235 res!800754) b!1203221))

(assert (= (and b!1203221 res!800746) b!1203225))

(assert (= (and b!1203225 res!800741) b!1203238))

(assert (= (and b!1203238 res!800748) b!1203230))

(assert (= (and b!1203230 res!800744) b!1203218))

(assert (= (and b!1203218 res!800743) b!1203228))

(assert (= (and b!1203228 res!800750) b!1203227))

(assert (= (and b!1203227 res!800751) b!1203216))

(assert (= (and b!1203216 (not res!800752)) b!1203232))

(assert (= (and b!1203232 (not res!800747)) b!1203222))

(assert (= (and b!1203222 c!117792) b!1203236))

(assert (= (and b!1203222 (not c!117792)) b!1203229))

(assert (= (or b!1203236 b!1203229) bm!57991))

(assert (= (or b!1203236 b!1203229) bm!57989))

(assert (= (and b!1203222 (not res!800753)) b!1203240))

(assert (= (and b!1203240 (not res!800745)) b!1203220))

(assert (= (and b!1203220 c!117794) b!1203231))

(assert (= (and b!1203220 (not c!117794)) b!1203234))

(assert (= (and b!1203234 c!117793) b!1203237))

(assert (= (and b!1203234 (not c!117793)) b!1203239))

(assert (= (and b!1203239 c!117791) b!1203233))

(assert (= (and b!1203239 (not c!117791)) b!1203224))

(assert (= (or b!1203237 b!1203233) bm!57990))

(assert (= (or b!1203237 b!1203233) bm!57988))

(assert (= (or b!1203237 b!1203233) bm!57992))

(assert (= (or b!1203231 bm!57992) bm!57985))

(assert (= (or b!1203231 bm!57990) bm!57987))

(assert (= (or b!1203231 bm!57988) bm!57986))

(assert (= (and b!1203217 condMapEmpty!47747) mapIsEmpty!47747))

(assert (= (and b!1203217 (not condMapEmpty!47747)) mapNonEmpty!47747))

(get-info :version)

(assert (= (and mapNonEmpty!47747 ((_ is ValueCellFull!14592) mapValue!47747)) b!1203226))

(assert (= (and b!1203217 ((_ is ValueCellFull!14592) mapDefault!47747)) b!1203223))

(assert (= start!100576 b!1203217))

(declare-fun b_lambda!21095 () Bool)

(assert (=> (not b_lambda!21095) (not b!1203232)))

(declare-fun t!39376 () Bool)

(declare-fun tb!10699 () Bool)

(assert (=> (and start!100576 (= defaultEntry!1004 defaultEntry!1004) t!39376) tb!10699))

(declare-fun result!21975 () Bool)

(assert (=> tb!10699 (= result!21975 tp_is_empty!30603)))

(assert (=> b!1203232 t!39376))

(declare-fun b_and!42687 () Bool)

(assert (= b_and!42685 (and (=> t!39376 result!21975) b_and!42687)))

(declare-fun m!1108883 () Bool)

(assert (=> b!1203228 m!1108883))

(declare-fun m!1108885 () Bool)

(assert (=> b!1203228 m!1108885))

(declare-fun m!1108887 () Bool)

(assert (=> bm!57986 m!1108887))

(declare-fun m!1108889 () Bool)

(assert (=> b!1203232 m!1108889))

(declare-fun m!1108891 () Bool)

(assert (=> b!1203232 m!1108891))

(declare-fun m!1108893 () Bool)

(assert (=> b!1203232 m!1108893))

(declare-fun m!1108895 () Bool)

(assert (=> b!1203232 m!1108895))

(declare-fun m!1108897 () Bool)

(assert (=> b!1203218 m!1108897))

(declare-fun m!1108899 () Bool)

(assert (=> bm!57991 m!1108899))

(declare-fun m!1108901 () Bool)

(assert (=> b!1203216 m!1108901))

(declare-fun m!1108903 () Bool)

(assert (=> b!1203216 m!1108903))

(declare-fun m!1108905 () Bool)

(assert (=> start!100576 m!1108905))

(declare-fun m!1108907 () Bool)

(assert (=> start!100576 m!1108907))

(declare-fun m!1108909 () Bool)

(assert (=> bm!57985 m!1108909))

(declare-fun m!1108911 () Bool)

(assert (=> b!1203236 m!1108911))

(declare-fun m!1108913 () Bool)

(assert (=> b!1203230 m!1108913))

(declare-fun m!1108915 () Bool)

(assert (=> b!1203225 m!1108915))

(declare-fun m!1108917 () Bool)

(assert (=> b!1203219 m!1108917))

(declare-fun m!1108919 () Bool)

(assert (=> mapNonEmpty!47747 m!1108919))

(declare-fun m!1108921 () Bool)

(assert (=> b!1203240 m!1108921))

(declare-fun m!1108923 () Bool)

(assert (=> b!1203240 m!1108923))

(assert (=> bm!57989 m!1108923))

(declare-fun m!1108925 () Bool)

(assert (=> b!1203222 m!1108925))

(declare-fun m!1108927 () Bool)

(assert (=> b!1203222 m!1108927))

(declare-fun m!1108929 () Bool)

(assert (=> b!1203231 m!1108929))

(declare-fun m!1108931 () Bool)

(assert (=> b!1203231 m!1108931))

(declare-fun m!1108933 () Bool)

(assert (=> b!1203231 m!1108933))

(declare-fun m!1108935 () Bool)

(assert (=> b!1203221 m!1108935))

(declare-fun m!1108937 () Bool)

(assert (=> b!1203227 m!1108937))

(declare-fun m!1108939 () Bool)

(assert (=> bm!57987 m!1108939))

(check-sat (not b!1203228) (not b_next!25899) (not bm!57989) (not b!1203240) (not mapNonEmpty!47747) (not bm!57991) (not bm!57985) (not b!1203236) (not b!1203230) (not b!1203221) (not b!1203225) (not b!1203232) (not bm!57987) (not b_lambda!21095) b_and!42687 (not bm!57986) (not start!100576) (not b!1203219) tp_is_empty!30603 (not b!1203227) (not b!1203216) (not b!1203231) (not b!1203222))
(check-sat b_and!42687 (not b_next!25899))
(get-model)

(declare-fun b_lambda!21099 () Bool)

(assert (= b_lambda!21095 (or (and start!100576 b_free!25899) b_lambda!21099)))

(check-sat (not b!1203228) (not b_next!25899) (not bm!57989) (not b_lambda!21099) (not b!1203240) (not mapNonEmpty!47747) (not bm!57991) (not bm!57985) (not b!1203236) (not b!1203230) (not b!1203221) (not b!1203225) (not b!1203232) (not bm!57987) b_and!42687 (not bm!57986) (not start!100576) (not b!1203219) tp_is_empty!30603 (not b!1203227) (not b!1203216) (not b!1203231) (not b!1203222))
(check-sat b_and!42687 (not b_next!25899))
(get-model)

(declare-fun d!132483 () Bool)

(assert (=> d!132483 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1203219 d!132483))

(declare-fun d!132485 () Bool)

(assert (=> d!132485 (contains!6898 (+!3970 lt!545425 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!545479 () Unit!39889)

(declare-fun choose!1785 (ListLongMap!17657 (_ BitVec 64) V!45931 (_ BitVec 64)) Unit!39889)

(assert (=> d!132485 (= lt!545479 (choose!1785 lt!545425 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!132485 (contains!6898 lt!545425 k0!934)))

(assert (=> d!132485 (= (addStillContains!999 lt!545425 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944) k0!934) lt!545479)))

(declare-fun bs!34058 () Bool)

(assert (= bs!34058 d!132485))

(declare-fun m!1108999 () Bool)

(assert (=> bs!34058 m!1108999))

(assert (=> bs!34058 m!1108999))

(declare-fun m!1109001 () Bool)

(assert (=> bs!34058 m!1109001))

(declare-fun m!1109003 () Bool)

(assert (=> bs!34058 m!1109003))

(assert (=> bs!34058 m!1108921))

(assert (=> bm!57987 d!132485))

(declare-fun b!1203331 () Bool)

(declare-fun e!683293 () Bool)

(declare-fun call!58022 () Bool)

(assert (=> b!1203331 (= e!683293 call!58022)))

(declare-fun b!1203332 () Bool)

(declare-fun e!683292 () Bool)

(assert (=> b!1203332 (= e!683292 e!683293)))

(declare-fun c!117809 () Bool)

(assert (=> b!1203332 (= c!117809 (validKeyInArray!0 (select (arr!37634 lt!545424) #b00000000000000000000000000000000)))))

(declare-fun bm!58019 () Bool)

(assert (=> bm!58019 (= call!58022 (arrayNoDuplicates!0 lt!545424 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117809 (Cons!26495 (select (arr!37634 lt!545424) #b00000000000000000000000000000000) Nil!26496) Nil!26496)))))

(declare-fun d!132487 () Bool)

(declare-fun res!800803 () Bool)

(declare-fun e!683291 () Bool)

(assert (=> d!132487 (=> res!800803 e!683291)))

(assert (=> d!132487 (= res!800803 (bvsge #b00000000000000000000000000000000 (size!38170 lt!545424)))))

(assert (=> d!132487 (= (arrayNoDuplicates!0 lt!545424 #b00000000000000000000000000000000 Nil!26496) e!683291)))

(declare-fun b!1203333 () Bool)

(assert (=> b!1203333 (= e!683291 e!683292)))

(declare-fun res!800805 () Bool)

(assert (=> b!1203333 (=> (not res!800805) (not e!683292))))

(declare-fun e!683290 () Bool)

(assert (=> b!1203333 (= res!800805 (not e!683290))))

(declare-fun res!800804 () Bool)

(assert (=> b!1203333 (=> (not res!800804) (not e!683290))))

(assert (=> b!1203333 (= res!800804 (validKeyInArray!0 (select (arr!37634 lt!545424) #b00000000000000000000000000000000)))))

(declare-fun b!1203334 () Bool)

(declare-fun contains!6900 (List!26499 (_ BitVec 64)) Bool)

(assert (=> b!1203334 (= e!683290 (contains!6900 Nil!26496 (select (arr!37634 lt!545424) #b00000000000000000000000000000000)))))

(declare-fun b!1203335 () Bool)

(assert (=> b!1203335 (= e!683293 call!58022)))

(assert (= (and d!132487 (not res!800803)) b!1203333))

(assert (= (and b!1203333 res!800804) b!1203334))

(assert (= (and b!1203333 res!800805) b!1203332))

(assert (= (and b!1203332 c!117809) b!1203331))

(assert (= (and b!1203332 (not c!117809)) b!1203335))

(assert (= (or b!1203331 b!1203335) bm!58019))

(declare-fun m!1109005 () Bool)

(assert (=> b!1203332 m!1109005))

(assert (=> b!1203332 m!1109005))

(declare-fun m!1109007 () Bool)

(assert (=> b!1203332 m!1109007))

(assert (=> bm!58019 m!1109005))

(declare-fun m!1109009 () Bool)

(assert (=> bm!58019 m!1109009))

(assert (=> b!1203333 m!1109005))

(assert (=> b!1203333 m!1109005))

(assert (=> b!1203333 m!1109007))

(assert (=> b!1203334 m!1109005))

(assert (=> b!1203334 m!1109005))

(declare-fun m!1109011 () Bool)

(assert (=> b!1203334 m!1109011))

(assert (=> b!1203227 d!132487))

(declare-fun d!132489 () Bool)

(declare-fun e!683296 () Bool)

(assert (=> d!132489 e!683296))

(declare-fun res!800810 () Bool)

(assert (=> d!132489 (=> (not res!800810) (not e!683296))))

(declare-fun lt!545489 () ListLongMap!17657)

(assert (=> d!132489 (= res!800810 (contains!6898 lt!545489 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!545491 () List!26498)

(assert (=> d!132489 (= lt!545489 (ListLongMap!17658 lt!545491))))

(declare-fun lt!545490 () Unit!39889)

(declare-fun lt!545488 () Unit!39889)

(assert (=> d!132489 (= lt!545490 lt!545488)))

(declare-datatypes ((Option!682 0))(
  ( (Some!681 (v!17998 V!45931)) (None!680) )
))
(declare-fun getValueByKey!631 (List!26498 (_ BitVec 64)) Option!682)

(assert (=> d!132489 (= (getValueByKey!631 lt!545491 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!681 (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!308 (List!26498 (_ BitVec 64) V!45931) Unit!39889)

(assert (=> d!132489 (= lt!545488 (lemmaContainsTupThenGetReturnValue!308 lt!545491 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun insertStrictlySorted!401 (List!26498 (_ BitVec 64) V!45931) List!26498)

(assert (=> d!132489 (= lt!545491 (insertStrictlySorted!401 (toList!8844 (ite c!117794 lt!545433 lt!545425)) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132489 (= (+!3970 (ite c!117794 lt!545433 lt!545425) (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!545489)))

(declare-fun b!1203340 () Bool)

(declare-fun res!800811 () Bool)

(assert (=> b!1203340 (=> (not res!800811) (not e!683296))))

(assert (=> b!1203340 (= res!800811 (= (getValueByKey!631 (toList!8844 lt!545489) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!681 (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1203341 () Bool)

(declare-fun contains!6901 (List!26498 tuple2!19688) Bool)

(assert (=> b!1203341 (= e!683296 (contains!6901 (toList!8844 lt!545489) (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!132489 res!800810) b!1203340))

(assert (= (and b!1203340 res!800811) b!1203341))

(declare-fun m!1109013 () Bool)

(assert (=> d!132489 m!1109013))

(declare-fun m!1109015 () Bool)

(assert (=> d!132489 m!1109015))

(declare-fun m!1109017 () Bool)

(assert (=> d!132489 m!1109017))

(declare-fun m!1109019 () Bool)

(assert (=> d!132489 m!1109019))

(declare-fun m!1109021 () Bool)

(assert (=> b!1203340 m!1109021))

(declare-fun m!1109023 () Bool)

(assert (=> b!1203341 m!1109023))

(assert (=> bm!57986 d!132489))

(declare-fun d!132491 () Bool)

(assert (=> d!132491 (= (array_inv!28674 _keys!1208) (bvsge (size!38170 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100576 d!132491))

(declare-fun d!132493 () Bool)

(assert (=> d!132493 (= (array_inv!28675 _values!996) (bvsge (size!38171 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100576 d!132493))

(declare-fun b!1203366 () Bool)

(declare-fun e!683315 () ListLongMap!17657)

(declare-fun call!58025 () ListLongMap!17657)

(assert (=> b!1203366 (= e!683315 call!58025)))

(declare-fun b!1203367 () Bool)

(declare-fun e!683312 () Bool)

(declare-fun e!683317 () Bool)

(assert (=> b!1203367 (= e!683312 e!683317)))

(declare-fun c!117819 () Bool)

(declare-fun e!683313 () Bool)

(assert (=> b!1203367 (= c!117819 e!683313)))

(declare-fun res!800821 () Bool)

(assert (=> b!1203367 (=> (not res!800821) (not e!683313))))

(assert (=> b!1203367 (= res!800821 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 lt!545424)))))

(declare-fun b!1203368 () Bool)

(declare-fun e!683316 () Bool)

(assert (=> b!1203368 (= e!683317 e!683316)))

(declare-fun c!117821 () Bool)

(assert (=> b!1203368 (= c!117821 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 lt!545424)))))

(declare-fun b!1203369 () Bool)

(assert (=> b!1203369 (= e!683313 (validKeyInArray!0 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203369 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1203370 () Bool)

(declare-fun e!683314 () ListLongMap!17657)

(assert (=> b!1203370 (= e!683314 (ListLongMap!17658 Nil!26495))))

(declare-fun d!132495 () Bool)

(assert (=> d!132495 e!683312))

(declare-fun res!800820 () Bool)

(assert (=> d!132495 (=> (not res!800820) (not e!683312))))

(declare-fun lt!545512 () ListLongMap!17657)

(assert (=> d!132495 (= res!800820 (not (contains!6898 lt!545512 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132495 (= lt!545512 e!683314)))

(declare-fun c!117818 () Bool)

(assert (=> d!132495 (= c!117818 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 lt!545424)))))

(assert (=> d!132495 (validMask!0 mask!1564)))

(assert (=> d!132495 (= (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545512)))

(declare-fun b!1203371 () Bool)

(assert (=> b!1203371 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 lt!545424)))))

(assert (=> b!1203371 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38171 lt!545434)))))

(declare-fun e!683311 () Bool)

(declare-fun apply!960 (ListLongMap!17657 (_ BitVec 64)) V!45931)

(declare-fun get!19180 (ValueCell!14592 V!45931) V!45931)

(assert (=> b!1203371 (= e!683311 (= (apply!960 lt!545512 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58022 () Bool)

(assert (=> bm!58022 (= call!58025 (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203372 () Bool)

(assert (=> b!1203372 (= e!683314 e!683315)))

(declare-fun c!117820 () Bool)

(assert (=> b!1203372 (= c!117820 (validKeyInArray!0 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1203373 () Bool)

(assert (=> b!1203373 (= e!683316 (= lt!545512 (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203374 () Bool)

(declare-fun isEmpty!980 (ListLongMap!17657) Bool)

(assert (=> b!1203374 (= e!683316 (isEmpty!980 lt!545512))))

(declare-fun b!1203375 () Bool)

(declare-fun res!800823 () Bool)

(assert (=> b!1203375 (=> (not res!800823) (not e!683312))))

(assert (=> b!1203375 (= res!800823 (not (contains!6898 lt!545512 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203376 () Bool)

(assert (=> b!1203376 (= e!683317 e!683311)))

(assert (=> b!1203376 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 lt!545424)))))

(declare-fun res!800822 () Bool)

(assert (=> b!1203376 (= res!800822 (contains!6898 lt!545512 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203376 (=> (not res!800822) (not e!683311))))

(declare-fun b!1203377 () Bool)

(declare-fun lt!545508 () Unit!39889)

(declare-fun lt!545506 () Unit!39889)

(assert (=> b!1203377 (= lt!545508 lt!545506)))

(declare-fun lt!545510 () V!45931)

(declare-fun lt!545511 () ListLongMap!17657)

(declare-fun lt!545509 () (_ BitVec 64))

(declare-fun lt!545507 () (_ BitVec 64))

(assert (=> b!1203377 (not (contains!6898 (+!3970 lt!545511 (tuple2!19689 lt!545509 lt!545510)) lt!545507))))

(declare-fun addStillNotContains!288 (ListLongMap!17657 (_ BitVec 64) V!45931 (_ BitVec 64)) Unit!39889)

(assert (=> b!1203377 (= lt!545506 (addStillNotContains!288 lt!545511 lt!545509 lt!545510 lt!545507))))

(assert (=> b!1203377 (= lt!545507 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203377 (= lt!545510 (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203377 (= lt!545509 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1203377 (= lt!545511 call!58025)))

(assert (=> b!1203377 (= e!683315 (+!3970 call!58025 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132495 c!117818) b!1203370))

(assert (= (and d!132495 (not c!117818)) b!1203372))

(assert (= (and b!1203372 c!117820) b!1203377))

(assert (= (and b!1203372 (not c!117820)) b!1203366))

(assert (= (or b!1203377 b!1203366) bm!58022))

(assert (= (and d!132495 res!800820) b!1203375))

(assert (= (and b!1203375 res!800823) b!1203367))

(assert (= (and b!1203367 res!800821) b!1203369))

(assert (= (and b!1203367 c!117819) b!1203376))

(assert (= (and b!1203367 (not c!117819)) b!1203368))

(assert (= (and b!1203376 res!800822) b!1203371))

(assert (= (and b!1203368 c!117821) b!1203373))

(assert (= (and b!1203368 (not c!117821)) b!1203374))

(declare-fun b_lambda!21101 () Bool)

(assert (=> (not b_lambda!21101) (not b!1203371)))

(assert (=> b!1203371 t!39376))

(declare-fun b_and!42693 () Bool)

(assert (= b_and!42687 (and (=> t!39376 result!21975) b_and!42693)))

(declare-fun b_lambda!21103 () Bool)

(assert (=> (not b_lambda!21103) (not b!1203377)))

(assert (=> b!1203377 t!39376))

(declare-fun b_and!42695 () Bool)

(assert (= b_and!42693 (and (=> t!39376 result!21975) b_and!42695)))

(declare-fun m!1109025 () Bool)

(assert (=> bm!58022 m!1109025))

(declare-fun m!1109027 () Bool)

(assert (=> b!1203371 m!1109027))

(declare-fun m!1109029 () Bool)

(assert (=> b!1203371 m!1109029))

(assert (=> b!1203371 m!1108891))

(declare-fun m!1109031 () Bool)

(assert (=> b!1203371 m!1109031))

(assert (=> b!1203371 m!1108891))

(assert (=> b!1203371 m!1109027))

(declare-fun m!1109033 () Bool)

(assert (=> b!1203371 m!1109033))

(assert (=> b!1203371 m!1109029))

(assert (=> b!1203369 m!1109027))

(assert (=> b!1203369 m!1109027))

(declare-fun m!1109035 () Bool)

(assert (=> b!1203369 m!1109035))

(assert (=> b!1203372 m!1109027))

(assert (=> b!1203372 m!1109027))

(assert (=> b!1203372 m!1109035))

(declare-fun m!1109037 () Bool)

(assert (=> b!1203375 m!1109037))

(declare-fun m!1109039 () Bool)

(assert (=> b!1203374 m!1109039))

(declare-fun m!1109041 () Bool)

(assert (=> d!132495 m!1109041))

(assert (=> d!132495 m!1108917))

(assert (=> b!1203377 m!1109027))

(declare-fun m!1109043 () Bool)

(assert (=> b!1203377 m!1109043))

(assert (=> b!1203377 m!1109029))

(assert (=> b!1203377 m!1108891))

(assert (=> b!1203377 m!1109031))

(assert (=> b!1203377 m!1108891))

(declare-fun m!1109045 () Bool)

(assert (=> b!1203377 m!1109045))

(declare-fun m!1109047 () Bool)

(assert (=> b!1203377 m!1109047))

(declare-fun m!1109049 () Bool)

(assert (=> b!1203377 m!1109049))

(assert (=> b!1203377 m!1109047))

(assert (=> b!1203377 m!1109029))

(assert (=> b!1203373 m!1109025))

(assert (=> b!1203376 m!1109027))

(assert (=> b!1203376 m!1109027))

(declare-fun m!1109051 () Bool)

(assert (=> b!1203376 m!1109051))

(assert (=> bm!57991 d!132495))

(declare-fun b!1203386 () Bool)

(declare-fun e!683324 () Bool)

(declare-fun call!58028 () Bool)

(assert (=> b!1203386 (= e!683324 call!58028)))

(declare-fun d!132497 () Bool)

(declare-fun res!800829 () Bool)

(declare-fun e!683325 () Bool)

(assert (=> d!132497 (=> res!800829 e!683325)))

(assert (=> d!132497 (= res!800829 (bvsge #b00000000000000000000000000000000 (size!38170 _keys!1208)))))

(assert (=> d!132497 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!683325)))

(declare-fun b!1203387 () Bool)

(declare-fun e!683326 () Bool)

(assert (=> b!1203387 (= e!683326 call!58028)))

(declare-fun b!1203388 () Bool)

(assert (=> b!1203388 (= e!683324 e!683326)))

(declare-fun lt!545519 () (_ BitVec 64))

(assert (=> b!1203388 (= lt!545519 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!545520 () Unit!39889)

(assert (=> b!1203388 (= lt!545520 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!545519 #b00000000000000000000000000000000))))

(assert (=> b!1203388 (arrayContainsKey!0 _keys!1208 lt!545519 #b00000000000000000000000000000000)))

(declare-fun lt!545521 () Unit!39889)

(assert (=> b!1203388 (= lt!545521 lt!545520)))

(declare-fun res!800828 () Bool)

(declare-datatypes ((SeekEntryResult!9933 0))(
  ( (MissingZero!9933 (index!42103 (_ BitVec 32))) (Found!9933 (index!42104 (_ BitVec 32))) (Intermediate!9933 (undefined!10745 Bool) (index!42105 (_ BitVec 32)) (x!106362 (_ BitVec 32))) (Undefined!9933) (MissingVacant!9933 (index!42106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77979 (_ BitVec 32)) SeekEntryResult!9933)

(assert (=> b!1203388 (= res!800828 (= (seekEntryOrOpen!0 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9933 #b00000000000000000000000000000000)))))

(assert (=> b!1203388 (=> (not res!800828) (not e!683326))))

(declare-fun bm!58025 () Bool)

(assert (=> bm!58025 (= call!58028 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1203389 () Bool)

(assert (=> b!1203389 (= e!683325 e!683324)))

(declare-fun c!117824 () Bool)

(assert (=> b!1203389 (= c!117824 (validKeyInArray!0 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132497 (not res!800829)) b!1203389))

(assert (= (and b!1203389 c!117824) b!1203388))

(assert (= (and b!1203389 (not c!117824)) b!1203386))

(assert (= (and b!1203388 res!800828) b!1203387))

(assert (= (or b!1203387 b!1203386) bm!58025))

(declare-fun m!1109053 () Bool)

(assert (=> b!1203388 m!1109053))

(declare-fun m!1109055 () Bool)

(assert (=> b!1203388 m!1109055))

(declare-fun m!1109057 () Bool)

(assert (=> b!1203388 m!1109057))

(assert (=> b!1203388 m!1109053))

(declare-fun m!1109059 () Bool)

(assert (=> b!1203388 m!1109059))

(declare-fun m!1109061 () Bool)

(assert (=> bm!58025 m!1109061))

(assert (=> b!1203389 m!1109053))

(assert (=> b!1203389 m!1109053))

(declare-fun m!1109063 () Bool)

(assert (=> b!1203389 m!1109063))

(assert (=> b!1203221 d!132497))

(declare-fun b!1203390 () Bool)

(declare-fun e!683327 () Bool)

(declare-fun call!58029 () Bool)

(assert (=> b!1203390 (= e!683327 call!58029)))

(declare-fun d!132499 () Bool)

(declare-fun res!800831 () Bool)

(declare-fun e!683328 () Bool)

(assert (=> d!132499 (=> res!800831 e!683328)))

(assert (=> d!132499 (= res!800831 (bvsge #b00000000000000000000000000000000 (size!38170 lt!545424)))))

(assert (=> d!132499 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545424 mask!1564) e!683328)))

(declare-fun b!1203391 () Bool)

(declare-fun e!683329 () Bool)

(assert (=> b!1203391 (= e!683329 call!58029)))

(declare-fun b!1203392 () Bool)

(assert (=> b!1203392 (= e!683327 e!683329)))

(declare-fun lt!545522 () (_ BitVec 64))

(assert (=> b!1203392 (= lt!545522 (select (arr!37634 lt!545424) #b00000000000000000000000000000000))))

(declare-fun lt!545523 () Unit!39889)

(assert (=> b!1203392 (= lt!545523 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545424 lt!545522 #b00000000000000000000000000000000))))

(assert (=> b!1203392 (arrayContainsKey!0 lt!545424 lt!545522 #b00000000000000000000000000000000)))

(declare-fun lt!545524 () Unit!39889)

(assert (=> b!1203392 (= lt!545524 lt!545523)))

(declare-fun res!800830 () Bool)

(assert (=> b!1203392 (= res!800830 (= (seekEntryOrOpen!0 (select (arr!37634 lt!545424) #b00000000000000000000000000000000) lt!545424 mask!1564) (Found!9933 #b00000000000000000000000000000000)))))

(assert (=> b!1203392 (=> (not res!800830) (not e!683329))))

(declare-fun bm!58026 () Bool)

(assert (=> bm!58026 (= call!58029 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!545424 mask!1564))))

(declare-fun b!1203393 () Bool)

(assert (=> b!1203393 (= e!683328 e!683327)))

(declare-fun c!117825 () Bool)

(assert (=> b!1203393 (= c!117825 (validKeyInArray!0 (select (arr!37634 lt!545424) #b00000000000000000000000000000000)))))

(assert (= (and d!132499 (not res!800831)) b!1203393))

(assert (= (and b!1203393 c!117825) b!1203392))

(assert (= (and b!1203393 (not c!117825)) b!1203390))

(assert (= (and b!1203392 res!800830) b!1203391))

(assert (= (or b!1203391 b!1203390) bm!58026))

(assert (=> b!1203392 m!1109005))

(declare-fun m!1109065 () Bool)

(assert (=> b!1203392 m!1109065))

(declare-fun m!1109067 () Bool)

(assert (=> b!1203392 m!1109067))

(assert (=> b!1203392 m!1109005))

(declare-fun m!1109069 () Bool)

(assert (=> b!1203392 m!1109069))

(declare-fun m!1109071 () Bool)

(assert (=> bm!58026 m!1109071))

(assert (=> b!1203393 m!1109005))

(assert (=> b!1203393 m!1109005))

(assert (=> b!1203393 m!1109007))

(assert (=> b!1203228 d!132499))

(declare-fun d!132501 () Bool)

(declare-fun lt!545527 () ListLongMap!17657)

(assert (=> d!132501 (not (contains!6898 lt!545527 k0!934))))

(declare-fun removeStrictlySorted!93 (List!26498 (_ BitVec 64)) List!26498)

(assert (=> d!132501 (= lt!545527 (ListLongMap!17658 (removeStrictlySorted!93 (toList!8844 call!57995) k0!934)))))

(assert (=> d!132501 (= (-!1810 call!57995 k0!934) lt!545527)))

(declare-fun bs!34059 () Bool)

(assert (= bs!34059 d!132501))

(declare-fun m!1109073 () Bool)

(assert (=> bs!34059 m!1109073))

(declare-fun m!1109075 () Bool)

(assert (=> bs!34059 m!1109075))

(assert (=> b!1203236 d!132501))

(declare-fun b!1203394 () Bool)

(declare-fun e!683334 () ListLongMap!17657)

(declare-fun call!58030 () ListLongMap!17657)

(assert (=> b!1203394 (= e!683334 call!58030)))

(declare-fun b!1203395 () Bool)

(declare-fun e!683331 () Bool)

(declare-fun e!683336 () Bool)

(assert (=> b!1203395 (= e!683331 e!683336)))

(declare-fun c!117827 () Bool)

(declare-fun e!683332 () Bool)

(assert (=> b!1203395 (= c!117827 e!683332)))

(declare-fun res!800833 () Bool)

(assert (=> b!1203395 (=> (not res!800833) (not e!683332))))

(assert (=> b!1203395 (= res!800833 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 _keys!1208)))))

(declare-fun b!1203396 () Bool)

(declare-fun e!683335 () Bool)

(assert (=> b!1203396 (= e!683336 e!683335)))

(declare-fun c!117829 () Bool)

(assert (=> b!1203396 (= c!117829 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 _keys!1208)))))

(declare-fun b!1203397 () Bool)

(assert (=> b!1203397 (= e!683332 (validKeyInArray!0 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203397 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1203398 () Bool)

(declare-fun e!683333 () ListLongMap!17657)

(assert (=> b!1203398 (= e!683333 (ListLongMap!17658 Nil!26495))))

(declare-fun d!132503 () Bool)

(assert (=> d!132503 e!683331))

(declare-fun res!800832 () Bool)

(assert (=> d!132503 (=> (not res!800832) (not e!683331))))

(declare-fun lt!545534 () ListLongMap!17657)

(assert (=> d!132503 (= res!800832 (not (contains!6898 lt!545534 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132503 (= lt!545534 e!683333)))

(declare-fun c!117826 () Bool)

(assert (=> d!132503 (= c!117826 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 _keys!1208)))))

(assert (=> d!132503 (validMask!0 mask!1564)))

(assert (=> d!132503 (= (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545534)))

(declare-fun b!1203399 () Bool)

(assert (=> b!1203399 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 _keys!1208)))))

(assert (=> b!1203399 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38171 _values!996)))))

(declare-fun e!683330 () Bool)

(assert (=> b!1203399 (= e!683330 (= (apply!960 lt!545534 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58027 () Bool)

(assert (=> bm!58027 (= call!58030 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203400 () Bool)

(assert (=> b!1203400 (= e!683333 e!683334)))

(declare-fun c!117828 () Bool)

(assert (=> b!1203400 (= c!117828 (validKeyInArray!0 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1203401 () Bool)

(assert (=> b!1203401 (= e!683335 (= lt!545534 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203402 () Bool)

(assert (=> b!1203402 (= e!683335 (isEmpty!980 lt!545534))))

(declare-fun b!1203403 () Bool)

(declare-fun res!800835 () Bool)

(assert (=> b!1203403 (=> (not res!800835) (not e!683331))))

(assert (=> b!1203403 (= res!800835 (not (contains!6898 lt!545534 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203404 () Bool)

(assert (=> b!1203404 (= e!683336 e!683330)))

(assert (=> b!1203404 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 _keys!1208)))))

(declare-fun res!800834 () Bool)

(assert (=> b!1203404 (= res!800834 (contains!6898 lt!545534 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203404 (=> (not res!800834) (not e!683330))))

(declare-fun b!1203405 () Bool)

(declare-fun lt!545530 () Unit!39889)

(declare-fun lt!545528 () Unit!39889)

(assert (=> b!1203405 (= lt!545530 lt!545528)))

(declare-fun lt!545532 () V!45931)

(declare-fun lt!545529 () (_ BitVec 64))

(declare-fun lt!545531 () (_ BitVec 64))

(declare-fun lt!545533 () ListLongMap!17657)

(assert (=> b!1203405 (not (contains!6898 (+!3970 lt!545533 (tuple2!19689 lt!545531 lt!545532)) lt!545529))))

(assert (=> b!1203405 (= lt!545528 (addStillNotContains!288 lt!545533 lt!545531 lt!545532 lt!545529))))

(assert (=> b!1203405 (= lt!545529 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203405 (= lt!545532 (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203405 (= lt!545531 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1203405 (= lt!545533 call!58030)))

(assert (=> b!1203405 (= e!683334 (+!3970 call!58030 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132503 c!117826) b!1203398))

(assert (= (and d!132503 (not c!117826)) b!1203400))

(assert (= (and b!1203400 c!117828) b!1203405))

(assert (= (and b!1203400 (not c!117828)) b!1203394))

(assert (= (or b!1203405 b!1203394) bm!58027))

(assert (= (and d!132503 res!800832) b!1203403))

(assert (= (and b!1203403 res!800835) b!1203395))

(assert (= (and b!1203395 res!800833) b!1203397))

(assert (= (and b!1203395 c!117827) b!1203404))

(assert (= (and b!1203395 (not c!117827)) b!1203396))

(assert (= (and b!1203404 res!800834) b!1203399))

(assert (= (and b!1203396 c!117829) b!1203401))

(assert (= (and b!1203396 (not c!117829)) b!1203402))

(declare-fun b_lambda!21105 () Bool)

(assert (=> (not b_lambda!21105) (not b!1203399)))

(assert (=> b!1203399 t!39376))

(declare-fun b_and!42697 () Bool)

(assert (= b_and!42695 (and (=> t!39376 result!21975) b_and!42697)))

(declare-fun b_lambda!21107 () Bool)

(assert (=> (not b_lambda!21107) (not b!1203405)))

(assert (=> b!1203405 t!39376))

(declare-fun b_and!42699 () Bool)

(assert (= b_and!42697 (and (=> t!39376 result!21975) b_and!42699)))

(declare-fun m!1109077 () Bool)

(assert (=> bm!58027 m!1109077))

(declare-fun m!1109079 () Bool)

(assert (=> b!1203399 m!1109079))

(declare-fun m!1109081 () Bool)

(assert (=> b!1203399 m!1109081))

(assert (=> b!1203399 m!1108891))

(declare-fun m!1109083 () Bool)

(assert (=> b!1203399 m!1109083))

(assert (=> b!1203399 m!1108891))

(assert (=> b!1203399 m!1109079))

(declare-fun m!1109085 () Bool)

(assert (=> b!1203399 m!1109085))

(assert (=> b!1203399 m!1109081))

(assert (=> b!1203397 m!1109079))

(assert (=> b!1203397 m!1109079))

(declare-fun m!1109087 () Bool)

(assert (=> b!1203397 m!1109087))

(assert (=> b!1203400 m!1109079))

(assert (=> b!1203400 m!1109079))

(assert (=> b!1203400 m!1109087))

(declare-fun m!1109089 () Bool)

(assert (=> b!1203403 m!1109089))

(declare-fun m!1109091 () Bool)

(assert (=> b!1203402 m!1109091))

(declare-fun m!1109093 () Bool)

(assert (=> d!132503 m!1109093))

(assert (=> d!132503 m!1108917))

(assert (=> b!1203405 m!1109079))

(declare-fun m!1109095 () Bool)

(assert (=> b!1203405 m!1109095))

(assert (=> b!1203405 m!1109081))

(assert (=> b!1203405 m!1108891))

(assert (=> b!1203405 m!1109083))

(assert (=> b!1203405 m!1108891))

(declare-fun m!1109097 () Bool)

(assert (=> b!1203405 m!1109097))

(declare-fun m!1109099 () Bool)

(assert (=> b!1203405 m!1109099))

(declare-fun m!1109101 () Bool)

(assert (=> b!1203405 m!1109101))

(assert (=> b!1203405 m!1109099))

(assert (=> b!1203405 m!1109081))

(assert (=> b!1203401 m!1109077))

(assert (=> b!1203404 m!1109079))

(assert (=> b!1203404 m!1109079))

(declare-fun m!1109103 () Bool)

(assert (=> b!1203404 m!1109103))

(assert (=> bm!57989 d!132503))

(declare-fun d!132505 () Bool)

(declare-fun e!683337 () Bool)

(assert (=> d!132505 e!683337))

(declare-fun res!800836 () Bool)

(assert (=> d!132505 (=> (not res!800836) (not e!683337))))

(declare-fun lt!545536 () ListLongMap!17657)

(assert (=> d!132505 (= res!800836 (contains!6898 lt!545536 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!545538 () List!26498)

(assert (=> d!132505 (= lt!545536 (ListLongMap!17658 lt!545538))))

(declare-fun lt!545537 () Unit!39889)

(declare-fun lt!545535 () Unit!39889)

(assert (=> d!132505 (= lt!545537 lt!545535)))

(assert (=> d!132505 (= (getValueByKey!631 lt!545538 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!681 (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132505 (= lt!545535 (lemmaContainsTupThenGetReturnValue!308 lt!545538 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132505 (= lt!545538 (insertStrictlySorted!401 (toList!8844 lt!545425) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132505 (= (+!3970 lt!545425 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!545536)))

(declare-fun b!1203406 () Bool)

(declare-fun res!800837 () Bool)

(assert (=> b!1203406 (=> (not res!800837) (not e!683337))))

(assert (=> b!1203406 (= res!800837 (= (getValueByKey!631 (toList!8844 lt!545536) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!681 (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1203407 () Bool)

(assert (=> b!1203407 (= e!683337 (contains!6901 (toList!8844 lt!545536) (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!132505 res!800836) b!1203406))

(assert (= (and b!1203406 res!800837) b!1203407))

(declare-fun m!1109105 () Bool)

(assert (=> d!132505 m!1109105))

(declare-fun m!1109107 () Bool)

(assert (=> d!132505 m!1109107))

(declare-fun m!1109109 () Bool)

(assert (=> d!132505 m!1109109))

(declare-fun m!1109111 () Bool)

(assert (=> d!132505 m!1109111))

(declare-fun m!1109113 () Bool)

(assert (=> b!1203406 m!1109113))

(declare-fun m!1109115 () Bool)

(assert (=> b!1203407 m!1109115))

(assert (=> b!1203231 d!132505))

(declare-fun d!132507 () Bool)

(assert (=> d!132507 (contains!6898 (+!3970 lt!545433 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!545539 () Unit!39889)

(assert (=> d!132507 (= lt!545539 (choose!1785 lt!545433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!132507 (contains!6898 lt!545433 k0!934)))

(assert (=> d!132507 (= (addStillContains!999 lt!545433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!545539)))

(declare-fun bs!34060 () Bool)

(assert (= bs!34060 d!132507))

(declare-fun m!1109117 () Bool)

(assert (=> bs!34060 m!1109117))

(assert (=> bs!34060 m!1109117))

(declare-fun m!1109119 () Bool)

(assert (=> bs!34060 m!1109119))

(declare-fun m!1109121 () Bool)

(assert (=> bs!34060 m!1109121))

(declare-fun m!1109123 () Bool)

(assert (=> bs!34060 m!1109123))

(assert (=> b!1203231 d!132507))

(declare-fun d!132509 () Bool)

(declare-fun e!683343 () Bool)

(assert (=> d!132509 e!683343))

(declare-fun res!800840 () Bool)

(assert (=> d!132509 (=> res!800840 e!683343)))

(declare-fun lt!545550 () Bool)

(assert (=> d!132509 (= res!800840 (not lt!545550))))

(declare-fun lt!545549 () Bool)

(assert (=> d!132509 (= lt!545550 lt!545549)))

(declare-fun lt!545548 () Unit!39889)

(declare-fun e!683342 () Unit!39889)

(assert (=> d!132509 (= lt!545548 e!683342)))

(declare-fun c!117832 () Bool)

(assert (=> d!132509 (= c!117832 lt!545549)))

(declare-fun containsKey!587 (List!26498 (_ BitVec 64)) Bool)

(assert (=> d!132509 (= lt!545549 (containsKey!587 (toList!8844 call!57991) k0!934))))

(assert (=> d!132509 (= (contains!6898 call!57991 k0!934) lt!545550)))

(declare-fun b!1203414 () Bool)

(declare-fun lt!545551 () Unit!39889)

(assert (=> b!1203414 (= e!683342 lt!545551)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!417 (List!26498 (_ BitVec 64)) Unit!39889)

(assert (=> b!1203414 (= lt!545551 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 call!57991) k0!934))))

(declare-fun isDefined!456 (Option!682) Bool)

(assert (=> b!1203414 (isDefined!456 (getValueByKey!631 (toList!8844 call!57991) k0!934))))

(declare-fun b!1203415 () Bool)

(declare-fun Unit!39895 () Unit!39889)

(assert (=> b!1203415 (= e!683342 Unit!39895)))

(declare-fun b!1203416 () Bool)

(assert (=> b!1203416 (= e!683343 (isDefined!456 (getValueByKey!631 (toList!8844 call!57991) k0!934)))))

(assert (= (and d!132509 c!117832) b!1203414))

(assert (= (and d!132509 (not c!117832)) b!1203415))

(assert (= (and d!132509 (not res!800840)) b!1203416))

(declare-fun m!1109125 () Bool)

(assert (=> d!132509 m!1109125))

(declare-fun m!1109127 () Bool)

(assert (=> b!1203414 m!1109127))

(declare-fun m!1109129 () Bool)

(assert (=> b!1203414 m!1109129))

(assert (=> b!1203414 m!1109129))

(declare-fun m!1109131 () Bool)

(assert (=> b!1203414 m!1109131))

(assert (=> b!1203416 m!1109129))

(assert (=> b!1203416 m!1109129))

(assert (=> b!1203416 m!1109131))

(assert (=> b!1203231 d!132509))

(declare-fun call!58035 () ListLongMap!17657)

(declare-fun bm!58032 () Bool)

(assert (=> bm!58032 (= call!58035 (getCurrentListMapNoExtraKeys!5280 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)) (array!77982 (store (arr!37635 _values!996) i!673 (ValueCellFull!14592 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38171 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58033 () Bool)

(declare-fun call!58036 () ListLongMap!17657)

(assert (=> bm!58033 (= call!58036 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203423 () Bool)

(declare-fun e!683349 () Bool)

(assert (=> b!1203423 (= e!683349 (= call!58035 call!58036))))

(assert (=> b!1203423 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38171 _values!996)))))

(declare-fun b!1203424 () Bool)

(assert (=> b!1203424 (= e!683349 (= call!58035 (-!1810 call!58036 k0!934)))))

(assert (=> b!1203424 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38171 _values!996)))))

(declare-fun b!1203425 () Bool)

(declare-fun e!683348 () Bool)

(assert (=> b!1203425 (= e!683348 e!683349)))

(declare-fun c!117835 () Bool)

(assert (=> b!1203425 (= c!117835 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!132511 () Bool)

(assert (=> d!132511 e!683348))

(declare-fun res!800843 () Bool)

(assert (=> d!132511 (=> (not res!800843) (not e!683348))))

(assert (=> d!132511 (= res!800843 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38170 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38170 _keys!1208))))))))

(declare-fun lt!545554 () Unit!39889)

(declare-fun choose!1786 (array!77979 array!77981 (_ BitVec 32) (_ BitVec 32) V!45931 V!45931 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39889)

(assert (=> d!132511 (= lt!545554 (choose!1786 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132511 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 _keys!1208)))))

(assert (=> d!132511 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1016 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545554)))

(assert (= (and d!132511 res!800843) b!1203425))

(assert (= (and b!1203425 c!117835) b!1203424))

(assert (= (and b!1203425 (not c!117835)) b!1203423))

(assert (= (or b!1203424 b!1203423) bm!58033))

(assert (= (or b!1203424 b!1203423) bm!58032))

(declare-fun b_lambda!21109 () Bool)

(assert (=> (not b_lambda!21109) (not bm!58032)))

(assert (=> bm!58032 t!39376))

(declare-fun b_and!42701 () Bool)

(assert (= b_and!42699 (and (=> t!39376 result!21975) b_and!42701)))

(assert (=> bm!58032 m!1108885))

(assert (=> bm!58032 m!1108891))

(assert (=> bm!58032 m!1108893))

(declare-fun m!1109133 () Bool)

(assert (=> bm!58032 m!1109133))

(assert (=> bm!58033 m!1108923))

(declare-fun m!1109135 () Bool)

(assert (=> b!1203424 m!1109135))

(declare-fun m!1109137 () Bool)

(assert (=> d!132511 m!1109137))

(assert (=> b!1203222 d!132511))

(declare-fun d!132513 () Bool)

(assert (=> d!132513 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203230 d!132513))

(declare-fun b!1203426 () Bool)

(declare-fun e!683353 () Bool)

(declare-fun call!58037 () Bool)

(assert (=> b!1203426 (= e!683353 call!58037)))

(declare-fun b!1203427 () Bool)

(declare-fun e!683352 () Bool)

(assert (=> b!1203427 (= e!683352 e!683353)))

(declare-fun c!117836 () Bool)

(assert (=> b!1203427 (= c!117836 (validKeyInArray!0 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!58034 () Bool)

(assert (=> bm!58034 (= call!58037 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117836 (Cons!26495 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) Nil!26496) Nil!26496)))))

(declare-fun d!132515 () Bool)

(declare-fun res!800844 () Bool)

(declare-fun e!683351 () Bool)

(assert (=> d!132515 (=> res!800844 e!683351)))

(assert (=> d!132515 (= res!800844 (bvsge #b00000000000000000000000000000000 (size!38170 _keys!1208)))))

(assert (=> d!132515 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26496) e!683351)))

(declare-fun b!1203428 () Bool)

(assert (=> b!1203428 (= e!683351 e!683352)))

(declare-fun res!800846 () Bool)

(assert (=> b!1203428 (=> (not res!800846) (not e!683352))))

(declare-fun e!683350 () Bool)

(assert (=> b!1203428 (= res!800846 (not e!683350))))

(declare-fun res!800845 () Bool)

(assert (=> b!1203428 (=> (not res!800845) (not e!683350))))

(assert (=> b!1203428 (= res!800845 (validKeyInArray!0 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1203429 () Bool)

(assert (=> b!1203429 (= e!683350 (contains!6900 Nil!26496 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1203430 () Bool)

(assert (=> b!1203430 (= e!683353 call!58037)))

(assert (= (and d!132515 (not res!800844)) b!1203428))

(assert (= (and b!1203428 res!800845) b!1203429))

(assert (= (and b!1203428 res!800846) b!1203427))

(assert (= (and b!1203427 c!117836) b!1203426))

(assert (= (and b!1203427 (not c!117836)) b!1203430))

(assert (= (or b!1203426 b!1203430) bm!58034))

(assert (=> b!1203427 m!1109053))

(assert (=> b!1203427 m!1109053))

(assert (=> b!1203427 m!1109063))

(assert (=> bm!58034 m!1109053))

(declare-fun m!1109139 () Bool)

(assert (=> bm!58034 m!1109139))

(assert (=> b!1203428 m!1109053))

(assert (=> b!1203428 m!1109053))

(assert (=> b!1203428 m!1109063))

(assert (=> b!1203429 m!1109053))

(assert (=> b!1203429 m!1109053))

(declare-fun m!1109141 () Bool)

(assert (=> b!1203429 m!1109141))

(assert (=> b!1203225 d!132515))

(declare-fun b!1203431 () Bool)

(declare-fun e!683358 () ListLongMap!17657)

(declare-fun call!58038 () ListLongMap!17657)

(assert (=> b!1203431 (= e!683358 call!58038)))

(declare-fun b!1203432 () Bool)

(declare-fun e!683355 () Bool)

(declare-fun e!683360 () Bool)

(assert (=> b!1203432 (= e!683355 e!683360)))

(declare-fun c!117838 () Bool)

(declare-fun e!683356 () Bool)

(assert (=> b!1203432 (= c!117838 e!683356)))

(declare-fun res!800848 () Bool)

(assert (=> b!1203432 (=> (not res!800848) (not e!683356))))

(assert (=> b!1203432 (= res!800848 (bvslt from!1455 (size!38170 lt!545424)))))

(declare-fun b!1203433 () Bool)

(declare-fun e!683359 () Bool)

(assert (=> b!1203433 (= e!683360 e!683359)))

(declare-fun c!117840 () Bool)

(assert (=> b!1203433 (= c!117840 (bvslt from!1455 (size!38170 lt!545424)))))

(declare-fun b!1203434 () Bool)

(assert (=> b!1203434 (= e!683356 (validKeyInArray!0 (select (arr!37634 lt!545424) from!1455)))))

(assert (=> b!1203434 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1203435 () Bool)

(declare-fun e!683357 () ListLongMap!17657)

(assert (=> b!1203435 (= e!683357 (ListLongMap!17658 Nil!26495))))

(declare-fun d!132517 () Bool)

(assert (=> d!132517 e!683355))

(declare-fun res!800847 () Bool)

(assert (=> d!132517 (=> (not res!800847) (not e!683355))))

(declare-fun lt!545561 () ListLongMap!17657)

(assert (=> d!132517 (= res!800847 (not (contains!6898 lt!545561 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132517 (= lt!545561 e!683357)))

(declare-fun c!117837 () Bool)

(assert (=> d!132517 (= c!117837 (bvsge from!1455 (size!38170 lt!545424)))))

(assert (=> d!132517 (validMask!0 mask!1564)))

(assert (=> d!132517 (= (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!545561)))

(declare-fun b!1203436 () Bool)

(assert (=> b!1203436 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38170 lt!545424)))))

(assert (=> b!1203436 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38171 lt!545434)))))

(declare-fun e!683354 () Bool)

(assert (=> b!1203436 (= e!683354 (= (apply!960 lt!545561 (select (arr!37634 lt!545424) from!1455)) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58035 () Bool)

(assert (=> bm!58035 (= call!58038 (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203437 () Bool)

(assert (=> b!1203437 (= e!683357 e!683358)))

(declare-fun c!117839 () Bool)

(assert (=> b!1203437 (= c!117839 (validKeyInArray!0 (select (arr!37634 lt!545424) from!1455)))))

(declare-fun b!1203438 () Bool)

(assert (=> b!1203438 (= e!683359 (= lt!545561 (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203439 () Bool)

(assert (=> b!1203439 (= e!683359 (isEmpty!980 lt!545561))))

(declare-fun b!1203440 () Bool)

(declare-fun res!800850 () Bool)

(assert (=> b!1203440 (=> (not res!800850) (not e!683355))))

(assert (=> b!1203440 (= res!800850 (not (contains!6898 lt!545561 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203441 () Bool)

(assert (=> b!1203441 (= e!683360 e!683354)))

(assert (=> b!1203441 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38170 lt!545424)))))

(declare-fun res!800849 () Bool)

(assert (=> b!1203441 (= res!800849 (contains!6898 lt!545561 (select (arr!37634 lt!545424) from!1455)))))

(assert (=> b!1203441 (=> (not res!800849) (not e!683354))))

(declare-fun b!1203442 () Bool)

(declare-fun lt!545557 () Unit!39889)

(declare-fun lt!545555 () Unit!39889)

(assert (=> b!1203442 (= lt!545557 lt!545555)))

(declare-fun lt!545558 () (_ BitVec 64))

(declare-fun lt!545559 () V!45931)

(declare-fun lt!545560 () ListLongMap!17657)

(declare-fun lt!545556 () (_ BitVec 64))

(assert (=> b!1203442 (not (contains!6898 (+!3970 lt!545560 (tuple2!19689 lt!545558 lt!545559)) lt!545556))))

(assert (=> b!1203442 (= lt!545555 (addStillNotContains!288 lt!545560 lt!545558 lt!545559 lt!545556))))

(assert (=> b!1203442 (= lt!545556 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203442 (= lt!545559 (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203442 (= lt!545558 (select (arr!37634 lt!545424) from!1455))))

(assert (=> b!1203442 (= lt!545560 call!58038)))

(assert (=> b!1203442 (= e!683358 (+!3970 call!58038 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132517 c!117837) b!1203435))

(assert (= (and d!132517 (not c!117837)) b!1203437))

(assert (= (and b!1203437 c!117839) b!1203442))

(assert (= (and b!1203437 (not c!117839)) b!1203431))

(assert (= (or b!1203442 b!1203431) bm!58035))

(assert (= (and d!132517 res!800847) b!1203440))

(assert (= (and b!1203440 res!800850) b!1203432))

(assert (= (and b!1203432 res!800848) b!1203434))

(assert (= (and b!1203432 c!117838) b!1203441))

(assert (= (and b!1203432 (not c!117838)) b!1203433))

(assert (= (and b!1203441 res!800849) b!1203436))

(assert (= (and b!1203433 c!117840) b!1203438))

(assert (= (and b!1203433 (not c!117840)) b!1203439))

(declare-fun b_lambda!21111 () Bool)

(assert (=> (not b_lambda!21111) (not b!1203436)))

(assert (=> b!1203436 t!39376))

(declare-fun b_and!42703 () Bool)

(assert (= b_and!42701 (and (=> t!39376 result!21975) b_and!42703)))

(declare-fun b_lambda!21113 () Bool)

(assert (=> (not b_lambda!21113) (not b!1203442)))

(assert (=> b!1203442 t!39376))

(declare-fun b_and!42705 () Bool)

(assert (= b_and!42703 (and (=> t!39376 result!21975) b_and!42705)))

(declare-fun m!1109143 () Bool)

(assert (=> bm!58035 m!1109143))

(declare-fun m!1109145 () Bool)

(assert (=> b!1203436 m!1109145))

(declare-fun m!1109147 () Bool)

(assert (=> b!1203436 m!1109147))

(assert (=> b!1203436 m!1108891))

(declare-fun m!1109149 () Bool)

(assert (=> b!1203436 m!1109149))

(assert (=> b!1203436 m!1108891))

(assert (=> b!1203436 m!1109145))

(declare-fun m!1109151 () Bool)

(assert (=> b!1203436 m!1109151))

(assert (=> b!1203436 m!1109147))

(assert (=> b!1203434 m!1109145))

(assert (=> b!1203434 m!1109145))

(declare-fun m!1109153 () Bool)

(assert (=> b!1203434 m!1109153))

(assert (=> b!1203437 m!1109145))

(assert (=> b!1203437 m!1109145))

(assert (=> b!1203437 m!1109153))

(declare-fun m!1109155 () Bool)

(assert (=> b!1203440 m!1109155))

(declare-fun m!1109157 () Bool)

(assert (=> b!1203439 m!1109157))

(declare-fun m!1109159 () Bool)

(assert (=> d!132517 m!1109159))

(assert (=> d!132517 m!1108917))

(assert (=> b!1203442 m!1109145))

(declare-fun m!1109161 () Bool)

(assert (=> b!1203442 m!1109161))

(assert (=> b!1203442 m!1109147))

(assert (=> b!1203442 m!1108891))

(assert (=> b!1203442 m!1109149))

(assert (=> b!1203442 m!1108891))

(declare-fun m!1109163 () Bool)

(assert (=> b!1203442 m!1109163))

(declare-fun m!1109165 () Bool)

(assert (=> b!1203442 m!1109165))

(declare-fun m!1109167 () Bool)

(assert (=> b!1203442 m!1109167))

(assert (=> b!1203442 m!1109165))

(assert (=> b!1203442 m!1109147))

(assert (=> b!1203438 m!1109143))

(assert (=> b!1203441 m!1109145))

(assert (=> b!1203441 m!1109145))

(declare-fun m!1109169 () Bool)

(assert (=> b!1203441 m!1109169))

(assert (=> b!1203232 d!132517))

(declare-fun b!1203443 () Bool)

(declare-fun e!683365 () ListLongMap!17657)

(declare-fun call!58039 () ListLongMap!17657)

(assert (=> b!1203443 (= e!683365 call!58039)))

(declare-fun b!1203444 () Bool)

(declare-fun e!683362 () Bool)

(declare-fun e!683367 () Bool)

(assert (=> b!1203444 (= e!683362 e!683367)))

(declare-fun c!117842 () Bool)

(declare-fun e!683363 () Bool)

(assert (=> b!1203444 (= c!117842 e!683363)))

(declare-fun res!800852 () Bool)

(assert (=> b!1203444 (=> (not res!800852) (not e!683363))))

(assert (=> b!1203444 (= res!800852 (bvslt from!1455 (size!38170 _keys!1208)))))

(declare-fun b!1203445 () Bool)

(declare-fun e!683366 () Bool)

(assert (=> b!1203445 (= e!683367 e!683366)))

(declare-fun c!117844 () Bool)

(assert (=> b!1203445 (= c!117844 (bvslt from!1455 (size!38170 _keys!1208)))))

(declare-fun b!1203446 () Bool)

(assert (=> b!1203446 (= e!683363 (validKeyInArray!0 (select (arr!37634 _keys!1208) from!1455)))))

(assert (=> b!1203446 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1203447 () Bool)

(declare-fun e!683364 () ListLongMap!17657)

(assert (=> b!1203447 (= e!683364 (ListLongMap!17658 Nil!26495))))

(declare-fun d!132519 () Bool)

(assert (=> d!132519 e!683362))

(declare-fun res!800851 () Bool)

(assert (=> d!132519 (=> (not res!800851) (not e!683362))))

(declare-fun lt!545568 () ListLongMap!17657)

(assert (=> d!132519 (= res!800851 (not (contains!6898 lt!545568 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132519 (= lt!545568 e!683364)))

(declare-fun c!117841 () Bool)

(assert (=> d!132519 (= c!117841 (bvsge from!1455 (size!38170 _keys!1208)))))

(assert (=> d!132519 (validMask!0 mask!1564)))

(assert (=> d!132519 (= (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!545568)))

(declare-fun b!1203448 () Bool)

(assert (=> b!1203448 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38170 _keys!1208)))))

(assert (=> b!1203448 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38171 _values!996)))))

(declare-fun e!683361 () Bool)

(assert (=> b!1203448 (= e!683361 (= (apply!960 lt!545568 (select (arr!37634 _keys!1208) from!1455)) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58036 () Bool)

(assert (=> bm!58036 (= call!58039 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203449 () Bool)

(assert (=> b!1203449 (= e!683364 e!683365)))

(declare-fun c!117843 () Bool)

(assert (=> b!1203449 (= c!117843 (validKeyInArray!0 (select (arr!37634 _keys!1208) from!1455)))))

(declare-fun b!1203450 () Bool)

(assert (=> b!1203450 (= e!683366 (= lt!545568 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203451 () Bool)

(assert (=> b!1203451 (= e!683366 (isEmpty!980 lt!545568))))

(declare-fun b!1203452 () Bool)

(declare-fun res!800854 () Bool)

(assert (=> b!1203452 (=> (not res!800854) (not e!683362))))

(assert (=> b!1203452 (= res!800854 (not (contains!6898 lt!545568 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203453 () Bool)

(assert (=> b!1203453 (= e!683367 e!683361)))

(assert (=> b!1203453 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38170 _keys!1208)))))

(declare-fun res!800853 () Bool)

(assert (=> b!1203453 (= res!800853 (contains!6898 lt!545568 (select (arr!37634 _keys!1208) from!1455)))))

(assert (=> b!1203453 (=> (not res!800853) (not e!683361))))

(declare-fun b!1203454 () Bool)

(declare-fun lt!545564 () Unit!39889)

(declare-fun lt!545562 () Unit!39889)

(assert (=> b!1203454 (= lt!545564 lt!545562)))

(declare-fun lt!545566 () V!45931)

(declare-fun lt!545563 () (_ BitVec 64))

(declare-fun lt!545565 () (_ BitVec 64))

(declare-fun lt!545567 () ListLongMap!17657)

(assert (=> b!1203454 (not (contains!6898 (+!3970 lt!545567 (tuple2!19689 lt!545565 lt!545566)) lt!545563))))

(assert (=> b!1203454 (= lt!545562 (addStillNotContains!288 lt!545567 lt!545565 lt!545566 lt!545563))))

(assert (=> b!1203454 (= lt!545563 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203454 (= lt!545566 (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203454 (= lt!545565 (select (arr!37634 _keys!1208) from!1455))))

(assert (=> b!1203454 (= lt!545567 call!58039)))

(assert (=> b!1203454 (= e!683365 (+!3970 call!58039 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132519 c!117841) b!1203447))

(assert (= (and d!132519 (not c!117841)) b!1203449))

(assert (= (and b!1203449 c!117843) b!1203454))

(assert (= (and b!1203449 (not c!117843)) b!1203443))

(assert (= (or b!1203454 b!1203443) bm!58036))

(assert (= (and d!132519 res!800851) b!1203452))

(assert (= (and b!1203452 res!800854) b!1203444))

(assert (= (and b!1203444 res!800852) b!1203446))

(assert (= (and b!1203444 c!117842) b!1203453))

(assert (= (and b!1203444 (not c!117842)) b!1203445))

(assert (= (and b!1203453 res!800853) b!1203448))

(assert (= (and b!1203445 c!117844) b!1203450))

(assert (= (and b!1203445 (not c!117844)) b!1203451))

(declare-fun b_lambda!21115 () Bool)

(assert (=> (not b_lambda!21115) (not b!1203448)))

(assert (=> b!1203448 t!39376))

(declare-fun b_and!42707 () Bool)

(assert (= b_and!42705 (and (=> t!39376 result!21975) b_and!42707)))

(declare-fun b_lambda!21117 () Bool)

(assert (=> (not b_lambda!21117) (not b!1203454)))

(assert (=> b!1203454 t!39376))

(declare-fun b_and!42709 () Bool)

(assert (= b_and!42707 (and (=> t!39376 result!21975) b_and!42709)))

(declare-fun m!1109171 () Bool)

(assert (=> bm!58036 m!1109171))

(assert (=> b!1203448 m!1108925))

(declare-fun m!1109173 () Bool)

(assert (=> b!1203448 m!1109173))

(assert (=> b!1203448 m!1108891))

(declare-fun m!1109175 () Bool)

(assert (=> b!1203448 m!1109175))

(assert (=> b!1203448 m!1108891))

(assert (=> b!1203448 m!1108925))

(declare-fun m!1109177 () Bool)

(assert (=> b!1203448 m!1109177))

(assert (=> b!1203448 m!1109173))

(assert (=> b!1203446 m!1108925))

(assert (=> b!1203446 m!1108925))

(declare-fun m!1109179 () Bool)

(assert (=> b!1203446 m!1109179))

(assert (=> b!1203449 m!1108925))

(assert (=> b!1203449 m!1108925))

(assert (=> b!1203449 m!1109179))

(declare-fun m!1109181 () Bool)

(assert (=> b!1203452 m!1109181))

(declare-fun m!1109183 () Bool)

(assert (=> b!1203451 m!1109183))

(declare-fun m!1109185 () Bool)

(assert (=> d!132519 m!1109185))

(assert (=> d!132519 m!1108917))

(assert (=> b!1203454 m!1108925))

(declare-fun m!1109187 () Bool)

(assert (=> b!1203454 m!1109187))

(assert (=> b!1203454 m!1109173))

(assert (=> b!1203454 m!1108891))

(assert (=> b!1203454 m!1109175))

(assert (=> b!1203454 m!1108891))

(declare-fun m!1109189 () Bool)

(assert (=> b!1203454 m!1109189))

(declare-fun m!1109191 () Bool)

(assert (=> b!1203454 m!1109191))

(declare-fun m!1109193 () Bool)

(assert (=> b!1203454 m!1109193))

(assert (=> b!1203454 m!1109191))

(assert (=> b!1203454 m!1109173))

(assert (=> b!1203450 m!1109171))

(assert (=> b!1203453 m!1108925))

(assert (=> b!1203453 m!1108925))

(declare-fun m!1109195 () Bool)

(assert (=> b!1203453 m!1109195))

(assert (=> b!1203232 d!132519))

(declare-fun d!132521 () Bool)

(declare-fun res!800859 () Bool)

(declare-fun e!683372 () Bool)

(assert (=> d!132521 (=> res!800859 e!683372)))

(assert (=> d!132521 (= res!800859 (= (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132521 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!683372)))

(declare-fun b!1203459 () Bool)

(declare-fun e!683373 () Bool)

(assert (=> b!1203459 (= e!683372 e!683373)))

(declare-fun res!800860 () Bool)

(assert (=> b!1203459 (=> (not res!800860) (not e!683373))))

(assert (=> b!1203459 (= res!800860 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(declare-fun b!1203460 () Bool)

(assert (=> b!1203460 (= e!683373 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132521 (not res!800859)) b!1203459))

(assert (= (and b!1203459 res!800860) b!1203460))

(assert (=> d!132521 m!1109053))

(declare-fun m!1109197 () Bool)

(assert (=> b!1203460 m!1109197))

(assert (=> b!1203216 d!132521))

(declare-fun d!132523 () Bool)

(assert (=> d!132523 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545571 () Unit!39889)

(declare-fun choose!13 (array!77979 (_ BitVec 64) (_ BitVec 32)) Unit!39889)

(assert (=> d!132523 (= lt!545571 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132523 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132523 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!545571)))

(declare-fun bs!34061 () Bool)

(assert (= bs!34061 d!132523))

(assert (=> bs!34061 m!1108901))

(declare-fun m!1109199 () Bool)

(assert (=> bs!34061 m!1109199))

(assert (=> b!1203216 d!132523))

(declare-fun d!132525 () Bool)

(declare-fun e!683375 () Bool)

(assert (=> d!132525 e!683375))

(declare-fun res!800861 () Bool)

(assert (=> d!132525 (=> res!800861 e!683375)))

(declare-fun lt!545574 () Bool)

(assert (=> d!132525 (= res!800861 (not lt!545574))))

(declare-fun lt!545573 () Bool)

(assert (=> d!132525 (= lt!545574 lt!545573)))

(declare-fun lt!545572 () Unit!39889)

(declare-fun e!683374 () Unit!39889)

(assert (=> d!132525 (= lt!545572 e!683374)))

(declare-fun c!117845 () Bool)

(assert (=> d!132525 (= c!117845 lt!545573)))

(assert (=> d!132525 (= lt!545573 (containsKey!587 (toList!8844 lt!545425) k0!934))))

(assert (=> d!132525 (= (contains!6898 lt!545425 k0!934) lt!545574)))

(declare-fun b!1203461 () Bool)

(declare-fun lt!545575 () Unit!39889)

(assert (=> b!1203461 (= e!683374 lt!545575)))

(assert (=> b!1203461 (= lt!545575 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545425) k0!934))))

(assert (=> b!1203461 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545425) k0!934))))

(declare-fun b!1203462 () Bool)

(declare-fun Unit!39896 () Unit!39889)

(assert (=> b!1203462 (= e!683374 Unit!39896)))

(declare-fun b!1203463 () Bool)

(assert (=> b!1203463 (= e!683375 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545425) k0!934)))))

(assert (= (and d!132525 c!117845) b!1203461))

(assert (= (and d!132525 (not c!117845)) b!1203462))

(assert (= (and d!132525 (not res!800861)) b!1203463))

(declare-fun m!1109201 () Bool)

(assert (=> d!132525 m!1109201))

(declare-fun m!1109203 () Bool)

(assert (=> b!1203461 m!1109203))

(declare-fun m!1109205 () Bool)

(assert (=> b!1203461 m!1109205))

(assert (=> b!1203461 m!1109205))

(declare-fun m!1109207 () Bool)

(assert (=> b!1203461 m!1109207))

(assert (=> b!1203463 m!1109205))

(assert (=> b!1203463 m!1109205))

(assert (=> b!1203463 m!1109207))

(assert (=> b!1203240 d!132525))

(assert (=> b!1203240 d!132503))

(declare-fun d!132527 () Bool)

(declare-fun e!683377 () Bool)

(assert (=> d!132527 e!683377))

(declare-fun res!800862 () Bool)

(assert (=> d!132527 (=> res!800862 e!683377)))

(declare-fun lt!545578 () Bool)

(assert (=> d!132527 (= res!800862 (not lt!545578))))

(declare-fun lt!545577 () Bool)

(assert (=> d!132527 (= lt!545578 lt!545577)))

(declare-fun lt!545576 () Unit!39889)

(declare-fun e!683376 () Unit!39889)

(assert (=> d!132527 (= lt!545576 e!683376)))

(declare-fun c!117846 () Bool)

(assert (=> d!132527 (= c!117846 lt!545577)))

(assert (=> d!132527 (= lt!545577 (containsKey!587 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934))))

(assert (=> d!132527 (= (contains!6898 (ite c!117794 lt!545433 call!57992) k0!934) lt!545578)))

(declare-fun b!1203464 () Bool)

(declare-fun lt!545579 () Unit!39889)

(assert (=> b!1203464 (= e!683376 lt!545579)))

(assert (=> b!1203464 (= lt!545579 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934))))

(assert (=> b!1203464 (isDefined!456 (getValueByKey!631 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934))))

(declare-fun b!1203465 () Bool)

(declare-fun Unit!39897 () Unit!39889)

(assert (=> b!1203465 (= e!683376 Unit!39897)))

(declare-fun b!1203466 () Bool)

(assert (=> b!1203466 (= e!683377 (isDefined!456 (getValueByKey!631 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934)))))

(assert (= (and d!132527 c!117846) b!1203464))

(assert (= (and d!132527 (not c!117846)) b!1203465))

(assert (= (and d!132527 (not res!800862)) b!1203466))

(declare-fun m!1109209 () Bool)

(assert (=> d!132527 m!1109209))

(declare-fun m!1109211 () Bool)

(assert (=> b!1203464 m!1109211))

(declare-fun m!1109213 () Bool)

(assert (=> b!1203464 m!1109213))

(assert (=> b!1203464 m!1109213))

(declare-fun m!1109215 () Bool)

(assert (=> b!1203464 m!1109215))

(assert (=> b!1203466 m!1109213))

(assert (=> b!1203466 m!1109213))

(assert (=> b!1203466 m!1109215))

(assert (=> bm!57985 d!132527))

(declare-fun mapIsEmpty!47753 () Bool)

(declare-fun mapRes!47753 () Bool)

(assert (=> mapIsEmpty!47753 mapRes!47753))

(declare-fun b!1203473 () Bool)

(declare-fun e!683383 () Bool)

(assert (=> b!1203473 (= e!683383 tp_is_empty!30603)))

(declare-fun b!1203474 () Bool)

(declare-fun e!683382 () Bool)

(assert (=> b!1203474 (= e!683382 tp_is_empty!30603)))

(declare-fun condMapEmpty!47753 () Bool)

(declare-fun mapDefault!47753 () ValueCell!14592)

(assert (=> mapNonEmpty!47747 (= condMapEmpty!47753 (= mapRest!47747 ((as const (Array (_ BitVec 32) ValueCell!14592)) mapDefault!47753)))))

(assert (=> mapNonEmpty!47747 (= tp!90686 (and e!683382 mapRes!47753))))

(declare-fun mapNonEmpty!47753 () Bool)

(declare-fun tp!90696 () Bool)

(assert (=> mapNonEmpty!47753 (= mapRes!47753 (and tp!90696 e!683383))))

(declare-fun mapKey!47753 () (_ BitVec 32))

(declare-fun mapRest!47753 () (Array (_ BitVec 32) ValueCell!14592))

(declare-fun mapValue!47753 () ValueCell!14592)

(assert (=> mapNonEmpty!47753 (= mapRest!47747 (store mapRest!47753 mapKey!47753 mapValue!47753))))

(assert (= (and mapNonEmpty!47747 condMapEmpty!47753) mapIsEmpty!47753))

(assert (= (and mapNonEmpty!47747 (not condMapEmpty!47753)) mapNonEmpty!47753))

(assert (= (and mapNonEmpty!47753 ((_ is ValueCellFull!14592) mapValue!47753)) b!1203473))

(assert (= (and mapNonEmpty!47747 ((_ is ValueCellFull!14592) mapDefault!47753)) b!1203474))

(declare-fun m!1109217 () Bool)

(assert (=> mapNonEmpty!47753 m!1109217))

(declare-fun b_lambda!21119 () Bool)

(assert (= b_lambda!21101 (or (and start!100576 b_free!25899) b_lambda!21119)))

(declare-fun b_lambda!21121 () Bool)

(assert (= b_lambda!21115 (or (and start!100576 b_free!25899) b_lambda!21121)))

(declare-fun b_lambda!21123 () Bool)

(assert (= b_lambda!21113 (or (and start!100576 b_free!25899) b_lambda!21123)))

(declare-fun b_lambda!21125 () Bool)

(assert (= b_lambda!21105 (or (and start!100576 b_free!25899) b_lambda!21125)))

(declare-fun b_lambda!21127 () Bool)

(assert (= b_lambda!21117 (or (and start!100576 b_free!25899) b_lambda!21127)))

(declare-fun b_lambda!21129 () Bool)

(assert (= b_lambda!21103 (or (and start!100576 b_free!25899) b_lambda!21129)))

(declare-fun b_lambda!21131 () Bool)

(assert (= b_lambda!21109 (or (and start!100576 b_free!25899) b_lambda!21131)))

(declare-fun b_lambda!21133 () Bool)

(assert (= b_lambda!21111 (or (and start!100576 b_free!25899) b_lambda!21133)))

(declare-fun b_lambda!21135 () Bool)

(assert (= b_lambda!21107 (or (and start!100576 b_free!25899) b_lambda!21135)))

(check-sat (not d!132505) (not b!1203376) (not b!1203454) (not b_lambda!21125) (not b_lambda!21119) (not b!1203341) (not b!1203436) (not b!1203466) (not b!1203374) (not b!1203464) (not b!1203424) (not mapNonEmpty!47753) (not d!132517) (not b_next!25899) (not d!132519) (not d!132509) (not bm!58025) (not b!1203441) (not b!1203397) (not b_lambda!21099) (not b!1203449) (not d!132489) (not bm!58027) (not b!1203334) (not b_lambda!21135) (not d!132523) (not b!1203403) (not b!1203369) (not b!1203393) (not d!132507) (not d!132495) (not b!1203463) (not b!1203461) (not bm!58036) (not b!1203400) (not b!1203340) (not b!1203399) (not b!1203460) (not b!1203453) (not b!1203438) (not d!132501) (not b!1203407) (not b!1203434) (not d!132525) tp_is_empty!30603 (not b!1203404) (not b!1203372) (not bm!58026) (not b!1203442) (not b!1203437) (not b!1203388) (not d!132485) (not b!1203452) (not b_lambda!21123) (not b!1203448) (not b!1203428) (not bm!58035) (not b!1203377) (not b!1203392) (not b!1203402) (not bm!58032) (not b_lambda!21129) (not b!1203427) (not bm!58019) (not bm!58033) (not d!132511) (not b!1203375) (not b!1203371) (not b!1203416) (not b!1203401) (not b!1203451) (not b_lambda!21131) (not b!1203440) (not b!1203429) (not b!1203405) (not b!1203446) (not bm!58022) (not b!1203389) (not b!1203439) (not d!132503) (not b!1203333) (not b!1203450) (not b!1203406) b_and!42709 (not b_lambda!21121) (not b!1203332) (not b!1203373) (not b!1203414) (not b_lambda!21133) (not d!132527) (not bm!58034) (not b_lambda!21127))
(check-sat b_and!42709 (not b_next!25899))
(get-model)

(declare-fun b!1203475 () Bool)

(declare-fun e!683388 () ListLongMap!17657)

(declare-fun call!58040 () ListLongMap!17657)

(assert (=> b!1203475 (= e!683388 call!58040)))

(declare-fun b!1203476 () Bool)

(declare-fun e!683385 () Bool)

(declare-fun e!683390 () Bool)

(assert (=> b!1203476 (= e!683385 e!683390)))

(declare-fun c!117848 () Bool)

(declare-fun e!683386 () Bool)

(assert (=> b!1203476 (= c!117848 e!683386)))

(declare-fun res!800864 () Bool)

(assert (=> b!1203476 (=> (not res!800864) (not e!683386))))

(assert (=> b!1203476 (= res!800864 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(declare-fun b!1203477 () Bool)

(declare-fun e!683389 () Bool)

(assert (=> b!1203477 (= e!683390 e!683389)))

(declare-fun c!117850 () Bool)

(assert (=> b!1203477 (= c!117850 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(declare-fun b!1203478 () Bool)

(assert (=> b!1203478 (= e!683386 (validKeyInArray!0 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203478 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1203479 () Bool)

(declare-fun e!683387 () ListLongMap!17657)

(assert (=> b!1203479 (= e!683387 (ListLongMap!17658 Nil!26495))))

(declare-fun d!132529 () Bool)

(assert (=> d!132529 e!683385))

(declare-fun res!800863 () Bool)

(assert (=> d!132529 (=> (not res!800863) (not e!683385))))

(declare-fun lt!545586 () ListLongMap!17657)

(assert (=> d!132529 (= res!800863 (not (contains!6898 lt!545586 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132529 (= lt!545586 e!683387)))

(declare-fun c!117847 () Bool)

(assert (=> d!132529 (= c!117847 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(assert (=> d!132529 (validMask!0 mask!1564)))

(assert (=> d!132529 (= (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!545586)))

(declare-fun b!1203480 () Bool)

(assert (=> b!1203480 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(assert (=> b!1203480 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38171 lt!545434)))))

(declare-fun e!683384 () Bool)

(assert (=> b!1203480 (= e!683384 (= (apply!960 lt!545586 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58037 () Bool)

(assert (=> bm!58037 (= call!58040 (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203481 () Bool)

(assert (=> b!1203481 (= e!683387 e!683388)))

(declare-fun c!117849 () Bool)

(assert (=> b!1203481 (= c!117849 (validKeyInArray!0 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1203482 () Bool)

(assert (=> b!1203482 (= e!683389 (= lt!545586 (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203483 () Bool)

(assert (=> b!1203483 (= e!683389 (isEmpty!980 lt!545586))))

(declare-fun b!1203484 () Bool)

(declare-fun res!800866 () Bool)

(assert (=> b!1203484 (=> (not res!800866) (not e!683385))))

(assert (=> b!1203484 (= res!800866 (not (contains!6898 lt!545586 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203485 () Bool)

(assert (=> b!1203485 (= e!683390 e!683384)))

(assert (=> b!1203485 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(declare-fun res!800865 () Bool)

(assert (=> b!1203485 (= res!800865 (contains!6898 lt!545586 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203485 (=> (not res!800865) (not e!683384))))

(declare-fun b!1203486 () Bool)

(declare-fun lt!545582 () Unit!39889)

(declare-fun lt!545580 () Unit!39889)

(assert (=> b!1203486 (= lt!545582 lt!545580)))

(declare-fun lt!545583 () (_ BitVec 64))

(declare-fun lt!545581 () (_ BitVec 64))

(declare-fun lt!545585 () ListLongMap!17657)

(declare-fun lt!545584 () V!45931)

(assert (=> b!1203486 (not (contains!6898 (+!3970 lt!545585 (tuple2!19689 lt!545583 lt!545584)) lt!545581))))

(assert (=> b!1203486 (= lt!545580 (addStillNotContains!288 lt!545585 lt!545583 lt!545584 lt!545581))))

(assert (=> b!1203486 (= lt!545581 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203486 (= lt!545584 (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203486 (= lt!545583 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1203486 (= lt!545585 call!58040)))

(assert (=> b!1203486 (= e!683388 (+!3970 call!58040 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132529 c!117847) b!1203479))

(assert (= (and d!132529 (not c!117847)) b!1203481))

(assert (= (and b!1203481 c!117849) b!1203486))

(assert (= (and b!1203481 (not c!117849)) b!1203475))

(assert (= (or b!1203486 b!1203475) bm!58037))

(assert (= (and d!132529 res!800863) b!1203484))

(assert (= (and b!1203484 res!800866) b!1203476))

(assert (= (and b!1203476 res!800864) b!1203478))

(assert (= (and b!1203476 c!117848) b!1203485))

(assert (= (and b!1203476 (not c!117848)) b!1203477))

(assert (= (and b!1203485 res!800865) b!1203480))

(assert (= (and b!1203477 c!117850) b!1203482))

(assert (= (and b!1203477 (not c!117850)) b!1203483))

(declare-fun b_lambda!21137 () Bool)

(assert (=> (not b_lambda!21137) (not b!1203480)))

(assert (=> b!1203480 t!39376))

(declare-fun b_and!42711 () Bool)

(assert (= b_and!42709 (and (=> t!39376 result!21975) b_and!42711)))

(declare-fun b_lambda!21139 () Bool)

(assert (=> (not b_lambda!21139) (not b!1203486)))

(assert (=> b!1203486 t!39376))

(declare-fun b_and!42713 () Bool)

(assert (= b_and!42711 (and (=> t!39376 result!21975) b_and!42713)))

(declare-fun m!1109219 () Bool)

(assert (=> bm!58037 m!1109219))

(declare-fun m!1109221 () Bool)

(assert (=> b!1203480 m!1109221))

(declare-fun m!1109223 () Bool)

(assert (=> b!1203480 m!1109223))

(assert (=> b!1203480 m!1108891))

(declare-fun m!1109225 () Bool)

(assert (=> b!1203480 m!1109225))

(assert (=> b!1203480 m!1108891))

(assert (=> b!1203480 m!1109221))

(declare-fun m!1109227 () Bool)

(assert (=> b!1203480 m!1109227))

(assert (=> b!1203480 m!1109223))

(assert (=> b!1203478 m!1109221))

(assert (=> b!1203478 m!1109221))

(declare-fun m!1109229 () Bool)

(assert (=> b!1203478 m!1109229))

(assert (=> b!1203481 m!1109221))

(assert (=> b!1203481 m!1109221))

(assert (=> b!1203481 m!1109229))

(declare-fun m!1109231 () Bool)

(assert (=> b!1203484 m!1109231))

(declare-fun m!1109233 () Bool)

(assert (=> b!1203483 m!1109233))

(declare-fun m!1109235 () Bool)

(assert (=> d!132529 m!1109235))

(assert (=> d!132529 m!1108917))

(assert (=> b!1203486 m!1109221))

(declare-fun m!1109237 () Bool)

(assert (=> b!1203486 m!1109237))

(assert (=> b!1203486 m!1109223))

(assert (=> b!1203486 m!1108891))

(assert (=> b!1203486 m!1109225))

(assert (=> b!1203486 m!1108891))

(declare-fun m!1109239 () Bool)

(assert (=> b!1203486 m!1109239))

(declare-fun m!1109241 () Bool)

(assert (=> b!1203486 m!1109241))

(declare-fun m!1109243 () Bool)

(assert (=> b!1203486 m!1109243))

(assert (=> b!1203486 m!1109241))

(assert (=> b!1203486 m!1109223))

(assert (=> b!1203482 m!1109219))

(assert (=> b!1203485 m!1109221))

(assert (=> b!1203485 m!1109221))

(declare-fun m!1109245 () Bool)

(assert (=> b!1203485 m!1109245))

(assert (=> bm!58022 d!132529))

(declare-fun d!132531 () Bool)

(declare-fun res!800871 () Bool)

(declare-fun e!683395 () Bool)

(assert (=> d!132531 (=> res!800871 e!683395)))

(assert (=> d!132531 (= res!800871 (and ((_ is Cons!26494) (toList!8844 call!57991)) (= (_1!9855 (h!27703 (toList!8844 call!57991))) k0!934)))))

(assert (=> d!132531 (= (containsKey!587 (toList!8844 call!57991) k0!934) e!683395)))

(declare-fun b!1203491 () Bool)

(declare-fun e!683396 () Bool)

(assert (=> b!1203491 (= e!683395 e!683396)))

(declare-fun res!800872 () Bool)

(assert (=> b!1203491 (=> (not res!800872) (not e!683396))))

(assert (=> b!1203491 (= res!800872 (and (or (not ((_ is Cons!26494) (toList!8844 call!57991))) (bvsle (_1!9855 (h!27703 (toList!8844 call!57991))) k0!934)) ((_ is Cons!26494) (toList!8844 call!57991)) (bvslt (_1!9855 (h!27703 (toList!8844 call!57991))) k0!934)))))

(declare-fun b!1203492 () Bool)

(assert (=> b!1203492 (= e!683396 (containsKey!587 (t!39377 (toList!8844 call!57991)) k0!934))))

(assert (= (and d!132531 (not res!800871)) b!1203491))

(assert (= (and b!1203491 res!800872) b!1203492))

(declare-fun m!1109247 () Bool)

(assert (=> b!1203492 m!1109247))

(assert (=> d!132509 d!132531))

(declare-fun d!132533 () Bool)

(declare-fun lt!545589 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!541 (List!26499) (InoxSet (_ BitVec 64)))

(assert (=> d!132533 (= lt!545589 (select (content!541 Nil!26496) (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun e!683402 () Bool)

(assert (=> d!132533 (= lt!545589 e!683402)))

(declare-fun res!800878 () Bool)

(assert (=> d!132533 (=> (not res!800878) (not e!683402))))

(assert (=> d!132533 (= res!800878 ((_ is Cons!26495) Nil!26496))))

(assert (=> d!132533 (= (contains!6900 Nil!26496 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)) lt!545589)))

(declare-fun b!1203497 () Bool)

(declare-fun e!683401 () Bool)

(assert (=> b!1203497 (= e!683402 e!683401)))

(declare-fun res!800877 () Bool)

(assert (=> b!1203497 (=> res!800877 e!683401)))

(assert (=> b!1203497 (= res!800877 (= (h!27704 Nil!26496) (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1203498 () Bool)

(assert (=> b!1203498 (= e!683401 (contains!6900 (t!39378 Nil!26496) (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132533 res!800878) b!1203497))

(assert (= (and b!1203497 (not res!800877)) b!1203498))

(declare-fun m!1109249 () Bool)

(assert (=> d!132533 m!1109249))

(assert (=> d!132533 m!1109053))

(declare-fun m!1109251 () Bool)

(assert (=> d!132533 m!1109251))

(assert (=> b!1203498 m!1109053))

(declare-fun m!1109253 () Bool)

(assert (=> b!1203498 m!1109253))

(assert (=> b!1203429 d!132533))

(declare-fun d!132535 () Bool)

(declare-fun res!800879 () Bool)

(declare-fun e!683403 () Bool)

(assert (=> d!132535 (=> res!800879 e!683403)))

(assert (=> d!132535 (= res!800879 (and ((_ is Cons!26494) (toList!8844 (ite c!117794 lt!545433 call!57992))) (= (_1!9855 (h!27703 (toList!8844 (ite c!117794 lt!545433 call!57992)))) k0!934)))))

(assert (=> d!132535 (= (containsKey!587 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934) e!683403)))

(declare-fun b!1203499 () Bool)

(declare-fun e!683404 () Bool)

(assert (=> b!1203499 (= e!683403 e!683404)))

(declare-fun res!800880 () Bool)

(assert (=> b!1203499 (=> (not res!800880) (not e!683404))))

(assert (=> b!1203499 (= res!800880 (and (or (not ((_ is Cons!26494) (toList!8844 (ite c!117794 lt!545433 call!57992)))) (bvsle (_1!9855 (h!27703 (toList!8844 (ite c!117794 lt!545433 call!57992)))) k0!934)) ((_ is Cons!26494) (toList!8844 (ite c!117794 lt!545433 call!57992))) (bvslt (_1!9855 (h!27703 (toList!8844 (ite c!117794 lt!545433 call!57992)))) k0!934)))))

(declare-fun b!1203500 () Bool)

(assert (=> b!1203500 (= e!683404 (containsKey!587 (t!39377 (toList!8844 (ite c!117794 lt!545433 call!57992))) k0!934))))

(assert (= (and d!132535 (not res!800879)) b!1203499))

(assert (= (and b!1203499 res!800880) b!1203500))

(declare-fun m!1109255 () Bool)

(assert (=> b!1203500 m!1109255))

(assert (=> d!132527 d!132535))

(declare-fun d!132537 () Bool)

(declare-fun e!683406 () Bool)

(assert (=> d!132537 e!683406))

(declare-fun res!800881 () Bool)

(assert (=> d!132537 (=> res!800881 e!683406)))

(declare-fun lt!545592 () Bool)

(assert (=> d!132537 (= res!800881 (not lt!545592))))

(declare-fun lt!545591 () Bool)

(assert (=> d!132537 (= lt!545592 lt!545591)))

(declare-fun lt!545590 () Unit!39889)

(declare-fun e!683405 () Unit!39889)

(assert (=> d!132537 (= lt!545590 e!683405)))

(declare-fun c!117851 () Bool)

(assert (=> d!132537 (= c!117851 lt!545591)))

(assert (=> d!132537 (= lt!545591 (containsKey!587 (toList!8844 lt!545561) (select (arr!37634 lt!545424) from!1455)))))

(assert (=> d!132537 (= (contains!6898 lt!545561 (select (arr!37634 lt!545424) from!1455)) lt!545592)))

(declare-fun b!1203501 () Bool)

(declare-fun lt!545593 () Unit!39889)

(assert (=> b!1203501 (= e!683405 lt!545593)))

(assert (=> b!1203501 (= lt!545593 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545561) (select (arr!37634 lt!545424) from!1455)))))

(assert (=> b!1203501 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545561) (select (arr!37634 lt!545424) from!1455)))))

(declare-fun b!1203502 () Bool)

(declare-fun Unit!39898 () Unit!39889)

(assert (=> b!1203502 (= e!683405 Unit!39898)))

(declare-fun b!1203503 () Bool)

(assert (=> b!1203503 (= e!683406 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545561) (select (arr!37634 lt!545424) from!1455))))))

(assert (= (and d!132537 c!117851) b!1203501))

(assert (= (and d!132537 (not c!117851)) b!1203502))

(assert (= (and d!132537 (not res!800881)) b!1203503))

(assert (=> d!132537 m!1109145))

(declare-fun m!1109257 () Bool)

(assert (=> d!132537 m!1109257))

(assert (=> b!1203501 m!1109145))

(declare-fun m!1109259 () Bool)

(assert (=> b!1203501 m!1109259))

(assert (=> b!1203501 m!1109145))

(declare-fun m!1109261 () Bool)

(assert (=> b!1203501 m!1109261))

(assert (=> b!1203501 m!1109261))

(declare-fun m!1109263 () Bool)

(assert (=> b!1203501 m!1109263))

(assert (=> b!1203503 m!1109145))

(assert (=> b!1203503 m!1109261))

(assert (=> b!1203503 m!1109261))

(assert (=> b!1203503 m!1109263))

(assert (=> b!1203441 d!132537))

(declare-fun d!132539 () Bool)

(declare-fun e!683408 () Bool)

(assert (=> d!132539 e!683408))

(declare-fun res!800882 () Bool)

(assert (=> d!132539 (=> res!800882 e!683408)))

(declare-fun lt!545596 () Bool)

(assert (=> d!132539 (= res!800882 (not lt!545596))))

(declare-fun lt!545595 () Bool)

(assert (=> d!132539 (= lt!545596 lt!545595)))

(declare-fun lt!545594 () Unit!39889)

(declare-fun e!683407 () Unit!39889)

(assert (=> d!132539 (= lt!545594 e!683407)))

(declare-fun c!117852 () Bool)

(assert (=> d!132539 (= c!117852 lt!545595)))

(assert (=> d!132539 (= lt!545595 (containsKey!587 (toList!8844 lt!545489) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132539 (= (contains!6898 lt!545489 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) lt!545596)))

(declare-fun b!1203504 () Bool)

(declare-fun lt!545597 () Unit!39889)

(assert (=> b!1203504 (= e!683407 lt!545597)))

(assert (=> b!1203504 (= lt!545597 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545489) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> b!1203504 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545489) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1203505 () Bool)

(declare-fun Unit!39899 () Unit!39889)

(assert (=> b!1203505 (= e!683407 Unit!39899)))

(declare-fun b!1203506 () Bool)

(assert (=> b!1203506 (= e!683408 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545489) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!132539 c!117852) b!1203504))

(assert (= (and d!132539 (not c!117852)) b!1203505))

(assert (= (and d!132539 (not res!800882)) b!1203506))

(declare-fun m!1109265 () Bool)

(assert (=> d!132539 m!1109265))

(declare-fun m!1109267 () Bool)

(assert (=> b!1203504 m!1109267))

(assert (=> b!1203504 m!1109021))

(assert (=> b!1203504 m!1109021))

(declare-fun m!1109269 () Bool)

(assert (=> b!1203504 m!1109269))

(assert (=> b!1203506 m!1109021))

(assert (=> b!1203506 m!1109021))

(assert (=> b!1203506 m!1109269))

(assert (=> d!132489 d!132539))

(declare-fun b!1203518 () Bool)

(declare-fun e!683414 () Option!682)

(assert (=> b!1203518 (= e!683414 None!680)))

(declare-fun b!1203515 () Bool)

(declare-fun e!683413 () Option!682)

(assert (=> b!1203515 (= e!683413 (Some!681 (_2!9855 (h!27703 lt!545491))))))

(declare-fun b!1203516 () Bool)

(assert (=> b!1203516 (= e!683413 e!683414)))

(declare-fun c!117858 () Bool)

(assert (=> b!1203516 (= c!117858 (and ((_ is Cons!26494) lt!545491) (not (= (_1!9855 (h!27703 lt!545491)) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))))

(declare-fun b!1203517 () Bool)

(assert (=> b!1203517 (= e!683414 (getValueByKey!631 (t!39377 lt!545491) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun d!132541 () Bool)

(declare-fun c!117857 () Bool)

(assert (=> d!132541 (= c!117857 (and ((_ is Cons!26494) lt!545491) (= (_1!9855 (h!27703 lt!545491)) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (=> d!132541 (= (getValueByKey!631 lt!545491 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) e!683413)))

(assert (= (and d!132541 c!117857) b!1203515))

(assert (= (and d!132541 (not c!117857)) b!1203516))

(assert (= (and b!1203516 c!117858) b!1203517))

(assert (= (and b!1203516 (not c!117858)) b!1203518))

(declare-fun m!1109271 () Bool)

(assert (=> b!1203517 m!1109271))

(assert (=> d!132489 d!132541))

(declare-fun d!132543 () Bool)

(assert (=> d!132543 (= (getValueByKey!631 lt!545491 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!681 (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!545600 () Unit!39889)

(declare-fun choose!1787 (List!26498 (_ BitVec 64) V!45931) Unit!39889)

(assert (=> d!132543 (= lt!545600 (choose!1787 lt!545491 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun e!683417 () Bool)

(assert (=> d!132543 e!683417))

(declare-fun res!800887 () Bool)

(assert (=> d!132543 (=> (not res!800887) (not e!683417))))

(declare-fun isStrictlySorted!728 (List!26498) Bool)

(assert (=> d!132543 (= res!800887 (isStrictlySorted!728 lt!545491))))

(assert (=> d!132543 (= (lemmaContainsTupThenGetReturnValue!308 lt!545491 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) lt!545600)))

(declare-fun b!1203523 () Bool)

(declare-fun res!800888 () Bool)

(assert (=> b!1203523 (=> (not res!800888) (not e!683417))))

(assert (=> b!1203523 (= res!800888 (containsKey!587 lt!545491 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1203524 () Bool)

(assert (=> b!1203524 (= e!683417 (contains!6901 lt!545491 (tuple2!19689 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (= (and d!132543 res!800887) b!1203523))

(assert (= (and b!1203523 res!800888) b!1203524))

(assert (=> d!132543 m!1109015))

(declare-fun m!1109273 () Bool)

(assert (=> d!132543 m!1109273))

(declare-fun m!1109275 () Bool)

(assert (=> d!132543 m!1109275))

(declare-fun m!1109277 () Bool)

(assert (=> b!1203523 m!1109277))

(declare-fun m!1109279 () Bool)

(assert (=> b!1203524 m!1109279))

(assert (=> d!132489 d!132543))

(declare-fun b!1203545 () Bool)

(declare-fun lt!545603 () List!26498)

(declare-fun e!683432 () Bool)

(assert (=> b!1203545 (= e!683432 (contains!6901 lt!545603 (tuple2!19689 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1203546 () Bool)

(declare-fun e!683430 () List!26498)

(declare-fun call!58047 () List!26498)

(assert (=> b!1203546 (= e!683430 call!58047)))

(declare-fun b!1203547 () Bool)

(declare-fun e!683429 () List!26498)

(declare-fun e!683428 () List!26498)

(assert (=> b!1203547 (= e!683429 e!683428)))

(declare-fun c!117867 () Bool)

(assert (=> b!1203547 (= c!117867 (and ((_ is Cons!26494) (toList!8844 (ite c!117794 lt!545433 lt!545425))) (= (_1!9855 (h!27703 (toList!8844 (ite c!117794 lt!545433 lt!545425)))) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun e!683431 () List!26498)

(declare-fun c!117868 () Bool)

(declare-fun b!1203548 () Bool)

(assert (=> b!1203548 (= e!683431 (ite c!117867 (t!39377 (toList!8844 (ite c!117794 lt!545433 lt!545425))) (ite c!117868 (Cons!26494 (h!27703 (toList!8844 (ite c!117794 lt!545433 lt!545425))) (t!39377 (toList!8844 (ite c!117794 lt!545433 lt!545425)))) Nil!26495)))))

(declare-fun bm!58044 () Bool)

(declare-fun call!58048 () List!26498)

(declare-fun call!58049 () List!26498)

(assert (=> bm!58044 (= call!58048 call!58049)))

(declare-fun b!1203549 () Bool)

(assert (=> b!1203549 (= e!683429 call!58049)))

(declare-fun b!1203551 () Bool)

(assert (=> b!1203551 (= e!683428 call!58048)))

(declare-fun c!117870 () Bool)

(declare-fun bm!58045 () Bool)

(declare-fun $colon$colon!609 (List!26498 tuple2!19688) List!26498)

(assert (=> bm!58045 (= call!58049 ($colon$colon!609 e!683431 (ite c!117870 (h!27703 (toList!8844 (ite c!117794 lt!545433 lt!545425))) (tuple2!19689 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))))

(declare-fun c!117869 () Bool)

(assert (=> bm!58045 (= c!117869 c!117870)))

(declare-fun b!1203552 () Bool)

(assert (=> b!1203552 (= e!683431 (insertStrictlySorted!401 (t!39377 (toList!8844 (ite c!117794 lt!545433 lt!545425))) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun bm!58046 () Bool)

(assert (=> bm!58046 (= call!58047 call!58048)))

(declare-fun b!1203553 () Bool)

(declare-fun res!800894 () Bool)

(assert (=> b!1203553 (=> (not res!800894) (not e!683432))))

(assert (=> b!1203553 (= res!800894 (containsKey!587 lt!545603 (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1203554 () Bool)

(assert (=> b!1203554 (= c!117868 (and ((_ is Cons!26494) (toList!8844 (ite c!117794 lt!545433 lt!545425))) (bvsgt (_1!9855 (h!27703 (toList!8844 (ite c!117794 lt!545433 lt!545425)))) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (=> b!1203554 (= e!683428 e!683430)))

(declare-fun d!132545 () Bool)

(assert (=> d!132545 e!683432))

(declare-fun res!800893 () Bool)

(assert (=> d!132545 (=> (not res!800893) (not e!683432))))

(assert (=> d!132545 (= res!800893 (isStrictlySorted!728 lt!545603))))

(assert (=> d!132545 (= lt!545603 e!683429)))

(assert (=> d!132545 (= c!117870 (and ((_ is Cons!26494) (toList!8844 (ite c!117794 lt!545433 lt!545425))) (bvslt (_1!9855 (h!27703 (toList!8844 (ite c!117794 lt!545433 lt!545425)))) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (=> d!132545 (isStrictlySorted!728 (toList!8844 (ite c!117794 lt!545433 lt!545425)))))

(assert (=> d!132545 (= (insertStrictlySorted!401 (toList!8844 (ite c!117794 lt!545433 lt!545425)) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) lt!545603)))

(declare-fun b!1203550 () Bool)

(assert (=> b!1203550 (= e!683430 call!58047)))

(assert (= (and d!132545 c!117870) b!1203549))

(assert (= (and d!132545 (not c!117870)) b!1203547))

(assert (= (and b!1203547 c!117867) b!1203551))

(assert (= (and b!1203547 (not c!117867)) b!1203554))

(assert (= (and b!1203554 c!117868) b!1203550))

(assert (= (and b!1203554 (not c!117868)) b!1203546))

(assert (= (or b!1203550 b!1203546) bm!58046))

(assert (= (or b!1203551 bm!58046) bm!58044))

(assert (= (or b!1203549 bm!58044) bm!58045))

(assert (= (and bm!58045 c!117869) b!1203552))

(assert (= (and bm!58045 (not c!117869)) b!1203548))

(assert (= (and d!132545 res!800893) b!1203553))

(assert (= (and b!1203553 res!800894) b!1203545))

(declare-fun m!1109281 () Bool)

(assert (=> bm!58045 m!1109281))

(declare-fun m!1109283 () Bool)

(assert (=> b!1203553 m!1109283))

(declare-fun m!1109285 () Bool)

(assert (=> b!1203552 m!1109285))

(declare-fun m!1109287 () Bool)

(assert (=> d!132545 m!1109287))

(declare-fun m!1109289 () Bool)

(assert (=> d!132545 m!1109289))

(declare-fun m!1109291 () Bool)

(assert (=> b!1203545 m!1109291))

(assert (=> d!132489 d!132545))

(declare-fun d!132547 () Bool)

(assert (=> d!132547 (= (validKeyInArray!0 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203397 d!132547))

(declare-fun d!132549 () Bool)

(declare-fun res!800895 () Bool)

(declare-fun e!683433 () Bool)

(assert (=> d!132549 (=> res!800895 e!683433)))

(assert (=> d!132549 (= res!800895 (and ((_ is Cons!26494) (toList!8844 lt!545425)) (= (_1!9855 (h!27703 (toList!8844 lt!545425))) k0!934)))))

(assert (=> d!132549 (= (containsKey!587 (toList!8844 lt!545425) k0!934) e!683433)))

(declare-fun b!1203555 () Bool)

(declare-fun e!683434 () Bool)

(assert (=> b!1203555 (= e!683433 e!683434)))

(declare-fun res!800896 () Bool)

(assert (=> b!1203555 (=> (not res!800896) (not e!683434))))

(assert (=> b!1203555 (= res!800896 (and (or (not ((_ is Cons!26494) (toList!8844 lt!545425))) (bvsle (_1!9855 (h!27703 (toList!8844 lt!545425))) k0!934)) ((_ is Cons!26494) (toList!8844 lt!545425)) (bvslt (_1!9855 (h!27703 (toList!8844 lt!545425))) k0!934)))))

(declare-fun b!1203556 () Bool)

(assert (=> b!1203556 (= e!683434 (containsKey!587 (t!39377 (toList!8844 lt!545425)) k0!934))))

(assert (= (and d!132549 (not res!800895)) b!1203555))

(assert (= (and b!1203555 res!800896) b!1203556))

(declare-fun m!1109293 () Bool)

(assert (=> b!1203556 m!1109293))

(assert (=> d!132525 d!132549))

(assert (=> b!1203373 d!132529))

(declare-fun b!1203560 () Bool)

(declare-fun e!683436 () Option!682)

(assert (=> b!1203560 (= e!683436 None!680)))

(declare-fun b!1203557 () Bool)

(declare-fun e!683435 () Option!682)

(assert (=> b!1203557 (= e!683435 (Some!681 (_2!9855 (h!27703 (toList!8844 lt!545536)))))))

(declare-fun b!1203558 () Bool)

(assert (=> b!1203558 (= e!683435 e!683436)))

(declare-fun c!117872 () Bool)

(assert (=> b!1203558 (= c!117872 (and ((_ is Cons!26494) (toList!8844 lt!545536)) (not (= (_1!9855 (h!27703 (toList!8844 lt!545536))) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))))

(declare-fun b!1203559 () Bool)

(assert (=> b!1203559 (= e!683436 (getValueByKey!631 (t!39377 (toList!8844 lt!545536)) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun d!132551 () Bool)

(declare-fun c!117871 () Bool)

(assert (=> d!132551 (= c!117871 (and ((_ is Cons!26494) (toList!8844 lt!545536)) (= (_1!9855 (h!27703 (toList!8844 lt!545536))) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (=> d!132551 (= (getValueByKey!631 (toList!8844 lt!545536) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) e!683435)))

(assert (= (and d!132551 c!117871) b!1203557))

(assert (= (and d!132551 (not c!117871)) b!1203558))

(assert (= (and b!1203558 c!117872) b!1203559))

(assert (= (and b!1203558 (not c!117872)) b!1203560))

(declare-fun m!1109295 () Bool)

(assert (=> b!1203559 m!1109295))

(assert (=> b!1203406 d!132551))

(declare-fun d!132553 () Bool)

(assert (=> d!132553 (= (validKeyInArray!0 (select (arr!37634 lt!545424) from!1455)) (and (not (= (select (arr!37634 lt!545424) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37634 lt!545424) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203437 d!132553))

(declare-fun d!132555 () Bool)

(declare-fun get!19181 (Option!682) V!45931)

(assert (=> d!132555 (= (apply!960 lt!545561 (select (arr!37634 lt!545424) from!1455)) (get!19181 (getValueByKey!631 (toList!8844 lt!545561) (select (arr!37634 lt!545424) from!1455))))))

(declare-fun bs!34062 () Bool)

(assert (= bs!34062 d!132555))

(assert (=> bs!34062 m!1109145))

(assert (=> bs!34062 m!1109261))

(assert (=> bs!34062 m!1109261))

(declare-fun m!1109297 () Bool)

(assert (=> bs!34062 m!1109297))

(assert (=> b!1203436 d!132555))

(declare-fun d!132557 () Bool)

(declare-fun c!117875 () Bool)

(assert (=> d!132557 (= c!117875 ((_ is ValueCellFull!14592) (select (arr!37635 lt!545434) from!1455)))))

(declare-fun e!683439 () V!45931)

(assert (=> d!132557 (= (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!683439)))

(declare-fun b!1203565 () Bool)

(declare-fun get!19182 (ValueCell!14592 V!45931) V!45931)

(assert (=> b!1203565 (= e!683439 (get!19182 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203566 () Bool)

(declare-fun get!19183 (ValueCell!14592 V!45931) V!45931)

(assert (=> b!1203566 (= e!683439 (get!19183 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132557 c!117875) b!1203565))

(assert (= (and d!132557 (not c!117875)) b!1203566))

(assert (=> b!1203565 m!1109147))

(assert (=> b!1203565 m!1108891))

(declare-fun m!1109299 () Bool)

(assert (=> b!1203565 m!1109299))

(assert (=> b!1203566 m!1109147))

(assert (=> b!1203566 m!1108891))

(declare-fun m!1109301 () Bool)

(assert (=> b!1203566 m!1109301))

(assert (=> b!1203436 d!132557))

(declare-fun b!1203567 () Bool)

(declare-fun e!683440 () Bool)

(declare-fun call!58050 () Bool)

(assert (=> b!1203567 (= e!683440 call!58050)))

(declare-fun d!132559 () Bool)

(declare-fun res!800898 () Bool)

(declare-fun e!683441 () Bool)

(assert (=> d!132559 (=> res!800898 e!683441)))

(assert (=> d!132559 (= res!800898 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(assert (=> d!132559 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!545424 mask!1564) e!683441)))

(declare-fun b!1203568 () Bool)

(declare-fun e!683442 () Bool)

(assert (=> b!1203568 (= e!683442 call!58050)))

(declare-fun b!1203569 () Bool)

(assert (=> b!1203569 (= e!683440 e!683442)))

(declare-fun lt!545604 () (_ BitVec 64))

(assert (=> b!1203569 (= lt!545604 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!545605 () Unit!39889)

(assert (=> b!1203569 (= lt!545605 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545424 lt!545604 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1203569 (arrayContainsKey!0 lt!545424 lt!545604 #b00000000000000000000000000000000)))

(declare-fun lt!545606 () Unit!39889)

(assert (=> b!1203569 (= lt!545606 lt!545605)))

(declare-fun res!800897 () Bool)

(assert (=> b!1203569 (= res!800897 (= (seekEntryOrOpen!0 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!545424 mask!1564) (Found!9933 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1203569 (=> (not res!800897) (not e!683442))))

(declare-fun bm!58047 () Bool)

(assert (=> bm!58047 (= call!58050 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!545424 mask!1564))))

(declare-fun b!1203570 () Bool)

(assert (=> b!1203570 (= e!683441 e!683440)))

(declare-fun c!117876 () Bool)

(assert (=> b!1203570 (= c!117876 (validKeyInArray!0 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!132559 (not res!800898)) b!1203570))

(assert (= (and b!1203570 c!117876) b!1203569))

(assert (= (and b!1203570 (not c!117876)) b!1203567))

(assert (= (and b!1203569 res!800897) b!1203568))

(assert (= (or b!1203568 b!1203567) bm!58047))

(declare-fun m!1109303 () Bool)

(assert (=> b!1203569 m!1109303))

(declare-fun m!1109305 () Bool)

(assert (=> b!1203569 m!1109305))

(declare-fun m!1109307 () Bool)

(assert (=> b!1203569 m!1109307))

(assert (=> b!1203569 m!1109303))

(declare-fun m!1109309 () Bool)

(assert (=> b!1203569 m!1109309))

(declare-fun m!1109311 () Bool)

(assert (=> bm!58047 m!1109311))

(assert (=> b!1203570 m!1109303))

(assert (=> b!1203570 m!1109303))

(declare-fun m!1109313 () Bool)

(assert (=> b!1203570 m!1109313))

(assert (=> bm!58026 d!132559))

(declare-fun d!132561 () Bool)

(declare-fun e!683444 () Bool)

(assert (=> d!132561 e!683444))

(declare-fun res!800899 () Bool)

(assert (=> d!132561 (=> res!800899 e!683444)))

(declare-fun lt!545609 () Bool)

(assert (=> d!132561 (= res!800899 (not lt!545609))))

(declare-fun lt!545608 () Bool)

(assert (=> d!132561 (= lt!545609 lt!545608)))

(declare-fun lt!545607 () Unit!39889)

(declare-fun e!683443 () Unit!39889)

(assert (=> d!132561 (= lt!545607 e!683443)))

(declare-fun c!117877 () Bool)

(assert (=> d!132561 (= c!117877 lt!545608)))

(assert (=> d!132561 (= lt!545608 (containsKey!587 (toList!8844 lt!545512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132561 (= (contains!6898 lt!545512 #b0000000000000000000000000000000000000000000000000000000000000000) lt!545609)))

(declare-fun b!1203571 () Bool)

(declare-fun lt!545610 () Unit!39889)

(assert (=> b!1203571 (= e!683443 lt!545610)))

(assert (=> b!1203571 (= lt!545610 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203571 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203572 () Bool)

(declare-fun Unit!39900 () Unit!39889)

(assert (=> b!1203572 (= e!683443 Unit!39900)))

(declare-fun b!1203573 () Bool)

(assert (=> b!1203573 (= e!683444 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132561 c!117877) b!1203571))

(assert (= (and d!132561 (not c!117877)) b!1203572))

(assert (= (and d!132561 (not res!800899)) b!1203573))

(declare-fun m!1109315 () Bool)

(assert (=> d!132561 m!1109315))

(declare-fun m!1109317 () Bool)

(assert (=> b!1203571 m!1109317))

(declare-fun m!1109319 () Bool)

(assert (=> b!1203571 m!1109319))

(assert (=> b!1203571 m!1109319))

(declare-fun m!1109321 () Bool)

(assert (=> b!1203571 m!1109321))

(assert (=> b!1203573 m!1109319))

(assert (=> b!1203573 m!1109319))

(assert (=> b!1203573 m!1109321))

(assert (=> d!132495 d!132561))

(assert (=> d!132495 d!132483))

(declare-fun d!132563 () Bool)

(declare-fun isEmpty!981 (List!26498) Bool)

(assert (=> d!132563 (= (isEmpty!980 lt!545561) (isEmpty!981 (toList!8844 lt!545561)))))

(declare-fun bs!34063 () Bool)

(assert (= bs!34063 d!132563))

(declare-fun m!1109323 () Bool)

(assert (=> bs!34063 m!1109323))

(assert (=> b!1203439 d!132563))

(declare-fun b!1203574 () Bool)

(declare-fun e!683448 () Bool)

(declare-fun call!58051 () Bool)

(assert (=> b!1203574 (= e!683448 call!58051)))

(declare-fun b!1203575 () Bool)

(declare-fun e!683447 () Bool)

(assert (=> b!1203575 (= e!683447 e!683448)))

(declare-fun c!117878 () Bool)

(assert (=> b!1203575 (= c!117878 (validKeyInArray!0 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!58048 () Bool)

(assert (=> bm!58048 (= call!58051 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!117878 (Cons!26495 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!117836 (Cons!26495 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) Nil!26496) Nil!26496)) (ite c!117836 (Cons!26495 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) Nil!26496) Nil!26496))))))

(declare-fun d!132565 () Bool)

(declare-fun res!800900 () Bool)

(declare-fun e!683446 () Bool)

(assert (=> d!132565 (=> res!800900 e!683446)))

(assert (=> d!132565 (= res!800900 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(assert (=> d!132565 (= (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117836 (Cons!26495 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) Nil!26496) Nil!26496)) e!683446)))

(declare-fun b!1203576 () Bool)

(assert (=> b!1203576 (= e!683446 e!683447)))

(declare-fun res!800902 () Bool)

(assert (=> b!1203576 (=> (not res!800902) (not e!683447))))

(declare-fun e!683445 () Bool)

(assert (=> b!1203576 (= res!800902 (not e!683445))))

(declare-fun res!800901 () Bool)

(assert (=> b!1203576 (=> (not res!800901) (not e!683445))))

(assert (=> b!1203576 (= res!800901 (validKeyInArray!0 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1203577 () Bool)

(assert (=> b!1203577 (= e!683445 (contains!6900 (ite c!117836 (Cons!26495 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) Nil!26496) Nil!26496) (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1203578 () Bool)

(assert (=> b!1203578 (= e!683448 call!58051)))

(assert (= (and d!132565 (not res!800900)) b!1203576))

(assert (= (and b!1203576 res!800901) b!1203577))

(assert (= (and b!1203576 res!800902) b!1203575))

(assert (= (and b!1203575 c!117878) b!1203574))

(assert (= (and b!1203575 (not c!117878)) b!1203578))

(assert (= (or b!1203574 b!1203578) bm!58048))

(declare-fun m!1109325 () Bool)

(assert (=> b!1203575 m!1109325))

(assert (=> b!1203575 m!1109325))

(declare-fun m!1109327 () Bool)

(assert (=> b!1203575 m!1109327))

(assert (=> bm!58048 m!1109325))

(declare-fun m!1109329 () Bool)

(assert (=> bm!58048 m!1109329))

(assert (=> b!1203576 m!1109325))

(assert (=> b!1203576 m!1109325))

(assert (=> b!1203576 m!1109327))

(assert (=> b!1203577 m!1109325))

(assert (=> b!1203577 m!1109325))

(declare-fun m!1109331 () Bool)

(assert (=> b!1203577 m!1109331))

(assert (=> bm!58034 d!132565))

(declare-fun d!132567 () Bool)

(declare-fun e!683450 () Bool)

(assert (=> d!132567 e!683450))

(declare-fun res!800903 () Bool)

(assert (=> d!132567 (=> res!800903 e!683450)))

(declare-fun lt!545613 () Bool)

(assert (=> d!132567 (= res!800903 (not lt!545613))))

(declare-fun lt!545612 () Bool)

(assert (=> d!132567 (= lt!545613 lt!545612)))

(declare-fun lt!545611 () Unit!39889)

(declare-fun e!683449 () Unit!39889)

(assert (=> d!132567 (= lt!545611 e!683449)))

(declare-fun c!117879 () Bool)

(assert (=> d!132567 (= c!117879 lt!545612)))

(assert (=> d!132567 (= lt!545612 (containsKey!587 (toList!8844 lt!545534) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132567 (= (contains!6898 lt!545534 #b0000000000000000000000000000000000000000000000000000000000000000) lt!545613)))

(declare-fun b!1203579 () Bool)

(declare-fun lt!545614 () Unit!39889)

(assert (=> b!1203579 (= e!683449 lt!545614)))

(assert (=> b!1203579 (= lt!545614 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545534) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203579 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545534) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203580 () Bool)

(declare-fun Unit!39901 () Unit!39889)

(assert (=> b!1203580 (= e!683449 Unit!39901)))

(declare-fun b!1203581 () Bool)

(assert (=> b!1203581 (= e!683450 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545534) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132567 c!117879) b!1203579))

(assert (= (and d!132567 (not c!117879)) b!1203580))

(assert (= (and d!132567 (not res!800903)) b!1203581))

(declare-fun m!1109333 () Bool)

(assert (=> d!132567 m!1109333))

(declare-fun m!1109335 () Bool)

(assert (=> b!1203579 m!1109335))

(declare-fun m!1109337 () Bool)

(assert (=> b!1203579 m!1109337))

(assert (=> b!1203579 m!1109337))

(declare-fun m!1109339 () Bool)

(assert (=> b!1203579 m!1109339))

(assert (=> b!1203581 m!1109337))

(assert (=> b!1203581 m!1109337))

(assert (=> b!1203581 m!1109339))

(assert (=> d!132503 d!132567))

(assert (=> d!132503 d!132483))

(declare-fun d!132569 () Bool)

(declare-fun e!683452 () Bool)

(assert (=> d!132569 e!683452))

(declare-fun res!800904 () Bool)

(assert (=> d!132569 (=> res!800904 e!683452)))

(declare-fun lt!545617 () Bool)

(assert (=> d!132569 (= res!800904 (not lt!545617))))

(declare-fun lt!545616 () Bool)

(assert (=> d!132569 (= lt!545617 lt!545616)))

(declare-fun lt!545615 () Unit!39889)

(declare-fun e!683451 () Unit!39889)

(assert (=> d!132569 (= lt!545615 e!683451)))

(declare-fun c!117880 () Bool)

(assert (=> d!132569 (= c!117880 lt!545616)))

(assert (=> d!132569 (= lt!545616 (containsKey!587 (toList!8844 lt!545534) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132569 (= (contains!6898 lt!545534 #b1000000000000000000000000000000000000000000000000000000000000000) lt!545617)))

(declare-fun b!1203582 () Bool)

(declare-fun lt!545618 () Unit!39889)

(assert (=> b!1203582 (= e!683451 lt!545618)))

(assert (=> b!1203582 (= lt!545618 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545534) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203582 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545534) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203583 () Bool)

(declare-fun Unit!39902 () Unit!39889)

(assert (=> b!1203583 (= e!683451 Unit!39902)))

(declare-fun b!1203584 () Bool)

(assert (=> b!1203584 (= e!683452 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545534) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132569 c!117880) b!1203582))

(assert (= (and d!132569 (not c!117880)) b!1203583))

(assert (= (and d!132569 (not res!800904)) b!1203584))

(declare-fun m!1109341 () Bool)

(assert (=> d!132569 m!1109341))

(declare-fun m!1109343 () Bool)

(assert (=> b!1203582 m!1109343))

(declare-fun m!1109345 () Bool)

(assert (=> b!1203582 m!1109345))

(assert (=> b!1203582 m!1109345))

(declare-fun m!1109347 () Bool)

(assert (=> b!1203582 m!1109347))

(assert (=> b!1203584 m!1109345))

(assert (=> b!1203584 m!1109345))

(assert (=> b!1203584 m!1109347))

(assert (=> b!1203403 d!132569))

(declare-fun b!1203588 () Bool)

(declare-fun e!683454 () Option!682)

(assert (=> b!1203588 (= e!683454 None!680)))

(declare-fun b!1203585 () Bool)

(declare-fun e!683453 () Option!682)

(assert (=> b!1203585 (= e!683453 (Some!681 (_2!9855 (h!27703 (toList!8844 lt!545489)))))))

(declare-fun b!1203586 () Bool)

(assert (=> b!1203586 (= e!683453 e!683454)))

(declare-fun c!117882 () Bool)

(assert (=> b!1203586 (= c!117882 (and ((_ is Cons!26494) (toList!8844 lt!545489)) (not (= (_1!9855 (h!27703 (toList!8844 lt!545489))) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))))

(declare-fun b!1203587 () Bool)

(assert (=> b!1203587 (= e!683454 (getValueByKey!631 (t!39377 (toList!8844 lt!545489)) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun c!117881 () Bool)

(declare-fun d!132571 () Bool)

(assert (=> d!132571 (= c!117881 (and ((_ is Cons!26494) (toList!8844 lt!545489)) (= (_1!9855 (h!27703 (toList!8844 lt!545489))) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(assert (=> d!132571 (= (getValueByKey!631 (toList!8844 lt!545489) (_1!9855 (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) e!683453)))

(assert (= (and d!132571 c!117881) b!1203585))

(assert (= (and d!132571 (not c!117881)) b!1203586))

(assert (= (and b!1203586 c!117882) b!1203587))

(assert (= (and b!1203586 (not c!117882)) b!1203588))

(declare-fun m!1109349 () Bool)

(assert (=> b!1203587 m!1109349))

(assert (=> b!1203340 d!132571))

(declare-fun d!132573 () Bool)

(declare-fun e!683456 () Bool)

(assert (=> d!132573 e!683456))

(declare-fun res!800905 () Bool)

(assert (=> d!132573 (=> res!800905 e!683456)))

(declare-fun lt!545621 () Bool)

(assert (=> d!132573 (= res!800905 (not lt!545621))))

(declare-fun lt!545620 () Bool)

(assert (=> d!132573 (= lt!545621 lt!545620)))

(declare-fun lt!545619 () Unit!39889)

(declare-fun e!683455 () Unit!39889)

(assert (=> d!132573 (= lt!545619 e!683455)))

(declare-fun c!117883 () Bool)

(assert (=> d!132573 (= c!117883 lt!545620)))

(assert (=> d!132573 (= lt!545620 (containsKey!587 (toList!8844 (+!3970 lt!545433 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!132573 (= (contains!6898 (+!3970 lt!545433 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!545621)))

(declare-fun b!1203589 () Bool)

(declare-fun lt!545622 () Unit!39889)

(assert (=> b!1203589 (= e!683455 lt!545622)))

(assert (=> b!1203589 (= lt!545622 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 (+!3970 lt!545433 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> b!1203589 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545433 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1203590 () Bool)

(declare-fun Unit!39903 () Unit!39889)

(assert (=> b!1203590 (= e!683455 Unit!39903)))

(declare-fun b!1203591 () Bool)

(assert (=> b!1203591 (= e!683456 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545433 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!132573 c!117883) b!1203589))

(assert (= (and d!132573 (not c!117883)) b!1203590))

(assert (= (and d!132573 (not res!800905)) b!1203591))

(declare-fun m!1109351 () Bool)

(assert (=> d!132573 m!1109351))

(declare-fun m!1109353 () Bool)

(assert (=> b!1203589 m!1109353))

(declare-fun m!1109355 () Bool)

(assert (=> b!1203589 m!1109355))

(assert (=> b!1203589 m!1109355))

(declare-fun m!1109357 () Bool)

(assert (=> b!1203589 m!1109357))

(assert (=> b!1203591 m!1109355))

(assert (=> b!1203591 m!1109355))

(assert (=> b!1203591 m!1109357))

(assert (=> d!132507 d!132573))

(declare-fun d!132575 () Bool)

(declare-fun e!683457 () Bool)

(assert (=> d!132575 e!683457))

(declare-fun res!800906 () Bool)

(assert (=> d!132575 (=> (not res!800906) (not e!683457))))

(declare-fun lt!545624 () ListLongMap!17657)

(assert (=> d!132575 (= res!800906 (contains!6898 lt!545624 (_1!9855 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!545626 () List!26498)

(assert (=> d!132575 (= lt!545624 (ListLongMap!17658 lt!545626))))

(declare-fun lt!545625 () Unit!39889)

(declare-fun lt!545623 () Unit!39889)

(assert (=> d!132575 (= lt!545625 lt!545623)))

(assert (=> d!132575 (= (getValueByKey!631 lt!545626 (_1!9855 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!681 (_2!9855 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132575 (= lt!545623 (lemmaContainsTupThenGetReturnValue!308 lt!545626 (_1!9855 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9855 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132575 (= lt!545626 (insertStrictlySorted!401 (toList!8844 lt!545433) (_1!9855 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9855 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132575 (= (+!3970 lt!545433 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!545624)))

(declare-fun b!1203592 () Bool)

(declare-fun res!800907 () Bool)

(assert (=> b!1203592 (=> (not res!800907) (not e!683457))))

(assert (=> b!1203592 (= res!800907 (= (getValueByKey!631 (toList!8844 lt!545624) (_1!9855 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!681 (_2!9855 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1203593 () Bool)

(assert (=> b!1203593 (= e!683457 (contains!6901 (toList!8844 lt!545624) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!132575 res!800906) b!1203592))

(assert (= (and b!1203592 res!800907) b!1203593))

(declare-fun m!1109359 () Bool)

(assert (=> d!132575 m!1109359))

(declare-fun m!1109361 () Bool)

(assert (=> d!132575 m!1109361))

(declare-fun m!1109363 () Bool)

(assert (=> d!132575 m!1109363))

(declare-fun m!1109365 () Bool)

(assert (=> d!132575 m!1109365))

(declare-fun m!1109367 () Bool)

(assert (=> b!1203592 m!1109367))

(declare-fun m!1109369 () Bool)

(assert (=> b!1203593 m!1109369))

(assert (=> d!132507 d!132575))

(declare-fun d!132577 () Bool)

(assert (=> d!132577 (contains!6898 (+!3970 lt!545433 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(assert (=> d!132577 true))

(declare-fun _$35!455 () Unit!39889)

(assert (=> d!132577 (= (choose!1785 lt!545433 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) _$35!455)))

(declare-fun bs!34064 () Bool)

(assert (= bs!34064 d!132577))

(assert (=> bs!34064 m!1109117))

(assert (=> bs!34064 m!1109117))

(assert (=> bs!34064 m!1109119))

(assert (=> d!132507 d!132577))

(declare-fun d!132579 () Bool)

(declare-fun e!683459 () Bool)

(assert (=> d!132579 e!683459))

(declare-fun res!800908 () Bool)

(assert (=> d!132579 (=> res!800908 e!683459)))

(declare-fun lt!545629 () Bool)

(assert (=> d!132579 (= res!800908 (not lt!545629))))

(declare-fun lt!545628 () Bool)

(assert (=> d!132579 (= lt!545629 lt!545628)))

(declare-fun lt!545627 () Unit!39889)

(declare-fun e!683458 () Unit!39889)

(assert (=> d!132579 (= lt!545627 e!683458)))

(declare-fun c!117884 () Bool)

(assert (=> d!132579 (= c!117884 lt!545628)))

(assert (=> d!132579 (= lt!545628 (containsKey!587 (toList!8844 lt!545433) k0!934))))

(assert (=> d!132579 (= (contains!6898 lt!545433 k0!934) lt!545629)))

(declare-fun b!1203595 () Bool)

(declare-fun lt!545630 () Unit!39889)

(assert (=> b!1203595 (= e!683458 lt!545630)))

(assert (=> b!1203595 (= lt!545630 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545433) k0!934))))

(assert (=> b!1203595 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545433) k0!934))))

(declare-fun b!1203596 () Bool)

(declare-fun Unit!39904 () Unit!39889)

(assert (=> b!1203596 (= e!683458 Unit!39904)))

(declare-fun b!1203597 () Bool)

(assert (=> b!1203597 (= e!683459 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545433) k0!934)))))

(assert (= (and d!132579 c!117884) b!1203595))

(assert (= (and d!132579 (not c!117884)) b!1203596))

(assert (= (and d!132579 (not res!800908)) b!1203597))

(declare-fun m!1109371 () Bool)

(assert (=> d!132579 m!1109371))

(declare-fun m!1109373 () Bool)

(assert (=> b!1203595 m!1109373))

(declare-fun m!1109375 () Bool)

(assert (=> b!1203595 m!1109375))

(assert (=> b!1203595 m!1109375))

(declare-fun m!1109377 () Bool)

(assert (=> b!1203595 m!1109377))

(assert (=> b!1203597 m!1109375))

(assert (=> b!1203597 m!1109375))

(assert (=> b!1203597 m!1109377))

(assert (=> d!132507 d!132579))

(declare-fun d!132581 () Bool)

(declare-fun e!683461 () Bool)

(assert (=> d!132581 e!683461))

(declare-fun res!800909 () Bool)

(assert (=> d!132581 (=> res!800909 e!683461)))

(declare-fun lt!545633 () Bool)

(assert (=> d!132581 (= res!800909 (not lt!545633))))

(declare-fun lt!545632 () Bool)

(assert (=> d!132581 (= lt!545633 lt!545632)))

(declare-fun lt!545631 () Unit!39889)

(declare-fun e!683460 () Unit!39889)

(assert (=> d!132581 (= lt!545631 e!683460)))

(declare-fun c!117885 () Bool)

(assert (=> d!132581 (= c!117885 lt!545632)))

(assert (=> d!132581 (= lt!545632 (containsKey!587 (toList!8844 lt!545568) (select (arr!37634 _keys!1208) from!1455)))))

(assert (=> d!132581 (= (contains!6898 lt!545568 (select (arr!37634 _keys!1208) from!1455)) lt!545633)))

(declare-fun b!1203598 () Bool)

(declare-fun lt!545634 () Unit!39889)

(assert (=> b!1203598 (= e!683460 lt!545634)))

(assert (=> b!1203598 (= lt!545634 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545568) (select (arr!37634 _keys!1208) from!1455)))))

(assert (=> b!1203598 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545568) (select (arr!37634 _keys!1208) from!1455)))))

(declare-fun b!1203599 () Bool)

(declare-fun Unit!39905 () Unit!39889)

(assert (=> b!1203599 (= e!683460 Unit!39905)))

(declare-fun b!1203600 () Bool)

(assert (=> b!1203600 (= e!683461 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545568) (select (arr!37634 _keys!1208) from!1455))))))

(assert (= (and d!132581 c!117885) b!1203598))

(assert (= (and d!132581 (not c!117885)) b!1203599))

(assert (= (and d!132581 (not res!800909)) b!1203600))

(assert (=> d!132581 m!1108925))

(declare-fun m!1109379 () Bool)

(assert (=> d!132581 m!1109379))

(assert (=> b!1203598 m!1108925))

(declare-fun m!1109381 () Bool)

(assert (=> b!1203598 m!1109381))

(assert (=> b!1203598 m!1108925))

(declare-fun m!1109383 () Bool)

(assert (=> b!1203598 m!1109383))

(assert (=> b!1203598 m!1109383))

(declare-fun m!1109385 () Bool)

(assert (=> b!1203598 m!1109385))

(assert (=> b!1203600 m!1108925))

(assert (=> b!1203600 m!1109383))

(assert (=> b!1203600 m!1109383))

(assert (=> b!1203600 m!1109385))

(assert (=> b!1203453 d!132581))

(declare-fun d!132583 () Bool)

(assert (=> d!132583 (= (validKeyInArray!0 (select (arr!37634 lt!545424) #b00000000000000000000000000000000)) (and (not (= (select (arr!37634 lt!545424) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37634 lt!545424) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203332 d!132583))

(declare-fun d!132585 () Bool)

(assert (=> d!132585 (isDefined!456 (getValueByKey!631 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934))))

(declare-fun lt!545637 () Unit!39889)

(declare-fun choose!1788 (List!26498 (_ BitVec 64)) Unit!39889)

(assert (=> d!132585 (= lt!545637 (choose!1788 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934))))

(declare-fun e!683464 () Bool)

(assert (=> d!132585 e!683464))

(declare-fun res!800912 () Bool)

(assert (=> d!132585 (=> (not res!800912) (not e!683464))))

(assert (=> d!132585 (= res!800912 (isStrictlySorted!728 (toList!8844 (ite c!117794 lt!545433 call!57992))))))

(assert (=> d!132585 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934) lt!545637)))

(declare-fun b!1203603 () Bool)

(assert (=> b!1203603 (= e!683464 (containsKey!587 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934))))

(assert (= (and d!132585 res!800912) b!1203603))

(assert (=> d!132585 m!1109213))

(assert (=> d!132585 m!1109213))

(assert (=> d!132585 m!1109215))

(declare-fun m!1109387 () Bool)

(assert (=> d!132585 m!1109387))

(declare-fun m!1109389 () Bool)

(assert (=> d!132585 m!1109389))

(assert (=> b!1203603 m!1109209))

(assert (=> b!1203464 d!132585))

(declare-fun d!132587 () Bool)

(declare-fun isEmpty!982 (Option!682) Bool)

(assert (=> d!132587 (= (isDefined!456 (getValueByKey!631 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934)) (not (isEmpty!982 (getValueByKey!631 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934))))))

(declare-fun bs!34065 () Bool)

(assert (= bs!34065 d!132587))

(assert (=> bs!34065 m!1109213))

(declare-fun m!1109391 () Bool)

(assert (=> bs!34065 m!1109391))

(assert (=> b!1203464 d!132587))

(declare-fun b!1203607 () Bool)

(declare-fun e!683466 () Option!682)

(assert (=> b!1203607 (= e!683466 None!680)))

(declare-fun e!683465 () Option!682)

(declare-fun b!1203604 () Bool)

(assert (=> b!1203604 (= e!683465 (Some!681 (_2!9855 (h!27703 (toList!8844 (ite c!117794 lt!545433 call!57992))))))))

(declare-fun b!1203605 () Bool)

(assert (=> b!1203605 (= e!683465 e!683466)))

(declare-fun c!117887 () Bool)

(assert (=> b!1203605 (= c!117887 (and ((_ is Cons!26494) (toList!8844 (ite c!117794 lt!545433 call!57992))) (not (= (_1!9855 (h!27703 (toList!8844 (ite c!117794 lt!545433 call!57992)))) k0!934))))))

(declare-fun b!1203606 () Bool)

(assert (=> b!1203606 (= e!683466 (getValueByKey!631 (t!39377 (toList!8844 (ite c!117794 lt!545433 call!57992))) k0!934))))

(declare-fun d!132589 () Bool)

(declare-fun c!117886 () Bool)

(assert (=> d!132589 (= c!117886 (and ((_ is Cons!26494) (toList!8844 (ite c!117794 lt!545433 call!57992))) (= (_1!9855 (h!27703 (toList!8844 (ite c!117794 lt!545433 call!57992)))) k0!934)))))

(assert (=> d!132589 (= (getValueByKey!631 (toList!8844 (ite c!117794 lt!545433 call!57992)) k0!934) e!683465)))

(assert (= (and d!132589 c!117886) b!1203604))

(assert (= (and d!132589 (not c!117886)) b!1203605))

(assert (= (and b!1203605 c!117887) b!1203606))

(assert (= (and b!1203605 (not c!117887)) b!1203607))

(declare-fun m!1109393 () Bool)

(assert (=> b!1203606 m!1109393))

(assert (=> b!1203464 d!132589))

(declare-fun d!132591 () Bool)

(assert (=> d!132591 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545425) k0!934))))

(declare-fun lt!545638 () Unit!39889)

(assert (=> d!132591 (= lt!545638 (choose!1788 (toList!8844 lt!545425) k0!934))))

(declare-fun e!683467 () Bool)

(assert (=> d!132591 e!683467))

(declare-fun res!800913 () Bool)

(assert (=> d!132591 (=> (not res!800913) (not e!683467))))

(assert (=> d!132591 (= res!800913 (isStrictlySorted!728 (toList!8844 lt!545425)))))

(assert (=> d!132591 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545425) k0!934) lt!545638)))

(declare-fun b!1203608 () Bool)

(assert (=> b!1203608 (= e!683467 (containsKey!587 (toList!8844 lt!545425) k0!934))))

(assert (= (and d!132591 res!800913) b!1203608))

(assert (=> d!132591 m!1109205))

(assert (=> d!132591 m!1109205))

(assert (=> d!132591 m!1109207))

(declare-fun m!1109395 () Bool)

(assert (=> d!132591 m!1109395))

(declare-fun m!1109397 () Bool)

(assert (=> d!132591 m!1109397))

(assert (=> b!1203608 m!1109201))

(assert (=> b!1203461 d!132591))

(declare-fun d!132593 () Bool)

(assert (=> d!132593 (= (isDefined!456 (getValueByKey!631 (toList!8844 lt!545425) k0!934)) (not (isEmpty!982 (getValueByKey!631 (toList!8844 lt!545425) k0!934))))))

(declare-fun bs!34066 () Bool)

(assert (= bs!34066 d!132593))

(assert (=> bs!34066 m!1109205))

(declare-fun m!1109399 () Bool)

(assert (=> bs!34066 m!1109399))

(assert (=> b!1203461 d!132593))

(declare-fun b!1203612 () Bool)

(declare-fun e!683469 () Option!682)

(assert (=> b!1203612 (= e!683469 None!680)))

(declare-fun b!1203609 () Bool)

(declare-fun e!683468 () Option!682)

(assert (=> b!1203609 (= e!683468 (Some!681 (_2!9855 (h!27703 (toList!8844 lt!545425)))))))

(declare-fun b!1203610 () Bool)

(assert (=> b!1203610 (= e!683468 e!683469)))

(declare-fun c!117889 () Bool)

(assert (=> b!1203610 (= c!117889 (and ((_ is Cons!26494) (toList!8844 lt!545425)) (not (= (_1!9855 (h!27703 (toList!8844 lt!545425))) k0!934))))))

(declare-fun b!1203611 () Bool)

(assert (=> b!1203611 (= e!683469 (getValueByKey!631 (t!39377 (toList!8844 lt!545425)) k0!934))))

(declare-fun d!132595 () Bool)

(declare-fun c!117888 () Bool)

(assert (=> d!132595 (= c!117888 (and ((_ is Cons!26494) (toList!8844 lt!545425)) (= (_1!9855 (h!27703 (toList!8844 lt!545425))) k0!934)))))

(assert (=> d!132595 (= (getValueByKey!631 (toList!8844 lt!545425) k0!934) e!683468)))

(assert (= (and d!132595 c!117888) b!1203609))

(assert (= (and d!132595 (not c!117888)) b!1203610))

(assert (= (and b!1203610 c!117889) b!1203611))

(assert (= (and b!1203610 (not c!117889)) b!1203612))

(declare-fun m!1109401 () Bool)

(assert (=> b!1203611 m!1109401))

(assert (=> b!1203461 d!132595))

(assert (=> b!1203333 d!132583))

(assert (=> b!1203466 d!132587))

(assert (=> b!1203466 d!132589))

(assert (=> b!1203463 d!132593))

(assert (=> b!1203463 d!132595))

(assert (=> b!1203434 d!132553))

(declare-fun d!132597 () Bool)

(declare-fun e!683470 () Bool)

(assert (=> d!132597 e!683470))

(declare-fun res!800914 () Bool)

(assert (=> d!132597 (=> (not res!800914) (not e!683470))))

(declare-fun lt!545640 () ListLongMap!17657)

(assert (=> d!132597 (= res!800914 (contains!6898 lt!545640 (_1!9855 (tuple2!19689 lt!545531 lt!545532))))))

(declare-fun lt!545642 () List!26498)

(assert (=> d!132597 (= lt!545640 (ListLongMap!17658 lt!545642))))

(declare-fun lt!545641 () Unit!39889)

(declare-fun lt!545639 () Unit!39889)

(assert (=> d!132597 (= lt!545641 lt!545639)))

(assert (=> d!132597 (= (getValueByKey!631 lt!545642 (_1!9855 (tuple2!19689 lt!545531 lt!545532))) (Some!681 (_2!9855 (tuple2!19689 lt!545531 lt!545532))))))

(assert (=> d!132597 (= lt!545639 (lemmaContainsTupThenGetReturnValue!308 lt!545642 (_1!9855 (tuple2!19689 lt!545531 lt!545532)) (_2!9855 (tuple2!19689 lt!545531 lt!545532))))))

(assert (=> d!132597 (= lt!545642 (insertStrictlySorted!401 (toList!8844 lt!545533) (_1!9855 (tuple2!19689 lt!545531 lt!545532)) (_2!9855 (tuple2!19689 lt!545531 lt!545532))))))

(assert (=> d!132597 (= (+!3970 lt!545533 (tuple2!19689 lt!545531 lt!545532)) lt!545640)))

(declare-fun b!1203613 () Bool)

(declare-fun res!800915 () Bool)

(assert (=> b!1203613 (=> (not res!800915) (not e!683470))))

(assert (=> b!1203613 (= res!800915 (= (getValueByKey!631 (toList!8844 lt!545640) (_1!9855 (tuple2!19689 lt!545531 lt!545532))) (Some!681 (_2!9855 (tuple2!19689 lt!545531 lt!545532)))))))

(declare-fun b!1203614 () Bool)

(assert (=> b!1203614 (= e!683470 (contains!6901 (toList!8844 lt!545640) (tuple2!19689 lt!545531 lt!545532)))))

(assert (= (and d!132597 res!800914) b!1203613))

(assert (= (and b!1203613 res!800915) b!1203614))

(declare-fun m!1109403 () Bool)

(assert (=> d!132597 m!1109403))

(declare-fun m!1109405 () Bool)

(assert (=> d!132597 m!1109405))

(declare-fun m!1109407 () Bool)

(assert (=> d!132597 m!1109407))

(declare-fun m!1109409 () Bool)

(assert (=> d!132597 m!1109409))

(declare-fun m!1109411 () Bool)

(assert (=> b!1203613 m!1109411))

(declare-fun m!1109413 () Bool)

(assert (=> b!1203614 m!1109413))

(assert (=> b!1203405 d!132597))

(declare-fun d!132599 () Bool)

(declare-fun e!683471 () Bool)

(assert (=> d!132599 e!683471))

(declare-fun res!800916 () Bool)

(assert (=> d!132599 (=> (not res!800916) (not e!683471))))

(declare-fun lt!545644 () ListLongMap!17657)

(assert (=> d!132599 (= res!800916 (contains!6898 lt!545644 (_1!9855 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!545646 () List!26498)

(assert (=> d!132599 (= lt!545644 (ListLongMap!17658 lt!545646))))

(declare-fun lt!545645 () Unit!39889)

(declare-fun lt!545643 () Unit!39889)

(assert (=> d!132599 (= lt!545645 lt!545643)))

(assert (=> d!132599 (= (getValueByKey!631 lt!545646 (_1!9855 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!681 (_2!9855 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132599 (= lt!545643 (lemmaContainsTupThenGetReturnValue!308 lt!545646 (_1!9855 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9855 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132599 (= lt!545646 (insertStrictlySorted!401 (toList!8844 call!58030) (_1!9855 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9855 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132599 (= (+!3970 call!58030 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!545644)))

(declare-fun b!1203615 () Bool)

(declare-fun res!800917 () Bool)

(assert (=> b!1203615 (=> (not res!800917) (not e!683471))))

(assert (=> b!1203615 (= res!800917 (= (getValueByKey!631 (toList!8844 lt!545644) (_1!9855 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!681 (_2!9855 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1203616 () Bool)

(assert (=> b!1203616 (= e!683471 (contains!6901 (toList!8844 lt!545644) (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132599 res!800916) b!1203615))

(assert (= (and b!1203615 res!800917) b!1203616))

(declare-fun m!1109415 () Bool)

(assert (=> d!132599 m!1109415))

(declare-fun m!1109417 () Bool)

(assert (=> d!132599 m!1109417))

(declare-fun m!1109419 () Bool)

(assert (=> d!132599 m!1109419))

(declare-fun m!1109421 () Bool)

(assert (=> d!132599 m!1109421))

(declare-fun m!1109423 () Bool)

(assert (=> b!1203615 m!1109423))

(declare-fun m!1109425 () Bool)

(assert (=> b!1203616 m!1109425))

(assert (=> b!1203405 d!132599))

(declare-fun d!132601 () Bool)

(declare-fun e!683473 () Bool)

(assert (=> d!132601 e!683473))

(declare-fun res!800918 () Bool)

(assert (=> d!132601 (=> res!800918 e!683473)))

(declare-fun lt!545649 () Bool)

(assert (=> d!132601 (= res!800918 (not lt!545649))))

(declare-fun lt!545648 () Bool)

(assert (=> d!132601 (= lt!545649 lt!545648)))

(declare-fun lt!545647 () Unit!39889)

(declare-fun e!683472 () Unit!39889)

(assert (=> d!132601 (= lt!545647 e!683472)))

(declare-fun c!117890 () Bool)

(assert (=> d!132601 (= c!117890 lt!545648)))

(assert (=> d!132601 (= lt!545648 (containsKey!587 (toList!8844 (+!3970 lt!545533 (tuple2!19689 lt!545531 lt!545532))) lt!545529))))

(assert (=> d!132601 (= (contains!6898 (+!3970 lt!545533 (tuple2!19689 lt!545531 lt!545532)) lt!545529) lt!545649)))

(declare-fun b!1203617 () Bool)

(declare-fun lt!545650 () Unit!39889)

(assert (=> b!1203617 (= e!683472 lt!545650)))

(assert (=> b!1203617 (= lt!545650 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 (+!3970 lt!545533 (tuple2!19689 lt!545531 lt!545532))) lt!545529))))

(assert (=> b!1203617 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545533 (tuple2!19689 lt!545531 lt!545532))) lt!545529))))

(declare-fun b!1203618 () Bool)

(declare-fun Unit!39906 () Unit!39889)

(assert (=> b!1203618 (= e!683472 Unit!39906)))

(declare-fun b!1203619 () Bool)

(assert (=> b!1203619 (= e!683473 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545533 (tuple2!19689 lt!545531 lt!545532))) lt!545529)))))

(assert (= (and d!132601 c!117890) b!1203617))

(assert (= (and d!132601 (not c!117890)) b!1203618))

(assert (= (and d!132601 (not res!800918)) b!1203619))

(declare-fun m!1109427 () Bool)

(assert (=> d!132601 m!1109427))

(declare-fun m!1109429 () Bool)

(assert (=> b!1203617 m!1109429))

(declare-fun m!1109431 () Bool)

(assert (=> b!1203617 m!1109431))

(assert (=> b!1203617 m!1109431))

(declare-fun m!1109433 () Bool)

(assert (=> b!1203617 m!1109433))

(assert (=> b!1203619 m!1109431))

(assert (=> b!1203619 m!1109431))

(assert (=> b!1203619 m!1109433))

(assert (=> b!1203405 d!132601))

(declare-fun d!132603 () Bool)

(assert (=> d!132603 (not (contains!6898 (+!3970 lt!545533 (tuple2!19689 lt!545531 lt!545532)) lt!545529))))

(declare-fun lt!545653 () Unit!39889)

(declare-fun choose!1789 (ListLongMap!17657 (_ BitVec 64) V!45931 (_ BitVec 64)) Unit!39889)

(assert (=> d!132603 (= lt!545653 (choose!1789 lt!545533 lt!545531 lt!545532 lt!545529))))

(declare-fun e!683476 () Bool)

(assert (=> d!132603 e!683476))

(declare-fun res!800921 () Bool)

(assert (=> d!132603 (=> (not res!800921) (not e!683476))))

(assert (=> d!132603 (= res!800921 (not (contains!6898 lt!545533 lt!545529)))))

(assert (=> d!132603 (= (addStillNotContains!288 lt!545533 lt!545531 lt!545532 lt!545529) lt!545653)))

(declare-fun b!1203623 () Bool)

(assert (=> b!1203623 (= e!683476 (not (= lt!545531 lt!545529)))))

(assert (= (and d!132603 res!800921) b!1203623))

(assert (=> d!132603 m!1109099))

(assert (=> d!132603 m!1109099))

(assert (=> d!132603 m!1109101))

(declare-fun m!1109435 () Bool)

(assert (=> d!132603 m!1109435))

(declare-fun m!1109437 () Bool)

(assert (=> d!132603 m!1109437))

(assert (=> b!1203405 d!132603))

(declare-fun d!132605 () Bool)

(declare-fun c!117891 () Bool)

(assert (=> d!132605 (= c!117891 ((_ is ValueCellFull!14592) (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!683477 () V!45931)

(assert (=> d!132605 (= (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!683477)))

(declare-fun b!1203624 () Bool)

(assert (=> b!1203624 (= e!683477 (get!19182 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203625 () Bool)

(assert (=> b!1203625 (= e!683477 (get!19183 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132605 c!117891) b!1203624))

(assert (= (and d!132605 (not c!117891)) b!1203625))

(assert (=> b!1203624 m!1109081))

(assert (=> b!1203624 m!1108891))

(declare-fun m!1109439 () Bool)

(assert (=> b!1203624 m!1109439))

(assert (=> b!1203625 m!1109081))

(assert (=> b!1203625 m!1108891))

(declare-fun m!1109441 () Bool)

(assert (=> b!1203625 m!1109441))

(assert (=> b!1203405 d!132605))

(declare-fun d!132607 () Bool)

(assert (=> d!132607 (= (validKeyInArray!0 (select (arr!37634 _keys!1208) from!1455)) (and (not (= (select (arr!37634 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37634 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203449 d!132607))

(declare-fun d!132609 () Bool)

(declare-fun e!683479 () Bool)

(assert (=> d!132609 e!683479))

(declare-fun res!800922 () Bool)

(assert (=> d!132609 (=> res!800922 e!683479)))

(declare-fun lt!545656 () Bool)

(assert (=> d!132609 (= res!800922 (not lt!545656))))

(declare-fun lt!545655 () Bool)

(assert (=> d!132609 (= lt!545656 lt!545655)))

(declare-fun lt!545654 () Unit!39889)

(declare-fun e!683478 () Unit!39889)

(assert (=> d!132609 (= lt!545654 e!683478)))

(declare-fun c!117892 () Bool)

(assert (=> d!132609 (= c!117892 lt!545655)))

(assert (=> d!132609 (= lt!545655 (containsKey!587 (toList!8844 lt!545512) (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!132609 (= (contains!6898 lt!545512 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455))) lt!545656)))

(declare-fun b!1203626 () Bool)

(declare-fun lt!545657 () Unit!39889)

(assert (=> b!1203626 (= e!683478 lt!545657)))

(assert (=> b!1203626 (= lt!545657 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545512) (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203626 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545512) (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1203627 () Bool)

(declare-fun Unit!39907 () Unit!39889)

(assert (=> b!1203627 (= e!683478 Unit!39907)))

(declare-fun b!1203628 () Bool)

(assert (=> b!1203628 (= e!683479 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545512) (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!132609 c!117892) b!1203626))

(assert (= (and d!132609 (not c!117892)) b!1203627))

(assert (= (and d!132609 (not res!800922)) b!1203628))

(assert (=> d!132609 m!1109027))

(declare-fun m!1109443 () Bool)

(assert (=> d!132609 m!1109443))

(assert (=> b!1203626 m!1109027))

(declare-fun m!1109445 () Bool)

(assert (=> b!1203626 m!1109445))

(assert (=> b!1203626 m!1109027))

(declare-fun m!1109447 () Bool)

(assert (=> b!1203626 m!1109447))

(assert (=> b!1203626 m!1109447))

(declare-fun m!1109449 () Bool)

(assert (=> b!1203626 m!1109449))

(assert (=> b!1203628 m!1109027))

(assert (=> b!1203628 m!1109447))

(assert (=> b!1203628 m!1109447))

(assert (=> b!1203628 m!1109449))

(assert (=> b!1203376 d!132609))

(declare-fun d!132611 () Bool)

(declare-fun e!683481 () Bool)

(assert (=> d!132611 e!683481))

(declare-fun res!800923 () Bool)

(assert (=> d!132611 (=> res!800923 e!683481)))

(declare-fun lt!545660 () Bool)

(assert (=> d!132611 (= res!800923 (not lt!545660))))

(declare-fun lt!545659 () Bool)

(assert (=> d!132611 (= lt!545660 lt!545659)))

(declare-fun lt!545658 () Unit!39889)

(declare-fun e!683480 () Unit!39889)

(assert (=> d!132611 (= lt!545658 e!683480)))

(declare-fun c!117893 () Bool)

(assert (=> d!132611 (= c!117893 lt!545659)))

(assert (=> d!132611 (= lt!545659 (containsKey!587 (toList!8844 lt!545527) k0!934))))

(assert (=> d!132611 (= (contains!6898 lt!545527 k0!934) lt!545660)))

(declare-fun b!1203629 () Bool)

(declare-fun lt!545661 () Unit!39889)

(assert (=> b!1203629 (= e!683480 lt!545661)))

(assert (=> b!1203629 (= lt!545661 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545527) k0!934))))

(assert (=> b!1203629 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545527) k0!934))))

(declare-fun b!1203630 () Bool)

(declare-fun Unit!39908 () Unit!39889)

(assert (=> b!1203630 (= e!683480 Unit!39908)))

(declare-fun b!1203631 () Bool)

(assert (=> b!1203631 (= e!683481 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545527) k0!934)))))

(assert (= (and d!132611 c!117893) b!1203629))

(assert (= (and d!132611 (not c!117893)) b!1203630))

(assert (= (and d!132611 (not res!800923)) b!1203631))

(declare-fun m!1109451 () Bool)

(assert (=> d!132611 m!1109451))

(declare-fun m!1109453 () Bool)

(assert (=> b!1203629 m!1109453))

(declare-fun m!1109455 () Bool)

(assert (=> b!1203629 m!1109455))

(assert (=> b!1203629 m!1109455))

(declare-fun m!1109457 () Bool)

(assert (=> b!1203629 m!1109457))

(assert (=> b!1203631 m!1109455))

(assert (=> b!1203631 m!1109455))

(assert (=> b!1203631 m!1109457))

(assert (=> d!132501 d!132611))

(declare-fun b!1203642 () Bool)

(declare-fun e!683490 () List!26498)

(declare-fun e!683488 () List!26498)

(assert (=> b!1203642 (= e!683490 e!683488)))

(declare-fun c!117899 () Bool)

(assert (=> b!1203642 (= c!117899 (and ((_ is Cons!26494) (toList!8844 call!57995)) (not (= (_1!9855 (h!27703 (toList!8844 call!57995))) k0!934))))))

(declare-fun b!1203643 () Bool)

(assert (=> b!1203643 (= e!683490 (t!39377 (toList!8844 call!57995)))))

(declare-fun b!1203644 () Bool)

(declare-fun e!683489 () Bool)

(declare-fun lt!545664 () List!26498)

(assert (=> b!1203644 (= e!683489 (not (containsKey!587 lt!545664 k0!934)))))

(declare-fun b!1203645 () Bool)

(assert (=> b!1203645 (= e!683488 ($colon$colon!609 (removeStrictlySorted!93 (t!39377 (toList!8844 call!57995)) k0!934) (h!27703 (toList!8844 call!57995))))))

(declare-fun d!132613 () Bool)

(assert (=> d!132613 e!683489))

(declare-fun res!800926 () Bool)

(assert (=> d!132613 (=> (not res!800926) (not e!683489))))

(assert (=> d!132613 (= res!800926 (isStrictlySorted!728 lt!545664))))

(assert (=> d!132613 (= lt!545664 e!683490)))

(declare-fun c!117898 () Bool)

(assert (=> d!132613 (= c!117898 (and ((_ is Cons!26494) (toList!8844 call!57995)) (= (_1!9855 (h!27703 (toList!8844 call!57995))) k0!934)))))

(assert (=> d!132613 (isStrictlySorted!728 (toList!8844 call!57995))))

(assert (=> d!132613 (= (removeStrictlySorted!93 (toList!8844 call!57995) k0!934) lt!545664)))

(declare-fun b!1203646 () Bool)

(assert (=> b!1203646 (= e!683488 Nil!26495)))

(assert (= (and d!132613 c!117898) b!1203643))

(assert (= (and d!132613 (not c!117898)) b!1203642))

(assert (= (and b!1203642 c!117899) b!1203645))

(assert (= (and b!1203642 (not c!117899)) b!1203646))

(assert (= (and d!132613 res!800926) b!1203644))

(declare-fun m!1109459 () Bool)

(assert (=> b!1203644 m!1109459))

(declare-fun m!1109461 () Bool)

(assert (=> b!1203645 m!1109461))

(assert (=> b!1203645 m!1109461))

(declare-fun m!1109463 () Bool)

(assert (=> b!1203645 m!1109463))

(declare-fun m!1109465 () Bool)

(assert (=> d!132613 m!1109465))

(declare-fun m!1109467 () Bool)

(assert (=> d!132613 m!1109467))

(assert (=> d!132501 d!132613))

(declare-fun bm!58053 () Bool)

(declare-fun call!58057 () ListLongMap!17657)

(assert (=> bm!58053 (= call!58057 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58054 () Bool)

(declare-fun call!58056 () ListLongMap!17657)

(assert (=> bm!58054 (= call!58056 (getCurrentListMapNoExtraKeys!5280 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)) (array!77982 (store (arr!37635 _values!996) i!673 (ValueCellFull!14592 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38171 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!683493 () Bool)

(declare-fun b!1203651 () Bool)

(assert (=> b!1203651 (= e!683493 (= call!58056 (-!1810 call!58057 k0!934)))))

(declare-fun d!132615 () Bool)

(assert (=> d!132615 e!683493))

(declare-fun c!117902 () Bool)

(assert (=> d!132615 (= c!117902 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (=> d!132615 true))

(declare-fun _$12!465 () Unit!39889)

(assert (=> d!132615 (= (choose!1786 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) _$12!465)))

(declare-fun b!1203652 () Bool)

(assert (=> b!1203652 (= e!683493 (= call!58056 call!58057))))

(assert (= (and d!132615 c!117902) b!1203651))

(assert (= (and d!132615 (not c!117902)) b!1203652))

(assert (= (or b!1203651 b!1203652) bm!58053))

(assert (= (or b!1203651 b!1203652) bm!58054))

(declare-fun b_lambda!21141 () Bool)

(assert (=> (not b_lambda!21141) (not bm!58054)))

(assert (=> bm!58054 t!39376))

(declare-fun b_and!42715 () Bool)

(assert (= b_and!42713 (and (=> t!39376 result!21975) b_and!42715)))

(assert (=> bm!58053 m!1108923))

(assert (=> bm!58054 m!1108885))

(assert (=> bm!58054 m!1108891))

(assert (=> bm!58054 m!1108893))

(assert (=> bm!58054 m!1109133))

(declare-fun m!1109469 () Bool)

(assert (=> b!1203651 m!1109469))

(assert (=> d!132511 d!132615))

(declare-fun b!1203653 () Bool)

(declare-fun e!683494 () Bool)

(declare-fun call!58058 () Bool)

(assert (=> b!1203653 (= e!683494 call!58058)))

(declare-fun d!132617 () Bool)

(declare-fun res!800928 () Bool)

(declare-fun e!683495 () Bool)

(assert (=> d!132617 (=> res!800928 e!683495)))

(assert (=> d!132617 (= res!800928 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(assert (=> d!132617 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564) e!683495)))

(declare-fun b!1203654 () Bool)

(declare-fun e!683496 () Bool)

(assert (=> b!1203654 (= e!683496 call!58058)))

(declare-fun b!1203655 () Bool)

(assert (=> b!1203655 (= e!683494 e!683496)))

(declare-fun lt!545665 () (_ BitVec 64))

(assert (=> b!1203655 (= lt!545665 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!545666 () Unit!39889)

(assert (=> b!1203655 (= lt!545666 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!545665 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1203655 (arrayContainsKey!0 _keys!1208 lt!545665 #b00000000000000000000000000000000)))

(declare-fun lt!545667 () Unit!39889)

(assert (=> b!1203655 (= lt!545667 lt!545666)))

(declare-fun res!800927 () Bool)

(assert (=> b!1203655 (= res!800927 (= (seekEntryOrOpen!0 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1208 mask!1564) (Found!9933 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1203655 (=> (not res!800927) (not e!683496))))

(declare-fun bm!58055 () Bool)

(assert (=> bm!58055 (= call!58058 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1203656 () Bool)

(assert (=> b!1203656 (= e!683495 e!683494)))

(declare-fun c!117903 () Bool)

(assert (=> b!1203656 (= c!117903 (validKeyInArray!0 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!132617 (not res!800928)) b!1203656))

(assert (= (and b!1203656 c!117903) b!1203655))

(assert (= (and b!1203656 (not c!117903)) b!1203653))

(assert (= (and b!1203655 res!800927) b!1203654))

(assert (= (or b!1203654 b!1203653) bm!58055))

(assert (=> b!1203655 m!1109325))

(declare-fun m!1109471 () Bool)

(assert (=> b!1203655 m!1109471))

(declare-fun m!1109473 () Bool)

(assert (=> b!1203655 m!1109473))

(assert (=> b!1203655 m!1109325))

(declare-fun m!1109475 () Bool)

(assert (=> b!1203655 m!1109475))

(declare-fun m!1109477 () Bool)

(assert (=> bm!58055 m!1109477))

(assert (=> b!1203656 m!1109325))

(assert (=> b!1203656 m!1109325))

(assert (=> b!1203656 m!1109327))

(assert (=> bm!58025 d!132617))

(declare-fun d!132619 () Bool)

(declare-fun e!683498 () Bool)

(assert (=> d!132619 e!683498))

(declare-fun res!800929 () Bool)

(assert (=> d!132619 (=> res!800929 e!683498)))

(declare-fun lt!545670 () Bool)

(assert (=> d!132619 (= res!800929 (not lt!545670))))

(declare-fun lt!545669 () Bool)

(assert (=> d!132619 (= lt!545670 lt!545669)))

(declare-fun lt!545668 () Unit!39889)

(declare-fun e!683497 () Unit!39889)

(assert (=> d!132619 (= lt!545668 e!683497)))

(declare-fun c!117904 () Bool)

(assert (=> d!132619 (= c!117904 lt!545669)))

(assert (=> d!132619 (= lt!545669 (containsKey!587 (toList!8844 lt!545536) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132619 (= (contains!6898 lt!545536 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) lt!545670)))

(declare-fun b!1203657 () Bool)

(declare-fun lt!545671 () Unit!39889)

(assert (=> b!1203657 (= e!683497 lt!545671)))

(assert (=> b!1203657 (= lt!545671 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545536) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> b!1203657 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545536) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1203658 () Bool)

(declare-fun Unit!39909 () Unit!39889)

(assert (=> b!1203658 (= e!683497 Unit!39909)))

(declare-fun b!1203659 () Bool)

(assert (=> b!1203659 (= e!683498 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545536) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (= (and d!132619 c!117904) b!1203657))

(assert (= (and d!132619 (not c!117904)) b!1203658))

(assert (= (and d!132619 (not res!800929)) b!1203659))

(declare-fun m!1109479 () Bool)

(assert (=> d!132619 m!1109479))

(declare-fun m!1109481 () Bool)

(assert (=> b!1203657 m!1109481))

(assert (=> b!1203657 m!1109113))

(assert (=> b!1203657 m!1109113))

(declare-fun m!1109483 () Bool)

(assert (=> b!1203657 m!1109483))

(assert (=> b!1203659 m!1109113))

(assert (=> b!1203659 m!1109113))

(assert (=> b!1203659 m!1109483))

(assert (=> d!132505 d!132619))

(declare-fun b!1203663 () Bool)

(declare-fun e!683500 () Option!682)

(assert (=> b!1203663 (= e!683500 None!680)))

(declare-fun b!1203660 () Bool)

(declare-fun e!683499 () Option!682)

(assert (=> b!1203660 (= e!683499 (Some!681 (_2!9855 (h!27703 lt!545538))))))

(declare-fun b!1203661 () Bool)

(assert (=> b!1203661 (= e!683499 e!683500)))

(declare-fun c!117906 () Bool)

(assert (=> b!1203661 (= c!117906 (and ((_ is Cons!26494) lt!545538) (not (= (_1!9855 (h!27703 lt!545538)) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))))

(declare-fun b!1203662 () Bool)

(assert (=> b!1203662 (= e!683500 (getValueByKey!631 (t!39377 lt!545538) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun d!132621 () Bool)

(declare-fun c!117905 () Bool)

(assert (=> d!132621 (= c!117905 (and ((_ is Cons!26494) lt!545538) (= (_1!9855 (h!27703 lt!545538)) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (=> d!132621 (= (getValueByKey!631 lt!545538 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) e!683499)))

(assert (= (and d!132621 c!117905) b!1203660))

(assert (= (and d!132621 (not c!117905)) b!1203661))

(assert (= (and b!1203661 c!117906) b!1203662))

(assert (= (and b!1203661 (not c!117906)) b!1203663))

(declare-fun m!1109485 () Bool)

(assert (=> b!1203662 m!1109485))

(assert (=> d!132505 d!132621))

(declare-fun d!132623 () Bool)

(assert (=> d!132623 (= (getValueByKey!631 lt!545538 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!681 (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!545672 () Unit!39889)

(assert (=> d!132623 (= lt!545672 (choose!1787 lt!545538 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun e!683501 () Bool)

(assert (=> d!132623 e!683501))

(declare-fun res!800930 () Bool)

(assert (=> d!132623 (=> (not res!800930) (not e!683501))))

(assert (=> d!132623 (= res!800930 (isStrictlySorted!728 lt!545538))))

(assert (=> d!132623 (= (lemmaContainsTupThenGetReturnValue!308 lt!545538 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) lt!545672)))

(declare-fun b!1203664 () Bool)

(declare-fun res!800931 () Bool)

(assert (=> b!1203664 (=> (not res!800931) (not e!683501))))

(assert (=> b!1203664 (= res!800931 (containsKey!587 lt!545538 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1203665 () Bool)

(assert (=> b!1203665 (= e!683501 (contains!6901 lt!545538 (tuple2!19689 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (= (and d!132623 res!800930) b!1203664))

(assert (= (and b!1203664 res!800931) b!1203665))

(assert (=> d!132623 m!1109107))

(declare-fun m!1109487 () Bool)

(assert (=> d!132623 m!1109487))

(declare-fun m!1109489 () Bool)

(assert (=> d!132623 m!1109489))

(declare-fun m!1109491 () Bool)

(assert (=> b!1203664 m!1109491))

(declare-fun m!1109493 () Bool)

(assert (=> b!1203665 m!1109493))

(assert (=> d!132505 d!132623))

(declare-fun b!1203666 () Bool)

(declare-fun e!683506 () Bool)

(declare-fun lt!545673 () List!26498)

(assert (=> b!1203666 (= e!683506 (contains!6901 lt!545673 (tuple2!19689 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1203667 () Bool)

(declare-fun e!683504 () List!26498)

(declare-fun call!58059 () List!26498)

(assert (=> b!1203667 (= e!683504 call!58059)))

(declare-fun b!1203668 () Bool)

(declare-fun e!683503 () List!26498)

(declare-fun e!683502 () List!26498)

(assert (=> b!1203668 (= e!683503 e!683502)))

(declare-fun c!117907 () Bool)

(assert (=> b!1203668 (= c!117907 (and ((_ is Cons!26494) (toList!8844 lt!545425)) (= (_1!9855 (h!27703 (toList!8844 lt!545425))) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun e!683505 () List!26498)

(declare-fun c!117908 () Bool)

(declare-fun b!1203669 () Bool)

(assert (=> b!1203669 (= e!683505 (ite c!117907 (t!39377 (toList!8844 lt!545425)) (ite c!117908 (Cons!26494 (h!27703 (toList!8844 lt!545425)) (t!39377 (toList!8844 lt!545425))) Nil!26495)))))

(declare-fun bm!58056 () Bool)

(declare-fun call!58060 () List!26498)

(declare-fun call!58061 () List!26498)

(assert (=> bm!58056 (= call!58060 call!58061)))

(declare-fun b!1203670 () Bool)

(assert (=> b!1203670 (= e!683503 call!58061)))

(declare-fun b!1203672 () Bool)

(assert (=> b!1203672 (= e!683502 call!58060)))

(declare-fun c!117910 () Bool)

(declare-fun bm!58057 () Bool)

(assert (=> bm!58057 (= call!58061 ($colon$colon!609 e!683505 (ite c!117910 (h!27703 (toList!8844 lt!545425)) (tuple2!19689 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))))

(declare-fun c!117909 () Bool)

(assert (=> bm!58057 (= c!117909 c!117910)))

(declare-fun b!1203673 () Bool)

(assert (=> b!1203673 (= e!683505 (insertStrictlySorted!401 (t!39377 (toList!8844 lt!545425)) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun bm!58058 () Bool)

(assert (=> bm!58058 (= call!58059 call!58060)))

(declare-fun b!1203674 () Bool)

(declare-fun res!800933 () Bool)

(assert (=> b!1203674 (=> (not res!800933) (not e!683506))))

(assert (=> b!1203674 (= res!800933 (containsKey!587 lt!545673 (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun b!1203675 () Bool)

(assert (=> b!1203675 (= c!117908 (and ((_ is Cons!26494) (toList!8844 lt!545425)) (bvsgt (_1!9855 (h!27703 (toList!8844 lt!545425))) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (=> b!1203675 (= e!683502 e!683504)))

(declare-fun d!132625 () Bool)

(assert (=> d!132625 e!683506))

(declare-fun res!800932 () Bool)

(assert (=> d!132625 (=> (not res!800932) (not e!683506))))

(assert (=> d!132625 (= res!800932 (isStrictlySorted!728 lt!545673))))

(assert (=> d!132625 (= lt!545673 e!683503)))

(assert (=> d!132625 (= c!117910 (and ((_ is Cons!26494) (toList!8844 lt!545425)) (bvslt (_1!9855 (h!27703 (toList!8844 lt!545425))) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(assert (=> d!132625 (isStrictlySorted!728 (toList!8844 lt!545425))))

(assert (=> d!132625 (= (insertStrictlySorted!401 (toList!8844 lt!545425) (_1!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9855 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) lt!545673)))

(declare-fun b!1203671 () Bool)

(assert (=> b!1203671 (= e!683504 call!58059)))

(assert (= (and d!132625 c!117910) b!1203670))

(assert (= (and d!132625 (not c!117910)) b!1203668))

(assert (= (and b!1203668 c!117907) b!1203672))

(assert (= (and b!1203668 (not c!117907)) b!1203675))

(assert (= (and b!1203675 c!117908) b!1203671))

(assert (= (and b!1203675 (not c!117908)) b!1203667))

(assert (= (or b!1203671 b!1203667) bm!58058))

(assert (= (or b!1203672 bm!58058) bm!58056))

(assert (= (or b!1203670 bm!58056) bm!58057))

(assert (= (and bm!58057 c!117909) b!1203673))

(assert (= (and bm!58057 (not c!117909)) b!1203669))

(assert (= (and d!132625 res!800932) b!1203674))

(assert (= (and b!1203674 res!800933) b!1203666))

(declare-fun m!1109495 () Bool)

(assert (=> bm!58057 m!1109495))

(declare-fun m!1109497 () Bool)

(assert (=> b!1203674 m!1109497))

(declare-fun m!1109499 () Bool)

(assert (=> b!1203673 m!1109499))

(declare-fun m!1109501 () Bool)

(assert (=> d!132625 m!1109501))

(assert (=> d!132625 m!1109397))

(declare-fun m!1109503 () Bool)

(assert (=> b!1203666 m!1109503))

(assert (=> d!132505 d!132625))

(declare-fun b!1203676 () Bool)

(declare-fun e!683511 () ListLongMap!17657)

(declare-fun call!58062 () ListLongMap!17657)

(assert (=> b!1203676 (= e!683511 call!58062)))

(declare-fun b!1203677 () Bool)

(declare-fun e!683508 () Bool)

(declare-fun e!683513 () Bool)

(assert (=> b!1203677 (= e!683508 e!683513)))

(declare-fun c!117912 () Bool)

(declare-fun e!683509 () Bool)

(assert (=> b!1203677 (= c!117912 e!683509)))

(declare-fun res!800935 () Bool)

(assert (=> b!1203677 (=> (not res!800935) (not e!683509))))

(assert (=> b!1203677 (= res!800935 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)))))))

(declare-fun b!1203678 () Bool)

(declare-fun e!683512 () Bool)

(assert (=> b!1203678 (= e!683513 e!683512)))

(declare-fun c!117914 () Bool)

(assert (=> b!1203678 (= c!117914 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)))))))

(declare-fun b!1203679 () Bool)

(assert (=> b!1203679 (= e!683509 (validKeyInArray!0 (select (arr!37634 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203679 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1203680 () Bool)

(declare-fun e!683510 () ListLongMap!17657)

(assert (=> b!1203680 (= e!683510 (ListLongMap!17658 Nil!26495))))

(declare-fun d!132627 () Bool)

(assert (=> d!132627 e!683508))

(declare-fun res!800934 () Bool)

(assert (=> d!132627 (=> (not res!800934) (not e!683508))))

(declare-fun lt!545680 () ListLongMap!17657)

(assert (=> d!132627 (= res!800934 (not (contains!6898 lt!545680 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132627 (= lt!545680 e!683510)))

(declare-fun c!117911 () Bool)

(assert (=> d!132627 (= c!117911 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)))))))

(assert (=> d!132627 (validMask!0 mask!1564)))

(assert (=> d!132627 (= (getCurrentListMapNoExtraKeys!5280 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)) (array!77982 (store (arr!37635 _values!996) i!673 (ValueCellFull!14592 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38171 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545680)))

(declare-fun b!1203681 () Bool)

(assert (=> b!1203681 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)))))))

(assert (=> b!1203681 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38171 (array!77982 (store (arr!37635 _values!996) i!673 (ValueCellFull!14592 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38171 _values!996)))))))

(declare-fun e!683507 () Bool)

(assert (=> b!1203681 (= e!683507 (= (apply!960 lt!545680 (select (arr!37634 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19180 (select (arr!37635 (array!77982 (store (arr!37635 _values!996) i!673 (ValueCellFull!14592 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38171 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58059 () Bool)

(assert (=> bm!58059 (= call!58062 (getCurrentListMapNoExtraKeys!5280 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)) (array!77982 (store (arr!37635 _values!996) i!673 (ValueCellFull!14592 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38171 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203682 () Bool)

(assert (=> b!1203682 (= e!683510 e!683511)))

(declare-fun c!117913 () Bool)

(assert (=> b!1203682 (= c!117913 (validKeyInArray!0 (select (arr!37634 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1203683 () Bool)

(assert (=> b!1203683 (= e!683512 (= lt!545680 (getCurrentListMapNoExtraKeys!5280 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)) (array!77982 (store (arr!37635 _values!996) i!673 (ValueCellFull!14592 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38171 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203684 () Bool)

(assert (=> b!1203684 (= e!683512 (isEmpty!980 lt!545680))))

(declare-fun b!1203685 () Bool)

(declare-fun res!800937 () Bool)

(assert (=> b!1203685 (=> (not res!800937) (not e!683508))))

(assert (=> b!1203685 (= res!800937 (not (contains!6898 lt!545680 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203686 () Bool)

(assert (=> b!1203686 (= e!683513 e!683507)))

(assert (=> b!1203686 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38170 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208)))))))

(declare-fun res!800936 () Bool)

(assert (=> b!1203686 (= res!800936 (contains!6898 lt!545680 (select (arr!37634 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203686 (=> (not res!800936) (not e!683507))))

(declare-fun b!1203687 () Bool)

(declare-fun lt!545676 () Unit!39889)

(declare-fun lt!545674 () Unit!39889)

(assert (=> b!1203687 (= lt!545676 lt!545674)))

(declare-fun lt!545675 () (_ BitVec 64))

(declare-fun lt!545679 () ListLongMap!17657)

(declare-fun lt!545678 () V!45931)

(declare-fun lt!545677 () (_ BitVec 64))

(assert (=> b!1203687 (not (contains!6898 (+!3970 lt!545679 (tuple2!19689 lt!545677 lt!545678)) lt!545675))))

(assert (=> b!1203687 (= lt!545674 (addStillNotContains!288 lt!545679 lt!545677 lt!545678 lt!545675))))

(assert (=> b!1203687 (= lt!545675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203687 (= lt!545678 (get!19180 (select (arr!37635 (array!77982 (store (arr!37635 _values!996) i!673 (ValueCellFull!14592 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38171 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203687 (= lt!545677 (select (arr!37634 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1203687 (= lt!545679 call!58062)))

(assert (=> b!1203687 (= e!683511 (+!3970 call!58062 (tuple2!19689 (select (arr!37634 (array!77980 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38170 _keys!1208))) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 (array!77982 (store (arr!37635 _values!996) i!673 (ValueCellFull!14592 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38171 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132627 c!117911) b!1203680))

(assert (= (and d!132627 (not c!117911)) b!1203682))

(assert (= (and b!1203682 c!117913) b!1203687))

(assert (= (and b!1203682 (not c!117913)) b!1203676))

(assert (= (or b!1203687 b!1203676) bm!58059))

(assert (= (and d!132627 res!800934) b!1203685))

(assert (= (and b!1203685 res!800937) b!1203677))

(assert (= (and b!1203677 res!800935) b!1203679))

(assert (= (and b!1203677 c!117912) b!1203686))

(assert (= (and b!1203677 (not c!117912)) b!1203678))

(assert (= (and b!1203686 res!800936) b!1203681))

(assert (= (and b!1203678 c!117914) b!1203683))

(assert (= (and b!1203678 (not c!117914)) b!1203684))

(declare-fun b_lambda!21143 () Bool)

(assert (=> (not b_lambda!21143) (not b!1203681)))

(assert (=> b!1203681 t!39376))

(declare-fun b_and!42717 () Bool)

(assert (= b_and!42715 (and (=> t!39376 result!21975) b_and!42717)))

(declare-fun b_lambda!21145 () Bool)

(assert (=> (not b_lambda!21145) (not b!1203687)))

(assert (=> b!1203687 t!39376))

(declare-fun b_and!42719 () Bool)

(assert (= b_and!42717 (and (=> t!39376 result!21975) b_and!42719)))

(declare-fun m!1109505 () Bool)

(assert (=> bm!58059 m!1109505))

(declare-fun m!1109507 () Bool)

(assert (=> b!1203681 m!1109507))

(declare-fun m!1109509 () Bool)

(assert (=> b!1203681 m!1109509))

(assert (=> b!1203681 m!1108891))

(declare-fun m!1109511 () Bool)

(assert (=> b!1203681 m!1109511))

(assert (=> b!1203681 m!1108891))

(assert (=> b!1203681 m!1109507))

(declare-fun m!1109513 () Bool)

(assert (=> b!1203681 m!1109513))

(assert (=> b!1203681 m!1109509))

(assert (=> b!1203679 m!1109507))

(assert (=> b!1203679 m!1109507))

(declare-fun m!1109515 () Bool)

(assert (=> b!1203679 m!1109515))

(assert (=> b!1203682 m!1109507))

(assert (=> b!1203682 m!1109507))

(assert (=> b!1203682 m!1109515))

(declare-fun m!1109517 () Bool)

(assert (=> b!1203685 m!1109517))

(declare-fun m!1109519 () Bool)

(assert (=> b!1203684 m!1109519))

(declare-fun m!1109521 () Bool)

(assert (=> d!132627 m!1109521))

(assert (=> d!132627 m!1108917))

(assert (=> b!1203687 m!1109507))

(declare-fun m!1109523 () Bool)

(assert (=> b!1203687 m!1109523))

(assert (=> b!1203687 m!1109509))

(assert (=> b!1203687 m!1108891))

(assert (=> b!1203687 m!1109511))

(assert (=> b!1203687 m!1108891))

(declare-fun m!1109525 () Bool)

(assert (=> b!1203687 m!1109525))

(declare-fun m!1109527 () Bool)

(assert (=> b!1203687 m!1109527))

(declare-fun m!1109529 () Bool)

(assert (=> b!1203687 m!1109529))

(assert (=> b!1203687 m!1109527))

(assert (=> b!1203687 m!1109509))

(assert (=> b!1203683 m!1109505))

(assert (=> b!1203686 m!1109507))

(assert (=> b!1203686 m!1109507))

(declare-fun m!1109531 () Bool)

(assert (=> b!1203686 m!1109531))

(assert (=> bm!58032 d!132627))

(declare-fun b!1203688 () Bool)

(declare-fun e!683518 () ListLongMap!17657)

(declare-fun call!58063 () ListLongMap!17657)

(assert (=> b!1203688 (= e!683518 call!58063)))

(declare-fun b!1203689 () Bool)

(declare-fun e!683515 () Bool)

(declare-fun e!683520 () Bool)

(assert (=> b!1203689 (= e!683515 e!683520)))

(declare-fun c!117916 () Bool)

(declare-fun e!683516 () Bool)

(assert (=> b!1203689 (= c!117916 e!683516)))

(declare-fun res!800939 () Bool)

(assert (=> b!1203689 (=> (not res!800939) (not e!683516))))

(assert (=> b!1203689 (= res!800939 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(declare-fun b!1203690 () Bool)

(declare-fun e!683519 () Bool)

(assert (=> b!1203690 (= e!683520 e!683519)))

(declare-fun c!117918 () Bool)

(assert (=> b!1203690 (= c!117918 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(declare-fun b!1203691 () Bool)

(assert (=> b!1203691 (= e!683516 (validKeyInArray!0 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203691 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1203692 () Bool)

(declare-fun e!683517 () ListLongMap!17657)

(assert (=> b!1203692 (= e!683517 (ListLongMap!17658 Nil!26495))))

(declare-fun d!132629 () Bool)

(assert (=> d!132629 e!683515))

(declare-fun res!800938 () Bool)

(assert (=> d!132629 (=> (not res!800938) (not e!683515))))

(declare-fun lt!545687 () ListLongMap!17657)

(assert (=> d!132629 (= res!800938 (not (contains!6898 lt!545687 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132629 (= lt!545687 e!683517)))

(declare-fun c!117915 () Bool)

(assert (=> d!132629 (= c!117915 (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(assert (=> d!132629 (validMask!0 mask!1564)))

(assert (=> d!132629 (= (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!545687)))

(declare-fun b!1203693 () Bool)

(assert (=> b!1203693 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(assert (=> b!1203693 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38171 _values!996)))))

(declare-fun e!683514 () Bool)

(assert (=> b!1203693 (= e!683514 (= (apply!960 lt!545687 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58060 () Bool)

(assert (=> bm!58060 (= call!58063 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203694 () Bool)

(assert (=> b!1203694 (= e!683517 e!683518)))

(declare-fun c!117917 () Bool)

(assert (=> b!1203694 (= c!117917 (validKeyInArray!0 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1203695 () Bool)

(assert (=> b!1203695 (= e!683519 (= lt!545687 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203696 () Bool)

(assert (=> b!1203696 (= e!683519 (isEmpty!980 lt!545687))))

(declare-fun b!1203697 () Bool)

(declare-fun res!800941 () Bool)

(assert (=> b!1203697 (=> (not res!800941) (not e!683515))))

(assert (=> b!1203697 (= res!800941 (not (contains!6898 lt!545687 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203698 () Bool)

(assert (=> b!1203698 (= e!683520 e!683514)))

(assert (=> b!1203698 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(declare-fun res!800940 () Bool)

(assert (=> b!1203698 (= res!800940 (contains!6898 lt!545687 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203698 (=> (not res!800940) (not e!683514))))

(declare-fun b!1203699 () Bool)

(declare-fun lt!545683 () Unit!39889)

(declare-fun lt!545681 () Unit!39889)

(assert (=> b!1203699 (= lt!545683 lt!545681)))

(declare-fun lt!545686 () ListLongMap!17657)

(declare-fun lt!545682 () (_ BitVec 64))

(declare-fun lt!545685 () V!45931)

(declare-fun lt!545684 () (_ BitVec 64))

(assert (=> b!1203699 (not (contains!6898 (+!3970 lt!545686 (tuple2!19689 lt!545684 lt!545685)) lt!545682))))

(assert (=> b!1203699 (= lt!545681 (addStillNotContains!288 lt!545686 lt!545684 lt!545685 lt!545682))))

(assert (=> b!1203699 (= lt!545682 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203699 (= lt!545685 (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203699 (= lt!545684 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1203699 (= lt!545686 call!58063)))

(assert (=> b!1203699 (= e!683518 (+!3970 call!58063 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (get!19180 (select (arr!37635 _values!996) (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132629 c!117915) b!1203692))

(assert (= (and d!132629 (not c!117915)) b!1203694))

(assert (= (and b!1203694 c!117917) b!1203699))

(assert (= (and b!1203694 (not c!117917)) b!1203688))

(assert (= (or b!1203699 b!1203688) bm!58060))

(assert (= (and d!132629 res!800938) b!1203697))

(assert (= (and b!1203697 res!800941) b!1203689))

(assert (= (and b!1203689 res!800939) b!1203691))

(assert (= (and b!1203689 c!117916) b!1203698))

(assert (= (and b!1203689 (not c!117916)) b!1203690))

(assert (= (and b!1203698 res!800940) b!1203693))

(assert (= (and b!1203690 c!117918) b!1203695))

(assert (= (and b!1203690 (not c!117918)) b!1203696))

(declare-fun b_lambda!21147 () Bool)

(assert (=> (not b_lambda!21147) (not b!1203693)))

(assert (=> b!1203693 t!39376))

(declare-fun b_and!42721 () Bool)

(assert (= b_and!42719 (and (=> t!39376 result!21975) b_and!42721)))

(declare-fun b_lambda!21149 () Bool)

(assert (=> (not b_lambda!21149) (not b!1203699)))

(assert (=> b!1203699 t!39376))

(declare-fun b_and!42723 () Bool)

(assert (= b_and!42721 (and (=> t!39376 result!21975) b_and!42723)))

(declare-fun m!1109533 () Bool)

(assert (=> bm!58060 m!1109533))

(declare-fun m!1109535 () Bool)

(assert (=> b!1203693 m!1109535))

(declare-fun m!1109537 () Bool)

(assert (=> b!1203693 m!1109537))

(assert (=> b!1203693 m!1108891))

(declare-fun m!1109539 () Bool)

(assert (=> b!1203693 m!1109539))

(assert (=> b!1203693 m!1108891))

(assert (=> b!1203693 m!1109535))

(declare-fun m!1109541 () Bool)

(assert (=> b!1203693 m!1109541))

(assert (=> b!1203693 m!1109537))

(assert (=> b!1203691 m!1109535))

(assert (=> b!1203691 m!1109535))

(declare-fun m!1109543 () Bool)

(assert (=> b!1203691 m!1109543))

(assert (=> b!1203694 m!1109535))

(assert (=> b!1203694 m!1109535))

(assert (=> b!1203694 m!1109543))

(declare-fun m!1109545 () Bool)

(assert (=> b!1203697 m!1109545))

(declare-fun m!1109547 () Bool)

(assert (=> b!1203696 m!1109547))

(declare-fun m!1109549 () Bool)

(assert (=> d!132629 m!1109549))

(assert (=> d!132629 m!1108917))

(assert (=> b!1203699 m!1109535))

(declare-fun m!1109551 () Bool)

(assert (=> b!1203699 m!1109551))

(assert (=> b!1203699 m!1109537))

(assert (=> b!1203699 m!1108891))

(assert (=> b!1203699 m!1109539))

(assert (=> b!1203699 m!1108891))

(declare-fun m!1109553 () Bool)

(assert (=> b!1203699 m!1109553))

(declare-fun m!1109555 () Bool)

(assert (=> b!1203699 m!1109555))

(declare-fun m!1109557 () Bool)

(assert (=> b!1203699 m!1109557))

(assert (=> b!1203699 m!1109555))

(assert (=> b!1203699 m!1109537))

(assert (=> b!1203695 m!1109533))

(assert (=> b!1203698 m!1109535))

(assert (=> b!1203698 m!1109535))

(declare-fun m!1109559 () Bool)

(assert (=> b!1203698 m!1109559))

(assert (=> b!1203401 d!132629))

(assert (=> bm!58027 d!132629))

(declare-fun d!132631 () Bool)

(assert (=> d!132631 (= (isEmpty!980 lt!545568) (isEmpty!981 (toList!8844 lt!545568)))))

(declare-fun bs!34067 () Bool)

(assert (= bs!34067 d!132631))

(declare-fun m!1109561 () Bool)

(assert (=> bs!34067 m!1109561))

(assert (=> b!1203451 d!132631))

(declare-fun d!132633 () Bool)

(declare-fun e!683522 () Bool)

(assert (=> d!132633 e!683522))

(declare-fun res!800942 () Bool)

(assert (=> d!132633 (=> res!800942 e!683522)))

(declare-fun lt!545690 () Bool)

(assert (=> d!132633 (= res!800942 (not lt!545690))))

(declare-fun lt!545689 () Bool)

(assert (=> d!132633 (= lt!545690 lt!545689)))

(declare-fun lt!545688 () Unit!39889)

(declare-fun e!683521 () Unit!39889)

(assert (=> d!132633 (= lt!545688 e!683521)))

(declare-fun c!117919 () Bool)

(assert (=> d!132633 (= c!117919 lt!545689)))

(assert (=> d!132633 (= lt!545689 (containsKey!587 (toList!8844 lt!545561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132633 (= (contains!6898 lt!545561 #b0000000000000000000000000000000000000000000000000000000000000000) lt!545690)))

(declare-fun b!1203700 () Bool)

(declare-fun lt!545691 () Unit!39889)

(assert (=> b!1203700 (= e!683521 lt!545691)))

(assert (=> b!1203700 (= lt!545691 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203700 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203701 () Bool)

(declare-fun Unit!39910 () Unit!39889)

(assert (=> b!1203701 (= e!683521 Unit!39910)))

(declare-fun b!1203702 () Bool)

(assert (=> b!1203702 (= e!683522 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545561) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132633 c!117919) b!1203700))

(assert (= (and d!132633 (not c!117919)) b!1203701))

(assert (= (and d!132633 (not res!800942)) b!1203702))

(declare-fun m!1109563 () Bool)

(assert (=> d!132633 m!1109563))

(declare-fun m!1109565 () Bool)

(assert (=> b!1203700 m!1109565))

(declare-fun m!1109567 () Bool)

(assert (=> b!1203700 m!1109567))

(assert (=> b!1203700 m!1109567))

(declare-fun m!1109569 () Bool)

(assert (=> b!1203700 m!1109569))

(assert (=> b!1203702 m!1109567))

(assert (=> b!1203702 m!1109567))

(assert (=> b!1203702 m!1109569))

(assert (=> d!132517 d!132633))

(assert (=> d!132517 d!132483))

(assert (=> b!1203442 d!132557))

(declare-fun d!132635 () Bool)

(assert (=> d!132635 (not (contains!6898 (+!3970 lt!545560 (tuple2!19689 lt!545558 lt!545559)) lt!545556))))

(declare-fun lt!545692 () Unit!39889)

(assert (=> d!132635 (= lt!545692 (choose!1789 lt!545560 lt!545558 lt!545559 lt!545556))))

(declare-fun e!683523 () Bool)

(assert (=> d!132635 e!683523))

(declare-fun res!800943 () Bool)

(assert (=> d!132635 (=> (not res!800943) (not e!683523))))

(assert (=> d!132635 (= res!800943 (not (contains!6898 lt!545560 lt!545556)))))

(assert (=> d!132635 (= (addStillNotContains!288 lt!545560 lt!545558 lt!545559 lt!545556) lt!545692)))

(declare-fun b!1203703 () Bool)

(assert (=> b!1203703 (= e!683523 (not (= lt!545558 lt!545556)))))

(assert (= (and d!132635 res!800943) b!1203703))

(assert (=> d!132635 m!1109165))

(assert (=> d!132635 m!1109165))

(assert (=> d!132635 m!1109167))

(declare-fun m!1109571 () Bool)

(assert (=> d!132635 m!1109571))

(declare-fun m!1109573 () Bool)

(assert (=> d!132635 m!1109573))

(assert (=> b!1203442 d!132635))

(declare-fun d!132637 () Bool)

(declare-fun e!683524 () Bool)

(assert (=> d!132637 e!683524))

(declare-fun res!800944 () Bool)

(assert (=> d!132637 (=> (not res!800944) (not e!683524))))

(declare-fun lt!545694 () ListLongMap!17657)

(assert (=> d!132637 (= res!800944 (contains!6898 lt!545694 (_1!9855 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!545696 () List!26498)

(assert (=> d!132637 (= lt!545694 (ListLongMap!17658 lt!545696))))

(declare-fun lt!545695 () Unit!39889)

(declare-fun lt!545693 () Unit!39889)

(assert (=> d!132637 (= lt!545695 lt!545693)))

(assert (=> d!132637 (= (getValueByKey!631 lt!545696 (_1!9855 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!681 (_2!9855 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132637 (= lt!545693 (lemmaContainsTupThenGetReturnValue!308 lt!545696 (_1!9855 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9855 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132637 (= lt!545696 (insertStrictlySorted!401 (toList!8844 call!58038) (_1!9855 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9855 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132637 (= (+!3970 call!58038 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!545694)))

(declare-fun b!1203704 () Bool)

(declare-fun res!800945 () Bool)

(assert (=> b!1203704 (=> (not res!800945) (not e!683524))))

(assert (=> b!1203704 (= res!800945 (= (getValueByKey!631 (toList!8844 lt!545694) (_1!9855 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!681 (_2!9855 (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1203705 () Bool)

(assert (=> b!1203705 (= e!683524 (contains!6901 (toList!8844 lt!545694) (tuple2!19689 (select (arr!37634 lt!545424) from!1455) (get!19180 (select (arr!37635 lt!545434) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132637 res!800944) b!1203704))

(assert (= (and b!1203704 res!800945) b!1203705))

(declare-fun m!1109575 () Bool)

(assert (=> d!132637 m!1109575))

(declare-fun m!1109577 () Bool)

(assert (=> d!132637 m!1109577))

(declare-fun m!1109579 () Bool)

(assert (=> d!132637 m!1109579))

(declare-fun m!1109581 () Bool)

(assert (=> d!132637 m!1109581))

(declare-fun m!1109583 () Bool)

(assert (=> b!1203704 m!1109583))

(declare-fun m!1109585 () Bool)

(assert (=> b!1203705 m!1109585))

(assert (=> b!1203442 d!132637))

(declare-fun d!132639 () Bool)

(declare-fun e!683525 () Bool)

(assert (=> d!132639 e!683525))

(declare-fun res!800946 () Bool)

(assert (=> d!132639 (=> (not res!800946) (not e!683525))))

(declare-fun lt!545698 () ListLongMap!17657)

(assert (=> d!132639 (= res!800946 (contains!6898 lt!545698 (_1!9855 (tuple2!19689 lt!545558 lt!545559))))))

(declare-fun lt!545700 () List!26498)

(assert (=> d!132639 (= lt!545698 (ListLongMap!17658 lt!545700))))

(declare-fun lt!545699 () Unit!39889)

(declare-fun lt!545697 () Unit!39889)

(assert (=> d!132639 (= lt!545699 lt!545697)))

(assert (=> d!132639 (= (getValueByKey!631 lt!545700 (_1!9855 (tuple2!19689 lt!545558 lt!545559))) (Some!681 (_2!9855 (tuple2!19689 lt!545558 lt!545559))))))

(assert (=> d!132639 (= lt!545697 (lemmaContainsTupThenGetReturnValue!308 lt!545700 (_1!9855 (tuple2!19689 lt!545558 lt!545559)) (_2!9855 (tuple2!19689 lt!545558 lt!545559))))))

(assert (=> d!132639 (= lt!545700 (insertStrictlySorted!401 (toList!8844 lt!545560) (_1!9855 (tuple2!19689 lt!545558 lt!545559)) (_2!9855 (tuple2!19689 lt!545558 lt!545559))))))

(assert (=> d!132639 (= (+!3970 lt!545560 (tuple2!19689 lt!545558 lt!545559)) lt!545698)))

(declare-fun b!1203706 () Bool)

(declare-fun res!800947 () Bool)

(assert (=> b!1203706 (=> (not res!800947) (not e!683525))))

(assert (=> b!1203706 (= res!800947 (= (getValueByKey!631 (toList!8844 lt!545698) (_1!9855 (tuple2!19689 lt!545558 lt!545559))) (Some!681 (_2!9855 (tuple2!19689 lt!545558 lt!545559)))))))

(declare-fun b!1203707 () Bool)

(assert (=> b!1203707 (= e!683525 (contains!6901 (toList!8844 lt!545698) (tuple2!19689 lt!545558 lt!545559)))))

(assert (= (and d!132639 res!800946) b!1203706))

(assert (= (and b!1203706 res!800947) b!1203707))

(declare-fun m!1109587 () Bool)

(assert (=> d!132639 m!1109587))

(declare-fun m!1109589 () Bool)

(assert (=> d!132639 m!1109589))

(declare-fun m!1109591 () Bool)

(assert (=> d!132639 m!1109591))

(declare-fun m!1109593 () Bool)

(assert (=> d!132639 m!1109593))

(declare-fun m!1109595 () Bool)

(assert (=> b!1203706 m!1109595))

(declare-fun m!1109597 () Bool)

(assert (=> b!1203707 m!1109597))

(assert (=> b!1203442 d!132639))

(declare-fun d!132641 () Bool)

(declare-fun e!683527 () Bool)

(assert (=> d!132641 e!683527))

(declare-fun res!800948 () Bool)

(assert (=> d!132641 (=> res!800948 e!683527)))

(declare-fun lt!545703 () Bool)

(assert (=> d!132641 (= res!800948 (not lt!545703))))

(declare-fun lt!545702 () Bool)

(assert (=> d!132641 (= lt!545703 lt!545702)))

(declare-fun lt!545701 () Unit!39889)

(declare-fun e!683526 () Unit!39889)

(assert (=> d!132641 (= lt!545701 e!683526)))

(declare-fun c!117920 () Bool)

(assert (=> d!132641 (= c!117920 lt!545702)))

(assert (=> d!132641 (= lt!545702 (containsKey!587 (toList!8844 (+!3970 lt!545560 (tuple2!19689 lt!545558 lt!545559))) lt!545556))))

(assert (=> d!132641 (= (contains!6898 (+!3970 lt!545560 (tuple2!19689 lt!545558 lt!545559)) lt!545556) lt!545703)))

(declare-fun b!1203708 () Bool)

(declare-fun lt!545704 () Unit!39889)

(assert (=> b!1203708 (= e!683526 lt!545704)))

(assert (=> b!1203708 (= lt!545704 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 (+!3970 lt!545560 (tuple2!19689 lt!545558 lt!545559))) lt!545556))))

(assert (=> b!1203708 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545560 (tuple2!19689 lt!545558 lt!545559))) lt!545556))))

(declare-fun b!1203709 () Bool)

(declare-fun Unit!39911 () Unit!39889)

(assert (=> b!1203709 (= e!683526 Unit!39911)))

(declare-fun b!1203710 () Bool)

(assert (=> b!1203710 (= e!683527 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545560 (tuple2!19689 lt!545558 lt!545559))) lt!545556)))))

(assert (= (and d!132641 c!117920) b!1203708))

(assert (= (and d!132641 (not c!117920)) b!1203709))

(assert (= (and d!132641 (not res!800948)) b!1203710))

(declare-fun m!1109599 () Bool)

(assert (=> d!132641 m!1109599))

(declare-fun m!1109601 () Bool)

(assert (=> b!1203708 m!1109601))

(declare-fun m!1109603 () Bool)

(assert (=> b!1203708 m!1109603))

(assert (=> b!1203708 m!1109603))

(declare-fun m!1109605 () Bool)

(assert (=> b!1203708 m!1109605))

(assert (=> b!1203710 m!1109603))

(assert (=> b!1203710 m!1109603))

(assert (=> b!1203710 m!1109605))

(assert (=> b!1203442 d!132641))

(declare-fun d!132643 () Bool)

(declare-fun e!683529 () Bool)

(assert (=> d!132643 e!683529))

(declare-fun res!800949 () Bool)

(assert (=> d!132643 (=> res!800949 e!683529)))

(declare-fun lt!545707 () Bool)

(assert (=> d!132643 (= res!800949 (not lt!545707))))

(declare-fun lt!545706 () Bool)

(assert (=> d!132643 (= lt!545707 lt!545706)))

(declare-fun lt!545705 () Unit!39889)

(declare-fun e!683528 () Unit!39889)

(assert (=> d!132643 (= lt!545705 e!683528)))

(declare-fun c!117921 () Bool)

(assert (=> d!132643 (= c!117921 lt!545706)))

(assert (=> d!132643 (= lt!545706 (containsKey!587 (toList!8844 lt!545561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132643 (= (contains!6898 lt!545561 #b1000000000000000000000000000000000000000000000000000000000000000) lt!545707)))

(declare-fun b!1203711 () Bool)

(declare-fun lt!545708 () Unit!39889)

(assert (=> b!1203711 (= e!683528 lt!545708)))

(assert (=> b!1203711 (= lt!545708 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203711 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203712 () Bool)

(declare-fun Unit!39912 () Unit!39889)

(assert (=> b!1203712 (= e!683528 Unit!39912)))

(declare-fun b!1203713 () Bool)

(assert (=> b!1203713 (= e!683529 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132643 c!117921) b!1203711))

(assert (= (and d!132643 (not c!117921)) b!1203712))

(assert (= (and d!132643 (not res!800949)) b!1203713))

(declare-fun m!1109607 () Bool)

(assert (=> d!132643 m!1109607))

(declare-fun m!1109609 () Bool)

(assert (=> b!1203711 m!1109609))

(declare-fun m!1109611 () Bool)

(assert (=> b!1203711 m!1109611))

(assert (=> b!1203711 m!1109611))

(declare-fun m!1109613 () Bool)

(assert (=> b!1203711 m!1109613))

(assert (=> b!1203713 m!1109611))

(assert (=> b!1203713 m!1109611))

(assert (=> b!1203713 m!1109613))

(assert (=> b!1203440 d!132643))

(declare-fun d!132645 () Bool)

(assert (=> d!132645 (= (apply!960 lt!545512 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19181 (getValueByKey!631 (toList!8844 lt!545512) (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34068 () Bool)

(assert (= bs!34068 d!132645))

(assert (=> bs!34068 m!1109027))

(assert (=> bs!34068 m!1109447))

(assert (=> bs!34068 m!1109447))

(declare-fun m!1109615 () Bool)

(assert (=> bs!34068 m!1109615))

(assert (=> b!1203371 d!132645))

(declare-fun d!132647 () Bool)

(declare-fun c!117922 () Bool)

(assert (=> d!132647 (= c!117922 ((_ is ValueCellFull!14592) (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun e!683530 () V!45931)

(assert (=> d!132647 (= (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!683530)))

(declare-fun b!1203714 () Bool)

(assert (=> b!1203714 (= e!683530 (get!19182 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203715 () Bool)

(assert (=> b!1203715 (= e!683530 (get!19183 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132647 c!117922) b!1203714))

(assert (= (and d!132647 (not c!117922)) b!1203715))

(assert (=> b!1203714 m!1109029))

(assert (=> b!1203714 m!1108891))

(declare-fun m!1109617 () Bool)

(assert (=> b!1203714 m!1109617))

(assert (=> b!1203715 m!1109029))

(assert (=> b!1203715 m!1108891))

(declare-fun m!1109619 () Bool)

(assert (=> b!1203715 m!1109619))

(assert (=> b!1203371 d!132647))

(declare-fun d!132649 () Bool)

(assert (=> d!132649 (= (validKeyInArray!0 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)) (and (not (= (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203428 d!132649))

(declare-fun d!132651 () Bool)

(assert (=> d!132651 (= (apply!960 lt!545568 (select (arr!37634 _keys!1208) from!1455)) (get!19181 (getValueByKey!631 (toList!8844 lt!545568) (select (arr!37634 _keys!1208) from!1455))))))

(declare-fun bs!34069 () Bool)

(assert (= bs!34069 d!132651))

(assert (=> bs!34069 m!1108925))

(assert (=> bs!34069 m!1109383))

(assert (=> bs!34069 m!1109383))

(declare-fun m!1109621 () Bool)

(assert (=> bs!34069 m!1109621))

(assert (=> b!1203448 d!132651))

(declare-fun d!132653 () Bool)

(declare-fun c!117923 () Bool)

(assert (=> d!132653 (= c!117923 ((_ is ValueCellFull!14592) (select (arr!37635 _values!996) from!1455)))))

(declare-fun e!683531 () V!45931)

(assert (=> d!132653 (= (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)) e!683531)))

(declare-fun b!1203716 () Bool)

(assert (=> b!1203716 (= e!683531 (get!19182 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203717 () Bool)

(assert (=> b!1203717 (= e!683531 (get!19183 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132653 c!117923) b!1203716))

(assert (= (and d!132653 (not c!117923)) b!1203717))

(assert (=> b!1203716 m!1109173))

(assert (=> b!1203716 m!1108891))

(declare-fun m!1109623 () Bool)

(assert (=> b!1203716 m!1109623))

(assert (=> b!1203717 m!1109173))

(assert (=> b!1203717 m!1108891))

(declare-fun m!1109625 () Bool)

(assert (=> b!1203717 m!1109625))

(assert (=> b!1203448 d!132653))

(declare-fun d!132655 () Bool)

(assert (=> d!132655 (= (isEmpty!980 lt!545512) (isEmpty!981 (toList!8844 lt!545512)))))

(declare-fun bs!34070 () Bool)

(assert (= bs!34070 d!132655))

(declare-fun m!1109627 () Bool)

(assert (=> bs!34070 m!1109627))

(assert (=> b!1203374 d!132655))

(assert (=> b!1203446 d!132607))

(declare-fun d!132657 () Bool)

(assert (=> d!132657 (= (validKeyInArray!0 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455))) (and (not (= (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203372 d!132657))

(declare-fun d!132659 () Bool)

(assert (=> d!132659 (= (isDefined!456 (getValueByKey!631 (toList!8844 call!57991) k0!934)) (not (isEmpty!982 (getValueByKey!631 (toList!8844 call!57991) k0!934))))))

(declare-fun bs!34071 () Bool)

(assert (= bs!34071 d!132659))

(assert (=> bs!34071 m!1109129))

(declare-fun m!1109629 () Bool)

(assert (=> bs!34071 m!1109629))

(assert (=> b!1203416 d!132659))

(declare-fun b!1203721 () Bool)

(declare-fun e!683533 () Option!682)

(assert (=> b!1203721 (= e!683533 None!680)))

(declare-fun b!1203718 () Bool)

(declare-fun e!683532 () Option!682)

(assert (=> b!1203718 (= e!683532 (Some!681 (_2!9855 (h!27703 (toList!8844 call!57991)))))))

(declare-fun b!1203719 () Bool)

(assert (=> b!1203719 (= e!683532 e!683533)))

(declare-fun c!117925 () Bool)

(assert (=> b!1203719 (= c!117925 (and ((_ is Cons!26494) (toList!8844 call!57991)) (not (= (_1!9855 (h!27703 (toList!8844 call!57991))) k0!934))))))

(declare-fun b!1203720 () Bool)

(assert (=> b!1203720 (= e!683533 (getValueByKey!631 (t!39377 (toList!8844 call!57991)) k0!934))))

(declare-fun d!132661 () Bool)

(declare-fun c!117924 () Bool)

(assert (=> d!132661 (= c!117924 (and ((_ is Cons!26494) (toList!8844 call!57991)) (= (_1!9855 (h!27703 (toList!8844 call!57991))) k0!934)))))

(assert (=> d!132661 (= (getValueByKey!631 (toList!8844 call!57991) k0!934) e!683532)))

(assert (= (and d!132661 c!117924) b!1203718))

(assert (= (and d!132661 (not c!117924)) b!1203719))

(assert (= (and b!1203719 c!117925) b!1203720))

(assert (= (and b!1203719 (not c!117925)) b!1203721))

(declare-fun m!1109631 () Bool)

(assert (=> b!1203720 m!1109631))

(assert (=> b!1203416 d!132661))

(declare-fun b!1203722 () Bool)

(declare-fun e!683538 () ListLongMap!17657)

(declare-fun call!58064 () ListLongMap!17657)

(assert (=> b!1203722 (= e!683538 call!58064)))

(declare-fun b!1203723 () Bool)

(declare-fun e!683535 () Bool)

(declare-fun e!683540 () Bool)

(assert (=> b!1203723 (= e!683535 e!683540)))

(declare-fun c!117927 () Bool)

(declare-fun e!683536 () Bool)

(assert (=> b!1203723 (= c!117927 e!683536)))

(declare-fun res!800951 () Bool)

(assert (=> b!1203723 (=> (not res!800951) (not e!683536))))

(assert (=> b!1203723 (= res!800951 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(declare-fun b!1203724 () Bool)

(declare-fun e!683539 () Bool)

(assert (=> b!1203724 (= e!683540 e!683539)))

(declare-fun c!117929 () Bool)

(assert (=> b!1203724 (= c!117929 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(declare-fun b!1203725 () Bool)

(assert (=> b!1203725 (= e!683536 (validKeyInArray!0 (select (arr!37634 lt!545424) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203725 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1203726 () Bool)

(declare-fun e!683537 () ListLongMap!17657)

(assert (=> b!1203726 (= e!683537 (ListLongMap!17658 Nil!26495))))

(declare-fun d!132663 () Bool)

(assert (=> d!132663 e!683535))

(declare-fun res!800950 () Bool)

(assert (=> d!132663 (=> (not res!800950) (not e!683535))))

(declare-fun lt!545715 () ListLongMap!17657)

(assert (=> d!132663 (= res!800950 (not (contains!6898 lt!545715 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132663 (= lt!545715 e!683537)))

(declare-fun c!117926 () Bool)

(assert (=> d!132663 (= c!117926 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(assert (=> d!132663 (validMask!0 mask!1564)))

(assert (=> d!132663 (= (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!545715)))

(declare-fun b!1203727 () Bool)

(assert (=> b!1203727 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(assert (=> b!1203727 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38171 lt!545434)))))

(declare-fun e!683534 () Bool)

(assert (=> b!1203727 (= e!683534 (= (apply!960 lt!545715 (select (arr!37634 lt!545424) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19180 (select (arr!37635 lt!545434) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58061 () Bool)

(assert (=> bm!58061 (= call!58064 (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203728 () Bool)

(assert (=> b!1203728 (= e!683537 e!683538)))

(declare-fun c!117928 () Bool)

(assert (=> b!1203728 (= c!117928 (validKeyInArray!0 (select (arr!37634 lt!545424) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1203729 () Bool)

(assert (=> b!1203729 (= e!683539 (= lt!545715 (getCurrentListMapNoExtraKeys!5280 lt!545424 lt!545434 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203730 () Bool)

(assert (=> b!1203730 (= e!683539 (isEmpty!980 lt!545715))))

(declare-fun b!1203731 () Bool)

(declare-fun res!800953 () Bool)

(assert (=> b!1203731 (=> (not res!800953) (not e!683535))))

(assert (=> b!1203731 (= res!800953 (not (contains!6898 lt!545715 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203732 () Bool)

(assert (=> b!1203732 (= e!683540 e!683534)))

(assert (=> b!1203732 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(declare-fun res!800952 () Bool)

(assert (=> b!1203732 (= res!800952 (contains!6898 lt!545715 (select (arr!37634 lt!545424) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203732 (=> (not res!800952) (not e!683534))))

(declare-fun b!1203733 () Bool)

(declare-fun lt!545711 () Unit!39889)

(declare-fun lt!545709 () Unit!39889)

(assert (=> b!1203733 (= lt!545711 lt!545709)))

(declare-fun lt!545712 () (_ BitVec 64))

(declare-fun lt!545713 () V!45931)

(declare-fun lt!545714 () ListLongMap!17657)

(declare-fun lt!545710 () (_ BitVec 64))

(assert (=> b!1203733 (not (contains!6898 (+!3970 lt!545714 (tuple2!19689 lt!545712 lt!545713)) lt!545710))))

(assert (=> b!1203733 (= lt!545709 (addStillNotContains!288 lt!545714 lt!545712 lt!545713 lt!545710))))

(assert (=> b!1203733 (= lt!545710 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203733 (= lt!545713 (get!19180 (select (arr!37635 lt!545434) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203733 (= lt!545712 (select (arr!37634 lt!545424) (bvadd from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1203733 (= lt!545714 call!58064)))

(assert (=> b!1203733 (= e!683538 (+!3970 call!58064 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19180 (select (arr!37635 lt!545434) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132663 c!117926) b!1203726))

(assert (= (and d!132663 (not c!117926)) b!1203728))

(assert (= (and b!1203728 c!117928) b!1203733))

(assert (= (and b!1203728 (not c!117928)) b!1203722))

(assert (= (or b!1203733 b!1203722) bm!58061))

(assert (= (and d!132663 res!800950) b!1203731))

(assert (= (and b!1203731 res!800953) b!1203723))

(assert (= (and b!1203723 res!800951) b!1203725))

(assert (= (and b!1203723 c!117927) b!1203732))

(assert (= (and b!1203723 (not c!117927)) b!1203724))

(assert (= (and b!1203732 res!800952) b!1203727))

(assert (= (and b!1203724 c!117929) b!1203729))

(assert (= (and b!1203724 (not c!117929)) b!1203730))

(declare-fun b_lambda!21151 () Bool)

(assert (=> (not b_lambda!21151) (not b!1203727)))

(assert (=> b!1203727 t!39376))

(declare-fun b_and!42725 () Bool)

(assert (= b_and!42723 (and (=> t!39376 result!21975) b_and!42725)))

(declare-fun b_lambda!21153 () Bool)

(assert (=> (not b_lambda!21153) (not b!1203733)))

(assert (=> b!1203733 t!39376))

(declare-fun b_and!42727 () Bool)

(assert (= b_and!42725 (and (=> t!39376 result!21975) b_and!42727)))

(declare-fun m!1109633 () Bool)

(assert (=> bm!58061 m!1109633))

(declare-fun m!1109635 () Bool)

(assert (=> b!1203727 m!1109635))

(declare-fun m!1109637 () Bool)

(assert (=> b!1203727 m!1109637))

(assert (=> b!1203727 m!1108891))

(declare-fun m!1109639 () Bool)

(assert (=> b!1203727 m!1109639))

(assert (=> b!1203727 m!1108891))

(assert (=> b!1203727 m!1109635))

(declare-fun m!1109641 () Bool)

(assert (=> b!1203727 m!1109641))

(assert (=> b!1203727 m!1109637))

(assert (=> b!1203725 m!1109635))

(assert (=> b!1203725 m!1109635))

(declare-fun m!1109643 () Bool)

(assert (=> b!1203725 m!1109643))

(assert (=> b!1203728 m!1109635))

(assert (=> b!1203728 m!1109635))

(assert (=> b!1203728 m!1109643))

(declare-fun m!1109645 () Bool)

(assert (=> b!1203731 m!1109645))

(declare-fun m!1109647 () Bool)

(assert (=> b!1203730 m!1109647))

(declare-fun m!1109649 () Bool)

(assert (=> d!132663 m!1109649))

(assert (=> d!132663 m!1108917))

(assert (=> b!1203733 m!1109635))

(declare-fun m!1109651 () Bool)

(assert (=> b!1203733 m!1109651))

(assert (=> b!1203733 m!1109637))

(assert (=> b!1203733 m!1108891))

(assert (=> b!1203733 m!1109639))

(assert (=> b!1203733 m!1108891))

(declare-fun m!1109653 () Bool)

(assert (=> b!1203733 m!1109653))

(declare-fun m!1109655 () Bool)

(assert (=> b!1203733 m!1109655))

(declare-fun m!1109657 () Bool)

(assert (=> b!1203733 m!1109657))

(assert (=> b!1203733 m!1109655))

(assert (=> b!1203733 m!1109637))

(assert (=> b!1203729 m!1109633))

(assert (=> b!1203732 m!1109635))

(assert (=> b!1203732 m!1109635))

(declare-fun m!1109659 () Bool)

(assert (=> b!1203732 m!1109659))

(assert (=> bm!58035 d!132663))

(declare-fun d!132665 () Bool)

(declare-fun lt!545718 () Bool)

(declare-fun content!542 (List!26498) (InoxSet tuple2!19688))

(assert (=> d!132665 (= lt!545718 (select (content!542 (toList!8844 lt!545536)) (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun e!683546 () Bool)

(assert (=> d!132665 (= lt!545718 e!683546)))

(declare-fun res!800958 () Bool)

(assert (=> d!132665 (=> (not res!800958) (not e!683546))))

(assert (=> d!132665 (= res!800958 ((_ is Cons!26494) (toList!8844 lt!545536)))))

(assert (=> d!132665 (= (contains!6901 (toList!8844 lt!545536) (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!545718)))

(declare-fun b!1203738 () Bool)

(declare-fun e!683545 () Bool)

(assert (=> b!1203738 (= e!683546 e!683545)))

(declare-fun res!800959 () Bool)

(assert (=> b!1203738 (=> res!800959 e!683545)))

(assert (=> b!1203738 (= res!800959 (= (h!27703 (toList!8844 lt!545536)) (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun b!1203739 () Bool)

(assert (=> b!1203739 (= e!683545 (contains!6901 (t!39377 (toList!8844 lt!545536)) (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!132665 res!800958) b!1203738))

(assert (= (and b!1203738 (not res!800959)) b!1203739))

(declare-fun m!1109661 () Bool)

(assert (=> d!132665 m!1109661))

(declare-fun m!1109663 () Bool)

(assert (=> d!132665 m!1109663))

(declare-fun m!1109665 () Bool)

(assert (=> b!1203739 m!1109665))

(assert (=> b!1203407 d!132665))

(assert (=> b!1203393 d!132583))

(declare-fun d!132667 () Bool)

(assert (=> d!132667 (arrayContainsKey!0 lt!545424 lt!545522 #b00000000000000000000000000000000)))

(declare-fun lt!545719 () Unit!39889)

(assert (=> d!132667 (= lt!545719 (choose!13 lt!545424 lt!545522 #b00000000000000000000000000000000))))

(assert (=> d!132667 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!132667 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545424 lt!545522 #b00000000000000000000000000000000) lt!545719)))

(declare-fun bs!34072 () Bool)

(assert (= bs!34072 d!132667))

(assert (=> bs!34072 m!1109067))

(declare-fun m!1109667 () Bool)

(assert (=> bs!34072 m!1109667))

(assert (=> b!1203392 d!132667))

(declare-fun d!132669 () Bool)

(declare-fun res!800960 () Bool)

(declare-fun e!683547 () Bool)

(assert (=> d!132669 (=> res!800960 e!683547)))

(assert (=> d!132669 (= res!800960 (= (select (arr!37634 lt!545424) #b00000000000000000000000000000000) lt!545522))))

(assert (=> d!132669 (= (arrayContainsKey!0 lt!545424 lt!545522 #b00000000000000000000000000000000) e!683547)))

(declare-fun b!1203740 () Bool)

(declare-fun e!683548 () Bool)

(assert (=> b!1203740 (= e!683547 e!683548)))

(declare-fun res!800961 () Bool)

(assert (=> b!1203740 (=> (not res!800961) (not e!683548))))

(assert (=> b!1203740 (= res!800961 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(declare-fun b!1203741 () Bool)

(assert (=> b!1203741 (= e!683548 (arrayContainsKey!0 lt!545424 lt!545522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132669 (not res!800960)) b!1203740))

(assert (= (and b!1203740 res!800961) b!1203741))

(assert (=> d!132669 m!1109005))

(declare-fun m!1109669 () Bool)

(assert (=> b!1203741 m!1109669))

(assert (=> b!1203392 d!132669))

(declare-fun b!1203754 () Bool)

(declare-fun e!683556 () SeekEntryResult!9933)

(declare-fun lt!545728 () SeekEntryResult!9933)

(assert (=> b!1203754 (= e!683556 (MissingZero!9933 (index!42105 lt!545728)))))

(declare-fun b!1203755 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!77979 (_ BitVec 32)) SeekEntryResult!9933)

(assert (=> b!1203755 (= e!683556 (seekKeyOrZeroReturnVacant!0 (x!106362 lt!545728) (index!42105 lt!545728) (index!42105 lt!545728) (select (arr!37634 lt!545424) #b00000000000000000000000000000000) lt!545424 mask!1564))))

(declare-fun b!1203756 () Bool)

(declare-fun c!117937 () Bool)

(declare-fun lt!545727 () (_ BitVec 64))

(assert (=> b!1203756 (= c!117937 (= lt!545727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!683557 () SeekEntryResult!9933)

(assert (=> b!1203756 (= e!683557 e!683556)))

(declare-fun d!132671 () Bool)

(declare-fun lt!545726 () SeekEntryResult!9933)

(assert (=> d!132671 (and (or ((_ is Undefined!9933) lt!545726) (not ((_ is Found!9933) lt!545726)) (and (bvsge (index!42104 lt!545726) #b00000000000000000000000000000000) (bvslt (index!42104 lt!545726) (size!38170 lt!545424)))) (or ((_ is Undefined!9933) lt!545726) ((_ is Found!9933) lt!545726) (not ((_ is MissingZero!9933) lt!545726)) (and (bvsge (index!42103 lt!545726) #b00000000000000000000000000000000) (bvslt (index!42103 lt!545726) (size!38170 lt!545424)))) (or ((_ is Undefined!9933) lt!545726) ((_ is Found!9933) lt!545726) ((_ is MissingZero!9933) lt!545726) (not ((_ is MissingVacant!9933) lt!545726)) (and (bvsge (index!42106 lt!545726) #b00000000000000000000000000000000) (bvslt (index!42106 lt!545726) (size!38170 lt!545424)))) (or ((_ is Undefined!9933) lt!545726) (ite ((_ is Found!9933) lt!545726) (= (select (arr!37634 lt!545424) (index!42104 lt!545726)) (select (arr!37634 lt!545424) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9933) lt!545726) (= (select (arr!37634 lt!545424) (index!42103 lt!545726)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9933) lt!545726) (= (select (arr!37634 lt!545424) (index!42106 lt!545726)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!683555 () SeekEntryResult!9933)

(assert (=> d!132671 (= lt!545726 e!683555)))

(declare-fun c!117936 () Bool)

(assert (=> d!132671 (= c!117936 (and ((_ is Intermediate!9933) lt!545728) (undefined!10745 lt!545728)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!77979 (_ BitVec 32)) SeekEntryResult!9933)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!132671 (= lt!545728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37634 lt!545424) #b00000000000000000000000000000000) mask!1564) (select (arr!37634 lt!545424) #b00000000000000000000000000000000) lt!545424 mask!1564))))

(assert (=> d!132671 (validMask!0 mask!1564)))

(assert (=> d!132671 (= (seekEntryOrOpen!0 (select (arr!37634 lt!545424) #b00000000000000000000000000000000) lt!545424 mask!1564) lt!545726)))

(declare-fun b!1203757 () Bool)

(assert (=> b!1203757 (= e!683555 Undefined!9933)))

(declare-fun b!1203758 () Bool)

(assert (=> b!1203758 (= e!683557 (Found!9933 (index!42105 lt!545728)))))

(declare-fun b!1203759 () Bool)

(assert (=> b!1203759 (= e!683555 e!683557)))

(assert (=> b!1203759 (= lt!545727 (select (arr!37634 lt!545424) (index!42105 lt!545728)))))

(declare-fun c!117938 () Bool)

(assert (=> b!1203759 (= c!117938 (= lt!545727 (select (arr!37634 lt!545424) #b00000000000000000000000000000000)))))

(assert (= (and d!132671 c!117936) b!1203757))

(assert (= (and d!132671 (not c!117936)) b!1203759))

(assert (= (and b!1203759 c!117938) b!1203758))

(assert (= (and b!1203759 (not c!117938)) b!1203756))

(assert (= (and b!1203756 c!117937) b!1203754))

(assert (= (and b!1203756 (not c!117937)) b!1203755))

(assert (=> b!1203755 m!1109005))

(declare-fun m!1109671 () Bool)

(assert (=> b!1203755 m!1109671))

(assert (=> d!132671 m!1109005))

(declare-fun m!1109673 () Bool)

(assert (=> d!132671 m!1109673))

(declare-fun m!1109675 () Bool)

(assert (=> d!132671 m!1109675))

(assert (=> d!132671 m!1108917))

(declare-fun m!1109677 () Bool)

(assert (=> d!132671 m!1109677))

(declare-fun m!1109679 () Bool)

(assert (=> d!132671 m!1109679))

(assert (=> d!132671 m!1109673))

(assert (=> d!132671 m!1109005))

(declare-fun m!1109681 () Bool)

(assert (=> d!132671 m!1109681))

(declare-fun m!1109683 () Bool)

(assert (=> b!1203759 m!1109683))

(assert (=> b!1203392 d!132671))

(assert (=> b!1203369 d!132657))

(assert (=> b!1203427 d!132649))

(declare-fun d!132673 () Bool)

(declare-fun e!683559 () Bool)

(assert (=> d!132673 e!683559))

(declare-fun res!800962 () Bool)

(assert (=> d!132673 (=> res!800962 e!683559)))

(declare-fun lt!545731 () Bool)

(assert (=> d!132673 (= res!800962 (not lt!545731))))

(declare-fun lt!545730 () Bool)

(assert (=> d!132673 (= lt!545731 lt!545730)))

(declare-fun lt!545729 () Unit!39889)

(declare-fun e!683558 () Unit!39889)

(assert (=> d!132673 (= lt!545729 e!683558)))

(declare-fun c!117939 () Bool)

(assert (=> d!132673 (= c!117939 lt!545730)))

(assert (=> d!132673 (= lt!545730 (containsKey!587 (toList!8844 lt!545568) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132673 (= (contains!6898 lt!545568 #b0000000000000000000000000000000000000000000000000000000000000000) lt!545731)))

(declare-fun b!1203760 () Bool)

(declare-fun lt!545732 () Unit!39889)

(assert (=> b!1203760 (= e!683558 lt!545732)))

(assert (=> b!1203760 (= lt!545732 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545568) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203760 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545568) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203761 () Bool)

(declare-fun Unit!39913 () Unit!39889)

(assert (=> b!1203761 (= e!683558 Unit!39913)))

(declare-fun b!1203762 () Bool)

(assert (=> b!1203762 (= e!683559 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545568) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132673 c!117939) b!1203760))

(assert (= (and d!132673 (not c!117939)) b!1203761))

(assert (= (and d!132673 (not res!800962)) b!1203762))

(declare-fun m!1109685 () Bool)

(assert (=> d!132673 m!1109685))

(declare-fun m!1109687 () Bool)

(assert (=> b!1203760 m!1109687))

(declare-fun m!1109689 () Bool)

(assert (=> b!1203760 m!1109689))

(assert (=> b!1203760 m!1109689))

(declare-fun m!1109691 () Bool)

(assert (=> b!1203760 m!1109691))

(assert (=> b!1203762 m!1109689))

(assert (=> b!1203762 m!1109689))

(assert (=> b!1203762 m!1109691))

(assert (=> d!132519 d!132673))

(assert (=> d!132519 d!132483))

(assert (=> b!1203438 d!132663))

(declare-fun d!132675 () Bool)

(declare-fun lt!545733 () ListLongMap!17657)

(assert (=> d!132675 (not (contains!6898 lt!545733 k0!934))))

(assert (=> d!132675 (= lt!545733 (ListLongMap!17658 (removeStrictlySorted!93 (toList!8844 call!58036) k0!934)))))

(assert (=> d!132675 (= (-!1810 call!58036 k0!934) lt!545733)))

(declare-fun bs!34073 () Bool)

(assert (= bs!34073 d!132675))

(declare-fun m!1109693 () Bool)

(assert (=> bs!34073 m!1109693))

(declare-fun m!1109695 () Bool)

(assert (=> bs!34073 m!1109695))

(assert (=> b!1203424 d!132675))

(declare-fun d!132677 () Bool)

(declare-fun e!683560 () Bool)

(assert (=> d!132677 e!683560))

(declare-fun res!800963 () Bool)

(assert (=> d!132677 (=> (not res!800963) (not e!683560))))

(declare-fun lt!545735 () ListLongMap!17657)

(assert (=> d!132677 (= res!800963 (contains!6898 lt!545735 (_1!9855 (tuple2!19689 lt!545565 lt!545566))))))

(declare-fun lt!545737 () List!26498)

(assert (=> d!132677 (= lt!545735 (ListLongMap!17658 lt!545737))))

(declare-fun lt!545736 () Unit!39889)

(declare-fun lt!545734 () Unit!39889)

(assert (=> d!132677 (= lt!545736 lt!545734)))

(assert (=> d!132677 (= (getValueByKey!631 lt!545737 (_1!9855 (tuple2!19689 lt!545565 lt!545566))) (Some!681 (_2!9855 (tuple2!19689 lt!545565 lt!545566))))))

(assert (=> d!132677 (= lt!545734 (lemmaContainsTupThenGetReturnValue!308 lt!545737 (_1!9855 (tuple2!19689 lt!545565 lt!545566)) (_2!9855 (tuple2!19689 lt!545565 lt!545566))))))

(assert (=> d!132677 (= lt!545737 (insertStrictlySorted!401 (toList!8844 lt!545567) (_1!9855 (tuple2!19689 lt!545565 lt!545566)) (_2!9855 (tuple2!19689 lt!545565 lt!545566))))))

(assert (=> d!132677 (= (+!3970 lt!545567 (tuple2!19689 lt!545565 lt!545566)) lt!545735)))

(declare-fun b!1203763 () Bool)

(declare-fun res!800964 () Bool)

(assert (=> b!1203763 (=> (not res!800964) (not e!683560))))

(assert (=> b!1203763 (= res!800964 (= (getValueByKey!631 (toList!8844 lt!545735) (_1!9855 (tuple2!19689 lt!545565 lt!545566))) (Some!681 (_2!9855 (tuple2!19689 lt!545565 lt!545566)))))))

(declare-fun b!1203764 () Bool)

(assert (=> b!1203764 (= e!683560 (contains!6901 (toList!8844 lt!545735) (tuple2!19689 lt!545565 lt!545566)))))

(assert (= (and d!132677 res!800963) b!1203763))

(assert (= (and b!1203763 res!800964) b!1203764))

(declare-fun m!1109697 () Bool)

(assert (=> d!132677 m!1109697))

(declare-fun m!1109699 () Bool)

(assert (=> d!132677 m!1109699))

(declare-fun m!1109701 () Bool)

(assert (=> d!132677 m!1109701))

(declare-fun m!1109703 () Bool)

(assert (=> d!132677 m!1109703))

(declare-fun m!1109705 () Bool)

(assert (=> b!1203763 m!1109705))

(declare-fun m!1109707 () Bool)

(assert (=> b!1203764 m!1109707))

(assert (=> b!1203454 d!132677))

(assert (=> b!1203454 d!132653))

(declare-fun d!132679 () Bool)

(declare-fun e!683561 () Bool)

(assert (=> d!132679 e!683561))

(declare-fun res!800965 () Bool)

(assert (=> d!132679 (=> (not res!800965) (not e!683561))))

(declare-fun lt!545739 () ListLongMap!17657)

(assert (=> d!132679 (= res!800965 (contains!6898 lt!545739 (_1!9855 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!545741 () List!26498)

(assert (=> d!132679 (= lt!545739 (ListLongMap!17658 lt!545741))))

(declare-fun lt!545740 () Unit!39889)

(declare-fun lt!545738 () Unit!39889)

(assert (=> d!132679 (= lt!545740 lt!545738)))

(assert (=> d!132679 (= (getValueByKey!631 lt!545741 (_1!9855 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!681 (_2!9855 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132679 (= lt!545738 (lemmaContainsTupThenGetReturnValue!308 lt!545741 (_1!9855 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9855 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132679 (= lt!545741 (insertStrictlySorted!401 (toList!8844 call!58039) (_1!9855 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9855 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132679 (= (+!3970 call!58039 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!545739)))

(declare-fun b!1203765 () Bool)

(declare-fun res!800966 () Bool)

(assert (=> b!1203765 (=> (not res!800966) (not e!683561))))

(assert (=> b!1203765 (= res!800966 (= (getValueByKey!631 (toList!8844 lt!545739) (_1!9855 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!681 (_2!9855 (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1203766 () Bool)

(assert (=> b!1203766 (= e!683561 (contains!6901 (toList!8844 lt!545739) (tuple2!19689 (select (arr!37634 _keys!1208) from!1455) (get!19180 (select (arr!37635 _values!996) from!1455) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132679 res!800965) b!1203765))

(assert (= (and b!1203765 res!800966) b!1203766))

(declare-fun m!1109709 () Bool)

(assert (=> d!132679 m!1109709))

(declare-fun m!1109711 () Bool)

(assert (=> d!132679 m!1109711))

(declare-fun m!1109713 () Bool)

(assert (=> d!132679 m!1109713))

(declare-fun m!1109715 () Bool)

(assert (=> d!132679 m!1109715))

(declare-fun m!1109717 () Bool)

(assert (=> b!1203765 m!1109717))

(declare-fun m!1109719 () Bool)

(assert (=> b!1203766 m!1109719))

(assert (=> b!1203454 d!132679))

(declare-fun d!132681 () Bool)

(assert (=> d!132681 (not (contains!6898 (+!3970 lt!545567 (tuple2!19689 lt!545565 lt!545566)) lt!545563))))

(declare-fun lt!545742 () Unit!39889)

(assert (=> d!132681 (= lt!545742 (choose!1789 lt!545567 lt!545565 lt!545566 lt!545563))))

(declare-fun e!683562 () Bool)

(assert (=> d!132681 e!683562))

(declare-fun res!800967 () Bool)

(assert (=> d!132681 (=> (not res!800967) (not e!683562))))

(assert (=> d!132681 (= res!800967 (not (contains!6898 lt!545567 lt!545563)))))

(assert (=> d!132681 (= (addStillNotContains!288 lt!545567 lt!545565 lt!545566 lt!545563) lt!545742)))

(declare-fun b!1203767 () Bool)

(assert (=> b!1203767 (= e!683562 (not (= lt!545565 lt!545563)))))

(assert (= (and d!132681 res!800967) b!1203767))

(assert (=> d!132681 m!1109191))

(assert (=> d!132681 m!1109191))

(assert (=> d!132681 m!1109193))

(declare-fun m!1109721 () Bool)

(assert (=> d!132681 m!1109721))

(declare-fun m!1109723 () Bool)

(assert (=> d!132681 m!1109723))

(assert (=> b!1203454 d!132681))

(declare-fun d!132683 () Bool)

(declare-fun e!683564 () Bool)

(assert (=> d!132683 e!683564))

(declare-fun res!800968 () Bool)

(assert (=> d!132683 (=> res!800968 e!683564)))

(declare-fun lt!545745 () Bool)

(assert (=> d!132683 (= res!800968 (not lt!545745))))

(declare-fun lt!545744 () Bool)

(assert (=> d!132683 (= lt!545745 lt!545744)))

(declare-fun lt!545743 () Unit!39889)

(declare-fun e!683563 () Unit!39889)

(assert (=> d!132683 (= lt!545743 e!683563)))

(declare-fun c!117940 () Bool)

(assert (=> d!132683 (= c!117940 lt!545744)))

(assert (=> d!132683 (= lt!545744 (containsKey!587 (toList!8844 (+!3970 lt!545567 (tuple2!19689 lt!545565 lt!545566))) lt!545563))))

(assert (=> d!132683 (= (contains!6898 (+!3970 lt!545567 (tuple2!19689 lt!545565 lt!545566)) lt!545563) lt!545745)))

(declare-fun b!1203768 () Bool)

(declare-fun lt!545746 () Unit!39889)

(assert (=> b!1203768 (= e!683563 lt!545746)))

(assert (=> b!1203768 (= lt!545746 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 (+!3970 lt!545567 (tuple2!19689 lt!545565 lt!545566))) lt!545563))))

(assert (=> b!1203768 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545567 (tuple2!19689 lt!545565 lt!545566))) lt!545563))))

(declare-fun b!1203769 () Bool)

(declare-fun Unit!39914 () Unit!39889)

(assert (=> b!1203769 (= e!683563 Unit!39914)))

(declare-fun b!1203770 () Bool)

(assert (=> b!1203770 (= e!683564 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545567 (tuple2!19689 lt!545565 lt!545566))) lt!545563)))))

(assert (= (and d!132683 c!117940) b!1203768))

(assert (= (and d!132683 (not c!117940)) b!1203769))

(assert (= (and d!132683 (not res!800968)) b!1203770))

(declare-fun m!1109725 () Bool)

(assert (=> d!132683 m!1109725))

(declare-fun m!1109727 () Bool)

(assert (=> b!1203768 m!1109727))

(declare-fun m!1109729 () Bool)

(assert (=> b!1203768 m!1109729))

(assert (=> b!1203768 m!1109729))

(declare-fun m!1109731 () Bool)

(assert (=> b!1203768 m!1109731))

(assert (=> b!1203770 m!1109729))

(assert (=> b!1203770 m!1109729))

(assert (=> b!1203770 m!1109731))

(assert (=> b!1203454 d!132683))

(declare-fun d!132685 () Bool)

(declare-fun e!683566 () Bool)

(assert (=> d!132685 e!683566))

(declare-fun res!800969 () Bool)

(assert (=> d!132685 (=> res!800969 e!683566)))

(declare-fun lt!545749 () Bool)

(assert (=> d!132685 (= res!800969 (not lt!545749))))

(declare-fun lt!545748 () Bool)

(assert (=> d!132685 (= lt!545749 lt!545748)))

(declare-fun lt!545747 () Unit!39889)

(declare-fun e!683565 () Unit!39889)

(assert (=> d!132685 (= lt!545747 e!683565)))

(declare-fun c!117941 () Bool)

(assert (=> d!132685 (= c!117941 lt!545748)))

(assert (=> d!132685 (= lt!545748 (containsKey!587 (toList!8844 lt!545534) (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> d!132685 (= (contains!6898 lt!545534 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) lt!545749)))

(declare-fun b!1203771 () Bool)

(declare-fun lt!545750 () Unit!39889)

(assert (=> b!1203771 (= e!683565 lt!545750)))

(assert (=> b!1203771 (= lt!545750 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545534) (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1203771 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545534) (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1203772 () Bool)

(declare-fun Unit!39915 () Unit!39889)

(assert (=> b!1203772 (= e!683565 Unit!39915)))

(declare-fun b!1203773 () Bool)

(assert (=> b!1203773 (= e!683566 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545534) (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(assert (= (and d!132685 c!117941) b!1203771))

(assert (= (and d!132685 (not c!117941)) b!1203772))

(assert (= (and d!132685 (not res!800969)) b!1203773))

(assert (=> d!132685 m!1109079))

(declare-fun m!1109733 () Bool)

(assert (=> d!132685 m!1109733))

(assert (=> b!1203771 m!1109079))

(declare-fun m!1109735 () Bool)

(assert (=> b!1203771 m!1109735))

(assert (=> b!1203771 m!1109079))

(declare-fun m!1109737 () Bool)

(assert (=> b!1203771 m!1109737))

(assert (=> b!1203771 m!1109737))

(declare-fun m!1109739 () Bool)

(assert (=> b!1203771 m!1109739))

(assert (=> b!1203773 m!1109079))

(assert (=> b!1203773 m!1109737))

(assert (=> b!1203773 m!1109737))

(assert (=> b!1203773 m!1109739))

(assert (=> b!1203404 d!132685))

(declare-fun b!1203774 () Bool)

(declare-fun e!683570 () Bool)

(declare-fun call!58065 () Bool)

(assert (=> b!1203774 (= e!683570 call!58065)))

(declare-fun b!1203775 () Bool)

(declare-fun e!683569 () Bool)

(assert (=> b!1203775 (= e!683569 e!683570)))

(declare-fun c!117942 () Bool)

(assert (=> b!1203775 (= c!117942 (validKeyInArray!0 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!58062 () Bool)

(assert (=> bm!58062 (= call!58065 (arrayNoDuplicates!0 lt!545424 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!117942 (Cons!26495 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!117809 (Cons!26495 (select (arr!37634 lt!545424) #b00000000000000000000000000000000) Nil!26496) Nil!26496)) (ite c!117809 (Cons!26495 (select (arr!37634 lt!545424) #b00000000000000000000000000000000) Nil!26496) Nil!26496))))))

(declare-fun d!132687 () Bool)

(declare-fun res!800970 () Bool)

(declare-fun e!683568 () Bool)

(assert (=> d!132687 (=> res!800970 e!683568)))

(assert (=> d!132687 (= res!800970 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38170 lt!545424)))))

(assert (=> d!132687 (= (arrayNoDuplicates!0 lt!545424 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117809 (Cons!26495 (select (arr!37634 lt!545424) #b00000000000000000000000000000000) Nil!26496) Nil!26496)) e!683568)))

(declare-fun b!1203776 () Bool)

(assert (=> b!1203776 (= e!683568 e!683569)))

(declare-fun res!800972 () Bool)

(assert (=> b!1203776 (=> (not res!800972) (not e!683569))))

(declare-fun e!683567 () Bool)

(assert (=> b!1203776 (= res!800972 (not e!683567))))

(declare-fun res!800971 () Bool)

(assert (=> b!1203776 (=> (not res!800971) (not e!683567))))

(assert (=> b!1203776 (= res!800971 (validKeyInArray!0 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1203777 () Bool)

(assert (=> b!1203777 (= e!683567 (contains!6900 (ite c!117809 (Cons!26495 (select (arr!37634 lt!545424) #b00000000000000000000000000000000) Nil!26496) Nil!26496) (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1203778 () Bool)

(assert (=> b!1203778 (= e!683570 call!58065)))

(assert (= (and d!132687 (not res!800970)) b!1203776))

(assert (= (and b!1203776 res!800971) b!1203777))

(assert (= (and b!1203776 res!800972) b!1203775))

(assert (= (and b!1203775 c!117942) b!1203774))

(assert (= (and b!1203775 (not c!117942)) b!1203778))

(assert (= (or b!1203774 b!1203778) bm!58062))

(assert (=> b!1203775 m!1109303))

(assert (=> b!1203775 m!1109303))

(assert (=> b!1203775 m!1109313))

(assert (=> bm!58062 m!1109303))

(declare-fun m!1109741 () Bool)

(assert (=> bm!58062 m!1109741))

(assert (=> b!1203776 m!1109303))

(assert (=> b!1203776 m!1109303))

(assert (=> b!1203776 m!1109313))

(assert (=> b!1203777 m!1109303))

(assert (=> b!1203777 m!1109303))

(declare-fun m!1109743 () Bool)

(assert (=> b!1203777 m!1109743))

(assert (=> bm!58019 d!132687))

(declare-fun d!132689 () Bool)

(assert (=> d!132689 (= (isEmpty!980 lt!545534) (isEmpty!981 (toList!8844 lt!545534)))))

(declare-fun bs!34074 () Bool)

(assert (= bs!34074 d!132689))

(declare-fun m!1109745 () Bool)

(assert (=> bs!34074 m!1109745))

(assert (=> b!1203402 d!132689))

(assert (=> d!132523 d!132521))

(declare-fun d!132691 () Bool)

(assert (=> d!132691 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(assert (=> d!132691 true))

(declare-fun _$60!448 () Unit!39889)

(assert (=> d!132691 (= (choose!13 _keys!1208 k0!934 i!673) _$60!448)))

(declare-fun bs!34075 () Bool)

(assert (= bs!34075 d!132691))

(assert (=> bs!34075 m!1108901))

(assert (=> d!132523 d!132691))

(declare-fun d!132693 () Bool)

(declare-fun e!683572 () Bool)

(assert (=> d!132693 e!683572))

(declare-fun res!800973 () Bool)

(assert (=> d!132693 (=> res!800973 e!683572)))

(declare-fun lt!545753 () Bool)

(assert (=> d!132693 (= res!800973 (not lt!545753))))

(declare-fun lt!545752 () Bool)

(assert (=> d!132693 (= lt!545753 lt!545752)))

(declare-fun lt!545751 () Unit!39889)

(declare-fun e!683571 () Unit!39889)

(assert (=> d!132693 (= lt!545751 e!683571)))

(declare-fun c!117943 () Bool)

(assert (=> d!132693 (= c!117943 lt!545752)))

(assert (=> d!132693 (= lt!545752 (containsKey!587 (toList!8844 (+!3970 lt!545425 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944)))) k0!934))))

(assert (=> d!132693 (= (contains!6898 (+!3970 lt!545425 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944))) k0!934) lt!545753)))

(declare-fun b!1203779 () Bool)

(declare-fun lt!545754 () Unit!39889)

(assert (=> b!1203779 (= e!683571 lt!545754)))

(assert (=> b!1203779 (= lt!545754 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 (+!3970 lt!545425 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944)))) k0!934))))

(assert (=> b!1203779 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545425 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944)))) k0!934))))

(declare-fun b!1203780 () Bool)

(declare-fun Unit!39916 () Unit!39889)

(assert (=> b!1203780 (= e!683571 Unit!39916)))

(declare-fun b!1203781 () Bool)

(assert (=> b!1203781 (= e!683572 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545425 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944)))) k0!934)))))

(assert (= (and d!132693 c!117943) b!1203779))

(assert (= (and d!132693 (not c!117943)) b!1203780))

(assert (= (and d!132693 (not res!800973)) b!1203781))

(declare-fun m!1109747 () Bool)

(assert (=> d!132693 m!1109747))

(declare-fun m!1109749 () Bool)

(assert (=> b!1203779 m!1109749))

(declare-fun m!1109751 () Bool)

(assert (=> b!1203779 m!1109751))

(assert (=> b!1203779 m!1109751))

(declare-fun m!1109753 () Bool)

(assert (=> b!1203779 m!1109753))

(assert (=> b!1203781 m!1109751))

(assert (=> b!1203781 m!1109751))

(assert (=> b!1203781 m!1109753))

(assert (=> d!132485 d!132693))

(declare-fun d!132695 () Bool)

(declare-fun e!683573 () Bool)

(assert (=> d!132695 e!683573))

(declare-fun res!800974 () Bool)

(assert (=> d!132695 (=> (not res!800974) (not e!683573))))

(declare-fun lt!545756 () ListLongMap!17657)

(assert (=> d!132695 (= res!800974 (contains!6898 lt!545756 (_1!9855 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944)))))))

(declare-fun lt!545758 () List!26498)

(assert (=> d!132695 (= lt!545756 (ListLongMap!17658 lt!545758))))

(declare-fun lt!545757 () Unit!39889)

(declare-fun lt!545755 () Unit!39889)

(assert (=> d!132695 (= lt!545757 lt!545755)))

(assert (=> d!132695 (= (getValueByKey!631 lt!545758 (_1!9855 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944)))) (Some!681 (_2!9855 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944)))))))

(assert (=> d!132695 (= lt!545755 (lemmaContainsTupThenGetReturnValue!308 lt!545758 (_1!9855 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944))) (_2!9855 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944)))))))

(assert (=> d!132695 (= lt!545758 (insertStrictlySorted!401 (toList!8844 lt!545425) (_1!9855 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944))) (_2!9855 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944)))))))

(assert (=> d!132695 (= (+!3970 lt!545425 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944))) lt!545756)))

(declare-fun b!1203782 () Bool)

(declare-fun res!800975 () Bool)

(assert (=> b!1203782 (=> (not res!800975) (not e!683573))))

(assert (=> b!1203782 (= res!800975 (= (getValueByKey!631 (toList!8844 lt!545756) (_1!9855 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944)))) (Some!681 (_2!9855 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944))))))))

(declare-fun b!1203783 () Bool)

(assert (=> b!1203783 (= e!683573 (contains!6901 (toList!8844 lt!545756) (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944))))))

(assert (= (and d!132695 res!800974) b!1203782))

(assert (= (and b!1203782 res!800975) b!1203783))

(declare-fun m!1109755 () Bool)

(assert (=> d!132695 m!1109755))

(declare-fun m!1109757 () Bool)

(assert (=> d!132695 m!1109757))

(declare-fun m!1109759 () Bool)

(assert (=> d!132695 m!1109759))

(declare-fun m!1109761 () Bool)

(assert (=> d!132695 m!1109761))

(declare-fun m!1109763 () Bool)

(assert (=> b!1203782 m!1109763))

(declare-fun m!1109765 () Bool)

(assert (=> b!1203783 m!1109765))

(assert (=> d!132485 d!132695))

(declare-fun d!132697 () Bool)

(assert (=> d!132697 (contains!6898 (+!3970 lt!545425 (tuple2!19689 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944))) k0!934)))

(assert (=> d!132697 true))

(declare-fun _$35!456 () Unit!39889)

(assert (=> d!132697 (= (choose!1785 lt!545425 (ite (or c!117794 c!117793) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117794 c!117793) zeroValue!944 minValue!944) k0!934) _$35!456)))

(declare-fun bs!34076 () Bool)

(assert (= bs!34076 d!132697))

(assert (=> bs!34076 m!1108999))

(assert (=> bs!34076 m!1108999))

(assert (=> bs!34076 m!1109001))

(assert (=> d!132485 d!132697))

(assert (=> d!132485 d!132525))

(declare-fun d!132699 () Bool)

(declare-fun lt!545759 () Bool)

(assert (=> d!132699 (= lt!545759 (select (content!541 Nil!26496) (select (arr!37634 lt!545424) #b00000000000000000000000000000000)))))

(declare-fun e!683575 () Bool)

(assert (=> d!132699 (= lt!545759 e!683575)))

(declare-fun res!800977 () Bool)

(assert (=> d!132699 (=> (not res!800977) (not e!683575))))

(assert (=> d!132699 (= res!800977 ((_ is Cons!26495) Nil!26496))))

(assert (=> d!132699 (= (contains!6900 Nil!26496 (select (arr!37634 lt!545424) #b00000000000000000000000000000000)) lt!545759)))

(declare-fun b!1203784 () Bool)

(declare-fun e!683574 () Bool)

(assert (=> b!1203784 (= e!683575 e!683574)))

(declare-fun res!800976 () Bool)

(assert (=> b!1203784 (=> res!800976 e!683574)))

(assert (=> b!1203784 (= res!800976 (= (h!27704 Nil!26496) (select (arr!37634 lt!545424) #b00000000000000000000000000000000)))))

(declare-fun b!1203785 () Bool)

(assert (=> b!1203785 (= e!683574 (contains!6900 (t!39378 Nil!26496) (select (arr!37634 lt!545424) #b00000000000000000000000000000000)))))

(assert (= (and d!132699 res!800977) b!1203784))

(assert (= (and b!1203784 (not res!800976)) b!1203785))

(assert (=> d!132699 m!1109249))

(assert (=> d!132699 m!1109005))

(declare-fun m!1109767 () Bool)

(assert (=> d!132699 m!1109767))

(assert (=> b!1203785 m!1109005))

(declare-fun m!1109769 () Bool)

(assert (=> b!1203785 m!1109769))

(assert (=> b!1203334 d!132699))

(declare-fun d!132701 () Bool)

(assert (=> d!132701 (isDefined!456 (getValueByKey!631 (toList!8844 call!57991) k0!934))))

(declare-fun lt!545760 () Unit!39889)

(assert (=> d!132701 (= lt!545760 (choose!1788 (toList!8844 call!57991) k0!934))))

(declare-fun e!683576 () Bool)

(assert (=> d!132701 e!683576))

(declare-fun res!800978 () Bool)

(assert (=> d!132701 (=> (not res!800978) (not e!683576))))

(assert (=> d!132701 (= res!800978 (isStrictlySorted!728 (toList!8844 call!57991)))))

(assert (=> d!132701 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 call!57991) k0!934) lt!545760)))

(declare-fun b!1203786 () Bool)

(assert (=> b!1203786 (= e!683576 (containsKey!587 (toList!8844 call!57991) k0!934))))

(assert (= (and d!132701 res!800978) b!1203786))

(assert (=> d!132701 m!1109129))

(assert (=> d!132701 m!1109129))

(assert (=> d!132701 m!1109131))

(declare-fun m!1109771 () Bool)

(assert (=> d!132701 m!1109771))

(declare-fun m!1109773 () Bool)

(assert (=> d!132701 m!1109773))

(assert (=> b!1203786 m!1109125))

(assert (=> b!1203414 d!132701))

(assert (=> b!1203414 d!132659))

(assert (=> b!1203414 d!132661))

(declare-fun lt!545761 () Bool)

(declare-fun d!132703 () Bool)

(assert (=> d!132703 (= lt!545761 (select (content!542 (toList!8844 lt!545489)) (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun e!683578 () Bool)

(assert (=> d!132703 (= lt!545761 e!683578)))

(declare-fun res!800979 () Bool)

(assert (=> d!132703 (=> (not res!800979) (not e!683578))))

(assert (=> d!132703 (= res!800979 ((_ is Cons!26494) (toList!8844 lt!545489)))))

(assert (=> d!132703 (= (contains!6901 (toList!8844 lt!545489) (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!545761)))

(declare-fun b!1203787 () Bool)

(declare-fun e!683577 () Bool)

(assert (=> b!1203787 (= e!683578 e!683577)))

(declare-fun res!800980 () Bool)

(assert (=> b!1203787 (=> res!800980 e!683577)))

(assert (=> b!1203787 (= res!800980 (= (h!27703 (toList!8844 lt!545489)) (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1203788 () Bool)

(assert (=> b!1203788 (= e!683577 (contains!6901 (t!39377 (toList!8844 lt!545489)) (ite c!117794 (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117793 (tuple2!19689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19689 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!132703 res!800979) b!1203787))

(assert (= (and b!1203787 (not res!800980)) b!1203788))

(declare-fun m!1109775 () Bool)

(assert (=> d!132703 m!1109775))

(declare-fun m!1109777 () Bool)

(assert (=> d!132703 m!1109777))

(declare-fun m!1109779 () Bool)

(assert (=> b!1203788 m!1109779))

(assert (=> b!1203341 d!132703))

(declare-fun d!132705 () Bool)

(assert (=> d!132705 (= (apply!960 lt!545534 (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19181 (getValueByKey!631 (toList!8844 lt!545534) (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))))

(declare-fun bs!34077 () Bool)

(assert (= bs!34077 d!132705))

(assert (=> bs!34077 m!1109079))

(assert (=> bs!34077 m!1109737))

(assert (=> bs!34077 m!1109737))

(declare-fun m!1109781 () Bool)

(assert (=> bs!34077 m!1109781))

(assert (=> b!1203399 d!132705))

(assert (=> b!1203399 d!132605))

(declare-fun d!132707 () Bool)

(declare-fun res!800981 () Bool)

(declare-fun e!683579 () Bool)

(assert (=> d!132707 (=> res!800981 e!683579)))

(assert (=> d!132707 (= res!800981 (= (select (arr!37634 _keys!1208) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!934))))

(assert (=> d!132707 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!683579)))

(declare-fun b!1203789 () Bool)

(declare-fun e!683580 () Bool)

(assert (=> b!1203789 (= e!683579 e!683580)))

(declare-fun res!800982 () Bool)

(assert (=> b!1203789 (=> (not res!800982) (not e!683580))))

(assert (=> b!1203789 (= res!800982 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(declare-fun b!1203790 () Bool)

(assert (=> b!1203790 (= e!683580 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!132707 (not res!800981)) b!1203789))

(assert (= (and b!1203789 res!800982) b!1203790))

(assert (=> d!132707 m!1109325))

(declare-fun m!1109783 () Bool)

(assert (=> b!1203790 m!1109783))

(assert (=> b!1203460 d!132707))

(declare-fun d!132709 () Bool)

(declare-fun e!683581 () Bool)

(assert (=> d!132709 e!683581))

(declare-fun res!800983 () Bool)

(assert (=> d!132709 (=> (not res!800983) (not e!683581))))

(declare-fun lt!545763 () ListLongMap!17657)

(assert (=> d!132709 (= res!800983 (contains!6898 lt!545763 (_1!9855 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!545765 () List!26498)

(assert (=> d!132709 (= lt!545763 (ListLongMap!17658 lt!545765))))

(declare-fun lt!545764 () Unit!39889)

(declare-fun lt!545762 () Unit!39889)

(assert (=> d!132709 (= lt!545764 lt!545762)))

(assert (=> d!132709 (= (getValueByKey!631 lt!545765 (_1!9855 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!681 (_2!9855 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132709 (= lt!545762 (lemmaContainsTupThenGetReturnValue!308 lt!545765 (_1!9855 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9855 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132709 (= lt!545765 (insertStrictlySorted!401 (toList!8844 call!58025) (_1!9855 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9855 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!132709 (= (+!3970 call!58025 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!545763)))

(declare-fun b!1203791 () Bool)

(declare-fun res!800984 () Bool)

(assert (=> b!1203791 (=> (not res!800984) (not e!683581))))

(assert (=> b!1203791 (= res!800984 (= (getValueByKey!631 (toList!8844 lt!545763) (_1!9855 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!681 (_2!9855 (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1203792 () Bool)

(assert (=> b!1203792 (= e!683581 (contains!6901 (toList!8844 lt!545763) (tuple2!19689 (select (arr!37634 lt!545424) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19180 (select (arr!37635 lt!545434) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132709 res!800983) b!1203791))

(assert (= (and b!1203791 res!800984) b!1203792))

(declare-fun m!1109785 () Bool)

(assert (=> d!132709 m!1109785))

(declare-fun m!1109787 () Bool)

(assert (=> d!132709 m!1109787))

(declare-fun m!1109789 () Bool)

(assert (=> d!132709 m!1109789))

(declare-fun m!1109791 () Bool)

(assert (=> d!132709 m!1109791))

(declare-fun m!1109793 () Bool)

(assert (=> b!1203791 m!1109793))

(declare-fun m!1109795 () Bool)

(assert (=> b!1203792 m!1109795))

(assert (=> b!1203377 d!132709))

(declare-fun d!132711 () Bool)

(declare-fun e!683582 () Bool)

(assert (=> d!132711 e!683582))

(declare-fun res!800985 () Bool)

(assert (=> d!132711 (=> (not res!800985) (not e!683582))))

(declare-fun lt!545767 () ListLongMap!17657)

(assert (=> d!132711 (= res!800985 (contains!6898 lt!545767 (_1!9855 (tuple2!19689 lt!545509 lt!545510))))))

(declare-fun lt!545769 () List!26498)

(assert (=> d!132711 (= lt!545767 (ListLongMap!17658 lt!545769))))

(declare-fun lt!545768 () Unit!39889)

(declare-fun lt!545766 () Unit!39889)

(assert (=> d!132711 (= lt!545768 lt!545766)))

(assert (=> d!132711 (= (getValueByKey!631 lt!545769 (_1!9855 (tuple2!19689 lt!545509 lt!545510))) (Some!681 (_2!9855 (tuple2!19689 lt!545509 lt!545510))))))

(assert (=> d!132711 (= lt!545766 (lemmaContainsTupThenGetReturnValue!308 lt!545769 (_1!9855 (tuple2!19689 lt!545509 lt!545510)) (_2!9855 (tuple2!19689 lt!545509 lt!545510))))))

(assert (=> d!132711 (= lt!545769 (insertStrictlySorted!401 (toList!8844 lt!545511) (_1!9855 (tuple2!19689 lt!545509 lt!545510)) (_2!9855 (tuple2!19689 lt!545509 lt!545510))))))

(assert (=> d!132711 (= (+!3970 lt!545511 (tuple2!19689 lt!545509 lt!545510)) lt!545767)))

(declare-fun b!1203793 () Bool)

(declare-fun res!800986 () Bool)

(assert (=> b!1203793 (=> (not res!800986) (not e!683582))))

(assert (=> b!1203793 (= res!800986 (= (getValueByKey!631 (toList!8844 lt!545767) (_1!9855 (tuple2!19689 lt!545509 lt!545510))) (Some!681 (_2!9855 (tuple2!19689 lt!545509 lt!545510)))))))

(declare-fun b!1203794 () Bool)

(assert (=> b!1203794 (= e!683582 (contains!6901 (toList!8844 lt!545767) (tuple2!19689 lt!545509 lt!545510)))))

(assert (= (and d!132711 res!800985) b!1203793))

(assert (= (and b!1203793 res!800986) b!1203794))

(declare-fun m!1109797 () Bool)

(assert (=> d!132711 m!1109797))

(declare-fun m!1109799 () Bool)

(assert (=> d!132711 m!1109799))

(declare-fun m!1109801 () Bool)

(assert (=> d!132711 m!1109801))

(declare-fun m!1109803 () Bool)

(assert (=> d!132711 m!1109803))

(declare-fun m!1109805 () Bool)

(assert (=> b!1203793 m!1109805))

(declare-fun m!1109807 () Bool)

(assert (=> b!1203794 m!1109807))

(assert (=> b!1203377 d!132711))

(declare-fun d!132713 () Bool)

(assert (=> d!132713 (not (contains!6898 (+!3970 lt!545511 (tuple2!19689 lt!545509 lt!545510)) lt!545507))))

(declare-fun lt!545770 () Unit!39889)

(assert (=> d!132713 (= lt!545770 (choose!1789 lt!545511 lt!545509 lt!545510 lt!545507))))

(declare-fun e!683583 () Bool)

(assert (=> d!132713 e!683583))

(declare-fun res!800987 () Bool)

(assert (=> d!132713 (=> (not res!800987) (not e!683583))))

(assert (=> d!132713 (= res!800987 (not (contains!6898 lt!545511 lt!545507)))))

(assert (=> d!132713 (= (addStillNotContains!288 lt!545511 lt!545509 lt!545510 lt!545507) lt!545770)))

(declare-fun b!1203795 () Bool)

(assert (=> b!1203795 (= e!683583 (not (= lt!545509 lt!545507)))))

(assert (= (and d!132713 res!800987) b!1203795))

(assert (=> d!132713 m!1109047))

(assert (=> d!132713 m!1109047))

(assert (=> d!132713 m!1109049))

(declare-fun m!1109809 () Bool)

(assert (=> d!132713 m!1109809))

(declare-fun m!1109811 () Bool)

(assert (=> d!132713 m!1109811))

(assert (=> b!1203377 d!132713))

(declare-fun d!132715 () Bool)

(declare-fun e!683585 () Bool)

(assert (=> d!132715 e!683585))

(declare-fun res!800988 () Bool)

(assert (=> d!132715 (=> res!800988 e!683585)))

(declare-fun lt!545773 () Bool)

(assert (=> d!132715 (= res!800988 (not lt!545773))))

(declare-fun lt!545772 () Bool)

(assert (=> d!132715 (= lt!545773 lt!545772)))

(declare-fun lt!545771 () Unit!39889)

(declare-fun e!683584 () Unit!39889)

(assert (=> d!132715 (= lt!545771 e!683584)))

(declare-fun c!117944 () Bool)

(assert (=> d!132715 (= c!117944 lt!545772)))

(assert (=> d!132715 (= lt!545772 (containsKey!587 (toList!8844 (+!3970 lt!545511 (tuple2!19689 lt!545509 lt!545510))) lt!545507))))

(assert (=> d!132715 (= (contains!6898 (+!3970 lt!545511 (tuple2!19689 lt!545509 lt!545510)) lt!545507) lt!545773)))

(declare-fun b!1203796 () Bool)

(declare-fun lt!545774 () Unit!39889)

(assert (=> b!1203796 (= e!683584 lt!545774)))

(assert (=> b!1203796 (= lt!545774 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 (+!3970 lt!545511 (tuple2!19689 lt!545509 lt!545510))) lt!545507))))

(assert (=> b!1203796 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545511 (tuple2!19689 lt!545509 lt!545510))) lt!545507))))

(declare-fun b!1203797 () Bool)

(declare-fun Unit!39917 () Unit!39889)

(assert (=> b!1203797 (= e!683584 Unit!39917)))

(declare-fun b!1203798 () Bool)

(assert (=> b!1203798 (= e!683585 (isDefined!456 (getValueByKey!631 (toList!8844 (+!3970 lt!545511 (tuple2!19689 lt!545509 lt!545510))) lt!545507)))))

(assert (= (and d!132715 c!117944) b!1203796))

(assert (= (and d!132715 (not c!117944)) b!1203797))

(assert (= (and d!132715 (not res!800988)) b!1203798))

(declare-fun m!1109813 () Bool)

(assert (=> d!132715 m!1109813))

(declare-fun m!1109815 () Bool)

(assert (=> b!1203796 m!1109815))

(declare-fun m!1109817 () Bool)

(assert (=> b!1203796 m!1109817))

(assert (=> b!1203796 m!1109817))

(declare-fun m!1109819 () Bool)

(assert (=> b!1203796 m!1109819))

(assert (=> b!1203798 m!1109817))

(assert (=> b!1203798 m!1109817))

(assert (=> b!1203798 m!1109819))

(assert (=> b!1203377 d!132715))

(assert (=> b!1203377 d!132647))

(declare-fun d!132717 () Bool)

(declare-fun e!683587 () Bool)

(assert (=> d!132717 e!683587))

(declare-fun res!800989 () Bool)

(assert (=> d!132717 (=> res!800989 e!683587)))

(declare-fun lt!545777 () Bool)

(assert (=> d!132717 (= res!800989 (not lt!545777))))

(declare-fun lt!545776 () Bool)

(assert (=> d!132717 (= lt!545777 lt!545776)))

(declare-fun lt!545775 () Unit!39889)

(declare-fun e!683586 () Unit!39889)

(assert (=> d!132717 (= lt!545775 e!683586)))

(declare-fun c!117945 () Bool)

(assert (=> d!132717 (= c!117945 lt!545776)))

(assert (=> d!132717 (= lt!545776 (containsKey!587 (toList!8844 lt!545512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132717 (= (contains!6898 lt!545512 #b1000000000000000000000000000000000000000000000000000000000000000) lt!545777)))

(declare-fun b!1203799 () Bool)

(declare-fun lt!545778 () Unit!39889)

(assert (=> b!1203799 (= e!683586 lt!545778)))

(assert (=> b!1203799 (= lt!545778 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203799 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203800 () Bool)

(declare-fun Unit!39918 () Unit!39889)

(assert (=> b!1203800 (= e!683586 Unit!39918)))

(declare-fun b!1203801 () Bool)

(assert (=> b!1203801 (= e!683587 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132717 c!117945) b!1203799))

(assert (= (and d!132717 (not c!117945)) b!1203800))

(assert (= (and d!132717 (not res!800989)) b!1203801))

(declare-fun m!1109821 () Bool)

(assert (=> d!132717 m!1109821))

(declare-fun m!1109823 () Bool)

(assert (=> b!1203799 m!1109823))

(declare-fun m!1109825 () Bool)

(assert (=> b!1203799 m!1109825))

(assert (=> b!1203799 m!1109825))

(declare-fun m!1109827 () Bool)

(assert (=> b!1203799 m!1109827))

(assert (=> b!1203801 m!1109825))

(assert (=> b!1203801 m!1109825))

(assert (=> b!1203801 m!1109827))

(assert (=> b!1203375 d!132717))

(declare-fun b!1203802 () Bool)

(declare-fun e!683592 () ListLongMap!17657)

(declare-fun call!58066 () ListLongMap!17657)

(assert (=> b!1203802 (= e!683592 call!58066)))

(declare-fun b!1203803 () Bool)

(declare-fun e!683589 () Bool)

(declare-fun e!683594 () Bool)

(assert (=> b!1203803 (= e!683589 e!683594)))

(declare-fun c!117947 () Bool)

(declare-fun e!683590 () Bool)

(assert (=> b!1203803 (= c!117947 e!683590)))

(declare-fun res!800991 () Bool)

(assert (=> b!1203803 (=> (not res!800991) (not e!683590))))

(assert (=> b!1203803 (= res!800991 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(declare-fun b!1203804 () Bool)

(declare-fun e!683593 () Bool)

(assert (=> b!1203804 (= e!683594 e!683593)))

(declare-fun c!117949 () Bool)

(assert (=> b!1203804 (= c!117949 (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(declare-fun b!1203805 () Bool)

(assert (=> b!1203805 (= e!683590 (validKeyInArray!0 (select (arr!37634 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203805 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1203806 () Bool)

(declare-fun e!683591 () ListLongMap!17657)

(assert (=> b!1203806 (= e!683591 (ListLongMap!17658 Nil!26495))))

(declare-fun d!132719 () Bool)

(assert (=> d!132719 e!683589))

(declare-fun res!800990 () Bool)

(assert (=> d!132719 (=> (not res!800990) (not e!683589))))

(declare-fun lt!545785 () ListLongMap!17657)

(assert (=> d!132719 (= res!800990 (not (contains!6898 lt!545785 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132719 (= lt!545785 e!683591)))

(declare-fun c!117946 () Bool)

(assert (=> d!132719 (= c!117946 (bvsge (bvadd from!1455 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(assert (=> d!132719 (validMask!0 mask!1564)))

(assert (=> d!132719 (= (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004) lt!545785)))

(declare-fun b!1203807 () Bool)

(assert (=> b!1203807 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(assert (=> b!1203807 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38171 _values!996)))))

(declare-fun e!683588 () Bool)

(assert (=> b!1203807 (= e!683588 (= (apply!960 lt!545785 (select (arr!37634 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))) (get!19180 (select (arr!37635 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!58063 () Bool)

(assert (=> bm!58063 (= call!58066 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1203808 () Bool)

(assert (=> b!1203808 (= e!683591 e!683592)))

(declare-fun c!117948 () Bool)

(assert (=> b!1203808 (= c!117948 (validKeyInArray!0 (select (arr!37634 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(declare-fun b!1203809 () Bool)

(assert (=> b!1203809 (= e!683593 (= lt!545785 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1203810 () Bool)

(assert (=> b!1203810 (= e!683593 (isEmpty!980 lt!545785))))

(declare-fun b!1203811 () Bool)

(declare-fun res!800993 () Bool)

(assert (=> b!1203811 (=> (not res!800993) (not e!683589))))

(assert (=> b!1203811 (= res!800993 (not (contains!6898 lt!545785 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1203812 () Bool)

(assert (=> b!1203812 (= e!683594 e!683588)))

(assert (=> b!1203812 (and (bvsge (bvadd from!1455 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1455 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(declare-fun res!800992 () Bool)

(assert (=> b!1203812 (= res!800992 (contains!6898 lt!545785 (select (arr!37634 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001))))))

(assert (=> b!1203812 (=> (not res!800992) (not e!683588))))

(declare-fun b!1203813 () Bool)

(declare-fun lt!545781 () Unit!39889)

(declare-fun lt!545779 () Unit!39889)

(assert (=> b!1203813 (= lt!545781 lt!545779)))

(declare-fun lt!545784 () ListLongMap!17657)

(declare-fun lt!545782 () (_ BitVec 64))

(declare-fun lt!545780 () (_ BitVec 64))

(declare-fun lt!545783 () V!45931)

(assert (=> b!1203813 (not (contains!6898 (+!3970 lt!545784 (tuple2!19689 lt!545782 lt!545783)) lt!545780))))

(assert (=> b!1203813 (= lt!545779 (addStillNotContains!288 lt!545784 lt!545782 lt!545783 lt!545780))))

(assert (=> b!1203813 (= lt!545780 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1203813 (= lt!545783 (get!19180 (select (arr!37635 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1203813 (= lt!545782 (select (arr!37634 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)))))

(assert (=> b!1203813 (= lt!545784 call!58066)))

(assert (=> b!1203813 (= e!683592 (+!3970 call!58066 (tuple2!19689 (select (arr!37634 _keys!1208) (bvadd from!1455 #b00000000000000000000000000000001)) (get!19180 (select (arr!37635 _values!996) (bvadd from!1455 #b00000000000000000000000000000001)) (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132719 c!117946) b!1203806))

(assert (= (and d!132719 (not c!117946)) b!1203808))

(assert (= (and b!1203808 c!117948) b!1203813))

(assert (= (and b!1203808 (not c!117948)) b!1203802))

(assert (= (or b!1203813 b!1203802) bm!58063))

(assert (= (and d!132719 res!800990) b!1203811))

(assert (= (and b!1203811 res!800993) b!1203803))

(assert (= (and b!1203803 res!800991) b!1203805))

(assert (= (and b!1203803 c!117947) b!1203812))

(assert (= (and b!1203803 (not c!117947)) b!1203804))

(assert (= (and b!1203812 res!800992) b!1203807))

(assert (= (and b!1203804 c!117949) b!1203809))

(assert (= (and b!1203804 (not c!117949)) b!1203810))

(declare-fun b_lambda!21155 () Bool)

(assert (=> (not b_lambda!21155) (not b!1203807)))

(assert (=> b!1203807 t!39376))

(declare-fun b_and!42729 () Bool)

(assert (= b_and!42727 (and (=> t!39376 result!21975) b_and!42729)))

(declare-fun b_lambda!21157 () Bool)

(assert (=> (not b_lambda!21157) (not b!1203813)))

(assert (=> b!1203813 t!39376))

(declare-fun b_and!42731 () Bool)

(assert (= b_and!42729 (and (=> t!39376 result!21975) b_and!42731)))

(declare-fun m!1109829 () Bool)

(assert (=> bm!58063 m!1109829))

(declare-fun m!1109831 () Bool)

(assert (=> b!1203807 m!1109831))

(declare-fun m!1109833 () Bool)

(assert (=> b!1203807 m!1109833))

(assert (=> b!1203807 m!1108891))

(declare-fun m!1109835 () Bool)

(assert (=> b!1203807 m!1109835))

(assert (=> b!1203807 m!1108891))

(assert (=> b!1203807 m!1109831))

(declare-fun m!1109837 () Bool)

(assert (=> b!1203807 m!1109837))

(assert (=> b!1203807 m!1109833))

(assert (=> b!1203805 m!1109831))

(assert (=> b!1203805 m!1109831))

(declare-fun m!1109839 () Bool)

(assert (=> b!1203805 m!1109839))

(assert (=> b!1203808 m!1109831))

(assert (=> b!1203808 m!1109831))

(assert (=> b!1203808 m!1109839))

(declare-fun m!1109841 () Bool)

(assert (=> b!1203811 m!1109841))

(declare-fun m!1109843 () Bool)

(assert (=> b!1203810 m!1109843))

(declare-fun m!1109845 () Bool)

(assert (=> d!132719 m!1109845))

(assert (=> d!132719 m!1108917))

(assert (=> b!1203813 m!1109831))

(declare-fun m!1109847 () Bool)

(assert (=> b!1203813 m!1109847))

(assert (=> b!1203813 m!1109833))

(assert (=> b!1203813 m!1108891))

(assert (=> b!1203813 m!1109835))

(assert (=> b!1203813 m!1108891))

(declare-fun m!1109849 () Bool)

(assert (=> b!1203813 m!1109849))

(declare-fun m!1109851 () Bool)

(assert (=> b!1203813 m!1109851))

(declare-fun m!1109853 () Bool)

(assert (=> b!1203813 m!1109853))

(assert (=> b!1203813 m!1109851))

(assert (=> b!1203813 m!1109833))

(assert (=> b!1203809 m!1109829))

(assert (=> b!1203812 m!1109831))

(assert (=> b!1203812 m!1109831))

(declare-fun m!1109855 () Bool)

(assert (=> b!1203812 m!1109855))

(assert (=> bm!58036 d!132719))

(assert (=> b!1203389 d!132649))

(assert (=> bm!58033 d!132503))

(declare-fun d!132721 () Bool)

(declare-fun e!683596 () Bool)

(assert (=> d!132721 e!683596))

(declare-fun res!800994 () Bool)

(assert (=> d!132721 (=> res!800994 e!683596)))

(declare-fun lt!545788 () Bool)

(assert (=> d!132721 (= res!800994 (not lt!545788))))

(declare-fun lt!545787 () Bool)

(assert (=> d!132721 (= lt!545788 lt!545787)))

(declare-fun lt!545786 () Unit!39889)

(declare-fun e!683595 () Unit!39889)

(assert (=> d!132721 (= lt!545786 e!683595)))

(declare-fun c!117950 () Bool)

(assert (=> d!132721 (= c!117950 lt!545787)))

(assert (=> d!132721 (= lt!545787 (containsKey!587 (toList!8844 lt!545568) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!132721 (= (contains!6898 lt!545568 #b1000000000000000000000000000000000000000000000000000000000000000) lt!545788)))

(declare-fun b!1203814 () Bool)

(declare-fun lt!545789 () Unit!39889)

(assert (=> b!1203814 (= e!683595 lt!545789)))

(assert (=> b!1203814 (= lt!545789 (lemmaContainsKeyImpliesGetValueByKeyDefined!417 (toList!8844 lt!545568) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1203814 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545568) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1203815 () Bool)

(declare-fun Unit!39919 () Unit!39889)

(assert (=> b!1203815 (= e!683595 Unit!39919)))

(declare-fun b!1203816 () Bool)

(assert (=> b!1203816 (= e!683596 (isDefined!456 (getValueByKey!631 (toList!8844 lt!545568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!132721 c!117950) b!1203814))

(assert (= (and d!132721 (not c!117950)) b!1203815))

(assert (= (and d!132721 (not res!800994)) b!1203816))

(declare-fun m!1109857 () Bool)

(assert (=> d!132721 m!1109857))

(declare-fun m!1109859 () Bool)

(assert (=> b!1203814 m!1109859))

(declare-fun m!1109861 () Bool)

(assert (=> b!1203814 m!1109861))

(assert (=> b!1203814 m!1109861))

(declare-fun m!1109863 () Bool)

(assert (=> b!1203814 m!1109863))

(assert (=> b!1203816 m!1109861))

(assert (=> b!1203816 m!1109861))

(assert (=> b!1203816 m!1109863))

(assert (=> b!1203452 d!132721))

(declare-fun d!132723 () Bool)

(assert (=> d!132723 (arrayContainsKey!0 _keys!1208 lt!545519 #b00000000000000000000000000000000)))

(declare-fun lt!545790 () Unit!39889)

(assert (=> d!132723 (= lt!545790 (choose!13 _keys!1208 lt!545519 #b00000000000000000000000000000000))))

(assert (=> d!132723 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!132723 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!545519 #b00000000000000000000000000000000) lt!545790)))

(declare-fun bs!34078 () Bool)

(assert (= bs!34078 d!132723))

(assert (=> bs!34078 m!1109057))

(declare-fun m!1109865 () Bool)

(assert (=> bs!34078 m!1109865))

(assert (=> b!1203388 d!132723))

(declare-fun d!132725 () Bool)

(declare-fun res!800995 () Bool)

(declare-fun e!683597 () Bool)

(assert (=> d!132725 (=> res!800995 e!683597)))

(assert (=> d!132725 (= res!800995 (= (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) lt!545519))))

(assert (=> d!132725 (= (arrayContainsKey!0 _keys!1208 lt!545519 #b00000000000000000000000000000000) e!683597)))

(declare-fun b!1203817 () Bool)

(declare-fun e!683598 () Bool)

(assert (=> b!1203817 (= e!683597 e!683598)))

(declare-fun res!800996 () Bool)

(assert (=> b!1203817 (=> (not res!800996) (not e!683598))))

(assert (=> b!1203817 (= res!800996 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38170 _keys!1208)))))

(declare-fun b!1203818 () Bool)

(assert (=> b!1203818 (= e!683598 (arrayContainsKey!0 _keys!1208 lt!545519 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132725 (not res!800995)) b!1203817))

(assert (= (and b!1203817 res!800996) b!1203818))

(assert (=> d!132725 m!1109053))

(declare-fun m!1109867 () Bool)

(assert (=> b!1203818 m!1109867))

(assert (=> b!1203388 d!132725))

(declare-fun b!1203819 () Bool)

(declare-fun e!683600 () SeekEntryResult!9933)

(declare-fun lt!545793 () SeekEntryResult!9933)

(assert (=> b!1203819 (= e!683600 (MissingZero!9933 (index!42105 lt!545793)))))

(declare-fun b!1203820 () Bool)

(assert (=> b!1203820 (= e!683600 (seekKeyOrZeroReturnVacant!0 (x!106362 lt!545793) (index!42105 lt!545793) (index!42105 lt!545793) (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(declare-fun b!1203821 () Bool)

(declare-fun c!117952 () Bool)

(declare-fun lt!545792 () (_ BitVec 64))

(assert (=> b!1203821 (= c!117952 (= lt!545792 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!683601 () SeekEntryResult!9933)

(assert (=> b!1203821 (= e!683601 e!683600)))

(declare-fun d!132727 () Bool)

(declare-fun lt!545791 () SeekEntryResult!9933)

(assert (=> d!132727 (and (or ((_ is Undefined!9933) lt!545791) (not ((_ is Found!9933) lt!545791)) (and (bvsge (index!42104 lt!545791) #b00000000000000000000000000000000) (bvslt (index!42104 lt!545791) (size!38170 _keys!1208)))) (or ((_ is Undefined!9933) lt!545791) ((_ is Found!9933) lt!545791) (not ((_ is MissingZero!9933) lt!545791)) (and (bvsge (index!42103 lt!545791) #b00000000000000000000000000000000) (bvslt (index!42103 lt!545791) (size!38170 _keys!1208)))) (or ((_ is Undefined!9933) lt!545791) ((_ is Found!9933) lt!545791) ((_ is MissingZero!9933) lt!545791) (not ((_ is MissingVacant!9933) lt!545791)) (and (bvsge (index!42106 lt!545791) #b00000000000000000000000000000000) (bvslt (index!42106 lt!545791) (size!38170 _keys!1208)))) (or ((_ is Undefined!9933) lt!545791) (ite ((_ is Found!9933) lt!545791) (= (select (arr!37634 _keys!1208) (index!42104 lt!545791)) (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9933) lt!545791) (= (select (arr!37634 _keys!1208) (index!42103 lt!545791)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9933) lt!545791) (= (select (arr!37634 _keys!1208) (index!42106 lt!545791)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!683599 () SeekEntryResult!9933)

(assert (=> d!132727 (= lt!545791 e!683599)))

(declare-fun c!117951 () Bool)

(assert (=> d!132727 (= c!117951 (and ((_ is Intermediate!9933) lt!545793) (undefined!10745 lt!545793)))))

(assert (=> d!132727 (= lt!545793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) mask!1564) (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564))))

(assert (=> d!132727 (validMask!0 mask!1564)))

(assert (=> d!132727 (= (seekEntryOrOpen!0 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) lt!545791)))

(declare-fun b!1203822 () Bool)

(assert (=> b!1203822 (= e!683599 Undefined!9933)))

(declare-fun b!1203823 () Bool)

(assert (=> b!1203823 (= e!683601 (Found!9933 (index!42105 lt!545793)))))

(declare-fun b!1203824 () Bool)

(assert (=> b!1203824 (= e!683599 e!683601)))

(assert (=> b!1203824 (= lt!545792 (select (arr!37634 _keys!1208) (index!42105 lt!545793)))))

(declare-fun c!117953 () Bool)

(assert (=> b!1203824 (= c!117953 (= lt!545792 (select (arr!37634 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132727 c!117951) b!1203822))

(assert (= (and d!132727 (not c!117951)) b!1203824))

(assert (= (and b!1203824 c!117953) b!1203823))

(assert (= (and b!1203824 (not c!117953)) b!1203821))

(assert (= (and b!1203821 c!117952) b!1203819))

(assert (= (and b!1203821 (not c!117952)) b!1203820))

(assert (=> b!1203820 m!1109053))

(declare-fun m!1109869 () Bool)

(assert (=> b!1203820 m!1109869))

(assert (=> d!132727 m!1109053))

(declare-fun m!1109871 () Bool)

(assert (=> d!132727 m!1109871))

(declare-fun m!1109873 () Bool)

(assert (=> d!132727 m!1109873))

(assert (=> d!132727 m!1108917))

(declare-fun m!1109875 () Bool)

(assert (=> d!132727 m!1109875))

(declare-fun m!1109877 () Bool)

(assert (=> d!132727 m!1109877))

(assert (=> d!132727 m!1109871))

(assert (=> d!132727 m!1109053))

(declare-fun m!1109879 () Bool)

(assert (=> d!132727 m!1109879))

(declare-fun m!1109881 () Bool)

(assert (=> b!1203824 m!1109881))

(assert (=> b!1203388 d!132727))

(assert (=> b!1203450 d!132719))

(assert (=> b!1203400 d!132547))

(declare-fun mapIsEmpty!47754 () Bool)

(declare-fun mapRes!47754 () Bool)

(assert (=> mapIsEmpty!47754 mapRes!47754))

(declare-fun b!1203825 () Bool)

(declare-fun e!683603 () Bool)

(assert (=> b!1203825 (= e!683603 tp_is_empty!30603)))

(declare-fun b!1203826 () Bool)

(declare-fun e!683602 () Bool)

(assert (=> b!1203826 (= e!683602 tp_is_empty!30603)))

(declare-fun condMapEmpty!47754 () Bool)

(declare-fun mapDefault!47754 () ValueCell!14592)

(assert (=> mapNonEmpty!47753 (= condMapEmpty!47754 (= mapRest!47753 ((as const (Array (_ BitVec 32) ValueCell!14592)) mapDefault!47754)))))

(assert (=> mapNonEmpty!47753 (= tp!90696 (and e!683602 mapRes!47754))))

(declare-fun mapNonEmpty!47754 () Bool)

(declare-fun tp!90697 () Bool)

(assert (=> mapNonEmpty!47754 (= mapRes!47754 (and tp!90697 e!683603))))

(declare-fun mapKey!47754 () (_ BitVec 32))

(declare-fun mapValue!47754 () ValueCell!14592)

(declare-fun mapRest!47754 () (Array (_ BitVec 32) ValueCell!14592))

(assert (=> mapNonEmpty!47754 (= mapRest!47753 (store mapRest!47754 mapKey!47754 mapValue!47754))))

(assert (= (and mapNonEmpty!47753 condMapEmpty!47754) mapIsEmpty!47754))

(assert (= (and mapNonEmpty!47753 (not condMapEmpty!47754)) mapNonEmpty!47754))

(assert (= (and mapNonEmpty!47754 ((_ is ValueCellFull!14592) mapValue!47754)) b!1203825))

(assert (= (and mapNonEmpty!47753 ((_ is ValueCellFull!14592) mapDefault!47754)) b!1203826))

(declare-fun m!1109883 () Bool)

(assert (=> mapNonEmpty!47754 m!1109883))

(declare-fun b_lambda!21159 () Bool)

(assert (= b_lambda!21151 (or (and start!100576 b_free!25899) b_lambda!21159)))

(declare-fun b_lambda!21161 () Bool)

(assert (= b_lambda!21145 (or (and start!100576 b_free!25899) b_lambda!21161)))

(declare-fun b_lambda!21163 () Bool)

(assert (= b_lambda!21141 (or (and start!100576 b_free!25899) b_lambda!21163)))

(declare-fun b_lambda!21165 () Bool)

(assert (= b_lambda!21139 (or (and start!100576 b_free!25899) b_lambda!21165)))

(declare-fun b_lambda!21167 () Bool)

(assert (= b_lambda!21155 (or (and start!100576 b_free!25899) b_lambda!21167)))

(declare-fun b_lambda!21169 () Bool)

(assert (= b_lambda!21149 (or (and start!100576 b_free!25899) b_lambda!21169)))

(declare-fun b_lambda!21171 () Bool)

(assert (= b_lambda!21153 (or (and start!100576 b_free!25899) b_lambda!21171)))

(declare-fun b_lambda!21173 () Bool)

(assert (= b_lambda!21143 (or (and start!100576 b_free!25899) b_lambda!21173)))

(declare-fun b_lambda!21175 () Bool)

(assert (= b_lambda!21157 (or (and start!100576 b_free!25899) b_lambda!21175)))

(declare-fun b_lambda!21177 () Bool)

(assert (= b_lambda!21147 (or (and start!100576 b_free!25899) b_lambda!21177)))

(declare-fun b_lambda!21179 () Bool)

(assert (= b_lambda!21137 (or (and start!100576 b_free!25899) b_lambda!21179)))

(check-sat (not d!132675) (not b_lambda!21173) (not b!1203575) (not b_lambda!21167) (not bm!58059) (not b!1203779) (not d!132673) (not d!132655) (not b!1203524) (not d!132573) (not b!1203681) (not b!1203781) (not b_next!25899) (not b!1203693) (not b!1203694) (not d!132609) (not d!132555) (not b!1203655) (not b!1203571) (not b!1203577) (not b!1203706) (not d!132539) (not b!1203573) (not b!1203814) (not d!132587) (not b!1203644) (not b_lambda!21099) (not b!1203764) (not bm!58037) b_and!42731 (not d!132695) (not b_lambda!21135) (not d!132567) (not b_lambda!21169) (not b!1203697) (not d!132643) (not b!1203656) (not b!1203799) (not b!1203809) (not d!132677) (not b!1203728) (not b!1203662) (not b!1203626) (not b!1203591) (not b!1203657) (not d!132635) (not b!1203629) (not d!132645) (not b!1203482) (not b!1203624) (not d!132689) (not b!1203705) (not b!1203773) (not b!1203631) (not b!1203559) (not d!132619) (not b!1203788) (not d!132701) (not b!1203713) (not d!132579) (not b!1203816) (not d!132603) (not b!1203717) (not b!1203600) (not b!1203710) (not b!1203570) (not bm!58054) (not d!132709) (not b!1203606) (not b!1203666) (not b_lambda!21159) (not d!132611) (not d!132575) (not b!1203565) (not b!1203776) (not b!1203619) (not b!1203523) (not b!1203679) (not b!1203793) (not d!132613) (not b!1203484) (not b!1203625) (not b!1203732) (not b!1203786) (not b!1203587) (not d!132663) (not b!1203687) (not b!1203566) (not d!132691) (not b_lambda!21179) (not b!1203716) (not d!132623) (not b!1203775) (not d!132637) (not b!1203608) (not d!132659) (not b!1203730) (not b!1203811) (not b_lambda!21177) (not b!1203617) (not b!1203486) (not d!132719) (not b!1203813) (not b!1203603) (not b!1203818) (not d!132681) (not b!1203763) (not d!132715) (not b!1203698) (not b!1203715) (not b!1203579) (not b!1203506) (not b!1203664) (not b!1203695) (not d!132651) (not b!1203498) (not b!1203673) (not d!132537) (not d!132577) (not b!1203485) (not b!1203796) (not d!132631) (not b!1203500) (not b!1203798) (not d!132543) (not mapNonEmpty!47754) tp_is_empty!30603 (not bm!58063) (not b!1203812) (not b!1203628) (not b!1203790) (not b!1203674) (not b!1203545) (not d!132545) (not b!1203597) (not b!1203682) (not bm!58047) (not b_lambda!21175) (not b!1203592) (not d!132581) (not b_lambda!21163) (not b!1203820) (not bm!58048) (not b_lambda!21125) (not b!1203611) (not b!1203645) (not b!1203708) (not b!1203720) (not b!1203711) (not b!1203729) (not b!1203504) (not d!132533) (not b!1203492) (not d!132629) (not b!1203768) (not d!132625) (not b!1203783) (not bm!58060) (not b_lambda!21123) (not b!1203707) (not d!132713) (not b!1203714) (not d!132699) (not d!132697) (not d!132563) (not d!132711) (not d!132639) (not b!1203552) (not b_lambda!21119) (not b!1203770) (not b!1203582) (not bm!58061) (not d!132703) (not bm!58062) (not b!1203478) (not b!1203517) (not d!132667) (not b!1203480) (not b_lambda!21165) (not b!1203791) (not d!132705) (not d!132723) (not b!1203581) (not b!1203771) (not b!1203481) (not b!1203685) (not d!132685) (not d!132671) (not b!1203503) (not bm!58055) (not b!1203616) (not b!1203595) (not b!1203614) (not b!1203569) (not b!1203741) (not b!1203725) (not b_lambda!21171) (not b!1203593) (not b!1203615) (not d!132721) (not d!132561) (not bm!58053) (not b!1203684) (not b_lambda!21129) (not d!132633) (not b!1203739) (not b!1203576) (not d!132593) (not d!132585) (not d!132591) (not b!1203765) (not b!1203598) (not b!1203691) (not b!1203483) (not b!1203777) (not d!132597) (not d!132727) (not b!1203805) (not d!132665) (not d!132529) (not b!1203810) (not d!132599) (not b_lambda!21131) (not b!1203785) (not b!1203731) (not d!132641) (not b!1203556) (not b!1203584) (not bm!58045) (not d!132627) (not b!1203762) (not b!1203704) (not d!132683) (not b!1203702) (not b!1203766) (not d!132601) (not b!1203686) (not b!1203553) (not d!132693) (not b!1203794) (not b_lambda!21121) (not b!1203807) (not d!132569) (not b!1203760) (not b!1203733) (not b!1203727) (not b!1203651) (not b_lambda!21161) (not b!1203589) (not b!1203501) (not d!132679) (not b!1203613) (not b!1203683) (not b!1203755) (not bm!58057) (not b!1203792) (not b!1203699) (not b_lambda!21133) (not b!1203665) (not d!132717) (not b!1203782) (not b!1203659) (not b!1203696) (not b_lambda!21127) (not b!1203801) (not b!1203700) (not b!1203808))
(check-sat b_and!42731 (not b_next!25899))
