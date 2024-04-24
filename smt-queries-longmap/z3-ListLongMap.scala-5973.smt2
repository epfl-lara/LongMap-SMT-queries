; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77832 () Bool)

(assert start!77832)

(declare-fun b_free!16249 () Bool)

(declare-fun b_next!16249 () Bool)

(assert (=> start!77832 (= b_free!16249 (not b_next!16249))))

(declare-fun tp!57009 () Bool)

(declare-fun b_and!26661 () Bool)

(assert (=> start!77832 (= tp!57009 b_and!26661)))

(declare-fun b!906518 () Bool)

(declare-fun e!508066 () Bool)

(declare-fun e!508069 () Bool)

(assert (=> b!906518 (= e!508066 e!508069)))

(declare-fun res!611472 () Bool)

(assert (=> b!906518 (=> (not res!611472) (not e!508069))))

(declare-datatypes ((V!29855 0))(
  ( (V!29856 (val!9384 Int)) )
))
(declare-datatypes ((tuple2!12138 0))(
  ( (tuple2!12139 (_1!6080 (_ BitVec 64)) (_2!6080 V!29855)) )
))
(declare-datatypes ((List!17981 0))(
  ( (Nil!17978) (Cons!17977 (h!19129 tuple2!12138) (t!25394 List!17981)) )
))
(declare-datatypes ((ListLongMap!10837 0))(
  ( (ListLongMap!10838 (toList!5434 List!17981)) )
))
(declare-fun lt!408979 () ListLongMap!10837)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4489 (ListLongMap!10837 (_ BitVec 64)) Bool)

(assert (=> b!906518 (= res!611472 (contains!4489 lt!408979 k0!1033))))

(declare-datatypes ((ValueCell!8852 0))(
  ( (ValueCellFull!8852 (v!11886 V!29855)) (EmptyCell!8852) )
))
(declare-datatypes ((array!53417 0))(
  ( (array!53418 (arr!25663 (Array (_ BitVec 32) ValueCell!8852)) (size!26123 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53417)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29855)

(declare-datatypes ((array!53419 0))(
  ( (array!53420 (arr!25664 (Array (_ BitVec 32) (_ BitVec 64))) (size!26124 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53419)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29855)

(declare-fun getCurrentListMap!2700 (array!53419 array!53417 (_ BitVec 32) (_ BitVec 32) V!29855 V!29855 (_ BitVec 32) Int) ListLongMap!10837)

(assert (=> b!906518 (= lt!408979 (getCurrentListMap!2700 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906519 () Bool)

(declare-fun res!611464 () Bool)

(assert (=> b!906519 (=> (not res!611464) (not e!508066))))

(declare-datatypes ((List!17982 0))(
  ( (Nil!17979) (Cons!17978 (h!19130 (_ BitVec 64)) (t!25395 List!17982)) )
))
(declare-fun arrayNoDuplicates!0 (array!53419 (_ BitVec 32) List!17982) Bool)

(assert (=> b!906519 (= res!611464 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17979))))

(declare-fun mapIsEmpty!29713 () Bool)

(declare-fun mapRes!29713 () Bool)

(assert (=> mapIsEmpty!29713 mapRes!29713))

(declare-fun b!906520 () Bool)

(declare-fun e!508065 () Bool)

(assert (=> b!906520 (= e!508069 (not e!508065))))

(declare-fun res!611466 () Bool)

(assert (=> b!906520 (=> res!611466 e!508065)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!906520 (= res!611466 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26124 _keys!1386))))))

(declare-fun lt!408982 () V!29855)

(declare-fun get!13495 (ValueCell!8852 V!29855) V!29855)

(declare-fun dynLambda!1347 (Int (_ BitVec 64)) V!29855)

(assert (=> b!906520 (= lt!408982 (get!13495 (select (arr!25663 _values!1152) i!717) (dynLambda!1347 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906520 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30722 0))(
  ( (Unit!30723) )
))
(declare-fun lt!408980 () Unit!30722)

(declare-fun lemmaKeyInListMapIsInArray!206 (array!53419 array!53417 (_ BitVec 32) (_ BitVec 32) V!29855 V!29855 (_ BitVec 64) Int) Unit!30722)

(assert (=> b!906520 (= lt!408980 (lemmaKeyInListMapIsInArray!206 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906521 () Bool)

(declare-fun res!611467 () Bool)

(assert (=> b!906521 (=> (not res!611467) (not e!508066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53419 (_ BitVec 32)) Bool)

(assert (=> b!906521 (= res!611467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906522 () Bool)

(declare-fun res!611470 () Bool)

(declare-fun e!508067 () Bool)

(assert (=> b!906522 (=> res!611470 e!508067)))

(declare-fun lt!408978 () ListLongMap!10837)

(declare-fun apply!457 (ListLongMap!10837 (_ BitVec 64)) V!29855)

(assert (=> b!906522 (= res!611470 (not (= (apply!457 lt!408978 k0!1033) lt!408982)))))

(declare-fun b!906523 () Bool)

(declare-fun res!611469 () Bool)

(assert (=> b!906523 (=> (not res!611469) (not e!508066))))

(assert (=> b!906523 (= res!611469 (and (= (size!26123 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26124 _keys!1386) (size!26123 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906524 () Bool)

(declare-fun res!611465 () Bool)

(assert (=> b!906524 (=> (not res!611465) (not e!508069))))

(assert (=> b!906524 (= res!611465 (and (= (select (arr!25664 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906526 () Bool)

(assert (=> b!906526 (= e!508065 e!508067)))

(declare-fun res!611471 () Bool)

(assert (=> b!906526 (=> res!611471 e!508067)))

(assert (=> b!906526 (= res!611471 (not (contains!4489 lt!408978 k0!1033)))))

(assert (=> b!906526 (= lt!408978 (getCurrentListMap!2700 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906525 () Bool)

(assert (=> b!906525 (= e!508067 true)))

(assert (=> b!906525 (= (apply!457 lt!408979 k0!1033) lt!408982)))

(declare-fun lt!408981 () Unit!30722)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!13 (array!53419 array!53417 (_ BitVec 32) (_ BitVec 32) V!29855 V!29855 (_ BitVec 64) V!29855 (_ BitVec 32) Int) Unit!30722)

(assert (=> b!906525 (= lt!408981 (lemmaListMapApplyFromThenApplyFromZero!13 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408982 i!717 defaultEntry!1160))))

(declare-fun res!611468 () Bool)

(assert (=> start!77832 (=> (not res!611468) (not e!508066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77832 (= res!611468 (validMask!0 mask!1756))))

(assert (=> start!77832 e!508066))

(declare-fun e!508070 () Bool)

(declare-fun array_inv!20162 (array!53417) Bool)

(assert (=> start!77832 (and (array_inv!20162 _values!1152) e!508070)))

(assert (=> start!77832 tp!57009))

(assert (=> start!77832 true))

(declare-fun tp_is_empty!18667 () Bool)

(assert (=> start!77832 tp_is_empty!18667))

(declare-fun array_inv!20163 (array!53419) Bool)

(assert (=> start!77832 (array_inv!20163 _keys!1386)))

(declare-fun b!906527 () Bool)

(declare-fun e!508068 () Bool)

(assert (=> b!906527 (= e!508068 tp_is_empty!18667)))

(declare-fun b!906528 () Bool)

(declare-fun res!611473 () Bool)

(assert (=> b!906528 (=> (not res!611473) (not e!508069))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906528 (= res!611473 (inRange!0 i!717 mask!1756))))

(declare-fun b!906529 () Bool)

(declare-fun e!508071 () Bool)

(assert (=> b!906529 (= e!508070 (and e!508071 mapRes!29713))))

(declare-fun condMapEmpty!29713 () Bool)

(declare-fun mapDefault!29713 () ValueCell!8852)

(assert (=> b!906529 (= condMapEmpty!29713 (= (arr!25663 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8852)) mapDefault!29713)))))

(declare-fun mapNonEmpty!29713 () Bool)

(declare-fun tp!57010 () Bool)

(assert (=> mapNonEmpty!29713 (= mapRes!29713 (and tp!57010 e!508068))))

(declare-fun mapRest!29713 () (Array (_ BitVec 32) ValueCell!8852))

(declare-fun mapKey!29713 () (_ BitVec 32))

(declare-fun mapValue!29713 () ValueCell!8852)

(assert (=> mapNonEmpty!29713 (= (arr!25663 _values!1152) (store mapRest!29713 mapKey!29713 mapValue!29713))))

(declare-fun b!906530 () Bool)

(assert (=> b!906530 (= e!508071 tp_is_empty!18667)))

(assert (= (and start!77832 res!611468) b!906523))

(assert (= (and b!906523 res!611469) b!906521))

(assert (= (and b!906521 res!611467) b!906519))

(assert (= (and b!906519 res!611464) b!906518))

(assert (= (and b!906518 res!611472) b!906528))

(assert (= (and b!906528 res!611473) b!906524))

(assert (= (and b!906524 res!611465) b!906520))

(assert (= (and b!906520 (not res!611466)) b!906526))

(assert (= (and b!906526 (not res!611471)) b!906522))

(assert (= (and b!906522 (not res!611470)) b!906525))

(assert (= (and b!906529 condMapEmpty!29713) mapIsEmpty!29713))

(assert (= (and b!906529 (not condMapEmpty!29713)) mapNonEmpty!29713))

(get-info :version)

(assert (= (and mapNonEmpty!29713 ((_ is ValueCellFull!8852) mapValue!29713)) b!906527))

(assert (= (and b!906529 ((_ is ValueCellFull!8852) mapDefault!29713)) b!906530))

(assert (= start!77832 b!906529))

(declare-fun b_lambda!13137 () Bool)

(assert (=> (not b_lambda!13137) (not b!906520)))

(declare-fun t!25393 () Bool)

(declare-fun tb!5263 () Bool)

(assert (=> (and start!77832 (= defaultEntry!1160 defaultEntry!1160) t!25393) tb!5263))

(declare-fun result!10329 () Bool)

(assert (=> tb!5263 (= result!10329 tp_is_empty!18667)))

(assert (=> b!906520 t!25393))

(declare-fun b_and!26663 () Bool)

(assert (= b_and!26661 (and (=> t!25393 result!10329) b_and!26663)))

(declare-fun m!842309 () Bool)

(assert (=> b!906521 m!842309))

(declare-fun m!842311 () Bool)

(assert (=> mapNonEmpty!29713 m!842311))

(declare-fun m!842313 () Bool)

(assert (=> b!906524 m!842313))

(declare-fun m!842315 () Bool)

(assert (=> b!906522 m!842315))

(declare-fun m!842317 () Bool)

(assert (=> start!77832 m!842317))

(declare-fun m!842319 () Bool)

(assert (=> start!77832 m!842319))

(declare-fun m!842321 () Bool)

(assert (=> start!77832 m!842321))

(declare-fun m!842323 () Bool)

(assert (=> b!906518 m!842323))

(declare-fun m!842325 () Bool)

(assert (=> b!906518 m!842325))

(declare-fun m!842327 () Bool)

(assert (=> b!906528 m!842327))

(declare-fun m!842329 () Bool)

(assert (=> b!906519 m!842329))

(declare-fun m!842331 () Bool)

(assert (=> b!906525 m!842331))

(declare-fun m!842333 () Bool)

(assert (=> b!906525 m!842333))

(declare-fun m!842335 () Bool)

(assert (=> b!906520 m!842335))

(declare-fun m!842337 () Bool)

(assert (=> b!906520 m!842337))

(declare-fun m!842339 () Bool)

(assert (=> b!906520 m!842339))

(declare-fun m!842341 () Bool)

(assert (=> b!906520 m!842341))

(assert (=> b!906520 m!842335))

(assert (=> b!906520 m!842339))

(declare-fun m!842343 () Bool)

(assert (=> b!906520 m!842343))

(declare-fun m!842345 () Bool)

(assert (=> b!906526 m!842345))

(declare-fun m!842347 () Bool)

(assert (=> b!906526 m!842347))

(check-sat (not b!906526) (not b!906518) (not b_lambda!13137) (not b!906520) (not b!906522) (not b!906528) (not b_next!16249) (not b!906525) (not b!906519) tp_is_empty!18667 (not mapNonEmpty!29713) b_and!26663 (not b!906521) (not start!77832))
(check-sat b_and!26663 (not b_next!16249))
