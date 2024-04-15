; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3908 () Bool)

(assert start!3908)

(declare-fun b_free!823 () Bool)

(declare-fun b_next!823 () Bool)

(assert (=> start!3908 (= b_free!823 (not b_next!823))))

(declare-fun tp!3889 () Bool)

(declare-fun b_and!1627 () Bool)

(assert (=> start!3908 (= tp!3889 b_and!1627)))

(declare-fun b!27672 () Bool)

(declare-fun e!17977 () Bool)

(declare-fun tp_is_empty!1177 () Bool)

(assert (=> b!27672 (= e!17977 tp_is_empty!1177)))

(declare-fun mapIsEmpty!1294 () Bool)

(declare-fun mapRes!1294 () Bool)

(assert (=> mapIsEmpty!1294 mapRes!1294))

(declare-fun b!27673 () Bool)

(declare-fun e!17976 () Bool)

(assert (=> b!27673 (= e!17976 (and e!17977 mapRes!1294))))

(declare-fun condMapEmpty!1294 () Bool)

(declare-datatypes ((V!1395 0))(
  ( (V!1396 (val!615 Int)) )
))
(declare-datatypes ((ValueCell!389 0))(
  ( (ValueCellFull!389 (v!1703 V!1395)) (EmptyCell!389) )
))
(declare-datatypes ((array!1569 0))(
  ( (array!1570 (arr!738 (Array (_ BitVec 32) ValueCell!389)) (size!839 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1569)

(declare-fun mapDefault!1294 () ValueCell!389)

(assert (=> b!27673 (= condMapEmpty!1294 (= (arr!738 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!389)) mapDefault!1294)))))

(declare-fun b!27674 () Bool)

(declare-fun e!17979 () Bool)

(assert (=> b!27674 (= e!17979 false)))

(declare-fun lt!10705 () (_ BitVec 32))

(declare-datatypes ((array!1571 0))(
  ( (array!1572 (arr!739 (Array (_ BitVec 32) (_ BitVec 64))) (size!840 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1571)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1571 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27674 (= lt!10705 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27675 () Bool)

(declare-fun res!16413 () Bool)

(assert (=> b!27675 (=> (not res!16413) (not e!17979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27675 (= res!16413 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1294 () Bool)

(declare-fun tp!3888 () Bool)

(declare-fun e!17978 () Bool)

(assert (=> mapNonEmpty!1294 (= mapRes!1294 (and tp!3888 e!17978))))

(declare-fun mapKey!1294 () (_ BitVec 32))

(declare-fun mapValue!1294 () ValueCell!389)

(declare-fun mapRest!1294 () (Array (_ BitVec 32) ValueCell!389))

(assert (=> mapNonEmpty!1294 (= (arr!738 _values!1501) (store mapRest!1294 mapKey!1294 mapValue!1294))))

(declare-fun res!16408 () Bool)

(assert (=> start!3908 (=> (not res!16408) (not e!17979))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3908 (= res!16408 (validMask!0 mask!2294))))

(assert (=> start!3908 e!17979))

(assert (=> start!3908 true))

(assert (=> start!3908 tp!3889))

(declare-fun array_inv!525 (array!1569) Bool)

(assert (=> start!3908 (and (array_inv!525 _values!1501) e!17976)))

(declare-fun array_inv!526 (array!1571) Bool)

(assert (=> start!3908 (array_inv!526 _keys!1833)))

(assert (=> start!3908 tp_is_empty!1177))

(declare-fun b!27676 () Bool)

(declare-fun res!16410 () Bool)

(assert (=> b!27676 (=> (not res!16410) (not e!17979))))

(declare-datatypes ((List!627 0))(
  ( (Nil!624) (Cons!623 (h!1190 (_ BitVec 64)) (t!3313 List!627)) )
))
(declare-fun arrayNoDuplicates!0 (array!1571 (_ BitVec 32) List!627) Bool)

(assert (=> b!27676 (= res!16410 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!624))))

(declare-fun b!27677 () Bool)

(assert (=> b!27677 (= e!17978 tp_is_empty!1177)))

(declare-fun b!27678 () Bool)

(declare-fun res!16409 () Bool)

(assert (=> b!27678 (=> (not res!16409) (not e!17979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1571 (_ BitVec 32)) Bool)

(assert (=> b!27678 (= res!16409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27679 () Bool)

(declare-fun res!16414 () Bool)

(assert (=> b!27679 (=> (not res!16414) (not e!17979))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1395)

(declare-fun minValue!1443 () V!1395)

(declare-datatypes ((tuple2!1042 0))(
  ( (tuple2!1043 (_1!532 (_ BitVec 64)) (_2!532 V!1395)) )
))
(declare-datatypes ((List!628 0))(
  ( (Nil!625) (Cons!624 (h!1191 tuple2!1042) (t!3314 List!628)) )
))
(declare-datatypes ((ListLongMap!607 0))(
  ( (ListLongMap!608 (toList!319 List!628)) )
))
(declare-fun contains!260 (ListLongMap!607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!149 (array!1571 array!1569 (_ BitVec 32) (_ BitVec 32) V!1395 V!1395 (_ BitVec 32) Int) ListLongMap!607)

(assert (=> b!27679 (= res!16414 (not (contains!260 (getCurrentListMap!149 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27680 () Bool)

(declare-fun res!16412 () Bool)

(assert (=> b!27680 (=> (not res!16412) (not e!17979))))

(assert (=> b!27680 (= res!16412 (and (= (size!839 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!840 _keys!1833) (size!839 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27681 () Bool)

(declare-fun res!16411 () Bool)

(assert (=> b!27681 (=> (not res!16411) (not e!17979))))

(declare-fun arrayContainsKey!0 (array!1571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27681 (= res!16411 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3908 res!16408) b!27680))

(assert (= (and b!27680 res!16412) b!27678))

(assert (= (and b!27678 res!16409) b!27676))

(assert (= (and b!27676 res!16410) b!27675))

(assert (= (and b!27675 res!16413) b!27679))

(assert (= (and b!27679 res!16414) b!27681))

(assert (= (and b!27681 res!16411) b!27674))

(assert (= (and b!27673 condMapEmpty!1294) mapIsEmpty!1294))

(assert (= (and b!27673 (not condMapEmpty!1294)) mapNonEmpty!1294))

(get-info :version)

(assert (= (and mapNonEmpty!1294 ((_ is ValueCellFull!389) mapValue!1294)) b!27677))

(assert (= (and b!27673 ((_ is ValueCellFull!389) mapDefault!1294)) b!27672))

(assert (= start!3908 b!27673))

(declare-fun m!22035 () Bool)

(assert (=> b!27674 m!22035))

(declare-fun m!22037 () Bool)

(assert (=> mapNonEmpty!1294 m!22037))

(declare-fun m!22039 () Bool)

(assert (=> b!27675 m!22039))

(declare-fun m!22041 () Bool)

(assert (=> b!27679 m!22041))

(assert (=> b!27679 m!22041))

(declare-fun m!22043 () Bool)

(assert (=> b!27679 m!22043))

(declare-fun m!22045 () Bool)

(assert (=> start!3908 m!22045))

(declare-fun m!22047 () Bool)

(assert (=> start!3908 m!22047))

(declare-fun m!22049 () Bool)

(assert (=> start!3908 m!22049))

(declare-fun m!22051 () Bool)

(assert (=> b!27676 m!22051))

(declare-fun m!22053 () Bool)

(assert (=> b!27678 m!22053))

(declare-fun m!22055 () Bool)

(assert (=> b!27681 m!22055))

(check-sat (not b!27674) (not start!3908) (not b!27675) (not b!27679) b_and!1627 tp_is_empty!1177 (not b!27681) (not b_next!823) (not b!27678) (not b!27676) (not mapNonEmpty!1294))
(check-sat b_and!1627 (not b_next!823))
