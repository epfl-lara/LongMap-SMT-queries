; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83964 () Bool)

(assert start!83964)

(declare-fun b!981187 () Bool)

(declare-fun e!553141 () Bool)

(declare-fun tp_is_empty!22767 () Bool)

(assert (=> b!981187 (= e!553141 tp_is_empty!22767)))

(declare-fun b!981188 () Bool)

(declare-fun e!553139 () Bool)

(declare-fun mapRes!36179 () Bool)

(assert (=> b!981188 (= e!553139 (and e!553141 mapRes!36179))))

(declare-fun condMapEmpty!36179 () Bool)

(declare-datatypes ((V!35339 0))(
  ( (V!35340 (val!11434 Int)) )
))
(declare-datatypes ((ValueCell!10902 0))(
  ( (ValueCellFull!10902 (v!13996 V!35339)) (EmptyCell!10902) )
))
(declare-datatypes ((array!61531 0))(
  ( (array!61532 (arr!29623 (Array (_ BitVec 32) ValueCell!10902)) (size!30102 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61531)

(declare-fun mapDefault!36179 () ValueCell!10902)

(assert (=> b!981188 (= condMapEmpty!36179 (= (arr!29623 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10902)) mapDefault!36179)))))

(declare-fun res!656587 () Bool)

(declare-fun e!553143 () Bool)

(assert (=> start!83964 (=> (not res!656587) (not e!553143))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83964 (= res!656587 (validMask!0 mask!1948))))

(assert (=> start!83964 e!553143))

(assert (=> start!83964 true))

(declare-fun array_inv!22903 (array!61531) Bool)

(assert (=> start!83964 (and (array_inv!22903 _values!1278) e!553139)))

(declare-datatypes ((array!61533 0))(
  ( (array!61534 (arr!29624 (Array (_ BitVec 32) (_ BitVec 64))) (size!30103 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61533)

(declare-fun array_inv!22904 (array!61533) Bool)

(assert (=> start!83964 (array_inv!22904 _keys!1544)))

(declare-fun b!981189 () Bool)

(assert (=> b!981189 (= e!553143 false)))

(declare-fun lt!435668 () Bool)

(declare-datatypes ((List!20519 0))(
  ( (Nil!20516) (Cons!20515 (h!21677 (_ BitVec 64)) (t!29202 List!20519)) )
))
(declare-fun arrayNoDuplicates!0 (array!61533 (_ BitVec 32) List!20519) Bool)

(assert (=> b!981189 (= lt!435668 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20516))))

(declare-fun mapNonEmpty!36179 () Bool)

(declare-fun tp!68692 () Bool)

(declare-fun e!553142 () Bool)

(assert (=> mapNonEmpty!36179 (= mapRes!36179 (and tp!68692 e!553142))))

(declare-fun mapRest!36179 () (Array (_ BitVec 32) ValueCell!10902))

(declare-fun mapKey!36179 () (_ BitVec 32))

(declare-fun mapValue!36179 () ValueCell!10902)

(assert (=> mapNonEmpty!36179 (= (arr!29623 _values!1278) (store mapRest!36179 mapKey!36179 mapValue!36179))))

(declare-fun mapIsEmpty!36179 () Bool)

(assert (=> mapIsEmpty!36179 mapRes!36179))

(declare-fun b!981190 () Bool)

(declare-fun res!656586 () Bool)

(assert (=> b!981190 (=> (not res!656586) (not e!553143))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981190 (= res!656586 (and (= (size!30102 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30103 _keys!1544) (size!30102 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981191 () Bool)

(assert (=> b!981191 (= e!553142 tp_is_empty!22767)))

(declare-fun b!981192 () Bool)

(declare-fun res!656588 () Bool)

(assert (=> b!981192 (=> (not res!656588) (not e!553143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61533 (_ BitVec 32)) Bool)

(assert (=> b!981192 (= res!656588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83964 res!656587) b!981190))

(assert (= (and b!981190 res!656586) b!981192))

(assert (= (and b!981192 res!656588) b!981189))

(assert (= (and b!981188 condMapEmpty!36179) mapIsEmpty!36179))

(assert (= (and b!981188 (not condMapEmpty!36179)) mapNonEmpty!36179))

(get-info :version)

(assert (= (and mapNonEmpty!36179 ((_ is ValueCellFull!10902) mapValue!36179)) b!981191))

(assert (= (and b!981188 ((_ is ValueCellFull!10902) mapDefault!36179)) b!981187))

(assert (= start!83964 b!981188))

(declare-fun m!908647 () Bool)

(assert (=> start!83964 m!908647))

(declare-fun m!908649 () Bool)

(assert (=> start!83964 m!908649))

(declare-fun m!908651 () Bool)

(assert (=> start!83964 m!908651))

(declare-fun m!908653 () Bool)

(assert (=> b!981189 m!908653))

(declare-fun m!908655 () Bool)

(assert (=> mapNonEmpty!36179 m!908655))

(declare-fun m!908657 () Bool)

(assert (=> b!981192 m!908657))

(check-sat (not start!83964) (not mapNonEmpty!36179) (not b!981189) tp_is_empty!22767 (not b!981192))
(check-sat)
