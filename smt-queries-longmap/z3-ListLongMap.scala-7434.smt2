; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94690 () Bool)

(assert start!94690)

(declare-fun b_free!21781 () Bool)

(declare-fun b_next!21781 () Bool)

(assert (=> start!94690 (= b_free!21781 (not b_next!21781))))

(declare-fun tp!76790 () Bool)

(declare-fun b_and!34583 () Bool)

(assert (=> start!94690 (= tp!76790 b_and!34583)))

(declare-fun mapIsEmpty!40081 () Bool)

(declare-fun mapRes!40081 () Bool)

(assert (=> mapIsEmpty!40081 mapRes!40081))

(declare-fun b!1069372 () Bool)

(declare-fun res!713235 () Bool)

(declare-fun e!610144 () Bool)

(assert (=> b!1069372 (=> (not res!713235) (not e!610144))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39257 0))(
  ( (V!39258 (val!12846 Int)) )
))
(declare-datatypes ((ValueCell!12092 0))(
  ( (ValueCellFull!12092 (v!15456 V!39257)) (EmptyCell!12092) )
))
(declare-datatypes ((array!68209 0))(
  ( (array!68210 (arr!32798 (Array (_ BitVec 32) ValueCell!12092)) (size!33335 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68209)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68211 0))(
  ( (array!68212 (arr!32799 (Array (_ BitVec 32) (_ BitVec 64))) (size!33336 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68211)

(assert (=> b!1069372 (= res!713235 (and (= (size!33335 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33336 _keys!1163) (size!33335 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069373 () Bool)

(declare-fun e!610141 () Bool)

(assert (=> b!1069373 (= e!610141 true)))

(declare-datatypes ((tuple2!16288 0))(
  ( (tuple2!16289 (_1!8155 (_ BitVec 64)) (_2!8155 V!39257)) )
))
(declare-datatypes ((List!22857 0))(
  ( (Nil!22854) (Cons!22853 (h!24071 tuple2!16288) (t!32174 List!22857)) )
))
(declare-datatypes ((ListLongMap!14265 0))(
  ( (ListLongMap!14266 (toList!7148 List!22857)) )
))
(declare-fun lt!472285 () ListLongMap!14265)

(declare-fun -!634 (ListLongMap!14265 (_ BitVec 64)) ListLongMap!14265)

(assert (=> b!1069373 (= (-!634 lt!472285 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472285)))

(declare-datatypes ((Unit!35090 0))(
  ( (Unit!35091) )
))
(declare-fun lt!472286 () Unit!35090)

(declare-fun removeNotPresentStillSame!51 (ListLongMap!14265 (_ BitVec 64)) Unit!35090)

(assert (=> b!1069373 (= lt!472286 (removeNotPresentStillSame!51 lt!472285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069374 () Bool)

(declare-fun e!610142 () Bool)

(assert (=> b!1069374 (= e!610142 e!610141)))

(declare-fun res!713234 () Bool)

(assert (=> b!1069374 (=> res!713234 e!610141)))

(declare-fun contains!6309 (ListLongMap!14265 (_ BitVec 64)) Bool)

(assert (=> b!1069374 (= res!713234 (contains!6309 lt!472285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39257)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39257)

(declare-fun getCurrentListMap!4072 (array!68211 array!68209 (_ BitVec 32) (_ BitVec 32) V!39257 V!39257 (_ BitVec 32) Int) ListLongMap!14265)

(assert (=> b!1069374 (= lt!472285 (getCurrentListMap!4072 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069375 () Bool)

(declare-fun res!713237 () Bool)

(assert (=> b!1069375 (=> (not res!713237) (not e!610144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68211 (_ BitVec 32)) Bool)

(assert (=> b!1069375 (= res!713237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069376 () Bool)

(declare-fun e!610140 () Bool)

(declare-fun e!610143 () Bool)

(assert (=> b!1069376 (= e!610140 (and e!610143 mapRes!40081))))

(declare-fun condMapEmpty!40081 () Bool)

(declare-fun mapDefault!40081 () ValueCell!12092)

(assert (=> b!1069376 (= condMapEmpty!40081 (= (arr!32798 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12092)) mapDefault!40081)))))

(declare-fun b!1069377 () Bool)

(declare-fun tp_is_empty!25591 () Bool)

(assert (=> b!1069377 (= e!610143 tp_is_empty!25591)))

(declare-fun b!1069378 () Bool)

(declare-fun res!713238 () Bool)

(assert (=> b!1069378 (=> (not res!713238) (not e!610144))))

(declare-datatypes ((List!22858 0))(
  ( (Nil!22855) (Cons!22854 (h!24072 (_ BitVec 64)) (t!32175 List!22858)) )
))
(declare-fun arrayNoDuplicates!0 (array!68211 (_ BitVec 32) List!22858) Bool)

(assert (=> b!1069378 (= res!713238 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22855))))

(declare-fun res!713236 () Bool)

(assert (=> start!94690 (=> (not res!713236) (not e!610144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94690 (= res!713236 (validMask!0 mask!1515))))

(assert (=> start!94690 e!610144))

(assert (=> start!94690 true))

(assert (=> start!94690 tp_is_empty!25591))

(declare-fun array_inv!25410 (array!68209) Bool)

(assert (=> start!94690 (and (array_inv!25410 _values!955) e!610140)))

(assert (=> start!94690 tp!76790))

(declare-fun array_inv!25411 (array!68211) Bool)

(assert (=> start!94690 (array_inv!25411 _keys!1163)))

(declare-fun b!1069371 () Bool)

(declare-fun e!610139 () Bool)

(assert (=> b!1069371 (= e!610139 tp_is_empty!25591)))

(declare-fun mapNonEmpty!40081 () Bool)

(declare-fun tp!76789 () Bool)

(assert (=> mapNonEmpty!40081 (= mapRes!40081 (and tp!76789 e!610139))))

(declare-fun mapValue!40081 () ValueCell!12092)

(declare-fun mapRest!40081 () (Array (_ BitVec 32) ValueCell!12092))

(declare-fun mapKey!40081 () (_ BitVec 32))

(assert (=> mapNonEmpty!40081 (= (arr!32798 _values!955) (store mapRest!40081 mapKey!40081 mapValue!40081))))

(declare-fun b!1069379 () Bool)

(assert (=> b!1069379 (= e!610144 (not e!610142))))

(declare-fun res!713233 () Bool)

(assert (=> b!1069379 (=> res!713233 e!610142)))

(assert (=> b!1069379 (= res!713233 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472283 () ListLongMap!14265)

(declare-fun lt!472284 () ListLongMap!14265)

(assert (=> b!1069379 (= lt!472283 lt!472284)))

(declare-fun lt!472287 () Unit!35090)

(declare-fun zeroValueAfter!47 () V!39257)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!767 (array!68211 array!68209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39257 V!39257 V!39257 V!39257 (_ BitVec 32) Int) Unit!35090)

(assert (=> b!1069379 (= lt!472287 (lemmaNoChangeToArrayThenSameMapNoExtras!767 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3764 (array!68211 array!68209 (_ BitVec 32) (_ BitVec 32) V!39257 V!39257 (_ BitVec 32) Int) ListLongMap!14265)

(assert (=> b!1069379 (= lt!472284 (getCurrentListMapNoExtraKeys!3764 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069379 (= lt!472283 (getCurrentListMapNoExtraKeys!3764 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94690 res!713236) b!1069372))

(assert (= (and b!1069372 res!713235) b!1069375))

(assert (= (and b!1069375 res!713237) b!1069378))

(assert (= (and b!1069378 res!713238) b!1069379))

(assert (= (and b!1069379 (not res!713233)) b!1069374))

(assert (= (and b!1069374 (not res!713234)) b!1069373))

(assert (= (and b!1069376 condMapEmpty!40081) mapIsEmpty!40081))

(assert (= (and b!1069376 (not condMapEmpty!40081)) mapNonEmpty!40081))

(get-info :version)

(assert (= (and mapNonEmpty!40081 ((_ is ValueCellFull!12092) mapValue!40081)) b!1069371))

(assert (= (and b!1069376 ((_ is ValueCellFull!12092) mapDefault!40081)) b!1069377))

(assert (= start!94690 b!1069376))

(declare-fun m!988327 () Bool)

(assert (=> b!1069374 m!988327))

(declare-fun m!988329 () Bool)

(assert (=> b!1069374 m!988329))

(declare-fun m!988331 () Bool)

(assert (=> b!1069375 m!988331))

(declare-fun m!988333 () Bool)

(assert (=> b!1069378 m!988333))

(declare-fun m!988335 () Bool)

(assert (=> b!1069379 m!988335))

(declare-fun m!988337 () Bool)

(assert (=> b!1069379 m!988337))

(declare-fun m!988339 () Bool)

(assert (=> b!1069379 m!988339))

(declare-fun m!988341 () Bool)

(assert (=> b!1069373 m!988341))

(declare-fun m!988343 () Bool)

(assert (=> b!1069373 m!988343))

(declare-fun m!988345 () Bool)

(assert (=> start!94690 m!988345))

(declare-fun m!988347 () Bool)

(assert (=> start!94690 m!988347))

(declare-fun m!988349 () Bool)

(assert (=> start!94690 m!988349))

(declare-fun m!988351 () Bool)

(assert (=> mapNonEmpty!40081 m!988351))

(check-sat tp_is_empty!25591 (not mapNonEmpty!40081) (not b!1069378) (not b!1069373) (not b!1069379) (not b!1069374) (not start!94690) (not b_next!21781) b_and!34583 (not b!1069375))
(check-sat b_and!34583 (not b_next!21781))
