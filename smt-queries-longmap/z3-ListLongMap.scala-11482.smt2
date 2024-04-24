; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134102 () Bool)

(assert start!134102)

(declare-fun b!1565508 () Bool)

(declare-fun res!1069454 () Bool)

(declare-fun e!872644 () Bool)

(assert (=> b!1565508 (=> (not res!1069454) (not e!872644))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104368 0))(
  ( (array!104369 (arr!50369 (Array (_ BitVec 32) (_ BitVec 64))) (size!50920 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104368)

(assert (=> b!1565508 (= res!1069454 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50920 _keys!637)) (bvslt from!782 (size!50920 _keys!637))))))

(declare-fun b!1565509 () Bool)

(declare-fun res!1069451 () Bool)

(assert (=> b!1565509 (=> (not res!1069451) (not e!872644))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59905 0))(
  ( (V!59906 (val!19470 Int)) )
))
(declare-datatypes ((ValueCell!18356 0))(
  ( (ValueCellFull!18356 (v!22214 V!59905)) (EmptyCell!18356) )
))
(declare-datatypes ((array!104370 0))(
  ( (array!104371 (arr!50370 (Array (_ BitVec 32) ValueCell!18356)) (size!50921 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104370)

(assert (=> b!1565509 (= res!1069451 (and (= (size!50921 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50920 _keys!637) (size!50921 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565510 () Bool)

(declare-fun e!872643 () Bool)

(declare-fun tp_is_empty!38773 () Bool)

(assert (=> b!1565510 (= e!872643 tp_is_empty!38773)))

(declare-fun b!1565511 () Bool)

(declare-fun res!1069452 () Bool)

(assert (=> b!1565511 (=> (not res!1069452) (not e!872644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104368 (_ BitVec 32)) Bool)

(assert (=> b!1565511 (= res!1069452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565512 () Bool)

(declare-fun res!1069450 () Bool)

(assert (=> b!1565512 (=> (not res!1069450) (not e!872644))))

(declare-datatypes ((List!36544 0))(
  ( (Nil!36541) (Cons!36540 (h!38004 (_ BitVec 64)) (t!51383 List!36544)) )
))
(declare-fun arrayNoDuplicates!0 (array!104368 (_ BitVec 32) List!36544) Bool)

(assert (=> b!1565512 (= res!1069450 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36541))))

(declare-fun b!1565513 () Bool)

(assert (=> b!1565513 (= e!872644 (bvslt (bvadd #b00000000000000000000000000000001 from!782) #b00000000000000000000000000000000))))

(declare-fun b!1565514 () Bool)

(declare-fun e!872646 () Bool)

(declare-fun e!872647 () Bool)

(declare-fun mapRes!59535 () Bool)

(assert (=> b!1565514 (= e!872646 (and e!872647 mapRes!59535))))

(declare-fun condMapEmpty!59535 () Bool)

(declare-fun mapDefault!59535 () ValueCell!18356)

(assert (=> b!1565514 (= condMapEmpty!59535 (= (arr!50370 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18356)) mapDefault!59535)))))

(declare-fun b!1565515 () Bool)

(declare-fun res!1069449 () Bool)

(assert (=> b!1565515 (=> (not res!1069449) (not e!872644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565515 (= res!1069449 (not (validKeyInArray!0 (select (arr!50369 _keys!637) from!782))))))

(declare-fun res!1069453 () Bool)

(assert (=> start!134102 (=> (not res!1069453) (not e!872644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134102 (= res!1069453 (validMask!0 mask!947))))

(assert (=> start!134102 e!872644))

(assert (=> start!134102 true))

(declare-fun array_inv!39393 (array!104368) Bool)

(assert (=> start!134102 (array_inv!39393 _keys!637)))

(declare-fun array_inv!39394 (array!104370) Bool)

(assert (=> start!134102 (and (array_inv!39394 _values!487) e!872646)))

(declare-fun mapIsEmpty!59535 () Bool)

(assert (=> mapIsEmpty!59535 mapRes!59535))

(declare-fun mapNonEmpty!59535 () Bool)

(declare-fun tp!113370 () Bool)

(assert (=> mapNonEmpty!59535 (= mapRes!59535 (and tp!113370 e!872643))))

(declare-fun mapValue!59535 () ValueCell!18356)

(declare-fun mapKey!59535 () (_ BitVec 32))

(declare-fun mapRest!59535 () (Array (_ BitVec 32) ValueCell!18356))

(assert (=> mapNonEmpty!59535 (= (arr!50370 _values!487) (store mapRest!59535 mapKey!59535 mapValue!59535))))

(declare-fun b!1565516 () Bool)

(assert (=> b!1565516 (= e!872647 tp_is_empty!38773)))

(assert (= (and start!134102 res!1069453) b!1565509))

(assert (= (and b!1565509 res!1069451) b!1565511))

(assert (= (and b!1565511 res!1069452) b!1565512))

(assert (= (and b!1565512 res!1069450) b!1565508))

(assert (= (and b!1565508 res!1069454) b!1565515))

(assert (= (and b!1565515 res!1069449) b!1565513))

(assert (= (and b!1565514 condMapEmpty!59535) mapIsEmpty!59535))

(assert (= (and b!1565514 (not condMapEmpty!59535)) mapNonEmpty!59535))

(get-info :version)

(assert (= (and mapNonEmpty!59535 ((_ is ValueCellFull!18356) mapValue!59535)) b!1565510))

(assert (= (and b!1565514 ((_ is ValueCellFull!18356) mapDefault!59535)) b!1565516))

(assert (= start!134102 b!1565514))

(declare-fun m!1440963 () Bool)

(assert (=> b!1565511 m!1440963))

(declare-fun m!1440965 () Bool)

(assert (=> b!1565515 m!1440965))

(assert (=> b!1565515 m!1440965))

(declare-fun m!1440967 () Bool)

(assert (=> b!1565515 m!1440967))

(declare-fun m!1440969 () Bool)

(assert (=> b!1565512 m!1440969))

(declare-fun m!1440971 () Bool)

(assert (=> mapNonEmpty!59535 m!1440971))

(declare-fun m!1440973 () Bool)

(assert (=> start!134102 m!1440973))

(declare-fun m!1440975 () Bool)

(assert (=> start!134102 m!1440975))

(declare-fun m!1440977 () Bool)

(assert (=> start!134102 m!1440977))

(check-sat (not start!134102) (not mapNonEmpty!59535) tp_is_empty!38773 (not b!1565515) (not b!1565511) (not b!1565512))
(check-sat)
