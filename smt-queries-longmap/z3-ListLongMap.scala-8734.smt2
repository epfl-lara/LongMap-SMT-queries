; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106122 () Bool)

(assert start!106122)

(declare-fun b_free!27439 () Bool)

(declare-fun b_next!27439 () Bool)

(assert (=> start!106122 (= b_free!27439 (not b_next!27439))))

(declare-fun tp!95849 () Bool)

(declare-fun b_and!45349 () Bool)

(assert (=> start!106122 (= tp!95849 b_and!45349)))

(declare-fun b!1262662 () Bool)

(declare-fun res!841046 () Bool)

(declare-fun e!718733 () Bool)

(assert (=> b!1262662 (=> (not res!841046) (not e!718733))))

(declare-datatypes ((array!82343 0))(
  ( (array!82344 (arr!39720 (Array (_ BitVec 32) (_ BitVec 64))) (size!40257 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82343)

(declare-datatypes ((List!28243 0))(
  ( (Nil!28240) (Cons!28239 (h!29457 (_ BitVec 64)) (t!41734 List!28243)) )
))
(declare-fun arrayNoDuplicates!0 (array!82343 (_ BitVec 32) List!28243) Bool)

(assert (=> b!1262662 (= res!841046 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28240))))

(declare-fun b!1262663 () Bool)

(assert (=> b!1262663 (= e!718733 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48487 0))(
  ( (V!48488 (val!16233 Int)) )
))
(declare-fun minValueAfter!43 () V!48487)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15407 0))(
  ( (ValueCellFull!15407 (v!18933 V!48487)) (EmptyCell!15407) )
))
(declare-datatypes ((array!82345 0))(
  ( (array!82346 (arr!39721 (Array (_ BitVec 32) ValueCell!15407)) (size!40258 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82345)

(declare-datatypes ((tuple2!21020 0))(
  ( (tuple2!21021 (_1!10521 (_ BitVec 64)) (_2!10521 V!48487)) )
))
(declare-datatypes ((List!28244 0))(
  ( (Nil!28241) (Cons!28240 (h!29458 tuple2!21020) (t!41735 List!28244)) )
))
(declare-datatypes ((ListLongMap!18901 0))(
  ( (ListLongMap!18902 (toList!9466 List!28244)) )
))
(declare-fun lt!572088 () ListLongMap!18901)

(declare-fun zeroValue!871 () V!48487)

(declare-fun getCurrentListMapNoExtraKeys!5872 (array!82343 array!82345 (_ BitVec 32) (_ BitVec 32) V!48487 V!48487 (_ BitVec 32) Int) ListLongMap!18901)

(assert (=> b!1262663 (= lt!572088 (getCurrentListMapNoExtraKeys!5872 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48487)

(declare-fun lt!572089 () ListLongMap!18901)

(assert (=> b!1262663 (= lt!572089 (getCurrentListMapNoExtraKeys!5872 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262664 () Bool)

(declare-fun res!841047 () Bool)

(assert (=> b!1262664 (=> (not res!841047) (not e!718733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82343 (_ BitVec 32)) Bool)

(assert (=> b!1262664 (= res!841047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262665 () Bool)

(declare-fun e!718734 () Bool)

(declare-fun tp_is_empty!32341 () Bool)

(assert (=> b!1262665 (= e!718734 tp_is_empty!32341)))

(declare-fun b!1262666 () Bool)

(declare-fun res!841048 () Bool)

(assert (=> b!1262666 (=> (not res!841048) (not e!718733))))

(assert (=> b!1262666 (= res!841048 (and (= (size!40258 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40257 _keys!1118) (size!40258 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262667 () Bool)

(declare-fun e!718737 () Bool)

(assert (=> b!1262667 (= e!718737 tp_is_empty!32341)))

(declare-fun mapNonEmpty!50314 () Bool)

(declare-fun mapRes!50314 () Bool)

(declare-fun tp!95848 () Bool)

(assert (=> mapNonEmpty!50314 (= mapRes!50314 (and tp!95848 e!718734))))

(declare-fun mapRest!50314 () (Array (_ BitVec 32) ValueCell!15407))

(declare-fun mapKey!50314 () (_ BitVec 32))

(declare-fun mapValue!50314 () ValueCell!15407)

(assert (=> mapNonEmpty!50314 (= (arr!39721 _values!914) (store mapRest!50314 mapKey!50314 mapValue!50314))))

(declare-fun b!1262668 () Bool)

(declare-fun e!718735 () Bool)

(assert (=> b!1262668 (= e!718735 (and e!718737 mapRes!50314))))

(declare-fun condMapEmpty!50314 () Bool)

(declare-fun mapDefault!50314 () ValueCell!15407)

(assert (=> b!1262668 (= condMapEmpty!50314 (= (arr!39721 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15407)) mapDefault!50314)))))

(declare-fun res!841049 () Bool)

(assert (=> start!106122 (=> (not res!841049) (not e!718733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106122 (= res!841049 (validMask!0 mask!1466))))

(assert (=> start!106122 e!718733))

(assert (=> start!106122 true))

(assert (=> start!106122 tp!95849))

(assert (=> start!106122 tp_is_empty!32341))

(declare-fun array_inv!30387 (array!82343) Bool)

(assert (=> start!106122 (array_inv!30387 _keys!1118)))

(declare-fun array_inv!30388 (array!82345) Bool)

(assert (=> start!106122 (and (array_inv!30388 _values!914) e!718735)))

(declare-fun mapIsEmpty!50314 () Bool)

(assert (=> mapIsEmpty!50314 mapRes!50314))

(assert (= (and start!106122 res!841049) b!1262666))

(assert (= (and b!1262666 res!841048) b!1262664))

(assert (= (and b!1262664 res!841047) b!1262662))

(assert (= (and b!1262662 res!841046) b!1262663))

(assert (= (and b!1262668 condMapEmpty!50314) mapIsEmpty!50314))

(assert (= (and b!1262668 (not condMapEmpty!50314)) mapNonEmpty!50314))

(get-info :version)

(assert (= (and mapNonEmpty!50314 ((_ is ValueCellFull!15407) mapValue!50314)) b!1262665))

(assert (= (and b!1262668 ((_ is ValueCellFull!15407) mapDefault!50314)) b!1262667))

(assert (= start!106122 b!1262668))

(declare-fun m!1163613 () Bool)

(assert (=> b!1262664 m!1163613))

(declare-fun m!1163615 () Bool)

(assert (=> start!106122 m!1163615))

(declare-fun m!1163617 () Bool)

(assert (=> start!106122 m!1163617))

(declare-fun m!1163619 () Bool)

(assert (=> start!106122 m!1163619))

(declare-fun m!1163621 () Bool)

(assert (=> b!1262663 m!1163621))

(declare-fun m!1163623 () Bool)

(assert (=> b!1262663 m!1163623))

(declare-fun m!1163625 () Bool)

(assert (=> mapNonEmpty!50314 m!1163625))

(declare-fun m!1163627 () Bool)

(assert (=> b!1262662 m!1163627))

(check-sat b_and!45349 (not b_next!27439) (not b!1262663) (not b!1262662) tp_is_empty!32341 (not mapNonEmpty!50314) (not b!1262664) (not start!106122))
(check-sat b_and!45349 (not b_next!27439))
