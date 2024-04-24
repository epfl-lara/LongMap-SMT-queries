; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97762 () Bool)

(assert start!97762)

(declare-fun b!1114822 () Bool)

(declare-fun res!743701 () Bool)

(declare-fun e!635590 () Bool)

(assert (=> b!1114822 (=> (not res!743701) (not e!635590))))

(declare-datatypes ((array!72461 0))(
  ( (array!72462 (arr!34877 (Array (_ BitVec 32) (_ BitVec 64))) (size!35414 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72461)

(declare-datatypes ((List!24330 0))(
  ( (Nil!24327) (Cons!24326 (h!25544 (_ BitVec 64)) (t!34803 List!24330)) )
))
(declare-fun arrayNoDuplicates!0 (array!72461 (_ BitVec 32) List!24330) Bool)

(assert (=> b!1114822 (= res!743701 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24327))))

(declare-fun b!1114823 () Bool)

(declare-fun res!743703 () Bool)

(assert (=> b!1114823 (=> (not res!743703) (not e!635590))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72461 (_ BitVec 32)) Bool)

(assert (=> b!1114823 (= res!743703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114824 () Bool)

(declare-fun e!635592 () Bool)

(declare-fun e!635588 () Bool)

(declare-fun mapRes!43453 () Bool)

(assert (=> b!1114824 (= e!635592 (and e!635588 mapRes!43453))))

(declare-fun condMapEmpty!43453 () Bool)

(declare-datatypes ((V!42137 0))(
  ( (V!42138 (val!13935 Int)) )
))
(declare-datatypes ((ValueCell!13169 0))(
  ( (ValueCellFull!13169 (v!16564 V!42137)) (EmptyCell!13169) )
))
(declare-datatypes ((array!72463 0))(
  ( (array!72464 (arr!34878 (Array (_ BitVec 32) ValueCell!13169)) (size!35415 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72463)

(declare-fun mapDefault!43453 () ValueCell!13169)

(assert (=> b!1114824 (= condMapEmpty!43453 (= (arr!34878 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13169)) mapDefault!43453)))))

(declare-fun mapIsEmpty!43453 () Bool)

(assert (=> mapIsEmpty!43453 mapRes!43453))

(declare-fun b!1114825 () Bool)

(declare-fun res!743699 () Bool)

(assert (=> b!1114825 (=> (not res!743699) (not e!635590))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114825 (= res!743699 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35414 _keys!1208))))))

(declare-fun mapNonEmpty!43453 () Bool)

(declare-fun tp!82697 () Bool)

(declare-fun e!635591 () Bool)

(assert (=> mapNonEmpty!43453 (= mapRes!43453 (and tp!82697 e!635591))))

(declare-fun mapKey!43453 () (_ BitVec 32))

(declare-fun mapRest!43453 () (Array (_ BitVec 32) ValueCell!13169))

(declare-fun mapValue!43453 () ValueCell!13169)

(assert (=> mapNonEmpty!43453 (= (arr!34878 _values!996) (store mapRest!43453 mapKey!43453 mapValue!43453))))

(declare-fun b!1114826 () Bool)

(declare-fun res!743695 () Bool)

(assert (=> b!1114826 (=> (not res!743695) (not e!635590))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114826 (= res!743695 (and (= (size!35415 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35414 _keys!1208) (size!35415 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114827 () Bool)

(declare-fun e!635589 () Bool)

(assert (=> b!1114827 (= e!635589 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114827 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36519 0))(
  ( (Unit!36520) )
))
(declare-fun lt!497196 () Unit!36519)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72461 (_ BitVec 64) (_ BitVec 32)) Unit!36519)

(assert (=> b!1114827 (= lt!497196 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114828 () Bool)

(declare-fun res!743704 () Bool)

(assert (=> b!1114828 (=> (not res!743704) (not e!635590))))

(assert (=> b!1114828 (= res!743704 (= (select (arr!34877 _keys!1208) i!673) k0!934))))

(declare-fun b!1114829 () Bool)

(assert (=> b!1114829 (= e!635590 e!635589)))

(declare-fun res!743698 () Bool)

(assert (=> b!1114829 (=> (not res!743698) (not e!635589))))

(declare-fun lt!497197 () array!72461)

(assert (=> b!1114829 (= res!743698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497197 mask!1564))))

(assert (=> b!1114829 (= lt!497197 (array!72462 (store (arr!34877 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35414 _keys!1208)))))

(declare-fun b!1114830 () Bool)

(declare-fun tp_is_empty!27757 () Bool)

(assert (=> b!1114830 (= e!635588 tp_is_empty!27757)))

(declare-fun b!1114831 () Bool)

(assert (=> b!1114831 (= e!635591 tp_is_empty!27757)))

(declare-fun b!1114832 () Bool)

(declare-fun res!743700 () Bool)

(assert (=> b!1114832 (=> (not res!743700) (not e!635589))))

(assert (=> b!1114832 (= res!743700 (arrayNoDuplicates!0 lt!497197 #b00000000000000000000000000000000 Nil!24327))))

(declare-fun res!743702 () Bool)

(assert (=> start!97762 (=> (not res!743702) (not e!635590))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97762 (= res!743702 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35414 _keys!1208))))))

(assert (=> start!97762 e!635590))

(declare-fun array_inv!26874 (array!72461) Bool)

(assert (=> start!97762 (array_inv!26874 _keys!1208)))

(assert (=> start!97762 true))

(declare-fun array_inv!26875 (array!72463) Bool)

(assert (=> start!97762 (and (array_inv!26875 _values!996) e!635592)))

(declare-fun b!1114833 () Bool)

(declare-fun res!743696 () Bool)

(assert (=> b!1114833 (=> (not res!743696) (not e!635590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114833 (= res!743696 (validMask!0 mask!1564))))

(declare-fun b!1114834 () Bool)

(declare-fun res!743697 () Bool)

(assert (=> b!1114834 (=> (not res!743697) (not e!635590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114834 (= res!743697 (validKeyInArray!0 k0!934))))

(assert (= (and start!97762 res!743702) b!1114833))

(assert (= (and b!1114833 res!743696) b!1114826))

(assert (= (and b!1114826 res!743695) b!1114823))

(assert (= (and b!1114823 res!743703) b!1114822))

(assert (= (and b!1114822 res!743701) b!1114825))

(assert (= (and b!1114825 res!743699) b!1114834))

(assert (= (and b!1114834 res!743697) b!1114828))

(assert (= (and b!1114828 res!743704) b!1114829))

(assert (= (and b!1114829 res!743698) b!1114832))

(assert (= (and b!1114832 res!743700) b!1114827))

(assert (= (and b!1114824 condMapEmpty!43453) mapIsEmpty!43453))

(assert (= (and b!1114824 (not condMapEmpty!43453)) mapNonEmpty!43453))

(get-info :version)

(assert (= (and mapNonEmpty!43453 ((_ is ValueCellFull!13169) mapValue!43453)) b!1114831))

(assert (= (and b!1114824 ((_ is ValueCellFull!13169) mapDefault!43453)) b!1114830))

(assert (= start!97762 b!1114824))

(declare-fun m!1032357 () Bool)

(assert (=> b!1114829 m!1032357))

(declare-fun m!1032359 () Bool)

(assert (=> b!1114829 m!1032359))

(declare-fun m!1032361 () Bool)

(assert (=> b!1114833 m!1032361))

(declare-fun m!1032363 () Bool)

(assert (=> b!1114822 m!1032363))

(declare-fun m!1032365 () Bool)

(assert (=> mapNonEmpty!43453 m!1032365))

(declare-fun m!1032367 () Bool)

(assert (=> start!97762 m!1032367))

(declare-fun m!1032369 () Bool)

(assert (=> start!97762 m!1032369))

(declare-fun m!1032371 () Bool)

(assert (=> b!1114827 m!1032371))

(declare-fun m!1032373 () Bool)

(assert (=> b!1114827 m!1032373))

(declare-fun m!1032375 () Bool)

(assert (=> b!1114823 m!1032375))

(declare-fun m!1032377 () Bool)

(assert (=> b!1114834 m!1032377))

(declare-fun m!1032379 () Bool)

(assert (=> b!1114832 m!1032379))

(declare-fun m!1032381 () Bool)

(assert (=> b!1114828 m!1032381))

(check-sat (not mapNonEmpty!43453) tp_is_empty!27757 (not b!1114823) (not b!1114832) (not start!97762) (not b!1114834) (not b!1114829) (not b!1114822) (not b!1114833) (not b!1114827))
(check-sat)
