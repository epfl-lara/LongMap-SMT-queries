; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94824 () Bool)

(assert start!94824)

(declare-fun b_free!21871 () Bool)

(declare-fun b_next!21871 () Bool)

(assert (=> start!94824 (= b_free!21871 (not b_next!21871))))

(declare-fun tp!77065 () Bool)

(declare-fun b_and!34693 () Bool)

(assert (=> start!94824 (= tp!77065 b_and!34693)))

(declare-fun b!1070860 () Bool)

(declare-fun res!714126 () Bool)

(declare-fun e!611247 () Bool)

(assert (=> b!1070860 (=> (not res!714126) (not e!611247))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39377 0))(
  ( (V!39378 (val!12891 Int)) )
))
(declare-datatypes ((ValueCell!12137 0))(
  ( (ValueCellFull!12137 (v!15503 V!39377)) (EmptyCell!12137) )
))
(declare-datatypes ((array!68379 0))(
  ( (array!68380 (arr!32881 (Array (_ BitVec 32) ValueCell!12137)) (size!33418 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68379)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68381 0))(
  ( (array!68382 (arr!32882 (Array (_ BitVec 32) (_ BitVec 64))) (size!33419 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68381)

(assert (=> b!1070860 (= res!714126 (and (= (size!33418 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33419 _keys!1163) (size!33418 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070861 () Bool)

(declare-fun e!611243 () Bool)

(declare-fun tp_is_empty!25681 () Bool)

(assert (=> b!1070861 (= e!611243 tp_is_empty!25681)))

(declare-fun res!714127 () Bool)

(assert (=> start!94824 (=> (not res!714127) (not e!611247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94824 (= res!714127 (validMask!0 mask!1515))))

(assert (=> start!94824 e!611247))

(assert (=> start!94824 true))

(assert (=> start!94824 tp_is_empty!25681))

(declare-fun e!611246 () Bool)

(declare-fun array_inv!25470 (array!68379) Bool)

(assert (=> start!94824 (and (array_inv!25470 _values!955) e!611246)))

(assert (=> start!94824 tp!77065))

(declare-fun array_inv!25471 (array!68381) Bool)

(assert (=> start!94824 (array_inv!25471 _keys!1163)))

(declare-fun mapIsEmpty!40222 () Bool)

(declare-fun mapRes!40222 () Bool)

(assert (=> mapIsEmpty!40222 mapRes!40222))

(declare-fun mapNonEmpty!40222 () Bool)

(declare-fun tp!77066 () Bool)

(assert (=> mapNonEmpty!40222 (= mapRes!40222 (and tp!77066 e!611243))))

(declare-fun mapKey!40222 () (_ BitVec 32))

(declare-fun mapRest!40222 () (Array (_ BitVec 32) ValueCell!12137))

(declare-fun mapValue!40222 () ValueCell!12137)

(assert (=> mapNonEmpty!40222 (= (arr!32881 _values!955) (store mapRest!40222 mapKey!40222 mapValue!40222))))

(declare-fun b!1070862 () Bool)

(declare-fun e!611244 () Bool)

(assert (=> b!1070862 (= e!611246 (and e!611244 mapRes!40222))))

(declare-fun condMapEmpty!40222 () Bool)

(declare-fun mapDefault!40222 () ValueCell!12137)

(assert (=> b!1070862 (= condMapEmpty!40222 (= (arr!32881 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12137)) mapDefault!40222)))))

(declare-fun b!1070863 () Bool)

(declare-fun res!714128 () Bool)

(assert (=> b!1070863 (=> (not res!714128) (not e!611247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68381 (_ BitVec 32)) Bool)

(assert (=> b!1070863 (= res!714128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070864 () Bool)

(assert (=> b!1070864 (= e!611247 (not true))))

(declare-datatypes ((tuple2!16360 0))(
  ( (tuple2!16361 (_1!8191 (_ BitVec 64)) (_2!8191 V!39377)) )
))
(declare-datatypes ((List!22924 0))(
  ( (Nil!22921) (Cons!22920 (h!24138 tuple2!16360) (t!32245 List!22924)) )
))
(declare-datatypes ((ListLongMap!14337 0))(
  ( (ListLongMap!14338 (toList!7184 List!22924)) )
))
(declare-fun lt!473166 () ListLongMap!14337)

(declare-fun lt!473168 () ListLongMap!14337)

(assert (=> b!1070864 (= lt!473166 lt!473168)))

(declare-fun zeroValueBefore!47 () V!39377)

(declare-datatypes ((Unit!35162 0))(
  ( (Unit!35163) )
))
(declare-fun lt!473167 () Unit!35162)

(declare-fun minValue!907 () V!39377)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39377)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!799 (array!68381 array!68379 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39377 V!39377 V!39377 V!39377 (_ BitVec 32) Int) Unit!35162)

(assert (=> b!1070864 (= lt!473167 (lemmaNoChangeToArrayThenSameMapNoExtras!799 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3796 (array!68381 array!68379 (_ BitVec 32) (_ BitVec 32) V!39377 V!39377 (_ BitVec 32) Int) ListLongMap!14337)

(assert (=> b!1070864 (= lt!473168 (getCurrentListMapNoExtraKeys!3796 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070864 (= lt!473166 (getCurrentListMapNoExtraKeys!3796 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070865 () Bool)

(assert (=> b!1070865 (= e!611244 tp_is_empty!25681)))

(declare-fun b!1070866 () Bool)

(declare-fun res!714125 () Bool)

(assert (=> b!1070866 (=> (not res!714125) (not e!611247))))

(declare-datatypes ((List!22925 0))(
  ( (Nil!22922) (Cons!22921 (h!24139 (_ BitVec 64)) (t!32246 List!22925)) )
))
(declare-fun arrayNoDuplicates!0 (array!68381 (_ BitVec 32) List!22925) Bool)

(assert (=> b!1070866 (= res!714125 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22922))))

(assert (= (and start!94824 res!714127) b!1070860))

(assert (= (and b!1070860 res!714126) b!1070863))

(assert (= (and b!1070863 res!714128) b!1070866))

(assert (= (and b!1070866 res!714125) b!1070864))

(assert (= (and b!1070862 condMapEmpty!40222) mapIsEmpty!40222))

(assert (= (and b!1070862 (not condMapEmpty!40222)) mapNonEmpty!40222))

(get-info :version)

(assert (= (and mapNonEmpty!40222 ((_ is ValueCellFull!12137) mapValue!40222)) b!1070861))

(assert (= (and b!1070862 ((_ is ValueCellFull!12137) mapDefault!40222)) b!1070865))

(assert (= start!94824 b!1070862))

(declare-fun m!989701 () Bool)

(assert (=> b!1070863 m!989701))

(declare-fun m!989703 () Bool)

(assert (=> b!1070864 m!989703))

(declare-fun m!989705 () Bool)

(assert (=> b!1070864 m!989705))

(declare-fun m!989707 () Bool)

(assert (=> b!1070864 m!989707))

(declare-fun m!989709 () Bool)

(assert (=> start!94824 m!989709))

(declare-fun m!989711 () Bool)

(assert (=> start!94824 m!989711))

(declare-fun m!989713 () Bool)

(assert (=> start!94824 m!989713))

(declare-fun m!989715 () Bool)

(assert (=> b!1070866 m!989715))

(declare-fun m!989717 () Bool)

(assert (=> mapNonEmpty!40222 m!989717))

(check-sat (not b_next!21871) (not b!1070864) (not start!94824) b_and!34693 tp_is_empty!25681 (not b!1070863) (not b!1070866) (not mapNonEmpty!40222))
(check-sat b_and!34693 (not b_next!21871))
