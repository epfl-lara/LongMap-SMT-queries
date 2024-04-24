; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84136 () Bool)

(assert start!84136)

(declare-fun b!982132 () Bool)

(declare-fun res!656958 () Bool)

(declare-fun e!553755 () Bool)

(assert (=> b!982132 (=> (not res!656958) (not e!553755))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35345 0))(
  ( (V!35346 (val!11436 Int)) )
))
(declare-datatypes ((ValueCell!10904 0))(
  ( (ValueCellFull!10904 (v!13995 V!35345)) (EmptyCell!10904) )
))
(declare-datatypes ((array!61574 0))(
  ( (array!61575 (arr!29640 (Array (_ BitVec 32) ValueCell!10904)) (size!30120 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61574)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61576 0))(
  ( (array!61577 (arr!29641 (Array (_ BitVec 32) (_ BitVec 64))) (size!30121 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61576)

(assert (=> b!982132 (= res!656958 (and (= (size!30120 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30121 _keys!1544) (size!30120 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982133 () Bool)

(declare-fun res!656955 () Bool)

(assert (=> b!982133 (=> (not res!656955) (not e!553755))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982133 (= res!656955 (validKeyInArray!0 (select (arr!29641 _keys!1544) from!1932)))))

(declare-fun res!656957 () Bool)

(assert (=> start!84136 (=> (not res!656957) (not e!553755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84136 (= res!656957 (validMask!0 mask!1948))))

(assert (=> start!84136 e!553755))

(assert (=> start!84136 true))

(declare-fun e!553751 () Bool)

(declare-fun array_inv!22939 (array!61574) Bool)

(assert (=> start!84136 (and (array_inv!22939 _values!1278) e!553751)))

(declare-fun array_inv!22940 (array!61576) Bool)

(assert (=> start!84136 (array_inv!22940 _keys!1544)))

(declare-fun b!982134 () Bool)

(assert (=> b!982134 (= e!553755 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun b!982135 () Bool)

(declare-fun res!656959 () Bool)

(assert (=> b!982135 (=> (not res!656959) (not e!553755))))

(assert (=> b!982135 (= res!656959 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30121 _keys!1544))))))

(declare-fun b!982136 () Bool)

(declare-fun res!656954 () Bool)

(assert (=> b!982136 (=> (not res!656954) (not e!553755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61576 (_ BitVec 32)) Bool)

(assert (=> b!982136 (= res!656954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982137 () Bool)

(declare-fun res!656956 () Bool)

(assert (=> b!982137 (=> (not res!656956) (not e!553755))))

(declare-datatypes ((List!20529 0))(
  ( (Nil!20526) (Cons!20525 (h!21693 (_ BitVec 64)) (t!29204 List!20529)) )
))
(declare-fun arrayNoDuplicates!0 (array!61576 (_ BitVec 32) List!20529) Bool)

(assert (=> b!982137 (= res!656956 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20526))))

(declare-fun mapIsEmpty!36185 () Bool)

(declare-fun mapRes!36185 () Bool)

(assert (=> mapIsEmpty!36185 mapRes!36185))

(declare-fun b!982138 () Bool)

(declare-fun e!553754 () Bool)

(declare-fun tp_is_empty!22771 () Bool)

(assert (=> b!982138 (= e!553754 tp_is_empty!22771)))

(declare-fun b!982139 () Bool)

(declare-fun e!553753 () Bool)

(assert (=> b!982139 (= e!553751 (and e!553753 mapRes!36185))))

(declare-fun condMapEmpty!36185 () Bool)

(declare-fun mapDefault!36185 () ValueCell!10904)

(assert (=> b!982139 (= condMapEmpty!36185 (= (arr!29640 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10904)) mapDefault!36185)))))

(declare-fun mapNonEmpty!36185 () Bool)

(declare-fun tp!68699 () Bool)

(assert (=> mapNonEmpty!36185 (= mapRes!36185 (and tp!68699 e!553754))))

(declare-fun mapValue!36185 () ValueCell!10904)

(declare-fun mapRest!36185 () (Array (_ BitVec 32) ValueCell!10904))

(declare-fun mapKey!36185 () (_ BitVec 32))

(assert (=> mapNonEmpty!36185 (= (arr!29640 _values!1278) (store mapRest!36185 mapKey!36185 mapValue!36185))))

(declare-fun b!982140 () Bool)

(assert (=> b!982140 (= e!553753 tp_is_empty!22771)))

(assert (= (and start!84136 res!656957) b!982132))

(assert (= (and b!982132 res!656958) b!982136))

(assert (= (and b!982136 res!656954) b!982137))

(assert (= (and b!982137 res!656956) b!982135))

(assert (= (and b!982135 res!656959) b!982133))

(assert (= (and b!982133 res!656955) b!982134))

(assert (= (and b!982139 condMapEmpty!36185) mapIsEmpty!36185))

(assert (= (and b!982139 (not condMapEmpty!36185)) mapNonEmpty!36185))

(get-info :version)

(assert (= (and mapNonEmpty!36185 ((_ is ValueCellFull!10904) mapValue!36185)) b!982138))

(assert (= (and b!982139 ((_ is ValueCellFull!10904) mapDefault!36185)) b!982140))

(assert (= start!84136 b!982139))

(declare-fun m!909965 () Bool)

(assert (=> mapNonEmpty!36185 m!909965))

(declare-fun m!909967 () Bool)

(assert (=> start!84136 m!909967))

(declare-fun m!909969 () Bool)

(assert (=> start!84136 m!909969))

(declare-fun m!909971 () Bool)

(assert (=> start!84136 m!909971))

(declare-fun m!909973 () Bool)

(assert (=> b!982137 m!909973))

(declare-fun m!909975 () Bool)

(assert (=> b!982133 m!909975))

(assert (=> b!982133 m!909975))

(declare-fun m!909977 () Bool)

(assert (=> b!982133 m!909977))

(declare-fun m!909979 () Bool)

(assert (=> b!982136 m!909979))

(check-sat (not start!84136) (not b!982133) (not b!982137) (not mapNonEmpty!36185) tp_is_empty!22771 (not b!982136))
(check-sat)
