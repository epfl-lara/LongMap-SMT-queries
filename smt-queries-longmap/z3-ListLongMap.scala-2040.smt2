; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35410 () Bool)

(assert start!35410)

(declare-fun mapIsEmpty!13302 () Bool)

(declare-fun mapRes!13302 () Bool)

(assert (=> mapIsEmpty!13302 mapRes!13302))

(declare-fun b!354476 () Bool)

(declare-fun res!196497 () Bool)

(declare-fun e!217270 () Bool)

(assert (=> b!354476 (=> (not res!196497) (not e!217270))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19309 0))(
  ( (array!19310 (arr!9148 (Array (_ BitVec 32) (_ BitVec 64))) (size!9500 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19309)

(declare-datatypes ((V!11461 0))(
  ( (V!11462 (val!3976 Int)) )
))
(declare-datatypes ((ValueCell!3588 0))(
  ( (ValueCellFull!3588 (v!6170 V!11461)) (EmptyCell!3588) )
))
(declare-datatypes ((array!19311 0))(
  ( (array!19312 (arr!9149 (Array (_ BitVec 32) ValueCell!3588)) (size!9501 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19311)

(assert (=> b!354476 (= res!196497 (and (= (size!9501 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9500 _keys!1456) (size!9501 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!196496 () Bool)

(assert (=> start!35410 (=> (not res!196496) (not e!217270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35410 (= res!196496 (validMask!0 mask!1842))))

(assert (=> start!35410 e!217270))

(assert (=> start!35410 true))

(declare-fun e!217269 () Bool)

(declare-fun array_inv!6728 (array!19311) Bool)

(assert (=> start!35410 (and (array_inv!6728 _values!1208) e!217269)))

(declare-fun array_inv!6729 (array!19309) Bool)

(assert (=> start!35410 (array_inv!6729 _keys!1456)))

(declare-fun b!354477 () Bool)

(declare-fun e!217267 () Bool)

(assert (=> b!354477 (= e!217269 (and e!217267 mapRes!13302))))

(declare-fun condMapEmpty!13302 () Bool)

(declare-fun mapDefault!13302 () ValueCell!3588)

(assert (=> b!354477 (= condMapEmpty!13302 (= (arr!9149 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3588)) mapDefault!13302)))))

(declare-fun b!354478 () Bool)

(declare-fun res!196498 () Bool)

(assert (=> b!354478 (=> (not res!196498) (not e!217270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19309 (_ BitVec 32)) Bool)

(assert (=> b!354478 (= res!196498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354479 () Bool)

(assert (=> b!354479 (= e!217270 false)))

(declare-fun lt!165710 () Bool)

(declare-datatypes ((List!5298 0))(
  ( (Nil!5295) (Cons!5294 (h!6150 (_ BitVec 64)) (t!10448 List!5298)) )
))
(declare-fun arrayNoDuplicates!0 (array!19309 (_ BitVec 32) List!5298) Bool)

(assert (=> b!354479 (= lt!165710 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5295))))

(declare-fun b!354480 () Bool)

(declare-fun e!217268 () Bool)

(declare-fun tp_is_empty!7863 () Bool)

(assert (=> b!354480 (= e!217268 tp_is_empty!7863)))

(declare-fun mapNonEmpty!13302 () Bool)

(declare-fun tp!27198 () Bool)

(assert (=> mapNonEmpty!13302 (= mapRes!13302 (and tp!27198 e!217268))))

(declare-fun mapValue!13302 () ValueCell!3588)

(declare-fun mapKey!13302 () (_ BitVec 32))

(declare-fun mapRest!13302 () (Array (_ BitVec 32) ValueCell!3588))

(assert (=> mapNonEmpty!13302 (= (arr!9149 _values!1208) (store mapRest!13302 mapKey!13302 mapValue!13302))))

(declare-fun b!354481 () Bool)

(assert (=> b!354481 (= e!217267 tp_is_empty!7863)))

(assert (= (and start!35410 res!196496) b!354476))

(assert (= (and b!354476 res!196497) b!354478))

(assert (= (and b!354478 res!196498) b!354479))

(assert (= (and b!354477 condMapEmpty!13302) mapIsEmpty!13302))

(assert (= (and b!354477 (not condMapEmpty!13302)) mapNonEmpty!13302))

(get-info :version)

(assert (= (and mapNonEmpty!13302 ((_ is ValueCellFull!3588) mapValue!13302)) b!354480))

(assert (= (and b!354477 ((_ is ValueCellFull!3588) mapDefault!13302)) b!354481))

(assert (= start!35410 b!354477))

(declare-fun m!353479 () Bool)

(assert (=> start!35410 m!353479))

(declare-fun m!353481 () Bool)

(assert (=> start!35410 m!353481))

(declare-fun m!353483 () Bool)

(assert (=> start!35410 m!353483))

(declare-fun m!353485 () Bool)

(assert (=> b!354478 m!353485))

(declare-fun m!353487 () Bool)

(assert (=> b!354479 m!353487))

(declare-fun m!353489 () Bool)

(assert (=> mapNonEmpty!13302 m!353489))

(check-sat tp_is_empty!7863 (not b!354479) (not start!35410) (not mapNonEmpty!13302) (not b!354478))
(check-sat)
