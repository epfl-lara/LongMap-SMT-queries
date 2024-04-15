; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105040 () Bool)

(assert start!105040)

(declare-fun b_free!26791 () Bool)

(declare-fun b_next!26791 () Bool)

(assert (=> start!105040 (= b_free!26791 (not b_next!26791))))

(declare-fun tp!93872 () Bool)

(declare-fun b_and!44569 () Bool)

(assert (=> start!105040 (= tp!93872 b_and!44569)))

(declare-fun mapIsEmpty!49309 () Bool)

(declare-fun mapRes!49309 () Bool)

(assert (=> mapIsEmpty!49309 mapRes!49309))

(declare-fun b!1251845 () Bool)

(declare-fun res!834915 () Bool)

(declare-fun e!710934 () Bool)

(assert (=> b!1251845 (=> (not res!834915) (not e!710934))))

(declare-datatypes ((array!80973 0))(
  ( (array!80974 (arr!39051 (Array (_ BitVec 32) (_ BitVec 64))) (size!39589 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80973)

(declare-datatypes ((List!27817 0))(
  ( (Nil!27814) (Cons!27813 (h!29022 (_ BitVec 64)) (t!41285 List!27817)) )
))
(declare-fun arrayNoDuplicates!0 (array!80973 (_ BitVec 32) List!27817) Bool)

(assert (=> b!1251845 (= res!834915 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27814))))

(declare-fun b!1251846 () Bool)

(assert (=> b!1251846 (= e!710934 (not true))))

(declare-datatypes ((V!47623 0))(
  ( (V!47624 (val!15909 Int)) )
))
(declare-datatypes ((tuple2!20602 0))(
  ( (tuple2!20603 (_1!10312 (_ BitVec 64)) (_2!10312 V!47623)) )
))
(declare-datatypes ((List!27818 0))(
  ( (Nil!27815) (Cons!27814 (h!29023 tuple2!20602) (t!41286 List!27818)) )
))
(declare-datatypes ((ListLongMap!18475 0))(
  ( (ListLongMap!18476 (toList!9253 List!27818)) )
))
(declare-fun lt!564924 () ListLongMap!18475)

(declare-fun lt!564925 () ListLongMap!18475)

(assert (=> b!1251846 (= lt!564924 lt!564925)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41472 0))(
  ( (Unit!41473) )
))
(declare-fun lt!564926 () Unit!41472)

(declare-fun minValueAfter!43 () V!47623)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47623)

(declare-datatypes ((ValueCell!15083 0))(
  ( (ValueCellFull!15083 (v!18606 V!47623)) (EmptyCell!15083) )
))
(declare-datatypes ((array!80975 0))(
  ( (array!80976 (arr!39052 (Array (_ BitVec 32) ValueCell!15083)) (size!39590 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80975)

(declare-fun minValueBefore!43 () V!47623)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!979 (array!80973 array!80975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47623 V!47623 V!47623 V!47623 (_ BitVec 32) Int) Unit!41472)

(assert (=> b!1251846 (= lt!564926 (lemmaNoChangeToArrayThenSameMapNoExtras!979 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5657 (array!80973 array!80975 (_ BitVec 32) (_ BitVec 32) V!47623 V!47623 (_ BitVec 32) Int) ListLongMap!18475)

(assert (=> b!1251846 (= lt!564925 (getCurrentListMapNoExtraKeys!5657 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251846 (= lt!564924 (getCurrentListMapNoExtraKeys!5657 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251847 () Bool)

(declare-fun e!710931 () Bool)

(declare-fun tp_is_empty!31693 () Bool)

(assert (=> b!1251847 (= e!710931 tp_is_empty!31693)))

(declare-fun res!834916 () Bool)

(assert (=> start!105040 (=> (not res!834916) (not e!710934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105040 (= res!834916 (validMask!0 mask!1466))))

(assert (=> start!105040 e!710934))

(assert (=> start!105040 true))

(assert (=> start!105040 tp!93872))

(assert (=> start!105040 tp_is_empty!31693))

(declare-fun array_inv!29913 (array!80973) Bool)

(assert (=> start!105040 (array_inv!29913 _keys!1118)))

(declare-fun e!710932 () Bool)

(declare-fun array_inv!29914 (array!80975) Bool)

(assert (=> start!105040 (and (array_inv!29914 _values!914) e!710932)))

(declare-fun b!1251848 () Bool)

(declare-fun res!834914 () Bool)

(assert (=> b!1251848 (=> (not res!834914) (not e!710934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80973 (_ BitVec 32)) Bool)

(assert (=> b!1251848 (= res!834914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49309 () Bool)

(declare-fun tp!93871 () Bool)

(declare-fun e!710933 () Bool)

(assert (=> mapNonEmpty!49309 (= mapRes!49309 (and tp!93871 e!710933))))

(declare-fun mapRest!49309 () (Array (_ BitVec 32) ValueCell!15083))

(declare-fun mapKey!49309 () (_ BitVec 32))

(declare-fun mapValue!49309 () ValueCell!15083)

(assert (=> mapNonEmpty!49309 (= (arr!39052 _values!914) (store mapRest!49309 mapKey!49309 mapValue!49309))))

(declare-fun b!1251849 () Bool)

(assert (=> b!1251849 (= e!710932 (and e!710931 mapRes!49309))))

(declare-fun condMapEmpty!49309 () Bool)

(declare-fun mapDefault!49309 () ValueCell!15083)

(assert (=> b!1251849 (= condMapEmpty!49309 (= (arr!39052 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15083)) mapDefault!49309)))))

(declare-fun b!1251850 () Bool)

(declare-fun res!834917 () Bool)

(assert (=> b!1251850 (=> (not res!834917) (not e!710934))))

(assert (=> b!1251850 (= res!834917 (and (= (size!39590 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39589 _keys!1118) (size!39590 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251851 () Bool)

(assert (=> b!1251851 (= e!710933 tp_is_empty!31693)))

(assert (= (and start!105040 res!834916) b!1251850))

(assert (= (and b!1251850 res!834917) b!1251848))

(assert (= (and b!1251848 res!834914) b!1251845))

(assert (= (and b!1251845 res!834915) b!1251846))

(assert (= (and b!1251849 condMapEmpty!49309) mapIsEmpty!49309))

(assert (= (and b!1251849 (not condMapEmpty!49309)) mapNonEmpty!49309))

(get-info :version)

(assert (= (and mapNonEmpty!49309 ((_ is ValueCellFull!15083) mapValue!49309)) b!1251851))

(assert (= (and b!1251849 ((_ is ValueCellFull!15083) mapDefault!49309)) b!1251847))

(assert (= start!105040 b!1251849))

(declare-fun m!1152115 () Bool)

(assert (=> b!1251848 m!1152115))

(declare-fun m!1152117 () Bool)

(assert (=> b!1251846 m!1152117))

(declare-fun m!1152119 () Bool)

(assert (=> b!1251846 m!1152119))

(declare-fun m!1152121 () Bool)

(assert (=> b!1251846 m!1152121))

(declare-fun m!1152123 () Bool)

(assert (=> mapNonEmpty!49309 m!1152123))

(declare-fun m!1152125 () Bool)

(assert (=> start!105040 m!1152125))

(declare-fun m!1152127 () Bool)

(assert (=> start!105040 m!1152127))

(declare-fun m!1152129 () Bool)

(assert (=> start!105040 m!1152129))

(declare-fun m!1152131 () Bool)

(assert (=> b!1251845 m!1152131))

(check-sat (not b!1251848) (not b_next!26791) (not b!1251846) tp_is_empty!31693 (not b!1251845) (not start!105040) b_and!44569 (not mapNonEmpty!49309))
(check-sat b_and!44569 (not b_next!26791))
