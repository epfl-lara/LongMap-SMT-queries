; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94660 () Bool)

(assert start!94660)

(declare-fun b_free!21751 () Bool)

(declare-fun b_next!21751 () Bool)

(assert (=> start!94660 (= b_free!21751 (not b_next!21751))))

(declare-fun tp!76700 () Bool)

(declare-fun b_and!34553 () Bool)

(assert (=> start!94660 (= tp!76700 b_and!34553)))

(declare-fun b!1068966 () Bool)

(declare-fun res!712965 () Bool)

(declare-fun e!609824 () Bool)

(assert (=> b!1068966 (=> (not res!712965) (not e!609824))))

(declare-datatypes ((array!68149 0))(
  ( (array!68150 (arr!32768 (Array (_ BitVec 32) (_ BitVec 64))) (size!33305 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68149)

(declare-datatypes ((List!22831 0))(
  ( (Nil!22828) (Cons!22827 (h!24045 (_ BitVec 64)) (t!32148 List!22831)) )
))
(declare-fun arrayNoDuplicates!0 (array!68149 (_ BitVec 32) List!22831) Bool)

(assert (=> b!1068966 (= res!712965 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22828))))

(declare-fun b!1068967 () Bool)

(declare-fun res!712968 () Bool)

(assert (=> b!1068967 (=> (not res!712968) (not e!609824))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39217 0))(
  ( (V!39218 (val!12831 Int)) )
))
(declare-datatypes ((ValueCell!12077 0))(
  ( (ValueCellFull!12077 (v!15441 V!39217)) (EmptyCell!12077) )
))
(declare-datatypes ((array!68151 0))(
  ( (array!68152 (arr!32769 (Array (_ BitVec 32) ValueCell!12077)) (size!33306 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68151)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068967 (= res!712968 (and (= (size!33306 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33305 _keys!1163) (size!33306 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068968 () Bool)

(declare-fun e!609828 () Bool)

(assert (=> b!1068968 (= e!609824 (not e!609828))))

(declare-fun res!712966 () Bool)

(assert (=> b!1068968 (=> res!712966 e!609828)))

(assert (=> b!1068968 (= res!712966 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16260 0))(
  ( (tuple2!16261 (_1!8141 (_ BitVec 64)) (_2!8141 V!39217)) )
))
(declare-datatypes ((List!22832 0))(
  ( (Nil!22829) (Cons!22828 (h!24046 tuple2!16260) (t!32149 List!22832)) )
))
(declare-datatypes ((ListLongMap!14237 0))(
  ( (ListLongMap!14238 (toList!7134 List!22832)) )
))
(declare-fun lt!472059 () ListLongMap!14237)

(declare-fun lt!472058 () ListLongMap!14237)

(assert (=> b!1068968 (= lt!472059 lt!472058)))

(declare-datatypes ((Unit!35064 0))(
  ( (Unit!35065) )
))
(declare-fun lt!472062 () Unit!35064)

(declare-fun minValue!907 () V!39217)

(declare-fun zeroValueBefore!47 () V!39217)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39217)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!755 (array!68149 array!68151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39217 V!39217 V!39217 V!39217 (_ BitVec 32) Int) Unit!35064)

(assert (=> b!1068968 (= lt!472062 (lemmaNoChangeToArrayThenSameMapNoExtras!755 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3752 (array!68149 array!68151 (_ BitVec 32) (_ BitVec 32) V!39217 V!39217 (_ BitVec 32) Int) ListLongMap!14237)

(assert (=> b!1068968 (= lt!472058 (getCurrentListMapNoExtraKeys!3752 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068968 (= lt!472059 (getCurrentListMapNoExtraKeys!3752 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068969 () Bool)

(declare-fun e!609823 () Bool)

(assert (=> b!1068969 (= e!609823 true)))

(declare-fun lt!472061 () ListLongMap!14237)

(declare-fun -!625 (ListLongMap!14237 (_ BitVec 64)) ListLongMap!14237)

(assert (=> b!1068969 (= (-!625 lt!472061 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472061)))

(declare-fun lt!472060 () Unit!35064)

(declare-fun removeNotPresentStillSame!42 (ListLongMap!14237 (_ BitVec 64)) Unit!35064)

(assert (=> b!1068969 (= lt!472060 (removeNotPresentStillSame!42 lt!472061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40036 () Bool)

(declare-fun mapRes!40036 () Bool)

(assert (=> mapIsEmpty!40036 mapRes!40036))

(declare-fun b!1068971 () Bool)

(declare-fun e!609825 () Bool)

(declare-fun tp_is_empty!25561 () Bool)

(assert (=> b!1068971 (= e!609825 tp_is_empty!25561)))

(declare-fun mapNonEmpty!40036 () Bool)

(declare-fun tp!76699 () Bool)

(declare-fun e!609827 () Bool)

(assert (=> mapNonEmpty!40036 (= mapRes!40036 (and tp!76699 e!609827))))

(declare-fun mapRest!40036 () (Array (_ BitVec 32) ValueCell!12077))

(declare-fun mapKey!40036 () (_ BitVec 32))

(declare-fun mapValue!40036 () ValueCell!12077)

(assert (=> mapNonEmpty!40036 (= (arr!32769 _values!955) (store mapRest!40036 mapKey!40036 mapValue!40036))))

(declare-fun b!1068972 () Bool)

(declare-fun e!609829 () Bool)

(assert (=> b!1068972 (= e!609829 (and e!609825 mapRes!40036))))

(declare-fun condMapEmpty!40036 () Bool)

(declare-fun mapDefault!40036 () ValueCell!12077)

(assert (=> b!1068972 (= condMapEmpty!40036 (= (arr!32769 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12077)) mapDefault!40036)))))

(declare-fun b!1068973 () Bool)

(assert (=> b!1068973 (= e!609828 e!609823)))

(declare-fun res!712963 () Bool)

(assert (=> b!1068973 (=> res!712963 e!609823)))

(declare-fun contains!6299 (ListLongMap!14237 (_ BitVec 64)) Bool)

(assert (=> b!1068973 (= res!712963 (contains!6299 lt!472061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4062 (array!68149 array!68151 (_ BitVec 32) (_ BitVec 32) V!39217 V!39217 (_ BitVec 32) Int) ListLongMap!14237)

(assert (=> b!1068973 (= lt!472061 (getCurrentListMap!4062 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068974 () Bool)

(assert (=> b!1068974 (= e!609827 tp_is_empty!25561)))

(declare-fun b!1068970 () Bool)

(declare-fun res!712964 () Bool)

(assert (=> b!1068970 (=> (not res!712964) (not e!609824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68149 (_ BitVec 32)) Bool)

(assert (=> b!1068970 (= res!712964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!712967 () Bool)

(assert (=> start!94660 (=> (not res!712967) (not e!609824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94660 (= res!712967 (validMask!0 mask!1515))))

(assert (=> start!94660 e!609824))

(assert (=> start!94660 true))

(assert (=> start!94660 tp_is_empty!25561))

(declare-fun array_inv!25390 (array!68151) Bool)

(assert (=> start!94660 (and (array_inv!25390 _values!955) e!609829)))

(assert (=> start!94660 tp!76700))

(declare-fun array_inv!25391 (array!68149) Bool)

(assert (=> start!94660 (array_inv!25391 _keys!1163)))

(assert (= (and start!94660 res!712967) b!1068967))

(assert (= (and b!1068967 res!712968) b!1068970))

(assert (= (and b!1068970 res!712964) b!1068966))

(assert (= (and b!1068966 res!712965) b!1068968))

(assert (= (and b!1068968 (not res!712966)) b!1068973))

(assert (= (and b!1068973 (not res!712963)) b!1068969))

(assert (= (and b!1068972 condMapEmpty!40036) mapIsEmpty!40036))

(assert (= (and b!1068972 (not condMapEmpty!40036)) mapNonEmpty!40036))

(get-info :version)

(assert (= (and mapNonEmpty!40036 ((_ is ValueCellFull!12077) mapValue!40036)) b!1068974))

(assert (= (and b!1068972 ((_ is ValueCellFull!12077) mapDefault!40036)) b!1068971))

(assert (= start!94660 b!1068972))

(declare-fun m!987937 () Bool)

(assert (=> mapNonEmpty!40036 m!987937))

(declare-fun m!987939 () Bool)

(assert (=> b!1068973 m!987939))

(declare-fun m!987941 () Bool)

(assert (=> b!1068973 m!987941))

(declare-fun m!987943 () Bool)

(assert (=> start!94660 m!987943))

(declare-fun m!987945 () Bool)

(assert (=> start!94660 m!987945))

(declare-fun m!987947 () Bool)

(assert (=> start!94660 m!987947))

(declare-fun m!987949 () Bool)

(assert (=> b!1068966 m!987949))

(declare-fun m!987951 () Bool)

(assert (=> b!1068968 m!987951))

(declare-fun m!987953 () Bool)

(assert (=> b!1068968 m!987953))

(declare-fun m!987955 () Bool)

(assert (=> b!1068968 m!987955))

(declare-fun m!987957 () Bool)

(assert (=> b!1068970 m!987957))

(declare-fun m!987959 () Bool)

(assert (=> b!1068969 m!987959))

(declare-fun m!987961 () Bool)

(assert (=> b!1068969 m!987961))

(check-sat tp_is_empty!25561 (not mapNonEmpty!40036) (not b!1068973) (not b!1068970) (not b!1068966) (not b!1068969) (not b!1068968) (not b_next!21751) (not start!94660) b_and!34553)
(check-sat b_and!34553 (not b_next!21751))
