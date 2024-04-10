; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83958 () Bool)

(assert start!83958)

(declare-fun b!981133 () Bool)

(declare-fun e!553096 () Bool)

(assert (=> b!981133 (= e!553096 false)))

(declare-fun lt!435659 () Bool)

(declare-datatypes ((array!61519 0))(
  ( (array!61520 (arr!29617 (Array (_ BitVec 32) (_ BitVec 64))) (size!30096 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61519)

(declare-datatypes ((List!20516 0))(
  ( (Nil!20513) (Cons!20512 (h!21674 (_ BitVec 64)) (t!29199 List!20516)) )
))
(declare-fun arrayNoDuplicates!0 (array!61519 (_ BitVec 32) List!20516) Bool)

(assert (=> b!981133 (= lt!435659 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20513))))

(declare-fun b!981134 () Bool)

(declare-fun e!553098 () Bool)

(declare-fun tp_is_empty!22761 () Bool)

(assert (=> b!981134 (= e!553098 tp_is_empty!22761)))

(declare-fun b!981135 () Bool)

(declare-fun res!656559 () Bool)

(assert (=> b!981135 (=> (not res!656559) (not e!553096))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((V!35331 0))(
  ( (V!35332 (val!11431 Int)) )
))
(declare-datatypes ((ValueCell!10899 0))(
  ( (ValueCellFull!10899 (v!13993 V!35331)) (EmptyCell!10899) )
))
(declare-datatypes ((array!61521 0))(
  ( (array!61522 (arr!29618 (Array (_ BitVec 32) ValueCell!10899)) (size!30097 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61521)

(assert (=> b!981135 (= res!656559 (and (= (size!30097 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30096 _keys!1544) (size!30097 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36170 () Bool)

(declare-fun mapRes!36170 () Bool)

(assert (=> mapIsEmpty!36170 mapRes!36170))

(declare-fun b!981136 () Bool)

(declare-fun res!656561 () Bool)

(assert (=> b!981136 (=> (not res!656561) (not e!553096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61519 (_ BitVec 32)) Bool)

(assert (=> b!981136 (= res!656561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981137 () Bool)

(declare-fun e!553094 () Bool)

(assert (=> b!981137 (= e!553094 tp_is_empty!22761)))

(declare-fun b!981138 () Bool)

(declare-fun e!553095 () Bool)

(assert (=> b!981138 (= e!553095 (and e!553098 mapRes!36170))))

(declare-fun condMapEmpty!36170 () Bool)

(declare-fun mapDefault!36170 () ValueCell!10899)

(assert (=> b!981138 (= condMapEmpty!36170 (= (arr!29618 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10899)) mapDefault!36170)))))

(declare-fun res!656560 () Bool)

(assert (=> start!83958 (=> (not res!656560) (not e!553096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83958 (= res!656560 (validMask!0 mask!1948))))

(assert (=> start!83958 e!553096))

(assert (=> start!83958 true))

(declare-fun array_inv!22897 (array!61521) Bool)

(assert (=> start!83958 (and (array_inv!22897 _values!1278) e!553095)))

(declare-fun array_inv!22898 (array!61519) Bool)

(assert (=> start!83958 (array_inv!22898 _keys!1544)))

(declare-fun mapNonEmpty!36170 () Bool)

(declare-fun tp!68683 () Bool)

(assert (=> mapNonEmpty!36170 (= mapRes!36170 (and tp!68683 e!553094))))

(declare-fun mapValue!36170 () ValueCell!10899)

(declare-fun mapKey!36170 () (_ BitVec 32))

(declare-fun mapRest!36170 () (Array (_ BitVec 32) ValueCell!10899))

(assert (=> mapNonEmpty!36170 (= (arr!29618 _values!1278) (store mapRest!36170 mapKey!36170 mapValue!36170))))

(assert (= (and start!83958 res!656560) b!981135))

(assert (= (and b!981135 res!656559) b!981136))

(assert (= (and b!981136 res!656561) b!981133))

(assert (= (and b!981138 condMapEmpty!36170) mapIsEmpty!36170))

(assert (= (and b!981138 (not condMapEmpty!36170)) mapNonEmpty!36170))

(get-info :version)

(assert (= (and mapNonEmpty!36170 ((_ is ValueCellFull!10899) mapValue!36170)) b!981137))

(assert (= (and b!981138 ((_ is ValueCellFull!10899) mapDefault!36170)) b!981134))

(assert (= start!83958 b!981138))

(declare-fun m!908611 () Bool)

(assert (=> b!981133 m!908611))

(declare-fun m!908613 () Bool)

(assert (=> b!981136 m!908613))

(declare-fun m!908615 () Bool)

(assert (=> start!83958 m!908615))

(declare-fun m!908617 () Bool)

(assert (=> start!83958 m!908617))

(declare-fun m!908619 () Bool)

(assert (=> start!83958 m!908619))

(declare-fun m!908621 () Bool)

(assert (=> mapNonEmpty!36170 m!908621))

(check-sat (not b!981133) (not start!83958) tp_is_empty!22761 (not mapNonEmpty!36170) (not b!981136))
(check-sat)
