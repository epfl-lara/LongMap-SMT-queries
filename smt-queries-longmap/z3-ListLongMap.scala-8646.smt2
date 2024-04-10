; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105196 () Bool)

(assert start!105196)

(declare-fun b_free!26913 () Bool)

(declare-fun b_next!26913 () Bool)

(assert (=> start!105196 (= b_free!26913 (not b_next!26913))))

(declare-fun tp!94243 () Bool)

(declare-fun b_and!44727 () Bool)

(assert (=> start!105196 (= tp!94243 b_and!44727)))

(declare-fun b!1253581 () Bool)

(declare-fun e!712183 () Bool)

(declare-fun e!712180 () Bool)

(assert (=> b!1253581 (= e!712183 (not e!712180))))

(declare-fun res!835915 () Bool)

(assert (=> b!1253581 (=> res!835915 e!712180)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253581 (= res!835915 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47785 0))(
  ( (V!47786 (val!15970 Int)) )
))
(declare-datatypes ((tuple2!20608 0))(
  ( (tuple2!20609 (_1!10315 (_ BitVec 64)) (_2!10315 V!47785)) )
))
(declare-datatypes ((List!27838 0))(
  ( (Nil!27835) (Cons!27834 (h!29043 tuple2!20608) (t!41319 List!27838)) )
))
(declare-datatypes ((ListLongMap!18481 0))(
  ( (ListLongMap!18482 (toList!9256 List!27838)) )
))
(declare-fun lt!566116 () ListLongMap!18481)

(declare-fun lt!566113 () ListLongMap!18481)

(assert (=> b!1253581 (= lt!566116 lt!566113)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!47785)

(declare-fun zeroValue!871 () V!47785)

(declare-datatypes ((array!81288 0))(
  ( (array!81289 (arr!39206 (Array (_ BitVec 32) (_ BitVec 64))) (size!39742 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81288)

(declare-datatypes ((ValueCell!15144 0))(
  ( (ValueCellFull!15144 (v!18668 V!47785)) (EmptyCell!15144) )
))
(declare-datatypes ((array!81290 0))(
  ( (array!81291 (arr!39207 (Array (_ BitVec 32) ValueCell!15144)) (size!39743 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81290)

(declare-fun minValueBefore!43 () V!47785)

(declare-datatypes ((Unit!41694 0))(
  ( (Unit!41695) )
))
(declare-fun lt!566115 () Unit!41694)

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1011 (array!81288 array!81290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47785 V!47785 V!47785 V!47785 (_ BitVec 32) Int) Unit!41694)

(assert (=> b!1253581 (= lt!566115 (lemmaNoChangeToArrayThenSameMapNoExtras!1011 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5647 (array!81288 array!81290 (_ BitVec 32) (_ BitVec 32) V!47785 V!47785 (_ BitVec 32) Int) ListLongMap!18481)

(assert (=> b!1253581 (= lt!566113 (getCurrentListMapNoExtraKeys!5647 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253581 (= lt!566116 (getCurrentListMapNoExtraKeys!5647 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49498 () Bool)

(declare-fun mapRes!49498 () Bool)

(assert (=> mapIsEmpty!49498 mapRes!49498))

(declare-fun b!1253582 () Bool)

(declare-fun res!835919 () Bool)

(assert (=> b!1253582 (=> (not res!835919) (not e!712183))))

(declare-datatypes ((List!27839 0))(
  ( (Nil!27836) (Cons!27835 (h!29044 (_ BitVec 64)) (t!41320 List!27839)) )
))
(declare-fun arrayNoDuplicates!0 (array!81288 (_ BitVec 32) List!27839) Bool)

(assert (=> b!1253582 (= res!835919 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27836))))

(declare-fun b!1253583 () Bool)

(declare-fun e!712185 () Bool)

(declare-fun tp_is_empty!31815 () Bool)

(assert (=> b!1253583 (= e!712185 tp_is_empty!31815)))

(declare-fun res!835916 () Bool)

(assert (=> start!105196 (=> (not res!835916) (not e!712183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105196 (= res!835916 (validMask!0 mask!1466))))

(assert (=> start!105196 e!712183))

(assert (=> start!105196 true))

(assert (=> start!105196 tp!94243))

(assert (=> start!105196 tp_is_empty!31815))

(declare-fun array_inv!29887 (array!81288) Bool)

(assert (=> start!105196 (array_inv!29887 _keys!1118)))

(declare-fun e!712181 () Bool)

(declare-fun array_inv!29888 (array!81290) Bool)

(assert (=> start!105196 (and (array_inv!29888 _values!914) e!712181)))

(declare-fun b!1253584 () Bool)

(declare-fun res!835918 () Bool)

(assert (=> b!1253584 (=> (not res!835918) (not e!712183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81288 (_ BitVec 32)) Bool)

(assert (=> b!1253584 (= res!835918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253585 () Bool)

(declare-fun e!712184 () Bool)

(assert (=> b!1253585 (= e!712184 tp_is_empty!31815)))

(declare-fun b!1253586 () Bool)

(assert (=> b!1253586 (= e!712181 (and e!712184 mapRes!49498))))

(declare-fun condMapEmpty!49498 () Bool)

(declare-fun mapDefault!49498 () ValueCell!15144)

(assert (=> b!1253586 (= condMapEmpty!49498 (= (arr!39207 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15144)) mapDefault!49498)))))

(declare-fun b!1253587 () Bool)

(assert (=> b!1253587 (= e!712180 true)))

(declare-fun lt!566114 () ListLongMap!18481)

(declare-fun lt!566112 () ListLongMap!18481)

(declare-fun -!2029 (ListLongMap!18481 (_ BitVec 64)) ListLongMap!18481)

(assert (=> b!1253587 (= lt!566114 (-!2029 lt!566112 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566111 () ListLongMap!18481)

(assert (=> b!1253587 (= (-!2029 lt!566111 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566116)))

(declare-fun lt!566117 () Unit!41694)

(declare-fun addThenRemoveForNewKeyIsSame!299 (ListLongMap!18481 (_ BitVec 64) V!47785) Unit!41694)

(assert (=> b!1253587 (= lt!566117 (addThenRemoveForNewKeyIsSame!299 lt!566116 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566118 () ListLongMap!18481)

(assert (=> b!1253587 (and (= lt!566112 lt!566111) (= lt!566118 lt!566113))))

(declare-fun +!4152 (ListLongMap!18481 tuple2!20608) ListLongMap!18481)

(assert (=> b!1253587 (= lt!566111 (+!4152 lt!566116 (tuple2!20609 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4500 (array!81288 array!81290 (_ BitVec 32) (_ BitVec 32) V!47785 V!47785 (_ BitVec 32) Int) ListLongMap!18481)

(assert (=> b!1253587 (= lt!566118 (getCurrentListMap!4500 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253587 (= lt!566112 (getCurrentListMap!4500 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49498 () Bool)

(declare-fun tp!94244 () Bool)

(assert (=> mapNonEmpty!49498 (= mapRes!49498 (and tp!94244 e!712185))))

(declare-fun mapValue!49498 () ValueCell!15144)

(declare-fun mapRest!49498 () (Array (_ BitVec 32) ValueCell!15144))

(declare-fun mapKey!49498 () (_ BitVec 32))

(assert (=> mapNonEmpty!49498 (= (arr!39207 _values!914) (store mapRest!49498 mapKey!49498 mapValue!49498))))

(declare-fun b!1253588 () Bool)

(declare-fun res!835917 () Bool)

(assert (=> b!1253588 (=> (not res!835917) (not e!712183))))

(assert (=> b!1253588 (= res!835917 (and (= (size!39743 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39742 _keys!1118) (size!39743 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105196 res!835916) b!1253588))

(assert (= (and b!1253588 res!835917) b!1253584))

(assert (= (and b!1253584 res!835918) b!1253582))

(assert (= (and b!1253582 res!835919) b!1253581))

(assert (= (and b!1253581 (not res!835915)) b!1253587))

(assert (= (and b!1253586 condMapEmpty!49498) mapIsEmpty!49498))

(assert (= (and b!1253586 (not condMapEmpty!49498)) mapNonEmpty!49498))

(get-info :version)

(assert (= (and mapNonEmpty!49498 ((_ is ValueCellFull!15144) mapValue!49498)) b!1253583))

(assert (= (and b!1253586 ((_ is ValueCellFull!15144) mapDefault!49498)) b!1253585))

(assert (= start!105196 b!1253586))

(declare-fun m!1154145 () Bool)

(assert (=> b!1253581 m!1154145))

(declare-fun m!1154147 () Bool)

(assert (=> b!1253581 m!1154147))

(declare-fun m!1154149 () Bool)

(assert (=> b!1253581 m!1154149))

(declare-fun m!1154151 () Bool)

(assert (=> b!1253582 m!1154151))

(declare-fun m!1154153 () Bool)

(assert (=> b!1253584 m!1154153))

(declare-fun m!1154155 () Bool)

(assert (=> mapNonEmpty!49498 m!1154155))

(declare-fun m!1154157 () Bool)

(assert (=> b!1253587 m!1154157))

(declare-fun m!1154159 () Bool)

(assert (=> b!1253587 m!1154159))

(declare-fun m!1154161 () Bool)

(assert (=> b!1253587 m!1154161))

(declare-fun m!1154163 () Bool)

(assert (=> b!1253587 m!1154163))

(declare-fun m!1154165 () Bool)

(assert (=> b!1253587 m!1154165))

(declare-fun m!1154167 () Bool)

(assert (=> b!1253587 m!1154167))

(declare-fun m!1154169 () Bool)

(assert (=> start!105196 m!1154169))

(declare-fun m!1154171 () Bool)

(assert (=> start!105196 m!1154171))

(declare-fun m!1154173 () Bool)

(assert (=> start!105196 m!1154173))

(check-sat (not b_next!26913) tp_is_empty!31815 (not b!1253582) (not start!105196) (not b!1253584) (not b!1253587) b_and!44727 (not b!1253581) (not mapNonEmpty!49498))
(check-sat b_and!44727 (not b_next!26913))
