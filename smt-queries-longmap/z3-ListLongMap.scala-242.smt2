; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4124 () Bool)

(assert start!4124)

(declare-fun b_free!1039 () Bool)

(declare-fun b_next!1039 () Bool)

(assert (=> start!4124 (= b_free!1039 (not b_next!1039))))

(declare-fun tp!4537 () Bool)

(declare-fun b_and!1843 () Bool)

(assert (=> start!4124 (= tp!4537 b_and!1843)))

(declare-fun b!30948 () Bool)

(declare-fun e!19814 () Bool)

(assert (=> b!30948 (= e!19814 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!120 0))(
  ( (MissingZero!120 (index!2602 (_ BitVec 32))) (Found!120 (index!2603 (_ BitVec 32))) (Intermediate!120 (undefined!932 Bool) (index!2604 (_ BitVec 32)) (x!6598 (_ BitVec 32))) (Undefined!120) (MissingVacant!120 (index!2605 (_ BitVec 32))) )
))
(declare-fun lt!11524 () SeekEntryResult!120)

(declare-datatypes ((array!1981 0))(
  ( (array!1982 (arr!944 (Array (_ BitVec 32) (_ BitVec 64))) (size!1045 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1981)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1981 (_ BitVec 32)) SeekEntryResult!120)

(assert (=> b!30948 (= lt!11524 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!18713 () Bool)

(assert (=> start!4124 (=> (not res!18713) (not e!19814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4124 (= res!18713 (validMask!0 mask!2294))))

(assert (=> start!4124 e!19814))

(assert (=> start!4124 true))

(assert (=> start!4124 tp!4537))

(declare-datatypes ((V!1683 0))(
  ( (V!1684 (val!723 Int)) )
))
(declare-datatypes ((ValueCell!497 0))(
  ( (ValueCellFull!497 (v!1811 V!1683)) (EmptyCell!497) )
))
(declare-datatypes ((array!1983 0))(
  ( (array!1984 (arr!945 (Array (_ BitVec 32) ValueCell!497)) (size!1046 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1983)

(declare-fun e!19816 () Bool)

(declare-fun array_inv!661 (array!1983) Bool)

(assert (=> start!4124 (and (array_inv!661 _values!1501) e!19816)))

(declare-fun array_inv!662 (array!1981) Bool)

(assert (=> start!4124 (array_inv!662 _keys!1833)))

(declare-fun tp_is_empty!1393 () Bool)

(assert (=> start!4124 tp_is_empty!1393))

(declare-fun b!30949 () Bool)

(declare-fun res!18715 () Bool)

(assert (=> b!30949 (=> (not res!18715) (not e!19814))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1683)

(declare-fun minValue!1443 () V!1683)

(declare-datatypes ((tuple2!1188 0))(
  ( (tuple2!1189 (_1!605 (_ BitVec 64)) (_2!605 V!1683)) )
))
(declare-datatypes ((List!770 0))(
  ( (Nil!767) (Cons!766 (h!1333 tuple2!1188) (t!3456 List!770)) )
))
(declare-datatypes ((ListLongMap!753 0))(
  ( (ListLongMap!754 (toList!392 List!770)) )
))
(declare-fun contains!333 (ListLongMap!753 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!215 (array!1981 array!1983 (_ BitVec 32) (_ BitVec 32) V!1683 V!1683 (_ BitVec 32) Int) ListLongMap!753)

(assert (=> b!30949 (= res!18715 (not (contains!333 (getCurrentListMap!215 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapIsEmpty!1618 () Bool)

(declare-fun mapRes!1618 () Bool)

(assert (=> mapIsEmpty!1618 mapRes!1618))

(declare-fun b!30950 () Bool)

(declare-fun res!18714 () Bool)

(assert (=> b!30950 (=> (not res!18714) (not e!19814))))

(declare-datatypes ((List!771 0))(
  ( (Nil!768) (Cons!767 (h!1334 (_ BitVec 64)) (t!3457 List!771)) )
))
(declare-fun arrayNoDuplicates!0 (array!1981 (_ BitVec 32) List!771) Bool)

(assert (=> b!30950 (= res!18714 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!768))))

(declare-fun b!30951 () Bool)

(declare-fun res!18717 () Bool)

(assert (=> b!30951 (=> (not res!18717) (not e!19814))))

(assert (=> b!30951 (= res!18717 (and (= (size!1046 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1045 _keys!1833) (size!1046 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1618 () Bool)

(declare-fun tp!4536 () Bool)

(declare-fun e!19813 () Bool)

(assert (=> mapNonEmpty!1618 (= mapRes!1618 (and tp!4536 e!19813))))

(declare-fun mapValue!1618 () ValueCell!497)

(declare-fun mapRest!1618 () (Array (_ BitVec 32) ValueCell!497))

(declare-fun mapKey!1618 () (_ BitVec 32))

(assert (=> mapNonEmpty!1618 (= (arr!945 _values!1501) (store mapRest!1618 mapKey!1618 mapValue!1618))))

(declare-fun b!30952 () Bool)

(declare-fun res!18712 () Bool)

(assert (=> b!30952 (=> (not res!18712) (not e!19814))))

(declare-fun arrayContainsKey!0 (array!1981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30952 (= res!18712 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30953 () Bool)

(declare-fun res!18718 () Bool)

(assert (=> b!30953 (=> (not res!18718) (not e!19814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30953 (= res!18718 (validKeyInArray!0 k0!1304))))

(declare-fun b!30954 () Bool)

(assert (=> b!30954 (= e!19813 tp_is_empty!1393)))

(declare-fun b!30955 () Bool)

(declare-fun e!19812 () Bool)

(assert (=> b!30955 (= e!19812 tp_is_empty!1393)))

(declare-fun b!30956 () Bool)

(declare-fun res!18716 () Bool)

(assert (=> b!30956 (=> (not res!18716) (not e!19814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1981 (_ BitVec 32)) Bool)

(assert (=> b!30956 (= res!18716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30957 () Bool)

(assert (=> b!30957 (= e!19816 (and e!19812 mapRes!1618))))

(declare-fun condMapEmpty!1618 () Bool)

(declare-fun mapDefault!1618 () ValueCell!497)

(assert (=> b!30957 (= condMapEmpty!1618 (= (arr!945 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!497)) mapDefault!1618)))))

(assert (= (and start!4124 res!18713) b!30951))

(assert (= (and b!30951 res!18717) b!30956))

(assert (= (and b!30956 res!18716) b!30950))

(assert (= (and b!30950 res!18714) b!30953))

(assert (= (and b!30953 res!18718) b!30949))

(assert (= (and b!30949 res!18715) b!30952))

(assert (= (and b!30952 res!18712) b!30948))

(assert (= (and b!30957 condMapEmpty!1618) mapIsEmpty!1618))

(assert (= (and b!30957 (not condMapEmpty!1618)) mapNonEmpty!1618))

(get-info :version)

(assert (= (and mapNonEmpty!1618 ((_ is ValueCellFull!497) mapValue!1618)) b!30954))

(assert (= (and b!30957 ((_ is ValueCellFull!497) mapDefault!1618)) b!30955))

(assert (= start!4124 b!30957))

(declare-fun m!24831 () Bool)

(assert (=> b!30949 m!24831))

(assert (=> b!30949 m!24831))

(declare-fun m!24833 () Bool)

(assert (=> b!30949 m!24833))

(declare-fun m!24835 () Bool)

(assert (=> b!30948 m!24835))

(declare-fun m!24837 () Bool)

(assert (=> b!30956 m!24837))

(declare-fun m!24839 () Bool)

(assert (=> b!30953 m!24839))

(declare-fun m!24841 () Bool)

(assert (=> start!4124 m!24841))

(declare-fun m!24843 () Bool)

(assert (=> start!4124 m!24843))

(declare-fun m!24845 () Bool)

(assert (=> start!4124 m!24845))

(declare-fun m!24847 () Bool)

(assert (=> b!30952 m!24847))

(declare-fun m!24849 () Bool)

(assert (=> mapNonEmpty!1618 m!24849))

(declare-fun m!24851 () Bool)

(assert (=> b!30950 m!24851))

(check-sat tp_is_empty!1393 (not b_next!1039) (not b!30950) (not b!30952) (not b!30953) (not start!4124) (not mapNonEmpty!1618) (not b!30949) b_and!1843 (not b!30956) (not b!30948))
(check-sat b_and!1843 (not b_next!1039))
