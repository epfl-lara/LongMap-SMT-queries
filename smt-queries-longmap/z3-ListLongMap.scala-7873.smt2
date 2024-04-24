; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98218 () Bool)

(assert start!98218)

(declare-fun b_free!23683 () Bool)

(declare-fun b_next!23683 () Bool)

(assert (=> start!98218 (= b_free!23683 (not b_next!23683))))

(declare-fun tp!83752 () Bool)

(declare-fun b_and!38159 () Bool)

(assert (=> start!98218 (= tp!83752 b_and!38159)))

(declare-fun b!1124861 () Bool)

(declare-fun e!640477 () Bool)

(declare-datatypes ((V!42745 0))(
  ( (V!42746 (val!14163 Int)) )
))
(declare-datatypes ((tuple2!17800 0))(
  ( (tuple2!17801 (_1!8911 (_ BitVec 64)) (_2!8911 V!42745)) )
))
(declare-datatypes ((List!24591 0))(
  ( (Nil!24588) (Cons!24587 (h!25805 tuple2!17800) (t!35258 List!24591)) )
))
(declare-datatypes ((ListLongMap!15777 0))(
  ( (ListLongMap!15778 (toList!7904 List!24591)) )
))
(declare-fun call!47399 () ListLongMap!15777)

(declare-fun call!47398 () ListLongMap!15777)

(assert (=> b!1124861 (= e!640477 (= call!47399 call!47398))))

(declare-fun b!1124862 () Bool)

(declare-fun e!640474 () Bool)

(declare-fun e!640476 () Bool)

(assert (=> b!1124862 (= e!640474 e!640476)))

(declare-fun res!751174 () Bool)

(assert (=> b!1124862 (=> (not res!751174) (not e!640476))))

(declare-datatypes ((array!73341 0))(
  ( (array!73342 (arr!35317 (Array (_ BitVec 32) (_ BitVec 64))) (size!35854 (_ BitVec 32))) )
))
(declare-fun lt!499627 () array!73341)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73341 (_ BitVec 32)) Bool)

(assert (=> b!1124862 (= res!751174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499627 mask!1564))))

(declare-fun _keys!1208 () array!73341)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124862 (= lt!499627 (array!73342 (store (arr!35317 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35854 _keys!1208)))))

(declare-fun b!1124863 () Bool)

(declare-fun e!640479 () Bool)

(assert (=> b!1124863 (= e!640479 true)))

(declare-fun zeroValue!944 () V!42745)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13397 0))(
  ( (ValueCellFull!13397 (v!16792 V!42745)) (EmptyCell!13397) )
))
(declare-datatypes ((array!73343 0))(
  ( (array!73344 (arr!35318 (Array (_ BitVec 32) ValueCell!13397)) (size!35855 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73343)

(declare-fun minValue!944 () V!42745)

(declare-fun lt!499633 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun contains!6462 (ListLongMap!15777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4431 (array!73341 array!73343 (_ BitVec 32) (_ BitVec 32) V!42745 V!42745 (_ BitVec 32) Int) ListLongMap!15777)

(assert (=> b!1124863 (= lt!499633 (contains!6462 (getCurrentListMapNoExtraKeys!4431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1124864 () Bool)

(declare-fun e!640481 () Bool)

(declare-fun tp_is_empty!28213 () Bool)

(assert (=> b!1124864 (= e!640481 tp_is_empty!28213)))

(declare-fun b!1124865 () Bool)

(declare-fun e!640473 () Bool)

(declare-fun mapRes!44137 () Bool)

(assert (=> b!1124865 (= e!640473 (and e!640481 mapRes!44137))))

(declare-fun condMapEmpty!44137 () Bool)

(declare-fun mapDefault!44137 () ValueCell!13397)

(assert (=> b!1124865 (= condMapEmpty!44137 (= (arr!35318 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13397)) mapDefault!44137)))))

(declare-fun b!1124866 () Bool)

(declare-fun e!640480 () Bool)

(assert (=> b!1124866 (= e!640480 tp_is_empty!28213)))

(declare-fun b!1124867 () Bool)

(declare-fun e!640482 () Bool)

(declare-fun e!640478 () Bool)

(assert (=> b!1124867 (= e!640482 e!640478)))

(declare-fun res!751173 () Bool)

(assert (=> b!1124867 (=> res!751173 e!640478)))

(assert (=> b!1124867 (= res!751173 (not (= from!1455 i!673)))))

(declare-fun lt!499629 () ListLongMap!15777)

(declare-fun lt!499630 () array!73343)

(assert (=> b!1124867 (= lt!499629 (getCurrentListMapNoExtraKeys!4431 lt!499627 lt!499630 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2512 (Int (_ BitVec 64)) V!42745)

(assert (=> b!1124867 (= lt!499630 (array!73344 (store (arr!35318 _values!996) i!673 (ValueCellFull!13397 (dynLambda!2512 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35855 _values!996)))))

(declare-fun lt!499632 () ListLongMap!15777)

(assert (=> b!1124867 (= lt!499632 (getCurrentListMapNoExtraKeys!4431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124868 () Bool)

(declare-fun res!751169 () Bool)

(assert (=> b!1124868 (=> (not res!751169) (not e!640476))))

(declare-datatypes ((List!24592 0))(
  ( (Nil!24589) (Cons!24588 (h!25806 (_ BitVec 64)) (t!35259 List!24592)) )
))
(declare-fun arrayNoDuplicates!0 (array!73341 (_ BitVec 32) List!24592) Bool)

(assert (=> b!1124868 (= res!751169 (arrayNoDuplicates!0 lt!499627 #b00000000000000000000000000000000 Nil!24589))))

(declare-fun b!1124869 () Bool)

(assert (=> b!1124869 (= e!640478 e!640479)))

(declare-fun res!751164 () Bool)

(assert (=> b!1124869 (=> res!751164 e!640479)))

(assert (=> b!1124869 (= res!751164 (not (= (select (arr!35317 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124869 e!640477))

(declare-fun c!109925 () Bool)

(assert (=> b!1124869 (= c!109925 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36833 0))(
  ( (Unit!36834) )
))
(declare-fun lt!499631 () Unit!36833)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!357 (array!73341 array!73343 (_ BitVec 32) (_ BitVec 32) V!42745 V!42745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36833)

(assert (=> b!1124869 (= lt!499631 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47395 () Bool)

(assert (=> bm!47395 (= call!47398 (getCurrentListMapNoExtraKeys!4431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124870 () Bool)

(declare-fun res!751163 () Bool)

(assert (=> b!1124870 (=> (not res!751163) (not e!640474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124870 (= res!751163 (validKeyInArray!0 k0!934))))

(declare-fun b!1124871 () Bool)

(declare-fun res!751165 () Bool)

(assert (=> b!1124871 (=> (not res!751165) (not e!640474))))

(assert (=> b!1124871 (= res!751165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47396 () Bool)

(assert (=> bm!47396 (= call!47399 (getCurrentListMapNoExtraKeys!4431 lt!499627 lt!499630 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!751168 () Bool)

(assert (=> start!98218 (=> (not res!751168) (not e!640474))))

(assert (=> start!98218 (= res!751168 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35854 _keys!1208))))))

(assert (=> start!98218 e!640474))

(assert (=> start!98218 tp_is_empty!28213))

(declare-fun array_inv!27178 (array!73341) Bool)

(assert (=> start!98218 (array_inv!27178 _keys!1208)))

(assert (=> start!98218 true))

(assert (=> start!98218 tp!83752))

(declare-fun array_inv!27179 (array!73343) Bool)

(assert (=> start!98218 (and (array_inv!27179 _values!996) e!640473)))

(declare-fun mapNonEmpty!44137 () Bool)

(declare-fun tp!83753 () Bool)

(assert (=> mapNonEmpty!44137 (= mapRes!44137 (and tp!83753 e!640480))))

(declare-fun mapKey!44137 () (_ BitVec 32))

(declare-fun mapRest!44137 () (Array (_ BitVec 32) ValueCell!13397))

(declare-fun mapValue!44137 () ValueCell!13397)

(assert (=> mapNonEmpty!44137 (= (arr!35318 _values!996) (store mapRest!44137 mapKey!44137 mapValue!44137))))

(declare-fun b!1124872 () Bool)

(declare-fun res!751172 () Bool)

(assert (=> b!1124872 (=> (not res!751172) (not e!640474))))

(assert (=> b!1124872 (= res!751172 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35854 _keys!1208))))))

(declare-fun b!1124873 () Bool)

(assert (=> b!1124873 (= e!640476 (not e!640482))))

(declare-fun res!751167 () Bool)

(assert (=> b!1124873 (=> res!751167 e!640482)))

(assert (=> b!1124873 (= res!751167 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124873 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499628 () Unit!36833)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73341 (_ BitVec 64) (_ BitVec 32)) Unit!36833)

(assert (=> b!1124873 (= lt!499628 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1124874 () Bool)

(declare-fun -!1096 (ListLongMap!15777 (_ BitVec 64)) ListLongMap!15777)

(assert (=> b!1124874 (= e!640477 (= call!47399 (-!1096 call!47398 k0!934)))))

(declare-fun b!1124875 () Bool)

(declare-fun res!751162 () Bool)

(assert (=> b!1124875 (=> (not res!751162) (not e!640474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124875 (= res!751162 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44137 () Bool)

(assert (=> mapIsEmpty!44137 mapRes!44137))

(declare-fun b!1124876 () Bool)

(declare-fun res!751170 () Bool)

(assert (=> b!1124876 (=> (not res!751170) (not e!640474))))

(assert (=> b!1124876 (= res!751170 (= (select (arr!35317 _keys!1208) i!673) k0!934))))

(declare-fun b!1124877 () Bool)

(declare-fun res!751166 () Bool)

(assert (=> b!1124877 (=> (not res!751166) (not e!640474))))

(assert (=> b!1124877 (= res!751166 (and (= (size!35855 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35854 _keys!1208) (size!35855 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124878 () Bool)

(declare-fun res!751171 () Bool)

(assert (=> b!1124878 (=> (not res!751171) (not e!640474))))

(assert (=> b!1124878 (= res!751171 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24589))))

(assert (= (and start!98218 res!751168) b!1124875))

(assert (= (and b!1124875 res!751162) b!1124877))

(assert (= (and b!1124877 res!751166) b!1124871))

(assert (= (and b!1124871 res!751165) b!1124878))

(assert (= (and b!1124878 res!751171) b!1124872))

(assert (= (and b!1124872 res!751172) b!1124870))

(assert (= (and b!1124870 res!751163) b!1124876))

(assert (= (and b!1124876 res!751170) b!1124862))

(assert (= (and b!1124862 res!751174) b!1124868))

(assert (= (and b!1124868 res!751169) b!1124873))

(assert (= (and b!1124873 (not res!751167)) b!1124867))

(assert (= (and b!1124867 (not res!751173)) b!1124869))

(assert (= (and b!1124869 c!109925) b!1124874))

(assert (= (and b!1124869 (not c!109925)) b!1124861))

(assert (= (or b!1124874 b!1124861) bm!47396))

(assert (= (or b!1124874 b!1124861) bm!47395))

(assert (= (and b!1124869 (not res!751164)) b!1124863))

(assert (= (and b!1124865 condMapEmpty!44137) mapIsEmpty!44137))

(assert (= (and b!1124865 (not condMapEmpty!44137)) mapNonEmpty!44137))

(get-info :version)

(assert (= (and mapNonEmpty!44137 ((_ is ValueCellFull!13397) mapValue!44137)) b!1124866))

(assert (= (and b!1124865 ((_ is ValueCellFull!13397) mapDefault!44137)) b!1124864))

(assert (= start!98218 b!1124865))

(declare-fun b_lambda!18663 () Bool)

(assert (=> (not b_lambda!18663) (not b!1124867)))

(declare-fun t!35257 () Bool)

(declare-fun tb!8487 () Bool)

(assert (=> (and start!98218 (= defaultEntry!1004 defaultEntry!1004) t!35257) tb!8487))

(declare-fun result!17543 () Bool)

(assert (=> tb!8487 (= result!17543 tp_is_empty!28213)))

(assert (=> b!1124867 t!35257))

(declare-fun b_and!38161 () Bool)

(assert (= b_and!38159 (and (=> t!35257 result!17543) b_and!38161)))

(declare-fun m!1039655 () Bool)

(assert (=> b!1124871 m!1039655))

(declare-fun m!1039657 () Bool)

(assert (=> mapNonEmpty!44137 m!1039657))

(declare-fun m!1039659 () Bool)

(assert (=> b!1124869 m!1039659))

(declare-fun m!1039661 () Bool)

(assert (=> b!1124869 m!1039661))

(declare-fun m!1039663 () Bool)

(assert (=> b!1124875 m!1039663))

(declare-fun m!1039665 () Bool)

(assert (=> start!98218 m!1039665))

(declare-fun m!1039667 () Bool)

(assert (=> start!98218 m!1039667))

(declare-fun m!1039669 () Bool)

(assert (=> b!1124867 m!1039669))

(declare-fun m!1039671 () Bool)

(assert (=> b!1124867 m!1039671))

(declare-fun m!1039673 () Bool)

(assert (=> b!1124867 m!1039673))

(declare-fun m!1039675 () Bool)

(assert (=> b!1124867 m!1039675))

(declare-fun m!1039677 () Bool)

(assert (=> b!1124878 m!1039677))

(declare-fun m!1039679 () Bool)

(assert (=> b!1124876 m!1039679))

(declare-fun m!1039681 () Bool)

(assert (=> b!1124868 m!1039681))

(declare-fun m!1039683 () Bool)

(assert (=> b!1124870 m!1039683))

(declare-fun m!1039685 () Bool)

(assert (=> b!1124863 m!1039685))

(assert (=> b!1124863 m!1039685))

(declare-fun m!1039687 () Bool)

(assert (=> b!1124863 m!1039687))

(declare-fun m!1039689 () Bool)

(assert (=> b!1124874 m!1039689))

(declare-fun m!1039691 () Bool)

(assert (=> b!1124862 m!1039691))

(declare-fun m!1039693 () Bool)

(assert (=> b!1124862 m!1039693))

(assert (=> bm!47395 m!1039685))

(declare-fun m!1039695 () Bool)

(assert (=> b!1124873 m!1039695))

(declare-fun m!1039697 () Bool)

(assert (=> b!1124873 m!1039697))

(declare-fun m!1039699 () Bool)

(assert (=> bm!47396 m!1039699))

(check-sat b_and!38161 tp_is_empty!28213 (not b_lambda!18663) (not b!1124870) (not b!1124871) (not start!98218) (not b!1124862) (not b!1124875) (not b!1124868) (not bm!47396) (not b!1124878) (not b!1124863) (not b!1124874) (not bm!47395) (not b_next!23683) (not mapNonEmpty!44137) (not b!1124867) (not b!1124869) (not b!1124873))
(check-sat b_and!38161 (not b_next!23683))
