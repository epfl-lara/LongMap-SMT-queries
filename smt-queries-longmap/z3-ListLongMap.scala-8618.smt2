; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104970 () Bool)

(assert start!104970)

(declare-fun b_free!26743 () Bool)

(declare-fun b_next!26743 () Bool)

(assert (=> start!104970 (= b_free!26743 (not b_next!26743))))

(declare-fun tp!93725 () Bool)

(declare-fun b_and!44511 () Bool)

(assert (=> start!104970 (= tp!93725 b_and!44511)))

(declare-fun b!1251098 () Bool)

(declare-fun res!834484 () Bool)

(declare-fun e!710386 () Bool)

(assert (=> b!1251098 (=> (not res!834484) (not e!710386))))

(declare-datatypes ((array!80875 0))(
  ( (array!80876 (arr!39003 (Array (_ BitVec 32) (_ BitVec 64))) (size!39541 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80875)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80875 (_ BitVec 32)) Bool)

(assert (=> b!1251098 (= res!834484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49234 () Bool)

(declare-fun mapRes!49234 () Bool)

(assert (=> mapIsEmpty!49234 mapRes!49234))

(declare-fun b!1251099 () Bool)

(declare-fun res!834483 () Bool)

(assert (=> b!1251099 (=> (not res!834483) (not e!710386))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47559 0))(
  ( (V!47560 (val!15885 Int)) )
))
(declare-datatypes ((ValueCell!15059 0))(
  ( (ValueCellFull!15059 (v!18581 V!47559)) (EmptyCell!15059) )
))
(declare-datatypes ((array!80877 0))(
  ( (array!80878 (arr!39004 (Array (_ BitVec 32) ValueCell!15059)) (size!39542 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80877)

(assert (=> b!1251099 (= res!834483 (and (= (size!39542 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39541 _keys!1118) (size!39542 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251100 () Bool)

(declare-fun res!834481 () Bool)

(assert (=> b!1251100 (=> (not res!834481) (not e!710386))))

(declare-datatypes ((List!27780 0))(
  ( (Nil!27777) (Cons!27776 (h!28985 (_ BitVec 64)) (t!41246 List!27780)) )
))
(declare-fun arrayNoDuplicates!0 (array!80875 (_ BitVec 32) List!27780) Bool)

(assert (=> b!1251100 (= res!834481 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27777))))

(declare-fun b!1251101 () Bool)

(declare-fun e!710385 () Bool)

(declare-fun e!710391 () Bool)

(assert (=> b!1251101 (= e!710385 e!710391)))

(declare-fun res!834479 () Bool)

(assert (=> b!1251101 (=> res!834479 e!710391)))

(declare-datatypes ((tuple2!20560 0))(
  ( (tuple2!20561 (_1!10291 (_ BitVec 64)) (_2!10291 V!47559)) )
))
(declare-datatypes ((List!27781 0))(
  ( (Nil!27778) (Cons!27777 (h!28986 tuple2!20560) (t!41247 List!27781)) )
))
(declare-datatypes ((ListLongMap!18433 0))(
  ( (ListLongMap!18434 (toList!9232 List!27781)) )
))
(declare-fun lt!564502 () ListLongMap!18433)

(declare-fun contains!7476 (ListLongMap!18433 (_ BitVec 64)) Bool)

(assert (=> b!1251101 (= res!834479 (contains!7476 lt!564502 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47559)

(declare-fun minValueBefore!43 () V!47559)

(declare-fun getCurrentListMap!4402 (array!80875 array!80877 (_ BitVec 32) (_ BitVec 32) V!47559 V!47559 (_ BitVec 32) Int) ListLongMap!18433)

(assert (=> b!1251101 (= lt!564502 (getCurrentListMap!4402 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251102 () Bool)

(assert (=> b!1251102 (= e!710386 (not e!710385))))

(declare-fun res!834482 () Bool)

(assert (=> b!1251102 (=> res!834482 e!710385)))

(assert (=> b!1251102 (= res!834482 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564498 () ListLongMap!18433)

(declare-fun lt!564500 () ListLongMap!18433)

(assert (=> b!1251102 (= lt!564498 lt!564500)))

(declare-fun minValueAfter!43 () V!47559)

(declare-datatypes ((Unit!41430 0))(
  ( (Unit!41431) )
))
(declare-fun lt!564499 () Unit!41430)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!962 (array!80875 array!80877 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47559 V!47559 V!47559 V!47559 (_ BitVec 32) Int) Unit!41430)

(assert (=> b!1251102 (= lt!564499 (lemmaNoChangeToArrayThenSameMapNoExtras!962 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5640 (array!80875 array!80877 (_ BitVec 32) (_ BitVec 32) V!47559 V!47559 (_ BitVec 32) Int) ListLongMap!18433)

(assert (=> b!1251102 (= lt!564500 (getCurrentListMapNoExtraKeys!5640 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251102 (= lt!564498 (getCurrentListMapNoExtraKeys!5640 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251103 () Bool)

(declare-fun e!710390 () Bool)

(declare-fun tp_is_empty!31645 () Bool)

(assert (=> b!1251103 (= e!710390 tp_is_empty!31645)))

(declare-fun b!1251104 () Bool)

(assert (=> b!1251104 (= e!710391 true)))

(declare-fun -!1978 (ListLongMap!18433 (_ BitVec 64)) ListLongMap!18433)

(assert (=> b!1251104 (= (-!1978 lt!564502 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564502)))

(declare-fun lt!564501 () Unit!41430)

(declare-fun removeNotPresentStillSame!106 (ListLongMap!18433 (_ BitVec 64)) Unit!41430)

(assert (=> b!1251104 (= lt!564501 (removeNotPresentStillSame!106 lt!564502 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251105 () Bool)

(declare-fun e!710389 () Bool)

(assert (=> b!1251105 (= e!710389 tp_is_empty!31645)))

(declare-fun res!834480 () Bool)

(assert (=> start!104970 (=> (not res!834480) (not e!710386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104970 (= res!834480 (validMask!0 mask!1466))))

(assert (=> start!104970 e!710386))

(assert (=> start!104970 true))

(assert (=> start!104970 tp!93725))

(assert (=> start!104970 tp_is_empty!31645))

(declare-fun array_inv!29879 (array!80875) Bool)

(assert (=> start!104970 (array_inv!29879 _keys!1118)))

(declare-fun e!710388 () Bool)

(declare-fun array_inv!29880 (array!80877) Bool)

(assert (=> start!104970 (and (array_inv!29880 _values!914) e!710388)))

(declare-fun b!1251106 () Bool)

(assert (=> b!1251106 (= e!710388 (and e!710390 mapRes!49234))))

(declare-fun condMapEmpty!49234 () Bool)

(declare-fun mapDefault!49234 () ValueCell!15059)

(assert (=> b!1251106 (= condMapEmpty!49234 (= (arr!39004 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15059)) mapDefault!49234)))))

(declare-fun mapNonEmpty!49234 () Bool)

(declare-fun tp!93724 () Bool)

(assert (=> mapNonEmpty!49234 (= mapRes!49234 (and tp!93724 e!710389))))

(declare-fun mapKey!49234 () (_ BitVec 32))

(declare-fun mapRest!49234 () (Array (_ BitVec 32) ValueCell!15059))

(declare-fun mapValue!49234 () ValueCell!15059)

(assert (=> mapNonEmpty!49234 (= (arr!39004 _values!914) (store mapRest!49234 mapKey!49234 mapValue!49234))))

(assert (= (and start!104970 res!834480) b!1251099))

(assert (= (and b!1251099 res!834483) b!1251098))

(assert (= (and b!1251098 res!834484) b!1251100))

(assert (= (and b!1251100 res!834481) b!1251102))

(assert (= (and b!1251102 (not res!834482)) b!1251101))

(assert (= (and b!1251101 (not res!834479)) b!1251104))

(assert (= (and b!1251106 condMapEmpty!49234) mapIsEmpty!49234))

(assert (= (and b!1251106 (not condMapEmpty!49234)) mapNonEmpty!49234))

(get-info :version)

(assert (= (and mapNonEmpty!49234 ((_ is ValueCellFull!15059) mapValue!49234)) b!1251105))

(assert (= (and b!1251106 ((_ is ValueCellFull!15059) mapDefault!49234)) b!1251103))

(assert (= start!104970 b!1251106))

(declare-fun m!1151437 () Bool)

(assert (=> b!1251101 m!1151437))

(declare-fun m!1151439 () Bool)

(assert (=> b!1251101 m!1151439))

(declare-fun m!1151441 () Bool)

(assert (=> b!1251098 m!1151441))

(declare-fun m!1151443 () Bool)

(assert (=> b!1251100 m!1151443))

(declare-fun m!1151445 () Bool)

(assert (=> b!1251102 m!1151445))

(declare-fun m!1151447 () Bool)

(assert (=> b!1251102 m!1151447))

(declare-fun m!1151449 () Bool)

(assert (=> b!1251102 m!1151449))

(declare-fun m!1151451 () Bool)

(assert (=> b!1251104 m!1151451))

(declare-fun m!1151453 () Bool)

(assert (=> b!1251104 m!1151453))

(declare-fun m!1151455 () Bool)

(assert (=> mapNonEmpty!49234 m!1151455))

(declare-fun m!1151457 () Bool)

(assert (=> start!104970 m!1151457))

(declare-fun m!1151459 () Bool)

(assert (=> start!104970 m!1151459))

(declare-fun m!1151461 () Bool)

(assert (=> start!104970 m!1151461))

(check-sat (not start!104970) b_and!44511 (not b!1251101) (not b_next!26743) (not b!1251100) tp_is_empty!31645 (not b!1251104) (not b!1251102) (not mapNonEmpty!49234) (not b!1251098))
(check-sat b_and!44511 (not b_next!26743))
