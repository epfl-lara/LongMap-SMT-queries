; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35380 () Bool)

(assert start!35380)

(declare-fun b!354206 () Bool)

(declare-fun e!217046 () Bool)

(declare-fun e!217045 () Bool)

(declare-fun mapRes!13257 () Bool)

(assert (=> b!354206 (= e!217046 (and e!217045 mapRes!13257))))

(declare-fun condMapEmpty!13257 () Bool)

(declare-datatypes ((V!11421 0))(
  ( (V!11422 (val!3961 Int)) )
))
(declare-datatypes ((ValueCell!3573 0))(
  ( (ValueCellFull!3573 (v!6155 V!11421)) (EmptyCell!3573) )
))
(declare-datatypes ((array!19253 0))(
  ( (array!19254 (arr!9120 (Array (_ BitVec 32) ValueCell!3573)) (size!9472 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19253)

(declare-fun mapDefault!13257 () ValueCell!3573)

(assert (=> b!354206 (= condMapEmpty!13257 (= (arr!9120 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3573)) mapDefault!13257)))))

(declare-fun mapIsEmpty!13257 () Bool)

(assert (=> mapIsEmpty!13257 mapRes!13257))

(declare-fun b!354207 () Bool)

(declare-fun e!217042 () Bool)

(declare-fun tp_is_empty!7833 () Bool)

(assert (=> b!354207 (= e!217042 tp_is_empty!7833)))

(declare-fun b!354208 () Bool)

(declare-fun res!196363 () Bool)

(declare-fun e!217043 () Bool)

(assert (=> b!354208 (=> (not res!196363) (not e!217043))))

(declare-datatypes ((array!19255 0))(
  ( (array!19256 (arr!9121 (Array (_ BitVec 32) (_ BitVec 64))) (size!9473 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19255)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19255 (_ BitVec 32)) Bool)

(assert (=> b!354208 (= res!196363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354209 () Bool)

(declare-fun res!196361 () Bool)

(assert (=> b!354209 (=> (not res!196361) (not e!217043))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354209 (= res!196361 (and (= (size!9472 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9473 _keys!1456) (size!9472 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354211 () Bool)

(assert (=> b!354211 (= e!217043 false)))

(declare-fun lt!165665 () Bool)

(declare-datatypes ((List!5289 0))(
  ( (Nil!5286) (Cons!5285 (h!6141 (_ BitVec 64)) (t!10439 List!5289)) )
))
(declare-fun arrayNoDuplicates!0 (array!19255 (_ BitVec 32) List!5289) Bool)

(assert (=> b!354211 (= lt!165665 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5286))))

(declare-fun mapNonEmpty!13257 () Bool)

(declare-fun tp!27153 () Bool)

(assert (=> mapNonEmpty!13257 (= mapRes!13257 (and tp!27153 e!217042))))

(declare-fun mapRest!13257 () (Array (_ BitVec 32) ValueCell!3573))

(declare-fun mapValue!13257 () ValueCell!3573)

(declare-fun mapKey!13257 () (_ BitVec 32))

(assert (=> mapNonEmpty!13257 (= (arr!9120 _values!1208) (store mapRest!13257 mapKey!13257 mapValue!13257))))

(declare-fun res!196362 () Bool)

(assert (=> start!35380 (=> (not res!196362) (not e!217043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35380 (= res!196362 (validMask!0 mask!1842))))

(assert (=> start!35380 e!217043))

(assert (=> start!35380 true))

(declare-fun array_inv!6710 (array!19253) Bool)

(assert (=> start!35380 (and (array_inv!6710 _values!1208) e!217046)))

(declare-fun array_inv!6711 (array!19255) Bool)

(assert (=> start!35380 (array_inv!6711 _keys!1456)))

(declare-fun b!354210 () Bool)

(assert (=> b!354210 (= e!217045 tp_is_empty!7833)))

(assert (= (and start!35380 res!196362) b!354209))

(assert (= (and b!354209 res!196361) b!354208))

(assert (= (and b!354208 res!196363) b!354211))

(assert (= (and b!354206 condMapEmpty!13257) mapIsEmpty!13257))

(assert (= (and b!354206 (not condMapEmpty!13257)) mapNonEmpty!13257))

(get-info :version)

(assert (= (and mapNonEmpty!13257 ((_ is ValueCellFull!3573) mapValue!13257)) b!354207))

(assert (= (and b!354206 ((_ is ValueCellFull!3573) mapDefault!13257)) b!354210))

(assert (= start!35380 b!354206))

(declare-fun m!353299 () Bool)

(assert (=> b!354208 m!353299))

(declare-fun m!353301 () Bool)

(assert (=> b!354211 m!353301))

(declare-fun m!353303 () Bool)

(assert (=> mapNonEmpty!13257 m!353303))

(declare-fun m!353305 () Bool)

(assert (=> start!35380 m!353305))

(declare-fun m!353307 () Bool)

(assert (=> start!35380 m!353307))

(declare-fun m!353309 () Bool)

(assert (=> start!35380 m!353309))

(check-sat tp_is_empty!7833 (not mapNonEmpty!13257) (not b!354211) (not b!354208) (not start!35380))
(check-sat)
