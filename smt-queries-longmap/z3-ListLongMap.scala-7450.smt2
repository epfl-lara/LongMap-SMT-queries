; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94830 () Bool)

(assert start!94830)

(declare-fun b_free!21877 () Bool)

(declare-fun b_next!21877 () Bool)

(assert (=> start!94830 (= b_free!21877 (not b_next!21877))))

(declare-fun tp!77084 () Bool)

(declare-fun b_and!34699 () Bool)

(assert (=> start!94830 (= tp!77084 b_and!34699)))

(declare-fun b!1070923 () Bool)

(declare-fun e!611291 () Bool)

(declare-fun tp_is_empty!25687 () Bool)

(assert (=> b!1070923 (= e!611291 tp_is_empty!25687)))

(declare-fun b!1070924 () Bool)

(declare-fun res!714161 () Bool)

(declare-fun e!611288 () Bool)

(assert (=> b!1070924 (=> (not res!714161) (not e!611288))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39385 0))(
  ( (V!39386 (val!12894 Int)) )
))
(declare-datatypes ((ValueCell!12140 0))(
  ( (ValueCellFull!12140 (v!15506 V!39385)) (EmptyCell!12140) )
))
(declare-datatypes ((array!68389 0))(
  ( (array!68390 (arr!32886 (Array (_ BitVec 32) ValueCell!12140)) (size!33423 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68389)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68391 0))(
  ( (array!68392 (arr!32887 (Array (_ BitVec 32) (_ BitVec 64))) (size!33424 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68391)

(assert (=> b!1070924 (= res!714161 (and (= (size!33423 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33424 _keys!1163) (size!33423 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070925 () Bool)

(declare-fun res!714162 () Bool)

(assert (=> b!1070925 (=> (not res!714162) (not e!611288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68391 (_ BitVec 32)) Bool)

(assert (=> b!1070925 (= res!714162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070926 () Bool)

(declare-fun e!611289 () Bool)

(declare-fun e!611290 () Bool)

(declare-fun mapRes!40231 () Bool)

(assert (=> b!1070926 (= e!611289 (and e!611290 mapRes!40231))))

(declare-fun condMapEmpty!40231 () Bool)

(declare-fun mapDefault!40231 () ValueCell!12140)

(assert (=> b!1070926 (= condMapEmpty!40231 (= (arr!32886 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12140)) mapDefault!40231)))))

(declare-fun res!714163 () Bool)

(assert (=> start!94830 (=> (not res!714163) (not e!611288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94830 (= res!714163 (validMask!0 mask!1515))))

(assert (=> start!94830 e!611288))

(assert (=> start!94830 true))

(assert (=> start!94830 tp_is_empty!25687))

(declare-fun array_inv!25472 (array!68389) Bool)

(assert (=> start!94830 (and (array_inv!25472 _values!955) e!611289)))

(assert (=> start!94830 tp!77084))

(declare-fun array_inv!25473 (array!68391) Bool)

(assert (=> start!94830 (array_inv!25473 _keys!1163)))

(declare-fun b!1070927 () Bool)

(assert (=> b!1070927 (= e!611288 (not true))))

(declare-datatypes ((tuple2!16362 0))(
  ( (tuple2!16363 (_1!8192 (_ BitVec 64)) (_2!8192 V!39385)) )
))
(declare-datatypes ((List!22926 0))(
  ( (Nil!22923) (Cons!22922 (h!24140 tuple2!16362) (t!32247 List!22926)) )
))
(declare-datatypes ((ListLongMap!14339 0))(
  ( (ListLongMap!14340 (toList!7185 List!22926)) )
))
(declare-fun lt!473193 () ListLongMap!14339)

(declare-fun lt!473194 () ListLongMap!14339)

(assert (=> b!1070927 (= lt!473193 lt!473194)))

(declare-fun zeroValueBefore!47 () V!39385)

(declare-fun minValue!907 () V!39385)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39385)

(declare-datatypes ((Unit!35164 0))(
  ( (Unit!35165) )
))
(declare-fun lt!473195 () Unit!35164)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!800 (array!68391 array!68389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39385 V!39385 V!39385 V!39385 (_ BitVec 32) Int) Unit!35164)

(assert (=> b!1070927 (= lt!473195 (lemmaNoChangeToArrayThenSameMapNoExtras!800 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3797 (array!68391 array!68389 (_ BitVec 32) (_ BitVec 32) V!39385 V!39385 (_ BitVec 32) Int) ListLongMap!14339)

(assert (=> b!1070927 (= lt!473194 (getCurrentListMapNoExtraKeys!3797 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070927 (= lt!473193 (getCurrentListMapNoExtraKeys!3797 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40231 () Bool)

(assert (=> mapIsEmpty!40231 mapRes!40231))

(declare-fun b!1070928 () Bool)

(declare-fun res!714164 () Bool)

(assert (=> b!1070928 (=> (not res!714164) (not e!611288))))

(declare-datatypes ((List!22927 0))(
  ( (Nil!22924) (Cons!22923 (h!24141 (_ BitVec 64)) (t!32248 List!22927)) )
))
(declare-fun arrayNoDuplicates!0 (array!68391 (_ BitVec 32) List!22927) Bool)

(assert (=> b!1070928 (= res!714164 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22924))))

(declare-fun mapNonEmpty!40231 () Bool)

(declare-fun tp!77083 () Bool)

(assert (=> mapNonEmpty!40231 (= mapRes!40231 (and tp!77083 e!611291))))

(declare-fun mapValue!40231 () ValueCell!12140)

(declare-fun mapKey!40231 () (_ BitVec 32))

(declare-fun mapRest!40231 () (Array (_ BitVec 32) ValueCell!12140))

(assert (=> mapNonEmpty!40231 (= (arr!32886 _values!955) (store mapRest!40231 mapKey!40231 mapValue!40231))))

(declare-fun b!1070929 () Bool)

(assert (=> b!1070929 (= e!611290 tp_is_empty!25687)))

(assert (= (and start!94830 res!714163) b!1070924))

(assert (= (and b!1070924 res!714161) b!1070925))

(assert (= (and b!1070925 res!714162) b!1070928))

(assert (= (and b!1070928 res!714164) b!1070927))

(assert (= (and b!1070926 condMapEmpty!40231) mapIsEmpty!40231))

(assert (= (and b!1070926 (not condMapEmpty!40231)) mapNonEmpty!40231))

(get-info :version)

(assert (= (and mapNonEmpty!40231 ((_ is ValueCellFull!12140) mapValue!40231)) b!1070923))

(assert (= (and b!1070926 ((_ is ValueCellFull!12140) mapDefault!40231)) b!1070929))

(assert (= start!94830 b!1070926))

(declare-fun m!989755 () Bool)

(assert (=> b!1070925 m!989755))

(declare-fun m!989757 () Bool)

(assert (=> b!1070928 m!989757))

(declare-fun m!989759 () Bool)

(assert (=> mapNonEmpty!40231 m!989759))

(declare-fun m!989761 () Bool)

(assert (=> start!94830 m!989761))

(declare-fun m!989763 () Bool)

(assert (=> start!94830 m!989763))

(declare-fun m!989765 () Bool)

(assert (=> start!94830 m!989765))

(declare-fun m!989767 () Bool)

(assert (=> b!1070927 m!989767))

(declare-fun m!989769 () Bool)

(assert (=> b!1070927 m!989769))

(declare-fun m!989771 () Bool)

(assert (=> b!1070927 m!989771))

(check-sat (not mapNonEmpty!40231) (not b_next!21877) (not b!1070927) (not b!1070925) b_and!34699 (not start!94830) tp_is_empty!25687 (not b!1070928))
(check-sat b_and!34699 (not b_next!21877))
