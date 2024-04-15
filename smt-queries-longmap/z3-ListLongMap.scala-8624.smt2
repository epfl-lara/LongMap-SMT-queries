; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105028 () Bool)

(assert start!105028)

(declare-fun b_free!26779 () Bool)

(declare-fun b_next!26779 () Bool)

(assert (=> start!105028 (= b_free!26779 (not b_next!26779))))

(declare-fun tp!93835 () Bool)

(declare-fun b_and!44557 () Bool)

(assert (=> start!105028 (= tp!93835 b_and!44557)))

(declare-fun b!1251719 () Bool)

(declare-fun e!710845 () Bool)

(declare-fun tp_is_empty!31681 () Bool)

(assert (=> b!1251719 (= e!710845 tp_is_empty!31681)))

(declare-fun b!1251720 () Bool)

(declare-fun res!834845 () Bool)

(declare-fun e!710843 () Bool)

(assert (=> b!1251720 (=> (not res!834845) (not e!710843))))

(declare-datatypes ((array!80949 0))(
  ( (array!80950 (arr!39039 (Array (_ BitVec 32) (_ BitVec 64))) (size!39577 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80949)

(declare-datatypes ((List!27810 0))(
  ( (Nil!27807) (Cons!27806 (h!29015 (_ BitVec 64)) (t!41278 List!27810)) )
))
(declare-fun arrayNoDuplicates!0 (array!80949 (_ BitVec 32) List!27810) Bool)

(assert (=> b!1251720 (= res!834845 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27807))))

(declare-fun b!1251721 () Bool)

(declare-fun res!834842 () Bool)

(assert (=> b!1251721 (=> (not res!834842) (not e!710843))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80949 (_ BitVec 32)) Bool)

(assert (=> b!1251721 (= res!834842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251722 () Bool)

(assert (=> b!1251722 (= e!710843 (not true))))

(declare-datatypes ((V!47607 0))(
  ( (V!47608 (val!15903 Int)) )
))
(declare-datatypes ((tuple2!20594 0))(
  ( (tuple2!20595 (_1!10308 (_ BitVec 64)) (_2!10308 V!47607)) )
))
(declare-datatypes ((List!27811 0))(
  ( (Nil!27808) (Cons!27807 (h!29016 tuple2!20594) (t!41279 List!27811)) )
))
(declare-datatypes ((ListLongMap!18467 0))(
  ( (ListLongMap!18468 (toList!9249 List!27811)) )
))
(declare-fun lt!564872 () ListLongMap!18467)

(declare-fun lt!564870 () ListLongMap!18467)

(assert (=> b!1251722 (= lt!564872 lt!564870)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41464 0))(
  ( (Unit!41465) )
))
(declare-fun lt!564871 () Unit!41464)

(declare-fun minValueAfter!43 () V!47607)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47607)

(declare-datatypes ((ValueCell!15077 0))(
  ( (ValueCellFull!15077 (v!18600 V!47607)) (EmptyCell!15077) )
))
(declare-datatypes ((array!80951 0))(
  ( (array!80952 (arr!39040 (Array (_ BitVec 32) ValueCell!15077)) (size!39578 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80951)

(declare-fun minValueBefore!43 () V!47607)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!975 (array!80949 array!80951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47607 V!47607 V!47607 V!47607 (_ BitVec 32) Int) Unit!41464)

(assert (=> b!1251722 (= lt!564871 (lemmaNoChangeToArrayThenSameMapNoExtras!975 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5653 (array!80949 array!80951 (_ BitVec 32) (_ BitVec 32) V!47607 V!47607 (_ BitVec 32) Int) ListLongMap!18467)

(assert (=> b!1251722 (= lt!564870 (getCurrentListMapNoExtraKeys!5653 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251722 (= lt!564872 (getCurrentListMapNoExtraKeys!5653 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834843 () Bool)

(assert (=> start!105028 (=> (not res!834843) (not e!710843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105028 (= res!834843 (validMask!0 mask!1466))))

(assert (=> start!105028 e!710843))

(assert (=> start!105028 true))

(assert (=> start!105028 tp!93835))

(assert (=> start!105028 tp_is_empty!31681))

(declare-fun array_inv!29907 (array!80949) Bool)

(assert (=> start!105028 (array_inv!29907 _keys!1118)))

(declare-fun e!710841 () Bool)

(declare-fun array_inv!29908 (array!80951) Bool)

(assert (=> start!105028 (and (array_inv!29908 _values!914) e!710841)))

(declare-fun mapIsEmpty!49291 () Bool)

(declare-fun mapRes!49291 () Bool)

(assert (=> mapIsEmpty!49291 mapRes!49291))

(declare-fun mapNonEmpty!49291 () Bool)

(declare-fun tp!93836 () Bool)

(declare-fun e!710844 () Bool)

(assert (=> mapNonEmpty!49291 (= mapRes!49291 (and tp!93836 e!710844))))

(declare-fun mapKey!49291 () (_ BitVec 32))

(declare-fun mapRest!49291 () (Array (_ BitVec 32) ValueCell!15077))

(declare-fun mapValue!49291 () ValueCell!15077)

(assert (=> mapNonEmpty!49291 (= (arr!39040 _values!914) (store mapRest!49291 mapKey!49291 mapValue!49291))))

(declare-fun b!1251723 () Bool)

(assert (=> b!1251723 (= e!710844 tp_is_empty!31681)))

(declare-fun b!1251724 () Bool)

(declare-fun res!834844 () Bool)

(assert (=> b!1251724 (=> (not res!834844) (not e!710843))))

(assert (=> b!1251724 (= res!834844 (and (= (size!39578 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39577 _keys!1118) (size!39578 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251725 () Bool)

(assert (=> b!1251725 (= e!710841 (and e!710845 mapRes!49291))))

(declare-fun condMapEmpty!49291 () Bool)

(declare-fun mapDefault!49291 () ValueCell!15077)

(assert (=> b!1251725 (= condMapEmpty!49291 (= (arr!39040 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15077)) mapDefault!49291)))))

(assert (= (and start!105028 res!834843) b!1251724))

(assert (= (and b!1251724 res!834844) b!1251721))

(assert (= (and b!1251721 res!834842) b!1251720))

(assert (= (and b!1251720 res!834845) b!1251722))

(assert (= (and b!1251725 condMapEmpty!49291) mapIsEmpty!49291))

(assert (= (and b!1251725 (not condMapEmpty!49291)) mapNonEmpty!49291))

(get-info :version)

(assert (= (and mapNonEmpty!49291 ((_ is ValueCellFull!15077) mapValue!49291)) b!1251723))

(assert (= (and b!1251725 ((_ is ValueCellFull!15077) mapDefault!49291)) b!1251719))

(assert (= start!105028 b!1251725))

(declare-fun m!1152007 () Bool)

(assert (=> b!1251720 m!1152007))

(declare-fun m!1152009 () Bool)

(assert (=> b!1251722 m!1152009))

(declare-fun m!1152011 () Bool)

(assert (=> b!1251722 m!1152011))

(declare-fun m!1152013 () Bool)

(assert (=> b!1251722 m!1152013))

(declare-fun m!1152015 () Bool)

(assert (=> b!1251721 m!1152015))

(declare-fun m!1152017 () Bool)

(assert (=> mapNonEmpty!49291 m!1152017))

(declare-fun m!1152019 () Bool)

(assert (=> start!105028 m!1152019))

(declare-fun m!1152021 () Bool)

(assert (=> start!105028 m!1152021))

(declare-fun m!1152023 () Bool)

(assert (=> start!105028 m!1152023))

(check-sat (not b_next!26779) (not b!1251722) tp_is_empty!31681 (not b!1251720) (not mapNonEmpty!49291) (not start!105028) b_and!44557 (not b!1251721))
(check-sat b_and!44557 (not b_next!26779))
