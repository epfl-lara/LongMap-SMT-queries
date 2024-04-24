; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84130 () Bool)

(assert start!84130)

(declare-fun b!982072 () Bool)

(declare-fun e!553707 () Bool)

(declare-fun e!553708 () Bool)

(declare-fun mapRes!36176 () Bool)

(assert (=> b!982072 (= e!553707 (and e!553708 mapRes!36176))))

(declare-fun condMapEmpty!36176 () Bool)

(declare-datatypes ((V!35337 0))(
  ( (V!35338 (val!11433 Int)) )
))
(declare-datatypes ((ValueCell!10901 0))(
  ( (ValueCellFull!10901 (v!13992 V!35337)) (EmptyCell!10901) )
))
(declare-datatypes ((array!61562 0))(
  ( (array!61563 (arr!29634 (Array (_ BitVec 32) ValueCell!10901)) (size!30114 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61562)

(declare-fun mapDefault!36176 () ValueCell!10901)

(assert (=> b!982072 (= condMapEmpty!36176 (= (arr!29634 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10901)) mapDefault!36176)))))

(declare-fun b!982073 () Bool)

(declare-fun e!553709 () Bool)

(declare-fun tp_is_empty!22765 () Bool)

(assert (=> b!982073 (= e!553709 tp_is_empty!22765)))

(declare-fun b!982074 () Bool)

(declare-fun res!656922 () Bool)

(declare-fun e!553710 () Bool)

(assert (=> b!982074 (=> (not res!656922) (not e!553710))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61564 0))(
  ( (array!61565 (arr!29635 (Array (_ BitVec 32) (_ BitVec 64))) (size!30115 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61564)

(assert (=> b!982074 (= res!656922 (and (= (size!30114 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30115 _keys!1544) (size!30114 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982075 () Bool)

(declare-fun res!656923 () Bool)

(assert (=> b!982075 (=> (not res!656923) (not e!553710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61564 (_ BitVec 32)) Bool)

(assert (=> b!982075 (= res!656923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982076 () Bool)

(assert (=> b!982076 (= e!553710 false)))

(declare-fun lt!436026 () Bool)

(declare-datatypes ((List!20527 0))(
  ( (Nil!20524) (Cons!20523 (h!21691 (_ BitVec 64)) (t!29202 List!20527)) )
))
(declare-fun arrayNoDuplicates!0 (array!61564 (_ BitVec 32) List!20527) Bool)

(assert (=> b!982076 (= lt!436026 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20524))))

(declare-fun res!656921 () Bool)

(assert (=> start!84130 (=> (not res!656921) (not e!553710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84130 (= res!656921 (validMask!0 mask!1948))))

(assert (=> start!84130 e!553710))

(assert (=> start!84130 true))

(declare-fun array_inv!22937 (array!61562) Bool)

(assert (=> start!84130 (and (array_inv!22937 _values!1278) e!553707)))

(declare-fun array_inv!22938 (array!61564) Bool)

(assert (=> start!84130 (array_inv!22938 _keys!1544)))

(declare-fun mapIsEmpty!36176 () Bool)

(assert (=> mapIsEmpty!36176 mapRes!36176))

(declare-fun b!982077 () Bool)

(assert (=> b!982077 (= e!553708 tp_is_empty!22765)))

(declare-fun mapNonEmpty!36176 () Bool)

(declare-fun tp!68690 () Bool)

(assert (=> mapNonEmpty!36176 (= mapRes!36176 (and tp!68690 e!553709))))

(declare-fun mapValue!36176 () ValueCell!10901)

(declare-fun mapRest!36176 () (Array (_ BitVec 32) ValueCell!10901))

(declare-fun mapKey!36176 () (_ BitVec 32))

(assert (=> mapNonEmpty!36176 (= (arr!29634 _values!1278) (store mapRest!36176 mapKey!36176 mapValue!36176))))

(assert (= (and start!84130 res!656921) b!982074))

(assert (= (and b!982074 res!656922) b!982075))

(assert (= (and b!982075 res!656923) b!982076))

(assert (= (and b!982072 condMapEmpty!36176) mapIsEmpty!36176))

(assert (= (and b!982072 (not condMapEmpty!36176)) mapNonEmpty!36176))

(get-info :version)

(assert (= (and mapNonEmpty!36176 ((_ is ValueCellFull!10901) mapValue!36176)) b!982073))

(assert (= (and b!982072 ((_ is ValueCellFull!10901) mapDefault!36176)) b!982077))

(assert (= start!84130 b!982072))

(declare-fun m!909929 () Bool)

(assert (=> b!982075 m!909929))

(declare-fun m!909931 () Bool)

(assert (=> b!982076 m!909931))

(declare-fun m!909933 () Bool)

(assert (=> start!84130 m!909933))

(declare-fun m!909935 () Bool)

(assert (=> start!84130 m!909935))

(declare-fun m!909937 () Bool)

(assert (=> start!84130 m!909937))

(declare-fun m!909939 () Bool)

(assert (=> mapNonEmpty!36176 m!909939))

(check-sat (not start!84130) (not mapNonEmpty!36176) (not b!982075) (not b!982076) tp_is_empty!22765)
(check-sat)
