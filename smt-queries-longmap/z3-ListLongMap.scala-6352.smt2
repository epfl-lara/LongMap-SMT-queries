; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81830 () Bool)

(assert start!81830)

(declare-fun b_free!18343 () Bool)

(declare-fun b_next!18343 () Bool)

(assert (=> start!81830 (= b_free!18343 (not b_next!18343))))

(declare-fun tp!63730 () Bool)

(declare-fun b_and!29803 () Bool)

(assert (=> start!81830 (= tp!63730 b_and!29803)))

(declare-fun b!954269 () Bool)

(declare-fun res!639071 () Bool)

(declare-fun e!537612 () Bool)

(assert (=> b!954269 (=> (not res!639071) (not e!537612))))

(declare-datatypes ((array!57846 0))(
  ( (array!57847 (arr!27803 (Array (_ BitVec 32) (_ BitVec 64))) (size!28284 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57846)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954269 (= res!639071 (validKeyInArray!0 (select (arr!27803 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33292 () Bool)

(declare-fun mapRes!33292 () Bool)

(declare-fun tp!63729 () Bool)

(declare-fun e!537613 () Bool)

(assert (=> mapNonEmpty!33292 (= mapRes!33292 (and tp!63729 e!537613))))

(declare-datatypes ((V!32833 0))(
  ( (V!32834 (val!10494 Int)) )
))
(declare-datatypes ((ValueCell!9962 0))(
  ( (ValueCellFull!9962 (v!13048 V!32833)) (EmptyCell!9962) )
))
(declare-fun mapRest!33292 () (Array (_ BitVec 32) ValueCell!9962))

(declare-datatypes ((array!57848 0))(
  ( (array!57849 (arr!27804 (Array (_ BitVec 32) ValueCell!9962)) (size!28285 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57848)

(declare-fun mapValue!33292 () ValueCell!9962)

(declare-fun mapKey!33292 () (_ BitVec 32))

(assert (=> mapNonEmpty!33292 (= (arr!27804 _values!1197) (store mapRest!33292 mapKey!33292 mapValue!33292))))

(declare-fun b!954270 () Bool)

(assert (=> b!954270 (= e!537612 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32833)

(declare-fun lt!429672 () Bool)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32833)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13666 0))(
  ( (tuple2!13667 (_1!6844 (_ BitVec 64)) (_2!6844 V!32833)) )
))
(declare-datatypes ((List!19407 0))(
  ( (Nil!19404) (Cons!19403 (h!20565 tuple2!13666) (t!27759 List!19407)) )
))
(declare-datatypes ((ListLongMap!12353 0))(
  ( (ListLongMap!12354 (toList!6192 List!19407)) )
))
(declare-fun contains!5233 (ListLongMap!12353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3354 (array!57846 array!57848 (_ BitVec 32) (_ BitVec 32) V!32833 V!32833 (_ BitVec 32) Int) ListLongMap!12353)

(assert (=> b!954270 (= lt!429672 (contains!5233 (getCurrentListMap!3354 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27803 _keys!1441) i!735)))))

(declare-fun b!954271 () Bool)

(declare-fun res!639072 () Bool)

(assert (=> b!954271 (=> (not res!639072) (not e!537612))))

(declare-datatypes ((List!19408 0))(
  ( (Nil!19405) (Cons!19404 (h!20566 (_ BitVec 64)) (t!27760 List!19408)) )
))
(declare-fun arrayNoDuplicates!0 (array!57846 (_ BitVec 32) List!19408) Bool)

(assert (=> b!954271 (= res!639072 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19405))))

(declare-fun b!954272 () Bool)

(declare-fun e!537615 () Bool)

(declare-fun tp_is_empty!20887 () Bool)

(assert (=> b!954272 (= e!537615 tp_is_empty!20887)))

(declare-fun b!954273 () Bool)

(declare-fun e!537611 () Bool)

(assert (=> b!954273 (= e!537611 (and e!537615 mapRes!33292))))

(declare-fun condMapEmpty!33292 () Bool)

(declare-fun mapDefault!33292 () ValueCell!9962)

(assert (=> b!954273 (= condMapEmpty!33292 (= (arr!27804 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9962)) mapDefault!33292)))))

(declare-fun b!954274 () Bool)

(declare-fun res!639076 () Bool)

(assert (=> b!954274 (=> (not res!639076) (not e!537612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57846 (_ BitVec 32)) Bool)

(assert (=> b!954274 (= res!639076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!639073 () Bool)

(assert (=> start!81830 (=> (not res!639073) (not e!537612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81830 (= res!639073 (validMask!0 mask!1823))))

(assert (=> start!81830 e!537612))

(assert (=> start!81830 true))

(assert (=> start!81830 tp_is_empty!20887))

(declare-fun array_inv!21647 (array!57846) Bool)

(assert (=> start!81830 (array_inv!21647 _keys!1441)))

(declare-fun array_inv!21648 (array!57848) Bool)

(assert (=> start!81830 (and (array_inv!21648 _values!1197) e!537611)))

(assert (=> start!81830 tp!63730))

(declare-fun b!954275 () Bool)

(declare-fun res!639075 () Bool)

(assert (=> b!954275 (=> (not res!639075) (not e!537612))))

(assert (=> b!954275 (= res!639075 (and (= (size!28285 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28284 _keys!1441) (size!28285 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954276 () Bool)

(declare-fun res!639074 () Bool)

(assert (=> b!954276 (=> (not res!639074) (not e!537612))))

(assert (=> b!954276 (= res!639074 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28284 _keys!1441))))))

(declare-fun mapIsEmpty!33292 () Bool)

(assert (=> mapIsEmpty!33292 mapRes!33292))

(declare-fun b!954277 () Bool)

(assert (=> b!954277 (= e!537613 tp_is_empty!20887)))

(assert (= (and start!81830 res!639073) b!954275))

(assert (= (and b!954275 res!639075) b!954274))

(assert (= (and b!954274 res!639076) b!954271))

(assert (= (and b!954271 res!639072) b!954276))

(assert (= (and b!954276 res!639074) b!954269))

(assert (= (and b!954269 res!639071) b!954270))

(assert (= (and b!954273 condMapEmpty!33292) mapIsEmpty!33292))

(assert (= (and b!954273 (not condMapEmpty!33292)) mapNonEmpty!33292))

(get-info :version)

(assert (= (and mapNonEmpty!33292 ((_ is ValueCellFull!9962) mapValue!33292)) b!954277))

(assert (= (and b!954273 ((_ is ValueCellFull!9962) mapDefault!33292)) b!954272))

(assert (= start!81830 b!954273))

(declare-fun m!885465 () Bool)

(assert (=> start!81830 m!885465))

(declare-fun m!885467 () Bool)

(assert (=> start!81830 m!885467))

(declare-fun m!885469 () Bool)

(assert (=> start!81830 m!885469))

(declare-fun m!885471 () Bool)

(assert (=> b!954274 m!885471))

(declare-fun m!885473 () Bool)

(assert (=> b!954269 m!885473))

(assert (=> b!954269 m!885473))

(declare-fun m!885475 () Bool)

(assert (=> b!954269 m!885475))

(declare-fun m!885477 () Bool)

(assert (=> b!954270 m!885477))

(assert (=> b!954270 m!885473))

(assert (=> b!954270 m!885477))

(assert (=> b!954270 m!885473))

(declare-fun m!885479 () Bool)

(assert (=> b!954270 m!885479))

(declare-fun m!885481 () Bool)

(assert (=> mapNonEmpty!33292 m!885481))

(declare-fun m!885483 () Bool)

(assert (=> b!954271 m!885483))

(check-sat b_and!29803 (not mapNonEmpty!33292) (not b!954271) (not b!954269) (not b!954270) tp_is_empty!20887 (not b_next!18343) (not start!81830) (not b!954274))
(check-sat b_and!29803 (not b_next!18343))
