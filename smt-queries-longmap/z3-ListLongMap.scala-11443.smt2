; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133868 () Bool)

(assert start!133868)

(declare-fun b!1562658 () Bool)

(declare-fun e!870880 () Bool)

(declare-fun e!870879 () Bool)

(declare-fun mapRes!59184 () Bool)

(assert (=> b!1562658 (= e!870880 (and e!870879 mapRes!59184))))

(declare-fun condMapEmpty!59184 () Bool)

(declare-datatypes ((V!59593 0))(
  ( (V!59594 (val!19353 Int)) )
))
(declare-datatypes ((ValueCell!18239 0))(
  ( (ValueCellFull!18239 (v!22097 V!59593)) (EmptyCell!18239) )
))
(declare-datatypes ((array!103924 0))(
  ( (array!103925 (arr!50147 (Array (_ BitVec 32) ValueCell!18239)) (size!50698 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103924)

(declare-fun mapDefault!59184 () ValueCell!18239)

(assert (=> b!1562658 (= condMapEmpty!59184 (= (arr!50147 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18239)) mapDefault!59184)))))

(declare-fun b!1562659 () Bool)

(declare-fun res!1067770 () Bool)

(declare-fun e!870881 () Bool)

(assert (=> b!1562659 (=> (not res!1067770) (not e!870881))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103926 0))(
  ( (array!103927 (arr!50148 (Array (_ BitVec 32) (_ BitVec 64))) (size!50699 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103926)

(assert (=> b!1562659 (= res!1067770 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50699 _keys!637)) (bvsge from!782 (size!50699 _keys!637))))))

(declare-fun b!1562660 () Bool)

(declare-fun res!1067771 () Bool)

(assert (=> b!1562660 (=> (not res!1067771) (not e!870881))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562660 (= res!1067771 (and (= (size!50698 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50699 _keys!637) (size!50698 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562661 () Bool)

(declare-fun res!1067768 () Bool)

(assert (=> b!1562661 (=> (not res!1067768) (not e!870881))))

(declare-datatypes ((tuple2!25086 0))(
  ( (tuple2!25087 (_1!12554 (_ BitVec 64)) (_2!12554 V!59593)) )
))
(declare-datatypes ((List!36409 0))(
  ( (Nil!36406) (Cons!36405 (h!37869 tuple2!25086) (t!51134 List!36409)) )
))
(declare-datatypes ((ListLongMap!22529 0))(
  ( (ListLongMap!22530 (toList!11280 List!36409)) )
))
(declare-fun contains!10281 (ListLongMap!22529 (_ BitVec 64)) Bool)

(assert (=> b!1562661 (= res!1067768 (not (contains!10281 (ListLongMap!22530 Nil!36406) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1562662 () Bool)

(declare-fun tp_is_empty!38539 () Bool)

(assert (=> b!1562662 (= e!870879 tp_is_empty!38539)))

(declare-fun res!1067767 () Bool)

(assert (=> start!133868 (=> (not res!1067767) (not e!870881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133868 (= res!1067767 (validMask!0 mask!947))))

(assert (=> start!133868 e!870881))

(assert (=> start!133868 true))

(declare-fun array_inv!39237 (array!103926) Bool)

(assert (=> start!133868 (array_inv!39237 _keys!637)))

(declare-fun array_inv!39238 (array!103924) Bool)

(assert (=> start!133868 (and (array_inv!39238 _values!487) e!870880)))

(declare-fun mapNonEmpty!59184 () Bool)

(declare-fun tp!112839 () Bool)

(declare-fun e!870883 () Bool)

(assert (=> mapNonEmpty!59184 (= mapRes!59184 (and tp!112839 e!870883))))

(declare-fun mapValue!59184 () ValueCell!18239)

(declare-fun mapKey!59184 () (_ BitVec 32))

(declare-fun mapRest!59184 () (Array (_ BitVec 32) ValueCell!18239))

(assert (=> mapNonEmpty!59184 (= (arr!50147 _values!487) (store mapRest!59184 mapKey!59184 mapValue!59184))))

(declare-fun b!1562663 () Bool)

(declare-fun res!1067766 () Bool)

(assert (=> b!1562663 (=> (not res!1067766) (not e!870881))))

(declare-datatypes ((List!36410 0))(
  ( (Nil!36407) (Cons!36406 (h!37870 (_ BitVec 64)) (t!51135 List!36410)) )
))
(declare-fun arrayNoDuplicates!0 (array!103926 (_ BitVec 32) List!36410) Bool)

(assert (=> b!1562663 (= res!1067766 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36407))))

(declare-fun b!1562664 () Bool)

(declare-fun res!1067769 () Bool)

(assert (=> b!1562664 (=> (not res!1067769) (not e!870881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103926 (_ BitVec 32)) Bool)

(assert (=> b!1562664 (= res!1067769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562665 () Bool)

(assert (=> b!1562665 (= e!870883 tp_is_empty!38539)))

(declare-fun b!1562666 () Bool)

(assert (=> b!1562666 (= e!870881 false)))

(declare-fun lt!671873 () Bool)

(assert (=> b!1562666 (= lt!671873 (contains!10281 (ListLongMap!22530 Nil!36406) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59184 () Bool)

(assert (=> mapIsEmpty!59184 mapRes!59184))

(assert (= (and start!133868 res!1067767) b!1562660))

(assert (= (and b!1562660 res!1067771) b!1562664))

(assert (= (and b!1562664 res!1067769) b!1562663))

(assert (= (and b!1562663 res!1067766) b!1562659))

(assert (= (and b!1562659 res!1067770) b!1562661))

(assert (= (and b!1562661 res!1067768) b!1562666))

(assert (= (and b!1562658 condMapEmpty!59184) mapIsEmpty!59184))

(assert (= (and b!1562658 (not condMapEmpty!59184)) mapNonEmpty!59184))

(get-info :version)

(assert (= (and mapNonEmpty!59184 ((_ is ValueCellFull!18239) mapValue!59184)) b!1562665))

(assert (= (and b!1562658 ((_ is ValueCellFull!18239) mapDefault!59184)) b!1562662))

(assert (= start!133868 b!1562658))

(declare-fun m!1438407 () Bool)

(assert (=> b!1562661 m!1438407))

(declare-fun m!1438409 () Bool)

(assert (=> start!133868 m!1438409))

(declare-fun m!1438411 () Bool)

(assert (=> start!133868 m!1438411))

(declare-fun m!1438413 () Bool)

(assert (=> start!133868 m!1438413))

(declare-fun m!1438415 () Bool)

(assert (=> mapNonEmpty!59184 m!1438415))

(declare-fun m!1438417 () Bool)

(assert (=> b!1562666 m!1438417))

(declare-fun m!1438419 () Bool)

(assert (=> b!1562664 m!1438419))

(declare-fun m!1438421 () Bool)

(assert (=> b!1562663 m!1438421))

(check-sat (not b!1562663) (not b!1562666) tp_is_empty!38539 (not b!1562664) (not start!133868) (not mapNonEmpty!59184) (not b!1562661))
(check-sat)
