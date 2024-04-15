; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105694 () Bool)

(assert start!105694)

(declare-fun b_free!27283 () Bool)

(declare-fun b_next!27283 () Bool)

(assert (=> start!105694 (= b_free!27283 (not b_next!27283))))

(declare-fun tp!95374 () Bool)

(declare-fun b_and!45149 () Bool)

(assert (=> start!105694 (= tp!95374 b_and!45149)))

(declare-fun b!1258959 () Bool)

(declare-fun e!716130 () Bool)

(declare-fun tp_is_empty!32185 () Bool)

(assert (=> b!1258959 (= e!716130 tp_is_empty!32185)))

(declare-fun b!1258960 () Bool)

(declare-fun e!716132 () Bool)

(declare-fun e!716128 () Bool)

(assert (=> b!1258960 (= e!716132 (not e!716128))))

(declare-fun res!839080 () Bool)

(assert (=> b!1258960 (=> res!839080 e!716128)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258960 (= res!839080 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48279 0))(
  ( (V!48280 (val!16155 Int)) )
))
(declare-datatypes ((tuple2!20962 0))(
  ( (tuple2!20963 (_1!10492 (_ BitVec 64)) (_2!10492 V!48279)) )
))
(declare-datatypes ((List!28169 0))(
  ( (Nil!28166) (Cons!28165 (h!29374 tuple2!20962) (t!41655 List!28169)) )
))
(declare-datatypes ((ListLongMap!18835 0))(
  ( (ListLongMap!18836 (toList!9433 List!28169)) )
))
(declare-fun lt!569450 () ListLongMap!18835)

(declare-fun lt!569457 () ListLongMap!18835)

(assert (=> b!1258960 (= lt!569450 lt!569457)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48279)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48279)

(declare-datatypes ((array!81917 0))(
  ( (array!81918 (arr!39514 (Array (_ BitVec 32) (_ BitVec 64))) (size!40052 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81917)

(declare-datatypes ((ValueCell!15329 0))(
  ( (ValueCellFull!15329 (v!18856 V!48279)) (EmptyCell!15329) )
))
(declare-datatypes ((array!81919 0))(
  ( (array!81920 (arr!39515 (Array (_ BitVec 32) ValueCell!15329)) (size!40053 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81919)

(declare-fun minValueBefore!43 () V!48279)

(declare-datatypes ((Unit!41812 0))(
  ( (Unit!41813) )
))
(declare-fun lt!569455 () Unit!41812)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1130 (array!81917 array!81919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48279 V!48279 V!48279 V!48279 (_ BitVec 32) Int) Unit!41812)

(assert (=> b!1258960 (= lt!569455 (lemmaNoChangeToArrayThenSameMapNoExtras!1130 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5808 (array!81917 array!81919 (_ BitVec 32) (_ BitVec 32) V!48279 V!48279 (_ BitVec 32) Int) ListLongMap!18835)

(assert (=> b!1258960 (= lt!569457 (getCurrentListMapNoExtraKeys!5808 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258960 (= lt!569450 (getCurrentListMapNoExtraKeys!5808 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839077 () Bool)

(assert (=> start!105694 (=> (not res!839077) (not e!716132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105694 (= res!839077 (validMask!0 mask!1466))))

(assert (=> start!105694 e!716132))

(assert (=> start!105694 true))

(assert (=> start!105694 tp!95374))

(assert (=> start!105694 tp_is_empty!32185))

(declare-fun array_inv!30233 (array!81917) Bool)

(assert (=> start!105694 (array_inv!30233 _keys!1118)))

(declare-fun e!716127 () Bool)

(declare-fun array_inv!30234 (array!81919) Bool)

(assert (=> start!105694 (and (array_inv!30234 _values!914) e!716127)))

(declare-fun b!1258961 () Bool)

(assert (=> b!1258961 (= e!716128 true)))

(declare-fun lt!569453 () ListLongMap!18835)

(declare-fun lt!569449 () ListLongMap!18835)

(declare-fun -!2056 (ListLongMap!18835 (_ BitVec 64)) ListLongMap!18835)

(assert (=> b!1258961 (= lt!569453 (-!2056 lt!569449 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569454 () ListLongMap!18835)

(declare-fun lt!569452 () ListLongMap!18835)

(assert (=> b!1258961 (= (-!2056 lt!569454 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569452)))

(declare-fun lt!569448 () Unit!41812)

(declare-fun addThenRemoveForNewKeyIsSame!313 (ListLongMap!18835 (_ BitVec 64) V!48279) Unit!41812)

(assert (=> b!1258961 (= lt!569448 (addThenRemoveForNewKeyIsSame!313 lt!569452 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716131 () Bool)

(assert (=> b!1258961 e!716131))

(declare-fun res!839081 () Bool)

(assert (=> b!1258961 (=> (not res!839081) (not e!716131))))

(assert (=> b!1258961 (= res!839081 (= lt!569449 lt!569454))))

(declare-fun +!4235 (ListLongMap!18835 tuple2!20962) ListLongMap!18835)

(assert (=> b!1258961 (= lt!569454 (+!4235 lt!569452 (tuple2!20963 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569451 () tuple2!20962)

(assert (=> b!1258961 (= lt!569452 (+!4235 lt!569450 lt!569451))))

(assert (=> b!1258961 (= lt!569451 (tuple2!20963 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!569456 () ListLongMap!18835)

(declare-fun getCurrentListMap!4522 (array!81917 array!81919 (_ BitVec 32) (_ BitVec 32) V!48279 V!48279 (_ BitVec 32) Int) ListLongMap!18835)

(assert (=> b!1258961 (= lt!569456 (getCurrentListMap!4522 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258961 (= lt!569449 (getCurrentListMap!4522 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258962 () Bool)

(declare-fun mapRes!50074 () Bool)

(assert (=> b!1258962 (= e!716127 (and e!716130 mapRes!50074))))

(declare-fun condMapEmpty!50074 () Bool)

(declare-fun mapDefault!50074 () ValueCell!15329)

(assert (=> b!1258962 (= condMapEmpty!50074 (= (arr!39515 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15329)) mapDefault!50074)))))

(declare-fun mapIsEmpty!50074 () Bool)

(assert (=> mapIsEmpty!50074 mapRes!50074))

(declare-fun b!1258963 () Bool)

(assert (=> b!1258963 (= e!716131 (= lt!569456 (+!4235 lt!569457 lt!569451)))))

(declare-fun b!1258964 () Bool)

(declare-fun res!839078 () Bool)

(assert (=> b!1258964 (=> (not res!839078) (not e!716132))))

(declare-datatypes ((List!28170 0))(
  ( (Nil!28167) (Cons!28166 (h!29375 (_ BitVec 64)) (t!41656 List!28170)) )
))
(declare-fun arrayNoDuplicates!0 (array!81917 (_ BitVec 32) List!28170) Bool)

(assert (=> b!1258964 (= res!839078 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28167))))

(declare-fun b!1258965 () Bool)

(declare-fun res!839076 () Bool)

(assert (=> b!1258965 (=> (not res!839076) (not e!716132))))

(assert (=> b!1258965 (= res!839076 (and (= (size!40053 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40052 _keys!1118) (size!40053 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258966 () Bool)

(declare-fun e!716129 () Bool)

(assert (=> b!1258966 (= e!716129 tp_is_empty!32185)))

(declare-fun b!1258967 () Bool)

(declare-fun res!839079 () Bool)

(assert (=> b!1258967 (=> (not res!839079) (not e!716132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81917 (_ BitVec 32)) Bool)

(assert (=> b!1258967 (= res!839079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50074 () Bool)

(declare-fun tp!95375 () Bool)

(assert (=> mapNonEmpty!50074 (= mapRes!50074 (and tp!95375 e!716129))))

(declare-fun mapRest!50074 () (Array (_ BitVec 32) ValueCell!15329))

(declare-fun mapValue!50074 () ValueCell!15329)

(declare-fun mapKey!50074 () (_ BitVec 32))

(assert (=> mapNonEmpty!50074 (= (arr!39515 _values!914) (store mapRest!50074 mapKey!50074 mapValue!50074))))

(assert (= (and start!105694 res!839077) b!1258965))

(assert (= (and b!1258965 res!839076) b!1258967))

(assert (= (and b!1258967 res!839079) b!1258964))

(assert (= (and b!1258964 res!839078) b!1258960))

(assert (= (and b!1258960 (not res!839080)) b!1258961))

(assert (= (and b!1258961 res!839081) b!1258963))

(assert (= (and b!1258962 condMapEmpty!50074) mapIsEmpty!50074))

(assert (= (and b!1258962 (not condMapEmpty!50074)) mapNonEmpty!50074))

(get-info :version)

(assert (= (and mapNonEmpty!50074 ((_ is ValueCellFull!15329) mapValue!50074)) b!1258966))

(assert (= (and b!1258962 ((_ is ValueCellFull!15329) mapDefault!50074)) b!1258959))

(assert (= start!105694 b!1258962))

(declare-fun m!1158893 () Bool)

(assert (=> mapNonEmpty!50074 m!1158893))

(declare-fun m!1158895 () Bool)

(assert (=> start!105694 m!1158895))

(declare-fun m!1158897 () Bool)

(assert (=> start!105694 m!1158897))

(declare-fun m!1158899 () Bool)

(assert (=> start!105694 m!1158899))

(declare-fun m!1158901 () Bool)

(assert (=> b!1258967 m!1158901))

(declare-fun m!1158903 () Bool)

(assert (=> b!1258961 m!1158903))

(declare-fun m!1158905 () Bool)

(assert (=> b!1258961 m!1158905))

(declare-fun m!1158907 () Bool)

(assert (=> b!1258961 m!1158907))

(declare-fun m!1158909 () Bool)

(assert (=> b!1258961 m!1158909))

(declare-fun m!1158911 () Bool)

(assert (=> b!1258961 m!1158911))

(declare-fun m!1158913 () Bool)

(assert (=> b!1258961 m!1158913))

(declare-fun m!1158915 () Bool)

(assert (=> b!1258961 m!1158915))

(declare-fun m!1158917 () Bool)

(assert (=> b!1258964 m!1158917))

(declare-fun m!1158919 () Bool)

(assert (=> b!1258960 m!1158919))

(declare-fun m!1158921 () Bool)

(assert (=> b!1258960 m!1158921))

(declare-fun m!1158923 () Bool)

(assert (=> b!1258960 m!1158923))

(declare-fun m!1158925 () Bool)

(assert (=> b!1258963 m!1158925))

(check-sat (not b!1258961) (not b!1258967) (not b!1258964) b_and!45149 (not b!1258963) (not b_next!27283) (not b!1258960) (not start!105694) tp_is_empty!32185 (not mapNonEmpty!50074))
(check-sat b_and!45149 (not b_next!27283))
