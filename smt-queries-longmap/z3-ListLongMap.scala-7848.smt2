; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97826 () Bool)

(assert start!97826)

(declare-fun b_free!23533 () Bool)

(declare-fun b_next!23533 () Bool)

(assert (=> start!97826 (= b_free!23533 (not b_next!23533))))

(declare-fun tp!83302 () Bool)

(declare-fun b_and!37827 () Bool)

(assert (=> start!97826 (= tp!83302 b_and!37827)))

(declare-fun b!1119521 () Bool)

(declare-fun e!637554 () Bool)

(declare-fun e!637557 () Bool)

(assert (=> b!1119521 (= e!637554 e!637557)))

(declare-fun res!747842 () Bool)

(assert (=> b!1119521 (=> (not res!747842) (not e!637557))))

(declare-datatypes ((array!72920 0))(
  ( (array!72921 (arr!35113 (Array (_ BitVec 32) (_ BitVec 64))) (size!35651 (_ BitVec 32))) )
))
(declare-fun lt!497613 () array!72920)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72920 (_ BitVec 32)) Bool)

(assert (=> b!1119521 (= res!747842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497613 mask!1564))))

(declare-fun _keys!1208 () array!72920)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119521 (= lt!497613 (array!72921 (store (arr!35113 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35651 _keys!1208)))))

(declare-fun b!1119522 () Bool)

(declare-fun res!747849 () Bool)

(assert (=> b!1119522 (=> (not res!747849) (not e!637557))))

(declare-datatypes ((List!24505 0))(
  ( (Nil!24502) (Cons!24501 (h!25710 (_ BitVec 64)) (t!35021 List!24505)) )
))
(declare-fun arrayNoDuplicates!0 (array!72920 (_ BitVec 32) List!24505) Bool)

(assert (=> b!1119522 (= res!747849 (arrayNoDuplicates!0 lt!497613 #b00000000000000000000000000000000 Nil!24502))))

(declare-fun b!1119523 () Bool)

(declare-fun e!637553 () Bool)

(declare-fun tp_is_empty!28063 () Bool)

(assert (=> b!1119523 (= e!637553 tp_is_empty!28063)))

(declare-fun b!1119524 () Bool)

(declare-fun e!637552 () Bool)

(assert (=> b!1119524 (= e!637552 true)))

(declare-datatypes ((V!42545 0))(
  ( (V!42546 (val!14088 Int)) )
))
(declare-fun zeroValue!944 () V!42545)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17734 0))(
  ( (tuple2!17735 (_1!8878 (_ BitVec 64)) (_2!8878 V!42545)) )
))
(declare-datatypes ((List!24506 0))(
  ( (Nil!24503) (Cons!24502 (h!25711 tuple2!17734) (t!35022 List!24506)) )
))
(declare-datatypes ((ListLongMap!15703 0))(
  ( (ListLongMap!15704 (toList!7867 List!24506)) )
))
(declare-fun lt!497610 () ListLongMap!15703)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13322 0))(
  ( (ValueCellFull!13322 (v!16720 V!42545)) (EmptyCell!13322) )
))
(declare-datatypes ((array!72922 0))(
  ( (array!72923 (arr!35114 (Array (_ BitVec 32) ValueCell!13322)) (size!35652 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72922)

(declare-fun minValue!944 () V!42545)

(declare-fun getCurrentListMapNoExtraKeys!4376 (array!72920 array!72922 (_ BitVec 32) (_ BitVec 32) V!42545 V!42545 (_ BitVec 32) Int) ListLongMap!15703)

(declare-fun dynLambda!2419 (Int (_ BitVec 64)) V!42545)

(assert (=> b!1119524 (= lt!497610 (getCurrentListMapNoExtraKeys!4376 lt!497613 (array!72923 (store (arr!35114 _values!996) i!673 (ValueCellFull!13322 (dynLambda!2419 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35652 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497611 () ListLongMap!15703)

(assert (=> b!1119524 (= lt!497611 (getCurrentListMapNoExtraKeys!4376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119525 () Bool)

(assert (=> b!1119525 (= e!637557 (not e!637552))))

(declare-fun res!747844 () Bool)

(assert (=> b!1119525 (=> res!747844 e!637552)))

(assert (=> b!1119525 (= res!747844 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119525 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36567 0))(
  ( (Unit!36568) )
))
(declare-fun lt!497612 () Unit!36567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72920 (_ BitVec 64) (_ BitVec 32)) Unit!36567)

(assert (=> b!1119525 (= lt!497612 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!747840 () Bool)

(assert (=> start!97826 (=> (not res!747840) (not e!637554))))

(assert (=> start!97826 (= res!747840 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35651 _keys!1208))))))

(assert (=> start!97826 e!637554))

(assert (=> start!97826 tp_is_empty!28063))

(declare-fun array_inv!27038 (array!72920) Bool)

(assert (=> start!97826 (array_inv!27038 _keys!1208)))

(assert (=> start!97826 true))

(assert (=> start!97826 tp!83302))

(declare-fun e!637551 () Bool)

(declare-fun array_inv!27039 (array!72922) Bool)

(assert (=> start!97826 (and (array_inv!27039 _values!996) e!637551)))

(declare-fun mapNonEmpty!43912 () Bool)

(declare-fun mapRes!43912 () Bool)

(declare-fun tp!83303 () Bool)

(assert (=> mapNonEmpty!43912 (= mapRes!43912 (and tp!83303 e!637553))))

(declare-fun mapValue!43912 () ValueCell!13322)

(declare-fun mapKey!43912 () (_ BitVec 32))

(declare-fun mapRest!43912 () (Array (_ BitVec 32) ValueCell!13322))

(assert (=> mapNonEmpty!43912 (= (arr!35114 _values!996) (store mapRest!43912 mapKey!43912 mapValue!43912))))

(declare-fun b!1119526 () Bool)

(declare-fun res!747847 () Bool)

(assert (=> b!1119526 (=> (not res!747847) (not e!637554))))

(assert (=> b!1119526 (= res!747847 (= (select (arr!35113 _keys!1208) i!673) k0!934))))

(declare-fun b!1119527 () Bool)

(declare-fun e!637555 () Bool)

(assert (=> b!1119527 (= e!637551 (and e!637555 mapRes!43912))))

(declare-fun condMapEmpty!43912 () Bool)

(declare-fun mapDefault!43912 () ValueCell!13322)

(assert (=> b!1119527 (= condMapEmpty!43912 (= (arr!35114 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13322)) mapDefault!43912)))))

(declare-fun b!1119528 () Bool)

(assert (=> b!1119528 (= e!637555 tp_is_empty!28063)))

(declare-fun mapIsEmpty!43912 () Bool)

(assert (=> mapIsEmpty!43912 mapRes!43912))

(declare-fun b!1119529 () Bool)

(declare-fun res!747846 () Bool)

(assert (=> b!1119529 (=> (not res!747846) (not e!637554))))

(assert (=> b!1119529 (= res!747846 (and (= (size!35652 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35651 _keys!1208) (size!35652 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119530 () Bool)

(declare-fun res!747850 () Bool)

(assert (=> b!1119530 (=> (not res!747850) (not e!637554))))

(assert (=> b!1119530 (= res!747850 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35651 _keys!1208))))))

(declare-fun b!1119531 () Bool)

(declare-fun res!747848 () Bool)

(assert (=> b!1119531 (=> (not res!747848) (not e!637554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119531 (= res!747848 (validMask!0 mask!1564))))

(declare-fun b!1119532 () Bool)

(declare-fun res!747843 () Bool)

(assert (=> b!1119532 (=> (not res!747843) (not e!637554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119532 (= res!747843 (validKeyInArray!0 k0!934))))

(declare-fun b!1119533 () Bool)

(declare-fun res!747845 () Bool)

(assert (=> b!1119533 (=> (not res!747845) (not e!637554))))

(assert (=> b!1119533 (= res!747845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119534 () Bool)

(declare-fun res!747841 () Bool)

(assert (=> b!1119534 (=> (not res!747841) (not e!637554))))

(assert (=> b!1119534 (= res!747841 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24502))))

(assert (= (and start!97826 res!747840) b!1119531))

(assert (= (and b!1119531 res!747848) b!1119529))

(assert (= (and b!1119529 res!747846) b!1119533))

(assert (= (and b!1119533 res!747845) b!1119534))

(assert (= (and b!1119534 res!747841) b!1119530))

(assert (= (and b!1119530 res!747850) b!1119532))

(assert (= (and b!1119532 res!747843) b!1119526))

(assert (= (and b!1119526 res!747847) b!1119521))

(assert (= (and b!1119521 res!747842) b!1119522))

(assert (= (and b!1119522 res!747849) b!1119525))

(assert (= (and b!1119525 (not res!747844)) b!1119524))

(assert (= (and b!1119527 condMapEmpty!43912) mapIsEmpty!43912))

(assert (= (and b!1119527 (not condMapEmpty!43912)) mapNonEmpty!43912))

(get-info :version)

(assert (= (and mapNonEmpty!43912 ((_ is ValueCellFull!13322) mapValue!43912)) b!1119523))

(assert (= (and b!1119527 ((_ is ValueCellFull!13322) mapDefault!43912)) b!1119528))

(assert (= start!97826 b!1119527))

(declare-fun b_lambda!18485 () Bool)

(assert (=> (not b_lambda!18485) (not b!1119524)))

(declare-fun t!35020 () Bool)

(declare-fun tb!8337 () Bool)

(assert (=> (and start!97826 (= defaultEntry!1004 defaultEntry!1004) t!35020) tb!8337))

(declare-fun result!17243 () Bool)

(assert (=> tb!8337 (= result!17243 tp_is_empty!28063)))

(assert (=> b!1119524 t!35020))

(declare-fun b_and!37829 () Bool)

(assert (= b_and!37827 (and (=> t!35020 result!17243) b_and!37829)))

(declare-fun m!1034259 () Bool)

(assert (=> b!1119534 m!1034259))

(declare-fun m!1034261 () Bool)

(assert (=> b!1119531 m!1034261))

(declare-fun m!1034263 () Bool)

(assert (=> mapNonEmpty!43912 m!1034263))

(declare-fun m!1034265 () Bool)

(assert (=> start!97826 m!1034265))

(declare-fun m!1034267 () Bool)

(assert (=> start!97826 m!1034267))

(declare-fun m!1034269 () Bool)

(assert (=> b!1119522 m!1034269))

(declare-fun m!1034271 () Bool)

(assert (=> b!1119524 m!1034271))

(declare-fun m!1034273 () Bool)

(assert (=> b!1119524 m!1034273))

(declare-fun m!1034275 () Bool)

(assert (=> b!1119524 m!1034275))

(declare-fun m!1034277 () Bool)

(assert (=> b!1119524 m!1034277))

(declare-fun m!1034279 () Bool)

(assert (=> b!1119525 m!1034279))

(declare-fun m!1034281 () Bool)

(assert (=> b!1119525 m!1034281))

(declare-fun m!1034283 () Bool)

(assert (=> b!1119526 m!1034283))

(declare-fun m!1034285 () Bool)

(assert (=> b!1119532 m!1034285))

(declare-fun m!1034287 () Bool)

(assert (=> b!1119533 m!1034287))

(declare-fun m!1034289 () Bool)

(assert (=> b!1119521 m!1034289))

(declare-fun m!1034291 () Bool)

(assert (=> b!1119521 m!1034291))

(check-sat (not b!1119534) (not b!1119522) tp_is_empty!28063 (not b!1119525) (not b!1119533) b_and!37829 (not start!97826) (not mapNonEmpty!43912) (not b!1119531) (not b_next!23533) (not b!1119521) (not b!1119532) (not b_lambda!18485) (not b!1119524))
(check-sat b_and!37829 (not b_next!23533))
