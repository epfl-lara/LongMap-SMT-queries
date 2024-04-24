; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105620 () Bool)

(assert start!105620)

(declare-fun b_free!27055 () Bool)

(declare-fun b_next!27055 () Bool)

(assert (=> start!105620 (= b_free!27055 (not b_next!27055))))

(declare-fun tp!94678 () Bool)

(declare-fun b_and!44903 () Bool)

(assert (=> start!105620 (= tp!94678 b_and!44903)))

(declare-fun b!1256964 () Bool)

(declare-fun e!714525 () Bool)

(assert (=> b!1256964 (= e!714525 true)))

(declare-datatypes ((V!47975 0))(
  ( (V!47976 (val!16041 Int)) )
))
(declare-datatypes ((tuple2!20736 0))(
  ( (tuple2!20737 (_1!10379 (_ BitVec 64)) (_2!10379 V!47975)) )
))
(declare-datatypes ((List!27969 0))(
  ( (Nil!27966) (Cons!27965 (h!29183 tuple2!20736) (t!41448 List!27969)) )
))
(declare-datatypes ((ListLongMap!18617 0))(
  ( (ListLongMap!18618 (toList!9324 List!27969)) )
))
(declare-fun lt!568169 () ListLongMap!18617)

(declare-fun -!2041 (ListLongMap!18617 (_ BitVec 64)) ListLongMap!18617)

(assert (=> b!1256964 (= (-!2041 lt!568169 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568169)))

(declare-datatypes ((Unit!41789 0))(
  ( (Unit!41790) )
))
(declare-fun lt!568172 () Unit!41789)

(declare-fun removeNotPresentStillSame!113 (ListLongMap!18617 (_ BitVec 64)) Unit!41789)

(assert (=> b!1256964 (= lt!568172 (removeNotPresentStillSame!113 lt!568169 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256965 () Bool)

(declare-fun res!837618 () Bool)

(declare-fun e!714520 () Bool)

(assert (=> b!1256965 (=> (not res!837618) (not e!714520))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81607 0))(
  ( (array!81608 (arr!39358 (Array (_ BitVec 32) (_ BitVec 64))) (size!39895 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81607)

(declare-datatypes ((ValueCell!15215 0))(
  ( (ValueCellFull!15215 (v!18737 V!47975)) (EmptyCell!15215) )
))
(declare-datatypes ((array!81609 0))(
  ( (array!81610 (arr!39359 (Array (_ BitVec 32) ValueCell!15215)) (size!39896 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81609)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1256965 (= res!837618 (and (= (size!39896 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39895 _keys!1118) (size!39896 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!837621 () Bool)

(assert (=> start!105620 (=> (not res!837621) (not e!714520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105620 (= res!837621 (validMask!0 mask!1466))))

(assert (=> start!105620 e!714520))

(assert (=> start!105620 true))

(assert (=> start!105620 tp!94678))

(declare-fun tp_is_empty!31957 () Bool)

(assert (=> start!105620 tp_is_empty!31957))

(declare-fun array_inv!30119 (array!81607) Bool)

(assert (=> start!105620 (array_inv!30119 _keys!1118)))

(declare-fun e!714519 () Bool)

(declare-fun array_inv!30120 (array!81609) Bool)

(assert (=> start!105620 (and (array_inv!30120 _values!914) e!714519)))

(declare-fun b!1256966 () Bool)

(declare-fun e!714523 () Bool)

(assert (=> b!1256966 (= e!714523 tp_is_empty!31957)))

(declare-fun mapNonEmpty!49720 () Bool)

(declare-fun mapRes!49720 () Bool)

(declare-fun tp!94679 () Bool)

(declare-fun e!714524 () Bool)

(assert (=> mapNonEmpty!49720 (= mapRes!49720 (and tp!94679 e!714524))))

(declare-fun mapRest!49720 () (Array (_ BitVec 32) ValueCell!15215))

(declare-fun mapKey!49720 () (_ BitVec 32))

(declare-fun mapValue!49720 () ValueCell!15215)

(assert (=> mapNonEmpty!49720 (= (arr!39359 _values!914) (store mapRest!49720 mapKey!49720 mapValue!49720))))

(declare-fun b!1256967 () Bool)

(assert (=> b!1256967 (= e!714519 (and e!714523 mapRes!49720))))

(declare-fun condMapEmpty!49720 () Bool)

(declare-fun mapDefault!49720 () ValueCell!15215)

(assert (=> b!1256967 (= condMapEmpty!49720 (= (arr!39359 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15215)) mapDefault!49720)))))

(declare-fun b!1256968 () Bool)

(declare-fun res!837619 () Bool)

(assert (=> b!1256968 (=> (not res!837619) (not e!714520))))

(declare-datatypes ((List!27970 0))(
  ( (Nil!27967) (Cons!27966 (h!29184 (_ BitVec 64)) (t!41449 List!27970)) )
))
(declare-fun arrayNoDuplicates!0 (array!81607 (_ BitVec 32) List!27970) Bool)

(assert (=> b!1256968 (= res!837619 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27967))))

(declare-fun b!1256969 () Bool)

(declare-fun e!714522 () Bool)

(assert (=> b!1256969 (= e!714520 (not e!714522))))

(declare-fun res!837617 () Bool)

(assert (=> b!1256969 (=> res!837617 e!714522)))

(assert (=> b!1256969 (= res!837617 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568168 () ListLongMap!18617)

(declare-fun lt!568171 () ListLongMap!18617)

(assert (=> b!1256969 (= lt!568168 lt!568171)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47975)

(declare-fun lt!568170 () Unit!41789)

(declare-fun zeroValue!871 () V!47975)

(declare-fun minValueBefore!43 () V!47975)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1060 (array!81607 array!81609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47975 V!47975 V!47975 V!47975 (_ BitVec 32) Int) Unit!41789)

(assert (=> b!1256969 (= lt!568170 (lemmaNoChangeToArrayThenSameMapNoExtras!1060 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5746 (array!81607 array!81609 (_ BitVec 32) (_ BitVec 32) V!47975 V!47975 (_ BitVec 32) Int) ListLongMap!18617)

(assert (=> b!1256969 (= lt!568171 (getCurrentListMapNoExtraKeys!5746 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256969 (= lt!568168 (getCurrentListMapNoExtraKeys!5746 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49720 () Bool)

(assert (=> mapIsEmpty!49720 mapRes!49720))

(declare-fun b!1256970 () Bool)

(assert (=> b!1256970 (= e!714522 e!714525)))

(declare-fun res!837620 () Bool)

(assert (=> b!1256970 (=> res!837620 e!714525)))

(declare-fun contains!7558 (ListLongMap!18617 (_ BitVec 64)) Bool)

(assert (=> b!1256970 (= res!837620 (contains!7558 lt!568169 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4536 (array!81607 array!81609 (_ BitVec 32) (_ BitVec 32) V!47975 V!47975 (_ BitVec 32) Int) ListLongMap!18617)

(assert (=> b!1256970 (= lt!568169 (getCurrentListMap!4536 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256971 () Bool)

(declare-fun res!837616 () Bool)

(assert (=> b!1256971 (=> (not res!837616) (not e!714520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81607 (_ BitVec 32)) Bool)

(assert (=> b!1256971 (= res!837616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256972 () Bool)

(assert (=> b!1256972 (= e!714524 tp_is_empty!31957)))

(assert (= (and start!105620 res!837621) b!1256965))

(assert (= (and b!1256965 res!837618) b!1256971))

(assert (= (and b!1256971 res!837616) b!1256968))

(assert (= (and b!1256968 res!837619) b!1256969))

(assert (= (and b!1256969 (not res!837617)) b!1256970))

(assert (= (and b!1256970 (not res!837620)) b!1256964))

(assert (= (and b!1256967 condMapEmpty!49720) mapIsEmpty!49720))

(assert (= (and b!1256967 (not condMapEmpty!49720)) mapNonEmpty!49720))

(get-info :version)

(assert (= (and mapNonEmpty!49720 ((_ is ValueCellFull!15215) mapValue!49720)) b!1256972))

(assert (= (and b!1256967 ((_ is ValueCellFull!15215) mapDefault!49720)) b!1256966))

(assert (= start!105620 b!1256967))

(declare-fun m!1157973 () Bool)

(assert (=> b!1256969 m!1157973))

(declare-fun m!1157975 () Bool)

(assert (=> b!1256969 m!1157975))

(declare-fun m!1157977 () Bool)

(assert (=> b!1256969 m!1157977))

(declare-fun m!1157979 () Bool)

(assert (=> b!1256964 m!1157979))

(declare-fun m!1157981 () Bool)

(assert (=> b!1256964 m!1157981))

(declare-fun m!1157983 () Bool)

(assert (=> start!105620 m!1157983))

(declare-fun m!1157985 () Bool)

(assert (=> start!105620 m!1157985))

(declare-fun m!1157987 () Bool)

(assert (=> start!105620 m!1157987))

(declare-fun m!1157989 () Bool)

(assert (=> b!1256971 m!1157989))

(declare-fun m!1157991 () Bool)

(assert (=> mapNonEmpty!49720 m!1157991))

(declare-fun m!1157993 () Bool)

(assert (=> b!1256970 m!1157993))

(declare-fun m!1157995 () Bool)

(assert (=> b!1256970 m!1157995))

(declare-fun m!1157997 () Bool)

(assert (=> b!1256968 m!1157997))

(check-sat (not b_next!27055) (not b!1256969) b_and!44903 (not b!1256970) (not start!105620) (not mapNonEmpty!49720) (not b!1256971) (not b!1256968) (not b!1256964) tp_is_empty!31957)
(check-sat b_and!44903 (not b_next!27055))
