; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20500 () Bool)

(assert start!20500)

(declare-fun b_free!5155 () Bool)

(declare-fun b_next!5155 () Bool)

(assert (=> start!20500 (= b_free!5155 (not b_next!5155))))

(declare-fun tp!18496 () Bool)

(declare-fun b_and!11875 () Bool)

(assert (=> start!20500 (= tp!18496 b_and!11875)))

(declare-fun mapNonEmpty!8585 () Bool)

(declare-fun mapRes!8585 () Bool)

(declare-fun tp!18497 () Bool)

(declare-fun e!133077 () Bool)

(assert (=> mapNonEmpty!8585 (= mapRes!8585 (and tp!18497 e!133077))))

(declare-datatypes ((V!6329 0))(
  ( (V!6330 (val!2550 Int)) )
))
(declare-datatypes ((ValueCell!2162 0))(
  ( (ValueCellFull!2162 (v!4514 V!6329)) (EmptyCell!2162) )
))
(declare-fun mapValue!8585 () ValueCell!2162)

(declare-fun mapKey!8585 () (_ BitVec 32))

(declare-datatypes ((array!9231 0))(
  ( (array!9232 (arr!4365 (Array (_ BitVec 32) ValueCell!2162)) (size!4691 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9231)

(declare-fun mapRest!8585 () (Array (_ BitVec 32) ValueCell!2162))

(assert (=> mapNonEmpty!8585 (= (arr!4365 _values!649) (store mapRest!8585 mapKey!8585 mapValue!8585))))

(declare-fun res!97654 () Bool)

(declare-fun e!133076 () Bool)

(assert (=> start!20500 (=> (not res!97654) (not e!133076))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20500 (= res!97654 (validMask!0 mask!1149))))

(assert (=> start!20500 e!133076))

(declare-fun e!133078 () Bool)

(declare-fun array_inv!2861 (array!9231) Bool)

(assert (=> start!20500 (and (array_inv!2861 _values!649) e!133078)))

(assert (=> start!20500 true))

(declare-fun tp_is_empty!5011 () Bool)

(assert (=> start!20500 tp_is_empty!5011))

(declare-datatypes ((array!9233 0))(
  ( (array!9234 (arr!4366 (Array (_ BitVec 32) (_ BitVec 64))) (size!4692 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9233)

(declare-fun array_inv!2862 (array!9233) Bool)

(assert (=> start!20500 (array_inv!2862 _keys!825)))

(assert (=> start!20500 tp!18496))

(declare-fun b!203280 () Bool)

(declare-fun e!133080 () Bool)

(assert (=> b!203280 (= e!133080 true)))

(declare-datatypes ((tuple2!3844 0))(
  ( (tuple2!3845 (_1!1933 (_ BitVec 64)) (_2!1933 V!6329)) )
))
(declare-datatypes ((List!2755 0))(
  ( (Nil!2752) (Cons!2751 (h!3393 tuple2!3844) (t!7677 List!2755)) )
))
(declare-datatypes ((ListLongMap!2747 0))(
  ( (ListLongMap!2748 (toList!1389 List!2755)) )
))
(declare-fun lt!102429 () ListLongMap!2747)

(declare-fun lt!102433 () ListLongMap!2747)

(declare-fun lt!102424 () tuple2!3844)

(declare-fun +!438 (ListLongMap!2747 tuple2!3844) ListLongMap!2747)

(assert (=> b!203280 (= lt!102429 (+!438 lt!102433 lt!102424))))

(declare-datatypes ((Unit!6124 0))(
  ( (Unit!6125) )
))
(declare-fun lt!102428 () Unit!6124)

(declare-fun v!520 () V!6329)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!102431 () ListLongMap!2747)

(declare-fun zeroValue!615 () V!6329)

(declare-fun addCommutativeForDiffKeys!137 (ListLongMap!2747 (_ BitVec 64) V!6329 (_ BitVec 64) V!6329) Unit!6124)

(assert (=> b!203280 (= lt!102428 (addCommutativeForDiffKeys!137 lt!102431 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203281 () Bool)

(declare-fun res!97657 () Bool)

(assert (=> b!203281 (=> (not res!97657) (not e!133076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203281 (= res!97657 (validKeyInArray!0 k0!843))))

(declare-fun b!203282 () Bool)

(declare-fun res!97653 () Bool)

(assert (=> b!203282 (=> (not res!97653) (not e!133076))))

(declare-datatypes ((List!2756 0))(
  ( (Nil!2753) (Cons!2752 (h!3394 (_ BitVec 64)) (t!7678 List!2756)) )
))
(declare-fun arrayNoDuplicates!0 (array!9233 (_ BitVec 32) List!2756) Bool)

(assert (=> b!203282 (= res!97653 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2753))))

(declare-fun b!203283 () Bool)

(declare-fun e!133074 () Bool)

(assert (=> b!203283 (= e!133078 (and e!133074 mapRes!8585))))

(declare-fun condMapEmpty!8585 () Bool)

(declare-fun mapDefault!8585 () ValueCell!2162)

(assert (=> b!203283 (= condMapEmpty!8585 (= (arr!4365 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2162)) mapDefault!8585)))))

(declare-fun b!203284 () Bool)

(declare-fun e!133079 () Bool)

(assert (=> b!203284 (= e!133079 e!133080)))

(declare-fun res!97656 () Bool)

(assert (=> b!203284 (=> res!97656 e!133080)))

(assert (=> b!203284 (= res!97656 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102432 () ListLongMap!2747)

(assert (=> b!203284 (= lt!102432 lt!102429)))

(declare-fun lt!102423 () ListLongMap!2747)

(declare-fun lt!102427 () tuple2!3844)

(assert (=> b!203284 (= lt!102429 (+!438 lt!102423 lt!102427))))

(declare-fun lt!102430 () ListLongMap!2747)

(assert (=> b!203284 (= lt!102430 lt!102433)))

(assert (=> b!203284 (= lt!102433 (+!438 lt!102431 lt!102427))))

(declare-fun lt!102426 () ListLongMap!2747)

(assert (=> b!203284 (= lt!102432 (+!438 lt!102426 lt!102427))))

(assert (=> b!203284 (= lt!102427 (tuple2!3845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203285 () Bool)

(declare-fun res!97655 () Bool)

(assert (=> b!203285 (=> (not res!97655) (not e!133076))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203285 (= res!97655 (and (= (size!4691 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4692 _keys!825) (size!4691 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203286 () Bool)

(assert (=> b!203286 (= e!133076 (not e!133079))))

(declare-fun res!97652 () Bool)

(assert (=> b!203286 (=> res!97652 e!133079)))

(assert (=> b!203286 (= res!97652 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6329)

(declare-fun getCurrentListMap!941 (array!9233 array!9231 (_ BitVec 32) (_ BitVec 32) V!6329 V!6329 (_ BitVec 32) Int) ListLongMap!2747)

(assert (=> b!203286 (= lt!102430 (getCurrentListMap!941 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102425 () array!9231)

(assert (=> b!203286 (= lt!102432 (getCurrentListMap!941 _keys!825 lt!102425 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203286 (and (= lt!102426 lt!102423) (= lt!102423 lt!102426))))

(assert (=> b!203286 (= lt!102423 (+!438 lt!102431 lt!102424))))

(assert (=> b!203286 (= lt!102424 (tuple2!3845 k0!843 v!520))))

(declare-fun lt!102434 () Unit!6124)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!100 (array!9233 array!9231 (_ BitVec 32) (_ BitVec 32) V!6329 V!6329 (_ BitVec 32) (_ BitVec 64) V!6329 (_ BitVec 32) Int) Unit!6124)

(assert (=> b!203286 (= lt!102434 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!100 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!351 (array!9233 array!9231 (_ BitVec 32) (_ BitVec 32) V!6329 V!6329 (_ BitVec 32) Int) ListLongMap!2747)

(assert (=> b!203286 (= lt!102426 (getCurrentListMapNoExtraKeys!351 _keys!825 lt!102425 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203286 (= lt!102425 (array!9232 (store (arr!4365 _values!649) i!601 (ValueCellFull!2162 v!520)) (size!4691 _values!649)))))

(assert (=> b!203286 (= lt!102431 (getCurrentListMapNoExtraKeys!351 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8585 () Bool)

(assert (=> mapIsEmpty!8585 mapRes!8585))

(declare-fun b!203287 () Bool)

(declare-fun res!97658 () Bool)

(assert (=> b!203287 (=> (not res!97658) (not e!133076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9233 (_ BitVec 32)) Bool)

(assert (=> b!203287 (= res!97658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203288 () Bool)

(declare-fun res!97651 () Bool)

(assert (=> b!203288 (=> (not res!97651) (not e!133076))))

(assert (=> b!203288 (= res!97651 (= (select (arr!4366 _keys!825) i!601) k0!843))))

(declare-fun b!203289 () Bool)

(declare-fun res!97650 () Bool)

(assert (=> b!203289 (=> (not res!97650) (not e!133076))))

(assert (=> b!203289 (= res!97650 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4692 _keys!825))))))

(declare-fun b!203290 () Bool)

(assert (=> b!203290 (= e!133077 tp_is_empty!5011)))

(declare-fun b!203291 () Bool)

(assert (=> b!203291 (= e!133074 tp_is_empty!5011)))

(assert (= (and start!20500 res!97654) b!203285))

(assert (= (and b!203285 res!97655) b!203287))

(assert (= (and b!203287 res!97658) b!203282))

(assert (= (and b!203282 res!97653) b!203289))

(assert (= (and b!203289 res!97650) b!203281))

(assert (= (and b!203281 res!97657) b!203288))

(assert (= (and b!203288 res!97651) b!203286))

(assert (= (and b!203286 (not res!97652)) b!203284))

(assert (= (and b!203284 (not res!97656)) b!203280))

(assert (= (and b!203283 condMapEmpty!8585) mapIsEmpty!8585))

(assert (= (and b!203283 (not condMapEmpty!8585)) mapNonEmpty!8585))

(get-info :version)

(assert (= (and mapNonEmpty!8585 ((_ is ValueCellFull!2162) mapValue!8585)) b!203290))

(assert (= (and b!203283 ((_ is ValueCellFull!2162) mapDefault!8585)) b!203291))

(assert (= start!20500 b!203283))

(declare-fun m!230235 () Bool)

(assert (=> b!203288 m!230235))

(declare-fun m!230237 () Bool)

(assert (=> b!203281 m!230237))

(declare-fun m!230239 () Bool)

(assert (=> b!203286 m!230239))

(declare-fun m!230241 () Bool)

(assert (=> b!203286 m!230241))

(declare-fun m!230243 () Bool)

(assert (=> b!203286 m!230243))

(declare-fun m!230245 () Bool)

(assert (=> b!203286 m!230245))

(declare-fun m!230247 () Bool)

(assert (=> b!203286 m!230247))

(declare-fun m!230249 () Bool)

(assert (=> b!203286 m!230249))

(declare-fun m!230251 () Bool)

(assert (=> b!203286 m!230251))

(declare-fun m!230253 () Bool)

(assert (=> b!203282 m!230253))

(declare-fun m!230255 () Bool)

(assert (=> b!203280 m!230255))

(declare-fun m!230257 () Bool)

(assert (=> b!203280 m!230257))

(declare-fun m!230259 () Bool)

(assert (=> start!20500 m!230259))

(declare-fun m!230261 () Bool)

(assert (=> start!20500 m!230261))

(declare-fun m!230263 () Bool)

(assert (=> start!20500 m!230263))

(declare-fun m!230265 () Bool)

(assert (=> b!203284 m!230265))

(declare-fun m!230267 () Bool)

(assert (=> b!203284 m!230267))

(declare-fun m!230269 () Bool)

(assert (=> b!203284 m!230269))

(declare-fun m!230271 () Bool)

(assert (=> b!203287 m!230271))

(declare-fun m!230273 () Bool)

(assert (=> mapNonEmpty!8585 m!230273))

(check-sat (not b_next!5155) (not b!203281) (not b!203286) (not b!203287) (not b!203282) b_and!11875 tp_is_empty!5011 (not b!203284) (not start!20500) (not b!203280) (not mapNonEmpty!8585))
(check-sat b_and!11875 (not b_next!5155))
