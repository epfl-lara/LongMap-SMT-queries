; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104820 () Bool)

(assert start!104820)

(declare-fun b_free!26629 () Bool)

(declare-fun b_next!26629 () Bool)

(assert (=> start!104820 (= b_free!26629 (not b_next!26629))))

(declare-fun tp!93376 () Bool)

(declare-fun b_and!44379 () Bool)

(assert (=> start!104820 (= tp!93376 b_and!44379)))

(declare-fun mapIsEmpty!49057 () Bool)

(declare-fun mapRes!49057 () Bool)

(assert (=> mapIsEmpty!49057 mapRes!49057))

(declare-fun mapNonEmpty!49057 () Bool)

(declare-fun tp!93377 () Bool)

(declare-fun e!709129 () Bool)

(assert (=> mapNonEmpty!49057 (= mapRes!49057 (and tp!93377 e!709129))))

(declare-fun mapKey!49057 () (_ BitVec 32))

(declare-datatypes ((V!47407 0))(
  ( (V!47408 (val!15828 Int)) )
))
(declare-datatypes ((ValueCell!15002 0))(
  ( (ValueCellFull!15002 (v!18523 V!47407)) (EmptyCell!15002) )
))
(declare-fun mapValue!49057 () ValueCell!15002)

(declare-fun mapRest!49057 () (Array (_ BitVec 32) ValueCell!15002))

(declare-datatypes ((array!80657 0))(
  ( (array!80658 (arr!38896 (Array (_ BitVec 32) ValueCell!15002)) (size!39434 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80657)

(assert (=> mapNonEmpty!49057 (= (arr!38896 _values!914) (store mapRest!49057 mapKey!49057 mapValue!49057))))

(declare-fun res!833456 () Bool)

(declare-fun e!709128 () Bool)

(assert (=> start!104820 (=> (not res!833456) (not e!709128))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104820 (= res!833456 (validMask!0 mask!1466))))

(assert (=> start!104820 e!709128))

(assert (=> start!104820 true))

(assert (=> start!104820 tp!93376))

(declare-fun tp_is_empty!31531 () Bool)

(assert (=> start!104820 tp_is_empty!31531))

(declare-datatypes ((array!80659 0))(
  ( (array!80660 (arr!38897 (Array (_ BitVec 32) (_ BitVec 64))) (size!39435 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80659)

(declare-fun array_inv!29815 (array!80659) Bool)

(assert (=> start!104820 (array_inv!29815 _keys!1118)))

(declare-fun e!709132 () Bool)

(declare-fun array_inv!29816 (array!80657) Bool)

(assert (=> start!104820 (and (array_inv!29816 _values!914) e!709132)))

(declare-fun b!1249412 () Bool)

(declare-fun e!709130 () Bool)

(assert (=> b!1249412 (= e!709132 (and e!709130 mapRes!49057))))

(declare-fun condMapEmpty!49057 () Bool)

(declare-fun mapDefault!49057 () ValueCell!15002)

(assert (=> b!1249412 (= condMapEmpty!49057 (= (arr!38896 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15002)) mapDefault!49057)))))

(declare-fun b!1249413 () Bool)

(assert (=> b!1249413 (= e!709129 tp_is_empty!31531)))

(declare-fun b!1249414 () Bool)

(declare-fun res!833458 () Bool)

(assert (=> b!1249414 (=> (not res!833458) (not e!709128))))

(declare-datatypes ((List!27694 0))(
  ( (Nil!27691) (Cons!27690 (h!28899 (_ BitVec 64)) (t!41156 List!27694)) )
))
(declare-fun arrayNoDuplicates!0 (array!80659 (_ BitVec 32) List!27694) Bool)

(assert (=> b!1249414 (= res!833458 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27691))))

(declare-fun b!1249415 () Bool)

(assert (=> b!1249415 (= e!709128 (not true))))

(declare-datatypes ((tuple2!20466 0))(
  ( (tuple2!20467 (_1!10244 (_ BitVec 64)) (_2!10244 V!47407)) )
))
(declare-datatypes ((List!27695 0))(
  ( (Nil!27692) (Cons!27691 (h!28900 tuple2!20466) (t!41157 List!27695)) )
))
(declare-datatypes ((ListLongMap!18339 0))(
  ( (ListLongMap!18340 (toList!9185 List!27695)) )
))
(declare-fun lt!563574 () ListLongMap!18339)

(declare-fun lt!563575 () ListLongMap!18339)

(assert (=> b!1249415 (= lt!563574 lt!563575)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47407)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((Unit!41338 0))(
  ( (Unit!41339) )
))
(declare-fun lt!563576 () Unit!41338)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47407)

(declare-fun minValueBefore!43 () V!47407)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!924 (array!80659 array!80657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47407 V!47407 V!47407 V!47407 (_ BitVec 32) Int) Unit!41338)

(assert (=> b!1249415 (= lt!563576 (lemmaNoChangeToArrayThenSameMapNoExtras!924 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5602 (array!80659 array!80657 (_ BitVec 32) (_ BitVec 32) V!47407 V!47407 (_ BitVec 32) Int) ListLongMap!18339)

(assert (=> b!1249415 (= lt!563575 (getCurrentListMapNoExtraKeys!5602 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249415 (= lt!563574 (getCurrentListMapNoExtraKeys!5602 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249416 () Bool)

(assert (=> b!1249416 (= e!709130 tp_is_empty!31531)))

(declare-fun b!1249417 () Bool)

(declare-fun res!833457 () Bool)

(assert (=> b!1249417 (=> (not res!833457) (not e!709128))))

(assert (=> b!1249417 (= res!833457 (and (= (size!39434 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39435 _keys!1118) (size!39434 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249418 () Bool)

(declare-fun res!833459 () Bool)

(assert (=> b!1249418 (=> (not res!833459) (not e!709128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80659 (_ BitVec 32)) Bool)

(assert (=> b!1249418 (= res!833459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104820 res!833456) b!1249417))

(assert (= (and b!1249417 res!833457) b!1249418))

(assert (= (and b!1249418 res!833459) b!1249414))

(assert (= (and b!1249414 res!833458) b!1249415))

(assert (= (and b!1249412 condMapEmpty!49057) mapIsEmpty!49057))

(assert (= (and b!1249412 (not condMapEmpty!49057)) mapNonEmpty!49057))

(get-info :version)

(assert (= (and mapNonEmpty!49057 ((_ is ValueCellFull!15002) mapValue!49057)) b!1249413))

(assert (= (and b!1249412 ((_ is ValueCellFull!15002) mapDefault!49057)) b!1249416))

(assert (= start!104820 b!1249412))

(declare-fun m!1149895 () Bool)

(assert (=> b!1249415 m!1149895))

(declare-fun m!1149897 () Bool)

(assert (=> b!1249415 m!1149897))

(declare-fun m!1149899 () Bool)

(assert (=> b!1249415 m!1149899))

(declare-fun m!1149901 () Bool)

(assert (=> b!1249414 m!1149901))

(declare-fun m!1149903 () Bool)

(assert (=> b!1249418 m!1149903))

(declare-fun m!1149905 () Bool)

(assert (=> mapNonEmpty!49057 m!1149905))

(declare-fun m!1149907 () Bool)

(assert (=> start!104820 m!1149907))

(declare-fun m!1149909 () Bool)

(assert (=> start!104820 m!1149909))

(declare-fun m!1149911 () Bool)

(assert (=> start!104820 m!1149911))

(check-sat (not b!1249415) (not b_next!26629) (not b!1249414) (not b!1249418) (not mapNonEmpty!49057) (not start!104820) tp_is_empty!31531 b_and!44379)
(check-sat b_and!44379 (not b_next!26629))
