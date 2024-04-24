; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105122 () Bool)

(assert start!105122)

(declare-fun b_free!26689 () Bool)

(declare-fun b_next!26689 () Bool)

(assert (=> start!105122 (= b_free!26689 (not b_next!26689))))

(declare-fun tp!93559 () Bool)

(declare-fun b_and!44467 () Bool)

(assert (=> start!105122 (= tp!93559 b_and!44467)))

(declare-fun b!1251599 () Bool)

(declare-fun e!710610 () Bool)

(declare-fun tp_is_empty!31591 () Bool)

(assert (=> b!1251599 (= e!710610 tp_is_empty!31591)))

(declare-fun b!1251600 () Bool)

(declare-fun res!834493 () Bool)

(declare-fun e!710613 () Bool)

(assert (=> b!1251600 (=> (not res!834493) (not e!710613))))

(declare-datatypes ((array!80899 0))(
  ( (array!80900 (arr!39011 (Array (_ BitVec 32) (_ BitVec 64))) (size!39548 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80899)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80899 (_ BitVec 32)) Bool)

(assert (=> b!1251600 (= res!834493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251601 () Bool)

(declare-fun e!710612 () Bool)

(assert (=> b!1251601 (= e!710612 tp_is_empty!31591)))

(declare-fun b!1251602 () Bool)

(declare-fun res!834492 () Bool)

(assert (=> b!1251602 (=> (not res!834492) (not e!710613))))

(declare-datatypes ((List!27715 0))(
  ( (Nil!27712) (Cons!27711 (h!28929 (_ BitVec 64)) (t!41180 List!27715)) )
))
(declare-fun arrayNoDuplicates!0 (array!80899 (_ BitVec 32) List!27715) Bool)

(assert (=> b!1251602 (= res!834492 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27712))))

(declare-fun b!1251603 () Bool)

(declare-fun e!710615 () Bool)

(assert (=> b!1251603 (= e!710613 (not e!710615))))

(declare-fun res!834495 () Bool)

(assert (=> b!1251603 (=> res!834495 e!710615)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251603 (= res!834495 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47487 0))(
  ( (V!47488 (val!15858 Int)) )
))
(declare-datatypes ((tuple2!20466 0))(
  ( (tuple2!20467 (_1!10244 (_ BitVec 64)) (_2!10244 V!47487)) )
))
(declare-datatypes ((List!27716 0))(
  ( (Nil!27713) (Cons!27712 (h!28930 tuple2!20466) (t!41181 List!27716)) )
))
(declare-datatypes ((ListLongMap!18347 0))(
  ( (ListLongMap!18348 (toList!9189 List!27716)) )
))
(declare-fun lt!564633 () ListLongMap!18347)

(declare-fun lt!564632 () ListLongMap!18347)

(assert (=> b!1251603 (= lt!564633 lt!564632)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47487)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47487)

(declare-datatypes ((ValueCell!15032 0))(
  ( (ValueCellFull!15032 (v!18550 V!47487)) (EmptyCell!15032) )
))
(declare-datatypes ((array!80901 0))(
  ( (array!80902 (arr!39012 (Array (_ BitVec 32) ValueCell!15032)) (size!39549 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80901)

(declare-datatypes ((Unit!41516 0))(
  ( (Unit!41517) )
))
(declare-fun lt!564635 () Unit!41516)

(declare-fun minValueBefore!43 () V!47487)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!936 (array!80899 array!80901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47487 V!47487 V!47487 V!47487 (_ BitVec 32) Int) Unit!41516)

(assert (=> b!1251603 (= lt!564635 (lemmaNoChangeToArrayThenSameMapNoExtras!936 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5622 (array!80899 array!80901 (_ BitVec 32) (_ BitVec 32) V!47487 V!47487 (_ BitVec 32) Int) ListLongMap!18347)

(assert (=> b!1251603 (= lt!564632 (getCurrentListMapNoExtraKeys!5622 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251603 (= lt!564633 (getCurrentListMapNoExtraKeys!5622 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49150 () Bool)

(declare-fun mapRes!49150 () Bool)

(declare-fun tp!93560 () Bool)

(assert (=> mapNonEmpty!49150 (= mapRes!49150 (and tp!93560 e!710610))))

(declare-fun mapKey!49150 () (_ BitVec 32))

(declare-fun mapRest!49150 () (Array (_ BitVec 32) ValueCell!15032))

(declare-fun mapValue!49150 () ValueCell!15032)

(assert (=> mapNonEmpty!49150 (= (arr!39012 _values!914) (store mapRest!49150 mapKey!49150 mapValue!49150))))

(declare-fun b!1251604 () Bool)

(declare-fun e!710616 () Bool)

(assert (=> b!1251604 (= e!710615 e!710616)))

(declare-fun res!834497 () Bool)

(assert (=> b!1251604 (=> res!834497 e!710616)))

(declare-fun lt!564636 () ListLongMap!18347)

(declare-fun contains!7516 (ListLongMap!18347 (_ BitVec 64)) Bool)

(assert (=> b!1251604 (= res!834497 (contains!7516 lt!564636 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4453 (array!80899 array!80901 (_ BitVec 32) (_ BitVec 32) V!47487 V!47487 (_ BitVec 32) Int) ListLongMap!18347)

(assert (=> b!1251604 (= lt!564636 (getCurrentListMap!4453 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49150 () Bool)

(assert (=> mapIsEmpty!49150 mapRes!49150))

(declare-fun b!1251605 () Bool)

(declare-fun res!834496 () Bool)

(assert (=> b!1251605 (=> (not res!834496) (not e!710613))))

(assert (=> b!1251605 (= res!834496 (and (= (size!39549 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39548 _keys!1118) (size!39549 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251606 () Bool)

(assert (=> b!1251606 (= e!710616 true)))

(declare-fun -!1978 (ListLongMap!18347 (_ BitVec 64)) ListLongMap!18347)

(assert (=> b!1251606 (= (-!1978 lt!564636 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564636)))

(declare-fun lt!564634 () Unit!41516)

(declare-fun removeNotPresentStillSame!88 (ListLongMap!18347 (_ BitVec 64)) Unit!41516)

(assert (=> b!1251606 (= lt!564634 (removeNotPresentStillSame!88 lt!564636 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!834494 () Bool)

(assert (=> start!105122 (=> (not res!834494) (not e!710613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105122 (= res!834494 (validMask!0 mask!1466))))

(assert (=> start!105122 e!710613))

(assert (=> start!105122 true))

(assert (=> start!105122 tp!93559))

(assert (=> start!105122 tp_is_empty!31591))

(declare-fun array_inv!29879 (array!80899) Bool)

(assert (=> start!105122 (array_inv!29879 _keys!1118)))

(declare-fun e!710611 () Bool)

(declare-fun array_inv!29880 (array!80901) Bool)

(assert (=> start!105122 (and (array_inv!29880 _values!914) e!710611)))

(declare-fun b!1251607 () Bool)

(assert (=> b!1251607 (= e!710611 (and e!710612 mapRes!49150))))

(declare-fun condMapEmpty!49150 () Bool)

(declare-fun mapDefault!49150 () ValueCell!15032)

(assert (=> b!1251607 (= condMapEmpty!49150 (= (arr!39012 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15032)) mapDefault!49150)))))

(assert (= (and start!105122 res!834494) b!1251605))

(assert (= (and b!1251605 res!834496) b!1251600))

(assert (= (and b!1251600 res!834493) b!1251602))

(assert (= (and b!1251602 res!834492) b!1251603))

(assert (= (and b!1251603 (not res!834495)) b!1251604))

(assert (= (and b!1251604 (not res!834497)) b!1251606))

(assert (= (and b!1251607 condMapEmpty!49150) mapIsEmpty!49150))

(assert (= (and b!1251607 (not condMapEmpty!49150)) mapNonEmpty!49150))

(get-info :version)

(assert (= (and mapNonEmpty!49150 ((_ is ValueCellFull!15032) mapValue!49150)) b!1251599))

(assert (= (and b!1251607 ((_ is ValueCellFull!15032) mapDefault!49150)) b!1251601))

(assert (= start!105122 b!1251607))

(declare-fun m!1152741 () Bool)

(assert (=> b!1251606 m!1152741))

(declare-fun m!1152743 () Bool)

(assert (=> b!1251606 m!1152743))

(declare-fun m!1152745 () Bool)

(assert (=> b!1251604 m!1152745))

(declare-fun m!1152747 () Bool)

(assert (=> b!1251604 m!1152747))

(declare-fun m!1152749 () Bool)

(assert (=> b!1251600 m!1152749))

(declare-fun m!1152751 () Bool)

(assert (=> b!1251602 m!1152751))

(declare-fun m!1152753 () Bool)

(assert (=> mapNonEmpty!49150 m!1152753))

(declare-fun m!1152755 () Bool)

(assert (=> start!105122 m!1152755))

(declare-fun m!1152757 () Bool)

(assert (=> start!105122 m!1152757))

(declare-fun m!1152759 () Bool)

(assert (=> start!105122 m!1152759))

(declare-fun m!1152761 () Bool)

(assert (=> b!1251603 m!1152761))

(declare-fun m!1152763 () Bool)

(assert (=> b!1251603 m!1152763))

(declare-fun m!1152765 () Bool)

(assert (=> b!1251603 m!1152765))

(check-sat (not b_next!26689) (not start!105122) b_and!44467 (not b!1251603) (not mapNonEmpty!49150) (not b!1251600) (not b!1251602) (not b!1251606) tp_is_empty!31591 (not b!1251604))
(check-sat b_and!44467 (not b_next!26689))
