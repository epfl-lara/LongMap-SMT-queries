; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104688 () Bool)

(assert start!104688)

(declare-fun b_free!26505 () Bool)

(declare-fun b_next!26505 () Bool)

(assert (=> start!104688 (= b_free!26505 (not b_next!26505))))

(declare-fun tp!93001 () Bool)

(declare-fun b_and!44269 () Bool)

(assert (=> start!104688 (= tp!93001 b_and!44269)))

(declare-fun b!1248119 () Bool)

(declare-fun e!708199 () Bool)

(declare-fun tp_is_empty!31407 () Bool)

(assert (=> b!1248119 (= e!708199 tp_is_empty!31407)))

(declare-fun b!1248120 () Bool)

(declare-fun res!832725 () Bool)

(declare-fun e!708197 () Bool)

(assert (=> b!1248120 (=> (not res!832725) (not e!708197))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80506 0))(
  ( (array!80507 (arr!38821 (Array (_ BitVec 32) (_ BitVec 64))) (size!39357 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80506)

(declare-datatypes ((V!47241 0))(
  ( (V!47242 (val!15766 Int)) )
))
(declare-datatypes ((ValueCell!14940 0))(
  ( (ValueCellFull!14940 (v!18462 V!47241)) (EmptyCell!14940) )
))
(declare-datatypes ((array!80508 0))(
  ( (array!80509 (arr!38822 (Array (_ BitVec 32) ValueCell!14940)) (size!39358 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80508)

(assert (=> b!1248120 (= res!832725 (and (= (size!39358 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39357 _keys!1118) (size!39358 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248121 () Bool)

(declare-fun res!832728 () Bool)

(assert (=> b!1248121 (=> (not res!832728) (not e!708197))))

(declare-datatypes ((List!27554 0))(
  ( (Nil!27551) (Cons!27550 (h!28759 (_ BitVec 64)) (t!41023 List!27554)) )
))
(declare-fun arrayNoDuplicates!0 (array!80506 (_ BitVec 32) List!27554) Bool)

(assert (=> b!1248121 (= res!832728 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27551))))

(declare-fun b!1248122 () Bool)

(assert (=> b!1248122 (= e!708197 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20306 0))(
  ( (tuple2!20307 (_1!10164 (_ BitVec 64)) (_2!10164 V!47241)) )
))
(declare-datatypes ((List!27555 0))(
  ( (Nil!27552) (Cons!27551 (h!28760 tuple2!20306) (t!41024 List!27555)) )
))
(declare-datatypes ((ListLongMap!18179 0))(
  ( (ListLongMap!18180 (toList!9105 List!27555)) )
))
(declare-fun lt!563362 () ListLongMap!18179)

(declare-fun zeroValue!871 () V!47241)

(declare-fun minValueBefore!43 () V!47241)

(declare-fun getCurrentListMapNoExtraKeys!5512 (array!80506 array!80508 (_ BitVec 32) (_ BitVec 32) V!47241 V!47241 (_ BitVec 32) Int) ListLongMap!18179)

(assert (=> b!1248122 (= lt!563362 (getCurrentListMapNoExtraKeys!5512 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248123 () Bool)

(declare-fun e!708198 () Bool)

(assert (=> b!1248123 (= e!708198 tp_is_empty!31407)))

(declare-fun res!832727 () Bool)

(assert (=> start!104688 (=> (not res!832727) (not e!708197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104688 (= res!832727 (validMask!0 mask!1466))))

(assert (=> start!104688 e!708197))

(assert (=> start!104688 true))

(assert (=> start!104688 tp!93001))

(assert (=> start!104688 tp_is_empty!31407))

(declare-fun array_inv!29633 (array!80506) Bool)

(assert (=> start!104688 (array_inv!29633 _keys!1118)))

(declare-fun e!708195 () Bool)

(declare-fun array_inv!29634 (array!80508) Bool)

(assert (=> start!104688 (and (array_inv!29634 _values!914) e!708195)))

(declare-fun mapNonEmpty!48868 () Bool)

(declare-fun mapRes!48868 () Bool)

(declare-fun tp!93002 () Bool)

(assert (=> mapNonEmpty!48868 (= mapRes!48868 (and tp!93002 e!708199))))

(declare-fun mapValue!48868 () ValueCell!14940)

(declare-fun mapRest!48868 () (Array (_ BitVec 32) ValueCell!14940))

(declare-fun mapKey!48868 () (_ BitVec 32))

(assert (=> mapNonEmpty!48868 (= (arr!38822 _values!914) (store mapRest!48868 mapKey!48868 mapValue!48868))))

(declare-fun mapIsEmpty!48868 () Bool)

(assert (=> mapIsEmpty!48868 mapRes!48868))

(declare-fun b!1248124 () Bool)

(assert (=> b!1248124 (= e!708195 (and e!708198 mapRes!48868))))

(declare-fun condMapEmpty!48868 () Bool)

(declare-fun mapDefault!48868 () ValueCell!14940)

(assert (=> b!1248124 (= condMapEmpty!48868 (= (arr!38822 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14940)) mapDefault!48868)))))

(declare-fun b!1248125 () Bool)

(declare-fun res!832726 () Bool)

(assert (=> b!1248125 (=> (not res!832726) (not e!708197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80506 (_ BitVec 32)) Bool)

(assert (=> b!1248125 (= res!832726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104688 res!832727) b!1248120))

(assert (= (and b!1248120 res!832725) b!1248125))

(assert (= (and b!1248125 res!832726) b!1248121))

(assert (= (and b!1248121 res!832728) b!1248122))

(assert (= (and b!1248124 condMapEmpty!48868) mapIsEmpty!48868))

(assert (= (and b!1248124 (not condMapEmpty!48868)) mapNonEmpty!48868))

(get-info :version)

(assert (= (and mapNonEmpty!48868 ((_ is ValueCellFull!14940) mapValue!48868)) b!1248119))

(assert (= (and b!1248124 ((_ is ValueCellFull!14940) mapDefault!48868)) b!1248123))

(assert (= start!104688 b!1248124))

(declare-fun m!1149389 () Bool)

(assert (=> b!1248121 m!1149389))

(declare-fun m!1149391 () Bool)

(assert (=> b!1248122 m!1149391))

(declare-fun m!1149393 () Bool)

(assert (=> start!104688 m!1149393))

(declare-fun m!1149395 () Bool)

(assert (=> start!104688 m!1149395))

(declare-fun m!1149397 () Bool)

(assert (=> start!104688 m!1149397))

(declare-fun m!1149399 () Bool)

(assert (=> mapNonEmpty!48868 m!1149399))

(declare-fun m!1149401 () Bool)

(assert (=> b!1248125 m!1149401))

(check-sat tp_is_empty!31407 (not b!1248122) (not start!104688) b_and!44269 (not mapNonEmpty!48868) (not b_next!26505) (not b!1248121) (not b!1248125))
(check-sat b_and!44269 (not b_next!26505))
