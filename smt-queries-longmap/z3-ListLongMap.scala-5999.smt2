; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77848 () Bool)

(assert start!77848)

(declare-fun b_free!16407 () Bool)

(declare-fun b_next!16407 () Bool)

(assert (=> start!77848 (= b_free!16407 (not b_next!16407))))

(declare-fun tp!57485 () Bool)

(declare-fun b_and!26971 () Bool)

(assert (=> start!77848 (= tp!57485 b_and!26971)))

(declare-fun b!909006 () Bool)

(declare-fun e!509486 () Bool)

(declare-fun tp_is_empty!18825 () Bool)

(assert (=> b!909006 (= e!509486 tp_is_empty!18825)))

(declare-fun b!909007 () Bool)

(declare-fun e!509485 () Bool)

(assert (=> b!909007 (= e!509485 true)))

(declare-datatypes ((V!30065 0))(
  ( (V!30066 (val!9463 Int)) )
))
(declare-datatypes ((tuple2!12332 0))(
  ( (tuple2!12333 (_1!6177 (_ BitVec 64)) (_2!6177 V!30065)) )
))
(declare-datatypes ((List!18125 0))(
  ( (Nil!18122) (Cons!18121 (h!19267 tuple2!12332) (t!25704 List!18125)) )
))
(declare-datatypes ((ListLongMap!11029 0))(
  ( (ListLongMap!11030 (toList!5530 List!18125)) )
))
(declare-fun lt!409924 () ListLongMap!11029)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!409923 () V!30065)

(declare-fun apply!510 (ListLongMap!11029 (_ BitVec 64)) V!30065)

(assert (=> b!909007 (= (apply!510 lt!409924 k0!1033) lt!409923)))

(declare-datatypes ((ValueCell!8931 0))(
  ( (ValueCellFull!8931 (v!11970 V!30065)) (EmptyCell!8931) )
))
(declare-datatypes ((array!53678 0))(
  ( (array!53679 (arr!25797 (Array (_ BitVec 32) ValueCell!8931)) (size!26256 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53678)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30065)

(declare-datatypes ((array!53680 0))(
  ( (array!53681 (arr!25798 (Array (_ BitVec 32) (_ BitVec 64))) (size!26257 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53680)

(declare-datatypes ((Unit!30852 0))(
  ( (Unit!30853) )
))
(declare-fun lt!409925 () Unit!30852)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30065)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!61 (array!53680 array!53678 (_ BitVec 32) (_ BitVec 32) V!30065 V!30065 (_ BitVec 64) V!30065 (_ BitVec 32) Int) Unit!30852)

(assert (=> b!909007 (= lt!409925 (lemmaListMapApplyFromThenApplyFromZero!61 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409923 i!717 defaultEntry!1160))))

(declare-fun b!909008 () Bool)

(declare-fun res!613557 () Bool)

(assert (=> b!909008 (=> res!613557 e!509485)))

(declare-fun lt!409922 () ListLongMap!11029)

(assert (=> b!909008 (= res!613557 (not (= (apply!510 lt!409922 k0!1033) lt!409923)))))

(declare-fun b!909009 () Bool)

(declare-fun e!509480 () Bool)

(assert (=> b!909009 (= e!509480 e!509485)))

(declare-fun res!613556 () Bool)

(assert (=> b!909009 (=> res!613556 e!509485)))

(declare-fun contains!4572 (ListLongMap!11029 (_ BitVec 64)) Bool)

(assert (=> b!909009 (= res!613556 (not (contains!4572 lt!409922 k0!1033)))))

(declare-fun getCurrentListMap!2792 (array!53680 array!53678 (_ BitVec 32) (_ BitVec 32) V!30065 V!30065 (_ BitVec 32) Int) ListLongMap!11029)

(assert (=> b!909009 (= lt!409922 (getCurrentListMap!2792 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29953 () Bool)

(declare-fun mapRes!29953 () Bool)

(assert (=> mapIsEmpty!29953 mapRes!29953))

(declare-fun b!909010 () Bool)

(declare-fun res!613562 () Bool)

(declare-fun e!509481 () Bool)

(assert (=> b!909010 (=> (not res!613562) (not e!509481))))

(declare-datatypes ((List!18126 0))(
  ( (Nil!18123) (Cons!18122 (h!19268 (_ BitVec 64)) (t!25705 List!18126)) )
))
(declare-fun arrayNoDuplicates!0 (array!53680 (_ BitVec 32) List!18126) Bool)

(assert (=> b!909010 (= res!613562 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18123))))

(declare-fun res!613561 () Bool)

(assert (=> start!77848 (=> (not res!613561) (not e!509481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77848 (= res!613561 (validMask!0 mask!1756))))

(assert (=> start!77848 e!509481))

(declare-fun e!509484 () Bool)

(declare-fun array_inv!20192 (array!53678) Bool)

(assert (=> start!77848 (and (array_inv!20192 _values!1152) e!509484)))

(assert (=> start!77848 tp!57485))

(assert (=> start!77848 true))

(assert (=> start!77848 tp_is_empty!18825))

(declare-fun array_inv!20193 (array!53680) Bool)

(assert (=> start!77848 (array_inv!20193 _keys!1386)))

(declare-fun b!909011 () Bool)

(declare-fun res!613560 () Bool)

(declare-fun e!509483 () Bool)

(assert (=> b!909011 (=> (not res!613560) (not e!509483))))

(assert (=> b!909011 (= res!613560 (and (= (select (arr!25798 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!909012 () Bool)

(declare-fun res!613554 () Bool)

(assert (=> b!909012 (=> (not res!613554) (not e!509483))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909012 (= res!613554 (inRange!0 i!717 mask!1756))))

(declare-fun b!909013 () Bool)

(declare-fun e!509487 () Bool)

(assert (=> b!909013 (= e!509487 tp_is_empty!18825)))

(declare-fun b!909014 () Bool)

(assert (=> b!909014 (= e!509481 e!509483)))

(declare-fun res!613563 () Bool)

(assert (=> b!909014 (=> (not res!613563) (not e!509483))))

(assert (=> b!909014 (= res!613563 (contains!4572 lt!409924 k0!1033))))

(assert (=> b!909014 (= lt!409924 (getCurrentListMap!2792 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!909015 () Bool)

(declare-fun res!613555 () Bool)

(assert (=> b!909015 (=> (not res!613555) (not e!509481))))

(assert (=> b!909015 (= res!613555 (and (= (size!26256 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26257 _keys!1386) (size!26256 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29953 () Bool)

(declare-fun tp!57486 () Bool)

(assert (=> mapNonEmpty!29953 (= mapRes!29953 (and tp!57486 e!509487))))

(declare-fun mapKey!29953 () (_ BitVec 32))

(declare-fun mapValue!29953 () ValueCell!8931)

(declare-fun mapRest!29953 () (Array (_ BitVec 32) ValueCell!8931))

(assert (=> mapNonEmpty!29953 (= (arr!25797 _values!1152) (store mapRest!29953 mapKey!29953 mapValue!29953))))

(declare-fun b!909016 () Bool)

(assert (=> b!909016 (= e!509484 (and e!509486 mapRes!29953))))

(declare-fun condMapEmpty!29953 () Bool)

(declare-fun mapDefault!29953 () ValueCell!8931)

(assert (=> b!909016 (= condMapEmpty!29953 (= (arr!25797 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8931)) mapDefault!29953)))))

(declare-fun b!909017 () Bool)

(declare-fun res!613559 () Bool)

(assert (=> b!909017 (=> (not res!613559) (not e!509481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53680 (_ BitVec 32)) Bool)

(assert (=> b!909017 (= res!613559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909018 () Bool)

(assert (=> b!909018 (= e!509483 (not e!509480))))

(declare-fun res!613558 () Bool)

(assert (=> b!909018 (=> res!613558 e!509480)))

(assert (=> b!909018 (= res!613558 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26257 _keys!1386))))))

(declare-fun get!13585 (ValueCell!8931 V!30065) V!30065)

(declare-fun dynLambda!1386 (Int (_ BitVec 64)) V!30065)

(assert (=> b!909018 (= lt!409923 (get!13585 (select (arr!25797 _values!1152) i!717) (dynLambda!1386 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909018 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409921 () Unit!30852)

(declare-fun lemmaKeyInListMapIsInArray!258 (array!53680 array!53678 (_ BitVec 32) (_ BitVec 32) V!30065 V!30065 (_ BitVec 64) Int) Unit!30852)

(assert (=> b!909018 (= lt!409921 (lemmaKeyInListMapIsInArray!258 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(assert (= (and start!77848 res!613561) b!909015))

(assert (= (and b!909015 res!613555) b!909017))

(assert (= (and b!909017 res!613559) b!909010))

(assert (= (and b!909010 res!613562) b!909014))

(assert (= (and b!909014 res!613563) b!909012))

(assert (= (and b!909012 res!613554) b!909011))

(assert (= (and b!909011 res!613560) b!909018))

(assert (= (and b!909018 (not res!613558)) b!909009))

(assert (= (and b!909009 (not res!613556)) b!909008))

(assert (= (and b!909008 (not res!613557)) b!909007))

(assert (= (and b!909016 condMapEmpty!29953) mapIsEmpty!29953))

(assert (= (and b!909016 (not condMapEmpty!29953)) mapNonEmpty!29953))

(get-info :version)

(assert (= (and mapNonEmpty!29953 ((_ is ValueCellFull!8931) mapValue!29953)) b!909013))

(assert (= (and b!909016 ((_ is ValueCellFull!8931) mapDefault!29953)) b!909006))

(assert (= start!77848 b!909016))

(declare-fun b_lambda!13291 () Bool)

(assert (=> (not b_lambda!13291) (not b!909018)))

(declare-fun t!25703 () Bool)

(declare-fun tb!5429 () Bool)

(assert (=> (and start!77848 (= defaultEntry!1160 defaultEntry!1160) t!25703) tb!5429))

(declare-fun result!10655 () Bool)

(assert (=> tb!5429 (= result!10655 tp_is_empty!18825)))

(assert (=> b!909018 t!25703))

(declare-fun b_and!26973 () Bool)

(assert (= b_and!26971 (and (=> t!25703 result!10655) b_and!26973)))

(declare-fun m!844329 () Bool)

(assert (=> b!909009 m!844329))

(declare-fun m!844331 () Bool)

(assert (=> b!909009 m!844331))

(declare-fun m!844333 () Bool)

(assert (=> start!77848 m!844333))

(declare-fun m!844335 () Bool)

(assert (=> start!77848 m!844335))

(declare-fun m!844337 () Bool)

(assert (=> start!77848 m!844337))

(declare-fun m!844339 () Bool)

(assert (=> b!909011 m!844339))

(declare-fun m!844341 () Bool)

(assert (=> b!909007 m!844341))

(declare-fun m!844343 () Bool)

(assert (=> b!909007 m!844343))

(declare-fun m!844345 () Bool)

(assert (=> b!909018 m!844345))

(declare-fun m!844347 () Bool)

(assert (=> b!909018 m!844347))

(declare-fun m!844349 () Bool)

(assert (=> b!909018 m!844349))

(declare-fun m!844351 () Bool)

(assert (=> b!909018 m!844351))

(assert (=> b!909018 m!844345))

(assert (=> b!909018 m!844349))

(declare-fun m!844353 () Bool)

(assert (=> b!909018 m!844353))

(declare-fun m!844355 () Bool)

(assert (=> b!909014 m!844355))

(declare-fun m!844357 () Bool)

(assert (=> b!909014 m!844357))

(declare-fun m!844359 () Bool)

(assert (=> b!909008 m!844359))

(declare-fun m!844361 () Bool)

(assert (=> b!909012 m!844361))

(declare-fun m!844363 () Bool)

(assert (=> b!909017 m!844363))

(declare-fun m!844365 () Bool)

(assert (=> mapNonEmpty!29953 m!844365))

(declare-fun m!844367 () Bool)

(assert (=> b!909010 m!844367))

(check-sat (not b_lambda!13291) (not b!909009) (not b!909014) (not b!909017) (not b!909007) (not start!77848) (not b!909012) b_and!26973 (not b!909010) (not b!909008) (not mapNonEmpty!29953) (not b_next!16407) (not b!909018) tp_is_empty!18825)
(check-sat b_and!26973 (not b_next!16407))
