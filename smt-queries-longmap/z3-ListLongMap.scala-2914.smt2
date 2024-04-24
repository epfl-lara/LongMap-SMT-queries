; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41626 () Bool)

(assert start!41626)

(declare-fun b_free!11293 () Bool)

(declare-fun b_next!11293 () Bool)

(assert (=> start!41626 (= b_free!11293 (not b_next!11293))))

(declare-fun tp!39879 () Bool)

(declare-fun b_and!19651 () Bool)

(assert (=> start!41626 (= tp!39879 b_and!19651)))

(declare-fun b!464947 () Bool)

(declare-fun e!271660 () Bool)

(declare-fun tp_is_empty!12721 () Bool)

(assert (=> b!464947 (= e!271660 tp_is_empty!12721)))

(declare-fun b!464948 () Bool)

(declare-fun res!277973 () Bool)

(declare-fun e!271659 () Bool)

(assert (=> b!464948 (=> (not res!277973) (not e!271659))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29224 0))(
  ( (array!29225 (arr!14042 (Array (_ BitVec 32) (_ BitVec 64))) (size!14394 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29224)

(declare-datatypes ((V!18067 0))(
  ( (V!18068 (val!6405 Int)) )
))
(declare-datatypes ((ValueCell!6017 0))(
  ( (ValueCellFull!6017 (v!8693 V!18067)) (EmptyCell!6017) )
))
(declare-datatypes ((array!29226 0))(
  ( (array!29227 (arr!14043 (Array (_ BitVec 32) ValueCell!6017)) (size!14395 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29226)

(assert (=> b!464948 (= res!277973 (and (= (size!14395 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14394 _keys!1025) (size!14395 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464949 () Bool)

(declare-fun res!277976 () Bool)

(assert (=> b!464949 (=> (not res!277976) (not e!271659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29224 (_ BitVec 32)) Bool)

(assert (=> b!464949 (= res!277976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464950 () Bool)

(declare-fun e!271661 () Bool)

(declare-fun mapRes!20761 () Bool)

(assert (=> b!464950 (= e!271661 (and e!271660 mapRes!20761))))

(declare-fun condMapEmpty!20761 () Bool)

(declare-fun mapDefault!20761 () ValueCell!6017)

(assert (=> b!464950 (= condMapEmpty!20761 (= (arr!14043 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6017)) mapDefault!20761)))))

(declare-fun b!464951 () Bool)

(assert (=> b!464951 (= e!271659 (not true))))

(declare-datatypes ((tuple2!8328 0))(
  ( (tuple2!8329 (_1!4175 (_ BitVec 64)) (_2!4175 V!18067)) )
))
(declare-datatypes ((List!8414 0))(
  ( (Nil!8411) (Cons!8410 (h!9266 tuple2!8328) (t!14354 List!8414)) )
))
(declare-datatypes ((ListLongMap!7243 0))(
  ( (ListLongMap!7244 (toList!3637 List!8414)) )
))
(declare-fun lt!209976 () ListLongMap!7243)

(declare-fun lt!209975 () ListLongMap!7243)

(assert (=> b!464951 (= lt!209976 lt!209975)))

(declare-datatypes ((Unit!13492 0))(
  ( (Unit!13493) )
))
(declare-fun lt!209974 () Unit!13492)

(declare-fun minValueBefore!38 () V!18067)

(declare-fun zeroValue!794 () V!18067)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18067)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!24 (array!29224 array!29226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18067 V!18067 V!18067 V!18067 (_ BitVec 32) Int) Unit!13492)

(assert (=> b!464951 (= lt!209974 (lemmaNoChangeToArrayThenSameMapNoExtras!24 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1864 (array!29224 array!29226 (_ BitVec 32) (_ BitVec 32) V!18067 V!18067 (_ BitVec 32) Int) ListLongMap!7243)

(assert (=> b!464951 (= lt!209975 (getCurrentListMapNoExtraKeys!1864 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464951 (= lt!209976 (getCurrentListMapNoExtraKeys!1864 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464952 () Bool)

(declare-fun res!277974 () Bool)

(assert (=> b!464952 (=> (not res!277974) (not e!271659))))

(declare-datatypes ((List!8415 0))(
  ( (Nil!8412) (Cons!8411 (h!9267 (_ BitVec 64)) (t!14355 List!8415)) )
))
(declare-fun arrayNoDuplicates!0 (array!29224 (_ BitVec 32) List!8415) Bool)

(assert (=> b!464952 (= res!277974 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8412))))

(declare-fun mapNonEmpty!20761 () Bool)

(declare-fun tp!39880 () Bool)

(declare-fun e!271662 () Bool)

(assert (=> mapNonEmpty!20761 (= mapRes!20761 (and tp!39880 e!271662))))

(declare-fun mapKey!20761 () (_ BitVec 32))

(declare-fun mapRest!20761 () (Array (_ BitVec 32) ValueCell!6017))

(declare-fun mapValue!20761 () ValueCell!6017)

(assert (=> mapNonEmpty!20761 (= (arr!14043 _values!833) (store mapRest!20761 mapKey!20761 mapValue!20761))))

(declare-fun mapIsEmpty!20761 () Bool)

(assert (=> mapIsEmpty!20761 mapRes!20761))

(declare-fun b!464953 () Bool)

(assert (=> b!464953 (= e!271662 tp_is_empty!12721)))

(declare-fun res!277975 () Bool)

(assert (=> start!41626 (=> (not res!277975) (not e!271659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41626 (= res!277975 (validMask!0 mask!1365))))

(assert (=> start!41626 e!271659))

(assert (=> start!41626 tp_is_empty!12721))

(assert (=> start!41626 tp!39879))

(assert (=> start!41626 true))

(declare-fun array_inv!10224 (array!29224) Bool)

(assert (=> start!41626 (array_inv!10224 _keys!1025)))

(declare-fun array_inv!10225 (array!29226) Bool)

(assert (=> start!41626 (and (array_inv!10225 _values!833) e!271661)))

(assert (= (and start!41626 res!277975) b!464948))

(assert (= (and b!464948 res!277973) b!464949))

(assert (= (and b!464949 res!277976) b!464952))

(assert (= (and b!464952 res!277974) b!464951))

(assert (= (and b!464950 condMapEmpty!20761) mapIsEmpty!20761))

(assert (= (and b!464950 (not condMapEmpty!20761)) mapNonEmpty!20761))

(get-info :version)

(assert (= (and mapNonEmpty!20761 ((_ is ValueCellFull!6017) mapValue!20761)) b!464953))

(assert (= (and b!464950 ((_ is ValueCellFull!6017) mapDefault!20761)) b!464947))

(assert (= start!41626 b!464950))

(declare-fun m!447487 () Bool)

(assert (=> b!464951 m!447487))

(declare-fun m!447489 () Bool)

(assert (=> b!464951 m!447489))

(declare-fun m!447491 () Bool)

(assert (=> b!464951 m!447491))

(declare-fun m!447493 () Bool)

(assert (=> b!464952 m!447493))

(declare-fun m!447495 () Bool)

(assert (=> b!464949 m!447495))

(declare-fun m!447497 () Bool)

(assert (=> mapNonEmpty!20761 m!447497))

(declare-fun m!447499 () Bool)

(assert (=> start!41626 m!447499))

(declare-fun m!447501 () Bool)

(assert (=> start!41626 m!447501))

(declare-fun m!447503 () Bool)

(assert (=> start!41626 m!447503))

(check-sat (not b!464949) (not b_next!11293) b_and!19651 tp_is_empty!12721 (not b!464951) (not start!41626) (not b!464952) (not mapNonEmpty!20761))
(check-sat b_and!19651 (not b_next!11293))
