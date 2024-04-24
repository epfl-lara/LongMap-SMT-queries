; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84088 () Bool)

(assert start!84088)

(declare-fun res!656732 () Bool)

(declare-fun e!553392 () Bool)

(assert (=> start!84088 (=> (not res!656732) (not e!553392))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84088 (= res!656732 (validMask!0 mask!1948))))

(assert (=> start!84088 e!553392))

(assert (=> start!84088 true))

(declare-datatypes ((V!35281 0))(
  ( (V!35282 (val!11412 Int)) )
))
(declare-datatypes ((ValueCell!10880 0))(
  ( (ValueCellFull!10880 (v!13971 V!35281)) (EmptyCell!10880) )
))
(declare-datatypes ((array!61484 0))(
  ( (array!61485 (arr!29595 (Array (_ BitVec 32) ValueCell!10880)) (size!30075 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61484)

(declare-fun e!553391 () Bool)

(declare-fun array_inv!22909 (array!61484) Bool)

(assert (=> start!84088 (and (array_inv!22909 _values!1278) e!553391)))

(declare-datatypes ((array!61486 0))(
  ( (array!61487 (arr!29596 (Array (_ BitVec 32) (_ BitVec 64))) (size!30076 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61486)

(declare-fun array_inv!22910 (array!61486) Bool)

(assert (=> start!84088 (array_inv!22910 _keys!1544)))

(declare-fun b!981694 () Bool)

(declare-fun res!656733 () Bool)

(assert (=> b!981694 (=> (not res!656733) (not e!553392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61486 (_ BitVec 32)) Bool)

(assert (=> b!981694 (= res!656733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36113 () Bool)

(declare-fun mapRes!36113 () Bool)

(assert (=> mapIsEmpty!36113 mapRes!36113))

(declare-fun b!981695 () Bool)

(declare-fun e!553395 () Bool)

(declare-fun tp_is_empty!22723 () Bool)

(assert (=> b!981695 (= e!553395 tp_is_empty!22723)))

(declare-fun b!981696 () Bool)

(declare-fun e!553394 () Bool)

(assert (=> b!981696 (= e!553391 (and e!553394 mapRes!36113))))

(declare-fun condMapEmpty!36113 () Bool)

(declare-fun mapDefault!36113 () ValueCell!10880)

(assert (=> b!981696 (= condMapEmpty!36113 (= (arr!29595 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10880)) mapDefault!36113)))))

(declare-fun mapNonEmpty!36113 () Bool)

(declare-fun tp!68627 () Bool)

(assert (=> mapNonEmpty!36113 (= mapRes!36113 (and tp!68627 e!553395))))

(declare-fun mapRest!36113 () (Array (_ BitVec 32) ValueCell!10880))

(declare-fun mapValue!36113 () ValueCell!10880)

(declare-fun mapKey!36113 () (_ BitVec 32))

(assert (=> mapNonEmpty!36113 (= (arr!29595 _values!1278) (store mapRest!36113 mapKey!36113 mapValue!36113))))

(declare-fun b!981697 () Bool)

(declare-fun res!656734 () Bool)

(assert (=> b!981697 (=> (not res!656734) (not e!553392))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981697 (= res!656734 (and (= (size!30075 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30076 _keys!1544) (size!30075 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981698 () Bool)

(assert (=> b!981698 (= e!553394 tp_is_empty!22723)))

(declare-fun b!981699 () Bool)

(assert (=> b!981699 (= e!553392 false)))

(declare-fun lt!435963 () Bool)

(declare-datatypes ((List!20512 0))(
  ( (Nil!20509) (Cons!20508 (h!21676 (_ BitVec 64)) (t!29187 List!20512)) )
))
(declare-fun arrayNoDuplicates!0 (array!61486 (_ BitVec 32) List!20512) Bool)

(assert (=> b!981699 (= lt!435963 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20509))))

(assert (= (and start!84088 res!656732) b!981697))

(assert (= (and b!981697 res!656734) b!981694))

(assert (= (and b!981694 res!656733) b!981699))

(assert (= (and b!981696 condMapEmpty!36113) mapIsEmpty!36113))

(assert (= (and b!981696 (not condMapEmpty!36113)) mapNonEmpty!36113))

(get-info :version)

(assert (= (and mapNonEmpty!36113 ((_ is ValueCellFull!10880) mapValue!36113)) b!981695))

(assert (= (and b!981696 ((_ is ValueCellFull!10880) mapDefault!36113)) b!981698))

(assert (= start!84088 b!981696))

(declare-fun m!909677 () Bool)

(assert (=> start!84088 m!909677))

(declare-fun m!909679 () Bool)

(assert (=> start!84088 m!909679))

(declare-fun m!909681 () Bool)

(assert (=> start!84088 m!909681))

(declare-fun m!909683 () Bool)

(assert (=> b!981694 m!909683))

(declare-fun m!909685 () Bool)

(assert (=> mapNonEmpty!36113 m!909685))

(declare-fun m!909687 () Bool)

(assert (=> b!981699 m!909687))

(check-sat tp_is_empty!22723 (not b!981699) (not mapNonEmpty!36113) (not start!84088) (not b!981694))
(check-sat)
