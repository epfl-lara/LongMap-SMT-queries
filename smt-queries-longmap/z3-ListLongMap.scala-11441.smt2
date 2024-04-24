; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133856 () Bool)

(assert start!133856)

(declare-fun b!1562496 () Bool)

(declare-fun e!870790 () Bool)

(assert (=> b!1562496 (= e!870790 false)))

(declare-fun lt!671855 () Bool)

(declare-datatypes ((V!59577 0))(
  ( (V!59578 (val!19347 Int)) )
))
(declare-datatypes ((tuple2!25076 0))(
  ( (tuple2!25077 (_1!12549 (_ BitVec 64)) (_2!12549 V!59577)) )
))
(declare-datatypes ((List!36401 0))(
  ( (Nil!36398) (Cons!36397 (h!37861 tuple2!25076) (t!51126 List!36401)) )
))
(declare-datatypes ((ListLongMap!22519 0))(
  ( (ListLongMap!22520 (toList!11275 List!36401)) )
))
(declare-fun contains!10276 (ListLongMap!22519 (_ BitVec 64)) Bool)

(assert (=> b!1562496 (= lt!671855 (contains!10276 (ListLongMap!22520 Nil!36398) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1067663 () Bool)

(assert (=> start!133856 (=> (not res!1067663) (not e!870790))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133856 (= res!1067663 (validMask!0 mask!947))))

(assert (=> start!133856 e!870790))

(assert (=> start!133856 true))

(declare-datatypes ((array!103904 0))(
  ( (array!103905 (arr!50137 (Array (_ BitVec 32) (_ BitVec 64))) (size!50688 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103904)

(declare-fun array_inv!39229 (array!103904) Bool)

(assert (=> start!133856 (array_inv!39229 _keys!637)))

(declare-datatypes ((ValueCell!18233 0))(
  ( (ValueCellFull!18233 (v!22091 V!59577)) (EmptyCell!18233) )
))
(declare-datatypes ((array!103906 0))(
  ( (array!103907 (arr!50138 (Array (_ BitVec 32) ValueCell!18233)) (size!50689 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103906)

(declare-fun e!870791 () Bool)

(declare-fun array_inv!39230 (array!103906) Bool)

(assert (=> start!133856 (and (array_inv!39230 _values!487) e!870791)))

(declare-fun mapIsEmpty!59166 () Bool)

(declare-fun mapRes!59166 () Bool)

(assert (=> mapIsEmpty!59166 mapRes!59166))

(declare-fun b!1562497 () Bool)

(declare-fun e!870793 () Bool)

(assert (=> b!1562497 (= e!870791 (and e!870793 mapRes!59166))))

(declare-fun condMapEmpty!59166 () Bool)

(declare-fun mapDefault!59166 () ValueCell!18233)

(assert (=> b!1562497 (= condMapEmpty!59166 (= (arr!50138 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18233)) mapDefault!59166)))))

(declare-fun b!1562498 () Bool)

(declare-fun res!1067662 () Bool)

(assert (=> b!1562498 (=> (not res!1067662) (not e!870790))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1562498 (= res!1067662 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50688 _keys!637)) (bvsge from!782 (size!50688 _keys!637))))))

(declare-fun b!1562499 () Bool)

(declare-fun res!1067659 () Bool)

(assert (=> b!1562499 (=> (not res!1067659) (not e!870790))))

(assert (=> b!1562499 (= res!1067659 (not (contains!10276 (ListLongMap!22520 Nil!36398) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1562500 () Bool)

(declare-fun res!1067660 () Bool)

(assert (=> b!1562500 (=> (not res!1067660) (not e!870790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103904 (_ BitVec 32)) Bool)

(assert (=> b!1562500 (= res!1067660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562501 () Bool)

(declare-fun res!1067658 () Bool)

(assert (=> b!1562501 (=> (not res!1067658) (not e!870790))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562501 (= res!1067658 (and (= (size!50689 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50688 _keys!637) (size!50689 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562502 () Bool)

(declare-fun e!870792 () Bool)

(declare-fun tp_is_empty!38527 () Bool)

(assert (=> b!1562502 (= e!870792 tp_is_empty!38527)))

(declare-fun mapNonEmpty!59166 () Bool)

(declare-fun tp!112821 () Bool)

(assert (=> mapNonEmpty!59166 (= mapRes!59166 (and tp!112821 e!870792))))

(declare-fun mapValue!59166 () ValueCell!18233)

(declare-fun mapKey!59166 () (_ BitVec 32))

(declare-fun mapRest!59166 () (Array (_ BitVec 32) ValueCell!18233))

(assert (=> mapNonEmpty!59166 (= (arr!50138 _values!487) (store mapRest!59166 mapKey!59166 mapValue!59166))))

(declare-fun b!1562503 () Bool)

(assert (=> b!1562503 (= e!870793 tp_is_empty!38527)))

(declare-fun b!1562504 () Bool)

(declare-fun res!1067661 () Bool)

(assert (=> b!1562504 (=> (not res!1067661) (not e!870790))))

(declare-datatypes ((List!36402 0))(
  ( (Nil!36399) (Cons!36398 (h!37862 (_ BitVec 64)) (t!51127 List!36402)) )
))
(declare-fun arrayNoDuplicates!0 (array!103904 (_ BitVec 32) List!36402) Bool)

(assert (=> b!1562504 (= res!1067661 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36399))))

(assert (= (and start!133856 res!1067663) b!1562501))

(assert (= (and b!1562501 res!1067658) b!1562500))

(assert (= (and b!1562500 res!1067660) b!1562504))

(assert (= (and b!1562504 res!1067661) b!1562498))

(assert (= (and b!1562498 res!1067662) b!1562499))

(assert (= (and b!1562499 res!1067659) b!1562496))

(assert (= (and b!1562497 condMapEmpty!59166) mapIsEmpty!59166))

(assert (= (and b!1562497 (not condMapEmpty!59166)) mapNonEmpty!59166))

(get-info :version)

(assert (= (and mapNonEmpty!59166 ((_ is ValueCellFull!18233) mapValue!59166)) b!1562502))

(assert (= (and b!1562497 ((_ is ValueCellFull!18233) mapDefault!59166)) b!1562503))

(assert (= start!133856 b!1562497))

(declare-fun m!1438311 () Bool)

(assert (=> b!1562500 m!1438311))

(declare-fun m!1438313 () Bool)

(assert (=> mapNonEmpty!59166 m!1438313))

(declare-fun m!1438315 () Bool)

(assert (=> b!1562496 m!1438315))

(declare-fun m!1438317 () Bool)

(assert (=> b!1562504 m!1438317))

(declare-fun m!1438319 () Bool)

(assert (=> b!1562499 m!1438319))

(declare-fun m!1438321 () Bool)

(assert (=> start!133856 m!1438321))

(declare-fun m!1438323 () Bool)

(assert (=> start!133856 m!1438323))

(declare-fun m!1438325 () Bool)

(assert (=> start!133856 m!1438325))

(check-sat (not start!133856) (not b!1562504) tp_is_empty!38527 (not b!1562500) (not mapNonEmpty!59166) (not b!1562496) (not b!1562499))
(check-sat)
