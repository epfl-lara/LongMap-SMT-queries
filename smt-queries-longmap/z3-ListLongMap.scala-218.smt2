; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3980 () Bool)

(assert start!3980)

(declare-fun b_free!895 () Bool)

(declare-fun b_next!895 () Bool)

(assert (=> start!3980 (= b_free!895 (not b_next!895))))

(declare-fun tp!4104 () Bool)

(declare-fun b_and!1699 () Bool)

(assert (=> start!3980 (= tp!4104 b_and!1699)))

(declare-fun mapNonEmpty!1402 () Bool)

(declare-fun mapRes!1402 () Bool)

(declare-fun tp!4105 () Bool)

(declare-fun e!18612 () Bool)

(assert (=> mapNonEmpty!1402 (= mapRes!1402 (and tp!4105 e!18612))))

(declare-datatypes ((V!1491 0))(
  ( (V!1492 (val!651 Int)) )
))
(declare-datatypes ((ValueCell!425 0))(
  ( (ValueCellFull!425 (v!1739 V!1491)) (EmptyCell!425) )
))
(declare-datatypes ((array!1709 0))(
  ( (array!1710 (arr!808 (Array (_ BitVec 32) ValueCell!425)) (size!909 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1709)

(declare-fun mapValue!1402 () ValueCell!425)

(declare-fun mapKey!1402 () (_ BitVec 32))

(declare-fun mapRest!1402 () (Array (_ BitVec 32) ValueCell!425))

(assert (=> mapNonEmpty!1402 (= (arr!808 _values!1501) (store mapRest!1402 mapKey!1402 mapValue!1402))))

(declare-fun b!28797 () Bool)

(declare-fun e!18611 () Bool)

(declare-fun e!18613 () Bool)

(assert (=> b!28797 (= e!18611 (and e!18613 mapRes!1402))))

(declare-fun condMapEmpty!1402 () Bool)

(declare-fun mapDefault!1402 () ValueCell!425)

(assert (=> b!28797 (= condMapEmpty!1402 (= (arr!808 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!425)) mapDefault!1402)))))

(declare-fun b!28798 () Bool)

(declare-fun tp_is_empty!1249 () Bool)

(assert (=> b!28798 (= e!18612 tp_is_empty!1249)))

(declare-fun b!28799 () Bool)

(declare-fun res!17209 () Bool)

(declare-fun e!18610 () Bool)

(assert (=> b!28799 (=> (not res!17209) (not e!18610))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1711 0))(
  ( (array!1712 (arr!809 (Array (_ BitVec 32) (_ BitVec 64))) (size!910 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1711)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!28799 (= res!17209 (and (= (size!909 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!910 _keys!1833) (size!909 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28800 () Bool)

(declare-fun res!17214 () Bool)

(declare-fun e!18608 () Bool)

(assert (=> b!28800 (=> (not res!17214) (not e!18608))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28800 (= res!17214 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1402 () Bool)

(assert (=> mapIsEmpty!1402 mapRes!1402))

(declare-fun b!28801 () Bool)

(declare-fun res!17215 () Bool)

(assert (=> b!28801 (=> (not res!17215) (not e!18610))))

(declare-datatypes ((List!675 0))(
  ( (Nil!672) (Cons!671 (h!1238 (_ BitVec 64)) (t!3361 List!675)) )
))
(declare-fun arrayNoDuplicates!0 (array!1711 (_ BitVec 32) List!675) Bool)

(assert (=> b!28801 (= res!17215 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!672))))

(declare-fun b!28802 () Bool)

(declare-fun res!17212 () Bool)

(assert (=> b!28802 (=> (not res!17212) (not e!18610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28802 (= res!17212 (validKeyInArray!0 k0!1304))))

(declare-fun b!28803 () Bool)

(assert (=> b!28803 (= e!18610 e!18608)))

(declare-fun res!17211 () Bool)

(assert (=> b!28803 (=> (not res!17211) (not e!18608))))

(declare-datatypes ((tuple2!1092 0))(
  ( (tuple2!1093 (_1!557 (_ BitVec 64)) (_2!557 V!1491)) )
))
(declare-datatypes ((List!676 0))(
  ( (Nil!673) (Cons!672 (h!1239 tuple2!1092) (t!3362 List!676)) )
))
(declare-datatypes ((ListLongMap!657 0))(
  ( (ListLongMap!658 (toList!344 List!676)) )
))
(declare-fun lt!10957 () ListLongMap!657)

(declare-fun contains!285 (ListLongMap!657 (_ BitVec 64)) Bool)

(assert (=> b!28803 (= res!17211 (not (contains!285 lt!10957 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1491)

(declare-fun minValue!1443 () V!1491)

(declare-fun getCurrentListMap!172 (array!1711 array!1709 (_ BitVec 32) (_ BitVec 32) V!1491 V!1491 (_ BitVec 32) Int) ListLongMap!657)

(assert (=> b!28803 (= lt!10957 (getCurrentListMap!172 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!17213 () Bool)

(assert (=> start!3980 (=> (not res!17213) (not e!18610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3980 (= res!17213 (validMask!0 mask!2294))))

(assert (=> start!3980 e!18610))

(assert (=> start!3980 true))

(assert (=> start!3980 tp!4104))

(declare-fun array_inv!563 (array!1709) Bool)

(assert (=> start!3980 (and (array_inv!563 _values!1501) e!18611)))

(declare-fun array_inv!564 (array!1711) Bool)

(assert (=> start!3980 (array_inv!564 _keys!1833)))

(assert (=> start!3980 tp_is_empty!1249))

(declare-fun b!28804 () Bool)

(assert (=> b!28804 (= e!18608 (not true))))

(declare-datatypes ((SeekEntryResult!76 0))(
  ( (MissingZero!76 (index!2426 (_ BitVec 32))) (Found!76 (index!2427 (_ BitVec 32))) (Intermediate!76 (undefined!888 Bool) (index!2428 (_ BitVec 32)) (x!6362 (_ BitVec 32))) (Undefined!76) (MissingVacant!76 (index!2429 (_ BitVec 32))) )
))
(declare-fun lt!10956 () SeekEntryResult!76)

(declare-fun lt!10960 () (_ BitVec 32))

(get-info :version)

(assert (=> b!28804 (and ((_ is Found!76) lt!10956) (= (index!2427 lt!10956) lt!10960))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1711 (_ BitVec 32)) SeekEntryResult!76)

(assert (=> b!28804 (= lt!10956 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!662 0))(
  ( (Unit!663) )
))
(declare-fun lt!10959 () Unit!662)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1711 (_ BitVec 32)) Unit!662)

(assert (=> b!28804 (= lt!10959 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!10960 _keys!1833 mask!2294))))

(assert (=> b!28804 (contains!285 lt!10957 (select (arr!809 _keys!1833) lt!10960))))

(declare-fun lt!10958 () Unit!662)

(declare-fun lemmaValidKeyInArrayIsInListMap!21 (array!1711 array!1709 (_ BitVec 32) (_ BitVec 32) V!1491 V!1491 (_ BitVec 32) Int) Unit!662)

(assert (=> b!28804 (= lt!10958 (lemmaValidKeyInArrayIsInListMap!21 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10960 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1711 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28804 (= lt!10960 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28805 () Bool)

(assert (=> b!28805 (= e!18613 tp_is_empty!1249)))

(declare-fun b!28806 () Bool)

(declare-fun res!17210 () Bool)

(assert (=> b!28806 (=> (not res!17210) (not e!18610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1711 (_ BitVec 32)) Bool)

(assert (=> b!28806 (= res!17210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!3980 res!17213) b!28799))

(assert (= (and b!28799 res!17209) b!28806))

(assert (= (and b!28806 res!17210) b!28801))

(assert (= (and b!28801 res!17215) b!28802))

(assert (= (and b!28802 res!17212) b!28803))

(assert (= (and b!28803 res!17211) b!28800))

(assert (= (and b!28800 res!17214) b!28804))

(assert (= (and b!28797 condMapEmpty!1402) mapIsEmpty!1402))

(assert (= (and b!28797 (not condMapEmpty!1402)) mapNonEmpty!1402))

(assert (= (and mapNonEmpty!1402 ((_ is ValueCellFull!425) mapValue!1402)) b!28798))

(assert (= (and b!28797 ((_ is ValueCellFull!425) mapDefault!1402)) b!28805))

(assert (= start!3980 b!28797))

(declare-fun m!22947 () Bool)

(assert (=> start!3980 m!22947))

(declare-fun m!22949 () Bool)

(assert (=> start!3980 m!22949))

(declare-fun m!22951 () Bool)

(assert (=> start!3980 m!22951))

(declare-fun m!22953 () Bool)

(assert (=> b!28804 m!22953))

(declare-fun m!22955 () Bool)

(assert (=> b!28804 m!22955))

(declare-fun m!22957 () Bool)

(assert (=> b!28804 m!22957))

(declare-fun m!22959 () Bool)

(assert (=> b!28804 m!22959))

(declare-fun m!22961 () Bool)

(assert (=> b!28804 m!22961))

(declare-fun m!22963 () Bool)

(assert (=> b!28804 m!22963))

(assert (=> b!28804 m!22957))

(declare-fun m!22965 () Bool)

(assert (=> b!28803 m!22965))

(declare-fun m!22967 () Bool)

(assert (=> b!28803 m!22967))

(declare-fun m!22969 () Bool)

(assert (=> b!28800 m!22969))

(declare-fun m!22971 () Bool)

(assert (=> b!28806 m!22971))

(declare-fun m!22973 () Bool)

(assert (=> b!28802 m!22973))

(declare-fun m!22975 () Bool)

(assert (=> b!28801 m!22975))

(declare-fun m!22977 () Bool)

(assert (=> mapNonEmpty!1402 m!22977))

(check-sat (not b!28800) (not b!28806) tp_is_empty!1249 (not start!3980) (not b!28802) (not b!28803) (not b_next!895) (not b!28801) (not b!28804) b_and!1699 (not mapNonEmpty!1402))
(check-sat b_and!1699 (not b_next!895))
