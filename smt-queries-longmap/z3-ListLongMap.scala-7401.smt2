; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94434 () Bool)

(assert start!94434)

(declare-fun b_free!21583 () Bool)

(declare-fun b_next!21583 () Bool)

(assert (=> start!94434 (= b_free!21583 (not b_next!21583))))

(declare-fun tp!76187 () Bool)

(declare-fun b_and!34353 () Bool)

(assert (=> start!94434 (= tp!76187 b_and!34353)))

(declare-fun b!1066576 () Bool)

(declare-fun e!608098 () Bool)

(declare-fun e!608101 () Bool)

(declare-fun mapRes!39775 () Bool)

(assert (=> b!1066576 (= e!608098 (and e!608101 mapRes!39775))))

(declare-fun condMapEmpty!39775 () Bool)

(declare-datatypes ((V!38993 0))(
  ( (V!38994 (val!12747 Int)) )
))
(declare-datatypes ((ValueCell!11993 0))(
  ( (ValueCellFull!11993 (v!15355 V!38993)) (EmptyCell!11993) )
))
(declare-datatypes ((array!67821 0))(
  ( (array!67822 (arr!32607 (Array (_ BitVec 32) ValueCell!11993)) (size!33144 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67821)

(declare-fun mapDefault!39775 () ValueCell!11993)

(assert (=> b!1066576 (= condMapEmpty!39775 (= (arr!32607 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11993)) mapDefault!39775)))))

(declare-fun res!711590 () Bool)

(declare-fun e!608102 () Bool)

(assert (=> start!94434 (=> (not res!711590) (not e!608102))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94434 (= res!711590 (validMask!0 mask!1515))))

(assert (=> start!94434 e!608102))

(assert (=> start!94434 true))

(declare-fun tp_is_empty!25393 () Bool)

(assert (=> start!94434 tp_is_empty!25393))

(declare-fun array_inv!25272 (array!67821) Bool)

(assert (=> start!94434 (and (array_inv!25272 _values!955) e!608098)))

(assert (=> start!94434 tp!76187))

(declare-datatypes ((array!67823 0))(
  ( (array!67824 (arr!32608 (Array (_ BitVec 32) (_ BitVec 64))) (size!33145 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67823)

(declare-fun array_inv!25273 (array!67823) Bool)

(assert (=> start!94434 (array_inv!25273 _keys!1163)))

(declare-fun b!1066577 () Bool)

(declare-fun res!711587 () Bool)

(assert (=> b!1066577 (=> (not res!711587) (not e!608102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67823 (_ BitVec 32)) Bool)

(assert (=> b!1066577 (= res!711587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39775 () Bool)

(assert (=> mapIsEmpty!39775 mapRes!39775))

(declare-fun b!1066578 () Bool)

(declare-fun e!608100 () Bool)

(assert (=> b!1066578 (= e!608100 tp_is_empty!25393)))

(declare-fun b!1066579 () Bool)

(declare-fun e!608097 () Bool)

(assert (=> b!1066579 (= e!608102 (not e!608097))))

(declare-fun res!711588 () Bool)

(assert (=> b!1066579 (=> res!711588 e!608097)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066579 (= res!711588 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16134 0))(
  ( (tuple2!16135 (_1!8078 (_ BitVec 64)) (_2!8078 V!38993)) )
))
(declare-datatypes ((List!22707 0))(
  ( (Nil!22704) (Cons!22703 (h!23921 tuple2!16134) (t!32018 List!22707)) )
))
(declare-datatypes ((ListLongMap!14111 0))(
  ( (ListLongMap!14112 (toList!7071 List!22707)) )
))
(declare-fun lt!470180 () ListLongMap!14111)

(declare-fun lt!470176 () ListLongMap!14111)

(assert (=> b!1066579 (= lt!470180 lt!470176)))

(declare-fun zeroValueBefore!47 () V!38993)

(declare-datatypes ((Unit!34936 0))(
  ( (Unit!34937) )
))
(declare-fun lt!470174 () Unit!34936)

(declare-fun minValue!907 () V!38993)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38993)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!703 (array!67823 array!67821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38993 V!38993 V!38993 V!38993 (_ BitVec 32) Int) Unit!34936)

(assert (=> b!1066579 (= lt!470174 (lemmaNoChangeToArrayThenSameMapNoExtras!703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3700 (array!67823 array!67821 (_ BitVec 32) (_ BitVec 32) V!38993 V!38993 (_ BitVec 32) Int) ListLongMap!14111)

(assert (=> b!1066579 (= lt!470176 (getCurrentListMapNoExtraKeys!3700 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066579 (= lt!470180 (getCurrentListMapNoExtraKeys!3700 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066580 () Bool)

(assert (=> b!1066580 (= e!608097 true)))

(declare-fun lt!470179 () ListLongMap!14111)

(declare-fun lt!470175 () ListLongMap!14111)

(declare-fun -!591 (ListLongMap!14111 (_ BitVec 64)) ListLongMap!14111)

(assert (=> b!1066580 (= lt!470179 (-!591 lt!470175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470177 () ListLongMap!14111)

(assert (=> b!1066580 (= (-!591 lt!470177 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470180)))

(declare-fun lt!470178 () Unit!34936)

(declare-fun addThenRemoveForNewKeyIsSame!1 (ListLongMap!14111 (_ BitVec 64) V!38993) Unit!34936)

(assert (=> b!1066580 (= lt!470178 (addThenRemoveForNewKeyIsSame!1 lt!470180 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470173 () ListLongMap!14111)

(assert (=> b!1066580 (and (= lt!470175 lt!470177) (= lt!470173 lt!470176))))

(declare-fun +!3144 (ListLongMap!14111 tuple2!16134) ListLongMap!14111)

(assert (=> b!1066580 (= lt!470177 (+!3144 lt!470180 (tuple2!16135 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4025 (array!67823 array!67821 (_ BitVec 32) (_ BitVec 32) V!38993 V!38993 (_ BitVec 32) Int) ListLongMap!14111)

(assert (=> b!1066580 (= lt!470173 (getCurrentListMap!4025 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066580 (= lt!470175 (getCurrentListMap!4025 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066581 () Bool)

(declare-fun res!711589 () Bool)

(assert (=> b!1066581 (=> (not res!711589) (not e!608102))))

(declare-datatypes ((List!22708 0))(
  ( (Nil!22705) (Cons!22704 (h!23922 (_ BitVec 64)) (t!32019 List!22708)) )
))
(declare-fun arrayNoDuplicates!0 (array!67823 (_ BitVec 32) List!22708) Bool)

(assert (=> b!1066581 (= res!711589 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22705))))

(declare-fun mapNonEmpty!39775 () Bool)

(declare-fun tp!76186 () Bool)

(assert (=> mapNonEmpty!39775 (= mapRes!39775 (and tp!76186 e!608100))))

(declare-fun mapRest!39775 () (Array (_ BitVec 32) ValueCell!11993))

(declare-fun mapKey!39775 () (_ BitVec 32))

(declare-fun mapValue!39775 () ValueCell!11993)

(assert (=> mapNonEmpty!39775 (= (arr!32607 _values!955) (store mapRest!39775 mapKey!39775 mapValue!39775))))

(declare-fun b!1066582 () Bool)

(declare-fun res!711591 () Bool)

(assert (=> b!1066582 (=> (not res!711591) (not e!608102))))

(assert (=> b!1066582 (= res!711591 (and (= (size!33144 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33145 _keys!1163) (size!33144 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066583 () Bool)

(assert (=> b!1066583 (= e!608101 tp_is_empty!25393)))

(assert (= (and start!94434 res!711590) b!1066582))

(assert (= (and b!1066582 res!711591) b!1066577))

(assert (= (and b!1066577 res!711587) b!1066581))

(assert (= (and b!1066581 res!711589) b!1066579))

(assert (= (and b!1066579 (not res!711588)) b!1066580))

(assert (= (and b!1066576 condMapEmpty!39775) mapIsEmpty!39775))

(assert (= (and b!1066576 (not condMapEmpty!39775)) mapNonEmpty!39775))

(get-info :version)

(assert (= (and mapNonEmpty!39775 ((_ is ValueCellFull!11993) mapValue!39775)) b!1066578))

(assert (= (and b!1066576 ((_ is ValueCellFull!11993) mapDefault!39775)) b!1066583))

(assert (= start!94434 b!1066576))

(declare-fun m!985331 () Bool)

(assert (=> start!94434 m!985331))

(declare-fun m!985333 () Bool)

(assert (=> start!94434 m!985333))

(declare-fun m!985335 () Bool)

(assert (=> start!94434 m!985335))

(declare-fun m!985337 () Bool)

(assert (=> b!1066579 m!985337))

(declare-fun m!985339 () Bool)

(assert (=> b!1066579 m!985339))

(declare-fun m!985341 () Bool)

(assert (=> b!1066579 m!985341))

(declare-fun m!985343 () Bool)

(assert (=> b!1066577 m!985343))

(declare-fun m!985345 () Bool)

(assert (=> b!1066581 m!985345))

(declare-fun m!985347 () Bool)

(assert (=> b!1066580 m!985347))

(declare-fun m!985349 () Bool)

(assert (=> b!1066580 m!985349))

(declare-fun m!985351 () Bool)

(assert (=> b!1066580 m!985351))

(declare-fun m!985353 () Bool)

(assert (=> b!1066580 m!985353))

(declare-fun m!985355 () Bool)

(assert (=> b!1066580 m!985355))

(declare-fun m!985357 () Bool)

(assert (=> b!1066580 m!985357))

(declare-fun m!985359 () Bool)

(assert (=> mapNonEmpty!39775 m!985359))

(check-sat (not b!1066579) tp_is_empty!25393 (not b_next!21583) (not b!1066580) (not b!1066581) (not b!1066577) b_and!34353 (not start!94434) (not mapNonEmpty!39775))
(check-sat b_and!34353 (not b_next!21583))
