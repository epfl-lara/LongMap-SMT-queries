; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105134 () Bool)

(assert start!105134)

(declare-fun b_free!26701 () Bool)

(declare-fun b_next!26701 () Bool)

(assert (=> start!105134 (= b_free!26701 (not b_next!26701))))

(declare-fun tp!93595 () Bool)

(declare-fun b_and!44479 () Bool)

(assert (=> start!105134 (= tp!93595 b_and!44479)))

(declare-fun b!1251761 () Bool)

(declare-fun res!834602 () Bool)

(declare-fun e!710737 () Bool)

(assert (=> b!1251761 (=> (not res!834602) (not e!710737))))

(declare-datatypes ((array!80923 0))(
  ( (array!80924 (arr!39023 (Array (_ BitVec 32) (_ BitVec 64))) (size!39560 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80923)

(declare-datatypes ((List!27726 0))(
  ( (Nil!27723) (Cons!27722 (h!28940 (_ BitVec 64)) (t!41191 List!27726)) )
))
(declare-fun arrayNoDuplicates!0 (array!80923 (_ BitVec 32) List!27726) Bool)

(assert (=> b!1251761 (= res!834602 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27723))))

(declare-fun b!1251762 () Bool)

(declare-fun e!710738 () Bool)

(assert (=> b!1251762 (= e!710737 (not e!710738))))

(declare-fun res!834604 () Bool)

(assert (=> b!1251762 (=> res!834604 e!710738)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251762 (= res!834604 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47503 0))(
  ( (V!47504 (val!15864 Int)) )
))
(declare-datatypes ((tuple2!20476 0))(
  ( (tuple2!20477 (_1!10249 (_ BitVec 64)) (_2!10249 V!47503)) )
))
(declare-datatypes ((List!27727 0))(
  ( (Nil!27724) (Cons!27723 (h!28941 tuple2!20476) (t!41192 List!27727)) )
))
(declare-datatypes ((ListLongMap!18357 0))(
  ( (ListLongMap!18358 (toList!9194 List!27727)) )
))
(declare-fun lt!564725 () ListLongMap!18357)

(declare-fun lt!564723 () ListLongMap!18357)

(assert (=> b!1251762 (= lt!564725 lt!564723)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41524 0))(
  ( (Unit!41525) )
))
(declare-fun lt!564724 () Unit!41524)

(declare-fun minValueAfter!43 () V!47503)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47503)

(declare-datatypes ((ValueCell!15038 0))(
  ( (ValueCellFull!15038 (v!18556 V!47503)) (EmptyCell!15038) )
))
(declare-datatypes ((array!80925 0))(
  ( (array!80926 (arr!39024 (Array (_ BitVec 32) ValueCell!15038)) (size!39561 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80925)

(declare-fun minValueBefore!43 () V!47503)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!940 (array!80923 array!80925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47503 V!47503 V!47503 V!47503 (_ BitVec 32) Int) Unit!41524)

(assert (=> b!1251762 (= lt!564724 (lemmaNoChangeToArrayThenSameMapNoExtras!940 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5626 (array!80923 array!80925 (_ BitVec 32) (_ BitVec 32) V!47503 V!47503 (_ BitVec 32) Int) ListLongMap!18357)

(assert (=> b!1251762 (= lt!564723 (getCurrentListMapNoExtraKeys!5626 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251762 (= lt!564725 (getCurrentListMapNoExtraKeys!5626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251763 () Bool)

(declare-fun e!710736 () Bool)

(assert (=> b!1251763 (= e!710736 true)))

(declare-fun lt!564722 () ListLongMap!18357)

(declare-fun -!1982 (ListLongMap!18357 (_ BitVec 64)) ListLongMap!18357)

(assert (=> b!1251763 (= (-!1982 lt!564722 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564722)))

(declare-fun lt!564726 () Unit!41524)

(declare-fun removeNotPresentStillSame!92 (ListLongMap!18357 (_ BitVec 64)) Unit!41524)

(assert (=> b!1251763 (= lt!564726 (removeNotPresentStillSame!92 lt!564722 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251764 () Bool)

(assert (=> b!1251764 (= e!710738 e!710736)))

(declare-fun res!834600 () Bool)

(assert (=> b!1251764 (=> res!834600 e!710736)))

(declare-fun contains!7520 (ListLongMap!18357 (_ BitVec 64)) Bool)

(assert (=> b!1251764 (= res!834600 (contains!7520 lt!564722 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4457 (array!80923 array!80925 (_ BitVec 32) (_ BitVec 32) V!47503 V!47503 (_ BitVec 32) Int) ListLongMap!18357)

(assert (=> b!1251764 (= lt!564722 (getCurrentListMap!4457 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251765 () Bool)

(declare-fun e!710739 () Bool)

(declare-fun tp_is_empty!31603 () Bool)

(assert (=> b!1251765 (= e!710739 tp_is_empty!31603)))

(declare-fun mapIsEmpty!49168 () Bool)

(declare-fun mapRes!49168 () Bool)

(assert (=> mapIsEmpty!49168 mapRes!49168))

(declare-fun b!1251766 () Bool)

(declare-fun e!710740 () Bool)

(assert (=> b!1251766 (= e!710740 tp_is_empty!31603)))

(declare-fun res!834603 () Bool)

(assert (=> start!105134 (=> (not res!834603) (not e!710737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105134 (= res!834603 (validMask!0 mask!1466))))

(assert (=> start!105134 e!710737))

(assert (=> start!105134 true))

(assert (=> start!105134 tp!93595))

(assert (=> start!105134 tp_is_empty!31603))

(declare-fun array_inv!29887 (array!80923) Bool)

(assert (=> start!105134 (array_inv!29887 _keys!1118)))

(declare-fun e!710741 () Bool)

(declare-fun array_inv!29888 (array!80925) Bool)

(assert (=> start!105134 (and (array_inv!29888 _values!914) e!710741)))

(declare-fun b!1251767 () Bool)

(assert (=> b!1251767 (= e!710741 (and e!710740 mapRes!49168))))

(declare-fun condMapEmpty!49168 () Bool)

(declare-fun mapDefault!49168 () ValueCell!15038)

(assert (=> b!1251767 (= condMapEmpty!49168 (= (arr!39024 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15038)) mapDefault!49168)))))

(declare-fun b!1251768 () Bool)

(declare-fun res!834601 () Bool)

(assert (=> b!1251768 (=> (not res!834601) (not e!710737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80923 (_ BitVec 32)) Bool)

(assert (=> b!1251768 (= res!834601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251769 () Bool)

(declare-fun res!834605 () Bool)

(assert (=> b!1251769 (=> (not res!834605) (not e!710737))))

(assert (=> b!1251769 (= res!834605 (and (= (size!39561 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39560 _keys!1118) (size!39561 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49168 () Bool)

(declare-fun tp!93596 () Bool)

(assert (=> mapNonEmpty!49168 (= mapRes!49168 (and tp!93596 e!710739))))

(declare-fun mapValue!49168 () ValueCell!15038)

(declare-fun mapKey!49168 () (_ BitVec 32))

(declare-fun mapRest!49168 () (Array (_ BitVec 32) ValueCell!15038))

(assert (=> mapNonEmpty!49168 (= (arr!39024 _values!914) (store mapRest!49168 mapKey!49168 mapValue!49168))))

(assert (= (and start!105134 res!834603) b!1251769))

(assert (= (and b!1251769 res!834605) b!1251768))

(assert (= (and b!1251768 res!834601) b!1251761))

(assert (= (and b!1251761 res!834602) b!1251762))

(assert (= (and b!1251762 (not res!834604)) b!1251764))

(assert (= (and b!1251764 (not res!834600)) b!1251763))

(assert (= (and b!1251767 condMapEmpty!49168) mapIsEmpty!49168))

(assert (= (and b!1251767 (not condMapEmpty!49168)) mapNonEmpty!49168))

(get-info :version)

(assert (= (and mapNonEmpty!49168 ((_ is ValueCellFull!15038) mapValue!49168)) b!1251765))

(assert (= (and b!1251767 ((_ is ValueCellFull!15038) mapDefault!49168)) b!1251766))

(assert (= start!105134 b!1251767))

(declare-fun m!1152897 () Bool)

(assert (=> b!1251768 m!1152897))

(declare-fun m!1152899 () Bool)

(assert (=> b!1251762 m!1152899))

(declare-fun m!1152901 () Bool)

(assert (=> b!1251762 m!1152901))

(declare-fun m!1152903 () Bool)

(assert (=> b!1251762 m!1152903))

(declare-fun m!1152905 () Bool)

(assert (=> mapNonEmpty!49168 m!1152905))

(declare-fun m!1152907 () Bool)

(assert (=> start!105134 m!1152907))

(declare-fun m!1152909 () Bool)

(assert (=> start!105134 m!1152909))

(declare-fun m!1152911 () Bool)

(assert (=> start!105134 m!1152911))

(declare-fun m!1152913 () Bool)

(assert (=> b!1251764 m!1152913))

(declare-fun m!1152915 () Bool)

(assert (=> b!1251764 m!1152915))

(declare-fun m!1152917 () Bool)

(assert (=> b!1251761 m!1152917))

(declare-fun m!1152919 () Bool)

(assert (=> b!1251763 m!1152919))

(declare-fun m!1152921 () Bool)

(assert (=> b!1251763 m!1152921))

(check-sat (not b!1251761) (not b_next!26701) (not b!1251768) (not start!105134) (not b!1251762) tp_is_empty!31603 b_and!44479 (not b!1251763) (not mapNonEmpty!49168) (not b!1251764))
(check-sat b_and!44479 (not b_next!26701))
