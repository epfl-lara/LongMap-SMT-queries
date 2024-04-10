; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105064 () Bool)

(assert start!105064)

(declare-fun b_free!26811 () Bool)

(declare-fun b_next!26811 () Bool)

(assert (=> start!105064 (= b_free!26811 (not b_next!26811))))

(declare-fun tp!93931 () Bool)

(declare-fun b_and!44607 () Bool)

(assert (=> start!105064 (= tp!93931 b_and!44607)))

(declare-fun b!1252137 () Bool)

(declare-fun res!835074 () Bool)

(declare-fun e!711130 () Bool)

(assert (=> b!1252137 (=> (not res!835074) (not e!711130))))

(declare-datatypes ((array!81086 0))(
  ( (array!81087 (arr!39107 (Array (_ BitVec 32) (_ BitVec 64))) (size!39643 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81086)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81086 (_ BitVec 32)) Bool)

(assert (=> b!1252137 (= res!835074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252138 () Bool)

(declare-fun e!711129 () Bool)

(declare-fun tp_is_empty!31713 () Bool)

(assert (=> b!1252138 (= e!711129 tp_is_empty!31713)))

(declare-fun b!1252139 () Bool)

(declare-fun e!711127 () Bool)

(assert (=> b!1252139 (= e!711127 tp_is_empty!31713)))

(declare-fun b!1252140 () Bool)

(declare-fun res!835076 () Bool)

(assert (=> b!1252140 (=> (not res!835076) (not e!711130))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47649 0))(
  ( (V!47650 (val!15919 Int)) )
))
(declare-datatypes ((ValueCell!15093 0))(
  ( (ValueCellFull!15093 (v!18617 V!47649)) (EmptyCell!15093) )
))
(declare-datatypes ((array!81088 0))(
  ( (array!81089 (arr!39108 (Array (_ BitVec 32) ValueCell!15093)) (size!39644 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81088)

(assert (=> b!1252140 (= res!835076 (and (= (size!39644 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39643 _keys!1118) (size!39644 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252141 () Bool)

(assert (=> b!1252141 (= e!711130 (not true))))

(declare-datatypes ((tuple2!20532 0))(
  ( (tuple2!20533 (_1!10277 (_ BitVec 64)) (_2!10277 V!47649)) )
))
(declare-datatypes ((List!27763 0))(
  ( (Nil!27760) (Cons!27759 (h!28968 tuple2!20532) (t!41240 List!27763)) )
))
(declare-datatypes ((ListLongMap!18405 0))(
  ( (ListLongMap!18406 (toList!9218 List!27763)) )
))
(declare-fun lt!565195 () ListLongMap!18405)

(declare-fun lt!565193 () ListLongMap!18405)

(assert (=> b!1252141 (= lt!565195 lt!565193)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41625 0))(
  ( (Unit!41626) )
))
(declare-fun lt!565194 () Unit!41625)

(declare-fun minValueAfter!43 () V!47649)

(declare-fun zeroValue!871 () V!47649)

(declare-fun minValueBefore!43 () V!47649)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!978 (array!81086 array!81088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47649 V!47649 V!47649 V!47649 (_ BitVec 32) Int) Unit!41625)

(assert (=> b!1252141 (= lt!565194 (lemmaNoChangeToArrayThenSameMapNoExtras!978 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5614 (array!81086 array!81088 (_ BitVec 32) (_ BitVec 32) V!47649 V!47649 (_ BitVec 32) Int) ListLongMap!18405)

(assert (=> b!1252141 (= lt!565193 (getCurrentListMapNoExtraKeys!5614 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252141 (= lt!565195 (getCurrentListMapNoExtraKeys!5614 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252142 () Bool)

(declare-fun e!711126 () Bool)

(declare-fun mapRes!49339 () Bool)

(assert (=> b!1252142 (= e!711126 (and e!711127 mapRes!49339))))

(declare-fun condMapEmpty!49339 () Bool)

(declare-fun mapDefault!49339 () ValueCell!15093)

(assert (=> b!1252142 (= condMapEmpty!49339 (= (arr!39108 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15093)) mapDefault!49339)))))

(declare-fun mapNonEmpty!49339 () Bool)

(declare-fun tp!93932 () Bool)

(assert (=> mapNonEmpty!49339 (= mapRes!49339 (and tp!93932 e!711129))))

(declare-fun mapKey!49339 () (_ BitVec 32))

(declare-fun mapValue!49339 () ValueCell!15093)

(declare-fun mapRest!49339 () (Array (_ BitVec 32) ValueCell!15093))

(assert (=> mapNonEmpty!49339 (= (arr!39108 _values!914) (store mapRest!49339 mapKey!49339 mapValue!49339))))

(declare-fun mapIsEmpty!49339 () Bool)

(assert (=> mapIsEmpty!49339 mapRes!49339))

(declare-fun res!835077 () Bool)

(assert (=> start!105064 (=> (not res!835077) (not e!711130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105064 (= res!835077 (validMask!0 mask!1466))))

(assert (=> start!105064 e!711130))

(assert (=> start!105064 true))

(assert (=> start!105064 tp!93931))

(assert (=> start!105064 tp_is_empty!31713))

(declare-fun array_inv!29827 (array!81086) Bool)

(assert (=> start!105064 (array_inv!29827 _keys!1118)))

(declare-fun array_inv!29828 (array!81088) Bool)

(assert (=> start!105064 (and (array_inv!29828 _values!914) e!711126)))

(declare-fun b!1252143 () Bool)

(declare-fun res!835075 () Bool)

(assert (=> b!1252143 (=> (not res!835075) (not e!711130))))

(declare-datatypes ((List!27764 0))(
  ( (Nil!27761) (Cons!27760 (h!28969 (_ BitVec 64)) (t!41241 List!27764)) )
))
(declare-fun arrayNoDuplicates!0 (array!81086 (_ BitVec 32) List!27764) Bool)

(assert (=> b!1252143 (= res!835075 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27761))))

(assert (= (and start!105064 res!835077) b!1252140))

(assert (= (and b!1252140 res!835076) b!1252137))

(assert (= (and b!1252137 res!835074) b!1252143))

(assert (= (and b!1252143 res!835075) b!1252141))

(assert (= (and b!1252142 condMapEmpty!49339) mapIsEmpty!49339))

(assert (= (and b!1252142 (not condMapEmpty!49339)) mapNonEmpty!49339))

(get-info :version)

(assert (= (and mapNonEmpty!49339 ((_ is ValueCellFull!15093) mapValue!49339)) b!1252138))

(assert (= (and b!1252142 ((_ is ValueCellFull!15093) mapDefault!49339)) b!1252139))

(assert (= start!105064 b!1252142))

(declare-fun m!1152815 () Bool)

(assert (=> b!1252143 m!1152815))

(declare-fun m!1152817 () Bool)

(assert (=> b!1252137 m!1152817))

(declare-fun m!1152819 () Bool)

(assert (=> mapNonEmpty!49339 m!1152819))

(declare-fun m!1152821 () Bool)

(assert (=> start!105064 m!1152821))

(declare-fun m!1152823 () Bool)

(assert (=> start!105064 m!1152823))

(declare-fun m!1152825 () Bool)

(assert (=> start!105064 m!1152825))

(declare-fun m!1152827 () Bool)

(assert (=> b!1252141 m!1152827))

(declare-fun m!1152829 () Bool)

(assert (=> b!1252141 m!1152829))

(declare-fun m!1152831 () Bool)

(assert (=> b!1252141 m!1152831))

(check-sat b_and!44607 (not start!105064) (not b!1252143) (not b!1252141) (not b_next!26811) (not mapNonEmpty!49339) (not b!1252137) tp_is_empty!31713)
(check-sat b_and!44607 (not b_next!26811))
