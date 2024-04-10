; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77818 () Bool)

(assert start!77818)

(declare-fun b_free!16377 () Bool)

(declare-fun b_next!16377 () Bool)

(assert (=> start!77818 (= b_free!16377 (not b_next!16377))))

(declare-fun tp!57396 () Bool)

(declare-fun b_and!26911 () Bool)

(assert (=> start!77818 (= tp!57396 b_and!26911)))

(declare-fun mapNonEmpty!29908 () Bool)

(declare-fun mapRes!29908 () Bool)

(declare-fun tp!57395 () Bool)

(declare-fun e!509127 () Bool)

(assert (=> mapNonEmpty!29908 (= mapRes!29908 (and tp!57395 e!509127))))

(declare-datatypes ((V!30025 0))(
  ( (V!30026 (val!9448 Int)) )
))
(declare-datatypes ((ValueCell!8916 0))(
  ( (ValueCellFull!8916 (v!11955 V!30025)) (EmptyCell!8916) )
))
(declare-fun mapValue!29908 () ValueCell!8916)

(declare-fun mapRest!29908 () (Array (_ BitVec 32) ValueCell!8916))

(declare-fun mapKey!29908 () (_ BitVec 32))

(declare-datatypes ((array!53624 0))(
  ( (array!53625 (arr!25770 (Array (_ BitVec 32) ValueCell!8916)) (size!26229 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53624)

(assert (=> mapNonEmpty!29908 (= (arr!25770 _values!1152) (store mapRest!29908 mapKey!29908 mapValue!29908))))

(declare-fun b!908391 () Bool)

(declare-fun res!613110 () Bool)

(declare-fun e!509126 () Bool)

(assert (=> b!908391 (=> (not res!613110) (not e!509126))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53626 0))(
  ( (array!53627 (arr!25771 (Array (_ BitVec 32) (_ BitVec 64))) (size!26230 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53626)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!908391 (= res!613110 (and (= (select (arr!25771 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!908392 () Bool)

(declare-fun e!509123 () Bool)

(declare-fun e!509120 () Bool)

(assert (=> b!908392 (= e!509123 (and e!509120 mapRes!29908))))

(declare-fun condMapEmpty!29908 () Bool)

(declare-fun mapDefault!29908 () ValueCell!8916)

(assert (=> b!908392 (= condMapEmpty!29908 (= (arr!25770 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8916)) mapDefault!29908)))))

(declare-fun b!908393 () Bool)

(declare-fun res!613106 () Bool)

(declare-fun e!509121 () Bool)

(assert (=> b!908393 (=> (not res!613106) (not e!509121))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53626 (_ BitVec 32)) Bool)

(assert (=> b!908393 (= res!613106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908394 () Bool)

(declare-fun res!613107 () Bool)

(assert (=> b!908394 (=> (not res!613107) (not e!509121))))

(declare-datatypes ((List!18107 0))(
  ( (Nil!18104) (Cons!18103 (h!19249 (_ BitVec 64)) (t!25656 List!18107)) )
))
(declare-fun arrayNoDuplicates!0 (array!53626 (_ BitVec 32) List!18107) Bool)

(assert (=> b!908394 (= res!613107 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18104))))

(declare-fun res!613105 () Bool)

(assert (=> start!77818 (=> (not res!613105) (not e!509121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77818 (= res!613105 (validMask!0 mask!1756))))

(assert (=> start!77818 e!509121))

(declare-fun array_inv!20178 (array!53624) Bool)

(assert (=> start!77818 (and (array_inv!20178 _values!1152) e!509123)))

(assert (=> start!77818 tp!57396))

(assert (=> start!77818 true))

(declare-fun tp_is_empty!18795 () Bool)

(assert (=> start!77818 tp_is_empty!18795))

(declare-fun array_inv!20179 (array!53626) Bool)

(assert (=> start!77818 (array_inv!20179 _keys!1386)))

(declare-fun b!908395 () Bool)

(assert (=> b!908395 (= e!509127 tp_is_empty!18795)))

(declare-fun mapIsEmpty!29908 () Bool)

(assert (=> mapIsEmpty!29908 mapRes!29908))

(declare-fun b!908396 () Bool)

(declare-fun res!613108 () Bool)

(declare-fun e!509122 () Bool)

(assert (=> b!908396 (=> res!613108 e!509122)))

(declare-datatypes ((tuple2!12310 0))(
  ( (tuple2!12311 (_1!6166 (_ BitVec 64)) (_2!6166 V!30025)) )
))
(declare-datatypes ((List!18108 0))(
  ( (Nil!18105) (Cons!18104 (h!19250 tuple2!12310) (t!25657 List!18108)) )
))
(declare-datatypes ((ListLongMap!11007 0))(
  ( (ListLongMap!11008 (toList!5519 List!18108)) )
))
(declare-fun lt!409696 () ListLongMap!11007)

(declare-fun lt!409699 () V!30025)

(declare-fun apply!501 (ListLongMap!11007 (_ BitVec 64)) V!30025)

(assert (=> b!908396 (= res!613108 (not (= (apply!501 lt!409696 k0!1033) lt!409699)))))

(declare-fun b!908397 () Bool)

(assert (=> b!908397 (= e!509121 e!509126)))

(declare-fun res!613112 () Bool)

(assert (=> b!908397 (=> (not res!613112) (not e!509126))))

(declare-fun lt!409700 () ListLongMap!11007)

(declare-fun contains!4562 (ListLongMap!11007 (_ BitVec 64)) Bool)

(assert (=> b!908397 (= res!613112 (contains!4562 lt!409700 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30025)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30025)

(declare-fun getCurrentListMap!2782 (array!53626 array!53624 (_ BitVec 32) (_ BitVec 32) V!30025 V!30025 (_ BitVec 32) Int) ListLongMap!11007)

(assert (=> b!908397 (= lt!409700 (getCurrentListMap!2782 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908398 () Bool)

(declare-fun e!509125 () Bool)

(assert (=> b!908398 (= e!509126 (not e!509125))))

(declare-fun res!613109 () Bool)

(assert (=> b!908398 (=> res!613109 e!509125)))

(assert (=> b!908398 (= res!613109 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26230 _keys!1386))))))

(declare-fun get!13566 (ValueCell!8916 V!30025) V!30025)

(declare-fun dynLambda!1377 (Int (_ BitVec 64)) V!30025)

(assert (=> b!908398 (= lt!409699 (get!13566 (select (arr!25770 _values!1152) i!717) (dynLambda!1377 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908398 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30832 0))(
  ( (Unit!30833) )
))
(declare-fun lt!409697 () Unit!30832)

(declare-fun lemmaKeyInListMapIsInArray!249 (array!53626 array!53624 (_ BitVec 32) (_ BitVec 32) V!30025 V!30025 (_ BitVec 64) Int) Unit!30832)

(assert (=> b!908398 (= lt!409697 (lemmaKeyInListMapIsInArray!249 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908399 () Bool)

(assert (=> b!908399 (= e!509122 true)))

(assert (=> b!908399 (= (apply!501 lt!409700 k0!1033) lt!409699)))

(declare-fun lt!409698 () Unit!30832)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!53 (array!53626 array!53624 (_ BitVec 32) (_ BitVec 32) V!30025 V!30025 (_ BitVec 64) V!30025 (_ BitVec 32) Int) Unit!30832)

(assert (=> b!908399 (= lt!409698 (lemmaListMapApplyFromThenApplyFromZero!53 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409699 i!717 defaultEntry!1160))))

(declare-fun b!908400 () Bool)

(declare-fun res!613113 () Bool)

(assert (=> b!908400 (=> (not res!613113) (not e!509126))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908400 (= res!613113 (inRange!0 i!717 mask!1756))))

(declare-fun b!908401 () Bool)

(declare-fun res!613111 () Bool)

(assert (=> b!908401 (=> (not res!613111) (not e!509121))))

(assert (=> b!908401 (= res!613111 (and (= (size!26229 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26230 _keys!1386) (size!26229 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908402 () Bool)

(assert (=> b!908402 (= e!509120 tp_is_empty!18795)))

(declare-fun b!908403 () Bool)

(assert (=> b!908403 (= e!509125 e!509122)))

(declare-fun res!613104 () Bool)

(assert (=> b!908403 (=> res!613104 e!509122)))

(assert (=> b!908403 (= res!613104 (not (contains!4562 lt!409696 k0!1033)))))

(assert (=> b!908403 (= lt!409696 (getCurrentListMap!2782 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(assert (= (and start!77818 res!613105) b!908401))

(assert (= (and b!908401 res!613111) b!908393))

(assert (= (and b!908393 res!613106) b!908394))

(assert (= (and b!908394 res!613107) b!908397))

(assert (= (and b!908397 res!613112) b!908400))

(assert (= (and b!908400 res!613113) b!908391))

(assert (= (and b!908391 res!613110) b!908398))

(assert (= (and b!908398 (not res!613109)) b!908403))

(assert (= (and b!908403 (not res!613104)) b!908396))

(assert (= (and b!908396 (not res!613108)) b!908399))

(assert (= (and b!908392 condMapEmpty!29908) mapIsEmpty!29908))

(assert (= (and b!908392 (not condMapEmpty!29908)) mapNonEmpty!29908))

(get-info :version)

(assert (= (and mapNonEmpty!29908 ((_ is ValueCellFull!8916) mapValue!29908)) b!908395))

(assert (= (and b!908392 ((_ is ValueCellFull!8916) mapDefault!29908)) b!908402))

(assert (= start!77818 b!908392))

(declare-fun b_lambda!13261 () Bool)

(assert (=> (not b_lambda!13261) (not b!908398)))

(declare-fun t!25655 () Bool)

(declare-fun tb!5399 () Bool)

(assert (=> (and start!77818 (= defaultEntry!1160 defaultEntry!1160) t!25655) tb!5399))

(declare-fun result!10595 () Bool)

(assert (=> tb!5399 (= result!10595 tp_is_empty!18795)))

(assert (=> b!908398 t!25655))

(declare-fun b_and!26913 () Bool)

(assert (= b_and!26911 (and (=> t!25655 result!10595) b_and!26913)))

(declare-fun m!843729 () Bool)

(assert (=> b!908400 m!843729))

(declare-fun m!843731 () Bool)

(assert (=> start!77818 m!843731))

(declare-fun m!843733 () Bool)

(assert (=> start!77818 m!843733))

(declare-fun m!843735 () Bool)

(assert (=> start!77818 m!843735))

(declare-fun m!843737 () Bool)

(assert (=> b!908403 m!843737))

(declare-fun m!843739 () Bool)

(assert (=> b!908403 m!843739))

(declare-fun m!843741 () Bool)

(assert (=> b!908391 m!843741))

(declare-fun m!843743 () Bool)

(assert (=> b!908396 m!843743))

(declare-fun m!843745 () Bool)

(assert (=> mapNonEmpty!29908 m!843745))

(declare-fun m!843747 () Bool)

(assert (=> b!908397 m!843747))

(declare-fun m!843749 () Bool)

(assert (=> b!908397 m!843749))

(declare-fun m!843751 () Bool)

(assert (=> b!908393 m!843751))

(declare-fun m!843753 () Bool)

(assert (=> b!908398 m!843753))

(declare-fun m!843755 () Bool)

(assert (=> b!908398 m!843755))

(declare-fun m!843757 () Bool)

(assert (=> b!908398 m!843757))

(declare-fun m!843759 () Bool)

(assert (=> b!908398 m!843759))

(assert (=> b!908398 m!843753))

(assert (=> b!908398 m!843757))

(declare-fun m!843761 () Bool)

(assert (=> b!908398 m!843761))

(declare-fun m!843763 () Bool)

(assert (=> b!908399 m!843763))

(declare-fun m!843765 () Bool)

(assert (=> b!908399 m!843765))

(declare-fun m!843767 () Bool)

(assert (=> b!908394 m!843767))

(check-sat (not b!908398) (not b!908400) tp_is_empty!18795 (not b!908396) b_and!26913 (not b!908397) (not mapNonEmpty!29908) (not start!77818) (not b!908394) (not b!908403) (not b!908399) (not b_next!16377) (not b!908393) (not b_lambda!13261))
(check-sat b_and!26913 (not b_next!16377))
