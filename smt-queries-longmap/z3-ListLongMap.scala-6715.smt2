; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84430 () Bool)

(assert start!84430)

(declare-fun b!986734 () Bool)

(declare-fun e!556282 () Bool)

(assert (=> b!986734 (= e!556282 false)))

(declare-fun lt!437754 () Bool)

(declare-datatypes ((array!62144 0))(
  ( (array!62145 (arr!29925 (Array (_ BitVec 32) (_ BitVec 64))) (size!30405 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62144)

(declare-datatypes ((List!20720 0))(
  ( (Nil!20717) (Cons!20716 (h!21884 (_ BitVec 64)) (t!29611 List!20720)) )
))
(declare-fun arrayNoDuplicates!0 (array!62144 (_ BitVec 32) List!20720) Bool)

(assert (=> b!986734 (= lt!437754 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20717))))

(declare-fun b!986735 () Bool)

(declare-fun res!660019 () Bool)

(assert (=> b!986735 (=> (not res!660019) (not e!556282))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35737 0))(
  ( (V!35738 (val!11583 Int)) )
))
(declare-datatypes ((ValueCell!11051 0))(
  ( (ValueCellFull!11051 (v!14142 V!35737)) (EmptyCell!11051) )
))
(declare-datatypes ((array!62146 0))(
  ( (array!62147 (arr!29926 (Array (_ BitVec 32) ValueCell!11051)) (size!30406 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62146)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986735 (= res!660019 (and (= (size!30406 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30405 _keys!1544) (size!30406 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36626 () Bool)

(declare-fun mapRes!36626 () Bool)

(assert (=> mapIsEmpty!36626 mapRes!36626))

(declare-fun b!986736 () Bool)

(declare-fun res!660018 () Bool)

(assert (=> b!986736 (=> (not res!660018) (not e!556282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62144 (_ BitVec 32)) Bool)

(assert (=> b!986736 (= res!660018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!660017 () Bool)

(assert (=> start!84430 (=> (not res!660017) (not e!556282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84430 (= res!660017 (validMask!0 mask!1948))))

(assert (=> start!84430 e!556282))

(assert (=> start!84430 true))

(declare-fun e!556283 () Bool)

(declare-fun array_inv!23145 (array!62146) Bool)

(assert (=> start!84430 (and (array_inv!23145 _values!1278) e!556283)))

(declare-fun array_inv!23146 (array!62144) Bool)

(assert (=> start!84430 (array_inv!23146 _keys!1544)))

(declare-fun b!986737 () Bool)

(declare-fun e!556284 () Bool)

(assert (=> b!986737 (= e!556283 (and e!556284 mapRes!36626))))

(declare-fun condMapEmpty!36626 () Bool)

(declare-fun mapDefault!36626 () ValueCell!11051)

(assert (=> b!986737 (= condMapEmpty!36626 (= (arr!29926 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11051)) mapDefault!36626)))))

(declare-fun b!986738 () Bool)

(declare-fun e!556281 () Bool)

(declare-fun tp_is_empty!23065 () Bool)

(assert (=> b!986738 (= e!556281 tp_is_empty!23065)))

(declare-fun b!986739 () Bool)

(assert (=> b!986739 (= e!556284 tp_is_empty!23065)))

(declare-fun mapNonEmpty!36626 () Bool)

(declare-fun tp!69482 () Bool)

(assert (=> mapNonEmpty!36626 (= mapRes!36626 (and tp!69482 e!556281))))

(declare-fun mapValue!36626 () ValueCell!11051)

(declare-fun mapKey!36626 () (_ BitVec 32))

(declare-fun mapRest!36626 () (Array (_ BitVec 32) ValueCell!11051))

(assert (=> mapNonEmpty!36626 (= (arr!29926 _values!1278) (store mapRest!36626 mapKey!36626 mapValue!36626))))

(assert (= (and start!84430 res!660017) b!986735))

(assert (= (and b!986735 res!660019) b!986736))

(assert (= (and b!986736 res!660018) b!986734))

(assert (= (and b!986737 condMapEmpty!36626) mapIsEmpty!36626))

(assert (= (and b!986737 (not condMapEmpty!36626)) mapNonEmpty!36626))

(get-info :version)

(assert (= (and mapNonEmpty!36626 ((_ is ValueCellFull!11051) mapValue!36626)) b!986738))

(assert (= (and b!986737 ((_ is ValueCellFull!11051) mapDefault!36626)) b!986739))

(assert (= start!84430 b!986737))

(declare-fun m!914165 () Bool)

(assert (=> b!986734 m!914165))

(declare-fun m!914167 () Bool)

(assert (=> b!986736 m!914167))

(declare-fun m!914169 () Bool)

(assert (=> start!84430 m!914169))

(declare-fun m!914171 () Bool)

(assert (=> start!84430 m!914171))

(declare-fun m!914173 () Bool)

(assert (=> start!84430 m!914173))

(declare-fun m!914175 () Bool)

(assert (=> mapNonEmpty!36626 m!914175))

(check-sat tp_is_empty!23065 (not start!84430) (not mapNonEmpty!36626) (not b!986734) (not b!986736))
(check-sat)
