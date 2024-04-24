; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94394 () Bool)

(assert start!94394)

(declare-fun b_free!21559 () Bool)

(declare-fun b_next!21559 () Bool)

(assert (=> start!94394 (= b_free!21559 (not b_next!21559))))

(declare-fun tp!76112 () Bool)

(declare-fun b_and!34319 () Bool)

(assert (=> start!94394 (= tp!76112 b_and!34319)))

(declare-fun b!1066131 () Bool)

(declare-fun e!607778 () Bool)

(declare-fun e!607782 () Bool)

(declare-fun mapRes!39736 () Bool)

(assert (=> b!1066131 (= e!607778 (and e!607782 mapRes!39736))))

(declare-fun condMapEmpty!39736 () Bool)

(declare-datatypes ((V!38961 0))(
  ( (V!38962 (val!12735 Int)) )
))
(declare-datatypes ((ValueCell!11981 0))(
  ( (ValueCellFull!11981 (v!15343 V!38961)) (EmptyCell!11981) )
))
(declare-datatypes ((array!67779 0))(
  ( (array!67780 (arr!32587 (Array (_ BitVec 32) ValueCell!11981)) (size!33124 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67779)

(declare-fun mapDefault!39736 () ValueCell!11981)

(assert (=> b!1066131 (= condMapEmpty!39736 (= (arr!32587 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11981)) mapDefault!39736)))))

(declare-fun mapNonEmpty!39736 () Bool)

(declare-fun tp!76111 () Bool)

(declare-fun e!607779 () Bool)

(assert (=> mapNonEmpty!39736 (= mapRes!39736 (and tp!76111 e!607779))))

(declare-fun mapKey!39736 () (_ BitVec 32))

(declare-fun mapValue!39736 () ValueCell!11981)

(declare-fun mapRest!39736 () (Array (_ BitVec 32) ValueCell!11981))

(assert (=> mapNonEmpty!39736 (= (arr!32587 _values!955) (store mapRest!39736 mapKey!39736 mapValue!39736))))

(declare-fun b!1066133 () Bool)

(declare-fun tp_is_empty!25369 () Bool)

(assert (=> b!1066133 (= e!607782 tp_is_empty!25369)))

(declare-fun b!1066134 () Bool)

(declare-fun e!607780 () Bool)

(declare-fun e!607781 () Bool)

(assert (=> b!1066134 (= e!607780 (not e!607781))))

(declare-fun res!711343 () Bool)

(assert (=> b!1066134 (=> res!711343 e!607781)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066134 (= res!711343 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16122 0))(
  ( (tuple2!16123 (_1!8072 (_ BitVec 64)) (_2!8072 V!38961)) )
))
(declare-datatypes ((List!22695 0))(
  ( (Nil!22692) (Cons!22691 (h!23909 tuple2!16122) (t!32004 List!22695)) )
))
(declare-datatypes ((ListLongMap!14099 0))(
  ( (ListLongMap!14100 (toList!7065 List!22695)) )
))
(declare-fun lt!469899 () ListLongMap!14099)

(declare-fun lt!469898 () ListLongMap!14099)

(assert (=> b!1066134 (= lt!469899 lt!469898)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38961)

(declare-datatypes ((Unit!34923 0))(
  ( (Unit!34924) )
))
(declare-fun lt!469900 () Unit!34923)

(declare-fun minValue!907 () V!38961)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38961)

(declare-datatypes ((array!67781 0))(
  ( (array!67782 (arr!32588 (Array (_ BitVec 32) (_ BitVec 64))) (size!33125 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67781)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!697 (array!67781 array!67779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38961 V!38961 V!38961 V!38961 (_ BitVec 32) Int) Unit!34923)

(assert (=> b!1066134 (= lt!469900 (lemmaNoChangeToArrayThenSameMapNoExtras!697 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3694 (array!67781 array!67779 (_ BitVec 32) (_ BitVec 32) V!38961 V!38961 (_ BitVec 32) Int) ListLongMap!14099)

(assert (=> b!1066134 (= lt!469898 (getCurrentListMapNoExtraKeys!3694 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066134 (= lt!469899 (getCurrentListMapNoExtraKeys!3694 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066135 () Bool)

(declare-fun res!711342 () Bool)

(assert (=> b!1066135 (=> (not res!711342) (not e!607780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67781 (_ BitVec 32)) Bool)

(assert (=> b!1066135 (= res!711342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066136 () Bool)

(assert (=> b!1066136 (= e!607781 true)))

(declare-fun lt!469897 () ListLongMap!14099)

(declare-fun getCurrentListMap!4019 (array!67781 array!67779 (_ BitVec 32) (_ BitVec 32) V!38961 V!38961 (_ BitVec 32) Int) ListLongMap!14099)

(assert (=> b!1066136 (= lt!469897 (getCurrentListMap!4019 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39736 () Bool)

(assert (=> mapIsEmpty!39736 mapRes!39736))

(declare-fun res!711344 () Bool)

(assert (=> start!94394 (=> (not res!711344) (not e!607780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94394 (= res!711344 (validMask!0 mask!1515))))

(assert (=> start!94394 e!607780))

(assert (=> start!94394 true))

(assert (=> start!94394 tp_is_empty!25369))

(declare-fun array_inv!25258 (array!67779) Bool)

(assert (=> start!94394 (and (array_inv!25258 _values!955) e!607778)))

(assert (=> start!94394 tp!76112))

(declare-fun array_inv!25259 (array!67781) Bool)

(assert (=> start!94394 (array_inv!25259 _keys!1163)))

(declare-fun b!1066132 () Bool)

(assert (=> b!1066132 (= e!607779 tp_is_empty!25369)))

(declare-fun b!1066137 () Bool)

(declare-fun res!711341 () Bool)

(assert (=> b!1066137 (=> (not res!711341) (not e!607780))))

(assert (=> b!1066137 (= res!711341 (and (= (size!33124 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33125 _keys!1163) (size!33124 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066138 () Bool)

(declare-fun res!711340 () Bool)

(assert (=> b!1066138 (=> (not res!711340) (not e!607780))))

(declare-datatypes ((List!22696 0))(
  ( (Nil!22693) (Cons!22692 (h!23910 (_ BitVec 64)) (t!32005 List!22696)) )
))
(declare-fun arrayNoDuplicates!0 (array!67781 (_ BitVec 32) List!22696) Bool)

(assert (=> b!1066138 (= res!711340 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22693))))

(assert (= (and start!94394 res!711344) b!1066137))

(assert (= (and b!1066137 res!711341) b!1066135))

(assert (= (and b!1066135 res!711342) b!1066138))

(assert (= (and b!1066138 res!711340) b!1066134))

(assert (= (and b!1066134 (not res!711343)) b!1066136))

(assert (= (and b!1066131 condMapEmpty!39736) mapIsEmpty!39736))

(assert (= (and b!1066131 (not condMapEmpty!39736)) mapNonEmpty!39736))

(get-info :version)

(assert (= (and mapNonEmpty!39736 ((_ is ValueCellFull!11981) mapValue!39736)) b!1066132))

(assert (= (and b!1066131 ((_ is ValueCellFull!11981) mapDefault!39736)) b!1066133))

(assert (= start!94394 b!1066131))

(declare-fun m!984961 () Bool)

(assert (=> mapNonEmpty!39736 m!984961))

(declare-fun m!984963 () Bool)

(assert (=> b!1066135 m!984963))

(declare-fun m!984965 () Bool)

(assert (=> start!94394 m!984965))

(declare-fun m!984967 () Bool)

(assert (=> start!94394 m!984967))

(declare-fun m!984969 () Bool)

(assert (=> start!94394 m!984969))

(declare-fun m!984971 () Bool)

(assert (=> b!1066138 m!984971))

(declare-fun m!984973 () Bool)

(assert (=> b!1066136 m!984973))

(declare-fun m!984975 () Bool)

(assert (=> b!1066134 m!984975))

(declare-fun m!984977 () Bool)

(assert (=> b!1066134 m!984977))

(declare-fun m!984979 () Bool)

(assert (=> b!1066134 m!984979))

(check-sat b_and!34319 (not mapNonEmpty!39736) (not start!94394) (not b!1066134) (not b!1066135) (not b!1066138) (not b!1066136) (not b_next!21559) tp_is_empty!25369)
(check-sat b_and!34319 (not b_next!21559))
