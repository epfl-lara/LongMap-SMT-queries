; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105202 () Bool)

(assert start!105202)

(declare-fun b_free!26919 () Bool)

(declare-fun b_next!26919 () Bool)

(assert (=> start!105202 (= b_free!26919 (not b_next!26919))))

(declare-fun tp!94261 () Bool)

(declare-fun b_and!44733 () Bool)

(assert (=> start!105202 (= tp!94261 b_and!44733)))

(declare-fun res!835960 () Bool)

(declare-fun e!712236 () Bool)

(assert (=> start!105202 (=> (not res!835960) (not e!712236))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105202 (= res!835960 (validMask!0 mask!1466))))

(assert (=> start!105202 e!712236))

(assert (=> start!105202 true))

(assert (=> start!105202 tp!94261))

(declare-fun tp_is_empty!31821 () Bool)

(assert (=> start!105202 tp_is_empty!31821))

(declare-datatypes ((array!81300 0))(
  ( (array!81301 (arr!39212 (Array (_ BitVec 32) (_ BitVec 64))) (size!39748 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81300)

(declare-fun array_inv!29893 (array!81300) Bool)

(assert (=> start!105202 (array_inv!29893 _keys!1118)))

(declare-datatypes ((V!47793 0))(
  ( (V!47794 (val!15973 Int)) )
))
(declare-datatypes ((ValueCell!15147 0))(
  ( (ValueCellFull!15147 (v!18671 V!47793)) (EmptyCell!15147) )
))
(declare-datatypes ((array!81302 0))(
  ( (array!81303 (arr!39213 (Array (_ BitVec 32) ValueCell!15147)) (size!39749 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81302)

(declare-fun e!712235 () Bool)

(declare-fun array_inv!29894 (array!81302) Bool)

(assert (=> start!105202 (and (array_inv!29894 _values!914) e!712235)))

(declare-fun mapIsEmpty!49507 () Bool)

(declare-fun mapRes!49507 () Bool)

(assert (=> mapIsEmpty!49507 mapRes!49507))

(declare-fun mapNonEmpty!49507 () Bool)

(declare-fun tp!94262 () Bool)

(declare-fun e!712237 () Bool)

(assert (=> mapNonEmpty!49507 (= mapRes!49507 (and tp!94262 e!712237))))

(declare-fun mapValue!49507 () ValueCell!15147)

(declare-fun mapKey!49507 () (_ BitVec 32))

(declare-fun mapRest!49507 () (Array (_ BitVec 32) ValueCell!15147))

(assert (=> mapNonEmpty!49507 (= (arr!39213 _values!914) (store mapRest!49507 mapKey!49507 mapValue!49507))))

(declare-fun b!1253653 () Bool)

(declare-fun e!712238 () Bool)

(assert (=> b!1253653 (= e!712238 tp_is_empty!31821)))

(declare-fun b!1253654 () Bool)

(declare-fun res!835961 () Bool)

(assert (=> b!1253654 (=> (not res!835961) (not e!712236))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253654 (= res!835961 (and (= (size!39749 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39748 _keys!1118) (size!39749 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253655 () Bool)

(declare-fun e!712234 () Bool)

(assert (=> b!1253655 (= e!712236 (not e!712234))))

(declare-fun res!835964 () Bool)

(assert (=> b!1253655 (=> res!835964 e!712234)))

(assert (=> b!1253655 (= res!835964 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20614 0))(
  ( (tuple2!20615 (_1!10318 (_ BitVec 64)) (_2!10318 V!47793)) )
))
(declare-datatypes ((List!27844 0))(
  ( (Nil!27841) (Cons!27840 (h!29049 tuple2!20614) (t!41325 List!27844)) )
))
(declare-datatypes ((ListLongMap!18487 0))(
  ( (ListLongMap!18488 (toList!9259 List!27844)) )
))
(declare-fun lt!566187 () ListLongMap!18487)

(declare-fun lt!566190 () ListLongMap!18487)

(assert (=> b!1253655 (= lt!566187 lt!566190)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47793)

(declare-fun zeroValue!871 () V!47793)

(declare-fun minValueBefore!43 () V!47793)

(declare-datatypes ((Unit!41700 0))(
  ( (Unit!41701) )
))
(declare-fun lt!566184 () Unit!41700)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1014 (array!81300 array!81302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47793 V!47793 V!47793 V!47793 (_ BitVec 32) Int) Unit!41700)

(assert (=> b!1253655 (= lt!566184 (lemmaNoChangeToArrayThenSameMapNoExtras!1014 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5650 (array!81300 array!81302 (_ BitVec 32) (_ BitVec 32) V!47793 V!47793 (_ BitVec 32) Int) ListLongMap!18487)

(assert (=> b!1253655 (= lt!566190 (getCurrentListMapNoExtraKeys!5650 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253655 (= lt!566187 (getCurrentListMapNoExtraKeys!5650 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253656 () Bool)

(declare-fun res!835962 () Bool)

(assert (=> b!1253656 (=> (not res!835962) (not e!712236))))

(declare-datatypes ((List!27845 0))(
  ( (Nil!27842) (Cons!27841 (h!29050 (_ BitVec 64)) (t!41326 List!27845)) )
))
(declare-fun arrayNoDuplicates!0 (array!81300 (_ BitVec 32) List!27845) Bool)

(assert (=> b!1253656 (= res!835962 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27842))))

(declare-fun b!1253657 () Bool)

(assert (=> b!1253657 (= e!712237 tp_is_empty!31821)))

(declare-fun b!1253658 () Bool)

(assert (=> b!1253658 (= e!712235 (and e!712238 mapRes!49507))))

(declare-fun condMapEmpty!49507 () Bool)

(declare-fun mapDefault!49507 () ValueCell!15147)

(assert (=> b!1253658 (= condMapEmpty!49507 (= (arr!39213 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15147)) mapDefault!49507)))))

(declare-fun b!1253659 () Bool)

(declare-fun res!835963 () Bool)

(assert (=> b!1253659 (=> (not res!835963) (not e!712236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81300 (_ BitVec 32)) Bool)

(assert (=> b!1253659 (= res!835963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253660 () Bool)

(assert (=> b!1253660 (= e!712234 true)))

(declare-fun lt!566185 () ListLongMap!18487)

(declare-fun lt!566188 () ListLongMap!18487)

(declare-fun -!2032 (ListLongMap!18487 (_ BitVec 64)) ListLongMap!18487)

(assert (=> b!1253660 (= lt!566185 (-!2032 lt!566188 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566186 () ListLongMap!18487)

(assert (=> b!1253660 (= (-!2032 lt!566186 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566187)))

(declare-fun lt!566189 () Unit!41700)

(declare-fun addThenRemoveForNewKeyIsSame!302 (ListLongMap!18487 (_ BitVec 64) V!47793) Unit!41700)

(assert (=> b!1253660 (= lt!566189 (addThenRemoveForNewKeyIsSame!302 lt!566187 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566183 () ListLongMap!18487)

(assert (=> b!1253660 (and (= lt!566188 lt!566186) (= lt!566183 lt!566190))))

(declare-fun +!4155 (ListLongMap!18487 tuple2!20614) ListLongMap!18487)

(assert (=> b!1253660 (= lt!566186 (+!4155 lt!566187 (tuple2!20615 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4503 (array!81300 array!81302 (_ BitVec 32) (_ BitVec 32) V!47793 V!47793 (_ BitVec 32) Int) ListLongMap!18487)

(assert (=> b!1253660 (= lt!566183 (getCurrentListMap!4503 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253660 (= lt!566188 (getCurrentListMap!4503 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105202 res!835960) b!1253654))

(assert (= (and b!1253654 res!835961) b!1253659))

(assert (= (and b!1253659 res!835963) b!1253656))

(assert (= (and b!1253656 res!835962) b!1253655))

(assert (= (and b!1253655 (not res!835964)) b!1253660))

(assert (= (and b!1253658 condMapEmpty!49507) mapIsEmpty!49507))

(assert (= (and b!1253658 (not condMapEmpty!49507)) mapNonEmpty!49507))

(get-info :version)

(assert (= (and mapNonEmpty!49507 ((_ is ValueCellFull!15147) mapValue!49507)) b!1253657))

(assert (= (and b!1253658 ((_ is ValueCellFull!15147) mapDefault!49507)) b!1253653))

(assert (= start!105202 b!1253658))

(declare-fun m!1154235 () Bool)

(assert (=> b!1253660 m!1154235))

(declare-fun m!1154237 () Bool)

(assert (=> b!1253660 m!1154237))

(declare-fun m!1154239 () Bool)

(assert (=> b!1253660 m!1154239))

(declare-fun m!1154241 () Bool)

(assert (=> b!1253660 m!1154241))

(declare-fun m!1154243 () Bool)

(assert (=> b!1253660 m!1154243))

(declare-fun m!1154245 () Bool)

(assert (=> b!1253660 m!1154245))

(declare-fun m!1154247 () Bool)

(assert (=> b!1253659 m!1154247))

(declare-fun m!1154249 () Bool)

(assert (=> mapNonEmpty!49507 m!1154249))

(declare-fun m!1154251 () Bool)

(assert (=> start!105202 m!1154251))

(declare-fun m!1154253 () Bool)

(assert (=> start!105202 m!1154253))

(declare-fun m!1154255 () Bool)

(assert (=> start!105202 m!1154255))

(declare-fun m!1154257 () Bool)

(assert (=> b!1253655 m!1154257))

(declare-fun m!1154259 () Bool)

(assert (=> b!1253655 m!1154259))

(declare-fun m!1154261 () Bool)

(assert (=> b!1253655 m!1154261))

(declare-fun m!1154263 () Bool)

(assert (=> b!1253656 m!1154263))

(check-sat (not b!1253660) (not start!105202) (not b!1253659) b_and!44733 (not mapNonEmpty!49507) (not b_next!26919) tp_is_empty!31821 (not b!1253655) (not b!1253656))
(check-sat b_and!44733 (not b_next!26919))
