; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105366 () Bool)

(assert start!105366)

(declare-fun b_free!27039 () Bool)

(declare-fun b_next!27039 () Bool)

(assert (=> start!105366 (= b_free!27039 (not b_next!27039))))

(declare-fun tp!94627 () Bool)

(declare-fun b_and!44877 () Bool)

(assert (=> start!105366 (= tp!94627 b_and!44877)))

(declare-fun b!1255393 () Bool)

(declare-fun e!713484 () Bool)

(declare-fun e!713485 () Bool)

(declare-fun mapRes!49693 () Bool)

(assert (=> b!1255393 (= e!713484 (and e!713485 mapRes!49693))))

(declare-fun condMapEmpty!49693 () Bool)

(declare-datatypes ((V!47953 0))(
  ( (V!47954 (val!16033 Int)) )
))
(declare-datatypes ((ValueCell!15207 0))(
  ( (ValueCellFull!15207 (v!18733 V!47953)) (EmptyCell!15207) )
))
(declare-datatypes ((array!81528 0))(
  ( (array!81529 (arr!39324 (Array (_ BitVec 32) ValueCell!15207)) (size!39860 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81528)

(declare-fun mapDefault!49693 () ValueCell!15207)

(assert (=> b!1255393 (= condMapEmpty!49693 (= (arr!39324 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15207)) mapDefault!49693)))))

(declare-fun mapNonEmpty!49693 () Bool)

(declare-fun tp!94628 () Bool)

(declare-fun e!713486 () Bool)

(assert (=> mapNonEmpty!49693 (= mapRes!49693 (and tp!94628 e!713486))))

(declare-fun mapRest!49693 () (Array (_ BitVec 32) ValueCell!15207))

(declare-fun mapKey!49693 () (_ BitVec 32))

(declare-fun mapValue!49693 () ValueCell!15207)

(assert (=> mapNonEmpty!49693 (= (arr!39324 _values!914) (store mapRest!49693 mapKey!49693 mapValue!49693))))

(declare-fun b!1255394 () Bool)

(declare-fun tp_is_empty!31941 () Bool)

(assert (=> b!1255394 (= e!713486 tp_is_empty!31941)))

(declare-fun res!836959 () Bool)

(declare-fun e!713488 () Bool)

(assert (=> start!105366 (=> (not res!836959) (not e!713488))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105366 (= res!836959 (validMask!0 mask!1466))))

(assert (=> start!105366 e!713488))

(assert (=> start!105366 true))

(assert (=> start!105366 tp!94627))

(assert (=> start!105366 tp_is_empty!31941))

(declare-datatypes ((array!81530 0))(
  ( (array!81531 (arr!39325 (Array (_ BitVec 32) (_ BitVec 64))) (size!39861 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81530)

(declare-fun array_inv!29965 (array!81530) Bool)

(assert (=> start!105366 (array_inv!29965 _keys!1118)))

(declare-fun array_inv!29966 (array!81528) Bool)

(assert (=> start!105366 (and (array_inv!29966 _values!914) e!713484)))

(declare-fun b!1255395 () Bool)

(declare-fun res!836957 () Bool)

(assert (=> b!1255395 (=> (not res!836957) (not e!713488))))

(declare-datatypes ((List!27926 0))(
  ( (Nil!27923) (Cons!27922 (h!29131 (_ BitVec 64)) (t!41411 List!27926)) )
))
(declare-fun arrayNoDuplicates!0 (array!81530 (_ BitVec 32) List!27926) Bool)

(assert (=> b!1255395 (= res!836957 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27923))))

(declare-fun b!1255396 () Bool)

(assert (=> b!1255396 (= e!713485 tp_is_empty!31941)))

(declare-fun b!1255397 () Bool)

(assert (=> b!1255397 (= e!713488 (not true))))

(declare-datatypes ((tuple2!20704 0))(
  ( (tuple2!20705 (_1!10363 (_ BitVec 64)) (_2!10363 V!47953)) )
))
(declare-datatypes ((List!27927 0))(
  ( (Nil!27924) (Cons!27923 (h!29132 tuple2!20704) (t!41412 List!27927)) )
))
(declare-datatypes ((ListLongMap!18577 0))(
  ( (ListLongMap!18578 (toList!9304 List!27927)) )
))
(declare-fun lt!567560 () ListLongMap!18577)

(declare-fun lt!567559 () ListLongMap!18577)

(assert (=> b!1255397 (= lt!567560 lt!567559)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47953)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47953)

(declare-datatypes ((Unit!41794 0))(
  ( (Unit!41795) )
))
(declare-fun lt!567561 () Unit!41794)

(declare-fun minValueBefore!43 () V!47953)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1053 (array!81530 array!81528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47953 V!47953 V!47953 V!47953 (_ BitVec 32) Int) Unit!41794)

(assert (=> b!1255397 (= lt!567561 (lemmaNoChangeToArrayThenSameMapNoExtras!1053 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5689 (array!81530 array!81528 (_ BitVec 32) (_ BitVec 32) V!47953 V!47953 (_ BitVec 32) Int) ListLongMap!18577)

(assert (=> b!1255397 (= lt!567559 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255397 (= lt!567560 (getCurrentListMapNoExtraKeys!5689 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255398 () Bool)

(declare-fun res!836958 () Bool)

(assert (=> b!1255398 (=> (not res!836958) (not e!713488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81530 (_ BitVec 32)) Bool)

(assert (=> b!1255398 (= res!836958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49693 () Bool)

(assert (=> mapIsEmpty!49693 mapRes!49693))

(declare-fun b!1255399 () Bool)

(declare-fun res!836956 () Bool)

(assert (=> b!1255399 (=> (not res!836956) (not e!713488))))

(assert (=> b!1255399 (= res!836956 (and (= (size!39860 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39861 _keys!1118) (size!39860 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105366 res!836959) b!1255399))

(assert (= (and b!1255399 res!836956) b!1255398))

(assert (= (and b!1255398 res!836958) b!1255395))

(assert (= (and b!1255395 res!836957) b!1255397))

(assert (= (and b!1255393 condMapEmpty!49693) mapIsEmpty!49693))

(assert (= (and b!1255393 (not condMapEmpty!49693)) mapNonEmpty!49693))

(get-info :version)

(assert (= (and mapNonEmpty!49693 ((_ is ValueCellFull!15207) mapValue!49693)) b!1255394))

(assert (= (and b!1255393 ((_ is ValueCellFull!15207) mapDefault!49693)) b!1255396))

(assert (= start!105366 b!1255393))

(declare-fun m!1156139 () Bool)

(assert (=> start!105366 m!1156139))

(declare-fun m!1156141 () Bool)

(assert (=> start!105366 m!1156141))

(declare-fun m!1156143 () Bool)

(assert (=> start!105366 m!1156143))

(declare-fun m!1156145 () Bool)

(assert (=> mapNonEmpty!49693 m!1156145))

(declare-fun m!1156147 () Bool)

(assert (=> b!1255395 m!1156147))

(declare-fun m!1156149 () Bool)

(assert (=> b!1255397 m!1156149))

(declare-fun m!1156151 () Bool)

(assert (=> b!1255397 m!1156151))

(declare-fun m!1156153 () Bool)

(assert (=> b!1255397 m!1156153))

(declare-fun m!1156155 () Bool)

(assert (=> b!1255398 m!1156155))

(check-sat (not b!1255397) (not start!105366) (not b!1255398) (not b!1255395) (not b_next!27039) tp_is_empty!31941 b_and!44877 (not mapNonEmpty!49693))
(check-sat b_and!44877 (not b_next!27039))
