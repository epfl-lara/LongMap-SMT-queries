; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41848 () Bool)

(assert start!41848)

(declare-fun b_free!11451 () Bool)

(declare-fun b_next!11451 () Bool)

(assert (=> start!41848 (= b_free!11451 (not b_next!11451))))

(declare-fun tp!40363 () Bool)

(declare-fun b_and!19831 () Bool)

(assert (=> start!41848 (= tp!40363 b_and!19831)))

(declare-fun res!279287 () Bool)

(declare-fun e!273324 () Bool)

(assert (=> start!41848 (=> (not res!279287) (not e!273324))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41848 (= res!279287 (validMask!0 mask!1365))))

(assert (=> start!41848 e!273324))

(declare-fun tp_is_empty!12879 () Bool)

(assert (=> start!41848 tp_is_empty!12879))

(assert (=> start!41848 tp!40363))

(assert (=> start!41848 true))

(declare-datatypes ((array!29539 0))(
  ( (array!29540 (arr!14197 (Array (_ BitVec 32) (_ BitVec 64))) (size!14549 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29539)

(declare-fun array_inv!10248 (array!29539) Bool)

(assert (=> start!41848 (array_inv!10248 _keys!1025)))

(declare-datatypes ((V!18277 0))(
  ( (V!18278 (val!6484 Int)) )
))
(declare-datatypes ((ValueCell!6096 0))(
  ( (ValueCellFull!6096 (v!8773 V!18277)) (EmptyCell!6096) )
))
(declare-datatypes ((array!29541 0))(
  ( (array!29542 (arr!14198 (Array (_ BitVec 32) ValueCell!6096)) (size!14550 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29541)

(declare-fun e!273321 () Bool)

(declare-fun array_inv!10249 (array!29541) Bool)

(assert (=> start!41848 (and (array_inv!10249 _values!833) e!273321)))

(declare-fun mapIsEmpty!21007 () Bool)

(declare-fun mapRes!21007 () Bool)

(assert (=> mapIsEmpty!21007 mapRes!21007))

(declare-fun b!467282 () Bool)

(declare-fun res!279286 () Bool)

(assert (=> b!467282 (=> (not res!279286) (not e!273324))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467282 (= res!279286 (and (= (size!14550 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14549 _keys!1025) (size!14550 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467283 () Bool)

(declare-fun e!273320 () Bool)

(assert (=> b!467283 (= e!273321 (and e!273320 mapRes!21007))))

(declare-fun condMapEmpty!21007 () Bool)

(declare-fun mapDefault!21007 () ValueCell!6096)

(assert (=> b!467283 (= condMapEmpty!21007 (= (arr!14198 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6096)) mapDefault!21007)))))

(declare-fun b!467284 () Bool)

(declare-fun res!279288 () Bool)

(assert (=> b!467284 (=> (not res!279288) (not e!273324))))

(declare-datatypes ((List!8599 0))(
  ( (Nil!8596) (Cons!8595 (h!9451 (_ BitVec 64)) (t!14553 List!8599)) )
))
(declare-fun arrayNoDuplicates!0 (array!29539 (_ BitVec 32) List!8599) Bool)

(assert (=> b!467284 (= res!279288 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8596))))

(declare-fun b!467285 () Bool)

(declare-fun e!273322 () Bool)

(assert (=> b!467285 (= e!273322 tp_is_empty!12879)))

(declare-fun b!467286 () Bool)

(declare-fun res!279285 () Bool)

(assert (=> b!467286 (=> (not res!279285) (not e!273324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29539 (_ BitVec 32)) Bool)

(assert (=> b!467286 (= res!279285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467287 () Bool)

(assert (=> b!467287 (= e!273324 (not true))))

(declare-datatypes ((tuple2!8512 0))(
  ( (tuple2!8513 (_1!4267 (_ BitVec 64)) (_2!4267 V!18277)) )
))
(declare-datatypes ((List!8600 0))(
  ( (Nil!8597) (Cons!8596 (h!9452 tuple2!8512) (t!14554 List!8600)) )
))
(declare-datatypes ((ListLongMap!7425 0))(
  ( (ListLongMap!7426 (toList!3728 List!8600)) )
))
(declare-fun lt!211283 () ListLongMap!7425)

(declare-fun lt!211281 () ListLongMap!7425)

(assert (=> b!467287 (= lt!211283 lt!211281)))

(declare-fun minValueBefore!38 () V!18277)

(declare-fun zeroValue!794 () V!18277)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13616 0))(
  ( (Unit!13617) )
))
(declare-fun lt!211282 () Unit!13616)

(declare-fun minValueAfter!38 () V!18277)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!82 (array!29539 array!29541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18277 V!18277 V!18277 V!18277 (_ BitVec 32) Int) Unit!13616)

(assert (=> b!467287 (= lt!211282 (lemmaNoChangeToArrayThenSameMapNoExtras!82 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1902 (array!29539 array!29541 (_ BitVec 32) (_ BitVec 32) V!18277 V!18277 (_ BitVec 32) Int) ListLongMap!7425)

(assert (=> b!467287 (= lt!211281 (getCurrentListMapNoExtraKeys!1902 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467287 (= lt!211283 (getCurrentListMapNoExtraKeys!1902 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21007 () Bool)

(declare-fun tp!40362 () Bool)

(assert (=> mapNonEmpty!21007 (= mapRes!21007 (and tp!40362 e!273322))))

(declare-fun mapRest!21007 () (Array (_ BitVec 32) ValueCell!6096))

(declare-fun mapValue!21007 () ValueCell!6096)

(declare-fun mapKey!21007 () (_ BitVec 32))

(assert (=> mapNonEmpty!21007 (= (arr!14198 _values!833) (store mapRest!21007 mapKey!21007 mapValue!21007))))

(declare-fun b!467288 () Bool)

(assert (=> b!467288 (= e!273320 tp_is_empty!12879)))

(assert (= (and start!41848 res!279287) b!467282))

(assert (= (and b!467282 res!279286) b!467286))

(assert (= (and b!467286 res!279285) b!467284))

(assert (= (and b!467284 res!279288) b!467287))

(assert (= (and b!467283 condMapEmpty!21007) mapIsEmpty!21007))

(assert (= (and b!467283 (not condMapEmpty!21007)) mapNonEmpty!21007))

(get-info :version)

(assert (= (and mapNonEmpty!21007 ((_ is ValueCellFull!6096) mapValue!21007)) b!467285))

(assert (= (and b!467283 ((_ is ValueCellFull!6096) mapDefault!21007)) b!467288))

(assert (= start!41848 b!467283))

(declare-fun m!449457 () Bool)

(assert (=> start!41848 m!449457))

(declare-fun m!449459 () Bool)

(assert (=> start!41848 m!449459))

(declare-fun m!449461 () Bool)

(assert (=> start!41848 m!449461))

(declare-fun m!449463 () Bool)

(assert (=> b!467284 m!449463))

(declare-fun m!449465 () Bool)

(assert (=> b!467287 m!449465))

(declare-fun m!449467 () Bool)

(assert (=> b!467287 m!449467))

(declare-fun m!449469 () Bool)

(assert (=> b!467287 m!449469))

(declare-fun m!449471 () Bool)

(assert (=> b!467286 m!449471))

(declare-fun m!449473 () Bool)

(assert (=> mapNonEmpty!21007 m!449473))

(check-sat (not start!41848) (not b!467284) (not mapNonEmpty!21007) b_and!19831 (not b_next!11451) tp_is_empty!12879 (not b!467286) (not b!467287))
(check-sat b_and!19831 (not b_next!11451))
