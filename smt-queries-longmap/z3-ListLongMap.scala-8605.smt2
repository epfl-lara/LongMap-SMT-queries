; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105098 () Bool)

(assert start!105098)

(declare-fun b_free!26665 () Bool)

(declare-fun b_next!26665 () Bool)

(assert (=> start!105098 (= b_free!26665 (not b_next!26665))))

(declare-fun tp!93488 () Bool)

(declare-fun b_and!44443 () Bool)

(assert (=> start!105098 (= tp!93488 b_and!44443)))

(declare-fun mapNonEmpty!49114 () Bool)

(declare-fun mapRes!49114 () Bool)

(declare-fun tp!93487 () Bool)

(declare-fun e!710363 () Bool)

(assert (=> mapNonEmpty!49114 (= mapRes!49114 (and tp!93487 e!710363))))

(declare-datatypes ((V!47455 0))(
  ( (V!47456 (val!15846 Int)) )
))
(declare-datatypes ((ValueCell!15020 0))(
  ( (ValueCellFull!15020 (v!18538 V!47455)) (EmptyCell!15020) )
))
(declare-fun mapRest!49114 () (Array (_ BitVec 32) ValueCell!15020))

(declare-fun mapValue!49114 () ValueCell!15020)

(declare-fun mapKey!49114 () (_ BitVec 32))

(declare-datatypes ((array!80853 0))(
  ( (array!80854 (arr!38988 (Array (_ BitVec 32) ValueCell!15020)) (size!39525 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80853)

(assert (=> mapNonEmpty!49114 (= (arr!38988 _values!914) (store mapRest!49114 mapKey!49114 mapValue!49114))))

(declare-fun b!1251275 () Bool)

(declare-fun e!710359 () Bool)

(declare-fun e!710362 () Bool)

(assert (=> b!1251275 (= e!710359 (and e!710362 mapRes!49114))))

(declare-fun condMapEmpty!49114 () Bool)

(declare-fun mapDefault!49114 () ValueCell!15020)

(assert (=> b!1251275 (= condMapEmpty!49114 (= (arr!38988 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15020)) mapDefault!49114)))))

(declare-fun b!1251276 () Bool)

(declare-fun res!834281 () Bool)

(declare-fun e!710364 () Bool)

(assert (=> b!1251276 (=> (not res!834281) (not e!710364))))

(declare-datatypes ((array!80855 0))(
  ( (array!80856 (arr!38989 (Array (_ BitVec 32) (_ BitVec 64))) (size!39526 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80855)

(declare-datatypes ((List!27696 0))(
  ( (Nil!27693) (Cons!27692 (h!28910 (_ BitVec 64)) (t!41161 List!27696)) )
))
(declare-fun arrayNoDuplicates!0 (array!80855 (_ BitVec 32) List!27696) Bool)

(assert (=> b!1251276 (= res!834281 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27693))))

(declare-fun mapIsEmpty!49114 () Bool)

(assert (=> mapIsEmpty!49114 mapRes!49114))

(declare-fun b!1251277 () Bool)

(declare-fun e!710358 () Bool)

(declare-fun e!710361 () Bool)

(assert (=> b!1251277 (= e!710358 e!710361)))

(declare-fun res!834278 () Bool)

(assert (=> b!1251277 (=> res!834278 e!710361)))

(declare-datatypes ((tuple2!20444 0))(
  ( (tuple2!20445 (_1!10233 (_ BitVec 64)) (_2!10233 V!47455)) )
))
(declare-datatypes ((List!27697 0))(
  ( (Nil!27694) (Cons!27693 (h!28911 tuple2!20444) (t!41162 List!27697)) )
))
(declare-datatypes ((ListLongMap!18325 0))(
  ( (ListLongMap!18326 (toList!9178 List!27697)) )
))
(declare-fun lt!564454 () ListLongMap!18325)

(declare-fun contains!7508 (ListLongMap!18325 (_ BitVec 64)) Bool)

(assert (=> b!1251277 (= res!834278 (contains!7508 lt!564454 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47455)

(declare-fun minValueBefore!43 () V!47455)

(declare-fun getCurrentListMap!4445 (array!80855 array!80853 (_ BitVec 32) (_ BitVec 32) V!47455 V!47455 (_ BitVec 32) Int) ListLongMap!18325)

(assert (=> b!1251277 (= lt!564454 (getCurrentListMap!4445 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834279 () Bool)

(assert (=> start!105098 (=> (not res!834279) (not e!710364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105098 (= res!834279 (validMask!0 mask!1466))))

(assert (=> start!105098 e!710364))

(assert (=> start!105098 true))

(assert (=> start!105098 tp!93488))

(declare-fun tp_is_empty!31567 () Bool)

(assert (=> start!105098 tp_is_empty!31567))

(declare-fun array_inv!29861 (array!80855) Bool)

(assert (=> start!105098 (array_inv!29861 _keys!1118)))

(declare-fun array_inv!29862 (array!80853) Bool)

(assert (=> start!105098 (and (array_inv!29862 _values!914) e!710359)))

(declare-fun b!1251278 () Bool)

(declare-fun res!834277 () Bool)

(assert (=> b!1251278 (=> (not res!834277) (not e!710364))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1251278 (= res!834277 (and (= (size!39525 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39526 _keys!1118) (size!39525 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251279 () Bool)

(assert (=> b!1251279 (= e!710361 true)))

(declare-fun -!1970 (ListLongMap!18325 (_ BitVec 64)) ListLongMap!18325)

(assert (=> b!1251279 (= (-!1970 lt!564454 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564454)))

(declare-datatypes ((Unit!41496 0))(
  ( (Unit!41497) )
))
(declare-fun lt!564455 () Unit!41496)

(declare-fun removeNotPresentStillSame!80 (ListLongMap!18325 (_ BitVec 64)) Unit!41496)

(assert (=> b!1251279 (= lt!564455 (removeNotPresentStillSame!80 lt!564454 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251280 () Bool)

(assert (=> b!1251280 (= e!710363 tp_is_empty!31567)))

(declare-fun b!1251281 () Bool)

(declare-fun res!834280 () Bool)

(assert (=> b!1251281 (=> (not res!834280) (not e!710364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80855 (_ BitVec 32)) Bool)

(assert (=> b!1251281 (= res!834280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251282 () Bool)

(assert (=> b!1251282 (= e!710362 tp_is_empty!31567)))

(declare-fun b!1251283 () Bool)

(assert (=> b!1251283 (= e!710364 (not e!710358))))

(declare-fun res!834276 () Bool)

(assert (=> b!1251283 (=> res!834276 e!710358)))

(assert (=> b!1251283 (= res!834276 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564456 () ListLongMap!18325)

(declare-fun lt!564453 () ListLongMap!18325)

(assert (=> b!1251283 (= lt!564456 lt!564453)))

(declare-fun minValueAfter!43 () V!47455)

(declare-fun lt!564452 () Unit!41496)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!927 (array!80855 array!80853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47455 V!47455 V!47455 V!47455 (_ BitVec 32) Int) Unit!41496)

(assert (=> b!1251283 (= lt!564452 (lemmaNoChangeToArrayThenSameMapNoExtras!927 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5613 (array!80855 array!80853 (_ BitVec 32) (_ BitVec 32) V!47455 V!47455 (_ BitVec 32) Int) ListLongMap!18325)

(assert (=> b!1251283 (= lt!564453 (getCurrentListMapNoExtraKeys!5613 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251283 (= lt!564456 (getCurrentListMapNoExtraKeys!5613 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105098 res!834279) b!1251278))

(assert (= (and b!1251278 res!834277) b!1251281))

(assert (= (and b!1251281 res!834280) b!1251276))

(assert (= (and b!1251276 res!834281) b!1251283))

(assert (= (and b!1251283 (not res!834276)) b!1251277))

(assert (= (and b!1251277 (not res!834278)) b!1251279))

(assert (= (and b!1251275 condMapEmpty!49114) mapIsEmpty!49114))

(assert (= (and b!1251275 (not condMapEmpty!49114)) mapNonEmpty!49114))

(get-info :version)

(assert (= (and mapNonEmpty!49114 ((_ is ValueCellFull!15020) mapValue!49114)) b!1251280))

(assert (= (and b!1251275 ((_ is ValueCellFull!15020) mapDefault!49114)) b!1251282))

(assert (= start!105098 b!1251275))

(declare-fun m!1152429 () Bool)

(assert (=> b!1251276 m!1152429))

(declare-fun m!1152431 () Bool)

(assert (=> mapNonEmpty!49114 m!1152431))

(declare-fun m!1152433 () Bool)

(assert (=> b!1251283 m!1152433))

(declare-fun m!1152435 () Bool)

(assert (=> b!1251283 m!1152435))

(declare-fun m!1152437 () Bool)

(assert (=> b!1251283 m!1152437))

(declare-fun m!1152439 () Bool)

(assert (=> b!1251279 m!1152439))

(declare-fun m!1152441 () Bool)

(assert (=> b!1251279 m!1152441))

(declare-fun m!1152443 () Bool)

(assert (=> start!105098 m!1152443))

(declare-fun m!1152445 () Bool)

(assert (=> start!105098 m!1152445))

(declare-fun m!1152447 () Bool)

(assert (=> start!105098 m!1152447))

(declare-fun m!1152449 () Bool)

(assert (=> b!1251277 m!1152449))

(declare-fun m!1152451 () Bool)

(assert (=> b!1251277 m!1152451))

(declare-fun m!1152453 () Bool)

(assert (=> b!1251281 m!1152453))

(check-sat (not b!1251276) (not b!1251279) (not b!1251283) (not b!1251281) (not b!1251277) (not start!105098) tp_is_empty!31567 (not b_next!26665) (not mapNonEmpty!49114) b_and!44443)
(check-sat b_and!44443 (not b_next!26665))
