; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4076 () Bool)

(assert start!4076)

(declare-fun b_free!985 () Bool)

(declare-fun b_next!985 () Bool)

(assert (=> start!4076 (= b_free!985 (not b_next!985))))

(declare-fun tp!4375 () Bool)

(declare-fun b_and!1785 () Bool)

(assert (=> start!4076 (= tp!4375 b_and!1785)))

(declare-fun res!18116 () Bool)

(declare-fun e!19348 () Bool)

(assert (=> start!4076 (=> (not res!18116) (not e!19348))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4076 (= res!18116 (validMask!0 mask!2294))))

(assert (=> start!4076 e!19348))

(assert (=> start!4076 true))

(assert (=> start!4076 tp!4375))

(declare-datatypes ((V!1611 0))(
  ( (V!1612 (val!696 Int)) )
))
(declare-datatypes ((ValueCell!470 0))(
  ( (ValueCellFull!470 (v!1785 V!1611)) (EmptyCell!470) )
))
(declare-datatypes ((array!1889 0))(
  ( (array!1890 (arr!898 (Array (_ BitVec 32) ValueCell!470)) (size!999 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1889)

(declare-fun e!19346 () Bool)

(declare-fun array_inv!623 (array!1889) Bool)

(assert (=> start!4076 (and (array_inv!623 _values!1501) e!19346)))

(declare-datatypes ((array!1891 0))(
  ( (array!1892 (arr!899 (Array (_ BitVec 32) (_ BitVec 64))) (size!1000 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1891)

(declare-fun array_inv!624 (array!1891) Bool)

(assert (=> start!4076 (array_inv!624 _keys!1833)))

(declare-fun tp_is_empty!1339 () Bool)

(assert (=> start!4076 tp_is_empty!1339))

(declare-fun b!30093 () Bool)

(declare-fun e!19344 () Bool)

(declare-fun mapRes!1537 () Bool)

(assert (=> b!30093 (= e!19346 (and e!19344 mapRes!1537))))

(declare-fun condMapEmpty!1537 () Bool)

(declare-fun mapDefault!1537 () ValueCell!470)

(assert (=> b!30093 (= condMapEmpty!1537 (= (arr!898 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!470)) mapDefault!1537)))))

(declare-fun b!30094 () Bool)

(assert (=> b!30094 (= e!19344 tp_is_empty!1339)))

(declare-fun mapIsEmpty!1537 () Bool)

(assert (=> mapIsEmpty!1537 mapRes!1537))

(declare-fun b!30095 () Bool)

(declare-fun e!19345 () Bool)

(assert (=> b!30095 (= e!19345 tp_is_empty!1339)))

(declare-fun b!30096 () Bool)

(declare-fun res!18113 () Bool)

(assert (=> b!30096 (=> (not res!18113) (not e!19348))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1611)

(declare-fun minValue!1443 () V!1611)

(declare-datatypes ((tuple2!1148 0))(
  ( (tuple2!1149 (_1!585 (_ BitVec 64)) (_2!585 V!1611)) )
))
(declare-datatypes ((List!741 0))(
  ( (Nil!738) (Cons!737 (h!1304 tuple2!1148) (t!3428 List!741)) )
))
(declare-datatypes ((ListLongMap!719 0))(
  ( (ListLongMap!720 (toList!375 List!741)) )
))
(declare-fun contains!317 (ListLongMap!719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!200 (array!1891 array!1889 (_ BitVec 32) (_ BitVec 32) V!1611 V!1611 (_ BitVec 32) Int) ListLongMap!719)

(assert (=> b!30096 (= res!18113 (not (contains!317 (getCurrentListMap!200 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30097 () Bool)

(declare-fun res!18112 () Bool)

(assert (=> b!30097 (=> (not res!18112) (not e!19348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1891 (_ BitVec 32)) Bool)

(assert (=> b!30097 (= res!18112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30098 () Bool)

(declare-fun res!18111 () Bool)

(assert (=> b!30098 (=> (not res!18111) (not e!19348))))

(declare-fun arrayContainsKey!0 (array!1891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30098 (= res!18111 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30099 () Bool)

(declare-fun res!18115 () Bool)

(assert (=> b!30099 (=> (not res!18115) (not e!19348))))

(declare-datatypes ((List!742 0))(
  ( (Nil!739) (Cons!738 (h!1305 (_ BitVec 64)) (t!3429 List!742)) )
))
(declare-fun arrayNoDuplicates!0 (array!1891 (_ BitVec 32) List!742) Bool)

(assert (=> b!30099 (= res!18115 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!739))))

(declare-fun b!30100 () Bool)

(assert (=> b!30100 (= e!19348 false)))

(declare-datatypes ((SeekEntryResult!99 0))(
  ( (MissingZero!99 (index!2518 (_ BitVec 32))) (Found!99 (index!2519 (_ BitVec 32))) (Intermediate!99 (undefined!911 Bool) (index!2520 (_ BitVec 32)) (x!6505 (_ BitVec 32))) (Undefined!99) (MissingVacant!99 (index!2521 (_ BitVec 32))) )
))
(declare-fun lt!11349 () SeekEntryResult!99)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1891 (_ BitVec 32)) SeekEntryResult!99)

(assert (=> b!30100 (= lt!11349 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30101 () Bool)

(declare-fun res!18114 () Bool)

(assert (=> b!30101 (=> (not res!18114) (not e!19348))))

(assert (=> b!30101 (= res!18114 (and (= (size!999 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1000 _keys!1833) (size!999 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30102 () Bool)

(declare-fun res!18110 () Bool)

(assert (=> b!30102 (=> (not res!18110) (not e!19348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30102 (= res!18110 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1537 () Bool)

(declare-fun tp!4374 () Bool)

(assert (=> mapNonEmpty!1537 (= mapRes!1537 (and tp!4374 e!19345))))

(declare-fun mapValue!1537 () ValueCell!470)

(declare-fun mapKey!1537 () (_ BitVec 32))

(declare-fun mapRest!1537 () (Array (_ BitVec 32) ValueCell!470))

(assert (=> mapNonEmpty!1537 (= (arr!898 _values!1501) (store mapRest!1537 mapKey!1537 mapValue!1537))))

(assert (= (and start!4076 res!18116) b!30101))

(assert (= (and b!30101 res!18114) b!30097))

(assert (= (and b!30097 res!18112) b!30099))

(assert (= (and b!30099 res!18115) b!30102))

(assert (= (and b!30102 res!18110) b!30096))

(assert (= (and b!30096 res!18113) b!30098))

(assert (= (and b!30098 res!18111) b!30100))

(assert (= (and b!30093 condMapEmpty!1537) mapIsEmpty!1537))

(assert (= (and b!30093 (not condMapEmpty!1537)) mapNonEmpty!1537))

(get-info :version)

(assert (= (and mapNonEmpty!1537 ((_ is ValueCellFull!470) mapValue!1537)) b!30095))

(assert (= (and b!30093 ((_ is ValueCellFull!470) mapDefault!1537)) b!30094))

(assert (= start!4076 b!30093))

(declare-fun m!24101 () Bool)

(assert (=> b!30096 m!24101))

(assert (=> b!30096 m!24101))

(declare-fun m!24103 () Bool)

(assert (=> b!30096 m!24103))

(declare-fun m!24105 () Bool)

(assert (=> b!30099 m!24105))

(declare-fun m!24107 () Bool)

(assert (=> b!30102 m!24107))

(declare-fun m!24109 () Bool)

(assert (=> b!30098 m!24109))

(declare-fun m!24111 () Bool)

(assert (=> start!4076 m!24111))

(declare-fun m!24113 () Bool)

(assert (=> start!4076 m!24113))

(declare-fun m!24115 () Bool)

(assert (=> start!4076 m!24115))

(declare-fun m!24117 () Bool)

(assert (=> b!30100 m!24117))

(declare-fun m!24119 () Bool)

(assert (=> b!30097 m!24119))

(declare-fun m!24121 () Bool)

(assert (=> mapNonEmpty!1537 m!24121))

(check-sat tp_is_empty!1339 (not b!30099) (not b_next!985) (not b!30097) b_and!1785 (not b!30096) (not start!4076) (not b!30098) (not b!30102) (not mapNonEmpty!1537) (not b!30100))
(check-sat b_and!1785 (not b_next!985))
