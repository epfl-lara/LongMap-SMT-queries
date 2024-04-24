; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105430 () Bool)

(assert start!105430)

(declare-fun b_free!26923 () Bool)

(declare-fun b_next!26923 () Bool)

(assert (=> start!105430 (= b_free!26923 (not b_next!26923))))

(declare-fun tp!94273 () Bool)

(declare-fun b_and!44739 () Bool)

(assert (=> start!105430 (= tp!94273 b_and!44739)))

(declare-fun b!1255006 () Bool)

(declare-fun e!713117 () Bool)

(declare-fun tp_is_empty!31825 () Bool)

(assert (=> b!1255006 (= e!713117 tp_is_empty!31825)))

(declare-fun mapNonEmpty!49513 () Bool)

(declare-fun mapRes!49513 () Bool)

(declare-fun tp!94274 () Bool)

(declare-fun e!713121 () Bool)

(assert (=> mapNonEmpty!49513 (= mapRes!49513 (and tp!94274 e!713121))))

(declare-fun mapKey!49513 () (_ BitVec 32))

(declare-datatypes ((V!47799 0))(
  ( (V!47800 (val!15975 Int)) )
))
(declare-datatypes ((ValueCell!15149 0))(
  ( (ValueCellFull!15149 (v!18669 V!47799)) (EmptyCell!15149) )
))
(declare-fun mapRest!49513 () (Array (_ BitVec 32) ValueCell!15149))

(declare-datatypes ((array!81351 0))(
  ( (array!81352 (arr!39233 (Array (_ BitVec 32) ValueCell!15149)) (size!39770 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81351)

(declare-fun mapValue!49513 () ValueCell!15149)

(assert (=> mapNonEmpty!49513 (= (arr!39233 _values!914) (store mapRest!49513 mapKey!49513 mapValue!49513))))

(declare-fun res!836514 () Bool)

(declare-fun e!713120 () Bool)

(assert (=> start!105430 (=> (not res!836514) (not e!713120))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105430 (= res!836514 (validMask!0 mask!1466))))

(assert (=> start!105430 e!713120))

(assert (=> start!105430 true))

(assert (=> start!105430 tp!94273))

(assert (=> start!105430 tp_is_empty!31825))

(declare-datatypes ((array!81353 0))(
  ( (array!81354 (arr!39234 (Array (_ BitVec 32) (_ BitVec 64))) (size!39771 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81353)

(declare-fun array_inv!30025 (array!81353) Bool)

(assert (=> start!105430 (array_inv!30025 _keys!1118)))

(declare-fun e!713119 () Bool)

(declare-fun array_inv!30026 (array!81351) Bool)

(assert (=> start!105430 (and (array_inv!30026 _values!914) e!713119)))

(declare-fun mapIsEmpty!49513 () Bool)

(assert (=> mapIsEmpty!49513 mapRes!49513))

(declare-fun b!1255007 () Bool)

(declare-fun res!836512 () Bool)

(assert (=> b!1255007 (=> (not res!836512) (not e!713120))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255007 (= res!836512 (and (= (size!39770 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39771 _keys!1118) (size!39770 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255008 () Bool)

(declare-fun e!713122 () Bool)

(assert (=> b!1255008 (= e!713122 true)))

(declare-datatypes ((tuple2!20636 0))(
  ( (tuple2!20637 (_1!10329 (_ BitVec 64)) (_2!10329 V!47799)) )
))
(declare-datatypes ((List!27875 0))(
  ( (Nil!27872) (Cons!27871 (h!29089 tuple2!20636) (t!41348 List!27875)) )
))
(declare-datatypes ((ListLongMap!18517 0))(
  ( (ListLongMap!18518 (toList!9274 List!27875)) )
))
(declare-fun lt!566721 () ListLongMap!18517)

(declare-fun lt!566720 () ListLongMap!18517)

(declare-fun -!2015 (ListLongMap!18517 (_ BitVec 64)) ListLongMap!18517)

(assert (=> b!1255008 (= lt!566721 (-!2015 lt!566720 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566722 () ListLongMap!18517)

(declare-fun lt!566718 () ListLongMap!18517)

(assert (=> b!1255008 (= (-!2015 lt!566722 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566718)))

(declare-datatypes ((Unit!41685 0))(
  ( (Unit!41686) )
))
(declare-fun lt!566719 () Unit!41685)

(declare-fun minValueBefore!43 () V!47799)

(declare-fun addThenRemoveForNewKeyIsSame!305 (ListLongMap!18517 (_ BitVec 64) V!47799) Unit!41685)

(assert (=> b!1255008 (= lt!566719 (addThenRemoveForNewKeyIsSame!305 lt!566718 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566716 () ListLongMap!18517)

(declare-fun lt!566715 () ListLongMap!18517)

(assert (=> b!1255008 (and (= lt!566720 lt!566722) (= lt!566716 lt!566715))))

(declare-fun +!4211 (ListLongMap!18517 tuple2!20636) ListLongMap!18517)

(assert (=> b!1255008 (= lt!566722 (+!4211 lt!566718 (tuple2!20637 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47799)

(declare-fun zeroValue!871 () V!47799)

(declare-fun getCurrentListMap!4508 (array!81353 array!81351 (_ BitVec 32) (_ BitVec 32) V!47799 V!47799 (_ BitVec 32) Int) ListLongMap!18517)

(assert (=> b!1255008 (= lt!566716 (getCurrentListMap!4508 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255008 (= lt!566720 (getCurrentListMap!4508 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255009 () Bool)

(declare-fun res!836511 () Bool)

(assert (=> b!1255009 (=> (not res!836511) (not e!713120))))

(declare-datatypes ((List!27876 0))(
  ( (Nil!27873) (Cons!27872 (h!29090 (_ BitVec 64)) (t!41349 List!27876)) )
))
(declare-fun arrayNoDuplicates!0 (array!81353 (_ BitVec 32) List!27876) Bool)

(assert (=> b!1255009 (= res!836511 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27873))))

(declare-fun b!1255010 () Bool)

(declare-fun res!836513 () Bool)

(assert (=> b!1255010 (=> (not res!836513) (not e!713120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81353 (_ BitVec 32)) Bool)

(assert (=> b!1255010 (= res!836513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255011 () Bool)

(assert (=> b!1255011 (= e!713121 tp_is_empty!31825)))

(declare-fun b!1255012 () Bool)

(assert (=> b!1255012 (= e!713120 (not e!713122))))

(declare-fun res!836510 () Bool)

(assert (=> b!1255012 (=> res!836510 e!713122)))

(assert (=> b!1255012 (= res!836510 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1255012 (= lt!566718 lt!566715)))

(declare-fun lt!566717 () Unit!41685)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1013 (array!81353 array!81351 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47799 V!47799 V!47799 V!47799 (_ BitVec 32) Int) Unit!41685)

(assert (=> b!1255012 (= lt!566717 (lemmaNoChangeToArrayThenSameMapNoExtras!1013 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5699 (array!81353 array!81351 (_ BitVec 32) (_ BitVec 32) V!47799 V!47799 (_ BitVec 32) Int) ListLongMap!18517)

(assert (=> b!1255012 (= lt!566715 (getCurrentListMapNoExtraKeys!5699 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255012 (= lt!566718 (getCurrentListMapNoExtraKeys!5699 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255013 () Bool)

(assert (=> b!1255013 (= e!713119 (and e!713117 mapRes!49513))))

(declare-fun condMapEmpty!49513 () Bool)

(declare-fun mapDefault!49513 () ValueCell!15149)

(assert (=> b!1255013 (= condMapEmpty!49513 (= (arr!39233 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15149)) mapDefault!49513)))))

(assert (= (and start!105430 res!836514) b!1255007))

(assert (= (and b!1255007 res!836512) b!1255010))

(assert (= (and b!1255010 res!836513) b!1255009))

(assert (= (and b!1255009 res!836511) b!1255012))

(assert (= (and b!1255012 (not res!836510)) b!1255008))

(assert (= (and b!1255013 condMapEmpty!49513) mapIsEmpty!49513))

(assert (= (and b!1255013 (not condMapEmpty!49513)) mapNonEmpty!49513))

(get-info :version)

(assert (= (and mapNonEmpty!49513 ((_ is ValueCellFull!15149) mapValue!49513)) b!1255011))

(assert (= (and b!1255013 ((_ is ValueCellFull!15149) mapDefault!49513)) b!1255006))

(assert (= start!105430 b!1255013))

(declare-fun m!1155907 () Bool)

(assert (=> mapNonEmpty!49513 m!1155907))

(declare-fun m!1155909 () Bool)

(assert (=> start!105430 m!1155909))

(declare-fun m!1155911 () Bool)

(assert (=> start!105430 m!1155911))

(declare-fun m!1155913 () Bool)

(assert (=> start!105430 m!1155913))

(declare-fun m!1155915 () Bool)

(assert (=> b!1255012 m!1155915))

(declare-fun m!1155917 () Bool)

(assert (=> b!1255012 m!1155917))

(declare-fun m!1155919 () Bool)

(assert (=> b!1255012 m!1155919))

(declare-fun m!1155921 () Bool)

(assert (=> b!1255010 m!1155921))

(declare-fun m!1155923 () Bool)

(assert (=> b!1255009 m!1155923))

(declare-fun m!1155925 () Bool)

(assert (=> b!1255008 m!1155925))

(declare-fun m!1155927 () Bool)

(assert (=> b!1255008 m!1155927))

(declare-fun m!1155929 () Bool)

(assert (=> b!1255008 m!1155929))

(declare-fun m!1155931 () Bool)

(assert (=> b!1255008 m!1155931))

(declare-fun m!1155933 () Bool)

(assert (=> b!1255008 m!1155933))

(declare-fun m!1155935 () Bool)

(assert (=> b!1255008 m!1155935))

(check-sat tp_is_empty!31825 b_and!44739 (not b!1255009) (not b!1255008) (not b!1255010) (not start!105430) (not b!1255012) (not b_next!26923) (not mapNonEmpty!49513))
(check-sat b_and!44739 (not b_next!26923))
