; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94586 () Bool)

(assert start!94586)

(declare-fun b_free!21691 () Bool)

(declare-fun b_next!21691 () Bool)

(assert (=> start!94586 (= b_free!21691 (not b_next!21691))))

(declare-fun tp!76516 () Bool)

(declare-fun b_and!34485 () Bool)

(assert (=> start!94586 (= tp!76516 b_and!34485)))

(declare-fun res!712562 () Bool)

(declare-fun e!609309 () Bool)

(assert (=> start!94586 (=> (not res!712562) (not e!609309))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94586 (= res!712562 (validMask!0 mask!1515))))

(assert (=> start!94586 e!609309))

(assert (=> start!94586 true))

(declare-fun tp_is_empty!25501 () Bool)

(assert (=> start!94586 tp_is_empty!25501))

(declare-datatypes ((V!39137 0))(
  ( (V!39138 (val!12801 Int)) )
))
(declare-datatypes ((ValueCell!12047 0))(
  ( (ValueCellFull!12047 (v!15411 V!39137)) (EmptyCell!12047) )
))
(declare-datatypes ((array!68031 0))(
  ( (array!68032 (arr!32710 (Array (_ BitVec 32) ValueCell!12047)) (size!33247 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68031)

(declare-fun e!609306 () Bool)

(declare-fun array_inv!25346 (array!68031) Bool)

(assert (=> start!94586 (and (array_inv!25346 _values!955) e!609306)))

(assert (=> start!94586 tp!76516))

(declare-datatypes ((array!68033 0))(
  ( (array!68034 (arr!32711 (Array (_ BitVec 32) (_ BitVec 64))) (size!33248 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68033)

(declare-fun array_inv!25347 (array!68033) Bool)

(assert (=> start!94586 (array_inv!25347 _keys!1163)))

(declare-fun b!1068238 () Bool)

(declare-fun e!609308 () Bool)

(assert (=> b!1068238 (= e!609308 tp_is_empty!25501)))

(declare-fun b!1068239 () Bool)

(declare-fun res!712561 () Bool)

(assert (=> b!1068239 (=> (not res!712561) (not e!609309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68033 (_ BitVec 32)) Bool)

(assert (=> b!1068239 (= res!712561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068240 () Bool)

(declare-fun e!609307 () Bool)

(assert (=> b!1068240 (= e!609307 tp_is_empty!25501)))

(declare-fun mapNonEmpty!39943 () Bool)

(declare-fun mapRes!39943 () Bool)

(declare-fun tp!76517 () Bool)

(assert (=> mapNonEmpty!39943 (= mapRes!39943 (and tp!76517 e!609307))))

(declare-fun mapRest!39943 () (Array (_ BitVec 32) ValueCell!12047))

(declare-fun mapKey!39943 () (_ BitVec 32))

(declare-fun mapValue!39943 () ValueCell!12047)

(assert (=> mapNonEmpty!39943 (= (arr!32710 _values!955) (store mapRest!39943 mapKey!39943 mapValue!39943))))

(declare-fun b!1068241 () Bool)

(declare-fun res!712560 () Bool)

(assert (=> b!1068241 (=> (not res!712560) (not e!609309))))

(declare-datatypes ((List!22785 0))(
  ( (Nil!22782) (Cons!22781 (h!23999 (_ BitVec 64)) (t!32100 List!22785)) )
))
(declare-fun arrayNoDuplicates!0 (array!68033 (_ BitVec 32) List!22785) Bool)

(assert (=> b!1068241 (= res!712560 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22782))))

(declare-fun b!1068242 () Bool)

(assert (=> b!1068242 (= e!609306 (and e!609308 mapRes!39943))))

(declare-fun condMapEmpty!39943 () Bool)

(declare-fun mapDefault!39943 () ValueCell!12047)

(assert (=> b!1068242 (= condMapEmpty!39943 (= (arr!32710 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12047)) mapDefault!39943)))))

(declare-fun b!1068243 () Bool)

(declare-fun res!712559 () Bool)

(assert (=> b!1068243 (=> (not res!712559) (not e!609309))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068243 (= res!712559 (and (= (size!33247 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33248 _keys!1163) (size!33247 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068244 () Bool)

(assert (=> b!1068244 (= e!609309 (not true))))

(declare-datatypes ((tuple2!16216 0))(
  ( (tuple2!16217 (_1!8119 (_ BitVec 64)) (_2!8119 V!39137)) )
))
(declare-datatypes ((List!22786 0))(
  ( (Nil!22783) (Cons!22782 (h!24000 tuple2!16216) (t!32101 List!22786)) )
))
(declare-datatypes ((ListLongMap!14193 0))(
  ( (ListLongMap!14194 (toList!7112 List!22786)) )
))
(declare-fun lt!471737 () ListLongMap!14193)

(declare-fun lt!471736 () ListLongMap!14193)

(assert (=> b!1068244 (= lt!471737 lt!471736)))

(declare-fun zeroValueBefore!47 () V!39137)

(declare-datatypes ((Unit!35022 0))(
  ( (Unit!35023) )
))
(declare-fun lt!471735 () Unit!35022)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39137)

(declare-fun minValue!907 () V!39137)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!734 (array!68033 array!68031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39137 V!39137 V!39137 V!39137 (_ BitVec 32) Int) Unit!35022)

(assert (=> b!1068244 (= lt!471735 (lemmaNoChangeToArrayThenSameMapNoExtras!734 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3731 (array!68033 array!68031 (_ BitVec 32) (_ BitVec 32) V!39137 V!39137 (_ BitVec 32) Int) ListLongMap!14193)

(assert (=> b!1068244 (= lt!471736 (getCurrentListMapNoExtraKeys!3731 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068244 (= lt!471737 (getCurrentListMapNoExtraKeys!3731 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39943 () Bool)

(assert (=> mapIsEmpty!39943 mapRes!39943))

(assert (= (and start!94586 res!712562) b!1068243))

(assert (= (and b!1068243 res!712559) b!1068239))

(assert (= (and b!1068239 res!712561) b!1068241))

(assert (= (and b!1068241 res!712560) b!1068244))

(assert (= (and b!1068242 condMapEmpty!39943) mapIsEmpty!39943))

(assert (= (and b!1068242 (not condMapEmpty!39943)) mapNonEmpty!39943))

(get-info :version)

(assert (= (and mapNonEmpty!39943 ((_ is ValueCellFull!12047) mapValue!39943)) b!1068240))

(assert (= (and b!1068242 ((_ is ValueCellFull!12047) mapDefault!39943)) b!1068238))

(assert (= start!94586 b!1068242))

(declare-fun m!987319 () Bool)

(assert (=> start!94586 m!987319))

(declare-fun m!987321 () Bool)

(assert (=> start!94586 m!987321))

(declare-fun m!987323 () Bool)

(assert (=> start!94586 m!987323))

(declare-fun m!987325 () Bool)

(assert (=> mapNonEmpty!39943 m!987325))

(declare-fun m!987327 () Bool)

(assert (=> b!1068244 m!987327))

(declare-fun m!987329 () Bool)

(assert (=> b!1068244 m!987329))

(declare-fun m!987331 () Bool)

(assert (=> b!1068244 m!987331))

(declare-fun m!987333 () Bool)

(assert (=> b!1068239 m!987333))

(declare-fun m!987335 () Bool)

(assert (=> b!1068241 m!987335))

(check-sat b_and!34485 (not start!94586) (not b!1068241) (not b!1068239) (not b!1068244) (not mapNonEmpty!39943) (not b_next!21691) tp_is_empty!25501)
(check-sat b_and!34485 (not b_next!21691))
