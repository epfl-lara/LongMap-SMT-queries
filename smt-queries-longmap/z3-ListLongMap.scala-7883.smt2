; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98036 () Bool)

(assert start!98036)

(declare-fun b_free!23743 () Bool)

(declare-fun b_next!23743 () Bool)

(assert (=> start!98036 (= b_free!23743 (not b_next!23743))))

(declare-fun tp!83932 () Bool)

(declare-fun b_and!38247 () Bool)

(assert (=> start!98036 (= tp!83932 b_and!38247)))

(declare-fun b!1125251 () Bool)

(declare-fun res!751911 () Bool)

(declare-fun e!640521 () Bool)

(assert (=> b!1125251 (=> res!751911 e!640521)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1125251 (= res!751911 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125252 () Bool)

(declare-fun res!751909 () Bool)

(declare-fun e!640525 () Bool)

(assert (=> b!1125252 (=> (not res!751909) (not e!640525))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125252 (= res!751909 (validMask!0 mask!1564))))

(declare-fun b!1125254 () Bool)

(declare-fun e!640528 () Bool)

(declare-fun e!640526 () Bool)

(declare-fun mapRes!44227 () Bool)

(assert (=> b!1125254 (= e!640528 (and e!640526 mapRes!44227))))

(declare-fun condMapEmpty!44227 () Bool)

(declare-datatypes ((V!42825 0))(
  ( (V!42826 (val!14193 Int)) )
))
(declare-datatypes ((ValueCell!13427 0))(
  ( (ValueCellFull!13427 (v!16825 V!42825)) (EmptyCell!13427) )
))
(declare-datatypes ((array!73336 0))(
  ( (array!73337 (arr!35321 (Array (_ BitVec 32) ValueCell!13427)) (size!35859 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73336)

(declare-fun mapDefault!44227 () ValueCell!13427)

(assert (=> b!1125254 (= condMapEmpty!44227 (= (arr!35321 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13427)) mapDefault!44227)))))

(declare-fun b!1125255 () Bool)

(declare-fun res!751914 () Bool)

(assert (=> b!1125255 (=> (not res!751914) (not e!640525))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125255 (= res!751914 (validKeyInArray!0 k0!934))))

(declare-fun b!1125256 () Bool)

(declare-fun res!751921 () Bool)

(assert (=> b!1125256 (=> (not res!751921) (not e!640525))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73338 0))(
  ( (array!73339 (arr!35322 (Array (_ BitVec 32) (_ BitVec 64))) (size!35860 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73338)

(assert (=> b!1125256 (= res!751921 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35860 _keys!1208))))))

(declare-fun b!1125257 () Bool)

(declare-fun res!751913 () Bool)

(assert (=> b!1125257 (=> (not res!751913) (not e!640525))))

(assert (=> b!1125257 (= res!751913 (and (= (size!35859 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35860 _keys!1208) (size!35859 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125258 () Bool)

(declare-fun e!640527 () Bool)

(declare-fun tp_is_empty!28273 () Bool)

(assert (=> b!1125258 (= e!640527 tp_is_empty!28273)))

(declare-fun b!1125259 () Bool)

(declare-fun e!640523 () Bool)

(declare-fun e!640530 () Bool)

(assert (=> b!1125259 (= e!640523 (not e!640530))))

(declare-fun res!751920 () Bool)

(assert (=> b!1125259 (=> res!751920 e!640530)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1125259 (= res!751920 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125259 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36733 0))(
  ( (Unit!36734) )
))
(declare-fun lt!499631 () Unit!36733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73338 (_ BitVec 64) (_ BitVec 32)) Unit!36733)

(assert (=> b!1125259 (= lt!499631 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44227 () Bool)

(declare-fun tp!83933 () Bool)

(assert (=> mapNonEmpty!44227 (= mapRes!44227 (and tp!83933 e!640527))))

(declare-fun mapKey!44227 () (_ BitVec 32))

(declare-fun mapRest!44227 () (Array (_ BitVec 32) ValueCell!13427))

(declare-fun mapValue!44227 () ValueCell!13427)

(assert (=> mapNonEmpty!44227 (= (arr!35321 _values!996) (store mapRest!44227 mapKey!44227 mapValue!44227))))

(declare-fun b!1125260 () Bool)

(declare-fun e!640522 () Bool)

(assert (=> b!1125260 (= e!640530 e!640522)))

(declare-fun res!751915 () Bool)

(assert (=> b!1125260 (=> res!751915 e!640522)))

(assert (=> b!1125260 (= res!751915 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42825)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!499630 () array!73336)

(declare-datatypes ((tuple2!17926 0))(
  ( (tuple2!17927 (_1!8974 (_ BitVec 64)) (_2!8974 V!42825)) )
))
(declare-datatypes ((List!24688 0))(
  ( (Nil!24685) (Cons!24684 (h!25893 tuple2!17926) (t!35414 List!24688)) )
))
(declare-datatypes ((ListLongMap!15895 0))(
  ( (ListLongMap!15896 (toList!7963 List!24688)) )
))
(declare-fun lt!499632 () ListLongMap!15895)

(declare-fun minValue!944 () V!42825)

(declare-fun lt!499627 () array!73338)

(declare-fun getCurrentListMapNoExtraKeys!4468 (array!73338 array!73336 (_ BitVec 32) (_ BitVec 32) V!42825 V!42825 (_ BitVec 32) Int) ListLongMap!15895)

(assert (=> b!1125260 (= lt!499632 (getCurrentListMapNoExtraKeys!4468 lt!499627 lt!499630 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2487 (Int (_ BitVec 64)) V!42825)

(assert (=> b!1125260 (= lt!499630 (array!73337 (store (arr!35321 _values!996) i!673 (ValueCellFull!13427 (dynLambda!2487 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35859 _values!996)))))

(declare-fun lt!499626 () ListLongMap!15895)

(assert (=> b!1125260 (= lt!499626 (getCurrentListMapNoExtraKeys!4468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125261 () Bool)

(declare-fun res!751908 () Bool)

(assert (=> b!1125261 (=> (not res!751908) (not e!640525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73338 (_ BitVec 32)) Bool)

(assert (=> b!1125261 (= res!751908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125262 () Bool)

(declare-fun e!640524 () Bool)

(declare-fun call!47489 () ListLongMap!15895)

(declare-fun call!47488 () ListLongMap!15895)

(assert (=> b!1125262 (= e!640524 (= call!47489 call!47488))))

(declare-fun b!1125263 () Bool)

(declare-fun res!751912 () Bool)

(assert (=> b!1125263 (=> (not res!751912) (not e!640523))))

(declare-datatypes ((List!24689 0))(
  ( (Nil!24686) (Cons!24685 (h!25894 (_ BitVec 64)) (t!35415 List!24689)) )
))
(declare-fun arrayNoDuplicates!0 (array!73338 (_ BitVec 32) List!24689) Bool)

(assert (=> b!1125263 (= res!751912 (arrayNoDuplicates!0 lt!499627 #b00000000000000000000000000000000 Nil!24686))))

(declare-fun b!1125264 () Bool)

(declare-fun e!640529 () Bool)

(assert (=> b!1125264 (= e!640522 e!640529)))

(declare-fun res!751919 () Bool)

(assert (=> b!1125264 (=> res!751919 e!640529)))

(assert (=> b!1125264 (= res!751919 (not (= (select (arr!35322 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125264 e!640524))

(declare-fun c!109578 () Bool)

(assert (=> b!1125264 (= c!109578 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499625 () Unit!36733)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!373 (array!73338 array!73336 (_ BitVec 32) (_ BitVec 32) V!42825 V!42825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36733)

(assert (=> b!1125264 (= lt!499625 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125253 () Bool)

(declare-fun res!751907 () Bool)

(assert (=> b!1125253 (=> (not res!751907) (not e!640525))))

(assert (=> b!1125253 (= res!751907 (= (select (arr!35322 _keys!1208) i!673) k0!934))))

(declare-fun res!751916 () Bool)

(assert (=> start!98036 (=> (not res!751916) (not e!640525))))

(assert (=> start!98036 (= res!751916 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35860 _keys!1208))))))

(assert (=> start!98036 e!640525))

(assert (=> start!98036 tp_is_empty!28273))

(declare-fun array_inv!27186 (array!73338) Bool)

(assert (=> start!98036 (array_inv!27186 _keys!1208)))

(assert (=> start!98036 true))

(assert (=> start!98036 tp!83932))

(declare-fun array_inv!27187 (array!73336) Bool)

(assert (=> start!98036 (and (array_inv!27187 _values!996) e!640528)))

(declare-fun b!1125265 () Bool)

(declare-fun -!1095 (ListLongMap!15895 (_ BitVec 64)) ListLongMap!15895)

(assert (=> b!1125265 (= e!640524 (= call!47489 (-!1095 call!47488 k0!934)))))

(declare-fun b!1125266 () Bool)

(assert (=> b!1125266 (= e!640529 e!640521)))

(declare-fun res!751910 () Bool)

(assert (=> b!1125266 (=> res!751910 e!640521)))

(declare-fun lt!499628 () ListLongMap!15895)

(declare-fun contains!6432 (ListLongMap!15895 (_ BitVec 64)) Bool)

(assert (=> b!1125266 (= res!751910 (not (contains!6432 lt!499628 k0!934)))))

(assert (=> b!1125266 (= lt!499628 (getCurrentListMapNoExtraKeys!4468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125267 () Bool)

(assert (=> b!1125267 (= e!640525 e!640523)))

(declare-fun res!751917 () Bool)

(assert (=> b!1125267 (=> (not res!751917) (not e!640523))))

(assert (=> b!1125267 (= res!751917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499627 mask!1564))))

(assert (=> b!1125267 (= lt!499627 (array!73339 (store (arr!35322 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35860 _keys!1208)))))

(declare-fun b!1125268 () Bool)

(assert (=> b!1125268 (= e!640526 tp_is_empty!28273)))

(declare-fun b!1125269 () Bool)

(assert (=> b!1125269 (= e!640521 true)))

(declare-fun +!3461 (ListLongMap!15895 tuple2!17926) ListLongMap!15895)

(assert (=> b!1125269 (contains!6432 (+!3461 lt!499628 (tuple2!17927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499629 () Unit!36733)

(declare-fun addStillContains!679 (ListLongMap!15895 (_ BitVec 64) V!42825 (_ BitVec 64)) Unit!36733)

(assert (=> b!1125269 (= lt!499629 (addStillContains!679 lt!499628 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun bm!47485 () Bool)

(assert (=> bm!47485 (= call!47489 (getCurrentListMapNoExtraKeys!4468 lt!499627 lt!499630 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47486 () Bool)

(assert (=> bm!47486 (= call!47488 (getCurrentListMapNoExtraKeys!4468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44227 () Bool)

(assert (=> mapIsEmpty!44227 mapRes!44227))

(declare-fun b!1125270 () Bool)

(declare-fun res!751918 () Bool)

(assert (=> b!1125270 (=> (not res!751918) (not e!640525))))

(assert (=> b!1125270 (= res!751918 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24686))))

(assert (= (and start!98036 res!751916) b!1125252))

(assert (= (and b!1125252 res!751909) b!1125257))

(assert (= (and b!1125257 res!751913) b!1125261))

(assert (= (and b!1125261 res!751908) b!1125270))

(assert (= (and b!1125270 res!751918) b!1125256))

(assert (= (and b!1125256 res!751921) b!1125255))

(assert (= (and b!1125255 res!751914) b!1125253))

(assert (= (and b!1125253 res!751907) b!1125267))

(assert (= (and b!1125267 res!751917) b!1125263))

(assert (= (and b!1125263 res!751912) b!1125259))

(assert (= (and b!1125259 (not res!751920)) b!1125260))

(assert (= (and b!1125260 (not res!751915)) b!1125264))

(assert (= (and b!1125264 c!109578) b!1125265))

(assert (= (and b!1125264 (not c!109578)) b!1125262))

(assert (= (or b!1125265 b!1125262) bm!47485))

(assert (= (or b!1125265 b!1125262) bm!47486))

(assert (= (and b!1125264 (not res!751919)) b!1125266))

(assert (= (and b!1125266 (not res!751910)) b!1125251))

(assert (= (and b!1125251 (not res!751911)) b!1125269))

(assert (= (and b!1125254 condMapEmpty!44227) mapIsEmpty!44227))

(assert (= (and b!1125254 (not condMapEmpty!44227)) mapNonEmpty!44227))

(get-info :version)

(assert (= (and mapNonEmpty!44227 ((_ is ValueCellFull!13427) mapValue!44227)) b!1125258))

(assert (= (and b!1125254 ((_ is ValueCellFull!13427) mapDefault!44227)) b!1125268))

(assert (= start!98036 b!1125254))

(declare-fun b_lambda!18695 () Bool)

(assert (=> (not b_lambda!18695) (not b!1125260)))

(declare-fun t!35413 () Bool)

(declare-fun tb!8547 () Bool)

(assert (=> (and start!98036 (= defaultEntry!1004 defaultEntry!1004) t!35413) tb!8547))

(declare-fun result!17663 () Bool)

(assert (=> tb!8547 (= result!17663 tp_is_empty!28273)))

(assert (=> b!1125260 t!35413))

(declare-fun b_and!38249 () Bool)

(assert (= b_and!38247 (and (=> t!35413 result!17663) b_and!38249)))

(declare-fun m!1038897 () Bool)

(assert (=> bm!47485 m!1038897))

(declare-fun m!1038899 () Bool)

(assert (=> b!1125265 m!1038899))

(declare-fun m!1038901 () Bool)

(assert (=> mapNonEmpty!44227 m!1038901))

(declare-fun m!1038903 () Bool)

(assert (=> b!1125269 m!1038903))

(assert (=> b!1125269 m!1038903))

(declare-fun m!1038905 () Bool)

(assert (=> b!1125269 m!1038905))

(declare-fun m!1038907 () Bool)

(assert (=> b!1125269 m!1038907))

(declare-fun m!1038909 () Bool)

(assert (=> b!1125270 m!1038909))

(declare-fun m!1038911 () Bool)

(assert (=> bm!47486 m!1038911))

(declare-fun m!1038913 () Bool)

(assert (=> b!1125263 m!1038913))

(declare-fun m!1038915 () Bool)

(assert (=> b!1125252 m!1038915))

(declare-fun m!1038917 () Bool)

(assert (=> b!1125255 m!1038917))

(declare-fun m!1038919 () Bool)

(assert (=> b!1125267 m!1038919))

(declare-fun m!1038921 () Bool)

(assert (=> b!1125267 m!1038921))

(declare-fun m!1038923 () Bool)

(assert (=> b!1125264 m!1038923))

(declare-fun m!1038925 () Bool)

(assert (=> b!1125264 m!1038925))

(declare-fun m!1038927 () Bool)

(assert (=> b!1125253 m!1038927))

(declare-fun m!1038929 () Bool)

(assert (=> b!1125261 m!1038929))

(declare-fun m!1038931 () Bool)

(assert (=> b!1125260 m!1038931))

(declare-fun m!1038933 () Bool)

(assert (=> b!1125260 m!1038933))

(declare-fun m!1038935 () Bool)

(assert (=> b!1125260 m!1038935))

(declare-fun m!1038937 () Bool)

(assert (=> b!1125260 m!1038937))

(declare-fun m!1038939 () Bool)

(assert (=> b!1125259 m!1038939))

(declare-fun m!1038941 () Bool)

(assert (=> b!1125259 m!1038941))

(declare-fun m!1038943 () Bool)

(assert (=> b!1125266 m!1038943))

(assert (=> b!1125266 m!1038911))

(declare-fun m!1038945 () Bool)

(assert (=> start!98036 m!1038945))

(declare-fun m!1038947 () Bool)

(assert (=> start!98036 m!1038947))

(check-sat tp_is_empty!28273 (not b!1125269) (not b!1125270) (not b!1125265) (not bm!47486) (not b!1125263) (not b_lambda!18695) (not b!1125259) (not b!1125261) (not start!98036) (not b!1125255) (not b!1125267) (not b!1125252) (not b_next!23743) (not b!1125266) (not b!1125260) (not mapNonEmpty!44227) (not b!1125264) (not bm!47485) b_and!38249)
(check-sat b_and!38249 (not b_next!23743))
