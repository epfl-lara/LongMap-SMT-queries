; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4484 () Bool)

(assert start!4484)

(declare-fun b_free!1249 () Bool)

(declare-fun b_next!1249 () Bool)

(assert (=> start!4484 (= b_free!1249 (not b_next!1249))))

(declare-fun tp!5184 () Bool)

(declare-fun b_and!2061 () Bool)

(assert (=> start!4484 (= tp!5184 b_and!2061)))

(declare-fun b!34879 () Bool)

(declare-fun res!21211 () Bool)

(declare-fun e!22049 () Bool)

(assert (=> b!34879 (=> (not res!21211) (not e!22049))))

(declare-datatypes ((array!2401 0))(
  ( (array!2402 (arr!1148 (Array (_ BitVec 32) (_ BitVec 64))) (size!1249 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2401)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34879 (= res!21211 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34880 () Bool)

(declare-fun res!21208 () Bool)

(assert (=> b!34880 (=> (not res!21208) (not e!22049))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2401 (_ BitVec 32)) Bool)

(assert (=> b!34880 (= res!21208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1951 () Bool)

(declare-fun mapRes!1951 () Bool)

(assert (=> mapIsEmpty!1951 mapRes!1951))

(declare-fun b!34881 () Bool)

(declare-fun e!22051 () Bool)

(declare-fun tp_is_empty!1603 () Bool)

(assert (=> b!34881 (= e!22051 tp_is_empty!1603)))

(declare-fun b!34882 () Bool)

(declare-fun e!22053 () Bool)

(assert (=> b!34882 (= e!22053 (and e!22051 mapRes!1951))))

(declare-fun condMapEmpty!1951 () Bool)

(declare-datatypes ((V!1963 0))(
  ( (V!1964 (val!828 Int)) )
))
(declare-datatypes ((ValueCell!602 0))(
  ( (ValueCellFull!602 (v!1923 V!1963)) (EmptyCell!602) )
))
(declare-datatypes ((array!2403 0))(
  ( (array!2404 (arr!1149 (Array (_ BitVec 32) ValueCell!602)) (size!1250 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2403)

(declare-fun mapDefault!1951 () ValueCell!602)

(assert (=> b!34882 (= condMapEmpty!1951 (= (arr!1149 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!602)) mapDefault!1951)))))

(declare-fun b!34883 () Bool)

(declare-fun res!21209 () Bool)

(assert (=> b!34883 (=> (not res!21209) (not e!22049))))

(declare-datatypes ((List!909 0))(
  ( (Nil!906) (Cons!905 (h!1472 (_ BitVec 64)) (t!3608 List!909)) )
))
(declare-fun arrayNoDuplicates!0 (array!2401 (_ BitVec 32) List!909) Bool)

(assert (=> b!34883 (= res!21209 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!906))))

(declare-fun b!34884 () Bool)

(declare-fun res!21207 () Bool)

(assert (=> b!34884 (=> (not res!21207) (not e!22049))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1963)

(declare-fun minValue!1443 () V!1963)

(declare-datatypes ((tuple2!1314 0))(
  ( (tuple2!1315 (_1!668 (_ BitVec 64)) (_2!668 V!1963)) )
))
(declare-datatypes ((List!910 0))(
  ( (Nil!907) (Cons!906 (h!1473 tuple2!1314) (t!3609 List!910)) )
))
(declare-datatypes ((ListLongMap!885 0))(
  ( (ListLongMap!886 (toList!458 List!910)) )
))
(declare-fun contains!406 (ListLongMap!885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!279 (array!2401 array!2403 (_ BitVec 32) (_ BitVec 32) V!1963 V!1963 (_ BitVec 32) Int) ListLongMap!885)

(assert (=> b!34884 (= res!21207 (not (contains!406 (getCurrentListMap!279 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34885 () Bool)

(declare-fun e!22052 () Bool)

(assert (=> b!34885 (= e!22052 tp_is_empty!1603)))

(declare-fun b!34886 () Bool)

(declare-fun res!21212 () Bool)

(assert (=> b!34886 (=> (not res!21212) (not e!22049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34886 (= res!21212 (validKeyInArray!0 k0!1304))))

(declare-fun b!34887 () Bool)

(declare-fun res!21206 () Bool)

(assert (=> b!34887 (=> (not res!21206) (not e!22049))))

(assert (=> b!34887 (= res!21206 (and (= (size!1250 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1249 _keys!1833) (size!1250 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1951 () Bool)

(declare-fun tp!5185 () Bool)

(assert (=> mapNonEmpty!1951 (= mapRes!1951 (and tp!5185 e!22052))))

(declare-fun mapValue!1951 () ValueCell!602)

(declare-fun mapRest!1951 () (Array (_ BitVec 32) ValueCell!602))

(declare-fun mapKey!1951 () (_ BitVec 32))

(assert (=> mapNonEmpty!1951 (= (arr!1149 _values!1501) (store mapRest!1951 mapKey!1951 mapValue!1951))))

(declare-fun b!34888 () Bool)

(assert (=> b!34888 (= e!22049 false)))

(declare-datatypes ((SeekEntryResult!144 0))(
  ( (MissingZero!144 (index!2698 (_ BitVec 32))) (Found!144 (index!2699 (_ BitVec 32))) (Intermediate!144 (undefined!956 Bool) (index!2700 (_ BitVec 32)) (x!6962 (_ BitVec 32))) (Undefined!144) (MissingVacant!144 (index!2701 (_ BitVec 32))) )
))
(declare-fun lt!12787 () SeekEntryResult!144)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2401 (_ BitVec 32)) SeekEntryResult!144)

(assert (=> b!34888 (= lt!12787 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!21210 () Bool)

(assert (=> start!4484 (=> (not res!21210) (not e!22049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4484 (= res!21210 (validMask!0 mask!2294))))

(assert (=> start!4484 e!22049))

(assert (=> start!4484 true))

(assert (=> start!4484 tp!5184))

(declare-fun array_inv!785 (array!2403) Bool)

(assert (=> start!4484 (and (array_inv!785 _values!1501) e!22053)))

(declare-fun array_inv!786 (array!2401) Bool)

(assert (=> start!4484 (array_inv!786 _keys!1833)))

(assert (=> start!4484 tp_is_empty!1603))

(assert (= (and start!4484 res!21210) b!34887))

(assert (= (and b!34887 res!21206) b!34880))

(assert (= (and b!34880 res!21208) b!34883))

(assert (= (and b!34883 res!21209) b!34886))

(assert (= (and b!34886 res!21212) b!34884))

(assert (= (and b!34884 res!21207) b!34879))

(assert (= (and b!34879 res!21211) b!34888))

(assert (= (and b!34882 condMapEmpty!1951) mapIsEmpty!1951))

(assert (= (and b!34882 (not condMapEmpty!1951)) mapNonEmpty!1951))

(get-info :version)

(assert (= (and mapNonEmpty!1951 ((_ is ValueCellFull!602) mapValue!1951)) b!34885))

(assert (= (and b!34882 ((_ is ValueCellFull!602) mapDefault!1951)) b!34881))

(assert (= start!4484 b!34882))

(declare-fun m!27991 () Bool)

(assert (=> b!34886 m!27991))

(declare-fun m!27993 () Bool)

(assert (=> b!34883 m!27993))

(declare-fun m!27995 () Bool)

(assert (=> b!34888 m!27995))

(declare-fun m!27997 () Bool)

(assert (=> b!34879 m!27997))

(declare-fun m!27999 () Bool)

(assert (=> start!4484 m!27999))

(declare-fun m!28001 () Bool)

(assert (=> start!4484 m!28001))

(declare-fun m!28003 () Bool)

(assert (=> start!4484 m!28003))

(declare-fun m!28005 () Bool)

(assert (=> b!34880 m!28005))

(declare-fun m!28007 () Bool)

(assert (=> mapNonEmpty!1951 m!28007))

(declare-fun m!28009 () Bool)

(assert (=> b!34884 m!28009))

(assert (=> b!34884 m!28009))

(declare-fun m!28011 () Bool)

(assert (=> b!34884 m!28011))

(check-sat (not b!34886) (not b_next!1249) (not b!34884) (not mapNonEmpty!1951) (not b!34888) (not start!4484) b_and!2061 (not b!34880) (not b!34879) tp_is_empty!1603 (not b!34883))
(check-sat b_and!2061 (not b_next!1249))
