; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41608 () Bool)

(assert start!41608)

(declare-fun b_free!11275 () Bool)

(declare-fun b_next!11275 () Bool)

(assert (=> start!41608 (= b_free!11275 (not b_next!11275))))

(declare-fun tp!39825 () Bool)

(declare-fun b_and!19633 () Bool)

(assert (=> start!41608 (= tp!39825 b_and!19633)))

(declare-fun b!464758 () Bool)

(declare-fun e!271528 () Bool)

(declare-fun tp_is_empty!12703 () Bool)

(assert (=> b!464758 (= e!271528 tp_is_empty!12703)))

(declare-fun b!464759 () Bool)

(declare-fun res!277866 () Bool)

(declare-fun e!271525 () Bool)

(assert (=> b!464759 (=> (not res!277866) (not e!271525))))

(declare-datatypes ((array!29190 0))(
  ( (array!29191 (arr!14025 (Array (_ BitVec 32) (_ BitVec 64))) (size!14377 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29190)

(declare-datatypes ((List!8404 0))(
  ( (Nil!8401) (Cons!8400 (h!9256 (_ BitVec 64)) (t!14344 List!8404)) )
))
(declare-fun arrayNoDuplicates!0 (array!29190 (_ BitVec 32) List!8404) Bool)

(assert (=> b!464759 (= res!277866 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8401))))

(declare-fun mapNonEmpty!20734 () Bool)

(declare-fun mapRes!20734 () Bool)

(declare-fun tp!39826 () Bool)

(declare-fun e!271527 () Bool)

(assert (=> mapNonEmpty!20734 (= mapRes!20734 (and tp!39826 e!271527))))

(declare-fun mapKey!20734 () (_ BitVec 32))

(declare-datatypes ((V!18043 0))(
  ( (V!18044 (val!6396 Int)) )
))
(declare-datatypes ((ValueCell!6008 0))(
  ( (ValueCellFull!6008 (v!8684 V!18043)) (EmptyCell!6008) )
))
(declare-fun mapValue!20734 () ValueCell!6008)

(declare-fun mapRest!20734 () (Array (_ BitVec 32) ValueCell!6008))

(declare-datatypes ((array!29192 0))(
  ( (array!29193 (arr!14026 (Array (_ BitVec 32) ValueCell!6008)) (size!14378 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29192)

(assert (=> mapNonEmpty!20734 (= (arr!14026 _values!833) (store mapRest!20734 mapKey!20734 mapValue!20734))))

(declare-fun b!464760 () Bool)

(assert (=> b!464760 (= e!271525 (not true))))

(declare-datatypes ((tuple2!8318 0))(
  ( (tuple2!8319 (_1!4170 (_ BitVec 64)) (_2!4170 V!18043)) )
))
(declare-datatypes ((List!8405 0))(
  ( (Nil!8402) (Cons!8401 (h!9257 tuple2!8318) (t!14345 List!8405)) )
))
(declare-datatypes ((ListLongMap!7233 0))(
  ( (ListLongMap!7234 (toList!3632 List!8405)) )
))
(declare-fun lt!209893 () ListLongMap!7233)

(declare-fun lt!209894 () ListLongMap!7233)

(assert (=> b!464760 (= lt!209893 lt!209894)))

(declare-fun minValueBefore!38 () V!18043)

(declare-fun zeroValue!794 () V!18043)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18043)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13482 0))(
  ( (Unit!13483) )
))
(declare-fun lt!209895 () Unit!13482)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!19 (array!29190 array!29192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18043 V!18043 V!18043 V!18043 (_ BitVec 32) Int) Unit!13482)

(assert (=> b!464760 (= lt!209895 (lemmaNoChangeToArrayThenSameMapNoExtras!19 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1859 (array!29190 array!29192 (_ BitVec 32) (_ BitVec 32) V!18043 V!18043 (_ BitVec 32) Int) ListLongMap!7233)

(assert (=> b!464760 (= lt!209894 (getCurrentListMapNoExtraKeys!1859 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464760 (= lt!209893 (getCurrentListMapNoExtraKeys!1859 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464761 () Bool)

(declare-fun e!271526 () Bool)

(assert (=> b!464761 (= e!271526 (and e!271528 mapRes!20734))))

(declare-fun condMapEmpty!20734 () Bool)

(declare-fun mapDefault!20734 () ValueCell!6008)

(assert (=> b!464761 (= condMapEmpty!20734 (= (arr!14026 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6008)) mapDefault!20734)))))

(declare-fun b!464762 () Bool)

(declare-fun res!277865 () Bool)

(assert (=> b!464762 (=> (not res!277865) (not e!271525))))

(assert (=> b!464762 (= res!277865 (and (= (size!14378 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14377 _keys!1025) (size!14378 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20734 () Bool)

(assert (=> mapIsEmpty!20734 mapRes!20734))

(declare-fun res!277868 () Bool)

(assert (=> start!41608 (=> (not res!277868) (not e!271525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41608 (= res!277868 (validMask!0 mask!1365))))

(assert (=> start!41608 e!271525))

(assert (=> start!41608 tp_is_empty!12703))

(assert (=> start!41608 tp!39825))

(assert (=> start!41608 true))

(declare-fun array_inv!10212 (array!29190) Bool)

(assert (=> start!41608 (array_inv!10212 _keys!1025)))

(declare-fun array_inv!10213 (array!29192) Bool)

(assert (=> start!41608 (and (array_inv!10213 _values!833) e!271526)))

(declare-fun b!464763 () Bool)

(declare-fun res!277867 () Bool)

(assert (=> b!464763 (=> (not res!277867) (not e!271525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29190 (_ BitVec 32)) Bool)

(assert (=> b!464763 (= res!277867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464764 () Bool)

(assert (=> b!464764 (= e!271527 tp_is_empty!12703)))

(assert (= (and start!41608 res!277868) b!464762))

(assert (= (and b!464762 res!277865) b!464763))

(assert (= (and b!464763 res!277867) b!464759))

(assert (= (and b!464759 res!277866) b!464760))

(assert (= (and b!464761 condMapEmpty!20734) mapIsEmpty!20734))

(assert (= (and b!464761 (not condMapEmpty!20734)) mapNonEmpty!20734))

(get-info :version)

(assert (= (and mapNonEmpty!20734 ((_ is ValueCellFull!6008) mapValue!20734)) b!464764))

(assert (= (and b!464761 ((_ is ValueCellFull!6008) mapDefault!20734)) b!464758))

(assert (= start!41608 b!464761))

(declare-fun m!447325 () Bool)

(assert (=> b!464760 m!447325))

(declare-fun m!447327 () Bool)

(assert (=> b!464760 m!447327))

(declare-fun m!447329 () Bool)

(assert (=> b!464760 m!447329))

(declare-fun m!447331 () Bool)

(assert (=> b!464759 m!447331))

(declare-fun m!447333 () Bool)

(assert (=> b!464763 m!447333))

(declare-fun m!447335 () Bool)

(assert (=> mapNonEmpty!20734 m!447335))

(declare-fun m!447337 () Bool)

(assert (=> start!41608 m!447337))

(declare-fun m!447339 () Bool)

(assert (=> start!41608 m!447339))

(declare-fun m!447341 () Bool)

(assert (=> start!41608 m!447341))

(check-sat tp_is_empty!12703 (not b!464763) (not mapNonEmpty!20734) (not start!41608) b_and!19633 (not b!464760) (not b!464759) (not b_next!11275))
(check-sat b_and!19633 (not b_next!11275))
