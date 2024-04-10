; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105028 () Bool)

(assert start!105028)

(declare-fun b_free!26775 () Bool)

(declare-fun b_next!26775 () Bool)

(assert (=> start!105028 (= b_free!26775 (not b_next!26775))))

(declare-fun tp!93823 () Bool)

(declare-fun b_and!44571 () Bool)

(assert (=> start!105028 (= tp!93823 b_and!44571)))

(declare-fun b!1251759 () Bool)

(declare-fun res!834859 () Bool)

(declare-fun e!710857 () Bool)

(assert (=> b!1251759 (=> (not res!834859) (not e!710857))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81020 0))(
  ( (array!81021 (arr!39074 (Array (_ BitVec 32) (_ BitVec 64))) (size!39610 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81020)

(declare-datatypes ((V!47601 0))(
  ( (V!47602 (val!15901 Int)) )
))
(declare-datatypes ((ValueCell!15075 0))(
  ( (ValueCellFull!15075 (v!18599 V!47601)) (EmptyCell!15075) )
))
(declare-datatypes ((array!81022 0))(
  ( (array!81023 (arr!39075 (Array (_ BitVec 32) ValueCell!15075)) (size!39611 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81022)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1251759 (= res!834859 (and (= (size!39611 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39610 _keys!1118) (size!39611 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251760 () Bool)

(declare-fun res!834858 () Bool)

(assert (=> b!1251760 (=> (not res!834858) (not e!710857))))

(declare-datatypes ((List!27737 0))(
  ( (Nil!27734) (Cons!27733 (h!28942 (_ BitVec 64)) (t!41214 List!27737)) )
))
(declare-fun arrayNoDuplicates!0 (array!81020 (_ BitVec 32) List!27737) Bool)

(assert (=> b!1251760 (= res!834858 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27734))))

(declare-fun b!1251761 () Bool)

(declare-fun e!710858 () Bool)

(declare-fun e!710856 () Bool)

(declare-fun mapRes!49285 () Bool)

(assert (=> b!1251761 (= e!710858 (and e!710856 mapRes!49285))))

(declare-fun condMapEmpty!49285 () Bool)

(declare-fun mapDefault!49285 () ValueCell!15075)

(assert (=> b!1251761 (= condMapEmpty!49285 (= (arr!39075 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15075)) mapDefault!49285)))))

(declare-fun b!1251762 () Bool)

(declare-fun e!710859 () Bool)

(declare-fun tp_is_empty!31677 () Bool)

(assert (=> b!1251762 (= e!710859 tp_is_empty!31677)))

(declare-fun mapIsEmpty!49285 () Bool)

(assert (=> mapIsEmpty!49285 mapRes!49285))

(declare-fun b!1251763 () Bool)

(assert (=> b!1251763 (= e!710856 tp_is_empty!31677)))

(declare-fun mapNonEmpty!49285 () Bool)

(declare-fun tp!93824 () Bool)

(assert (=> mapNonEmpty!49285 (= mapRes!49285 (and tp!93824 e!710859))))

(declare-fun mapRest!49285 () (Array (_ BitVec 32) ValueCell!15075))

(declare-fun mapValue!49285 () ValueCell!15075)

(declare-fun mapKey!49285 () (_ BitVec 32))

(assert (=> mapNonEmpty!49285 (= (arr!39075 _values!914) (store mapRest!49285 mapKey!49285 mapValue!49285))))

(declare-fun res!834861 () Bool)

(assert (=> start!105028 (=> (not res!834861) (not e!710857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105028 (= res!834861 (validMask!0 mask!1466))))

(assert (=> start!105028 e!710857))

(assert (=> start!105028 true))

(assert (=> start!105028 tp!93823))

(assert (=> start!105028 tp_is_empty!31677))

(declare-fun array_inv!29803 (array!81020) Bool)

(assert (=> start!105028 (array_inv!29803 _keys!1118)))

(declare-fun array_inv!29804 (array!81022) Bool)

(assert (=> start!105028 (and (array_inv!29804 _values!914) e!710858)))

(declare-fun b!1251764 () Bool)

(declare-fun res!834860 () Bool)

(assert (=> b!1251764 (=> (not res!834860) (not e!710857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81020 (_ BitVec 32)) Bool)

(assert (=> b!1251764 (= res!834860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251765 () Bool)

(assert (=> b!1251765 (= e!710857 (not true))))

(declare-datatypes ((tuple2!20506 0))(
  ( (tuple2!20507 (_1!10264 (_ BitVec 64)) (_2!10264 V!47601)) )
))
(declare-datatypes ((List!27738 0))(
  ( (Nil!27735) (Cons!27734 (h!28943 tuple2!20506) (t!41215 List!27738)) )
))
(declare-datatypes ((ListLongMap!18379 0))(
  ( (ListLongMap!18380 (toList!9205 List!27738)) )
))
(declare-fun lt!565032 () ListLongMap!18379)

(declare-fun lt!565033 () ListLongMap!18379)

(assert (=> b!1251765 (= lt!565032 lt!565033)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47601)

(declare-fun zeroValue!871 () V!47601)

(declare-datatypes ((Unit!41599 0))(
  ( (Unit!41600) )
))
(declare-fun lt!565031 () Unit!41599)

(declare-fun minValueBefore!43 () V!47601)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!965 (array!81020 array!81022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47601 V!47601 V!47601 V!47601 (_ BitVec 32) Int) Unit!41599)

(assert (=> b!1251765 (= lt!565031 (lemmaNoChangeToArrayThenSameMapNoExtras!965 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5601 (array!81020 array!81022 (_ BitVec 32) (_ BitVec 32) V!47601 V!47601 (_ BitVec 32) Int) ListLongMap!18379)

(assert (=> b!1251765 (= lt!565033 (getCurrentListMapNoExtraKeys!5601 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251765 (= lt!565032 (getCurrentListMapNoExtraKeys!5601 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105028 res!834861) b!1251759))

(assert (= (and b!1251759 res!834859) b!1251764))

(assert (= (and b!1251764 res!834860) b!1251760))

(assert (= (and b!1251760 res!834858) b!1251765))

(assert (= (and b!1251761 condMapEmpty!49285) mapIsEmpty!49285))

(assert (= (and b!1251761 (not condMapEmpty!49285)) mapNonEmpty!49285))

(get-info :version)

(assert (= (and mapNonEmpty!49285 ((_ is ValueCellFull!15075) mapValue!49285)) b!1251762))

(assert (= (and b!1251761 ((_ is ValueCellFull!15075) mapDefault!49285)) b!1251763))

(assert (= start!105028 b!1251761))

(declare-fun m!1152491 () Bool)

(assert (=> b!1251765 m!1152491))

(declare-fun m!1152493 () Bool)

(assert (=> b!1251765 m!1152493))

(declare-fun m!1152495 () Bool)

(assert (=> b!1251765 m!1152495))

(declare-fun m!1152497 () Bool)

(assert (=> mapNonEmpty!49285 m!1152497))

(declare-fun m!1152499 () Bool)

(assert (=> b!1251764 m!1152499))

(declare-fun m!1152501 () Bool)

(assert (=> b!1251760 m!1152501))

(declare-fun m!1152503 () Bool)

(assert (=> start!105028 m!1152503))

(declare-fun m!1152505 () Bool)

(assert (=> start!105028 m!1152505))

(declare-fun m!1152507 () Bool)

(assert (=> start!105028 m!1152507))

(check-sat (not b_next!26775) (not b!1251765) (not b!1251764) b_and!44571 (not b!1251760) tp_is_empty!31677 (not mapNonEmpty!49285) (not start!105028))
(check-sat b_and!44571 (not b_next!26775))
