; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41758 () Bool)

(assert start!41758)

(declare-fun b_free!11379 () Bool)

(declare-fun b_next!11379 () Bool)

(assert (=> start!41758 (= b_free!11379 (not b_next!11379))))

(declare-fun tp!40143 () Bool)

(declare-fun b_and!19747 () Bool)

(assert (=> start!41758 (= tp!40143 b_and!19747)))

(declare-fun b!466266 () Bool)

(declare-fun e!272595 () Bool)

(declare-fun tp_is_empty!12807 () Bool)

(assert (=> b!466266 (= e!272595 tp_is_empty!12807)))

(declare-fun b!466267 () Bool)

(declare-fun e!272594 () Bool)

(declare-fun e!272599 () Bool)

(declare-fun mapRes!20896 () Bool)

(assert (=> b!466267 (= e!272594 (and e!272599 mapRes!20896))))

(declare-fun condMapEmpty!20896 () Bool)

(declare-datatypes ((V!18181 0))(
  ( (V!18182 (val!6448 Int)) )
))
(declare-datatypes ((ValueCell!6060 0))(
  ( (ValueCellFull!6060 (v!8736 V!18181)) (EmptyCell!6060) )
))
(declare-datatypes ((array!29397 0))(
  ( (array!29398 (arr!14127 (Array (_ BitVec 32) ValueCell!6060)) (size!14479 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29397)

(declare-fun mapDefault!20896 () ValueCell!6060)

(assert (=> b!466267 (= condMapEmpty!20896 (= (arr!14127 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6060)) mapDefault!20896)))))

(declare-fun b!466268 () Bool)

(declare-fun e!272597 () Bool)

(assert (=> b!466268 (= e!272597 true)))

(declare-fun zeroValue!794 () V!18181)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((tuple2!8452 0))(
  ( (tuple2!8453 (_1!4237 (_ BitVec 64)) (_2!4237 V!18181)) )
))
(declare-datatypes ((List!8543 0))(
  ( (Nil!8540) (Cons!8539 (h!9395 tuple2!8452) (t!14495 List!8543)) )
))
(declare-datatypes ((ListLongMap!7365 0))(
  ( (ListLongMap!7366 (toList!3698 List!8543)) )
))
(declare-fun lt!210686 () ListLongMap!7365)

(declare-datatypes ((array!29399 0))(
  ( (array!29400 (arr!14128 (Array (_ BitVec 32) (_ BitVec 64))) (size!14480 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29399)

(declare-fun minValueAfter!38 () V!18181)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2149 (array!29399 array!29397 (_ BitVec 32) (_ BitVec 32) V!18181 V!18181 (_ BitVec 32) Int) ListLongMap!7365)

(assert (=> b!466268 (= lt!210686 (getCurrentListMap!2149 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18181)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210685 () ListLongMap!7365)

(declare-fun +!1655 (ListLongMap!7365 tuple2!8452) ListLongMap!7365)

(assert (=> b!466268 (= lt!210685 (+!1655 (getCurrentListMap!2149 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8453 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466269 () Bool)

(assert (=> b!466269 (= e!272599 tp_is_empty!12807)))

(declare-fun mapIsEmpty!20896 () Bool)

(assert (=> mapIsEmpty!20896 mapRes!20896))

(declare-fun mapNonEmpty!20896 () Bool)

(declare-fun tp!40144 () Bool)

(assert (=> mapNonEmpty!20896 (= mapRes!20896 (and tp!40144 e!272595))))

(declare-fun mapRest!20896 () (Array (_ BitVec 32) ValueCell!6060))

(declare-fun mapKey!20896 () (_ BitVec 32))

(declare-fun mapValue!20896 () ValueCell!6060)

(assert (=> mapNonEmpty!20896 (= (arr!14127 _values!833) (store mapRest!20896 mapKey!20896 mapValue!20896))))

(declare-fun b!466270 () Bool)

(declare-fun res!278697 () Bool)

(declare-fun e!272596 () Bool)

(assert (=> b!466270 (=> (not res!278697) (not e!272596))))

(declare-datatypes ((List!8544 0))(
  ( (Nil!8541) (Cons!8540 (h!9396 (_ BitVec 64)) (t!14496 List!8544)) )
))
(declare-fun arrayNoDuplicates!0 (array!29399 (_ BitVec 32) List!8544) Bool)

(assert (=> b!466270 (= res!278697 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8541))))

(declare-fun b!466271 () Bool)

(declare-fun res!278696 () Bool)

(assert (=> b!466271 (=> (not res!278696) (not e!272596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29399 (_ BitVec 32)) Bool)

(assert (=> b!466271 (= res!278696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466272 () Bool)

(assert (=> b!466272 (= e!272596 (not e!272597))))

(declare-fun res!278698 () Bool)

(assert (=> b!466272 (=> res!278698 e!272597)))

(assert (=> b!466272 (= res!278698 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210683 () ListLongMap!7365)

(declare-fun lt!210684 () ListLongMap!7365)

(assert (=> b!466272 (= lt!210683 lt!210684)))

(declare-datatypes ((Unit!13562 0))(
  ( (Unit!13563) )
))
(declare-fun lt!210687 () Unit!13562)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!56 (array!29399 array!29397 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18181 V!18181 V!18181 V!18181 (_ BitVec 32) Int) Unit!13562)

(assert (=> b!466272 (= lt!210687 (lemmaNoChangeToArrayThenSameMapNoExtras!56 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1876 (array!29399 array!29397 (_ BitVec 32) (_ BitVec 32) V!18181 V!18181 (_ BitVec 32) Int) ListLongMap!7365)

(assert (=> b!466272 (= lt!210684 (getCurrentListMapNoExtraKeys!1876 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466272 (= lt!210683 (getCurrentListMapNoExtraKeys!1876 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!278695 () Bool)

(assert (=> start!41758 (=> (not res!278695) (not e!272596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41758 (= res!278695 (validMask!0 mask!1365))))

(assert (=> start!41758 e!272596))

(assert (=> start!41758 tp_is_empty!12807))

(assert (=> start!41758 tp!40143))

(assert (=> start!41758 true))

(declare-fun array_inv!10202 (array!29399) Bool)

(assert (=> start!41758 (array_inv!10202 _keys!1025)))

(declare-fun array_inv!10203 (array!29397) Bool)

(assert (=> start!41758 (and (array_inv!10203 _values!833) e!272594)))

(declare-fun b!466273 () Bool)

(declare-fun res!278699 () Bool)

(assert (=> b!466273 (=> (not res!278699) (not e!272596))))

(assert (=> b!466273 (= res!278699 (and (= (size!14479 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14480 _keys!1025) (size!14479 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41758 res!278695) b!466273))

(assert (= (and b!466273 res!278699) b!466271))

(assert (= (and b!466271 res!278696) b!466270))

(assert (= (and b!466270 res!278697) b!466272))

(assert (= (and b!466272 (not res!278698)) b!466268))

(assert (= (and b!466267 condMapEmpty!20896) mapIsEmpty!20896))

(assert (= (and b!466267 (not condMapEmpty!20896)) mapNonEmpty!20896))

(get-info :version)

(assert (= (and mapNonEmpty!20896 ((_ is ValueCellFull!6060) mapValue!20896)) b!466266))

(assert (= (and b!466267 ((_ is ValueCellFull!6060) mapDefault!20896)) b!466269))

(assert (= start!41758 b!466267))

(declare-fun m!448483 () Bool)

(assert (=> b!466268 m!448483))

(declare-fun m!448485 () Bool)

(assert (=> b!466268 m!448485))

(assert (=> b!466268 m!448485))

(declare-fun m!448487 () Bool)

(assert (=> b!466268 m!448487))

(declare-fun m!448489 () Bool)

(assert (=> b!466270 m!448489))

(declare-fun m!448491 () Bool)

(assert (=> b!466272 m!448491))

(declare-fun m!448493 () Bool)

(assert (=> b!466272 m!448493))

(declare-fun m!448495 () Bool)

(assert (=> b!466272 m!448495))

(declare-fun m!448497 () Bool)

(assert (=> start!41758 m!448497))

(declare-fun m!448499 () Bool)

(assert (=> start!41758 m!448499))

(declare-fun m!448501 () Bool)

(assert (=> start!41758 m!448501))

(declare-fun m!448503 () Bool)

(assert (=> mapNonEmpty!20896 m!448503))

(declare-fun m!448505 () Bool)

(assert (=> b!466271 m!448505))

(check-sat (not b!466268) (not start!41758) (not b_next!11379) tp_is_empty!12807 (not b!466270) (not b!466271) (not mapNonEmpty!20896) b_and!19747 (not b!466272))
(check-sat b_and!19747 (not b_next!11379))
