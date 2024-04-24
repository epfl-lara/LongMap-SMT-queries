; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105708 () Bool)

(assert start!105708)

(declare-fun b_free!27121 () Bool)

(declare-fun b_next!27121 () Bool)

(assert (=> start!105708 (= b_free!27121 (not b_next!27121))))

(declare-fun tp!94879 () Bool)

(declare-fun b_and!44979 () Bool)

(assert (=> start!105708 (= tp!94879 b_and!44979)))

(declare-fun b!1258012 () Bool)

(declare-fun res!838271 () Bool)

(declare-fun e!715314 () Bool)

(assert (=> b!1258012 (=> (not res!838271) (not e!715314))))

(declare-datatypes ((array!81733 0))(
  ( (array!81734 (arr!39420 (Array (_ BitVec 32) (_ BitVec 64))) (size!39957 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81733)

(declare-datatypes ((List!28020 0))(
  ( (Nil!28017) (Cons!28016 (h!29234 (_ BitVec 64)) (t!41501 List!28020)) )
))
(declare-fun arrayNoDuplicates!0 (array!81733 (_ BitVec 32) List!28020) Bool)

(assert (=> b!1258012 (= res!838271 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28017))))

(declare-fun b!1258013 () Bool)

(declare-fun res!838273 () Bool)

(assert (=> b!1258013 (=> (not res!838273) (not e!715314))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81733 (_ BitVec 32)) Bool)

(assert (=> b!1258013 (= res!838273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258014 () Bool)

(declare-fun e!715315 () Bool)

(declare-fun e!715318 () Bool)

(assert (=> b!1258014 (= e!715315 e!715318)))

(declare-fun res!838274 () Bool)

(assert (=> b!1258014 (=> res!838274 e!715318)))

(declare-datatypes ((V!48063 0))(
  ( (V!48064 (val!16074 Int)) )
))
(declare-datatypes ((tuple2!20788 0))(
  ( (tuple2!20789 (_1!10405 (_ BitVec 64)) (_2!10405 V!48063)) )
))
(declare-datatypes ((List!28021 0))(
  ( (Nil!28018) (Cons!28017 (h!29235 tuple2!20788) (t!41502 List!28021)) )
))
(declare-datatypes ((ListLongMap!18669 0))(
  ( (ListLongMap!18670 (toList!9350 List!28021)) )
))
(declare-fun lt!568790 () ListLongMap!18669)

(declare-fun contains!7580 (ListLongMap!18669 (_ BitVec 64)) Bool)

(assert (=> b!1258014 (= res!838274 (contains!7580 lt!568790 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15248 0))(
  ( (ValueCellFull!15248 (v!18771 V!48063)) (EmptyCell!15248) )
))
(declare-datatypes ((array!81735 0))(
  ( (array!81736 (arr!39421 (Array (_ BitVec 32) ValueCell!15248)) (size!39958 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81735)

(declare-fun minValueBefore!43 () V!48063)

(declare-fun zeroValue!871 () V!48063)

(declare-fun getCurrentListMap!4557 (array!81733 array!81735 (_ BitVec 32) (_ BitVec 32) V!48063 V!48063 (_ BitVec 32) Int) ListLongMap!18669)

(assert (=> b!1258014 (= lt!568790 (getCurrentListMap!4557 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258015 () Bool)

(declare-fun e!715313 () Bool)

(declare-fun tp_is_empty!32023 () Bool)

(assert (=> b!1258015 (= e!715313 tp_is_empty!32023)))

(declare-fun mapNonEmpty!49822 () Bool)

(declare-fun mapRes!49822 () Bool)

(declare-fun tp!94880 () Bool)

(declare-fun e!715312 () Bool)

(assert (=> mapNonEmpty!49822 (= mapRes!49822 (and tp!94880 e!715312))))

(declare-fun mapRest!49822 () (Array (_ BitVec 32) ValueCell!15248))

(declare-fun mapValue!49822 () ValueCell!15248)

(declare-fun mapKey!49822 () (_ BitVec 32))

(assert (=> mapNonEmpty!49822 (= (arr!39421 _values!914) (store mapRest!49822 mapKey!49822 mapValue!49822))))

(declare-fun res!838272 () Bool)

(assert (=> start!105708 (=> (not res!838272) (not e!715314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105708 (= res!838272 (validMask!0 mask!1466))))

(assert (=> start!105708 e!715314))

(assert (=> start!105708 true))

(assert (=> start!105708 tp!94879))

(assert (=> start!105708 tp_is_empty!32023))

(declare-fun array_inv!30165 (array!81733) Bool)

(assert (=> start!105708 (array_inv!30165 _keys!1118)))

(declare-fun e!715317 () Bool)

(declare-fun array_inv!30166 (array!81735) Bool)

(assert (=> start!105708 (and (array_inv!30166 _values!914) e!715317)))

(declare-fun b!1258016 () Bool)

(declare-fun res!838276 () Bool)

(assert (=> b!1258016 (=> (not res!838276) (not e!715314))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258016 (= res!838276 (and (= (size!39958 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39957 _keys!1118) (size!39958 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258017 () Bool)

(assert (=> b!1258017 (= e!715314 (not e!715315))))

(declare-fun res!838275 () Bool)

(assert (=> b!1258017 (=> res!838275 e!715315)))

(assert (=> b!1258017 (= res!838275 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568789 () ListLongMap!18669)

(declare-fun lt!568791 () ListLongMap!18669)

(assert (=> b!1258017 (= lt!568789 lt!568791)))

(declare-fun minValueAfter!43 () V!48063)

(declare-datatypes ((Unit!41841 0))(
  ( (Unit!41842) )
))
(declare-fun lt!568788 () Unit!41841)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1081 (array!81733 array!81735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48063 V!48063 V!48063 V!48063 (_ BitVec 32) Int) Unit!41841)

(assert (=> b!1258017 (= lt!568788 (lemmaNoChangeToArrayThenSameMapNoExtras!1081 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5767 (array!81733 array!81735 (_ BitVec 32) (_ BitVec 32) V!48063 V!48063 (_ BitVec 32) Int) ListLongMap!18669)

(assert (=> b!1258017 (= lt!568791 (getCurrentListMapNoExtraKeys!5767 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258017 (= lt!568789 (getCurrentListMapNoExtraKeys!5767 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49822 () Bool)

(assert (=> mapIsEmpty!49822 mapRes!49822))

(declare-fun b!1258018 () Bool)

(assert (=> b!1258018 (= e!715317 (and e!715313 mapRes!49822))))

(declare-fun condMapEmpty!49822 () Bool)

(declare-fun mapDefault!49822 () ValueCell!15248)

(assert (=> b!1258018 (= condMapEmpty!49822 (= (arr!39421 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15248)) mapDefault!49822)))))

(declare-fun b!1258019 () Bool)

(assert (=> b!1258019 (= e!715318 true)))

(declare-fun -!2064 (ListLongMap!18669 (_ BitVec 64)) ListLongMap!18669)

(assert (=> b!1258019 (= (-!2064 lt!568790 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568790)))

(declare-fun lt!568787 () Unit!41841)

(declare-fun removeNotPresentStillSame!136 (ListLongMap!18669 (_ BitVec 64)) Unit!41841)

(assert (=> b!1258019 (= lt!568787 (removeNotPresentStillSame!136 lt!568790 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1258020 () Bool)

(assert (=> b!1258020 (= e!715312 tp_is_empty!32023)))

(assert (= (and start!105708 res!838272) b!1258016))

(assert (= (and b!1258016 res!838276) b!1258013))

(assert (= (and b!1258013 res!838273) b!1258012))

(assert (= (and b!1258012 res!838271) b!1258017))

(assert (= (and b!1258017 (not res!838275)) b!1258014))

(assert (= (and b!1258014 (not res!838274)) b!1258019))

(assert (= (and b!1258018 condMapEmpty!49822) mapIsEmpty!49822))

(assert (= (and b!1258018 (not condMapEmpty!49822)) mapNonEmpty!49822))

(get-info :version)

(assert (= (and mapNonEmpty!49822 ((_ is ValueCellFull!15248) mapValue!49822)) b!1258020))

(assert (= (and b!1258018 ((_ is ValueCellFull!15248) mapDefault!49822)) b!1258015))

(assert (= start!105708 b!1258018))

(declare-fun m!1158957 () Bool)

(assert (=> b!1258013 m!1158957))

(declare-fun m!1158959 () Bool)

(assert (=> start!105708 m!1158959))

(declare-fun m!1158961 () Bool)

(assert (=> start!105708 m!1158961))

(declare-fun m!1158963 () Bool)

(assert (=> start!105708 m!1158963))

(declare-fun m!1158965 () Bool)

(assert (=> b!1258012 m!1158965))

(declare-fun m!1158967 () Bool)

(assert (=> b!1258019 m!1158967))

(declare-fun m!1158969 () Bool)

(assert (=> b!1258019 m!1158969))

(declare-fun m!1158971 () Bool)

(assert (=> b!1258017 m!1158971))

(declare-fun m!1158973 () Bool)

(assert (=> b!1258017 m!1158973))

(declare-fun m!1158975 () Bool)

(assert (=> b!1258017 m!1158975))

(declare-fun m!1158977 () Bool)

(assert (=> b!1258014 m!1158977))

(declare-fun m!1158979 () Bool)

(assert (=> b!1258014 m!1158979))

(declare-fun m!1158981 () Bool)

(assert (=> mapNonEmpty!49822 m!1158981))

(check-sat tp_is_empty!32023 (not b!1258019) (not mapNonEmpty!49822) b_and!44979 (not b!1258014) (not b!1258017) (not b_next!27121) (not b!1258012) (not b!1258013) (not start!105708))
(check-sat b_and!44979 (not b_next!27121))
