; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41676 () Bool)

(assert start!41676)

(declare-fun b_free!11329 () Bool)

(declare-fun b_next!11329 () Bool)

(assert (=> start!41676 (= b_free!11329 (not b_next!11329))))

(declare-fun tp!39991 () Bool)

(declare-fun b_and!19695 () Bool)

(assert (=> start!41676 (= tp!39991 b_and!19695)))

(declare-fun b!465421 () Bool)

(declare-fun e!271997 () Bool)

(declare-fun e!271999 () Bool)

(declare-fun mapRes!20818 () Bool)

(assert (=> b!465421 (= e!271997 (and e!271999 mapRes!20818))))

(declare-fun condMapEmpty!20818 () Bool)

(declare-datatypes ((V!18115 0))(
  ( (V!18116 (val!6423 Int)) )
))
(declare-datatypes ((ValueCell!6035 0))(
  ( (ValueCellFull!6035 (v!8711 V!18115)) (EmptyCell!6035) )
))
(declare-datatypes ((array!29296 0))(
  ( (array!29297 (arr!14077 (Array (_ BitVec 32) ValueCell!6035)) (size!14429 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29296)

(declare-fun mapDefault!20818 () ValueCell!6035)

(assert (=> b!465421 (= condMapEmpty!20818 (= (arr!14077 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6035)) mapDefault!20818)))))

(declare-fun b!465422 () Bool)

(declare-fun e!272000 () Bool)

(assert (=> b!465422 (= e!272000 true)))

(declare-datatypes ((tuple2!8352 0))(
  ( (tuple2!8353 (_1!4187 (_ BitVec 64)) (_2!4187 V!18115)) )
))
(declare-datatypes ((List!8440 0))(
  ( (Nil!8437) (Cons!8436 (h!9292 tuple2!8352) (t!14382 List!8440)) )
))
(declare-datatypes ((ListLongMap!7267 0))(
  ( (ListLongMap!7268 (toList!3649 List!8440)) )
))
(declare-fun lt!210201 () ListLongMap!7267)

(declare-fun zeroValue!794 () V!18115)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29298 0))(
  ( (array!29299 (arr!14078 (Array (_ BitVec 32) (_ BitVec 64))) (size!14430 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29298)

(declare-fun minValueAfter!38 () V!18115)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2102 (array!29298 array!29296 (_ BitVec 32) (_ BitVec 32) V!18115 V!18115 (_ BitVec 32) Int) ListLongMap!7267)

(assert (=> b!465422 (= lt!210201 (getCurrentListMap!2102 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18115)

(declare-fun lt!210199 () ListLongMap!7267)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1651 (ListLongMap!7267 tuple2!8352) ListLongMap!7267)

(assert (=> b!465422 (= lt!210199 (+!1651 (getCurrentListMap!2102 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8353 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465423 () Bool)

(declare-fun tp_is_empty!12757 () Bool)

(assert (=> b!465423 (= e!271999 tp_is_empty!12757)))

(declare-fun res!278231 () Bool)

(declare-fun e!271995 () Bool)

(assert (=> start!41676 (=> (not res!278231) (not e!271995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41676 (= res!278231 (validMask!0 mask!1365))))

(assert (=> start!41676 e!271995))

(assert (=> start!41676 tp_is_empty!12757))

(assert (=> start!41676 tp!39991))

(assert (=> start!41676 true))

(declare-fun array_inv!10248 (array!29298) Bool)

(assert (=> start!41676 (array_inv!10248 _keys!1025)))

(declare-fun array_inv!10249 (array!29296) Bool)

(assert (=> start!41676 (and (array_inv!10249 _values!833) e!271997)))

(declare-fun b!465424 () Bool)

(declare-fun res!278235 () Bool)

(assert (=> b!465424 (=> (not res!278235) (not e!271995))))

(declare-datatypes ((List!8441 0))(
  ( (Nil!8438) (Cons!8437 (h!9293 (_ BitVec 64)) (t!14383 List!8441)) )
))
(declare-fun arrayNoDuplicates!0 (array!29298 (_ BitVec 32) List!8441) Bool)

(assert (=> b!465424 (= res!278235 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8438))))

(declare-fun b!465425 () Bool)

(assert (=> b!465425 (= e!271995 (not e!272000))))

(declare-fun res!278232 () Bool)

(assert (=> b!465425 (=> res!278232 e!272000)))

(assert (=> b!465425 (= res!278232 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210202 () ListLongMap!7267)

(declare-fun lt!210200 () ListLongMap!7267)

(assert (=> b!465425 (= lt!210202 lt!210200)))

(declare-datatypes ((Unit!13516 0))(
  ( (Unit!13517) )
))
(declare-fun lt!210198 () Unit!13516)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!36 (array!29298 array!29296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18115 V!18115 V!18115 V!18115 (_ BitVec 32) Int) Unit!13516)

(assert (=> b!465425 (= lt!210198 (lemmaNoChangeToArrayThenSameMapNoExtras!36 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1876 (array!29298 array!29296 (_ BitVec 32) (_ BitVec 32) V!18115 V!18115 (_ BitVec 32) Int) ListLongMap!7267)

(assert (=> b!465425 (= lt!210200 (getCurrentListMapNoExtraKeys!1876 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465425 (= lt!210202 (getCurrentListMapNoExtraKeys!1876 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20818 () Bool)

(declare-fun tp!39990 () Bool)

(declare-fun e!271996 () Bool)

(assert (=> mapNonEmpty!20818 (= mapRes!20818 (and tp!39990 e!271996))))

(declare-fun mapRest!20818 () (Array (_ BitVec 32) ValueCell!6035))

(declare-fun mapValue!20818 () ValueCell!6035)

(declare-fun mapKey!20818 () (_ BitVec 32))

(assert (=> mapNonEmpty!20818 (= (arr!14077 _values!833) (store mapRest!20818 mapKey!20818 mapValue!20818))))

(declare-fun b!465426 () Bool)

(declare-fun res!278233 () Bool)

(assert (=> b!465426 (=> (not res!278233) (not e!271995))))

(assert (=> b!465426 (= res!278233 (and (= (size!14429 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14430 _keys!1025) (size!14429 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465427 () Bool)

(assert (=> b!465427 (= e!271996 tp_is_empty!12757)))

(declare-fun b!465428 () Bool)

(declare-fun res!278234 () Bool)

(assert (=> b!465428 (=> (not res!278234) (not e!271995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29298 (_ BitVec 32)) Bool)

(assert (=> b!465428 (= res!278234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20818 () Bool)

(assert (=> mapIsEmpty!20818 mapRes!20818))

(assert (= (and start!41676 res!278231) b!465426))

(assert (= (and b!465426 res!278233) b!465428))

(assert (= (and b!465428 res!278234) b!465424))

(assert (= (and b!465424 res!278235) b!465425))

(assert (= (and b!465425 (not res!278232)) b!465422))

(assert (= (and b!465421 condMapEmpty!20818) mapIsEmpty!20818))

(assert (= (and b!465421 (not condMapEmpty!20818)) mapNonEmpty!20818))

(get-info :version)

(assert (= (and mapNonEmpty!20818 ((_ is ValueCellFull!6035) mapValue!20818)) b!465427))

(assert (= (and b!465421 ((_ is ValueCellFull!6035) mapDefault!20818)) b!465423))

(assert (= start!41676 b!465421))

(declare-fun m!447895 () Bool)

(assert (=> b!465422 m!447895))

(declare-fun m!447897 () Bool)

(assert (=> b!465422 m!447897))

(assert (=> b!465422 m!447897))

(declare-fun m!447899 () Bool)

(assert (=> b!465422 m!447899))

(declare-fun m!447901 () Bool)

(assert (=> b!465428 m!447901))

(declare-fun m!447903 () Bool)

(assert (=> mapNonEmpty!20818 m!447903))

(declare-fun m!447905 () Bool)

(assert (=> b!465425 m!447905))

(declare-fun m!447907 () Bool)

(assert (=> b!465425 m!447907))

(declare-fun m!447909 () Bool)

(assert (=> b!465425 m!447909))

(declare-fun m!447911 () Bool)

(assert (=> start!41676 m!447911))

(declare-fun m!447913 () Bool)

(assert (=> start!41676 m!447913))

(declare-fun m!447915 () Bool)

(assert (=> start!41676 m!447915))

(declare-fun m!447917 () Bool)

(assert (=> b!465424 m!447917))

(check-sat (not b_next!11329) (not mapNonEmpty!20818) b_and!19695 (not b!465422) tp_is_empty!12757 (not b!465425) (not b!465428) (not start!41676) (not b!465424))
(check-sat b_and!19695 (not b_next!11329))
