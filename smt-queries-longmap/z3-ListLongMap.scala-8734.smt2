; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105894 () Bool)

(assert start!105894)

(declare-fun b_free!27439 () Bool)

(declare-fun b_next!27439 () Bool)

(assert (=> start!105894 (= b_free!27439 (not b_next!27439))))

(declare-fun tp!95849 () Bool)

(declare-fun b_and!45329 () Bool)

(assert (=> start!105894 (= tp!95849 b_and!45329)))

(declare-fun b!1261275 () Bool)

(declare-fun res!840488 () Bool)

(declare-fun e!717842 () Bool)

(assert (=> b!1261275 (=> (not res!840488) (not e!717842))))

(declare-datatypes ((array!82219 0))(
  ( (array!82220 (arr!39663 (Array (_ BitVec 32) (_ BitVec 64))) (size!40201 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82219)

(declare-datatypes ((List!28282 0))(
  ( (Nil!28279) (Cons!28278 (h!29487 (_ BitVec 64)) (t!41772 List!28282)) )
))
(declare-fun arrayNoDuplicates!0 (array!82219 (_ BitVec 32) List!28282) Bool)

(assert (=> b!1261275 (= res!840488 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28279))))

(declare-fun mapIsEmpty!50314 () Bool)

(declare-fun mapRes!50314 () Bool)

(assert (=> mapIsEmpty!50314 mapRes!50314))

(declare-fun res!840487 () Bool)

(assert (=> start!105894 (=> (not res!840487) (not e!717842))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105894 (= res!840487 (validMask!0 mask!1466))))

(assert (=> start!105894 e!717842))

(assert (=> start!105894 true))

(assert (=> start!105894 tp!95849))

(declare-fun tp_is_empty!32341 () Bool)

(assert (=> start!105894 tp_is_empty!32341))

(declare-fun array_inv!30343 (array!82219) Bool)

(assert (=> start!105894 (array_inv!30343 _keys!1118)))

(declare-datatypes ((V!48487 0))(
  ( (V!48488 (val!16233 Int)) )
))
(declare-datatypes ((ValueCell!15407 0))(
  ( (ValueCellFull!15407 (v!18936 V!48487)) (EmptyCell!15407) )
))
(declare-datatypes ((array!82221 0))(
  ( (array!82222 (arr!39664 (Array (_ BitVec 32) ValueCell!15407)) (size!40202 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82221)

(declare-fun e!717843 () Bool)

(declare-fun array_inv!30344 (array!82221) Bool)

(assert (=> start!105894 (and (array_inv!30344 _values!914) e!717843)))

(declare-fun mapNonEmpty!50314 () Bool)

(declare-fun tp!95848 () Bool)

(declare-fun e!717844 () Bool)

(assert (=> mapNonEmpty!50314 (= mapRes!50314 (and tp!95848 e!717844))))

(declare-fun mapValue!50314 () ValueCell!15407)

(declare-fun mapKey!50314 () (_ BitVec 32))

(declare-fun mapRest!50314 () (Array (_ BitVec 32) ValueCell!15407))

(assert (=> mapNonEmpty!50314 (= (arr!39664 _values!914) (store mapRest!50314 mapKey!50314 mapValue!50314))))

(declare-fun b!1261276 () Bool)

(declare-fun e!717845 () Bool)

(assert (=> b!1261276 (= e!717845 tp_is_empty!32341)))

(declare-fun b!1261277 () Bool)

(assert (=> b!1261277 (= e!717843 (and e!717845 mapRes!50314))))

(declare-fun condMapEmpty!50314 () Bool)

(declare-fun mapDefault!50314 () ValueCell!15407)

(assert (=> b!1261277 (= condMapEmpty!50314 (= (arr!39664 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15407)) mapDefault!50314)))))

(declare-fun b!1261278 () Bool)

(assert (=> b!1261278 (= e!717842 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48487)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48487)

(declare-datatypes ((tuple2!21080 0))(
  ( (tuple2!21081 (_1!10551 (_ BitVec 64)) (_2!10551 V!48487)) )
))
(declare-datatypes ((List!28283 0))(
  ( (Nil!28280) (Cons!28279 (h!29488 tuple2!21080) (t!41773 List!28283)) )
))
(declare-datatypes ((ListLongMap!18953 0))(
  ( (ListLongMap!18954 (toList!9492 List!28283)) )
))
(declare-fun lt!571425 () ListLongMap!18953)

(declare-fun getCurrentListMapNoExtraKeys!5861 (array!82219 array!82221 (_ BitVec 32) (_ BitVec 32) V!48487 V!48487 (_ BitVec 32) Int) ListLongMap!18953)

(assert (=> b!1261278 (= lt!571425 (getCurrentListMapNoExtraKeys!5861 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571426 () ListLongMap!18953)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48487)

(assert (=> b!1261278 (= lt!571426 (getCurrentListMapNoExtraKeys!5861 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261279 () Bool)

(declare-fun res!840489 () Bool)

(assert (=> b!1261279 (=> (not res!840489) (not e!717842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82219 (_ BitVec 32)) Bool)

(assert (=> b!1261279 (= res!840489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261280 () Bool)

(declare-fun res!840486 () Bool)

(assert (=> b!1261280 (=> (not res!840486) (not e!717842))))

(assert (=> b!1261280 (= res!840486 (and (= (size!40202 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40201 _keys!1118) (size!40202 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261281 () Bool)

(assert (=> b!1261281 (= e!717844 tp_is_empty!32341)))

(assert (= (and start!105894 res!840487) b!1261280))

(assert (= (and b!1261280 res!840486) b!1261279))

(assert (= (and b!1261279 res!840489) b!1261275))

(assert (= (and b!1261275 res!840488) b!1261278))

(assert (= (and b!1261277 condMapEmpty!50314) mapIsEmpty!50314))

(assert (= (and b!1261277 (not condMapEmpty!50314)) mapNonEmpty!50314))

(get-info :version)

(assert (= (and mapNonEmpty!50314 ((_ is ValueCellFull!15407) mapValue!50314)) b!1261281))

(assert (= (and b!1261277 ((_ is ValueCellFull!15407) mapDefault!50314)) b!1261276))

(assert (= start!105894 b!1261277))

(declare-fun m!1161481 () Bool)

(assert (=> start!105894 m!1161481))

(declare-fun m!1161483 () Bool)

(assert (=> start!105894 m!1161483))

(declare-fun m!1161485 () Bool)

(assert (=> start!105894 m!1161485))

(declare-fun m!1161487 () Bool)

(assert (=> mapNonEmpty!50314 m!1161487))

(declare-fun m!1161489 () Bool)

(assert (=> b!1261279 m!1161489))

(declare-fun m!1161491 () Bool)

(assert (=> b!1261278 m!1161491))

(declare-fun m!1161493 () Bool)

(assert (=> b!1261278 m!1161493))

(declare-fun m!1161495 () Bool)

(assert (=> b!1261275 m!1161495))

(check-sat (not b!1261275) (not mapNonEmpty!50314) (not start!105894) (not b!1261279) (not b_next!27439) tp_is_empty!32341 (not b!1261278) b_and!45329)
(check-sat b_and!45329 (not b_next!27439))
