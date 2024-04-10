; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105272 () Bool)

(assert start!105272)

(declare-fun b_free!26967 () Bool)

(declare-fun b_next!26967 () Bool)

(assert (=> start!105272 (= b_free!26967 (not b_next!26967))))

(declare-fun tp!94409 () Bool)

(declare-fun b_and!44793 () Bool)

(assert (=> start!105272 (= tp!94409 b_and!44793)))

(declare-fun b!1254413 () Bool)

(declare-fun e!712785 () Bool)

(declare-fun tp_is_empty!31869 () Bool)

(assert (=> b!1254413 (= e!712785 tp_is_empty!31869)))

(declare-fun res!836402 () Bool)

(declare-fun e!712787 () Bool)

(assert (=> start!105272 (=> (not res!836402) (not e!712787))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105272 (= res!836402 (validMask!0 mask!1466))))

(assert (=> start!105272 e!712787))

(assert (=> start!105272 true))

(assert (=> start!105272 tp!94409))

(assert (=> start!105272 tp_is_empty!31869))

(declare-datatypes ((array!81392 0))(
  ( (array!81393 (arr!39257 (Array (_ BitVec 32) (_ BitVec 64))) (size!39793 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81392)

(declare-fun array_inv!29927 (array!81392) Bool)

(assert (=> start!105272 (array_inv!29927 _keys!1118)))

(declare-datatypes ((V!47857 0))(
  ( (V!47858 (val!15997 Int)) )
))
(declare-datatypes ((ValueCell!15171 0))(
  ( (ValueCellFull!15171 (v!18696 V!47857)) (EmptyCell!15171) )
))
(declare-datatypes ((array!81394 0))(
  ( (array!81395 (arr!39258 (Array (_ BitVec 32) ValueCell!15171)) (size!39794 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81394)

(declare-fun e!712789 () Bool)

(declare-fun array_inv!29928 (array!81394) Bool)

(assert (=> start!105272 (and (array_inv!29928 _values!914) e!712789)))

(declare-fun b!1254414 () Bool)

(declare-fun e!712788 () Bool)

(assert (=> b!1254414 (= e!712788 tp_is_empty!31869)))

(declare-fun b!1254415 () Bool)

(declare-fun res!836404 () Bool)

(assert (=> b!1254415 (=> (not res!836404) (not e!712787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81392 (_ BitVec 32)) Bool)

(assert (=> b!1254415 (= res!836404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254416 () Bool)

(declare-fun e!712790 () Bool)

(assert (=> b!1254416 (= e!712790 true)))

(declare-datatypes ((tuple2!20654 0))(
  ( (tuple2!20655 (_1!10338 (_ BitVec 64)) (_2!10338 V!47857)) )
))
(declare-datatypes ((List!27879 0))(
  ( (Nil!27876) (Cons!27875 (h!29084 tuple2!20654) (t!41362 List!27879)) )
))
(declare-datatypes ((ListLongMap!18527 0))(
  ( (ListLongMap!18528 (toList!9279 List!27879)) )
))
(declare-fun lt!566898 () ListLongMap!18527)

(declare-fun lt!566899 () ListLongMap!18527)

(declare-fun -!2051 (ListLongMap!18527 (_ BitVec 64)) ListLongMap!18527)

(assert (=> b!1254416 (= lt!566898 (-!2051 lt!566899 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566903 () ListLongMap!18527)

(declare-fun lt!566901 () ListLongMap!18527)

(assert (=> b!1254416 (= (-!2051 lt!566903 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566901)))

(declare-datatypes ((Unit!41742 0))(
  ( (Unit!41743) )
))
(declare-fun lt!566897 () Unit!41742)

(declare-fun minValueBefore!43 () V!47857)

(declare-fun addThenRemoveForNewKeyIsSame!321 (ListLongMap!18527 (_ BitVec 64) V!47857) Unit!41742)

(assert (=> b!1254416 (= lt!566897 (addThenRemoveForNewKeyIsSame!321 lt!566901 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566904 () ListLongMap!18527)

(declare-fun lt!566900 () ListLongMap!18527)

(assert (=> b!1254416 (and (= lt!566899 lt!566903) (= lt!566900 lt!566904))))

(declare-fun +!4174 (ListLongMap!18527 tuple2!20654) ListLongMap!18527)

(assert (=> b!1254416 (= lt!566903 (+!4174 lt!566901 (tuple2!20655 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47857)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47857)

(declare-fun getCurrentListMap!4522 (array!81392 array!81394 (_ BitVec 32) (_ BitVec 32) V!47857 V!47857 (_ BitVec 32) Int) ListLongMap!18527)

(assert (=> b!1254416 (= lt!566900 (getCurrentListMap!4522 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254416 (= lt!566899 (getCurrentListMap!4522 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254417 () Bool)

(declare-fun res!836403 () Bool)

(assert (=> b!1254417 (=> (not res!836403) (not e!712787))))

(assert (=> b!1254417 (= res!836403 (and (= (size!39794 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39793 _keys!1118) (size!39794 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49582 () Bool)

(declare-fun mapRes!49582 () Bool)

(assert (=> mapIsEmpty!49582 mapRes!49582))

(declare-fun b!1254418 () Bool)

(assert (=> b!1254418 (= e!712787 (not e!712790))))

(declare-fun res!836406 () Bool)

(assert (=> b!1254418 (=> res!836406 e!712790)))

(assert (=> b!1254418 (= res!836406 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254418 (= lt!566901 lt!566904)))

(declare-fun lt!566902 () Unit!41742)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1030 (array!81392 array!81394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47857 V!47857 V!47857 V!47857 (_ BitVec 32) Int) Unit!41742)

(assert (=> b!1254418 (= lt!566902 (lemmaNoChangeToArrayThenSameMapNoExtras!1030 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5666 (array!81392 array!81394 (_ BitVec 32) (_ BitVec 32) V!47857 V!47857 (_ BitVec 32) Int) ListLongMap!18527)

(assert (=> b!1254418 (= lt!566904 (getCurrentListMapNoExtraKeys!5666 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254418 (= lt!566901 (getCurrentListMapNoExtraKeys!5666 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254419 () Bool)

(declare-fun res!836405 () Bool)

(assert (=> b!1254419 (=> (not res!836405) (not e!712787))))

(declare-datatypes ((List!27880 0))(
  ( (Nil!27877) (Cons!27876 (h!29085 (_ BitVec 64)) (t!41363 List!27880)) )
))
(declare-fun arrayNoDuplicates!0 (array!81392 (_ BitVec 32) List!27880) Bool)

(assert (=> b!1254419 (= res!836405 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27877))))

(declare-fun b!1254420 () Bool)

(assert (=> b!1254420 (= e!712789 (and e!712785 mapRes!49582))))

(declare-fun condMapEmpty!49582 () Bool)

(declare-fun mapDefault!49582 () ValueCell!15171)

(assert (=> b!1254420 (= condMapEmpty!49582 (= (arr!39258 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15171)) mapDefault!49582)))))

(declare-fun mapNonEmpty!49582 () Bool)

(declare-fun tp!94408 () Bool)

(assert (=> mapNonEmpty!49582 (= mapRes!49582 (and tp!94408 e!712788))))

(declare-fun mapValue!49582 () ValueCell!15171)

(declare-fun mapKey!49582 () (_ BitVec 32))

(declare-fun mapRest!49582 () (Array (_ BitVec 32) ValueCell!15171))

(assert (=> mapNonEmpty!49582 (= (arr!39258 _values!914) (store mapRest!49582 mapKey!49582 mapValue!49582))))

(assert (= (and start!105272 res!836402) b!1254417))

(assert (= (and b!1254417 res!836403) b!1254415))

(assert (= (and b!1254415 res!836404) b!1254419))

(assert (= (and b!1254419 res!836405) b!1254418))

(assert (= (and b!1254418 (not res!836406)) b!1254416))

(assert (= (and b!1254420 condMapEmpty!49582) mapIsEmpty!49582))

(assert (= (and b!1254420 (not condMapEmpty!49582)) mapNonEmpty!49582))

(get-info :version)

(assert (= (and mapNonEmpty!49582 ((_ is ValueCellFull!15171) mapValue!49582)) b!1254414))

(assert (= (and b!1254420 ((_ is ValueCellFull!15171) mapDefault!49582)) b!1254413))

(assert (= start!105272 b!1254420))

(declare-fun m!1155139 () Bool)

(assert (=> b!1254419 m!1155139))

(declare-fun m!1155141 () Bool)

(assert (=> start!105272 m!1155141))

(declare-fun m!1155143 () Bool)

(assert (=> start!105272 m!1155143))

(declare-fun m!1155145 () Bool)

(assert (=> start!105272 m!1155145))

(declare-fun m!1155147 () Bool)

(assert (=> b!1254415 m!1155147))

(declare-fun m!1155149 () Bool)

(assert (=> mapNonEmpty!49582 m!1155149))

(declare-fun m!1155151 () Bool)

(assert (=> b!1254416 m!1155151))

(declare-fun m!1155153 () Bool)

(assert (=> b!1254416 m!1155153))

(declare-fun m!1155155 () Bool)

(assert (=> b!1254416 m!1155155))

(declare-fun m!1155157 () Bool)

(assert (=> b!1254416 m!1155157))

(declare-fun m!1155159 () Bool)

(assert (=> b!1254416 m!1155159))

(declare-fun m!1155161 () Bool)

(assert (=> b!1254416 m!1155161))

(declare-fun m!1155163 () Bool)

(assert (=> b!1254418 m!1155163))

(declare-fun m!1155165 () Bool)

(assert (=> b!1254418 m!1155165))

(declare-fun m!1155167 () Bool)

(assert (=> b!1254418 m!1155167))

(check-sat b_and!44793 tp_is_empty!31869 (not b!1254419) (not start!105272) (not b!1254416) (not b!1254418) (not mapNonEmpty!49582) (not b!1254415) (not b_next!26967))
(check-sat b_and!44793 (not b_next!26967))
