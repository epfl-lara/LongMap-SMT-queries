; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35328 () Bool)

(assert start!35328)

(declare-fun b!353644 () Bool)

(declare-fun res!196082 () Bool)

(declare-fun e!216645 () Bool)

(assert (=> b!353644 (=> (not res!196082) (not e!216645))))

(declare-datatypes ((array!19187 0))(
  ( (array!19188 (arr!9088 (Array (_ BitVec 32) (_ BitVec 64))) (size!9441 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19187)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19187 (_ BitVec 32)) Bool)

(assert (=> b!353644 (= res!196082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13215 () Bool)

(declare-fun mapRes!13215 () Bool)

(assert (=> mapIsEmpty!13215 mapRes!13215))

(declare-fun b!353645 () Bool)

(declare-fun e!216648 () Bool)

(declare-fun tp_is_empty!7807 () Bool)

(assert (=> b!353645 (= e!216648 tp_is_empty!7807)))

(declare-fun b!353646 () Bool)

(declare-fun res!196084 () Bool)

(assert (=> b!353646 (=> (not res!196084) (not e!216645))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11387 0))(
  ( (V!11388 (val!3948 Int)) )
))
(declare-datatypes ((ValueCell!3560 0))(
  ( (ValueCellFull!3560 (v!6136 V!11387)) (EmptyCell!3560) )
))
(declare-datatypes ((array!19189 0))(
  ( (array!19190 (arr!9089 (Array (_ BitVec 32) ValueCell!3560)) (size!9442 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19189)

(assert (=> b!353646 (= res!196084 (and (= (size!9442 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9441 _keys!1456) (size!9442 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13215 () Bool)

(declare-fun tp!27111 () Bool)

(assert (=> mapNonEmpty!13215 (= mapRes!13215 (and tp!27111 e!216648))))

(declare-fun mapRest!13215 () (Array (_ BitVec 32) ValueCell!3560))

(declare-fun mapKey!13215 () (_ BitVec 32))

(declare-fun mapValue!13215 () ValueCell!3560)

(assert (=> mapNonEmpty!13215 (= (arr!9089 _values!1208) (store mapRest!13215 mapKey!13215 mapValue!13215))))

(declare-fun b!353647 () Bool)

(assert (=> b!353647 (= e!216645 false)))

(declare-fun lt!165391 () Bool)

(declare-datatypes ((List!5253 0))(
  ( (Nil!5250) (Cons!5249 (h!6105 (_ BitVec 64)) (t!10394 List!5253)) )
))
(declare-fun arrayNoDuplicates!0 (array!19187 (_ BitVec 32) List!5253) Bool)

(assert (=> b!353647 (= lt!165391 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5250))))

(declare-fun b!353648 () Bool)

(declare-fun e!216644 () Bool)

(assert (=> b!353648 (= e!216644 tp_is_empty!7807)))

(declare-fun res!196083 () Bool)

(assert (=> start!35328 (=> (not res!196083) (not e!216645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35328 (= res!196083 (validMask!0 mask!1842))))

(assert (=> start!35328 e!216645))

(assert (=> start!35328 true))

(declare-fun e!216647 () Bool)

(declare-fun array_inv!6728 (array!19189) Bool)

(assert (=> start!35328 (and (array_inv!6728 _values!1208) e!216647)))

(declare-fun array_inv!6729 (array!19187) Bool)

(assert (=> start!35328 (array_inv!6729 _keys!1456)))

(declare-fun b!353649 () Bool)

(assert (=> b!353649 (= e!216647 (and e!216644 mapRes!13215))))

(declare-fun condMapEmpty!13215 () Bool)

(declare-fun mapDefault!13215 () ValueCell!3560)

(assert (=> b!353649 (= condMapEmpty!13215 (= (arr!9089 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3560)) mapDefault!13215)))))

(assert (= (and start!35328 res!196083) b!353646))

(assert (= (and b!353646 res!196084) b!353644))

(assert (= (and b!353644 res!196082) b!353647))

(assert (= (and b!353649 condMapEmpty!13215) mapIsEmpty!13215))

(assert (= (and b!353649 (not condMapEmpty!13215)) mapNonEmpty!13215))

(get-info :version)

(assert (= (and mapNonEmpty!13215 ((_ is ValueCellFull!3560) mapValue!13215)) b!353645))

(assert (= (and b!353649 ((_ is ValueCellFull!3560) mapDefault!13215)) b!353648))

(assert (= start!35328 b!353649))

(declare-fun m!352389 () Bool)

(assert (=> b!353644 m!352389))

(declare-fun m!352391 () Bool)

(assert (=> mapNonEmpty!13215 m!352391))

(declare-fun m!352393 () Bool)

(assert (=> b!353647 m!352393))

(declare-fun m!352395 () Bool)

(assert (=> start!35328 m!352395))

(declare-fun m!352397 () Bool)

(assert (=> start!35328 m!352397))

(declare-fun m!352399 () Bool)

(assert (=> start!35328 m!352399))

(check-sat (not mapNonEmpty!13215) (not b!353647) (not start!35328) (not b!353644) tp_is_empty!7807)
(check-sat)
