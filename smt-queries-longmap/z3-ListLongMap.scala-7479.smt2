; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94824 () Bool)

(assert start!94824)

(declare-fun b_free!22053 () Bool)

(declare-fun b_next!22053 () Bool)

(assert (=> start!94824 (= b_free!22053 (not b_next!22053))))

(declare-fun tp!77621 () Bool)

(declare-fun b_and!34895 () Bool)

(assert (=> start!94824 (= tp!77621 b_and!34895)))

(declare-fun res!715219 () Bool)

(declare-fun e!612374 () Bool)

(assert (=> start!94824 (=> (not res!715219) (not e!612374))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94824 (= res!715219 (validMask!0 mask!1515))))

(assert (=> start!94824 e!612374))

(assert (=> start!94824 true))

(declare-fun tp_is_empty!25863 () Bool)

(assert (=> start!94824 tp_is_empty!25863))

(declare-datatypes ((V!39619 0))(
  ( (V!39620 (val!12982 Int)) )
))
(declare-datatypes ((ValueCell!12228 0))(
  ( (ValueCellFull!12228 (v!15599 V!39619)) (EmptyCell!12228) )
))
(declare-datatypes ((array!68697 0))(
  ( (array!68698 (arr!33043 (Array (_ BitVec 32) ValueCell!12228)) (size!33579 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68697)

(declare-fun e!612371 () Bool)

(declare-fun array_inv!25546 (array!68697) Bool)

(assert (=> start!94824 (and (array_inv!25546 _values!955) e!612371)))

(assert (=> start!94824 tp!77621))

(declare-datatypes ((array!68699 0))(
  ( (array!68700 (arr!33044 (Array (_ BitVec 32) (_ BitVec 64))) (size!33580 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68699)

(declare-fun array_inv!25547 (array!68699) Bool)

(assert (=> start!94824 (array_inv!25547 _keys!1163)))

(declare-fun b!1072212 () Bool)

(declare-fun e!612370 () Bool)

(assert (=> b!1072212 (= e!612370 tp_is_empty!25863)))

(declare-fun mapIsEmpty!40504 () Bool)

(declare-fun mapRes!40504 () Bool)

(assert (=> mapIsEmpty!40504 mapRes!40504))

(declare-fun b!1072213 () Bool)

(assert (=> b!1072213 (= e!612371 (and e!612370 mapRes!40504))))

(declare-fun condMapEmpty!40504 () Bool)

(declare-fun mapDefault!40504 () ValueCell!12228)

(assert (=> b!1072213 (= condMapEmpty!40504 (= (arr!33043 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12228)) mapDefault!40504)))))

(declare-fun b!1072214 () Bool)

(declare-fun e!612372 () Bool)

(assert (=> b!1072214 (= e!612372 true)))

(declare-datatypes ((tuple2!16534 0))(
  ( (tuple2!16535 (_1!8278 (_ BitVec 64)) (_2!8278 V!39619)) )
))
(declare-datatypes ((List!23067 0))(
  ( (Nil!23064) (Cons!23063 (h!24272 tuple2!16534) (t!32402 List!23067)) )
))
(declare-datatypes ((ListLongMap!14503 0))(
  ( (ListLongMap!14504 (toList!7267 List!23067)) )
))
(declare-fun lt!475074 () ListLongMap!14503)

(declare-fun lt!475081 () ListLongMap!14503)

(declare-fun -!696 (ListLongMap!14503 (_ BitVec 64)) ListLongMap!14503)

(assert (=> b!1072214 (= lt!475074 (-!696 lt!475081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475085 () ListLongMap!14503)

(declare-fun lt!475078 () ListLongMap!14503)

(assert (=> b!1072214 (= lt!475085 lt!475078)))

(declare-fun zeroValueBefore!47 () V!39619)

(declare-fun lt!475077 () ListLongMap!14503)

(declare-datatypes ((Unit!35328 0))(
  ( (Unit!35329) )
))
(declare-fun lt!475082 () Unit!35328)

(declare-fun minValue!907 () V!39619)

(declare-fun addCommutativeForDiffKeys!741 (ListLongMap!14503 (_ BitVec 64) V!39619 (_ BitVec 64) V!39619) Unit!35328)

(assert (=> b!1072214 (= lt!475082 (addCommutativeForDiffKeys!741 lt!475077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475079 () ListLongMap!14503)

(assert (=> b!1072214 (= (-!696 lt!475078 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475079)))

(declare-fun lt!475083 () tuple2!16534)

(declare-fun +!3201 (ListLongMap!14503 tuple2!16534) ListLongMap!14503)

(assert (=> b!1072214 (= lt!475078 (+!3201 lt!475079 lt!475083))))

(declare-fun lt!475080 () Unit!35328)

(declare-fun addThenRemoveForNewKeyIsSame!66 (ListLongMap!14503 (_ BitVec 64) V!39619) Unit!35328)

(assert (=> b!1072214 (= lt!475080 (addThenRemoveForNewKeyIsSame!66 lt!475079 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475075 () tuple2!16534)

(assert (=> b!1072214 (= lt!475079 (+!3201 lt!475077 lt!475075))))

(declare-fun e!612369 () Bool)

(assert (=> b!1072214 e!612369))

(declare-fun res!715222 () Bool)

(assert (=> b!1072214 (=> (not res!715222) (not e!612369))))

(assert (=> b!1072214 (= res!715222 (= lt!475081 lt!475085))))

(assert (=> b!1072214 (= lt!475085 (+!3201 (+!3201 lt!475077 lt!475083) lt!475075))))

(assert (=> b!1072214 (= lt!475075 (tuple2!16535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072214 (= lt!475083 (tuple2!16535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475086 () ListLongMap!14503)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39619)

(declare-fun getCurrentListMap!4162 (array!68699 array!68697 (_ BitVec 32) (_ BitVec 32) V!39619 V!39619 (_ BitVec 32) Int) ListLongMap!14503)

(assert (=> b!1072214 (= lt!475086 (getCurrentListMap!4162 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072214 (= lt!475081 (getCurrentListMap!4162 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072215 () Bool)

(assert (=> b!1072215 (= e!612374 (not e!612372))))

(declare-fun res!715217 () Bool)

(assert (=> b!1072215 (=> res!715217 e!612372)))

(assert (=> b!1072215 (= res!715217 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!475076 () ListLongMap!14503)

(assert (=> b!1072215 (= lt!475077 lt!475076)))

(declare-fun lt!475084 () Unit!35328)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!868 (array!68699 array!68697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39619 V!39619 V!39619 V!39619 (_ BitVec 32) Int) Unit!35328)

(assert (=> b!1072215 (= lt!475084 (lemmaNoChangeToArrayThenSameMapNoExtras!868 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3831 (array!68699 array!68697 (_ BitVec 32) (_ BitVec 32) V!39619 V!39619 (_ BitVec 32) Int) ListLongMap!14503)

(assert (=> b!1072215 (= lt!475076 (getCurrentListMapNoExtraKeys!3831 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072215 (= lt!475077 (getCurrentListMapNoExtraKeys!3831 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072216 () Bool)

(declare-fun e!612373 () Bool)

(assert (=> b!1072216 (= e!612373 tp_is_empty!25863)))

(declare-fun b!1072217 () Bool)

(declare-fun res!715218 () Bool)

(assert (=> b!1072217 (=> (not res!715218) (not e!612374))))

(declare-datatypes ((List!23068 0))(
  ( (Nil!23065) (Cons!23064 (h!24273 (_ BitVec 64)) (t!32403 List!23068)) )
))
(declare-fun arrayNoDuplicates!0 (array!68699 (_ BitVec 32) List!23068) Bool)

(assert (=> b!1072217 (= res!715218 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23065))))

(declare-fun b!1072218 () Bool)

(assert (=> b!1072218 (= e!612369 (= lt!475086 (+!3201 lt!475076 lt!475075)))))

(declare-fun mapNonEmpty!40504 () Bool)

(declare-fun tp!77620 () Bool)

(assert (=> mapNonEmpty!40504 (= mapRes!40504 (and tp!77620 e!612373))))

(declare-fun mapKey!40504 () (_ BitVec 32))

(declare-fun mapValue!40504 () ValueCell!12228)

(declare-fun mapRest!40504 () (Array (_ BitVec 32) ValueCell!12228))

(assert (=> mapNonEmpty!40504 (= (arr!33043 _values!955) (store mapRest!40504 mapKey!40504 mapValue!40504))))

(declare-fun b!1072219 () Bool)

(declare-fun res!715220 () Bool)

(assert (=> b!1072219 (=> (not res!715220) (not e!612374))))

(assert (=> b!1072219 (= res!715220 (and (= (size!33579 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33580 _keys!1163) (size!33579 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072220 () Bool)

(declare-fun res!715221 () Bool)

(assert (=> b!1072220 (=> (not res!715221) (not e!612374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68699 (_ BitVec 32)) Bool)

(assert (=> b!1072220 (= res!715221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94824 res!715219) b!1072219))

(assert (= (and b!1072219 res!715220) b!1072220))

(assert (= (and b!1072220 res!715221) b!1072217))

(assert (= (and b!1072217 res!715218) b!1072215))

(assert (= (and b!1072215 (not res!715217)) b!1072214))

(assert (= (and b!1072214 res!715222) b!1072218))

(assert (= (and b!1072213 condMapEmpty!40504) mapIsEmpty!40504))

(assert (= (and b!1072213 (not condMapEmpty!40504)) mapNonEmpty!40504))

(get-info :version)

(assert (= (and mapNonEmpty!40504 ((_ is ValueCellFull!12228) mapValue!40504)) b!1072216))

(assert (= (and b!1072213 ((_ is ValueCellFull!12228) mapDefault!40504)) b!1072212))

(assert (= start!94824 b!1072213))

(declare-fun m!991053 () Bool)

(assert (=> b!1072218 m!991053))

(declare-fun m!991055 () Bool)

(assert (=> start!94824 m!991055))

(declare-fun m!991057 () Bool)

(assert (=> start!94824 m!991057))

(declare-fun m!991059 () Bool)

(assert (=> start!94824 m!991059))

(declare-fun m!991061 () Bool)

(assert (=> b!1072214 m!991061))

(declare-fun m!991063 () Bool)

(assert (=> b!1072214 m!991063))

(declare-fun m!991065 () Bool)

(assert (=> b!1072214 m!991065))

(declare-fun m!991067 () Bool)

(assert (=> b!1072214 m!991067))

(declare-fun m!991069 () Bool)

(assert (=> b!1072214 m!991069))

(declare-fun m!991071 () Bool)

(assert (=> b!1072214 m!991071))

(declare-fun m!991073 () Bool)

(assert (=> b!1072214 m!991073))

(declare-fun m!991075 () Bool)

(assert (=> b!1072214 m!991075))

(assert (=> b!1072214 m!991075))

(declare-fun m!991077 () Bool)

(assert (=> b!1072214 m!991077))

(declare-fun m!991079 () Bool)

(assert (=> b!1072214 m!991079))

(declare-fun m!991081 () Bool)

(assert (=> b!1072217 m!991081))

(declare-fun m!991083 () Bool)

(assert (=> mapNonEmpty!40504 m!991083))

(declare-fun m!991085 () Bool)

(assert (=> b!1072220 m!991085))

(declare-fun m!991087 () Bool)

(assert (=> b!1072215 m!991087))

(declare-fun m!991089 () Bool)

(assert (=> b!1072215 m!991089))

(declare-fun m!991091 () Bool)

(assert (=> b!1072215 m!991091))

(check-sat (not b!1072218) (not b_next!22053) (not b!1072215) (not b!1072217) (not start!94824) (not mapNonEmpty!40504) b_and!34895 (not b!1072220) (not b!1072214) tp_is_empty!25863)
(check-sat b_and!34895 (not b_next!22053))
