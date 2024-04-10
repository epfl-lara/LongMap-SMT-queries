; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105900 () Bool)

(assert start!105900)

(declare-fun b_free!27441 () Bool)

(declare-fun b_next!27441 () Bool)

(assert (=> start!105900 (= b_free!27441 (not b_next!27441))))

(declare-fun tp!95855 () Bool)

(declare-fun b_and!45349 () Bool)

(assert (=> start!105900 (= tp!95855 b_and!45349)))

(declare-fun mapNonEmpty!50317 () Bool)

(declare-fun mapRes!50317 () Bool)

(declare-fun tp!95854 () Bool)

(declare-fun e!717901 () Bool)

(assert (=> mapNonEmpty!50317 (= mapRes!50317 (and tp!95854 e!717901))))

(declare-datatypes ((V!48489 0))(
  ( (V!48490 (val!16234 Int)) )
))
(declare-datatypes ((ValueCell!15408 0))(
  ( (ValueCellFull!15408 (v!18938 V!48489)) (EmptyCell!15408) )
))
(declare-fun mapValue!50317 () ValueCell!15408)

(declare-fun mapRest!50317 () (Array (_ BitVec 32) ValueCell!15408))

(declare-datatypes ((array!82300 0))(
  ( (array!82301 (arr!39703 (Array (_ BitVec 32) ValueCell!15408)) (size!40239 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82300)

(declare-fun mapKey!50317 () (_ BitVec 32))

(assert (=> mapNonEmpty!50317 (= (arr!39703 _values!914) (store mapRest!50317 mapKey!50317 mapValue!50317))))

(declare-fun res!840541 () Bool)

(declare-fun e!717905 () Bool)

(assert (=> start!105900 (=> (not res!840541) (not e!717905))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105900 (= res!840541 (validMask!0 mask!1466))))

(assert (=> start!105900 e!717905))

(assert (=> start!105900 true))

(assert (=> start!105900 tp!95855))

(declare-fun tp_is_empty!32343 () Bool)

(assert (=> start!105900 tp_is_empty!32343))

(declare-datatypes ((array!82302 0))(
  ( (array!82303 (arr!39704 (Array (_ BitVec 32) (_ BitVec 64))) (size!40240 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82302)

(declare-fun array_inv!30229 (array!82302) Bool)

(assert (=> start!105900 (array_inv!30229 _keys!1118)))

(declare-fun e!717903 () Bool)

(declare-fun array_inv!30230 (array!82300) Bool)

(assert (=> start!105900 (and (array_inv!30230 _values!914) e!717903)))

(declare-fun b!1261378 () Bool)

(assert (=> b!1261378 (= e!717901 tp_is_empty!32343)))

(declare-fun b!1261379 () Bool)

(declare-fun res!840539 () Bool)

(assert (=> b!1261379 (=> (not res!840539) (not e!717905))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1261379 (= res!840539 (and (= (size!40239 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40240 _keys!1118) (size!40239 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261380 () Bool)

(assert (=> b!1261380 (= e!717905 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!21010 0))(
  ( (tuple2!21011 (_1!10516 (_ BitVec 64)) (_2!10516 V!48489)) )
))
(declare-datatypes ((List!28206 0))(
  ( (Nil!28203) (Cons!28202 (h!29411 tuple2!21010) (t!41705 List!28206)) )
))
(declare-datatypes ((ListLongMap!18883 0))(
  ( (ListLongMap!18884 (toList!9457 List!28206)) )
))
(declare-fun lt!571610 () ListLongMap!18883)

(declare-fun minValueAfter!43 () V!48489)

(declare-fun zeroValue!871 () V!48489)

(declare-fun getCurrentListMapNoExtraKeys!5825 (array!82302 array!82300 (_ BitVec 32) (_ BitVec 32) V!48489 V!48489 (_ BitVec 32) Int) ListLongMap!18883)

(assert (=> b!1261380 (= lt!571610 (getCurrentListMapNoExtraKeys!5825 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571611 () ListLongMap!18883)

(declare-fun minValueBefore!43 () V!48489)

(assert (=> b!1261380 (= lt!571611 (getCurrentListMapNoExtraKeys!5825 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261381 () Bool)

(declare-fun res!840538 () Bool)

(assert (=> b!1261381 (=> (not res!840538) (not e!717905))))

(declare-datatypes ((List!28207 0))(
  ( (Nil!28204) (Cons!28203 (h!29412 (_ BitVec 64)) (t!41706 List!28207)) )
))
(declare-fun arrayNoDuplicates!0 (array!82302 (_ BitVec 32) List!28207) Bool)

(assert (=> b!1261381 (= res!840538 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28204))))

(declare-fun b!1261382 () Bool)

(declare-fun res!840540 () Bool)

(assert (=> b!1261382 (=> (not res!840540) (not e!717905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82302 (_ BitVec 32)) Bool)

(assert (=> b!1261382 (= res!840540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261383 () Bool)

(declare-fun e!717902 () Bool)

(assert (=> b!1261383 (= e!717902 tp_is_empty!32343)))

(declare-fun b!1261384 () Bool)

(assert (=> b!1261384 (= e!717903 (and e!717902 mapRes!50317))))

(declare-fun condMapEmpty!50317 () Bool)

(declare-fun mapDefault!50317 () ValueCell!15408)

(assert (=> b!1261384 (= condMapEmpty!50317 (= (arr!39703 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15408)) mapDefault!50317)))))

(declare-fun mapIsEmpty!50317 () Bool)

(assert (=> mapIsEmpty!50317 mapRes!50317))

(assert (= (and start!105900 res!840541) b!1261379))

(assert (= (and b!1261379 res!840539) b!1261382))

(assert (= (and b!1261382 res!840540) b!1261381))

(assert (= (and b!1261381 res!840538) b!1261380))

(assert (= (and b!1261384 condMapEmpty!50317) mapIsEmpty!50317))

(assert (= (and b!1261384 (not condMapEmpty!50317)) mapNonEmpty!50317))

(get-info :version)

(assert (= (and mapNonEmpty!50317 ((_ is ValueCellFull!15408) mapValue!50317)) b!1261378))

(assert (= (and b!1261384 ((_ is ValueCellFull!15408) mapDefault!50317)) b!1261383))

(assert (= start!105900 b!1261384))

(declare-fun m!1162017 () Bool)

(assert (=> b!1261380 m!1162017))

(declare-fun m!1162019 () Bool)

(assert (=> b!1261380 m!1162019))

(declare-fun m!1162021 () Bool)

(assert (=> start!105900 m!1162021))

(declare-fun m!1162023 () Bool)

(assert (=> start!105900 m!1162023))

(declare-fun m!1162025 () Bool)

(assert (=> start!105900 m!1162025))

(declare-fun m!1162027 () Bool)

(assert (=> mapNonEmpty!50317 m!1162027))

(declare-fun m!1162029 () Bool)

(assert (=> b!1261381 m!1162029))

(declare-fun m!1162031 () Bool)

(assert (=> b!1261382 m!1162031))

(check-sat (not b!1261382) b_and!45349 tp_is_empty!32343 (not mapNonEmpty!50317) (not b_next!27441) (not b!1261381) (not b!1261380) (not start!105900))
(check-sat b_and!45349 (not b_next!27441))
