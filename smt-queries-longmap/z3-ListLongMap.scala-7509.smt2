; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95466 () Bool)

(assert start!95466)

(declare-fun b_free!22231 () Bool)

(declare-fun b_next!22231 () Bool)

(assert (=> start!95466 (= b_free!22231 (not b_next!22231))))

(declare-fun tp!78191 () Bool)

(declare-fun b_and!35219 () Bool)

(assert (=> start!95466 (= tp!78191 b_and!35219)))

(declare-fun mapIsEmpty!40807 () Bool)

(declare-fun mapRes!40807 () Bool)

(assert (=> mapIsEmpty!40807 mapRes!40807))

(declare-fun b!1077717 () Bool)

(declare-fun e!616123 () Bool)

(assert (=> b!1077717 (= e!616123 true)))

(declare-datatypes ((V!39857 0))(
  ( (V!39858 (val!13071 Int)) )
))
(declare-datatypes ((tuple2!16648 0))(
  ( (tuple2!16649 (_1!8335 (_ BitVec 64)) (_2!8335 V!39857)) )
))
(declare-datatypes ((List!23196 0))(
  ( (Nil!23193) (Cons!23192 (h!24410 tuple2!16648) (t!32547 List!23196)) )
))
(declare-datatypes ((ListLongMap!14625 0))(
  ( (ListLongMap!14626 (toList!7328 List!23196)) )
))
(declare-fun lt!478601 () ListLongMap!14625)

(declare-fun lt!478609 () tuple2!16648)

(declare-fun -!706 (ListLongMap!14625 (_ BitVec 64)) ListLongMap!14625)

(declare-fun +!3255 (ListLongMap!14625 tuple2!16648) ListLongMap!14625)

(assert (=> b!1077717 (= (-!706 (+!3255 lt!478601 lt!478609) #b0000000000000000000000000000000000000000000000000000000000000000) lt!478601)))

(declare-datatypes ((Unit!35407 0))(
  ( (Unit!35408) )
))
(declare-fun lt!478606 () Unit!35407)

(declare-fun zeroValueBefore!47 () V!39857)

(declare-fun addThenRemoveForNewKeyIsSame!78 (ListLongMap!14625 (_ BitVec 64) V!39857) Unit!35407)

(assert (=> b!1077717 (= lt!478606 (addThenRemoveForNewKeyIsSame!78 lt!478601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!478605 () ListLongMap!14625)

(declare-fun lt!478607 () tuple2!16648)

(assert (=> b!1077717 (= lt!478601 (+!3255 lt!478605 lt!478607))))

(declare-fun e!616124 () Bool)

(assert (=> b!1077717 e!616124))

(declare-fun res!717929 () Bool)

(assert (=> b!1077717 (=> (not res!717929) (not e!616124))))

(declare-fun lt!478604 () ListLongMap!14625)

(assert (=> b!1077717 (= res!717929 (= lt!478604 (+!3255 (+!3255 lt!478605 lt!478609) lt!478607)))))

(declare-fun minValue!907 () V!39857)

(assert (=> b!1077717 (= lt!478607 (tuple2!16649 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1077717 (= lt!478609 (tuple2!16649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12317 0))(
  ( (ValueCellFull!12317 (v!15695 V!39857)) (EmptyCell!12317) )
))
(declare-datatypes ((array!69099 0))(
  ( (array!69100 (arr!33226 (Array (_ BitVec 32) ValueCell!12317)) (size!33763 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69099)

(declare-fun lt!478602 () ListLongMap!14625)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39857)

(declare-datatypes ((array!69101 0))(
  ( (array!69102 (arr!33227 (Array (_ BitVec 32) (_ BitVec 64))) (size!33764 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69101)

(declare-fun getCurrentListMap!4185 (array!69101 array!69099 (_ BitVec 32) (_ BitVec 32) V!39857 V!39857 (_ BitVec 32) Int) ListLongMap!14625)

(assert (=> b!1077717 (= lt!478602 (getCurrentListMap!4185 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1077717 (= lt!478604 (getCurrentListMap!4185 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077718 () Bool)

(declare-fun res!717931 () Bool)

(declare-fun e!616125 () Bool)

(assert (=> b!1077718 (=> (not res!717931) (not e!616125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69101 (_ BitVec 32)) Bool)

(assert (=> b!1077718 (= res!717931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!717932 () Bool)

(assert (=> start!95466 (=> (not res!717932) (not e!616125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95466 (= res!717932 (validMask!0 mask!1515))))

(assert (=> start!95466 e!616125))

(assert (=> start!95466 true))

(declare-fun tp_is_empty!26041 () Bool)

(assert (=> start!95466 tp_is_empty!26041))

(declare-fun e!616122 () Bool)

(declare-fun array_inv!25714 (array!69099) Bool)

(assert (=> start!95466 (and (array_inv!25714 _values!955) e!616122)))

(assert (=> start!95466 tp!78191))

(declare-fun array_inv!25715 (array!69101) Bool)

(assert (=> start!95466 (array_inv!25715 _keys!1163)))

(declare-fun b!1077719 () Bool)

(declare-fun e!616128 () Bool)

(assert (=> b!1077719 (= e!616128 tp_is_empty!26041)))

(declare-fun b!1077720 () Bool)

(assert (=> b!1077720 (= e!616125 (not e!616123))))

(declare-fun res!717928 () Bool)

(assert (=> b!1077720 (=> res!717928 e!616123)))

(assert (=> b!1077720 (= res!717928 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!478608 () ListLongMap!14625)

(assert (=> b!1077720 (= lt!478605 lt!478608)))

(declare-fun lt!478603 () Unit!35407)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!899 (array!69101 array!69099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39857 V!39857 V!39857 V!39857 (_ BitVec 32) Int) Unit!35407)

(assert (=> b!1077720 (= lt!478603 (lemmaNoChangeToArrayThenSameMapNoExtras!899 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3919 (array!69101 array!69099 (_ BitVec 32) (_ BitVec 32) V!39857 V!39857 (_ BitVec 32) Int) ListLongMap!14625)

(assert (=> b!1077720 (= lt!478608 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1077720 (= lt!478605 (getCurrentListMapNoExtraKeys!3919 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077721 () Bool)

(assert (=> b!1077721 (= e!616124 (= lt!478602 (+!3255 lt!478608 lt!478607)))))

(declare-fun b!1077722 () Bool)

(declare-fun e!616126 () Bool)

(assert (=> b!1077722 (= e!616126 tp_is_empty!26041)))

(declare-fun b!1077723 () Bool)

(declare-fun res!717930 () Bool)

(assert (=> b!1077723 (=> (not res!717930) (not e!616125))))

(declare-datatypes ((List!23197 0))(
  ( (Nil!23194) (Cons!23193 (h!24411 (_ BitVec 64)) (t!32548 List!23197)) )
))
(declare-fun arrayNoDuplicates!0 (array!69101 (_ BitVec 32) List!23197) Bool)

(assert (=> b!1077723 (= res!717930 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23194))))

(declare-fun b!1077724 () Bool)

(declare-fun res!717933 () Bool)

(assert (=> b!1077724 (=> (not res!717933) (not e!616125))))

(assert (=> b!1077724 (= res!717933 (and (= (size!33763 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33764 _keys!1163) (size!33763 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1077725 () Bool)

(assert (=> b!1077725 (= e!616122 (and e!616126 mapRes!40807))))

(declare-fun condMapEmpty!40807 () Bool)

(declare-fun mapDefault!40807 () ValueCell!12317)

(assert (=> b!1077725 (= condMapEmpty!40807 (= (arr!33226 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12317)) mapDefault!40807)))))

(declare-fun mapNonEmpty!40807 () Bool)

(declare-fun tp!78190 () Bool)

(assert (=> mapNonEmpty!40807 (= mapRes!40807 (and tp!78190 e!616128))))

(declare-fun mapKey!40807 () (_ BitVec 32))

(declare-fun mapValue!40807 () ValueCell!12317)

(declare-fun mapRest!40807 () (Array (_ BitVec 32) ValueCell!12317))

(assert (=> mapNonEmpty!40807 (= (arr!33226 _values!955) (store mapRest!40807 mapKey!40807 mapValue!40807))))

(assert (= (and start!95466 res!717932) b!1077724))

(assert (= (and b!1077724 res!717933) b!1077718))

(assert (= (and b!1077718 res!717931) b!1077723))

(assert (= (and b!1077723 res!717930) b!1077720))

(assert (= (and b!1077720 (not res!717928)) b!1077717))

(assert (= (and b!1077717 res!717929) b!1077721))

(assert (= (and b!1077725 condMapEmpty!40807) mapIsEmpty!40807))

(assert (= (and b!1077725 (not condMapEmpty!40807)) mapNonEmpty!40807))

(get-info :version)

(assert (= (and mapNonEmpty!40807 ((_ is ValueCellFull!12317) mapValue!40807)) b!1077719))

(assert (= (and b!1077725 ((_ is ValueCellFull!12317) mapDefault!40807)) b!1077722))

(assert (= start!95466 b!1077725))

(declare-fun m!996947 () Bool)

(assert (=> start!95466 m!996947))

(declare-fun m!996949 () Bool)

(assert (=> start!95466 m!996949))

(declare-fun m!996951 () Bool)

(assert (=> start!95466 m!996951))

(declare-fun m!996953 () Bool)

(assert (=> b!1077723 m!996953))

(declare-fun m!996955 () Bool)

(assert (=> b!1077717 m!996955))

(declare-fun m!996957 () Bool)

(assert (=> b!1077717 m!996957))

(declare-fun m!996959 () Bool)

(assert (=> b!1077717 m!996959))

(declare-fun m!996961 () Bool)

(assert (=> b!1077717 m!996961))

(assert (=> b!1077717 m!996957))

(declare-fun m!996963 () Bool)

(assert (=> b!1077717 m!996963))

(declare-fun m!996965 () Bool)

(assert (=> b!1077717 m!996965))

(declare-fun m!996967 () Bool)

(assert (=> b!1077717 m!996967))

(assert (=> b!1077717 m!996965))

(declare-fun m!996969 () Bool)

(assert (=> b!1077717 m!996969))

(declare-fun m!996971 () Bool)

(assert (=> mapNonEmpty!40807 m!996971))

(declare-fun m!996973 () Bool)

(assert (=> b!1077718 m!996973))

(declare-fun m!996975 () Bool)

(assert (=> b!1077721 m!996975))

(declare-fun m!996977 () Bool)

(assert (=> b!1077720 m!996977))

(declare-fun m!996979 () Bool)

(assert (=> b!1077720 m!996979))

(declare-fun m!996981 () Bool)

(assert (=> b!1077720 m!996981))

(check-sat (not start!95466) (not b!1077721) b_and!35219 (not b!1077723) (not b!1077717) (not mapNonEmpty!40807) (not b!1077720) (not b_next!22231) tp_is_empty!26041 (not b!1077718))
(check-sat b_and!35219 (not b_next!22231))
