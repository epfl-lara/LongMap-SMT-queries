; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94198 () Bool)

(assert start!94198)

(declare-fun b_free!21589 () Bool)

(declare-fun b_next!21589 () Bool)

(assert (=> start!94198 (= b_free!21589 (not b_next!21589))))

(declare-fun tp!76204 () Bool)

(declare-fun b_and!34323 () Bool)

(assert (=> start!94198 (= tp!76204 b_and!34323)))

(declare-fun b!1065168 () Bool)

(declare-fun e!607205 () Bool)

(declare-fun tp_is_empty!25399 () Bool)

(assert (=> b!1065168 (= e!607205 tp_is_empty!25399)))

(declare-fun res!711043 () Bool)

(declare-fun e!607206 () Bool)

(assert (=> start!94198 (=> (not res!711043) (not e!607206))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94198 (= res!711043 (validMask!0 mask!1515))))

(assert (=> start!94198 e!607206))

(assert (=> start!94198 true))

(assert (=> start!94198 tp_is_empty!25399))

(declare-datatypes ((V!39001 0))(
  ( (V!39002 (val!12750 Int)) )
))
(declare-datatypes ((ValueCell!11996 0))(
  ( (ValueCellFull!11996 (v!15361 V!39001)) (EmptyCell!11996) )
))
(declare-datatypes ((array!67732 0))(
  ( (array!67733 (arr!32569 (Array (_ BitVec 32) ValueCell!11996)) (size!33107 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67732)

(declare-fun e!607203 () Bool)

(declare-fun array_inv!25218 (array!67732) Bool)

(assert (=> start!94198 (and (array_inv!25218 _values!955) e!607203)))

(assert (=> start!94198 tp!76204))

(declare-datatypes ((array!67734 0))(
  ( (array!67735 (arr!32570 (Array (_ BitVec 32) (_ BitVec 64))) (size!33108 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67734)

(declare-fun array_inv!25219 (array!67734) Bool)

(assert (=> start!94198 (array_inv!25219 _keys!1163)))

(declare-fun b!1065169 () Bool)

(declare-fun res!711044 () Bool)

(assert (=> b!1065169 (=> (not res!711044) (not e!607206))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065169 (= res!711044 (and (= (size!33107 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33108 _keys!1163) (size!33107 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065170 () Bool)

(declare-fun e!607207 () Bool)

(assert (=> b!1065170 (= e!607207 true)))

(declare-datatypes ((tuple2!16214 0))(
  ( (tuple2!16215 (_1!8118 (_ BitVec 64)) (_2!8118 V!39001)) )
))
(declare-datatypes ((List!22763 0))(
  ( (Nil!22760) (Cons!22759 (h!23968 tuple2!16214) (t!32073 List!22763)) )
))
(declare-datatypes ((ListLongMap!14183 0))(
  ( (ListLongMap!14184 (toList!7107 List!22763)) )
))
(declare-fun lt!469536 () ListLongMap!14183)

(declare-fun lt!469534 () ListLongMap!14183)

(declare-fun -!586 (ListLongMap!14183 (_ BitVec 64)) ListLongMap!14183)

(assert (=> b!1065170 (= lt!469536 (-!586 lt!469534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469531 () ListLongMap!14183)

(declare-fun lt!469530 () ListLongMap!14183)

(assert (=> b!1065170 (= (-!586 lt!469531 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469530)))

(declare-datatypes ((Unit!34800 0))(
  ( (Unit!34801) )
))
(declare-fun lt!469533 () Unit!34800)

(declare-fun zeroValueBefore!47 () V!39001)

(declare-fun addThenRemoveForNewKeyIsSame!4 (ListLongMap!14183 (_ BitVec 64) V!39001) Unit!34800)

(assert (=> b!1065170 (= lt!469533 (addThenRemoveForNewKeyIsSame!4 lt!469530 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469532 () ListLongMap!14183)

(declare-fun lt!469537 () ListLongMap!14183)

(assert (=> b!1065170 (and (= lt!469534 lt!469531) (= lt!469537 lt!469532))))

(declare-fun +!3152 (ListLongMap!14183 tuple2!16214) ListLongMap!14183)

(assert (=> b!1065170 (= lt!469531 (+!3152 lt!469530 (tuple2!16215 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39001)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39001)

(declare-fun getCurrentListMap!3984 (array!67734 array!67732 (_ BitVec 32) (_ BitVec 32) V!39001 V!39001 (_ BitVec 32) Int) ListLongMap!14183)

(assert (=> b!1065170 (= lt!469537 (getCurrentListMap!3984 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065170 (= lt!469534 (getCurrentListMap!3984 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39784 () Bool)

(declare-fun mapRes!39784 () Bool)

(assert (=> mapIsEmpty!39784 mapRes!39784))

(declare-fun b!1065171 () Bool)

(declare-fun res!711045 () Bool)

(assert (=> b!1065171 (=> (not res!711045) (not e!607206))))

(declare-datatypes ((List!22764 0))(
  ( (Nil!22761) (Cons!22760 (h!23969 (_ BitVec 64)) (t!32074 List!22764)) )
))
(declare-fun arrayNoDuplicates!0 (array!67734 (_ BitVec 32) List!22764) Bool)

(assert (=> b!1065171 (= res!711045 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22761))))

(declare-fun b!1065172 () Bool)

(declare-fun e!607208 () Bool)

(assert (=> b!1065172 (= e!607208 tp_is_empty!25399)))

(declare-fun b!1065173 () Bool)

(assert (=> b!1065173 (= e!607203 (and e!607208 mapRes!39784))))

(declare-fun condMapEmpty!39784 () Bool)

(declare-fun mapDefault!39784 () ValueCell!11996)

(assert (=> b!1065173 (= condMapEmpty!39784 (= (arr!32569 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11996)) mapDefault!39784)))))

(declare-fun b!1065174 () Bool)

(assert (=> b!1065174 (= e!607206 (not e!607207))))

(declare-fun res!711042 () Bool)

(assert (=> b!1065174 (=> res!711042 e!607207)))

(assert (=> b!1065174 (= res!711042 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065174 (= lt!469530 lt!469532)))

(declare-fun lt!469535 () Unit!34800)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!703 (array!67734 array!67732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39001 V!39001 V!39001 V!39001 (_ BitVec 32) Int) Unit!34800)

(assert (=> b!1065174 (= lt!469535 (lemmaNoChangeToArrayThenSameMapNoExtras!703 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3709 (array!67734 array!67732 (_ BitVec 32) (_ BitVec 32) V!39001 V!39001 (_ BitVec 32) Int) ListLongMap!14183)

(assert (=> b!1065174 (= lt!469532 (getCurrentListMapNoExtraKeys!3709 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065174 (= lt!469530 (getCurrentListMapNoExtraKeys!3709 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39784 () Bool)

(declare-fun tp!76205 () Bool)

(assert (=> mapNonEmpty!39784 (= mapRes!39784 (and tp!76205 e!607205))))

(declare-fun mapValue!39784 () ValueCell!11996)

(declare-fun mapRest!39784 () (Array (_ BitVec 32) ValueCell!11996))

(declare-fun mapKey!39784 () (_ BitVec 32))

(assert (=> mapNonEmpty!39784 (= (arr!32569 _values!955) (store mapRest!39784 mapKey!39784 mapValue!39784))))

(declare-fun b!1065175 () Bool)

(declare-fun res!711041 () Bool)

(assert (=> b!1065175 (=> (not res!711041) (not e!607206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67734 (_ BitVec 32)) Bool)

(assert (=> b!1065175 (= res!711041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94198 res!711043) b!1065169))

(assert (= (and b!1065169 res!711044) b!1065175))

(assert (= (and b!1065175 res!711041) b!1065171))

(assert (= (and b!1065171 res!711045) b!1065174))

(assert (= (and b!1065174 (not res!711042)) b!1065170))

(assert (= (and b!1065173 condMapEmpty!39784) mapIsEmpty!39784))

(assert (= (and b!1065173 (not condMapEmpty!39784)) mapNonEmpty!39784))

(get-info :version)

(assert (= (and mapNonEmpty!39784 ((_ is ValueCellFull!11996) mapValue!39784)) b!1065168))

(assert (= (and b!1065173 ((_ is ValueCellFull!11996) mapDefault!39784)) b!1065172))

(assert (= start!94198 b!1065173))

(declare-fun m!983123 () Bool)

(assert (=> b!1065174 m!983123))

(declare-fun m!983125 () Bool)

(assert (=> b!1065174 m!983125))

(declare-fun m!983127 () Bool)

(assert (=> b!1065174 m!983127))

(declare-fun m!983129 () Bool)

(assert (=> start!94198 m!983129))

(declare-fun m!983131 () Bool)

(assert (=> start!94198 m!983131))

(declare-fun m!983133 () Bool)

(assert (=> start!94198 m!983133))

(declare-fun m!983135 () Bool)

(assert (=> b!1065170 m!983135))

(declare-fun m!983137 () Bool)

(assert (=> b!1065170 m!983137))

(declare-fun m!983139 () Bool)

(assert (=> b!1065170 m!983139))

(declare-fun m!983141 () Bool)

(assert (=> b!1065170 m!983141))

(declare-fun m!983143 () Bool)

(assert (=> b!1065170 m!983143))

(declare-fun m!983145 () Bool)

(assert (=> b!1065170 m!983145))

(declare-fun m!983147 () Bool)

(assert (=> mapNonEmpty!39784 m!983147))

(declare-fun m!983149 () Bool)

(assert (=> b!1065171 m!983149))

(declare-fun m!983151 () Bool)

(assert (=> b!1065175 m!983151))

(check-sat (not mapNonEmpty!39784) (not b!1065175) (not b!1065174) (not b!1065171) b_and!34323 tp_is_empty!25399 (not b_next!21589) (not b!1065170) (not start!94198))
(check-sat b_and!34323 (not b_next!21589))
