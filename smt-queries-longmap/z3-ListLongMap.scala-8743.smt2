; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106284 () Bool)

(assert start!106284)

(declare-fun b_free!27493 () Bool)

(declare-fun b_next!27493 () Bool)

(assert (=> start!106284 (= b_free!27493 (not b_next!27493))))

(declare-fun tp!96028 () Bool)

(declare-fun b_and!45469 () Bool)

(assert (=> start!106284 (= tp!96028 b_and!45469)))

(declare-fun b!1264275 () Bool)

(declare-fun e!719835 () Bool)

(declare-fun e!719839 () Bool)

(declare-fun mapRes!50413 () Bool)

(assert (=> b!1264275 (= e!719835 (and e!719839 mapRes!50413))))

(declare-fun condMapEmpty!50413 () Bool)

(declare-datatypes ((V!48559 0))(
  ( (V!48560 (val!16260 Int)) )
))
(declare-datatypes ((ValueCell!15434 0))(
  ( (ValueCellFull!15434 (v!18965 V!48559)) (EmptyCell!15434) )
))
(declare-datatypes ((array!82455 0))(
  ( (array!82456 (arr!39770 (Array (_ BitVec 32) ValueCell!15434)) (size!40307 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82455)

(declare-fun mapDefault!50413 () ValueCell!15434)

(assert (=> b!1264275 (= condMapEmpty!50413 (= (arr!39770 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15434)) mapDefault!50413)))))

(declare-fun b!1264276 () Bool)

(declare-fun tp_is_empty!32395 () Bool)

(assert (=> b!1264276 (= e!719839 tp_is_empty!32395)))

(declare-fun b!1264277 () Bool)

(declare-fun e!719834 () Bool)

(assert (=> b!1264277 (= e!719834 tp_is_empty!32395)))

(declare-fun mapIsEmpty!50413 () Bool)

(assert (=> mapIsEmpty!50413 mapRes!50413))

(declare-fun b!1264278 () Bool)

(declare-fun res!841847 () Bool)

(declare-fun e!719838 () Bool)

(assert (=> b!1264278 (=> (not res!841847) (not e!719838))))

(declare-datatypes ((array!82457 0))(
  ( (array!82458 (arr!39771 (Array (_ BitVec 32) (_ BitVec 64))) (size!40308 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82457)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82457 (_ BitVec 32)) Bool)

(assert (=> b!1264278 (= res!841847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50413 () Bool)

(declare-fun tp!96029 () Bool)

(assert (=> mapNonEmpty!50413 (= mapRes!50413 (and tp!96029 e!719834))))

(declare-fun mapRest!50413 () (Array (_ BitVec 32) ValueCell!15434))

(declare-fun mapKey!50413 () (_ BitVec 32))

(declare-fun mapValue!50413 () ValueCell!15434)

(assert (=> mapNonEmpty!50413 (= (arr!39770 _values!914) (store mapRest!50413 mapKey!50413 mapValue!50413))))

(declare-fun res!841850 () Bool)

(assert (=> start!106284 (=> (not res!841850) (not e!719838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106284 (= res!841850 (validMask!0 mask!1466))))

(assert (=> start!106284 e!719838))

(assert (=> start!106284 true))

(assert (=> start!106284 tp!96028))

(assert (=> start!106284 tp_is_empty!32395))

(declare-fun array_inv!30429 (array!82457) Bool)

(assert (=> start!106284 (array_inv!30429 _keys!1118)))

(declare-fun array_inv!30430 (array!82455) Bool)

(assert (=> start!106284 (and (array_inv!30430 _values!914) e!719835)))

(declare-fun b!1264279 () Bool)

(declare-fun res!841846 () Bool)

(assert (=> b!1264279 (=> (not res!841846) (not e!719838))))

(declare-datatypes ((List!28282 0))(
  ( (Nil!28279) (Cons!28278 (h!29496 (_ BitVec 64)) (t!41785 List!28282)) )
))
(declare-fun arrayNoDuplicates!0 (array!82457 (_ BitVec 32) List!28282) Bool)

(assert (=> b!1264279 (= res!841846 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28279))))

(declare-fun b!1264280 () Bool)

(declare-fun e!719836 () Bool)

(assert (=> b!1264280 (= e!719838 (not e!719836))))

(declare-fun res!841849 () Bool)

(assert (=> b!1264280 (=> res!841849 e!719836)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1264280 (= res!841849 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21058 0))(
  ( (tuple2!21059 (_1!10540 (_ BitVec 64)) (_2!10540 V!48559)) )
))
(declare-datatypes ((List!28283 0))(
  ( (Nil!28280) (Cons!28279 (h!29497 tuple2!21058) (t!41786 List!28283)) )
))
(declare-datatypes ((ListLongMap!18939 0))(
  ( (ListLongMap!18940 (toList!9485 List!28283)) )
))
(declare-fun lt!573145 () ListLongMap!18939)

(declare-fun lt!573146 () ListLongMap!18939)

(assert (=> b!1264280 (= lt!573145 lt!573146)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48559)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48559)

(declare-fun minValueBefore!43 () V!48559)

(declare-datatypes ((Unit!42072 0))(
  ( (Unit!42073) )
))
(declare-fun lt!573144 () Unit!42072)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1179 (array!82457 array!82455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48559 V!48559 V!48559 V!48559 (_ BitVec 32) Int) Unit!42072)

(assert (=> b!1264280 (= lt!573144 (lemmaNoChangeToArrayThenSameMapNoExtras!1179 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5889 (array!82457 array!82455 (_ BitVec 32) (_ BitVec 32) V!48559 V!48559 (_ BitVec 32) Int) ListLongMap!18939)

(assert (=> b!1264280 (= lt!573146 (getCurrentListMapNoExtraKeys!5889 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264280 (= lt!573145 (getCurrentListMapNoExtraKeys!5889 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264281 () Bool)

(assert (=> b!1264281 (= e!719836 true)))

(declare-fun lt!573143 () ListLongMap!18939)

(declare-fun lt!573142 () ListLongMap!18939)

(declare-fun -!2119 (ListLongMap!18939 (_ BitVec 64)) ListLongMap!18939)

(assert (=> b!1264281 (= lt!573143 (-!2119 lt!573142 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!573141 () ListLongMap!18939)

(assert (=> b!1264281 (= (-!2119 lt!573141 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573145)))

(declare-fun lt!573140 () Unit!42072)

(declare-fun addThenRemoveForNewKeyIsSame!370 (ListLongMap!18939 (_ BitVec 64) V!48559) Unit!42072)

(assert (=> b!1264281 (= lt!573140 (addThenRemoveForNewKeyIsSame!370 lt!573145 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!573139 () ListLongMap!18939)

(assert (=> b!1264281 (and (= lt!573142 lt!573141) (= lt!573139 lt!573146))))

(declare-fun +!4297 (ListLongMap!18939 tuple2!21058) ListLongMap!18939)

(assert (=> b!1264281 (= lt!573141 (+!4297 lt!573145 (tuple2!21059 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4638 (array!82457 array!82455 (_ BitVec 32) (_ BitVec 32) V!48559 V!48559 (_ BitVec 32) Int) ListLongMap!18939)

(assert (=> b!1264281 (= lt!573139 (getCurrentListMap!4638 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264281 (= lt!573142 (getCurrentListMap!4638 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264282 () Bool)

(declare-fun res!841848 () Bool)

(assert (=> b!1264282 (=> (not res!841848) (not e!719838))))

(assert (=> b!1264282 (= res!841848 (and (= (size!40307 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40308 _keys!1118) (size!40307 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!106284 res!841850) b!1264282))

(assert (= (and b!1264282 res!841848) b!1264278))

(assert (= (and b!1264278 res!841847) b!1264279))

(assert (= (and b!1264279 res!841846) b!1264280))

(assert (= (and b!1264280 (not res!841849)) b!1264281))

(assert (= (and b!1264275 condMapEmpty!50413) mapIsEmpty!50413))

(assert (= (and b!1264275 (not condMapEmpty!50413)) mapNonEmpty!50413))

(get-info :version)

(assert (= (and mapNonEmpty!50413 ((_ is ValueCellFull!15434) mapValue!50413)) b!1264277))

(assert (= (and b!1264275 ((_ is ValueCellFull!15434) mapDefault!50413)) b!1264276))

(assert (= start!106284 b!1264275))

(declare-fun m!1165093 () Bool)

(assert (=> b!1264280 m!1165093))

(declare-fun m!1165095 () Bool)

(assert (=> b!1264280 m!1165095))

(declare-fun m!1165097 () Bool)

(assert (=> b!1264280 m!1165097))

(declare-fun m!1165099 () Bool)

(assert (=> b!1264279 m!1165099))

(declare-fun m!1165101 () Bool)

(assert (=> b!1264278 m!1165101))

(declare-fun m!1165103 () Bool)

(assert (=> start!106284 m!1165103))

(declare-fun m!1165105 () Bool)

(assert (=> start!106284 m!1165105))

(declare-fun m!1165107 () Bool)

(assert (=> start!106284 m!1165107))

(declare-fun m!1165109 () Bool)

(assert (=> b!1264281 m!1165109))

(declare-fun m!1165111 () Bool)

(assert (=> b!1264281 m!1165111))

(declare-fun m!1165113 () Bool)

(assert (=> b!1264281 m!1165113))

(declare-fun m!1165115 () Bool)

(assert (=> b!1264281 m!1165115))

(declare-fun m!1165117 () Bool)

(assert (=> b!1264281 m!1165117))

(declare-fun m!1165119 () Bool)

(assert (=> b!1264281 m!1165119))

(declare-fun m!1165121 () Bool)

(assert (=> mapNonEmpty!50413 m!1165121))

(check-sat (not start!106284) (not b!1264279) b_and!45469 (not mapNonEmpty!50413) (not b!1264281) (not b!1264280) tp_is_empty!32395 (not b!1264278) (not b_next!27493))
(check-sat b_and!45469 (not b_next!27493))
