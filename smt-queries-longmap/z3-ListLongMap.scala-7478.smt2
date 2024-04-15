; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94810 () Bool)

(assert start!94810)

(declare-fun b_free!22045 () Bool)

(declare-fun b_next!22045 () Bool)

(assert (=> start!94810 (= b_free!22045 (not b_next!22045))))

(declare-fun tp!77597 () Bool)

(declare-fun b_and!34861 () Bool)

(assert (=> start!94810 (= tp!77597 b_and!34861)))

(declare-fun mapNonEmpty!40492 () Bool)

(declare-fun mapRes!40492 () Bool)

(declare-fun tp!77596 () Bool)

(declare-fun e!612195 () Bool)

(assert (=> mapNonEmpty!40492 (= mapRes!40492 (and tp!77596 e!612195))))

(declare-datatypes ((V!39609 0))(
  ( (V!39610 (val!12978 Int)) )
))
(declare-datatypes ((ValueCell!12224 0))(
  ( (ValueCellFull!12224 (v!15594 V!39609)) (EmptyCell!12224) )
))
(declare-datatypes ((array!68618 0))(
  ( (array!68619 (arr!33004 (Array (_ BitVec 32) ValueCell!12224)) (size!33542 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68618)

(declare-fun mapValue!40492 () ValueCell!12224)

(declare-fun mapRest!40492 () (Array (_ BitVec 32) ValueCell!12224))

(declare-fun mapKey!40492 () (_ BitVec 32))

(assert (=> mapNonEmpty!40492 (= (arr!33004 _values!955) (store mapRest!40492 mapKey!40492 mapValue!40492))))

(declare-fun res!715081 () Bool)

(declare-fun e!612197 () Bool)

(assert (=> start!94810 (=> (not res!715081) (not e!612197))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94810 (= res!715081 (validMask!0 mask!1515))))

(assert (=> start!94810 e!612197))

(assert (=> start!94810 true))

(declare-fun tp_is_empty!25855 () Bool)

(assert (=> start!94810 tp_is_empty!25855))

(declare-fun e!612192 () Bool)

(declare-fun array_inv!25534 (array!68618) Bool)

(assert (=> start!94810 (and (array_inv!25534 _values!955) e!612192)))

(assert (=> start!94810 tp!77597))

(declare-datatypes ((array!68620 0))(
  ( (array!68621 (arr!33005 (Array (_ BitVec 32) (_ BitVec 64))) (size!33543 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68620)

(declare-fun array_inv!25535 (array!68620) Bool)

(assert (=> start!94810 (array_inv!25535 _keys!1163)))

(declare-fun b!1071951 () Bool)

(declare-fun e!612193 () Bool)

(assert (=> b!1071951 (= e!612192 (and e!612193 mapRes!40492))))

(declare-fun condMapEmpty!40492 () Bool)

(declare-fun mapDefault!40492 () ValueCell!12224)

(assert (=> b!1071951 (= condMapEmpty!40492 (= (arr!33004 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12224)) mapDefault!40492)))))

(declare-fun b!1071952 () Bool)

(declare-fun res!715080 () Bool)

(assert (=> b!1071952 (=> (not res!715080) (not e!612197))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071952 (= res!715080 (and (= (size!33542 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33543 _keys!1163) (size!33542 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071953 () Bool)

(assert (=> b!1071953 (= e!612193 tp_is_empty!25855)))

(declare-fun b!1071954 () Bool)

(declare-fun e!612196 () Bool)

(assert (=> b!1071954 (= e!612196 true)))

(declare-datatypes ((tuple2!16576 0))(
  ( (tuple2!16577 (_1!8299 (_ BitVec 64)) (_2!8299 V!39609)) )
))
(declare-datatypes ((List!23100 0))(
  ( (Nil!23097) (Cons!23096 (h!24305 tuple2!16576) (t!32426 List!23100)) )
))
(declare-datatypes ((ListLongMap!14545 0))(
  ( (ListLongMap!14546 (toList!7288 List!23100)) )
))
(declare-fun lt!474724 () ListLongMap!14545)

(declare-fun lt!474725 () ListLongMap!14545)

(declare-fun -!678 (ListLongMap!14545 (_ BitVec 64)) ListLongMap!14545)

(assert (=> b!1071954 (= lt!474724 (-!678 lt!474725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474720 () ListLongMap!14545)

(declare-fun lt!474728 () ListLongMap!14545)

(assert (=> b!1071954 (= lt!474720 lt!474728)))

(declare-fun zeroValueBefore!47 () V!39609)

(declare-datatypes ((Unit!35153 0))(
  ( (Unit!35154) )
))
(declare-fun lt!474718 () Unit!35153)

(declare-fun lt!474730 () ListLongMap!14545)

(declare-fun minValue!907 () V!39609)

(declare-fun addCommutativeForDiffKeys!736 (ListLongMap!14545 (_ BitVec 64) V!39609 (_ BitVec 64) V!39609) Unit!35153)

(assert (=> b!1071954 (= lt!474718 (addCommutativeForDiffKeys!736 lt!474730 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474727 () ListLongMap!14545)

(assert (=> b!1071954 (= (-!678 lt!474728 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474727)))

(declare-fun lt!474721 () tuple2!16576)

(declare-fun +!3221 (ListLongMap!14545 tuple2!16576) ListLongMap!14545)

(assert (=> b!1071954 (= lt!474728 (+!3221 lt!474727 lt!474721))))

(declare-fun lt!474726 () Unit!35153)

(declare-fun addThenRemoveForNewKeyIsSame!59 (ListLongMap!14545 (_ BitVec 64) V!39609) Unit!35153)

(assert (=> b!1071954 (= lt!474726 (addThenRemoveForNewKeyIsSame!59 lt!474727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474723 () tuple2!16576)

(assert (=> b!1071954 (= lt!474727 (+!3221 lt!474730 lt!474723))))

(declare-fun e!612191 () Bool)

(assert (=> b!1071954 e!612191))

(declare-fun res!715077 () Bool)

(assert (=> b!1071954 (=> (not res!715077) (not e!612191))))

(assert (=> b!1071954 (= res!715077 (= lt!474725 lt!474720))))

(assert (=> b!1071954 (= lt!474720 (+!3221 (+!3221 lt!474730 lt!474721) lt!474723))))

(assert (=> b!1071954 (= lt!474723 (tuple2!16577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071954 (= lt!474721 (tuple2!16577 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474719 () ListLongMap!14545)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39609)

(declare-fun getCurrentListMap!4091 (array!68620 array!68618 (_ BitVec 32) (_ BitVec 32) V!39609 V!39609 (_ BitVec 32) Int) ListLongMap!14545)

(assert (=> b!1071954 (= lt!474719 (getCurrentListMap!4091 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071954 (= lt!474725 (getCurrentListMap!4091 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071955 () Bool)

(assert (=> b!1071955 (= e!612197 (not e!612196))))

(declare-fun res!715078 () Bool)

(assert (=> b!1071955 (=> res!715078 e!612196)))

(assert (=> b!1071955 (= res!715078 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!474729 () ListLongMap!14545)

(assert (=> b!1071955 (= lt!474730 lt!474729)))

(declare-fun lt!474722 () Unit!35153)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!864 (array!68620 array!68618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39609 V!39609 V!39609 V!39609 (_ BitVec 32) Int) Unit!35153)

(assert (=> b!1071955 (= lt!474722 (lemmaNoChangeToArrayThenSameMapNoExtras!864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3870 (array!68620 array!68618 (_ BitVec 32) (_ BitVec 32) V!39609 V!39609 (_ BitVec 32) Int) ListLongMap!14545)

(assert (=> b!1071955 (= lt!474729 (getCurrentListMapNoExtraKeys!3870 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071955 (= lt!474730 (getCurrentListMapNoExtraKeys!3870 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071956 () Bool)

(declare-fun res!715079 () Bool)

(assert (=> b!1071956 (=> (not res!715079) (not e!612197))))

(declare-datatypes ((List!23101 0))(
  ( (Nil!23098) (Cons!23097 (h!24306 (_ BitVec 64)) (t!32427 List!23101)) )
))
(declare-fun arrayNoDuplicates!0 (array!68620 (_ BitVec 32) List!23101) Bool)

(assert (=> b!1071956 (= res!715079 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23098))))

(declare-fun b!1071957 () Bool)

(assert (=> b!1071957 (= e!612191 (= lt!474719 (+!3221 lt!474729 lt!474723)))))

(declare-fun b!1071958 () Bool)

(declare-fun res!715076 () Bool)

(assert (=> b!1071958 (=> (not res!715076) (not e!612197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68620 (_ BitVec 32)) Bool)

(assert (=> b!1071958 (= res!715076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071959 () Bool)

(assert (=> b!1071959 (= e!612195 tp_is_empty!25855)))

(declare-fun mapIsEmpty!40492 () Bool)

(assert (=> mapIsEmpty!40492 mapRes!40492))

(assert (= (and start!94810 res!715081) b!1071952))

(assert (= (and b!1071952 res!715080) b!1071958))

(assert (= (and b!1071958 res!715076) b!1071956))

(assert (= (and b!1071956 res!715079) b!1071955))

(assert (= (and b!1071955 (not res!715078)) b!1071954))

(assert (= (and b!1071954 res!715077) b!1071957))

(assert (= (and b!1071951 condMapEmpty!40492) mapIsEmpty!40492))

(assert (= (and b!1071951 (not condMapEmpty!40492)) mapNonEmpty!40492))

(get-info :version)

(assert (= (and mapNonEmpty!40492 ((_ is ValueCellFull!12224) mapValue!40492)) b!1071959))

(assert (= (and b!1071951 ((_ is ValueCellFull!12224) mapDefault!40492)) b!1071953))

(assert (= start!94810 b!1071951))

(declare-fun m!990267 () Bool)

(assert (=> b!1071954 m!990267))

(declare-fun m!990269 () Bool)

(assert (=> b!1071954 m!990269))

(declare-fun m!990271 () Bool)

(assert (=> b!1071954 m!990271))

(declare-fun m!990273 () Bool)

(assert (=> b!1071954 m!990273))

(declare-fun m!990275 () Bool)

(assert (=> b!1071954 m!990275))

(declare-fun m!990277 () Bool)

(assert (=> b!1071954 m!990277))

(declare-fun m!990279 () Bool)

(assert (=> b!1071954 m!990279))

(declare-fun m!990281 () Bool)

(assert (=> b!1071954 m!990281))

(declare-fun m!990283 () Bool)

(assert (=> b!1071954 m!990283))

(assert (=> b!1071954 m!990279))

(declare-fun m!990285 () Bool)

(assert (=> b!1071954 m!990285))

(declare-fun m!990287 () Bool)

(assert (=> start!94810 m!990287))

(declare-fun m!990289 () Bool)

(assert (=> start!94810 m!990289))

(declare-fun m!990291 () Bool)

(assert (=> start!94810 m!990291))

(declare-fun m!990293 () Bool)

(assert (=> b!1071957 m!990293))

(declare-fun m!990295 () Bool)

(assert (=> b!1071956 m!990295))

(declare-fun m!990297 () Bool)

(assert (=> mapNonEmpty!40492 m!990297))

(declare-fun m!990299 () Bool)

(assert (=> b!1071958 m!990299))

(declare-fun m!990301 () Bool)

(assert (=> b!1071955 m!990301))

(declare-fun m!990303 () Bool)

(assert (=> b!1071955 m!990303))

(declare-fun m!990305 () Bool)

(assert (=> b!1071955 m!990305))

(check-sat (not b!1071954) (not b!1071957) (not b!1071956) (not mapNonEmpty!40492) b_and!34861 (not start!94810) (not b!1071958) (not b!1071955) tp_is_empty!25855 (not b_next!22045))
(check-sat b_and!34861 (not b_next!22045))
