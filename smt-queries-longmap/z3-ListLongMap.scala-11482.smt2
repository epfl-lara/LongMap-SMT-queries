; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133640 () Bool)

(assert start!133640)

(declare-fun b!1562759 () Bool)

(declare-fun res!1068465 () Bool)

(declare-fun e!870936 () Bool)

(assert (=> b!1562759 (=> (not res!1068465) (not e!870936))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104166 0))(
  ( (array!104167 (arr!50276 (Array (_ BitVec 32) (_ BitVec 64))) (size!50828 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104166)

(declare-datatypes ((V!59905 0))(
  ( (V!59906 (val!19470 Int)) )
))
(declare-datatypes ((ValueCell!18356 0))(
  ( (ValueCellFull!18356 (v!22218 V!59905)) (EmptyCell!18356) )
))
(declare-datatypes ((array!104168 0))(
  ( (array!104169 (arr!50277 (Array (_ BitVec 32) ValueCell!18356)) (size!50829 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104168)

(assert (=> b!1562759 (= res!1068465 (and (= (size!50829 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50828 _keys!637) (size!50829 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59535 () Bool)

(declare-fun mapRes!59535 () Bool)

(assert (=> mapIsEmpty!59535 mapRes!59535))

(declare-fun b!1562760 () Bool)

(declare-fun res!1068460 () Bool)

(assert (=> b!1562760 (=> (not res!1068460) (not e!870936))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562760 (= res!1068460 (not (validKeyInArray!0 (select (arr!50276 _keys!637) from!782))))))

(declare-fun b!1562761 () Bool)

(declare-fun res!1068463 () Bool)

(assert (=> b!1562761 (=> (not res!1068463) (not e!870936))))

(declare-datatypes ((List!36552 0))(
  ( (Nil!36549) (Cons!36548 (h!37995 (_ BitVec 64)) (t!51391 List!36552)) )
))
(declare-fun arrayNoDuplicates!0 (array!104166 (_ BitVec 32) List!36552) Bool)

(assert (=> b!1562761 (= res!1068463 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36549))))

(declare-fun b!1562762 () Bool)

(declare-fun res!1068462 () Bool)

(assert (=> b!1562762 (=> (not res!1068462) (not e!870936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104166 (_ BitVec 32)) Bool)

(assert (=> b!1562762 (= res!1068462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1068464 () Bool)

(assert (=> start!133640 (=> (not res!1068464) (not e!870936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133640 (= res!1068464 (validMask!0 mask!947))))

(assert (=> start!133640 e!870936))

(assert (=> start!133640 true))

(declare-fun array_inv!39263 (array!104166) Bool)

(assert (=> start!133640 (array_inv!39263 _keys!637)))

(declare-fun e!870938 () Bool)

(declare-fun array_inv!39264 (array!104168) Bool)

(assert (=> start!133640 (and (array_inv!39264 _values!487) e!870938)))

(declare-fun mapNonEmpty!59535 () Bool)

(declare-fun tp!113371 () Bool)

(declare-fun e!870937 () Bool)

(assert (=> mapNonEmpty!59535 (= mapRes!59535 (and tp!113371 e!870937))))

(declare-fun mapValue!59535 () ValueCell!18356)

(declare-fun mapRest!59535 () (Array (_ BitVec 32) ValueCell!18356))

(declare-fun mapKey!59535 () (_ BitVec 32))

(assert (=> mapNonEmpty!59535 (= (arr!50277 _values!487) (store mapRest!59535 mapKey!59535 mapValue!59535))))

(declare-fun b!1562763 () Bool)

(declare-fun tp_is_empty!38773 () Bool)

(assert (=> b!1562763 (= e!870937 tp_is_empty!38773)))

(declare-fun b!1562764 () Bool)

(declare-fun e!870939 () Bool)

(assert (=> b!1562764 (= e!870938 (and e!870939 mapRes!59535))))

(declare-fun condMapEmpty!59535 () Bool)

(declare-fun mapDefault!59535 () ValueCell!18356)

(assert (=> b!1562764 (= condMapEmpty!59535 (= (arr!50277 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18356)) mapDefault!59535)))))

(declare-fun b!1562765 () Bool)

(assert (=> b!1562765 (= e!870939 tp_is_empty!38773)))

(declare-fun b!1562766 () Bool)

(declare-fun res!1068461 () Bool)

(assert (=> b!1562766 (=> (not res!1068461) (not e!870936))))

(assert (=> b!1562766 (= res!1068461 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50828 _keys!637)) (bvslt from!782 (size!50828 _keys!637))))))

(declare-fun b!1562767 () Bool)

(assert (=> b!1562767 (= e!870936 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(assert (= (and start!133640 res!1068464) b!1562759))

(assert (= (and b!1562759 res!1068465) b!1562762))

(assert (= (and b!1562762 res!1068462) b!1562761))

(assert (= (and b!1562761 res!1068463) b!1562766))

(assert (= (and b!1562766 res!1068461) b!1562760))

(assert (= (and b!1562760 res!1068460) b!1562767))

(assert (= (and b!1562764 condMapEmpty!59535) mapIsEmpty!59535))

(assert (= (and b!1562764 (not condMapEmpty!59535)) mapNonEmpty!59535))

(get-info :version)

(assert (= (and mapNonEmpty!59535 ((_ is ValueCellFull!18356) mapValue!59535)) b!1562763))

(assert (= (and b!1562764 ((_ is ValueCellFull!18356) mapDefault!59535)) b!1562765))

(assert (= start!133640 b!1562764))

(declare-fun m!1437813 () Bool)

(assert (=> mapNonEmpty!59535 m!1437813))

(declare-fun m!1437815 () Bool)

(assert (=> b!1562760 m!1437815))

(assert (=> b!1562760 m!1437815))

(declare-fun m!1437817 () Bool)

(assert (=> b!1562760 m!1437817))

(declare-fun m!1437819 () Bool)

(assert (=> b!1562762 m!1437819))

(declare-fun m!1437821 () Bool)

(assert (=> b!1562761 m!1437821))

(declare-fun m!1437823 () Bool)

(assert (=> start!133640 m!1437823))

(declare-fun m!1437825 () Bool)

(assert (=> start!133640 m!1437825))

(declare-fun m!1437827 () Bool)

(assert (=> start!133640 m!1437827))

(check-sat (not start!133640) tp_is_empty!38773 (not b!1562761) (not mapNonEmpty!59535) (not b!1562760) (not b!1562762))
(check-sat)
