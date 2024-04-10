; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4064 () Bool)

(assert start!4064)

(declare-fun b_free!969 () Bool)

(declare-fun b_next!969 () Bool)

(assert (=> start!4064 (= b_free!969 (not b_next!969))))

(declare-fun tp!4327 () Bool)

(declare-fun b_and!1779 () Bool)

(assert (=> start!4064 (= tp!4327 b_and!1779)))

(declare-fun b!29925 () Bool)

(declare-fun res!17983 () Bool)

(declare-fun e!19276 () Bool)

(assert (=> b!29925 (=> (not res!17983) (not e!19276))))

(declare-datatypes ((V!1589 0))(
  ( (V!1590 (val!688 Int)) )
))
(declare-datatypes ((ValueCell!462 0))(
  ( (ValueCellFull!462 (v!1777 V!1589)) (EmptyCell!462) )
))
(declare-datatypes ((array!1877 0))(
  ( (array!1878 (arr!892 (Array (_ BitVec 32) ValueCell!462)) (size!993 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1877)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1879 0))(
  ( (array!1880 (arr!893 (Array (_ BitVec 32) (_ BitVec 64))) (size!994 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1879)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!29925 (= res!17983 (and (= (size!993 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!994 _keys!1833) (size!993 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29926 () Bool)

(declare-fun e!19280 () Bool)

(declare-fun tp_is_empty!1323 () Bool)

(assert (=> b!29926 (= e!19280 tp_is_empty!1323)))

(declare-fun b!29928 () Bool)

(declare-fun res!17986 () Bool)

(assert (=> b!29928 (=> (not res!17986) (not e!19276))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29928 (= res!17986 (validKeyInArray!0 k0!1304))))

(declare-fun b!29929 () Bool)

(assert (=> b!29929 (= e!19276 false)))

(declare-datatypes ((SeekEntryResult!93 0))(
  ( (MissingZero!93 (index!2494 (_ BitVec 32))) (Found!93 (index!2495 (_ BitVec 32))) (Intermediate!93 (undefined!905 Bool) (index!2496 (_ BitVec 32)) (x!6475 (_ BitVec 32))) (Undefined!93) (MissingVacant!93 (index!2497 (_ BitVec 32))) )
))
(declare-fun lt!11369 () SeekEntryResult!93)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1879 (_ BitVec 32)) SeekEntryResult!93)

(assert (=> b!29929 (= lt!11369 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!29930 () Bool)

(declare-fun e!19279 () Bool)

(assert (=> b!29930 (= e!19279 tp_is_empty!1323)))

(declare-fun b!29931 () Bool)

(declare-fun res!17987 () Bool)

(assert (=> b!29931 (=> (not res!17987) (not e!19276))))

(declare-datatypes ((List!738 0))(
  ( (Nil!735) (Cons!734 (h!1301 (_ BitVec 64)) (t!3431 List!738)) )
))
(declare-fun arrayNoDuplicates!0 (array!1879 (_ BitVec 32) List!738) Bool)

(assert (=> b!29931 (= res!17987 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!735))))

(declare-fun b!29932 () Bool)

(declare-fun res!17988 () Bool)

(assert (=> b!29932 (=> (not res!17988) (not e!19276))))

(declare-fun arrayContainsKey!0 (array!1879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29932 (= res!17988 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29933 () Bool)

(declare-fun res!17985 () Bool)

(assert (=> b!29933 (=> (not res!17985) (not e!19276))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1589)

(declare-fun minValue!1443 () V!1589)

(declare-datatypes ((tuple2!1142 0))(
  ( (tuple2!1143 (_1!582 (_ BitVec 64)) (_2!582 V!1589)) )
))
(declare-datatypes ((List!739 0))(
  ( (Nil!736) (Cons!735 (h!1302 tuple2!1142) (t!3432 List!739)) )
))
(declare-datatypes ((ListLongMap!719 0))(
  ( (ListLongMap!720 (toList!375 List!739)) )
))
(declare-fun contains!315 (ListLongMap!719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!203 (array!1879 array!1877 (_ BitVec 32) (_ BitVec 32) V!1589 V!1589 (_ BitVec 32) Int) ListLongMap!719)

(assert (=> b!29933 (= res!17985 (not (contains!315 (getCurrentListMap!203 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!29934 () Bool)

(declare-fun e!19278 () Bool)

(declare-fun mapRes!1513 () Bool)

(assert (=> b!29934 (= e!19278 (and e!19280 mapRes!1513))))

(declare-fun condMapEmpty!1513 () Bool)

(declare-fun mapDefault!1513 () ValueCell!462)

(assert (=> b!29934 (= condMapEmpty!1513 (= (arr!892 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!462)) mapDefault!1513)))))

(declare-fun b!29927 () Bool)

(declare-fun res!17982 () Bool)

(assert (=> b!29927 (=> (not res!17982) (not e!19276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1879 (_ BitVec 32)) Bool)

(assert (=> b!29927 (= res!17982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!17984 () Bool)

(assert (=> start!4064 (=> (not res!17984) (not e!19276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4064 (= res!17984 (validMask!0 mask!2294))))

(assert (=> start!4064 e!19276))

(assert (=> start!4064 true))

(assert (=> start!4064 tp!4327))

(declare-fun array_inv!623 (array!1877) Bool)

(assert (=> start!4064 (and (array_inv!623 _values!1501) e!19278)))

(declare-fun array_inv!624 (array!1879) Bool)

(assert (=> start!4064 (array_inv!624 _keys!1833)))

(assert (=> start!4064 tp_is_empty!1323))

(declare-fun mapNonEmpty!1513 () Bool)

(declare-fun tp!4326 () Bool)

(assert (=> mapNonEmpty!1513 (= mapRes!1513 (and tp!4326 e!19279))))

(declare-fun mapKey!1513 () (_ BitVec 32))

(declare-fun mapValue!1513 () ValueCell!462)

(declare-fun mapRest!1513 () (Array (_ BitVec 32) ValueCell!462))

(assert (=> mapNonEmpty!1513 (= (arr!892 _values!1501) (store mapRest!1513 mapKey!1513 mapValue!1513))))

(declare-fun mapIsEmpty!1513 () Bool)

(assert (=> mapIsEmpty!1513 mapRes!1513))

(assert (= (and start!4064 res!17984) b!29925))

(assert (= (and b!29925 res!17983) b!29927))

(assert (= (and b!29927 res!17982) b!29931))

(assert (= (and b!29931 res!17987) b!29928))

(assert (= (and b!29928 res!17986) b!29933))

(assert (= (and b!29933 res!17985) b!29932))

(assert (= (and b!29932 res!17988) b!29929))

(assert (= (and b!29934 condMapEmpty!1513) mapIsEmpty!1513))

(assert (= (and b!29934 (not condMapEmpty!1513)) mapNonEmpty!1513))

(get-info :version)

(assert (= (and mapNonEmpty!1513 ((_ is ValueCellFull!462) mapValue!1513)) b!29930))

(assert (= (and b!29934 ((_ is ValueCellFull!462) mapDefault!1513)) b!29926))

(assert (= start!4064 b!29934))

(declare-fun m!24077 () Bool)

(assert (=> b!29933 m!24077))

(assert (=> b!29933 m!24077))

(declare-fun m!24079 () Bool)

(assert (=> b!29933 m!24079))

(declare-fun m!24081 () Bool)

(assert (=> start!4064 m!24081))

(declare-fun m!24083 () Bool)

(assert (=> start!4064 m!24083))

(declare-fun m!24085 () Bool)

(assert (=> start!4064 m!24085))

(declare-fun m!24087 () Bool)

(assert (=> b!29931 m!24087))

(declare-fun m!24089 () Bool)

(assert (=> mapNonEmpty!1513 m!24089))

(declare-fun m!24091 () Bool)

(assert (=> b!29932 m!24091))

(declare-fun m!24093 () Bool)

(assert (=> b!29928 m!24093))

(declare-fun m!24095 () Bool)

(assert (=> b!29927 m!24095))

(declare-fun m!24097 () Bool)

(assert (=> b!29929 m!24097))

(check-sat (not b!29933) (not b!29927) (not mapNonEmpty!1513) (not b!29928) (not b_next!969) (not b!29931) tp_is_empty!1323 b_and!1779 (not b!29929) (not start!4064) (not b!29932))
(check-sat b_and!1779 (not b_next!969))
