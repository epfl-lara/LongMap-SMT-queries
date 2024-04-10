; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133674 () Bool)

(assert start!133674)

(declare-fun b!1562922 () Bool)

(declare-fun e!871016 () Bool)

(declare-fun tp_is_empty!38757 () Bool)

(assert (=> b!1562922 (= e!871016 tp_is_empty!38757)))

(declare-fun b!1562923 () Bool)

(declare-fun e!871014 () Bool)

(assert (=> b!1562923 (= e!871014 false)))

(declare-fun lt!671805 () Bool)

(declare-datatypes ((array!104218 0))(
  ( (array!104219 (arr!50301 (Array (_ BitVec 32) (_ BitVec 64))) (size!50851 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104218)

(declare-datatypes ((List!36503 0))(
  ( (Nil!36500) (Cons!36499 (h!37945 (_ BitVec 64)) (t!51350 List!36503)) )
))
(declare-fun arrayNoDuplicates!0 (array!104218 (_ BitVec 32) List!36503) Bool)

(assert (=> b!1562923 (= lt!671805 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36500))))

(declare-fun b!1562924 () Bool)

(declare-fun res!1068511 () Bool)

(assert (=> b!1562924 (=> (not res!1068511) (not e!871014))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59883 0))(
  ( (V!59884 (val!19462 Int)) )
))
(declare-datatypes ((ValueCell!18348 0))(
  ( (ValueCellFull!18348 (v!22214 V!59883)) (EmptyCell!18348) )
))
(declare-datatypes ((array!104220 0))(
  ( (array!104221 (arr!50302 (Array (_ BitVec 32) ValueCell!18348)) (size!50852 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104220)

(assert (=> b!1562924 (= res!1068511 (and (= (size!50852 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50851 _keys!637) (size!50852 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59511 () Bool)

(declare-fun mapRes!59511 () Bool)

(assert (=> mapIsEmpty!59511 mapRes!59511))

(declare-fun b!1562925 () Bool)

(declare-fun e!871017 () Bool)

(assert (=> b!1562925 (= e!871017 (and e!871016 mapRes!59511))))

(declare-fun condMapEmpty!59511 () Bool)

(declare-fun mapDefault!59511 () ValueCell!18348)

(assert (=> b!1562925 (= condMapEmpty!59511 (= (arr!50302 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18348)) mapDefault!59511)))))

(declare-fun res!1068513 () Bool)

(assert (=> start!133674 (=> (not res!1068513) (not e!871014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133674 (= res!1068513 (validMask!0 mask!947))))

(assert (=> start!133674 e!871014))

(assert (=> start!133674 true))

(declare-fun array_inv!39097 (array!104220) Bool)

(assert (=> start!133674 (and (array_inv!39097 _values!487) e!871017)))

(declare-fun array_inv!39098 (array!104218) Bool)

(assert (=> start!133674 (array_inv!39098 _keys!637)))

(declare-fun mapNonEmpty!59511 () Bool)

(declare-fun tp!113346 () Bool)

(declare-fun e!871015 () Bool)

(assert (=> mapNonEmpty!59511 (= mapRes!59511 (and tp!113346 e!871015))))

(declare-fun mapRest!59511 () (Array (_ BitVec 32) ValueCell!18348))

(declare-fun mapValue!59511 () ValueCell!18348)

(declare-fun mapKey!59511 () (_ BitVec 32))

(assert (=> mapNonEmpty!59511 (= (arr!50302 _values!487) (store mapRest!59511 mapKey!59511 mapValue!59511))))

(declare-fun b!1562926 () Bool)

(declare-fun res!1068512 () Bool)

(assert (=> b!1562926 (=> (not res!1068512) (not e!871014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104218 (_ BitVec 32)) Bool)

(assert (=> b!1562926 (= res!1068512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562927 () Bool)

(assert (=> b!1562927 (= e!871015 tp_is_empty!38757)))

(assert (= (and start!133674 res!1068513) b!1562924))

(assert (= (and b!1562924 res!1068511) b!1562926))

(assert (= (and b!1562926 res!1068512) b!1562923))

(assert (= (and b!1562925 condMapEmpty!59511) mapIsEmpty!59511))

(assert (= (and b!1562925 (not condMapEmpty!59511)) mapNonEmpty!59511))

(get-info :version)

(assert (= (and mapNonEmpty!59511 ((_ is ValueCellFull!18348) mapValue!59511)) b!1562927))

(assert (= (and b!1562925 ((_ is ValueCellFull!18348) mapDefault!59511)) b!1562922))

(assert (= start!133674 b!1562925))

(declare-fun m!1438609 () Bool)

(assert (=> b!1562923 m!1438609))

(declare-fun m!1438611 () Bool)

(assert (=> start!133674 m!1438611))

(declare-fun m!1438613 () Bool)

(assert (=> start!133674 m!1438613))

(declare-fun m!1438615 () Bool)

(assert (=> start!133674 m!1438615))

(declare-fun m!1438617 () Bool)

(assert (=> mapNonEmpty!59511 m!1438617))

(declare-fun m!1438619 () Bool)

(assert (=> b!1562926 m!1438619))

(check-sat (not mapNonEmpty!59511) (not b!1562923) (not start!133674) (not b!1562926) tp_is_empty!38757)
(check-sat)
