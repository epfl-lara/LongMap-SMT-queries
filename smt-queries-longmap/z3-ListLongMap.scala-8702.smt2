; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105642 () Bool)

(assert start!105642)

(declare-fun b_free!27247 () Bool)

(declare-fun b_next!27247 () Bool)

(assert (=> start!105642 (= b_free!27247 (not b_next!27247))))

(declare-fun tp!95264 () Bool)

(declare-fun b_and!45103 () Bool)

(assert (=> start!105642 (= tp!95264 b_and!45103)))

(declare-fun b!1258359 () Bool)

(declare-fun e!715689 () Bool)

(declare-fun tp_is_empty!32149 () Bool)

(assert (=> b!1258359 (= e!715689 tp_is_empty!32149)))

(declare-fun mapIsEmpty!50017 () Bool)

(declare-fun mapRes!50017 () Bool)

(assert (=> mapIsEmpty!50017 mapRes!50017))

(declare-fun b!1258360 () Bool)

(declare-fun e!715693 () Bool)

(declare-fun e!715690 () Bool)

(assert (=> b!1258360 (= e!715693 (and e!715690 mapRes!50017))))

(declare-fun condMapEmpty!50017 () Bool)

(declare-datatypes ((V!48231 0))(
  ( (V!48232 (val!16137 Int)) )
))
(declare-datatypes ((ValueCell!15311 0))(
  ( (ValueCellFull!15311 (v!18838 V!48231)) (EmptyCell!15311) )
))
(declare-datatypes ((array!81845 0))(
  ( (array!81846 (arr!39479 (Array (_ BitVec 32) ValueCell!15311)) (size!40017 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81845)

(declare-fun mapDefault!50017 () ValueCell!15311)

(assert (=> b!1258360 (= condMapEmpty!50017 (= (arr!39479 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15311)) mapDefault!50017)))))

(declare-fun b!1258361 () Bool)

(declare-fun e!715692 () Bool)

(assert (=> b!1258361 (= e!715692 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((tuple2!20932 0))(
  ( (tuple2!20933 (_1!10477 (_ BitVec 64)) (_2!10477 V!48231)) )
))
(declare-datatypes ((List!28140 0))(
  ( (Nil!28137) (Cons!28136 (h!29345 tuple2!20932) (t!41624 List!28140)) )
))
(declare-datatypes ((ListLongMap!18805 0))(
  ( (ListLongMap!18806 (toList!9418 List!28140)) )
))
(declare-fun lt!569026 () ListLongMap!18805)

(declare-fun zeroValue!871 () V!48231)

(declare-datatypes ((array!81847 0))(
  ( (array!81848 (arr!39480 (Array (_ BitVec 32) (_ BitVec 64))) (size!40018 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81847)

(declare-fun minValueBefore!43 () V!48231)

(declare-fun getCurrentListMap!4509 (array!81847 array!81845 (_ BitVec 32) (_ BitVec 32) V!48231 V!48231 (_ BitVec 32) Int) ListLongMap!18805)

(assert (=> b!1258361 (= lt!569026 (getCurrentListMap!4509 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838729 () Bool)

(declare-fun e!715691 () Bool)

(assert (=> start!105642 (=> (not res!838729) (not e!715691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105642 (= res!838729 (validMask!0 mask!1466))))

(assert (=> start!105642 e!715691))

(assert (=> start!105642 true))

(assert (=> start!105642 tp!95264))

(assert (=> start!105642 tp_is_empty!32149))

(declare-fun array_inv!30203 (array!81847) Bool)

(assert (=> start!105642 (array_inv!30203 _keys!1118)))

(declare-fun array_inv!30204 (array!81845) Bool)

(assert (=> start!105642 (and (array_inv!30204 _values!914) e!715693)))

(declare-fun b!1258362 () Bool)

(assert (=> b!1258362 (= e!715690 tp_is_empty!32149)))

(declare-fun b!1258363 () Bool)

(declare-fun res!838728 () Bool)

(assert (=> b!1258363 (=> (not res!838728) (not e!715691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81847 (_ BitVec 32)) Bool)

(assert (=> b!1258363 (= res!838728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258364 () Bool)

(declare-fun res!838731 () Bool)

(assert (=> b!1258364 (=> (not res!838731) (not e!715691))))

(declare-datatypes ((List!28141 0))(
  ( (Nil!28138) (Cons!28137 (h!29346 (_ BitVec 64)) (t!41625 List!28141)) )
))
(declare-fun arrayNoDuplicates!0 (array!81847 (_ BitVec 32) List!28141) Bool)

(assert (=> b!1258364 (= res!838731 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28138))))

(declare-fun b!1258365 () Bool)

(assert (=> b!1258365 (= e!715691 (not e!715692))))

(declare-fun res!838730 () Bool)

(assert (=> b!1258365 (=> res!838730 e!715692)))

(assert (=> b!1258365 (= res!838730 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569025 () ListLongMap!18805)

(declare-fun lt!569024 () ListLongMap!18805)

(assert (=> b!1258365 (= lt!569025 lt!569024)))

(declare-fun minValueAfter!43 () V!48231)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41791 0))(
  ( (Unit!41792) )
))
(declare-fun lt!569027 () Unit!41791)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1120 (array!81847 array!81845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48231 V!48231 V!48231 V!48231 (_ BitVec 32) Int) Unit!41791)

(assert (=> b!1258365 (= lt!569027 (lemmaNoChangeToArrayThenSameMapNoExtras!1120 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5798 (array!81847 array!81845 (_ BitVec 32) (_ BitVec 32) V!48231 V!48231 (_ BitVec 32) Int) ListLongMap!18805)

(assert (=> b!1258365 (= lt!569024 (getCurrentListMapNoExtraKeys!5798 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258365 (= lt!569025 (getCurrentListMapNoExtraKeys!5798 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50017 () Bool)

(declare-fun tp!95263 () Bool)

(assert (=> mapNonEmpty!50017 (= mapRes!50017 (and tp!95263 e!715689))))

(declare-fun mapKey!50017 () (_ BitVec 32))

(declare-fun mapValue!50017 () ValueCell!15311)

(declare-fun mapRest!50017 () (Array (_ BitVec 32) ValueCell!15311))

(assert (=> mapNonEmpty!50017 (= (arr!39479 _values!914) (store mapRest!50017 mapKey!50017 mapValue!50017))))

(declare-fun b!1258366 () Bool)

(declare-fun res!838732 () Bool)

(assert (=> b!1258366 (=> (not res!838732) (not e!715691))))

(assert (=> b!1258366 (= res!838732 (and (= (size!40017 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40018 _keys!1118) (size!40017 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105642 res!838729) b!1258366))

(assert (= (and b!1258366 res!838732) b!1258363))

(assert (= (and b!1258363 res!838728) b!1258364))

(assert (= (and b!1258364 res!838731) b!1258365))

(assert (= (and b!1258365 (not res!838730)) b!1258361))

(assert (= (and b!1258360 condMapEmpty!50017) mapIsEmpty!50017))

(assert (= (and b!1258360 (not condMapEmpty!50017)) mapNonEmpty!50017))

(get-info :version)

(assert (= (and mapNonEmpty!50017 ((_ is ValueCellFull!15311) mapValue!50017)) b!1258359))

(assert (= (and b!1258360 ((_ is ValueCellFull!15311) mapDefault!50017)) b!1258362))

(assert (= start!105642 b!1258360))

(declare-fun m!1158349 () Bool)

(assert (=> b!1258365 m!1158349))

(declare-fun m!1158351 () Bool)

(assert (=> b!1258365 m!1158351))

(declare-fun m!1158353 () Bool)

(assert (=> b!1258365 m!1158353))

(declare-fun m!1158355 () Bool)

(assert (=> b!1258363 m!1158355))

(declare-fun m!1158357 () Bool)

(assert (=> b!1258361 m!1158357))

(declare-fun m!1158359 () Bool)

(assert (=> start!105642 m!1158359))

(declare-fun m!1158361 () Bool)

(assert (=> start!105642 m!1158361))

(declare-fun m!1158363 () Bool)

(assert (=> start!105642 m!1158363))

(declare-fun m!1158365 () Bool)

(assert (=> mapNonEmpty!50017 m!1158365))

(declare-fun m!1158367 () Bool)

(assert (=> b!1258364 m!1158367))

(check-sat (not b!1258365) (not b!1258364) (not b!1258363) (not b_next!27247) (not start!105642) b_and!45103 tp_is_empty!32149 (not mapNonEmpty!50017) (not b!1258361))
(check-sat b_and!45103 (not b_next!27247))
