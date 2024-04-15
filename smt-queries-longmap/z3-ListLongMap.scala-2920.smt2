; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41676 () Bool)

(assert start!41676)

(declare-fun b_free!11329 () Bool)

(declare-fun b_next!11329 () Bool)

(assert (=> start!41676 (= b_free!11329 (not b_next!11329))))

(declare-fun tp!39991 () Bool)

(declare-fun b_and!19659 () Bool)

(assert (=> start!41676 (= tp!39991 b_and!19659)))

(declare-fun b!465211 () Bool)

(declare-fun res!278113 () Bool)

(declare-fun e!271863 () Bool)

(assert (=> b!465211 (=> (not res!278113) (not e!271863))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29297 0))(
  ( (array!29298 (arr!14078 (Array (_ BitVec 32) (_ BitVec 64))) (size!14431 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29297)

(declare-datatypes ((V!18115 0))(
  ( (V!18116 (val!6423 Int)) )
))
(declare-datatypes ((ValueCell!6035 0))(
  ( (ValueCellFull!6035 (v!8704 V!18115)) (EmptyCell!6035) )
))
(declare-datatypes ((array!29299 0))(
  ( (array!29300 (arr!14079 (Array (_ BitVec 32) ValueCell!6035)) (size!14432 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29299)

(assert (=> b!465211 (= res!278113 (and (= (size!14432 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14431 _keys!1025) (size!14432 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20818 () Bool)

(declare-fun mapRes!20818 () Bool)

(declare-fun tp!39990 () Bool)

(declare-fun e!271862 () Bool)

(assert (=> mapNonEmpty!20818 (= mapRes!20818 (and tp!39990 e!271862))))

(declare-fun mapKey!20818 () (_ BitVec 32))

(declare-fun mapValue!20818 () ValueCell!6035)

(declare-fun mapRest!20818 () (Array (_ BitVec 32) ValueCell!6035))

(assert (=> mapNonEmpty!20818 (= (arr!14079 _values!833) (store mapRest!20818 mapKey!20818 mapValue!20818))))

(declare-fun b!465212 () Bool)

(declare-fun e!271864 () Bool)

(assert (=> b!465212 (= e!271864 true)))

(declare-fun zeroValue!794 () V!18115)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8456 0))(
  ( (tuple2!8457 (_1!4239 (_ BitVec 64)) (_2!4239 V!18115)) )
))
(declare-datatypes ((List!8543 0))(
  ( (Nil!8540) (Cons!8539 (h!9395 tuple2!8456) (t!14484 List!8543)) )
))
(declare-datatypes ((ListLongMap!7359 0))(
  ( (ListLongMap!7360 (toList!3695 List!8543)) )
))
(declare-fun lt!209953 () ListLongMap!7359)

(declare-fun minValueAfter!38 () V!18115)

(declare-fun getCurrentListMap!2088 (array!29297 array!29299 (_ BitVec 32) (_ BitVec 32) V!18115 V!18115 (_ BitVec 32) Int) ListLongMap!7359)

(assert (=> b!465212 (= lt!209953 (getCurrentListMap!2088 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18115)

(declare-fun lt!209955 () ListLongMap!7359)

(declare-fun +!1669 (ListLongMap!7359 tuple2!8456) ListLongMap!7359)

(assert (=> b!465212 (= lt!209955 (+!1669 (getCurrentListMap!2088 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8457 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun mapIsEmpty!20818 () Bool)

(assert (=> mapIsEmpty!20818 mapRes!20818))

(declare-fun b!465213 () Bool)

(declare-fun tp_is_empty!12757 () Bool)

(assert (=> b!465213 (= e!271862 tp_is_empty!12757)))

(declare-fun b!465214 () Bool)

(declare-fun e!271861 () Bool)

(assert (=> b!465214 (= e!271861 tp_is_empty!12757)))

(declare-fun b!465215 () Bool)

(declare-fun res!278111 () Bool)

(assert (=> b!465215 (=> (not res!278111) (not e!271863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29297 (_ BitVec 32)) Bool)

(assert (=> b!465215 (= res!278111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!278109 () Bool)

(assert (=> start!41676 (=> (not res!278109) (not e!271863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41676 (= res!278109 (validMask!0 mask!1365))))

(assert (=> start!41676 e!271863))

(assert (=> start!41676 tp_is_empty!12757))

(assert (=> start!41676 tp!39991))

(assert (=> start!41676 true))

(declare-fun array_inv!10254 (array!29297) Bool)

(assert (=> start!41676 (array_inv!10254 _keys!1025)))

(declare-fun e!271865 () Bool)

(declare-fun array_inv!10255 (array!29299) Bool)

(assert (=> start!41676 (and (array_inv!10255 _values!833) e!271865)))

(declare-fun b!465216 () Bool)

(declare-fun res!278112 () Bool)

(assert (=> b!465216 (=> (not res!278112) (not e!271863))))

(declare-datatypes ((List!8544 0))(
  ( (Nil!8541) (Cons!8540 (h!9396 (_ BitVec 64)) (t!14485 List!8544)) )
))
(declare-fun arrayNoDuplicates!0 (array!29297 (_ BitVec 32) List!8544) Bool)

(assert (=> b!465216 (= res!278112 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8541))))

(declare-fun b!465217 () Bool)

(assert (=> b!465217 (= e!271865 (and e!271861 mapRes!20818))))

(declare-fun condMapEmpty!20818 () Bool)

(declare-fun mapDefault!20818 () ValueCell!6035)

(assert (=> b!465217 (= condMapEmpty!20818 (= (arr!14079 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6035)) mapDefault!20818)))))

(declare-fun b!465218 () Bool)

(assert (=> b!465218 (= e!271863 (not e!271864))))

(declare-fun res!278110 () Bool)

(assert (=> b!465218 (=> res!278110 e!271864)))

(assert (=> b!465218 (= res!278110 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!209954 () ListLongMap!7359)

(declare-fun lt!209956 () ListLongMap!7359)

(assert (=> b!465218 (= lt!209954 lt!209956)))

(declare-datatypes ((Unit!13506 0))(
  ( (Unit!13507) )
))
(declare-fun lt!209952 () Unit!13506)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!44 (array!29297 array!29299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18115 V!18115 V!18115 V!18115 (_ BitVec 32) Int) Unit!13506)

(assert (=> b!465218 (= lt!209952 (lemmaNoChangeToArrayThenSameMapNoExtras!44 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1887 (array!29297 array!29299 (_ BitVec 32) (_ BitVec 32) V!18115 V!18115 (_ BitVec 32) Int) ListLongMap!7359)

(assert (=> b!465218 (= lt!209956 (getCurrentListMapNoExtraKeys!1887 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465218 (= lt!209954 (getCurrentListMapNoExtraKeys!1887 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41676 res!278109) b!465211))

(assert (= (and b!465211 res!278113) b!465215))

(assert (= (and b!465215 res!278111) b!465216))

(assert (= (and b!465216 res!278112) b!465218))

(assert (= (and b!465218 (not res!278110)) b!465212))

(assert (= (and b!465217 condMapEmpty!20818) mapIsEmpty!20818))

(assert (= (and b!465217 (not condMapEmpty!20818)) mapNonEmpty!20818))

(get-info :version)

(assert (= (and mapNonEmpty!20818 ((_ is ValueCellFull!6035) mapValue!20818)) b!465213))

(assert (= (and b!465217 ((_ is ValueCellFull!6035) mapDefault!20818)) b!465214))

(assert (= start!41676 b!465217))

(declare-fun m!446979 () Bool)

(assert (=> b!465215 m!446979))

(declare-fun m!446981 () Bool)

(assert (=> b!465218 m!446981))

(declare-fun m!446983 () Bool)

(assert (=> b!465218 m!446983))

(declare-fun m!446985 () Bool)

(assert (=> b!465218 m!446985))

(declare-fun m!446987 () Bool)

(assert (=> start!41676 m!446987))

(declare-fun m!446989 () Bool)

(assert (=> start!41676 m!446989))

(declare-fun m!446991 () Bool)

(assert (=> start!41676 m!446991))

(declare-fun m!446993 () Bool)

(assert (=> mapNonEmpty!20818 m!446993))

(declare-fun m!446995 () Bool)

(assert (=> b!465212 m!446995))

(declare-fun m!446997 () Bool)

(assert (=> b!465212 m!446997))

(assert (=> b!465212 m!446997))

(declare-fun m!446999 () Bool)

(assert (=> b!465212 m!446999))

(declare-fun m!447001 () Bool)

(assert (=> b!465216 m!447001))

(check-sat (not b!465218) (not b!465216) b_and!19659 (not start!41676) (not b!465215) (not mapNonEmpty!20818) (not b_next!11329) (not b!465212) tp_is_empty!12757)
(check-sat b_and!19659 (not b_next!11329))
