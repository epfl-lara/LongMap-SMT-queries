; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106098 () Bool)

(assert start!106098)

(declare-fun b_free!27415 () Bool)

(declare-fun b_next!27415 () Bool)

(assert (=> start!106098 (= b_free!27415 (not b_next!27415))))

(declare-fun tp!95776 () Bool)

(declare-fun b_and!45325 () Bool)

(assert (=> start!106098 (= tp!95776 b_and!45325)))

(declare-fun b!1262410 () Bool)

(declare-fun e!718557 () Bool)

(declare-fun tp_is_empty!32317 () Bool)

(assert (=> b!1262410 (= e!718557 tp_is_empty!32317)))

(declare-fun b!1262411 () Bool)

(declare-fun e!718554 () Bool)

(assert (=> b!1262411 (= e!718554 tp_is_empty!32317)))

(declare-fun b!1262412 () Bool)

(declare-fun res!840902 () Bool)

(declare-fun e!718556 () Bool)

(assert (=> b!1262412 (=> (not res!840902) (not e!718556))))

(declare-datatypes ((array!82295 0))(
  ( (array!82296 (arr!39696 (Array (_ BitVec 32) (_ BitVec 64))) (size!40233 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82295)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82295 (_ BitVec 32)) Bool)

(assert (=> b!1262412 (= res!840902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50278 () Bool)

(declare-fun mapRes!50278 () Bool)

(declare-fun tp!95777 () Bool)

(assert (=> mapNonEmpty!50278 (= mapRes!50278 (and tp!95777 e!718557))))

(declare-fun mapKey!50278 () (_ BitVec 32))

(declare-datatypes ((V!48455 0))(
  ( (V!48456 (val!16221 Int)) )
))
(declare-datatypes ((ValueCell!15395 0))(
  ( (ValueCellFull!15395 (v!18921 V!48455)) (EmptyCell!15395) )
))
(declare-fun mapRest!50278 () (Array (_ BitVec 32) ValueCell!15395))

(declare-fun mapValue!50278 () ValueCell!15395)

(declare-datatypes ((array!82297 0))(
  ( (array!82298 (arr!39697 (Array (_ BitVec 32) ValueCell!15395)) (size!40234 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82297)

(assert (=> mapNonEmpty!50278 (= (arr!39697 _values!914) (store mapRest!50278 mapKey!50278 mapValue!50278))))

(declare-fun res!840903 () Bool)

(assert (=> start!106098 (=> (not res!840903) (not e!718556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106098 (= res!840903 (validMask!0 mask!1466))))

(assert (=> start!106098 e!718556))

(assert (=> start!106098 true))

(assert (=> start!106098 tp!95776))

(assert (=> start!106098 tp_is_empty!32317))

(declare-fun array_inv!30369 (array!82295) Bool)

(assert (=> start!106098 (array_inv!30369 _keys!1118)))

(declare-fun e!718555 () Bool)

(declare-fun array_inv!30370 (array!82297) Bool)

(assert (=> start!106098 (and (array_inv!30370 _values!914) e!718555)))

(declare-fun b!1262413 () Bool)

(declare-fun res!840904 () Bool)

(assert (=> b!1262413 (=> (not res!840904) (not e!718556))))

(declare-datatypes ((List!28223 0))(
  ( (Nil!28220) (Cons!28219 (h!29437 (_ BitVec 64)) (t!41714 List!28223)) )
))
(declare-fun arrayNoDuplicates!0 (array!82295 (_ BitVec 32) List!28223) Bool)

(assert (=> b!1262413 (= res!840904 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28220))))

(declare-fun b!1262414 () Bool)

(assert (=> b!1262414 (= e!718556 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48455)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48455)

(declare-datatypes ((tuple2!21000 0))(
  ( (tuple2!21001 (_1!10511 (_ BitVec 64)) (_2!10511 V!48455)) )
))
(declare-datatypes ((List!28224 0))(
  ( (Nil!28221) (Cons!28220 (h!29438 tuple2!21000) (t!41715 List!28224)) )
))
(declare-datatypes ((ListLongMap!18881 0))(
  ( (ListLongMap!18882 (toList!9456 List!28224)) )
))
(declare-fun lt!572017 () ListLongMap!18881)

(declare-fun getCurrentListMapNoExtraKeys!5862 (array!82295 array!82297 (_ BitVec 32) (_ BitVec 32) V!48455 V!48455 (_ BitVec 32) Int) ListLongMap!18881)

(assert (=> b!1262414 (= lt!572017 (getCurrentListMapNoExtraKeys!5862 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572016 () ListLongMap!18881)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48455)

(assert (=> b!1262414 (= lt!572016 (getCurrentListMapNoExtraKeys!5862 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262415 () Bool)

(declare-fun res!840905 () Bool)

(assert (=> b!1262415 (=> (not res!840905) (not e!718556))))

(assert (=> b!1262415 (= res!840905 (and (= (size!40234 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40233 _keys!1118) (size!40234 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262416 () Bool)

(assert (=> b!1262416 (= e!718555 (and e!718554 mapRes!50278))))

(declare-fun condMapEmpty!50278 () Bool)

(declare-fun mapDefault!50278 () ValueCell!15395)

(assert (=> b!1262416 (= condMapEmpty!50278 (= (arr!39697 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15395)) mapDefault!50278)))))

(declare-fun mapIsEmpty!50278 () Bool)

(assert (=> mapIsEmpty!50278 mapRes!50278))

(assert (= (and start!106098 res!840903) b!1262415))

(assert (= (and b!1262415 res!840905) b!1262412))

(assert (= (and b!1262412 res!840902) b!1262413))

(assert (= (and b!1262413 res!840904) b!1262414))

(assert (= (and b!1262416 condMapEmpty!50278) mapIsEmpty!50278))

(assert (= (and b!1262416 (not condMapEmpty!50278)) mapNonEmpty!50278))

(get-info :version)

(assert (= (and mapNonEmpty!50278 ((_ is ValueCellFull!15395) mapValue!50278)) b!1262410))

(assert (= (and b!1262416 ((_ is ValueCellFull!15395) mapDefault!50278)) b!1262411))

(assert (= start!106098 b!1262416))

(declare-fun m!1163421 () Bool)

(assert (=> start!106098 m!1163421))

(declare-fun m!1163423 () Bool)

(assert (=> start!106098 m!1163423))

(declare-fun m!1163425 () Bool)

(assert (=> start!106098 m!1163425))

(declare-fun m!1163427 () Bool)

(assert (=> b!1262413 m!1163427))

(declare-fun m!1163429 () Bool)

(assert (=> mapNonEmpty!50278 m!1163429))

(declare-fun m!1163431 () Bool)

(assert (=> b!1262414 m!1163431))

(declare-fun m!1163433 () Bool)

(assert (=> b!1262414 m!1163433))

(declare-fun m!1163435 () Bool)

(assert (=> b!1262412 m!1163435))

(check-sat (not b!1262412) (not b!1262414) (not mapNonEmpty!50278) b_and!45325 tp_is_empty!32317 (not b_next!27415) (not start!106098) (not b!1262413))
(check-sat b_and!45325 (not b_next!27415))
