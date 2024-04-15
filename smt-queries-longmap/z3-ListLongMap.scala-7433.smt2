; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94442 () Bool)

(assert start!94442)

(declare-fun b_free!21775 () Bool)

(declare-fun b_next!21775 () Bool)

(assert (=> start!94442 (= b_free!21775 (not b_next!21775))))

(declare-fun tp!76772 () Bool)

(declare-fun b_and!34541 () Bool)

(assert (=> start!94442 (= tp!76772 b_and!34541)))

(declare-fun res!712588 () Bool)

(declare-fun e!609131 () Bool)

(assert (=> start!94442 (=> (not res!712588) (not e!609131))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94442 (= res!712588 (validMask!0 mask!1515))))

(assert (=> start!94442 e!609131))

(assert (=> start!94442 true))

(declare-fun tp_is_empty!25585 () Bool)

(assert (=> start!94442 tp_is_empty!25585))

(declare-datatypes ((V!39249 0))(
  ( (V!39250 (val!12843 Int)) )
))
(declare-datatypes ((ValueCell!12089 0))(
  ( (ValueCellFull!12089 (v!15456 V!39249)) (EmptyCell!12089) )
))
(declare-datatypes ((array!68096 0))(
  ( (array!68097 (arr!32748 (Array (_ BitVec 32) ValueCell!12089)) (size!33286 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68096)

(declare-fun e!609133 () Bool)

(declare-fun array_inv!25350 (array!68096) Bool)

(assert (=> start!94442 (and (array_inv!25350 _values!955) e!609133)))

(assert (=> start!94442 tp!76772))

(declare-datatypes ((array!68098 0))(
  ( (array!68099 (arr!32749 (Array (_ BitVec 32) (_ BitVec 64))) (size!33287 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68098)

(declare-fun array_inv!25351 (array!68098) Bool)

(assert (=> start!94442 (array_inv!25351 _keys!1163)))

(declare-fun b!1067810 () Bool)

(declare-fun res!712589 () Bool)

(assert (=> b!1067810 (=> (not res!712589) (not e!609131))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067810 (= res!712589 (and (= (size!33286 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33287 _keys!1163) (size!33286 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067811 () Bool)

(declare-fun e!609129 () Bool)

(assert (=> b!1067811 (= e!609129 tp_is_empty!25585)))

(declare-fun b!1067812 () Bool)

(declare-fun e!609127 () Bool)

(assert (=> b!1067812 (= e!609127 tp_is_empty!25585)))

(declare-fun b!1067813 () Bool)

(declare-fun e!609128 () Bool)

(assert (=> b!1067813 (= e!609131 (not e!609128))))

(declare-fun res!712593 () Bool)

(assert (=> b!1067813 (=> res!712593 e!609128)))

(assert (=> b!1067813 (= res!712593 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16360 0))(
  ( (tuple2!16361 (_1!8191 (_ BitVec 64)) (_2!8191 V!39249)) )
))
(declare-datatypes ((List!22900 0))(
  ( (Nil!22897) (Cons!22896 (h!24105 tuple2!16360) (t!32216 List!22900)) )
))
(declare-datatypes ((ListLongMap!14329 0))(
  ( (ListLongMap!14330 (toList!7180 List!22900)) )
))
(declare-fun lt!471524 () ListLongMap!14329)

(declare-fun lt!471526 () ListLongMap!14329)

(assert (=> b!1067813 (= lt!471524 lt!471526)))

(declare-fun zeroValueBefore!47 () V!39249)

(declare-fun minValue!907 () V!39249)

(declare-datatypes ((Unit!34950 0))(
  ( (Unit!34951) )
))
(declare-fun lt!471523 () Unit!34950)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39249)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!768 (array!68098 array!68096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39249 V!39249 V!39249 V!39249 (_ BitVec 32) Int) Unit!34950)

(assert (=> b!1067813 (= lt!471523 (lemmaNoChangeToArrayThenSameMapNoExtras!768 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3774 (array!68098 array!68096 (_ BitVec 32) (_ BitVec 32) V!39249 V!39249 (_ BitVec 32) Int) ListLongMap!14329)

(assert (=> b!1067813 (= lt!471526 (getCurrentListMapNoExtraKeys!3774 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067813 (= lt!471524 (getCurrentListMapNoExtraKeys!3774 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40072 () Bool)

(declare-fun mapRes!40072 () Bool)

(declare-fun tp!76771 () Bool)

(assert (=> mapNonEmpty!40072 (= mapRes!40072 (and tp!76771 e!609127))))

(declare-fun mapKey!40072 () (_ BitVec 32))

(declare-fun mapRest!40072 () (Array (_ BitVec 32) ValueCell!12089))

(declare-fun mapValue!40072 () ValueCell!12089)

(assert (=> mapNonEmpty!40072 (= (arr!32748 _values!955) (store mapRest!40072 mapKey!40072 mapValue!40072))))

(declare-fun b!1067814 () Bool)

(declare-fun e!609132 () Bool)

(assert (=> b!1067814 (= e!609128 e!609132)))

(declare-fun res!712590 () Bool)

(assert (=> b!1067814 (=> res!712590 e!609132)))

(declare-fun lt!471527 () ListLongMap!14329)

(declare-fun contains!6256 (ListLongMap!14329 (_ BitVec 64)) Bool)

(assert (=> b!1067814 (= res!712590 (contains!6256 lt!471527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4025 (array!68098 array!68096 (_ BitVec 32) (_ BitVec 32) V!39249 V!39249 (_ BitVec 32) Int) ListLongMap!14329)

(assert (=> b!1067814 (= lt!471527 (getCurrentListMap!4025 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40072 () Bool)

(assert (=> mapIsEmpty!40072 mapRes!40072))

(declare-fun b!1067815 () Bool)

(declare-fun res!712592 () Bool)

(assert (=> b!1067815 (=> (not res!712592) (not e!609131))))

(declare-datatypes ((List!22901 0))(
  ( (Nil!22898) (Cons!22897 (h!24106 (_ BitVec 64)) (t!32217 List!22901)) )
))
(declare-fun arrayNoDuplicates!0 (array!68098 (_ BitVec 32) List!22901) Bool)

(assert (=> b!1067815 (= res!712592 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22898))))

(declare-fun b!1067816 () Bool)

(assert (=> b!1067816 (= e!609132 true)))

(declare-fun -!627 (ListLongMap!14329 (_ BitVec 64)) ListLongMap!14329)

(assert (=> b!1067816 (= (-!627 lt!471527 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471527)))

(declare-fun lt!471525 () Unit!34950)

(declare-fun removeNotPresentStillSame!44 (ListLongMap!14329 (_ BitVec 64)) Unit!34950)

(assert (=> b!1067816 (= lt!471525 (removeNotPresentStillSame!44 lt!471527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067817 () Bool)

(declare-fun res!712591 () Bool)

(assert (=> b!1067817 (=> (not res!712591) (not e!609131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68098 (_ BitVec 32)) Bool)

(assert (=> b!1067817 (= res!712591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067818 () Bool)

(assert (=> b!1067818 (= e!609133 (and e!609129 mapRes!40072))))

(declare-fun condMapEmpty!40072 () Bool)

(declare-fun mapDefault!40072 () ValueCell!12089)

(assert (=> b!1067818 (= condMapEmpty!40072 (= (arr!32748 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12089)) mapDefault!40072)))))

(assert (= (and start!94442 res!712588) b!1067810))

(assert (= (and b!1067810 res!712589) b!1067817))

(assert (= (and b!1067817 res!712591) b!1067815))

(assert (= (and b!1067815 res!712592) b!1067813))

(assert (= (and b!1067813 (not res!712593)) b!1067814))

(assert (= (and b!1067814 (not res!712590)) b!1067816))

(assert (= (and b!1067818 condMapEmpty!40072) mapIsEmpty!40072))

(assert (= (and b!1067818 (not condMapEmpty!40072)) mapNonEmpty!40072))

(get-info :version)

(assert (= (and mapNonEmpty!40072 ((_ is ValueCellFull!12089) mapValue!40072)) b!1067812))

(assert (= (and b!1067818 ((_ is ValueCellFull!12089) mapDefault!40072)) b!1067811))

(assert (= start!94442 b!1067818))

(declare-fun m!985951 () Bool)

(assert (=> b!1067813 m!985951))

(declare-fun m!985953 () Bool)

(assert (=> b!1067813 m!985953))

(declare-fun m!985955 () Bool)

(assert (=> b!1067813 m!985955))

(declare-fun m!985957 () Bool)

(assert (=> start!94442 m!985957))

(declare-fun m!985959 () Bool)

(assert (=> start!94442 m!985959))

(declare-fun m!985961 () Bool)

(assert (=> start!94442 m!985961))

(declare-fun m!985963 () Bool)

(assert (=> b!1067814 m!985963))

(declare-fun m!985965 () Bool)

(assert (=> b!1067814 m!985965))

(declare-fun m!985967 () Bool)

(assert (=> b!1067815 m!985967))

(declare-fun m!985969 () Bool)

(assert (=> b!1067816 m!985969))

(declare-fun m!985971 () Bool)

(assert (=> b!1067816 m!985971))

(declare-fun m!985973 () Bool)

(assert (=> b!1067817 m!985973))

(declare-fun m!985975 () Bool)

(assert (=> mapNonEmpty!40072 m!985975))

(check-sat (not b_next!21775) (not mapNonEmpty!40072) tp_is_empty!25585 b_and!34541 (not b!1067813) (not start!94442) (not b!1067814) (not b!1067815) (not b!1067816) (not b!1067817))
(check-sat b_and!34541 (not b_next!21775))
