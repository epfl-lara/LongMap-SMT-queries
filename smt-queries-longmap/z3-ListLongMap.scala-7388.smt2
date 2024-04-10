; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94092 () Bool)

(assert start!94092)

(declare-fun b_free!21507 () Bool)

(declare-fun b_next!21507 () Bool)

(assert (=> start!94092 (= b_free!21507 (not b_next!21507))))

(declare-fun tp!75953 () Bool)

(declare-fun b_and!34249 () Bool)

(assert (=> start!94092 (= tp!75953 b_and!34249)))

(declare-fun res!710421 () Bool)

(declare-fun e!606425 () Bool)

(assert (=> start!94092 (=> (not res!710421) (not e!606425))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94092 (= res!710421 (validMask!0 mask!1515))))

(assert (=> start!94092 e!606425))

(assert (=> start!94092 true))

(declare-fun tp_is_empty!25317 () Bool)

(assert (=> start!94092 tp_is_empty!25317))

(declare-datatypes ((V!38891 0))(
  ( (V!38892 (val!12709 Int)) )
))
(declare-datatypes ((ValueCell!11955 0))(
  ( (ValueCellFull!11955 (v!15321 V!38891)) (EmptyCell!11955) )
))
(declare-datatypes ((array!67629 0))(
  ( (array!67630 (arr!32519 (Array (_ BitVec 32) ValueCell!11955)) (size!33055 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67629)

(declare-fun e!606423 () Bool)

(declare-fun array_inv!25184 (array!67629) Bool)

(assert (=> start!94092 (and (array_inv!25184 _values!955) e!606423)))

(assert (=> start!94092 tp!75953))

(declare-datatypes ((array!67631 0))(
  ( (array!67632 (arr!32520 (Array (_ BitVec 32) (_ BitVec 64))) (size!33056 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67631)

(declare-fun array_inv!25185 (array!67631) Bool)

(assert (=> start!94092 (array_inv!25185 _keys!1163)))

(declare-fun b!1064117 () Bool)

(declare-fun e!606422 () Bool)

(declare-fun mapRes!39655 () Bool)

(assert (=> b!1064117 (= e!606423 (and e!606422 mapRes!39655))))

(declare-fun condMapEmpty!39655 () Bool)

(declare-fun mapDefault!39655 () ValueCell!11955)

(assert (=> b!1064117 (= condMapEmpty!39655 (= (arr!32519 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11955)) mapDefault!39655)))))

(declare-fun mapIsEmpty!39655 () Bool)

(assert (=> mapIsEmpty!39655 mapRes!39655))

(declare-fun b!1064118 () Bool)

(assert (=> b!1064118 (= e!606425 (not true))))

(declare-datatypes ((tuple2!16094 0))(
  ( (tuple2!16095 (_1!8058 (_ BitVec 64)) (_2!8058 V!38891)) )
))
(declare-datatypes ((List!22669 0))(
  ( (Nil!22666) (Cons!22665 (h!23874 tuple2!16094) (t!31984 List!22669)) )
))
(declare-datatypes ((ListLongMap!14063 0))(
  ( (ListLongMap!14064 (toList!7047 List!22669)) )
))
(declare-fun lt!469052 () ListLongMap!14063)

(declare-fun lt!469053 () ListLongMap!14063)

(assert (=> b!1064118 (= lt!469052 lt!469053)))

(declare-fun zeroValueBefore!47 () V!38891)

(declare-datatypes ((Unit!34894 0))(
  ( (Unit!34895) )
))
(declare-fun lt!469054 () Unit!34894)

(declare-fun minValue!907 () V!38891)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38891)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!676 (array!67631 array!67629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38891 V!38891 V!38891 V!38891 (_ BitVec 32) Int) Unit!34894)

(assert (=> b!1064118 (= lt!469054 (lemmaNoChangeToArrayThenSameMapNoExtras!676 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3639 (array!67631 array!67629 (_ BitVec 32) (_ BitVec 32) V!38891 V!38891 (_ BitVec 32) Int) ListLongMap!14063)

(assert (=> b!1064118 (= lt!469053 (getCurrentListMapNoExtraKeys!3639 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064118 (= lt!469052 (getCurrentListMapNoExtraKeys!3639 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064119 () Bool)

(declare-fun e!606424 () Bool)

(assert (=> b!1064119 (= e!606424 tp_is_empty!25317)))

(declare-fun b!1064120 () Bool)

(declare-fun res!710419 () Bool)

(assert (=> b!1064120 (=> (not res!710419) (not e!606425))))

(assert (=> b!1064120 (= res!710419 (and (= (size!33055 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33056 _keys!1163) (size!33055 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064121 () Bool)

(declare-fun res!710420 () Bool)

(assert (=> b!1064121 (=> (not res!710420) (not e!606425))))

(declare-datatypes ((List!22670 0))(
  ( (Nil!22667) (Cons!22666 (h!23875 (_ BitVec 64)) (t!31985 List!22670)) )
))
(declare-fun arrayNoDuplicates!0 (array!67631 (_ BitVec 32) List!22670) Bool)

(assert (=> b!1064121 (= res!710420 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22667))))

(declare-fun b!1064122 () Bool)

(assert (=> b!1064122 (= e!606422 tp_is_empty!25317)))

(declare-fun b!1064123 () Bool)

(declare-fun res!710422 () Bool)

(assert (=> b!1064123 (=> (not res!710422) (not e!606425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67631 (_ BitVec 32)) Bool)

(assert (=> b!1064123 (= res!710422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39655 () Bool)

(declare-fun tp!75952 () Bool)

(assert (=> mapNonEmpty!39655 (= mapRes!39655 (and tp!75952 e!606424))))

(declare-fun mapValue!39655 () ValueCell!11955)

(declare-fun mapRest!39655 () (Array (_ BitVec 32) ValueCell!11955))

(declare-fun mapKey!39655 () (_ BitVec 32))

(assert (=> mapNonEmpty!39655 (= (arr!32519 _values!955) (store mapRest!39655 mapKey!39655 mapValue!39655))))

(assert (= (and start!94092 res!710421) b!1064120))

(assert (= (and b!1064120 res!710419) b!1064123))

(assert (= (and b!1064123 res!710422) b!1064121))

(assert (= (and b!1064121 res!710420) b!1064118))

(assert (= (and b!1064117 condMapEmpty!39655) mapIsEmpty!39655))

(assert (= (and b!1064117 (not condMapEmpty!39655)) mapNonEmpty!39655))

(get-info :version)

(assert (= (and mapNonEmpty!39655 ((_ is ValueCellFull!11955) mapValue!39655)) b!1064119))

(assert (= (and b!1064117 ((_ is ValueCellFull!11955) mapDefault!39655)) b!1064122))

(assert (= start!94092 b!1064117))

(declare-fun m!982719 () Bool)

(assert (=> start!94092 m!982719))

(declare-fun m!982721 () Bool)

(assert (=> start!94092 m!982721))

(declare-fun m!982723 () Bool)

(assert (=> start!94092 m!982723))

(declare-fun m!982725 () Bool)

(assert (=> mapNonEmpty!39655 m!982725))

(declare-fun m!982727 () Bool)

(assert (=> b!1064121 m!982727))

(declare-fun m!982729 () Bool)

(assert (=> b!1064123 m!982729))

(declare-fun m!982731 () Bool)

(assert (=> b!1064118 m!982731))

(declare-fun m!982733 () Bool)

(assert (=> b!1064118 m!982733))

(declare-fun m!982735 () Bool)

(assert (=> b!1064118 m!982735))

(check-sat b_and!34249 (not b!1064121) (not b_next!21507) (not b!1064123) (not b!1064118) tp_is_empty!25317 (not mapNonEmpty!39655) (not start!94092))
(check-sat b_and!34249 (not b_next!21507))
