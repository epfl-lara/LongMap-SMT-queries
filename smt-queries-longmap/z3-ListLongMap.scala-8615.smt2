; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105180 () Bool)

(assert start!105180)

(declare-fun b_free!26725 () Bool)

(declare-fun b_next!26725 () Bool)

(assert (=> start!105180 (= b_free!26725 (not b_next!26725))))

(declare-fun tp!93670 () Bool)

(declare-fun b_and!44513 () Bool)

(assert (=> start!105180 (= tp!93670 b_and!44513)))

(declare-fun b!1252242 () Bool)

(declare-fun e!711092 () Bool)

(assert (=> b!1252242 (= e!711092 true)))

(declare-datatypes ((V!47535 0))(
  ( (V!47536 (val!15876 Int)) )
))
(declare-datatypes ((tuple2!20496 0))(
  ( (tuple2!20497 (_1!10259 (_ BitVec 64)) (_2!10259 V!47535)) )
))
(declare-datatypes ((List!27744 0))(
  ( (Nil!27741) (Cons!27740 (h!28958 tuple2!20496) (t!41211 List!27744)) )
))
(declare-datatypes ((ListLongMap!18377 0))(
  ( (ListLongMap!18378 (toList!9204 List!27744)) )
))
(declare-fun lt!565029 () ListLongMap!18377)

(declare-fun -!1990 (ListLongMap!18377 (_ BitVec 64)) ListLongMap!18377)

(assert (=> b!1252242 (= (-!1990 lt!565029 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565029)))

(declare-datatypes ((Unit!41546 0))(
  ( (Unit!41547) )
))
(declare-fun lt!565027 () Unit!41546)

(declare-fun removeNotPresentStillSame!100 (ListLongMap!18377 (_ BitVec 64)) Unit!41546)

(assert (=> b!1252242 (= lt!565027 (removeNotPresentStillSame!100 lt!565029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1252243 () Bool)

(declare-fun res!834878 () Bool)

(declare-fun e!711089 () Bool)

(assert (=> b!1252243 (=> (not res!834878) (not e!711089))))

(declare-datatypes ((array!80969 0))(
  ( (array!80970 (arr!39045 (Array (_ BitVec 32) (_ BitVec 64))) (size!39582 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80969)

(declare-datatypes ((List!27745 0))(
  ( (Nil!27742) (Cons!27741 (h!28959 (_ BitVec 64)) (t!41212 List!27745)) )
))
(declare-fun arrayNoDuplicates!0 (array!80969 (_ BitVec 32) List!27745) Bool)

(assert (=> b!1252243 (= res!834878 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27742))))

(declare-fun b!1252244 () Bool)

(declare-fun e!711090 () Bool)

(declare-fun tp_is_empty!31627 () Bool)

(assert (=> b!1252244 (= e!711090 tp_is_empty!31627)))

(declare-fun b!1252245 () Bool)

(declare-fun e!711091 () Bool)

(declare-fun mapRes!49207 () Bool)

(assert (=> b!1252245 (= e!711091 (and e!711090 mapRes!49207))))

(declare-fun condMapEmpty!49207 () Bool)

(declare-datatypes ((ValueCell!15050 0))(
  ( (ValueCellFull!15050 (v!18569 V!47535)) (EmptyCell!15050) )
))
(declare-datatypes ((array!80971 0))(
  ( (array!80972 (arr!39046 (Array (_ BitVec 32) ValueCell!15050)) (size!39583 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80971)

(declare-fun mapDefault!49207 () ValueCell!15050)

(assert (=> b!1252245 (= condMapEmpty!49207 (= (arr!39046 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15050)) mapDefault!49207)))))

(declare-fun b!1252246 () Bool)

(declare-fun e!711094 () Bool)

(assert (=> b!1252246 (= e!711094 e!711092)))

(declare-fun res!834882 () Bool)

(assert (=> b!1252246 (=> res!834882 e!711092)))

(declare-fun contains!7529 (ListLongMap!18377 (_ BitVec 64)) Bool)

(assert (=> b!1252246 (= res!834882 (contains!7529 lt!565029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47535)

(declare-fun minValueBefore!43 () V!47535)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun getCurrentListMap!4465 (array!80969 array!80971 (_ BitVec 32) (_ BitVec 32) V!47535 V!47535 (_ BitVec 32) Int) ListLongMap!18377)

(assert (=> b!1252246 (= lt!565029 (getCurrentListMap!4465 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252247 () Bool)

(declare-fun e!711093 () Bool)

(assert (=> b!1252247 (= e!711093 tp_is_empty!31627)))

(declare-fun b!1252248 () Bool)

(declare-fun res!834880 () Bool)

(assert (=> b!1252248 (=> (not res!834880) (not e!711089))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252248 (= res!834880 (and (= (size!39583 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39582 _keys!1118) (size!39583 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252249 () Bool)

(declare-fun res!834881 () Bool)

(assert (=> b!1252249 (=> (not res!834881) (not e!711089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80969 (_ BitVec 32)) Bool)

(assert (=> b!1252249 (= res!834881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252250 () Bool)

(assert (=> b!1252250 (= e!711089 (not e!711094))))

(declare-fun res!834879 () Bool)

(assert (=> b!1252250 (=> res!834879 e!711094)))

(assert (=> b!1252250 (= res!834879 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!565026 () ListLongMap!18377)

(declare-fun lt!565030 () ListLongMap!18377)

(assert (=> b!1252250 (= lt!565026 lt!565030)))

(declare-fun lt!565028 () Unit!41546)

(declare-fun minValueAfter!43 () V!47535)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!948 (array!80969 array!80971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47535 V!47535 V!47535 V!47535 (_ BitVec 32) Int) Unit!41546)

(assert (=> b!1252250 (= lt!565028 (lemmaNoChangeToArrayThenSameMapNoExtras!948 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5634 (array!80969 array!80971 (_ BitVec 32) (_ BitVec 32) V!47535 V!47535 (_ BitVec 32) Int) ListLongMap!18377)

(assert (=> b!1252250 (= lt!565030 (getCurrentListMapNoExtraKeys!5634 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252250 (= lt!565026 (getCurrentListMapNoExtraKeys!5634 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49207 () Bool)

(declare-fun tp!93671 () Bool)

(assert (=> mapNonEmpty!49207 (= mapRes!49207 (and tp!93671 e!711093))))

(declare-fun mapRest!49207 () (Array (_ BitVec 32) ValueCell!15050))

(declare-fun mapKey!49207 () (_ BitVec 32))

(declare-fun mapValue!49207 () ValueCell!15050)

(assert (=> mapNonEmpty!49207 (= (arr!39046 _values!914) (store mapRest!49207 mapKey!49207 mapValue!49207))))

(declare-fun res!834877 () Bool)

(assert (=> start!105180 (=> (not res!834877) (not e!711089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105180 (= res!834877 (validMask!0 mask!1466))))

(assert (=> start!105180 e!711089))

(assert (=> start!105180 true))

(assert (=> start!105180 tp!93670))

(assert (=> start!105180 tp_is_empty!31627))

(declare-fun array_inv!29901 (array!80969) Bool)

(assert (=> start!105180 (array_inv!29901 _keys!1118)))

(declare-fun array_inv!29902 (array!80971) Bool)

(assert (=> start!105180 (and (array_inv!29902 _values!914) e!711091)))

(declare-fun mapIsEmpty!49207 () Bool)

(assert (=> mapIsEmpty!49207 mapRes!49207))

(assert (= (and start!105180 res!834877) b!1252248))

(assert (= (and b!1252248 res!834880) b!1252249))

(assert (= (and b!1252249 res!834881) b!1252243))

(assert (= (and b!1252243 res!834878) b!1252250))

(assert (= (and b!1252250 (not res!834879)) b!1252246))

(assert (= (and b!1252246 (not res!834882)) b!1252242))

(assert (= (and b!1252245 condMapEmpty!49207) mapIsEmpty!49207))

(assert (= (and b!1252245 (not condMapEmpty!49207)) mapNonEmpty!49207))

(get-info :version)

(assert (= (and mapNonEmpty!49207 ((_ is ValueCellFull!15050) mapValue!49207)) b!1252247))

(assert (= (and b!1252245 ((_ is ValueCellFull!15050) mapDefault!49207)) b!1252244))

(assert (= start!105180 b!1252245))

(declare-fun m!1153335 () Bool)

(assert (=> start!105180 m!1153335))

(declare-fun m!1153337 () Bool)

(assert (=> start!105180 m!1153337))

(declare-fun m!1153339 () Bool)

(assert (=> start!105180 m!1153339))

(declare-fun m!1153341 () Bool)

(assert (=> mapNonEmpty!49207 m!1153341))

(declare-fun m!1153343 () Bool)

(assert (=> b!1252242 m!1153343))

(declare-fun m!1153345 () Bool)

(assert (=> b!1252242 m!1153345))

(declare-fun m!1153347 () Bool)

(assert (=> b!1252246 m!1153347))

(declare-fun m!1153349 () Bool)

(assert (=> b!1252246 m!1153349))

(declare-fun m!1153351 () Bool)

(assert (=> b!1252243 m!1153351))

(declare-fun m!1153353 () Bool)

(assert (=> b!1252249 m!1153353))

(declare-fun m!1153355 () Bool)

(assert (=> b!1252250 m!1153355))

(declare-fun m!1153357 () Bool)

(assert (=> b!1252250 m!1153357))

(declare-fun m!1153359 () Bool)

(assert (=> b!1252250 m!1153359))

(check-sat b_and!44513 (not start!105180) (not b!1252243) (not b!1252242) (not b!1252246) tp_is_empty!31627 (not b!1252249) (not b_next!26725) (not b!1252250) (not mapNonEmpty!49207))
(check-sat b_and!44513 (not b_next!26725))
