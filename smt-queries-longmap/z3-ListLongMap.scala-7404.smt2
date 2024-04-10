; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94218 () Bool)

(assert start!94218)

(declare-fun b_free!21603 () Bool)

(declare-fun b_next!21603 () Bool)

(assert (=> start!94218 (= b_free!21603 (not b_next!21603))))

(declare-fun tp!76247 () Bool)

(declare-fun b_and!34363 () Bool)

(assert (=> start!94218 (= tp!76247 b_and!34363)))

(declare-fun b!1065489 () Bool)

(declare-fun e!607422 () Bool)

(declare-fun e!607427 () Bool)

(assert (=> b!1065489 (= e!607422 (not e!607427))))

(declare-fun res!711217 () Bool)

(assert (=> b!1065489 (=> res!711217 e!607427)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065489 (= res!711217 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39019 0))(
  ( (V!39020 (val!12757 Int)) )
))
(declare-datatypes ((tuple2!16168 0))(
  ( (tuple2!16169 (_1!8095 (_ BitVec 64)) (_2!8095 V!39019)) )
))
(declare-datatypes ((List!22736 0))(
  ( (Nil!22733) (Cons!22732 (h!23941 tuple2!16168) (t!32055 List!22736)) )
))
(declare-datatypes ((ListLongMap!14137 0))(
  ( (ListLongMap!14138 (toList!7084 List!22736)) )
))
(declare-fun lt!469900 () ListLongMap!14137)

(declare-fun lt!469905 () ListLongMap!14137)

(assert (=> b!1065489 (= lt!469900 lt!469905)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39019)

(declare-datatypes ((Unit!34961 0))(
  ( (Unit!34962) )
))
(declare-fun lt!469899 () Unit!34961)

(declare-datatypes ((ValueCell!12003 0))(
  ( (ValueCellFull!12003 (v!15369 V!39019)) (EmptyCell!12003) )
))
(declare-datatypes ((array!67813 0))(
  ( (array!67814 (arr!32609 (Array (_ BitVec 32) ValueCell!12003)) (size!33145 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67813)

(declare-fun minValue!907 () V!39019)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39019)

(declare-datatypes ((array!67815 0))(
  ( (array!67816 (arr!32610 (Array (_ BitVec 32) (_ BitVec 64))) (size!33146 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67815)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!708 (array!67815 array!67813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39019 V!39019 V!39019 V!39019 (_ BitVec 32) Int) Unit!34961)

(assert (=> b!1065489 (= lt!469899 (lemmaNoChangeToArrayThenSameMapNoExtras!708 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3671 (array!67815 array!67813 (_ BitVec 32) (_ BitVec 32) V!39019 V!39019 (_ BitVec 32) Int) ListLongMap!14137)

(assert (=> b!1065489 (= lt!469905 (getCurrentListMapNoExtraKeys!3671 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065489 (= lt!469900 (getCurrentListMapNoExtraKeys!3671 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711219 () Bool)

(assert (=> start!94218 (=> (not res!711219) (not e!607422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94218 (= res!711219 (validMask!0 mask!1515))))

(assert (=> start!94218 e!607422))

(assert (=> start!94218 true))

(declare-fun tp_is_empty!25413 () Bool)

(assert (=> start!94218 tp_is_empty!25413))

(declare-fun e!607425 () Bool)

(declare-fun array_inv!25250 (array!67813) Bool)

(assert (=> start!94218 (and (array_inv!25250 _values!955) e!607425)))

(assert (=> start!94218 tp!76247))

(declare-fun array_inv!25251 (array!67815) Bool)

(assert (=> start!94218 (array_inv!25251 _keys!1163)))

(declare-fun b!1065490 () Bool)

(declare-fun res!711216 () Bool)

(assert (=> b!1065490 (=> (not res!711216) (not e!607422))))

(declare-datatypes ((List!22737 0))(
  ( (Nil!22734) (Cons!22733 (h!23942 (_ BitVec 64)) (t!32056 List!22737)) )
))
(declare-fun arrayNoDuplicates!0 (array!67815 (_ BitVec 32) List!22737) Bool)

(assert (=> b!1065490 (= res!711216 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22734))))

(declare-fun b!1065491 () Bool)

(assert (=> b!1065491 (= e!607427 true)))

(declare-fun lt!469902 () ListLongMap!14137)

(declare-fun lt!469901 () ListLongMap!14137)

(declare-fun -!599 (ListLongMap!14137 (_ BitVec 64)) ListLongMap!14137)

(assert (=> b!1065491 (= lt!469902 (-!599 lt!469901 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469904 () ListLongMap!14137)

(assert (=> b!1065491 (= (-!599 lt!469904 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469900)))

(declare-fun lt!469903 () Unit!34961)

(declare-fun addThenRemoveForNewKeyIsSame!8 (ListLongMap!14137 (_ BitVec 64) V!39019) Unit!34961)

(assert (=> b!1065491 (= lt!469903 (addThenRemoveForNewKeyIsSame!8 lt!469900 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469898 () ListLongMap!14137)

(assert (=> b!1065491 (and (= lt!469901 lt!469904) (= lt!469898 lt!469905))))

(declare-fun +!3130 (ListLongMap!14137 tuple2!16168) ListLongMap!14137)

(assert (=> b!1065491 (= lt!469904 (+!3130 lt!469900 (tuple2!16169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4043 (array!67815 array!67813 (_ BitVec 32) (_ BitVec 32) V!39019 V!39019 (_ BitVec 32) Int) ListLongMap!14137)

(assert (=> b!1065491 (= lt!469898 (getCurrentListMap!4043 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065491 (= lt!469901 (getCurrentListMap!4043 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065492 () Bool)

(declare-fun res!711215 () Bool)

(assert (=> b!1065492 (=> (not res!711215) (not e!607422))))

(assert (=> b!1065492 (= res!711215 (and (= (size!33145 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33146 _keys!1163) (size!33145 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39805 () Bool)

(declare-fun mapRes!39805 () Bool)

(declare-fun tp!76246 () Bool)

(declare-fun e!607424 () Bool)

(assert (=> mapNonEmpty!39805 (= mapRes!39805 (and tp!76246 e!607424))))

(declare-fun mapRest!39805 () (Array (_ BitVec 32) ValueCell!12003))

(declare-fun mapValue!39805 () ValueCell!12003)

(declare-fun mapKey!39805 () (_ BitVec 32))

(assert (=> mapNonEmpty!39805 (= (arr!32609 _values!955) (store mapRest!39805 mapKey!39805 mapValue!39805))))

(declare-fun b!1065493 () Bool)

(declare-fun res!711218 () Bool)

(assert (=> b!1065493 (=> (not res!711218) (not e!607422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67815 (_ BitVec 32)) Bool)

(assert (=> b!1065493 (= res!711218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065494 () Bool)

(declare-fun e!607423 () Bool)

(assert (=> b!1065494 (= e!607425 (and e!607423 mapRes!39805))))

(declare-fun condMapEmpty!39805 () Bool)

(declare-fun mapDefault!39805 () ValueCell!12003)

(assert (=> b!1065494 (= condMapEmpty!39805 (= (arr!32609 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12003)) mapDefault!39805)))))

(declare-fun b!1065495 () Bool)

(assert (=> b!1065495 (= e!607423 tp_is_empty!25413)))

(declare-fun mapIsEmpty!39805 () Bool)

(assert (=> mapIsEmpty!39805 mapRes!39805))

(declare-fun b!1065496 () Bool)

(assert (=> b!1065496 (= e!607424 tp_is_empty!25413)))

(assert (= (and start!94218 res!711219) b!1065492))

(assert (= (and b!1065492 res!711215) b!1065493))

(assert (= (and b!1065493 res!711218) b!1065490))

(assert (= (and b!1065490 res!711216) b!1065489))

(assert (= (and b!1065489 (not res!711217)) b!1065491))

(assert (= (and b!1065494 condMapEmpty!39805) mapIsEmpty!39805))

(assert (= (and b!1065494 (not condMapEmpty!39805)) mapNonEmpty!39805))

(get-info :version)

(assert (= (and mapNonEmpty!39805 ((_ is ValueCellFull!12003) mapValue!39805)) b!1065496))

(assert (= (and b!1065494 ((_ is ValueCellFull!12003) mapDefault!39805)) b!1065495))

(assert (= start!94218 b!1065494))

(declare-fun m!983959 () Bool)

(assert (=> b!1065490 m!983959))

(declare-fun m!983961 () Bool)

(assert (=> b!1065491 m!983961))

(declare-fun m!983963 () Bool)

(assert (=> b!1065491 m!983963))

(declare-fun m!983965 () Bool)

(assert (=> b!1065491 m!983965))

(declare-fun m!983967 () Bool)

(assert (=> b!1065491 m!983967))

(declare-fun m!983969 () Bool)

(assert (=> b!1065491 m!983969))

(declare-fun m!983971 () Bool)

(assert (=> b!1065491 m!983971))

(declare-fun m!983973 () Bool)

(assert (=> mapNonEmpty!39805 m!983973))

(declare-fun m!983975 () Bool)

(assert (=> b!1065489 m!983975))

(declare-fun m!983977 () Bool)

(assert (=> b!1065489 m!983977))

(declare-fun m!983979 () Bool)

(assert (=> b!1065489 m!983979))

(declare-fun m!983981 () Bool)

(assert (=> b!1065493 m!983981))

(declare-fun m!983983 () Bool)

(assert (=> start!94218 m!983983))

(declare-fun m!983985 () Bool)

(assert (=> start!94218 m!983985))

(declare-fun m!983987 () Bool)

(assert (=> start!94218 m!983987))

(check-sat tp_is_empty!25413 (not b!1065490) (not b!1065491) (not b!1065489) (not b!1065493) (not mapNonEmpty!39805) (not start!94218) b_and!34363 (not b_next!21603))
(check-sat b_and!34363 (not b_next!21603))
