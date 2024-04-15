; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105398 () Bool)

(assert start!105398)

(declare-fun b_free!27061 () Bool)

(declare-fun b_next!27061 () Bool)

(assert (=> start!105398 (= b_free!27061 (not b_next!27061))))

(declare-fun tp!94697 () Bool)

(declare-fun b_and!44889 () Bool)

(assert (=> start!105398 (= tp!94697 b_and!44889)))

(declare-fun b!1255658 () Bool)

(declare-fun e!713695 () Bool)

(declare-fun tp_is_empty!31963 () Bool)

(assert (=> b!1255658 (= e!713695 tp_is_empty!31963)))

(declare-fun b!1255659 () Bool)

(declare-fun e!713691 () Bool)

(declare-fun e!713696 () Bool)

(assert (=> b!1255659 (= e!713691 e!713696)))

(declare-fun res!837111 () Bool)

(assert (=> b!1255659 (=> res!837111 e!713696)))

(declare-datatypes ((V!47983 0))(
  ( (V!47984 (val!16044 Int)) )
))
(declare-datatypes ((tuple2!20800 0))(
  ( (tuple2!20801 (_1!10411 (_ BitVec 64)) (_2!10411 V!47983)) )
))
(declare-datatypes ((List!28011 0))(
  ( (Nil!28008) (Cons!28007 (h!29216 tuple2!20800) (t!41489 List!28011)) )
))
(declare-datatypes ((ListLongMap!18673 0))(
  ( (ListLongMap!18674 (toList!9352 List!28011)) )
))
(declare-fun lt!567551 () ListLongMap!18673)

(declare-fun contains!7504 (ListLongMap!18673 (_ BitVec 64)) Bool)

(assert (=> b!1255659 (= res!837111 (contains!7504 lt!567551 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47983)

(declare-datatypes ((array!81497 0))(
  ( (array!81498 (arr!39308 (Array (_ BitVec 32) (_ BitVec 64))) (size!39846 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81497)

(declare-datatypes ((ValueCell!15218 0))(
  ( (ValueCellFull!15218 (v!18743 V!47983)) (EmptyCell!15218) )
))
(declare-datatypes ((array!81499 0))(
  ( (array!81500 (arr!39309 (Array (_ BitVec 32) ValueCell!15218)) (size!39847 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81499)

(declare-fun minValueBefore!43 () V!47983)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun getCurrentListMap!4464 (array!81497 array!81499 (_ BitVec 32) (_ BitVec 32) V!47983 V!47983 (_ BitVec 32) Int) ListLongMap!18673)

(assert (=> b!1255659 (= lt!567551 (getCurrentListMap!4464 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255660 () Bool)

(declare-fun e!713690 () Bool)

(declare-fun mapRes!49729 () Bool)

(assert (=> b!1255660 (= e!713690 (and e!713695 mapRes!49729))))

(declare-fun condMapEmpty!49729 () Bool)

(declare-fun mapDefault!49729 () ValueCell!15218)

(assert (=> b!1255660 (= condMapEmpty!49729 (= (arr!39309 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15218)) mapDefault!49729)))))

(declare-fun mapIsEmpty!49729 () Bool)

(assert (=> mapIsEmpty!49729 mapRes!49729))

(declare-fun b!1255661 () Bool)

(declare-fun e!713692 () Bool)

(assert (=> b!1255661 (= e!713692 (not e!713691))))

(declare-fun res!837115 () Bool)

(assert (=> b!1255661 (=> res!837115 e!713691)))

(assert (=> b!1255661 (= res!837115 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567550 () ListLongMap!18673)

(declare-fun lt!567552 () ListLongMap!18673)

(assert (=> b!1255661 (= lt!567550 lt!567552)))

(declare-fun minValueAfter!43 () V!47983)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41669 0))(
  ( (Unit!41670) )
))
(declare-fun lt!567553 () Unit!41669)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1068 (array!81497 array!81499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47983 V!47983 V!47983 V!47983 (_ BitVec 32) Int) Unit!41669)

(assert (=> b!1255661 (= lt!567553 (lemmaNoChangeToArrayThenSameMapNoExtras!1068 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5746 (array!81497 array!81499 (_ BitVec 32) (_ BitVec 32) V!47983 V!47983 (_ BitVec 32) Int) ListLongMap!18673)

(assert (=> b!1255661 (= lt!567552 (getCurrentListMapNoExtraKeys!5746 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255661 (= lt!567550 (getCurrentListMapNoExtraKeys!5746 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255662 () Bool)

(declare-fun res!837110 () Bool)

(assert (=> b!1255662 (=> (not res!837110) (not e!713692))))

(assert (=> b!1255662 (= res!837110 (and (= (size!39847 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39846 _keys!1118) (size!39847 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255663 () Bool)

(declare-fun e!713694 () Bool)

(assert (=> b!1255663 (= e!713694 tp_is_empty!31963)))

(declare-fun b!1255664 () Bool)

(declare-fun res!837112 () Bool)

(assert (=> b!1255664 (=> (not res!837112) (not e!713692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81497 (_ BitVec 32)) Bool)

(assert (=> b!1255664 (= res!837112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!837113 () Bool)

(assert (=> start!105398 (=> (not res!837113) (not e!713692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105398 (= res!837113 (validMask!0 mask!1466))))

(assert (=> start!105398 e!713692))

(assert (=> start!105398 true))

(assert (=> start!105398 tp!94697))

(assert (=> start!105398 tp_is_empty!31963))

(declare-fun array_inv!30087 (array!81497) Bool)

(assert (=> start!105398 (array_inv!30087 _keys!1118)))

(declare-fun array_inv!30088 (array!81499) Bool)

(assert (=> start!105398 (and (array_inv!30088 _values!914) e!713690)))

(declare-fun b!1255665 () Bool)

(declare-fun res!837114 () Bool)

(assert (=> b!1255665 (=> (not res!837114) (not e!713692))))

(declare-datatypes ((List!28012 0))(
  ( (Nil!28009) (Cons!28008 (h!29217 (_ BitVec 64)) (t!41490 List!28012)) )
))
(declare-fun arrayNoDuplicates!0 (array!81497 (_ BitVec 32) List!28012) Bool)

(assert (=> b!1255665 (= res!837114 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28009))))

(declare-fun mapNonEmpty!49729 () Bool)

(declare-fun tp!94696 () Bool)

(assert (=> mapNonEmpty!49729 (= mapRes!49729 (and tp!94696 e!713694))))

(declare-fun mapRest!49729 () (Array (_ BitVec 32) ValueCell!15218))

(declare-fun mapKey!49729 () (_ BitVec 32))

(declare-fun mapValue!49729 () ValueCell!15218)

(assert (=> mapNonEmpty!49729 (= (arr!39309 _values!914) (store mapRest!49729 mapKey!49729 mapValue!49729))))

(declare-fun b!1255666 () Bool)

(assert (=> b!1255666 (= e!713696 true)))

(declare-fun -!2024 (ListLongMap!18673 (_ BitVec 64)) ListLongMap!18673)

(assert (=> b!1255666 (= (-!2024 lt!567551 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567551)))

(declare-fun lt!567554 () Unit!41669)

(declare-fun removeNotPresentStillSame!119 (ListLongMap!18673 (_ BitVec 64)) Unit!41669)

(assert (=> b!1255666 (= lt!567554 (removeNotPresentStillSame!119 lt!567551 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!105398 res!837113) b!1255662))

(assert (= (and b!1255662 res!837110) b!1255664))

(assert (= (and b!1255664 res!837112) b!1255665))

(assert (= (and b!1255665 res!837114) b!1255661))

(assert (= (and b!1255661 (not res!837115)) b!1255659))

(assert (= (and b!1255659 (not res!837111)) b!1255666))

(assert (= (and b!1255660 condMapEmpty!49729) mapIsEmpty!49729))

(assert (= (and b!1255660 (not condMapEmpty!49729)) mapNonEmpty!49729))

(get-info :version)

(assert (= (and mapNonEmpty!49729 ((_ is ValueCellFull!15218) mapValue!49729)) b!1255663))

(assert (= (and b!1255660 ((_ is ValueCellFull!15218) mapDefault!49729)) b!1255658))

(assert (= start!105398 b!1255660))

(declare-fun m!1155919 () Bool)

(assert (=> b!1255664 m!1155919))

(declare-fun m!1155921 () Bool)

(assert (=> mapNonEmpty!49729 m!1155921))

(declare-fun m!1155923 () Bool)

(assert (=> b!1255659 m!1155923))

(declare-fun m!1155925 () Bool)

(assert (=> b!1255659 m!1155925))

(declare-fun m!1155927 () Bool)

(assert (=> b!1255665 m!1155927))

(declare-fun m!1155929 () Bool)

(assert (=> start!105398 m!1155929))

(declare-fun m!1155931 () Bool)

(assert (=> start!105398 m!1155931))

(declare-fun m!1155933 () Bool)

(assert (=> start!105398 m!1155933))

(declare-fun m!1155935 () Bool)

(assert (=> b!1255666 m!1155935))

(declare-fun m!1155937 () Bool)

(assert (=> b!1255666 m!1155937))

(declare-fun m!1155939 () Bool)

(assert (=> b!1255661 m!1155939))

(declare-fun m!1155941 () Bool)

(assert (=> b!1255661 m!1155941))

(declare-fun m!1155943 () Bool)

(assert (=> b!1255661 m!1155943))

(check-sat (not start!105398) (not b!1255661) (not b!1255666) tp_is_empty!31963 (not b!1255659) (not b!1255665) b_and!44889 (not b_next!27061) (not mapNonEmpty!49729) (not b!1255664))
(check-sat b_and!44889 (not b_next!27061))
