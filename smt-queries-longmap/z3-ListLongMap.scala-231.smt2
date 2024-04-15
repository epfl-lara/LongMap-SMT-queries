; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4058 () Bool)

(assert start!4058)

(declare-fun b_free!973 () Bool)

(declare-fun b_next!973 () Bool)

(assert (=> start!4058 (= b_free!973 (not b_next!973))))

(declare-fun tp!4339 () Bool)

(declare-fun b_and!1777 () Bool)

(assert (=> start!4058 (= tp!4339 b_and!1777)))

(declare-fun res!17993 () Bool)

(declare-fun e!19263 () Bool)

(assert (=> start!4058 (=> (not res!17993) (not e!19263))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4058 (= res!17993 (validMask!0 mask!2294))))

(assert (=> start!4058 e!19263))

(assert (=> start!4058 true))

(assert (=> start!4058 tp!4339))

(declare-datatypes ((V!1595 0))(
  ( (V!1596 (val!690 Int)) )
))
(declare-datatypes ((ValueCell!464 0))(
  ( (ValueCellFull!464 (v!1778 V!1595)) (EmptyCell!464) )
))
(declare-datatypes ((array!1857 0))(
  ( (array!1858 (arr!882 (Array (_ BitVec 32) ValueCell!464)) (size!983 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1857)

(declare-fun e!19265 () Bool)

(declare-fun array_inv!619 (array!1857) Bool)

(assert (=> start!4058 (and (array_inv!619 _values!1501) e!19265)))

(declare-datatypes ((array!1859 0))(
  ( (array!1860 (arr!883 (Array (_ BitVec 32) (_ BitVec 64))) (size!984 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1859)

(declare-fun array_inv!620 (array!1859) Bool)

(assert (=> start!4058 (array_inv!620 _keys!1833)))

(declare-fun tp_is_empty!1327 () Bool)

(assert (=> start!4058 tp_is_empty!1327))

(declare-fun mapNonEmpty!1519 () Bool)

(declare-fun mapRes!1519 () Bool)

(declare-fun tp!4338 () Bool)

(declare-fun e!19266 () Bool)

(assert (=> mapNonEmpty!1519 (= mapRes!1519 (and tp!4338 e!19266))))

(declare-fun mapKey!1519 () (_ BitVec 32))

(declare-fun mapRest!1519 () (Array (_ BitVec 32) ValueCell!464))

(declare-fun mapValue!1519 () ValueCell!464)

(assert (=> mapNonEmpty!1519 (= (arr!882 _values!1501) (store mapRest!1519 mapKey!1519 mapValue!1519))))

(declare-fun b!29931 () Bool)

(assert (=> b!29931 (= e!19266 tp_is_empty!1327)))

(declare-fun b!29932 () Bool)

(declare-fun res!17998 () Bool)

(assert (=> b!29932 (=> (not res!17998) (not e!19263))))

(declare-datatypes ((List!732 0))(
  ( (Nil!729) (Cons!728 (h!1295 (_ BitVec 64)) (t!3418 List!732)) )
))
(declare-fun arrayNoDuplicates!0 (array!1859 (_ BitVec 32) List!732) Bool)

(assert (=> b!29932 (= res!17998 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!729))))

(declare-fun b!29933 () Bool)

(declare-fun res!17997 () Bool)

(assert (=> b!29933 (=> (not res!17997) (not e!19263))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!29933 (= res!17997 (and (= (size!983 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!984 _keys!1833) (size!983 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29934 () Bool)

(declare-fun res!17996 () Bool)

(assert (=> b!29934 (=> (not res!17996) (not e!19263))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29934 (= res!17996 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29935 () Bool)

(declare-fun e!19267 () Bool)

(assert (=> b!29935 (= e!19265 (and e!19267 mapRes!1519))))

(declare-fun condMapEmpty!1519 () Bool)

(declare-fun mapDefault!1519 () ValueCell!464)

(assert (=> b!29935 (= condMapEmpty!1519 (= (arr!882 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!464)) mapDefault!1519)))))

(declare-fun b!29936 () Bool)

(assert (=> b!29936 (= e!19263 false)))

(declare-datatypes ((SeekEntryResult!98 0))(
  ( (MissingZero!98 (index!2514 (_ BitVec 32))) (Found!98 (index!2515 (_ BitVec 32))) (Intermediate!98 (undefined!910 Bool) (index!2516 (_ BitVec 32)) (x!6488 (_ BitVec 32))) (Undefined!98) (MissingVacant!98 (index!2517 (_ BitVec 32))) )
))
(declare-fun lt!11371 () SeekEntryResult!98)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1859 (_ BitVec 32)) SeekEntryResult!98)

(assert (=> b!29936 (= lt!11371 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!29937 () Bool)

(declare-fun res!17992 () Bool)

(assert (=> b!29937 (=> (not res!17992) (not e!19263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1859 (_ BitVec 32)) Bool)

(assert (=> b!29937 (= res!17992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1519 () Bool)

(assert (=> mapIsEmpty!1519 mapRes!1519))

(declare-fun b!29938 () Bool)

(declare-fun res!17994 () Bool)

(assert (=> b!29938 (=> (not res!17994) (not e!19263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29938 (= res!17994 (validKeyInArray!0 k0!1304))))

(declare-fun b!29939 () Bool)

(declare-fun res!17995 () Bool)

(assert (=> b!29939 (=> (not res!17995) (not e!19263))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1595)

(declare-fun minValue!1443 () V!1595)

(declare-datatypes ((tuple2!1150 0))(
  ( (tuple2!1151 (_1!586 (_ BitVec 64)) (_2!586 V!1595)) )
))
(declare-datatypes ((List!733 0))(
  ( (Nil!730) (Cons!729 (h!1296 tuple2!1150) (t!3419 List!733)) )
))
(declare-datatypes ((ListLongMap!715 0))(
  ( (ListLongMap!716 (toList!373 List!733)) )
))
(declare-fun contains!314 (ListLongMap!715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!197 (array!1859 array!1857 (_ BitVec 32) (_ BitVec 32) V!1595 V!1595 (_ BitVec 32) Int) ListLongMap!715)

(assert (=> b!29939 (= res!17995 (not (contains!314 (getCurrentListMap!197 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!29940 () Bool)

(assert (=> b!29940 (= e!19267 tp_is_empty!1327)))

(assert (= (and start!4058 res!17993) b!29933))

(assert (= (and b!29933 res!17997) b!29937))

(assert (= (and b!29937 res!17992) b!29932))

(assert (= (and b!29932 res!17998) b!29938))

(assert (= (and b!29938 res!17994) b!29939))

(assert (= (and b!29939 res!17995) b!29934))

(assert (= (and b!29934 res!17996) b!29936))

(assert (= (and b!29935 condMapEmpty!1519) mapIsEmpty!1519))

(assert (= (and b!29935 (not condMapEmpty!1519)) mapNonEmpty!1519))

(get-info :version)

(assert (= (and mapNonEmpty!1519 ((_ is ValueCellFull!464) mapValue!1519)) b!29931))

(assert (= (and b!29935 ((_ is ValueCellFull!464) mapDefault!1519)) b!29940))

(assert (= start!4058 b!29935))

(declare-fun m!24051 () Bool)

(assert (=> b!29939 m!24051))

(assert (=> b!29939 m!24051))

(declare-fun m!24053 () Bool)

(assert (=> b!29939 m!24053))

(declare-fun m!24055 () Bool)

(assert (=> b!29937 m!24055))

(declare-fun m!24057 () Bool)

(assert (=> b!29938 m!24057))

(declare-fun m!24059 () Bool)

(assert (=> mapNonEmpty!1519 m!24059))

(declare-fun m!24061 () Bool)

(assert (=> b!29932 m!24061))

(declare-fun m!24063 () Bool)

(assert (=> b!29936 m!24063))

(declare-fun m!24065 () Bool)

(assert (=> b!29934 m!24065))

(declare-fun m!24067 () Bool)

(assert (=> start!4058 m!24067))

(declare-fun m!24069 () Bool)

(assert (=> start!4058 m!24069))

(declare-fun m!24071 () Bool)

(assert (=> start!4058 m!24071))

(check-sat (not b!29936) (not b_next!973) b_and!1777 (not b!29939) (not start!4058) (not b!29934) (not b!29938) tp_is_empty!1327 (not mapNonEmpty!1519) (not b!29932) (not b!29937))
(check-sat b_and!1777 (not b_next!973))
