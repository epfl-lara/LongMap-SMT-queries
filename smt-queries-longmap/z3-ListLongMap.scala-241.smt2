; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4118 () Bool)

(assert start!4118)

(declare-fun b_free!1033 () Bool)

(declare-fun b_next!1033 () Bool)

(assert (=> start!4118 (= b_free!1033 (not b_next!1033))))

(declare-fun tp!4518 () Bool)

(declare-fun b_and!1837 () Bool)

(assert (=> start!4118 (= tp!4518 b_and!1837)))

(declare-fun b!30851 () Bool)

(declare-fun res!18644 () Bool)

(declare-fun e!19759 () Bool)

(assert (=> b!30851 (=> (not res!18644) (not e!19759))))

(declare-datatypes ((array!1969 0))(
  ( (array!1970 (arr!938 (Array (_ BitVec 32) (_ BitVec 64))) (size!1039 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1969)

(declare-datatypes ((List!767 0))(
  ( (Nil!764) (Cons!763 (h!1330 (_ BitVec 64)) (t!3453 List!767)) )
))
(declare-fun arrayNoDuplicates!0 (array!1969 (_ BitVec 32) List!767) Bool)

(assert (=> b!30851 (= res!18644 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!764))))

(declare-fun b!30852 () Bool)

(declare-fun e!19758 () Bool)

(declare-fun tp_is_empty!1387 () Bool)

(assert (=> b!30852 (= e!19758 tp_is_empty!1387)))

(declare-fun mapNonEmpty!1609 () Bool)

(declare-fun mapRes!1609 () Bool)

(declare-fun tp!4519 () Bool)

(assert (=> mapNonEmpty!1609 (= mapRes!1609 (and tp!4519 e!19758))))

(declare-datatypes ((V!1675 0))(
  ( (V!1676 (val!720 Int)) )
))
(declare-datatypes ((ValueCell!494 0))(
  ( (ValueCellFull!494 (v!1808 V!1675)) (EmptyCell!494) )
))
(declare-datatypes ((array!1971 0))(
  ( (array!1972 (arr!939 (Array (_ BitVec 32) ValueCell!494)) (size!1040 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1971)

(declare-fun mapKey!1609 () (_ BitVec 32))

(declare-fun mapRest!1609 () (Array (_ BitVec 32) ValueCell!494))

(declare-fun mapValue!1609 () ValueCell!494)

(assert (=> mapNonEmpty!1609 (= (arr!939 _values!1501) (store mapRest!1609 mapKey!1609 mapValue!1609))))

(declare-fun b!30853 () Bool)

(declare-fun res!18642 () Bool)

(declare-fun e!19757 () Bool)

(assert (=> b!30853 (=> (not res!18642) (not e!19757))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30853 (= res!18642 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30854 () Bool)

(assert (=> b!30854 (= e!19759 e!19757)))

(declare-fun res!18649 () Bool)

(assert (=> b!30854 (=> (not res!18649) (not e!19757))))

(declare-datatypes ((tuple2!1184 0))(
  ( (tuple2!1185 (_1!603 (_ BitVec 64)) (_2!603 V!1675)) )
))
(declare-datatypes ((List!768 0))(
  ( (Nil!765) (Cons!764 (h!1331 tuple2!1184) (t!3454 List!768)) )
))
(declare-datatypes ((ListLongMap!749 0))(
  ( (ListLongMap!750 (toList!390 List!768)) )
))
(declare-fun lt!11501 () ListLongMap!749)

(declare-fun contains!331 (ListLongMap!749 (_ BitVec 64)) Bool)

(assert (=> b!30854 (= res!18649 (not (contains!331 lt!11501 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1675)

(declare-fun minValue!1443 () V!1675)

(declare-fun getCurrentListMap!214 (array!1969 array!1971 (_ BitVec 32) (_ BitVec 32) V!1675 V!1675 (_ BitVec 32) Int) ListLongMap!749)

(assert (=> b!30854 (= lt!11501 (getCurrentListMap!214 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1609 () Bool)

(assert (=> mapIsEmpty!1609 mapRes!1609))

(declare-fun b!30855 () Bool)

(declare-fun e!19754 () Bool)

(assert (=> b!30855 (= e!19757 e!19754)))

(declare-fun res!18648 () Bool)

(assert (=> b!30855 (=> (not res!18648) (not e!19754))))

(declare-datatypes ((SeekEntryResult!118 0))(
  ( (MissingZero!118 (index!2594 (_ BitVec 32))) (Found!118 (index!2595 (_ BitVec 32))) (Intermediate!118 (undefined!930 Bool) (index!2596 (_ BitVec 32)) (x!6588 (_ BitVec 32))) (Undefined!118) (MissingVacant!118 (index!2597 (_ BitVec 32))) )
))
(declare-fun lt!11502 () SeekEntryResult!118)

(get-info :version)

(assert (=> b!30855 (= res!18648 ((_ is Found!118) lt!11502))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1969 (_ BitVec 32)) SeekEntryResult!118)

(assert (=> b!30855 (= lt!11502 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30856 () Bool)

(assert (=> b!30856 (= e!19754 (not true))))

(assert (=> b!30856 (contains!331 lt!11501 (select (arr!938 _keys!1833) (index!2595 lt!11502)))))

(declare-datatypes ((Unit!702 0))(
  ( (Unit!703) )
))
(declare-fun lt!11503 () Unit!702)

(declare-fun lemmaValidKeyInArrayIsInListMap!41 (array!1969 array!1971 (_ BitVec 32) (_ BitVec 32) V!1675 V!1675 (_ BitVec 32) Int) Unit!702)

(assert (=> b!30856 (= lt!11503 (lemmaValidKeyInArrayIsInListMap!41 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2595 lt!11502) defaultEntry!1504))))

(declare-fun b!30857 () Bool)

(declare-fun res!18645 () Bool)

(assert (=> b!30857 (=> (not res!18645) (not e!19759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1969 (_ BitVec 32)) Bool)

(assert (=> b!30857 (= res!18645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30858 () Bool)

(declare-fun e!19753 () Bool)

(declare-fun e!19756 () Bool)

(assert (=> b!30858 (= e!19753 (and e!19756 mapRes!1609))))

(declare-fun condMapEmpty!1609 () Bool)

(declare-fun mapDefault!1609 () ValueCell!494)

(assert (=> b!30858 (= condMapEmpty!1609 (= (arr!939 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!494)) mapDefault!1609)))))

(declare-fun b!30859 () Bool)

(declare-fun res!18647 () Bool)

(assert (=> b!30859 (=> (not res!18647) (not e!19759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30859 (= res!18647 (validKeyInArray!0 k0!1304))))

(declare-fun res!18643 () Bool)

(assert (=> start!4118 (=> (not res!18643) (not e!19759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4118 (= res!18643 (validMask!0 mask!2294))))

(assert (=> start!4118 e!19759))

(assert (=> start!4118 true))

(assert (=> start!4118 tp!4518))

(declare-fun array_inv!655 (array!1971) Bool)

(assert (=> start!4118 (and (array_inv!655 _values!1501) e!19753)))

(declare-fun array_inv!656 (array!1969) Bool)

(assert (=> start!4118 (array_inv!656 _keys!1833)))

(assert (=> start!4118 tp_is_empty!1387))

(declare-fun b!30860 () Bool)

(declare-fun res!18646 () Bool)

(assert (=> b!30860 (=> (not res!18646) (not e!19759))))

(assert (=> b!30860 (= res!18646 (and (= (size!1040 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1039 _keys!1833) (size!1040 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30861 () Bool)

(assert (=> b!30861 (= e!19756 tp_is_empty!1387)))

(assert (= (and start!4118 res!18643) b!30860))

(assert (= (and b!30860 res!18646) b!30857))

(assert (= (and b!30857 res!18645) b!30851))

(assert (= (and b!30851 res!18644) b!30859))

(assert (= (and b!30859 res!18647) b!30854))

(assert (= (and b!30854 res!18649) b!30853))

(assert (= (and b!30853 res!18642) b!30855))

(assert (= (and b!30855 res!18648) b!30856))

(assert (= (and b!30858 condMapEmpty!1609) mapIsEmpty!1609))

(assert (= (and b!30858 (not condMapEmpty!1609)) mapNonEmpty!1609))

(assert (= (and mapNonEmpty!1609 ((_ is ValueCellFull!494) mapValue!1609)) b!30852))

(assert (= (and b!30858 ((_ is ValueCellFull!494) mapDefault!1609)) b!30861))

(assert (= start!4118 b!30858))

(declare-fun m!24747 () Bool)

(assert (=> start!4118 m!24747))

(declare-fun m!24749 () Bool)

(assert (=> start!4118 m!24749))

(declare-fun m!24751 () Bool)

(assert (=> start!4118 m!24751))

(declare-fun m!24753 () Bool)

(assert (=> b!30851 m!24753))

(declare-fun m!24755 () Bool)

(assert (=> b!30859 m!24755))

(declare-fun m!24757 () Bool)

(assert (=> mapNonEmpty!1609 m!24757))

(declare-fun m!24759 () Bool)

(assert (=> b!30854 m!24759))

(declare-fun m!24761 () Bool)

(assert (=> b!30854 m!24761))

(declare-fun m!24763 () Bool)

(assert (=> b!30856 m!24763))

(assert (=> b!30856 m!24763))

(declare-fun m!24765 () Bool)

(assert (=> b!30856 m!24765))

(declare-fun m!24767 () Bool)

(assert (=> b!30856 m!24767))

(declare-fun m!24769 () Bool)

(assert (=> b!30857 m!24769))

(declare-fun m!24771 () Bool)

(assert (=> b!30853 m!24771))

(declare-fun m!24773 () Bool)

(assert (=> b!30855 m!24773))

(check-sat (not b!30853) (not b!30855) (not start!4118) (not b!30851) (not b!30859) (not mapNonEmpty!1609) (not b!30856) tp_is_empty!1387 (not b_next!1033) b_and!1837 (not b!30857) (not b!30854))
(check-sat b_and!1837 (not b_next!1033))
