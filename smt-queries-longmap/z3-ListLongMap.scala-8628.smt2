; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105058 () Bool)

(assert start!105058)

(declare-fun b_free!26805 () Bool)

(declare-fun b_next!26805 () Bool)

(assert (=> start!105058 (= b_free!26805 (not b_next!26805))))

(declare-fun tp!93913 () Bool)

(declare-fun b_and!44601 () Bool)

(assert (=> start!105058 (= tp!93913 b_and!44601)))

(declare-fun b!1252074 () Bool)

(declare-fun e!711081 () Bool)

(assert (=> b!1252074 (= e!711081 (not true))))

(declare-datatypes ((V!47641 0))(
  ( (V!47642 (val!15916 Int)) )
))
(declare-datatypes ((tuple2!20530 0))(
  ( (tuple2!20531 (_1!10276 (_ BitVec 64)) (_2!10276 V!47641)) )
))
(declare-datatypes ((List!27761 0))(
  ( (Nil!27758) (Cons!27757 (h!28966 tuple2!20530) (t!41238 List!27761)) )
))
(declare-datatypes ((ListLongMap!18403 0))(
  ( (ListLongMap!18404 (toList!9217 List!27761)) )
))
(declare-fun lt!565166 () ListLongMap!18403)

(declare-fun lt!565167 () ListLongMap!18403)

(assert (=> b!1252074 (= lt!565166 lt!565167)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!47641)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47641)

(declare-datatypes ((array!81078 0))(
  ( (array!81079 (arr!39103 (Array (_ BitVec 32) (_ BitVec 64))) (size!39639 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81078)

(declare-datatypes ((ValueCell!15090 0))(
  ( (ValueCellFull!15090 (v!18614 V!47641)) (EmptyCell!15090) )
))
(declare-datatypes ((array!81080 0))(
  ( (array!81081 (arr!39104 (Array (_ BitVec 32) ValueCell!15090)) (size!39640 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81080)

(declare-fun minValueBefore!43 () V!47641)

(declare-datatypes ((Unit!41623 0))(
  ( (Unit!41624) )
))
(declare-fun lt!565168 () Unit!41623)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!977 (array!81078 array!81080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47641 V!47641 V!47641 V!47641 (_ BitVec 32) Int) Unit!41623)

(assert (=> b!1252074 (= lt!565168 (lemmaNoChangeToArrayThenSameMapNoExtras!977 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5613 (array!81078 array!81080 (_ BitVec 32) (_ BitVec 32) V!47641 V!47641 (_ BitVec 32) Int) ListLongMap!18403)

(assert (=> b!1252074 (= lt!565167 (getCurrentListMapNoExtraKeys!5613 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252074 (= lt!565166 (getCurrentListMapNoExtraKeys!5613 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252075 () Bool)

(declare-fun e!711084 () Bool)

(declare-fun tp_is_empty!31707 () Bool)

(assert (=> b!1252075 (= e!711084 tp_is_empty!31707)))

(declare-fun b!1252076 () Bool)

(declare-fun e!711083 () Bool)

(assert (=> b!1252076 (= e!711083 tp_is_empty!31707)))

(declare-fun mapNonEmpty!49330 () Bool)

(declare-fun mapRes!49330 () Bool)

(declare-fun tp!93914 () Bool)

(assert (=> mapNonEmpty!49330 (= mapRes!49330 (and tp!93914 e!711084))))

(declare-fun mapKey!49330 () (_ BitVec 32))

(declare-fun mapValue!49330 () ValueCell!15090)

(declare-fun mapRest!49330 () (Array (_ BitVec 32) ValueCell!15090))

(assert (=> mapNonEmpty!49330 (= (arr!39104 _values!914) (store mapRest!49330 mapKey!49330 mapValue!49330))))

(declare-fun b!1252077 () Bool)

(declare-fun res!835038 () Bool)

(assert (=> b!1252077 (=> (not res!835038) (not e!711081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81078 (_ BitVec 32)) Bool)

(assert (=> b!1252077 (= res!835038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252078 () Bool)

(declare-fun res!835040 () Bool)

(assert (=> b!1252078 (=> (not res!835040) (not e!711081))))

(declare-datatypes ((List!27762 0))(
  ( (Nil!27759) (Cons!27758 (h!28967 (_ BitVec 64)) (t!41239 List!27762)) )
))
(declare-fun arrayNoDuplicates!0 (array!81078 (_ BitVec 32) List!27762) Bool)

(assert (=> b!1252078 (= res!835040 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27759))))

(declare-fun b!1252079 () Bool)

(declare-fun res!835039 () Bool)

(assert (=> b!1252079 (=> (not res!835039) (not e!711081))))

(assert (=> b!1252079 (= res!835039 (and (= (size!39640 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39639 _keys!1118) (size!39640 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!835041 () Bool)

(assert (=> start!105058 (=> (not res!835041) (not e!711081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105058 (= res!835041 (validMask!0 mask!1466))))

(assert (=> start!105058 e!711081))

(assert (=> start!105058 true))

(assert (=> start!105058 tp!93913))

(assert (=> start!105058 tp_is_empty!31707))

(declare-fun array_inv!29825 (array!81078) Bool)

(assert (=> start!105058 (array_inv!29825 _keys!1118)))

(declare-fun e!711085 () Bool)

(declare-fun array_inv!29826 (array!81080) Bool)

(assert (=> start!105058 (and (array_inv!29826 _values!914) e!711085)))

(declare-fun b!1252080 () Bool)

(assert (=> b!1252080 (= e!711085 (and e!711083 mapRes!49330))))

(declare-fun condMapEmpty!49330 () Bool)

(declare-fun mapDefault!49330 () ValueCell!15090)

(assert (=> b!1252080 (= condMapEmpty!49330 (= (arr!39104 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15090)) mapDefault!49330)))))

(declare-fun mapIsEmpty!49330 () Bool)

(assert (=> mapIsEmpty!49330 mapRes!49330))

(assert (= (and start!105058 res!835041) b!1252079))

(assert (= (and b!1252079 res!835039) b!1252077))

(assert (= (and b!1252077 res!835038) b!1252078))

(assert (= (and b!1252078 res!835040) b!1252074))

(assert (= (and b!1252080 condMapEmpty!49330) mapIsEmpty!49330))

(assert (= (and b!1252080 (not condMapEmpty!49330)) mapNonEmpty!49330))

(get-info :version)

(assert (= (and mapNonEmpty!49330 ((_ is ValueCellFull!15090) mapValue!49330)) b!1252075))

(assert (= (and b!1252080 ((_ is ValueCellFull!15090) mapDefault!49330)) b!1252076))

(assert (= start!105058 b!1252080))

(declare-fun m!1152761 () Bool)

(assert (=> start!105058 m!1152761))

(declare-fun m!1152763 () Bool)

(assert (=> start!105058 m!1152763))

(declare-fun m!1152765 () Bool)

(assert (=> start!105058 m!1152765))

(declare-fun m!1152767 () Bool)

(assert (=> b!1252077 m!1152767))

(declare-fun m!1152769 () Bool)

(assert (=> b!1252074 m!1152769))

(declare-fun m!1152771 () Bool)

(assert (=> b!1252074 m!1152771))

(declare-fun m!1152773 () Bool)

(assert (=> b!1252074 m!1152773))

(declare-fun m!1152775 () Bool)

(assert (=> mapNonEmpty!49330 m!1152775))

(declare-fun m!1152777 () Bool)

(assert (=> b!1252078 m!1152777))

(check-sat b_and!44601 (not b!1252078) (not mapNonEmpty!49330) (not start!105058) (not b!1252077) (not b_next!26805) (not b!1252074) tp_is_empty!31707)
(check-sat b_and!44601 (not b_next!26805))
