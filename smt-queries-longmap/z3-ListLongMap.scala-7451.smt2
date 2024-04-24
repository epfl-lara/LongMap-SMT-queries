; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94836 () Bool)

(assert start!94836)

(declare-fun b_free!21883 () Bool)

(declare-fun b_next!21883 () Bool)

(assert (=> start!94836 (= b_free!21883 (not b_next!21883))))

(declare-fun tp!77102 () Bool)

(declare-fun b_and!34705 () Bool)

(assert (=> start!94836 (= tp!77102 b_and!34705)))

(declare-fun b!1070986 () Bool)

(declare-fun res!714200 () Bool)

(declare-fun e!611333 () Bool)

(assert (=> b!1070986 (=> (not res!714200) (not e!611333))))

(declare-datatypes ((array!68401 0))(
  ( (array!68402 (arr!32892 (Array (_ BitVec 32) (_ BitVec 64))) (size!33429 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68401)

(declare-datatypes ((List!22930 0))(
  ( (Nil!22927) (Cons!22926 (h!24144 (_ BitVec 64)) (t!32251 List!22930)) )
))
(declare-fun arrayNoDuplicates!0 (array!68401 (_ BitVec 32) List!22930) Bool)

(assert (=> b!1070986 (= res!714200 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22927))))

(declare-fun mapNonEmpty!40240 () Bool)

(declare-fun mapRes!40240 () Bool)

(declare-fun tp!77101 () Bool)

(declare-fun e!611334 () Bool)

(assert (=> mapNonEmpty!40240 (= mapRes!40240 (and tp!77101 e!611334))))

(declare-fun mapKey!40240 () (_ BitVec 32))

(declare-datatypes ((V!39393 0))(
  ( (V!39394 (val!12897 Int)) )
))
(declare-datatypes ((ValueCell!12143 0))(
  ( (ValueCellFull!12143 (v!15509 V!39393)) (EmptyCell!12143) )
))
(declare-datatypes ((array!68403 0))(
  ( (array!68404 (arr!32893 (Array (_ BitVec 32) ValueCell!12143)) (size!33430 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68403)

(declare-fun mapRest!40240 () (Array (_ BitVec 32) ValueCell!12143))

(declare-fun mapValue!40240 () ValueCell!12143)

(assert (=> mapNonEmpty!40240 (= (arr!32893 _values!955) (store mapRest!40240 mapKey!40240 mapValue!40240))))

(declare-fun res!714198 () Bool)

(assert (=> start!94836 (=> (not res!714198) (not e!611333))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94836 (= res!714198 (validMask!0 mask!1515))))

(assert (=> start!94836 e!611333))

(assert (=> start!94836 true))

(declare-fun tp_is_empty!25693 () Bool)

(assert (=> start!94836 tp_is_empty!25693))

(declare-fun e!611335 () Bool)

(declare-fun array_inv!25476 (array!68403) Bool)

(assert (=> start!94836 (and (array_inv!25476 _values!955) e!611335)))

(assert (=> start!94836 tp!77102))

(declare-fun array_inv!25477 (array!68401) Bool)

(assert (=> start!94836 (array_inv!25477 _keys!1163)))

(declare-fun b!1070987 () Bool)

(assert (=> b!1070987 (= e!611333 (not true))))

(declare-datatypes ((tuple2!16364 0))(
  ( (tuple2!16365 (_1!8193 (_ BitVec 64)) (_2!8193 V!39393)) )
))
(declare-datatypes ((List!22931 0))(
  ( (Nil!22928) (Cons!22927 (h!24145 tuple2!16364) (t!32252 List!22931)) )
))
(declare-datatypes ((ListLongMap!14341 0))(
  ( (ListLongMap!14342 (toList!7186 List!22931)) )
))
(declare-fun lt!473222 () ListLongMap!14341)

(declare-fun lt!473220 () ListLongMap!14341)

(assert (=> b!1070987 (= lt!473222 lt!473220)))

(declare-datatypes ((Unit!35166 0))(
  ( (Unit!35167) )
))
(declare-fun lt!473221 () Unit!35166)

(declare-fun zeroValueBefore!47 () V!39393)

(declare-fun minValue!907 () V!39393)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39393)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!801 (array!68401 array!68403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39393 V!39393 V!39393 V!39393 (_ BitVec 32) Int) Unit!35166)

(assert (=> b!1070987 (= lt!473221 (lemmaNoChangeToArrayThenSameMapNoExtras!801 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3798 (array!68401 array!68403 (_ BitVec 32) (_ BitVec 32) V!39393 V!39393 (_ BitVec 32) Int) ListLongMap!14341)

(assert (=> b!1070987 (= lt!473220 (getCurrentListMapNoExtraKeys!3798 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070987 (= lt!473222 (getCurrentListMapNoExtraKeys!3798 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070988 () Bool)

(declare-fun res!714199 () Bool)

(assert (=> b!1070988 (=> (not res!714199) (not e!611333))))

(assert (=> b!1070988 (= res!714199 (and (= (size!33430 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33429 _keys!1163) (size!33430 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40240 () Bool)

(assert (=> mapIsEmpty!40240 mapRes!40240))

(declare-fun b!1070989 () Bool)

(declare-fun e!611337 () Bool)

(assert (=> b!1070989 (= e!611335 (and e!611337 mapRes!40240))))

(declare-fun condMapEmpty!40240 () Bool)

(declare-fun mapDefault!40240 () ValueCell!12143)

(assert (=> b!1070989 (= condMapEmpty!40240 (= (arr!32893 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12143)) mapDefault!40240)))))

(declare-fun b!1070990 () Bool)

(declare-fun res!714197 () Bool)

(assert (=> b!1070990 (=> (not res!714197) (not e!611333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68401 (_ BitVec 32)) Bool)

(assert (=> b!1070990 (= res!714197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070991 () Bool)

(assert (=> b!1070991 (= e!611334 tp_is_empty!25693)))

(declare-fun b!1070992 () Bool)

(assert (=> b!1070992 (= e!611337 tp_is_empty!25693)))

(assert (= (and start!94836 res!714198) b!1070988))

(assert (= (and b!1070988 res!714199) b!1070990))

(assert (= (and b!1070990 res!714197) b!1070986))

(assert (= (and b!1070986 res!714200) b!1070987))

(assert (= (and b!1070989 condMapEmpty!40240) mapIsEmpty!40240))

(assert (= (and b!1070989 (not condMapEmpty!40240)) mapNonEmpty!40240))

(get-info :version)

(assert (= (and mapNonEmpty!40240 ((_ is ValueCellFull!12143) mapValue!40240)) b!1070991))

(assert (= (and b!1070989 ((_ is ValueCellFull!12143) mapDefault!40240)) b!1070992))

(assert (= start!94836 b!1070989))

(declare-fun m!989809 () Bool)

(assert (=> b!1070990 m!989809))

(declare-fun m!989811 () Bool)

(assert (=> mapNonEmpty!40240 m!989811))

(declare-fun m!989813 () Bool)

(assert (=> b!1070987 m!989813))

(declare-fun m!989815 () Bool)

(assert (=> b!1070987 m!989815))

(declare-fun m!989817 () Bool)

(assert (=> b!1070987 m!989817))

(declare-fun m!989819 () Bool)

(assert (=> b!1070986 m!989819))

(declare-fun m!989821 () Bool)

(assert (=> start!94836 m!989821))

(declare-fun m!989823 () Bool)

(assert (=> start!94836 m!989823))

(declare-fun m!989825 () Bool)

(assert (=> start!94836 m!989825))

(check-sat tp_is_empty!25693 (not b!1070986) (not b_next!21883) (not start!94836) (not mapNonEmpty!40240) b_and!34705 (not b!1070990) (not b!1070987))
(check-sat b_and!34705 (not b_next!21883))
