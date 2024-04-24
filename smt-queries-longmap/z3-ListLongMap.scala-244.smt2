; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4142 () Bool)

(assert start!4142)

(declare-fun b_free!1051 () Bool)

(declare-fun b_next!1051 () Bool)

(assert (=> start!4142 (= b_free!1051 (not b_next!1051))))

(declare-fun tp!4572 () Bool)

(declare-fun b_and!1851 () Bool)

(assert (=> start!4142 (= tp!4572 b_and!1851)))

(declare-fun b!31119 () Bool)

(declare-fun e!19895 () Bool)

(assert (=> b!31119 (= e!19895 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!118 0))(
  ( (MissingZero!118 (index!2594 (_ BitVec 32))) (Found!118 (index!2595 (_ BitVec 32))) (Intermediate!118 (undefined!930 Bool) (index!2596 (_ BitVec 32)) (x!6612 (_ BitVec 32))) (Undefined!118) (MissingVacant!118 (index!2597 (_ BitVec 32))) )
))
(declare-fun lt!11493 () SeekEntryResult!118)

(declare-datatypes ((array!2013 0))(
  ( (array!2014 (arr!960 (Array (_ BitVec 32) (_ BitVec 64))) (size!1061 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2013)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2013 (_ BitVec 32)) SeekEntryResult!118)

(assert (=> b!31119 (= lt!11493 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!31120 () Bool)

(declare-fun res!18844 () Bool)

(assert (=> b!31120 (=> (not res!18844) (not e!19895))))

(declare-datatypes ((V!1699 0))(
  ( (V!1700 (val!729 Int)) )
))
(declare-datatypes ((ValueCell!503 0))(
  ( (ValueCellFull!503 (v!1818 V!1699)) (EmptyCell!503) )
))
(declare-datatypes ((array!2015 0))(
  ( (array!2016 (arr!961 (Array (_ BitVec 32) ValueCell!503)) (size!1062 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2015)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31120 (= res!18844 (and (= (size!1062 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1061 _keys!1833) (size!1062 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31121 () Bool)

(declare-fun res!18843 () Bool)

(assert (=> b!31121 (=> (not res!18843) (not e!19895))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1699)

(declare-fun minValue!1443 () V!1699)

(declare-datatypes ((tuple2!1190 0))(
  ( (tuple2!1191 (_1!606 (_ BitVec 64)) (_2!606 V!1699)) )
))
(declare-datatypes ((List!784 0))(
  ( (Nil!781) (Cons!780 (h!1347 tuple2!1190) (t!3471 List!784)) )
))
(declare-datatypes ((ListLongMap!761 0))(
  ( (ListLongMap!762 (toList!396 List!784)) )
))
(declare-fun contains!338 (ListLongMap!761 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!221 (array!2013 array!2015 (_ BitVec 32) (_ BitVec 32) V!1699 V!1699 (_ BitVec 32) Int) ListLongMap!761)

(assert (=> b!31121 (= res!18843 (not (contains!338 (getCurrentListMap!221 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31122 () Bool)

(declare-fun res!18845 () Bool)

(assert (=> b!31122 (=> (not res!18845) (not e!19895))))

(declare-fun arrayContainsKey!0 (array!2013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31122 (= res!18845 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!31123 () Bool)

(declare-fun res!18842 () Bool)

(assert (=> b!31123 (=> (not res!18842) (not e!19895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2013 (_ BitVec 32)) Bool)

(assert (=> b!31123 (= res!18842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!18840 () Bool)

(assert (=> start!4142 (=> (not res!18840) (not e!19895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4142 (= res!18840 (validMask!0 mask!2294))))

(assert (=> start!4142 e!19895))

(assert (=> start!4142 true))

(assert (=> start!4142 tp!4572))

(declare-fun e!19893 () Bool)

(declare-fun array_inv!657 (array!2015) Bool)

(assert (=> start!4142 (and (array_inv!657 _values!1501) e!19893)))

(declare-fun array_inv!658 (array!2013) Bool)

(assert (=> start!4142 (array_inv!658 _keys!1833)))

(declare-fun tp_is_empty!1405 () Bool)

(assert (=> start!4142 tp_is_empty!1405))

(declare-fun b!31124 () Bool)

(declare-fun e!19894 () Bool)

(assert (=> b!31124 (= e!19894 tp_is_empty!1405)))

(declare-fun b!31125 () Bool)

(declare-fun e!19896 () Bool)

(assert (=> b!31125 (= e!19896 tp_is_empty!1405)))

(declare-fun b!31126 () Bool)

(declare-fun mapRes!1636 () Bool)

(assert (=> b!31126 (= e!19893 (and e!19894 mapRes!1636))))

(declare-fun condMapEmpty!1636 () Bool)

(declare-fun mapDefault!1636 () ValueCell!503)

(assert (=> b!31126 (= condMapEmpty!1636 (= (arr!961 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!503)) mapDefault!1636)))))

(declare-fun b!31127 () Bool)

(declare-fun res!18841 () Bool)

(assert (=> b!31127 (=> (not res!18841) (not e!19895))))

(declare-datatypes ((List!785 0))(
  ( (Nil!782) (Cons!781 (h!1348 (_ BitVec 64)) (t!3472 List!785)) )
))
(declare-fun arrayNoDuplicates!0 (array!2013 (_ BitVec 32) List!785) Bool)

(assert (=> b!31127 (= res!18841 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!782))))

(declare-fun mapIsEmpty!1636 () Bool)

(assert (=> mapIsEmpty!1636 mapRes!1636))

(declare-fun mapNonEmpty!1636 () Bool)

(declare-fun tp!4573 () Bool)

(assert (=> mapNonEmpty!1636 (= mapRes!1636 (and tp!4573 e!19896))))

(declare-fun mapKey!1636 () (_ BitVec 32))

(declare-fun mapRest!1636 () (Array (_ BitVec 32) ValueCell!503))

(declare-fun mapValue!1636 () ValueCell!503)

(assert (=> mapNonEmpty!1636 (= (arr!961 _values!1501) (store mapRest!1636 mapKey!1636 mapValue!1636))))

(declare-fun b!31128 () Bool)

(declare-fun res!18839 () Bool)

(assert (=> b!31128 (=> (not res!18839) (not e!19895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31128 (= res!18839 (validKeyInArray!0 k0!1304))))

(assert (= (and start!4142 res!18840) b!31120))

(assert (= (and b!31120 res!18844) b!31123))

(assert (= (and b!31123 res!18842) b!31127))

(assert (= (and b!31127 res!18841) b!31128))

(assert (= (and b!31128 res!18839) b!31121))

(assert (= (and b!31121 res!18843) b!31122))

(assert (= (and b!31122 res!18845) b!31119))

(assert (= (and b!31126 condMapEmpty!1636) mapIsEmpty!1636))

(assert (= (and b!31126 (not condMapEmpty!1636)) mapNonEmpty!1636))

(get-info :version)

(assert (= (and mapNonEmpty!1636 ((_ is ValueCellFull!503) mapValue!1636)) b!31125))

(assert (= (and b!31126 ((_ is ValueCellFull!503) mapDefault!1636)) b!31124))

(assert (= start!4142 b!31126))

(declare-fun m!24881 () Bool)

(assert (=> mapNonEmpty!1636 m!24881))

(declare-fun m!24883 () Bool)

(assert (=> b!31121 m!24883))

(assert (=> b!31121 m!24883))

(declare-fun m!24885 () Bool)

(assert (=> b!31121 m!24885))

(declare-fun m!24887 () Bool)

(assert (=> b!31128 m!24887))

(declare-fun m!24889 () Bool)

(assert (=> b!31119 m!24889))

(declare-fun m!24891 () Bool)

(assert (=> b!31123 m!24891))

(declare-fun m!24893 () Bool)

(assert (=> b!31122 m!24893))

(declare-fun m!24895 () Bool)

(assert (=> b!31127 m!24895))

(declare-fun m!24897 () Bool)

(assert (=> start!4142 m!24897))

(declare-fun m!24899 () Bool)

(assert (=> start!4142 m!24899))

(declare-fun m!24901 () Bool)

(assert (=> start!4142 m!24901))

(check-sat tp_is_empty!1405 (not b!31127) (not b!31121) (not b!31128) (not mapNonEmpty!1636) b_and!1851 (not start!4142) (not b!31122) (not b_next!1051) (not b!31123) (not b!31119))
(check-sat b_and!1851 (not b_next!1051))
