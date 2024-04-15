; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41644 () Bool)

(assert start!41644)

(declare-fun b_free!11311 () Bool)

(declare-fun b_next!11311 () Bool)

(assert (=> start!41644 (= b_free!11311 (not b_next!11311))))

(declare-fun tp!39933 () Bool)

(declare-fun b_and!19633 () Bool)

(assert (=> start!41644 (= tp!39933 b_and!19633)))

(declare-fun mapIsEmpty!20788 () Bool)

(declare-fun mapRes!20788 () Bool)

(assert (=> mapIsEmpty!20788 mapRes!20788))

(declare-fun b!464926 () Bool)

(declare-fun res!277961 () Bool)

(declare-fun e!271663 () Bool)

(assert (=> b!464926 (=> (not res!277961) (not e!271663))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29259 0))(
  ( (array!29260 (arr!14060 (Array (_ BitVec 32) (_ BitVec 64))) (size!14413 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29259)

(declare-datatypes ((V!18091 0))(
  ( (V!18092 (val!6414 Int)) )
))
(declare-datatypes ((ValueCell!6026 0))(
  ( (ValueCellFull!6026 (v!8695 V!18091)) (EmptyCell!6026) )
))
(declare-datatypes ((array!29261 0))(
  ( (array!29262 (arr!14061 (Array (_ BitVec 32) ValueCell!6026)) (size!14414 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29261)

(assert (=> b!464926 (= res!277961 (and (= (size!14414 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14413 _keys!1025) (size!14414 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464927 () Bool)

(declare-fun res!277962 () Bool)

(assert (=> b!464927 (=> (not res!277962) (not e!271663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29259 (_ BitVec 32)) Bool)

(assert (=> b!464927 (= res!277962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20788 () Bool)

(declare-fun tp!39934 () Bool)

(declare-fun e!271661 () Bool)

(assert (=> mapNonEmpty!20788 (= mapRes!20788 (and tp!39934 e!271661))))

(declare-fun mapKey!20788 () (_ BitVec 32))

(declare-fun mapValue!20788 () ValueCell!6026)

(declare-fun mapRest!20788 () (Array (_ BitVec 32) ValueCell!6026))

(assert (=> mapNonEmpty!20788 (= (arr!14061 _values!833) (store mapRest!20788 mapKey!20788 mapValue!20788))))

(declare-fun b!464928 () Bool)

(declare-fun tp_is_empty!12739 () Bool)

(assert (=> b!464928 (= e!271661 tp_is_empty!12739)))

(declare-fun b!464929 () Bool)

(declare-fun e!271660 () Bool)

(assert (=> b!464929 (= e!271660 tp_is_empty!12739)))

(declare-fun b!464931 () Bool)

(declare-fun e!271659 () Bool)

(assert (=> b!464931 (= e!271659 (and e!271660 mapRes!20788))))

(declare-fun condMapEmpty!20788 () Bool)

(declare-fun mapDefault!20788 () ValueCell!6026)

(assert (=> b!464931 (= condMapEmpty!20788 (= (arr!14061 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6026)) mapDefault!20788)))))

(declare-fun b!464932 () Bool)

(assert (=> b!464932 (= e!271663 (not true))))

(declare-datatypes ((tuple2!8440 0))(
  ( (tuple2!8441 (_1!4231 (_ BitVec 64)) (_2!4231 V!18091)) )
))
(declare-datatypes ((List!8529 0))(
  ( (Nil!8526) (Cons!8525 (h!9381 tuple2!8440) (t!14468 List!8529)) )
))
(declare-datatypes ((ListLongMap!7343 0))(
  ( (ListLongMap!7344 (toList!3687 List!8529)) )
))
(declare-fun lt!209810 () ListLongMap!7343)

(declare-fun lt!209811 () ListLongMap!7343)

(assert (=> b!464932 (= lt!209810 lt!209811)))

(declare-fun zeroValue!794 () V!18091)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueBefore!38 () V!18091)

(declare-fun minValueAfter!38 () V!18091)

(declare-datatypes ((Unit!13490 0))(
  ( (Unit!13491) )
))
(declare-fun lt!209809 () Unit!13490)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!36 (array!29259 array!29261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18091 V!18091 V!18091 V!18091 (_ BitVec 32) Int) Unit!13490)

(assert (=> b!464932 (= lt!209809 (lemmaNoChangeToArrayThenSameMapNoExtras!36 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1879 (array!29259 array!29261 (_ BitVec 32) (_ BitVec 32) V!18091 V!18091 (_ BitVec 32) Int) ListLongMap!7343)

(assert (=> b!464932 (= lt!209811 (getCurrentListMapNoExtraKeys!1879 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464932 (= lt!209810 (getCurrentListMapNoExtraKeys!1879 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464930 () Bool)

(declare-fun res!277960 () Bool)

(assert (=> b!464930 (=> (not res!277960) (not e!271663))))

(declare-datatypes ((List!8530 0))(
  ( (Nil!8527) (Cons!8526 (h!9382 (_ BitVec 64)) (t!14469 List!8530)) )
))
(declare-fun arrayNoDuplicates!0 (array!29259 (_ BitVec 32) List!8530) Bool)

(assert (=> b!464930 (= res!277960 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8527))))

(declare-fun res!277959 () Bool)

(assert (=> start!41644 (=> (not res!277959) (not e!271663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41644 (= res!277959 (validMask!0 mask!1365))))

(assert (=> start!41644 e!271663))

(assert (=> start!41644 tp_is_empty!12739))

(assert (=> start!41644 tp!39933))

(assert (=> start!41644 true))

(declare-fun array_inv!10238 (array!29259) Bool)

(assert (=> start!41644 (array_inv!10238 _keys!1025)))

(declare-fun array_inv!10239 (array!29261) Bool)

(assert (=> start!41644 (and (array_inv!10239 _values!833) e!271659)))

(assert (= (and start!41644 res!277959) b!464926))

(assert (= (and b!464926 res!277961) b!464927))

(assert (= (and b!464927 res!277962) b!464930))

(assert (= (and b!464930 res!277960) b!464932))

(assert (= (and b!464931 condMapEmpty!20788) mapIsEmpty!20788))

(assert (= (and b!464931 (not condMapEmpty!20788)) mapNonEmpty!20788))

(get-info :version)

(assert (= (and mapNonEmpty!20788 ((_ is ValueCellFull!6026) mapValue!20788)) b!464928))

(assert (= (and b!464931 ((_ is ValueCellFull!6026) mapDefault!20788)) b!464929))

(assert (= start!41644 b!464931))

(declare-fun m!446733 () Bool)

(assert (=> b!464927 m!446733))

(declare-fun m!446735 () Bool)

(assert (=> b!464930 m!446735))

(declare-fun m!446737 () Bool)

(assert (=> start!41644 m!446737))

(declare-fun m!446739 () Bool)

(assert (=> start!41644 m!446739))

(declare-fun m!446741 () Bool)

(assert (=> start!41644 m!446741))

(declare-fun m!446743 () Bool)

(assert (=> b!464932 m!446743))

(declare-fun m!446745 () Bool)

(assert (=> b!464932 m!446745))

(declare-fun m!446747 () Bool)

(assert (=> b!464932 m!446747))

(declare-fun m!446749 () Bool)

(assert (=> mapNonEmpty!20788 m!446749))

(check-sat (not start!41644) (not mapNonEmpty!20788) (not b!464930) (not b!464932) tp_is_empty!12739 (not b!464927) (not b_next!11311) b_and!19633)
(check-sat b_and!19633 (not b_next!11311))
