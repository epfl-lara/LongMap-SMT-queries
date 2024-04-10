; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104958 () Bool)

(assert start!104958)

(declare-fun b_free!26727 () Bool)

(declare-fun b_next!26727 () Bool)

(assert (=> start!104958 (= b_free!26727 (not b_next!26727))))

(declare-fun tp!93677 () Bool)

(declare-fun b_and!44513 () Bool)

(assert (=> start!104958 (= tp!93677 b_and!44513)))

(declare-fun b!1250964 () Bool)

(declare-fun e!710265 () Bool)

(declare-fun e!710264 () Bool)

(assert (=> b!1250964 (= e!710265 e!710264)))

(declare-fun res!834380 () Bool)

(assert (=> b!1250964 (=> res!834380 e!710264)))

(declare-datatypes ((V!47537 0))(
  ( (V!47538 (val!15877 Int)) )
))
(declare-datatypes ((tuple2!20464 0))(
  ( (tuple2!20465 (_1!10243 (_ BitVec 64)) (_2!10243 V!47537)) )
))
(declare-datatypes ((List!27700 0))(
  ( (Nil!27697) (Cons!27696 (h!28905 tuple2!20464) (t!41175 List!27700)) )
))
(declare-datatypes ((ListLongMap!18337 0))(
  ( (ListLongMap!18338 (toList!9184 List!27700)) )
))
(declare-fun lt!564558 () ListLongMap!18337)

(declare-fun contains!7497 (ListLongMap!18337 (_ BitVec 64)) Bool)

(assert (=> b!1250964 (= res!834380 (contains!7497 lt!564558 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47537)

(declare-datatypes ((array!80926 0))(
  ( (array!80927 (arr!39028 (Array (_ BitVec 32) (_ BitVec 64))) (size!39564 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80926)

(declare-datatypes ((ValueCell!15051 0))(
  ( (ValueCellFull!15051 (v!18574 V!47537)) (EmptyCell!15051) )
))
(declare-datatypes ((array!80928 0))(
  ( (array!80929 (arr!39029 (Array (_ BitVec 32) ValueCell!15051)) (size!39565 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80928)

(declare-fun minValueBefore!43 () V!47537)

(declare-fun getCurrentListMap!4457 (array!80926 array!80928 (_ BitVec 32) (_ BitVec 32) V!47537 V!47537 (_ BitVec 32) Int) ListLongMap!18337)

(assert (=> b!1250964 (= lt!564558 (getCurrentListMap!4457 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250965 () Bool)

(declare-fun e!710262 () Bool)

(declare-fun tp_is_empty!31629 () Bool)

(assert (=> b!1250965 (= e!710262 tp_is_empty!31629)))

(declare-fun b!1250966 () Bool)

(declare-fun e!710267 () Bool)

(declare-fun mapRes!49210 () Bool)

(assert (=> b!1250966 (= e!710267 (and e!710262 mapRes!49210))))

(declare-fun condMapEmpty!49210 () Bool)

(declare-fun mapDefault!49210 () ValueCell!15051)

(assert (=> b!1250966 (= condMapEmpty!49210 (= (arr!39029 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15051)) mapDefault!49210)))))

(declare-fun mapIsEmpty!49210 () Bool)

(assert (=> mapIsEmpty!49210 mapRes!49210))

(declare-fun res!834377 () Bool)

(declare-fun e!710266 () Bool)

(assert (=> start!104958 (=> (not res!834377) (not e!710266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104958 (= res!834377 (validMask!0 mask!1466))))

(assert (=> start!104958 e!710266))

(assert (=> start!104958 true))

(assert (=> start!104958 tp!93677))

(assert (=> start!104958 tp_is_empty!31629))

(declare-fun array_inv!29771 (array!80926) Bool)

(assert (=> start!104958 (array_inv!29771 _keys!1118)))

(declare-fun array_inv!29772 (array!80928) Bool)

(assert (=> start!104958 (and (array_inv!29772 _values!914) e!710267)))

(declare-fun b!1250967 () Bool)

(declare-fun e!710268 () Bool)

(assert (=> b!1250967 (= e!710268 tp_is_empty!31629)))

(declare-fun mapNonEmpty!49210 () Bool)

(declare-fun tp!93676 () Bool)

(assert (=> mapNonEmpty!49210 (= mapRes!49210 (and tp!93676 e!710268))))

(declare-fun mapRest!49210 () (Array (_ BitVec 32) ValueCell!15051))

(declare-fun mapKey!49210 () (_ BitVec 32))

(declare-fun mapValue!49210 () ValueCell!15051)

(assert (=> mapNonEmpty!49210 (= (arr!39029 _values!914) (store mapRest!49210 mapKey!49210 mapValue!49210))))

(declare-fun b!1250968 () Bool)

(assert (=> b!1250968 (= e!710264 true)))

(declare-fun -!2007 (ListLongMap!18337 (_ BitVec 64)) ListLongMap!18337)

(assert (=> b!1250968 (= (-!2007 lt!564558 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564558)))

(declare-datatypes ((Unit!41557 0))(
  ( (Unit!41558) )
))
(declare-fun lt!564559 () Unit!41557)

(declare-fun removeNotPresentStillSame!102 (ListLongMap!18337 (_ BitVec 64)) Unit!41557)

(assert (=> b!1250968 (= lt!564559 (removeNotPresentStillSame!102 lt!564558 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250969 () Bool)

(declare-fun res!834376 () Bool)

(assert (=> b!1250969 (=> (not res!834376) (not e!710266))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250969 (= res!834376 (and (= (size!39565 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39564 _keys!1118) (size!39565 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250970 () Bool)

(declare-fun res!834375 () Bool)

(assert (=> b!1250970 (=> (not res!834375) (not e!710266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80926 (_ BitVec 32)) Bool)

(assert (=> b!1250970 (= res!834375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250971 () Bool)

(declare-fun res!834379 () Bool)

(assert (=> b!1250971 (=> (not res!834379) (not e!710266))))

(declare-datatypes ((List!27701 0))(
  ( (Nil!27698) (Cons!27697 (h!28906 (_ BitVec 64)) (t!41176 List!27701)) )
))
(declare-fun arrayNoDuplicates!0 (array!80926 (_ BitVec 32) List!27701) Bool)

(assert (=> b!1250971 (= res!834379 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27698))))

(declare-fun b!1250972 () Bool)

(assert (=> b!1250972 (= e!710266 (not e!710265))))

(declare-fun res!834378 () Bool)

(assert (=> b!1250972 (=> res!834378 e!710265)))

(assert (=> b!1250972 (= res!834378 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564560 () ListLongMap!18337)

(declare-fun lt!564561 () ListLongMap!18337)

(assert (=> b!1250972 (= lt!564560 lt!564561)))

(declare-fun lt!564557 () Unit!41557)

(declare-fun minValueAfter!43 () V!47537)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!947 (array!80926 array!80928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47537 V!47537 V!47537 V!47537 (_ BitVec 32) Int) Unit!41557)

(assert (=> b!1250972 (= lt!564557 (lemmaNoChangeToArrayThenSameMapNoExtras!947 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5583 (array!80926 array!80928 (_ BitVec 32) (_ BitVec 32) V!47537 V!47537 (_ BitVec 32) Int) ListLongMap!18337)

(assert (=> b!1250972 (= lt!564561 (getCurrentListMapNoExtraKeys!5583 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250972 (= lt!564560 (getCurrentListMapNoExtraKeys!5583 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104958 res!834377) b!1250969))

(assert (= (and b!1250969 res!834376) b!1250970))

(assert (= (and b!1250970 res!834375) b!1250971))

(assert (= (and b!1250971 res!834379) b!1250972))

(assert (= (and b!1250972 (not res!834378)) b!1250964))

(assert (= (and b!1250964 (not res!834380)) b!1250968))

(assert (= (and b!1250966 condMapEmpty!49210) mapIsEmpty!49210))

(assert (= (and b!1250966 (not condMapEmpty!49210)) mapNonEmpty!49210))

(get-info :version)

(assert (= (and mapNonEmpty!49210 ((_ is ValueCellFull!15051) mapValue!49210)) b!1250967))

(assert (= (and b!1250966 ((_ is ValueCellFull!15051) mapDefault!49210)) b!1250965))

(assert (= start!104958 b!1250966))

(declare-fun m!1151749 () Bool)

(assert (=> mapNonEmpty!49210 m!1151749))

(declare-fun m!1151751 () Bool)

(assert (=> b!1250972 m!1151751))

(declare-fun m!1151753 () Bool)

(assert (=> b!1250972 m!1151753))

(declare-fun m!1151755 () Bool)

(assert (=> b!1250972 m!1151755))

(declare-fun m!1151757 () Bool)

(assert (=> b!1250971 m!1151757))

(declare-fun m!1151759 () Bool)

(assert (=> start!104958 m!1151759))

(declare-fun m!1151761 () Bool)

(assert (=> start!104958 m!1151761))

(declare-fun m!1151763 () Bool)

(assert (=> start!104958 m!1151763))

(declare-fun m!1151765 () Bool)

(assert (=> b!1250964 m!1151765))

(declare-fun m!1151767 () Bool)

(assert (=> b!1250964 m!1151767))

(declare-fun m!1151769 () Bool)

(assert (=> b!1250968 m!1151769))

(declare-fun m!1151771 () Bool)

(assert (=> b!1250968 m!1151771))

(declare-fun m!1151773 () Bool)

(assert (=> b!1250970 m!1151773))

(check-sat b_and!44513 (not b!1250964) (not start!104958) (not b!1250970) (not b!1250968) (not mapNonEmpty!49210) tp_is_empty!31629 (not b!1250971) (not b!1250972) (not b_next!26727))
(check-sat b_and!44513 (not b_next!26727))
