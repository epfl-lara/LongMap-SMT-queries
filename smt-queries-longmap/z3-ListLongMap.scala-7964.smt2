; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98626 () Bool)

(assert start!98626)

(declare-fun b_free!24231 () Bool)

(declare-fun b_next!24231 () Bool)

(assert (=> start!98626 (= b_free!24231 (not b_next!24231))))

(declare-fun tp!85404 () Bool)

(declare-fun b_and!39311 () Bool)

(assert (=> start!98626 (= tp!85404 b_and!39311)))

(declare-fun b!1145638 () Bool)

(declare-fun res!762870 () Bool)

(declare-fun e!651689 () Bool)

(assert (=> b!1145638 (=> (not res!762870) (not e!651689))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1145638 (= res!762870 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44966 () Bool)

(declare-fun mapRes!44966 () Bool)

(declare-fun tp!85403 () Bool)

(declare-fun e!651677 () Bool)

(assert (=> mapNonEmpty!44966 (= mapRes!44966 (and tp!85403 e!651677))))

(declare-datatypes ((V!43475 0))(
  ( (V!43476 (val!14437 Int)) )
))
(declare-datatypes ((ValueCell!13671 0))(
  ( (ValueCellFull!13671 (v!17074 V!43475)) (EmptyCell!13671) )
))
(declare-fun mapValue!44966 () ValueCell!13671)

(declare-datatypes ((array!74373 0))(
  ( (array!74374 (arr!35837 (Array (_ BitVec 32) ValueCell!13671)) (size!36373 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74373)

(declare-fun mapKey!44966 () (_ BitVec 32))

(declare-fun mapRest!44966 () (Array (_ BitVec 32) ValueCell!13671))

(assert (=> mapNonEmpty!44966 (= (arr!35837 _values!996) (store mapRest!44966 mapKey!44966 mapValue!44966))))

(declare-fun b!1145639 () Bool)

(declare-fun res!762874 () Bool)

(assert (=> b!1145639 (=> (not res!762874) (not e!651689))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1145639 (= res!762874 (validMask!0 mask!1564))))

(declare-fun b!1145640 () Bool)

(declare-datatypes ((Unit!37614 0))(
  ( (Unit!37615) )
))
(declare-fun e!651679 () Unit!37614)

(declare-fun lt!511470 () Unit!37614)

(assert (=> b!1145640 (= e!651679 lt!511470)))

(declare-fun call!52314 () Unit!37614)

(assert (=> b!1145640 (= lt!511470 call!52314)))

(declare-fun call!52320 () Bool)

(assert (=> b!1145640 call!52320))

(declare-fun b!1145641 () Bool)

(declare-fun e!651690 () Bool)

(assert (=> b!1145641 (= e!651689 e!651690)))

(declare-fun res!762875 () Bool)

(assert (=> b!1145641 (=> (not res!762875) (not e!651690))))

(declare-datatypes ((array!74375 0))(
  ( (array!74376 (arr!35838 (Array (_ BitVec 32) (_ BitVec 64))) (size!36374 (_ BitVec 32))) )
))
(declare-fun lt!511481 () array!74375)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74375 (_ BitVec 32)) Bool)

(assert (=> b!1145641 (= res!762875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511481 mask!1564))))

(declare-fun _keys!1208 () array!74375)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1145641 (= lt!511481 (array!74376 (store (arr!35838 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36374 _keys!1208)))))

(declare-fun b!1145643 () Bool)

(declare-fun e!651676 () Unit!37614)

(declare-fun Unit!37616 () Unit!37614)

(assert (=> b!1145643 (= e!651676 Unit!37616)))

(declare-fun lt!511487 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1145643 (= lt!511487 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112941 () Bool)

(assert (=> b!1145643 (= c!112941 (and (not lt!511487) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511485 () Unit!37614)

(declare-fun e!651675 () Unit!37614)

(assert (=> b!1145643 (= lt!511485 e!651675)))

(declare-fun zeroValue!944 () V!43475)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!511482 () Unit!37614)

(declare-fun minValue!944 () V!43475)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!417 (array!74375 array!74373 (_ BitVec 32) (_ BitVec 32) V!43475 V!43475 (_ BitVec 64) (_ BitVec 32) Int) Unit!37614)

(assert (=> b!1145643 (= lt!511482 (lemmaListMapContainsThenArrayContainsFrom!417 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112939 () Bool)

(assert (=> b!1145643 (= c!112939 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762872 () Bool)

(declare-fun e!651688 () Bool)

(assert (=> b!1145643 (= res!762872 e!651688)))

(declare-fun e!651680 () Bool)

(assert (=> b!1145643 (=> (not res!762872) (not e!651680))))

(assert (=> b!1145643 e!651680))

(declare-fun lt!511477 () Unit!37614)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74375 (_ BitVec 32) (_ BitVec 32)) Unit!37614)

(assert (=> b!1145643 (= lt!511477 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25041 0))(
  ( (Nil!25038) (Cons!25037 (h!26246 (_ BitVec 64)) (t!36264 List!25041)) )
))
(declare-fun arrayNoDuplicates!0 (array!74375 (_ BitVec 32) List!25041) Bool)

(assert (=> b!1145643 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25038)))

(declare-fun lt!511476 () Unit!37614)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74375 (_ BitVec 64) (_ BitVec 32) List!25041) Unit!37614)

(assert (=> b!1145643 (= lt!511476 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25038))))

(assert (=> b!1145643 false))

(declare-fun bm!52311 () Bool)

(declare-fun call!52319 () Unit!37614)

(assert (=> bm!52311 (= call!52314 call!52319)))

(declare-fun b!1145644 () Bool)

(declare-fun res!762864 () Bool)

(assert (=> b!1145644 (=> (not res!762864) (not e!651689))))

(assert (=> b!1145644 (= res!762864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1145645 () Bool)

(declare-fun res!762878 () Bool)

(assert (=> b!1145645 (=> (not res!762878) (not e!651689))))

(assert (=> b!1145645 (= res!762878 (and (= (size!36373 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36374 _keys!1208) (size!36373 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1145646 () Bool)

(declare-fun tp_is_empty!28761 () Bool)

(assert (=> b!1145646 (= e!651677 tp_is_empty!28761)))

(declare-datatypes ((tuple2!18288 0))(
  ( (tuple2!18289 (_1!9155 (_ BitVec 64)) (_2!9155 V!43475)) )
))
(declare-datatypes ((List!25042 0))(
  ( (Nil!25039) (Cons!25038 (h!26247 tuple2!18288) (t!36265 List!25042)) )
))
(declare-datatypes ((ListLongMap!16257 0))(
  ( (ListLongMap!16258 (toList!8144 List!25042)) )
))
(declare-fun lt!511488 () ListLongMap!16257)

(declare-fun c!112938 () Bool)

(declare-fun bm!52312 () Bool)

(declare-fun addStillContains!824 (ListLongMap!16257 (_ BitVec 64) V!43475 (_ BitVec 64)) Unit!37614)

(assert (=> bm!52312 (= call!52319 (addStillContains!824 lt!511488 (ite (or c!112941 c!112938) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112941 c!112938) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1145647 () Bool)

(declare-fun arrayContainsKey!0 (array!74375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1145647 (= e!651680 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145648 () Bool)

(declare-fun e!651683 () Bool)

(declare-fun e!651687 () Bool)

(assert (=> b!1145648 (= e!651683 e!651687)))

(declare-fun res!762869 () Bool)

(assert (=> b!1145648 (=> res!762869 e!651687)))

(assert (=> b!1145648 (= res!762869 (not (= (select (arr!35838 _keys!1208) from!1455) k0!934)))))

(declare-fun e!651685 () Bool)

(assert (=> b!1145648 e!651685))

(declare-fun c!112942 () Bool)

(assert (=> b!1145648 (= c!112942 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!511479 () Unit!37614)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!523 (array!74375 array!74373 (_ BitVec 32) (_ BitVec 32) V!43475 V!43475 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37614)

(assert (=> b!1145648 (= lt!511479 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!523 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145649 () Bool)

(declare-fun e!651674 () Bool)

(declare-fun e!651684 () Bool)

(assert (=> b!1145649 (= e!651674 (and e!651684 mapRes!44966))))

(declare-fun condMapEmpty!44966 () Bool)

(declare-fun mapDefault!44966 () ValueCell!13671)

(assert (=> b!1145649 (= condMapEmpty!44966 (= (arr!35837 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13671)) mapDefault!44966)))))

(declare-fun call!52317 () ListLongMap!16257)

(declare-fun call!52316 () ListLongMap!16257)

(declare-fun b!1145650 () Bool)

(declare-fun -!1284 (ListLongMap!16257 (_ BitVec 64)) ListLongMap!16257)

(assert (=> b!1145650 (= e!651685 (= call!52317 (-!1284 call!52316 k0!934)))))

(declare-fun b!1145651 () Bool)

(assert (=> b!1145651 (= e!651687 true)))

(declare-fun e!651681 () Bool)

(assert (=> b!1145651 e!651681))

(declare-fun res!762865 () Bool)

(assert (=> b!1145651 (=> (not res!762865) (not e!651681))))

(declare-fun lt!511471 () V!43475)

(declare-fun +!3570 (ListLongMap!16257 tuple2!18288) ListLongMap!16257)

(assert (=> b!1145651 (= res!762865 (= (-!1284 (+!3570 lt!511488 (tuple2!18289 (select (arr!35838 _keys!1208) from!1455) lt!511471)) (select (arr!35838 _keys!1208) from!1455)) lt!511488))))

(declare-fun lt!511474 () Unit!37614)

(declare-fun addThenRemoveForNewKeyIsSame!134 (ListLongMap!16257 (_ BitVec 64) V!43475) Unit!37614)

(assert (=> b!1145651 (= lt!511474 (addThenRemoveForNewKeyIsSame!134 lt!511488 (select (arr!35838 _keys!1208) from!1455) lt!511471))))

(declare-fun lt!511478 () V!43475)

(declare-fun get!18224 (ValueCell!13671 V!43475) V!43475)

(assert (=> b!1145651 (= lt!511471 (get!18224 (select (arr!35837 _values!996) from!1455) lt!511478))))

(declare-fun lt!511469 () Unit!37614)

(assert (=> b!1145651 (= lt!511469 e!651676)))

(declare-fun c!112937 () Bool)

(declare-fun contains!6672 (ListLongMap!16257 (_ BitVec 64)) Bool)

(assert (=> b!1145651 (= c!112937 (contains!6672 lt!511488 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4620 (array!74375 array!74373 (_ BitVec 32) (_ BitVec 32) V!43475 V!43475 (_ BitVec 32) Int) ListLongMap!16257)

(assert (=> b!1145651 (= lt!511488 (getCurrentListMapNoExtraKeys!4620 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52313 () Bool)

(declare-fun call!52315 () ListLongMap!16257)

(declare-fun call!52318 () ListLongMap!16257)

(assert (=> bm!52313 (= call!52315 call!52318)))

(declare-fun b!1145652 () Bool)

(assert (=> b!1145652 (contains!6672 call!52318 k0!934)))

(declare-fun lt!511468 () ListLongMap!16257)

(declare-fun lt!511473 () Unit!37614)

(assert (=> b!1145652 (= lt!511473 (addStillContains!824 lt!511468 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!52321 () Bool)

(assert (=> b!1145652 call!52321))

(assert (=> b!1145652 (= lt!511468 (+!3570 lt!511488 (tuple2!18289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511486 () Unit!37614)

(assert (=> b!1145652 (= lt!511486 call!52319)))

(assert (=> b!1145652 (= e!651675 lt!511473)))

(declare-fun b!1145653 () Bool)

(declare-fun Unit!37617 () Unit!37614)

(assert (=> b!1145653 (= e!651676 Unit!37617)))

(declare-fun bm!52314 () Bool)

(assert (=> bm!52314 (= call!52318 (+!3570 (ite c!112941 lt!511468 lt!511488) (ite c!112941 (tuple2!18289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112938 (tuple2!18289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1145654 () Bool)

(declare-fun res!762871 () Bool)

(assert (=> b!1145654 (=> (not res!762871) (not e!651689))))

(assert (=> b!1145654 (= res!762871 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36374 _keys!1208))))))

(declare-fun b!1145655 () Bool)

(assert (=> b!1145655 (= e!651688 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!511487) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1145642 () Bool)

(assert (=> b!1145642 (= e!651685 (= call!52317 call!52316))))

(declare-fun res!762877 () Bool)

(assert (=> start!98626 (=> (not res!762877) (not e!651689))))

(assert (=> start!98626 (= res!762877 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36374 _keys!1208))))))

(assert (=> start!98626 e!651689))

(assert (=> start!98626 tp_is_empty!28761))

(declare-fun array_inv!27456 (array!74375) Bool)

(assert (=> start!98626 (array_inv!27456 _keys!1208)))

(assert (=> start!98626 true))

(assert (=> start!98626 tp!85404))

(declare-fun array_inv!27457 (array!74373) Bool)

(assert (=> start!98626 (and (array_inv!27457 _values!996) e!651674)))

(declare-fun b!1145656 () Bool)

(assert (=> b!1145656 call!52320))

(declare-fun lt!511483 () Unit!37614)

(assert (=> b!1145656 (= lt!511483 call!52314)))

(declare-fun e!651678 () Unit!37614)

(assert (=> b!1145656 (= e!651678 lt!511483)))

(declare-fun b!1145657 () Bool)

(declare-fun res!762866 () Bool)

(assert (=> b!1145657 (=> (not res!762866) (not e!651690))))

(assert (=> b!1145657 (= res!762866 (arrayNoDuplicates!0 lt!511481 #b00000000000000000000000000000000 Nil!25038))))

(declare-fun bm!52315 () Bool)

(declare-fun lt!511475 () array!74373)

(assert (=> bm!52315 (= call!52317 (getCurrentListMapNoExtraKeys!4620 lt!511481 lt!511475 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145658 () Bool)

(declare-fun e!651682 () Bool)

(assert (=> b!1145658 (= e!651682 e!651683)))

(declare-fun res!762876 () Bool)

(assert (=> b!1145658 (=> res!762876 e!651683)))

(assert (=> b!1145658 (= res!762876 (not (= from!1455 i!673)))))

(declare-fun lt!511484 () ListLongMap!16257)

(assert (=> b!1145658 (= lt!511484 (getCurrentListMapNoExtraKeys!4620 lt!511481 lt!511475 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1145658 (= lt!511475 (array!74374 (store (arr!35837 _values!996) i!673 (ValueCellFull!13671 lt!511478)) (size!36373 _values!996)))))

(declare-fun dynLambda!2654 (Int (_ BitVec 64)) V!43475)

(assert (=> b!1145658 (= lt!511478 (dynLambda!2654 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!511472 () ListLongMap!16257)

(assert (=> b!1145658 (= lt!511472 (getCurrentListMapNoExtraKeys!4620 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52316 () Bool)

(assert (=> bm!52316 (= call!52320 call!52321)))

(declare-fun mapIsEmpty!44966 () Bool)

(assert (=> mapIsEmpty!44966 mapRes!44966))

(declare-fun b!1145659 () Bool)

(declare-fun res!762873 () Bool)

(assert (=> b!1145659 (=> (not res!762873) (not e!651689))))

(assert (=> b!1145659 (= res!762873 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25038))))

(declare-fun bm!52317 () Bool)

(assert (=> bm!52317 (= call!52321 (contains!6672 (ite c!112941 lt!511468 call!52315) k0!934))))

(declare-fun b!1145660 () Bool)

(assert (=> b!1145660 (= e!651679 e!651678)))

(declare-fun c!112940 () Bool)

(assert (=> b!1145660 (= c!112940 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!511487))))

(declare-fun b!1145661 () Bool)

(assert (=> b!1145661 (= e!651681 (= (-!1284 lt!511472 k0!934) lt!511488))))

(declare-fun b!1145662 () Bool)

(assert (=> b!1145662 (= e!651690 (not e!651682))))

(declare-fun res!762867 () Bool)

(assert (=> b!1145662 (=> res!762867 e!651682)))

(assert (=> b!1145662 (= res!762867 (bvsgt from!1455 i!673))))

(assert (=> b!1145662 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!511480 () Unit!37614)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74375 (_ BitVec 64) (_ BitVec 32)) Unit!37614)

(assert (=> b!1145662 (= lt!511480 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1145663 () Bool)

(declare-fun Unit!37618 () Unit!37614)

(assert (=> b!1145663 (= e!651678 Unit!37618)))

(declare-fun b!1145664 () Bool)

(assert (=> b!1145664 (= c!112938 (and (not lt!511487) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1145664 (= e!651675 e!651679)))

(declare-fun b!1145665 () Bool)

(assert (=> b!1145665 (= e!651684 tp_is_empty!28761)))

(declare-fun b!1145666 () Bool)

(declare-fun res!762868 () Bool)

(assert (=> b!1145666 (=> (not res!762868) (not e!651689))))

(assert (=> b!1145666 (= res!762868 (= (select (arr!35838 _keys!1208) i!673) k0!934))))

(declare-fun bm!52318 () Bool)

(assert (=> bm!52318 (= call!52316 (getCurrentListMapNoExtraKeys!4620 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1145667 () Bool)

(assert (=> b!1145667 (= e!651688 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98626 res!762877) b!1145639))

(assert (= (and b!1145639 res!762874) b!1145645))

(assert (= (and b!1145645 res!762878) b!1145644))

(assert (= (and b!1145644 res!762864) b!1145659))

(assert (= (and b!1145659 res!762873) b!1145654))

(assert (= (and b!1145654 res!762871) b!1145638))

(assert (= (and b!1145638 res!762870) b!1145666))

(assert (= (and b!1145666 res!762868) b!1145641))

(assert (= (and b!1145641 res!762875) b!1145657))

(assert (= (and b!1145657 res!762866) b!1145662))

(assert (= (and b!1145662 (not res!762867)) b!1145658))

(assert (= (and b!1145658 (not res!762876)) b!1145648))

(assert (= (and b!1145648 c!112942) b!1145650))

(assert (= (and b!1145648 (not c!112942)) b!1145642))

(assert (= (or b!1145650 b!1145642) bm!52315))

(assert (= (or b!1145650 b!1145642) bm!52318))

(assert (= (and b!1145648 (not res!762869)) b!1145651))

(assert (= (and b!1145651 c!112937) b!1145643))

(assert (= (and b!1145651 (not c!112937)) b!1145653))

(assert (= (and b!1145643 c!112941) b!1145652))

(assert (= (and b!1145643 (not c!112941)) b!1145664))

(assert (= (and b!1145664 c!112938) b!1145640))

(assert (= (and b!1145664 (not c!112938)) b!1145660))

(assert (= (and b!1145660 c!112940) b!1145656))

(assert (= (and b!1145660 (not c!112940)) b!1145663))

(assert (= (or b!1145640 b!1145656) bm!52311))

(assert (= (or b!1145640 b!1145656) bm!52313))

(assert (= (or b!1145640 b!1145656) bm!52316))

(assert (= (or b!1145652 bm!52316) bm!52317))

(assert (= (or b!1145652 bm!52311) bm!52312))

(assert (= (or b!1145652 bm!52313) bm!52314))

(assert (= (and b!1145643 c!112939) b!1145667))

(assert (= (and b!1145643 (not c!112939)) b!1145655))

(assert (= (and b!1145643 res!762872) b!1145647))

(assert (= (and b!1145651 res!762865) b!1145661))

(assert (= (and b!1145649 condMapEmpty!44966) mapIsEmpty!44966))

(assert (= (and b!1145649 (not condMapEmpty!44966)) mapNonEmpty!44966))

(get-info :version)

(assert (= (and mapNonEmpty!44966 ((_ is ValueCellFull!13671) mapValue!44966)) b!1145646))

(assert (= (and b!1145649 ((_ is ValueCellFull!13671) mapDefault!44966)) b!1145665))

(assert (= start!98626 b!1145649))

(declare-fun b_lambda!19337 () Bool)

(assert (=> (not b_lambda!19337) (not b!1145658)))

(declare-fun t!36263 () Bool)

(declare-fun tb!9043 () Bool)

(assert (=> (and start!98626 (= defaultEntry!1004 defaultEntry!1004) t!36263) tb!9043))

(declare-fun result!18651 () Bool)

(assert (=> tb!9043 (= result!18651 tp_is_empty!28761)))

(assert (=> b!1145658 t!36263))

(declare-fun b_and!39313 () Bool)

(assert (= b_and!39311 (and (=> t!36263 result!18651) b_and!39313)))

(declare-fun m!1056499 () Bool)

(assert (=> b!1145647 m!1056499))

(declare-fun m!1056501 () Bool)

(assert (=> b!1145641 m!1056501))

(declare-fun m!1056503 () Bool)

(assert (=> b!1145641 m!1056503))

(assert (=> b!1145667 m!1056499))

(declare-fun m!1056505 () Bool)

(assert (=> b!1145650 m!1056505))

(declare-fun m!1056507 () Bool)

(assert (=> bm!52317 m!1056507))

(declare-fun m!1056509 () Bool)

(assert (=> bm!52315 m!1056509))

(declare-fun m!1056511 () Bool)

(assert (=> b!1145662 m!1056511))

(declare-fun m!1056513 () Bool)

(assert (=> b!1145662 m!1056513))

(declare-fun m!1056515 () Bool)

(assert (=> b!1145658 m!1056515))

(declare-fun m!1056517 () Bool)

(assert (=> b!1145658 m!1056517))

(declare-fun m!1056519 () Bool)

(assert (=> b!1145658 m!1056519))

(declare-fun m!1056521 () Bool)

(assert (=> b!1145658 m!1056521))

(declare-fun m!1056523 () Bool)

(assert (=> bm!52314 m!1056523))

(declare-fun m!1056525 () Bool)

(assert (=> b!1145661 m!1056525))

(declare-fun m!1056527 () Bool)

(assert (=> b!1145657 m!1056527))

(declare-fun m!1056529 () Bool)

(assert (=> b!1145648 m!1056529))

(declare-fun m!1056531 () Bool)

(assert (=> b!1145648 m!1056531))

(declare-fun m!1056533 () Bool)

(assert (=> b!1145659 m!1056533))

(declare-fun m!1056535 () Bool)

(assert (=> b!1145651 m!1056535))

(declare-fun m!1056537 () Bool)

(assert (=> b!1145651 m!1056537))

(declare-fun m!1056539 () Bool)

(assert (=> b!1145651 m!1056539))

(assert (=> b!1145651 m!1056539))

(declare-fun m!1056541 () Bool)

(assert (=> b!1145651 m!1056541))

(assert (=> b!1145651 m!1056529))

(declare-fun m!1056543 () Bool)

(assert (=> b!1145651 m!1056543))

(declare-fun m!1056545 () Bool)

(assert (=> b!1145651 m!1056545))

(assert (=> b!1145651 m!1056535))

(assert (=> b!1145651 m!1056529))

(declare-fun m!1056547 () Bool)

(assert (=> b!1145651 m!1056547))

(assert (=> b!1145651 m!1056529))

(declare-fun m!1056549 () Bool)

(assert (=> b!1145638 m!1056549))

(declare-fun m!1056551 () Bool)

(assert (=> mapNonEmpty!44966 m!1056551))

(declare-fun m!1056553 () Bool)

(assert (=> b!1145644 m!1056553))

(declare-fun m!1056555 () Bool)

(assert (=> b!1145639 m!1056555))

(declare-fun m!1056557 () Bool)

(assert (=> b!1145643 m!1056557))

(declare-fun m!1056559 () Bool)

(assert (=> b!1145643 m!1056559))

(declare-fun m!1056561 () Bool)

(assert (=> b!1145643 m!1056561))

(declare-fun m!1056563 () Bool)

(assert (=> b!1145643 m!1056563))

(declare-fun m!1056565 () Bool)

(assert (=> start!98626 m!1056565))

(declare-fun m!1056567 () Bool)

(assert (=> start!98626 m!1056567))

(declare-fun m!1056569 () Bool)

(assert (=> bm!52312 m!1056569))

(assert (=> bm!52318 m!1056537))

(declare-fun m!1056571 () Bool)

(assert (=> b!1145652 m!1056571))

(declare-fun m!1056573 () Bool)

(assert (=> b!1145652 m!1056573))

(declare-fun m!1056575 () Bool)

(assert (=> b!1145652 m!1056575))

(declare-fun m!1056577 () Bool)

(assert (=> b!1145666 m!1056577))

(check-sat (not b!1145661) (not b!1145644) (not b!1145648) (not b!1145643) (not b!1145662) (not b!1145657) (not b!1145650) (not b!1145639) (not bm!52318) (not b_next!24231) (not b!1145667) (not bm!52315) (not bm!52312) (not b!1145641) (not mapNonEmpty!44966) (not b!1145647) (not b!1145659) (not b_lambda!19337) (not start!98626) (not bm!52317) (not bm!52314) (not b!1145658) (not b!1145652) (not b!1145638) b_and!39313 tp_is_empty!28761 (not b!1145651))
(check-sat b_and!39313 (not b_next!24231))
