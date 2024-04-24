; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133880 () Bool)

(assert start!133880)

(declare-fun b!1562814 () Bool)

(declare-fun e!870972 () Bool)

(assert (=> b!1562814 (= e!870972 false)))

(declare-fun lt!671891 () Bool)

(declare-datatypes ((array!103946 0))(
  ( (array!103947 (arr!50158 (Array (_ BitVec 32) (_ BitVec 64))) (size!50709 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103946)

(declare-datatypes ((List!36418 0))(
  ( (Nil!36415) (Cons!36414 (h!37878 (_ BitVec 64)) (t!51143 List!36418)) )
))
(declare-fun arrayNoDuplicates!0 (array!103946 (_ BitVec 32) List!36418) Bool)

(assert (=> b!1562814 (= lt!671891 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36415))))

(declare-fun res!1067869 () Bool)

(assert (=> start!133880 (=> (not res!1067869) (not e!870972))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133880 (= res!1067869 (validMask!0 mask!947))))

(assert (=> start!133880 e!870972))

(assert (=> start!133880 true))

(declare-datatypes ((V!59609 0))(
  ( (V!59610 (val!19359 Int)) )
))
(declare-datatypes ((ValueCell!18245 0))(
  ( (ValueCellFull!18245 (v!22103 V!59609)) (EmptyCell!18245) )
))
(declare-datatypes ((array!103948 0))(
  ( (array!103949 (arr!50159 (Array (_ BitVec 32) ValueCell!18245)) (size!50710 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103948)

(declare-fun e!870969 () Bool)

(declare-fun array_inv!39243 (array!103948) Bool)

(assert (=> start!133880 (and (array_inv!39243 _values!487) e!870969)))

(declare-fun array_inv!39244 (array!103946) Bool)

(assert (=> start!133880 (array_inv!39244 _keys!637)))

(declare-fun b!1562815 () Bool)

(declare-fun e!870970 () Bool)

(declare-fun tp_is_empty!38551 () Bool)

(assert (=> b!1562815 (= e!870970 tp_is_empty!38551)))

(declare-fun b!1562816 () Bool)

(declare-fun res!1067870 () Bool)

(assert (=> b!1562816 (=> (not res!1067870) (not e!870972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103946 (_ BitVec 32)) Bool)

(assert (=> b!1562816 (= res!1067870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59202 () Bool)

(declare-fun mapRes!59202 () Bool)

(assert (=> mapIsEmpty!59202 mapRes!59202))

(declare-fun b!1562817 () Bool)

(declare-fun res!1067868 () Bool)

(assert (=> b!1562817 (=> (not res!1067868) (not e!870972))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562817 (= res!1067868 (and (= (size!50710 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50709 _keys!637) (size!50710 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562818 () Bool)

(declare-fun e!870973 () Bool)

(assert (=> b!1562818 (= e!870973 tp_is_empty!38551)))

(declare-fun b!1562819 () Bool)

(assert (=> b!1562819 (= e!870969 (and e!870970 mapRes!59202))))

(declare-fun condMapEmpty!59202 () Bool)

(declare-fun mapDefault!59202 () ValueCell!18245)

(assert (=> b!1562819 (= condMapEmpty!59202 (= (arr!50159 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18245)) mapDefault!59202)))))

(declare-fun mapNonEmpty!59202 () Bool)

(declare-fun tp!112857 () Bool)

(assert (=> mapNonEmpty!59202 (= mapRes!59202 (and tp!112857 e!870973))))

(declare-fun mapKey!59202 () (_ BitVec 32))

(declare-fun mapRest!59202 () (Array (_ BitVec 32) ValueCell!18245))

(declare-fun mapValue!59202 () ValueCell!18245)

(assert (=> mapNonEmpty!59202 (= (arr!50159 _values!487) (store mapRest!59202 mapKey!59202 mapValue!59202))))

(assert (= (and start!133880 res!1067869) b!1562817))

(assert (= (and b!1562817 res!1067868) b!1562816))

(assert (= (and b!1562816 res!1067870) b!1562814))

(assert (= (and b!1562819 condMapEmpty!59202) mapIsEmpty!59202))

(assert (= (and b!1562819 (not condMapEmpty!59202)) mapNonEmpty!59202))

(get-info :version)

(assert (= (and mapNonEmpty!59202 ((_ is ValueCellFull!18245) mapValue!59202)) b!1562818))

(assert (= (and b!1562819 ((_ is ValueCellFull!18245) mapDefault!59202)) b!1562815))

(assert (= start!133880 b!1562819))

(declare-fun m!1438503 () Bool)

(assert (=> b!1562814 m!1438503))

(declare-fun m!1438505 () Bool)

(assert (=> start!133880 m!1438505))

(declare-fun m!1438507 () Bool)

(assert (=> start!133880 m!1438507))

(declare-fun m!1438509 () Bool)

(assert (=> start!133880 m!1438509))

(declare-fun m!1438511 () Bool)

(assert (=> b!1562816 m!1438511))

(declare-fun m!1438513 () Bool)

(assert (=> mapNonEmpty!59202 m!1438513))

(check-sat (not mapNonEmpty!59202) tp_is_empty!38551 (not start!133880) (not b!1562816) (not b!1562814))
(check-sat)
