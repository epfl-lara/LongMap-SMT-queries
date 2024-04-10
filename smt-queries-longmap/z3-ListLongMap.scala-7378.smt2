; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94010 () Bool)

(assert start!94010)

(declare-fun b_free!21447 () Bool)

(declare-fun b_next!21447 () Bool)

(assert (=> start!94010 (= b_free!21447 (not b_next!21447))))

(declare-fun tp!75770 () Bool)

(declare-fun b_and!34179 () Bool)

(assert (=> start!94010 (= tp!75770 b_and!34179)))

(declare-fun b!1063268 () Bool)

(declare-fun res!709939 () Bool)

(declare-fun e!605814 () Bool)

(assert (=> b!1063268 (=> (not res!709939) (not e!605814))))

(declare-datatypes ((array!67513 0))(
  ( (array!67514 (arr!32462 (Array (_ BitVec 32) (_ BitVec 64))) (size!32998 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67513)

(declare-datatypes ((List!22627 0))(
  ( (Nil!22624) (Cons!22623 (h!23832 (_ BitVec 64)) (t!31940 List!22627)) )
))
(declare-fun arrayNoDuplicates!0 (array!67513 (_ BitVec 32) List!22627) Bool)

(assert (=> b!1063268 (= res!709939 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22624))))

(declare-fun b!1063269 () Bool)

(declare-fun e!605812 () Bool)

(assert (=> b!1063269 (= e!605812 true)))

(declare-datatypes ((V!38811 0))(
  ( (V!38812 (val!12679 Int)) )
))
(declare-datatypes ((tuple2!16048 0))(
  ( (tuple2!16049 (_1!8035 (_ BitVec 64)) (_2!8035 V!38811)) )
))
(declare-datatypes ((List!22628 0))(
  ( (Nil!22625) (Cons!22624 (h!23833 tuple2!16048) (t!31941 List!22628)) )
))
(declare-datatypes ((ListLongMap!14017 0))(
  ( (ListLongMap!14018 (toList!7024 List!22628)) )
))
(declare-fun lt!468596 () ListLongMap!14017)

(declare-fun -!584 (ListLongMap!14017 (_ BitVec 64)) ListLongMap!14017)

(assert (=> b!1063269 (= (-!584 lt!468596 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468596)))

(declare-datatypes ((Unit!34846 0))(
  ( (Unit!34847) )
))
(declare-fun lt!468597 () Unit!34846)

(declare-fun removeNotPresentStillSame!31 (ListLongMap!14017 (_ BitVec 64)) Unit!34846)

(assert (=> b!1063269 (= lt!468597 (removeNotPresentStillSame!31 lt!468596 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063270 () Bool)

(declare-fun res!709940 () Bool)

(assert (=> b!1063270 (=> (not res!709940) (not e!605814))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67513 (_ BitVec 32)) Bool)

(assert (=> b!1063270 (= res!709940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063271 () Bool)

(declare-fun e!605810 () Bool)

(declare-fun tp_is_empty!25257 () Bool)

(assert (=> b!1063271 (= e!605810 tp_is_empty!25257)))

(declare-fun b!1063272 () Bool)

(declare-fun e!605811 () Bool)

(assert (=> b!1063272 (= e!605811 tp_is_empty!25257)))

(declare-fun mapNonEmpty!39562 () Bool)

(declare-fun mapRes!39562 () Bool)

(declare-fun tp!75769 () Bool)

(assert (=> mapNonEmpty!39562 (= mapRes!39562 (and tp!75769 e!605811))))

(declare-datatypes ((ValueCell!11925 0))(
  ( (ValueCellFull!11925 (v!15290 V!38811)) (EmptyCell!11925) )
))
(declare-datatypes ((array!67515 0))(
  ( (array!67516 (arr!32463 (Array (_ BitVec 32) ValueCell!11925)) (size!32999 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67515)

(declare-fun mapKey!39562 () (_ BitVec 32))

(declare-fun mapValue!39562 () ValueCell!11925)

(declare-fun mapRest!39562 () (Array (_ BitVec 32) ValueCell!11925))

(assert (=> mapNonEmpty!39562 (= (arr!32463 _values!955) (store mapRest!39562 mapKey!39562 mapValue!39562))))

(declare-fun b!1063273 () Bool)

(declare-fun res!709937 () Bool)

(assert (=> b!1063273 (=> (not res!709937) (not e!605814))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063273 (= res!709937 (and (= (size!32999 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32998 _keys!1163) (size!32999 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!709938 () Bool)

(assert (=> start!94010 (=> (not res!709938) (not e!605814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94010 (= res!709938 (validMask!0 mask!1515))))

(assert (=> start!94010 e!605814))

(assert (=> start!94010 true))

(assert (=> start!94010 tp_is_empty!25257))

(declare-fun e!605815 () Bool)

(declare-fun array_inv!25146 (array!67515) Bool)

(assert (=> start!94010 (and (array_inv!25146 _values!955) e!605815)))

(assert (=> start!94010 tp!75770))

(declare-fun array_inv!25147 (array!67513) Bool)

(assert (=> start!94010 (array_inv!25147 _keys!1163)))

(declare-fun b!1063274 () Bool)

(declare-fun e!605813 () Bool)

(assert (=> b!1063274 (= e!605814 (not e!605813))))

(declare-fun res!709941 () Bool)

(assert (=> b!1063274 (=> res!709941 e!605813)))

(assert (=> b!1063274 (= res!709941 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468600 () ListLongMap!14017)

(declare-fun lt!468599 () ListLongMap!14017)

(assert (=> b!1063274 (= lt!468600 lt!468599)))

(declare-fun zeroValueBefore!47 () V!38811)

(declare-fun minValue!907 () V!38811)

(declare-fun lt!468598 () Unit!34846)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38811)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!653 (array!67513 array!67515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38811 V!38811 V!38811 V!38811 (_ BitVec 32) Int) Unit!34846)

(assert (=> b!1063274 (= lt!468598 (lemmaNoChangeToArrayThenSameMapNoExtras!653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3616 (array!67513 array!67515 (_ BitVec 32) (_ BitVec 32) V!38811 V!38811 (_ BitVec 32) Int) ListLongMap!14017)

(assert (=> b!1063274 (= lt!468599 (getCurrentListMapNoExtraKeys!3616 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063274 (= lt!468600 (getCurrentListMapNoExtraKeys!3616 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063275 () Bool)

(assert (=> b!1063275 (= e!605813 e!605812)))

(declare-fun res!709936 () Bool)

(assert (=> b!1063275 (=> res!709936 e!605812)))

(declare-fun contains!6254 (ListLongMap!14017 (_ BitVec 64)) Bool)

(assert (=> b!1063275 (= res!709936 (contains!6254 lt!468596 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4006 (array!67513 array!67515 (_ BitVec 32) (_ BitVec 32) V!38811 V!38811 (_ BitVec 32) Int) ListLongMap!14017)

(assert (=> b!1063275 (= lt!468596 (getCurrentListMap!4006 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063276 () Bool)

(assert (=> b!1063276 (= e!605815 (and e!605810 mapRes!39562))))

(declare-fun condMapEmpty!39562 () Bool)

(declare-fun mapDefault!39562 () ValueCell!11925)

(assert (=> b!1063276 (= condMapEmpty!39562 (= (arr!32463 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11925)) mapDefault!39562)))))

(declare-fun mapIsEmpty!39562 () Bool)

(assert (=> mapIsEmpty!39562 mapRes!39562))

(assert (= (and start!94010 res!709938) b!1063273))

(assert (= (and b!1063273 res!709937) b!1063270))

(assert (= (and b!1063270 res!709940) b!1063268))

(assert (= (and b!1063268 res!709939) b!1063274))

(assert (= (and b!1063274 (not res!709941)) b!1063275))

(assert (= (and b!1063275 (not res!709936)) b!1063269))

(assert (= (and b!1063276 condMapEmpty!39562) mapIsEmpty!39562))

(assert (= (and b!1063276 (not condMapEmpty!39562)) mapNonEmpty!39562))

(get-info :version)

(assert (= (and mapNonEmpty!39562 ((_ is ValueCellFull!11925) mapValue!39562)) b!1063272))

(assert (= (and b!1063276 ((_ is ValueCellFull!11925) mapDefault!39562)) b!1063271))

(assert (= start!94010 b!1063276))

(declare-fun m!981965 () Bool)

(assert (=> b!1063269 m!981965))

(declare-fun m!981967 () Bool)

(assert (=> b!1063269 m!981967))

(declare-fun m!981969 () Bool)

(assert (=> start!94010 m!981969))

(declare-fun m!981971 () Bool)

(assert (=> start!94010 m!981971))

(declare-fun m!981973 () Bool)

(assert (=> start!94010 m!981973))

(declare-fun m!981975 () Bool)

(assert (=> b!1063268 m!981975))

(declare-fun m!981977 () Bool)

(assert (=> b!1063270 m!981977))

(declare-fun m!981979 () Bool)

(assert (=> b!1063274 m!981979))

(declare-fun m!981981 () Bool)

(assert (=> b!1063274 m!981981))

(declare-fun m!981983 () Bool)

(assert (=> b!1063274 m!981983))

(declare-fun m!981985 () Bool)

(assert (=> mapNonEmpty!39562 m!981985))

(declare-fun m!981987 () Bool)

(assert (=> b!1063275 m!981987))

(declare-fun m!981989 () Bool)

(assert (=> b!1063275 m!981989))

(check-sat (not start!94010) (not b!1063274) b_and!34179 tp_is_empty!25257 (not b!1063268) (not b_next!21447) (not mapNonEmpty!39562) (not b!1063270) (not b!1063275) (not b!1063269))
(check-sat b_and!34179 (not b_next!21447))
