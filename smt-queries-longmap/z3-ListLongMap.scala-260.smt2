; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4272 () Bool)

(assert start!4272)

(declare-fun b_free!1147 () Bool)

(declare-fun b_next!1147 () Bool)

(assert (=> start!4272 (= b_free!1147 (not b_next!1147))))

(declare-fun tp!4866 () Bool)

(declare-fun b_and!1955 () Bool)

(assert (=> start!4272 (= tp!4866 b_and!1955)))

(declare-fun b!32774 () Bool)

(declare-fun e!20817 () Bool)

(declare-fun e!20818 () Bool)

(declare-fun mapRes!1786 () Bool)

(assert (=> b!32774 (= e!20817 (and e!20818 mapRes!1786))))

(declare-fun condMapEmpty!1786 () Bool)

(declare-datatypes ((V!1827 0))(
  ( (V!1828 (val!777 Int)) )
))
(declare-datatypes ((ValueCell!551 0))(
  ( (ValueCellFull!551 (v!1867 V!1827)) (EmptyCell!551) )
))
(declare-datatypes ((array!2189 0))(
  ( (array!2190 (arr!1046 (Array (_ BitVec 32) ValueCell!551)) (size!1147 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2189)

(declare-fun mapDefault!1786 () ValueCell!551)

(assert (=> b!32774 (= condMapEmpty!1786 (= (arr!1046 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!551)) mapDefault!1786)))))

(declare-fun b!32775 () Bool)

(declare-fun res!19913 () Bool)

(declare-fun e!20815 () Bool)

(assert (=> b!32775 (=> (not res!19913) (not e!20815))))

(declare-datatypes ((array!2191 0))(
  ( (array!2192 (arr!1047 (Array (_ BitVec 32) (_ BitVec 64))) (size!1148 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2191)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2191 (_ BitVec 32)) Bool)

(assert (=> b!32775 (= res!19913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32776 () Bool)

(declare-fun tp_is_empty!1501 () Bool)

(assert (=> b!32776 (= e!20818 tp_is_empty!1501)))

(declare-fun mapNonEmpty!1786 () Bool)

(declare-fun tp!4867 () Bool)

(declare-fun e!20814 () Bool)

(assert (=> mapNonEmpty!1786 (= mapRes!1786 (and tp!4867 e!20814))))

(declare-fun mapRest!1786 () (Array (_ BitVec 32) ValueCell!551))

(declare-fun mapKey!1786 () (_ BitVec 32))

(declare-fun mapValue!1786 () ValueCell!551)

(assert (=> mapNonEmpty!1786 (= (arr!1046 _values!1501) (store mapRest!1786 mapKey!1786 mapValue!1786))))

(declare-fun b!32777 () Bool)

(declare-fun e!20816 () Bool)

(assert (=> b!32777 (= e!20816 (not true))))

(declare-datatypes ((tuple2!1266 0))(
  ( (tuple2!1267 (_1!644 (_ BitVec 64)) (_2!644 V!1827)) )
))
(declare-datatypes ((List!847 0))(
  ( (Nil!844) (Cons!843 (h!1410 tuple2!1266) (t!3537 List!847)) )
))
(declare-datatypes ((ListLongMap!831 0))(
  ( (ListLongMap!832 (toList!431 List!847)) )
))
(declare-fun lt!11899 () ListLongMap!831)

(declare-fun lt!11898 () (_ BitVec 32))

(declare-fun contains!374 (ListLongMap!831 (_ BitVec 64)) Bool)

(assert (=> b!32777 (contains!374 lt!11899 (select (arr!1047 _keys!1833) lt!11898))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!724 0))(
  ( (Unit!725) )
))
(declare-fun lt!11897 () Unit!724)

(declare-fun zeroValue!1443 () V!1827)

(declare-fun minValue!1443 () V!1827)

(declare-fun lemmaValidKeyInArrayIsInListMap!48 (array!2191 array!2189 (_ BitVec 32) (_ BitVec 32) V!1827 V!1827 (_ BitVec 32) Int) Unit!724)

(assert (=> b!32777 (= lt!11897 (lemmaValidKeyInArrayIsInListMap!48 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11898 defaultEntry!1504))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2191 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32777 (= lt!11898 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32779 () Bool)

(assert (=> b!32779 (= e!20815 e!20816)))

(declare-fun res!19915 () Bool)

(assert (=> b!32779 (=> (not res!19915) (not e!20816))))

(assert (=> b!32779 (= res!19915 (not (contains!374 lt!11899 k0!1304)))))

(declare-fun getCurrentListMap!253 (array!2191 array!2189 (_ BitVec 32) (_ BitVec 32) V!1827 V!1827 (_ BitVec 32) Int) ListLongMap!831)

(assert (=> b!32779 (= lt!11899 (getCurrentListMap!253 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32780 () Bool)

(declare-fun res!19914 () Bool)

(assert (=> b!32780 (=> (not res!19914) (not e!20815))))

(declare-datatypes ((List!848 0))(
  ( (Nil!845) (Cons!844 (h!1411 (_ BitVec 64)) (t!3538 List!848)) )
))
(declare-fun arrayNoDuplicates!0 (array!2191 (_ BitVec 32) List!848) Bool)

(assert (=> b!32780 (= res!19914 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!845))))

(declare-fun b!32781 () Bool)

(declare-fun res!19916 () Bool)

(assert (=> b!32781 (=> (not res!19916) (not e!20815))))

(assert (=> b!32781 (= res!19916 (and (= (size!1147 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1148 _keys!1833) (size!1147 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32782 () Bool)

(declare-fun res!19917 () Bool)

(assert (=> b!32782 (=> (not res!19917) (not e!20815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32782 (= res!19917 (validKeyInArray!0 k0!1304))))

(declare-fun res!19912 () Bool)

(assert (=> start!4272 (=> (not res!19912) (not e!20815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4272 (= res!19912 (validMask!0 mask!2294))))

(assert (=> start!4272 e!20815))

(assert (=> start!4272 true))

(assert (=> start!4272 tp!4866))

(declare-fun array_inv!739 (array!2189) Bool)

(assert (=> start!4272 (and (array_inv!739 _values!1501) e!20817)))

(declare-fun array_inv!740 (array!2191) Bool)

(assert (=> start!4272 (array_inv!740 _keys!1833)))

(assert (=> start!4272 tp_is_empty!1501))

(declare-fun b!32778 () Bool)

(declare-fun res!19918 () Bool)

(assert (=> b!32778 (=> (not res!19918) (not e!20816))))

(declare-fun arrayContainsKey!0 (array!2191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32778 (= res!19918 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32783 () Bool)

(assert (=> b!32783 (= e!20814 tp_is_empty!1501)))

(declare-fun mapIsEmpty!1786 () Bool)

(assert (=> mapIsEmpty!1786 mapRes!1786))

(assert (= (and start!4272 res!19912) b!32781))

(assert (= (and b!32781 res!19916) b!32775))

(assert (= (and b!32775 res!19913) b!32780))

(assert (= (and b!32780 res!19914) b!32782))

(assert (= (and b!32782 res!19917) b!32779))

(assert (= (and b!32779 res!19915) b!32778))

(assert (= (and b!32778 res!19918) b!32777))

(assert (= (and b!32774 condMapEmpty!1786) mapIsEmpty!1786))

(assert (= (and b!32774 (not condMapEmpty!1786)) mapNonEmpty!1786))

(get-info :version)

(assert (= (and mapNonEmpty!1786 ((_ is ValueCellFull!551) mapValue!1786)) b!32783))

(assert (= (and b!32774 ((_ is ValueCellFull!551) mapDefault!1786)) b!32776))

(assert (= start!4272 b!32774))

(declare-fun m!26203 () Bool)

(assert (=> b!32775 m!26203))

(declare-fun m!26205 () Bool)

(assert (=> b!32777 m!26205))

(assert (=> b!32777 m!26205))

(declare-fun m!26207 () Bool)

(assert (=> b!32777 m!26207))

(declare-fun m!26209 () Bool)

(assert (=> b!32777 m!26209))

(declare-fun m!26211 () Bool)

(assert (=> b!32777 m!26211))

(declare-fun m!26213 () Bool)

(assert (=> mapNonEmpty!1786 m!26213))

(declare-fun m!26215 () Bool)

(assert (=> b!32778 m!26215))

(declare-fun m!26217 () Bool)

(assert (=> start!4272 m!26217))

(declare-fun m!26219 () Bool)

(assert (=> start!4272 m!26219))

(declare-fun m!26221 () Bool)

(assert (=> start!4272 m!26221))

(declare-fun m!26223 () Bool)

(assert (=> b!32780 m!26223))

(declare-fun m!26225 () Bool)

(assert (=> b!32782 m!26225))

(declare-fun m!26227 () Bool)

(assert (=> b!32779 m!26227))

(declare-fun m!26229 () Bool)

(assert (=> b!32779 m!26229))

(check-sat (not b!32778) (not b!32775) (not start!4272) (not b!32777) (not b_next!1147) tp_is_empty!1501 (not b!32782) b_and!1955 (not b!32779) (not b!32780) (not mapNonEmpty!1786))
(check-sat b_and!1955 (not b_next!1147))
