; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105544 () Bool)

(assert start!105544)

(declare-fun b_free!27163 () Bool)

(declare-fun b_next!27163 () Bool)

(assert (=> start!105544 (= b_free!27163 (not b_next!27163))))

(declare-fun tp!95008 () Bool)

(declare-fun b_and!45011 () Bool)

(assert (=> start!105544 (= tp!95008 b_and!45011)))

(declare-fun b!1257345 () Bool)

(declare-fun e!714958 () Bool)

(declare-fun tp_is_empty!32065 () Bool)

(assert (=> b!1257345 (= e!714958 tp_is_empty!32065)))

(declare-fun b!1257346 () Bool)

(declare-fun e!714957 () Bool)

(assert (=> b!1257346 (= e!714957 (not true))))

(declare-datatypes ((V!48119 0))(
  ( (V!48120 (val!16095 Int)) )
))
(declare-datatypes ((tuple2!20878 0))(
  ( (tuple2!20879 (_1!10450 (_ BitVec 64)) (_2!10450 V!48119)) )
))
(declare-datatypes ((List!28086 0))(
  ( (Nil!28083) (Cons!28082 (h!29291 tuple2!20878) (t!41568 List!28086)) )
))
(declare-datatypes ((ListLongMap!18751 0))(
  ( (ListLongMap!18752 (toList!9391 List!28086)) )
))
(declare-fun lt!568561 () ListLongMap!18751)

(declare-fun lt!568559 () ListLongMap!18751)

(assert (=> b!1257346 (= lt!568561 lt!568559)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((Unit!41741 0))(
  ( (Unit!41742) )
))
(declare-fun lt!568560 () Unit!41741)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48119)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81691 0))(
  ( (array!81692 (arr!39403 (Array (_ BitVec 32) (_ BitVec 64))) (size!39941 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81691)

(declare-datatypes ((ValueCell!15269 0))(
  ( (ValueCellFull!15269 (v!18796 V!48119)) (EmptyCell!15269) )
))
(declare-datatypes ((array!81693 0))(
  ( (array!81694 (arr!39404 (Array (_ BitVec 32) ValueCell!15269)) (size!39942 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81693)

(declare-fun minValueBefore!43 () V!48119)

(declare-fun zeroValue!871 () V!48119)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1095 (array!81691 array!81693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48119 V!48119 V!48119 V!48119 (_ BitVec 32) Int) Unit!41741)

(assert (=> b!1257346 (= lt!568560 (lemmaNoChangeToArrayThenSameMapNoExtras!1095 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5773 (array!81691 array!81693 (_ BitVec 32) (_ BitVec 32) V!48119 V!48119 (_ BitVec 32) Int) ListLongMap!18751)

(assert (=> b!1257346 (= lt!568559 (getCurrentListMapNoExtraKeys!5773 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257346 (= lt!568561 (getCurrentListMapNoExtraKeys!5773 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257347 () Bool)

(declare-fun e!714959 () Bool)

(declare-fun e!714961 () Bool)

(declare-fun mapRes!49888 () Bool)

(assert (=> b!1257347 (= e!714959 (and e!714961 mapRes!49888))))

(declare-fun condMapEmpty!49888 () Bool)

(declare-fun mapDefault!49888 () ValueCell!15269)

(assert (=> b!1257347 (= condMapEmpty!49888 (= (arr!39404 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15269)) mapDefault!49888)))))

(declare-fun mapNonEmpty!49888 () Bool)

(declare-fun tp!95009 () Bool)

(assert (=> mapNonEmpty!49888 (= mapRes!49888 (and tp!95009 e!714958))))

(declare-fun mapRest!49888 () (Array (_ BitVec 32) ValueCell!15269))

(declare-fun mapValue!49888 () ValueCell!15269)

(declare-fun mapKey!49888 () (_ BitVec 32))

(assert (=> mapNonEmpty!49888 (= (arr!39404 _values!914) (store mapRest!49888 mapKey!49888 mapValue!49888))))

(declare-fun res!838148 () Bool)

(assert (=> start!105544 (=> (not res!838148) (not e!714957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105544 (= res!838148 (validMask!0 mask!1466))))

(assert (=> start!105544 e!714957))

(assert (=> start!105544 true))

(assert (=> start!105544 tp!95008))

(assert (=> start!105544 tp_is_empty!32065))

(declare-fun array_inv!30149 (array!81691) Bool)

(assert (=> start!105544 (array_inv!30149 _keys!1118)))

(declare-fun array_inv!30150 (array!81693) Bool)

(assert (=> start!105544 (and (array_inv!30150 _values!914) e!714959)))

(declare-fun b!1257348 () Bool)

(assert (=> b!1257348 (= e!714961 tp_is_empty!32065)))

(declare-fun b!1257349 () Bool)

(declare-fun res!838146 () Bool)

(assert (=> b!1257349 (=> (not res!838146) (not e!714957))))

(assert (=> b!1257349 (= res!838146 (and (= (size!39942 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39941 _keys!1118) (size!39942 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49888 () Bool)

(assert (=> mapIsEmpty!49888 mapRes!49888))

(declare-fun b!1257350 () Bool)

(declare-fun res!838147 () Bool)

(assert (=> b!1257350 (=> (not res!838147) (not e!714957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81691 (_ BitVec 32)) Bool)

(assert (=> b!1257350 (= res!838147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257351 () Bool)

(declare-fun res!838149 () Bool)

(assert (=> b!1257351 (=> (not res!838149) (not e!714957))))

(declare-datatypes ((List!28087 0))(
  ( (Nil!28084) (Cons!28083 (h!29292 (_ BitVec 64)) (t!41569 List!28087)) )
))
(declare-fun arrayNoDuplicates!0 (array!81691 (_ BitVec 32) List!28087) Bool)

(assert (=> b!1257351 (= res!838149 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28084))))

(assert (= (and start!105544 res!838148) b!1257349))

(assert (= (and b!1257349 res!838146) b!1257350))

(assert (= (and b!1257350 res!838147) b!1257351))

(assert (= (and b!1257351 res!838149) b!1257346))

(assert (= (and b!1257347 condMapEmpty!49888) mapIsEmpty!49888))

(assert (= (and b!1257347 (not condMapEmpty!49888)) mapNonEmpty!49888))

(get-info :version)

(assert (= (and mapNonEmpty!49888 ((_ is ValueCellFull!15269) mapValue!49888)) b!1257345))

(assert (= (and b!1257347 ((_ is ValueCellFull!15269) mapDefault!49888)) b!1257348))

(assert (= start!105544 b!1257347))

(declare-fun m!1157497 () Bool)

(assert (=> mapNonEmpty!49888 m!1157497))

(declare-fun m!1157499 () Bool)

(assert (=> start!105544 m!1157499))

(declare-fun m!1157501 () Bool)

(assert (=> start!105544 m!1157501))

(declare-fun m!1157503 () Bool)

(assert (=> start!105544 m!1157503))

(declare-fun m!1157505 () Bool)

(assert (=> b!1257346 m!1157505))

(declare-fun m!1157507 () Bool)

(assert (=> b!1257346 m!1157507))

(declare-fun m!1157509 () Bool)

(assert (=> b!1257346 m!1157509))

(declare-fun m!1157511 () Bool)

(assert (=> b!1257351 m!1157511))

(declare-fun m!1157513 () Bool)

(assert (=> b!1257350 m!1157513))

(check-sat (not b!1257351) (not b!1257350) (not b_next!27163) (not b!1257346) b_and!45011 (not mapNonEmpty!49888) tp_is_empty!32065 (not start!105544))
(check-sat b_and!45011 (not b_next!27163))
