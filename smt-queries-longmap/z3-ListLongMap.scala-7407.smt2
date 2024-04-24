; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94470 () Bool)

(assert start!94470)

(declare-fun b_free!21619 () Bool)

(declare-fun b_next!21619 () Bool)

(assert (=> start!94470 (= b_free!21619 (not b_next!21619))))

(declare-fun tp!76294 () Bool)

(declare-fun b_and!34389 () Bool)

(assert (=> start!94470 (= tp!76294 b_and!34389)))

(declare-fun mapNonEmpty!39829 () Bool)

(declare-fun mapRes!39829 () Bool)

(declare-fun tp!76295 () Bool)

(declare-fun e!608426 () Bool)

(assert (=> mapNonEmpty!39829 (= mapRes!39829 (and tp!76295 e!608426))))

(declare-datatypes ((V!39041 0))(
  ( (V!39042 (val!12765 Int)) )
))
(declare-datatypes ((ValueCell!12011 0))(
  ( (ValueCellFull!12011 (v!15373 V!39041)) (EmptyCell!12011) )
))
(declare-fun mapRest!39829 () (Array (_ BitVec 32) ValueCell!12011))

(declare-fun mapKey!39829 () (_ BitVec 32))

(declare-datatypes ((array!67893 0))(
  ( (array!67894 (arr!32643 (Array (_ BitVec 32) ValueCell!12011)) (size!33180 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67893)

(declare-fun mapValue!39829 () ValueCell!12011)

(assert (=> mapNonEmpty!39829 (= (arr!32643 _values!955) (store mapRest!39829 mapKey!39829 mapValue!39829))))

(declare-fun mapIsEmpty!39829 () Bool)

(assert (=> mapIsEmpty!39829 mapRes!39829))

(declare-fun b!1067008 () Bool)

(declare-fun e!608425 () Bool)

(assert (=> b!1067008 (= e!608425 true)))

(declare-datatypes ((tuple2!16166 0))(
  ( (tuple2!16167 (_1!8094 (_ BitVec 64)) (_2!8094 V!39041)) )
))
(declare-datatypes ((List!22735 0))(
  ( (Nil!22732) (Cons!22731 (h!23949 tuple2!16166) (t!32046 List!22735)) )
))
(declare-datatypes ((ListLongMap!14143 0))(
  ( (ListLongMap!14144 (toList!7087 List!22735)) )
))
(declare-fun lt!470611 () ListLongMap!14143)

(declare-fun lt!470606 () ListLongMap!14143)

(declare-fun -!606 (ListLongMap!14143 (_ BitVec 64)) ListLongMap!14143)

(assert (=> b!1067008 (= lt!470611 (-!606 lt!470606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470609 () ListLongMap!14143)

(declare-fun lt!470605 () ListLongMap!14143)

(assert (=> b!1067008 (= (-!606 lt!470609 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470605)))

(declare-datatypes ((Unit!34968 0))(
  ( (Unit!34969) )
))
(declare-fun lt!470612 () Unit!34968)

(declare-fun zeroValueBefore!47 () V!39041)

(declare-fun addThenRemoveForNewKeyIsSame!16 (ListLongMap!14143 (_ BitVec 64) V!39041) Unit!34968)

(assert (=> b!1067008 (= lt!470612 (addThenRemoveForNewKeyIsSame!16 lt!470605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470607 () ListLongMap!14143)

(declare-fun lt!470608 () ListLongMap!14143)

(assert (=> b!1067008 (and (= lt!470606 lt!470609) (= lt!470607 lt!470608))))

(declare-fun +!3159 (ListLongMap!14143 tuple2!16166) ListLongMap!14143)

(assert (=> b!1067008 (= lt!470609 (+!3159 lt!470605 (tuple2!16167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39041)

(declare-datatypes ((array!67895 0))(
  ( (array!67896 (arr!32644 (Array (_ BitVec 32) (_ BitVec 64))) (size!33181 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67895)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39041)

(declare-fun getCurrentListMap!4040 (array!67895 array!67893 (_ BitVec 32) (_ BitVec 32) V!39041 V!39041 (_ BitVec 32) Int) ListLongMap!14143)

(assert (=> b!1067008 (= lt!470607 (getCurrentListMap!4040 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067008 (= lt!470606 (getCurrentListMap!4040 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067009 () Bool)

(declare-fun res!711861 () Bool)

(declare-fun e!608424 () Bool)

(assert (=> b!1067009 (=> (not res!711861) (not e!608424))))

(assert (=> b!1067009 (= res!711861 (and (= (size!33180 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33181 _keys!1163) (size!33180 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711858 () Bool)

(assert (=> start!94470 (=> (not res!711858) (not e!608424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94470 (= res!711858 (validMask!0 mask!1515))))

(assert (=> start!94470 e!608424))

(assert (=> start!94470 true))

(declare-fun tp_is_empty!25429 () Bool)

(assert (=> start!94470 tp_is_empty!25429))

(declare-fun e!608423 () Bool)

(declare-fun array_inv!25300 (array!67893) Bool)

(assert (=> start!94470 (and (array_inv!25300 _values!955) e!608423)))

(assert (=> start!94470 tp!76294))

(declare-fun array_inv!25301 (array!67895) Bool)

(assert (=> start!94470 (array_inv!25301 _keys!1163)))

(declare-fun b!1067010 () Bool)

(declare-fun e!608422 () Bool)

(assert (=> b!1067010 (= e!608423 (and e!608422 mapRes!39829))))

(declare-fun condMapEmpty!39829 () Bool)

(declare-fun mapDefault!39829 () ValueCell!12011)

(assert (=> b!1067010 (= condMapEmpty!39829 (= (arr!32643 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12011)) mapDefault!39829)))))

(declare-fun b!1067011 () Bool)

(assert (=> b!1067011 (= e!608426 tp_is_empty!25429)))

(declare-fun b!1067012 () Bool)

(assert (=> b!1067012 (= e!608422 tp_is_empty!25429)))

(declare-fun b!1067013 () Bool)

(declare-fun res!711857 () Bool)

(assert (=> b!1067013 (=> (not res!711857) (not e!608424))))

(declare-datatypes ((List!22736 0))(
  ( (Nil!22733) (Cons!22732 (h!23950 (_ BitVec 64)) (t!32047 List!22736)) )
))
(declare-fun arrayNoDuplicates!0 (array!67895 (_ BitVec 32) List!22736) Bool)

(assert (=> b!1067013 (= res!711857 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22733))))

(declare-fun b!1067014 () Bool)

(declare-fun res!711859 () Bool)

(assert (=> b!1067014 (=> (not res!711859) (not e!608424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67895 (_ BitVec 32)) Bool)

(assert (=> b!1067014 (= res!711859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067015 () Bool)

(assert (=> b!1067015 (= e!608424 (not e!608425))))

(declare-fun res!711860 () Bool)

(assert (=> b!1067015 (=> res!711860 e!608425)))

(assert (=> b!1067015 (= res!711860 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1067015 (= lt!470605 lt!470608)))

(declare-fun lt!470610 () Unit!34968)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!714 (array!67895 array!67893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39041 V!39041 V!39041 V!39041 (_ BitVec 32) Int) Unit!34968)

(assert (=> b!1067015 (= lt!470610 (lemmaNoChangeToArrayThenSameMapNoExtras!714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3711 (array!67895 array!67893 (_ BitVec 32) (_ BitVec 32) V!39041 V!39041 (_ BitVec 32) Int) ListLongMap!14143)

(assert (=> b!1067015 (= lt!470608 (getCurrentListMapNoExtraKeys!3711 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067015 (= lt!470605 (getCurrentListMapNoExtraKeys!3711 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94470 res!711858) b!1067009))

(assert (= (and b!1067009 res!711861) b!1067014))

(assert (= (and b!1067014 res!711859) b!1067013))

(assert (= (and b!1067013 res!711857) b!1067015))

(assert (= (and b!1067015 (not res!711860)) b!1067008))

(assert (= (and b!1067010 condMapEmpty!39829) mapIsEmpty!39829))

(assert (= (and b!1067010 (not condMapEmpty!39829)) mapNonEmpty!39829))

(get-info :version)

(assert (= (and mapNonEmpty!39829 ((_ is ValueCellFull!12011) mapValue!39829)) b!1067011))

(assert (= (and b!1067010 ((_ is ValueCellFull!12011) mapDefault!39829)) b!1067012))

(assert (= start!94470 b!1067010))

(declare-fun m!985871 () Bool)

(assert (=> b!1067008 m!985871))

(declare-fun m!985873 () Bool)

(assert (=> b!1067008 m!985873))

(declare-fun m!985875 () Bool)

(assert (=> b!1067008 m!985875))

(declare-fun m!985877 () Bool)

(assert (=> b!1067008 m!985877))

(declare-fun m!985879 () Bool)

(assert (=> b!1067008 m!985879))

(declare-fun m!985881 () Bool)

(assert (=> b!1067008 m!985881))

(declare-fun m!985883 () Bool)

(assert (=> b!1067013 m!985883))

(declare-fun m!985885 () Bool)

(assert (=> b!1067015 m!985885))

(declare-fun m!985887 () Bool)

(assert (=> b!1067015 m!985887))

(declare-fun m!985889 () Bool)

(assert (=> b!1067015 m!985889))

(declare-fun m!985891 () Bool)

(assert (=> mapNonEmpty!39829 m!985891))

(declare-fun m!985893 () Bool)

(assert (=> b!1067014 m!985893))

(declare-fun m!985895 () Bool)

(assert (=> start!94470 m!985895))

(declare-fun m!985897 () Bool)

(assert (=> start!94470 m!985897))

(declare-fun m!985899 () Bool)

(assert (=> start!94470 m!985899))

(check-sat (not b!1067014) (not mapNonEmpty!39829) b_and!34389 (not start!94470) (not b!1067013) (not b!1067008) (not b!1067015) (not b_next!21619) tp_is_empty!25429)
(check-sat b_and!34389 (not b_next!21619))
