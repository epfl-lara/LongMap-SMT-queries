; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133500 () Bool)

(assert start!133500)

(declare-fun b!1560666 () Bool)

(declare-fun e!869703 () Bool)

(declare-fun tp_is_empty!38583 () Bool)

(assert (=> b!1560666 (= e!869703 tp_is_empty!38583)))

(declare-fun b!1560667 () Bool)

(declare-fun res!1067152 () Bool)

(declare-fun e!869702 () Bool)

(assert (=> b!1560667 (=> (not res!1067152) (not e!869702))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103886 0))(
  ( (array!103887 (arr!50135 (Array (_ BitVec 32) (_ BitVec 64))) (size!50685 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103886)

(declare-datatypes ((V!59651 0))(
  ( (V!59652 (val!19375 Int)) )
))
(declare-datatypes ((ValueCell!18261 0))(
  ( (ValueCellFull!18261 (v!22127 V!59651)) (EmptyCell!18261) )
))
(declare-datatypes ((array!103888 0))(
  ( (array!103889 (arr!50136 (Array (_ BitVec 32) ValueCell!18261)) (size!50686 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103888)

(assert (=> b!1560667 (= res!1067152 (and (= (size!50686 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50685 _keys!637) (size!50686 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560668 () Bool)

(declare-fun res!1067154 () Bool)

(assert (=> b!1560668 (=> (not res!1067154) (not e!869702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103886 (_ BitVec 32)) Bool)

(assert (=> b!1560668 (= res!1067154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560669 () Bool)

(assert (=> b!1560669 (= e!869702 false)))

(declare-fun lt!671031 () Bool)

(declare-datatypes ((List!36405 0))(
  ( (Nil!36402) (Cons!36401 (h!37847 (_ BitVec 64)) (t!51138 List!36405)) )
))
(declare-fun arrayNoDuplicates!0 (array!103886 (_ BitVec 32) List!36405) Bool)

(assert (=> b!1560669 (= lt!671031 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36402))))

(declare-fun res!1067153 () Bool)

(assert (=> start!133500 (=> (not res!1067153) (not e!869702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133500 (= res!1067153 (validMask!0 mask!947))))

(assert (=> start!133500 e!869702))

(assert (=> start!133500 true))

(declare-fun e!869701 () Bool)

(declare-fun array_inv!38973 (array!103888) Bool)

(assert (=> start!133500 (and (array_inv!38973 _values!487) e!869701)))

(declare-fun array_inv!38974 (array!103886) Bool)

(assert (=> start!133500 (array_inv!38974 _keys!637)))

(declare-fun b!1560670 () Bool)

(declare-fun mapRes!59250 () Bool)

(assert (=> b!1560670 (= e!869701 (and e!869703 mapRes!59250))))

(declare-fun condMapEmpty!59250 () Bool)

(declare-fun mapDefault!59250 () ValueCell!18261)

(assert (=> b!1560670 (= condMapEmpty!59250 (= (arr!50136 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18261)) mapDefault!59250)))))

(declare-fun mapIsEmpty!59250 () Bool)

(assert (=> mapIsEmpty!59250 mapRes!59250))

(declare-fun mapNonEmpty!59250 () Bool)

(declare-fun tp!112905 () Bool)

(declare-fun e!869704 () Bool)

(assert (=> mapNonEmpty!59250 (= mapRes!59250 (and tp!112905 e!869704))))

(declare-fun mapKey!59250 () (_ BitVec 32))

(declare-fun mapValue!59250 () ValueCell!18261)

(declare-fun mapRest!59250 () (Array (_ BitVec 32) ValueCell!18261))

(assert (=> mapNonEmpty!59250 (= (arr!50136 _values!487) (store mapRest!59250 mapKey!59250 mapValue!59250))))

(declare-fun b!1560671 () Bool)

(assert (=> b!1560671 (= e!869704 tp_is_empty!38583)))

(assert (= (and start!133500 res!1067153) b!1560667))

(assert (= (and b!1560667 res!1067152) b!1560668))

(assert (= (and b!1560668 res!1067154) b!1560669))

(assert (= (and b!1560670 condMapEmpty!59250) mapIsEmpty!59250))

(assert (= (and b!1560670 (not condMapEmpty!59250)) mapNonEmpty!59250))

(get-info :version)

(assert (= (and mapNonEmpty!59250 ((_ is ValueCellFull!18261) mapValue!59250)) b!1560671))

(assert (= (and b!1560670 ((_ is ValueCellFull!18261) mapDefault!59250)) b!1560666))

(assert (= start!133500 b!1560670))

(declare-fun m!1436437 () Bool)

(assert (=> b!1560668 m!1436437))

(declare-fun m!1436439 () Bool)

(assert (=> b!1560669 m!1436439))

(declare-fun m!1436441 () Bool)

(assert (=> start!133500 m!1436441))

(declare-fun m!1436443 () Bool)

(assert (=> start!133500 m!1436443))

(declare-fun m!1436445 () Bool)

(assert (=> start!133500 m!1436445))

(declare-fun m!1436447 () Bool)

(assert (=> mapNonEmpty!59250 m!1436447))

(check-sat (not b!1560668) (not start!133500) tp_is_empty!38583 (not b!1560669) (not mapNonEmpty!59250))
(check-sat)
