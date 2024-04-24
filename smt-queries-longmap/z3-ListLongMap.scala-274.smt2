; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4466 () Bool)

(assert start!4466)

(declare-fun b_free!1231 () Bool)

(declare-fun b_next!1231 () Bool)

(assert (=> start!4466 (= b_free!1231 (not b_next!1231))))

(declare-fun tp!5130 () Bool)

(declare-fun b_and!2043 () Bool)

(assert (=> start!4466 (= tp!5130 b_and!2043)))

(declare-fun b!34609 () Bool)

(declare-fun e!21916 () Bool)

(declare-fun e!21914 () Bool)

(declare-fun mapRes!1924 () Bool)

(assert (=> b!34609 (= e!21916 (and e!21914 mapRes!1924))))

(declare-fun condMapEmpty!1924 () Bool)

(declare-datatypes ((V!1939 0))(
  ( (V!1940 (val!819 Int)) )
))
(declare-datatypes ((ValueCell!593 0))(
  ( (ValueCellFull!593 (v!1914 V!1939)) (EmptyCell!593) )
))
(declare-datatypes ((array!2367 0))(
  ( (array!2368 (arr!1131 (Array (_ BitVec 32) ValueCell!593)) (size!1232 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2367)

(declare-fun mapDefault!1924 () ValueCell!593)

(assert (=> b!34609 (= condMapEmpty!1924 (= (arr!1131 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!593)) mapDefault!1924)))))

(declare-fun b!34610 () Bool)

(declare-fun e!21918 () Bool)

(assert (=> b!34610 (= e!21918 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!139 0))(
  ( (MissingZero!139 (index!2678 (_ BitVec 32))) (Found!139 (index!2679 (_ BitVec 32))) (Intermediate!139 (undefined!951 Bool) (index!2680 (_ BitVec 32)) (x!6933 (_ BitVec 32))) (Undefined!139) (MissingVacant!139 (index!2681 (_ BitVec 32))) )
))
(declare-fun lt!12760 () SeekEntryResult!139)

(declare-datatypes ((array!2369 0))(
  ( (array!2370 (arr!1132 (Array (_ BitVec 32) (_ BitVec 64))) (size!1233 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2369)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2369 (_ BitVec 32)) SeekEntryResult!139)

(assert (=> b!34610 (= lt!12760 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34611 () Bool)

(declare-fun res!21017 () Bool)

(assert (=> b!34611 (=> (not res!21017) (not e!21918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34611 (= res!21017 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1924 () Bool)

(assert (=> mapIsEmpty!1924 mapRes!1924))

(declare-fun b!34612 () Bool)

(declare-fun res!21023 () Bool)

(assert (=> b!34612 (=> (not res!21023) (not e!21918))))

(declare-fun arrayContainsKey!0 (array!2369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34612 (= res!21023 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34613 () Bool)

(declare-fun res!21022 () Bool)

(assert (=> b!34613 (=> (not res!21022) (not e!21918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2369 (_ BitVec 32)) Bool)

(assert (=> b!34613 (= res!21022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34614 () Bool)

(declare-fun res!21018 () Bool)

(assert (=> b!34614 (=> (not res!21018) (not e!21918))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1939)

(declare-fun minValue!1443 () V!1939)

(declare-datatypes ((tuple2!1304 0))(
  ( (tuple2!1305 (_1!663 (_ BitVec 64)) (_2!663 V!1939)) )
))
(declare-datatypes ((List!898 0))(
  ( (Nil!895) (Cons!894 (h!1461 tuple2!1304) (t!3597 List!898)) )
))
(declare-datatypes ((ListLongMap!875 0))(
  ( (ListLongMap!876 (toList!453 List!898)) )
))
(declare-fun contains!401 (ListLongMap!875 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!274 (array!2369 array!2367 (_ BitVec 32) (_ BitVec 32) V!1939 V!1939 (_ BitVec 32) Int) ListLongMap!875)

(assert (=> b!34614 (= res!21018 (not (contains!401 (getCurrentListMap!274 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!21021 () Bool)

(assert (=> start!4466 (=> (not res!21021) (not e!21918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4466 (= res!21021 (validMask!0 mask!2294))))

(assert (=> start!4466 e!21918))

(assert (=> start!4466 true))

(assert (=> start!4466 tp!5130))

(declare-fun array_inv!775 (array!2367) Bool)

(assert (=> start!4466 (and (array_inv!775 _values!1501) e!21916)))

(declare-fun array_inv!776 (array!2369) Bool)

(assert (=> start!4466 (array_inv!776 _keys!1833)))

(declare-fun tp_is_empty!1585 () Bool)

(assert (=> start!4466 tp_is_empty!1585))

(declare-fun b!34615 () Bool)

(declare-fun res!21020 () Bool)

(assert (=> b!34615 (=> (not res!21020) (not e!21918))))

(assert (=> b!34615 (= res!21020 (and (= (size!1232 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1233 _keys!1833) (size!1232 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34616 () Bool)

(declare-fun e!21915 () Bool)

(assert (=> b!34616 (= e!21915 tp_is_empty!1585)))

(declare-fun mapNonEmpty!1924 () Bool)

(declare-fun tp!5131 () Bool)

(assert (=> mapNonEmpty!1924 (= mapRes!1924 (and tp!5131 e!21915))))

(declare-fun mapRest!1924 () (Array (_ BitVec 32) ValueCell!593))

(declare-fun mapValue!1924 () ValueCell!593)

(declare-fun mapKey!1924 () (_ BitVec 32))

(assert (=> mapNonEmpty!1924 (= (arr!1131 _values!1501) (store mapRest!1924 mapKey!1924 mapValue!1924))))

(declare-fun b!34617 () Bool)

(assert (=> b!34617 (= e!21914 tp_is_empty!1585)))

(declare-fun b!34618 () Bool)

(declare-fun res!21019 () Bool)

(assert (=> b!34618 (=> (not res!21019) (not e!21918))))

(declare-datatypes ((List!899 0))(
  ( (Nil!896) (Cons!895 (h!1462 (_ BitVec 64)) (t!3598 List!899)) )
))
(declare-fun arrayNoDuplicates!0 (array!2369 (_ BitVec 32) List!899) Bool)

(assert (=> b!34618 (= res!21019 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!896))))

(assert (= (and start!4466 res!21021) b!34615))

(assert (= (and b!34615 res!21020) b!34613))

(assert (= (and b!34613 res!21022) b!34618))

(assert (= (and b!34618 res!21019) b!34611))

(assert (= (and b!34611 res!21017) b!34614))

(assert (= (and b!34614 res!21018) b!34612))

(assert (= (and b!34612 res!21023) b!34610))

(assert (= (and b!34609 condMapEmpty!1924) mapIsEmpty!1924))

(assert (= (and b!34609 (not condMapEmpty!1924)) mapNonEmpty!1924))

(get-info :version)

(assert (= (and mapNonEmpty!1924 ((_ is ValueCellFull!593) mapValue!1924)) b!34616))

(assert (= (and b!34609 ((_ is ValueCellFull!593) mapDefault!1924)) b!34617))

(assert (= start!4466 b!34609))

(declare-fun m!27793 () Bool)

(assert (=> b!34611 m!27793))

(declare-fun m!27795 () Bool)

(assert (=> mapNonEmpty!1924 m!27795))

(declare-fun m!27797 () Bool)

(assert (=> start!4466 m!27797))

(declare-fun m!27799 () Bool)

(assert (=> start!4466 m!27799))

(declare-fun m!27801 () Bool)

(assert (=> start!4466 m!27801))

(declare-fun m!27803 () Bool)

(assert (=> b!34614 m!27803))

(assert (=> b!34614 m!27803))

(declare-fun m!27805 () Bool)

(assert (=> b!34614 m!27805))

(declare-fun m!27807 () Bool)

(assert (=> b!34618 m!27807))

(declare-fun m!27809 () Bool)

(assert (=> b!34612 m!27809))

(declare-fun m!27811 () Bool)

(assert (=> b!34613 m!27811))

(declare-fun m!27813 () Bool)

(assert (=> b!34610 m!27813))

(check-sat (not b!34610) (not mapNonEmpty!1924) (not b!34614) (not b!34611) (not b!34612) (not b_next!1231) (not b!34618) tp_is_empty!1585 (not start!4466) (not b!34613) b_and!2043)
(check-sat b_and!2043 (not b_next!1231))
