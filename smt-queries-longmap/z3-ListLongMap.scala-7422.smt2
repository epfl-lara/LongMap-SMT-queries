; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94370 () Bool)

(assert start!94370)

(declare-fun b_free!21711 () Bool)

(declare-fun b_next!21711 () Bool)

(assert (=> start!94370 (= b_free!21711 (not b_next!21711))))

(declare-fun tp!76577 () Bool)

(declare-fun b_and!34495 () Bool)

(assert (=> start!94370 (= tp!76577 b_and!34495)))

(declare-fun b!1067121 () Bool)

(declare-fun res!712157 () Bool)

(declare-fun e!608603 () Bool)

(assert (=> b!1067121 (=> (not res!712157) (not e!608603))))

(declare-datatypes ((array!68027 0))(
  ( (array!68028 (arr!32714 (Array (_ BitVec 32) (_ BitVec 64))) (size!33250 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68027)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68027 (_ BitVec 32)) Bool)

(assert (=> b!1067121 (= res!712157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!712159 () Bool)

(assert (=> start!94370 (=> (not res!712159) (not e!608603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94370 (= res!712159 (validMask!0 mask!1515))))

(assert (=> start!94370 e!608603))

(assert (=> start!94370 true))

(declare-fun tp_is_empty!25521 () Bool)

(assert (=> start!94370 tp_is_empty!25521))

(declare-datatypes ((V!39163 0))(
  ( (V!39164 (val!12811 Int)) )
))
(declare-datatypes ((ValueCell!12057 0))(
  ( (ValueCellFull!12057 (v!15425 V!39163)) (EmptyCell!12057) )
))
(declare-datatypes ((array!68029 0))(
  ( (array!68030 (arr!32715 (Array (_ BitVec 32) ValueCell!12057)) (size!33251 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68029)

(declare-fun e!608601 () Bool)

(declare-fun array_inv!25328 (array!68029) Bool)

(assert (=> start!94370 (and (array_inv!25328 _values!955) e!608601)))

(assert (=> start!94370 tp!76577))

(declare-fun array_inv!25329 (array!68027) Bool)

(assert (=> start!94370 (array_inv!25329 _keys!1163)))

(declare-fun b!1067122 () Bool)

(declare-fun e!608602 () Bool)

(assert (=> b!1067122 (= e!608602 tp_is_empty!25521)))

(declare-fun b!1067123 () Bool)

(declare-fun e!608604 () Bool)

(assert (=> b!1067123 (= e!608604 tp_is_empty!25521)))

(declare-fun b!1067124 () Bool)

(assert (=> b!1067124 (= e!608603 (not true))))

(declare-datatypes ((tuple2!16256 0))(
  ( (tuple2!16257 (_1!8139 (_ BitVec 64)) (_2!8139 V!39163)) )
))
(declare-datatypes ((List!22815 0))(
  ( (Nil!22812) (Cons!22811 (h!24020 tuple2!16256) (t!32138 List!22815)) )
))
(declare-datatypes ((ListLongMap!14225 0))(
  ( (ListLongMap!14226 (toList!7128 List!22815)) )
))
(declare-fun lt!471311 () ListLongMap!14225)

(declare-fun lt!471312 () ListLongMap!14225)

(assert (=> b!1067124 (= lt!471311 lt!471312)))

(declare-fun zeroValueBefore!47 () V!39163)

(declare-datatypes ((Unit!35053 0))(
  ( (Unit!35054) )
))
(declare-fun lt!471310 () Unit!35053)

(declare-fun minValue!907 () V!39163)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39163)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!749 (array!68027 array!68029 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39163 V!39163 V!39163 V!39163 (_ BitVec 32) Int) Unit!35053)

(assert (=> b!1067124 (= lt!471310 (lemmaNoChangeToArrayThenSameMapNoExtras!749 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3712 (array!68027 array!68029 (_ BitVec 32) (_ BitVec 32) V!39163 V!39163 (_ BitVec 32) Int) ListLongMap!14225)

(assert (=> b!1067124 (= lt!471312 (getCurrentListMapNoExtraKeys!3712 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067124 (= lt!471311 (getCurrentListMapNoExtraKeys!3712 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067125 () Bool)

(declare-fun res!712158 () Bool)

(assert (=> b!1067125 (=> (not res!712158) (not e!608603))))

(declare-datatypes ((List!22816 0))(
  ( (Nil!22813) (Cons!22812 (h!24021 (_ BitVec 64)) (t!32139 List!22816)) )
))
(declare-fun arrayNoDuplicates!0 (array!68027 (_ BitVec 32) List!22816) Bool)

(assert (=> b!1067125 (= res!712158 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22813))))

(declare-fun b!1067126 () Bool)

(declare-fun mapRes!39973 () Bool)

(assert (=> b!1067126 (= e!608601 (and e!608604 mapRes!39973))))

(declare-fun condMapEmpty!39973 () Bool)

(declare-fun mapDefault!39973 () ValueCell!12057)

(assert (=> b!1067126 (= condMapEmpty!39973 (= (arr!32715 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12057)) mapDefault!39973)))))

(declare-fun mapNonEmpty!39973 () Bool)

(declare-fun tp!76576 () Bool)

(assert (=> mapNonEmpty!39973 (= mapRes!39973 (and tp!76576 e!608602))))

(declare-fun mapValue!39973 () ValueCell!12057)

(declare-fun mapRest!39973 () (Array (_ BitVec 32) ValueCell!12057))

(declare-fun mapKey!39973 () (_ BitVec 32))

(assert (=> mapNonEmpty!39973 (= (arr!32715 _values!955) (store mapRest!39973 mapKey!39973 mapValue!39973))))

(declare-fun mapIsEmpty!39973 () Bool)

(assert (=> mapIsEmpty!39973 mapRes!39973))

(declare-fun b!1067127 () Bool)

(declare-fun res!712160 () Bool)

(assert (=> b!1067127 (=> (not res!712160) (not e!608603))))

(assert (=> b!1067127 (= res!712160 (and (= (size!33251 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33250 _keys!1163) (size!33251 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94370 res!712159) b!1067127))

(assert (= (and b!1067127 res!712160) b!1067121))

(assert (= (and b!1067121 res!712157) b!1067125))

(assert (= (and b!1067125 res!712158) b!1067124))

(assert (= (and b!1067126 condMapEmpty!39973) mapIsEmpty!39973))

(assert (= (and b!1067126 (not condMapEmpty!39973)) mapNonEmpty!39973))

(get-info :version)

(assert (= (and mapNonEmpty!39973 ((_ is ValueCellFull!12057) mapValue!39973)) b!1067122))

(assert (= (and b!1067126 ((_ is ValueCellFull!12057) mapDefault!39973)) b!1067123))

(assert (= start!94370 b!1067126))

(declare-fun m!985827 () Bool)

(assert (=> b!1067124 m!985827))

(declare-fun m!985829 () Bool)

(assert (=> b!1067124 m!985829))

(declare-fun m!985831 () Bool)

(assert (=> b!1067124 m!985831))

(declare-fun m!985833 () Bool)

(assert (=> mapNonEmpty!39973 m!985833))

(declare-fun m!985835 () Bool)

(assert (=> b!1067121 m!985835))

(declare-fun m!985837 () Bool)

(assert (=> start!94370 m!985837))

(declare-fun m!985839 () Bool)

(assert (=> start!94370 m!985839))

(declare-fun m!985841 () Bool)

(assert (=> start!94370 m!985841))

(declare-fun m!985843 () Bool)

(assert (=> b!1067125 m!985843))

(check-sat b_and!34495 (not b!1067124) (not start!94370) (not b!1067121) (not mapNonEmpty!39973) (not b!1067125) tp_is_empty!25521 (not b_next!21711))
(check-sat b_and!34495 (not b_next!21711))
