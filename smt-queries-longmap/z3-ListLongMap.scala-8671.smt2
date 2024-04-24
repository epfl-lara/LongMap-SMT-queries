; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105626 () Bool)

(assert start!105626)

(declare-fun b_free!27061 () Bool)

(declare-fun b_next!27061 () Bool)

(assert (=> start!105626 (= b_free!27061 (not b_next!27061))))

(declare-fun tp!94697 () Bool)

(declare-fun b_and!44909 () Bool)

(assert (=> start!105626 (= tp!94697 b_and!44909)))

(declare-fun b!1257045 () Bool)

(declare-fun e!714587 () Bool)

(declare-fun e!714584 () Bool)

(assert (=> b!1257045 (= e!714587 e!714584)))

(declare-fun res!837671 () Bool)

(assert (=> b!1257045 (=> res!837671 e!714584)))

(declare-datatypes ((V!47983 0))(
  ( (V!47984 (val!16044 Int)) )
))
(declare-datatypes ((tuple2!20738 0))(
  ( (tuple2!20739 (_1!10380 (_ BitVec 64)) (_2!10380 V!47983)) )
))
(declare-datatypes ((List!27971 0))(
  ( (Nil!27968) (Cons!27967 (h!29185 tuple2!20738) (t!41450 List!27971)) )
))
(declare-datatypes ((ListLongMap!18619 0))(
  ( (ListLongMap!18620 (toList!9325 List!27971)) )
))
(declare-fun lt!568214 () ListLongMap!18619)

(declare-fun contains!7559 (ListLongMap!18619 (_ BitVec 64)) Bool)

(assert (=> b!1257045 (= res!837671 (contains!7559 lt!568214 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47983)

(declare-datatypes ((array!81617 0))(
  ( (array!81618 (arr!39363 (Array (_ BitVec 32) (_ BitVec 64))) (size!39900 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81617)

(declare-datatypes ((ValueCell!15218 0))(
  ( (ValueCellFull!15218 (v!18740 V!47983)) (EmptyCell!15218) )
))
(declare-datatypes ((array!81619 0))(
  ( (array!81620 (arr!39364 (Array (_ BitVec 32) ValueCell!15218)) (size!39901 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81619)

(declare-fun minValueBefore!43 () V!47983)

(declare-fun getCurrentListMap!4537 (array!81617 array!81619 (_ BitVec 32) (_ BitVec 32) V!47983 V!47983 (_ BitVec 32) Int) ListLongMap!18619)

(assert (=> b!1257045 (= lt!568214 (getCurrentListMap!4537 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257046 () Bool)

(declare-fun e!714583 () Bool)

(declare-fun tp_is_empty!31963 () Bool)

(assert (=> b!1257046 (= e!714583 tp_is_empty!31963)))

(declare-fun b!1257047 () Bool)

(declare-fun e!714582 () Bool)

(assert (=> b!1257047 (= e!714582 tp_is_empty!31963)))

(declare-fun mapIsEmpty!49729 () Bool)

(declare-fun mapRes!49729 () Bool)

(assert (=> mapIsEmpty!49729 mapRes!49729))

(declare-fun res!837672 () Bool)

(declare-fun e!714586 () Bool)

(assert (=> start!105626 (=> (not res!837672) (not e!714586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105626 (= res!837672 (validMask!0 mask!1466))))

(assert (=> start!105626 e!714586))

(assert (=> start!105626 true))

(assert (=> start!105626 tp!94697))

(assert (=> start!105626 tp_is_empty!31963))

(declare-fun array_inv!30121 (array!81617) Bool)

(assert (=> start!105626 (array_inv!30121 _keys!1118)))

(declare-fun e!714585 () Bool)

(declare-fun array_inv!30122 (array!81619) Bool)

(assert (=> start!105626 (and (array_inv!30122 _values!914) e!714585)))

(declare-fun b!1257048 () Bool)

(declare-fun res!837670 () Bool)

(assert (=> b!1257048 (=> (not res!837670) (not e!714586))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257048 (= res!837670 (and (= (size!39901 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39900 _keys!1118) (size!39901 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257049 () Bool)

(declare-fun res!837673 () Bool)

(assert (=> b!1257049 (=> (not res!837673) (not e!714586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81617 (_ BitVec 32)) Bool)

(assert (=> b!1257049 (= res!837673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257050 () Bool)

(assert (=> b!1257050 (= e!714584 true)))

(declare-fun -!2042 (ListLongMap!18619 (_ BitVec 64)) ListLongMap!18619)

(assert (=> b!1257050 (= (-!2042 lt!568214 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568214)))

(declare-datatypes ((Unit!41791 0))(
  ( (Unit!41792) )
))
(declare-fun lt!568215 () Unit!41791)

(declare-fun removeNotPresentStillSame!114 (ListLongMap!18619 (_ BitVec 64)) Unit!41791)

(assert (=> b!1257050 (= lt!568215 (removeNotPresentStillSame!114 lt!568214 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257051 () Bool)

(assert (=> b!1257051 (= e!714586 (not e!714587))))

(declare-fun res!837675 () Bool)

(assert (=> b!1257051 (=> res!837675 e!714587)))

(assert (=> b!1257051 (= res!837675 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568213 () ListLongMap!18619)

(declare-fun lt!568217 () ListLongMap!18619)

(assert (=> b!1257051 (= lt!568213 lt!568217)))

(declare-fun minValueAfter!43 () V!47983)

(declare-fun lt!568216 () Unit!41791)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1061 (array!81617 array!81619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47983 V!47983 V!47983 V!47983 (_ BitVec 32) Int) Unit!41791)

(assert (=> b!1257051 (= lt!568216 (lemmaNoChangeToArrayThenSameMapNoExtras!1061 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5747 (array!81617 array!81619 (_ BitVec 32) (_ BitVec 32) V!47983 V!47983 (_ BitVec 32) Int) ListLongMap!18619)

(assert (=> b!1257051 (= lt!568217 (getCurrentListMapNoExtraKeys!5747 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257051 (= lt!568213 (getCurrentListMapNoExtraKeys!5747 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49729 () Bool)

(declare-fun tp!94696 () Bool)

(assert (=> mapNonEmpty!49729 (= mapRes!49729 (and tp!94696 e!714582))))

(declare-fun mapValue!49729 () ValueCell!15218)

(declare-fun mapRest!49729 () (Array (_ BitVec 32) ValueCell!15218))

(declare-fun mapKey!49729 () (_ BitVec 32))

(assert (=> mapNonEmpty!49729 (= (arr!39364 _values!914) (store mapRest!49729 mapKey!49729 mapValue!49729))))

(declare-fun b!1257052 () Bool)

(assert (=> b!1257052 (= e!714585 (and e!714583 mapRes!49729))))

(declare-fun condMapEmpty!49729 () Bool)

(declare-fun mapDefault!49729 () ValueCell!15218)

(assert (=> b!1257052 (= condMapEmpty!49729 (= (arr!39364 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15218)) mapDefault!49729)))))

(declare-fun b!1257053 () Bool)

(declare-fun res!837674 () Bool)

(assert (=> b!1257053 (=> (not res!837674) (not e!714586))))

(declare-datatypes ((List!27972 0))(
  ( (Nil!27969) (Cons!27968 (h!29186 (_ BitVec 64)) (t!41451 List!27972)) )
))
(declare-fun arrayNoDuplicates!0 (array!81617 (_ BitVec 32) List!27972) Bool)

(assert (=> b!1257053 (= res!837674 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27969))))

(assert (= (and start!105626 res!837672) b!1257048))

(assert (= (and b!1257048 res!837670) b!1257049))

(assert (= (and b!1257049 res!837673) b!1257053))

(assert (= (and b!1257053 res!837674) b!1257051))

(assert (= (and b!1257051 (not res!837675)) b!1257045))

(assert (= (and b!1257045 (not res!837671)) b!1257050))

(assert (= (and b!1257052 condMapEmpty!49729) mapIsEmpty!49729))

(assert (= (and b!1257052 (not condMapEmpty!49729)) mapNonEmpty!49729))

(get-info :version)

(assert (= (and mapNonEmpty!49729 ((_ is ValueCellFull!15218) mapValue!49729)) b!1257047))

(assert (= (and b!1257052 ((_ is ValueCellFull!15218) mapDefault!49729)) b!1257046))

(assert (= start!105626 b!1257052))

(declare-fun m!1158051 () Bool)

(assert (=> b!1257053 m!1158051))

(declare-fun m!1158053 () Bool)

(assert (=> start!105626 m!1158053))

(declare-fun m!1158055 () Bool)

(assert (=> start!105626 m!1158055))

(declare-fun m!1158057 () Bool)

(assert (=> start!105626 m!1158057))

(declare-fun m!1158059 () Bool)

(assert (=> b!1257051 m!1158059))

(declare-fun m!1158061 () Bool)

(assert (=> b!1257051 m!1158061))

(declare-fun m!1158063 () Bool)

(assert (=> b!1257051 m!1158063))

(declare-fun m!1158065 () Bool)

(assert (=> mapNonEmpty!49729 m!1158065))

(declare-fun m!1158067 () Bool)

(assert (=> b!1257045 m!1158067))

(declare-fun m!1158069 () Bool)

(assert (=> b!1257045 m!1158069))

(declare-fun m!1158071 () Bool)

(assert (=> b!1257050 m!1158071))

(declare-fun m!1158073 () Bool)

(assert (=> b!1257050 m!1158073))

(declare-fun m!1158075 () Bool)

(assert (=> b!1257049 m!1158075))

(check-sat (not b!1257050) (not b!1257053) (not b!1257049) tp_is_empty!31963 b_and!44909 (not b_next!27061) (not start!105626) (not mapNonEmpty!49729) (not b!1257045) (not b!1257051))
(check-sat b_and!44909 (not b_next!27061))
