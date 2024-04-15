; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77816 () Bool)

(assert start!77816)

(declare-fun b_free!16393 () Bool)

(declare-fun b_next!16393 () Bool)

(assert (=> start!77816 (= b_free!16393 (not b_next!16393))))

(declare-fun tp!57444 () Bool)

(declare-fun b_and!26917 () Bool)

(assert (=> start!77816 (= tp!57444 b_and!26917)))

(declare-fun b!908480 () Bool)

(declare-fun e!509168 () Bool)

(declare-fun e!509165 () Bool)

(assert (=> b!908480 (= e!509168 e!509165)))

(declare-fun res!613235 () Bool)

(assert (=> b!908480 (=> (not res!613235) (not e!509165))))

(declare-datatypes ((V!30047 0))(
  ( (V!30048 (val!9456 Int)) )
))
(declare-datatypes ((tuple2!12354 0))(
  ( (tuple2!12355 (_1!6188 (_ BitVec 64)) (_2!6188 V!30047)) )
))
(declare-datatypes ((List!18134 0))(
  ( (Nil!18131) (Cons!18130 (h!19276 tuple2!12354) (t!25690 List!18134)) )
))
(declare-datatypes ((ListLongMap!11041 0))(
  ( (ListLongMap!11042 (toList!5536 List!18134)) )
))
(declare-fun lt!409581 () ListLongMap!11041)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4535 (ListLongMap!11041 (_ BitVec 64)) Bool)

(assert (=> b!908480 (= res!613235 (contains!4535 lt!409581 k0!1033))))

(declare-datatypes ((ValueCell!8924 0))(
  ( (ValueCellFull!8924 (v!11962 V!30047)) (EmptyCell!8924) )
))
(declare-datatypes ((array!53635 0))(
  ( (array!53636 (arr!25776 (Array (_ BitVec 32) ValueCell!8924)) (size!26237 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53635)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30047)

(declare-datatypes ((array!53637 0))(
  ( (array!53638 (arr!25777 (Array (_ BitVec 32) (_ BitVec 64))) (size!26238 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53637)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30047)

(declare-fun getCurrentListMap!2738 (array!53637 array!53635 (_ BitVec 32) (_ BitVec 32) V!30047 V!30047 (_ BitVec 32) Int) ListLongMap!11041)

(assert (=> b!908480 (= lt!409581 (getCurrentListMap!2738 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908481 () Bool)

(declare-fun res!613241 () Bool)

(assert (=> b!908481 (=> (not res!613241) (not e!509165))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!908481 (= res!613241 (and (= (select (arr!25777 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908483 () Bool)

(declare-fun res!613240 () Bool)

(declare-fun e!509170 () Bool)

(assert (=> b!908483 (=> res!613240 e!509170)))

(declare-fun lt!409583 () ListLongMap!11041)

(declare-fun lt!409584 () V!30047)

(declare-fun apply!508 (ListLongMap!11041 (_ BitVec 64)) V!30047)

(assert (=> b!908483 (= res!613240 (not (= (apply!508 lt!409583 k0!1033) lt!409584)))))

(declare-fun b!908484 () Bool)

(declare-fun e!509167 () Bool)

(declare-fun e!509169 () Bool)

(declare-fun mapRes!29932 () Bool)

(assert (=> b!908484 (= e!509167 (and e!509169 mapRes!29932))))

(declare-fun condMapEmpty!29932 () Bool)

(declare-fun mapDefault!29932 () ValueCell!8924)

(assert (=> b!908484 (= condMapEmpty!29932 (= (arr!25776 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8924)) mapDefault!29932)))))

(declare-fun b!908485 () Bool)

(declare-fun res!613234 () Bool)

(assert (=> b!908485 (=> (not res!613234) (not e!509168))))

(assert (=> b!908485 (= res!613234 (and (= (size!26237 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26238 _keys!1386) (size!26237 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908486 () Bool)

(declare-fun tp_is_empty!18811 () Bool)

(assert (=> b!908486 (= e!509169 tp_is_empty!18811)))

(declare-fun mapIsEmpty!29932 () Bool)

(assert (=> mapIsEmpty!29932 mapRes!29932))

(declare-fun b!908487 () Bool)

(declare-fun res!613236 () Bool)

(assert (=> b!908487 (=> (not res!613236) (not e!509168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53637 (_ BitVec 32)) Bool)

(assert (=> b!908487 (= res!613236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908488 () Bool)

(declare-fun res!613243 () Bool)

(assert (=> b!908488 (=> (not res!613243) (not e!509168))))

(declare-datatypes ((List!18135 0))(
  ( (Nil!18132) (Cons!18131 (h!19277 (_ BitVec 64)) (t!25691 List!18135)) )
))
(declare-fun arrayNoDuplicates!0 (array!53637 (_ BitVec 32) List!18135) Bool)

(assert (=> b!908488 (= res!613243 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18132))))

(declare-fun mapNonEmpty!29932 () Bool)

(declare-fun tp!57445 () Bool)

(declare-fun e!509171 () Bool)

(assert (=> mapNonEmpty!29932 (= mapRes!29932 (and tp!57445 e!509171))))

(declare-fun mapValue!29932 () ValueCell!8924)

(declare-fun mapKey!29932 () (_ BitVec 32))

(declare-fun mapRest!29932 () (Array (_ BitVec 32) ValueCell!8924))

(assert (=> mapNonEmpty!29932 (= (arr!25776 _values!1152) (store mapRest!29932 mapKey!29932 mapValue!29932))))

(declare-fun res!613239 () Bool)

(assert (=> start!77816 (=> (not res!613239) (not e!509168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77816 (= res!613239 (validMask!0 mask!1756))))

(assert (=> start!77816 e!509168))

(declare-fun array_inv!20220 (array!53635) Bool)

(assert (=> start!77816 (and (array_inv!20220 _values!1152) e!509167)))

(assert (=> start!77816 tp!57444))

(assert (=> start!77816 true))

(assert (=> start!77816 tp_is_empty!18811))

(declare-fun array_inv!20221 (array!53637) Bool)

(assert (=> start!77816 (array_inv!20221 _keys!1386)))

(declare-fun b!908482 () Bool)

(assert (=> b!908482 (= e!509171 tp_is_empty!18811)))

(declare-fun b!908489 () Bool)

(assert (=> b!908489 (= e!509170 true)))

(assert (=> b!908489 (= (apply!508 lt!409581 k0!1033) lt!409584)))

(declare-datatypes ((Unit!30770 0))(
  ( (Unit!30771) )
))
(declare-fun lt!409582 () Unit!30770)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!63 (array!53637 array!53635 (_ BitVec 32) (_ BitVec 32) V!30047 V!30047 (_ BitVec 64) V!30047 (_ BitVec 32) Int) Unit!30770)

(assert (=> b!908489 (= lt!409582 (lemmaListMapApplyFromThenApplyFromZero!63 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409584 i!717 defaultEntry!1160))))

(declare-fun b!908490 () Bool)

(declare-fun res!613242 () Bool)

(assert (=> b!908490 (=> (not res!613242) (not e!509165))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908490 (= res!613242 (inRange!0 i!717 mask!1756))))

(declare-fun b!908491 () Bool)

(declare-fun e!509164 () Bool)

(assert (=> b!908491 (= e!509165 (not e!509164))))

(declare-fun res!613237 () Bool)

(assert (=> b!908491 (=> res!613237 e!509164)))

(assert (=> b!908491 (= res!613237 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26238 _keys!1386))))))

(declare-fun get!13573 (ValueCell!8924 V!30047) V!30047)

(declare-fun dynLambda!1373 (Int (_ BitVec 64)) V!30047)

(assert (=> b!908491 (= lt!409584 (get!13573 (select (arr!25776 _values!1152) i!717) (dynLambda!1373 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908491 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409580 () Unit!30770)

(declare-fun lemmaKeyInListMapIsInArray!249 (array!53637 array!53635 (_ BitVec 32) (_ BitVec 32) V!30047 V!30047 (_ BitVec 64) Int) Unit!30770)

(assert (=> b!908491 (= lt!409580 (lemmaKeyInListMapIsInArray!249 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908492 () Bool)

(assert (=> b!908492 (= e!509164 e!509170)))

(declare-fun res!613238 () Bool)

(assert (=> b!908492 (=> res!613238 e!509170)))

(assert (=> b!908492 (= res!613238 (not (contains!4535 lt!409583 k0!1033)))))

(assert (=> b!908492 (= lt!409583 (getCurrentListMap!2738 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77816 res!613239) b!908485))

(assert (= (and b!908485 res!613234) b!908487))

(assert (= (and b!908487 res!613236) b!908488))

(assert (= (and b!908488 res!613243) b!908480))

(assert (= (and b!908480 res!613235) b!908490))

(assert (= (and b!908490 res!613242) b!908481))

(assert (= (and b!908481 res!613241) b!908491))

(assert (= (and b!908491 (not res!613237)) b!908492))

(assert (= (and b!908492 (not res!613238)) b!908483))

(assert (= (and b!908483 (not res!613240)) b!908489))

(assert (= (and b!908484 condMapEmpty!29932) mapIsEmpty!29932))

(assert (= (and b!908484 (not condMapEmpty!29932)) mapNonEmpty!29932))

(get-info :version)

(assert (= (and mapNonEmpty!29932 ((_ is ValueCellFull!8924) mapValue!29932)) b!908482))

(assert (= (and b!908484 ((_ is ValueCellFull!8924) mapDefault!29932)) b!908486))

(assert (= start!77816 b!908484))

(declare-fun b_lambda!13259 () Bool)

(assert (=> (not b_lambda!13259) (not b!908491)))

(declare-fun t!25689 () Bool)

(declare-fun tb!5407 () Bool)

(assert (=> (and start!77816 (= defaultEntry!1160 defaultEntry!1160) t!25689) tb!5407))

(declare-fun result!10619 () Bool)

(assert (=> tb!5407 (= result!10619 tp_is_empty!18811)))

(assert (=> b!908491 t!25689))

(declare-fun b_and!26919 () Bool)

(assert (= b_and!26917 (and (=> t!25689 result!10619) b_and!26919)))

(declare-fun m!843291 () Bool)

(assert (=> b!908491 m!843291))

(declare-fun m!843293 () Bool)

(assert (=> b!908491 m!843293))

(declare-fun m!843295 () Bool)

(assert (=> b!908491 m!843295))

(declare-fun m!843297 () Bool)

(assert (=> b!908491 m!843297))

(assert (=> b!908491 m!843291))

(assert (=> b!908491 m!843295))

(declare-fun m!843299 () Bool)

(assert (=> b!908491 m!843299))

(declare-fun m!843301 () Bool)

(assert (=> b!908490 m!843301))

(declare-fun m!843303 () Bool)

(assert (=> start!77816 m!843303))

(declare-fun m!843305 () Bool)

(assert (=> start!77816 m!843305))

(declare-fun m!843307 () Bool)

(assert (=> start!77816 m!843307))

(declare-fun m!843309 () Bool)

(assert (=> b!908492 m!843309))

(declare-fun m!843311 () Bool)

(assert (=> b!908492 m!843311))

(declare-fun m!843313 () Bool)

(assert (=> b!908483 m!843313))

(declare-fun m!843315 () Bool)

(assert (=> mapNonEmpty!29932 m!843315))

(declare-fun m!843317 () Bool)

(assert (=> b!908480 m!843317))

(declare-fun m!843319 () Bool)

(assert (=> b!908480 m!843319))

(declare-fun m!843321 () Bool)

(assert (=> b!908489 m!843321))

(declare-fun m!843323 () Bool)

(assert (=> b!908489 m!843323))

(declare-fun m!843325 () Bool)

(assert (=> b!908488 m!843325))

(declare-fun m!843327 () Bool)

(assert (=> b!908481 m!843327))

(declare-fun m!843329 () Bool)

(assert (=> b!908487 m!843329))

(check-sat (not b_next!16393) (not start!77816) (not b!908491) (not b!908487) (not b!908489) (not mapNonEmpty!29932) (not b_lambda!13259) (not b!908488) b_and!26919 (not b!908490) (not b!908492) (not b!908480) (not b!908483) tp_is_empty!18811)
(check-sat b_and!26919 (not b_next!16393))
