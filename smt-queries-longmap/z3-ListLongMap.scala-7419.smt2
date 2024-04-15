; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94344 () Bool)

(assert start!94344)

(declare-fun b_free!21691 () Bool)

(declare-fun b_next!21691 () Bool)

(assert (=> start!94344 (= b_free!21691 (not b_next!21691))))

(declare-fun tp!76516 () Bool)

(declare-fun b_and!34449 () Bool)

(assert (=> start!94344 (= tp!76516 b_and!34449)))

(declare-fun mapNonEmpty!39943 () Bool)

(declare-fun mapRes!39943 () Bool)

(declare-fun tp!76517 () Bool)

(declare-fun e!608359 () Bool)

(assert (=> mapNonEmpty!39943 (= mapRes!39943 (and tp!76517 e!608359))))

(declare-datatypes ((V!39137 0))(
  ( (V!39138 (val!12801 Int)) )
))
(declare-datatypes ((ValueCell!12047 0))(
  ( (ValueCellFull!12047 (v!15414 V!39137)) (EmptyCell!12047) )
))
(declare-fun mapValue!39943 () ValueCell!12047)

(declare-fun mapRest!39943 () (Array (_ BitVec 32) ValueCell!12047))

(declare-datatypes ((array!67930 0))(
  ( (array!67931 (arr!32666 (Array (_ BitVec 32) ValueCell!12047)) (size!33204 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67930)

(declare-fun mapKey!39943 () (_ BitVec 32))

(assert (=> mapNonEmpty!39943 (= (arr!32666 _values!955) (store mapRest!39943 mapKey!39943 mapValue!39943))))

(declare-fun b!1066758 () Bool)

(declare-fun res!711970 () Bool)

(declare-fun e!608360 () Bool)

(assert (=> b!1066758 (=> (not res!711970) (not e!608360))))

(declare-datatypes ((array!67932 0))(
  ( (array!67933 (arr!32667 (Array (_ BitVec 32) (_ BitVec 64))) (size!33205 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67932)

(declare-datatypes ((List!22839 0))(
  ( (Nil!22836) (Cons!22835 (h!24044 (_ BitVec 64)) (t!32153 List!22839)) )
))
(declare-fun arrayNoDuplicates!0 (array!67932 (_ BitVec 32) List!22839) Bool)

(assert (=> b!1066758 (= res!711970 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22836))))

(declare-fun b!1066759 () Bool)

(declare-fun e!608357 () Bool)

(declare-fun tp_is_empty!25501 () Bool)

(assert (=> b!1066759 (= e!608357 tp_is_empty!25501)))

(declare-fun res!711971 () Bool)

(assert (=> start!94344 (=> (not res!711971) (not e!608360))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94344 (= res!711971 (validMask!0 mask!1515))))

(assert (=> start!94344 e!608360))

(assert (=> start!94344 true))

(assert (=> start!94344 tp_is_empty!25501))

(declare-fun e!608358 () Bool)

(declare-fun array_inv!25290 (array!67930) Bool)

(assert (=> start!94344 (and (array_inv!25290 _values!955) e!608358)))

(assert (=> start!94344 tp!76516))

(declare-fun array_inv!25291 (array!67932) Bool)

(assert (=> start!94344 (array_inv!25291 _keys!1163)))

(declare-fun b!1066760 () Bool)

(declare-fun res!711969 () Bool)

(assert (=> b!1066760 (=> (not res!711969) (not e!608360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67932 (_ BitVec 32)) Bool)

(assert (=> b!1066760 (= res!711969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066761 () Bool)

(assert (=> b!1066761 (= e!608360 (not true))))

(declare-datatypes ((tuple2!16296 0))(
  ( (tuple2!16297 (_1!8159 (_ BitVec 64)) (_2!8159 V!39137)) )
))
(declare-datatypes ((List!22840 0))(
  ( (Nil!22837) (Cons!22836 (h!24045 tuple2!16296) (t!32154 List!22840)) )
))
(declare-datatypes ((ListLongMap!14265 0))(
  ( (ListLongMap!14266 (toList!7148 List!22840)) )
))
(declare-fun lt!471020 () ListLongMap!14265)

(declare-fun lt!471022 () ListLongMap!14265)

(assert (=> b!1066761 (= lt!471020 lt!471022)))

(declare-fun zeroValueBefore!47 () V!39137)

(declare-datatypes ((Unit!34886 0))(
  ( (Unit!34887) )
))
(declare-fun lt!471021 () Unit!34886)

(declare-fun minValue!907 () V!39137)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39137)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!738 (array!67932 array!67930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39137 V!39137 V!39137 V!39137 (_ BitVec 32) Int) Unit!34886)

(assert (=> b!1066761 (= lt!471021 (lemmaNoChangeToArrayThenSameMapNoExtras!738 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3744 (array!67932 array!67930 (_ BitVec 32) (_ BitVec 32) V!39137 V!39137 (_ BitVec 32) Int) ListLongMap!14265)

(assert (=> b!1066761 (= lt!471022 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066761 (= lt!471020 (getCurrentListMapNoExtraKeys!3744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066762 () Bool)

(assert (=> b!1066762 (= e!608358 (and e!608357 mapRes!39943))))

(declare-fun condMapEmpty!39943 () Bool)

(declare-fun mapDefault!39943 () ValueCell!12047)

(assert (=> b!1066762 (= condMapEmpty!39943 (= (arr!32666 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12047)) mapDefault!39943)))))

(declare-fun mapIsEmpty!39943 () Bool)

(assert (=> mapIsEmpty!39943 mapRes!39943))

(declare-fun b!1066763 () Bool)

(assert (=> b!1066763 (= e!608359 tp_is_empty!25501)))

(declare-fun b!1066764 () Bool)

(declare-fun res!711968 () Bool)

(assert (=> b!1066764 (=> (not res!711968) (not e!608360))))

(assert (=> b!1066764 (= res!711968 (and (= (size!33204 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33205 _keys!1163) (size!33204 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94344 res!711971) b!1066764))

(assert (= (and b!1066764 res!711968) b!1066760))

(assert (= (and b!1066760 res!711969) b!1066758))

(assert (= (and b!1066758 res!711970) b!1066761))

(assert (= (and b!1066762 condMapEmpty!39943) mapIsEmpty!39943))

(assert (= (and b!1066762 (not condMapEmpty!39943)) mapNonEmpty!39943))

(get-info :version)

(assert (= (and mapNonEmpty!39943 ((_ is ValueCellFull!12047) mapValue!39943)) b!1066763))

(assert (= (and b!1066762 ((_ is ValueCellFull!12047) mapDefault!39943)) b!1066759))

(assert (= start!94344 b!1066762))

(declare-fun m!985021 () Bool)

(assert (=> mapNonEmpty!39943 m!985021))

(declare-fun m!985023 () Bool)

(assert (=> start!94344 m!985023))

(declare-fun m!985025 () Bool)

(assert (=> start!94344 m!985025))

(declare-fun m!985027 () Bool)

(assert (=> start!94344 m!985027))

(declare-fun m!985029 () Bool)

(assert (=> b!1066761 m!985029))

(declare-fun m!985031 () Bool)

(assert (=> b!1066761 m!985031))

(declare-fun m!985033 () Bool)

(assert (=> b!1066761 m!985033))

(declare-fun m!985035 () Bool)

(assert (=> b!1066758 m!985035))

(declare-fun m!985037 () Bool)

(assert (=> b!1066760 m!985037))

(check-sat (not b!1066758) (not start!94344) tp_is_empty!25501 (not b!1066761) (not b!1066760) (not mapNonEmpty!39943) b_and!34449 (not b_next!21691))
(check-sat b_and!34449 (not b_next!21691))
