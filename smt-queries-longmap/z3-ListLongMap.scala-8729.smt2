; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106092 () Bool)

(assert start!106092)

(declare-fun b_free!27409 () Bool)

(declare-fun b_next!27409 () Bool)

(assert (=> start!106092 (= b_free!27409 (not b_next!27409))))

(declare-fun tp!95759 () Bool)

(declare-fun b_and!45319 () Bool)

(assert (=> start!106092 (= tp!95759 b_and!45319)))

(declare-fun b!1262347 () Bool)

(declare-fun res!840867 () Bool)

(declare-fun e!718512 () Bool)

(assert (=> b!1262347 (=> (not res!840867) (not e!718512))))

(declare-datatypes ((array!82285 0))(
  ( (array!82286 (arr!39691 (Array (_ BitVec 32) (_ BitVec 64))) (size!40228 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82285)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82285 (_ BitVec 32)) Bool)

(assert (=> b!1262347 (= res!840867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262348 () Bool)

(declare-fun res!840869 () Bool)

(assert (=> b!1262348 (=> (not res!840869) (not e!718512))))

(declare-datatypes ((List!28219 0))(
  ( (Nil!28216) (Cons!28215 (h!29433 (_ BitVec 64)) (t!41710 List!28219)) )
))
(declare-fun arrayNoDuplicates!0 (array!82285 (_ BitVec 32) List!28219) Bool)

(assert (=> b!1262348 (= res!840869 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28216))))

(declare-fun res!840868 () Bool)

(assert (=> start!106092 (=> (not res!840868) (not e!718512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106092 (= res!840868 (validMask!0 mask!1466))))

(assert (=> start!106092 e!718512))

(assert (=> start!106092 true))

(assert (=> start!106092 tp!95759))

(declare-fun tp_is_empty!32311 () Bool)

(assert (=> start!106092 tp_is_empty!32311))

(declare-fun array_inv!30365 (array!82285) Bool)

(assert (=> start!106092 (array_inv!30365 _keys!1118)))

(declare-datatypes ((V!48447 0))(
  ( (V!48448 (val!16218 Int)) )
))
(declare-datatypes ((ValueCell!15392 0))(
  ( (ValueCellFull!15392 (v!18918 V!48447)) (EmptyCell!15392) )
))
(declare-datatypes ((array!82287 0))(
  ( (array!82288 (arr!39692 (Array (_ BitVec 32) ValueCell!15392)) (size!40229 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82287)

(declare-fun e!718510 () Bool)

(declare-fun array_inv!30366 (array!82287) Bool)

(assert (=> start!106092 (and (array_inv!30366 _values!914) e!718510)))

(declare-fun b!1262349 () Bool)

(declare-fun e!718509 () Bool)

(assert (=> b!1262349 (= e!718509 tp_is_empty!32311)))

(declare-fun mapNonEmpty!50269 () Bool)

(declare-fun mapRes!50269 () Bool)

(declare-fun tp!95758 () Bool)

(assert (=> mapNonEmpty!50269 (= mapRes!50269 (and tp!95758 e!718509))))

(declare-fun mapValue!50269 () ValueCell!15392)

(declare-fun mapRest!50269 () (Array (_ BitVec 32) ValueCell!15392))

(declare-fun mapKey!50269 () (_ BitVec 32))

(assert (=> mapNonEmpty!50269 (= (arr!39692 _values!914) (store mapRest!50269 mapKey!50269 mapValue!50269))))

(declare-fun b!1262350 () Bool)

(declare-fun res!840866 () Bool)

(assert (=> b!1262350 (=> (not res!840866) (not e!718512))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1262350 (= res!840866 (and (= (size!40229 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40228 _keys!1118) (size!40229 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262351 () Bool)

(assert (=> b!1262351 (= e!718512 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48447)

(declare-fun zeroValue!871 () V!48447)

(declare-datatypes ((tuple2!20996 0))(
  ( (tuple2!20997 (_1!10509 (_ BitVec 64)) (_2!10509 V!48447)) )
))
(declare-datatypes ((List!28220 0))(
  ( (Nil!28217) (Cons!28216 (h!29434 tuple2!20996) (t!41711 List!28220)) )
))
(declare-datatypes ((ListLongMap!18877 0))(
  ( (ListLongMap!18878 (toList!9454 List!28220)) )
))
(declare-fun lt!571998 () ListLongMap!18877)

(declare-fun getCurrentListMapNoExtraKeys!5860 (array!82285 array!82287 (_ BitVec 32) (_ BitVec 32) V!48447 V!48447 (_ BitVec 32) Int) ListLongMap!18877)

(assert (=> b!1262351 (= lt!571998 (getCurrentListMapNoExtraKeys!5860 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48447)

(declare-fun lt!571999 () ListLongMap!18877)

(assert (=> b!1262351 (= lt!571999 (getCurrentListMapNoExtraKeys!5860 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50269 () Bool)

(assert (=> mapIsEmpty!50269 mapRes!50269))

(declare-fun b!1262352 () Bool)

(declare-fun e!718508 () Bool)

(assert (=> b!1262352 (= e!718510 (and e!718508 mapRes!50269))))

(declare-fun condMapEmpty!50269 () Bool)

(declare-fun mapDefault!50269 () ValueCell!15392)

(assert (=> b!1262352 (= condMapEmpty!50269 (= (arr!39692 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15392)) mapDefault!50269)))))

(declare-fun b!1262353 () Bool)

(assert (=> b!1262353 (= e!718508 tp_is_empty!32311)))

(assert (= (and start!106092 res!840868) b!1262350))

(assert (= (and b!1262350 res!840866) b!1262347))

(assert (= (and b!1262347 res!840867) b!1262348))

(assert (= (and b!1262348 res!840869) b!1262351))

(assert (= (and b!1262352 condMapEmpty!50269) mapIsEmpty!50269))

(assert (= (and b!1262352 (not condMapEmpty!50269)) mapNonEmpty!50269))

(get-info :version)

(assert (= (and mapNonEmpty!50269 ((_ is ValueCellFull!15392) mapValue!50269)) b!1262349))

(assert (= (and b!1262352 ((_ is ValueCellFull!15392) mapDefault!50269)) b!1262353))

(assert (= start!106092 b!1262352))

(declare-fun m!1163373 () Bool)

(assert (=> b!1262351 m!1163373))

(declare-fun m!1163375 () Bool)

(assert (=> b!1262351 m!1163375))

(declare-fun m!1163377 () Bool)

(assert (=> b!1262347 m!1163377))

(declare-fun m!1163379 () Bool)

(assert (=> b!1262348 m!1163379))

(declare-fun m!1163381 () Bool)

(assert (=> mapNonEmpty!50269 m!1163381))

(declare-fun m!1163383 () Bool)

(assert (=> start!106092 m!1163383))

(declare-fun m!1163385 () Bool)

(assert (=> start!106092 m!1163385))

(declare-fun m!1163387 () Bool)

(assert (=> start!106092 m!1163387))

(check-sat (not start!106092) (not b_next!27409) tp_is_empty!32311 (not mapNonEmpty!50269) (not b!1262351) b_and!45319 (not b!1262348) (not b!1262347))
(check-sat b_and!45319 (not b_next!27409))
