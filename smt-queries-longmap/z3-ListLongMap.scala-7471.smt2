; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94744 () Bool)

(assert start!94744)

(declare-fun b_free!22003 () Bool)

(declare-fun b_next!22003 () Bool)

(assert (=> start!94744 (= b_free!22003 (not b_next!22003))))

(declare-fun tp!77467 () Bool)

(declare-fun b_and!34807 () Bool)

(assert (=> start!94744 (= tp!77467 b_and!34807)))

(declare-fun b!1071193 () Bool)

(declare-fun e!611631 () Bool)

(declare-fun tp_is_empty!25813 () Bool)

(assert (=> b!1071193 (= e!611631 tp_is_empty!25813)))

(declare-datatypes ((V!39553 0))(
  ( (V!39554 (val!12957 Int)) )
))
(declare-datatypes ((tuple2!16538 0))(
  ( (tuple2!16539 (_1!8280 (_ BitVec 64)) (_2!8280 V!39553)) )
))
(declare-fun lt!473747 () tuple2!16538)

(declare-datatypes ((List!23065 0))(
  ( (Nil!23062) (Cons!23061 (h!24270 tuple2!16538) (t!32389 List!23065)) )
))
(declare-datatypes ((ListLongMap!14507 0))(
  ( (ListLongMap!14508 (toList!7269 List!23065)) )
))
(declare-fun lt!473748 () ListLongMap!14507)

(declare-fun b!1071194 () Bool)

(declare-fun e!611629 () Bool)

(declare-fun lt!473742 () ListLongMap!14507)

(declare-fun +!3205 (ListLongMap!14507 tuple2!16538) ListLongMap!14507)

(assert (=> b!1071194 (= e!611629 (= lt!473742 (+!3205 lt!473748 lt!473747)))))

(declare-fun b!1071195 () Bool)

(declare-fun e!611633 () Bool)

(assert (=> b!1071195 (= e!611633 true)))

(declare-fun lt!473749 () ListLongMap!14507)

(declare-fun lt!473753 () ListLongMap!14507)

(declare-fun -!665 (ListLongMap!14507 (_ BitVec 64)) ListLongMap!14507)

(assert (=> b!1071195 (= lt!473749 (-!665 lt!473753 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473752 () ListLongMap!14507)

(declare-fun lt!473745 () ListLongMap!14507)

(assert (=> b!1071195 (= lt!473752 lt!473745)))

(declare-fun lt!473746 () ListLongMap!14507)

(declare-fun zeroValueBefore!47 () V!39553)

(declare-fun minValue!907 () V!39553)

(declare-datatypes ((Unit!35117 0))(
  ( (Unit!35118) )
))
(declare-fun lt!473751 () Unit!35117)

(declare-fun addCommutativeForDiffKeys!723 (ListLongMap!14507 (_ BitVec 64) V!39553 (_ BitVec 64) V!39553) Unit!35117)

(assert (=> b!1071195 (= lt!473751 (addCommutativeForDiffKeys!723 lt!473746 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473744 () ListLongMap!14507)

(assert (=> b!1071195 (= (-!665 lt!473745 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473744)))

(declare-fun lt!473754 () tuple2!16538)

(assert (=> b!1071195 (= lt!473745 (+!3205 lt!473744 lt!473754))))

(declare-fun lt!473743 () Unit!35117)

(declare-fun addThenRemoveForNewKeyIsSame!46 (ListLongMap!14507 (_ BitVec 64) V!39553) Unit!35117)

(assert (=> b!1071195 (= lt!473743 (addThenRemoveForNewKeyIsSame!46 lt!473744 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071195 (= lt!473744 (+!3205 lt!473746 lt!473747))))

(assert (=> b!1071195 e!611629))

(declare-fun res!714612 () Bool)

(assert (=> b!1071195 (=> (not res!714612) (not e!611629))))

(assert (=> b!1071195 (= res!714612 (= lt!473753 lt!473752))))

(assert (=> b!1071195 (= lt!473752 (+!3205 (+!3205 lt!473746 lt!473754) lt!473747))))

(assert (=> b!1071195 (= lt!473747 (tuple2!16539 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071195 (= lt!473754 (tuple2!16539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12203 0))(
  ( (ValueCellFull!12203 (v!15572 V!39553)) (EmptyCell!12203) )
))
(declare-datatypes ((array!68538 0))(
  ( (array!68539 (arr!32965 (Array (_ BitVec 32) ValueCell!12203)) (size!33503 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68538)

(declare-datatypes ((array!68540 0))(
  ( (array!68541 (arr!32966 (Array (_ BitVec 32) (_ BitVec 64))) (size!33504 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68540)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39553)

(declare-fun getCurrentListMap!4078 (array!68540 array!68538 (_ BitVec 32) (_ BitVec 32) V!39553 V!39553 (_ BitVec 32) Int) ListLongMap!14507)

(assert (=> b!1071195 (= lt!473742 (getCurrentListMap!4078 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071195 (= lt!473753 (getCurrentListMap!4078 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40426 () Bool)

(declare-fun mapRes!40426 () Bool)

(declare-fun tp!77468 () Bool)

(assert (=> mapNonEmpty!40426 (= mapRes!40426 (and tp!77468 e!611631))))

(declare-fun mapRest!40426 () (Array (_ BitVec 32) ValueCell!12203))

(declare-fun mapValue!40426 () ValueCell!12203)

(declare-fun mapKey!40426 () (_ BitVec 32))

(assert (=> mapNonEmpty!40426 (= (arr!32965 _values!955) (store mapRest!40426 mapKey!40426 mapValue!40426))))

(declare-fun b!1071196 () Bool)

(declare-fun res!714611 () Bool)

(declare-fun e!611630 () Bool)

(assert (=> b!1071196 (=> (not res!714611) (not e!611630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68540 (_ BitVec 32)) Bool)

(assert (=> b!1071196 (= res!714611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071197 () Bool)

(declare-fun res!714613 () Bool)

(assert (=> b!1071197 (=> (not res!714613) (not e!611630))))

(assert (=> b!1071197 (= res!714613 (and (= (size!33503 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33504 _keys!1163) (size!33503 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071192 () Bool)

(declare-fun e!611632 () Bool)

(declare-fun e!611627 () Bool)

(assert (=> b!1071192 (= e!611632 (and e!611627 mapRes!40426))))

(declare-fun condMapEmpty!40426 () Bool)

(declare-fun mapDefault!40426 () ValueCell!12203)

(assert (=> b!1071192 (= condMapEmpty!40426 (= (arr!32965 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12203)) mapDefault!40426)))))

(declare-fun res!714610 () Bool)

(assert (=> start!94744 (=> (not res!714610) (not e!611630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94744 (= res!714610 (validMask!0 mask!1515))))

(assert (=> start!94744 e!611630))

(assert (=> start!94744 true))

(assert (=> start!94744 tp_is_empty!25813))

(declare-fun array_inv!25500 (array!68538) Bool)

(assert (=> start!94744 (and (array_inv!25500 _values!955) e!611632)))

(assert (=> start!94744 tp!77467))

(declare-fun array_inv!25501 (array!68540) Bool)

(assert (=> start!94744 (array_inv!25501 _keys!1163)))

(declare-fun mapIsEmpty!40426 () Bool)

(assert (=> mapIsEmpty!40426 mapRes!40426))

(declare-fun b!1071198 () Bool)

(declare-fun res!714609 () Bool)

(assert (=> b!1071198 (=> (not res!714609) (not e!611630))))

(declare-datatypes ((List!23066 0))(
  ( (Nil!23063) (Cons!23062 (h!24271 (_ BitVec 64)) (t!32390 List!23066)) )
))
(declare-fun arrayNoDuplicates!0 (array!68540 (_ BitVec 32) List!23066) Bool)

(assert (=> b!1071198 (= res!714609 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23063))))

(declare-fun b!1071199 () Bool)

(assert (=> b!1071199 (= e!611630 (not e!611633))))

(declare-fun res!714608 () Bool)

(assert (=> b!1071199 (=> res!714608 e!611633)))

(assert (=> b!1071199 (= res!714608 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071199 (= lt!473746 lt!473748)))

(declare-fun lt!473750 () Unit!35117)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!847 (array!68540 array!68538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39553 V!39553 V!39553 V!39553 (_ BitVec 32) Int) Unit!35117)

(assert (=> b!1071199 (= lt!473750 (lemmaNoChangeToArrayThenSameMapNoExtras!847 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3853 (array!68540 array!68538 (_ BitVec 32) (_ BitVec 32) V!39553 V!39553 (_ BitVec 32) Int) ListLongMap!14507)

(assert (=> b!1071199 (= lt!473748 (getCurrentListMapNoExtraKeys!3853 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071199 (= lt!473746 (getCurrentListMapNoExtraKeys!3853 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071200 () Bool)

(assert (=> b!1071200 (= e!611627 tp_is_empty!25813)))

(assert (= (and start!94744 res!714610) b!1071197))

(assert (= (and b!1071197 res!714613) b!1071196))

(assert (= (and b!1071196 res!714611) b!1071198))

(assert (= (and b!1071198 res!714609) b!1071199))

(assert (= (and b!1071199 (not res!714608)) b!1071195))

(assert (= (and b!1071195 res!714612) b!1071194))

(assert (= (and b!1071192 condMapEmpty!40426) mapIsEmpty!40426))

(assert (= (and b!1071192 (not condMapEmpty!40426)) mapNonEmpty!40426))

(get-info :version)

(assert (= (and mapNonEmpty!40426 ((_ is ValueCellFull!12203) mapValue!40426)) b!1071193))

(assert (= (and b!1071192 ((_ is ValueCellFull!12203) mapDefault!40426)) b!1071200))

(assert (= start!94744 b!1071192))

(declare-fun m!989183 () Bool)

(assert (=> b!1071195 m!989183))

(assert (=> b!1071195 m!989183))

(declare-fun m!989185 () Bool)

(assert (=> b!1071195 m!989185))

(declare-fun m!989187 () Bool)

(assert (=> b!1071195 m!989187))

(declare-fun m!989189 () Bool)

(assert (=> b!1071195 m!989189))

(declare-fun m!989191 () Bool)

(assert (=> b!1071195 m!989191))

(declare-fun m!989193 () Bool)

(assert (=> b!1071195 m!989193))

(declare-fun m!989195 () Bool)

(assert (=> b!1071195 m!989195))

(declare-fun m!989197 () Bool)

(assert (=> b!1071195 m!989197))

(declare-fun m!989199 () Bool)

(assert (=> b!1071195 m!989199))

(declare-fun m!989201 () Bool)

(assert (=> b!1071195 m!989201))

(declare-fun m!989203 () Bool)

(assert (=> b!1071198 m!989203))

(declare-fun m!989205 () Bool)

(assert (=> mapNonEmpty!40426 m!989205))

(declare-fun m!989207 () Bool)

(assert (=> start!94744 m!989207))

(declare-fun m!989209 () Bool)

(assert (=> start!94744 m!989209))

(declare-fun m!989211 () Bool)

(assert (=> start!94744 m!989211))

(declare-fun m!989213 () Bool)

(assert (=> b!1071196 m!989213))

(declare-fun m!989215 () Bool)

(assert (=> b!1071194 m!989215))

(declare-fun m!989217 () Bool)

(assert (=> b!1071199 m!989217))

(declare-fun m!989219 () Bool)

(assert (=> b!1071199 m!989219))

(declare-fun m!989221 () Bool)

(assert (=> b!1071199 m!989221))

(check-sat (not b!1071198) (not start!94744) (not b!1071199) (not mapNonEmpty!40426) (not b!1071194) tp_is_empty!25813 (not b_next!22003) (not b!1071196) b_and!34807 (not b!1071195))
(check-sat b_and!34807 (not b_next!22003))
