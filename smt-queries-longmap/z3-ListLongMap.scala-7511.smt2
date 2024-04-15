; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95236 () Bool)

(assert start!95236)

(declare-fun b_free!22243 () Bool)

(declare-fun b_next!22243 () Bool)

(assert (=> start!95236 (= b_free!22243 (not b_next!22243))))

(declare-fun tp!78227 () Bool)

(declare-fun b_and!35195 () Bool)

(assert (=> start!95236 (= tp!78227 b_and!35195)))

(declare-datatypes ((V!39873 0))(
  ( (V!39874 (val!13077 Int)) )
))
(declare-datatypes ((tuple2!16734 0))(
  ( (tuple2!16735 (_1!8378 (_ BitVec 64)) (_2!8378 V!39873)) )
))
(declare-fun lt!478085 () tuple2!16734)

(declare-fun b!1076399 () Bool)

(declare-datatypes ((List!23250 0))(
  ( (Nil!23247) (Cons!23246 (h!24455 tuple2!16734) (t!32600 List!23250)) )
))
(declare-datatypes ((ListLongMap!14703 0))(
  ( (ListLongMap!14704 (toList!7367 List!23250)) )
))
(declare-fun lt!478090 () ListLongMap!14703)

(declare-fun e!615301 () Bool)

(declare-fun lt!478095 () ListLongMap!14703)

(declare-fun +!3266 (ListLongMap!14703 tuple2!16734) ListLongMap!14703)

(assert (=> b!1076399 (= e!615301 (= lt!478090 (+!3266 lt!478095 lt!478085)))))

(declare-fun b!1076400 () Bool)

(declare-fun res!717447 () Bool)

(declare-fun e!615303 () Bool)

(assert (=> b!1076400 (=> (not res!717447) (not e!615303))))

(declare-datatypes ((array!69014 0))(
  ( (array!69015 (arr!33190 (Array (_ BitVec 32) (_ BitVec 64))) (size!33728 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69014)

(declare-datatypes ((List!23251 0))(
  ( (Nil!23248) (Cons!23247 (h!24456 (_ BitVec 64)) (t!32601 List!23251)) )
))
(declare-fun arrayNoDuplicates!0 (array!69014 (_ BitVec 32) List!23251) Bool)

(assert (=> b!1076400 (= res!717447 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23248))))

(declare-fun b!1076401 () Bool)

(declare-fun res!717446 () Bool)

(assert (=> b!1076401 (=> (not res!717446) (not e!615303))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69014 (_ BitVec 32)) Bool)

(assert (=> b!1076401 (= res!717446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40825 () Bool)

(declare-fun mapRes!40825 () Bool)

(assert (=> mapIsEmpty!40825 mapRes!40825))

(declare-fun res!717448 () Bool)

(assert (=> start!95236 (=> (not res!717448) (not e!615303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95236 (= res!717448 (validMask!0 mask!1515))))

(assert (=> start!95236 e!615303))

(assert (=> start!95236 true))

(declare-fun tp_is_empty!26053 () Bool)

(assert (=> start!95236 tp_is_empty!26053))

(declare-datatypes ((ValueCell!12323 0))(
  ( (ValueCellFull!12323 (v!15704 V!39873)) (EmptyCell!12323) )
))
(declare-datatypes ((array!69016 0))(
  ( (array!69017 (arr!33191 (Array (_ BitVec 32) ValueCell!12323)) (size!33729 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69016)

(declare-fun e!615302 () Bool)

(declare-fun array_inv!25672 (array!69016) Bool)

(assert (=> start!95236 (and (array_inv!25672 _values!955) e!615302)))

(assert (=> start!95236 tp!78227))

(declare-fun array_inv!25673 (array!69014) Bool)

(assert (=> start!95236 (array_inv!25673 _keys!1163)))

(declare-fun b!1076402 () Bool)

(declare-fun res!717445 () Bool)

(assert (=> b!1076402 (=> (not res!717445) (not e!615303))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076402 (= res!717445 (and (= (size!33729 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33728 _keys!1163) (size!33729 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076403 () Bool)

(declare-fun e!615305 () Bool)

(assert (=> b!1076403 (= e!615302 (and e!615305 mapRes!40825))))

(declare-fun condMapEmpty!40825 () Bool)

(declare-fun mapDefault!40825 () ValueCell!12323)

(assert (=> b!1076403 (= condMapEmpty!40825 (= (arr!33191 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12323)) mapDefault!40825)))))

(declare-fun b!1076404 () Bool)

(declare-fun e!615304 () Bool)

(assert (=> b!1076404 (= e!615303 (not e!615304))))

(declare-fun res!717450 () Bool)

(assert (=> b!1076404 (=> res!717450 e!615304)))

(assert (=> b!1076404 (= res!717450 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!478087 () ListLongMap!14703)

(assert (=> b!1076404 (= lt!478087 lt!478095)))

(declare-fun zeroValueBefore!47 () V!39873)

(declare-datatypes ((Unit!35285 0))(
  ( (Unit!35286) )
))
(declare-fun lt!478089 () Unit!35285)

(declare-fun minValue!907 () V!39873)

(declare-fun zeroValueAfter!47 () V!39873)

(declare-fun defaultEntry!963 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!914 (array!69014 array!69016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39873 V!39873 V!39873 V!39873 (_ BitVec 32) Int) Unit!35285)

(assert (=> b!1076404 (= lt!478089 (lemmaNoChangeToArrayThenSameMapNoExtras!914 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3942 (array!69014 array!69016 (_ BitVec 32) (_ BitVec 32) V!39873 V!39873 (_ BitVec 32) Int) ListLongMap!14703)

(assert (=> b!1076404 (= lt!478095 (getCurrentListMapNoExtraKeys!3942 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076404 (= lt!478087 (getCurrentListMapNoExtraKeys!3942 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40825 () Bool)

(declare-fun tp!78226 () Bool)

(declare-fun e!615300 () Bool)

(assert (=> mapNonEmpty!40825 (= mapRes!40825 (and tp!78226 e!615300))))

(declare-fun mapKey!40825 () (_ BitVec 32))

(declare-fun mapValue!40825 () ValueCell!12323)

(declare-fun mapRest!40825 () (Array (_ BitVec 32) ValueCell!12323))

(assert (=> mapNonEmpty!40825 (= (arr!33191 _values!955) (store mapRest!40825 mapKey!40825 mapValue!40825))))

(declare-fun b!1076405 () Bool)

(assert (=> b!1076405 (= e!615300 tp_is_empty!26053)))

(declare-fun b!1076406 () Bool)

(assert (=> b!1076406 (= e!615305 tp_is_empty!26053)))

(declare-fun b!1076407 () Bool)

(assert (=> b!1076407 (= e!615304 true)))

(declare-fun lt!478088 () ListLongMap!14703)

(declare-fun lt!478094 () ListLongMap!14703)

(declare-fun -!702 (ListLongMap!14703 (_ BitVec 64)) ListLongMap!14703)

(assert (=> b!1076407 (= lt!478088 (-!702 lt!478094 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!478086 () ListLongMap!14703)

(declare-fun lt!478091 () ListLongMap!14703)

(assert (=> b!1076407 (= lt!478086 lt!478091)))

(declare-fun lt!478083 () Unit!35285)

(declare-fun addCommutativeForDiffKeys!751 (ListLongMap!14703 (_ BitVec 64) V!39873 (_ BitVec 64) V!39873) Unit!35285)

(assert (=> b!1076407 (= lt!478083 (addCommutativeForDiffKeys!751 lt!478087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!478093 () ListLongMap!14703)

(assert (=> b!1076407 (= (-!702 lt!478091 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478093)))

(declare-fun lt!478092 () tuple2!16734)

(assert (=> b!1076407 (= lt!478091 (+!3266 lt!478093 lt!478092))))

(declare-fun lt!478084 () Unit!35285)

(declare-fun addThenRemoveForNewKeyIsSame!80 (ListLongMap!14703 (_ BitVec 64) V!39873) Unit!35285)

(assert (=> b!1076407 (= lt!478084 (addThenRemoveForNewKeyIsSame!80 lt!478093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1076407 (= lt!478093 (+!3266 lt!478087 lt!478085))))

(assert (=> b!1076407 e!615301))

(declare-fun res!717449 () Bool)

(assert (=> b!1076407 (=> (not res!717449) (not e!615301))))

(assert (=> b!1076407 (= res!717449 (= lt!478094 lt!478086))))

(assert (=> b!1076407 (= lt!478086 (+!3266 (+!3266 lt!478087 lt!478092) lt!478085))))

(assert (=> b!1076407 (= lt!478085 (tuple2!16735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1076407 (= lt!478092 (tuple2!16735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4134 (array!69014 array!69016 (_ BitVec 32) (_ BitVec 32) V!39873 V!39873 (_ BitVec 32) Int) ListLongMap!14703)

(assert (=> b!1076407 (= lt!478090 (getCurrentListMap!4134 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076407 (= lt!478094 (getCurrentListMap!4134 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95236 res!717448) b!1076402))

(assert (= (and b!1076402 res!717445) b!1076401))

(assert (= (and b!1076401 res!717446) b!1076400))

(assert (= (and b!1076400 res!717447) b!1076404))

(assert (= (and b!1076404 (not res!717450)) b!1076407))

(assert (= (and b!1076407 res!717449) b!1076399))

(assert (= (and b!1076403 condMapEmpty!40825) mapIsEmpty!40825))

(assert (= (and b!1076403 (not condMapEmpty!40825)) mapNonEmpty!40825))

(get-info :version)

(assert (= (and mapNonEmpty!40825 ((_ is ValueCellFull!12323) mapValue!40825)) b!1076405))

(assert (= (and b!1076403 ((_ is ValueCellFull!12323) mapDefault!40825)) b!1076406))

(assert (= start!95236 b!1076403))

(declare-fun m!994877 () Bool)

(assert (=> mapNonEmpty!40825 m!994877))

(declare-fun m!994879 () Bool)

(assert (=> b!1076407 m!994879))

(declare-fun m!994881 () Bool)

(assert (=> b!1076407 m!994881))

(declare-fun m!994883 () Bool)

(assert (=> b!1076407 m!994883))

(declare-fun m!994885 () Bool)

(assert (=> b!1076407 m!994885))

(assert (=> b!1076407 m!994885))

(declare-fun m!994887 () Bool)

(assert (=> b!1076407 m!994887))

(declare-fun m!994889 () Bool)

(assert (=> b!1076407 m!994889))

(declare-fun m!994891 () Bool)

(assert (=> b!1076407 m!994891))

(declare-fun m!994893 () Bool)

(assert (=> b!1076407 m!994893))

(declare-fun m!994895 () Bool)

(assert (=> b!1076407 m!994895))

(declare-fun m!994897 () Bool)

(assert (=> b!1076407 m!994897))

(declare-fun m!994899 () Bool)

(assert (=> b!1076404 m!994899))

(declare-fun m!994901 () Bool)

(assert (=> b!1076404 m!994901))

(declare-fun m!994903 () Bool)

(assert (=> b!1076404 m!994903))

(declare-fun m!994905 () Bool)

(assert (=> b!1076401 m!994905))

(declare-fun m!994907 () Bool)

(assert (=> start!95236 m!994907))

(declare-fun m!994909 () Bool)

(assert (=> start!95236 m!994909))

(declare-fun m!994911 () Bool)

(assert (=> start!95236 m!994911))

(declare-fun m!994913 () Bool)

(assert (=> b!1076400 m!994913))

(declare-fun m!994915 () Bool)

(assert (=> b!1076399 m!994915))

(check-sat (not mapNonEmpty!40825) (not b!1076404) tp_is_empty!26053 b_and!35195 (not b_next!22243) (not b!1076399) (not b!1076400) (not start!95236) (not b!1076407) (not b!1076401))
(check-sat b_and!35195 (not b_next!22243))
