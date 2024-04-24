; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97666 () Bool)

(assert start!97666)

(declare-fun b_free!23401 () Bool)

(declare-fun b_next!23401 () Bool)

(assert (=> start!97666 (= b_free!23401 (not b_next!23401))))

(declare-fun tp!82501 () Bool)

(declare-fun b_and!37649 () Bool)

(assert (=> start!97666 (= tp!82501 b_and!37649)))

(declare-fun b!1112758 () Bool)

(declare-fun res!742212 () Bool)

(declare-fun e!634626 () Bool)

(assert (=> b!1112758 (=> (not res!742212) (not e!634626))))

(declare-datatypes ((array!72273 0))(
  ( (array!72274 (arr!34783 (Array (_ BitVec 32) (_ BitVec 64))) (size!35320 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72273)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42009 0))(
  ( (V!42010 (val!13887 Int)) )
))
(declare-datatypes ((ValueCell!13121 0))(
  ( (ValueCellFull!13121 (v!16516 V!42009)) (EmptyCell!13121) )
))
(declare-datatypes ((array!72275 0))(
  ( (array!72276 (arr!34784 (Array (_ BitVec 32) ValueCell!13121)) (size!35321 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72275)

(assert (=> b!1112758 (= res!742212 (and (= (size!35321 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35320 _keys!1208) (size!35321 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112759 () Bool)

(declare-fun res!742205 () Bool)

(assert (=> b!1112759 (=> (not res!742205) (not e!634626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112759 (= res!742205 (validMask!0 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17592 0))(
  ( (tuple2!17593 (_1!8807 (_ BitVec 64)) (_2!8807 V!42009)) )
))
(declare-datatypes ((List!24273 0))(
  ( (Nil!24270) (Cons!24269 (h!25487 tuple2!17592) (t!34712 List!24273)) )
))
(declare-datatypes ((ListLongMap!15569 0))(
  ( (ListLongMap!15570 (toList!7800 List!24273)) )
))
(declare-fun call!46966 () ListLongMap!15569)

(declare-fun bm!46963 () Bool)

(declare-fun minValue!944 () V!42009)

(declare-fun lt!496857 () array!72273)

(declare-fun zeroValue!944 () V!42009)

(declare-fun getCurrentListMapNoExtraKeys!4331 (array!72273 array!72275 (_ BitVec 32) (_ BitVec 32) V!42009 V!42009 (_ BitVec 32) Int) ListLongMap!15569)

(declare-fun dynLambda!2443 (Int (_ BitVec 64)) V!42009)

(assert (=> bm!46963 (= call!46966 (getCurrentListMapNoExtraKeys!4331 lt!496857 (array!72276 (store (arr!34784 _values!996) i!673 (ValueCellFull!13121 (dynLambda!2443 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35321 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112760 () Bool)

(declare-fun e!634624 () Bool)

(assert (=> b!1112760 (= e!634626 e!634624)))

(declare-fun res!742213 () Bool)

(assert (=> b!1112760 (=> (not res!742213) (not e!634624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72273 (_ BitVec 32)) Bool)

(assert (=> b!1112760 (= res!742213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496857 mask!1564))))

(assert (=> b!1112760 (= lt!496857 (array!72274 (store (arr!34783 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35320 _keys!1208)))))

(declare-fun b!1112761 () Bool)

(declare-fun res!742210 () Bool)

(assert (=> b!1112761 (=> (not res!742210) (not e!634626))))

(assert (=> b!1112761 (= res!742210 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35320 _keys!1208))))))

(declare-fun b!1112762 () Bool)

(declare-fun res!742204 () Bool)

(assert (=> b!1112762 (=> (not res!742204) (not e!634626))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1112762 (= res!742204 (= (select (arr!34783 _keys!1208) i!673) k0!934))))

(declare-fun call!46967 () ListLongMap!15569)

(declare-fun bm!46964 () Bool)

(assert (=> bm!46964 (= call!46967 (getCurrentListMapNoExtraKeys!4331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112763 () Bool)

(declare-fun e!634620 () Bool)

(assert (=> b!1112763 (= e!634624 (not e!634620))))

(declare-fun res!742209 () Bool)

(assert (=> b!1112763 (=> res!742209 e!634620)))

(assert (=> b!1112763 (= res!742209 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35320 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112763 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36447 0))(
  ( (Unit!36448) )
))
(declare-fun lt!496856 () Unit!36447)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72273 (_ BitVec 64) (_ BitVec 32)) Unit!36447)

(assert (=> b!1112763 (= lt!496856 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112764 () Bool)

(assert (=> b!1112764 (= e!634620 true)))

(declare-fun e!634622 () Bool)

(assert (=> b!1112764 e!634622))

(declare-fun c!109709 () Bool)

(assert (=> b!1112764 (= c!109709 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496858 () Unit!36447)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!312 (array!72273 array!72275 (_ BitVec 32) (_ BitVec 32) V!42009 V!42009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36447)

(assert (=> b!1112764 (= lt!496858 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!312 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112765 () Bool)

(declare-fun e!634625 () Bool)

(declare-fun e!634623 () Bool)

(declare-fun mapRes!43309 () Bool)

(assert (=> b!1112765 (= e!634625 (and e!634623 mapRes!43309))))

(declare-fun condMapEmpty!43309 () Bool)

(declare-fun mapDefault!43309 () ValueCell!13121)

(assert (=> b!1112765 (= condMapEmpty!43309 (= (arr!34784 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13121)) mapDefault!43309)))))

(declare-fun res!742207 () Bool)

(assert (=> start!97666 (=> (not res!742207) (not e!634626))))

(assert (=> start!97666 (= res!742207 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35320 _keys!1208))))))

(assert (=> start!97666 e!634626))

(declare-fun tp_is_empty!27661 () Bool)

(assert (=> start!97666 tp_is_empty!27661))

(declare-fun array_inv!26802 (array!72273) Bool)

(assert (=> start!97666 (array_inv!26802 _keys!1208)))

(assert (=> start!97666 true))

(assert (=> start!97666 tp!82501))

(declare-fun array_inv!26803 (array!72275) Bool)

(assert (=> start!97666 (and (array_inv!26803 _values!996) e!634625)))

(declare-fun b!1112766 () Bool)

(declare-fun res!742206 () Bool)

(assert (=> b!1112766 (=> (not res!742206) (not e!634626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112766 (= res!742206 (validKeyInArray!0 k0!934))))

(declare-fun b!1112767 () Bool)

(declare-fun res!742211 () Bool)

(assert (=> b!1112767 (=> (not res!742211) (not e!634626))))

(assert (=> b!1112767 (= res!742211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112768 () Bool)

(declare-fun res!742203 () Bool)

(assert (=> b!1112768 (=> (not res!742203) (not e!634624))))

(declare-datatypes ((List!24274 0))(
  ( (Nil!24271) (Cons!24270 (h!25488 (_ BitVec 64)) (t!34713 List!24274)) )
))
(declare-fun arrayNoDuplicates!0 (array!72273 (_ BitVec 32) List!24274) Bool)

(assert (=> b!1112768 (= res!742203 (arrayNoDuplicates!0 lt!496857 #b00000000000000000000000000000000 Nil!24271))))

(declare-fun b!1112769 () Bool)

(declare-fun res!742208 () Bool)

(assert (=> b!1112769 (=> (not res!742208) (not e!634626))))

(assert (=> b!1112769 (= res!742208 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24271))))

(declare-fun b!1112770 () Bool)

(assert (=> b!1112770 (= e!634622 (= call!46966 call!46967))))

(declare-fun mapNonEmpty!43309 () Bool)

(declare-fun tp!82502 () Bool)

(declare-fun e!634619 () Bool)

(assert (=> mapNonEmpty!43309 (= mapRes!43309 (and tp!82502 e!634619))))

(declare-fun mapValue!43309 () ValueCell!13121)

(declare-fun mapKey!43309 () (_ BitVec 32))

(declare-fun mapRest!43309 () (Array (_ BitVec 32) ValueCell!13121))

(assert (=> mapNonEmpty!43309 (= (arr!34784 _values!996) (store mapRest!43309 mapKey!43309 mapValue!43309))))

(declare-fun mapIsEmpty!43309 () Bool)

(assert (=> mapIsEmpty!43309 mapRes!43309))

(declare-fun b!1112771 () Bool)

(assert (=> b!1112771 (= e!634619 tp_is_empty!27661)))

(declare-fun b!1112772 () Bool)

(assert (=> b!1112772 (= e!634623 tp_is_empty!27661)))

(declare-fun b!1112773 () Bool)

(declare-fun -!1048 (ListLongMap!15569 (_ BitVec 64)) ListLongMap!15569)

(assert (=> b!1112773 (= e!634622 (= call!46966 (-!1048 call!46967 k0!934)))))

(assert (= (and start!97666 res!742207) b!1112759))

(assert (= (and b!1112759 res!742205) b!1112758))

(assert (= (and b!1112758 res!742212) b!1112767))

(assert (= (and b!1112767 res!742211) b!1112769))

(assert (= (and b!1112769 res!742208) b!1112761))

(assert (= (and b!1112761 res!742210) b!1112766))

(assert (= (and b!1112766 res!742206) b!1112762))

(assert (= (and b!1112762 res!742204) b!1112760))

(assert (= (and b!1112760 res!742213) b!1112768))

(assert (= (and b!1112768 res!742203) b!1112763))

(assert (= (and b!1112763 (not res!742209)) b!1112764))

(assert (= (and b!1112764 c!109709) b!1112773))

(assert (= (and b!1112764 (not c!109709)) b!1112770))

(assert (= (or b!1112773 b!1112770) bm!46963))

(assert (= (or b!1112773 b!1112770) bm!46964))

(assert (= (and b!1112765 condMapEmpty!43309) mapIsEmpty!43309))

(assert (= (and b!1112765 (not condMapEmpty!43309)) mapNonEmpty!43309))

(get-info :version)

(assert (= (and mapNonEmpty!43309 ((_ is ValueCellFull!13121) mapValue!43309)) b!1112771))

(assert (= (and b!1112765 ((_ is ValueCellFull!13121) mapDefault!43309)) b!1112772))

(assert (= start!97666 b!1112765))

(declare-fun b_lambda!18435 () Bool)

(assert (=> (not b_lambda!18435) (not bm!46963)))

(declare-fun t!34711 () Bool)

(declare-fun tb!8259 () Bool)

(assert (=> (and start!97666 (= defaultEntry!1004 defaultEntry!1004) t!34711) tb!8259))

(declare-fun result!17087 () Bool)

(assert (=> tb!8259 (= result!17087 tp_is_empty!27661)))

(assert (=> bm!46963 t!34711))

(declare-fun b_and!37651 () Bool)

(assert (= b_and!37649 (and (=> t!34711 result!17087) b_and!37651)))

(declare-fun m!1030893 () Bool)

(assert (=> b!1112763 m!1030893))

(declare-fun m!1030895 () Bool)

(assert (=> b!1112763 m!1030895))

(declare-fun m!1030897 () Bool)

(assert (=> mapNonEmpty!43309 m!1030897))

(declare-fun m!1030899 () Bool)

(assert (=> b!1112769 m!1030899))

(declare-fun m!1030901 () Bool)

(assert (=> b!1112759 m!1030901))

(declare-fun m!1030903 () Bool)

(assert (=> bm!46964 m!1030903))

(declare-fun m!1030905 () Bool)

(assert (=> b!1112762 m!1030905))

(declare-fun m!1030907 () Bool)

(assert (=> bm!46963 m!1030907))

(declare-fun m!1030909 () Bool)

(assert (=> bm!46963 m!1030909))

(declare-fun m!1030911 () Bool)

(assert (=> bm!46963 m!1030911))

(declare-fun m!1030913 () Bool)

(assert (=> start!97666 m!1030913))

(declare-fun m!1030915 () Bool)

(assert (=> start!97666 m!1030915))

(declare-fun m!1030917 () Bool)

(assert (=> b!1112764 m!1030917))

(declare-fun m!1030919 () Bool)

(assert (=> b!1112767 m!1030919))

(declare-fun m!1030921 () Bool)

(assert (=> b!1112760 m!1030921))

(declare-fun m!1030923 () Bool)

(assert (=> b!1112760 m!1030923))

(declare-fun m!1030925 () Bool)

(assert (=> b!1112768 m!1030925))

(declare-fun m!1030927 () Bool)

(assert (=> b!1112773 m!1030927))

(declare-fun m!1030929 () Bool)

(assert (=> b!1112766 m!1030929))

(check-sat (not b_lambda!18435) b_and!37651 (not bm!46963) (not b!1112763) (not b!1112760) (not start!97666) (not b!1112759) (not b_next!23401) (not b!1112769) (not b!1112768) (not b!1112773) tp_is_empty!27661 (not mapNonEmpty!43309) (not bm!46964) (not b!1112764) (not b!1112766) (not b!1112767))
(check-sat b_and!37651 (not b_next!23401))
