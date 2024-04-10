; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84114 () Bool)

(assert start!84114)

(declare-fun res!658135 () Bool)

(declare-fun e!554428 () Bool)

(assert (=> start!84114 (=> (not res!658135) (not e!554428))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84114 (= res!658135 (validMask!0 mask!1948))))

(assert (=> start!84114 e!554428))

(assert (=> start!84114 true))

(declare-datatypes ((V!35539 0))(
  ( (V!35540 (val!11509 Int)) )
))
(declare-datatypes ((ValueCell!10977 0))(
  ( (ValueCellFull!10977 (v!14071 V!35539)) (EmptyCell!10977) )
))
(declare-datatypes ((array!61821 0))(
  ( (array!61822 (arr!29768 (Array (_ BitVec 32) ValueCell!10977)) (size!30247 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61821)

(declare-fun e!554430 () Bool)

(declare-fun array_inv!23017 (array!61821) Bool)

(assert (=> start!84114 (and (array_inv!23017 _values!1278) e!554430)))

(declare-datatypes ((array!61823 0))(
  ( (array!61824 (arr!29769 (Array (_ BitVec 32) (_ BitVec 64))) (size!30248 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61823)

(declare-fun array_inv!23018 (array!61823) Bool)

(assert (=> start!84114 (array_inv!23018 _keys!1544)))

(declare-fun b!983518 () Bool)

(declare-fun e!554426 () Bool)

(declare-fun mapRes!36404 () Bool)

(assert (=> b!983518 (= e!554430 (and e!554426 mapRes!36404))))

(declare-fun condMapEmpty!36404 () Bool)

(declare-fun mapDefault!36404 () ValueCell!10977)

(assert (=> b!983518 (= condMapEmpty!36404 (= (arr!29768 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10977)) mapDefault!36404)))))

(declare-fun mapNonEmpty!36404 () Bool)

(declare-fun tp!69088 () Bool)

(declare-fun e!554427 () Bool)

(assert (=> mapNonEmpty!36404 (= mapRes!36404 (and tp!69088 e!554427))))

(declare-fun mapKey!36404 () (_ BitVec 32))

(declare-fun mapRest!36404 () (Array (_ BitVec 32) ValueCell!10977))

(declare-fun mapValue!36404 () ValueCell!10977)

(assert (=> mapNonEmpty!36404 (= (arr!29768 _values!1278) (store mapRest!36404 mapKey!36404 mapValue!36404))))

(declare-fun b!983519 () Bool)

(declare-fun res!658134 () Bool)

(assert (=> b!983519 (=> (not res!658134) (not e!554428))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983519 (= res!658134 (and (= (size!30247 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30248 _keys!1544) (size!30247 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983520 () Bool)

(declare-fun res!658136 () Bool)

(assert (=> b!983520 (=> (not res!658136) (not e!554428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61823 (_ BitVec 32)) Bool)

(assert (=> b!983520 (= res!658136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36404 () Bool)

(assert (=> mapIsEmpty!36404 mapRes!36404))

(declare-fun b!983521 () Bool)

(assert (=> b!983521 (= e!554428 false)))

(declare-fun lt!436532 () Bool)

(declare-datatypes ((List!20614 0))(
  ( (Nil!20611) (Cons!20610 (h!21772 (_ BitVec 64)) (t!29405 List!20614)) )
))
(declare-fun arrayNoDuplicates!0 (array!61823 (_ BitVec 32) List!20614) Bool)

(assert (=> b!983521 (= lt!436532 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20611))))

(declare-fun b!983522 () Bool)

(declare-fun tp_is_empty!22917 () Bool)

(assert (=> b!983522 (= e!554426 tp_is_empty!22917)))

(declare-fun b!983523 () Bool)

(assert (=> b!983523 (= e!554427 tp_is_empty!22917)))

(assert (= (and start!84114 res!658135) b!983519))

(assert (= (and b!983519 res!658134) b!983520))

(assert (= (and b!983520 res!658136) b!983521))

(assert (= (and b!983518 condMapEmpty!36404) mapIsEmpty!36404))

(assert (= (and b!983518 (not condMapEmpty!36404)) mapNonEmpty!36404))

(get-info :version)

(assert (= (and mapNonEmpty!36404 ((_ is ValueCellFull!10977) mapValue!36404)) b!983523))

(assert (= (and b!983518 ((_ is ValueCellFull!10977) mapDefault!36404)) b!983522))

(assert (= start!84114 b!983518))

(declare-fun m!910765 () Bool)

(assert (=> start!84114 m!910765))

(declare-fun m!910767 () Bool)

(assert (=> start!84114 m!910767))

(declare-fun m!910769 () Bool)

(assert (=> start!84114 m!910769))

(declare-fun m!910771 () Bool)

(assert (=> mapNonEmpty!36404 m!910771))

(declare-fun m!910773 () Bool)

(assert (=> b!983520 m!910773))

(declare-fun m!910775 () Bool)

(assert (=> b!983521 m!910775))

(check-sat (not mapNonEmpty!36404) (not b!983520) (not start!84114) (not b!983521) tp_is_empty!22917)
(check-sat)
