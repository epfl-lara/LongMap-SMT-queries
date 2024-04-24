; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99010 () Bool)

(assert start!99010)

(declare-fun b_free!24379 () Bool)

(declare-fun b_next!24379 () Bool)

(assert (=> start!99010 (= b_free!24379 (not b_next!24379))))

(declare-fun tp!85847 () Bool)

(declare-fun b_and!39609 () Bool)

(assert (=> start!99010 (= tp!85847 b_and!39609)))

(declare-fun b!1153735 () Bool)

(declare-datatypes ((Unit!37903 0))(
  ( (Unit!37904) )
))
(declare-fun e!656287 () Unit!37903)

(declare-fun Unit!37905 () Unit!37903)

(assert (=> b!1153735 (= e!656287 Unit!37905)))

(declare-fun lt!516737 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1153735 (= lt!516737 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114670 () Bool)

(assert (=> b!1153735 (= c!114670 (and (not lt!516737) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516732 () Unit!37903)

(declare-fun e!656280 () Unit!37903)

(assert (=> b!1153735 (= lt!516732 e!656280)))

(declare-datatypes ((V!43673 0))(
  ( (V!43674 (val!14511 Int)) )
))
(declare-fun zeroValue!944 () V!43673)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43673)

(declare-datatypes ((array!74711 0))(
  ( (array!74712 (arr!36000 (Array (_ BitVec 32) (_ BitVec 64))) (size!36537 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74711)

(declare-datatypes ((ValueCell!13745 0))(
  ( (ValueCellFull!13745 (v!17144 V!43673)) (EmptyCell!13745) )
))
(declare-datatypes ((array!74713 0))(
  ( (array!74714 (arr!36001 (Array (_ BitVec 32) ValueCell!13745)) (size!36538 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74713)

(declare-fun lt!516733 () Unit!37903)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!480 (array!74711 array!74713 (_ BitVec 32) (_ BitVec 32) V!43673 V!43673 (_ BitVec 64) (_ BitVec 32) Int) Unit!37903)

(assert (=> b!1153735 (= lt!516733 (lemmaListMapContainsThenArrayContainsFrom!480 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114671 () Bool)

(assert (=> b!1153735 (= c!114671 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766714 () Bool)

(declare-fun e!656283 () Bool)

(assert (=> b!1153735 (= res!766714 e!656283)))

(declare-fun e!656295 () Bool)

(assert (=> b!1153735 (=> (not res!766714) (not e!656295))))

(assert (=> b!1153735 e!656295))

(declare-fun lt!516735 () Unit!37903)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74711 (_ BitVec 32) (_ BitVec 32)) Unit!37903)

(assert (=> b!1153735 (= lt!516735 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25199 0))(
  ( (Nil!25196) (Cons!25195 (h!26413 (_ BitVec 64)) (t!36562 List!25199)) )
))
(declare-fun arrayNoDuplicates!0 (array!74711 (_ BitVec 32) List!25199) Bool)

(assert (=> b!1153735 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25196)))

(declare-fun lt!516724 () Unit!37903)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74711 (_ BitVec 64) (_ BitVec 32) List!25199) Unit!37903)

(assert (=> b!1153735 (= lt!516724 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25196))))

(assert (=> b!1153735 false))

(declare-fun b!1153736 () Bool)

(declare-fun arrayContainsKey!0 (array!74711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153736 (= e!656283 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153737 () Bool)

(declare-fun res!766710 () Bool)

(declare-fun e!656290 () Bool)

(assert (=> b!1153737 (=> (not res!766710) (not e!656290))))

(assert (=> b!1153737 (= res!766710 (and (= (size!36538 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36537 _keys!1208) (size!36538 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153738 () Bool)

(declare-fun call!54155 () Bool)

(assert (=> b!1153738 call!54155))

(declare-fun lt!516731 () Unit!37903)

(declare-fun call!54158 () Unit!37903)

(assert (=> b!1153738 (= lt!516731 call!54158)))

(declare-fun e!656284 () Unit!37903)

(assert (=> b!1153738 (= e!656284 lt!516731)))

(declare-fun b!1153739 () Bool)

(declare-fun e!656292 () Unit!37903)

(assert (=> b!1153739 (= e!656292 e!656284)))

(declare-fun c!114667 () Bool)

(assert (=> b!1153739 (= c!114667 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516737))))

(declare-fun b!1153740 () Bool)

(declare-fun e!656285 () Bool)

(declare-fun e!656293 () Bool)

(declare-fun mapRes!45188 () Bool)

(assert (=> b!1153740 (= e!656285 (and e!656293 mapRes!45188))))

(declare-fun condMapEmpty!45188 () Bool)

(declare-fun mapDefault!45188 () ValueCell!13745)

(assert (=> b!1153740 (= condMapEmpty!45188 (= (arr!36001 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13745)) mapDefault!45188)))))

(declare-fun b!1153741 () Bool)

(declare-fun res!766715 () Bool)

(assert (=> b!1153741 (=> (not res!766715) (not e!656290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153741 (= res!766715 (validKeyInArray!0 k0!934))))

(declare-fun bm!54153 () Bool)

(declare-fun call!54162 () Unit!37903)

(assert (=> bm!54153 (= call!54158 call!54162)))

(declare-fun b!1153742 () Bool)

(declare-fun e!656291 () Bool)

(assert (=> b!1153742 (= e!656291 true)))

(declare-fun e!656296 () Bool)

(assert (=> b!1153742 e!656296))

(declare-fun res!766709 () Bool)

(assert (=> b!1153742 (=> (not res!766709) (not e!656296))))

(declare-datatypes ((tuple2!18448 0))(
  ( (tuple2!18449 (_1!9235 (_ BitVec 64)) (_2!9235 V!43673)) )
))
(declare-datatypes ((List!25200 0))(
  ( (Nil!25197) (Cons!25196 (h!26414 tuple2!18448) (t!36563 List!25200)) )
))
(declare-datatypes ((ListLongMap!16425 0))(
  ( (ListLongMap!16426 (toList!8228 List!25200)) )
))
(declare-fun lt!516741 () ListLongMap!16425)

(declare-fun lt!516743 () ListLongMap!16425)

(assert (=> b!1153742 (= res!766709 (= lt!516741 lt!516743))))

(declare-fun lt!516729 () ListLongMap!16425)

(declare-fun -!1345 (ListLongMap!16425 (_ BitVec 64)) ListLongMap!16425)

(assert (=> b!1153742 (= lt!516741 (-!1345 lt!516729 k0!934))))

(declare-fun lt!516730 () V!43673)

(declare-fun +!3660 (ListLongMap!16425 tuple2!18448) ListLongMap!16425)

(assert (=> b!1153742 (= (-!1345 (+!3660 lt!516743 (tuple2!18449 (select (arr!36000 _keys!1208) from!1455) lt!516730)) (select (arr!36000 _keys!1208) from!1455)) lt!516743)))

(declare-fun lt!516738 () Unit!37903)

(declare-fun addThenRemoveForNewKeyIsSame!188 (ListLongMap!16425 (_ BitVec 64) V!43673) Unit!37903)

(assert (=> b!1153742 (= lt!516738 (addThenRemoveForNewKeyIsSame!188 lt!516743 (select (arr!36000 _keys!1208) from!1455) lt!516730))))

(declare-fun lt!516727 () V!43673)

(declare-fun get!18359 (ValueCell!13745 V!43673) V!43673)

(assert (=> b!1153742 (= lt!516730 (get!18359 (select (arr!36001 _values!996) from!1455) lt!516727))))

(declare-fun lt!516726 () Unit!37903)

(assert (=> b!1153742 (= lt!516726 e!656287)))

(declare-fun c!114672 () Bool)

(declare-fun contains!6759 (ListLongMap!16425 (_ BitVec 64)) Bool)

(assert (=> b!1153742 (= c!114672 (contains!6759 lt!516743 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4726 (array!74711 array!74713 (_ BitVec 32) (_ BitVec 32) V!43673 V!43673 (_ BitVec 32) Int) ListLongMap!16425)

(assert (=> b!1153742 (= lt!516743 (getCurrentListMapNoExtraKeys!4726 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!766716 () Bool)

(assert (=> start!99010 (=> (not res!766716) (not e!656290))))

(assert (=> start!99010 (= res!766716 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36537 _keys!1208))))))

(assert (=> start!99010 e!656290))

(declare-fun tp_is_empty!28909 () Bool)

(assert (=> start!99010 tp_is_empty!28909))

(declare-fun array_inv!27624 (array!74711) Bool)

(assert (=> start!99010 (array_inv!27624 _keys!1208)))

(assert (=> start!99010 true))

(assert (=> start!99010 tp!85847))

(declare-fun array_inv!27625 (array!74713) Bool)

(assert (=> start!99010 (and (array_inv!27625 _values!996) e!656285)))

(declare-fun bm!54152 () Bool)

(declare-fun call!54161 () ListLongMap!16425)

(declare-fun call!54160 () ListLongMap!16425)

(assert (=> bm!54152 (= call!54161 call!54160)))

(declare-fun b!1153743 () Bool)

(declare-fun res!766707 () Bool)

(declare-fun e!656294 () Bool)

(assert (=> b!1153743 (=> (not res!766707) (not e!656294))))

(declare-fun lt!516734 () array!74711)

(assert (=> b!1153743 (= res!766707 (arrayNoDuplicates!0 lt!516734 #b00000000000000000000000000000000 Nil!25196))))

(declare-fun lt!516744 () array!74713)

(declare-fun b!1153744 () Bool)

(assert (=> b!1153744 (= e!656296 (= lt!516741 (getCurrentListMapNoExtraKeys!4726 lt!516734 lt!516744 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!54157 () Bool)

(declare-fun bm!54154 () Bool)

(declare-fun lt!516725 () ListLongMap!16425)

(assert (=> bm!54154 (= call!54157 (contains!6759 (ite c!114670 lt!516725 call!54161) k0!934))))

(declare-fun b!1153745 () Bool)

(declare-fun Unit!37906 () Unit!37903)

(assert (=> b!1153745 (= e!656287 Unit!37906)))

(declare-fun b!1153746 () Bool)

(assert (=> b!1153746 (= e!656293 tp_is_empty!28909)))

(declare-fun b!1153747 () Bool)

(declare-fun lt!516740 () Unit!37903)

(assert (=> b!1153747 (= e!656292 lt!516740)))

(assert (=> b!1153747 (= lt!516740 call!54158)))

(assert (=> b!1153747 call!54155))

(declare-fun b!1153748 () Bool)

(declare-fun Unit!37907 () Unit!37903)

(assert (=> b!1153748 (= e!656284 Unit!37907)))

(declare-fun b!1153749 () Bool)

(declare-fun res!766702 () Bool)

(assert (=> b!1153749 (=> (not res!766702) (not e!656290))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153749 (= res!766702 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36537 _keys!1208))))))

(declare-fun b!1153750 () Bool)

(declare-fun e!656282 () Bool)

(declare-fun e!656281 () Bool)

(assert (=> b!1153750 (= e!656282 e!656281)))

(declare-fun res!766708 () Bool)

(assert (=> b!1153750 (=> res!766708 e!656281)))

(assert (=> b!1153750 (= res!766708 (not (= from!1455 i!673)))))

(declare-fun lt!516742 () ListLongMap!16425)

(assert (=> b!1153750 (= lt!516742 (getCurrentListMapNoExtraKeys!4726 lt!516734 lt!516744 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1153750 (= lt!516744 (array!74714 (store (arr!36001 _values!996) i!673 (ValueCellFull!13745 lt!516727)) (size!36538 _values!996)))))

(declare-fun dynLambda!2749 (Int (_ BitVec 64)) V!43673)

(assert (=> b!1153750 (= lt!516727 (dynLambda!2749 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1153750 (= lt!516729 (getCurrentListMapNoExtraKeys!4726 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1153751 () Bool)

(declare-fun e!656289 () Bool)

(declare-fun call!54159 () ListLongMap!16425)

(declare-fun call!54156 () ListLongMap!16425)

(assert (=> b!1153751 (= e!656289 (= call!54159 call!54156))))

(declare-fun b!1153752 () Bool)

(declare-fun c!114668 () Bool)

(assert (=> b!1153752 (= c!114668 (and (not lt!516737) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1153752 (= e!656280 e!656292)))

(declare-fun bm!54155 () Bool)

(assert (=> bm!54155 (= call!54156 (getCurrentListMapNoExtraKeys!4726 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153753 () Bool)

(assert (=> b!1153753 (= e!656294 (not e!656282))))

(declare-fun res!766705 () Bool)

(assert (=> b!1153753 (=> res!766705 e!656282)))

(assert (=> b!1153753 (= res!766705 (bvsgt from!1455 i!673))))

(assert (=> b!1153753 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!516745 () Unit!37903)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74711 (_ BitVec 64) (_ BitVec 32)) Unit!37903)

(assert (=> b!1153753 (= lt!516745 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1153754 () Bool)

(declare-fun e!656288 () Bool)

(assert (=> b!1153754 (= e!656288 tp_is_empty!28909)))

(declare-fun b!1153755 () Bool)

(declare-fun res!766706 () Bool)

(assert (=> b!1153755 (=> (not res!766706) (not e!656290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74711 (_ BitVec 32)) Bool)

(assert (=> b!1153755 (= res!766706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1153756 () Bool)

(assert (=> b!1153756 (= e!656281 e!656291)))

(declare-fun res!766713 () Bool)

(assert (=> b!1153756 (=> res!766713 e!656291)))

(assert (=> b!1153756 (= res!766713 (not (= (select (arr!36000 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1153756 e!656289))

(declare-fun c!114669 () Bool)

(assert (=> b!1153756 (= c!114669 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516728 () Unit!37903)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!585 (array!74711 array!74713 (_ BitVec 32) (_ BitVec 32) V!43673 V!43673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37903)

(assert (=> b!1153756 (= lt!516728 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!585 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153757 () Bool)

(assert (=> b!1153757 (contains!6759 (+!3660 lt!516725 (tuple2!18449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!516736 () Unit!37903)

(declare-fun addStillContains!884 (ListLongMap!16425 (_ BitVec 64) V!43673 (_ BitVec 64)) Unit!37903)

(assert (=> b!1153757 (= lt!516736 (addStillContains!884 lt!516725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1153757 call!54157))

(assert (=> b!1153757 (= lt!516725 call!54160)))

(declare-fun lt!516739 () Unit!37903)

(assert (=> b!1153757 (= lt!516739 call!54162)))

(assert (=> b!1153757 (= e!656280 lt!516736)))

(declare-fun bm!54156 () Bool)

(assert (=> bm!54156 (= call!54155 call!54157)))

(declare-fun mapIsEmpty!45188 () Bool)

(assert (=> mapIsEmpty!45188 mapRes!45188))

(declare-fun bm!54157 () Bool)

(assert (=> bm!54157 (= call!54160 (+!3660 lt!516743 (ite (or c!114670 c!114668) (tuple2!18449 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18449 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1153758 () Bool)

(assert (=> b!1153758 (= e!656289 (= call!54159 (-!1345 call!54156 k0!934)))))

(declare-fun b!1153759 () Bool)

(declare-fun res!766704 () Bool)

(assert (=> b!1153759 (=> (not res!766704) (not e!656290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153759 (= res!766704 (validMask!0 mask!1564))))

(declare-fun b!1153760 () Bool)

(assert (=> b!1153760 (= e!656290 e!656294)))

(declare-fun res!766711 () Bool)

(assert (=> b!1153760 (=> (not res!766711) (not e!656294))))

(assert (=> b!1153760 (= res!766711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516734 mask!1564))))

(assert (=> b!1153760 (= lt!516734 (array!74712 (store (arr!36000 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36537 _keys!1208)))))

(declare-fun b!1153761 () Bool)

(declare-fun res!766703 () Bool)

(assert (=> b!1153761 (=> (not res!766703) (not e!656290))))

(assert (=> b!1153761 (= res!766703 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25196))))

(declare-fun mapNonEmpty!45188 () Bool)

(declare-fun tp!85848 () Bool)

(assert (=> mapNonEmpty!45188 (= mapRes!45188 (and tp!85848 e!656288))))

(declare-fun mapValue!45188 () ValueCell!13745)

(declare-fun mapKey!45188 () (_ BitVec 32))

(declare-fun mapRest!45188 () (Array (_ BitVec 32) ValueCell!13745))

(assert (=> mapNonEmpty!45188 (= (arr!36001 _values!996) (store mapRest!45188 mapKey!45188 mapValue!45188))))

(declare-fun b!1153762 () Bool)

(assert (=> b!1153762 (= e!656283 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516737) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!54158 () Bool)

(assert (=> bm!54158 (= call!54159 (getCurrentListMapNoExtraKeys!4726 lt!516734 lt!516744 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153763 () Bool)

(declare-fun res!766712 () Bool)

(assert (=> b!1153763 (=> (not res!766712) (not e!656290))))

(assert (=> b!1153763 (= res!766712 (= (select (arr!36000 _keys!1208) i!673) k0!934))))

(declare-fun bm!54159 () Bool)

(assert (=> bm!54159 (= call!54162 (addStillContains!884 lt!516743 (ite (or c!114670 c!114668) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114670 c!114668) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1153764 () Bool)

(assert (=> b!1153764 (= e!656295 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!99010 res!766716) b!1153759))

(assert (= (and b!1153759 res!766704) b!1153737))

(assert (= (and b!1153737 res!766710) b!1153755))

(assert (= (and b!1153755 res!766706) b!1153761))

(assert (= (and b!1153761 res!766703) b!1153749))

(assert (= (and b!1153749 res!766702) b!1153741))

(assert (= (and b!1153741 res!766715) b!1153763))

(assert (= (and b!1153763 res!766712) b!1153760))

(assert (= (and b!1153760 res!766711) b!1153743))

(assert (= (and b!1153743 res!766707) b!1153753))

(assert (= (and b!1153753 (not res!766705)) b!1153750))

(assert (= (and b!1153750 (not res!766708)) b!1153756))

(assert (= (and b!1153756 c!114669) b!1153758))

(assert (= (and b!1153756 (not c!114669)) b!1153751))

(assert (= (or b!1153758 b!1153751) bm!54158))

(assert (= (or b!1153758 b!1153751) bm!54155))

(assert (= (and b!1153756 (not res!766713)) b!1153742))

(assert (= (and b!1153742 c!114672) b!1153735))

(assert (= (and b!1153742 (not c!114672)) b!1153745))

(assert (= (and b!1153735 c!114670) b!1153757))

(assert (= (and b!1153735 (not c!114670)) b!1153752))

(assert (= (and b!1153752 c!114668) b!1153747))

(assert (= (and b!1153752 (not c!114668)) b!1153739))

(assert (= (and b!1153739 c!114667) b!1153738))

(assert (= (and b!1153739 (not c!114667)) b!1153748))

(assert (= (or b!1153747 b!1153738) bm!54153))

(assert (= (or b!1153747 b!1153738) bm!54152))

(assert (= (or b!1153747 b!1153738) bm!54156))

(assert (= (or b!1153757 bm!54156) bm!54154))

(assert (= (or b!1153757 bm!54153) bm!54159))

(assert (= (or b!1153757 bm!54152) bm!54157))

(assert (= (and b!1153735 c!114671) b!1153736))

(assert (= (and b!1153735 (not c!114671)) b!1153762))

(assert (= (and b!1153735 res!766714) b!1153764))

(assert (= (and b!1153742 res!766709) b!1153744))

(assert (= (and b!1153740 condMapEmpty!45188) mapIsEmpty!45188))

(assert (= (and b!1153740 (not condMapEmpty!45188)) mapNonEmpty!45188))

(get-info :version)

(assert (= (and mapNonEmpty!45188 ((_ is ValueCellFull!13745) mapValue!45188)) b!1153754))

(assert (= (and b!1153740 ((_ is ValueCellFull!13745) mapDefault!45188)) b!1153746))

(assert (= start!99010 b!1153740))

(declare-fun b_lambda!19479 () Bool)

(assert (=> (not b_lambda!19479) (not b!1153750)))

(declare-fun t!36561 () Bool)

(declare-fun tb!9183 () Bool)

(assert (=> (and start!99010 (= defaultEntry!1004 defaultEntry!1004) t!36561) tb!9183))

(declare-fun result!18939 () Bool)

(assert (=> tb!9183 (= result!18939 tp_is_empty!28909)))

(assert (=> b!1153750 t!36561))

(declare-fun b_and!39611 () Bool)

(assert (= b_and!39609 (and (=> t!36561 result!18939) b_and!39611)))

(declare-fun m!1063993 () Bool)

(assert (=> start!99010 m!1063993))

(declare-fun m!1063995 () Bool)

(assert (=> start!99010 m!1063995))

(declare-fun m!1063997 () Bool)

(assert (=> b!1153736 m!1063997))

(declare-fun m!1063999 () Bool)

(assert (=> bm!54159 m!1063999))

(declare-fun m!1064001 () Bool)

(assert (=> b!1153756 m!1064001))

(declare-fun m!1064003 () Bool)

(assert (=> b!1153756 m!1064003))

(declare-fun m!1064005 () Bool)

(assert (=> b!1153760 m!1064005))

(declare-fun m!1064007 () Bool)

(assert (=> b!1153760 m!1064007))

(declare-fun m!1064009 () Bool)

(assert (=> b!1153761 m!1064009))

(declare-fun m!1064011 () Bool)

(assert (=> b!1153755 m!1064011))

(declare-fun m!1064013 () Bool)

(assert (=> b!1153750 m!1064013))

(declare-fun m!1064015 () Bool)

(assert (=> b!1153750 m!1064015))

(declare-fun m!1064017 () Bool)

(assert (=> b!1153750 m!1064017))

(declare-fun m!1064019 () Bool)

(assert (=> b!1153750 m!1064019))

(declare-fun m!1064021 () Bool)

(assert (=> bm!54157 m!1064021))

(declare-fun m!1064023 () Bool)

(assert (=> bm!54158 m!1064023))

(declare-fun m!1064025 () Bool)

(assert (=> b!1153757 m!1064025))

(assert (=> b!1153757 m!1064025))

(declare-fun m!1064027 () Bool)

(assert (=> b!1153757 m!1064027))

(declare-fun m!1064029 () Bool)

(assert (=> b!1153757 m!1064029))

(declare-fun m!1064031 () Bool)

(assert (=> b!1153735 m!1064031))

(declare-fun m!1064033 () Bool)

(assert (=> b!1153735 m!1064033))

(declare-fun m!1064035 () Bool)

(assert (=> b!1153735 m!1064035))

(declare-fun m!1064037 () Bool)

(assert (=> b!1153735 m!1064037))

(declare-fun m!1064039 () Bool)

(assert (=> b!1153758 m!1064039))

(declare-fun m!1064041 () Bool)

(assert (=> bm!54155 m!1064041))

(assert (=> b!1153764 m!1063997))

(declare-fun m!1064043 () Bool)

(assert (=> b!1153753 m!1064043))

(declare-fun m!1064045 () Bool)

(assert (=> b!1153753 m!1064045))

(declare-fun m!1064047 () Bool)

(assert (=> b!1153741 m!1064047))

(declare-fun m!1064049 () Bool)

(assert (=> b!1153743 m!1064049))

(declare-fun m!1064051 () Bool)

(assert (=> b!1153763 m!1064051))

(assert (=> b!1153742 m!1064041))

(declare-fun m!1064053 () Bool)

(assert (=> b!1153742 m!1064053))

(declare-fun m!1064055 () Bool)

(assert (=> b!1153742 m!1064055))

(assert (=> b!1153742 m!1064001))

(declare-fun m!1064057 () Bool)

(assert (=> b!1153742 m!1064057))

(assert (=> b!1153742 m!1064055))

(assert (=> b!1153742 m!1064053))

(declare-fun m!1064059 () Bool)

(assert (=> b!1153742 m!1064059))

(declare-fun m!1064061 () Bool)

(assert (=> b!1153742 m!1064061))

(declare-fun m!1064063 () Bool)

(assert (=> b!1153742 m!1064063))

(assert (=> b!1153742 m!1064001))

(declare-fun m!1064065 () Bool)

(assert (=> b!1153742 m!1064065))

(assert (=> b!1153742 m!1064001))

(declare-fun m!1064067 () Bool)

(assert (=> b!1153759 m!1064067))

(declare-fun m!1064069 () Bool)

(assert (=> mapNonEmpty!45188 m!1064069))

(declare-fun m!1064071 () Bool)

(assert (=> bm!54154 m!1064071))

(assert (=> b!1153744 m!1064023))

(check-sat (not b!1153744) (not b!1153761) (not b!1153742) (not bm!54155) (not bm!54158) (not b!1153759) (not b!1153756) (not b!1153753) (not b!1153736) b_and!39611 (not b_lambda!19479) (not b!1153743) (not b!1153741) tp_is_empty!28909 (not bm!54154) (not start!99010) (not b!1153735) (not bm!54157) (not b_next!24379) (not b!1153764) (not b!1153757) (not b!1153760) (not b!1153750) (not mapNonEmpty!45188) (not b!1153758) (not b!1153755) (not bm!54159))
(check-sat b_and!39611 (not b_next!24379))
