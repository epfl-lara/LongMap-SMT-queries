; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104736 () Bool)

(assert start!104736)

(declare-fun b_free!26541 () Bool)

(declare-fun b_next!26541 () Bool)

(assert (=> start!104736 (= b_free!26541 (not b_next!26541))))

(declare-fun tp!93113 () Bool)

(declare-fun b_and!44309 () Bool)

(assert (=> start!104736 (= tp!93113 b_and!44309)))

(declare-fun mapNonEmpty!48925 () Bool)

(declare-fun mapRes!48925 () Bool)

(declare-fun tp!93112 () Bool)

(declare-fun e!708516 () Bool)

(assert (=> mapNonEmpty!48925 (= mapRes!48925 (and tp!93112 e!708516))))

(declare-fun mapKey!48925 () (_ BitVec 32))

(declare-datatypes ((V!47289 0))(
  ( (V!47290 (val!15784 Int)) )
))
(declare-datatypes ((ValueCell!14958 0))(
  ( (ValueCellFull!14958 (v!18480 V!47289)) (EmptyCell!14958) )
))
(declare-fun mapValue!48925 () ValueCell!14958)

(declare-datatypes ((array!80578 0))(
  ( (array!80579 (arr!38856 (Array (_ BitVec 32) ValueCell!14958)) (size!39392 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80578)

(declare-fun mapRest!48925 () (Array (_ BitVec 32) ValueCell!14958))

(assert (=> mapNonEmpty!48925 (= (arr!38856 _values!914) (store mapRest!48925 mapKey!48925 mapValue!48925))))

(declare-fun b!1248570 () Bool)

(declare-fun res!832968 () Bool)

(declare-fun e!708517 () Bool)

(assert (=> b!1248570 (=> (not res!832968) (not e!708517))))

(declare-datatypes ((array!80580 0))(
  ( (array!80581 (arr!38857 (Array (_ BitVec 32) (_ BitVec 64))) (size!39393 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80580)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80580 (_ BitVec 32)) Bool)

(assert (=> b!1248570 (= res!832968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248571 () Bool)

(assert (=> b!1248571 (= e!708517 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47289)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47289)

(declare-datatypes ((tuple2!20328 0))(
  ( (tuple2!20329 (_1!10175 (_ BitVec 64)) (_2!10175 V!47289)) )
))
(declare-datatypes ((List!27576 0))(
  ( (Nil!27573) (Cons!27572 (h!28781 tuple2!20328) (t!41047 List!27576)) )
))
(declare-datatypes ((ListLongMap!18201 0))(
  ( (ListLongMap!18202 (toList!9116 List!27576)) )
))
(declare-fun lt!563451 () ListLongMap!18201)

(declare-fun getCurrentListMapNoExtraKeys!5523 (array!80580 array!80578 (_ BitVec 32) (_ BitVec 32) V!47289 V!47289 (_ BitVec 32) Int) ListLongMap!18201)

(assert (=> b!1248571 (= lt!563451 (getCurrentListMapNoExtraKeys!5523 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563452 () ListLongMap!18201)

(declare-fun minValueBefore!43 () V!47289)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1248571 (= lt!563452 (getCurrentListMapNoExtraKeys!5523 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248572 () Bool)

(declare-fun res!832970 () Bool)

(assert (=> b!1248572 (=> (not res!832970) (not e!708517))))

(assert (=> b!1248572 (= res!832970 (and (= (size!39392 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39393 _keys!1118) (size!39392 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!832969 () Bool)

(assert (=> start!104736 (=> (not res!832969) (not e!708517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104736 (= res!832969 (validMask!0 mask!1466))))

(assert (=> start!104736 e!708517))

(assert (=> start!104736 true))

(assert (=> start!104736 tp!93113))

(declare-fun tp_is_empty!31443 () Bool)

(assert (=> start!104736 tp_is_empty!31443))

(declare-fun array_inv!29655 (array!80580) Bool)

(assert (=> start!104736 (array_inv!29655 _keys!1118)))

(declare-fun e!708513 () Bool)

(declare-fun array_inv!29656 (array!80578) Bool)

(assert (=> start!104736 (and (array_inv!29656 _values!914) e!708513)))

(declare-fun b!1248573 () Bool)

(declare-fun e!708515 () Bool)

(assert (=> b!1248573 (= e!708513 (and e!708515 mapRes!48925))))

(declare-fun condMapEmpty!48925 () Bool)

(declare-fun mapDefault!48925 () ValueCell!14958)

(assert (=> b!1248573 (= condMapEmpty!48925 (= (arr!38856 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14958)) mapDefault!48925)))))

(declare-fun b!1248574 () Bool)

(declare-fun res!832971 () Bool)

(assert (=> b!1248574 (=> (not res!832971) (not e!708517))))

(declare-datatypes ((List!27577 0))(
  ( (Nil!27574) (Cons!27573 (h!28782 (_ BitVec 64)) (t!41048 List!27577)) )
))
(declare-fun arrayNoDuplicates!0 (array!80580 (_ BitVec 32) List!27577) Bool)

(assert (=> b!1248574 (= res!832971 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27574))))

(declare-fun b!1248575 () Bool)

(assert (=> b!1248575 (= e!708515 tp_is_empty!31443)))

(declare-fun mapIsEmpty!48925 () Bool)

(assert (=> mapIsEmpty!48925 mapRes!48925))

(declare-fun b!1248576 () Bool)

(assert (=> b!1248576 (= e!708516 tp_is_empty!31443)))

(assert (= (and start!104736 res!832969) b!1248572))

(assert (= (and b!1248572 res!832970) b!1248570))

(assert (= (and b!1248570 res!832968) b!1248574))

(assert (= (and b!1248574 res!832971) b!1248571))

(assert (= (and b!1248573 condMapEmpty!48925) mapIsEmpty!48925))

(assert (= (and b!1248573 (not condMapEmpty!48925)) mapNonEmpty!48925))

(get-info :version)

(assert (= (and mapNonEmpty!48925 ((_ is ValueCellFull!14958) mapValue!48925)) b!1248576))

(assert (= (and b!1248573 ((_ is ValueCellFull!14958) mapDefault!48925)) b!1248575))

(assert (= start!104736 b!1248573))

(declare-fun m!1149687 () Bool)

(assert (=> start!104736 m!1149687))

(declare-fun m!1149689 () Bool)

(assert (=> start!104736 m!1149689))

(declare-fun m!1149691 () Bool)

(assert (=> start!104736 m!1149691))

(declare-fun m!1149693 () Bool)

(assert (=> b!1248571 m!1149693))

(declare-fun m!1149695 () Bool)

(assert (=> b!1248571 m!1149695))

(declare-fun m!1149697 () Bool)

(assert (=> mapNonEmpty!48925 m!1149697))

(declare-fun m!1149699 () Bool)

(assert (=> b!1248570 m!1149699))

(declare-fun m!1149701 () Bool)

(assert (=> b!1248574 m!1149701))

(check-sat (not b_next!26541) (not b!1248570) (not b!1248574) (not mapNonEmpty!48925) (not b!1248571) tp_is_empty!31443 b_and!44309 (not start!104736))
(check-sat b_and!44309 (not b_next!26541))
