; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4278 () Bool)

(assert start!4278)

(declare-fun b_free!1147 () Bool)

(declare-fun b_next!1147 () Bool)

(assert (=> start!4278 (= b_free!1147 (not b_next!1147))))

(declare-fun tp!4867 () Bool)

(declare-fun b_and!1951 () Bool)

(assert (=> start!4278 (= tp!4867 b_and!1951)))

(declare-fun res!19905 () Bool)

(declare-fun e!20808 () Bool)

(assert (=> start!4278 (=> (not res!19905) (not e!20808))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4278 (= res!19905 (validMask!0 mask!2294))))

(assert (=> start!4278 e!20808))

(assert (=> start!4278 true))

(assert (=> start!4278 tp!4867))

(declare-datatypes ((V!1827 0))(
  ( (V!1828 (val!777 Int)) )
))
(declare-datatypes ((ValueCell!551 0))(
  ( (ValueCellFull!551 (v!1868 V!1827)) (EmptyCell!551) )
))
(declare-datatypes ((array!2203 0))(
  ( (array!2204 (arr!1053 (Array (_ BitVec 32) ValueCell!551)) (size!1154 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2203)

(declare-fun e!20809 () Bool)

(declare-fun array_inv!723 (array!2203) Bool)

(assert (=> start!4278 (and (array_inv!723 _values!1501) e!20809)))

(declare-datatypes ((array!2205 0))(
  ( (array!2206 (arr!1054 (Array (_ BitVec 32) (_ BitVec 64))) (size!1155 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2205)

(declare-fun array_inv!724 (array!2205) Bool)

(assert (=> start!4278 (array_inv!724 _keys!1833)))

(declare-fun tp_is_empty!1501 () Bool)

(assert (=> start!4278 tp_is_empty!1501))

(declare-fun b!32756 () Bool)

(declare-fun e!20804 () Bool)

(declare-fun mapRes!1786 () Bool)

(assert (=> b!32756 (= e!20809 (and e!20804 mapRes!1786))))

(declare-fun condMapEmpty!1786 () Bool)

(declare-fun mapDefault!1786 () ValueCell!551)

(assert (=> b!32756 (= condMapEmpty!1786 (= (arr!1053 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!551)) mapDefault!1786)))))

(declare-fun b!32757 () Bool)

(assert (=> b!32757 (= e!20804 tp_is_empty!1501)))

(declare-fun b!32758 () Bool)

(declare-fun res!19904 () Bool)

(assert (=> b!32758 (=> (not res!19904) (not e!20808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2205 (_ BitVec 32)) Bool)

(assert (=> b!32758 (= res!19904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1786 () Bool)

(declare-fun tp!4866 () Bool)

(declare-fun e!20807 () Bool)

(assert (=> mapNonEmpty!1786 (= mapRes!1786 (and tp!4866 e!20807))))

(declare-fun mapRest!1786 () (Array (_ BitVec 32) ValueCell!551))

(declare-fun mapValue!1786 () ValueCell!551)

(declare-fun mapKey!1786 () (_ BitVec 32))

(assert (=> mapNonEmpty!1786 (= (arr!1053 _values!1501) (store mapRest!1786 mapKey!1786 mapValue!1786))))

(declare-fun mapIsEmpty!1786 () Bool)

(assert (=> mapIsEmpty!1786 mapRes!1786))

(declare-fun b!32759 () Bool)

(assert (=> b!32759 (= e!20807 tp_is_empty!1501)))

(declare-fun b!32760 () Bool)

(declare-fun res!19909 () Bool)

(assert (=> b!32760 (=> (not res!19909) (not e!20808))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!32760 (= res!19909 (and (= (size!1154 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1155 _keys!1833) (size!1154 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32761 () Bool)

(declare-fun res!19907 () Bool)

(declare-fun e!20805 () Bool)

(assert (=> b!32761 (=> (not res!19907) (not e!20805))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32761 (= res!19907 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32762 () Bool)

(declare-fun res!19906 () Bool)

(assert (=> b!32762 (=> (not res!19906) (not e!20808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32762 (= res!19906 (validKeyInArray!0 k0!1304))))

(declare-fun b!32763 () Bool)

(assert (=> b!32763 (= e!20808 e!20805)))

(declare-fun res!19910 () Bool)

(assert (=> b!32763 (=> (not res!19910) (not e!20805))))

(declare-datatypes ((tuple2!1252 0))(
  ( (tuple2!1253 (_1!637 (_ BitVec 64)) (_2!637 V!1827)) )
))
(declare-datatypes ((List!847 0))(
  ( (Nil!844) (Cons!843 (h!1410 tuple2!1252) (t!3538 List!847)) )
))
(declare-datatypes ((ListLongMap!823 0))(
  ( (ListLongMap!824 (toList!427 List!847)) )
))
(declare-fun lt!11859 () ListLongMap!823)

(declare-fun contains!371 (ListLongMap!823 (_ BitVec 64)) Bool)

(assert (=> b!32763 (= res!19910 (not (contains!371 lt!11859 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1827)

(declare-fun minValue!1443 () V!1827)

(declare-fun getCurrentListMap!251 (array!2205 array!2203 (_ BitVec 32) (_ BitVec 32) V!1827 V!1827 (_ BitVec 32) Int) ListLongMap!823)

(assert (=> b!32763 (= lt!11859 (getCurrentListMap!251 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32764 () Bool)

(declare-fun res!19908 () Bool)

(assert (=> b!32764 (=> (not res!19908) (not e!20808))))

(declare-datatypes ((List!848 0))(
  ( (Nil!845) (Cons!844 (h!1411 (_ BitVec 64)) (t!3539 List!848)) )
))
(declare-fun arrayNoDuplicates!0 (array!2205 (_ BitVec 32) List!848) Bool)

(assert (=> b!32764 (= res!19908 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!845))))

(declare-fun b!32765 () Bool)

(assert (=> b!32765 (= e!20805 (not true))))

(declare-fun lt!11858 () (_ BitVec 32))

(assert (=> b!32765 (contains!371 lt!11859 (select (arr!1054 _keys!1833) lt!11858))))

(declare-datatypes ((Unit!731 0))(
  ( (Unit!732) )
))
(declare-fun lt!11857 () Unit!731)

(declare-fun lemmaValidKeyInArrayIsInListMap!51 (array!2205 array!2203 (_ BitVec 32) (_ BitVec 32) V!1827 V!1827 (_ BitVec 32) Int) Unit!731)

(assert (=> b!32765 (= lt!11857 (lemmaValidKeyInArrayIsInListMap!51 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11858 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2205 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32765 (= lt!11858 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!4278 res!19905) b!32760))

(assert (= (and b!32760 res!19909) b!32758))

(assert (= (and b!32758 res!19904) b!32764))

(assert (= (and b!32764 res!19908) b!32762))

(assert (= (and b!32762 res!19906) b!32763))

(assert (= (and b!32763 res!19910) b!32761))

(assert (= (and b!32761 res!19907) b!32765))

(assert (= (and b!32756 condMapEmpty!1786) mapIsEmpty!1786))

(assert (= (and b!32756 (not condMapEmpty!1786)) mapNonEmpty!1786))

(get-info :version)

(assert (= (and mapNonEmpty!1786 ((_ is ValueCellFull!551) mapValue!1786)) b!32759))

(assert (= (and b!32756 ((_ is ValueCellFull!551) mapDefault!1786)) b!32757))

(assert (= start!4278 b!32756))

(declare-fun m!26121 () Bool)

(assert (=> mapNonEmpty!1786 m!26121))

(declare-fun m!26123 () Bool)

(assert (=> b!32765 m!26123))

(assert (=> b!32765 m!26123))

(declare-fun m!26125 () Bool)

(assert (=> b!32765 m!26125))

(declare-fun m!26127 () Bool)

(assert (=> b!32765 m!26127))

(declare-fun m!26129 () Bool)

(assert (=> b!32765 m!26129))

(declare-fun m!26131 () Bool)

(assert (=> b!32762 m!26131))

(declare-fun m!26133 () Bool)

(assert (=> b!32761 m!26133))

(declare-fun m!26135 () Bool)

(assert (=> b!32764 m!26135))

(declare-fun m!26137 () Bool)

(assert (=> b!32758 m!26137))

(declare-fun m!26139 () Bool)

(assert (=> start!4278 m!26139))

(declare-fun m!26141 () Bool)

(assert (=> start!4278 m!26141))

(declare-fun m!26143 () Bool)

(assert (=> start!4278 m!26143))

(declare-fun m!26145 () Bool)

(assert (=> b!32763 m!26145))

(declare-fun m!26147 () Bool)

(assert (=> b!32763 m!26147))

(check-sat (not b!32761) (not b!32764) (not b!32758) (not b!32765) (not b_next!1147) tp_is_empty!1501 (not start!4278) (not b!32762) (not mapNonEmpty!1786) b_and!1951 (not b!32763))
(check-sat b_and!1951 (not b_next!1147))
