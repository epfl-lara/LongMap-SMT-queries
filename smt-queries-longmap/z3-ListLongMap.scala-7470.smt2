; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94980 () Bool)

(assert start!94980)

(declare-fun b_free!21997 () Bool)

(declare-fun b_next!21997 () Bool)

(assert (=> start!94980 (= b_free!21997 (not b_next!21997))))

(declare-fun tp!77449 () Bool)

(declare-fun b_and!34837 () Bool)

(assert (=> start!94980 (= tp!77449 b_and!34837)))

(declare-fun b!1072591 () Bool)

(declare-fun e!612515 () Bool)

(declare-fun tp_is_empty!25807 () Bool)

(assert (=> b!1072591 (= e!612515 tp_is_empty!25807)))

(declare-fun b!1072592 () Bool)

(declare-fun res!715145 () Bool)

(declare-fun e!612516 () Bool)

(assert (=> b!1072592 (=> (not res!715145) (not e!612516))))

(declare-datatypes ((array!68627 0))(
  ( (array!68628 (arr!33003 (Array (_ BitVec 32) (_ BitVec 64))) (size!33540 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68627)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68627 (_ BitVec 32)) Bool)

(assert (=> b!1072592 (= res!715145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072593 () Bool)

(declare-fun e!612514 () Bool)

(assert (=> b!1072593 (= e!612516 (not e!612514))))

(declare-fun res!715150 () Bool)

(assert (=> b!1072593 (=> res!715150 e!612514)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072593 (= res!715150 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39545 0))(
  ( (V!39546 (val!12954 Int)) )
))
(declare-datatypes ((tuple2!16456 0))(
  ( (tuple2!16457 (_1!8239 (_ BitVec 64)) (_2!8239 V!39545)) )
))
(declare-datatypes ((List!23016 0))(
  ( (Nil!23013) (Cons!23012 (h!24230 tuple2!16456) (t!32341 List!23016)) )
))
(declare-datatypes ((ListLongMap!14433 0))(
  ( (ListLongMap!14434 (toList!7232 List!23016)) )
))
(declare-fun lt!474344 () ListLongMap!14433)

(declare-fun lt!474345 () ListLongMap!14433)

(assert (=> b!1072593 (= lt!474344 lt!474345)))

(declare-datatypes ((Unit!35251 0))(
  ( (Unit!35252) )
))
(declare-fun lt!474348 () Unit!35251)

(declare-fun zeroValueBefore!47 () V!39545)

(declare-datatypes ((ValueCell!12200 0))(
  ( (ValueCellFull!12200 (v!15566 V!39545)) (EmptyCell!12200) )
))
(declare-datatypes ((array!68629 0))(
  ( (array!68630 (arr!33004 (Array (_ BitVec 32) ValueCell!12200)) (size!33541 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68629)

(declare-fun minValue!907 () V!39545)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39545)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!842 (array!68627 array!68629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39545 V!39545 V!39545 V!39545 (_ BitVec 32) Int) Unit!35251)

(assert (=> b!1072593 (= lt!474348 (lemmaNoChangeToArrayThenSameMapNoExtras!842 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3839 (array!68627 array!68629 (_ BitVec 32) (_ BitVec 32) V!39545 V!39545 (_ BitVec 32) Int) ListLongMap!14433)

(assert (=> b!1072593 (= lt!474345 (getCurrentListMapNoExtraKeys!3839 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072593 (= lt!474344 (getCurrentListMapNoExtraKeys!3839 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072594 () Bool)

(declare-fun e!612513 () Bool)

(assert (=> b!1072594 (= e!612513 tp_is_empty!25807)))

(declare-fun b!1072595 () Bool)

(assert (=> b!1072595 (= e!612514 true)))

(declare-fun lt!474340 () ListLongMap!14433)

(declare-fun lt!474351 () ListLongMap!14433)

(declare-fun -!668 (ListLongMap!14433 (_ BitVec 64)) ListLongMap!14433)

(assert (=> b!1072595 (= lt!474340 (-!668 lt!474351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474352 () ListLongMap!14433)

(declare-fun lt!474346 () ListLongMap!14433)

(assert (=> b!1072595 (= lt!474352 lt!474346)))

(declare-fun lt!474341 () Unit!35251)

(declare-fun addCommutativeForDiffKeys!725 (ListLongMap!14433 (_ BitVec 64) V!39545 (_ BitVec 64) V!39545) Unit!35251)

(assert (=> b!1072595 (= lt!474341 (addCommutativeForDiffKeys!725 lt!474344 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474350 () ListLongMap!14433)

(assert (=> b!1072595 (= (-!668 lt!474346 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474350)))

(declare-fun lt!474349 () tuple2!16456)

(declare-fun +!3195 (ListLongMap!14433 tuple2!16456) ListLongMap!14433)

(assert (=> b!1072595 (= lt!474346 (+!3195 lt!474350 lt!474349))))

(declare-fun lt!474343 () Unit!35251)

(declare-fun addThenRemoveForNewKeyIsSame!43 (ListLongMap!14433 (_ BitVec 64) V!39545) Unit!35251)

(assert (=> b!1072595 (= lt!474343 (addThenRemoveForNewKeyIsSame!43 lt!474350 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474347 () tuple2!16456)

(assert (=> b!1072595 (= lt!474350 (+!3195 lt!474344 lt!474347))))

(declare-fun e!612512 () Bool)

(assert (=> b!1072595 e!612512))

(declare-fun res!715146 () Bool)

(assert (=> b!1072595 (=> (not res!715146) (not e!612512))))

(assert (=> b!1072595 (= res!715146 (= lt!474351 lt!474352))))

(assert (=> b!1072595 (= lt!474352 (+!3195 (+!3195 lt!474344 lt!474349) lt!474347))))

(assert (=> b!1072595 (= lt!474347 (tuple2!16457 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072595 (= lt!474349 (tuple2!16457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474342 () ListLongMap!14433)

(declare-fun getCurrentListMap!4129 (array!68627 array!68629 (_ BitVec 32) (_ BitVec 32) V!39545 V!39545 (_ BitVec 32) Int) ListLongMap!14433)

(assert (=> b!1072595 (= lt!474342 (getCurrentListMap!4129 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072595 (= lt!474351 (getCurrentListMap!4129 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40417 () Bool)

(declare-fun mapRes!40417 () Bool)

(assert (=> mapIsEmpty!40417 mapRes!40417))

(declare-fun mapNonEmpty!40417 () Bool)

(declare-fun tp!77450 () Bool)

(assert (=> mapNonEmpty!40417 (= mapRes!40417 (and tp!77450 e!612515))))

(declare-fun mapRest!40417 () (Array (_ BitVec 32) ValueCell!12200))

(declare-fun mapKey!40417 () (_ BitVec 32))

(declare-fun mapValue!40417 () ValueCell!12200)

(assert (=> mapNonEmpty!40417 (= (arr!33004 _values!955) (store mapRest!40417 mapKey!40417 mapValue!40417))))

(declare-fun res!715147 () Bool)

(assert (=> start!94980 (=> (not res!715147) (not e!612516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94980 (= res!715147 (validMask!0 mask!1515))))

(assert (=> start!94980 e!612516))

(assert (=> start!94980 true))

(assert (=> start!94980 tp_is_empty!25807))

(declare-fun e!612517 () Bool)

(declare-fun array_inv!25550 (array!68629) Bool)

(assert (=> start!94980 (and (array_inv!25550 _values!955) e!612517)))

(assert (=> start!94980 tp!77449))

(declare-fun array_inv!25551 (array!68627) Bool)

(assert (=> start!94980 (array_inv!25551 _keys!1163)))

(declare-fun b!1072596 () Bool)

(declare-fun res!715148 () Bool)

(assert (=> b!1072596 (=> (not res!715148) (not e!612516))))

(declare-datatypes ((List!23017 0))(
  ( (Nil!23014) (Cons!23013 (h!24231 (_ BitVec 64)) (t!32342 List!23017)) )
))
(declare-fun arrayNoDuplicates!0 (array!68627 (_ BitVec 32) List!23017) Bool)

(assert (=> b!1072596 (= res!715148 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23014))))

(declare-fun b!1072597 () Bool)

(assert (=> b!1072597 (= e!612517 (and e!612513 mapRes!40417))))

(declare-fun condMapEmpty!40417 () Bool)

(declare-fun mapDefault!40417 () ValueCell!12200)

(assert (=> b!1072597 (= condMapEmpty!40417 (= (arr!33004 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12200)) mapDefault!40417)))))

(declare-fun b!1072598 () Bool)

(assert (=> b!1072598 (= e!612512 (= lt!474342 (+!3195 lt!474345 lt!474347)))))

(declare-fun b!1072599 () Bool)

(declare-fun res!715149 () Bool)

(assert (=> b!1072599 (=> (not res!715149) (not e!612516))))

(assert (=> b!1072599 (= res!715149 (and (= (size!33541 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33540 _keys!1163) (size!33541 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94980 res!715147) b!1072599))

(assert (= (and b!1072599 res!715149) b!1072592))

(assert (= (and b!1072592 res!715145) b!1072596))

(assert (= (and b!1072596 res!715148) b!1072593))

(assert (= (and b!1072593 (not res!715150)) b!1072595))

(assert (= (and b!1072595 res!715146) b!1072598))

(assert (= (and b!1072597 condMapEmpty!40417) mapIsEmpty!40417))

(assert (= (and b!1072597 (not condMapEmpty!40417)) mapNonEmpty!40417))

(get-info :version)

(assert (= (and mapNonEmpty!40417 ((_ is ValueCellFull!12200) mapValue!40417)) b!1072591))

(assert (= (and b!1072597 ((_ is ValueCellFull!12200) mapDefault!40417)) b!1072594))

(assert (= start!94980 b!1072597))

(declare-fun m!991361 () Bool)

(assert (=> b!1072596 m!991361))

(declare-fun m!991363 () Bool)

(assert (=> b!1072592 m!991363))

(declare-fun m!991365 () Bool)

(assert (=> b!1072598 m!991365))

(declare-fun m!991367 () Bool)

(assert (=> mapNonEmpty!40417 m!991367))

(declare-fun m!991369 () Bool)

(assert (=> b!1072593 m!991369))

(declare-fun m!991371 () Bool)

(assert (=> b!1072593 m!991371))

(declare-fun m!991373 () Bool)

(assert (=> b!1072593 m!991373))

(declare-fun m!991375 () Bool)

(assert (=> b!1072595 m!991375))

(declare-fun m!991377 () Bool)

(assert (=> b!1072595 m!991377))

(declare-fun m!991379 () Bool)

(assert (=> b!1072595 m!991379))

(declare-fun m!991381 () Bool)

(assert (=> b!1072595 m!991381))

(declare-fun m!991383 () Bool)

(assert (=> b!1072595 m!991383))

(declare-fun m!991385 () Bool)

(assert (=> b!1072595 m!991385))

(declare-fun m!991387 () Bool)

(assert (=> b!1072595 m!991387))

(declare-fun m!991389 () Bool)

(assert (=> b!1072595 m!991389))

(assert (=> b!1072595 m!991383))

(declare-fun m!991391 () Bool)

(assert (=> b!1072595 m!991391))

(declare-fun m!991393 () Bool)

(assert (=> b!1072595 m!991393))

(declare-fun m!991395 () Bool)

(assert (=> start!94980 m!991395))

(declare-fun m!991397 () Bool)

(assert (=> start!94980 m!991397))

(declare-fun m!991399 () Bool)

(assert (=> start!94980 m!991399))

(check-sat b_and!34837 (not start!94980) (not mapNonEmpty!40417) (not b!1072592) (not b!1072596) tp_is_empty!25807 (not b!1072595) (not b!1072593) (not b_next!21997) (not b!1072598))
(check-sat b_and!34837 (not b_next!21997))
