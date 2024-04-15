; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4478 () Bool)

(assert start!4478)

(declare-fun b_free!1249 () Bool)

(declare-fun b_next!1249 () Bool)

(assert (=> start!4478 (= b_free!1249 (not b_next!1249))))

(declare-fun tp!5184 () Bool)

(declare-fun b_and!2065 () Bool)

(assert (=> start!4478 (= tp!5184 b_and!2065)))

(declare-fun mapNonEmpty!1951 () Bool)

(declare-fun mapRes!1951 () Bool)

(declare-fun tp!5185 () Bool)

(declare-fun e!22060 () Bool)

(assert (=> mapNonEmpty!1951 (= mapRes!1951 (and tp!5185 e!22060))))

(declare-datatypes ((V!1963 0))(
  ( (V!1964 (val!828 Int)) )
))
(declare-datatypes ((ValueCell!602 0))(
  ( (ValueCellFull!602 (v!1922 V!1963)) (EmptyCell!602) )
))
(declare-datatypes ((array!2391 0))(
  ( (array!2392 (arr!1143 (Array (_ BitVec 32) ValueCell!602)) (size!1244 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2391)

(declare-fun mapValue!1951 () ValueCell!602)

(declare-fun mapKey!1951 () (_ BitVec 32))

(declare-fun mapRest!1951 () (Array (_ BitVec 32) ValueCell!602))

(assert (=> mapNonEmpty!1951 (= (arr!1143 _values!1501) (store mapRest!1951 mapKey!1951 mapValue!1951))))

(declare-fun b!34897 () Bool)

(declare-fun res!21215 () Bool)

(declare-fun e!22058 () Bool)

(assert (=> b!34897 (=> (not res!21215) (not e!22058))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((array!2393 0))(
  ( (array!2394 (arr!1144 (Array (_ BitVec 32) (_ BitVec 64))) (size!1245 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2393)

(assert (=> b!34897 (= res!21215 (and (= (size!1244 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1245 _keys!1833) (size!1244 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!21220 () Bool)

(assert (=> start!4478 (=> (not res!21220) (not e!22058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4478 (= res!21220 (validMask!0 mask!2294))))

(assert (=> start!4478 e!22058))

(assert (=> start!4478 true))

(assert (=> start!4478 tp!5184))

(declare-fun e!22059 () Bool)

(declare-fun array_inv!805 (array!2391) Bool)

(assert (=> start!4478 (and (array_inv!805 _values!1501) e!22059)))

(declare-fun array_inv!806 (array!2393) Bool)

(assert (=> start!4478 (array_inv!806 _keys!1833)))

(declare-fun tp_is_empty!1603 () Bool)

(assert (=> start!4478 tp_is_empty!1603))

(declare-fun b!34898 () Bool)

(declare-fun e!22061 () Bool)

(assert (=> b!34898 (= e!22061 tp_is_empty!1603)))

(declare-fun b!34899 () Bool)

(assert (=> b!34899 (= e!22058 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!158 0))(
  ( (MissingZero!158 (index!2754 (_ BitVec 32))) (Found!158 (index!2755 (_ BitVec 32))) (Intermediate!158 (undefined!970 Bool) (index!2756 (_ BitVec 32)) (x!6976 (_ BitVec 32))) (Undefined!158) (MissingVacant!158 (index!2757 (_ BitVec 32))) )
))
(declare-fun lt!12827 () SeekEntryResult!158)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2393 (_ BitVec 32)) SeekEntryResult!158)

(assert (=> b!34899 (= lt!12827 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34900 () Bool)

(assert (=> b!34900 (= e!22059 (and e!22061 mapRes!1951))))

(declare-fun condMapEmpty!1951 () Bool)

(declare-fun mapDefault!1951 () ValueCell!602)

(assert (=> b!34900 (= condMapEmpty!1951 (= (arr!1143 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!602)) mapDefault!1951)))))

(declare-fun b!34901 () Bool)

(assert (=> b!34901 (= e!22060 tp_is_empty!1603)))

(declare-fun b!34902 () Bool)

(declare-fun res!21218 () Bool)

(assert (=> b!34902 (=> (not res!21218) (not e!22058))))

(declare-datatypes ((List!915 0))(
  ( (Nil!912) (Cons!911 (h!1478 (_ BitVec 64)) (t!3613 List!915)) )
))
(declare-fun arrayNoDuplicates!0 (array!2393 (_ BitVec 32) List!915) Bool)

(assert (=> b!34902 (= res!21218 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!912))))

(declare-fun b!34903 () Bool)

(declare-fun res!21219 () Bool)

(assert (=> b!34903 (=> (not res!21219) (not e!22058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2393 (_ BitVec 32)) Bool)

(assert (=> b!34903 (= res!21219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1951 () Bool)

(assert (=> mapIsEmpty!1951 mapRes!1951))

(declare-fun b!34904 () Bool)

(declare-fun res!21214 () Bool)

(assert (=> b!34904 (=> (not res!21214) (not e!22058))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1963)

(declare-fun minValue!1443 () V!1963)

(declare-datatypes ((tuple2!1332 0))(
  ( (tuple2!1333 (_1!677 (_ BitVec 64)) (_2!677 V!1963)) )
))
(declare-datatypes ((List!916 0))(
  ( (Nil!913) (Cons!912 (h!1479 tuple2!1332) (t!3614 List!916)) )
))
(declare-datatypes ((ListLongMap!897 0))(
  ( (ListLongMap!898 (toList!464 List!916)) )
))
(declare-fun contains!411 (ListLongMap!897 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!283 (array!2393 array!2391 (_ BitVec 32) (_ BitVec 32) V!1963 V!1963 (_ BitVec 32) Int) ListLongMap!897)

(assert (=> b!34904 (= res!21214 (not (contains!411 (getCurrentListMap!283 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34905 () Bool)

(declare-fun res!21216 () Bool)

(assert (=> b!34905 (=> (not res!21216) (not e!22058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34905 (= res!21216 (validKeyInArray!0 k0!1304))))

(declare-fun b!34906 () Bool)

(declare-fun res!21217 () Bool)

(assert (=> b!34906 (=> (not res!21217) (not e!22058))))

(declare-fun arrayContainsKey!0 (array!2393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34906 (= res!21217 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(assert (= (and start!4478 res!21220) b!34897))

(assert (= (and b!34897 res!21215) b!34903))

(assert (= (and b!34903 res!21219) b!34902))

(assert (= (and b!34902 res!21218) b!34905))

(assert (= (and b!34905 res!21216) b!34904))

(assert (= (and b!34904 res!21214) b!34906))

(assert (= (and b!34906 res!21217) b!34899))

(assert (= (and b!34900 condMapEmpty!1951) mapIsEmpty!1951))

(assert (= (and b!34900 (not condMapEmpty!1951)) mapNonEmpty!1951))

(get-info :version)

(assert (= (and mapNonEmpty!1951 ((_ is ValueCellFull!602) mapValue!1951)) b!34901))

(assert (= (and b!34900 ((_ is ValueCellFull!602) mapDefault!1951)) b!34898))

(assert (= start!4478 b!34900))

(declare-fun m!28073 () Bool)

(assert (=> b!34902 m!28073))

(declare-fun m!28075 () Bool)

(assert (=> b!34905 m!28075))

(declare-fun m!28077 () Bool)

(assert (=> b!34899 m!28077))

(declare-fun m!28079 () Bool)

(assert (=> start!4478 m!28079))

(declare-fun m!28081 () Bool)

(assert (=> start!4478 m!28081))

(declare-fun m!28083 () Bool)

(assert (=> start!4478 m!28083))

(declare-fun m!28085 () Bool)

(assert (=> mapNonEmpty!1951 m!28085))

(declare-fun m!28087 () Bool)

(assert (=> b!34903 m!28087))

(declare-fun m!28089 () Bool)

(assert (=> b!34904 m!28089))

(assert (=> b!34904 m!28089))

(declare-fun m!28091 () Bool)

(assert (=> b!34904 m!28091))

(declare-fun m!28093 () Bool)

(assert (=> b!34906 m!28093))

(check-sat (not b!34903) (not b_next!1249) (not b!34906) b_and!2065 (not mapNonEmpty!1951) (not b!34902) (not b!34899) (not start!4478) tp_is_empty!1603 (not b!34904) (not b!34905))
(check-sat b_and!2065 (not b_next!1249))
