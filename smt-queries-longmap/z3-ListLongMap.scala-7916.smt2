; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98542 () Bool)

(assert start!98542)

(declare-fun b_free!23941 () Bool)

(declare-fun b_next!23941 () Bool)

(assert (=> start!98542 (= b_free!23941 (not b_next!23941))))

(declare-fun tp!84531 () Bool)

(declare-fun b_and!38715 () Bool)

(assert (=> start!98542 (= tp!84531 b_and!38715)))

(declare-fun b!1133706 () Bool)

(declare-fun e!645325 () Bool)

(declare-fun e!645329 () Bool)

(assert (=> b!1133706 (= e!645325 (not e!645329))))

(declare-fun res!756796 () Bool)

(assert (=> b!1133706 (=> res!756796 e!645329)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133706 (= res!756796 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73845 0))(
  ( (array!73846 (arr!35568 (Array (_ BitVec 32) (_ BitVec 64))) (size!36105 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73845)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133706 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37078 0))(
  ( (Unit!37079) )
))
(declare-fun lt!503615 () Unit!37078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73845 (_ BitVec 64) (_ BitVec 32)) Unit!37078)

(assert (=> b!1133706 (= lt!503615 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1133707 () Bool)

(declare-fun e!645322 () Bool)

(declare-datatypes ((V!43089 0))(
  ( (V!43090 (val!14292 Int)) )
))
(declare-datatypes ((tuple2!18028 0))(
  ( (tuple2!18029 (_1!9025 (_ BitVec 64)) (_2!9025 V!43089)) )
))
(declare-datatypes ((List!24803 0))(
  ( (Nil!24800) (Cons!24799 (h!26017 tuple2!18028) (t!35728 List!24803)) )
))
(declare-datatypes ((ListLongMap!16005 0))(
  ( (ListLongMap!16006 (toList!8018 List!24803)) )
))
(declare-fun call!48885 () ListLongMap!16005)

(declare-fun call!48879 () ListLongMap!16005)

(assert (=> b!1133707 (= e!645322 (= call!48885 call!48879))))

(declare-fun b!1133708 () Bool)

(declare-fun res!756803 () Bool)

(declare-fun e!645328 () Bool)

(assert (=> b!1133708 (=> (not res!756803) (not e!645328))))

(assert (=> b!1133708 (= res!756803 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36105 _keys!1208))))))

(declare-fun bm!48876 () Bool)

(declare-fun call!48881 () Unit!37078)

(declare-fun call!48884 () Unit!37078)

(assert (=> bm!48876 (= call!48881 call!48884)))

(declare-fun b!1133709 () Bool)

(declare-fun res!756797 () Bool)

(assert (=> b!1133709 (=> (not res!756797) (not e!645328))))

(declare-datatypes ((List!24804 0))(
  ( (Nil!24801) (Cons!24800 (h!26018 (_ BitVec 64)) (t!35729 List!24804)) )
))
(declare-fun arrayNoDuplicates!0 (array!73845 (_ BitVec 32) List!24804) Bool)

(assert (=> b!1133709 (= res!756797 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24801))))

(declare-fun b!1133710 () Bool)

(declare-fun e!645319 () Unit!37078)

(declare-fun e!645316 () Unit!37078)

(assert (=> b!1133710 (= e!645319 e!645316)))

(declare-fun c!110817 () Bool)

(declare-fun lt!503614 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1133710 (= c!110817 (and (not lt!503614) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!645324 () Bool)

(declare-fun b!1133711 () Bool)

(assert (=> b!1133711 (= e!645324 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133712 () Bool)

(declare-fun res!756800 () Bool)

(assert (=> b!1133712 (=> (not res!756800) (not e!645328))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73845 (_ BitVec 32)) Bool)

(assert (=> b!1133712 (= res!756800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44528 () Bool)

(declare-fun mapRes!44528 () Bool)

(assert (=> mapIsEmpty!44528 mapRes!44528))

(declare-fun zeroValue!944 () V!43089)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13526 0))(
  ( (ValueCellFull!13526 (v!16924 V!43089)) (EmptyCell!13526) )
))
(declare-datatypes ((array!73847 0))(
  ( (array!73848 (arr!35569 (Array (_ BitVec 32) ValueCell!13526)) (size!36106 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73847)

(declare-fun bm!48878 () Bool)

(declare-fun minValue!944 () V!43089)

(declare-fun getCurrentListMapNoExtraKeys!4534 (array!73845 array!73847 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 32) Int) ListLongMap!16005)

(assert (=> bm!48878 (= call!48879 (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48879 () Bool)

(declare-fun call!48886 () Bool)

(declare-fun call!48880 () Bool)

(assert (=> bm!48879 (= call!48886 call!48880)))

(declare-fun b!1133713 () Bool)

(declare-fun e!645320 () Unit!37078)

(declare-fun Unit!37080 () Unit!37078)

(assert (=> b!1133713 (= e!645320 Unit!37080)))

(declare-fun lt!503618 () array!73845)

(declare-fun bm!48880 () Bool)

(declare-fun lt!503612 () array!73847)

(assert (=> bm!48880 (= call!48885 (getCurrentListMapNoExtraKeys!4534 lt!503618 lt!503612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133714 () Bool)

(declare-fun res!756805 () Bool)

(assert (=> b!1133714 (=> (not res!756805) (not e!645328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133714 (= res!756805 (validKeyInArray!0 k0!934))))

(declare-fun b!1133715 () Bool)

(declare-fun e!645315 () Bool)

(assert (=> b!1133715 (= e!645329 e!645315)))

(declare-fun res!756806 () Bool)

(assert (=> b!1133715 (=> res!756806 e!645315)))

(assert (=> b!1133715 (= res!756806 (not (= from!1455 i!673)))))

(declare-fun lt!503608 () ListLongMap!16005)

(assert (=> b!1133715 (= lt!503608 (getCurrentListMapNoExtraKeys!4534 lt!503618 lt!503612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2594 (Int (_ BitVec 64)) V!43089)

(assert (=> b!1133715 (= lt!503612 (array!73848 (store (arr!35569 _values!996) i!673 (ValueCellFull!13526 (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36106 _values!996)))))

(declare-fun lt!503616 () ListLongMap!16005)

(assert (=> b!1133715 (= lt!503616 (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!756807 () Bool)

(assert (=> start!98542 (=> (not res!756807) (not e!645328))))

(assert (=> start!98542 (= res!756807 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36105 _keys!1208))))))

(assert (=> start!98542 e!645328))

(declare-fun tp_is_empty!28471 () Bool)

(assert (=> start!98542 tp_is_empty!28471))

(declare-fun array_inv!27338 (array!73845) Bool)

(assert (=> start!98542 (array_inv!27338 _keys!1208)))

(assert (=> start!98542 true))

(assert (=> start!98542 tp!84531))

(declare-fun e!645323 () Bool)

(declare-fun array_inv!27339 (array!73847) Bool)

(assert (=> start!98542 (and (array_inv!27339 _values!996) e!645323)))

(declare-fun lt!503620 () ListLongMap!16005)

(declare-fun lt!503610 () ListLongMap!16005)

(declare-fun bm!48877 () Bool)

(declare-fun c!110818 () Bool)

(declare-fun addStillContains!707 (ListLongMap!16005 (_ BitVec 64) V!43089 (_ BitVec 64)) Unit!37078)

(assert (=> bm!48877 (= call!48884 (addStillContains!707 (ite c!110818 lt!503610 lt!503620) (ite c!110818 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110817 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110818 minValue!944 (ite c!110817 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1133716 () Bool)

(assert (=> b!1133716 (= e!645324 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503614) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133717 () Bool)

(assert (=> b!1133717 call!48886))

(declare-fun lt!503622 () Unit!37078)

(assert (=> b!1133717 (= lt!503622 call!48881)))

(assert (=> b!1133717 (= e!645316 lt!503622)))

(declare-fun b!1133718 () Bool)

(declare-fun lt!503621 () Unit!37078)

(assert (=> b!1133718 (= e!645320 lt!503621)))

(assert (=> b!1133718 (= lt!503621 call!48881)))

(assert (=> b!1133718 call!48886))

(declare-fun bm!48881 () Bool)

(declare-fun call!48883 () ListLongMap!16005)

(declare-fun +!3482 (ListLongMap!16005 tuple2!18028) ListLongMap!16005)

(assert (=> bm!48881 (= call!48883 (+!3482 (ite c!110818 lt!503610 lt!503620) (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133719 () Bool)

(declare-fun c!110815 () Bool)

(assert (=> b!1133719 (= c!110815 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503614))))

(assert (=> b!1133719 (= e!645316 e!645320)))

(declare-fun b!1133720 () Bool)

(declare-fun e!645326 () Bool)

(assert (=> b!1133720 (= e!645326 tp_is_empty!28471)))

(declare-fun b!1133721 () Bool)

(declare-fun res!756795 () Bool)

(assert (=> b!1133721 (=> (not res!756795) (not e!645328))))

(assert (=> b!1133721 (= res!756795 (= (select (arr!35568 _keys!1208) i!673) k0!934))))

(declare-fun bm!48882 () Bool)

(declare-fun call!48882 () ListLongMap!16005)

(assert (=> bm!48882 (= call!48882 call!48883)))

(declare-fun b!1133722 () Bool)

(declare-fun -!1174 (ListLongMap!16005 (_ BitVec 64)) ListLongMap!16005)

(assert (=> b!1133722 (= e!645322 (= call!48885 (-!1174 call!48879 k0!934)))))

(declare-fun b!1133723 () Bool)

(declare-fun e!645317 () Bool)

(assert (=> b!1133723 (= e!645317 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 _keys!1208)) (bvslt (size!36105 _keys!1208) #b01111111111111111111111111111111)))))

(assert (=> b!1133723 e!645324))

(declare-fun c!110819 () Bool)

(assert (=> b!1133723 (= c!110819 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503611 () Unit!37078)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!318 (array!73845 array!73847 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 64) (_ BitVec 32) Int) Unit!37078)

(assert (=> b!1133723 (= lt!503611 (lemmaListMapContainsThenArrayContainsFrom!318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503619 () Unit!37078)

(assert (=> b!1133723 (= lt!503619 e!645319)))

(assert (=> b!1133723 (= c!110818 (and (not lt!503614) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133723 (= lt!503614 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1133724 () Bool)

(declare-fun res!756801 () Bool)

(assert (=> b!1133724 (=> (not res!756801) (not e!645325))))

(assert (=> b!1133724 (= res!756801 (arrayNoDuplicates!0 lt!503618 #b00000000000000000000000000000000 Nil!24801))))

(declare-fun mapNonEmpty!44528 () Bool)

(declare-fun tp!84530 () Bool)

(declare-fun e!645327 () Bool)

(assert (=> mapNonEmpty!44528 (= mapRes!44528 (and tp!84530 e!645327))))

(declare-fun mapValue!44528 () ValueCell!13526)

(declare-fun mapKey!44528 () (_ BitVec 32))

(declare-fun mapRest!44528 () (Array (_ BitVec 32) ValueCell!13526))

(assert (=> mapNonEmpty!44528 (= (arr!35569 _values!996) (store mapRest!44528 mapKey!44528 mapValue!44528))))

(declare-fun b!1133725 () Bool)

(assert (=> b!1133725 (= e!645328 e!645325)))

(declare-fun res!756804 () Bool)

(assert (=> b!1133725 (=> (not res!756804) (not e!645325))))

(assert (=> b!1133725 (= res!756804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503618 mask!1564))))

(assert (=> b!1133725 (= lt!503618 (array!73846 (store (arr!35568 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36105 _keys!1208)))))

(declare-fun b!1133726 () Bool)

(declare-fun lt!503609 () Unit!37078)

(assert (=> b!1133726 (= e!645319 lt!503609)))

(declare-fun lt!503613 () Unit!37078)

(assert (=> b!1133726 (= lt!503613 (addStillContains!707 lt!503620 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1133726 (= lt!503610 (+!3482 lt!503620 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1133726 call!48880))

(assert (=> b!1133726 (= lt!503609 call!48884)))

(declare-fun contains!6553 (ListLongMap!16005 (_ BitVec 64)) Bool)

(assert (=> b!1133726 (contains!6553 call!48883 k0!934)))

(declare-fun b!1133727 () Bool)

(declare-fun res!756808 () Bool)

(assert (=> b!1133727 (=> (not res!756808) (not e!645328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133727 (= res!756808 (validMask!0 mask!1564))))

(declare-fun b!1133728 () Bool)

(declare-fun res!756802 () Bool)

(assert (=> b!1133728 (=> (not res!756802) (not e!645328))))

(assert (=> b!1133728 (= res!756802 (and (= (size!36106 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36105 _keys!1208) (size!36106 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1133729 () Bool)

(assert (=> b!1133729 (= e!645327 tp_is_empty!28471)))

(declare-fun b!1133730 () Bool)

(declare-fun e!645321 () Bool)

(assert (=> b!1133730 (= e!645321 e!645317)))

(declare-fun res!756799 () Bool)

(assert (=> b!1133730 (=> res!756799 e!645317)))

(assert (=> b!1133730 (= res!756799 (not (contains!6553 lt!503620 k0!934)))))

(assert (=> b!1133730 (= lt!503620 (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133731 () Bool)

(assert (=> b!1133731 (= e!645323 (and e!645326 mapRes!44528))))

(declare-fun condMapEmpty!44528 () Bool)

(declare-fun mapDefault!44528 () ValueCell!13526)

(assert (=> b!1133731 (= condMapEmpty!44528 (= (arr!35569 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13526)) mapDefault!44528)))))

(declare-fun b!1133732 () Bool)

(assert (=> b!1133732 (= e!645315 e!645321)))

(declare-fun res!756798 () Bool)

(assert (=> b!1133732 (=> res!756798 e!645321)))

(assert (=> b!1133732 (= res!756798 (not (= (select (arr!35568 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1133732 e!645322))

(declare-fun c!110816 () Bool)

(assert (=> b!1133732 (= c!110816 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503617 () Unit!37078)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!434 (array!73845 array!73847 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37078)

(assert (=> b!1133732 (= lt!503617 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48883 () Bool)

(assert (=> bm!48883 (= call!48880 (contains!6553 (ite c!110818 lt!503610 call!48882) k0!934))))

(assert (= (and start!98542 res!756807) b!1133727))

(assert (= (and b!1133727 res!756808) b!1133728))

(assert (= (and b!1133728 res!756802) b!1133712))

(assert (= (and b!1133712 res!756800) b!1133709))

(assert (= (and b!1133709 res!756797) b!1133708))

(assert (= (and b!1133708 res!756803) b!1133714))

(assert (= (and b!1133714 res!756805) b!1133721))

(assert (= (and b!1133721 res!756795) b!1133725))

(assert (= (and b!1133725 res!756804) b!1133724))

(assert (= (and b!1133724 res!756801) b!1133706))

(assert (= (and b!1133706 (not res!756796)) b!1133715))

(assert (= (and b!1133715 (not res!756806)) b!1133732))

(assert (= (and b!1133732 c!110816) b!1133722))

(assert (= (and b!1133732 (not c!110816)) b!1133707))

(assert (= (or b!1133722 b!1133707) bm!48880))

(assert (= (or b!1133722 b!1133707) bm!48878))

(assert (= (and b!1133732 (not res!756798)) b!1133730))

(assert (= (and b!1133730 (not res!756799)) b!1133723))

(assert (= (and b!1133723 c!110818) b!1133726))

(assert (= (and b!1133723 (not c!110818)) b!1133710))

(assert (= (and b!1133710 c!110817) b!1133717))

(assert (= (and b!1133710 (not c!110817)) b!1133719))

(assert (= (and b!1133719 c!110815) b!1133718))

(assert (= (and b!1133719 (not c!110815)) b!1133713))

(assert (= (or b!1133717 b!1133718) bm!48876))

(assert (= (or b!1133717 b!1133718) bm!48882))

(assert (= (or b!1133717 b!1133718) bm!48879))

(assert (= (or b!1133726 bm!48879) bm!48883))

(assert (= (or b!1133726 bm!48876) bm!48877))

(assert (= (or b!1133726 bm!48882) bm!48881))

(assert (= (and b!1133723 c!110819) b!1133711))

(assert (= (and b!1133723 (not c!110819)) b!1133716))

(assert (= (and b!1133731 condMapEmpty!44528) mapIsEmpty!44528))

(assert (= (and b!1133731 (not condMapEmpty!44528)) mapNonEmpty!44528))

(get-info :version)

(assert (= (and mapNonEmpty!44528 ((_ is ValueCellFull!13526) mapValue!44528)) b!1133729))

(assert (= (and b!1133731 ((_ is ValueCellFull!13526) mapDefault!44528)) b!1133720))

(assert (= start!98542 b!1133731))

(declare-fun b_lambda!19003 () Bool)

(assert (=> (not b_lambda!19003) (not b!1133715)))

(declare-fun t!35727 () Bool)

(declare-fun tb!8745 () Bool)

(assert (=> (and start!98542 (= defaultEntry!1004 defaultEntry!1004) t!35727) tb!8745))

(declare-fun result!18061 () Bool)

(assert (=> tb!8745 (= result!18061 tp_is_empty!28471)))

(assert (=> b!1133715 t!35727))

(declare-fun b_and!38717 () Bool)

(assert (= b_and!38715 (and (=> t!35727 result!18061) b_and!38717)))

(declare-fun m!1047247 () Bool)

(assert (=> b!1133715 m!1047247))

(declare-fun m!1047249 () Bool)

(assert (=> b!1133715 m!1047249))

(declare-fun m!1047251 () Bool)

(assert (=> b!1133715 m!1047251))

(declare-fun m!1047253 () Bool)

(assert (=> b!1133715 m!1047253))

(declare-fun m!1047255 () Bool)

(assert (=> b!1133727 m!1047255))

(declare-fun m!1047257 () Bool)

(assert (=> bm!48881 m!1047257))

(declare-fun m!1047259 () Bool)

(assert (=> b!1133711 m!1047259))

(declare-fun m!1047261 () Bool)

(assert (=> b!1133730 m!1047261))

(declare-fun m!1047263 () Bool)

(assert (=> b!1133730 m!1047263))

(declare-fun m!1047265 () Bool)

(assert (=> b!1133721 m!1047265))

(declare-fun m!1047267 () Bool)

(assert (=> mapNonEmpty!44528 m!1047267))

(declare-fun m!1047269 () Bool)

(assert (=> b!1133714 m!1047269))

(declare-fun m!1047271 () Bool)

(assert (=> b!1133726 m!1047271))

(declare-fun m!1047273 () Bool)

(assert (=> b!1133726 m!1047273))

(declare-fun m!1047275 () Bool)

(assert (=> b!1133726 m!1047275))

(declare-fun m!1047277 () Bool)

(assert (=> bm!48883 m!1047277))

(declare-fun m!1047279 () Bool)

(assert (=> b!1133706 m!1047279))

(declare-fun m!1047281 () Bool)

(assert (=> b!1133706 m!1047281))

(declare-fun m!1047283 () Bool)

(assert (=> b!1133725 m!1047283))

(declare-fun m!1047285 () Bool)

(assert (=> b!1133725 m!1047285))

(declare-fun m!1047287 () Bool)

(assert (=> b!1133724 m!1047287))

(declare-fun m!1047289 () Bool)

(assert (=> bm!48880 m!1047289))

(declare-fun m!1047291 () Bool)

(assert (=> b!1133722 m!1047291))

(declare-fun m!1047293 () Bool)

(assert (=> b!1133723 m!1047293))

(declare-fun m!1047295 () Bool)

(assert (=> b!1133712 m!1047295))

(declare-fun m!1047297 () Bool)

(assert (=> bm!48877 m!1047297))

(declare-fun m!1047299 () Bool)

(assert (=> b!1133732 m!1047299))

(declare-fun m!1047301 () Bool)

(assert (=> b!1133732 m!1047301))

(declare-fun m!1047303 () Bool)

(assert (=> b!1133709 m!1047303))

(declare-fun m!1047305 () Bool)

(assert (=> start!98542 m!1047305))

(declare-fun m!1047307 () Bool)

(assert (=> start!98542 m!1047307))

(assert (=> bm!48878 m!1047263))

(check-sat (not b!1133730) (not b!1133732) (not b_next!23941) (not bm!48878) (not b!1133706) (not bm!48880) (not b!1133712) (not b!1133714) tp_is_empty!28471 (not b_lambda!19003) (not mapNonEmpty!44528) (not b!1133727) (not b!1133725) b_and!38717 (not bm!48877) (not b!1133709) (not b!1133726) (not b!1133711) (not b!1133723) (not bm!48883) (not b!1133722) (not start!98542) (not b!1133724) (not bm!48881) (not b!1133715))
(check-sat b_and!38717 (not b_next!23941))
(get-model)

(declare-fun b_lambda!19009 () Bool)

(assert (= b_lambda!19003 (or (and start!98542 b_free!23941) b_lambda!19009)))

(check-sat (not b!1133730) (not b!1133732) (not b_next!23941) (not bm!48878) (not b!1133706) (not bm!48880) (not b!1133712) (not b!1133714) tp_is_empty!28471 (not mapNonEmpty!44528) (not b!1133727) (not b!1133725) (not b_lambda!19009) b_and!38717 (not bm!48877) (not b!1133709) (not b!1133726) (not b!1133711) (not b!1133723) (not bm!48883) (not b!1133722) (not start!98542) (not b!1133724) (not bm!48881) (not b!1133715))
(check-sat b_and!38717 (not b_next!23941))
(get-model)

(declare-fun d!132017 () Bool)

(declare-fun res!756897 () Bool)

(declare-fun e!645424 () Bool)

(assert (=> d!132017 (=> res!756897 e!645424)))

(assert (=> d!132017 (= res!756897 (= (select (arr!35568 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132017 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!645424)))

(declare-fun b!1133905 () Bool)

(declare-fun e!645425 () Bool)

(assert (=> b!1133905 (= e!645424 e!645425)))

(declare-fun res!756898 () Bool)

(assert (=> b!1133905 (=> (not res!756898) (not e!645425))))

(assert (=> b!1133905 (= res!756898 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36105 _keys!1208)))))

(declare-fun b!1133906 () Bool)

(assert (=> b!1133906 (= e!645425 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132017 (not res!756897)) b!1133905))

(assert (= (and b!1133905 res!756898) b!1133906))

(declare-fun m!1047433 () Bool)

(assert (=> d!132017 m!1047433))

(declare-fun m!1047435 () Bool)

(assert (=> b!1133906 m!1047435))

(assert (=> b!1133706 d!132017))

(declare-fun d!132019 () Bool)

(assert (=> d!132019 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503715 () Unit!37078)

(declare-fun choose!13 (array!73845 (_ BitVec 64) (_ BitVec 32)) Unit!37078)

(assert (=> d!132019 (= lt!503715 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132019 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132019 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!503715)))

(declare-fun bs!33001 () Bool)

(assert (= bs!33001 d!132019))

(assert (=> bs!33001 m!1047279))

(declare-fun m!1047437 () Bool)

(assert (=> bs!33001 m!1047437))

(assert (=> b!1133706 d!132019))

(declare-fun d!132021 () Bool)

(declare-fun e!645430 () Bool)

(assert (=> d!132021 e!645430))

(declare-fun res!756901 () Bool)

(assert (=> d!132021 (=> res!756901 e!645430)))

(declare-fun lt!503727 () Bool)

(assert (=> d!132021 (= res!756901 (not lt!503727))))

(declare-fun lt!503726 () Bool)

(assert (=> d!132021 (= lt!503727 lt!503726)))

(declare-fun lt!503725 () Unit!37078)

(declare-fun e!645431 () Unit!37078)

(assert (=> d!132021 (= lt!503725 e!645431)))

(declare-fun c!110852 () Bool)

(assert (=> d!132021 (= c!110852 lt!503726)))

(declare-fun containsKey!588 (List!24803 (_ BitVec 64)) Bool)

(assert (=> d!132021 (= lt!503726 (containsKey!588 (toList!8018 lt!503620) k0!934))))

(assert (=> d!132021 (= (contains!6553 lt!503620 k0!934) lt!503727)))

(declare-fun b!1133913 () Bool)

(declare-fun lt!503724 () Unit!37078)

(assert (=> b!1133913 (= e!645431 lt!503724)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!416 (List!24803 (_ BitVec 64)) Unit!37078)

(assert (=> b!1133913 (= lt!503724 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8018 lt!503620) k0!934))))

(declare-datatypes ((Option!676 0))(
  ( (Some!675 (v!16927 V!43089)) (None!674) )
))
(declare-fun isDefined!454 (Option!676) Bool)

(declare-fun getValueByKey!625 (List!24803 (_ BitVec 64)) Option!676)

(assert (=> b!1133913 (isDefined!454 (getValueByKey!625 (toList!8018 lt!503620) k0!934))))

(declare-fun b!1133914 () Bool)

(declare-fun Unit!37087 () Unit!37078)

(assert (=> b!1133914 (= e!645431 Unit!37087)))

(declare-fun b!1133915 () Bool)

(assert (=> b!1133915 (= e!645430 (isDefined!454 (getValueByKey!625 (toList!8018 lt!503620) k0!934)))))

(assert (= (and d!132021 c!110852) b!1133913))

(assert (= (and d!132021 (not c!110852)) b!1133914))

(assert (= (and d!132021 (not res!756901)) b!1133915))

(declare-fun m!1047439 () Bool)

(assert (=> d!132021 m!1047439))

(declare-fun m!1047441 () Bool)

(assert (=> b!1133913 m!1047441))

(declare-fun m!1047443 () Bool)

(assert (=> b!1133913 m!1047443))

(assert (=> b!1133913 m!1047443))

(declare-fun m!1047445 () Bool)

(assert (=> b!1133913 m!1047445))

(assert (=> b!1133915 m!1047443))

(assert (=> b!1133915 m!1047443))

(assert (=> b!1133915 m!1047445))

(assert (=> b!1133730 d!132021))

(declare-fun b!1133940 () Bool)

(declare-fun e!645448 () Bool)

(declare-fun e!645451 () Bool)

(assert (=> b!1133940 (= e!645448 e!645451)))

(assert (=> b!1133940 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 _keys!1208)))))

(declare-fun res!756912 () Bool)

(declare-fun lt!503746 () ListLongMap!16005)

(assert (=> b!1133940 (= res!756912 (contains!6553 lt!503746 (select (arr!35568 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133940 (=> (not res!756912) (not e!645451))))

(declare-fun b!1133941 () Bool)

(declare-fun e!645449 () ListLongMap!16005)

(assert (=> b!1133941 (= e!645449 (ListLongMap!16006 Nil!24800))))

(declare-fun b!1133942 () Bool)

(declare-fun e!645447 () ListLongMap!16005)

(assert (=> b!1133942 (= e!645449 e!645447)))

(declare-fun c!110864 () Bool)

(assert (=> b!1133942 (= c!110864 (validKeyInArray!0 (select (arr!35568 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1133943 () Bool)

(declare-fun e!645450 () Bool)

(assert (=> b!1133943 (= e!645450 (validKeyInArray!0 (select (arr!35568 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133943 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1133944 () Bool)

(declare-fun call!48937 () ListLongMap!16005)

(assert (=> b!1133944 (= e!645447 call!48937)))

(declare-fun b!1133945 () Bool)

(declare-fun e!645446 () Bool)

(assert (=> b!1133945 (= e!645446 (= lt!503746 (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133946 () Bool)

(declare-fun res!756910 () Bool)

(declare-fun e!645452 () Bool)

(assert (=> b!1133946 (=> (not res!756910) (not e!645452))))

(assert (=> b!1133946 (= res!756910 (not (contains!6553 lt!503746 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!132023 () Bool)

(assert (=> d!132023 e!645452))

(declare-fun res!756913 () Bool)

(assert (=> d!132023 (=> (not res!756913) (not e!645452))))

(assert (=> d!132023 (= res!756913 (not (contains!6553 lt!503746 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132023 (= lt!503746 e!645449)))

(declare-fun c!110863 () Bool)

(assert (=> d!132023 (= c!110863 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 _keys!1208)))))

(assert (=> d!132023 (validMask!0 mask!1564)))

(assert (=> d!132023 (= (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503746)))

(declare-fun b!1133947 () Bool)

(assert (=> b!1133947 (= e!645452 e!645448)))

(declare-fun c!110861 () Bool)

(assert (=> b!1133947 (= c!110861 e!645450)))

(declare-fun res!756911 () Bool)

(assert (=> b!1133947 (=> (not res!756911) (not e!645450))))

(assert (=> b!1133947 (= res!756911 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 _keys!1208)))))

(declare-fun b!1133948 () Bool)

(declare-fun lt!503748 () Unit!37078)

(declare-fun lt!503743 () Unit!37078)

(assert (=> b!1133948 (= lt!503748 lt!503743)))

(declare-fun lt!503745 () V!43089)

(declare-fun lt!503742 () (_ BitVec 64))

(declare-fun lt!503744 () (_ BitVec 64))

(declare-fun lt!503747 () ListLongMap!16005)

(assert (=> b!1133948 (not (contains!6553 (+!3482 lt!503747 (tuple2!18029 lt!503742 lt!503745)) lt!503744))))

(declare-fun addStillNotContains!286 (ListLongMap!16005 (_ BitVec 64) V!43089 (_ BitVec 64)) Unit!37078)

(assert (=> b!1133948 (= lt!503743 (addStillNotContains!286 lt!503747 lt!503742 lt!503745 lt!503744))))

(assert (=> b!1133948 (= lt!503744 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!18108 (ValueCell!13526 V!43089) V!43089)

(assert (=> b!1133948 (= lt!503745 (get!18108 (select (arr!35569 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133948 (= lt!503742 (select (arr!35568 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1133948 (= lt!503747 call!48937)))

(assert (=> b!1133948 (= e!645447 (+!3482 call!48937 (tuple2!18029 (select (arr!35568 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18108 (select (arr!35569 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133949 () Bool)

(declare-fun isEmpty!980 (ListLongMap!16005) Bool)

(assert (=> b!1133949 (= e!645446 (isEmpty!980 lt!503746))))

(declare-fun b!1133950 () Bool)

(assert (=> b!1133950 (= e!645448 e!645446)))

(declare-fun c!110862 () Bool)

(assert (=> b!1133950 (= c!110862 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 _keys!1208)))))

(declare-fun bm!48934 () Bool)

(assert (=> bm!48934 (= call!48937 (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133951 () Bool)

(assert (=> b!1133951 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 _keys!1208)))))

(assert (=> b!1133951 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36106 _values!996)))))

(declare-fun apply!965 (ListLongMap!16005 (_ BitVec 64)) V!43089)

(assert (=> b!1133951 (= e!645451 (= (apply!965 lt!503746 (select (arr!35568 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18108 (select (arr!35569 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132023 c!110863) b!1133941))

(assert (= (and d!132023 (not c!110863)) b!1133942))

(assert (= (and b!1133942 c!110864) b!1133948))

(assert (= (and b!1133942 (not c!110864)) b!1133944))

(assert (= (or b!1133948 b!1133944) bm!48934))

(assert (= (and d!132023 res!756913) b!1133946))

(assert (= (and b!1133946 res!756910) b!1133947))

(assert (= (and b!1133947 res!756911) b!1133943))

(assert (= (and b!1133947 c!110861) b!1133940))

(assert (= (and b!1133947 (not c!110861)) b!1133950))

(assert (= (and b!1133940 res!756912) b!1133951))

(assert (= (and b!1133950 c!110862) b!1133945))

(assert (= (and b!1133950 (not c!110862)) b!1133949))

(declare-fun b_lambda!19011 () Bool)

(assert (=> (not b_lambda!19011) (not b!1133948)))

(assert (=> b!1133948 t!35727))

(declare-fun b_and!38727 () Bool)

(assert (= b_and!38717 (and (=> t!35727 result!18061) b_and!38727)))

(declare-fun b_lambda!19013 () Bool)

(assert (=> (not b_lambda!19013) (not b!1133951)))

(assert (=> b!1133951 t!35727))

(declare-fun b_and!38729 () Bool)

(assert (= b_and!38727 (and (=> t!35727 result!18061) b_and!38729)))

(declare-fun m!1047447 () Bool)

(assert (=> b!1133945 m!1047447))

(declare-fun m!1047449 () Bool)

(assert (=> b!1133948 m!1047449))

(declare-fun m!1047451 () Bool)

(assert (=> b!1133948 m!1047451))

(declare-fun m!1047453 () Bool)

(assert (=> b!1133948 m!1047453))

(assert (=> b!1133948 m!1047451))

(declare-fun m!1047455 () Bool)

(assert (=> b!1133948 m!1047455))

(assert (=> b!1133948 m!1047249))

(declare-fun m!1047457 () Bool)

(assert (=> b!1133948 m!1047457))

(declare-fun m!1047459 () Bool)

(assert (=> b!1133948 m!1047459))

(assert (=> b!1133948 m!1047459))

(assert (=> b!1133948 m!1047249))

(declare-fun m!1047461 () Bool)

(assert (=> b!1133948 m!1047461))

(assert (=> b!1133942 m!1047449))

(assert (=> b!1133942 m!1047449))

(declare-fun m!1047463 () Bool)

(assert (=> b!1133942 m!1047463))

(assert (=> b!1133951 m!1047449))

(assert (=> b!1133951 m!1047249))

(assert (=> b!1133951 m!1047459))

(assert (=> b!1133951 m!1047449))

(declare-fun m!1047465 () Bool)

(assert (=> b!1133951 m!1047465))

(assert (=> b!1133951 m!1047459))

(assert (=> b!1133951 m!1047249))

(assert (=> b!1133951 m!1047461))

(declare-fun m!1047467 () Bool)

(assert (=> b!1133949 m!1047467))

(declare-fun m!1047469 () Bool)

(assert (=> d!132023 m!1047469))

(assert (=> d!132023 m!1047255))

(assert (=> b!1133943 m!1047449))

(assert (=> b!1133943 m!1047449))

(assert (=> b!1133943 m!1047463))

(assert (=> bm!48934 m!1047447))

(assert (=> b!1133940 m!1047449))

(assert (=> b!1133940 m!1047449))

(declare-fun m!1047471 () Bool)

(assert (=> b!1133940 m!1047471))

(declare-fun m!1047473 () Bool)

(assert (=> b!1133946 m!1047473))

(assert (=> b!1133730 d!132023))

(assert (=> bm!48878 d!132023))

(declare-fun b!1133958 () Bool)

(declare-fun e!645458 () Bool)

(declare-fun call!48943 () ListLongMap!16005)

(declare-fun call!48942 () ListLongMap!16005)

(assert (=> b!1133958 (= e!645458 (= call!48943 call!48942))))

(assert (=> b!1133958 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36106 _values!996)))))

(declare-fun b!1133959 () Bool)

(assert (=> b!1133959 (= e!645458 (= call!48943 (-!1174 call!48942 k0!934)))))

(assert (=> b!1133959 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36106 _values!996)))))

(declare-fun d!132025 () Bool)

(declare-fun e!645457 () Bool)

(assert (=> d!132025 e!645457))

(declare-fun res!756916 () Bool)

(assert (=> d!132025 (=> (not res!756916) (not e!645457))))

(assert (=> d!132025 (= res!756916 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36105 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36105 _keys!1208))))))))

(declare-fun lt!503751 () Unit!37078)

(declare-fun choose!1785 (array!73845 array!73847 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37078)

(assert (=> d!132025 (= lt!503751 (choose!1785 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132025 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 _keys!1208)))))

(assert (=> d!132025 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!434 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503751)))

(declare-fun bm!48939 () Bool)

(assert (=> bm!48939 (= call!48943 (getCurrentListMapNoExtraKeys!4534 (array!73846 (store (arr!35568 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36105 _keys!1208)) (array!73848 (store (arr!35569 _values!996) i!673 (ValueCellFull!13526 (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36106 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48940 () Bool)

(assert (=> bm!48940 (= call!48942 (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133960 () Bool)

(assert (=> b!1133960 (= e!645457 e!645458)))

(declare-fun c!110867 () Bool)

(assert (=> b!1133960 (= c!110867 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!132025 res!756916) b!1133960))

(assert (= (and b!1133960 c!110867) b!1133959))

(assert (= (and b!1133960 (not c!110867)) b!1133958))

(assert (= (or b!1133959 b!1133958) bm!48940))

(assert (= (or b!1133959 b!1133958) bm!48939))

(declare-fun b_lambda!19015 () Bool)

(assert (=> (not b_lambda!19015) (not bm!48939)))

(assert (=> bm!48939 t!35727))

(declare-fun b_and!38731 () Bool)

(assert (= b_and!38729 (and (=> t!35727 result!18061) b_and!38731)))

(declare-fun m!1047475 () Bool)

(assert (=> b!1133959 m!1047475))

(declare-fun m!1047477 () Bool)

(assert (=> d!132025 m!1047477))

(assert (=> bm!48939 m!1047285))

(assert (=> bm!48939 m!1047249))

(assert (=> bm!48939 m!1047251))

(declare-fun m!1047479 () Bool)

(assert (=> bm!48939 m!1047479))

(assert (=> bm!48940 m!1047263))

(assert (=> b!1133732 d!132025))

(declare-fun d!132027 () Bool)

(declare-fun lt!503754 () ListLongMap!16005)

(assert (=> d!132027 (not (contains!6553 lt!503754 k0!934))))

(declare-fun removeStrictlySorted!89 (List!24803 (_ BitVec 64)) List!24803)

(assert (=> d!132027 (= lt!503754 (ListLongMap!16006 (removeStrictlySorted!89 (toList!8018 call!48879) k0!934)))))

(assert (=> d!132027 (= (-!1174 call!48879 k0!934) lt!503754)))

(declare-fun bs!33002 () Bool)

(assert (= bs!33002 d!132027))

(declare-fun m!1047481 () Bool)

(assert (=> bs!33002 m!1047481))

(declare-fun m!1047483 () Bool)

(assert (=> bs!33002 m!1047483))

(assert (=> b!1133722 d!132027))

(declare-fun d!132029 () Bool)

(declare-fun e!645461 () Bool)

(assert (=> d!132029 e!645461))

(declare-fun c!110870 () Bool)

(assert (=> d!132029 (= c!110870 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503757 () Unit!37078)

(declare-fun choose!1786 (array!73845 array!73847 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 64) (_ BitVec 32) Int) Unit!37078)

(assert (=> d!132029 (= lt!503757 (choose!1786 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132029 (validMask!0 mask!1564)))

(assert (=> d!132029 (= (lemmaListMapContainsThenArrayContainsFrom!318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503757)))

(declare-fun b!1133965 () Bool)

(assert (=> b!1133965 (= e!645461 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133966 () Bool)

(assert (=> b!1133966 (= e!645461 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!132029 c!110870) b!1133965))

(assert (= (and d!132029 (not c!110870)) b!1133966))

(declare-fun m!1047485 () Bool)

(assert (=> d!132029 m!1047485))

(assert (=> d!132029 m!1047255))

(assert (=> b!1133965 m!1047259))

(assert (=> b!1133723 d!132029))

(declare-fun d!132031 () Bool)

(assert (=> d!132031 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1133714 d!132031))

(declare-fun b!1133967 () Bool)

(declare-fun e!645464 () Bool)

(declare-fun e!645467 () Bool)

(assert (=> b!1133967 (= e!645464 e!645467)))

(assert (=> b!1133967 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 lt!503618)))))

(declare-fun lt!503762 () ListLongMap!16005)

(declare-fun res!756919 () Bool)

(assert (=> b!1133967 (= res!756919 (contains!6553 lt!503762 (select (arr!35568 lt!503618) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133967 (=> (not res!756919) (not e!645467))))

(declare-fun b!1133968 () Bool)

(declare-fun e!645465 () ListLongMap!16005)

(assert (=> b!1133968 (= e!645465 (ListLongMap!16006 Nil!24800))))

(declare-fun b!1133969 () Bool)

(declare-fun e!645463 () ListLongMap!16005)

(assert (=> b!1133969 (= e!645465 e!645463)))

(declare-fun c!110874 () Bool)

(assert (=> b!1133969 (= c!110874 (validKeyInArray!0 (select (arr!35568 lt!503618) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1133970 () Bool)

(declare-fun e!645466 () Bool)

(assert (=> b!1133970 (= e!645466 (validKeyInArray!0 (select (arr!35568 lt!503618) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1133970 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1133971 () Bool)

(declare-fun call!48944 () ListLongMap!16005)

(assert (=> b!1133971 (= e!645463 call!48944)))

(declare-fun b!1133972 () Bool)

(declare-fun e!645462 () Bool)

(assert (=> b!1133972 (= e!645462 (= lt!503762 (getCurrentListMapNoExtraKeys!4534 lt!503618 lt!503612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133973 () Bool)

(declare-fun res!756917 () Bool)

(declare-fun e!645468 () Bool)

(assert (=> b!1133973 (=> (not res!756917) (not e!645468))))

(assert (=> b!1133973 (= res!756917 (not (contains!6553 lt!503762 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!132033 () Bool)

(assert (=> d!132033 e!645468))

(declare-fun res!756920 () Bool)

(assert (=> d!132033 (=> (not res!756920) (not e!645468))))

(assert (=> d!132033 (= res!756920 (not (contains!6553 lt!503762 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132033 (= lt!503762 e!645465)))

(declare-fun c!110873 () Bool)

(assert (=> d!132033 (= c!110873 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 lt!503618)))))

(assert (=> d!132033 (validMask!0 mask!1564)))

(assert (=> d!132033 (= (getCurrentListMapNoExtraKeys!4534 lt!503618 lt!503612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!503762)))

(declare-fun b!1133974 () Bool)

(assert (=> b!1133974 (= e!645468 e!645464)))

(declare-fun c!110871 () Bool)

(assert (=> b!1133974 (= c!110871 e!645466)))

(declare-fun res!756918 () Bool)

(assert (=> b!1133974 (=> (not res!756918) (not e!645466))))

(assert (=> b!1133974 (= res!756918 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 lt!503618)))))

(declare-fun b!1133975 () Bool)

(declare-fun lt!503764 () Unit!37078)

(declare-fun lt!503759 () Unit!37078)

(assert (=> b!1133975 (= lt!503764 lt!503759)))

(declare-fun lt!503758 () (_ BitVec 64))

(declare-fun lt!503760 () (_ BitVec 64))

(declare-fun lt!503763 () ListLongMap!16005)

(declare-fun lt!503761 () V!43089)

(assert (=> b!1133975 (not (contains!6553 (+!3482 lt!503763 (tuple2!18029 lt!503758 lt!503761)) lt!503760))))

(assert (=> b!1133975 (= lt!503759 (addStillNotContains!286 lt!503763 lt!503758 lt!503761 lt!503760))))

(assert (=> b!1133975 (= lt!503760 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133975 (= lt!503761 (get!18108 (select (arr!35569 lt!503612) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133975 (= lt!503758 (select (arr!35568 lt!503618) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1133975 (= lt!503763 call!48944)))

(assert (=> b!1133975 (= e!645463 (+!3482 call!48944 (tuple2!18029 (select (arr!35568 lt!503618) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18108 (select (arr!35569 lt!503612) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133976 () Bool)

(assert (=> b!1133976 (= e!645462 (isEmpty!980 lt!503762))))

(declare-fun b!1133977 () Bool)

(assert (=> b!1133977 (= e!645464 e!645462)))

(declare-fun c!110872 () Bool)

(assert (=> b!1133977 (= c!110872 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 lt!503618)))))

(declare-fun bm!48941 () Bool)

(assert (=> bm!48941 (= call!48944 (getCurrentListMapNoExtraKeys!4534 lt!503618 lt!503612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133978 () Bool)

(assert (=> b!1133978 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36105 lt!503618)))))

(assert (=> b!1133978 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36106 lt!503612)))))

(assert (=> b!1133978 (= e!645467 (= (apply!965 lt!503762 (select (arr!35568 lt!503618) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18108 (select (arr!35569 lt!503612) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132033 c!110873) b!1133968))

(assert (= (and d!132033 (not c!110873)) b!1133969))

(assert (= (and b!1133969 c!110874) b!1133975))

(assert (= (and b!1133969 (not c!110874)) b!1133971))

(assert (= (or b!1133975 b!1133971) bm!48941))

(assert (= (and d!132033 res!756920) b!1133973))

(assert (= (and b!1133973 res!756917) b!1133974))

(assert (= (and b!1133974 res!756918) b!1133970))

(assert (= (and b!1133974 c!110871) b!1133967))

(assert (= (and b!1133974 (not c!110871)) b!1133977))

(assert (= (and b!1133967 res!756919) b!1133978))

(assert (= (and b!1133977 c!110872) b!1133972))

(assert (= (and b!1133977 (not c!110872)) b!1133976))

(declare-fun b_lambda!19017 () Bool)

(assert (=> (not b_lambda!19017) (not b!1133975)))

(assert (=> b!1133975 t!35727))

(declare-fun b_and!38733 () Bool)

(assert (= b_and!38731 (and (=> t!35727 result!18061) b_and!38733)))

(declare-fun b_lambda!19019 () Bool)

(assert (=> (not b_lambda!19019) (not b!1133978)))

(assert (=> b!1133978 t!35727))

(declare-fun b_and!38735 () Bool)

(assert (= b_and!38733 (and (=> t!35727 result!18061) b_and!38735)))

(declare-fun m!1047487 () Bool)

(assert (=> b!1133972 m!1047487))

(declare-fun m!1047489 () Bool)

(assert (=> b!1133975 m!1047489))

(declare-fun m!1047491 () Bool)

(assert (=> b!1133975 m!1047491))

(declare-fun m!1047493 () Bool)

(assert (=> b!1133975 m!1047493))

(assert (=> b!1133975 m!1047491))

(declare-fun m!1047495 () Bool)

(assert (=> b!1133975 m!1047495))

(assert (=> b!1133975 m!1047249))

(declare-fun m!1047497 () Bool)

(assert (=> b!1133975 m!1047497))

(declare-fun m!1047499 () Bool)

(assert (=> b!1133975 m!1047499))

(assert (=> b!1133975 m!1047499))

(assert (=> b!1133975 m!1047249))

(declare-fun m!1047501 () Bool)

(assert (=> b!1133975 m!1047501))

(assert (=> b!1133969 m!1047489))

(assert (=> b!1133969 m!1047489))

(declare-fun m!1047503 () Bool)

(assert (=> b!1133969 m!1047503))

(assert (=> b!1133978 m!1047489))

(assert (=> b!1133978 m!1047249))

(assert (=> b!1133978 m!1047499))

(assert (=> b!1133978 m!1047489))

(declare-fun m!1047505 () Bool)

(assert (=> b!1133978 m!1047505))

(assert (=> b!1133978 m!1047499))

(assert (=> b!1133978 m!1047249))

(assert (=> b!1133978 m!1047501))

(declare-fun m!1047507 () Bool)

(assert (=> b!1133976 m!1047507))

(declare-fun m!1047509 () Bool)

(assert (=> d!132033 m!1047509))

(assert (=> d!132033 m!1047255))

(assert (=> b!1133970 m!1047489))

(assert (=> b!1133970 m!1047489))

(assert (=> b!1133970 m!1047503))

(assert (=> bm!48941 m!1047487))

(assert (=> b!1133967 m!1047489))

(assert (=> b!1133967 m!1047489))

(declare-fun m!1047511 () Bool)

(assert (=> b!1133967 m!1047511))

(declare-fun m!1047513 () Bool)

(assert (=> b!1133973 m!1047513))

(assert (=> bm!48880 d!132033))

(declare-fun d!132035 () Bool)

(assert (=> d!132035 (= (array_inv!27338 _keys!1208) (bvsge (size!36105 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!98542 d!132035))

(declare-fun d!132037 () Bool)

(assert (=> d!132037 (= (array_inv!27339 _values!996) (bvsge (size!36106 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!98542 d!132037))

(declare-fun b!1133979 () Bool)

(declare-fun e!645471 () Bool)

(declare-fun e!645474 () Bool)

(assert (=> b!1133979 (= e!645471 e!645474)))

(assert (=> b!1133979 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36105 lt!503618)))))

(declare-fun res!756923 () Bool)

(declare-fun lt!503769 () ListLongMap!16005)

(assert (=> b!1133979 (= res!756923 (contains!6553 lt!503769 (select (arr!35568 lt!503618) from!1455)))))

(assert (=> b!1133979 (=> (not res!756923) (not e!645474))))

(declare-fun b!1133980 () Bool)

(declare-fun e!645472 () ListLongMap!16005)

(assert (=> b!1133980 (= e!645472 (ListLongMap!16006 Nil!24800))))

(declare-fun b!1133981 () Bool)

(declare-fun e!645470 () ListLongMap!16005)

(assert (=> b!1133981 (= e!645472 e!645470)))

(declare-fun c!110878 () Bool)

(assert (=> b!1133981 (= c!110878 (validKeyInArray!0 (select (arr!35568 lt!503618) from!1455)))))

(declare-fun b!1133982 () Bool)

(declare-fun e!645473 () Bool)

(assert (=> b!1133982 (= e!645473 (validKeyInArray!0 (select (arr!35568 lt!503618) from!1455)))))

(assert (=> b!1133982 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1133983 () Bool)

(declare-fun call!48945 () ListLongMap!16005)

(assert (=> b!1133983 (= e!645470 call!48945)))

(declare-fun b!1133984 () Bool)

(declare-fun e!645469 () Bool)

(assert (=> b!1133984 (= e!645469 (= lt!503769 (getCurrentListMapNoExtraKeys!4534 lt!503618 lt!503612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133985 () Bool)

(declare-fun res!756921 () Bool)

(declare-fun e!645475 () Bool)

(assert (=> b!1133985 (=> (not res!756921) (not e!645475))))

(assert (=> b!1133985 (= res!756921 (not (contains!6553 lt!503769 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!132039 () Bool)

(assert (=> d!132039 e!645475))

(declare-fun res!756924 () Bool)

(assert (=> d!132039 (=> (not res!756924) (not e!645475))))

(assert (=> d!132039 (= res!756924 (not (contains!6553 lt!503769 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132039 (= lt!503769 e!645472)))

(declare-fun c!110877 () Bool)

(assert (=> d!132039 (= c!110877 (bvsge from!1455 (size!36105 lt!503618)))))

(assert (=> d!132039 (validMask!0 mask!1564)))

(assert (=> d!132039 (= (getCurrentListMapNoExtraKeys!4534 lt!503618 lt!503612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!503769)))

(declare-fun b!1133986 () Bool)

(assert (=> b!1133986 (= e!645475 e!645471)))

(declare-fun c!110875 () Bool)

(assert (=> b!1133986 (= c!110875 e!645473)))

(declare-fun res!756922 () Bool)

(assert (=> b!1133986 (=> (not res!756922) (not e!645473))))

(assert (=> b!1133986 (= res!756922 (bvslt from!1455 (size!36105 lt!503618)))))

(declare-fun b!1133987 () Bool)

(declare-fun lt!503771 () Unit!37078)

(declare-fun lt!503766 () Unit!37078)

(assert (=> b!1133987 (= lt!503771 lt!503766)))

(declare-fun lt!503770 () ListLongMap!16005)

(declare-fun lt!503768 () V!43089)

(declare-fun lt!503765 () (_ BitVec 64))

(declare-fun lt!503767 () (_ BitVec 64))

(assert (=> b!1133987 (not (contains!6553 (+!3482 lt!503770 (tuple2!18029 lt!503765 lt!503768)) lt!503767))))

(assert (=> b!1133987 (= lt!503766 (addStillNotContains!286 lt!503770 lt!503765 lt!503768 lt!503767))))

(assert (=> b!1133987 (= lt!503767 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133987 (= lt!503768 (get!18108 (select (arr!35569 lt!503612) from!1455) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133987 (= lt!503765 (select (arr!35568 lt!503618) from!1455))))

(assert (=> b!1133987 (= lt!503770 call!48945)))

(assert (=> b!1133987 (= e!645470 (+!3482 call!48945 (tuple2!18029 (select (arr!35568 lt!503618) from!1455) (get!18108 (select (arr!35569 lt!503612) from!1455) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1133988 () Bool)

(assert (=> b!1133988 (= e!645469 (isEmpty!980 lt!503769))))

(declare-fun b!1133989 () Bool)

(assert (=> b!1133989 (= e!645471 e!645469)))

(declare-fun c!110876 () Bool)

(assert (=> b!1133989 (= c!110876 (bvslt from!1455 (size!36105 lt!503618)))))

(declare-fun bm!48942 () Bool)

(assert (=> bm!48942 (= call!48945 (getCurrentListMapNoExtraKeys!4534 lt!503618 lt!503612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1133990 () Bool)

(assert (=> b!1133990 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36105 lt!503618)))))

(assert (=> b!1133990 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36106 lt!503612)))))

(assert (=> b!1133990 (= e!645474 (= (apply!965 lt!503769 (select (arr!35568 lt!503618) from!1455)) (get!18108 (select (arr!35569 lt!503612) from!1455) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132039 c!110877) b!1133980))

(assert (= (and d!132039 (not c!110877)) b!1133981))

(assert (= (and b!1133981 c!110878) b!1133987))

(assert (= (and b!1133981 (not c!110878)) b!1133983))

(assert (= (or b!1133987 b!1133983) bm!48942))

(assert (= (and d!132039 res!756924) b!1133985))

(assert (= (and b!1133985 res!756921) b!1133986))

(assert (= (and b!1133986 res!756922) b!1133982))

(assert (= (and b!1133986 c!110875) b!1133979))

(assert (= (and b!1133986 (not c!110875)) b!1133989))

(assert (= (and b!1133979 res!756923) b!1133990))

(assert (= (and b!1133989 c!110876) b!1133984))

(assert (= (and b!1133989 (not c!110876)) b!1133988))

(declare-fun b_lambda!19021 () Bool)

(assert (=> (not b_lambda!19021) (not b!1133987)))

(assert (=> b!1133987 t!35727))

(declare-fun b_and!38737 () Bool)

(assert (= b_and!38735 (and (=> t!35727 result!18061) b_and!38737)))

(declare-fun b_lambda!19023 () Bool)

(assert (=> (not b_lambda!19023) (not b!1133990)))

(assert (=> b!1133990 t!35727))

(declare-fun b_and!38739 () Bool)

(assert (= b_and!38737 (and (=> t!35727 result!18061) b_and!38739)))

(declare-fun m!1047515 () Bool)

(assert (=> b!1133984 m!1047515))

(declare-fun m!1047517 () Bool)

(assert (=> b!1133987 m!1047517))

(declare-fun m!1047519 () Bool)

(assert (=> b!1133987 m!1047519))

(declare-fun m!1047521 () Bool)

(assert (=> b!1133987 m!1047521))

(assert (=> b!1133987 m!1047519))

(declare-fun m!1047523 () Bool)

(assert (=> b!1133987 m!1047523))

(assert (=> b!1133987 m!1047249))

(declare-fun m!1047525 () Bool)

(assert (=> b!1133987 m!1047525))

(declare-fun m!1047527 () Bool)

(assert (=> b!1133987 m!1047527))

(assert (=> b!1133987 m!1047527))

(assert (=> b!1133987 m!1047249))

(declare-fun m!1047529 () Bool)

(assert (=> b!1133987 m!1047529))

(assert (=> b!1133981 m!1047517))

(assert (=> b!1133981 m!1047517))

(declare-fun m!1047531 () Bool)

(assert (=> b!1133981 m!1047531))

(assert (=> b!1133990 m!1047517))

(assert (=> b!1133990 m!1047249))

(assert (=> b!1133990 m!1047527))

(assert (=> b!1133990 m!1047517))

(declare-fun m!1047533 () Bool)

(assert (=> b!1133990 m!1047533))

(assert (=> b!1133990 m!1047527))

(assert (=> b!1133990 m!1047249))

(assert (=> b!1133990 m!1047529))

(declare-fun m!1047535 () Bool)

(assert (=> b!1133988 m!1047535))

(declare-fun m!1047537 () Bool)

(assert (=> d!132039 m!1047537))

(assert (=> d!132039 m!1047255))

(assert (=> b!1133982 m!1047517))

(assert (=> b!1133982 m!1047517))

(assert (=> b!1133982 m!1047531))

(assert (=> bm!48942 m!1047515))

(assert (=> b!1133979 m!1047517))

(assert (=> b!1133979 m!1047517))

(declare-fun m!1047539 () Bool)

(assert (=> b!1133979 m!1047539))

(declare-fun m!1047541 () Bool)

(assert (=> b!1133985 m!1047541))

(assert (=> b!1133715 d!132039))

(declare-fun b!1133991 () Bool)

(declare-fun e!645478 () Bool)

(declare-fun e!645481 () Bool)

(assert (=> b!1133991 (= e!645478 e!645481)))

(assert (=> b!1133991 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36105 _keys!1208)))))

(declare-fun lt!503776 () ListLongMap!16005)

(declare-fun res!756927 () Bool)

(assert (=> b!1133991 (= res!756927 (contains!6553 lt!503776 (select (arr!35568 _keys!1208) from!1455)))))

(assert (=> b!1133991 (=> (not res!756927) (not e!645481))))

(declare-fun b!1133992 () Bool)

(declare-fun e!645479 () ListLongMap!16005)

(assert (=> b!1133992 (= e!645479 (ListLongMap!16006 Nil!24800))))

(declare-fun b!1133993 () Bool)

(declare-fun e!645477 () ListLongMap!16005)

(assert (=> b!1133993 (= e!645479 e!645477)))

(declare-fun c!110882 () Bool)

(assert (=> b!1133993 (= c!110882 (validKeyInArray!0 (select (arr!35568 _keys!1208) from!1455)))))

(declare-fun b!1133994 () Bool)

(declare-fun e!645480 () Bool)

(assert (=> b!1133994 (= e!645480 (validKeyInArray!0 (select (arr!35568 _keys!1208) from!1455)))))

(assert (=> b!1133994 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1133995 () Bool)

(declare-fun call!48946 () ListLongMap!16005)

(assert (=> b!1133995 (= e!645477 call!48946)))

(declare-fun b!1133996 () Bool)

(declare-fun e!645476 () Bool)

(assert (=> b!1133996 (= e!645476 (= lt!503776 (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1133997 () Bool)

(declare-fun res!756925 () Bool)

(declare-fun e!645482 () Bool)

(assert (=> b!1133997 (=> (not res!756925) (not e!645482))))

(assert (=> b!1133997 (= res!756925 (not (contains!6553 lt!503776 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!132041 () Bool)

(assert (=> d!132041 e!645482))

(declare-fun res!756928 () Bool)

(assert (=> d!132041 (=> (not res!756928) (not e!645482))))

(assert (=> d!132041 (= res!756928 (not (contains!6553 lt!503776 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132041 (= lt!503776 e!645479)))

(declare-fun c!110881 () Bool)

(assert (=> d!132041 (= c!110881 (bvsge from!1455 (size!36105 _keys!1208)))))

(assert (=> d!132041 (validMask!0 mask!1564)))

(assert (=> d!132041 (= (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!503776)))

(declare-fun b!1133998 () Bool)

(assert (=> b!1133998 (= e!645482 e!645478)))

(declare-fun c!110879 () Bool)

(assert (=> b!1133998 (= c!110879 e!645480)))

(declare-fun res!756926 () Bool)

(assert (=> b!1133998 (=> (not res!756926) (not e!645480))))

(assert (=> b!1133998 (= res!756926 (bvslt from!1455 (size!36105 _keys!1208)))))

(declare-fun b!1133999 () Bool)

(declare-fun lt!503778 () Unit!37078)

(declare-fun lt!503773 () Unit!37078)

(assert (=> b!1133999 (= lt!503778 lt!503773)))

(declare-fun lt!503777 () ListLongMap!16005)

(declare-fun lt!503775 () V!43089)

(declare-fun lt!503772 () (_ BitVec 64))

(declare-fun lt!503774 () (_ BitVec 64))

(assert (=> b!1133999 (not (contains!6553 (+!3482 lt!503777 (tuple2!18029 lt!503772 lt!503775)) lt!503774))))

(assert (=> b!1133999 (= lt!503773 (addStillNotContains!286 lt!503777 lt!503772 lt!503775 lt!503774))))

(assert (=> b!1133999 (= lt!503774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1133999 (= lt!503775 (get!18108 (select (arr!35569 _values!996) from!1455) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1133999 (= lt!503772 (select (arr!35568 _keys!1208) from!1455))))

(assert (=> b!1133999 (= lt!503777 call!48946)))

(assert (=> b!1133999 (= e!645477 (+!3482 call!48946 (tuple2!18029 (select (arr!35568 _keys!1208) from!1455) (get!18108 (select (arr!35569 _values!996) from!1455) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1134000 () Bool)

(assert (=> b!1134000 (= e!645476 (isEmpty!980 lt!503776))))

(declare-fun b!1134001 () Bool)

(assert (=> b!1134001 (= e!645478 e!645476)))

(declare-fun c!110880 () Bool)

(assert (=> b!1134001 (= c!110880 (bvslt from!1455 (size!36105 _keys!1208)))))

(declare-fun bm!48943 () Bool)

(assert (=> bm!48943 (= call!48946 (getCurrentListMapNoExtraKeys!4534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1134002 () Bool)

(assert (=> b!1134002 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36105 _keys!1208)))))

(assert (=> b!1134002 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36106 _values!996)))))

(assert (=> b!1134002 (= e!645481 (= (apply!965 lt!503776 (select (arr!35568 _keys!1208) from!1455)) (get!18108 (select (arr!35569 _values!996) from!1455) (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!132041 c!110881) b!1133992))

(assert (= (and d!132041 (not c!110881)) b!1133993))

(assert (= (and b!1133993 c!110882) b!1133999))

(assert (= (and b!1133993 (not c!110882)) b!1133995))

(assert (= (or b!1133999 b!1133995) bm!48943))

(assert (= (and d!132041 res!756928) b!1133997))

(assert (= (and b!1133997 res!756925) b!1133998))

(assert (= (and b!1133998 res!756926) b!1133994))

(assert (= (and b!1133998 c!110879) b!1133991))

(assert (= (and b!1133998 (not c!110879)) b!1134001))

(assert (= (and b!1133991 res!756927) b!1134002))

(assert (= (and b!1134001 c!110880) b!1133996))

(assert (= (and b!1134001 (not c!110880)) b!1134000))

(declare-fun b_lambda!19025 () Bool)

(assert (=> (not b_lambda!19025) (not b!1133999)))

(assert (=> b!1133999 t!35727))

(declare-fun b_and!38741 () Bool)

(assert (= b_and!38739 (and (=> t!35727 result!18061) b_and!38741)))

(declare-fun b_lambda!19027 () Bool)

(assert (=> (not b_lambda!19027) (not b!1134002)))

(assert (=> b!1134002 t!35727))

(declare-fun b_and!38743 () Bool)

(assert (= b_and!38741 (and (=> t!35727 result!18061) b_and!38743)))

(declare-fun m!1047543 () Bool)

(assert (=> b!1133996 m!1047543))

(assert (=> b!1133999 m!1047299))

(declare-fun m!1047545 () Bool)

(assert (=> b!1133999 m!1047545))

(declare-fun m!1047547 () Bool)

(assert (=> b!1133999 m!1047547))

(assert (=> b!1133999 m!1047545))

(declare-fun m!1047549 () Bool)

(assert (=> b!1133999 m!1047549))

(assert (=> b!1133999 m!1047249))

(declare-fun m!1047551 () Bool)

(assert (=> b!1133999 m!1047551))

(declare-fun m!1047553 () Bool)

(assert (=> b!1133999 m!1047553))

(assert (=> b!1133999 m!1047553))

(assert (=> b!1133999 m!1047249))

(declare-fun m!1047555 () Bool)

(assert (=> b!1133999 m!1047555))

(assert (=> b!1133993 m!1047299))

(assert (=> b!1133993 m!1047299))

(declare-fun m!1047557 () Bool)

(assert (=> b!1133993 m!1047557))

(assert (=> b!1134002 m!1047299))

(assert (=> b!1134002 m!1047249))

(assert (=> b!1134002 m!1047553))

(assert (=> b!1134002 m!1047299))

(declare-fun m!1047559 () Bool)

(assert (=> b!1134002 m!1047559))

(assert (=> b!1134002 m!1047553))

(assert (=> b!1134002 m!1047249))

(assert (=> b!1134002 m!1047555))

(declare-fun m!1047561 () Bool)

(assert (=> b!1134000 m!1047561))

(declare-fun m!1047563 () Bool)

(assert (=> d!132041 m!1047563))

(assert (=> d!132041 m!1047255))

(assert (=> b!1133994 m!1047299))

(assert (=> b!1133994 m!1047299))

(assert (=> b!1133994 m!1047557))

(assert (=> bm!48943 m!1047543))

(assert (=> b!1133991 m!1047299))

(assert (=> b!1133991 m!1047299))

(declare-fun m!1047565 () Bool)

(assert (=> b!1133991 m!1047565))

(declare-fun m!1047567 () Bool)

(assert (=> b!1133997 m!1047567))

(assert (=> b!1133715 d!132041))

(declare-fun d!132043 () Bool)

(assert (=> d!132043 (contains!6553 (+!3482 (ite c!110818 lt!503610 lt!503620) (tuple2!18029 (ite c!110818 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110817 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110818 minValue!944 (ite c!110817 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!503781 () Unit!37078)

(declare-fun choose!1787 (ListLongMap!16005 (_ BitVec 64) V!43089 (_ BitVec 64)) Unit!37078)

(assert (=> d!132043 (= lt!503781 (choose!1787 (ite c!110818 lt!503610 lt!503620) (ite c!110818 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110817 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110818 minValue!944 (ite c!110817 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!132043 (contains!6553 (ite c!110818 lt!503610 lt!503620) k0!934)))

(assert (=> d!132043 (= (addStillContains!707 (ite c!110818 lt!503610 lt!503620) (ite c!110818 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110817 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110818 minValue!944 (ite c!110817 zeroValue!944 minValue!944)) k0!934) lt!503781)))

(declare-fun bs!33003 () Bool)

(assert (= bs!33003 d!132043))

(declare-fun m!1047569 () Bool)

(assert (=> bs!33003 m!1047569))

(assert (=> bs!33003 m!1047569))

(declare-fun m!1047571 () Bool)

(assert (=> bs!33003 m!1047571))

(declare-fun m!1047573 () Bool)

(assert (=> bs!33003 m!1047573))

(declare-fun m!1047575 () Bool)

(assert (=> bs!33003 m!1047575))

(assert (=> bm!48877 d!132043))

(declare-fun d!132045 () Bool)

(declare-fun e!645483 () Bool)

(assert (=> d!132045 e!645483))

(declare-fun res!756929 () Bool)

(assert (=> d!132045 (=> res!756929 e!645483)))

(declare-fun lt!503785 () Bool)

(assert (=> d!132045 (= res!756929 (not lt!503785))))

(declare-fun lt!503784 () Bool)

(assert (=> d!132045 (= lt!503785 lt!503784)))

(declare-fun lt!503783 () Unit!37078)

(declare-fun e!645484 () Unit!37078)

(assert (=> d!132045 (= lt!503783 e!645484)))

(declare-fun c!110883 () Bool)

(assert (=> d!132045 (= c!110883 lt!503784)))

(assert (=> d!132045 (= lt!503784 (containsKey!588 (toList!8018 (ite c!110818 lt!503610 call!48882)) k0!934))))

(assert (=> d!132045 (= (contains!6553 (ite c!110818 lt!503610 call!48882) k0!934) lt!503785)))

(declare-fun b!1134004 () Bool)

(declare-fun lt!503782 () Unit!37078)

(assert (=> b!1134004 (= e!645484 lt!503782)))

(assert (=> b!1134004 (= lt!503782 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8018 (ite c!110818 lt!503610 call!48882)) k0!934))))

(assert (=> b!1134004 (isDefined!454 (getValueByKey!625 (toList!8018 (ite c!110818 lt!503610 call!48882)) k0!934))))

(declare-fun b!1134005 () Bool)

(declare-fun Unit!37088 () Unit!37078)

(assert (=> b!1134005 (= e!645484 Unit!37088)))

(declare-fun b!1134006 () Bool)

(assert (=> b!1134006 (= e!645483 (isDefined!454 (getValueByKey!625 (toList!8018 (ite c!110818 lt!503610 call!48882)) k0!934)))))

(assert (= (and d!132045 c!110883) b!1134004))

(assert (= (and d!132045 (not c!110883)) b!1134005))

(assert (= (and d!132045 (not res!756929)) b!1134006))

(declare-fun m!1047577 () Bool)

(assert (=> d!132045 m!1047577))

(declare-fun m!1047579 () Bool)

(assert (=> b!1134004 m!1047579))

(declare-fun m!1047581 () Bool)

(assert (=> b!1134004 m!1047581))

(assert (=> b!1134004 m!1047581))

(declare-fun m!1047583 () Bool)

(assert (=> b!1134004 m!1047583))

(assert (=> b!1134006 m!1047581))

(assert (=> b!1134006 m!1047581))

(assert (=> b!1134006 m!1047583))

(assert (=> bm!48883 d!132045))

(declare-fun b!1134017 () Bool)

(declare-fun e!645496 () Bool)

(declare-fun call!48949 () Bool)

(assert (=> b!1134017 (= e!645496 call!48949)))

(declare-fun b!1134018 () Bool)

(declare-fun e!645493 () Bool)

(declare-fun e!645495 () Bool)

(assert (=> b!1134018 (= e!645493 e!645495)))

(declare-fun res!756936 () Bool)

(assert (=> b!1134018 (=> (not res!756936) (not e!645495))))

(declare-fun e!645494 () Bool)

(assert (=> b!1134018 (= res!756936 (not e!645494))))

(declare-fun res!756938 () Bool)

(assert (=> b!1134018 (=> (not res!756938) (not e!645494))))

(assert (=> b!1134018 (= res!756938 (validKeyInArray!0 (select (arr!35568 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1134019 () Bool)

(assert (=> b!1134019 (= e!645495 e!645496)))

(declare-fun c!110886 () Bool)

(assert (=> b!1134019 (= c!110886 (validKeyInArray!0 (select (arr!35568 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132047 () Bool)

(declare-fun res!756937 () Bool)

(assert (=> d!132047 (=> res!756937 e!645493)))

(assert (=> d!132047 (= res!756937 (bvsge #b00000000000000000000000000000000 (size!36105 _keys!1208)))))

(assert (=> d!132047 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24801) e!645493)))

(declare-fun b!1134020 () Bool)

(declare-fun contains!6555 (List!24804 (_ BitVec 64)) Bool)

(assert (=> b!1134020 (= e!645494 (contains!6555 Nil!24801 (select (arr!35568 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1134021 () Bool)

(assert (=> b!1134021 (= e!645496 call!48949)))

(declare-fun bm!48946 () Bool)

(assert (=> bm!48946 (= call!48949 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110886 (Cons!24800 (select (arr!35568 _keys!1208) #b00000000000000000000000000000000) Nil!24801) Nil!24801)))))

(assert (= (and d!132047 (not res!756937)) b!1134018))

(assert (= (and b!1134018 res!756938) b!1134020))

(assert (= (and b!1134018 res!756936) b!1134019))

(assert (= (and b!1134019 c!110886) b!1134017))

(assert (= (and b!1134019 (not c!110886)) b!1134021))

(assert (= (or b!1134017 b!1134021) bm!48946))

(assert (=> b!1134018 m!1047433))

(assert (=> b!1134018 m!1047433))

(declare-fun m!1047585 () Bool)

(assert (=> b!1134018 m!1047585))

(assert (=> b!1134019 m!1047433))

(assert (=> b!1134019 m!1047433))

(assert (=> b!1134019 m!1047585))

(assert (=> b!1134020 m!1047433))

(assert (=> b!1134020 m!1047433))

(declare-fun m!1047587 () Bool)

(assert (=> b!1134020 m!1047587))

(assert (=> bm!48946 m!1047433))

(declare-fun m!1047589 () Bool)

(assert (=> bm!48946 m!1047589))

(assert (=> b!1133709 d!132047))

(declare-fun b!1134022 () Bool)

(declare-fun e!645500 () Bool)

(declare-fun call!48950 () Bool)

(assert (=> b!1134022 (= e!645500 call!48950)))

(declare-fun b!1134023 () Bool)

(declare-fun e!645497 () Bool)

(declare-fun e!645499 () Bool)

(assert (=> b!1134023 (= e!645497 e!645499)))

(declare-fun res!756939 () Bool)

(assert (=> b!1134023 (=> (not res!756939) (not e!645499))))

(declare-fun e!645498 () Bool)

(assert (=> b!1134023 (= res!756939 (not e!645498))))

(declare-fun res!756941 () Bool)

(assert (=> b!1134023 (=> (not res!756941) (not e!645498))))

(assert (=> b!1134023 (= res!756941 (validKeyInArray!0 (select (arr!35568 lt!503618) #b00000000000000000000000000000000)))))

(declare-fun b!1134024 () Bool)

(assert (=> b!1134024 (= e!645499 e!645500)))

(declare-fun c!110887 () Bool)

(assert (=> b!1134024 (= c!110887 (validKeyInArray!0 (select (arr!35568 lt!503618) #b00000000000000000000000000000000)))))

(declare-fun d!132049 () Bool)

(declare-fun res!756940 () Bool)

(assert (=> d!132049 (=> res!756940 e!645497)))

(assert (=> d!132049 (= res!756940 (bvsge #b00000000000000000000000000000000 (size!36105 lt!503618)))))

(assert (=> d!132049 (= (arrayNoDuplicates!0 lt!503618 #b00000000000000000000000000000000 Nil!24801) e!645497)))

(declare-fun b!1134025 () Bool)

(assert (=> b!1134025 (= e!645498 (contains!6555 Nil!24801 (select (arr!35568 lt!503618) #b00000000000000000000000000000000)))))

(declare-fun b!1134026 () Bool)

(assert (=> b!1134026 (= e!645500 call!48950)))

(declare-fun bm!48947 () Bool)

(assert (=> bm!48947 (= call!48950 (arrayNoDuplicates!0 lt!503618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!110887 (Cons!24800 (select (arr!35568 lt!503618) #b00000000000000000000000000000000) Nil!24801) Nil!24801)))))

(assert (= (and d!132049 (not res!756940)) b!1134023))

(assert (= (and b!1134023 res!756941) b!1134025))

(assert (= (and b!1134023 res!756939) b!1134024))

(assert (= (and b!1134024 c!110887) b!1134022))

(assert (= (and b!1134024 (not c!110887)) b!1134026))

(assert (= (or b!1134022 b!1134026) bm!48947))

(declare-fun m!1047591 () Bool)

(assert (=> b!1134023 m!1047591))

(assert (=> b!1134023 m!1047591))

(declare-fun m!1047593 () Bool)

(assert (=> b!1134023 m!1047593))

(assert (=> b!1134024 m!1047591))

(assert (=> b!1134024 m!1047591))

(assert (=> b!1134024 m!1047593))

(assert (=> b!1134025 m!1047591))

(assert (=> b!1134025 m!1047591))

(declare-fun m!1047595 () Bool)

(assert (=> b!1134025 m!1047595))

(assert (=> bm!48947 m!1047591))

(declare-fun m!1047597 () Bool)

(assert (=> bm!48947 m!1047597))

(assert (=> b!1133724 d!132049))

(declare-fun d!132051 () Bool)

(declare-fun e!645503 () Bool)

(assert (=> d!132051 e!645503))

(declare-fun res!756946 () Bool)

(assert (=> d!132051 (=> (not res!756946) (not e!645503))))

(declare-fun lt!503796 () ListLongMap!16005)

(assert (=> d!132051 (= res!756946 (contains!6553 lt!503796 (_1!9025 (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!503797 () List!24803)

(assert (=> d!132051 (= lt!503796 (ListLongMap!16006 lt!503797))))

(declare-fun lt!503795 () Unit!37078)

(declare-fun lt!503794 () Unit!37078)

(assert (=> d!132051 (= lt!503795 lt!503794)))

(assert (=> d!132051 (= (getValueByKey!625 lt!503797 (_1!9025 (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!675 (_2!9025 (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!307 (List!24803 (_ BitVec 64) V!43089) Unit!37078)

(assert (=> d!132051 (= lt!503794 (lemmaContainsTupThenGetReturnValue!307 lt!503797 (_1!9025 (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9025 (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun insertStrictlySorted!400 (List!24803 (_ BitVec 64) V!43089) List!24803)

(assert (=> d!132051 (= lt!503797 (insertStrictlySorted!400 (toList!8018 (ite c!110818 lt!503610 lt!503620)) (_1!9025 (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9025 (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!132051 (= (+!3482 (ite c!110818 lt!503610 lt!503620) (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!503796)))

(declare-fun b!1134031 () Bool)

(declare-fun res!756947 () Bool)

(assert (=> b!1134031 (=> (not res!756947) (not e!645503))))

(assert (=> b!1134031 (= res!756947 (= (getValueByKey!625 (toList!8018 lt!503796) (_1!9025 (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!675 (_2!9025 (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1134032 () Bool)

(declare-fun contains!6556 (List!24803 tuple2!18028) Bool)

(assert (=> b!1134032 (= e!645503 (contains!6556 (toList!8018 lt!503796) (ite c!110818 (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110817 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18029 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!132051 res!756946) b!1134031))

(assert (= (and b!1134031 res!756947) b!1134032))

(declare-fun m!1047599 () Bool)

(assert (=> d!132051 m!1047599))

(declare-fun m!1047601 () Bool)

(assert (=> d!132051 m!1047601))

(declare-fun m!1047603 () Bool)

(assert (=> d!132051 m!1047603))

(declare-fun m!1047605 () Bool)

(assert (=> d!132051 m!1047605))

(declare-fun m!1047607 () Bool)

(assert (=> b!1134031 m!1047607))

(declare-fun m!1047609 () Bool)

(assert (=> b!1134032 m!1047609))

(assert (=> bm!48881 d!132051))

(declare-fun b!1134041 () Bool)

(declare-fun e!645512 () Bool)

(declare-fun call!48953 () Bool)

(assert (=> b!1134041 (= e!645512 call!48953)))

(declare-fun b!1134042 () Bool)

(declare-fun e!645511 () Bool)

(assert (=> b!1134042 (= e!645511 call!48953)))

(declare-fun d!132053 () Bool)

(declare-fun res!756952 () Bool)

(declare-fun e!645510 () Bool)

(assert (=> d!132053 (=> res!756952 e!645510)))

(assert (=> d!132053 (= res!756952 (bvsge #b00000000000000000000000000000000 (size!36105 _keys!1208)))))

(assert (=> d!132053 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!645510)))

(declare-fun b!1134043 () Bool)

(assert (=> b!1134043 (= e!645511 e!645512)))

(declare-fun lt!503805 () (_ BitVec 64))

(assert (=> b!1134043 (= lt!503805 (select (arr!35568 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!503806 () Unit!37078)

(assert (=> b!1134043 (= lt!503806 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!503805 #b00000000000000000000000000000000))))

(assert (=> b!1134043 (arrayContainsKey!0 _keys!1208 lt!503805 #b00000000000000000000000000000000)))

(declare-fun lt!503804 () Unit!37078)

(assert (=> b!1134043 (= lt!503804 lt!503806)))

(declare-fun res!756953 () Bool)

(declare-datatypes ((SeekEntryResult!9882 0))(
  ( (MissingZero!9882 (index!41899 (_ BitVec 32))) (Found!9882 (index!41900 (_ BitVec 32))) (Intermediate!9882 (undefined!10694 Bool) (index!41901 (_ BitVec 32)) (x!101499 (_ BitVec 32))) (Undefined!9882) (MissingVacant!9882 (index!41902 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!73845 (_ BitVec 32)) SeekEntryResult!9882)

(assert (=> b!1134043 (= res!756953 (= (seekEntryOrOpen!0 (select (arr!35568 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9882 #b00000000000000000000000000000000)))))

(assert (=> b!1134043 (=> (not res!756953) (not e!645512))))

(declare-fun bm!48950 () Bool)

(assert (=> bm!48950 (= call!48953 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1134044 () Bool)

(assert (=> b!1134044 (= e!645510 e!645511)))

(declare-fun c!110890 () Bool)

(assert (=> b!1134044 (= c!110890 (validKeyInArray!0 (select (arr!35568 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132053 (not res!756952)) b!1134044))

(assert (= (and b!1134044 c!110890) b!1134043))

(assert (= (and b!1134044 (not c!110890)) b!1134042))

(assert (= (and b!1134043 res!756953) b!1134041))

(assert (= (or b!1134041 b!1134042) bm!48950))

(assert (=> b!1134043 m!1047433))

(declare-fun m!1047611 () Bool)

(assert (=> b!1134043 m!1047611))

(declare-fun m!1047613 () Bool)

(assert (=> b!1134043 m!1047613))

(assert (=> b!1134043 m!1047433))

(declare-fun m!1047615 () Bool)

(assert (=> b!1134043 m!1047615))

(declare-fun m!1047617 () Bool)

(assert (=> bm!48950 m!1047617))

(assert (=> b!1134044 m!1047433))

(assert (=> b!1134044 m!1047433))

(assert (=> b!1134044 m!1047585))

(assert (=> b!1133712 d!132053))

(declare-fun d!132055 () Bool)

(assert (=> d!132055 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1133727 d!132055))

(declare-fun d!132057 () Bool)

(declare-fun res!756954 () Bool)

(declare-fun e!645513 () Bool)

(assert (=> d!132057 (=> res!756954 e!645513)))

(assert (=> d!132057 (= res!756954 (= (select (arr!35568 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!132057 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!645513)))

(declare-fun b!1134045 () Bool)

(declare-fun e!645514 () Bool)

(assert (=> b!1134045 (= e!645513 e!645514)))

(declare-fun res!756955 () Bool)

(assert (=> b!1134045 (=> (not res!756955) (not e!645514))))

(assert (=> b!1134045 (= res!756955 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!36105 _keys!1208)))))

(declare-fun b!1134046 () Bool)

(assert (=> b!1134046 (= e!645514 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!132057 (not res!756954)) b!1134045))

(assert (= (and b!1134045 res!756955) b!1134046))

(assert (=> d!132057 m!1047449))

(declare-fun m!1047619 () Bool)

(assert (=> b!1134046 m!1047619))

(assert (=> b!1133711 d!132057))

(declare-fun b!1134047 () Bool)

(declare-fun e!645517 () Bool)

(declare-fun call!48954 () Bool)

(assert (=> b!1134047 (= e!645517 call!48954)))

(declare-fun b!1134048 () Bool)

(declare-fun e!645516 () Bool)

(assert (=> b!1134048 (= e!645516 call!48954)))

(declare-fun d!132059 () Bool)

(declare-fun res!756956 () Bool)

(declare-fun e!645515 () Bool)

(assert (=> d!132059 (=> res!756956 e!645515)))

(assert (=> d!132059 (= res!756956 (bvsge #b00000000000000000000000000000000 (size!36105 lt!503618)))))

(assert (=> d!132059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503618 mask!1564) e!645515)))

(declare-fun b!1134049 () Bool)

(assert (=> b!1134049 (= e!645516 e!645517)))

(declare-fun lt!503808 () (_ BitVec 64))

(assert (=> b!1134049 (= lt!503808 (select (arr!35568 lt!503618) #b00000000000000000000000000000000))))

(declare-fun lt!503809 () Unit!37078)

(assert (=> b!1134049 (= lt!503809 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!503618 lt!503808 #b00000000000000000000000000000000))))

(assert (=> b!1134049 (arrayContainsKey!0 lt!503618 lt!503808 #b00000000000000000000000000000000)))

(declare-fun lt!503807 () Unit!37078)

(assert (=> b!1134049 (= lt!503807 lt!503809)))

(declare-fun res!756957 () Bool)

(assert (=> b!1134049 (= res!756957 (= (seekEntryOrOpen!0 (select (arr!35568 lt!503618) #b00000000000000000000000000000000) lt!503618 mask!1564) (Found!9882 #b00000000000000000000000000000000)))))

(assert (=> b!1134049 (=> (not res!756957) (not e!645517))))

(declare-fun bm!48951 () Bool)

(assert (=> bm!48951 (= call!48954 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!503618 mask!1564))))

(declare-fun b!1134050 () Bool)

(assert (=> b!1134050 (= e!645515 e!645516)))

(declare-fun c!110891 () Bool)

(assert (=> b!1134050 (= c!110891 (validKeyInArray!0 (select (arr!35568 lt!503618) #b00000000000000000000000000000000)))))

(assert (= (and d!132059 (not res!756956)) b!1134050))

(assert (= (and b!1134050 c!110891) b!1134049))

(assert (= (and b!1134050 (not c!110891)) b!1134048))

(assert (= (and b!1134049 res!756957) b!1134047))

(assert (= (or b!1134047 b!1134048) bm!48951))

(assert (=> b!1134049 m!1047591))

(declare-fun m!1047621 () Bool)

(assert (=> b!1134049 m!1047621))

(declare-fun m!1047623 () Bool)

(assert (=> b!1134049 m!1047623))

(assert (=> b!1134049 m!1047591))

(declare-fun m!1047625 () Bool)

(assert (=> b!1134049 m!1047625))

(declare-fun m!1047627 () Bool)

(assert (=> bm!48951 m!1047627))

(assert (=> b!1134050 m!1047591))

(assert (=> b!1134050 m!1047591))

(assert (=> b!1134050 m!1047593))

(assert (=> b!1133725 d!132059))

(declare-fun d!132061 () Bool)

(assert (=> d!132061 (contains!6553 (+!3482 lt!503620 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!503810 () Unit!37078)

(assert (=> d!132061 (= lt!503810 (choose!1787 lt!503620 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!132061 (contains!6553 lt!503620 k0!934)))

(assert (=> d!132061 (= (addStillContains!707 lt!503620 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!503810)))

(declare-fun bs!33004 () Bool)

(assert (= bs!33004 d!132061))

(assert (=> bs!33004 m!1047273))

(assert (=> bs!33004 m!1047273))

(declare-fun m!1047629 () Bool)

(assert (=> bs!33004 m!1047629))

(declare-fun m!1047631 () Bool)

(assert (=> bs!33004 m!1047631))

(assert (=> bs!33004 m!1047261))

(assert (=> b!1133726 d!132061))

(declare-fun d!132063 () Bool)

(declare-fun e!645518 () Bool)

(assert (=> d!132063 e!645518))

(declare-fun res!756958 () Bool)

(assert (=> d!132063 (=> (not res!756958) (not e!645518))))

(declare-fun lt!503813 () ListLongMap!16005)

(assert (=> d!132063 (= res!756958 (contains!6553 lt!503813 (_1!9025 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!503814 () List!24803)

(assert (=> d!132063 (= lt!503813 (ListLongMap!16006 lt!503814))))

(declare-fun lt!503812 () Unit!37078)

(declare-fun lt!503811 () Unit!37078)

(assert (=> d!132063 (= lt!503812 lt!503811)))

(assert (=> d!132063 (= (getValueByKey!625 lt!503814 (_1!9025 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!675 (_2!9025 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132063 (= lt!503811 (lemmaContainsTupThenGetReturnValue!307 lt!503814 (_1!9025 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9025 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132063 (= lt!503814 (insertStrictlySorted!400 (toList!8018 lt!503620) (_1!9025 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9025 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!132063 (= (+!3482 lt!503620 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!503813)))

(declare-fun b!1134051 () Bool)

(declare-fun res!756959 () Bool)

(assert (=> b!1134051 (=> (not res!756959) (not e!645518))))

(assert (=> b!1134051 (= res!756959 (= (getValueByKey!625 (toList!8018 lt!503813) (_1!9025 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!675 (_2!9025 (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1134052 () Bool)

(assert (=> b!1134052 (= e!645518 (contains!6556 (toList!8018 lt!503813) (tuple2!18029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!132063 res!756958) b!1134051))

(assert (= (and b!1134051 res!756959) b!1134052))

(declare-fun m!1047633 () Bool)

(assert (=> d!132063 m!1047633))

(declare-fun m!1047635 () Bool)

(assert (=> d!132063 m!1047635))

(declare-fun m!1047637 () Bool)

(assert (=> d!132063 m!1047637))

(declare-fun m!1047639 () Bool)

(assert (=> d!132063 m!1047639))

(declare-fun m!1047641 () Bool)

(assert (=> b!1134051 m!1047641))

(declare-fun m!1047643 () Bool)

(assert (=> b!1134052 m!1047643))

(assert (=> b!1133726 d!132063))

(declare-fun d!132065 () Bool)

(declare-fun e!645519 () Bool)

(assert (=> d!132065 e!645519))

(declare-fun res!756960 () Bool)

(assert (=> d!132065 (=> res!756960 e!645519)))

(declare-fun lt!503818 () Bool)

(assert (=> d!132065 (= res!756960 (not lt!503818))))

(declare-fun lt!503817 () Bool)

(assert (=> d!132065 (= lt!503818 lt!503817)))

(declare-fun lt!503816 () Unit!37078)

(declare-fun e!645520 () Unit!37078)

(assert (=> d!132065 (= lt!503816 e!645520)))

(declare-fun c!110892 () Bool)

(assert (=> d!132065 (= c!110892 lt!503817)))

(assert (=> d!132065 (= lt!503817 (containsKey!588 (toList!8018 call!48883) k0!934))))

(assert (=> d!132065 (= (contains!6553 call!48883 k0!934) lt!503818)))

(declare-fun b!1134053 () Bool)

(declare-fun lt!503815 () Unit!37078)

(assert (=> b!1134053 (= e!645520 lt!503815)))

(assert (=> b!1134053 (= lt!503815 (lemmaContainsKeyImpliesGetValueByKeyDefined!416 (toList!8018 call!48883) k0!934))))

(assert (=> b!1134053 (isDefined!454 (getValueByKey!625 (toList!8018 call!48883) k0!934))))

(declare-fun b!1134054 () Bool)

(declare-fun Unit!37089 () Unit!37078)

(assert (=> b!1134054 (= e!645520 Unit!37089)))

(declare-fun b!1134055 () Bool)

(assert (=> b!1134055 (= e!645519 (isDefined!454 (getValueByKey!625 (toList!8018 call!48883) k0!934)))))

(assert (= (and d!132065 c!110892) b!1134053))

(assert (= (and d!132065 (not c!110892)) b!1134054))

(assert (= (and d!132065 (not res!756960)) b!1134055))

(declare-fun m!1047645 () Bool)

(assert (=> d!132065 m!1047645))

(declare-fun m!1047647 () Bool)

(assert (=> b!1134053 m!1047647))

(declare-fun m!1047649 () Bool)

(assert (=> b!1134053 m!1047649))

(assert (=> b!1134053 m!1047649))

(declare-fun m!1047651 () Bool)

(assert (=> b!1134053 m!1047651))

(assert (=> b!1134055 m!1047649))

(assert (=> b!1134055 m!1047649))

(assert (=> b!1134055 m!1047651))

(assert (=> b!1133726 d!132065))

(declare-fun b!1134063 () Bool)

(declare-fun e!645525 () Bool)

(assert (=> b!1134063 (= e!645525 tp_is_empty!28471)))

(declare-fun b!1134062 () Bool)

(declare-fun e!645526 () Bool)

(assert (=> b!1134062 (= e!645526 tp_is_empty!28471)))

(declare-fun mapNonEmpty!44537 () Bool)

(declare-fun mapRes!44537 () Bool)

(declare-fun tp!84546 () Bool)

(assert (=> mapNonEmpty!44537 (= mapRes!44537 (and tp!84546 e!645526))))

(declare-fun mapValue!44537 () ValueCell!13526)

(declare-fun mapRest!44537 () (Array (_ BitVec 32) ValueCell!13526))

(declare-fun mapKey!44537 () (_ BitVec 32))

(assert (=> mapNonEmpty!44537 (= mapRest!44528 (store mapRest!44537 mapKey!44537 mapValue!44537))))

(declare-fun mapIsEmpty!44537 () Bool)

(assert (=> mapIsEmpty!44537 mapRes!44537))

(declare-fun condMapEmpty!44537 () Bool)

(declare-fun mapDefault!44537 () ValueCell!13526)

(assert (=> mapNonEmpty!44528 (= condMapEmpty!44537 (= mapRest!44528 ((as const (Array (_ BitVec 32) ValueCell!13526)) mapDefault!44537)))))

(assert (=> mapNonEmpty!44528 (= tp!84530 (and e!645525 mapRes!44537))))

(assert (= (and mapNonEmpty!44528 condMapEmpty!44537) mapIsEmpty!44537))

(assert (= (and mapNonEmpty!44528 (not condMapEmpty!44537)) mapNonEmpty!44537))

(assert (= (and mapNonEmpty!44537 ((_ is ValueCellFull!13526) mapValue!44537)) b!1134062))

(assert (= (and mapNonEmpty!44528 ((_ is ValueCellFull!13526) mapDefault!44537)) b!1134063))

(declare-fun m!1047653 () Bool)

(assert (=> mapNonEmpty!44537 m!1047653))

(declare-fun b_lambda!19029 () Bool)

(assert (= b_lambda!19017 (or (and start!98542 b_free!23941) b_lambda!19029)))

(declare-fun b_lambda!19031 () Bool)

(assert (= b_lambda!19011 (or (and start!98542 b_free!23941) b_lambda!19031)))

(declare-fun b_lambda!19033 () Bool)

(assert (= b_lambda!19021 (or (and start!98542 b_free!23941) b_lambda!19033)))

(declare-fun b_lambda!19035 () Bool)

(assert (= b_lambda!19027 (or (and start!98542 b_free!23941) b_lambda!19035)))

(declare-fun b_lambda!19037 () Bool)

(assert (= b_lambda!19013 (or (and start!98542 b_free!23941) b_lambda!19037)))

(declare-fun b_lambda!19039 () Bool)

(assert (= b_lambda!19025 (or (and start!98542 b_free!23941) b_lambda!19039)))

(declare-fun b_lambda!19041 () Bool)

(assert (= b_lambda!19023 (or (and start!98542 b_free!23941) b_lambda!19041)))

(declare-fun b_lambda!19043 () Bool)

(assert (= b_lambda!19019 (or (and start!98542 b_free!23941) b_lambda!19043)))

(declare-fun b_lambda!19045 () Bool)

(assert (= b_lambda!19015 (or (and start!98542 b_free!23941) b_lambda!19045)))

(check-sat (not d!132051) (not b!1133942) (not bm!48951) (not b!1134000) (not b!1133915) (not b!1134023) (not b!1133979) (not d!132021) (not b!1133994) (not b!1133972) (not b_next!23941) (not bm!48941) (not b!1134044) (not b_lambda!19009) (not b!1133987) (not b!1134031) (not b!1134025) (not b!1134004) (not b!1133965) (not b_lambda!19033) (not d!132019) (not b!1134024) (not b_lambda!19043) (not b!1133996) (not b!1134050) (not d!132063) (not b_lambda!19041) (not b!1134052) (not b!1134055) (not b!1133948) (not b!1133973) (not b!1133951) (not b!1133946) (not b!1133913) (not b!1133906) (not b!1133976) (not b!1133978) (not b!1134043) (not d!132041) (not b_lambda!19045) (not b!1133999) (not bm!48943) (not b!1133985) (not b!1133949) (not d!132061) (not b!1133945) (not b!1133969) (not b_lambda!19035) (not b!1134046) (not b!1134019) (not b!1133975) (not b_lambda!19031) (not b_lambda!19037) (not b!1134032) (not b!1134053) (not b!1134049) tp_is_empty!28471 (not d!132045) (not d!132039) (not d!132033) (not b!1133959) (not b!1133997) (not b!1134051) (not b!1133982) (not b!1134018) (not bm!48939) (not b!1133970) (not b!1133981) (not bm!48934) (not bm!48946) (not d!132023) (not b!1133940) (not b!1134006) (not d!132027) (not b_lambda!19029) (not b!1133943) (not b!1133967) (not d!132065) (not bm!48947) (not bm!48950) (not b!1133990) (not d!132025) b_and!38743 (not d!132029) (not b!1134020) (not b!1133984) (not bm!48942) (not b!1133991) (not d!132043) (not b!1134002) (not mapNonEmpty!44537) (not b!1133993) (not b!1133988) (not bm!48940) (not b_lambda!19039))
(check-sat b_and!38743 (not b_next!23941))
