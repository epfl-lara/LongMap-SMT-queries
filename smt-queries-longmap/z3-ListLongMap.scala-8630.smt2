; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105292 () Bool)

(assert start!105292)

(declare-fun b_free!26815 () Bool)

(declare-fun b_next!26815 () Bool)

(assert (=> start!105292 (= b_free!26815 (not b_next!26815))))

(declare-fun tp!93944 () Bool)

(declare-fun b_and!44613 () Bool)

(assert (=> start!105292 (= tp!93944 b_and!44613)))

(declare-fun b!1253484 () Bool)

(declare-fun e!712003 () Bool)

(assert (=> b!1253484 (= e!712003 (not true))))

(declare-datatypes ((V!47655 0))(
  ( (V!47656 (val!15921 Int)) )
))
(declare-datatypes ((tuple2!20558 0))(
  ( (tuple2!20559 (_1!10290 (_ BitVec 64)) (_2!10290 V!47655)) )
))
(declare-datatypes ((List!27803 0))(
  ( (Nil!27800) (Cons!27799 (h!29017 tuple2!20558) (t!41272 List!27803)) )
))
(declare-datatypes ((ListLongMap!18439 0))(
  ( (ListLongMap!18440 (toList!9235 List!27803)) )
))
(declare-fun lt!565695 () ListLongMap!18439)

(declare-fun lt!565697 () ListLongMap!18439)

(assert (=> b!1253484 (= lt!565695 lt!565697)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41608 0))(
  ( (Unit!41609) )
))
(declare-fun lt!565696 () Unit!41608)

(declare-fun minValueAfter!43 () V!47655)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47655)

(declare-datatypes ((ValueCell!15095 0))(
  ( (ValueCellFull!15095 (v!18615 V!47655)) (EmptyCell!15095) )
))
(declare-datatypes ((array!81143 0))(
  ( (array!81144 (arr!39131 (Array (_ BitVec 32) ValueCell!15095)) (size!39668 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81143)

(declare-fun minValueBefore!43 () V!47655)

(declare-datatypes ((array!81145 0))(
  ( (array!81146 (arr!39132 (Array (_ BitVec 32) (_ BitVec 64))) (size!39669 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81145)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!976 (array!81145 array!81143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47655 V!47655 V!47655 V!47655 (_ BitVec 32) Int) Unit!41608)

(assert (=> b!1253484 (= lt!565696 (lemmaNoChangeToArrayThenSameMapNoExtras!976 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5662 (array!81145 array!81143 (_ BitVec 32) (_ BitVec 32) V!47655 V!47655 (_ BitVec 32) Int) ListLongMap!18439)

(assert (=> b!1253484 (= lt!565697 (getCurrentListMapNoExtraKeys!5662 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253484 (= lt!565695 (getCurrentListMapNoExtraKeys!5662 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49345 () Bool)

(declare-fun mapRes!49345 () Bool)

(assert (=> mapIsEmpty!49345 mapRes!49345))

(declare-fun res!835618 () Bool)

(assert (=> start!105292 (=> (not res!835618) (not e!712003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105292 (= res!835618 (validMask!0 mask!1466))))

(assert (=> start!105292 e!712003))

(assert (=> start!105292 true))

(assert (=> start!105292 tp!93944))

(declare-fun tp_is_empty!31717 () Bool)

(assert (=> start!105292 tp_is_empty!31717))

(declare-fun array_inv!29957 (array!81145) Bool)

(assert (=> start!105292 (array_inv!29957 _keys!1118)))

(declare-fun e!712005 () Bool)

(declare-fun array_inv!29958 (array!81143) Bool)

(assert (=> start!105292 (and (array_inv!29958 _values!914) e!712005)))

(declare-fun b!1253485 () Bool)

(declare-fun e!712004 () Bool)

(assert (=> b!1253485 (= e!712005 (and e!712004 mapRes!49345))))

(declare-fun condMapEmpty!49345 () Bool)

(declare-fun mapDefault!49345 () ValueCell!15095)

(assert (=> b!1253485 (= condMapEmpty!49345 (= (arr!39131 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15095)) mapDefault!49345)))))

(declare-fun b!1253486 () Bool)

(declare-fun res!835620 () Bool)

(assert (=> b!1253486 (=> (not res!835620) (not e!712003))))

(declare-datatypes ((List!27804 0))(
  ( (Nil!27801) (Cons!27800 (h!29018 (_ BitVec 64)) (t!41273 List!27804)) )
))
(declare-fun arrayNoDuplicates!0 (array!81145 (_ BitVec 32) List!27804) Bool)

(assert (=> b!1253486 (= res!835620 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27801))))

(declare-fun b!1253487 () Bool)

(assert (=> b!1253487 (= e!712004 tp_is_empty!31717)))

(declare-fun b!1253488 () Bool)

(declare-fun e!712007 () Bool)

(assert (=> b!1253488 (= e!712007 tp_is_empty!31717)))

(declare-fun mapNonEmpty!49345 () Bool)

(declare-fun tp!93943 () Bool)

(assert (=> mapNonEmpty!49345 (= mapRes!49345 (and tp!93943 e!712007))))

(declare-fun mapKey!49345 () (_ BitVec 32))

(declare-fun mapValue!49345 () ValueCell!15095)

(declare-fun mapRest!49345 () (Array (_ BitVec 32) ValueCell!15095))

(assert (=> mapNonEmpty!49345 (= (arr!39131 _values!914) (store mapRest!49345 mapKey!49345 mapValue!49345))))

(declare-fun b!1253489 () Bool)

(declare-fun res!835621 () Bool)

(assert (=> b!1253489 (=> (not res!835621) (not e!712003))))

(assert (=> b!1253489 (= res!835621 (and (= (size!39668 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39669 _keys!1118) (size!39668 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253490 () Bool)

(declare-fun res!835619 () Bool)

(assert (=> b!1253490 (=> (not res!835619) (not e!712003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81145 (_ BitVec 32)) Bool)

(assert (=> b!1253490 (= res!835619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105292 res!835618) b!1253489))

(assert (= (and b!1253489 res!835621) b!1253490))

(assert (= (and b!1253490 res!835619) b!1253486))

(assert (= (and b!1253486 res!835620) b!1253484))

(assert (= (and b!1253485 condMapEmpty!49345) mapIsEmpty!49345))

(assert (= (and b!1253485 (not condMapEmpty!49345)) mapNonEmpty!49345))

(get-info :version)

(assert (= (and mapNonEmpty!49345 ((_ is ValueCellFull!15095) mapValue!49345)) b!1253488))

(assert (= (and b!1253485 ((_ is ValueCellFull!15095) mapDefault!49345)) b!1253487))

(assert (= start!105292 b!1253485))

(declare-fun m!1154463 () Bool)

(assert (=> b!1253490 m!1154463))

(declare-fun m!1154465 () Bool)

(assert (=> start!105292 m!1154465))

(declare-fun m!1154467 () Bool)

(assert (=> start!105292 m!1154467))

(declare-fun m!1154469 () Bool)

(assert (=> start!105292 m!1154469))

(declare-fun m!1154471 () Bool)

(assert (=> b!1253484 m!1154471))

(declare-fun m!1154473 () Bool)

(assert (=> b!1253484 m!1154473))

(declare-fun m!1154475 () Bool)

(assert (=> b!1253484 m!1154475))

(declare-fun m!1154477 () Bool)

(assert (=> mapNonEmpty!49345 m!1154477))

(declare-fun m!1154479 () Bool)

(assert (=> b!1253486 m!1154479))

(check-sat b_and!44613 (not b_next!26815) (not b!1253486) tp_is_empty!31717 (not b!1253484) (not b!1253490) (not start!105292) (not mapNonEmpty!49345))
(check-sat b_and!44613 (not b_next!26815))
