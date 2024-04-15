; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104730 () Bool)

(assert start!104730)

(declare-fun b_free!26539 () Bool)

(declare-fun b_next!26539 () Bool)

(assert (=> start!104730 (= b_free!26539 (not b_next!26539))))

(declare-fun tp!93106 () Bool)

(declare-fun b_and!44289 () Bool)

(assert (=> start!104730 (= tp!93106 b_and!44289)))

(declare-fun b!1248467 () Bool)

(declare-fun res!832916 () Bool)

(declare-fun e!708453 () Bool)

(assert (=> b!1248467 (=> (not res!832916) (not e!708453))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80487 0))(
  ( (array!80488 (arr!38811 (Array (_ BitVec 32) (_ BitVec 64))) (size!39349 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80487)

(declare-datatypes ((V!47287 0))(
  ( (V!47288 (val!15783 Int)) )
))
(declare-datatypes ((ValueCell!14957 0))(
  ( (ValueCellFull!14957 (v!18478 V!47287)) (EmptyCell!14957) )
))
(declare-datatypes ((array!80489 0))(
  ( (array!80490 (arr!38812 (Array (_ BitVec 32) ValueCell!14957)) (size!39350 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80489)

(assert (=> b!1248467 (= res!832916 (and (= (size!39350 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39349 _keys!1118) (size!39350 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!832918 () Bool)

(assert (=> start!104730 (=> (not res!832918) (not e!708453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104730 (= res!832918 (validMask!0 mask!1466))))

(assert (=> start!104730 e!708453))

(assert (=> start!104730 true))

(assert (=> start!104730 tp!93106))

(declare-fun tp_is_empty!31441 () Bool)

(assert (=> start!104730 tp_is_empty!31441))

(declare-fun array_inv!29755 (array!80487) Bool)

(assert (=> start!104730 (array_inv!29755 _keys!1118)))

(declare-fun e!708457 () Bool)

(declare-fun array_inv!29756 (array!80489) Bool)

(assert (=> start!104730 (and (array_inv!29756 _values!914) e!708457)))

(declare-fun mapNonEmpty!48922 () Bool)

(declare-fun mapRes!48922 () Bool)

(declare-fun tp!93107 () Bool)

(declare-fun e!708454 () Bool)

(assert (=> mapNonEmpty!48922 (= mapRes!48922 (and tp!93107 e!708454))))

(declare-fun mapKey!48922 () (_ BitVec 32))

(declare-fun mapRest!48922 () (Array (_ BitVec 32) ValueCell!14957))

(declare-fun mapValue!48922 () ValueCell!14957)

(assert (=> mapNonEmpty!48922 (= (arr!38812 _values!914) (store mapRest!48922 mapKey!48922 mapValue!48922))))

(declare-fun b!1248468 () Bool)

(assert (=> b!1248468 (= e!708454 tp_is_empty!31441)))

(declare-fun b!1248469 () Bool)

(declare-fun res!832919 () Bool)

(assert (=> b!1248469 (=> (not res!832919) (not e!708453))))

(declare-datatypes ((List!27639 0))(
  ( (Nil!27636) (Cons!27635 (h!28844 (_ BitVec 64)) (t!41101 List!27639)) )
))
(declare-fun arrayNoDuplicates!0 (array!80487 (_ BitVec 32) List!27639) Bool)

(assert (=> b!1248469 (= res!832919 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27636))))

(declare-fun b!1248470 () Bool)

(declare-fun e!708455 () Bool)

(assert (=> b!1248470 (= e!708457 (and e!708455 mapRes!48922))))

(declare-fun condMapEmpty!48922 () Bool)

(declare-fun mapDefault!48922 () ValueCell!14957)

(assert (=> b!1248470 (= condMapEmpty!48922 (= (arr!38812 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14957)) mapDefault!48922)))))

(declare-fun b!1248471 () Bool)

(assert (=> b!1248471 (= e!708453 false)))

(declare-fun minValueAfter!43 () V!47287)

(declare-fun zeroValue!871 () V!47287)

(declare-datatypes ((tuple2!20410 0))(
  ( (tuple2!20411 (_1!10216 (_ BitVec 64)) (_2!10216 V!47287)) )
))
(declare-datatypes ((List!27640 0))(
  ( (Nil!27637) (Cons!27636 (h!28845 tuple2!20410) (t!41102 List!27640)) )
))
(declare-datatypes ((ListLongMap!18283 0))(
  ( (ListLongMap!18284 (toList!9157 List!27640)) )
))
(declare-fun lt!563267 () ListLongMap!18283)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5574 (array!80487 array!80489 (_ BitVec 32) (_ BitVec 32) V!47287 V!47287 (_ BitVec 32) Int) ListLongMap!18283)

(assert (=> b!1248471 (= lt!563267 (getCurrentListMapNoExtraKeys!5574 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!47287)

(declare-fun lt!563266 () ListLongMap!18283)

(assert (=> b!1248471 (= lt!563266 (getCurrentListMapNoExtraKeys!5574 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248472 () Bool)

(assert (=> b!1248472 (= e!708455 tp_is_empty!31441)))

(declare-fun b!1248473 () Bool)

(declare-fun res!832917 () Bool)

(assert (=> b!1248473 (=> (not res!832917) (not e!708453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80487 (_ BitVec 32)) Bool)

(assert (=> b!1248473 (= res!832917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48922 () Bool)

(assert (=> mapIsEmpty!48922 mapRes!48922))

(assert (= (and start!104730 res!832918) b!1248467))

(assert (= (and b!1248467 res!832916) b!1248473))

(assert (= (and b!1248473 res!832917) b!1248469))

(assert (= (and b!1248469 res!832919) b!1248471))

(assert (= (and b!1248470 condMapEmpty!48922) mapIsEmpty!48922))

(assert (= (and b!1248470 (not condMapEmpty!48922)) mapNonEmpty!48922))

(get-info :version)

(assert (= (and mapNonEmpty!48922 ((_ is ValueCellFull!14957) mapValue!48922)) b!1248468))

(assert (= (and b!1248470 ((_ is ValueCellFull!14957) mapDefault!48922)) b!1248472))

(assert (= start!104730 b!1248470))

(declare-fun m!1149151 () Bool)

(assert (=> b!1248473 m!1149151))

(declare-fun m!1149153 () Bool)

(assert (=> start!104730 m!1149153))

(declare-fun m!1149155 () Bool)

(assert (=> start!104730 m!1149155))

(declare-fun m!1149157 () Bool)

(assert (=> start!104730 m!1149157))

(declare-fun m!1149159 () Bool)

(assert (=> b!1248469 m!1149159))

(declare-fun m!1149161 () Bool)

(assert (=> mapNonEmpty!48922 m!1149161))

(declare-fun m!1149163 () Bool)

(assert (=> b!1248471 m!1149163))

(declare-fun m!1149165 () Bool)

(assert (=> b!1248471 m!1149165))

(check-sat (not b!1248471) b_and!44289 tp_is_empty!31441 (not b!1248473) (not mapNonEmpty!48922) (not start!104730) (not b_next!26539) (not b!1248469))
(check-sat b_and!44289 (not b_next!26539))
