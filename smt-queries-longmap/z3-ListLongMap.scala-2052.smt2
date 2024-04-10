; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35482 () Bool)

(assert start!35482)

(declare-fun b!355610 () Bool)

(declare-fun res!197306 () Bool)

(declare-fun e!217807 () Bool)

(assert (=> b!355610 (=> (not res!197306) (not e!217807))))

(declare-datatypes ((array!19449 0))(
  ( (array!19450 (arr!9218 (Array (_ BitVec 32) (_ BitVec 64))) (size!9570 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19449)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19449 (_ BitVec 32)) Bool)

(assert (=> b!355610 (= res!197306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355611 () Bool)

(declare-fun e!217809 () Bool)

(declare-fun tp_is_empty!7935 () Bool)

(assert (=> b!355611 (= e!217809 tp_is_empty!7935)))

(declare-fun b!355612 () Bool)

(assert (=> b!355612 (= e!217807 false)))

(declare-fun lt!165818 () Bool)

(declare-datatypes ((List!5342 0))(
  ( (Nil!5339) (Cons!5338 (h!6194 (_ BitVec 64)) (t!10492 List!5342)) )
))
(declare-fun arrayNoDuplicates!0 (array!19449 (_ BitVec 32) List!5342) Bool)

(assert (=> b!355612 (= lt!165818 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5339))))

(declare-fun b!355613 () Bool)

(declare-fun e!217810 () Bool)

(declare-fun e!217808 () Bool)

(declare-fun mapRes!13410 () Bool)

(assert (=> b!355613 (= e!217810 (and e!217808 mapRes!13410))))

(declare-fun condMapEmpty!13410 () Bool)

(declare-datatypes ((V!11557 0))(
  ( (V!11558 (val!4012 Int)) )
))
(declare-datatypes ((ValueCell!3624 0))(
  ( (ValueCellFull!3624 (v!6206 V!11557)) (EmptyCell!3624) )
))
(declare-datatypes ((array!19451 0))(
  ( (array!19452 (arr!9219 (Array (_ BitVec 32) ValueCell!3624)) (size!9571 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19451)

(declare-fun mapDefault!13410 () ValueCell!3624)

(assert (=> b!355613 (= condMapEmpty!13410 (= (arr!9219 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3624)) mapDefault!13410)))))

(declare-fun mapIsEmpty!13410 () Bool)

(assert (=> mapIsEmpty!13410 mapRes!13410))

(declare-fun res!197307 () Bool)

(assert (=> start!35482 (=> (not res!197307) (not e!217807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35482 (= res!197307 (validMask!0 mask!1842))))

(assert (=> start!35482 e!217807))

(assert (=> start!35482 true))

(declare-fun array_inv!6772 (array!19451) Bool)

(assert (=> start!35482 (and (array_inv!6772 _values!1208) e!217810)))

(declare-fun array_inv!6773 (array!19449) Bool)

(assert (=> start!35482 (array_inv!6773 _keys!1456)))

(declare-fun mapNonEmpty!13410 () Bool)

(declare-fun tp!27387 () Bool)

(assert (=> mapNonEmpty!13410 (= mapRes!13410 (and tp!27387 e!217809))))

(declare-fun mapKey!13410 () (_ BitVec 32))

(declare-fun mapRest!13410 () (Array (_ BitVec 32) ValueCell!3624))

(declare-fun mapValue!13410 () ValueCell!3624)

(assert (=> mapNonEmpty!13410 (= (arr!9219 _values!1208) (store mapRest!13410 mapKey!13410 mapValue!13410))))

(declare-fun b!355614 () Bool)

(declare-fun res!197308 () Bool)

(assert (=> b!355614 (=> (not res!197308) (not e!217807))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355614 (= res!197308 (and (= (size!9571 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9570 _keys!1456) (size!9571 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355615 () Bool)

(assert (=> b!355615 (= e!217808 tp_is_empty!7935)))

(assert (= (and start!35482 res!197307) b!355614))

(assert (= (and b!355614 res!197308) b!355610))

(assert (= (and b!355610 res!197306) b!355612))

(assert (= (and b!355613 condMapEmpty!13410) mapIsEmpty!13410))

(assert (= (and b!355613 (not condMapEmpty!13410)) mapNonEmpty!13410))

(get-info :version)

(assert (= (and mapNonEmpty!13410 ((_ is ValueCellFull!3624) mapValue!13410)) b!355611))

(assert (= (and b!355613 ((_ is ValueCellFull!3624) mapDefault!13410)) b!355615))

(assert (= start!35482 b!355613))

(declare-fun m!354289 () Bool)

(assert (=> b!355610 m!354289))

(declare-fun m!354291 () Bool)

(assert (=> b!355612 m!354291))

(declare-fun m!354293 () Bool)

(assert (=> start!35482 m!354293))

(declare-fun m!354295 () Bool)

(assert (=> start!35482 m!354295))

(declare-fun m!354297 () Bool)

(assert (=> start!35482 m!354297))

(declare-fun m!354299 () Bool)

(assert (=> mapNonEmpty!13410 m!354299))

(check-sat (not mapNonEmpty!13410) tp_is_empty!7935 (not b!355610) (not start!35482) (not b!355612))
(check-sat)
