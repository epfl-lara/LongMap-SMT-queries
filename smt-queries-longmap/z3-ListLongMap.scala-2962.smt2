; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41994 () Bool)

(assert start!41994)

(declare-fun b_free!11581 () Bool)

(declare-fun b_next!11581 () Bool)

(assert (=> start!41994 (= b_free!11581 (not b_next!11581))))

(declare-fun tp!40758 () Bool)

(declare-fun b_and!19989 () Bool)

(assert (=> start!41994 (= tp!40758 b_and!19989)))

(declare-fun b!468965 () Bool)

(declare-fun res!280293 () Bool)

(declare-fun e!274556 () Bool)

(assert (=> b!468965 (=> (not res!280293) (not e!274556))))

(declare-datatypes ((array!29776 0))(
  ( (array!29777 (arr!14313 (Array (_ BitVec 32) (_ BitVec 64))) (size!14665 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29776)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29776 (_ BitVec 32)) Bool)

(assert (=> b!468965 (= res!280293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21208 () Bool)

(declare-fun mapRes!21208 () Bool)

(assert (=> mapIsEmpty!21208 mapRes!21208))

(declare-fun b!468966 () Bool)

(declare-fun e!274552 () Bool)

(declare-fun tp_is_empty!13009 () Bool)

(assert (=> b!468966 (= e!274552 tp_is_empty!13009)))

(declare-fun b!468967 () Bool)

(declare-fun e!274551 () Bool)

(assert (=> b!468967 (= e!274551 true)))

(declare-datatypes ((V!18451 0))(
  ( (V!18452 (val!6549 Int)) )
))
(declare-datatypes ((tuple2!8534 0))(
  ( (tuple2!8535 (_1!4278 (_ BitVec 64)) (_2!4278 V!18451)) )
))
(declare-datatypes ((List!8610 0))(
  ( (Nil!8607) (Cons!8606 (h!9462 tuple2!8534) (t!14560 List!8610)) )
))
(declare-datatypes ((ListLongMap!7449 0))(
  ( (ListLongMap!7450 (toList!3740 List!8610)) )
))
(declare-fun lt!212370 () ListLongMap!7449)

(declare-fun lt!212368 () tuple2!8534)

(declare-fun minValueBefore!38 () V!18451)

(declare-fun +!1699 (ListLongMap!7449 tuple2!8534) ListLongMap!7449)

(assert (=> b!468967 (= (+!1699 lt!212370 lt!212368) (+!1699 (+!1699 lt!212370 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212368))))

(declare-fun minValueAfter!38 () V!18451)

(assert (=> b!468967 (= lt!212368 (tuple2!8535 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13689 0))(
  ( (Unit!13690) )
))
(declare-fun lt!212365 () Unit!13689)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!105 (ListLongMap!7449 (_ BitVec 64) V!18451 V!18451) Unit!13689)

(assert (=> b!468967 (= lt!212365 (addSameAsAddTwiceSameKeyDiffValues!105 lt!212370 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212369 () ListLongMap!7449)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6161 0))(
  ( (ValueCellFull!6161 (v!8839 V!18451)) (EmptyCell!6161) )
))
(declare-datatypes ((array!29778 0))(
  ( (array!29779 (arr!14314 (Array (_ BitVec 32) ValueCell!6161)) (size!14666 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29778)

(declare-fun zeroValue!794 () V!18451)

(declare-fun getCurrentListMap!2165 (array!29776 array!29778 (_ BitVec 32) (_ BitVec 32) V!18451 V!18451 (_ BitVec 32) Int) ListLongMap!7449)

(assert (=> b!468967 (= lt!212369 (getCurrentListMap!2165 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212366 () ListLongMap!7449)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468967 (= lt!212366 (getCurrentListMap!2165 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468968 () Bool)

(declare-fun e!274553 () Bool)

(declare-fun e!274554 () Bool)

(assert (=> b!468968 (= e!274553 (and e!274554 mapRes!21208))))

(declare-fun condMapEmpty!21208 () Bool)

(declare-fun mapDefault!21208 () ValueCell!6161)

(assert (=> b!468968 (= condMapEmpty!21208 (= (arr!14314 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6161)) mapDefault!21208)))))

(declare-fun b!468970 () Bool)

(assert (=> b!468970 (= e!274554 tp_is_empty!13009)))

(declare-fun mapNonEmpty!21208 () Bool)

(declare-fun tp!40759 () Bool)

(assert (=> mapNonEmpty!21208 (= mapRes!21208 (and tp!40759 e!274552))))

(declare-fun mapRest!21208 () (Array (_ BitVec 32) ValueCell!6161))

(declare-fun mapKey!21208 () (_ BitVec 32))

(declare-fun mapValue!21208 () ValueCell!6161)

(assert (=> mapNonEmpty!21208 (= (arr!14314 _values!833) (store mapRest!21208 mapKey!21208 mapValue!21208))))

(declare-fun b!468971 () Bool)

(declare-fun res!280297 () Bool)

(assert (=> b!468971 (=> (not res!280297) (not e!274556))))

(declare-datatypes ((List!8611 0))(
  ( (Nil!8608) (Cons!8607 (h!9463 (_ BitVec 64)) (t!14561 List!8611)) )
))
(declare-fun arrayNoDuplicates!0 (array!29776 (_ BitVec 32) List!8611) Bool)

(assert (=> b!468971 (= res!280297 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8608))))

(declare-fun b!468972 () Bool)

(declare-fun res!280296 () Bool)

(assert (=> b!468972 (=> (not res!280296) (not e!274556))))

(assert (=> b!468972 (= res!280296 (and (= (size!14666 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14665 _keys!1025) (size!14666 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468969 () Bool)

(assert (=> b!468969 (= e!274556 (not e!274551))))

(declare-fun res!280294 () Bool)

(assert (=> b!468969 (=> res!280294 e!274551)))

(assert (=> b!468969 (= res!280294 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212367 () ListLongMap!7449)

(assert (=> b!468969 (= lt!212370 lt!212367)))

(declare-fun lt!212371 () Unit!13689)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!119 (array!29776 array!29778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18451 V!18451 V!18451 V!18451 (_ BitVec 32) Int) Unit!13689)

(assert (=> b!468969 (= lt!212371 (lemmaNoChangeToArrayThenSameMapNoExtras!119 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1959 (array!29776 array!29778 (_ BitVec 32) (_ BitVec 32) V!18451 V!18451 (_ BitVec 32) Int) ListLongMap!7449)

(assert (=> b!468969 (= lt!212367 (getCurrentListMapNoExtraKeys!1959 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468969 (= lt!212370 (getCurrentListMapNoExtraKeys!1959 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!280295 () Bool)

(assert (=> start!41994 (=> (not res!280295) (not e!274556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41994 (= res!280295 (validMask!0 mask!1365))))

(assert (=> start!41994 e!274556))

(assert (=> start!41994 tp_is_empty!13009))

(assert (=> start!41994 tp!40758))

(assert (=> start!41994 true))

(declare-fun array_inv!10426 (array!29776) Bool)

(assert (=> start!41994 (array_inv!10426 _keys!1025)))

(declare-fun array_inv!10427 (array!29778) Bool)

(assert (=> start!41994 (and (array_inv!10427 _values!833) e!274553)))

(assert (= (and start!41994 res!280295) b!468972))

(assert (= (and b!468972 res!280296) b!468965))

(assert (= (and b!468965 res!280293) b!468971))

(assert (= (and b!468971 res!280297) b!468969))

(assert (= (and b!468969 (not res!280294)) b!468967))

(assert (= (and b!468968 condMapEmpty!21208) mapIsEmpty!21208))

(assert (= (and b!468968 (not condMapEmpty!21208)) mapNonEmpty!21208))

(get-info :version)

(assert (= (and mapNonEmpty!21208 ((_ is ValueCellFull!6161) mapValue!21208)) b!468966))

(assert (= (and b!468968 ((_ is ValueCellFull!6161) mapDefault!21208)) b!468970))

(assert (= start!41994 b!468968))

(declare-fun m!451293 () Bool)

(assert (=> start!41994 m!451293))

(declare-fun m!451295 () Bool)

(assert (=> start!41994 m!451295))

(declare-fun m!451297 () Bool)

(assert (=> start!41994 m!451297))

(declare-fun m!451299 () Bool)

(assert (=> b!468967 m!451299))

(declare-fun m!451301 () Bool)

(assert (=> b!468967 m!451301))

(declare-fun m!451303 () Bool)

(assert (=> b!468967 m!451303))

(declare-fun m!451305 () Bool)

(assert (=> b!468967 m!451305))

(assert (=> b!468967 m!451301))

(declare-fun m!451307 () Bool)

(assert (=> b!468967 m!451307))

(declare-fun m!451309 () Bool)

(assert (=> b!468967 m!451309))

(declare-fun m!451311 () Bool)

(assert (=> b!468965 m!451311))

(declare-fun m!451313 () Bool)

(assert (=> mapNonEmpty!21208 m!451313))

(declare-fun m!451315 () Bool)

(assert (=> b!468971 m!451315))

(declare-fun m!451317 () Bool)

(assert (=> b!468969 m!451317))

(declare-fun m!451319 () Bool)

(assert (=> b!468969 m!451319))

(declare-fun m!451321 () Bool)

(assert (=> b!468969 m!451321))

(check-sat (not mapNonEmpty!21208) tp_is_empty!13009 (not b!468971) (not b_next!11581) (not b!468967) (not start!41994) (not b!468965) b_and!19989 (not b!468969))
(check-sat b_and!19989 (not b_next!11581))
