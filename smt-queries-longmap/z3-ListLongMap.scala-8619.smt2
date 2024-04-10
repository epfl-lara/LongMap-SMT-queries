; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104982 () Bool)

(assert start!104982)

(declare-fun b_free!26751 () Bool)

(declare-fun b_next!26751 () Bool)

(assert (=> start!104982 (= b_free!26751 (not b_next!26751))))

(declare-fun tp!93749 () Bool)

(declare-fun b_and!44537 () Bool)

(assert (=> start!104982 (= tp!93749 b_and!44537)))

(declare-fun b!1251288 () Bool)

(declare-fun e!710515 () Bool)

(declare-fun e!710516 () Bool)

(assert (=> b!1251288 (= e!710515 (not e!710516))))

(declare-fun res!834592 () Bool)

(assert (=> b!1251288 (=> res!834592 e!710516)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251288 (= res!834592 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47569 0))(
  ( (V!47570 (val!15889 Int)) )
))
(declare-datatypes ((tuple2!20484 0))(
  ( (tuple2!20485 (_1!10253 (_ BitVec 64)) (_2!10253 V!47569)) )
))
(declare-datatypes ((List!27717 0))(
  ( (Nil!27714) (Cons!27713 (h!28922 tuple2!20484) (t!41192 List!27717)) )
))
(declare-datatypes ((ListLongMap!18357 0))(
  ( (ListLongMap!18358 (toList!9194 List!27717)) )
))
(declare-fun lt!564738 () ListLongMap!18357)

(declare-fun lt!564740 () ListLongMap!18357)

(assert (=> b!1251288 (= lt!564738 lt!564740)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47569)

(declare-datatypes ((Unit!41577 0))(
  ( (Unit!41578) )
))
(declare-fun lt!564739 () Unit!41577)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47569)

(declare-datatypes ((array!80970 0))(
  ( (array!80971 (arr!39050 (Array (_ BitVec 32) (_ BitVec 64))) (size!39586 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80970)

(declare-datatypes ((ValueCell!15063 0))(
  ( (ValueCellFull!15063 (v!18586 V!47569)) (EmptyCell!15063) )
))
(declare-datatypes ((array!80972 0))(
  ( (array!80973 (arr!39051 (Array (_ BitVec 32) ValueCell!15063)) (size!39587 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80972)

(declare-fun minValueBefore!43 () V!47569)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!957 (array!80970 array!80972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47569 V!47569 V!47569 V!47569 (_ BitVec 32) Int) Unit!41577)

(assert (=> b!1251288 (= lt!564739 (lemmaNoChangeToArrayThenSameMapNoExtras!957 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5593 (array!80970 array!80972 (_ BitVec 32) (_ BitVec 32) V!47569 V!47569 (_ BitVec 32) Int) ListLongMap!18357)

(assert (=> b!1251288 (= lt!564740 (getCurrentListMapNoExtraKeys!5593 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251288 (= lt!564738 (getCurrentListMapNoExtraKeys!5593 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49246 () Bool)

(declare-fun mapRes!49246 () Bool)

(assert (=> mapIsEmpty!49246 mapRes!49246))

(declare-fun b!1251289 () Bool)

(declare-fun res!834591 () Bool)

(assert (=> b!1251289 (=> (not res!834591) (not e!710515))))

(assert (=> b!1251289 (= res!834591 (and (= (size!39587 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39586 _keys!1118) (size!39587 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251290 () Bool)

(declare-fun e!710519 () Bool)

(assert (=> b!1251290 (= e!710519 true)))

(declare-fun lt!564737 () ListLongMap!18357)

(declare-fun -!2015 (ListLongMap!18357 (_ BitVec 64)) ListLongMap!18357)

(assert (=> b!1251290 (= (-!2015 lt!564737 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564737)))

(declare-fun lt!564741 () Unit!41577)

(declare-fun removeNotPresentStillSame!110 (ListLongMap!18357 (_ BitVec 64)) Unit!41577)

(assert (=> b!1251290 (= lt!564741 (removeNotPresentStillSame!110 lt!564737 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251291 () Bool)

(declare-fun e!710514 () Bool)

(declare-fun tp_is_empty!31653 () Bool)

(assert (=> b!1251291 (= e!710514 tp_is_empty!31653)))

(declare-fun res!834594 () Bool)

(assert (=> start!104982 (=> (not res!834594) (not e!710515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104982 (= res!834594 (validMask!0 mask!1466))))

(assert (=> start!104982 e!710515))

(assert (=> start!104982 true))

(assert (=> start!104982 tp!93749))

(assert (=> start!104982 tp_is_empty!31653))

(declare-fun array_inv!29789 (array!80970) Bool)

(assert (=> start!104982 (array_inv!29789 _keys!1118)))

(declare-fun e!710517 () Bool)

(declare-fun array_inv!29790 (array!80972) Bool)

(assert (=> start!104982 (and (array_inv!29790 _values!914) e!710517)))

(declare-fun b!1251292 () Bool)

(assert (=> b!1251292 (= e!710516 e!710519)))

(declare-fun res!834596 () Bool)

(assert (=> b!1251292 (=> res!834596 e!710519)))

(declare-fun contains!7505 (ListLongMap!18357 (_ BitVec 64)) Bool)

(assert (=> b!1251292 (= res!834596 (contains!7505 lt!564737 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4465 (array!80970 array!80972 (_ BitVec 32) (_ BitVec 32) V!47569 V!47569 (_ BitVec 32) Int) ListLongMap!18357)

(assert (=> b!1251292 (= lt!564737 (getCurrentListMap!4465 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49246 () Bool)

(declare-fun tp!93748 () Bool)

(declare-fun e!710518 () Bool)

(assert (=> mapNonEmpty!49246 (= mapRes!49246 (and tp!93748 e!710518))))

(declare-fun mapValue!49246 () ValueCell!15063)

(declare-fun mapRest!49246 () (Array (_ BitVec 32) ValueCell!15063))

(declare-fun mapKey!49246 () (_ BitVec 32))

(assert (=> mapNonEmpty!49246 (= (arr!39051 _values!914) (store mapRest!49246 mapKey!49246 mapValue!49246))))

(declare-fun b!1251293 () Bool)

(assert (=> b!1251293 (= e!710517 (and e!710514 mapRes!49246))))

(declare-fun condMapEmpty!49246 () Bool)

(declare-fun mapDefault!49246 () ValueCell!15063)

(assert (=> b!1251293 (= condMapEmpty!49246 (= (arr!39051 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15063)) mapDefault!49246)))))

(declare-fun b!1251294 () Bool)

(declare-fun res!834593 () Bool)

(assert (=> b!1251294 (=> (not res!834593) (not e!710515))))

(declare-datatypes ((List!27718 0))(
  ( (Nil!27715) (Cons!27714 (h!28923 (_ BitVec 64)) (t!41193 List!27718)) )
))
(declare-fun arrayNoDuplicates!0 (array!80970 (_ BitVec 32) List!27718) Bool)

(assert (=> b!1251294 (= res!834593 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27715))))

(declare-fun b!1251295 () Bool)

(assert (=> b!1251295 (= e!710518 tp_is_empty!31653)))

(declare-fun b!1251296 () Bool)

(declare-fun res!834595 () Bool)

(assert (=> b!1251296 (=> (not res!834595) (not e!710515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80970 (_ BitVec 32)) Bool)

(assert (=> b!1251296 (= res!834595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104982 res!834594) b!1251289))

(assert (= (and b!1251289 res!834591) b!1251296))

(assert (= (and b!1251296 res!834595) b!1251294))

(assert (= (and b!1251294 res!834593) b!1251288))

(assert (= (and b!1251288 (not res!834592)) b!1251292))

(assert (= (and b!1251292 (not res!834596)) b!1251290))

(assert (= (and b!1251293 condMapEmpty!49246) mapIsEmpty!49246))

(assert (= (and b!1251293 (not condMapEmpty!49246)) mapNonEmpty!49246))

(get-info :version)

(assert (= (and mapNonEmpty!49246 ((_ is ValueCellFull!15063) mapValue!49246)) b!1251295))

(assert (= (and b!1251293 ((_ is ValueCellFull!15063) mapDefault!49246)) b!1251291))

(assert (= start!104982 b!1251293))

(declare-fun m!1152061 () Bool)

(assert (=> start!104982 m!1152061))

(declare-fun m!1152063 () Bool)

(assert (=> start!104982 m!1152063))

(declare-fun m!1152065 () Bool)

(assert (=> start!104982 m!1152065))

(declare-fun m!1152067 () Bool)

(assert (=> b!1251292 m!1152067))

(declare-fun m!1152069 () Bool)

(assert (=> b!1251292 m!1152069))

(declare-fun m!1152071 () Bool)

(assert (=> mapNonEmpty!49246 m!1152071))

(declare-fun m!1152073 () Bool)

(assert (=> b!1251296 m!1152073))

(declare-fun m!1152075 () Bool)

(assert (=> b!1251290 m!1152075))

(declare-fun m!1152077 () Bool)

(assert (=> b!1251290 m!1152077))

(declare-fun m!1152079 () Bool)

(assert (=> b!1251294 m!1152079))

(declare-fun m!1152081 () Bool)

(assert (=> b!1251288 m!1152081))

(declare-fun m!1152083 () Bool)

(assert (=> b!1251288 m!1152083))

(declare-fun m!1152085 () Bool)

(assert (=> b!1251288 m!1152085))

(check-sat (not b!1251292) tp_is_empty!31653 (not b!1251290) b_and!44537 (not b!1251288) (not start!104982) (not mapNonEmpty!49246) (not b_next!26751) (not b!1251294) (not b!1251296))
(check-sat b_and!44537 (not b_next!26751))
