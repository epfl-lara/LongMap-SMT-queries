; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35382 () Bool)

(assert start!35382)

(declare-fun mapIsEmpty!13281 () Bool)

(declare-fun mapRes!13281 () Bool)

(assert (=> mapIsEmpty!13281 mapRes!13281))

(declare-fun b!354297 () Bool)

(declare-fun e!217130 () Bool)

(declare-fun e!217128 () Bool)

(assert (=> b!354297 (= e!217130 (and e!217128 mapRes!13281))))

(declare-fun condMapEmpty!13281 () Bool)

(declare-datatypes ((V!11443 0))(
  ( (V!11444 (val!3969 Int)) )
))
(declare-datatypes ((ValueCell!3581 0))(
  ( (ValueCellFull!3581 (v!6164 V!11443)) (EmptyCell!3581) )
))
(declare-datatypes ((array!19272 0))(
  ( (array!19273 (arr!9129 (Array (_ BitVec 32) ValueCell!3581)) (size!9481 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19272)

(declare-fun mapDefault!13281 () ValueCell!3581)

(assert (=> b!354297 (= condMapEmpty!13281 (= (arr!9129 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3581)) mapDefault!13281)))))

(declare-fun b!354298 () Bool)

(declare-fun res!196430 () Bool)

(declare-fun e!217132 () Bool)

(assert (=> b!354298 (=> (not res!196430) (not e!217132))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19274 0))(
  ( (array!19275 (arr!9130 (Array (_ BitVec 32) (_ BitVec 64))) (size!9482 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19274)

(assert (=> b!354298 (= res!196430 (and (= (size!9481 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9482 _keys!1456) (size!9481 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354299 () Bool)

(declare-fun res!196432 () Bool)

(assert (=> b!354299 (=> (not res!196432) (not e!217132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19274 (_ BitVec 32)) Bool)

(assert (=> b!354299 (= res!196432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354300 () Bool)

(assert (=> b!354300 (= e!217132 false)))

(declare-fun lt!165707 () Bool)

(declare-datatypes ((List!5199 0))(
  ( (Nil!5196) (Cons!5195 (h!6051 (_ BitVec 64)) (t!10341 List!5199)) )
))
(declare-fun arrayNoDuplicates!0 (array!19274 (_ BitVec 32) List!5199) Bool)

(assert (=> b!354300 (= lt!165707 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5196))))

(declare-fun b!354301 () Bool)

(declare-fun e!217129 () Bool)

(declare-fun tp_is_empty!7849 () Bool)

(assert (=> b!354301 (= e!217129 tp_is_empty!7849)))

(declare-fun mapNonEmpty!13281 () Bool)

(declare-fun tp!27177 () Bool)

(assert (=> mapNonEmpty!13281 (= mapRes!13281 (and tp!27177 e!217129))))

(declare-fun mapValue!13281 () ValueCell!3581)

(declare-fun mapKey!13281 () (_ BitVec 32))

(declare-fun mapRest!13281 () (Array (_ BitVec 32) ValueCell!3581))

(assert (=> mapNonEmpty!13281 (= (arr!9129 _values!1208) (store mapRest!13281 mapKey!13281 mapValue!13281))))

(declare-fun b!354302 () Bool)

(assert (=> b!354302 (= e!217128 tp_is_empty!7849)))

(declare-fun res!196431 () Bool)

(assert (=> start!35382 (=> (not res!196431) (not e!217132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35382 (= res!196431 (validMask!0 mask!1842))))

(assert (=> start!35382 e!217132))

(assert (=> start!35382 true))

(declare-fun array_inv!6742 (array!19272) Bool)

(assert (=> start!35382 (and (array_inv!6742 _values!1208) e!217130)))

(declare-fun array_inv!6743 (array!19274) Bool)

(assert (=> start!35382 (array_inv!6743 _keys!1456)))

(assert (= (and start!35382 res!196431) b!354298))

(assert (= (and b!354298 res!196430) b!354299))

(assert (= (and b!354299 res!196432) b!354300))

(assert (= (and b!354297 condMapEmpty!13281) mapIsEmpty!13281))

(assert (= (and b!354297 (not condMapEmpty!13281)) mapNonEmpty!13281))

(get-info :version)

(assert (= (and mapNonEmpty!13281 ((_ is ValueCellFull!3581) mapValue!13281)) b!354301))

(assert (= (and b!354297 ((_ is ValueCellFull!3581) mapDefault!13281)) b!354302))

(assert (= start!35382 b!354297))

(declare-fun m!353619 () Bool)

(assert (=> b!354299 m!353619))

(declare-fun m!353621 () Bool)

(assert (=> b!354300 m!353621))

(declare-fun m!353623 () Bool)

(assert (=> mapNonEmpty!13281 m!353623))

(declare-fun m!353625 () Bool)

(assert (=> start!35382 m!353625))

(declare-fun m!353627 () Bool)

(assert (=> start!35382 m!353627))

(declare-fun m!353629 () Bool)

(assert (=> start!35382 m!353629))

(check-sat tp_is_empty!7849 (not b!354300) (not mapNonEmpty!13281) (not b!354299) (not start!35382))
(check-sat)
