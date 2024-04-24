; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84112 () Bool)

(assert start!84112)

(declare-fun b!981910 () Bool)

(declare-fun res!656842 () Bool)

(declare-fun e!553574 () Bool)

(assert (=> b!981910 (=> (not res!656842) (not e!553574))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35313 0))(
  ( (V!35314 (val!11424 Int)) )
))
(declare-datatypes ((ValueCell!10892 0))(
  ( (ValueCellFull!10892 (v!13983 V!35313)) (EmptyCell!10892) )
))
(declare-datatypes ((array!61530 0))(
  ( (array!61531 (arr!29618 (Array (_ BitVec 32) ValueCell!10892)) (size!30098 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61530)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61532 0))(
  ( (array!61533 (arr!29619 (Array (_ BitVec 32) (_ BitVec 64))) (size!30099 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61532)

(assert (=> b!981910 (= res!656842 (and (= (size!30098 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30099 _keys!1544) (size!30098 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981911 () Bool)

(declare-fun e!553575 () Bool)

(declare-fun tp_is_empty!22747 () Bool)

(assert (=> b!981911 (= e!553575 tp_is_empty!22747)))

(declare-fun b!981912 () Bool)

(declare-fun res!656840 () Bool)

(assert (=> b!981912 (=> (not res!656840) (not e!553574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61532 (_ BitVec 32)) Bool)

(assert (=> b!981912 (= res!656840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36149 () Bool)

(declare-fun mapRes!36149 () Bool)

(assert (=> mapIsEmpty!36149 mapRes!36149))

(declare-fun res!656841 () Bool)

(assert (=> start!84112 (=> (not res!656841) (not e!553574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84112 (= res!656841 (validMask!0 mask!1948))))

(assert (=> start!84112 e!553574))

(assert (=> start!84112 true))

(declare-fun e!553571 () Bool)

(declare-fun array_inv!22927 (array!61530) Bool)

(assert (=> start!84112 (and (array_inv!22927 _values!1278) e!553571)))

(declare-fun array_inv!22928 (array!61532) Bool)

(assert (=> start!84112 (array_inv!22928 _keys!1544)))

(declare-fun b!981913 () Bool)

(assert (=> b!981913 (= e!553574 false)))

(declare-fun lt!435999 () Bool)

(declare-datatypes ((List!20522 0))(
  ( (Nil!20519) (Cons!20518 (h!21686 (_ BitVec 64)) (t!29197 List!20522)) )
))
(declare-fun arrayNoDuplicates!0 (array!61532 (_ BitVec 32) List!20522) Bool)

(assert (=> b!981913 (= lt!435999 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20519))))

(declare-fun b!981914 () Bool)

(declare-fun e!553572 () Bool)

(assert (=> b!981914 (= e!553572 tp_is_empty!22747)))

(declare-fun b!981915 () Bool)

(assert (=> b!981915 (= e!553571 (and e!553575 mapRes!36149))))

(declare-fun condMapEmpty!36149 () Bool)

(declare-fun mapDefault!36149 () ValueCell!10892)

(assert (=> b!981915 (= condMapEmpty!36149 (= (arr!29618 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10892)) mapDefault!36149)))))

(declare-fun mapNonEmpty!36149 () Bool)

(declare-fun tp!68663 () Bool)

(assert (=> mapNonEmpty!36149 (= mapRes!36149 (and tp!68663 e!553572))))

(declare-fun mapRest!36149 () (Array (_ BitVec 32) ValueCell!10892))

(declare-fun mapKey!36149 () (_ BitVec 32))

(declare-fun mapValue!36149 () ValueCell!10892)

(assert (=> mapNonEmpty!36149 (= (arr!29618 _values!1278) (store mapRest!36149 mapKey!36149 mapValue!36149))))

(assert (= (and start!84112 res!656841) b!981910))

(assert (= (and b!981910 res!656842) b!981912))

(assert (= (and b!981912 res!656840) b!981913))

(assert (= (and b!981915 condMapEmpty!36149) mapIsEmpty!36149))

(assert (= (and b!981915 (not condMapEmpty!36149)) mapNonEmpty!36149))

(get-info :version)

(assert (= (and mapNonEmpty!36149 ((_ is ValueCellFull!10892) mapValue!36149)) b!981914))

(assert (= (and b!981915 ((_ is ValueCellFull!10892) mapDefault!36149)) b!981911))

(assert (= start!84112 b!981915))

(declare-fun m!909821 () Bool)

(assert (=> b!981912 m!909821))

(declare-fun m!909823 () Bool)

(assert (=> start!84112 m!909823))

(declare-fun m!909825 () Bool)

(assert (=> start!84112 m!909825))

(declare-fun m!909827 () Bool)

(assert (=> start!84112 m!909827))

(declare-fun m!909829 () Bool)

(assert (=> b!981913 m!909829))

(declare-fun m!909831 () Bool)

(assert (=> mapNonEmpty!36149 m!909831))

(check-sat (not mapNonEmpty!36149) (not start!84112) tp_is_empty!22747 (not b!981913) (not b!981912))
(check-sat)
