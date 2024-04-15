; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133604 () Bool)

(assert start!133604)

(declare-fun b!1562429 () Bool)

(declare-fun res!1068293 () Bool)

(declare-fun e!870666 () Bool)

(assert (=> b!1562429 (=> (not res!1068293) (not e!870666))))

(declare-datatypes ((array!104098 0))(
  ( (array!104099 (arr!50242 (Array (_ BitVec 32) (_ BitVec 64))) (size!50794 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104098)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104098 (_ BitVec 32)) Bool)

(assert (=> b!1562429 (= res!1068293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59481 () Bool)

(declare-fun mapRes!59481 () Bool)

(assert (=> mapIsEmpty!59481 mapRes!59481))

(declare-fun b!1562430 () Bool)

(declare-fun e!870669 () Bool)

(declare-fun tp_is_empty!38737 () Bool)

(assert (=> b!1562430 (= e!870669 tp_is_empty!38737)))

(declare-fun res!1068294 () Bool)

(assert (=> start!133604 (=> (not res!1068294) (not e!870666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133604 (= res!1068294 (validMask!0 mask!947))))

(assert (=> start!133604 e!870666))

(assert (=> start!133604 true))

(declare-datatypes ((V!59857 0))(
  ( (V!59858 (val!19452 Int)) )
))
(declare-datatypes ((ValueCell!18338 0))(
  ( (ValueCellFull!18338 (v!22200 V!59857)) (EmptyCell!18338) )
))
(declare-datatypes ((array!104100 0))(
  ( (array!104101 (arr!50243 (Array (_ BitVec 32) ValueCell!18338)) (size!50795 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104100)

(declare-fun e!870668 () Bool)

(declare-fun array_inv!39235 (array!104100) Bool)

(assert (=> start!133604 (and (array_inv!39235 _values!487) e!870668)))

(declare-fun array_inv!39236 (array!104098) Bool)

(assert (=> start!133604 (array_inv!39236 _keys!637)))

(declare-fun b!1562431 () Bool)

(assert (=> b!1562431 (= e!870668 (and e!870669 mapRes!59481))))

(declare-fun condMapEmpty!59481 () Bool)

(declare-fun mapDefault!59481 () ValueCell!18338)

(assert (=> b!1562431 (= condMapEmpty!59481 (= (arr!50243 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18338)) mapDefault!59481)))))

(declare-fun mapNonEmpty!59481 () Bool)

(declare-fun tp!113317 () Bool)

(declare-fun e!870670 () Bool)

(assert (=> mapNonEmpty!59481 (= mapRes!59481 (and tp!113317 e!870670))))

(declare-fun mapValue!59481 () ValueCell!18338)

(declare-fun mapRest!59481 () (Array (_ BitVec 32) ValueCell!18338))

(declare-fun mapKey!59481 () (_ BitVec 32))

(assert (=> mapNonEmpty!59481 (= (arr!50243 _values!487) (store mapRest!59481 mapKey!59481 mapValue!59481))))

(declare-fun b!1562432 () Bool)

(declare-fun res!1068292 () Bool)

(assert (=> b!1562432 (=> (not res!1068292) (not e!870666))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562432 (= res!1068292 (and (= (size!50795 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50794 _keys!637) (size!50795 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562433 () Bool)

(assert (=> b!1562433 (= e!870670 tp_is_empty!38737)))

(declare-fun b!1562434 () Bool)

(assert (=> b!1562434 (= e!870666 false)))

(declare-fun lt!671489 () Bool)

(declare-datatypes ((List!36538 0))(
  ( (Nil!36535) (Cons!36534 (h!37981 (_ BitVec 64)) (t!51377 List!36538)) )
))
(declare-fun arrayNoDuplicates!0 (array!104098 (_ BitVec 32) List!36538) Bool)

(assert (=> b!1562434 (= lt!671489 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36535))))

(assert (= (and start!133604 res!1068294) b!1562432))

(assert (= (and b!1562432 res!1068292) b!1562429))

(assert (= (and b!1562429 res!1068293) b!1562434))

(assert (= (and b!1562431 condMapEmpty!59481) mapIsEmpty!59481))

(assert (= (and b!1562431 (not condMapEmpty!59481)) mapNonEmpty!59481))

(get-info :version)

(assert (= (and mapNonEmpty!59481 ((_ is ValueCellFull!18338) mapValue!59481)) b!1562433))

(assert (= (and b!1562431 ((_ is ValueCellFull!18338) mapDefault!59481)) b!1562430))

(assert (= start!133604 b!1562431))

(declare-fun m!1437597 () Bool)

(assert (=> b!1562429 m!1437597))

(declare-fun m!1437599 () Bool)

(assert (=> start!133604 m!1437599))

(declare-fun m!1437601 () Bool)

(assert (=> start!133604 m!1437601))

(declare-fun m!1437603 () Bool)

(assert (=> start!133604 m!1437603))

(declare-fun m!1437605 () Bool)

(assert (=> mapNonEmpty!59481 m!1437605))

(declare-fun m!1437607 () Bool)

(assert (=> b!1562434 m!1437607))

(check-sat (not start!133604) (not b!1562429) tp_is_empty!38737 (not mapNonEmpty!59481) (not b!1562434))
(check-sat)
