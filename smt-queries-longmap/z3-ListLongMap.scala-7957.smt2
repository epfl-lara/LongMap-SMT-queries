; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98576 () Bool)

(assert start!98576)

(declare-fun b_free!24187 () Bool)

(declare-fun b_next!24187 () Bool)

(assert (=> start!98576 (= b_free!24187 (not b_next!24187))))

(declare-fun tp!85272 () Bool)

(declare-fun b_and!39201 () Bool)

(assert (=> start!98576 (= tp!85272 b_and!39201)))

(declare-fun mapNonEmpty!44900 () Bool)

(declare-fun mapRes!44900 () Bool)

(declare-fun tp!85271 () Bool)

(declare-fun e!650504 () Bool)

(assert (=> mapNonEmpty!44900 (= mapRes!44900 (and tp!85271 e!650504))))

(declare-datatypes ((V!43417 0))(
  ( (V!43418 (val!14415 Int)) )
))
(declare-datatypes ((ValueCell!13649 0))(
  ( (ValueCellFull!13649 (v!17051 V!43417)) (EmptyCell!13649) )
))
(declare-fun mapRest!44900 () (Array (_ BitVec 32) ValueCell!13649))

(declare-fun mapKey!44900 () (_ BitVec 32))

(declare-datatypes ((array!74212 0))(
  ( (array!74213 (arr!35757 (Array (_ BitVec 32) ValueCell!13649)) (size!36295 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74212)

(declare-fun mapValue!44900 () ValueCell!13649)

(assert (=> mapNonEmpty!44900 (= (arr!35757 _values!996) (store mapRest!44900 mapKey!44900 mapValue!44900))))

(declare-fun b!1143506 () Bool)

(declare-fun call!51765 () Bool)

(assert (=> b!1143506 call!51765))

(declare-datatypes ((Unit!37384 0))(
  ( (Unit!37385) )
))
(declare-fun lt!509899 () Unit!37384)

(declare-fun call!51767 () Unit!37384)

(assert (=> b!1143506 (= lt!509899 call!51767)))

(declare-fun e!650493 () Unit!37384)

(assert (=> b!1143506 (= e!650493 lt!509899)))

(declare-fun b!1143507 () Bool)

(declare-fun res!761833 () Bool)

(declare-fun e!650496 () Bool)

(assert (=> b!1143507 (=> (not res!761833) (not e!650496))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74214 0))(
  ( (array!74215 (arr!35758 (Array (_ BitVec 32) (_ BitVec 64))) (size!36296 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74214)

(assert (=> b!1143507 (= res!761833 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36296 _keys!1208))))))

(declare-fun b!1143508 () Bool)

(declare-fun e!650491 () Bool)

(assert (=> b!1143508 (= e!650496 e!650491)))

(declare-fun res!761826 () Bool)

(assert (=> b!1143508 (=> (not res!761826) (not e!650491))))

(declare-fun lt!509898 () array!74214)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74214 (_ BitVec 32)) Bool)

(assert (=> b!1143508 (= res!761826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509898 mask!1564))))

(assert (=> b!1143508 (= lt!509898 (array!74215 (store (arr!35758 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36296 _keys!1208)))))

(declare-fun b!1143509 () Bool)

(declare-fun e!650501 () Unit!37384)

(declare-fun Unit!37386 () Unit!37384)

(assert (=> b!1143509 (= e!650501 Unit!37386)))

(declare-fun lt!509908 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1143509 (= lt!509908 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112518 () Bool)

(assert (=> b!1143509 (= c!112518 (and (not lt!509908) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509891 () Unit!37384)

(declare-fun e!650498 () Unit!37384)

(assert (=> b!1143509 (= lt!509891 e!650498)))

(declare-fun zeroValue!944 () V!43417)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!509906 () Unit!37384)

(declare-fun minValue!944 () V!43417)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!403 (array!74214 array!74212 (_ BitVec 32) (_ BitVec 32) V!43417 V!43417 (_ BitVec 64) (_ BitVec 32) Int) Unit!37384)

(assert (=> b!1143509 (= lt!509906 (lemmaListMapContainsThenArrayContainsFrom!403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112520 () Bool)

(assert (=> b!1143509 (= c!112520 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761828 () Bool)

(declare-fun e!650497 () Bool)

(assert (=> b!1143509 (= res!761828 e!650497)))

(declare-fun e!650499 () Bool)

(assert (=> b!1143509 (=> (not res!761828) (not e!650499))))

(assert (=> b!1143509 e!650499))

(declare-fun lt!509907 () Unit!37384)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74214 (_ BitVec 32) (_ BitVec 32)) Unit!37384)

(assert (=> b!1143509 (= lt!509907 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25075 0))(
  ( (Nil!25072) (Cons!25071 (h!26280 (_ BitVec 64)) (t!36245 List!25075)) )
))
(declare-fun arrayNoDuplicates!0 (array!74214 (_ BitVec 32) List!25075) Bool)

(assert (=> b!1143509 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25072)))

(declare-fun lt!509896 () Unit!37384)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74214 (_ BitVec 64) (_ BitVec 32) List!25075) Unit!37384)

(assert (=> b!1143509 (= lt!509896 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25072))))

(assert (=> b!1143509 false))

(declare-fun b!1143510 () Bool)

(declare-fun c!112515 () Bool)

(assert (=> b!1143510 (= c!112515 (and (not lt!509908) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650492 () Unit!37384)

(assert (=> b!1143510 (= e!650498 e!650492)))

(declare-fun b!1143511 () Bool)

(declare-fun Unit!37387 () Unit!37384)

(assert (=> b!1143511 (= e!650493 Unit!37387)))

(declare-datatypes ((tuple2!18338 0))(
  ( (tuple2!18339 (_1!9180 (_ BitVec 64)) (_2!9180 V!43417)) )
))
(declare-datatypes ((List!25076 0))(
  ( (Nil!25073) (Cons!25072 (h!26281 tuple2!18338) (t!36246 List!25076)) )
))
(declare-datatypes ((ListLongMap!16307 0))(
  ( (ListLongMap!16308 (toList!8169 List!25076)) )
))
(declare-fun call!51764 () ListLongMap!16307)

(declare-fun lt!509902 () array!74212)

(declare-fun bm!51760 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4659 (array!74214 array!74212 (_ BitVec 32) (_ BitVec 32) V!43417 V!43417 (_ BitVec 32) Int) ListLongMap!16307)

(assert (=> bm!51760 (= call!51764 (getCurrentListMapNoExtraKeys!4659 lt!509898 lt!509902 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!761829 () Bool)

(assert (=> start!98576 (=> (not res!761829) (not e!650496))))

(assert (=> start!98576 (= res!761829 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36296 _keys!1208))))))

(assert (=> start!98576 e!650496))

(declare-fun tp_is_empty!28717 () Bool)

(assert (=> start!98576 tp_is_empty!28717))

(declare-fun array_inv!27476 (array!74214) Bool)

(assert (=> start!98576 (array_inv!27476 _keys!1208)))

(assert (=> start!98576 true))

(assert (=> start!98576 tp!85272))

(declare-fun e!650495 () Bool)

(declare-fun array_inv!27477 (array!74212) Bool)

(assert (=> start!98576 (and (array_inv!27477 _values!996) e!650495)))

(declare-fun b!1143512 () Bool)

(declare-fun Unit!37388 () Unit!37384)

(assert (=> b!1143512 (= e!650501 Unit!37388)))

(declare-fun b!1143513 () Bool)

(declare-fun e!650490 () Bool)

(declare-fun call!51763 () ListLongMap!16307)

(assert (=> b!1143513 (= e!650490 (= call!51764 call!51763))))

(declare-fun bm!51761 () Bool)

(declare-fun call!51769 () Bool)

(assert (=> bm!51761 (= call!51765 call!51769)))

(declare-fun b!1143514 () Bool)

(declare-fun e!650494 () Bool)

(assert (=> b!1143514 (= e!650491 (not e!650494))))

(declare-fun res!761836 () Bool)

(assert (=> b!1143514 (=> res!761836 e!650494)))

(assert (=> b!1143514 (= res!761836 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143514 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509904 () Unit!37384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74214 (_ BitVec 64) (_ BitVec 32)) Unit!37384)

(assert (=> b!1143514 (= lt!509904 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1143515 () Bool)

(declare-fun e!650505 () Bool)

(assert (=> b!1143515 (= e!650495 (and e!650505 mapRes!44900))))

(declare-fun condMapEmpty!44900 () Bool)

(declare-fun mapDefault!44900 () ValueCell!13649)

(assert (=> b!1143515 (= condMapEmpty!44900 (= (arr!35757 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13649)) mapDefault!44900)))))

(declare-fun call!51770 () ListLongMap!16307)

(declare-fun lt!509895 () ListLongMap!16307)

(declare-fun bm!51762 () Bool)

(declare-fun +!3592 (ListLongMap!16307 tuple2!18338) ListLongMap!16307)

(assert (=> bm!51762 (= call!51770 (+!3592 lt!509895 (ite (or c!112518 c!112515) (tuple2!18339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1143516 () Bool)

(assert (=> b!1143516 (= e!650499 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51763 () Bool)

(assert (=> bm!51763 (= call!51763 (getCurrentListMapNoExtraKeys!4659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143517 () Bool)

(assert (=> b!1143517 (= e!650497 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143518 () Bool)

(declare-fun res!761830 () Bool)

(assert (=> b!1143518 (=> (not res!761830) (not e!650496))))

(assert (=> b!1143518 (= res!761830 (= (select (arr!35758 _keys!1208) i!673) k0!934))))

(declare-fun bm!51764 () Bool)

(declare-fun call!51768 () Unit!37384)

(assert (=> bm!51764 (= call!51767 call!51768)))

(declare-fun b!1143519 () Bool)

(declare-fun lt!509900 () ListLongMap!16307)

(declare-fun contains!6637 (ListLongMap!16307 (_ BitVec 64)) Bool)

(assert (=> b!1143519 (contains!6637 (+!3592 lt!509900 (tuple2!18339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!509890 () Unit!37384)

(assert (=> b!1143519 (= lt!509890 call!51768)))

(assert (=> b!1143519 call!51769))

(assert (=> b!1143519 (= lt!509900 call!51770)))

(declare-fun lt!509897 () Unit!37384)

(declare-fun addStillContains!806 (ListLongMap!16307 (_ BitVec 64) V!43417 (_ BitVec 64)) Unit!37384)

(assert (=> b!1143519 (= lt!509897 (addStillContains!806 lt!509895 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1143519 (= e!650498 lt!509890)))

(declare-fun b!1143520 () Bool)

(declare-fun -!1247 (ListLongMap!16307 (_ BitVec 64)) ListLongMap!16307)

(assert (=> b!1143520 (= e!650490 (= call!51764 (-!1247 call!51763 k0!934)))))

(declare-fun bm!51765 () Bool)

(declare-fun call!51766 () ListLongMap!16307)

(assert (=> bm!51765 (= call!51766 call!51770)))

(declare-fun b!1143521 () Bool)

(declare-fun res!761825 () Bool)

(assert (=> b!1143521 (=> (not res!761825) (not e!650496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143521 (= res!761825 (validKeyInArray!0 k0!934))))

(declare-fun b!1143522 () Bool)

(declare-fun res!761827 () Bool)

(assert (=> b!1143522 (=> (not res!761827) (not e!650496))))

(assert (=> b!1143522 (= res!761827 (and (= (size!36295 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36296 _keys!1208) (size!36295 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44900 () Bool)

(assert (=> mapIsEmpty!44900 mapRes!44900))

(declare-fun b!1143523 () Bool)

(declare-fun e!650503 () Bool)

(assert (=> b!1143523 (= e!650503 true)))

(declare-fun lt!509905 () V!43417)

(assert (=> b!1143523 (= (-!1247 (+!3592 lt!509895 (tuple2!18339 (select (arr!35758 _keys!1208) from!1455) lt!509905)) (select (arr!35758 _keys!1208) from!1455)) lt!509895)))

(declare-fun lt!509901 () Unit!37384)

(declare-fun addThenRemoveForNewKeyIsSame!113 (ListLongMap!16307 (_ BitVec 64) V!43417) Unit!37384)

(assert (=> b!1143523 (= lt!509901 (addThenRemoveForNewKeyIsSame!113 lt!509895 (select (arr!35758 _keys!1208) from!1455) lt!509905))))

(declare-fun lt!509894 () V!43417)

(declare-fun get!18189 (ValueCell!13649 V!43417) V!43417)

(assert (=> b!1143523 (= lt!509905 (get!18189 (select (arr!35757 _values!996) from!1455) lt!509894))))

(declare-fun lt!509910 () Unit!37384)

(assert (=> b!1143523 (= lt!509910 e!650501)))

(declare-fun c!112517 () Bool)

(assert (=> b!1143523 (= c!112517 (contains!6637 lt!509895 k0!934))))

(assert (=> b!1143523 (= lt!509895 (getCurrentListMapNoExtraKeys!4659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143524 () Bool)

(declare-fun e!650500 () Bool)

(assert (=> b!1143524 (= e!650500 e!650503)))

(declare-fun res!761837 () Bool)

(assert (=> b!1143524 (=> res!761837 e!650503)))

(assert (=> b!1143524 (= res!761837 (not (= (select (arr!35758 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1143524 e!650490))

(declare-fun c!112519 () Bool)

(assert (=> b!1143524 (= c!112519 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509892 () Unit!37384)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!528 (array!74214 array!74212 (_ BitVec 32) (_ BitVec 32) V!43417 V!43417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37384)

(assert (=> b!1143524 (= lt!509892 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!528 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143525 () Bool)

(declare-fun res!761834 () Bool)

(assert (=> b!1143525 (=> (not res!761834) (not e!650491))))

(assert (=> b!1143525 (= res!761834 (arrayNoDuplicates!0 lt!509898 #b00000000000000000000000000000000 Nil!25072))))

(declare-fun b!1143526 () Bool)

(declare-fun res!761832 () Bool)

(assert (=> b!1143526 (=> (not res!761832) (not e!650496))))

(assert (=> b!1143526 (= res!761832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1143527 () Bool)

(declare-fun res!761831 () Bool)

(assert (=> b!1143527 (=> (not res!761831) (not e!650496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143527 (= res!761831 (validMask!0 mask!1564))))

(declare-fun b!1143528 () Bool)

(assert (=> b!1143528 (= e!650504 tp_is_empty!28717)))

(declare-fun b!1143529 () Bool)

(declare-fun res!761835 () Bool)

(assert (=> b!1143529 (=> (not res!761835) (not e!650496))))

(assert (=> b!1143529 (= res!761835 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25072))))

(declare-fun bm!51766 () Bool)

(assert (=> bm!51766 (= call!51768 (addStillContains!806 (ite c!112518 lt!509900 lt!509895) (ite c!112518 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112515 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112518 minValue!944 (ite c!112515 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1143530 () Bool)

(assert (=> b!1143530 (= e!650497 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509908) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!51767 () Bool)

(assert (=> bm!51767 (= call!51769 (contains!6637 (ite c!112518 lt!509900 call!51766) k0!934))))

(declare-fun b!1143531 () Bool)

(declare-fun lt!509893 () Unit!37384)

(assert (=> b!1143531 (= e!650492 lt!509893)))

(assert (=> b!1143531 (= lt!509893 call!51767)))

(assert (=> b!1143531 call!51765))

(declare-fun b!1143532 () Bool)

(assert (=> b!1143532 (= e!650494 e!650500)))

(declare-fun res!761824 () Bool)

(assert (=> b!1143532 (=> res!761824 e!650500)))

(assert (=> b!1143532 (= res!761824 (not (= from!1455 i!673)))))

(declare-fun lt!509903 () ListLongMap!16307)

(assert (=> b!1143532 (= lt!509903 (getCurrentListMapNoExtraKeys!4659 lt!509898 lt!509902 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1143532 (= lt!509902 (array!74213 (store (arr!35757 _values!996) i!673 (ValueCellFull!13649 lt!509894)) (size!36295 _values!996)))))

(declare-fun dynLambda!2635 (Int (_ BitVec 64)) V!43417)

(assert (=> b!1143532 (= lt!509894 (dynLambda!2635 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509909 () ListLongMap!16307)

(assert (=> b!1143532 (= lt!509909 (getCurrentListMapNoExtraKeys!4659 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143533 () Bool)

(assert (=> b!1143533 (= e!650492 e!650493)))

(declare-fun c!112516 () Bool)

(assert (=> b!1143533 (= c!112516 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509908))))

(declare-fun b!1143534 () Bool)

(assert (=> b!1143534 (= e!650505 tp_is_empty!28717)))

(assert (= (and start!98576 res!761829) b!1143527))

(assert (= (and b!1143527 res!761831) b!1143522))

(assert (= (and b!1143522 res!761827) b!1143526))

(assert (= (and b!1143526 res!761832) b!1143529))

(assert (= (and b!1143529 res!761835) b!1143507))

(assert (= (and b!1143507 res!761833) b!1143521))

(assert (= (and b!1143521 res!761825) b!1143518))

(assert (= (and b!1143518 res!761830) b!1143508))

(assert (= (and b!1143508 res!761826) b!1143525))

(assert (= (and b!1143525 res!761834) b!1143514))

(assert (= (and b!1143514 (not res!761836)) b!1143532))

(assert (= (and b!1143532 (not res!761824)) b!1143524))

(assert (= (and b!1143524 c!112519) b!1143520))

(assert (= (and b!1143524 (not c!112519)) b!1143513))

(assert (= (or b!1143520 b!1143513) bm!51760))

(assert (= (or b!1143520 b!1143513) bm!51763))

(assert (= (and b!1143524 (not res!761837)) b!1143523))

(assert (= (and b!1143523 c!112517) b!1143509))

(assert (= (and b!1143523 (not c!112517)) b!1143512))

(assert (= (and b!1143509 c!112518) b!1143519))

(assert (= (and b!1143509 (not c!112518)) b!1143510))

(assert (= (and b!1143510 c!112515) b!1143531))

(assert (= (and b!1143510 (not c!112515)) b!1143533))

(assert (= (and b!1143533 c!112516) b!1143506))

(assert (= (and b!1143533 (not c!112516)) b!1143511))

(assert (= (or b!1143531 b!1143506) bm!51764))

(assert (= (or b!1143531 b!1143506) bm!51765))

(assert (= (or b!1143531 b!1143506) bm!51761))

(assert (= (or b!1143519 bm!51761) bm!51767))

(assert (= (or b!1143519 bm!51764) bm!51766))

(assert (= (or b!1143519 bm!51765) bm!51762))

(assert (= (and b!1143509 c!112520) b!1143517))

(assert (= (and b!1143509 (not c!112520)) b!1143530))

(assert (= (and b!1143509 res!761828) b!1143516))

(assert (= (and b!1143515 condMapEmpty!44900) mapIsEmpty!44900))

(assert (= (and b!1143515 (not condMapEmpty!44900)) mapNonEmpty!44900))

(get-info :version)

(assert (= (and mapNonEmpty!44900 ((_ is ValueCellFull!13649) mapValue!44900)) b!1143528))

(assert (= (and b!1143515 ((_ is ValueCellFull!13649) mapDefault!44900)) b!1143534))

(assert (= start!98576 b!1143515))

(declare-fun b_lambda!19275 () Bool)

(assert (=> (not b_lambda!19275) (not b!1143532)))

(declare-fun t!36244 () Bool)

(declare-fun tb!8991 () Bool)

(assert (=> (and start!98576 (= defaultEntry!1004 defaultEntry!1004) t!36244) tb!8991))

(declare-fun result!18555 () Bool)

(assert (=> tb!8991 (= result!18555 tp_is_empty!28717)))

(assert (=> b!1143532 t!36244))

(declare-fun b_and!39203 () Bool)

(assert (= b_and!39201 (and (=> t!36244 result!18555) b_and!39203)))

(declare-fun m!1054149 () Bool)

(assert (=> b!1143519 m!1054149))

(assert (=> b!1143519 m!1054149))

(declare-fun m!1054151 () Bool)

(assert (=> b!1143519 m!1054151))

(declare-fun m!1054153 () Bool)

(assert (=> b!1143519 m!1054153))

(declare-fun m!1054155 () Bool)

(assert (=> b!1143523 m!1054155))

(declare-fun m!1054157 () Bool)

(assert (=> b!1143523 m!1054157))

(assert (=> b!1143523 m!1054157))

(declare-fun m!1054159 () Bool)

(assert (=> b!1143523 m!1054159))

(declare-fun m!1054161 () Bool)

(assert (=> b!1143523 m!1054161))

(declare-fun m!1054163 () Bool)

(assert (=> b!1143523 m!1054163))

(declare-fun m!1054165 () Bool)

(assert (=> b!1143523 m!1054165))

(declare-fun m!1054167 () Bool)

(assert (=> b!1143523 m!1054167))

(assert (=> b!1143523 m!1054165))

(assert (=> b!1143523 m!1054163))

(assert (=> b!1143523 m!1054165))

(declare-fun m!1054169 () Bool)

(assert (=> b!1143523 m!1054169))

(declare-fun m!1054171 () Bool)

(assert (=> b!1143517 m!1054171))

(declare-fun m!1054173 () Bool)

(assert (=> b!1143520 m!1054173))

(declare-fun m!1054175 () Bool)

(assert (=> start!98576 m!1054175))

(declare-fun m!1054177 () Bool)

(assert (=> start!98576 m!1054177))

(declare-fun m!1054179 () Bool)

(assert (=> bm!51766 m!1054179))

(declare-fun m!1054181 () Bool)

(assert (=> b!1143521 m!1054181))

(declare-fun m!1054183 () Bool)

(assert (=> b!1143518 m!1054183))

(declare-fun m!1054185 () Bool)

(assert (=> b!1143525 m!1054185))

(assert (=> bm!51763 m!1054155))

(declare-fun m!1054187 () Bool)

(assert (=> bm!51767 m!1054187))

(declare-fun m!1054189 () Bool)

(assert (=> bm!51760 m!1054189))

(declare-fun m!1054191 () Bool)

(assert (=> b!1143509 m!1054191))

(declare-fun m!1054193 () Bool)

(assert (=> b!1143509 m!1054193))

(declare-fun m!1054195 () Bool)

(assert (=> b!1143509 m!1054195))

(declare-fun m!1054197 () Bool)

(assert (=> b!1143509 m!1054197))

(declare-fun m!1054199 () Bool)

(assert (=> b!1143514 m!1054199))

(declare-fun m!1054201 () Bool)

(assert (=> b!1143514 m!1054201))

(declare-fun m!1054203 () Bool)

(assert (=> b!1143529 m!1054203))

(declare-fun m!1054205 () Bool)

(assert (=> mapNonEmpty!44900 m!1054205))

(declare-fun m!1054207 () Bool)

(assert (=> b!1143527 m!1054207))

(declare-fun m!1054209 () Bool)

(assert (=> b!1143526 m!1054209))

(declare-fun m!1054211 () Bool)

(assert (=> b!1143532 m!1054211))

(declare-fun m!1054213 () Bool)

(assert (=> b!1143532 m!1054213))

(declare-fun m!1054215 () Bool)

(assert (=> b!1143532 m!1054215))

(declare-fun m!1054217 () Bool)

(assert (=> b!1143532 m!1054217))

(declare-fun m!1054219 () Bool)

(assert (=> b!1143508 m!1054219))

(declare-fun m!1054221 () Bool)

(assert (=> b!1143508 m!1054221))

(assert (=> b!1143516 m!1054171))

(assert (=> b!1143524 m!1054165))

(declare-fun m!1054223 () Bool)

(assert (=> b!1143524 m!1054223))

(declare-fun m!1054225 () Bool)

(assert (=> bm!51762 m!1054225))

(check-sat (not b!1143526) (not b!1143529) (not b!1143521) (not b!1143519) (not b!1143532) b_and!39203 (not bm!51760) tp_is_empty!28717 (not b!1143523) (not b!1143524) (not bm!51762) (not b!1143527) (not mapNonEmpty!44900) (not bm!51766) (not b!1143516) (not start!98576) (not b!1143517) (not bm!51767) (not b_next!24187) (not b!1143514) (not b!1143525) (not b!1143520) (not b!1143509) (not bm!51763) (not b!1143508) (not b_lambda!19275))
(check-sat b_and!39203 (not b_next!24187))
