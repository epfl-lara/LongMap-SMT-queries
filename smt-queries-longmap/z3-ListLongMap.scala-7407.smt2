; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94228 () Bool)

(assert start!94228)

(declare-fun b_free!21619 () Bool)

(declare-fun b_next!21619 () Bool)

(assert (=> start!94228 (= b_free!21619 (not b_next!21619))))

(declare-fun tp!76295 () Bool)

(declare-fun b_and!34353 () Bool)

(assert (=> start!94228 (= tp!76295 b_and!34353)))

(declare-fun b!1065528 () Bool)

(declare-fun res!711270 () Bool)

(declare-fun e!607477 () Bool)

(assert (=> b!1065528 (=> (not res!711270) (not e!607477))))

(declare-datatypes ((array!67786 0))(
  ( (array!67787 (arr!32596 (Array (_ BitVec 32) (_ BitVec 64))) (size!33134 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67786)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67786 (_ BitVec 32)) Bool)

(assert (=> b!1065528 (= res!711270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065529 () Bool)

(declare-fun e!607478 () Bool)

(declare-fun tp_is_empty!25429 () Bool)

(assert (=> b!1065529 (= e!607478 tp_is_empty!25429)))

(declare-fun mapNonEmpty!39829 () Bool)

(declare-fun mapRes!39829 () Bool)

(declare-fun tp!76294 () Bool)

(declare-fun e!607474 () Bool)

(assert (=> mapNonEmpty!39829 (= mapRes!39829 (and tp!76294 e!607474))))

(declare-datatypes ((V!39041 0))(
  ( (V!39042 (val!12765 Int)) )
))
(declare-datatypes ((ValueCell!12011 0))(
  ( (ValueCellFull!12011 (v!15376 V!39041)) (EmptyCell!12011) )
))
(declare-fun mapRest!39829 () (Array (_ BitVec 32) ValueCell!12011))

(declare-fun mapValue!39829 () ValueCell!12011)

(declare-datatypes ((array!67788 0))(
  ( (array!67789 (arr!32597 (Array (_ BitVec 32) ValueCell!12011)) (size!33135 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67788)

(declare-fun mapKey!39829 () (_ BitVec 32))

(assert (=> mapNonEmpty!39829 (= (arr!32597 _values!955) (store mapRest!39829 mapKey!39829 mapValue!39829))))

(declare-fun mapIsEmpty!39829 () Bool)

(assert (=> mapIsEmpty!39829 mapRes!39829))

(declare-fun b!1065530 () Bool)

(declare-fun res!711266 () Bool)

(assert (=> b!1065530 (=> (not res!711266) (not e!607477))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065530 (= res!711266 (and (= (size!33135 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33134 _keys!1163) (size!33135 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065531 () Bool)

(declare-fun res!711268 () Bool)

(assert (=> b!1065531 (=> (not res!711268) (not e!607477))))

(declare-datatypes ((List!22784 0))(
  ( (Nil!22781) (Cons!22780 (h!23989 (_ BitVec 64)) (t!32094 List!22784)) )
))
(declare-fun arrayNoDuplicates!0 (array!67786 (_ BitVec 32) List!22784) Bool)

(assert (=> b!1065531 (= res!711268 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22781))))

(declare-fun res!711267 () Bool)

(assert (=> start!94228 (=> (not res!711267) (not e!607477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94228 (= res!711267 (validMask!0 mask!1515))))

(assert (=> start!94228 e!607477))

(assert (=> start!94228 true))

(assert (=> start!94228 tp_is_empty!25429))

(declare-fun e!607476 () Bool)

(declare-fun array_inv!25238 (array!67788) Bool)

(assert (=> start!94228 (and (array_inv!25238 _values!955) e!607476)))

(assert (=> start!94228 tp!76295))

(declare-fun array_inv!25239 (array!67786) Bool)

(assert (=> start!94228 (array_inv!25239 _keys!1163)))

(declare-fun b!1065532 () Bool)

(declare-fun e!607473 () Bool)

(assert (=> b!1065532 (= e!607477 (not e!607473))))

(declare-fun res!711269 () Bool)

(assert (=> b!1065532 (=> res!711269 e!607473)))

(assert (=> b!1065532 (= res!711269 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16236 0))(
  ( (tuple2!16237 (_1!8129 (_ BitVec 64)) (_2!8129 V!39041)) )
))
(declare-datatypes ((List!22785 0))(
  ( (Nil!22782) (Cons!22781 (h!23990 tuple2!16236) (t!32095 List!22785)) )
))
(declare-datatypes ((ListLongMap!14205 0))(
  ( (ListLongMap!14206 (toList!7118 List!22785)) )
))
(declare-fun lt!469893 () ListLongMap!14205)

(declare-fun lt!469891 () ListLongMap!14205)

(assert (=> b!1065532 (= lt!469893 lt!469891)))

(declare-fun zeroValueBefore!47 () V!39041)

(declare-fun minValue!907 () V!39041)

(declare-datatypes ((Unit!34822 0))(
  ( (Unit!34823) )
))
(declare-fun lt!469895 () Unit!34822)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39041)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!712 (array!67786 array!67788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39041 V!39041 V!39041 V!39041 (_ BitVec 32) Int) Unit!34822)

(assert (=> b!1065532 (= lt!469895 (lemmaNoChangeToArrayThenSameMapNoExtras!712 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3718 (array!67786 array!67788 (_ BitVec 32) (_ BitVec 32) V!39041 V!39041 (_ BitVec 32) Int) ListLongMap!14205)

(assert (=> b!1065532 (= lt!469891 (getCurrentListMapNoExtraKeys!3718 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065532 (= lt!469893 (getCurrentListMapNoExtraKeys!3718 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065533 () Bool)

(assert (=> b!1065533 (= e!607476 (and e!607478 mapRes!39829))))

(declare-fun condMapEmpty!39829 () Bool)

(declare-fun mapDefault!39829 () ValueCell!12011)

(assert (=> b!1065533 (= condMapEmpty!39829 (= (arr!32597 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12011)) mapDefault!39829)))))

(declare-fun b!1065534 () Bool)

(assert (=> b!1065534 (= e!607474 tp_is_empty!25429)))

(declare-fun b!1065535 () Bool)

(assert (=> b!1065535 (= e!607473 true)))

(declare-fun lt!469896 () ListLongMap!14205)

(declare-fun lt!469890 () ListLongMap!14205)

(declare-fun -!594 (ListLongMap!14205 (_ BitVec 64)) ListLongMap!14205)

(assert (=> b!1065535 (= lt!469896 (-!594 lt!469890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469892 () ListLongMap!14205)

(assert (=> b!1065535 (= (-!594 lt!469892 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469893)))

(declare-fun lt!469897 () Unit!34822)

(declare-fun addThenRemoveForNewKeyIsSame!12 (ListLongMap!14205 (_ BitVec 64) V!39041) Unit!34822)

(assert (=> b!1065535 (= lt!469897 (addThenRemoveForNewKeyIsSame!12 lt!469893 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469894 () ListLongMap!14205)

(assert (=> b!1065535 (and (= lt!469890 lt!469892) (= lt!469894 lt!469891))))

(declare-fun +!3160 (ListLongMap!14205 tuple2!16236) ListLongMap!14205)

(assert (=> b!1065535 (= lt!469892 (+!3160 lt!469893 (tuple2!16237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!3992 (array!67786 array!67788 (_ BitVec 32) (_ BitVec 32) V!39041 V!39041 (_ BitVec 32) Int) ListLongMap!14205)

(assert (=> b!1065535 (= lt!469894 (getCurrentListMap!3992 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065535 (= lt!469890 (getCurrentListMap!3992 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94228 res!711267) b!1065530))

(assert (= (and b!1065530 res!711266) b!1065528))

(assert (= (and b!1065528 res!711270) b!1065531))

(assert (= (and b!1065531 res!711268) b!1065532))

(assert (= (and b!1065532 (not res!711269)) b!1065535))

(assert (= (and b!1065533 condMapEmpty!39829) mapIsEmpty!39829))

(assert (= (and b!1065533 (not condMapEmpty!39829)) mapNonEmpty!39829))

(get-info :version)

(assert (= (and mapNonEmpty!39829 ((_ is ValueCellFull!12011) mapValue!39829)) b!1065534))

(assert (= (and b!1065533 ((_ is ValueCellFull!12011) mapDefault!39829)) b!1065529))

(assert (= start!94228 b!1065533))

(declare-fun m!983573 () Bool)

(assert (=> b!1065531 m!983573))

(declare-fun m!983575 () Bool)

(assert (=> b!1065528 m!983575))

(declare-fun m!983577 () Bool)

(assert (=> b!1065535 m!983577))

(declare-fun m!983579 () Bool)

(assert (=> b!1065535 m!983579))

(declare-fun m!983581 () Bool)

(assert (=> b!1065535 m!983581))

(declare-fun m!983583 () Bool)

(assert (=> b!1065535 m!983583))

(declare-fun m!983585 () Bool)

(assert (=> b!1065535 m!983585))

(declare-fun m!983587 () Bool)

(assert (=> b!1065535 m!983587))

(declare-fun m!983589 () Bool)

(assert (=> mapNonEmpty!39829 m!983589))

(declare-fun m!983591 () Bool)

(assert (=> start!94228 m!983591))

(declare-fun m!983593 () Bool)

(assert (=> start!94228 m!983593))

(declare-fun m!983595 () Bool)

(assert (=> start!94228 m!983595))

(declare-fun m!983597 () Bool)

(assert (=> b!1065532 m!983597))

(declare-fun m!983599 () Bool)

(assert (=> b!1065532 m!983599))

(declare-fun m!983601 () Bool)

(assert (=> b!1065532 m!983601))

(check-sat b_and!34353 (not b!1065532) (not start!94228) (not b!1065531) (not b!1065528) (not b!1065535) (not b_next!21619) (not mapNonEmpty!39829) tp_is_empty!25429)
(check-sat b_and!34353 (not b_next!21619))
