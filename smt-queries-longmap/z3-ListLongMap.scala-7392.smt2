; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94364 () Bool)

(assert start!94364)

(declare-fun b_free!21529 () Bool)

(declare-fun b_next!21529 () Bool)

(assert (=> start!94364 (= b_free!21529 (not b_next!21529))))

(declare-fun tp!76021 () Bool)

(declare-fun b_and!34289 () Bool)

(assert (=> start!94364 (= tp!76021 b_and!34289)))

(declare-fun b!1065771 () Bool)

(declare-fun res!711115 () Bool)

(declare-fun e!607508 () Bool)

(assert (=> b!1065771 (=> (not res!711115) (not e!607508))))

(declare-datatypes ((array!67723 0))(
  ( (array!67724 (arr!32559 (Array (_ BitVec 32) (_ BitVec 64))) (size!33096 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67723)

(declare-datatypes ((List!22673 0))(
  ( (Nil!22670) (Cons!22669 (h!23887 (_ BitVec 64)) (t!31982 List!22673)) )
))
(declare-fun arrayNoDuplicates!0 (array!67723 (_ BitVec 32) List!22673) Bool)

(assert (=> b!1065771 (= res!711115 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22670))))

(declare-fun b!1065772 () Bool)

(declare-fun e!607509 () Bool)

(assert (=> b!1065772 (= e!607509 true)))

(declare-datatypes ((V!38921 0))(
  ( (V!38922 (val!12720 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38921)

(declare-datatypes ((tuple2!16100 0))(
  ( (tuple2!16101 (_1!8061 (_ BitVec 64)) (_2!8061 V!38921)) )
))
(declare-datatypes ((List!22674 0))(
  ( (Nil!22671) (Cons!22670 (h!23888 tuple2!16100) (t!31983 List!22674)) )
))
(declare-datatypes ((ListLongMap!14077 0))(
  ( (ListLongMap!14078 (toList!7054 List!22674)) )
))
(declare-fun lt!469718 () ListLongMap!14077)

(declare-datatypes ((ValueCell!11966 0))(
  ( (ValueCellFull!11966 (v!15328 V!38921)) (EmptyCell!11966) )
))
(declare-datatypes ((array!67725 0))(
  ( (array!67726 (arr!32560 (Array (_ BitVec 32) ValueCell!11966)) (size!33097 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67725)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38921)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4009 (array!67723 array!67725 (_ BitVec 32) (_ BitVec 32) V!38921 V!38921 (_ BitVec 32) Int) ListLongMap!14077)

(assert (=> b!1065772 (= lt!469718 (getCurrentListMap!4009 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39691 () Bool)

(declare-fun mapRes!39691 () Bool)

(assert (=> mapIsEmpty!39691 mapRes!39691))

(declare-fun mapNonEmpty!39691 () Bool)

(declare-fun tp!76022 () Bool)

(declare-fun e!607513 () Bool)

(assert (=> mapNonEmpty!39691 (= mapRes!39691 (and tp!76022 e!607513))))

(declare-fun mapRest!39691 () (Array (_ BitVec 32) ValueCell!11966))

(declare-fun mapValue!39691 () ValueCell!11966)

(declare-fun mapKey!39691 () (_ BitVec 32))

(assert (=> mapNonEmpty!39691 (= (arr!32560 _values!955) (store mapRest!39691 mapKey!39691 mapValue!39691))))

(declare-fun b!1065774 () Bool)

(declare-fun res!711117 () Bool)

(assert (=> b!1065774 (=> (not res!711117) (not e!607508))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1065774 (= res!711117 (and (= (size!33097 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33096 _keys!1163) (size!33097 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065775 () Bool)

(declare-fun e!607510 () Bool)

(declare-fun tp_is_empty!25339 () Bool)

(assert (=> b!1065775 (= e!607510 tp_is_empty!25339)))

(declare-fun b!1065776 () Bool)

(declare-fun res!711118 () Bool)

(assert (=> b!1065776 (=> (not res!711118) (not e!607508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67723 (_ BitVec 32)) Bool)

(assert (=> b!1065776 (= res!711118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065773 () Bool)

(assert (=> b!1065773 (= e!607508 (not e!607509))))

(declare-fun res!711119 () Bool)

(assert (=> b!1065773 (=> res!711119 e!607509)))

(assert (=> b!1065773 (= res!711119 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469719 () ListLongMap!14077)

(declare-fun lt!469720 () ListLongMap!14077)

(assert (=> b!1065773 (= lt!469719 lt!469720)))

(declare-datatypes ((Unit!34909 0))(
  ( (Unit!34910) )
))
(declare-fun lt!469717 () Unit!34909)

(declare-fun zeroValueAfter!47 () V!38921)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!690 (array!67723 array!67725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38921 V!38921 V!38921 V!38921 (_ BitVec 32) Int) Unit!34909)

(assert (=> b!1065773 (= lt!469717 (lemmaNoChangeToArrayThenSameMapNoExtras!690 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3687 (array!67723 array!67725 (_ BitVec 32) (_ BitVec 32) V!38921 V!38921 (_ BitVec 32) Int) ListLongMap!14077)

(assert (=> b!1065773 (= lt!469720 (getCurrentListMapNoExtraKeys!3687 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065773 (= lt!469719 (getCurrentListMapNoExtraKeys!3687 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711116 () Bool)

(assert (=> start!94364 (=> (not res!711116) (not e!607508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94364 (= res!711116 (validMask!0 mask!1515))))

(assert (=> start!94364 e!607508))

(assert (=> start!94364 true))

(assert (=> start!94364 tp_is_empty!25339))

(declare-fun e!607512 () Bool)

(declare-fun array_inv!25236 (array!67725) Bool)

(assert (=> start!94364 (and (array_inv!25236 _values!955) e!607512)))

(assert (=> start!94364 tp!76021))

(declare-fun array_inv!25237 (array!67723) Bool)

(assert (=> start!94364 (array_inv!25237 _keys!1163)))

(declare-fun b!1065777 () Bool)

(assert (=> b!1065777 (= e!607513 tp_is_empty!25339)))

(declare-fun b!1065778 () Bool)

(assert (=> b!1065778 (= e!607512 (and e!607510 mapRes!39691))))

(declare-fun condMapEmpty!39691 () Bool)

(declare-fun mapDefault!39691 () ValueCell!11966)

(assert (=> b!1065778 (= condMapEmpty!39691 (= (arr!32560 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11966)) mapDefault!39691)))))

(assert (= (and start!94364 res!711116) b!1065774))

(assert (= (and b!1065774 res!711117) b!1065776))

(assert (= (and b!1065776 res!711118) b!1065771))

(assert (= (and b!1065771 res!711115) b!1065773))

(assert (= (and b!1065773 (not res!711119)) b!1065772))

(assert (= (and b!1065778 condMapEmpty!39691) mapIsEmpty!39691))

(assert (= (and b!1065778 (not condMapEmpty!39691)) mapNonEmpty!39691))

(get-info :version)

(assert (= (and mapNonEmpty!39691 ((_ is ValueCellFull!11966) mapValue!39691)) b!1065777))

(assert (= (and b!1065778 ((_ is ValueCellFull!11966) mapDefault!39691)) b!1065775))

(assert (= start!94364 b!1065778))

(declare-fun m!984661 () Bool)

(assert (=> b!1065776 m!984661))

(declare-fun m!984663 () Bool)

(assert (=> b!1065771 m!984663))

(declare-fun m!984665 () Bool)

(assert (=> mapNonEmpty!39691 m!984665))

(declare-fun m!984667 () Bool)

(assert (=> b!1065772 m!984667))

(declare-fun m!984669 () Bool)

(assert (=> start!94364 m!984669))

(declare-fun m!984671 () Bool)

(assert (=> start!94364 m!984671))

(declare-fun m!984673 () Bool)

(assert (=> start!94364 m!984673))

(declare-fun m!984675 () Bool)

(assert (=> b!1065773 m!984675))

(declare-fun m!984677 () Bool)

(assert (=> b!1065773 m!984677))

(declare-fun m!984679 () Bool)

(assert (=> b!1065773 m!984679))

(check-sat (not b!1065773) (not b!1065771) (not b!1065772) (not b!1065776) (not start!94364) (not b_next!21529) tp_is_empty!25339 b_and!34289 (not mapNonEmpty!39691))
(check-sat b_and!34289 (not b_next!21529))
