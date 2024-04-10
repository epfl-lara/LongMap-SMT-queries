; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97492 () Bool)

(assert start!97492)

(declare-fun b!1112832 () Bool)

(declare-fun res!742671 () Bool)

(declare-fun e!634427 () Bool)

(assert (=> b!1112832 (=> (not res!742671) (not e!634427))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112832 (= res!742671 (validKeyInArray!0 k0!934))))

(declare-fun b!1112833 () Bool)

(declare-fun res!742665 () Bool)

(assert (=> b!1112833 (=> (not res!742665) (not e!634427))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112833 (= res!742665 (validMask!0 mask!1564))))

(declare-fun b!1112834 () Bool)

(declare-fun res!742663 () Bool)

(assert (=> b!1112834 (=> (not res!742663) (not e!634427))))

(declare-datatypes ((array!72357 0))(
  ( (array!72358 (arr!34831 (Array (_ BitVec 32) (_ BitVec 64))) (size!35367 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72357)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72357 (_ BitVec 32)) Bool)

(assert (=> b!1112834 (= res!742663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112836 () Bool)

(declare-fun e!634431 () Bool)

(assert (=> b!1112836 (= e!634431 (not true))))

(declare-fun arrayContainsKey!0 (array!72357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112836 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36518 0))(
  ( (Unit!36519) )
))
(declare-fun lt!496579 () Unit!36518)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72357 (_ BitVec 64) (_ BitVec 32)) Unit!36518)

(assert (=> b!1112836 (= lt!496579 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43402 () Bool)

(declare-fun mapRes!43402 () Bool)

(declare-fun tp!82646 () Bool)

(declare-fun e!634426 () Bool)

(assert (=> mapNonEmpty!43402 (= mapRes!43402 (and tp!82646 e!634426))))

(declare-datatypes ((V!42091 0))(
  ( (V!42092 (val!13918 Int)) )
))
(declare-datatypes ((ValueCell!13152 0))(
  ( (ValueCellFull!13152 (v!16551 V!42091)) (EmptyCell!13152) )
))
(declare-fun mapRest!43402 () (Array (_ BitVec 32) ValueCell!13152))

(declare-fun mapKey!43402 () (_ BitVec 32))

(declare-datatypes ((array!72359 0))(
  ( (array!72360 (arr!34832 (Array (_ BitVec 32) ValueCell!13152)) (size!35368 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72359)

(declare-fun mapValue!43402 () ValueCell!13152)

(assert (=> mapNonEmpty!43402 (= (arr!34832 _values!996) (store mapRest!43402 mapKey!43402 mapValue!43402))))

(declare-fun b!1112837 () Bool)

(assert (=> b!1112837 (= e!634427 e!634431)))

(declare-fun res!742666 () Bool)

(assert (=> b!1112837 (=> (not res!742666) (not e!634431))))

(declare-fun lt!496580 () array!72357)

(assert (=> b!1112837 (= res!742666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496580 mask!1564))))

(assert (=> b!1112837 (= lt!496580 (array!72358 (store (arr!34831 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35367 _keys!1208)))))

(declare-fun b!1112838 () Bool)

(declare-fun res!742664 () Bool)

(assert (=> b!1112838 (=> (not res!742664) (not e!634427))))

(assert (=> b!1112838 (= res!742664 (= (select (arr!34831 _keys!1208) i!673) k0!934))))

(declare-fun b!1112839 () Bool)

(declare-fun res!742667 () Bool)

(assert (=> b!1112839 (=> (not res!742667) (not e!634427))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1112839 (= res!742667 (and (= (size!35368 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35367 _keys!1208) (size!35368 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112840 () Bool)

(declare-fun res!742670 () Bool)

(assert (=> b!1112840 (=> (not res!742670) (not e!634427))))

(declare-datatypes ((List!24299 0))(
  ( (Nil!24296) (Cons!24295 (h!25504 (_ BitVec 64)) (t!34780 List!24299)) )
))
(declare-fun arrayNoDuplicates!0 (array!72357 (_ BitVec 32) List!24299) Bool)

(assert (=> b!1112840 (= res!742670 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24296))))

(declare-fun b!1112841 () Bool)

(declare-fun e!634430 () Bool)

(declare-fun e!634429 () Bool)

(assert (=> b!1112841 (= e!634430 (and e!634429 mapRes!43402))))

(declare-fun condMapEmpty!43402 () Bool)

(declare-fun mapDefault!43402 () ValueCell!13152)

(assert (=> b!1112841 (= condMapEmpty!43402 (= (arr!34832 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13152)) mapDefault!43402)))))

(declare-fun mapIsEmpty!43402 () Bool)

(assert (=> mapIsEmpty!43402 mapRes!43402))

(declare-fun b!1112842 () Bool)

(declare-fun res!742672 () Bool)

(assert (=> b!1112842 (=> (not res!742672) (not e!634427))))

(assert (=> b!1112842 (= res!742672 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35367 _keys!1208))))))

(declare-fun b!1112835 () Bool)

(declare-fun tp_is_empty!27723 () Bool)

(assert (=> b!1112835 (= e!634426 tp_is_empty!27723)))

(declare-fun res!742668 () Bool)

(assert (=> start!97492 (=> (not res!742668) (not e!634427))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97492 (= res!742668 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35367 _keys!1208))))))

(assert (=> start!97492 e!634427))

(declare-fun array_inv!26786 (array!72357) Bool)

(assert (=> start!97492 (array_inv!26786 _keys!1208)))

(assert (=> start!97492 true))

(declare-fun array_inv!26787 (array!72359) Bool)

(assert (=> start!97492 (and (array_inv!26787 _values!996) e!634430)))

(declare-fun b!1112843 () Bool)

(assert (=> b!1112843 (= e!634429 tp_is_empty!27723)))

(declare-fun b!1112844 () Bool)

(declare-fun res!742669 () Bool)

(assert (=> b!1112844 (=> (not res!742669) (not e!634431))))

(assert (=> b!1112844 (= res!742669 (arrayNoDuplicates!0 lt!496580 #b00000000000000000000000000000000 Nil!24296))))

(assert (= (and start!97492 res!742668) b!1112833))

(assert (= (and b!1112833 res!742665) b!1112839))

(assert (= (and b!1112839 res!742667) b!1112834))

(assert (= (and b!1112834 res!742663) b!1112840))

(assert (= (and b!1112840 res!742670) b!1112842))

(assert (= (and b!1112842 res!742672) b!1112832))

(assert (= (and b!1112832 res!742671) b!1112838))

(assert (= (and b!1112838 res!742664) b!1112837))

(assert (= (and b!1112837 res!742666) b!1112844))

(assert (= (and b!1112844 res!742669) b!1112836))

(assert (= (and b!1112841 condMapEmpty!43402) mapIsEmpty!43402))

(assert (= (and b!1112841 (not condMapEmpty!43402)) mapNonEmpty!43402))

(get-info :version)

(assert (= (and mapNonEmpty!43402 ((_ is ValueCellFull!13152) mapValue!43402)) b!1112835))

(assert (= (and b!1112841 ((_ is ValueCellFull!13152) mapDefault!43402)) b!1112843))

(assert (= start!97492 b!1112841))

(declare-fun m!1030243 () Bool)

(assert (=> b!1112832 m!1030243))

(declare-fun m!1030245 () Bool)

(assert (=> b!1112840 m!1030245))

(declare-fun m!1030247 () Bool)

(assert (=> b!1112834 m!1030247))

(declare-fun m!1030249 () Bool)

(assert (=> b!1112844 m!1030249))

(declare-fun m!1030251 () Bool)

(assert (=> b!1112836 m!1030251))

(declare-fun m!1030253 () Bool)

(assert (=> b!1112836 m!1030253))

(declare-fun m!1030255 () Bool)

(assert (=> mapNonEmpty!43402 m!1030255))

(declare-fun m!1030257 () Bool)

(assert (=> start!97492 m!1030257))

(declare-fun m!1030259 () Bool)

(assert (=> start!97492 m!1030259))

(declare-fun m!1030261 () Bool)

(assert (=> b!1112837 m!1030261))

(declare-fun m!1030263 () Bool)

(assert (=> b!1112837 m!1030263))

(declare-fun m!1030265 () Bool)

(assert (=> b!1112833 m!1030265))

(declare-fun m!1030267 () Bool)

(assert (=> b!1112838 m!1030267))

(check-sat (not b!1112834) (not b!1112836) (not b!1112844) tp_is_empty!27723 (not mapNonEmpty!43402) (not b!1112832) (not b!1112837) (not b!1112840) (not start!97492) (not b!1112833))
(check-sat)
