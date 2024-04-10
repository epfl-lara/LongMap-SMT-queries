; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95232 () Bool)

(assert start!95232)

(declare-fun b_free!22233 () Bool)

(declare-fun b_next!22233 () Bool)

(assert (=> start!95232 (= b_free!22233 (not b_next!22233))))

(declare-fun tp!78197 () Bool)

(declare-fun b_and!35211 () Bool)

(assert (=> start!95232 (= tp!78197 b_and!35211)))

(declare-fun b!1076417 () Bool)

(declare-fun res!717426 () Bool)

(declare-fun e!615293 () Bool)

(assert (=> b!1076417 (=> (not res!717426) (not e!615293))))

(declare-datatypes ((array!69057 0))(
  ( (array!69058 (arr!33211 (Array (_ BitVec 32) (_ BitVec 64))) (size!33747 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69057)

(declare-datatypes ((List!23188 0))(
  ( (Nil!23185) (Cons!23184 (h!24393 (_ BitVec 64)) (t!32547 List!23188)) )
))
(declare-fun arrayNoDuplicates!0 (array!69057 (_ BitVec 32) List!23188) Bool)

(assert (=> b!1076417 (= res!717426 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23185))))

(declare-fun b!1076418 () Bool)

(declare-fun e!615291 () Bool)

(declare-fun tp_is_empty!26043 () Bool)

(assert (=> b!1076418 (= e!615291 tp_is_empty!26043)))

(declare-fun mapIsEmpty!40810 () Bool)

(declare-fun mapRes!40810 () Bool)

(assert (=> mapIsEmpty!40810 mapRes!40810))

(declare-fun b!1076419 () Bool)

(declare-fun e!615289 () Bool)

(assert (=> b!1076419 (= e!615289 true)))

(declare-datatypes ((V!39859 0))(
  ( (V!39860 (val!13072 Int)) )
))
(declare-datatypes ((tuple2!16654 0))(
  ( (tuple2!16655 (_1!8338 (_ BitVec 64)) (_2!8338 V!39859)) )
))
(declare-datatypes ((List!23189 0))(
  ( (Nil!23186) (Cons!23185 (h!24394 tuple2!16654) (t!32548 List!23189)) )
))
(declare-datatypes ((ListLongMap!14623 0))(
  ( (ListLongMap!14624 (toList!7327 List!23189)) )
))
(declare-fun lt!478115 () ListLongMap!14623)

(declare-fun lt!478118 () tuple2!16654)

(declare-fun -!715 (ListLongMap!14623 (_ BitVec 64)) ListLongMap!14623)

(declare-fun +!3232 (ListLongMap!14623 tuple2!16654) ListLongMap!14623)

(assert (=> b!1076419 (= (-!715 (+!3232 lt!478115 lt!478118) #b0000000000000000000000000000000000000000000000000000000000000000) lt!478115)))

(declare-datatypes ((Unit!35432 0))(
  ( (Unit!35433) )
))
(declare-fun lt!478119 () Unit!35432)

(declare-fun zeroValueBefore!47 () V!39859)

(declare-fun addThenRemoveForNewKeyIsSame!80 (ListLongMap!14623 (_ BitVec 64) V!39859) Unit!35432)

(assert (=> b!1076419 (= lt!478119 (addThenRemoveForNewKeyIsSame!80 lt!478115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!478113 () ListLongMap!14623)

(declare-fun lt!478114 () tuple2!16654)

(assert (=> b!1076419 (= lt!478115 (+!3232 lt!478113 lt!478114))))

(declare-fun e!615288 () Bool)

(assert (=> b!1076419 e!615288))

(declare-fun res!717424 () Bool)

(assert (=> b!1076419 (=> (not res!717424) (not e!615288))))

(declare-fun lt!478116 () ListLongMap!14623)

(assert (=> b!1076419 (= res!717424 (= lt!478116 (+!3232 (+!3232 lt!478113 lt!478118) lt!478114)))))

(declare-fun minValue!907 () V!39859)

(assert (=> b!1076419 (= lt!478114 (tuple2!16655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1076419 (= lt!478118 (tuple2!16655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12318 0))(
  ( (ValueCellFull!12318 (v!15700 V!39859)) (EmptyCell!12318) )
))
(declare-datatypes ((array!69059 0))(
  ( (array!69060 (arr!33212 (Array (_ BitVec 32) ValueCell!12318)) (size!33748 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69059)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39859)

(declare-fun lt!478120 () ListLongMap!14623)

(declare-fun getCurrentListMap!4195 (array!69057 array!69059 (_ BitVec 32) (_ BitVec 32) V!39859 V!39859 (_ BitVec 32) Int) ListLongMap!14623)

(assert (=> b!1076419 (= lt!478120 (getCurrentListMap!4195 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076419 (= lt!478116 (getCurrentListMap!4195 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076421 () Bool)

(declare-fun e!615292 () Bool)

(declare-fun e!615294 () Bool)

(assert (=> b!1076421 (= e!615292 (and e!615294 mapRes!40810))))

(declare-fun condMapEmpty!40810 () Bool)

(declare-fun mapDefault!40810 () ValueCell!12318)

(assert (=> b!1076421 (= condMapEmpty!40810 (= (arr!33212 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12318)) mapDefault!40810)))))

(declare-fun b!1076422 () Bool)

(declare-fun res!717429 () Bool)

(assert (=> b!1076422 (=> (not res!717429) (not e!615293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69057 (_ BitVec 32)) Bool)

(assert (=> b!1076422 (= res!717429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40810 () Bool)

(declare-fun tp!78196 () Bool)

(assert (=> mapNonEmpty!40810 (= mapRes!40810 (and tp!78196 e!615291))))

(declare-fun mapValue!40810 () ValueCell!12318)

(declare-fun mapRest!40810 () (Array (_ BitVec 32) ValueCell!12318))

(declare-fun mapKey!40810 () (_ BitVec 32))

(assert (=> mapNonEmpty!40810 (= (arr!33212 _values!955) (store mapRest!40810 mapKey!40810 mapValue!40810))))

(declare-fun b!1076423 () Bool)

(declare-fun res!717428 () Bool)

(assert (=> b!1076423 (=> (not res!717428) (not e!615293))))

(assert (=> b!1076423 (= res!717428 (and (= (size!33748 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33747 _keys!1163) (size!33748 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076420 () Bool)

(declare-fun lt!478121 () ListLongMap!14623)

(assert (=> b!1076420 (= e!615288 (= lt!478120 (+!3232 lt!478121 lt!478114)))))

(declare-fun res!717427 () Bool)

(assert (=> start!95232 (=> (not res!717427) (not e!615293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95232 (= res!717427 (validMask!0 mask!1515))))

(assert (=> start!95232 e!615293))

(assert (=> start!95232 true))

(assert (=> start!95232 tp_is_empty!26043))

(declare-fun array_inv!25660 (array!69059) Bool)

(assert (=> start!95232 (and (array_inv!25660 _values!955) e!615292)))

(assert (=> start!95232 tp!78197))

(declare-fun array_inv!25661 (array!69057) Bool)

(assert (=> start!95232 (array_inv!25661 _keys!1163)))

(declare-fun b!1076424 () Bool)

(assert (=> b!1076424 (= e!615293 (not e!615289))))

(declare-fun res!717425 () Bool)

(assert (=> b!1076424 (=> res!717425 e!615289)))

(assert (=> b!1076424 (= res!717425 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1076424 (= lt!478113 lt!478121)))

(declare-fun lt!478117 () Unit!35432)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!905 (array!69057 array!69059 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39859 V!39859 V!39859 V!39859 (_ BitVec 32) Int) Unit!35432)

(assert (=> b!1076424 (= lt!478117 (lemmaNoChangeToArrayThenSameMapNoExtras!905 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3889 (array!69057 array!69059 (_ BitVec 32) (_ BitVec 32) V!39859 V!39859 (_ BitVec 32) Int) ListLongMap!14623)

(assert (=> b!1076424 (= lt!478121 (getCurrentListMapNoExtraKeys!3889 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076424 (= lt!478113 (getCurrentListMapNoExtraKeys!3889 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076425 () Bool)

(assert (=> b!1076425 (= e!615294 tp_is_empty!26043)))

(assert (= (and start!95232 res!717427) b!1076423))

(assert (= (and b!1076423 res!717428) b!1076422))

(assert (= (and b!1076422 res!717429) b!1076417))

(assert (= (and b!1076417 res!717426) b!1076424))

(assert (= (and b!1076424 (not res!717425)) b!1076419))

(assert (= (and b!1076419 res!717424) b!1076420))

(assert (= (and b!1076421 condMapEmpty!40810) mapIsEmpty!40810))

(assert (= (and b!1076421 (not condMapEmpty!40810)) mapNonEmpty!40810))

(get-info :version)

(assert (= (and mapNonEmpty!40810 ((_ is ValueCellFull!12318) mapValue!40810)) b!1076418))

(assert (= (and b!1076421 ((_ is ValueCellFull!12318) mapDefault!40810)) b!1076425))

(assert (= start!95232 b!1076421))

(declare-fun m!995311 () Bool)

(assert (=> b!1076424 m!995311))

(declare-fun m!995313 () Bool)

(assert (=> b!1076424 m!995313))

(declare-fun m!995315 () Bool)

(assert (=> b!1076424 m!995315))

(declare-fun m!995317 () Bool)

(assert (=> start!95232 m!995317))

(declare-fun m!995319 () Bool)

(assert (=> start!95232 m!995319))

(declare-fun m!995321 () Bool)

(assert (=> start!95232 m!995321))

(declare-fun m!995323 () Bool)

(assert (=> mapNonEmpty!40810 m!995323))

(declare-fun m!995325 () Bool)

(assert (=> b!1076422 m!995325))

(declare-fun m!995327 () Bool)

(assert (=> b!1076420 m!995327))

(declare-fun m!995329 () Bool)

(assert (=> b!1076417 m!995329))

(declare-fun m!995331 () Bool)

(assert (=> b!1076419 m!995331))

(declare-fun m!995333 () Bool)

(assert (=> b!1076419 m!995333))

(declare-fun m!995335 () Bool)

(assert (=> b!1076419 m!995335))

(declare-fun m!995337 () Bool)

(assert (=> b!1076419 m!995337))

(declare-fun m!995339 () Bool)

(assert (=> b!1076419 m!995339))

(declare-fun m!995341 () Bool)

(assert (=> b!1076419 m!995341))

(assert (=> b!1076419 m!995331))

(assert (=> b!1076419 m!995337))

(declare-fun m!995343 () Bool)

(assert (=> b!1076419 m!995343))

(declare-fun m!995345 () Bool)

(assert (=> b!1076419 m!995345))

(check-sat b_and!35211 (not b!1076417) tp_is_empty!26043 (not b!1076424) (not b!1076422) (not mapNonEmpty!40810) (not b!1076419) (not start!95232) (not b_next!22233) (not b!1076420))
(check-sat b_and!35211 (not b_next!22233))
