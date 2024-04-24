; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94370 () Bool)

(assert start!94370)

(declare-fun b_free!21535 () Bool)

(declare-fun b_next!21535 () Bool)

(assert (=> start!94370 (= b_free!21535 (not b_next!21535))))

(declare-fun tp!76040 () Bool)

(declare-fun b_and!34295 () Bool)

(assert (=> start!94370 (= tp!76040 b_and!34295)))

(declare-fun mapNonEmpty!39700 () Bool)

(declare-fun mapRes!39700 () Bool)

(declare-fun tp!76039 () Bool)

(declare-fun e!607564 () Bool)

(assert (=> mapNonEmpty!39700 (= mapRes!39700 (and tp!76039 e!607564))))

(declare-fun mapKey!39700 () (_ BitVec 32))

(declare-datatypes ((V!38929 0))(
  ( (V!38930 (val!12723 Int)) )
))
(declare-datatypes ((ValueCell!11969 0))(
  ( (ValueCellFull!11969 (v!15331 V!38929)) (EmptyCell!11969) )
))
(declare-datatypes ((array!67735 0))(
  ( (array!67736 (arr!32565 (Array (_ BitVec 32) ValueCell!11969)) (size!33102 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67735)

(declare-fun mapValue!39700 () ValueCell!11969)

(declare-fun mapRest!39700 () (Array (_ BitVec 32) ValueCell!11969))

(assert (=> mapNonEmpty!39700 (= (arr!32565 _values!955) (store mapRest!39700 mapKey!39700 mapValue!39700))))

(declare-fun b!1065843 () Bool)

(declare-fun e!607562 () Bool)

(declare-fun e!607566 () Bool)

(assert (=> b!1065843 (= e!607562 (and e!607566 mapRes!39700))))

(declare-fun condMapEmpty!39700 () Bool)

(declare-fun mapDefault!39700 () ValueCell!11969)

(assert (=> b!1065843 (= condMapEmpty!39700 (= (arr!32565 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11969)) mapDefault!39700)))))

(declare-fun b!1065844 () Bool)

(declare-fun res!711162 () Bool)

(declare-fun e!607567 () Bool)

(assert (=> b!1065844 (=> (not res!711162) (not e!607567))))

(declare-datatypes ((array!67737 0))(
  ( (array!67738 (arr!32566 (Array (_ BitVec 32) (_ BitVec 64))) (size!33103 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67737)

(declare-datatypes ((List!22678 0))(
  ( (Nil!22675) (Cons!22674 (h!23892 (_ BitVec 64)) (t!31987 List!22678)) )
))
(declare-fun arrayNoDuplicates!0 (array!67737 (_ BitVec 32) List!22678) Bool)

(assert (=> b!1065844 (= res!711162 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22675))))

(declare-fun b!1065845 () Bool)

(declare-fun tp_is_empty!25345 () Bool)

(assert (=> b!1065845 (= e!607566 tp_is_empty!25345)))

(declare-fun b!1065846 () Bool)

(declare-fun res!711160 () Bool)

(assert (=> b!1065846 (=> (not res!711160) (not e!607567))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67737 (_ BitVec 32)) Bool)

(assert (=> b!1065846 (= res!711160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065847 () Bool)

(declare-fun res!711161 () Bool)

(assert (=> b!1065847 (=> (not res!711161) (not e!607567))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065847 (= res!711161 (and (= (size!33102 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33103 _keys!1163) (size!33102 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065848 () Bool)

(assert (=> b!1065848 (= e!607564 tp_is_empty!25345)))

(declare-fun res!711164 () Bool)

(assert (=> start!94370 (=> (not res!711164) (not e!607567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94370 (= res!711164 (validMask!0 mask!1515))))

(assert (=> start!94370 e!607567))

(assert (=> start!94370 true))

(assert (=> start!94370 tp_is_empty!25345))

(declare-fun array_inv!25242 (array!67735) Bool)

(assert (=> start!94370 (and (array_inv!25242 _values!955) e!607562)))

(assert (=> start!94370 tp!76040))

(declare-fun array_inv!25243 (array!67737) Bool)

(assert (=> start!94370 (array_inv!25243 _keys!1163)))

(declare-fun mapIsEmpty!39700 () Bool)

(assert (=> mapIsEmpty!39700 mapRes!39700))

(declare-fun b!1065849 () Bool)

(declare-fun e!607563 () Bool)

(assert (=> b!1065849 (= e!607567 (not e!607563))))

(declare-fun res!711163 () Bool)

(assert (=> b!1065849 (=> res!711163 e!607563)))

(assert (=> b!1065849 (= res!711163 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16104 0))(
  ( (tuple2!16105 (_1!8063 (_ BitVec 64)) (_2!8063 V!38929)) )
))
(declare-datatypes ((List!22679 0))(
  ( (Nil!22676) (Cons!22675 (h!23893 tuple2!16104) (t!31988 List!22679)) )
))
(declare-datatypes ((ListLongMap!14081 0))(
  ( (ListLongMap!14082 (toList!7056 List!22679)) )
))
(declare-fun lt!469756 () ListLongMap!14081)

(declare-fun lt!469753 () ListLongMap!14081)

(assert (=> b!1065849 (= lt!469756 lt!469753)))

(declare-fun zeroValueBefore!47 () V!38929)

(declare-fun minValue!907 () V!38929)

(declare-datatypes ((Unit!34911 0))(
  ( (Unit!34912) )
))
(declare-fun lt!469754 () Unit!34911)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38929)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!691 (array!67737 array!67735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38929 V!38929 V!38929 V!38929 (_ BitVec 32) Int) Unit!34911)

(assert (=> b!1065849 (= lt!469754 (lemmaNoChangeToArrayThenSameMapNoExtras!691 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3688 (array!67737 array!67735 (_ BitVec 32) (_ BitVec 32) V!38929 V!38929 (_ BitVec 32) Int) ListLongMap!14081)

(assert (=> b!1065849 (= lt!469753 (getCurrentListMapNoExtraKeys!3688 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065849 (= lt!469756 (getCurrentListMapNoExtraKeys!3688 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065850 () Bool)

(assert (=> b!1065850 (= e!607563 true)))

(declare-fun lt!469755 () ListLongMap!14081)

(declare-fun getCurrentListMap!4011 (array!67737 array!67735 (_ BitVec 32) (_ BitVec 32) V!38929 V!38929 (_ BitVec 32) Int) ListLongMap!14081)

(assert (=> b!1065850 (= lt!469755 (getCurrentListMap!4011 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94370 res!711164) b!1065847))

(assert (= (and b!1065847 res!711161) b!1065846))

(assert (= (and b!1065846 res!711160) b!1065844))

(assert (= (and b!1065844 res!711162) b!1065849))

(assert (= (and b!1065849 (not res!711163)) b!1065850))

(assert (= (and b!1065843 condMapEmpty!39700) mapIsEmpty!39700))

(assert (= (and b!1065843 (not condMapEmpty!39700)) mapNonEmpty!39700))

(get-info :version)

(assert (= (and mapNonEmpty!39700 ((_ is ValueCellFull!11969) mapValue!39700)) b!1065848))

(assert (= (and b!1065843 ((_ is ValueCellFull!11969) mapDefault!39700)) b!1065845))

(assert (= start!94370 b!1065843))

(declare-fun m!984721 () Bool)

(assert (=> b!1065846 m!984721))

(declare-fun m!984723 () Bool)

(assert (=> b!1065850 m!984723))

(declare-fun m!984725 () Bool)

(assert (=> b!1065844 m!984725))

(declare-fun m!984727 () Bool)

(assert (=> start!94370 m!984727))

(declare-fun m!984729 () Bool)

(assert (=> start!94370 m!984729))

(declare-fun m!984731 () Bool)

(assert (=> start!94370 m!984731))

(declare-fun m!984733 () Bool)

(assert (=> b!1065849 m!984733))

(declare-fun m!984735 () Bool)

(assert (=> b!1065849 m!984735))

(declare-fun m!984737 () Bool)

(assert (=> b!1065849 m!984737))

(declare-fun m!984739 () Bool)

(assert (=> mapNonEmpty!39700 m!984739))

(check-sat b_and!34295 (not mapNonEmpty!39700) tp_is_empty!25345 (not b!1065850) (not b!1065844) (not start!94370) (not b!1065846) (not b_next!21535) (not b!1065849))
(check-sat b_and!34295 (not b_next!21535))
