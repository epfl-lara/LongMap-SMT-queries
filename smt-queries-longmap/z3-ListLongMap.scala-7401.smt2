; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94192 () Bool)

(assert start!94192)

(declare-fun b_free!21583 () Bool)

(declare-fun b_next!21583 () Bool)

(assert (=> start!94192 (= b_free!21583 (not b_next!21583))))

(declare-fun tp!76187 () Bool)

(declare-fun b_and!34317 () Bool)

(assert (=> start!94192 (= tp!76187 b_and!34317)))

(declare-fun b!1065096 () Bool)

(declare-fun res!710997 () Bool)

(declare-fun e!607150 () Bool)

(assert (=> b!1065096 (=> (not res!710997) (not e!607150))))

(declare-datatypes ((array!67720 0))(
  ( (array!67721 (arr!32563 (Array (_ BitVec 32) (_ BitVec 64))) (size!33101 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67720)

(declare-datatypes ((List!22757 0))(
  ( (Nil!22754) (Cons!22753 (h!23962 (_ BitVec 64)) (t!32067 List!22757)) )
))
(declare-fun arrayNoDuplicates!0 (array!67720 (_ BitVec 32) List!22757) Bool)

(assert (=> b!1065096 (= res!710997 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22754))))

(declare-fun mapIsEmpty!39775 () Bool)

(declare-fun mapRes!39775 () Bool)

(assert (=> mapIsEmpty!39775 mapRes!39775))

(declare-fun b!1065097 () Bool)

(declare-fun e!607151 () Bool)

(declare-fun tp_is_empty!25393 () Bool)

(assert (=> b!1065097 (= e!607151 tp_is_empty!25393)))

(declare-fun b!1065098 () Bool)

(declare-fun e!607153 () Bool)

(assert (=> b!1065098 (= e!607153 true)))

(declare-datatypes ((V!38993 0))(
  ( (V!38994 (val!12747 Int)) )
))
(declare-datatypes ((tuple2!16208 0))(
  ( (tuple2!16209 (_1!8115 (_ BitVec 64)) (_2!8115 V!38993)) )
))
(declare-datatypes ((List!22758 0))(
  ( (Nil!22755) (Cons!22754 (h!23963 tuple2!16208) (t!32068 List!22758)) )
))
(declare-datatypes ((ListLongMap!14177 0))(
  ( (ListLongMap!14178 (toList!7104 List!22758)) )
))
(declare-fun lt!469459 () ListLongMap!14177)

(declare-fun lt!469464 () ListLongMap!14177)

(declare-fun -!583 (ListLongMap!14177 (_ BitVec 64)) ListLongMap!14177)

(assert (=> b!1065098 (= lt!469459 (-!583 lt!469464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469462 () ListLongMap!14177)

(declare-fun lt!469465 () ListLongMap!14177)

(assert (=> b!1065098 (= (-!583 lt!469462 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469465)))

(declare-datatypes ((Unit!34794 0))(
  ( (Unit!34795) )
))
(declare-fun lt!469463 () Unit!34794)

(declare-fun zeroValueBefore!47 () V!38993)

(declare-fun addThenRemoveForNewKeyIsSame!1 (ListLongMap!14177 (_ BitVec 64) V!38993) Unit!34794)

(assert (=> b!1065098 (= lt!469463 (addThenRemoveForNewKeyIsSame!1 lt!469465 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469460 () ListLongMap!14177)

(declare-fun lt!469461 () ListLongMap!14177)

(assert (=> b!1065098 (and (= lt!469464 lt!469462) (= lt!469460 lt!469461))))

(declare-fun +!3149 (ListLongMap!14177 tuple2!16208) ListLongMap!14177)

(assert (=> b!1065098 (= lt!469462 (+!3149 lt!469465 (tuple2!16209 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11993 0))(
  ( (ValueCellFull!11993 (v!15358 V!38993)) (EmptyCell!11993) )
))
(declare-datatypes ((array!67722 0))(
  ( (array!67723 (arr!32564 (Array (_ BitVec 32) ValueCell!11993)) (size!33102 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67722)

(declare-fun minValue!907 () V!38993)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38993)

(declare-fun getCurrentListMap!3981 (array!67720 array!67722 (_ BitVec 32) (_ BitVec 32) V!38993 V!38993 (_ BitVec 32) Int) ListLongMap!14177)

(assert (=> b!1065098 (= lt!469460 (getCurrentListMap!3981 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065098 (= lt!469464 (getCurrentListMap!3981 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065099 () Bool)

(declare-fun res!710996 () Bool)

(assert (=> b!1065099 (=> (not res!710996) (not e!607150))))

(assert (=> b!1065099 (= res!710996 (and (= (size!33102 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33101 _keys!1163) (size!33102 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065100 () Bool)

(assert (=> b!1065100 (= e!607150 (not e!607153))))

(declare-fun res!710999 () Bool)

(assert (=> b!1065100 (=> res!710999 e!607153)))

(assert (=> b!1065100 (= res!710999 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065100 (= lt!469465 lt!469461)))

(declare-fun lt!469458 () Unit!34794)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!701 (array!67720 array!67722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38993 V!38993 V!38993 V!38993 (_ BitVec 32) Int) Unit!34794)

(assert (=> b!1065100 (= lt!469458 (lemmaNoChangeToArrayThenSameMapNoExtras!701 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3707 (array!67720 array!67722 (_ BitVec 32) (_ BitVec 32) V!38993 V!38993 (_ BitVec 32) Int) ListLongMap!14177)

(assert (=> b!1065100 (= lt!469461 (getCurrentListMapNoExtraKeys!3707 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065100 (= lt!469465 (getCurrentListMapNoExtraKeys!3707 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065101 () Bool)

(declare-fun e!607152 () Bool)

(assert (=> b!1065101 (= e!607152 tp_is_empty!25393)))

(declare-fun b!1065102 () Bool)

(declare-fun e!607149 () Bool)

(assert (=> b!1065102 (= e!607149 (and e!607152 mapRes!39775))))

(declare-fun condMapEmpty!39775 () Bool)

(declare-fun mapDefault!39775 () ValueCell!11993)

(assert (=> b!1065102 (= condMapEmpty!39775 (= (arr!32564 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11993)) mapDefault!39775)))))

(declare-fun res!710998 () Bool)

(assert (=> start!94192 (=> (not res!710998) (not e!607150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94192 (= res!710998 (validMask!0 mask!1515))))

(assert (=> start!94192 e!607150))

(assert (=> start!94192 true))

(assert (=> start!94192 tp_is_empty!25393))

(declare-fun array_inv!25214 (array!67722) Bool)

(assert (=> start!94192 (and (array_inv!25214 _values!955) e!607149)))

(assert (=> start!94192 tp!76187))

(declare-fun array_inv!25215 (array!67720) Bool)

(assert (=> start!94192 (array_inv!25215 _keys!1163)))

(declare-fun mapNonEmpty!39775 () Bool)

(declare-fun tp!76186 () Bool)

(assert (=> mapNonEmpty!39775 (= mapRes!39775 (and tp!76186 e!607151))))

(declare-fun mapKey!39775 () (_ BitVec 32))

(declare-fun mapValue!39775 () ValueCell!11993)

(declare-fun mapRest!39775 () (Array (_ BitVec 32) ValueCell!11993))

(assert (=> mapNonEmpty!39775 (= (arr!32564 _values!955) (store mapRest!39775 mapKey!39775 mapValue!39775))))

(declare-fun b!1065103 () Bool)

(declare-fun res!711000 () Bool)

(assert (=> b!1065103 (=> (not res!711000) (not e!607150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67720 (_ BitVec 32)) Bool)

(assert (=> b!1065103 (= res!711000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94192 res!710998) b!1065099))

(assert (= (and b!1065099 res!710996) b!1065103))

(assert (= (and b!1065103 res!711000) b!1065096))

(assert (= (and b!1065096 res!710997) b!1065100))

(assert (= (and b!1065100 (not res!710999)) b!1065098))

(assert (= (and b!1065102 condMapEmpty!39775) mapIsEmpty!39775))

(assert (= (and b!1065102 (not condMapEmpty!39775)) mapNonEmpty!39775))

(get-info :version)

(assert (= (and mapNonEmpty!39775 ((_ is ValueCellFull!11993) mapValue!39775)) b!1065097))

(assert (= (and b!1065102 ((_ is ValueCellFull!11993) mapDefault!39775)) b!1065101))

(assert (= start!94192 b!1065102))

(declare-fun m!983033 () Bool)

(assert (=> mapNonEmpty!39775 m!983033))

(declare-fun m!983035 () Bool)

(assert (=> b!1065096 m!983035))

(declare-fun m!983037 () Bool)

(assert (=> b!1065098 m!983037))

(declare-fun m!983039 () Bool)

(assert (=> b!1065098 m!983039))

(declare-fun m!983041 () Bool)

(assert (=> b!1065098 m!983041))

(declare-fun m!983043 () Bool)

(assert (=> b!1065098 m!983043))

(declare-fun m!983045 () Bool)

(assert (=> b!1065098 m!983045))

(declare-fun m!983047 () Bool)

(assert (=> b!1065098 m!983047))

(declare-fun m!983049 () Bool)

(assert (=> b!1065103 m!983049))

(declare-fun m!983051 () Bool)

(assert (=> start!94192 m!983051))

(declare-fun m!983053 () Bool)

(assert (=> start!94192 m!983053))

(declare-fun m!983055 () Bool)

(assert (=> start!94192 m!983055))

(declare-fun m!983057 () Bool)

(assert (=> b!1065100 m!983057))

(declare-fun m!983059 () Bool)

(assert (=> b!1065100 m!983059))

(declare-fun m!983061 () Bool)

(assert (=> b!1065100 m!983061))

(check-sat (not b!1065096) (not b!1065100) (not b_next!21583) tp_is_empty!25393 (not b!1065103) (not start!94192) b_and!34317 (not mapNonEmpty!39775) (not b!1065098))
(check-sat b_and!34317 (not b_next!21583))
