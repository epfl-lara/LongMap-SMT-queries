; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134196 () Bool)

(assert start!134196)

(declare-fun res!1070305 () Bool)

(declare-fun e!873391 () Bool)

(assert (=> start!134196 (=> (not res!1070305) (not e!873391))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134196 (= res!1070305 (validMask!0 mask!947))))

(assert (=> start!134196 e!873391))

(assert (=> start!134196 true))

(declare-datatypes ((array!104530 0))(
  ( (array!104531 (arr!50449 (Array (_ BitVec 32) (_ BitVec 64))) (size!51000 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104530)

(declare-fun array_inv!39451 (array!104530) Bool)

(assert (=> start!134196 (array_inv!39451 _keys!637)))

(declare-datatypes ((V!60017 0))(
  ( (V!60018 (val!19512 Int)) )
))
(declare-datatypes ((ValueCell!18398 0))(
  ( (ValueCellFull!18398 (v!22256 V!60017)) (EmptyCell!18398) )
))
(declare-datatypes ((array!104532 0))(
  ( (array!104533 (arr!50450 (Array (_ BitVec 32) ValueCell!18398)) (size!51001 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104532)

(declare-fun e!873394 () Bool)

(declare-fun array_inv!39452 (array!104532) Bool)

(assert (=> start!134196 (and (array_inv!39452 _values!487) e!873394)))

(declare-fun mapIsEmpty!59664 () Bool)

(declare-fun mapRes!59664 () Bool)

(assert (=> mapIsEmpty!59664 mapRes!59664))

(declare-fun b!1566758 () Bool)

(declare-fun res!1070303 () Bool)

(assert (=> b!1566758 (=> (not res!1070303) (not e!873391))))

(declare-datatypes ((tuple2!25236 0))(
  ( (tuple2!25237 (_1!12629 (_ BitVec 64)) (_2!12629 V!60017)) )
))
(declare-datatypes ((List!36598 0))(
  ( (Nil!36595) (Cons!36594 (h!38058 tuple2!25236) (t!51437 List!36598)) )
))
(declare-datatypes ((ListLongMap!22679 0))(
  ( (ListLongMap!22680 (toList!11355 List!36598)) )
))
(declare-fun contains!10357 (ListLongMap!22679 (_ BitVec 64)) Bool)

(assert (=> b!1566758 (= res!1070303 (not (contains!10357 (ListLongMap!22680 Nil!36595) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566759 () Bool)

(declare-fun e!873392 () Bool)

(declare-fun tp_is_empty!38857 () Bool)

(assert (=> b!1566759 (= e!873392 tp_is_empty!38857)))

(declare-fun b!1566760 () Bool)

(assert (=> b!1566760 (= e!873391 false)))

(declare-fun lt!672935 () Bool)

(assert (=> b!1566760 (= lt!672935 (contains!10357 (ListLongMap!22680 Nil!36595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566761 () Bool)

(declare-fun e!873390 () Bool)

(assert (=> b!1566761 (= e!873394 (and e!873390 mapRes!59664))))

(declare-fun condMapEmpty!59664 () Bool)

(declare-fun mapDefault!59664 () ValueCell!18398)

(assert (=> b!1566761 (= condMapEmpty!59664 (= (arr!50450 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18398)) mapDefault!59664)))))

(declare-fun b!1566762 () Bool)

(declare-fun res!1070302 () Bool)

(assert (=> b!1566762 (=> (not res!1070302) (not e!873391))))

(declare-datatypes ((List!36599 0))(
  ( (Nil!36596) (Cons!36595 (h!38059 (_ BitVec 64)) (t!51438 List!36599)) )
))
(declare-fun arrayNoDuplicates!0 (array!104530 (_ BitVec 32) List!36599) Bool)

(assert (=> b!1566762 (= res!1070302 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36596))))

(declare-fun b!1566763 () Bool)

(declare-fun res!1070304 () Bool)

(assert (=> b!1566763 (=> (not res!1070304) (not e!873391))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566763 (= res!1070304 (and (= (size!51001 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51000 _keys!637) (size!51001 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566764 () Bool)

(declare-fun res!1070301 () Bool)

(assert (=> b!1566764 (=> (not res!1070301) (not e!873391))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1566764 (= res!1070301 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51000 _keys!637)) (bvsge from!782 (size!51000 _keys!637))))))

(declare-fun mapNonEmpty!59664 () Bool)

(declare-fun tp!113589 () Bool)

(assert (=> mapNonEmpty!59664 (= mapRes!59664 (and tp!113589 e!873392))))

(declare-fun mapValue!59664 () ValueCell!18398)

(declare-fun mapKey!59664 () (_ BitVec 32))

(declare-fun mapRest!59664 () (Array (_ BitVec 32) ValueCell!18398))

(assert (=> mapNonEmpty!59664 (= (arr!50450 _values!487) (store mapRest!59664 mapKey!59664 mapValue!59664))))

(declare-fun b!1566765 () Bool)

(assert (=> b!1566765 (= e!873390 tp_is_empty!38857)))

(declare-fun b!1566766 () Bool)

(declare-fun res!1070306 () Bool)

(assert (=> b!1566766 (=> (not res!1070306) (not e!873391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104530 (_ BitVec 32)) Bool)

(assert (=> b!1566766 (= res!1070306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!134196 res!1070305) b!1566763))

(assert (= (and b!1566763 res!1070304) b!1566766))

(assert (= (and b!1566766 res!1070306) b!1566762))

(assert (= (and b!1566762 res!1070302) b!1566764))

(assert (= (and b!1566764 res!1070301) b!1566758))

(assert (= (and b!1566758 res!1070303) b!1566760))

(assert (= (and b!1566761 condMapEmpty!59664) mapIsEmpty!59664))

(assert (= (and b!1566761 (not condMapEmpty!59664)) mapNonEmpty!59664))

(get-info :version)

(assert (= (and mapNonEmpty!59664 ((_ is ValueCellFull!18398) mapValue!59664)) b!1566759))

(assert (= (and b!1566761 ((_ is ValueCellFull!18398) mapDefault!59664)) b!1566765))

(assert (= start!134196 b!1566761))

(declare-fun m!1441821 () Bool)

(assert (=> b!1566760 m!1441821))

(declare-fun m!1441823 () Bool)

(assert (=> b!1566762 m!1441823))

(declare-fun m!1441825 () Bool)

(assert (=> b!1566766 m!1441825))

(declare-fun m!1441827 () Bool)

(assert (=> start!134196 m!1441827))

(declare-fun m!1441829 () Bool)

(assert (=> start!134196 m!1441829))

(declare-fun m!1441831 () Bool)

(assert (=> start!134196 m!1441831))

(declare-fun m!1441833 () Bool)

(assert (=> mapNonEmpty!59664 m!1441833))

(declare-fun m!1441835 () Bool)

(assert (=> b!1566758 m!1441835))

(check-sat (not b!1566766) (not mapNonEmpty!59664) tp_is_empty!38857 (not b!1566762) (not b!1566760) (not b!1566758) (not start!134196))
(check-sat)
