; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105558 () Bool)

(assert start!105558)

(declare-fun b_free!27007 () Bool)

(declare-fun b_next!27007 () Bool)

(assert (=> start!105558 (= b_free!27007 (not b_next!27007))))

(declare-fun tp!94532 () Bool)

(declare-fun b_and!44847 () Bool)

(assert (=> start!105558 (= tp!94532 b_and!44847)))

(declare-fun b!1256362 () Bool)

(declare-fun e!714092 () Bool)

(assert (=> b!1256362 (= e!714092 (not true))))

(declare-datatypes ((V!47911 0))(
  ( (V!47912 (val!16017 Int)) )
))
(declare-datatypes ((tuple2!20702 0))(
  ( (tuple2!20703 (_1!10362 (_ BitVec 64)) (_2!10362 V!47911)) )
))
(declare-datatypes ((List!27938 0))(
  ( (Nil!27935) (Cons!27934 (h!29152 tuple2!20702) (t!41415 List!27938)) )
))
(declare-datatypes ((ListLongMap!18583 0))(
  ( (ListLongMap!18584 (toList!9307 List!27938)) )
))
(declare-fun lt!567899 () ListLongMap!18583)

(declare-fun lt!567901 () ListLongMap!18583)

(assert (=> b!1256362 (= lt!567899 lt!567901)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47911)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81515 0))(
  ( (array!81516 (arr!39313 (Array (_ BitVec 32) (_ BitVec 64))) (size!39850 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81515)

(declare-datatypes ((ValueCell!15191 0))(
  ( (ValueCellFull!15191 (v!18713 V!47911)) (EmptyCell!15191) )
))
(declare-datatypes ((array!81517 0))(
  ( (array!81518 (arr!39314 (Array (_ BitVec 32) ValueCell!15191)) (size!39851 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81517)

(declare-fun minValueBefore!43 () V!47911)

(declare-fun zeroValue!871 () V!47911)

(declare-datatypes ((Unit!41755 0))(
  ( (Unit!41756) )
))
(declare-fun lt!567900 () Unit!41755)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1043 (array!81515 array!81517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47911 V!47911 V!47911 V!47911 (_ BitVec 32) Int) Unit!41755)

(assert (=> b!1256362 (= lt!567900 (lemmaNoChangeToArrayThenSameMapNoExtras!1043 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5729 (array!81515 array!81517 (_ BitVec 32) (_ BitVec 32) V!47911 V!47911 (_ BitVec 32) Int) ListLongMap!18583)

(assert (=> b!1256362 (= lt!567901 (getCurrentListMapNoExtraKeys!5729 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256362 (= lt!567899 (getCurrentListMapNoExtraKeys!5729 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256363 () Bool)

(declare-fun e!714091 () Bool)

(declare-fun tp_is_empty!31909 () Bool)

(assert (=> b!1256363 (= e!714091 tp_is_empty!31909)))

(declare-fun b!1256364 () Bool)

(declare-fun res!837284 () Bool)

(assert (=> b!1256364 (=> (not res!837284) (not e!714092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81515 (_ BitVec 32)) Bool)

(assert (=> b!1256364 (= res!837284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256365 () Bool)

(declare-fun res!837287 () Bool)

(assert (=> b!1256365 (=> (not res!837287) (not e!714092))))

(declare-datatypes ((List!27939 0))(
  ( (Nil!27936) (Cons!27935 (h!29153 (_ BitVec 64)) (t!41416 List!27939)) )
))
(declare-fun arrayNoDuplicates!0 (array!81515 (_ BitVec 32) List!27939) Bool)

(assert (=> b!1256365 (= res!837287 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27936))))

(declare-fun res!837285 () Bool)

(assert (=> start!105558 (=> (not res!837285) (not e!714092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105558 (= res!837285 (validMask!0 mask!1466))))

(assert (=> start!105558 e!714092))

(assert (=> start!105558 true))

(assert (=> start!105558 tp!94532))

(assert (=> start!105558 tp_is_empty!31909))

(declare-fun array_inv!30087 (array!81515) Bool)

(assert (=> start!105558 (array_inv!30087 _keys!1118)))

(declare-fun e!714093 () Bool)

(declare-fun array_inv!30088 (array!81517) Bool)

(assert (=> start!105558 (and (array_inv!30088 _values!914) e!714093)))

(declare-fun b!1256366 () Bool)

(declare-fun e!714095 () Bool)

(assert (=> b!1256366 (= e!714095 tp_is_empty!31909)))

(declare-fun b!1256367 () Bool)

(declare-fun mapRes!49645 () Bool)

(assert (=> b!1256367 (= e!714093 (and e!714091 mapRes!49645))))

(declare-fun condMapEmpty!49645 () Bool)

(declare-fun mapDefault!49645 () ValueCell!15191)

(assert (=> b!1256367 (= condMapEmpty!49645 (= (arr!39314 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15191)) mapDefault!49645)))))

(declare-fun b!1256368 () Bool)

(declare-fun res!837286 () Bool)

(assert (=> b!1256368 (=> (not res!837286) (not e!714092))))

(assert (=> b!1256368 (= res!837286 (and (= (size!39851 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39850 _keys!1118) (size!39851 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49645 () Bool)

(assert (=> mapIsEmpty!49645 mapRes!49645))

(declare-fun mapNonEmpty!49645 () Bool)

(declare-fun tp!94531 () Bool)

(assert (=> mapNonEmpty!49645 (= mapRes!49645 (and tp!94531 e!714095))))

(declare-fun mapValue!49645 () ValueCell!15191)

(declare-fun mapKey!49645 () (_ BitVec 32))

(declare-fun mapRest!49645 () (Array (_ BitVec 32) ValueCell!15191))

(assert (=> mapNonEmpty!49645 (= (arr!39314 _values!914) (store mapRest!49645 mapKey!49645 mapValue!49645))))

(assert (= (and start!105558 res!837285) b!1256368))

(assert (= (and b!1256368 res!837286) b!1256364))

(assert (= (and b!1256364 res!837284) b!1256365))

(assert (= (and b!1256365 res!837287) b!1256362))

(assert (= (and b!1256367 condMapEmpty!49645) mapIsEmpty!49645))

(assert (= (and b!1256367 (not condMapEmpty!49645)) mapNonEmpty!49645))

(get-info :version)

(assert (= (and mapNonEmpty!49645 ((_ is ValueCellFull!15191) mapValue!49645)) b!1256366))

(assert (= (and b!1256367 ((_ is ValueCellFull!15191) mapDefault!49645)) b!1256363))

(assert (= start!105558 b!1256367))

(declare-fun m!1157463 () Bool)

(assert (=> start!105558 m!1157463))

(declare-fun m!1157465 () Bool)

(assert (=> start!105558 m!1157465))

(declare-fun m!1157467 () Bool)

(assert (=> start!105558 m!1157467))

(declare-fun m!1157469 () Bool)

(assert (=> b!1256362 m!1157469))

(declare-fun m!1157471 () Bool)

(assert (=> b!1256362 m!1157471))

(declare-fun m!1157473 () Bool)

(assert (=> b!1256362 m!1157473))

(declare-fun m!1157475 () Bool)

(assert (=> b!1256364 m!1157475))

(declare-fun m!1157477 () Bool)

(assert (=> mapNonEmpty!49645 m!1157477))

(declare-fun m!1157479 () Bool)

(assert (=> b!1256365 m!1157479))

(check-sat (not b!1256365) (not mapNonEmpty!49645) (not b!1256362) tp_is_empty!31909 (not b!1256364) b_and!44847 (not b_next!27007) (not start!105558))
(check-sat b_and!44847 (not b_next!27007))
