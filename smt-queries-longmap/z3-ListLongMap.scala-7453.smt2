; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94848 () Bool)

(assert start!94848)

(declare-fun b_free!21895 () Bool)

(declare-fun b_next!21895 () Bool)

(assert (=> start!94848 (= b_free!21895 (not b_next!21895))))

(declare-fun tp!77138 () Bool)

(declare-fun b_and!34717 () Bool)

(assert (=> start!94848 (= tp!77138 b_and!34717)))

(declare-fun b!1071112 () Bool)

(declare-fun e!611425 () Bool)

(declare-fun tp_is_empty!25705 () Bool)

(assert (=> b!1071112 (= e!611425 tp_is_empty!25705)))

(declare-fun b!1071114 () Bool)

(declare-fun e!611427 () Bool)

(assert (=> b!1071114 (= e!611427 tp_is_empty!25705)))

(declare-fun b!1071115 () Bool)

(declare-fun res!714269 () Bool)

(declare-fun e!611426 () Bool)

(assert (=> b!1071115 (=> (not res!714269) (not e!611426))))

(declare-datatypes ((array!68423 0))(
  ( (array!68424 (arr!32903 (Array (_ BitVec 32) (_ BitVec 64))) (size!33440 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68423)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68423 (_ BitVec 32)) Bool)

(assert (=> b!1071115 (= res!714269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071116 () Bool)

(declare-fun res!714272 () Bool)

(assert (=> b!1071116 (=> (not res!714272) (not e!611426))))

(declare-datatypes ((List!22938 0))(
  ( (Nil!22935) (Cons!22934 (h!24152 (_ BitVec 64)) (t!32259 List!22938)) )
))
(declare-fun arrayNoDuplicates!0 (array!68423 (_ BitVec 32) List!22938) Bool)

(assert (=> b!1071116 (= res!714272 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22935))))

(declare-fun b!1071117 () Bool)

(assert (=> b!1071117 (= e!611426 (not true))))

(declare-datatypes ((V!39409 0))(
  ( (V!39410 (val!12903 Int)) )
))
(declare-datatypes ((tuple2!16370 0))(
  ( (tuple2!16371 (_1!8196 (_ BitVec 64)) (_2!8196 V!39409)) )
))
(declare-datatypes ((List!22939 0))(
  ( (Nil!22936) (Cons!22935 (h!24153 tuple2!16370) (t!32260 List!22939)) )
))
(declare-datatypes ((ListLongMap!14347 0))(
  ( (ListLongMap!14348 (toList!7189 List!22939)) )
))
(declare-fun lt!473276 () ListLongMap!14347)

(declare-fun lt!473274 () ListLongMap!14347)

(assert (=> b!1071117 (= lt!473276 lt!473274)))

(declare-fun zeroValueBefore!47 () V!39409)

(declare-datatypes ((ValueCell!12149 0))(
  ( (ValueCellFull!12149 (v!15515 V!39409)) (EmptyCell!12149) )
))
(declare-datatypes ((array!68425 0))(
  ( (array!68426 (arr!32904 (Array (_ BitVec 32) ValueCell!12149)) (size!33441 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68425)

(declare-fun minValue!907 () V!39409)

(declare-datatypes ((Unit!35172 0))(
  ( (Unit!35173) )
))
(declare-fun lt!473275 () Unit!35172)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39409)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!804 (array!68423 array!68425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39409 V!39409 V!39409 V!39409 (_ BitVec 32) Int) Unit!35172)

(assert (=> b!1071117 (= lt!473275 (lemmaNoChangeToArrayThenSameMapNoExtras!804 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3801 (array!68423 array!68425 (_ BitVec 32) (_ BitVec 32) V!39409 V!39409 (_ BitVec 32) Int) ListLongMap!14347)

(assert (=> b!1071117 (= lt!473274 (getCurrentListMapNoExtraKeys!3801 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071117 (= lt!473276 (getCurrentListMapNoExtraKeys!3801 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071118 () Bool)

(declare-fun e!611424 () Bool)

(declare-fun mapRes!40258 () Bool)

(assert (=> b!1071118 (= e!611424 (and e!611425 mapRes!40258))))

(declare-fun condMapEmpty!40258 () Bool)

(declare-fun mapDefault!40258 () ValueCell!12149)

(assert (=> b!1071118 (= condMapEmpty!40258 (= (arr!32904 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12149)) mapDefault!40258)))))

(declare-fun res!714271 () Bool)

(assert (=> start!94848 (=> (not res!714271) (not e!611426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94848 (= res!714271 (validMask!0 mask!1515))))

(assert (=> start!94848 e!611426))

(assert (=> start!94848 true))

(assert (=> start!94848 tp_is_empty!25705))

(declare-fun array_inv!25482 (array!68425) Bool)

(assert (=> start!94848 (and (array_inv!25482 _values!955) e!611424)))

(assert (=> start!94848 tp!77138))

(declare-fun array_inv!25483 (array!68423) Bool)

(assert (=> start!94848 (array_inv!25483 _keys!1163)))

(declare-fun b!1071113 () Bool)

(declare-fun res!714270 () Bool)

(assert (=> b!1071113 (=> (not res!714270) (not e!611426))))

(assert (=> b!1071113 (= res!714270 (and (= (size!33441 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33440 _keys!1163) (size!33441 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40258 () Bool)

(declare-fun tp!77137 () Bool)

(assert (=> mapNonEmpty!40258 (= mapRes!40258 (and tp!77137 e!611427))))

(declare-fun mapRest!40258 () (Array (_ BitVec 32) ValueCell!12149))

(declare-fun mapValue!40258 () ValueCell!12149)

(declare-fun mapKey!40258 () (_ BitVec 32))

(assert (=> mapNonEmpty!40258 (= (arr!32904 _values!955) (store mapRest!40258 mapKey!40258 mapValue!40258))))

(declare-fun mapIsEmpty!40258 () Bool)

(assert (=> mapIsEmpty!40258 mapRes!40258))

(assert (= (and start!94848 res!714271) b!1071113))

(assert (= (and b!1071113 res!714270) b!1071115))

(assert (= (and b!1071115 res!714269) b!1071116))

(assert (= (and b!1071116 res!714272) b!1071117))

(assert (= (and b!1071118 condMapEmpty!40258) mapIsEmpty!40258))

(assert (= (and b!1071118 (not condMapEmpty!40258)) mapNonEmpty!40258))

(get-info :version)

(assert (= (and mapNonEmpty!40258 ((_ is ValueCellFull!12149) mapValue!40258)) b!1071114))

(assert (= (and b!1071118 ((_ is ValueCellFull!12149) mapDefault!40258)) b!1071112))

(assert (= start!94848 b!1071118))

(declare-fun m!989917 () Bool)

(assert (=> b!1071117 m!989917))

(declare-fun m!989919 () Bool)

(assert (=> b!1071117 m!989919))

(declare-fun m!989921 () Bool)

(assert (=> b!1071117 m!989921))

(declare-fun m!989923 () Bool)

(assert (=> start!94848 m!989923))

(declare-fun m!989925 () Bool)

(assert (=> start!94848 m!989925))

(declare-fun m!989927 () Bool)

(assert (=> start!94848 m!989927))

(declare-fun m!989929 () Bool)

(assert (=> mapNonEmpty!40258 m!989929))

(declare-fun m!989931 () Bool)

(assert (=> b!1071115 m!989931))

(declare-fun m!989933 () Bool)

(assert (=> b!1071116 m!989933))

(check-sat (not b!1071115) b_and!34717 tp_is_empty!25705 (not mapNonEmpty!40258) (not b!1071116) (not b_next!21895) (not start!94848) (not b!1071117))
(check-sat b_and!34717 (not b_next!21895))
