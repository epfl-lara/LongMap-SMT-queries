; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98492 () Bool)

(assert start!98492)

(declare-fun b_free!24103 () Bool)

(declare-fun b_next!24103 () Bool)

(assert (=> start!98492 (= b_free!24103 (not b_next!24103))))

(declare-fun tp!85019 () Bool)

(declare-fun b_and!39033 () Bool)

(assert (=> start!98492 (= tp!85019 b_and!39033)))

(declare-fun b!1139768 () Bool)

(declare-datatypes ((Unit!37219 0))(
  ( (Unit!37220) )
))
(declare-fun e!648480 () Unit!37219)

(declare-fun lt!507262 () Unit!37219)

(assert (=> b!1139768 (= e!648480 lt!507262)))

(declare-fun call!50757 () Unit!37219)

(assert (=> b!1139768 (= lt!507262 call!50757)))

(declare-fun call!50758 () Bool)

(assert (=> b!1139768 call!50758))

(declare-fun b!1139769 () Bool)

(assert (=> b!1139769 call!50758))

(declare-fun lt!507248 () Unit!37219)

(assert (=> b!1139769 (= lt!507248 call!50757)))

(declare-fun e!648479 () Unit!37219)

(assert (=> b!1139769 (= e!648479 lt!507248)))

(declare-fun b!1139770 () Bool)

(declare-fun res!760061 () Bool)

(declare-fun e!648486 () Bool)

(assert (=> b!1139770 (=> (not res!760061) (not e!648486))))

(declare-datatypes ((array!74048 0))(
  ( (array!74049 (arr!35675 (Array (_ BitVec 32) (_ BitVec 64))) (size!36213 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74048)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74048 (_ BitVec 32)) Bool)

(assert (=> b!1139770 (= res!760061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139771 () Bool)

(declare-fun res!760064 () Bool)

(assert (=> b!1139771 (=> (not res!760064) (not e!648486))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!43305 0))(
  ( (V!43306 (val!14373 Int)) )
))
(declare-datatypes ((ValueCell!13607 0))(
  ( (ValueCellFull!13607 (v!17009 V!43305)) (EmptyCell!13607) )
))
(declare-datatypes ((array!74050 0))(
  ( (array!74051 (arr!35676 (Array (_ BitVec 32) ValueCell!13607)) (size!36214 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74050)

(assert (=> b!1139771 (= res!760064 (and (= (size!36214 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36213 _keys!1208) (size!36214 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139772 () Bool)

(declare-fun e!648487 () Bool)

(declare-fun lt!507257 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1139772 (= e!648487 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507257) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun c!111762 () Bool)

(declare-datatypes ((tuple2!18260 0))(
  ( (tuple2!18261 (_1!9141 (_ BitVec 64)) (_2!9141 V!43305)) )
))
(declare-datatypes ((List!24999 0))(
  ( (Nil!24996) (Cons!24995 (h!26204 tuple2!18260) (t!36085 List!24999)) )
))
(declare-datatypes ((ListLongMap!16229 0))(
  ( (ListLongMap!16230 (toList!8130 List!24999)) )
))
(declare-fun lt!507244 () ListLongMap!16229)

(declare-fun call!50762 () Bool)

(declare-fun bm!50752 () Bool)

(declare-fun call!50759 () ListLongMap!16229)

(declare-fun contains!6602 (ListLongMap!16229 (_ BitVec 64)) Bool)

(assert (=> bm!50752 (= call!50762 (contains!6602 (ite c!111762 lt!507244 call!50759) k0!934))))

(declare-fun b!1139773 () Bool)

(declare-fun e!648488 () Bool)

(declare-fun e!648484 () Bool)

(assert (=> b!1139773 (= e!648488 e!648484)))

(declare-fun res!760066 () Bool)

(assert (=> b!1139773 (=> res!760066 e!648484)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1139773 (= res!760066 (not (= (select (arr!35675 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648481 () Bool)

(assert (=> b!1139773 e!648481))

(declare-fun c!111760 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139773 (= c!111760 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43305)

(declare-fun lt!507254 () Unit!37219)

(declare-fun minValue!944 () V!43305)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!501 (array!74048 array!74050 (_ BitVec 32) (_ BitVec 32) V!43305 V!43305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37219)

(assert (=> b!1139773 (= lt!507254 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50753 () Bool)

(declare-fun call!50756 () ListLongMap!16229)

(assert (=> bm!50753 (= call!50759 call!50756)))

(declare-fun lt!507245 () array!74050)

(declare-fun lt!507261 () array!74048)

(declare-fun bm!50754 () Bool)

(declare-fun call!50760 () ListLongMap!16229)

(declare-fun getCurrentListMapNoExtraKeys!4625 (array!74048 array!74050 (_ BitVec 32) (_ BitVec 32) V!43305 V!43305 (_ BitVec 32) Int) ListLongMap!16229)

(assert (=> bm!50754 (= call!50760 (getCurrentListMapNoExtraKeys!4625 lt!507261 lt!507245 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139774 () Bool)

(declare-fun res!760063 () Bool)

(assert (=> b!1139774 (=> (not res!760063) (not e!648486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139774 (= res!760063 (validKeyInArray!0 k0!934))))

(declare-fun bm!50755 () Bool)

(declare-fun call!50761 () ListLongMap!16229)

(assert (=> bm!50755 (= call!50761 (getCurrentListMapNoExtraKeys!4625 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139775 () Bool)

(declare-fun e!648474 () Unit!37219)

(declare-fun Unit!37221 () Unit!37219)

(assert (=> b!1139775 (= e!648474 Unit!37221)))

(declare-fun mapIsEmpty!44774 () Bool)

(declare-fun mapRes!44774 () Bool)

(assert (=> mapIsEmpty!44774 mapRes!44774))

(declare-fun b!1139776 () Bool)

(declare-fun e!648483 () Bool)

(assert (=> b!1139776 (= e!648483 e!648488)))

(declare-fun res!760069 () Bool)

(assert (=> b!1139776 (=> res!760069 e!648488)))

(assert (=> b!1139776 (= res!760069 (not (= from!1455 i!673)))))

(declare-fun lt!507253 () ListLongMap!16229)

(assert (=> b!1139776 (= lt!507253 (getCurrentListMapNoExtraKeys!4625 lt!507261 lt!507245 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!507250 () V!43305)

(assert (=> b!1139776 (= lt!507245 (array!74051 (store (arr!35676 _values!996) i!673 (ValueCellFull!13607 lt!507250)) (size!36214 _values!996)))))

(declare-fun dynLambda!2609 (Int (_ BitVec 64)) V!43305)

(assert (=> b!1139776 (= lt!507250 (dynLambda!2609 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507258 () ListLongMap!16229)

(assert (=> b!1139776 (= lt!507258 (getCurrentListMapNoExtraKeys!4625 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139777 () Bool)

(declare-fun res!760068 () Bool)

(assert (=> b!1139777 (=> (not res!760068) (not e!648486))))

(assert (=> b!1139777 (= res!760068 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36213 _keys!1208))))))

(declare-fun lt!507264 () ListLongMap!16229)

(declare-fun c!111763 () Bool)

(declare-fun bm!50756 () Bool)

(declare-fun call!50755 () Unit!37219)

(declare-fun addStillContains!774 (ListLongMap!16229 (_ BitVec 64) V!43305 (_ BitVec 64)) Unit!37219)

(assert (=> bm!50756 (= call!50755 (addStillContains!774 lt!507264 (ite (or c!111762 c!111763) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111762 c!111763) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1139778 () Bool)

(assert (=> b!1139778 (= e!648484 true)))

(declare-fun lt!507259 () V!43305)

(declare-fun -!1217 (ListLongMap!16229 (_ BitVec 64)) ListLongMap!16229)

(declare-fun +!3557 (ListLongMap!16229 tuple2!18260) ListLongMap!16229)

(assert (=> b!1139778 (= (-!1217 (+!3557 lt!507264 (tuple2!18261 (select (arr!35675 _keys!1208) from!1455) lt!507259)) (select (arr!35675 _keys!1208) from!1455)) lt!507264)))

(declare-fun lt!507247 () Unit!37219)

(declare-fun addThenRemoveForNewKeyIsSame!85 (ListLongMap!16229 (_ BitVec 64) V!43305) Unit!37219)

(assert (=> b!1139778 (= lt!507247 (addThenRemoveForNewKeyIsSame!85 lt!507264 (select (arr!35675 _keys!1208) from!1455) lt!507259))))

(declare-fun get!18133 (ValueCell!13607 V!43305) V!43305)

(assert (=> b!1139778 (= lt!507259 (get!18133 (select (arr!35676 _values!996) from!1455) lt!507250))))

(declare-fun lt!507246 () Unit!37219)

(assert (=> b!1139778 (= lt!507246 e!648474)))

(declare-fun c!111761 () Bool)

(assert (=> b!1139778 (= c!111761 (contains!6602 lt!507264 k0!934))))

(assert (=> b!1139778 (= lt!507264 (getCurrentListMapNoExtraKeys!4625 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139779 () Bool)

(declare-fun Unit!37222 () Unit!37219)

(assert (=> b!1139779 (= e!648479 Unit!37222)))

(declare-fun b!1139780 () Bool)

(assert (=> b!1139780 (= e!648480 e!648479)))

(declare-fun c!111759 () Bool)

(assert (=> b!1139780 (= c!111759 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507257))))

(declare-fun b!1139781 () Bool)

(declare-fun res!760071 () Bool)

(declare-fun e!648485 () Bool)

(assert (=> b!1139781 (=> (not res!760071) (not e!648485))))

(declare-datatypes ((List!25000 0))(
  ( (Nil!24997) (Cons!24996 (h!26205 (_ BitVec 64)) (t!36086 List!25000)) )
))
(declare-fun arrayNoDuplicates!0 (array!74048 (_ BitVec 32) List!25000) Bool)

(assert (=> b!1139781 (= res!760071 (arrayNoDuplicates!0 lt!507261 #b00000000000000000000000000000000 Nil!24997))))

(declare-fun b!1139782 () Bool)

(assert (=> b!1139782 (= e!648485 (not e!648483))))

(declare-fun res!760062 () Bool)

(assert (=> b!1139782 (=> res!760062 e!648483)))

(assert (=> b!1139782 (= res!760062 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139782 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507251 () Unit!37219)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74048 (_ BitVec 64) (_ BitVec 32)) Unit!37219)

(assert (=> b!1139782 (= lt!507251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!50757 () Bool)

(assert (=> bm!50757 (= call!50757 call!50755)))

(declare-fun b!1139783 () Bool)

(declare-fun e!648476 () Bool)

(declare-fun tp_is_empty!28633 () Bool)

(assert (=> b!1139783 (= e!648476 tp_is_empty!28633)))

(declare-fun b!1139784 () Bool)

(declare-fun res!760070 () Bool)

(assert (=> b!1139784 (=> (not res!760070) (not e!648486))))

(assert (=> b!1139784 (= res!760070 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24997))))

(declare-fun b!1139785 () Bool)

(declare-fun res!760067 () Bool)

(assert (=> b!1139785 (=> (not res!760067) (not e!648486))))

(assert (=> b!1139785 (= res!760067 (= (select (arr!35675 _keys!1208) i!673) k0!934))))

(declare-fun b!1139786 () Bool)

(assert (=> b!1139786 (= e!648481 (= call!50760 (-!1217 call!50761 k0!934)))))

(declare-fun b!1139787 () Bool)

(assert (=> b!1139787 (contains!6602 call!50756 k0!934)))

(declare-fun lt!507256 () Unit!37219)

(assert (=> b!1139787 (= lt!507256 (addStillContains!774 lt!507244 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1139787 call!50762))

(assert (=> b!1139787 (= lt!507244 (+!3557 lt!507264 (tuple2!18261 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507263 () Unit!37219)

(assert (=> b!1139787 (= lt!507263 call!50755)))

(declare-fun e!648477 () Unit!37219)

(assert (=> b!1139787 (= e!648477 lt!507256)))

(declare-fun b!1139788 () Bool)

(declare-fun e!648478 () Bool)

(assert (=> b!1139788 (= e!648478 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50758 () Bool)

(assert (=> bm!50758 (= call!50758 call!50762)))

(declare-fun b!1139789 () Bool)

(declare-fun e!648489 () Bool)

(assert (=> b!1139789 (= e!648489 (and e!648476 mapRes!44774))))

(declare-fun condMapEmpty!44774 () Bool)

(declare-fun mapDefault!44774 () ValueCell!13607)

(assert (=> b!1139789 (= condMapEmpty!44774 (= (arr!35676 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13607)) mapDefault!44774)))))

(declare-fun b!1139790 () Bool)

(assert (=> b!1139790 (= e!648486 e!648485)))

(declare-fun res!760072 () Bool)

(assert (=> b!1139790 (=> (not res!760072) (not e!648485))))

(assert (=> b!1139790 (= res!760072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507261 mask!1564))))

(assert (=> b!1139790 (= lt!507261 (array!74049 (store (arr!35675 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36213 _keys!1208)))))

(declare-fun b!1139791 () Bool)

(declare-fun e!648482 () Bool)

(assert (=> b!1139791 (= e!648482 tp_is_empty!28633)))

(declare-fun b!1139792 () Bool)

(assert (=> b!1139792 (= c!111763 (and (not lt!507257) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139792 (= e!648477 e!648480)))

(declare-fun b!1139793 () Bool)

(assert (=> b!1139793 (= e!648487 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44774 () Bool)

(declare-fun tp!85020 () Bool)

(assert (=> mapNonEmpty!44774 (= mapRes!44774 (and tp!85020 e!648482))))

(declare-fun mapKey!44774 () (_ BitVec 32))

(declare-fun mapRest!44774 () (Array (_ BitVec 32) ValueCell!13607))

(declare-fun mapValue!44774 () ValueCell!13607)

(assert (=> mapNonEmpty!44774 (= (arr!35676 _values!996) (store mapRest!44774 mapKey!44774 mapValue!44774))))

(declare-fun res!760065 () Bool)

(assert (=> start!98492 (=> (not res!760065) (not e!648486))))

(assert (=> start!98492 (= res!760065 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36213 _keys!1208))))))

(assert (=> start!98492 e!648486))

(assert (=> start!98492 tp_is_empty!28633))

(declare-fun array_inv!27416 (array!74048) Bool)

(assert (=> start!98492 (array_inv!27416 _keys!1208)))

(assert (=> start!98492 true))

(assert (=> start!98492 tp!85019))

(declare-fun array_inv!27417 (array!74050) Bool)

(assert (=> start!98492 (and (array_inv!27417 _values!996) e!648489)))

(declare-fun bm!50759 () Bool)

(assert (=> bm!50759 (= call!50756 (+!3557 (ite c!111762 lt!507244 lt!507264) (ite c!111762 (tuple2!18261 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111763 (tuple2!18261 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18261 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1139794 () Bool)

(assert (=> b!1139794 (= e!648481 (= call!50760 call!50761))))

(declare-fun b!1139795 () Bool)

(declare-fun res!760073 () Bool)

(assert (=> b!1139795 (=> (not res!760073) (not e!648486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139795 (= res!760073 (validMask!0 mask!1564))))

(declare-fun b!1139796 () Bool)

(declare-fun Unit!37223 () Unit!37219)

(assert (=> b!1139796 (= e!648474 Unit!37223)))

(assert (=> b!1139796 (= lt!507257 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139796 (= c!111762 (and (not lt!507257) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507252 () Unit!37219)

(assert (=> b!1139796 (= lt!507252 e!648477)))

(declare-fun lt!507260 () Unit!37219)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!376 (array!74048 array!74050 (_ BitVec 32) (_ BitVec 32) V!43305 V!43305 (_ BitVec 64) (_ BitVec 32) Int) Unit!37219)

(assert (=> b!1139796 (= lt!507260 (lemmaListMapContainsThenArrayContainsFrom!376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111764 () Bool)

(assert (=> b!1139796 (= c!111764 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760060 () Bool)

(assert (=> b!1139796 (= res!760060 e!648487)))

(assert (=> b!1139796 (=> (not res!760060) (not e!648478))))

(assert (=> b!1139796 e!648478))

(declare-fun lt!507255 () Unit!37219)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74048 (_ BitVec 32) (_ BitVec 32)) Unit!37219)

(assert (=> b!1139796 (= lt!507255 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139796 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24997)))

(declare-fun lt!507249 () Unit!37219)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74048 (_ BitVec 64) (_ BitVec 32) List!25000) Unit!37219)

(assert (=> b!1139796 (= lt!507249 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24997))))

(assert (=> b!1139796 false))

(assert (= (and start!98492 res!760065) b!1139795))

(assert (= (and b!1139795 res!760073) b!1139771))

(assert (= (and b!1139771 res!760064) b!1139770))

(assert (= (and b!1139770 res!760061) b!1139784))

(assert (= (and b!1139784 res!760070) b!1139777))

(assert (= (and b!1139777 res!760068) b!1139774))

(assert (= (and b!1139774 res!760063) b!1139785))

(assert (= (and b!1139785 res!760067) b!1139790))

(assert (= (and b!1139790 res!760072) b!1139781))

(assert (= (and b!1139781 res!760071) b!1139782))

(assert (= (and b!1139782 (not res!760062)) b!1139776))

(assert (= (and b!1139776 (not res!760069)) b!1139773))

(assert (= (and b!1139773 c!111760) b!1139786))

(assert (= (and b!1139773 (not c!111760)) b!1139794))

(assert (= (or b!1139786 b!1139794) bm!50754))

(assert (= (or b!1139786 b!1139794) bm!50755))

(assert (= (and b!1139773 (not res!760066)) b!1139778))

(assert (= (and b!1139778 c!111761) b!1139796))

(assert (= (and b!1139778 (not c!111761)) b!1139775))

(assert (= (and b!1139796 c!111762) b!1139787))

(assert (= (and b!1139796 (not c!111762)) b!1139792))

(assert (= (and b!1139792 c!111763) b!1139768))

(assert (= (and b!1139792 (not c!111763)) b!1139780))

(assert (= (and b!1139780 c!111759) b!1139769))

(assert (= (and b!1139780 (not c!111759)) b!1139779))

(assert (= (or b!1139768 b!1139769) bm!50757))

(assert (= (or b!1139768 b!1139769) bm!50753))

(assert (= (or b!1139768 b!1139769) bm!50758))

(assert (= (or b!1139787 bm!50758) bm!50752))

(assert (= (or b!1139787 bm!50757) bm!50756))

(assert (= (or b!1139787 bm!50753) bm!50759))

(assert (= (and b!1139796 c!111764) b!1139793))

(assert (= (and b!1139796 (not c!111764)) b!1139772))

(assert (= (and b!1139796 res!760060) b!1139788))

(assert (= (and b!1139789 condMapEmpty!44774) mapIsEmpty!44774))

(assert (= (and b!1139789 (not condMapEmpty!44774)) mapNonEmpty!44774))

(get-info :version)

(assert (= (and mapNonEmpty!44774 ((_ is ValueCellFull!13607) mapValue!44774)) b!1139791))

(assert (= (and b!1139789 ((_ is ValueCellFull!13607) mapDefault!44774)) b!1139783))

(assert (= start!98492 b!1139789))

(declare-fun b_lambda!19191 () Bool)

(assert (=> (not b_lambda!19191) (not b!1139776)))

(declare-fun t!36084 () Bool)

(declare-fun tb!8907 () Bool)

(assert (=> (and start!98492 (= defaultEntry!1004 defaultEntry!1004) t!36084) tb!8907))

(declare-fun result!18387 () Bool)

(assert (=> tb!8907 (= result!18387 tp_is_empty!28633)))

(assert (=> b!1139776 t!36084))

(declare-fun b_and!39035 () Bool)

(assert (= b_and!39033 (and (=> t!36084 result!18387) b_and!39035)))

(declare-fun m!1050869 () Bool)

(assert (=> b!1139770 m!1050869))

(declare-fun m!1050871 () Bool)

(assert (=> b!1139773 m!1050871))

(declare-fun m!1050873 () Bool)

(assert (=> b!1139773 m!1050873))

(declare-fun m!1050875 () Bool)

(assert (=> b!1139790 m!1050875))

(declare-fun m!1050877 () Bool)

(assert (=> b!1139790 m!1050877))

(declare-fun m!1050879 () Bool)

(assert (=> b!1139774 m!1050879))

(declare-fun m!1050881 () Bool)

(assert (=> b!1139793 m!1050881))

(declare-fun m!1050883 () Bool)

(assert (=> b!1139796 m!1050883))

(declare-fun m!1050885 () Bool)

(assert (=> b!1139796 m!1050885))

(declare-fun m!1050887 () Bool)

(assert (=> b!1139796 m!1050887))

(declare-fun m!1050889 () Bool)

(assert (=> b!1139796 m!1050889))

(declare-fun m!1050891 () Bool)

(assert (=> bm!50755 m!1050891))

(declare-fun m!1050893 () Bool)

(assert (=> mapNonEmpty!44774 m!1050893))

(declare-fun m!1050895 () Bool)

(assert (=> bm!50754 m!1050895))

(declare-fun m!1050897 () Bool)

(assert (=> b!1139776 m!1050897))

(declare-fun m!1050899 () Bool)

(assert (=> b!1139776 m!1050899))

(declare-fun m!1050901 () Bool)

(assert (=> b!1139776 m!1050901))

(declare-fun m!1050903 () Bool)

(assert (=> b!1139776 m!1050903))

(declare-fun m!1050905 () Bool)

(assert (=> b!1139786 m!1050905))

(declare-fun m!1050907 () Bool)

(assert (=> start!98492 m!1050907))

(declare-fun m!1050909 () Bool)

(assert (=> start!98492 m!1050909))

(declare-fun m!1050911 () Bool)

(assert (=> b!1139782 m!1050911))

(declare-fun m!1050913 () Bool)

(assert (=> b!1139782 m!1050913))

(declare-fun m!1050915 () Bool)

(assert (=> b!1139781 m!1050915))

(declare-fun m!1050917 () Bool)

(assert (=> b!1139795 m!1050917))

(declare-fun m!1050919 () Bool)

(assert (=> bm!50752 m!1050919))

(assert (=> b!1139788 m!1050881))

(assert (=> b!1139778 m!1050891))

(declare-fun m!1050921 () Bool)

(assert (=> b!1139778 m!1050921))

(assert (=> b!1139778 m!1050871))

(declare-fun m!1050923 () Bool)

(assert (=> b!1139778 m!1050923))

(declare-fun m!1050925 () Bool)

(assert (=> b!1139778 m!1050925))

(declare-fun m!1050927 () Bool)

(assert (=> b!1139778 m!1050927))

(assert (=> b!1139778 m!1050871))

(assert (=> b!1139778 m!1050921))

(declare-fun m!1050929 () Bool)

(assert (=> b!1139778 m!1050929))

(assert (=> b!1139778 m!1050927))

(assert (=> b!1139778 m!1050871))

(declare-fun m!1050931 () Bool)

(assert (=> b!1139778 m!1050931))

(declare-fun m!1050933 () Bool)

(assert (=> b!1139785 m!1050933))

(declare-fun m!1050935 () Bool)

(assert (=> bm!50756 m!1050935))

(declare-fun m!1050937 () Bool)

(assert (=> bm!50759 m!1050937))

(declare-fun m!1050939 () Bool)

(assert (=> b!1139784 m!1050939))

(declare-fun m!1050941 () Bool)

(assert (=> b!1139787 m!1050941))

(declare-fun m!1050943 () Bool)

(assert (=> b!1139787 m!1050943))

(declare-fun m!1050945 () Bool)

(assert (=> b!1139787 m!1050945))

(check-sat b_and!39035 (not bm!50756) (not bm!50752) (not b!1139778) (not b!1139784) (not b!1139782) (not b_next!24103) (not b!1139787) (not b!1139770) (not b!1139781) (not bm!50759) (not b!1139793) (not b_lambda!19191) (not bm!50754) (not start!98492) (not b!1139788) (not b!1139790) (not b!1139773) (not b!1139776) (not b!1139786) (not bm!50755) (not b!1139796) tp_is_empty!28633 (not mapNonEmpty!44774) (not b!1139774) (not b!1139795))
(check-sat b_and!39035 (not b_next!24103))
