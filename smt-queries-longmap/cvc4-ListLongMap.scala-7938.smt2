; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98472 () Bool)

(assert start!98472)

(declare-fun b_free!24077 () Bool)

(declare-fun b_next!24077 () Bool)

(assert (=> start!98472 (= b_free!24077 (not b_next!24077))))

(declare-fun tp!84942 () Bool)

(declare-fun b_and!39003 () Bool)

(assert (=> start!98472 (= tp!84942 b_and!39003)))

(declare-fun b!1138735 () Bool)

(declare-fun res!759590 () Bool)

(declare-fun e!647941 () Bool)

(assert (=> b!1138735 (=> (not res!759590) (not e!647941))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138735 (= res!759590 (validKeyInArray!0 k!934))))

(declare-fun bm!50463 () Bool)

(declare-fun call!50470 () Bool)

(declare-fun call!50467 () Bool)

(assert (=> bm!50463 (= call!50470 call!50467)))

(declare-fun b!1138736 () Bool)

(declare-fun res!759581 () Bool)

(assert (=> b!1138736 (=> (not res!759581) (not e!647941))))

(declare-datatypes ((array!74073 0))(
  ( (array!74074 (arr!35687 (Array (_ BitVec 32) (_ BitVec 64))) (size!36223 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74073)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43269 0))(
  ( (V!43270 (val!14360 Int)) )
))
(declare-datatypes ((ValueCell!13594 0))(
  ( (ValueCellFull!13594 (v!16997 V!43269)) (EmptyCell!13594) )
))
(declare-datatypes ((array!74075 0))(
  ( (array!74076 (arr!35688 (Array (_ BitVec 32) ValueCell!13594)) (size!36224 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74075)

(assert (=> b!1138736 (= res!759581 (and (= (size!36224 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36223 _keys!1208) (size!36224 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138737 () Bool)

(declare-fun res!759588 () Bool)

(assert (=> b!1138737 (=> (not res!759588) (not e!647941))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138737 (= res!759588 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36223 _keys!1208))))))

(declare-fun b!1138738 () Bool)

(declare-datatypes ((tuple2!18146 0))(
  ( (tuple2!18147 (_1!9084 (_ BitVec 64)) (_2!9084 V!43269)) )
))
(declare-datatypes ((List!24902 0))(
  ( (Nil!24899) (Cons!24898 (h!26107 tuple2!18146) (t!35971 List!24902)) )
))
(declare-datatypes ((ListLongMap!16115 0))(
  ( (ListLongMap!16116 (toList!8073 List!24902)) )
))
(declare-fun lt!506676 () ListLongMap!16115)

(declare-fun minValue!944 () V!43269)

(declare-fun contains!6609 (ListLongMap!16115 (_ BitVec 64)) Bool)

(declare-fun +!3505 (ListLongMap!16115 tuple2!18146) ListLongMap!16115)

(assert (=> b!1138738 (contains!6609 (+!3505 lt!506676 (tuple2!18147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-datatypes ((Unit!37311 0))(
  ( (Unit!37312) )
))
(declare-fun lt!506674 () Unit!37311)

(declare-fun call!50468 () Unit!37311)

(assert (=> b!1138738 (= lt!506674 call!50468)))

(assert (=> b!1138738 call!50467))

(declare-fun call!50473 () ListLongMap!16115)

(assert (=> b!1138738 (= lt!506676 call!50473)))

(declare-fun lt!506670 () Unit!37311)

(declare-fun lt!506682 () ListLongMap!16115)

(declare-fun zeroValue!944 () V!43269)

(declare-fun addStillContains!765 (ListLongMap!16115 (_ BitVec 64) V!43269 (_ BitVec 64)) Unit!37311)

(assert (=> b!1138738 (= lt!506670 (addStillContains!765 lt!506682 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!647932 () Unit!37311)

(assert (=> b!1138738 (= e!647932 lt!506674)))

(declare-fun call!50472 () ListLongMap!16115)

(declare-fun c!111554 () Bool)

(declare-fun bm!50464 () Bool)

(assert (=> bm!50464 (= call!50467 (contains!6609 (ite c!111554 lt!506676 call!50472) k!934))))

(declare-fun b!1138739 () Bool)

(declare-fun e!647940 () Unit!37311)

(declare-fun lt!506669 () Unit!37311)

(assert (=> b!1138739 (= e!647940 lt!506669)))

(declare-fun call!50471 () Unit!37311)

(assert (=> b!1138739 (= lt!506669 call!50471)))

(assert (=> b!1138739 call!50470))

(declare-fun b!1138740 () Bool)

(declare-fun e!647937 () Bool)

(declare-fun tp_is_empty!28607 () Bool)

(assert (=> b!1138740 (= e!647937 tp_is_empty!28607)))

(declare-fun e!647928 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1138742 () Bool)

(declare-fun arrayContainsKey!0 (array!74073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138742 (= e!647928 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138743 () Bool)

(declare-fun e!647931 () Bool)

(assert (=> b!1138743 (= e!647931 tp_is_empty!28607)))

(declare-fun b!1138744 () Bool)

(declare-fun e!647939 () Unit!37311)

(assert (=> b!1138744 (= e!647940 e!647939)))

(declare-fun c!111553 () Bool)

(declare-fun lt!506668 () Bool)

(assert (=> b!1138744 (= c!111553 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506668))))

(declare-fun bm!50465 () Bool)

(assert (=> bm!50465 (= call!50471 call!50468)))

(declare-fun b!1138745 () Bool)

(declare-fun e!647935 () Unit!37311)

(declare-fun Unit!37313 () Unit!37311)

(assert (=> b!1138745 (= e!647935 Unit!37313)))

(declare-fun b!1138746 () Bool)

(declare-fun e!647930 () Bool)

(assert (=> b!1138746 (= e!647941 e!647930)))

(declare-fun res!759589 () Bool)

(assert (=> b!1138746 (=> (not res!759589) (not e!647930))))

(declare-fun lt!506675 () array!74073)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74073 (_ BitVec 32)) Bool)

(assert (=> b!1138746 (= res!759589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506675 mask!1564))))

(assert (=> b!1138746 (= lt!506675 (array!74074 (store (arr!35687 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36223 _keys!1208)))))

(declare-fun b!1138747 () Bool)

(declare-fun e!647942 () Bool)

(assert (=> b!1138747 (= e!647930 (not e!647942))))

(declare-fun res!759585 () Bool)

(assert (=> b!1138747 (=> res!759585 e!647942)))

(assert (=> b!1138747 (= res!759585 (bvsgt from!1455 i!673))))

(assert (=> b!1138747 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!506665 () Unit!37311)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74073 (_ BitVec 64) (_ BitVec 32)) Unit!37311)

(assert (=> b!1138747 (= lt!506665 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1138748 () Bool)

(declare-fun res!759587 () Bool)

(assert (=> b!1138748 (=> (not res!759587) (not e!647941))))

(declare-datatypes ((List!24903 0))(
  ( (Nil!24900) (Cons!24899 (h!26108 (_ BitVec 64)) (t!35972 List!24903)) )
))
(declare-fun arrayNoDuplicates!0 (array!74073 (_ BitVec 32) List!24903) Bool)

(assert (=> b!1138748 (= res!759587 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24900))))

(declare-fun b!1138749 () Bool)

(declare-fun res!759580 () Bool)

(assert (=> b!1138749 (=> (not res!759580) (not e!647941))))

(assert (=> b!1138749 (= res!759580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1138750 () Bool)

(declare-fun res!759583 () Bool)

(assert (=> b!1138750 (=> (not res!759583) (not e!647941))))

(assert (=> b!1138750 (= res!759583 (= (select (arr!35687 _keys!1208) i!673) k!934))))

(declare-fun bm!50466 () Bool)

(declare-fun c!111556 () Bool)

(assert (=> bm!50466 (= call!50468 (addStillContains!765 (ite c!111554 lt!506676 lt!506682) (ite c!111554 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111556 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111554 minValue!944 (ite c!111556 zeroValue!944 minValue!944)) k!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!50466 () ListLongMap!16115)

(declare-fun lt!506673 () array!74075)

(declare-fun bm!50467 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4557 (array!74073 array!74075 (_ BitVec 32) (_ BitVec 32) V!43269 V!43269 (_ BitVec 32) Int) ListLongMap!16115)

(assert (=> bm!50467 (= call!50466 (getCurrentListMapNoExtraKeys!4557 lt!506675 lt!506673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138751 () Bool)

(declare-fun e!647933 () Bool)

(assert (=> b!1138751 (= e!647933 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44735 () Bool)

(declare-fun mapRes!44735 () Bool)

(declare-fun tp!84941 () Bool)

(assert (=> mapNonEmpty!44735 (= mapRes!44735 (and tp!84941 e!647937))))

(declare-fun mapValue!44735 () ValueCell!13594)

(declare-fun mapRest!44735 () (Array (_ BitVec 32) ValueCell!13594))

(declare-fun mapKey!44735 () (_ BitVec 32))

(assert (=> mapNonEmpty!44735 (= (arr!35688 _values!996) (store mapRest!44735 mapKey!44735 mapValue!44735))))

(declare-fun bm!50468 () Bool)

(assert (=> bm!50468 (= call!50472 call!50473)))

(declare-fun b!1138752 () Bool)

(declare-fun e!647934 () Bool)

(declare-fun e!647938 () Bool)

(assert (=> b!1138752 (= e!647934 e!647938)))

(declare-fun res!759584 () Bool)

(assert (=> b!1138752 (=> res!759584 e!647938)))

(assert (=> b!1138752 (= res!759584 (not (= (select (arr!35687 _keys!1208) from!1455) k!934)))))

(declare-fun e!647929 () Bool)

(assert (=> b!1138752 e!647929))

(declare-fun c!111555 () Bool)

(assert (=> b!1138752 (= c!111555 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506671 () Unit!37311)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!474 (array!74073 array!74075 (_ BitVec 32) (_ BitVec 32) V!43269 V!43269 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37311)

(assert (=> b!1138752 (= lt!506671 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138753 () Bool)

(assert (=> b!1138753 (= e!647942 e!647934)))

(declare-fun res!759593 () Bool)

(assert (=> b!1138753 (=> res!759593 e!647934)))

(assert (=> b!1138753 (= res!759593 (not (= from!1455 i!673)))))

(declare-fun lt!506681 () ListLongMap!16115)

(assert (=> b!1138753 (= lt!506681 (getCurrentListMapNoExtraKeys!4557 lt!506675 lt!506673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2607 (Int (_ BitVec 64)) V!43269)

(assert (=> b!1138753 (= lt!506673 (array!74076 (store (arr!35688 _values!996) i!673 (ValueCellFull!13594 (dynLambda!2607 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36224 _values!996)))))

(declare-fun lt!506677 () ListLongMap!16115)

(assert (=> b!1138753 (= lt!506677 (getCurrentListMapNoExtraKeys!4557 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138754 () Bool)

(assert (=> b!1138754 (= c!111556 (and (not lt!506668) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1138754 (= e!647932 e!647940)))

(declare-fun mapIsEmpty!44735 () Bool)

(assert (=> mapIsEmpty!44735 mapRes!44735))

(declare-fun b!1138755 () Bool)

(declare-fun call!50469 () ListLongMap!16115)

(assert (=> b!1138755 (= e!647929 (= call!50466 call!50469))))

(declare-fun bm!50469 () Bool)

(assert (=> bm!50469 (= call!50469 (getCurrentListMapNoExtraKeys!4557 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138756 () Bool)

(assert (=> b!1138756 (= e!647938 true)))

(declare-fun lt!506672 () Unit!37311)

(assert (=> b!1138756 (= lt!506672 e!647935)))

(declare-fun c!111552 () Bool)

(assert (=> b!1138756 (= c!111552 (contains!6609 lt!506682 k!934))))

(assert (=> b!1138756 (= lt!506682 (getCurrentListMapNoExtraKeys!4557 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138757 () Bool)

(declare-fun Unit!37314 () Unit!37311)

(assert (=> b!1138757 (= e!647935 Unit!37314)))

(assert (=> b!1138757 (= lt!506668 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1138757 (= c!111554 (and (not lt!506668) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506680 () Unit!37311)

(assert (=> b!1138757 (= lt!506680 e!647932)))

(declare-fun lt!506679 () Unit!37311)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!367 (array!74073 array!74075 (_ BitVec 32) (_ BitVec 32) V!43269 V!43269 (_ BitVec 64) (_ BitVec 32) Int) Unit!37311)

(assert (=> b!1138757 (= lt!506679 (lemmaListMapContainsThenArrayContainsFrom!367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111551 () Bool)

(assert (=> b!1138757 (= c!111551 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759592 () Bool)

(assert (=> b!1138757 (= res!759592 e!647928)))

(assert (=> b!1138757 (=> (not res!759592) (not e!647933))))

(assert (=> b!1138757 e!647933))

(declare-fun lt!506666 () Unit!37311)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74073 (_ BitVec 32) (_ BitVec 32)) Unit!37311)

(assert (=> b!1138757 (= lt!506666 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1138757 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24900)))

(declare-fun lt!506678 () Unit!37311)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74073 (_ BitVec 64) (_ BitVec 32) List!24903) Unit!37311)

(assert (=> b!1138757 (= lt!506678 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24900))))

(assert (=> b!1138757 false))

(declare-fun b!1138741 () Bool)

(assert (=> b!1138741 (= e!647928 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506668) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!759582 () Bool)

(assert (=> start!98472 (=> (not res!759582) (not e!647941))))

(assert (=> start!98472 (= res!759582 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36223 _keys!1208))))))

(assert (=> start!98472 e!647941))

(assert (=> start!98472 tp_is_empty!28607))

(declare-fun array_inv!27356 (array!74073) Bool)

(assert (=> start!98472 (array_inv!27356 _keys!1208)))

(assert (=> start!98472 true))

(assert (=> start!98472 tp!84942))

(declare-fun e!647936 () Bool)

(declare-fun array_inv!27357 (array!74075) Bool)

(assert (=> start!98472 (and (array_inv!27357 _values!996) e!647936)))

(declare-fun b!1138758 () Bool)

(declare-fun Unit!37315 () Unit!37311)

(assert (=> b!1138758 (= e!647939 Unit!37315)))

(declare-fun b!1138759 () Bool)

(declare-fun res!759591 () Bool)

(assert (=> b!1138759 (=> (not res!759591) (not e!647930))))

(assert (=> b!1138759 (= res!759591 (arrayNoDuplicates!0 lt!506675 #b00000000000000000000000000000000 Nil!24900))))

(declare-fun b!1138760 () Bool)

(declare-fun -!1224 (ListLongMap!16115 (_ BitVec 64)) ListLongMap!16115)

(assert (=> b!1138760 (= e!647929 (= call!50466 (-!1224 call!50469 k!934)))))

(declare-fun bm!50470 () Bool)

(assert (=> bm!50470 (= call!50473 (+!3505 lt!506682 (ite (or c!111554 c!111556) (tuple2!18147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1138761 () Bool)

(assert (=> b!1138761 call!50470))

(declare-fun lt!506667 () Unit!37311)

(assert (=> b!1138761 (= lt!506667 call!50471)))

(assert (=> b!1138761 (= e!647939 lt!506667)))

(declare-fun b!1138762 () Bool)

(assert (=> b!1138762 (= e!647936 (and e!647931 mapRes!44735))))

(declare-fun condMapEmpty!44735 () Bool)

(declare-fun mapDefault!44735 () ValueCell!13594)

