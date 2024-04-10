; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94830 () Bool)

(assert start!94830)

(declare-fun b_free!22059 () Bool)

(declare-fun b_next!22059 () Bool)

(assert (=> start!94830 (= b_free!22059 (not b_next!22059))))

(declare-fun tp!77639 () Bool)

(declare-fun b_and!34901 () Bool)

(assert (=> start!94830 (= tp!77639 b_and!34901)))

(declare-fun b!1072293 () Bool)

(declare-fun e!612432 () Bool)

(declare-fun tp_is_empty!25869 () Bool)

(assert (=> b!1072293 (= e!612432 tp_is_empty!25869)))

(declare-fun mapIsEmpty!40513 () Bool)

(declare-fun mapRes!40513 () Bool)

(assert (=> mapIsEmpty!40513 mapRes!40513))

(declare-fun mapNonEmpty!40513 () Bool)

(declare-fun tp!77638 () Bool)

(declare-fun e!612434 () Bool)

(assert (=> mapNonEmpty!40513 (= mapRes!40513 (and tp!77638 e!612434))))

(declare-datatypes ((V!39627 0))(
  ( (V!39628 (val!12985 Int)) )
))
(declare-datatypes ((ValueCell!12231 0))(
  ( (ValueCellFull!12231 (v!15602 V!39627)) (EmptyCell!12231) )
))
(declare-fun mapRest!40513 () (Array (_ BitVec 32) ValueCell!12231))

(declare-fun mapValue!40513 () ValueCell!12231)

(declare-fun mapKey!40513 () (_ BitVec 32))

(declare-datatypes ((array!68707 0))(
  ( (array!68708 (arr!33048 (Array (_ BitVec 32) ValueCell!12231)) (size!33584 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68707)

(assert (=> mapNonEmpty!40513 (= (arr!33048 _values!955) (store mapRest!40513 mapKey!40513 mapValue!40513))))

(declare-fun b!1072294 () Bool)

(declare-fun e!612437 () Bool)

(assert (=> b!1072294 (= e!612437 true)))

(declare-datatypes ((tuple2!16538 0))(
  ( (tuple2!16539 (_1!8280 (_ BitVec 64)) (_2!8280 V!39627)) )
))
(declare-datatypes ((List!23071 0))(
  ( (Nil!23068) (Cons!23067 (h!24276 tuple2!16538) (t!32406 List!23071)) )
))
(declare-datatypes ((ListLongMap!14507 0))(
  ( (ListLongMap!14508 (toList!7269 List!23071)) )
))
(declare-fun lt!475203 () ListLongMap!14507)

(declare-fun lt!475197 () ListLongMap!14507)

(declare-fun -!697 (ListLongMap!14507 (_ BitVec 64)) ListLongMap!14507)

(assert (=> b!1072294 (= lt!475203 (-!697 lt!475197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475194 () ListLongMap!14507)

(declare-fun lt!475201 () ListLongMap!14507)

(assert (=> b!1072294 (= lt!475194 lt!475201)))

(declare-fun zeroValueBefore!47 () V!39627)

(declare-datatypes ((Unit!35332 0))(
  ( (Unit!35333) )
))
(declare-fun lt!475191 () Unit!35332)

(declare-fun lt!475199 () ListLongMap!14507)

(declare-fun minValue!907 () V!39627)

(declare-fun addCommutativeForDiffKeys!742 (ListLongMap!14507 (_ BitVec 64) V!39627 (_ BitVec 64) V!39627) Unit!35332)

(assert (=> b!1072294 (= lt!475191 (addCommutativeForDiffKeys!742 lt!475199 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475196 () ListLongMap!14507)

(assert (=> b!1072294 (= (-!697 lt!475201 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475196)))

(declare-fun lt!475202 () tuple2!16538)

(declare-fun +!3203 (ListLongMap!14507 tuple2!16538) ListLongMap!14507)

(assert (=> b!1072294 (= lt!475201 (+!3203 lt!475196 lt!475202))))

(declare-fun lt!475195 () Unit!35332)

(declare-fun addThenRemoveForNewKeyIsSame!67 (ListLongMap!14507 (_ BitVec 64) V!39627) Unit!35332)

(assert (=> b!1072294 (= lt!475195 (addThenRemoveForNewKeyIsSame!67 lt!475196 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475198 () tuple2!16538)

(assert (=> b!1072294 (= lt!475196 (+!3203 lt!475199 lt!475198))))

(declare-fun e!612433 () Bool)

(assert (=> b!1072294 e!612433))

(declare-fun res!715275 () Bool)

(assert (=> b!1072294 (=> (not res!715275) (not e!612433))))

(assert (=> b!1072294 (= res!715275 (= lt!475197 lt!475194))))

(assert (=> b!1072294 (= lt!475194 (+!3203 (+!3203 lt!475199 lt!475202) lt!475198))))

(assert (=> b!1072294 (= lt!475198 (tuple2!16539 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072294 (= lt!475202 (tuple2!16539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((array!68709 0))(
  ( (array!68710 (arr!33049 (Array (_ BitVec 32) (_ BitVec 64))) (size!33585 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68709)

(declare-fun lt!475193 () ListLongMap!14507)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39627)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun getCurrentListMap!4163 (array!68709 array!68707 (_ BitVec 32) (_ BitVec 32) V!39627 V!39627 (_ BitVec 32) Int) ListLongMap!14507)

(assert (=> b!1072294 (= lt!475193 (getCurrentListMap!4163 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072294 (= lt!475197 (getCurrentListMap!4163 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072295 () Bool)

(assert (=> b!1072295 (= e!612434 tp_is_empty!25869)))

(declare-fun b!1072296 () Bool)

(declare-fun res!715276 () Bool)

(declare-fun e!612435 () Bool)

(assert (=> b!1072296 (=> (not res!715276) (not e!612435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68709 (_ BitVec 32)) Bool)

(assert (=> b!1072296 (= res!715276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072297 () Bool)

(declare-fun res!715272 () Bool)

(assert (=> b!1072297 (=> (not res!715272) (not e!612435))))

(declare-datatypes ((List!23072 0))(
  ( (Nil!23069) (Cons!23068 (h!24277 (_ BitVec 64)) (t!32407 List!23072)) )
))
(declare-fun arrayNoDuplicates!0 (array!68709 (_ BitVec 32) List!23072) Bool)

(assert (=> b!1072297 (= res!715272 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23069))))

(declare-fun res!715274 () Bool)

(assert (=> start!94830 (=> (not res!715274) (not e!612435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94830 (= res!715274 (validMask!0 mask!1515))))

(assert (=> start!94830 e!612435))

(assert (=> start!94830 true))

(assert (=> start!94830 tp_is_empty!25869))

(declare-fun e!612436 () Bool)

(declare-fun array_inv!25550 (array!68707) Bool)

(assert (=> start!94830 (and (array_inv!25550 _values!955) e!612436)))

(assert (=> start!94830 tp!77639))

(declare-fun array_inv!25551 (array!68709) Bool)

(assert (=> start!94830 (array_inv!25551 _keys!1163)))

(declare-fun b!1072298 () Bool)

(assert (=> b!1072298 (= e!612435 (not e!612437))))

(declare-fun res!715273 () Bool)

(assert (=> b!1072298 (=> res!715273 e!612437)))

(assert (=> b!1072298 (= res!715273 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!475200 () ListLongMap!14507)

(assert (=> b!1072298 (= lt!475199 lt!475200)))

(declare-fun lt!475192 () Unit!35332)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!870 (array!68709 array!68707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39627 V!39627 V!39627 V!39627 (_ BitVec 32) Int) Unit!35332)

(assert (=> b!1072298 (= lt!475192 (lemmaNoChangeToArrayThenSameMapNoExtras!870 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3833 (array!68709 array!68707 (_ BitVec 32) (_ BitVec 32) V!39627 V!39627 (_ BitVec 32) Int) ListLongMap!14507)

(assert (=> b!1072298 (= lt!475200 (getCurrentListMapNoExtraKeys!3833 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072298 (= lt!475199 (getCurrentListMapNoExtraKeys!3833 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072299 () Bool)

(assert (=> b!1072299 (= e!612436 (and e!612432 mapRes!40513))))

(declare-fun condMapEmpty!40513 () Bool)

(declare-fun mapDefault!40513 () ValueCell!12231)

(assert (=> b!1072299 (= condMapEmpty!40513 (= (arr!33048 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12231)) mapDefault!40513)))))

(declare-fun b!1072300 () Bool)

(declare-fun res!715271 () Bool)

(assert (=> b!1072300 (=> (not res!715271) (not e!612435))))

(assert (=> b!1072300 (= res!715271 (and (= (size!33584 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33585 _keys!1163) (size!33584 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072301 () Bool)

(assert (=> b!1072301 (= e!612433 (= lt!475193 (+!3203 lt!475200 lt!475198)))))

(assert (= (and start!94830 res!715274) b!1072300))

(assert (= (and b!1072300 res!715271) b!1072296))

(assert (= (and b!1072296 res!715276) b!1072297))

(assert (= (and b!1072297 res!715272) b!1072298))

(assert (= (and b!1072298 (not res!715273)) b!1072294))

(assert (= (and b!1072294 res!715275) b!1072301))

(assert (= (and b!1072299 condMapEmpty!40513) mapIsEmpty!40513))

(assert (= (and b!1072299 (not condMapEmpty!40513)) mapNonEmpty!40513))

(get-info :version)

(assert (= (and mapNonEmpty!40513 ((_ is ValueCellFull!12231) mapValue!40513)) b!1072295))

(assert (= (and b!1072299 ((_ is ValueCellFull!12231) mapDefault!40513)) b!1072293))

(assert (= start!94830 b!1072299))

(declare-fun m!991173 () Bool)

(assert (=> b!1072297 m!991173))

(declare-fun m!991175 () Bool)

(assert (=> b!1072296 m!991175))

(declare-fun m!991177 () Bool)

(assert (=> b!1072294 m!991177))

(declare-fun m!991179 () Bool)

(assert (=> b!1072294 m!991179))

(declare-fun m!991181 () Bool)

(assert (=> b!1072294 m!991181))

(declare-fun m!991183 () Bool)

(assert (=> b!1072294 m!991183))

(declare-fun m!991185 () Bool)

(assert (=> b!1072294 m!991185))

(declare-fun m!991187 () Bool)

(assert (=> b!1072294 m!991187))

(assert (=> b!1072294 m!991185))

(declare-fun m!991189 () Bool)

(assert (=> b!1072294 m!991189))

(declare-fun m!991191 () Bool)

(assert (=> b!1072294 m!991191))

(declare-fun m!991193 () Bool)

(assert (=> b!1072294 m!991193))

(declare-fun m!991195 () Bool)

(assert (=> b!1072294 m!991195))

(declare-fun m!991197 () Bool)

(assert (=> mapNonEmpty!40513 m!991197))

(declare-fun m!991199 () Bool)

(assert (=> b!1072301 m!991199))

(declare-fun m!991201 () Bool)

(assert (=> start!94830 m!991201))

(declare-fun m!991203 () Bool)

(assert (=> start!94830 m!991203))

(declare-fun m!991205 () Bool)

(assert (=> start!94830 m!991205))

(declare-fun m!991207 () Bool)

(assert (=> b!1072298 m!991207))

(declare-fun m!991209 () Bool)

(assert (=> b!1072298 m!991209))

(declare-fun m!991211 () Bool)

(assert (=> b!1072298 m!991211))

(check-sat (not b!1072301) (not b!1072294) (not b!1072298) (not b_next!22059) (not mapNonEmpty!40513) (not b!1072296) tp_is_empty!25869 (not b!1072297) (not start!94830) b_and!34901)
(check-sat b_and!34901 (not b_next!22059))
