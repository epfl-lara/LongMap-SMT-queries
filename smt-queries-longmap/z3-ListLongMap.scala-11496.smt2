; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133734 () Bool)

(assert start!133734)

(declare-fun res!1069317 () Bool)

(declare-fun e!871684 () Bool)

(assert (=> start!133734 (=> (not res!1069317) (not e!871684))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133734 (= res!1069317 (validMask!0 mask!947))))

(assert (=> start!133734 e!871684))

(assert (=> start!133734 true))

(declare-datatypes ((array!104332 0))(
  ( (array!104333 (arr!50358 (Array (_ BitVec 32) (_ BitVec 64))) (size!50910 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104332)

(declare-fun array_inv!39331 (array!104332) Bool)

(assert (=> start!133734 (array_inv!39331 _keys!637)))

(declare-datatypes ((V!60017 0))(
  ( (V!60018 (val!19512 Int)) )
))
(declare-datatypes ((ValueCell!18398 0))(
  ( (ValueCellFull!18398 (v!22260 V!60017)) (EmptyCell!18398) )
))
(declare-datatypes ((array!104334 0))(
  ( (array!104335 (arr!50359 (Array (_ BitVec 32) ValueCell!18398)) (size!50911 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104334)

(declare-fun e!871687 () Bool)

(declare-fun array_inv!39332 (array!104334) Bool)

(assert (=> start!133734 (and (array_inv!39332 _values!487) e!871687)))

(declare-fun b!1564009 () Bool)

(declare-fun res!1069316 () Bool)

(assert (=> b!1564009 (=> (not res!1069316) (not e!871684))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564009 (= res!1069316 (and (= (size!50911 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50910 _keys!637) (size!50911 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59664 () Bool)

(declare-fun mapRes!59664 () Bool)

(assert (=> mapIsEmpty!59664 mapRes!59664))

(declare-fun b!1564010 () Bool)

(declare-fun res!1069315 () Bool)

(assert (=> b!1564010 (=> (not res!1069315) (not e!871684))))

(declare-datatypes ((tuple2!25254 0))(
  ( (tuple2!25255 (_1!12638 (_ BitVec 64)) (_2!12638 V!60017)) )
))
(declare-datatypes ((List!36609 0))(
  ( (Nil!36606) (Cons!36605 (h!38052 tuple2!25254) (t!51448 List!36609)) )
))
(declare-datatypes ((ListLongMap!22689 0))(
  ( (ListLongMap!22690 (toList!11360 List!36609)) )
))
(declare-fun contains!10271 (ListLongMap!22689 (_ BitVec 64)) Bool)

(assert (=> b!1564010 (= res!1069315 (not (contains!10271 (ListLongMap!22690 Nil!36606) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1564011 () Bool)

(assert (=> b!1564011 (= e!871684 false)))

(declare-fun lt!671741 () Bool)

(assert (=> b!1564011 (= lt!671741 (contains!10271 (ListLongMap!22690 Nil!36606) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564012 () Bool)

(declare-fun res!1069313 () Bool)

(assert (=> b!1564012 (=> (not res!1069313) (not e!871684))))

(declare-datatypes ((List!36610 0))(
  ( (Nil!36607) (Cons!36606 (h!38053 (_ BitVec 64)) (t!51449 List!36610)) )
))
(declare-fun arrayNoDuplicates!0 (array!104332 (_ BitVec 32) List!36610) Bool)

(assert (=> b!1564012 (= res!1069313 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36607))))

(declare-fun b!1564013 () Bool)

(declare-fun res!1069312 () Bool)

(assert (=> b!1564013 (=> (not res!1069312) (not e!871684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104332 (_ BitVec 32)) Bool)

(assert (=> b!1564013 (= res!1069312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564014 () Bool)

(declare-fun e!871686 () Bool)

(declare-fun tp_is_empty!38857 () Bool)

(assert (=> b!1564014 (= e!871686 tp_is_empty!38857)))

(declare-fun b!1564015 () Bool)

(assert (=> b!1564015 (= e!871687 (and e!871686 mapRes!59664))))

(declare-fun condMapEmpty!59664 () Bool)

(declare-fun mapDefault!59664 () ValueCell!18398)

(assert (=> b!1564015 (= condMapEmpty!59664 (= (arr!50359 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18398)) mapDefault!59664)))))

(declare-fun b!1564016 () Bool)

(declare-fun e!871685 () Bool)

(assert (=> b!1564016 (= e!871685 tp_is_empty!38857)))

(declare-fun b!1564017 () Bool)

(declare-fun res!1069314 () Bool)

(assert (=> b!1564017 (=> (not res!1069314) (not e!871684))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564017 (= res!1069314 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50910 _keys!637)) (bvsge from!782 (size!50910 _keys!637))))))

(declare-fun mapNonEmpty!59664 () Bool)

(declare-fun tp!113590 () Bool)

(assert (=> mapNonEmpty!59664 (= mapRes!59664 (and tp!113590 e!871685))))

(declare-fun mapKey!59664 () (_ BitVec 32))

(declare-fun mapValue!59664 () ValueCell!18398)

(declare-fun mapRest!59664 () (Array (_ BitVec 32) ValueCell!18398))

(assert (=> mapNonEmpty!59664 (= (arr!50359 _values!487) (store mapRest!59664 mapKey!59664 mapValue!59664))))

(assert (= (and start!133734 res!1069317) b!1564009))

(assert (= (and b!1564009 res!1069316) b!1564013))

(assert (= (and b!1564013 res!1069312) b!1564012))

(assert (= (and b!1564012 res!1069313) b!1564017))

(assert (= (and b!1564017 res!1069314) b!1564010))

(assert (= (and b!1564010 res!1069315) b!1564011))

(assert (= (and b!1564015 condMapEmpty!59664) mapIsEmpty!59664))

(assert (= (and b!1564015 (not condMapEmpty!59664)) mapNonEmpty!59664))

(get-info :version)

(assert (= (and mapNonEmpty!59664 ((_ is ValueCellFull!18398) mapValue!59664)) b!1564016))

(assert (= (and b!1564015 ((_ is ValueCellFull!18398) mapDefault!59664)) b!1564014))

(assert (= start!133734 b!1564015))

(declare-fun m!1438671 () Bool)

(assert (=> start!133734 m!1438671))

(declare-fun m!1438673 () Bool)

(assert (=> start!133734 m!1438673))

(declare-fun m!1438675 () Bool)

(assert (=> start!133734 m!1438675))

(declare-fun m!1438677 () Bool)

(assert (=> mapNonEmpty!59664 m!1438677))

(declare-fun m!1438679 () Bool)

(assert (=> b!1564012 m!1438679))

(declare-fun m!1438681 () Bool)

(assert (=> b!1564011 m!1438681))

(declare-fun m!1438683 () Bool)

(assert (=> b!1564013 m!1438683))

(declare-fun m!1438685 () Bool)

(assert (=> b!1564010 m!1438685))

(check-sat (not mapNonEmpty!59664) (not b!1564013) (not b!1564010) (not b!1564011) tp_is_empty!38857 (not b!1564012) (not start!133734))
(check-sat)
