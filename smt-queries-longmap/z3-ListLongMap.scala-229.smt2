; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4058 () Bool)

(assert start!4058)

(declare-fun b_free!963 () Bool)

(declare-fun b_next!963 () Bool)

(assert (=> start!4058 (= b_free!963 (not b_next!963))))

(declare-fun tp!4309 () Bool)

(declare-fun b_and!1773 () Bool)

(assert (=> start!4058 (= tp!4309 b_and!1773)))

(declare-fun b!29835 () Bool)

(declare-fun e!19234 () Bool)

(assert (=> b!29835 (= e!19234 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((array!1865 0))(
  ( (array!1866 (arr!886 (Array (_ BitVec 32) (_ BitVec 64))) (size!987 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1865)

(declare-datatypes ((SeekEntryResult!91 0))(
  ( (MissingZero!91 (index!2486 (_ BitVec 32))) (Found!91 (index!2487 (_ BitVec 32))) (Intermediate!91 (undefined!903 Bool) (index!2488 (_ BitVec 32)) (x!6465 (_ BitVec 32))) (Undefined!91) (MissingVacant!91 (index!2489 (_ BitVec 32))) )
))
(declare-fun lt!11360 () SeekEntryResult!91)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1865 (_ BitVec 32)) SeekEntryResult!91)

(assert (=> b!29835 (= lt!11360 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!29836 () Bool)

(declare-fun e!19231 () Bool)

(declare-fun tp_is_empty!1317 () Bool)

(assert (=> b!29836 (= e!19231 tp_is_empty!1317)))

(declare-fun b!29837 () Bool)

(declare-fun res!17921 () Bool)

(assert (=> b!29837 (=> (not res!17921) (not e!19234))))

(declare-fun arrayContainsKey!0 (array!1865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29837 (= res!17921 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29838 () Bool)

(declare-fun e!19235 () Bool)

(assert (=> b!29838 (= e!19235 tp_is_empty!1317)))

(declare-fun b!29839 () Bool)

(declare-fun res!17924 () Bool)

(assert (=> b!29839 (=> (not res!17924) (not e!19234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29839 (= res!17924 (validKeyInArray!0 k0!1304))))

(declare-fun b!29840 () Bool)

(declare-fun res!17925 () Bool)

(assert (=> b!29840 (=> (not res!17925) (not e!19234))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1581 0))(
  ( (V!1582 (val!685 Int)) )
))
(declare-datatypes ((ValueCell!459 0))(
  ( (ValueCellFull!459 (v!1774 V!1581)) (EmptyCell!459) )
))
(declare-datatypes ((array!1867 0))(
  ( (array!1868 (arr!887 (Array (_ BitVec 32) ValueCell!459)) (size!988 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1867)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1581)

(declare-fun minValue!1443 () V!1581)

(declare-datatypes ((tuple2!1136 0))(
  ( (tuple2!1137 (_1!579 (_ BitVec 64)) (_2!579 V!1581)) )
))
(declare-datatypes ((List!733 0))(
  ( (Nil!730) (Cons!729 (h!1296 tuple2!1136) (t!3426 List!733)) )
))
(declare-datatypes ((ListLongMap!713 0))(
  ( (ListLongMap!714 (toList!372 List!733)) )
))
(declare-fun contains!312 (ListLongMap!713 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!200 (array!1865 array!1867 (_ BitVec 32) (_ BitVec 32) V!1581 V!1581 (_ BitVec 32) Int) ListLongMap!713)

(assert (=> b!29840 (= res!17925 (not (contains!312 (getCurrentListMap!200 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!17923 () Bool)

(assert (=> start!4058 (=> (not res!17923) (not e!19234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4058 (= res!17923 (validMask!0 mask!2294))))

(assert (=> start!4058 e!19234))

(assert (=> start!4058 true))

(assert (=> start!4058 tp!4309))

(declare-fun e!19232 () Bool)

(declare-fun array_inv!617 (array!1867) Bool)

(assert (=> start!4058 (and (array_inv!617 _values!1501) e!19232)))

(declare-fun array_inv!618 (array!1865) Bool)

(assert (=> start!4058 (array_inv!618 _keys!1833)))

(assert (=> start!4058 tp_is_empty!1317))

(declare-fun mapIsEmpty!1504 () Bool)

(declare-fun mapRes!1504 () Bool)

(assert (=> mapIsEmpty!1504 mapRes!1504))

(declare-fun b!29841 () Bool)

(declare-fun res!17919 () Bool)

(assert (=> b!29841 (=> (not res!17919) (not e!19234))))

(assert (=> b!29841 (= res!17919 (and (= (size!988 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!987 _keys!1833) (size!988 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29842 () Bool)

(declare-fun res!17922 () Bool)

(assert (=> b!29842 (=> (not res!17922) (not e!19234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1865 (_ BitVec 32)) Bool)

(assert (=> b!29842 (= res!17922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29843 () Bool)

(assert (=> b!29843 (= e!19232 (and e!19235 mapRes!1504))))

(declare-fun condMapEmpty!1504 () Bool)

(declare-fun mapDefault!1504 () ValueCell!459)

(assert (=> b!29843 (= condMapEmpty!1504 (= (arr!887 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!459)) mapDefault!1504)))))

(declare-fun b!29844 () Bool)

(declare-fun res!17920 () Bool)

(assert (=> b!29844 (=> (not res!17920) (not e!19234))))

(declare-datatypes ((List!734 0))(
  ( (Nil!731) (Cons!730 (h!1297 (_ BitVec 64)) (t!3427 List!734)) )
))
(declare-fun arrayNoDuplicates!0 (array!1865 (_ BitVec 32) List!734) Bool)

(assert (=> b!29844 (= res!17920 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!731))))

(declare-fun mapNonEmpty!1504 () Bool)

(declare-fun tp!4308 () Bool)

(assert (=> mapNonEmpty!1504 (= mapRes!1504 (and tp!4308 e!19231))))

(declare-fun mapRest!1504 () (Array (_ BitVec 32) ValueCell!459))

(declare-fun mapValue!1504 () ValueCell!459)

(declare-fun mapKey!1504 () (_ BitVec 32))

(assert (=> mapNonEmpty!1504 (= (arr!887 _values!1501) (store mapRest!1504 mapKey!1504 mapValue!1504))))

(assert (= (and start!4058 res!17923) b!29841))

(assert (= (and b!29841 res!17919) b!29842))

(assert (= (and b!29842 res!17922) b!29844))

(assert (= (and b!29844 res!17920) b!29839))

(assert (= (and b!29839 res!17924) b!29840))

(assert (= (and b!29840 res!17925) b!29837))

(assert (= (and b!29837 res!17921) b!29835))

(assert (= (and b!29843 condMapEmpty!1504) mapIsEmpty!1504))

(assert (= (and b!29843 (not condMapEmpty!1504)) mapNonEmpty!1504))

(get-info :version)

(assert (= (and mapNonEmpty!1504 ((_ is ValueCellFull!459) mapValue!1504)) b!29836))

(assert (= (and b!29843 ((_ is ValueCellFull!459) mapDefault!1504)) b!29838))

(assert (= start!4058 b!29843))

(declare-fun m!24011 () Bool)

(assert (=> b!29837 m!24011))

(declare-fun m!24013 () Bool)

(assert (=> start!4058 m!24013))

(declare-fun m!24015 () Bool)

(assert (=> start!4058 m!24015))

(declare-fun m!24017 () Bool)

(assert (=> start!4058 m!24017))

(declare-fun m!24019 () Bool)

(assert (=> b!29840 m!24019))

(assert (=> b!29840 m!24019))

(declare-fun m!24021 () Bool)

(assert (=> b!29840 m!24021))

(declare-fun m!24023 () Bool)

(assert (=> b!29842 m!24023))

(declare-fun m!24025 () Bool)

(assert (=> b!29839 m!24025))

(declare-fun m!24027 () Bool)

(assert (=> b!29835 m!24027))

(declare-fun m!24029 () Bool)

(assert (=> b!29844 m!24029))

(declare-fun m!24031 () Bool)

(assert (=> mapNonEmpty!1504 m!24031))

(check-sat (not b!29844) tp_is_empty!1317 (not start!4058) (not b_next!963) (not b!29839) (not b!29840) b_and!1773 (not b!29837) (not mapNonEmpty!1504) (not b!29835) (not b!29842))
(check-sat b_and!1773 (not b_next!963))
