; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105500 () Bool)

(assert start!105500)

(declare-fun b_free!26971 () Bool)

(declare-fun b_next!26971 () Bool)

(assert (=> start!105500 (= b_free!26971 (not b_next!26971))))

(declare-fun tp!94421 () Bool)

(declare-fun b_and!44799 () Bool)

(assert (=> start!105500 (= tp!94421 b_and!44799)))

(declare-fun res!836956 () Bool)

(declare-fun e!713668 () Bool)

(assert (=> start!105500 (=> (not res!836956) (not e!713668))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105500 (= res!836956 (validMask!0 mask!1466))))

(assert (=> start!105500 e!713668))

(assert (=> start!105500 true))

(assert (=> start!105500 tp!94421))

(declare-fun tp_is_empty!31873 () Bool)

(assert (=> start!105500 tp_is_empty!31873))

(declare-datatypes ((array!81445 0))(
  ( (array!81446 (arr!39279 (Array (_ BitVec 32) (_ BitVec 64))) (size!39816 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81445)

(declare-fun array_inv!30061 (array!81445) Bool)

(assert (=> start!105500 (array_inv!30061 _keys!1118)))

(declare-datatypes ((V!47863 0))(
  ( (V!47864 (val!15999 Int)) )
))
(declare-datatypes ((ValueCell!15173 0))(
  ( (ValueCellFull!15173 (v!18694 V!47863)) (EmptyCell!15173) )
))
(declare-datatypes ((array!81447 0))(
  ( (array!81448 (arr!39280 (Array (_ BitVec 32) ValueCell!15173)) (size!39817 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81447)

(declare-fun e!713670 () Bool)

(declare-fun array_inv!30062 (array!81447) Bool)

(assert (=> start!105500 (and (array_inv!30062 _values!914) e!713670)))

(declare-fun mapIsEmpty!49588 () Bool)

(declare-fun mapRes!49588 () Bool)

(assert (=> mapIsEmpty!49588 mapRes!49588))

(declare-fun b!1255766 () Bool)

(declare-fun e!713673 () Bool)

(assert (=> b!1255766 (= e!713670 (and e!713673 mapRes!49588))))

(declare-fun condMapEmpty!49588 () Bool)

(declare-fun mapDefault!49588 () ValueCell!15173)

(assert (=> b!1255766 (= condMapEmpty!49588 (= (arr!39280 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15173)) mapDefault!49588)))))

(declare-fun mapNonEmpty!49588 () Bool)

(declare-fun tp!94420 () Bool)

(declare-fun e!713671 () Bool)

(assert (=> mapNonEmpty!49588 (= mapRes!49588 (and tp!94420 e!713671))))

(declare-fun mapValue!49588 () ValueCell!15173)

(declare-fun mapKey!49588 () (_ BitVec 32))

(declare-fun mapRest!49588 () (Array (_ BitVec 32) ValueCell!15173))

(assert (=> mapNonEmpty!49588 (= (arr!39280 _values!914) (store mapRest!49588 mapKey!49588 mapValue!49588))))

(declare-fun b!1255767 () Bool)

(declare-fun res!836954 () Bool)

(assert (=> b!1255767 (=> (not res!836954) (not e!713668))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255767 (= res!836954 (and (= (size!39817 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39816 _keys!1118) (size!39817 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255768 () Bool)

(declare-fun res!836955 () Bool)

(assert (=> b!1255768 (=> (not res!836955) (not e!713668))))

(declare-datatypes ((List!27911 0))(
  ( (Nil!27908) (Cons!27907 (h!29125 (_ BitVec 64)) (t!41386 List!27911)) )
))
(declare-fun arrayNoDuplicates!0 (array!81445 (_ BitVec 32) List!27911) Bool)

(assert (=> b!1255768 (= res!836955 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27908))))

(declare-fun b!1255769 () Bool)

(declare-fun e!713672 () Bool)

(assert (=> b!1255769 (= e!713672 true)))

(declare-datatypes ((tuple2!20674 0))(
  ( (tuple2!20675 (_1!10348 (_ BitVec 64)) (_2!10348 V!47863)) )
))
(declare-datatypes ((List!27912 0))(
  ( (Nil!27909) (Cons!27908 (h!29126 tuple2!20674) (t!41387 List!27912)) )
))
(declare-datatypes ((ListLongMap!18555 0))(
  ( (ListLongMap!18556 (toList!9293 List!27912)) )
))
(declare-fun lt!567435 () ListLongMap!18555)

(declare-fun lt!567436 () ListLongMap!18555)

(declare-fun -!2031 (ListLongMap!18555 (_ BitVec 64)) ListLongMap!18555)

(assert (=> b!1255769 (= lt!567435 (-!2031 lt!567436 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567433 () ListLongMap!18555)

(declare-fun lt!567432 () ListLongMap!18555)

(assert (=> b!1255769 (= (-!2031 lt!567433 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567432)))

(declare-datatypes ((Unit!41725 0))(
  ( (Unit!41726) )
))
(declare-fun lt!567429 () Unit!41725)

(declare-fun minValueBefore!43 () V!47863)

(declare-fun addThenRemoveForNewKeyIsSame!321 (ListLongMap!18555 (_ BitVec 64) V!47863) Unit!41725)

(assert (=> b!1255769 (= lt!567429 (addThenRemoveForNewKeyIsSame!321 lt!567432 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567431 () ListLongMap!18555)

(declare-fun lt!567434 () ListLongMap!18555)

(assert (=> b!1255769 (and (= lt!567436 lt!567433) (= lt!567434 lt!567431))))

(declare-fun +!4227 (ListLongMap!18555 tuple2!20674) ListLongMap!18555)

(assert (=> b!1255769 (= lt!567433 (+!4227 lt!567432 (tuple2!20675 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47863)

(declare-fun zeroValue!871 () V!47863)

(declare-fun getCurrentListMap!4524 (array!81445 array!81447 (_ BitVec 32) (_ BitVec 32) V!47863 V!47863 (_ BitVec 32) Int) ListLongMap!18555)

(assert (=> b!1255769 (= lt!567434 (getCurrentListMap!4524 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255769 (= lt!567436 (getCurrentListMap!4524 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255770 () Bool)

(assert (=> b!1255770 (= e!713671 tp_is_empty!31873)))

(declare-fun b!1255771 () Bool)

(assert (=> b!1255771 (= e!713668 (not e!713672))))

(declare-fun res!836953 () Bool)

(assert (=> b!1255771 (=> res!836953 e!713672)))

(assert (=> b!1255771 (= res!836953 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1255771 (= lt!567432 lt!567431)))

(declare-fun lt!567430 () Unit!41725)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1031 (array!81445 array!81447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47863 V!47863 V!47863 V!47863 (_ BitVec 32) Int) Unit!41725)

(assert (=> b!1255771 (= lt!567430 (lemmaNoChangeToArrayThenSameMapNoExtras!1031 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5717 (array!81445 array!81447 (_ BitVec 32) (_ BitVec 32) V!47863 V!47863 (_ BitVec 32) Int) ListLongMap!18555)

(assert (=> b!1255771 (= lt!567431 (getCurrentListMapNoExtraKeys!5717 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255771 (= lt!567432 (getCurrentListMapNoExtraKeys!5717 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255772 () Bool)

(assert (=> b!1255772 (= e!713673 tp_is_empty!31873)))

(declare-fun b!1255773 () Bool)

(declare-fun res!836952 () Bool)

(assert (=> b!1255773 (=> (not res!836952) (not e!713668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81445 (_ BitVec 32)) Bool)

(assert (=> b!1255773 (= res!836952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105500 res!836956) b!1255767))

(assert (= (and b!1255767 res!836954) b!1255773))

(assert (= (and b!1255773 res!836952) b!1255768))

(assert (= (and b!1255768 res!836955) b!1255771))

(assert (= (and b!1255771 (not res!836953)) b!1255769))

(assert (= (and b!1255766 condMapEmpty!49588) mapIsEmpty!49588))

(assert (= (and b!1255766 (not condMapEmpty!49588)) mapNonEmpty!49588))

(get-info :version)

(assert (= (and mapNonEmpty!49588 ((_ is ValueCellFull!15173) mapValue!49588)) b!1255770))

(assert (= (and b!1255766 ((_ is ValueCellFull!15173) mapDefault!49588)) b!1255772))

(assert (= start!105500 b!1255766))

(declare-fun m!1156811 () Bool)

(assert (=> start!105500 m!1156811))

(declare-fun m!1156813 () Bool)

(assert (=> start!105500 m!1156813))

(declare-fun m!1156815 () Bool)

(assert (=> start!105500 m!1156815))

(declare-fun m!1156817 () Bool)

(assert (=> b!1255773 m!1156817))

(declare-fun m!1156819 () Bool)

(assert (=> b!1255771 m!1156819))

(declare-fun m!1156821 () Bool)

(assert (=> b!1255771 m!1156821))

(declare-fun m!1156823 () Bool)

(assert (=> b!1255771 m!1156823))

(declare-fun m!1156825 () Bool)

(assert (=> b!1255768 m!1156825))

(declare-fun m!1156827 () Bool)

(assert (=> b!1255769 m!1156827))

(declare-fun m!1156829 () Bool)

(assert (=> b!1255769 m!1156829))

(declare-fun m!1156831 () Bool)

(assert (=> b!1255769 m!1156831))

(declare-fun m!1156833 () Bool)

(assert (=> b!1255769 m!1156833))

(declare-fun m!1156835 () Bool)

(assert (=> b!1255769 m!1156835))

(declare-fun m!1156837 () Bool)

(assert (=> b!1255769 m!1156837))

(declare-fun m!1156839 () Bool)

(assert (=> mapNonEmpty!49588 m!1156839))

(check-sat tp_is_empty!31873 (not b!1255771) (not mapNonEmpty!49588) (not b!1255769) (not b_next!26971) (not b!1255773) (not b!1255768) b_and!44799 (not start!105500))
(check-sat b_and!44799 (not b_next!26971))
