; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105060 () Bool)

(assert start!105060)

(declare-fun b_free!26641 () Bool)

(declare-fun b_next!26641 () Bool)

(assert (=> start!105060 (= b_free!26641 (not b_next!26641))))

(declare-fun tp!93412 () Bool)

(declare-fun b_and!44411 () Bool)

(assert (=> start!105060 (= tp!93412 b_and!44411)))

(declare-fun mapIsEmpty!49075 () Bool)

(declare-fun mapRes!49075 () Bool)

(assert (=> mapIsEmpty!49075 mapRes!49075))

(declare-fun b!1250925 () Bool)

(declare-fun e!710112 () Bool)

(declare-fun tp_is_empty!31543 () Bool)

(assert (=> b!1250925 (= e!710112 tp_is_empty!31543)))

(declare-fun b!1250926 () Bool)

(declare-fun e!710114 () Bool)

(declare-fun e!710113 () Bool)

(assert (=> b!1250926 (= e!710114 (and e!710113 mapRes!49075))))

(declare-fun condMapEmpty!49075 () Bool)

(declare-datatypes ((V!47423 0))(
  ( (V!47424 (val!15834 Int)) )
))
(declare-datatypes ((ValueCell!15008 0))(
  ( (ValueCellFull!15008 (v!18526 V!47423)) (EmptyCell!15008) )
))
(declare-datatypes ((array!80805 0))(
  ( (array!80806 (arr!38965 (Array (_ BitVec 32) ValueCell!15008)) (size!39502 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80805)

(declare-fun mapDefault!49075 () ValueCell!15008)

(assert (=> b!1250926 (= condMapEmpty!49075 (= (arr!38965 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15008)) mapDefault!49075)))))

(declare-fun b!1250927 () Bool)

(declare-fun res!834089 () Bool)

(declare-fun e!710110 () Bool)

(assert (=> b!1250927 (=> (not res!834089) (not e!710110))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80807 0))(
  ( (array!80808 (arr!38966 (Array (_ BitVec 32) (_ BitVec 64))) (size!39503 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80807)

(assert (=> b!1250927 (= res!834089 (and (= (size!39502 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39503 _keys!1118) (size!39502 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250928 () Bool)

(assert (=> b!1250928 (= e!710113 tp_is_empty!31543)))

(declare-fun b!1250929 () Bool)

(declare-fun res!834088 () Bool)

(assert (=> b!1250929 (=> (not res!834088) (not e!710110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80807 (_ BitVec 32)) Bool)

(assert (=> b!1250929 (= res!834088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250930 () Bool)

(declare-fun res!834091 () Bool)

(assert (=> b!1250930 (=> (not res!834091) (not e!710110))))

(declare-datatypes ((List!27680 0))(
  ( (Nil!27677) (Cons!27676 (h!28894 (_ BitVec 64)) (t!41143 List!27680)) )
))
(declare-fun arrayNoDuplicates!0 (array!80807 (_ BitVec 32) List!27680) Bool)

(assert (=> b!1250930 (= res!834091 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27677))))

(declare-fun b!1250931 () Bool)

(assert (=> b!1250931 (= e!710110 (not true))))

(declare-datatypes ((tuple2!20426 0))(
  ( (tuple2!20427 (_1!10224 (_ BitVec 64)) (_2!10224 V!47423)) )
))
(declare-datatypes ((List!27681 0))(
  ( (Nil!27678) (Cons!27677 (h!28895 tuple2!20426) (t!41144 List!27681)) )
))
(declare-datatypes ((ListLongMap!18307 0))(
  ( (ListLongMap!18308 (toList!9169 List!27681)) )
))
(declare-fun lt!564291 () ListLongMap!18307)

(declare-fun lt!564292 () ListLongMap!18307)

(assert (=> b!1250931 (= lt!564291 lt!564292)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47423)

(declare-fun minValueBefore!43 () V!47423)

(declare-fun minValueAfter!43 () V!47423)

(declare-datatypes ((Unit!41478 0))(
  ( (Unit!41479) )
))
(declare-fun lt!564293 () Unit!41478)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!918 (array!80807 array!80805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47423 V!47423 V!47423 V!47423 (_ BitVec 32) Int) Unit!41478)

(assert (=> b!1250931 (= lt!564293 (lemmaNoChangeToArrayThenSameMapNoExtras!918 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5604 (array!80807 array!80805 (_ BitVec 32) (_ BitVec 32) V!47423 V!47423 (_ BitVec 32) Int) ListLongMap!18307)

(assert (=> b!1250931 (= lt!564292 (getCurrentListMapNoExtraKeys!5604 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250931 (= lt!564291 (getCurrentListMapNoExtraKeys!5604 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49075 () Bool)

(declare-fun tp!93413 () Bool)

(assert (=> mapNonEmpty!49075 (= mapRes!49075 (and tp!93413 e!710112))))

(declare-fun mapRest!49075 () (Array (_ BitVec 32) ValueCell!15008))

(declare-fun mapKey!49075 () (_ BitVec 32))

(declare-fun mapValue!49075 () ValueCell!15008)

(assert (=> mapNonEmpty!49075 (= (arr!38965 _values!914) (store mapRest!49075 mapKey!49075 mapValue!49075))))

(declare-fun res!834090 () Bool)

(assert (=> start!105060 (=> (not res!834090) (not e!710110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105060 (= res!834090 (validMask!0 mask!1466))))

(assert (=> start!105060 e!710110))

(assert (=> start!105060 true))

(assert (=> start!105060 tp!93412))

(assert (=> start!105060 tp_is_empty!31543))

(declare-fun array_inv!29845 (array!80807) Bool)

(assert (=> start!105060 (array_inv!29845 _keys!1118)))

(declare-fun array_inv!29846 (array!80805) Bool)

(assert (=> start!105060 (and (array_inv!29846 _values!914) e!710114)))

(assert (= (and start!105060 res!834090) b!1250927))

(assert (= (and b!1250927 res!834089) b!1250929))

(assert (= (and b!1250929 res!834088) b!1250930))

(assert (= (and b!1250930 res!834091) b!1250931))

(assert (= (and b!1250926 condMapEmpty!49075) mapIsEmpty!49075))

(assert (= (and b!1250926 (not condMapEmpty!49075)) mapNonEmpty!49075))

(get-info :version)

(assert (= (and mapNonEmpty!49075 ((_ is ValueCellFull!15008) mapValue!49075)) b!1250925))

(assert (= (and b!1250926 ((_ is ValueCellFull!15008) mapDefault!49075)) b!1250928))

(assert (= start!105060 b!1250926))

(declare-fun m!1152135 () Bool)

(assert (=> b!1250929 m!1152135))

(declare-fun m!1152137 () Bool)

(assert (=> mapNonEmpty!49075 m!1152137))

(declare-fun m!1152139 () Bool)

(assert (=> b!1250931 m!1152139))

(declare-fun m!1152141 () Bool)

(assert (=> b!1250931 m!1152141))

(declare-fun m!1152143 () Bool)

(assert (=> b!1250931 m!1152143))

(declare-fun m!1152145 () Bool)

(assert (=> start!105060 m!1152145))

(declare-fun m!1152147 () Bool)

(assert (=> start!105060 m!1152147))

(declare-fun m!1152149 () Bool)

(assert (=> start!105060 m!1152149))

(declare-fun m!1152151 () Bool)

(assert (=> b!1250930 m!1152151))

(check-sat (not b!1250929) tp_is_empty!31543 b_and!44411 (not start!105060) (not b!1250930) (not b_next!26641) (not b!1250931) (not mapNonEmpty!49075))
(check-sat b_and!44411 (not b_next!26641))
