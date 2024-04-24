; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105476 () Bool)

(assert start!105476)

(declare-fun b_free!26947 () Bool)

(declare-fun b_next!26947 () Bool)

(assert (=> start!105476 (= b_free!26947 (not b_next!26947))))

(declare-fun tp!94348 () Bool)

(declare-fun b_and!44775 () Bool)

(assert (=> start!105476 (= tp!94348 b_and!44775)))

(declare-fun b!1255479 () Bool)

(declare-fun e!713453 () Bool)

(declare-fun tp_is_empty!31849 () Bool)

(assert (=> b!1255479 (= e!713453 tp_is_empty!31849)))

(declare-fun b!1255480 () Bool)

(declare-fun e!713455 () Bool)

(assert (=> b!1255480 (= e!713455 tp_is_empty!31849)))

(declare-fun b!1255481 () Bool)

(declare-fun res!836775 () Bool)

(declare-fun e!713457 () Bool)

(assert (=> b!1255481 (=> (not res!836775) (not e!713457))))

(declare-datatypes ((array!81401 0))(
  ( (array!81402 (arr!39257 (Array (_ BitVec 32) (_ BitVec 64))) (size!39794 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81401)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81401 (_ BitVec 32)) Bool)

(assert (=> b!1255481 (= res!836775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255482 () Bool)

(declare-fun e!713454 () Bool)

(assert (=> b!1255482 (= e!713457 (not e!713454))))

(declare-fun res!836774 () Bool)

(assert (=> b!1255482 (=> res!836774 e!713454)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255482 (= res!836774 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47831 0))(
  ( (V!47832 (val!15987 Int)) )
))
(declare-datatypes ((tuple2!20658 0))(
  ( (tuple2!20659 (_1!10340 (_ BitVec 64)) (_2!10340 V!47831)) )
))
(declare-datatypes ((List!27896 0))(
  ( (Nil!27893) (Cons!27892 (h!29110 tuple2!20658) (t!41371 List!27896)) )
))
(declare-datatypes ((ListLongMap!18539 0))(
  ( (ListLongMap!18540 (toList!9285 List!27896)) )
))
(declare-fun lt!567142 () ListLongMap!18539)

(declare-fun lt!567146 () ListLongMap!18539)

(assert (=> b!1255482 (= lt!567142 lt!567146)))

(declare-datatypes ((Unit!41709 0))(
  ( (Unit!41710) )
))
(declare-fun lt!567148 () Unit!41709)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47831)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47831)

(declare-datatypes ((ValueCell!15161 0))(
  ( (ValueCellFull!15161 (v!18682 V!47831)) (EmptyCell!15161) )
))
(declare-datatypes ((array!81403 0))(
  ( (array!81404 (arr!39258 (Array (_ BitVec 32) ValueCell!15161)) (size!39795 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81403)

(declare-fun minValueBefore!43 () V!47831)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1023 (array!81401 array!81403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47831 V!47831 V!47831 V!47831 (_ BitVec 32) Int) Unit!41709)

(assert (=> b!1255482 (= lt!567148 (lemmaNoChangeToArrayThenSameMapNoExtras!1023 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5709 (array!81401 array!81403 (_ BitVec 32) (_ BitVec 32) V!47831 V!47831 (_ BitVec 32) Int) ListLongMap!18539)

(assert (=> b!1255482 (= lt!567146 (getCurrentListMapNoExtraKeys!5709 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255482 (= lt!567142 (getCurrentListMapNoExtraKeys!5709 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49552 () Bool)

(declare-fun mapRes!49552 () Bool)

(declare-fun tp!94349 () Bool)

(assert (=> mapNonEmpty!49552 (= mapRes!49552 (and tp!94349 e!713453))))

(declare-fun mapKey!49552 () (_ BitVec 32))

(declare-fun mapValue!49552 () ValueCell!15161)

(declare-fun mapRest!49552 () (Array (_ BitVec 32) ValueCell!15161))

(assert (=> mapNonEmpty!49552 (= (arr!39258 _values!914) (store mapRest!49552 mapKey!49552 mapValue!49552))))

(declare-fun mapIsEmpty!49552 () Bool)

(assert (=> mapIsEmpty!49552 mapRes!49552))

(declare-fun b!1255483 () Bool)

(declare-fun res!836776 () Bool)

(assert (=> b!1255483 (=> (not res!836776) (not e!713457))))

(assert (=> b!1255483 (= res!836776 (and (= (size!39795 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39794 _keys!1118) (size!39795 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255484 () Bool)

(declare-fun e!713452 () Bool)

(assert (=> b!1255484 (= e!713452 (and e!713455 mapRes!49552))))

(declare-fun condMapEmpty!49552 () Bool)

(declare-fun mapDefault!49552 () ValueCell!15161)

(assert (=> b!1255484 (= condMapEmpty!49552 (= (arr!39258 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15161)) mapDefault!49552)))))

(declare-fun b!1255485 () Bool)

(declare-fun res!836773 () Bool)

(assert (=> b!1255485 (=> (not res!836773) (not e!713457))))

(declare-datatypes ((List!27897 0))(
  ( (Nil!27894) (Cons!27893 (h!29111 (_ BitVec 64)) (t!41372 List!27897)) )
))
(declare-fun arrayNoDuplicates!0 (array!81401 (_ BitVec 32) List!27897) Bool)

(assert (=> b!1255485 (= res!836773 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27894))))

(declare-fun b!1255478 () Bool)

(assert (=> b!1255478 (= e!713454 true)))

(declare-fun lt!567143 () ListLongMap!18539)

(declare-fun lt!567145 () ListLongMap!18539)

(declare-fun -!2024 (ListLongMap!18539 (_ BitVec 64)) ListLongMap!18539)

(assert (=> b!1255478 (= lt!567143 (-!2024 lt!567145 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567147 () ListLongMap!18539)

(assert (=> b!1255478 (= (-!2024 lt!567147 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567142)))

(declare-fun lt!567144 () Unit!41709)

(declare-fun addThenRemoveForNewKeyIsSame!314 (ListLongMap!18539 (_ BitVec 64) V!47831) Unit!41709)

(assert (=> b!1255478 (= lt!567144 (addThenRemoveForNewKeyIsSame!314 lt!567142 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567141 () ListLongMap!18539)

(assert (=> b!1255478 (and (= lt!567145 lt!567147) (= lt!567141 lt!567146))))

(declare-fun +!4220 (ListLongMap!18539 tuple2!20658) ListLongMap!18539)

(assert (=> b!1255478 (= lt!567147 (+!4220 lt!567142 (tuple2!20659 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4517 (array!81401 array!81403 (_ BitVec 32) (_ BitVec 32) V!47831 V!47831 (_ BitVec 32) Int) ListLongMap!18539)

(assert (=> b!1255478 (= lt!567141 (getCurrentListMap!4517 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255478 (= lt!567145 (getCurrentListMap!4517 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836772 () Bool)

(assert (=> start!105476 (=> (not res!836772) (not e!713457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105476 (= res!836772 (validMask!0 mask!1466))))

(assert (=> start!105476 e!713457))

(assert (=> start!105476 true))

(assert (=> start!105476 tp!94348))

(assert (=> start!105476 tp_is_empty!31849))

(declare-fun array_inv!30045 (array!81401) Bool)

(assert (=> start!105476 (array_inv!30045 _keys!1118)))

(declare-fun array_inv!30046 (array!81403) Bool)

(assert (=> start!105476 (and (array_inv!30046 _values!914) e!713452)))

(assert (= (and start!105476 res!836772) b!1255483))

(assert (= (and b!1255483 res!836776) b!1255481))

(assert (= (and b!1255481 res!836775) b!1255485))

(assert (= (and b!1255485 res!836773) b!1255482))

(assert (= (and b!1255482 (not res!836774)) b!1255478))

(assert (= (and b!1255484 condMapEmpty!49552) mapIsEmpty!49552))

(assert (= (and b!1255484 (not condMapEmpty!49552)) mapNonEmpty!49552))

(get-info :version)

(assert (= (and mapNonEmpty!49552 ((_ is ValueCellFull!15161) mapValue!49552)) b!1255479))

(assert (= (and b!1255484 ((_ is ValueCellFull!15161) mapDefault!49552)) b!1255480))

(assert (= start!105476 b!1255484))

(declare-fun m!1156451 () Bool)

(assert (=> b!1255485 m!1156451))

(declare-fun m!1156453 () Bool)

(assert (=> start!105476 m!1156453))

(declare-fun m!1156455 () Bool)

(assert (=> start!105476 m!1156455))

(declare-fun m!1156457 () Bool)

(assert (=> start!105476 m!1156457))

(declare-fun m!1156459 () Bool)

(assert (=> b!1255482 m!1156459))

(declare-fun m!1156461 () Bool)

(assert (=> b!1255482 m!1156461))

(declare-fun m!1156463 () Bool)

(assert (=> b!1255482 m!1156463))

(declare-fun m!1156465 () Bool)

(assert (=> b!1255478 m!1156465))

(declare-fun m!1156467 () Bool)

(assert (=> b!1255478 m!1156467))

(declare-fun m!1156469 () Bool)

(assert (=> b!1255478 m!1156469))

(declare-fun m!1156471 () Bool)

(assert (=> b!1255478 m!1156471))

(declare-fun m!1156473 () Bool)

(assert (=> b!1255478 m!1156473))

(declare-fun m!1156475 () Bool)

(assert (=> b!1255478 m!1156475))

(declare-fun m!1156477 () Bool)

(assert (=> b!1255481 m!1156477))

(declare-fun m!1156479 () Bool)

(assert (=> mapNonEmpty!49552 m!1156479))

(check-sat tp_is_empty!31849 (not b!1255482) (not b!1255481) (not start!105476) (not mapNonEmpty!49552) (not b_next!26947) b_and!44775 (not b!1255485) (not b!1255478))
(check-sat b_and!44775 (not b_next!26947))
