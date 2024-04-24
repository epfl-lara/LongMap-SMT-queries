; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104970 () Bool)

(assert start!104970)

(declare-fun b_free!26551 () Bool)

(declare-fun b_next!26551 () Bool)

(assert (=> start!104970 (= b_free!26551 (not b_next!26551))))

(declare-fun tp!93142 () Bool)

(declare-fun b_and!44321 () Bool)

(assert (=> start!104970 (= tp!93142 b_and!44321)))

(declare-fun mapIsEmpty!48940 () Bool)

(declare-fun mapRes!48940 () Bool)

(assert (=> mapIsEmpty!48940 mapRes!48940))

(declare-fun b!1249980 () Bool)

(declare-fun e!709435 () Bool)

(declare-fun e!709438 () Bool)

(assert (=> b!1249980 (= e!709435 (and e!709438 mapRes!48940))))

(declare-fun condMapEmpty!48940 () Bool)

(declare-datatypes ((V!47303 0))(
  ( (V!47304 (val!15789 Int)) )
))
(declare-datatypes ((ValueCell!14963 0))(
  ( (ValueCellFull!14963 (v!18481 V!47303)) (EmptyCell!14963) )
))
(declare-datatypes ((array!80629 0))(
  ( (array!80630 (arr!38877 (Array (_ BitVec 32) ValueCell!14963)) (size!39414 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80629)

(declare-fun mapDefault!48940 () ValueCell!14963)

(assert (=> b!1249980 (= condMapEmpty!48940 (= (arr!38877 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14963)) mapDefault!48940)))))

(declare-fun b!1249981 () Bool)

(declare-fun res!833550 () Bool)

(declare-fun e!709436 () Bool)

(assert (=> b!1249981 (=> (not res!833550) (not e!709436))))

(declare-datatypes ((array!80631 0))(
  ( (array!80632 (arr!38878 (Array (_ BitVec 32) (_ BitVec 64))) (size!39415 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80631)

(declare-datatypes ((List!27614 0))(
  ( (Nil!27611) (Cons!27610 (h!28828 (_ BitVec 64)) (t!41077 List!27614)) )
))
(declare-fun arrayNoDuplicates!0 (array!80631 (_ BitVec 32) List!27614) Bool)

(assert (=> b!1249981 (= res!833550 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27611))))

(declare-fun res!833551 () Bool)

(assert (=> start!104970 (=> (not res!833551) (not e!709436))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104970 (= res!833551 (validMask!0 mask!1466))))

(assert (=> start!104970 e!709436))

(assert (=> start!104970 true))

(assert (=> start!104970 tp!93142))

(declare-fun tp_is_empty!31453 () Bool)

(assert (=> start!104970 tp_is_empty!31453))

(declare-fun array_inv!29781 (array!80631) Bool)

(assert (=> start!104970 (array_inv!29781 _keys!1118)))

(declare-fun array_inv!29782 (array!80629) Bool)

(assert (=> start!104970 (and (array_inv!29782 _values!914) e!709435)))

(declare-fun b!1249982 () Bool)

(assert (=> b!1249982 (= e!709438 tp_is_empty!31453)))

(declare-fun b!1249983 () Bool)

(assert (=> b!1249983 (= e!709436 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47303)

(declare-datatypes ((tuple2!20358 0))(
  ( (tuple2!20359 (_1!10190 (_ BitVec 64)) (_2!10190 V!47303)) )
))
(declare-datatypes ((List!27615 0))(
  ( (Nil!27612) (Cons!27611 (h!28829 tuple2!20358) (t!41078 List!27615)) )
))
(declare-datatypes ((ListLongMap!18239 0))(
  ( (ListLongMap!18240 (toList!9135 List!27615)) )
))
(declare-fun lt!563966 () ListLongMap!18239)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47303)

(declare-fun getCurrentListMapNoExtraKeys!5570 (array!80631 array!80629 (_ BitVec 32) (_ BitVec 32) V!47303 V!47303 (_ BitVec 32) Int) ListLongMap!18239)

(assert (=> b!1249983 (= lt!563966 (getCurrentListMapNoExtraKeys!5570 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563965 () ListLongMap!18239)

(declare-fun minValueBefore!43 () V!47303)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1249983 (= lt!563965 (getCurrentListMapNoExtraKeys!5570 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48940 () Bool)

(declare-fun tp!93143 () Bool)

(declare-fun e!709439 () Bool)

(assert (=> mapNonEmpty!48940 (= mapRes!48940 (and tp!93143 e!709439))))

(declare-fun mapValue!48940 () ValueCell!14963)

(declare-fun mapKey!48940 () (_ BitVec 32))

(declare-fun mapRest!48940 () (Array (_ BitVec 32) ValueCell!14963))

(assert (=> mapNonEmpty!48940 (= (arr!38877 _values!914) (store mapRest!48940 mapKey!48940 mapValue!48940))))

(declare-fun b!1249984 () Bool)

(declare-fun res!833549 () Bool)

(assert (=> b!1249984 (=> (not res!833549) (not e!709436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80631 (_ BitVec 32)) Bool)

(assert (=> b!1249984 (= res!833549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249985 () Bool)

(declare-fun res!833548 () Bool)

(assert (=> b!1249985 (=> (not res!833548) (not e!709436))))

(assert (=> b!1249985 (= res!833548 (and (= (size!39414 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39415 _keys!1118) (size!39414 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249986 () Bool)

(assert (=> b!1249986 (= e!709439 tp_is_empty!31453)))

(assert (= (and start!104970 res!833551) b!1249985))

(assert (= (and b!1249985 res!833548) b!1249984))

(assert (= (and b!1249984 res!833549) b!1249981))

(assert (= (and b!1249981 res!833550) b!1249983))

(assert (= (and b!1249980 condMapEmpty!48940) mapIsEmpty!48940))

(assert (= (and b!1249980 (not condMapEmpty!48940)) mapNonEmpty!48940))

(get-info :version)

(assert (= (and mapNonEmpty!48940 ((_ is ValueCellFull!14963) mapValue!48940)) b!1249986))

(assert (= (and b!1249980 ((_ is ValueCellFull!14963) mapDefault!48940)) b!1249982))

(assert (= start!104970 b!1249980))

(declare-fun m!1151379 () Bool)

(assert (=> b!1249981 m!1151379))

(declare-fun m!1151381 () Bool)

(assert (=> b!1249983 m!1151381))

(declare-fun m!1151383 () Bool)

(assert (=> b!1249983 m!1151383))

(declare-fun m!1151385 () Bool)

(assert (=> b!1249984 m!1151385))

(declare-fun m!1151387 () Bool)

(assert (=> mapNonEmpty!48940 m!1151387))

(declare-fun m!1151389 () Bool)

(assert (=> start!104970 m!1151389))

(declare-fun m!1151391 () Bool)

(assert (=> start!104970 m!1151391))

(declare-fun m!1151393 () Bool)

(assert (=> start!104970 m!1151393))

(check-sat (not b!1249981) (not mapNonEmpty!48940) tp_is_empty!31453 (not start!104970) (not b!1249983) (not b!1249984) b_and!44321 (not b_next!26551))
(check-sat b_and!44321 (not b_next!26551))
