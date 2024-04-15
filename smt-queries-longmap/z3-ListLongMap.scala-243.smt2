; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4130 () Bool)

(assert start!4130)

(declare-fun b_free!1045 () Bool)

(declare-fun b_next!1045 () Bool)

(assert (=> start!4130 (= b_free!1045 (not b_next!1045))))

(declare-fun tp!4555 () Bool)

(declare-fun b_and!1849 () Bool)

(assert (=> start!4130 (= tp!4555 b_and!1849)))

(declare-fun b!31040 () Bool)

(declare-fun res!18778 () Bool)

(declare-fun e!19859 () Bool)

(assert (=> b!31040 (=> (not res!18778) (not e!19859))))

(declare-datatypes ((array!1991 0))(
  ( (array!1992 (arr!949 (Array (_ BitVec 32) (_ BitVec 64))) (size!1050 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1991)

(declare-datatypes ((List!774 0))(
  ( (Nil!771) (Cons!770 (h!1337 (_ BitVec 64)) (t!3460 List!774)) )
))
(declare-fun arrayNoDuplicates!0 (array!1991 (_ BitVec 32) List!774) Bool)

(assert (=> b!31040 (= res!18778 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!771))))

(declare-fun mapIsEmpty!1627 () Bool)

(declare-fun mapRes!1627 () Bool)

(assert (=> mapIsEmpty!1627 mapRes!1627))

(declare-fun mapNonEmpty!1627 () Bool)

(declare-fun tp!4554 () Bool)

(declare-fun e!19857 () Bool)

(assert (=> mapNonEmpty!1627 (= mapRes!1627 (and tp!4554 e!19857))))

(declare-datatypes ((V!1691 0))(
  ( (V!1692 (val!726 Int)) )
))
(declare-datatypes ((ValueCell!500 0))(
  ( (ValueCellFull!500 (v!1814 V!1691)) (EmptyCell!500) )
))
(declare-fun mapValue!1627 () ValueCell!500)

(declare-datatypes ((array!1993 0))(
  ( (array!1994 (arr!950 (Array (_ BitVec 32) ValueCell!500)) (size!1051 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1993)

(declare-fun mapRest!1627 () (Array (_ BitVec 32) ValueCell!500))

(declare-fun mapKey!1627 () (_ BitVec 32))

(assert (=> mapNonEmpty!1627 (= (arr!950 _values!1501) (store mapRest!1627 mapKey!1627 mapValue!1627))))

(declare-fun b!31041 () Bool)

(declare-fun tp_is_empty!1399 () Bool)

(assert (=> b!31041 (= e!19857 tp_is_empty!1399)))

(declare-fun b!31042 () Bool)

(declare-fun e!19861 () Bool)

(assert (=> b!31042 (= e!19861 tp_is_empty!1399)))

(declare-fun b!31043 () Bool)

(declare-fun res!18781 () Bool)

(assert (=> b!31043 (=> (not res!18781) (not e!19859))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1991 (_ BitVec 32)) Bool)

(assert (=> b!31043 (= res!18781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31044 () Bool)

(declare-fun res!18780 () Bool)

(assert (=> b!31044 (=> (not res!18780) (not e!19859))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31044 (= res!18780 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!31045 () Bool)

(declare-fun res!18782 () Bool)

(assert (=> b!31045 (=> (not res!18782) (not e!19859))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31045 (= res!18782 (and (= (size!1051 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1050 _keys!1833) (size!1051 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31046 () Bool)

(assert (=> b!31046 (= e!19859 (not (= (size!1050 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun b!31047 () Bool)

(declare-fun res!18779 () Bool)

(assert (=> b!31047 (=> (not res!18779) (not e!19859))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1691)

(declare-fun minValue!1443 () V!1691)

(declare-datatypes ((tuple2!1192 0))(
  ( (tuple2!1193 (_1!607 (_ BitVec 64)) (_2!607 V!1691)) )
))
(declare-datatypes ((List!775 0))(
  ( (Nil!772) (Cons!771 (h!1338 tuple2!1192) (t!3461 List!775)) )
))
(declare-datatypes ((ListLongMap!757 0))(
  ( (ListLongMap!758 (toList!394 List!775)) )
))
(declare-fun contains!335 (ListLongMap!757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!217 (array!1991 array!1993 (_ BitVec 32) (_ BitVec 32) V!1691 V!1691 (_ BitVec 32) Int) ListLongMap!757)

(assert (=> b!31047 (= res!18779 (not (contains!335 (getCurrentListMap!217 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31048 () Bool)

(declare-fun res!18783 () Bool)

(assert (=> b!31048 (=> (not res!18783) (not e!19859))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!122 0))(
  ( (MissingZero!122 (index!2610 (_ BitVec 32))) (Found!122 (index!2611 (_ BitVec 32))) (Intermediate!122 (undefined!934 Bool) (index!2612 (_ BitVec 32)) (x!6608 (_ BitVec 32))) (Undefined!122) (MissingVacant!122 (index!2613 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!1991 (_ BitVec 32)) SeekEntryResult!122)

(assert (=> b!31048 (= res!18783 (not ((_ is Found!122) (seekEntry!0 k0!1304 _keys!1833 mask!2294))))))

(declare-fun b!31049 () Bool)

(declare-fun e!19858 () Bool)

(assert (=> b!31049 (= e!19858 (and e!19861 mapRes!1627))))

(declare-fun condMapEmpty!1627 () Bool)

(declare-fun mapDefault!1627 () ValueCell!500)

(assert (=> b!31049 (= condMapEmpty!1627 (= (arr!950 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!500)) mapDefault!1627)))))

(declare-fun b!31050 () Bool)

(declare-fun res!18784 () Bool)

(assert (=> b!31050 (=> (not res!18784) (not e!19859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31050 (= res!18784 (validKeyInArray!0 k0!1304))))

(declare-fun res!18777 () Bool)

(assert (=> start!4130 (=> (not res!18777) (not e!19859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4130 (= res!18777 (validMask!0 mask!2294))))

(assert (=> start!4130 e!19859))

(assert (=> start!4130 true))

(assert (=> start!4130 tp!4555))

(declare-fun array_inv!665 (array!1993) Bool)

(assert (=> start!4130 (and (array_inv!665 _values!1501) e!19858)))

(declare-fun array_inv!666 (array!1991) Bool)

(assert (=> start!4130 (array_inv!666 _keys!1833)))

(assert (=> start!4130 tp_is_empty!1399))

(assert (= (and start!4130 res!18777) b!31045))

(assert (= (and b!31045 res!18782) b!31043))

(assert (= (and b!31043 res!18781) b!31040))

(assert (= (and b!31040 res!18778) b!31050))

(assert (= (and b!31050 res!18784) b!31047))

(assert (= (and b!31047 res!18779) b!31044))

(assert (= (and b!31044 res!18780) b!31048))

(assert (= (and b!31048 res!18783) b!31046))

(assert (= (and b!31049 condMapEmpty!1627) mapIsEmpty!1627))

(assert (= (and b!31049 (not condMapEmpty!1627)) mapNonEmpty!1627))

(assert (= (and mapNonEmpty!1627 ((_ is ValueCellFull!500) mapValue!1627)) b!31041))

(assert (= (and b!31049 ((_ is ValueCellFull!500) mapDefault!1627)) b!31042))

(assert (= start!4130 b!31049))

(declare-fun m!24897 () Bool)

(assert (=> mapNonEmpty!1627 m!24897))

(declare-fun m!24899 () Bool)

(assert (=> b!31047 m!24899))

(assert (=> b!31047 m!24899))

(declare-fun m!24901 () Bool)

(assert (=> b!31047 m!24901))

(declare-fun m!24903 () Bool)

(assert (=> b!31043 m!24903))

(declare-fun m!24905 () Bool)

(assert (=> start!4130 m!24905))

(declare-fun m!24907 () Bool)

(assert (=> start!4130 m!24907))

(declare-fun m!24909 () Bool)

(assert (=> start!4130 m!24909))

(declare-fun m!24911 () Bool)

(assert (=> b!31050 m!24911))

(declare-fun m!24913 () Bool)

(assert (=> b!31044 m!24913))

(declare-fun m!24915 () Bool)

(assert (=> b!31048 m!24915))

(declare-fun m!24917 () Bool)

(assert (=> b!31040 m!24917))

(check-sat (not b_next!1045) b_and!1849 (not b!31044) (not mapNonEmpty!1627) (not b!31043) (not b!31050) (not b!31040) (not b!31047) (not start!4130) (not b!31048) tp_is_empty!1399)
(check-sat b_and!1849 (not b_next!1045))
