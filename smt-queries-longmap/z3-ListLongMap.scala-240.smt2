; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4112 () Bool)

(assert start!4112)

(declare-fun b_free!1027 () Bool)

(declare-fun b_next!1027 () Bool)

(assert (=> start!4112 (= b_free!1027 (not b_next!1027))))

(declare-fun tp!4501 () Bool)

(declare-fun b_and!1831 () Bool)

(assert (=> start!4112 (= tp!4501 b_and!1831)))

(declare-fun b!30752 () Bool)

(declare-fun e!19693 () Bool)

(declare-fun e!19690 () Bool)

(declare-fun mapRes!1600 () Bool)

(assert (=> b!30752 (= e!19693 (and e!19690 mapRes!1600))))

(declare-fun condMapEmpty!1600 () Bool)

(declare-datatypes ((V!1667 0))(
  ( (V!1668 (val!717 Int)) )
))
(declare-datatypes ((ValueCell!491 0))(
  ( (ValueCellFull!491 (v!1805 V!1667)) (EmptyCell!491) )
))
(declare-datatypes ((array!1959 0))(
  ( (array!1960 (arr!933 (Array (_ BitVec 32) ValueCell!491)) (size!1034 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1959)

(declare-fun mapDefault!1600 () ValueCell!491)

(assert (=> b!30752 (= condMapEmpty!1600 (= (arr!933 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!491)) mapDefault!1600)))))

(declare-fun mapNonEmpty!1600 () Bool)

(declare-fun tp!4500 () Bool)

(declare-fun e!19692 () Bool)

(assert (=> mapNonEmpty!1600 (= mapRes!1600 (and tp!4500 e!19692))))

(declare-fun mapRest!1600 () (Array (_ BitVec 32) ValueCell!491))

(declare-fun mapKey!1600 () (_ BitVec 32))

(declare-fun mapValue!1600 () ValueCell!491)

(assert (=> mapNonEmpty!1600 (= (arr!933 _values!1501) (store mapRest!1600 mapKey!1600 mapValue!1600))))

(declare-fun b!30753 () Bool)

(declare-fun res!18577 () Bool)

(declare-fun e!19696 () Bool)

(assert (=> b!30753 (=> (not res!18577) (not e!19696))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30753 (= res!18577 (validKeyInArray!0 k0!1304))))

(declare-fun b!30754 () Bool)

(declare-fun res!18576 () Bool)

(assert (=> b!30754 (=> (not res!18576) (not e!19696))))

(declare-datatypes ((array!1961 0))(
  ( (array!1962 (arr!934 (Array (_ BitVec 32) (_ BitVec 64))) (size!1035 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1961)

(declare-datatypes ((List!764 0))(
  ( (Nil!761) (Cons!760 (h!1327 (_ BitVec 64)) (t!3450 List!764)) )
))
(declare-fun arrayNoDuplicates!0 (array!1961 (_ BitVec 32) List!764) Bool)

(assert (=> b!30754 (= res!18576 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!761))))

(declare-fun mapIsEmpty!1600 () Bool)

(assert (=> mapIsEmpty!1600 mapRes!1600))

(declare-fun b!30755 () Bool)

(declare-fun res!18573 () Bool)

(assert (=> b!30755 (=> (not res!18573) (not e!19696))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1961 (_ BitVec 32)) Bool)

(assert (=> b!30755 (= res!18573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30756 () Bool)

(declare-fun e!19694 () Bool)

(declare-fun e!19695 () Bool)

(assert (=> b!30756 (= e!19694 e!19695)))

(declare-fun res!18570 () Bool)

(assert (=> b!30756 (=> (not res!18570) (not e!19695))))

(declare-datatypes ((SeekEntryResult!116 0))(
  ( (MissingZero!116 (index!2586 (_ BitVec 32))) (Found!116 (index!2587 (_ BitVec 32))) (Intermediate!116 (undefined!928 Bool) (index!2588 (_ BitVec 32)) (x!6578 (_ BitVec 32))) (Undefined!116) (MissingVacant!116 (index!2589 (_ BitVec 32))) )
))
(declare-fun lt!11476 () SeekEntryResult!116)

(get-info :version)

(assert (=> b!30756 (= res!18570 ((_ is Found!116) lt!11476))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1961 (_ BitVec 32)) SeekEntryResult!116)

(assert (=> b!30756 (= lt!11476 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30757 () Bool)

(declare-fun tp_is_empty!1381 () Bool)

(assert (=> b!30757 (= e!19692 tp_is_empty!1381)))

(declare-fun b!30758 () Bool)

(assert (=> b!30758 (= e!19690 tp_is_empty!1381)))

(declare-fun b!30759 () Bool)

(declare-fun res!18571 () Bool)

(assert (=> b!30759 (=> (not res!18571) (not e!19696))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30759 (= res!18571 (and (= (size!1034 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1035 _keys!1833) (size!1034 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!18575 () Bool)

(assert (=> start!4112 (=> (not res!18575) (not e!19696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4112 (= res!18575 (validMask!0 mask!2294))))

(assert (=> start!4112 e!19696))

(assert (=> start!4112 true))

(assert (=> start!4112 tp!4501))

(declare-fun array_inv!651 (array!1959) Bool)

(assert (=> start!4112 (and (array_inv!651 _values!1501) e!19693)))

(declare-fun array_inv!652 (array!1961) Bool)

(assert (=> start!4112 (array_inv!652 _keys!1833)))

(assert (=> start!4112 tp_is_empty!1381))

(declare-fun b!30760 () Bool)

(declare-fun res!18574 () Bool)

(assert (=> b!30760 (=> (not res!18574) (not e!19694))))

(declare-fun arrayContainsKey!0 (array!1961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30760 (= res!18574 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30761 () Bool)

(assert (=> b!30761 (= e!19696 e!19694)))

(declare-fun res!18572 () Bool)

(assert (=> b!30761 (=> (not res!18572) (not e!19694))))

(declare-datatypes ((tuple2!1182 0))(
  ( (tuple2!1183 (_1!602 (_ BitVec 64)) (_2!602 V!1667)) )
))
(declare-datatypes ((List!765 0))(
  ( (Nil!762) (Cons!761 (h!1328 tuple2!1182) (t!3451 List!765)) )
))
(declare-datatypes ((ListLongMap!747 0))(
  ( (ListLongMap!748 (toList!389 List!765)) )
))
(declare-fun lt!11474 () ListLongMap!747)

(declare-fun contains!330 (ListLongMap!747 (_ BitVec 64)) Bool)

(assert (=> b!30761 (= res!18572 (not (contains!330 lt!11474 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1667)

(declare-fun minValue!1443 () V!1667)

(declare-fun getCurrentListMap!213 (array!1961 array!1959 (_ BitVec 32) (_ BitVec 32) V!1667 V!1667 (_ BitVec 32) Int) ListLongMap!747)

(assert (=> b!30761 (= lt!11474 (getCurrentListMap!213 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!30762 () Bool)

(assert (=> b!30762 (= e!19695 (not true))))

(assert (=> b!30762 (contains!330 lt!11474 (select (arr!934 _keys!1833) (index!2587 lt!11476)))))

(declare-datatypes ((Unit!700 0))(
  ( (Unit!701) )
))
(declare-fun lt!11475 () Unit!700)

(declare-fun lemmaValidKeyInArrayIsInListMap!40 (array!1961 array!1959 (_ BitVec 32) (_ BitVec 32) V!1667 V!1667 (_ BitVec 32) Int) Unit!700)

(assert (=> b!30762 (= lt!11475 (lemmaValidKeyInArrayIsInListMap!40 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2587 lt!11476) defaultEntry!1504))))

(assert (= (and start!4112 res!18575) b!30759))

(assert (= (and b!30759 res!18571) b!30755))

(assert (= (and b!30755 res!18573) b!30754))

(assert (= (and b!30754 res!18576) b!30753))

(assert (= (and b!30753 res!18577) b!30761))

(assert (= (and b!30761 res!18572) b!30760))

(assert (= (and b!30760 res!18574) b!30756))

(assert (= (and b!30756 res!18570) b!30762))

(assert (= (and b!30752 condMapEmpty!1600) mapIsEmpty!1600))

(assert (= (and b!30752 (not condMapEmpty!1600)) mapNonEmpty!1600))

(assert (= (and mapNonEmpty!1600 ((_ is ValueCellFull!491) mapValue!1600)) b!30757))

(assert (= (and b!30752 ((_ is ValueCellFull!491) mapDefault!1600)) b!30758))

(assert (= start!4112 b!30752))

(declare-fun m!24663 () Bool)

(assert (=> b!30753 m!24663))

(declare-fun m!24665 () Bool)

(assert (=> b!30760 m!24665))

(declare-fun m!24667 () Bool)

(assert (=> b!30761 m!24667))

(declare-fun m!24669 () Bool)

(assert (=> b!30761 m!24669))

(declare-fun m!24671 () Bool)

(assert (=> mapNonEmpty!1600 m!24671))

(declare-fun m!24673 () Bool)

(assert (=> b!30762 m!24673))

(assert (=> b!30762 m!24673))

(declare-fun m!24675 () Bool)

(assert (=> b!30762 m!24675))

(declare-fun m!24677 () Bool)

(assert (=> b!30762 m!24677))

(declare-fun m!24679 () Bool)

(assert (=> start!4112 m!24679))

(declare-fun m!24681 () Bool)

(assert (=> start!4112 m!24681))

(declare-fun m!24683 () Bool)

(assert (=> start!4112 m!24683))

(declare-fun m!24685 () Bool)

(assert (=> b!30755 m!24685))

(declare-fun m!24687 () Bool)

(assert (=> b!30754 m!24687))

(declare-fun m!24689 () Bool)

(assert (=> b!30756 m!24689))

(check-sat (not b_next!1027) (not b!30761) (not b!30754) (not b!30760) (not b!30762) (not b!30756) (not b!30753) (not b!30755) tp_is_empty!1381 (not mapNonEmpty!1600) (not start!4112) b_and!1831)
(check-sat b_and!1831 (not b_next!1027))
