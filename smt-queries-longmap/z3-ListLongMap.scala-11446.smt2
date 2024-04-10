; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133476 () Bool)

(assert start!133476)

(declare-fun b!1560450 () Bool)

(declare-fun e!869520 () Bool)

(declare-fun tp_is_empty!38559 () Bool)

(assert (=> b!1560450 (= e!869520 tp_is_empty!38559)))

(declare-fun b!1560451 () Bool)

(declare-fun res!1067044 () Bool)

(declare-fun e!869524 () Bool)

(assert (=> b!1560451 (=> (not res!1067044) (not e!869524))))

(declare-datatypes ((array!103842 0))(
  ( (array!103843 (arr!50113 (Array (_ BitVec 32) (_ BitVec 64))) (size!50663 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103842)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103842 (_ BitVec 32)) Bool)

(assert (=> b!1560451 (= res!1067044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560452 () Bool)

(declare-fun res!1067046 () Bool)

(assert (=> b!1560452 (=> (not res!1067046) (not e!869524))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59619 0))(
  ( (V!59620 (val!19363 Int)) )
))
(declare-datatypes ((ValueCell!18249 0))(
  ( (ValueCellFull!18249 (v!22115 V!59619)) (EmptyCell!18249) )
))
(declare-datatypes ((array!103844 0))(
  ( (array!103845 (arr!50114 (Array (_ BitVec 32) ValueCell!18249)) (size!50664 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103844)

(assert (=> b!1560452 (= res!1067046 (and (= (size!50664 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50663 _keys!637) (size!50664 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560453 () Bool)

(declare-fun e!869522 () Bool)

(assert (=> b!1560453 (= e!869522 tp_is_empty!38559)))

(declare-fun res!1067045 () Bool)

(assert (=> start!133476 (=> (not res!1067045) (not e!869524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133476 (= res!1067045 (validMask!0 mask!947))))

(assert (=> start!133476 e!869524))

(assert (=> start!133476 true))

(declare-fun e!869521 () Bool)

(declare-fun array_inv!38955 (array!103844) Bool)

(assert (=> start!133476 (and (array_inv!38955 _values!487) e!869521)))

(declare-fun array_inv!38956 (array!103842) Bool)

(assert (=> start!133476 (array_inv!38956 _keys!637)))

(declare-fun mapNonEmpty!59214 () Bool)

(declare-fun mapRes!59214 () Bool)

(declare-fun tp!112869 () Bool)

(assert (=> mapNonEmpty!59214 (= mapRes!59214 (and tp!112869 e!869520))))

(declare-fun mapKey!59214 () (_ BitVec 32))

(declare-fun mapRest!59214 () (Array (_ BitVec 32) ValueCell!18249))

(declare-fun mapValue!59214 () ValueCell!18249)

(assert (=> mapNonEmpty!59214 (= (arr!50114 _values!487) (store mapRest!59214 mapKey!59214 mapValue!59214))))

(declare-fun b!1560454 () Bool)

(assert (=> b!1560454 (= e!869524 false)))

(declare-fun lt!670995 () Bool)

(declare-datatypes ((List!36397 0))(
  ( (Nil!36394) (Cons!36393 (h!37839 (_ BitVec 64)) (t!51130 List!36397)) )
))
(declare-fun arrayNoDuplicates!0 (array!103842 (_ BitVec 32) List!36397) Bool)

(assert (=> b!1560454 (= lt!670995 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36394))))

(declare-fun b!1560455 () Bool)

(assert (=> b!1560455 (= e!869521 (and e!869522 mapRes!59214))))

(declare-fun condMapEmpty!59214 () Bool)

(declare-fun mapDefault!59214 () ValueCell!18249)

(assert (=> b!1560455 (= condMapEmpty!59214 (= (arr!50114 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18249)) mapDefault!59214)))))

(declare-fun mapIsEmpty!59214 () Bool)

(assert (=> mapIsEmpty!59214 mapRes!59214))

(assert (= (and start!133476 res!1067045) b!1560452))

(assert (= (and b!1560452 res!1067046) b!1560451))

(assert (= (and b!1560451 res!1067044) b!1560454))

(assert (= (and b!1560455 condMapEmpty!59214) mapIsEmpty!59214))

(assert (= (and b!1560455 (not condMapEmpty!59214)) mapNonEmpty!59214))

(get-info :version)

(assert (= (and mapNonEmpty!59214 ((_ is ValueCellFull!18249) mapValue!59214)) b!1560450))

(assert (= (and b!1560455 ((_ is ValueCellFull!18249) mapDefault!59214)) b!1560453))

(assert (= start!133476 b!1560455))

(declare-fun m!1436293 () Bool)

(assert (=> b!1560451 m!1436293))

(declare-fun m!1436295 () Bool)

(assert (=> start!133476 m!1436295))

(declare-fun m!1436297 () Bool)

(assert (=> start!133476 m!1436297))

(declare-fun m!1436299 () Bool)

(assert (=> start!133476 m!1436299))

(declare-fun m!1436301 () Bool)

(assert (=> mapNonEmpty!59214 m!1436301))

(declare-fun m!1436303 () Bool)

(assert (=> b!1560454 m!1436303))

(check-sat (not start!133476) (not b!1560454) (not mapNonEmpty!59214) (not b!1560451) tp_is_empty!38559)
(check-sat)
