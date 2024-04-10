; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41842 () Bool)

(assert start!41842)

(declare-fun b_free!11445 () Bool)

(declare-fun b_next!11445 () Bool)

(assert (=> start!41842 (= b_free!11445 (not b_next!11445))))

(declare-fun tp!40345 () Bool)

(declare-fun b_and!19825 () Bool)

(assert (=> start!41842 (= tp!40345 b_and!19825)))

(declare-fun res!279250 () Bool)

(declare-fun e!273276 () Bool)

(assert (=> start!41842 (=> (not res!279250) (not e!273276))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41842 (= res!279250 (validMask!0 mask!1365))))

(assert (=> start!41842 e!273276))

(declare-fun tp_is_empty!12873 () Bool)

(assert (=> start!41842 tp_is_empty!12873))

(assert (=> start!41842 tp!40345))

(assert (=> start!41842 true))

(declare-datatypes ((array!29527 0))(
  ( (array!29528 (arr!14191 (Array (_ BitVec 32) (_ BitVec 64))) (size!14543 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29527)

(declare-fun array_inv!10246 (array!29527) Bool)

(assert (=> start!41842 (array_inv!10246 _keys!1025)))

(declare-datatypes ((V!18269 0))(
  ( (V!18270 (val!6481 Int)) )
))
(declare-datatypes ((ValueCell!6093 0))(
  ( (ValueCellFull!6093 (v!8770 V!18269)) (EmptyCell!6093) )
))
(declare-datatypes ((array!29529 0))(
  ( (array!29530 (arr!14192 (Array (_ BitVec 32) ValueCell!6093)) (size!14544 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29529)

(declare-fun e!273275 () Bool)

(declare-fun array_inv!10247 (array!29529) Bool)

(assert (=> start!41842 (and (array_inv!10247 _values!833) e!273275)))

(declare-fun b!467219 () Bool)

(assert (=> b!467219 (= e!273276 (not true))))

(declare-datatypes ((tuple2!8506 0))(
  ( (tuple2!8507 (_1!4264 (_ BitVec 64)) (_2!4264 V!18269)) )
))
(declare-datatypes ((List!8594 0))(
  ( (Nil!8591) (Cons!8590 (h!9446 tuple2!8506) (t!14548 List!8594)) )
))
(declare-datatypes ((ListLongMap!7419 0))(
  ( (ListLongMap!7420 (toList!3725 List!8594)) )
))
(declare-fun lt!211256 () ListLongMap!7419)

(declare-fun lt!211254 () ListLongMap!7419)

(assert (=> b!467219 (= lt!211256 lt!211254)))

(declare-datatypes ((Unit!13610 0))(
  ( (Unit!13611) )
))
(declare-fun lt!211255 () Unit!13610)

(declare-fun minValueBefore!38 () V!18269)

(declare-fun zeroValue!794 () V!18269)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18269)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!79 (array!29527 array!29529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18269 V!18269 V!18269 V!18269 (_ BitVec 32) Int) Unit!13610)

(assert (=> b!467219 (= lt!211255 (lemmaNoChangeToArrayThenSameMapNoExtras!79 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1899 (array!29527 array!29529 (_ BitVec 32) (_ BitVec 32) V!18269 V!18269 (_ BitVec 32) Int) ListLongMap!7419)

(assert (=> b!467219 (= lt!211254 (getCurrentListMapNoExtraKeys!1899 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467219 (= lt!211256 (getCurrentListMapNoExtraKeys!1899 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467220 () Bool)

(declare-fun res!279249 () Bool)

(assert (=> b!467220 (=> (not res!279249) (not e!273276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29527 (_ BitVec 32)) Bool)

(assert (=> b!467220 (= res!279249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467221 () Bool)

(declare-fun e!273278 () Bool)

(assert (=> b!467221 (= e!273278 tp_is_empty!12873)))

(declare-fun b!467222 () Bool)

(declare-fun res!279251 () Bool)

(assert (=> b!467222 (=> (not res!279251) (not e!273276))))

(declare-datatypes ((List!8595 0))(
  ( (Nil!8592) (Cons!8591 (h!9447 (_ BitVec 64)) (t!14549 List!8595)) )
))
(declare-fun arrayNoDuplicates!0 (array!29527 (_ BitVec 32) List!8595) Bool)

(assert (=> b!467222 (= res!279251 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8592))))

(declare-fun b!467223 () Bool)

(declare-fun res!279252 () Bool)

(assert (=> b!467223 (=> (not res!279252) (not e!273276))))

(assert (=> b!467223 (= res!279252 (and (= (size!14544 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14543 _keys!1025) (size!14544 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20998 () Bool)

(declare-fun mapRes!20998 () Bool)

(assert (=> mapIsEmpty!20998 mapRes!20998))

(declare-fun b!467224 () Bool)

(declare-fun e!273277 () Bool)

(assert (=> b!467224 (= e!273277 tp_is_empty!12873)))

(declare-fun mapNonEmpty!20998 () Bool)

(declare-fun tp!40344 () Bool)

(assert (=> mapNonEmpty!20998 (= mapRes!20998 (and tp!40344 e!273278))))

(declare-fun mapValue!20998 () ValueCell!6093)

(declare-fun mapRest!20998 () (Array (_ BitVec 32) ValueCell!6093))

(declare-fun mapKey!20998 () (_ BitVec 32))

(assert (=> mapNonEmpty!20998 (= (arr!14192 _values!833) (store mapRest!20998 mapKey!20998 mapValue!20998))))

(declare-fun b!467225 () Bool)

(assert (=> b!467225 (= e!273275 (and e!273277 mapRes!20998))))

(declare-fun condMapEmpty!20998 () Bool)

(declare-fun mapDefault!20998 () ValueCell!6093)

(assert (=> b!467225 (= condMapEmpty!20998 (= (arr!14192 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6093)) mapDefault!20998)))))

(assert (= (and start!41842 res!279250) b!467223))

(assert (= (and b!467223 res!279252) b!467220))

(assert (= (and b!467220 res!279249) b!467222))

(assert (= (and b!467222 res!279251) b!467219))

(assert (= (and b!467225 condMapEmpty!20998) mapIsEmpty!20998))

(assert (= (and b!467225 (not condMapEmpty!20998)) mapNonEmpty!20998))

(get-info :version)

(assert (= (and mapNonEmpty!20998 ((_ is ValueCellFull!6093) mapValue!20998)) b!467221))

(assert (= (and b!467225 ((_ is ValueCellFull!6093) mapDefault!20998)) b!467224))

(assert (= start!41842 b!467225))

(declare-fun m!449403 () Bool)

(assert (=> b!467219 m!449403))

(declare-fun m!449405 () Bool)

(assert (=> b!467219 m!449405))

(declare-fun m!449407 () Bool)

(assert (=> b!467219 m!449407))

(declare-fun m!449409 () Bool)

(assert (=> mapNonEmpty!20998 m!449409))

(declare-fun m!449411 () Bool)

(assert (=> start!41842 m!449411))

(declare-fun m!449413 () Bool)

(assert (=> start!41842 m!449413))

(declare-fun m!449415 () Bool)

(assert (=> start!41842 m!449415))

(declare-fun m!449417 () Bool)

(assert (=> b!467222 m!449417))

(declare-fun m!449419 () Bool)

(assert (=> b!467220 m!449419))

(check-sat (not b!467222) b_and!19825 (not b!467219) (not b!467220) (not b_next!11445) (not start!41842) tp_is_empty!12873 (not mapNonEmpty!20998))
(check-sat b_and!19825 (not b_next!11445))
