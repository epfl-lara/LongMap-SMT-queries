; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97850 () Bool)

(assert start!97850)

(declare-fun b_free!23557 () Bool)

(declare-fun b_next!23557 () Bool)

(assert (=> start!97850 (= b_free!23557 (not b_next!23557))))

(declare-fun tp!83374 () Bool)

(declare-fun b_and!37875 () Bool)

(assert (=> start!97850 (= tp!83374 b_and!37875)))

(declare-fun b!1120049 () Bool)

(declare-fun res!748240 () Bool)

(declare-fun e!637805 () Bool)

(assert (=> b!1120049 (=> (not res!748240) (not e!637805))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120049 (= res!748240 (validKeyInArray!0 k0!934))))

(declare-fun b!1120050 () Bool)

(declare-fun res!748239 () Bool)

(assert (=> b!1120050 (=> (not res!748239) (not e!637805))))

(declare-datatypes ((array!72968 0))(
  ( (array!72969 (arr!35137 (Array (_ BitVec 32) (_ BitVec 64))) (size!35675 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72968)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42577 0))(
  ( (V!42578 (val!14100 Int)) )
))
(declare-datatypes ((ValueCell!13334 0))(
  ( (ValueCellFull!13334 (v!16732 V!42577)) (EmptyCell!13334) )
))
(declare-datatypes ((array!72970 0))(
  ( (array!72971 (arr!35138 (Array (_ BitVec 32) ValueCell!13334)) (size!35676 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72970)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1120050 (= res!748239 (and (= (size!35676 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35675 _keys!1208) (size!35676 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120051 () Bool)

(declare-fun res!748243 () Bool)

(assert (=> b!1120051 (=> (not res!748243) (not e!637805))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120051 (= res!748243 (= (select (arr!35137 _keys!1208) i!673) k0!934))))

(declare-fun b!1120052 () Bool)

(declare-fun res!748237 () Bool)

(assert (=> b!1120052 (=> (not res!748237) (not e!637805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120052 (= res!748237 (validMask!0 mask!1564))))

(declare-fun b!1120053 () Bool)

(declare-fun e!637807 () Bool)

(assert (=> b!1120053 (= e!637805 e!637807)))

(declare-fun res!748236 () Bool)

(assert (=> b!1120053 (=> (not res!748236) (not e!637807))))

(declare-fun lt!497755 () array!72968)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72968 (_ BitVec 32)) Bool)

(assert (=> b!1120053 (= res!748236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497755 mask!1564))))

(assert (=> b!1120053 (= lt!497755 (array!72969 (store (arr!35137 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35675 _keys!1208)))))

(declare-fun b!1120054 () Bool)

(declare-fun e!637803 () Bool)

(assert (=> b!1120054 (= e!637803 true)))

(declare-fun zeroValue!944 () V!42577)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17756 0))(
  ( (tuple2!17757 (_1!8889 (_ BitVec 64)) (_2!8889 V!42577)) )
))
(declare-datatypes ((List!24528 0))(
  ( (Nil!24525) (Cons!24524 (h!25733 tuple2!17756) (t!35068 List!24528)) )
))
(declare-datatypes ((ListLongMap!15725 0))(
  ( (ListLongMap!15726 (toList!7878 List!24528)) )
))
(declare-fun lt!497754 () ListLongMap!15725)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42577)

(declare-fun getCurrentListMapNoExtraKeys!4387 (array!72968 array!72970 (_ BitVec 32) (_ BitVec 32) V!42577 V!42577 (_ BitVec 32) Int) ListLongMap!15725)

(declare-fun dynLambda!2430 (Int (_ BitVec 64)) V!42577)

(assert (=> b!1120054 (= lt!497754 (getCurrentListMapNoExtraKeys!4387 lt!497755 (array!72971 (store (arr!35138 _values!996) i!673 (ValueCellFull!13334 (dynLambda!2430 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35676 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497756 () ListLongMap!15725)

(assert (=> b!1120054 (= lt!497756 (getCurrentListMapNoExtraKeys!4387 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120055 () Bool)

(declare-fun res!748246 () Bool)

(assert (=> b!1120055 (=> (not res!748246) (not e!637805))))

(assert (=> b!1120055 (= res!748246 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35675 _keys!1208))))))

(declare-fun res!748242 () Bool)

(assert (=> start!97850 (=> (not res!748242) (not e!637805))))

(assert (=> start!97850 (= res!748242 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35675 _keys!1208))))))

(assert (=> start!97850 e!637805))

(declare-fun tp_is_empty!28087 () Bool)

(assert (=> start!97850 tp_is_empty!28087))

(declare-fun array_inv!27060 (array!72968) Bool)

(assert (=> start!97850 (array_inv!27060 _keys!1208)))

(assert (=> start!97850 true))

(assert (=> start!97850 tp!83374))

(declare-fun e!637804 () Bool)

(declare-fun array_inv!27061 (array!72970) Bool)

(assert (=> start!97850 (and (array_inv!27061 _values!996) e!637804)))

(declare-fun b!1120056 () Bool)

(declare-fun res!748244 () Bool)

(assert (=> b!1120056 (=> (not res!748244) (not e!637807))))

(declare-datatypes ((List!24529 0))(
  ( (Nil!24526) (Cons!24525 (h!25734 (_ BitVec 64)) (t!35069 List!24529)) )
))
(declare-fun arrayNoDuplicates!0 (array!72968 (_ BitVec 32) List!24529) Bool)

(assert (=> b!1120056 (= res!748244 (arrayNoDuplicates!0 lt!497755 #b00000000000000000000000000000000 Nil!24526))))

(declare-fun b!1120057 () Bool)

(declare-fun e!637808 () Bool)

(declare-fun mapRes!43948 () Bool)

(assert (=> b!1120057 (= e!637804 (and e!637808 mapRes!43948))))

(declare-fun condMapEmpty!43948 () Bool)

(declare-fun mapDefault!43948 () ValueCell!13334)

(assert (=> b!1120057 (= condMapEmpty!43948 (= (arr!35138 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13334)) mapDefault!43948)))))

(declare-fun b!1120058 () Bool)

(assert (=> b!1120058 (= e!637807 (not e!637803))))

(declare-fun res!748241 () Bool)

(assert (=> b!1120058 (=> res!748241 e!637803)))

(assert (=> b!1120058 (= res!748241 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120058 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36581 0))(
  ( (Unit!36582) )
))
(declare-fun lt!497757 () Unit!36581)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72968 (_ BitVec 64) (_ BitVec 32)) Unit!36581)

(assert (=> b!1120058 (= lt!497757 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!43948 () Bool)

(assert (=> mapIsEmpty!43948 mapRes!43948))

(declare-fun b!1120059 () Bool)

(assert (=> b!1120059 (= e!637808 tp_is_empty!28087)))

(declare-fun mapNonEmpty!43948 () Bool)

(declare-fun tp!83375 () Bool)

(declare-fun e!637809 () Bool)

(assert (=> mapNonEmpty!43948 (= mapRes!43948 (and tp!83375 e!637809))))

(declare-fun mapValue!43948 () ValueCell!13334)

(declare-fun mapRest!43948 () (Array (_ BitVec 32) ValueCell!13334))

(declare-fun mapKey!43948 () (_ BitVec 32))

(assert (=> mapNonEmpty!43948 (= (arr!35138 _values!996) (store mapRest!43948 mapKey!43948 mapValue!43948))))

(declare-fun b!1120060 () Bool)

(declare-fun res!748245 () Bool)

(assert (=> b!1120060 (=> (not res!748245) (not e!637805))))

(assert (=> b!1120060 (= res!748245 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24526))))

(declare-fun b!1120061 () Bool)

(declare-fun res!748238 () Bool)

(assert (=> b!1120061 (=> (not res!748238) (not e!637805))))

(assert (=> b!1120061 (= res!748238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120062 () Bool)

(assert (=> b!1120062 (= e!637809 tp_is_empty!28087)))

(assert (= (and start!97850 res!748242) b!1120052))

(assert (= (and b!1120052 res!748237) b!1120050))

(assert (= (and b!1120050 res!748239) b!1120061))

(assert (= (and b!1120061 res!748238) b!1120060))

(assert (= (and b!1120060 res!748245) b!1120055))

(assert (= (and b!1120055 res!748246) b!1120049))

(assert (= (and b!1120049 res!748240) b!1120051))

(assert (= (and b!1120051 res!748243) b!1120053))

(assert (= (and b!1120053 res!748236) b!1120056))

(assert (= (and b!1120056 res!748244) b!1120058))

(assert (= (and b!1120058 (not res!748241)) b!1120054))

(assert (= (and b!1120057 condMapEmpty!43948) mapIsEmpty!43948))

(assert (= (and b!1120057 (not condMapEmpty!43948)) mapNonEmpty!43948))

(get-info :version)

(assert (= (and mapNonEmpty!43948 ((_ is ValueCellFull!13334) mapValue!43948)) b!1120062))

(assert (= (and b!1120057 ((_ is ValueCellFull!13334) mapDefault!43948)) b!1120059))

(assert (= start!97850 b!1120057))

(declare-fun b_lambda!18509 () Bool)

(assert (=> (not b_lambda!18509) (not b!1120054)))

(declare-fun t!35067 () Bool)

(declare-fun tb!8361 () Bool)

(assert (=> (and start!97850 (= defaultEntry!1004 defaultEntry!1004) t!35067) tb!8361))

(declare-fun result!17291 () Bool)

(assert (=> tb!8361 (= result!17291 tp_is_empty!28087)))

(assert (=> b!1120054 t!35067))

(declare-fun b_and!37877 () Bool)

(assert (= b_and!37875 (and (=> t!35067 result!17291) b_and!37877)))

(declare-fun m!1034667 () Bool)

(assert (=> b!1120054 m!1034667))

(declare-fun m!1034669 () Bool)

(assert (=> b!1120054 m!1034669))

(declare-fun m!1034671 () Bool)

(assert (=> b!1120054 m!1034671))

(declare-fun m!1034673 () Bool)

(assert (=> b!1120054 m!1034673))

(declare-fun m!1034675 () Bool)

(assert (=> b!1120060 m!1034675))

(declare-fun m!1034677 () Bool)

(assert (=> b!1120061 m!1034677))

(declare-fun m!1034679 () Bool)

(assert (=> b!1120052 m!1034679))

(declare-fun m!1034681 () Bool)

(assert (=> b!1120056 m!1034681))

(declare-fun m!1034683 () Bool)

(assert (=> b!1120053 m!1034683))

(declare-fun m!1034685 () Bool)

(assert (=> b!1120053 m!1034685))

(declare-fun m!1034687 () Bool)

(assert (=> b!1120051 m!1034687))

(declare-fun m!1034689 () Bool)

(assert (=> b!1120049 m!1034689))

(declare-fun m!1034691 () Bool)

(assert (=> start!97850 m!1034691))

(declare-fun m!1034693 () Bool)

(assert (=> start!97850 m!1034693))

(declare-fun m!1034695 () Bool)

(assert (=> b!1120058 m!1034695))

(declare-fun m!1034697 () Bool)

(assert (=> b!1120058 m!1034697))

(declare-fun m!1034699 () Bool)

(assert (=> mapNonEmpty!43948 m!1034699))

(check-sat tp_is_empty!28087 (not start!97850) (not b!1120052) (not b!1120056) (not b!1120053) (not b_lambda!18509) (not b!1120060) (not mapNonEmpty!43948) (not b!1120058) b_and!37877 (not b!1120049) (not b!1120061) (not b!1120054) (not b_next!23557))
(check-sat b_and!37877 (not b_next!23557))
