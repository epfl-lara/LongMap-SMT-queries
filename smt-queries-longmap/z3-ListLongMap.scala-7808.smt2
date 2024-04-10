; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97594 () Bool)

(assert start!97594)

(declare-fun b!1114822 () Bool)

(declare-fun e!635346 () Bool)

(declare-fun e!635344 () Bool)

(assert (=> b!1114822 (= e!635346 e!635344)))

(declare-fun res!744200 () Bool)

(assert (=> b!1114822 (=> (not res!744200) (not e!635344))))

(declare-datatypes ((array!72555 0))(
  ( (array!72556 (arr!34930 (Array (_ BitVec 32) (_ BitVec 64))) (size!35466 (_ BitVec 32))) )
))
(declare-fun lt!496886 () array!72555)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72555 (_ BitVec 32)) Bool)

(assert (=> b!1114822 (= res!744200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496886 mask!1564))))

(declare-fun _keys!1208 () array!72555)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114822 (= lt!496886 (array!72556 (store (arr!34930 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35466 _keys!1208)))))

(declare-fun b!1114823 () Bool)

(declare-fun res!744198 () Bool)

(assert (=> b!1114823 (=> (not res!744198) (not e!635346))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1114823 (= res!744198 (= (select (arr!34930 _keys!1208) i!673) k0!934))))

(declare-fun b!1114824 () Bool)

(declare-fun res!744199 () Bool)

(assert (=> b!1114824 (=> (not res!744199) (not e!635346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114824 (= res!744199 (validMask!0 mask!1564))))

(declare-fun b!1114825 () Bool)

(declare-fun res!744194 () Bool)

(assert (=> b!1114825 (=> (not res!744194) (not e!635346))))

(declare-datatypes ((List!24336 0))(
  ( (Nil!24333) (Cons!24332 (h!25541 (_ BitVec 64)) (t!34817 List!24336)) )
))
(declare-fun arrayNoDuplicates!0 (array!72555 (_ BitVec 32) List!24336) Bool)

(assert (=> b!1114825 (= res!744194 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24333))))

(declare-fun b!1114826 () Bool)

(declare-fun res!744202 () Bool)

(assert (=> b!1114826 (=> (not res!744202) (not e!635346))))

(assert (=> b!1114826 (= res!744202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114827 () Bool)

(declare-fun e!635349 () Bool)

(declare-fun tp_is_empty!27825 () Bool)

(assert (=> b!1114827 (= e!635349 tp_is_empty!27825)))

(declare-fun b!1114828 () Bool)

(declare-fun res!744197 () Bool)

(assert (=> b!1114828 (=> (not res!744197) (not e!635346))))

(assert (=> b!1114828 (= res!744197 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35466 _keys!1208))))))

(declare-fun b!1114829 () Bool)

(declare-fun res!744193 () Bool)

(assert (=> b!1114829 (=> (not res!744193) (not e!635344))))

(assert (=> b!1114829 (= res!744193 (arrayNoDuplicates!0 lt!496886 #b00000000000000000000000000000000 Nil!24333))))

(declare-fun res!744196 () Bool)

(assert (=> start!97594 (=> (not res!744196) (not e!635346))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97594 (= res!744196 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35466 _keys!1208))))))

(assert (=> start!97594 e!635346))

(declare-fun array_inv!26852 (array!72555) Bool)

(assert (=> start!97594 (array_inv!26852 _keys!1208)))

(assert (=> start!97594 true))

(declare-datatypes ((V!42227 0))(
  ( (V!42228 (val!13969 Int)) )
))
(declare-datatypes ((ValueCell!13203 0))(
  ( (ValueCellFull!13203 (v!16602 V!42227)) (EmptyCell!13203) )
))
(declare-datatypes ((array!72557 0))(
  ( (array!72558 (arr!34931 (Array (_ BitVec 32) ValueCell!13203)) (size!35467 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72557)

(declare-fun e!635348 () Bool)

(declare-fun array_inv!26853 (array!72557) Bool)

(assert (=> start!97594 (and (array_inv!26853 _values!996) e!635348)))

(declare-fun b!1114821 () Bool)

(declare-fun res!744201 () Bool)

(assert (=> b!1114821 (=> (not res!744201) (not e!635346))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114821 (= res!744201 (and (= (size!35467 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35466 _keys!1208) (size!35467 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114830 () Bool)

(declare-fun e!635345 () Bool)

(declare-fun mapRes!43555 () Bool)

(assert (=> b!1114830 (= e!635348 (and e!635345 mapRes!43555))))

(declare-fun condMapEmpty!43555 () Bool)

(declare-fun mapDefault!43555 () ValueCell!13203)

(assert (=> b!1114830 (= condMapEmpty!43555 (= (arr!34931 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13203)) mapDefault!43555)))))

(declare-fun mapNonEmpty!43555 () Bool)

(declare-fun tp!82799 () Bool)

(assert (=> mapNonEmpty!43555 (= mapRes!43555 (and tp!82799 e!635349))))

(declare-fun mapValue!43555 () ValueCell!13203)

(declare-fun mapRest!43555 () (Array (_ BitVec 32) ValueCell!13203))

(declare-fun mapKey!43555 () (_ BitVec 32))

(assert (=> mapNonEmpty!43555 (= (arr!34931 _values!996) (store mapRest!43555 mapKey!43555 mapValue!43555))))

(declare-fun b!1114831 () Bool)

(declare-fun res!744195 () Bool)

(assert (=> b!1114831 (=> (not res!744195) (not e!635346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114831 (= res!744195 (validKeyInArray!0 k0!934))))

(declare-fun b!1114832 () Bool)

(assert (=> b!1114832 (= e!635345 tp_is_empty!27825)))

(declare-fun mapIsEmpty!43555 () Bool)

(assert (=> mapIsEmpty!43555 mapRes!43555))

(declare-fun b!1114833 () Bool)

(assert (=> b!1114833 (= e!635344 (not true))))

(declare-fun arrayContainsKey!0 (array!72555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114833 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36588 0))(
  ( (Unit!36589) )
))
(declare-fun lt!496885 () Unit!36588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72555 (_ BitVec 64) (_ BitVec 32)) Unit!36588)

(assert (=> b!1114833 (= lt!496885 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97594 res!744196) b!1114824))

(assert (= (and b!1114824 res!744199) b!1114821))

(assert (= (and b!1114821 res!744201) b!1114826))

(assert (= (and b!1114826 res!744202) b!1114825))

(assert (= (and b!1114825 res!744194) b!1114828))

(assert (= (and b!1114828 res!744197) b!1114831))

(assert (= (and b!1114831 res!744195) b!1114823))

(assert (= (and b!1114823 res!744198) b!1114822))

(assert (= (and b!1114822 res!744200) b!1114829))

(assert (= (and b!1114829 res!744193) b!1114833))

(assert (= (and b!1114830 condMapEmpty!43555) mapIsEmpty!43555))

(assert (= (and b!1114830 (not condMapEmpty!43555)) mapNonEmpty!43555))

(get-info :version)

(assert (= (and mapNonEmpty!43555 ((_ is ValueCellFull!13203) mapValue!43555)) b!1114827))

(assert (= (and b!1114830 ((_ is ValueCellFull!13203) mapDefault!43555)) b!1114832))

(assert (= start!97594 b!1114830))

(declare-fun m!1031569 () Bool)

(assert (=> b!1114833 m!1031569))

(declare-fun m!1031571 () Bool)

(assert (=> b!1114833 m!1031571))

(declare-fun m!1031573 () Bool)

(assert (=> b!1114826 m!1031573))

(declare-fun m!1031575 () Bool)

(assert (=> b!1114829 m!1031575))

(declare-fun m!1031577 () Bool)

(assert (=> b!1114822 m!1031577))

(declare-fun m!1031579 () Bool)

(assert (=> b!1114822 m!1031579))

(declare-fun m!1031581 () Bool)

(assert (=> mapNonEmpty!43555 m!1031581))

(declare-fun m!1031583 () Bool)

(assert (=> b!1114823 m!1031583))

(declare-fun m!1031585 () Bool)

(assert (=> b!1114831 m!1031585))

(declare-fun m!1031587 () Bool)

(assert (=> start!97594 m!1031587))

(declare-fun m!1031589 () Bool)

(assert (=> start!97594 m!1031589))

(declare-fun m!1031591 () Bool)

(assert (=> b!1114825 m!1031591))

(declare-fun m!1031593 () Bool)

(assert (=> b!1114824 m!1031593))

(check-sat (not b!1114826) (not b!1114833) (not b!1114831) (not b!1114825) (not b!1114822) (not b!1114829) (not mapNonEmpty!43555) tp_is_empty!27825 (not b!1114824) (not start!97594))
(check-sat)
