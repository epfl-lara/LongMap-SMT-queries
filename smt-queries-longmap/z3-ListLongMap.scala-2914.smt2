; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41642 () Bool)

(assert start!41642)

(declare-fun b_free!11295 () Bool)

(declare-fun b_next!11295 () Bool)

(assert (=> start!41642 (= b_free!11295 (not b_next!11295))))

(declare-fun tp!39885 () Bool)

(declare-fun b_and!19643 () Bool)

(assert (=> start!41642 (= tp!39885 b_and!19643)))

(declare-fun b!465029 () Bool)

(declare-fun res!277994 () Bool)

(declare-fun e!271716 () Bool)

(assert (=> b!465029 (=> (not res!277994) (not e!271716))))

(declare-datatypes ((array!29231 0))(
  ( (array!29232 (arr!14046 (Array (_ BitVec 32) (_ BitVec 64))) (size!14398 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29231)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29231 (_ BitVec 32)) Bool)

(assert (=> b!465029 (= res!277994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465030 () Bool)

(declare-fun e!271713 () Bool)

(declare-fun tp_is_empty!12723 () Bool)

(assert (=> b!465030 (= e!271713 tp_is_empty!12723)))

(declare-fun mapNonEmpty!20764 () Bool)

(declare-fun mapRes!20764 () Bool)

(declare-fun tp!39886 () Bool)

(assert (=> mapNonEmpty!20764 (= mapRes!20764 (and tp!39886 e!271713))))

(declare-datatypes ((V!18069 0))(
  ( (V!18070 (val!6406 Int)) )
))
(declare-datatypes ((ValueCell!6018 0))(
  ( (ValueCellFull!6018 (v!8693 V!18069)) (EmptyCell!6018) )
))
(declare-fun mapRest!20764 () (Array (_ BitVec 32) ValueCell!6018))

(declare-datatypes ((array!29233 0))(
  ( (array!29234 (arr!14047 (Array (_ BitVec 32) ValueCell!6018)) (size!14399 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29233)

(declare-fun mapValue!20764 () ValueCell!6018)

(declare-fun mapKey!20764 () (_ BitVec 32))

(assert (=> mapNonEmpty!20764 (= (arr!14047 _values!833) (store mapRest!20764 mapKey!20764 mapValue!20764))))

(declare-fun b!465031 () Bool)

(declare-fun e!271717 () Bool)

(declare-fun e!271714 () Bool)

(assert (=> b!465031 (= e!271717 (and e!271714 mapRes!20764))))

(declare-fun condMapEmpty!20764 () Bool)

(declare-fun mapDefault!20764 () ValueCell!6018)

(assert (=> b!465031 (= condMapEmpty!20764 (= (arr!14047 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6018)) mapDefault!20764)))))

(declare-fun mapIsEmpty!20764 () Bool)

(assert (=> mapIsEmpty!20764 mapRes!20764))

(declare-fun res!277993 () Bool)

(assert (=> start!41642 (=> (not res!277993) (not e!271716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41642 (= res!277993 (validMask!0 mask!1365))))

(assert (=> start!41642 e!271716))

(assert (=> start!41642 tp_is_empty!12723))

(assert (=> start!41642 tp!39885))

(assert (=> start!41642 true))

(declare-fun array_inv!10148 (array!29231) Bool)

(assert (=> start!41642 (array_inv!10148 _keys!1025)))

(declare-fun array_inv!10149 (array!29233) Bool)

(assert (=> start!41642 (and (array_inv!10149 _values!833) e!271717)))

(declare-fun b!465032 () Bool)

(assert (=> b!465032 (= e!271716 (not true))))

(declare-datatypes ((tuple2!8396 0))(
  ( (tuple2!8397 (_1!4209 (_ BitVec 64)) (_2!4209 V!18069)) )
))
(declare-datatypes ((List!8487 0))(
  ( (Nil!8484) (Cons!8483 (h!9339 tuple2!8396) (t!14435 List!8487)) )
))
(declare-datatypes ((ListLongMap!7309 0))(
  ( (ListLongMap!7310 (toList!3670 List!8487)) )
))
(declare-fun lt!209972 () ListLongMap!7309)

(declare-fun lt!209971 () ListLongMap!7309)

(assert (=> b!465032 (= lt!209972 lt!209971)))

(declare-fun minValueBefore!38 () V!18069)

(declare-fun zeroValue!794 () V!18069)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13508 0))(
  ( (Unit!13509) )
))
(declare-fun lt!209973 () Unit!13508)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18069)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!30 (array!29231 array!29233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18069 V!18069 V!18069 V!18069 (_ BitVec 32) Int) Unit!13508)

(assert (=> b!465032 (= lt!209973 (lemmaNoChangeToArrayThenSameMapNoExtras!30 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1850 (array!29231 array!29233 (_ BitVec 32) (_ BitVec 32) V!18069 V!18069 (_ BitVec 32) Int) ListLongMap!7309)

(assert (=> b!465032 (= lt!209971 (getCurrentListMapNoExtraKeys!1850 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465032 (= lt!209972 (getCurrentListMapNoExtraKeys!1850 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465033 () Bool)

(assert (=> b!465033 (= e!271714 tp_is_empty!12723)))

(declare-fun b!465034 () Bool)

(declare-fun res!277992 () Bool)

(assert (=> b!465034 (=> (not res!277992) (not e!271716))))

(assert (=> b!465034 (= res!277992 (and (= (size!14399 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14398 _keys!1025) (size!14399 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465035 () Bool)

(declare-fun res!277995 () Bool)

(assert (=> b!465035 (=> (not res!277995) (not e!271716))))

(declare-datatypes ((List!8488 0))(
  ( (Nil!8485) (Cons!8484 (h!9340 (_ BitVec 64)) (t!14436 List!8488)) )
))
(declare-fun arrayNoDuplicates!0 (array!29231 (_ BitVec 32) List!8488) Bool)

(assert (=> b!465035 (= res!277995 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8485))))

(assert (= (and start!41642 res!277993) b!465034))

(assert (= (and b!465034 res!277992) b!465029))

(assert (= (and b!465029 res!277994) b!465035))

(assert (= (and b!465035 res!277995) b!465032))

(assert (= (and b!465031 condMapEmpty!20764) mapIsEmpty!20764))

(assert (= (and b!465031 (not condMapEmpty!20764)) mapNonEmpty!20764))

(get-info :version)

(assert (= (and mapNonEmpty!20764 ((_ is ValueCellFull!6018) mapValue!20764)) b!465030))

(assert (= (and b!465031 ((_ is ValueCellFull!6018) mapDefault!20764)) b!465033))

(assert (= start!41642 b!465031))

(declare-fun m!447323 () Bool)

(assert (=> b!465035 m!447323))

(declare-fun m!447325 () Bool)

(assert (=> b!465032 m!447325))

(declare-fun m!447327 () Bool)

(assert (=> b!465032 m!447327))

(declare-fun m!447329 () Bool)

(assert (=> b!465032 m!447329))

(declare-fun m!447331 () Bool)

(assert (=> b!465029 m!447331))

(declare-fun m!447333 () Bool)

(assert (=> mapNonEmpty!20764 m!447333))

(declare-fun m!447335 () Bool)

(assert (=> start!41642 m!447335))

(declare-fun m!447337 () Bool)

(assert (=> start!41642 m!447337))

(declare-fun m!447339 () Bool)

(assert (=> start!41642 m!447339))

(check-sat (not b!465029) (not b!465035) tp_is_empty!12723 (not b_next!11295) (not start!41642) (not mapNonEmpty!20764) (not b!465032) b_and!19643)
(check-sat b_and!19643 (not b_next!11295))
