; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94570 () Bool)

(assert start!94570)

(declare-fun b_free!21859 () Bool)

(declare-fun b_next!21859 () Bool)

(assert (=> start!94570 (= b_free!21859 (not b_next!21859))))

(declare-fun tp!77030 () Bool)

(declare-fun b_and!34645 () Bool)

(assert (=> start!94570 (= tp!77030 b_and!34645)))

(declare-fun res!713464 () Bool)

(declare-fun e!610208 () Bool)

(assert (=> start!94570 (=> (not res!713464) (not e!610208))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94570 (= res!713464 (validMask!0 mask!1515))))

(assert (=> start!94570 e!610208))

(assert (=> start!94570 true))

(declare-fun tp_is_empty!25669 () Bool)

(assert (=> start!94570 tp_is_empty!25669))

(declare-datatypes ((V!39361 0))(
  ( (V!39362 (val!12885 Int)) )
))
(declare-datatypes ((ValueCell!12131 0))(
  ( (ValueCellFull!12131 (v!15500 V!39361)) (EmptyCell!12131) )
))
(declare-datatypes ((array!68260 0))(
  ( (array!68261 (arr!32828 (Array (_ BitVec 32) ValueCell!12131)) (size!33366 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68260)

(declare-fun e!610205 () Bool)

(declare-fun array_inv!25408 (array!68260) Bool)

(assert (=> start!94570 (and (array_inv!25408 _values!955) e!610205)))

(assert (=> start!94570 tp!77030))

(declare-datatypes ((array!68262 0))(
  ( (array!68263 (arr!32829 (Array (_ BitVec 32) (_ BitVec 64))) (size!33367 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68262)

(declare-fun array_inv!25409 (array!68262) Bool)

(assert (=> start!94570 (array_inv!25409 _keys!1163)))

(declare-fun b!1069254 () Bool)

(declare-fun e!610207 () Bool)

(assert (=> b!1069254 (= e!610207 tp_is_empty!25669)))

(declare-fun b!1069255 () Bool)

(declare-fun e!610209 () Bool)

(assert (=> b!1069255 (= e!610209 tp_is_empty!25669)))

(declare-fun b!1069256 () Bool)

(declare-fun res!713463 () Bool)

(assert (=> b!1069256 (=> (not res!713463) (not e!610208))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069256 (= res!713463 (and (= (size!33366 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33367 _keys!1163) (size!33366 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069257 () Bool)

(declare-fun res!713462 () Bool)

(assert (=> b!1069257 (=> (not res!713462) (not e!610208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68262 (_ BitVec 32)) Bool)

(assert (=> b!1069257 (= res!713462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069258 () Bool)

(declare-fun mapRes!40204 () Bool)

(assert (=> b!1069258 (= e!610205 (and e!610209 mapRes!40204))))

(declare-fun condMapEmpty!40204 () Bool)

(declare-fun mapDefault!40204 () ValueCell!12131)

(assert (=> b!1069258 (= condMapEmpty!40204 (= (arr!32828 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12131)) mapDefault!40204)))))

(declare-fun b!1069259 () Bool)

(declare-fun res!713465 () Bool)

(assert (=> b!1069259 (=> (not res!713465) (not e!610208))))

(declare-datatypes ((List!22964 0))(
  ( (Nil!22961) (Cons!22960 (h!24169 (_ BitVec 64)) (t!32284 List!22964)) )
))
(declare-fun arrayNoDuplicates!0 (array!68262 (_ BitVec 32) List!22964) Bool)

(assert (=> b!1069259 (= res!713465 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22961))))

(declare-fun mapIsEmpty!40204 () Bool)

(assert (=> mapIsEmpty!40204 mapRes!40204))

(declare-fun mapNonEmpty!40204 () Bool)

(declare-fun tp!77029 () Bool)

(assert (=> mapNonEmpty!40204 (= mapRes!40204 (and tp!77029 e!610207))))

(declare-fun mapKey!40204 () (_ BitVec 32))

(declare-fun mapRest!40204 () (Array (_ BitVec 32) ValueCell!12131))

(declare-fun mapValue!40204 () ValueCell!12131)

(assert (=> mapNonEmpty!40204 (= (arr!32828 _values!955) (store mapRest!40204 mapKey!40204 mapValue!40204))))

(declare-fun b!1069260 () Bool)

(assert (=> b!1069260 (= e!610208 (not true))))

(declare-datatypes ((tuple2!16432 0))(
  ( (tuple2!16433 (_1!8227 (_ BitVec 64)) (_2!8227 V!39361)) )
))
(declare-datatypes ((List!22965 0))(
  ( (Nil!22962) (Cons!22961 (h!24170 tuple2!16432) (t!32285 List!22965)) )
))
(declare-datatypes ((ListLongMap!14401 0))(
  ( (ListLongMap!14402 (toList!7216 List!22965)) )
))
(declare-fun lt!472398 () ListLongMap!14401)

(declare-fun lt!472397 () ListLongMap!14401)

(assert (=> b!1069260 (= lt!472398 lt!472397)))

(declare-fun zeroValueBefore!47 () V!39361)

(declare-datatypes ((Unit!35020 0))(
  ( (Unit!35021) )
))
(declare-fun lt!472399 () Unit!35020)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39361)

(declare-fun minValue!907 () V!39361)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!799 (array!68262 array!68260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39361 V!39361 V!39361 V!39361 (_ BitVec 32) Int) Unit!35020)

(assert (=> b!1069260 (= lt!472399 (lemmaNoChangeToArrayThenSameMapNoExtras!799 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3805 (array!68262 array!68260 (_ BitVec 32) (_ BitVec 32) V!39361 V!39361 (_ BitVec 32) Int) ListLongMap!14401)

(assert (=> b!1069260 (= lt!472397 (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069260 (= lt!472398 (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94570 res!713464) b!1069256))

(assert (= (and b!1069256 res!713463) b!1069257))

(assert (= (and b!1069257 res!713462) b!1069259))

(assert (= (and b!1069259 res!713465) b!1069260))

(assert (= (and b!1069258 condMapEmpty!40204) mapIsEmpty!40204))

(assert (= (and b!1069258 (not condMapEmpty!40204)) mapNonEmpty!40204))

(get-info :version)

(assert (= (and mapNonEmpty!40204 ((_ is ValueCellFull!12131) mapValue!40204)) b!1069254))

(assert (= (and b!1069258 ((_ is ValueCellFull!12131) mapDefault!40204)) b!1069255))

(assert (= start!94570 b!1069258))

(declare-fun m!987295 () Bool)

(assert (=> b!1069260 m!987295))

(declare-fun m!987297 () Bool)

(assert (=> b!1069260 m!987297))

(declare-fun m!987299 () Bool)

(assert (=> b!1069260 m!987299))

(declare-fun m!987301 () Bool)

(assert (=> b!1069259 m!987301))

(declare-fun m!987303 () Bool)

(assert (=> b!1069257 m!987303))

(declare-fun m!987305 () Bool)

(assert (=> mapNonEmpty!40204 m!987305))

(declare-fun m!987307 () Bool)

(assert (=> start!94570 m!987307))

(declare-fun m!987309 () Bool)

(assert (=> start!94570 m!987309))

(declare-fun m!987311 () Bool)

(assert (=> start!94570 m!987311))

(check-sat tp_is_empty!25669 (not start!94570) b_and!34645 (not b_next!21859) (not b!1069259) (not b!1069260) (not b!1069257) (not mapNonEmpty!40204))
(check-sat b_and!34645 (not b_next!21859))
