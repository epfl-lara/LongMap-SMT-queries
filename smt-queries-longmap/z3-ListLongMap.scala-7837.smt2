; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98002 () Bool)

(assert start!98002)

(declare-fun b_free!23467 () Bool)

(declare-fun b_next!23467 () Bool)

(assert (=> start!98002 (= b_free!23467 (not b_next!23467))))

(declare-fun tp!83105 () Bool)

(declare-fun b_and!37751 () Bool)

(assert (=> start!98002 (= tp!83105 b_and!37751)))

(declare-fun mapIsEmpty!43813 () Bool)

(declare-fun mapRes!43813 () Bool)

(assert (=> mapIsEmpty!43813 mapRes!43813))

(declare-fun b!1119549 () Bool)

(declare-fun e!637796 () Bool)

(declare-fun tp_is_empty!27997 () Bool)

(assert (=> b!1119549 (= e!637796 tp_is_empty!27997)))

(declare-fun b!1119550 () Bool)

(declare-fun res!747350 () Bool)

(declare-fun e!637799 () Bool)

(assert (=> b!1119550 (=> (not res!747350) (not e!637799))))

(declare-datatypes ((array!72931 0))(
  ( (array!72932 (arr!35112 (Array (_ BitVec 32) (_ BitVec 64))) (size!35649 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72931)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42457 0))(
  ( (V!42458 (val!14055 Int)) )
))
(declare-datatypes ((ValueCell!13289 0))(
  ( (ValueCellFull!13289 (v!16684 V!42457)) (EmptyCell!13289) )
))
(declare-datatypes ((array!72933 0))(
  ( (array!72934 (arr!35113 (Array (_ BitVec 32) ValueCell!13289)) (size!35650 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72933)

(assert (=> b!1119550 (= res!747350 (and (= (size!35650 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35649 _keys!1208) (size!35650 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119551 () Bool)

(declare-fun e!637798 () Bool)

(assert (=> b!1119551 (= e!637798 tp_is_empty!27997)))

(declare-fun res!747346 () Bool)

(assert (=> start!98002 (=> (not res!747346) (not e!637799))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98002 (= res!747346 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35649 _keys!1208))))))

(assert (=> start!98002 e!637799))

(assert (=> start!98002 tp_is_empty!27997))

(declare-fun array_inv!27042 (array!72931) Bool)

(assert (=> start!98002 (array_inv!27042 _keys!1208)))

(assert (=> start!98002 true))

(assert (=> start!98002 tp!83105))

(declare-fun e!637800 () Bool)

(declare-fun array_inv!27043 (array!72933) Bool)

(assert (=> start!98002 (and (array_inv!27043 _values!996) e!637800)))

(declare-fun b!1119552 () Bool)

(declare-fun res!747351 () Bool)

(assert (=> b!1119552 (=> (not res!747351) (not e!637799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72931 (_ BitVec 32)) Bool)

(assert (=> b!1119552 (= res!747351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119553 () Bool)

(declare-fun res!747349 () Bool)

(declare-fun e!637795 () Bool)

(assert (=> b!1119553 (=> (not res!747349) (not e!637795))))

(declare-fun lt!497964 () array!72931)

(declare-datatypes ((List!24435 0))(
  ( (Nil!24432) (Cons!24431 (h!25649 (_ BitVec 64)) (t!34908 List!24435)) )
))
(declare-fun arrayNoDuplicates!0 (array!72931 (_ BitVec 32) List!24435) Bool)

(assert (=> b!1119553 (= res!747349 (arrayNoDuplicates!0 lt!497964 #b00000000000000000000000000000000 Nil!24432))))

(declare-fun b!1119554 () Bool)

(declare-fun res!747347 () Bool)

(assert (=> b!1119554 (=> (not res!747347) (not e!637799))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119554 (= res!747347 (validKeyInArray!0 k0!934))))

(declare-fun b!1119555 () Bool)

(declare-fun res!747343 () Bool)

(assert (=> b!1119555 (=> (not res!747343) (not e!637799))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119555 (= res!747343 (= (select (arr!35112 _keys!1208) i!673) k0!934))))

(declare-fun b!1119556 () Bool)

(declare-fun e!637794 () Bool)

(assert (=> b!1119556 (= e!637795 (not e!637794))))

(declare-fun res!747352 () Bool)

(assert (=> b!1119556 (=> res!747352 e!637794)))

(assert (=> b!1119556 (= res!747352 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119556 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36683 0))(
  ( (Unit!36684) )
))
(declare-fun lt!497965 () Unit!36683)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72931 (_ BitVec 64) (_ BitVec 32)) Unit!36683)

(assert (=> b!1119556 (= lt!497965 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43813 () Bool)

(declare-fun tp!83104 () Bool)

(assert (=> mapNonEmpty!43813 (= mapRes!43813 (and tp!83104 e!637798))))

(declare-fun mapValue!43813 () ValueCell!13289)

(declare-fun mapKey!43813 () (_ BitVec 32))

(declare-fun mapRest!43813 () (Array (_ BitVec 32) ValueCell!13289))

(assert (=> mapNonEmpty!43813 (= (arr!35113 _values!996) (store mapRest!43813 mapKey!43813 mapValue!43813))))

(declare-fun b!1119557 () Bool)

(declare-fun res!747344 () Bool)

(assert (=> b!1119557 (=> (not res!747344) (not e!637799))))

(assert (=> b!1119557 (= res!747344 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35649 _keys!1208))))))

(declare-fun b!1119558 () Bool)

(assert (=> b!1119558 (= e!637794 true)))

(declare-fun zeroValue!944 () V!42457)

(declare-datatypes ((tuple2!17646 0))(
  ( (tuple2!17647 (_1!8834 (_ BitVec 64)) (_2!8834 V!42457)) )
))
(declare-datatypes ((List!24436 0))(
  ( (Nil!24433) (Cons!24432 (h!25650 tuple2!17646) (t!34909 List!24436)) )
))
(declare-datatypes ((ListLongMap!15623 0))(
  ( (ListLongMap!15624 (toList!7827 List!24436)) )
))
(declare-fun lt!497963 () ListLongMap!15623)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42457)

(declare-fun getCurrentListMapNoExtraKeys!4357 (array!72931 array!72933 (_ BitVec 32) (_ BitVec 32) V!42457 V!42457 (_ BitVec 32) Int) ListLongMap!15623)

(assert (=> b!1119558 (= lt!497963 (getCurrentListMapNoExtraKeys!4357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119559 () Bool)

(declare-fun res!747345 () Bool)

(assert (=> b!1119559 (=> (not res!747345) (not e!637799))))

(assert (=> b!1119559 (= res!747345 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24432))))

(declare-fun b!1119560 () Bool)

(assert (=> b!1119560 (= e!637799 e!637795)))

(declare-fun res!747342 () Bool)

(assert (=> b!1119560 (=> (not res!747342) (not e!637795))))

(assert (=> b!1119560 (= res!747342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497964 mask!1564))))

(assert (=> b!1119560 (= lt!497964 (array!72932 (store (arr!35112 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35649 _keys!1208)))))

(declare-fun b!1119561 () Bool)

(assert (=> b!1119561 (= e!637800 (and e!637796 mapRes!43813))))

(declare-fun condMapEmpty!43813 () Bool)

(declare-fun mapDefault!43813 () ValueCell!13289)

(assert (=> b!1119561 (= condMapEmpty!43813 (= (arr!35113 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13289)) mapDefault!43813)))))

(declare-fun b!1119562 () Bool)

(declare-fun res!747348 () Bool)

(assert (=> b!1119562 (=> (not res!747348) (not e!637799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119562 (= res!747348 (validMask!0 mask!1564))))

(assert (= (and start!98002 res!747346) b!1119562))

(assert (= (and b!1119562 res!747348) b!1119550))

(assert (= (and b!1119550 res!747350) b!1119552))

(assert (= (and b!1119552 res!747351) b!1119559))

(assert (= (and b!1119559 res!747345) b!1119557))

(assert (= (and b!1119557 res!747344) b!1119554))

(assert (= (and b!1119554 res!747347) b!1119555))

(assert (= (and b!1119555 res!747343) b!1119560))

(assert (= (and b!1119560 res!747342) b!1119553))

(assert (= (and b!1119553 res!747349) b!1119556))

(assert (= (and b!1119556 (not res!747352)) b!1119558))

(assert (= (and b!1119561 condMapEmpty!43813) mapIsEmpty!43813))

(assert (= (and b!1119561 (not condMapEmpty!43813)) mapNonEmpty!43813))

(get-info :version)

(assert (= (and mapNonEmpty!43813 ((_ is ValueCellFull!13289) mapValue!43813)) b!1119551))

(assert (= (and b!1119561 ((_ is ValueCellFull!13289) mapDefault!43813)) b!1119549))

(assert (= start!98002 b!1119561))

(declare-fun m!1035507 () Bool)

(assert (=> b!1119560 m!1035507))

(declare-fun m!1035509 () Bool)

(assert (=> b!1119560 m!1035509))

(declare-fun m!1035511 () Bool)

(assert (=> b!1119552 m!1035511))

(declare-fun m!1035513 () Bool)

(assert (=> b!1119554 m!1035513))

(declare-fun m!1035515 () Bool)

(assert (=> b!1119555 m!1035515))

(declare-fun m!1035517 () Bool)

(assert (=> b!1119553 m!1035517))

(declare-fun m!1035519 () Bool)

(assert (=> b!1119562 m!1035519))

(declare-fun m!1035521 () Bool)

(assert (=> b!1119559 m!1035521))

(declare-fun m!1035523 () Bool)

(assert (=> mapNonEmpty!43813 m!1035523))

(declare-fun m!1035525 () Bool)

(assert (=> start!98002 m!1035525))

(declare-fun m!1035527 () Bool)

(assert (=> start!98002 m!1035527))

(declare-fun m!1035529 () Bool)

(assert (=> b!1119558 m!1035529))

(declare-fun m!1035531 () Bool)

(assert (=> b!1119556 m!1035531))

(declare-fun m!1035533 () Bool)

(assert (=> b!1119556 m!1035533))

(check-sat (not b!1119558) (not b_next!23467) (not b!1119560) (not b!1119553) (not b!1119554) (not b!1119556) (not b!1119552) b_and!37751 (not b!1119562) (not mapNonEmpty!43813) tp_is_empty!27997 (not b!1119559) (not start!98002))
(check-sat b_and!37751 (not b_next!23467))
