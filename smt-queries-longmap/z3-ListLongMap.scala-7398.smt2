; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94166 () Bool)

(assert start!94166)

(declare-fun b_free!21567 () Bool)

(declare-fun b_next!21567 () Bool)

(assert (=> start!94166 (= b_free!21567 (not b_next!21567))))

(declare-fun tp!76136 () Bool)

(declare-fun b_and!34317 () Bool)

(assert (=> start!94166 (= tp!76136 b_and!34317)))

(declare-fun mapIsEmpty!39748 () Bool)

(declare-fun mapRes!39748 () Bool)

(assert (=> mapIsEmpty!39748 mapRes!39748))

(declare-fun b!1064900 () Bool)

(declare-fun e!606999 () Bool)

(declare-fun tp_is_empty!25377 () Bool)

(assert (=> b!1064900 (= e!606999 tp_is_empty!25377)))

(declare-fun b!1064901 () Bool)

(declare-fun res!710880 () Bool)

(declare-fun e!606995 () Bool)

(assert (=> b!1064901 (=> (not res!710880) (not e!606995))))

(declare-datatypes ((array!67739 0))(
  ( (array!67740 (arr!32573 (Array (_ BitVec 32) (_ BitVec 64))) (size!33109 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67739)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67739 (_ BitVec 32)) Bool)

(assert (=> b!1064901 (= res!710880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064902 () Bool)

(declare-fun res!710878 () Bool)

(assert (=> b!1064902 (=> (not res!710878) (not e!606995))))

(declare-datatypes ((List!22708 0))(
  ( (Nil!22705) (Cons!22704 (h!23913 (_ BitVec 64)) (t!32025 List!22708)) )
))
(declare-fun arrayNoDuplicates!0 (array!67739 (_ BitVec 32) List!22708) Bool)

(assert (=> b!1064902 (= res!710878 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22705))))

(declare-fun b!1064903 () Bool)

(declare-fun res!710881 () Bool)

(assert (=> b!1064903 (=> (not res!710881) (not e!606995))))

(declare-datatypes ((V!38971 0))(
  ( (V!38972 (val!12739 Int)) )
))
(declare-datatypes ((ValueCell!11985 0))(
  ( (ValueCellFull!11985 (v!15351 V!38971)) (EmptyCell!11985) )
))
(declare-datatypes ((array!67741 0))(
  ( (array!67742 (arr!32574 (Array (_ BitVec 32) ValueCell!11985)) (size!33110 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67741)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064903 (= res!710881 (and (= (size!33110 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33109 _keys!1163) (size!33110 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064904 () Bool)

(declare-fun e!606998 () Bool)

(assert (=> b!1064904 (= e!606998 (and e!606999 mapRes!39748))))

(declare-fun condMapEmpty!39748 () Bool)

(declare-fun mapDefault!39748 () ValueCell!11985)

(assert (=> b!1064904 (= condMapEmpty!39748 (= (arr!32574 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11985)) mapDefault!39748)))))

(declare-fun b!1064905 () Bool)

(declare-fun e!606997 () Bool)

(assert (=> b!1064905 (= e!606997 tp_is_empty!25377)))

(declare-fun mapNonEmpty!39748 () Bool)

(declare-fun tp!76135 () Bool)

(assert (=> mapNonEmpty!39748 (= mapRes!39748 (and tp!76135 e!606997))))

(declare-fun mapValue!39748 () ValueCell!11985)

(declare-fun mapRest!39748 () (Array (_ BitVec 32) ValueCell!11985))

(declare-fun mapKey!39748 () (_ BitVec 32))

(assert (=> mapNonEmpty!39748 (= (arr!32574 _values!955) (store mapRest!39748 mapKey!39748 mapValue!39748))))

(declare-fun b!1064906 () Bool)

(declare-fun e!607000 () Bool)

(assert (=> b!1064906 (= e!606995 (not e!607000))))

(declare-fun res!710879 () Bool)

(assert (=> b!1064906 (=> res!710879 e!607000)))

(assert (=> b!1064906 (= res!710879 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16140 0))(
  ( (tuple2!16141 (_1!8081 (_ BitVec 64)) (_2!8081 V!38971)) )
))
(declare-datatypes ((List!22709 0))(
  ( (Nil!22706) (Cons!22705 (h!23914 tuple2!16140) (t!32026 List!22709)) )
))
(declare-datatypes ((ListLongMap!14109 0))(
  ( (ListLongMap!14110 (toList!7070 List!22709)) )
))
(declare-fun lt!469431 () ListLongMap!14109)

(declare-fun lt!469433 () ListLongMap!14109)

(assert (=> b!1064906 (= lt!469431 lt!469433)))

(declare-fun zeroValueBefore!47 () V!38971)

(declare-datatypes ((Unit!34934 0))(
  ( (Unit!34935) )
))
(declare-fun lt!469430 () Unit!34934)

(declare-fun minValue!907 () V!38971)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38971)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!696 (array!67739 array!67741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38971 V!38971 V!38971 V!38971 (_ BitVec 32) Int) Unit!34934)

(assert (=> b!1064906 (= lt!469430 (lemmaNoChangeToArrayThenSameMapNoExtras!696 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3659 (array!67739 array!67741 (_ BitVec 32) (_ BitVec 32) V!38971 V!38971 (_ BitVec 32) Int) ListLongMap!14109)

(assert (=> b!1064906 (= lt!469433 (getCurrentListMapNoExtraKeys!3659 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064906 (= lt!469431 (getCurrentListMapNoExtraKeys!3659 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064907 () Bool)

(assert (=> b!1064907 (= e!607000 true)))

(declare-fun lt!469432 () ListLongMap!14109)

(declare-fun getCurrentListMap!4030 (array!67739 array!67741 (_ BitVec 32) (_ BitVec 32) V!38971 V!38971 (_ BitVec 32) Int) ListLongMap!14109)

(assert (=> b!1064907 (= lt!469432 (getCurrentListMap!4030 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710882 () Bool)

(assert (=> start!94166 (=> (not res!710882) (not e!606995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94166 (= res!710882 (validMask!0 mask!1515))))

(assert (=> start!94166 e!606995))

(assert (=> start!94166 true))

(assert (=> start!94166 tp_is_empty!25377))

(declare-fun array_inv!25222 (array!67741) Bool)

(assert (=> start!94166 (and (array_inv!25222 _values!955) e!606998)))

(assert (=> start!94166 tp!76136))

(declare-fun array_inv!25223 (array!67739) Bool)

(assert (=> start!94166 (array_inv!25223 _keys!1163)))

(assert (= (and start!94166 res!710882) b!1064903))

(assert (= (and b!1064903 res!710881) b!1064901))

(assert (= (and b!1064901 res!710880) b!1064902))

(assert (= (and b!1064902 res!710878) b!1064906))

(assert (= (and b!1064906 (not res!710879)) b!1064907))

(assert (= (and b!1064904 condMapEmpty!39748) mapIsEmpty!39748))

(assert (= (and b!1064904 (not condMapEmpty!39748)) mapNonEmpty!39748))

(get-info :version)

(assert (= (and mapNonEmpty!39748 ((_ is ValueCellFull!11985) mapValue!39748)) b!1064905))

(assert (= (and b!1064904 ((_ is ValueCellFull!11985) mapDefault!39748)) b!1064900))

(assert (= start!94166 b!1064904))

(declare-fun m!983369 () Bool)

(assert (=> b!1064901 m!983369))

(declare-fun m!983371 () Bool)

(assert (=> b!1064902 m!983371))

(declare-fun m!983373 () Bool)

(assert (=> b!1064906 m!983373))

(declare-fun m!983375 () Bool)

(assert (=> b!1064906 m!983375))

(declare-fun m!983377 () Bool)

(assert (=> b!1064906 m!983377))

(declare-fun m!983379 () Bool)

(assert (=> mapNonEmpty!39748 m!983379))

(declare-fun m!983381 () Bool)

(assert (=> start!94166 m!983381))

(declare-fun m!983383 () Bool)

(assert (=> start!94166 m!983383))

(declare-fun m!983385 () Bool)

(assert (=> start!94166 m!983385))

(declare-fun m!983387 () Bool)

(assert (=> b!1064907 m!983387))

(check-sat b_and!34317 (not b!1064907) (not b!1064906) (not mapNonEmpty!39748) (not b_next!21567) (not start!94166) tp_is_empty!25377 (not b!1064902) (not b!1064901))
(check-sat b_and!34317 (not b_next!21567))
