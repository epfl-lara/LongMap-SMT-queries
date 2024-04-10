; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41860 () Bool)

(assert start!41860)

(declare-fun b_free!11463 () Bool)

(declare-fun b_next!11463 () Bool)

(assert (=> start!41860 (= b_free!11463 (not b_next!11463))))

(declare-fun tp!40398 () Bool)

(declare-fun b_and!19843 () Bool)

(assert (=> start!41860 (= tp!40398 b_and!19843)))

(declare-fun mapNonEmpty!21025 () Bool)

(declare-fun mapRes!21025 () Bool)

(declare-fun tp!40399 () Bool)

(declare-fun e!273411 () Bool)

(assert (=> mapNonEmpty!21025 (= mapRes!21025 (and tp!40399 e!273411))))

(declare-datatypes ((V!18293 0))(
  ( (V!18294 (val!6490 Int)) )
))
(declare-datatypes ((ValueCell!6102 0))(
  ( (ValueCellFull!6102 (v!8779 V!18293)) (EmptyCell!6102) )
))
(declare-datatypes ((array!29559 0))(
  ( (array!29560 (arr!14207 (Array (_ BitVec 32) ValueCell!6102)) (size!14559 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29559)

(declare-fun mapKey!21025 () (_ BitVec 32))

(declare-fun mapRest!21025 () (Array (_ BitVec 32) ValueCell!6102))

(declare-fun mapValue!21025 () ValueCell!6102)

(assert (=> mapNonEmpty!21025 (= (arr!14207 _values!833) (store mapRest!21025 mapKey!21025 mapValue!21025))))

(declare-fun res!279360 () Bool)

(declare-fun e!273412 () Bool)

(assert (=> start!41860 (=> (not res!279360) (not e!273412))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41860 (= res!279360 (validMask!0 mask!1365))))

(assert (=> start!41860 e!273412))

(declare-fun tp_is_empty!12891 () Bool)

(assert (=> start!41860 tp_is_empty!12891))

(assert (=> start!41860 tp!40398))

(assert (=> start!41860 true))

(declare-datatypes ((array!29561 0))(
  ( (array!29562 (arr!14208 (Array (_ BitVec 32) (_ BitVec 64))) (size!14560 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29561)

(declare-fun array_inv!10256 (array!29561) Bool)

(assert (=> start!41860 (array_inv!10256 _keys!1025)))

(declare-fun e!273414 () Bool)

(declare-fun array_inv!10257 (array!29559) Bool)

(assert (=> start!41860 (and (array_inv!10257 _values!833) e!273414)))

(declare-fun mapIsEmpty!21025 () Bool)

(assert (=> mapIsEmpty!21025 mapRes!21025))

(declare-fun b!467408 () Bool)

(declare-fun res!279358 () Bool)

(assert (=> b!467408 (=> (not res!279358) (not e!273412))))

(declare-datatypes ((List!8603 0))(
  ( (Nil!8600) (Cons!8599 (h!9455 (_ BitVec 64)) (t!14557 List!8603)) )
))
(declare-fun arrayNoDuplicates!0 (array!29561 (_ BitVec 32) List!8603) Bool)

(assert (=> b!467408 (= res!279358 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8600))))

(declare-fun b!467409 () Bool)

(declare-fun res!279359 () Bool)

(assert (=> b!467409 (=> (not res!279359) (not e!273412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29561 (_ BitVec 32)) Bool)

(assert (=> b!467409 (= res!279359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467410 () Bool)

(declare-fun res!279357 () Bool)

(assert (=> b!467410 (=> (not res!279357) (not e!273412))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467410 (= res!279357 (and (= (size!14559 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14560 _keys!1025) (size!14559 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467411 () Bool)

(declare-fun e!273410 () Bool)

(assert (=> b!467411 (= e!273410 tp_is_empty!12891)))

(declare-fun b!467412 () Bool)

(assert (=> b!467412 (= e!273414 (and e!273410 mapRes!21025))))

(declare-fun condMapEmpty!21025 () Bool)

(declare-fun mapDefault!21025 () ValueCell!6102)

(assert (=> b!467412 (= condMapEmpty!21025 (= (arr!14207 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6102)) mapDefault!21025)))))

(declare-fun b!467413 () Bool)

(assert (=> b!467413 (= e!273411 tp_is_empty!12891)))

(declare-fun b!467414 () Bool)

(assert (=> b!467414 (= e!273412 (not true))))

(declare-datatypes ((tuple2!8516 0))(
  ( (tuple2!8517 (_1!4269 (_ BitVec 64)) (_2!4269 V!18293)) )
))
(declare-datatypes ((List!8604 0))(
  ( (Nil!8601) (Cons!8600 (h!9456 tuple2!8516) (t!14558 List!8604)) )
))
(declare-datatypes ((ListLongMap!7429 0))(
  ( (ListLongMap!7430 (toList!3730 List!8604)) )
))
(declare-fun lt!211337 () ListLongMap!7429)

(declare-fun lt!211335 () ListLongMap!7429)

(assert (=> b!467414 (= lt!211337 lt!211335)))

(declare-fun minValueBefore!38 () V!18293)

(declare-fun zeroValue!794 () V!18293)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13620 0))(
  ( (Unit!13621) )
))
(declare-fun lt!211336 () Unit!13620)

(declare-fun minValueAfter!38 () V!18293)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!84 (array!29561 array!29559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18293 V!18293 V!18293 V!18293 (_ BitVec 32) Int) Unit!13620)

(assert (=> b!467414 (= lt!211336 (lemmaNoChangeToArrayThenSameMapNoExtras!84 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1904 (array!29561 array!29559 (_ BitVec 32) (_ BitVec 32) V!18293 V!18293 (_ BitVec 32) Int) ListLongMap!7429)

(assert (=> b!467414 (= lt!211335 (getCurrentListMapNoExtraKeys!1904 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467414 (= lt!211337 (getCurrentListMapNoExtraKeys!1904 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41860 res!279360) b!467410))

(assert (= (and b!467410 res!279357) b!467409))

(assert (= (and b!467409 res!279359) b!467408))

(assert (= (and b!467408 res!279358) b!467414))

(assert (= (and b!467412 condMapEmpty!21025) mapIsEmpty!21025))

(assert (= (and b!467412 (not condMapEmpty!21025)) mapNonEmpty!21025))

(get-info :version)

(assert (= (and mapNonEmpty!21025 ((_ is ValueCellFull!6102) mapValue!21025)) b!467413))

(assert (= (and b!467412 ((_ is ValueCellFull!6102) mapDefault!21025)) b!467411))

(assert (= start!41860 b!467412))

(declare-fun m!449565 () Bool)

(assert (=> b!467408 m!449565))

(declare-fun m!449567 () Bool)

(assert (=> mapNonEmpty!21025 m!449567))

(declare-fun m!449569 () Bool)

(assert (=> b!467409 m!449569))

(declare-fun m!449571 () Bool)

(assert (=> start!41860 m!449571))

(declare-fun m!449573 () Bool)

(assert (=> start!41860 m!449573))

(declare-fun m!449575 () Bool)

(assert (=> start!41860 m!449575))

(declare-fun m!449577 () Bool)

(assert (=> b!467414 m!449577))

(declare-fun m!449579 () Bool)

(assert (=> b!467414 m!449579))

(declare-fun m!449581 () Bool)

(assert (=> b!467414 m!449581))

(check-sat (not b!467408) (not b!467409) (not start!41860) b_and!19843 (not b!467414) tp_is_empty!12891 (not b_next!11463) (not mapNonEmpty!21025))
(check-sat b_and!19843 (not b_next!11463))
