; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98522 () Bool)

(assert start!98522)

(declare-fun b_free!24133 () Bool)

(declare-fun b_next!24133 () Bool)

(assert (=> start!98522 (= b_free!24133 (not b_next!24133))))

(declare-fun tp!85109 () Bool)

(declare-fun b_and!39093 () Bool)

(assert (=> start!98522 (= tp!85109 b_and!39093)))

(declare-fun b!1141103 () Bool)

(declare-fun e!649199 () Bool)

(declare-fun tp_is_empty!28663 () Bool)

(assert (=> b!1141103 (= e!649199 tp_is_empty!28663)))

(declare-fun b!1141104 () Bool)

(declare-fun e!649200 () Bool)

(declare-fun e!649206 () Bool)

(assert (=> b!1141104 (= e!649200 e!649206)))

(declare-fun res!760691 () Bool)

(assert (=> b!1141104 (=> res!760691 e!649206)))

(declare-datatypes ((array!74108 0))(
  ( (array!74109 (arr!35705 (Array (_ BitVec 32) (_ BitVec 64))) (size!36243 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74108)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1141104 (= res!760691 (not (= (select (arr!35705 _keys!1208) from!1455) k0!934)))))

(declare-fun e!649198 () Bool)

(assert (=> b!1141104 e!649198))

(declare-fun c!112032 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141104 (= c!112032 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43345 0))(
  ( (V!43346 (val!14388 Int)) )
))
(declare-fun zeroValue!944 () V!43345)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13622 0))(
  ( (ValueCellFull!13622 (v!17024 V!43345)) (EmptyCell!13622) )
))
(declare-datatypes ((array!74110 0))(
  ( (array!74111 (arr!35706 (Array (_ BitVec 32) ValueCell!13622)) (size!36244 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74110)

(declare-fun minValue!944 () V!43345)

(declare-datatypes ((Unit!37281 0))(
  ( (Unit!37282) )
))
(declare-fun lt!508199 () Unit!37281)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!511 (array!74108 array!74110 (_ BitVec 32) (_ BitVec 32) V!43345 V!43345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37281)

(assert (=> b!1141104 (= lt!508199 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!511 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141105 () Bool)

(declare-fun e!649209 () Unit!37281)

(declare-fun e!649195 () Unit!37281)

(assert (=> b!1141105 (= e!649209 e!649195)))

(declare-fun c!112029 () Bool)

(declare-fun lt!508201 () Bool)

(assert (=> b!1141105 (= c!112029 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508201))))

(declare-fun b!1141106 () Bool)

(declare-fun e!649202 () Bool)

(declare-fun mapRes!44819 () Bool)

(assert (=> b!1141106 (= e!649202 (and e!649199 mapRes!44819))))

(declare-fun condMapEmpty!44819 () Bool)

(declare-fun mapDefault!44819 () ValueCell!13622)

(assert (=> b!1141106 (= condMapEmpty!44819 (= (arr!35706 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13622)) mapDefault!44819)))))

(declare-fun b!1141107 () Bool)

(declare-fun res!760699 () Bool)

(declare-fun e!649201 () Bool)

(assert (=> b!1141107 (=> (not res!760699) (not e!649201))))

(assert (=> b!1141107 (= res!760699 (= (select (arr!35705 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44819 () Bool)

(assert (=> mapIsEmpty!44819 mapRes!44819))

(declare-fun b!1141108 () Bool)

(declare-fun e!649196 () Bool)

(assert (=> b!1141108 (= e!649196 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508201) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun c!112031 () Bool)

(declare-datatypes ((tuple2!18288 0))(
  ( (tuple2!18289 (_1!9155 (_ BitVec 64)) (_2!9155 V!43345)) )
))
(declare-datatypes ((List!25027 0))(
  ( (Nil!25024) (Cons!25023 (h!26232 tuple2!18288) (t!36143 List!25027)) )
))
(declare-datatypes ((ListLongMap!16257 0))(
  ( (ListLongMap!16258 (toList!8144 List!25027)) )
))
(declare-fun lt!508207 () ListLongMap!16257)

(declare-fun lt!508195 () ListLongMap!16257)

(declare-fun bm!51112 () Bool)

(declare-fun call!51120 () ListLongMap!16257)

(declare-fun c!112034 () Bool)

(declare-fun +!3571 (ListLongMap!16257 tuple2!18288) ListLongMap!16257)

(assert (=> bm!51112 (= call!51120 (+!3571 (ite c!112031 lt!508207 lt!508195) (ite c!112031 (tuple2!18289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112034 (tuple2!18289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18289 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1141109 () Bool)

(declare-fun e!649208 () Bool)

(assert (=> b!1141109 (= e!649208 e!649200)))

(declare-fun res!760695 () Bool)

(assert (=> b!1141109 (=> res!760695 e!649200)))

(assert (=> b!1141109 (= res!760695 (not (= from!1455 i!673)))))

(declare-fun lt!508196 () ListLongMap!16257)

(declare-fun lt!508202 () array!74108)

(declare-fun lt!508203 () array!74110)

(declare-fun getCurrentListMapNoExtraKeys!4637 (array!74108 array!74110 (_ BitVec 32) (_ BitVec 32) V!43345 V!43345 (_ BitVec 32) Int) ListLongMap!16257)

(assert (=> b!1141109 (= lt!508196 (getCurrentListMapNoExtraKeys!4637 lt!508202 lt!508203 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!508209 () V!43345)

(assert (=> b!1141109 (= lt!508203 (array!74111 (store (arr!35706 _values!996) i!673 (ValueCellFull!13622 lt!508209)) (size!36244 _values!996)))))

(declare-fun dynLambda!2619 (Int (_ BitVec 64)) V!43345)

(assert (=> b!1141109 (= lt!508209 (dynLambda!2619 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508189 () ListLongMap!16257)

(assert (=> b!1141109 (= lt!508189 (getCurrentListMapNoExtraKeys!4637 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141110 () Bool)

(declare-fun call!51122 () ListLongMap!16257)

(declare-fun call!51117 () ListLongMap!16257)

(assert (=> b!1141110 (= e!649198 (= call!51122 call!51117))))

(declare-fun b!1141111 () Bool)

(declare-fun res!760701 () Bool)

(assert (=> b!1141111 (=> (not res!760701) (not e!649201))))

(declare-datatypes ((List!25028 0))(
  ( (Nil!25025) (Cons!25024 (h!26233 (_ BitVec 64)) (t!36144 List!25028)) )
))
(declare-fun arrayNoDuplicates!0 (array!74108 (_ BitVec 32) List!25028) Bool)

(assert (=> b!1141111 (= res!760701 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25025))))

(declare-fun b!1141112 () Bool)

(declare-fun e!649205 () Bool)

(assert (=> b!1141112 (= e!649205 tp_is_empty!28663)))

(declare-fun b!1141113 () Bool)

(declare-fun res!760696 () Bool)

(assert (=> b!1141113 (=> (not res!760696) (not e!649201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141113 (= res!760696 (validKeyInArray!0 k0!934))))

(declare-fun b!1141114 () Bool)

(declare-fun e!649207 () Unit!37281)

(declare-fun Unit!37283 () Unit!37281)

(assert (=> b!1141114 (= e!649207 Unit!37283)))

(declare-fun b!1141115 () Bool)

(declare-fun lt!508193 () Unit!37281)

(assert (=> b!1141115 (= e!649209 lt!508193)))

(declare-fun call!51118 () Unit!37281)

(assert (=> b!1141115 (= lt!508193 call!51118)))

(declare-fun call!51121 () Bool)

(assert (=> b!1141115 call!51121))

(declare-fun b!1141116 () Bool)

(declare-fun res!760693 () Bool)

(assert (=> b!1141116 (=> (not res!760693) (not e!649201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141116 (= res!760693 (validMask!0 mask!1564))))

(declare-fun call!51115 () Unit!37281)

(declare-fun bm!51113 () Bool)

(declare-fun addStillContains!785 (ListLongMap!16257 (_ BitVec 64) V!43345 (_ BitVec 64)) Unit!37281)

(assert (=> bm!51113 (= call!51115 (addStillContains!785 lt!508195 (ite (or c!112031 c!112034) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112031 c!112034) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1141117 () Bool)

(assert (=> b!1141117 (= c!112034 (and (not lt!508201) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649194 () Unit!37281)

(assert (=> b!1141117 (= e!649194 e!649209)))

(declare-fun b!1141118 () Bool)

(declare-fun arrayContainsKey!0 (array!74108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141118 (= e!649196 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44819 () Bool)

(declare-fun tp!85110 () Bool)

(assert (=> mapNonEmpty!44819 (= mapRes!44819 (and tp!85110 e!649205))))

(declare-fun mapValue!44819 () ValueCell!13622)

(declare-fun mapRest!44819 () (Array (_ BitVec 32) ValueCell!13622))

(declare-fun mapKey!44819 () (_ BitVec 32))

(assert (=> mapNonEmpty!44819 (= (arr!35706 _values!996) (store mapRest!44819 mapKey!44819 mapValue!44819))))

(declare-fun b!1141119 () Bool)

(declare-fun -!1229 (ListLongMap!16257 (_ BitVec 64)) ListLongMap!16257)

(assert (=> b!1141119 (= e!649198 (= call!51122 (-!1229 call!51117 k0!934)))))

(declare-fun b!1141120 () Bool)

(declare-fun res!760703 () Bool)

(assert (=> b!1141120 (=> (not res!760703) (not e!649201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74108 (_ BitVec 32)) Bool)

(assert (=> b!1141120 (= res!760703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1141121 () Bool)

(assert (=> b!1141121 (= e!649206 true)))

(declare-fun lt!508205 () V!43345)

(assert (=> b!1141121 (= (-!1229 (+!3571 lt!508195 (tuple2!18289 (select (arr!35705 _keys!1208) from!1455) lt!508205)) (select (arr!35705 _keys!1208) from!1455)) lt!508195)))

(declare-fun lt!508198 () Unit!37281)

(declare-fun addThenRemoveForNewKeyIsSame!95 (ListLongMap!16257 (_ BitVec 64) V!43345) Unit!37281)

(assert (=> b!1141121 (= lt!508198 (addThenRemoveForNewKeyIsSame!95 lt!508195 (select (arr!35705 _keys!1208) from!1455) lt!508205))))

(declare-fun get!18153 (ValueCell!13622 V!43345) V!43345)

(assert (=> b!1141121 (= lt!508205 (get!18153 (select (arr!35706 _values!996) from!1455) lt!508209))))

(declare-fun lt!508192 () Unit!37281)

(assert (=> b!1141121 (= lt!508192 e!649207)))

(declare-fun c!112033 () Bool)

(declare-fun contains!6615 (ListLongMap!16257 (_ BitVec 64)) Bool)

(assert (=> b!1141121 (= c!112033 (contains!6615 lt!508195 k0!934))))

(assert (=> b!1141121 (= lt!508195 (getCurrentListMapNoExtraKeys!4637 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141122 () Bool)

(declare-fun e!649197 () Bool)

(assert (=> b!1141122 (= e!649197 (not e!649208))))

(declare-fun res!760694 () Bool)

(assert (=> b!1141122 (=> res!760694 e!649208)))

(assert (=> b!1141122 (= res!760694 (bvsgt from!1455 i!673))))

(assert (=> b!1141122 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508200 () Unit!37281)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74108 (_ BitVec 64) (_ BitVec 32)) Unit!37281)

(assert (=> b!1141122 (= lt!508200 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!51114 () Bool)

(declare-fun call!51119 () Bool)

(assert (=> bm!51114 (= call!51121 call!51119)))

(declare-fun b!1141123 () Bool)

(assert (=> b!1141123 (= e!649201 e!649197)))

(declare-fun res!760700 () Bool)

(assert (=> b!1141123 (=> (not res!760700) (not e!649197))))

(assert (=> b!1141123 (= res!760700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508202 mask!1564))))

(assert (=> b!1141123 (= lt!508202 (array!74109 (store (arr!35705 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36243 _keys!1208)))))

(declare-fun b!1141124 () Bool)

(declare-fun Unit!37284 () Unit!37281)

(assert (=> b!1141124 (= e!649207 Unit!37284)))

(assert (=> b!1141124 (= lt!508201 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1141124 (= c!112031 (and (not lt!508201) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508206 () Unit!37281)

(assert (=> b!1141124 (= lt!508206 e!649194)))

(declare-fun lt!508204 () Unit!37281)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!386 (array!74108 array!74110 (_ BitVec 32) (_ BitVec 32) V!43345 V!43345 (_ BitVec 64) (_ BitVec 32) Int) Unit!37281)

(assert (=> b!1141124 (= lt!508204 (lemmaListMapContainsThenArrayContainsFrom!386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112030 () Bool)

(assert (=> b!1141124 (= c!112030 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760690 () Bool)

(assert (=> b!1141124 (= res!760690 e!649196)))

(declare-fun e!649204 () Bool)

(assert (=> b!1141124 (=> (not res!760690) (not e!649204))))

(assert (=> b!1141124 e!649204))

(declare-fun lt!508194 () Unit!37281)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74108 (_ BitVec 32) (_ BitVec 32)) Unit!37281)

(assert (=> b!1141124 (= lt!508194 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1141124 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25025)))

(declare-fun lt!508197 () Unit!37281)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74108 (_ BitVec 64) (_ BitVec 32) List!25028) Unit!37281)

(assert (=> b!1141124 (= lt!508197 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25025))))

(assert (=> b!1141124 false))

(declare-fun b!1141125 () Bool)

(declare-fun Unit!37285 () Unit!37281)

(assert (=> b!1141125 (= e!649195 Unit!37285)))

(declare-fun bm!51115 () Bool)

(assert (=> bm!51115 (= call!51118 call!51115)))

(declare-fun b!1141126 () Bool)

(declare-fun res!760702 () Bool)

(assert (=> b!1141126 (=> (not res!760702) (not e!649201))))

(assert (=> b!1141126 (= res!760702 (and (= (size!36244 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36243 _keys!1208) (size!36244 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1141127 () Bool)

(assert (=> b!1141127 call!51121))

(declare-fun lt!508190 () Unit!37281)

(assert (=> b!1141127 (= lt!508190 call!51118)))

(assert (=> b!1141127 (= e!649195 lt!508190)))

(declare-fun b!1141128 () Bool)

(declare-fun res!760697 () Bool)

(assert (=> b!1141128 (=> (not res!760697) (not e!649201))))

(assert (=> b!1141128 (= res!760697 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36243 _keys!1208))))))

(declare-fun b!1141129 () Bool)

(declare-fun res!760698 () Bool)

(assert (=> b!1141129 (=> (not res!760698) (not e!649197))))

(assert (=> b!1141129 (= res!760698 (arrayNoDuplicates!0 lt!508202 #b00000000000000000000000000000000 Nil!25025))))

(declare-fun bm!51116 () Bool)

(declare-fun call!51116 () ListLongMap!16257)

(assert (=> bm!51116 (= call!51116 call!51120)))

(declare-fun b!1141130 () Bool)

(assert (=> b!1141130 (contains!6615 call!51120 k0!934)))

(declare-fun lt!508208 () Unit!37281)

(assert (=> b!1141130 (= lt!508208 (addStillContains!785 lt!508207 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1141130 call!51119))

(assert (=> b!1141130 (= lt!508207 (+!3571 lt!508195 (tuple2!18289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508191 () Unit!37281)

(assert (=> b!1141130 (= lt!508191 call!51115)))

(assert (=> b!1141130 (= e!649194 lt!508208)))

(declare-fun bm!51117 () Bool)

(assert (=> bm!51117 (= call!51122 (getCurrentListMapNoExtraKeys!4637 lt!508202 lt!508203 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51118 () Bool)

(assert (=> bm!51118 (= call!51119 (contains!6615 (ite c!112031 lt!508207 call!51116) k0!934))))

(declare-fun b!1141131 () Bool)

(assert (=> b!1141131 (= e!649204 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51119 () Bool)

(assert (=> bm!51119 (= call!51117 (getCurrentListMapNoExtraKeys!4637 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!760692 () Bool)

(assert (=> start!98522 (=> (not res!760692) (not e!649201))))

(assert (=> start!98522 (= res!760692 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36243 _keys!1208))))))

(assert (=> start!98522 e!649201))

(assert (=> start!98522 tp_is_empty!28663))

(declare-fun array_inv!27440 (array!74108) Bool)

(assert (=> start!98522 (array_inv!27440 _keys!1208)))

(assert (=> start!98522 true))

(assert (=> start!98522 tp!85109))

(declare-fun array_inv!27441 (array!74110) Bool)

(assert (=> start!98522 (and (array_inv!27441 _values!996) e!649202)))

(assert (= (and start!98522 res!760692) b!1141116))

(assert (= (and b!1141116 res!760693) b!1141126))

(assert (= (and b!1141126 res!760702) b!1141120))

(assert (= (and b!1141120 res!760703) b!1141111))

(assert (= (and b!1141111 res!760701) b!1141128))

(assert (= (and b!1141128 res!760697) b!1141113))

(assert (= (and b!1141113 res!760696) b!1141107))

(assert (= (and b!1141107 res!760699) b!1141123))

(assert (= (and b!1141123 res!760700) b!1141129))

(assert (= (and b!1141129 res!760698) b!1141122))

(assert (= (and b!1141122 (not res!760694)) b!1141109))

(assert (= (and b!1141109 (not res!760695)) b!1141104))

(assert (= (and b!1141104 c!112032) b!1141119))

(assert (= (and b!1141104 (not c!112032)) b!1141110))

(assert (= (or b!1141119 b!1141110) bm!51117))

(assert (= (or b!1141119 b!1141110) bm!51119))

(assert (= (and b!1141104 (not res!760691)) b!1141121))

(assert (= (and b!1141121 c!112033) b!1141124))

(assert (= (and b!1141121 (not c!112033)) b!1141114))

(assert (= (and b!1141124 c!112031) b!1141130))

(assert (= (and b!1141124 (not c!112031)) b!1141117))

(assert (= (and b!1141117 c!112034) b!1141115))

(assert (= (and b!1141117 (not c!112034)) b!1141105))

(assert (= (and b!1141105 c!112029) b!1141127))

(assert (= (and b!1141105 (not c!112029)) b!1141125))

(assert (= (or b!1141115 b!1141127) bm!51115))

(assert (= (or b!1141115 b!1141127) bm!51116))

(assert (= (or b!1141115 b!1141127) bm!51114))

(assert (= (or b!1141130 bm!51114) bm!51118))

(assert (= (or b!1141130 bm!51115) bm!51113))

(assert (= (or b!1141130 bm!51116) bm!51112))

(assert (= (and b!1141124 c!112030) b!1141118))

(assert (= (and b!1141124 (not c!112030)) b!1141108))

(assert (= (and b!1141124 res!760690) b!1141131))

(assert (= (and b!1141106 condMapEmpty!44819) mapIsEmpty!44819))

(assert (= (and b!1141106 (not condMapEmpty!44819)) mapNonEmpty!44819))

(get-info :version)

(assert (= (and mapNonEmpty!44819 ((_ is ValueCellFull!13622) mapValue!44819)) b!1141112))

(assert (= (and b!1141106 ((_ is ValueCellFull!13622) mapDefault!44819)) b!1141103))

(assert (= start!98522 b!1141106))

(declare-fun b_lambda!19221 () Bool)

(assert (=> (not b_lambda!19221) (not b!1141109)))

(declare-fun t!36142 () Bool)

(declare-fun tb!8937 () Bool)

(assert (=> (and start!98522 (= defaultEntry!1004 defaultEntry!1004) t!36142) tb!8937))

(declare-fun result!18447 () Bool)

(assert (=> tb!8937 (= result!18447 tp_is_empty!28663)))

(assert (=> b!1141109 t!36142))

(declare-fun b_and!39095 () Bool)

(assert (= b_and!39093 (and (=> t!36142 result!18447) b_and!39095)))

(declare-fun m!1052041 () Bool)

(assert (=> b!1141119 m!1052041))

(declare-fun m!1052043 () Bool)

(assert (=> b!1141118 m!1052043))

(declare-fun m!1052045 () Bool)

(assert (=> bm!51113 m!1052045))

(declare-fun m!1052047 () Bool)

(assert (=> b!1141116 m!1052047))

(declare-fun m!1052049 () Bool)

(assert (=> bm!51112 m!1052049))

(declare-fun m!1052051 () Bool)

(assert (=> b!1141111 m!1052051))

(declare-fun m!1052053 () Bool)

(assert (=> b!1141129 m!1052053))

(declare-fun m!1052055 () Bool)

(assert (=> b!1141124 m!1052055))

(declare-fun m!1052057 () Bool)

(assert (=> b!1141124 m!1052057))

(declare-fun m!1052059 () Bool)

(assert (=> b!1141124 m!1052059))

(declare-fun m!1052061 () Bool)

(assert (=> b!1141124 m!1052061))

(declare-fun m!1052063 () Bool)

(assert (=> bm!51117 m!1052063))

(declare-fun m!1052065 () Bool)

(assert (=> b!1141104 m!1052065))

(declare-fun m!1052067 () Bool)

(assert (=> b!1141104 m!1052067))

(declare-fun m!1052069 () Bool)

(assert (=> mapNonEmpty!44819 m!1052069))

(declare-fun m!1052071 () Bool)

(assert (=> b!1141120 m!1052071))

(declare-fun m!1052073 () Bool)

(assert (=> b!1141107 m!1052073))

(declare-fun m!1052075 () Bool)

(assert (=> b!1141121 m!1052075))

(declare-fun m!1052077 () Bool)

(assert (=> b!1141121 m!1052077))

(assert (=> b!1141121 m!1052077))

(declare-fun m!1052079 () Bool)

(assert (=> b!1141121 m!1052079))

(declare-fun m!1052081 () Bool)

(assert (=> b!1141121 m!1052081))

(assert (=> b!1141121 m!1052065))

(declare-fun m!1052083 () Bool)

(assert (=> b!1141121 m!1052083))

(declare-fun m!1052085 () Bool)

(assert (=> b!1141121 m!1052085))

(assert (=> b!1141121 m!1052065))

(declare-fun m!1052087 () Bool)

(assert (=> b!1141121 m!1052087))

(assert (=> b!1141121 m!1052065))

(assert (=> b!1141121 m!1052081))

(declare-fun m!1052089 () Bool)

(assert (=> start!98522 m!1052089))

(declare-fun m!1052091 () Bool)

(assert (=> start!98522 m!1052091))

(declare-fun m!1052093 () Bool)

(assert (=> b!1141123 m!1052093))

(declare-fun m!1052095 () Bool)

(assert (=> b!1141123 m!1052095))

(declare-fun m!1052097 () Bool)

(assert (=> b!1141122 m!1052097))

(declare-fun m!1052099 () Bool)

(assert (=> b!1141122 m!1052099))

(declare-fun m!1052101 () Bool)

(assert (=> b!1141109 m!1052101))

(declare-fun m!1052103 () Bool)

(assert (=> b!1141109 m!1052103))

(declare-fun m!1052105 () Bool)

(assert (=> b!1141109 m!1052105))

(declare-fun m!1052107 () Bool)

(assert (=> b!1141109 m!1052107))

(assert (=> bm!51119 m!1052075))

(declare-fun m!1052109 () Bool)

(assert (=> bm!51118 m!1052109))

(declare-fun m!1052111 () Bool)

(assert (=> b!1141130 m!1052111))

(declare-fun m!1052113 () Bool)

(assert (=> b!1141130 m!1052113))

(declare-fun m!1052115 () Bool)

(assert (=> b!1141130 m!1052115))

(declare-fun m!1052117 () Bool)

(assert (=> b!1141113 m!1052117))

(assert (=> b!1141131 m!1052043))

(check-sat (not b!1141129) b_and!39095 (not start!98522) (not bm!51112) (not b!1141131) (not b!1141104) (not bm!51118) (not b!1141130) tp_is_empty!28663 (not b!1141118) (not b!1141124) (not b!1141123) (not b!1141111) (not b_lambda!19221) (not b!1141116) (not b!1141121) (not b!1141113) (not b!1141119) (not b_next!24133) (not mapNonEmpty!44819) (not b!1141120) (not bm!51117) (not bm!51113) (not b!1141109) (not bm!51119) (not b!1141122))
(check-sat b_and!39095 (not b_next!24133))
