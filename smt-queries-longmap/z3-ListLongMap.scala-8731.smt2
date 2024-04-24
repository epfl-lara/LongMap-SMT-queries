; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106104 () Bool)

(assert start!106104)

(declare-fun b_free!27421 () Bool)

(declare-fun b_next!27421 () Bool)

(assert (=> start!106104 (= b_free!27421 (not b_next!27421))))

(declare-fun tp!95794 () Bool)

(declare-fun b_and!45331 () Bool)

(assert (=> start!106104 (= tp!95794 b_and!45331)))

(declare-fun b!1262473 () Bool)

(declare-fun e!718602 () Bool)

(declare-fun tp_is_empty!32323 () Bool)

(assert (=> b!1262473 (= e!718602 tp_is_empty!32323)))

(declare-fun b!1262474 () Bool)

(declare-fun e!718598 () Bool)

(assert (=> b!1262474 (= e!718598 tp_is_empty!32323)))

(declare-fun b!1262475 () Bool)

(declare-fun e!718601 () Bool)

(declare-fun mapRes!50287 () Bool)

(assert (=> b!1262475 (= e!718601 (and e!718598 mapRes!50287))))

(declare-fun condMapEmpty!50287 () Bool)

(declare-datatypes ((V!48463 0))(
  ( (V!48464 (val!16224 Int)) )
))
(declare-datatypes ((ValueCell!15398 0))(
  ( (ValueCellFull!15398 (v!18924 V!48463)) (EmptyCell!15398) )
))
(declare-datatypes ((array!82307 0))(
  ( (array!82308 (arr!39702 (Array (_ BitVec 32) ValueCell!15398)) (size!40239 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82307)

(declare-fun mapDefault!50287 () ValueCell!15398)

(assert (=> b!1262475 (= condMapEmpty!50287 (= (arr!39702 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15398)) mapDefault!50287)))))

(declare-fun mapNonEmpty!50287 () Bool)

(declare-fun tp!95795 () Bool)

(assert (=> mapNonEmpty!50287 (= mapRes!50287 (and tp!95795 e!718602))))

(declare-fun mapValue!50287 () ValueCell!15398)

(declare-fun mapKey!50287 () (_ BitVec 32))

(declare-fun mapRest!50287 () (Array (_ BitVec 32) ValueCell!15398))

(assert (=> mapNonEmpty!50287 (= (arr!39702 _values!914) (store mapRest!50287 mapKey!50287 mapValue!50287))))

(declare-fun res!840941 () Bool)

(declare-fun e!718599 () Bool)

(assert (=> start!106104 (=> (not res!840941) (not e!718599))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106104 (= res!840941 (validMask!0 mask!1466))))

(assert (=> start!106104 e!718599))

(assert (=> start!106104 true))

(assert (=> start!106104 tp!95794))

(assert (=> start!106104 tp_is_empty!32323))

(declare-datatypes ((array!82309 0))(
  ( (array!82310 (arr!39703 (Array (_ BitVec 32) (_ BitVec 64))) (size!40240 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82309)

(declare-fun array_inv!30371 (array!82309) Bool)

(assert (=> start!106104 (array_inv!30371 _keys!1118)))

(declare-fun array_inv!30372 (array!82307) Bool)

(assert (=> start!106104 (and (array_inv!30372 _values!914) e!718601)))

(declare-fun b!1262476 () Bool)

(declare-fun res!840940 () Bool)

(assert (=> b!1262476 (=> (not res!840940) (not e!718599))))

(declare-datatypes ((List!28227 0))(
  ( (Nil!28224) (Cons!28223 (h!29441 (_ BitVec 64)) (t!41718 List!28227)) )
))
(declare-fun arrayNoDuplicates!0 (array!82309 (_ BitVec 32) List!28227) Bool)

(assert (=> b!1262476 (= res!840940 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28224))))

(declare-fun b!1262477 () Bool)

(assert (=> b!1262477 (= e!718599 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!21004 0))(
  ( (tuple2!21005 (_1!10513 (_ BitVec 64)) (_2!10513 V!48463)) )
))
(declare-datatypes ((List!28228 0))(
  ( (Nil!28225) (Cons!28224 (h!29442 tuple2!21004) (t!41719 List!28228)) )
))
(declare-datatypes ((ListLongMap!18885 0))(
  ( (ListLongMap!18886 (toList!9458 List!28228)) )
))
(declare-fun lt!572034 () ListLongMap!18885)

(declare-fun minValueAfter!43 () V!48463)

(declare-fun zeroValue!871 () V!48463)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5864 (array!82309 array!82307 (_ BitVec 32) (_ BitVec 32) V!48463 V!48463 (_ BitVec 32) Int) ListLongMap!18885)

(assert (=> b!1262477 (= lt!572034 (getCurrentListMapNoExtraKeys!5864 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48463)

(declare-fun lt!572035 () ListLongMap!18885)

(assert (=> b!1262477 (= lt!572035 (getCurrentListMapNoExtraKeys!5864 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50287 () Bool)

(assert (=> mapIsEmpty!50287 mapRes!50287))

(declare-fun b!1262478 () Bool)

(declare-fun res!840939 () Bool)

(assert (=> b!1262478 (=> (not res!840939) (not e!718599))))

(assert (=> b!1262478 (= res!840939 (and (= (size!40239 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40240 _keys!1118) (size!40239 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262479 () Bool)

(declare-fun res!840938 () Bool)

(assert (=> b!1262479 (=> (not res!840938) (not e!718599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82309 (_ BitVec 32)) Bool)

(assert (=> b!1262479 (= res!840938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!106104 res!840941) b!1262478))

(assert (= (and b!1262478 res!840939) b!1262479))

(assert (= (and b!1262479 res!840938) b!1262476))

(assert (= (and b!1262476 res!840940) b!1262477))

(assert (= (and b!1262475 condMapEmpty!50287) mapIsEmpty!50287))

(assert (= (and b!1262475 (not condMapEmpty!50287)) mapNonEmpty!50287))

(get-info :version)

(assert (= (and mapNonEmpty!50287 ((_ is ValueCellFull!15398) mapValue!50287)) b!1262473))

(assert (= (and b!1262475 ((_ is ValueCellFull!15398) mapDefault!50287)) b!1262474))

(assert (= start!106104 b!1262475))

(declare-fun m!1163469 () Bool)

(assert (=> b!1262479 m!1163469))

(declare-fun m!1163471 () Bool)

(assert (=> b!1262476 m!1163471))

(declare-fun m!1163473 () Bool)

(assert (=> b!1262477 m!1163473))

(declare-fun m!1163475 () Bool)

(assert (=> b!1262477 m!1163475))

(declare-fun m!1163477 () Bool)

(assert (=> mapNonEmpty!50287 m!1163477))

(declare-fun m!1163479 () Bool)

(assert (=> start!106104 m!1163479))

(declare-fun m!1163481 () Bool)

(assert (=> start!106104 m!1163481))

(declare-fun m!1163483 () Bool)

(assert (=> start!106104 m!1163483))

(check-sat (not mapNonEmpty!50287) (not b!1262477) (not b!1262476) (not b!1262479) tp_is_empty!32323 b_and!45331 (not b_next!27421) (not start!106104))
(check-sat b_and!45331 (not b_next!27421))
