; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105512 () Bool)

(assert start!105512)

(declare-fun b_free!26983 () Bool)

(declare-fun b_next!26983 () Bool)

(assert (=> start!105512 (= b_free!26983 (not b_next!26983))))

(declare-fun tp!94456 () Bool)

(declare-fun b_and!44811 () Bool)

(assert (=> start!105512 (= tp!94456 b_and!44811)))

(declare-fun b!1255910 () Bool)

(declare-fun res!837045 () Bool)

(declare-fun e!713777 () Bool)

(assert (=> b!1255910 (=> (not res!837045) (not e!713777))))

(declare-datatypes ((array!81469 0))(
  ( (array!81470 (arr!39291 (Array (_ BitVec 32) (_ BitVec 64))) (size!39828 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81469)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81469 (_ BitVec 32)) Bool)

(assert (=> b!1255910 (= res!837045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!837042 () Bool)

(assert (=> start!105512 (=> (not res!837042) (not e!713777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105512 (= res!837042 (validMask!0 mask!1466))))

(assert (=> start!105512 e!713777))

(assert (=> start!105512 true))

(assert (=> start!105512 tp!94456))

(declare-fun tp_is_empty!31885 () Bool)

(assert (=> start!105512 tp_is_empty!31885))

(declare-fun array_inv!30071 (array!81469) Bool)

(assert (=> start!105512 (array_inv!30071 _keys!1118)))

(declare-datatypes ((V!47879 0))(
  ( (V!47880 (val!16005 Int)) )
))
(declare-datatypes ((ValueCell!15179 0))(
  ( (ValueCellFull!15179 (v!18700 V!47879)) (EmptyCell!15179) )
))
(declare-datatypes ((array!81471 0))(
  ( (array!81472 (arr!39292 (Array (_ BitVec 32) ValueCell!15179)) (size!39829 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81471)

(declare-fun e!713779 () Bool)

(declare-fun array_inv!30072 (array!81471) Bool)

(assert (=> start!105512 (and (array_inv!30072 _values!914) e!713779)))

(declare-fun b!1255911 () Bool)

(declare-fun res!837044 () Bool)

(assert (=> b!1255911 (=> (not res!837044) (not e!713777))))

(declare-datatypes ((List!27922 0))(
  ( (Nil!27919) (Cons!27918 (h!29136 (_ BitVec 64)) (t!41397 List!27922)) )
))
(declare-fun arrayNoDuplicates!0 (array!81469 (_ BitVec 32) List!27922) Bool)

(assert (=> b!1255911 (= res!837044 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27919))))

(declare-fun b!1255912 () Bool)

(declare-fun e!713780 () Bool)

(assert (=> b!1255912 (= e!713780 tp_is_empty!31885)))

(declare-fun b!1255913 () Bool)

(declare-fun mapRes!49606 () Bool)

(assert (=> b!1255913 (= e!713779 (and e!713780 mapRes!49606))))

(declare-fun condMapEmpty!49606 () Bool)

(declare-fun mapDefault!49606 () ValueCell!15179)

(assert (=> b!1255913 (= condMapEmpty!49606 (= (arr!39292 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15179)) mapDefault!49606)))))

(declare-fun b!1255914 () Bool)

(declare-fun e!713778 () Bool)

(assert (=> b!1255914 (= e!713778 true)))

(declare-datatypes ((tuple2!20686 0))(
  ( (tuple2!20687 (_1!10354 (_ BitVec 64)) (_2!10354 V!47879)) )
))
(declare-datatypes ((List!27923 0))(
  ( (Nil!27920) (Cons!27919 (h!29137 tuple2!20686) (t!41398 List!27923)) )
))
(declare-datatypes ((ListLongMap!18567 0))(
  ( (ListLongMap!18568 (toList!9299 List!27923)) )
))
(declare-fun lt!567577 () ListLongMap!18567)

(declare-fun lt!567574 () ListLongMap!18567)

(declare-fun -!2036 (ListLongMap!18567 (_ BitVec 64)) ListLongMap!18567)

(assert (=> b!1255914 (= lt!567577 (-!2036 lt!567574 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567580 () ListLongMap!18567)

(declare-fun lt!567573 () ListLongMap!18567)

(assert (=> b!1255914 (= (-!2036 lt!567580 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567573)))

(declare-datatypes ((Unit!41737 0))(
  ( (Unit!41738) )
))
(declare-fun lt!567575 () Unit!41737)

(declare-fun minValueBefore!43 () V!47879)

(declare-fun addThenRemoveForNewKeyIsSame!326 (ListLongMap!18567 (_ BitVec 64) V!47879) Unit!41737)

(assert (=> b!1255914 (= lt!567575 (addThenRemoveForNewKeyIsSame!326 lt!567573 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567576 () ListLongMap!18567)

(declare-fun lt!567578 () ListLongMap!18567)

(assert (=> b!1255914 (and (= lt!567574 lt!567580) (= lt!567578 lt!567576))))

(declare-fun +!4232 (ListLongMap!18567 tuple2!20686) ListLongMap!18567)

(assert (=> b!1255914 (= lt!567580 (+!4232 lt!567573 (tuple2!20687 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47879)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47879)

(declare-fun getCurrentListMap!4529 (array!81469 array!81471 (_ BitVec 32) (_ BitVec 32) V!47879 V!47879 (_ BitVec 32) Int) ListLongMap!18567)

(assert (=> b!1255914 (= lt!567578 (getCurrentListMap!4529 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255914 (= lt!567574 (getCurrentListMap!4529 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49606 () Bool)

(declare-fun tp!94457 () Bool)

(declare-fun e!713776 () Bool)

(assert (=> mapNonEmpty!49606 (= mapRes!49606 (and tp!94457 e!713776))))

(declare-fun mapKey!49606 () (_ BitVec 32))

(declare-fun mapRest!49606 () (Array (_ BitVec 32) ValueCell!15179))

(declare-fun mapValue!49606 () ValueCell!15179)

(assert (=> mapNonEmpty!49606 (= (arr!39292 _values!914) (store mapRest!49606 mapKey!49606 mapValue!49606))))

(declare-fun b!1255915 () Bool)

(assert (=> b!1255915 (= e!713776 tp_is_empty!31885)))

(declare-fun b!1255916 () Bool)

(assert (=> b!1255916 (= e!713777 (not e!713778))))

(declare-fun res!837046 () Bool)

(assert (=> b!1255916 (=> res!837046 e!713778)))

(assert (=> b!1255916 (= res!837046 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1255916 (= lt!567573 lt!567576)))

(declare-fun lt!567579 () Unit!41737)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1037 (array!81469 array!81471 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47879 V!47879 V!47879 V!47879 (_ BitVec 32) Int) Unit!41737)

(assert (=> b!1255916 (= lt!567579 (lemmaNoChangeToArrayThenSameMapNoExtras!1037 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5723 (array!81469 array!81471 (_ BitVec 32) (_ BitVec 32) V!47879 V!47879 (_ BitVec 32) Int) ListLongMap!18567)

(assert (=> b!1255916 (= lt!567576 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255916 (= lt!567573 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49606 () Bool)

(assert (=> mapIsEmpty!49606 mapRes!49606))

(declare-fun b!1255917 () Bool)

(declare-fun res!837043 () Bool)

(assert (=> b!1255917 (=> (not res!837043) (not e!713777))))

(assert (=> b!1255917 (= res!837043 (and (= (size!39829 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39828 _keys!1118) (size!39829 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105512 res!837042) b!1255917))

(assert (= (and b!1255917 res!837043) b!1255910))

(assert (= (and b!1255910 res!837045) b!1255911))

(assert (= (and b!1255911 res!837044) b!1255916))

(assert (= (and b!1255916 (not res!837046)) b!1255914))

(assert (= (and b!1255913 condMapEmpty!49606) mapIsEmpty!49606))

(assert (= (and b!1255913 (not condMapEmpty!49606)) mapNonEmpty!49606))

(get-info :version)

(assert (= (and mapNonEmpty!49606 ((_ is ValueCellFull!15179) mapValue!49606)) b!1255915))

(assert (= (and b!1255913 ((_ is ValueCellFull!15179) mapDefault!49606)) b!1255912))

(assert (= start!105512 b!1255913))

(declare-fun m!1156991 () Bool)

(assert (=> b!1255914 m!1156991))

(declare-fun m!1156993 () Bool)

(assert (=> b!1255914 m!1156993))

(declare-fun m!1156995 () Bool)

(assert (=> b!1255914 m!1156995))

(declare-fun m!1156997 () Bool)

(assert (=> b!1255914 m!1156997))

(declare-fun m!1156999 () Bool)

(assert (=> b!1255914 m!1156999))

(declare-fun m!1157001 () Bool)

(assert (=> b!1255914 m!1157001))

(declare-fun m!1157003 () Bool)

(assert (=> b!1255916 m!1157003))

(declare-fun m!1157005 () Bool)

(assert (=> b!1255916 m!1157005))

(declare-fun m!1157007 () Bool)

(assert (=> b!1255916 m!1157007))

(declare-fun m!1157009 () Bool)

(assert (=> b!1255911 m!1157009))

(declare-fun m!1157011 () Bool)

(assert (=> start!105512 m!1157011))

(declare-fun m!1157013 () Bool)

(assert (=> start!105512 m!1157013))

(declare-fun m!1157015 () Bool)

(assert (=> start!105512 m!1157015))

(declare-fun m!1157017 () Bool)

(assert (=> mapNonEmpty!49606 m!1157017))

(declare-fun m!1157019 () Bool)

(assert (=> b!1255910 m!1157019))

(check-sat (not mapNonEmpty!49606) b_and!44811 (not b!1255914) (not b!1255916) (not b!1255910) (not b_next!26983) (not b!1255911) (not start!105512) tp_is_empty!31885)
(check-sat b_and!44811 (not b_next!26983))
