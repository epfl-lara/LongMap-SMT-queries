; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41854 () Bool)

(assert start!41854)

(declare-fun b_free!11457 () Bool)

(declare-fun b_next!11457 () Bool)

(assert (=> start!41854 (= b_free!11457 (not b_next!11457))))

(declare-fun tp!40381 () Bool)

(declare-fun b_and!19837 () Bool)

(assert (=> start!41854 (= tp!40381 b_and!19837)))

(declare-fun res!279324 () Bool)

(declare-fun e!273366 () Bool)

(assert (=> start!41854 (=> (not res!279324) (not e!273366))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41854 (= res!279324 (validMask!0 mask!1365))))

(assert (=> start!41854 e!273366))

(declare-fun tp_is_empty!12885 () Bool)

(assert (=> start!41854 tp_is_empty!12885))

(assert (=> start!41854 tp!40381))

(assert (=> start!41854 true))

(declare-datatypes ((array!29549 0))(
  ( (array!29550 (arr!14202 (Array (_ BitVec 32) (_ BitVec 64))) (size!14554 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29549)

(declare-fun array_inv!10252 (array!29549) Bool)

(assert (=> start!41854 (array_inv!10252 _keys!1025)))

(declare-datatypes ((V!18285 0))(
  ( (V!18286 (val!6487 Int)) )
))
(declare-datatypes ((ValueCell!6099 0))(
  ( (ValueCellFull!6099 (v!8776 V!18285)) (EmptyCell!6099) )
))
(declare-datatypes ((array!29551 0))(
  ( (array!29552 (arr!14203 (Array (_ BitVec 32) ValueCell!6099)) (size!14555 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29551)

(declare-fun e!273368 () Bool)

(declare-fun array_inv!10253 (array!29551) Bool)

(assert (=> start!41854 (and (array_inv!10253 _values!833) e!273368)))

(declare-fun b!467345 () Bool)

(declare-fun e!273365 () Bool)

(declare-fun mapRes!21016 () Bool)

(assert (=> b!467345 (= e!273368 (and e!273365 mapRes!21016))))

(declare-fun condMapEmpty!21016 () Bool)

(declare-fun mapDefault!21016 () ValueCell!6099)

(assert (=> b!467345 (= condMapEmpty!21016 (= (arr!14203 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6099)) mapDefault!21016)))))

(declare-fun b!467346 () Bool)

(declare-fun res!279323 () Bool)

(assert (=> b!467346 (=> (not res!279323) (not e!273366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29549 (_ BitVec 32)) Bool)

(assert (=> b!467346 (= res!279323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467347 () Bool)

(assert (=> b!467347 (= e!273365 tp_is_empty!12885)))

(declare-fun b!467348 () Bool)

(declare-fun res!279322 () Bool)

(assert (=> b!467348 (=> (not res!279322) (not e!273366))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467348 (= res!279322 (and (= (size!14555 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14554 _keys!1025) (size!14555 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467349 () Bool)

(declare-fun res!279321 () Bool)

(assert (=> b!467349 (=> (not res!279321) (not e!273366))))

(declare-datatypes ((List!8601 0))(
  ( (Nil!8598) (Cons!8597 (h!9453 (_ BitVec 64)) (t!14555 List!8601)) )
))
(declare-fun arrayNoDuplicates!0 (array!29549 (_ BitVec 32) List!8601) Bool)

(assert (=> b!467349 (= res!279321 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8598))))

(declare-fun b!467350 () Bool)

(declare-fun e!273367 () Bool)

(assert (=> b!467350 (= e!273367 tp_is_empty!12885)))

(declare-fun b!467351 () Bool)

(assert (=> b!467351 (= e!273366 (not true))))

(declare-datatypes ((tuple2!8514 0))(
  ( (tuple2!8515 (_1!4268 (_ BitVec 64)) (_2!4268 V!18285)) )
))
(declare-datatypes ((List!8602 0))(
  ( (Nil!8599) (Cons!8598 (h!9454 tuple2!8514) (t!14556 List!8602)) )
))
(declare-datatypes ((ListLongMap!7427 0))(
  ( (ListLongMap!7428 (toList!3729 List!8602)) )
))
(declare-fun lt!211310 () ListLongMap!7427)

(declare-fun lt!211308 () ListLongMap!7427)

(assert (=> b!467351 (= lt!211310 lt!211308)))

(declare-datatypes ((Unit!13618 0))(
  ( (Unit!13619) )
))
(declare-fun lt!211309 () Unit!13618)

(declare-fun minValueBefore!38 () V!18285)

(declare-fun zeroValue!794 () V!18285)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18285)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!83 (array!29549 array!29551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18285 V!18285 V!18285 V!18285 (_ BitVec 32) Int) Unit!13618)

(assert (=> b!467351 (= lt!211309 (lemmaNoChangeToArrayThenSameMapNoExtras!83 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1903 (array!29549 array!29551 (_ BitVec 32) (_ BitVec 32) V!18285 V!18285 (_ BitVec 32) Int) ListLongMap!7427)

(assert (=> b!467351 (= lt!211308 (getCurrentListMapNoExtraKeys!1903 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467351 (= lt!211310 (getCurrentListMapNoExtraKeys!1903 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21016 () Bool)

(declare-fun tp!40380 () Bool)

(assert (=> mapNonEmpty!21016 (= mapRes!21016 (and tp!40380 e!273367))))

(declare-fun mapRest!21016 () (Array (_ BitVec 32) ValueCell!6099))

(declare-fun mapKey!21016 () (_ BitVec 32))

(declare-fun mapValue!21016 () ValueCell!6099)

(assert (=> mapNonEmpty!21016 (= (arr!14203 _values!833) (store mapRest!21016 mapKey!21016 mapValue!21016))))

(declare-fun mapIsEmpty!21016 () Bool)

(assert (=> mapIsEmpty!21016 mapRes!21016))

(assert (= (and start!41854 res!279324) b!467348))

(assert (= (and b!467348 res!279322) b!467346))

(assert (= (and b!467346 res!279323) b!467349))

(assert (= (and b!467349 res!279321) b!467351))

(assert (= (and b!467345 condMapEmpty!21016) mapIsEmpty!21016))

(assert (= (and b!467345 (not condMapEmpty!21016)) mapNonEmpty!21016))

(get-info :version)

(assert (= (and mapNonEmpty!21016 ((_ is ValueCellFull!6099) mapValue!21016)) b!467350))

(assert (= (and b!467345 ((_ is ValueCellFull!6099) mapDefault!21016)) b!467347))

(assert (= start!41854 b!467345))

(declare-fun m!449511 () Bool)

(assert (=> start!41854 m!449511))

(declare-fun m!449513 () Bool)

(assert (=> start!41854 m!449513))

(declare-fun m!449515 () Bool)

(assert (=> start!41854 m!449515))

(declare-fun m!449517 () Bool)

(assert (=> mapNonEmpty!21016 m!449517))

(declare-fun m!449519 () Bool)

(assert (=> b!467349 m!449519))

(declare-fun m!449521 () Bool)

(assert (=> b!467346 m!449521))

(declare-fun m!449523 () Bool)

(assert (=> b!467351 m!449523))

(declare-fun m!449525 () Bool)

(assert (=> b!467351 m!449525))

(declare-fun m!449527 () Bool)

(assert (=> b!467351 m!449527))

(check-sat b_and!19837 tp_is_empty!12885 (not start!41854) (not mapNonEmpty!21016) (not b!467349) (not b!467346) (not b!467351) (not b_next!11457))
(check-sat b_and!19837 (not b_next!11457))
