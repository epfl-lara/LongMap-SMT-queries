; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94716 () Bool)

(assert start!94716)

(declare-fun b_free!21969 () Bool)

(declare-fun b_next!21969 () Bool)

(assert (=> start!94716 (= b_free!21969 (not b_next!21969))))

(declare-fun tp!77365 () Bool)

(declare-fun b_and!34799 () Bool)

(assert (=> start!94716 (= tp!77365 b_and!34799)))

(declare-fun mapNonEmpty!40375 () Bool)

(declare-fun mapRes!40375 () Bool)

(declare-fun tp!77366 () Bool)

(declare-fun e!611368 () Bool)

(assert (=> mapNonEmpty!40375 (= mapRes!40375 (and tp!77366 e!611368))))

(declare-datatypes ((V!39507 0))(
  ( (V!39508 (val!12940 Int)) )
))
(declare-datatypes ((ValueCell!12186 0))(
  ( (ValueCellFull!12186 (v!15556 V!39507)) (EmptyCell!12186) )
))
(declare-fun mapValue!40375 () ValueCell!12186)

(declare-fun mapRest!40375 () (Array (_ BitVec 32) ValueCell!12186))

(declare-datatypes ((array!68535 0))(
  ( (array!68536 (arr!32963 (Array (_ BitVec 32) ValueCell!12186)) (size!33499 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68535)

(declare-fun mapKey!40375 () (_ BitVec 32))

(assert (=> mapNonEmpty!40375 (= (arr!32963 _values!955) (store mapRest!40375 mapKey!40375 mapValue!40375))))

(declare-fun mapIsEmpty!40375 () Bool)

(assert (=> mapIsEmpty!40375 mapRes!40375))

(declare-fun b!1070886 () Bool)

(declare-fun e!611363 () Bool)

(declare-fun e!611364 () Bool)

(assert (=> b!1070886 (= e!611363 (and e!611364 mapRes!40375))))

(declare-fun condMapEmpty!40375 () Bool)

(declare-fun mapDefault!40375 () ValueCell!12186)

(assert (=> b!1070886 (= condMapEmpty!40375 (= (arr!32963 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12186)) mapDefault!40375)))))

(declare-fun b!1070887 () Bool)

(declare-fun res!714373 () Bool)

(declare-fun e!611365 () Bool)

(assert (=> b!1070887 (=> (not res!714373) (not e!611365))))

(declare-datatypes ((array!68537 0))(
  ( (array!68538 (arr!32964 (Array (_ BitVec 32) (_ BitVec 64))) (size!33500 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68537)

(declare-datatypes ((List!23002 0))(
  ( (Nil!22999) (Cons!22998 (h!24207 (_ BitVec 64)) (t!32335 List!23002)) )
))
(declare-fun arrayNoDuplicates!0 (array!68537 (_ BitVec 32) List!23002) Bool)

(assert (=> b!1070887 (= res!714373 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22999))))

(declare-fun b!1070888 () Bool)

(declare-fun tp_is_empty!25779 () Bool)

(assert (=> b!1070888 (= e!611364 tp_is_empty!25779)))

(declare-fun res!714371 () Bool)

(assert (=> start!94716 (=> (not res!714371) (not e!611365))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94716 (= res!714371 (validMask!0 mask!1515))))

(assert (=> start!94716 e!611365))

(assert (=> start!94716 true))

(assert (=> start!94716 tp_is_empty!25779))

(declare-fun array_inv!25494 (array!68535) Bool)

(assert (=> start!94716 (and (array_inv!25494 _values!955) e!611363)))

(assert (=> start!94716 tp!77365))

(declare-fun array_inv!25495 (array!68537) Bool)

(assert (=> start!94716 (array_inv!25495 _keys!1163)))

(declare-fun b!1070889 () Bool)

(declare-fun e!611366 () Bool)

(assert (=> b!1070889 (= e!611365 (not e!611366))))

(declare-fun res!714376 () Bool)

(assert (=> b!1070889 (=> res!714376 e!611366)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070889 (= res!714376 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16460 0))(
  ( (tuple2!16461 (_1!8241 (_ BitVec 64)) (_2!8241 V!39507)) )
))
(declare-datatypes ((List!23003 0))(
  ( (Nil!23000) (Cons!22999 (h!24208 tuple2!16460) (t!32336 List!23003)) )
))
(declare-datatypes ((ListLongMap!14429 0))(
  ( (ListLongMap!14430 (toList!7230 List!23003)) )
))
(declare-fun lt!473344 () ListLongMap!14429)

(declare-fun lt!473342 () ListLongMap!14429)

(assert (=> b!1070889 (= lt!473344 lt!473342)))

(declare-fun zeroValueBefore!47 () V!39507)

(declare-datatypes ((Unit!35256 0))(
  ( (Unit!35257) )
))
(declare-fun lt!473345 () Unit!35256)

(declare-fun minValue!907 () V!39507)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39507)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!841 (array!68537 array!68535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39507 V!39507 V!39507 V!39507 (_ BitVec 32) Int) Unit!35256)

(assert (=> b!1070889 (= lt!473345 (lemmaNoChangeToArrayThenSameMapNoExtras!841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3804 (array!68537 array!68535 (_ BitVec 32) (_ BitVec 32) V!39507 V!39507 (_ BitVec 32) Int) ListLongMap!14429)

(assert (=> b!1070889 (= lt!473342 (getCurrentListMapNoExtraKeys!3804 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070889 (= lt!473344 (getCurrentListMapNoExtraKeys!3804 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070890 () Bool)

(declare-fun res!714375 () Bool)

(assert (=> b!1070890 (=> (not res!714375) (not e!611365))))

(assert (=> b!1070890 (= res!714375 (and (= (size!33499 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33500 _keys!1163) (size!33499 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070891 () Bool)

(declare-fun res!714372 () Bool)

(assert (=> b!1070891 (=> (not res!714372) (not e!611365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68537 (_ BitVec 32)) Bool)

(assert (=> b!1070891 (= res!714372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070892 () Bool)

(declare-fun lt!473339 () ListLongMap!14429)

(declare-fun e!611369 () Bool)

(declare-fun lt!473340 () tuple2!16460)

(declare-fun +!3165 (ListLongMap!14429 tuple2!16460) ListLongMap!14429)

(assert (=> b!1070892 (= e!611369 (= lt!473339 (+!3165 lt!473342 lt!473340)))))

(declare-fun b!1070893 () Bool)

(assert (=> b!1070893 (= e!611368 tp_is_empty!25779)))

(declare-fun b!1070894 () Bool)

(assert (=> b!1070894 (= e!611366 true)))

(declare-fun lt!473343 () Bool)

(declare-fun contains!6321 (ListLongMap!14429 (_ BitVec 64)) Bool)

(assert (=> b!1070894 (= lt!473343 (contains!6321 (+!3165 lt!473344 lt!473340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1070894 e!611369))

(declare-fun res!714374 () Bool)

(assert (=> b!1070894 (=> (not res!714374) (not e!611369))))

(declare-fun lt!473341 () ListLongMap!14429)

(assert (=> b!1070894 (= res!714374 (= lt!473341 (+!3165 (+!3165 lt!473344 (tuple2!16461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!473340)))))

(assert (=> b!1070894 (= lt!473340 (tuple2!16461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun getCurrentListMap!4133 (array!68537 array!68535 (_ BitVec 32) (_ BitVec 32) V!39507 V!39507 (_ BitVec 32) Int) ListLongMap!14429)

(assert (=> b!1070894 (= lt!473339 (getCurrentListMap!4133 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070894 (= lt!473341 (getCurrentListMap!4133 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94716 res!714371) b!1070890))

(assert (= (and b!1070890 res!714375) b!1070891))

(assert (= (and b!1070891 res!714372) b!1070887))

(assert (= (and b!1070887 res!714373) b!1070889))

(assert (= (and b!1070889 (not res!714376)) b!1070894))

(assert (= (and b!1070894 res!714374) b!1070892))

(assert (= (and b!1070886 condMapEmpty!40375) mapIsEmpty!40375))

(assert (= (and b!1070886 (not condMapEmpty!40375)) mapNonEmpty!40375))

(get-info :version)

(assert (= (and mapNonEmpty!40375 ((_ is ValueCellFull!12186) mapValue!40375)) b!1070893))

(assert (= (and b!1070886 ((_ is ValueCellFull!12186) mapDefault!40375)) b!1070888))

(assert (= start!94716 b!1070886))

(declare-fun m!989157 () Bool)

(assert (=> b!1070891 m!989157))

(declare-fun m!989159 () Bool)

(assert (=> start!94716 m!989159))

(declare-fun m!989161 () Bool)

(assert (=> start!94716 m!989161))

(declare-fun m!989163 () Bool)

(assert (=> start!94716 m!989163))

(declare-fun m!989165 () Bool)

(assert (=> mapNonEmpty!40375 m!989165))

(declare-fun m!989167 () Bool)

(assert (=> b!1070894 m!989167))

(assert (=> b!1070894 m!989167))

(declare-fun m!989169 () Bool)

(assert (=> b!1070894 m!989169))

(declare-fun m!989171 () Bool)

(assert (=> b!1070894 m!989171))

(declare-fun m!989173 () Bool)

(assert (=> b!1070894 m!989173))

(declare-fun m!989175 () Bool)

(assert (=> b!1070894 m!989175))

(assert (=> b!1070894 m!989173))

(declare-fun m!989177 () Bool)

(assert (=> b!1070894 m!989177))

(declare-fun m!989179 () Bool)

(assert (=> b!1070892 m!989179))

(declare-fun m!989181 () Bool)

(assert (=> b!1070887 m!989181))

(declare-fun m!989183 () Bool)

(assert (=> b!1070889 m!989183))

(declare-fun m!989185 () Bool)

(assert (=> b!1070889 m!989185))

(declare-fun m!989187 () Bool)

(assert (=> b!1070889 m!989187))

(check-sat (not b!1070891) (not b!1070889) tp_is_empty!25779 (not mapNonEmpty!40375) b_and!34799 (not b!1070892) (not b!1070894) (not start!94716) (not b!1070887) (not b_next!21969))
(check-sat b_and!34799 (not b_next!21969))
