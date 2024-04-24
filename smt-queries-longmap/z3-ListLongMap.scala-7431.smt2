; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94672 () Bool)

(assert start!94672)

(declare-fun b_free!21763 () Bool)

(declare-fun b_next!21763 () Bool)

(assert (=> start!94672 (= b_free!21763 (not b_next!21763))))

(declare-fun tp!76736 () Bool)

(declare-fun b_and!34565 () Bool)

(assert (=> start!94672 (= tp!76736 b_and!34565)))

(declare-fun b!1069128 () Bool)

(declare-fun e!609952 () Bool)

(declare-fun e!609949 () Bool)

(declare-fun mapRes!40054 () Bool)

(assert (=> b!1069128 (= e!609952 (and e!609949 mapRes!40054))))

(declare-fun condMapEmpty!40054 () Bool)

(declare-datatypes ((V!39233 0))(
  ( (V!39234 (val!12837 Int)) )
))
(declare-datatypes ((ValueCell!12083 0))(
  ( (ValueCellFull!12083 (v!15447 V!39233)) (EmptyCell!12083) )
))
(declare-datatypes ((array!68173 0))(
  ( (array!68174 (arr!32780 (Array (_ BitVec 32) ValueCell!12083)) (size!33317 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68173)

(declare-fun mapDefault!40054 () ValueCell!12083)

(assert (=> b!1069128 (= condMapEmpty!40054 (= (arr!32780 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12083)) mapDefault!40054)))))

(declare-fun b!1069129 () Bool)

(declare-fun e!609953 () Bool)

(assert (=> b!1069129 (= e!609953 true)))

(declare-datatypes ((tuple2!16270 0))(
  ( (tuple2!16271 (_1!8146 (_ BitVec 64)) (_2!8146 V!39233)) )
))
(declare-datatypes ((List!22840 0))(
  ( (Nil!22837) (Cons!22836 (h!24054 tuple2!16270) (t!32157 List!22840)) )
))
(declare-datatypes ((ListLongMap!14247 0))(
  ( (ListLongMap!14248 (toList!7139 List!22840)) )
))
(declare-fun lt!472151 () ListLongMap!14247)

(declare-fun -!628 (ListLongMap!14247 (_ BitVec 64)) ListLongMap!14247)

(assert (=> b!1069129 (= (-!628 lt!472151 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472151)))

(declare-datatypes ((Unit!35072 0))(
  ( (Unit!35073) )
))
(declare-fun lt!472150 () Unit!35072)

(declare-fun removeNotPresentStillSame!45 (ListLongMap!14247 (_ BitVec 64)) Unit!35072)

(assert (=> b!1069129 (= lt!472150 (removeNotPresentStillSame!45 lt!472151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069130 () Bool)

(declare-fun res!713072 () Bool)

(declare-fun e!609950 () Bool)

(assert (=> b!1069130 (=> (not res!713072) (not e!609950))))

(declare-datatypes ((array!68175 0))(
  ( (array!68176 (arr!32781 (Array (_ BitVec 32) (_ BitVec 64))) (size!33318 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68175)

(declare-datatypes ((List!22841 0))(
  ( (Nil!22838) (Cons!22837 (h!24055 (_ BitVec 64)) (t!32158 List!22841)) )
))
(declare-fun arrayNoDuplicates!0 (array!68175 (_ BitVec 32) List!22841) Bool)

(assert (=> b!1069130 (= res!713072 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22838))))

(declare-fun b!1069131 () Bool)

(declare-fun tp_is_empty!25573 () Bool)

(assert (=> b!1069131 (= e!609949 tp_is_empty!25573)))

(declare-fun b!1069132 () Bool)

(declare-fun res!713074 () Bool)

(assert (=> b!1069132 (=> (not res!713074) (not e!609950))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68175 (_ BitVec 32)) Bool)

(assert (=> b!1069132 (= res!713074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!713075 () Bool)

(assert (=> start!94672 (=> (not res!713075) (not e!609950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94672 (= res!713075 (validMask!0 mask!1515))))

(assert (=> start!94672 e!609950))

(assert (=> start!94672 true))

(assert (=> start!94672 tp_is_empty!25573))

(declare-fun array_inv!25398 (array!68173) Bool)

(assert (=> start!94672 (and (array_inv!25398 _values!955) e!609952)))

(assert (=> start!94672 tp!76736))

(declare-fun array_inv!25399 (array!68175) Bool)

(assert (=> start!94672 (array_inv!25399 _keys!1163)))

(declare-fun b!1069133 () Bool)

(declare-fun res!713073 () Bool)

(assert (=> b!1069133 (=> (not res!713073) (not e!609950))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069133 (= res!713073 (and (= (size!33317 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33318 _keys!1163) (size!33317 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069134 () Bool)

(declare-fun e!609955 () Bool)

(assert (=> b!1069134 (= e!609955 e!609953)))

(declare-fun res!713071 () Bool)

(assert (=> b!1069134 (=> res!713071 e!609953)))

(declare-fun contains!6302 (ListLongMap!14247 (_ BitVec 64)) Bool)

(assert (=> b!1069134 (= res!713071 (contains!6302 lt!472151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39233)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39233)

(declare-fun getCurrentListMap!4065 (array!68175 array!68173 (_ BitVec 32) (_ BitVec 32) V!39233 V!39233 (_ BitVec 32) Int) ListLongMap!14247)

(assert (=> b!1069134 (= lt!472151 (getCurrentListMap!4065 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40054 () Bool)

(assert (=> mapIsEmpty!40054 mapRes!40054))

(declare-fun b!1069135 () Bool)

(assert (=> b!1069135 (= e!609950 (not e!609955))))

(declare-fun res!713076 () Bool)

(assert (=> b!1069135 (=> res!713076 e!609955)))

(assert (=> b!1069135 (= res!713076 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472149 () ListLongMap!14247)

(declare-fun lt!472148 () ListLongMap!14247)

(assert (=> b!1069135 (= lt!472149 lt!472148)))

(declare-fun lt!472152 () Unit!35072)

(declare-fun zeroValueAfter!47 () V!39233)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!758 (array!68175 array!68173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39233 V!39233 V!39233 V!39233 (_ BitVec 32) Int) Unit!35072)

(assert (=> b!1069135 (= lt!472152 (lemmaNoChangeToArrayThenSameMapNoExtras!758 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3755 (array!68175 array!68173 (_ BitVec 32) (_ BitVec 32) V!39233 V!39233 (_ BitVec 32) Int) ListLongMap!14247)

(assert (=> b!1069135 (= lt!472148 (getCurrentListMapNoExtraKeys!3755 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069135 (= lt!472149 (getCurrentListMapNoExtraKeys!3755 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069136 () Bool)

(declare-fun e!609954 () Bool)

(assert (=> b!1069136 (= e!609954 tp_is_empty!25573)))

(declare-fun mapNonEmpty!40054 () Bool)

(declare-fun tp!76735 () Bool)

(assert (=> mapNonEmpty!40054 (= mapRes!40054 (and tp!76735 e!609954))))

(declare-fun mapKey!40054 () (_ BitVec 32))

(declare-fun mapRest!40054 () (Array (_ BitVec 32) ValueCell!12083))

(declare-fun mapValue!40054 () ValueCell!12083)

(assert (=> mapNonEmpty!40054 (= (arr!32780 _values!955) (store mapRest!40054 mapKey!40054 mapValue!40054))))

(assert (= (and start!94672 res!713075) b!1069133))

(assert (= (and b!1069133 res!713073) b!1069132))

(assert (= (and b!1069132 res!713074) b!1069130))

(assert (= (and b!1069130 res!713072) b!1069135))

(assert (= (and b!1069135 (not res!713076)) b!1069134))

(assert (= (and b!1069134 (not res!713071)) b!1069129))

(assert (= (and b!1069128 condMapEmpty!40054) mapIsEmpty!40054))

(assert (= (and b!1069128 (not condMapEmpty!40054)) mapNonEmpty!40054))

(get-info :version)

(assert (= (and mapNonEmpty!40054 ((_ is ValueCellFull!12083) mapValue!40054)) b!1069136))

(assert (= (and b!1069128 ((_ is ValueCellFull!12083) mapDefault!40054)) b!1069131))

(assert (= start!94672 b!1069128))

(declare-fun m!988093 () Bool)

(assert (=> b!1069130 m!988093))

(declare-fun m!988095 () Bool)

(assert (=> mapNonEmpty!40054 m!988095))

(declare-fun m!988097 () Bool)

(assert (=> b!1069129 m!988097))

(declare-fun m!988099 () Bool)

(assert (=> b!1069129 m!988099))

(declare-fun m!988101 () Bool)

(assert (=> start!94672 m!988101))

(declare-fun m!988103 () Bool)

(assert (=> start!94672 m!988103))

(declare-fun m!988105 () Bool)

(assert (=> start!94672 m!988105))

(declare-fun m!988107 () Bool)

(assert (=> b!1069134 m!988107))

(declare-fun m!988109 () Bool)

(assert (=> b!1069134 m!988109))

(declare-fun m!988111 () Bool)

(assert (=> b!1069135 m!988111))

(declare-fun m!988113 () Bool)

(assert (=> b!1069135 m!988113))

(declare-fun m!988115 () Bool)

(assert (=> b!1069135 m!988115))

(declare-fun m!988117 () Bool)

(assert (=> b!1069132 m!988117))

(check-sat (not b_next!21763) b_and!34565 (not b!1069132) (not b!1069134) (not mapNonEmpty!40054) tp_is_empty!25573 (not start!94672) (not b!1069135) (not b!1069130) (not b!1069129))
(check-sat b_and!34565 (not b_next!21763))
