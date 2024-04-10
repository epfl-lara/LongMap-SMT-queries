; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133656 () Bool)

(assert start!133656)

(declare-fun mapNonEmpty!59484 () Bool)

(declare-fun mapRes!59484 () Bool)

(declare-fun tp!113319 () Bool)

(declare-fun e!870879 () Bool)

(assert (=> mapNonEmpty!59484 (= mapRes!59484 (and tp!113319 e!870879))))

(declare-datatypes ((V!59859 0))(
  ( (V!59860 (val!19453 Int)) )
))
(declare-datatypes ((ValueCell!18339 0))(
  ( (ValueCellFull!18339 (v!22205 V!59859)) (EmptyCell!18339) )
))
(declare-fun mapRest!59484 () (Array (_ BitVec 32) ValueCell!18339))

(declare-fun mapValue!59484 () ValueCell!18339)

(declare-datatypes ((array!104188 0))(
  ( (array!104189 (arr!50286 (Array (_ BitVec 32) ValueCell!18339)) (size!50836 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104188)

(declare-fun mapKey!59484 () (_ BitVec 32))

(assert (=> mapNonEmpty!59484 (= (arr!50286 _values!487) (store mapRest!59484 mapKey!59484 mapValue!59484))))

(declare-fun b!1562760 () Bool)

(declare-fun e!870882 () Bool)

(assert (=> b!1562760 (= e!870882 false)))

(declare-fun lt!671778 () Bool)

(declare-datatypes ((array!104190 0))(
  ( (array!104191 (arr!50287 (Array (_ BitVec 32) (_ BitVec 64))) (size!50837 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104190)

(declare-datatypes ((List!36499 0))(
  ( (Nil!36496) (Cons!36495 (h!37941 (_ BitVec 64)) (t!51346 List!36499)) )
))
(declare-fun arrayNoDuplicates!0 (array!104190 (_ BitVec 32) List!36499) Bool)

(assert (=> b!1562760 (= lt!671778 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36496))))

(declare-fun b!1562761 () Bool)

(declare-fun e!870883 () Bool)

(declare-fun e!870880 () Bool)

(assert (=> b!1562761 (= e!870883 (and e!870880 mapRes!59484))))

(declare-fun condMapEmpty!59484 () Bool)

(declare-fun mapDefault!59484 () ValueCell!18339)

(assert (=> b!1562761 (= condMapEmpty!59484 (= (arr!50286 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18339)) mapDefault!59484)))))

(declare-fun b!1562762 () Bool)

(declare-fun tp_is_empty!38739 () Bool)

(assert (=> b!1562762 (= e!870879 tp_is_empty!38739)))

(declare-fun b!1562763 () Bool)

(declare-fun res!1068432 () Bool)

(assert (=> b!1562763 (=> (not res!1068432) (not e!870882))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104190 (_ BitVec 32)) Bool)

(assert (=> b!1562763 (= res!1068432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562765 () Bool)

(assert (=> b!1562765 (= e!870880 tp_is_empty!38739)))

(declare-fun mapIsEmpty!59484 () Bool)

(assert (=> mapIsEmpty!59484 mapRes!59484))

(declare-fun b!1562764 () Bool)

(declare-fun res!1068430 () Bool)

(assert (=> b!1562764 (=> (not res!1068430) (not e!870882))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562764 (= res!1068430 (and (= (size!50836 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50837 _keys!637) (size!50836 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1068431 () Bool)

(assert (=> start!133656 (=> (not res!1068431) (not e!870882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133656 (= res!1068431 (validMask!0 mask!947))))

(assert (=> start!133656 e!870882))

(assert (=> start!133656 true))

(declare-fun array_inv!39085 (array!104188) Bool)

(assert (=> start!133656 (and (array_inv!39085 _values!487) e!870883)))

(declare-fun array_inv!39086 (array!104190) Bool)

(assert (=> start!133656 (array_inv!39086 _keys!637)))

(assert (= (and start!133656 res!1068431) b!1562764))

(assert (= (and b!1562764 res!1068430) b!1562763))

(assert (= (and b!1562763 res!1068432) b!1562760))

(assert (= (and b!1562761 condMapEmpty!59484) mapIsEmpty!59484))

(assert (= (and b!1562761 (not condMapEmpty!59484)) mapNonEmpty!59484))

(get-info :version)

(assert (= (and mapNonEmpty!59484 ((_ is ValueCellFull!18339) mapValue!59484)) b!1562762))

(assert (= (and b!1562761 ((_ is ValueCellFull!18339) mapDefault!59484)) b!1562765))

(assert (= start!133656 b!1562761))

(declare-fun m!1438501 () Bool)

(assert (=> mapNonEmpty!59484 m!1438501))

(declare-fun m!1438503 () Bool)

(assert (=> b!1562760 m!1438503))

(declare-fun m!1438505 () Bool)

(assert (=> b!1562763 m!1438505))

(declare-fun m!1438507 () Bool)

(assert (=> start!133656 m!1438507))

(declare-fun m!1438509 () Bool)

(assert (=> start!133656 m!1438509))

(declare-fun m!1438511 () Bool)

(assert (=> start!133656 m!1438511))

(check-sat (not mapNonEmpty!59484) (not b!1562760) tp_is_empty!38739 (not b!1562763) (not start!133656))
(check-sat)
