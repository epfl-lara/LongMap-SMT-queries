; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42044 () Bool)

(assert start!42044)

(declare-fun b_free!11611 () Bool)

(declare-fun b_next!11611 () Bool)

(assert (=> start!42044 (= b_free!11611 (not b_next!11611))))

(declare-fun tp!40851 () Bool)

(declare-fun b_and!19995 () Bool)

(assert (=> start!42044 (= tp!40851 b_and!19995)))

(declare-fun b!469295 () Bool)

(declare-fun res!280473 () Bool)

(declare-fun e!274800 () Bool)

(assert (=> b!469295 (=> (not res!280473) (not e!274800))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29835 0))(
  ( (array!29836 (arr!14342 (Array (_ BitVec 32) (_ BitVec 64))) (size!14695 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29835)

(declare-datatypes ((V!18491 0))(
  ( (V!18492 (val!6564 Int)) )
))
(declare-datatypes ((ValueCell!6176 0))(
  ( (ValueCellFull!6176 (v!8848 V!18491)) (EmptyCell!6176) )
))
(declare-datatypes ((array!29837 0))(
  ( (array!29838 (arr!14343 (Array (_ BitVec 32) ValueCell!6176)) (size!14696 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29837)

(assert (=> b!469295 (= res!280473 (and (= (size!14696 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14695 _keys!1025) (size!14696 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21256 () Bool)

(declare-fun mapRes!21256 () Bool)

(declare-fun tp!40852 () Bool)

(declare-fun e!274799 () Bool)

(assert (=> mapNonEmpty!21256 (= mapRes!21256 (and tp!40852 e!274799))))

(declare-fun mapValue!21256 () ValueCell!6176)

(declare-fun mapKey!21256 () (_ BitVec 32))

(declare-fun mapRest!21256 () (Array (_ BitVec 32) ValueCell!6176))

(assert (=> mapNonEmpty!21256 (= (arr!14343 _values!833) (store mapRest!21256 mapKey!21256 mapValue!21256))))

(declare-fun b!469296 () Bool)

(declare-fun res!280475 () Bool)

(assert (=> b!469296 (=> (not res!280475) (not e!274800))))

(declare-datatypes ((List!8750 0))(
  ( (Nil!8747) (Cons!8746 (h!9602 (_ BitVec 64)) (t!14701 List!8750)) )
))
(declare-fun arrayNoDuplicates!0 (array!29835 (_ BitVec 32) List!8750) Bool)

(assert (=> b!469296 (= res!280475 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8747))))

(declare-fun b!469297 () Bool)

(declare-fun e!274802 () Bool)

(declare-fun e!274803 () Bool)

(assert (=> b!469297 (= e!274802 (and e!274803 mapRes!21256))))

(declare-fun condMapEmpty!21256 () Bool)

(declare-fun mapDefault!21256 () ValueCell!6176)

(assert (=> b!469297 (= condMapEmpty!21256 (= (arr!14343 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6176)) mapDefault!21256)))))

(declare-fun b!469298 () Bool)

(declare-fun e!274801 () Bool)

(assert (=> b!469298 (= e!274800 (not e!274801))))

(declare-fun res!280477 () Bool)

(assert (=> b!469298 (=> res!280477 e!274801)))

(assert (=> b!469298 (= res!280477 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8678 0))(
  ( (tuple2!8679 (_1!4350 (_ BitVec 64)) (_2!4350 V!18491)) )
))
(declare-datatypes ((List!8751 0))(
  ( (Nil!8748) (Cons!8747 (h!9603 tuple2!8678) (t!14702 List!8751)) )
))
(declare-datatypes ((ListLongMap!7581 0))(
  ( (ListLongMap!7582 (toList!3806 List!8751)) )
))
(declare-fun lt!212590 () ListLongMap!7581)

(declare-fun lt!212591 () ListLongMap!7581)

(assert (=> b!469298 (= lt!212590 lt!212591)))

(declare-fun minValueBefore!38 () V!18491)

(declare-fun zeroValue!794 () V!18491)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13711 0))(
  ( (Unit!13712) )
))
(declare-fun lt!212587 () Unit!13711)

(declare-fun minValueAfter!38 () V!18491)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!139 (array!29835 array!29837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18491 V!18491 V!18491 V!18491 (_ BitVec 32) Int) Unit!13711)

(assert (=> b!469298 (= lt!212587 (lemmaNoChangeToArrayThenSameMapNoExtras!139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1982 (array!29835 array!29837 (_ BitVec 32) (_ BitVec 32) V!18491 V!18491 (_ BitVec 32) Int) ListLongMap!7581)

(assert (=> b!469298 (= lt!212591 (getCurrentListMapNoExtraKeys!1982 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469298 (= lt!212590 (getCurrentListMapNoExtraKeys!1982 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469299 () Bool)

(declare-fun tp_is_empty!13039 () Bool)

(assert (=> b!469299 (= e!274803 tp_is_empty!13039)))

(declare-fun b!469300 () Bool)

(declare-fun res!280476 () Bool)

(assert (=> b!469300 (=> (not res!280476) (not e!274800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29835 (_ BitVec 32)) Bool)

(assert (=> b!469300 (= res!280476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469301 () Bool)

(assert (=> b!469301 (= e!274801 true)))

(declare-fun lt!212585 () tuple2!8678)

(declare-fun +!1733 (ListLongMap!7581 tuple2!8678) ListLongMap!7581)

(assert (=> b!469301 (= (+!1733 lt!212590 lt!212585) (+!1733 (+!1733 lt!212590 (tuple2!8679 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212585))))

(assert (=> b!469301 (= lt!212585 (tuple2!8679 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212586 () Unit!13711)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!116 (ListLongMap!7581 (_ BitVec 64) V!18491 V!18491) Unit!13711)

(assert (=> b!469301 (= lt!212586 (addSameAsAddTwiceSameKeyDiffValues!116 lt!212590 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212588 () ListLongMap!7581)

(declare-fun getCurrentListMap!2169 (array!29835 array!29837 (_ BitVec 32) (_ BitVec 32) V!18491 V!18491 (_ BitVec 32) Int) ListLongMap!7581)

(assert (=> b!469301 (= lt!212588 (getCurrentListMap!2169 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212589 () ListLongMap!7581)

(assert (=> b!469301 (= lt!212589 (getCurrentListMap!2169 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21256 () Bool)

(assert (=> mapIsEmpty!21256 mapRes!21256))

(declare-fun b!469294 () Bool)

(assert (=> b!469294 (= e!274799 tp_is_empty!13039)))

(declare-fun res!280474 () Bool)

(assert (=> start!42044 (=> (not res!280474) (not e!274800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42044 (= res!280474 (validMask!0 mask!1365))))

(assert (=> start!42044 e!274800))

(assert (=> start!42044 tp_is_empty!13039))

(assert (=> start!42044 tp!40851))

(assert (=> start!42044 true))

(declare-fun array_inv!10436 (array!29835) Bool)

(assert (=> start!42044 (array_inv!10436 _keys!1025)))

(declare-fun array_inv!10437 (array!29837) Bool)

(assert (=> start!42044 (and (array_inv!10437 _values!833) e!274802)))

(assert (= (and start!42044 res!280474) b!469295))

(assert (= (and b!469295 res!280473) b!469300))

(assert (= (and b!469300 res!280476) b!469296))

(assert (= (and b!469296 res!280475) b!469298))

(assert (= (and b!469298 (not res!280477)) b!469301))

(assert (= (and b!469297 condMapEmpty!21256) mapIsEmpty!21256))

(assert (= (and b!469297 (not condMapEmpty!21256)) mapNonEmpty!21256))

(get-info :version)

(assert (= (and mapNonEmpty!21256 ((_ is ValueCellFull!6176) mapValue!21256)) b!469294))

(assert (= (and b!469297 ((_ is ValueCellFull!6176) mapDefault!21256)) b!469299))

(assert (= start!42044 b!469297))

(declare-fun m!451027 () Bool)

(assert (=> b!469296 m!451027))

(declare-fun m!451029 () Bool)

(assert (=> b!469298 m!451029))

(declare-fun m!451031 () Bool)

(assert (=> b!469298 m!451031))

(declare-fun m!451033 () Bool)

(assert (=> b!469298 m!451033))

(declare-fun m!451035 () Bool)

(assert (=> b!469300 m!451035))

(declare-fun m!451037 () Bool)

(assert (=> b!469301 m!451037))

(declare-fun m!451039 () Bool)

(assert (=> b!469301 m!451039))

(declare-fun m!451041 () Bool)

(assert (=> b!469301 m!451041))

(declare-fun m!451043 () Bool)

(assert (=> b!469301 m!451043))

(assert (=> b!469301 m!451037))

(declare-fun m!451045 () Bool)

(assert (=> b!469301 m!451045))

(declare-fun m!451047 () Bool)

(assert (=> b!469301 m!451047))

(declare-fun m!451049 () Bool)

(assert (=> start!42044 m!451049))

(declare-fun m!451051 () Bool)

(assert (=> start!42044 m!451051))

(declare-fun m!451053 () Bool)

(assert (=> start!42044 m!451053))

(declare-fun m!451055 () Bool)

(assert (=> mapNonEmpty!21256 m!451055))

(check-sat tp_is_empty!13039 b_and!19995 (not b!469300) (not b_next!11611) (not mapNonEmpty!21256) (not b!469298) (not start!42044) (not b!469301) (not b!469296))
(check-sat b_and!19995 (not b_next!11611))
