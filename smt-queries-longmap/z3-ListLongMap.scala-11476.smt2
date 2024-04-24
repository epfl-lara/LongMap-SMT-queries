; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134066 () Bool)

(assert start!134066)

(declare-fun res!1069281 () Bool)

(declare-fun e!872375 () Bool)

(assert (=> start!134066 (=> (not res!1069281) (not e!872375))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134066 (= res!1069281 (validMask!0 mask!947))))

(assert (=> start!134066 e!872375))

(assert (=> start!134066 true))

(declare-datatypes ((V!59857 0))(
  ( (V!59858 (val!19452 Int)) )
))
(declare-datatypes ((ValueCell!18338 0))(
  ( (ValueCellFull!18338 (v!22196 V!59857)) (EmptyCell!18338) )
))
(declare-datatypes ((array!104298 0))(
  ( (array!104299 (arr!50334 (Array (_ BitVec 32) ValueCell!18338)) (size!50885 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104298)

(declare-fun e!872373 () Bool)

(declare-fun array_inv!39369 (array!104298) Bool)

(assert (=> start!134066 (and (array_inv!39369 _values!487) e!872373)))

(declare-datatypes ((array!104300 0))(
  ( (array!104301 (arr!50335 (Array (_ BitVec 32) (_ BitVec 64))) (size!50886 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104300)

(declare-fun array_inv!39370 (array!104300) Bool)

(assert (=> start!134066 (array_inv!39370 _keys!637)))

(declare-fun mapNonEmpty!59481 () Bool)

(declare-fun mapRes!59481 () Bool)

(declare-fun tp!113316 () Bool)

(declare-fun e!872374 () Bool)

(assert (=> mapNonEmpty!59481 (= mapRes!59481 (and tp!113316 e!872374))))

(declare-fun mapValue!59481 () ValueCell!18338)

(declare-fun mapKey!59481 () (_ BitVec 32))

(declare-fun mapRest!59481 () (Array (_ BitVec 32) ValueCell!18338))

(assert (=> mapNonEmpty!59481 (= (arr!50334 _values!487) (store mapRest!59481 mapKey!59481 mapValue!59481))))

(declare-fun b!1565178 () Bool)

(declare-fun res!1069282 () Bool)

(assert (=> b!1565178 (=> (not res!1069282) (not e!872375))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565178 (= res!1069282 (and (= (size!50885 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50886 _keys!637) (size!50885 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565179 () Bool)

(declare-fun e!872376 () Bool)

(declare-fun tp_is_empty!38737 () Bool)

(assert (=> b!1565179 (= e!872376 tp_is_empty!38737)))

(declare-fun mapIsEmpty!59481 () Bool)

(assert (=> mapIsEmpty!59481 mapRes!59481))

(declare-fun b!1565180 () Bool)

(assert (=> b!1565180 (= e!872374 tp_is_empty!38737)))

(declare-fun b!1565181 () Bool)

(assert (=> b!1565181 (= e!872373 (and e!872376 mapRes!59481))))

(declare-fun condMapEmpty!59481 () Bool)

(declare-fun mapDefault!59481 () ValueCell!18338)

(assert (=> b!1565181 (= condMapEmpty!59481 (= (arr!50334 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18338)) mapDefault!59481)))))

(declare-fun b!1565182 () Bool)

(declare-fun res!1069283 () Bool)

(assert (=> b!1565182 (=> (not res!1069283) (not e!872375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104300 (_ BitVec 32)) Bool)

(assert (=> b!1565182 (= res!1069283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565183 () Bool)

(assert (=> b!1565183 (= e!872375 false)))

(declare-fun lt!672683 () Bool)

(declare-datatypes ((List!36528 0))(
  ( (Nil!36525) (Cons!36524 (h!37988 (_ BitVec 64)) (t!51367 List!36528)) )
))
(declare-fun arrayNoDuplicates!0 (array!104300 (_ BitVec 32) List!36528) Bool)

(assert (=> b!1565183 (= lt!672683 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36525))))

(assert (= (and start!134066 res!1069281) b!1565178))

(assert (= (and b!1565178 res!1069282) b!1565182))

(assert (= (and b!1565182 res!1069283) b!1565183))

(assert (= (and b!1565181 condMapEmpty!59481) mapIsEmpty!59481))

(assert (= (and b!1565181 (not condMapEmpty!59481)) mapNonEmpty!59481))

(get-info :version)

(assert (= (and mapNonEmpty!59481 ((_ is ValueCellFull!18338) mapValue!59481)) b!1565180))

(assert (= (and b!1565181 ((_ is ValueCellFull!18338) mapDefault!59481)) b!1565179))

(assert (= start!134066 b!1565181))

(declare-fun m!1440747 () Bool)

(assert (=> start!134066 m!1440747))

(declare-fun m!1440749 () Bool)

(assert (=> start!134066 m!1440749))

(declare-fun m!1440751 () Bool)

(assert (=> start!134066 m!1440751))

(declare-fun m!1440753 () Bool)

(assert (=> mapNonEmpty!59481 m!1440753))

(declare-fun m!1440755 () Bool)

(assert (=> b!1565182 m!1440755))

(declare-fun m!1440757 () Bool)

(assert (=> b!1565183 m!1440757))

(check-sat (not mapNonEmpty!59481) (not start!134066) (not b!1565182) (not b!1565183) tp_is_empty!38737)
(check-sat)
