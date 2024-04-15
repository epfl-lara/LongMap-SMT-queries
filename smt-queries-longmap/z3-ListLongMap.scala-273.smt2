; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4454 () Bool)

(assert start!4454)

(declare-fun b_free!1225 () Bool)

(declare-fun b_next!1225 () Bool)

(assert (=> start!4454 (= b_free!1225 (not b_next!1225))))

(declare-fun tp!5113 () Bool)

(declare-fun b_and!2041 () Bool)

(assert (=> start!4454 (= tp!5113 b_and!2041)))

(declare-fun mapIsEmpty!1915 () Bool)

(declare-fun mapRes!1915 () Bool)

(assert (=> mapIsEmpty!1915 mapRes!1915))

(declare-fun res!20964 () Bool)

(declare-fun e!21879 () Bool)

(assert (=> start!4454 (=> (not res!20964) (not e!21879))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4454 (= res!20964 (validMask!0 mask!2294))))

(assert (=> start!4454 e!21879))

(assert (=> start!4454 true))

(assert (=> start!4454 tp!5113))

(declare-datatypes ((V!1931 0))(
  ( (V!1932 (val!816 Int)) )
))
(declare-datatypes ((ValueCell!590 0))(
  ( (ValueCellFull!590 (v!1910 V!1931)) (EmptyCell!590) )
))
(declare-datatypes ((array!2347 0))(
  ( (array!2348 (arr!1121 (Array (_ BitVec 32) ValueCell!590)) (size!1222 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2347)

(declare-fun e!21880 () Bool)

(declare-fun array_inv!793 (array!2347) Bool)

(assert (=> start!4454 (and (array_inv!793 _values!1501) e!21880)))

(declare-datatypes ((array!2349 0))(
  ( (array!2350 (arr!1122 (Array (_ BitVec 32) (_ BitVec 64))) (size!1223 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2349)

(declare-fun array_inv!794 (array!2349) Bool)

(assert (=> start!4454 (array_inv!794 _keys!1833)))

(declare-fun tp_is_empty!1579 () Bool)

(assert (=> start!4454 tp_is_empty!1579))

(declare-fun b!34537 () Bool)

(declare-fun res!20966 () Bool)

(assert (=> b!34537 (=> (not res!20966) (not e!21879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2349 (_ BitVec 32)) Bool)

(assert (=> b!34537 (= res!20966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34538 () Bool)

(declare-fun res!20965 () Bool)

(assert (=> b!34538 (=> (not res!20965) (not e!21879))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34538 (= res!20965 (and (= (size!1222 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1223 _keys!1833) (size!1222 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34539 () Bool)

(declare-fun e!21881 () Bool)

(assert (=> b!34539 (= e!21880 (and e!21881 mapRes!1915))))

(declare-fun condMapEmpty!1915 () Bool)

(declare-fun mapDefault!1915 () ValueCell!590)

(assert (=> b!34539 (= condMapEmpty!1915 (= (arr!1121 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!590)) mapDefault!1915)))))

(declare-fun b!34540 () Bool)

(declare-fun e!21882 () Bool)

(assert (=> b!34540 (= e!21882 tp_is_empty!1579)))

(declare-fun b!34541 () Bool)

(assert (=> b!34541 (= e!21881 tp_is_empty!1579)))

(declare-fun b!34542 () Bool)

(assert (=> b!34542 (= e!21879 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!153 0))(
  ( (MissingZero!153 (index!2734 (_ BitVec 32))) (Found!153 (index!2735 (_ BitVec 32))) (Intermediate!153 (undefined!965 Bool) (index!2736 (_ BitVec 32)) (x!6939 (_ BitVec 32))) (Undefined!153) (MissingVacant!153 (index!2737 (_ BitVec 32))) )
))
(declare-fun lt!12791 () SeekEntryResult!153)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2349 (_ BitVec 32)) SeekEntryResult!153)

(assert (=> b!34542 (= lt!12791 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34543 () Bool)

(declare-fun res!20962 () Bool)

(assert (=> b!34543 (=> (not res!20962) (not e!21879))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1931)

(declare-fun minValue!1443 () V!1931)

(declare-datatypes ((tuple2!1320 0))(
  ( (tuple2!1321 (_1!671 (_ BitVec 64)) (_2!671 V!1931)) )
))
(declare-datatypes ((List!903 0))(
  ( (Nil!900) (Cons!899 (h!1466 tuple2!1320) (t!3601 List!903)) )
))
(declare-datatypes ((ListLongMap!885 0))(
  ( (ListLongMap!886 (toList!458 List!903)) )
))
(declare-fun contains!405 (ListLongMap!885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!277 (array!2349 array!2347 (_ BitVec 32) (_ BitVec 32) V!1931 V!1931 (_ BitVec 32) Int) ListLongMap!885)

(assert (=> b!34543 (= res!20962 (not (contains!405 (getCurrentListMap!277 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapNonEmpty!1915 () Bool)

(declare-fun tp!5112 () Bool)

(assert (=> mapNonEmpty!1915 (= mapRes!1915 (and tp!5112 e!21882))))

(declare-fun mapValue!1915 () ValueCell!590)

(declare-fun mapKey!1915 () (_ BitVec 32))

(declare-fun mapRest!1915 () (Array (_ BitVec 32) ValueCell!590))

(assert (=> mapNonEmpty!1915 (= (arr!1121 _values!1501) (store mapRest!1915 mapKey!1915 mapValue!1915))))

(declare-fun b!34544 () Bool)

(declare-fun res!20968 () Bool)

(assert (=> b!34544 (=> (not res!20968) (not e!21879))))

(declare-datatypes ((List!904 0))(
  ( (Nil!901) (Cons!900 (h!1467 (_ BitVec 64)) (t!3602 List!904)) )
))
(declare-fun arrayNoDuplicates!0 (array!2349 (_ BitVec 32) List!904) Bool)

(assert (=> b!34544 (= res!20968 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!901))))

(declare-fun b!34545 () Bool)

(declare-fun res!20963 () Bool)

(assert (=> b!34545 (=> (not res!20963) (not e!21879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34545 (= res!20963 (validKeyInArray!0 k0!1304))))

(declare-fun b!34546 () Bool)

(declare-fun res!20967 () Bool)

(assert (=> b!34546 (=> (not res!20967) (not e!21879))))

(declare-fun arrayContainsKey!0 (array!2349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34546 (= res!20967 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(assert (= (and start!4454 res!20964) b!34538))

(assert (= (and b!34538 res!20965) b!34537))

(assert (= (and b!34537 res!20966) b!34544))

(assert (= (and b!34544 res!20968) b!34545))

(assert (= (and b!34545 res!20963) b!34543))

(assert (= (and b!34543 res!20962) b!34546))

(assert (= (and b!34546 res!20967) b!34542))

(assert (= (and b!34539 condMapEmpty!1915) mapIsEmpty!1915))

(assert (= (and b!34539 (not condMapEmpty!1915)) mapNonEmpty!1915))

(get-info :version)

(assert (= (and mapNonEmpty!1915 ((_ is ValueCellFull!590) mapValue!1915)) b!34540))

(assert (= (and b!34539 ((_ is ValueCellFull!590) mapDefault!1915)) b!34541))

(assert (= start!4454 b!34539))

(declare-fun m!27809 () Bool)

(assert (=> b!34542 m!27809))

(declare-fun m!27811 () Bool)

(assert (=> b!34545 m!27811))

(declare-fun m!27813 () Bool)

(assert (=> b!34546 m!27813))

(declare-fun m!27815 () Bool)

(assert (=> mapNonEmpty!1915 m!27815))

(declare-fun m!27817 () Bool)

(assert (=> b!34537 m!27817))

(declare-fun m!27819 () Bool)

(assert (=> b!34544 m!27819))

(declare-fun m!27821 () Bool)

(assert (=> b!34543 m!27821))

(assert (=> b!34543 m!27821))

(declare-fun m!27823 () Bool)

(assert (=> b!34543 m!27823))

(declare-fun m!27825 () Bool)

(assert (=> start!4454 m!27825))

(declare-fun m!27827 () Bool)

(assert (=> start!4454 m!27827))

(declare-fun m!27829 () Bool)

(assert (=> start!4454 m!27829))

(check-sat tp_is_empty!1579 (not b_next!1225) (not start!4454) (not mapNonEmpty!1915) (not b!34545) (not b!34542) (not b!34537) (not b!34543) (not b!34544) (not b!34546) b_and!2041)
(check-sat b_and!2041 (not b_next!1225))
