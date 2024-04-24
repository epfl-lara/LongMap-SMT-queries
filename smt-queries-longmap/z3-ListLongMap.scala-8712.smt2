; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105946 () Bool)

(assert start!105946)

(declare-fun b_free!27307 () Bool)

(declare-fun b_next!27307 () Bool)

(assert (=> start!105946 (= b_free!27307 (not b_next!27307))))

(declare-fun tp!95447 () Bool)

(declare-fun b_and!45193 () Bool)

(assert (=> start!105946 (= tp!95447 b_and!45193)))

(declare-fun b!1260670 () Bool)

(declare-fun e!717274 () Bool)

(declare-fun tp_is_empty!32209 () Bool)

(assert (=> b!1260670 (= e!717274 tp_is_empty!32209)))

(declare-fun b!1260671 () Bool)

(declare-fun e!717272 () Bool)

(assert (=> b!1260671 (= e!717272 true)))

(declare-datatypes ((V!48311 0))(
  ( (V!48312 (val!16167 Int)) )
))
(declare-datatypes ((tuple2!20920 0))(
  ( (tuple2!20921 (_1!10471 (_ BitVec 64)) (_2!10471 V!48311)) )
))
(declare-datatypes ((List!28147 0))(
  ( (Nil!28144) (Cons!28143 (h!29361 tuple2!20920) (t!41634 List!28147)) )
))
(declare-datatypes ((ListLongMap!18801 0))(
  ( (ListLongMap!18802 (toList!9416 List!28147)) )
))
(declare-fun lt!570480 () ListLongMap!18801)

(declare-fun lt!570473 () ListLongMap!18801)

(declare-fun -!2086 (ListLongMap!18801 (_ BitVec 64)) ListLongMap!18801)

(assert (=> b!1260671 (= lt!570480 (-!2086 lt!570473 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570477 () ListLongMap!18801)

(declare-fun lt!570479 () ListLongMap!18801)

(assert (=> b!1260671 (= (-!2086 lt!570477 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570479)))

(declare-datatypes ((Unit!41968 0))(
  ( (Unit!41969) )
))
(declare-fun lt!570472 () Unit!41968)

(declare-fun minValueBefore!43 () V!48311)

(declare-fun addThenRemoveForNewKeyIsSame!340 (ListLongMap!18801 (_ BitVec 64) V!48311) Unit!41968)

(assert (=> b!1260671 (= lt!570472 (addThenRemoveForNewKeyIsSame!340 lt!570479 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717277 () Bool)

(assert (=> b!1260671 e!717277))

(declare-fun res!839853 () Bool)

(assert (=> b!1260671 (=> (not res!839853) (not e!717277))))

(assert (=> b!1260671 (= res!839853 (= lt!570473 lt!570477))))

(declare-fun +!4256 (ListLongMap!18801 tuple2!20920) ListLongMap!18801)

(assert (=> b!1260671 (= lt!570477 (+!4256 lt!570479 (tuple2!20921 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570476 () ListLongMap!18801)

(declare-fun lt!570474 () tuple2!20920)

(assert (=> b!1260671 (= lt!570479 (+!4256 lt!570476 lt!570474))))

(declare-fun zeroValue!871 () V!48311)

(assert (=> b!1260671 (= lt!570474 (tuple2!20921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48311)

(declare-fun lt!570471 () ListLongMap!18801)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15341 0))(
  ( (ValueCellFull!15341 (v!18865 V!48311)) (EmptyCell!15341) )
))
(declare-datatypes ((array!82089 0))(
  ( (array!82090 (arr!39595 (Array (_ BitVec 32) ValueCell!15341)) (size!40132 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82089)

(declare-datatypes ((array!82091 0))(
  ( (array!82092 (arr!39596 (Array (_ BitVec 32) (_ BitVec 64))) (size!40133 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82091)

(declare-fun getCurrentListMap!4598 (array!82091 array!82089 (_ BitVec 32) (_ BitVec 32) V!48311 V!48311 (_ BitVec 32) Int) ListLongMap!18801)

(assert (=> b!1260671 (= lt!570471 (getCurrentListMap!4598 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260671 (= lt!570473 (getCurrentListMap!4598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839852 () Bool)

(declare-fun e!717271 () Bool)

(assert (=> start!105946 (=> (not res!839852) (not e!717271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105946 (= res!839852 (validMask!0 mask!1466))))

(assert (=> start!105946 e!717271))

(assert (=> start!105946 true))

(assert (=> start!105946 tp!95447))

(assert (=> start!105946 tp_is_empty!32209))

(declare-fun array_inv!30293 (array!82091) Bool)

(assert (=> start!105946 (array_inv!30293 _keys!1118)))

(declare-fun e!717276 () Bool)

(declare-fun array_inv!30294 (array!82089) Bool)

(assert (=> start!105946 (and (array_inv!30294 _values!914) e!717276)))

(declare-fun b!1260672 () Bool)

(declare-fun res!839854 () Bool)

(assert (=> b!1260672 (=> (not res!839854) (not e!717271))))

(assert (=> b!1260672 (= res!839854 (and (= (size!40132 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40133 _keys!1118) (size!40132 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260673 () Bool)

(declare-fun res!839855 () Bool)

(assert (=> b!1260673 (=> (not res!839855) (not e!717271))))

(declare-datatypes ((List!28148 0))(
  ( (Nil!28145) (Cons!28144 (h!29362 (_ BitVec 64)) (t!41635 List!28148)) )
))
(declare-fun arrayNoDuplicates!0 (array!82091 (_ BitVec 32) List!28148) Bool)

(assert (=> b!1260673 (= res!839855 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28145))))

(declare-fun b!1260674 () Bool)

(declare-fun res!839856 () Bool)

(assert (=> b!1260674 (=> (not res!839856) (not e!717271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82091 (_ BitVec 32)) Bool)

(assert (=> b!1260674 (= res!839856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260675 () Bool)

(declare-fun e!717273 () Bool)

(declare-fun mapRes!50110 () Bool)

(assert (=> b!1260675 (= e!717276 (and e!717273 mapRes!50110))))

(declare-fun condMapEmpty!50110 () Bool)

(declare-fun mapDefault!50110 () ValueCell!15341)

(assert (=> b!1260675 (= condMapEmpty!50110 (= (arr!39595 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15341)) mapDefault!50110)))))

(declare-fun lt!570478 () ListLongMap!18801)

(declare-fun b!1260676 () Bool)

(assert (=> b!1260676 (= e!717277 (= lt!570471 (+!4256 lt!570478 lt!570474)))))

(declare-fun mapNonEmpty!50110 () Bool)

(declare-fun tp!95446 () Bool)

(assert (=> mapNonEmpty!50110 (= mapRes!50110 (and tp!95446 e!717274))))

(declare-fun mapRest!50110 () (Array (_ BitVec 32) ValueCell!15341))

(declare-fun mapKey!50110 () (_ BitVec 32))

(declare-fun mapValue!50110 () ValueCell!15341)

(assert (=> mapNonEmpty!50110 (= (arr!39595 _values!914) (store mapRest!50110 mapKey!50110 mapValue!50110))))

(declare-fun b!1260677 () Bool)

(assert (=> b!1260677 (= e!717271 (not e!717272))))

(declare-fun res!839857 () Bool)

(assert (=> b!1260677 (=> res!839857 e!717272)))

(assert (=> b!1260677 (= res!839857 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260677 (= lt!570476 lt!570478)))

(declare-fun lt!570475 () Unit!41968)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1141 (array!82091 array!82089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48311 V!48311 V!48311 V!48311 (_ BitVec 32) Int) Unit!41968)

(assert (=> b!1260677 (= lt!570475 (lemmaNoChangeToArrayThenSameMapNoExtras!1141 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5827 (array!82091 array!82089 (_ BitVec 32) (_ BitVec 32) V!48311 V!48311 (_ BitVec 32) Int) ListLongMap!18801)

(assert (=> b!1260677 (= lt!570478 (getCurrentListMapNoExtraKeys!5827 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260677 (= lt!570476 (getCurrentListMapNoExtraKeys!5827 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260678 () Bool)

(assert (=> b!1260678 (= e!717273 tp_is_empty!32209)))

(declare-fun mapIsEmpty!50110 () Bool)

(assert (=> mapIsEmpty!50110 mapRes!50110))

(assert (= (and start!105946 res!839852) b!1260672))

(assert (= (and b!1260672 res!839854) b!1260674))

(assert (= (and b!1260674 res!839856) b!1260673))

(assert (= (and b!1260673 res!839855) b!1260677))

(assert (= (and b!1260677 (not res!839857)) b!1260671))

(assert (= (and b!1260671 res!839853) b!1260676))

(assert (= (and b!1260675 condMapEmpty!50110) mapIsEmpty!50110))

(assert (= (and b!1260675 (not condMapEmpty!50110)) mapNonEmpty!50110))

(get-info :version)

(assert (= (and mapNonEmpty!50110 ((_ is ValueCellFull!15341) mapValue!50110)) b!1260670))

(assert (= (and b!1260675 ((_ is ValueCellFull!15341) mapDefault!50110)) b!1260678))

(assert (= start!105946 b!1260675))

(declare-fun m!1161433 () Bool)

(assert (=> start!105946 m!1161433))

(declare-fun m!1161435 () Bool)

(assert (=> start!105946 m!1161435))

(declare-fun m!1161437 () Bool)

(assert (=> start!105946 m!1161437))

(declare-fun m!1161439 () Bool)

(assert (=> mapNonEmpty!50110 m!1161439))

(declare-fun m!1161441 () Bool)

(assert (=> b!1260673 m!1161441))

(declare-fun m!1161443 () Bool)

(assert (=> b!1260677 m!1161443))

(declare-fun m!1161445 () Bool)

(assert (=> b!1260677 m!1161445))

(declare-fun m!1161447 () Bool)

(assert (=> b!1260677 m!1161447))

(declare-fun m!1161449 () Bool)

(assert (=> b!1260674 m!1161449))

(declare-fun m!1161451 () Bool)

(assert (=> b!1260671 m!1161451))

(declare-fun m!1161453 () Bool)

(assert (=> b!1260671 m!1161453))

(declare-fun m!1161455 () Bool)

(assert (=> b!1260671 m!1161455))

(declare-fun m!1161457 () Bool)

(assert (=> b!1260671 m!1161457))

(declare-fun m!1161459 () Bool)

(assert (=> b!1260671 m!1161459))

(declare-fun m!1161461 () Bool)

(assert (=> b!1260671 m!1161461))

(declare-fun m!1161463 () Bool)

(assert (=> b!1260671 m!1161463))

(declare-fun m!1161465 () Bool)

(assert (=> b!1260676 m!1161465))

(check-sat (not start!105946) (not b!1260673) (not b!1260677) (not b_next!27307) b_and!45193 (not b!1260674) (not mapNonEmpty!50110) (not b!1260676) (not b!1260671) tp_is_empty!32209)
(check-sat b_and!45193 (not b_next!27307))
