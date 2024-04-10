; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94532 () Bool)

(assert start!94532)

(declare-fun b_free!21837 () Bool)

(declare-fun b_next!21837 () Bool)

(assert (=> start!94532 (= b_free!21837 (not b_next!21837))))

(declare-fun tp!76960 () Bool)

(declare-fun b_and!34639 () Bool)

(assert (=> start!94532 (= tp!76960 b_and!34639)))

(declare-fun b!1068957 () Bool)

(declare-fun e!609976 () Bool)

(declare-fun e!609973 () Bool)

(assert (=> b!1068957 (= e!609976 (not e!609973))))

(declare-fun res!713277 () Bool)

(assert (=> b!1068957 (=> res!713277 e!609973)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068957 (= res!713277 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39331 0))(
  ( (V!39332 (val!12874 Int)) )
))
(declare-datatypes ((tuple2!16358 0))(
  ( (tuple2!16359 (_1!8190 (_ BitVec 64)) (_2!8190 V!39331)) )
))
(declare-datatypes ((List!22905 0))(
  ( (Nil!22902) (Cons!22901 (h!24110 tuple2!16358) (t!32232 List!22905)) )
))
(declare-datatypes ((ListLongMap!14327 0))(
  ( (ListLongMap!14328 (toList!7179 List!22905)) )
))
(declare-fun lt!472316 () ListLongMap!14327)

(declare-fun lt!472312 () ListLongMap!14327)

(assert (=> b!1068957 (= lt!472316 lt!472312)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39331)

(declare-datatypes ((Unit!35155 0))(
  ( (Unit!35156) )
))
(declare-fun lt!472313 () Unit!35155)

(declare-datatypes ((ValueCell!12120 0))(
  ( (ValueCellFull!12120 (v!15489 V!39331)) (EmptyCell!12120) )
))
(declare-datatypes ((array!68271 0))(
  ( (array!68272 (arr!32834 (Array (_ BitVec 32) ValueCell!12120)) (size!33370 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68271)

(declare-fun minValue!907 () V!39331)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39331)

(declare-datatypes ((array!68273 0))(
  ( (array!68274 (arr!32835 (Array (_ BitVec 32) (_ BitVec 64))) (size!33371 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68273)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!792 (array!68273 array!68271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39331 V!39331 V!39331 V!39331 (_ BitVec 32) Int) Unit!35155)

(assert (=> b!1068957 (= lt!472313 (lemmaNoChangeToArrayThenSameMapNoExtras!792 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3755 (array!68273 array!68271 (_ BitVec 32) (_ BitVec 32) V!39331 V!39331 (_ BitVec 32) Int) ListLongMap!14327)

(assert (=> b!1068957 (= lt!472312 (getCurrentListMapNoExtraKeys!3755 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068957 (= lt!472316 (getCurrentListMapNoExtraKeys!3755 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068958 () Bool)

(declare-fun e!609977 () Bool)

(declare-fun tp_is_empty!25647 () Bool)

(assert (=> b!1068958 (= e!609977 tp_is_empty!25647)))

(declare-fun b!1068960 () Bool)

(declare-fun e!609974 () Bool)

(assert (=> b!1068960 (= e!609974 true)))

(declare-fun lt!472314 () ListLongMap!14327)

(declare-fun -!659 (ListLongMap!14327 (_ BitVec 64)) ListLongMap!14327)

(assert (=> b!1068960 (= (-!659 lt!472314 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472314)))

(declare-fun lt!472315 () Unit!35155)

(declare-fun removeNotPresentStillSame!69 (ListLongMap!14327 (_ BitVec 64)) Unit!35155)

(assert (=> b!1068960 (= lt!472315 (removeNotPresentStillSame!69 lt!472314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068961 () Bool)

(declare-fun res!713276 () Bool)

(assert (=> b!1068961 (=> (not res!713276) (not e!609976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68273 (_ BitVec 32)) Bool)

(assert (=> b!1068961 (= res!713276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068962 () Bool)

(declare-fun res!713278 () Bool)

(assert (=> b!1068962 (=> (not res!713278) (not e!609976))))

(assert (=> b!1068962 (= res!713278 (and (= (size!33370 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33371 _keys!1163) (size!33370 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40168 () Bool)

(declare-fun mapRes!40168 () Bool)

(declare-fun tp!76961 () Bool)

(assert (=> mapNonEmpty!40168 (= mapRes!40168 (and tp!76961 e!609977))))

(declare-fun mapValue!40168 () ValueCell!12120)

(declare-fun mapKey!40168 () (_ BitVec 32))

(declare-fun mapRest!40168 () (Array (_ BitVec 32) ValueCell!12120))

(assert (=> mapNonEmpty!40168 (= (arr!32834 _values!955) (store mapRest!40168 mapKey!40168 mapValue!40168))))

(declare-fun b!1068963 () Bool)

(declare-fun res!713281 () Bool)

(assert (=> b!1068963 (=> (not res!713281) (not e!609976))))

(declare-datatypes ((List!22906 0))(
  ( (Nil!22903) (Cons!22902 (h!24111 (_ BitVec 64)) (t!32233 List!22906)) )
))
(declare-fun arrayNoDuplicates!0 (array!68273 (_ BitVec 32) List!22906) Bool)

(assert (=> b!1068963 (= res!713281 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22903))))

(declare-fun b!1068964 () Bool)

(declare-fun e!609972 () Bool)

(declare-fun e!609975 () Bool)

(assert (=> b!1068964 (= e!609972 (and e!609975 mapRes!40168))))

(declare-fun condMapEmpty!40168 () Bool)

(declare-fun mapDefault!40168 () ValueCell!12120)

(assert (=> b!1068964 (= condMapEmpty!40168 (= (arr!32834 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12120)) mapDefault!40168)))))

(declare-fun res!713280 () Bool)

(assert (=> start!94532 (=> (not res!713280) (not e!609976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94532 (= res!713280 (validMask!0 mask!1515))))

(assert (=> start!94532 e!609976))

(assert (=> start!94532 true))

(assert (=> start!94532 tp_is_empty!25647))

(declare-fun array_inv!25414 (array!68271) Bool)

(assert (=> start!94532 (and (array_inv!25414 _values!955) e!609972)))

(assert (=> start!94532 tp!76960))

(declare-fun array_inv!25415 (array!68273) Bool)

(assert (=> start!94532 (array_inv!25415 _keys!1163)))

(declare-fun b!1068959 () Bool)

(assert (=> b!1068959 (= e!609973 e!609974)))

(declare-fun res!713279 () Bool)

(assert (=> b!1068959 (=> res!713279 e!609974)))

(declare-fun contains!6307 (ListLongMap!14327 (_ BitVec 64)) Bool)

(assert (=> b!1068959 (= res!713279 (contains!6307 lt!472314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4103 (array!68273 array!68271 (_ BitVec 32) (_ BitVec 32) V!39331 V!39331 (_ BitVec 32) Int) ListLongMap!14327)

(assert (=> b!1068959 (= lt!472314 (getCurrentListMap!4103 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068965 () Bool)

(assert (=> b!1068965 (= e!609975 tp_is_empty!25647)))

(declare-fun mapIsEmpty!40168 () Bool)

(assert (=> mapIsEmpty!40168 mapRes!40168))

(assert (= (and start!94532 res!713280) b!1068962))

(assert (= (and b!1068962 res!713278) b!1068961))

(assert (= (and b!1068961 res!713276) b!1068963))

(assert (= (and b!1068963 res!713281) b!1068957))

(assert (= (and b!1068957 (not res!713277)) b!1068959))

(assert (= (and b!1068959 (not res!713279)) b!1068960))

(assert (= (and b!1068964 condMapEmpty!40168) mapIsEmpty!40168))

(assert (= (and b!1068964 (not condMapEmpty!40168)) mapNonEmpty!40168))

(get-info :version)

(assert (= (and mapNonEmpty!40168 ((_ is ValueCellFull!12120) mapValue!40168)) b!1068958))

(assert (= (and b!1068964 ((_ is ValueCellFull!12120) mapDefault!40168)) b!1068965))

(assert (= start!94532 b!1068964))

(declare-fun m!987509 () Bool)

(assert (=> b!1068963 m!987509))

(declare-fun m!987511 () Bool)

(assert (=> b!1068957 m!987511))

(declare-fun m!987513 () Bool)

(assert (=> b!1068957 m!987513))

(declare-fun m!987515 () Bool)

(assert (=> b!1068957 m!987515))

(declare-fun m!987517 () Bool)

(assert (=> start!94532 m!987517))

(declare-fun m!987519 () Bool)

(assert (=> start!94532 m!987519))

(declare-fun m!987521 () Bool)

(assert (=> start!94532 m!987521))

(declare-fun m!987523 () Bool)

(assert (=> b!1068960 m!987523))

(declare-fun m!987525 () Bool)

(assert (=> b!1068960 m!987525))

(declare-fun m!987527 () Bool)

(assert (=> mapNonEmpty!40168 m!987527))

(declare-fun m!987529 () Bool)

(assert (=> b!1068961 m!987529))

(declare-fun m!987531 () Bool)

(assert (=> b!1068959 m!987531))

(declare-fun m!987533 () Bool)

(assert (=> b!1068959 m!987533))

(check-sat (not b!1068959) (not start!94532) (not b!1068961) (not b_next!21837) (not b!1068963) (not b!1068957) (not b!1068960) (not mapNonEmpty!40168) b_and!34639 tp_is_empty!25647)
(check-sat b_and!34639 (not b_next!21837))
