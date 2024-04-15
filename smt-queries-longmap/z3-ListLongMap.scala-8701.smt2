; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105636 () Bool)

(assert start!105636)

(declare-fun b_free!27241 () Bool)

(declare-fun b_next!27241 () Bool)

(assert (=> start!105636 (= b_free!27241 (not b_next!27241))))

(declare-fun tp!95246 () Bool)

(declare-fun b_and!45097 () Bool)

(assert (=> start!105636 (= tp!95246 b_and!45097)))

(declare-fun b!1258287 () Bool)

(declare-fun e!715638 () Bool)

(declare-fun tp_is_empty!32143 () Bool)

(assert (=> b!1258287 (= e!715638 tp_is_empty!32143)))

(declare-fun res!838686 () Bool)

(declare-fun e!715636 () Bool)

(assert (=> start!105636 (=> (not res!838686) (not e!715636))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105636 (= res!838686 (validMask!0 mask!1466))))

(assert (=> start!105636 e!715636))

(assert (=> start!105636 true))

(assert (=> start!105636 tp!95246))

(assert (=> start!105636 tp_is_empty!32143))

(declare-datatypes ((array!81835 0))(
  ( (array!81836 (arr!39474 (Array (_ BitVec 32) (_ BitVec 64))) (size!40012 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81835)

(declare-fun array_inv!30199 (array!81835) Bool)

(assert (=> start!105636 (array_inv!30199 _keys!1118)))

(declare-datatypes ((V!48223 0))(
  ( (V!48224 (val!16134 Int)) )
))
(declare-datatypes ((ValueCell!15308 0))(
  ( (ValueCellFull!15308 (v!18835 V!48223)) (EmptyCell!15308) )
))
(declare-datatypes ((array!81837 0))(
  ( (array!81838 (arr!39475 (Array (_ BitVec 32) ValueCell!15308)) (size!40013 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81837)

(declare-fun e!715640 () Bool)

(declare-fun array_inv!30200 (array!81837) Bool)

(assert (=> start!105636 (and (array_inv!30200 _values!914) e!715640)))

(declare-fun b!1258288 () Bool)

(declare-fun res!838684 () Bool)

(assert (=> b!1258288 (=> (not res!838684) (not e!715636))))

(declare-datatypes ((List!28136 0))(
  ( (Nil!28133) (Cons!28132 (h!29341 (_ BitVec 64)) (t!41620 List!28136)) )
))
(declare-fun arrayNoDuplicates!0 (array!81835 (_ BitVec 32) List!28136) Bool)

(assert (=> b!1258288 (= res!838684 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28133))))

(declare-fun b!1258289 () Bool)

(declare-fun e!715637 () Bool)

(assert (=> b!1258289 (= e!715637 true)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20928 0))(
  ( (tuple2!20929 (_1!10475 (_ BitVec 64)) (_2!10475 V!48223)) )
))
(declare-datatypes ((List!28137 0))(
  ( (Nil!28134) (Cons!28133 (h!29342 tuple2!20928) (t!41621 List!28137)) )
))
(declare-datatypes ((ListLongMap!18801 0))(
  ( (ListLongMap!18802 (toList!9416 List!28137)) )
))
(declare-fun lt!568989 () ListLongMap!18801)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48223)

(declare-fun minValueBefore!43 () V!48223)

(declare-fun getCurrentListMap!4507 (array!81835 array!81837 (_ BitVec 32) (_ BitVec 32) V!48223 V!48223 (_ BitVec 32) Int) ListLongMap!18801)

(assert (=> b!1258289 (= lt!568989 (getCurrentListMap!4507 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258290 () Bool)

(declare-fun e!715635 () Bool)

(declare-fun mapRes!50008 () Bool)

(assert (=> b!1258290 (= e!715640 (and e!715635 mapRes!50008))))

(declare-fun condMapEmpty!50008 () Bool)

(declare-fun mapDefault!50008 () ValueCell!15308)

(assert (=> b!1258290 (= condMapEmpty!50008 (= (arr!39475 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15308)) mapDefault!50008)))))

(declare-fun b!1258291 () Bool)

(assert (=> b!1258291 (= e!715636 (not e!715637))))

(declare-fun res!838685 () Bool)

(assert (=> b!1258291 (=> res!838685 e!715637)))

(assert (=> b!1258291 (= res!838685 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!568991 () ListLongMap!18801)

(declare-fun lt!568988 () ListLongMap!18801)

(assert (=> b!1258291 (= lt!568991 lt!568988)))

(declare-fun minValueAfter!43 () V!48223)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41787 0))(
  ( (Unit!41788) )
))
(declare-fun lt!568990 () Unit!41787)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1118 (array!81835 array!81837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48223 V!48223 V!48223 V!48223 (_ BitVec 32) Int) Unit!41787)

(assert (=> b!1258291 (= lt!568990 (lemmaNoChangeToArrayThenSameMapNoExtras!1118 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5796 (array!81835 array!81837 (_ BitVec 32) (_ BitVec 32) V!48223 V!48223 (_ BitVec 32) Int) ListLongMap!18801)

(assert (=> b!1258291 (= lt!568988 (getCurrentListMapNoExtraKeys!5796 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258291 (= lt!568991 (getCurrentListMapNoExtraKeys!5796 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258292 () Bool)

(assert (=> b!1258292 (= e!715635 tp_is_empty!32143)))

(declare-fun mapIsEmpty!50008 () Bool)

(assert (=> mapIsEmpty!50008 mapRes!50008))

(declare-fun b!1258293 () Bool)

(declare-fun res!838687 () Bool)

(assert (=> b!1258293 (=> (not res!838687) (not e!715636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81835 (_ BitVec 32)) Bool)

(assert (=> b!1258293 (= res!838687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258294 () Bool)

(declare-fun res!838683 () Bool)

(assert (=> b!1258294 (=> (not res!838683) (not e!715636))))

(assert (=> b!1258294 (= res!838683 (and (= (size!40013 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40012 _keys!1118) (size!40013 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50008 () Bool)

(declare-fun tp!95245 () Bool)

(assert (=> mapNonEmpty!50008 (= mapRes!50008 (and tp!95245 e!715638))))

(declare-fun mapRest!50008 () (Array (_ BitVec 32) ValueCell!15308))

(declare-fun mapValue!50008 () ValueCell!15308)

(declare-fun mapKey!50008 () (_ BitVec 32))

(assert (=> mapNonEmpty!50008 (= (arr!39475 _values!914) (store mapRest!50008 mapKey!50008 mapValue!50008))))

(assert (= (and start!105636 res!838686) b!1258294))

(assert (= (and b!1258294 res!838683) b!1258293))

(assert (= (and b!1258293 res!838687) b!1258288))

(assert (= (and b!1258288 res!838684) b!1258291))

(assert (= (and b!1258291 (not res!838685)) b!1258289))

(assert (= (and b!1258290 condMapEmpty!50008) mapIsEmpty!50008))

(assert (= (and b!1258290 (not condMapEmpty!50008)) mapNonEmpty!50008))

(get-info :version)

(assert (= (and mapNonEmpty!50008 ((_ is ValueCellFull!15308) mapValue!50008)) b!1258287))

(assert (= (and b!1258290 ((_ is ValueCellFull!15308) mapDefault!50008)) b!1258292))

(assert (= start!105636 b!1258290))

(declare-fun m!1158289 () Bool)

(assert (=> mapNonEmpty!50008 m!1158289))

(declare-fun m!1158291 () Bool)

(assert (=> start!105636 m!1158291))

(declare-fun m!1158293 () Bool)

(assert (=> start!105636 m!1158293))

(declare-fun m!1158295 () Bool)

(assert (=> start!105636 m!1158295))

(declare-fun m!1158297 () Bool)

(assert (=> b!1258289 m!1158297))

(declare-fun m!1158299 () Bool)

(assert (=> b!1258293 m!1158299))

(declare-fun m!1158301 () Bool)

(assert (=> b!1258291 m!1158301))

(declare-fun m!1158303 () Bool)

(assert (=> b!1258291 m!1158303))

(declare-fun m!1158305 () Bool)

(assert (=> b!1258291 m!1158305))

(declare-fun m!1158307 () Bool)

(assert (=> b!1258288 m!1158307))

(check-sat (not b_next!27241) (not b!1258289) (not mapNonEmpty!50008) (not b!1258288) (not start!105636) tp_is_empty!32143 (not b!1258293) b_and!45097 (not b!1258291))
(check-sat b_and!45097 (not b_next!27241))
