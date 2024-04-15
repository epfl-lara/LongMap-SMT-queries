; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94216 () Bool)

(assert start!94216)

(declare-fun b_free!21607 () Bool)

(declare-fun b_next!21607 () Bool)

(assert (=> start!94216 (= b_free!21607 (not b_next!21607))))

(declare-fun tp!76258 () Bool)

(declare-fun b_and!34341 () Bool)

(assert (=> start!94216 (= tp!76258 b_and!34341)))

(declare-fun b!1065384 () Bool)

(declare-fun e!607365 () Bool)

(declare-fun tp_is_empty!25417 () Bool)

(assert (=> b!1065384 (= e!607365 tp_is_empty!25417)))

(declare-fun b!1065385 () Bool)

(declare-fun res!711180 () Bool)

(declare-fun e!607370 () Bool)

(assert (=> b!1065385 (=> (not res!711180) (not e!607370))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39025 0))(
  ( (V!39026 (val!12759 Int)) )
))
(declare-datatypes ((ValueCell!12005 0))(
  ( (ValueCellFull!12005 (v!15370 V!39025)) (EmptyCell!12005) )
))
(declare-datatypes ((array!67762 0))(
  ( (array!67763 (arr!32584 (Array (_ BitVec 32) ValueCell!12005)) (size!33122 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67762)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67764 0))(
  ( (array!67765 (arr!32585 (Array (_ BitVec 32) (_ BitVec 64))) (size!33123 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67764)

(assert (=> b!1065385 (= res!711180 (and (= (size!33122 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33123 _keys!1163) (size!33122 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065386 () Bool)

(declare-fun e!607369 () Bool)

(declare-fun mapRes!39811 () Bool)

(assert (=> b!1065386 (= e!607369 (and e!607365 mapRes!39811))))

(declare-fun condMapEmpty!39811 () Bool)

(declare-fun mapDefault!39811 () ValueCell!12005)

(assert (=> b!1065386 (= condMapEmpty!39811 (= (arr!32584 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12005)) mapDefault!39811)))))

(declare-fun b!1065387 () Bool)

(declare-fun res!711177 () Bool)

(assert (=> b!1065387 (=> (not res!711177) (not e!607370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67764 (_ BitVec 32)) Bool)

(assert (=> b!1065387 (= res!711177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065388 () Bool)

(declare-fun e!607367 () Bool)

(assert (=> b!1065388 (= e!607370 (not e!607367))))

(declare-fun res!711179 () Bool)

(assert (=> b!1065388 (=> res!711179 e!607367)))

(assert (=> b!1065388 (= res!711179 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16226 0))(
  ( (tuple2!16227 (_1!8124 (_ BitVec 64)) (_2!8124 V!39025)) )
))
(declare-datatypes ((List!22775 0))(
  ( (Nil!22772) (Cons!22771 (h!23980 tuple2!16226) (t!32085 List!22775)) )
))
(declare-datatypes ((ListLongMap!14195 0))(
  ( (ListLongMap!14196 (toList!7113 List!22775)) )
))
(declare-fun lt!469746 () ListLongMap!14195)

(declare-fun lt!469747 () ListLongMap!14195)

(assert (=> b!1065388 (= lt!469746 lt!469747)))

(declare-fun zeroValueBefore!47 () V!39025)

(declare-datatypes ((Unit!34812 0))(
  ( (Unit!34813) )
))
(declare-fun lt!469750 () Unit!34812)

(declare-fun minValue!907 () V!39025)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39025)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!708 (array!67764 array!67762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39025 V!39025 V!39025 V!39025 (_ BitVec 32) Int) Unit!34812)

(assert (=> b!1065388 (= lt!469750 (lemmaNoChangeToArrayThenSameMapNoExtras!708 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3714 (array!67764 array!67762 (_ BitVec 32) (_ BitVec 32) V!39025 V!39025 (_ BitVec 32) Int) ListLongMap!14195)

(assert (=> b!1065388 (= lt!469747 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065388 (= lt!469746 (getCurrentListMapNoExtraKeys!3714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065389 () Bool)

(assert (=> b!1065389 (= e!607367 true)))

(declare-fun lt!469752 () ListLongMap!14195)

(declare-fun lt!469749 () ListLongMap!14195)

(declare-fun -!591 (ListLongMap!14195 (_ BitVec 64)) ListLongMap!14195)

(assert (=> b!1065389 (= lt!469752 (-!591 lt!469749 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469751 () ListLongMap!14195)

(assert (=> b!1065389 (= (-!591 lt!469751 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469746)))

(declare-fun lt!469748 () Unit!34812)

(declare-fun addThenRemoveForNewKeyIsSame!9 (ListLongMap!14195 (_ BitVec 64) V!39025) Unit!34812)

(assert (=> b!1065389 (= lt!469748 (addThenRemoveForNewKeyIsSame!9 lt!469746 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469753 () ListLongMap!14195)

(assert (=> b!1065389 (and (= lt!469749 lt!469751) (= lt!469753 lt!469747))))

(declare-fun +!3157 (ListLongMap!14195 tuple2!16226) ListLongMap!14195)

(assert (=> b!1065389 (= lt!469751 (+!3157 lt!469746 (tuple2!16227 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!3989 (array!67764 array!67762 (_ BitVec 32) (_ BitVec 32) V!39025 V!39025 (_ BitVec 32) Int) ListLongMap!14195)

(assert (=> b!1065389 (= lt!469753 (getCurrentListMap!3989 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065389 (= lt!469749 (getCurrentListMap!3989 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39811 () Bool)

(declare-fun tp!76259 () Bool)

(declare-fun e!607368 () Bool)

(assert (=> mapNonEmpty!39811 (= mapRes!39811 (and tp!76259 e!607368))))

(declare-fun mapKey!39811 () (_ BitVec 32))

(declare-fun mapRest!39811 () (Array (_ BitVec 32) ValueCell!12005))

(declare-fun mapValue!39811 () ValueCell!12005)

(assert (=> mapNonEmpty!39811 (= (arr!32584 _values!955) (store mapRest!39811 mapKey!39811 mapValue!39811))))

(declare-fun mapIsEmpty!39811 () Bool)

(assert (=> mapIsEmpty!39811 mapRes!39811))

(declare-fun b!1065390 () Bool)

(declare-fun res!711178 () Bool)

(assert (=> b!1065390 (=> (not res!711178) (not e!607370))))

(declare-datatypes ((List!22776 0))(
  ( (Nil!22773) (Cons!22772 (h!23981 (_ BitVec 64)) (t!32086 List!22776)) )
))
(declare-fun arrayNoDuplicates!0 (array!67764 (_ BitVec 32) List!22776) Bool)

(assert (=> b!1065390 (= res!711178 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22773))))

(declare-fun res!711176 () Bool)

(assert (=> start!94216 (=> (not res!711176) (not e!607370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94216 (= res!711176 (validMask!0 mask!1515))))

(assert (=> start!94216 e!607370))

(assert (=> start!94216 true))

(assert (=> start!94216 tp_is_empty!25417))

(declare-fun array_inv!25228 (array!67762) Bool)

(assert (=> start!94216 (and (array_inv!25228 _values!955) e!607369)))

(assert (=> start!94216 tp!76258))

(declare-fun array_inv!25229 (array!67764) Bool)

(assert (=> start!94216 (array_inv!25229 _keys!1163)))

(declare-fun b!1065391 () Bool)

(assert (=> b!1065391 (= e!607368 tp_is_empty!25417)))

(assert (= (and start!94216 res!711176) b!1065385))

(assert (= (and b!1065385 res!711180) b!1065387))

(assert (= (and b!1065387 res!711177) b!1065390))

(assert (= (and b!1065390 res!711178) b!1065388))

(assert (= (and b!1065388 (not res!711179)) b!1065389))

(assert (= (and b!1065386 condMapEmpty!39811) mapIsEmpty!39811))

(assert (= (and b!1065386 (not condMapEmpty!39811)) mapNonEmpty!39811))

(get-info :version)

(assert (= (and mapNonEmpty!39811 ((_ is ValueCellFull!12005) mapValue!39811)) b!1065391))

(assert (= (and b!1065386 ((_ is ValueCellFull!12005) mapDefault!39811)) b!1065384))

(assert (= start!94216 b!1065386))

(declare-fun m!983393 () Bool)

(assert (=> b!1065387 m!983393))

(declare-fun m!983395 () Bool)

(assert (=> start!94216 m!983395))

(declare-fun m!983397 () Bool)

(assert (=> start!94216 m!983397))

(declare-fun m!983399 () Bool)

(assert (=> start!94216 m!983399))

(declare-fun m!983401 () Bool)

(assert (=> mapNonEmpty!39811 m!983401))

(declare-fun m!983403 () Bool)

(assert (=> b!1065389 m!983403))

(declare-fun m!983405 () Bool)

(assert (=> b!1065389 m!983405))

(declare-fun m!983407 () Bool)

(assert (=> b!1065389 m!983407))

(declare-fun m!983409 () Bool)

(assert (=> b!1065389 m!983409))

(declare-fun m!983411 () Bool)

(assert (=> b!1065389 m!983411))

(declare-fun m!983413 () Bool)

(assert (=> b!1065389 m!983413))

(declare-fun m!983415 () Bool)

(assert (=> b!1065390 m!983415))

(declare-fun m!983417 () Bool)

(assert (=> b!1065388 m!983417))

(declare-fun m!983419 () Bool)

(assert (=> b!1065388 m!983419))

(declare-fun m!983421 () Bool)

(assert (=> b!1065388 m!983421))

(check-sat b_and!34341 (not mapNonEmpty!39811) (not b!1065389) (not b!1065390) tp_is_empty!25417 (not start!94216) (not b!1065388) (not b!1065387) (not b_next!21607))
(check-sat b_and!34341 (not b_next!21607))
