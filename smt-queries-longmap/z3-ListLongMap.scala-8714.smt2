; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105736 () Bool)

(assert start!105736)

(declare-fun b_free!27321 () Bool)

(declare-fun b_next!27321 () Bool)

(assert (=> start!105736 (= b_free!27321 (not b_next!27321))))

(declare-fun tp!95489 () Bool)

(declare-fun b_and!45205 () Bool)

(assert (=> start!105736 (= tp!95489 b_and!45205)))

(declare-fun res!839461 () Bool)

(declare-fun e!716574 () Bool)

(assert (=> start!105736 (=> (not res!839461) (not e!716574))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105736 (= res!839461 (validMask!0 mask!1466))))

(assert (=> start!105736 e!716574))

(assert (=> start!105736 true))

(assert (=> start!105736 tp!95489))

(declare-fun tp_is_empty!32223 () Bool)

(assert (=> start!105736 tp_is_empty!32223))

(declare-datatypes ((array!82064 0))(
  ( (array!82065 (arr!39587 (Array (_ BitVec 32) (_ BitVec 64))) (size!40123 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82064)

(declare-fun array_inv!30141 (array!82064) Bool)

(assert (=> start!105736 (array_inv!30141 _keys!1118)))

(declare-datatypes ((V!48329 0))(
  ( (V!48330 (val!16174 Int)) )
))
(declare-datatypes ((ValueCell!15348 0))(
  ( (ValueCellFull!15348 (v!18876 V!48329)) (EmptyCell!15348) )
))
(declare-datatypes ((array!82066 0))(
  ( (array!82067 (arr!39588 (Array (_ BitVec 32) ValueCell!15348)) (size!40124 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82066)

(declare-fun e!716573 () Bool)

(declare-fun array_inv!30142 (array!82066) Bool)

(assert (=> start!105736 (and (array_inv!30142 _values!914) e!716573)))

(declare-fun b!1259554 () Bool)

(declare-fun res!839458 () Bool)

(assert (=> b!1259554 (=> (not res!839458) (not e!716574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82064 (_ BitVec 32)) Bool)

(assert (=> b!1259554 (= res!839458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259555 () Bool)

(declare-fun res!839460 () Bool)

(assert (=> b!1259555 (=> (not res!839460) (not e!716574))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1259555 (= res!839460 (and (= (size!40124 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40123 _keys!1118) (size!40124 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50131 () Bool)

(declare-fun mapRes!50131 () Bool)

(declare-fun tp!95488 () Bool)

(declare-fun e!716577 () Bool)

(assert (=> mapNonEmpty!50131 (= mapRes!50131 (and tp!95488 e!716577))))

(declare-fun mapValue!50131 () ValueCell!15348)

(declare-fun mapKey!50131 () (_ BitVec 32))

(declare-fun mapRest!50131 () (Array (_ BitVec 32) ValueCell!15348))

(assert (=> mapNonEmpty!50131 (= (arr!39588 _values!914) (store mapRest!50131 mapKey!50131 mapValue!50131))))

(declare-fun b!1259556 () Bool)

(assert (=> b!1259556 (= e!716577 tp_is_empty!32223)))

(declare-fun b!1259557 () Bool)

(declare-fun e!716571 () Bool)

(assert (=> b!1259557 (= e!716571 tp_is_empty!32223)))

(declare-fun b!1259558 () Bool)

(declare-fun e!716572 () Bool)

(assert (=> b!1259558 (= e!716572 true)))

(declare-datatypes ((tuple2!20910 0))(
  ( (tuple2!20911 (_1!10466 (_ BitVec 64)) (_2!10466 V!48329)) )
))
(declare-datatypes ((List!28115 0))(
  ( (Nil!28112) (Cons!28111 (h!29320 tuple2!20910) (t!41610 List!28115)) )
))
(declare-datatypes ((ListLongMap!18783 0))(
  ( (ListLongMap!18784 (toList!9407 List!28115)) )
))
(declare-fun lt!570201 () ListLongMap!18783)

(declare-fun lt!570205 () ListLongMap!18783)

(declare-fun -!2113 (ListLongMap!18783 (_ BitVec 64)) ListLongMap!18783)

(assert (=> b!1259558 (= lt!570201 (-!2113 lt!570205 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570198 () ListLongMap!18783)

(declare-fun lt!570204 () ListLongMap!18783)

(assert (=> b!1259558 (= (-!2113 lt!570198 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570204)))

(declare-datatypes ((Unit!41997 0))(
  ( (Unit!41998) )
))
(declare-fun lt!570197 () Unit!41997)

(declare-fun minValueBefore!43 () V!48329)

(declare-fun addThenRemoveForNewKeyIsSame!350 (ListLongMap!18783 (_ BitVec 64) V!48329) Unit!41997)

(assert (=> b!1259558 (= lt!570197 (addThenRemoveForNewKeyIsSame!350 lt!570204 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716575 () Bool)

(assert (=> b!1259558 e!716575))

(declare-fun res!839463 () Bool)

(assert (=> b!1259558 (=> (not res!839463) (not e!716575))))

(assert (=> b!1259558 (= res!839463 (= lt!570205 lt!570198))))

(declare-fun +!4211 (ListLongMap!18783 tuple2!20910) ListLongMap!18783)

(assert (=> b!1259558 (= lt!570198 (+!4211 lt!570204 (tuple2!20911 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570200 () ListLongMap!18783)

(declare-fun lt!570203 () tuple2!20910)

(assert (=> b!1259558 (= lt!570204 (+!4211 lt!570200 lt!570203))))

(declare-fun zeroValue!871 () V!48329)

(assert (=> b!1259558 (= lt!570203 (tuple2!20911 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48329)

(declare-fun lt!570199 () ListLongMap!18783)

(declare-fun getCurrentListMap!4604 (array!82064 array!82066 (_ BitVec 32) (_ BitVec 32) V!48329 V!48329 (_ BitVec 32) Int) ListLongMap!18783)

(assert (=> b!1259558 (= lt!570199 (getCurrentListMap!4604 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259558 (= lt!570205 (getCurrentListMap!4604 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50131 () Bool)

(assert (=> mapIsEmpty!50131 mapRes!50131))

(declare-fun b!1259559 () Bool)

(declare-fun res!839462 () Bool)

(assert (=> b!1259559 (=> (not res!839462) (not e!716574))))

(declare-datatypes ((List!28116 0))(
  ( (Nil!28113) (Cons!28112 (h!29321 (_ BitVec 64)) (t!41611 List!28116)) )
))
(declare-fun arrayNoDuplicates!0 (array!82064 (_ BitVec 32) List!28116) Bool)

(assert (=> b!1259559 (= res!839462 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28113))))

(declare-fun b!1259560 () Bool)

(declare-fun lt!570202 () ListLongMap!18783)

(assert (=> b!1259560 (= e!716575 (= lt!570199 (+!4211 lt!570202 lt!570203)))))

(declare-fun b!1259561 () Bool)

(assert (=> b!1259561 (= e!716573 (and e!716571 mapRes!50131))))

(declare-fun condMapEmpty!50131 () Bool)

(declare-fun mapDefault!50131 () ValueCell!15348)

(assert (=> b!1259561 (= condMapEmpty!50131 (= (arr!39588 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15348)) mapDefault!50131)))))

(declare-fun b!1259562 () Bool)

(assert (=> b!1259562 (= e!716574 (not e!716572))))

(declare-fun res!839459 () Bool)

(assert (=> b!1259562 (=> res!839459 e!716572)))

(assert (=> b!1259562 (= res!839459 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259562 (= lt!570200 lt!570202)))

(declare-fun lt!570206 () Unit!41997)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1147 (array!82064 array!82066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48329 V!48329 V!48329 V!48329 (_ BitVec 32) Int) Unit!41997)

(assert (=> b!1259562 (= lt!570206 (lemmaNoChangeToArrayThenSameMapNoExtras!1147 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5783 (array!82064 array!82066 (_ BitVec 32) (_ BitVec 32) V!48329 V!48329 (_ BitVec 32) Int) ListLongMap!18783)

(assert (=> b!1259562 (= lt!570202 (getCurrentListMapNoExtraKeys!5783 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259562 (= lt!570200 (getCurrentListMapNoExtraKeys!5783 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105736 res!839461) b!1259555))

(assert (= (and b!1259555 res!839460) b!1259554))

(assert (= (and b!1259554 res!839458) b!1259559))

(assert (= (and b!1259559 res!839462) b!1259562))

(assert (= (and b!1259562 (not res!839459)) b!1259558))

(assert (= (and b!1259558 res!839463) b!1259560))

(assert (= (and b!1259561 condMapEmpty!50131) mapIsEmpty!50131))

(assert (= (and b!1259561 (not condMapEmpty!50131)) mapNonEmpty!50131))

(get-info :version)

(assert (= (and mapNonEmpty!50131 ((_ is ValueCellFull!15348) mapValue!50131)) b!1259556))

(assert (= (and b!1259561 ((_ is ValueCellFull!15348) mapDefault!50131)) b!1259557))

(assert (= start!105736 b!1259561))

(declare-fun m!1160059 () Bool)

(assert (=> b!1259554 m!1160059))

(declare-fun m!1160061 () Bool)

(assert (=> start!105736 m!1160061))

(declare-fun m!1160063 () Bool)

(assert (=> start!105736 m!1160063))

(declare-fun m!1160065 () Bool)

(assert (=> start!105736 m!1160065))

(declare-fun m!1160067 () Bool)

(assert (=> b!1259559 m!1160067))

(declare-fun m!1160069 () Bool)

(assert (=> mapNonEmpty!50131 m!1160069))

(declare-fun m!1160071 () Bool)

(assert (=> b!1259558 m!1160071))

(declare-fun m!1160073 () Bool)

(assert (=> b!1259558 m!1160073))

(declare-fun m!1160075 () Bool)

(assert (=> b!1259558 m!1160075))

(declare-fun m!1160077 () Bool)

(assert (=> b!1259558 m!1160077))

(declare-fun m!1160079 () Bool)

(assert (=> b!1259558 m!1160079))

(declare-fun m!1160081 () Bool)

(assert (=> b!1259558 m!1160081))

(declare-fun m!1160083 () Bool)

(assert (=> b!1259558 m!1160083))

(declare-fun m!1160085 () Bool)

(assert (=> b!1259562 m!1160085))

(declare-fun m!1160087 () Bool)

(assert (=> b!1259562 m!1160087))

(declare-fun m!1160089 () Bool)

(assert (=> b!1259562 m!1160089))

(declare-fun m!1160091 () Bool)

(assert (=> b!1259560 m!1160091))

(check-sat (not start!105736) (not b!1259558) (not b!1259554) tp_is_empty!32223 (not mapNonEmpty!50131) (not b_next!27321) (not b!1259560) b_and!45205 (not b!1259559) (not b!1259562))
(check-sat b_and!45205 (not b_next!27321))
