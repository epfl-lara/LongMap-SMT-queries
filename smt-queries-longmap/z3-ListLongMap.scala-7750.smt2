; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97246 () Bool)

(assert start!97246)

(declare-fun b!1106811 () Bool)

(declare-fun e!631547 () Bool)

(assert (=> b!1106811 (= e!631547 (not true))))

(declare-datatypes ((array!71871 0))(
  ( (array!71872 (arr!34588 (Array (_ BitVec 32) (_ BitVec 64))) (size!35124 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71871)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106811 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36322 0))(
  ( (Unit!36323) )
))
(declare-fun lt!495518 () Unit!36322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71871 (_ BitVec 64) (_ BitVec 32)) Unit!36322)

(assert (=> b!1106811 (= lt!495518 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106812 () Bool)

(declare-fun e!631549 () Bool)

(assert (=> b!1106812 (= e!631549 e!631547)))

(declare-fun res!738649 () Bool)

(assert (=> b!1106812 (=> (not res!738649) (not e!631547))))

(declare-fun lt!495517 () array!71871)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71871 (_ BitVec 32)) Bool)

(assert (=> b!1106812 (= res!738649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495517 mask!1564))))

(assert (=> b!1106812 (= lt!495517 (array!71872 (store (arr!34588 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35124 _keys!1208)))))

(declare-fun b!1106813 () Bool)

(declare-fun res!738658 () Bool)

(assert (=> b!1106813 (=> (not res!738658) (not e!631549))))

(declare-datatypes ((V!41763 0))(
  ( (V!41764 (val!13795 Int)) )
))
(declare-datatypes ((ValueCell!13029 0))(
  ( (ValueCellFull!13029 (v!16428 V!41763)) (EmptyCell!13029) )
))
(declare-datatypes ((array!71873 0))(
  ( (array!71874 (arr!34589 (Array (_ BitVec 32) ValueCell!13029)) (size!35125 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71873)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106813 (= res!738658 (and (= (size!35125 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35124 _keys!1208) (size!35125 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1106814 () Bool)

(declare-fun res!738654 () Bool)

(assert (=> b!1106814 (=> (not res!738654) (not e!631547))))

(declare-datatypes ((List!24104 0))(
  ( (Nil!24101) (Cons!24100 (h!25309 (_ BitVec 64)) (t!34369 List!24104)) )
))
(declare-fun arrayNoDuplicates!0 (array!71871 (_ BitVec 32) List!24104) Bool)

(assert (=> b!1106814 (= res!738654 (arrayNoDuplicates!0 lt!495517 #b00000000000000000000000000000000 Nil!24101))))

(declare-fun b!1106815 () Bool)

(declare-fun res!738652 () Bool)

(assert (=> b!1106815 (=> (not res!738652) (not e!631549))))

(assert (=> b!1106815 (= res!738652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106816 () Bool)

(declare-fun e!631551 () Bool)

(declare-fun tp_is_empty!27477 () Bool)

(assert (=> b!1106816 (= e!631551 tp_is_empty!27477)))

(declare-fun b!1106817 () Bool)

(declare-fun res!738656 () Bool)

(assert (=> b!1106817 (=> (not res!738656) (not e!631549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106817 (= res!738656 (validKeyInArray!0 k0!934))))

(declare-fun res!738657 () Bool)

(assert (=> start!97246 (=> (not res!738657) (not e!631549))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97246 (= res!738657 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35124 _keys!1208))))))

(assert (=> start!97246 e!631549))

(declare-fun array_inv!26616 (array!71871) Bool)

(assert (=> start!97246 (array_inv!26616 _keys!1208)))

(assert (=> start!97246 true))

(declare-fun e!631546 () Bool)

(declare-fun array_inv!26617 (array!71873) Bool)

(assert (=> start!97246 (and (array_inv!26617 _values!996) e!631546)))

(declare-fun b!1106818 () Bool)

(declare-fun res!738653 () Bool)

(assert (=> b!1106818 (=> (not res!738653) (not e!631549))))

(assert (=> b!1106818 (= res!738653 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35124 _keys!1208))))))

(declare-fun b!1106819 () Bool)

(declare-fun res!738650 () Bool)

(assert (=> b!1106819 (=> (not res!738650) (not e!631549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106819 (= res!738650 (validMask!0 mask!1564))))

(declare-fun b!1106820 () Bool)

(declare-fun e!631548 () Bool)

(assert (=> b!1106820 (= e!631548 tp_is_empty!27477)))

(declare-fun b!1106821 () Bool)

(declare-fun mapRes!43033 () Bool)

(assert (=> b!1106821 (= e!631546 (and e!631551 mapRes!43033))))

(declare-fun condMapEmpty!43033 () Bool)

(declare-fun mapDefault!43033 () ValueCell!13029)

(assert (=> b!1106821 (= condMapEmpty!43033 (= (arr!34589 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13029)) mapDefault!43033)))))

(declare-fun mapNonEmpty!43033 () Bool)

(declare-fun tp!81953 () Bool)

(assert (=> mapNonEmpty!43033 (= mapRes!43033 (and tp!81953 e!631548))))

(declare-fun mapKey!43033 () (_ BitVec 32))

(declare-fun mapValue!43033 () ValueCell!13029)

(declare-fun mapRest!43033 () (Array (_ BitVec 32) ValueCell!13029))

(assert (=> mapNonEmpty!43033 (= (arr!34589 _values!996) (store mapRest!43033 mapKey!43033 mapValue!43033))))

(declare-fun b!1106822 () Bool)

(declare-fun res!738655 () Bool)

(assert (=> b!1106822 (=> (not res!738655) (not e!631549))))

(assert (=> b!1106822 (= res!738655 (= (select (arr!34588 _keys!1208) i!673) k0!934))))

(declare-fun b!1106823 () Bool)

(declare-fun res!738651 () Bool)

(assert (=> b!1106823 (=> (not res!738651) (not e!631549))))

(assert (=> b!1106823 (= res!738651 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24101))))

(declare-fun mapIsEmpty!43033 () Bool)

(assert (=> mapIsEmpty!43033 mapRes!43033))

(assert (= (and start!97246 res!738657) b!1106819))

(assert (= (and b!1106819 res!738650) b!1106813))

(assert (= (and b!1106813 res!738658) b!1106815))

(assert (= (and b!1106815 res!738652) b!1106823))

(assert (= (and b!1106823 res!738651) b!1106818))

(assert (= (and b!1106818 res!738653) b!1106817))

(assert (= (and b!1106817 res!738656) b!1106822))

(assert (= (and b!1106822 res!738655) b!1106812))

(assert (= (and b!1106812 res!738649) b!1106814))

(assert (= (and b!1106814 res!738654) b!1106811))

(assert (= (and b!1106821 condMapEmpty!43033) mapIsEmpty!43033))

(assert (= (and b!1106821 (not condMapEmpty!43033)) mapNonEmpty!43033))

(get-info :version)

(assert (= (and mapNonEmpty!43033 ((_ is ValueCellFull!13029) mapValue!43033)) b!1106820))

(assert (= (and b!1106821 ((_ is ValueCellFull!13029) mapDefault!43033)) b!1106816))

(assert (= start!97246 b!1106821))

(declare-fun m!1025749 () Bool)

(assert (=> b!1106819 m!1025749))

(declare-fun m!1025751 () Bool)

(assert (=> mapNonEmpty!43033 m!1025751))

(declare-fun m!1025753 () Bool)

(assert (=> b!1106814 m!1025753))

(declare-fun m!1025755 () Bool)

(assert (=> b!1106811 m!1025755))

(declare-fun m!1025757 () Bool)

(assert (=> b!1106811 m!1025757))

(declare-fun m!1025759 () Bool)

(assert (=> start!97246 m!1025759))

(declare-fun m!1025761 () Bool)

(assert (=> start!97246 m!1025761))

(declare-fun m!1025763 () Bool)

(assert (=> b!1106823 m!1025763))

(declare-fun m!1025765 () Bool)

(assert (=> b!1106817 m!1025765))

(declare-fun m!1025767 () Bool)

(assert (=> b!1106822 m!1025767))

(declare-fun m!1025769 () Bool)

(assert (=> b!1106815 m!1025769))

(declare-fun m!1025771 () Bool)

(assert (=> b!1106812 m!1025771))

(declare-fun m!1025773 () Bool)

(assert (=> b!1106812 m!1025773))

(check-sat (not b!1106823) (not b!1106812) (not start!97246) (not mapNonEmpty!43033) (not b!1106815) (not b!1106814) (not b!1106819) (not b!1106817) tp_is_empty!27477 (not b!1106811))
(check-sat)
