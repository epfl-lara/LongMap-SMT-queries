; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84124 () Bool)

(assert start!84124)

(declare-fun mapNonEmpty!36167 () Bool)

(declare-fun mapRes!36167 () Bool)

(declare-fun tp!68681 () Bool)

(declare-fun e!553661 () Bool)

(assert (=> mapNonEmpty!36167 (= mapRes!36167 (and tp!68681 e!553661))))

(declare-fun mapKey!36167 () (_ BitVec 32))

(declare-datatypes ((V!35329 0))(
  ( (V!35330 (val!11430 Int)) )
))
(declare-datatypes ((ValueCell!10898 0))(
  ( (ValueCellFull!10898 (v!13989 V!35329)) (EmptyCell!10898) )
))
(declare-fun mapValue!36167 () ValueCell!10898)

(declare-datatypes ((array!61550 0))(
  ( (array!61551 (arr!29628 (Array (_ BitVec 32) ValueCell!10898)) (size!30108 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61550)

(declare-fun mapRest!36167 () (Array (_ BitVec 32) ValueCell!10898))

(assert (=> mapNonEmpty!36167 (= (arr!29628 _values!1278) (store mapRest!36167 mapKey!36167 mapValue!36167))))

(declare-fun b!982018 () Bool)

(declare-fun e!553663 () Bool)

(assert (=> b!982018 (= e!553663 false)))

(declare-fun lt!436017 () Bool)

(declare-datatypes ((array!61552 0))(
  ( (array!61553 (arr!29629 (Array (_ BitVec 32) (_ BitVec 64))) (size!30109 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61552)

(declare-datatypes ((List!20526 0))(
  ( (Nil!20523) (Cons!20522 (h!21690 (_ BitVec 64)) (t!29201 List!20526)) )
))
(declare-fun arrayNoDuplicates!0 (array!61552 (_ BitVec 32) List!20526) Bool)

(assert (=> b!982018 (= lt!436017 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20523))))

(declare-fun b!982020 () Bool)

(declare-fun res!656895 () Bool)

(assert (=> b!982020 (=> (not res!656895) (not e!553663))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61552 (_ BitVec 32)) Bool)

(assert (=> b!982020 (= res!656895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982021 () Bool)

(declare-fun e!553662 () Bool)

(declare-fun tp_is_empty!22759 () Bool)

(assert (=> b!982021 (= e!553662 tp_is_empty!22759)))

(declare-fun b!982022 () Bool)

(assert (=> b!982022 (= e!553661 tp_is_empty!22759)))

(declare-fun b!982023 () Bool)

(declare-fun e!553665 () Bool)

(assert (=> b!982023 (= e!553665 (and e!553662 mapRes!36167))))

(declare-fun condMapEmpty!36167 () Bool)

(declare-fun mapDefault!36167 () ValueCell!10898)

(assert (=> b!982023 (= condMapEmpty!36167 (= (arr!29628 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10898)) mapDefault!36167)))))

(declare-fun mapIsEmpty!36167 () Bool)

(assert (=> mapIsEmpty!36167 mapRes!36167))

(declare-fun res!656894 () Bool)

(assert (=> start!84124 (=> (not res!656894) (not e!553663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84124 (= res!656894 (validMask!0 mask!1948))))

(assert (=> start!84124 e!553663))

(assert (=> start!84124 true))

(declare-fun array_inv!22931 (array!61550) Bool)

(assert (=> start!84124 (and (array_inv!22931 _values!1278) e!553665)))

(declare-fun array_inv!22932 (array!61552) Bool)

(assert (=> start!84124 (array_inv!22932 _keys!1544)))

(declare-fun b!982019 () Bool)

(declare-fun res!656896 () Bool)

(assert (=> b!982019 (=> (not res!656896) (not e!553663))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982019 (= res!656896 (and (= (size!30108 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30109 _keys!1544) (size!30108 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84124 res!656894) b!982019))

(assert (= (and b!982019 res!656896) b!982020))

(assert (= (and b!982020 res!656895) b!982018))

(assert (= (and b!982023 condMapEmpty!36167) mapIsEmpty!36167))

(assert (= (and b!982023 (not condMapEmpty!36167)) mapNonEmpty!36167))

(get-info :version)

(assert (= (and mapNonEmpty!36167 ((_ is ValueCellFull!10898) mapValue!36167)) b!982022))

(assert (= (and b!982023 ((_ is ValueCellFull!10898) mapDefault!36167)) b!982021))

(assert (= start!84124 b!982023))

(declare-fun m!909893 () Bool)

(assert (=> mapNonEmpty!36167 m!909893))

(declare-fun m!909895 () Bool)

(assert (=> b!982018 m!909895))

(declare-fun m!909897 () Bool)

(assert (=> b!982020 m!909897))

(declare-fun m!909899 () Bool)

(assert (=> start!84124 m!909899))

(declare-fun m!909901 () Bool)

(assert (=> start!84124 m!909901))

(declare-fun m!909903 () Bool)

(assert (=> start!84124 m!909903))

(check-sat (not mapNonEmpty!36167) tp_is_empty!22759 (not start!84124) (not b!982018) (not b!982020))
(check-sat)
