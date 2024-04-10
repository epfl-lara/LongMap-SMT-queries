; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77570 () Bool)

(assert start!77570)

(declare-fun b_free!16155 () Bool)

(declare-fun b_next!16155 () Bool)

(assert (=> start!77570 (= b_free!16155 (not b_next!16155))))

(declare-fun tp!56726 () Bool)

(declare-fun b_and!26521 () Bool)

(assert (=> start!77570 (= tp!56726 b_and!26521)))

(declare-fun b!903831 () Bool)

(declare-fun res!609795 () Bool)

(declare-fun e!506439 () Bool)

(assert (=> b!903831 (=> (not res!609795) (not e!506439))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!903831 (= res!609795 (inRange!0 i!717 mask!1756))))

(declare-fun b!903832 () Bool)

(declare-fun e!506440 () Bool)

(declare-fun tp_is_empty!18573 () Bool)

(assert (=> b!903832 (= e!506440 tp_is_empty!18573)))

(declare-fun b!903833 () Bool)

(declare-fun res!609802 () Bool)

(assert (=> b!903833 (=> (not res!609802) (not e!506439))))

(declare-datatypes ((array!53198 0))(
  ( (array!53199 (arr!25558 (Array (_ BitVec 32) (_ BitVec 64))) (size!26017 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53198)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!903833 (= res!609802 (and (= (select (arr!25558 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!903834 () Bool)

(declare-fun e!506445 () Bool)

(assert (=> b!903834 (= e!506439 (not e!506445))))

(declare-fun res!609798 () Bool)

(assert (=> b!903834 (=> res!609798 e!506445)))

(assert (=> b!903834 (= res!609798 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26017 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903834 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!29729 0))(
  ( (V!29730 (val!9337 Int)) )
))
(declare-datatypes ((ValueCell!8805 0))(
  ( (ValueCellFull!8805 (v!11842 V!29729)) (EmptyCell!8805) )
))
(declare-datatypes ((array!53200 0))(
  ( (array!53201 (arr!25559 (Array (_ BitVec 32) ValueCell!8805)) (size!26018 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53200)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29729)

(declare-datatypes ((Unit!30654 0))(
  ( (Unit!30655) )
))
(declare-fun lt!408082 () Unit!30654)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29729)

(declare-fun lemmaKeyInListMapIsInArray!170 (array!53198 array!53200 (_ BitVec 32) (_ BitVec 32) V!29729 V!29729 (_ BitVec 64) Int) Unit!30654)

(assert (=> b!903834 (= lt!408082 (lemmaKeyInListMapIsInArray!170 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!903835 () Bool)

(declare-fun res!609801 () Bool)

(assert (=> b!903835 (=> (not res!609801) (not e!506439))))

(declare-datatypes ((List!17947 0))(
  ( (Nil!17944) (Cons!17943 (h!19089 (_ BitVec 64)) (t!25330 List!17947)) )
))
(declare-fun arrayNoDuplicates!0 (array!53198 (_ BitVec 32) List!17947) Bool)

(assert (=> b!903835 (= res!609801 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17944))))

(declare-fun b!903836 () Bool)

(declare-fun res!609800 () Bool)

(assert (=> b!903836 (=> (not res!609800) (not e!506439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53198 (_ BitVec 32)) Bool)

(assert (=> b!903836 (= res!609800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903838 () Bool)

(declare-fun res!609799 () Bool)

(assert (=> b!903838 (=> (not res!609799) (not e!506439))))

(declare-datatypes ((tuple2!12128 0))(
  ( (tuple2!12129 (_1!6075 (_ BitVec 64)) (_2!6075 V!29729)) )
))
(declare-datatypes ((List!17948 0))(
  ( (Nil!17945) (Cons!17944 (h!19090 tuple2!12128) (t!25331 List!17948)) )
))
(declare-datatypes ((ListLongMap!10825 0))(
  ( (ListLongMap!10826 (toList!5428 List!17948)) )
))
(declare-fun contains!4476 (ListLongMap!10825 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2697 (array!53198 array!53200 (_ BitVec 32) (_ BitVec 32) V!29729 V!29729 (_ BitVec 32) Int) ListLongMap!10825)

(assert (=> b!903838 (= res!609799 (contains!4476 (getCurrentListMap!2697 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903839 () Bool)

(declare-fun e!506441 () Bool)

(declare-fun mapRes!29572 () Bool)

(assert (=> b!903839 (= e!506441 (and e!506440 mapRes!29572))))

(declare-fun condMapEmpty!29572 () Bool)

(declare-fun mapDefault!29572 () ValueCell!8805)

(assert (=> b!903839 (= condMapEmpty!29572 (= (arr!25559 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8805)) mapDefault!29572)))))

(declare-fun b!903840 () Bool)

(declare-fun res!609803 () Bool)

(assert (=> b!903840 (=> (not res!609803) (not e!506439))))

(assert (=> b!903840 (= res!609803 (and (= (size!26018 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26017 _keys!1386) (size!26018 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609796 () Bool)

(assert (=> start!77570 (=> (not res!609796) (not e!506439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77570 (= res!609796 (validMask!0 mask!1756))))

(assert (=> start!77570 e!506439))

(declare-fun array_inv!20026 (array!53200) Bool)

(assert (=> start!77570 (and (array_inv!20026 _values!1152) e!506441)))

(assert (=> start!77570 tp!56726))

(assert (=> start!77570 true))

(assert (=> start!77570 tp_is_empty!18573))

(declare-fun array_inv!20027 (array!53198) Bool)

(assert (=> start!77570 (array_inv!20027 _keys!1386)))

(declare-fun b!903837 () Bool)

(declare-fun e!506444 () Bool)

(assert (=> b!903837 (= e!506445 e!506444)))

(declare-fun res!609797 () Bool)

(assert (=> b!903837 (=> res!609797 e!506444)))

(declare-fun lt!408083 () ListLongMap!10825)

(assert (=> b!903837 (= res!609797 (not (contains!4476 lt!408083 k0!1033)))))

(assert (=> b!903837 (= lt!408083 (getCurrentListMap!2697 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29572 () Bool)

(declare-fun tp!56727 () Bool)

(declare-fun e!506442 () Bool)

(assert (=> mapNonEmpty!29572 (= mapRes!29572 (and tp!56727 e!506442))))

(declare-fun mapValue!29572 () ValueCell!8805)

(declare-fun mapRest!29572 () (Array (_ BitVec 32) ValueCell!8805))

(declare-fun mapKey!29572 () (_ BitVec 32))

(assert (=> mapNonEmpty!29572 (= (arr!25559 _values!1152) (store mapRest!29572 mapKey!29572 mapValue!29572))))

(declare-fun mapIsEmpty!29572 () Bool)

(assert (=> mapIsEmpty!29572 mapRes!29572))

(declare-fun b!903841 () Bool)

(assert (=> b!903841 (= e!506442 tp_is_empty!18573)))

(declare-fun b!903842 () Bool)

(assert (=> b!903842 (= e!506444 true)))

(declare-fun lt!408084 () V!29729)

(declare-fun apply!426 (ListLongMap!10825 (_ BitVec 64)) V!29729)

(assert (=> b!903842 (= lt!408084 (apply!426 lt!408083 k0!1033))))

(assert (= (and start!77570 res!609796) b!903840))

(assert (= (and b!903840 res!609803) b!903836))

(assert (= (and b!903836 res!609800) b!903835))

(assert (= (and b!903835 res!609801) b!903838))

(assert (= (and b!903838 res!609799) b!903831))

(assert (= (and b!903831 res!609795) b!903833))

(assert (= (and b!903833 res!609802) b!903834))

(assert (= (and b!903834 (not res!609798)) b!903837))

(assert (= (and b!903837 (not res!609797)) b!903842))

(assert (= (and b!903839 condMapEmpty!29572) mapIsEmpty!29572))

(assert (= (and b!903839 (not condMapEmpty!29572)) mapNonEmpty!29572))

(get-info :version)

(assert (= (and mapNonEmpty!29572 ((_ is ValueCellFull!8805) mapValue!29572)) b!903841))

(assert (= (and b!903839 ((_ is ValueCellFull!8805) mapDefault!29572)) b!903832))

(assert (= start!77570 b!903839))

(declare-fun m!839425 () Bool)

(assert (=> b!903833 m!839425))

(declare-fun m!839427 () Bool)

(assert (=> b!903831 m!839427))

(declare-fun m!839429 () Bool)

(assert (=> b!903842 m!839429))

(declare-fun m!839431 () Bool)

(assert (=> mapNonEmpty!29572 m!839431))

(declare-fun m!839433 () Bool)

(assert (=> b!903838 m!839433))

(assert (=> b!903838 m!839433))

(declare-fun m!839435 () Bool)

(assert (=> b!903838 m!839435))

(declare-fun m!839437 () Bool)

(assert (=> b!903835 m!839437))

(declare-fun m!839439 () Bool)

(assert (=> b!903837 m!839439))

(declare-fun m!839441 () Bool)

(assert (=> b!903837 m!839441))

(declare-fun m!839443 () Bool)

(assert (=> b!903836 m!839443))

(declare-fun m!839445 () Bool)

(assert (=> b!903834 m!839445))

(declare-fun m!839447 () Bool)

(assert (=> b!903834 m!839447))

(declare-fun m!839449 () Bool)

(assert (=> start!77570 m!839449))

(declare-fun m!839451 () Bool)

(assert (=> start!77570 m!839451))

(declare-fun m!839453 () Bool)

(assert (=> start!77570 m!839453))

(check-sat (not mapNonEmpty!29572) b_and!26521 (not start!77570) (not b!903834) tp_is_empty!18573 (not b!903842) (not b!903838) (not b!903831) (not b!903835) (not b!903837) (not b_next!16155) (not b!903836))
(check-sat b_and!26521 (not b_next!16155))
