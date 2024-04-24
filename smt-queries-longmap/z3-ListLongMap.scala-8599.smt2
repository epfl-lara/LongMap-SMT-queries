; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105048 () Bool)

(assert start!105048)

(declare-fun b_free!26629 () Bool)

(declare-fun b_next!26629 () Bool)

(assert (=> start!105048 (= b_free!26629 (not b_next!26629))))

(declare-fun tp!93376 () Bool)

(declare-fun b_and!44399 () Bool)

(assert (=> start!105048 (= tp!93376 b_and!44399)))

(declare-fun b!1250799 () Bool)

(declare-fun res!834017 () Bool)

(declare-fun e!710022 () Bool)

(assert (=> b!1250799 (=> (not res!834017) (not e!710022))))

(declare-datatypes ((array!80781 0))(
  ( (array!80782 (arr!38953 (Array (_ BitVec 32) (_ BitVec 64))) (size!39490 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80781)

(declare-datatypes ((List!27669 0))(
  ( (Nil!27666) (Cons!27665 (h!28883 (_ BitVec 64)) (t!41132 List!27669)) )
))
(declare-fun arrayNoDuplicates!0 (array!80781 (_ BitVec 32) List!27669) Bool)

(assert (=> b!1250799 (= res!834017 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27666))))

(declare-fun b!1250800 () Bool)

(declare-fun e!710021 () Bool)

(declare-fun tp_is_empty!31531 () Bool)

(assert (=> b!1250800 (= e!710021 tp_is_empty!31531)))

(declare-fun b!1250802 () Bool)

(declare-fun e!710023 () Bool)

(assert (=> b!1250802 (= e!710023 tp_is_empty!31531)))

(declare-fun b!1250803 () Bool)

(declare-fun e!710020 () Bool)

(declare-fun mapRes!49057 () Bool)

(assert (=> b!1250803 (= e!710020 (and e!710023 mapRes!49057))))

(declare-fun condMapEmpty!49057 () Bool)

(declare-datatypes ((V!47407 0))(
  ( (V!47408 (val!15828 Int)) )
))
(declare-datatypes ((ValueCell!15002 0))(
  ( (ValueCellFull!15002 (v!18520 V!47407)) (EmptyCell!15002) )
))
(declare-datatypes ((array!80783 0))(
  ( (array!80784 (arr!38954 (Array (_ BitVec 32) ValueCell!15002)) (size!39491 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80783)

(declare-fun mapDefault!49057 () ValueCell!15002)

(assert (=> b!1250803 (= condMapEmpty!49057 (= (arr!38954 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15002)) mapDefault!49057)))))

(declare-fun mapNonEmpty!49057 () Bool)

(declare-fun tp!93377 () Bool)

(assert (=> mapNonEmpty!49057 (= mapRes!49057 (and tp!93377 e!710021))))

(declare-fun mapKey!49057 () (_ BitVec 32))

(declare-fun mapValue!49057 () ValueCell!15002)

(declare-fun mapRest!49057 () (Array (_ BitVec 32) ValueCell!15002))

(assert (=> mapNonEmpty!49057 (= (arr!38954 _values!914) (store mapRest!49057 mapKey!49057 mapValue!49057))))

(declare-fun b!1250804 () Bool)

(declare-fun res!834016 () Bool)

(assert (=> b!1250804 (=> (not res!834016) (not e!710022))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250804 (= res!834016 (and (= (size!39491 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39490 _keys!1118) (size!39491 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250805 () Bool)

(declare-fun res!834018 () Bool)

(assert (=> b!1250805 (=> (not res!834018) (not e!710022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80781 (_ BitVec 32)) Bool)

(assert (=> b!1250805 (= res!834018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49057 () Bool)

(assert (=> mapIsEmpty!49057 mapRes!49057))

(declare-fun b!1250801 () Bool)

(assert (=> b!1250801 (= e!710022 (not true))))

(declare-datatypes ((tuple2!20414 0))(
  ( (tuple2!20415 (_1!10218 (_ BitVec 64)) (_2!10218 V!47407)) )
))
(declare-datatypes ((List!27670 0))(
  ( (Nil!27667) (Cons!27666 (h!28884 tuple2!20414) (t!41133 List!27670)) )
))
(declare-datatypes ((ListLongMap!18295 0))(
  ( (ListLongMap!18296 (toList!9163 List!27670)) )
))
(declare-fun lt!564237 () ListLongMap!18295)

(declare-fun lt!564238 () ListLongMap!18295)

(assert (=> b!1250801 (= lt!564237 lt!564238)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47407)

(declare-datatypes ((Unit!41466 0))(
  ( (Unit!41467) )
))
(declare-fun lt!564239 () Unit!41466)

(declare-fun zeroValue!871 () V!47407)

(declare-fun minValueBefore!43 () V!47407)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!912 (array!80781 array!80783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47407 V!47407 V!47407 V!47407 (_ BitVec 32) Int) Unit!41466)

(assert (=> b!1250801 (= lt!564239 (lemmaNoChangeToArrayThenSameMapNoExtras!912 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5598 (array!80781 array!80783 (_ BitVec 32) (_ BitVec 32) V!47407 V!47407 (_ BitVec 32) Int) ListLongMap!18295)

(assert (=> b!1250801 (= lt!564238 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250801 (= lt!564237 (getCurrentListMapNoExtraKeys!5598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834019 () Bool)

(assert (=> start!105048 (=> (not res!834019) (not e!710022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105048 (= res!834019 (validMask!0 mask!1466))))

(assert (=> start!105048 e!710022))

(assert (=> start!105048 true))

(assert (=> start!105048 tp!93376))

(assert (=> start!105048 tp_is_empty!31531))

(declare-fun array_inv!29835 (array!80781) Bool)

(assert (=> start!105048 (array_inv!29835 _keys!1118)))

(declare-fun array_inv!29836 (array!80783) Bool)

(assert (=> start!105048 (and (array_inv!29836 _values!914) e!710020)))

(assert (= (and start!105048 res!834019) b!1250804))

(assert (= (and b!1250804 res!834016) b!1250805))

(assert (= (and b!1250805 res!834018) b!1250799))

(assert (= (and b!1250799 res!834017) b!1250801))

(assert (= (and b!1250803 condMapEmpty!49057) mapIsEmpty!49057))

(assert (= (and b!1250803 (not condMapEmpty!49057)) mapNonEmpty!49057))

(get-info :version)

(assert (= (and mapNonEmpty!49057 ((_ is ValueCellFull!15002) mapValue!49057)) b!1250800))

(assert (= (and b!1250803 ((_ is ValueCellFull!15002) mapDefault!49057)) b!1250802))

(assert (= start!105048 b!1250803))

(declare-fun m!1152027 () Bool)

(assert (=> start!105048 m!1152027))

(declare-fun m!1152029 () Bool)

(assert (=> start!105048 m!1152029))

(declare-fun m!1152031 () Bool)

(assert (=> start!105048 m!1152031))

(declare-fun m!1152033 () Bool)

(assert (=> b!1250805 m!1152033))

(declare-fun m!1152035 () Bool)

(assert (=> b!1250799 m!1152035))

(declare-fun m!1152037 () Bool)

(assert (=> mapNonEmpty!49057 m!1152037))

(declare-fun m!1152039 () Bool)

(assert (=> b!1250801 m!1152039))

(declare-fun m!1152041 () Bool)

(assert (=> b!1250801 m!1152041))

(declare-fun m!1152043 () Bool)

(assert (=> b!1250801 m!1152043))

(check-sat (not mapNonEmpty!49057) b_and!44399 (not b!1250801) (not start!105048) (not b!1250805) tp_is_empty!31531 (not b_next!26629) (not b!1250799))
(check-sat b_and!44399 (not b_next!26629))
