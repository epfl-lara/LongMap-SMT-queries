; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95040 () Bool)

(assert start!95040)

(declare-fun b_free!22033 () Bool)

(declare-fun b_next!22033 () Bool)

(assert (=> start!95040 (= b_free!22033 (not b_next!22033))))

(declare-fun tp!77561 () Bool)

(declare-fun b_and!34885 () Bool)

(assert (=> start!95040 (= tp!77561 b_and!34885)))

(declare-fun b!1073269 () Bool)

(declare-fun e!613013 () Bool)

(declare-fun tp_is_empty!25843 () Bool)

(assert (=> b!1073269 (= e!613013 tp_is_empty!25843)))

(declare-fun mapNonEmpty!40474 () Bool)

(declare-fun mapRes!40474 () Bool)

(declare-fun tp!77560 () Bool)

(declare-fun e!613015 () Bool)

(assert (=> mapNonEmpty!40474 (= mapRes!40474 (and tp!77560 e!613015))))

(declare-datatypes ((V!39593 0))(
  ( (V!39594 (val!12972 Int)) )
))
(declare-datatypes ((ValueCell!12218 0))(
  ( (ValueCellFull!12218 (v!15585 V!39593)) (EmptyCell!12218) )
))
(declare-fun mapValue!40474 () ValueCell!12218)

(declare-fun mapRest!40474 () (Array (_ BitVec 32) ValueCell!12218))

(declare-datatypes ((array!68701 0))(
  ( (array!68702 (arr!33039 (Array (_ BitVec 32) ValueCell!12218)) (size!33576 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68701)

(declare-fun mapKey!40474 () (_ BitVec 32))

(assert (=> mapNonEmpty!40474 (= (arr!33039 _values!955) (store mapRest!40474 mapKey!40474 mapValue!40474))))

(declare-fun b!1073270 () Bool)

(declare-fun e!613017 () Bool)

(declare-fun e!613019 () Bool)

(assert (=> b!1073270 (= e!613017 (not e!613019))))

(declare-fun res!715563 () Bool)

(assert (=> b!1073270 (=> res!715563 e!613019)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073270 (= res!715563 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16486 0))(
  ( (tuple2!16487 (_1!8254 (_ BitVec 64)) (_2!8254 V!39593)) )
))
(declare-datatypes ((List!23045 0))(
  ( (Nil!23042) (Cons!23041 (h!24259 tuple2!16486) (t!32372 List!23045)) )
))
(declare-datatypes ((ListLongMap!14463 0))(
  ( (ListLongMap!14464 (toList!7247 List!23045)) )
))
(declare-fun lt!475205 () ListLongMap!14463)

(declare-fun lt!475208 () ListLongMap!14463)

(assert (=> b!1073270 (= lt!475205 lt!475208)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39593)

(declare-datatypes ((Unit!35279 0))(
  ( (Unit!35280) )
))
(declare-fun lt!475209 () Unit!35279)

(declare-fun minValue!907 () V!39593)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39593)

(declare-datatypes ((array!68703 0))(
  ( (array!68704 (arr!33040 (Array (_ BitVec 32) (_ BitVec 64))) (size!33577 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68703)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!854 (array!68703 array!68701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39593 V!39593 V!39593 V!39593 (_ BitVec 32) Int) Unit!35279)

(assert (=> b!1073270 (= lt!475209 (lemmaNoChangeToArrayThenSameMapNoExtras!854 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3851 (array!68703 array!68701 (_ BitVec 32) (_ BitVec 32) V!39593 V!39593 (_ BitVec 32) Int) ListLongMap!14463)

(assert (=> b!1073270 (= lt!475208 (getCurrentListMapNoExtraKeys!3851 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073270 (= lt!475205 (getCurrentListMapNoExtraKeys!3851 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073271 () Bool)

(declare-fun res!715560 () Bool)

(assert (=> b!1073271 (=> (not res!715560) (not e!613017))))

(assert (=> b!1073271 (= res!715560 (and (= (size!33576 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33577 _keys!1163) (size!33576 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073272 () Bool)

(assert (=> b!1073272 (= e!613015 tp_is_empty!25843)))

(declare-fun b!1073273 () Bool)

(declare-fun res!715559 () Bool)

(assert (=> b!1073273 (=> (not res!715559) (not e!613017))))

(declare-datatypes ((List!23046 0))(
  ( (Nil!23043) (Cons!23042 (h!24260 (_ BitVec 64)) (t!32373 List!23046)) )
))
(declare-fun arrayNoDuplicates!0 (array!68703 (_ BitVec 32) List!23046) Bool)

(assert (=> b!1073273 (= res!715559 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23043))))

(declare-fun mapIsEmpty!40474 () Bool)

(assert (=> mapIsEmpty!40474 mapRes!40474))

(declare-fun res!715562 () Bool)

(assert (=> start!95040 (=> (not res!715562) (not e!613017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95040 (= res!715562 (validMask!0 mask!1515))))

(assert (=> start!95040 e!613017))

(assert (=> start!95040 true))

(assert (=> start!95040 tp_is_empty!25843))

(declare-fun e!613016 () Bool)

(declare-fun array_inv!25574 (array!68701) Bool)

(assert (=> start!95040 (and (array_inv!25574 _values!955) e!613016)))

(assert (=> start!95040 tp!77561))

(declare-fun array_inv!25575 (array!68703) Bool)

(assert (=> start!95040 (array_inv!25575 _keys!1163)))

(declare-fun b!1073274 () Bool)

(declare-fun e!613014 () Bool)

(declare-fun lt!475202 () ListLongMap!14463)

(declare-fun lt!475210 () tuple2!16486)

(declare-fun +!3210 (ListLongMap!14463 tuple2!16486) ListLongMap!14463)

(assert (=> b!1073274 (= e!613014 (= lt!475202 (+!3210 lt!475208 lt!475210)))))

(declare-fun b!1073275 () Bool)

(declare-fun res!715564 () Bool)

(assert (=> b!1073275 (=> (not res!715564) (not e!613017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68703 (_ BitVec 32)) Bool)

(assert (=> b!1073275 (= res!715564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073276 () Bool)

(assert (=> b!1073276 (= e!613019 true)))

(declare-fun lt!475211 () ListLongMap!14463)

(declare-fun lt!475199 () ListLongMap!14463)

(declare-fun -!680 (ListLongMap!14463 (_ BitVec 64)) ListLongMap!14463)

(assert (=> b!1073276 (= lt!475211 (-!680 lt!475199 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475200 () ListLongMap!14463)

(declare-fun lt!475207 () ListLongMap!14463)

(assert (=> b!1073276 (= lt!475200 lt!475207)))

(declare-fun lt!475203 () Unit!35279)

(declare-fun addCommutativeForDiffKeys!737 (ListLongMap!14463 (_ BitVec 64) V!39593 (_ BitVec 64) V!39593) Unit!35279)

(assert (=> b!1073276 (= lt!475203 (addCommutativeForDiffKeys!737 lt!475205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475206 () ListLongMap!14463)

(assert (=> b!1073276 (= (-!680 lt!475207 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475206)))

(declare-fun lt!475201 () tuple2!16486)

(assert (=> b!1073276 (= lt!475207 (+!3210 lt!475206 lt!475201))))

(declare-fun lt!475204 () Unit!35279)

(declare-fun addThenRemoveForNewKeyIsSame!55 (ListLongMap!14463 (_ BitVec 64) V!39593) Unit!35279)

(assert (=> b!1073276 (= lt!475204 (addThenRemoveForNewKeyIsSame!55 lt!475206 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1073276 (= lt!475206 (+!3210 lt!475205 lt!475210))))

(assert (=> b!1073276 e!613014))

(declare-fun res!715561 () Bool)

(assert (=> b!1073276 (=> (not res!715561) (not e!613014))))

(assert (=> b!1073276 (= res!715561 (= lt!475199 lt!475200))))

(assert (=> b!1073276 (= lt!475200 (+!3210 (+!3210 lt!475205 lt!475201) lt!475210))))

(assert (=> b!1073276 (= lt!475210 (tuple2!16487 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1073276 (= lt!475201 (tuple2!16487 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4141 (array!68703 array!68701 (_ BitVec 32) (_ BitVec 32) V!39593 V!39593 (_ BitVec 32) Int) ListLongMap!14463)

(assert (=> b!1073276 (= lt!475202 (getCurrentListMap!4141 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073276 (= lt!475199 (getCurrentListMap!4141 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073277 () Bool)

(assert (=> b!1073277 (= e!613016 (and e!613013 mapRes!40474))))

(declare-fun condMapEmpty!40474 () Bool)

(declare-fun mapDefault!40474 () ValueCell!12218)

(assert (=> b!1073277 (= condMapEmpty!40474 (= (arr!33039 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12218)) mapDefault!40474)))))

(assert (= (and start!95040 res!715562) b!1073271))

(assert (= (and b!1073271 res!715560) b!1073275))

(assert (= (and b!1073275 res!715564) b!1073273))

(assert (= (and b!1073273 res!715559) b!1073270))

(assert (= (and b!1073270 (not res!715563)) b!1073276))

(assert (= (and b!1073276 res!715561) b!1073274))

(assert (= (and b!1073277 condMapEmpty!40474) mapIsEmpty!40474))

(assert (= (and b!1073277 (not condMapEmpty!40474)) mapNonEmpty!40474))

(get-info :version)

(assert (= (and mapNonEmpty!40474 ((_ is ValueCellFull!12218) mapValue!40474)) b!1073272))

(assert (= (and b!1073277 ((_ is ValueCellFull!12218) mapDefault!40474)) b!1073269))

(assert (= start!95040 b!1073277))

(declare-fun m!992325 () Bool)

(assert (=> start!95040 m!992325))

(declare-fun m!992327 () Bool)

(assert (=> start!95040 m!992327))

(declare-fun m!992329 () Bool)

(assert (=> start!95040 m!992329))

(declare-fun m!992331 () Bool)

(assert (=> mapNonEmpty!40474 m!992331))

(declare-fun m!992333 () Bool)

(assert (=> b!1073275 m!992333))

(declare-fun m!992335 () Bool)

(assert (=> b!1073274 m!992335))

(declare-fun m!992337 () Bool)

(assert (=> b!1073276 m!992337))

(declare-fun m!992339 () Bool)

(assert (=> b!1073276 m!992339))

(declare-fun m!992341 () Bool)

(assert (=> b!1073276 m!992341))

(declare-fun m!992343 () Bool)

(assert (=> b!1073276 m!992343))

(declare-fun m!992345 () Bool)

(assert (=> b!1073276 m!992345))

(declare-fun m!992347 () Bool)

(assert (=> b!1073276 m!992347))

(declare-fun m!992349 () Bool)

(assert (=> b!1073276 m!992349))

(declare-fun m!992351 () Bool)

(assert (=> b!1073276 m!992351))

(declare-fun m!992353 () Bool)

(assert (=> b!1073276 m!992353))

(assert (=> b!1073276 m!992343))

(declare-fun m!992355 () Bool)

(assert (=> b!1073276 m!992355))

(declare-fun m!992357 () Bool)

(assert (=> b!1073270 m!992357))

(declare-fun m!992359 () Bool)

(assert (=> b!1073270 m!992359))

(declare-fun m!992361 () Bool)

(assert (=> b!1073270 m!992361))

(declare-fun m!992363 () Bool)

(assert (=> b!1073273 m!992363))

(check-sat tp_is_empty!25843 (not start!95040) (not b_next!22033) (not b!1073275) (not b!1073276) (not b!1073270) (not b!1073273) (not b!1073274) b_and!34885 (not mapNonEmpty!40474))
(check-sat b_and!34885 (not b_next!22033))
