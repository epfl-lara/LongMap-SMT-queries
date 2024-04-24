; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98176 () Bool)

(assert start!98176)

(declare-fun b_free!23641 () Bool)

(declare-fun b_next!23641 () Bool)

(assert (=> start!98176 (= b_free!23641 (not b_next!23641))))

(declare-fun tp!83626 () Bool)

(declare-fun b_and!38075 () Bool)

(assert (=> start!98176 (= tp!83626 b_and!38075)))

(declare-fun b!1123676 () Bool)

(declare-fun e!639846 () Bool)

(declare-datatypes ((V!42689 0))(
  ( (V!42690 (val!14142 Int)) )
))
(declare-datatypes ((tuple2!17766 0))(
  ( (tuple2!17767 (_1!8894 (_ BitVec 64)) (_2!8894 V!42689)) )
))
(declare-datatypes ((List!24561 0))(
  ( (Nil!24558) (Cons!24557 (h!25775 tuple2!17766) (t!35186 List!24561)) )
))
(declare-datatypes ((ListLongMap!15743 0))(
  ( (ListLongMap!15744 (toList!7887 List!24561)) )
))
(declare-fun call!47272 () ListLongMap!15743)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!47273 () ListLongMap!15743)

(declare-fun -!1082 (ListLongMap!15743 (_ BitVec 64)) ListLongMap!15743)

(assert (=> b!1123676 (= e!639846 (= call!47272 (-!1082 call!47273 k0!934)))))

(declare-fun b!1123677 () Bool)

(declare-fun res!750335 () Bool)

(declare-fun e!639851 () Bool)

(assert (=> b!1123677 (=> (not res!750335) (not e!639851))))

(declare-datatypes ((array!73263 0))(
  ( (array!73264 (arr!35278 (Array (_ BitVec 32) (_ BitVec 64))) (size!35815 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73263)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123677 (= res!750335 (= (select (arr!35278 _keys!1208) i!673) k0!934))))

(declare-fun b!1123678 () Bool)

(declare-fun e!639852 () Bool)

(declare-fun e!639850 () Bool)

(assert (=> b!1123678 (= e!639852 e!639850)))

(declare-fun res!750345 () Bool)

(assert (=> b!1123678 (=> res!750345 e!639850)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1123678 (= res!750345 (not (= (select (arr!35278 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123678 e!639846))

(declare-fun c!109862 () Bool)

(assert (=> b!1123678 (= c!109862 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42689)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13376 0))(
  ( (ValueCellFull!13376 (v!16771 V!42689)) (EmptyCell!13376) )
))
(declare-datatypes ((array!73265 0))(
  ( (array!73266 (arr!35279 (Array (_ BitVec 32) ValueCell!13376)) (size!35816 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73265)

(declare-datatypes ((Unit!36805 0))(
  ( (Unit!36806) )
))
(declare-fun lt!499198 () Unit!36805)

(declare-fun minValue!944 () V!42689)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!344 (array!73263 array!73265 (_ BitVec 32) (_ BitVec 32) V!42689 V!42689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36805)

(assert (=> b!1123678 (= lt!499198 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123679 () Bool)

(assert (=> b!1123679 (= e!639850 true)))

(declare-fun lt!499195 () Bool)

(declare-fun contains!6448 (ListLongMap!15743 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4415 (array!73263 array!73265 (_ BitVec 32) (_ BitVec 32) V!42689 V!42689 (_ BitVec 32) Int) ListLongMap!15743)

(assert (=> b!1123679 (= lt!499195 (contains!6448 (getCurrentListMapNoExtraKeys!4415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1123680 () Bool)

(assert (=> b!1123680 (= e!639846 (= call!47272 call!47273))))

(declare-fun b!1123681 () Bool)

(declare-fun res!750343 () Bool)

(assert (=> b!1123681 (=> (not res!750343) (not e!639851))))

(declare-datatypes ((List!24562 0))(
  ( (Nil!24559) (Cons!24558 (h!25776 (_ BitVec 64)) (t!35187 List!24562)) )
))
(declare-fun arrayNoDuplicates!0 (array!73263 (_ BitVec 32) List!24562) Bool)

(assert (=> b!1123681 (= res!750343 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24559))))

(declare-fun mapNonEmpty!44074 () Bool)

(declare-fun mapRes!44074 () Bool)

(declare-fun tp!83627 () Bool)

(declare-fun e!639847 () Bool)

(assert (=> mapNonEmpty!44074 (= mapRes!44074 (and tp!83627 e!639847))))

(declare-fun mapValue!44074 () ValueCell!13376)

(declare-fun mapKey!44074 () (_ BitVec 32))

(declare-fun mapRest!44074 () (Array (_ BitVec 32) ValueCell!13376))

(assert (=> mapNonEmpty!44074 (= (arr!35279 _values!996) (store mapRest!44074 mapKey!44074 mapValue!44074))))

(declare-fun lt!499196 () array!73265)

(declare-fun lt!499197 () array!73263)

(declare-fun bm!47269 () Bool)

(assert (=> bm!47269 (= call!47272 (getCurrentListMapNoExtraKeys!4415 lt!499197 lt!499196 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123682 () Bool)

(declare-fun res!750336 () Bool)

(assert (=> b!1123682 (=> (not res!750336) (not e!639851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123682 (= res!750336 (validKeyInArray!0 k0!934))))

(declare-fun b!1123683 () Bool)

(declare-fun e!639843 () Bool)

(declare-fun e!639844 () Bool)

(assert (=> b!1123683 (= e!639843 (and e!639844 mapRes!44074))))

(declare-fun condMapEmpty!44074 () Bool)

(declare-fun mapDefault!44074 () ValueCell!13376)

(assert (=> b!1123683 (= condMapEmpty!44074 (= (arr!35279 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13376)) mapDefault!44074)))))

(declare-fun res!750338 () Bool)

(assert (=> start!98176 (=> (not res!750338) (not e!639851))))

(assert (=> start!98176 (= res!750338 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35815 _keys!1208))))))

(assert (=> start!98176 e!639851))

(declare-fun tp_is_empty!28171 () Bool)

(assert (=> start!98176 tp_is_empty!28171))

(declare-fun array_inv!27156 (array!73263) Bool)

(assert (=> start!98176 (array_inv!27156 _keys!1208)))

(assert (=> start!98176 true))

(assert (=> start!98176 tp!83626))

(declare-fun array_inv!27157 (array!73265) Bool)

(assert (=> start!98176 (and (array_inv!27157 _values!996) e!639843)))

(declare-fun mapIsEmpty!44074 () Bool)

(assert (=> mapIsEmpty!44074 mapRes!44074))

(declare-fun b!1123684 () Bool)

(declare-fun res!750342 () Bool)

(assert (=> b!1123684 (=> (not res!750342) (not e!639851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73263 (_ BitVec 32)) Bool)

(assert (=> b!1123684 (= res!750342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123685 () Bool)

(declare-fun e!639848 () Bool)

(declare-fun e!639845 () Bool)

(assert (=> b!1123685 (= e!639848 (not e!639845))))

(declare-fun res!750340 () Bool)

(assert (=> b!1123685 (=> res!750340 e!639845)))

(assert (=> b!1123685 (= res!750340 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123685 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499199 () Unit!36805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73263 (_ BitVec 64) (_ BitVec 32)) Unit!36805)

(assert (=> b!1123685 (= lt!499199 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123686 () Bool)

(declare-fun res!750344 () Bool)

(assert (=> b!1123686 (=> (not res!750344) (not e!639851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123686 (= res!750344 (validMask!0 mask!1564))))

(declare-fun bm!47270 () Bool)

(assert (=> bm!47270 (= call!47273 (getCurrentListMapNoExtraKeys!4415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123687 () Bool)

(assert (=> b!1123687 (= e!639851 e!639848)))

(declare-fun res!750334 () Bool)

(assert (=> b!1123687 (=> (not res!750334) (not e!639848))))

(assert (=> b!1123687 (= res!750334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499197 mask!1564))))

(assert (=> b!1123687 (= lt!499197 (array!73264 (store (arr!35278 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35815 _keys!1208)))))

(declare-fun b!1123688 () Bool)

(assert (=> b!1123688 (= e!639845 e!639852)))

(declare-fun res!750337 () Bool)

(assert (=> b!1123688 (=> res!750337 e!639852)))

(assert (=> b!1123688 (= res!750337 (not (= from!1455 i!673)))))

(declare-fun lt!499200 () ListLongMap!15743)

(assert (=> b!1123688 (= lt!499200 (getCurrentListMapNoExtraKeys!4415 lt!499197 lt!499196 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2500 (Int (_ BitVec 64)) V!42689)

(assert (=> b!1123688 (= lt!499196 (array!73266 (store (arr!35279 _values!996) i!673 (ValueCellFull!13376 (dynLambda!2500 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35816 _values!996)))))

(declare-fun lt!499201 () ListLongMap!15743)

(assert (=> b!1123688 (= lt!499201 (getCurrentListMapNoExtraKeys!4415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123689 () Bool)

(declare-fun res!750341 () Bool)

(assert (=> b!1123689 (=> (not res!750341) (not e!639851))))

(assert (=> b!1123689 (= res!750341 (and (= (size!35816 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35815 _keys!1208) (size!35816 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123690 () Bool)

(declare-fun res!750339 () Bool)

(assert (=> b!1123690 (=> (not res!750339) (not e!639851))))

(assert (=> b!1123690 (= res!750339 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35815 _keys!1208))))))

(declare-fun b!1123691 () Bool)

(assert (=> b!1123691 (= e!639847 tp_is_empty!28171)))

(declare-fun b!1123692 () Bool)

(assert (=> b!1123692 (= e!639844 tp_is_empty!28171)))

(declare-fun b!1123693 () Bool)

(declare-fun res!750346 () Bool)

(assert (=> b!1123693 (=> (not res!750346) (not e!639848))))

(assert (=> b!1123693 (= res!750346 (arrayNoDuplicates!0 lt!499197 #b00000000000000000000000000000000 Nil!24559))))

(assert (= (and start!98176 res!750338) b!1123686))

(assert (= (and b!1123686 res!750344) b!1123689))

(assert (= (and b!1123689 res!750341) b!1123684))

(assert (= (and b!1123684 res!750342) b!1123681))

(assert (= (and b!1123681 res!750343) b!1123690))

(assert (= (and b!1123690 res!750339) b!1123682))

(assert (= (and b!1123682 res!750336) b!1123677))

(assert (= (and b!1123677 res!750335) b!1123687))

(assert (= (and b!1123687 res!750334) b!1123693))

(assert (= (and b!1123693 res!750346) b!1123685))

(assert (= (and b!1123685 (not res!750340)) b!1123688))

(assert (= (and b!1123688 (not res!750337)) b!1123678))

(assert (= (and b!1123678 c!109862) b!1123676))

(assert (= (and b!1123678 (not c!109862)) b!1123680))

(assert (= (or b!1123676 b!1123680) bm!47269))

(assert (= (or b!1123676 b!1123680) bm!47270))

(assert (= (and b!1123678 (not res!750345)) b!1123679))

(assert (= (and b!1123683 condMapEmpty!44074) mapIsEmpty!44074))

(assert (= (and b!1123683 (not condMapEmpty!44074)) mapNonEmpty!44074))

(get-info :version)

(assert (= (and mapNonEmpty!44074 ((_ is ValueCellFull!13376) mapValue!44074)) b!1123691))

(assert (= (and b!1123683 ((_ is ValueCellFull!13376) mapDefault!44074)) b!1123692))

(assert (= start!98176 b!1123683))

(declare-fun b_lambda!18621 () Bool)

(assert (=> (not b_lambda!18621) (not b!1123688)))

(declare-fun t!35185 () Bool)

(declare-fun tb!8445 () Bool)

(assert (=> (and start!98176 (= defaultEntry!1004 defaultEntry!1004) t!35185) tb!8445))

(declare-fun result!17459 () Bool)

(assert (=> tb!8445 (= result!17459 tp_is_empty!28171)))

(assert (=> b!1123688 t!35185))

(declare-fun b_and!38077 () Bool)

(assert (= b_and!38075 (and (=> t!35185 result!17459) b_and!38077)))

(declare-fun m!1038687 () Bool)

(assert (=> b!1123687 m!1038687))

(declare-fun m!1038689 () Bool)

(assert (=> b!1123687 m!1038689))

(declare-fun m!1038691 () Bool)

(assert (=> start!98176 m!1038691))

(declare-fun m!1038693 () Bool)

(assert (=> start!98176 m!1038693))

(declare-fun m!1038695 () Bool)

(assert (=> b!1123679 m!1038695))

(assert (=> b!1123679 m!1038695))

(declare-fun m!1038697 () Bool)

(assert (=> b!1123679 m!1038697))

(declare-fun m!1038699 () Bool)

(assert (=> b!1123686 m!1038699))

(declare-fun m!1038701 () Bool)

(assert (=> b!1123688 m!1038701))

(declare-fun m!1038703 () Bool)

(assert (=> b!1123688 m!1038703))

(declare-fun m!1038705 () Bool)

(assert (=> b!1123688 m!1038705))

(declare-fun m!1038707 () Bool)

(assert (=> b!1123688 m!1038707))

(declare-fun m!1038709 () Bool)

(assert (=> b!1123676 m!1038709))

(declare-fun m!1038711 () Bool)

(assert (=> b!1123693 m!1038711))

(declare-fun m!1038713 () Bool)

(assert (=> b!1123684 m!1038713))

(declare-fun m!1038715 () Bool)

(assert (=> b!1123685 m!1038715))

(declare-fun m!1038717 () Bool)

(assert (=> b!1123685 m!1038717))

(declare-fun m!1038719 () Bool)

(assert (=> b!1123678 m!1038719))

(declare-fun m!1038721 () Bool)

(assert (=> b!1123678 m!1038721))

(declare-fun m!1038723 () Bool)

(assert (=> b!1123677 m!1038723))

(declare-fun m!1038725 () Bool)

(assert (=> bm!47269 m!1038725))

(declare-fun m!1038727 () Bool)

(assert (=> mapNonEmpty!44074 m!1038727))

(declare-fun m!1038729 () Bool)

(assert (=> b!1123681 m!1038729))

(assert (=> bm!47270 m!1038695))

(declare-fun m!1038731 () Bool)

(assert (=> b!1123682 m!1038731))

(check-sat (not b!1123693) (not b!1123687) (not b!1123686) (not b!1123678) (not mapNonEmpty!44074) tp_is_empty!28171 (not b_lambda!18621) (not b_next!23641) (not b!1123676) (not b!1123679) (not b!1123684) (not bm!47269) (not bm!47270) (not b!1123682) b_and!38077 (not b!1123681) (not b!1123688) (not start!98176) (not b!1123685))
(check-sat b_and!38077 (not b_next!23641))
