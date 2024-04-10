; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95100 () Bool)

(assert start!95100)

(declare-fun b_free!22197 () Bool)

(declare-fun b_next!22197 () Bool)

(assert (=> start!95100 (= b_free!22197 (not b_next!22197))))

(declare-fun tp!78073 () Bool)

(declare-fun b_and!35117 () Bool)

(assert (=> start!95100 (= tp!78073 b_and!35117)))

(declare-fun b!1075063 () Bool)

(declare-fun res!716752 () Bool)

(declare-fun e!614369 () Bool)

(assert (=> b!1075063 (=> (not res!716752) (not e!614369))))

(declare-datatypes ((array!68981 0))(
  ( (array!68982 (arr!33178 (Array (_ BitVec 32) (_ BitVec 64))) (size!33714 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68981)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68981 (_ BitVec 32)) Bool)

(assert (=> b!1075063 (= res!716752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075064 () Bool)

(declare-fun e!614371 () Bool)

(declare-fun tp_is_empty!26007 () Bool)

(assert (=> b!1075064 (= e!614371 tp_is_empty!26007)))

(declare-fun b!1075065 () Bool)

(declare-fun e!614372 () Bool)

(declare-fun e!614370 () Bool)

(declare-fun mapRes!40741 () Bool)

(assert (=> b!1075065 (= e!614372 (and e!614370 mapRes!40741))))

(declare-fun condMapEmpty!40741 () Bool)

(declare-datatypes ((V!39811 0))(
  ( (V!39812 (val!13054 Int)) )
))
(declare-datatypes ((ValueCell!12300 0))(
  ( (ValueCellFull!12300 (v!15677 V!39811)) (EmptyCell!12300) )
))
(declare-datatypes ((array!68983 0))(
  ( (array!68984 (arr!33179 (Array (_ BitVec 32) ValueCell!12300)) (size!33715 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68983)

(declare-fun mapDefault!40741 () ValueCell!12300)

(assert (=> b!1075065 (= condMapEmpty!40741 (= (arr!33179 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12300)) mapDefault!40741)))))

(declare-fun b!1075066 () Bool)

(assert (=> b!1075066 (= e!614370 tp_is_empty!26007)))

(declare-fun b!1075067 () Bool)

(declare-fun e!614368 () Bool)

(assert (=> b!1075067 (= e!614368 true)))

(declare-datatypes ((tuple2!16632 0))(
  ( (tuple2!16633 (_1!8327 (_ BitVec 64)) (_2!8327 V!39811)) )
))
(declare-datatypes ((List!23166 0))(
  ( (Nil!23163) (Cons!23162 (h!24371 tuple2!16632) (t!32515 List!23166)) )
))
(declare-datatypes ((ListLongMap!14601 0))(
  ( (ListLongMap!14602 (toList!7316 List!23166)) )
))
(declare-fun lt!477124 () ListLongMap!14601)

(declare-fun lt!477122 () ListLongMap!14601)

(declare-fun -!712 (ListLongMap!14601 (_ BitVec 64)) ListLongMap!14601)

(assert (=> b!1075067 (= lt!477124 (-!712 lt!477122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!477123 () ListLongMap!14601)

(declare-fun lt!477118 () ListLongMap!14601)

(assert (=> b!1075067 (= (-!712 lt!477123 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477118)))

(declare-datatypes ((Unit!35400 0))(
  ( (Unit!35401) )
))
(declare-fun lt!477120 () Unit!35400)

(declare-fun zeroValueBefore!47 () V!39811)

(declare-fun addThenRemoveForNewKeyIsSame!79 (ListLongMap!14601 (_ BitVec 64) V!39811) Unit!35400)

(assert (=> b!1075067 (= lt!477120 (addThenRemoveForNewKeyIsSame!79 lt!477118 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!477125 () ListLongMap!14601)

(declare-fun lt!477121 () ListLongMap!14601)

(assert (=> b!1075067 (and (= lt!477122 lt!477123) (= lt!477121 lt!477125))))

(declare-fun +!3224 (ListLongMap!14601 tuple2!16632) ListLongMap!14601)

(assert (=> b!1075067 (= lt!477123 (+!3224 lt!477118 (tuple2!16633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39811)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39811)

(declare-fun getCurrentListMap!4185 (array!68981 array!68983 (_ BitVec 32) (_ BitVec 32) V!39811 V!39811 (_ BitVec 32) Int) ListLongMap!14601)

(assert (=> b!1075067 (= lt!477121 (getCurrentListMap!4185 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075067 (= lt!477122 (getCurrentListMap!4185 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40741 () Bool)

(declare-fun tp!78074 () Bool)

(assert (=> mapNonEmpty!40741 (= mapRes!40741 (and tp!78074 e!614371))))

(declare-fun mapKey!40741 () (_ BitVec 32))

(declare-fun mapValue!40741 () ValueCell!12300)

(declare-fun mapRest!40741 () (Array (_ BitVec 32) ValueCell!12300))

(assert (=> mapNonEmpty!40741 (= (arr!33179 _values!955) (store mapRest!40741 mapKey!40741 mapValue!40741))))

(declare-fun mapIsEmpty!40741 () Bool)

(assert (=> mapIsEmpty!40741 mapRes!40741))

(declare-fun res!716750 () Bool)

(assert (=> start!95100 (=> (not res!716750) (not e!614369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95100 (= res!716750 (validMask!0 mask!1515))))

(assert (=> start!95100 e!614369))

(assert (=> start!95100 true))

(assert (=> start!95100 tp_is_empty!26007))

(declare-fun array_inv!25640 (array!68983) Bool)

(assert (=> start!95100 (and (array_inv!25640 _values!955) e!614372)))

(assert (=> start!95100 tp!78073))

(declare-fun array_inv!25641 (array!68981) Bool)

(assert (=> start!95100 (array_inv!25641 _keys!1163)))

(declare-fun b!1075068 () Bool)

(assert (=> b!1075068 (= e!614369 (not e!614368))))

(declare-fun res!716751 () Bool)

(assert (=> b!1075068 (=> res!716751 e!614368)))

(assert (=> b!1075068 (= res!716751 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075068 (= lt!477118 lt!477125)))

(declare-fun lt!477119 () Unit!35400)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!895 (array!68981 array!68983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39811 V!39811 V!39811 V!39811 (_ BitVec 32) Int) Unit!35400)

(assert (=> b!1075068 (= lt!477119 (lemmaNoChangeToArrayThenSameMapNoExtras!895 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3879 (array!68981 array!68983 (_ BitVec 32) (_ BitVec 32) V!39811 V!39811 (_ BitVec 32) Int) ListLongMap!14601)

(assert (=> b!1075068 (= lt!477125 (getCurrentListMapNoExtraKeys!3879 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075068 (= lt!477118 (getCurrentListMapNoExtraKeys!3879 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075069 () Bool)

(declare-fun res!716749 () Bool)

(assert (=> b!1075069 (=> (not res!716749) (not e!614369))))

(declare-datatypes ((List!23167 0))(
  ( (Nil!23164) (Cons!23163 (h!24372 (_ BitVec 64)) (t!32516 List!23167)) )
))
(declare-fun arrayNoDuplicates!0 (array!68981 (_ BitVec 32) List!23167) Bool)

(assert (=> b!1075069 (= res!716749 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23164))))

(declare-fun b!1075070 () Bool)

(declare-fun res!716748 () Bool)

(assert (=> b!1075070 (=> (not res!716748) (not e!614369))))

(assert (=> b!1075070 (= res!716748 (and (= (size!33715 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33714 _keys!1163) (size!33715 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!95100 res!716750) b!1075070))

(assert (= (and b!1075070 res!716748) b!1075063))

(assert (= (and b!1075063 res!716752) b!1075069))

(assert (= (and b!1075069 res!716749) b!1075068))

(assert (= (and b!1075068 (not res!716751)) b!1075067))

(assert (= (and b!1075065 condMapEmpty!40741) mapIsEmpty!40741))

(assert (= (and b!1075065 (not condMapEmpty!40741)) mapNonEmpty!40741))

(get-info :version)

(assert (= (and mapNonEmpty!40741 ((_ is ValueCellFull!12300) mapValue!40741)) b!1075064))

(assert (= (and b!1075065 ((_ is ValueCellFull!12300) mapDefault!40741)) b!1075066))

(assert (= start!95100 b!1075065))

(declare-fun m!993925 () Bool)

(assert (=> b!1075069 m!993925))

(declare-fun m!993927 () Bool)

(assert (=> b!1075068 m!993927))

(declare-fun m!993929 () Bool)

(assert (=> b!1075068 m!993929))

(declare-fun m!993931 () Bool)

(assert (=> b!1075068 m!993931))

(declare-fun m!993933 () Bool)

(assert (=> start!95100 m!993933))

(declare-fun m!993935 () Bool)

(assert (=> start!95100 m!993935))

(declare-fun m!993937 () Bool)

(assert (=> start!95100 m!993937))

(declare-fun m!993939 () Bool)

(assert (=> b!1075063 m!993939))

(declare-fun m!993941 () Bool)

(assert (=> b!1075067 m!993941))

(declare-fun m!993943 () Bool)

(assert (=> b!1075067 m!993943))

(declare-fun m!993945 () Bool)

(assert (=> b!1075067 m!993945))

(declare-fun m!993947 () Bool)

(assert (=> b!1075067 m!993947))

(declare-fun m!993949 () Bool)

(assert (=> b!1075067 m!993949))

(declare-fun m!993951 () Bool)

(assert (=> b!1075067 m!993951))

(declare-fun m!993953 () Bool)

(assert (=> mapNonEmpty!40741 m!993953))

(check-sat (not b!1075069) (not b!1075063) (not b!1075067) (not mapNonEmpty!40741) tp_is_empty!26007 (not b!1075068) (not b_next!22197) (not start!95100) b_and!35117)
(check-sat b_and!35117 (not b_next!22197))
