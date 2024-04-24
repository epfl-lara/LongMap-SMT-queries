; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4124 () Bool)

(assert start!4124)

(declare-fun b_free!1033 () Bool)

(declare-fun b_next!1033 () Bool)

(assert (=> start!4124 (= b_free!1033 (not b_next!1033))))

(declare-fun tp!4518 () Bool)

(declare-fun b_and!1833 () Bool)

(assert (=> start!4124 (= tp!4518 b_and!1833)))

(declare-fun b!30833 () Bool)

(declare-fun e!19744 () Bool)

(declare-fun tp_is_empty!1387 () Bool)

(assert (=> b!30833 (= e!19744 tp_is_empty!1387)))

(declare-fun b!30835 () Bool)

(declare-fun res!18640 () Bool)

(declare-fun e!19750 () Bool)

(assert (=> b!30835 (=> (not res!18640) (not e!19750))))

(declare-datatypes ((array!1979 0))(
  ( (array!1980 (arr!943 (Array (_ BitVec 32) (_ BitVec 64))) (size!1044 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1979)

(declare-datatypes ((List!772 0))(
  ( (Nil!769) (Cons!768 (h!1335 (_ BitVec 64)) (t!3459 List!772)) )
))
(declare-fun arrayNoDuplicates!0 (array!1979 (_ BitVec 32) List!772) Bool)

(assert (=> b!30835 (= res!18640 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!769))))

(declare-fun b!30836 () Bool)

(declare-fun res!18634 () Bool)

(assert (=> b!30836 (=> (not res!18634) (not e!19750))))

(declare-datatypes ((V!1675 0))(
  ( (V!1676 (val!720 Int)) )
))
(declare-datatypes ((ValueCell!494 0))(
  ( (ValueCellFull!494 (v!1809 V!1675)) (EmptyCell!494) )
))
(declare-datatypes ((array!1981 0))(
  ( (array!1982 (arr!944 (Array (_ BitVec 32) ValueCell!494)) (size!1045 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1981)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!30836 (= res!18634 (and (= (size!1045 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1044 _keys!1833) (size!1045 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30837 () Bool)

(declare-fun res!18639 () Bool)

(assert (=> b!30837 (=> (not res!18639) (not e!19750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1979 (_ BitVec 32)) Bool)

(assert (=> b!30837 (= res!18639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30838 () Bool)

(declare-fun e!19745 () Bool)

(assert (=> b!30838 (= e!19745 (not true))))

(declare-datatypes ((tuple2!1180 0))(
  ( (tuple2!1181 (_1!601 (_ BitVec 64)) (_2!601 V!1675)) )
))
(declare-datatypes ((List!773 0))(
  ( (Nil!770) (Cons!769 (h!1336 tuple2!1180) (t!3460 List!773)) )
))
(declare-datatypes ((ListLongMap!751 0))(
  ( (ListLongMap!752 (toList!391 List!773)) )
))
(declare-fun lt!11463 () ListLongMap!751)

(declare-datatypes ((SeekEntryResult!112 0))(
  ( (MissingZero!112 (index!2570 (_ BitVec 32))) (Found!112 (index!2571 (_ BitVec 32))) (Intermediate!112 (undefined!924 Bool) (index!2572 (_ BitVec 32)) (x!6582 (_ BitVec 32))) (Undefined!112) (MissingVacant!112 (index!2573 (_ BitVec 32))) )
))
(declare-fun lt!11462 () SeekEntryResult!112)

(declare-fun contains!333 (ListLongMap!751 (_ BitVec 64)) Bool)

(assert (=> b!30838 (contains!333 lt!11463 (select (arr!943 _keys!1833) (index!2571 lt!11462)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((Unit!713 0))(
  ( (Unit!714) )
))
(declare-fun lt!11461 () Unit!713)

(declare-fun zeroValue!1443 () V!1675)

(declare-fun minValue!1443 () V!1675)

(declare-fun lemmaValidKeyInArrayIsInListMap!46 (array!1979 array!1981 (_ BitVec 32) (_ BitVec 32) V!1675 V!1675 (_ BitVec 32) Int) Unit!713)

(assert (=> b!30838 (= lt!11461 (lemmaValidKeyInArrayIsInListMap!46 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2571 lt!11462) defaultEntry!1504))))

(declare-fun b!30839 () Bool)

(declare-fun res!18635 () Bool)

(declare-fun e!19749 () Bool)

(assert (=> b!30839 (=> (not res!18635) (not e!19749))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30839 (= res!18635 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30840 () Bool)

(declare-fun res!18641 () Bool)

(assert (=> b!30840 (=> (not res!18641) (not e!19750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30840 (= res!18641 (validKeyInArray!0 k0!1304))))

(declare-fun b!30841 () Bool)

(declare-fun e!19747 () Bool)

(assert (=> b!30841 (= e!19747 tp_is_empty!1387)))

(declare-fun res!18636 () Bool)

(assert (=> start!4124 (=> (not res!18636) (not e!19750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4124 (= res!18636 (validMask!0 mask!2294))))

(assert (=> start!4124 e!19750))

(assert (=> start!4124 true))

(assert (=> start!4124 tp!4518))

(declare-fun e!19748 () Bool)

(declare-fun array_inv!649 (array!1981) Bool)

(assert (=> start!4124 (and (array_inv!649 _values!1501) e!19748)))

(declare-fun array_inv!650 (array!1979) Bool)

(assert (=> start!4124 (array_inv!650 _keys!1833)))

(assert (=> start!4124 tp_is_empty!1387))

(declare-fun b!30834 () Bool)

(assert (=> b!30834 (= e!19750 e!19749)))

(declare-fun res!18637 () Bool)

(assert (=> b!30834 (=> (not res!18637) (not e!19749))))

(assert (=> b!30834 (= res!18637 (not (contains!333 lt!11463 k0!1304)))))

(declare-fun getCurrentListMap!216 (array!1979 array!1981 (_ BitVec 32) (_ BitVec 32) V!1675 V!1675 (_ BitVec 32) Int) ListLongMap!751)

(assert (=> b!30834 (= lt!11463 (getCurrentListMap!216 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapNonEmpty!1609 () Bool)

(declare-fun mapRes!1609 () Bool)

(declare-fun tp!4519 () Bool)

(assert (=> mapNonEmpty!1609 (= mapRes!1609 (and tp!4519 e!19747))))

(declare-fun mapKey!1609 () (_ BitVec 32))

(declare-fun mapRest!1609 () (Array (_ BitVec 32) ValueCell!494))

(declare-fun mapValue!1609 () ValueCell!494)

(assert (=> mapNonEmpty!1609 (= (arr!944 _values!1501) (store mapRest!1609 mapKey!1609 mapValue!1609))))

(declare-fun mapIsEmpty!1609 () Bool)

(assert (=> mapIsEmpty!1609 mapRes!1609))

(declare-fun b!30842 () Bool)

(assert (=> b!30842 (= e!19749 e!19745)))

(declare-fun res!18638 () Bool)

(assert (=> b!30842 (=> (not res!18638) (not e!19745))))

(get-info :version)

(assert (=> b!30842 (= res!18638 ((_ is Found!112) lt!11462))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1979 (_ BitVec 32)) SeekEntryResult!112)

(assert (=> b!30842 (= lt!11462 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30843 () Bool)

(assert (=> b!30843 (= e!19748 (and e!19744 mapRes!1609))))

(declare-fun condMapEmpty!1609 () Bool)

(declare-fun mapDefault!1609 () ValueCell!494)

(assert (=> b!30843 (= condMapEmpty!1609 (= (arr!944 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!494)) mapDefault!1609)))))

(assert (= (and start!4124 res!18636) b!30836))

(assert (= (and b!30836 res!18634) b!30837))

(assert (= (and b!30837 res!18639) b!30835))

(assert (= (and b!30835 res!18640) b!30840))

(assert (= (and b!30840 res!18641) b!30834))

(assert (= (and b!30834 res!18637) b!30839))

(assert (= (and b!30839 res!18635) b!30842))

(assert (= (and b!30842 res!18638) b!30838))

(assert (= (and b!30843 condMapEmpty!1609) mapIsEmpty!1609))

(assert (= (and b!30843 (not condMapEmpty!1609)) mapNonEmpty!1609))

(assert (= (and mapNonEmpty!1609 ((_ is ValueCellFull!494) mapValue!1609)) b!30841))

(assert (= (and b!30843 ((_ is ValueCellFull!494) mapDefault!1609)) b!30833))

(assert (= start!4124 b!30843))

(declare-fun m!24665 () Bool)

(assert (=> b!30834 m!24665))

(declare-fun m!24667 () Bool)

(assert (=> b!30834 m!24667))

(declare-fun m!24669 () Bool)

(assert (=> b!30837 m!24669))

(declare-fun m!24671 () Bool)

(assert (=> b!30835 m!24671))

(declare-fun m!24673 () Bool)

(assert (=> start!4124 m!24673))

(declare-fun m!24675 () Bool)

(assert (=> start!4124 m!24675))

(declare-fun m!24677 () Bool)

(assert (=> start!4124 m!24677))

(declare-fun m!24679 () Bool)

(assert (=> mapNonEmpty!1609 m!24679))

(declare-fun m!24681 () Bool)

(assert (=> b!30839 m!24681))

(declare-fun m!24683 () Bool)

(assert (=> b!30838 m!24683))

(assert (=> b!30838 m!24683))

(declare-fun m!24685 () Bool)

(assert (=> b!30838 m!24685))

(declare-fun m!24687 () Bool)

(assert (=> b!30838 m!24687))

(declare-fun m!24689 () Bool)

(assert (=> b!30840 m!24689))

(declare-fun m!24691 () Bool)

(assert (=> b!30842 m!24691))

(check-sat (not b!30842) (not b!30834) (not b!30837) (not b_next!1033) (not b!30840) (not b!30838) (not b!30839) b_and!1833 (not start!4124) tp_is_empty!1387 (not b!30835) (not mapNonEmpty!1609))
(check-sat b_and!1833 (not b_next!1033))
