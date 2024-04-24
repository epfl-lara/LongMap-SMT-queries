; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4118 () Bool)

(assert start!4118)

(declare-fun b_free!1027 () Bool)

(declare-fun b_next!1027 () Bool)

(assert (=> start!4118 (= b_free!1027 (not b_next!1027))))

(declare-fun tp!4500 () Bool)

(declare-fun b_and!1827 () Bool)

(assert (=> start!4118 (= tp!4500 b_and!1827)))

(declare-fun b!30734 () Bool)

(declare-fun e!19686 () Bool)

(assert (=> b!30734 (= e!19686 (not true))))

(declare-datatypes ((V!1667 0))(
  ( (V!1668 (val!717 Int)) )
))
(declare-datatypes ((tuple2!1176 0))(
  ( (tuple2!1177 (_1!599 (_ BitVec 64)) (_2!599 V!1667)) )
))
(declare-datatypes ((List!769 0))(
  ( (Nil!766) (Cons!765 (h!1332 tuple2!1176) (t!3456 List!769)) )
))
(declare-datatypes ((ListLongMap!747 0))(
  ( (ListLongMap!748 (toList!389 List!769)) )
))
(declare-fun lt!11434 () ListLongMap!747)

(declare-datatypes ((array!1967 0))(
  ( (array!1968 (arr!937 (Array (_ BitVec 32) (_ BitVec 64))) (size!1038 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1967)

(declare-datatypes ((SeekEntryResult!109 0))(
  ( (MissingZero!109 (index!2558 (_ BitVec 32))) (Found!109 (index!2559 (_ BitVec 32))) (Intermediate!109 (undefined!921 Bool) (index!2560 (_ BitVec 32)) (x!6571 (_ BitVec 32))) (Undefined!109) (MissingVacant!109 (index!2561 (_ BitVec 32))) )
))
(declare-fun lt!11436 () SeekEntryResult!109)

(declare-fun contains!331 (ListLongMap!747 (_ BitVec 64)) Bool)

(assert (=> b!30734 (contains!331 lt!11434 (select (arr!937 _keys!1833) (index!2559 lt!11436)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!491 0))(
  ( (ValueCellFull!491 (v!1806 V!1667)) (EmptyCell!491) )
))
(declare-datatypes ((array!1969 0))(
  ( (array!1970 (arr!938 (Array (_ BitVec 32) ValueCell!491)) (size!1039 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1969)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!711 0))(
  ( (Unit!712) )
))
(declare-fun lt!11435 () Unit!711)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1667)

(declare-fun minValue!1443 () V!1667)

(declare-fun lemmaValidKeyInArrayIsInListMap!45 (array!1967 array!1969 (_ BitVec 32) (_ BitVec 32) V!1667 V!1667 (_ BitVec 32) Int) Unit!711)

(assert (=> b!30734 (= lt!11435 (lemmaValidKeyInArrayIsInListMap!45 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2559 lt!11436) defaultEntry!1504))))

(declare-fun b!30735 () Bool)

(declare-fun e!19685 () Bool)

(assert (=> b!30735 (= e!19685 e!19686)))

(declare-fun res!18566 () Bool)

(assert (=> b!30735 (=> (not res!18566) (not e!19686))))

(get-info :version)

(assert (=> b!30735 (= res!18566 ((_ is Found!109) lt!11436))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1967 (_ BitVec 32)) SeekEntryResult!109)

(assert (=> b!30735 (= lt!11436 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30736 () Bool)

(declare-fun res!18564 () Bool)

(declare-fun e!19687 () Bool)

(assert (=> b!30736 (=> (not res!18564) (not e!19687))))

(declare-datatypes ((List!770 0))(
  ( (Nil!767) (Cons!766 (h!1333 (_ BitVec 64)) (t!3457 List!770)) )
))
(declare-fun arrayNoDuplicates!0 (array!1967 (_ BitVec 32) List!770) Bool)

(assert (=> b!30736 (= res!18564 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!767))))

(declare-fun b!30737 () Bool)

(assert (=> b!30737 (= e!19687 e!19685)))

(declare-fun res!18565 () Bool)

(assert (=> b!30737 (=> (not res!18565) (not e!19685))))

(assert (=> b!30737 (= res!18565 (not (contains!331 lt!11434 k0!1304)))))

(declare-fun getCurrentListMap!214 (array!1967 array!1969 (_ BitVec 32) (_ BitVec 32) V!1667 V!1667 (_ BitVec 32) Int) ListLongMap!747)

(assert (=> b!30737 (= lt!11434 (getCurrentListMap!214 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!18568 () Bool)

(assert (=> start!4118 (=> (not res!18568) (not e!19687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4118 (= res!18568 (validMask!0 mask!2294))))

(assert (=> start!4118 e!19687))

(assert (=> start!4118 true))

(assert (=> start!4118 tp!4500))

(declare-fun e!19681 () Bool)

(declare-fun array_inv!645 (array!1969) Bool)

(assert (=> start!4118 (and (array_inv!645 _values!1501) e!19681)))

(declare-fun array_inv!646 (array!1967) Bool)

(assert (=> start!4118 (array_inv!646 _keys!1833)))

(declare-fun tp_is_empty!1381 () Bool)

(assert (=> start!4118 tp_is_empty!1381))

(declare-fun mapNonEmpty!1600 () Bool)

(declare-fun mapRes!1600 () Bool)

(declare-fun tp!4501 () Bool)

(declare-fun e!19683 () Bool)

(assert (=> mapNonEmpty!1600 (= mapRes!1600 (and tp!4501 e!19683))))

(declare-fun mapValue!1600 () ValueCell!491)

(declare-fun mapKey!1600 () (_ BitVec 32))

(declare-fun mapRest!1600 () (Array (_ BitVec 32) ValueCell!491))

(assert (=> mapNonEmpty!1600 (= (arr!938 _values!1501) (store mapRest!1600 mapKey!1600 mapValue!1600))))

(declare-fun b!30738 () Bool)

(declare-fun res!18562 () Bool)

(assert (=> b!30738 (=> (not res!18562) (not e!19687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30738 (= res!18562 (validKeyInArray!0 k0!1304))))

(declare-fun b!30739 () Bool)

(declare-fun e!19682 () Bool)

(assert (=> b!30739 (= e!19681 (and e!19682 mapRes!1600))))

(declare-fun condMapEmpty!1600 () Bool)

(declare-fun mapDefault!1600 () ValueCell!491)

(assert (=> b!30739 (= condMapEmpty!1600 (= (arr!938 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!491)) mapDefault!1600)))))

(declare-fun b!30740 () Bool)

(assert (=> b!30740 (= e!19682 tp_is_empty!1381)))

(declare-fun b!30741 () Bool)

(declare-fun res!18567 () Bool)

(assert (=> b!30741 (=> (not res!18567) (not e!19687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1967 (_ BitVec 32)) Bool)

(assert (=> b!30741 (= res!18567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1600 () Bool)

(assert (=> mapIsEmpty!1600 mapRes!1600))

(declare-fun b!30742 () Bool)

(declare-fun res!18569 () Bool)

(assert (=> b!30742 (=> (not res!18569) (not e!19687))))

(assert (=> b!30742 (= res!18569 (and (= (size!1039 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1038 _keys!1833) (size!1039 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30743 () Bool)

(declare-fun res!18563 () Bool)

(assert (=> b!30743 (=> (not res!18563) (not e!19685))))

(declare-fun arrayContainsKey!0 (array!1967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30743 (= res!18563 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30744 () Bool)

(assert (=> b!30744 (= e!19683 tp_is_empty!1381)))

(assert (= (and start!4118 res!18568) b!30742))

(assert (= (and b!30742 res!18569) b!30741))

(assert (= (and b!30741 res!18567) b!30736))

(assert (= (and b!30736 res!18564) b!30738))

(assert (= (and b!30738 res!18562) b!30737))

(assert (= (and b!30737 res!18565) b!30743))

(assert (= (and b!30743 res!18563) b!30735))

(assert (= (and b!30735 res!18566) b!30734))

(assert (= (and b!30739 condMapEmpty!1600) mapIsEmpty!1600))

(assert (= (and b!30739 (not condMapEmpty!1600)) mapNonEmpty!1600))

(assert (= (and mapNonEmpty!1600 ((_ is ValueCellFull!491) mapValue!1600)) b!30744))

(assert (= (and b!30739 ((_ is ValueCellFull!491) mapDefault!1600)) b!30740))

(assert (= start!4118 b!30739))

(declare-fun m!24581 () Bool)

(assert (=> b!30738 m!24581))

(declare-fun m!24583 () Bool)

(assert (=> mapNonEmpty!1600 m!24583))

(declare-fun m!24585 () Bool)

(assert (=> start!4118 m!24585))

(declare-fun m!24587 () Bool)

(assert (=> start!4118 m!24587))

(declare-fun m!24589 () Bool)

(assert (=> start!4118 m!24589))

(declare-fun m!24591 () Bool)

(assert (=> b!30743 m!24591))

(declare-fun m!24593 () Bool)

(assert (=> b!30735 m!24593))

(declare-fun m!24595 () Bool)

(assert (=> b!30734 m!24595))

(assert (=> b!30734 m!24595))

(declare-fun m!24597 () Bool)

(assert (=> b!30734 m!24597))

(declare-fun m!24599 () Bool)

(assert (=> b!30734 m!24599))

(declare-fun m!24601 () Bool)

(assert (=> b!30736 m!24601))

(declare-fun m!24603 () Bool)

(assert (=> b!30741 m!24603))

(declare-fun m!24605 () Bool)

(assert (=> b!30737 m!24605))

(declare-fun m!24607 () Bool)

(assert (=> b!30737 m!24607))

(check-sat tp_is_empty!1381 (not b!30743) (not b_next!1027) (not mapNonEmpty!1600) (not b!30734) (not b!30735) (not b!30738) (not b!30741) (not b!30737) (not start!4118) (not b!30736) b_and!1827)
(check-sat b_and!1827 (not b_next!1027))
