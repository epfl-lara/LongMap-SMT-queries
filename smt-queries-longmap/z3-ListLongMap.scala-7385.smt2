; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94066 () Bool)

(assert start!94066)

(declare-fun b_free!21487 () Bool)

(declare-fun b_next!21487 () Bool)

(assert (=> start!94066 (= b_free!21487 (not b_next!21487))))

(declare-fun tp!75893 () Bool)

(declare-fun b_and!34203 () Bool)

(assert (=> start!94066 (= tp!75893 b_and!34203)))

(declare-fun b!1063754 () Bool)

(declare-fun e!606180 () Bool)

(declare-fun tp_is_empty!25297 () Bool)

(assert (=> b!1063754 (= e!606180 tp_is_empty!25297)))

(declare-fun b!1063755 () Bool)

(declare-fun e!606179 () Bool)

(assert (=> b!1063755 (= e!606179 (not true))))

(declare-datatypes ((V!38865 0))(
  ( (V!38866 (val!12699 Int)) )
))
(declare-datatypes ((tuple2!16140 0))(
  ( (tuple2!16141 (_1!8081 (_ BitVec 64)) (_2!8081 V!38865)) )
))
(declare-datatypes ((List!22689 0))(
  ( (Nil!22686) (Cons!22685 (h!23894 tuple2!16140) (t!31995 List!22689)) )
))
(declare-datatypes ((ListLongMap!14109 0))(
  ( (ListLongMap!14110 (toList!7070 List!22689)) )
))
(declare-fun lt!468763 () ListLongMap!14109)

(declare-fun lt!468764 () ListLongMap!14109)

(assert (=> b!1063755 (= lt!468763 lt!468764)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38865)

(declare-datatypes ((ValueCell!11945 0))(
  ( (ValueCellFull!11945 (v!15310 V!38865)) (EmptyCell!11945) )
))
(declare-datatypes ((array!67532 0))(
  ( (array!67533 (arr!32471 (Array (_ BitVec 32) ValueCell!11945)) (size!33009 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67532)

(declare-fun minValue!907 () V!38865)

(declare-datatypes ((Unit!34731 0))(
  ( (Unit!34732) )
))
(declare-fun lt!468762 () Unit!34731)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38865)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67534 0))(
  ( (array!67535 (arr!32472 (Array (_ BitVec 32) (_ BitVec 64))) (size!33010 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67534)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!670 (array!67534 array!67532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38865 V!38865 V!38865 V!38865 (_ BitVec 32) Int) Unit!34731)

(assert (=> b!1063755 (= lt!468762 (lemmaNoChangeToArrayThenSameMapNoExtras!670 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3676 (array!67534 array!67532 (_ BitVec 32) (_ BitVec 32) V!38865 V!38865 (_ BitVec 32) Int) ListLongMap!14109)

(assert (=> b!1063755 (= lt!468764 (getCurrentListMapNoExtraKeys!3676 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063755 (= lt!468763 (getCurrentListMapNoExtraKeys!3676 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063756 () Bool)

(declare-fun res!710233 () Bool)

(assert (=> b!1063756 (=> (not res!710233) (not e!606179))))

(assert (=> b!1063756 (= res!710233 (and (= (size!33009 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33010 _keys!1163) (size!33009 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063757 () Bool)

(declare-fun res!710232 () Bool)

(assert (=> b!1063757 (=> (not res!710232) (not e!606179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67534 (_ BitVec 32)) Bool)

(assert (=> b!1063757 (= res!710232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063758 () Bool)

(declare-fun e!606181 () Bool)

(assert (=> b!1063758 (= e!606181 tp_is_empty!25297)))

(declare-fun mapIsEmpty!39625 () Bool)

(declare-fun mapRes!39625 () Bool)

(assert (=> mapIsEmpty!39625 mapRes!39625))

(declare-fun mapNonEmpty!39625 () Bool)

(declare-fun tp!75892 () Bool)

(assert (=> mapNonEmpty!39625 (= mapRes!39625 (and tp!75892 e!606181))))

(declare-fun mapRest!39625 () (Array (_ BitVec 32) ValueCell!11945))

(declare-fun mapKey!39625 () (_ BitVec 32))

(declare-fun mapValue!39625 () ValueCell!11945)

(assert (=> mapNonEmpty!39625 (= (arr!32471 _values!955) (store mapRest!39625 mapKey!39625 mapValue!39625))))

(declare-fun b!1063759 () Bool)

(declare-fun res!710230 () Bool)

(assert (=> b!1063759 (=> (not res!710230) (not e!606179))))

(declare-datatypes ((List!22690 0))(
  ( (Nil!22687) (Cons!22686 (h!23895 (_ BitVec 64)) (t!31996 List!22690)) )
))
(declare-fun arrayNoDuplicates!0 (array!67534 (_ BitVec 32) List!22690) Bool)

(assert (=> b!1063759 (= res!710230 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22687))))

(declare-fun b!1063760 () Bool)

(declare-fun e!606182 () Bool)

(assert (=> b!1063760 (= e!606182 (and e!606180 mapRes!39625))))

(declare-fun condMapEmpty!39625 () Bool)

(declare-fun mapDefault!39625 () ValueCell!11945)

(assert (=> b!1063760 (= condMapEmpty!39625 (= (arr!32471 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11945)) mapDefault!39625)))))

(declare-fun res!710231 () Bool)

(assert (=> start!94066 (=> (not res!710231) (not e!606179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94066 (= res!710231 (validMask!0 mask!1515))))

(assert (=> start!94066 e!606179))

(assert (=> start!94066 true))

(assert (=> start!94066 tp_is_empty!25297))

(declare-fun array_inv!25154 (array!67532) Bool)

(assert (=> start!94066 (and (array_inv!25154 _values!955) e!606182)))

(assert (=> start!94066 tp!75893))

(declare-fun array_inv!25155 (array!67534) Bool)

(assert (=> start!94066 (array_inv!25155 _keys!1163)))

(assert (= (and start!94066 res!710231) b!1063756))

(assert (= (and b!1063756 res!710233) b!1063757))

(assert (= (and b!1063757 res!710232) b!1063759))

(assert (= (and b!1063759 res!710230) b!1063755))

(assert (= (and b!1063760 condMapEmpty!39625) mapIsEmpty!39625))

(assert (= (and b!1063760 (not condMapEmpty!39625)) mapNonEmpty!39625))

(get-info :version)

(assert (= (and mapNonEmpty!39625 ((_ is ValueCellFull!11945) mapValue!39625)) b!1063758))

(assert (= (and b!1063760 ((_ is ValueCellFull!11945) mapDefault!39625)) b!1063754))

(assert (= start!94066 b!1063760))

(declare-fun m!981913 () Bool)

(assert (=> b!1063755 m!981913))

(declare-fun m!981915 () Bool)

(assert (=> b!1063755 m!981915))

(declare-fun m!981917 () Bool)

(assert (=> b!1063755 m!981917))

(declare-fun m!981919 () Bool)

(assert (=> b!1063759 m!981919))

(declare-fun m!981921 () Bool)

(assert (=> b!1063757 m!981921))

(declare-fun m!981923 () Bool)

(assert (=> start!94066 m!981923))

(declare-fun m!981925 () Bool)

(assert (=> start!94066 m!981925))

(declare-fun m!981927 () Bool)

(assert (=> start!94066 m!981927))

(declare-fun m!981929 () Bool)

(assert (=> mapNonEmpty!39625 m!981929))

(check-sat (not b!1063755) (not start!94066) (not mapNonEmpty!39625) (not b!1063757) (not b!1063759) b_and!34203 tp_is_empty!25297 (not b_next!21487))
(check-sat b_and!34203 (not b_next!21487))
