; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98614 () Bool)

(assert start!98614)

(declare-fun b_free!23983 () Bool)

(declare-fun b_next!23983 () Bool)

(assert (=> start!98614 (= b_free!23983 (not b_next!23983))))

(declare-fun tp!84660 () Bool)

(declare-fun b_and!38817 () Bool)

(assert (=> start!98614 (= tp!84660 b_and!38817)))

(declare-fun b!1135701 () Bool)

(declare-fun res!757847 () Bool)

(declare-fun e!646435 () Bool)

(assert (=> b!1135701 (=> (not res!757847) (not e!646435))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135701 (= res!757847 (validKeyInArray!0 k0!934))))

(declare-fun b!1135702 () Bool)

(declare-datatypes ((Unit!37135 0))(
  ( (Unit!37136) )
))
(declare-fun e!646447 () Unit!37135)

(declare-fun Unit!37137 () Unit!37135)

(assert (=> b!1135702 (= e!646447 Unit!37137)))

(declare-fun b!1135703 () Bool)

(declare-fun e!646440 () Bool)

(declare-fun e!646444 () Bool)

(declare-fun mapRes!44594 () Bool)

(assert (=> b!1135703 (= e!646440 (and e!646444 mapRes!44594))))

(declare-fun condMapEmpty!44594 () Bool)

(declare-datatypes ((V!43145 0))(
  ( (V!43146 (val!14313 Int)) )
))
(declare-datatypes ((ValueCell!13547 0))(
  ( (ValueCellFull!13547 (v!16946 V!43145)) (EmptyCell!13547) )
))
(declare-datatypes ((array!73929 0))(
  ( (array!73930 (arr!35609 (Array (_ BitVec 32) ValueCell!13547)) (size!36146 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73929)

(declare-fun mapDefault!44594 () ValueCell!13547)

(assert (=> b!1135703 (= condMapEmpty!44594 (= (arr!35609 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13547)) mapDefault!44594)))))

(declare-fun b!1135704 () Bool)

(declare-fun res!757843 () Bool)

(assert (=> b!1135704 (=> (not res!757843) (not e!646435))))

(declare-datatypes ((array!73931 0))(
  ( (array!73932 (arr!35610 (Array (_ BitVec 32) (_ BitVec 64))) (size!36147 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73931)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73931 (_ BitVec 32)) Bool)

(assert (=> b!1135704 (= res!757843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((tuple2!18068 0))(
  ( (tuple2!18069 (_1!9045 (_ BitVec 64)) (_2!9045 V!43145)) )
))
(declare-datatypes ((List!24835 0))(
  ( (Nil!24832) (Cons!24831 (h!26049 tuple2!18068) (t!35802 List!24835)) )
))
(declare-datatypes ((ListLongMap!16045 0))(
  ( (ListLongMap!16046 (toList!8038 List!24835)) )
))
(declare-fun call!49407 () ListLongMap!16045)

(declare-fun lt!504692 () ListLongMap!16045)

(declare-fun bm!49400 () Bool)

(declare-fun c!111176 () Bool)

(declare-fun call!49405 () Bool)

(declare-fun contains!6573 (ListLongMap!16045 (_ BitVec 64)) Bool)

(assert (=> bm!49400 (= call!49405 (contains!6573 (ite c!111176 lt!504692 call!49407) k0!934))))

(declare-fun b!1135705 () Bool)

(declare-fun res!757836 () Bool)

(assert (=> b!1135705 (=> (not res!757836) (not e!646435))))

(declare-datatypes ((List!24836 0))(
  ( (Nil!24833) (Cons!24832 (h!26050 (_ BitVec 64)) (t!35803 List!24836)) )
))
(declare-fun arrayNoDuplicates!0 (array!73931 (_ BitVec 32) List!24836) Bool)

(assert (=> b!1135705 (= res!757836 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24833))))

(declare-fun b!1135706 () Bool)

(declare-fun e!646441 () Bool)

(declare-fun tp_is_empty!28513 () Bool)

(assert (=> b!1135706 (= e!646441 tp_is_empty!28513)))

(declare-fun zeroValue!944 () V!43145)

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!49409 () ListLongMap!16045)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43145)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!49401 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4550 (array!73931 array!73929 (_ BitVec 32) (_ BitVec 32) V!43145 V!43145 (_ BitVec 32) Int) ListLongMap!16045)

(assert (=> bm!49401 (= call!49409 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135707 () Bool)

(declare-fun e!646449 () Bool)

(declare-fun e!646434 () Bool)

(assert (=> b!1135707 (= e!646449 e!646434)))

(declare-fun res!757849 () Bool)

(assert (=> b!1135707 (=> res!757849 e!646434)))

(declare-fun lt!504689 () ListLongMap!16045)

(assert (=> b!1135707 (= res!757849 (not (contains!6573 lt!504689 k0!934)))))

(assert (=> b!1135707 (= lt!504689 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135708 () Bool)

(declare-fun e!646436 () Bool)

(declare-fun arrayContainsKey!0 (array!73931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135708 (= e!646436 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!504686 () Bool)

(declare-fun b!1135709 () Bool)

(assert (=> b!1135709 (= e!646436 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504686) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!757848 () Bool)

(assert (=> start!98614 (=> (not res!757848) (not e!646435))))

(assert (=> start!98614 (= res!757848 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36147 _keys!1208))))))

(assert (=> start!98614 e!646435))

(assert (=> start!98614 tp_is_empty!28513))

(declare-fun array_inv!27362 (array!73931) Bool)

(assert (=> start!98614 (array_inv!27362 _keys!1208)))

(assert (=> start!98614 true))

(assert (=> start!98614 tp!84660))

(declare-fun array_inv!27363 (array!73929) Bool)

(assert (=> start!98614 (and (array_inv!27363 _values!996) e!646440)))

(declare-fun b!1135710 () Bool)

(declare-fun e!646438 () Bool)

(declare-fun e!646439 () Bool)

(assert (=> b!1135710 (= e!646438 (not e!646439))))

(declare-fun res!757838 () Bool)

(assert (=> b!1135710 (=> res!757838 e!646439)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135710 (= res!757838 (bvsgt from!1455 i!673))))

(assert (=> b!1135710 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504695 () Unit!37135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73931 (_ BitVec 64) (_ BitVec 32)) Unit!37135)

(assert (=> b!1135710 (= lt!504695 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!49402 () Bool)

(declare-fun lt!504696 () array!73931)

(declare-fun lt!504683 () array!73929)

(declare-fun call!49406 () ListLongMap!16045)

(assert (=> bm!49402 (= call!49406 (getCurrentListMapNoExtraKeys!4550 lt!504696 lt!504683 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135711 () Bool)

(declare-fun res!757850 () Bool)

(assert (=> b!1135711 (=> (not res!757850) (not e!646435))))

(assert (=> b!1135711 (= res!757850 (= (select (arr!35610 _keys!1208) i!673) k0!934))))

(declare-fun b!1135712 () Bool)

(assert (=> b!1135712 (= e!646444 tp_is_empty!28513)))

(declare-fun b!1135713 () Bool)

(declare-fun res!757851 () Bool)

(assert (=> b!1135713 (=> (not res!757851) (not e!646438))))

(assert (=> b!1135713 (= res!757851 (arrayNoDuplicates!0 lt!504696 #b00000000000000000000000000000000 Nil!24833))))

(declare-fun mapNonEmpty!44594 () Bool)

(declare-fun tp!84659 () Bool)

(assert (=> mapNonEmpty!44594 (= mapRes!44594 (and tp!84659 e!646441))))

(declare-fun mapRest!44594 () (Array (_ BitVec 32) ValueCell!13547))

(declare-fun mapValue!44594 () ValueCell!13547)

(declare-fun mapKey!44594 () (_ BitVec 32))

(assert (=> mapNonEmpty!44594 (= (arr!35609 _values!996) (store mapRest!44594 mapKey!44594 mapValue!44594))))

(declare-fun c!111173 () Bool)

(declare-fun bm!49403 () Bool)

(declare-fun call!49403 () ListLongMap!16045)

(declare-fun +!3496 (ListLongMap!16045 tuple2!18068) ListLongMap!16045)

(assert (=> bm!49403 (= call!49403 (+!3496 (ite c!111176 lt!504692 lt!504689) (ite c!111176 (tuple2!18069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111173 (tuple2!18069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1135714 () Bool)

(declare-fun e!646445 () Bool)

(assert (=> b!1135714 (= e!646445 true)))

(declare-fun lt!504685 () Bool)

(declare-fun contains!6574 (List!24836 (_ BitVec 64)) Bool)

(assert (=> b!1135714 (= lt!504685 (contains!6574 Nil!24833 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135715 () Bool)

(declare-fun e!646448 () Bool)

(assert (=> b!1135715 (= e!646448 (= call!49406 call!49409))))

(declare-fun call!49404 () Unit!37135)

(declare-fun bm!49404 () Bool)

(declare-fun addStillContains!722 (ListLongMap!16045 (_ BitVec 64) V!43145 (_ BitVec 64)) Unit!37135)

(assert (=> bm!49404 (= call!49404 (addStillContains!722 (ite c!111176 lt!504692 lt!504689) (ite c!111176 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111173 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111176 minValue!944 (ite c!111173 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1135716 () Bool)

(declare-fun res!757842 () Bool)

(assert (=> b!1135716 (=> (not res!757842) (not e!646435))))

(assert (=> b!1135716 (= res!757842 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36147 _keys!1208))))))

(declare-fun e!646450 () Bool)

(declare-fun b!1135717 () Bool)

(assert (=> b!1135717 (= e!646450 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135718 () Bool)

(assert (=> b!1135718 (= e!646434 e!646445)))

(declare-fun res!757845 () Bool)

(assert (=> b!1135718 (=> res!757845 e!646445)))

(assert (=> b!1135718 (= res!757845 (or (bvsge (size!36147 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36147 _keys!1208)) (bvsge from!1455 (size!36147 _keys!1208))))))

(assert (=> b!1135718 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24833)))

(declare-fun lt!504697 () Unit!37135)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73931 (_ BitVec 32) (_ BitVec 32)) Unit!37135)

(assert (=> b!1135718 (= lt!504697 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1135718 e!646450))

(declare-fun res!757844 () Bool)

(assert (=> b!1135718 (=> (not res!757844) (not e!646450))))

(assert (=> b!1135718 (= res!757844 e!646436)))

(declare-fun c!111174 () Bool)

(assert (=> b!1135718 (= c!111174 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504694 () Unit!37135)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!332 (array!73931 array!73929 (_ BitVec 32) (_ BitVec 32) V!43145 V!43145 (_ BitVec 64) (_ BitVec 32) Int) Unit!37135)

(assert (=> b!1135718 (= lt!504694 (lemmaListMapContainsThenArrayContainsFrom!332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504688 () Unit!37135)

(declare-fun e!646437 () Unit!37135)

(assert (=> b!1135718 (= lt!504688 e!646437)))

(assert (=> b!1135718 (= c!111176 (and (not lt!504686) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135718 (= lt!504686 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1135719 () Bool)

(declare-fun e!646442 () Bool)

(assert (=> b!1135719 (= e!646442 e!646449)))

(declare-fun res!757839 () Bool)

(assert (=> b!1135719 (=> res!757839 e!646449)))

(assert (=> b!1135719 (= res!757839 (not (= (select (arr!35610 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1135719 e!646448))

(declare-fun c!111177 () Bool)

(assert (=> b!1135719 (= c!111177 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504687 () Unit!37135)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!444 (array!73931 array!73929 (_ BitVec 32) (_ BitVec 32) V!43145 V!43145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37135)

(assert (=> b!1135719 (= lt!504687 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135720 () Bool)

(assert (=> b!1135720 (= e!646435 e!646438)))

(declare-fun res!757840 () Bool)

(assert (=> b!1135720 (=> (not res!757840) (not e!646438))))

(assert (=> b!1135720 (= res!757840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504696 mask!1564))))

(assert (=> b!1135720 (= lt!504696 (array!73932 (store (arr!35610 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36147 _keys!1208)))))

(declare-fun b!1135721 () Bool)

(declare-fun -!1188 (ListLongMap!16045 (_ BitVec 64)) ListLongMap!16045)

(assert (=> b!1135721 (= e!646448 (= call!49406 (-!1188 call!49409 k0!934)))))

(declare-fun b!1135722 () Bool)

(declare-fun lt!504693 () Unit!37135)

(assert (=> b!1135722 (= e!646437 lt!504693)))

(declare-fun lt!504681 () Unit!37135)

(assert (=> b!1135722 (= lt!504681 (addStillContains!722 lt!504689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1135722 (= lt!504692 (+!3496 lt!504689 (tuple2!18069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1135722 call!49405))

(assert (=> b!1135722 (= lt!504693 call!49404)))

(assert (=> b!1135722 (contains!6573 call!49403 k0!934)))

(declare-fun bm!49405 () Bool)

(assert (=> bm!49405 (= call!49407 call!49403)))

(declare-fun b!1135723 () Bool)

(assert (=> b!1135723 (= e!646439 e!646442)))

(declare-fun res!757837 () Bool)

(assert (=> b!1135723 (=> res!757837 e!646442)))

(assert (=> b!1135723 (= res!757837 (not (= from!1455 i!673)))))

(declare-fun lt!504691 () ListLongMap!16045)

(assert (=> b!1135723 (= lt!504691 (getCurrentListMapNoExtraKeys!4550 lt!504696 lt!504683 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2606 (Int (_ BitVec 64)) V!43145)

(assert (=> b!1135723 (= lt!504683 (array!73930 (store (arr!35609 _values!996) i!673 (ValueCellFull!13547 (dynLambda!2606 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36146 _values!996)))))

(declare-fun lt!504690 () ListLongMap!16045)

(assert (=> b!1135723 (= lt!504690 (getCurrentListMapNoExtraKeys!4550 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44594 () Bool)

(assert (=> mapIsEmpty!44594 mapRes!44594))

(declare-fun b!1135724 () Bool)

(declare-fun res!757834 () Bool)

(assert (=> b!1135724 (=> res!757834 e!646445)))

(declare-fun noDuplicate!1605 (List!24836) Bool)

(assert (=> b!1135724 (= res!757834 (not (noDuplicate!1605 Nil!24833)))))

(declare-fun b!1135725 () Bool)

(declare-fun e!646446 () Unit!37135)

(assert (=> b!1135725 (= e!646437 e!646446)))

(assert (=> b!1135725 (= c!111173 (and (not lt!504686) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!49406 () Bool)

(declare-fun call!49410 () Bool)

(assert (=> bm!49406 (= call!49410 call!49405)))

(declare-fun b!1135726 () Bool)

(declare-fun res!757835 () Bool)

(assert (=> b!1135726 (=> res!757835 e!646445)))

(assert (=> b!1135726 (= res!757835 (contains!6574 Nil!24833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135727 () Bool)

(declare-fun c!111175 () Bool)

(assert (=> b!1135727 (= c!111175 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504686))))

(assert (=> b!1135727 (= e!646446 e!646447)))

(declare-fun b!1135728 () Bool)

(declare-fun lt!504682 () Unit!37135)

(assert (=> b!1135728 (= e!646447 lt!504682)))

(declare-fun call!49408 () Unit!37135)

(assert (=> b!1135728 (= lt!504682 call!49408)))

(assert (=> b!1135728 call!49410))

(declare-fun b!1135729 () Bool)

(assert (=> b!1135729 call!49410))

(declare-fun lt!504684 () Unit!37135)

(assert (=> b!1135729 (= lt!504684 call!49408)))

(assert (=> b!1135729 (= e!646446 lt!504684)))

(declare-fun b!1135730 () Bool)

(declare-fun res!757846 () Bool)

(assert (=> b!1135730 (=> (not res!757846) (not e!646435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135730 (= res!757846 (validMask!0 mask!1564))))

(declare-fun bm!49407 () Bool)

(assert (=> bm!49407 (= call!49408 call!49404)))

(declare-fun b!1135731 () Bool)

(declare-fun res!757841 () Bool)

(assert (=> b!1135731 (=> (not res!757841) (not e!646435))))

(assert (=> b!1135731 (= res!757841 (and (= (size!36146 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36147 _keys!1208) (size!36146 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98614 res!757848) b!1135730))

(assert (= (and b!1135730 res!757846) b!1135731))

(assert (= (and b!1135731 res!757841) b!1135704))

(assert (= (and b!1135704 res!757843) b!1135705))

(assert (= (and b!1135705 res!757836) b!1135716))

(assert (= (and b!1135716 res!757842) b!1135701))

(assert (= (and b!1135701 res!757847) b!1135711))

(assert (= (and b!1135711 res!757850) b!1135720))

(assert (= (and b!1135720 res!757840) b!1135713))

(assert (= (and b!1135713 res!757851) b!1135710))

(assert (= (and b!1135710 (not res!757838)) b!1135723))

(assert (= (and b!1135723 (not res!757837)) b!1135719))

(assert (= (and b!1135719 c!111177) b!1135721))

(assert (= (and b!1135719 (not c!111177)) b!1135715))

(assert (= (or b!1135721 b!1135715) bm!49402))

(assert (= (or b!1135721 b!1135715) bm!49401))

(assert (= (and b!1135719 (not res!757839)) b!1135707))

(assert (= (and b!1135707 (not res!757849)) b!1135718))

(assert (= (and b!1135718 c!111176) b!1135722))

(assert (= (and b!1135718 (not c!111176)) b!1135725))

(assert (= (and b!1135725 c!111173) b!1135729))

(assert (= (and b!1135725 (not c!111173)) b!1135727))

(assert (= (and b!1135727 c!111175) b!1135728))

(assert (= (and b!1135727 (not c!111175)) b!1135702))

(assert (= (or b!1135729 b!1135728) bm!49407))

(assert (= (or b!1135729 b!1135728) bm!49405))

(assert (= (or b!1135729 b!1135728) bm!49406))

(assert (= (or b!1135722 bm!49406) bm!49400))

(assert (= (or b!1135722 bm!49407) bm!49404))

(assert (= (or b!1135722 bm!49405) bm!49403))

(assert (= (and b!1135718 c!111174) b!1135708))

(assert (= (and b!1135718 (not c!111174)) b!1135709))

(assert (= (and b!1135718 res!757844) b!1135717))

(assert (= (and b!1135718 (not res!757845)) b!1135724))

(assert (= (and b!1135724 (not res!757834)) b!1135726))

(assert (= (and b!1135726 (not res!757835)) b!1135714))

(assert (= (and b!1135703 condMapEmpty!44594) mapIsEmpty!44594))

(assert (= (and b!1135703 (not condMapEmpty!44594)) mapNonEmpty!44594))

(get-info :version)

(assert (= (and mapNonEmpty!44594 ((_ is ValueCellFull!13547) mapValue!44594)) b!1135706))

(assert (= (and b!1135703 ((_ is ValueCellFull!13547) mapDefault!44594)) b!1135712))

(assert (= start!98614 b!1135703))

(declare-fun b_lambda!19083 () Bool)

(assert (=> (not b_lambda!19083) (not b!1135723)))

(declare-fun t!35801 () Bool)

(declare-fun tb!8787 () Bool)

(assert (=> (and start!98614 (= defaultEntry!1004 defaultEntry!1004) t!35801) tb!8787))

(declare-fun result!18147 () Bool)

(assert (=> tb!8787 (= result!18147 tp_is_empty!28513)))

(assert (=> b!1135723 t!35801))

(declare-fun b_and!38819 () Bool)

(assert (= b_and!38817 (and (=> t!35801 result!18147) b_and!38819)))

(declare-fun m!1048803 () Bool)

(assert (=> bm!49403 m!1048803))

(declare-fun m!1048805 () Bool)

(assert (=> b!1135726 m!1048805))

(declare-fun m!1048807 () Bool)

(assert (=> b!1135718 m!1048807))

(declare-fun m!1048809 () Bool)

(assert (=> b!1135718 m!1048809))

(declare-fun m!1048811 () Bool)

(assert (=> b!1135718 m!1048811))

(declare-fun m!1048813 () Bool)

(assert (=> b!1135714 m!1048813))

(declare-fun m!1048815 () Bool)

(assert (=> b!1135724 m!1048815))

(declare-fun m!1048817 () Bool)

(assert (=> b!1135708 m!1048817))

(declare-fun m!1048819 () Bool)

(assert (=> mapNonEmpty!44594 m!1048819))

(declare-fun m!1048821 () Bool)

(assert (=> b!1135720 m!1048821))

(declare-fun m!1048823 () Bool)

(assert (=> b!1135720 m!1048823))

(declare-fun m!1048825 () Bool)

(assert (=> b!1135730 m!1048825))

(declare-fun m!1048827 () Bool)

(assert (=> b!1135707 m!1048827))

(declare-fun m!1048829 () Bool)

(assert (=> b!1135707 m!1048829))

(declare-fun m!1048831 () Bool)

(assert (=> b!1135710 m!1048831))

(declare-fun m!1048833 () Bool)

(assert (=> b!1135710 m!1048833))

(declare-fun m!1048835 () Bool)

(assert (=> bm!49400 m!1048835))

(assert (=> b!1135717 m!1048817))

(declare-fun m!1048837 () Bool)

(assert (=> b!1135711 m!1048837))

(declare-fun m!1048839 () Bool)

(assert (=> b!1135701 m!1048839))

(declare-fun m!1048841 () Bool)

(assert (=> bm!49404 m!1048841))

(declare-fun m!1048843 () Bool)

(assert (=> b!1135713 m!1048843))

(declare-fun m!1048845 () Bool)

(assert (=> b!1135722 m!1048845))

(declare-fun m!1048847 () Bool)

(assert (=> b!1135722 m!1048847))

(declare-fun m!1048849 () Bool)

(assert (=> b!1135722 m!1048849))

(declare-fun m!1048851 () Bool)

(assert (=> b!1135723 m!1048851))

(declare-fun m!1048853 () Bool)

(assert (=> b!1135723 m!1048853))

(declare-fun m!1048855 () Bool)

(assert (=> b!1135723 m!1048855))

(declare-fun m!1048857 () Bool)

(assert (=> b!1135723 m!1048857))

(declare-fun m!1048859 () Bool)

(assert (=> b!1135721 m!1048859))

(declare-fun m!1048861 () Bool)

(assert (=> start!98614 m!1048861))

(declare-fun m!1048863 () Bool)

(assert (=> start!98614 m!1048863))

(declare-fun m!1048865 () Bool)

(assert (=> bm!49402 m!1048865))

(declare-fun m!1048867 () Bool)

(assert (=> b!1135719 m!1048867))

(declare-fun m!1048869 () Bool)

(assert (=> b!1135719 m!1048869))

(declare-fun m!1048871 () Bool)

(assert (=> b!1135704 m!1048871))

(declare-fun m!1048873 () Bool)

(assert (=> b!1135705 m!1048873))

(assert (=> bm!49401 m!1048829))

(check-sat (not b!1135714) (not b!1135708) (not bm!49401) (not b_next!23983) tp_is_empty!28513 (not b!1135723) (not b!1135718) (not b!1135724) (not b!1135705) (not bm!49400) (not mapNonEmpty!44594) (not b!1135720) (not b!1135719) (not bm!49403) (not b!1135707) (not b!1135722) (not b!1135730) (not b!1135704) (not b!1135701) (not bm!49402) b_and!38819 (not b!1135717) (not start!98614) (not b!1135713) (not b_lambda!19083) (not bm!49404) (not b!1135726) (not b!1135710) (not b!1135721))
(check-sat b_and!38819 (not b_next!23983))
