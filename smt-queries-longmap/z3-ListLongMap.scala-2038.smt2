; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35398 () Bool)

(assert start!35398)

(declare-fun b!354369 () Bool)

(declare-fun e!217177 () Bool)

(declare-fun tp_is_empty!7851 () Bool)

(assert (=> b!354369 (= e!217177 tp_is_empty!7851)))

(declare-fun b!354370 () Bool)

(declare-fun res!196444 () Bool)

(declare-fun e!217178 () Bool)

(assert (=> b!354370 (=> (not res!196444) (not e!217178))))

(declare-datatypes ((array!19287 0))(
  ( (array!19288 (arr!9137 (Array (_ BitVec 32) (_ BitVec 64))) (size!9489 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19287)

(declare-datatypes ((V!11445 0))(
  ( (V!11446 (val!3970 Int)) )
))
(declare-datatypes ((ValueCell!3582 0))(
  ( (ValueCellFull!3582 (v!6164 V!11445)) (EmptyCell!3582) )
))
(declare-datatypes ((array!19289 0))(
  ( (array!19290 (arr!9138 (Array (_ BitVec 32) ValueCell!3582)) (size!9490 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19289)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!354370 (= res!196444 (and (= (size!9490 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9489 _keys!1456) (size!9490 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13284 () Bool)

(declare-fun mapRes!13284 () Bool)

(assert (=> mapIsEmpty!13284 mapRes!13284))

(declare-fun mapNonEmpty!13284 () Bool)

(declare-fun tp!27180 () Bool)

(assert (=> mapNonEmpty!13284 (= mapRes!13284 (and tp!27180 e!217177))))

(declare-fun mapKey!13284 () (_ BitVec 32))

(declare-fun mapValue!13284 () ValueCell!3582)

(declare-fun mapRest!13284 () (Array (_ BitVec 32) ValueCell!3582))

(assert (=> mapNonEmpty!13284 (= (arr!9138 _values!1208) (store mapRest!13284 mapKey!13284 mapValue!13284))))

(declare-fun b!354371 () Bool)

(assert (=> b!354371 (= e!217178 false)))

(declare-fun lt!165692 () Bool)

(declare-datatypes ((List!5295 0))(
  ( (Nil!5292) (Cons!5291 (h!6147 (_ BitVec 64)) (t!10445 List!5295)) )
))
(declare-fun arrayNoDuplicates!0 (array!19287 (_ BitVec 32) List!5295) Bool)

(assert (=> b!354371 (= lt!165692 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5292))))

(declare-fun b!354372 () Bool)

(declare-fun e!217179 () Bool)

(declare-fun e!217180 () Bool)

(assert (=> b!354372 (= e!217179 (and e!217180 mapRes!13284))))

(declare-fun condMapEmpty!13284 () Bool)

(declare-fun mapDefault!13284 () ValueCell!3582)

(assert (=> b!354372 (= condMapEmpty!13284 (= (arr!9138 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3582)) mapDefault!13284)))))

(declare-fun b!354373 () Bool)

(assert (=> b!354373 (= e!217180 tp_is_empty!7851)))

(declare-fun b!354368 () Bool)

(declare-fun res!196442 () Bool)

(assert (=> b!354368 (=> (not res!196442) (not e!217178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19287 (_ BitVec 32)) Bool)

(assert (=> b!354368 (= res!196442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!196443 () Bool)

(assert (=> start!35398 (=> (not res!196443) (not e!217178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35398 (= res!196443 (validMask!0 mask!1842))))

(assert (=> start!35398 e!217178))

(assert (=> start!35398 true))

(declare-fun array_inv!6720 (array!19289) Bool)

(assert (=> start!35398 (and (array_inv!6720 _values!1208) e!217179)))

(declare-fun array_inv!6721 (array!19287) Bool)

(assert (=> start!35398 (array_inv!6721 _keys!1456)))

(assert (= (and start!35398 res!196443) b!354370))

(assert (= (and b!354370 res!196444) b!354368))

(assert (= (and b!354368 res!196442) b!354371))

(assert (= (and b!354372 condMapEmpty!13284) mapIsEmpty!13284))

(assert (= (and b!354372 (not condMapEmpty!13284)) mapNonEmpty!13284))

(get-info :version)

(assert (= (and mapNonEmpty!13284 ((_ is ValueCellFull!3582) mapValue!13284)) b!354369))

(assert (= (and b!354372 ((_ is ValueCellFull!3582) mapDefault!13284)) b!354373))

(assert (= start!35398 b!354372))

(declare-fun m!353407 () Bool)

(assert (=> mapNonEmpty!13284 m!353407))

(declare-fun m!353409 () Bool)

(assert (=> b!354371 m!353409))

(declare-fun m!353411 () Bool)

(assert (=> b!354368 m!353411))

(declare-fun m!353413 () Bool)

(assert (=> start!35398 m!353413))

(declare-fun m!353415 () Bool)

(assert (=> start!35398 m!353415))

(declare-fun m!353417 () Bool)

(assert (=> start!35398 m!353417))

(check-sat (not b!354368) (not mapNonEmpty!13284) tp_is_empty!7851 (not start!35398) (not b!354371))
(check-sat)
