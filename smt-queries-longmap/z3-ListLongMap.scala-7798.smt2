; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97534 () Bool)

(assert start!97534)

(declare-fun b!1113651 () Bool)

(declare-fun res!743301 () Bool)

(declare-fun e!634806 () Bool)

(assert (=> b!1113651 (=> (not res!743301) (not e!634806))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72437 0))(
  ( (array!72438 (arr!34871 (Array (_ BitVec 32) (_ BitVec 64))) (size!35407 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72437)

(assert (=> b!1113651 (= res!743301 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35407 _keys!1208))))))

(declare-fun b!1113652 () Bool)

(declare-fun e!634805 () Bool)

(assert (=> b!1113652 (= e!634805 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113652 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36546 0))(
  ( (Unit!36547) )
))
(declare-fun lt!496705 () Unit!36546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72437 (_ BitVec 64) (_ BitVec 32)) Unit!36546)

(assert (=> b!1113652 (= lt!496705 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113653 () Bool)

(declare-fun e!634804 () Bool)

(declare-fun e!634807 () Bool)

(declare-fun mapRes!43465 () Bool)

(assert (=> b!1113653 (= e!634804 (and e!634807 mapRes!43465))))

(declare-fun condMapEmpty!43465 () Bool)

(declare-datatypes ((V!42147 0))(
  ( (V!42148 (val!13939 Int)) )
))
(declare-datatypes ((ValueCell!13173 0))(
  ( (ValueCellFull!13173 (v!16572 V!42147)) (EmptyCell!13173) )
))
(declare-datatypes ((array!72439 0))(
  ( (array!72440 (arr!34872 (Array (_ BitVec 32) ValueCell!13173)) (size!35408 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72439)

(declare-fun mapDefault!43465 () ValueCell!13173)

(assert (=> b!1113653 (= condMapEmpty!43465 (= (arr!34872 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13173)) mapDefault!43465)))))

(declare-fun b!1113654 () Bool)

(declare-fun res!743297 () Bool)

(assert (=> b!1113654 (=> (not res!743297) (not e!634806))))

(assert (=> b!1113654 (= res!743297 (= (select (arr!34871 _keys!1208) i!673) k0!934))))

(declare-fun b!1113655 () Bool)

(declare-fun res!743296 () Bool)

(assert (=> b!1113655 (=> (not res!743296) (not e!634806))))

(declare-datatypes ((List!24313 0))(
  ( (Nil!24310) (Cons!24309 (h!25518 (_ BitVec 64)) (t!34794 List!24313)) )
))
(declare-fun arrayNoDuplicates!0 (array!72437 (_ BitVec 32) List!24313) Bool)

(assert (=> b!1113655 (= res!743296 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24310))))

(declare-fun b!1113656 () Bool)

(declare-fun res!743294 () Bool)

(assert (=> b!1113656 (=> (not res!743294) (not e!634806))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113656 (= res!743294 (validMask!0 mask!1564))))

(declare-fun b!1113657 () Bool)

(declare-fun tp_is_empty!27765 () Bool)

(assert (=> b!1113657 (= e!634807 tp_is_empty!27765)))

(declare-fun b!1113658 () Bool)

(declare-fun res!743299 () Bool)

(assert (=> b!1113658 (=> (not res!743299) (not e!634806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72437 (_ BitVec 32)) Bool)

(assert (=> b!1113658 (= res!743299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1113659 () Bool)

(assert (=> b!1113659 (= e!634806 e!634805)))

(declare-fun res!743300 () Bool)

(assert (=> b!1113659 (=> (not res!743300) (not e!634805))))

(declare-fun lt!496706 () array!72437)

(assert (=> b!1113659 (= res!743300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496706 mask!1564))))

(assert (=> b!1113659 (= lt!496706 (array!72438 (store (arr!34871 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35407 _keys!1208)))))

(declare-fun mapIsEmpty!43465 () Bool)

(assert (=> mapIsEmpty!43465 mapRes!43465))

(declare-fun res!743295 () Bool)

(assert (=> start!97534 (=> (not res!743295) (not e!634806))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97534 (= res!743295 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35407 _keys!1208))))))

(assert (=> start!97534 e!634806))

(declare-fun array_inv!26806 (array!72437) Bool)

(assert (=> start!97534 (array_inv!26806 _keys!1208)))

(assert (=> start!97534 true))

(declare-fun array_inv!26807 (array!72439) Bool)

(assert (=> start!97534 (and (array_inv!26807 _values!996) e!634804)))

(declare-fun b!1113660 () Bool)

(declare-fun e!634809 () Bool)

(assert (=> b!1113660 (= e!634809 tp_is_empty!27765)))

(declare-fun b!1113661 () Bool)

(declare-fun res!743293 () Bool)

(assert (=> b!1113661 (=> (not res!743293) (not e!634805))))

(assert (=> b!1113661 (= res!743293 (arrayNoDuplicates!0 lt!496706 #b00000000000000000000000000000000 Nil!24310))))

(declare-fun b!1113662 () Bool)

(declare-fun res!743302 () Bool)

(assert (=> b!1113662 (=> (not res!743302) (not e!634806))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113662 (= res!743302 (and (= (size!35408 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35407 _keys!1208) (size!35408 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113663 () Bool)

(declare-fun res!743298 () Bool)

(assert (=> b!1113663 (=> (not res!743298) (not e!634806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113663 (= res!743298 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43465 () Bool)

(declare-fun tp!82709 () Bool)

(assert (=> mapNonEmpty!43465 (= mapRes!43465 (and tp!82709 e!634809))))

(declare-fun mapKey!43465 () (_ BitVec 32))

(declare-fun mapValue!43465 () ValueCell!13173)

(declare-fun mapRest!43465 () (Array (_ BitVec 32) ValueCell!13173))

(assert (=> mapNonEmpty!43465 (= (arr!34872 _values!996) (store mapRest!43465 mapKey!43465 mapValue!43465))))

(assert (= (and start!97534 res!743295) b!1113656))

(assert (= (and b!1113656 res!743294) b!1113662))

(assert (= (and b!1113662 res!743302) b!1113658))

(assert (= (and b!1113658 res!743299) b!1113655))

(assert (= (and b!1113655 res!743296) b!1113651))

(assert (= (and b!1113651 res!743301) b!1113663))

(assert (= (and b!1113663 res!743298) b!1113654))

(assert (= (and b!1113654 res!743297) b!1113659))

(assert (= (and b!1113659 res!743300) b!1113661))

(assert (= (and b!1113661 res!743293) b!1113652))

(assert (= (and b!1113653 condMapEmpty!43465) mapIsEmpty!43465))

(assert (= (and b!1113653 (not condMapEmpty!43465)) mapNonEmpty!43465))

(get-info :version)

(assert (= (and mapNonEmpty!43465 ((_ is ValueCellFull!13173) mapValue!43465)) b!1113660))

(assert (= (and b!1113653 ((_ is ValueCellFull!13173) mapDefault!43465)) b!1113657))

(assert (= start!97534 b!1113653))

(declare-fun m!1030789 () Bool)

(assert (=> b!1113655 m!1030789))

(declare-fun m!1030791 () Bool)

(assert (=> start!97534 m!1030791))

(declare-fun m!1030793 () Bool)

(assert (=> start!97534 m!1030793))

(declare-fun m!1030795 () Bool)

(assert (=> b!1113663 m!1030795))

(declare-fun m!1030797 () Bool)

(assert (=> b!1113652 m!1030797))

(declare-fun m!1030799 () Bool)

(assert (=> b!1113652 m!1030799))

(declare-fun m!1030801 () Bool)

(assert (=> b!1113659 m!1030801))

(declare-fun m!1030803 () Bool)

(assert (=> b!1113659 m!1030803))

(declare-fun m!1030805 () Bool)

(assert (=> b!1113661 m!1030805))

(declare-fun m!1030807 () Bool)

(assert (=> b!1113658 m!1030807))

(declare-fun m!1030809 () Bool)

(assert (=> mapNonEmpty!43465 m!1030809))

(declare-fun m!1030811 () Bool)

(assert (=> b!1113654 m!1030811))

(declare-fun m!1030813 () Bool)

(assert (=> b!1113656 m!1030813))

(check-sat (not b!1113655) (not b!1113658) (not b!1113663) (not b!1113659) (not b!1113652) (not start!97534) (not b!1113661) tp_is_empty!27765 (not mapNonEmpty!43465) (not b!1113656))
(check-sat)
