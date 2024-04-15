; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98210 () Bool)

(assert start!98210)

(declare-fun b_free!23917 () Bool)

(declare-fun b_next!23917 () Bool)

(assert (=> start!98210 (= b_free!23917 (not b_next!23917))))

(declare-fun tp!84454 () Bool)

(declare-fun b_and!38595 () Bool)

(assert (=> start!98210 (= tp!84454 b_and!38595)))

(declare-fun b!1130747 () Bool)

(declare-fun res!755490 () Bool)

(declare-fun e!643517 () Bool)

(assert (=> b!1130747 (=> (not res!755490) (not e!643517))))

(declare-datatypes ((array!73674 0))(
  ( (array!73675 (arr!35490 (Array (_ BitVec 32) (_ BitVec 64))) (size!36028 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73674)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73674 (_ BitVec 32)) Bool)

(assert (=> b!1130747 (= res!755490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130748 () Bool)

(declare-fun e!643519 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((V!43057 0))(
  ( (V!43058 (val!14280 Int)) )
))
(declare-datatypes ((tuple2!18080 0))(
  ( (tuple2!18081 (_1!9051 (_ BitVec 64)) (_2!9051 V!43057)) )
))
(declare-datatypes ((List!24831 0))(
  ( (Nil!24828) (Cons!24827 (h!26036 tuple2!18080) (t!35731 List!24831)) )
))
(declare-datatypes ((ListLongMap!16049 0))(
  ( (ListLongMap!16050 (toList!8040 List!24831)) )
))
(declare-fun call!48455 () ListLongMap!16049)

(declare-fun call!48461 () ListLongMap!16049)

(declare-fun -!1149 (ListLongMap!16049 (_ BitVec 64)) ListLongMap!16049)

(assert (=> b!1130748 (= e!643519 (= call!48455 (-!1149 call!48461 k0!934)))))

(declare-fun mapNonEmpty!44488 () Bool)

(declare-fun mapRes!44488 () Bool)

(declare-fun tp!84455 () Bool)

(declare-fun e!643521 () Bool)

(assert (=> mapNonEmpty!44488 (= mapRes!44488 (and tp!84455 e!643521))))

(declare-datatypes ((ValueCell!13514 0))(
  ( (ValueCellFull!13514 (v!16912 V!43057)) (EmptyCell!13514) )
))
(declare-fun mapRest!44488 () (Array (_ BitVec 32) ValueCell!13514))

(declare-fun mapKey!44488 () (_ BitVec 32))

(declare-datatypes ((array!73676 0))(
  ( (array!73677 (arr!35491 (Array (_ BitVec 32) ValueCell!13514)) (size!36029 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73676)

(declare-fun mapValue!44488 () ValueCell!13514)

(assert (=> mapNonEmpty!44488 (= (arr!35491 _values!996) (store mapRest!44488 mapKey!44488 mapValue!44488))))

(declare-fun b!1130749 () Bool)

(declare-datatypes ((Unit!36888 0))(
  ( (Unit!36889) )
))
(declare-fun e!643518 () Unit!36888)

(declare-fun lt!502033 () Unit!36888)

(assert (=> b!1130749 (= e!643518 lt!502033)))

(declare-fun zeroValue!944 () V!43057)

(declare-fun lt!502036 () Unit!36888)

(declare-fun lt!502045 () ListLongMap!16049)

(declare-fun addStillContains!698 (ListLongMap!16049 (_ BitVec 64) V!43057 (_ BitVec 64)) Unit!36888)

(assert (=> b!1130749 (= lt!502036 (addStillContains!698 lt!502045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!502046 () ListLongMap!16049)

(declare-fun call!48454 () ListLongMap!16049)

(assert (=> b!1130749 (= lt!502046 call!48454)))

(declare-fun call!48460 () Bool)

(assert (=> b!1130749 call!48460))

(declare-fun call!48459 () Unit!36888)

(assert (=> b!1130749 (= lt!502033 call!48459)))

(declare-fun minValue!944 () V!43057)

(declare-fun contains!6492 (ListLongMap!16049 (_ BitVec 64)) Bool)

(declare-fun +!3481 (ListLongMap!16049 tuple2!18080) ListLongMap!16049)

(assert (=> b!1130749 (contains!6492 (+!3481 lt!502046 (tuple2!18081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1130750 () Bool)

(declare-fun res!755487 () Bool)

(assert (=> b!1130750 (=> (not res!755487) (not e!643517))))

(declare-datatypes ((List!24832 0))(
  ( (Nil!24829) (Cons!24828 (h!26037 (_ BitVec 64)) (t!35732 List!24832)) )
))
(declare-fun arrayNoDuplicates!0 (array!73674 (_ BitVec 32) List!24832) Bool)

(assert (=> b!1130750 (= res!755487 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24829))))

(declare-fun b!1130751 () Bool)

(declare-fun e!643513 () Bool)

(declare-fun e!643520 () Bool)

(assert (=> b!1130751 (= e!643513 e!643520)))

(declare-fun res!755492 () Bool)

(assert (=> b!1130751 (=> res!755492 e!643520)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130751 (= res!755492 (not (= from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!502040 () array!73674)

(declare-fun lt!502038 () array!73676)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!502037 () ListLongMap!16049)

(declare-fun getCurrentListMapNoExtraKeys!4539 (array!73674 array!73676 (_ BitVec 32) (_ BitVec 32) V!43057 V!43057 (_ BitVec 32) Int) ListLongMap!16049)

(assert (=> b!1130751 (= lt!502037 (getCurrentListMapNoExtraKeys!4539 lt!502040 lt!502038 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2543 (Int (_ BitVec 64)) V!43057)

(assert (=> b!1130751 (= lt!502038 (array!73677 (store (arr!35491 _values!996) i!673 (ValueCellFull!13514 (dynLambda!2543 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36029 _values!996)))))

(declare-fun lt!502042 () ListLongMap!16049)

(assert (=> b!1130751 (= lt!502042 (getCurrentListMapNoExtraKeys!4539 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130752 () Bool)

(declare-fun e!643509 () Unit!36888)

(assert (=> b!1130752 (= e!643518 e!643509)))

(declare-fun c!110064 () Bool)

(declare-fun lt!502039 () Bool)

(assert (=> b!1130752 (= c!110064 (and (not lt!502039) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!48456 () ListLongMap!16049)

(declare-fun c!110061 () Bool)

(declare-fun bm!48452 () Bool)

(assert (=> bm!48452 (= call!48460 (contains!6492 (ite c!110061 lt!502046 call!48456) k0!934))))

(declare-fun b!1130753 () Bool)

(declare-fun e!643511 () Bool)

(declare-fun e!643516 () Bool)

(assert (=> b!1130753 (= e!643511 e!643516)))

(declare-fun res!755481 () Bool)

(assert (=> b!1130753 (=> res!755481 e!643516)))

(assert (=> b!1130753 (= res!755481 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36028 _keys!1208))))))

(declare-fun lt!502041 () Unit!36888)

(assert (=> b!1130753 (= lt!502041 e!643518)))

(assert (=> b!1130753 (= c!110061 (and (not lt!502039) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130753 (= lt!502039 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130754 () Bool)

(declare-fun e!643507 () Unit!36888)

(declare-fun lt!502043 () Unit!36888)

(assert (=> b!1130754 (= e!643507 lt!502043)))

(declare-fun call!48457 () Unit!36888)

(assert (=> b!1130754 (= lt!502043 call!48457)))

(declare-fun call!48458 () Bool)

(assert (=> b!1130754 call!48458))

(declare-fun b!1130755 () Bool)

(declare-fun e!643512 () Bool)

(declare-fun tp_is_empty!28447 () Bool)

(assert (=> b!1130755 (= e!643512 tp_is_empty!28447)))

(declare-fun b!1130756 () Bool)

(declare-fun res!755480 () Bool)

(assert (=> b!1130756 (=> (not res!755480) (not e!643517))))

(assert (=> b!1130756 (= res!755480 (= (select (arr!35490 _keys!1208) i!673) k0!934))))

(declare-fun bm!48453 () Bool)

(assert (=> bm!48453 (= call!48461 (getCurrentListMapNoExtraKeys!4539 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130757 () Bool)

(assert (=> b!1130757 (= e!643521 tp_is_empty!28447)))

(declare-fun b!1130758 () Bool)

(declare-fun e!643515 () Bool)

(assert (=> b!1130758 (= e!643515 e!643511)))

(declare-fun res!755483 () Bool)

(assert (=> b!1130758 (=> res!755483 e!643511)))

(assert (=> b!1130758 (= res!755483 (not (contains!6492 lt!502045 k0!934)))))

(assert (=> b!1130758 (= lt!502045 (getCurrentListMapNoExtraKeys!4539 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48454 () Bool)

(assert (=> bm!48454 (= call!48458 call!48460)))

(declare-fun b!1130759 () Bool)

(declare-fun res!755485 () Bool)

(assert (=> b!1130759 (=> (not res!755485) (not e!643517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130759 (= res!755485 (validMask!0 mask!1564))))

(declare-fun b!1130760 () Bool)

(assert (=> b!1130760 (= e!643520 e!643515)))

(declare-fun res!755489 () Bool)

(assert (=> b!1130760 (=> res!755489 e!643515)))

(assert (=> b!1130760 (= res!755489 (not (= (select (arr!35490 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1130760 e!643519))

(declare-fun c!110063 () Bool)

(assert (=> b!1130760 (= c!110063 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502034 () Unit!36888)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!432 (array!73674 array!73676 (_ BitVec 32) (_ BitVec 32) V!43057 V!43057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36888)

(assert (=> b!1130760 (= lt!502034 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44488 () Bool)

(assert (=> mapIsEmpty!44488 mapRes!44488))

(declare-fun b!1130761 () Bool)

(declare-fun e!643510 () Bool)

(assert (=> b!1130761 (= e!643510 (not e!643513))))

(declare-fun res!755494 () Bool)

(assert (=> b!1130761 (=> res!755494 e!643513)))

(assert (=> b!1130761 (= res!755494 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130761 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502044 () Unit!36888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73674 (_ BitVec 64) (_ BitVec 32)) Unit!36888)

(assert (=> b!1130761 (= lt!502044 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!755493 () Bool)

(assert (=> start!98210 (=> (not res!755493) (not e!643517))))

(assert (=> start!98210 (= res!755493 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36028 _keys!1208))))))

(assert (=> start!98210 e!643517))

(assert (=> start!98210 tp_is_empty!28447))

(declare-fun array_inv!27300 (array!73674) Bool)

(assert (=> start!98210 (array_inv!27300 _keys!1208)))

(assert (=> start!98210 true))

(assert (=> start!98210 tp!84454))

(declare-fun e!643514 () Bool)

(declare-fun array_inv!27301 (array!73676) Bool)

(assert (=> start!98210 (and (array_inv!27301 _values!996) e!643514)))

(declare-fun bm!48451 () Bool)

(assert (=> bm!48451 (= call!48455 (getCurrentListMapNoExtraKeys!4539 lt!502040 lt!502038 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130762 () Bool)

(declare-fun res!755484 () Bool)

(assert (=> b!1130762 (=> (not res!755484) (not e!643517))))

(assert (=> b!1130762 (= res!755484 (and (= (size!36029 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36028 _keys!1208) (size!36029 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130763 () Bool)

(assert (=> b!1130763 (= e!643516 true)))

(declare-fun lt!502035 () Bool)

(declare-fun getCurrentListMap!4367 (array!73674 array!73676 (_ BitVec 32) (_ BitVec 32) V!43057 V!43057 (_ BitVec 32) Int) ListLongMap!16049)

(assert (=> b!1130763 (= lt!502035 (contains!6492 (getCurrentListMap!4367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1130764 () Bool)

(declare-fun Unit!36890 () Unit!36888)

(assert (=> b!1130764 (= e!643507 Unit!36890)))

(declare-fun b!1130765 () Bool)

(declare-fun c!110062 () Bool)

(assert (=> b!1130765 (= c!110062 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502039))))

(assert (=> b!1130765 (= e!643509 e!643507)))

(declare-fun b!1130766 () Bool)

(assert (=> b!1130766 (= e!643517 e!643510)))

(declare-fun res!755482 () Bool)

(assert (=> b!1130766 (=> (not res!755482) (not e!643510))))

(assert (=> b!1130766 (= res!755482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502040 mask!1564))))

(assert (=> b!1130766 (= lt!502040 (array!73675 (store (arr!35490 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36028 _keys!1208)))))

(declare-fun b!1130767 () Bool)

(assert (=> b!1130767 (= e!643519 (= call!48455 call!48461))))

(declare-fun b!1130768 () Bool)

(declare-fun res!755488 () Bool)

(assert (=> b!1130768 (=> (not res!755488) (not e!643510))))

(assert (=> b!1130768 (= res!755488 (arrayNoDuplicates!0 lt!502040 #b00000000000000000000000000000000 Nil!24829))))

(declare-fun b!1130769 () Bool)

(declare-fun res!755486 () Bool)

(assert (=> b!1130769 (=> (not res!755486) (not e!643517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130769 (= res!755486 (validKeyInArray!0 k0!934))))

(declare-fun bm!48455 () Bool)

(assert (=> bm!48455 (= call!48456 call!48454)))

(declare-fun bm!48456 () Bool)

(assert (=> bm!48456 (= call!48459 (addStillContains!698 (ite c!110061 lt!502046 lt!502045) (ite c!110061 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110064 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110061 minValue!944 (ite c!110064 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!48457 () Bool)

(assert (=> bm!48457 (= call!48454 (+!3481 lt!502045 (ite (or c!110061 c!110064) (tuple2!18081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1130770 () Bool)

(declare-fun res!755491 () Bool)

(assert (=> b!1130770 (=> (not res!755491) (not e!643517))))

(assert (=> b!1130770 (= res!755491 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36028 _keys!1208))))))

(declare-fun b!1130771 () Bool)

(assert (=> b!1130771 call!48458))

(declare-fun lt!502047 () Unit!36888)

(assert (=> b!1130771 (= lt!502047 call!48457)))

(assert (=> b!1130771 (= e!643509 lt!502047)))

(declare-fun b!1130772 () Bool)

(assert (=> b!1130772 (= e!643514 (and e!643512 mapRes!44488))))

(declare-fun condMapEmpty!44488 () Bool)

(declare-fun mapDefault!44488 () ValueCell!13514)

(assert (=> b!1130772 (= condMapEmpty!44488 (= (arr!35491 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13514)) mapDefault!44488)))))

(declare-fun bm!48458 () Bool)

(assert (=> bm!48458 (= call!48457 call!48459)))

(assert (= (and start!98210 res!755493) b!1130759))

(assert (= (and b!1130759 res!755485) b!1130762))

(assert (= (and b!1130762 res!755484) b!1130747))

(assert (= (and b!1130747 res!755490) b!1130750))

(assert (= (and b!1130750 res!755487) b!1130770))

(assert (= (and b!1130770 res!755491) b!1130769))

(assert (= (and b!1130769 res!755486) b!1130756))

(assert (= (and b!1130756 res!755480) b!1130766))

(assert (= (and b!1130766 res!755482) b!1130768))

(assert (= (and b!1130768 res!755488) b!1130761))

(assert (= (and b!1130761 (not res!755494)) b!1130751))

(assert (= (and b!1130751 (not res!755492)) b!1130760))

(assert (= (and b!1130760 c!110063) b!1130748))

(assert (= (and b!1130760 (not c!110063)) b!1130767))

(assert (= (or b!1130748 b!1130767) bm!48451))

(assert (= (or b!1130748 b!1130767) bm!48453))

(assert (= (and b!1130760 (not res!755489)) b!1130758))

(assert (= (and b!1130758 (not res!755483)) b!1130753))

(assert (= (and b!1130753 c!110061) b!1130749))

(assert (= (and b!1130753 (not c!110061)) b!1130752))

(assert (= (and b!1130752 c!110064) b!1130771))

(assert (= (and b!1130752 (not c!110064)) b!1130765))

(assert (= (and b!1130765 c!110062) b!1130754))

(assert (= (and b!1130765 (not c!110062)) b!1130764))

(assert (= (or b!1130771 b!1130754) bm!48458))

(assert (= (or b!1130771 b!1130754) bm!48455))

(assert (= (or b!1130771 b!1130754) bm!48454))

(assert (= (or b!1130749 bm!48454) bm!48452))

(assert (= (or b!1130749 bm!48458) bm!48456))

(assert (= (or b!1130749 bm!48455) bm!48457))

(assert (= (and b!1130753 (not res!755481)) b!1130763))

(assert (= (and b!1130772 condMapEmpty!44488) mapIsEmpty!44488))

(assert (= (and b!1130772 (not condMapEmpty!44488)) mapNonEmpty!44488))

(get-info :version)

(assert (= (and mapNonEmpty!44488 ((_ is ValueCellFull!13514) mapValue!44488)) b!1130757))

(assert (= (and b!1130772 ((_ is ValueCellFull!13514) mapDefault!44488)) b!1130755))

(assert (= start!98210 b!1130772))

(declare-fun b_lambda!18869 () Bool)

(assert (=> (not b_lambda!18869) (not b!1130751)))

(declare-fun t!35730 () Bool)

(declare-fun tb!8721 () Bool)

(assert (=> (and start!98210 (= defaultEntry!1004 defaultEntry!1004) t!35730) tb!8721))

(declare-fun result!18011 () Bool)

(assert (=> tb!8721 (= result!18011 tp_is_empty!28447)))

(assert (=> b!1130751 t!35730))

(declare-fun b_and!38597 () Bool)

(assert (= b_and!38595 (and (=> t!35730 result!18011) b_and!38597)))

(declare-fun m!1043303 () Bool)

(assert (=> bm!48452 m!1043303))

(declare-fun m!1043305 () Bool)

(assert (=> b!1130768 m!1043305))

(declare-fun m!1043307 () Bool)

(assert (=> b!1130759 m!1043307))

(declare-fun m!1043309 () Bool)

(assert (=> b!1130747 m!1043309))

(declare-fun m!1043311 () Bool)

(assert (=> b!1130756 m!1043311))

(declare-fun m!1043313 () Bool)

(assert (=> b!1130749 m!1043313))

(declare-fun m!1043315 () Bool)

(assert (=> b!1130749 m!1043315))

(assert (=> b!1130749 m!1043315))

(declare-fun m!1043317 () Bool)

(assert (=> b!1130749 m!1043317))

(declare-fun m!1043319 () Bool)

(assert (=> b!1130761 m!1043319))

(declare-fun m!1043321 () Bool)

(assert (=> b!1130761 m!1043321))

(declare-fun m!1043323 () Bool)

(assert (=> b!1130758 m!1043323))

(declare-fun m!1043325 () Bool)

(assert (=> b!1130758 m!1043325))

(declare-fun m!1043327 () Bool)

(assert (=> bm!48456 m!1043327))

(declare-fun m!1043329 () Bool)

(assert (=> bm!48457 m!1043329))

(declare-fun m!1043331 () Bool)

(assert (=> bm!48451 m!1043331))

(declare-fun m!1043333 () Bool)

(assert (=> b!1130766 m!1043333))

(declare-fun m!1043335 () Bool)

(assert (=> b!1130766 m!1043335))

(declare-fun m!1043337 () Bool)

(assert (=> b!1130751 m!1043337))

(declare-fun m!1043339 () Bool)

(assert (=> b!1130751 m!1043339))

(declare-fun m!1043341 () Bool)

(assert (=> b!1130751 m!1043341))

(declare-fun m!1043343 () Bool)

(assert (=> b!1130751 m!1043343))

(declare-fun m!1043345 () Bool)

(assert (=> mapNonEmpty!44488 m!1043345))

(declare-fun m!1043347 () Bool)

(assert (=> b!1130769 m!1043347))

(declare-fun m!1043349 () Bool)

(assert (=> b!1130763 m!1043349))

(assert (=> b!1130763 m!1043349))

(declare-fun m!1043351 () Bool)

(assert (=> b!1130763 m!1043351))

(declare-fun m!1043353 () Bool)

(assert (=> start!98210 m!1043353))

(declare-fun m!1043355 () Bool)

(assert (=> start!98210 m!1043355))

(declare-fun m!1043357 () Bool)

(assert (=> b!1130748 m!1043357))

(assert (=> bm!48453 m!1043325))

(declare-fun m!1043359 () Bool)

(assert (=> b!1130750 m!1043359))

(declare-fun m!1043361 () Bool)

(assert (=> b!1130760 m!1043361))

(declare-fun m!1043363 () Bool)

(assert (=> b!1130760 m!1043363))

(check-sat (not b!1130761) (not bm!48456) b_and!38597 (not b!1130748) (not b!1130749) (not start!98210) (not b_lambda!18869) (not b!1130766) (not b!1130769) (not bm!48451) (not b!1130760) (not b!1130750) (not b!1130768) (not bm!48457) tp_is_empty!28447 (not b!1130763) (not b!1130747) (not b!1130759) (not bm!48453) (not b!1130751) (not bm!48452) (not b_next!23917) (not b!1130758) (not mapNonEmpty!44488))
(check-sat b_and!38597 (not b_next!23917))
