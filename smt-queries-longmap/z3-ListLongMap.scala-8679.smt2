; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105474 () Bool)

(assert start!105474)

(declare-fun b_free!27111 () Bool)

(declare-fun b_next!27111 () Bool)

(assert (=> start!105474 (= b_free!27111 (not b_next!27111))))

(declare-fun tp!94849 () Bool)

(declare-fun b_and!44967 () Bool)

(assert (=> start!105474 (= tp!94849 b_and!44967)))

(declare-fun b!1256572 () Bool)

(declare-fun e!714365 () Bool)

(declare-fun e!714363 () Bool)

(assert (=> b!1256572 (= e!714365 (not e!714363))))

(declare-fun res!837662 () Bool)

(assert (=> b!1256572 (=> res!837662 e!714363)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256572 (= res!837662 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!48049 0))(
  ( (V!48050 (val!16069 Int)) )
))
(declare-datatypes ((tuple2!20760 0))(
  ( (tuple2!20761 (_1!10391 (_ BitVec 64)) (_2!10391 V!48049)) )
))
(declare-datatypes ((List!27977 0))(
  ( (Nil!27974) (Cons!27973 (h!29182 tuple2!20760) (t!41466 List!27977)) )
))
(declare-datatypes ((ListLongMap!18633 0))(
  ( (ListLongMap!18634 (toList!9332 List!27977)) )
))
(declare-fun lt!568229 () ListLongMap!18633)

(declare-fun lt!568232 () ListLongMap!18633)

(assert (=> b!1256572 (= lt!568229 lt!568232)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48049)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81666 0))(
  ( (array!81667 (arr!39391 (Array (_ BitVec 32) (_ BitVec 64))) (size!39927 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81666)

(declare-datatypes ((ValueCell!15243 0))(
  ( (ValueCellFull!15243 (v!18770 V!48049)) (EmptyCell!15243) )
))
(declare-datatypes ((array!81668 0))(
  ( (array!81669 (arr!39392 (Array (_ BitVec 32) ValueCell!15243)) (size!39928 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81668)

(declare-datatypes ((Unit!41848 0))(
  ( (Unit!41849) )
))
(declare-fun lt!568228 () Unit!41848)

(declare-fun minValueBefore!43 () V!48049)

(declare-fun zeroValue!871 () V!48049)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1078 (array!81666 array!81668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48049 V!48049 V!48049 V!48049 (_ BitVec 32) Int) Unit!41848)

(assert (=> b!1256572 (= lt!568228 (lemmaNoChangeToArrayThenSameMapNoExtras!1078 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5714 (array!81666 array!81668 (_ BitVec 32) (_ BitVec 32) V!48049 V!48049 (_ BitVec 32) Int) ListLongMap!18633)

(assert (=> b!1256572 (= lt!568232 (getCurrentListMapNoExtraKeys!5714 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256572 (= lt!568229 (getCurrentListMapNoExtraKeys!5714 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256573 () Bool)

(declare-fun e!714364 () Bool)

(declare-fun e!714366 () Bool)

(declare-fun mapRes!49807 () Bool)

(assert (=> b!1256573 (= e!714364 (and e!714366 mapRes!49807))))

(declare-fun condMapEmpty!49807 () Bool)

(declare-fun mapDefault!49807 () ValueCell!15243)

(assert (=> b!1256573 (= condMapEmpty!49807 (= (arr!39392 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15243)) mapDefault!49807)))))

(declare-fun b!1256574 () Bool)

(declare-fun res!837666 () Bool)

(assert (=> b!1256574 (=> (not res!837666) (not e!714365))))

(declare-datatypes ((List!27978 0))(
  ( (Nil!27975) (Cons!27974 (h!29183 (_ BitVec 64)) (t!41467 List!27978)) )
))
(declare-fun arrayNoDuplicates!0 (array!81666 (_ BitVec 32) List!27978) Bool)

(assert (=> b!1256574 (= res!837666 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27975))))

(declare-fun res!837663 () Bool)

(assert (=> start!105474 (=> (not res!837663) (not e!714365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105474 (= res!837663 (validMask!0 mask!1466))))

(assert (=> start!105474 e!714365))

(assert (=> start!105474 true))

(assert (=> start!105474 tp!94849))

(declare-fun tp_is_empty!32013 () Bool)

(assert (=> start!105474 tp_is_empty!32013))

(declare-fun array_inv!30009 (array!81666) Bool)

(assert (=> start!105474 (array_inv!30009 _keys!1118)))

(declare-fun array_inv!30010 (array!81668) Bool)

(assert (=> start!105474 (and (array_inv!30010 _values!914) e!714364)))

(declare-fun mapNonEmpty!49807 () Bool)

(declare-fun tp!94850 () Bool)

(declare-fun e!714362 () Bool)

(assert (=> mapNonEmpty!49807 (= mapRes!49807 (and tp!94850 e!714362))))

(declare-fun mapRest!49807 () (Array (_ BitVec 32) ValueCell!15243))

(declare-fun mapValue!49807 () ValueCell!15243)

(declare-fun mapKey!49807 () (_ BitVec 32))

(assert (=> mapNonEmpty!49807 (= (arr!39392 _values!914) (store mapRest!49807 mapKey!49807 mapValue!49807))))

(declare-fun b!1256575 () Bool)

(declare-fun e!714361 () Bool)

(assert (=> b!1256575 (= e!714363 e!714361)))

(declare-fun res!837661 () Bool)

(assert (=> b!1256575 (=> res!837661 e!714361)))

(declare-fun lt!568230 () ListLongMap!18633)

(declare-fun contains!7550 (ListLongMap!18633 (_ BitVec 64)) Bool)

(assert (=> b!1256575 (= res!837661 (contains!7550 lt!568230 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4555 (array!81666 array!81668 (_ BitVec 32) (_ BitVec 32) V!48049 V!48049 (_ BitVec 32) Int) ListLongMap!18633)

(assert (=> b!1256575 (= lt!568230 (getCurrentListMap!4555 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256576 () Bool)

(assert (=> b!1256576 (= e!714362 tp_is_empty!32013)))

(declare-fun b!1256577 () Bool)

(declare-fun res!837665 () Bool)

(assert (=> b!1256577 (=> (not res!837665) (not e!714365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81666 (_ BitVec 32)) Bool)

(assert (=> b!1256577 (= res!837665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256578 () Bool)

(declare-fun res!837664 () Bool)

(assert (=> b!1256578 (=> (not res!837664) (not e!714365))))

(assert (=> b!1256578 (= res!837664 (and (= (size!39928 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39927 _keys!1118) (size!39928 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256579 () Bool)

(assert (=> b!1256579 (= e!714366 tp_is_empty!32013)))

(declare-fun mapIsEmpty!49807 () Bool)

(assert (=> mapIsEmpty!49807 mapRes!49807))

(declare-fun b!1256580 () Bool)

(assert (=> b!1256580 (= e!714361 true)))

(declare-fun -!2082 (ListLongMap!18633 (_ BitVec 64)) ListLongMap!18633)

(assert (=> b!1256580 (= (-!2082 lt!568230 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568230)))

(declare-fun lt!568231 () Unit!41848)

(declare-fun removeNotPresentStillSame!135 (ListLongMap!18633 (_ BitVec 64)) Unit!41848)

(assert (=> b!1256580 (= lt!568231 (removeNotPresentStillSame!135 lt!568230 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!105474 res!837663) b!1256578))

(assert (= (and b!1256578 res!837664) b!1256577))

(assert (= (and b!1256577 res!837665) b!1256574))

(assert (= (and b!1256574 res!837666) b!1256572))

(assert (= (and b!1256572 (not res!837662)) b!1256575))

(assert (= (and b!1256575 (not res!837661)) b!1256580))

(assert (= (and b!1256573 condMapEmpty!49807) mapIsEmpty!49807))

(assert (= (and b!1256573 (not condMapEmpty!49807)) mapNonEmpty!49807))

(get-info :version)

(assert (= (and mapNonEmpty!49807 ((_ is ValueCellFull!15243) mapValue!49807)) b!1256576))

(assert (= (and b!1256573 ((_ is ValueCellFull!15243) mapDefault!49807)) b!1256579))

(assert (= start!105474 b!1256573))

(declare-fun m!1157215 () Bool)

(assert (=> mapNonEmpty!49807 m!1157215))

(declare-fun m!1157217 () Bool)

(assert (=> b!1256577 m!1157217))

(declare-fun m!1157219 () Bool)

(assert (=> b!1256575 m!1157219))

(declare-fun m!1157221 () Bool)

(assert (=> b!1256575 m!1157221))

(declare-fun m!1157223 () Bool)

(assert (=> start!105474 m!1157223))

(declare-fun m!1157225 () Bool)

(assert (=> start!105474 m!1157225))

(declare-fun m!1157227 () Bool)

(assert (=> start!105474 m!1157227))

(declare-fun m!1157229 () Bool)

(assert (=> b!1256574 m!1157229))

(declare-fun m!1157231 () Bool)

(assert (=> b!1256572 m!1157231))

(declare-fun m!1157233 () Bool)

(assert (=> b!1256572 m!1157233))

(declare-fun m!1157235 () Bool)

(assert (=> b!1256572 m!1157235))

(declare-fun m!1157237 () Bool)

(assert (=> b!1256580 m!1157237))

(declare-fun m!1157239 () Bool)

(assert (=> b!1256580 m!1157239))

(check-sat (not b!1256574) (not b!1256580) tp_is_empty!32013 (not start!105474) b_and!44967 (not b!1256575) (not b_next!27111) (not b!1256572) (not b!1256577) (not mapNonEmpty!49807))
(check-sat b_and!44967 (not b_next!27111))
