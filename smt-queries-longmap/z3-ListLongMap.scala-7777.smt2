; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97400 () Bool)

(assert start!97400)

(declare-fun b_free!23377 () Bool)

(declare-fun b_next!23377 () Bool)

(assert (=> start!97400 (= b_free!23377 (not b_next!23377))))

(declare-fun tp!82430 () Bool)

(declare-fun b_and!37569 () Bool)

(assert (=> start!97400 (= tp!82430 b_and!37569)))

(declare-fun b!1110702 () Bool)

(declare-fun res!741224 () Bool)

(declare-fun e!633400 () Bool)

(assert (=> b!1110702 (=> (not res!741224) (not e!633400))))

(declare-datatypes ((array!72084 0))(
  ( (array!72085 (arr!34695 (Array (_ BitVec 32) (_ BitVec 64))) (size!35233 (_ BitVec 32))) )
))
(declare-fun lt!496034 () array!72084)

(declare-datatypes ((List!24268 0))(
  ( (Nil!24265) (Cons!24264 (h!25473 (_ BitVec 64)) (t!34682 List!24268)) )
))
(declare-fun arrayNoDuplicates!0 (array!72084 (_ BitVec 32) List!24268) Bool)

(assert (=> b!1110702 (= res!741224 (arrayNoDuplicates!0 lt!496034 #b00000000000000000000000000000000 Nil!24265))))

(declare-fun b!1110703 () Bool)

(declare-fun res!741223 () Bool)

(declare-fun e!633396 () Bool)

(assert (=> b!1110703 (=> (not res!741223) (not e!633396))))

(declare-fun _keys!1208 () array!72084)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41977 0))(
  ( (V!41978 (val!13875 Int)) )
))
(declare-datatypes ((ValueCell!13109 0))(
  ( (ValueCellFull!13109 (v!16507 V!41977)) (EmptyCell!13109) )
))
(declare-datatypes ((array!72086 0))(
  ( (array!72087 (arr!34696 (Array (_ BitVec 32) ValueCell!13109)) (size!35234 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72086)

(assert (=> b!1110703 (= res!741223 (and (= (size!35234 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35233 _keys!1208) (size!35234 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110704 () Bool)

(declare-fun res!741222 () Bool)

(assert (=> b!1110704 (=> (not res!741222) (not e!633396))))

(assert (=> b!1110704 (= res!741222 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24265))))

(declare-fun res!741217 () Bool)

(assert (=> start!97400 (=> (not res!741217) (not e!633396))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97400 (= res!741217 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35233 _keys!1208))))))

(assert (=> start!97400 e!633396))

(declare-fun tp_is_empty!27637 () Bool)

(assert (=> start!97400 tp_is_empty!27637))

(declare-fun array_inv!26744 (array!72084) Bool)

(assert (=> start!97400 (array_inv!26744 _keys!1208)))

(assert (=> start!97400 true))

(assert (=> start!97400 tp!82430))

(declare-fun e!633395 () Bool)

(declare-fun array_inv!26745 (array!72086) Bool)

(assert (=> start!97400 (and (array_inv!26745 _values!996) e!633395)))

(declare-fun b!1110705 () Bool)

(declare-fun res!741225 () Bool)

(assert (=> b!1110705 (=> (not res!741225) (not e!633396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72084 (_ BitVec 32)) Bool)

(assert (=> b!1110705 (= res!741225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110706 () Bool)

(declare-fun res!741219 () Bool)

(assert (=> b!1110706 (=> (not res!741219) (not e!633396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110706 (= res!741219 (validMask!0 mask!1564))))

(declare-fun b!1110707 () Bool)

(declare-fun e!633401 () Bool)

(assert (=> b!1110707 (= e!633401 tp_is_empty!27637)))

(declare-fun b!1110708 () Bool)

(declare-fun e!633397 () Bool)

(assert (=> b!1110708 (= e!633397 tp_is_empty!27637)))

(declare-fun b!1110709 () Bool)

(declare-fun e!633402 () Bool)

(assert (=> b!1110709 (= e!633400 (not e!633402))))

(declare-fun res!741221 () Bool)

(assert (=> b!1110709 (=> res!741221 e!633402)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110709 (= res!741221 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35233 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110709 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36263 0))(
  ( (Unit!36264) )
))
(declare-fun lt!496035 () Unit!36263)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72084 (_ BitVec 64) (_ BitVec 32)) Unit!36263)

(assert (=> b!1110709 (= lt!496035 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!41977)

(declare-datatypes ((tuple2!17614 0))(
  ( (tuple2!17615 (_1!8818 (_ BitVec 64)) (_2!8818 V!41977)) )
))
(declare-datatypes ((List!24269 0))(
  ( (Nil!24266) (Cons!24265 (h!25474 tuple2!17614) (t!34683 List!24269)) )
))
(declare-datatypes ((ListLongMap!15583 0))(
  ( (ListLongMap!15584 (toList!7807 List!24269)) )
))
(declare-fun call!46805 () ListLongMap!15583)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46801 () Bool)

(declare-fun minValue!944 () V!41977)

(declare-fun getCurrentListMapNoExtraKeys!4320 (array!72084 array!72086 (_ BitVec 32) (_ BitVec 32) V!41977 V!41977 (_ BitVec 32) Int) ListLongMap!15583)

(declare-fun dynLambda!2384 (Int (_ BitVec 64)) V!41977)

(assert (=> bm!46801 (= call!46805 (getCurrentListMapNoExtraKeys!4320 lt!496034 (array!72087 (store (arr!34696 _values!996) i!673 (ValueCellFull!13109 (dynLambda!2384 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35234 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110710 () Bool)

(declare-fun mapRes!43273 () Bool)

(assert (=> b!1110710 (= e!633395 (and e!633397 mapRes!43273))))

(declare-fun condMapEmpty!43273 () Bool)

(declare-fun mapDefault!43273 () ValueCell!13109)

(assert (=> b!1110710 (= condMapEmpty!43273 (= (arr!34696 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13109)) mapDefault!43273)))))

(declare-fun call!46804 () ListLongMap!15583)

(declare-fun e!633399 () Bool)

(declare-fun b!1110711 () Bool)

(declare-fun -!1020 (ListLongMap!15583 (_ BitVec 64)) ListLongMap!15583)

(assert (=> b!1110711 (= e!633399 (= call!46805 (-!1020 call!46804 k0!934)))))

(declare-fun b!1110712 () Bool)

(assert (=> b!1110712 (= e!633402 true)))

(assert (=> b!1110712 e!633399))

(declare-fun c!109236 () Bool)

(assert (=> b!1110712 (= c!109236 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496033 () Unit!36263)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!293 (array!72084 array!72086 (_ BitVec 32) (_ BitVec 32) V!41977 V!41977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36263)

(assert (=> b!1110712 (= lt!496033 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!293 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110713 () Bool)

(assert (=> b!1110713 (= e!633396 e!633400)))

(declare-fun res!741226 () Bool)

(assert (=> b!1110713 (=> (not res!741226) (not e!633400))))

(assert (=> b!1110713 (= res!741226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496034 mask!1564))))

(assert (=> b!1110713 (= lt!496034 (array!72085 (store (arr!34695 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35233 _keys!1208)))))

(declare-fun mapNonEmpty!43273 () Bool)

(declare-fun tp!82429 () Bool)

(assert (=> mapNonEmpty!43273 (= mapRes!43273 (and tp!82429 e!633401))))

(declare-fun mapValue!43273 () ValueCell!13109)

(declare-fun mapKey!43273 () (_ BitVec 32))

(declare-fun mapRest!43273 () (Array (_ BitVec 32) ValueCell!13109))

(assert (=> mapNonEmpty!43273 (= (arr!34696 _values!996) (store mapRest!43273 mapKey!43273 mapValue!43273))))

(declare-fun bm!46802 () Bool)

(assert (=> bm!46802 (= call!46804 (getCurrentListMapNoExtraKeys!4320 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110714 () Bool)

(declare-fun res!741216 () Bool)

(assert (=> b!1110714 (=> (not res!741216) (not e!633396))))

(assert (=> b!1110714 (= res!741216 (= (select (arr!34695 _keys!1208) i!673) k0!934))))

(declare-fun b!1110715 () Bool)

(declare-fun res!741218 () Bool)

(assert (=> b!1110715 (=> (not res!741218) (not e!633396))))

(assert (=> b!1110715 (= res!741218 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35233 _keys!1208))))))

(declare-fun b!1110716 () Bool)

(declare-fun res!741220 () Bool)

(assert (=> b!1110716 (=> (not res!741220) (not e!633396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110716 (= res!741220 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43273 () Bool)

(assert (=> mapIsEmpty!43273 mapRes!43273))

(declare-fun b!1110717 () Bool)

(assert (=> b!1110717 (= e!633399 (= call!46805 call!46804))))

(assert (= (and start!97400 res!741217) b!1110706))

(assert (= (and b!1110706 res!741219) b!1110703))

(assert (= (and b!1110703 res!741223) b!1110705))

(assert (= (and b!1110705 res!741225) b!1110704))

(assert (= (and b!1110704 res!741222) b!1110715))

(assert (= (and b!1110715 res!741218) b!1110716))

(assert (= (and b!1110716 res!741220) b!1110714))

(assert (= (and b!1110714 res!741216) b!1110713))

(assert (= (and b!1110713 res!741226) b!1110702))

(assert (= (and b!1110702 res!741224) b!1110709))

(assert (= (and b!1110709 (not res!741221)) b!1110712))

(assert (= (and b!1110712 c!109236) b!1110711))

(assert (= (and b!1110712 (not c!109236)) b!1110717))

(assert (= (or b!1110711 b!1110717) bm!46801))

(assert (= (or b!1110711 b!1110717) bm!46802))

(assert (= (and b!1110710 condMapEmpty!43273) mapIsEmpty!43273))

(assert (= (and b!1110710 (not condMapEmpty!43273)) mapNonEmpty!43273))

(get-info :version)

(assert (= (and mapNonEmpty!43273 ((_ is ValueCellFull!13109) mapValue!43273)) b!1110707))

(assert (= (and b!1110710 ((_ is ValueCellFull!13109) mapDefault!43273)) b!1110708))

(assert (= start!97400 b!1110710))

(declare-fun b_lambda!18383 () Bool)

(assert (=> (not b_lambda!18383) (not bm!46801)))

(declare-fun t!34681 () Bool)

(declare-fun tb!8235 () Bool)

(assert (=> (and start!97400 (= defaultEntry!1004 defaultEntry!1004) t!34681) tb!8235))

(declare-fun result!17039 () Bool)

(assert (=> tb!8235 (= result!17039 tp_is_empty!27637)))

(assert (=> bm!46801 t!34681))

(declare-fun b_and!37571 () Bool)

(assert (= b_and!37569 (and (=> t!34681 result!17039) b_and!37571)))

(declare-fun m!1028139 () Bool)

(assert (=> b!1110711 m!1028139))

(declare-fun m!1028141 () Bool)

(assert (=> b!1110714 m!1028141))

(declare-fun m!1028143 () Bool)

(assert (=> b!1110716 m!1028143))

(declare-fun m!1028145 () Bool)

(assert (=> b!1110702 m!1028145))

(declare-fun m!1028147 () Bool)

(assert (=> b!1110709 m!1028147))

(declare-fun m!1028149 () Bool)

(assert (=> b!1110709 m!1028149))

(declare-fun m!1028151 () Bool)

(assert (=> mapNonEmpty!43273 m!1028151))

(declare-fun m!1028153 () Bool)

(assert (=> b!1110712 m!1028153))

(declare-fun m!1028155 () Bool)

(assert (=> bm!46801 m!1028155))

(declare-fun m!1028157 () Bool)

(assert (=> bm!46801 m!1028157))

(declare-fun m!1028159 () Bool)

(assert (=> bm!46801 m!1028159))

(declare-fun m!1028161 () Bool)

(assert (=> b!1110705 m!1028161))

(declare-fun m!1028163 () Bool)

(assert (=> start!97400 m!1028163))

(declare-fun m!1028165 () Bool)

(assert (=> start!97400 m!1028165))

(declare-fun m!1028167 () Bool)

(assert (=> b!1110704 m!1028167))

(declare-fun m!1028169 () Bool)

(assert (=> b!1110706 m!1028169))

(declare-fun m!1028171 () Bool)

(assert (=> bm!46802 m!1028171))

(declare-fun m!1028173 () Bool)

(assert (=> b!1110713 m!1028173))

(declare-fun m!1028175 () Bool)

(assert (=> b!1110713 m!1028175))

(check-sat (not bm!46802) (not b!1110704) (not b!1110709) (not bm!46801) b_and!37571 (not b_next!23377) (not b!1110705) (not b!1110711) (not start!97400) (not b!1110702) tp_is_empty!27637 (not b!1110706) (not b_lambda!18383) (not mapNonEmpty!43273) (not b!1110712) (not b!1110713) (not b!1110716))
(check-sat b_and!37571 (not b_next!23377))
