; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4136 () Bool)

(assert start!4136)

(declare-fun b_free!1051 () Bool)

(declare-fun b_next!1051 () Bool)

(assert (=> start!4136 (= b_free!1051 (not b_next!1051))))

(declare-fun tp!4572 () Bool)

(declare-fun b_and!1855 () Bool)

(assert (=> start!4136 (= tp!4572 b_and!1855)))

(declare-fun res!18852 () Bool)

(declare-fun e!19904 () Bool)

(assert (=> start!4136 (=> (not res!18852) (not e!19904))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4136 (= res!18852 (validMask!0 mask!2294))))

(assert (=> start!4136 e!19904))

(assert (=> start!4136 true))

(assert (=> start!4136 tp!4572))

(declare-datatypes ((V!1699 0))(
  ( (V!1700 (val!729 Int)) )
))
(declare-datatypes ((ValueCell!503 0))(
  ( (ValueCellFull!503 (v!1817 V!1699)) (EmptyCell!503) )
))
(declare-datatypes ((array!2003 0))(
  ( (array!2004 (arr!955 (Array (_ BitVec 32) ValueCell!503)) (size!1056 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2003)

(declare-fun e!19902 () Bool)

(declare-fun array_inv!671 (array!2003) Bool)

(assert (=> start!4136 (and (array_inv!671 _values!1501) e!19902)))

(declare-datatypes ((array!2005 0))(
  ( (array!2006 (arr!956 (Array (_ BitVec 32) (_ BitVec 64))) (size!1057 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2005)

(declare-fun array_inv!672 (array!2005) Bool)

(assert (=> start!4136 (array_inv!672 _keys!1833)))

(declare-fun tp_is_empty!1405 () Bool)

(assert (=> start!4136 tp_is_empty!1405))

(declare-fun b!31137 () Bool)

(declare-fun e!19903 () Bool)

(assert (=> b!31137 (= e!19903 tp_is_empty!1405)))

(declare-fun mapNonEmpty!1636 () Bool)

(declare-fun mapRes!1636 () Bool)

(declare-fun tp!4573 () Bool)

(assert (=> mapNonEmpty!1636 (= mapRes!1636 (and tp!4573 e!19903))))

(declare-fun mapRest!1636 () (Array (_ BitVec 32) ValueCell!503))

(declare-fun mapKey!1636 () (_ BitVec 32))

(declare-fun mapValue!1636 () ValueCell!503)

(assert (=> mapNonEmpty!1636 (= (arr!955 _values!1501) (store mapRest!1636 mapKey!1636 mapValue!1636))))

(declare-fun b!31138 () Bool)

(declare-fun res!18849 () Bool)

(assert (=> b!31138 (=> (not res!18849) (not e!19904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2005 (_ BitVec 32)) Bool)

(assert (=> b!31138 (= res!18849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1636 () Bool)

(assert (=> mapIsEmpty!1636 mapRes!1636))

(declare-fun b!31139 () Bool)

(assert (=> b!31139 (= e!19904 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!124 0))(
  ( (MissingZero!124 (index!2618 (_ BitVec 32))) (Found!124 (index!2619 (_ BitVec 32))) (Intermediate!124 (undefined!936 Bool) (index!2620 (_ BitVec 32)) (x!6618 (_ BitVec 32))) (Undefined!124) (MissingVacant!124 (index!2621 (_ BitVec 32))) )
))
(declare-fun lt!11533 () SeekEntryResult!124)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2005 (_ BitVec 32)) SeekEntryResult!124)

(assert (=> b!31139 (= lt!11533 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!31140 () Bool)

(declare-fun res!18848 () Bool)

(assert (=> b!31140 (=> (not res!18848) (not e!19904))))

(declare-fun arrayContainsKey!0 (array!2005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31140 (= res!18848 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!31141 () Bool)

(declare-fun res!18850 () Bool)

(assert (=> b!31141 (=> (not res!18850) (not e!19904))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1699)

(declare-fun minValue!1443 () V!1699)

(declare-datatypes ((tuple2!1196 0))(
  ( (tuple2!1197 (_1!609 (_ BitVec 64)) (_2!609 V!1699)) )
))
(declare-datatypes ((List!779 0))(
  ( (Nil!776) (Cons!775 (h!1342 tuple2!1196) (t!3465 List!779)) )
))
(declare-datatypes ((ListLongMap!761 0))(
  ( (ListLongMap!762 (toList!396 List!779)) )
))
(declare-fun contains!337 (ListLongMap!761 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!219 (array!2005 array!2003 (_ BitVec 32) (_ BitVec 32) V!1699 V!1699 (_ BitVec 32) Int) ListLongMap!761)

(assert (=> b!31141 (= res!18850 (not (contains!337 (getCurrentListMap!219 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31142 () Bool)

(declare-fun e!19905 () Bool)

(assert (=> b!31142 (= e!19902 (and e!19905 mapRes!1636))))

(declare-fun condMapEmpty!1636 () Bool)

(declare-fun mapDefault!1636 () ValueCell!503)

(assert (=> b!31142 (= condMapEmpty!1636 (= (arr!955 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!503)) mapDefault!1636)))))

(declare-fun b!31143 () Bool)

(assert (=> b!31143 (= e!19905 tp_is_empty!1405)))

(declare-fun b!31144 () Bool)

(declare-fun res!18853 () Bool)

(assert (=> b!31144 (=> (not res!18853) (not e!19904))))

(assert (=> b!31144 (= res!18853 (and (= (size!1056 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1057 _keys!1833) (size!1056 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31145 () Bool)

(declare-fun res!18847 () Bool)

(assert (=> b!31145 (=> (not res!18847) (not e!19904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31145 (= res!18847 (validKeyInArray!0 k0!1304))))

(declare-fun b!31146 () Bool)

(declare-fun res!18851 () Bool)

(assert (=> b!31146 (=> (not res!18851) (not e!19904))))

(declare-datatypes ((List!780 0))(
  ( (Nil!777) (Cons!776 (h!1343 (_ BitVec 64)) (t!3466 List!780)) )
))
(declare-fun arrayNoDuplicates!0 (array!2005 (_ BitVec 32) List!780) Bool)

(assert (=> b!31146 (= res!18851 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!777))))

(assert (= (and start!4136 res!18852) b!31144))

(assert (= (and b!31144 res!18853) b!31138))

(assert (= (and b!31138 res!18849) b!31146))

(assert (= (and b!31146 res!18851) b!31145))

(assert (= (and b!31145 res!18847) b!31141))

(assert (= (and b!31141 res!18850) b!31140))

(assert (= (and b!31140 res!18848) b!31139))

(assert (= (and b!31142 condMapEmpty!1636) mapIsEmpty!1636))

(assert (= (and b!31142 (not condMapEmpty!1636)) mapNonEmpty!1636))

(get-info :version)

(assert (= (and mapNonEmpty!1636 ((_ is ValueCellFull!503) mapValue!1636)) b!31137))

(assert (= (and b!31142 ((_ is ValueCellFull!503) mapDefault!1636)) b!31143))

(assert (= start!4136 b!31142))

(declare-fun m!24963 () Bool)

(assert (=> b!31140 m!24963))

(declare-fun m!24965 () Bool)

(assert (=> b!31141 m!24965))

(assert (=> b!31141 m!24965))

(declare-fun m!24967 () Bool)

(assert (=> b!31141 m!24967))

(declare-fun m!24969 () Bool)

(assert (=> b!31138 m!24969))

(declare-fun m!24971 () Bool)

(assert (=> b!31146 m!24971))

(declare-fun m!24973 () Bool)

(assert (=> mapNonEmpty!1636 m!24973))

(declare-fun m!24975 () Bool)

(assert (=> b!31145 m!24975))

(declare-fun m!24977 () Bool)

(assert (=> start!4136 m!24977))

(declare-fun m!24979 () Bool)

(assert (=> start!4136 m!24979))

(declare-fun m!24981 () Bool)

(assert (=> start!4136 m!24981))

(declare-fun m!24983 () Bool)

(assert (=> b!31139 m!24983))

(check-sat (not b!31146) b_and!1855 (not start!4136) (not b!31140) (not mapNonEmpty!1636) (not b!31141) tp_is_empty!1405 (not b!31139) (not b_next!1051) (not b!31145) (not b!31138))
(check-sat b_and!1855 (not b_next!1051))
