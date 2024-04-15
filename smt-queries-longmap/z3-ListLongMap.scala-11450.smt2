; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133448 () Bool)

(assert start!133448)

(declare-fun b!1560335 () Bool)

(declare-fun res!1067014 () Bool)

(declare-fun e!869488 () Bool)

(assert (=> b!1560335 (=> (not res!1067014) (not e!869488))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103802 0))(
  ( (array!103803 (arr!50094 (Array (_ BitVec 32) (_ BitVec 64))) (size!50646 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103802)

(declare-datatypes ((V!59649 0))(
  ( (V!59650 (val!19374 Int)) )
))
(declare-datatypes ((ValueCell!18260 0))(
  ( (ValueCellFull!18260 (v!22122 V!59649)) (EmptyCell!18260) )
))
(declare-datatypes ((array!103804 0))(
  ( (array!103805 (arr!50095 (Array (_ BitVec 32) ValueCell!18260)) (size!50647 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103804)

(assert (=> b!1560335 (= res!1067014 (and (= (size!50647 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50646 _keys!637) (size!50647 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560336 () Bool)

(assert (=> b!1560336 (= e!869488 false)))

(declare-fun lt!670742 () Bool)

(declare-datatypes ((List!36442 0))(
  ( (Nil!36439) (Cons!36438 (h!37885 (_ BitVec 64)) (t!51167 List!36442)) )
))
(declare-fun arrayNoDuplicates!0 (array!103802 (_ BitVec 32) List!36442) Bool)

(assert (=> b!1560336 (= lt!670742 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36439))))

(declare-fun mapIsEmpty!59247 () Bool)

(declare-fun mapRes!59247 () Bool)

(assert (=> mapIsEmpty!59247 mapRes!59247))

(declare-fun b!1560337 () Bool)

(declare-fun e!869487 () Bool)

(declare-fun tp_is_empty!38581 () Bool)

(assert (=> b!1560337 (= e!869487 tp_is_empty!38581)))

(declare-fun b!1560339 () Bool)

(declare-fun e!869490 () Bool)

(assert (=> b!1560339 (= e!869490 tp_is_empty!38581)))

(declare-fun mapNonEmpty!59247 () Bool)

(declare-fun tp!112903 () Bool)

(assert (=> mapNonEmpty!59247 (= mapRes!59247 (and tp!112903 e!869490))))

(declare-fun mapValue!59247 () ValueCell!18260)

(declare-fun mapRest!59247 () (Array (_ BitVec 32) ValueCell!18260))

(declare-fun mapKey!59247 () (_ BitVec 32))

(assert (=> mapNonEmpty!59247 (= (arr!50095 _values!487) (store mapRest!59247 mapKey!59247 mapValue!59247))))

(declare-fun b!1560340 () Bool)

(declare-fun e!869489 () Bool)

(assert (=> b!1560340 (= e!869489 (and e!869487 mapRes!59247))))

(declare-fun condMapEmpty!59247 () Bool)

(declare-fun mapDefault!59247 () ValueCell!18260)

(assert (=> b!1560340 (= condMapEmpty!59247 (= (arr!50095 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18260)) mapDefault!59247)))))

(declare-fun b!1560338 () Bool)

(declare-fun res!1067015 () Bool)

(assert (=> b!1560338 (=> (not res!1067015) (not e!869488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103802 (_ BitVec 32)) Bool)

(assert (=> b!1560338 (= res!1067015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1067016 () Bool)

(assert (=> start!133448 (=> (not res!1067016) (not e!869488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133448 (= res!1067016 (validMask!0 mask!947))))

(assert (=> start!133448 e!869488))

(assert (=> start!133448 true))

(declare-fun array_inv!39135 (array!103804) Bool)

(assert (=> start!133448 (and (array_inv!39135 _values!487) e!869489)))

(declare-fun array_inv!39136 (array!103802) Bool)

(assert (=> start!133448 (array_inv!39136 _keys!637)))

(assert (= (and start!133448 res!1067016) b!1560335))

(assert (= (and b!1560335 res!1067014) b!1560338))

(assert (= (and b!1560338 res!1067015) b!1560336))

(assert (= (and b!1560340 condMapEmpty!59247) mapIsEmpty!59247))

(assert (= (and b!1560340 (not condMapEmpty!59247)) mapNonEmpty!59247))

(get-info :version)

(assert (= (and mapNonEmpty!59247 ((_ is ValueCellFull!18260) mapValue!59247)) b!1560339))

(assert (= (and b!1560340 ((_ is ValueCellFull!18260) mapDefault!59247)) b!1560337))

(assert (= start!133448 b!1560340))

(declare-fun m!1435533 () Bool)

(assert (=> b!1560336 m!1435533))

(declare-fun m!1435535 () Bool)

(assert (=> mapNonEmpty!59247 m!1435535))

(declare-fun m!1435537 () Bool)

(assert (=> b!1560338 m!1435537))

(declare-fun m!1435539 () Bool)

(assert (=> start!133448 m!1435539))

(declare-fun m!1435541 () Bool)

(assert (=> start!133448 m!1435541))

(declare-fun m!1435543 () Bool)

(assert (=> start!133448 m!1435543))

(check-sat tp_is_empty!38581 (not start!133448) (not b!1560336) (not b!1560338) (not mapNonEmpty!59247))
(check-sat)
