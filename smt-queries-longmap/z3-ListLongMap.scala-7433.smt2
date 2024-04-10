; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94450 () Bool)

(assert start!94450)

(declare-fun b_free!21777 () Bool)

(declare-fun b_next!21777 () Bool)

(assert (=> start!94450 (= b_free!21777 (not b_next!21777))))

(declare-fun tp!76777 () Bool)

(declare-fun b_and!34569 () Bool)

(assert (=> start!94450 (= tp!76777 b_and!34569)))

(declare-fun b!1067990 () Bool)

(declare-fun e!609241 () Bool)

(declare-fun tp_is_empty!25587 () Bool)

(assert (=> b!1067990 (= e!609241 tp_is_empty!25587)))

(declare-fun b!1067991 () Bool)

(declare-fun e!609244 () Bool)

(declare-fun e!609243 () Bool)

(assert (=> b!1067991 (= e!609244 e!609243)))

(declare-fun res!712678 () Bool)

(assert (=> b!1067991 (=> res!712678 e!609243)))

(declare-datatypes ((V!39251 0))(
  ( (V!39252 (val!12844 Int)) )
))
(declare-datatypes ((tuple2!16308 0))(
  ( (tuple2!16309 (_1!8165 (_ BitVec 64)) (_2!8165 V!39251)) )
))
(declare-datatypes ((List!22862 0))(
  ( (Nil!22859) (Cons!22858 (h!24067 tuple2!16308) (t!32187 List!22862)) )
))
(declare-datatypes ((ListLongMap!14277 0))(
  ( (ListLongMap!14278 (toList!7154 List!22862)) )
))
(declare-fun lt!471740 () ListLongMap!14277)

(declare-fun contains!6289 (ListLongMap!14277 (_ BitVec 64)) Bool)

(assert (=> b!1067991 (= res!712678 (contains!6289 lt!471740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39251)

(declare-datatypes ((ValueCell!12090 0))(
  ( (ValueCellFull!12090 (v!15458 V!39251)) (EmptyCell!12090) )
))
(declare-datatypes ((array!68157 0))(
  ( (array!68158 (arr!32778 (Array (_ BitVec 32) ValueCell!12090)) (size!33314 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68157)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39251)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68159 0))(
  ( (array!68160 (arr!32779 (Array (_ BitVec 32) (_ BitVec 64))) (size!33315 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68159)

(declare-fun getCurrentListMap!4086 (array!68159 array!68157 (_ BitVec 32) (_ BitVec 32) V!39251 V!39251 (_ BitVec 32) Int) ListLongMap!14277)

(assert (=> b!1067991 (= lt!471740 (getCurrentListMap!4086 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40075 () Bool)

(declare-fun mapRes!40075 () Bool)

(assert (=> mapIsEmpty!40075 mapRes!40075))

(declare-fun mapNonEmpty!40075 () Bool)

(declare-fun tp!76778 () Bool)

(assert (=> mapNonEmpty!40075 (= mapRes!40075 (and tp!76778 e!609241))))

(declare-fun mapKey!40075 () (_ BitVec 32))

(declare-fun mapValue!40075 () ValueCell!12090)

(declare-fun mapRest!40075 () (Array (_ BitVec 32) ValueCell!12090))

(assert (=> mapNonEmpty!40075 (= (arr!32778 _values!955) (store mapRest!40075 mapKey!40075 mapValue!40075))))

(declare-fun res!712679 () Bool)

(declare-fun e!609242 () Bool)

(assert (=> start!94450 (=> (not res!712679) (not e!609242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94450 (= res!712679 (validMask!0 mask!1515))))

(assert (=> start!94450 e!609242))

(assert (=> start!94450 true))

(assert (=> start!94450 tp_is_empty!25587))

(declare-fun e!609246 () Bool)

(declare-fun array_inv!25378 (array!68157) Bool)

(assert (=> start!94450 (and (array_inv!25378 _values!955) e!609246)))

(assert (=> start!94450 tp!76777))

(declare-fun array_inv!25379 (array!68159) Bool)

(assert (=> start!94450 (array_inv!25379 _keys!1163)))

(declare-fun b!1067992 () Bool)

(declare-fun res!712680 () Bool)

(assert (=> b!1067992 (=> (not res!712680) (not e!609242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68159 (_ BitVec 32)) Bool)

(assert (=> b!1067992 (= res!712680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067993 () Bool)

(declare-fun e!609245 () Bool)

(assert (=> b!1067993 (= e!609246 (and e!609245 mapRes!40075))))

(declare-fun condMapEmpty!40075 () Bool)

(declare-fun mapDefault!40075 () ValueCell!12090)

(assert (=> b!1067993 (= condMapEmpty!40075 (= (arr!32778 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12090)) mapDefault!40075)))))

(declare-fun b!1067994 () Bool)

(assert (=> b!1067994 (= e!609242 (not e!609244))))

(declare-fun res!712675 () Bool)

(assert (=> b!1067994 (=> res!712675 e!609244)))

(assert (=> b!1067994 (= res!712675 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471741 () ListLongMap!14277)

(declare-fun lt!471742 () ListLongMap!14277)

(assert (=> b!1067994 (= lt!471741 lt!471742)))

(declare-fun zeroValueAfter!47 () V!39251)

(declare-datatypes ((Unit!35105 0))(
  ( (Unit!35106) )
))
(declare-fun lt!471739 () Unit!35105)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!772 (array!68159 array!68157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39251 V!39251 V!39251 V!39251 (_ BitVec 32) Int) Unit!35105)

(assert (=> b!1067994 (= lt!471739 (lemmaNoChangeToArrayThenSameMapNoExtras!772 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3735 (array!68159 array!68157 (_ BitVec 32) (_ BitVec 32) V!39251 V!39251 (_ BitVec 32) Int) ListLongMap!14277)

(assert (=> b!1067994 (= lt!471742 (getCurrentListMapNoExtraKeys!3735 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067994 (= lt!471741 (getCurrentListMapNoExtraKeys!3735 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067995 () Bool)

(assert (=> b!1067995 (= e!609243 true)))

(declare-fun -!639 (ListLongMap!14277 (_ BitVec 64)) ListLongMap!14277)

(assert (=> b!1067995 (= (-!639 lt!471740 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471740)))

(declare-fun lt!471738 () Unit!35105)

(declare-fun removeNotPresentStillSame!49 (ListLongMap!14277 (_ BitVec 64)) Unit!35105)

(assert (=> b!1067995 (= lt!471738 (removeNotPresentStillSame!49 lt!471740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067996 () Bool)

(declare-fun res!712676 () Bool)

(assert (=> b!1067996 (=> (not res!712676) (not e!609242))))

(assert (=> b!1067996 (= res!712676 (and (= (size!33314 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33315 _keys!1163) (size!33314 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067997 () Bool)

(assert (=> b!1067997 (= e!609245 tp_is_empty!25587)))

(declare-fun b!1067998 () Bool)

(declare-fun res!712677 () Bool)

(assert (=> b!1067998 (=> (not res!712677) (not e!609242))))

(declare-datatypes ((List!22863 0))(
  ( (Nil!22860) (Cons!22859 (h!24068 (_ BitVec 64)) (t!32188 List!22863)) )
))
(declare-fun arrayNoDuplicates!0 (array!68159 (_ BitVec 32) List!22863) Bool)

(assert (=> b!1067998 (= res!712677 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22860))))

(assert (= (and start!94450 res!712679) b!1067996))

(assert (= (and b!1067996 res!712676) b!1067992))

(assert (= (and b!1067992 res!712680) b!1067998))

(assert (= (and b!1067998 res!712677) b!1067994))

(assert (= (and b!1067994 (not res!712675)) b!1067991))

(assert (= (and b!1067991 (not res!712678)) b!1067995))

(assert (= (and b!1067993 condMapEmpty!40075) mapIsEmpty!40075))

(assert (= (and b!1067993 (not condMapEmpty!40075)) mapNonEmpty!40075))

(get-info :version)

(assert (= (and mapNonEmpty!40075 ((_ is ValueCellFull!12090) mapValue!40075)) b!1067990))

(assert (= (and b!1067993 ((_ is ValueCellFull!12090) mapDefault!40075)) b!1067997))

(assert (= start!94450 b!1067993))

(declare-fun m!986603 () Bool)

(assert (=> start!94450 m!986603))

(declare-fun m!986605 () Bool)

(assert (=> start!94450 m!986605))

(declare-fun m!986607 () Bool)

(assert (=> start!94450 m!986607))

(declare-fun m!986609 () Bool)

(assert (=> b!1067991 m!986609))

(declare-fun m!986611 () Bool)

(assert (=> b!1067991 m!986611))

(declare-fun m!986613 () Bool)

(assert (=> b!1067995 m!986613))

(declare-fun m!986615 () Bool)

(assert (=> b!1067995 m!986615))

(declare-fun m!986617 () Bool)

(assert (=> mapNonEmpty!40075 m!986617))

(declare-fun m!986619 () Bool)

(assert (=> b!1067992 m!986619))

(declare-fun m!986621 () Bool)

(assert (=> b!1067998 m!986621))

(declare-fun m!986623 () Bool)

(assert (=> b!1067994 m!986623))

(declare-fun m!986625 () Bool)

(assert (=> b!1067994 m!986625))

(declare-fun m!986627 () Bool)

(assert (=> b!1067994 m!986627))

(check-sat b_and!34569 tp_is_empty!25587 (not b!1067992) (not mapNonEmpty!40075) (not b!1067991) (not b!1067995) (not b!1067994) (not b_next!21777) (not b!1067998) (not start!94450))
(check-sat b_and!34569 (not b_next!21777))
